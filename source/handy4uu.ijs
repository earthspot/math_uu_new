	NB. handy4uu.ijs
'==================== [uu] handy4uu ===================='
cocurrent 'z'

Cut=: <;._1

real=: 9&o.
imag=: 11&o.

ifdefined=: 0 <: [: 4!:0 <

isLit=: 2 2048 e.~ 3!:0
isNum=: 1 4 8 64 128 e.~ 3!:0
isScalar=: [: {. 0 = [: $ $
isNo=: isNum *. isScalar
   
daterev=: 3 : 'if. 31<2{y do. |.3{.y else. 3{.y end.'
dayy=: (Cut ' Sunday Monday Tuesday Wednesday Thursday Friday Saturday') pick~ [: weekday 3 {. ]
ddefine=: 1 : 'm&$: : (4 : 0)'
isBoxed=: 0 < L.
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
  NB. smresolve=. is only used by Swift-string verb: sw
smresolve=: (((<0),(<3 3 2$1 0 0 0 0 0 2 1 2 1 2 1 2 0 0 3 2 0),<'(';')') ;: ucp)"1
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve
emsg=: smoutput&sw		NB. for error signal: always smoutputs
ssw=: smoutput&sw		NB. the standard verb: always smoutputs
zeroifabsent=: [: {. ".
ifabsent=: 4 : 'if. ifdefined y do. ".y else. x end.'

all=: *./
and=: *.
any=: +./
o4b=: b2o=:	}.@((<SP) ;@,. ])
b4o=: o2b=:	[: <;._1 SP , ]
b4f=: f2b=:	[: <;._1 LF , ]
  NB. …use b4o instead of monadic (;:) with open-lists of units
  NB. because units can contain '.' -which (;:) cuts.
begins=: beginsWith=: ] -: [ {.~ [: # ]
brack=:	1 |. '][' , ":  NB. layout tool for message string ->'[y]'
nb=: [: ([: }. [: ; ' ' ,&.> ]) ":&.>	 NB. embed nums in string
or=:  +.
not=: -.
to=:    [ + [: i. [: >: -~	NB. eg: 3 to 5 <--> 3 4 5




AZ=: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
CO=: ':'
DT=: '.'
NUL=: 0{a.
az=: 'abcdefghijklmnopqrstuvwxyz'

NaNoun=: 0 ~: [: nc ;:  NB. y==open list, recommended for: absent

cmx=: [: > <;._2   NB. use with (0 : 0) --needs LF-: {:y

date=: 6!:0@('YYYY-MM-DD  hh:mm:ss'"_)
day=: dayy&daterev

default=: 0&$: :(4 : 0)
	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

min=: $:/ :<.
n9=: '0123456789'
paren=: 1 |. ')(' , ":
rnd=: 0&$: :(4 : '(<. 0.5 + y*10^x)%10^x')

sl=: 4 : 0
  NB. RELIABLE path catenator
  NB. IAC Thursday 30 August 2018  16:42:51
SL=. '/'
if. SL={:x do. x=. }:x end.
if. SL={.y do. x=. }.y end.
x,SL,y
)

term=: 3 : '>{:{. wd''sm get term'''  NB. (string) from Term window
edwn=: 3 : '>{:{. wd''sm get edit'''  NB. (string) from Edit window

vv=: ":@|:@,:
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)
