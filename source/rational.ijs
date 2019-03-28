	NB. uu - rational.ijs
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
  NB. Boolean: y is NOT floating
-. (datatype y) -: 'floating'
)

rat=: rational=: 3 : 0 "0
  NB. convert datatype: floating --> rational
reval ":y
)

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
elseif. 'p' e. y do. rat4pi y
elseif. 'r' e. y do. rat4r y
elseif. 'x'= {:y do. rat4x y
elseif. do. _r1 [ssw '>>> reval: cannot handle y=[(y)]'
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

rat4x=: 3 : 0 "1
  NB. rational for extended notation (char)y
msg '... rat4x: y=(y) [(real ".y)]'
".y
)

rat4r=: 3 : 0 "1
  NB. rational for rational notation (char)y
msg '... rat4r: y=(y) [(real ".y)]'
".y
)

rat4pi=: 3 : 0 "1
  NB. rational for "pi" notation (char)y
  NB. PI (constants.ijs) assumed to be RATIONAL - high-precision
'c d'=. <;._2 y,'p'
a=. ".c
b=. ".d
NB. ssw '... rat4pi: y=[(y)] a=(a) b=(b) c=(c) d=(d)'
". sw '(a)*PI^(b)'
)

rat4sc=: 3 : 0 "1
  NB. rational for scientific notation (char)y
c=. 'e' taketo y
a=. ".c-.DT
b=. ".y
scale=. rnd 10^. a%b
NB. ssw 'rat4sc: y=[(y)] scale=(scale) c=(c) a=(a) b=(b)'
if. 'rational'-:datatype b do. b
elseif. scale<0      do. ". ((c-.DT) , (|scale)#'0') , 'r1'
elseif.              do. ". (c-.DT) , 'r1' , scale#'0'
end.
)

rat_check=: 3 : 0
  NB. verify integrity of rational caches
assert. all uvalu = real rvalu
assert. all uvald = real rvald
assert. all uvalc = real rvalc
assert. -. 0 e. uvalc  NB. all units have been resolved
)
