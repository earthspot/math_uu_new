NB. customizable blink1 driver -- Gituu/source/blink.ijs
0 :0
Friday 24 August 2018  21:11:03
-
Used by: formatin.ijs -for testing take_1_ verbs
)

cocurrent 'uu'

blink=: 4 ddefine
  NB. operate the blink1-tool
  NB. (int) x is the template (t*) to use (--> t)
  NB. Non-empty y ...
  NB. -m <fade-in-milliseconds>
  NB. --blink <number-of-times>
  NB. --red
  NB. --off
f=. '~/sh/blink1-tool'
fade=. 100
color=. 'red'
r=. 255
g=. '0x66'
b=. 0
rgb=. 'ff9900' NB. flame
rgb=. 'ff6600' NB. my yellow
s=. 3  NB. blinks
t0=. '(f) --off -m 0 &'
t1=. '(f) --(color) &'
t2=. '(f) --rgb (r),(g),(b) &'
t3=. '(f) --rgb=(rgb) &'
t4=. '(f) -m (fade) --rgb (r),(g),(b) --blink (s) &'
t=. ".'t',":x  NB. t is now the template to use…
z=. sw t
select. y
case. 'take_1_deg'     do. z=. sw '(f) --red &'
case. 'take_1_dms'     do. z=. sw '(f) --green &'
case. 'take_1_hms'     do. z=. sw '(f) --blue &'
case. 'take_9_general' do. z=. sw '(f) --rgb=ff6600 &' NB. my yellow
case. 'take_8_misc'    do. z=. sw '(f) --magenta &'
case. 'take_1_note'    do. z=. sw '(f) --cyan &'
case. 'take_1_sci'     do. z=. sw '(f) --white &'
case. 'take_1_sig'     do. z=. sw '(f) --white &'
case. 0 do. z=. sw t0
case. 1 do. z=. sw t  NB. =template selected by: (x)
case. 2 do. z=. sw '(f) -m (fade) --rgb (r),(g),(b) &'
case. 3 do. z=. sw '(f)           --rgb (r),(g),(b) &'
case. 4 do. z=. sw '(f) --red &'
case. 5 do. z=. sw '(f) --green &'
case. 6 do. z=. sw '(f) --blue &'
fcase. 'white' do.
fcase. 'red' do.
fcase. 'green' do.
case. 'blue' do. z=. sw'(f) --(y) &'
NB. case. 'help' do. z=. f  NB. doesn't work! (except in Terminal)
case.        do. z=. sw'(f) (y) &'
end.
NB. smoutput z
2!:1 z
)

0 :0
blink 1  NB. use builtin locals (…can be customized)
blink 0  NB. switch off
blink '--white'
blink '--cyan'
4 blink '--red --glimmer=10'
2!:1 '~/sh/blink1-tool --off --m 0 &'
2!:1 '~/sh/blink1-tool --rgb=ff6600 &'  NB. my attempt at yellow
blink 4
3 blink 1
blink 'red'
)
