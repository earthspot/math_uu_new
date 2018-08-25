NB. UU: scientific units conversion package - test4
NB. Hive-off all *_test verbs and inserts from the source code
0 :0
Saturday 25 August 2018  23:58:24
)
smoutput PLS,'+++ test4.ijs - entered',PLS

cocurrent 'uu'

format_test=: 3 : 0
smoutput '+++ format_test: ENTER'
smoutput 'PI rad-->dms' ; 'dms' formatOUT PI
smoutput 'VEX=',VEX
smoutput '60 s-->hms' ; 'hms' formatOUT 60
smoutput 'VEX=',VEX
smoutput '--- format_test: EXIT'
)

format_test''

compatible_test=: 3 : 0
  NB. TEST ONLY -- try out verb: compatible
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

compatible_test''

ucode_test=: 3 :0
  NB. TEST ONLY -- try out verb: ucode
if. -.zeroifabsent'STARTED' do. i.0 0 return. end.
smoutput '+++ ucode_test: ENTER'
assert. 'm^2/K/s^2'	-: 0 ucode 'm² K⁻¹ s⁻²'  NB. SL not: ⁻¹
assert. 'm² K⁻¹ s⁻²'	-: 1 ucode 'm² K⁻¹ s⁻²'
assert. 'ft/(s s)'		-: 0 ucode 'ft/(s·s)'
assert. 'ft/(s·s)'		-: 1 ucode 'ft/(s·s)'
assert. 'm²/K/s²'		-:   ucode 'm^2/K/s^2'
smoutput '--- ucode_test: EXIT'
)

ucode_test''

uuniform=: 4 : 0
  NB. sets temporary value in UNICODE then does: uniform
RESTORED=. UNICODE
z=. uniform_uu_ y [UNICODE=: x
z [UNICODE=: RESTORED
)

uniform_test=: 3 : 0
  NB. TEST ONLY -- try out verb: uniform
if. -.zeroifabsent'STARTED' do. i.0 0 return. end.
smoutput '+++ uniform_test: ENTER'
assert. 'm m/(K s s)'	-: 0 uuniform 'm m/(K s s)'
assert. 'm m/(K s s)'	-: 1 uuniform 'm m/(K s s)'
assert. 'm m K⁻¹ s⁻¹ s⁻¹'	-: 2 uuniform 'm m/(K s s)'
assert. 'm·m·K⁻¹·s⁻¹·s⁻¹'	-: 3 uuniform 'm m/(K s s)'
assert. 'm^2/K/s^2'	-: 0 uuniform 'm^2/K/s^2'
assert. 'm²/(K s²)'	-: 1 uuniform 'm^2/K/s^2'
assert. 'm² K⁻¹ s⁻²'	-: 2 uuniform 'm^2/K/s^2'
assert. 'm²·K⁻¹·s⁻²'	-: 3 uuniform 'm^2/K/s^2'
assert. 'ft/s^2'		-: 0 uuniform 'ft/s^2'
assert. 'ft/s²'		-: 1 uuniform 'ft/s^2'
assert. 'ft s⁻²'		-: 2 uuniform 'ft/s^2'
assert. 'ft·s⁻²'		-: 3 uuniform 'ft/s^2'
smoutput '--- uniform_test: EXIT'
)

uniform_test''

NB. =========================================================
NB. format.ijs

0 :0
Sunday 19 August 2018  14:02:45
┌────────────────────────────────────────────────┐
│See temp 97 for new pattern-matching technique  │
│which combines give_* & take_* into just 1 verb │
│called: formatOUT                               │
└────────────────────────────────────────────────┘
New format verb based on daisychain
Tries each give (give_* verb) in turn until one exits normally,
 or giverr (the last one) is reached.
If a give fails, the next give gets tried.
If a give knows it's inappropriate, it calls: errif
 to force an error.
If it simply crashes, the same thing happens.
-
This arrangement allows ad-hoc 'give_' and 'take_' verbs
to be defined in the t-table itself (which is a J script).
-
 x-arg is a units, e.g. 'gbp'
 and y is the value to be formatted, e.g. to become: '£1.00'.
 giverr is only called if no "give-" verbs chime with: x.
)

0 :0
'C' fromKelvin 273.15 373.15
'F' fromKelvin 273.15 373.15
'Ro'fromKelvin 273.15 373.15
'N' fromKelvin 273.15 373.15
'De'fromKelvin 273.15 373.15
'Re'fromKelvin 273.15 373.15
'K' fromKelvin 273.15 373.15
'Ab' fromKelvin 273.15 373.15  NB. INVALID (no such scale)
-
'C' toKelvin 0 100
'F' toKelvin 32 212
'Ro'toKelvin 7.5 60
'N' toKelvin 0 33
'De'toKelvin 150 0
'Re'toKelvin 0 80
'K' toKelvin 273.15 373.15
'Ab' toKelvin 273.15 373.15  NB. INVALID (no such scale)
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
'Ab' give_deg 273.15  NB. INVALID (no such scale)
'Ab' give_deg 373.15  NB. INVALID (no such scale)
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
'able' fmt INVALID
'hms' fmt 1
'hms' fmt (s4h 4)+(s4min 2)+1  NB. 04:02:01
'dms' fmt PI
'dms' fmt (rad4deg 3)+(rad4amin 5)+(rad4asec 2)  NB. 3° 5' 2"
VEX
)


NB. main.ijs

0 :0
VERB: convert
-
Converts arbitrary compound units (str) to primitive SI-units as defined in: mks
Needed to compare two arbitrary units to see if compatible / inter-convertible.
Simplifies the result of a division of 2 physical quantities.
-
Returns 3-element: z
 (>{.z) is the canonical units (cu)
 (>{:z) is conversion factor (cf)
 (>1{z) is diagnostic only: the number of lookup-cycles.

Returns a canonical form (defined by: canon) to allow comparison using (-:).
 DEFN cunit: a canonical element, having prefix, scale and power, eg '/s^2'

Has a set of service-fns all with names cnv* ...
 cnvnon z  extract 1st non-mks cunit(, returns: cunit;residue
 cnvj t  cut t into: (1_if_prefixed_SL ; 10^n_scale ; unit ; ^n_repetition)
 cnvf t  lookup t in: units-->unitv, returns (factor ; units)
    -if not found, factor is _. -test using: isNaN f
 cnvv t  called by: cnvf
 j cnvi t  converts all SP<-->SL in cunits-str: t iff j=1
    - (j=1 iff the cunit of which t is the expansion had prefix SL

Uses: cnvnon to find first non-mks unit, t, 0=$t if no more units remaining.

A units str consists of a series of tokens called "cunits", order immaterial.
A cunit may be prefixed by SL (/) denoting denominator or by SP denoting numerator.

Fn: utoks tokenises a units str. ensures 1st cunit has a leading SP
 provided a leading SL is not already present. Uses sp1 to achieve this.

Since SP is a meaningful cunit prefix, use of: deb will expunge not only SP,SP
 but also any leading SP. But there must be a leading SP|SL.

Uses: cnvf to lookup (bare) unit in: units-->unitv
The expanded units tokens are then SUFFIXED to the unprocessed residue: rx
-we can do that since order of cunits is immaterial.

Fn: cnvf also returns conversion factor (f)

Finally when no more units to expand (max cycles=30 as failsafe)
 the result is converted to canonical form using: canon.
)

0 :0
convert
convert=: convertNEW
convert=: convertOLD
-
convert 'yd'
convert 'yd/s'     NB. │m/s│_│0.9144│
convert 'yd/h'     NB. │m/s│_│0.000254│
convert 'Hz'
convert 'GHz'
-
make_units=: make_unitsNEW
make_units=: make_unitsOLD
)

0 :0
deslash'ft/s^2'
)

0 :0
note 440		NB. A (concert-pitch is 440 Hz)
note 194.18	NB. G (earth-rotation musical note)
)

NB. pp_encoding.ijs

0 :0
make_unitc''		NB. 1st pass
VALIDATE_unitc''
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
xxu 18 19
xxu 30 + i.10
dip uvalx ~: uvalc
)

0 :0
tv 1  NB. trace: qtcode4i qtcode4anyunit qtcode4bareunit scale4bareunit
tv '+cnvCunit'
-
qtcode4bareunit 'acre'    NB. │4046.86│4│
-
cocurrent 'uu'
erase 'foo_uu_ foo_z_ foo__'
foo_z_=: scale4bareunit_uu_
foo_z_=: cnvj_uu_
foo_z_=: qtcode4bareunit_uu_
redux 10  NB. foo_z_=: cnvCunit_uu_
redux 11  NB. foo_z_=: qtcode4anyunit_uu_
redux 12  NB. foo_z_=: [: uuOLD '1 ' , ]
redux 13  NB. foo_z_=: convert_uu_
redux 14  NB. (test of UNICODE levels)
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