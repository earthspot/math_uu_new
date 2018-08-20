NB. UU: scientific units conversion package - test1
NB. test verb: uu using testcreator
0 :0
Monday 20 August 2018  01:18:43
-
Actual test logs reside in:
ot 2	NB. uunicode 0
ot 3	NB. uunicode 1
ot 4	NB. uunicode 2
ot 5	NB. uunicode 3
)

smoutput PLS,'+++ test1.ijs - entered',PLS

tv 0  NB. turn off ALL trace messages --which redux will gag at

SUCCESS=: <,:'no difference'

load '~proj/testcreator.ijs'  NB. provides: redux

smoutput r5=. redux 5  NB. uunicode 3
assert r5 -: SUCCESS

smoutput r4=. redux 4  NB. uunicode 2
assert r4 -: SUCCESS

smoutput r3=. redux 3  NB. uunicode 1
assert r3 -: SUCCESS

NB. smoutput r2=. redux 2  NB. uunicode 0
NB. assert r2 -: SUCCESS
NB. <<<<<<<<< THIS LAST TEST FAILS.

smoutput PLS,'--- test1.ijs - completed',PLS