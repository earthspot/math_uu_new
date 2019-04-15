	NB. uu - start.ijs
'==================== [uu] start ===================='
0 :0
Saturday 13 April 2019  18:48:04
)

cocurrent 'uu'

VERSION=: '0.0.0'  NB. overridden by: manifest.ijs

DIAGNOSTICS=: 0	NB. y==0 sets msg=:sllog=:empty

CAPPED=: 40  NB. capped digits in a rational number

start=: 3 : 0
  NB. start the UU locale - which may be a numbered one.
  NB. y== (if not empty) is SI conformance level to commence with.
  NB. Not only to be called on loading,
  NB.  but should be called by apps using UU whenever
  NB.  the constants library (UUC) has been changed.
  NB. But not needed if only the functions library (UUF) changed
trace DIAGNOSTICS  NB. enable tracing if DIAGNOSTICS=1
msg '+++ [uu] start: ENTERED. y=(y)'
  NB. Create the TP*_z_ nouns (the JAL addon lacks tpathdev)
if. fexist p=. (pathof CREATOR) sl 'tpathdev.ijs' do. load p
else.     load (pathof CREATOR) sl 'tpathjal.ijs'
end.
load TPMU sl 'manifest.ijs'  NB. to get VERSION
  NB. erase unwanted globals loaded by manifest
erase'CAPTION FILES DESCRIPTION RELEASE FOLDER LABCATEGORY PLATFORMS'
  NB. build work vars
trace 0  NB. disable diagnostics while caches are being built
factory''  NB. assigns: SCI SIC SIG SIZ ZERO
if. isNo y do. SIC=: y end.
  NB. Make pseudoconstants for this numbered locale
RT2_z_=:   CAPPED s4x REF_RT2
EXP_z_=:   CAPPED s4x REF_EXP
PI_z_=:    CAPPED s4x REF_PI
PI2_z_=:   PI * 2
PI4_z_=:   PI * 4
PIb2_z_=:  PI * 1r2
PIb3_z_=:  PI * 1r3
PIb4_z_=:  PI * 1r4
PI4b3_z_=: PI * 4r3
  NB. Make the working tables
load TPUC sl 'uuc.ijs'
load TPUF sl 'uuf.ijs'
load TPUM sl 'uum.ijs'
make_units''  NB. globals: cspel csymb units unitv uvald rvald uvalu rvalu
make_unitc''  NB. global: unitc uvalc rvalc
rat_check''   NB. …verifies integrity of rational caches
report_complex_nouns''  NB. NO NOUNS should be complex
trace DIAGNOSTICS  NB. re-enable tracing if DIAGNOSTICS=1
msg '--- [uu] start: COMPLETED.'
)

create=: start
destroy=: codestroy

runlab_z_=: runlab_uu_ 	NB. for: runlab''
uu_z_=: uu_uu_		NB. for: runlab''
blink=: empty		NB. activate with: op'blink'

0 :0
uuinit_z_=: 3 : 0
ulo=. y conew 'uu'
)

start''  NB. (FOR TESTS:) onload: start _uu_ as its own instantiation.
