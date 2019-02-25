	NB. uu - format.ijs
'==================== [uu] format.ijs =================='

cocurrent 'uu'

0 :0
Thursday 15 November 2018  04:10:53
-
-cloned into: temp 45 pre-purge of FahR etc: 15 November 2018
NOTE: temp 45 may have some useful test expressions purged from here.
-
New format verb based on daisychain
Tries each give (give_* verb) in turn until one exits normally,
 or giverr (the last one) is reached.
If a give fails, the next give gets tried.
If a give knows it's inappropriate, it calls: errif
 to force an error.
If it simply crashes, the same thing happens.
-
This arrangement allows ad-hoc 'give_' and 'take_' verbs
to be defined in the t-table itself (which is a J script).
-
x-arg is a units, e.g. 'gbp'
 and y is the value to be formatted, e.g. to become: '£1.00'.
giverr is only called if no "give-" verbs chime with: x.
)

register=: 3 : 0
  NB. for use in give_ verbs only
  NB. reports the last give_* verb to be entered
VEX=: y
)

testf=: 3 : 0
  NB. test: format (and friends) with special-needs units
if. 0=#y do. y=. 123.4567 end.
for_no. ;:'eur gbp usd deg ! c eV Hz rad / *' do.
  nom=. ,>no
  smoutput nb nom ; TAB ; nom format y
end.
)

format=: formatOUT=: '' ddefine
0 pushme'formatOUT'
msg '+++ formatOUT: ENTERED, x=[(x)] y=[(y)]'
NO_UNITS_NEEDED=: 0
kx=. bris x  NB. work internally in kosher units
z=. kx daisychain y
msg '--- formatOUT: EXITS, last give_ verb: (VEX) -returns z=(z)'
0 popme'formatOUT'
z return.
)

make_daisychain=: 3 : 0
  NB. makes the daisychain for: formatOUT
>z=. 'give_' nl 3
]z=. (; z,each <' ::'),'giverr'
daisychain=: 13 : ('x(',z,')y')
i.0 0
)

giverr=: 4 : 0
msg '>>> giverr: none chime: x=(x) y=(y)'
sw'(y) [??]'
)

deg_symbol=: 3 : 0
if. SIC>0 do. '°' else. 'deg' end.
)

give_0_angle=: 4 : 0
register'give_0_angle'
  NB. outputs degrees y [deg] as degrees of angle
assert. x -: 'deg'  NB. force error if wrong verb
ds=. deg_symbol'' NB. SI-compliant
d=. scino y  NB. rad-->deg conversion specd already in UUC
sw'(d)(ds)' [ NO_UNITS_NEEDED=: 1
)

give_0_yesno=: 4 : 0
register'give_0_yesno'
NB. 	ssw'+++ give_0_yesno: x=[(crex x)] y=(y)'
  NB. outputs Boolean y [!] as (e.g.) NO or YES
  NB. uses setting of global: ZERO
assert. (,x) -: ,'!'  NB. force error if wrong verb
NO_UNITS_NEEDED=: 1
NB. 	ssw'+++ give_0_yesno: ZERO=[(ZERO)]'
if. y=0 do. ZERO
else.
select. ZERO
case. 'no' do. 'yes'
case. 'NO' do. 'YES'
case. 'off' do. 'on'
case. 'OFF' do. 'ON'
case. 'lo' do. 'hi'
case. 'LO' do. 'HI'
case. 'low' do. 'high'
case. 'LOW' do. 'HIGH'
case. 'false' do. 'true'
case. 'FALSE' do. 'TRUE'
case. do. '~',ZERO  NB. ZERO has unanticipated value
end.
end.
)
0 :0
'!' give_0_yesno 0
'!' give_0_yesno 1
uu '0 !'
'!' uu '0 !'
uu '1 !'
'!' uu '1 !'
)

give_1_temp=: 4 : 0
  NB. NO disp applied on output.
register'give_1_temp'
unit=. ,x
assert. isTemperature unit
sllog 'VEX x y unit disp'
sw'(scino y)'
)
0 :0
'degRo' give_1_temp 373.15
'degRo' uu '373.15 K'
'degRo' uu '1 b.p'
'degRo' uu '1 f.p'
)

give_0_misc=: 4 : 0
register'give_0_misc'
  NB. picks up miscellaneous forms
if. undefined y do. 'UNDEFINED' return. end.
if. SIC>0 do. infinity=. '∞'
else. infinity=. 'infinity'
end.
if. y=__ do. '-',infinity return.
elseif. y=_ do. infinity return.
end.
assert. 0
)

give_9_general=: 4 : 0
register'give_9_general'
  NB. chimes if nothing else does
  NB. Verb names are sorted --> this comes last in: 'give_1_' nl 3
unit=. x
msg '... give_9_general: x=(x) y=(y) unit=(unit)'
sw'(y) (unit)'
)

give_0_hms=: 4 : 0
register'give_0_hms'
  NB. converts seconds [s] to hh:mm:ss
assert. x -: 'hms'  NB. force error if wrong verb
'hh mm ss'=.":each 24 60 60 #: y
if. 10>".hh do. hh=. '0',hh end.
if. 10>".mm do. mm=. '0',mm end.
if. 10>".ss do. ss=. '0',ss end.
sw'(hh):(mm):(ss)'
)

give_0_dms=: 4 : 0
register'give_0_dms'
  NB. converts degrees [deg] to d° m' s"
asec4deg=. 3600 * ]
assert. x -: 'dms'  NB. force error if wrong verb
NB. if. y-:'' do. y=. d4dms 3 59 59 end. ---WRONG
'd m s'=.":each <.each 360 60 60 #: asec4deg |y
ds=. deg_symbol''  NB. SI-compliant
sw'(d)(ds) (m)(QT) (s)"' [ NO_UNITS_NEEDED=: 1
)

give_2_note=: 4 : 0
register'give_2_note'
assert. x -: 'note'  NB. force error if wrong verb
sw'(note y) note' [ NO_UNITS_NEEDED=: 1
)

give_2_sci=: 4 : 0
register'give_2_sci'
z=. (toupper@hy@scino) y  NB. scientific notation (conventional)
unit=. x
msg '... give_2_sci: x=(x) y=(y) z=(z) unit=(unit)'
z return.
)

give_2_sig=: give_2_sci

make_daisychain''