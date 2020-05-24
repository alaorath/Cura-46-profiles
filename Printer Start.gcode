; Ender 3 Custom Start G-code
; updated 2020-04-24

M140 S{material_bed_temperature_layer_0} ;Start heating bed (non-blocking)
M104 S{material_standby_temperature} ;Start heating extruder for priming (non-blocking)

M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

G90 ;Absolute positionning
G28 X Y ;Home XY only
M84 E ; disable just the stepper motor (to allow for manual priming)

M109 S{material_standby_temperature} ; wait for extruder to reach minimum temp
M190 S{material_bed_temperature_layer_0} ;Wait for bed to reach temp before proceeding

G28 Z  ;Home Z

M117 Heating Extruder...
M104 S{material_print_temperature_layer_0} ;Start heating to initial print temp (non-blocking)
G1 Z10 ; raise a bit to clear corner clips
G1 F1500 X1 ;move to actual zero of bed
G92 X0      ;re-zero X
G1 F2400 X20 Z50  ; raise high to allow for ooze (and manual nozzle wiping)

M83 ; Extruder to relative
G1 F2400 E{retraction_amount}
G1 F2400 E{retraction_amount}

M109 S{material_print_temperature_layer_0} ;Wait for extruder to reach temp before proceeding
; Descend and "wiggle" to have the ooze clear the bed
G1 F2400 E0.5 X100 Z40
G1 F2400 E0.5 X50 Z20
G1 F2400 E0.5 X100 Z1
G1 F600 X50 Z0.05 E-2
G92 E0    ;re-zero extruder
M82 ; Extruder to absolute

; wipe ozze off on edge of buildplate
G1 F200 Y3
G92 Y0      ;re-zero Y
G1 F2400 Y3 Z1