	NB. uu - constants.ijs
'==================== [uu] constants ===================='

cocurrent 'uu'

  NB. currency exchange-rate tables, used by: quoted
  NB. quoted currencies are expressed in terms of the Euro.
  NB. if net is accessible, CUTAB to be updated from Eurobank figures

  NB. SIC -- controls SI-compliance via utf-8 chars
  NB. SIC=0	units expressed entirely in ASCII
  NB. SIC=1	utf-8s e.g. Å but inverse shown as: /Å
  NB. SIC=2	utf-8, no '/'
  NB. SIC=3	utf-8, no '/', uses '·'

CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'	NB. initial short table
CUTAB=: CUTAB0			NB. pre-start value

BADQTY=: '0 ??'	NB. error returned qty by verb: uu
BOIL_F=: 212	NB. water boils [°F]
BOIL_C=: 100 	NB. water boils [°C]
BOIL_K=: 373.15	NB. water boils [K]
ICE_F=: 32	NB. water freezes [°F]
ICE_C=: 0 	NB. water freezes [°C]
ICE_K=: 273.15	NB. water freezes [K]
HD=: '·'		NB. hi-dot, optional SI convention
MI=: '-'		NB. minus (==HY)
NUN=: '??'	NB. unrecognised-units placeholder, used by: convert
PI=: o.1		NB. π
PWM=: '^-'	NB. power,minus (precedes a negative power)
PWU=: '^_'	NB. power,underscore (precedes a negative power)
PW=: '^'		NB. power
SL=: '/'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEFINED=: _.	NB. should propagate in a formula

factory=: 3 : 0
  NB. init/restore factory settings of alterable globals
  NB. ONLY SCI and SIG reside in z-locale
SIC=: 1		NB. Used chiefly by: ucode, uniform
SIG=: 3		NB. used by: scino
SCI=: 5		NB. used by: scino
SIZ=: 1e_9	NB. used by: scino
i.0 0
)

TEMPERATURE_SCALES=: b4f }: 0 : 0
K
Kelvin
C
Centigrade
Celsius
F
Fahrenheit
Ne
Newton
Re
Ré
Reaumur
Réaumur
Ro
Roe
Rø
Roemer
Rømer
Delisle
De
)

  NB. data table stubs for basic testing
UUC=: cmx 0 : 0
1 /	[saved]	BASIC TESTING ONLY
1 m	[m]	fundamental unit - metre (distance)
1 kg	[kg]	fundamental unit - kilogramme (mass)
1 s	[s]	fundamental unit - second (time)
1 A	[A]	fundamental unit - Ampere (electric current)
1 K	[K]	fundamental unit - Kelvin (temperature)
1 cd	[cd]	fundamental unit - candela (light intensity)
1 mol	[mol]	fundamental unit - mole (amount of matter)
1 rad	[rad]	fundamental unit - radian (angle)
1 eur	[eur]	fundamental unit - euro (currency)
1 /	[/]	fundamental unit - (dimensionless)
1 *	[*]	fundamental unit - (matches any units)
1000 m	[km] kilometre
0.01 m	[cm] centimetre
0.001 m	[mm] millimetre
0.0254 m	[in]	inch
12 in	[ft]	feet
36 in	[yd]	yard
1760 yd	[mi]	mile
1 s	[sec]	second (time)
60 s	[min]	minute
60 min	[h]	hour
24 h	[d]	day
1 /s	[Hz]	Frequency; Hertz
2p1 rad	[cyc]	cycle
1/360 cyc	[deg]	degree of arc
1 deg	[dms]	degrees as deg min sec
)

UUF=: cmx 0 : 0
PI*r*r : r(m)		[m^2]	area of circle
sin a ; a(rad)		[/]	sine
cos a ; a(rad)		[/]	cosine
tan a ; a(rad)		[/]	tangent
)

UUM=: ''

mks=: ;:'m kg s A K cd mol rad eur'
NB. The primitive SI-units (+ "honorary" primitive units like [rad])
NB. mks=: mks,<'item'
NB. mks=: mks , (<'item'),each ":each i.10
NB. append "user units": item0 … item9

