NB. UU test suite
0 :0
Monday 20 August 2018  01:18:05
)

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ test.ijs - entered',PLS

NB. tv 'start qty4i qty4anyunit qty4bareunit'

assert 0 = #VALIDATE_unitc_uu_''

load '~Gituu/test/test4.ijs'

load '~Gituu/test/test2.ijs'
load '~Gituu/test/test3.ijs'
load '~Gituu/test/test1.ijs'

redux 14  NB. test flag: UNICODE with a sufficiently complex definition
 
NB. tv 0  NB. turn trace off

NB. ---------------------------------------------------------
0 :0
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
)

smoutput PLS,'--- test.ijs - completed',PLS