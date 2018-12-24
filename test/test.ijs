NB. UU test suite
0 :0
Wednesday 5 December 2018  11:09:45
)

cocurrent 'base'

PLS_z_=: LF,~LF,60$'+'

smoutput PLS,'+++ test.ijs - entered',PLS

blinkIN_uu_=: empty
blink_uu_=: empty

uunicode_z_=: 3 : 'uu_z_ ''*ssic '',":y'
  NB. ...prefix '*' tells verb: uu it's a uuengine instruction

test_uu_=: 1 ddefine  NB. for running via fkey 5
  NB. trace uu
if. x=0 do. make_msg 0
else.
  make_msg 2
  TRACEVERBS=: ,<'uu'
end.
)

NB. trace these verbs…
NB. trv 'start qty4i qty4anyunit qty4bareunit'

load '~Gituu/test/test4.ijs'
load '~Gituu/test/test2.ijs'
load '~Gituu/test/test3.ijs'
load '~Gituu/test/test1.ijs'

require '~proj/redux.ijs'
redux 14  NB. test SI-conformance with a complex definition
redux 19  NB. test: convert
NB. redux 30  NB. test: temperature scales internals
redux 21  NB. [Cent] [Fahr]

NB. Take the swabs out the patient...
NB. trv 0  NB. turn trace off
blinkIN_uu_=: empty
blink_uu_=: empty

NB. ---------------------------------------------------------
0 :0
Inspect these when analysing failures...
open '~Gituu/test/test1.ijs'
open '~Gituu/test/test2.ijs'
open '~Gituu/test/test3.ijs'
open '~Gituu/test/test4.ijs'
)

smoutput PLS,'--- test.ijs - completed',PLS