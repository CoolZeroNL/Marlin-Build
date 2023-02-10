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
