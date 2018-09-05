	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Wednesday 29 August 2018  03:45:10
-
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

register=: 3 : 0
  NB. for use in give_ verbs only
  NB. reports the last give_* verb to be entered
VEX=: y
)

format=: formatOUT=: '' ddefine
0 pushme'formatOUT'
msg '+++ formatOUT: ENTERED, x=[(x)] y=[(y)]'
NO_UNITS_NEEDED=: 0
kx=. bris x  NB. work internally in kosher units
z=. kx daisychain y
msg '--- formatOUT: EXITS, last give_ verb: (VEX) -returns z=(z)'
0 popme'formatOUT'
z return.
)

make_daisychain=: 3 : 0
  NB. makes the daisychain for: formatOUT
>z=. 'give_' nl 3
]z=. (; z,each <' ::'),'giverr'
daisychain=: 13 : ('x(',z,')y')
i.0 0
)

giverr=: 4 : 0
msg '>>> giverr: none chime: x=(x) y=(y)'
sw'(y) [??]'
)

deg_symbol=: 3 : 0
if. UNICODE>0 do. '°' else. 'deg' end.
)

deEuroName=: 3 : 0
  NB. asciify extended-Latin surname
y rplc 'é';'e' ; 'ø';'oe'
)

NB. toC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. 100*(y-f)%r
NB. )

toK=: (4 : 0)"0
f=. {:>x
r=. -/>x
ICE_K + 100*(y-f)%r
)

NB. smoutput 'Reaumur-->K';		(<bf) toK bf [ bf=: 80 0
NB. smoutput 'Celsius-->K';		(<bf) toK bf [ bf=: 100 0
NB. smoutput 'Fahrenheit-->K';	(<bf) toK bf [ bf=: 212 32
NB. smoutput 'Kelvin-->K';		(<bf) toK bf [ bf=: ICE_K+100 0

NB. fromC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. f+r*y%100
NB. )

fromK=: (4 : 0)"0
f=. {:>x
r=. -/>x
f+r*(y-ICE_K)%100
)

Kr=: ICE_K + 100 0

NB. smoutput 'K-->Reaumur';		(<bf) fromK Kr [ bf=: 80 0
NB. smoutput 'K-->Celsius';		(<bf) fromK Kr [ bf=: 100 0
NB. smoutput 'K-->Fahrenheit';	(<bf) fromK Kr [ bf=: 212 32
NB. smoutput 'K-->Kelvin';		(<bf) fromK Kr [ bf=: ICE_K+100 0


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
 case. 'K'	do.	bf=. ICE_K+100 0
 case.    	do.	bf=. _ _
end.
)

toKelvin=: 'F' ddefine
  NB. convert y [x-units] into Kelvin
  NB. e.g. 'C'toKelvin 0 --> 273.15
try. z=. y toK~ <boil_freeze x
     if. z<0 do. INVALID return. end.
catch. INVALID end.
)

fromKelvin=: 'F' ddefine
  NB. convert (Kelvin) y [K] into temperature scale (lit) x
  NB. e.g. 'C'fromKelvin 273.15 --> 0
NB. ssw '+++ fromKelvin: T=x=(x) y=(y)'
if. y<0 do. INVALID return. end.
try. y fromK~ <boil_freeze x
catch. INVALID end.
)

give_0_deg=: 4 : 0
register'give_0_deg'
  NB. outputs (Kelvin) y [K] converted to scale (x)
unit=. ,x
assert. isTemperature unit
T=. shorT unit
NB. T=: {.dedeg unit  NB. the identifying temperature scale letter
NB. if. T e. 'RD' do. T=. 2{.dedeg unit end. NB. take leading 2 letters
z=. T fromKelvin y
msg '... give_0_deg: x=(x) y=(y) unit=(unit) T=(T) z=(z)'
if. T-:'K' do.
  NO_UNITS_NEEDED=: 1
  sw'(z) K'	NB. [K] qty does not have deg_symbol
else.
  NO_UNITS_NEEDED=: 1
  sw'(z)(deg_symbol 0)(T)'  NB. (T) not (unit) - use short-form after °
end.
)

0 :0
'degC' give_0_deg 373.15		NB. 100°C	√
'degF' give_0_deg 373.15		NB. 32°F	√
uu '100 degC'
   'degC' 	uu '100 degC'	NB. 100°C	√
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

give_8_misc=: 4 : 0
register'give_8_misc'
  NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. invalid y do. 'INVALID' return. end.
if. UNICODE>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

give_9_general=: 4 : 0
register'give_9_general'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last in: 'give_1_' nl 3
unit=. x
msg '... give_9_general: x=(x) y=(y) unit=(unit)'
sw'(y) (unit)'
)

isTime=: 4 : 0
(<,x) e. compatlist 's'
)

s4hms=: 24 60 60 #. 3 {. ]
s4h=: 3600 * ]
s4min=: 60 * ]
h4s=: 3600 %~ ]
min4s=: 60 %~ ]

give_0_hms=: 4 : 0
register'give_0_hms'
  NB. converts seconds [s] to hh:mm:ss
assert. x -: 'hms'  NB. force error if wrong verb
NB. if. y-:'' do. y=. s4hms 23 59 59.567 end. ---DOUBTFUL
'hh mm ss'=.":each 24 60 60 #: y
if. 10>".hh do. hh=. '0',hh end.
if. 10>".mm do. mm=. '0',mm end.
if. 10>".ss do. ss=. '0',ss end.
sw'(hh):(mm):(ss)'
)

isAngle=: 4 : 0
x-: 'deg'
)

d4dms=: 1296000x %~ 360 60 60 #. 3 {. ]

deg4rad=: 13 : '180 * y%o.1'
amin4rad=: 13 : '60 * deg4rad y'
asec4rad=: 13 : '3600 * deg4rad y'
rad4deg=: 13 : '(o.|y) % 180'
rad4amin=: 13 : 'rad4deg y % 60'
rad4asec=: 13 : 'rad4deg y % 3600'

give_0_dms=: 4 : 0
register'give_0_dms'
  NB. converts radians [rad] to d° m' s"
assert. x -: 'dms'  NB. force error if wrong verb
NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
'd m s'=.":each <.each 360 60 60 #: asec4rad |y
ds=. deg_symbol''
sw'(d)(ds) (m)(QT) (s)"'
)

give_1_note=: 4 : 0
register'give_1_note'
assert. x -: 'note'  NB. force error if wrong verb
sw'(note y) note' [ NO_UNITS_NEEDED=: 1
)

give_1_sci=: 4 : 0
register'give_1_sci'
  NB. force error if wrong verb
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_1_sci: x=(x) y=(y) z=(z) unit=(unit)'
z return.
)

give_1_sig=: give_1_sci

make_daisychain''