# Configuration.h

| 2.0                          | 2.1.1                                     |                                                                                                                                                |
| ---------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
|                              | #define SWITCHING_NOZZLE_SERVO_DWELL 2500 | // Dwell time to wait for servo to make physical move                                                                                          |
| #define DEFAULT_EJERK    5.0 | #define DEFAULT_EJERK    1.0              | // May be used by Linear Advance                                                                                                               |
| #define S_CURVE_ACCELERATION | //#define S_CURVE_ACCELERATION            | // This option eliminates vibration during printing by fitting a Bézier curve to move acceleration, producing much smoother direction changes. |
| #define LEVEL_BED_CORNERS    | //#define LEVEL_BED_CORNER                | // Add a menu item to move between bed corners for manual bed adjustment                                                                       |
| #define XY_SKEW_FACTOR 0.0   | //#define XY_SKEW_FACTOR 0.0              | // Or, set the XY skew factor directly                                                                                                         |
|                              | #define Z_HOMING_HEIGHT  0                | // (mm) Minimal Z height before homing (G28) for Z clearance above the bed, clamps,                                                                                                                                                |
|                              |                                           |                                                                                                                                                |
 

## Tuning
|2.0                                                                       |2.1.1                                                                         | old 2.1.1 value |
|--------------------------------------------------------------------------|------------------------------------------------------------------------------|-----------------|-|
| #define DEFAULT_MAX_FEEDRATE          { 250, 250, 5, 25 }                | #define DEFAULT_MAX_FEEDRATE          { 300, 300, 5, 25 }                    |                 |
| #define DEFAULT_MAX_ACCELERATION      { 750, 750, 100, 500 }             | #define DEFAULT_MAX_ACCELERATION      { 3000, 3000, 100, 500 }               |                 |// X, Y, Z, E0 ... Maximum start speed for accelerated moves
| #define DEFAULT_ACCELERATION          800                                | #define DEFAULT_ACCELERATION          1000                                   | 1500            |// X, Y, Z ... and E acceleration for printing moves
| #define DEFAULT_RETRACT_ACCELERATION  500                                | #define DEFAULT_RETRACT_ACCELERATION  800                                    | 1500            |// E acceleration for retracts
| #define DEFAULT_TRAVEL_ACCELERATION   1000                               | #define DEFAULT_TRAVEL_ACCELERATION   1500                                   | 3000            |// X, Y, Z ... acceleration for travel (non printing) moves
| #define DEFAULT_AXIS_STEPS_PER_UNIT   { 80.0395, 80.0395, 400.48, 99.1 } | #define DEFAULT_AXIS_STEPS_PER_UNIT   { 80.0395, 80.0395, 400.48, 104.31579 }     |                 |


# Configuration_adv.h

|2.0                                                 |2.1.1                                                       | |
|----------------------------------------------------|------------------------------------------------------------|-|
| #define WATCH_TEMP_PERIOD 90                       | #define WATCH_TEMP_PERIOD  40                              | // Whenever an M104, M109, or M303 increases the target temperature, the firmware will wait for the WATCH_TEMP_PERIOD to expire. If the temperature hasn't increased by WATCH_TEMP_INCREASE degrees, the machine is halted and requires a hard reset.
| #define Z_STEPPER_ALIGN_ITERATIONS 5               | #define Z_STEPPER_ALIGN_ITERATIONS 3                       | // Number of iterations to apply during alignment
| #define ADAPTIVE_STEP_SMOOTHING                    | //#define ADAPTIVE_STEP_SMOOTHING                          | // Adaptive Step Smoothing increases the resolution of multi-axis moves, particularly at step frequencies below 1kHz (for AVR) or 10kHz (for ARM), where aliasing between axes in multi-axis moves causes audible vibration and surface artifacts
| #define PWM_MOTOR_CURRENT { 1000, 900, 900 }       | #define PWM_MOTOR_CURRENT { 1200, 1200, 1000 }             | // Values in milliamps
| #define MANUAL_FEEDRATE { 50*60, 50*60, 4*60, 60 } | #define MANUAL_FEEDRATE { 70*60, 70*60, 15*60, 6*60 }      | // Feedrates for manual moves along X, Y, Z, E from panel
| #define SD_FINISHED_RELEASECOMMAND "M84 X Y Z E"   | #define SD_FINISHED_RELEASECOMMAND "M84"                   | // Use "M84XYE" to keep Z enabled so your bed stays in place
| #define POWER_LOSS_RECOVERY                        | //#define POWER_LOSS_RECOVERY                              | // Store the current state to the SD Card at the start of each layer during SD printing.
| #define BABYSTEP_MULTIPLICATOR_Z  5                | #define BABYSTEP_MULTIPLICATOR_Z  1                        | // (steps or mm) Steps or millimeter distance for each Z babystep
| #define MOVE_Z_WHEN_IDLE                           | //#define MOVE_Z_WHEN_IDLE                                 | // Jump to the move Z menu on doubleclick when printer is idle.
| #define EMERGENCY_PARSER                           | //#define EMERGENCY_PARSER                                 | // Add a low-level parser to intercept certain commands as they * enter the serial receive buffer, so they cannot be blocked. * Currently handles M108, M112, M410, M876
| //#define HOST_ACTION_COMMANDS                     | #define HOST_ACTION_COMMANDS                               | // Host Prompt Support enables Marlin to use the host for user prompts so filament runout and other processes can be managed from the host side.


# Home clearing

We leave our bed at the bottom of the printer when the print is done. But any homeing will raise the bed x lower and then do the homing. We dont want this beheaver, so we disable this.

configuration.h

from:
// #define Z_HOMING_HEIGHT  4      // (mm) Minimal Z height before homing (G28) for Z clearance above the bed, clamps, ...
                                  // Be sure to have this much clearance over your Z_MAX_POS to prevent grinding.

to
#define Z_HOMING_HEIGHT  0      // (mm) Minimal Z height before homing (G28) for Z clearance above the bed, clamps, ...
                                  // Be sure to have this much clearance over your Z_MAX_POS to prevent grinding.

# Not working:

    - Stop print trough menu, when print is started from simplyfy3d (HOST_ACTION_COMMANDS is enabled)
    - Custom menu label 1 not working, shows only pla


# Calubration:
https://teachingtechyt.github.io/calibration.html#esteps

## Extruder E-steps Calibration:

    M92: X80.04 Y80.04 Z400.48 E99.10
    
    New: E = 104.31579

## PID

    ; Hotend PID:
    M301 P9.12 I0.41 D50.98

    New:

        READ: #define DEFAULT_Kp 19.09
        READ: #define DEFAULT_Ki 0.92
        READ: #define DEFAULT_Kd 99.38

    ; Bed PID:
    M304 P124.55 I23.46 D165.29

    New:
    
        #define DEFAULT_bedKp 30.02
        #define DEFAULT_bedKi 5.16
        #define DEFAULT_bedKd 116.41

# Strange errors:

## busy: processing
Unknown command: "P0 B2G1 X92.000 Y84.500 E0.8042"

Unknown command: "Gok P0 248 Y100.651 E0.0028 F1750"
WARNING: Firmware unresponsive.  Attempting to force continue...

WARNING: Firmware unresponsive.  Attempting to force continue...
Unknown command: "ok P142 Y134.696 E0.0673 F2625

Attempting connection at \\.\COM5...
READ: start
  Connected to machine!
Last Updated: 2022-11-15 | Author: (CoolZeroNL, default config)
Compiled: Nov 30 2022
Free Memory: 2928  PlannerBufferBytes: 1344
V87 stored settings retrieved (626 bytes; crc 46077)
SD card released
Unknown command: "MeM105"

Unknown command: "ok P45.775 Y68.912 F6600"
busy: processing
Unknown command: "1 X184.001 Y103.705 E0.0110 F2800"

Unknown command: "ok P3 B482 Y65.702 E0.0072 F1750"
Unknown command: "ok P0 B714 Y143.023 E0.1339 F3500"
Unknown command: "P0 B3"
Unknown command: "4.430 Y50.149 E0.0046 F2625"
Unknown command: "0 B2"
Unknown command: "92.505 Y16.183 E0.0102"
Unknown command: "9"
Unknown command: "ok P0 000"
Unknown command: "57"
Unknown command: "ok P0816 Y45.279 E0.1075"