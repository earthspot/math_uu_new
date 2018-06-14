'==================== [uu] zfns.ijs ===================='
NB. IAC Tue 30 Jun 2015  03:27:32

cocurrent 'z'

  NB. These constants are used by all 3 addons: CAL, UU and TABULA
  NB. but they (re-) create them as well in case they run standalone
INVALID=: _.j_.
UNDEFINED=: _.

UNSET=: '<UNSET>'

NB. =========================================================
VERSION_uu_=: '<UNSET>'

  NB. get version# from manifest.ijs in TPATH (y)
  NB. If no fail, overrides value in current locale
getversion=: 3 : 0
try.
bad=. fread''
assert. -. bad -: z=. fread y,'manifest.ijs'
assert. 0< # z=. LF taketo 'VERSION' dropto z
".z 	NB. hopefully assigns VERSION
catch. end.
)

NB. =========================================================
TPATH_CONFIG_z_=: jpath '~config/'
TPATH_UU_z_=: whereami 'TPATH_UU_z_'
TPATH_UUC_z_=: TPATH_UU_z_ , 'uuc.ijs'
TPATH_UUF_z_=: TPATH_UU_z_ , 'uuf.ijs'

NB. =========================================================
NB. UU interface verbs.
NB. Usually these are aliased in the calling locale.
NB. But these are aliased in _z_ too, for test purposes

uu=: uu_uu_
uuc=: 3 : 'open TPATH_UUC'
uuf=: 3 : 'open TPATH_UUF'
uunicode=: uunicode_uu_