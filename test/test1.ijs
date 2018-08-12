NB. UU: scientific units conversion package - test1
NB. test verb: uu using testcreator

smoutput '+++ test1.ijs - entered'

SUCCESS=: <,:'no difference'

load '~proj/testcreator.ijs'
smoutput r2=. redux 2
assert r2 -: SUCCESS

smoutput r3=. redux 3
assert r3 -: SUCCESS

smoutput r4=. redux 4
assert r4 -: SUCCESS

smoutput '--- test1.ijs - completed'