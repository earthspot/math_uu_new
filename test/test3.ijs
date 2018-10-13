NB. UU: scientific units conversion package - test3
0 :0
Wednesday 5 September 2018  17:25:45
-
Sample statements to test verb: uu
)

smoutput PLS,'+++ test3.ijs - entered',PLS

cocurrent 'base'

NB. NEEDS NUMERIC PRECISION ADJUSTED

uunicode 0	NB. no unicode in units
assert '0.914 m' -:	uu '3 ft'
assert '0.914 m' -:	uu '1 yd'
assert '60 s' -:		uu '1 min'
assert '3 ft' -:		'ft' uu '1 yd'
assert '2 yd' -:		'yd' uu '6 ft'
assert '56.789 km' -:	'km' uu '56789 m'

]siz0=: uu'*QSIZ'
uu'*ssiz 0'

uunicode 0	NB. no unicode in units
assert '1.500E-9 m/s^2' -:	uu '15 Ang/s/s'
assert '1E7 Ang' -:	'Ang' uu '1 mm'
assert '304800 Ang/s^2' -:	'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft/s^2'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

uunicode 1	NB. unicoded with slashes
assert '1.500E-9 m/s²' -:	uu '15 Ang/s/s'
assert '1E7 Å' -:		'Ang' uu '1 mm'
assert '304800 Å/s²' -:	'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft/s²'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

uunicode 2	NB. unicoded with negative powers
assert '1.500E-9 m s⁻²' -:	  uu '15 Ang/s/s'
assert '1E7 Å' -:	  'Ang' uu '1 mm'
assert '304800 Å s⁻²' -:     'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft s⁻²'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

uu'*ssiz ',":siz0

smoutput PLS,'--- test3.ijs - completed',PLS