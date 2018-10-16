	NB. uu - start.ijs
'==================== [uu] start ===================='

cocurrent 'uu'

DIAGNOSTICS=: 0	NB. y==0 sets msg=:sllog=:sesstrace=:empty

start=: 3 : 0
  NB. start the UU locale - which may be a numbered one.
  NB. Not only to be called on loading,
  NB.  but should be called by apps using UU whenever
  NB.  the constants library (UUC) has been changed.
  NB. But not needed if only the functions library (UUF) changed
ssw '+++ [uu] start: ENTERED. y=(y)'
if. isNo y do. SIC=: y end.
NB. traceverbs 'ON'  NB. enable diagnostics
NB. wd'msgs'
traceverbs 'OFF'  NB. disable diagnostics while caches are being built
sess=: empty  NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
factory''  NB. assigns: SCI SIC SIG SIZ
tpaths_validate''
VERSION=: getversion TPATH_UU
load TPATH_UUC
load TPATH_UUF
load TPATH_UUM
make_units''
  NB. …makes globals: cspel csymb units unitv uvalu uvald
make_unitc''
  NB. …makes global: unitc --based on pp_encoding
report_complex_nouns''  NB. NO NOUNS should be complex
traceverbs DIAGNOSTICS  NB. enable tracing if DIAGNOSTICS=1
sess=: sesstrace  NB. <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
NB. wd'msgs'
ssw '+++ [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy

NB. uuinit_z_=: 3 : 0
NB. ulo=. y conew 'uu'
NB. )

start''  NB. (FOR TESTS:) start _uu_ as its own instantiation.
