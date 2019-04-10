	NB. uu - start.ijs
'==================== [uu] start ===================='
0 :0
Wednesday 10 April 2019  06:26:39
)

cocurrent 'uu'

VERSION=: '<UNSET>'

DIAGNOSTICS=: 0	NB. y==0 sets msg=:sllog=:empty

start=: 3 : 0
  NB. start the UU locale - which may be a numbered one.
  NB. Not only to be called on loading,
  NB.  but should be called by apps using UU whenever
  NB.  the constants library (UUC) has been changed.
  NB. But not needed if only the functions library (UUF) changed
trace DIAGNOSTICS  NB. enable tracing if DIAGNOSTICS=1
msg '+++ [uu] start: ENTERED. y=(y)'
if. isNo y do. SIC=: y end.
trace 0  NB. disable diagnostics while caches are being built
factory''  NB. assigns: SCI SIC SIG SIZ ZERO
load 'uu' sister 'uuc'
load 'uu' sister 'uuf'
load 'uu' sister 'uum'
load 'uu' sister 'manifest'
erase'CAPTION FILES DESCRIPTION RELEASE FOLDER LABCATEGORY PLATFORMS'
make_units''  NB. globals: cspel csymb units unitv uvald rvald uvalu rvalu
make_unitc''  NB. global: unitc uvalc rvalc
rat_check''   NB. …verifies integrity of rational caches
report_complex_nouns''  NB. NO NOUNS should be complex
trace DIAGNOSTICS  NB. re-enable tracing if DIAGNOSTICS=1
msg '--- [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy

runlab_z_=: runlab_uu_  NB. for: runlab''
uu_z_=: uu_uu_  NB. for: runlab''
blink=: empty	NB. activate with: op'blink'

NB. uuinit_z_=: 3 : 0
NB. ulo=. y conew 'uu'
NB. )

start''  NB. (FOR TESTS:) onload: start _uu_ as its own instantiation.
