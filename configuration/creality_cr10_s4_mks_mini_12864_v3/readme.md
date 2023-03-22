see other CR10 S4 for other details.

# MKS LCD

- https://github.com/makerbase-mks/MKS-MINI12864-V3

## Connect
- Connect to MKS board by EXP1 and EXP2
- Connect to other board by EXP1 and EXP1, but cable need Rotate 180°
- 

## Marlin2.0

in Configuration.h file

``` 
Enable: #define MKS_MINI_12864_V3
Enable: #define NEOPIXEL_LED
Change: #define NEOPIXEL_TYPE NEO_GRBW --> NEO_RGB
``` 


Change color by lcd display on the machine: Lights -> Light Presets

# Z-Offset Instructions:
```
G28 Z       // Home 3D printer
M851 Z0     // Reset Z0Offset
M500        // Store setting to eeprom
M501        // Set active parameters
M503        // Display Active Parameters
G28 Z       // Home Z Axis
G1 F60 Z0   // Move nozzle to true 0 offset
M211 S0     // Switch off soft endstops
```

Move nozzle towards bed slowly until the paper can barely move
Take note of the Z on the printer display (take that number and add the measurment of the calibration sheet or device used)

```
M851 Z X.XX 
M211 S1     // Enable Soft Endstops
M500        // Save settings to Eeprom
M501        // Set Active Parameters
M503        // display current settings
```
