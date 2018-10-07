NB. uu - run
0 :0
Tuesday 4 September 2018  15:21:05
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

NB. ---------------------------------------------------------

smoutput 0 : 0
>>> To view existing TPATH_* settings...
   tpath''
>>> To force good working TPATH_* settings:
   load temp 6
)