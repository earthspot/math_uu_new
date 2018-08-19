	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

NB. ┌────────────────────────────────────────────────┐
NB. │See DEV 97 for new pattern-matching technique   │
NB. │which combines input & output into a single verb│
NB. │called: formatNEW                                 │
NB. └────────────────────────────────────────────────┘

NB. This is a new version, based on the 'errif' technique
NB. Every (pro)verb beginning 'take_' gets tried in turn
NB.  until one works.

NB. A corresponding set of (pro)verbs beginning 'give_'
NB. accept input in a variety of formats and convert them
NB. to a quantity (a scalar number)
NB. Both 'give_' and 'take_' verbs are maintained as a single
NB. collection in this script.
NB.
NB. This arrangement allows ad-hoc 'give_' and 'take_' verbs
NB. to be defined in the t-table itself (which is a J script).

NB.  x-arg is a units, e.g. 'gbp'
NB.  and y is the value to be formatted, e.g. to become: '£1.00'.
NB.  giverr is only called if no "give-" verbs chime with: x.

formatNEW=: ''&$: :(4 : 0)
pushme'formatNEW'
CC=: _1  NB. TEST ONLY: chain-counter, indexes the aux verb which chimes
kx=. UNICODE kosher x
z=. kx daisychain y
popme'formatNEW'
smoutput CC ; (>CC{CHAIN) ; CHAIN
z return.
)

make_daisychain=: 3 : 0
  NB. makes the daisychain for: formatNEW
]z=. 'give_' nl 3
CHAIN=: z
]z=. ; z,each <' :: '
]z=. 'x(' ,z, 'giverr)y'
daisychain=: 13 : z
i.0 0
)

giverr=: 4 : 0
msg '>>> giverr: none chime: x=(x) y=(y)'
sw'(y) ??'
)

deg_symbol=: 3 : 0
if. UNICODE>0 do. '°' else. 'deg' end.
)

kosher=: 4 : 0
  NB. convert (utf-8) y to pure ascii form
  NB. called like this: UNICODE kosher 'Å/Ω'
if. x=0 do.
z=. 0 ucode y
z rplc 'é';'e' ; 'ø';'oe'
else. y end.
)

NB. toC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. 100*(y-f)%r
NB. )

toK=: (4 : 0)"0
f=. {:>x
r=. -/>x
273.15 + 100*(y-f)%r
)
smoutput 'Reaumur-->K';		(<bf) toK bf [ bf=: 80 0
smoutput 'Celsius-->K';		(<bf) toK bf [ bf=: 100 0
smoutput 'Fahrenheit-->K';	(<bf) toK bf [ bf=: 212 32
smoutput 'Kelvin-->K';		(<bf) toK bf [ bf=: 373.15 273.15

NB. fromC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. f+r*y%100
NB. )

fromK=: (4 : 0)"0
f=. {:>x
r=. -/>x
f+r*(y-273.15)%100
)

Kr=: 373.15 273.15
smoutput 'K-->Reaumur';		(<bf) fromK Kr [ bf=: 80 0
smoutput 'K-->Celsius';		(<bf) fromK Kr [ bf=: 100 0
smoutput 'K-->Fahrenheit';	(<bf) fromK Kr [ bf=: 212 32
smoutput 'K-->Kelvin';		(<bf) fromK Kr [ bf=: 373.15 273.15


boil_freeze=: 3 : 0
  NB. returns (water boils),(water freezes) for scale: y
select. y
 case. 'C'	do.	bf=. 100 0
 case. 'F'	do.	bf=. 212 32
 case. 'Ro'	do.	bf=. 60 7.5
 case. 'N'	do.	bf=. 33 0
 case. 'De'	do.	bf=. 0 150
 case. 'Ra'	do.	bf=. 671.64 491.67
 case. 'Re'	do.	bf=. 80 0
 case. 'K'	do.	bf=. 373.15 273.15
 case.    	do.	bf=. _ _
end.
)

NB. toKelvin=: 'F' ddefine
NB.   NB. convert y [x-units] into Kelvin
NB.   NB. e.g. 'C'forKelvin 273.15 --> 0
NB. select. x
NB.  case. 'C'	do.	bf=. 100 0
NB.  case. 'F'	do.	bf=. 212 32
NB.  case. 'Ro'	do.	bf=. 60 7.5
NB.  case. 'N'	do.	bf=. 33 0
NB.  case. 'De'	do.	bf=. 0 150
NB.  case. 'Ra'	do.	bf=. 671.64 491.67
NB.  case. 'Re'	do.	bf=. 80 0
NB.  case. 'K'	do.	bf=. 373.15 273.15
NB.  case.    	do.	INVALID return.
NB. end.
NB. (<bf) toK y
NB. )

toKelvin=: 'F' ddefine
  NB. convert y [x-units] into Kelvin
  NB. e.g. 'C'forKelvin 273.15 --> 0
try. y toK~ <boil_freeze x
catch. INVALID end.
)

NB. fromKelvin=: 'F' ddefine
NB.   NB. convert y [K] into temperature scale (lit) x
NB.   NB. e.g. 'C'forKelvin 273.15 --> 0
NB. select. x
NB.  case. 'C'	do.	bf=. 100 0
NB.  case. 'F'	do.	bf=. 212 32
NB.  case. 'Ro'	do.	bf=. 60 7.5
NB.  case. 'N'	do.	bf=. 33 0
NB.  case. 'De'	do.	bf=. 0 150
NB.  case. 'Ra'	do.	bf=. 671.64102 491.67
NB.  case. 'Re'	do.	bf=. 80 0
NB.  case. 'K'	do.	bf=. 373.15 273.15
NB.  case.    	do.	INVALID return.
NB. end.
NB. (<bf) fromK y
NB. )

fromKelvin=: 'F' ddefine
  NB. convert y [K] into temperature scale (lit) x
  NB. e.g. 'C'forKelvin 273.15 --> 0
try. y fromK~ <boil_freeze x
catch. INVALID end.
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

give_deg=: 4 : 0
	NB. outputs y [K] in scale (x)
CC=: CC+1
  NB. force error if wrong verb
if. (unit=. ,x) beginsWith 'deg' do. unit=. SP-.~ 3}.unit end.
T=. {.unit  NB. the identifying 1st letter
if. T e. 'RD' do. T=. 2{.unit end. NB. take 2nd letter too
z=. T fromKelvin y
ssw '... give_deg: x=(x) y=(y) unit=(unit) T=(T) z=(z)'
if. T='K' do.
  sw'(z) K'	NB. does not have deg_symbol
else.
  sw'(z)(deg_symbol 0) (T)'
end.
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

give_misc=: 4 : 0
	NB. picks up miscellaneous forms
CC=: CC+1
if. undefined y do. 'UNDEFINED' return. end.
if. invalid y do. 'INVALID' return. end.
if. UNICODE>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
errif 1
)

give_zz=: 4 : 0
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last in: 'give_' nl 3
CC=: CC+1
unit=. x
msg '... give_zz: x=(x) y=(y) unit=(unit)'
sw'(y) (unit)'
)

isTime=: 4 : 0
(<,x) e. compatlist 's'
)

s4hms=. 24 60 60 #. 3 {. ]

give_hms=: 4 : 0
CC=: CC+1
errif -. x isTime y
  NB. force error if wrong verb
if. y-:'' do. y=. s4hms 23 59 59.567 end.
'h m s'=.": each 24 60 60 #: y
if. 10>".h do. h=. '0',h end.
if. 10>".m do. m=. '0',m end.
if. 10>".s do. s=. '0',s end.
sw'(h):(m):(s)'
)

isAngle=: 4 : 0
x-: 'deg'
)

d4dms=. 1296000x %~ 360 60 60 #. 3 {. ]

give_dms=: 4 : 0
CC=: CC+1
  NB. force error if wrong verb
errif -. x isAngle y
if. y-:'' do. y=. d4dms 3 59 59 end.
'd m s'=.": each 360 60 60 #: 3600*|y
if. 10>".d do. h=. '0',d end.
if. 10>".m do. m=. '0',m end.
if. 10>".s do. s=. '0',s end.
sw'(d)(deg_symbol'') (m)(QT) (s)"'
)

give_sci=: 4 : 0
CC=: CC+1
  NB. force error if wrong verb
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_sci: x=(x) y=(y) z=(z) unit=(unit)'
sw'(z) (unit)'
)

give_sig=: give_sci

make_daisychain''

0 :0
fmt=: formatOLD
fmt=: formatNEW
'Celsius' fmt 373.15
'able' fmt 99
'able' fmt __
'able' fmt UNDEFINED
'able' fmt INVALID
'min' fmt 121
CC ; (>CC{CHAIN) ; CHAIN
)