	NB. uu - start.ijs
'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0
ME=: <'start'
  NB. start the locale: _uu_
  NB. Not only intended to be called on loading,
  NB. but can be called by apps using UU
  NB. whenever constants library (UUC) has been changed.
  NB. (start'' not needed when the functions library (UUF) changed)
TRACEVERBS=: ;:'start qty4i qty4anyunit qty4bareunit'
make_msg 1	NB. enable diagnostics
wd'msgs' [ msg '+++ start: ENTERED'
0 make_msg 0	NB. disable diagnostics while caches are being built
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
  NB. Make the NOMINAL UNITS table: units
make_units''
  NB. Make (NEW): unitc based on pp_encoding
make_unitc''  NB. 1st pass -inits uvalc and unitc
NB. 2 make_unitc''  NB. 2nd pass
NB. 3 make_unitc''  NB. 3rd pass
report_complex_nouns''  NB. NO NOUNS should be complex
  NB. Enable inline test-verbs (in main.ijs)…
STARTED=: 1
  NB. …such verbs only act if the script is loaded
  NB. once verb: start has been run.
make_msg 1	NB. enable diagnostics
wd'msgs' [ msg '--- start: EXITS'
)

start''
