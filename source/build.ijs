NB. uu - build.ijs

HEADERFILE_z_=: '~Gituu/source/header.ijs'
BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'	NB. '~Gituu/uu.ijs'

RB=: ')'

ferase HEADERFILE
HEADERFILE fappend~ sw 0 :0
0 :0
(date'')
-
UU: scientific units conversion package
(RB)

clear 'uu'
coclass 'uu'
)

writesourcex_jp_ '~Gituu/source';BUILTFILE

0 :0
open BUILTFILE
)