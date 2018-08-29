	NB. uu - public.ijs
'==================== [uu] public ===================='

cocurrent 'uu'

0 :0
CAL used to need: ucode and ucods
but currently…
  ucode is unused
  ucods is called only by ct0_cal_
  ct_cal_=: ct1_cal_
)

public=: 3 : 0
  NB. Makes aliases to UU public verbs in CLIENT locale (y)
  NB. cocurrent CLIENT locale: run this verb with (locale) y
cocurrent y
compatible=: compatible_uu_
compatlist=: compatlist_uu_
convert=: convert_uu_
cnvj=: cnvCunit_uu_	NB. STILL NEEDED?
format=: formatOUT_uu_
scino=: scino_uu_
selfcanc=: selfcanc_uu_
setsci=: sci_uu_
setsig=: sig_uu_
set_ucase=: ucase_uu_
sci=: sci_uu_
sig=: sig_uu_
startuu=: start_uu_
ucase=: ucase_uu_
udat=: udat_uu_
udiv=: udiv_uu_		NB. STILL NEEDED?
udumb=: udumb_uu_
uniform=: uniform_uu_
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_
i.0 0
)

  NB. public_uu_ -is not intended for making aliases in _z_
  NB. Of all _uu_ verbs, only these should have aliases in _z_
uunicode_z_=: uunicode_uu_		NB. test/set unicode level for UU output
uu_z_=: uu_uu_			NB. the "keyhole" (for manual use)

