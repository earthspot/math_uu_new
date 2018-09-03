NB. uu - build
0 :0
Monday 3 September 2018  00:44:42
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- UU build: started'

NOW=: date''
HEADERFILE_z_=: '~Gituu/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'	NB. '~Gituu/uu.ijs'

RB=: ')'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote NOW

  NB. build BUILTFILE
writesourcex_jp_ '~Gituu/source';BUILTFILE

smoutput '--- UU build: completed'
