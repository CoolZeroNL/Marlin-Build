Build Pipeline for marlin, is currently building from bugfix-2.1.x for the following machines:

- Wanhao dublicator D6
- Wanhao dublicator 4S
- Wanhao dublicator i3 plus
- Wanhao dublicator v2.1
- Creality CR10 S4


# Octoprint - Bed Visualizer
```
G28 X Y               ; home X & Y
M140 S60              ; starting by heating the bed for nominal mesh accuracy
M104 S190             ; heat nozzle
M190 S60              ; waiting until the bed is fully warmed up
M109 S190             ; wait for nozzle to heat up
G28 Z                 ; home Z
M155 S0             ; stop temperature reporting rate to reduce output pollution
@BEDLEVELVISUALIZER	; tell the plugin to watch for reported mesh
G29 T	            ; run bilinear probing
M155 S3             ; reset temperature reporting
M500                  ; store mesh in EEPROM
```


M104 S[extruder[new_tool]_temperature] T[new_tool] 	; warm extruder
M140 S[bed[new_tool] _temperature] 		; warm bed

M109 S[extruder[new_tool]_temperature] T[new_tool] 	; wait extruder to reach temp
M190 S[bed[new_tool] _temperature] 		; wait bed to reach temp