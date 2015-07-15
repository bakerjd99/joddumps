NB. JOD dictionary dump: 15 Jul 2015 09:45:12
NB. Generated with JOD version; 0.9.980; 1; 6 Jul 2015 11:24:25
NB.
NB. Names & DidNums on current path
NB. +-----+---------------------------------------+
NB. |utils|120915817263228354452137406440734108143|
NB. +-----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BASE64=:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

BOM=:239 187 191{a.

CLASSAUTHOR=:'John D. Baker -- bakerjd99@gmail.com'

CR=:13{a.

CRLF=:13 10{a.

IFACEWORDShtmthorn=:,<'thh'

IFACEWORDSsunmoon=:<;._1 ' calmoons moons sunriseset0 sunriseset1'

LF=:10{a.

NAMEALPHA=:'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'

NORISESET=:99

ROOTWORDShtmthorn=:<;._1 ' ROOTWORDShtmthorn IFACEWORDShtmthorn'

ROOTWORDSsunmoon=:<;._1 ' IFACEWORDSsunmoon ROOTWORDSsunmoon calmoons sunriseset0 sunriseset1 today yeardates'

TAB=:9{a.

TEMPFILE0=:'c:\temp\md5tmp.txt'

TeXPtCm=:28.399999999999999

TeXPtIn=:72.269999999999996

TeXPtMm=:2.8399999999999999

USBDRIVEVOLUME=:'USBK01'

pi=:3.1415926535897931

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


BesselJ=:1 : '(^&m@:-: % (!m)"_)* [: ''''H. (m+1) _0.25 * *:'

MillerRabin=:100&$: :(4 : 0)"0

NB.*MillerRabin v-- Miller Rabin probabalistic prime test.
NB.
NB. m  MillerRabin n is 0  or 1. If  0  then n is not prime; if 1
NB. then n is prime with an error probability of at most 0.25^m
NB.
NB. verbatim:
NB.
NB. from J Wiki:
NB. http://www.jsoftware.com/jwiki/Essays/Primality_Tests#20081031001648
NB.
NB. monad:  pa =. MillerRabin ia | Xa
NB.
NB.   MillerRabin 3454545452242x
NB.
NB. dyad:   ps =. iaM MillerRabin ia | Xa
NB.
NB.  10 MillerRabin p: 2000000

 d=. {:s=. huo y-1
 e=. 2x^#s
 for_a. 1+x ?@$ y-1 do.
  if. 1~:(a y&|@^ d) y&|@^ e do. 0 return. end.
 end.
 1
)

Note=:3 : '0 0 $ 0 : 0' :[

afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

afterstr=:] }.~ #@[ + 1&(i.~)@([ E. ])

allomask=:[: (*./\. +. *./\) =

allotrim=:] #~ [: -. [: (*./\. +. *./\) =

alltrim=:] #~ [: -. [: (*./\. +. *./\) ' '&=

allwhitetrim=:] #~ [: -. [: (*./\. +. *./\) ] e. (9 10 13 32{a.)"_

antimode=:3 : 0

NB.*antimode v-- finds the least frequently occurring  item(s) in
NB. a list.
NB.
NB. monad:  ul =. antimode ul
NB.
NB.   antimode ?.500#100
NB.   antimode ;:'blah blah blah yada yada wisdom'


if. 0 < # y =. ,y do.    NB. no antimodes for null lists
  f =. #/.~ y            NB. nub frequency
  (~. y) #~ f e. <./ f   NB. lowest frequency items
else. y
end.
)

append=:1!:3 ]`<@.(32&>@(3!:0))

apply=:128!:2

arccos=:_2&o.

arccosh=:_6&o.

arcsin=:_1&o.

arcsinh=:_5&o.

arctan=:_3&o.

arctanh=:_7&o.

assert=:0 0"_ $ 13!:8^:((0: e. ])`(12"_))

atags=:'<'&,@,&' ' ; '</'&,@,&'>'

atomfrl=:{.^:((,1) -: $)

attrvalue=:'"'"_ beforestr ([ , '="'"_) afterstr '>'"_ beforestr ]

bcfd=:2&#.@('01'&i.)^:_1

beforelaststr=:] {.~ 1&(i:~)@([ E. ])

beforestr=:] {.~ 1&(i.~)@([ E. ])

belongstrs=:4 : 0

NB.*belongstrs v-- select sublists between  nonnested delimiters
NB. retaining delimiters.
NB.
NB. dyad:  blcl =. (clStart;clEnd) belongstrs cl
NB.        blnl =. (nlStart;nlEnd) belongstrs nl
NB.
NB.   ('start';'end') belongstrs 'start yada yada end boo hoo start ahh end'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) belongstrs 1 1 66 666 2 2 7 87 1 1 0 2 2

's e'=. x
llst=. (s E. y) +. e E. y
mask=. ~:/\ llst
((mask#llst) <;.1 mask#y) ,&.> <e
)

bernoulli=:3 : 0

NB.*bernoulli v-- generate first N Bernoulli numbers.
NB.
NB. verbatim: see J wiki
NB.
NB. http://202.67.223.49/jwiki/Essays/Bernoulli_Numbers
NB.
NB. monad:  rl =. bernoulli iaN
NB.
NB.   bernoulli 13

b=. 1 _1r2
for_m. 2x*}.i.>.-:y do. b=. b,0,~(1+m)%~-+/b*(i.m)!1+m end.
}:^:(2|y) b
)

betweenidx=:4 : 0

NB.*betweenidx v-- indexed sublists between nonnested delimiters.
NB.
NB. Cuts  up  lists   containing   balanced  nonnested  start/end
NB. delimiters into boxed lists of indexed sublists.
NB.
NB. Note:  this  verb does a simple count for  delimiter balance.
NB. This  is  a   necessary  but  not  sufficient  condition  for
NB. delimiter balance.
NB.
NB. dyad:  (ilIdx ;< blcl) =. (clStart;clEnd) betweenidx cl
NB.        (ilIds ;< blnl) =. (nlStart;nlEnd) betweenidx nl
NB.
NB.   ('start';'end') betweenidx 'start yada yada end boo hoo start ahh end'
NB.
NB.   '{}' betweenidx 'go{ahead}{}cut{me}{up}{}'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) betweenidx 1 1 66 666 2 2 7 87 1 1 0 2 2

if. #y do.
  's e'=. x                      NB. start/end delimiters
  assert. -. s -: e              NB. they must differ
  em=. e E. y                    NB. end mask
  sm=. (-#s) |.!.0 s E. y        NB. start mask
  mc=. +/sm                      NB. middle count
  assert. mc=+/em                NB. delimiter balance
  c=. (1 (0)} sm +. em) <;.1 y   NB. cut list

  NB. insert any missing middles to insure all indexed
  NB. sublists correspond to a location in the cut list
  ex=. 1 #~ >: +: mc
  ex=. (-. sm {.;.1 em) (>: +: i. mc)} ex
  c=. ex #^:_1 c

  ((# i.@#) (#c)$0 1);<c         NB. prefix indexes
else.
  (i.0);<y                       NB. empty arg result
end.
)

betweenidx2=:4 : 0

NB.*betweenidx2    v--   indexed   sublists   between   nonnested
NB. delimiters.
NB.
NB. Cuts  up   lists   containing  balanced  nonnested  start/end
NB. delimiters into boxed lists of indexed sublists.
NB.
NB. Slight  improvement on (betweenidx). This version immediately
NB. quits when no delimiters are found and the empty argument and
NB. no tags  found  result now  has the same  boxing structure as
NB. nonnull results.
NB.
NB. Note: this  verb does a simple  count for delimiter  balance.
NB. This  is  a  necessary  but  not   sufficient  condition  for
NB. delimiter balance.
NB.
NB. dyad:  (ilIdx ;< blcl) =. (clStart;clEnd) betweenidx2 cl
NB.        (ilIds ;< blnl) =. (nlStart;nlEnd) betweenidx2 nl
NB.
NB.   ('start';'end') betweenidx2 'start yada yada end boo hoo start ahh end'
NB.
NB.   '{}' betweenidx2 'go{ahead}{}cut{me}{up}{}'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) betweenidx2 1 1 66 666 2 2 7 87 1 1 0 2 2

if. #y do.
  's e'=. x                      NB. start/end delimiters
  assert. -. s -: e              NB. they must differ
  em=. e E. y                    NB. end mask

  NB. quit if no delimiters
  if. -.1 e. em do. (i.0);<<y return. end.

  sm=. (-#s) |.!.0 s E. y        NB. start mask
  mc=. +/sm                      NB. middle count
  assert. mc=+/em                NB. delimiter balance
  c=. (1 (0)} sm +. em) <;.1 y   NB. cut list

  NB. insert any missing middles to insure all indexed
  NB. sublists correspond to a location in the cut list
  ex=. 1 #~ >: +: mc
  ex=. (-. sm {.;.1 em) (>: +: i. mc)} ex
  c=. ex #^:_1 c

  ((# i.@#) (#c)$0 1);<c         NB. prefix indexes
else.
  (i.0);<<y                      NB. empty arg result
end.
)

betweenstrs=:4 : 0

NB.*betweenstrs v-- select sublists between  nonnested delimiters
NB. discarding delimiters.
NB.
NB. dyad:  blcl =. (clStart;clEnd) betweenstrs cl
NB.        blnl =. (nlStart;nlEnd) betweenstrs nl
NB.
NB.   ('start';'end') betweenstrs 'start yada yada end boo hoo start ahh end'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) betweenstrs 1 1 66 666 2 2 7 87 1 1 0 2 2

's e'=. x
llst=. ((-#s) (|.!.0) s E. y) +. e E. y
mask=. ~:/\ llst
(mask#llst) <;.1 mask#y
)

betweenstrs2=:4 : 0

NB.*betweenstrs2    v--   select   sublists   between   nonnested
NB. delimiters.
NB.
NB. Original (betweenstrs)  - replaced by (betweenstrs)  which is
NB. faster and requires significantly less memory.
NB.
NB. dyad:  blcl =. (clStart;clEnd) betweenstrs2 cl
NB.        blnl =. (nlStart;nlEnd) betweenstrs2 nl
NB.
NB.   ('start';'end') betweenstrs2 'start yada yada end boo hoo start ahh end'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) betweenstrs2 1 1 66 666 2 2 7 87 1 1 0 2 2

's e'=. x
llst=. (s E. y) +. e E. y
mask=. ~:/\ llst
(#s) }.&.> (mask#llst) <;.1 mask#y
)

bfd=:2&#.@(0 1&i.)^:_1

blkaft=:3 : 0

NB.*blkaft v-- appends necessary blanks to J tokens.
NB.
NB. This verb appends some  necessary blanks to  J tokens so that
NB. raising  a token list and reparsing  produces  the same token
NB. list. A few unecessary blanks may be inserted.
NB.
NB. monad:  blkaft blcl
NB.
NB.   NB. line of J code
NB.   line=. 'c=. +./\"1 c > ~:/\"1 y. e. '''''''''
NB.   tokens=.  ;: line
NB.
NB.   NB. compare
NB.   (;: ; tokens) -: tokens
NB.   (;: ; blkaft tokens) -: tokens

NB. assume no blanks are required
r=. 0 #~ # y
t=. y

while.do.
 u=. ;: ;\ t
 v=. ~.&.>  ( <"1 |: u) -. L: 1  a:
 r=. r +. y e. ; {.&.> (1 < #&> v)#v

 if. y -: {: u do.
   NB. last tokenized row matches original
   break.
 else.
   NB. insert required blanks and reparse
   t=. ((r#t),&.>' ') (I. r)} t
 end.

end.

NB. insert required blanks and raise tokens
; ((r#y),&.>' ') (I. r)} y
)

bmi=:704.5"_ * ] % [: *: [

boxopen=:<^:(L. = 0:)

boxxopen=:<^:(L. < *@#)

bye=:2!:55

bytebits=:(8$2) #: a. i. ]

calendar=:3 : 0

NB.*calendar v-- calendar  for year as  12 element list. (y)  is
NB. one or more numbers: year, months.
NB.
NB. monad:  calendar ilYearMonths
NB.
NB.   calendar 2007   NB. full year
NB.   calendar 2007 7 NB. July only
NB.   calendar 2007 , >: i. 3   NB. first quarter

a=. ((j<100)*(-100&|){.6!:0'')+j=. {.y
b=. a+-/<.4 100 400%~<:a
r=. 28+3,(~:/0=4 100 400|a),10$5$3 2
r=. (-7|b+0,+/\}:r)|."0 1 r(]&:>:*"1>/)i.42
m=. (<:}.y),i.12*1=#y
h=. 'JanFebMarAprMayJunJulAugSepOctNovDec'
h=. ' Su Mo Tu We Th Fr Sa',:"1~_3(_12&{.)\h
<"2 m{h,"2[12 6 21 ($,) r{' ',3":1+i.31 1
)

calmoons=:3 : 0

NB.*calmoons v-- calendar dates of new and full moons. 0's denote
NB. new moons and 1's denote full moons.
NB.
NB. monad:  it =. calmoons ilYears
NB.
NB.   calmoons 1900 2000

NB. compute Julian dates and convert to calendar
j=. moons y
t=. fromjulian <. {. j

NB. attach new (0) and full (1) bits
j=. 0 [ t=. (, |: {: j) ,"0 1 ,/ t

NB. eliminate year overlap and duplicate dates
~. t #~  (1 {"1 t) e. y
)

cartfrpolar=:3 : 0

NB.*cartfrpolar  v--  cartesian coordinates (x, y, z)  from polar
NB. coordinates (r, theta, phi).
NB.
NB. monad:  cartfrpolar  ft
NB.
NB.  theta in [-90 deg, +90 deg]; phi in [-360 deg, +360 deg]

'r theta phi' =. |: y
rcst=. r * cosd theta
(rcst * cosd phi) ,"0 1 (rcst * sind phi) ,. r * sind theta
)

cd=:15!:0

cder=:15!:10

cderx=:15!:11

cdf=:15!:5

cfp=:+.@(r./)

changenqt=:4 : 0

NB.*changenqt v-- change not quoted.
NB.
NB. Similiar to (changestr) with the exception that J quoted text
NB. is not altered.
NB.
NB. dyad:  cl =. clReps changenqt cl
NB.
NB.   '/leave/quoted' changenqt 'leave '' leave these leave''s leave '

pairs=. 2 {."(1) _2 [\ <;._1 x      NB. change table
cnt=._1 [ lim=. # pairs
while. lim > cnt=.>:cnt do.         NB. process each change pair
  't c'=. cnt { pairs               NB. /target/change
  q=.~:/\ '''' = y                  NB. quote mask
  q=. q +. 0,}:q
  b=. t E. y                        NB. target mask
  if. +./b=. b *. -.q do.           NB. next if no target
    u=. I. b                        NB. target starts
    'l m'=. #&> cnt { pairs         NB. lengths
    p=. u + 0,+/\(<:# u)$ d=. m - l NB. change starts
    s=. * d                         NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # u)$ 1 0 #~ m,l-m) (,u +/ i. l)} b
      y=. b # y
      if. m = 0 do. continue. end.  NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d u} b            NB. first target char replicated
    end.
    y=.(c $~ m *# u) (,p +/i. m)} y  NB. insert replacements
  end.
end. y                              NB. altered string
)

changestr=:4 : 0

NB.*changestr v-- replaces substrings - see long documentation.
NB.
NB. dyad:  clReps changestr cl
NB.
NB.   NB. first character delimits replacements
NB.   '/change/becomes/me/ehh' changestr 'blah blah ...'

pairs=. 2 {."(1) _2 [\ <;._1 x      NB. change table
cnt=._1 [ lim=. # pairs
while. lim > cnt=.>:cnt do.         NB. process each change pair
  't c'=. cnt { pairs               NB. /target/change
  if. +./b=. t E. y do.             NB. next if no target
    r=. I. b                        NB. target starts
    'l q'=. #&> cnt { pairs         NB. lengths
    p=. r + 0,+/\(<:# r)$ d=. q - l NB. change starts
    s=. * d                         NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # r)$ 1 0 #~ q,l-q) (,r +/ i. l)} b
      y=. b # y
      if. q = 0 do. continue. end.  NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d r} b            NB. first target char replicated
    end.
    y=.(c $~ q *# r) (,p +/i. q)} y  NB. insert replacements
  end.
end. y                              NB. altered string
)

changetok=:4 : 0

NB.*changetok  v--  replaces  J name tokens within  a string. See
NB. long documentation.
NB.
NB. dyad:  clChanged =. clTokens changetok clStr
NB.
NB.   '/boo/hoo' changetok 'boo boo boohoo boohoo'

if. #pairs=. 2 {."(1) _2 [\ <;._1 x do.
  pairs=. pairs #~ _2 ~: (4!:0) {."1 pairs  NB. eliminate non-token pairs
end.
cnt=._1 [ lim=. # pairs
while. lim > cnt=. >:cnt do.         NB. process each change pair
  't c'=. cnt { pairs                NB. /target/change (*)=. t c
  if. +./b=. t E. y do.              NB. next if no targets
    u=. I. b                         NB. target starts
    'l m'=. #&> cnt { pairs          NB. lengths (*)=. l m
    q=. (u { ' ' , y) e. NAMEALPHA        NB. head chars
    r=. ((u + l) { y , ' ') e. NAMEALPHA  NB. tail chars
    u=. u #~ -. q +. r               NB. eliminate embedded tokens
    if. 0 = #u do. continue. end.    NB. next if no targets
    b=. 1 u} 0 #~ # b                NB. reset target mask
    p=. u + 0,+/\(<:# u)$ d =. m - l   NB. change starts
    s=. * d                          NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # u)$ 1 0 #~ m,l-m) (,u +/ i. l)} b
      y=. b # y
      if. m = 0 do. continue. end.   NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d u} b             NB. first target char replicated
    end.
    y=. (c $~ m *# u) (,p +/i. m)} y  NB. insert replacements
  end.
end. y                               NB. altered string
)

charsub=:4 : 0

NB.*charsub v-- single character pair replacements.
NB.
NB. dyad:  clPairs charsub cu
NB.
NB.   '-_$ ' charsub '$123 -456 -789'

'f t'=. ((#x)$0 1)<@,&a./.x
t {~ f i. y
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


citemize=:,:^:(2 > #@$)

cos=:2&o.

cosd=:cos@rfd

cosh=:6&o.

crc=:128!:3

ctl=:}.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@]))

cutnestidx=:4 : 0

NB.*cutnestidx v-- cut list into nested runs and other.
NB.
NB. Nested runs are delimited by begin and end tags. This verb is
NB. oriented toward XML parsing where typical begin  end tags are
NB. <ul>  </ul>  and tags  with  attributes  like: <hoo  boy="2">
NB. </hoo>
NB.
NB. This verb can process numeric lists but care must be taken to
NB. insure the pad item (1{.0$y) does  not  match begin  and  end
NB. values.
NB.
NB. dyad:  (ilIdx ;< blcl) =. (clStart;clEnd) cutnestidx cl
NB.        (ilIdx ;< blnl) =. (nlStart;nlEnd) cutnestidx nl
NB.
NB.   xml=. 'yada <ol><li>one</li><ol><li>sub one</li></ol></ol> boo'
NB.   ('<ol';'</ol>') cutnestidx xml
NB.
NB.   88 99 cutnestidx (i.5),88,(10?10),99 88 5 5 5 5 5 99

if. #y do.
  's e'=. ,&.> x                NB. start end lists
  ut=. 1{.0$y                   NB. padding
  assert. -.s -: e              NB. they must differ
  assert. -.(s -:ut) +. e-:ut
  sp=. s E. ut=.y,ut            NB. start mask

  NB. quit if no delimiters
  if. -.1 e. sp do. (i.0);<<y return. end.

  ep=. e E. ut                  NB. end mask
  assert. (+/sp) = +/ep         NB. basic balance
  dp=. sp + - ep                NB. start end marks
  assert. 0 *./ . <: +/\ dp     NB. nested balance
  ep=. I. _1=dp [ sp=. I. 1=dp  NB. start end indexes
  ut=. +/\dp -. 0               NB. scanned marks
  dp=. /:~ sp,ep                NB. all indexes
  sp=. (firstones 1<:ut)#dp     NB. starts of nested
  ep=. (#e)+(0=ut)#dp           NB. starts of other
  dp=. /:~ ~.0,sp,ep            NB. cut starts
  ut=. }: 1 dp} (>:#y)#0        NB. cut mask
  (dp i. sp);<ut <;.1 y         NB. nest indexes cut list
else.
  (i.0);<<y                     NB. empty arg result
end.
)

cutstridx=:4 : 0

NB.*cutstridx v-- cut list into (x) and other.
NB.
NB. dyad:  (ilIdx ;< blcl) =. clStr cutstridx cl
NB.
NB.   'CHOP' cutstridx 'CHOP CHOP me up CHOP ehh'

if. 1 e. b=. x E. ,y do. 
  sp=. I. b
  op=. (0 e. sp) }. 0,sp + #x
  op=. /:~ sp,op -. #y
  (op i. sp) ;< (1 op} b) <;.1 y
else. 
  (i.0);<<y 
end.
)

datefrint=:0 100 100&#:@<.

datefrnum=:0 100 100&#:@<.

dayage=:3 : 0

NB.*dayage v-- age in days.
NB.
NB. monad:  dayage ilYYYYMMDD
NB.
NB.   dayage 1953 7 2
NB.
NB. dyad:  pa dayage iaYYYYMMDD | iuYYYYMMDD
NB.
NB.   1 dayage 4 4$20000101 19500202 19000303
NB.   0 dayage 1986 8 14

0 dayage y
:
if. x do. n=. today~ 0 else. n=. today 0 end.
(x todayno n) - x todayno y
)

dayofweek=:(<;._1 ' Sunday Monday Tuesday Wednesday Thursday Friday Saturday')"_ {~ 7: | 1: + tojulian

dblquote=:'"'&,@:(,&'"')&.>

dbquote=:'"'&,@(,&'"')@(#~ >:@(=&'"'))

ddcheck=:ddcheck_jdd_

ddcnm=:ddcnm_jdd_

ddcol=:ddcol_jdd_

ddcon=:ddcon_jdd_

dddis=:dddis_jdd_

dderr=:dderr_jdd_

ddfch=:ddfch_jdd_

ddfet=:ddfet_jdd_

ddfrdms=:(60"_ #. ]) % 3600"_

ddsel=:ddsel_jdd_

ddsql=:ddsql_jdd_

ddsrc=:ddsrc_jdd_

ddtblx=:ddtblx_jdd_

debom=:] }.~ 3 * (239 187 191{a.) -: 3 {. ]

decomm=:3 : 0
                                                                 
NB.*decomm v--  removes comments  from j words. The (x) argument
NB. specifies whether all blank lines are removed or retained.   
NB.                                                              
NB. monad:  decomm ctWord                                        
NB.                                                              
NB.   decomm jcr 'decomm'  NB. decomment self                    
NB.                                                              
NB. dyad:  pa decomm ctWord                                      
NB.                                                              
NB.   1 decomm jcr 'decomm'  NB. remove blanks (default)         
NB.   0 decomm jcr 'decomm'  NB. retain all blank lines          
                                                                 
1 decomm y                                                      
:
NB. mask of unquoted comment starts                              
c=. ($y)$'NB.' E. ,y                                           
c=. +./\"1 c > ~:/\"1 y e. ''''                                 
y=. ,y                                                         
                                                                 
NB. blank out comments                                           
y=. ' ' (I. ,c)} y                                     
y=. y $~ $c                                                    
                                                                 
NB. remove blank lines - default                                 
if. x do. y #~ y +./ . ~: ' ' end.                            
)

dev=:-"_1 _ mean

dewhitejscript=:3 : 0

NB.*dewhitejscript  v--  removes  all  redundant  blanks  from  J
NB. scripts.
NB.
NB. monad:  dewhitejscript cl
NB.
NB.   dewhitejscript read 'c:\any\j\script.ijs'

NB. replace any tabs with single blanks
y=. ' ' (I. y=TAB)} y

NB. remove blank lines and all comments from script
y=. ;:&.> <"1 decomm ];. _1 LF,y-.CR

NB. remove redundant blanks in code
; (blkaft&.> y) ,&.> <CRLF
)

dfb=:2&#.@(0 1&i.)

dfbc=:2&#.@('01'&i.)

dfh=:16&#.@('0123456789ABCDEF'&i.)

dfr=:*&57.295779513082323

discreterandom=:4 : 0

NB.*discreterandom   v--   random   numbers   from   a   discrete
NB. distribution.
NB.
NB. dyad:  ftValuesProbs discreterandom iaTrials
NB.
NB.  (x) is a 2-row floating matrix where
NB.    0{x is discrete values
NB.    1{x is corresponding probabilities
NB.
NB.  (0 1 2 3 ,: 0.85 0.05 0.05 0.05) discreterandom 100

v=. 0{x
p=. 1{x
f=. 0,+/\p%+/p
l=. #f
r=. /:f,randunif y
s=. +/\l>r
r=. s r } r
v {~ <:l}.r
)

dmsfrdd=:<. ,. 60 60 #: 3600 * 1 | ,

dollars1913=:0.047747200277801889 * ]

dollars1970=:0.18713044149279931 * ]

dstat=:3 : 0

NB.*dstat v-- descriptive statistics
NB.
NB. monad: ct =. dstal nl
NB.
NB.   dstat  ?.1000#100
NB.
NB. dyad:  ct =.  faRound dstat nl
NB.
NB.   0.1 dstat  ?.1000#100

0.0001 dstat y
:
t=. '/sample size/minimum/maximum/1st quartile/2nd quartile/3rd quartile/first mode'
t=. t , '/first antimode/mean/std devn/skewness/kurtosis'
min=. <./ 
max=. >./
t=. ,&':  ' ;._1 t
v=. $,min,max,q1,median,q3,({.@mode2),({.@antimode),mean,stddev,skewness,kurtosis
t,. ": x round ,. v , y
)

dtslash=:] }.~ [: - '\' = {:

dupmask=:] e. ] #~ [: -. ~:

each=:&.>

earthdist=:4 : 0

NB.*earthdist v-- distance in km between n points on the Earth's surface.
NB.
NB. dyad:  (fl | ft) earthdist (fl | ft)
NB. 
NB.   NB. Paris longitude, latitude
NB.   NB. ddfrdms computes decimal degrees from degree, minutes, seconds
NB.   l1     =. ddfrdms _2 _20 _14    NB.  2d 20m 14s (East)
NB.   theta1 =. ddfrdms 48 50 11      NB. 48d 40m 11s (North)
NB.
NB.   NB. Washington
NB.   l2     =. ddfrdms 77 3 56       NB. 77d  3m 56s (West)
NB.   theta2 =. ddfrdms 38 55 17      NB. 38d 55m 17s (North)
NB.
NB.   NB. rounded to 2 decimals matches Meeus
NB.   6181.63 = ". '0.2' 8!:2 (l1,theta1) earthdist l2,theta2
NB.
NB.   NB. table arguments
NB.   (|: 5 # ,: l1,theta1) earthdist |: 5 # ,: l2,theta2

a=.  6378.14      NB. Earth's mean radius (km)
fl=. % 298.257    NB. Earth's flattening (a * 1 - fl) is polar radius

NB. zero distances mask
b=.  *./ x = y

NB. longitudes and latitudes in decimal degrees
NB. western longitudes +, northern latitudes +
NB. (*)=. l1 l2 theta1 theta2
'l1 theta1'=.  x [ 'l2 theta2'=. y

f=.      rfd -: theta1 + theta2
g=.      rfd -: theta1 - theta2
lambda=. rfd -: l1 - l2

sqrsin=. *: @ sin
sqrcos=. *: @ cos

sinlam=.  sqrsin lambda [ coslam=. sqrcos lambda
sqrcosg=. sqrcos g [ sqrsing=. sqrsin g
sqrsinf=. sqrsin f [ sqrcosf=. sqrcos f

s=. (coslam * sqrsing) + sinlam * sqrcosf
c=. (coslam * sqrcosg) + sinlam * sqrsinf

omega=. arctan %: s % c
r3=. 3 * (%: s * c) % omega
d=.  +: omega * a
h1=. (<: r3) % +: c
h2=. (>: r3) % +: s

NB. required distance
d=. d * (>: fl*h1*sqrsinf*sqrcosg) - fl*h2*sqrcosf*sqrsing

NB. handle any zero distances
if. +./ b do.
  NB. cannot do b*d as d is undefined _. for zero distances
  if. #$ d do. 0 (I. b)} d elseif. b do. 0 elseif. 1 do. d end.
else.
  d
end.
)

easter=:3 : 0

NB.*easter  v-- calculates  the date of  Easter  using the church
NB. algorithm.
NB.
NB. The  church  algorithm  is  a  close  approximation  of   the
NB. astronomical method  of computing the  date of Easter. Easter
NB. is the  first Sunday  after the  first  full  moon  after the
NB. spring solstice.
NB.
NB. monad: itMNDD =. easter ilYears
NB.
NB.   easter 2001
NB.   easter 2001 + i. 100


NB. invalid before 1583
assert. 1583 <: <./ y

NB. vector J                                scalar Basic
y1=. y % 19                           NB.  Y1=Y/19
a=. <. 0.001 + 19 * 1 | y1            NB.  A=INT((Y1-INT(Y1))*19+.001)
b=. <. b1=. y % 100                   NB.  B1=Y/100: B=INT(B1)
c=. <. 0.001 + 100 * 1 | b1           NB.  C=INT((B1-INT(B1))*100+.001)
d=. <. d1=. b % 4                     NB.  D1=B/4: D=INT(D1)
e=. <. 0.001 + 4 * 1 | d1             NB.  E=INT((D1-INT(D1))*4+.001)
f=. <. 0.001 + 25 %~ b + 8            NB.  F=INT(((B+8)/25)+.001)
g=. <. (>: b - f) % 3                 NB.  G=INT((B-F+1)/3)
h1=. 30 %~ 15 + g -~ d -~ b + 19*a    NB.  H1=(19*A+B-D-G+15)/30
h=. <. 0.001 + 30 * 1 | h1            NB.  H=INT((H1-INT(H1))*30+.001 )
i=. <. c1=. c % 4                     NB.  C1=C/4: I=INT(C1)
k=. <. 0.001 + 4 * c1 - i             NB.  K=INT((C1-I)*4+.001)
l1=. 7 %~ k -~ h -~ 32 + 2*i + e      NB.  L1=(32+2*E+2*I-H-K)/7
l=. <. 0.001 + 7 * 1 | l1             NB.  L=INT((L1-INT(L1))*7+.001)
m=. <. 451 %~ a + (11*h) + 22*l       NB.  M=INT((A+11*H+22*L)/451)
n=. <. n1=. 31 %~ 114 + (h+l) - 7*m   NB.  N1=(H+L-7*M+114)/31: N=INT(N1)
p=. <.0.001 + 31 * n1 - n             NB.  P=INT((N1-N)*31+.001)
n ,: >: p                             NB.  result is month & day numbers
)

eletags=:4 : 0

NB.*eletags v-- encloses xml text (y) in xml element tag.
NB.
NB. dyad:  clTag eletags clXml

tag=. alltrim x
'<',tag,'>',y,'</',tag,'>'
)

empty=:(i.0 0)"_

emptyshow=:[: (i.0 0)"_ ] [ 1!:2&2

enquote=:'"' , '"' ,~ ] #~ [: -. [: (*./\. +. *./\) ' '&=

epsfrps=:3 : 0

NB.*epsfrps   v--  convert  postscript   (ps)   to   encapsulated
NB. postscript (eps).
NB.
NB. Many simple postscript files can be converted to encapsulated
NB. postscript with this simple hack. The postscript generated by
NB. the graphviz addon can be  converted with this verb. WARNING:
NB. this type of hack will not work for most postscript files and
NB. may stop working for graphviz outputs in the future.
NB.
NB. monad:  clPathfileEPS =. epsfrps clPathfilePs

'missing .ps file extension' assert  1 e. '.ps' E. y

ps=. read y                                 NB. get postscript PS
eps=. '%!PS-Adobe-3.0 EPSF-3.0',CRLF,ps     NB. instant EPS
epsfile=. ('.eps' ,~ '.'&beforelaststr) y   NB. eps file
eps write epsfile                           NB. save eps data
epsfile                                     NB. file name result
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


erase=:[: 4!:55 ;: ::]

error=:13!:8&101

factors=:(*/ .^"1 (#: i.@(*/))@:>:)/@(__&q:)

fappend=:([: , [) (#@[ [ 1!:3) ::(_1:) [: fboxname ]

fboxname=:([: < 8 u: >) ::]

fc=:3!:5

fch=:4 : 0

NB.*fch v-- ddfch sql data.
NB.
NB. dyad:  blut =. clSql fch iaCh

NB. require 'dd' !(*)=. ddsel ddfch
'cannot select data' assert 0<s=. x ddsel y
'cannot fetch data'  assert -. _1-:d=. ddfch s,_1
d
)

ferase=:1!:55 ::(_1:)@(fboxname&>)@boxopen

fet=:4 : 0

NB.*fet v-- ddfet sql data.
NB.
NB. dyad:  bt =. clSql fet iaCh

NB. require 'dd' !(*)=. ddsel ddfet
'cannot select data' assert 0<s=. x ddsel y
'cannot fetch data'  assert -. _1-:d=. ddfet s,_1
d
)

fexist=:1:@(1!:4) ::0:@(fboxname&>)@boxopen

fgr=:3 : 0

NB.*fgr v-- find group root words
NB.
NB. monad:  clRoots=. fgr clGroup

NB. require 'jod' !(*)=. badrc_ajod_ ok_ajod_ jderr_ajod_ grp usedby
if. badrc_ajod_ gn=. grp y do. gn return. else. gn=. }.gn end.

rn=. gn -."1 0~ gn usedby"0 1 gn
if. *./ mask=. ;0 {"1 rn do.
 gn=. /:~ ~. gn #~ 0=#&> 1 {"1 rn
 rw=. 'ROOTWORDS',alltrim y
 NB. return in form ready to store in jod
 'pr ',(quote rw),LF,rw,'=: ',(5!:5) <'gn'
else.
 (jderr_ajod_ 'usedby errors'),<(-. mask)#rn
end.
)

firstone=:] > [: }: 0: , ]

firstones=:> (0: , }:)

firstones2=:> |.!.0

fmtswex=:3 : 0

NB.*fmtswex v-- format short comments for inclusion in header comments.
NB.
NB. monad:  cl =. fmtswex blNames
NB.
NB.   get 'ROOTSwaypoints' [ od ;:'gps utils' [ 3 od''
NB.   fmtswex ROOTSwaypoints   

NB. require 'general/jod' !(*)=. fsen
t=. >&.> <"1 |: fsen&> y
ctl 'NB. ' ,"1 ((0 pick t) ,"1 '  - ') ,. 1 pick t
)

fob=:([: > [ {~ [: < 1 ; (0 { [) i. [: < ]) ::('noun fetch error' (13!:8) 255"_)

freq=:~. ; #/.~

freqdist=:~.@] ,: #/.~

freqlist=:~. ,: [: <"0 #/.~

fromascii85=:3 : 0

NB.*fromascii85 v-- decode ASCII85 representation.
NB.
NB. Inverse of (toascii85).
NB.
NB. monad:  cl =. fromascii85 clA85

r=. ,y
r=. a.i.r
r=. (r > 32) # r
r=. (2 * (a.i.'<~') -: 2 {. r) }. r
r=. (-2 * (a.i.'~>') -: _2 {. r) }. r
m=. r = a.i.'z'
r=. r - 33
r=. 0 (I.m) } r
r=. (1+4*m) # r
b=. 5 | #r
r=. r,84 #~ b{ 0 4 3 2 1
r=. a.{~ ,(4#256) #: 85 #. _5 [\ r
r }.~ - b { 0 0 3 2 1
)

frombase64=:3 : 0

NB.*frombase64  v--  from  base  64  representation  -  inverse  of
NB. tobase64.
NB.
NB. verbatim: source convert/misc/base64 addon
NB.
NB. monad: cl =. frombase64 clB64
NB.
NB.   frombase64 tobase64 'encode me'

pad=. _2 >. (y i. '=') - #y
pad }. a. {~ #. _8 [\ , (6#2) #: BASE64 i. y
)

fromjulian=:3 : 0

NB.*fromjulian v-- converts Julian day numbers to dates, converse
NB. (tojulian).
NB.
NB. monad:  itYYYYMMDD =. fromjulian nlJulian
NB.
NB.   juldayno=. 1 tojulian 17770704 19530702 20000101 20331225
NB.   fromjulian juldayno
NB.
NB. dyad:  i[1,2]YYYYMMDD =. fromjulian nlJulian
NB.
NB.   0 fromjulian juldayno   NB. monad
NB.   1 fromjulian juldayno

0 fromjulian y
:
NB. Gregorian Calendar correction
b=.      2299161 <: y
jalpha=. <. 36524.25 %~ _0.25 + y - 1867216
ja=.     (y * -. b) + b * y + 1 + jalpha - <. 0.25 * jalpha

jb=. ja + 1524
jc=. <. 6680.0 + ((jb - 2439870) - 122.1) % 365.25
jd=. <. (365 * jc) + 0.25 * jc
je=. <. (jb - jd) % 30.6001

id=. (jb - jd) - <. 30.6001 * je
mm=. je - 1
mm=. mm - 12 * mm > 12

iyyy=. jc - 4715
iyyy=. iyyy - mm > 2
iyyy=. iyyy - iyyy <: 0

NB. convert result format
if. x do. 100 #. |: iyyy , mm ,: id  else. |: iyyy , mm ,: id end.
)

fsize=:1!:4 ::(_1:)@(fboxname&>)@boxopen

fuserows=:>@((>@[ ,"1 >@])/)

fwrite=:([: , [) (#@[ [ 1!:2) ::(_1:) [: fboxname ]

geomean=:# %: */

getele=:] belongstrs~ [: tags [: alltrim [

geteleattr=:] belongstrs~ [: atags [: alltrim [

geteleattrtext=:[: '>'&afterstr&.> ] betweenstrs~ [: atags [: alltrim [

geteletext=:] betweenstrs~ [: tags [: alltrim [

geteletextidx=:] betweenidx~ [: tags [: alltrim [

getnum=:3 : '".;._2 [ 0 : 0'

gspn=:3 : 0

NB.*gspn v-- get short path file name.
NB.
NB. Proof positive that  some  useful  code can be extracted from
NB. the  JCE monster. This little  snippet uses the winapi to get
NB. the short path file 8.3 dos name from long file names.
NB.
NB. monad:  clShort =. gspn clPathpat
NB.
NB.   gspn 'verylongfilename.ehh'
NB.
NB.   NB. use with dir verb
NB.   gspn&> 1 dir 'c:\pictures\2007\365\*.*'

first=. >@{.
snd=. 1&pick
empty=. ''"_
res=. 0&pick >@{. 2&pick f.
a=. (empty`a1)@.(0"_ <: first)
dropoldresbufandappendnewone=. (1&|.)@: (] ,  <@:(#&'*') @: (>@{.) ) @: }: @: }:
a1=. (res`(a@:gsp@:dropoldresbufandappendnewone))@.(first > 3&pick) 							
gsp=. ('kernel32 GetShortPathNameA i *c *c i'&cd)
c=. ( ; (#&'*' ; ])&(>:@:#) )		
a@:gsp@:c y
)

harmean=:mean&.%

hfd=:16&#.@('0123456789ABCDEF'&i.)^:_1

hfd2=:'0123456789abcdef' {~ 16 #.^:_1 ]

histogram=:<:@(#/.~)@(i.@#@[ , I.)

histogram2=:<:@(#/.~)@(i.@>:@#@[ , |.@[ (#@[ - I.) ])

hmsfrdds=:24 60 60&#:

host=:[: 2!:0 '('"_ , ] , ' || true)'"_

huo=:<.@-:^:(0 = 2&|)^:a:

ic=:3!:4

ifc=:3 : 0

NB.*ifc v-- format interface comment text.
NB.
NB. Looks up interface  words  of a  group  and formats  text for
NB. insertion into group headers and postprocessors.
NB.
NB. monad:  ifc clGroupName
NB. dyad:   iaOption ifc clGroupName

1 ifc y
:
NB. require 'jod' !(*)=. badrc_ajod_ get jderr_ajod_ badcl_ajod_
if. badcl_ajod_ y do. jderr_ajod_ 'invalid group name' return.
else.
  iface=. 'IFACEWORDS',alltrim y
end.

NB. set comment style (header, postprocessor)
cpx=. ;(x-:1){ (<'NB.  ';' - '),<'NB. ';'  NB. '

NB. define interface list in jod scratch locale
NB. !(*)=. SO__JODobj erase__SO__JODobj locsfx_ajod_ nl__SO__JODobj
if. badrc_ajod_ rc=. (;SO__JODobj) get iface   do. rc   return.
elseif.  ilist=. ".iface , ;locsfx_ajod_ ;SO__JODobj
         erase__SO__JODobj nl__SO__JODobj i. 4
         badrc_ajod_ rc=. 0 8 get /:~ ~.ilist  do. rc return.
elseif.  0=#txt=. >1{rc do. jderr_ajod_ 'no interface words' return.
elseif.do.
   ctl fuserows >&.> <"1 |: ((#txt)#,:cpx) ,&.> txt
end.
)

intersect=:[: ~. ] -. ] -. [

intfrdate=:0 100 100&#.@:<.

isatom=:0 = #@$

isboxed=:32&=@(3!:0)

ischar=:2&=@(3!:0)

iscomplex=:16"_ = 3!:0

isfloat=:8"_ = 3!:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


isint=:1 4 e.~ 3!:0

isnan=:128!:5

isopen=:32&~:@(3!:0)

isotimestamp=:3 : 0

NB.*isotimestamp v-- format time as: YYYY-MM-DD HR:MN:SC.ddd
NB.
NB. Yet another timestamp formart. (y) is one or more time stamps
NB. in 6!:0 format.
NB.
NB. monad: cl =. isotimestamp nlTime
NB.        ct =. isotimestamp ntTime
NB.
NB.   isotimestamp 6!:0 ''
NB.
NB.   isotimestamp 10 # ,: 6!:0 ''  NB. table

r=. }: $y
t=. _6 [\ , 6 {."1 y
d=. '--b::' 4 7 10 13 16 }"1 [ 4 3 3 3 3 3 ": <.t
d=. d ,. }."1 [ 0j3 ": ,. 1 | {:"1 t
c=. {: $d
d=. ,d
d=. '0' (I. d=' ')} d
d=. ' ' (I. d='b')} d
(r,c) $ d
)

isunicode=:131072"_ = 3!:0

isunique=:[: -. 0 e. ~:

jcr=:[: ];._1 (10{a.) , [: 5!:5 <

jpathsep=:'/'&(('\' I.@:= ])})

jtslash=:'/'&(('\' I.@:= ])})@(] , ('/\'"_ e.~ {:) }. '/'"_)

julfrcal=:3 : 0

NB.*julfrcal v-- Julian dates from calendar dates.
NB.
NB. Astronomical Julian date. Similiar to (tojulian)  but handles
NB. the fact that Julian days start at noon rather than  midnight
NB. for calendar days.
NB.
NB. monad:  fl =. julfrcal ilYYYYMMDD | itYYYYMMDD
NB.
NB.   julfrcal 2001 9 11
NB.   julfrcal 1776 1941 1867 , 7 12 7 ,: 4 7 1
NB.
NB.   NB. zero date is roughly the age of the oldest bristlecone pines (coincidence?)
NB.   julfrcal -4711 10 29.5   

NB. vector J                       NB.  scalar BASIC
'y m d'=. y                        NB.  INPUT "Y,M,D ";Y,M,D
g=. 1582 <: y                      NB.  G=1: IF Y<1582 THEN G=0
f=. (d - d1) - 0.5 [ d1=. <. d     NB.  D1=INT(D): F=D-D1-0.5
j=. - <. 7 * 4 %~ <.y + 12 %~ m+9  NB.  J=-INT(7*(INT((M+9)/12)+Y)/4)
                                   NB.  IF G=0 THEN 805
s=. * m-9 [ a=. | m-9              NB.  S=SGN(M-9): A=ABS(M-9)
j3=. <. y + s * <. a%7             NB.  J3=INT(Y+S*INT(A/7))
j3=. - <. 3r4 * >: <. j3 % 100     NB.  J3=-INT((INT(J3/100)+1)*3/4)
j=. j + (<.275 * m%9) + d1 + g*j3  NB. 805  J=J+INT(275*M/9)+D1+G*J3
j=. j + 1721027 + (2*g) + 367*y    NB.  J=J+1721027+2*G+367*Y
b=. f >: 0                         NB.  IF F>=0 THEN 825
f=. f + b [ j=. j - b              NB.  F=F+1: J=J-1
f + j
)

justdrv=:[: }: ] #~ [: +./\. ':'&=

justdrvpath=:[: }: ] #~ [: +./\. '\'&=

justext=:''"_`(] #~ [: -. [: +./\. '.'&=)@.('.'&e.)

justfile=:(] #~ [: -. [: +./\ '.'&=)@(] #~ [: -. [: +./\. e.&':\')

justfileext=:] #~ [: -. [: +./\. '\'&=

justpath=:[: }: ] #~ ([: -. [: +./\. ':'&=) *. [: +./\. '\'&=

jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. monad:  na =. jvn uuIgnore

NB. J version number
ver=. 9!:14 ''
ver=. (ver e. '0123456789/')#ver

NB. return version 6.01 if string is not numeric
100 %~ , 601 ". (ver i. '/') {. ver
)

jvr=:] , '=: ' , [: 5!:5 <

kurtosis=:# * +/@(^&4)@dev % *:@ssdev

lastone=:] > [: }. ] , 0:

lastones=:> 1&(|.!.0)

leap=:$ $ [: -/ 0 = 4 100 400 4000 |/ ,

lfp=:#;.1

ljerr=:13!:12

ljust=:' '&$: :(] |."_1~ i."1&0@(] e. [))

lsfit=:3 : 0

NB.*lsfit v-- coefficients of polynomial fitting data points.
NB.
NB. Least squares  polynomial  curve fit.  (y)  is  a two  column
NB. matrix of X, Y. (x) is polynomial order (default 1 - line).
NB.
NB. monad:  lsfit ftXY
NB.
NB.   'intercept slope'=. lsfit (i. 10) ,. >: i. 10   NB. regression line: x + 1
NB.
NB. dyad:  n lsfit ftXY
NB.
NB.   2 lsfit (i. 10) ,. >: *: i. 10  NB. parabola: (x^2) + 1

1 lsfit y
:
'ax ay'=. |: y
ay%.ax^/i.>:x
)

ltrim=:] #~ [: -. [: *./\ ' '"_ = ]

lut=:3 : 0

NB.*lut v-- load local utilities locale (ijod) and make words base available.
NB.
NB. monad:  lut clWord | blclWords
NB. dyad:   clLocale lut clWord | blclWords

'ijod' lut y
:
NB. require 'jod' !(*)=. getrx badrc_ajod_ cocurrent coinsert
if. badrc_ajod_ rc=. x getrx y do. rc
else.
  NB. coinsert x [ cocurrent 'base' 
  rc
end.
)

md5fromstring=:3 : 0

NB.*md5fromstring v-- computer md5 hash from character list.
NB.
NB. monad:  md5fromstring cl

y write TEMPFILE0

NB. requires md5 on shell path !(*)=. shell
32{.shell 'md5.exe -l ',TEMPFILE0
)

mean=:+/ % #

median=:-:@(+/)@((<. , >.)@midpt { /:~)

mema=:15!:3

memf=:15!:4

memr=:15!:1

memw=:15!:2

midpt=:-:@<:@#

mode2=:3 : 0

NB.*mode2 v-- finds  the  most frequently occurring item(s) in  a
NB. list.
NB.
NB. monad:  ul =. mode2 ul
NB.
NB.   mode2 ?.500#100
NB.   mode2 ;:'I do what I do because I am what I am'

if. 0 < # y =. ,y do.     NB. null lists have no modes
  f =. #/.~ y             NB. nub frequency
  (~. y) #~ f e. >./ f    NB. highest frequency items
else. y
end.
)

monthsbetween=:4 : 0

NB.*monthsbetween v--  list of  month counts between two YYYYMMDD
NB. dates.
NB.
NB. dyad:  ilYYYYMMDD monthsbetween ilYYYYMMDD
NB.
NB.   2007 7 2 monthsbetween 2009 9 22

NB. order on year
 'x y'=. /:~  x,:y

if. 0=d=. (0{y) - 0{x  do. (1{y) - 1{x  else. (12-1{x),((d=1)}.(|<:d)#12),1{y end.
)

moons=:3 : 0

NB.*moons v-- times of new and full moons for n calendar years.
NB.
NB. The  result  is  rank 3 numeric array  where  ({.  moons) are
NB. Julian day numbers and ({: moons)  is  a  logical  mask  with
NB. (0)'s denoting new moons and (1)'s denoting full moons.
NB.
NB. monad:  ftJulian=. moons ilYears
NB.
NB.        moons 1996 1997 2002

NB.  vector J                         scalar Basic
y=. , y
r1=. 1r180p1                          NB.  R1=3.14159265/180
k0=. <. 12.3685 * y - 1900            NB.  K0=INT((Y-1900)*12.3685)
t=.  (y - 1899.5) % 100               NB.  T=(Y-1899.5)/100
t2=. *: t [ t3=. t^3                  NB.  T2=T*T: T3=T*T*T
j0=. 2415020 + 29 * k0                NB.  J0=2415020+29*K0
f0=. (0.0001178*t2) - 0.000000155*t3  NB.  F0=0.0001178*T2-0.000000155*T3
f0=. f0 + 0.75933 + 0.53058868*k0     NB.  F0=F0+0.75933+0.53058868*K0
f0=. (f0-(0.000837*t))-0.000335*t2    NB.  F0=F0-0.000837*T-0.000335*T2
m0=. k0 * 0.08084821133               NB.  M0=K0*0.08084821133
m0=. 359.2242 + 360 * 1 | m0          NB.  M0=360*(M0-INT(M0))+359.2242
m0=. m0 - 0.0000333*t2                NB.  M0=M0-0.0000333*T2
m0=. m0 - 0.00000347*t3               NB.  M0=M0-0.00000347*T3
m1=. k0 * 0.07171366128               NB.  M1=K0*0.07171366128
m1=. 306.0253 + 360 * 1 | m1          NB.  M1=360*(M1-INT(M1))+306.0253
m1=. m1 + 0.0107306*t2                NB.  M1=M1+0.0107306*T2
m1=. m1 + 0.00001236*t3               NB.  M1=M1+0.00001236*T3
b1=. k0 * 0.08519585128               NB.  B1=K0*0.08519585128
b1=. 21.2964 + 360 * 1 | b1           NB.  B1=360*(B1-INT(B1))+21.2964
b1=. b1 - 0.0016528*t2                NB.  B1=B1-0.0016528*T2
b1=. b1 - 0.00000239*t3               NB.  B1=B1-0.00000239*T3

NB. rank conjuntion vectorizes BASIC loop
k9=. i. 29                            NB.  FOR K9=0 TO 28
j=.  j0 +"1 0 ] 14*k9                 NB.  J=J0+14*K9
f=.  f0 +"1 0 ] 0.765294*k9           NB.  F=F0+0.765294*K9
k=.  k9 % 2                           NB.  K=K9/2
m5=. r1 * m0 +"1 0 k*29.10535608      NB.  M5=(M0+K*29.10535608)*R1
m6=. r1 * m1 +"1 0 k*385.81691806     NB.  M6=(M1+K*385.81691806)*R1
b6=. r1 * b1 +"1 0 k*390.67050646     NB.  B6=(B1+K*390.67050646)*R1
f=.  f - 0.4068 * sin m6              NB.  F=F-0.4068*SIN(M6)
f=.  f + (0.1734 - 0.000393*t) *"1 1 sin m5   NB. F=F+(0.1734-0.000393*T)*SIN(M5)
f=.  f + 0.0161 * sin 2*m6            NB.  F=F+0.0161*SIN(2*M6)
f=.  f + 0.0104 * sin 2*b6            NB.  F=F+0.0104*SIN(2*B6)
f=.  f - 0.0074 * sin m5-m6           NB.  F=F-0.0074*SIN(M5-M6)
f=.  f - 0.0051 * sin m5+m6           NB.  F=F-0.0051*SIN(M5+M6)
f=.  f + 0.0021 * sin 2*m5            NB.  F=F+0.0021*SIN(2*M5)
f=.  f + 0.0010 * sin m6 -~ 2*b6      NB.  F=F+0.0010*SIN(2*B6-M6)
j=.  j + f                            NB.  J=J+INT(F): F=F-INT(F)
u=.  0 1 $~ # k9                      NB. IF U=0 THEN PRINT " NEW MOON ";
j ,: |: (#y) # ,: u                   NB. IF U=1 THEN PRINT "FULL MOON ";
)

movgmean=:-@[ (# %: */)\ ]

movmean=:-@[ (+/ % #)\ ]

nc=:4!:0

nextversion=:] + 1r2"_ * 1: - ]

ngc=:3 : 0

NB.*ngc v-- new group class template.
NB.
NB. This verb runs through all the tasks required to turn a group
NB. into a self contained class file.  The default  postprocessor
NB. inserts the group's names into the base locale.
NB.
NB. monad:  ngc clGroupName
NB.
NB.   ngc 'mynewgroup'
NB.
NB. dyad:  iaOption ngc clGroupName
NB.
NB.   NB. update existing groups - resets any header or postpostprocessor
NB.   0 ngc 'mygroup'

1 ngc y
:
NB. require 'jod' !(*)=. dnl get grp put JSCRIPT_ajod_ badrc_ajod_ 
NB. !(*)=. jderr_ajod_ ok_ajod_ badcl_ajod_ badil_ajod_
if.     badil_ajod_ x do. jderr_ajod_ 'invalid option'     return.
elseif. badcl_ajod_ y do. jderr_ajod_ 'invalid group name' return.
elseif.do.
  gname=. alltrim y
  new=. 1={.x
end.

if. new *. (<gname) e. 2 dnl gname do. jderr_ajod_ 'group (',gname,') already exists' return.
elseif. badrc_ajod_ rc=. grp gname do. rc return.
elseif.do.
  glist=. }.rc
end.

NB. group header and postprocessor
if. badrc_ajod_ rc=. 1 get ;:'teststub poststub' do. rc return. else. 'rc ghp'=. rc end.

NB. group root and interface lists - create temp values
NB. in jod scratch locale and destroy after put
NB. !(*)=. SO__JODobj erase__SO__JODobj locsfx_ajod_ nl__SO__JODobj
irlists=. (;:'ROOTWORDS IFACEWORDS') ,&.> <gname
(irlists ,&.> locsfx_ajod_ SO__JODobj)=. irlists;<''
if.     badrc_ajod_ rc=. (;SO__JODobj) put irlists do. rc return.
elseif. desc=. ('root words (' ;'interface words (') ,. irlists
        desc=.irlists ,. <"1 ;"1 desc ,. <') group'
        badrc_ajod_ rc=. 0 8 put desc              do. rc return.
elseif.do.
  erase__SO__JODobj nl__SO__JODobj i. 4
end.

if. -.new do. irlists=. (~.irlists , glist) -. a: end.

NB. create/update group with lists
if. badrc_ajod_ rc=. grp gname;irlists do. rc return. end.

NB. group class header
author=. CLASSAUTHOR
head=. ;1{0{ghp
now=. ; |. 3 {. <;._1' ',timestamp ''
yynow=. 2 }. now
head=.('/{~T~}/',gname,'/{~D~}/',now,'/{~SD~}/',yynow,'/{~A~}/',alltrim author)changestr head
if. badrc_ajod_ rc=. 2 1 put gname;head do. rc return. end.

NB. group post processor !(*)=. POSTAMBLEPFX_ajodtools_
post=. ;1{1{ghp
post=. ('/{~T~}/',gname) changestr post
if. badrc_ajod_ rc=. 4 put (POSTAMBLEPFX_ajodtools_,gname);JSCRIPT_ajod_;post do. rc
else.
  ok_ajod_ 'class group with postprocessor created/updated ->';gname
end.
)

nlfrrle=:#~/@:|:

nlfrrle2=:([: ; <@#~/"1) :.rlefrnl

nob=:([: (] ,: ".&.>) ;: ::]) ::('noun pack error' (13!:8) 255"_) :[:

onelength=:(] > [: }: 0: , ]) +/;.1 ]

onfreqdist=:[: (] {"1~ [: \: 1 { ]) ~.@] ,: #/.~

pack=:[: (, ,&< ".)&> [: /:~ ;: ::]

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


parity=:~:/

parsecsv=:3 : 0

NB.*parsecsv v--  parses comma delimited  files. (x) is the field
NB. delimiter. Lines are delimited with either CRLF or LF
NB.
NB. monad:  btcl =. parsecsv cl
NB. dyad:   btcl =. ca parsecsv cl
NB.
NB.   ',' parsecsv read 'c:\comma\delimted\text.csv'


',' parsecsv y
:
'separater cannot be the " character' assert -. x -: '"'

NB. CRLF delimited *.csv text to char table
y=.  x ,. ];._2 y -. CR

NB. bit mask of unquoted " field delimiters
b=. -. }. ~:/\ '"' e.~  ' ' , , y
b=. ($y) $ b *. , x = y

NB. use masks to cut lines
b <;._1"1 y
)

parsetd=:[: <;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ ]

parsevolumes=:[: 3 5 10&{&> [: <;._1&.> ' ' ,&.> ]

patpartstr=:4 : 0

NB.*patpartstr v-- split list into sublists of pattern and non-pattern.
NB.
NB. dyad:  (ilIdx ;< blcl) =. clPattern patpartstr clStr
NB.
NB.   'hoo' patpartstr 'hoohoohoo'  
NB.   'ab.c' patpartstr   'abhc yada yada abNcabuc boo freaking hoo'
NB.   'nada' patpartstr 'nothing to match'
NB.
NB.   NB. result pattern indexes and split list
NB.   'idx substrs'=. 'yo[a-z]*'  patpartstr 'yo yohomeboy no no yoman'
NB.   idx{substrs  NB. patterns

NB. require 'regex' !(*)=. rxmatches
if. #pat=. ,"2 x rxmatches y do.
  mask=. (#y)#0
  starts=. 0 {"1 pat
  ends=. starts + <: 1 {"1 pat
  m1=. 1 (0,starts)} mask 
  m2=. _1 (|.!. 0) 1 ends} mask 
  m2=. m1 +. m2 
  mask=. 1 starts} mask
  idx=. (m2 {.;.1 mask) # i. +/m2       
  idx;< m2 <;.1 y
else.
  (i.0);<<y
end.
)

pfc=:({. , 6.2831853071795862&|@{:)@:(*.@(j./))

pfl=:[: ; {.&1&.>

pick=:>@{

pipechars=:[: 9!:7 '+++++++++!-'"_ [ ]

polyprod=:+//.@(*/)

portchars=:[: 9!:7 '+++++++++|-'"_ [ ]

postit=:]`,.@.(1&>:@(#@$))^:2

pwf=:3 : 0

NB.*pwf v-- write path dictionary words as script files.
NB.
NB. monad:  pwf clPattern
NB.
NB.   pwf 're'  NB. write path dictionary words with prefix 're'
NB.   pwf ''    NB. write all path dictionary words
NB.
NB. dyad:   clPath pwf clPattern
NB.
NB.   'c:/temp' pwf 'de' NB. write to given directory

'' pwf y
:
NB. JOD references !(*)=. dnl get badrc_ajod_ ok_ajod_ 
NB. !(*)=. isempty_ajod_ jpathsep_ajod_ makedir_ajod_ write_ajod_
pk=.  >@{                        
tsl=. ] , ('\'"_ = {:) }. '\'"_  
if. badrc_ajod_ ws=. 0 _1 dnl y        do. ws return. end.
if. badrc_ajod_ ws=. 0 10 get 1 pk ws  do. ws return. end.
NB. individual word scripts using short description text for tacits
if. badrc_ajod_ ws=. 0 0 1 wttext__MK__JODobj 1 pk ws  do. ws return. end.
try.
  NB. if (x) path is empty use put dictionary directory (alien\words)
  if. isempty_ajod_ x do.
    DL=. {:{.DPATH__ST__JODobj NB. !(*)=. DL
    NB. insure subdirectory when (x) is empty
    NB. when (x) is nonempty assume it exists
    makedir_ajod_ <jpathsep_ajod_ tsl x=. ALI__DL,'words'
  end.
  NB. write individual word files
  ws=. 1 pk ws
  wpf=. (<jpathsep_ajod_ tsl x) ,&.> (0 {"1 ws) ,&.> <'.ijs'
  ok_ajod_ wpf [ (toHOST&.> 1 {"1 ws) write_ajod_&.> wpf
catchd. jderr_ajod_ 'unable to write all word file(s)'
end.
)

q1=:median@((median > ]) # ]) ::_:

q3=:median@((median < ]) # ]) ::_:

quote=:''''&,@(,&'''')@(#~ >:@(=&''''))

randunif=:(? % <:)@:($&2147483647) :({.@[ + ({: - {.)@[ * $:@])

read=:1!:1&(]`<@.(32&>@(3!:0)))

readcsv=:','&$: :([: <;._2&> [ ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ [: 1!:1&(]`<@.(32&>@(3!:0))) ])

readcsvs=:','&$: :([: s:@<;._2&> [ ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ [: 1!:1&(]`<@.(32&>@(3!:0))) ])

readnoun=:3!:2@(1!:1&(]`<@.(32&>@(3!:0))))

readtd=:[: <;._1"1 (9{a.) ,. [: ];._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

readtd2=:[: <;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

readtd2s=:[: s:@<;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

readtdbom=:[: <;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ [: (] }.~ 3 * (239 187 191{a.) -: 3 {. ]) 1!:1&(]`<@.(32&>@(3!:0)))

readtds=:[: s:@:<;._1"1 (9{a.) ,. [: ];._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

readvtd=:3 : 0

NB.*readvtd v-- read variable length tab delimited files.
NB.
NB. Variable  length  TAB  delimited files are files  with  lines
NB. delimited by LF or CRLF and  items within lines  delimited by
NB. TAB  characters.  The first line item is associated with  all
NB. subsequent items. Lines with a leading item and no associated
NB. items are removed.
NB.
NB. monad:  btcl =. readvtd clPathFile
NB.
NB.   dat=. 'test',TAB,'me',LF,'again',LF, }: ;( ;:'oh that felt so so good') ,&.> TAB
NB.   dat write 'c:/temp/vte.txt'
NB.
NB.   readvtd 'c:/temp/vte.txt'

d=. ((<;._1)@:(TAB&,))&.> (<;._2 tlf (read y) -. CR) -. a:
((<: #&> d) # {.&> d) ,. ; }.&.> d
)

realpart=:{."1@+.

reb=:3 : 0

NB.*reb v-- removes redundant blanks - leading, trailing multiple
NB.
NB. monad:  reb cl
NB. dyad:  ua reb ul

' ' reb y
:
y=. x , y
b=. x = y
}.(b*: 1|.b)#y
)

rebc=:] #~ [: -. '  '&E.

rebrow=:] #~ [: -. [: *./"1 ' '&=

rebtbcol=:] #"1~ [: -. [: *./ [: *./\."1 ' '&=

rebu=:] #~ [: -. (2: # [) E. ]

refirstone=:-. +. firstone

remdotargs=:3 : 0

NB.*remdotargs  v--  replaces dotted J arguments in  scripts with
NB. undotted equivalents.
NB.
NB. J  6.01 changed explicit argument  syntax from x. y. m. n. u.
NB. v. to x y m  n u v. Like most incompatible J changes  the new
NB. scheme  is  better.   Unfortunately  changing  something   as
NB. fundamental  as argument syntax  forces a  massive inspection
NB. and modification of exsisting code. Simple search and replace
NB. can easily convert 95% of existing J code alas that remaining
NB. 5% is still going  to force you  to inspect almost every line
NB. of explicit J code.
NB.
NB. This verb  implements  a much  smarter search and replace  by
NB. using  J's own parsing  rules as  defined in  Roger's elegant
NB. word formation on lines (wfl) verb.
NB.
NB. monad:  cl =. remdotargs clJscript
NB.
NB.   scr=. read 'c:\joddictionaries\504\flickrut\script\flickrAPI.ijs'
NB.   'q s'=. remdotargs scr

NB. cut scripts into tokens - cuts into commented text
st=. wfl_z_ y

NB. remove blanks surrounding all tokens
bst=. alltrim&.> st

NB. find any current x y m n u v tokens and rename
lcn=. ;:'x y m n u v'
cnx=. I. bst e. lcn
lcnnew=. (cnx { bst) ,&.> <'789'  NB. ugly suffix
assert. -. +./lcnnew e. st
st=. lcnnew cnx} st

NB. find and replace unquoted arguments
dargs=. ;:'x. y. m. n. u. v.'
uqx=. I. bst e. dargs
st=. ((uqx{st) -.&.> '.') uqx} st

NB. does a string appear in a list of strings
mch=. [: +./&> E.L:0

NB. for quoted strings inspection is a 
NB. necessary but we can narrow the context 
qst=. st {~ I. (<'''''') = ({. , {:) &.> st
qdots=. dargs ,. (I.&.> <"1 dargs mch"0 1 qst) {&.> <qst

NB. quoted, script
qdots;;st
)

requoted=:4 : 0

NB.*requoted v-- replaces atoms in "quoted" lists.
NB.
NB. Replaces all (1{x) in simple nonnested atom runs delimited by
NB. (0{x) with (2{x).
NB.
NB. dyad:  ulRep =. uaQuoteCharRep requoted ul
NB.
NB.   NB. replace ,'s in " delimited characters
NB.   ('",',1{a.) requoted 'this , "damm quoted comma , screws up my" , based parsing'
NB.
NB.   NB. numeric quotes
NB.   1 2 9 requoted 0 0 0 1 2 3 1 0 1 2 2 2 1 0

NB. quote, atom, replacement (must be distinct)
'q c r'=. x

if. +./b=. q=y do.
  'unbalanced quotes' assert 0=2|+/b
  
  NB. replacements
  p=. I. (c=y) *. ~:/\b
  r p} y
else.
  y
end.
)

rfd=:*&0.017453292519943295

rflip=:_2: |: |.@$ $ ,

rjust=:' '&$: :(] |."_1~ +/"1@(-.@(<./\."1@([ = ]))))

rlefrnl=:(1 ,~ 2&(~:/\)) ({. , #);.2 ]

round=:[ * [: <. 0.5 + %~

rtrim=:] #~ [: -. [: *./\. ' '"_ = ]

runlengths=:#;.1@(}:@(1 , -.)@((-:"_1) 1&|.))

sdcheck=:sdcheck_jsocket_

sdclose=:sdclose_jsocket_

sdconnect=:sdconnect_jsocket_

sdgethostbyname=:sdgethostbyname_jsocket_

sdrecv=:sdrecv_jsocket_

sdsend=:sdsend_jsocket_

sdsocket=:sdsocket_jsocket_

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


shortlongnames=:3 : 0

NB.*shortlongnames v-- long and short file names from directory pattern.
NB.
NB. monad:  shortlongnames clPathfilepat
NB.
NB.   shortlongnames 'c:\pictures\2007\365\*.*'

NB. require 'dir' !(*)=. dir
long=.  1 dir y  
short=. gspn&> long
long=.  >long
short=. (>:short i:"1 0 '\')}."0 1 short
long=.  (>:long i:"1 0 '\')}."0 1 long
short;long
)

showpass=:] [ 1!:2&2

sin=:1&o.

sind=:sin@rfd

sinh=:5&o.

skewness=:%:@# * +/@(^&3)@dev % ^&1.5@ssdev

smoutput=:0 0 $ 1!:2&2

sob=:[: :(([ {"1~ (0 { [) i. [: ;: ::[ ]) ::('noun selection error' (13!:8) 255"_))

splitstrs=:4 : 0

NB.*splitstrs v-- splits character lists into sublists that start
NB. with (s) and end with (e).
NB.
NB. dyad:  (cl ; cl) splitstrs cl
NB.
NB.   ('cut';'up') splitstrs 'O.J. cut his wife up'
NB.   ';' splitstrs ';useful;edge;condition'

's e'=. x
(1 (0)} (s E. y) +. (-#e) |. e E. y) <;.1 y
)

ssdev=:+/@:*:@dev

sslash=:('\'"_ = {.) }. '\'"_ , ]

stddev=:%:@:var

steps=:{. + (1&{ - {.) * (i.@>: % ])@{:

sunriseset0=:3 : 0

NB.*sunriseset0 v-- computes sun rise and set times - see group documentation.
NB.
NB. monad:  itHM =. sunriseset0 ilBLHMD | ftBLHMD

NB. latitude, longitude, time-zone, month, day !(*)=. b l h m d
y=. # b [ 'b l h m d'=. |: tabit y
b=. dr * b [ rd =. % dr=. 1r180p1

NB. day number within year
n=. _30 + d + (<.9 %~ 275 * m) - 2 * <. 12 %~ m + 9

NB. sun's mean longitude
lg0=. 4.8771 + 0.0172 * (n + 0.5) - l % 360

NB. equation of time
c=. 0.03342 * sin lg0 + 1.345
c2=. rd * c -~ (arctan tan lg0 + c) - arctan 0.9175 * tan lg0 + c
cd=. %: 1 - *: sd=. 0.3978 * sin lg0 + c
sc=. (0.0145 + sd * sin b) % cd * cos b

NB. to handle the three cases enmass without redundant calculations
NB. a boolean table is computed.  1's in each row satisfy a case.
items=. i. #sc [ cases=. (<&_1 , 1&>:@| ,: 1&<) sc

NB. set result table to sun never sets
hrmn=. |: (y , 4)$ NORISESET , 1 0 0

NB. adjust for the sun's declination and atmospheric refraction
pos=. items #~ 1 { cases
c3=. rd * arctan (pos{sc) % %: 1 - *: pos{sc
lc=. (pos{l) + pos{c2

NB. time zone adjusted sunrise times
st=. (6 - pos{h) - (lc + c3) % 15
mn=. <.(st - hr) * 60 [ hr=. <. st
hrmn=. hr (<0;pos)} hrmn
hrmn=. mn (<1;pos)} hrmn

NB. time zone adjusted sunset times
st=. (18 - pos{h) - (lc - c3) % 15
mn=. <.(st - hr) * 60 [ hr=. <. st
hrmn=. hr (<2;pos)} hrmn
hrmn=. mn (<3;pos)} hrmn

NB. sun never rises and result table with rows hr,mr,hs,ms
pos=. items #~ 0 {cases
0 (<1;pos)} hrmn
)

sunriseset1=:3 : 0

NB.*sunriseset1 v-- computes sun rise and set times - see group documentation.
NB.
NB. monad:  itHM =. sunriseset1 flBLHMDY | ftBHMDY 

NB. latitude, longitude, time-zone, month, day, year !(*)=. la lo tz m d y
y=. # la [ 'la lo tz m d y'=. |: tabit y
dr=. 1r180p1 [ dd=. 360 % 365.25636 [ rt=. 50r60

NB. days into year with leap year adjustment
dm=. 0 31 59 90 120 151 181 212 243 273 304 334
dl=. (2 {. dm) , >: 2 }. dm
bl=. 0 = 4 | y [ m=. <: m
dy=. d + ((-.bl) * m { dm) + bl * m { dl
dy=. 0.5 + dy - lo % 360

NB. (th) angle Earth has moved since winter solstice
th=. 9.357001 + (dd * dy) + 1.914 * sin dr * (dd * dy) - 3.97
c3=. 0.3978 * cos dr * th
dc=. (- % dr) * arctan c3 % %: 1 - c3 ^ 2

NB. adjust for positive and negative latitudes
bl=. la < 0
a1=. ((-.bl) * (90 - la) + dc) + bl * (90 + la) - dc
a2=. ((-.bl) * (la - 90) + dc) + bl * (_90 - la) - dc

NB. sun never rises or sets masks
nvset =. a2 >: - rt [ nvrise=. a1 < - rt

NB. corrections
drla=. dr * la   [ drdc=. dr * dc
c1=. ((sin - dr * rt) - (sin drdc) * sin drla) % (cos drdc) * cos drla
t2=. dr %~ arctan (%: 1 - c1 ^ 2) % c1
t1=. 360 - t2 [ bl=. c1 < 0
t2=. (t2 * -.bl) + bl * 180 + t2
t1=. (t1 * -.bl) + bl * 360 - t2

NB. first order equation of time
et=. 0.1511 * sin dr * 17.86 + 2 * dddy=. dd * dy
et=. (_0.1276 * sin dr * dddy - 3.97) - et
drla=. drdc=. dddy=. 0

NB. time zone adjusted rise and set times
tr=. (t1 % 15) - 12 [ ts=. t2 % 15
tr=. tr - et [ ts=. ts - et
s=. ts + tc [ r=.tr + tc [ tc=.(-tz) - lo % 15
hrmn=. (<. r) ,: 1 round 60 * 1|r
hrmn=. hrmn , (<.12 + s) ,: 1 round 60 * 1|s

NB. adjust for when sun never rises or sets
hrmn=. hrmn *"1 -. bl [ bl=. nvset +. nvrise
hrmn=. NORISESET (<0;bl # pos) } hrmn [ pos=. i. {: $ hrmn
1 (<1;nvset # pos) } hrmn
)

symreadtd=:[: s:@<;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

tabit=:]`,:@.(1&>:@(#@$))^:2

tags=:'<'&,@,&'>' ; '</'&,@,&'>'

tan=:3&o.

tand=:tan@rfd

tanh=:7&o.

tap=:i.@! A. i.

tapl=:([: (i.@! A. i.) #) { ]

tcdf=:4 : 0

NB.*tcdf v-- CDF at (y) of the t-distribution with (x) degrees of freedom.
NB.
NB. Computes the cummulative density function of the t-distribution.
NB. From the J Wiki due to Evart Shaw.
NB.
NB. verbatim
NB. 
NB.  http://www.jsoftware.com/jwiki/Essays/t-Distribution%20CDF
NB.
NB. dyad:  fu =. iaDf tcdf nuY
NB.
NB.   5  tcdf 2.01505 1.47588
NB.   11 tcdf 7 3 $ 2.01505 1.47588

assert. (%:x)>|y
0.5 + y * (!-:x-1) * ((0.5,-:1+x) H. 1.5 x%~-*:y) % (%:o.x) * !<:-:x
)

textform2=:63&$: :(4 : 0)

NB.*textform2 v-- wraps and justifies character table (y).
NB.
NB. This  verb forms an  (n*len)  character matrix. The blanks in
NB. each  row of the output matrix are padded so that the line is
NB. right  and left justified.  The number  of rows in the output
NB. table depends upon how many are needed to hold the input data
NB. in the justified format.
NB.
NB. Note: This verb is  a verbatim translation of  an APL utility
NB. and has not been optimized for J.
NB.
NB. monad:  cmWrap =. textform2 c[0..2]Text
NB.
NB.   textform2 1000$' How can I justify this ehh. '
NB.
NB. dyad:  cmWrap =. iaWidth textform2 c[0..2]Text
NB.
NB.   50 textform2 10#,:' four score and seven years ago our '

i=. 0
v=. reb , y ,"1 ' '
j=. #v
b=. j$0
while. j > a=. i + x do.
  k=.  i + i. >:a - i
  if. #c=. (' ' = k{v)#k do.
    i=. >: {: c
    g=. ({:k) - <:i
    c=. (1 >. <:#c) {. c
    f=. #c
    d=. f $ <. g%f
    d=. (>:{.d) (i. f|g)} d
    b=. d ((f?f){c)} b
  else.
    b=. 1 a} b
    i=. a
  end.
end.
v=. (>:b) # v
e=. >: x
r=. >.(#v) % e
(r,x) {. (r,e)$(e*r){.v
)

timestamp=:3 : 0

NB.*timestamp v-- formats timestamp as dd mmm yyyy hr:mn:sc
NB.
NB. monad:  cl =. timestamp zu | nlTime
NB. 
NB.   timestamp ''              NB. empty now
NB.   timestamp 2007 9 16       NB. fills missing
NB.   timestamp 1953 7 2 12 33   

if. 0 = #y do. w=. 6!:0'' else. w=. y end.
r=. }: $ w
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. w
d=. '+++::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='+') } d
(r,20) $ d
)

tlf=:] , ((10{a.)"_ = {:) }. (10{a.)"_

tms=:6!:2 , 7!:2@]

toCRLF=:2&}.@:;@:((13{a.)&,&.>@<;.1@((10{a.)&,)@toJ)

toHOST=:toCRLF

toJ=:((10{a.) I.@(e.&(13{a.))@]} ])@:(#~ -.@((13 10{a.)&E.@,))

toascii85=:3 : 0

NB.*toascii85 v-- to ascii85 representation.
NB.
NB. From convert/misc/ascii85 addon.
NB.
NB. Converts  a  list  of  bytes to  an  ASCII85  representation:
NB. essentially all the  "visible" ASCII characters.  Useful  for
NB. encoding arbitrary byte  lists as a  portable stream. Returns
NB. lines of length no more than 75 + LF
NB.
NB. The encoding does not begin with <~, though sometimes this is
NB. allowed.  However  PDF  files  do  not  accept  this  prefix.
NB. Decoding does support the prefix.
NB.
NB. monad:  clA85 =. toascii85 cl

r=. ,y
len=. #r
r=. 256 #. _4[\ a.i.r
m=. 0 (_1) } r = 0
n=. 5 * I.m
r=. a. {~ 33 + ,(5#85) #: r
r=. 'z' n } r
m=. 1 n } 5 # -. m
r=. m # r
r=. (- (4|len) { 0 3 2 1) }. r
r=. }: ,(_75 [\ r),.LF
('~>',LF) ,~ (r i: ' ') {. r
)

tobase64=:3 : 0

NB.*tobase64 v-- to base 64 representation.
NB.
NB. source convert/misc/base64 addon
NB.
NB. monad: clB64 =. tobase64 cl
NB.
NB.   tobase64 'encode me'

res=. BASE64 {~ #. _6 [\ , (8#2) #: a. i. y
res, (0 2 1 i. 3 | # y) # '='
)

todate=:3 : 0

NB.*todate v-- convert (todayno) integers to dates.
NB.
NB. WARNING:  valid only for Gregorian dates after  and including
NB. 1800 1 1.
NB.
NB. monad:  todate ilYYYYMMDD
NB.
NB.   dates=. 19530702 19520820 20000101 20000229
NB.   todate todayno 0 100 100 #: dates
NB.
NB. dyad:  pa todayno itYYYYMMDD
NB.
NB.   dates -: 1 todate todayno 0 100 100 #: dates  NB. identity

0 todate y
:
s=. $y
a=. 657377.75 +, y
d=. <. a - 36524.25 * c=. <. a % 36524.25
d=. <.1.75 + d - 365.25 * y=. <. (d+0.75) % 365.25
r=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
r=. s $ |: ((c*100)+y+m >: 10) ,r
if. x do. r=. 100 #. r end.
r
)

today=:3 : 0

NB.*today v-- returns todays date.
NB.
NB. monad:  ilYYYYMMDD =. today uu
NB.
NB.   today 0    NB. ignores argument
NB.
NB. dyad:  iaYYYYMMDD =. uu today uu
NB.
NB.   0 today 0

3&{.@(6!:0) ''
:
0 100 100 #. <. 3&{.@(6!:0) ''
)

todayno=:3 : 0

NB.*todayno v-- convert dates to day numbers, converse  (todate).
NB.
NB. WARNING: valid only for  Gregorian dates after  and including
NB. 1800 1 1.
NB.
NB. monad:  todayno ilYYYYMMDD
NB.
NB.   dates=. 19530702 19520820 20000101 20000229
NB.   todayno 0 100 100 #: dates
NB.
NB. dyad:  pa todayno itYYYYMMDD
NB.
NB.   1 todayno dates

0 todayno y
:
a=. y
if. x do. a=. 0 100 100 #: a end.
a=. ((*/r=. }: $a) , {:$a) $,a
'y m d'=. <"_1 |: a
y=. 0 100 #: y - m <: 2
n=. +/ |: <. 36524.25 365.25 *"1 y
n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
0 >. r $ n - 657378
)

tojulian=:3 : 0

NB.*tojulian v-- convert dates to Julian day numbers -  see  long
NB. document.
NB.
NB. monad:  tojulian itYYYYMMDD
NB.
NB.   dates=. 1812 1900 2001 ,. 1 7 9 ,. 10 10 10
NB.   tojulian dates
NB.
NB. dyad:  pa tojulian ilYYYYMMDD|itYYYYMMDD
NB.
NB.   0 tojulian dates
NB.   1 tojulian 100 #.dates

0 tojulian y
:
NB. convert dates to standard form
if. x do. y=. 0 100 100 #: y end.
y=. ((*/r=. }: $y) , {:$y) $,y
'y m d'=. <"_1 |: y

if. 0 e. y do. 'error tojulian: there are no zero years' return. end.

NB. The following adapts an atomic (scalar) C algorithm
NB. to efficiently work on J numeric lists of unspecified size
NB. by using a bit mask (b) to apply if-else logic enmass.

NB.  list oriented J               scalar C
jy=. y + y = 0                     NB.  if (jy == 0) ++jy;

b=. 2 < m                          NB.  if (mm > 2) {
jm=. b * m + 1                     NB.    jm = mm + 1;
jm=. jm + b * m + 13 [ b=. -. b    NB.  } else {
jy=. jy - b                        NB.    --jy; jm = mm + 13: }

jul=. 1720995 + d + (<. 30.6001 * jm) + <. 365.25 * jy

NB. Gregorian calendar adjustment
b=. 588829 <: d + 31 * m + 12 * y
(jul * -. b) + b * jul + (2-ja) + <.0.25 * ja=. <. 0.01 * jy
)

tolower=:3 : 0

NB.*tolower v-- convert to lower case.
NB.
NB. monad: cl =. tolower cl

x=. I. 26 > n=. ((65+i.26){a.) i. t=. ,y
($y) $ ((x{n) { (97+i.26){a.) x}t
)

toupper=:3 : 0

NB.*toupper v-- convert to upper case
NB.
NB. monad:  cl =. toupper cl

x=. I. 26 > n=. ((97+i.26){a.) i. t=. ,y
($y) $ ((x{n) { (65+i.26){a.) x}t
)

tranclose=:(+. +./ .*.~)^:_

tranclose2=:# (i.~ {. ]) [: }. (, #) {~^:a: 0:

treesum=:4 : 0

NB.*treesum v-- sums values at tree nodes.
NB.
NB. Sums up values associated  with the nodes of trees. This verb
NB. (due to Roger Hui) sums values at tree nodes - can be applied
NB. to nontrivial trees with millions of nodes.
NB.
NB. dyad:  nlSum =. nlValues treesum ilTreenodes
NB.
NB.   m=: _1+2^20       NB. node count
NB.   n=: m ?@$ 20      NB. node values
NB.
NB.   p0=: (p: ^:_1) >: i.m  NB. tree (0 is root)
NB.   p1=: 0,2#i.<.-:m       NB. complete binary tree
NB.
NB.   n treesum p0
NB.   n treesum p1

d=. ((</.i.@#) y) -.&.> i=. ~.y
while. 1 do.
  c=. #&>d
  j=. (*c)#i
  i=. c#i
  e=. ;d
  t=. i +//. e{x
  if. 0 *./@:= t do. x return. end.
  x=. (t+j{x) j}x
  d=. i <@;/. (j i. e){d,a:
  i=. j
end.
)

truth=:#:@i.@(2&^)

ts=:6!:2 , 7!:2@]

tsfrunixsecs=:3 : 0

NB.*tsfrunixsecs v-- (yyyy mm dd hh nn ss) timestamp from unix seconds.
NB.
NB. monad:  tsfrunixsecs ilSeconds
NB. 
NB.   tsfrunixsecs 1126531243
NB.
NB.   tsfrunixsecs 1126531243 + 10000?5e8 NB. 10000 random future timestamps


NB. second count cannot be negative
assert. 0 <: <./y

NB. 86400 seconds per day; 62091 unix day zero for (todayno)
'days daysecs'=.  y (<.@% ,: |~) 86400
(todate 62091 + days) ,. 24 60 60 #: daysecs
)

tslash=:] , ('\'"_ = {:) }. '\'"_

tslash2=:([: - '\/' e.~ {:) }. '/' ,~ ]

tsrep=:3 : 0

NB.*tsrep v-- timestamp representation as a single number.
NB.
NB. verbatim: 
NB. [opt] timerep times
NB.   opt=0  convert timestamps to numbers (default)
NB.       1  convert numbers to timestamps
NB.
NB. timestamps are in 6!:0 format, or matrix of same.
NB.
NB. examples:
NB.    tsrep 1800 1 1 0 0 0
NB. 0
NB.    ":!.13 tsrep 1995 5 23 10 24 57.24
NB. 6165887097240

0 tsrep y
:
if. x do.
  r=. $y
  'w n t'=. |: 0 86400 1000 #: ,y
  w=. w + 657377.75
  d=. <. w - 36524.25 * c=. <. w % 36524.25
  d=. <.1.75 + d - 365.25 * w=. <. (d+0.75) % 365.25
  s=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
  s=. |: ((c*100)+w+m >: 10) ,s
  r $ s,. (_3{. &> t%1000) +"1 [ 0 60 60 #: n
else.
  a=. ((*/r=. }: $y) , {:$y) $, y
  'w m d'=. <"_1 |: 3{."1 a
  w=. 0 100 #: w - m <: 2
  n=. +/ |: <. 36524.25 365.25 *"1 w
  n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
  s=. 3600000 60000 1000 +/ .*"1 [ 3}."1 a
  r $ s+86400000 * n - 657378
end.
)

tstamp=:timestamp

ucpfrncrd=:[: ".;._1 '#;' -.~ ]

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


ucpfrutf8=:3 u: 7 u: ]

unixsecsfrts=:3 : 0

NB.*unixsecsfrts v-- unix seconds from (yyyy mm dd hh nn ss) timestamp.
NB.
NB. monad:  ilSeconds =. unixsecsfrts il | itTimestamps
NB.
NB.   now=. unixsecsfrts (6!:0)''  NB. unix seconds count now
NB.
NB.   pastsecs=. <. now - 1000?5e7  
NB.   pastsecs -: unixsecsfrts tsfrunixsecs pastsecs  NB. identity

NB. 86400 seconds per day; 62091 unix day zero for (todayno)
assert. 0 <: <./dn=. (todayno 3{."1 y) - 62091
<. (86400 * dn) + 60 #. _3 {."1 y
)

unpack=:3 : 0

NB.*unpack v-- inverse of pack.
NB.
NB. Unpacks  and assigns  nouns stored in (y)  boxed  name  value
NB. table.
NB.
NB. monad:  cl =. unpack bt
NB.
NB.   p=. pack_ajod_ nl_ajod_ 0   NB. nouns from (ajod) locale
NB.   unpack p                    NB. unpacks in (base) locale
NB.   unpack_loc_ p               NB. unpacks in (loc) - unpack is in (loc)
NB.
NB. dyad:  cl =. clLoc unpack bt
NB.
NB.   '1' unpack p    NB. unpack into numbered locale
NB.   'boo' unpack p  NB. unpack into named locale

'' unpack y
:
if. 0 e. $y do. '' return. end.
NB. y=. citemize y
NB. nms=. toupper&.> {."1 y
y=. (,:^:(2 > #@$)) y
nms=. {."1 y
NB. target locale
if. #x=. ,x do. nms=. nms ,&.> <'_',(x-.' '),'_' end.
(nms)=: {:"1 y
nms
)

usbdrive=:3 : 0

NB.*usbdrive v-- first mounted USB drive.
NB.
NB. monad:  usbdrive clUsbvolume
NB.
NB.   usbdrive ''         NB. use default (USBDRIVEVOLUME)
NB.   usbdrive 'THISDRV'  NB. search for given volume name


vols=. volumes 0 NB. all mounted volumes

assert. 0<#vols
if. #y do. usbdrv=. alltrim y else. usbdrv=. USBDRIVEVOLUME end.

if. +./mask=. (<usbdrv) +./@:E.&> vols do.
  usb=. >(mask i. 1){vols
  ({. (#'Volume in drive ') }. usb),':'
else.
  ''  NB. nothing mounted
end.
)

utf8=:8&u:

utf8frncrd=:8 u: 4 u: ucpfrncrd

valdate=:3 : 0

NB.*valdate v-- validates lists or tables of YYYY MM DD Gregorian
NB. calendar dates.
NB.
NB. monad:  valdate il|it
NB.
NB.   valdate 1953 7 2
NB.   valdate 1953 2 29 ,: 1953 2 28  NB. not a leap year

s=. }:$y
'w m d'=. t=. |:((*/s),3)$,y
b=. *./(t=<.t),(_1 0 0<t),12>:m
day=. (13|m){0 31 28 31 30 31 30 31 31 30 31 30 31
day=. day+(m=2)*-/0=4 100 400|/w
s$b*d<:day
)

var=:ssdev % <:@#

volumes=:3 : 0

NB.*volumes v789-- scans volumes c-z and returns current drives.
NB.
NB. monad:  volumes iaDcnt
NB.
NB.   volumes 0   NB. scan all 23 volumes c-z
NB.   volumes 7   NB. scan volumes cdefghi

NB. require 'task' !(*)=. shell
dcnt=.(23&<.@|@<.)`(23"_)@.(0&=) y
drives=. ':' ,:~ ((i. dcnt )+ a. i. 'c'){a.
vs=. shell&.> <"1 'vol ' ,"1 |: drives
found=. <'Volume in drive '
vs=. (found +./@E.&> vs) # vs
alltrim&.> vs -.&.> <CR,LF,TAB
)

wd=:11!:0

weekday=:7 | 3 + todayno

weeknumber=:3 : 0

NB.*weeknumber v-- gives the year and weeknumber of date.
NB.
NB. A week  belongs to  a year iff 4 days of  the week  belong to
NB. that year. From J library (dates).
NB.
NB. Note: does not generalize to array arguments.
NB.
NB. verbatim: see
NB.
NB. http://www.phys.uu.nl/~vgent/calendar/isocalendar.htm
NB.
NB. monad: il =. weeknumber ilYYYYMMDD
NB.
NB.   weeknumber 2005 1 2
NB.   weeknumber 1953 7 2


yr=. {.y
sd=. 1 ((i.~weekday){]) ((<:yr),.12,.29+i.3),yr,.1,.1+i.4
wk=. >.7%~>: y -&todayno sd
if. wk >weeksinyear yr do.
  (>:yr),1
elseif. wk=0 do.
  (,weeksinyear)<:yr
elseif. do.
  yr,wk
end.
)

weeknumber2=:3 : 0

NB.*weeknumber2  v--  computes  year week number for  YYYY  MM DD
NB. dates.
NB.
NB. Generalization of the (weeknumber) verb in standard J library
NB. script  (dates).  This  verb  accepts  an  integer  table  of
NB. YYYYMMDD  dates.   (weeknumber2)  is  much  faster  than  the
NB. equivalent  (weeknumber"1) on  large  arguments  but consumes
NB. more memory.
NB.
NB. monad:  itYYYYWN =. weeknumber2 itYYYYMMDD | ilYYYYMMDD
NB.
NB.   weeknumber2 1953 7 2
NB.
NB.   dt=. yeardates 2010  NB. all 2010 dates
NB.   wk=. weeknumber2 dt
NB.
NB.   NB. weeks in year - weeks start on Monday
NB.   (<"0 ~.{:"1 wk) ,. ( {:"1 wk) </. dt

y=.  tabit y
yr=. {."1 y
sd=. ((<:yr) ,."0 2 ] 12,.29+i.3) ,. yr ,."0 2 ] 1,.1+i.4
sd=. ((weekday sd) (i."1) 1) {"_1 sd
wk=. >.7%~>: y -&todayno sd
wy=. weeksinyear yr
wn=. yr,.wk

NB. adjust at year boundaries
if. +./mask=. wk > wy  do.
  wn=. ((>:mask#yr),.1) (I. mask) } wn
elseif. +./mask=. wk=0 do.
  wn=. ((,.weeksinyear)<: mask#yr) (I. mask) } wn
end.

wn
)

weeksbetween=:4 : 0

NB.*weeksbetween  v--  list  of  week counts between  two  YYYYWC
NB. dates.
NB.
NB. dyad:  ilYYYYWC weeksbetween ilYYYYWC
NB.
NB.   a=. weeknumber 1953 7 2 [ b=. weeknumber 2009 9 2
NB.   b weeksbetween a

NB. order on year
 'x y'=. /:~  x,:y

if. (0{x) = 0{y  do. (1{y) - 1{x
else.
  ((weeksinyear 0{x) - 1{x),(weeksinyear (0{x) + >: }: i. 0{y - x),1{y
end.
)

weeksinyear=:52 + [: +./"1 [: [ 4 = [: weekday (2 2$1 1 12 31) ,"0 1/~ ]

wfl=:wfl_z_

winlcchars=:[: 9!:7 (a.{~16+i.11)"_ [ ]

winpathsep=:'\'&(('/' I.@:= ])})

wrapwords=:4 : 0

NB.*wrapwords v-- wrap words into lines of length (x).
NB.
NB. This algorithm: due to Roger Hui. Wraps words (nonblank) runs
NB. into lines of length (x) without breaking words. Words cannot
NB. be longer  than (x).  Transitive closure  is used to  compute
NB. where appropriate newline (LF) characters replace blanks.
NB.
NB. dyad:  cl =. iaWidth wrapwords clWords
NB.
NB.   27 wrapwords 7770$'go ahead make my day and surprise me'

NB. remove extra blanks and CRLF
y=. reb y -. CRLF

e=. (' ' I.@:= y),#y
LF (e {~ <: tranclose2 e I. (x+2)+}:_1,e)} y
)

write=:1!:2 ]`<@.(32&>@(3!:0))

writenoun=:([: 3!:1 [) (1!:2 ]`<@.(32&>@(3!:0))) ]

writetd=:] (1!:2 ]`<@.(32&>@(3!:0)))~ [: 2&}.@:;@:((13{a.)&,&.>@<;.1@((10{a.)&,)@(((10{a.) I.@(e.&(13{a.))@]} ])@:(#~ -.@((13 10{a.)&E.@,)))) [: }.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@])) [: }."1 [: ;"1 (9{a.) ,&.> [

yeardates=:3 : 0

NB.*yeardates v-- returns all valid dates for n calendar years.
NB.
NB. The monad returns an integer table with YYYY MM DD rows.  The
NB. dyad returns dates as a list of YYYYMMDD integers.
NB.
NB. This algorithm  uses  a  series of outer-products  and  ravel
NB. reductions to form a cross  product rather  than  the  direct
NB. catalog verb ({).
NB.
NB. monad:  itYYYYMMDD =. yeardates ilYears
NB.
NB.   yeardates 2000
NB.
NB.   yeardates 2001 + i. 100  NB. all dates in 21st century
NB.
NB.
NB. dyad:  ilYYYYMMDD =. uu yeardates ilYears
NB.
NB.   0 yeardates 2001
NB.
NB.   yeardates~  1999 2000 2001   NB. useful idiom

NB. generate all possible dates in years
days =. ,/ (,y) ,"0 1/ ,/ (>: i. 12) ,"0/ >: i. 31

NB. remove invalid dates
days #~ valdate days
:
NB. convert to yyyy mm dd format
0 100 100 #. yeardates y
)

yyyymondd=:3 : 0

NB.*yyyymondd v-- today in (yyyymondd;hrmnss) format.
NB.
NB. Yet another date format verb. We can never have enough!
NB.
NB. monad:  (clDate ; clTime) =. yyyymondd uuIgnore

fmt=.'r<0>2.0'
months=. _3 [\ '   janfebmaraprmayjunjulaugsepoctnovdec'
'yy mn dd'=. 3{.now=. 6!:0''
date=. (":yy),(mn{months),,fmt (8!:2) dd
time=. }.;':' ,&.> fmt (8!:0) _3 {. now
date;time
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fM!M+>Yi1+>P&t+>Pes1E\P8+?(E"1*A;++?2%t1*A>0+>b2t0H`)0+>bhr0fL430d&4o0f^@2
0d&82+?:Q"2]t+'2`;d8+>Ynu0fL431*A;0+>beq1E\D.+?:Q$2'=h#1,U15+>Gl!2]sk5+>G\q
1,9t,1*AD4+?1K#1a"b#2)6:6+>ktu2]sn8+>GVo1bp15+>ktu2BXe1+>k8t2]t"$0ea_/+>PYo
2BXt%2]sh8+>t>s0d&Ct1,9t1+>Po!2'=\1+?(Dt1a"e$1GBq.+>Yu"0f'q/3$:4(1c6C10H`82
+?:Q#1a"M,+>bqu0eje-2'=V.+>u,#0esk.1a"Rs1,g=6+>Ynu1E\P6+?(Dt2BXt%1,U11+>Ybq
3$:%7+?1K"2BXt%1H$@10d&D/+>P'!+>b2r0d&=r1,pC4+?:Q#+>Yr!3?U%8+?:Q#3?U=)1H6L9
+>Yhs3$:(8+>Y,p1a"Ut0f1"0+>Get1E\M0+>Y,s0d&2)+>Ykt3?U(9+?:Q"3$:4(1bp13+>GSn
3?U.=+?1K#2]t%%2)HF7+>bu!2'=_6+>k8u2BXk"1c?I6+>bu!2'=_6+>k8u2BXk"1c?I8+>u,#
2'=_6+>k8u2BXk"1c?I7+>bu!2'=e2+>t>t3?U+#1,'h*1a"V2+>Y,r1a"Ut1c$71+>Gbs1E\D4
+>G\q1c$75+>u,#0eje/0d&2*+>beq2'=Y0+?(E!1*ALu1,C%0+>Gbs3?U19+>t?"2BXq$1b^%0
+>Ykt3?U.7+?(E"3$:.&2)ZR7+>GSn2'=Y2+?(Du3$:.&2`)X:+>Gbs1*A>1+>Y,p1a"\!1bp10
+>G\q2BXb7+>Y,q0d&Fu1H6L;+?),"0ea_/3$:.&2)HF3+>tnr1a"P/+?1K"3?U:(1bp1.0d&53
+>GPm1cZ[50H`53+>k8s0d&Fu1cQU9+?))!2]sk4+>t?#0d&2)+>u,#0f1"/2]sh/+>PYo0f'q.
0d&@s2)$.0+>Pbr2]sh2+>Y,p2BXh!1Gp:8+?)/#0ea_.0H`=t2DZI4+>kns1E\D0+>P&p3$:""
1-$I;+>Pbr3?U+:+>t>t0d&Ct1,'h/+>Pbr3?U+9+?(E!2]st#2DlU7+>Ykt2BX_7+>GVo1Gp:8
+>Ybq3$:"5+>Y,u0H`=t2)ZR9+>l,$3$:"4+?(E"1a"M-+>c&#2]sq:+?1K#0d&2*+>c)$3$:%;
+>Y,p2BXdu1c?I9+?1K&+>Yr!3$:(=+>b2s2BXdu1GL"0+>GVo2'=V5+>k8u2BXk"1,^72+>l)#
0f'q.2]sq"1,'h/+>P\p1a"M1+>b2q0d&:q0eje-+>GVo2'=n%2'=b4+>GYp1cHO7+>c&#3$9t2
+?(Dt0d&4o0esk+0d&A3+>Y,q1a"_"2_uR9+>u5&1E\P2+?:Q$2'=V-+>u"u1a"\8+>t?"2'=k$
1,pC8+>tnr0esk/2'=V-+>kkr1E\J0+>Y,r0d&4o3$:%#1GL"4+>kkr3$:":+?:Q#0d&@s1c?I4
+>bhr1*A;.+>P&o1a"Xu1H$@8+>bqu1a"S/+?(E#1*AP!2_uR9+>Pht2BXh1+?(E%1E\Y"2DH=7
+>l#!2]t%6+?(E"0H`=t1,pC4+>kqt1a"S3+>t?!1E\Y"1-$I6+>c)$0ea_.3$9q0+>u&!3$:"4
+>Y,q0H`4q1,L+2+>Gl!2]st8+>k8u3$:($1,pC20H`,2+?(E#1*ALu2)6:7+>kns0f:(21*AIt
2)6:4+>kns3$:(6+>G\q1cQU;+>P_q1E\D-+>b2q0d&:q0f:(5+?1K'+>P\p1E\P/+?:Q'1E\Ot
1,pC7+>Z##2BXe9+>k9"3$9q1+>l)#0eje.2]t+'2)cX8+>Z##1a"P/+>Y,p0d&:q0eje-+>Ghu
1E\G1+>b2s3?U.$2D?76+>Z##3?U.5+>Y,s3?U+#2)?@5+>bnt2BXh5+>Y,s1a"e$1,U16+>Pes
2BXe5+>k8r3?U7'1cHO:+>l#!2]sk1+?(Du0d&J!1-$I30H`)0+?(Du2'=b!1,0n,+>kqt0esk.
3?U4&1bg+3+>kkr2'=_3+>t>u1*AS"2`2^<+>c#"0esk.3?U4&0f:(5+>P_q1a"P0+>GPm2)QL8
+>u&!1E\Ir2]sq6+>P&o1a"_"2)$.-0H`/1+>GSn1c?I21*AD1+>GSn1cZ[7+?)/#0ea_,2'=V-
+>khq3?U+8+>k8t0H`@u1,'h0+>bhr3?U.8+?:Q#1dXK,75cu3@<6!&2DcOfDI[TqBl7Q+@;Kmr
@:Eei6;L<BH$!U?:NBuWEZe(bEbd]Y<E)F>3$:XZ/4)ZS6:N(GBOuE;+E)9C1,Cp50fV*70f^s2
-tHn!.3LrgF)to/8j[*1F(K/1Ap&!$FD5Z2F!,X?@3A*dE+O'&AT)EsFE2)*+CSf(ATD6I9L2TU
5uglT:JtVDFD,T5+EV1>F<G:8F(KB6ARlomGp"MQB4EA5Bl5&+Ec6)>+Cf4rF)rI;ART+\EcW?T
+CehtDJsV>BOQ'q+=Afi+Cf(nEa`I"ATC.9@psCuBjkXc+ED%8F`M@B@q]:k@:OCjE^N_u7UokI
EbSrpAKZ#)FEMVA+Dbb0AKYSrARlonBOPpi@ru:&+E1b'E_/_d6Ub'P;FFGsFDZ,5DfT`0DKKH1
Amo1\+EqaEA9/kA8Oc!579<8_6rRc@D00H0Ec*<KB6%p5E(NMb6Ub'P;FFH)F`)&7Df09,FCfK)
@:NjkGAhM4F!)l&7R9C1=&2^^;fd)!D/X?1.3N8DDfp"m7VldVAKYSrARlonBOPpi@ru:&9keE[
ATC[W@VK^SBl%TsEZe7g@VK^&E,ol+@:EY]BleB1@j#`2Bl.E(FCfN8:-hTC5tk*G6$?[QBk/>r
BOPpi@ru:&F!,17+A*bo@;TRs:/=bZ;ajVR<,$5\Bk(RnATJu8F`&=>AThX*+ED1;ATJu4EZfF7
FE8R=DBL?KF`)56F(KE(F>,-d@;]Tu.!'NKEbTT+F(KGJ.3NYBF*2;@F&$XqASuF.AKYr.@:Nk^
DerrqEZcqVF(Jo*Ci=3(+CoD#F_t]-FAbn1<*)jn6rRc@D00H0Ec,o9Dfd+GDfTB0+=L,`:K1Ck
;FFGsFDZ,5DfT_E+D5_5F`8HG+<VdL;GU(f=&2^^;fd)!D/X?1Ec5l<+EqaEA9/kA;GU(f=&2^^
;fd)!D/X?1.3N8DDfp"A+<VdL+B1WnFCAW$@q]:k@:OCjE`>J%:e"#M75/gpD/aE6@<-W9Anc'm
+Dl7BF<GO@Bl8#8FDi:5G][A3F<G+.Eb/a&DfU,&AQVcN6Z#e6=<MR$Bl8$6+E1n4+Ceu#FD5T'
FCfJlAQVcN8T%L==<MR$Bl8$6+E1n4+DG_'BN/PF:ioEK<+T/SE,TH.FE8RDATAo1Bl%U"D.Rg#
E`H%)6rHTW7932X<D>n^;aMU;EbT].+Eh[>F_t\4CggdaCggptATDTqF*)JFEcP`5@;0V#+EMXF
Bl7Q+.![6a@:jUmEZf1,F*&OC@q0Y%Eb0,uAKYo'+=MI`@:jUmEcZ>CEb0?$Bl7u7F*)G:DJ()#
AoqU)+D,>.F*&OC@q0Y%Eb0,uAKYo'+=MI`@;KauD..L$D..L$+E)CEATAnACh7$cBl7Q+@;]Tu
FE1f(Ch[d".3N>HASiQ1F`)7CBl5&0BleB;@;KauFE2)4FE2)4+CT)&+E)CEATAo-FCf<1+>"]`
+=ALECi"$3EbTA5BlbD<@;TQu@<3Q"Ci"36Bl.9pCij]3D00f4D0$h.Cht51ART+`DJ()#DIal3
Ea`ZuBl7Q+@VfIjCNEp#Cj0Q,FCfQ7Bl.s4Bl.o6@;Ka&Ch7$cBl7Q+@;]TuFE1f(Ch[d"+EqL5
FCcS9E+*6f@;^1$D/WrrAnc-nF!,R<AKYf#@<6N5Ao_I&F_,H4Cj@.A@q0Y%EbTE(+DGq/D('HS
+DG^9@3BB#F*(i0E+Not@;p0sDIdf2@3BB#F*&OCAftQ.FCfM9FDi:6Bl%?hE,]W=@;p1%Bk;?.
FD,5.G%G]'+DG^9F*)G:DJ((?GUXbWD]gHR.:I7,@rHEsEap5%Df]W1ARTUh@rHF%BR+Q.Eais'
Bk&8oEap5%Df]W1ARTUhF(oN#Eap55Bl7KjEas0)DJ3^/E+O'!Des,t+CT;#+EM77ARTUhFCB&q
Eap56@;]^hDKK<-@ru-sBP;[1ATD6uCh[B%@<,j#FCB'"ASuTuF)to5FE;//DII?(GA2/4+E)4@
Bl@ltC`mS+F)tc&ART[hB6.L'FE2))F`_1;G\q7>6:FC9:*<t_A0=<96m-S[B6.L'Df'*,CghF(
D'3G2Df$V5BleB)FEDPH@;L'tAU&<;@:OD#+EV1>F<GL6+F%a>+CTA6EbT!*FCeokAn5@bDIIR2
+Cf(nEa`I"ATAo*Ec5e;A7]7bD..6A+C\hmA0<]a@V'.iEb0&qF*)JFEcP`5@;0V#+EMXFBl7Q+
.![6a@V'.iEb-A0@<6N5De!:"EcP`/@q?d$AfrLH.:Qk#DfTE1FE2D5FCAm$F!,OGEbTE(+C\no
DfTD3Anc:,F<GL3@s)g4ASu!h+E(j7.!R1MASc:&B6/08F)to/ARfg)F*1r.BleB;+C\o(G@b?'
+Du+8DImm2ARlooASc'tBlmp,F!,L7FCAm$Bl7Q+A7]RkD/"*'EcY]$Ec,f<Ci!fuASu("@<?''
Anc:,F<F=$6=k1TDfol4Bcq;9D.7'sF(/^&G@b?'Bk2I&DId='ARlp)F^f0$F*)IG@V'Y*AS#a%
DJsE1ATMs)A0>DoCh[a#FCfK6@V'Y*AS#anA9]kDDId='ARlp)F^f0$F*)IG@V'Y*AS#a%DJsE1
ATMs)A0>DoCh[a#FCfK6@V'Y*AS#b#FE2GDASbpfF<GXI@Vfb"FE8R6ATW--ASrW.Df0H(F*(u(
+Co&"Bl.R+ATDi7A8-*p@<,mmDJ()&ASc'tBlmp,F(/^&G@b?'F*)GD137#CARfg)F*1r.BleB;
+C\o(G@b?'+Du+8DImm2ARlooASc'tBlmp,F(/`l@VK^gEd8d>Ec5e;A7]7bD..6A+C\qn+>bi_
ChmHkFCB--ASu%"+Dtb#ATMp$Ed8d:Cgh3sF!,RC+A*buDeip%F(0!#@W,e&+DkP.F!,17A7^!.
.![6aG@bK$BQPA2DBNn:F`(`2+=MI`+D>>#B4uB0Bl5&-DI[?kF(0'4DfB9*@W-L&F!,C?ASrW.
Dfor=@W-L9DfB9*@W-L&F!,@=DIm[(FEo!IE+No0DJsZ8F(0E+Bl.]uA8,IoAScW7FCfK0Bl7@$
ATJtd+EM+8F(oQ1@X3',@VKq*3$;[EF<GO2FED)7DK?q4DfQt0H$!V=+>"^WAS!!#Df021A8bt#
D.RU,@ps1bDId0r@ps1bDId0r+D,P4+F.O,EZee3+>GVoASbppASuT4Ch[s4@ps1jDf9N7@ps1b
DId0r+Cno&ATJu4Aftu&G9C=3A0>K,Cht52Df9N7@psD"Ao_j/Cgh?o@<-I$F(o'#+Cf>.Eb&m%
@<?(%+=MIc+F,L\H79tKEc5e;E,TQ$EZek1DfTB&DIIWuF!)lO/0K%JATV?3+E2"..:Zmu@;Ka&
A8H'lA7]dlCht5*EcQ)=+DG_*DfT]'FD5Z2@q9.kG[tW,+@g!b9OW!a7<3EeEZf(6AoD^,@<?4%
DI[3hAo_Ho+Co;)F(8g$1.36pDf9Z,Bl7@$AKYT*Df$V9Derj&3ZqpEE$0+3@j!KK0k4m*DJ*Nu
EHG](@;]^h+Du+>+E;OBFCeumBOPdkATMs6Eb03+@:Nki+EM[7F*)G:DJ+#5/Kf+GAKYf-DJ()&
De!p,ASuU"BOPdkATVj+Eb03+@:Nki+A*bo@;TQuFDkr+DK?qEBln$&DBN@1F*)G:DJ*Hm@<-F3
@WQ7$B5D-%@q]:k@:OCjEZf=0BlY>:AT2Ho@qBLgDKKr0Blmp'BmO?!FDl#;+EVNECh[s4F"AGM
BleB;+EVNEFCAWpATKCFDffZ(EZfC2DJO;9F`(]&@;]^hA7KP!@rHF&DIjr2@:X(\DKB<+F(Ad!
F(oN'+Co%rEb/g'@rHF%BR+Q.Eais'Bk&8qDf]W1ARfaj@sMR#Bk&9+ARoq$A79@cGp$U1ARfL:
+CfG%+=D8BF*&OGFE2)5B.%22Ch%-eEa`I"ATAo8@:F%a+EVNEDIn$.Bl7K)A7]RkD/"*'A0>]&
F*(o7FDbZ2FD591@s)l9Ch[s4+DG_8D]iq/F*(u(+EDUBF!+n/A0>f4BOu3oF`_\HEbT'/@s)l9
Ch[s4+DG_8D]gHQ.3N&:A0>f4BOu3p@<?'mEbTE5=]nm19he#D+EVNE=]nm1+AGQQ6pr/6BleB;
A79RkAo_d3D-:"E=\VUY6m-Si+B_iM=WgF5+@JU?/Kf+GAKYf-DJ()&De!p,ASuU#@<l9oART4_
+DG^9A79b)A79b%Ap7ftCNj?$CLgk!+D,Y4D'2ta=]lkA9cuhl+Cno&ATJtG+EM+*+Dbt6B-:`'
@s)X"DKKDuCiOT9FCf$$@r-()AKYDtC`m5$@<,ddFCfJ8Ch[s4F!,17+C].sC`mG0+<hqJF`2A5
F(Aa"F`2A5A8cU"Ch4`/F`2A5F!*%WA8cU"Ch7Z1Bl8$(Ec,<%+<hqJF`2A5F!,:5CLnV:EHQ2A
ALV/#@q]F`CJmSj78cQL6U`+L+AYBl6Qg)\FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&uA7KLo
;FO&D;FO>J73F0):IIN:+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@2A1(nu@rH0]77K^D78?3=
+>"^36pa6`Bl8$(Eb8`iAKZ/-Eag.C+ED%5F_Pl-+=C]1-Y-atDf/HA7R^3D:.%Gm/KdhW6:2l0
DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Y-a8A7T4bF&GFr78cQL6U`+L+AYBl6Qg)\FCfK)@:Njk
G%G]'+>"^VAT;j,Eb-@@A7R&uA7]e%;FO&D;FO>J73F0):IIN:+DG_8ATDBk@q?d+ATD6&/Kf(F
EHPu9AKW@2A1(nuAn,LP77K^D78?3=+>"^36pa6`Bl8$(Eb8`iAKZ/-Eag.C+ED%5F_Pl-+=C]1
-Y-b"ATUg=7R^3D:.%Gm/KdhW6:2l0DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Y-a8A7T:mA8QBu
ARfFk@;I&sAS6$pATJu+Ec5e;A7]CoAS#p6+Dkh1F`_29/0K"F@rH6qF!*%WBl8**EcYe7-tI19
Ao_Em.:ct1ASb757R^3D:.%Gm/KdhW6:2l0DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Y-a8A7Tb$
Cf3\k78cQL6U`+L+AYBl6Qg)\FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&uA92d$;FO&D;FO>J
73F0):IIN:+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@2A1(nuFCK'2;FO&D;FO>J73F0):IIN:
+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@2A1(o!@W-+(ASl@/AKYE!Gp$p7@:X(iB-9N:9faC`
H$!U?:NBuWEZe(bEbcdt<(8H!+@SaN6:*4i7Na*mAU#Y7ARfXqD/s3)Dg#]5+Cf>,D.RU,F!,(8
Df$V3+EqaEA929mG%>0-Bjl*tDf-\+@W-C2+Dk[uDId=&BPDR"C3*m*BlJ07ASl@/ATJu&Cht57
ARoq$A79@t+C].qDJO;9Ao_g,+A*bt@rc:&FE:u)@Us%[Bl.9p+D,Y4D'3;%DIIR23ZqsF@N[BJ
0H`%l0d&2]An#7\ARfFk@;I&uEc5e;@q]:k@:OCjEZeh*DIIR23ZqsF@UgN.0eb:90dgLDBOk[a
Bl.9p+D,Y4D'3M'G[tE,A7]CoAS#p*Ao_g,+ECn$BjkmiBldd)ATVL(@;]UoD/s'&A8c<-DKTf*
ATDi7Ao_g,+CQC'Bldd)ATVK+A8-+,EbT!*FD5Z2A8QC"Eb&]kAS6$pATKCFD/!m1FCfME+EM+(
Df0*,+D,Y4D'3A#@qfdgC`m8"B6%QpF!*%WBl8**EcYe7-tHk#Eb'$..:d@5Cgh@*0f^sE@rH7+
FCB'/+>Gl21E^4HCi!O#F!,(8Df$UP0JGF.6Vp>sBl7HmGT\R\F(Jo*Ci=3(+CoD#F_t]-FC]<+
Cgh@*0f_0H@rH7+FCB'/+>Gl80HanECi!O#F!,(8Df$UP0JGF.6Vp>sBl7HmG[tl;@<?$kF(96)
E-,f;AKZ&9@<?4)FD56+A9;m/@<6*mEc5o<+EVX4Bl%L$B-;83@<6*)>TdNi@<,ddFCfK'F`;2+
F),W$F))n:AftW,E,95u@<?''Blmp'F(JciBOPFpATD6&@;KXdF!)e^5%S/CFD,3!F*(r,F*(i.
@q?csDBN_3+C\o(G@b?'+Dr<@DeX*2F!,C=+EV:.+@T^ZFD*%C+EM[GAmo1\ARTY%ATD9hCh%U(
@<?(%+EV:.+Cno&AKYo'+@T^[FCfJ8F`V87B-;;0AKYJrF`Lu*+CT)!DfTQ6BPh<sATV?nF(K6!
Ci=B+F!,^EC`mh2G]Y&VGpskMDBO1@C`m;*ASl!rF<G[6B4Yq!FEqbHCht53Df..;Ble60@<lR)
B-8U4Dg#]4F=A>QATN!1FCf<.FEqq@Dg,`+F)Yr(Gp%!CF`&=DBOu'(Eb0?8Ec*!R+>>&g-Qlu;
E--@JFCAWpAS#b!F`2A5ASu!oDf]J4Bl5%;+E;OBFCfM9/Kf+WEcQ)@DIdI!B-:Z"@;]k%+ED%1
Dg#]&AT2^&Ec?)0Df0`0Ec`FCDf^#A@rc:&F<DuNF"&5RD]iV/@ps=tF_kK.ARlp&Df^#A@rc:&
F<DuCE-!I>Eaa$#ATD4#AKZ28Eb'6&EcQ)=@:F.qF<GdAFD)e.EcQ)=+Dk\2F(&]mAmo1kDfTo2
@:OCtEcW@AAfu&2F(o`1G%De1DKKH&ATDj(@;p0sDId0pE+Not+EVNEAnc'm+=L5h7Q;N&Bl%?'
DIIBnF"&5PATW'8DK?pF@X3',F!,1/+EM[8@qB_&Ap%o4?SN[AFD,6+GA2,0An#\'DIIBn@W-L&
F!+I^7Q;N.@;TRsAn,FhDdd`@@q]:k@:OCjEZek1DK]T3F(oQ1An,LbA7f=b+EMO=+Cno&@:j(k
@<6!kEaa$#+D,>(ATJtG+Cf41Hlum7@r*9+Afu&$FD)e/Bl%?'DIIBnF(T!*A7T:`F<GXEC`m7s
FCAcmG\M5@0d(1B+D,>(AKYQ/BleB;+>=pVFD,6+GA2,0AnQ-rBl7H(B6%p5E$01>Dfd+GDfTB0
Anc:,FDl&.0ILoa@;Ka&@Wcc8FD,5.Anc:,F<E:\Bl5&6F`)7CDe:+H-Z`m6EcZ>@DImlC-Z^D=
Cht5'F`\a<Bl\9:+>G!QDBNtBDK?q=AfrfUF!*%WCh[Zr+=Li9EcZ>@DIk7>@Wcc8A8,XfATDi7
AoD]4DKTc3F(T-,F*)><ATKVFE-,f2BmO?$+=Li9EcZ>@DIml<+>"^J@<6O%F*&O:Bl\9:Df0,6
F!*%WA8,XfATDi7GA2/4+=Li9EcZ>@DIml<+E)-?DKTc3F(T92F*D2?AoD^,@<<W5BQ%p5+Cf>,
D.RU,F!,(5EZf(6@r-:/Bl@l3Bl5&,ART+\EZek1D/Ej%FE;&4@V01n@q[!+Bl7R"AKYl/F`&=F
@;L't+D,Y4D'16EDdk.<E+*6l@:s.4+E/H@Ddjh:DJsZ8DIIBn-Y@C1EFs6&EHPi1@sK2-BleB:
Bju4,Bl@m$Eb06$BleB.Eb065ASu"'+Co2-FE2))F`_>9DBNk0+Du==ATDKp+DGq/D0'<0AT;O#
F*)#7AT;j(DI[r7A8-+,EbT!*FD5Z2+E(j7@W-L&A0>]&F*&O=FCf<1Ao_g,@<5pmBfIt\ARfXh
AKX9;6V0j/2'?pNE,oN2ASuTuFD5Z2Ao_g,@UX=h2Df#dDf$V+@<6!&2DcOsAT2[$F(K62@<?4%
DBLMRBl8**EcYe7De:,6Ddm-rAMuAWEc5f0F_kc#DI[U&G%G]9F!+(tCh[<q+Cno++Du==@V'S$
+EVNEA79RkF"AGDDf0`0EcYe7.!0BBF_kc#DCK1=BmO?3BmO>5De:,(Bl%?'Bl5&&H$!V=Ap&0+
Ec6/CDfB9*F!+n/A0>AjFCf>uFCfM9@W-L&A0>]&F*)IGDf-\>BOr<&@<6N5@<cL-Ap890FCfZ:
Blmo/FDi:6Bl%?'-rj593$;gICh4`,@;TRs.3NYBFEMVAF!)]:H$!V=+DGF1F*1u&ATMp)F_i1-
0d(CVBOu4.BldiuAT)Es@;]^hDf''-EbT#+D.R-n+E(j7@3BB#F*)&+FCf9"B4Z0-DJsE1ATMs)
A0>i6Eb-A<D/:>+Ch7HpDKKqBGA2/4+D#G#Ci=B/DJ()$AS5^p+D#G$+EV%)F(]'+ASbpdFEDP9
ATT&4Df0H(F*(u(+CTA6EbT!*FCcS>D/:>+Ch7HpDKKqBGA2/4+D#G#Ci=B/DJ()$AS5^p+D#G$
+EV%)F(]'+ASbpdFEDPFAU&<0ATT&+Ch7HpDKI"CAU&;>AoDL%Dg,o5B-:W)FE2))F`_29B4Z0r
Ch7^"G][S0F<GOFEb-A)Ch7HpDKI"CAU&<0ATVL"ATVL.FD591Bl7HmGT^F4A0>MrF<GOFEb-A)
Ch7HpDKI"CAU&<0ATVg4D.@L#Ch7*u+DG_4F`\aBBl7L'+CT=6DKTf*ATDi7/Kf+GAKYf-DJ()&
De!p,ASuU&F)Z#0ATT&9BQ%p5+E1b2BHUo$Ch4`,@;TRh@<-3r@;]aeEc#`4Bk&9&ARTIiAn5Rd
GT^U=Df$V-ARfFk@;KUhA27h0GT^U=Df$V-ARfFk@;I&<+Dbt?ATAo'@<6!&@;Kmr@;'@rFDkf4
@;TLmD/aW>ATJu-BleB7B6%EtF!,UHATJu7BkM+$+E)41DBNY2FCfK9@;L!->Bjj5G\JZ_.3L2b
F(Jo*Ci=3(+CoD#F_t]-FD,B0FDkf4@;RcC@<-'jFD5Z2+E)-?-tm=9FDkf4@;RG9F`V,8+DbV$
F<GL@ASrW)DKKH1G%#3.+=MJK/0K1O.kt=CD0'<0A7TapDfp)A/0JeDDKU&4F"AGTARfXrA90A6
A7QfpEc5e;A7]7bD..6'A79a+F(Jj"DIdfL+F,(l+?2890JI0YF*)G6FEMVAF!,L7F*2;@+E(j7
Ch[d0GV=2WBm:b1Df'?"DIdf2@<3Q5AU&;>F*)G:DJ*X*DeNQqG%De=DKKT/+E(e$Bk(jpFCf)r
E\Cp9@<,ddFCfJ8@rH7.ATDj+Df09$@qKY"D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G][Y;FCfK6
ARfh)DJ=*5AKY]/ASiQ(DKKH1F(Jj'Bl@m'DKKK2A79Rk=]nm1+AGQQ6pr/6BleB;+EVNE=]nm1
9he#D+DG_8AS5RpF(o](FDl"N+DGF1@<?F)+>=pVFD,6+GA2,0Blda%G\(E-ATMs7+D,P4+C]86
ARloo@<>plF(8llEcbl6FE8R:DfQt1BOPpi@ru:&+Cno&@;0dmDf'H0AU#pPBkAJrEbBN3ASuT4
BlbD,Df'H0AU#=O+E)@8ATE!/F(K',Ao)BoF>4nPAftN&B6A'&DKI"8F!,(2Ddda%DJ((G+E)@8
ATE!/F(K',Bl8$7ATMs7+D,P4+Du+8AU&<.DId<h+DG_8AS5RpF!*%W@W-1$ARTIt+CT;%+Cf>-
F(o/rEb/c(Bl8$(B4Z+)Ble0#DD<8JAfsi7:*:s&Dfd+1+Du==@V'R/+>=pVFD,6+GA2,0Ble33
ASuU$F*)IGAoD]4DfB9*+Cno&@;0e$FD5T'F*(i-E+X$/D..N/FD5T'+CT=P+B_iM=Y3?B/OVuL
85_KC:-)<@BleE7Bk)'lAMG<AAftVmFC?;+F!,UCBk)'lAKWZLDffZ(Ed)5=ASH4.DJ=*5AMG<A
Aftf0ASlK2@<,p%F`(o5F_)[L+E)@8ATE!/F(K)rEarckEa`I"ATAo8@:F%a+ED%4Eb0<'DKK</
Bl@l3De:,,+EqaEA90:E@ps1i3ZoP[@r`\>G%G]'-YdU/FD,`,E-$,0DId0rBmO?3+A*bq@<?0*
A7]RkD/"*'EZfIB+E_R9GV<lIDKU1HAoD^6@<,m$F)59+BPMX1CghBu@;p0sDIdf2FE1f(Ch[d"
+>4jOAftu&@qB_&@<-W9@;]TuF*(i.A79LmH=_.?@;^?5>Te-,+>7JPCh@]t@;JPYCh[<q+Cno&
ATJu+Ec5e;@ps1bDId0r+Cno&ATMU/F*(r5G%Go?Ea`I"F!,R<AKYN(Bm+&1Ao_g,+E;O4Ch[Kq
ARloqBl%?'DIIBnF)#i=FC]E8E+*j%AU&<;@:OC%A9)C-AKYE!A0>i"FD)e/Ec5e;EHP]+BkD'j
A0>JuCh4`,@;TRsC3=T>AU&<.G][t7@ruc7FD,5.AU&<.DKBN1DBNP3Df$V:F^]*#Anbge+D,>(
AKYl!D.Rd'F`VY:Bl%?mBl%?'DIIBn+D,Y4D'3G5Ci"A>EHP]+BkD'jA0>JuCh4`,@;TRsC3=T>
Anc'mAU&</Bl%?'DIIBn+CT.u+D#e>ASuR'Df-\0Ec5e;Ap%p+Gp%*L@;KXiBk:ftAnc'mC3=T>
E+*j%AU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRsC3FJe+Eh=:
F(oQ1+Du==@V'RpG&hJ/D.R6#@q]:k@:OCjEZf14F*&OFAT2[$F(K62@<?4%DBNk0+A*c#DfTB0
CNXZ>Df]W6CNXZ>Df]W6CghC,Df0,?-Z^D=Cht5'F`\aJBOr<&@<6N50d(1J+EDUBF!,C5+>G6b
CghC,Df0--0ILoa@;Ka&@Wcc8CghC,+>G!QDBNtBDK?q=AfrfUF!*%WAmob&ATMr9CghC,Df0--
-Z^DRATD6rARTOeBlkJ6BleA=GA2/4+>G6b+DkP-CM@[!+DbUtE$0F;@<-F*AoMQtDJ+')F!,(8
Df$V9@<-I(FD5Z23ZrKTAKYr(Ci!itEcPu)F*&Ns+D#S6DfTZ/F`VY@AS-$,C3=T>BkDW5FCAWp
AScF"Blmj'AS,Og@qfLlFE8RCAfu&2CjBo:D/!Ep+D,>0FD5W*+Cno&@3BN-Bl8$6Cij]3D00f4
D'3Y+Aoo.DCh7$cBl7Q4+C].qDJO<0F`_G<@:UKsDe!3l+E_d?Ch\!*ATJu1De!3lAKYE!A0>_t
CLnW4DfTB0+C\c#AKYE)@;0Od@VfUmA2Rt>Df'Q;EbTE(@rH4'F`_28+DkXH+D>2)BHUo-Df$V,
BOPpi@ru:&+Dbb5FDYStDJ`rnDBO+2Cis;3De:,#+Dbb5FDYT"BjkmrARoL`DBO+2Cis;3De:,#
+Dbb5FDYT+@;TRmDfU+G@;Kau@psIjD.RQrD.RR&Ed8d>Eb/g!ASlI)ASl@+Gp%-=@:X4dD0Ki.
D/XH?+Eqj?FCf<'A8lX-Bk/f7DeX*2D/Wrr11k6<A9/l8BOr<'Df^"CAo_I&F_,H4Cj@.A@q0Y%
EbTE(+DGq/D('HS+DG^9@3BB#F*)8;DKKQ5@V'Y*AS#aqBleA=De:,/Df0Z1+Cf>4DKKqB@V'Y*
AS#a%FE_XG=]nm19he#D+Cno&ATM^,Df0W<Bl.F&+E(j7DIn#7@;]TuAp%p++Dl%8DK?q4DfQt<
+CehrASu$eEZfX=@<-F+Dg#c1ARTInDg#i4B-:huDf''-EbT#+D.R-nD/XT7ARTInDg#i4B-;&&
@;]sm8g&"[D.Oi"CghC+DIn'7G%G]8Bl@m,AU&;>G%G]8Bl@l3DKTf*ATAo+Bm+'*+CfP7Eb0-1
+=MLa+Eh=:F(oQ1+>"^WAS!!#Df021A8bt#D.RU,DJ*HsATo80Ec6)>+Cf4rF)rIGASlC&@<?'u
Ch@^.Ch7L,D.Ra%@j#T%F*&O:Ec5e;Ecl7BCh7KsFD)e.DI[TqBl7Q+FCAWpAKWQIF(Jo*-us-8
Ao_d*.3NGFDJ()&De!p,ASuU-Ch@^.Ch5A1Cij6/DIIWu+Du==ATDKp+Dbb5F<G19Df$V;F`&=<
ASu.&BHUl(@rGmlDJ()6@:F%a+>"^WARuu4DJWp*Ebo;9DJs!+Ea`j,E,Tf/A0>c.F`&<ME+*6l
.3N&8Ci=N=3Zoh)HZ1Ds/g)lqE'5frDJru,DJUFLDf0-&ASu.&BP_6tB67g.+E(j7@rH7,BkM@,
F!,LGDK?q=AfrfUF!,17+C]&,+Dbb5FE;A<Ao_I&A8-+,DfTB"Eb/c(DKTf-EbT#+Ch[s4+D,Y*
EHPi1@sK2-BleB:Bju4,Bl@l3/Kf+GAKYf-DJ()&De!p,ASuU/@:O(l@:O(o+Dbt+@;KKtDJsZ8
F!,17FDi:2Dg5i(+DtV)AKZ/)Cis;3FCAWpANCrQ@:O([Ci<fj+Du"&Ci<fj+>@bCEbTW@0d(1B
+C]8-Ch7$m+Dbb5F<G7*F!+n/+D#_-DBNh>D.7's+E(j70dh#b0Hb:UBOu4.Bldj)@<-F#@rlg4
@<-F#F!+t2D/E](A7]RkD/"*'A0>JuCh7[,@<-F#FC]?!EcYe7<'`hnA7]RkD/"*'A0>u&@VfTu
FCf]=+>"^WARuu4Eb/ZiFC[-U+Dbt6B-:`'@s)X"DKKi+EcYf8DesQ5ATMp3Ch\!4+=MDOCisT+
F"&5PATN!1F<G:8FDi9MA9)C-ALqY+@V'@,F(KB+@;IA8FCAWpAT2("E+*d/F*)GDE,961+Dbb5
F<G:8FDi:CF^f0$F*)IGDe:,2@<?U&Ec*".DIal-Df..G@<?U&Ec,i.@kpFpE,TQ$EZet7Df$V,
Df9Z,Bl7@$ANCrQAn)r<+>IhICiEg'FD5i2Df-\0Ec5e;Ch7KsFD,_V+EM+*+DbY/E+s9*+>"]j
E%u<G@r$-sCh7*u+CT.u+Co2-@r-()AKYE%Eaa59Blmp'F)Yi4ARfC^EcZ&<FDPZ4FD5W*+E):7
ASuU$A0>i0Ecb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&F)Z&6H#ReBA8lI'H#@P;Bjkg#E,ol-
F^oM9/Kf+GAKYf-DJ()&De!p,ASuU/DfTr0BOPq&E,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"
ATDj2Df^#7FDu8=D/XN-F!,C=Cj@.3FDl#;+CT.u+Dbb5FE8RHD]iP.CisT4+EV%$Ch7[,G@l&>
Blmo/E-67FA8,OqBl@ltEd8dODfTB0+CT=6F(96)E-*47Bl%@%EA;'>EcZ=FEHP]1FD5Q&EAM]M
Bl[`,EHP]1FD5Q&EHQ2AAT;j2FCfM9@q]:k@:OCjEZf14F*)IGAoD]4AU%crF`_>9DK90'A9Dd(
Ap&!*AoD^,+ECn.A8c<-DKTf*ATDi7/Kf+GAKYf-DJ()&De!p,ASuU(Df0T,@:XCi@:XF%@3B/r
Ch4_tF!+m6Ch[s4+E(j7@X3',F)ki#A7K\(Eb/Zi+Cf>,D.+Q.AT2'u@<?'k+EV%$Ch4`$Bl%@%
+>"^WAS!!#Df021A8bt#D.RU,Eb/Zi@rlg7Eb/Zi+CT.u+E1b0F(HJ(Df'?"+EM+5@<,duARlp*
@:F%a+D,>(ATJu&F!,OLD.7F"F!*%WF(Jo*Ci=3(+CoD#F_t]-FE1r$A8Z=.DK9;sA9/l%+A*bc
Bl7@"Gp%!CF`&=6Bl%@$ART+kA9)6iA0>;uA0>i"EcYe7<'`hnA7]RkD/"*'A0>u&@VfTuAnc'm
F)ki#A9;?;Eb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj
.3L2bF(Jo*Ci=3(+CoD#F_t]-FE1r$A9;?;F)ki#A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1
@<3Q4H#7#/Ci^^N+EM+*+Dbt6B-:`'@s)X"DKKo1@:XIj@W-+(ART*l<'`hnA7]RkD/"*'A0>u&
@VfTuAnc'mF!,10DJsQ0DJ()#DL!@@ART+`DJ((Y:JGk@@:XIjF)ki#A0>;uA0>i"EcYe7<'`hn
A7]RkD/"*'A0>u&@VfTuAnc'mF!+n4+EMgF@W-((+>"^WAS!!#Df021A8bt#D.RU,Eb/ZiG'%88
ART*lG%#E*@:F%a+DbV,B67f0FCAW$A7]RkD/"*'A0>JuCh7[.ARTCo@<-I1ARTBtE+*d/+E(j7
@rH4'Ch7i6DKTf*ATDj4AR][kD/XT/F!,L7A9Dd#@;^00@VfIjCNCUM+DbUtA8,po/0K%T@;0Ol
DJ()/F_l/6E,9*+AR].iASl@/ATJu2F_l/6E,9).@VfIjCNCUH@q]:k+E).6Gq!cF@WHC2A7]Rg
FCfM9@;Ka&@VfIjCERY9GB4m=Ec5e;@q]:k@:OCjEZfI4@VfUrAR]aj@rH1(ASl@/AKZ)8@;0Ol
DJ()$Cgh3s+Cf>+F_u#;Eb/^&B4YslEa`cuH=:o0Df-\9AfrLBAR]-u+=MI`+CT;'F_t]-F<G:=
+CT/5+CTA1D/s3"Bl\9:Df0,qBlnD=Eb0?$Bl7X&B-:f#EcZ=FASbppASuT4De:,%Df0Z2B5_p6
+>G!ZF`)7C@;]TuF*2MDDfor.Bl7Q+0ILp^ASksrFCB3&F)ki2CgggbF!,"3FED))+A*bbEbBN3
ASuU2+DG^9F(96)E--.DGA2/4+E_R4Dfg)4A0>H'F_Q#-Ch7L+F)ki3F`2A5A9)7#CgggbF!+n5
Df'P<Bl5%;EHQ2AARlu-Ch[s4F)kl'Ea`Km@;^-/Ao_g,+Co%rEb/g'Eb9-%E--,/DKBc8F(KD8
8g%P_Eaa67+EVNE;K?MpF*)G:B4uB0C3=T>BkDW5FCAWpATDTuAo_d*Ecl7BCh[s4+D#G#De*R"
B-:f,Df$V7F_t]1Bk&9%BleA=/Kf+GAKYf-DJ()&De!p,ASuU1Dfor.Ec6)<A0<:G.3N_N+Dtb!
Eb0<6+=MI`+=LeRB.b;]0JG1'Ec6)<A0<T^1Ggs<Ecc>9D00f4D'3k5B4uB0.!0K<Bl%L$B.4s4
Cgh3sF)lD@Ch7KsFD,`3ASu.&BQG;7Aftf0ASiQ1F`)7CBl5&0BleB;F(AcoARfLR77K^D78?3=
+>"^WDe!QoF<G:8FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@F)PQ(ATT;@A7KFoF(J6<7R^3D:.%Gm
/Kf+Q@r#Xt+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-?@rH7&ARfg[77K^D78?3=
+>"^WDe!QoF<G:8FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@F)PQ(ATT;@A7oIqBQ%s6@X2j"D.QU6
7R^3D:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-?Eb/a(;FO&D
;FO>J73F0)F)PQ(ATT&/DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Za39CLqT8F(B?'DIcX67R^3D
:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-?F)PQ(ATUg=7R^3D
:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-CDfTr9Df03*@;TRs
Ci=3(+CT.u+EM47Ec`F9Bl%?'DIIBnF!,(8Df$V-Bl[cpFDl2F+E1b2FCfK1F(fK9E+*g/F(fK9
+CT.u+EV:.DBNn,F)rIADfor=Bl8!+DIjr2@:X(\DKBl5DIdg&DBNJ$B6%QpF)u&5BP;[1ATD6u
Ch[B%F(oN'F),?2DImm1F),?2DImm1F)>i<FDuAEF(KE6Bl@l3D..<jB4Z*+Dfp/@F`_\C@WQ*s
ARfg)-uNs4.3NS<@r#LcAKZ&:@WQ+&3ZrAaF)PM14$"a(F`VXIF`S[:BP8c7E,961F*)GDF)Yr0
FE8R7BOPpi@ru:&+Dbb5FE8R=DKKe>F*1r.BleB;+EV:*F<GXH@<-H4GA2/4+=M:[+CT.u+D#G$
+EqOABHS^7.<BQ@ATi-;D'3b/+EMOF@<,p%A7]pu@<?4%DK?pK1+@9cCghBuE,oN%Bm:b:ART+`
DJ((s+Cf(nEa`I"ATAo-Aftu&@qB_&@<-X7FC\onG&qb6DId0rA0>DoG%kB,Bl@l3-t-q6ATDZs
FCcS9E+Nj%Bl7Q4F*(u4F!rejGpskIG%GQ-Gp%0I@:NkZ+DG_8ATDs&Ci^_.ATW--ASrV=0RJ'o
+CT.u+=JskGptcsF*(u4F!+gE+>Fuo0QVASEbTT+F(KGI@rH4'F`_29+EM[C+ED1;AKYE!A0>r)
F<G[>D.Rc2/Kf+GAKYW+Dfp"AA8bt#D.RU,@<?4%DKBr<EbTT+F(KGJ@rH4'F`_29+EM[C+ED1;
AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+Dfp"AA8bt#D.RU,@<?4%DKC)?Eb/ZiFC]E'@:UK[5sc])
ASc'tBlmos+EV%$Ch4`$Bl%@%+CT=6F*VV3DesJ;/Kf+GAKWCAART+kA25TU@:EqmE,ol6DffQ3
+E).6Gp$O;Df'P<@;]TuCh[s4F!,RC+EV%$Ch7[0@:sY+D/:=]77TpE+CT.u+@T$n+EV%)F*(i.
FCB&0Ea`Km@;^..@;]Ut@;[2uAS6$pATMs%DJ3^/E+O'!Des,t+EV%0B4Yt&FCB-1@:F%a+E(j7
@;Ka&E+O',F`_&6Bl@m1FCB-)FCAWpAKYo'+CT)&+E1n4D09r/FD5Z2F!,C5+Dbb5F<G:>ASlL1
@q91=6q/;-F<DuW.3NP@+EV:.+ET2GBleB:Bju4,Bl@l3GA2/4+=MI`+Co%rEb/g'+E(j7Ao_Ho
A8c=,AU&</DfT\MGB.,2F!+n/A0>W0F*),.Bk;?.@q]:k@:OCjEZfI4@VfTu.![7`Bl.F&FCB$*
AoD^,@<?Q5FD5T'F*(i-E$/S1+Co"*D/F,4H$O[\+D>dVD/MCU@ruO!@;p0sDIdf2FE1f(Ch[d"
+Dbb0AKYSrARlonBOPpi@ru:&+DGF1DIm<hF)tc1H$!nEFD5T'F!)lPARfXrA901B@;]TuF)YPt
AKWC1H$!V=.3N_N+D#e/@s)m)+EM+3FCf?"ATViX;G9PiDf0`0Ecc@F@q]:k@:OCjEZfFFEbTE(
F!,RC+@B%#7Nc5QCh[a#FCfK7Db*Z&<+BiaG%G]9F!+t+@<,ddFCfJ8F*)G:DJ+#5FDi:8Df^"C
A7]RkD/"*'Ecc4l@rH7.ATDm6+Cf(nEa`I"ATAo7FE2)5B6,2;D]hXpA7]RkD/"*'EZe%FFDkT/
@qfX:20<aZ@<5pmBfIsmEb031ATMF#FCB9*Df0Z8@UX=h2DfMo+C\c#AKWlf+ED%4Eb0<'DKK</
Bl@m2De*9uARfXrG%G]9+=M>MA79b$D^cfCDKKH&ATDi7FDi:4@<?(%FDk\uH#dJ<F`MA@+EVO4
@<lo:A79RkFDk\uH#@P1Df0`0Ec`F7@<?(%+EVNEA79a+DKTf*ATDiC+Cf>-G%G]8AKWCCDe*9u
ALV_>C3=?,@;]RnDK]T3F<G+&FCfM9FDi9oF_kc#DBNIuGp%!ID.7'sF!*%WF(Jo*Ci=3(+CoD#
F_t]-FEDG;Dg,c5@rH7.ATDl8FDi:<Dg,c5+Cei$ATVj5E,]B/@rH7.ATDl8FDi:EE,]B/+Cei$
ATVs$DI[L$F(Jj"D/aW>ATJu&+EVX4DKBN6Bm+&1@r-()F`M&8Ea`iqCi=B+13@PFDKBN6Bm+&1
@r-()F`M&8Eb/g'F_u2BD0$hC@;L'tF!+n5+EVX8AKYl/A7]h(EclJ;DKKP7DfTB"EZfIEF`_:>
FCAWpATW!8Bl.F&+=M;B@rH6qF"&5?DIal2E+*6f+=L]EFCfMB+EVNEAU%crF`_1;F(K62ASu!h
FE;&7F`(o<F(Jj&.!^)`Gp$s@+Co"*BP8N+DBO"A.3N_HD.Rd1@;Ts+Ao_g,+E_R9GT_'=@rH6q
F*)J>@<6*jE,]B+A9/l8Ea`ZuBl7Q+>TdNi@<,ddFCfJ8BkAK*ARf:mF('*7FE;8,F(d=;E,]B+
A9/l8Ea`ZuBl7Q+0-Ft@AftnuF*&O7BOPpi@ru:&+DGm>DJsV>>Tds*+>7hXEb033Bl.F&FCB$*
+ED%4Eb0<'DKK</Bl@l3@<3Q"+EM77B5D-%DKTf*ATDm6FCB$*5tjj9;]mY7Eb03+@:NjkGA2/4
+=M>GD.Rd1@;Ts4F^oB&Ec,B-A9Dd(@rGmh+Cf>/AKYr1Bl8$6+D,Y4D'2S@;BTL]@qfdgC`m5$
@<,ddFCfJ8ASu!rA8,po+>"^WAS!!#Df021A8bt#D.RU,F^oB&EclJ93-B+Q@rGmh+Cf>#AKYr1
Bl8$6+D,Y4D'3tCAiLoCBOPpi@ru:&+EMXFBl7R)F`(o<F(Jj&Ao`!7F`(o<+EM+(Df0*,+D,Y4
D'16PH$OZXD/CD+A0>Q!+Du'>F)rcQFD5T'F*(i-E-6&;@:O(eDK]T3F(HJ4Afu&$@r$4.@UsLn
G%G9"EcZ=FD/XQ7FCeu*<Du4,A9)C-AT`*,3+HW1Ea`I"ATAo0BleA=FDi:%<(8H!F`_4TAo_d!
Eb'<7AiLoCBOPpi@ru:&+EMXFBl7R)+D,Y4D'3t=Bk)'lAKX`8;BTL]@qfdgC`me@EbTE(F*:u.
A79RkG%#3$A79RkF!,:5F*)IGDfQtB@:F%aF!,C5+B_iM=WgF5+@JU?7ri0RDfTQ#DBNFtCh7Kp
@<*K$@<?(%G%#E7@<-O0CisT+F)ti"DK?qDDesQ5ATJu(/UAOJDIal1ATW'8DK?q1F`MM6DKI"3
EbT].F*D/=Bl7I"GB4m;EbT].Ed))+CLgk!A79a+De:,9AS#X"/Kf+GAKYf-DJ()&De!p,ASuTN
+<Yl>ASYgbGp"h%2)?@6+>S.PASZ1+D.7'sB5)O#F!,R<AKZ80@<*K!DIal6AS#XpF_tT!EZf:4
+Cno&ATq]sCMn93@V'R8@rH4'F`_29+F.O,EZfR;ASWE+F_tT!EZet4EZeLf=]lkA9cuhl+Cno&
ATN',ASZ?rATW--ASu<uF*&OCAfu;/ASWDuDfor>F!+q'FE_;-DBO%FD]i1c=]nfn+Cno&ATN',
ASZ@$DL#f%EbB*0ATJu3F_tT!EZf:4+EqC.CNCV4DBO49@<*JB+EM+*+Dbt6B-:`'@s)X"DKL)7
Cf3\k78cQL6U`+L+EqaEA0>K&Ec#6,Bl@l3Df-\6Bl7L'+>"^XD]j1DAKYf-@:UL&BOr<!Ec6)>
+=MGPEb&d#Ec#6,Bl@l<GA1r2@q01\EcZG=DId[0F!,:A@qfI^+Cf>-F)Pl++C]86+CoM$GA1r-
+Cf(nEa`I"ATDj9Bl7luFD,`,E-$,0DId0rBmO?3+A*bq@<?0*A7]RkD/"*'EZfIB+EqO;A8c[5
+C\bhCER\7@<6++Ea`p2DfTB0GB.,2+EqaEA9/l-DKKe>Ch[cuF!,C5+DbV,B67f0.!R1bEbTW,
GB.D>ATJu&+Dbb5F<GL6+C]V<ATJu9D]iY+Ch7g2Blmp(DforAEbTW,F!+m68g&"iF`&=6Bl%@)
EbTW,FC]!%Ec#6,+CT.u+Eqj?FCcRo5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%H"CE)A79RkF)ki6
F`MA@+CT)&+Eh10Bk/>s@<?(%+D,P4+Dr<3@;KLmA79L$H"CE)F*W%VH#7J;A7Te#A79a+Bl5%A
H$O[\D/X<&A34IFD/OE9.3N5@Ec#6,                                            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ACr1,q-dDffP?:2b5c+Ef=g+Du+>AKYr.@:Nk^DerrqEXE-r6Yp=WATAo4Ec5f6F<G^J
Bl%L*Gp"5OBOQ!*,'.s:Ci"$6F!;`KBOr;7GpsjY@<-"'D.RU,/g*MiD@.LqAKW+<F(Jl)FDi:4
Ble60@<jCH-t7=@+Du+>+<Y6?ARfk)ALT/QG%G]'@<?4#+E_R3Df'?&DKKH#$6XG%G]Y'BDBMOo
F(96)E--.R$4:WgDII':+<YuP+?_>":2b5c+E_fuB5VX.AI8be+AQisAKW?p5uL?E;BSq-=B$XT
1*A%h1(%_J+>P&q$7Q;h+<XEtFCcS//g)nl1C>L$+DGJ+DfTD3@;Ka&FCf]=-OMUO.j-VT.1-Ch~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1bg+2+>P&q+>Yc3+?1K#1,U17+>Gl52'=n%0ebF<+?:Q&2_Z@7+>Yi4@Vog/@Vog%FtG9g@W,e&
+DkP.F!,17A7^!<+B3#c+C]8"Gp$s4F)rI<DId='+DGm>@3BDu@<6R3AKYo'$>=@%+D,&(+F.mJ
+CT;%/g)Qf.3N>G+F.mJEZfR;BkM+$+DG^9E,Tl:A9/l%DIak<GUXbLF!,aHF`Ih&ASGdjF<G:8
+<YB9@q]Fp/g*G&-t7%-.3N)2FE_;-DBL\l+CT.u+>Pr03?W0M@;^-/H#IgJ+CT;%$?(*!Ed))/
B4uB>+@.+u@Vog.+D5_+@<?($+EV:*DBL_h+DGm>Ddm:!AM+;sA9hTo3Zr$CHtI1;@Vog%Amp(!
C^LLl+AP6U+DlBH@Vog,F!,(5EZfO6EbTH7F!,[<BkM+$Esa$42_uRcD.t+I3A;R13Ahp70JFV)
0Jst.0ea_*0f:(/1,*0_FCeoqFE8p@H$!V,BlnD=FtG9g3$;[EF<GO2FED)7DK?q4DfQt0H$!V=
/d_q6@X3',@VKq*.3N2HE+*WpF!)T7H$!V=+DG_8D]h"^+C]&,+<YW3FED)7DK@EQ<+ohcDfTB"
EZf(;$>+<sD'3Y+@<6N5+EVNED/XK;+<Y`>B5VEqBk(RhF<D]8BlnDK+<XQnF*2;@+<Y]5DJL@;
BlbD8DIj/fEb/[$ATAo8BOPd$@<-"'D.RU,/d_r&Df/uo3ZoPaFW`h"+C]V<AR]@qF!+t8$47mu
@X3',@VKq*+<Vd\+F>5>/g)9367sBmBl\9:+C]V<AI9P&@X3',@VKq*+>Pf3+F>5>/g)9367sBs
@<6N5@X3',$47mu,[u%@AR]@qF!)hX$47mu@X3',@VKq*+=CWDFCcS3AL@g-+C]V<AR]@qF!*4\
1E\Ls,TnIMAS#g'@VKpuDJ(=($6UHd67sBpA7]Y#BlnV-+<W(H/g)o,2CTb#3Zoq++u(2g1*BmG
BeCN83%5t"+u(3LH$!V,BlnD=@4hlo$47,MBOPdkATMs6.V!.#DJ*O%FE/LI/M/)cAT2Ho@qB^(
F*1r5FE2)5B6,2>Bln$&DBN@1F*)G:DJ(R/$<1\QF!+n-B5_g)FD,M6G@>P8@:WecFCeu*Ao_g,
+CT.15u:5t@;KRpEbTW/D(Zr&F<GU8EHPu9ATJ2lBkM*%F)Y]%A0>?"DerunDBND&F<D]C@;]du
F_kK.Bl@l3@;]TuBlbD7Dfd*E@<3Q&AnGUaFD5o0$>FB#@s)g4ASuT4+A*btH#n(=D0$h.F!,1=
+<YB>+DG^9F)Po,+<WsH9H\D%F*(u1F"SS'ATMg)FCbeO-Z^DJDf..FE-,f2@;I&qDf9H'@;^-/
FD,B0+Eh=:@N]B++EMX=Cht5+@<6N5ASuF/B4rE0D]iM#$>+=$Blms0Ci"A>@;p1%Bk:g-+<XHt
+<YNH+<WKp0MP)A+APlY+DkOsBPD?q+<YrJFWb1&DBNe)CLmi.0J"n30Hb1CDJ+')+DG_'Eb/[#
Bl7Q+Eb03+@:NkcASuU2/0H?_BOr<1DfTo@+Cei$ALT/QBl5&%$8EYGD.R?g@X3',+<Y`IEbTE(
+<YB9+CT5.Ec62:D..NtCj@-GDf0,/+EM+(Df0)<+<X-lEZcJZ0JEiLBl%]sH$!U?+EMXFBl7R)
+EVmJBk(Rf+E)41Eaa'(Df0V=@rH4'Ch7^"+DGm>Ch7[/+EV:*DBL'1$?TisFD)e8Afu/+@rH6q
/d_qVBkM*%F)Y]%A0>r9@WQX3Bl7Q+Eb03+@:NkcASuT4BlbD-BkCsk@s)U0+EVNE@:NtbAThW-
Bl5%c$=Rg_+@/gt+D#G6Bl\-0D.RU,F"SS7BPDN1G%G]'+EqaHCh+YtAKYD(B5_^!+CehtA8,R_
FCcS,DfQ1nDBNM8FCfK1@;I&rDf'H-Ch7-"Ec6)BBl7K7$4:<h@:VDA+Cf4TBOPdkARloH/g+Y?
<+0f[ATVu9@q]:gB4Z.+EZek.;fm$e$6UH=04S[(DJ*N6@V'%fD.Rc9+Cf(nDJ*O%FE/KO@q]:g
B4W3&AL@fl+<W$bA7]RgFCcgB@q]:gB4Z.+EZc`?ASbq"AKYi$-QjNS:-pQUDKTc3+ED%4Cgggb
D.RU,+Co&"ATVL)$47mu:-pQUAnc:,F<G(,@<,ddFCfJ8BlbD-ASc'tBlmp,$47mu-SBFND/XT/
/hV*cEbAr9/pD#KALAU1BOPdkATMs6+=D2@D/XT/E-626ATqj-AL@fl+<W$b-Qlo4@;]^hF*)FF
-Z3jEBPD?s+D>2&E+Np.-OL2'+=ANZ@q]:gB4Z.+EZc`IDffZ,DJ()*@;p0sDK@04$6UH=05b]M
BPD?s05+d5E+Np.-Qlo4@;]^hF*)FF-Z3iFD..NrBOu6-FDi:3BOPdkAL@fl+<XEG/g,"RCijB1
Ch4`0AT2Ho@qBLgDKKqB@<,p%D.-sd+DG^9Ch74#+EVNEEbT0"F<GLBA7]cg$6UI5+?_>"-Z<m4
AKYDtC`mh5Bl7R)+EqC;AKYhuDL!T:$6UH=05Y-8GqWZ@@;]^hF"^s<CbK4=05k`<AM7V.BI=p4
BOPdkATMs6+ERqt+<XEG/g+_KASrW.F_kk:F*1r6EbTE(+ED%4CgggbD.RU,F!+n3AKYDtCi=N/
A-rYd+=Afq=BHpn@q]:gB4Z.+EZc`DDKBB0F<G%,B-;FA@q]:kF!+n3Dfor.+E_`Q$47mu:-pQU
Anc-kCi"A>@;Ka&FD,B0+CT5.Ch[I%+DG^9@3B&rARTI!ASbpj@;^/o+<XEG/g,@HGp%3I+B;0.
6Vg*=+EMXFBl7R)+CT=6G@bT,$47muF^o)nEcXAr+E]^f0ebC>+=eRK/g*#*0H_K567sC'DJ<U!
A7Zm)FE2)5B*ob(A79RgFEqh:+E_1-@<-E3+<VdL+<VdL+<Ve%67sB/A79RgFEqh:.3N5CDf$V3
+E2@>Anc'm$47muF`V\70Kh$2-o!D0.qpUj0e%Hl@q]:kF!)T#67sC%F^fE6EbTE(Esa$4F`V\7
0g.-3-o3S6.qpUp.=62IBOPq&$6UI%@<>q"H#R=;F`V\70FApFA79RgFEqh:+E_aJ@PJ2s+<XEG
/g,4WEbTE(F!,R<@<<W9Bl%T.DJsV>De!:"EZf(6+EV:.+E):7B5)6lC^M:-F`(c70Kh$2FZLX%
0JG7@.qpUl1C>6IF`(c70g.-3FZLX&0JY@A.qpUp$47mu.kWItF`(c70H`e:+E_1-@<-E3+<XEG
/g,%MF<G:8+E_1-@<-Dr+<W0e0-GCTATojO74o^*@q]:kEs`6s+E_1-@<-F,ATp9i+=JTj-S0C]
F^d$U-SHhuF`(c70J"S)-S0C]F^d'V-SHhuF`(c70e"5TBOPdkATMs6+E_1-@<-Dr$6UHA/h\>i
DIn#G+@Rn*F^o)nEcZ,0G9A#'67sBuDg*=<DBO"BEbTE($6UHA/h\>iDIn#H+@Rn*F^o)nEcZ,0
G@P;pDJ*O&Degh4BOPdkATVj++Ef=g+ED%4CgggbF!+'tDIIBn+EVO;ASuQ3GA2/4Bl5&%+EMXF
Bl7Q9$49aGBlbD*ChI[,Bln$*+<Yl:F!+n%@;p="A0>K)Df$U>-t?q!DJ*O%FE/fQ@;]TuBlbC>
F(oK*Cgh>kGA2/4+EV:.+D#e-AT2a*Df-\>BOQ!*BlkJ9DJXS@Eb03+@:Nki+A*bo@;TQuFDkr+
DK@E;$=nEjA3(iCCdVlEDJ*Nk+?_>"@r,+_CLqC)+Cf(nDJ*O&DegJ*Cf>Fr$47mu-SJtC@;]^h
04JL&Df'',-Qlo4@;]^hFDkq;-Y$guDJ*N'D.Oh4DJs#u@;]^h-OL2'+=AgQASbq"ALAU1BOPdk
ATVj++=C]2Ch7^"+Dk[;+<Ve%67sBuF_kk:Eb03+@:NkcASuT4A7]RgFCfM#$6UH=053(LBOPdk
AM8=IFY@TSFCB9&-Qlo4@;]^hFDkq;-YX]FBPDN1FDi:IDfm1?Dfg8CFXIM'+<XEG/g+b?EcZ=F
@q]:k@:OCjEZf(;+Co&"Bl.R+ATA,#+=Ad^ASl@/AM,TSF`M,+/hV?^E+LC>@q]:gB4Z1'CEP!F
ASl@/AKYr7EbAr+GA2#--OL2'+AP6U+EV%4B4Z1++EV:*F<G"4AKYl/F<F0uDIIBnF!+n3AKY]"
DJsQ,A-sG%-SID;,VNVFD_GR<H#kWOBl\$2-Qlo4@;]^hFDkq;-Xq">F!*D#,TpQ7H#k)e2^BaX
$6UH=0.&"m-8-hu.Om)X?=#95-n$Gc@q]:gB4Z1'CEOuO-71&^?=$q\@;Ka&@UWdiDJsW1Bl7Q+
BOPk!ASuQ:$47mu-SK+NDe(LI,qiS204J@#06LoDGqUKj,pX`]-Qlo4@;]^hFDkq;-YI@9A0>N'
De*F"+C8@sF_>N9+Du+>F_>N9-OL2'+=Afi+Cf(nDJ*O&DegICDJsW1Bl7Q+BOPk!ASuQ:$47mu
-RU$HBOPdkATVj++=D&FFD,B+B-:krE,]B+F!h;%+<W$b0/"t30/"t++Cf(nDJ*O&DegICDJsW1
Bl7Q+BOPk!ASuQ:$47mu-SK@UFD,B+B.mq,E,]B+F!i)?BOPdkATVj++=D&F+DkP/@q]Fp+EVNE
@q]:gB4WFt$6UHd67sBtF_l/6E,9).Eb03+@:NkcASuU2+CT;%+DkOtAKY])+DbV$F<G[D+ED1/
BQPA8Eb&a%$6UI5+?_>"-Z<m4AKYDtC`mh5Bl7R)+EqC;AKYhuDL!T:$6UH=05Y-8GqWZ@@;]^h
F"^s<CbK4=05k`<AM7V.BI=p4BOPdkATVj++EV.&FCf')DKTeGA79RkAo_d3D'4!R/Ke2!=]nHn
6pr/>D]i1c=]lkA9cuhl/d_qQDf0`0Ec`F,=]nm%9ghAlDKTf*ATDi7+ED%4Eb0<'DKKT1B-8=-
@<?(%+EVNE+B_iM=Weh]9cuhl$?U<&E,9*,/g)9)@<?(%+Ceht+C\n)+ED%4Eb0<'DKKH#+C]U=
@;^?5+Du==ATDKp+EVmJAM,*)BOqNkATN!1FD5W*+EVX<E,9).D..]4DJsV>@V$Zj+Eh10Bk/>s
@<?'5$4:WgDII':+<YQE+?_>"A79RkAo_d3D'3_=$47muA79RkAo_d3D'1MT0H`(m0H`(m+<VdL
+<VdL+<VdL+<VdL+<VdL:-pQU@W-1$ARTH`+<Y3'FCf')DKTe=1,(F<0K1[@+>Gl:3A<0A0d%S]
+<VdL+<VdL+<XEG/g+kGFCf)rEcVR1+Cno&AS,t#F_r6U0H_V`1,(FA0K1[@/iG[30f_$H0JtOA
/iP^3+AP6U+D,G.@<?Pt$6UI%@<?'mEc-#:+>Y,q+>P&b+>Gl11GCU=1E\G,0f:XD0K(O=1E[f8
67sBoBkM*%Ea`j$$47mu:-pQU@rH4'Ch7i6DKTf*ATDi7@ps6t@V$[)F(Jl)FDi:@@;0a)F*(i2
FE8R5DIal$DIdf2De:,6EbTK/ATJ2$+Cno&AS,t#F_r6X+=&'b0JG483&*+%1,(FA0etF;+>Gl3
2)$d>128O(3&NEF0f'.D+<XEG/g+e<F<G=4B4lK4GA2/4+D>J%BHV>(DJLA,Ci<a(Bl7Q+@rH4'
Ch7hu+<Y3'FCf')DKTe=1*A=p,Tng%2DHmF0JY7>1MS[!1GLR?0JkCB3B9),$=mRjDe=3)ASWc+
@<ld'G@b?$+Ef=g+EqC.CLgk!+D,Y4D'2ta=]lkA9cuhl+Cno&ATKI2$>j^!@:VDA+C].sC`kkn
+Cno+De=3)ASWE&CfsnD=\VUY6m-k"BlmK\=]nHn6pq@h+<Y3'H#I;=AS#X"1,(C:+?:Q!0a\71
+Cno&ATL!e+>Gl61GCaA1*A;32)[-I0fU:13AifO1,1L+0f_3O0K:dD+>Gl:0eb@;3?U%:1GpjF
0K(%.3AWHF3AEB60f_-H0KCmH$6UI%@<?(%4Y@j2+>GQ(+>GQ(+<roi004P)A79RkEs`6s+DtV)
ATL!e+?MV37rN<XGp#LqDf9T?+@gHpD/abC7!3?cGp$%%AS#h++@:3fE-WQoF_tT++@L-c@;KI%
$47muDIIBnF!*"d+=K>r0d("8FCfMB+=o,fA79b%Ap7ftCER.rFCfM#                   ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c-=5+>P&o0d&>22BY"&0fD!N+>G\q1GL^/0ea_*1bp1.1E\G21E\Ru1Ggq!Des5uEcWrq0f*?Y
Ci!O#F"o[01E^im/KePADKBo.DKI!U3AE<4A8c:#@<-E3Ao_g,+>PW)2]tIa8IZ"9$:A`LG%G]9
F!+t8EcP`/F<G+4Ci!O#F!,RC+>Gl21E^4HCi!O#F!+q#F(Jl)Df-\>BOr;rDf0W=D.R`1E,oZ&
AKY])A7^!<%13OOD/X<#A3(hUDKR'b/g+\CCi!O#F"o[01*CIW6ZmEiASuT!$4R=b+AP6U+Cf>-
G%G]8Bl@l3AoD^,F_kIq$6UI$Df0W<@;^0oA8c:#@<-E34ZX]qF`MM6DKK5rDes5uEcW?Q+=M2L
AThd+F`UnW:e;cU+CfP7Eb0-1?UIX].1HUn$6UHd67sC)BOQ!*GAhV?A0>`7+>PW)0JG1'FDlA@
BQ%a!+C\n)GAhMDBHV#,+>Gl21E^4HCi!O#Et&I!+?;;93A*-F+?^hi0J5%6+EDCCDIakF0JG17
0H_hf3A*<7,p4rs2_HmC1(=R"$6UHd67sBuDg*<q+DYk5G9D*CGp$gC+D,2$F<GC6CLnVs+EM4)
@quM\+<W[%1c[0F1a"q(0J5%6+EDCCDIal#Des5uEcWrq0f'q-0JG170F\?u$6UHd67sBoDg*=@
F^o)-GAhV?A0>;'0f^sE+EMC.Cht52Bl%U"Df/utEb-A&AKZ28Ecbt;FDk\uGmt*'+=Lc=Ci!O#
F"o[01L<+L0e"5"AN"+.Ecbu*BleA=+AP6U+@UN`D/a<&F!,UHBl7Q+ARTV$BOkguF:AR"%144#
:-pQUAn?'oBHUo-Df$UFDImp,@;0U.+Co1rFD5Z2@<-W9FDi:BF`&=6Des6.GA1r-%13OO+<XEG
/g,(C+=D&<FDYH#DC6Q2+>Y-YA0<6I%144#:-pQUB4Z0-4$"a"A7fjmD0$h?Dfor.-OgD*+AP6U
+D58-Ed/]SARTV$BOkguF=.M)%144#:-pQU<+ohcAU%X#E,9).B5)O#DBNY2+AHEYF`S[8@;KFr
CghEsF!,R<AKYVsDe*F#Bk%SZ+<XEG/g+\=F*(i.@q?clATW--ASrW4BOr;^@WQ+$G%#K2Bl[c-
A7Zl[@<-('+CT.u+EV:.%144#:-pQU<A%3&+AQ?g@;I&^@WQ+$G%#K2Ed8dADBN"hF(f9*B68'0
+@IhL/e&-s$6UHd67sBW@<-('+Dbt6B5)I1A7[;7CghF"FEM,*%144#:-pQUA7T:mA8QB1@rH4'
F`_29+Co%nBl.9p+Co%rEb/g'+D,Y4D'3A#B6%Qp/0JeDDKU&4F"AGTARfXrA9/1e+<YJT+<VdL
+?_>"A7T:mA8QB1?SWa21,'hX0f1!q+<XEG/g)8lA0<W]D'1PiF!)l"@<6N>%144#FD,6-@5/lf
/g+\8Ao_F!F!*;!+>khq0ejdn+<VdL:-pQU1cT"g1b`bh0em_l-r+]$FD**4$4R=b+AP6U+BMum
BPD?sFDl%+$6UI-1*@\^+<Wg"+Co"pEb'$.+?)5%1E\P5+<VdL+<Ve%67sB>2e4$R1Mn6l2KKuh
=(QGp.1HV,+EV:.FC?pI4Y@jfA7fjmD0$gU3$:(9+>Get+<VdL+AP6U+>Yuf+>l#n+>Gfr+=L!'
EcbtD%13OO+<XEG/g,1QF`(`$A0>u4+>P'MARfFk@;L!-D..NrBOu6-9k@mYEt&I!+>tr60eP@?
+?^hq0J5%6+EDCCDIb1=-u:UhFD,6-@502RARTV$BOkguF<GBT/9GQ:FC?p6$4R=b+>=ol+<Y6(
Ecbu*BleA=0H`%l+<VdL:-pQUF(&os+DbJ./8T6BB+51W$6UHd67sBmEc5e;:iC/]+EVNE:iC/]
+>"^R@<6O9+DG_*Bl7X,Bk;?.Bl5&8EbT//Ap&!$FD5Z2Et&I!+>=ou0Haq8Ecbu*BleA=0Ha^_
0H_JI$4R=b+AP6U+AO%UDeru-FDi:5EHP]3DfQs_+ELt.AKYE!B5D-%@;Kk"B-:c*F^]B1EX`?u
+AP6U+B3#gF!,1<+CoV++EV:.+D#P8@<?F.Bjkg#@WcL"AISth+>=ou0Haq8Ecbu*BleA=0H`%Y
$6UHF+>=pL@<-I'A8-+,+?;+u0F\?u$6UHd67sC'F(HJ4Afsl;6:2l(DIakYG[k<$+Dbt+@<?4%
DBNIuFCAWeF(Gdf+<XEG/g,1GEHPu9ATJu7AS5^uFCfK,DJ((?CghF%Df02?G\hFM+:SZ#+AP6U
+CT=6@;[2`6pa6`A79Rg+EMIDEarZ5%13OO+<XEG/g+tK@:UK.A7R&1+AP6U+DkP&AKXc:6:2kr
ATD7$+CTG%Bl%3eCh4%_+<Y0-+<Wg"+Co"mDf-[FA92WOCghF%Df028%13OO+<Y`FC`kkn+<VdL
+<W$SF(K0!@rri0Df03%FEM,*/8Sa:BlnK.ALq>*FEqhA@:Njk-OgD*+EMO=+?_>"F)c"I+=A:D
Ec5e;?u07nCi=3(,[_`B%13OO+<Y`=+?_>"F)c"=A7TamC`m5$%144#@qg%!ATJtW/g+\8An?',
F(d+30b"I4+DbL04Y@k)3ZpL.0d'aE0H`(mHQk0e@qg%!ATJ:f%144#:-pQUCghC,+EDCE+DG^9
A79Rg@UX=h+DGm>D0[76F`MM6DKI">@WQ+$G%ki,+EM7=AISth+Co2-F<E_!.!n!!0d(:A.3N21
Ecbu*BleA=Cgmh\+<YTCA0=#f+>5buA8-+,%13OO+<XEG/g+kG@rc-hF(oN)+D58(A7]gr@j#;r
F*(i.@qB^(Ao_g,+DlBHDdmd!Ecu/7B-;80FCbmg+<YK7F*&NQ3A*'0,!$ht/g,(QA0?4AA8-+,
.3L/o+=A9Z+=o,fDfTA2HQYKpHTE?*+Cf,-Bk;?uATVL"ART\&Ecbl;F=Lp7FCf9"@<?U3FCf]=
+Ef=g+D58-+D#A#D.RU,+EV1>F<G16Ci"$6Bl7Q+@<?U3Bju4,ATKI5$4R>@Bl.R#Bjl$)+EVNE
-td+5ASbq"AU&;G+D#e-AT2`6FD,*)+EV:.+D#e>Ea`I"ARlo+FCf]=+Ceht%16]cCi"$6+<Y*7
FE2))F`_29+<YT7+<VeKBOr;/BOtU_+<Yc7B.b;L6$%*iD.Rc2+<YQ?DJj$,FCetl$>"$bD.RU,
F"Rn/%16Wk@:VDA+Cf4e@:p]qATVL"ART\&Ecbl;F<G(0=D_j`$4R=O$6UH=@rH:+A1&L4ATVL"
ART\&Ecbl;F<Dqn@rH:+A0>\sF?Lg)2(gR,+Dbt64X)I:3%cm=,!KXNF<G[=BlcBi@rH:+A3MAR
ATVL"ATVL.F=Lp7FCf9"FCf]=+Ef=g+D58-+E2IDAKYQ#ASl!rF<G[:G]XB%%16!EFEMVAF!,R<
AKZ)+G]Y';ATW--ASrW0F`M%9-uNrG@<?U3Bju4,ATK:CDJsDEDImm2ARlp.D/:>:@:sX6%13OO
A9hTo3ZoPSCh%9(4Y@jeCfFhU+D58-ASbq"AU&;>@r,7aC^g^\$6UH=DIIBn-Qm&5FCf9"FCf]=
+=B9h@;TR>8oJB\4>1S\D.PmnA79Rk5"&slASkmfEZd(j/0H]%0K2*IA79Rk5!3^kD.Pmu@<6C!
E]c!m@;TR>-OgDqATVL"ATVL.FD591.VE=7ASbq"AU&<2A9]5?/M/)ZDId='+CT.u+D58-+E2ID
AKYQ#ASl!rF<G[:G]XB%%16!EFEMVAF!,17A7^!sF!,C5+CT.u+CfP9+E2IDAKYQ#ASl!rF<DuL
D]iJ1FE2))F`_29.3NMHDCoa;F*(u(+F%a>+D#A#D.RU,+EV1>F=n"0%16Wk@:VDA+=Lr?8S!&g
4$4WpCh%9\AU&;G+?_>"@r,+QB-:huFCf9"FCf]=Bk2H2@r,7aC^g^\$6UH=Ci=2=+D58-ASbq"
AU&<2A9]4E4D\GJ4u>)K2`Nf[05P'=5!3Y"DE]X33A*6M3&!HJCi=2T-OgDqATVg4D(910FDc5<
+Ef=g+Cf>+Ch7*u+DG_4F`\aBBl7L'+CT=6DKTf*ATDiE%13OO<+oue+Cf5!G%G\:G%G]'/0H'W
@;BFl+D,Y4D'3q6AKX?YBl7u7A7]Ur/0H'F@;[21@V$[)F(Jl)FDhTq@rH1"ARfg)DKTf-EbT#+
Bl7m4F<GLFATAo1@;^?5Bl7m4F<GC6DImlA%13OOD/X<#A3(iIF<E_!+D58-DKTe=F`g8gDJsQ,
%144#+<VdL+DGX74Y@jiATVg4D'3tD8S;pZEb,[e%13OO+<Y<.FDc5<+>=631,C%0%14g!$9)]Z
+>m^h+>XH6.1HUn$6UI(ATVg4D'12R%14j51CX[J+>jT82`Dj81CX[?%13OO+<W(FATVg4D'1M]
+>#Vs-td+5DKTe=-RU>P$8N_[%14Nn$8N_[%14Nn$4R=O$3                           ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*AS"2)$t&BleB7B6%Et.VNO;FDkf4@;R,0F"Jsd+D#.sBk(jgDKK]?+<Y04D/aW>ATJt:
EbT0"F<D]EE+No0+DG_8ATDs&C^g_UG\J^RBe(ne+D>J1FDkf4@;U'<%13OO<+oue+<Yi=Eag.6
-tII3+<YcE+<XR#B4Z*++@pWh.3KaCDf'H9FCfM9+D>J1FDkf4@;U'<+<XWsAISu\DKKH1G%#3.
+CT;%+ED1/BQPA8E+No>+B)i_+=Lo;F*)>5Ea`f?.3N5@EZf10Aoo/6E+No0.!TGW%17>o.kt<P
Bl8$(Ectl-F"Rn/%15gJEb-A(ATV?pCi^_/@;[2sAKYT'F`(_4Df-\>BOr;Y+BN8mBcpi+3XlE*
$>=O'E&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE97<<NYH#kW0BleB7B6%Et%13OOBQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>FgEbSs";e'KZFEB0,BleB7B6%Et5A4bDBP_BqBQQB`1,rr]
F*)>5Ea`f?,r.Ii$4R>ZDf/uo3Zr-Q6Z.!e+?_>"Bl$@YFCfK9@;L!-BPDO0DeF*!D'3_46t(1G
%13OO+<W'e0H_hfBeCM_0I\,XBleB7B6%Et+?qS70JG1*0eb9j$4R=O$4R=               ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2Du[40H`+n0eje/1,pC20H`/22]t(&1H7<93$:(61a"_"2)@$23$:%72'=h#2E*H83$:+51E\\#
1,q9:2]sq712^ZJFEV59F(oQ1.W/gBFEV59F(oQ1+Ef=g+EqaEA9;C-F:&@BDf'H9FCfM9+EV:.
+Dtb8F<Ga<EcYr5DBNh>D.7's+D5D3ASrW4BOr;/@s)g4ASuT4G%G]8Bl@lA$;#+X+DlBH+<YQ?
F<D]ID]g/FBQ\0$Ch4_3+E)45DJ=$,+<Yi=EcYr5DBL&G0d7__Eb031ATMF#FE7e3DIIX/@;0Uf
@VfTuE+O'%ARfgrDf-\+DIak4F(fK7Ch+Y2Df0B:+<Y-)+<Y*3E,ol*@q]Fa+C]J8$>sEuATAn9
@:NtbAThWq/g*_.F*)>:AKZ).AKW+0A7]0l+D,Y4D'2JhF`_:L+@p&dF`V,8+Acbp@<2ctBOr;u
Bl7?q+<Yi=EcYr5DBL'?Aft&a=<J_pDIak4@;p1+Ddd-hATJt:BlkJABln#2+Co%nBl.9p$=Rmm
Ec62:D..O#Df0VK$49aGAKY\tARTBt+=M,=G]\+?EcYr5DCH\NA7]@eDJ=3,Df-\ADfol,+C\n)
+CQB8F(KB+ATJu9BOPuiG%G]>+EM@;GAMOI@;p1+Ddd-hATJtK+<YlABl%?'D/!m%D/"<1DJ((7
FD,5.,'.IEAKi78Afu2/AI<HdFD5Z2@;I'0ATDj+Df-\8F_tT!E\8J*ATD?)F(or3+DGm>@3B)p
B5)H1@rHL-F=mn-+Dl%7@:VDA+Dtb8FEV59F(oQ1+ECmkATDj+Df,mh+<Ve%67sBmBl\9:+EV14
+Eh=:F(oQ1+Du==@V'S$$6UH6DIn'7G%G]8Bl@lq3[d0QBeCM_0I\+u$47+IDf00-AT;6pF*&mM
DJ!p#EF`d)F<G`Y/KetPA7]dmA0>c4D.Ra%@j#T%F*&O:Eb065ASu"'+Co2-FE2))F`_>9DCuA*
%15dCCLnV:Ao_I&A8-+,.3KaEG[k<(F<D]JBOr<,ATN!1FD5W*+D,Y*EHPi1@sK2-BleB:Bju4,
Bl@ku$>FQ(DfTB"Eb/c(@X0),ATM?mDIdI!B-:f,AT;j(DI[rE%13OOD/X<#A3(hUDKI!a/g,(M
Ao_I&A8-+,+Du!)$4R=b+D,FQ/g)Q,/ho%60I&G/.3KoZ2[p*:+E).0Eb06$BleA=Ao&S4+<VdL
+<VdL+AP6U+D,G.@<;qc%144#Df00-AT;6pF*&O:C`k2M2_Hd=C,6tT:-pQU@rH4'Ch7i#$4R=b
+E).0Eb06$BleA=5;"ZE0JF_+0H_J\+AP6U+DG_8AS5Rp%13OO+<YT?Ao_I&A8-+,+?qJ50JG1*
1*@\^+<XEG/g+VADerunD@Hp^$4R=O$?0p"H#ReBA1DP:CjBu?De'u6/M/)aDes]:Df'2sC`m\;
De+!#F:&@SBPDN1G%G]'+Dl7;FD5]1Bk;?.FE_XGE,TQ<DJsB+@;L!;+<XWsAKYr1CjBo:D/!Ep
F!+n3AI<HhE,oN2ASuU$A0><%+Cf>$AnGaeBk;1(+Dbb5FE9&A$>j^!@:VDA+Du!<4Y@jpCdW,P
AnH*M+E278H#ReBA0>c+6Z6OJAog9G$6UHd67sBjDe3NmBk(jgDKKq,+<Y)U/g)kk1E\Ir0a]$G
@Qc=d2'=^u1E\Fq0a\71+CQC3Des]<Ec5J2@L<Gb+AP6U+Cf>$AnGaeASuU2+Ceht+C\n)@;^?5
DKTf-EbT#+FEqh:$6UI$4Y@j2/i=b*/iPR/2(gg13A*)p$6UI"+E278H#ReBA0>@h$6UHd67sBl
G][M7A7]9oBl8$(B4Z+)$6UI%4Y@j*1FaM23Zr,h+>e<l?8aJE$6UI"+E278H#ReBA0>@h$47+I
Ea`irF`(o*.WSs8A9Dd(Afu7K/Kc0KASu("@<?(%+E_R9AoD^,Cj@.6BleB:Bju4,ARlp(@;]Uo
D'3_=D.7'sF"Rn/+B3#gF!,X;EagRBF`V,)+DG^96YpIKAfsu_Blmp,F!+q1DegI>7WMpIFCB!,
+BE2tF^])pH=:o0Df-!k+CT.u+<X9#+<YWDDe+!#ATJt:@<-BsH#k)NDe:+7F`(o*DfT]2Gp"5?
BleB:Bju4,ARlo+Ea`irDf#pj+Du==@V'S$/e&-s$6X2(DII':+<Y]5DIdm-BkAK%Cf>"UE+KIc
%144#Ea`irF`(o*+>GPm+<XEG/g)l&+E_R9AoD^,+Du==@V'S$+D,Y4D'3P1FCfK9@;I&j0J"qa
%13OO+<Y]5DIdm-BkAJF+>k8a:-pQU2'=b!@<-BsGp%$;+>PesF`(o*DfT\;>;.T_>p+$-D.7's
Et&Hc$6Wl)@:VDA+DGXi@;]^h+ECn.A9Dd(Aftf(;eTTYAIStU$6UHG+>GPmEa`irF`(o*+>GQ(
0H_J\:-pQU0eb:8+E_R9AoD^,+Du==@V'S$+D,Y4D'3%;/28ha%13OO+<Y#G+>G!Z@;]UuDJ<]*
1*A@q1a!o967sB9+>Y,s+CT;2@<iu6Afu56BkD:(D0$h3Ec5e;>@0*90jP4q%13OOEb/Zi@rlfC
Eb/Zi@rlf9FtG9gEb/Zi+CT.u+E1b0F(HJ(Df'?"+EM+5@<,duARlp*@:F%a+D,>(ATKI5$4R>A
BPDN1+=]!RF*8[HART+\EZeq7@q]FtF!,(+@<?X4ATJu+DfQtAE+NTk/g)9.DBNn,Ecc#*F_kK,
%16fk+<YlBCht53Dfd+8@;]UlAKW1:F`2A5A0N.,ASc'tBlmp,F!)lPAS!!'@<-F#@rlfB+CT.u
+DGp,$=S!sF_t]2+EV:.+=]!RF*8[J@:F%a+ED%4Eb0<'DKKqB@3BZ#@VfU.%13OOG%G]'@<?4#
3XlE*$6UHd67sBlG]7J5@qg$-A7]@eDJ=3,Df-!k+<Y]9@:WkhG!.l/-S-Vl,W[&/+=Js#+?CVm
4?G0&1+#1--p0RD?SWaGCh=e<Eb/Zi+F,CY/M8/5;CN_>-8%J)GUFp_AhFN"%16rjDII':+<Y-0
@r*8N/g,1G@:WkhFs(:27VQ[M:18!N%13OO+<Y]9@:WkhFs&/B3a?-(@9d\[@qfI^FCAEj@VfO,
FEhmT%13OOA9hTo3ZoPSCh%9(4Y@je@74[C+ED%%A7K\(+Cf4WBl%?U@;TQb$4R=b+=DOa+ED%%
A7K\(+=CY[>]aOoE*R?rE+NQ4@rlf@%13OO%13OO%13OO%13OO%13OO%13OO%13OOEb/Zi@rlg7
.WT*/A7K\(F!,WX/Kc0VART*l@;]Tu+E1b0F(HJ(Df'?"+Co&"Bl.R+ARlp*@:F%a+D,>(ATJu&
Et&ItH#7#/Ci_3<$4R>ABPDN1+Eh=:@NZe-F!+m6G%#E*@<?4%DBNk8+=M8A@:WkhFt#$d;e9M_
+EM76Bl%KlEZfFKD.7F"%17,e@:Wqi+=M8A@:XIj134ls%13OOG%G]'@<?4#3XlE*$6UHd67sBl
G]7J5@qg$-A7]@eDJ=3,Df-!k+<Y]9@:WkhG&of-+=A]f-6tVp3Zoh*1E\_$-Z_=64?G0&1+#1-
-p0RD?SWaGCh=e<Eb/Zi+F,CY/M8/5;CN_>-8%J)GUFp_AhFN"%16rjDII':+<Y`I+?_>"Eb/Zi
@rlg7+Cf4a@<?0PBl%>i$4R=b+ED%%A7K\(F!)i?3a?-(@9d\[@qfI^FCAEj@VfO,FEhmT%13OO
A9hTo3ZoPdF<E_!+Ceh&Eb/Zi@rlg7+Cf4a@<?0PBl%>i$4R=b+=DOa+ED%%A7K\(F!)i?3a?c<
D/`a!BlIWo/p)>[-OgCl$4R=O$4R=O$?B]dA9;?;.WT*/A9;?;+Ef=g+ED%%A0>;uA0>i"EcYe7
<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF"Re,<+oue+<Yi=Eag/*F!)THDf''0BOQ!*+D,&'FCfJ8
@;]Tu+Ceht+C\n)@rH7+Bk1dq@:F%u+Dl%;AI<Kt@:NjkAS,Og@qfLlF<G[=@;[29Eb/ZiFCZgQ
+A$Yt@;L"'+Cf>1Eb/a&F!,R<AKYQ/E+*X*Bl@krDe:,6BOr<&@<6N5@rH1+D/Ls5$?g!$@UX@m
D)r"2+<XEG/g+_ME,95uBlkJ.AS,XoBln'-D@.L/Eb/ZiFC[-i3Zoh*1E\_$-TjIC?SWrl+=K?6
/mg@VFDPP3-urm-A0?.H+>#2g6W,?U/1)u5+B1Wn-Rg0M/d_q.+AP6U+EV=7Bl7Q+FCfN8F!,[@
FD)dFEb/ZiFCZg-+<Y8Z/g)NO3a?c<D/`a$D09K*D..'gFCAWpAM/(LF=.D&+<XEG/g,7S+D#_-
DBNk?F<F..:EX+\@<3Q3F`&=DBOr<.Bl.R%B6,20DBNt.DId[&+E):2ATA,#+EK[u+?MG7+<r!k
-ZWd,A9;?;+D)u_-ZWd,A9;?)Ag[p.+E0Ir+?t;t,BF2!+<XEG/g+SAE,9eBEa`irDf$V9ATDX1
FCB9*Df.*KFD5T'+CT.u+DG_:ATDl8E+O',F`_&6Bl@kr+<Ybh/g)Pq3cHNpFDZ(G4s4fkEs`6s
+AP6U+D#_-DEW#O@:XIj1+XPdA7RiDART+kA-sG%D.R-n4Y@j-0-DP`,74c#+Dk[uDB^eXHo`Au
/M8e$Hm!,U+<ttW,BO88+Dk[uDB^eXHo`Au1*CreBeCMQF=AGV$47+I$4:fb@:XIj134pcART+k
A283K+Ef=g+<Y]9@:UKhDIak4E+*d.AKXr<66KfMCh[a#FCeu*+EV%$Ch4`$Bl%@%+CT<uF*VV3
DesJI$49aGBlbD?ATD6&BlbD*+<Yi9EbSs(Bl@l3Df-[?-urm-A9;?;.4u`7F<G(3DKBr;ATJu+
@<*K,ATMo"D.RR&Ed8dOBOu'(Eb/ZiBl7Q+A79Rg@UX=h+C\bsA0>u&@VfUs/g)9&+C\bsA0<":
@:F%a+<Y?+EscbmDL!@FAT23hFCeu*+DGq/D0$gBBl5&1Df^"C+Cf>+F_u#;/g*Sk@qZu-F*VV3
DepP1DBL'1+<X8`F(KE6Bl@l3BlbC>F`(o5F_)\:D]j+CDfTQ0B-;5+E+NI"F!,1<+<YN>F*)5D
+CQC0@<?U&EZcKCAdWU$DfTQ0B-:VnA8-."Df0!"+E275DKKH1F!)TLBPCsi+CT;%+EVmJBk(Rf
Cj@.ED..6sATAo8BOPcc@rH1+D/LJ1FCf<1/d_r/ATD6gFD5SQ$47mu:-pQUAU&01Bk(k!+Co%q
Bl7X,Bl@kr+<Y]9@:XIj135T>+=Js#+?CVmF#lQK4"akq-9`P#4?G0&1*C[TAfrLBART*lGpsjf
/g*MZ.3L/g/j:CW5scqJ+D*55$>j^!@:VDA+EMWI4Y@jtART+kA283K@r+tMFD,9#Ch3q\+<Y]9
@:XIj134Qc@ldk6A6`Y`@rkmrD09K.F_=ri@<>p_F)?&4Bl.9kATV?iCh55@G]Y;?$47+I$?B]d
A9;?kDf$tEART+kA7BIo+Ef=g+ED%%A0>;uA0>i"EcYe7<'`hnA7]RkD/"*'A0>u&@VfTuAnc'm
F!,10DJsQ0DJ()#DL!@@ART+`DJ((Y:JEGN$4R>.+Eh16Bjl*tDf-\9AfrLBART+kA25Sd+@0mj
+DbUtA8,po+@8ju+EqO9C`m1u+CoM2E,]B!+C\noDfTD3E+*d.Bl7Q9%13OOG%G]'@<?4#3XlE*
$6UHd67sBlG]7J5@qg$-A7]@eDJ=3,Df-!k+<Y]9@:XIj@W-*H3Zoh*1E\_$-TjIC?SWrl+=K?6
/mg@VFDPP3-tHmuDf$V;ART*lGpsjf/g*MZ.3L/g/j:CW5scqJ+D*58$4R=O$4R=O$4R>_ART+k
A905@ART+kA9/l:/M/)cART*l+CT.u+<YW3EcYe7+B1Wn+<Y3+Ch[a#FCeu*FCAWpAKYT!Ch7Z1
+CT<uF*VV3DesJI$49aGBlbC>G%G]'+<YB>+CQC9@<-'jFD5Z2+E)-?-urm-A9;?2/g*`-+DGm>
F)Po,GA(E,+D,&'FCfJ"@;]Tu@rH7+F_t]2+<Y9)EZcK@ATMo8+Dk\,DfU+G+EqL1DBNt2@:X(i
B-8=-@<>pe@<6!&+C\bsA.!Ee@VfUs/g+)(AKZ&.D/!fpEZfFKD.7F"+ED%%A7]d(-urm-A9;?;
F"&^K$?g!$@UX@mD)r"2+<XEG/g,=KEag/%AS,XoFD5Z2+DG^9AU&01Bk)6-AoD^,$6UI3ART+k
A90mp+=Js#+?CVmF#lQI4?G0&0d8=p<'`hn/1r&N4"akq+EVF3+=M8A@:UL+.3L2p+@B$S.3N4T
$4:WgDII':+<Y`I+?_>"Eb/ZiFC]G8@r+tMFD,9#Ch3q\+<Y]9@:XIjF!)i?3a?W7>\%b_F'Nd'
F_>Q6B3\tUFCAEqD09K*D..'gFCAWpAM/(LF=.D&$46                               ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ALu2`!40Ch74!DJUeCCh74!DJUG;/M/)cF`&=<BleA=ASu!rA8,po+D,Y4D'3_=D.Ra%
@j#T%F*'#A$7Kq2AS,t#CagnX+=LcCAKW+;D]g0!@<5peC`jim@<6:"DCI+Z+EDUB+<YK7F*&NI
ASu!rA7]g)+CPUpDf0-'FDuLJDKTf-EbT#+Ch[s4/g+,,AKZ#)CghEsA0?&,Eag.>DJWp*Ebo;9
+Co%nDe*F#+EDUB$>aEtF<G.4@rGmhA0>u&@VfUs/d_r&Df/uo3ZoP_F<E_!+ED:0Ao_d*+Du!&
$6UHd67sBlDI[TqAKYE!A0>Do@rGmh+Eh16BlA-8+Du==ATDKp+EVmJATJ1c+<Y6)4Y@jtCh74!
DJUG5@Qc=d5;"?=2`Dj>1+=G&+>P&^:-pQU@W-1$ARTH`+<YQ2+>#VsDJWp*Ebo;0ARYuQ$6UI&
Bg"'kEbo<!Ec,\9+DtmV/g)Q,/ho%6+>Y]*+>ki%,;gT&+>=o\:-pQUBl8$(B4Z)j+<YQ9+>#Vs
DJWp*Ebo;0ASDJY+<Y6-4Y@jtCh74!DJUG5Aj%ah-pK=D0JFV)0f'q22^ojo+>l&"2`Mp81E[td
2]s5<67sBmCi<a($6UI/AfrZd+Du"-EcPu-+D#-l$6UI&@m)FeEbo<!Ec,\9DIYg^+=0&k-pK=B
0f'q.1G^.62^ojo+C@#b+C?l`+>P_q,p5,h+AP6U+Cf>,E,9*1$6UI/@j!?a+Du"-EcPu-+D#$i
$6W)1/g,4SARfF_C`m4rF(KD"$6V#F/NP"lCh@^.Ch4`0Ch74!DJUFL+<XEG/g,4K@;od#D/"'.
@<?!m$6V#F4WkkbCh@^.Ch4`0Ch74!DJUFL+<XEG/g,=GCis;3D..NrBOu5l$6XA*AS,t#C`mFE
0H_K567sBlD/aT2ATJu3Dfd+CF`;;<Ecbl'$46                                    ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1-$I6+>P'!+>GQ.3$:4(2_[052]sk83$9q1+>Pi3FDko:Ch[<q.WfTDF_kc#DBO*S/Kc0VATW'8
DK?qBBOr;YF_kc#DBL'4@<it<DKTf*ATAo8BOQ!*@V'1dDK?q/F:)o(Df-\9Afu2/AKYJkCh7Kp
@<*K$@<?'5$49UJF*),>AKZ80@<*K3BkM<tAnbgt+@.VJ/hA+fDImHhFD5o0+@7\J/g+,,AKZ80
@<*J5@:jUmEZd(D67tVX+Eq78+>G!)/jq<!$<1\QF!+n-B5_g)FD,M6+Eq78+<Y*'@;p="A0>K)
Df$U>FD,5.+@@7oAp&!$FD5Z2+<W(IF_kSsGps)AFCB33Bl7Q++E)-?+E1b%AKW*M0d(CH+<XF%
D.Ra%@ps0r+Auc\BlIX)+<YB9+<X$&+<XTo@rH6q$:SK>FD5Z2/d_qe@<-7"DJ)!QFD,B0+Eh=:
@N]3"ATJu3Dfd+@Ec5K2@q?ckDBNA/FE2;;Df'2u@;Kb*+Cf>1Eb/a&$?B^!F_l.P+B3#c+A-cm
Bjkm%A79a+BlbD8AnH*qF<E(f/i=b`Ec5e;FD,5.@rHC.ARfg)Eb0<7Cig"rDfQt/+D5D3ASrW$
@<?'5+<XWsBlbD6@;BFq+EV:2F!,X;Eag/.DfTD3F`V,+F_i14DfQt1Bm+3,$=dL\ASu$eEZek#
Ch%U(@<?4%DK?pCGA(],AKW*DC3=?)EarNo.3N>G+<Y-)FED)7+EM[>FCeu*FDhLpF*)G@DJsB+
@ps0r@ps1`F_kK.Bl@m1/d_r&Df/uo3ZoPZCeAhdBjkm%4Y@k!DeaE2Bjkm%BlmK\=]nHn6pq@h
+<XEG/g)qm@rH1+D/LJ<@:F%a+E)9C1E^CRASiQ+BleA'+<YcEC3=?,@;[2B3AiT82]sju+<VdL
+<VdL+<VdL:-pQU8p+ra@;[2u@<iu6Aftr9+C]&*FD,2nGmYZ:1,LgA0JG1'4WnibC3=?,@;[2B
3Ari>2'=Y1+<XEG/g*ksGp"ju/0HZ-2E2$N+<XEG/g*c/Ch[<q+Cno++Du==@V'S$+E(j7@;Ka&
:1\Vl=_2#^F!,17+>G]pBHUerDKL#AGmYZ:FDko:Ch[<q+=Js#0JFV"+<Wj/BeCM_0JFpu/0Zbj
0d'[C0d&1X$=nEjA3(hUBl$CaCh[<q+?_>"BjjeTAKZ)5C3=?,@;[3%CfsnD=\VUY6ja8D+>G!\
DeaE2Bjkm%0f_3O0K:dD+>Gl:0eb@;3?TFe:-pQU87cUKDC9KJ@;]Tu8mu4J@OH4>@VKk)BOkOs
Es`6s+AP6U+A-'[+>GDi0eb:8+@7\J/hA,#0JG1'67tVV+>Y]*0H`\76OFqY0d(RVC3=?,@;[2>
+>GQ(0JG480d&5*0JG180JO\+0JG170eb<hF^oB&Ec,B-A1D_3E+X-.@rc*&FtG9gF`(o'De*E%
@rGmh+E275DKKqBAo_g,+AP:%+Co%nBl.9p+Cf(nEa`I"ATA,hDI[TqBl7Q9$49aGBlbC>G%G]'
+Cf>-G%G]9F!,OGEbTE(F!)TDAfr4=DJ<U!A7Zl+:.%o%A7]7bD..6'ASu!rA7]9Y@q]:k@:OCj
EcW@FD]j1?Bk)'lAKYK$A7Zl+E,TH.FE9&W<+ohc:.%o%A7]7bD..6'AoD^,@<<W+Escu2E,]`9
FCeu*+C]U=D..=-+<Y-6Dg-86EcW?G@;]Tu+DGm>@3?\+@;]V$+<WTc+C]&,+<WsK6V0iVEb031
ATMF#FCB9*Df-\9Afu56Bk)'lAKYJr@<,ddFCfK6/d_qO+Du==@V'R&+E(j7F`_>6BlnVCE,ol0
Ea`g++<YK7CLnVT@:Eea9jqunAU%c/E,ol-F^nu*FD,B0$?B]sEb0<'DKK</Bl@lA$4:rfEaiI!
Bl,m<$6UH6BQS?83\N.1GBYZK@:EeaF*)><AM.J2/p1q_;f?8iG@>N'01')VASb(LE%YgGD/9Od
D/X<#A3(hUBl"nT/g,:HE+X-.@rc*&@r+nMEXE-r+AP6U+Dkh;+E(j7F`(o'De*E%@q]:k@:OCj
EcW@3F!+4F;BTL]@qfdgC^M:-F^mQe+=AK\1,q3M2EN611,q3P3BJQ41,q6M1cm$/1,q3O1HQp.
1G^gF4!l1.1H.'N-6k<&2E3cF,;V,62EN611GgmF4!t@B+<Y054Y@k"@rQ%#DI[]t+E_0:+AP6U
+Cf>-G%G]9+EVNE@rGmh+E275DKKq,$47mu:-pQUF`_4T+ED%4Eb0<'DKK</Bl@l3F(JoD+E_d<
3+d2K@rc)e+<WWdFZLX%+E]^f@rMb^G@b?$A79a5G@b?$A79a+FtG9gA79a+De:,9AS#X0$49[B
FEMVAF!)TLAS#Xf@<iu-Ec5e;+Cno&AKZ21ATD?)+CT;'F_t]-FE8R5Eb-A8BOr;/F(&os+CT<u
.!0B<@<la/.4u`4Ec5e;8g&1s@;]UaEb$;/Bju*kEd8cUA79RkF"&^K$?g!$@UX@mD)rdn4]?K@
A79a7+>H#RDf0)oGq:'\/hSb-+<WR*;djcjEb&U($47mu+EqC.CLgk!+>Gl:2]st#1,B7p$6UH6
0d([OASYgbGp"h%3B&WL1,B7p$47mu+=MGFASYgbGp"h%2)?@6+>PAgHQZZO+C/4p-ZaEJD/X<6
F_,c.A9;L-Ao_U,@<<k($47,aAS#XuBl83-@<*iAAS#XuBl83-@<*K6/M/)hAS#Xu+DG^9H"CE)
/e&-s$;#+XFD,5.8Q/D-+?2850d't7Ch7Kp@<*K!+<Yl>ASWD2F*(i2FE8QIDf-\7Df0)oGqL3^
7WNEa+A*(MCh[@!@<-W9-tHb.ATK:Q%13OOG%G]'@<?4#3XlE*$6UI8AS#XuBl83-@<+Ll+>GYp
3Zoe-1+OIt/h\D'+BosF4a1IKCLgk!-nui!/35L@+>Y`$/0Zbj0e[tuGpa%.%144#+<Yl>ASZ@$
DL#f%EZd+k0JFV"+DEG_0F\@3+>kns2)6:31*AG0+>kqt2)6:31*AG0+>kns2)>[K%13      ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)6:5+>P&o1*AA40Jjn,2]sh62E;m>+>Gf4+?1K"1H-F23$:(:2]sh4+>Gc2+>Gbs1H%.$F`_M4
F*),,GVCjI67s`tF`_M4F*),,GVCipF"JsdFCB<6Des?)Gp%3?F*&OCAfrL3F`_M4F*),,GUY6S
$;No?%15is/g,=KEaiI!Bl,mR@<6L4D.Rc:@s)m2ATMs-A9]OG@;]TuA7]^kDId<rFE8R@Ddd0f
A0>T(FDi:2@<6!&Ci<flCh54.$;No?%15is/g)8ZB4Z1*GT\ADF`_M4F*),,GUFUC$;No?%15is
/g+YEART[lA3(hg0JP=pAR[>N%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l(An>F*2BZ^O
G%#3$A0>u*F*)IG@:Wn[A.8l@67sB811k*,0K:1cAS5RlATD4$AKYE'Df$V*EbBN3ASuT4FCfN8
F!+n%A7]9\$4R>;67sC%Bl.g*AKZ)+F*&OCAftPoB5)6+@;]TuASu$$A7]RkD/"*'EZeh"Cgh3k
AKYQ#Bl.R%@<?(%%15is/g,7LAKYl%ARlp*D]iP.DKBN&ATAo%DL$>;Bl7Q+@Wcc8DII7&AScW7
@UX(]DI[6g+Co&"Bl.R+ATDiE%13OO:-pQUA7]RkD/"*'EZfI4B6,1DG\q7G%16Wf@:sXE3Zoe4
DeqTb4"!-DDeqTb%13OO:-pQU1+XP(/0Hc#+>,9!+C\npBl6'g/0JMAA3F9S+E1b2FCfK1Et&Ic
ASc(%FE9T++>G!G0d%]i+C,E`%15is/g+S=C`mk<BlS9,+E1n4D09r/FD5Z2F!,C5+CQC/BleA*
$?^<!Ec#k\3Zp.5+?CVmIP)`kBeCPRGpsk%/g,Ee%13OO:-pQU@;Ka&F`(o5F_)\)AS5^p+D#G$
+Co&&FD)dQ+E1b2FCfK1Et&IO67r]S:-pQU+<YfGATDX/+C\nuBleB;+>XH6%15is/g,%SD.7's
+E(j7F`(o5F_)\)AS5^p+D#G$+E1b2FCfK1F!,RC+Co&&FD)dS%15is/g+YBF`);B+C\o-Dfor.
+>k9cBl%T.De=*&DBND)Dg*=BF`\aCASl@+Gp"MI@:OCtEbSruF"%P*:-pQB$;No?+<VmU4s4ue
ATDX/-8%J)4@!@eCh[s4F!<:b/mTS`3Zr,h+>jT8%15is/g,7IF*&OD@<?U&Ec,q-$?U5M3ZrQa
ATDX/-8%J)4@!@eCh[s4F!<:b/mTS`3Zr,h+>jT8%15is/g+V3Cgh3kARlp*ATMr9E+*j1ATD[0
/g+,,AKYr.F`S[H@ps6t.kb-MDe:,6ATMr&$;No?+E1b2FCfK1+EDCEF!+t$DBNh.G%G\:@V'%f
D.Oi-AS5FnBm+&?+@0mj+EDCE%15is/g,@PFD)e7AS5FnBm+'/+D>2)+D#e/@qB_&Bm+&1A7]Rk
D/"*'EZeq2A9/l&AS,k$AKYGnB5)7)%16QQCijVZ3Zp.5+?CVmGp"4SINU$g/h\D'.3L;e4?=T5
.kb-O0e"5j-OgCl$;No?+Cf>4DKI"1@;K@i@qB0nE+*j1ATD[0+EVNEA7]_%BHT/A$;No?+<s-\
@;L%)-9`PoE"*-`$;No?+C\bq@;]RdA0>i"FED)7DK?6o@W4Ik+C\bqFDrQZ4s4rd%13OO:-pQU
F`(YsCgh3kARlo3@UWdr+E1b2FCfK1Et&J!@W4Ik+=LM</M8/T@;L%).4-Z2+EVQ3$4R>;67sC"
CiseAF(8WrF!,C5+C\bq@;]RdA0>i"FED)7DK?q3DIal(DBLVB$;No?+C\bhCER,0FED57B-;,1
+EV:.+C\bq@;]RdA0>o2G9Cs:@;^-/GA2/4%15is/g)hjF)Yr0FE8RHBOr<*@<?U&Ec,q@Bl8$2
+E2@>E+O&4DImm2ARlp(F`)70$;No?+Du3_3ZpOH/mg@X0d\M:+=f*M+u(2e/j:CeE"*-`$;No?
+D#e:@;]Us+CT/5+EM77B5D-%G%#3$A0>o2G9CL<Df$V=ATMr9E+*j1ATD[0+EVNED..NrBHVD1
AISuA67sC&H#R=;De:,.BleA=G@_n.G]75(F<G[D+E2@>@qB_&%15is/g,1GG][mf3Zp7%3Zodu
-pKG5GUXml.4cl/-pB[V-mO!d,;=Ih.=3Zo/j:C?+tt-b.4cl314+6p,VUST$4R>;67sBlG[YH.
Ch4`3F(Gdf:-pQB$;No?+<Vd]0H`)(+>GPmEb0K;E$-qq+F>4f+E2%)CER)*%13OO:-pQUASlC.
Gp$O5A0>c.+EV%)+Cei$ATJ:f-n&d^0I](G4=;L*+>#VsA9;6mF!+t8FDbZ2FD591+=ANG$4R>[
DffE#F$2Q,0eb:8,U[\IATD?)@<,p%DJpY>@:sX(BOu3q-OgD2-tt:f.6BXSDJsW*B6,LE/NP"b
FCAg'+CfP9DImm2Bk2H2DJsW*B6+Lh%15is/g+S=C`mn0Ch[E&ASlC.Gp$R)Cgh3kARlp&@<?U&
Ec,q@FDi:4AT2a)+>jT8G&TT*+?L].+u)>D4!HC+/j:C+?SNZd+A=gM+C]:=+F>Ff4s2suFCAg'
%13OO:-pQUE+*d.AKYDtC`m;+E--@JG%#3$A0>i"FED)7DK?6o@rORl+=K?_FCAg'.3N,CFDbZ2
FD591-9`PqE"*-`$;No?+DbV,B67g.+E(j7ASlC.Gp%'7FED)7DK?q;F`VXID..NrBHUf-F<GC2
DJ+')F!)lKDfd+DEckq9AoD]4DJsE(D/aTB.1HV4,:5SsHS-Ks+Cf@>+>#Vs,:5SsHTE?*+Cf@"
$4R>;67sC$@;0do+E(j7Bl7HmG\(D.@s)m7+EM47F_kS2D..NrBHV56BkM-t@;I'&BleA=De:,'
D/aTB+EV19FE7luG&SQU3ZpL2/j:C+HS-Ks+Cf@>+F>Ff4s525+u(3ME"*-`$;No?+D58'ATD4$
AKYl/DIm[(FEo!<@;K@i@qB0nE+*j1ATD[0+EVNEA7]_%BHT/A$=n6iG]Z)0+=A:QDf'&.F*)P:
AftbuEb-@9@;]TuFD,6+AKZ).ASrVQDeqT[FD,6'+Dl%;AKZ&9F_55.Bl5&8BOr<'Bk1ajALBPe
+Dl%;AKYK'@;m?!Ea`o04>1Vh4s4HODII?tGp%3?Ec#N.@;I&rEa`o7%178tGWe)14!6X00gIc]
+u(Ds4s27\0d&V%9KFjM@W3b=HR:@/+?X1VAU&;+$4R>;67sC"@<-F#+CT)&+Du+8ASlC.Gp%9=
Ch[E&E+*j1ATD[0%16TaGWe)1-p2$^@:sX1+CfP9DImm2Bk2H84s5#fGRXuh$;No?+ECn)F(HJ4
AftT+FE8RGBQ&$0A0>_tFCSu,DfTQ)Bl7?q+Du+8ASlC.Bk;>p$?gB5+>#Vs4!lRD+F?-n0d'tF
GRXuh$;No?+EMX5Ec`FG@:p^"F`VXIF*(i2F<G.'@q[!!DId='ARlp$ATMs)A0>o8D@Hr"/g`b)
-n%85HXq5,B6,LK74p#9/j:C>+=Jpj+u(3ME-NfSHR:@/+>J3e0d'tFGRXuh$;No?+D#G$+EV%)
+Dl7BF<G.4A0>T(A7^!sA0>c$F*(u(+EDUB%17G7-9`P#-nQZ-0mdGQ@:sX1-@7?o-8%J)-n%86
HXq5,B6,LK74p#9/j:C>+=Jpj+u(3ME-NfSHR:@/+>J3e0d'tFGRXuh$;No?+DG_:@;KXg+E_R2
@;K@i@qB0nE+*j1ATD[0%16fg4ZX]I+?Ui&5WUtN0d\M:+=LSO+?^i@3\V\!@W3b=HR:@/+?X1V
@:sWj$>FI(4ZX]I+?Ui&5WUtN0d\M:+=LSO+?^i@3\V\!@W3b=HR:@/+?X1VAU&;+$4R>;67sB/
@s)m2ATMs-A9]OG@<6L$Ecc#6DK?qABQ&$0A0>JuEb-A*DfQt/Cht59BOu6r+C\bi+C]87Et&I)
4CiPBB6,LE-t@CADImm2Bk2H23]\B<3[lC>+DGd($7J#IFCAg'.3L$KF`_M4F*),,GT]%.+>Go+
-9`PdE-Mg!%15is/g,%SD.Ra%@j!1F.3N&>B6A'&DKKq/$?gB+4ZX]I+?Ui&5WUtN0d\M:+=LSO
+?^i@3\V[cE%)oV-8%J)4>f2Z%16TaDEU$'-p0@K2^okZF`_M4F*),,GU>TsG&V=.$4R>;67sC$
@;0do+E(j7Bl7HmG\(D.@s)m7+EM47F_kS2D..NrBHV56BkM-t@;HA[G&V=A/NP"9-8%J).!mQj
0d'tFDCH]T-8%J)HTE?*+CfA.%13OO:-pQUF)Po,+E_a:Ap%o4ARoFb+Cf>-A8-."Df0V*$=tqT
3Zodm+<Y`MG^*dB+EM((A7[+t$=ttU3ZoekG^+IE-T`\sA7T4^-OgD1Bm:b1F!j+3+=D5A-QloA
FDbZ2FD591+=A9S+EMdPG\&!?F(AflAL@oo-u!pQ@rj(A/NP"c1(=R"$;No?+Cei$ATJu<BOu3q
+EV:.+E1b"+DkP/@q]Fp+CQC'ASc'tBlmp,+>"^EF)to5FD5Z2+EV:;Dg-73$7I8E-T`]#-Rg/d
@s)m2ATMs-A9]4X3Zp.<.3Ku\Df9Q4Df9Q=+E_gLF`hhO-OgD:+?:Pm@s)m2ATMs-A9]4X3Zp.<
.3L;e1*A=p1*A=p0H`.o1E\\#2]t%%3=Q<)$;No?+Co%rASu("@<?''@<?F)+CT;'F_t]-FE7lu
-n&d^0I](G4=;7!.3L3'+=D5A-QloAFDbZ2FD591+=A9Z%14L3BeD(g4$5V[1FXFu3Zp:&2BZLP
FDbZ2FD591+>GY]$4R=O$4R=O$4R=O$4R=O$4R>Z@;BF]Ci<`m?ZT^tBlJ08:-pQ_D..3k?YjXh
A7'CfEbTK7F!,QV/Ke\;DImisFCfM9Ci<`m+EM%5BlJ08+D,P4+CfP7Eb0-1+Co1rFD5Z2@<-'n
F"Rn/:-pQU%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JGJ$@;[hX
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)i-DJs\Q0Hb"IF!,UIBl%i5@:Wn[A.8l@67sB73+QT10JO\[@V?m)AStpn
ARloqEa`j$Ch[br$;No?+>>fm@<jUc+D,G(@r$*-Eb0,sD.R6#F)?&404fBBAoqs0Ci_.KD09K)
@:O(eDJ()#A7T7^%15is/g)l'An>F,1*C(FBl8!'Ec`EOBkhQs-Qli.A7]9o/Kf(FG%l#/A0>K&
EZf4CARf3Z$;No?+>GTgDg!il+DbJ.AU#>?FD5Q4/0JA=@;L41FD#W&E+j;8Eb02uFD,5r%15is
/g)l(C3=>H1E^=LG\1u5@;p"!Cb-].AQWPb=)`D$Cb-]>@VHqo$;No?+>GWdF_ick+CnqqFCfN8
ATB=EG\q8>FD5Q4/0K"VDJa<1DBN@uA7]9\$;No?+>G]jDg!ih+ED%1Dg#\7F`)>CARloqEc5e;
@WcC$A.8kT$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn@rGjn@<6K4FDYu5De!-?5s]=*F(95N3B:G0
3Zoe95s]=*F(95N3B8H0>9IEoATD4#AKX)_5s[eQDf]E/3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$9g.j:JaJT6qKa/3ZqsIA0<Q8$9g.jDe't<F`_>6F!i)7+>Y-YA0<6I+<V+#%15is/g,:YBl%i5
F(96)E--.1$9g.jF(fK9E+*g/+Dkq9+=CW>FCB94-OgDH0RIkSDg-//F)rI@Ci^^HG\q8>FD5Q4
-OgDX67sBE0RIkSDg-//F)rI@Ci^^HF*2A;Df9M@%159QHSZd_A0<6I%13OO:-pQU@;]LiH#n(?
Ea`p#F!)lG2D-[=.3K',:-pQU4tq>%A0<rp-Y@C-DJO'&DBNFuBHVG>Bl%i<%15is/g*>3HZNk=
GApu3F!,=9F!)i=DII@,F*)&8@;on$-OgDX67sBE0RGSuDe't<-OgCl$;No?+DG\$B4W2sG\Lb4
F(96)E-)Nr4tq>%A0<rp-Za-IB4PRs+EMCBB-:o*@:s-oF`_>6F!hD(4tq>)BQ&*6@<6K4D/=89
-Y7O:Ag\#p4tq>)BQ&*6@<6K4D/=89-YICCAo_`sE,0<,-OgDH0RGSuDe't<-OgCl$;No?+DPh*
+CTD;+EM%5BlJ08%15is/g*>3HZ*F;4$"a(De*BiFs(O<A0?#:Bl%i<%15is/g*>3HZNk=GApu3
F!,=9F!)iFDe*s$F*(u6-OgDX67sBE0RGSuDe't<-OgCl$;No?+D5Y7+E_d?Ci^$m4tq>%A0<rp
-YIC>+E_d?Ci^s5$9g.jF(fK9E+*g/+Dkq9+=DAAH#R\9DKKqI%159QHSZd_A0<6I%13OO:-pQU
G%G]8Bl@l3@rHL-FCfK6+DbJ.AU#k;Ci<r/F`_>6Et&I?0RI_K+?MV3A8bt!+E_d?Ci^s5$9g.j
F(fK9E+*g/+Dkq9+=C6%ASZ?7%159QHZNk=GApu3F!,=9F!)i)G@b8o<+T0.Eb031De!@"F!hD(
4tq>)BQ&*6@<6K4D/=89-U`)f<+T0.Eb031De!@"F!hD(4tq>)BQ&*6@<6K4D/=89-UMNVCh[fY
ASc<sE[M;'4tq>)BQ&*6@<6K4D/=89-WFYZAo^slG\q7E%159QHSZd_A0<6I%13OO:-pQUD0KQ$
@j#i7F_54p$9g.jDe'tP3[\cgARf3mF`_>6F!hD(0d(LYF<Dr?F_PZ&A7B7#%15is/g*>3HZNk=
GApu3F!,=9F!)i@@VI2!$;No?+?hK+F(fK9E+*g/+Dkq9+=C]/Blmp-FCfJ?%15is/g)kkEccCG
-Z*:-ARAnV@;TFeDKK6-ATMr@%159QHSZd_A0<6I%13OO@rGk"EcP`/F<G[BE,9H&?U6tDCi=B)
E]H-??O[?+0RI_K+FPjb:JaJT6qK`T$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDCi=B)E]H-??O[>O$?0p)FE;PH@ST6B:et"h?[I6$IXN>XDf^"CE,ol,ATMp2E\8ID$4R>`
D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB'+EqaEA2,2L:-pQU@VfId
+C].qBFP;D67sB'+EqaEA258M:-pQUH!t5l+F.C+@3?!d.1HUn$=e!aF`MM6DKI!K@UX=h-OgDm
DeX*1ATDl8+=DMb<.96C%13OOFCfN8F*)P6:-pQ_H[\qCI3<V`/Kf.HF*&OGFEM%8FCf<.CghEs
/e&._67r]S:-pQU<+oue+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]XB%:-pQB$;No?+Eh=:@UX@m
D)r+5:-pQU%15is/g)8Z+<W9h/hS8hDJ!g-D..NtA0>u*G]XB%:-pQU+:SZQ67sBhF`_;8E]P<c
H[\80I16NY67sBjEb/[$ARmhEH[\A3I16NY67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sC-IT&X`I3<fDA76U+@:Wdh/hSac
$4R>;67s`V;Gp:g4['u:GAhM4.3N52Bl%i5Df-[M/hSac$4R>;67s`W8Q\,>+Cf>1Eb/a&ARlo9
/hSac$?Tj#FE;PH@RFs?F)silDfp"o67sa7IT1cE+EK+d+Cf4rF)rI:Ec6)>+D>=pA7]d(FCf<.
CghEs/e&._67sAi$;No?+>,9!/g,7IG]Y&\/hSac$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is
/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Kc/Y+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQUGAhM40d%Sj/KeM=@;$cmCggud$;No?+EqaEA258M/M/)j
@:WdhH!t5l+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sBhF`_;8
E]P<cH[\80I39XA$;No?+CfG'@<?'k3Zrcu7"0On$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is
/g,Li;ac(_+D5_5F`8I5CghC++CfG'@<?'k%13OO@rGjn@<6K4-[U;AIXNRd%172gF*)JFF^e$_
DJ)@U@k)hS<.96<F"JsdCi=3(+CoD#F_t]-F<G[:D/a<"FCd'6$4R>ABPDN1BlbCL/hSb/+D,P4
D..O.ARlp*AU&;+$4R>cATD6gFD5SQ%143e$6UH6+>,9!/g,:SAoD^,@<?'k+EV1>F:AQd$>j^!
@:VDA5<g8R/g,Li<.96<5<fSa%16Wk@:VDA5<g8R/g*AC+FAQ:IXN>'57Ir/$?Tj#FE;PH@T.AW
DId0rA55HD.XQVDIXN>\/M/)dFCB&t@<,m$FCfN8+EMXI@N]c(D/a<"FCd'6$;No?%15is/g+,,
BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=%15is/e&._67sC(ATD6gFD5SQ%15is/g(T1:-pQU
+<VdL/hSb/+E_R6DfT]'FCeu*FCf]=%15is/g)8G$;No?+CTD7BQ%oP+<Z#[6%44k$;No?+CfG'
@<?'k3Zrcu7"0On$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+FAQ97"0P,H!t5l+F.C+@3@0T/hRS?%15is/h0:f;GU1R
4s27tDfTA;+D,%rCi^_;DBLPa/hRS?:-pQUH[]OHEc5u?Bl.F1I16Mm$;No?.Rm!34['uuDfTl0
@ru9m+>,9!/e&-                                                            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$75+>P&o1*AA,+>Get1cHO:+>Pes3$9q8+>Ghu1,g=12'=Y0+>Gbs1,i]cFDbZ2FD5910JRZX
F`_P<DeF><FCfN8+E(j7-t@CADImm2Bk2H;D..3k?YjXhA7'CfEbTK7F(]'%ATD4$ATJu1Ddd0!
F(96)E--.DAoD]4@s)g4ASuT4A8,OqBl@ltEbT*+E,Tf>F*)P6:et"h?[I6$IXN>XDf^"CE,ol,
ATMp2Ecbl6FE;PH@WZ1&F<GXHF^cJ8ASlC&@<?(&ATMs7FEM%[CghC+7riNjE+<]mF)rI:Ec6)>
+D>=pA7]d(FCf<.CghEsFCfN8F*)P69Q+f]6uQRODf021A8bt#D.RU,+EV13E,8s)ATVL)FE;PH
@T.AWDId0rA92j$DId0rA0>u*F*&OGFEM%8FCf<.CghEs                             ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&2U:+>Y,p1E\Fq0f:p50esk,+>bc0+>GPm1*A;10d&:q1*AJ21E\V!1*A;11cQU40d&4o0ebO/
3?U("0eb@A+>GPm1*AJ22BX_/+>P'"3D`LM<*s<\D00H0Ec*We:-pR0:K(5"BQS*5BQ%p/+E27?
F<GOCDe!@"F)Q(O%13OOF)>i<FDuAE+>=p!+>=63:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU
+<Yc>BHSEm67sBq+CT;2@<iu-DfT]'F<G:8+@oI+9FV=X%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
Bl8!'Ec`EH-YRU=FD,T5DC87V;cI+FF`)&7Df.<b:-pR0:K(5"F*2A;Df9M9E,Tf>+E2@>@qB_&
DfRH>$4R>`D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sBj@;Ke!Df0V=
+<VdL:-pQU@ps1bDId0r+Cno&ATJu4Aftu&G9C=3A0>K,Cht52Df9N7%15is/g,"LDf0V=+<VdL
+<Ve%67sC&Bl.F&+E(j7DIn#7@;]TuAp%p++Dl%8DK?q4DfQt<+CehrASu$eEZfX=@<-Du$;No?
+EM[CEbTT+F(KGI+<XEG/g+YBD/aW>ATJu8F`&=BBldi.@;]TuF(KG9FD5T'F!*%WF(Jo*Ci=3(
+CoD#F_t]-FCB9*Df-!k:-pQUF*2A@Bldj,ATTXL+AP6U+Cf>,E-686F!,OHDBNt6F(HJ&DIal2
ATT&:Bl.F&+>"^WAS!!#Df021A8bt#D.RU,@<?4%D@Hq%%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
Bl8!'Ec`EH-ZaEJD/X?1-W!T;<*s`\DfT_N0ht%f:et"h?Z]t"Ec*"=Df^"CE,ol,ATMp2E\8ID
$4R>`D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB'+EqaEA2,2L:-pQU
@VfId+C].qBFP;D67sB'+EqaEA258M:-pQUH!t5l+F.C+@3?!d.1HUn$=e!aF`MM6DKI!K@UX=h
-OgDmDeX*1ATDl8+=D8EDfT_CA8,t'1,2Nj/h1CGDf[%B/M/)UF_u(?@s)g4ASuT4E-67F8l%ht
A8,OqBl@ltEd8dGDBMMH;_ALd:-pQB$;No?+CfG'@<?'k3Zp130f!KdCb[UQ$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>P
De!TlF)rHHFDYu5De!-?5s]U5@<6*B3B:Fh4ZXrV5s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eY
Eaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+Dbb5F<G"0A0>AuDf]J!$?'j$4ZX^6/g+\=
A0<Q8$8WfCA0<6I%13OO:-pQUA9Da.+E2IF+CT.u+E)41DBNY2+A#@-+D#(tFDl1/$?'HbBlA&U
3Zp4$3Zp*c$?U<6/e&-s$6UI*AhG2X/kJN(:K&BHD_</RD/XQ=E-67F0KUY"Dfd+?DBMMH;^W].
ATW'8DD!&CDIb@/$4R=b+E(d5Gmt*'+DGF?+C\biEarHbC2[Wi+EBUt+DkP&AKW?J+CoCC+EMC<
F`_SFF<GTHEb0?8Ec*KPASu$2%144#C1Uau?Q_FW3cYZ:%16TRFCSup/e&.1+EMC<F`_SFF<DrR
DII!jAKZ)5+D#(tF>%0=F)Yr(Gp$X?D/^UL4s247EX`@eDIb@/$7QDk%17#a@qfk&+?hK+Df9P'
$?'GtDf9P'$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?Q
F_u):F`]An:-pQ_A9Da.E-67TBkh]3+EK+d+CoV3E$/Y5EcP`/F<GOFF<F1O6m-#S@ruF'DIIR2
/e&._67r]S:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0emNRGqq3!D/Ws!Anbge+EVNEEcl7BDf-\,DffY8GA1q;@;]Tu
Ch[d0GRY!T67sB80lLQD1GL"rEbTW,+EVNE6um3b@W-K6AoDKrATAn&$;No?+>GTgDg!lq+EVaH
DBNk8+EMgG@q[!/EbTW,+D,P4+Dbb0Fa,#<$;No?+>GW[F_<Ee+Cf(r@r!2uG\M5@ASu!h+E(j7
DJsE(D/aTB+CoM2E+3a1+Co2,ARfh#Ed8*$:-pQU0f*QQDD='m@:WmkE,oZ9@<?''A9Da.+Co2,
ARfh#Ed8*$:-pQU0f3cdFtbcrEb0*+G%Ddg+Eh=:F(oQ1+D,Y4D'3e+FD,_)$4R>PDe!TlF)rHH
FDYu5De!-?5s]U5@<6*B3B:Fh4ZXrV5s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+DkP$DBNt<Dfd+?Afu&5Bl.:!Gp$j?A0>W0D/aP=%15L'
9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgCl$;No?+EDC=F<GL6+E2@8G%#K(+CoV3E,uHq6rcrX
:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+E2@8G%#K(+CoV3E$/b,Ch7Z1/KePG
F*)>;BmO>5Ch[s4%15p0<^]q^:fBM<+?MV3@q'*oAo_<tCM[^&+Dl=6@q-X!ATVd5ARf3mDImp4
FD5Q4-OgCl$;No?+ED%8F`MA@+ED%7F_l.BDe:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'L
FE2)5B+52]Df^"`3a4Wf1*J\4+=AQb,$uHD+C-*@+=A:ZHm!NOF_*!L,$tcd%15is/g,">CLnVs
+Co2,ARfh#Ed8cU0d(O[@q0(kF"AFf+D,%rCisc0.1HW$@;BFbBlZ?t0d/S8+?DP;3XlE*$;No?
+Dbb5F<G"0A0>AuDf]J!$?'j$4ZX^6/g+\=A0<Q8$8WfCA0<6I%13OOF(fK9E+*g/4ZZjk>9GXD
3\i$;%13OO:-pQUDfB9*+CT.u+CoV3E$0(:+Abs-9gMZ[%17#a@m)jq1a"h%0F\A-A0?.,$;!ig
4YD"2-SB+JF!hD(%14InF_u(?A9Da.E,p+L4Y@k%%13OO:-pQUA9Da.+E2@8G%#K(+Co1rFD5Z2
@<-'nF!,17+CT).ATDZsFCcS*Bl[cpFDl2F%16f]/g)Q)GpskI/g*tg<^]q^:fAKID_</CF_u(\
/g+\ID/aH7Fs(@6A1e;u%15is/g+YEART[l+E2@8D..I1+CoV3E$/\*Eb/a&DfU+GBkAK*AS#C`
A.8l[AhG2t7TW/V+CoCC+Abs-9gMZ[4ZX]5@lbtgA9Da.+D#A1AM,*%;FsSK;HZ.D+=KoQ+>#3p
+D>\7F<DrB@q]d',Y1^*740N8A9Da.+D#G$/e&/,EbTB!Ed9f#+Abs-9gMZ[/4iH4+Bot*@;BFb
BlY=Y:f9kZ5uLhp$4R>;67sBkF_u(?Bl5&(Bk)7!Df0!(Gp$X?D/^V.Bl[cpFDl2F%16f]/g+V3
A9)0e@;9^k?QaE'Dg-//F)rIE4Y@jo@;BEs-RU$ID_<^d0I/=pEb0?8Ec*KPASu$2%13OO:-pQU
Eb/Zi+E)CEE-67FDe:,2Eb0E.Dfp+D@;]TuA9Da.+E)-?E,oZ0@<-W&$?U<6/e&.1+CoV3E'5fr
-nul+0e"5l3cYZ:+<Y3;D/^UG0d/S5.3N\FDg-//F)rHdE,oZ0@<-W&$=dLd@q]C*%144#F(fK9
E+*g/+=D;L@:F%a+EVNEGB.D>AKYN+D/aP=/Nt:)4)f4SD..I14*,[b@qZ;YASu$2%13OOEZeR/
1E^UH+F+D'0H`%p0F\@<%13OO:-pQUA9Da.+ED%3E+No0@r,^bDKTn-$7J;B9i+YP<(K)=<D?:d
;H?U[<(JG\De*?#4tq>%Df6'lDe'u/Df6'l%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,BPD!g@rH7+Deru?0ht%f.VNO,ARfXrF)Pl++EK+d+D>J"AKY_tDf0W7
Ch4`-DBO.;DId[0F!*%WC*5Ge0R+^KDIal!AU/33A1e;u-n&A/C3+',G@PQ/F)Pl+?YWps5V>Vt
=%Q.9+>=63C2@g$+>=63BiK+]DKBE$E\]LoEa`j,An?!*FCf]=+D,>(AKYT*Df$V-ATMX/Df?h@
D]iaj@:VD.$6X/'@:UK.IWT.<E%bsJ/no'A-OgD*C124+@:Nsn-S@#(+D,>(AKZ)5+Dl%?AKZ)5
+DFY\A0<KW/gh)8+EM+3A0>H#@;0O#FDi:IDfp)AASbs$GA2/4+CTA6@:NtfASuT4IWT.<E%bs7
FECr$BJ*t?D/9Xg%144uART*lASkjiC`mY6+DFY\A.8kgFCB,2C124+@:Nt'BQS*-+>"^WBQ&);
@<?U"@q]^jDKI"8DBND/Dg-86EX`?uFCB,2FCf]=@<,pf+<VdL+>"^WBQ&);CLqd#DddZs+CT.u
+D#G4ATAo)A8--.D/Wrr%145"DfoQ'/SK'=A1_h5Ch7$rAKZ)+G][A7ARQ#T+EV%2+B)ifARfg)
6#:?H$6XG!E$.MdE-Vm"%145!GA2//BHVD8+A*(M+DPCqFDkb6-ZgtTC3(aF:-pQU@r,ju@W,[q
A0>u4+D,>(AIStU$?U;sDKBE$EZfI8G]Y'?Bl%?'Ao_g,+DFY\A0>u4+Co&)CNOK63XlE=C1SM8
/hSb//g,4FEbTK7-OgD*FDl;3BJ!n9Ch,,<ASbpdF(Gdf+EV%2+B)ifARfg)6#:?H$6XG!E$.Md
E-Vm"+EM+3A0>H#@;0O#GA2/4+E1b1FCeu*@rH7,ASuU2%144uART*lASkjiC`mY6+Co&)CNOK6
%144qDfT]'C`mS+FD,T'F!,RC+Cf>/GqX,FF*(t9A79Rg+EVNEAnc'm%13OO<b6;\+DQ!@@rc-h
FCfM9@3BW*DJ*cs+EV1>F<G10Ch4`$Ec5e;@3B0#Ch.*t+=M;FD/!fpEZfIB+EV%4.4u&:+DQ!@
-RU$367sBqF<G7.CiBgj+DQ!@-Y"Mc-[p/KD/_.M/o#JU4"#JcA7TUrF"_B=FD*$`-Z*R=@j`Bo
67sBjEb/[$AKZ(IC31SBBln#2@:WneDK?6o@rH7,ASuU2%144m@<?U"@qZu4IP5dqC31g4$4R=b
+EVX4DKBE$EZfF;DJ*cs+D,>(AKZ)5+DFY<6k'J4$6UI+@q'OuAfrIC/o#JU%144#C31RGGUGR#
F=q<M-T`])@:WneDK@IJ@<?01%13OO6#IfZDKKH1ATMs-DJ()#Cij6/DIIX$G%De<D]iV.@;0O#
BlbD@GBYZPATVU(E,]B//n8g:/e&.UEa`T'Anc'mF!,RC+F.mJEZf%6E,]B/+CT.u+EV:.DBNS'
F<G[=ASiQ%Ec5e;BQ%j/ATAo3DBO4CF`JU=:gmle%17/dEbTK7F*)P61,2Nj/h1pPEbTK7F*)P6
+ET1e+EM%5BlJ/:F*)P6/e&._67sAi$;No?+B3#gF!,1<+CT.1AU%X#E,9).De:+a:IH=H@rc:&
F<G7.@:Wqi+CoD#F_t]-FCB9*Df-\3D@HqJ67sC&BOr<-Bl.g*AKYT'Ebuq?F`;;<Ecbl'+C]U=
FD,5.8l%htF*VhKASj%B%15is/e&._67sB[D]j+4AKYZ)G9BLR6m-)[Ec#6,F!,R<BlbD=AU&;>
AoDL%Dg*=<DKBo?F^oN-Df0V=@V'@oG:j=3:-pQU%15is/g)99D]j1DAKZ).BlbD<@rc:&F<G+4
%15is/g)8Z+<Yc>AKYT'Ci"$6Bl7QE%15is/e&._67sC(ATD6gFD5SQ%15is/g(T1:-pQU+<WK`
ARlo2F(96)E--/CF^c^@+<XEG/g+b;FCSu,F*)P6+DG_8D]iV%BlkJABl7I"G7=mS67sB'+F@[1
BlkJ=FEM&@+<V+#:-pQB$;No?+<Vd`+E2IF+=D#7@rcK84#/NPB65MB@rc:&FE;PH@OE9@:-pQU
F('6'+CT=6D.-ppD]fJr:-pQU+<WK`E-67FD0-mJF(96)E--/CF^c^@+<VdL+<VdL+<Ve%67sC$
ATV?pDK?q<@;TQb$;No?+<Vd]+E2IF+=D8BF*&ckB65MB@rc:&FE;PH@OE9@+<VdL:-pQUF('6'
+CT=6FCfN8%15is/g)8Z%15is/e&._67sB23Zp130K3NR@k]b_/M/)TEb/[$ARl5W:-pQU.QS\-
0JGJ'@<+([+>#/f-t?q!DJ*Nk5:LYeDg,]0DKB`4AMPu867sa/BQ&*)Df0W7Ch4`1/M/)dBQ&);
C1D1"F)Pl++E)-?GA1r*Dg-7F/KedN2_?_.+CT.u+C\o-Df0)<%14L3?!qDgBQ&*)Df0W7Ch6sg
?R\5m8OccQ:+7;?%13                                                        ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)HF9+>P&o1E\G4+>GVo1,g=10H`,.+>b2s3$:.&1,'h*0d&;0+?:Q#1a"M,+>GSn0eje-1f-tH
<*s<\D00H0Ec+]L;cI+;FDZ,5DfT_<E,Tf>+E2@>@qB_&DfSZM;cI+FF`)&7Df/BI;cI+FF`)&7
Df-\:Df^"CE,ol,ATMp2E_oP1<*s`\DfT_l:K(5"FD,T5DBNn:F*&ODEc5H!F)u8?A8,t'A9Da.
+CfP7Eb0-1+E2IF+A,Et+Co1rFD5Z2@<-W9Df-[h:K(eHD/aH:FC]N2E-!.@F`\a:Bk)7!Df0!(
H"^o&ARfXrF)Pl+BPD!g+DPD)DKB`4AKYo/+EqO;A8c[5+>"^N+?(l+GT^F4A0>>mH#IS2BiK+]
DKBE$Earp"E+3`oEb$;7D]iY+Ch4`(F<G7.CiCM,Eb/[$AKZ)9@rc:&FE;PH@WQ%"BlJ/:F*)P6
F(fK9@rH7+Des!+BQ&);C1D1"F)Pl++E)-?GA1r*Dg-7F/KedN2_?_.+CT.u+C\o-Df0(     ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' base64 BASE64 frombase64 tobase64''),(<<;._1 '' boxopen fbo'
zz=:zz,'xname fexist''),(<<;._1 '' bstats antimode dev dstat freqdist fuserow'
zz=:zz,'s geomean harmean kurtosis lsfit mean median midpt mode2 movgmean m'
zz=:zz,'ovmean onfreqdist q1 q3 round skewness ssdev stddev var''),(<<;._1 '''
zz=:zz,' buildutils CR CRLF LF TAB blkaft changenqt decomm dewhitejscript t'
zz=:zz,'imestamp''),(<<;._1 '' dewhitejscript CR CRLF LF TAB blkaft decomm de'
zz=:zz,'whitejscript read write''),(<<;._1 '' dllutils cd cder cderx mema mem'
zz=:zz,'f memr memw''),(<<;._1 '' earthdistances arctan cos earthdist rfd sin'
zz=:zz,'''),(<<;._1 '' htmthorn IFACEWORDShtmthorn ROOTWORDShtmthorn''),(<<;._'
zz=:zz,'1 '' odbcREF ddcheck ddcnm ddcol ddcon dddis dderr ddfch ddfet ddsel'
zz=:zz,' ddsql ddsrc ddtblx''),(<<;._1 '' remdots alltrim read remdotargs wri'
zz=:zz,'te''),(<<;._1 '' rwtabd readtd writetd''),(<<;._1 '' socketsREF sdcheck'
zz=:zz,' sdclose sdconnect sdgethostbyname sdrecv sdsend sdsocket''),(<<;._1'
zz=:zz,' '' sunmoon IFACEWORDSsunmoon NORISESET ROOTWORDSsunmoon arctan calm'
zz=:zz,'oons cos fromjulian moons round sin sunriseset0 sunriseset1 tabit t'
zz=:zz,'an today yeardates''),(<<;._1 '' trig arccos arccosh arcsin arcsinh a'
zz=:zz,'rctan arctanh cos cosd cosh dfr pi rfd sin sind sinh tan tand tanh'''
zz=:zz,'),(<<;._1 '' unicode ucpfrncrd ucpfrutf8 utf8frncrd''),(<<;._1 '' word'
zz=:zz,'formation wfl''),<<;._1 '' xmlutils afterstr alltrim atags attrvalue '
zz=:zz,'beforestr belongstrs betweenidx betweenstrs eletags getele geteleat'
zz=:zz,'tr geteleattrtext geteletext geteletextidx read splitstrs tags writ'
zz=:zz,'e''                                                                 '
zz=:1409{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GBq.+>P'!+>Yc01E\V!2)R042]t+71*A;-+>P`52e[;MFD,T5DGEMN.VNp@FD,T5DBO!P/Kc0N
+CT;2@<iu-DfT]'FED57B-8UEBQ%p/.3N_G@<<W)ASu("@<?(%%15is/g*\a9h[/K$;No?%15is
/g+,,BlbD.Ch76fDKI"B@rc:&F<G%<+B!,jATAnaF_Mt4D/a<&D.RU,F!+m6D/WrrC`jj=Afu2/
AKY^s$;No?+CT;2@<iu-DfT]'FED57B-;/6Bl.R+Bm+&1+EV:8Ec*!J,!%.q+EV:*F<D]=ASu("
@<?(%+<X3S9hZ!':-pQUDfp/@F`]5Y;e9M_FD,5.8g&=lCM>g=$;No?%15is/g,=KEaiI!Bl,m?
$;No?%15is/g)8ZBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>FjF)tc8F"]juG\(D31,)"7
Eaa5>1,)+1F)Yr(Gmt*U67r]S:-pQUAU%X#E,9*,3XlEk67r]S:-pQU+<Yc>BHV"A1*A=p1E\L`
$;No?+<VeKBP8MN+tt-R/i"P)+>Y,s%15is/g)8ZFD,>12'G"9+?V#[F)to5F=.M):-pQU+<Yc>
BHT&Q1E\Ls,TpeR-8%J)BeD=R$;No?+<VeKBP8MD+>P&q+=&'XBeC_b5%uW-.4dSD1*AG"-Xe,?
+D#.tBPD3/%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB'+EV:1+>"^N+CT;2@<iu-DfT]'F<G:8+@oI+9FV>(67r]S:-pQU@<H[*DfRl]+B!,j
ATAnaF_M9l:-pQU@rc-hFCeuD+>PW*0MPtr1GK=G:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@r,RpF!)iDFDZ,5DfT_C%13OO@W-L&A0<!X3Zp46+?^i'+Z_:d$>jl-+<VdL4ZX]>+D!/J,Rk)i
Dg5b7+<Wg.+?:T+2BX@p%172eDfT_<+?_b.1*@\nHX^o<@grceBl8#8+<Wg.+>Fun0RI8IG[h0i
@Uj=sDBL&b3ZpC)+?"RUDg5b$$=[^eF<D\K4ZX]E+>GQs@W-L$%13OOF(c[=+<Vdi3Zoh#00jqH
+=nX^3[m<B0d\G#5U7I#,V1Ae>n%-]Dg-7F+<Wg.+=]$L/jOhG5U6dG@Vd/0+<Vdi3Zri'5U\01
0I]78.k`>:-nlu2.6o;/0-Fs]5^P+K-nH]".4G]5D..L$+<Vdi3Zp.(/1r%i-7g8j/g`8;4utrC
/jLWj$>j3n+<VdL4ZX^&@<63L@Ve;MDg-7FHQX[Y-Qjr_F(c!i%16ZWB4W2.+?_b./3kU<-7gbu
5[,@Z/jLX(.lop?5[,?V+C,E`Ch74#+<Vdi3Zr!EB4WD<1E\])@W-L$.6p'^-nlup.6q)[/0H,j
+>G&q+C,E`EbT0"F<D\h3Zr!EB4WD<2'=o+@W-L$.6p'^-nlup.6q)[/:Jcs+>G&q+C,E`FDl+@
+<Vdi3Zp.(HnIZ4FCT60DC-n`5U^2SB4WE3Bl8#A5X%F]0d_5r5[,?^+u18`>n%-MDfd*E+<Wg.
+>G3j/jLgo@rHC*-7gT2-tQq%AL:l#DKI<m5!UMN-@71,>9GI@14C?O%17&cEbTA5+?_b.>9J$+
E$/@-@W-?2>9I`nAoo/9BkM+$%13OOFDl,7AS-$I3Zoh-HX^o<@jr`Q-p01+0I_E!+@%%t-sn`V
@W-L$.4-Su.3Lku-n&FWHX^o<@jr`U.1HVuDKBN&AKX,s+>Fun-@IKh5WU#L+@%t1-nHtt/j:p4
0e"513ZohmDfBN(Aoo@P4t-pJFCArr+<Vdi3Zrc%+=A9Z,%"Y;D0-3oAo_<sAKW*Y3ZqWLE+O'(
D'40j>9IWtF(o/r5WU<8@;BF$/j:^.1*A,/?90Jh4X33;.6q/J$?BW!+<VdL4ZX]64t\KRF(cmQ
4t.U>3Zoh%/jOeF+u2DE-nlup+u(N.0d_5k0e"513Zogr-9`jf$4R>aBQ%p/0d&V?+<ijSFD,-%
GT]7(+C]86ARl5WFD,-%GT\+l3Zohk@j#B(@;TQu>q$m]3Zohf@<=bVBQ%p/0d\M:.1HUn$?Trj
Dg5c*ARfL=3Zp4$3Zp*c$6XXX/g,7L@W-K6Gmt*'@<6L$Ec`oV-mL!`.3Lbr1*Ab5+<r.W%144d
F)to5F=n\^+>#W$-sn_VI4crq,Tq@A$6XFR/g)Q)0I2*S1+ORpH7=2e%144s4Y@j*HS-Ks+ET%T
AM,)Z+>Y,uHX^o<@grbfEBPos.!mQh+<YbT+D!/J0H`(m14*JKG[h0i+CT>4ATDlF+F5.^3[Q7'
/9!*l06&Ec/1Dbu+ES&"+F4J(.1HUn$>s<oE$-8G+?_b.><3lg+=JX#-RN_?F)X2g.3LE%I68]-
+CQlO+FAP[@4i[:/g+FB+AP6U+ED%4Cgggb+EML1@q?clGp"GO@WQKM%17&_A0<!;+<Wg.+=B9\
E]tin,^pjm+=\K`5[,?\+>"$0%15Et=@5VF;H#_>+?:T+2BX@p+<VdL+AP6U+C]86+CoM$GA1r-
+Cf(nEa`I"ATDi$$<'be6Ualq+?_b.-TlKk+Cf4rF)sKcE+*6fE]uU-A3M>X@WQKM4>1ee5!1K?
E]tj%6W-TI%13OO8jQ?Q6!7,c=\M7I3Zp+!3Zp*c$9WBOH#.%7FEqh:4X+uZG]YTKF)rNh%14_&
@<-BsGp%HGDf0YKAmoOjCjA'YDf0K7E+*6f4+.PFFCAWpAM._+EcPT6+F@R9Eb&a%/Rr^8Cgh:(
ANF=>Ci!O!F(IF]%172c@VfU.C12.'@<iu;A0?5.DfTB"E]S8[Ch[E&@VfI_CER_4Bl6!TG%G]9
Bk(Rf/R`I0B5TbPDf@c\E+*9fBl7QE0J51nD**.T$?T]cCh556@<-BsGp%3L/otu?@qB['FCZM@
@W-9tATBhLDf0,JI16NG06;5\Ch5d>$7QDk%172jBK\C!1E\_$0H_K567sB)FD,T5DB^2O@<-Bs
Gp$^;Ec#6,FD5W*.3NSMDe+!#Bl7Q+85r;W+E)CEE-673$6Vr,;Goe`;cHmn74]fKA8-30@r,Rp
F$48HEcPT64sqm00HbINBHVRL/13P5A8-3N-OgDD%144lAhG2S0HapZ+=)4]+?hh/1GV*L+Z_;"
Gp$X9/g)8Z+<VdL+<VdL+<VdL+<XEG/g,E^BlbD.D/aTB+E)9CDJsV>@W-L&A.8kg+DtY0E$/LE
I4cp!H7:Ci+E1b"+<u1q/g)QZ@<<V93dE/*+u(2f4CW=p-OgD*AScF!/g)8Z+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sC++DGm>@W-L&A.8kg+EK[u+F>^b0d%lO14(W!
F=A=\,V1AeF?M6!,!'ul+<VdL+<VdL+<VdL+<Ve%67sC%+DGm>0lqFZ@rH1+D/LJ1DBLZTF<GO=
@;]X!Bl5%;3dD/A+<Y>\/g*8;+>P&kIP4qK8M2-,+D!/J0H`.o2L@bd=@5VF;H"\\+<VdL+<VdL
:-pQUBOtmjBQP@F,9Uf:DIml<+DG^9ART(^+EDCE%144#H9El'BHVD1BI5>q+u18l3aOiq0Kq*E
/L)Nd.3NmY+<VdL+<VdL+<VdL+<XEG/g+bEEc#6,+D"tkBHU`*Df#pj+<Ytn/g)Pi4EP*t-S-W-
06C_g-S0^P.4-Z2+F5.Q+<VdL+<VdL+<VdL+<VdL:-pQU@WGmeCLqT1ART(^+CTA1D%-gp+F61'
+?Vn;-TlKk4sqm/4>1es4sqn14"2@.+F5.Q+<VdL+<VdL+<VdL+<Ve%67sBiEa`HnATT&+@:Nsn
Ec6.2$6UH=4EP"@Ch4`!CghC+4_eDGEaa5W-S-Z--uEC6CER)&+EDCEF!,`WHW*a,6Uam7/:&`r
-Tj&(@:F%a4sqm0?Sm0`GT^s6A0<+6@<<W6.4dha9L]Hu+D#G$/e&.:Eb0)uDfg%q67sa.ASksr
FE8R;/M/)cAT2Ho@q?cnDfg)4A0><$B6A'&DKKqBBl5%c+D#e:Ch[C$+Cf>#AM+E!:-pQB$;No?
+A?]^A9/l%+EMC.Cht5:FD5Q*FEo!NBOQ!*@;07n+DG^9FD,5.@rH7.ATDj+Df-\9Afs\g2(j,*
+Cf>#AISuA67sC&D]hXp2D05)+Cf>#AM,)qASu("@<?''FD,5.-urm9A8cR2.3N&:A0<:EDfTB#
DfT]'FD5Z2.3N8DDfp#?%15is/g+S?A0?#9AKZ).AKXSfF*(i.A79Lh+=M&E@:Uf0FDi:EF(Hs5
$;No?%15is/g,=KEaiI!Bl,m?$;No?+<Vd9$;No?+<VdL+ED%5F_Pl-+=CoBA1%fn:-pQU+<VdL
De't<F`_>6F!hD(:-pQB$;No?+<VdL+Dkq9+=DAOEb&d#Ec#6,Bl@l:%15is/g)8Z+<YN;F!)iN
ASksrFE8f=$;No?%15is/g)8Z+<YK=@:UK.Eb0)uDfg%J%15is/e&._67sBhF`_;8E]P=8DeO#2
6nTTK@;BFp%15is/g+YEART[lA3(i.Dg#]/@V'R&1,(C@%13OOEb065Bl[c--[0KLA7fb#D..O#
Df-pF+AP6U+A,Et+D58'ATD4$ARlo3F`_>6F"&5BBk)7!Df0!(Gmt*jDe!p1Eb0-1+=DI_%13OO
%13OOF*2A;Df9Mg67sa/F`)&7Df-\=/M/)TDf'H9FCfM9F*2@CEbTT+06:]H+EV=7ATJu&DIal%
F_kk:DIn#7D/X?1+Cno&ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g+kGFCfK)@:Njk
GAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Kc/Y+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+CehrD/X?1F!)SJ+>"^G@;KLmA79L$A79RkF!,C5+Dtb7+CT.u+D,b4C`mS5
Df0V*$;No?+<YN>Df0V=+<VdL+<W6YFD5T'F!,C5+Dtb7+CT.u+D,b4C`mS5Df0V=AoD]4DBNFt
Ch7Kp@<*K9ARTV#%15is/g)9XF`)56F(KE(F>+gh+Cf>,E-686F!,OHDBNt6F(HJ&DIal2ATT&:
Bl.F&+>"^WARuusEc6)>+CoD#F_t]-FCB9*Df-!k:-pQU+EM[CEbTT+F(KGJ+>"^GDf'H9FCfM9
F*2@CEbTT++CT.u+EM+9+EV=7ATJtG+EM+*+D5_5F`8I6De!p,ASuTuFD5Z2+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN//M/)S@;BFp
C1K=b5\FqBBl#D3Df$U>%15is/g+YEART[lA3(hg0JP7nAR[AL%15is/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P++:SZQ67sB90JP7nAR[AL+EM[CD/X?1+D5_5F`8I5Df0`0Ecbl'+EVNE@r,RpEt&IO67sB9
0JP>$@rsC\+CoD#F_t]-FCB9*Df-\+A867.FCeu*AoD]4-u*[2Ch\!&Eaa'$.1HUn$=e!aCghC+
+=D5QDJa<1DC6P9$?pE/A7fb#D..O#Df/<:/h2'`Eb&d#Ec#6,Bl@l3F"JsdGAhM4+D,P4D..O#
Df-\9DBNb0DImlA$;No?$;No?+B3#gF!,%1AS5FhF<D]FEc5T2@;RP<-tII3+EVNE;K$2ZEZdnq
BdkSUB4YslEa`cuH=_.?8ge[&4$!^D67sC)DfTA2+D,P4D..O#Df-[?E,oZ0Bln'4AKZ)5+E)41
Eaa'$+E)-?Ch[cu+Co&"Bl.R+ARlp*AU&;L$;No?+A$Yt+E_a:F!)TIBOr;/A9hTo+E(j7+?MV,
+EV:*F<G:7E,9*&ASuU2+<Y)8+D,>*Blmo/+EMX5FCbeS67sBt@:NtbDIkFC+@]:(+<Y3+Anc-s
FD5Z2F!)T6Eb-@9F*2MBEbTT/DJ*d2+<Y6-AnbahASuT4+CT.u$;No?+E27CATDC*C`mG0+A+6n
:-pQ?:-pQU8l%ht:/=hX3ZoPeBPDN1+EM%5BlJ/:BlbD<FDl22A0>T(+<X9P6m,oZ+CQC*Ec6)>
+<Y?/@:Wqi/db??/g+,,BlbD9Eb0<'Ecu#8+EV:.+Dbt/Bk&8.De:+7FD,5.+EM%5BlJ/H+<Y`8
EbTK7/g)QdAo&n=+DGm(:-pQUD..-rFCAm$ARlotDBO%7BlbD-Bk)7!Df0!(Gp$O:+CQC5AS,Lo
ASu!h/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU+<VdLG@kYS3ZrWYCgVKq$49Np/h1CCE+Not
ASuU2$49Np/g)9MBk1ctF(96)E-*4=De!3lF!)VS.OdM5+Dk_,+EM.2+EqF6?[?&d$>jBk4Y@j4
2)Z^6+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sB_+E)@8ATA,pAo'U_+>Fu]-oihe/nlpc+=AT\
+<VdL+<VeTD.[T,+AP6U+B'D,BPDR"F)YPtAKWCBE+*6f+CT.u+D>\6BmO]8FCAu.FCAW-$>jBk
4Y@j4+<W'\@4l7H-UD/g.4[&c/i#=6+FS*=C`jiq67sBH+@.S_+CQjJ+D#e-Cis9&DJ((e+@6EP
Ao'U_+>Y,_-t+`B/gjCA.3K`U+<VdL+<VeTD.[T,+AP6U+AO&$BOr<&ATW$*EZe*aD.[TI/g)tn
+=LYNBeCc"-Rg/\+<VdL+<VdLI;NS4+<XEG/g*J'FD,5.Ch7^1ATAn[$>jBk4Y@j7+<W(@/nlpc
0JP==1c70M3&t=n.=H&FC`jiq67sB@+Co2!BlnD=@;]Tu?OCX^CcsBn2BX+j@4l7H-S?bq+<VdL
+<VdL+<Z)LAo&S4:-pQU6m+)hD.[TI/g*(q+=LYNBeCbo-Rg/\+<VdL+<VdLI;NS4+<XEG/g*M(
3XT_9CcsBn3$9=l@4l7H-RU8h.3K`U+<VdL+<Z)LAo&S4:-pQU;'9k$DffOtD.[TI/g*.s+=Js#
.3K`U+<VdL+<VdL+<VdLI;NS4+<XEG/g*MZ$>jBk4Y@j30H_bu0I\+e+<VdL+<VdL+<VdL+FS*=
C`jiq67sBS7LBKDAo'U_+C?m0>TtmFI4c]r4"akq+=Jod3Zp+*$7?ru+<VdL+B'C*+<Wrm+<Ve%
+<VdL66IBn+?:Pe+<X&p+<Vdo+<VdL;'6u(+@B$L+<VdL9L^-I-XAD5+>Fun+<WBo+>Fu]1*A:o
+>Y,p+<WE^0d%Ss+>Fu]0d&1n+>Fun+<WTc0d%Sn0H`(m+<WB]0d%S]:-pQU0H_KPDJ=3,@;H8n
0d&4o+>GVo1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%
67sB8+<YTEBOu2k+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\0d&.m+>Fum+<WTc1*@\o
0H`+n+<WB]1*@\^:-pQU1*@]JCiD%FF_qI.0d&4o+>GVo1*@\p+>=o\1*A7n+>b2p+<WE^0H_Jm
+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB:+<XDd+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^
0H_Jn+>=o\2'=Rq+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU1a!o964+hq+>=o\+?:Pu+<WZe
0H_Ju+>=o\3?U!u+?:Pu+<WB]0H_Jm+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*"o+AP6U$6V&G
1a!nq1E\@o+>t>r+<WQb0H_Jr+>=o\2BX[r+>t>r+<WB]0H_Js+>b2`0ea_*+<Vd]+>P&^+AP6U
+>t>bDKTe'+?(Ds+<Vdc+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WWd0H_Jm0H`+n
+<WB]1*@\^:-pQU2]s4j$6V&G1*@\o0d&4o+>P&p+<WH_1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u
+>=o\0ea_*+<Vd]+>P&^+AP6U+?1Jd-RT6D3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+?:Pu+<WBm+>P&^+>Fuo+<Ve%67sB@+<Y04D/Ej%F:'-F+>P&^0eje++<WE^1*@\r
+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\o0d&.m+<XEG/g)l&+@B$6+>Fuo+<WBn
+>P&^1*A=p+>b2r+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0eje<
;G9Oe+>Fuo+<WBo+>=o\1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]
1*@\^:-pQU0eskmE+*6f$6V&G1*@\o1E\@o+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u
+>P&^0ea_*+<Vd]+>P&^+AP6U+>GYpF)YPtAKYDnFCfJ8DKTe'.1-DW67sBkAS,XoAKY])+F5.^
+Co%nCgh?q+D5M/@UX'qAoD]4-td(%E-!HN-n6Z/3ZrWYC^PAuCgVKq4ZX]60KX>fCccKGCagJR
+?MUk$;No?.V3L.A7]^kDId<rFE7c                                             ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3A_j52]sju2BXb/+?(Du0d&@s0fC./0H`//+>G\q2)ZR:+>Ybq0f1"01*AP!1c?I8+>Z##2]sq4
+>t?!0H`)(+>bqu2]sk5+>b2s1*ALu0fL401E\M3+?1K#2I^*9AMuAVDI[TqAM7S*@rGmh+C\c#
AMuASDg62>AStsqG\(q=<E)FI+D,>(AKYl!D.RctF*(i4F(/R!Bk&9,FCB9*F*),+F(09+Ch.[1
Bl%i_:IHj.+EM%5BlJ/:@WcC$A0>i3De!@"F(oN)+EqaEA929mGA(]4ASQ9rEbTK7GAhM4F!,(5
EZfC6D/XT3DJ()9BPDR"+EML1@q?cmBOPpi@ru:&F!,(8Df$V3+EM%5BlJ08A8H()FD5Q4A8H')
@ps1i05Y9;DfU+GD..<jB4YpkDKI"DFD5Q4ARTV$BOkguFCB&sATM@"D/aW>ATJu)BleB)DI[7!
+C\o(G@b?'+E275DKKqBDf-\/@<-I'BQS*5BQ%p/C*6r*Eaa59AoD^,@<?U*DJ((?FD,T5DCH]M
BOQ!*B4YslEaa'$F!+"Q9h]J9@Ui;)7WN'PATD@"@qB^(FDi9t6pa6`GAhM4F!*%WEb065Bl[c-
-Y-a8Eb0)uDfg&@AT2Ho@q?cnDfg)4A0><$B6A'&DKKqBBl5%c+D#e:Ch[C$+Cf>#ATE!:@:Ebf
ART*l@;]TuGB.D>AKXr<66KfMCh[a#FCeu*FCf]=+EV%$Ch7[/De!QoFE:>K7WN'PATD@"@qB^(
FDi:CDe!QoF<GdGEb'56/Kf(FEHPu9AKW@ADe!QoF=2-PDJa<1DKBr<+CT.u+Dl%8DBNFtCh%U(
@<?4%DKBo?BkML/@;]UaEb$;7EbT0)DJsB'FE2)*+D,b6@ruF'DKBr<Bk)'lAT_m)@rGmh+E_d?
Ch\!*ATN'6Eb&d#Ec#6,Bl@m5DfTA2AoD^,@<?4%DBNk8+Dbb0ATJtG+C]A0GB7=<B6%p5E$/h*
@:WqiG\q8>FD5Q4EHPu*CER&'A0>DsEccRLG\q7>E+*d.Bl7Q+-6R8JDe!@"F(oN)+EqaEA9. ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&u+?)&53?U:(1cBDtDJa<1DXY3P?upI.D/X?1?m'0)+CQC&Des6$@ruF'DBNk0+C\c#
Bk&8oF*)G@DJsB+@ps0r@;KRpEbTW/D0$%`BOr<%AU,DAATD7$+CT;%+CK&)Df0W(/0J>AF`)56
F(KE(F>.)F@;]Tu?upI.EbTT+F(KGJ/moeE$:/KE+E(j7FD,6,AKZ/-Eaj)4G@bf++Co&(Bm+&u
+D,Y4D'2/2;b9>!E,ol0Ea`g++E2I4Ch[s(ARl-^DBLE-CO%$L+B2ogATM@"E+LLAD..'cH>.8.
+DG^9FD,5.0f_6J-Z^m_<+ohcEb0<6+E(j!FD,5.G%G]'F!,17+CK85DJa<1DI=SqEb-A1Df^#:
Gp$X+FCcS'DIal3EbT0)DJsB'FE2)*$?^H)Ch\!*ATKI2$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHZO=I
D/X?1I3;+!FCfK)@:Nks$4;62IXWDd+>.COI0q)>@ps1jDf9N7+<VdL+<XEG/g+Y4Ch7Kp@<*K$
@<?(%+E(j7DIn#7@;]TuAp%p++Dl%8DK?pC+<VdL+<VdL+<VdL+<VdL+<Vd6+<YN>Df0V=+<VdL
+<VdL:-pQUFD5T'F!,C5+Dtb7+CT.u+D,b4C`mS5Df0V=AoD]4DBNFtCh7Kp@<*K9ARTV#+<VdL
+<VdL+:956F*2A@Bldj,ATTUK+<XEG/g+YBD/aW>ATJu8F`&=BBldi.@;]TuF(KG9FD5T'F!*%W
F(Jo*B6%p5E$/\0@s)X"DKK</Bl@kr+<Y`JDK9H4ATMF)0d%S]:-pQU@rH4'F`_29+EM[C+ED1;
AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+Dfp"AA8bt#D.RU,@<?4%D@1iAIXVV2>]Y$sF(Jj'Bl@m9
>]aP%FCJieFCf]=FEDkNF`)56F(KE(F>/+c>]aP%FE;8FFtG:o+EM[CEbTT++CT.u+EM[CF(KG9
FD5T'F+"B&<+oue+<Yi=Eag/)@<3Q#AS#a%@:WecFCeu*Ao_g,+CQBZ5uU?B+E2@>B6%Et+EM[7
D/"*6ARlomGm[Gf@VK^&+@e%,+B*B)@<-H4+=^<*Gp"FV<+TlWF(9--ALDOK+<Y`=DfTr2F*&NI
F*2A@Bldi=F(KG#E,ol0Ea`f-+Cf>-FCfN8/g+50DJj0+B-8=.DKKo5ATJu<ATD?)Ch[s4ARlo+
Bl5&8BOr;/9jr'PBF6IS3AhpFF*)G@DJsB+@ps0r6Z6g\F`_>8B-:]&CisT4/d_qbBOr;/8g&:g
EcYr5DBNk0+EV:2F!+n-B5_g)FD,M6BOPs)@V'+g+Eh=+FDl26H=^V>+<X6t+Ceht$=e!kE-686
+CT/5+Du==@V'R&De:,5F`)56F(HJ&DIal2F`)83F<G[>D.Rc2Bl5&3DIjr#@;Ka4$49aGAKYA/
Gq!,D@<-"'D.RU,+DGm>@3Ar8.W/W:Ao)BoFD5W*+E275DKI"C@:F%a+EqL1Eb.9=$6UH6+>A-b
BlbD5@<?4*F_#&+Bl5&(AS6$pATJu<Bln#2DJsQ;BOu4%+DbJ.BlnK.ATJu5Df]W7Bm+&?$6UH6
+>J3cBlbD5Df03%FEM,*+DG^9A7]CoAS#p*GA2/4+EqC<FCfK1+Dbt6B5)I1A7]g)DImHhFD5o0
/d`^D+<WFd+DGm>G@bi;ATDZ2FD5T'+F7sDATJu*G]7\7F)to'+CT=6E,Tf3FD5o0+EqL;Ch4`&
Dfp)A/d`^D+<WIe+DGm>FD,5.D/X<6BHV28D.7's/d`^D+<WLf+DGm>FD,5.A79a+DKTf*ATBC1
$<1\M+ED%7F_l.BBlbD*+Du==ATDKp+EV%$Ch4`5Bln#2AoDg4+EDCEF"SRX<,Wmm@;]UlAKZ).
AKYJkF(KD"GA(Q*+EV:.+EM[C+Dtb6ATAo6Bldj,+E)9CF(KH7+EV:.+D,>.F*&OHGAeU8Ch7Hp
DKKqBDe:,6BOqN\DfTl0F)Z&8A8,po+ED%7F_l.B@rH1+D/OD;@<,p?$47mu+<W@b+DGm>:/=bZ
;ajVR<$5Ue+DG_:@;KXg+D>\9EZf(6A8,O^FD5W*+Du*?EbTT++E)9CF(KG#+<VdL0mb$WF!*.Z
GA(Q*+EV:.+EM[C+Dtb6ATAo6Bldj,$6UH6+>J3cBlbCO+EqL1DBO%7AKZ&:DBNh.G%G\:F(KH7
$49jCEc,T/B0%/WBPDN1@;KRpEbTW/D'3;.ART@q+D,P4+DbJ.BlnK.ATJu(Ci=B+$?U2/FD,5.
;f?f#BHV84Ch54+$<1\M+E):7B5)6lC`l&1;b9>!@rGmh+D>2)+C\nnDBO":BkM+$Cj@.?De*Qo
Bk:f^FDi:EF(HJ(Df0Z;DepP;FE2M6FEMV8F!,17+E2.*@q?d$AfsT><)4l_+CT.u+Dbb0AKYl5
D.7'sF"Re,6"FDCFCeu*Ao_g,3XQ4CIXZ_gHQXqN+>.PSD.7's9PJBUF!,OG@<-HZEc5eX+u(9i
+:9bO+B*E#EbTT+06:]H+C]U=;D'(^/g+)7F^]<4/0H'0AU%p!D]hD]FEoD[9kAQ`@rEJ>0+(NI
+?^i'/ho1;2*!EM2'Y.)6rG-j+AbWP0-Du/0KL=S6m+W80d&+l6rF@`:/Fqi+<jKfF=\P.Df021
-tHn%.3^hr68^;:9Jm/K:/Fqi+<jd!D.Oi9Df0,/-tmXB.3^hr8.%[@+?^i8;BRG368]*A:/Fqi
+<jNuDKKPC+Cno+,!-oA/0I=f:*;\B8PW551,h'5.NhG.0-E8(+>"]k+=\L*:/iVi9ctr/3@Q((
+>GW#+=eR&+>"]l0FCK-+?^i(/iYdK0d%th/hf"=1*A%h-r(m8+>,Mo/Kd_E+>4in2D?Qe6QeN7
/hf(;1bp1'+B(j,-ql<;.j-Q!1Ggs<$:?Qk4WmWj+=\K^5u^T-<'a8-9J@S>+@@S,+>"^%<)+ho
3AEHM+=\L55u&h%0H_kg6RaH,/KdD0$<'>84Wl@53B&o?.NhY]:+/di+=eR%.68S=6m+W8;c-F@
0d&%j;a_`X+B(ZW$<';74Wl.O6m*s%;b9_468^27.j-Gu0f1a:+>4ic6VgW/68^27.Nh)H.1/X9
+@/=m-rWJ^+?Ve00d'Fd78=14+@@q-4WmWj+=\L"<)+i?6Qe$);c-F@0d&%j;aVZW+B(WV.1.1?
;DB:W+>t>o+@mV,+=Ko@+=eR%1*A(i6Sg/60-Du,$6UH^;BS+F8PW55;DBU]+AG`V4Wm<k<%'.m
0d&%j85^lZ.NgW'.1.1?:f9k[<$51>8PVbu,#`W%EbTT++CT@7,9o5o,9f2l85_Ml9i;<@+B(!;
4WlI=+>"^,+>"]a9JmqC+@@n,/KdD:.3L8d0f9:\+@oER4Wm<k<%([".68SG;]n4G8PW55-rViC
/KdS_.3L)_2D?Qe+<XKY8PW5-<DuIa7j'!SF`)83F<G"6+<r*l,9nBo+@oEm+AGcA78-WK8Oah$
6QeQ80d'Fd78=14+Abs-:/i>[;fut#F`8I3Cht5)@<j%(78-WK8Oah$6QeK6/MSAI84?8\+<XKY
8PW5-,#`W%+CoD7DBNA(C`m7sGp3Sa:.-3r7LDRZ6jeBlIXVV2IXZ`p+F>4`C*7p3D/X<#A3(iN
FAcgoATMF)+?_>"F*2A@Bldj,ATTUKAo'e-852JZ$6UHd67sC$Bldi.@;]TuF(KG9FD5T'F!+n5
+@L-\+A?3ZAKZ)5A79a+-tHb3Ch[NqF<GX5G%ki,F"%G=+EV-W/g)Q!1a":k0f^O<0I\P$/Kcu1
+=eQi0dS_3.4cSu+=nX`/g,7SA79a+0FApFF*2A@Bldj,ATTUKFCY^c+<XEG/g,1KF(HJ&DIal2
ATT&:Bl.F&+E)-?8p,#_+>Y\oDf-[fEb/g"GA1Q#+Dk\1Bk1pdD@.L/F>,j1+<Vd\+>=ol+>t>u
0H_J\:-pQUAT;j$FDl1,+<Yb\4Y@j"1cZ[4+>=or+>Y\o+<XEG/g,%MEcbt;/Kek<F<GL6+EqC<
FCfK1+B;>n6Xak@A76TiDfTB"EXEp3F>?!3+C?ra+>=ol+>t>u0H_J\:-pQUF)Q2CBHSlLF)Q2C
BOu4%+@BgVCh4_tDIakUEbAs$FD5W$$6UI51Hd?5+?)/#0H`%l2BXe0+<Ve%67sBm@<*K.DfTr5
+=M;RDBNA(G@>c<+E_WP$6UI51d*H6?T0hb0H`%l2BXe0+<Ve%67sBm@<*K3Dfp/8+=M;RDBNA(
G@>c<+CoD7DCGo"+<Y`JDK9H4ATMF)0HbHk$47muF*2A@Bldj,ATTUKF>+gg+ET=\/0K$i+=nXW
1E\50+ETFI$6UHd67sC&Bl.F&+E)-?AT;j$FDl1BAoD]49jr'PBHT&b+D,P4+CT)&+>G!PDfp(C
FD5T'+F7sDATJ2$+EM[CEbTT+F(KGI+<W?\0H_nj0d%kq/nlp\1,LF&/0Zek>p(pG1,0+C+<XEG
/g,7MD.Rc2AoD]4@ps1bDId0r+F.O,EZd(s3AhptDBO%7AKXK`AS#b'Bk(g!D.Ra%A8,Ii$6UI.
A2uM1/g)8n2]sds0H_nj0d(ls+u(3cARTUi@<?(%+>Gl:2$tHKEcWop2*EQ7F*2A@Bldj,ATTUK
D.GXa$@[GQIL6EeF*1r5ARfgrDf0o,FCf]=@V/keAU&<=FF/(ODK9H4ATMF)0mt0LFCf]=F)62H
/M2AnF*2A@Bldi.@;]TuF*2AAATT&:Bl.F&I0p<\BPDN1G%G]'+D>2)+C\nnDBN@u@;p="A0>K)
Df$V*+@8@m8OFV>Ec5T2@;R-.F^f3%FED))+<Y-=$;+`DATJt:6?6dWBOP^n+<YcE+=^<*Gp"FV
<+TlWF(9--ALDOK+<kl?DfTr2F*&OGF`)56F(I"GATS8uEc5T2@;R22@rH7,ATMrG+<Xa"DJj0+
B-:c'FE2),F!,[<Eb-@9Ch[s4ARlotDBL'DBOr;/9jr'PBF6IS3AhpFF*)G@DJsB+@ps0r6Z6g\
F`_>8B-:]&CisT4/d_qbBOr;/?mp:L?m&luB6A'&DKI!DDe:,"F*2A@Bldj,ATTY7+<YB>+CQB8
?oBKP?m'&tDdda%DJ()2DeX*2$?T]cCh4`5BOu3q3XQ3:+<Vd\HQ[$D+DbJ.BlnK.AKY])+Co%r
Eb/g'+EqOABHV22Ecbu+Ec*"9@<?4*F_#')+E27?Bln'4AM+<4+<Vd]HQ[$D+Dbt6B5)I1A7Zlt
DBNJ$B6%QpF!,[@FD)e@ATMs)Ec*"9Df03%FEM,*F!,@3B45mrG%E95+<VdL14(-XF!,[<F*(u6
DBO%8D.Oi9Df0--+D#e:Eb0<5ARlolF!,F?F(o`1G%De?BQ%]u+D>\9EcWi?+<VdL1OC6YF!,R<
AKYi.DKKP7DKTf*ATBC1+<VdL1j^?ZF!,R<AKYMlGp%!ID.7's/d`^D+<WOg+DGm>FD,5.H"CE)
/d_qbBOr<,ATN!1F<G:=+CQC1F_t]1Bk&9-@:F%a+EqOABHUo*F`JUFDg-7T+<XX%+D>2$A8Gg"
FD,5.@psFiEsd,)ASrW4BOr<-F`&=>AThX*+ED1;ATJu4EZfF7FE8RHBOr;uBl\9:+EVgG+D#A#
D.RU,F!,C5+EV:.$=e!pEb0<2Df0*"DJ()4ATN!1F<G(3CisT4F!,?C@<,p?$47mu+<W@b+DGm>
:/=bZ;ajVR<$5Ue+DG_:@;KXg+D>\9EZfI;@<<W+DIdHk@<?(%+Du*?EbTT++E)9CF(KGG$6UH6
+>J3cBlbCN+EqL1DBO%7AKZ&:DBNh.G%G\:EbTT+F"ReB+<Vd]HQ[$D+>G!_BOu'(FD,5.F*2@C
DIn!&EZfF7FE9&A$:/32E-,Z%+D,Y4D)r"2IXZ`p+F>4`@j!CAF_tT!E_L1bATJu8FCB337WNEa
4X)U)I38kM.NhZ4DK9H4AM8+9F<G%<+A-'ZATJt\EbTB(@;Ka2+B*A7+@0gQ@;^-;+BMSd.PD-*
8K^/=1G1C=0f:sH2^:@+6rG-j+AbWP0-Du/0KL=E6m+W81H$p00-E&/2(gXA2D[693Zpg^9cuhP
1,(-a6pXd<+>>?&0e>1B/3,C80etF60f:[:0fUm=1,1O81,Ld<1,h!?1GCX:1G^ip7Sco)6QeN7
0d'Fk+>GW4+AtWo6m+lG6Rb&=:.88a+@?K-:/Fqi+<jKfF=\PNDf0234!73_/0IV^$;!uh<E((b
9lFokBIk9:@<jCHH"CE),!-oA/0I>3+B]%C7NbhV0-E(o4Wm<k<%(ll0-E)#+B1m#:*<#%;BS=L
4WlO'<)4Vk1--OG-poF+4Wm-@6Ra-.+>Go":.88a+@?K(=WfjM6mtbY+=eR&3Zpgn+?^i8=Wf:=
9MZca+>Yo03Zpgn+?^i8=Wf4;/i<u880C&<3A**F2_Zp?+=eR&6m*s%6s1W_+>GK/0f1"&+B(j,
-q$rU.Ng--6m*s%6s1Wa+>YW12^p0_6SfiJ+>,H12`Mp0+@Aq'-q$rU.Nh\].1/I1+?^i!0d&+l
6rG-W+@/t%-pod50-DZA;,Ses+>"^'1E^!H1+=Y$$;!]09L0d`+>=p;84?8r5qsKF+?;+u.j.MO
+>"^(6Qefk;ahfp0d&V%3A;R-+A>'D.j.5I3Zq6s8PW4l8Oagg0d&S$/N#4)0-E/,+B1m#:*<A2
8PW5-,#`W%+Dtb6ATAo6Bldj,,!$i::K1+41,(Bh8Oagr5p/940Ha=c78=sk1*A_&/NGL-/Kd_Q
+>"^(6Qefk;ahfp1*A_&9L0dQ+?;+u.j.5I$;!]05r'QH4Wl=60H`"k2D?7Q84?8r:f9k[<$3A`
F`&=>AThX*+EM+9F!<Xf7o*)[+>PW)$:?Nj4Wl.O8PUZc6rG-W+>khq0-E/,.3L2b;b9_46rG-W
+@JRG+=\L48PU[%;BRG39L1*V+>4ic6VgW/6rG-W+@JRG+=\L$:K&Z0;BRG39L1*V$</c'4Wl.-
+>4j*;CN_<+@/t%-rWu@-nuhr+@@k+?6D!P+>4j)0e#.+8Oagi0d&YC+>=p;84?8r<&#LY+>Yo0
+>"^81($TB+@@k+4<Q=#<(KGQ+B1*=4WlI=0H_kg<&-KW<&#LY+>Yo0+>"^81($uY+?^iH0d&+l
0f:(*+>GW4+B28^4Wm]Z+>4il2$ucO+?^i!/ho+?2BXIl;b9_46rG-W+=KWG+=\L%=Wf:=1G1[H
.4HAk+>,B+0eje#+B(j,-q$rU.Ng,p+=\L%6m*s%6s1W_+>Gf-3&W37$<0nG4Wm^%+>"^)<&u.$
;]n4G<)Xnk+@T6:8PW)^<$3AaBl.E(H>d\4+=LnP,!-oH=pe4r+?^i!<*CCr+A>QR0-Du,3Zq<C
4Wm^%+=eR66TQ>g+?^iH;]mS5<'q![1*A_&-rW]4-q$rU.Nh,H.3L2b;b9_46rG-W+A>'M+=\L4
8PUZc6rG-W+>khq0-E/,.4HAm+=KTQ;^b%3+=\L-5q*p.+B(j,-q$rU.NhDN.3L)_;b9_4/OWJZ
.NgT&+>4iq0I\FX=tq-_+=Jre0-EY\.3L)_5u^T-;c-F@0d&%j6S]cj+>PAg0-EV;.68SC7Nb&R
+?hq20Ha=c78=t/1*A_&1H$p0/Ke4O$;!]06S]cH+>=p;84?8r=tq-_+>Gi0+=eR<0fgF\1*A_&
1H$p0/Ke4O$;aVl:/i>[;futuBldi.,!-o=:/iW>.6AXrBHfM\8PW552D?g-.Ng-;+>"^-:/iW>
.4H\g0-Du'3sne^8PW5-,&JH2/o<3l+CTS1D09r6+<ili8PW550ea_"+BgKK+>4il0FCWS8PW5-
,#`W%F(KG9,!-o=:/iW?.6AXrBHfM\8PW552D?g-.Ng-<+>"^-:/iW?.4H\g0-Du'3sne^8PW5-
,&JHA/o<3l+CTS1D09r6+<ili8PW550ea_"+BgNL+>4il0FBQh0H`eZ6jeBlIXVV2IXZ`p+F>4`
C*7p3D/X<#A3(hUDKJcjF(KE(F<E_!+EM[CEbTT+F(KGJ+D,FV9LqlG=UGKY+AP6U+ED1;AKYE!
A0>r)F<G[>D.Rc2@<<V[DeC1d@;BEsFDk\uGp"MG@<l['B4uB0F('6+DJ+#>$6UI5A3DOf-o<b'
.j-Q,,rRG+/1<(m2`;d/+>PYt2D?R2+>b2l+>G!d/g,7SA79a+0FApFF*2A@Bldj,ATTXLFCY^c
+<XEG/g,1KF(HJ&DIal2ATT&:Bl.F&+E)-?8p,#_+>Y\o0f_6O+E)-?7ri0PDKff)BHV/'EbT&u
@;ZDp+ET;#/g)8Z0H`%l0H`7r1GBq+3B8r>+AP6U+D#P8@<?F.$6UI50g.-3+>c)$0H`%l2BXe0
+>Gl:2'=#:67sBuDfTr5+>"^P@<<W1Afu;/F*(u6DBMqX010/c@:Wdh@W-9tATA,#+ETA%/g+LX
2]sds0H`7r1GBq+3B8r>+AP6U+EMIDFD)dK+EMIDFD,6+DBM;[Bl%?'@;]Tu6#pULDKKT1@1","
F>H'4+<WU#+>=ol+>t>u0H`)13Ahp%:-pQUAmo^&DJsQ;BHS^EF`&=1Cj0<5F!,UE.1.1?F>Q-5
+C@&b+>=ol+>t>u0H`)13Ahp%:-pQUAmo^&F)Q2CBHS^EF`&=1Cj0<5F!,"3GA\i:$6UI4F`)56
F(KE(F>4n[0FA.0+EM[CEbTT+F(KGJ+ET:[/0K$h+=nXW1*A+jF>G$j3ZrN$$47mu:-pQU@rH4'
@<,p%@;KRpEbTW/D0$%,+EM[C0g.-3F*2A@Bldj,ATTXLF>+gg+ET=\/0K$i+=nXW1E\50+ETFI
+<Y`JDD44++EM[CEbTT+F(KGI+FQ9p0d(Ql+=nXW0d&"iF>=si+ETC^/34nq1^Y?JF*2@T+>"^W
F`&l?$6UHd67sC&Bl.F&+E)-?AT;j$FDl1BAoD]49jr'PBHT&b+>Gl:2'?LLEZee,C`kGTBQ&$6
+EV=7AKZ;;DImkr+<Y`JDK9H4ATMF)0d&.m0H_nj0d%kq/nlp\1,LF&/0Zek>p(pG1,0n+3B8r(
$6UHd67sC&Bl.F&+D,P4+CehrASu$eEZfX=@<*JF3B8r>Df-\>BOr;VEb/g"GA1Q#+Dk\1Bk1pd
D@.L/D.IoP2*EQ71cHO2+>=oh+u(3G+>G!d/g<"mH"CE)A79RkF!*1t3Ah-d+EDNX3AirP+EM[C
EbTT+F(KGJ+DkY73Ah.mIXZ_Q$47+IG\q8>FD5Q4EHPu*CER&'A0>DsEccRLG\q7>E+*d.Bl7Q+
-6R8JDe!@"F(oN)+EqaEA9.                                                   ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A7n3A`[;FD5Q4+>"^KASu("@;I'/FD5Q*FEo!QDfTB0%156]4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R>MF`_>6F'p,)F!+m6@rH1"ARfgrDf-\9Aft_tDImisC`l=mF`_>6BlnVC
GAhM4F"Rn/8T#YmH#RJ-@;I&Y:IH=6E,]W-@ruF'DK?q.F`_>6F'p,)F!,R<AKYetF*%iuA8,Oq
Bl@ltEd8dGDBO%7AKYr#FD*9L7W3;iAU%X#E,9).FD,5.8l%ha$=m^kASc:(D.RU,+Co1rFD5Z2
@<-W9E+*j%+DGmX%13OO+<VdL+<VdL+<Ve;Bk/>?+<V+#+<VdL+<VdL.kN8'/M/P+/LrD)/LrD)
/M/P)%144#+<VdL+<Z%dHtmS1A7]q3C2[X1F`_>6F*nE(+<VdL+<VdL.kN8'/M/P+/LrD)/LrD)
/M/P)%13OO=(l;aAKYi8+Bqc]F_=EkB3cp!FEDI_0/$gRDI[6sFCT6,FE2;9/otlPB5Md(/n8g:
.1HW+Df9H5+D>2,AKZ).AKYr#FD*]E$4R=b+<VdL+<VdL+<Y3/A0<Q8$6UH6+<VdL+=f#o/M/P+
/M/P)/M/P+.kN>)/M/J)/M/P+.h)h.+<VdL+<VeS0mn%ZF_>5rG'n@JF_?)9D..'gI!'OFCiat5
$6UH6+<VdL+=f#o/M/P+/M/P)/M/P+.kN>)/M/J)/M/P+.j,rD$6UH6+<VdL+:SZM:IH=E@<?1(
+E_aJ@;Kb*+D5U8Ao_g,+EML5@qfOh@j#l3+D58'ATD3q/g*\rDI[5e$?pE/A9/l6ASbq$@;^00
FDi:1+E1b0FD56-Cgh?,@;p1%Bk(RnBl@l3GA1l0%16N_E+NHu+Dtb!EZfI;AKYT*Df0Y>De:,6
BOr<*@<?0*GA(],AKYi.Eb-A+ASu("@;HA[GAhM4F!,[@Cht5&E,]AsEZf72@<*K4BOr;tDIb@B
%13OO7!3NaDJ()&AThX$DfBQ)DKI"HDfm1@AoqU%+CfG'@<?''B4YslEa`c,%17&sEc>r<AKZ28
Eb'5D+A$/fF*1u++EqaEA9/l%Eb-A7D]i\(DImj&@grceBOQ!*FD,62+DkP4+D,>*A0?#9AKY])
+CT/5+A*bbE,]W-@psInDf-\-Df0W1A7]cj$?L<-EbTE(+EV:.D'3P1+CK>6Bl%iu/g(T1%13 ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`A;aiT$+@8ju+@9X\F(K/[+@Agg;c>t^<(Ke_+@B$L6W-TI+A#$g6Ub'P
;FFGsFDZ,5DfT_<8Oc!579<8_6rS/LDJa<1DBMVB+AHQdCh7Wb@:Eqg+AP3s76sUD83n@n:Jsb_
78lWS+AQisAKXlH:K1Ck;FFGsFDZ,5DfT_<;GU(f=&2^^;fd)!D/X?1+B1Wn+B1d(:e"#M75,i`
AQVcN6Z!rFAQVcN8T#YMAQVcN9l2"Q;aNlM8QJ8\:J=b_73H#NFCfK/@<6O3FE/L4AoqU)F*)FF
@;KauD..L$+CT)&Dfg#6D'38'Cij]3D'38'Cj0Q,FCfQ7Bl+u$DKKT0De*E%@;p0sDIakuE,]W=
+CT;#@rHE2@<,jfDf]S7@<,k!Bl5&%Eas0)DJ1/$Eas3"DBNA.@ru-sBHU`)F(KB6+CTA#B6,2(
FDl#.Eblk,FEDPH@;L't+C\hmA0>>mAoD^$CghC,F*)FF@V'.iEb0<6EZeh&Ci=3(F*)GD+C\o&
DJsZ6ChY#$ATW--ASu3mGT^I,FE_;-DJ<X+1*C%;FE_;-DKBo?F!+q'FE_;-DKBo?F#"kIAn3#n
ChmHkF<G%0Bcpl'G].P4DBND,G^+.GASrW"H"A+-H$!V,BlnD=@ps1bDId0r+CehrD/X?1F!+t$
Ecbo6E,TQ$EZek&+CeqnEZek&ATE#<@q90o@qK[&@q]:gB4Yt#F<G(,@;]^hF*)FF@q]:gB4Z1'
CER,#@<-F3@N]/pFCf<'H=\4/Df[%2Df]G3@rHF%+CfG%+CfM0+CfP9DImm2Bk2H2@s)m7FE2)+
GT^O*FCf')Bl8#8A79RkAo_d3D'3@tH!t>s+Cno+De=3)ASWE!@Vg%,DffP5A7BP$DffP5A7T1`
ARfKuA7T1fD'3A"@rH0+A7T1gDBNJ#A8-*-A7T7lEZen'An,KsA7T:`F<G+)Ao_F!F!,"(F(K/1
A7Tb$C`m8!F)kb5A7TdkCj7(5AR]Rp+Co%nDf'>6A7]p,A7]suBlmp$F(96)E-*45AmulnAn#6m
A7fKtA7fj)A8-*pEb0?(Ea`irDf$V-D0'<0A7QfnDes5uEcWrq0f'q_Des5uEcWrq2_Z@bF*(i4
+CoS8CghBu+CoV6D..L$+D"tkBHUkpEcbu*BleA=ARTY%ATAo)Ch7]sB6,2,D/aTB+D#D/FEqq@
Dg*=8DK0f;FCcS+E-#W3E-!.5Eaa$#+D#S6DfQt4@:OCtEcW@8@;p0sDIal%@W-L/@;TQuAn)rq
@qZusATD4#AKYSrF<G1,G\M5@+D,8,+D,>.F*)><AKYT!EcZ>@DIml3Anc:,FDl&.F#"kMD00iC
AU#>0Ddji$Eb055Ao_I&A8-+,+D,Y*EGT?1F<G19Df&p(@qfX:2'?LODf&rlF(I6d+D,Y4D/+30
Bjkm%Aoh[4AKYT-F(KB1GB4m=GB.D>AKYVsDf'&oDBNS'FCf9"+D58-ASbpdFEDOGB4Z0rCh7$s
FE2J7G]Y'@ATVL"ATVL.F<G4-FCf9"FCf]=Bk2H2B4Z1&F_r76F)Z">BOPpuARTI!BP(ctBP(d1
+D>J1FDkf4@;R-#BleB7B6%Et1*C7IF(TH'A9/l,Df^"CBQ\59Bk&9"An)rtDKKH1F(Jj'+DG_8
Ao_EjFCcS/F('0/D'3P6@W-L&A0>T-@q]:k+DGn,Df'H0AU#>3F(T6,@<<W+F(oN6+DGn7@;[3%
F)Q#/DBNY7Dff]1ATMs%D/^V3F*2A7@rGmh+DGn>DJ=*5AKY_tEZf+9@<?1(AT/c,FE;8,F(c\2
F_kZ1@ps0rC3=T>A9)i9C3=T>A9)j4@<?0*C3=T>AU&;>C3=T>Anc'm+DQ%?FCo6'AS$+.+DQ%?
FDtZ1BHV&5DBN\;EZf.?Ecc5@BlbD5@<6O/DIjr,@<6O/DIml3Ch7$o+DbY/+Dbe(EcN:=C3=T>
+Dc+2BlkJ6FE2)4+Dc1B+DkXHAo_g,F*)G:DJ()/ARTI!D.R6l@;[3)ASkiuD.RQr+Dk\,EZf41
D0I+>Bk21)+Dl%-AMPBFDf0Z1F(/^&G@b?'+Dl%8DK?q;Dg#c1ARTI!D/XT7ARTI!DIXf,AU&<?
ATDj+Df-\8B4E'%Ch@^.Ch4`,Ch@^.Ch5@EDJru,Df0-&ASu.&BHV52Ao_I&A8-+,+E1b!CERS)
EbTW@+E1b0F(Jj&Fs(a4EcYf6A0>i"EcYf8DesQ5ATJu5@<?HsEccAEEZf=5@j#`&C`m\2+E2%)
CERS1E+NNm@<-E3E,TQ<E,ol-+E27>FCSumEcW@BDf^#7F<GOHAfu(J+E91[EHQ2AAKZ#%DIdm-
BkAK.ART*lEb/Zi@rlf9Eb/Zi@rlg7+ED%%A8Z=.DBNt2@:XIj+ED%%A9;?;+ED%%A9;?;F!,L7
@:XIj@W-*+Eb/ZiFC]G8Eb/ZiG'%7;Eb/ZqE+*d/+ED%&+ED%&@j#f'@WHC2+ED%&FCJ`uC`mb0
@W`f6AS,XsF*)><AKZ#)D.IR,@<-"%+ED%5F`2A5A0>o)A0>o)Ch[i2Eb]`<F<GU?AS,t#C`mb:
F`(_4Ecc>9D'3kADJWm%B67g.+EM('BOt[h+EM('Ci=B++EM('Df0H(@rri7A7oIqBQ%s6@X2j"
D.Oi2A9)6kFs(j:F(K6"+EM(7De!QoF<GX<DfTr9Df03*@;TRs+EM47GApu3F!,O<DBO"7DIal2
Bl7T,F),?2DImm1+EMC<F`_SFF<GXC@N]`2Ch\!4FE2FFF)tl'Fs(jICghBu+EMX8A7]p,F*(u4
F!,OHDK9H4ATMF)0HbFZDK9H4ATMF)0d(O_D/s2rA9;?)FCAWmF<G[6B6,2;@;[30@;]TuFCB'#
+EV%2+EV%2C`mh0A7cs+AU&</DfT\M+EV=7ATMs%D/^V>Ch=f3D0$hADaRDr7Ncek85E/`+EVNo
+EVO1F(8ou3&Mh#Ddm-rAMu@fFDk\uFCcS:De*:%+EVO4@<la/+EVO:F_kc#DBO%>Ci=N/EZfIB
F`;;2EZfIE@;]RkDf]J4FE1f-@r-()AMPBMEb/g'F_r7CEclJ;+EVZIFE;&7F`(o<F(Jj&+EV[@
@<6*)FE;8,F(d<OFE;J6E$07DFCB$*+E_15Ao_d!Eb$;8@rQ%#F`_4T+E_R9G]RG+F(TH7F!,UC
E+*6l+E_a7A9)C-AKZ,;AiLoUFCmLEEc,B-A0?&(Ch-srAKZ/)EZfODCisT+F!,[;+EqC.CLgk!
+EqC.CMn93@V'R&G@b?$DKTf*ATBOKG@b?$F(/^&G@b?'+EqC.CNF3-H"CE)+EqF6+EqO;Ch$sg
@<-E3GA1r6@<?1(AT/c9Ea`p2DfTB0+Eqj?FCcS=EbTW,DJsZ8+Eqj?FCfQ)+F.O,Eb&U#ATJu>
H$O[PDf0)r-RgSp4?P\X?SNZN+CfP9DImm2Bk2HB0d(=ACLpjhDdd0`F(96)E--.DE,Tf>F*)P6
+EV19FE;PH@N]c(F*)JFF^d^S@<6K[Ec6)>+EV19FE;PH@SC]XB1-ZJ+EV19FE;PH@T.AWDId0r
A1&fW-p0UR/mg=U-Qll,F(I6d+C]86DfB9*+C]D6@<?Q5@WcC$A9E!.Ci^_0ATqg%FCf3.@rc:&
F<G+1Cisi6Ci^_1@<-I'A8-+,@;]RdF!,.<D00H0Ec*"<A7B%H77JD?ASksrFE8RFGB@8&A0>r3
@r#XtF&GFr+EM[CD/X?1+EVX<B-;>7Bk)'lAKZ28Eb&d#Ec#6,Bl@l3G\q8>FD5Q4-RgSp4>8$7
.4cl04?G0&0d%hd:et"h?YFOuFD,T5DBMbO;cI+FF`)&7Df-[o:K(5"FD,T5DBNJ(Df[%3F_u):
F`\a>Bk1dbDf0W7Ch4`'<,uDbF(T!(+EM%5BlJ08FEM%8F(fK9@rH7+Deru4.4cl01-%061*eV/
0f:XC1,LUB2Dd6F2E!QM+>b2r0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgmH3ADX3
+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`*6J+>Fuo0JGF?0etO;2)mTV2Dm6K
2BXat1,(F?0K([C/iP[F1bgpG0fL42+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F
2E!QM+>Y,q0JGF?0etO;2)mTV2Dm6K2BXt%1,(F?0K([C/iP[F1bgpG0fL41+>PW)2_d$B1G1OE
3B8uT1,h*62BXb/0f:XC1,LUB2Dd6F2`*6J+>Y,q0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C
/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2`*6J+>P&p0JGF?
0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*60d&5*
0f:XC1,LUB2Dd6F2`*6J+>P&p0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40
+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`*6J+>Fuo0JGF?0etO;2)mTV2Dm6K
2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F
2`*6J+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL43+>PW)2_d$B1G1OE
3B8uT1,h*61a"P-0f:XC1,LUB2Dd6F2`<?H+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K([C
/iP[F1bgpI0Jjn,+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`<?H+>Y,q0JPF=
2DR0C3AEBG1,q!D2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d7+>PW*2)$pD1bL^F1c-pG2D?s10d&5*
0K1^@1,CO?3&ruW2)7*K+>GYp1,(F?0K([C/iP[F1bgpI0Jjn,+>PW)2_d$B1G1OE3B8uT1,h*6
1E\G,0f:XC1,LUB2Dd6F2`<?H+>P&p0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgpI
0Jjn/+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`<?H+>Y,q0JGF?0etO;2)mTV
2Dm6K2BXdu1,(F?0K([C/iP[F1bgpI0Jjn,2'=Y.0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A
2`<KL0fM!E1a"Xu1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG2D?s11E\G,0K1^@
1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E1a"Lq1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pD1bL^F1c-pG2D?s10d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E1a"Or
1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pG2D?s11*A>+0K1^@1,CO?3&ruW2)7*K
+>Y,q0JPF=2DR*A2`<KL0fM!E1a"Lq1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG
2D?s12BXb/0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fM!E1a"Lq1,(C@0ekF>/i>UK
3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG2D?s10d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR0C
3AEBG1,q0N0d&1n1,(F?0K([C/iP[F1bgpI0Jjn1+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC
1,LUB2Dd6F2`WcN+>P&p0JGF?0etO;2)mTV2Dm6K2BXt%1,(F?0K([C/iP[F1bgpL2DH=/+>PW)
2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2`WcN+>b2r0JGF?0etO;2)mTV2Dm6K2BX^s
1,(F?0K([C/iP[F1bgpL2DH=/+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`WcN
+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K([C/iP[F1bgpL2DH=2+>PW)2_d$B1G1OE3B8uT
1,h*61*A>+0f:XC1,LUB2Dd6F2`WcN+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F
1bgpL2DH=/+>PW)2_d$B1G1OE3B8uT1,h*61E\G,0f:XC1,LUB2Dd6F2`WcN+>Fuo0JPF=2DR9F
3&3BL3ANEM2'=Ur1,(F?0K(^@/iYgI2)dBI1-$I3+>PW*2)$pD1bL^F1c-pG3ArT70d&5*0K1^@
1,CO?3&ruW2)7*K+>Fuo0JPF=2DR9F3&3BL3ANEM2'=Ur1,(F?0K([C/iP[F1bgpL2DH=2+>PW)
2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2`WcN+>P&p0JGF?0etO;2)mTV2Dm6K2BXat
1,(F?0K1[D/i,@@1b^^A1,9t,+>PW*2)$pD1bL^F1c-pG3ArT70d&5*0K1^@1,CO?3&ruW2)7*K
+>Fuo0JPF=2DR*A2`<KL0fM*N0d&4o1,(C@0ekF>/i>UK3Ar`M2`;d9+>PW*2)$pD1bL^F1c-pG
3ArT71*A>+0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM*N0d&@s1,(C@0ekF>/i>UK
3Ar`M2`;d<+>PW*2)$pD1bL^F1c-pG3ArT70d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A
2`<KL0fM*N0d&1n1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD3A*9H2DmKM2DlU3+>PW)2_d$B
1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2`WcN+>Fuo0JGF?0etO;2)mTV2Dm6K2BX_2+>PW*
2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fUmD2BX^s
1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K
+>P&p0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK3Ar`M2`;d9+>PW*2)$pD1bL^F1c-pH
0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK
3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>b2r0JPF=2DR*A
2`<KL0fUmD2BXat1,(C@0ekF>/i>UK3Ar`M2`;d<+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0K1^@
1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fUmD2BXat1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fUmD2BXh!
1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pH0f(^11*A>+0K1^@1,CO?3&ruW2)7*K
+>b2r0JPF=2DR*A2`<KL0fUmD2BXk"1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pH
0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>Y,q0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK
3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0f:XC1GCF@3&EKO1,La/1a"P-0K1^@1,CO?
3&ruW2)7*K+>P&p0JPF=2D[$>3&i`P2_m3F+>P&p0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@
/iYgI2)d<G1cHO3+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO1GL^F+>Y,q0JGF?
0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI2)d9I1*A@q1,(C@0ekF>/i>UK3Ar`M2`;d<+>PW*
2)$pE0J5=E1c73J0f1g31*A>+0K1^@1,CO?3&ruW2)7*K+>t>t0JPF=2D[$>3&i`P2`!0F2]sn!
1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73J0f1g30d&5*0K1^@1,CO?3&ruW2)7*K
+>P&p0JPF=2D[$>3&i`P2`!0F2]sju1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73J
0f1g30d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`!0F2]sju1,(C@0ekF>/i>UK
3Ar`M2`;d5+>PW*2)$pE0J5=E1c73J0f1g30d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>
3&i`P2`!0F2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73J0f1g30d&5*0K1^@
1,CO?3&ruW2)7*K+>P&p0JPF=2D[$>3&i`P2`!0F2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pE0J5=E1c73J0f1g31a"P-0K1^@1,CO?3&ruW2)7*K+>b2r0JPF=2D[$>3&i`P2`!EO2BX^s
1,(C@0ekF>/i>UK3Ar`M2`;d7+>PW*2)$pE0J5=E1c73J3&WZ;0d&5*0K1^@1,CO?3&ruW2)7*K
+>Fuo0JPF=2D[$>3&i`P2`!EO2BXh!1,(C@0ekF>/i>UK3Ar`M2`;d7+>PW*2)$pE0J5=E1c73J
3&WZ;0d&5*0K1^@1,CO?3&ruW2)7*K+>GYp1,(F?0K(^@/iYgI2)d<N2Du[4+>PW)2_d$B1G1OE
3B8uT1,h*61E\G,0f:XC1GCF@3&EKO1H79N+>P&p0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@
/iYgI2)d<N2Du[7+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1H79N+>Y,q0JGF?
0etO;2)mTV2Dm6K2BXdu1,(F?0K(^@/iYgI2)d<N2Du[42'=Y.0K1^@1,CO?3&ruW2)7*K+>Fuo
0JPF=2D[$>3&i`P2`*?G+>k8s0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)d?K0d&7p
1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73K1bg+-+>PW)2_d$B1G1OE3B8uT1,h*6
0d&5*0f:XC1GCF@3&EKO1c-p00d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`*?G
+>P&p0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI2)d?K0d&4o1,(C@0ekF>/i>UK3Ar`M
2`;d7+>PW*2)$pE0J5=E1c73K1bg+-+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO
1c-p02BXb/0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2D[$>3&i`P2`*?G+>Fuo0JGF?0etO;2)mTV
2Dm6K2BX^s1,(F?0K(^@/iYgI2)d?K0d&1n1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E
1c73K1bg+3+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2)-jH+>P&p0JGF?0etO;
2)mTV2Dm6K2BXt%1,(F?0K(^@/iYgI2)dBI1-$I3+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC
1GCF@3&EKO2)-jH+>b2r0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dBI1-$I3+>PW)
2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2)-jH+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu
1,(F?0K(^@/iYgI2)dBI1-$I6+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO2)-jH
+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dBI1-$I3+>PW)2_d$B1G1OE3B8uT
1,h*61E\G,0f:XC1GCF@3&EKO2)-jH+>b2r0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI
2)dBI1-$I7+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO2)I<P+>P&p0JGF?0etO;
2)mTV2Dm6K2BXat1,(F?0K1[D/i,@@1b^^A1,9t,+>PW*2)$pE0J5=E1c73L1c[K;0d&5*0K1^@
1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`3EP2]sju1,(C@0ekF>/i>UK3Ar`M2`;d9+>PW*
2)$pE0J5=E1c73L1c[K;1*A>+0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`3EP2]t"$
1,(C@0ekF>/i>UK3Ar`M2`;d<+>PW*2)$pE0J5=E1c73L1c[K;0d&5*0K1^@1,CO?3&ruW2)7*K
+>Fuo0JPF=2D[$>3&i`P2`3EP2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73L
1c[K;0d&5*0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2D[$>3&i`P2`3EP2]sgt1,(C@0ekF>/i>UK
3Ar`M2`;d51a"P-0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@
/iYgI2)dEI1bg+-+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?
0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI2)dEI1bg+-+>PW)2_d$B1G1OE3B8uT1,h*62'=Y.
0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dEI1bg+-
+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K
2BXh!1,(F?0K(^@/iYgI2)dEI1bg+.+>PW)2_d$B1G1OE3B8uT1,h*63$9t10f:XC1GCF@3&EKO
2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dEI1bg+.+>PW)2_d$B1G1OE
3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@
/iYgI2)dEI1bg+0+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2D[?R+>P&p0JGF?
0etO;2)mTV2Dm6K2BXh!1,(F?0K(^@/iYgI2)dEL3B83>+>PW)2_d$B1G1OE3B8uT1,h*61*A>+
0f:XC1GCF@3&EKO2D[?R+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K(^@/iYgI2)dEL3B83:
+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2D[?R+>G;r-p07-2^C.40f:XC1,LUB
2Dd6F3&ifS+>PW*2)$pD1bL^F1c-pH3&WZ;1,(F?0K([C/iP[F1bgsL2Du[50JPF=2DR3D2)7!H
1H7'K+>PW*2)$pD1bL^F1c-pH3&WZ;1,(F?0K([C/iP[F1bgsL2Du[50JPF=2DR*A2`<KL0fV-N
2BXb/0f:XC1GCF@3&EKO2`NWR+>PW*2)$pE0J5=E1c73N3&ET;1,(F?0K1^B/i5=D0JGID1-$I4
0JPF=2_d*@1c$mC3B/uU2BXb/0f:XD0f(F=1,([A0KCpL+>PW*2)$sD1G1L>1c7*L2)$s31,(F?
0K1^B/i5@=1cR3H0f1=1-p07-0fL@50JPF=2DR*A2E3ZM1G^jB1E\G,0f:XC1,LUA3&iTJ1GggB
+>PW*2)$pD2_HsC1c@-L1,q691,(F?0K([F/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3$9t1
0f:XC1,LUA3&iTJ1Gq0Q+>PW*2)$pD2_HsC1c@-L1,q691,(F?0K([C/iG[K0JbLB3B83;0JPF=
2DR3D2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD1bL[G3&!-E2`EQ91,(F?0K([F
/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD1bL[G
3&!-E2`EQ91,(F?0K([F/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3$9t10f:XD0JP1:1GgmA
3ArcQ+>PW*2)$sC0eP:=1c$gG2E!E81,(F?0K([F/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L
3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$sC0eP:=1c$j?2)[B91,(F?0K([F/i>C@2D[<J3&i$9
0JPF=2_Zs=1c$sE0ebIC2]sk00f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD2_HsC1c@-L1,q691,(F?
0K1[?/i5@@1GLR@2E)a60JPF=2DR3D2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD
2_HsC1c@-L1,q691,(F?0K1[?/i5@@1GLU>3&Vm70JPF=2DR3D2)7!H1H7-L3$9t10f:XC1,ggC
1,LmF3&3HQ.4cl00I/>$/1<V=+>P2t0JPF=2DR*A2`<KL0f^pF1E\Ls1,(F?0K([F/i>C@2D[<I
2DH=/+>PW*2)$pD1bL^F1c-pI0JtX/1a"P-0f:XC1GCF@3&EKO3&<QM+>b2r0JPF=2DR3D2)7!H
1H7*I0d&1n1,(F?0K(^@/iYgI2)dKN3AM^6.4cl00e"Y%4>838-p014/1<V7.4dS9         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
