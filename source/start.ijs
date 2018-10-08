	NB. uu - start.ijs
'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0
  NB. start the UU locale - which may be a numbered one.
  NB. Not only to be called on loading,
  NB.  but should be called by apps using UU whenever
  NB.  the constants library (UUC) has been changed.
  NB. But not needed if only the functions library (UUF) changed
ssw '+++ [uu] start: ENTERED. y=(y)'
if. isNo y do. SIC=: y end.
NB. make_msg 1  NB. enable diagnostics
NB. trv 0
NB. trv '+start'
NB. wd'msgs'
0 make_msg 0  NB. disable diagnostics while caches are being built
factory''  NB. assigns: DIAGNOSTICS ME SCI SIC SIG SIZ
tpaths_validate''
VERSION=: getversion TPATH_UU
load TPATH_UUC
load TPATH_UUF
load TPATH_UUM
make_units''
  NB. …makes globals: cspel csymb units unitv uvalu unitx uvalx
make_unitc''
  NB. …makes global: unitc --based on pp_encoding
report_complex_nouns''  NB. NO NOUNS should be complex
make_msg DIAGNOSTICS  NB. enable diagnostics
NB. wd'msgs'
ssw '+++ [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy

NB. uuinit_z_=: 3 : 0
NB. ulo=. y conew 'uu'
NB. )

start''  NB. (FOR TESTS:) start _uu_ itself as its own instantiation.
