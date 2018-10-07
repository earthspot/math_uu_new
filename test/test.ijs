NB. UU test suite
0 :0
Saturday 6 October 2018  21:52:20
)

cocurrent 'base'

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ test.ijs - entered',PLS

uunicode_z_=: 3 : 'uu_z_ ''*ssic '',":y'
  NB. ...preceding '*' tells verb: uu it's a uuengine instruction

NB. trace these verbs…
NB. trv 'start qty4i qty4anyunit qty4bareunit'

load '~Gituu/test/test4.ijs'
load '~Gituu/test/test2.ijs'
load '~Gituu/test/test3.ijs'
load '~Gituu/test/test1.ijs'

require '~proj/redux.ijs'
redux 14  NB. test SI-conformance with a complex definition
redux 19  NB. test: convert
redux 21  NB. test: temperature scales

NB. trv 0  NB. turn trace off

NB. ---------------------------------------------------------
0 :0
Inspect these when analysing failures...
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
open '~Gituu/test/test4.ijs'
)

smoutput PLS,'--- test.ijs - completed',PLS