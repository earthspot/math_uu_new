	NB. uu - uu_interface.ijs
'==================== [uu] uu_interface ===================='

cocurrent 'uu'

uuengine=: 3 : 0
  NB. UU keyhole interface: (string) y is an instruction.
  NB. Pass-thru CAL instructions are identical to these.
  NB. Lowercase instructions change the state of UU
  NB. Uppercase instructions DO NOT change the state.
arg=. dltb '>' taketo 4}.y
targ=. dltb '>' takeafter y
numarg=. {.0". arg
select. 4{.y
case. 'CPAT' do. NB. are 2 units compatible?
		targ compatible arg
case. 'CPLI' do. NB. list of compatible units
		compatlist arg
case. 'CNVJ' do. NB. cut a cunit (eg: '/kg^3')
		cnvj arg
case. 'CONV' do. NB. convert
		convert arg
case. 'CONS' do. NB. cut "cons" formatted string (c/f UUC)
		0&udat arg
case. 'DUMB' do. NB. cut "dumb" formatted string (c/f UUC)
		udumb arg
case. 'FUNC' do. NB. cut "func" formatted string (c/f UUC)
		1&udat arg
case. 'FMTI' do. NB. format string-qty
		formatIN arg
case. 'FMTO' do. NB. format qty as output string
		formatOUT qty4str arg
case. 'QSCI' do. NB. query scientific notation threshold
		SCI
case. 'QSIC' do. NB. query SI-conformance level
		SIC
case. 'QSIG' do. NB. query significant figures
		SIG
case. 'QSIZ' do. NB. query zero attraction threshold
		SIZ
case. 'SCIN' do. NB. numarg --> (string) scientific notation
		scino numarg
case. 'SELF' do. NB. self-cancel arg
		selfcanc arg
case. 'UCOD' do. NB. convert special symbols --> "goy"
		ucode arg
case. 'UCOS' do. NB. convert special symbols --> "goy" (not currency)
		ucods arg
case. 'UNUC' do. NB. un-convert "goy" special symbols --> "kosher"
		0&ucode arg
case. 'UDIV' do. NB. divide two units symbolically
		targ udiv arg
case. 'UNIF' do. NB. convert special symbols wrto SI-compliance level
		uniform arg
case. 'UUUU' do. NB. call LOCAL uu via a uuengine-instruction
		targ uu arg
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
case. 'fcty' do. NB. restore factory settings
		factory''
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
case.        do. '>>> uuengine: bad instruction: ';y
end.
NB. >>>>> NO CODE PAST THIS POINT: return values are waiting
)