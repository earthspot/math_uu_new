NB. customizable blink1 driver -- Gituu/source/blink.ijs
0 :0
Sunday 7 October 2018  12:48:11
-
Used by: formatin.ijs -for testing take_1_ verbs
)

cocurrent 'uu'

BLINK=: '##'

blink1=: 4 ddefine
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
rgbWhite=. 'ff8844'
rgbWhite=. 'ff8855'
rgbFlame=. 'ff9900'
rgbFlame=. 'ff8800'
rgbYellow=. 'ff6600' NB. my yellow (less greenish)
rgb=. rgbFlame
s=. 3  NB. blinks
t0=. '(f) --off -m 0 &'
t1=. '(f) --(color) &'
t2=. '(f) --rgb (r),(g),(b) &'
t3=. '(f) --rgb=(rgb) &'
t4=. '(f) -m (fade) --rgb (r),(g),(b) --blink (s) &'
t=. ".'t',":x  NB. t is now the template to use…
select. y
case. '?' do. smoutput '+++ blink: shell cmd was: ',BLINK return.
case. 0 do. z=. sw '(f) --off -m 0 &'
case. 1 do. z=. sw '(f) --red &'
case. 2 do. z=. sw '(f) --green &'
case. 3 do. z=. sw '(f) --blue &'
case. 4 do. z=. sw t  NB. =template selected by: (x)
case. 5 do. z=. sw '(f) --rgb (r),(g),(b) -m (fade) &'
case. 6 do. z=. sw '(f) --rgb (r),(g),(b) &'
case. 'white'  do. z=. sw '(f) -m 0 --rgb=(rgbWhite) &'
case. 'yellow' do. z=. sw '(f) -m 0 --rgb=(rgbYellow) &'
case. 'flame'  do. z=. sw '(f) -m 0 --rgb=(rgbFlame) &'
NB. fcase. 'white' do.	---NO -use MY adjusted white.
NB. fcase. 'yellow' do.	---NO -use MY adjusted yellow.
  NB. use builtin color words eg --red
fcase. 'magenta' do.
fcase. 'cyan' do.
fcase. 'red' do.
fcase. 'green' do.
case. 'blue' do. z=. sw'(f) -m 0 --(y) &'
NB. case. 'help' do. z=. f  NB. doesn't work! (except in Terminal)
case.        do. z=. sw'(f) (y) &'
end.
2!:1 BLINK=:z
)

blink1 0

blink=: blink1
NB. disable with: blink=: empty

0 :0
blink '?'
-
blink 'red'
blink 'green'
blink 'blue'
blink 'magenta'
blink 'cyan'
blink 'yellow'
blink 'white'
blink 'flame'
-
blink 0  NB. switch off
blink 1  NB. red
blink 2  NB. green
blink 3  NB. blue
blink 4  NB. use builtin locals (…customized)
blink '--white'
blink 'white'
blink '--cyan'
blink 'cyan'
4 blink '--red --glimmer=10'
2!:1 '~/sh/blink1-tool --off -m 0 &'
2!:1 '~/sh/blink1-tool --rgb=ff6600 -m 0 &'  NB. my attempt at yellow
blink 4
3 blink 1
)
