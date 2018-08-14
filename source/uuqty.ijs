NB. uuqty to replace uu   [snapshotted in temp 6, Monday 13 August 2018  22:57:34]
	NB. uu - uuqty.ijs
'==================== [uu] uuqty.ijs.ijs ===================='
cocurrent 'uu'

NB. 'unsc c fy'=. convert uns
NB. fx=. > {: convert ux
NB. qty=. (fy%fx) * ('_',uns) adj val
NB. uno=. uniform x
NB. 	sllog 'uuboxed__ fy fx uno ux'
NB. z=. (ux adj qty) ; uno

test=: 3 : 0
smclear''
sm        uu '100 degC'
sm        uu '212 degF'
sm        uu '373.15 K'
sm 'degF' uu '100 degC'
sm 'degC' uu '212 degF'
sm 'degF' uu '212 degF'
sm 'degC' uu '100 degC'
)

uunew=: 3 : 0
  NB. MONAD: convert str: y (e.g. '212 degF') to mks units
ME=: <'uunew'
y_uu_=: y
val=. ". SP taketo y -. '°'
unit=. SP takeafter y
'coeff code'=. qtcode4anyunit unit
targ=. canon expandcode code  NB. infer target units from: code
NB. va=. targ adj  coeff * ('_',unit) adj val
va=. coeff * ('_',unit) adj val
   sllog 'uunewMONAD__ val unit targ coeff code va'
(ucode 8 u: targ format va),SP,(ucode uniform targ)
:
  NB. DYAD: convert str: y (e.g. '212 degF') to target units (x)
ME=: <'uunew'
x_uu_=: x [y_uu_=: y
val=. ". SP taketo y -. '°'
unit=. SP takeafter y
targ=. bris x  NB. ensure x is kosher format: 'm/s^2' NOT 'm s⁻²'
'coeft codet'=. qtcode4anyunit targ
'coefu codeu'=. qtcode4anyunit unit
coeff=. coefu % coeft
va=. coeff * ('_',unit) adj val
   sllog 'uunewDYAD__ val unit targ coefu codeu coeft codet va'
if. codeu -: codet do.
  (ucode 8 u: targ format va),SP,(ucode uniform targ)
else.
  emsg '>>> uunew: incompatible units: (x) || (unit)'
  '' return.
end.
)

NB. qty4str=: monad define
NB.   NB. return qty defined by (str) y
NB. y_uu_=: y
NB. value=. ". SP taketo y
NB. units=. SP takeafter y
NB. value ; units
NB. )
NB.
NB. str4qty=: monad define
NB.   NB. return str defined by (qty) y
NB. (":0 pick y),SP,1 pick y
NB. NB. >>>>> or use nb ?
NB. )

NB. GATEqty=: '' ddefine
NB.   NB. GATEkeeper: validate y as qty
NB. if. iss=.isStr ,y do. y=. qty4str y end.
NB. assert. isBoxed y
NB. assert. 2 -: #y
NB. 'value units' =. y
NB. assert. isNo value
NB. assert. isStr ,units
NB. msg'+++ GATEqty[x]: value=(value) units=(units)'	NB. GATEqty: arg=(y)'
NB. value ; units ; iss
NB. )

NB. GATEstr=: '' ddefine
NB.   NB. GATEkeeper: validate y as str
NB. 2{. x GATEqty qty4str y
NB. )

NB. GATEunits=: '' ddefine
NB.   NB. GATEkeeper: validate y as bona-fide units
NB. y return.
NB. assert. isStr y
NB. msg'+++ GATEunits[x]: arg=(y)'
NB. y
NB. )
