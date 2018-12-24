	NB. uu - utilities.ijs
'==================== [uu] utilities ===================='

cocurrent 'uu'

sl_z_=: 4 : 0
  NB. RELIABLE path catenator: should reside in _z_
  NB. made available in utilities.ijs of both CAL and UU
  NB. IAC Saturday 22 December 2018  19:25:56
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

NB. boxed substrings in x at the stars of pattern: y
cutByPattern=: 13 : '((;:y) -. <,ST) -.~ ;:x'
cutByPattern=: ((<,'*') -.~ [: ;: ]) -.~ [: ;: [

NB. from handy, post-analoc
isLit=: 2 2048 e.~ 3!:0
ifdefined=: 0 <: [: 4!:0 <
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
isNo=: isNum *. isScalar
   
ddefine=: 1 : 'm&$: : (4 : 0)'
isBoxed=: 0 < L.
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
  NB. smresolve=. is only used by Swift-string verb: sw
smresolve=. (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw		NB. for error signal: always smoutputs
ssw=: smoutput&sw		NB. the standard verb: always smoutputs
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

all=: *./
and=: *.
any=: +./
b2o=: }.@((<' ') ;@,. ])
b4o=: [: <;._1 ' ' , ]
  NB. …use b4o instead of monadic (;:) with open-lists of units
  NB. because units can contain '.' -which (;:) cuts.
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
for_no. nl 0 do.  val=. ".nom=. >no
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

quoted=: 3 : 0
  NB. =1 iff (y) is a quoted currency
(<toupper y) e. {."1 CUTAB
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
faux=. 'units unitv uvalu uvald uvalc unitc i'	NB. x-default value
if. '' -:x do. x=. faux end.
if. isNo y do.
  y=. y+i.10 default 'VIEWTABLE'
end.
if. isLit y do.
  y=. units i. b4o y
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

runlab=: 3 : 0
  NB. private way to run uu.ijt in j807
  NB.   see: temp 16
if. 0=#y do.
  ]y=. jpath'~Gituu/uu.ijt'
end.  NB. THE LAB UNDER DEVT
if. -.fexist y do.
  smoutput '>>> runlab: file not found: ',y
  return.
end.
]thelab_z_=: y
traceverbs 'OFF'	NB. to reset existing verb tracing
require '~addons/labs/labs/labs805.ijs'
NB. lab805_jlab_ thelab  NB. alternative (WHEN TO USE??)
lab_jlab_ thelab
)

tpath=: 3 : 0
  NB. queries TPATH_ settings
smoutput'———————————————————————————'
]tt=. 'TPATH_' nl_z_ 0
for_tboxed. tt do. t=. >tboxed
  tx=. 16{. t,'_z_'
  ssw '(tx) =: ''(t~)'''
end.
smoutput'———————————————————————————'
)

tpaths=: 3 : 0
  NB. list of TPATH* nouns in _z_ and their contents
]z=. 'TPATH' nl_z_ 0
]p=. ".each z
]e=. (;fexist each p) { <"0'? '
smoutput e ,. z ,. p
for_t. z do.
  NB. generate phrases to show Finder windows...
  smoutput 'shell' c (quote'open ') c CM c >t
end.
i.0 0
)

real=: 9&o.
imag=: 11&o.