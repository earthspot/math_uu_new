	NB. uu - paths.ijs
'==================== [z] paths.ijs ===================='

cocurrent 'z'

NB. UU definitive paths - kept in _z_

]TPATH_UU=: jpath'~addons/math/uu'
]TPATH_UUC=: TPATH_UU sl 'uuc.ijs'	NB. constants
]TPATH_UUF=: TPATH_UU sl 'uuf.ijs'	NB. functions
]TPATH_UUM=: TPATH_UU sl 'uum.ijs'	NB. conversns

NB. TEST ONLY: utilities
uuc=: 3 : 'open TPATH_UUC'		NB. view constants
uuf=: 3 : 'open TPATH_UUF'		NB. view functions
uum=: 3 : 'open TPATH_UUM'		NB. view conversns
