	NB. uu - start.ijs
'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0
  NB. start the locale: _uu_
  NB. Not only intended to be called on loading,
  NB. but can be called by apps using UU
  NB. whenever constants library (UUC) has been changed.
  NB. (start'' not needed when the functions library (UUF) changed)
wd'msgs' [ msg '+++ start: ENTERED'
make_msg 0	NB. disable diagnostics
erase 'DIVIDER'
if. -.fexist TPATH_UUC do.
  smoutput z=.'>>> start: file not found: ',TPATH_UUC
  z return.
end.
factory''
badversion=. 'v.v.v'"_
]VERSION=: getversion :: ('v.v.v'"_) TPATH_UU
load :: 0: TPATH_UUC
load :: 0: TPATH_UUF
load :: 0: TPATH_UUM
make_units''
cx''	NB. check if any noun has become complex
STARTED=: 1	NB. enable in-script test-verbs
make_msg 1	NB. enable diagnostics
wd'msgs' [ msg '--- start: EXITS'
)

start''
