0 :0
Saturday 29 December 2018  15:21:14
-
UU: scientific units conversion package
)

clear 'uu'
coclass 'uu'
onload_z_=: empty

AABUILT=: '2018-12-29  15:21:55'
AABUILT=: '2018-12-29  15:33:46'
AABUILT=: '2018-12-29  15:46:13'
AABUILT=: '2019-01-01  20:26:37'
AABUILT=: '2019-01-27  10:18:11'
AABUILT=: '2019-02-22  22:49:49'
AABUILT=: '2019-02-25  12:14:59'
AABUILT=: '2019-02-25  12:15:29'
AABUILT=: '2019-02-25  12:30:23'
AABUILT=: '2019-02-25  12:31:04'
AABUILT=: '2019-02-25  12:38:52'
AABUILT=: '2019-03-16  11:27:12'
AABUILT=: '2019-03-16  11:48:39'
AABUILT=: '2019-03-16  14:32:11'
AABUILT=: '2019-03-16  19:51:17'
AABUILT=: '2019-03-16  19:55:54'
AABUILT=: '2019-03-16  19:57:05'
AABUILT=: '2019-03-19  17:40:10'
AABUILT=: '2019-03-19  19:06:38'
AABUILT=: '2019-03-19  19:07:31'
AABUILT=: '2019-03-19  23:16:02'
AABUILT=: '2019-03-19  23:18:17'
AABUILT=: '2019-03-19  23:18:38'
AABUILT=: '2019-03-19  23:27:36'
AABUILT=: '2019-03-19  23:27:45'
AABUILT=: '2019-03-19  23:32:14'
AABUILT=: '2019-03-20  00:01:11'
AABUILT=: '2019-03-20  00:10:48'
AABUILT=: '2019-03-20  00:15:01'
AABUILT=: '2019-03-20  00:27:51'
AABUILT=: '2019-03-20  00:34:40'
AABUILT=: '2019-03-20  00:57:58'
AABUILT=: '2019-03-20  14:10:37'
AABUILT=: '2019-03-20  14:10:49'
AABUILT=: '2019-03-20  19:36:23'
AABUILT=: '2019-03-20  19:38:27'
AABUILT=: '2019-03-21  01:53:02'
AABUILT=: '2019-03-27  23:03:53'
AABUILT=: '2019-03-28  01:04:22'
AABUILT=: '2019-03-28  01:40:41'
AABUILT=: '2019-03-28  01:53:29'
AABUILT=: '2019-03-28  01:56:12'
AABUILT=: '2019-03-29  13:05:14'
AABUILT=: '2019-03-29  13:08:23'
AABUILT=: '2019-03-29  13:09:26'
AABUILT=: '2019-03-29  13:14:20'
AABUILT=: '2019-03-29  13:15:31'
AABUILT=: '2019-03-29  13:16:08'
AABUILT=: '2019-03-29  13:23:04'
AABUILT=: '2019-03-29  13:28:04'
AABUILT=: '2019-03-30  17:25:57'
AABUILT=: '2019-03-30  17:27:46'
AABUILT=: '2019-03-30  17:29:32'
AABUILT=: '2019-03-30  17:30:15'
AABUILT=: '2019-03-30  18:11:14'
AABUILT=: '2019-03-30  18:15:09'

'==================== [uu] constants ===================='

cocurrent 'uu'

0 :0
Wednesday 20 March 2019  19:21:15
)



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

SIC=: 1
SIG=: 3
SCI=: 5
SIZ=: 1e_9
ZERO=: 'NO'
i.0 0
)
b4f=: f2b=:	[: <;._1 LF , ]

CANNOTSCALE=: b4f }: 0 : 0
gas.mark
midino
note
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
SIbu=: ;:'m kg s A K mol cd'
mks=:   SIbu,'rad';'eur'

PI=: 314159265358979323846264338327950288419716939937510r100000000000000000000000000000000000000000000000000 

'==================== [uu] utilities ===================='

cocurrent 'uu'

sl_z_=: 4 : 0



SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

real=: 9&o.
imag=: 11&o.
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

smresolve=. (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw
ssw=: smoutput&sw
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

all=: *./
and=: *.
any=: +./
o4b=: b2o=:	}.@((<SP) ;@,. ])
b4o=: o2b=:	[: <;._1 SP , ]
b4f=: f2b=:	[: <;._1 LF , ]


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







faux=. 'i unitc units unitv uvalc rvalc uvalu rvalu uvald rvald'

if. '' -:x do. x=. faux end.
if. isNo y do.
  y=. y+i.10 default 'VIEWTABLE'
end.
if. isLit y do.
  y=. units i. b4o y
end.
st =. (":&.>)"0
cst=. ([: st [) ,. [: st ]
]h=. ,: ;: cols=. x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
h,y{t
)
0 :0
vt I. uvalc ~: uvalu
vt I. uvald>0
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

runlab=: 3 : 0


if. 0=#y do.
  ]y=. jpath'~Gituu/uu.ijt'
end.
if. -.fexist y do.
  smoutput '>>> runlab: file not found: ',y
  return.
end.
]thelab_z_=: y
trace 0
require '~addons/labs/labs/labs805.ijs'
lab_jlab_ thelab
)

uuc_z_=: 3 : 'open ''~UUC'''
uuf_z_=: 3 : 'open ''~UUF'''
uum_z_=: 3 : 'open ''~UUM'''

'==================== [uu] rational ===================='

0 :0
Tuesday 19 March 2019  17:10:47
-
from: tempuu 76
-
NOW just needs to handle: 4p1/3 -or is it: 4/3p3
  accept 1/2p1, also 1r2p1
  -but these are formally floating !!
-
assert 'rational'-:datatype z
	in all rat4* verbs?
make reval recursive where it matters.
-
Be suspicious of: __r1&". 
-How might number-detection actually fail?
)

cocurrent 'uu'

notFloat=: 3 : 0

-. (datatype y) -: 'floating'
)

derat=: derationalized=: _1&x:

rat=: rational=: 3 : 0 "0


reval ":y
)

reval=: 3 : 0 "1


y__=: y
y=. deb >y
    if. all y e. n9 do. ". y,'x'
elseif. '/' e. y do. __r1&". '/r-_'charsub y
elseif. 'j' e. y do. rat4sc 'j' taketo y
elseif. y-: ,'_' do. _r1
elseif. y-: '__' do. __r1
elseif. all y e. n9,'._' do. rat4sc y
elseif. 'e' e. y do. rat4sc y
elseif. 'p' e. y do. rat4pi y
elseif. 'r' e. y do. rat4r y
elseif. 'x'= {:y do. rat4x y
elseif. do. _r1 [ssw '>>> reval: cannot handle y=[(y)]'
end.
)

ieval=: 3 : 0 "1


y=. deb >y
if. 'j' e. y do. rat4sc 'j' takeafter y
else. 0r1
end.
)

rat4x=: 3 : 0 "1

msg '... rat4x: y=(y) [(derationalized ".y)]'
".y
)

rat4r=: 3 : 0 "1

msg '... rat4r: y=(y) [(derationalized ".y)]'
".y
)

rat4pi=: 3 : 0 "1


'c d'=. <;._2 y,'p'
a=. ".c
b=. ".d
". sw '(a)*PI^(b)'
)

rat4sc=: 3 : 0 "1

c=. 'e' taketo y
a=. ".c-.DT
b=. ".y
scale=. rnd 10^. a%b
if. 'rational'-:datatype b do. b
elseif. scale<0      do. ". ((c-.DT) , (|scale)#'0') , 'r1'
elseif.              do. ". (c-.DT) , 'r1' , scale#'0'
end.
)
0 :0
rat4sc '_1.23e_5'
rat4sc '_1.23E_5'
rat4sc '_1.23E-5'
rat4sc '-1.23E-5'
)

rat_check=: 3 : 0

assert. all uvalu = derationalized rvalu
assert. all uvald = derationalized rvald
assert. all uvalc = derationalized rvalc
assert. -. 0 e. uvalc
)

'==================== [uu] syntax_machines ===================='
0 :0
Thursday 15 November 2018  05:05:14
-
Syntax machines defined in this script:
	cutuuc	-tokenizes a line of UUC
	smddmmyy	-recognises date
	smtime	-recognises time
)

cocurrent 'uu'

spout=: 3 ddefine

w=. {:$z=. vv y
for_k. i.x-w do.
  z=. SP,.z
end.
,z
)

f5=: 3 : 0

Outsymbols=. ' .:|;!$'
z=. |: (5;sj;mj);: y
i=. 0{z
j=. 1{z
r=. 2{z
c=. 3{z
R=. 4{z
O=. 5{z
iy=. i{y
smoutput '           ',spout i
smoutput '       (y) ',spout iy
smoutput 'y-class(c) ',spout c
smoutput '  state(r) ',spout r
smoutput 'outcode(O) ',spout O{Outsymbols
smoutput 'w-begin(j) ',spout j
)

mj=. 0 $~ 256
mj=. 1 ch}mj [ ch=. a.i. SP,TAB
mj=. 2 ch}mj [ ch=. a.i. az,AZ,n9,'._-/^*%'
mj=. 3 ch}mj [ ch=. a.i. '['
mj=. 4 ch}mj [ ch=. a.i. ']'


sj=. +. ".&> }. cutLF (0 define)
  X    S    A    [    ]
 1j1  0j0  1j1  1j1  1j1
 1j0  2j2  1j0  3j0  1j0
 2j2  2j0  2j0  5j2  2j0
 3j0  3j0  3j0  3j2  4j2
 4j6  4j6  4j6  4j6  4j6
 3j1  3j1  3j1  3j1  3j1
)

cutuuc=: (0;sj;mj)&;: "1
t=. ,: 0   0   0j6 0j6 1j1 1j1 0j6
t=. t, 0j6 0j6 0j6 0j6 2   2   0j6
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 0j6 4j1 4j1 0j6
t=. t, 0j6 0j6 0j6 0j6 5   5   0j6
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 0j6 7j1 7j1 0j6
t=. t, 0j6 0j6 0j6 0j6 8   8   0j6
t=. t, 0j3 0j3 0j6 9   0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 0j6 10  10  0j6
t=. t, 0j3 0j3 0j6 0j6 10  10  0j6

sj=. +. t
mj=.   < LF ; (NUL,SP,TAB) ; CO ; DT ; '012345' ; '6789'
smtime=: ((0;sj;mj) ;: ucp)"1

onload"1 cmx 0 : 0
smoutput smtime '23:58'
smoutput smtime '23:58:59'
smoutput smtime '23:58:59.12'
smoutput smtime '23:58:59.'
smoutput smtime '23:58:59. '
smoutput smtime '23:58:59   '
)
t=. ,: 0   0   0j6 1j1 1j1 0j6 0j6
t=. t, 0j6 0j6 0j6 2   2   2   0j6
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 4j1 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 5   5   5   0j6
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 7j1 0j6 0j6 0j6
t=. t, 0j6 0j6 0j6 8   8   8   0j6
t=. t, 0j3 0j3 0j6 0j6 0j6 0j6 0j6

sj=. +. t
mj=.   < LF ; (NUL,SP,TAB) ; SL ; '01' ; '23' ; '456789'
smddmmyy=: ((0;sj;mj) ;: ucp)"1

onload"1 cmx 0 : 0
smoutput smddmmyy '31/12/18'
smoutput smddmmyy '31/13/18   '
smoutput smddmmyy '31/13/18',LF
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

displacement=: (3 : 'uvald {~ units i. <,y') :: 0:
rdisplacement=: (3 : 'rvald {~ units i. <,y') :: 0:

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

exrate=: exrate_exch_
getversion=: 3 : 0

VERSION=: 'v.v.v'
assert. fexist y
load y sl 'manifest.ijs'
assert. -. NaNoun 'VERSION'
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

scino=: (3 : 0)"0



if. y=<.y do. ":y return. end.
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

udat=: (4 : 0)"1



'y zdesc'=. 2{. ']'cut y
zdesc=. dltb zdesc -.TAB
'y znits'=. 2{. '['cut y
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
csymb=: ssymb, <;._1 '|°|′|″'
'v uv us'=: <"1 |: cutuuc UUC
unitv=: deb each uv -.each TAB
units=: deb each us
uvald=: imag eval >v
assert. notFloat rvald=: ieval >v
uvalu=: real eval >v
assert. notFloat rvalu=: reval >v
i.0 0
)

eval=: 3 : 0 "1



y=. '/%-_Ee'charsub >y
try. {.".y catch. UNDEFINED end.
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
listedUnits=: 3 : 'units e.~ <,y'
pushme=: empty
popme=: empty

trace=: 3 : 0



if. y do.
  msg=: smoutput&sw
  sllog=: smoutput&llog
else.
  msg=: empty
  sllog=: empty
end.
smoutput '+++ trace ',":y
i.0 0
)

'==================== [uu] pp_encoding.ijs ===================='


cocurrent 'uu'

0 :0
Wednesday 20 March 2019  19:21:15
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
  rvalc=:(#UUC)$0r1
  unitc=:(#UUC)$UNSETCODE
end.
for_i. i.#UUC [n=.0 do.
  val=. i{uvalc [code=. i{unitc
  rval=. i{rvalc
  if. (-. isGoodCode code) or (0=rval) do.
    ssw '--- id=(i) val=(val) code=(crex code) [(i pick units)]'

    'val rval code'=. qtcode4i i
    ssw '--- id=(i) val=(val) rval=(rval) code=(crex code)(LF)'
    uvalc=: val  i}uvalc
    rvalc=: rval i}rvalc
    unitc=: code i}unitc
    n=. n+1
    assert. 64 128 e.~ 3!:0 unitc
  end.
end.
n return.
)

qtcode4i=: (3 : 0)"0
pushme 'qtcode4i'

if. (y<0) or (y>:#UUC) do. 0;BADCODE return. end.
]valu=.    y{uvalu
]ralu=.    y{rvalu
]valc=.    y{uvalc
]ralc=.    y{rvalc
]vald=.    y{uvald
]rald=.    y{rvald
]units_y=. y pick units
]unitv_y=. y pick unitv

if. unitv_y -: ,SL do. valu;ralu;TRIVIALCODE return. end.
if. unitv_y -: ,ST do. 1;1r1;KILLERCODE return. end.

if. Nmks > i=. mks i. <,units_y do. 1;1r1;i{Pmks return. end.
code=. y{unitc
msg '(LF)+++ qtcode4i[(y)]: units_y=[(units_y)] unitv_y=[(unitv_y)] code=(crex code)'


if. -. code e. UNSETCODE,BADCODE do.
  msg '--- qtcode4i: VALID1 code=(crex code) valu=(valu) valc=(valc) valu*valc=(val)'
  msg '--- qtcode4i: VALID1 code=(crex code) ralu=(ralu) ralc=(ralc) ralu*ralc=(ral)'
  (valu*valc);(ralu*ralc);code return.
end.

'valc ralc code'=. qtcode4anyunit unitv_y
msg '... qtcode4i: valc=(valc) ralc=(ralc) code=(crex code) from: qtcode4anyunit ''(unitv_y)'''
if. code e. UNSETCODE,BADCODE do.
  msg '--- qtcode4i: invalid-code=(crex code)'
  0;0r1;BADCODE
else.
  val=. valu*valc
  ral=. ralu*ralc
  msg '--- qtcode4i: VALID2 code=(crex code) valu=(valu) valc=(valc) ralu=(ralu) ralc=(ralc) valu*valc=(val) ralu*ralc=(ral)'
  val;ral;code
end.
)

qtcode4bareunit=: 3 : 0
pushme 'qtcode4bareunit'


i=. units i. <,y
msg '+++ qtcode4bareunit[(y)] id=(i) #uvalc=(#uvalc)'
if. (i<0) or (i >: #UUC) do. 0;0r1;BADCODE return. end.
valc=. i{uvalc
ralc=. i{rvalc
code=. i{unitc
msg '--- qtcode4bareunit[(y)] id=(i) valc=(valc) ralc=(ralc) code=(crex code)'
popme 'qtcode4bareunit'
valc;ralc;code
)

qtcode4anyunit=: 3 : 0
pushme 'qtcode4anyunit'



msg '+++ qtcode4anyunit: y=[(y)]'
if. 0=#y    do. 1;1r1;TRIVIALCODE return. end.
if. (,SL)-: ,y do. 1;1r1;TRIVIALCODE return. end.
if. (,ST)-: ,y do. 1;1r1;KILLERCODE return. end.
r=. v=. z=. 0$0x
for_t. utoks y do.
  'invert scale bareunit power'=. cnvCunit cunit=.>t
  rscale=. rational scale
  rpower=. rational power
  'valu ralu code'=. qtcode4bareunit bareunit
sllog 'cunit invert scale bareunit power code valu ralu rscale rpower'
  if. invert do.
    z=. z , % (code^power)
    v=. v , scale % (valu^power)
    assert. notFloat r=. r , rscale % (ralu^rpower)
  else.
    z=. z , code^power
    v=. v , scale * (valu^power)
    assert. notFloat r=. r , rscale * (ralu^rpower)
  end.
end.
muv=. */v
mur=. */r
muz=. */z
msg '--- qtcode4anyunit: y=[(y)] v=[(v)] muv=(muv) mur=(mur); z=[(crex z)] muz=(muz)'
popme 'qtcode4anyunit'
muv;mur;muz return.
)

cnvCunit=: 3 : 0
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


if. (-.iskg z) and (-.listedUnits z) do.
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

if. 1=#('/'taketo z) do. k;z return. end.
if. da-:('/'taketo z) do. k;z return. end.
if. mu-:('/'taketo z) do. k;z return. end.

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

compatible=: 4 : 0


ident=. ([: , [) -: ([: , ])
    if. ('*' ident x) or ('*' ident y) do. 1 return.
elseif. ('!' ident x) or ('!' ident y) do. 1 return.
end.
xcode=. >{: qtcode4anyunit x
ycode=. >{: qtcode4anyunit y
xcode -: ycode
)

compatlist=: 3 : 0

]ycode=. >{: qtcode4anyunit y
(ycode=unitc) # units
)

convert=: 1&$: : (4 : 0)"1
pushme 'convert'


yb=. bris y
disp=. displacement yb
rdisp=. rdisplacement yb
msg '+++ convert: ENTERED: x=(x) y=(y) yb=(yb) disp=(disp) rdisp=(rdisp)'
'factor rfactor code'=. qtcode4anyunit yb
targ=. canon expandcode code
msg '--- convert: EXITS'
wd'msgs'
popme 'convert'
targ ; rdisp ; rfactor return.
)

uniformD=: 3 : 0

brack sval=: strValueOf y
brack unit=: uniform unitsOf y
]sval,SP,unit
)

cannotScale=: 3 : 'CANNOTSCALE e.~ <deb y'


isTemperature=: 3 : 0

by=. <deb y
if. y beginsWith 'deg' do. -.(y-:'deg') return.
elseif. by e. TEMPERATURE_SCALES do. 1 return.
elseif. by e. 2 {.each TEMPERATURE_SCALES do. 1 return.
elseif. by e. 2 {.each TEMPERATURE_SCALES do. 1 return.
elseif. do. 0 return.
end.
)

uu=: ('' ddefine)"1

if. '*'={.y do. uuengine }.y return. end.
pushme 'uu'
yf=: dltb formatIN y
valu=: valueOf yf
ralu=: rvalueOf yf
unit=: bris unitsOf yf
	sllog 'uu_0 x y yf valu ralu unit'
if. 0=#x do.
  'coefu rcoefu code'=. qtcode4anyunit unit
  coeft=. 1
  rcoeft=. 1r1
  codet=. codeu=. code
  targ=. canon expandcode code
	sllog 'uu_1 targ unit'
elseif. x-:'=' do.
  targ=. unit
elseif. do.
  targ=. bris x
  'coeft rcoeft codet'=. qtcode4anyunit targ
  'coefu rcoefu codeu'=. qtcode4anyunit unit
	sllog 'uu_1 targ unit'
	sllog 'uu_1 coeft coefu rcoeft rcoefu codet codeu'
  if. codet ~: codeu do.
    emsg '>>> uu: incompatible units: x=(x) targ=(targ) unit=(unit)'
    emsg '... coeft=(coeft) coefu=(coefu) rcoeft=(coeft) rcoefu=(coefu) codet=(codet) codeu=(codeu)'
    BADQTY return.
  end.
end.

if. (cannotScale unit) or (x-:'=') do.
  vatarg=. valu
  ratarg=. ralu
else.
  dispt=. displacement targ
  dispu=. displacement unit
  rdispt=. rdisplacement targ
  rdispu=. rdisplacement unit
  vatarg=. valu scale_displace~ coeft,coefu,dispt,dispu
  assert. notFloat ratarg=. ralu scale_displace~ rcoeft,rcoefu,rdispt,rdispu
end.

UU_VALUE=: ratarg


z=. targ formatOUT vatarg
	sllog 'uu_3 z vatarg VEXIN VEX'

if. NO_UNITS_NEEDED do. z else. deb z,SP,uniform targ end.
)

scale_displace=: 4 : 0




'coeft coefu dispt dispu'=. z=: x,(4-~#x){.1 1 0 0
vaSI=. dispu + y*coefu
(vaSI-dispt)%coeft
)

'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Thursday 15 November 2018  04:10:53
-
-cloned into: temp 45 pre-purge of FahR etc: 15 November 2018
NOTE: temp 45 may have some useful test expressions purged from here.
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

give_0_angle=: 4 : 0
register'give_0_angle'

assert. x -: 'deg'
ds=. deg_symbol''
d=. scino y
sw'(d)(ds)' [ NO_UNITS_NEEDED=: 1
)

give_0_yesno=: 4 : 0
register'give_0_yesno'


assert. (,x) -: ,'!'
NO_UNITS_NEEDED=: 1
if. y=0 do. ZERO
else.
select. ZERO
case. 'no' do. 'yes'
case. 'NO' do. 'YES'
case. 'off' do. 'on'
case. 'OFF' do. 'ON'
case. 'lo' do. 'hi'
case. 'LO' do. 'HI'
case. 'low' do. 'high'
case. 'LOW' do. 'HIGH'
case. 'false' do. 'true'
case. 'FALSE' do. 'TRUE'
case. do. '~',ZERO
end.
end.
)
0 :0
'!' give_0_yesno 0
'!' give_0_yesno 1
uu '0 !'
'!' uu '0 !'
uu '1 !'
'!' uu '1 !'
)

give_1_temp=: 4 : 0

register'give_1_temp'
unit=. ,x
assert. isTemperature unit
sllog 'VEX x y unit disp'
sw'(scino y)'
)
0 :0
'degRo' give_1_temp 373.15
'degRo' uu '373.15 K'
'degRo' uu '1 b.p'
'degRo' uu '1 f.p'
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

give_0_hms=: 4 : 0
register'give_0_hms'

assert. x -: 'hms'
'hh mm ss'=.":each 24 60 60 #: y
if. 10>".hh do. hh=. '0',hh end.
if. 10>".mm do. mm=. '0',mm end.
if. 10>".ss do. ss=. '0',ss end.
sw'(hh):(mm):(ss)'
)

give_0_dms=: 4 : 0
register'give_0_dms'

asec4deg=. 3600 * ]
assert. x -: 'dms'
'd m s'=.":each <.each 360 60 60 #: asec4deg |y
ds=. deg_symbol''
sw'(d)(ds) (m)(QT) (s)"' [ NO_UNITS_NEEDED=: 1
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
Thursday 15 November 2018  04:11:02
-
formatIN -- input-counterpart to: format
-cloned into: temp 44 pre-purge of FahR etc: 15 November 2018
NOTE: temp 44 may have some useful test expressions purged from here.
)

cocurrent 'uu'
	
registerIN=: 3 : 0


VEXIN=: y
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

rvalueOf=: 3 : 0


try. val=. reval strValueOf y
catch. _. end.
)

strValueOf=: 3 : 0


SP taketo y rplc (deg_symbol 0) ; SP
)

unitsOf=: 3 : 0

numeral=. strValueOf y
deb y }.~ #numeral
)

take_0_angle=: 3 : 0
registerIN 'take_0_angle'
blink'green'



yb=. (bris y) rplc 'deg' ; ' deg'
]unit=. deb unitsOf yb
assert. (unit-:'deg')or(unit-:'rad')
yb return.
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

'==================== [uuengine] uu_interface ===================='

0 :0
Tuesday 19 March 2019  19:05:51
)

cocurrent 'uu'

uuengine=: 3 : 0







if. isBoxed y do. y=. b2o y end.
uarg=. (0&uniform) arg=. dltb '>' taketo yy=. dltb 4}.y
utarg=. (0&uniform) targ=. dltb '>' takeafter y
numarg=. {.0". arg
select. 4{.y
case. 'CPAT' do.
		utarg compatible uarg
case. 'CPLI' do.
		compatlist uarg
case. 'CNVJ' do.
		cnvCunit uarg
case. 'CONV' do.
		convert uarg
case. 'CONS' do.
		0&udat arg
case. 'DISP' do.
		rdisplacement uarg
case. 'DUMB' do.
		udumb arg
case. 'FUNC' do.
		1&udat arg
case. 'FMTI' do.
		formatIN arg
case. 'FMTO' do.
		(bris unitsOf arg) format valueOf arg
case. 'QRAT' do.
		UU_VALUE
case. 'QSCI' do.
		SCI
case. 'QSIC' do.
		SIC
case. 'QSIG' do.
		SIG
case. 'QSIZ' do.
		SIZ
case. 'QZER' do.
		ZERO
case. 'SCIN' do.
		scino numarg
case. 'SELF' do.
		selfcanc uarg
case. 'UCOD' do.
		ucode arg
case. 'UCOS' do.
		ucods arg
case. 'UNUC' do.
		uarg
case. 'UDIV' do.
		utarg udiv uarg
case. 'UNIF' do.
		uniform uarg
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
case. 'szer' do.
		ZERO=: arg
case.        do. '>>> uuengine: bad instruction: ';y
end.
)

'==================== [uu] start ===================='

cocurrent 'uu'

DIAGNOSTICS=: 0
blink=: empty

start=: 3 : 0





ssw '+++ [uu] start: ENTERED. y=(y)'
if. isNo y do. SIC=: y end.
trace 0
sess=: empty
factory''
VERSION=: getversion jpath'~UU'
load jpath'~UUC'
load jpath'~UUF'
load jpath'~UUM'
make_units''
make_unitc''
rat_check''

report_complex_nouns''
trace DIAGNOSTICS
ssw '+++ [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy
start''
