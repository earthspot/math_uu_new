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
  NB. implements verb: format
GIVE=: ''
]z=. ; ('give_' nl 3) ,each <' :: '
]z=. 'x(' ,z, 'giverr)y'
".z [sm GIVE
)

giverr=: 4 : 0
'giverr: ',llog 'x y'
)

give_test1=: 4 : 0
	GIVE=: GIVE`give_test1
errif -. x-: 'test1'
'give_test1: ',":y
)

give_test2=: 4 : 0
	GIVE=: GIVE`give_test2
errif -. x-: 'test2'
'give_test2: ',":y
)
