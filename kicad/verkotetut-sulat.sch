EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:verkotetut-sulat-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP-12E U?
U 1 1 582ADF4F
P 5500 3550
F 0 "U?" H 5500 3450 50  0000 C CNN
F 1 "ESP-12E" H 5500 3650 50  0000 C CNN
F 2 "" H 5500 3550 50  0001 C CNN
F 3 "" H 5500 3550 50  0001 C CNN
	1    5500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3950 6600 3950
Wire Wire Line
	6600 3850 6600 4100
$Comp
L GND #PWR?
U 1 1 582ADF86
P 6600 4100
F 0 "#PWR?" H 6600 3850 50  0001 C CNN
F 1 "GND" H 6600 3950 50  0000 C CNN
F 2 "" H 6600 4100 50  0000 C CNN
F 3 "" H 6600 4100 50  0000 C CNN
	1    6600 4100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 582ADFA2
P 4450 4150
F 0 "C?" H 4475 4250 50  0000 L CNN
F 1 "33u" H 4475 4050 50  0000 L CNN
F 2 "" H 4488 4000 50  0000 C CNN
F 3 "" H 4450 4150 50  0000 C CNN
	1    4450 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3950 4450 3950
Wire Wire Line
	4450 3450 4450 4000
$Comp
L GND #PWR?
U 1 1 582ADFFF
P 4450 4400
F 0 "#PWR?" H 4450 4150 50  0001 C CNN
F 1 "GND" H 4450 4250 50  0000 C CNN
F 2 "" H 4450 4400 50  0000 C CNN
F 3 "" H 4450 4400 50  0000 C CNN
	1    4450 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4400 4450 4300
Wire Wire Line
	4000 3450 4600 3450
Connection ~ 4450 3950
$Comp
L +3.3V #PWR?
U 1 1 582AE24E
P 9400 900
F 0 "#PWR?" H 9400 750 50  0001 C CNN
F 1 "+3.3V" H 9400 1040 50  0000 C CNN
F 2 "" H 9400 900 50  0000 C CNN
F 3 "" H 9400 900 50  0000 C CNN
	1    9400 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 900  9400 1050
Wire Wire Line
	8400 1000 9400 1000
Wire Wire Line
	7300 850  7300 1000
Wire Wire Line
	7300 1000 7600 1000
$Comp
L +3.3V #PWR?
U 1 1 582AE2EC
P 4000 3400
F 0 "#PWR?" H 4000 3250 50  0001 C CNN
F 1 "+3.3V" H 4000 3540 50  0000 C CNN
F 2 "" H 4000 3400 50  0000 C CNN
F 3 "" H 4000 3400 50  0000 C CNN
	1    4000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3400 4000 3450
Connection ~ 4450 3450
$Comp
L R R?
U 1 1 582AE354
P 4400 3050
F 0 "R?" V 4480 3050 50  0000 C CNN
F 1 "1k" V 4400 3050 50  0000 C CNN
F 2 "" V 4330 3050 50  0000 C CNN
F 3 "" H 4400 3050 50  0000 C CNN
	1    4400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3250 4600 3250
$Comp
L +3.3V #PWR?
U 1 1 582AE3AF
P 4400 2800
F 0 "#PWR?" H 4400 2650 50  0001 C CNN
F 1 "+3.3V" H 4400 2940 50  0000 C CNN
F 2 "" H 4400 2800 50  0000 C CNN
F 3 "" H 4400 2800 50  0000 C CNN
	1    4400 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2800 4400 2900
Wire Wire Line
	6400 3650 7450 3650
$Comp
L R R?
U 1 1 582AE540
P 7300 3400
F 0 "R?" V 7380 3400 50  0000 C CNN
F 1 "1k" V 7300 3400 50  0000 C CNN
F 2 "" V 7230 3400 50  0000 C CNN
F 3 "" H 7300 3400 50  0000 C CNN
	1    7300 3400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 582AE5B0
P 7300 3150
F 0 "#PWR?" H 7300 3000 50  0001 C CNN
F 1 "+3.3V" H 7300 3290 50  0000 C CNN
F 2 "" H 7300 3150 50  0000 C CNN
F 3 "" H 7300 3150 50  0000 C CNN
	1    7300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3150 7300 3250
Wire Wire Line
	7300 3650 7300 3550
$Comp
L SW_PUSH SW?
U 1 1 582AE65F
P 7750 3650
F 0 "SW?" H 7900 3760 50  0000 C CNN
F 1 "SW_PUSH" H 7750 3570 50  0000 C CNN
F 2 "" H 7750 3650 50  0000 C CNN
F 3 "" H 7750 3650 50  0000 C CNN
	1    7750 3650
	1    0    0    -1  
$EndComp
Connection ~ 7300 3650
$Comp
L GND #PWR?
U 1 1 582AE6C1
P 8350 3750
F 0 "#PWR?" H 8350 3500 50  0001 C CNN
F 1 "GND" H 8350 3600 50  0000 C CNN
F 2 "" H 8350 3750 50  0000 C CNN
F 3 "" H 8350 3750 50  0000 C CNN
	1    8350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3750 8350 3650
Wire Wire Line
	8350 3650 8050 3650
Wire Wire Line
	6400 3750 7100 3750
Wire Wire Line
	7100 3750 7100 3200
Wire Wire Line
	7100 3200 7300 3200
Connection ~ 7300 3200
Wire Wire Line
	6400 3850 6600 3850
Connection ~ 6600 3950
Text GLabel 6450 2700 1    60   Output ~ 0
ESP_TX
Text GLabel 6600 2700 1    60   Input ~ 0
ESP_RX
Text GLabel 4200 3200 1    60   Input ~ 0
ESP_ADC
Wire Wire Line
	4200 3200 4200 3350
Wire Wire Line
	4200 3350 4600 3350
$Comp
L SW_PUSH SW?
U 1 1 582AEC27
P 5000 2600
F 0 "SW?" H 5150 2710 50  0000 C CNN
F 1 "SW_PUSH" H 5000 2520 50  0000 C CNN
F 2 "" H 5000 2600 50  0000 C CNN
F 3 "" H 5000 2600 50  0000 C CNN
	1    5000 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582AEC52
P 5450 2700
F 0 "#PWR?" H 5450 2450 50  0001 C CNN
F 1 "GND" H 5450 2550 50  0000 C CNN
F 2 "" H 5450 2700 50  0000 C CNN
F 3 "" H 5450 2700 50  0000 C CNN
	1    5450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2700 5450 2600
Wire Wire Line
	5450 2600 5300 2600
Wire Wire Line
	4400 3200 4400 3250
Wire Wire Line
	4550 3250 4550 2600
Wire Wire Line
	4550 2600 4700 2600
Connection ~ 4550 3250
Text GLabel 6750 2700 1    60   BiDi ~ 0
GPIO5
Text GLabel 6900 2700 1    60   BiDi ~ 0
GPIO4
Wire Wire Line
	6400 3550 6900 3550
Wire Wire Line
	6900 3550 6900 2700
Wire Wire Line
	6400 3450 6750 3450
Wire Wire Line
	6750 3450 6750 2700
Wire Wire Line
	6400 3350 6600 3350
Wire Wire Line
	6600 3350 6600 2700
Wire Wire Line
	6450 2700 6450 3250
Wire Wire Line
	6450 3250 6400 3250
Text GLabel 3600 3550 0    60   BiDi ~ 0
GPIO16
Text GLabel 3600 3700 0    60   BiDi ~ 0
GPIO14
Text GLabel 3600 3850 0    60   BiDi ~ 0
GPIO12
Text GLabel 3600 4000 0    60   BiDi ~ 0
GPIO13
Wire Wire Line
	4600 3550 3600 3550
Wire Wire Line
	4600 3650 3750 3650
Wire Wire Line
	3750 3650 3750 3700
Wire Wire Line
	3750 3700 3600 3700
Wire Wire Line
	4600 3750 3800 3750
Wire Wire Line
	3800 3750 3800 3850
Wire Wire Line
	3800 3850 3600 3850
Wire Wire Line
	4600 3850 3850 3850
Wire Wire Line
	3850 3850 3850 4000
Wire Wire Line
	3850 4000 3600 4000
Text GLabel 5400 4850 3    60   BiDi ~ 0
GPIO9
Text GLabel 5600 4850 3    60   BiDi ~ 0
GPIO10
Wire Wire Line
	5450 4450 5450 4800
Wire Wire Line
	5450 4800 5400 4800
Wire Wire Line
	5400 4800 5400 4850
Wire Wire Line
	5550 4450 5550 4800
Wire Wire Line
	5550 4800 5600 4800
Wire Wire Line
	5600 4800 5600 4850
Text GLabel 5800 4850 3    60   Input ~ 0
ESP_MOSI
Text GLabel 6000 4850 3    60   BiDi ~ 0
ESP_SCLK
Text GLabel 5200 4850 3    60   Output ~ 0
ESP_MISO
Text GLabel 5000 4850 3    60   BiDi ~ 0
ESP_CSO
Wire Wire Line
	5650 4450 5650 4750
Wire Wire Line
	5650 4750 5800 4750
Wire Wire Line
	5800 4750 5800 4850
Wire Wire Line
	5750 4450 5750 4700
Wire Wire Line
	5750 4700 6000 4700
Wire Wire Line
	6000 4700 6000 4850
Wire Wire Line
	5350 4450 5350 4750
Wire Wire Line
	5350 4750 5200 4750
Wire Wire Line
	5200 4750 5200 4850
Wire Wire Line
	5250 4450 5250 4700
Wire Wire Line
	5250 4700 5000 4700
Wire Wire Line
	5000 4700 5000 4850
$Comp
L CONN_01X06 P?
U 1 1 582AFD11
P 10550 3450
F 0 "P?" H 10550 3800 50  0000 C CNN
F 1 "USB2Serial_connection" V 10650 3450 50  0000 C CNN
F 2 "" H 10550 3450 50  0000 C CNN
F 3 "" H 10550 3450 50  0000 C CNN
	1    10550 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 582AFE3A
P 10200 3050
F 0 "#PWR?" H 10200 2900 50  0001 C CNN
F 1 "+5V" H 10200 3190 50  0000 C CNN
F 2 "" H 10200 3050 50  0000 C CNN
F 3 "" H 10200 3050 50  0000 C CNN
	1    10200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3050 10200 3200
Wire Wire Line
	10200 3200 10350 3200
$Comp
L GND #PWR?
U 1 1 582AFEB8
P 9850 3000
F 0 "#PWR?" H 9850 2750 50  0001 C CNN
F 1 "GND" H 9850 2850 50  0000 C CNN
F 2 "" H 9850 3000 50  0000 C CNN
F 3 "" H 9850 3000 50  0000 C CNN
	1    9850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3300 10050 3300
Wire Wire Line
	10050 3300 10050 2900
Wire Wire Line
	10050 2900 9850 2900
Wire Wire Line
	9850 2900 9850 3000
Text GLabel 9850 3350 0    60   Output ~ 0
ESP_RX
Wire Wire Line
	9850 3350 9950 3350
Wire Wire Line
	9950 3350 9950 3400
Wire Wire Line
	9950 3400 10350 3400
Text GLabel 9850 3500 0    60   Input ~ 0
ESP_TX
Wire Wire Line
	9850 3500 10350 3500
$Comp
L +3.3V #PWR?
U 1 1 582B0641
P 10300 3950
F 0 "#PWR?" H 10300 3800 50  0001 C CNN
F 1 "+3.3V" H 10300 4090 50  0000 C CNN
F 2 "" H 10300 3950 50  0000 C CNN
F 3 "" H 10300 3950 50  0000 C CNN
	1    10300 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 3700 10300 3700
Wire Wire Line
	10300 3700 10300 3950
Text GLabel 9850 3650 0    60   BiDi ~ 0
USB2Serial_DTR
Wire Wire Line
	10350 3600 9950 3600
Wire Wire Line
	9950 3600 9950 3650
Wire Wire Line
	9950 3650 9850 3650
$Comp
L C C?
U 1 1 582B0A00
P 9400 1200
F 0 "C?" H 9425 1300 50  0000 L CNN
F 1 "33u" H 9425 1100 50  0000 L CNN
F 2 "" H 9438 1050 50  0000 C CNN
F 3 "" H 9400 1200 50  0000 C CNN
	1    9400 1200
	1    0    0    -1  
$EndComp
Connection ~ 9400 1000
$Comp
L CONN_01X02 P?
U 1 1 582B0C75
P 10000 4850
F 0 "P?" H 10000 5000 50  0000 C CNN
F 1 "Battery connection" V 10100 4850 50  0000 C CNN
F 2 "" H 10000 4850 50  0000 C CNN
F 3 "" H 10000 4850 50  0000 C CNN
	1    10000 4850
	1    0    0    -1  
$EndComp
Text Notes 9550 5800 0    60   ~ 0
The circuit assumes\na voltage of 9V, but\nanything from 6.5V\nto 20V should be okay.
$Comp
L GND #PWR?
U 1 1 582B0E01
P 9700 5000
F 0 "#PWR?" H 9700 4750 50  0001 C CNN
F 1 "GND" H 9700 4850 50  0000 C CNN
F 2 "" H 9700 5000 50  0000 C CNN
F 3 "" H 9700 5000 50  0000 C CNN
	1    9700 5000
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 582B0E29
P 9700 4700
F 0 "#PWR?" H 9700 4550 50  0001 C CNN
F 1 "+9V" H 9700 4840 50  0000 C CNN
F 2 "" H 9700 4700 50  0000 C CNN
F 3 "" H 9700 4700 50  0000 C CNN
	1    9700 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4800 9700 4800
Wire Wire Line
	9700 4800 9700 4700
Wire Wire Line
	9800 4900 9700 4900
Wire Wire Line
	9700 4900 9700 5000
$Comp
L GND #PWR?
U 1 1 582B108B
P 9400 1450
F 0 "#PWR?" H 9400 1200 50  0001 C CNN
F 1 "GND" H 9400 1300 50  0000 C CNN
F 2 "" H 9400 1450 50  0000 C CNN
F 3 "" H 9400 1450 50  0000 C CNN
	1    9400 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1450 9400 1350
$Comp
L +9V #PWR?
U 1 1 582B117B
P 7300 850
F 0 "#PWR?" H 7300 700 50  0001 C CNN
F 1 "+9V" H 7300 990 50  0000 C CNN
F 2 "" H 7300 850 50  0000 C CNN
F 3 "" H 7300 850 50  0000 C CNN
	1    7300 850 
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 582B13DF
P 8750 1250
F 0 "R?" V 8830 1250 50  0000 C CNN
F 1 "150" V 8750 1250 50  0000 C CNN
F 2 "" V 8680 1250 50  0000 C CNN
F 3 "" H 8750 1250 50  0000 C CNN
	1    8750 1250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 582B142B
P 8750 1700
F 0 "R?" V 8830 1700 50  0000 C CNN
F 1 "240" V 8750 1700 50  0000 C CNN
F 2 "" V 8680 1700 50  0000 C CNN
F 3 "" H 8750 1700 50  0000 C CNN
	1    8750 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582B14D7
P 8750 1950
F 0 "#PWR?" H 8750 1700 50  0001 C CNN
F 1 "GND" H 8750 1800 50  0000 C CNN
F 2 "" H 8750 1950 50  0000 C CNN
F 3 "" H 8750 1950 50  0000 C CNN
	1    8750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 1950 8750 1850
Wire Wire Line
	8750 1100 8750 1000
Connection ~ 8750 1000
$Comp
L LM317T U?
U 1 1 582B1821
P 8000 1050
F 0 "U?" H 7800 1250 50  0000 C CNN
F 1 "LM317T" H 8000 1250 50  0000 L CNN
F 2 "TO-220" H 8000 1150 50  0000 C CIN
F 3 "" H 8000 1050 50  0000 C CNN
	1    8000 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1300 8000 1450
Wire Wire Line
	8000 1450 8750 1450
Wire Wire Line
	8750 1400 8750 1550
Connection ~ 8750 1450
$Comp
L LED D?
U 1 1 582B1C72
P 10200 1250
F 0 "D?" H 10200 1350 50  0000 C CNN
F 1 "LED" H 10200 1150 50  0000 C CNN
F 2 "" H 10200 1250 50  0000 C CNN
F 3 "" H 10200 1250 50  0000 C CNN
	1    10200 1250
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 582B1CAF
P 10200 900
F 0 "#PWR?" H 10200 750 50  0001 C CNN
F 1 "+3.3V" H 10200 1040 50  0000 C CNN
F 2 "" H 10200 900 50  0000 C CNN
F 3 "" H 10200 900 50  0000 C CNN
	1    10200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 900  10200 1050
$Comp
L R R?
U 1 1 582B1DF8
P 10200 1700
F 0 "R?" V 10280 1700 50  0000 C CNN
F 1 "330" V 10200 1700 50  0000 C CNN
F 2 "" V 10130 1700 50  0000 C CNN
F 3 "" H 10200 1700 50  0000 C CNN
	1    10200 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582B1E31
P 10200 2000
F 0 "#PWR?" H 10200 1750 50  0001 C CNN
F 1 "GND" H 10200 1850 50  0000 C CNN
F 2 "" H 10200 2000 50  0000 C CNN
F 3 "" H 10200 2000 50  0000 C CNN
	1    10200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1450 10200 1550
Wire Wire Line
	10200 1850 10200 2000
Text GLabel 2450 2250 2    60   BiDi ~ 0
GPIO4
Text GLabel 2950 2150 2    60   BiDi ~ 0
GPIO5
Text GLabel 2450 2050 2    60   BiDi ~ 0
GPIO9
Text GLabel 2950 1950 2    60   BiDi ~ 0
GPIO10
Text GLabel 2450 1850 2    60   BiDi ~ 0
GPIO12
Text GLabel 2950 1750 2    60   BiDi ~ 0
GPIO13
Text GLabel 2450 1650 2    60   BiDi ~ 0
GPIO14
Text GLabel 2950 1550 2    60   BiDi ~ 0
GPIO16
Wire Wire Line
	2450 2250 2300 2250
Wire Wire Line
	2300 2150 2950 2150
Wire Wire Line
	2450 2050 2300 2050
Wire Wire Line
	2300 1950 2950 1950
Wire Wire Line
	2450 1850 2300 1850
Wire Wire Line
	2300 1750 2950 1750
Wire Wire Line
	2450 1650 2300 1650
Wire Wire Line
	2300 1550 2950 1550
$Comp
L CONN_01X04 P?
U 1 1 582B2EDB
P 2350 5200
F 0 "P?" H 2350 5450 50  0000 C CNN
F 1 "Programming pins" V 2450 5200 50  0000 C CNN
F 2 "" H 2350 5200 50  0000 C CNN
F 3 "" H 2350 5200 50  0000 C CNN
	1    2350 5200
	-1   0    0    1   
$EndComp
Text GLabel 2750 5350 2    60   BiDi ~ 0
ESP_SCLK
Text GLabel 3300 5250 2    60   Output ~ 0
ESP_MOSI
Text GLabel 2750 5150 2    60   Input ~ 0
ESP_MISO
Text GLabel 3300 5050 2    60   BiDi ~ 0
ESP_CSO
Wire Wire Line
	3300 5050 2550 5050
Wire Wire Line
	2750 5350 2550 5350
Wire Wire Line
	3300 5250 2550 5250
Wire Wire Line
	2750 5150 2550 5150
$Comp
L CONN_01X09 P?
U 1 1 582B382C
P 2100 1850
F 0 "P?" H 2100 2350 50  0000 C CNN
F 1 "GPIO and ADC" V 2200 1850 50  0000 C CNN
F 2 "" H 2100 1850 50  0000 C CNN
F 3 "" H 2100 1850 50  0000 C CNN
	1    2100 1850
	-1   0    0    1   
$EndComp
Text GLabel 2450 1450 2    60   Output ~ 0
ESP_ADC
Wire Wire Line
	2450 1450 2300 1450
$Comp
L LED D?
U 1 1 582B3E8B
P 2350 2600
F 0 "D?" H 2350 2700 50  0000 C CNN
F 1 "LED" H 2350 2500 50  0000 C CNN
F 2 "" H 2350 2600 50  0000 C CNN
F 3 "" H 2350 2600 50  0000 C CNN
	1    2350 2600
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 582B3E92
P 2350 3050
F 0 "R?" V 2430 3050 50  0000 C CNN
F 1 "330" V 2350 3050 50  0000 C CNN
F 2 "" V 2280 3050 50  0000 C CNN
F 3 "" H 2350 3050 50  0000 C CNN
	1    2350 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 582B3E98
P 2350 3350
F 0 "#PWR?" H 2350 3100 50  0001 C CNN
F 1 "GND" H 2350 3200 50  0000 C CNN
F 2 "" H 2350 3350 50  0000 C CNN
F 3 "" H 2350 3350 50  0000 C CNN
	1    2350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2800 2350 2900
Wire Wire Line
	2350 3200 2350 3350
Wire Wire Line
	2350 2400 2350 2250
Connection ~ 2350 2250
$EndSCHEMATC
