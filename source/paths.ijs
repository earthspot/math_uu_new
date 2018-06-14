	NB. uu - paths.ijs
'==================== [z] paths.ijs ===================='

cocurrent 'z'

NB. UU definitive paths - kept in _z_

]TPATH_UU=: jpath'~addons/math/uu'
]TPATH_UUC=: TPATH_UU sl 'uuc.ijs'	NB. constants
]TPATH_UUF=: TPATH_UU sl 'uuf.ijs'	NB. functions
]TPATH_UUM=: TPATH_UU sl 'uum.ijs'	NB. conversns

NB. aliases in _z_

uu=: uu_uu_			NB. the "keyhole"
uuc=: 3 : 'open TPATH_UUC'		NB. TEST ONLY: view constants
uuf=: 3 : 'open TPATH_UUF'		NB. TEST ONLY: view functions
uum=: 3 : 'open TPATH_UUM'		NB. TEST ONLY: view conversns
uunicode=: uunicode_uu_		NB. unicode level for SI-units
