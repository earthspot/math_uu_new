	NB. uu - utilities.ijs
'==================== [uu] utilities ===================='

cocurrent 'uu'

NB. sl has been withdrawn from THIS SCRIPT.
NB. It is now defined in: paths.ijs

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
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw		NB. for error signal: always smoutputs
ssw=: smoutput&sw		NB. the standard verb: always smoutputs
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

make_msg=: 1 ddefine
  NB. USED BY: start -and diagnostics for given IDs
  NB. These diagnostics get switched off/on by: start
clearme''	NB. cleardown ME (in all modes)
talks=. x	NB. Boolean: x==1 -- output to sess
if. y do.
  sessuu=: sessuu1
  msg=: sessuu&sw	NB. for alert signal: governed by TRACEVERBS
  sllog=: sessuu&llog
  if. talks do. smoutput '+++ make_msg: msg is ON',LF end.
else.
  sessuu=: empty
  msg=: empty
  sllog=: empty
  if. talks do. smoutput '--- make_msg: msg is OFF',LF end.
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

trv=: 3 : 0
  NB. sets/resets TRACEVERBS
PLUS=. '+'
MINUS=. '-'
verbs1=. ;: 'uu formatIN formatOUT'
verbs2=. ;: 'uu'
verbs3=. ;: 'qtcode4i qtcode4anyunit qtcode4bareunit scale4bareunit'
NB.     if. PLUS={.y  do. z=. ~. TRACEVERBS_uu_ ,~ ;: y-.PLUS
NB. elseif. MINUS={.y do. z=. ~. TRACEVERBS_uu_ -. ;: y-.MINUS
select. {.y
case. ' '   do. z=. TRACEVERBS_uu_  
case. 0     do. z=. TRACEVERBS_uu_=: 0$a:
case. 1     do. z=. TRACEVERBS_uu_=: verbs1
case. 2     do. z=. TRACEVERBS_uu_=: verbs2
case. 3     do. z=. TRACEVERBS_uu_=: verbs3
case. PLUS  do. z=. TRACEVERBS_uu_=: ~. TRACEVERBS_uu_ ,~ ;: y-.PLUS
case. MINUS do. z=. TRACEVERBS_uu_=: TRACEVERBS_uu_ -. ;: y-.MINUS
case.       do. z=. TRACEVERBS_uu_=: ~. ;: y  NB. dflt: y==openlist of verbs
end.
ssw '+++ trv: #:(#z) (LF)TRACEVERBS: (linz z)'
)

trv_z_=: trv_uu_  NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

clearme=: 3 : 0
  NB. clear the register of currently running verbs
ME_uu_=: ''  NB. cleardown ME
i.0 0
)

pushme=: 1 ddefine
  NB. register (y) as the currently running verb
ME_uu_=: ~. ME_uu_ ,~ ;:y
if. x do. msg '+++ (y): ENTERED' end.
i.0 0
)

popme=: 1 ddefine
  NB. de-register (y) as the currently running verb
if. x do. msg '--- (y): EXITS' end.
ME_uu_=: ME_uu_ -. ;:y
i.0 0
)

sessuu1=: 3 : 0
if. traced ME do. smoutput y end.
i.0 0
)

traced=: 3 : 0
  NB. (bool) verb/s (y) is/are listed in TRACEVERBS
  NB. (y) is usually: (ME)
NB. z=. boxopen y
z=. {. boxopen y
any z e. a: default 'TRACEVERBS'
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
trv 0	NB. to reset existing verb tracing
require '~addons/labs/labs/labs805.ijs'
NB. lab805_jlab_ thelab  NB. alternative (WHEN TO USE??)
lab_jlab_ thelab
)
runlab_z_=: runlab_uu_


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

  NB. Have BOTH these utilities shadowed in _z_ ...
tpath_z_=: tpath_uu_
tpaths_z_=: tpaths_uu_
