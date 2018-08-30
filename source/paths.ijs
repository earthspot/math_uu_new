	NB. uu - paths.ijs
'==================== [z] paths.ijs ===================='

cocurrent 'z'

sl=: 4 : 0
  NB. RELIABLE path catenator
  NB. IAC Thursday 30 August 2018  16:42:51
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

tpaths_validate=: 3 : 0
assert. fexist TPATH_UU
assert. fexist TPATH_UUC
assert. fexist TPATH_UUF
assert. fexist TPATH_UUM
i.0 0
)

NB. UU definitive paths - kept in _z_

NB. ]TPATH_UU=: jpath'~addons/math/uu'  NB. >>>>> NO! UNDER DEVELOPMENT USE:
]TPATH_UU=: jpath'~Gituu'
]TPATH_UUC=: TPATH_UU sl 'uuc.ijs'	NB. constants
]TPATH_UUF=: TPATH_UU sl 'uuf.ijs'	NB. functions
]TPATH_UUM=: TPATH_UU sl 'uum.ijs'	NB. conversns

NB. TEST ONLY: utilities
uuc=: 3 : 'openFolder TPATH_UUC'		NB. view constants
uuf=: 3 : 'openFolder TPATH_UUF'		NB. view functions
uum=: 3 : 'openFolder TPATH_UUM'		NB. view conversns

tpaths_validate''