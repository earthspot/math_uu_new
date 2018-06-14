NB. UU: scientific units conversion package - test
0 :0
Wednesday 13 June 2018  15:30:35
-
Sample statements to test verb: uu
)
smoutput '=== test.ijs - entered'

cocurrent 'uu'

trace 1
trace 0
make_msg 1	NB. enable diagnostics
make_msg 0	NB. DISABLE diagnostics
uunicode''	NB. query setting
uunicode 0	NB. no unicode
uunicode 1	NB. unicoded with slashes
uunicode 2	NB. unicoded with negative powers
	uu '100 degC'
	uu '212 degF'
'degC' 	uu '100 degC'
'degF' 	uu '100 degC'
'degC' 	uu '212 degF'
'degC' 	uu 373.16 ; 'K'
'degF' 	uu 373.16 ; 'K'
'Fahrenheit'	uu 373.16 ; 'K'
'Centigrade'	uu 373.16 ; 'K'
'Celsius' 	uu 373.16 ; 'K'
'degC' 	uu '373.16 K'
'degF' 	uu '373.16 K'
'Fahrenheit'	uu '373.16 K'
'Centigrade'	uu '373.16 K'
'Celsius'	uu '373.16 K'

uu '1 Ohm'
'Ω' uu '6.000 kg m²/A²/s³'
'Ohm' uu '6.000 kg m²/A²/s³'
'Ω' uu '6.000 kg m^2/A^2/s^3'
'Ohm' uu '6.000 kg m^2/A^2/s^3'
uu '6.000 kg m²/A²/s³'
uu '6.000 kg m^2/A^2/s^3'

uu '1 s'		NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
'h' uu '1 d'
uu '1 d'
uu '1 /d'
uu 1 ; '/d'
'Hz' uu 1 ; '/d'
'Hz' uu '1 /d'
'note' uu '1 /d'
'note' uu '440 Hz'	NB. A440 pitch standard

smoutput '=== test1.ijs - completed'