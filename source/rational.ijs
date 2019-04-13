	NB. uu - rational.ijs
'==================== [uu] rational ===================='

0 :0
Friday 12 April 2019  11:59:16
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

s4x=: 16 ddefine
  NB. make rational number in interval (1,10) out of integer|extended (y)
  NB. Cap #P at (x) digits
P=. ":y
if. x<#P do. P=. x{.P end.
".P,'r1',(<:#P)#'0'
)

rat_z_=: rational_z_=: x:!.0
float_z_=: _1&x:  		NB. rational-->	float|int|Bool
extended_z_=: x:!.0	NB. integer -->	extended
numDenom_z_=: 2&x:		NB. rational -->	(extended,extended)
rat4pair_z_=: (_2&x:)&x:	NB. (num,num)-->	rational

NB. isRational=: 3 : '64 128 e.~ 3!:0 y'
isRational=: 64 128 e.~ 3!:0  NB. also covers: isExtended
isExtended=: 64 = 3!:0
isFloating=: 8 = 3!:0
notFloat=: 8 ~: 3!:0

reval=: 3 : 0 "1
  NB. variant of: eval - returns 'rational'
  NB. used by make_units to evaluate numeric exprns in: UUC
y__=: y
y=. deb >y
NB. ssw '... reval: y=(y)'
    if. all y e. n9 do. ". y,'x'
elseif. '/' e. y do. __r1&". '/r-_'charsub y
elseif. 'j' e. y do. rat4sc 'j' taketo y  NB. REAL PART ONLY !!!
elseif. y-: ,'_' do. _r1
elseif. y-: '__' do. __r1
elseif. all y e. n9,'._' do. rat4sc y
elseif. 'e' e. y do. rat4sc y
elseif. 'E' e. y do. rat4sc y
elseif. 'r' e. y do. rat4r y
elseif. 'x'= {:y do. rat4x y
elseif. y begins '10^' do. rat4pt ::rat4po y
elseif. '^' e. y do. rat4po y
elseif. 0=nc <y  do. rat4pn y
end.
)

ieval=: 3 : 0 "1
  NB. variant of: eval - returns 'rational' --IMAGINARY PART
  NB. used by make_units to evaluate numeric exprns in: UUC
y=. deb >y
if. 'j' e. y do. rat4sc 'j' takeafter y  NB. IMAGINARY PART ONLY !!!
else. 0r1
end.
)

rat4pn=: 3 : 0 "1
  NB. rational for pronoun (=constant) (char)y, eg PI, PI2 …
msg '... rat4pn: y=(y) [(float ".y)]'
try.
  assert. 0= 4!:0 <y  NB. is (y) a pronoun?
  y~
catch.
  ssw '>>> rat4pn: cannot handle y=''(y)'''
  BADRAT  NB. a bona-fide rational, but representing an error
end.
)

rat4x=: 3 : 0 "1
  NB. rational for extended numeral (char)y
msg '... rat4x: y=(y) [(float ".y)]'
".y
)

rat4r=: 3 : 0 "1
  NB. rational for rational numeral (char)y
msg '... rat4r: y=(y) [(float ".y)]'
".y
)

rat4pt=: 3 : 0 "1
  NB. rational for power-of-ten numeral (char)y of form: 10^…
msg '... rat4pt: y=(y) [(float ".y)]'
if. (y begins '10^_') or (y begins '10^-') do. ". NN=:'1r1',(".4}.y)#'0'
elseif. y begins '10^' do. ". NN=:'x' ,~ '1',(".3}.y)#'0'
NB. elseif. do.
NB.   ssw '>>> rat4pt: cannot handle y=''(y)'''
NB.   BADRAT  NB. a bona-fide rational, but representing an error
end.
)
0 :0
rat4pt '10^21'
rat4pt '10^3'
rat4pt '10^-21'
rat4pt '10^-5'
rat4pt '10^_5'
)

rat4po=: 3 : 0 "1
  NB. rational for power numeral (char)y of form: a^b
msg '... rat4po: y=(y) [(float ".y)]'
rat ".y
)
0 :0
rat4po'10^1.0001'
rat4po'10^-5.0001'
rat4po'10^_5.0001'
)

rat4sc=: 3 : 0 "1
  NB. rational for scientific numeral (char)y
y=. y rplc 'E' ; 'e' ; '-' ; '_'
c=. 'e' taketo y
a=. ".c-.DT
b=. ".y
scale=. rnd 10^. a%b
msg '... rat4sc: y=(y) [(float ".y)] scale=(scale) c=(c) a=(a) b=(b)'
if. isRational b do. b
elseif. scale<0      do. ". ((c-.DT) , (|scale)#'0') , 'r1'
elseif.              do. ". (c-.DT) , 'r1' , scale#'0'
end.
)
0 :0
rat4sc '_1.23e_5'
rat4sc '_1.23E_5'
rat4sc '_1.23E-5'
rat4sc '-1.23E-5'
reval '_1.23e_5'
reval '_1.23E_5'
reval '_1.23E-5'
reval '-1.23E-5'
)

rat_check=: 3 : 0
  NB. verify integrity of rational caches
try.
assert. all boo=. uvalu = float rvalu
assert. all boo=. uvald = float rvald
assert. all boo=. uvalc = float rvalc
assert. all boo=. -. uvalc e. 0 _ __
  NB. …means: all units have been resolved
catch.
  bads=. I. -.boo
  smoutput '>>> rat_check: failed at these UUC rows…'
  smoutput vt bads
  wd'beep'
end.
)

test_reval=: 3 : 0
  NB. verify the function of: reval
  NB. TEST: rat4sc rat4pn rat4po rat4pt rat4r rat4x
z=. _123r10000000
assert. z -: reval '_1.23e_5'
assert. z -: reval '_1.23E_5'
assert. z -: reval '_1.23E-5'
assert. z -: reval '-1.23E-5'
z=. 1000000000000000000000
assert. z -: reval '10^21'
z=. 1r1000000000000000000000
assert. z -: reval '10^-21'
z=. 6832167611r683374095687762
assert. z -: reval '10^-5.0001'
assert. z -: reval '10^_5.0001'
assert. z -: reval '6832167611r683374095687762'
z=. 6832167611683374095687762x
assert. z -: reval '6832167611683374095687762x'
z=. PI
assert. z -: reval 'PI'
smoutput '--- test_reval: completed'
)

onload 'test_reval$0'

