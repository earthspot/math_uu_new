NB. UU: scientific units conversion package - test3
0 :0
Sunday 12 August 2018  02:42:14
-
>>>>>>>>>>> WARNING !!! <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
uunicode setting & their effect NEED FIXING
…then so will this script!
-
Sample statements to test verb: uu
)
smoutput '+++ test3.ijs - entered'

cocurrent 'uu'

NB. NEEDS NUMERIC PRECISION ADJUSTED

NB. uunicode 0	NB. no unicode in units
NB. assert '0.914 m' -:	uu '3 ft'	--->'0.9144 m'
NB. assert '0.914 m' -:	uu '1 yd'
NB. assert '60 s' -:		uu '1 min'
NB. assert '3 ft' -:		'ft' uu '1 yd'
NB. assert '2 yd' -:		'yd' uu '6 ft'
NB. assert '56.789 km' -:	'km' uu '56789 m'
NB.
NB. uunicode 0	NB. no unicode in units
NB. assert '1.500E-9 m/s²' -:	uu '15 Ang/s/s'		NB. >>>>>> SO WHY IS uu OUTPUTTING UNICODE?
NB. assert '1.000E7 Å' -:	'Ang' uu '1 mm'
NB. assert '3.048E5 Å/s²' -:	'Ang/s^2' uu '0.0001 ft/s/s'
NB. z=. '2.532E-17 ft/s²'
NB. assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h^2'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h/h'
NB. assert z -:	 	'ft/s^2' uu '1 Ang/h/h'
NB.
NB. uunicode 1	NB. unicoded with slashes
NB. assert '1.500E-9 m/s²' -:	uu '15 Ang/s/s'
NB. assert '1.000E7 Å' -:	'Ang' uu '1 mm'
NB. assert '3.048E5 Å/s²' -:	'Ang/s^2' uu '0.0001 ft/s/s'
NB. z=. '2.532E-17 ft/s²'
NB. assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h^2'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h/h'
NB. assert z -:	 	'ft/s^2' uu '1 Ang/h/h'
NB.
NB. uunicode 2	NB. unicoded with negative powers
NB. assert '1.500E-9 m s⁻²' -:	  uu '15 Ang/s/s'
NB. assert '1.000E7 Å' -:	  'Ang' uu '1 mm'
NB. assert '3.048E5 Å s⁻²' -:	  'Ang/s^2' uu '0.0001 ft/s/s'
NB. z=. '2.532E-17 ft s⁻²'
NB. assert z -:	  	'ft/s^2' uu '1 Å h⁻²'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h^2'
NB. assert z -:	 	'ft/s^2' uu '1 Å/h/h'
NB. assert z -:	 	'ft/s^2' uu '1 Ang/h/h'

smoutput '--- test3.ijs - completed'