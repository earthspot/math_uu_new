	NB. uu - formatin.ijs
'==================== [uu] formatin.ijs =================='
0 :0
Sunday 7 October 2018  15:11:37
-
formatIN -- input-counterpart to: format
)

cocurrent 'uu'
	
registerIN=: 3 : 0
  NB. for use in take_ verbs only
  NB. reports the last take_* verb to be entered
NB. ssw '+++ registerIN: (y)'
VEXIN=: y
)

0 :0
formatIN '100 °C'
)

formatIN=: 3 : 0
0 pushme'formatIN'
msg '+++ formatIN: ENTERED, y=[(y)]'
  NB. y is right arg of uu_uu - the input string for conversion
blink 0	NB. turn blink-1 OFF to start with
VEXIN=: '<UNSET>'
z=. daisychainIN y
msg '--- formatIN: EXITS, last take_ verb: (VEXIN) kuy=(kuy) -returns z=(z)'
0 popme'formatIN'
z return.
)

make_daisychainIN=: 3 : 0
  NB. makes the daisychain for: formatIN
  NB. NOTE: take_ verbs are all MONADIC
>z=. 'take_' nl 3
]z=. (; z,each <' ::'),'takerr'
daisychainIN=: 13 : ('(',z,')y')
i.0 0
)

takerr=: 3 : 0
msg '>>> takerr: none chime: x=(x) y=(y)'
sw'(y) [???]'
)

valueOf=: 3 : 0
  NB. extract the (numeric) value of (qty-string) y
  NB. c/f eval
try. val=. ". strValueOf y
catch. _. end.
)

strValueOf=: 3 : 0
  NB. extract the (numeral-string) value of (qty-string) y
  NB. c/f eval
SP taketo y rplc (deg_symbol 0) ; SP
)

unitsOf=: 3 : 0
  NB. extract the (utf-8 string) units of (qty-string) y
numeral=. strValueOf y
deb y }.~ #numeral
)

dedeg=: 3 : 0
  NB. remove leading: 'deg'
y=. deb y
if. y beginsWith 'deg' do. dlb 3}.y else. y end.
)

0 :0
brack dedeg 'degC'
brack dedeg 'deg C'
brack dedeg ' degC'
brack dedeg ' deg C'
)

shorT=: 3 : 0
  NB. the identifying temperature scale letter(s) (1 or 2)
  NB. y-- temperature unit, e.g. 'degC' or 'Réaumur'
y=. dedeg deEuroName y
T=. {.y
if. T e. 'RD' do. T=. 2{.y end. NB. take leading 2 letters
)

0 :0
brack shorT 'degC'
brack shorT 'deg C'
brack shorT ' degC'
brack shorT ' deg C'
brack shorT 'Réaumur'
deEuroName 'Réaumur'
brack shorT 'Reaumur'
)

take_0_angle=: 3 : 0
registerIN 'take_0_angle'
blink'green'
  NB. inputs angle y (degrees); outputs laundered y
  NB. since angle is scalable, does not need to convert to rad
  NB. Ensure postfixed 'deg' hasn't run-into the value…
yb=. (bris y) rplc 'deg' ; ' deg'
]unit=. deb unitsOf yb
assert. (unit-:'deg')or(unit-:'rad')
yb return.
)

0 :0
foo=: uu
foo=: take_0_angle
foo '180°'
foo '180 °'
foo '180deg'
foo '180 deg'
foo '1 rad'
foo 'PI rad'
foo 'π rad'
'deg' uu 'PI rad'
'°' uu 'PI rad'
'deg' uu 'π rad'
uu 'π rad'
'°' uu 'π rad'
)

take_1_Cent=: 3 : 0
registerIN 'take_1_Cent'
blink'magenta'
]unit=. deb bris unitsOf y
assert. unit-:'Cent'
valu=. valueOf y
disp=. displacement unit
sllog 'VEXIN y valu unit disp'
assert. -.undefined valu=. valueOf y
NB. sw'(valu+disp) K'
sw'(valu) (unit)'
)
0 :0
take_1_Cent '1 Cent'
uu '1 Cent'
'Cent' uu '1 b.p'
)

take_1_Fahr=: 3 : 0	NB. CANT GET IT TO WORK YET
registerIN 'take_1_Fahr'
blink'cyan'
]unit=. deb bris unitsOf y
assert. unit-:'Fahr'
valu=. valueOf y
disp=. displacement unit
sllog 'VEXIN y valu unit disp'
assert. -.undefined valu=. valueOf y
NB. sw'(valu+disp) K'
sw'(valu) (unit)'
)
0 :0
VEXIN ; VEX
take_1_Fahr '32 Fahr'
         uu '32 Fahr'
         uu '32 ft'
'Fahr'   uu '32 Fahr'
         uu '212 Fahr'
       uu '1 f.p'
'Fahr' uu '1 f.p'
       uu '1 b.p'
'Fahr' uu '1 b.p'
)

take_1_FahR=: 3 : 0	NB. CANT GET IT TO WORK YET
registerIN 'take_1_FahR'
blink'cyan'
]unit=. deb bris unitsOf y
assert. unit-:'FahR'
valu=. valueOf y
disp=. displacement unit
sllog 'VEXIN y valu unit disp'
assert. -.undefined valu=. valueOf y
NB. sw'(valu+disp) K'
sw'(valu) (unit)'
)
0 :0
VEXIN ; VEX
take_1_FahR '32 FahR'
         uu '32 FahR'
         uu '32 ft'
'FahR'   uu '32 FahR'
         uu '212 FahR'
       uu '1 f.p'
'FahR' uu '1 f.p'
       uu '1 b.p'
'FahR' uu '1 b.p'
)



0 :0
take_1_deg=: 3 : 0
registerIN 'take_1_deg'
blink'red'
  NB. inputs (any temperature qty) y; outputs Kelvin [K]
  NB. Ensure postfixed 'deg' hasn't run-into the value…
y=. y rplc 'deg' ; ' deg'
]unit=. deb bris unitsOf y
assert. isTemperature unit
]T=. shorT unit
NB. T=: {.dedeg unit  NB. the identifying temperature scale letter
NB. if. T e. 'RD' do. T=: 2{.dedeg unit end. NB. take leading 2 letters
msg '... take_1_deg: unit=[(unit)] T=(T)'
assert. -.undefined vy=. valueOf y
]z=. T toKelvin vy
msg '... take_1_deg: y=[(y)] unit=(unit) T=(T) z=(z)'
sw'(z) K'  NB. since uu expects (value) z in Kelvin
)

0 :0
uu '100 degC'
'degC' uu '100 degC'
'degC' uu '212 degF'
take_1_deg '100 degC'
take_1_deg '212 degF'
take_1_deg '212degF'
take_1_deg '212 °F'
take_1_deg '212°F'
-
REMAINING BLINKS...
blink 'yellow'
blink 'flame'
)

take_8_misc=: 3 : 0
registerIN'take_8_misc'
blink 'blue'
  NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞' else. infinity=. 'infinity' end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0  NB. force error if has not already return.ed
)

take_9_general=: 3 : 0
registerIN'take_9_general'
blink'white'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last of all
z=. y	NB. FOR THE PRESENT: DOES NOTHING <<<<<<<<<<<<<<<<<<
msg '... take_9_general: y=(y) --> z=(z)'
z return.
)

sval_unit=: '' ddefine
  NB. returns combined string with val,SP,unit
sval=. SP taketo y -. '°'
if. 0<#x do. 
  unit=. bris x
else.
  unit=. bris SP takeafter y
end.
sval,SP,unit
)

split_val_unit=: 3 : 0
  NB. returns numeric val ; string unit using ONLY y
val=. ". SP taketo y -. '°'
unit=. bris SP takeafter y
val ; unit
)

make_daisychainIN''