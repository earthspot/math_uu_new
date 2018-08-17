	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

NB. ┌────────────────────────────────────────────────┐
NB. │See DEV 97 for new pattern-matching technique   │
NB. │which combines input & output into a single verb│
NB. │called: format3                                 │
NB. └────────────────────────────────────────────────┘

NB. This is a new version, based on the 'errif' technique
NB. Every (pro)verb beginning 'take_' gets tried in turn
NB.  until one works.

NB. A corresponding set of (pro)verbs beginning 'give_'
NB. accept input in a variety of formats and convert them
NB. to a quantity (a scalar number)
NB. Both 'give_' and 'take_' verbs are maintained as a single
NB. collection in this script.
NB.
NB. This arrangement allows ad-hoc 'give_' and 'take_' verbs
NB. to be defined in the t-table itself (which is a J script).

give=: 4 : 0
  NB. implements verb: format3
GIVE=: ''
]z=. ; ('give_' nl 3) ,each <' :: '
]z=. 'x(' ,z, 'giverr)y'
chain=: 3 : z	NB. for diagnostics only
".z [sm GIVE
)

make_format3=: 3 : 0
  NB. implements verb: format3
]z=. ; ('give_' nl 3) ,each <' :: '
]z=. 'x(' ,z, 'giverr)y'
format3=: 13 : z
i.0 0
)

giverr=: 4 : 0
'giverr: none chime ',llog 'x y'
)

give_test1=: 4 : 0
	]GIVE=: ''`give_test1
  NB. force error if this is not the right verb to use
errif -. x-: 'units1'
'give_test1 computes: ',":y
)

give_test2=: 4 : 0
	GIVE=: GIVE`give_test2
  NB. force error if this is not the right verb to use
errif -. x-: 'units2'
'give_test2 computes: ',":y
)

give_test3=: 4 : 0
	GIVE=: GIVE`give_test3
  NB. force error if this is not the right verb to use
errif -. x-: 'units3'
'give_test3 computes: ',":y
)

NB. format3=: give  NB. trial implementation using: give
NB. format3=: chain  NB. trial implementation using: give
make_format3''

0 :0
 In the case of "format", x is a units, e.g. 'gbp'
 and y is the value to be formatted, e.g. to become: '£1.00'.
 giverr is only called if no "give-" verbs chime with: x.
-
sm 'able' format3 99
GIVE  NB. verify which "give_"verbs were tried
sm 'units1' format3 99  NB. applies 'give_test1' to x y
GIVE
sm 'units2' format3 99  NB. applies 'give_test2' to x y
GIVE
sm 'units3' format3 99  NB. applies 'give_test3' to x y
GIVE
)