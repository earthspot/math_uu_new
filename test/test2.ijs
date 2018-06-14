NB. UU: scientific units conversion package - test
0 :0
Wednesday 13 June 2018  15:31:55
-
Sample statements to test verbs: expandcode upp4utok pp4xunit code4xunit encoded decoded
)
smoutput '=== test.ijs - entered'

cocurrent 'uu'

noun_table=: 3 :'n ,. (datatype each z) ,. (z=. ".each n=. y nl 0)'


3 :0''	NB. test immediately
assert ''		-: expandcode 1
assert 'kg'	-: expandcode 3
assert '/kg'	-: expandcode 1r3
assert ''		-: 1&expandcode 1
assert ,<' kg'	-: 1&expandcode 3
assert ,<'/kg'	-: 1&expandcode 1r3
assert 'm^3/kg^2 s K^2 mol^2 eur^2'                -:   expandcode 739944040r9
assert (<;._1 '| m^3|/kg^2| s| K^2| mol^2| eur^2') -: 1&expandcode 739944040r9
)


3 :0''	NB. test immediately
assert ('kg';1)	-: upp4utok 'kg'
assert ('kg';_1)	-: upp4utok '/kg'
assert ('kg';_2)	-: upp4utok '/kg^2'
assert ('kg';_2)	-: upp4utok 'kg^-2'
assert ('kg';2)	-: upp4utok 'kg^2'
assert ('kg';2)	-: upp4utok '/kg^-2'  NB. double-negation--never (or rare?) in practice
)


3 :0''	NB. test immediately
assert 1  0  0  0  0  0  0  0  0 -: pp4xunit 'm'
assert 0  1  0  0  0  0  0  0  0 -: pp4xunit 'kg'
assert 3 _2  1  0  2  0  2  0  2 -: pp4xunit 'm^3/kg^2 s K^2 mol^2 eur^2' NB. zn
)

3 :0''	NB. test immediately
assert 2		-: code4xunit 'm'
assert 3		-: code4xunit 'kg'
assert 739944040r9	-: code4xunit 'm^3/kg^2 s K^2 mol^2 eur^2' NB. zn below
  NB. if a unit NOT preceded by '/' -then it is in numerator
  NB.  if a unit IS preceded by '/' -then it is in denominator
  NB. …clearer when: [/kg^2] --> [kg⁻²] …and:
  NB.  [m^3/kg^2 s K^2 mol^2 eur^2] --> [m³ kg⁻² s K² mol² eur²]
)

NB. TESTS

NB. Nmks:           0  1  2  3  4  5  6  7  8
NB. Pmks:           2  3  5  7 11 13 17 19 23
]z0=: encoded pp0=: 3  2  1  0  2  0  0  0  0  NB. powers of (primes): Pmks
]z1=: encoded pp1=: 3  2  1  0  2  0  2  0  0
]z2=: encoded pp2=: 3  2  1  0  2  0  2  0  2
]zn=: encoded ppn=: 3 _2  1  0  2  0  2  0  2  NB. _2

  NB. single unit
]zm=: encoded ppm=: 1  0  0  0  0  0  0  0  0
]zk=: encoded ppk=: 0 _1  0  0  0  0  0  0  0  NB. _1
]zg=: encoded ppg=: 0  1  0  0  0  0  0  0  0
]zs=: encoded pps=: 0  0  1  0  0  0  0  0  0

  NB. verify all ok* and oK* are 1
]ok0=: pp0 -: dz0=: decoded z0
]ok1=: pp1 -: dz1=: decoded z1
]ok2=: pp2 -: dz2=: decoded z2
]okn=: ppn -: dzn=: decoded zn
  NB. single unit tests
]okm=: ppm -: dzm=: decoded zm
]okk=: ppk -: dzk=: decoded zk
]okg=: ppg -: dzg=: decoded zg
]oks=: pps -: dzs=: decoded zs

NB. Loop below is effectively…
NB. uc0=: expandcode z0
NB. tc0=: toks4expandcode z0
NB. oK0=: tc0 -: utoks uc0
NB. uc1=: expandcode z1  …etc.

3 :0''	NB. test immediately
for_r. '012nmkgs' do.
do sw'uc(r)=: expandcode z(r)'
do sw'tc(r)=: toks4expandcode z(r)'
do sw'oK(r)=: tc(r) -: utoks uc(r)'
end.
)

smoutput noun_table'u'
smoutput noun_table'z'
smoutput noun_table'o'

smoutput '=== test2.ijs - completed'