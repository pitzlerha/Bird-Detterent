#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/spi_master.h"
#include "microwave_defines.h"
#include "driver/gpio.h"
#include "led_strip.h"
#include "esp_log.h"

#define MICROWAVE_HOST SPI2_HOST
#define PIN_NUM_MISO 13
#define PIN_NUM_MOSI 11
#define PIN_NUM_SCLK 12
#define PIN_NUM_CS 10
#define PIN_PD 8
#define PIN_TD 9
#define PIN_NUM_RGB_LED GPIO_NUM_18

static led_strip_handle_t led_strip;

static const char* TAG = "Main";

static void configure_led(void)
{
    /* LED strip initialization with the GPIO and pixels number*/
    led_strip_config_t strip_config = {
        .strip_gpio_num = PIN_NUM_RGB_LED,
        .max_leds = 1, // at least one LED on board
    };
    led_strip_rmt_config_t rmt_config = {
        .resolution_hz = 10 * 1000 * 1000, // 10MHz
    };
    ESP_ERROR_CHECK(led_strip_new_rmt_device(&strip_config, &rmt_config, &led_strip));
    /* Set all LED off to clear all pixels */
    led_strip_clear(led_strip);
}

void error_happened(){
    for (int i = 10; i >= 0; i--) {
        ESP_LOGI(TAG, "Restarting in %d seconds..", i);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
    ESP_LOGI(TAG, "Restarting now.");
    fflush(stdout);
    esp_restart(); 
}

esp_err_t write_spi(spi_device_handle_t* handle, uint8_t address, uint16_t* transmit_buffer){
    esp_err_t err;
    err = spi_device_acquire_bus(*handle, portMAX_DELAY);
    if(err != ESP_OK){
        return err;
    }
    spi_transaction_t message = {
        .flags = 0,
        .addr = (address << 1) | 1, //7 bit address plus R/W bit
        .length = 16,
        .tx_buffer = transmit_buffer,
    };
    err =  spi_device_polling_transmit(*handle, &message);
    spi_device_release_bus(*handle);
    return err;
}

void app_main(void)
{
    spi_bus_config_t bus_cfg = {
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

    spi_device_handle_t microwave_sensor;

    if(spi_bus_initialize(MICROWAVE_HOST, &bus_cfg, SPI_DMA_CH_AUTO) != ESP_OK){
        ESP_LOGE(TAG, "Failed to Initialize SPI Bus");
        error_happened();
    }

    if(spi_bus_add_device(MICROWAVE_HOST, &microwave_cfg, &microwave_sensor) != ESP_OK){
        ESP_LOGE(TAG, "Failed to Add Microwave Sensor to SPI Bus");
        error_happened();
    }

    uint16_t transmit_buffer = 0;
    int num_transmissions = 9;
    uint8_t addresses[10] = {4, FREQ_OPR_REG_ADD, 6, 7, 8, 9, THRESHOLD_REG_ADD, HOLD_TIME_REG_ADD, DIGITAL_CONTROL_REG/*, 14*/};
        uint16_t values[10] = {INIT_4, FRQ613kHz, INIT_6, INIT_7, INIT_8, INIT_9, SENSITIVITY_5, HOLD500ms, ENABLE_PM | (1<<11 | 1<<4)/*, 1<<6*/};

    vTaskDelay(1000 / portTICK_PERIOD_MS);

    for(int i = 0; i < num_transmissions; i++){
        transmit_buffer = SPI_SWAP_DATA_TX(values[i], 16);
        if(write_spi(&microwave_sensor, addresses[i], &transmit_buffer) != ESP_OK){
            ESP_LOGE(TAG, "Failed to send transmission number %d of %d", i+1, num_transmissions);
            error_happened();
        }

        vTaskDelay(1 / portTICK_PERIOD_MS);
    }

    ESP_LOGI(TAG, "Successfully initialized microwave sensor");
    configure_led();
    gpio_set_direction(PIN_TD, GPIO_MODE_INPUT);
    gpio_set_direction(PIN_PD, GPIO_MODE_INPUT);

    bool old_TD = true;
    bool old_PD = true;

    led_strip_set_pixel(led_strip, 0, 0, 0, 64);
    led_strip_refresh(led_strip);

    while(true){
        bool new_TD = gpio_get_level(PIN_TD);
        bool new_PD = gpio_get_level(PIN_PD);
        if(new_TD != old_TD || new_PD != old_PD){
            old_TD = new_TD;
            old_PD = new_PD;
            if (new_TD){ //No motion
                led_strip_set_pixel(led_strip, 0, 0, 0, 64);
                led_strip_refresh(led_strip);
            }
            else{
                if(new_PD){ //Approaching
                    led_strip_set_pixel(led_strip, 0, 0, 64, 0);
                    led_strip_refresh(led_strip);
                }
                else{ //Departing
                    led_strip_set_pixel(led_strip, 0, 64, 0, 0);
                    led_strip_refresh(led_strip);
                }
            }
        }
        vTaskDelay(1 / portTICK_PERIOD_MS);
    };

}