	NB. uu - pp_encoding.ijs
'==================== [uu] pp_encoding.ijs ===================='
	NB. The notes here have been moved to temp 181 /179
cocurrent 'uu'

0 :0
Wednesday 15 August 2018  03:51:45
abolish existing *CODEs in favour of ZEROCODE, isGoodCode
(checkpointed in temp 8)
)

UNSETCODE=: BADCODE=: KILLERCODE=: ZEROCODE=: 0x
TRIVIALCODE=: 1x

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

NB. isGoodCode=: 13 : '-. y e. ZEROCODE,%ZEROCODE' "0
isGoodCode=: ([: -. (ZEROCODE,%ZEROCODE) e.~ ])"0

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
  if. (-. isGoodCode code) or (0=val) do.
    ssw '--- id=(i) val=(val) code=(crex code) [(i pick units)]'
    NB. …use of crex prints 4x instead of 4 (say)
    NB. 0 make_msg i e. 59 114 135 264 265  NB. trace qtcode4i for these ids
    'val code'=. qtcode4i i
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
dip 0=uvalc
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

qtcode4i=: (3 : 0)"0
ME=: <'qtcode4i'
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
msg '(LF)+++ qtcode4i[(y)]: units_y=[(units_y)] unitv_y=[(unitv_y)] code=(crex code)'
  NB. …use of crex prints 4x instead of 4 (say)
  NB. if code is valid, assume y{uvalc is valid too
if. -. code e. UNSETCODE,BADCODE do.  NB. <<<<<<<<<<<<<<<<<<<<<<
  valc=. y{uvalc
  val=. valu*valc
  msg '--- qtcode4i: VALID1 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code return.
end.
  NB. Else compute qty==(valc;code) from specd units: unitv_y
'valc code'=. qtcode4anyunit unitv_y
msg '... qtcode4i: valc=(valc) code=(crex code) from: qtcode4anyunit ''(unitv_y)'''
if. -. code e. UNSETCODE,BADCODE do.  NB. <<<<<<<<<<<<<<<<<<<<<<
  val=. valu*valc
  msg '--- qtcode4i: VALID2 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code
else.
  msg '--- qtcode4i: INVALID code=(crex code)'
  0;BADCODE
end.
)

0 :0
qtcode4i 59
VIEWTABLE=: 10  NB. number of lines in viewtable output
smoutput vt 59
xxu 18 19
xxu 30 + i.10
dip uvalx ~: uvalc
)

qtcode4bareunit=: 3 : 0
ME=: <'qtcode4bareunit'
  NB. lookup the qty (value;code) for BARE NAMED unit: y
  NB. may be basic or derived, BUT expect to find it in: units
i=. units i. <,y
msg '+++ qtcode4bareunit[(y)] id=(i) #uvalc=(#uvalc)'
if. (i<0) or (i >: #UUC) do. 0;BADCODE return. end.
valc=. i{uvalc
code=. i{unitc
msg '--- qtcode4bareunit[(y)] id=(i) valc=(valc) code=(crex code)'
valc;code
)

qtcode4anyunit=: 3 : 0
ME=: <'qtcode4anyunit'
  NB. RECALCULATES code for ANY entry (y) in (units)
  NB. …ignores existing code in unitc if product of codes
  NB. multiply the codes for each (powered)token
msg '+++ qtcode4anyunit: y=[(y)]'
if. 0=#y    do. 1;TRIVIALCODE return. end.
if. SL-: >y do. 1;TRIVIALCODE return. end.
if. ST-: >y do. 1;KILLERCODE return. end.
v=. z=. 0$0x
for_t. utoks y do.
  'invert scale unit power'=. cnvj opentok=.>t
  'valu code'=. qtcode4bareunit unit
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
msg '--- qtcode4anyunit: y=[(y)] v=[(v)] muv=(muv); z=[(crex z)] muz=(muz)'
NB. msg '--- qtcode4anyunit: (muv) [(y)] --> [(muz)] --> [(canon expandcode muz)]'
muv;muz return.
)

0 :0
tv 1  NB. trace: qtcode4i qtcode4anyunit qtcode4bareunit
tv 2  NB. trace cnvj qtcode4i qtcode4anyunit qtcode4bareunit
qtcode4bareunit 'acre'
qtcode4anyunit 'acre'
qtcode4anyunit 'kg'
qtcode4anyunit '/kg'
qtcode4anyunit 'rd'
qtcode4anyunit 'gbp/m^3'
qtcode4anyunit 'kWh'
)

0 :0
uunew=: 3 : 0
  NB. MONAD: convert str: y (e.g. '212 degF') to mks units
ME=: <'uunew'
val=. ". SP taketo y -. '°'
unit=. SP takeafter y
'coeff code'=. qtcode4anyunit unit
targ=. canon expandcode code  NB. infer target units from: code
NB. va=. targ adj  coeff * ('_',unit) adj val
va=. coeff * ('_',unit) adj val
   sllog 'uunewMONAD__ val unit targ coeff code va'
(ucode 8 u: targ format va),SP,(ucode uniform targ)
:
  NB. DYAD: convert str: y (e.g. '212 degF') to target units (x)
ME=: <'uunew'
val=. ". SP taketo y -. '°'
unit=. SP takeafter y
targ=. bris x  NB. ensure x is kosher format: 'm/s^2' NOT 'm s⁻²'
'coeft codet'=. qtcode4anyunit targ
'coefu codeu'=. qtcode4anyunit unit
coeff=. coefu % coeft
va=. coeff * ('_',unit) adj val
   sllog 'uunewDYAD__ val unit targ coefu codeu coeft codet va'
if. codeu -: codet do.
  (ucode 8 u: targ format va),SP,(ucode uniform targ)
else.
  emsg '>>> uunew: incompatible units: (x) || (unit)'
  '' return.
end.
)

uunew=: '' ddefine
  NB. convert str: y (e.g. '212 degF') to target units (x)
ME=: <'uunew'
val=. ". SP taketo y -. '°'
unit=. SP takeafter y
if. 0<#x do.  NB. use non-empty (x) as targ...
  targ=. bris x  NB. (x) in kosher format: 'm/s^2' NOT 'm s⁻²'
  'coeft codet'=. qtcode4anyunit targ
  'coefu codeu'=. qtcode4anyunit unit
  if. codet ~: codeu do.
    emsg '>>> uunew: incompatible units: x=(x) targ=(targ) unit=(unit)'
    '' return.
  end.
  coeff=. coefu % coeft
else.  NB. (x) is empty or monadic
  'coeff code'=. qtcode4anyunit unit
  codet=. codeu=. code
  targ=. canon expandcode code  NB. infer target units from: code
end.
va=. coeff * ('_',unit) adj val
sllog 'uunew__ val unit targ coefu codeu coeft codet va'
(ucode 8 u: targ format va),SP,(ucode uniform targ)
)