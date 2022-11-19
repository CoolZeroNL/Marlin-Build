<!-- https://forum.simplify3d.com/viewtopic.php?t=3144&start=10 -->

<!-- TOC -->

- [Starting script](#starting-script)
- [Ending script](#ending-script)
- [Retraction script](#retraction-script)
- [Tool change script](#tool-change-script)
- [Post processing](#post-processing)

<!-- /TOC -->


# Starting script

A custom G code to be inserted at the very beginning. All speeds should be entered in mm / min.

You can use predefined variables:
| Variable                | Comment                                                                                 |
| ----------------------- | --------------------------------------------------------------------------------------- |
| extruder # _temperature | nozzle temperature, where # є [0..5] (only certain ones are substituted, c 4.1 - '-1'); |
| bed # _temperature      | table temperature, where # є [0..5] (only certain ones are substituted, c 4.1 - '-1');  |
| fan_speed_percentage    | fan speed in percent [0..100];                                                          |
| fan_speed_pwm           | fan speed [0..255];                                                                     |
| progress                | percentage of print (always like 0).                                                    |

Since version 4.1, added variables:
| Variable                    | comment                                                                                                                                                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| current_feature_type        | element type, one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield); |
| current_layer               | the current layer;                                                                                                                                                                                                            |
| current_layer_height        | current layer height;                                                                                                                                                                                                         |
| current_position_ $         | the current coordinates of the $ axis, where $ є [xyze];                                                                                                                                                                      |
| current_position_e #        | the current coordinates of the axis of the extruder, where # є [0..5];                                                                                                                                                        |
| next_position_ $            | the following coordinates of the $ axis, where $ є [xyz];                                                                                                                                                                     |
| current_tool                | current nozzle;                                                                                                                                                                                                               |
| first_tool                  | not clear;                                                                                                                                                                                                                    |
| last_tool                   | it is not clear;                                                                                                                                                                                                              |
| prime_distance              | extrusion distance after retraction;                                                                                                                                                                                          |
| prime_speed                 | extrusion speed after retraction, mm / min;                                                                                                                                                                                   |
| retract_distance            | retraction distance;                                                                                                                                                                                                          |
| retract_speed               | retraction speed, mm / min;                                                                                                                                                                                                   |
| retract_vertical_lift       | rising nozzle after retraction;                                                                                                                                                                                               |
| toolchange_prime_distance   | extrusion distance after retraction when changing the nozzle;                                                                                                                                                                 |
| toolchange_prime_speed      | extrusion speed after retraction when changing the nozzle, mm / min;                                                                                                                                                          |
| toolchange_retract_distance | retraction distance when changing the nozzle;                                                                                                                                                                                 |
| toolchange_retract_speed    | retraction speed when changing the nozzle, mm / min;                                                                                                                                                                          |
| xy_travel_speed             | speed of movement along the xy axes, mm / min;                                                                                                                                                                                |
| z_travel_speed              | speed of movement along the z axis, mm / min;                                                                                                                                                                                 |
| travel_speed                | travel speed, mm / min;                                                                                                                                                                                                       |
| chamber # _temperature      | it is not clear where # є [0..5];                                                                                                                                                                                             |
| fan # _speed_percentage     | it is not clear where # є [0..5];                                                                                                                                                                                             |
| fan # _speed_pwm            | it is not clear where # є [0..5];                                                                                                                                                                                             |
| total_filament_used         | length of the used bar;                                                                                                                                                                                                       |
| total_filament_weight       | weight of the bar used;                                                                                                                                                                                                       |
| total_filament_cost         | the cost of the used bar;                                                                                                                                                                                                     |
| total_filament_volume       | the volume of the used bar;                                                                                                                                                                                                   |
| total_print_time_min        | print time in minutes;                                                                                                                                                                                                        |
| total_print_time_sec        | print time in seconds;                                                                                                                                                                                                        |
| total_layer_count           | the number of layers;                                                                                                                                                                                                         |
| build_min_ $                | the minimum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_max_ $                | the maximum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_size_ $               | the size of the part along the axis, where $ є [xyz];                                                                                                                                                                         |
| extruder # _filament_used   | the length of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_weight | the weight of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_cost   | the cost of the rod used for the extruder, where # є [0..5];                                                                                                                                                                  |
| extruder # _filament_volume | the volume of the rod used for the extruder, where # є [0..5].                                                                                                                                                                |

Since version 4.1, added operators:
- {EVAL "xxx"} - the number xxx removes the last 0 and then the last '.'. For example, from 10,000 there will be 10, where xxx expression (using QJSEngine.toNumber (), JavaScript code interpreter);
- {IF "xxx"} zzz - when condition xxx is fulfilled, zzz is displayed, where xxx expression (used by QJSEngine.toBool (), JavaScript code interpreter). 

# Ending script

You can use predefined variables:
| Variable           | Comment                                |
| ------------------ | -------------------------------------- |
| current_Z_position | Z coordinates;                         |
| progress           | percentage of print (always like 100). |

Since version 4.1, added variables:
| Variable                    | Comment                                                                                                                                                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| extruder # _temperature     | nozzle temperature or -1, where # є [0..5];                                                                                                                                                                                   |
| bed # _temperature          | table temperature or -1, where # є [0..5];                                                                                                                                                                                    |
| chamber # _temperature      | it is not clear or -1, where # є [0..5];                                                                                                                                                                                      |
| fan_speed_percentage        | fan speed in percent [0..100];                                                                                                                                                                                                |
| fan_speed_pwm               | fan speed [0..255];                                                                                                                                                                                                           |
| fan # _speed_percentage     | it is not clear where # є [0..5];                                                                                                                                                                                             |
| fan # _speed_pwm            | it is not clear where # є [0..5];                                                                                                                                                                                             |
| current_feature_type        | element type, one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield); |
| current_layer               | the current layer;                                                                                                                                                                                                            |
| current_layer_height        | current layer height;                                                                                                                                                                                                         |
| current_position_ $         | the current coordinates of the $ axis, where $ є [xyze];                                                                                                                                                                      |
| current_position_e #        | the current coordinates of the axis of the extruder, where # є [0..5];                                                                                                                                                        |
| next_position_ $            | the following coordinates of the $ axis, where $ є [xyz];                                                                                                                                                                     |
| current_tool                | current nozzle;                                                                                                                                                                                                               |
| first_tool                  | not clear;                                                                                                                                                                                                                    |
| last_tool                   | it is not clear;                                                                                                                                                                                                              |
| prime_distance              | extrusion distance after retraction;                                                                                                                                                                                          |
| prime_speed                 | extrusion speed after retraction, mm / min;                                                                                                                                                                                   |
| retract_distance            | retraction distance;                                                                                                                                                                                                          |
| retract_speed               | retraction speed, mm / min;                                                                                                                                                                                                   |
| retract_vertical_lift       | rising nozzle after retraction;                                                                                                                                                                                               |
| toolchange_prime_distance   | extrusion distance after retraction when changing the nozzle;                                                                                                                                                                 |
| toolchange_prime_speed      | extrusion speed after retraction when changing the nozzle, mm / min;                                                                                                                                                          |
| toolchange_retract_distance | retraction distance when changing the nozzle;                                                                                                                                                                                 |
| toolchange_retract_speed    | retraction speed when changing the nozzle, mm / min;                                                                                                                                                                          |
| xy_travel_speed             | speed of movement along the xy axes, mm / min;                                                                                                                                                                                |
| z_travel_speed              | speed of movement along the z axis, mm / min;                                                                                                                                                                                 |
| travel_speed                | travel speed, mm / min;                                                                                                                                                                                                       |
| total_filament_used         | length of the used bar;                                                                                                                                                                                                       |
| total_filament_weight       | weight of the bar used;                                                                                                                                                                                                       |
| total_filament_cost         | the cost of the used bar;                                                                                                                                                                                                     |
| total_filament_volume       | the volume of the used bar;                                                                                                                                                                                                   |
| total_print_time_min        | print time in minutes;                                                                                                                                                                                                        |
| total_print_time_sec        | print time in seconds;                                                                                                                                                                                                        |
| total_layer_count           | the number of layers;                                                                                                                                                                                                         |
| build_min_ $                | the minimum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_max_ $                | the maximum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_size_ $               | the size of the part along the axis, where $ є [xyz];                                                                                                                                                                         |
| extruder # _filament_used   | the length of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_weight | the weight of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_cost   | the cost of the rod used for the extruder, where # є [0..5];                                                                                                                                                                  |
| extruder # _filament_volume | the volume of the rod used for the extruder, where # є [0..5].                                                                                                                                                                |

Since version 4.1, added operators:
- {EVAL "xxx"} - the number xxx removes the last 0 and then the last '.'. For example, from 10,000 there will be 10, where xxx expression (using QJSEngine.toNumber (), JavaScript code interpreter);
- {IF "xxx"} zzz - when condition xxx is fulfilled, zzz is displayed, where xxx expression (used by QJSEngine.toBool (), JavaScript code interpreter). 

# Retraction script

The following operators are supported:

- {EVAL "xxx"} - the number xxx removes the last 0 and then the last '.'. For example, from 10,000 there will be 10 (updated from version 4.1);
- {IF xxxOPyyy} zzz - when the condition is met, zzz is displayed (updated from version 4.1), where

    - OP - operation, one of (==,! =, <, <=,>,> =, =);
    - xxx may be:
    - TOOL - nozzle number, then yyy must be a number [0..5]
    - FEATURETYPE - element type, then yyy must be one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield)

You can use predefined variables:
| Variable              | Comment                                                                   |
| --------------------- | ------------------------------------------------------------------------- |
| retract_distance      | retraction distance;                                                      |
| prime_distance        | extrusion distance after retraction;                                      |
| retract_speed         | retraction speed;                                                         |
| travel_speed          | speed of movement;                                                        |
| current_position_ $   | the current coordinates of the $ axis, where $ є [xyz];                   |
| next_position_ $      | the following coordinates of the $ axis, where $ є [xyz];                 |
| previous_direction_ $ | previous shift of the $ axis, where $ є [xyz] (removed from version 4.1); |
| next_direction_ $     | the next shift of the $ axis, where $ є [xyz] (removed from version 4.1); |
| average_direction_ $  | not clear (removed from version 4.1).                                     |

Since version 4.1, added variables:
| Variable                                    | Comment                                                                                                                                                                                                                       |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| extruder # _temperature                     | nozzle temperature or -1, where # є [0..5];                                                                                                                                                                                   |
| bed # _temperature                          | table temperature or -1, where # є [0..5];                                                                                                                                                                                    |
| chamber # _temperature                      | it is not clear or -1, where # є [0..5];                                                                                                                                                                                      |
| fan_speed_percentage                        | fan speed in percent [0..100];                                                                                                                                                                                                |
| fan_speed_pwm                               | fan speed [0..255];                                                                                                                                                                                                           |
| fan # _speed_percentage                     | it is not clear where # є [0..5];                                                                                                                                                                                             |
| fan # _speed_pwm                            | it is not clear where # є [0..5];                                                                                                                                                                                             |
| current_feature_type                        | element type, one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield); |
| current_layer                               | the current layer;                                                                                                                                                                                                            |
| current_layer_height] current layer height; |                                                                                                                                                                                                                               |
| current_position_e #                        | the current coordinates of the axis of the extruder, where # є [0..5];                                                                                                                                                        |
| current_tool                                | current nozzle;                                                                                                                                                                                                               |
| first_tool                                  | not clear;                                                                                                                                                                                                                    |
| last_tool                                   | it is not clear;                                                                                                                                                                                                              |
| prime_speed                                 | extrusion speed after retraction, mm / min;                                                                                                                                                                                   |
| retract_vertical_lift                       | rising nozzle after retraction;                                                                                                                                                                                               |
| toolchange_prime_distance                   | extrusion distance after retraction when changing the nozzle;                                                                                                                                                                 |
| toolchange_prime_speed                      | extrusion speed after retraction when changing the nozzle, mm / min;                                                                                                                                                          |
| toolchange_retract_distance                 | retraction distance when changing the nozzle;                                                                                                                                                                                 |
| toolchange_retract_speed                    | retraction speed when changing the nozzle, mm / min;                                                                                                                                                                          |
| xy_travel_speed                             | speed of movement along the xy axes, mm / min;                                                                                                                                                                                |
| z_travel_speed                              | speed of movement along the z axis, mm / min;                                                                                                                                                                                 |
| progress                                    | percentage of print;                                                                                                                                                                                                          |
| total_filament_used                         | length of the used bar;                                                                                                                                                                                                       |
| total_filament_weight                       | weight of the bar used;                                                                                                                                                                                                       |
| total_filament_cost                         | the cost of the used bar;                                                                                                                                                                                                     |
| total_filament_volume                       | the volume of the used bar;                                                                                                                                                                                                   |
| total_print_time_min                        | print time in minutes;                                                                                                                                                                                                        |
| total_print_time_sec                        | print time in seconds;                                                                                                                                                                                                        |
| total_layer_count                           | the number of layers;                                                                                                                                                                                                         |
| build_min_ $                                | the minimum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_max_ $                                | the maximum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_size_ $                               | the size of the part along the axis, where $ є [xyz];                                                                                                                                                                         |
| extruder # _filament_used                   | the length of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_weight                 | the weight of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_cost                   | the cost of the rod used for the extruder, where # є [0..5];                                                                                                                                                                  |
| extruder # _filament_volume                 | the volume of the rod used for the extruder, where # є [0..5].                                                                                                                                                                |

Since version 4.1, added operators:
- {EVAL "xxx"} - the number xxx removes the last 0 and then the last '.'. For example, from 10,000 there will be 10, where xxx expression (using QJSEngine.toNumber (), JavaScript code interpreter);
- {IF "xxx"} zzz - when condition xxx is fulfilled, zzz is displayed, where xxx expression (used by QJSEngine.toBool (), JavaScript code interpreter).

# Tool change script

The following operators are supported:

- {IF xxxOPyyy} zzz - when the condition is met, zzz is displayed (updated from version 4.1), where

    - OP - operation, one of (==,! =, <, <=,>,> =, =);
    
    - xxx may be:
    - OLDTOOL - No. of the previous nozzle, then yyy must be a number [0..5]
    - NEWTOOL - No. of the new nozzle, then yyy must be a number [0..5]
    - FEATURETYPE - element type, then yyy must be one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield)

You can use predefined variables:
| Variable                    | Comment                                                                   |
| --------------------------- | ------------------------------------------------------------------------- |
| new_tool                    | No. of the new nozzle;                                                    |
| old_tool                    | number of the previous nozzle;                                            |
| travel_speed                | speed of movement;                                                        |
| toolchange_retract_speed    | retraction speed when changing the nozzle;                                |
| toolchange_retract_distance | retraction distance when changing the nozzle;                             |
| toolchange_prime_distance   | extrusion distance after retraction when changing the nozzle;             |
| extruder # _temperature     | nozzle temperature, where # є [0..5];                                     |
| bed # _temperature          | temperature of the table, where # є [0..5];                               |
| current_position_ $         | the current coordinates of the $ axis, where $ є [XYZ];                   |
| next_position_ $            | the following coordinates of the $ axis, where $ є [XYZ];                 |
| previous_direction_ $       | previous shift of the $ axis, where $ є [XYZ] (removed from version 4.1); |
| next_direction_ $           | the next shift of the $ axis, where $ є [XYZ] (removed from version 4.1); |
| average_direction_ $        | not clear (removed from version 4.1).                                     |

Since version 4.1, added variables:
| Variable                                    | Comment                                                                                                                                                                                                                       |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| chamber # _temperature                      | it is not clear or -1, where # є [0..5];                                                                                                                                                                                      |
| fan_speed_percentage                        | fan speed in percent [0..100];                                                                                                                                                                                                |
| fan_speed_pwm                               | fan speed [0..255];                                                                                                                                                                                                           |
| fan # _speed_percentage                     | it is not clear where # є [0..5];                                                                                                                                                                                             |
| fan # _speed_pwm                            | it is not clear where # є [0..5];                                                                                                                                                                                             |
| current_feature_type                        | element type, one of (travel, outer_perimeter, inner_perimeter, external_single_extrusion, internal_single_extrusion, gap_fill, solid_layer, infill, bridge, support, dense_support, raft, skirt, prime_pillar, ooze_shield); |
| current_layer                               | the current layer;                                                                                                                                                                                                            |
| current_layer_height] current layer height; |                                                                                                                                                                                                                               |
| current_position_e #                        | the current coordinates of the axis of the extruder, where # є [0..5];                                                                                                                                                        |
| current_tool                                | current nozzle;                                                                                                                                                                                                               |
| first_tool                                  | not clear;                                                                                                                                                                                                                    |
| first_tool_use                              | not clear;                                                                                                                                                                                                                    |
| last_tool                                   | it is not clear;                                                                                                                                                                                                              |
| prime_distance                              | extrusion distance after retraction;                                                                                                                                                                                          |
| prime_speed                                 | extrusion speed after retraction, mm / min;                                                                                                                                                                                   |
| retract_distance                            | retraction distance;                                                                                                                                                                                                          |
| retract_speed                               | retraction speed, mm / min;                                                                                                                                                                                                   |
| retract_vertical_lift                       | rising nozzle after retraction;                                                                                                                                                                                               |
| toolchange_prime_speed                      | extrusion speed after retraction when changing the nozzle, mm / min;                                                                                                                                                          |
| xy_travel_speed                             | speed of movement along the xy axes, mm / min;                                                                                                                                                                                |
| z_travel_speed                              | speed of movement along the z axis, mm / min;                                                                                                                                                                                 |
| progress                                    | percentage of print;                                                                                                                                                                                                          |
| total_filament_used                         | length of the used bar;                                                                                                                                                                                                       |
| total_filament_weight                       | weight of the bar used;                                                                                                                                                                                                       |
| total_filament_cost                         | the cost of the used bar;                                                                                                                                                                                                     |
| total_filament_volume                       | the volume of the used bar;                                                                                                                                                                                                   |
| total_print_time_min                        | print time in minutes;                                                                                                                                                                                                        |
| total_print_time_sec                        | print time in seconds;                                                                                                                                                                                                        |
| total_layer_count                           | the number of layers;                                                                                                                                                                                                         |
| build_min_ $                                | the minimum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_max_ $                                | the maximum coordinate of the part along the axis, where $ є [xyz];                                                                                                                                                           |
| build_size_ $                               | the size of the part along the axis, where $ є [xyz];                                                                                                                                                                         |
| extruder # _filament_used                   | the length of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_weight                 | the weight of the rod used for the extruder, where # є [0..5];                                                                                                                                                                |
| extruder # _filament_cost                   | the cost of the rod used for the extruder, where # є [0..5];                                                                                                                                                                  |
| extruder # _filament_volume                 | the volume of the rod used for the extruder, where # є [0..5].                                                                                                                                                                |

Since version 4.1, added operators:
- {EVAL "xxx"} - the number xxx removes the last 0 and then the last '.'. For example, from 10,000 there will be 10, where xxx expression (using QJSEngine.toNumber (), JavaScript code interpreter);
- {IF "xxx"} zzz - when condition xxx is fulfilled, zzz is displayed, where xxx expression (used by QJSEngine.toBool (), JavaScript code interpreter). 

# Post processing
Running scripts after creating the G-code file. For example, "notepad.exe" "[output_filepath]" You can use system variables (% programfiles%,% windir%, etc.) and predefined:
| Variable        | Comment                                  |
| --------------- | ---------------------------------------- |
| output_filename | file name without extension;             |
| output_filepath | the name of the file with the directory; |
| output_dir      | file directory;                          |
| install_dir     | dir                                      |