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
``` 

## Malin2.0
Change color by lcd online: Lights -> Light Presets

Gcode set color:
``` 
M150 R255 G0 U0 # Red
M150 R0 G255 U0 # Green
M150 R0 G0 U255 # Blue
``` 

Other colors are set according to the value of R G U