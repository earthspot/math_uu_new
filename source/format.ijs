	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Sunday 19 August 2018  14:02:45
┌────────────────────────────────────────────────┐
│See temp 97 for new pattern-matching technique  │
│which combines give_* & take_* into just 1 verb │
│called: formatNEW                               │
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

register=: 3 : 0
  NB. housekeeping for the last give_* verb to be entered
VEX=: y
)

formatNEW=: ''&$: :(4 : 0)
pushme'formatNEW'
kx=. UNICODE kosher x
z=. kx daisychain y
popme'formatNEW'
smoutput '+++ last give: ',VEX
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
register'give_deg'
  NB. outputs y [K] in scale (x)
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


0 :0
deg4rad PI        NB. 180°
amin4rad PI%60    NB. 180'
asec4rad PI%3600  NB. 180"
)

give_sci=: 4 : 0
register'give_sci'
  NB. force error if wrong verb
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_sci: x=(x) y=(y) z=(z) unit=(unit)'
sw'(z) (unit)'
)

give_sig=: give_sci

make_daisychain''

format_test=: 3 : 0
smoutput 'PI rad-->dms' ; 'dms' give_dms PI
smoutput '60 s-->hms' ; 'hms' give_hms 60
)

NB. format_test''

0 :0
fmt=: formatOLD
fmt=: formatNEW
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