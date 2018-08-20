	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Monday 20 August 2018  01:48:31
-
for hived-off test-phrases see:
ot 18
)

register=: 3 : 0
  NB. housekeeping for the last give_* verb to be entered
VEX=: y
)

formatNEW=: ''&$: :(4 : 0)
pushme'formatNEW'
NO_UNITS_NEEDED=: 0
kx=. UNICODE kosher x
z=. kx daisychain y
msg '... last give: (VEX)'
popme'formatNEW'
z return.
)

intersect=: ] -. -.~  NB. y dictates the order

make_daisychain=: 3 : 0
  NB. makes the daisychain for: formatNEW
  NB. Preferred orders:
NB. │give_deg│give_dms│give_hms│give_misc│give_sci│give_sig│give_general│
>PRE=. ;:'give_dms give_hms give_deg'  NB. try these first
>POST=. ;:'give_misc give_general'  NB. try these last
>z=. 'give_' nl 3
>z=. z intersect PRE,(z -. PRE,POST),POST
CHAIN=: z
]z=. (; z,each <' ::'),'giverr'
daisychain=: 13 : ('x(',z,')y')
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
  NB. e.g. 'C'toKelvin 0 --> 273.15
try. z=. y toK~ <boil_freeze x
     if. z<0 do. INVALID return. end.
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
  NB. convert (Kelvin) y [K] into temperature scale (lit) x
  NB. e.g. 'C'fromKelvin 273.15 --> 0
if. y<0 do. INVALID return. end.
try. y fromK~ <boil_freeze x
catch. INVALID end.
)

NB. >>>>>>>>>>> GETTING CALLED WITH y NOT IN Kelvin.
give_deg=: 4 : 0
register'give_deg'
  NB. outputs (Kelvin) y [K] in scale (x)
  NB. force error if wrong verb…
errif -. any 'deg' E. x
if. (unit=. ,x) beginsWith 'deg' do. unit=. SP-.~ 3}.unit end.
T=. {.unit  NB. the identifying 1st letter
if. T e. 'RD' do. T=. 2{.unit end. NB. take 2nd letter too
z=. T fromKelvin y
msg '... give_deg: x=(x) y=(y) unit=(unit) T=(T) z=(z)'
if. T='K' do.
  NO_UNITS_NEEDED=: 1
  sw'(z) K'	NB. does not have deg_symbol
else.
  NO_UNITS_NEEDED=: 1
  sw'(z)(deg_symbol 0)(T)'
end.
)

0 :0
'degC' give_deg 100
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

give_misc=: 4 : 0
register'give_misc'
	NB. picks up miscellaneous forms
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

give_general=: 4 : 0
register'give_general'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last in: 'give_' nl 3
unit=. x
msg '... give_general: x=(x) y=(y) unit=(unit)'
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

give_hms=: 4 : 0
register'give_hms'
  NB. converts seconds [s] to hh:mm:ss
errif x ~: 'hms'  NB. force error if wrong verb
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

give_dms=: 4 : 0
register'give_dms'
  NB. converts radians [rad] to d° m' s"
errif x ~: 'dms'  NB. force error if wrong verb
NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
'd m s'=.":each <.each 360 60 60 #: asec4rad |y
ds=. deg_symbol''
sw'(d)(ds) (m)(QT) (s)"'
)

give_note=: 4 : 0
register'give_note'
errif -. x -: 'note'  NB. force error if wrong verb
sw'(note y) note' [ NO_UNITS_NEEDED=: 1
)

give_sci=: 4 : 0
register'give_sci'
  NB. force error if wrong verb
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_sci: x=(x) y=(y) z=(z) unit=(unit)'
z return.
)

give_sig=: give_sci

make_daisychain''