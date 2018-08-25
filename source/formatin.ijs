	NB. uu - formatin.ijs
'==================== [uu] formatin.ijs =================='
0 :0
Friday 24 August 2018  21:40:43
-
formatIN -- input-counterpart to: format
ot 17	NB. calcmd -from TABULA
	...but style of programming so alien that it isn't much use.
ot 18	NB. hived-off component-test phrases
-
STRATEGY: hedge bets by simply converting string--> string, e.g...
   '100 degC' --> '373.15 K'
   '212 degF' --> '373.15 K'
-
       uuNEW	'373.15 K'	NB. 373.15 K
'degC' uuNEW	'373.15 K'
'degF' uuNEW	'373.15 K'
'degF' formatIN	'373.15 K'	NB. 373.15 K
	...NOT formatIN's biz to use [x] EXCEPT to disambiguate.
'degF' take_deg	'373.15 K'
)

cocurrent 'uu'
	
registerIN=: 3 : 0
  NB. for use in take_ verbs only
  NB. reports the last take_* verb to be entered
VEXIN=: y
blink y
)

0 :0
'degC' formatIN '100 °C'
)

formatIN=: 3 : 0
0 pushme'formatIN'
msg '+++ formatIN: ENTERED, y=[(y)]'
  NB. y is right arg of uu_uu - the input string for conversion
blink 0	NB. turn blink-1 OFF to start with
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
try. val=. ". strValueOf y
catch. INVALID end.
)

strValueOf=: 3 : 0
  NB. extract the (numeral-string) value of (qty-string) y
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

take_0_deg=: 3 : 0
registerIN 'take_0_deg'
  NB. inputs (any temperature qty) y; outputs Kelvin [K]
  NB. Ensure 'deg' doesn't run-into the value…
unit=. deb (bris unitsOf y) rplc 'deg' ; ' deg'
assert. isTemperature unit
T=. shorT unit
NB. T=: {.dedeg unit  NB. the identifying temperature scale letter
NB. if. T e. 'RD' do. T=: 2{.dedeg unit end. NB. take leading 2 letters
msg '... take_0_deg: unit=[(unit)] T=(T)'
assert. -.invalid vy=. valueOf y
]z=. T toKelvin vy
msg '... take_0_deg: y=[(y)] unit=(unit) T=(T) z=(z)'
sw'(z) K'  NB. since uu expects (value) z in Kelvin
)

0 :0
uu '100 degC'
'degC' 	uu '100 degC'

       take_0_deg '100 degC'
'degC' take_0_deg '373.15 K'

uu '100 degC'
   'degC' 	uu '100 degC'
100°C
   'degF' 	uu '100 degC'	NB. X
   'degF' 	uu '100 °C'	NB. X
212°F
   'degC' 	uu '212 degF'
100°C
   'degC' 	uu '373.16 K'
100.01°C
   'degF' 	uu '373.16 K'  NB. X
212.018°F
   'Fahrenheit'	uu '373.16 K'  NB. X
212.018° Fahrenheit
   'Centigrade'	uu '373.16 K'  NB. X
100.01° Centigrade
   'Celsius'	uu '373.16 K'  NB. X
100.01° Celsius
)

take_8_misc=: 3 : 0
registerIN'take_8_misc'
	NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. invalid y do. 'INVALID' return. end.
if. UNICODE>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0  NB. force error if has not already return.ed
)

take_9_general=: 3 : 0
registerIN'take_9_general'
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


NB. isTime=: 4 : 0
NB. (<,x) e. compatlist 's'
NB. )
NB.
NB. s4hms=: 24 60 60 #. 3 {. ]
NB. s4h=: 3600 * ]
NB. s4min=: 60 * ]
NB. h4s=: 3600 %~ ]
NB. min4s=: 60 %~ ]
NB.
NB. take_0_hms=: 3 : 0
NB. registerIN'take_0_hms'
NB.   NB. converts seconds [s] to hh:mm:ss
NB. errif x ~: 'hms'  NB. force error if wrong verb --------NO x
NB. NB. if. y-:'' do. y=. s4hms 23 59 59.567 end. ---DOUBTFUL
NB. 'hh mm ss'=.":each 24 60 60 #: y
NB. if. 10>".hh do. hh=. '0',hh end.
NB. if. 10>".mm do. mm=. '0',mm end.
NB. if. 10>".ss do. ss=. '0',ss end.
NB. sw'(hh):(mm):(ss)'
NB. )
NB.
NB. isAngle=: 4 : 0
NB. x-: 'deg'
NB. )
NB.
NB. d4dms=: 1296000x %~ 360 60 60 #. 3 {. ]
NB.
NB. deg4rad=: 13 : '180 * y%o.1'
NB. amin4rad=: 13 : '60 * deg4rad y'
NB. asec4rad=: 13 : '3600 * deg4rad y'
NB. rad4deg=: 13 : '(o.|y) % 180'
NB. rad4amin=: 13 : 'rad4deg y % 60'
NB. rad4asec=: 13 : 'rad4deg y % 3600'
NB.
NB. take_0_dms=: 3 : 0
NB. registerIN'take_0_dms'
NB.   NB. converts radians [rad] to d° m' s"
NB. errif x ~: 'dms'  NB. force error if wrong verb --------NO x
NB. NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
NB. 'd m s'=.":each <.each 360 60 60 #: asec4rad |y
NB. ds=. deg_symbol''
NB. sw'(d)(ds) (m)(QT) (s)"'
NB. )
NB.
NB. take_1_note=: 3 : 0
NB. registerIN'take_1_note'
NB. errif -. x -: 'note'  NB. force error if wrong verb --------NO x
NB. sw'(note y) note' [ NO_UNITS_NEEDED=: 1
NB. )
NB.
NB. take_1_sci=: 3 : 0
NB. registerIN'take_1_sci'
NB.   NB. force error if wrong verb
NB. z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
NB. unit=. x --------NO
NB. msg '... take_1_sci: x=(x) y=(y) z=(z) unit=(unit)'
NB. z return.
NB. )
NB.
NB. take_1_sig=: take_1_sci

make_daisychainIN''