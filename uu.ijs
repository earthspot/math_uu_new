NB. UU: scientific units conversion package
0 :0
Thursday 7 June 2018  10:51:01
-
NEW uu.ijs	…concatenated from the files:
/Users/ianclark/Xcode projects/TABULA/TABULA/UU/init.ijs
/Users/ianclark/Xcode projects/TABULA/TABULA/UU/main.ijs
/Users/ianclark/Xcode projects/TABULA/TABULA/UU/format.ijs
/Users/ianclark/Xcode projects/TABULA/TABULA/UU/start.ijs
/Users/ianclark/Xcode projects/TABULA/TABULA/UU/uu-make-tpaths.ijs
)

coclass 'uu'
sessuu=: empty  NB. override to activate

DIVIDER=:'==================== [uu] init.ijs ===================='

coclass 'uu'

public=: 3 : 0
NB. Makes aliases to UU public verbs in locale (y)
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

NB. ========== GLOBALS ==========

  NB. ONLY SCI and SIG reside in z-locale
  NB. Addon uu owns SCI_z_ and SIG_z_
  NB. Other addons shouldn't access these globals directly
  NB. (---then why are they in z-locale???)

  NB. currency exchange-rate tables, used by: quoted
  NB. quoted currencies are expressed in terms of the Euro.
  NB. if net is accessible, CUTAB to be updated from Eurobank figures
CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'	NB. initial short table
CUTAB=: CUTAB0			NB. pre-start value

HD=: '·'		NB. hi-dot, optional SI convention
NOTFOUND=: _1	NB. used by: cnvf cnvv
NUN=: '??'	NB. unrecognised-units placeholder, used by: convert
SL=: '/'
SP=: ' '
UL=: '_'

  NB. UNICODE
  NB. controls SI-compliance via utf-8 chars
  NB. get/set value externally via: ucode_uu_
  NB. UNICODE=0	units expressed entirely in ASCII
  NB. UNICODE=1	utf-8s e.g. Å but inverse shown as: /Å
  NB. UNICODE=2	utf-8, no '/'
  NB. UNICODE=3	utf-8, no '/', uses '·'

factory=: 3 : 0
	NB. set/restore factory settings of alterable globals
	NB. ONLY SCI and SIG reside in z-locale
SIG_z_=: 3	NB. used by: scino_z_ and format_sig
SCI_z_=: 5	NB. used by: scino_z_
UNICODE=: 1	NB. Used chiefly by: ucode
MAXLOOP=: 30	NB. limits: convert
UCASE=: 0  	NB. Used only by set_ucase, ssmx for case-insensitive UUC/F search
)

  NB. the primitive SI-units (+ some "honorary" primitive units)
mks=: ;:'m kg s A K cd mol rad eur item'
mks=: mks , (<'item'),each ":each i.10

NB. ========== UTILITIES ==========

all=: *./
and=: *.
any=: +./
brack=:	1 |. '][' , ":  NB. layout tool for message string ->'[y]'
cmx=: [: > <;._2	NB. expects trailing LF
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>	 NB. embed nums in string
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~	NB. eg: 3 to 5 <--> 3 4 5

cx=: 3 : 0
	NB. check for complex nouns in given locale
loc=. >coname''
nocomplex=. 1
for_no. (nl 0) -. <'INVALID' do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    smoutput nb 'cx:' ; nom ; 'is complex'
    nocomplex=. 0
  end.
end.
NB. Suppress ok-confirmation...
NB. if. nocomplex do. smoutput 'cx: no nouns are complex in: ',loc end.
i.0 0
)

undefined=: (3 : 0)"0
	NB. test for presence of UNDEFINED
if. -. 128!:5 y do. 0 return. end.
'_.' -: 5!:6 <'y'
)

invalid=: (3 : 0)"0
	NB. test for presence of INVALID
if. -. 128!:5 y do. 0 return. end.
'_.j_.' -: 5!:6 <'y'
)

quoted=: 3 : 0
	NB. =1 iff (y) is a quoted currency
(<toupper y) e. {."1 CUTAB
)


DIVIDER=:'==================== [uu] main.ijs ===================='

cocurrent 'uu'

NB. sessuu=: empty  NB. override to activate

adj=: 4 : 0
sessuu nb 'adj: ENTERED:' ; 'x=' ; x ; 'y=' ; y
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
NB. 	z [sllog 'z x y'
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
	NB. Sort units (str y) into canonical order
	NB. y must be fully-resolved units, ie all from boxed list: mks
	NB. Sort tokens EACH REVERSED. This brings num+denom terms together
z=. ; |. each sort |. each utoks y
	sessuu nb 'canon:' ; TAB ; 'z=' ; z
	NB. Cancel-out/collect each unit from global boxed list: mks in turn...
for_w. mks do. m=. ,>w		NB. m== next unit from list: mks
  if. any m E. z do.		NB. only if m is present in z
    z=. (z canc m) coll m
	sessuu nb 'canon:' ; TAB ; (brack m) ; 'z=' ; z
  end.
end.
z=. debnSL dlb ; sort utoks z	NB. k-m-s order, with denominators gathered behind
if. 0=#z do. z=. ,SL end.  	NB. CONVENTION: (empty z) --> ,'/'
)

cnvf=: 3 : 0
	NB. expand y using units->unitv, also return the conversion factor f
z=. (f=. INVALID) ; '' ; NOTFOUND	NB. "not-found" returned value
t=. utoks cnvv y			NB. y is a bare (units), no SP|SL
if. LK=NOTFOUND do. z return. end.
try. z=. (f=.LK{uvalu); t; LK		NB. item-value from LK: UU-row found by: cnvv
catch.
end.
	sessuu nb 'cnvf:' ; TAB ; 'f=' ; f ; (linz t)
z
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
sessuu 'cnvj: ENTERED'
	NB. cut prefs/suffs from a cunit (eg: '/kg^3')
k=. p=. 1 [ z=. y
if. (SL~:{.z) and (any '^-' E. z) do. NB. elim -ve power
  z=. SL,z rplc '^-' ; '^'
NB. y=. SL,dlb y-.'-'
end.
if. j=.(SL={. sp1 z) do. z=. }.z end.	NB. bool:j remembers dropped prefix: SP|SL
if. '^' e. z do.			NB. recognise a power...
  'p z'=. (".{:z) ; (}:}:z)		NB. drop/remember suffixed power (as integer)
end.
	NB. Identify scaling prefixes, eg 'ms' 'Gs' 'µ' (all variants of: s)
	NB. ONLY IF z is not itself in: units, eg 'knot' ...
if. (iskg z) or (not validunits z) do.
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
 sessuu nb 'cnvj:' ; TAB ; '/-?' ; j ; 'scale(k)=' ; k ; 'units(z)=' ; z ; 'power(p)=' ; p
j ; k ; z ; p		NB. here z has NO prefixed SP (or SL)
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
	NB. extract 1st non-mks token
i=. (y e. mkss)i. 0	NB. index of 1st token not in mkss
if. i<#y do.
  t=. >i{y		NB. the extracted token
  y=. (i~: i.#y)# y	NB. the residue without t
else.
  t=. ''		NB. and y is unchanged
end.
 sessuu nb 'cnvnon:' ; TAB ; 'next non-mks token=' ; (brack t) ; 'leaving:' ; (linz y)
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
	NB. collects-terms (no cancel-out)
	NB. serves: canon
	NB. eg: ' m kg kg/kg/kg s/s' coll 'kg'
	NB.	 m kg^2/kg^2 s/s
P=. '^'
z=. ,x			NB. the object string
n=. SP,y		NB. unit: y in numerator
d=. SL,y		NB. unit: y in denominator
for_p. 4 3 2 do.	NB. 4th-power units are highest recognised
  z=. z rplc ((p*$n)$n);(n,P,":p) ; ((p*$d)$d);(d,P,":p)
  sessuu nb 'coll:' ; TAB ; 'z=' ; z ; 'j=' ; j
end.
z
)

compatible=: 4 : 0
sessuu 'compatible: ENTERED'
	NB. =1 iff units x,y compatible
	NB. '*' is compatible with everything...
if. ('*'= {.>x) or ('*'= {.>y) do. 1 return. end.
ux=. compat cnvv >x [ uy=. compat cnvv >y
	sessuu nb 'compatible:'; 'ux='; ux; 'uy='; uy
if. (0<#uy) and (uy-:ux) do. 1 return. end.
a=. {.convert >x [ b=. {.convert >y
a-:b	NB. match their canonical units
)

compatlist=: 3 : 0
sessuu 'compatlist: ENTERED'
  NB. return extract of (units) compatible with units: y
z=. ''
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

  NB. convert
  NB. y (units) --> cu ; loop_count ; cf
  NB. Converts arbitrary compound units (str) to primitive SI-units as defined in: mks
  NB. Needed to compare two arbitrary units to see if compatible / inter-convertible.
  NB. Simplifies the result of a division of 2 physical quantities.
  NB. Returns 3-element: z
  NB.  (>{.z) is the canonical units (cu)
  NB.  (>{:z) is conversion factor (cf)
  NB.  (>1{z) is diagnostic only: the number of lookup-cycles.
  NB. Returns a canonical form (defined by: canon) to allow comparison using (-:).
  NB.  DEFN cunit: a canonical element, having prefix, scale and power, eg '/s^2'
  NB. Has a set of service-fns all with names cnv* ...
  NB.  cnvnon z  extract 1st non-mks cunit(, returns: cunit;residue
  NB.  cnvj t  cut t into: (1_if_prefixed_SL ; 10^n_scale ; unit ; ^n_repetition)
  NB.  cnvf t  lookup t in: units-->unitv, returns (factor ; units)
  NB.     -if not found, factor is _. -test using: isNaN f
  NB.  cnvv t  called by: cnvf
  NB.  j cnvi t  converts all SP<-->SL in cunits-str: t iff j=1
  NB.     - (j=1 iff the cunit of which t is the expansion had prefix SL
  NB. Uses: cnvnon to find first non-mks unit, t, 0=$t if no more units remaining.
  NB. A units str consists of a series of tokens called "cunits", order immaterial.
  NB. A cunit may be prefixed by SL (/) denoting denominator or by SP denoting numerator.
  NB. Fn: utoks tokenises a units str. ensures 1st cunit has a leading SP
  NB.  provided a leading SL is not already present. Uses sp1 to achieve this.
  NB. Since SP is a meaningful cunit prefix, use of: deb will expunge not only SP,SP
  NB.  but also any leading SP. But there must be a leading SP|SL.
  NB. Uses: cnvf to lookup (bare) unit in: units-->unitv
  NB. The expanded units tokens are then SUFFIXED to the unprocessed residue: rx
  NB. -we can do that since order of cunits is immaterial.
  NB. Fn: cnvf also returns conversion factor (f)
  NB. Finally when no more units to expand (max cycles=30 as failsafe)
  NB. the result is converted to canonical form using: canon.
convert=: 1&$: : (4 : 0)"1
sessuu nb 'convert: ENTERED:' ; 'x=' ; x ; 'y=' ; y
y=. bris y  NB. extend the range of acceptible units formats
  NB. x=1 --use: uvalx
if. x do.	NB. SPEEDUP: try: unitx, uvalx (if there)
  if. 0<#z=.cnvx y do. (z ; 1 ; LK{uvalx) return. end.
end.
fac=. 1				NB. conversion factor init'd
z=. utoks y			NB. needs y tokenised
sessuu nb 'convert:' ; 'utoks=' ; z
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
	sessuu nb 'convert:';(brack loop); 'z=';(linz z); 'fac=';fac; 'j=';j; 'subfac=';subfac
end.
	NB. if MAXLOOP reached then must assume not all non-mks tokens have been converted
if. loop=MAXLOOP do. loop=. 0 end. NB. signalling a suspicious result
(canon ;z) ; loop ; fac [sessuu 'convert: EXITTED'
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

  NB. deslash
  NB. x=1 --converts cunits with '/' into '^_n' form
  NB. x=0 --converts '^_n' cunits back into '/'
deslash=: 1&$: : (4 : 0)
NB. if. UNICODE e. 2 3 do. y return. end.
  NB. no-op unless slashed units possible
r=. ''	NB. accumulates modified cunits
for_cu. utoks y do. cunit=. >cu
  if. (x=0) or SL={.cunit do.  NB. inverse: do BOTH SP SL
    'j k z p'=. cnvj cunit
    if. x do.
      cunit=. SP, (}. '^' taketo cunit),'^-',":p
    else.
      sessuu cunit ; j ; k ; z ; p
      cunit=. (j{SP,SL), (}. '^' taketo cunit) ,(p>1)# '^',":p
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
  NB. dotted convention is ONLY applied if UNICODE=3 (or more)
]z=. utf8 deb y
if. x and (UNICODE>:3) do.  NB. apply convention
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
sessuu 'format: ENTERED'
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
assert. -. bad -: z=. fread y,'manifest.ijs'
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

0 : 0
note 440	NB. A (concert-pitch is 440 Hz)
note 194.18	NB. G (earth-rotation musical note)
)

np=: [: <: 2 * -.
rnd=: [: <. 0.5 + ]

scino=: 3 : 0
sessuu nb 'scino: ENTERED:' ; 'y=' ; y
  NB. Scientific notation for number: y
  NB. but returns ordinary integer for integer (y)
  NB. Uses current values of SIG and SCI (they can change)
fmt=. j. SIG * 1 _1 {~ ((10^SCI) <: |y)  or  ((10^-SIG) > |y)
if. (y=<.y) and (y<10^SCI) do. ":y else. fmt ": y end.
)

selfcanc=: 3 : 0
sessuu 'selfcanc: ENTERED'
  NB. Self-cancel unitstr (y) without reducing to mks
  NB. Sort tokens EACH REVERSED -collects num+denom terms
z=. ; |.each sort |.each ut=. utoks y
t=. ~. }.each ut
for_cb. ~.t do.
  z=. z canc >cb
  z=. z coll >cb
end.
z=. dlb canon z
z rplc '/^2';'/';'/^3';'/';'/^4';'/';'/^5';'/';'/^6';'/';'/^7';'/';'/^8';'/';'/^9';'/'
)

sci=: 3 : 0
sessuu 'sci: ENTERED'
  NB. get/set SCI (sci notation threshold)
if. 0=#y do. SCI
else. SCI_z_=: {.y  NB. actually resides in z-locale
end.
)

sig=: 3 : 0
sessuu 'sig: ENTERED'
  NB. get/set SIG (decimal places for: format)
if. 0=#y do. SIG
else. SIG_z_=: {.y  NB. actually resides in z-locale
end.
)

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
	NB. inspect result of: umake
if. y=_ do. 0 test _	NB. to output the whole table
else. y test y		NB. just a single line
end.
:
	NB. test of UUC against umake globals
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
sessuu 'ucase: ENTERED'
if. 0=#y do. UCASE
else. UCASE=: {.y
end.
)

hasutf=: [: +./ 127 < a. i. ]  NB. y has utf8 chars (not pure ASCII)
isascii=: [: *./ 128 > a. i. ]  NB. y is pure ASCII (no utf8s)
NB. isascii 'm² K⁻¹ s⁻²'
NB. isascii 'able'

NB. OLD VERSION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
ucode0=: 1&$: : (4 : 0)
	NB. x=1 -- subst 'π' for PI etc
	NB. x=0 -- subst PI for 'π' etc
if. x do.
  if. 0=#y do. y=. ,SL end.  NB. avoid returning '' 
  if. UNICODE=0 do. y return. end.  NB. no need to convert
  ]z=. deslash unslash1 undotted y
  ]z=. 7 u: z rplc ,cspel,.csymb
else.
  if. isascii y do. y return. end.  NB. no need to convert
  NB. convert unicode back to utf-8 before rplc...
  z=. (utf8 y) rplc HD;SP
  z=. undeslash z rplc ,csymb,.cspel
end.
)

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
  z=. y rplc HD;SP
  z=. undeslash z rplc ,csymb,.cspel
  NB. Change only the scaling prefix, 'µ' ...
  if. z begins ,'µ' do. z=. 'u',2}.z end.
end.
)
0 :0
0&ucode 'm² K⁻¹ s⁻²'	NB. m^2 K^-1 s^-2
0&ucode 'ft/(s·s)'  	NB. ft/(s s)
ucode 'm^2/K/s^2'    	NB. m²/K/s²
)

ucods=: 1&$: : (4 : 0)
	NB. saddle to call ucode, but ignoring currency symbols
SAV=. cspel ;< csymb
'cspel csymb'=: sspel ;< ssymb
z=. x ucode y
z [ 'cspel csymb'=: SAV
)

udat=: 4 : 0
sessuu 'udat: ENTERED'
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
sessuu 'udiv: ENTERED'
if. (1=#y) and (y=SL) do. x return. end.
z=. cnvi utoks y    NB. invert token-list y
z=. selfcanc x , ;z NB. combine x, z as if multiplied
z=. z rplc '/^2';'/'
)

udumb=: 3 : 0
sessuu 'udumb: ENTERED'
'zdesc znits znitv zvalu'=. y
zdesc; znits; 1  NB. assume 1 nominal unit is only ever required
)

  NB. umake
  NB. makes globals: cspel csymb mkss units unitv uvalu unitx uvalx compat
  NB. x=0: DONT adjust currency
NB. ============================================
umake=: 0&$: : (4 : 0)
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
cx''	NB. check if any noun has become complex
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
sessuu nb 'uniform: ENTERED:' ; 'x=' ; x ; 'y=' ; y
  NB. change units (y) to acceptable format for (UNICODE)
	y_uu_=: y
	x_uu_=: x
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
  if. y-: ,SL do. '' return. end.  NB. No bare '/' in Standard SI
  ]z=. unucode undotted y	NB. c/f case 0
  ]z=. ucode deslash unslash1 z

case. 3 do.  NB. Standard SI units with dots
  if. y-: ,SL do. '' return. end.  NB. No bare '/' in Standard SI
  z=. dotted 2 uniform y
end.
z
)
NB. 2 uniform 'm m/(K s s)'
NB. 1 uniform 'm^2/K/s^2'
NB. 2 uniform 'ft/s^2'

undeg=: 3600 %~ _ 60 60 #. 3 {. ]
undeslash=: 0&deslash
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

utoks=: 3 : 0
	NB. tokenize y, ensuring leading SP|SL
z=. sp1 y	NB. ensure leading sign-byte: SP|SL
z=. (z e. SP,SL) <;.1 z
)

uu=: ''&$: : (4 : 0)
	NB. transform y (value;units) to: x (ux)
	NB. x is target units: ux
	NB. y is value;units
err=. 4 : 'if. x-:''literal'' do. y else. 0 ; y end.'
]dy=. datatype y
select. dy
case. 'literal' do.
  ]val=. eval SP taketo y
  uns=. SP takeafter y
case. 'boxed' do.
  ]'val uns'=. y
  if. -.isNo val do. val=. eval ":val end.
case. do.
  nb '>>> cannot handle:' ; y return.
end.
NB. ]uns=. unslash1 undotted uns
NB. ux=. 0 ucode x		NB. de-unicoded x
NB. ]ux=. unucode unslash1 undotted x  NB. ASCII-ized x
  NB. Make uy, ux kosher for compatibility test
]uy=. bris uns
]ux=. bris x
if. 0<#x do.
  if. -. ux compatible uy do.
    z=. '>>> incompatible units: ', x ,SP, uns
    dy err z return.
  end.
end.
'unsc c fy'=. convert uns	NB. unsc is in SI units
if. fy=_ do. dy err '>>> unknown units: ',uns return. end.
  NB. Default x to: unsc (uns converted to SI units)
if. 0=#x do. ux=. bris x=. unsc end.
]fx=. >{: convert ux  NB. get the conversion factor: fx
]qty=. (fy%fx) * ('_',uns) adj val
]uno=. uniform x  NB. units for output
	sllog 'fy fx val'
	sllog 'uno uns ux x'
if. dy-:'literal' do.
  z=. (ucode utf8 ux format qty),SP,uno
else.
  z=. (ux adj qty) ; uno
end.
)

uunicode=: 3 : 0
if. 0=#y do. UNICODE
else. UNICODE=: {.y
end.
)

uurowsc=: 3 : 0
sessuu 'uurowsc: ENTERED'
(UUC ssmx y){UUC
)

uurowsf=: 3 : 0
sessuu 'uurowsf: ENTERED'
(UUF ssmx y){UUF
)

validunits=: 3 : 'units e.~ <,y'

DIVIDER=:'==================== [uu] format.ijs =================='

NB. ┌────────────────────────────────────────────────┐
NB. │See DEV 97 for new pattern-matching technique   │
NB. │which combines input & output into a single verb│
NB. │called: format3                                 │
NB. └────────────────────────────────────────────────┘

NB. This is a new version, based on the 'errif' technique
NB. Every (pro)verb beginning 'take_' gets tried in turn
NB.  until one works.

NB. A corresponding set of (pro)verbs beginning 'give_'
NB. accept input in a variety of formats and convert them
NB. to a quantity (a scalar number)
NB. Both 'give_' and 'take_' verbs are maintained as a single
NB. collection in this script.
NB.
NB. This arrangement allows ad-hoc 'give_' and 'take_' verbs
NB. to be defined in the t-table itself (which is a J script).

cocurrent 'uu'

give=: 4 : 0
  NB. implements verb: format
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

DIVIDER=:'==================== [uu] start.ijs ===================='

cocurrent 'uu'

loaddefs=: 3 : 0
  NB. load additional defs kept in TPATH_UU*
  NB.  y='C'	TPATH_UUC
  NB.  y='F'	TPATH_UUF
path=. ('TPATH_UU',y)~
uut=. 'UU',y
  NB. Ensure these folders exist
1!:5 :: _1: <}: TPATH_UU  NB. contains: (path)
1!:5 :: _1: <}: path
  NB. load contents of TPATH_UU*
r=. i.0 0
if. 0<$files=. {."1 (1!:0) path,'/*' do.
  for_fi. files do.  r=. r, 'm'freads path,>fi end.
end.
$(uut)=: r ,~ uut~
)

start=: 3 : 0
sessuu 'start: ENTERED'
  NB. start the addon: UU
  NB. Not only intended to be called on loading,
  NB. but can be called by apps using UU
  NB. whenever constants library (UUC) has been changed.
  NB. (start'' not needed when the functions library (UUF) changed)
NB. 0 enlog 0   NB. start a new log file -- c/f _cal_
factory''
VERSION=: 'v.v.00'
NB. …REPLACES DODGY: getversion TPATH_UU
loaddefs each 'C';'F'
umake''
)

NB. ============================================
cocurrent 'z'

NB. UU definitive paths - kept in _z_

TPATH_UU=: 3 : 0 ''
	NB. returns directory containing this script
	NB. also assigns global: WHEREAMI -the folder in question
	NB. plus SEP -the platform-dependent path-separator.
ws=. [: 'Not from script'"_`({ 4!:3@(0&$))@.(0&<:) [: 4!:4 [: < >
WHEREAMI=: '<UNSET>'	NB. needed for ws to work with
z=. >ws 'WHEREAMI'
SEP=: '/\' {~ '\' e. z
WHEREAMI=: (>: z i: SEP) {.z
)

TPATH_UUC=: TPATH_UU , 'uuc.ijs'	NB. constants
TPATH_UUF=: TPATH_UU , 'uuf.ijs'	NB. functions
TPATH_UUM=: TPATH_UU , 'uum.ijs'	NB. conversns

NB. aliases in _z_

uu=: uu_uu_			NB. the "keyhole"
uuc=: 3 : 'open TPATH_UUC'		NB. TEST ONLY: view constants
uuf=: 3 : 'open TPATH_UUF'		NB. TEST ONLY: view functions
uum=: 3 : 'open TPATH_UUM'		NB. TEST ONLY: view conversns
uunicode=: uunicode_uu_		NB. unicode level for SI-units

NB. ============================================
start''
