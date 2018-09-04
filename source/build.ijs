NB. uu - build
0 :0
Tuesday 4 September 2018  15:41:57
-
open BUILTFILE
)

NB. TO LOAD JUST THIS BUILTFILE:	fn⌘F9
NB. DITTO THEN RUN:		fnF9

smoutput '--- UU build: started'

HEADERFILE_z_=: '~Gituu/source/header.ijs'
BUILTFILE_z_=:  '~Gituu/uu.ijs'
NB. BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'

  NB. Modify header.ijs with current date written into it
HEADERFILE fappend~ LF,'AABUILT=: ',quote date''

  NB. build BUILTFILE
writesourcex_jp_ '~Gituu/source';BUILTFILE

smoutput '--- UU build: completed'
