	NB. uu - pp_encoding.ijs
'==================== [uu] pp_encoding.ijs ===================='

cocurrent 'uu'

make_ucodex=: (3 : 0)"1
  NB. make list of code numbers of units in UUC
i=. units i. <unit=. y
z=. i pick unitx
t=. utoks i pick unitx
	t_z_=:t
ssw'make_ucodex: y=(y) i=(i) z=(z) t=[(crex t)]'
code4xunit (,>t) -. SL,SP	NB. TOO LIMITED <<<<<<<<<
)

make_ucode=: (3 : 0)"1
  NB. make ucode - the list of codes of units in UUC
NB. FOR EACH cunit in the next utoks of unitv…
i=. units i. <unit=. y
code=. i pick ucode
NB. IS code absent?
NB. Work thru its (unitv) fetching and combining codes
)

0 :0
ot 177 -initial utils for u* nouns, plus viewtable for UUC
-
TRIAL UNITS:
1 kg m/s^2 [N]	Force; Newton
1 N m	[J]	Energy; joules
1 J/s	[W]	Power; watts
1 A s	[C]	Charge; coulombs
1 J/C	[V]	Potential; volts
1 C/V	[F]	Capacitance; farads
1 V/A	[Ohm]	Resistance; Ohms
  unitv   units
A good replacement for verb: convert
-expands tokens until all are basic & repeated
	i.e. /s/s -not: s^-2
	-one of the cnv* already does this.
-then looks-up code for each token
-then accumulates the codes.
HOW DO WE KNOW a token is basic? (i{units) -: (i{unitv)
-
MORE EFFICIENT…
loop thru tokens, fetching the code for each *token* (NOT unit)
 -work recursively for tokens without codes (yet)
-
make_ucodex -tries to find code from unitx.
BUT… we're planning to replace unitx (-costly to compute)
THE GOAL: -make each new code from ucode (existing entries)
CONTENTS OF ucode come from…
  basic units: m kg s A K cd mol rad eur
  named units: [N]=A/
Strategy:
Typical UUC table entries
1	kg m/s/s	[N]	Force; newtons
1	N/m/m	[Pa]	Pressure; pascals
^	^^^^^	 ^^
uvalu	unitv	units	-->(uvalx unitx)
------------------------
uvalu	numeric value of the quantity
units	stated [nominal] units, e.g. [Pa]
unitv	given units of the quantity, e.g. [N/m/m]
unitx	fully expanded unitv, viz: [kg/m/s^2]
NB. uvalx	conversion factor: units ÷ unitx
)
-
pp4xunit '/s'
encoded 0 0 _1 0 0 0 0 0 0
code4xunit '/s'
make_ucodex 'Hz'
-
but this won't work in general, only for 1 basic unit.
make_ucode -to work with code, not xunit
 -or at least the simple xunit
 -accumulates valid codes in: ucode
 -needs to build ucode, and at the same time lookup in it.
 -It cannot simply exploit verb-rank ("0)
 --it must loop
)

PWM=: '^-'	NB. power,minus (precedes a negative power)
PW=: '^'		NB. power
MI=: '-'		NB. minus (==HY)

mks=: ;:'m kg s A K cd mol rad eur'
Nmks=: #mks	NB. # of basic mks units = # of primes for pp-coding
  NB. …Nmks used in tacit verbs. Otherwise scarcely faster than #mks
Pmks=: x:p:i.#mks	NB. the first (#mks) primes

randompp=: 3 : '? Nmks#>:y'
encoded=:  3 : '*/ Pmks ^ y'		NB. pp-> code
decodedx=: 3 : 'x:^:_1 Nmks q: y'	NB. (extended)code-> pp
decodedr=: 3 : 'x:^:_1 -/decodedx 2 x: y'  NB. (rational)code-> pp
decoded=: decodedx :: decodedr

expandcode=: 0 ddefine
  NB. the canonical expansion (xunit) of code: y
asTokens=. x  NB. (bool): x=1 -return list of boxed tokens (not string)
for_p. decoded y[z=.'' do.
  unit=. p_index pick mks  NB. the mks unit, e.g. 'mol'
  SS=. (p<0){SP,SL
  select. p
  case.  0 do. cell=. 0        NB. to be omitted (0--crash if used)
  case.  1 do. cell=. SP,unit  NB. if p=1, exponent is redundant
  case. _1 do. cell=. SL,unit
  case.    do. cell=. SS,unit,PW,":|p
  end.
  if. p~:0 do.
    NB. ssw '--- [(p_index)]: append cell=[(cell)]'
    if. asTokens do. z=. z,<cell else. z=. z,cell end.
  end.
end.
if. asTokens do. z else. dlb z end.
)

toks4expandcode=: 1&expandcode

upp4utok=: 3 : 0
  NB. (unit;power) for utok: y
]z=. sp1 >y
]sign=. <: 2* SL~:{.z
]unit=. PW taketo }.z
]power=. sign * {. 1,~ ". PW takeafter z
unit;power return.
)

pp4xunit=: 3 : 0
  NB. pp (prime-powers) for canonical expansion (xunit): y
  NB. accum into z the prime-power corresp to: unit
for_t. utoks y [ z=.Nmks#0 do.
  'unit power'=. upp4utok t
  index=. mks i. <unit
NB.   smoutput t_index ; unit ; power ; index
  if. index<Nmks do. z=. power index}z end.  NB. insert one z-entry
end.
z return.
)

code4xunit=: encoded&pp4xunit
