NB. UU: scientific units conversion package - test2
0 :0
Friday 15 June 2018  11:11:07
-
Sample statements to test verbs: expandcode upp4utok pp4xunit code4xunit encoded decoded
)
smoutput '+++ test2.ijs - entered'

cocurrent 'base'  NB. TO ENSURE ALL TEST VARS GET CREATED IN _z_

noun_table=: 3 :'n ,. (datatype each z) ,. (z=. ".each n=. y nl 0)'

toks4expandcode=: 1&expandcode_uu_

upp4utok=: 3 : 0
  NB. (unit;power) for utok: y
]z=. sp1_uu_ >y
]sign=. <: 2* '/'~:{.z
]unit=. '^' taketo }.z
]power=. sign * {. 1,~ ". '^' takeafter z
unit;power return.
)

3 :0''	NB. test immediately
assert ''		-: expandcode_uu_ 1
assert 'kg'	-: expandcode_uu_ 3
assert '/kg'	-: expandcode_uu_ 1r3
assert ''		-: 1&expandcode_uu_ 1
assert ,<' kg'	-: 1&expandcode_uu_ 3
assert ,<'/kg'	-: 1&expandcode_uu_ 1r3
assert 'm^3/kg^2 s K^2 mol^2 eur^2'                -:   expandcode_uu_ 739944040r9
assert (<;._1 '| m^3|/kg^2| s| K^2| mol^2| eur^2') -: 1&expandcode_uu_ 739944040r9
)

3 :0''	NB. test immediately
assert ('kg';1)	-: upp4utok 'kg'
assert ('kg';_1)	-: upp4utok '/kg'
assert ('kg';_2)	-: upp4utok '/kg^2'
assert ('kg';_2)	-: upp4utok 'kg^-2'
assert ('kg';2)	-: upp4utok 'kg^2'
assert ('kg';2)	-: upp4utok '/kg^-2'  NB. double-negation--never (or rare?) in practice
)

0 :0	NB. WITHDRAWN - pp4xunit_uu_ under development
3 :0''	NB. test immediately
assert 1  0  0  0  0  0  0  0  0 -: pp4xunit_uu_ 'm'
assert 0  1  0  0  0  0  0  0  0 -: pp4xunit_uu_ 'kg'
assert 3 _2  1  0  2  0  2  0  2 -: pp4xunit_uu_ 'm^3/kg^2 s K^2 mol^2 eur^2' NB. zn
)

0 :0	NB. WITHDRAWN - code4xunit_uu_ under development
3 :0''	NB. test immediately
assert 2		-: code4xunit_uu_ 'm'
assert 3		-: code4xunit_uu_ 'kg'
assert 739944040r9	-: code4xunit_uu_ 'm^3/kg^2 s K^2 mol^2 eur^2' NB. zn below
  NB. if a unit NOT preceded by '/' -then it is in numerator
  NB.  if a unit IS preceded by '/' -then it is in denominator
  NB. …clearer when: [/kg^2] --> [kg⁻²] …and:
  NB.  [m^3/kg^2 s K^2 mol^2 eur^2] --> [m³ kg⁻² s K² mol² eur²]
)

NB. TESTS

NB. Nmks:           0  1  2  3  4  5  6  7  8
NB. Pmks:           2  3  5  7 11 13 17 19 23
]z0=: encoded_uu_ pp0=: 3  2  1  0  2  0  0  0  0  NB. powers of (primes): Pmks
]z1=: encoded_uu_ pp1=: 3  2  1  0  2  0  2  0  0
]z2=: encoded_uu_ pp2=: 3  2  1  0  2  0  2  0  2
]zn=: encoded_uu_ ppn=: 3 _2  1  0  2  0  2  0  2  NB. _2

  NB. single unit
]zm=: encoded_uu_ ppm=: 1  0  0  0  0  0  0  0  0
]zk=: encoded_uu_ ppk=: 0 _1  0  0  0  0  0  0  0  NB. _1
]zg=: encoded_uu_ ppg=: 0  1  0  0  0  0  0  0  0
]zs=: encoded_uu_ pps=: 0  0  1  0  0  0  0  0  0

  NB. verify all ok* and oK* are 1
]ok0=: pp0 -: dz0=: decoded_uu_ z0
]ok1=: pp1 -: dz1=: decoded_uu_ z1
]ok2=: pp2 -: dz2=: decoded_uu_ z2
]okn=: ppn -: dzn=: decoded_uu_ zn
  NB. single unit tests
]okm=: ppm -: dzm=: decoded_uu_ zm
]okk=: ppk -: dzk=: decoded_uu_ zk
]okg=: ppg -: dzg=: decoded_uu_ zg
]oks=: pps -: dzs=: decoded_uu_ zs

NB. Loop below is effectively…
NB. uc0=: expandcode_uu_ z0
NB. tc0=: toks4expandcode_uu_ z0
NB. oK0=: tc0 -: utoks_uu_ uc0
NB. uc1=: expandcode_uu_ z1  …etc.

3 :0''	NB. test immediately
for_r. '012nmkgs' do.
do sw'uc(r)=: expandcode_uu_ z(r)'
do sw'tc(r)=: toks4expandcode z(r)'
do sw'oK(r)=: tc(r) -: utoks_uu_ uc(r)'
end.
)

 assert ok0
 assert ok1
 assert ok2
 assert okg
 assert okk
 assert okm
 assert okn
 assert oks

 assert oK0
 assert oK1
 assert oK2
 assert oKg
 assert oKk
 assert oKm
 assert oKn
 assert oKs

NB. if any fail, show these diagnostic tables:
0 :0
smoutput noun_table'u'
smoutput noun_table'z'
smoutput noun_table'o'
)

NB. clear up _base_
erase 'ok' names 0
erase 'oK' names 0
erase 'dz' names 0
erase 'pp' names 0
erase 'tc' names 0
erase 'uc' names 0
erase 'z' names 0
erase 'noun_table toks4expandcode upp4utok'

smoutput '--- test2.ijs - completed'