NB. uu - build
0 :0
Monday 6 August 2018  16:28:44
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILDFILE:	fn⌘F9	-build only
NB. DITTO + RUN IT AFTERWARDS:	fnF9	-build and run

smoutput '--- build: started'

NOW=: date''
HEADERFILE_z_=: '~Gituu/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'	NB. '~Gituu/uu.ijs'

RB=: ')'

  NB. Re-create header.ijs with current date written into it
ferase HEADERFILE
HEADERFILE fappend~ sw 0 :0
0 :0
(NOW)
-
UU: scientific units conversion package
(RB)

clear 'uu'	NB. >>>>> DELETE THIS LINE IN RELEASED ADDON
coclass 'uu'
AABUILT=: '(NOW)'
)

  NB. build BUILTFILE
writesourcex_jp_ '~Gituu/source';BUILTFILE

smoutput '--- build: completed'
