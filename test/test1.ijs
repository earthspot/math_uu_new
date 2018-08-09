NB. UU: scientific units conversion package - test1
0 :0
Friday 15 June 2018  11:41:19
-
Sample statements to test verb: uu
>>> AT PRESENT DOES NOTHING !!!
>>> TURN THESE STATEMENTS INTO asserts by usng: Run > All Lines  ⇧⌘E
)
smoutput '+++ test1.ijs - entered'

cocurrent 'uu'

0 :0
   uunicode''	NB. query setting
2
   uunicode 0	NB. no unicode
0
   uunicode 1	NB. unicoded with slashes
1
   uunicode 2	NB. unicoded with negative powers
2
   	uu '100 degC'
373.150 K
   	uu '212 degF'
373.150 K
   'degC' 	uu '100 degC'
100 °C
   'degF' 	uu '100 degC'
212 °F
   'degC' 	uu '212 degF'
100 °C
   'degC' 	uu 373.16 ; 'K'
┌──────┬──┐
│100.01│°C│
└──────┴──┘
   'degF' 	uu 373.16 ; 'K'
┌───────┬──┐
│212.018│°F│
└───────┴──┘
   'Fahrenheit'	uu 373.16 ; 'K'
┌───────┬──────────┐
│212.018│Fahrenheit│
└───────┴──────────┘
   'Centigrade'	uu 373.16 ; 'K'
┌──────┬──────────┐
│100.01│Centigrade│
└──────┴──────────┘
   'Celsius' 	uu 373.16 ; 'K'
┌──────┬───────┐
│100.01│Celsius│
└──────┴───────┘
   'degC' 	uu '373.16 K'
100.010 °C
   'degF' 	uu '373.16 K'
212.018 °F
   'Fahrenheit'	uu '373.16 K'
-247.652° Fahrenheit
   'Centigrade'	uu '373.16 K'
-173.140° Centigrade
   'Celsius'	uu '373.16 K'
-173.140° Celsius
   
   uu '1 Ohm'
1 kg m² A⁻² s⁻³
   'Ω' uu '6.000 kg m²/A²/s³'
6 Ω
   'Ohm' uu '6.000 kg m²/A²/s³'
6 Ω
   'Ω' uu '6.000 kg m^2/A^2/s^3'
6 Ω
   'Ohm' uu '6.000 kg m^2/A^2/s^3'
6 Ω
   uu '6.000 kg m²/A²/s³'
6 kg m² A⁻² s⁻³
   uu '6.000 kg m^2/A^2/s^3'
6 kg m² A⁻² s⁻³
   
   uu '1 s'
1 s
   'h' uu '1 d'
24 h
   uu '1 d'
86400 s
   uu '1 /d'
1.157E-5 s⁻¹
   uu 1 ; '/d'
┌──────────┬───┐
│1.15741e_5│s⁻¹│
└──────────┴───┘
   'Hz' uu 1 ; '/d'
┌──────────┬──┐
│1.15741e_5│Hz│
└──────────┴──┘
   'Hz' uu '1 /d'
1.157E-5 Hz
   'note' uu '1 /d'
G note
   'note' uu '440 Hz'	NB. A440 pitch standard
A note
)

smoutput '--- test1.ijs - completed'

NB. ---------------------------------------------------------

0 :0
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

uu '1 s'
'h' uu '1 d'
uu '1 d'
uu '1 /d'
uu 1 ; '/d'
'Hz' uu 1 ; '/d'
'Hz' uu '1 /d'
'note' uu '1 /d'
'note' uu '440 Hz'	NB. A440 pitch standard
)