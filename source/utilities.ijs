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

NB. ADJUST for trace output…
trace_z_=: 3 : 'TRACE_z_=: | * y'
NB. trace 0
trace 1

make_msg=: 3 : 0
  NB. USED: start
  NB. These diagnostics get switched off/on by: start
if. y do.
  sessuu=: 3 : 'if. zeroifabsent''TRACE'' do. smoutput y else. i.0 0 end.'
  msg=: sessuu&sw	NB. for alert signal: governed by TRACE
  sllog=: sessuu&llog
  msg '+++ make_msg: msg is ACTIVE'  NB. self-confirmation
else.
  sessuu=: empty
  msg=: empty
  sllog=: empty
  smoutput '--- make_msg: msg is empty'
end.
y return.
)

make_msg 1	NB. ENABLE diagnostics


all=: *./
and=: *.
any=: +./
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

vt=: viewtable=: (a:&$: : (4 : 0))"0
  NB. y == index into list: units
  NB. x == BOXED list of names of nouns (the table's columns)
  NB. x MUST BE scalar, to allow ("0) to apply to y (…also x)
  NB. x == a: (defaulted) - use the default list
if. a: -:x do. x=. <'units unitv uvalu unitx uvalx unitc i' end.
st =. (":&.>)"0	NB. string version of numlist
cst=. ([: st [) ,. [: st ]  NB. combine st-ed lists
]h=. ;: cols=. >x
]i=. i.#UUC
]t=. ". cols rplc SP;' cst '
]z=. t{~ y + i.10 ifabsent 'VIEWTABLE'  NB. #lines of output
h,z,h
)

