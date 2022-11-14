# Configuration.h

|2.0                                                        |2.1.1                                                       | |
|-----------------------------------------------------------|------------------------------------------------------------|-|
|                                                           | #define SWITCHING_NOZZLE_SERVO_DWELL 2500                  | // Dwell time to wait for servo to make physical move
| #define DEFAULT_MAX_FEEDRATE       { 250, 250, 5, 25 }    | #define DEFAULT_MAX_FEEDRATE      { 300, 300, 5, 25 }      | 
| #define DEFAULT_MAX_ACCELERATION   { 750, 750, 100, 500 } | #define DEFAULT_MAX_ACCELERATION  { 3000, 3000, 100, 500 } | 
| #define DEFAULT_EJERK    5.0                              | #define DEFAULT_EJERK    1.0                               | // May be used by Linear Advance
| #define S_CURVE_ACCELERATION                              | //#define S_CURVE_ACCELERATION                             | // This option eliminates vibration during printing by fitting a Bézier curve to move acceleration, producing much smoother direction changes.
| #define LEVEL_BED_CORNERS                                 | //#define LEVEL_BED_CORNER                                 | // Add a menu item to move between bed corners for manual bed adjustment
| #define XY_SKEW_FACTOR 0.0                                | //#define XY_SKEW_FACTOR 0.0                               | // Or, set the XY skew factor directly
|
 

## Tuning
|-----------------------------------------------------------|------------------------------------------------------------|-|
| #define DEFAULT_ACCELERATION          800                 | #define DEFAULT_ACCELERATION                  1000  (1500)       | // X, Y, Z ... and E acceleration for printing moves
| #define DEFAULT_RETRACT_ACCELERATION  500                 | #define DEFAULT_RETRACT_ACCELERATION          800   (1500)       | // E acceleration for retracts
| #define DEFAULT_TRAVEL_ACCELERATION   1000                | #define DEFAULT_TRAVEL_ACCELERATION           1500  (3000)       | // X, Y, Z ... acceleration for travel (non printing) moves


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


# look into:
    prepare for ABS
    prepare for PLA...

    menu shows only one..