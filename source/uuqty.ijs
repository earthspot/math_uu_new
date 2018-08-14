@@NOW MERGED WITH pp_encoding.ijs
NB. uuqty to replace uu   [snapshotted in temp 6, Monday 13 August 2018  22:57:34]
	NB. uu - uuqty.ijs
'==================== [uu] uuqty.ijs.ijs ===================='
cocurrent 'uu'

test=: 3 : 0
  NB. handles F5 for quick testing
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
