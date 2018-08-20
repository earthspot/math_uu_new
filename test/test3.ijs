NB. UU: scientific units conversion package - test3
0 :0
Monday 20 August 2018  01:27:58
-
>>>>>>>>>>> WARNING !!! <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
uunicode setting & their effect NEED FIXING
…then so will this script!
-
Sample statements to test verb: uu
)
smoutput PLS,'+++ test3.ijs - entered',PLS

cocurrent 'uu'

NB. NEEDS NUMERIC PRECISION ADJUSTED

uunicode 0	NB. no unicode in units
assert '0.914 m' -:	uu '3 ft'
assert '0.914 m' -:	uu '1 yd'
assert '60 s' -:		uu '1 min'
assert '3 ft' -:		'ft' uu '1 yd'
assert '2 yd' -:		'yd' uu '6 ft'
assert '56.789 km' -:	'km' uu '56789 m'

uunicode 0	NB. no unicode in units
assert '1.500E-9 m/s²' -:	uu '15 Ang/s/s'
assert '1.000E7 Å' -:	'Ang' uu '1 mm'
assert '3.048E5 Å/s²' -:	'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft/s²'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

uunicode 1	NB. unicoded with slashes
assert '1.500E-9 m/s²' -:	uu '15 Ang/s/s'
assert '1.000E7 Å' -:	'Ang' uu '1 mm'
assert '3.048E5 Å/s²' -:	'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft/s²'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

uunicode 2	NB. unicoded with negative powers
assert '1.500E-9 m s⁻²' -:	  uu '15 Ang/s/s'
assert '1.000E7 Å' -:	  'Ang' uu '1 mm'
assert '3.048E5 Å s⁻²' -:	  'Ang/s^2' uu '0.0001 ft/s/s'
z=: '2.532E-17 ft s⁻²'
assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
assert z -:	 	'ft/s^2' uu '1 Å/h^2'
assert z -:	 	'ft/s^2' uu '1 Å/h/h'
assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

smoutput PLS,'--- test3.ijs - completed',PLS