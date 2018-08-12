NB. uuqty to replace uu

cocurrent 'uu'

QS=: '?'

uunew=: 3 : 0
uustr y
:
x uuqty y
)

uustr=: monad define
  NB. convert str: y to mks units
y_uu_=: y
'val unit'=. 2{. 'uustr'GATEqty y
'coeff code'=: qty4anyunit unit
NB.   z=. (val * coef1 % coef2) ; targ
NB. (": val * coeff) , SP , canon expandcode code
va=. val * coeff
un=. canon expandcode code
(ucode 8 u: un format va),SP,(ucode un)  NB. nuanced formatting
)

uuqty=: dyad define
  NB. convert qty: y to target units: x
'val unit iss'=. 'uuqty1'GATEqty y
targ=. 'uuqty2'GATEunits x
'coef1 codeu'=: qty4anyunit unit
'coef2 codet'=: qty4anyunit targ
va=. val * coef1 % coef2
NB. (ucode 8 u: un format va),SP,(ucode un)  NB. nuanced formatting
if. codeu -: codet do.
  z=. (ucode 8 u: targ format va) ; ucode targ
else.
  emsg '>>> uuboxed: incompatible units: (targ) || (unit)'
  i.0 0 return.
end.
if. iss do. str4qty z else. z end.
)

qty4str=: monad define
  NB. return qty defined by (str) y
y_uu_=: y
value=. ". SP taketo y
units=. SP takeafter y
value ; units
)

str4qty=: monad define
  NB. return str defined by (qty) y
(":0 pick y),SP,1 pick y
NB. >>>>> or use nb ?
)

GATEqty=: QS ddefine
  NB. GATEkeeper: validate y as qty
if. iss=.isStr ,y do. y=. qty4str y end.
assert. isBoxed y
assert. 2 -: #y
'value units' =. y
assert. isNo value
assert. isStr ,units
msg'+++ GATEqty[x]: value=(value) units=(units)'	NB. GATEqty: arg=(y)'
value ; units ; iss
)

NB. GATEstr=: QS ddefine
NB.   NB. GATEkeeper: validate y as str
NB. 2{. x GATEqty qty4str y
NB. )

GATEunits=: QS ddefine
  NB. GATEkeeper: validate y as bona-fide units
y return.
assert. isStr y
msg'+++ GATEunits[x]: arg=(y)'
y
)
