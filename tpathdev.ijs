NB. tpathdev.ijs - defines symbolic paths for UU
NB. DEVELOPMENT (GitHub) VERSION
0 :0
Saturday 13 April 2019  18:29:02
)

cocurrent 'z'

TPPP=: sort 2}. >cutopen 0 : 0
Name	Owner	Points to…
====	=====	=========
TPAR	CAL 	t-table archive
TPAT	TAB 	patch.ijs
TPCA	TAB 	cal.ijs
TPCL	CAL 	cal_log.txt
TPMC	CAL 	manifest in CAL
TPMT	TAB 	manifest in TABULA
TPMU	UU  	manifest in UU
TPNG	TAB 	toolbar png
TPSA	CAL 	SAMPLE*s (-:TPCA)
TPTA	TAB 	tabula.ijs
TPTT	CAL 	t-table library
TPUC	UU  	uuc.ijs
TPUF	UU  	uuf.ijs
TPUM	UU  	uum.ijs
TPUT	TAB 	usertools.ijs
TPUU	CAL  	uu.ijs
)

TPUU=: jpath'~Gituu'                   NB. path to UU build
TPMU=: TPUU                            NB. manifest in UU
TPUC=: TPUU                            NB. uuc.ijs
TPUF=: TPUU                            NB. uuf.ijs
TPUM=: TPUU                            NB. uum.ijs
