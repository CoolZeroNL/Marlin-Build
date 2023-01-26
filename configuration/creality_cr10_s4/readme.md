# backup
```
G21    ; Units in mm
M149 C ; Units in Celsius
Filament settings: Disabled
M200 D1.75
M200 D0
Steps per unit:
M92 X80.00 Y80.00 Z400.00 E485.00
Maximum feedrates (units/s):
M203 X300.00 Y300.00 Z5.00 E50.00
Maximum Acceleration (units/s2):
M201 X300 Y300 Z100 E1000
Acceleration (units/s2): P<print_accel> R<retract_accel> T<travel_accel>
M204 P500.00 R500.00 T1000.00
Advanced: S<min_feedrate> T<min_travel_feedrate> B<min_segment_time_ms> X<max_xy_jerk> Z<max_z_jerk> E<max_e_jerk>
M205 S0.00 T0.00 B20000 X10.00 Y10.00 Z0.40 E5.00
Home offset:
M206 X0.00 Y0.00 Z0.00
Material heatup parameters:
M145 S0 H185 B45 F255
PID settings:
M301 P25.60 I2.28 D71.84
```
