#ifndef MICROWAVE_DEFINES
#define MICROWAVE_DEFINES

//Verified under O-scope the output is valid at 10kHz
#define CLK_SPEED_HZ 40000000 //Should work up to 50 MHz
//#define CLK_SPEED_HZ 1000000

#define THRESHOLD_REG_ADD 2
#define FREQ_OPR_REG_ADD 5
#define HOLD_TIME_REG_ADD 10
#define DIGITAL_CONTROL_REG 15

#define SENSITIVITY_15 61
#define SENSITIVITY_14 66
#define SENSITIVITY_13 80
#define SENSITIVITY_12 90
#define SENSITIVITY_11 112
#define SENSITIVITY_10 136
#define SENSITIVITY_9 192
#define SENSITIVITY_8 248
#define SENSITIVITY_7 320
#define SENSITIVITY_6 384
#define SENSITIVITY_5 480
#define SENSITIVITY_4 640
#define SENSITIVITY_3 896
#define SENSITIVITY_2 1344
#define SENSITIVITY_1 1920
#define SENSITIVITY_0 2560

//Japenese Freqs
#define FRQ606kHz 0x0EA2
#define FRQ607kHz 0x0ECC
#define FRQ608kHz 0x0EF5
#define FRQ609kHz 0x0F1F

//European & American Freqs
#define FRQ611KHz 0x0F72
#define FRQ612kHz 0x0F9C
#define FRQ613kHz 0x0FC6
#define FRQ614kHz 0x0FEF

//Hold time is 128ms * HOLDVALUE
#define HOLD500ms 4
#define HOLD1s 8
#define HOLD2s 16
#define HOLD3s 23
#define HOLD5s 39
#define HOLD10s 78
#define HOLD30s 240
#define HOLD45s 360
#define HOLD1min 469
#define HOLD90s 703
#define HOLD2min 938
#define HOLD5min 2344
#define HOLD10min 4688
#define HOLD15min 7031
#define HOLD30min 14063

#define INIT_4 0x0F3A
#define INIT_6 0x6800
#define INIT_7 0x045F
#define INIT_8 0x0000
#define INIT_9 0x0068

#define ENABLE_PM (1<<14)
#define ENABLE_PD (1<<6)

#endif