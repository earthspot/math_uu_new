NB. uu - run

0 :0
open '~Release/uu.ijs'
)
load '~Release/uu.ijs'	NB. self-starts

smoutput uu '3 ft'
smoutput uu '1 yd'
smoutput uu '1 min'
smoutput 'ft' uu '1 yd'
smoutput 'yd' uu '6 ft'
smoutput 'km' uu '56789 m'

uunicode 0	NB. no unicode in units
smoutput uu '15 Ang/s/s'
smoutput 'Ang' uu '1 mm'
smoutput 'Ang/s^2' uu '0.0001 ft/s/s'
smoutput 'ft/s^2' uu '1 Å h⁻²'
smoutput 'ft/s^2' uu '1 Å/h^2'
smoutput 'ft/s^2' uu '1 Å/h/h'
smoutput 'ft/s^2' uu '1 Ang/h/h'

uunicode 1	NB. unicoded with slashes
smoutput uu '15 Ang/s/s'
smoutput 'Ang' uu '1 mm'
smoutput 'Ang/s^2' uu '0.0001 ft/s/s'
smoutput 'ft/s^2' uu '1 Å h⁻²'
smoutput 'ft/s^2' uu '1 Å/h^2'
smoutput 'ft/s^2' uu '1 Å/h/h'
smoutput 'ft/s^2' uu '1 Ang/h/h'

uunicode 2	NB. unicoded with negative powers
smoutput uu '15 Ang/s/s'
smoutput 'Ang' uu '1 mm'
smoutput 'Ang/s^2' uu '0.0001 ft/s/s'
smoutput 'ft/s^2' uu '1 Å h⁻²'
smoutput 'ft/s^2' uu '1 Å/h^2'
smoutput 'ft/s^2' uu '1 Å/h/h'
smoutput 'ft/s^2' uu '1 Ang/h/h'


0 :0
empty uunicode 2
uu '15 Ang/s/s'
'Ang' uu '1 mm'
'Ang/s^2' uu '0.0001 ft/s/s'
'ft/s^2' uu '1 Å h⁻²'
'ft/s^2' uu '1 Å/h^2'
'ft/s^2' uu '1 Å/h/h'
'ft/s^2' uu '1 Ang/h/h'
)

0 : 0
NB. More sample statements
uunicode 0	NB. no unicode
uunicode 1	NB. unicoded with slashes
uunicode 2	NB. unicoded with negative powers
		uu '100 degC'
		uu '212 degF'
'degC' 		uu '100 degC'
'degF' 		uu '100 degC'
'degC' 		uu '212 degF'
'degC' 		uu 373.16 ; 'K'
'degF' 		uu 373.16 ; 'K'
'Fahrenheit'	uu 373.16 ; 'K'
'Centigrade'	uu 373.16 ; 'K'
'Celsius' 	uu 373.16 ; 'K'
'degC' 		uu '373.16 K'
'degF' 		uu '373.16 K'
'Fahrenheit'	uu '373.16 K'
'Centigrade'	uu '373.16 K'
'Celsius'		uu '373.16 K'
		uu '1 Ohm'
'Ω' 		uu '6.000 kg m²/A²/s³'
'Ohm' 		uu '6.000 kg m²/A²/s³'
'Ω' 		uu '6.000 kg m^2/A^2/s^3'
'Ohm' 		uu '6.000 kg m^2/A^2/s^3'
		uu '6.000 kg m²/A²/s³'
		uu '6.000 kg m^2/A^2/s^3'
		uu '1 d'
		uu '1 /d'
		uu 1 ; '/d'
'Hz' 		uu 1 ; '/d'
'Hz' 		uu '1 /d'
'note' 		uu '1 /d'
'note' 		uu '440 Hz'  NB. "A440" pitch standard
)
