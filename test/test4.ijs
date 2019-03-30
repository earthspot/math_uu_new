NB. UU: scientific units conversion package - test4
NB. Hive-off all *_test verbs and inserts from the source code
NB. (from temp 18)
NB. component tests of: format compatible ucode uniform
NB. plus a lot of misc tests as 0:0 inserts
0 :0
Saturday 6 October 2018  22:50:17
)
smoutput PLS,'+++ test4.ijs - entered',PLS

cocurrent 'base'

format_test=: 3 : 0 ''
formatOUT=. formatOUT_uu_
smoutput '+++ format_test: ENTER'
smoutput 'PI rad-->dms' ; 'dms' formatOUT PI
smoutput 'VEX=',VEX
smoutput '60 s-->hms' ; 'hms' formatOUT 60
smoutput 'VEX=',VEX
smoutput '--- format_test: EXIT'
)

compatible_test=: 3 : 0 ''
compatible=. compatible_uu_
smoutput '+++ compatible_test: ENTER'
assert. '*' compatible ,'m'
assert. '*' compatible 'kg'
assert. '!' compatible ,'m'
assert. '!' compatible 'kg'
assert. (,'*') compatible ,'m'
assert. (,'*') compatible 'kg'
assert. (,'!') compatible ,'m'
assert. (,'!') compatible 'kg'
assert. (,'J') compatible 'cal'
assert. (,'J') compatible 'kcal'
smoutput '--- compatible_test: EXIT'
)

ucode_test=: 3 :0 ''
ucode=. ucode_uu_
smoutput '+++ ucode_test: ENTER'
assert. 'm^2/K/s^2'	-: 0 ucode 'm² K⁻¹ s⁻²'  NB. SL not: ⁻¹
assert. 'm² K⁻¹ s⁻²'	-: 1 ucode 'm² K⁻¹ s⁻²'
assert. 'ft/(s s)'		-: 0 ucode 'ft/(s·s)'
assert. 'ft/(s·s)'		-: 1 ucode 'ft/(s·s)'
assert. 'm²/K/s²'		-:   ucode 'm^2/K/s^2'
smoutput '--- ucode_test: EXIT'
)

uniform_test=: 3 : 0 ''
uniform=. uniform_uu_
smoutput '+++ uniform_test: ENTER'
assert. 'm m/(K s s)'	-: 0 uniform 'm m/(K s s)'
assert. 'm m/(K s s)'	-: 1 uniform 'm m/(K s s)'
assert. 'm m K⁻¹ s⁻¹ s⁻¹'	-: 2 uniform 'm m/(K s s)'
assert. 'm·m·K⁻¹·s⁻¹·s⁻¹'	-: 3 uniform 'm m/(K s s)'
assert. 'm^2/K/s^2'	-: 0 uniform 'm^2/K/s^2'
assert. 'm²/(K s²)'	-: 1 uniform 'm^2/K/s^2'
assert. 'm² K⁻¹ s⁻²'	-: 2 uniform 'm^2/K/s^2'
assert. 'm²·K⁻¹·s⁻²'	-: 3 uniform 'm^2/K/s^2'
assert. 'ft/s^2'		-: 0 uniform 'ft/s^2'
assert. 'ft/s²'		-: 1 uniform 'ft/s^2'
assert. 'ft s⁻²'		-: 2 uniform 'ft/s^2'
assert. 'ft·s⁻²'		-: 3 uniform 'ft/s^2'
smoutput '--- uniform_test: EXIT'
)

NB. NB. >>> COVERED BY redux 21 ...
NB. fromKelvin_test=: 3 : 0 ''
NB. fromKelvin=. fromKelvin_uu_
NB. smoutput '+++ fromKelvin_test: ENTER'
NB. assert. 0 100		-: 'C' fromKelvin 273.15 373.15
NB. assert. 32 212		-: 'F' fromKelvin 273.15 373.15
NB. assert. 7.5 60		-: 'Ro'fromKelvin 273.15 373.15
NB. assert. 0 33		-: 'N' fromKelvin 273.15 373.15
NB. assert. 150 0		-: 'De'fromKelvin 273.15 373.15
NB. assert. 0 80		-: 'Re'fromKelvin 273.15 373.15
NB. assert. 273.15 373.15	-: 'K' fromKelvin 273.15 373.15
NB. assert. 			128!:5 'Ab' fromKelvin 273.15 373.15
NB.   NB. (no such scale)
NB. smoutput '--- fromKelvin_test: EXIT'
NB. )


0 :0
'C' toKelvin 0 100
'F' toKelvin 32 212
'Ro'toKelvin 7.5 60
'N' toKelvin 0 33
'De'toKelvin 150 0
'Re'toKelvin 0 80
'K' toKelvin 273.15 373.15
'Ab' toKelvin 273.15 373.15  NB. _. (no such scale)
)

0 :0
'degC' give_deg 373.15
'deg C' give_deg 373.15
'Celsius' give_deg 373.15
'C' give_deg 273.15
'C' give_deg 373.15
'F' give_deg 273.15
'F' give_deg 373.15
'Ro' give_deg 273.15
'Ro' give_deg 373.15
'N' give_deg 273.15
'N' give_deg 373.15
'De' give_deg 273.15
'De' give_deg 373.15
'Re' give_deg 273.15
'Re' give_deg 373.15
'K' give_deg 273.15
'K' give_deg 373.15
'Ab' give_deg 273.15  NB. _. (no such scale)
'Ab' give_deg 373.15  NB. _. (no such scale)
)

0 :0
deg4rad PI        NB. 180°
amin4rad PI%60    NB. 180'
asec4rad PI%3600  NB. 180"
)

0 :0
fmt=: formatOLD
fmt=: formatOUT
'Celsius' fmt 373.15
'able' fmt 99
'able' fmt __
'able' fmt UNDEFINED
'hms' fmt 1
'hms' fmt (s4h 4)+(s4min 2)+1  NB. 04:02:01
'dms' fmt PI
'dms' fmt (rad4deg 3)+(rad4amin 5)+(rad4asec 2)  NB. 3° 5' 2"
VEX
)


NB. main.ijs

0 :0
deslash'ft/s^2'
)

0 :0
note 440           NB. A (concert-pitch is 440 Hz)
note 194.18        NB. G (earth-rotation musical note)
)

NB. pp_encoding.ijs

0 :0
make_unitc''		NB. 1st pass
dip 0=uvalc
2 make_unitc''	NB. 2nd pass
3 make_unitc''	NB. 3rd pass
4 make_unitc''	NB. 4th pass
)

0 :0
	units	nominal units in UUC, e.g. [Ohm]
	unitv	units on which UUC defn is based
	unitx	unitv expanded into fundamental units
	uvalu	conversion factor explicit in UUC
	uvalx	conversion factor to go with unitx
	uvalc	conversion factor to go with unitc
	unitc	pp-coded units, expandcode must match unitx
)

0 :0
qtcode4i 59
VIEWTABLE=: 10  NB. number of lines in viewtable output
smoutput vt 59
dip uvalx ~: uvalc
)

0 :0
trv 1  NB. trace: qtcode4i qtcode4anyunit qtcode4bareunit scale4bareunit
trv '+cnvCunit'
-
qtcode4bareunit 'acre'    NB. │4046.86│4│
-
cocurrent 'uu'
erase 'foo_uu_ foo_z_ foo__'
foo_z_=: scale4bareunit_uu_
foo_z_=: cnvCunit_uu_
foo_z_=: qtcode4bareunit_uu_
redux 10  NB. foo_z_=: cnvCunit_uu_
redux 11  NB. foo_z_=: qtcode4anyunit_uu_
redux 12  NB. foo_z_=: [: uuOLD '1 ' , ]
redux 13  NB. foo_z_=: convert_uu_
redux 14  NB. (test of SI-conformance levels)
redux 15  NB. foo_z_=: [: uuNEW '1 ' , ]
)

0 :0
'ft/s^2' uu '1 Å h⁻²'
x_uu_=:'ft/s^2' [ y_uu_=: '1 Å h⁻²'
        uu '100 degC'
        uu '212 degF'
        uu '373.15 K'
 'degF' uu '100 degC'
 'degC' uu '212 degF'
 'degF' uu '212 degF'
 'degC' uu '100 degC'
)

smoutput PLS,'--- test4.ijs - completed',PLS