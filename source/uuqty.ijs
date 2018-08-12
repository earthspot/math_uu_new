NB. uuqty to replace uu

cocurrent 'uu'

uuqty=: dyad define
  NB. convert qty: y to target units: x
'val unit iss'=. GATEqty y
targ=. GATEunits x
'coef1 codeu'=: qty4anyunit unit
'coef2 codet'=: qty4anyunit targ
if. -. codeu -: codet do.
  ssw '>>> uuboxed: incompatible units: (targ) || (unit)'
  i.0 0 return.
else.
  z=. (val * coef1 % coef2) ; targ
end.
if. iss do. str4qty z else. z end.
)

qty4str=: monad define
  NB. return qty defined by (str) y
Z=: z=. 2 {. cutopen y
(".0 pick z) ; 1 pick z
)

str4qty=: monad define
  NB. return str defined by (qty) y
(":0 pick y),SP,1 pick y
NB. >>>>> or use nb ?
)

GATEqty=: 3 : 0
  NB. GATEkeeper: validate y as qty
if. iss=.isStr y do. y=. qty4str y end.
assert. isBoxed y
assert. 2 -: #y
'value units' =. y
assert. isNo value
assert. isStr units
ssw'+++ GATEqty: value=(value) units=(units)'	NB. GATEqty: arg=(y)'
value ; units ; iss
)

GATEunits=: 3 : 0
  NB. GATEkeeper: validate y as bona-fide units
y return.
assert. isStr y
ssw'+++ GATEunits: arg=(y)'
y
)
