	NB. uu - syntax_machines.ijs
'==================== [uu] syntax_machines ===================='
0 :0
Thursday 15 November 2018  05:05:14
-
Syntax machines defined in this script:
	cutuuc	-tokenizes a line of UUC
	smddmmyy	-recognises date
	smtime	-recognises time
)

cocurrent 'uu'

spout=: 3 ddefine
  NB. space out vector: y
w=. {:$z=. vv y
for_k. i.x-w do.
  z=. SP,.z
end.
,z
)

f5=: 3 : 0
  NB. diagnostic display for string y
Outsymbols=. ' .:|;!$'	NB. output codes as symbols
z=. |: (5;sj;mj);: y
i=. 0{z		NB. iteration index
j=. 1{z		NB. beginning index of word
r=. 2{z		NB. current state
c=. 3{z		NB. current mapped input
R=. 4{z		NB. new state
O=. 5{z		NB. output code (0-6)
iy=. i{y		NB. y trimmed to fit z
smoutput '           ',spout i
NB.smoutput '___________','_'#~ #spout i
smoutput '       (y) ',spout iy
smoutput 'y-class(c) ',spout c
smoutput '  state(r) ',spout r
smoutput 'outcode(O) ',spout O{Outsymbols
smoutput 'w-begin(j) ',spout j
NB.smoutput '->state(R) ',spout R	--redundant
)

NB. -----------------------------------------------------------
NB. cutuuc
NB. (moved here from: main.ijs)

  NB. Make inputs mapping table mj
mj=. 0 $~ 256                     		NB. X (default bytes)
mj=. 1 ch}mj [ ch=. a.i. SP,TAB		NB. S
mj=. 2 ch}mj [ ch=. a.i. az,AZ,n9,'._-/^*%'	NB. A
mj=. 3 ch}mj [ ch=. a.i. '['			NB. [
mj=. 4 ch}mj [ ch=. a.i. ']'			NB. ]

  NB. Make state transition table sj
sj=. +. ".&> }. cutLF (0 define)
  X    S    A    [    ]   NB. "input class"
 1j1  0j0  1j1  1j1  1j1  NB. 0 space (starts in this state)
 1j0  2j2  1j0  3j0  1j0  NB. 1 value		3jx, x e. i.4
 2j2  2j0  2j0  5j2  2j0  NB. 2 units
 3j0  3j0  3j0  3j2  4j2  NB. 3 simple units	5jx, only x=2 works
 4j6  4j6  4j6  4j6  4j6  NB. 4 ]-state stops, doesn't return descr
 3j1  3j1  3j1  3j1  3j1  NB. 5 [-state, eats [ -->3
)

cutuuc=: (0;sj;mj)&;: "1

NB. -----------------------------------------------------------
NB. smtime
NB. (copied from temp 43)

NB.    0   1   2   3   4   5   6   y-class
NB.    LF  SP  CO  DT  D5  D9  XX  class-name
t=. ,: 0   0   0j6 0j6 1j1 1j1 0j6	NB. STATE 0 pass over leading w/s
t=. t, 0j6 0j6 0j6 0j6 2   2   0j6	NB. STATE 1 expect 2nd digit of hour;
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6	NB. STATE 2 expect colon; emit
t=. t, 0j6 0j6 0j6 0j6 4j1 4j1 0j6	NB. STATE 3 expect 1st digit of min
t=. t, 0j6 0j6 0j6 0j6 5   5   0j6	NB. STATE 4 expect 2nd digit of min
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6	NB. STATE 5 expect colon; emit
t=. t, 0j6 0j6 0j6 0j6 7j1 7j1 0j6	NB. STATE 6 expect 1st digit of sec
t=. t, 0j6 0j6 0j6 0j6 8   8   0j6	NB. STATE 7 expect 2nd digit of sec
t=. t, 0j3 0j3 0j6 9   0j6 0j6 0j6	NB. STATE 8 expect end or DT
t=. t, 0j6 0j6 0j6 0j6 10  10  0j6	NB. STATE 9 expect a decimal digit
t=. t, 0j3 0j3 0j6 0j6 10  10  0j6	NB. STATE 10 expect more decimal digits

sj=. +. t  NB. the state-table, in complex-number form

NB.class 0    1              2    3     4          5      6
mj=.   < LF ; (NUL,SP,TAB) ; CO ; DT ; '012345' ; '6789'  NB.all else
smtime=: ((0;sj;mj) ;: ucp)"1

onload"1 cmx 0 : 0
smoutput smtime '23:58'
smoutput smtime '23:58:59'
smoutput smtime '23:58:59.12'
smoutput smtime '23:58:59.'
smoutput smtime '23:58:59. '
smoutput smtime '23:58:59   '
)

NB. -----------------------------------------------------------
NB. smddmmyy
NB. (adapted from temp 43)

NB.    0   1   2   3   4   5   6   y-class
NB.    LF  SP  SL  D1  D3  D9  XX  class-name
t=. ,: 0   0   0j6 1j1 1j1 0j6 0j6	NB. STATE 0 pass over leading w/s
t=. t, 0j6 0j6 0j6 2   2   2   0j6	NB. STATE 1 expect 2nd digit of dd;
t=. t, 0j6 0j6 3j3 0j6 0j6 0j6 0j6	NB. STATE 2 expect slash; emit
t=. t, 0j6 0j6 0j6 4j1 0j6 0j6 0j6	NB. STATE 3 expect 1st digit of mm
t=. t, 0j6 0j6 0j6 5   5   5   0j6	NB. STATE 4 expect 2nd digit of mm
t=. t, 0j6 0j6 6j3 0j6 0j6 0j6 0j6	NB. STATE 5 expect slash; emit
t=. t, 0j6 0j6 0j6 7j1 0j6 0j6 0j6	NB. STATE 6 expect 1st digit of yy
t=. t, 0j6 0j6 0j6 8   8   8   0j6	NB. STATE 7 expect 2nd digit of yy
t=. t, 0j3 0j3 0j6 0j6 0j6 0j6 0j6	NB. STATE 8 expect LF or SP

sj=. +. t  NB. the state-table, in complex-number form

NB.cname LF   SP             SL    D1     D3     D9       XX
NB.class 0    1              2     3      4      5        6
mj=.   < LF ; (NUL,SP,TAB) ; SL ; '01' ; '23' ; '456789'  NB.all else
smddmmyy=: ((0;sj;mj) ;: ucp)"1

onload"1 cmx 0 : 0
smoutput smddmmyy '31/12/18'
smoutput smddmmyy '31/13/18   '
smoutput smddmmyy '31/13/18',LF
)
