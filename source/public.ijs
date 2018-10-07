	NB. uu - public.ijs
'==================== [uu] public ===================='

cocurrent 'uu'

0 :0
========================================================
>>> REPLACE ALL THESE WITH CALLS OF: uuengine (below)...
========================================================
CAL used to need: ucode and ucods
but currently…
  ucode is unused
  ucods is called only by ct0_cal_
  ct_cal_=: ct1_cal_
-
---USE OF PUBLIC WORDS BY CAL Sunday 2 September 2018...
compatible	incompat(combine) compat
compatlist	docompatlist compare incompat(combine) compat compat_i
convert		changeunits fexp1 fexp_nominal ttadl ttafl ttappend ttload
cnvj (cnvCunit)	scaleunits
format (formatOUT)	nfx
scino		NOTUSED
selfcanc		combine
startuu		NOTUSED
ucase		NOTUSED …is TABULA accessing UU directly?
udat		ttauc ttauf
udiv		combine fnline
udumb		ttauc
uniform		ct1 docompatlist
uurowsc		NOTUSED
uurowsf		NOTUSED
UUC_uu_		califace[VUUC]
UUF_uu_		califace[VUUF]
ucods_uu_		ct0
adj (placeholder)	getvalue setvalue
  getvalue	califace[VALU] plotv
  setvalue	califace[...] plotxSwift plotx plotz setvunits
---TO DO:
	suffix all these with: _uu ?
	elim NOTUSED from UU
	elim direct use of _uu_
	see if any can be avoided
	consider a keyhole: uuengine (adverb if any dyadic)
	restore adj_uu_ -but base it on format* or its ancillaries
)


uuengine=: 3 : 0
  NB. keyhole interface to UU, (string) y is instruction
  NB. BUT… can y be a "quantity" (for: uuuu)? <<<<<<<<<<<
  NB. pass-thru CAL instructions are identical
arg=. dltb '>' taketo 4}.y
targ=. dltb '>' takeafter y
numarg=. {.0". arg
select. 4{.y
case. 'CPAT' do. NB. are 2 units compatible?
		targ compatible arg
case. 'CPTU' do. NB. list of compatible units
		compatlist arg
case. 'QSCI' do. NB. query scientific notation threshold
		SCI
case. 'QSIC' do. NB. query SI-conformance level
		SIC
case. 'QSIG' do. NB. query significant figures
		SIG
case. 'QSIZ' do. NB. query zero attraction threshold
		SIZ
case. 'VUUC' do. NB. LF-separated contents of UUC
		x2f 0 uurowsc arg
case. 'VUUF' do. NB. LF-separated contents of UUF
		x2f 0 uurowsf arg
case. 'VUUM' do. NB. LF-separated contents of UUM
		x2f UUM
case. 'WUUC' do. NB. LF-separated contents of UUC
		x2f 1 uurowsc arg
case. 'WUUF' do. NB. LF-separated contents of UUF
		x2f 1 uurowsf arg
case. 'WUUM' do. NB. LF-separated contents of UUM
		x2f UUM
case. 'conv' do. NB. convert
		targ convert 1;arg
case. 'cons' do. NB. cut "cons" formatted string (c/f UUC)
		0&udat arg
case. 'dumb' do. NB. cut "dumb" formatted string (c/f UUC)
		udumb arg
case. 'func' do. NB. cut "func" formatted string (c/f UUC)
		1&udat arg
case. 'fcty' do. NB. factory settings of alterable globals
		factory''
case. 'fmtI' do. NB. format input string as qty
		formatIN arg
case. 'fmtO' do. NB. format qty as output string
		formatOUT qty4str arg
case. 'scin' do. NB. numarg --> (string) scientific notation
		scino numarg
case. 'self' do. NB. self-cancel arg
		selfcanc arg
case. 'ssci' do. NB. set scientific notation threshold
		SCI=: numarg
case. 'ssic' do. NB. set SI-conformance level
		SIC=: numarg
case. 'ssig' do. NB. set significant figures
		SIG=: numarg
case. 'ssiz' do. NB. set zero attraction threshold
		SIZ=: numarg
case. 'strt' do. NB. restart this instance of UU
		start''
NB. case. 'suuz' do. NB. reset uu_z_ and uuengine_z_ to LOCAL uu
NB. 		uu_z_=: uu
NB. 		uuengine_z_=: uuengine
case. 'ucod' do. NB. convert special symbols --> "goy"
		ucode arg
case. 'ucos' do. NB. convert special symbols --> "goy" (not currency)
		ucods arg
case. 'unuc' do. NB. un-convert "goy" special symbols --> "kosher"
		0&ucode arg
case. 'udiv' do. NB. divide two units symbolically
		targ udiv arg
case. 'unif' do. NB. convert special symbols wrto SI-compliance level
		uniform arg
case. 'uuuu' do. NB. call LOCAL uu via a uuengine-instruction
		targ uu arg
case.        do. '>>> uuengine: bad y-arg';y
end.
NB. >>>>> NO CODE PAST THIS POINT: return values are waiting
)

qty4str=: 3 : 0
  NB. return qty represented by (string) y
  NB. >>> CONSIDER making this like: make_units
val=. eval strValueOf y
uni=. dltb SP takeafter y
val ; uni
)