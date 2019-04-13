	NB. uu - utilities.ijs
'==================== [uu] utilities ===================='

cocurrent 'uu'

  NB. NEEDS CHECKING against long PI again >>>>>>>>>>>>>>>>>>>>
NB. dfr=: *&(%PI%180)  NO... needs latest truncated PI!
NB. rfd=: *&(PI%180)
dfr=: 3 : '180*y%PI'
rfd=: 3 : 'PI*y%180'

NB. boxed substrings in x at the stars of pattern: y
cutByPattern=: 13 : '((;:y) -. <,ST) -.~ ;:x'
cutByPattern=: ((<,'*') -.~ [: ;: ]) -.~ [: ;: [

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
  NB. y == list of indexes into UUC -- OR ALTERNATIVELY...
  NB.   y == single index (expands to a block of VIEWTABLE lines)
  NB.   y == nominal unit, e.g. 'G'
  NB.   y == open list of nominal units, e.g. 'G N'
  NB. x == OPEN list of names of nouns (usually the table's columns)
  NB. x == '' (defaulted) - use the default list: faux
  NB. VIEWTABLE (if defined) alters the default number of displayed lines (10)
faux=. 'i unitc units unitv uvalc rvalc uvalu rvalu uvald rvald'  NB. x-default value
  NB. …for meaning of a given list, see: terminology.txt
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
0 :0 NB. SAMPLES...
vt I. uvalc ~: uvalu
vt I. uvald>0
)

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
trace 0	NB. to reset existing verb tracing
require '~addons/labs/labs/labs.ijs'
try. lab_jlab_ thelab
catch.
  require '~addons/labs/labs/labs805.ijs'
  lab_jlab805_ thelab
end.
)

originalsin=: 3 : 0
  NB. restore the floating pt trig defns
cocurrent 'z'
sin=: 1&o."0
cos=: 2&o."0
tan=: 3&o."0

sinh=: 5&o."0
cosh=: 6&o."0
tanh=: 7&o."0

arcsin=: _1&o."0
arccos=: _2&o."0
arctan=: _3&o."0

arcsinh=: _5&o."0
arccosh=: _6&o."0
arctanh=: _7&o."0
i.0 0
)

NB. ======================================
NB. SCIENTIFIC UTILITIES
NB. ======================================

cocurrent 'z'  NB. <<<<< MAKE VISIBLE TO CAL TOO

choice=: 4 : '((0>.1<.x)){y'

abs=: |
avg=: +/ % #
div=: %
int=: [: <. ] + 0 > ]
mod=: |~
times=: *
