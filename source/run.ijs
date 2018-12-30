NB. uu - run
0 :0
Saturday 29 December 2018  14:54:00
-
cocurrent 'base'
open BUILTFILE
open '~Gituu/test/test.ijs'
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)

TESTFILE_z_=: '~Gituu/test/test.ijs'

NB. ---------------------------------------------------------

clear 'uu'

3 : 0''
try.	load BUILTFILE
catch.	load BUILTFILE_z_=: '~Gituu/uu.ijs'
end.
)

smclear''
smoutput '--- run.ijs: BUILTFILE loaded: ',BUILTFILE

NB. create an instance of class UU for testing...
NB. (----at present, start locale: uu as its own instance)
uu_z_=: uu_uu_
uuengine_z_=: uuengine_uu_
uuengine_z_'strt'

load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies:',LF,TESTFILE

onload_z_=: do