./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define BAUDRATE 250000     //JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define DEFAULT_NOMINAL_FILAMENT_DIA 3  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:    #define DEFAULT_Kp  29.89       // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:    #define DEFAULT_Ki   2.79       // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:    #define DEFAULT_Kd  80.19       // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define PIDTEMPBED  // JHG --> disabled big-bang will not be able to go higher then 75 degree
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define DEFAULT_bedKp 185.12                          // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define DEFAULT_bedKi 36.99                           // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define DEFAULT_bedKd 617.69                          // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define DEFAULT_bedKp 150.53                          // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define DEFAULT_bedKi 18.75                           // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define DEFAULT_bedKd 805.63                          // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define Z_MIN_ENDSTOP_INVERTING false       // Set to true to invert the logic of the endstop.   // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define Z_MIN_PROBE_ENDSTOP_INVERTING false // Set to true to invert the logic of the probe.     // JHG 3d touch
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:// #define Z_MIN_ENDSTOP_INVERTING true       // Set to true to invert the logic of the endstop.   // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:// #define Z_MIN_PROBE_ENDSTOP_INVERTING true // Set to true to invert the logic of the probe.     // JHG NPN-type sensor
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define DEFAULT_AXIS_STEPS_PER_UNIT   { 80, 80, 400, 485 }      // Bulldog XL extruder              // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define DEFAULT_MAX_FEEDRATE          { 300, 300, 5, 50 }       // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:// #define DEFAULT_MAX_ACCELERATION      { 300, 300, 100, 1000 } // --> org // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define DEFAULT_XJERK  5.0  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define DEFAULT_XJERK  10.0  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define DEFAULT_YJERK  10.0  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define DEFAULT_YJERK  5.0  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:// #define FIX_MOUNTED_PROBE     // JHG --> disable BLTOUCH
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define BLTOUCH // JHG  --> disable FIX_MOUNTED_PROBE
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define NOZZLE_TO_PROBE_OFFSET { 31.5, 0, -2.125 }  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define PROBING_MARGIN 10 // JHG -> adusted the bed size, and Y limit switch moved to the front by x mm
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define RESTORE_LEVELING_AFTER_G28  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define GRID_MAX_POINTS_X 6                       //JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define Z_SAFE_HOMING // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define REVERSE_ENCODER_DIRECTION // JHG  - right turn needs to be + value, 
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:// #define REPRAP_DISCOUNT_FULL_GRAPHIC_SMART_CONTROLLER  // JHG - Disbaled CR10 orginal LCD
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define MKS_MINI_12864_V3   // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:#define NEOPIXEL_LED  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define NEOPIXEL_TYPE             NEO_RGB // NEO_GRBW, NEO_RGBW, NEO_GRB, NEO_RBG, etc.    // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define NEOPIXEL_PIXELS              3 // Number of LEDs in the strip. (Longest strip when NEOPIXEL2_SEPARATE is disabled.) // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  // #define NEOPIXEL_STARTUP_TEST         // Cycle through colors at startup  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define NEOPIXEL_BKGD_INDEX_FIRST   0 // Index of the first background LED  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration.h:  #define NEOPIXEL_BKGD_COLOR { 255, 75, 0, 0 }  // R, G, B, W     // JHG - yellow
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration_adv.h:  #define LED_CONTROL_MENU    // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration_adv.h:  #define BABYSTEP_DISPLAY_TOTAL          // Display total babysteps since last G28 // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration_adv.h:  #define BABYSTEP_ZPROBE_OFFSET          // Combine M851 Z and Babystepping  // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration_adv.h:  // #define HOME_BEFORE_FILAMENT_CHANGE             // If needed, home before parking for filament change    // JHG
./configuration/creality_cr10_s4_mks_mini_12864_v3/bugfix-2.1.x/Configuration_adv.h:  #define FILAMENT_LOAD_UNLOAD_GCODES           // Add M701/M702 Load/Unload G-codes, plus Load/Unload in the LCD Prepare menu.   // JHG
