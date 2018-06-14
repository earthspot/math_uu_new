NB. uu - run

BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'	NB. '~Gituu/uu.ijs'

load BUILTFILE	

load '~Gituu/test/test.ijs'

NB. ---------------------------------------------------------
0 :0
cocurrent 'base'
open BUILTFILE
open '~Gituu/test/test.ijs'
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)
