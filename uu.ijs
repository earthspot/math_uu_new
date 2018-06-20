0 :0
2018-06-20  01:41:46
-
UU: scientific units conversion package
)

clear 'uu'
coclass 'uu'

'==================== [uu] constants ===================='

cocurrent 'uu'









CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'
CUTAB=: CUTAB0

HD=: '·'
INVALID=: _.j_.
NOTFOUND=: _1
NUN=: '??'
PWM=: '^-'
PW=: '^'
SL=: '/'
SP=: ' '
UL=: '_'
UNDEFINED=: _.









factory=: 3 : 0


SIG_z_=: 3
SCI_z_=: 5
UNICODE=: 1
MAXLOOP=: 30
UCASE=: 0
)


UUC=: cmx 0 : 0
1 /	[saved]	Saturday 9 June 2018  05:16:54
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

'==================== [uu] utilities ===================='

cocurrent 'uu'

ddefine=: 1 : 'm&$: : (4 : 0)'
isBoxed=: 0 < L.
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw
ssw=: smoutput&sw
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'
trace_z_=: 3 : 'TRACE_z_=: | * y'
trace 1

make_msg=: 3 : 0


if. y do.
  sessuu=: 3 : 'if. zeroifabsent''TRACE'' do. smoutput y else. i.0 0 end.'
  msg=: sessuu&sw
  sllog=: sessuu&llog
  msg '+++ make_msg: msg is ACTIVE'
else.
  sessuu=: empty
  msg=: empty
  sllog=: empty
  smoutput '--- make_msg: msg is empty'
end.
y return.
)

make_msg 1


all=: *./
and=: *.
any=: +./
brack=:	1 |. '][' , ":
cmx=: [: > <;._2
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~

report_complex_nouns=: 3 : 0

loc=. >coname''
nocomplex=. 1
for_no. (nl 0) -. <'INVALID' do.  val=. ".nom=. >no
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

invalid=: (3 : 0)"0

if. -. 128!:5 y do. 0 return. end.
'_.j_.' -: 5!:6 <'y'
)

quoted=: 3 : 0

(<toupper y) e. {."1 CUTAB
)

utoks=: 3 : 0

z=. sp1 y
z=. (z e. SP,SL) <;.1 z
)

vt=: viewtable=: (a:&$: : (4 : 0))"0




if. a: -:x do. x=. <'units unitv uvalu unitx uvalx unitc i' end.
st =. (":&.>)"0
cst=. ([: st [) ,. [: st ]
]h=. ;: cols=. >x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
]z=. t{~ y + i.10 ifabsent 'VIEWTABLE'
h,z,h
)


'==================== [uu] main ===================='

cocurrent 'uu'

adj=: 4 : 0
msg '+++ adj: ENTERED: x=(x) y=(y)'









select. x
fcase. 'Celsius'	do.
fcase. 'Centigrade'do.
fcase. '°C'	do.
 case. 'degC'	do.	z=. y-273.15
fcase. '_Celsius'	do.
fcase.'_Centigrade'do.
fcase. '_°C'	do.
 case. '_degC'	do.	z=. y+273.15
fcase. 'Fahrenheit'do.
fcase. '°F'	do.
 case. 'degF'	do.	z=. y-459.67
fcase.'_Fahrenheit'do.
fcase. '_°F'	do.
 case. '_degF'	do.	z=. y+459.67
fcase. 'Roemer'	do.
fcase. 'Rømer'	do.
fcase. '°Rø'	do.
 case. 'degRo'	do.	z=. y-650.762
fcase. '_Roemer'	do.
fcase. '_Rømer'	do.
fcase. '_°Rø'	do.
 case. '_degRo'	do.	z=. y+650.762
fcase. 'Newton'	do.
fcase. '°N'	do.
 case. 'degN'	do.	z=. y-90.139
fcase. '_Newton'	do.
fcase. '_°N'	do.
 case. '_degN'	do.	z=. y+90.139
fcase. 'Delisle'	do.
fcase. '°De'	do.
 case. 'degDe'	do.	z=. y+559.725
fcase. '_Delisle'	do.
fcase. '_°De'	do.
 case. '_degDe'	do.	z=. y-559.725
fcase. 'Reamur'	do.
fcase. 'Réamur'	do.
fcase. '°Ré'	do.
 case. 'degRe'	do.	z=. y-218.52
fcase. '_Reamur'	do.
fcase. '_Réamur'	do.
fcase. '_°Ré'	do.
 case. '_degRe'	do.	z=. y+218.52
 case.		do.	z=. y 
end.
z [msg '--- adj: EXITS: z=(z)'
)

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



z=. ; |. each sort |. each utoks y
	msg '+++ canon: ENTERED: z=(z)'

for_w. mks do. m=. ,>w
  if. any m E. z do.
    z=. (z canc m) coll m
	msg '... canon:   [(m)] z=(z)'
  end.
end.
z=. debnSL dlb ; sort utoks z
if. 0=#z do. z=. ,SL end.
z [ msg '--- canon: EXITS: z=(z)'
)

cnvf=: 3 : 0

z=. (f=. INVALID) ; '' ; NOTFOUND
t=. utoks cnvv y
if. LK=NOTFOUND do. z return. end.
try. z=. (f=.LK{uvalu); t; LK
catch.
end.
	msg '... cnvf:   f=(f) (linz t)'
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

cnvj=: 3 : 0
msg '+++ cnvj: ENTERED'

k=. p=. 1 [ z=. y
if. (SL~:{.z) and (any PWM E. z) do.
  z=. SL,z rplc PWM ; PW
end.
if. j=.(SL={. sp1 z) do. z=. }.z end.
if. PW e. z do.
  'p z'=. (".{:z) ; (}:}:z)
end.


if. (iskg z) or (not validunits z) do.

  if.     'da'-:2{.z do.	k=. 1e1  [z=.2}.z
  elseif. z begins 'µ' do.	k=. 1e_6 [z=.z-.'µ'
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
end.
z=. deb z
	msg '--- cnvj:   j=(j) scale:k=(k) units:z=(z) power:p=(p)'
j ; k ; z ; p return.
)











cnvnon=: 3 : 0

i=. (y e. mkss)i. 0
if. i<#y do.
  t=. >i{y
  y=. (i~: i.#y)# y
else.
  t=. ''
end.
	msg '... cnvnon:   next non-mks token=[(t)] leaving: (linz y)'
(deb t) ; <y
)

cnvv=: 3 : 0
unitv cnvv y
:


LKS=: ,LK=: NOTFOUND
if. 0=#z=. I.units=(<,y) do. '' return. end.
LK=: {.LKS=: z
>LK{x
)

cnvx=: 3 : 'unitx cnvv y'

coll=: 4 : 0




P=. PW
z=. ,x
n=. SP,y
d=. SL,y
for_p. 4 3 2 do.
  z=. z rplc ((p*$n)$n);(n,P,":p) ; ((p*$d)$d);(d,P,":p)
	msg '... coll:   z=(z) power:p=(p)'
end.
z
)

compatible=: 4 : 0
msg 'compatible: ENTERED'


if. ('*'= {.>x) or ('*'= {.>y) do. 1 return. end.
ux=. compat cnvv >x [ uy=. compat cnvv >y
	msg '... compatible: ux=(ux) uy=(uy)'
if. (0<#uy) and (uy-:ux) do. 1 return. end.
a=. {.convert >x [ b=. {.convert >y
a-:b
)

compatlist=: 3 : 0
msg 'compatlist: ENTERED'

z=. ''


if. 0<#uy=. compat cnvv >y do.
z=. (I. uy=compat){units
else.
cn=. {.convert y
z=. (I. cn=unitx){units
end.

if. z e.~ <,'m' do. z=. (;:'m km cm mm'),z end.

z=. ~. (<,y),z,{.convert y
)

































convert=: 1&$: : (4 : 0)"1

yb=. bris y
	msg '+++ convert: ENTERED: x=(x) y=(y) yb=(yb)'

if. x do.
  if. 0<#z=.cnvx yb do. (z ; 1 ; LK{uvalx) return. end.
end.
fac=. 1
z=. utoks yb
msg '... convert: utoks=(linz z)'



for_i. i.MAXLOOP do.
  loop=. i+1
  't rz'=. cnvnon z
  if. 0=#t do. break. end.
  if. t-:,'*' do. ('*' ; loop ; 1) return. end.
  'j k tt p'=. cnvj t
  'f ttt lk'=. cnvf tt
  if. (isNaN f) or (lk=_1) do. (NUN ; loop ; _) return. end.
  subfac=. (f*k)^p

  fac=. fac * subfac^(np j)
  z=. rz,p#(j cnvi ttt)
	msg '... convert: [(loop)] z=(linz z) fac=(fac) j=(j) subfac=(subfac)'
end.

if. loop=MAXLOOP do. loop=. 0 end.
wd'msgs' [ msg '--- convert: EXITS'
(canon ;z) ; loop ; fac return.
)

curfig=: 3 : 'hy (0 j. 2)":y'
debSL=: #~ (+. (1: |. (> </\)))@('/'&~:)

debnSL=: 3 : 0


if. SL={.y do. SL,debSL }.y
else. debSL y
end.
)

deslash=: 1&$: : (4 : 0)



r=. ''
for_cu. utoks y do. cunit=. >cu
  if. (x=0) or SL={.cunit do.
    'j k z p'=. cnvj cunit
    if. x do.
      cunit=. SP, (}. PW taketo cunit),PWM,":p
    else.
      sllog 'deslash__ cunit j k z p'
      cunit=. (j{SP,SL), (}. PW taketo cunit) ,(p>1)# PW,":p
    end.
  end.
  r=. r,cunit
end.
dlb r
)
dotted=: 1&$: : (4 : 0)


]z=. utf8 deb y
if. x do.
  if. any HD E. z do. y return. end.
  ]z=. z rplc SP;HD
else.
  if. -.any '·' E. z do. y return. end.
  z=. z rplc '·';' '
end.
)

eval=: 3 : 0 "1

y=. '/%-_Ee'charsub ;y
try. {.".y catch. INVALID end.
)

exrate=: exrate_exch_

unhms=: 3600 %~ _ 60 60 #. 3 {. ]

format_hms=: 3 : 0
msg 'format: ENTERED'

if. y-:'' do. y=. unhms 23 59 59.567 end.
neg=. (y<0)#'-'
suf=. ':' ; ':' ; ''
'h m s'=.": each _ 60 60 #: 3600*|y
if. 10>".h do. h=. '0',h end.
if. 10>".m do. m=. '0',m end.
if. 10>".s do. s=. '0',s end.
h,':',m,':',s
)

format=: ''&$: : (4 : 0)
if. undefined y do. 'UNDEFINED' return. end.
if. invalid y do. 'INVALID' return. end.
if. UNICODE>0 do.
if. y=__ do. '-∞' return.
elseif. y=_ do. '∞' return.
end.
end.
select. ,x
case. 'asec'	do. z=. '"' upost format_sig y
case. 'amin'	do. z=. '''' upost format_sig y
fcase. 'degF'	do.
case. 'degC'	do. z=. format_sci x adj y
fcase. 'Fahrenheit'do.
fcase. 'Centigrade'do.
case. 'Celsius'	do. z=. 'deg' upost format_sci x adj y
case. 'hms'	do. z=. format_hms y
case. 'deg'	do. z=. format_deg y
case. 'usd'	do. z=. '$',curfig y
case. 'cnt'	do. z=. '¢',curfig y
case. 'gbp'	do. z=. '£',curfig y
case. 'eur'	do. z=. '€' curfig y
case. ,'!'	do. z=. >(y=0){'YES';'NO'
case. 'midi'	do. z=.": rnd midino y
case. 'note'	do. z=. note y
fcase. ,'c'	do.
fcase. 'eV'	do.
fcase. 'Hz'	do.
case. 'rad'	do. z=. format_sci y
fcase. ,'/'	do.
case. ,'*'	do. z=. format_sig y
case.		do. z=. format_general y
end.
ucode z
)

format_deg=: 3 : 0


if. y-:'' do. y=. undeg 360 0 30 end.
neg=. (y<0)#'-'
suf=. 'deg ' ; 'amin ' ; 'asec'
z=._ 60 60 #: 3600*|y
z=. ": each <. z
neg , ; z ,each suf
)
format_general=: format_sci
format_sci=: toupper@hy@scino
format_sig=: format_sci

getversion=: 3 : 0
try.
bad=. fread''
assert. -. bad -: z=. fread y sl 'manifest.ijs'
assert. 0< # z=. LF taketo 'VERSION' dropto z
".z 
catch. end.
)

hy=: '_-' charsub ]
isNaN=: 128!:5




iskg=: 3 : 0
if. y-:'kg' do. 1 return. end.
if. not 'kg' -: 2{.y do. 0 return. end.

if. any 'kg^' E. y do. 0 return. end.
1
)

linz=: 3 : 0

z=. }: ; (>y) ,. '|'
brack z -. SP
)

midino=: 69 + 12 * 2 ^. 440 %~ ]

note=: 3 : 0

NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
,>NOTE {~ rnd 12 | midino y
)
0 :0
note 440
note 194.18
)

np=: [: <: 2 * -.
rnd=: [: <. 0.5 + ]

scino=: 3 : 0
msg '+++ scino: y=(y)'



fmt=. j. SIG * 1 _1 {~ ((10^SCI) <: |y)  or  ((10^-SIG) > |y)
if. (y=<.y) and (y<10^SCI) do. z=.":y else. z=.fmt ": y end.
z [ msg '--- scino: z=(z)'
)

selfcanc=: 3 : 0
msg '+++ selfcanc: ENTERED'


z=. ; |.each sort |.each ut=. utoks y
t=. ~. }.each ut
for_cb. ~.t do.
  z=. z canc >cb
  z=. z coll >cb
end.
z=. dlb canon z
z=. z rplc '/^2';'/';'/^3';'/';'/^4';'/';'/^5';'/';'/^6';'/';'/^7';'/';'/^8';'/';'/^9';'/'
z [ msg '--- selfcanc: EXITS: z=(z)'
)

sci=: 3 : 0

if. 0=#y do. SCI
else. SCI_z_=: {.y
end.
)

sig=: 3 : 0

if. 0=#y do. SIG
else. SIG_z_=: {.y
end.
)

sl=: 4 : '(x,SL,y) rplc ''///'';SL;''//'';SL'

slash1=: 1&$: : (4 : 0)


z=. deb y
if. x do.
  if. UNICODE>:2 do. y return. end.
  if. ')'={:z do. y return. end.
  z=. canon_uu_ z
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

test=: 3 : 0

if. y=_ do. 0 test _
else. y test y
end.
:



smoutput 'i compat units uvalu  unitv uvalx unitx (>>) \\ i{UUC'
for_i. x to (y <. <:#UUC) do.
if. i=i{compat do.
  z=. ''
else.
  v=. (i{compat) {uvalu
  if. v=1 do. z=. '' else. z=. '>>',": v end.
end.
smoutput nb i; (i{compat); (brack >i{units); (i{uvalu); (>i{unitv); (>i{uvalx); (>i{unitx); z ; '\\' ; (i{UUC)
end.
)

testf=: 3 : 0

if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
	nom=. ,>no
	smoutput nb nom ; TAB ; nom format y
end.
)

ucase=: 3 : 0
msg 'ucase: ENTERED'
if. 0=#y do. UCASE
else. UCASE=: {.y
end.
)

hasutf=: [: +./ 127 < a. i. ]
isascii=: [: *./ 128 > a. i. ]
undeslash=: 0&deslash

ucode=: 1&$: : (4 : 0)
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
3 :0''
if. -.zeroifabsent'STARTED' do. i.0 0 return. end.
assert. 'm^2/K/s^2'	-: 0 ucode 'm² K⁻¹ s⁻²'
assert. 'm² K⁻¹ s⁻²'	-: 1 ucode 'm² K⁻¹ s⁻²'
assert. 'ft/(s s)'		-: 0 ucode 'ft/(s·s)'
assert. 'ft/(s·s)'		-: 1 ucode 'ft/(s·s)'
assert. 'm²/K/s²'		-:   ucode 'm^2/K/s^2'
i.0 0
)

ucods=: 1&$: : (4 : 0)

SAV=. cspel ;< csymb
'cspel csymb'=: sspel ;< ssymb
z=. x ucode y
z [ 'cspel csymb'=: SAV
)

udat=: 4 : 0
msg 'udat: ENTERED'



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
msg 'udiv: ENTERED'
if. (1=#y) and (y=SL) do. x return. end.
z=. cnvi utoks y
z=. selfcanc x , ;z
z=. z rplc '/^2';'/'
)

udumb=: 3 : 0
msg 'udumb: ENTERED'
'zdesc znits znitv zvalu'=. y
zdesc; znits; 1
)
make_units=: 0 ddefine




sspel=: <;._1 ' PI Ang Ohm ^-1 ^-2 ^-3 ^-4 ^2 ^3 ^4'
ssymb=: <;._1 '|π|Å|Ω|⁻¹|⁻²|⁻³|⁻⁴|²|³|⁴'

cspel=: sspel, <;._1 ' deg amin asec'
csymb=: ssymb, <;._1 '|°|''|"'



mkss=: (SP,each mks),(SL,each mks),<,SL
make_cutuuc''
'v uv us'=. <"1 |: cutuuc UUC
unitv=: deb each uv -.each TAB
units=: deb each us
uvalu=: eval >v

z=. |: > 0 convert each units
unitx=: 0{z
cycs=. ;1{z
uvalx=: ;2{z
compat=: unitx i. unitx

z=. cycs=0
z=. z or cycs>15
z=. z or (isNaN uvalu) or (uvalu e. 0 _ __)
z=. z or (isNaN uvalx) or (uvalx e. 0 _ __)
if. any z do.
  t=. ;,((I.z){units) ,.(SP,~each brack each I.z)
  wdinfo 'Addon: UU',LF,LF,'WARNING: these units convert badly:',LF,t
end.
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
uniform=: _&$: : (4 : 0)"1
	msg '+++ uniform: ENTERED: x=(x) y=(y)'

y=. utf8 deb y
if. x=_ do. x=. UNICODE end.
select. x
case. 0 do.
  z=. unucode undotted y
case. 1 do.
  ]z=. undotted y
  if. 1< +/SL=y do.
    ]z=. slash1 z
  end.
  ]z=. ucode z
case. 2 do.
  if. y-: ,SL do. '' [ msg '--- uniform: RETURNS NIL' return. end.

  ]z=. unucode undotted y
  ]z=. ucode deslash unslash1 z
case. 3 do.
  if. y-: ,SL do. '' [ msg '--- uniform: RETURNS NIL' return. end.

  z=. dotted 2 uniform y
end.
z [ msg '--- uniform: EXITS'
)
3 :0''
if. -.zeroifabsent'STARTED' do. i.0 0 return. end.
assert. 'm m/(K s s)'	-: 0 uniform 'm m/(K s s)'
assert. 'm m/(K s s)'	-: 1 uniform 'm m/(K s s)'
assert. 'm m K⁻¹ s⁻¹ s⁻¹'	-: 2 uniform 'm m/(K s s)'
assert. 'm·m·K⁻¹·s⁻¹·s⁻¹'	-: 3 uniform 'm m/(K s s)'
assert. 'm^2/K/s^2'	-: 0 uniform 'm^2/K/s^2'
assert. 'm²/(K s²)'	-: 1 uniform 'm^2/K/s^2'
assert. 'm² K⁻¹ s⁻²'	-: 2 uniform 'm^2/K/s^2'
assert. 'm²·K⁻¹·s⁻²'	-: 3 uniform 'm^2/K/s^2'
assert. 'ft/s^2'		-: 0 uniform 'ft/s^2'
assert. 'ft/s²'		-: 1 uniform 'ft/s^2'
assert. 'ft s⁻²'		-: 2 uniform 'ft/s^2'
assert. 'ft·s⁻²'		-: 3 uniform 'ft/s^2'
i.0 0
)

undeg=: 3600 %~ _ 60 60 #. 3 {. ]
undotted=: 0&dotted
unslash1=: 0&slash1
unucode=: 0&ucode
upost=: 4 : 'y,(x#~*UNICODE)'
upref=: 4 : '(x#~*UNICODE),y'

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

uu=: '' ddefine






if. isBoxed y do. z=. x uuboxed y
else. z=. x uustring y
end.
z [ msg LF,LF,LF
)

uustring=: 4 : 0

me=. 'uustring'
val=. eval SP taketo y
uns=. SP takeafter y
'va un'=. x uuboxed val ; uns
(ucode 8 u: un format va),SP,(ucode un)
)

uuboxed=: '' ddefine

	x_uu_=: x [ y_uu_=: y
msg '+++ uuboxed: ENTERED'
'val uns'=. y
	sllog 'x uuboxed__ val uns'
'ux uy'=. bris each x;uns
if. 0<#x do. if. -. ux compatible uy do.
  emsg'>>> uuboxed: incompatible units: (ux) || (uy)'
  return.
end. end.
'unsc c fy'=. convert uns
if. fy = _ do.
  emsg'>>> uuboxed: unknown units: (uns)' return.
end.

if. 0=#x do. ]ux=. bris x=. unsc end.
fx=. > {: convert ux
qty=. (fy%fx) * ('_',uns) adj val
uno=. uniform x
	sllog 'uuboxed__ fy fx uno ux'
z=. (ux adj qty) ; uno
z [ msg '--- uuboxed: EXITS'
)

uunicode=: 3 : 'if. 0=#y do. UNICODE else. UNICODE=: {.y end.'
uurowsc=: 3 : '(UUC ssmx y){UUC'
uurowsf=: 3 : '(UUF ssmx y){UUF'
validunits=: 3 : 'units e.~ <,y'


'==================== [uu] pp_encoding.ijs ===================='

cocurrent 'uu'

UNSETCODE=:   _1x
BADCODE=:     _17389x
TRIVIALCODE=:  1x
KILLERCODE=:   0x
OUTSIDECODE=: _99991x

PWM=: '^-'
PW=: '^'
MI=: '-'


Nmks=: #mks

Pmks=: x:p:i.#mks

scalingPrefixes=: 'hkMGTPEZYdcmunpfazy'
irregulars=: 3 : 0
smoutput llog 'TRIVIALCODE KILLERCODE'
smoutput llog 'OUTSIDECODE UNSETCODE BADCODE'
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
randompp=: 3 : '? Nmks#>:y'
encoded=:  3 : '*/ Pmks ^ y'
decodedx=: 3 : 'x:^:_1 Nmks q: y'
decodedr=: 3 : 'x:^:_1 -/decodedx 2 x: y'
decoded=: decodedx :: decodedr

expandcode=: (0 ddefine)"0

if. y=0 do. '' return. end.
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

toks4expandcode=: 1&expandcode

upp4utok=: 3 : 0

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

make_unitc=: 0 ddefine




rebuild=. x-:0
z=. 0$0x
for_i. i.#UUC do.
  codex=. i pickc unitc
  code=. (code4i :: BADCODE) i
  msg '--- make_unitc: i=(i) rebuild?:(rebuild) codex=(codex) code=(code)'
  z=. z,code
  assert 64 128 e.~ 3!:0 z
  if. rebuild do. unitc=: z end.
end.
z return.
)

pickc=: pick :: OUTSIDECODE

code4i=: (3 : 0)"0

	y_uu_=: y
if. (y<0) or (y>:#UUC) do. BADCODE return. end.
]units_y=. y pick units
]unitv_y=. y pick unitv
  msg '=== code4i[(y)]: units_y=(units_y) unitv_y=(unitv_y)'

if. Nmks > i=. mks i. <,units_y do. i{Pmks return. end.
if. unitv_y -: ,SL do. TRIVIALCODE return. end.
if. unitv_y -: ,ST do. KILLERCODE return. end.

]code=. y pickc unitc
  msg '--- code4i: code=(crex code)'
if. isRegular code do. code return. end.
]code=. code4anyunit unitv_y
if. isValid code do. code return. end.
  msg '--- code4i: no more code4* verbs to try'
BADCODE return.
)

0 :0
code4i 15
VIEWTABLE=: 10
smoutput viewtable 0 10 20
smoutput viewtable 30
smoutput viewtable 40
canon expandcode 3r50
canon expandcode 30625r12
xxu 18 19
xxu 30 + i.10
)

xxu=: (3 : 0)"0

UNC=: canon expandcode y{unitc
UNX=: >y{unitx
if. UNC -: UNX do. smoutput 'hooray!'
else. UNC ; UNX end.
)

units4i=: (3 : 0)"0

y pick units
)


code4unit=: 3 : 0

]i=. units i. <,y
try. i pickc unitc
catch. BADCODE end.
)

pp4xunit=: 3 : 0


for_t. utoks y [ z=.Nmks#0 do.
  msg '--- pp4xunit: token=[(crex t)]'
  'unit power'=. upp4utok t
  index=. mks i. <unit
  msg '--- pp4xunit: token=[(crex t)]--> unit=(unit) , power=(power)'
  if. index<Nmks do. z=. power index}z end.
end.
z return.
)

code4xunit=: encoded&pp4xunit

stripscale=: 3 : 0


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
muz=. */z
msg '--- code4anyunit: [(y)] --> (crex muz) --> [(expandcode muz)]'
muz return.
)

0 :0
code4anyunit=: 3 : 0



  y_uu_=: y
if. 0=#y    do. TRIVIALCODE return. end.
if. SL-: >y do. TRIVIALCODE return. end.
if. ST-: >y do. KILLERCODE return. end.
for_t. utoks y[z=.0$0x do.
  'unit power'=. upp4utok t
  msg '--- code4anyunit: token=[(crex t)]--> unit=(crex unit) , power=(power)'

  if. -.isRegular ]code=.code4unit unit do.
    code=. code4unit stripscale unit
  end.

  if. -.isRegular code do. OUTSIDECODE return. end.

  z=. z,code^power
  msg '--- code4anyunit: code=[(crex code)] datatype_z=(datatype z) z=[(crex z)]'
end.
muz=. */z
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
make_unitc''
…now called within: start'' (defined in start.ijs)
)

'==================== [uu] format.ijs =================='

cocurrent 'uu'
give=: 4 : 0

GIVE=: ''
]z=. ; ('give_' nl 3) ,each <' :: '
]z=. 'x(' ,z, 'giverr)y'
".z [sm GIVE
)

giverr=: 4 : 0
'giverr: ',llog 'x y'
)

give_test1=: 4 : 0
	GIVE=: GIVE`give_test1
errif -. x-: 'test1'
'give_test1: ',":y
)

give_test2=: 4 : 0
	GIVE=: GIVE`give_test2
errif -. x-: 'test2'
'give_test2: ',":y
)

'==================== [uu] public ===================='

cocurrent 'uu'

public=: 3 : 0


cocurrent y
adj=: adj_uu_
compat=: compatible_uu_
compatlist=: compatlist_uu_
convert=: convert_uu_
cnvj=: cnvj_uu_
format=: format_uu_
scino=: scino_uu_
selfcanc=: selfcanc_uu_
sci=: sci_uu_
sig=: sig_uu_
startuu=: start_uu_
ucase=: ucase_uu_
udat=: udat_uu_
udiv=: udiv_uu_
udumb=: udumb_uu_
uniform=: uniform_uu_
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_
i.0 0
)



uunicode_z_=: uunicode_uu_
uu_z_=: uu_uu_


'==================== [z] paths.ijs ===================='

cocurrent 'z'
]TPATH_UU=: jpath'~addons/math/uu'
]TPATH_UUC=: TPATH_UU sl 'uuc.ijs'
]TPATH_UUF=: TPATH_UU sl 'uuf.ijs'
]TPATH_UUM=: TPATH_UU sl 'uum.ijs'
uuc=: 3 : 'open TPATH_UUC'
uuf=: 3 : 'open TPATH_UUF'
uum=: 3 : 'open TPATH_UUM'

'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0





wd'msgs' [ msg '+++ start: ENTERED'
make_msg 0
if. -.fexist TPATH_UUC do.
  smoutput z=.'>>> start: file not found: ',TPATH_UUC
  z return.
end.
factory''
badversion=. 'v.v.v'"_
]VERSION=: getversion :: ('v.v.v'"_) TPATH_UU
load :: 0: TPATH_UUC
load :: 0: TPATH_UUF
load :: 0: TPATH_UUM
make_units''

make_unitc''
unitc=: 1 make_unitc''
unitc=: 1 make_unitc''
report_complex_nouns''

STARTED=: 1


make_msg 1
wd'msgs' [ msg '--- start: EXITS'
)

start''
