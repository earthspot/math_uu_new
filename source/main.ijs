	NB. uu - main.ijs
'==================== [uu] main ===================='

cocurrent 'uu'

bris=: unucode@unslash1@undotted@deb"1  NB. circumcises units: y

canc=: 4 : 0
	NB. cancel-out (serves: canon)
	NB. eg: 'm kg kg/kg/kg s/s' canc 'kg'
z=. sp1 x	NB. the object string
n=. SP,y	NB. unit: y in numerator
d=. SL,y	NB. unit: y in denominator
whilst. -. w-:z do.
  z=. (w=.z) rplc (n,d);'' ; (d,n);''
end.
)

canon=: 3 : 0
pushme 'canon'
	NB. Sort units (str y) into canonical order
	NB. y must be fully-resolved units, ie all from boxed list: mks
	NB. Sort tokens EACH REVERSED. This brings num+denom terms together
z=. ; |. each sort |. each utoks y
	msg '... canon: z=(z)'
	NB. Cancel-out/collect each unit from global boxed list: mks in turn...
for_w. mks do. m=. ,>w		NB. m== next unit from list: mks
  if. any m E. z do.		NB. only if m is present in z
    z=. (z canc m) coll m
	msg '... canon: [(m)] z=(z)'
  end.
end.
z=. debnSL dlb ; sort utoks z	NB. k-m-s order, with denominators gathered behind
if. 0=#z do. z=. ,SL end.  	NB. CONVENTION: (empty z) --> ,'/'
msg '--- canon: EXITS: z=(z)'
0 popme 'canon'
z return.
)

cnvi=: 1&$: : (4 : 0)
	NB. x=1 - invert SP <--> SL thru token-list (y)
if. -.x do. y return. end.
zz=. ''
for_i. i.#y do. z=. >i{y	NB. the i'th cunit of list: y
  if.     SL={.z do. zz=. zz,< SP,}.z
  elseif. SP={.z do. zz=. zz,< SL,}.z
  end.
end.
zz return.
)

coll=: 4 : 0
pushme 'coll'
	NB. collects-terms (no cancel-out)
	NB. serves: canon
	NB. eg: ' m kg kg/kg/kg s/s' coll 'kg'
	NB.	 m kg^2/kg^2 s/s
P=. PW
z=. ,x			NB. the object string
n=. SP,y		NB. unit: y in numerator
d=. SL,y		NB. unit: y in denominator
for_p. 4 3 2 do.	NB. 4th-power units are highest recognised
  z=. z rplc ((p*$n)$n);(n,P,":p) ; ((p*$d)$d);(d,P,":p)
  msg '+++ coll:   z=(z) power:p=(p)'
end.
0 popme 'coll'
z return.
)

curfig=: 3 : 'hy (0 j. 2)":y'
debSL=: #~ (+. (1: |. (> </\)))@('/'&~:)

debnSL=: 3 : 0
	NB. remove SL repetitions preserving (any) leading SL
	NB. serves: canon
if. SL={.y do. SL,debSL }.y
else. debSL y
end.
)

deslash=: 1&$: : (4 : 0)
pushme 'deslash'
  NB. deslash
  NB. x=1 --converts cunits with '/' into '^_n' form
  NB. x=0 --converts '^_n' cunits back into '/'
r=. ''	NB. accumulates modified cunits
for_cu. utoks y do. cunit=. >cu
  if. (x=0) or SL={.cunit do.  NB. inverse: do BOTH SP SL
    'j k z p'=. cnvCunit cunit
    if. x do.
      cunit=. SP, (}. PW taketo cunit),PWM,":p
    else.
      sllog 'deslash__ cunit j k z p'
      cunit=. (j{SP,SL), (}. PW taketo cunit) ,(p>1)# PW,":p
    end.
  end.
  r=. r,cunit
end.
popme 'deslash'
dlb r return.
)

dotted=: 1&$: : (4 : 0)
  NB. apply(x=1--default)/unapply(x=0) dotted (·) convention
  NB. cf: slash1
]z=. utf8 deb y
if. x do.  NB. apply convention
  if. any HD E. z do. y return. end.  NB. convention already applied
  ]z=. z rplc SP;HD
else.  NB. unapply convention
  if. -.any HD E. z do. y return. end.  NB. convention not applied
  z=. z rplc HD;SP
end.
)

eval=: 3 : 0 "1
  NB. used to evaluate numeric exprns in UUC
y=. '/%-_Ee'charsub ;y
try. {.".y catch. INVALID end.
)

exrate=: exrate_exch_

NB. getversion=: 3 : 0
NB. try.
NB. badresult=. fread''
NB. assert. -. badresult -: z=. fread y sl 'manifest.ijs'
NB. assert. 0< # z=. LF taketo 'VERSION' dropto z
NB. ".z 
NB. catch. end.
NB. )

getversion=: 3 : 0
  NB. get VERSION from manifest.ijs in (path) y
VERSION=: 'v.v.v'
assert. fexist y  NB. y operationally is TPATH_UU
load y sl 'manifest.ijs'
assert. -. absent 'VERSION'
erase 'FILES RELEASE LABCATEGORY PLATFORMS'
NB. empty erase 'CAPTION DESCRIPTION FOLDER'
VERSION return.
)

hy=: '_-' charsub ]
isNaN=: 128!:5

iskg=: 3 : 0
  NB. (iskg'') =1 iff units y is 'kg' or begins with: 'kg'
  NB.  and is scalable by altering the prefix: 'k'
if. y-:'kg' do. 1 return. end.
if. not 'kg' -: 2{.y do. 0 return. end.
	NB. Further test(s) if z starts with: 'kg'
if. any 'kg^' E. y do. 0 return. end.	NB. cannot accept powers of [kg]
1	NB. return true with no more tests
)

midino=: midi4Hz=: 69 + 12 * 2 ^. 440 %~ ]	NB. "midi number" of freq: y (Hz)

note=: note4Hz=: 3 : 0
  NB. nearest musical note of freq: y (Hz)
NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
,>NOTE {~ rnd (12 | midino y)
)

Hz4note=: 3 : 0
  NB. freq [Hz] for given musical note
  NB. UNFINISHED <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
130.81  NB. [Hz] for C3	-- TEST ONLY. (WHOLE TABLE NEEDED!]
)

np=: [: <: 2 * -.
rnd=: [: <. 0.5 + ]

scino=: 3 : 0
  NB. Scientific notation for number: y
  NB. but returns ordinary integer for integer (y)
  NB. Uses current values of SIG and SCI (they can change)
fmt=. j. SIG * 1 _1 {~ ((10^SCI) <: |y)  or  ((10^-SIG) > |y)
if. (y=<.y) and (y<10^SCI) do. z=.":y else. z=.fmt ": y end.
)

selfcanc=: 3 : 0
pushme 'selfcanc'
msg '+++ selfcanc: ENTERED'
  NB. Self-cancel unitstr (y) without reducing to mks
  NB. Sort tokens EACH REVERSED -collects num+denom terms
z=. ; |.each sort |.each ut=. utoks y
t=. ~. }.each ut
for_cb. ~.t do.
  z=. z canc >cb
  z=. z coll >cb
end.
z=. dlb canon z
z=. z rplc '/^2';'/';'/^3';'/';'/^4';'/';'/^5';'/';'/^6';'/';'/^7';'/';'/^8';'/';'/^9';'/'
msg '--- selfcanc: EXITS: z=(z)'
0 popme 'selfcanc'
z return.
)

sci=: 3 : 0
  NB. get/set SCI (sci notation threshold)
if. 0=#y do. SCI
else.
  SCI=: {.y  NB. update the LOCAL constant
NB.   smoutput '--- sci: SCI=',":SCI
end.
)

sig=: 3 : 0
  NB. get/set SIG (decimal places for: format)
if. 0=#y do. SIG
else.
  SIG=: {.y  NB. update the LOCAL constant
NB.   smoutput '--- sig: SIG=',":SIG
end.
)

sic=: uunicode=: 3 : 0
  NB. get/set UNICODE (SI-conformance level)
if. 0=#y do. UNICODE
else.
  UNICODE=: {.y  NB. update the LOCAL constant
NB.   smoutput '--- uunicode: UNICODE=',":UNICODE
end.
)

slash1=: 1&$: : (4 : 0)
  NB. apply(x=1--default)/unapply(x=0) single-slash convention
  NB. cf: dotted
z=. deb y
if. x do.  NB. apply convention
  if. UNICODE>:2 do. y return. end.  NB. convention n/a
  if. ')'={:z do. y return. end.  NB. convention already applied
  z=. canon z
  a=. '/' taketo z
  b=. '/' dropto z  NB. all sub-units should be slashed
  z=. a,'/',paren deb b rplc SL;SP  NB. crudely invert b
else.  NB. unapply convention
  if. ')'~:{:z do. y return. end.  NB. convention not applied
  a=. '(' taketo z
  b=. }: '(' takeafter z
  z=. a, b rplc SP;SL
end.
)

sp1=: 3 : 0
	NB. ensure ONE leading SP iff there is no SL
y=. deb y
if. SL~:{.y do. y=. SP,y end.
)

ssmx=: 4 : 'if. UCASE do. x ssmxU y else. x ssmxM y end.'
ssmxM=: 4 : 'I. * +/"(1) y ss"1 x'
ssmxU=: 4 : '(toupper x)ssmxM toupper y'

testf=: 3 : 0
	NB. test: format (and friends)
if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
	nom=. ,>no
	smoutput nb nom ; TAB ; nom format y
end.
)

ucase=: 3 : 0
if. 0=#y do. UCASE
else. UCASE=: {.y
end.
)

hasutf=: [: +./ 127 < a. i. ]  NB. y has utf8 chars (not pure ASCII)
isascii=: [: *./ 128 > a. i. ]  NB. y is pure ASCII (no utf8s)
NB. isascii 'm² K⁻¹ s⁻²'
NB. isascii 'able'

undeslash=: 0&deslash

ucode=: 1 ddefine
  NB. Substitutes (for) correct utf-8 symbols in (string) y
  NB. x==1 kosher-->unicoded
  NB. x==0 unicoded-->kosher
y=. utf8 y  NB. This algo needs y to be bytes not wchars
if. x do.  NB. subst 'π' for 'PI' etc
  if. -.isascii y do. y return. end.  NB. already converted
  ]z=. y rplc ,cspel,.csymb
  NB. Change only the scaling prefix, 'u' ...
  if. 'u'={.z do. z=. 'µ',}.z end.
else.      NB. subst 'PI' for 'π' etc
  if. isascii y do. y return. end.  NB. no utf codes to convert
  NB. convert unicode back to utf-8 before rplc...
  ]z=. y rplc HD;SP
  ]z=. undeslash z rplc ,csymb,.cspel
  NB. Change only the scaling prefix, 'µ' ...
  if. z begins ,'µ' do. z=. 'u',2}.z end.
end.
)

ucods=: 1&$: : (4 : 0)
	NB. saddle to call ucode, but ignoring currency symbols
SAV=. cspel ;< csymb
'cspel csymb'=: sspel ;< ssymb
z=. x ucode y
z [ 'cspel csymb'=: SAV
)

udat=: 4 : 0
  NB. raw boxed data from y=. seltext''
  NB. x==0 -- const
  NB. x==1 -- formula
'y zdesc'=. ']'cut y
zdesc=. dltb zdesc -.TAB
'y znits'=. '['cut y
NB. 'z y'=. '}'cut y	NB. WITHDRAWN: leading {**}
if. x do.		NB. return fields for a formula
  zfmla=. deb y-.TAB
  zdesc; znits; zfmla
else.
  zvalu=. (i=. y i. SP){.y=. deb y-.TAB
  znitv=. }.i}.y
  zdesc; znits; znitv; zvalu
end.
)

udiv=: 4 : 0
  NB. udiv
  NB. divides 2 generalized units-strs: x y
  NB. For use by (eg): combine in: cal
if. (1=#y) and (y=SL) do. x return. end.
z=. cnvi utoks y    NB. invert token-list y
z=. selfcanc x , ;z NB. combine x, z as if multiplied
z=. z rplc '/^2';'/'
)

udumb=: 3 : 0
'zdesc znits znitv zvalu'=. y
zdesc; znits; 1  NB. assume 1 nominal unit is only ever required
)

make_units=: 0 ddefine
  NB. makes globals: cspel csymb units unitv uvalu unitx uvalx compat
  NB. x=0: DONT adjust currency
  NB. (cspel csymb) -used by: ucode to convert units: unicode<-->ascii
  NB. (sspel ssymb_ -used by: ucods (ditto, omits currency symbols)
sspel=: <;._1 ' PI Ang Ohm ^-1 ^-2 ^-3 ^-4 ^2 ^3 ^4'
ssymb=: <;._1 '|π|Å|Ω|⁻¹|⁻²|⁻³|⁻⁴|²|³|⁴'
  NB. cspel,csymb converts these also...
NB.     cspel=: sspel, <;._1 ' deg amin asec eur cnt gbp'
NB.     csymb=: ssymb, <;._1 '|°|''|"|€|¢|£'
cspel=: sspel, <;._1 ' deg amin asec'
csymb=: ssymb, <;._1 '|°|''|"'
  NB. mks (c/f 'm kg s') specifies the most primitive SI-units
  NB. mks=: ;:'m kg s A K cd mol rad eur' NB. <<<set in ONLOAD
make_cutuuc''
'v uv us'=. <"1 |: cutuuc UUC
unitv=: deb each uv -.each TAB
units=: deb each us
uvalu=: eval >v
  NB. Make DUMMY: unitx cycs uvalx from: units
uvalx=: cycs=: (#UUC)$0
unitx=: (#UUC)$<'??'
compat=: unitc i. unitc  NB. compat-code: > earlier UUC-row#
i.0 0
)

NB. ============================================
  NB. Make inputs mapping table mj
mj=: 0 $~ 256                     		NB. X (default bytes)
mj=: 1 ch}mj [ ch=. a.i. SP,TAB		NB. S
mj=: 2 ch}mj [ ch=. a.i. az,AZ,n9,'._-/^*%'	NB. A
mj=: 3 ch}mj [ ch=. a.i. '['			NB. [
mj=: 4 ch}mj [ ch=. a.i. ']'			NB. ]

  NB. Make state transition table sj
sj=: +. ".&> }. cutLF (0 define)
  X    S    A    [    ]   NB. "input class"
 1j1  0j0  1j1  1j1  1j1  NB. 0 space (starts in this state)
 1j0  2j2  1j0  3j0  1j0  NB. 1 value		3jx, x e. i.4
 2j2  2j0  2j0  5j2  2j0  NB. 2 units
 3j0  3j0  3j0  3j2  4j2  NB. 3 simple units	5jx, only x=2 works
 4j6  4j6  4j6  4j6  4j6  NB. 4 ]-state stops, doesn't return descr
 3j1  3j1  3j1  3j1  3j1  NB. 5 [-state, eats [ -->3
)

make_cutuuc=: 3 : 0
  NB. make UUC line-cutter verb: cutuuc
  NB. noun x defines the seq machine
x=. 0;sj;mj
  NB. make tacit verb: cutuuc using x
cutuuc=: x&;: "1
i.0 0
)
NB.    make_cutuuc''
NB.    cutuuc '-1.5 my-u [my-new] test'

NB. ============================================

uniform=: 3 : 0
0 pushme 'uniform'
msg '+++ uniform: ENTERED: y=(y)'
  NB. change units (y) as appropriate for (UNICODE)
y=. utf8 deb y  NB. convert (y) from possible datatype=='unicode'
select. UNICODE
 case. 0 do.  NB. ASCII only
  z=. unucode undotted y
 case. 1 do.  NB. SI units with /
  ]z=. undotted y
  if. 1< +/SL=y do.  NB. if more than 1 slash
    ]z=. slash1 z
  end.
  ]z=. ucode z
fcase. 2 do.  NB. Standard SI units
 case. 3 do.  NB. Standard SI units with dots
  if. y-: ,SL do.  NB. …no bare '/' in Standard SI
    msg '--- uniform: y=SL returns NIL'
    0 popme 'uniform'
    '' return.
  end.
  ]z=. unucode undotted y	NB. c/f case 0
  ]z=. ucode deslash unslash1 z
  if. UNICODE=3 do. z=. dotted z end.
end.
popme 'uniform'
z return.
)

undeg=: 3600 %~ _ 60 60 #. 3 {. ]
undotted=: 0&dotted
unslash1=: 0&slash1
unucode=: 0&ucode
upost=: 4 : 'y,(x#~*UNICODE)'
uurowsc=: 3 : '(UUC ssmx y){UUC'
uurowsf=: 3 : '(UUF ssmx y){UUF'
validunits=: 3 : 'units e.~ <,y'
