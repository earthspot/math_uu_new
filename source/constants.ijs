	NB. uu - constants.ijs
'==================== [uu] constants ===================='

cocurrent 'uu'

0 :0
Friday 12 April 2019  12:51:30
)

ABOUT=: 0 : 0
UU: scientific quantity converter
-works with SI units, also Imperial and misc systems.
)

NB. =========================================================
  NB. currency exchange-rate tables, used by: quoted
  NB. quoted currencies are expressed in terms of the Euro.
  NB. if net is accessible, CUTAB to be updated from Eurobank
NB. =========================================================

CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'	NB. initial short table
CUTAB=: CUTAB0	NB. can be overridden by: start

NB. =========================================================
NB. General purpose constants
NB. =========================================================

BADQTY=: '0 ??'	NB. error returned qty by verb: uu
BADRAT=: _r1	NB. rational infinity - returned by: reval
HD=: '·'		NB. hi-dot, optional SI convention
MI=: '-'		NB. minus (==HY)
NUN=: '??'	NB. unrecognised-units placeholder, used by: convert
PWM=: '^-'	NB. power,minus (precedes a negative power)
PWU=: '^_'	NB. power,underscore (precedes a negative power)
PW=: '^'		NB. power
SL=: '/'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEFINED=: _.	NB. will propagate in a formula

NB. =========================================================
  NB. SIC -- controls SI-compliance via utf-8 chars
  NB. SIC=0	units expressed entirely in ASCII
  NB. SIC=1	utf-8s e.g. Å but inverse shown as: /Å
  NB. SIC=2	utf-8, no '/'
  NB. SIC=3	utf-8, no '/', uses '·'
NB. =========================================================

factory=: 3 : 0
  NB. init/restore factory settings of alterable globals
SIC=: 1		NB. Used chiefly by: ucode, uniform
SIG=: 3		NB. used by: scino
SCI=: 5		NB. used by: scino
SIZ=: 1e_9	NB. used by: scino
ZERO=: 'NO'	NB. used by: format
i.0 0
)

CANNOTSCALE=: cutopen 0 : 0
gas.mark
midino
note
)

TEMPERATURE_SCALES=: cutopen 0 : 0
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
REF_UUC=: >cutopen 0 : 0
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

REF_UUF=: >cutopen 0 : 0
PI*r*r : r(m)		[m^2]	area of circle
sin a ; a(rad)		[/]	sine
cos a ; a(rad)		[/]	cosine
tan a ; a(rad)		[/]	tangent
)

REF_UUM=: ''

NB. =========================================================
NB. mks -is UU's reference list of base units
NB. SI "Base units" are: m kg s A K mol cd
NB. UU adds "honorary" base units: rad eur
NB. We might also add later:
NB.  mks=: mks,<'item'
NB.  mks=: mks , (<'item'),each ":each i.10
NB.  …appends "user units": item0 … item9
NB. =========================================================

SIbu=: ;:'m kg s A K mol cd'  NB. the official SI "base units"
mks=:   SIbu,'rad';'eur'      NB. UU adds extra "dimensions"


NB. ================================================
NB. RATIONAL CONSTANTS - may override floating defns
NB. ================================================

cocurrent 'z'  NB. <<<<< MAKE VISIBLE TO CAL

  NB. PI, EXP, RT2 have been copy/pasted from OEIS,
  NB.  which [in 2019] displays 105 digits for π and e, and 99 digits for "root 2",
  NB.  then digit(s) have been dropped off the end until an odd digit is reached.
  NB.  NO OTHER ADJUSTMENTS WERE MADE BY HAND/EYE TO THE DATA DIGITS.
  NB. This trick preserves each constant's appearance as a rational J number,
  NB.  else a final even digit would make J cancel out by a factor of 2 or more.

  NB. π (rational - accurate to >100 decimal places - 104 digits shown)
  NB. https://oeis.org/A000796	IAC Monday 8 April 2019  21:12:05
REF_PI=:  31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821x 

  NB. e (rational - accurate to >100 decimal places - 103 digits shown)
  NB. https://oeis.org/A001113	IAC Monday 8 April 2019  21:12:05
REF_EXP=: 2718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427x

  NB. √2 (rational approximation to >98 decimal places - 99 digits shown)
  NB. https://oeis.org/A002193	IAC Monday 8 April 2019  21:43:31
REF_RT2=: 141421356237309504880168872420969807856967187537694807317667973799073247846210703885038753432764157x
assert (_1&x: 2 - REF_RT2*REF_RT2) = _2e196

ICE_F=: 32x		NB. water freezes [°F]
ICE_C=: 0x		NB. water freezes [°C]
ICE_K=: 27315r100		NB. water freezes [K]
BOIL_F=: 180x + ICE_F	NB. water boils [°F]
BOIL_C=: 100x + ICE_C 	NB. water boils [°C]
BOIL_K=: 100x + ICE_K	NB. water boils [K]
