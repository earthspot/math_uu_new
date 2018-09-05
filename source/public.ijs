	NB. uu - public.ijs
'==================== [uu] public ===================='

cocurrent 'uu'

0 :0
CAL used to need: ucode and ucods
but currently…
  ucode is unused
  ucods is called only by ct0_cal_
  ct_cal_=: ct1_cal_
-
---USE OF PUBLIC WORDS BY CAL Sunday 2 September 2018...
compatible	NOTUSED
compatlist	docompatlist compare incompat(combine) compat compat_i
convert		changeunits fexp1 fexp_nominal ttadl ttafl ttappend ttload
cnvj (cnvCunit)	scaleunits
format (formatOUT)	nfx
scino		NOTUSED
selfcanc		combine
setsci (sci)	NOTUSED	
setsig (sig)	NOTUSED
set_ucase		NOTUSED
sci		califace[QSCI,psci] (local sci uses SCI)
sig		califace[QSIG,prec] (local sig uses SIG) ttsav
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

NB. public=: 3 : 0
NB.   NB. Makes aliases to UU public verbs in CLIENT locale (y)
NB.   NB. cocurrent CLIENT locale: run this verb with (locale) y
NB. cocurrent y
NB. compatible=: compatible_uu_
NB. compatlist=: compatlist_uu_
NB. convert=: convert_uu_
NB. cnvj=: cnvCunit_uu_	NB. STILL NEEDED?
NB. format=: formatOUT_uu_
NB. scino=: scino_uu_
NB. selfcanc=: selfcanc_uu_
NB. setsci=: sci_uu_
NB. setsig=: sig_uu_
NB. set_ucase=: ucase_uu_
NB. sci=: sci_uu_
NB. sig=: sig_uu_
NB. startuu=: start_uu_
NB. ucase=: ucase_uu_
NB. udat=: udat_uu_
NB. udiv=: udiv_uu_		NB. STILL NEEDED?
NB. udumb=: udumb_uu_
NB. uniform=: uniform_uu_
NB. uurowsc=: uurowsc_uu_
NB. uurowsf=: uurowsf_uu_
NB. i.0 0
NB. )

isQty=: 0:	NB. DUMMY FOR NOW <<<<<<<<<<<<<<<<<<<<<<<

uuengine=: 3 : 0
  NB. keyhole interface to UU, (string) y is instruction
  NB. pass-thru CAL instructions are identical
if. isQty y do.  NB. DEVELOP THIS <<<<<<<<<<<<<<<<<<<<<<<
  cmnd=. 'uuuu'
  arg=. ": narg=. 1 pick y
else.
  narg=. {.0". arg=. 4}.y
  cmnd=. 4{.y
end.
select. cmnd
case. 'QSCI' do. NB. query scientific notation threshold
		sci''
case. 'QSIC' do. NB. query SI-conformance level
		sic''
case. 'QSIG' do. NB. query significant figures
		sig''
case. 'VUUC' do. NB. LF-separated contents of UUC
		x2f UUC
case. 'VUUF' do. NB. LF-separated contents of UUF
		x2f UUF
case. 'VUUM' do. NB. LF-separated contents of UUM
		x2f UUM
case. 'ssci' do. NB. set scientific notation threshold
		sci narg
fcase.'sicl' do. NB. set SI-conformance level (heritage)
case. 'ssic' do. NB. set SI-conformance level
		sic narg
case. 'ssig' do. NB. set significant figures
		sig narg
case. 'suuz' do. NB. reset uu_z_ and uuengine_z_ to LOCAL uu
		uu_z_=: uu
		uuengine_z_=: uuengine
case. 'uuuu' do. NB. call LOCAL uu via a uuengine-instruction
		(dltb '>' takeafter arg) uu (dltb '>' taketo arg)
		NB. ;/arg cutByPattern '* > *' NB.WONT WORK!
case.        do. '>>> uuengine: bad y-arg';y
end.
)
