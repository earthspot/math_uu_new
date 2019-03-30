	NB. uu - uu_interface.ijs
'==================== [uuengine] uu_interface ===================='

0 :0
Tuesday 19 March 2019  19:05:51
)

cocurrent 'uu'

uuengine=: 3 : 0
  NB. The primary interface to UU.
  NB. ALL usage of UU can be done via this "keyhole" engine.
  NB. (Pass-thru CAL instructions are identical to these.)
  NB. (string) y is a uuengine instruction.
  NB. …Lowercase instructions change the state of UU
  NB. …Uppercase instructions DO NOT change the state of UU
  NB.  but simply return information
if. isBoxed y do. y=. b2o y end.
uarg=. (0&uniform) arg=. dltb '>' taketo yy=. dltb 4}.y
utarg=. (0&uniform) targ=. dltb '>' takeafter y
numarg=. {.0". arg
select. 4{.y
case. 'CPAT' do. NB. are 2 units compatible?
		utarg compatible uarg
case. 'CPLI' do. NB. list of compatible units
		compatlist uarg
case. 'CNVJ' do. NB. cut a cunit, eg: '/km^3' --> 1;1000;(,'m');3
		cnvCunit uarg
case. 'CONV' do. NB. convert
		convert uarg
case. 'CONS' do. NB. cut "cons" formatted string (c/f UUC)
		0&udat arg
case. 'DISP' do. NB. displacement for units
		rdisplacement uarg	NB. <<<<<<<<<< rational
case. 'DUMB' do. NB. cut "dumb" formatted string (c/f UUC)
		udumb arg
case. 'FUNC' do. NB. cut "func" formatted string (c/f UUC)
		1&udat arg
case. 'FMTI' do. NB. format string-qty
		formatIN arg
case. 'FMTO' do. NB. format qty: arg as output string
		(bris unitsOf arg) format valueOf arg
case. 'QRAT' do. NB. query rational value saved by: uu
		UU_VALUE
case. 'QSCI' do. NB. query scientific notation threshold
		SCI
case. 'QSIC' do. NB. query SI-conformance level
		SIC
case. 'QSIG' do. NB. query significant figures
		SIG
case. 'QSIZ' do. NB. query zero attraction threshold
		SIZ
case. 'QZER' do. NB. query Boolean ZERO word
		ZERO
case. 'SCIN' do. NB. numarg --> (string) scientific notation
		scino numarg
case. 'SELF' do. NB. self-cancel units
		selfcanc uarg
case. 'UCOD' do. NB. convert special symbols --> "goy"
		ucode arg
case. 'UCOS' do. NB. convert special symbols --> "goy" (not currency)
		ucods arg
case. 'UNUC' do. NB. un-convert "goy" special symbols --> "kosher"
		uarg
case. 'UDIV' do. NB. divide two units symbolically
		utarg udiv uarg
case. 'UNIF' do. NB. convert special symbols wrto SI-compliance level
		uniform uarg
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
case. 'szer' do. NB. set Boolean ZERO word
		ZERO=: arg
case.        do. '>>> uuengine: bad instruction: ';y
end.
NB. >>>>> NO CODE PAST THIS POINT: return values are waiting
)