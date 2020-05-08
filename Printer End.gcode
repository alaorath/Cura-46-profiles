G91 ;Relative positioning
G1 E-2 F2700 ;Retract a bit
G1 E-{retraction_amount} Z0.2 F2400 ;Retract and raise Z
G1 Z10 ;Raise Z more
G90 ;Absolute positionning

G1 F3000 X10 Y200	; present print

M106 S0 ;Turn-off fan
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed

M84 ;Disable all steppers