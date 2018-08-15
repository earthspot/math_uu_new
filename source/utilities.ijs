	NB. uu - utilities.ijs
'==================== [uu] utilities ===================='

cocurrent 'uu'

ddefine=: 1 : 'm&$: : (4 : 0)'
isBoxed=: 0 < L.
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw		NB. for error signal: always smoutputs
ssw=: smoutput&sw		NB. the standard verb: always smoutputs
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

sessuu1=: 3 : 0
if. ME e. a: default 'TRACEVERBS' do.
  smoutput y
else. i.0 0  NB. same as returned by smoutput
end.
)

make_msg=: 1 ddefine
  NB. USED BY: start -and diagnostics for given IDs
  NB. These diagnostics get switched off/on by: start
ME=: a:	NB. init ME (in all modes)
talks=. x	NB. Boolean: x==1 -- output to sess
if. y do.
  sessuu=: sessuu1
  msg=: sessuu&sw	NB. for alert signal: governed by TRACEVERBS
  sllog=: sessuu&llog
  if. talks do.
    smoutput '+++ make_msg: msg is ACTIVE',LF
  end.
else.
  sessuu=: empty
  msg=: empty
  sllog=: empty
  if. talks do.
    smoutput '--- make_msg: msg is empty',LF
  end.
end.
y return.
)

all=: *./
and=: *.
any=: +./
begins=: beginsWith=: ] -: [ {.~ [: # ]
brack=:	1 |. '][' , ":  NB. layout tool for message string ->'[y]'
cmx=: [: > <;._2	NB. expects trailing LF
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>	 NB. embed nums in string
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~	NB. eg: 3 to 5 <--> 3 4 5

report_complex_nouns=: 3 : 0
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

tv=: 3 : 0
  NB. sets/resets TRACEVERBS
PLUS=. '+'
verbs1=. ;: 'qtcode4i qtcode4anyunit qtcode4bareunit scale4bareunit'
verbs2=. verbs1 , ;: 'cnvj cnv2bare'
if. PLUS={.y do. z=. TRACEVERBS_uu_ ,SP, y-.PLUS
else. select. y
case.'' do. z=. TRACEVERBS_uu_  
case. 0 do. z=. TRACEVERBS_uu_=: ;: ''
case. 1 do. z=. TRACEVERBS_uu_=: ;: verbs1
case. 2 do. z=. TRACEVERBS_uu_=: ;: verbs2
case.   do. z=. TRACEVERBS_uu_=: ;: y  NB. dflt: y==openlist of verbs
end. end.
ssw '+++ tv: #:(#z) TRACEVERBS: (linz z)'
)

utoks=: 3 : 0
  NB. tokenize y, ensuring leading SP|SL
z=. sp1 y	NB. ensure leading sign-byte: SP|SL
z=. (z e. SP,SL) <;.1 z
)

vt=: viewtable=: '' ddefine
  NB. y == index into list: units -OR…
  NB.   y == nominal units, e.g. 'G'
  NB.   y == open list of nominal units, e.g. 'G N'
  NB. x == OPEN list of names of nouns (usually the table's columns)
  NB. x == '' (defaulted) - use the default list
  NB. VIEWTABLE (if defined) alters the default number of displayed lines (10)
faux=. 'units unitv unitx uvalu uvalx uvalc unitc i'	NB. x-default value
if. '' -:x do. x=. faux end.
if. isNo y do.
  y=. y+i.10 default 'VIEWTABLE'
end.
if. isLit y do.
  y=. units i. ;:y
end.
st =. (":&.>)"0	NB. utility verb: numlist-->string
cst=. ([: st [) ,. [: st ]  NB. utility verb: combine st-ed lists x y
]h=. ,: ;: cols=. x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
h,y{t
)

NB. ======================================
NB. TEST-ONLY utilities, some redundant...
NB. ======================================

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

ID=: 3 : 0
  NB. lookup y in (units) -- return IDs
  NB. e.g.  ID 'm kWh gbp' --> 1 37 73
  NB. vt ID 'm kWh gbp'
units i. ;:y
)

test_z_=: 3 : 0
  NB. handles F5 for quick testing
NB. smclear''
sm        uu '100 degC'
sm        uu '212 degF'
sm        uu '373.15 K'
sm 'degF' uu '100 degC'
sm 'degC' uu '212 degF'
sm 'degF' uu '212 degF'
sm 'degC' uu '100 degC'
)

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

xxu=: (3 : 0)"0
  NB. check unitc against unitx for ID: y
UNC=: canon expandcode y{unitc
UNX=: >y{unitx
if. UNC -: UNX do. smoutput 'hooray!'
else. UNC ; UNX end.
)

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
ssw '--- VALIDATE_unitc: mismatches=(#bads) …but ignore 11, 28'
bads=. bads -. 11 28
if. 0<#bads do.
  smoutput viewtable bads
  smoutput '... bads+30 (to identify by line# in uuc.ijs)…'
  smoutput bads+30
end.
bads return.
)