'==================== [uu] start.ijs ===================='

cocurrent 'uu'

  NB. set to smoutput for a rough'n'ready trace
sess=: empty
sess_umake=: empty


NB. ========================================================
  NB. start the addon: UU
  NB. Not only called on loading,
  NB. but can be called by apps using UU whenever
  NB. whenever the constants library (UUC) has been changed.
  NB. (Not needed when the functions library (UUF) changed)
start=: 3 : 0
load :: 0: TPATH_UU,'manifest.ijs'	NB. sets VERSION
load TPATH_UUC
load TPATH_UUF
umake''
)

NB. ========================================================

NB. UU self-starts on loading...
start''