'==================== [uu] init.ijs ===================='
NB. UU: scientific units conversion package
NB. IAC Fri 3 Jul 2015  06:34:28

coclass 'uu'

public=: 3 : 0
NB. Makes aliases to UU public verbs in locale (y)
cocurrent y
adj=: adj_uu_
compat=: compatible_uu_
compatlist=: compatlist_uu_
convert=: convert_uu_
cnvj=: cnvj_uu_
format=: format_uu_
scino=: scino_uu_
selfcanc=: selfcanc_uu_
setsci=: setsci_uu_
setsig=: setsig_uu_
set_ucase=: set_ucase_uu_
sci=: sci_uu_
sig=: sig_uu_
startuu=: start_uu_
ucode=: ucode_uu_
ucods=: ucods_uu_
udat=: udat_uu_
udiv=: udiv_uu_
udumb=: udumb_uu_
uurowsc=: uurowsc_uu_
uurowsf=: uurowsf_uu_
i.0 0
)

NB. ========== GLOBALS ==========


NB. NOTE=: <;._1 ' C C# D D# E F F# G G# A A# B C'
NOTFOUND=: _1
NUN=: '??'	NB. unrecognised-units placeholder, used by: convert
SL=: '/'
SP=: ' '
mks=: ;:'m kg s A K cd mol rad eur'  NB. primitive SI-units
SIG_z_=: 3	NB. number of significant figs to show
SCI_z_=: 1e5	NB. value at which sci notation cuts-in
UNICODE=: 1	NB. Used chiefly by: ucode
MAXLOOP=: 30	NB. limits: convert
UCASE=: 0	NB. =:1 for case-insensitive ssmx

	NB. currency exchange-rate tables, used by: quoted
	NB. quoted currencies are expressed in terms of the Euro.
	NB. if net is accessible, CUTAB to be updated from Eurobank figures
CUTAB0=: 2 2$<;._1 ' USD 1.3 GBP 0.8'	NB. initial short table
CUTAB=: CUTAB0			NB. pre-start value


NB. ========== UTILITIES ==========

all=: *./
and=: *.
any=: +./
brack=:	1 |. '][' , ":  NB. layout tool for message string ->'[y]'
cmx=: [: > <;._2	NB. expects trailing LF
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>	 NB. embed nums in string
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~	NB. eg: 3 to 5 <--> 3 4 5

cx=: 3 : 0
	NB. check for complex nouns in given locale
loc=. >coname''
nocomplex=. 1
for_no. (nl 0) -. <'INVALID' do.  val=. ".nom=. >no
  if. 16=3!:0 val do.
    smoutput nb 'cx:' ; nom ; 'is complex'
    nocomplex=. 0
  end.
end.
NB. Suppress ok-confirmation...
NB. if. nocomplex do. smoutput 'cx: no nouns are complex in: ',loc end.
i.0 0
)

undefined=: (3 : 0)"0
	NB. test for presence of UNDEFINED
if. -. 128!:5 y do. 0 return. end.
'_.' -: 5!:6 <'y'
)

invalid=: (3 : 0)"0
	NB. test for presence of INVALID
if. -. 128!:5 y do. 0 return. end.
'_.j_.' -: 5!:6 <'y'
)

quoted=: 3 : 0
	NB. =1 iff (y) is a quoted currency
(<toupper y) e. {."1 CUTAB
)
