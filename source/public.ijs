	NB. uu - public.ijs
'==================== [uu] public ===================='

cocurrent 'uu'

public=: 3 : 0
  NB. Makes aliases to UU public verbs in CLIENT locale (y)
  NB. cocurrent CLIENT locale: run this verb with (locale) y
cocurrent y
adj=: adj_uu_
compatible=: compatible_uu_
compatlist=: compatlist_uu_
convert=: convert_uu_
cnvj=: cnvj_uu_
format=: format_uu_
scino=: scino_uu_
selfcanc=: selfcanc_uu_
sci=: sci_uu_
sig=: sig_uu_
startuu=: start_uu_
ucase=: ucase_uu_
udat=: udat_uu_
udiv=: udiv_uu_
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

