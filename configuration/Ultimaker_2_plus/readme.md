# How to upgrade Firmware
- https://support.makerbot.com/s/article/1667337917778

use cura, also to return to stock firmware.


# Current:

Marlin 1.0.0
Last Updated: Mar 15 2018 13:04:08 | Author: Vers:_3.3.0
Free Memory: 2055  PlannerBufferBytes: 1232
Stored settings retrieved

Steps per unit:
M92 X80.00 Y80.00 Z200.00 E369.00

Maximum feedrates (mm/s):
M203 X300.00 Y300.00 Z40.00 E45.00

Maximum Acceleration (mm/s2):
M201 X9000 Y9000 Z100 E10000

Acceleration: S=acceleration, T=retract acceleration
M204 S3000.00 T3000.00

Advanced variables: S=Min feedrate (mm/s), T=Min travel feedrate (mm/s), B=minimum segment time (ms), X=maximum XY jerk (mm/s),  Z=maximum Z jerk (mm/s),  E=maximum E jerk (mm/s)
M205 S0.00 T0.00 B20000 X20.00 Z0.40 E5.00

Home offset (mm):
M206 X0.00 Y0.00 Z-14.05

PID settings:
M301 P10.03 I1.50 D70.00

