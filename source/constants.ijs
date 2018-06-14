	NB. uu - constants.ijs
'==================== [uu] constants ===================='

cocurrent 'uu'

  NB. ONLY SCI and SIG reside in z-locale
  NB. Addon uu owns SCI_z_ and SIG_z_
  NB. Other addons shouldn't access these globals directly
  NB. (---then why are they in z-locale???)

  NB. currency exchange-rate tables, used by: quoted
  NB. quoted currencies are expressed in terms of the Euro.
  NB. if net is accessible, CUTAB to be updated from Eurobank figures
CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'	NB. initial short table
CUTAB=: CUTAB0			NB. pre-start value

HD=: '·'		NB. hi-dot, optional SI convention
INVALID=: _.j_.
NOTFOUND=: _1	NB. used by: cnvf cnvv
NUN=: '??'	NB. unrecognised-units placeholder, used by: convert
PWM=: '^-'	NB. power,minus (precedes a negative power)
PW=: '^'		NB. power
SL=: '/'
SP=: ' '
UL=: '_'
UNDEFINED=: _.	NB. should propagate in a formula

  NB. UNICODE
  NB. controls SI-compliance via utf-8 chars
  NB. get/set value externally via: ucode_uu_
  NB. UNICODE=0	units expressed entirely in ASCII
  NB. UNICODE=1	utf-8s e.g. Å but inverse shown as: /Å
  NB. UNICODE=2	utf-8, no '/'
  NB. UNICODE=3	utf-8, no '/', uses '·'

factory=: 3 : 0
  NB. init/restore factory settings of alterable globals
  NB. ONLY SCI and SIG reside in z-locale
SIG_z_=: 3	NB. used by: scino_z_ and format_sig
SCI_z_=: 5	NB. used by: scino_z_
UNICODE=: 1	NB. Used chiefly by: ucode
MAXLOOP=: 30	NB. limits: convert
UCASE=: 0  	NB. Used only by set_ucase, ssmx for case-insensitive UUC/F search
)

  NB. data table stubs for basic testing
UUC=: cmx 0 : 0
1 /	[saved]	Saturday 9 June 2018  05:16:54
1 m	[m]	fundamental unit - metre (distance)
1 kg	[kg]	fundamental unit - kilogramme (mass)
1 s	[s]	fundamental unit - second (time)
)

UUF=: cmx 0 : 0
PI*r*r : r(m)		[m^2]	area of circle
sin a ; a(rad)		[/]	sine
cos a ; a(rad)		[/]	cosine
tan a ; a(rad)		[/]	tangent
)

UUM=: ''

  NB. the primitive SI-units (+ extra "honorary" primitive units)
mks=: ;:'m kg s A K cd mol rad eur'
NB. mks=: mks,<'item'
NB. mks=: mks , (<'item'),each ":each i.10  NB. append "units": item0 … item9
