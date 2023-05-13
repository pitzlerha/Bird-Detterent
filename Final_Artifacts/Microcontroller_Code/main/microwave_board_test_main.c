#include <stdio.h>
#include <math.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/spi_master.h"
#include "microwave_defines.h"
#include "driver/gpio.h"
#include "driver/i2c.h"
#include "esp_log.h"
#include "esp_timer.h"
#include "driver/dac_continuous.h"
#include "esp_sleep.h"
#include "chickadee.h"
#include "startup.h"

//Microwave Sensor Uses SPI HOST 2
#define MICROWAVE_HOST SPI2_HOST

//Below are the Pin connections for the ESP32s2 Dev Board
#define PIN_NUM_MISO 13  //Motion Detector SPI CIPO
#define PIN_NUM_MOSI 11  //Motion Detector SPI COPI
#define PIN_NUM_SCLK 12  //Motion Detector SPI Clk
#define PIN_NUM_CS 10    //Motion Detector SPI CS
#define PIN_NUM_SDA 15   //Open MV CAM I2C SDA
#define PIN_NUM_SCL 14   //Open MV CAM I2C SCL
#define PIN_TD 8         //Motion Detector TD Output (Active Low, low means motion)
#define PIN_STROBE 7     //Strobe Light Gate Signal Input (Raise high to turn Strobe Light On)
#define PIN_SPEAKER_EN 16 //Analog switch enable (raise high to connect to Speaker)
#define PIN_SWITCH 13     //Input switch for demo
#define PIN_AUDIO_2 18    //Speaker Input (DAC 2 pin)

//Currently a bug where light doesn't flash until after Speaker done playing, change speaker output to asynchronous to fix
#define LIGHT_ON_PERIOD_S .5
#define LIGHT_DURATION_S 3 //Should be an even multiple of LIGHT_ON_PERIOD_S and longer than audio clip (or flashing will continue until audio clip ends)

static const char* TAG = "Main";
static int playing = 0;

esp_timer_handle_t strobeLightTimer;

//Something bad happened, System will restart
void error_happened(){
    for (int i = 10; i >= 0; i--) {
        ESP_LOGI(TAG, "Restarting in %d seconds..", i);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
    ESP_LOGI(TAG, "Restarting now.");
    fflush(stdout);
    esp_restart(); 
}

//Function to write spi message to Motion Detector
//handle: SPI-Bus Handle
//address: Motion Detector Register to write
//trasmit_buffer: Array holding value to write to Motion Detector Register
esp_err_t write_spi(spi_device_handle_t* handle, uint8_t address, uint16_t* transmit_buffer){
    esp_err_t err;
    err = spi_device_acquire_bus(*handle, portMAX_DELAY);
    if(err != ESP_OK){
        return err;
    }
    spi_transaction_t message = {
        .flags = 0,
        .addr = (address << 1) | 1, //7 bit address plus R/W bit
        .length = 16,               //16 bit message (Motion Detector has 16 bit registers)
        .tx_buffer = transmit_buffer,
    };
    err =  spi_device_polling_transmit(*handle, &message);
    spi_device_release_bus(*handle);
    return err;
}

//Function to Toggle Strobe Light
void turn_on_off_strobe(){
    gpio_set_level(PIN_STROBE, (playing % 2) ? 0 : 1); //Hacky way to toggle, turn on when playing is even, off when playing is odd
    playing += 1;
    ESP_LOGE(TAG, "Toggle Light");
}

//Function to create timer that handles toggling the Strobe Light after the correct interval
void create_strobe_light_timer(){
    const esp_timer_create_args_t strobeLightTimerArgs = {
        .callback = &turn_on_off_strobe,
        .name = "strobeLightTimer",
        .skip_unhandled_events = true
    };
    esp_timer_create(&strobeLightTimerArgs, &strobeLightTimer);
}

//Function to synchronously write a wave file on the DAC
//See https://github.com/espressif/esp-idf/tree/81e1e6599553a646a689ad51e32a5d48b34cfec5/examples/peripherals/dac/dac_continuous/dac_audio
//for more details/example
static void dac_play_wav(dac_continuous_handle_t handle, uint8_t* data, size_t data_size){
    gpio_set_level(PIN_SPEAKER_EN, 1);
    dac_continuous_write(handle, data, data_size, NULL, -1);
    gpio_set_level(PIN_SPEAKER_EN, 0);
}

//Function to read data from OpenMV Cam I2C
uint8_t i2c_read(){
    esp_err_t ret = ESP_OK;

    uint8_t len[2] = {0, 0};
    uint8_t bird = 0;
    i2c_cmd_handle_t i2cbus = i2c_cmd_link_create();
    i2c_master_start(i2cbus);
    i2c_master_write_byte(i2cbus, 0x12 << 1 | I2C_MASTER_READ, true);
    i2c_master_read_byte(i2cbus, &len + 1, I2C_MASTER_ACK);
    i2c_master_read_byte(i2cbus, &len, I2C_MASTER_LAST_NACK);
    i2c_master_stop(i2cbus);
    ret = i2c_master_cmd_begin(0, i2cbus, 5 / portTICK_PERIOD_MS);
    if(ret != ESP_OK){
        ESP_LOGE(TAG, "ret = %s", esp_err_to_name(ret));
        error_happened();
    }
    i2c_cmd_link_delete(i2cbus);

    vTaskDelay(1 / portTICK_PERIOD_MS);

    i2cbus = i2c_cmd_link_create();
    i2c_master_start(i2cbus);
    i2c_master_write_byte(i2cbus, 0x12 << 1 | I2C_MASTER_READ, true);
    i2c_master_read_byte(i2cbus, &bird, I2C_MASTER_LAST_NACK);
    i2c_master_stop(i2cbus);
    ret = i2c_master_cmd_begin(0, i2cbus, 5 / portTICK_PERIOD_MS);
    if(ret != ESP_OK){
        ESP_LOGE(TAG, "ret2 = %s", esp_err_to_name(ret));
        error_happened();
    }
    i2c_cmd_link_delete(i2cbus);

    return bird-48;
}

//Main
void app_main(void)
{
    gpio_set_direction(PIN_SPEAKER_EN, GPIO_MODE_OUTPUT);   //Set speaker enable pin to output
    gpio_set_direction(PIN_AUDIO_2, GPIO_MODE_OUTPUT);      //Set Audio Pin to output
    gpio_set_level(PIN_AUDIO_2, 0);                         //Don't write output yet

    //Create structs necessary to use DAC
    dac_continuous_handle_t dac_handle;
    dac_continuous_config_t dac_config = {
        .chan_mask = DAC_CHANNEL_MASK_ALL,
        .desc_num = 4,
        .buf_size = 2048,
        .freq_hz = 48000,
        .offset = 0,
        .clk_src = DAC_DIGI_CLK_SRC_APLL,
        .chan_mode = DAC_CHANNEL_MODE_SIMUL,
    };
    dac_continuous_new_channels(&dac_config, &dac_handle);
    dac_continuous_enable(dac_handle);
    size_t audio_size = sizeof(audio_table);
                
    //Wait a second before playing startup sound (otherwise doesn't always work properly)
    vTaskDelay(1000 / portTICK_PERIOD_MS);
    dac_play_wav(dac_handle, (uint8_t *)audio_table_2, sizeof(audio_table_2));

    ESP_LOGE(TAG, "Started");

    //Create structs necessary for SPI communication
    spi_bus_config_t spibus_cfg = {
        .miso_io_num = PIN_NUM_MISO,
        .mosi_io_num = PIN_NUM_MOSI,
        .sclk_io_num = PIN_NUM_SCLK,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
        .max_transfer_sz = 32,
    };

    spi_device_interface_config_t microwave_cfg = {
        .address_bits = 8,
        .clock_speed_hz = CLK_SPEED_HZ,
        .mode = 0,
        .spics_io_num = PIN_NUM_CS, //Replace with -1 and do manually?
        .queue_size = 1,
        .flags = 0,
    };

    //Create structs necessary for I2C communication
    i2c_config_t i2cbus_cfg = {
        .mode = I2C_MODE_MASTER,
        .sda_io_num = PIN_NUM_SDA,
        .scl_io_num = PIN_NUM_SCL,
        .sda_pullup_en = GPIO_PULLUP_ENABLE,
        .scl_pullup_en = GPIO_PULLUP_ENABLE,
        .master.clk_speed = 100000,
    };

    spi_device_handle_t microwave_sensor;

    //Initialize SPI Bus
    if(spi_bus_initialize(MICROWAVE_HOST, &spibus_cfg, SPI_DMA_CH_AUTO) != ESP_OK){
        ESP_LOGE(TAG, "Failed to Initialize SPI Bus");
        error_happened();
    }

    if(spi_bus_add_device(MICROWAVE_HOST, &microwave_cfg, &microwave_sensor) != ESP_OK){
        ESP_LOGE(TAG, "Failed to Add Microwave Sensor to SPI Bus");
        error_happened();
    }

    //Initialize I2C Bus
    i2c_param_config(0, &i2cbus_cfg);

    if(i2c_driver_install(0, i2cbus_cfg.mode, 0, 0, 0) != ESP_OK){
        ESP_LOGE(TAG, "Failed to Install I2C line");
        error_happened();
    }
    
    //Initialize Motion Detector
    //Address array contains registers to write (done in order)
    //Values array contains values to write to registers (done in order, matches register specified in addresses array)
    uint16_t transmit_buffer = 0;
    int num_transmissions = 9; //Update if number of values in following arrays changes

    //See microwave_defines.h to understand which values correspond to Macros
    uint8_t addresses[10] = {4, FREQ_OPR_REG_ADD, 6, 7, 8, 9, THRESHOLD_REG_ADD, HOLD_TIME_REG_ADD, DIGITAL_CONTROL_REG};
    uint16_t values[10] = {INIT_4, FRQ613kHz, INIT_6, INIT_7, INIT_8, INIT_9, SENSITIVITY_9, HOLD1s, ENABLE_PM | (1<<11 | 1<<4)};

    vTaskDelay(1000 / portTICK_PERIOD_MS);

    //Transmit initialization routine to Motion Detector using SPI
    for(int i = 0; i < num_transmissions; i++){
        transmit_buffer = SPI_SWAP_DATA_TX(values[i], 16); //ESP32 stores values little-endian, need to be changed to big-endian
        if(write_spi(&microwave_sensor, addresses[i], &transmit_buffer) != ESP_OK){
            ESP_LOGE(TAG, "Failed to send transmission number %d of %d", i+1, num_transmissions);
            error_happened();
        }
        vTaskDelay(1 / portTICK_PERIOD_MS);
    }

    ESP_LOGI(TAG, "Successfully initialized microwave sensor");

    //Create timer that will toggle strobe light
    create_strobe_light_timer();
    
    //Set pins to input/output as necessary
    gpio_set_direction(PIN_TD, GPIO_MODE_INPUT);
    gpio_set_direction(PIN_SWITCH, GPIO_MODE_INPUT);
    gpio_pullup_en(PIN_SWITCH);
    gpio_set_direction(PIN_STROBE, GPIO_MODE_OUTPUT);
    gpio_set_level(PIN_STROBE, 0);
    gpio_wakeup_enable(PIN_TD, GPIO_INTR_LOW_LEVEL);
    esp_sleep_enable_gpio_wakeup(); //Allow motion detector to wake esp32s2 from light sleep

    //Forever loop!
    while(true){
        uint8_t bird = 0;
        bool TD = gpio_get_level(PIN_TD); //Check if motion detector detects motion (active low)
        if (TD){ //No motion
            ESP_LOGI(TAG, "No motion");
            esp_light_sleep_start(); //Go to sleep until motion is detected
        }
        else{ //motion
            for(int i = 0; i < 10; i++){ //When motion is detected ask N times if a bird is visible
                bird = i2c_read(); //Read OpenMV response using I2C
                ESP_LOGE(TAG, "Cam says %d, i = %d", bird, i);
                if(bird){ //OpenMV Cam reports bird
                    ESP_LOGE(TAG, "Bird");
                    gpio_set_level(PIN_STROBE, 1); //Turn strobe light on
                    if(esp_timer_is_active(strobeLightTimer)){
                        esp_timer_stop(strobeLightTimer);
                    }
                    ESP_LOGI(TAG, "Turning on Light");
                    esp_timer_start_periodic(strobeLightTimer, LIGHT_ON_PERIOD_S*1000000); //Set timer to toggle light every PERIOD_S seconds
                    dac_play_wav(dac_handle, (uint8_t *)audio_table, audio_size); //Write Bird Call on DAC
                    while(playing < LIGHT_DURATION_S/LIGHT_ON_PERIOD_S){} //Once the Strobe Light Duration is Up, stop flashing light
                    gpio_set_level(PIN_STROBE, 0);      //When Strobe Light Finished, make sure it's off
                    esp_timer_stop(strobeLightTimer);   //End Strobe Light Toggle Timer
                    playing = 0;                        //Reset Playing to 0
                    ESP_LOGI(TAG, "Strobe Light off");
                    break;
                }
                else{
                    vTaskDelay(100 / portTICK_PERIOD_MS); //Receck every N MS
                }
            }
        }
    }
}