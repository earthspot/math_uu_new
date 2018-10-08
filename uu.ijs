0 :0
Monday 8 October 2018  02:32:29
-
UU: scientific units conversion package
)

clear 'uu'
coclass 'uu'

AABUILT=: '2018-10-08  02:33:33'
AABUILT=: '2018-10-08  03:04:54'

'==================== [uu] constants ===================='

cocurrent 'uu'











CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'
CUTAB=: CUTAB0

BADQTY=: '0 ??'
BOIL_F=: 212
BOIL_C=: 100
BOIL_K=: 373.15
ICE_F=: 32
ICE_C=: 0
ICE_K=: 273.15
HD=: '·'
ME=: ''
MI=: '-'
NUN=: '??'
PI=: o.1
PWM=: '^-'
PWU=: '^_'
PW=: '^'
SL=: '/'
SP=: ' '
ST=: '*'
UL=: '_'
UNDEFINED=: _.

factory=: 3 : 0


DIAGNOSTICS=: 0
ME=: ''
SIC=: 1
SIG=: 3
SCI=: 5
SIZ=: 1e_9
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


UUC=: cmx 0 : 0
1 /	[saved]	BASIC TESTING ONLY
1 m	[m]	fundamental unit - metre (distance)
1 kg	[kg]	fundamental unit - kilogramme (mass)
1 s	[s]	fundamental unit - second (time)
)

UUF=: cmx 0 : 0
PI*r*r : r(m)		[m^2]	area of circle
sin a ; a(rad)		[/]	sine
cos a ; a(rad)		[/]	cosine
tan a ; a(rad)		[/]	tangent
)

UUM=: ''


mks=: ;:'m kg s A K cd mol rad eur'

'==================== [z] paths.ijs ===================='

cocurrent 'z'

sl=: 4 : 0


SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

tpaths_validate=: 3 : 0
assert. fexist TPATH_UU
assert. fexist TPATH_UUC
assert. fexist TPATH_UUF
assert. fexist TPATH_UUM
i.0 0
)
]TPATH_UU=: jpath'~Gituu'
]TPATH_UUC=: TPATH_UU sl 'uuc.ijs'
]TPATH_UUF=: TPATH_UU sl 'uuf.ijs'
]TPATH_UUM=: TPATH_UU sl 'uum.ijs'
uuc=: 3 : 'openFolder TPATH_UUC'
uuf=: 3 : 'openFolder TPATH_UUF'
uum=: 3 : 'openFolder TPATH_UUM'
0 :0
Sunday 7 October 2018  12:48:11
-
Used by: formatin.ijs -for testing take_1_ verbs
)

cocurrent 'uu'

BLINK=: '##'

blink1=: 4 ddefine







f=. '~/sh/blink1-tool'
fade=. 100
color=. 'red'
r=. 255
g=. '0x66'
b=. 0
rgbWhite=. 'ff8844'
rgbWhite=. 'ff8855'
rgbFlame=. 'ff9900'
rgbFlame=. 'ff8800'
rgbYellow=. 'ff6600'
rgb=. rgbFlame
s=. 3
t0=. '(f) --off -m 0 &'
t1=. '(f) --(color) &'
t2=. '(f) --rgb (r),(g),(b) &'
t3=. '(f) --rgb=(rgb) &'
t4=. '(f) -m (fade) --rgb (r),(g),(b) --blink (s) &'
t=. ".'t',":x
select. y
case. '?' do. smoutput '+++ blink: shell cmd was: ',BLINK return.
case. 0 do. z=. sw '(f) --off -m 0 &'
case. 1 do. z=. sw '(f) --red &'
case. 2 do. z=. sw '(f) --green &'
case. 3 do. z=. sw '(f) --blue &'
case. 4 do. z=. sw t
case. 5 do. z=. sw '(f) --rgb (r),(g),(b) -m (fade) &'
case. 6 do. z=. sw '(f) --rgb (r),(g),(b) &'
case. 'white'  do. z=. sw '(f) -m 0 --rgb=(rgbWhite) &'
case. 'yellow' do. z=. sw '(f) -m 0 --rgb=(rgbYellow) &'
case. 'flame'  do. z=. sw '(f) -m 0 --rgb=(rgbFlame) &'

fcase. 'magenta' do.
fcase. 'cyan' do.
fcase. 'red' do.
fcase. 'green' do.
case. 'blue' do. z=. sw'(f) -m 0 --(y) &'
case.        do. z=. sw'(f) (y) &'
end.
2!:1 BLINK=:z
)

blink1 0

blink=: blink1
0 :0
blink '?'
-
blink 'red'
blink 'green'
blink 'blue'
blink 'magenta'
blink 'cyan'
blink 'yellow'
blink 'white'
blink 'flame'
-
blink 0
blink 1
blink 2
blink 3
blink 4
blink '--white'
blink 'white'
blink '--cyan'
blink 'cyan'
4 blink '--red --glimmer=10'
2!:1 '~/sh/blink1-tool --off -m 0 &'
2!:1 '~/sh/blink1-tool --rgb=ff6600 -m 0 &'
blink 4
3 blink 1
)

'==================== [uu] utilities ===================='

cocurrent 'uu'
cutByPattern=: 13 : '((;:y) -. <,ST) -.~ ;:x'
cutByPattern=: ((<,'*') -.~ [: ;: ]) -.~ [: ;: [
isLit=: 2 2048 e.~ 3!:0
ifdefined=: 0 <: [: 4!:0 <
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
isNo=: isNum *. isScalar
   
ddefine=: 1 : 'm&$: : (4 : 0)'
isBoxed=: 0 < L.
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw
ssw=: smoutput&sw
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

make_msg=: 1 ddefine


clearme''
talks=. x
if. y do.
  sessuu=: sessuu1
  msg=: sessuu&sw
  sllog=: sessuu&llog
  if. talks do. smoutput '+++ make_msg: msg is ON',LF end.
else.
  sessuu=: empty
  msg=: empty
  sllog=: empty
  if. talks do. smoutput '--- make_msg: msg is OFF',LF end.
end.
i.0 0
)

all=: *./
and=: *.
any=: +./
begins=: beginsWith=: ] -: [ {.~ [: # ]
brack=:	1 |. '][' , ":
cmx=: [: > <;._2
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~

report_complex_nouns=: 3 : 0

loc=. >coname''
nocomplex=. 1
for_no. nl 0 do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    smoutput nb 'cx:' ; nom ; 'is complex'
    nocomplex=. 0
  end.
end.

i.0 0
)

undefined=: (3 : 0)"0

if. -. 128!:5 y do. 0 return. end.
'_.' -: 5!:6 <'y'
)

quoted=: 3 : 0

(<toupper y) e. {."1 CUTAB
)

utoks=: 3 : 0

z=. sp1 y
z=. (z e. SP,SL) <;.1 z
)

vt=: viewtable=: '' ddefine






faux=. 'units unitv unitx uvalu uvalx uvalc unitc i'
if. '' -:x do. x=. faux end.
if. isNo y do.
  y=. y+i.10 default 'VIEWTABLE'
end.
if. isLit y do.
  y=. units i. ;:y
end.
st =. (":&.>)"0
cst=. ([: st [) ,. [: st ]
]h=. ,: ;: cols=. x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
h,y{t
)
dip=: 3 : 0

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

ID=: 3 : 0



units i. ;:y
)

utab=: 3 : 0

smoutput nb 'units' ;TAB; 'uvalu' ;TAB; 'uvalx'
if. 0=#y do. y=. i.#units end.
for_i. y do.
  smoutput nb i ; (brack >i{units) ;TAB; (iu=.i{uvalu) ;TAB; (ix=.i{uvalx)
  if.-. iu=ix do.
    smoutput TAB,'>>> uvalu not equal to uvalx'
  end.
end.
)

trv_z_=: trv=: 3 : 0

PLUS=. '+'
MINUS=. '-'
verbs1=. ;: 'uu formatIN formatOUT'
verbs2=. ;: 'uu'
verbs3=. ;: 'qtcode4i qtcode4anyunit qtcode4bareunit scale4bareunit'
select. {.y
case. ' '   do. z=. TRACEVERBS  
case. 0     do. z=. TRACEVERBS=: 0$a:
case. 1     do. z=. TRACEVERBS=: verbs1
case. 2     do. z=. TRACEVERBS=: verbs2
case. 3     do. z=. TRACEVERBS=: verbs3
case. PLUS  do. z=. TRACEVERBS=: ~. TRACEVERBS ,~ ;: y-.PLUS
case. MINUS do. z=. TRACEVERBS=: TRACEVERBS -. ;: y-.MINUS
case.       do. z=. TRACEVERBS=: ~. ;: y
end.
ssw '+++ trv: #:(#z) (LF)TRACEVERBS: (linz z)'
)


linz_z_=: linz=: 3 : 0

z=. }: ; (>y) ,. '|'
brack z -. SP
)

clearme=: 3 : 0

ME=: ''
i.0 0
)

pushme=: 1 ddefine

ME=: ~. ME ,~ ;:y
if. x do. msg '+++ (y): ENTERED' end.
i.0 0
)

popme=: 1 ddefine

if. x do. msg '--- (y): EXITS' end.
ME=: ME -. ;:y
i.0 0
)

sessuu1=: 3 : 0
if. traced ME do. smoutput y end.
i.0 0
)

traced=: 3 : 0


z=. {. boxopen y
any z e. a: default 'TRACEVERBS'
)

runlab=: 3 : 0


if. 0=#y do.
  ]y=. jpath'~Gituu/uu.ijt'
end.
if. -.fexist y do.
  smoutput '>>> runlab: file not found: ',y
  return.
end.
]thelab_z_=: y
trv 0
require '~addons/labs/labs/labs805.ijs'
lab_jlab_ thelab
)

tpath=: 3 : 0

smoutput'———————————————————————————'
]tt=. 'TPATH_' nl_z_ 0
for_tboxed. tt do. t=. >tboxed
  tx=. 16{. t,'_z_'
  ssw '(tx) =: ''(t~)'''
end.
smoutput'———————————————————————————'
)

tpaths=: 3 : 0

]z=. 'TPATH' nl_z_ 0
]p=. ".each z
]e=. (;fexist each p) { <"0'? '
smoutput e ,. z ,. p
for_t. z do.

  smoutput 'shell' c (quote'open ') c CM c >t
end.
i.0 0
)


'==================== [uu] main ===================='

cocurrent 'uu'

bris=: unucode@unslash1@undotted@deb"1

canc=: 4 : 0


z=. sp1 x
n=. SP,y
d=. SL,y
whilst. -. w-:z do.
  z=. (w=.z) rplc (n,d);'' ; (d,n);''
end.
)

canon=: 3 : 0
pushme 'canon'



z=. ; |. each sort |. each utoks y
	msg '... canon: z=(z)'

for_w. mks do. m=. ,>w
  if. any m E. z do.
    z=. (z canc m) coll m
	msg '... canon: [(m)] z=(z)'
  end.
end.
z=. debnSL dlb ; sort utoks z
if. 0=#z do. z=. ,SL end.
msg '--- canon: EXITS: z=(z)'
0 popme 'canon'
z return.
)

cnvi=: 1&$: : (4 : 0)

if. -.x do. y return. end.
zz=. ''
for_i. i.#y do. z=. >i{y
  if.     SL={.z do. zz=. zz,< SP,}.z
  elseif. SP={.z do. zz=. zz,< SL,}.z
  end.
end.
zz return.
)

coll=: 4 : 0
pushme 'coll'




P=. PW
z=. ,x
n=. SP,y
d=. SL,y
for_p. 4 3 2 do.
  z=. z rplc ((p*$n)$n);(n,P,":p) ; ((p*$d)$d);(d,P,":p)
  msg '+++ coll:   z=(z) power:p=(p)'
end.
0 popme 'coll'
z return.
)

curfig=: 3 : 'hy (0 j. 2)":y'
debSL=: #~ (+. (1: |. (> </\)))@('/'&~:)

debnSL=: 3 : 0


if. SL={.y do. SL,debSL }.y
else. debSL y
end.
)

deslash=: 1&$: : (4 : 0)
pushme 'deslash'



r=. ''
for_cu. utoks y do. cunit=. >cu
  if. (x=0) or SL={.cunit do.
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


]z=. utf8 deb y
if. x do.
  if. any HD E. z do. y return. end.
  ]z=. z rplc SP;HD
else.
  if. -.any HD E. z do. y return. end.
  z=. z rplc HD;SP
end.
)

eval=: 3 : 0 "1


y=. '/%-_Ee'charsub ;y
try. {.".y catch. UNDEFINED end.
)

exrate=: exrate_exch_
getversion=: 3 : 0

VERSION=: 'v.v.v'
assert. fexist y
load y sl 'manifest.ijs'
assert. -. absent 'VERSION'
erase 'FILES RELEASE LABCATEGORY PLATFORMS'
VERSION return.
)

hy=: '_-' charsub ]
isNaN=: 128!:5

iskg=: 3 : 0


if. y-:'kg' do. 1 return. end.
if. not 'kg' -: 2{.y do. 0 return. end.

if. any 'kg^' E. y do. 0 return. end.
1
)

midino=: midi4Hz=: 69 + 12 * 2 ^. 440 %~ ]

note=: note4Hz=: 3 : 0

NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
,>NOTE {~ rnd (12 | midino y)
)

Hz4note=: 3 : 0


NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
130.81
)

qty4str=: 3 : 0


val=. eval strValueOf y
uni=. dltb SP takeafter y
val ; uni
)

rnd=: [: <. 0.5 + ]

scino=: 3 : 0



fmt=. j. SIG * 1 _1 {~ ((10^SCI) <: |y)  or  ((10^-SIG) > |y)
if. (y=<.y) and (y<10^SCI) do. z=.":y else. z=.fmt ":y end.
if. SIZ>|y do. z=.'0',~ '- +'{~ 1+*y end.
z return.
)

selfcanc=: 3 : 0
pushme 'selfcanc'
msg '+++ selfcanc: ENTERED'


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

slash1=: 1&$: : (4 : 0)


z=. deb y
if. x do.
  if. SIC>:2 do. y return. end.
  if. ')'={:z do. y return. end.
  z=. canon z
  a=. '/' taketo z
  b=. '/' dropto z
  z=. a,'/',paren deb b rplc SL;SP
else.
  if. ')'~:{:z do. y return. end.
  a=. '(' taketo z
  b=. }: '(' takeafter z
  z=. a, b rplc SP;SL
end.
)

sp1=: 3 : 0

y=. deb y
if. SL~:{.y do. y=. SP,y end.
)

ssmx=: 4 : 'if. UCASE do. x ssmxU y else. x ssmxM y end.'
ssmxM=: 4 : 'I. * +/"(1) y ss"1 x'
ssmxU=: 4 : '(toupper x)ssmxM toupper y'

hasutf=: [: +./ 127 < a. i. ]
isascii=: [: *./ 128 > a. i. ]
undeslash=: 0&deslash

ucode=: 1 ddefine



y=. utf8 y
if. x do.
  if. -.isascii y do. y return. end.
  ]z=. y rplc ,cspel,.csymb

  if. 'u'={.z do. z=. 'µ',}.z end.
else.
  if. isascii y do. y return. end.

  ]z=. y rplc HD;SP
  ]z=. undeslash z rplc ,csymb,.cspel

  if. z begins ,'µ' do. z=. 'u',2}.z end.
end.
)

ucods=: 1&$: : (4 : 0)

SAV=. cspel ;< csymb
'cspel csymb'=: sspel ;< ssymb
z=. x ucode y
z [ 'cspel csymb'=: SAV
)

udat=: 4 : 0



'y zdesc'=. ']'cut y
zdesc=. dltb zdesc -.TAB
'y znits'=. '['cut y
if. x do.
  zfmla=. deb y-.TAB
  zdesc; znits; zfmla
else.
  zvalu=. (i=. y i. SP){.y=. deb y-.TAB
  znitv=. }.i}.y
  zdesc; znits; znitv; zvalu
end.
)

udiv=: 4 : 0


if. (1=#y) and (y=SL) do. x return. end.
z=. cnvi utoks y
z=. selfcanc x , ;z
z=. z rplc '/^2';'/'
)

udumb=: 3 : 0
'zdesc znits znitv zvalu'=. y
zdesc; znits; 1
)

make_units=: 0 ddefine




sspel=: <;._1 ' PI Ang Ohm ^-1 ^-2 ^-3 ^-4 ^2 ^3 ^4'
ssymb=: <;._1 '|π|Å|Ω|⁻¹|⁻²|⁻³|⁻⁴|²|³|⁴'

cspel=: sspel, <;._1 ' deg amin asec'
csymb=: ssymb, <;._1 '|°|''|"'


make_cutuuc''
'v uv us'=. <"1 |: cutuuc UUC
unitv=: deb each uv -.each TAB
units=: deb each us
uvalu=: eval >v

uvalx=: cycs=: (#UUC)$0
unitx=: (#UUC)$<'??'
i.0 0
)

mj=: 0 $~ 256
mj=: 1 ch}mj [ ch=. a.i. SP,TAB
mj=: 2 ch}mj [ ch=. a.i. az,AZ,n9,'._-/^*%'
mj=: 3 ch}mj [ ch=. a.i. '['
mj=: 4 ch}mj [ ch=. a.i. ']'


sj=: +. ".&> }. cutLF (0 define)
  X    S    A    [    ]
 1j1  0j0  1j1  1j1  1j1
 1j0  2j2  1j0  3j0  1j0
 2j2  2j0  2j0  5j2  2j0
 3j0  3j0  3j0  3j2  4j2
 4j6  4j6  4j6  4j6  4j6
 3j1  3j1  3j1  3j1  3j1
)

make_cutuuc=: 3 : 0


x=. 0;sj;mj

cutuuc=: x&;: "1
i.0 0
)
uniform=: '' ddefine
0 pushme 'uniform'

savedSIC=. SIC
if. -. x-:'' do. SIC=: x end.
msg '+++ uniform: ENTERED: x=(x) y=(y)'

y=. utf8 deb y
select. SIC
 case. 0 do.
  z=. unucode undotted y
 case. 1 do.
  ]z=. undotted y
  if. 1< +/SL=y do.
    ]z=. slash1 z
  end.
  ]z=. ucode z
fcase. 2 do.
 case. 3 do.
  if. y-: ,SL do.
    msg '--- uniform: y=SL returns NIL'
    0 popme 'uniform'
    '' [SIC=: savedSIC return.
  end.
  ]z=. unucode undotted y
  ]z=. ucode deslash unslash1 z
  if. SIC=3 do. z=. dotted z end.
end.
popme 'uniform'
z [SIC=: savedSIC return.
)

undeg=: 3600 %~ _ 60 60 #. 3 {. ]
undotted=: 0&dotted
unslash1=: 0&slash1
unucode=: 0&ucode
upost=: 4 : 'y,(x#~*SIC)'
uurowsc=: 4 : '(UUC ssmx y){UUC [UCASE=: x'
uurowsf=: 4 : '(UUF ssmx y){UUF [UCASE=: x'
validunits=: 3 : 'units e.~ <,y'

'==================== [uu] pp_encoding.ijs ===================='


cocurrent 'uu'

0 :0
Monday 20 August 2018  00:35:37
)

UNSETCODE=: BADCODE=: KILLERCODE=: ZEROCODE=: 0x
TRIVIALCODE=: 1x


Nmks=: #mks

Pmks=: x:p:i.Nmks

randompp=: 3 : '? Nmks#>:y'
encoded=:  3 : '*/ Pmks ^ y'
decodedx=: 3 : 'x:^:_1 Nmks q: y'
decodedr=: 3 : 'x:^:_1 -/decodedx 2 x: y'
decoded=: decodedx :: decodedr

expandcode=: (0 ddefine)"0

if. y=0 do. ,ST return. end.
asTokens=. x
for_p. decoded y[z=.'' do.
  unit=. p_index pick mks
  SS=. (p<0){SP,SL
  select. p
  case.  0 do. cell=. 0
  case.  1 do. cell=. SP,unit
  case. _1 do. cell=. SL,unit
  case.    do. cell=. SS,unit,PW,":|p
  end.
  if. p~:0 do.

    if. asTokens do. z=. z,<cell else. z=. z,cell end.
  end.
end.
if. asTokens do. z else. dlb z end.
)
isGoodCode=: ([: -. (ZEROCODE,%ZEROCODE) e.~ ])"0

make_unitc=: 1 ddefine


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


    'val code'=. qtcode4i i
    ssw '--- id=(i) val=(val) code=(crex code)(LF)'
    uvalc=: val  i}uvalc
    unitc=: code i}unitc
    n=. n+1
    assert 64 128 e.~ 3!:0 unitc
  end.
end.
n return.
)

qtcode4i=: (3 : 0)"0
pushme 'qtcode4i'

if. (y<0) or (y>:#UUC) do. 0;BADCODE return. end.
]valu=.    y{uvalu
]units_y=. y pick units
]unitv_y=. y pick unitv

if. unitv_y -: ,SL do. valu;TRIVIALCODE return. end.
if. unitv_y -: ,ST do. 1;KILLERCODE return. end.

if. Nmks > i=. mks i. <,units_y do. 1;i{Pmks return. end.
code=. y{unitc
msg '(LF)+++ qtcode4i[(y)]: units_y=[(units_y)] unitv_y=[(unitv_y)] code=(crex code)'


if. -. code e. UNSETCODE,BADCODE do.
  valc=. y{uvalc
  val=. valu*valc
  msg '--- qtcode4i: VALID1 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code return.
end.

'valc code'=. qtcode4anyunit unitv_y
msg '... qtcode4i: valc=(valc) code=(crex code) from: qtcode4anyunit ''(unitv_y)'''
if. -. code e. UNSETCODE,BADCODE do.
  val=. valu*valc
  msg '--- qtcode4i: VALID2 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  val;code
else.
  msg '--- qtcode4i: invalid-code=(crex code)'
  0;BADCODE
end.
)

qtcode4bareunit=: 3 : 0
pushme 'qtcode4bareunit'


i=. units i. <,y
msg '+++ qtcode4bareunit[(y)] id=(i) #uvalc=(#uvalc)'
if. (i<0) or (i >: #UUC) do. 0;BADCODE return. end.
valc=. i{uvalc
code=. i{unitc
msg '--- qtcode4bareunit[(y)] id=(i) valc=(valc) code=(crex code)'
popme 'qtcode4bareunit'
valc;code
)

qtcode4anyunit=: 3 : 0
pushme 'qtcode4anyunit'



msg '+++ qtcode4anyunit: y=[(y)]'
if. 0=#y    do. 1;TRIVIALCODE return. end.
if. (,SL)-: ,y do. 1;TRIVIALCODE return. end.
if. (,ST)-: ,y do. 1;KILLERCODE return. end.
v=. z=. 0$0x
for_t. utoks y do.
  'invert scale bareunit power'=. cnvCunit cunit=.>t
  'valu code'=. qtcode4bareunit bareunit
sllog 'cunit invert scale bareunit power valu code'
  if. invert do.
    z=. z , % (code^power)
    v=. v , scale % (valu^power)
  else.
    z=. z , code^power
    v=. v , scale * (valu^power)
  end.
end.
muv=. */v
muz=. */z
msg '--- qtcode4anyunit: y=[(y)] v=[(v)] muv=(muv); z=[(crex z)] muz=(muz)'
popme 'qtcode4anyunit'
muv;muz return.
)

cnvj=: cnvCunit=: 3 : 0
pushme 'cnvCunit'

z=. dltb y
k=. p=. 1

if. (SL~:{.z) and ((any PWM E. z) or (any PWU E. z)) do.
  z=. SL,z rplc PWM ; PW ; PWU ; PW
end.

if. j=.(SL={. sp1 z) do. z=. }.z end.
if. PW e. z do.

  'p z'=. (".{:z) ; (}:}:z)
end.
msg '+++ cnvCunit: y=(y) z=(z) j=(j) p=(p)'


if. (-.iskg z) and (not validunits z) do.
  'k z'=. scale4bareunit z
end.
msg '--- cnvCunit: j=(j) k=(k) z=(z) p=(p)'
popme 'cnvCunit'
j ; k ; z ; p return.
)











scale4bareunit=: 3 : 0



z=. ,y
k=. 1

dalen=. #da=. 'da'
mulen=. #mu=. 'µ'
if.     z beginsWith da do.	k=. 1e1  [ z=. dalen}.z
elseif. z beginsWith mu do.	k=. 1e_6 [ z=. mulen}.z
elseif. do.

  select. {.z
  case. 'h' do. k=. 1e2	[ z=.}.z
  case. 'k' do. k=. 1e3	[ z=.}.z
  case. 'M' do. k=. 1e6	[ z=.}.z
  case. 'G' do. k=. 1e9	[ z=.}.z
  case. 'T' do. k=. 1e12	[ z=.}.z
  case. 'P' do. k=. 1e15	[ z=.}.z
  case. 'E' do. k=. 1e18	[ z=.}.z
  case. 'Z' do. k=. 1e21	[ z=.}.z
  case. 'Y' do. k=. 1e24	[ z=.}.z
  case. 'd' do. k=. 1e_1	[ z=.}.z
  case. 'c' do. k=. 1e_2	[ z=.}.z
  case. 'm' do. k=. 1e_3	[ z=.}.z
  case. 'u' do. k=. 1e_6	[ z=.}.z
  case. 'n' do. k=. 1e_9	[ z=.}.z
  case. 'p' do. k=. 1e_12	[ z=.}.z
  case. 'f' do. k=. 1e_15	[ z=.}.z
  case. 'a' do. k=. 1e_18	[ z=.}.z
  case. 'z' do. k=. 1e_21	[ z=.}.z
  case. 'y' do. k=. 1e_24	[ z=.}.z
  end.
end.
z=. deb z
k ; z
)

0 :0
smoutput 8 1$' '
	uu '1 yd'
'ft'	uu '1 yd'
   	uu '100 degC'
   	uu '212 degF'
------------
'degC' 	uu '100 degC'
'degF' 	uu '100 degC'
'degF' 	uu '0 degC'
------------
'degC' 	uu '212 degF'
'degC' 	uu '373.15 K'
'degF' 	uu '373.15 K'
'Fahrenheit'uu '373.15 K'
'Centigrade'uu '373.15 K'
'Celsius'	uu '373.15 K'
   yf ; val ; unit
   '°C' 	uu '100 °C'
   '°C' 	uu '100°C'
)

compatible=: 4 : 0


ident=. ([: , [) -: ([: , ])
    if. ('*' ident x) or ('*' ident y) do. 1 return.
elseif. ('!' ident x) or ('!' ident y) do. 1 return.
end.
xcode=. 1 pick qtcode4anyunit x
ycode=. 1 pick qtcode4anyunit y
xcode -: ycode
)

compatlist=: 3 : 0

]ycode=. 1 pick qtcode4anyunit y
(ycode=unitc) # units
)

convert=: 1&$: : (4 : 0)"1
pushme 'convert'


yb=. bris y
msg '+++ convert: ENTERED: x=(x) y=(y) yb=(yb)'
'factor code'=. qtcode4anyunit yb
targ=. canon expandcode code
loop=. _
msg '--- convert: EXITS'
wd'msgs'
popme 'convert'
targ ; loop ; factor return.
)

uu=: ('' ddefine)"1

if. '*'={.y do. uuengine }.y return. end.
pushme 'uu'
NO_UNITS_NEEDED=: 0
]yf=: formatIN y
]val=: valueOf yf
]unit=: bris unitsOf yf
if. 0<#x do.
  targ=. bris x
  'coeft codet'=. qtcode4anyunit targ
  'coefu codeu'=. qtcode4anyunit unit
  if. codet ~: codeu do.
    emsg '>>> uu: incompatible units: x=(x) targ=(targ) unit=(unit)'
    emsg '... coeft=(coeft) coefu=(coefu) codet=(codet) codeu=(codeu)'
    BADQTY return.
  end.
  coeff=. coefu % coeft
  msg '... uu: x=[(x)]; coefu=(coefu) coeft=(coeft) coeff=(coeff) val=(val)'
else.
  'coeff code'=. qtcode4anyunit unit
  ]codet=. codeu=. code
  ]targ=. canon expandcode code
  msg '... uu: x=empty; coeff=(coeff) val=(val)'
end.
if. cannotScale unit do.
  ]va=. val
else.
  ]va=. coeff * val
end.
sllog 'uu__ val va coeff unit targ coefu codeu coeft codet'

]z=. targ formatOUT va


if. NO_UNITS_NEEDED do. z return.
else. deb z,SP,uniform targ return. end.
)

uniformD=: 3 : 0

brack sval=: strValueOf y
brack unit=: uniform unitsOf y
]sval,SP,unit
)

cannotScale=: 3 : 0

if. isTemperature y do. 1 return. end.
unsc=. ;:'gas.mark midino note'
if. unsc e.~ <y do. 1 return. end.
0 return.
)

isTemperature=: 3 : 0

by=. <deb y
if. y beginsWith 'deg' do. -.(y-:'deg') return.
elseif. by e. TEMPERATURE_SCALES do. 1 return.
elseif. by e. 2 {.each TEMPERATURE_SCALES do. 1 return.
elseif. by e. 2 {.each TEMPERATURE_SCALES do. 1 return.
elseif. do. 0 return.
end.
)

'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Wednesday 3 October 2018  22:33:44
-
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


VEX=: y
)

testf=: 3 : 0

if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
  nom=. ,>no
  smoutput nb nom ; TAB ; nom format y
end.
)

format=: formatOUT=: '' ddefine
0 pushme'formatOUT'
msg '+++ formatOUT: ENTERED, x=[(x)] y=[(y)]'
NO_UNITS_NEEDED=: 0
kx=. bris x
z=. kx daisychain y
msg '--- formatOUT: EXITS, last give_ verb: (VEX) -returns z=(z)'
0 popme'formatOUT'
z return.
)

make_daisychain=: 3 : 0

>z=. 'give_' nl 3
]z=. (; z,each <' ::'),'giverr'
daisychain=: 13 : ('x(',z,')y')
i.0 0
)

giverr=: 4 : 0
msg '>>> giverr: none chime: x=(x) y=(y)'
sw'(y) [??]'
)

deg_symbol=: 3 : 0
if. SIC>0 do. '°' else. 'deg' end.
)

deEuroName=: 3 : 0

y rplc 'é';'e' ; 'ø';'oe'
)
toK=: (4 : 0)"0
f=. {:>x
r=. -/>x
ICE_K + 100*(y-f)%r
)
fromK=: (4 : 0)"0
f=. {:>x
r=. -/>x
f+r*(y-ICE_K)%100
)

Kr=: ICE_K + 100 0

boil_freeze=: 3 : 0

select. y
 case. 'C'	do.	bf=. 100 0
 case. 'F'	do.	bf=. 212 32
 case. 'Ro'	do.	bf=. 60 7.5
 case. 'N'	do.	bf=. 33 0
 case. 'De'	do.	bf=. 0 150
 case. 'Ra'	do.	bf=. 671.64 491.67
 case. 'Re'	do.	bf=. 80 0
 case. 'K'	do.	bf=. ICE_K+100 0
 case.    	do.	bf=. _ _
end.
)

toKelvin=: 'F' ddefine


try. z=. y toK~ <boil_freeze x
     if. z<0 do. _. return. end.
catch. _. end.
)

fromKelvin=: 'F' ddefine


if. y<0 do. _. return. end.
try. y fromK~ <boil_freeze x
catch. _. end.
)

give_0_angle=: 4 : 0
register'give_0_angle'

assert. x -: 'deg'
ds=. deg_symbol''
d=. scino y
sw'(d)(ds)' [ NO_UNITS_NEEDED=: 1
)

give_1_deg=: 4 : 0
register'give_1_deg'

unit=. ,x
assert. isTemperature unit
T=. shorT unit
z=. T fromKelvin y
msg '... give_1_deg: x=(x) y=(y) unit=(unit) T=(T) z=(z)'
if. T-:'K' do.
  NO_UNITS_NEEDED=: 1
  sw'(z) K'
elseif. (<unit) e. ;:'Fahrenheit Centigrade Celsius' do.
  NO_UNITS_NEEDED=: 1
  sw'(z) (unit)'
elseif. do.
  NO_UNITS_NEEDED=: 1
  sw'(z)(deg_symbol 0)(T)'
end.
)

0 :0
'degC' give_0_deg 373.15
'degF' give_0_deg 373.15
uu '100 degC'
   'degC' 	uu '100 degC'
   'degF' 	uu '100 degC'
   'degF' 	uu '100 °C'
212°F
   'degC' 	uu '212 degF'
100°C
   'degC' 	uu '373.16 K'
100.01°C
   'degF' 	uu '373.16 K'
212.018°F
   'Fahrenheit'	uu '373.16 K'
212.018° Fahrenheit
   'Centigrade'	uu '373.16 K'
100.01° Centigrade
   'Celsius'	uu '373.16 K'
100.01° Celsius
)

give_0_misc=: 4 : 0
register'give_0_misc'

if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

give_9_general=: 4 : 0
register'give_9_general'


unit=. x
msg '... give_9_general: x=(x) y=(y) unit=(unit)'
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

give_0_hms=: 4 : 0
register'give_0_hms'

assert. x -: 'hms'
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
amin4deg=: 13 : '60 * y'
asec4deg=: 13 : '3600 * y'
amin4rad=: 13 : '60 * deg4rad y'
asec4rad=: 13 : '3600 * deg4rad y'
rad4deg=: 13 : '(o.|y) % 180'
rad4amin=: 13 : 'rad4deg y % 60'
rad4asec=: 13 : 'rad4deg y % 3600'

0 :0
give_0_dms=: 4 : 0
register'give_0_dms'

assert. x -: 'dms'
'd m s'=.":each <.each 360 60 60 #: asec4rad |y
ds=. deg_symbol''
sw'(d)(ds) (m)(QT) (s)"' [ NO_UNITS_NEEDED=: 1
)

give_0_dms=: 4 : 0
register'give_0_dms'

assert. x -: 'dms'
'd m s'=.":each <.each 360 60 60 #: asec4deg |y
ds=. deg_symbol''
sw'(d)(ds) (m)(QT) (s)"' [ NO_UNITS_NEEDED=: 1
)

0 :0
'dms' give_0_dms 1
)

give_2_note=: 4 : 0
register'give_2_note'
assert. x -: 'note'
sw'(note y) note' [ NO_UNITS_NEEDED=: 1
)

give_2_sci=: 4 : 0
register'give_2_sci'

z=. (toupper@hy@scino) y
unit=. x
msg '... give_2_sci: x=(x) y=(y) z=(z) unit=(unit)'
z return.
)

give_2_sig=: give_2_sci

make_daisychain''

'==================== [uu] formatin.ijs =================='
0 :0
Sunday 7 October 2018  15:11:37
-
formatIN -- input-counterpart to: format
)

cocurrent 'uu'
	
registerIN=: 3 : 0


VEXIN=: y
)

0 :0
formatIN '100 °C'
)

formatIN=: 3 : 0
0 pushme'formatIN'
msg '+++ formatIN: ENTERED, y=[(y)]'

blink 0
VEXIN=: '<UNSET>'
z=. daisychainIN y
msg '--- formatIN: EXITS, last take_ verb: (VEXIN) kuy=(kuy) -returns z=(z)'
0 popme'formatIN'
z return.
)

make_daisychainIN=: 3 : 0


>z=. 'take_' nl 3
]z=. (; z,each <' ::'),'takerr'
daisychainIN=: 13 : ('(',z,')y')
i.0 0
)

takerr=: 3 : 0
msg '>>> takerr: none chime: x=(x) y=(y)'
sw'(y) [???]'
)

valueOf=: 3 : 0


try. val=. ". strValueOf y
catch. _. end.
)

strValueOf=: 3 : 0


SP taketo y rplc (deg_symbol 0) ; SP
)

unitsOf=: 3 : 0

numeral=. strValueOf y
deb y }.~ #numeral
)

dedeg=: 3 : 0

y=. deb y
if. y beginsWith 'deg' do. dlb 3}.y else. y end.
)

0 :0
brack dedeg 'degC'
brack dedeg 'deg C'
brack dedeg ' degC'
brack dedeg ' deg C'
)

shorT=: 3 : 0


y=. dedeg deEuroName y
T=. {.y
if. T e. 'RD' do. T=. 2{.y end.
)

0 :0
brack shorT 'degC'
brack shorT 'deg C'
brack shorT ' degC'
brack shorT ' deg C'
brack shorT 'Réaumur'
deEuroName 'Réaumur'
brack shorT 'Reaumur'
)

take_0_angle=: 3 : 0
registerIN 'take_0_angle'
blink'green'



yb=. (bris y) rplc 'deg' ; ' deg'
]unit=. deb unitsOf yb
assert. (unit-:'deg')or(unit-:'rad')
yb return.
)

0 :0
foo=: uu
foo=: take_0_angle
foo '180°'
foo '180 °'
foo '180deg'
foo '180 deg'
foo '1 rad'
foo 'PI rad'
foo 'π rad'
'deg' uu 'PI rad'
'°' uu 'PI rad'
'deg' uu 'π rad'
uu 'π rad'
'°' uu 'π rad'
)

take_1_deg=: 3 : 0
registerIN 'take_1_deg'
blink'red'


y=. y rplc 'deg' ; ' deg'
]unit=. deb bris unitsOf y
assert. isTemperature unit
]T=. shorT unit
msg '... take_1_deg: unit=[(unit)] T=(T)'
assert. -.undefined vy=. valueOf y
]z=. T toKelvin vy
msg '... take_1_deg: y=[(y)] unit=(unit) T=(T) z=(z)'
sw'(z) K'
)

0 :0
uu '100 degC'
'degC' uu '100 degC'
'degC' uu '212 degF'
take_1_deg '100 degC'
take_1_deg '212 degF'
take_1_deg '212degF'
take_1_deg '212 °F'
take_1_deg '212°F'
-
REMAINING BLINKS...
blink 'magenta'
blink 'cyan'
blink 'yellow'
blink 'flame'
)

take_8_misc=: 3 : 0
registerIN'take_8_misc'
blink 'blue'

if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞' else. infinity=. 'infinity' end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

take_9_general=: 3 : 0
registerIN'take_9_general'
blink'white'


z=. y
msg '... take_9_general: y=(y) --> z=(z)'
z return.
)

sval_unit=: '' ddefine

sval=. SP taketo y -. '°'
if. 0<#x do. 
  unit=. bris x
else.
  unit=. bris SP takeafter y
end.
sval,SP,unit
)

split_val_unit=: 3 : 0

val=. ". SP taketo y -. '°'
unit=. bris SP takeafter y
val ; unit
)

make_daisychainIN''

'==================== [uu] uu_interface ===================='

cocurrent 'uu'

uuengine=: 3 : 0




arg=. dltb '>' taketo 4}.y
targ=. dltb '>' takeafter y
numarg=. {.0". arg
select. 4{.y
case. 'CPAT' do.
		targ compatible arg
case. 'CPLI' do.
		compatlist arg
case. 'CNVJ' do.
		cnvj arg
case. 'CONV' do.
		convert arg
case. 'CONS' do.
		0&udat arg
case. 'DUMB' do.
		udumb arg
case. 'FUNC' do.
		1&udat arg
case. 'FMTI' do.
		formatIN arg
case. 'FMTO' do.
		formatOUT qty4str arg
case. 'QSCI' do.
		SCI
case. 'QSIC' do.
		SIC
case. 'QSIG' do.
		SIG
case. 'QSIZ' do.
		SIZ
case. 'SCIN' do.
		scino numarg
case. 'SELF' do.
		selfcanc arg
case. 'UCOD' do.
		ucode arg
case. 'UCOS' do.
		ucods arg
case. 'UNUC' do.
		0&ucode arg
case. 'UDIV' do.
		targ udiv arg
case. 'UNIF' do.
		uniform arg
case. 'UUUU' do.
		targ uu arg
case. 'VUUC' do.
		x2f 0 uurowsc arg
case. 'VUUF' do.
		x2f 0 uurowsf arg
case. 'VUUM' do.
		x2f UUM
case. 'WUUC' do.
		x2f 1 uurowsc arg
case. 'WUUF' do.
		x2f 1 uurowsf arg
case. 'WUUM' do.
		x2f UUM
case. 'fcty' do.
		factory''
case. 'ssci' do.
		SCI=: numarg
case. 'ssic' do.
		SIC=: numarg
case. 'ssig' do.
		SIG=: numarg
case. 'ssiz' do.
		SIZ=: numarg
case. 'strt' do.
		start''
case.        do. '>>> uuengine: bad instruction: ';y
end.
)

'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0





ssw '+++ [uu] start: ENTERED. y=(y)'
if. isNo y do. SIC=: y end.
0 make_msg 0
factory''
tpaths_validate''
VERSION=: getversion TPATH_UU
load TPATH_UUC
load TPATH_UUF
load TPATH_UUM
make_units''

make_unitc''

report_complex_nouns''
make_msg DIAGNOSTICS
ssw '+++ [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy
start''
