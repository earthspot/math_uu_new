	NB. uu - pp_encoding.ijs
'==================== [uu] pp_encoding.ijs ===================='
	NB. The notes which were here have been moved to temp 181
cocurrent 'uu'

UNSETCODE=:   _1x
BADCODE=:     _17389x	NB. must be prime
TRIVIALCODE=:  1x
KILLERCODE=:   0x
OUTSIDECODE=: _99991x	NB. must be prime

PWM=: '^-'	NB. power,minus (precedes a negative power)
PW=: '^'		NB. power
MI=: '-'		NB. minus (==HY)

NB. mks=: ;:'m kg s A K cd mol rad eur'
	NB. <<< mks IS ALREADY ASSIGNED IN: constants.ijs
	NB. It is only here for reference.
Nmks=: #mks	NB. # of basic mks units = # of primes for pp-coding
  NB. …Nmks used in tacit verbs. Otherwise scarcely faster than #mks
Pmks=: x:p:i.#mks	NB. the first (#mks) primes

scalingPrefixes=: 'hkMGTPEZYdcmunpfazy'  NB. now handled by: cnvj

NB. ---------------------------------------------------------
irregulars=: 3 : 0
smoutput llog 'TRIVIALCODE KILLERCODE'
smoutput llog 'OUTSIDECODE UNSETCODE BADCODE'
)

dip=: 3 : 0
  NB. y is bool e.g. u2~:unitc or: unitc=_
assert (#y)=(#UUC)
smoutput '+++ how many? - ',": (+/y)
if. 0<+/y do.
smoutput '+++ their IDs?'
smoutput list I. y
smoutput '+++ their names?'
smoutput list units pick~ I. y
smoutput '+++ their codes?'
smoutput list unitc pick~ I. y
end.
smoutput 75#'-'
)
NB. ---------------------------------------------------------

randompp=: 3 : '? Nmks#>:y'
encoded=:  3 : '*/ Pmks ^ y'		NB. pp-> code
decodedx=: 3 : 'x:^:_1 Nmks q: y'	NB. (extended)code-> pp
decodedr=: 3 : 'x:^:_1 -/decodedx 2 x: y'  NB. (rational)code-> pp
decoded=: decodedx :: decodedr

expandcode=: (0 ddefine)"0
  NB. the canonical expansion (xunit) of code: y
if. y=0 do. '' return. end.  NB. AVOIDS J HANGING <<<<<<<<<<<<<
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

isValid=: 3 : 0
-. y e. UNSETCODE,BADCODE
)

0 :0
isNontrivial=: 3 : 0
-. y e. TRIVIALCODE,KILLERCODE
)

isRegular=: (3 : 0)"0
IRREGULARS=. KILLERCODE,UNSETCODE,BADCODE,OUTSIDECODE
if. y e. IRREGULARS do. 0 return. end.
if. y = TRIVIALCODE do. 1 return. end.
]z=. 1 -.~ 2 x: |y
]z=. ; q:each z
-. any z e. | IRREGULARS
)

isIrregular=: -.&isRegular

make_unitc=: 0 ddefine
  NB. x=0 for 1st pass: build unitc from scratch
  NB. x=1 for 2nd pass: resolve forward refs
  NB. returns new candidate unitc
  NB. BUT ALSO incrementally builds GLOBAL unitc if x-:0
rebuild=. x-:0
z=. 0$0x  NB. candidate unitc
for_i. i.#UUC do.
  codex=. i pickc unitc  NB. known code else OUTSIDECODE
  code=. (code4i :: BADCODE) i  NB. uses unitc -as much as exists
  msg '--- make_unitc: i=(i) rebuild?:(rebuild) codex=(codex) code=(code)'
  z=. z,code
  assert 64 128 e.~ 3!:0 z  NB. z must remain extended|rational
  if. rebuild do. unitc=: z end.
end.
z return.
)

pickc=: pick :: OUTSIDECODE

code4i=: (3 : 0)"0
  NB. code for index(es): y
	y_uu_=: y
if. (y<0) or (y>:#UUC) do. BADCODE return. end.
]units_y=. y pick units  NB. nominal units
]unitv_y=. y pick unitv  NB. units definition
  msg '=== code4i[(y)]: units_y=(units_y) unitv_y=(unitv_y)'
  NB. Recognise a basic unit and return its prime…
if. Nmks > i=. mks i. <,units_y do. i{Pmks return. end.
if. unitv_y -: ,SL do. TRIVIALCODE return. end.
if. unitv_y -: ,ST do. KILLERCODE return. end.
  NB. if unitc has a "regular" code at (y), use the code…
]code=. y pickc unitc
  msg '--- code4i: code=(crex code)'
if. isRegular code do. code return. end.
NB. ]code=. code4xunit unitv_y
]code=. code4anyunit unitv_y
if. isValid code do. code return. end.
  msg '--- code4i: no more code4* verbs to try'
BADCODE return.
)

0 :0
code4i 15
VIEWTABLE=: 10  NB. number of lines in viewtable output
smoutput viewtable 0 10 20
smoutput viewtable 30	NB. the problem area!
smoutput viewtable 40
canon expandcode 3r50
canon expandcode 30625r12	NB. [F] 24
xxu 18 19
xxu 30 + i.10
)

xxu=: (3 : 0)"0
  NB. cross-check unitc against unitx for index: y
UNC=: canon expandcode y{unitc
UNX=: >y{unitx
if. UNC -: UNX do. smoutput 'hooray!'
else. UNC ; UNX end.
)

units4i=: (3 : 0)"0
  NB. units for index(es): y
y pick units
)


code4unit=: 3 : 0
  NB. lookup the code for SINGLE NAMED unit: y
]i=. units i. <,y
try. i pickc unitc
catch. BADCODE end.
)

pp4xunit=: 3 : 0
  NB. pp (prime-powers) for CANONICAL EXPANSION (xunit): y
  NB. accum in z the prime-power corresp to: unit
for_t. utoks y [ z=.Nmks#0 do.
  msg '--- pp4xunit: token=[(crex t)]'
  'unit power'=. upp4utok t
  index=. mks i. <unit
  msg '--- pp4xunit: token=[(crex t)]--> unit=(unit) , power=(power)'
  if. index<Nmks do. z=. power index}z end.  NB. insert one z-entry
end.
z return.
)

code4xunit=: encoded&pp4xunit  NB. for CANONICAL EXPANSION only (no repeated units)

stripscale=: 3 : 0
  NB. strip off the scaling prefix from (bare) unit: y
  NB. NEED TO GENERALIZE THIS to handle conversion factors <<<<<<<<<<<<<<<<<<<<<<<
NB. if. ({.y) e. scalingPrefixes do. }.y else. y end.
'^' -.~ 2 pick cnvj ,y
)

0 :0
stripscale '/km^-3'
stripscale '/km^_3'
stripscale '/km^3'
stripscale 'km^-3'
stripscale 'km^_3'
stripscale 'km^3'
stripscale 'km'
stripscale 'm'
)

c4a=: code4anyunit=: 3 : 0
  NB. code for ANY entry (y) in (units)
  NB. multiply the codes for each (powered)token
  NB. NEED TO GENERALIZE THIS to handle conversion factors <<<<<<<<<<<<<<<<<<<<<<<
if. 0=#y    do. TRIVIALCODE return. end.
if. SL-: >y do. TRIVIALCODE return. end.
if. ST-: >y do. KILLERCODE return. end.
for_t. utoks y[z=.0$0x do.
  'unit power'=. upp4utok t
  msg '--- code4anyunit: token=[(crex t)]--> unit=(crex unit) , power=(power)'
  if. -.isRegular code=.code4unit unit do.
    code=. code4unit stripscale unit
  end.
  z=. z,code^power
  msg '--- code4anyunit: code=[(crex code)] datatype_z=(datatype z) z=[(crex z)]'
end.
muz=. */z  NB. combine all the codes
NB. msg '--- code4anyunit: muz=[(crex muz)] re-expanded=(expandcode muz)'
msg '--- code4anyunit: [(y)] --> (crex muz) --> [(expandcode muz)]'
muz return.
)

0 :0
code4anyunit=: 3 : 0
  NB. code for ANY entry (y) in (units)
  NB. multiply the codes for each (powered)token
  NB. NEED TO GENERALIZE THIS to handle conversion factors <<<<<<<<<<<<<<<<<<<<<<<
  y_uu_=: y
if. 0=#y    do. TRIVIALCODE return. end.
if. SL-: >y do. TRIVIALCODE return. end.
if. ST-: >y do. KILLERCODE return. end.
for_t. utoks y[z=.0$0x do.
  'unit power'=. upp4utok t
  msg '--- code4anyunit: token=[(crex t)]--> unit=(crex unit) , power=(power)'
  NB. IF code NO GOOD: might (unit) be a [scaled] basic unit?
  if. -.isRegular ]code=.code4unit unit do.
    code=. code4unit stripscale unit
  end.
NB. ---------------------------------------------------------
NB. THE [acre] SECTION ---
NB.   NB. IF code STILL NO GOOD: might (unit) be a DERIVED unit, e.g. 'acre'?
NB.   if. -.isRegular code do.
NB.     code=. code4anyunit unitv4unit unit
NB.     NB. <<<<<<<<<<<<<<<<<< COMPUTE A BETTER (code) HERE
NB.   end.
NB. ---------------------------------------------------------
  NB. IF code STILL NO GOOD: give up…
  if. -.isRegular code do. OUTSIDECODE return. end.
  NB. At this juncture we have a regular code to use…
  z=. z,code^power
  msg '--- code4anyunit: code=[(crex code)] datatype_z=(datatype z) z=[(crex z)]'
end.
muz=. */z  NB. combine all the codes
NB. msg '--- code4anyunit: muz=[(crex muz)] re-expanded=(expandcode muz)'
msg '--- code4anyunit: [(y)] --> (crex muz) --> [(expandcode muz)]'
muz return.
)

0 :0
code4unit 'acre'
code4xunit 'acre'
code4anyunit 'acre'
code4anyunit 'rd'
)

0 :0
make_unitc''  NB. build the working cache: (unitc) -to match: (units)
…now called within: start'' (defined in start.ijs)
)