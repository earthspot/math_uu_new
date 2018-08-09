	NB. uu - pp_encoding.ijs
'==================== [uu] pp_encoding.ijs ===================='
	NB. The notes here have been moved to temp 181 /179
cocurrent 'uu'

UNSETCODE=:   131x    NB. must be prime
BADCODE=:     99991x  NB. must be prime
TRIVIALCODE=: 1x
KILLERCODE=:  0x
  NB. other big primes to use: 17383x 17389x

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
VALIDATE_unitc=: 3 : 0
  NB. verify (expanded) unitc matches unitx
notmatches=. [: -. -:
bads=. i.0
for_i. i.#units do. unit=. i pick units
  iux=. i pick unitx	NB. fully resolved units
  iuc=. i pick unitc	NB. pp-code
  ixc=. canon expandcode iuc	NB. resolved units from pp-code
  ivx=. i pick uvalx	NB. conversion factor to go with unitx
  ivc=. i pick uvalc	NB. conversion factor to go with unitc
  if. iux notmatches ixc do.
    bads=. bads,i
    ssw '>>> VALIDATE_unitc[(i)] bad unit[(unit)] iux=[(iux)] ixc=[(ixc)] iuc=(iuc)'
  elseif. ivx ~: ivc do.
    bads=. bads,i
    ssw '>>> VALIDATE_unitc[(i)] bad uval[(unit)] ivx=[(ivx)] ivc=[(ivc)]'
  end.
end.
ssw '--- VALIDATE_unitc: mismatches=(#bads)'
if. 0<#bads do.
  smoutput viewtable bads
  smoutput '... bads+30 (to identify by line# in uuc.ijs)…'
  smoutput bads+30
end.
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

NB. isNotOK=: -.&isOK=: (3 : 0)"0
NB. (isRegular y),(isNonTrivial y),(isNotKiller y) NONSENSE??
NB. )

isValid=: -.&isInvalid=: (3 : 0)"0
y e. UNSETCODE,BADCODE
)

isNonTrivial=: -.&isTrivial=: (3 : 0)"0
y=TRIVIALCODE
)

isNotKiller=: -.&isKiller=: (3 : 0)"0
y=KILLERCODE
)

isIrregular=: -.&isRegular=: (3 : 0)"0
IRREGULARS=. UNSETCODE,BADCODE
if. y e. IRREGULARS do. 0 return. end.
if. y = KILLERCODE do. 1 return. end.
if. y = TRIVIALCODE do. 1 return. end.
]z=. 1 -.~ 2 x: |y
]z=. ; q:each z
-. any z e. | IRREGULARS
)

make_unitc=: 1 ddefine
  NB. x=pass# (1,2,3…)
  NB. does NOT use: msg or sllog
pass=. x
rebuild=. pass<:1
ssw '+++ make_unitc: pass=(pass) rebuild=(rebuild) #UUC=(#UUC)'
if. rebuild do.
  ssw=. empty
  uvalc=:(#UUC)$0
  unitc=:(#UUC)$UNSETCODE
end.
for_i. i.#UUC [n=.0 do.
  val=. i{uvalc [code=. i{unitc
  if. (isIrregular code) or (0=val) do.
    ssw '--- id=(i) val=(val) code=(crex code) [(i pick units)]'
    NB. …use of crex prints 4x instead of 4 (say)
    NB. 0 make_msg i e. 59 114 135 264 265  NB. trace qty4i for these ids
    'val code'=. qty4i i
    ssw '--- id=(i) val=(val) code=(crex code)(LF)'
    uvalc=: val  i}uvalc
    unitc=: code i}unitc
    n=. n+1
    assert 64 128 e.~ 3!:0 unitc  NB. must remain extended|rational
  end.
end.
n return.  NB. count of unitc entries reassigned
)

0 :0
make_unitc''		NB. 1st pass
VALIDATE_unitc''
dip isInvalid unitc			NB. should be 0
dip isIrregular unitc
dip 0=uvalc
dip (0=uvalc) or isIrregular unitc
2 make_unitc''	NB. 2nd pass
3 make_unitc''	NB. 3rd pass
4 make_unitc''	NB. 4th pass
)

0 :0
	units	nominal units in UUC, e.g. [Ohm]
	unitv	units on which UUC defn is based
	unitx	unitv expanded into fundamental units
	uvalu	conversion factor explicit in UUC
	uvalx	conversion factor to go with unitx
	uvalc	conversion factor to go with unitc
	unitc	pp-coded units, expandcode must match unitx
)

qty4i=: (3 : 0)"0
ME=: <'qty4i'
  NB. returns (valu;code) for index: y
if. (y<0) or (y>:#UUC) do. 0;BADCODE return. end.
]valu=.    y{uvalu
]units_y=. y pick units  NB. nominal units of valu
]unitv_y=. y pick unitv  NB. units definition as per UUC
  NB. Recognise [/] and [*] and handle them
if. unitv_y -: ,SL do. valu;TRIVIALCODE return. end.
if. unitv_y -: ,ST do. 1;KILLERCODE return. end.
  NB. Recognise a basic unit and return its prime with "valc"==1 …
if. Nmks > i=. mks i. <,units_y do. 1;i{Pmks return. end.
code=. y{unitc
msg '(LF)+++ qty4i[(y)]: units_y=[(units_y)] unitv_y=[(unitv_y)] code=(crex code)'
  NB. …use of crex prints 4x instead of 4 (say)
  NB. if code is valid, assume y{uvalc is valid too
if. isValid code do.
  valc=. y{uvalc
  val=. valu*valc
  msg '--- qty4i: VALID1 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code return.
end.
  NB. Else compute qty==(valc;code) from specd units: unitv_y
'valc code'=. qty4anyunit unitv_y
msg '... qty4i: valc=(valc) code=(crex code) from: qty4anyunit ''(unitv_y)'''
if. isValid code do.
  val=. valu*valc
  msg '--- qty4i: VALID2 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code
else.
  msg '--- qty4i: INVALID code=(crex code)'
  0;BADCODE
end.
)

0 :0
qty4i 59
VIEWTABLE=: 10  NB. number of lines in viewtable output
smoutput vt 59
xxu 18 19
xxu 30 + i.10
dip uvalx ~: uvalc
)

xxu=: (3 : 0)"0
  NB. cross-check unitc against unitx for index: y
UNC=: canon expandcode y{unitc
UNX=: >y{unitx
if. UNC -: UNX do. smoutput 'hooray!'
else. UNC ; UNX end.
)

qty4bareunit=: 3 : 0
ME=: <'qty4bareunit'
  NB. lookup the qty (value;code) for BARE NAMED unit: y
  NB. may be basic or derived, BUT expect to find it in: units
i=. units i. <,y
msg '+++ qty4bareunit[(y)] id=(i) #uvalc=(#uvalc)'
if. (i<0) or (i >: #UUC) do. 0;BADCODE return. end.
valc=. i{uvalc
code=. i{unitc
msg '--- qty4bareunit[(y)] id=(i) valc=(valc) code=(crex code)'
valc;code
)

q4a=: qty4anyunit=: 3 : 0
ME=: <'qty4anyunit'
  NB. RECALCULATES code for ANY entry (y) in (units)
  NB. …ignores existing code in unitc if product of codes
  NB. multiply the codes for each (powered)token
msg '+++ qty4anyunit: y=[(y)]'
if. 0=#y    do. 1;TRIVIALCODE return. end.
if. SL-: >y do. 1;TRIVIALCODE return. end.
if. ST-: >y do. 1;KILLERCODE return. end.
v=. z=. 0$0x
for_t. utoks y do.
  'invert scale unit power'=. cnvj opentok=.>t
  'valu code'=. qty4bareunit unit
  sllog 'opentok invert scale unit power valu code'
  if. invert do.
    z=. z , %(code^power)
    v=. v , scale%(valu^power)
  else.
    z=. z , code^power
    v=. v , scale*(valu^power)
  end.
end.
muv=. */v  NB. combine all the valus
muz=. */z  NB. combine all the codes
msg '--- qty4anyunit: y=[(y)] v=[(v)] muv=(muv); z=[(crex z)] muz=(muz)'
NB. msg '--- qty4anyunit: (muv) [(y)] --> [(muz)] --> [(canon expandcode muz)]'
muv;muz return.
)

0 :0
TRACEVERBS=: ;:'cnvj qty4i qty4anyunit qty4bareunit'
TRACEVERBS=: ;:'qty4i qty4anyunit qty4bareunit'
qty4bareunit 'acre'
qty4anyunit 'acre'
qty4anyunit 'kg'
qty4anyunit '/kg'
qty4anyunit 'rd'
qty4anyunit 'gbp/m^3'
qty4anyunit 'kWh'
)

NB. These are only used by test2 ...............
NB. >>>>>>>>>> ELIMINATE...
toks4expandcode=: 1&expandcode

NB. >>>>>>>>>> ELIMINATE...
upp4utok=: 3 : 0
  NB. (unit;power) for utok: y
]z=. sp1 >y
]sign=. <: 2* SL~:{.z
]unit=. PW taketo }.z
]power=. sign * {. 1,~ ". PW takeafter z
unit;power return.
)


0 :0
make_unitc''  NB. build the working cache: (unitc) -to match: (units)
…now called within: start'' (defined in start.ijs)
)