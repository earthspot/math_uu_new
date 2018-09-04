	NB. uu - start.ijs
'==================== [uu] start ===================='

cocurrent 'uu'

start=: 3 : 0
  NB. start the locale: _uu_
  NB. Not only to be called on loading,
  NB. but should be called by apps using UU
  NB. whenever constants library (UUC) has been changed
  NB. but not needed if only UUF (the functions library) changed
ssw '+++ start: ENTERED. y=(y)'
if. isNo y do. UNICODE=: y end.
NB. make_msg 1  NB. enable diagnostics
NB. trv 0
NB. trv '+start'
NB. wd'msgs'
0 make_msg 0  NB. disable diagnostics while caches are being built
factory''  NB. assigns: DIAGNOSTICS ME SCI SIG UCASE UNICODE 
tpaths_validate''
VERSION=: getversion TPATH_UU
load TPATH_UUC
load TPATH_UUF
load TPATH_UUM
make_units''
  NB. …makes globals: cspel csymb units unitv uvalu unitx uvalx compat
make_unitc''
  NB. …makes global: unitc --based on pp_encoding
report_complex_nouns''  NB. NO NOUNS should be complex
make_msg DIAGNOSTICS  NB. enable diagnostics
NB. wd'msgs'
)

create=: start
destroy=: codestroy

uuinit_z_=: 3 : 0
UU_LOC_z_=: y conew 'uu'
NB. uu_z_=: uu__UU_LOC
)