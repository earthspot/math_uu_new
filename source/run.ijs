NB. uu - run
0 :0
Friday 15 June 2018  11:53:10
-
cocurrent 'base'
open BUILTFILE
open '~Gituu/test/test.ijs'
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)

BUILTFILE_z_=: 1!:1 <jpath'~Gituu/builtfile'	NB. effectively: '~Gituu/uu.ijs'
TESTFILE_z_=: '~Gituu/test/test.ijs'

NB. ---------------------------------------------------------

clear 'uu'
load BUILTFILE	
smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without errors: ',TESTFILE