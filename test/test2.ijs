NB. UU: scientific units conversion package - test2
0 :0
Wednesday 5 September 2018  17:26:00
-
Sample statements to test verbs:
 expandcode upp4utok pp4xunit code4xunit encoded decoded
)
smoutput PLS,'+++ test2.ijs - entered',PLS

cocurrent 'base'

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

expandcode_test=: 3 : 0
assert. ''	-: expandcode_uu_ 1
assert. 'kg'	-: expandcode_uu_ 3
assert. '/kg'	-: expandcode_uu_ 1r3
assert. ''	-: 1&expandcode_uu_ 1
assert. (,<' kg')	-: 1&expandcode_uu_ 3
assert. (,<'/kg')	-: 1&expandcode_uu_ 1r3
assert. 'm^3/kg^2 s K^2 mol^2 eur^2'                -:   expandcode_uu_ 739944040r9
assert. (<;._1 '| m^3|/kg^2| s| K^2| mol^2| eur^2') -: 1&expandcode_uu_ 739944040r9
assert. ('kg';1)	-: upp4utok 'kg'
assert. ('kg';_1)	-: upp4utok '/kg'
assert. ('kg';_2)	-: upp4utok '/kg^2'
assert. ('kg';_2)	-: upp4utok 'kg^-2'
assert. ('kg';2)	-: upp4utok 'kg^2'
assert. ('kg';2)	-: upp4utok '/kg^-2'
  NB. …double-negation--never (or rare?) in practice
)

NB. expandcode_test''

encoded_decoded_test=: 3 : 0
NB. Nmks:               0  1  2  3  4  5  6  7  8
NB. Pmks:               2  3  5  7 11 13 17 19 23
]z0=: encoded_uu_ pp0=: 3  2  1  0  2  0  0  0  0
]z1=: encoded_uu_ pp1=: 3  2  1  0  2  0  2  0  0
]z2=: encoded_uu_ pp2=: 3  2  1  0  2  0  2  0  2
]zn=: encoded_uu_ ppn=: 3 _2  1  0  2  0  2  0  2  NB. _2
  NB. single unit
]zm=: encoded_uu_ ppm=: 1  0  0  0  0  0  0  0  0
]zk=: encoded_uu_ ppk=: 0 _1  0  0  0  0  0  0  0  NB. _1
]zg=: encoded_uu_ ppg=: 0  1  0  0  0  0  0  0  0
]zs=: encoded_uu_ pps=: 0  0  1  0  0  0  0  0  0
  NB. verify all ok* and oK* are 1
assert. pp0 -: (dz0=. decoded_uu_ z0)
assert. pp1 -: (dz1=. decoded_uu_ z1)
assert. pp2 -: (dz2=. decoded_uu_ z2)
assert. ppn -: (dzn=. decoded_uu_ zn)
  NB. single unit tests
assert. ppm -: (dzm=. decoded_uu_ zm)
assert. ppk -: (dzk=. decoded_uu_ zk)
assert. ppg -: (dzg=. decoded_uu_ zg)
assert. pps -: (dzs=. decoded_uu_ zs)
)

encoded_decoded_test''

multiple_expandcode_test=: 3 : 0
  NB. Loop below is effectively…
  NB.   r=.0
  NB. uc0=. expandcode_uu_ z0
  NB. tc0=. toks4expandcode_uu_ z0
  NB. oK0=. tc0 -: (utoks_uu_ uc0)
  NB.   r=.1
  NB. uc1=. expandcode_uu_ z1
  NB.  …etc.
'LB RB'=. '()'
for_r. '012nmkgs' do.
do sw'uc(r)=: expandcode_uu_ z(r)'
do sw'tc(r)=: toks4expandcode z(r)'
do sw'oK(r)=: tc(r) -: (LB)utoks_uu_ uc(r)(RB)'
end.
try.
 assert. oK0
 assert. oK1
 assert. oK2
 assert. oKg
 assert. oKk
 assert. oKm
 assert. oKn
 assert. oKs
catch.
  NB. if any fail, show these diagnostic tables:
  smoutput noun_table'u'
  smoutput noun_table'z'
  smoutput noun_table'o'
end.
)

multiple_expandcode_test''

NB. erase 'noun_table toks4expandcode upp4utok'

smoutput PLS,'--- test2.ijs - completed',PLS