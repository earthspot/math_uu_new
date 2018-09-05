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

uuinitTest''  NB. create an instance for testing...
load TESTFILE
smoutput '--- run.ijs: TESTFILE completed without discrepancies:',LF,TESTFILE

NB. ---------------------------------------------------------

smoutput 0 : 0
>>> To view existing TPATH_* settings...
   tpath''
>>> To force good working TPATH_* settings:
   load temp 6
)

0 :0 NB. SUPERSEDED....................
>>> To launch an instance of class'uu'...
   u0=: uuinit''  NB. localizer is: UU_LOC_z_
   u1=: uuinit 1  NB. runs: start 1 --> UNICODE__uu1 -: 1
   destroy__u0''
   destroy__u1''
>>> To test...
   uuengine__u1 'ssic 2'
   uuengine__u1 'uuuu 3 ft'
   uu__u1 '3 ft'
   uuengine__u1 'uuuu 3 ft > yd'
   'yd' uu__u1 '3 ft'
   'yd' uuengine__u1 '3 ft'
   uu__u1 '10 N'
   uu__u2 '10 N'
   uu__u1 '*ssic 3'   
)
