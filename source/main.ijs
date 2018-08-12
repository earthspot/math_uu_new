	NB. uu - main.ijs
'==================== [uu] main ===================='

cocurrent 'uu'

adj=: 4 : 0
ME=: <'adj'
msg '+++ adj: ENTERED: x=(x) y=(y)'
  NB. Adjusts quantity: y for units: x
  NB. Used by: format and: uu
  NB. This mainly serves temperature units, degC degF and K
  NB. which differ by an added constant as well as by a factor.
  NB. Prefixing '_' to x adjusts IN THE OTHER DIRECTION.
  NB. EXAMPLE:
  NB.  'degC'&adj SUBTRACTS 273.15
  NB. '_degC'&adj ADDS 273.15
  NB. SOURCE: WIKIPEDIA Conversion_of_units_of_temperature
select. x
NB. Celsius scale
fcase. 'Celsius'	do.
fcase. 'Centigrade'do.
fcase. '°C'	do.
 case. 'degC'	do.	z=. y-273.15
fcase. '_Celsius'	do.
fcase.'_Centigrade'do.
fcase. '_°C'	do.
 case. '_degC'	do.	z=. y+273.15
NB. Fahrenheit scale
fcase. 'Fahrenheit'do.
fcase. '°F'	do.
 case. 'degF'	do.	z=. y-459.67
fcase.'_Fahrenheit'do.
fcase. '_°F'	do.
 case. '_degF'	do.	z=. y+459.67
NB. Rømer scale
fcase. 'Roemer'	do.
fcase. 'Rømer'	do.
fcase. '°Rø'	do.
 case. 'degRo'	do.	z=. y-650.762
fcase. '_Roemer'	do.
fcase. '_Rømer'	do.
fcase. '_°Rø'	do.
 case. '_degRo'	do.	z=. y+650.762
NB. Rankine scale	--needs no adj
NB. Newton scale
fcase. 'Newton'	do.
fcase. '°N'	do.
 case. 'degN'	do.	z=. y-90.139
fcase. '_Newton'	do.
fcase. '_°N'	do.
 case. '_degN'	do.	z=. y+90.139
NB. Delisle scale
fcase. 'Delisle'	do.
fcase. '°De'	do.
 case. 'degDe'	do.	z=. y+559.725
fcase. '_Delisle'	do.
fcase. '_°De'	do.
 case. '_degDe'	do.	z=. y-559.725
NB. Réamur scale
fcase. 'Reamur'	do.
fcase. 'Réamur'	do.
fcase. '°Ré'	do.
 case. 'degRe'	do.	z=. y-218.52
fcase. '_Reamur'	do.
fcase. '_Réamur'	do.
fcase. '_°Ré'	do.
 case. '_degRe'	do.	z=. y+218.52
NB. default scale  --needs no adj
 case.		do.	z=. y 
end.
z [msg '--- adj: EXITS: z=(z)'
)

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
ME=: <'canon'
	NB. Sort units (str y) into canonical order
	NB. y must be fully-resolved units, ie all from boxed list: mks
	NB. Sort tokens EACH REVERSED. This brings num+denom terms together
msg '+++ canon: ENTERED'
z=. ; |. each sort |. each utoks y
	msg '... canon: z=(z)'
	NB. Cancel-out/collect each unit from global boxed list: mks in turn...
for_w. mks do. m=. ,>w		NB. m== next unit from list: mks
  if. any m E. z do.		NB. only if m is present in z
    z=. (z canc m) coll m
	msg '... canon:   [(m)] z=(z)'
  end.
end.
z=. debnSL dlb ; sort utoks z	NB. k-m-s order, with denominators gathered behind
if. 0=#z do. z=. ,SL end.  	NB. CONVENTION: (empty z) --> ,'/'
z [ msg '--- canon: EXITS: z=(z)'
)

cnvf=: 3 : 0
ME=: <'cnvf'
	NB. expand y using units->unitv, also return the conversion factor f
z=. (f=. INVALID) ; '' ; NOTFOUND	NB. "not-found" returned value
t=. utoks cnvv y			NB. y is a bare (units), no SP|SL
if. LK=NOTFOUND do. z return. end.
try. z=. (f=.LK{uvalu); t; LK		NB. item-value from LK: UU-row found by: cnvv
catch.
end.
	msg '... cnvf:   f=(f) (linz t)'
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

cnvj=: 3 : 0
ME=: <'cnvj'
	NB. cut prefs/suffs from a cunit (eg: '/kg^3')
k=. p=. 1 [ z=. y
if. (SL~:{.z) and (any PWM E. z) do. NB. elim -ve power
  z=. SL,z rplc PWM ; PW
NB. y=. SL,dlb y-.'-'
end.
if. j=.(SL={. sp1 z) do. z=. }.z end.	NB. bool:j remembers dropped prefix: SP|SL
if. PW e. z do.			NB. recognise a power...
  'p z'=. (".{:z) ; (}:}:z)		NB. drop/remember suffixed power (as integer)
end.
msg '+++ cnvj: y=(y) j=(j) z=(z) p=(p)'
	NB. Identify scaling prefixes, eg 'ms' 'Gs' 'µ' (all variants of: s)
	NB. ONLY IF z is not itself in: units, eg 'knot' ...
if. (-.iskg z) and (not validunits z) do.
	NB. Identify a 2-CHAR ASCII scaling prefix ...
  if.     'da'-:2{.z do.	k=. 1e1  [z=.2}.z	NB. deka-
  elseif. z begins 'µ' do.	k=. 1e_6 [z=.z-.'µ'	NB. micro-
  elseif. do.
	NB. Identify a SINGLE-CHAR ASCII scaling prefix (i.e. NOT µ) ...
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
end.
z=. deb z
	msg '--- cnvj:   j=(j) scale:k=(k) units:z=(z) power:p=(p)'
j ; k ; z ; p return.	NB. here z has NO prefixed SP (or SL)
)
  NB. Scaling prefixes recognised above:
  NB.	------------------------------------------------------------------------------
  NB. 	deca- 	hecto- 	kilo- 	mega- 	giga- 	tera- 	peta- 	exa- 	zetta- 	yotta-
  NB. 	da 	h 	k 	M 	G 	T 	P 	E 	Z 	Y
  NB. 	10^1 	10^2 	10^3 	10^6 	10^9 	10^12 	10^15 	10^18 	10^21 	10^24
  NB.	------------------------------------------------------------------------------
  NB. 	deci- 	centi- 	milli- 	micro- 	nano- 	pico- 	femto- 	atto- 	zepto- 	yocto-
  NB. 	d 	c 	m 	µ 	n 	p 	f 	a 	z 	y
  NB. 	10^−1 	10^−2 	10^−3 	10^−6 	10^−9 	10^−12 	10^−15 	10^−18 	10^−21 	10^−24
  NB.	------------------------------------------------------------------------------

cnvnon=: 3 : 0
ME=: <'cnvnon'
	NB. extract 1st non-mks token
i=. (y e. mkss)i. 0	NB. index of 1st token not in mkss
if. i<#y do.
  t=. >i{y		NB. the extracted token
  y=. (i~: i.#y)# y	NB. the residue without t
else.
  t=. ''		NB. and y is unchanged
end.
	msg '... cnvnon:   next non-mks token=[(t)] leaving: (linz y)'
(deb t) ; <y
)

cnvv=: 3 : 0
unitv cnvv y
:
	NB. the x-(unitv/x) entry corresp to units: y
	NB. SETS GLOBAL CACHED LOOKUP INDEX: LK <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
LKS=: ,LK=: NOTFOUND	NB. init to: "not-found" value
if. 0=#z=. I.units=(<,y) do. '' return. end.
LK=: {.LKS=: z
>LK{x		NB. Only the first match is returned
)

cnvx=: 3 : 'unitx cnvv y'

coll=: 4 : 0
ME=: <'coll'
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
	msg '... coll:   z=(z) power:p=(p)'
end.
z
)

compatible=: 4 : 0
ME=: <'compatible'
	NB. =1 iff units x,y compatible
	NB. '*' is compatible with everything...
msg 'compatible: ENTERED'
if. ('*'= {.>x) or ('*'= {.>y) do. 1 return. end.
ux=. compat cnvv >x [ uy=. compat cnvv >y
	msg '... compatible: ux=(ux) uy=(uy)'
if. (0<#uy) and (uy-:ux) do. 1 return. end.
a=. {.convert >x [ b=. {.convert >y
a-:b	NB. match their canonical units
)

compatlist=: 3 : 0
ME=: <'compatlist'
  NB. return extract of (units) compatible with units: y
msg 'compatlist: ENTERED'
  NB. if there's a compat-code (uy), get its mates
  NB. else lookup its cfm in: unitx
if. 0<#uy=. compat cnvv >y do.
  z=. (I. uy=compat){units
else.
  cn=. {.convert y
  z=. (I. cn=unitx){units
end.
  NB. If [m] present include [mm] [cm] [km] too
if. z e.~ <,'m' do. z=. (;:'m km cm mm'),z end.
  NB. incl uy itself and its canon
z=. ~. (<,y),z,{.convert y
)

0 :0
VERB: convert
-
Converts arbitrary compound units (str) to primitive SI-units as defined in: mks
Needed to compare two arbitrary units to see if compatible / inter-convertible.
Simplifies the result of a division of 2 physical quantities.
-
Returns 3-element: z
 (>{.z) is the canonical units (cu)
 (>{:z) is conversion factor (cf)
 (>1{z) is diagnostic only: the number of lookup-cycles.

Returns a canonical form (defined by: canon) to allow comparison using (-:).
 DEFN cunit: a canonical element, having prefix, scale and power, eg '/s^2'

Has a set of service-fns all with names cnv* ...
 cnvnon z  extract 1st non-mks cunit(, returns: cunit;residue
 cnvj t  cut t into: (1_if_prefixed_SL ; 10^n_scale ; unit ; ^n_repetition)
 cnvf t  lookup t in: units-->unitv, returns (factor ; units)
    -if not found, factor is _. -test using: isNaN f
 cnvv t  called by: cnvf
 j cnvi t  converts all SP<-->SL in cunits-str: t iff j=1
    - (j=1 iff the cunit of which t is the expansion had prefix SL

Uses: cnvnon to find first non-mks unit, t, 0=$t if no more units remaining.

A units str consists of a series of tokens called "cunits", order immaterial.
A cunit may be prefixed by SL (/) denoting denominator or by SP denoting numerator.

Fn: utoks tokenises a units str. ensures 1st cunit has a leading SP
 provided a leading SL is not already present. Uses sp1 to achieve this.

Since SP is a meaningful cunit prefix, use of: deb will expunge not only SP,SP
 but also any leading SP. But there must be a leading SP|SL.

Uses: cnvf to lookup (bare) unit in: units-->unitv
The expanded units tokens are then SUFFIXED to the unprocessed residue: rx
-we can do that since order of cunits is immaterial.

Fn: cnvf also returns conversion factor (f)

Finally when no more units to expand (max cycles=30 as failsafe)
 the result is converted to canonical form using: canon.
)

convert=: 1&$: : (4 : 0)"1
ME=: <'convert'
  NB. y (units) --> cu ; loop_count ; cf
yb=. bris y  NB. extend the range of acceptible units formats
	msg '+++ convert: ENTERED: x=(x) y=(y) yb=(yb)'
  NB. x=1 --use: uvalx
if. x do.	NB. SPEEDUP: try: unitx, uvalx (if there)
  if. 0<#z=.cnvx yb do. (z ; 1 ; LK{uvalx) return. end.
end.
fac=. 1				NB. conversion factor init'd
z=. utoks yb			NB. needs yb tokenised
msg '... convert: utoks=(linz z)'
	NB. Comb repeatedly through tokenized (boxed) z, converting tokens by lookup in UUC,
	NB. each converted token (expanded) is appended to back of z, to be combed again,
	NB. Repeat until all tokens in z are mks (=metre-kilogram-second)
for_i. i.MAXLOOP do.
  loop=. i+1			NB. loop-count available on drop-thru
  't rz'=. cnvnon z		NB. extract 1st non-mks token: t leaving residue: rz
  if. 0=#t do. break. end.	NB. quit loop if all are mks tokens
  if. t-:,'*' do. ('*' ; loop ; 1) return. end.	NB. '*' factor always 1
  'j k tt p'=. cnvj t		NB. separate: t -eg: '/ms^2' --> 1;0.001;'s';2
  'f ttt lk'=. cnvf tt		NB. lookup tt in UUC --> factor(f) ; new_tt(ttt) ; UUC_line#(lk)
  if. (isNaN f) or (lk=_1) do. (NUN ; loop ; _) return. end.	NB. SHOWS FAILURE !!
  subfac=. (f*k)^p
	NB. accumulate subfac into fac, according to whether j specifies numerator/denominator
  fac=. fac * subfac^(np j)
  z=. rz,p#(j cnvi ttt)		NB. put back into z: p-replicated (inverted) ttt
	msg '... convert: [(loop)] z=(linz z) fac=(fac) j=(j) subfac=(subfac)'
end.
	NB. if MAXLOOP reached then must assume not all non-mks tokens have been converted
if. loop=MAXLOOP do. loop=. 0 end. NB. signalling a suspicious result
wd'msgs' [ msg '--- convert: EXITS'
(canon ;z) ; loop ; fac return.
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
ME=: <'deslash'
  NB. deslash
  NB. x=1 --converts cunits with '/' into '^_n' form
  NB. x=0 --converts '^_n' cunits back into '/'
r=. ''	NB. accumulates modified cunits
for_cu. utoks y do. cunit=. >cu
  if. (x=0) or SL={.cunit do.  NB. inverse: do BOTH SP SL
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
NB. deslash'ft/s^2'

dotted=: 1&$: : (4 : 0)
  NB. apply(x=1--default)/unapply(x=0) dotted (·) convention
  NB. cf: slash1
]z=. utf8 deb y
if. x do.  NB. apply convention
  if. any HD E. z do. y return. end.  NB. convention already applied
  ]z=. z rplc SP;HD
else.  NB. unapply convention
  if. -.any '·' E. z do. y return. end.  NB. convention not applied
  z=. z rplc '·';' '
end.
)

eval=: 3 : 0 "1
	NB. used to evaluate numeric exprns in UUC
y=. '/%-_Ee'charsub ;y
try. {.".y catch. INVALID end.
)

exrate=: exrate_exch_

unhms=: 3600 %~ _ 60 60 #. 3 {. ]

format_hms=: 3 : 0
ME=: <'format_hms'
msg 'format_hms: ENTERED'
  NB. output y as: 'hh:mm:ss.sss'
if. y-:'' do. y=. unhms 23 59 59.567 end.  NB. TEST <<<<<
neg=. (y<0)#'-'
NB. suf=. ' h' ; ' min' ; ' s'
suf=. ':' ; ':' ; ''
'h m s'=.": each _ 60 60 #: 3600*|y
if. 10>".h do. h=. '0',h end.
if. 10>".m do. m=. '0',m end.
if. 10>".s do. s=. '0',s end.
h,':',m,':',s
)

format=: ''&$: : (4 : 0)
NB. format numeral y by units: x
NB. always returns a string
if. undefined y do. 'UNDEFINED' return. end.
if. invalid y do. 'INVALID' return. end.
if. UNICODE>0 do.
NB.   if. y=__ do. uucp '-∞' return.
if. y=__ do. '-∞' return.
elseif. y=_ do. '∞' return.
end.
end.
select. ,x
NB. INSERT FURTHER fcase.s HERE for unicoded suffix
case. 'asec'	do. z=. '"' upost format_sig y
case. 'amin'	do. z=. '''' upost format_sig y
fcase. 'degF'	do.
case. 'degC'	do. z=. format_sci x adj y
fcase. 'Fahrenheit'do.
fcase. 'Centigrade'do.
case. 'Celsius'	do. z=. 'deg' upost format_sci x adj y
case. 'hms'	do. z=. format_hms y	NB. (hh:mm:ss.sss)
case. 'deg'	do. z=. format_deg y	NB. (deg amin asec)
case. 'usd'	do. z=. '$',curfig y
case. 'cnt'	do. z=. '¢',curfig y
case. 'gbp'	do. z=. '£',curfig y
case. 'eur'	do. z=. '€' curfig y
case. ,'!'	do. z=. >(y=0){'YES';'NO'
case. 'midi'	do. z=.": rnd midino y	NB. MIDI-number
case. 'note'	do. z=. note y	NB. musical note
NB. INSERT FURTHER fcase.s HERE for sci-notation
fcase. ,'c'	do.	NB. lightspeed
fcase. 'eV'	do.	NB. electron-volt
fcase. 'Hz'	do.	NB. frequency: Hertz
case. 'rad'	do. z=. format_sci y
NB. INSERT FURTHER fcase.s HERE for SIG controlled
fcase. ,'/'	do.	NB. dimensionless
case. ,'*'	do. z=. format_sig y
NB. ALL ELSE...
case.		do. z=. format_general y
end.
ucode z
)

format_deg=: 3 : 0
	NB. output y as: '360deg 0amin 30asec'
	NB. ucode -converts this to the usual symbols
if. y-:'' do. y=. undeg 360 0 30 end.	NB. TEST <<<<<
neg=. (y<0)#'-'
NB. suf=. '° ' ; ''' ' ; '"'
suf=. 'deg ' ; 'amin ' ; 'asec'
z=._ 60 60 #: 3600*|y
z=. ": each <. z
neg , ; z ,each suf
)

NB. format_general=: toupper@hy@":
format_general=: format_sci
format_sci=: toupper@hy@scino
NB. format_sig=: 3 : 'hy (j. SIG)":y'
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

  NB. iskg
  NB. (iskg'') =1 iff units y is 'kg' or begins with: 'kg'
  NB.  and is scalable by altering the prefix: 'k'
iskg=: 3 : 0
if. y-:'kg' do. 1 return. end.
if. not 'kg' -: 2{.y do. 0 return. end.
	NB. Further test(s) if z starts with: 'kg'
if. any 'kg^' E. y do. 0 return. end.	NB. cannot accept powers of [kg]
1	NB. accept with no more tests
)

linz=: 3 : 0
	NB. linearize a boxed string of tokens for sm-output
z=. }: ; (>y) ,. '|'
brack z -. SP
)

midino=: 69 + 12 * 2 ^. 440 %~ ]	NB. "midi number" of freq: y (Hz)

note=: 3 : 0
  NB. nearest musical note of freq: y (Hz)
NOTE=. <;._1 ' C C# D D# E F F# G G# A A# B C'
,>NOTE {~ rnd 12 | midino y
)
0 :0
note 440		NB. A (concert-pitch is 440 Hz)
note 194.18	NB. G (earth-rotation musical note)
)

np=: [: <: 2 * -.
rnd=: [: <. 0.5 + ]

scino=: 3 : 0
ME=: <'scino'
msg '+++ scino: y=(y)'
  NB. Scientific notation for number: y
  NB. but returns ordinary integer for integer (y)
  NB. Uses current values of SIG and SCI (they can change)
fmt=. j. SIG * 1 _1 {~ ((10^SCI) <: |y)  or  ((10^-SIG) > |y)
if. (y=<.y) and (y<10^SCI) do. z=.":y else. z=.fmt ": y end.
z [ msg '--- scino: z=(z)'
)

selfcanc=: 3 : 0
ME=: <'selfcanc'
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
z [ msg '--- selfcanc: EXITS: z=(z)'
)

sci=: 3 : 0
  NB. get/set SCI (sci notation threshold)
if. 0=#y do. SCI
else. SCI_z_=: {.y  NB. actually resides in z-locale
end.
)

sig=: 3 : 0
  NB. get/set SIG (decimal places for: format)
if. 0=#y do. SIG
else. SIG_z_=: {.y  NB. actually resides in z-locale
end.
)

sl=: 4 : '(x,SL,y) rplc ''///'';SL;''//'';SL'

slash1=: 1&$: : (4 : 0)
  NB. apply(x=1--default)/unapply(x=0) single-slash convention
  NB. cf: dotted
z=. deb y
if. x do.  NB. apply convention
  if. UNICODE>:2 do. y return. end.  NB. convention n/a
  if. ')'={:z do. y return. end.  NB. convention already applied
  z=. canon_uu_ z
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

test=: 3 : 0
	NB. inspect result of: make_units
if. y=_ do. 0 test _	NB. to output the whole table
else. y test y		NB. just a single line
end.
:
	NB. test of UUC against make_units globals
	NB. Eg:	  test _	NB. whole table
	NB.	5 test 7	NB. lines 5-7 
smoutput 'i compat units uvalu  unitv uvalx unitx (>>) \\ i{UUC'
for_i. x to (y <. <:#UUC) do.
if. i=i{compat do.
  z=. ''			NB. warning flag (=ok)
else.
  v=. (i{compat) {uvalu		NB. the senior's ratio
  if. v=1 do. z=. '' else. z=. '>>',": v end.
end.
smoutput nb i; (i{compat); (brack >i{units); (i{uvalu); (>i{unitv); (>i{uvalx); (>i{unitx); z ; '\\' ; (i{UUC)
end.
)

testf=: 3 : 0
	NB. test: format (and friends)
if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
	nom=. ,>no
	smoutput nb nom ; TAB ; nom format y
end.
)

ucase=: 3 : 0
ME=: <'ucase'
msg 'ucase: ENTERED'
if. 0=#y do. UCASE
else. UCASE=: {.y
end.
)

hasutf=: [: +./ 127 < a. i. ]  NB. y has utf8 chars (not pure ASCII)
isascii=: [: *./ 128 > a. i. ]  NB. y is pure ASCII (no utf8s)
NB. isascii 'm² K⁻¹ s⁻²'
NB. isascii 'able'

undeslash=: 0&deslash

ucode=: 1&$: : (4 : 0)
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
3 :0''
if. -.zeroifabsent'STARTED' do. i.0 0 return. end.
assert. 'm^2/K/s^2'	-: 0 ucode 'm² K⁻¹ s⁻²'  NB. SL not: ⁻¹
assert. 'm² K⁻¹ s⁻²'	-: 1 ucode 'm² K⁻¹ s⁻²'
assert. 'ft/(s s)'		-: 0 ucode 'ft/(s·s)'
assert. 'ft/(s·s)'		-: 1 ucode 'ft/(s·s)'
assert. 'm²/K/s²'		-:   ucode 'm^2/K/s^2'
i.0 0
)

ucods=: 1&$: : (4 : 0)
	NB. saddle to call ucode, but ignoring currency symbols
SAV=. cspel ;< csymb
'cspel csymb'=: sspel ;< ssymb
z=. x ucode y
z [ 'cspel csymb'=: SAV
)

udat=: 4 : 0
ME=: <'udat'
msg 'udat: ENTERED'
	NB. raw boxed data from y=. seltext''
  NB. x=0 -const
  NB. x=1 -formula
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

  NB. udiv
  NB. divides 2 generalized units-strs: x y
  NB. For use by (eg): combine in: cal

udiv=: 4 : 0
ME=: <'udiv'
msg 'udiv: ENTERED'
if. (1=#y) and (y=SL) do. x return. end.
z=. cnvi utoks y    NB. invert token-list y
z=. selfcanc x , ;z NB. combine x, z as if multiplied
z=. z rplc '/^2';'/'
)

udumb=: 3 : 0
ME=: <'udumb'
msg 'udumb: ENTERED'
'zdesc znits znitv zvalu'=. y
zdesc; znits; 1  NB. assume 1 nominal unit is only ever required
)

NB. ============================================
make_units=: 0 ddefine
  NB. makes globals: cspel csymb mkss units unitv uvalu unitx uvalx compat
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
  NB. mkss is used by: cnvnon<--convert to identify reducible units
  NB. mks=: ;:'m kg s A K cd mol rad eur' NB. <<<set in ONLOAD
mkss=: (SP,each mks),(SL,each mks),<,SL
make_cutuuc''
'v uv us'=. <"1 |: cutuuc UUC
unitv=: deb each uv -.each TAB
units=: deb each us
uvalu=: eval >v
  NB. Make: unitx cycs uvalx from: units
z=. |: > 0 convert each units
unitx=: 0{z	NB. canonical units
cycs=. ;1{z	NB. diagnostic: loops needed by: convert
uvalx=: ;2{z	NB. conversion ratio to canonical units
compat=: unitx i. unitx  NB. compat-code: > earlier UUC-row#
  NB. Make z - boolean mask for: (units)
z=. cycs=0
z=. z or cycs>15	NB. ARBITRARY HIGH-ISH VALUE
z=. z or (isNaN uvalu) or (uvalu e. 0 _ __)
z=. z or (isNaN uvalx) or (uvalx e. 0 _ __)
NB. z=. z or 1 1 1 1 {.~ #cycs  NB. <<<<< TEST ONLY
if. any z do.
  t=. ;,((I.z){units) ,.(SP,~each brack each I.z)
  wdinfo 'Addon: UU',LF,LF,'WARNING: these units convert badly:',LF,t
end.
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

uniform=: _&$: : (4 : 0)"1
ME=: <'uniform'
	msg '+++ uniform: ENTERED: x=(x) y=(y)'
  NB. change units (y) to acceptable format for (UNICODE)
y=. utf8 deb y  NB. convert from possible datatype=='unicode'
if. x=_ do. x=. UNICODE end.
select. x
case. 0 do.  NB. ASCII only
  z=. unucode undotted y
case. 1 do.  NB. SI units with /
  ]z=. undotted y
  if. 1< +/SL=y do.  NB. if more than 1 slash
    ]z=. slash1 z
  end.
  ]z=. ucode z
case. 2 do.  NB. Standard SI units
  if. y-: ,SL do. '' [ msg '--- uniform: RETURNS NIL' return. end.
  NB. …no bare '/' in Standard SI
  ]z=. unucode undotted y	NB. c/f case 0
  ]z=. ucode deslash unslash1 z
case. 3 do.  NB. Standard SI units with dots
  if. y-: ,SL do. '' [ msg '--- uniform: RETURNS NIL' return. end.
  NB. …no bare '/' in Standard SI
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
	NB. TEST diagnostics table of caches
smoutput nb 'units' ;TAB; 'uvalu' ;TAB; 'uvalx'
if. 0=#y do. y=. i.#units end.
for_i. y do.
  smoutput nb i ; (brack >i{units) ;TAB; (iu=.i{uvalu) ;TAB; (ix=.i{uvalx)
  if.-. iu=ix do.
    smoutput TAB,'>>> uvalu not equal to uvalx'
  end.
end.
)

uuold=: '' ddefine
ME=: <'uu'
  NB. transform y (value;units) to: x (ux)
  NB. x is target units: ux
  NB. y is 2boxed expression, e.g. 9.5 ; 'kg'
  NB. OR…
  NB. y is string expression, e.g. '9.5 kg'
  NB. returns 2boxed OR string according to y
if. isBoxed y do. z=. x uuboxed y
else. z=. x uustring y
end.
msg LF,LF,LF	NB. output spacer in term window
z
)

uustring=: 4 : 0
ME=: <'uustring'
  NB. transform a string expression, e.g. '9.5 kg'
val=. eval SP taketo y
uns=. SP takeafter y
'va un'=. x uuboxed val ; uns
NB. (":va),SP,un  NB. crude formatting
(ucode 8 u: un format va),SP,(ucode un)  NB. nuanced formatting
)

uuboxed=: '' ddefine
ME=: <'uuboxed'
  NB. transform a 2boxed expression, e.g. 9.5 ; 'kg'
msg '+++ uuboxed: ENTERED'
'val uns'=. y
	sllog 'x uuboxed__ val uns'
'ux uy'=. bris each x;uns  NB. Make x, uns kosher
if. 0<#x do. if. -. ux compatible uy do.
  emsg'>>> uuboxed: incompatible units: (ux) || (uy)'
  return.
end. end.
'unsc c fy'=. convert uns  NB. unsc is in SI units
if. fy = _ do.
  emsg'>>> uuboxed: unknown units: (uns)' return.
end.
  NB. Default x to: unsc (uns converted to SI units)
if. 0=#x do. ]ux=. bris x=. unsc end.
fx=. > {: convert ux  NB. get the conversion factor: fx
qty=. (fy%fx) * ('_',uns) adj val
uno=. uniform x  NB. units for output
	sllog 'uuboxed__ fy fx uno ux'
z=. (ux adj qty) ; uno
z [ msg '--- uuboxed: EXITS'
)

uunicode=: 3 : 'if. 0=#y do. UNICODE else. UNICODE=: {.y end.'
uurowsc=: 3 : '(UUC ssmx y){UUC'
uurowsf=: 3 : '(UUF ssmx y){UUF'
validunits=: 3 : 'units e.~ <,y'
