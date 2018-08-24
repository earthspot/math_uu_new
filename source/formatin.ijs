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

formatIN=: ''&$: :(4 : 0)
pushme'formatIN'
  NB. y is right arg of uu_uu - the input string for conversion
blink 0	NB. turn blink-1 OFF to start with
kx=. UNICODE kosher x
z=. kx daisychainIN y
msg '... last take: (VEXIN) -returns z=(z)'
popme'formatIN'
z return.
)

make_daisychainIN=: 3 : 0
  NB. makes the daisychain for: formatIN
>z=. 'take_' nl 3
]z=. (; z,each <' ::'),'takerr'
daisychainIN=: 13 : ('x(',z,')y')
i.0 0
)

takerr=: 4 : 0
msg '>>> takerr: none chime: x=(x) y=(y)'
sw'(y) [???]'
)

NB. deg_symbol=: 3 : 0
NB. if. UNICODE>0 do. '°' else. 'deg' end.
NB. )

NB. kosher=: 4 : 0
NB.   NB. convert (utf-8) y to pure ascii form
NB.   NB. called like this: UNICODE kosher 'Å/Ω'
NB. if. x=0 do.
NB. z=. 0 ucode y
NB. z rplc 'é';'e' ; 'ø';'oe'
NB. else. y end.
NB. )

NB. toC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. 100*(y-f)%r
NB. )

NB. toK=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. ICE_K + 100*(y-f)%r
NB. )
NB. smoutput 'Reaumur-->K';		(<bf) toK bf [ bf=: 80 0
NB. smoutput 'Celsius-->K';		(<bf) toK bf [ bf=: 100 0
NB. smoutput 'Fahrenheit-->K';	(<bf) toK bf [ bf=: 212 32
NB. smoutput 'Kelvin-->K';		(<bf) toK bf [ bf=: ICE_K + 100 0

NB. fromC=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. f+r*y%100
NB. )

NB. fromK=: (4 : 0)"0
NB. f=. {:>x
NB. r=. -/>x
NB. f+r*(y-ICE_K)%100
NB. )
NB.
NB. Kr=: ICE_K+100 0
NB. smoutput 'K-->Reaumur';		(<bf) fromK Kr [ bf=: 80 0
NB. smoutput 'K-->Celsius';		(<bf) fromK Kr [ bf=: 100 0
NB. smoutput 'K-->Fahrenheit';	(<bf) fromK Kr [ bf=: 212 32
NB. smoutput 'K-->Kelvin';		(<bf) fromK Kr [ bf=: ICE_K+100 0
NB.
NB.
NB. boil_freeze=: 3 : 0
NB.   NB. returns (water boils),(water freezes) for scale: y
NB. select. y
NB.  case. 'C'	do.	bf=. 100 0
NB.  case. 'F'	do.	bf=. 212 32
NB.  case. 'Ro'	do.	bf=. 60 7.5
NB.  case. 'N'	do.	bf=. 33 0
NB.  case. 'De'	do.	bf=. 0 150
NB.  case. 'Ra'	do.	bf=. 671.64 491.67
NB.  case. 'Re'	do.	bf=. 80 0
NB.  case. 'K'	do.	bf=. ICE_K+100 0
NB.  case.    	do.	bf=. _ _
NB. end.
NB. )

NB. toKelvin=: 'F' ddefine
NB.   NB. convert y [x-units] into Kelvin
NB.   NB. e.g. 'C'toKelvin 0 --> 273.15
NB. try. z=. y toK~ <boil_freeze x
NB.      if. z<0 do. INVALID return. end.
NB. catch. INVALID end.
NB. )

NB. fromKelvin=: 'F' ddefine
NB.   NB. convert (Kelvin) y [K] into temperature scale (lit) x
NB.   NB. e.g. 'C'fromKelvin 273.15 --> 0
NB. if. y<0 do. INVALID return. end.
NB. try. y fromK~ <boil_freeze x
NB. catch. INVALID end.
NB. )

take_1_deg=: 4 : 0
registerIN'take_1_deg'
  NB. accepts (Kelvin) y [K] in form of scale (x)
  NB. force error if wrong verb…
assert. any 'deg' E. x
if. (unit=. ,x) beginsWith 'deg' do. unit=. SP-.~ 3}.unit end.
T=. {.unit  NB. the identifying 1st letter
if. T e. 'RD' do. T=. 2{.unit end. NB. take 2nd letter too
z=. T fromKelvin y
msg '... take_1_deg: x=(x) y=(y) unit=(unit) T=(T) z=(z)'
if. T='K' do.
NB.   NO_UNITS_NEEDED=: 1
  sw'(z) K'	NB. does not have deg_symbol
else.
NB.   NO_UNITS_NEEDED=: 1
  sw'(z)(deg_symbol 0)(T)'
end.
)

0 :0
'degC' take_1_deg '373.15 K'

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

take_8_misc=: 4 : 0
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

take_9_general=: 4 : 0
registerIN'take_9_general'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last of all
unit=. x
z=. y	NB. FOR THE PRESENT: DOES NOTHING <<<<<<<<<<<<<<<<<<
msg '... take_9_general: x=(x) unit=(unit) y=(y) --> z=(z)'
z return.
)

NB. WHY NOT?--
NB. take_9_general=: ]

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
NB. take_1_hms=: 4 : 0
NB. registerIN'take_1_hms'
NB.   NB. converts seconds [s] to hh:mm:ss
NB. errif x ~: 'hms'  NB. force error if wrong verb
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
NB. take_1_dms=: 4 : 0
NB. registerIN'take_1_dms'
NB.   NB. converts radians [rad] to d° m' s"
NB. errif x ~: 'dms'  NB. force error if wrong verb
NB. NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
NB. 'd m s'=.":each <.each 360 60 60 #: asec4rad |y
NB. ds=. deg_symbol''
NB. sw'(d)(ds) (m)(QT) (s)"'
NB. )
NB.
NB. take_1_note=: 4 : 0
NB. registerIN'take_1_note'
NB. errif -. x -: 'note'  NB. force error if wrong verb
NB. sw'(note y) note' [ NO_UNITS_NEEDED=: 1
NB. )
NB.
NB. take_1_sci=: 4 : 0
NB. registerIN'take_1_sci'
NB.   NB. force error if wrong verb
NB. z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
NB. unit=. x
NB. msg '... take_1_sci: x=(x) y=(y) z=(z) unit=(unit)'
NB. z return.
NB. )
NB.
NB. take_1_sig=: take_1_sci

make_daisychainIN''