Special note for dual/multi extrusion
By default, Marlin expects the e-steps for each of your extruders to be the same. To work around this, you must compile with DISTINCT_E_FACTORS uncommented/enabled in configuration.h:


You will then be able to enter a unique M92 value for each extruder.