	NB. uu - pp_encoding.ijs
'==================== [uu] pp_encoding.ijs ===================='
	NB. The notes here have been moved to temp 181 /179
	NB. AND 0 :0 -inserts have been hived-off to temp 18
cocurrent 'uu'

0 :0
Monday 20 August 2018  00:35:37
)

UNSETCODE=: BADCODE=: KILLERCODE=: ZEROCODE=: 0x
TRIVIALCODE=: 1x

NB. assigned in: constants.ijs...
NB. PWM=: '^-'	NB. power,minus (precedes a negative power)
NB. PWU=: '^_'	NB. power,underscore (precedes a negative power)
NB. PW=: '^'		NB. power
NB. MI=: '-'		NB. minus (==HY)

NB. mks=: ;:'m kg s A K cd mol rad eur' ---BUT CHECK!!!
	NB. <<< mks HAS ALREADY BEEN ASSIGNED BY NOW (in: constants.ijs)
	NB. …only here for reference.
Nmks=: #mks	NB. # of basic mks-units == # of primes for pp-coding
  NB. …Nmks used in tacit verbs. Otherwise scarcely faster than #mks
Pmks=: x:p:i.Nmks	NB. the first (#mks) primes

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

qtcode4i=: (3 : 0)"0
pushme 'qtcode4i'
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

qtcode4bareunit=: 3 : 0
pushme 'qtcode4bareunit'
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
pushme 'qtcode4anyunit'
  NB. RECALCULATES code for ANY entry (y) in (units)
  NB. …ignores existing code in unitc if product of codes
  NB. multiply the codes for each (powered)token
msg '+++ qtcode4anyunit: y=[(y)]'
if. 0=#y    do. 1;TRIVIALCODE return. end.
if. SL-: >y do. 1;TRIVIALCODE return. end.
if. ST-: >y do. 1;KILLERCODE return. end.
v=. z=. 0$0x
for_t. utoks y do.
  'invert scale bareunit power'=. cnvCunit cunit=.>t
  'valu code'=. qtcode4bareunit bareunit
NB. pushme 'qtcode4anyunit'  NB. restore after qtcode4bareunit
sllog 'cunit invert scale bareunit power valu code'
  if. invert do.
    z=. z , % (code^power)
    v=. v , scale % (valu^power)
  else.
    z=. z , code^power
    v=. v , scale * (valu^power)
  end.
end.
muv=. */v  NB. combine all the valus
muz=. */z  NB. combine all the codes
msg '--- qtcode4anyunit: y=[(y)] v=[(v)] muv=(muv); z=[(crex z)] muz=(muz)'
muv;muz return.
)

cnvCunit=: 3 : 0
pushme 'cnvCunit'
  NB. cut prefs/suffs from a cunit (eg: '/kg^3')
  NB. replaces cnvj in NEW code
y_uu_=: y
z=. dltb y  NB. (,'m') for y=='m' or y==' m'
k=. p=. 1   NB. to be overridden below
   NB. elim a NEGATIVE power in all forms
if. (SL~:{.z) and ((any PWM E. z) or (any PWU E. z)) do.
  z=. SL,z rplc PWM ; PW ; PWU ; PW  NB. replace by leading SL
end.
  NB. drop prefix: SP|SL from z -but remember it as (bool) j
if. j=.(SL={. sp1 z) do. z=. }.z end.
if. PW e. z do.  NB. recognise a power-suffix
  NB. drop power-suffix from z -but remember it as (int) p
  'p z'=. (".{:z) ; (}:}:z)
end.
msg '+++ cnvCunit: y=(y) z=(z) j=(j) p=(p)'
  NB. Identify scaling prefixes, eg 'ms' 'Gs' 'µ' (all variants of: s)
  NB. ONLY IF z is not itself in: units, eg 'knot' ...
if. (-.iskg z) and (not validunits z) do.
  'k z'=. scale4bareunit z
end.
msg '--- cnvCunit: j=(j) k=(k) z=(z) p=(p)'
popme 'cnvCunit'
j ; k ; z ; p return.
)

scale4bareunit=: 3 : 0
  NB. returns e.g. (1e9 ; 'Hz') for y=='GHz'
  NB. ALSO returns (1e3 ; ,'m') for y=='km'
  NB. ...AVOID CALLING WITH y if y is listed in (units) !!!
z=. ,y  NB. (,'m') for y=='m'
k=. 1   NB. to be overridden below
  NB. Identify a MULTI-CHAR ASCII OR UNICODE scaling prefix
dalen=. #da=. 'da'  NB. deka-
mulen=. #mu=. 'µ'   NB. micro-
if.     z beginsWith da do.	k=. 1e1  [ z=. dalen}.z
elseif. z beginsWith mu do.	k=. 1e_6 [ z=. mulen}.z
elseif. do.
  NB. Identify a SINGLE-CHAR ASCII scaling prefix (i.e. NOT µ)
  select. {.z
  case. 'h' do. k=. 1e2	[ z=.}.z	NB. hecto-
  case. 'k' do. k=. 1e3	[ z=.}.z	NB. kilo-
  case. 'M' do. k=. 1e6	[ z=.}.z	NB. mega-
  case. 'G' do. k=. 1e9	[ z=.}.z	NB. giga-
  case. 'T' do. k=. 1e12	[ z=.}.z	NB. tera-
  case. 'P' do. k=. 1e15	[ z=.}.z	NB. peta-
  case. 'E' do. k=. 1e18	[ z=.}.z	NB. exa-
  case. 'Z' do. k=. 1e21	[ z=.}.z	NB. zetta-
  case. 'Y' do. k=. 1e24	[ z=.}.z	NB. yotta-
  case. 'd' do. k=. 1e_1	[ z=.}.z	NB. deci-
  case. 'c' do. k=. 1e_2	[ z=.}.z	NB. centi-
  case. 'm' do. k=. 1e_3	[ z=.}.z	NB. milli-
  case. 'u' do. k=. 1e_6	[ z=.}.z	NB. micro- (µ handled separately)
  case. 'n' do. k=. 1e_9	[ z=.}.z	NB. nano-
  case. 'p' do. k=. 1e_12	[ z=.}.z	NB. pico-
  case. 'f' do. k=. 1e_15	[ z=.}.z	NB. femto-
  case. 'a' do. k=. 1e_18	[ z=.}.z	NB. atto-
  case. 'z' do. k=. 1e_21	[ z=.}.z	NB. zepto-
  case. 'y' do. k=. 1e_24	[ z=.}.z	NB. yocto-
  end.
end.
z=. deb z  NB. guarantee z has NO prefixed SP (or SL)
k ; z
)

uuNEW=: '' ddefine
  NB. convert str: y (e.g. '212 degF') to target units (x)
pushme 'uuNEW'
NO_UNITS_NEEDED=: 0
val=. ". SP taketo y -. '°'
unit=. bris SP takeafter y
if. 0<#x do.  NB. use non-empty (x) as targ...
  targ=. bris x  NB. (x) in kosher: 'm/s^2' ...NOT 'm s⁻²'
  'coeft codet'=. qtcode4anyunit targ
  'coefu codeu'=. qtcode4anyunit unit
  if. codet ~: codeu do.
    emsg '>>> uuNEW: incompatible units: x=(x) targ=(targ) unit=(unit)'
    emsg '... coeft=(coeft) coefu=(coefu) codet=(codet) codeu=(codeu)'
    '' return.
  end.
  coeff=. coefu % coeft
else.  NB. (x) is empty or monadic
  'coeff code'=. qtcode4anyunit unit
  codet=. codeu=. code
  targ=. canon expandcode code  NB. infer target units from: code
end.
NB. THIS CODE-SWITCH NEEDS RESOLVING >>>>>>>>>>>>>>>
if. 1 do. va=. coeff * ('_',unit) adj val
else. va=. coeff * val  NB. but only when input-formatting done
end.
sllog 'uuNEW__ val unit targ coefu codeu coeft codet va'
z=. ucode 8 u: targ format va  NB. (string) value to return
if. NO_UNITS_NEEDED do. z  NB. set by format when it provides units
else. z,SP,(ucode uniform targ)
end.
)
