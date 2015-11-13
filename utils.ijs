NB. JOD dictionary dump: 13 Nov 2015 08:15:00
NB. Generated with JOD version; 0.9.99; 6; 5 Oct 2015 14:12:09
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

amort=:3 : 0

NB.*amort v-- generates an amortization table for a loan of 1.00.
NB.
NB. This  amortization  verb  comes  from  the  (finance)  addon.
NB. Payments are assumed to be made in arrears.
NB.
NB. verbatim:
NB.
NB. y has 3 elements:
NB.   frq  =  payment frequency (e.g. 1=annual, 12=monthly)
NB.   int  =  decimal interest rate per annum.
NB.   yrs  =  number of years of loan
NB.
NB. result is a matrix:  pay osb ip pp
NB.   psy  =  level payment necessary to amortize the loan
NB.   osb  =  outstanding balance before each payment
NB.   ip   =  interest portion of each payment
NB.   pp   =  principal portion of each payment
NB.
NB.
NB. monad:  nt =. amort nl
NB.
NB.   amort 12 0.125 25  NB. 25 year loan payable monthly at 12.5%
NB.
NB.   150000 * amort 12 0.05 15  NB. $150,000 15 year mortgage at 5.0%

if. 3 ~: #y do.
  'frq int yrs' return. end.
'f i y'=. y
len=. f*y
i=. <:(>:i)^%f
vn=. */\1,len$%>:i
osb=. osb%{.osb=. |.-.}.vn
pay=. %+/}.vn
pp=. pay-ip=. osb*i
pay,.osb,.ip,.pp
)

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


charsub=:4 : 0

NB.*charsub v-- single character pair replacements.
NB.
NB. dyad:  clPairs charsub cu
NB.
NB.   '-_$ ' charsub '$123 -456 -789'

'f t'=. ((#x)$0 1)<@,&a./.x
t {~ f i. y
)

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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

fmttd=:[: (] , ((10{a.)"_ = {:) }. (10{a.)"_) [: }.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@])) [: }."1 [: ;"1 (9{a.)&,@":&.>

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


iscomplex=:16"_ = 3!:0

isfloat=:8"_ = 3!:0

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

monthdates=:3 : 0

NB.*monthdates v-- returns all valid first of month dates  for  n
NB. calendar years.
NB.
NB. The monad returns  an integer table with YYYY MM 01 rows. The
NB. dyad returns dates as a list of YYYYMM01 integers.
NB.
NB. monad:  itYYYYMM01 =. monthdates ilYears
NB.
NB.   monthdates 2000
NB.
NB.   monthdates 2001 + i. 100  NB. all first of months in 21st century
NB.
NB.
NB. dyad:  ilYYYYMM01 =. uu monthdates ilYears
NB.
NB.   0 monthdates 2001
NB.
NB.   monthdates~  1999 2000 2001   NB. useful idiom

NB. generate all first of month dates in years
days =. ,/ (,y) ,"0 1/ ,/ (>: i. 12) ,"0/ ,1
:
NB. convert to YYYYMM01 format
0 100 100 #. monthdates y
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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


onelength=:(] > [: }: 0: , ]) +/;.1 ]

onfreqdist=:[: (] {"1~ [: \: 1 { ]) ~.@] ,: #/.~

pack=:[: (, ,&< ".)&> [: /:~ ;: ::]

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


sdrecv=:sdrecv_jsocket_

sdsend=:sdsend_jsocket_

sdsocket=:sdsocket_jsocket_

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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

writetd2=:] (1!:2 ]`<@.(32&>@(3!:0)))~ [: ([: (] , ((10{a.)"_ = {:) }. (10{a.)"_) [: }.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@])) [: }."1 [: ;"1 (9{a.)&,@":&.>) [

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
0fM'P+>Yi5+>P&t+>Pes1E\P8+?(E"1*A;++?2%t1*A>0+>b2t0H`)0+>bhr0fL430d&4o0f^@2
0d&82+?:Q"2]t+'2`;d8+>Ynu0fL431*A;0+>beq1E\D.+?:Q$2'=h#1,U15+>Gl!2]sk5+>G\q
1,9t,1*AD4+?1K#1a"b#2)6:6+>ktu2]sn8+>GVo1bp12+>c#"3$:(8+>t>u0d&=r1H-F7+>GPm
2]sk1+>t?%+?(Dt3?U4&0eje0+>P\p2BXb7+>k8t1*ALu0f1"5+>Y\o1a"S6+>GYp1cQU<+>bqu
0ea_.2'=n%1Gg4/0H`20+>GSn1c6C10d&A4+>GVo1c-=2+>Pku2BXe6+>Y,t2]t%%0fC.6+>Pes
1E\J/+?1K#1a"b#1H$@8+>Ynu0eje00H`+n3$:%#1,0n/+>Po!1E\\#1E\J4+?:Q!2]t+'1H?R<
+>Yu"2]sn5+?1K$1a"Rs0f1"0+>G\q1a"M3+>Y,s1*A@q1bg+-0H`//+?:Q"2]t+'1,pC:+>bhr
2BX_/+?:Q$3?U:(1cHO9+>ktu2]sq8+>k8u2BXk"1c?I6+>bu!2'=_6+>k8u2BXk"1c?I6+>bu!
2]t":+>k8u2BXk"1c?I6+>bu!2BXh7+>k9"0H`7r1-$I5+>PVn0f1"01E\Ir1Gg42+>bks1E\D1
+>Y,p3?U%5+>bks2]t":+>GSn2DH=/0d&;-+>k8s1*ALu1GU(3+>P_q1a"M2+?:Q%1a"\!2)ZR9
+>bbp2'=\4+?:Q$1E\V!1cQU:+>l&"2'=V.+>k8s1a"_"1,pC8+?),"3$9q6+>P&p2BXdu0f1"2
+>bhr1E\D/+>t>t3$:""1,0n2+>Yu"3?U7;+>GPm2`Mp=+>ktu2'=e;+>Y,u0H`1p1,9t3+>Z##
3$:%5+>GSn1-$I30H`24+>GPm2)cX8+>PYo3$:%;+>t?$1E\V!1,L+3+>tqs0ea_.2BX_2+>Yr!
0ea_*0d&2,+>Y_p2BXk2+>b2r1a"_"0f'q.+>Gbs1a"S3+?:Q'2'=V-+>tnr3$:+8+>b2u1*A@q
0f:(/+>Po!1E\G5+?:Q"1a"e$1H-F7+>PYo2]sk0+>t>t1a"e$1H$@7+>Yr!2'=e7+>k8t2'=e"
0f^@21*AA1+?:Q#1*AP!1G^.0+>tnr3$:(:+?(E#3$:1'1GU(3+>bnt0eje-3$:.&1cQU;+>beq
0eje-3?U:(1cQU6+>Gbs1E\M4+?1K'+?(E!2]t(&2)ud9+>Ynu1E\J.+>k8r1*AFs0fU:5+>bu!
2'=Y4+>Y,t2]sh2+>Yr!1a"P-+>t>t1*ACr0f:(1+>GSn1a"M-+>b2q1*AFs3?U1%2)?@00H`55
+>GYp1cHO7+>c&#3$9t2+?(Dt0d&4o0esk+0d&A3+>Y,q1a"_"2_uR9+>u5&1E\P2+?:Q$2'=V-
+>u"u1a"\8+>t?"2'=k$1,pC8+>tnr0esk/2'=V-+>kkr1E\J0+>Y,r0d&4o3$:%#1GL"4+>kkr
3$:":+?:Q#0d&@s1c?I4+>bhr1*A;.+>P&o1a"Xu1H$@8+>bqu1a"S/+?(E#1*AP!2_uR9+>Pht
2BXh1+?(E%1E\Y"2DH=7+>l#!2]t%6+?(E"0H`=t1,pC4+>kqt1a"S3+>t?!1E\Y"1-$I6+>c)$
0ea_.3$9q0+>u&!3$:"4+>Y,q0H`4q1,L+2+>Gl!2]st8+>k8u3$:($1,pC20H`,2+?(E#1*ALu
2)6:7+>kns0f:(21*AIt2)6:4+>kns3$:(6+>G\q1cQU;+>P_q1E\D-+>b2q0d&:q0f:(5+?1K'
+>P\p1E\P/+?:Q'1E\Ot1,pC7+>Z##2BXe9+>k9"3$9q1+>l)#0eje.2]t+'2)cX8+>Z##1a"P/
+>Y,p0d&:q0eje-+>Ghu1E\G1+>b2s3?U.$2D?76+>Z##3?U.5+>Y,s3?U+#2)?@5+>bnt2BXh5
+>Y,s1a"e$1,U16+>Pes2BXe5+>k8r3?U7'1cHO:+>l#!2]sk1+?(Du0d&J!1-$I30H`)0+?(Du
2'=b!1,0n,+>kqt0esk.3?U4&1bg+3+>kkr2'=_3+>t>u1*AS"2`2^<+>c#"0esk.3?U4&0f:(5
+>P_q1a"P0+>GPm2)QL8+>u&!1E\Ir2]sq6+>P&o1a"_"2)$.-0H`/1+>GSn1c?I21*AD1+>GSn
1cZ[7+?)/#0ea_,2'=V-+>khq3?U+8+>k8t0H`@u1,'h0+>bhr3$:+>+?:Q$1a"e$1GhEa;aiT$
@UX=h+>u&!ASu!rA8,po+CT)*BOP@]F@&bt6@!Za+A[#gATAnf@<--E+B;B1/N=kA7P$km/4)fK
-tm1:.3NPL+>P`5+>Gi7+>Gl2+=Lc3@jrNeATMp(Ce@$*F)to/+D,b6@ruF'DK?qDBji,TH#R>8
B4Z!uATVs,@j#2jG%G]'6VKdE;aFD_85E,lF`_;8EZfI8G]Y'BDKBB0FCeu*@X0(EDJ*H.+DG^9
B6%p5E$/Y,@<6K4BOtU_ATDi7/KeP3DJjB7+D>2,AKW?R-Qlo4@<,ddFCfJ[;Ia-UEbSrpAKZ#)
FEMVA+Cf(nEa`I"ATC.99L`N#EcPl&B4W3+ATW'8DBNb0DIjr&AS#Bp@q]:k@:OCjEZf=0BlZd7
5sn(B:JsSZBQS*5BQ%p/Bl8$(Eb8`iAKZ28Eb'56-qQlo6Ub'P;FFGsFDZ,5DfT_E+D5_5F`9oA
5sn(B:JsSZF*2A;Df9N-DKKH1Amo1\+EqaEA9/kA8Oc!579<8_6rS/LDJa<1DCH]@Ec6)>9L`i4
DIjr&AS#Bp@q]:k@:OCjE_U7aCh7Wb@:Eqg9keE[ATAnk@:Eqg+E2@>@UW_SCh[s4Bk&9)EbTB%
+EV19FA>+r76sUD83qE-Ch[E&@q]:k@:OCjEcW@;DBMOoDIIBnF&#M/8Q/&V79!u=A8,O^FCfM9
F*2@CDIn!&EZfC:F(KD8DfQtAATVu9Bl5%AF*2A@Bldj,ATTUT+CT.u+=M;RDK9H4ATMF)0e"5c
ATN!1FE:2qFCf?.FCcS6CgggbBQ%]tATAnF+EM+*+Dbt6B-:`'@s)X"DKJcP:K1Ck;FFGsFDZ,5
DfT`9Df9_?GAhM4F!)l/:JXqk:JsSZBQS*5BQ%p/.3N8DDfp"A+<VdL+Au!2<*)jn6rS/LDJa<1
DK9Z6F<GdGEb'56-rNi:<*)jn6rS/LDJa<1DCH]@Ec6)>+<VdL+<XWL6?HXF+Cf(nEa`I"ATCa=
9i+;N9LUXWASlC)Eaa!6+D,>(AKYi4F*&ODDeX*2+EVNEAU&<*DKI"3Bl[cpFDl2F<+T0.F@0nE
AQU'oDeX*2F!,F5EZek'DKKT0ATVL(<+T0.F@g@LAQU'oDeX*2F!,F5EZf(6@q\hQ=AX*6D,b(K
+E275DKKqBE+O&4D/!g&Bl.F'ATCdL6:=^C<^g%b9N=eU<Du4,A9)C-AKZ/7CisT++DbIqASbde
FCfK/@<6O3FE2D5FCAm$F!,OGEbTE(+=MLa+CSl(ATAo0@<6N5De!:"EcP`/@q?d$AfrLH.:Hh1
ATDj6EcP`5@;0V#+EMXFBl7Q+@:jUmEZet.EcZ=FDe!:"EcP`/@q?d$AfrLH.:I%/Df&p(CMdL$
CERP<FCfJ8-u<I'A8,po+CT.u+EVX4Bl%L$B.4s;FCf;3Ecl8@+DG^9Ch[s4F(&m$Dfg#6D00f4
D'38'C`mY=FCfJ8Blmp'F!*%W-Qjc`@;KauFE2)4+DGm>F(&os+CT=6@;Kb%EbTB!Ci"36Bl.s4
Bl.o6@;Ka&Ch7$cBl7Q+@;]TuFE1f(Ch[d"+C].qDJO<%Ci"</Blmp.EbTB4EbTB3+CT)&+DbUt
A8,po+CT.u+EVX4Bl%L$B-;D3Blmo/F)YPtARTFoEcbr*DImisFCfM9@;[2rD/XH:BmO30Bl@l3
FCAWpAKYT'EZed5Ci<a"+E(j70k"sABl.d!AS,XoA9/l8BOr<&ARTY%+D,Y*EHPi1FDQ4FDe!:"
EcPl3B-:o1ASii:.3N>B+CQC/BleB)E,]B+A79FrASu%"+CQC/BleA=De:,$H$!V=+EVNEAnc'm
@;p1%H!tZ2Ch[I%+EV:.+Eh=:@N]B&+EMXFBl7Q+.!R0`FDi9MGq!0B@q0Fu@<,j#@rHF&DIm6s
@q0FuBP;[1ATD6uCh[B%@<,j#@rHF&DIm6s@rl@%@<,j#F(oN'@<,k!Bl7TtH#R>8@W-'s@j#3#
@j#i,DIm6s@ru-s@<,j#FCB'"ASuTuEas3"DJ3^/E+O'!Des,t+CT;#+EV%0B4Yt&@<6L$EccA:
B5V-o+EqOABHV54FD5Z2@;I''ATMp$B4YLn@:sXiFEDP;@Wcd(+F%a>+@8Le8PUC:DIakY:.-4H
@:sXiFDl#.Ebo0+Df$V/Ec5e;Ch[s4@<?U3G%#30AS$+.Ea`I"F!,R9G]Y'HAfu>8C`m/.FE2))
F`_2(@qK7\Bl7@"Gp$U1@<,ddFCfJ8Ao_g,+Co%nBl.9p3ZqmAAn3#@11Fg,DfTE*@<6O3FE2D5
FCAm$F!,OGEbTE(+=MLa+C\noDfTD3CghC,+E(b"F`MM6DI[6#De:+?GU[*5AoD^$F*)GCATV?p
DK?qAFE2)5B-:YpAoD^$+D,>.F*&OC@q0Y%Eb0,uAKYo'+=MI`@V'@oDJ+$4EcZ;5Ch7*u+EM[7
Ch[s4F!+q'FE_;-DBNh8DJj$,FCeu*A7]RkD/"*'EcW@DATV?pDJ=!$+Co&"Bl.R+ATDj$ATD[,
F_kl.B4YslEaa'$+D,>.F*&O"+@9X[DJsZ6ChY#0F_tT!EcY]$FE_;-DJ<X+Bl7HmG\(D.F*1r.
BleB;+C\o(G@b?'+Du+8DImm2ARlooASc'tBlmp,F(/^&G@b?'Bk2HDBl7HmG\(D.F*1r.BleB;
+C\o(G@b?'+Du+8DImm2ARlooASc'tBlmp,F(/^&G@b?'F*)GDF(K0!@rri7F^f0$F*)IG@V'Y*
AS#a%DJsE1ATMs)A0>DoCh[a#FCfK6+Co2-@psCgBl7Q+A7]RkD/"*'EcY]$FE_;-DKBo?F#%fJ
Ch7*u+EM[7Ch[s4F!+q'FE_;-DBNh8DJj$,FCeu*A7]RkD/"*'EcY]%A7B7j@<-W9Ao_g,+Co%n
Bl.9p3ZqmDA0<]a@VfggAoqI#E+NotF!,@3@qB_&@<-W9@VfIjCNCV?D]hXpFDkr+DKB9(Bju!k
Gp$s4F)rI<DId='+=MLa+EqC2B4uB0Bl5&4Dfor.F!)lU.3N;8BkM+$+DG^9Bl7EoATM=!G].P4
DIRO/ATJu4E+No0DJsZ8F(0'4G].P4DIRO/ATJu3Df0-'E--@JDfB9*+Du+?DKB94ASH!uARoL`
FCf96+EV18D/!lrFCfM98g&1dF)u&6DIRm5AR]@qF#Y:OBlkJ:@<?U&Ec,q@AoD]4@X3',F!*%W
F(Jo*Ci=3(+CoD#F_t]-FCS`qASu$eEarNoASu$eEZet4EZfX=@<*K!F!*1m+D#A#D.RU,+Dbb5
FCS`qD/X?1F(8WpASu$eEZen$FCfM9De:,0ATo8*DIal%F_kk:D/X?1F(8X!FCoQ4Derj&@psD"
ATMQoDBNG-DfTB&DIIWuF!)lU/0K3h+F5IZAo_g,+E278@<*K#Df9Z,Bl7@$ATJtBE\&>TBOu9o
/0JnFBdmP&@ps1i+Co;)@q9.kA8H')ATDg0EZf(6AoD^,@<?4%DI[3gEd2,2C`l5ZFA-+aF@C4j
DfQt7DJ!g-D..O#Df0&qAnH'pAKYN"Cia)uE&'g(@rH:+A8,piFCcS,Ec5e;E,TQ$E]P=QAoJl3
An)r<+>IA>@;]^hDK0c.BOPdkAKYl/F<GRGDffQ$@q]:gB4Z.+EcP`1CgggbF!,OH@WQX3Bl7R)
+>"^WAS!!#Df021A8bt#D.RU,@q]:gB4Z1'CN=!*CgggbF!+'tDIIBn+EVO;ASuQ3GA2/4Bl5&%
+EMXFBl7QnBOPq&F^fE+DJ*cs+Cf(nEa`I"ATAo4@;0a)Eb03+@:NkcASuU2@qg$rD/"<-@<?F)
F!,RC+Dbb5FE8uUCh[s4F!,RC+EV%$Ch7Z=+E)@8ATAo6@;]k%+E_R3BOPdkARo:hF(9-0Bl7K)
Ea`Km@;^-rDf]H!Df]W1AKYMpB6%QpF(9-0BP;[1ATD6uCh[B%@rHF&DIm<u@q0doCh[B%Eb/d(
DId0n@sK2,BOt[h3ZqpQ@j!.@ATMr9F*)G:DJ(>,FDPH#@<,ddFCfJ8FCAWpAKZ)5+Dtb7Ch[cu
+Co&"Bl.R+ARlp"BleB+F`_M4F*),,G[kl<+Dbb5F<G:8FDi:>ATMs)A0>o8DK?q/DIal.FD,6+
@s)m7FE2)+G[kl<+Dbb5F<G:8FDi9MGUXbDDIal.FD,6+A79RkAo_U'FBMaL=\VUY6m-Si+B_iM
=WgF5+@JU?Ch[s4F(A^$AS,t#F_t8a=]nHn6pr/>D]i1c=]lkA9cuhl+>"^WAS!!#Df021A8bt#
D.RU,A79alB4YLaAKY])+Cno+F(A^)De=3)ASZL$ASYgbGp$^>Df$V"=]nlM9hc`u6m-#KFCfM9
/Kf+GAKYf-DJ()&De!p,ASuU#@Vg%,DffQ%DI[L$F(HJ&Cht5(BOPpi@ru:&+Dbb5FE8R=DBND)
@r*9%DBL,GEHQ2AATMBkEHQ2AARo_%@VfTuEHQ2AATJtG+CoD5@VfUs+DG_8ATDZsC`joEEHQ2A
ATJu1Bkq9&-ujBJFCcn3A7K:a@r"t27R^3D:.%Gm/KdhW6:2l0DKKH1Amo1\+Eh=:@N[6FEb065
Bl[c--Y-a8A7T1fD,Nel78cQL6U`+L+AYBl6Qg)\FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&u
A7KOo;FO&D;FO>J73F0):IIN:+DG_8ATDBk@q?d+ATD6&/Kf(FEHPu9AKW@2A1(nu@rH6_77K^D
78?3=+>"^36pa6`Bl8$(Eb8`iAKZ/-Eag.C+ED%5F_Pl-+=C]1-Y-auBld0@7R^3D:.%Gm/KdhW
6:2l0DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Y-a8A7T7lE`,=q78cQL6U`+L+AYBl6Qg)\FCfK)
@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&uA7f=b;FO&D;FO>J73F0):IIN:+DG_8ATDBk@q?d+ATD6&
/Kf(FEHPu9AKW@2A1(nuAn?'^77K^D78?3=+>"^36pa6`Bl8$(Eb8`iAKZ/-Eag.C+ED%5F_Pl-
+=C]1-Y-b"Eb'$.A7]7bD..6'A7]CoAS#p*Ao_g,+Co%rEb/g'/0JeDDKU&4F"AGTARfXrA9/kF
+DG_:ATDj'+=Lc;F(TH'A1;&"F(K/c77K^D78?3=+>"^36pa6`Bl8$(Eb8`iAKZ/-Eag.C+ED%5
F_Pl-+=C]1-Y-b/EGSNA7R^3D:.%Gm/KdhW6:2l0DKKH1Amo1\+Eh=:@N[6FEb065Bl[c--Y-a8
A7Tb%@o>`b78cQL6U`+L+AYBl6Qg)\FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&uA9;9sGZ$t"
78cQL6U`+L+AYBl6Qg)\FCfK)@:NjkG%G]'+>"^VAT;j,Eb-@@A7R&uAR]RpEb0*+G%De)DL!@@
ART+`DJ((Y:JEkm6@!Za+A[#gATAnf@<--+<E)F>3$:XZ/4)ZS6:N(GBOuE;A7]7hD/F<)D/XT/
F!+t2D/Ej%FE8R:Ec5e;C*7_=Eb'6%AThTqG%kB,Bl@l3@:F.tF<GF3@;]UeGA(]4ASQ9rEbTK7
Eb0*+G%G_;@;Ka&Eb/d(DId0nF<G%/@;]k%+D,Y4D'2FnF(96)E--/3An#:^@qfdgC`m>1Df$V+
Bl7@"Grd'YAmul;+>=ol+>FunA7f:\A7]7bD..6'Ao_g,+Cf(nEa`I"ATAo&Bl7@"Grd'YAn#6m
-S[;/0ek%dAnY^d@qfdgC`m>1Df$V1AU%`tEb&`oEb/g'+D,Y4D'3k-A8,IiA8-*pEb0?(Ea`ir
Df'N'DId[&+Du==@V'S$+D,Y4D'370A8-*pEb0?(+Co2-FE2))F`_>9DIdU*Ao_EmA7]CoAS#p6
+Dkh1F`_29/0K"F@rH6qF!,(8Df$V-ARfFk@;I&sAS6$pATJtG+DG_:ATDj'+=Lc2Ao_F!F"(X<
Ci!O#F"o[01Lk?@F*(i.F<E:u0f'q_Des5uEcW@8Ec5e;1,(C@+@Ass+DG_(AU#=L+EM+*+Dbt6
B-:`'@s)X"DKKE-Ci!O#F"o[60Oo$=F*(i.F<E:u2_Z@bDes5uEcW@8Ec5e;1,(C@+@Ass+DG_(
AU%a,FCB9%ATM@%BlJ0.G%De;FCB9*F*),+F(BB6CghBuA9)U-F!,RF@;0OlDJ()5CghBu+C$%!
BOPpi@ru:&A9Dj.@<64$@<63,De:,&F`;/2@psIj+DGq/D0'8s@q]:]G%G]'+CT)#@<3P</j<iT
Ecbu*BleB,BleB)DI[6#Bl5&/D'3;!FE_;-DBNg>E,TH.FE8RCDBO%7AKXEMEcbtBF!,OHEb8`i
AS#:kFCfK&@;KFrCghEsF!,R<AKYMlFCcS5AfsNNF*(u6+E_a>DJ()6BOr;rBQ\?*BHU`"B5_g)
FD,N&Ch7]sB6.X%@r-()ATJu=D/:>:AU&;>.![6aBl5&<D/:>+Ch7HpDKI"C@:s.gE--ACF_kk:
DJsDEA8-+(CghU'DJ((?@rHO%Ec``QEb0<7Cij6*E--AHBQ&**Ble60@<iu5Dfoq?FD,6'+ED%8
F`M@B0H`%p-RU$JD/aTB+EV%$Ch70qEHQ2AAS#ahCi=B++DG^9+s:lJDffQ3+>"^WF`MM@F`(`(
DJ()$Cgh3sF!,L7D/XT/A7]_$Ao_j3@rH7.ATDl8E,Tf>F(96)E-*3NE-!HNFDi:5DI[*oF*2;-
FCeu*E,Tf>F(96)E-*3NAT2]>ATD4#AS#mjF(HJ<DfTB0ATDg0Ea`EqEc`FJBln#2ATDg0EZf41
F)tc&AS,@\FDl2@Amo1kDfTnADe:,2Df]W7Bm+&1Bl8$(B4Z+)AmoXtASu$eE,]B+A0>u4+D,>(
AKWC$<(8hiAnc'm+DtV)ATK:CEb0?8Ec,q@,@Yq?ATJu.Afu/;@q0(kF(TQ2+C?iGDffZ(Ed)5=
AS,CiG]$r,AR]S&ATJto<(8hiDIIBnF(SooCi<a(04S[(Ea`I"ATAo'Df0`0EcYr5DJ!BlA7T:^
BHVA9C`m7sFCAcmEaa$#ATD4#AKYT!Ch7Z1/KeP>+FG;@Ch%9(De:,2@<?0*Anc'm+DtV)ATMHp
FC\ooATT&9EGQb.@<>piAU%p1F>4nPAft]"Ch4`#G\M5@F!*.ZDffZ(Ed)5=AS,RqAnc-n+D5_5
F`8IDDf9_?GAhM4F(T-,F*)><AM>KQ+CT)&+C]J8+EV:.+D,>.F*&NZ+DG^9Ecl8@+E(j70dh$S
Bl\9:Df0--0ILoa@;Ka&@Wcc8Anc:,F<E:\Bl5&6F`)7CDe:+H-Z^C^+Dbb-AKWC5Bl\9:Df0,8
+C]J8+Co1uAn?"(+D,P4+Du=<Cia3&EcZ>@DImlEDfBf4D/"<-A0<:4Bl\9:Df0--.3L2bAmob&
ATMr9Anc:,FDl&.-Z^C^+Co1uAn?"(+EqOABHS^8Bl\9:Df0--.3NPH+Du=<Cia3*FE;Y;G\1l7
D..N/F(fK4F<G(3D/Ej%FE8R:DfQt7DI[L*F(oQ1+DG^9BOtU_ATAo'Df'?&DKKr3D00l1AoD^,
@<<W6@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#
F_t]-FCoH#An?'oBHVA1DJ*cs+Du+?DBO+2Cis;3Ao_g,+=M,G@OWF=@:O(]B4X+HE$0%:@N[%9
Dfor8@;TR'Ao_I&Ao_I&F_,H#Gp$X3F*)G:@Wcd,Df00-AT;6pF*)#7AT;j(DI[r7A8-+,EbT!*
FD5Z2+E(j7DKTf-EbT#+Blmp'F(TH(EGT?1FCoQ)EHPi1@sK2-BleB:Bju4,Bl@l3De:,$Dg5i(
+Dbb5F<G:>ASlL#Ec5f'F(8ou3&P5X@rGmh+@/pn8P(m!+ED%4Eb0<'DKK</Bl@m$Ec5f(@<6!<
1hLcHD'3:rF(HIP1a$gME,oN2ASuTuFD5Z2+>"^MDK]T3F(HJ4Afu26@UX=h2Df#dDf'63Ch[<q
@rH7.ATDm6+A-cmBjkm%A79a+DKTf*ATDi7FDi:4@<?(%/0JG@DK]T3F(HIBFDko:Ch[<q.;!X8
H=_/3H=\4;Aft]"Ch4`'DBND6FCfN*F`V,7Dg-8@E+Np.+CT.u+Cei%AStpuATJu'Dg5i(+Dbb5
FE8RCDBO%7AKYetF*&O5G\M52GB.D>ATr0/FCcS:D]iY+Ch4_;<E)FI+D,>(AKYl!D.Rc;+ED%8
F`MA@+<t?@FCfM9BkAK/F^nomF)tr9C`m(>+E)@8ATE!/F(JuqDf'&oDJ*O!D.Rg0Bk&9&ARTI!
De:,#+Dbb5FD#0,ASbpjATT&4Df0H(F*(u(+E2IDAKZ57C`m;*ASl!rFE8RKBln#2ASu!oDf]W1
B-:YpB5)6+ASu$$FCAg'B4Z0rCh7$sFE2#*F<GI>DJj$,FCeu*@<?U3Bju4,AKZ57C`m;*ASl!r
FE8RKBln#2ASu!oDf]W1B-:YpB5)6+ASu$$FCAg'B4Z0rCh7$sFE2J7G][S0F<G.2ASl!rF<G[:
G]Y'?Des6.GA1r-+CTA6EbT!*FCfN+ATVL"ATVL.FD#0,+E2IDAKYQ#ASl!rF<G[:G][S0FCf9"
FCf]=Bk2I&DId='+CT.u+D58-+E2IDAKYQ#ASl!rF<G[:G][S0FDc5<@rH1"ARfg)Bl7m4F<GC6
DIml3@<3Q/F_tT!EcW?T+EM+*+Dbt6B-:`'@s)X"DKKN4E,K<"F<GX<DfTqBE+*j%+D,>(AKYl!
D.RBhEc#ArDJ3I!D/X<+@j#W"@;]ajA8#P!+D,Y4D'3A#@qfdgChREk12(6D+D,Y4D'3A#@qfdg
C`k;PCi=N/EZek#F(HJ&CiF&rBPDO0DeF*!D.@L$E-686F!,.1F*)>5Ea`g++E_a:F!,L;B4uB0
DfB9*+DG_8ATDs&Ci^_'G\J^RBe(ne+>"^WAS!!#Df021A8bt#D.RU,BPDO0DeF*!D)-9CEbSs(
Bl@l3Df-[GBPDO0DeF*!D(-TMF(KD8Ch74#+E)41DBNY2FCfK9@;L!-.!TGW+F%TN0jSI0F(TH'
A92F&F`MOS+Dkh1F`_29/0K"F@rH6qF"V!6A0>K)Df$V-ARfFk@;I&s@<iu:ARfXrA90dSGp#3l
3&WTI0PGBGFE1r7F`MA@+ED%7F_l.BDe:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'LFE2)5
B4uF+BOP_#AKZ,5FD5P6De*Bm@qfh&AS5Rp04S[(Ea`I"ATAo'Df0`0EcYr5DJ<]mAoD^,@<<W+
DKKH1Amo1\+Cf>,D.RU,+EV1>FD5W7ATDj'@ruj2BlS9,+DGq/D'3P1FCfK6ARfgrDf09,FCoQ(
@<?'`=]nlM9hc`u6m-;[F*)IGFDi:)=]nm%9ghAlBl8$(B4Z+)Bld^)Df%3OBkAJrFDl"=0Hb:U
BOu4.Bldj"F(0'4ARomoF*)IGAoD]4@W-L&A0>DkFCAm)@q]:kFCfN8F!,(5EZek*@<,ddFCfJ8
A79RgBldd&D/a<&GVL=TAftN&B6A'&DKI"8F!+t2D/a<&GT\[_DffZ(Ed)5=ASH3tCi<a(0d(1B
+CT;'F_t]-F<G:=+D,G.@<?4$B-8lNDffZ(Ed)5=ASH4"DKKu3F*)IGAoD]4DJsE(G][M7A7]9o
Bl8$(B4Z+)+>"^FDf9H'@;^-/@<,p%@rH7+Bk1dqARlotDKKH&ATDj+F)GE(0d(1B+AP3t+=M,G
F<G!7DKTf*ATB4B0Hb:UBOu4.Bldj"F)Q#/DKKH2FE8R:DfQt=E+No0A79RgBle37Bl.F&FCB$*
AoD^,@<<W6Bl.E(@<4IP=]nm1/PSqk6pr.g;E@NI3`AC[F*2A7@rGmh0d(1B+Cno&@3B9*+E_R9
@rGmh+>=pVFD,6+GA2,0BleE7BlS9,0d(1B+DGq/D0$h.Eb-A9DJ=*5AKWZLDffZ(Ed)5=ASP^q
@q]:k@:OCjEZfI4@VfTuEb031ATMF#FCB9*Df-\9Afth2GAhM4F"AGD@;Ka@+<YE/EZc`QATD6-
C2dU'BQIa(F*(i.A79LmH=_.?8g&(]FD)e-ASc'tBlmp,+EVNEF`(o<05P??Fa,$@DfU&1Eb$;6
CghBuC34N5@<6*jE,]B+A9/l8Ea`ZuBl7Q+0-Ft@+Dtb#ATMp$Ed8d9DIal2FCB&t@<-(.ATJu&
DL!@0+EVNE05>WGAo_BiCeAhdBjkm%A79RkF!,(8Df$V,@;KLmA79L$A79RkF)#i=FC]E8AU&<;
@:OD#+EV:.+CoM,G%De.Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRsC3=T>A9)j4@<?0oG][t7@rri(
EbT].+CT.u+E1b2BHUo-Df$V:F^]*#Anbge+D,>(AKYl!D.Rd'F`VY9G][MAFE1f"FE8RHBOr;t
G][M7F(oQ1+D,Y4D'3h@@;KXiBk:ftAnc'm+DtV)ATMU/F*)#.Ch73mCh4`,@;TQuAo_g,+D,b4
Cj@.CF^]*#Anbge+D,>(AKYl!D.Rd'F`VY:Bl%?lG][P3Ch4`,@;TQu@;]TuAU&<.DKBN1DBNP3
Df$V/F_kl>+E;O4Ch[KqARloqBl%?qF`VYD@<?0oG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rd'G&BnpG%G]8Bl@l3DKTf*ATDO/Ec,<&ARlonBOPpi@ru:&+Dbb5
F<GU8E,oN2ASuTuFD5Z2+E(j78g&=rEb'6,F`MSBF(o]2F`MSBF(o]3@<6O/DIkLLF!+n-C`m20
F<G[=AKYetF*&NZ+DG^9Ecl8@+E(j70dh$Y@<6O/DImlC-Z^D=Cht5'F`\aB@<6N50d(1J+EDUB
F!,C5+>G6b+>"^J@<6O%F*&O@@<6O/DIml:F!,X;Eaiir@;o[iF<GC6F*&OKBln#20dh#bD..I#
Bl7Q+Ch7$o+F.O,EcZ&/E,9*'B67g.+D,Y4D'3e+Ecc#;Bl@lM+EM+*+E1q/ChdO%Ebo0*F<F0u
ATDg0EboK5F*)50Aoo/1F`VY=ApGM@@:F%aCia3&FCT6#AnGaeBk;1(F!,C5+E278H#@P;Bjkg#
Anc@/Bl7Q+A79Rg+E275DKKr9FE2)4FE2)4+DbV$F<DuJART+`DJ(C@@VfIjCNF<7FDPl(A0>],
@ps0rF`_>6Bln'#F!,:;@ps1b+CT.u+DkP&AKZ28Eb'56@UX=h+CTG%Bl%3eCh7Ho2.glID0'f>
Bl7QnDf'H9FCfJ8D.GLHBOPsq+D,Y4D'3>%@<,ddFCfJ8Ch[s4D.R-nD.R-n+Eh10F_)\6AftM)
Ch[s4D.R6l@;]pnA8,Ii+Eh10F_)\6AftM)Ch[s4D.RQmD.RR&Ed8d9Ci"$"@<?'tASl$rASl@+
Gp$^>AS#^iD/sK)D/XH?+ED%%A8PmpGAUo.DfU+GGB.D>ASl-lE-,r2A1_b=Bl8$0De*E7Anc-n
F!,R<AKYi.F*&O:Eb065ASuU+Gp%$8@s)g4Bl7Q+Blmp'.!$g[Bl5&%+Dbb5FDYr6FD,2nFCfN6
ATW'8DK?q/Cht5;@;KXg+D,>.F*&OCAftr/DKKP7A79RkF!,(5EZf6B@ps1bDId0r+F.O,EcZ)9
DKKQ5@V'Y*AS#aqBleA=De:,/Df0Z1+Cf>4DKKqB@V'Y*AS#a%FE_XG=]nm19he#D+Cno&ATM^,
Df0W<Bl.F&+E(j7DIn#7@;]TuAp%p++Dl%8DK?q4DfQt<+CehrASu$eEZfX=@<-F+Dg#c1ARTIn
Dg#i4B-:huDf''-EbT#+D.R-nD/XT7ARTInDg#i4B-;&&@;]sm8g&"[D.Oi"CghC+DIn'7G%G]8
Bl@m,AU&;>G%G]8Bl@l3DKTf*ATAo+Bm+'*+CfP7Eb0-1+=MLa+Eh=:F(oQ1+>"^WAS!!#Df021
A8bt#D.RU,DJ*HsATo80Ec6)>+Cf4rF)rIGASlC&@<?'uCh@^.Ch7L,D.Ra%@j#T%F*&O:Ec5e;
Ecl7BCh7KsFD)e.DI[TqBl7Q+FCAWpAKWQIF(Jo*-us-8Ao_d*.3NGFDJ()&De!p,ASuU-Ch@^.
Ch5A1Cij6/DIIWu+Du==ATDKp+Dbb5F<G19Df$V;F`&=<ASu.&BHUl(@rGmlDJ()6@:F%a+>"^W
ARuu4DJWp*Ebo;9DJs!+Ea`j,E,Tf/A0>c.F`&<ME+*6l.3N&8Ci=N=3Zoh)HZ1Ds/g)lqE'5fr
DJru,DJUFLDf0-&ASu.&BP_6tB67g.+E(j7@rH7,BkM@,F!,LGDK?q=AfrfUF!,17+C]&,+Dbb5
FE;A<Ao_I&A8-+,DfTB"Eb/c(DKTf-EbT#+Ch[s4+D,Y*EHPi1@sK2-BleB:Bju4,Bl@l3/Kf+G
AKYf-DJ()&De!p,ASuU/@:O(l@:O(o+Dbt+@;KKtDJsZ8F!,17FDi:2Dg5i(+DtV)AKZ/)Cis;3
FCAWpANCrQ@:O([Ci<fj+Du"&Ci<fj+>@bCEbTW@0d(1B+C]8-Ch7$m+Dbb5F<G7*F!+n/+D#_-
DBNh>D.7's+E(j70dh#b0Hb:UBOu4.Bldj)@<-F#@rlg4@<-F#F!+t2D/E](A7]RkD/"*'A0>Ju
Ch7[,@<-F#FC]?!EcYe7<'`hnA7]RkD/"*'A0>u&@VfTuFCf]=+>"^WARuu4Eb/ZiFC[-U+Dbt6
B-:`'@s)X"DKKi+EcYf8DesQ5ATMp3Ch\!4+=MDOCisT+F"&5PATN!1F<G:8FDi9MA9)C-ALqY+
@V'@,F(KB+@;IA8FCAWpAT2("E+*d/F*)GDE,961+Dbb5F<G:8FDi:CF^f0$F*)IGDe:,2@<?U&
Ec*".DIal-Df..G@<?U&Ec,i.@kpFpE,TQ$EZet7Df$V,Df9Z,Bl7@$ANCrQAn)r<+>IhICiEg'
FD5i2Df-\0Ec5e;Ch7KsFD,_V+EM+*+DbY/E+s9*+>"]jE%u<G@r$-sCh7*u+CT.u+Co2-@r-()
AKYE%Eaa59Blmp'F)Yi4ARfC^EcZ&<FDPZ4FD5W*+E):7ASuU$A0>i0Ecb`!Ch4_uDg3C8Eaa0+
DJ()%BOPpi@ru:&F)Z&6H#ReBA8lI'H#@P;Bjkg#E,ol-F^oM9/Kf+GAKYf-DJ()&De!p,ASuU/
DfTr0BOPq&E,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDj2Df^#7FDu8=D/XN-F!,C=Cj@.3
FDl#;+CT.u+Dbb5FE8RHD]iP.CisT4+EV%$Ch7[,G@l&>Blmo/E-67FA8,OqBl@ltEd8dODfTB0
+CT=6F(96)E-*47Bl%@%EA;'>EcZ=FEHP]1FD5Q&EAM]MBl[`,EHP]1FD5Q&EHQ2AAT;j2FCfM9
@q]:k@:OCjEZf14F*)IGAoD]4AU%crF`_>9DK90'A9Dd(Ap&!*AoD^,+ECn.A8c<-DKTf*ATDi7
/Kf+GAKYf-DJ()&De!p,ASuU(Df0T,@:XCi@:XF%@3B/rCh4_tF!+m6Ch[s4+E(j7@X3',F)ki#
A7K\(Eb/Zi+Cf>,D.+Q.AT2'u@<?'k+EV%$Ch4`$Bl%@%+>"^WAS!!#Df021A8bt#D.RU,Eb/Zi
@rlg7Eb/Zi+CT.u+E1b0F(HJ(Df'?"+EM+5@<,duARlp*@:F%a+D,>(ATJu&F!,OLD.7F"F!*%W
F(Jo*Ci=3(+CoD#F_t]-FE1r$A8Z=.DK9;sA9/l%+A*bcBl7@"Gp%!CF`&=6Bl%@$ART+kA9)6i
A0>;uA0>i"EcYe7<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF)ki#A9;?;Eb/Zi+B1Wn+Co&"Bl.R+
ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-FE1r$
A9;?;F)ki#A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1@<3Q4H#7#/Ci^^N+EM+*+Dbt6B-:`'
@s)X"DKKo1@:XIj@W-+(ART*l<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF!,10DJsQ0DJ()#DL!@@
ART+`DJ((Y:JGk@@:XIjF)ki#A0>;uA0>i"EcYe7<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF!+n4
+EMgF@W-((+>"^WAS!!#Df021A8bt#D.RU,Eb/ZiG'%88ART*lG%#E*@:F%a+DbV,B67f0FCAW$
A7]RkD/"*'A0>JuCh7[.ARTCo@<-I1ARTBtE+*d/+E(j7@rH4'Ch7i6DKTf*ATDj4AR][kD/XT/
F!,L7A9Dd#@;^00@VfIjCNCUM+DbUtA8,po/0K%T@;0OlDJ()/F_l/6E,9*+AR].iASl@/ATJu2
F_l/6E,9).@VfIjCNCUH@q]:k+E).6Gq!cF@WHC2A7]RgFCfM9@;Ka&@VfIjCERY9GB4m=Ec5e;
@q]:k@:OCjEZfI4@VfUrAR]aj@rH1(ASl@/AKZ)8@;0OlDJ()$Cgh3s+Cf>+F_u#;Eb/^&B4Ysl
Ea`cuH=:o0Df-\9AfrLBAR]-u+=MI`+CT;'F_t]-F<G:=+CT/5+CTA1D/s3"Bl\9:Df0,qBlnD=
Eb0?$Bl7X&B-:f#EcZ=FASbppASuT4De:,%Df0Z2B5_p6+>G!ZF`)7C@;]TuF*2MDDfor.Bl7Q+
0ILp^ASksrFCB3&F)ki2CgggbF!,"3FED))+A*bbEbBN3ASuU2+DG^9F(96)E--.DGA2/4+E_R4
Dfg)4A0>H'F_Q#-Ch7L+F)ki3F`2A5A9)7#CgggbF!+n5Df'P<Bl5%;EHQ2AARlu-Ch[s4F)kl'
Ea`Km@;^-/Ao_g,+Co%rEb/g'Eb9-%E--,/DKBc8F(KD88g%P_Eaa67+EVNE;K?MpF*)G:B4uB0
C3=T>BkDW5FCAWpATDTuAo_d*Ecl7BCh[s4+D#G#De*R"B-:f,Df$V7F_t]1Bk&9%BleA=/Kf+G
AKYf-DJ()&De!p,ASuU1Dfor.Ec6)<A0<:G.3N_N+Dtb!Eb0<6+=MI`+=LeRB.b;]0JG1'Ec6)<
A0<T^1Ggs<Ecc>9D00f4D'3k5B4uB0.!0K<Bl%L$B.4s4Cgh3sF)lD@Ch7KsFD,`3ASu.&BQG;7
Aftf0ASiQ1F`)7CBl5&0BleB;F(AcoARfLR77K^D78?3=+>"^WDe!QoF<G:8FCfK)@:NjkG%G]'
+>"^VAT;j,Eb-@@F)PQ(ATT;@A7KFoF(J6<7R^3D:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+ATD6&
/Kf(FEHPu9AKW@ADe!QoF=2-?@rH7&ARfg[77K^D78?3=+>"^WDe!QoF<G:8FCfK)@:NjkG%G]'
+>"^VAT;j,Eb-@@F)PQ(ATT;@A7oIqBQ%s6@X2j"D.QU67R^3D:.%Gm/Kf+Q@r#Xt+DG_8ATDBk
@q?d+ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-?Eb/a(;FO&D;FO>J73F0)F)PQ(ATT&/DKKH1Amo1\
+Eh=:@N[6FEb065Bl[c--Za39CLqT8F(B?'DIcX67R^3D:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+
ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-?F)PQ(ATUg=7R^3D:.%Gm/Kf+Q@r#Xt+DG_8ATDBk@q?d+
ATD6&/Kf(FEHPu9AKW@ADe!QoF=2-CDfTr9Df03*@;TRsCi=3(+CT.u+EM47Ec`F9Bl%?'DIIBn
F!,(8Df$V-Bl[cpFDl2F+E1b2FCfK1F(fK9E+*g/F(fK9+CT.u+EV:.DBNn,F)rIADfor=Bl8!+
DIjr2@:X(\DKBl5DIdg&DBNJ$B6%QpF)u&5BP;[1ATD6uCh[B%F(oN'F),?2DImm1F),?2DImm1
F)>i<FDuAEF(KE6Bl@l3D..<jB4Z*+Dfp/@F`_\C@WQ*sARfg)-uNs4.3NS<@r#LcAKZ&:@WQ+&
3ZrAaF)PM14$"a(F`VXIF`S[:BP8c7E,961F*)GDF)Yr0FE8R7BOPpi@ru:&+Dbb5FE8R=DKKe>
F*1r.BleB;+EV:*F<GXH@<-H4GA2/4+=M:[+CT.u+D#G$+EqOABHS^7.<BQ@ATi-;D'3b/+EMOF
@<,p%A7]pu@<?4%DK?pK1+@9cCghBuE,oN%Bm:b:ART+`DJ((s+Cf(nEa`I"ATAo-Aftu&@qB_&
@<-X7FC\onG&qb6DId0rA0>DoG%kB,Bl@l3-t-q6ATDZsFCcS9E+Nj%Bl7Q4F*(u4F!rejGpskI
G%GQ-Gp%0I@:NkZ+DG_8ATDs&Ci^_.ATW--ASrV=0RJ'o+CT.u+=JskGptcsF*(u4F!+gE+>Fuo
0QVASEbTT+F(KGI@rH4'F`_29+EM[C+ED1;AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+Dfp"AA8bt#
D.RU,@<?4%DKBr<EbTT+F(KGJ@rH4'F`_29+EM[C+ED1;AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+
Dfp"AA8bt#D.RU,@<?4%DKC)?Eb/ZiFC]E'@:UK[5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%+CT=6
F*VV3DesJ;/Kf+GAKWCAART+kA25TU@:EqmE,ol6DffQ3+E).6Gp$O;Df'P<@;]TuCh[s4F!,RC
+EV%$Ch7[0@:sY+D/:=]77TpE+CT.u+@T$n+EV%)F*(i.FCB&0Ea`Km@;^..@;]Ut@;[2uAS6$p
ATMs%DJ3^/E+O'!Des,t+EV%0B4Yt&FCB-1@:F%a+E(j7@;Ka&E+O',F`_&6Bl@m1FCB-)FCAWp
AKYo'+CT)&+E1n4D09r/FD5Z2F!,C5+Dbb5F<G:>ASlL1@q91=6q/;-F<DuW.3NP@+EV:.+ET2G
BleB:Bju4,Bl@l3GA2/4+=MI`+Co%rEb/g'+E(j7Ao_HoA8c=,AU&</DfT\MGB.,2F!+n/A0>W0
F*),.Bk;?.@q]:k@:OCjEZfI4@VfTu.![7`Bl.F&FCB$*AoD^,@<?Q5FD5T'F*(i-E$/S1+Co"*
D/F,4H$O[\+D>dVD/MCU@ruO!@;p0sDIdf2FE1f(Ch[d"+Dbb0AKYSrARlonBOPpi@ru:&+DGF1
DIm<hF)tc1H$!nEFD5T'F!)lPARfXrA901B@;]TuF)YPtAKWC1H$!V=.3N_N+D#e/@s)m)+EM+3
FCf?"ATViX;G9PiDf0`0Ecc@F@q]:k@:OCjEZfFFEbTE(F!,RC+@B%#7Nc5QCh[a#FCfK7Db*Z&
<+BiaG%G]9F!+t+@<,ddFCfJ8F*)G:DJ+#5FDi:8Df^"CA7]RkD/"*'Ecc4l@rH7.ATDm6+Cf(n
Ea`I"ATAo7FE2)5B6,2;D]hXpA7]RkD/"*'EZe%FFDkT/@qfX:20<aZ@<5pmBfIsmEb031ATMF#
FCB9*Df0Z8@UX=h2DfMo+C\c#AKWlf+ED%4Eb0<'DKK</Bl@m2De*9uARfXrG%G]9+=M>MA79b$
D^cfCDKKH&ATDi7FDi:4@<?(%FDk\uH#dJ<F`MA@+EVO4@<lo:A79RkFDk\uH#@P1Df0`0Ec`F7
@<?(%+EVNEA79a+DKTf*ATDiC+Cf>-G%G]8AKWCCDe*9uALV_>C3=?,@;]RnDK]T3F<G+&FCfM9
FDi9oF_kc#DBNIuGp%!ID.7'sF!*%WF(Jo*Ci=3(+CoD#F_t]-FEDG;Dg,c5@rH7.ATDl8FDi:<
Dg,c5+Cei$ATVj5E,]B/@rH7.ATDl8FDi:EE,]B/+Cei$ATVs$DI[L$F(Jj"D/aW>ATJu&+EVX4
DKBN6Bm+&1@r-()F`M&8Ea`iqCi=B+13@PFDKBN6Bm+&1@r-()F`M&8Eb/g'F_u2BD0$hC@;L't
F!+n5+EVX8AKYl/A7]h(EclJ;DKKP7DfTB"EZfIEF`_:>FCAWpATW!8Bl.F&+=M;B@rH6qF"&5?
DIal2E+*6f+=L]EFCfMB+EVNEAU%crF`_1;F(K62ASu!hFE;&7F`(o<F(Jj&.!^)`Gp$s@+Co"*
BP8N+DBO"A.3N_HD.Rd1@;Ts+Ao_g,+E_R9GT_'=@rH6qF*)J>@<6*jE,]B+A9/l8Ea`ZuBl7Q+
>TdNi@<,ddFCfJ8BkAK*ARf:mF('*7FE;8,F(d=;E,]B+A9/l8Ea`ZuBl7Q+0-Ft@AftnuF*&O7
BOPpi@ru:&+DGm>DJsV>>Tds*+>7hXEb033Bl.F&FCB$*+ED%4Eb0<'DKK</Bl@l3@<3Q"+EM77
B5D-%DKTf*ATDm6FCB$*5tjj9;]mY7Eb03+@:NjkGA2/4+=M>GD.Rd1@;Ts4F^oB&Ec,B-A9Dd(
@rGmh+Cf>/AKYr1Bl8$6+D,Y4D'2S@;BTL]@qfdgC`m5$@<,ddFCfJ8ASu!rA8,po+>"^WAS!!#
Df021A8bt#D.RU,F^oB&EclJ93-B+Q@rGmh+Cf>#AKYr1Bl8$6+D,Y4D'3tCAiLoCBOPpi@ru:&
+EMXFBl7R)F`(o<F(Jj&Ao`!7F`(o<+EM+(Df0*,+D,Y4D'16PH$OZXD/CD+A0>Q!+Du'>F)rcQ
FD5T'F*(i-E-6&;@:O(eDK]T3F(HJ4Afu&$@r$4.@UsLnG%G9"EcZ=FD/XQ7FCeu*<Du4,A9)C-
AT`*,3+HW1Ea`I"ATAo0BleA=FDi:%<(8H!F`_4TAo_d!Eb'<7AiLoCBOPpi@ru:&+EMXFBl7R)
+D,Y4D'3t=Bk)'lAKX`8;BTL]@qfdgC`me@EbTE(F*:u.A79RkG%#3$A79RkF!,:5F*)IGDfQtB
@:F%aF!,C5+B_iM=WgF5+@JU?7ri0RDfTQ#DBNFtCh7Kp@<*K$@<?(%G%#E7@<-O0CisT+F)ti"
DK?qDDesQ5ATJu(/UAOJDIal1ATW'8DK?q1F`MM6DKI"3EbT].F*D/=Bl7I"GB4m;EbT].Ed))+
CLgk!A79a+De:,9AS#X"/Kf+GAKYf-DJ()&De!p,ASuTN+<Yl>ASYgbGp"h%2)?@6+>S.PASZ1+
D.7'sB5)O#F!,R<AKZ80@<*K!DIal6AS#XpF_tT!EZf:4+Cno&ATq]sCMn93@V'R8@rH4'F`_29
+F.O,EZfR;ASWE+F_tT!EZet4EZeLf=]lkA9cuhl+Cno&ATN',ASZ?rATW--ASu<uF*&OCAfu;/
ASWDuDfor>F!+q'FE_;-DBO%FD]i1c=]nfn+Cno&ATN',ASZ@$DL#f%EbB*0ATJu3F_tT!EZf:4
+EqC.CNCV4DBO49@<*JB+EM+*+Dbt6B-:`'@s)X"DKL)7Cf3\k78cQL6U`+L+EqaEA0>K&Ec#6,
Bl@l3Df-\6Bl7L'+>"^XD]j1DAKYf-@:UL&BOr<!Ec6)>+=MGPEb&d#Ec#6,Bl@l<GA1r2@q01\
EcZG=DId[0F!,:A@qfI^+Cf>-F)Pl++C]86+CoM$GA1r-+Cf(nEa`I"ATDj9Bl7luFD,`,E-$,0
DId0rBmO?3+A*bq@<?0*A7]RkD/"*'EZfIB+EqO;A8c[5+C\bhCER\7@<6++Ea`p2DfTB0GB.,2
+EqaEA9/l-DKKe>Ch[cuF!,C5+DbV,B67f0.!R1bEbTW,GB.D>ATJu&+Dbb5F<GL6+C]V<ATJu9
D]iY+Ch7g2Blmp(DforAEbTW,F!+m68g&"iF`&=6Bl%@)EbTW,FC]!%Ec#6,+CT.u+Eqj?FCcRo
5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%GB.D>ATVH<GB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+
ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-FEqG+Eb&U#ATMm'FEMVAF!+n-
C`mn0Ch[E&A79RkF!,(5EZf6B@ps1bDId0r+F.O,EcZMOH$O7FDId:"De*:%+DG^9.!^)`H#7J;
A7Rc8Ec#]8F"&5DDfT]'F8                                                    ~>
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
1H-F6+>P&o0d&>22BY"&0fD!N+>k9!2)cX41a"S/1a"M,+>Pc/A8c:#@<-ED3AE=#Des5uEcWrq
0f'qq/M/)TDf0W<@;^000f^sE+CoD,Cgh@*+D,Y4D'1Sf0K1+A:e;*'%15I@DK]T3FE8R7F`MM6
DKI"3Des5uEcW@FD]gbp0f'q_Des5uEcW@4@<6!j+E)-?FD,5.@rH7+F_t]1+E2@8@q?csDId='
/e&-s$>j^!@:VDA+Du<E4Y@jfDes5uEcWrq0eskhF[L:lEb0-1%13OO+<XEG/g+YBDK]T3F(oQ1
+D,P4D09Z'%144#@rH7+FCB'/?Y"(kCgh@*+?_b.@s)g4ASuTsA8c:#@<-E3.Ng-YEb0E.Dfp,.
6Vp>s,p6]?EcP`/FC.C38LY)U%144#:-pQUGA(E,+EqaHCh+Z*Gp"jr0JG17+EVOGDJ3s*AKYGn
+EqaEFD)e2DBLYo0f'q_Des5uEcVZs+<W[%1c[0F1a"q(+>>E%0d(LTF`(_41,(C90JFV!+?;&7
+=/-c0K1U?1boLI%144#:-pQUDJs_A8K_edDg*=JBR(_7F<G1,Cige9Bkq9&@3BW)@:O'^$6UHO
2)I<G1c-=<+>>E%0d(LTF`(_4A8c:#@<-ED3AE<41,(C90JEqC%144#:-pQUBQ&);D09?%+EqaH
Ch+Ys+>Gl21E^aU@;Ka&D/!g&Bl@ltBl[c-@V$[+DfTr5+EVO4@<i:h+<W(CDes5uEcWrq0f*,s
?SNuP0kE7S@<-I'A8-+,+<XEG/g*T-@;Tt"ATJu:F(oN)+D"u%FD,3!F*%iu+:SZ#+AP6U+D,2,
@qZusEc5e;-uNU<D..-r.3N/8@ruF'DIIR2+EVNEEcl7BAoDL%Dg,o5B+51W$6UHd67sC!A0<7;
ATVctBl5:@>9G^EDe't<-OgD*+AP6U+D58-+?MV3A7T:mA8QB1Ec6)<A1%fn+<XEG/g+e<FE2UK
-Y6_,FD,3!F*&c=$4R=b+AP6U+B3#c+D#e+D/a<&+D5D3ASrW)DBMYbAT`&:@ps1`F_kK.ATJu9
BOr<!AT)*jF(o+n$6UHd67sBkBleB)DI[6#@V'Y*AS#a%FD,5.:L\BVEctl5DeX6'+Co%+:gnBY
F!+n/A0>u-AISth+AP6U+B:$m/g*ntG%#20:L\BVEctl5DfU+GBl5%p@<6*rDJ+'0DBM>"6S8fT
%144#:-pQU:gnBYF!,:;DJ*[*F_#&7+DbJ.BlnK.AISth+AP6U+Co"pEb'$.+Cf>,E-686F!,")
@qfdgC`m8"B6%QpF!,(8Df$V-AS6$pALns@Bl8'8ATKCFF(Jj"DIdet$6UI-0d%S]+<Wg"+Co"p
Eb'$.+C?lH?SX;X?SOA[+<Ve%67sB'11VL_0Pqpe1ijcf7:C7Z.1HV,+EV:.FC?mH4Y@jfA7fjm
D0$gV3$:(4+>GSn+<VdL+AP6U+>c&g+>bch+>GTl+=L!'EcbtD%13OO+<XEG/g+5(F(f9*B68'0
%144#Cbd+U+<Vdi/g+\8Ao_F!F!*D#+>Y,t2BX+b+<VdL:-pQU2`G7i+>[jW2)]Lu-s'u$F=@Y+
+<Yc>ATV?9+?_>"A7T:mA8QB11H6L72'=V4+<VdL+<XEG/g)r0A0<`eD'1PlF!)l+DfTr5.1HUn
$6UHd67sC$Dfor.ARlp*D]geXA7]7bD..7%+DkP/@q]Fp+AHEYF`S!!+<WQs3&*$D1E\h'-nm8-
0d(LTF`(_=+=M%\/9GQ:FC?mQ+D"u%FD,3!F*&O@1+[N\ATV?9%13OO+<W?\0H_KL@<-I'A8-+,
+>=ol+<VdL+AP6U+ELt.AKYetF=_6HDJ'Cc%144#:-pQUAo_g,+AcumAKZ)5+AcumAKWQIDIIU.
Gp$g=Anc-sFD5<-+DG^9FE2).+D,b6@ruF'DK?6o+<W?\3A;Re@<-I'A8-+,+>=pF3A;Qu%13OO
+<XEG/g*n3:iC/]+EVNEAT;j$FDl1B4<S]RD.OhuDJ*cs+CT))DJ()'EHP]3DfQ9o+<XEG/g+,,
BlbD2F!,"9AKZ).AKYQ(F^]B1EbSru+C]J0B4VMZ+<W?\3A;Re@<-I'A8-+,+>=ol%144#0H`%l
ARTV$BOkguF<ERt+>=63%144#:-pQUF`V+:De:+f6pa6`@;]Tu7<i<RC`mP4@psInDf-\.@<>pe
@<5uh$6UHd67sC$AT;j,Eb0;7Eb/ltF*(u6Bl7Q+-u<=6Ci=3(/pM2R.3K',+<XEG/g+SD+CT.1
:IIN:+Cno&@3BW0F`Lu'/e&-s$6UHd67sBsDdd0!-Y-a8+<XEG/g,">CLnVa6pa6`<b6;\F!+n7
@;0Od@VfTb$6UI$BHSE\/g+\8@rH6--Y.:94`"PKCi=3(-OgCl$6UI4EGQa\/g)8Z+<VdS+EM+1
ARfg)Ci=3(BlnK.ALqY+FD5i>A7[<%BlnW>Cgggb+=@U*+<Y`FC`kkn+EMO=/0H;_Ao_g,+CK"o
FDPl5B-^k--OgCl$6UI4BHTGj+EMO=+Co#(AS`K!BFP:k+Cf,-Bk;?.4Y@jfA7fCp+EM3I?SMus
+<YK0+?_>"Ho`B3+u(3G+>=om+F>:e+Cf,-Bk;>p$4R=b+AP6U+DbJ-F<GUBG9CU;+Cno&@:EYd
AKY].+DlBH@s)g4ASuT4Ddmd!Ecu/7B-;80FCbmg+<Y3/F*&Nf/gu'-+u(3V@OWF2@<-I'A8-+,
+DbKr$6UI0Eb$:U/g)f.+Co2-F:AQd$6UHd67sBpDI[]u@<6.#B-:huDe*F#Bk&8rBleB)DI[7!
+D,Y4D'3\@+E(_1ATDs.DJ()5Blmnq$6UI-BleA=-oin8+<iih/1r&`Eb$;>+Co2-F=A=`/g)Ma
-Qjrm+E):2+F>4p+F?-n0d't?FD5<-Ao2X3A1D2.FED%9FtG9gAoD^,@<<W6@:F%aF!+n4+B1Wn
+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F=mn-G%G]'@<?4#3XQ3:+AP6U+D#e:Ch[BnF<G+*
Anc-sFD5Z2$6UI'D00l14ZX]60f'q5+=D8IAftT*C`n-Y+u(3%+u(2g<'`ht/1Eh.3[QIC+F,=`
+D*55$6UHd67sBiFCT,0FCAWpATJ2$+ET;#/g+bCFED%90ea_/,We%7DJsV>@X0)<BOr<"@;0a)
De:,/Gp$U1Bl7g6+Cf)!DBNG&Bl5:*$6UHd67sBiF<Gd@ATD?)@qBImF!,=.Gp$R-+Du==ATDKp
$6UI50g.-3Ao2X3A0<fR1F+>WDf7!b2*30C2(&_<+<XEG/g,%R+E)41DBNh>D.Ra%@j#u0FD)e,
Df'H0AU#>8F_tT!EcVR1+ETA%/g+bCFED%9,s!//+>GYp,TpGQ2]t(>+?=!m$47mu:-pQU@rri3
E+No0@q]:k@:OCjEZfR?FD,T8F<FOK66KcO@<,ddFCfK6$6UI51Hd?5Ao2X3A0<T`+?1VoBcpr)
+EqL-F<G9?A8`h&$6UHd67sC%F<GL@ASrW3H#7#/C`mh.@VfT_+<Yb_4Y@jhD00l1+>GYp2^BMe
3ZodmBcqV6Cht5*G%GP6FDku,Eaa'$+EMgF@W-((-OL1f$47+I$47+I$4:EWFCf9"@<?U3FCf]=
.VE=7ASbpdFEDPFAU&;>FtG9gB4Z0-ASbppASuT4FCf]=+D,P.Ci=N3DJ()#FEDP;@Wcd(F"Rn/
%16$JD/!g#@<*J5FDi9MB4Z0rCh7^"G]YAWAU%]rE-*4EBOQ!*FD,5.AU&<;@:OCjA0<":AU&;>
@ps6a$>+3mCi=M?+CTA6EbT!*FCfM9+E(j7+<Yc>AKW+/ART*l+EV%)/g)9&F)uJ@ATJt:+Du+8
DImm2ARl5WASbppASuU2/e&-s$=nEjA3(hU@r,+QB-:huFCf9"@<?U3FCf]=+Cf4iD/9Xg%13OO
+<W%ADf9Z,-Qm&5FCf9"@<?U3FCf]=+=B9]Df9Z,+DbJ.4X)^?/heIlCi=2S+tY`5/het'5%eGK
+EV:2F$)*cDf9Z,4ssuSFCf9"FCf]=.VE=7ASbq"AU&;>FtG9gB4Z0-E-624+D#A#D.RU,+EV1>
F:AQd$;tGWF`MA@+EV:.+EV1>F<G%(FE_;-DBNn@Eb-@ADJpY+FEDP;@Wcd(F"&5LDf..EATMs)
A0?,6C`mh.B6,[7$4R>QH!t5E+<Y-0@r*8N/g+Y?<+0D^B4Z0rCh7^"G]Y'<CfkOj%13OO+<W%L
@;TR'+D58-ASbq"AU&;>-Tl9TD.Pn'DeO#N05b38ANi4e@<?'E6tKk>D.7's+>GQ$+>PW)2`ra(
@<?'E4DnSEANiIiF)Y]24>1S\D.PmY%13                                         ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,9t.+>P&o1E\G21E\Ru1Ggp23?U152eQ]DASbq"AU&<2A9]S:ATVL"ATVL.FD591+Ef=g+DG_(
AU#>+DIal&ATT&6F`M%9ASbppASuT4FCf]=%13OO;IsrmEc,q@Bl7HmG\(q=De:,#DIal"F`\aF
F`M%9ASbppASuT4-uNrG@<?U3Bju4,ATK:CDJsDEDImm2ARlp.D/:>+Ch7HpDKI"CAU&;L%13OO
A9hTo3ZoOnBl$@OGT](1+C].sCfFtjF=A=q/g+Y?<+0D^B4Z0rCh7^"G][Y1GT^L4=D_j`$4R=b
+=CuDDC6Q>ATVL"ATVL.FD591+=B9f@<=[i1bL^H3BSs2@<=[qCi=2T/N>aC2`NcN4>1MhDE]EW
$>3plDKTeGB4Z1&F_r7E/M/)TDes6$@rri-DK'`?+Dbb0ATJu&F!,@CD.7'sF"Rn/%16'JBlbD,
Ch7d$EZfO:EagRB+EV%-ASrW&Ec5e;FD,5.6Z6[VF!,")D/UsJ+Ceht+<Y-)+E_a:A0>u4%16T`
Ci!ZmF<GIDD.Ra%@j#K'E-67FDg#]4+DkP)Gp$g=E-67FCh[cuF"Rn/%16rjDII':+DGp?4Y@ji
ATVg4D'3tD8S;pZEb,[e+<VdL+<Ve@C`kkn+D58-DKTe=F`g8gDJsQ,%13OO%144#B4Z1&F_r6T
%14jH+>aN70b"IKC,d=nAN(_f%14Nn$4R=b+D58-DKTe=-RT?11*A@^$8`k_%15$Q+>Ye_$7QDk
%144#-td+5DKTe=0I\+r3Zoh`ATVg4D'12R.1HV>+>XH6.1HV>+>XH6.1HUn$4R>UBleB7B6%Et
.VNO;FDkf4@;R,0F"Jsd+D#.sBk(jgDKK]?+<Y04D/aW>ATJt:EbT0"F<D]EE+No0+DG_8ATDs&
C^g_UG\J^RBe(ne+D>J1FDkf4@;U'<%13OO<+oue+<Yi=Eag.6-tII3+<YcE+<XR#B4Z*++@pWh
.3KaCDf'H9FCfM9+D>J1FDkf4@;U'<+<XWsAISu\DKKH1G%#3.+CT;%+ED1/BQPA8E+No>+B)i_
+=Lo;F*)>5Ea`f?.3N5@EZf10Aoo/6E+No0.!TGW%17>o.kt<PBl8$(Ectl-F"Rn/%15gJEb-A(
ATV?pCi^_/@;[2sAKYT'F`(_4Df-\>BOr;Y+BN8mBcpi+3XlE*$>=O'E&oX*GB\6`C3+<*FE_/6
AM.J2D(fXJBkqE97<<NYH#kW0BleB7B6%Et%13OOBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]F
CM>FgEbSs";e'KZFEB0,BleB7B6%Et5A4bDBP_BqBQQB`1,rr]F*)>5Ea`f?,r.Ii$4R>ZDf/uo
3Zr-Q6Z.!e+?_>"Bl$@YFCfK9@;L!-BPDO0DeF*!D'3_46t(1G%13OO+<W'e0H_hfBeCM_0I\,X
BleB7B6%Et+?qS70JG1*0eb9j$4R=O$4R=                                        ~>
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
1Gp:4+>P'!+>GQ.3$:4(2_[052]sk83$9q1+>Pi3+?1K(3A>PnC3=?,@;[Q:DeaE2Bjkm%FtG9g
+ED%8F`MA@+EV:.+A-cmBjkm%+Cno++<YQED.7's+EV:*F<G%(B5)7)+CT@!DJsH2+E(j7FD,5.
@ps1bDId0r+Cno&AM+;s:iCDsBm+&1H"CE)+EM70DJ<]sATJt[/jq<C+<YQ5B45mrG%Dd_/jh66
<+ohcH"CE)+<Y*)FCfJ80a^6"6S9L*@<3PG+@.VJ/d_qbBPDN1@;KRpEbTW/D'0sF@<3P6@:Wec
FCeu*Ao_g,+<Yc>AKW*_+<Y9=DI[d&Df-[?-u*m@A79a4$?L;tEcc#5B-8=8DBL'@@:s-o+>GSn
De:+7:3CDbEbT#lC`jiuARfFnATJt:Bl5%96S'?&;e9HWDIa)CA8-."Df.07$<LYVDJ=!$3ZrNX
BlbD?ATD6&A8c%#+Du+>+E2@>A9DBn+CT.1@<6O2Df0K1Bk(RfCj@.5DfTl0@rr&uATN!1F=n\8
BOr;YF_kc#DBNIuGp$gB+E(k(F(KG9.kiS5+D,Y4D'3q6AKYK$EcP`$F<GU8F*2;@$>+3s+CQC*
Bm+'*+Cno&AM,)J<+oue+DkP&ATJu9BPDN1G%G]'+Dl%;AKZ,:AS-($+D,P4+Cf,/Bl",d@;KLm
A79L$@ps1`F_kK.Bl@m1+<YlABl%?'+=LuICh@]t@;IA8BlbC>@V'Y'ATAo7F_Pr/A0>u4$=S!t
Ec5i6D/!KgC`m4rCh%U(@<?4%DK@E;$>j^!@:VDA+DGXaF_kc#DBM(p+EVO:F_kc#DBNY8=]nm1
9he#D$47mu:-pQU1E^1GCisT4+EV%$Ch4`-EZd.\Blmp'+Dbb5F:'-5FDko:Ch[<q+>Gl61E\V!
1*@\^+<VdL+<VdL+<XEG/g*c/Ch[<q+Cno++E(j7D0[75Bl\</A79`j+<WEr1b^U;0H`M$FDko:
Ch[<q+>Gl73$:($1,C$q:-pQU9jr;i1,CI(0f_-O$47mu:-pQU8p+ra@;[2u@<iu5F_tT!EcW@A
AftMuC`lJaG9C%"@<-E3Bl5%J1j!CR@qBP"F`Ma7+<YcEC3=?,@;[290f(L;+=eQW5!!C1+>GQ(
.3L/c0H`(m>9GXC0a\7uH!t5E+<YB78p+ra@;[2N/g+k::Ms_dFDko:Ch[<q+DGXp=]nm%9ghAV
$6UHG+EVO:F_kc#DBLYo3&WHM0f1"-3B8fJ1,1d3+<XEG/g*\rCh7K3F!+n/A0=KQ@rGg(F!+q+
Ecbu*@<lo$$6UHd67sBQ@;[2B/0HZ$0JFV9/jh6B+>PW)0H`\76S'?90JG1'67tV4+<WB]FDko:
Ch[<q+>"]j0JG170eb=)1,(C90JP79+>Y]*0JG480a`&5E+X-.@rc*0F^oB&Ec,B-A0?%I/Kf1R
Bk)'lAKYK$A7Zm&DeX*2F!,(8Df$Ul6W,%;ARfFk@;I&rBOPpi@ru:&$>"*bDe*R"B.aMu<+oue
+<Yi=Eag/$Df0`0Ecc@FF*)G:DJ+#5+E(j7+E_R9@rGmh+<XEH;BTL]@qfdgC`m;,@rGmhA-ug[
@<,ddFCfK6+EVNEF`(o'De*E%@rGmh+<YWABl8$6/g+,,AKX`8;BTL]@qfdgC`m>.Ec#6,+DGm(
F*2G@DfTr2A0<"(Gp$s4DL!?I@WHC2F(KB5+<Y*1A0<"/F!+m6+D>2$A9f:?2]s5PBlkI?5uU-B
8IBKLE,oN2ASuTuFD5Z2+E(j7F`(o'De*E%@q]:k@:OCjEcWi?$:,ePF_tT!EZcKCAfu5<Bl%L*
Gp%'HDeF*!D0$gBCh[Zr+@9LGASb(LE%Y^HAKYr4De+!#AKZ).BlaW%AT2[$F(K62@<?4%DCu8'
G%G]'@<?4#3XQ3:+<Y?>FDs8o06_Va/n/6uAScF0Df0,=@rEuBCG/V)Aor6*Eb-mj@:Eea9jqun
BQS*-$4:WgDII':+<YB7+?_>"F^oB&Ec,B-A0>Au:1J;O$6UHd67sBtBm:b=Afu56Bk)'lAKYJr
@<,ddFCfK6+CT=6:.%o%A7]7bD..5f+<Yf:4Y@j)-6k9*2`3KT-6k9*2`NfZ-6k9*3&EHR-6k9*
2`ENS-6k<&1H%<A,;V,71-6g-1G^pK4!l1.1H%-Q-6k<'1Gq6A$47mu@rOR`+E_15Ao_d!Eb$;8
@iumh67sBjDf0`0Ec`FGD]iP.A7Zm&DeX*2Es`6]+<XEG/g,:YAiLoRAT2[$F(K62@<?4%DBO"3
ANCrVFCmLEEc,B-A-sG%3$<?)+>b3`3ZqpO$4:ugASYgbGq+#LASYgbGp%8^/KeS4Gp%$;+EqC.
CG#r$;IsrmEc,q@+EqC.CLgk!+D,Y4D'0s3@<?''GA(Q.AKW+(EbBN3ASuU2+CT;%+EV:.+<Y`6
D.OhuEsa=;De*:%DJpsV+@^BiD'2FnF*(i.A79Lh+Dbb$Eaa!6+=Lc/FCfMB/d_r/ATD6gFD5SQ
+>>rWF`(_uGq:'m4\]j4A79a7+<W9h/hA+f2EauIFEMV7@<i1e+<VeNAS#Xf@<itM3B9#@2'=Y1
$8i/5+<WB]G@b?$A79a+0f_6Q0JtUA$8i.t+<VdTG@b?$A79a+0f_*I+?(Du.3Ns[?S`g1>TbD8
F`)&7DKL#4G@b<,BQ[p-Bld^)-OL1f$?p&mCNF3-H"CE).X,H8CNF3-H"CE)+Ef=g+EqC.CNCV4
DBO49@<*t0$4R>6DBO%7AKXQC:EUc>2D?j.@ps1bDId0r+CQB8G@b?$+<Y`I@<-I2+<YT?+Dl%7
A79a9+<X-oDf$Uh%16oc@WGmtGp"MG@<?(%.4u&:%178iEaiI!Bl,m?$4R=b+EqC.CNF3-H"CE)
4ZX]?1E\_$-T*Y0+=f&t+u(3E+>c6*AS#Xf@<j7U+>GE.0esk-0e"Xt0H`)'INWn`%13OO+<VdL
G@b?$F(oN;ARTU%1,(C9+=eRK/ho$h$6UHK1*AG0+>kns2)6:31E\P1+>kns2)6:31*AG1%13OO
GB.D>ATVH<.X,oIFCfQ)1*C`l/Kf7XBlmp-+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATKI5$4R>A
BPDN1G%G]'/0K(QCh[Zr+=MGSBlmp.A19&P+DG_7F`M&7+Eqj?FED)3+D,>(AKW+3Bl7L'+CT;%
%172gEc#N.@<?'k+<YlBFD)dj7Nc2S@<,ddFCfK6/g)8bGB.D>ATVH<.3KaACiaM;+CSbiAT2a4
+<Y)%$>a-kB4Z*+A8c<nBl5&3AfrLH.3KaAEcPT6F"SS,F<GdACht5<EbTW,+CT/5+<YTAASrW.
F_t]1Bk%SZFCAWpAKYE&+<Y)8<'`hnA7]RkD/"*'A0>JuCh54A+A$YtGA1l0+CT)-D]j">DfB9.
Cj@.:@;]UlAISuG5sc]+Eb/f)@q]:k@:OCjEZfI4@VfUs+CT=6<'`hnA7]RkD/"*'A0>u&@VfUs
/e&-s$?g!$@UX@mD)r+5%144#:-pQUAU&01Bk(k!+Co%qBl7X,Bl@ku$6UI8EbTW,FC[-i3Zoh*
1E\_$-R`SDFED%9GUXbZEbTW,+F,=`+D*58$4R=b+AP6U+C]G&C`mh.@VfUs%144#F>,j1+>GPm
2^CIG-Z3jE+C]U=FD,5.BOPUq+E(j7D0[76BPD@%Gp$U1Bl5&'BPD?3%144#F>+h]EbTW,FC[-L
-Y#1jFCf<.06Am#FEhmT%13OO+<XEG/g+VF+EqL1Eb-A'ASc1(+DkP4+C\n)DKTf-EbT"m$6UI5
0g.-32]sn%-Xq"4-Ta1I-T*b/%144#F>4n^EbTW,FC[-L-Y#1jFCf<.06Ap$FEhmT%13OO+<XEG
/g,%R+E)41DBNh>D.Ra%@j#u0FD)e,Df'H0AU#>8F_tT!EcVZs+<Yb]4Y@j'3ZpF*0f'pt+C@&d
+?2>'3Ft/Z$6UI51*Cd]Blmp.A258T@lc8bASlB>F>>IjG]Y;B$4R=b+AP6U+CfL9DfB9*+Cf(n
Ea`I"ATAo;Bln$,F`\a*5sc](BOPpi@ru:&Et&I!+ETD&/g)l*+?1VoBcpr)+EqL-F<G9?A8`h)
$6UI51E^m^Blmp.A258T@lc8bASlB>F>GOkG]Y;B$4R=b+AP6U+EMWIDfB9*+EMgF@W-'*FCAWp
AISth+ETG'/g)l)+>kDeF#kEk+CQC6H#7#/Ch[B%B4Z.+F`M%@%144#F>P+aEbTW,FC[-L-Y#1j
FCf<.06B$'FEhmT%13OO%13OO%13OO%13OO%13OO%13OO%13                          ~>
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
3&2U:+>Y,p1E\Fq0f:p50esk,+>bc0+>GPm1*A;10d&:q1*AJ21E\V!1*A;13A;R10d&4o0ebO/
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
ARfh#Ed8*$:-pQU0f3cdFtbcrEb0*+G%Ddg+Eh=:F(oQ1+D,Y4D'3e+FD,_)$;No?+>G`pAT0@`
+CSek+Dk\/+EVNEE,oZ9@<?''A9Da.Et&Hc$=e!aCghC++<YcCE,9H&?U6tDFE1f2BK8(5?Q_Km
-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;
67sBt@;0U%Ec5l<+E(j7E,oZ0@<-W9C2[W*C3=B4F!(o!6rcrX:dJ&O4ZX]505>E905>E9A9Da.
F"\mM$4R>;67sC$Df9_?De:,2EbT]*FCcS*F_u)=%15L'9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4
A9Da.F"\mM$4R>;67sC"EbT]*FCcS*F_u(?Anc'mF!*%W@s)j7Df'37AKYf'F*%iu:f:=^<D?:g
4ZX]I3[\EHBHUo-@;]jsBl5&1G@b8o+Dtb4D0KQ$@j#Z#FEM\>Ci^_9AT0"+$4R>;67sC$ATW'8
DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><@rH4$@;]Us+CT=6FCf]=+EMXFBl7Pm$>=@!F?MZh3Zp1$
3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H%13OO:-pQUD..3k+CQC'Bl[cpFDl2F+=JreF*1u&
ATMoD+>=pM@;0P#Eb-[/$>j3eARoLq4ZY;@3]/$@3\WT($4R>;67sBsBleA=@;]Tu@r-()AISub
Df7d"+FPjbA8,Qs0F\@F+E(d5-RT?1%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,(OASrW!
DIal#F_u(?Df-[o;FsSK;HXG9De*?@3Zp7%3Zp*c$?'GtGmt*P8lIl*Gq:<qBkh]:%13OO-Y.@:
E$/\6D/aH7FsfF*+F">&%15is/g+\ID/^V:EbT]*FCcS*Bk)7!Df0!(Bk;?.Bl5&%Cij6/DIIWu
+Co2,ARfh#Ed8*$BkAt?-p2c(+D!/J:f:=^<D?:g+CoCC+CoV3E'5frA9Da.E,p+EASu$2%13OO
:-pQU@rc-hFCcS6EbTB!Ed8d<F_u(?A8-'q@ruX0Gp$g5+Dtb%A7]9\$>F*)+A#%(8PUC=D_<//
;FsSK;HZ.D+=CY[-S/eND/^V/Cia/?+Abs-9gMZ[4ZX]69L^-V/q+pVDf^"C-Y6e$D]g;r:JF8*
.4f"PD/^V/DIb@/$?1$"D..I14Y@jR;FsSK;HYPB8lHj:+DkP&ARoLq+?WIu8PMKK=Ub]I$;No?
+CoV3E$/k4+Co1rFD5Z2@<-W9A9Da.+Co2,ARfh#Ed8*$BkAt?@UWef@p`YZDe*2tF(fK9E+*g/
+EBUt+DkP&AKW?J+CoCC0H`%p0HbCIFEMVA/g+_CA1e;u%15is/g,1G@:UL!F`_SFF<GL6+E2@4
G%kl;F!+n/A0>E*D/^V9DBNn=Bl.:!Gmt+&Ed98H$6UI%F_u(\/g)Ps+Z_>,+F?.i%144#A9Da.
+=Jrf3\i-,F(fK9E+*g/+?XU`Bl.:!Gmt*j@<?!mA1e;u+<Y`=Dg-//F)rHOF`(VsCh4`2D]j7E
Blmo/A9Da.F!*%u+=B6iEbTB!Ed9`fH#@,*%16ZaA1e;u%17+u>9G^EDe'u9%14d30I/=]$7QDk
%15is/g+\ID/^V<AT)O!DBNG*ARTJ!E"*.&6rcrX:dJ&O4%*(C:f(%j:dJ&O.3NP>@j!rhHZ*h@
%17#a+E)1:%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?H6
A7]7hDKB`4AMPu867sa$Bk1dbDf0W7Ch4`1/M/)YBk1ctC1D1"F)Pl++E)-?GA1r*Dg-7F/KedN
2_?_.+CT.u+C\o-Df0)<%14L3?!qDgBQ&*)Df0W7Ch6sg?R\5m8OccQ:+7;>%16idDeC1H%16fK
Ea`j,An?!<20<kIDKBE$EZfI8G]Y'?Bl%?'Ao_g,+Co&)CNOK6+EVNEBi&5K3XlE=Ci<`m+=DV[
ASlB>C32(BC3(a3$6X(lFECr$BHSZT/hS8YBl%?'FDi:=Dg#\7FDi:9:gmlW/hSb(%145!ASu$$
ASkjiC`mh<+F.mJEcYf.Afu;3FD)e*FECr$BPh<uF<H$SASlB>C124+@:Nt'BQS*-%13OO+ED%%
A0>H#@;0O#Df-\3:gmlD$6XG!E$/n(FECr$BJ*t?D/:=H+EM47G9C=9FCAZmD.RU,+DG^9@WHC2
F(KA$$6XG!E$076G][A7ARQ](+<VdY+EM47G9C[4H"(]#Eb$;$DIal$DKKH1+D#(tF<GF=A7Z2W
+EVOE@q[H-Derr9Eb0&u@<6!&FCf]=@<,pf%145"@;m>fASbpfF<EkcC^g^oFCB,26Z6ph%13OO
+EMa@FCSu,FDi9o%144m@q'OuAfrIC/no'A-Ql/N/g+Y?BlIO"@<,m$FDi:6Bl%>i$4R>aEa`j,
An?!*FCf]=+D,>(AKYT*Df$V2:gmlWFDi:4ATMX/Df@`H$6X(p+=Aco/hSb!F(96)E-*H:$6XG/
F^o):BQ%]t/TPE=ARTXk%145"@;m>fASbpfF<EkcC^g^oFCB,26Z6ph%145!ASu$$ASkjiC`mq9
FD)e9@<6O%A0>B#DKKH-FE7lu+ED%%A0>H#@;0O#Df-\.ATMX/Df?-m+Du+<D..6'D.Rg&De*o3
FDi:3DfBtTE+*g0AKYMlFC?;6D]iY+Ch4%_%16-IEag/+F<G(6ART[lF!+m6F(oN)Ch4`2AU&;>
Anc'm+D,Y4D'370AoDKrATAnAF(oK*Cgh?,FDi:D@<*eL%144mF<DqY+AP6U+DQ!@BOu"!%144m
F<Dr@-T`])FCf<.06Ag]F=0-tIUQbtDf0VLD..O"-T`\mBldc3+AP6U+CfG'@<?''F=q<M+EqOA
BHU_oA8c@,%16T`DKKH-FE7lu+DP>,FCAZm+=DUkF=q<M-OgCl$6UI5Ea`j,An?!*F(oN)Ch4`$
Bl%?'FDi:9:dIJY$4R=b+DPCqFDkb6-ZgtUF=.M)+<YE@+=DC]4"#,&C31gb-[oK7A8c@,05Y->
BI=5r%15C=+DG_8ATD@'FD5W*+CT).ATDZsFD5o0+EVNEASkjiC`mG5+Er$R/n\a;BQ%j/ATBD5
Df%*9$:JoCB-:f#Ch7Z1FDi:IDfp(CBQ%j/ATAo%DIal3BOu'(B4Z0-FD,6&+D,Y4D'3M1E,]B/
+E)-?H#IhG+DFY\A1e;uF(96)E--/CF^d*\:-pQ_F(96)E--/CF^cJ8/M/)d@rc:&F<GXHF^cs4
$;No?+:SZQ67sB[BPDN1BlbD*DBNM8@;Tt"AKYo'+A,Et+EM%5BlJ/:BOtU_ATAo(De!p,ASuTu
FD5Z2+DG^&$;No?+EV:.+EM76E,9).AoD^,+EM[EE,Tc=ARlomGp%3BAKXT@6m-PrF*(u1/g(T1
:-pQB$;No?+B38%F(Jo*BQ&);8l%htAoD^,@<?Q5FD,B0+EV1>F<G16Ci"$6+DG_7FE2M6FD5Z2
F!+q'Ci=MM%15is/g(T1:-pQU+B38%F`V+:FD,B0+EM%5BlJ/:A8_na:-pQU+<VdLFD,5.AoDL%
Dg,o5B0$J/:-pQB$;No?+Eh=:@UX@mD)r+5:-pQU%15is/g)8Z1a$@?+=D5?EbTK7F*)P6-QjNS
:-pQUAn?'oBHVA<F^cJ-DKKe>ARoLs+EqO;A8cZ$$;No?+<VeRARoLs+EMXI@XT@A%15is/e&._
67sB'+>b3[F`\`RD.-ppD^RV%0fs#i-Z`d<BlJ08FEM%?+<XEG/g,4DG%De)F!,=.@rcK1%15is
/g)8Z1a$a[F<GFB+=D5?EbTK7F*)P6-QjNS+<VdL+<VdL+AP6U+ED%8@;0V#+DtV)AISuA67sB'
+>G!XF`\`RFCfN8-Tbs_-Z`d<BlJ08FEM%?+<VdL+<XEG/g,4DG%De)F!,R9F*%iu:-pQU+<V+#
:-pQB$;No?+=fJq1,(C@A7]7)2'=J&+CfG'@<?'k%15is/g)W)+>PW)3,N)E0f:(*/KcHOBOPdk
ARn"SF(fK9@rH7+Deru?0ht%f.W]9AG@PQ/F)Pl++EK+d+EM47G9CX1Df0W7Ch4`-DBO.;DId[0
F!*%WC*5Ge0R+^KDIal!AU/33A1e;u-n&A/C3+',G@PQ/F)Pl+?YWps5V>Vt=%Q.9+>F<4    ~>
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
zz=:zz,'''),(<<;._1 '' grpclassutils CLASSAUTHOR LF alltrim changestr ctl fgr'
zz=:zz,' fuserows ifc ngc quote timestamp''),(<<;._1 '' htmthorn IFACEWORDSht'
zz=:zz,'mthorn ROOTWORDShtmthorn''),(<<;._1 '' odbcREF ddcheck ddcnm ddcol dd'
zz=:zz,'con dddis dderr ddfch ddfet ddsel ddsql ddsrc ddtblx''),(<<;._1 '' re'
zz=:zz,'mdots alltrim read remdotargs write''),(<<;._1 '' rwtabd readtd write'
zz=:zz,'td''),(<<;._1 '' socketsREF sdcheck sdclose sdconnect sdgethostbyname'
zz=:zz,' sdrecv sdsend sdsocket''),(<<;._1 '' sunmoon IFACEWORDSsunmoon NORIS'
zz=:zz,'ESET ROOTWORDSsunmoon arctan calmoons cos fromjulian moons round si'
zz=:zz,'n sunriseset0 sunriseset1 tabit tan today yeardates''),(<<;._1 '' tri'
zz=:zz,'g arccos arccosh arcsin arcsinh arctan arctanh cos cosd cosh dfr pi'
zz=:zz,' rfd sin sind sinh tan tand tanh''),(<<;._1 '' unicode ucpfrncrd ucpf'
zz=:zz,'rutf8 utf8frncrd''),(<<;._1 '' wordformation wfl''),<<;._1 '' xmlutils '
zz=:zz,'afterstr alltrim atags attrvalue beforestr belongstrs betweenidx be'
zz=:zz,'tweenstrs eletags getele geteleattr geteleattrtext geteletext getel'
zz=:zz,'etextidx read splitstrs tags write''                                '
zz=:1509{.zz
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
0eb:(0fU:2+>t>t0H`:s1,0n0+>Gbs0ea_+2'=V1+>l&"3$:"4+>G\q1bp1.1E\P6+?1K#2BXq$
1H?R:+>bhr2BXh1+>GPm1c6C7+>Pes1a"S0+?(Dt2]sh2+>bqu3$:%9@UX=h2Deu_@rGmh04\X(
De*E%@UX=h2Del]G].P4DIRO/ATJto<(8hiAnc'm+DtV)ATM=%FCB94@UX=l@j#i7@<?4)FD56+
@WcC$A9E!.Ci`3E6n_.TF(96)E-*43F_PZ&+E2@>@qB_&Bl7Q+GAhM4F(Aj+BPDR"C3*m*BlJ0<
DfTB0+D,P4+ED%1Dg#i4B-;D3Blmo/F)YPtAKYJr@<,ddFCfK6+D,Y4D'3R9F(96)E--/3Ci"69
Bl%j$Cht5(@;Ka5D.RR&Ed8dE@;]LdASl!rF<G^JBl%j%@<-I'A8-+,@;]RdF(9-*E-686F!,"-
F*(i.@qB^(@V'Y*AS#a%E,TH.FE8RCDBNM!Ecbu-Ec>N)@<6L4FD5Q4@r,RpF!,+9Dfp"AF`_>6
Bln'#F!,RME+rfjCi"A>Ci<`mARlotDKKe>-u!F7A18X;De!3lAS?1&FD,T5DJC;&EcPT6+D,P4
D..O.Bl7Q+.!0-@Ec*<KFD,*)+D58'ATD4$ATJtb<)$&)A7B%H77M</An?!oDI[7!+EVNE:IIN:
+EqaEA9/kF+ED%5F_Pl-+=C]1-ZWd8A8cR2Eb03+@:NjkA8cR3ARlolEbBN3ASuU2+DG^98g%\i
E,95uF<G(3A7]e*FCAWhEb/Zi+CT.u+Eqj?FCcRo5sc])ASc'tBlmos+EV1>F<G[6@VfUsF)PQ(
ATVuk77M</An?!oDI[7!+EVNEF)PQ(ATT&=DfTB0+>"^VAT;j,Eb-@@F)PQ(ATT;@F`)&7Df0W=
DBNA*A0>`-Df-\-@;KFrCghF"Df0W<EbT0-FCB&t@<,m$FE2).Df0K1ATVs,@j#B+DI[d&Df0W=
DJ<U!A7]n$Bk)'lAKZ,;Bl%L*Bk;@0DfTB#DfT]'FD5Z2GAhM4+D,P4D..O#Df-\9DBNb0DIml3
/KeMCDg-86+D5_5F`8I:ART+\Ed2G;F`_>6F)c>:@r!2qDIal#Bl\<@+F%a>+E1b0F(oN)+=84M
Ec5H!F)u&5B-;D:Eb'4                                                       ~>
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
@;KauD..L$+CT)&Dfg#6D'38'Cij]3D'38'Cj0Q,FCfQ7Bl+u$D/XH:+CT/0Bl.d!AKYE#E+Not
+CT5.Cj@.3EarTtF!+n3@q0FuBHU`(@rl@%+CT;#F(oN*+CT;#FCB&0@<,k"@;]a$@<6L$Ec`F4
FCAg'+CTA1D.[g)+CTA6Ectl-F_)\)@qK6o@V'.iEb0&qF*)JFEZeh&AoD^$F*)FF@V'@oDJ+$4
EcW@4ATD[,F_kl.+C\o(G@b?'Bk2H2@V'Y*AS#anA9]jP@V'Y*AS#b#FE2FF@V'Y*AS#b#FE2FX
+C\qn+C]/&@:jU(@Vog%@W-L0E+No0@W-L9DfB9*+C]V-+C]V<AR]@qF!+t$Ch7Kp@<*K#@;Ke!
Df0V=@psD"Ao_j/Cgh?,@q6]lA7]d(@q9.kGT^L,AftSqE$/Y(@;]^hDK0b@@q]:gB4Z.+EZek*
@;]^hFDkq;@q]:kF*1q7@qg$rD/"<-+Cf>2+Cf>2A0>B#F(c\+Eap5%FDN(0F`_M4F*),,GT^L=
FE;PEBk2H2A79RkAo_U'F<G+&FCf')DKTe=A79alB4W2r@<ld'G@b?$+CnqtEHQ2AAKYMmEHQ2A
AKYMo@q]F`CER.u@r?-+A7T1gC`m8!@rH6-A7T4bF!,"(ATDf6A7T:^BHUhrAn?',A7T:mA8QB1
A7TamC`m8!F)c"=A7Tb%@j#;mFCK'2+Co%mDf$V-ARfXqD'3A#Fs(=,GA(]4ASQ9rEbTK7+Co(n
+Co(n@j#;oBHUhtEZen,F(96%FCfK$DId[&+Co>1Ao_Em+CoD,Cgh@*0f^sE+CoD,Cgh@*0f_0H
+CoP8@<<W&FE;8,F(c\,F`;2+F))n0@:NsnARTV$BOkguF<G.'F*(u6+D#A#FCAg'+D#D/FEo!?
D/aTBF(fK9+D#G1F`2A5+D#M5Ao_j3+D#S%F(HJ*EcQ)=+D,%lFDl2@+D,&$E+Not+D,)$G]$r,
AKYSp+D,+s+D,2*@<6!&An?',An?4$F*&O:B6#,,Bl\9:Df0,/Anc:,FDl&.F!,(/EcZ>@DImlE
+D,J4F*D2?+D,J4FCZM+Ddji$Eb055Ao_I&A8-+,+D,Y*EGT?1F<G19Df&p(@qfX:2'?LODf&rl
F(I6d+D,Y4D/+30Bjkm%Aoh[4AKYT-F(KB1GB4m=GB.D>AKYVsDf'&oDBNS'FCf9"+D58-ASbpd
FEDOGB4Z0rCh7$sFE2J7G]Y'@ATVL"ATVL.F<G4-FCf9"FCf]=Bk2H2B4Z1&F_r76F)Z">BOPpu
ARTI!BP(ctBP(d1+D>J1FDkf4@;R-#BleB7B6%Et1*C7IF(TH'A9/l,Df^"CBQ\59Bk&9"An)rt
DKKH1F(Jj'+DG_8Ao_EjFCcS/F('0/D'3P6@W-L&A0>T-@q]:k+DGn,Df'H0AU#>3F(T6,@<<W+
F(oN6+DGn7@;[3%F)Q#/DBNY7Dff]1ATMs%D/^V3F*2A7@rGmh+DGn>DJ=*5AKY_tEZf+9@<?1(
AT/c,FE;8,F(c\2F_kZ1@ps0rC3=T>A9)i9C3=T>A9)j4@<?0*C3=T>AU&;>C3=T>Anc'm+DQ%?
FCo6'AS$+.+DQ%?FDtZ1BHV&5DBN\;EZf.?Ecc5@BlbD5@<6O/DIjr,@<6O/DIml3Ch7$o+DbY/
+Dbe(EcN:=C3=T>+Dc+2BlkJ6FE2)4+Dc1B+DkXHAo_g,F*)G:DJ()/ARTI!D.R6l@;[3)ASkiu
D.RQr+Dk\,EZf41D0I+>Bk21)+Dl%-AMPBFDf0Z1A79RkF!,=<DKKQ5@V'Y*AS#a%D/X?1F!,=<
G%YZ'@;[3)Dg#u/@;[3*@j#Z#G]\+?EcYr5DBNh0@j#Z*Ao_p.AKYl,Ao_p.AMPBGDdji-DImWq
DJ+')+E).0Eb06$BleA=E+*6l+E1b0BlnVCE+*d.ARfe)+E1b0F(KH(+E1b0F(KN5CisT+F!,F1
FDtZ/FE;PE+E1q&+E1q/+E2$;E+rft+E2%6ARfC^EcW@BDes]<Ec5J2E,Tc=@q]:kF!,F?F*),<
+E2O:+E9+YEAJ_WF`2A5+ECn.A9Dd(Afu,*@:UL$ART+ZF*8[HART+ZF*;UIEb/ZiDJsZ8+ED%%
A9;?)Eb/ZiFC[-LEb/ZiFC[.J+ED%%A9;?kDf$V;ART+kA9/l6ART+mFCZM7ARTCo@<-H4Eb/]&
Eb/]i+ED%&Ec6.EEb/^%@Uj=m+ED%&FWb^9Anc:,FDl&.+ED%1A8cQuEbBG9Eb065DffQ$+ED()
+ED(1BlG28C3=T>+ED:0Ao_d*+EDCCDIal1FE2)4+EDUBCh7KsFD,_<F(AcoARfKuF(AcsDf]J4
F(Ad!DJj#qF<GX8B4Z0uDf^#0H#@&-AKZ&)Eb/a(+EM(7ASu$$F(B?1@r#Xt+EM47Ecc,9DJ*iq
D.Rc2F(fK9E+*g/+EM77+EM77A0>r-DJ1/6CLq^-ATMo8F)>i<FDuAE+EMI1+EML<BlnE<EcW@E
F(Aj*+EMU?@<6*)F*(r'ATf2;FCfE4+EM[CEbTT+F(KGI+EM[CEbTT+F(KGJ+EMgFEb/ZiFCZM9
@:Eqm+EV%)F!,R5DBO%0DIal3@;]a$FCB,2FCB-)+EV+(Afu2,G][P9Ec!QSFD5T'F*(i-E$07=
Afu24F!,RC6W-TI+EVNm:K(48FDjboFDkT/@qfX:2'@!Z@UX=h2DcOuDe*9uAKZ)5A79a+FDk\u
H#@OCFDko:Ch[<q+EVO<Dg,c5+EVOEE,]B/+EVX4DI[L$F(HJ9Ea`iqCi=B+1*C[ZAS#q*D'3q@
F`_:>FE8RHF(TH8DJ=?:ARfd(FE;8,F(c\<F)59+BJL]PF)ki2+EV[H@;Ts+F^oB&Ec,B-A0?#)
E+X-5FCmKTF`(o<F(Jj&Ao`!7+E_R@@:O'qF`V#&EbT].+E_d<3$<?cAiOCCDI[]t+Eh10A79Rk
+Eh16+Eh[>F_t]2+Eq?=G@b?$A79a+G@b?$DKTf*ATAo;AS#XpF_tT!E\\b]AS#Xu@V'Y*AS#a%
G@b?$F(oN;ARTU%G@kY6GA1r2@q01\EcW@IBl7luFD,`,E$0@F@;pF/Eb'56GB.D>AKZ2;Blmp(
Dfoq?GB.D>ATVH*GB.D>ATVH<+F.O,Eb&U#ATJu>H$O[PDf0)r-RgSp4?P\X?SNZN+CfP9DImm2
Bk2HB0d(=ACLpjhDdd0`F(96)E--.DE,Tf>F*)P6+EV19FE;PH@N]c(F*)JFF^d^S@<6K[Ec6)>
+EV19FE;PH@SC]XB1-ZJ+EV19FE;PH@T.AWDId0rA1&fW-p0UR/mg=U-Qll,F(I6d+C]86DfB9*
+C]D6@<?Q5@WcC$A9E!.Ci^_0ATqg%FCf3.@rc:&F<G+1Cisi6Ci^_1@<-I'A8-+,@;]RdF!,+9
E+<]mF)uJGBl%i5BQS*5BQ%p/+E(e"@o>`b+ED%1A8cR2+ED[J@:EaiF)PQ(ATVuk77JD@F`)&7
Df-\>EbT//F`(o'De*E%GAhM4AoD^,@<?4%DBO1@Cisi6Ci^sQ/1<V7,VUYu-p0UR/mg=U-Ql5]
;cI+;FDZ,5DfT_<:et"h?ZU@-D/X?1+Abj4<*s`\DfT_<A8,t'+CoV3E,]rA+D>J"ARfXrF)Pl+
+DFeq@;^-uATAo7@rc:&FE;PH@N]`*Dg,]0DKB`4ALAoX-p0:>2BXb#1,(F?0K([C/iP[F1bgmH
3ADX5+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2E!QM+>P&p0JGF?0etO;2)mTV
2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1,LUB
2Dd6F2`*6J+>Y,q0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgmH3ADX4+>PW)2_d$B
1G1OE3B8uT1,h*62]sk00f:[>0et@>3Ar`P0fLsM+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?
0K([C/iP[F1bgpG0fL41+>PW)2_d$B1G1OE3B8uT1,h*62BXb/0f:XC1,LUB2Dd6F2`*6J+>Y,q
0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*6
1*A>+0f:XC1,LUB2Dd6F2`*6J+>P&p0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG
0fL40+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`*6J+>P&p0JGF?0etO;2)mTV
2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB
2Dd6F2`*6J+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C/iP[F1bgpG0fL40+>PW)2_d$B
1G1OE3B8uT1,h*61*A>+0f:XC1,LUB2Dd6F2`*6J+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?
0K([C/iP[F1bgpG0fL43+>PW)2_d$B1G1OE3B8uT1,h*61a"P-0f:XC1,LUB2Dd6F2`<?H+>Fuo
0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K([C/iP[F1bgpI0Jjn,+>PW)2_d$B1G1OE3B8uT1,h*6
0d&5*0f:XC1,LUB2Dd6F2`<?H+>Y,q0JPF=2DR0C3AEBG1,q!D2]sgt1,(C@0ekF>/i>UK3Ar`M
2`;d7+>PW*2)$pD1bL^F1c-pG2D?s10d&5*0K1^@1,CO?3&ruW2)7*K+>GYp1,(F?0K([C/iP[F
1bgpI0Jjn,+>PW)2_d$B1G1OE3B8uT1,h*61E\G,0f:XC1,LUB2Dd6F2`<?H+>P&p0JGF?0etO;
2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgpI0Jjn/+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC
1,LUB2Dd6F2`<?H+>Y,q0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K([C/iP[F1bgpI0Jjn,2'=Y.
0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E1a"Rs1,(F?0ekC:/i5CB3&iWH0Jst-
+>PW*2)$pD1bL^F1c-pG2D?s11*A>+0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E
1a"Rs1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG2D?s10d&5*0K1^@1,CO?3&ruW
2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E1a"Lq1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F
1c-pG2D?s11*A>+0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fM!E1a"Or1,(C@0ekF>
/i>UK3Ar`M2`;d7+>PW*2)$pD1bL^F1c-pG2D?s10d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=
2DR*A2`<KL0fM!E1a"\!1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pG2D?s10d&5*
0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fM!E1a"Lq1,(C@0ekF>/i>UK3Ar`M2`;d5
+>PW*2)$pD2D.!E2)-jG2E*?50d&5*0f:XC1,LUB2Dd6F2`<?H+>t>t0JGF?0etO;2)mTV2Dm6K
2BX^s1,(F?0K([C/iP[F1bgpL2DH=0+>PW)2_d$B1G1OE3B8uT1,h*63$9t10f:XC1,LUB2Dd6F
2`WcN+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgpL2DH=2+>PW)2_d$B1G1OE
3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`WcN+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K([C
/iP[F1bgpL2DH=/+>PW)2_d$B1G1OE3B8uT1,h*61E\G,0f:XC1,LUB2Dd6F2`WcN+>b2r0JGF?
0etO;2)mTV2Dm6K2BXat1,(F?0eb:9/i5@E0ekI@2BX^s1,(F?0K([C/iP[F1bgpL2DH=/+>PW)
2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1,LUB2Dd6F2`WcN+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu
1,(F?0K([C/iP[F1bgpL2DH=/+>PW*2)$pD3A*9H2DmKM1cI970d&5*0f:XC1GCF@3&EKO2)-jH
+>Fuo0JPF=2DR*A2`<KL0fM*N0d&1n1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD3A*9H2DmKM
1cI970d&5*0f:XC1,LUB2Dd6F2`WcN+>b2r0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F
1bgpL2DH=0+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XD0K(O>2)@'C1G^dA+>Fuo0JPF=2DR*A
2`<KL0fM*N0d&1n1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG3ArT71*A>+0K1^@
1,CO?3&ruW2)7*K+>k8s0JPF=2DR*A2`<KL0fM*N0d&4o1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pD1bL^F1c-pG3ArT72BXb/0K1^@1,CO?3&ruW2)7*K+?1K!0JPF=2DR*A2`<KL0fM*N0d&1n
1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pG3ArT70d&5*0K1^@1,CO?3&ruW2)7*K
+>Fuo0JPF=2DR9F3&3BL3ANKM+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K([C/iP[F1bgpL
2DH=/+>PW)2_d$B1G1OE3B8uT1,h*60f1".0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK
3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A
2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pH0f(^10d&5*0K1^@
1,CO?3&ruW2)7*K+>k8s0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pD1bL^F1c-pH0f(^10d&5*0K1^@1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fUmD2BX^s
1,(C@0ekF>/i>UK3Ar`M2`;d8+>PW*2)$pD1bL^F1c-pH0f(^11*A>+0K1^@1,CO?3&ruW2)7*K
+?1K!0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pD1bL^F1c-pH
0f(^11*A>+0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK
3Ar`M2`;d6+>PW*2)$pD1bL^F1c-pH0f(^11a"P-0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2DR*A
2`<KL0fUmD2BXat1,(C@0ekF>/i>UK3Ar`M2`;d8+>PW*2)$pD1bL^F1c-pH0f(^12'=Y.0K1^@
1,CO?3&ruW2)7*K+>P&p0JPF=2DR*A2`<KL0fUmD2BX^s1,(C@0ekF>/i>UK3Ar`M2`;d7+>PW*
2)$pD1bL^F1c-pH0f(^10d&5*0f:[?0eb4:0f_!E0JYXC+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s
1,(F?0K([C/iP[F1bgsE1H$@1+>PW*2)$pE0J5=E1c73I1bp11+>PW)2_d$B1G1OE3B8uT1,h*6
1*A>+0f:XC1GCF@3&EKO1,La/1*A>+0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`!0F
2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pE0J5=E1c73J0f1g31E\G,0K1^@1,CO?3&ruW
2)7*K+>P&p0JPF=2D[$>3&i`P2_m3F+>Y,q0JGF?0etO;2)mTV2Dm6K2BXq$1,(F?0eb=;/iG^J
2`3TP1c-=0+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1GL^F+>P&p0JGF?0etO;
2)mTV2Dm6K2BXn#1,(F?0K(^@/iYgI2)d<G1cHO5+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC
1GCF@3&EKO1GL^F+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI2)d<G1cHO4+>PW)
2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1GL^F+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s
1,(F?0K(^@/iYgI2)d<G1cHO4+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1GL^F
+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)d<G1cHO3+>PW)2_d$B1G1OE3B8uT
1,h*60d&5*0f:XC1GCF@3&EKO1GL^F+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI
2)d<G1cHO3+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1GL^F+>b2r0JGF?0etO;
2)mTV2Dm6K2BXh!1,(F?0K(^@/iYgI2)d<N2Du[4+>PW)2_d$B1G1OE3B8uT1,h*61E\G,0f:XC
1GCF@3&EKO1H79N+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)d<N2Du[7+>PW)
2_d$B1G1OE3B8uT1,h*61E\G,0f:XC1GCF@3&EKO1H79N+>Fuo0JGF?0etO;2)mTV2Dm6K2BX_1
+>PW*2)$pE0J5=E1c73J3&WZ;0d&5*0K1^@1,CO?3&ruW2)7*K+>Y,q0JPF=2D[$>3&i`P2`!EO
2BXat1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pE0J5=E1c73J3&WZ;1a"P-0K1^@1,CO?3&ruW
2)7*K+>Fuo0JPF=2D[$>3&i`P2`!EO2BXdu1,(C@0ekF>/i>UK3Ar`M2`;d7+>PW*2)$pE0J5=E
1c73J3&WZ;0f:(/0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)d?K0d&7p1,(F?0ekC:
/i5CB3&iWH0Jst-+>PW*2)$pE0J5=E1c73K1bg+.+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC
1GCF@3&EKO1c-p01E\G,0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`*?G+>Fuo0JGF?
0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)d?K0d&1n1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*
2)$pE0J5=E1c73K1bg+.+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO1c-p01*A>+
0K1^@1,CO?3&ruW2)7*K+>Y,q0JPF=2D[$>3&i`P2`*?G+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s
1,(F?0K(^@/iYgI2)d?K0d&@s1,(C@0ekF>/i>UK3Ar`M2`;d6+>PW*2)$pE0J5=E1c73K1bg+-
+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO1c-p00d&5*0K1^@1,CO?3&ruW2)7*K
+>Fuo0JPF=2D[$>3&i`P2`*?G+?(Du0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dBI
1-$I4+>PW)2_d$B1G1OE3B8uT1,h*63$9t10f:XC1GCF@3&EKO2)-jH+>Fuo0JGF?0etO;2)mTV
2Dm6K2BXat1,(F?0K(^@/iYgI2)dBI1-$I6+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@
3&EKO2)-jH+>Fuo0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dBI1-$I3+>PW)2_d$B
1G1OE3B8uT1,h*61E\G,0f:XC1GCF@3&EKO2)-jH+>b2r0JGF?0etO;2)mTV2Dm6K2BXat1,(F?
0eb:9/i5@E0ekI@2BX^s1,(F?0K(^@/iYgI2)dBI1-$I3+>PW)2_d$B1G1OE3B8uT1,h*60d&5*
0f:XC1GCF@3&EKO2)-jH+>Fuo0JGF?0etO;2)mTV2Dm6K2BXdu1,(F?0K(^@/iYgI2)dBI1-$I6
+>PW)2_d$B1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2)-jH+>k8s0JGF?0etO;2)mTV2Dm6K
2BXat1,(F?0K(^@/iYgI2)dBL3B&'9+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XD0K(O>2)@'C
1G^dA+>Fuo0JPF=2D[$>3&i`P2`3EP2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E
1c73L1c[K;1*A>+0K1^@1,CO?3&ruW2)7*K+>k8s0JPF=2D[$>3&i`P2`3EP2]sju1,(C@0ekF>
/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73L1c[K;2BXb/0K1^@1,CO?3&ruW2)7*K+?1K!0JPF=
2D[$>3&i`P2`3EP2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73L1c[K;0d&5*
0K1^@1,CO?3&ruW2)7*K+>Fuo0JPF=2D[$>3&i`P2`3EP2]sgt1,(C@0ekF>/i>UK3Ar`M2`;d6
+>PW*2)$pE0J5=E1c73L1c[K;0d&5*0K1^@1,CO?3&ruW2)7*K+>G\q1,(F?0K(^@/iYgI2)dEI
1bg+-+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV
2Dm6K2BX^s1,(F?0K(^@/iYgI2)dEI1bg+-+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@
3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BXk"1,(F?0K(^@/iYgI2)dEI1bg+-+>PW)2_d$B
1G1OE3B8uT1,h*60d&5*0f:XC1GCF@3&EKO2D?sB+>Fuo0JGF?0etO;2)mTV2Dm6K2BXat1,(F?
0K(^@/iYgI2)dEI1bg+-+>PW)2_d$B1G1OE3B8uT1,h*61a"P-0f:XC1GCF@3&EKO2D?sB+>P&p
0JGF?0etO;2)mTV2Dm6K2BXt%1,(F?0K(^@/iYgI2)dEI1bg+-+>PW)2_d$B1G1OE3B8uT1,h*6
0d&5*0f:XC1GCF@3&EKO2D?sB+>P&p0JGF?0etO;2)mTV2Dm6K2BX^s1,(F?0K(^@/iYgI2)dEI
1bg+-+>PW)2_d$B1G1OE3B8uT1,h*61*A>+0f:XC1GCF@3&EKO2D?sB+>b2r0JGF?0etO;2)mTV
2Dm6K2BX^s1,(F?0K(^@/iYgI2)dEL3B83;+>PW)2_d$B1G1OE3B8uT1,h*61a"P-0f:XC1GCF@
3&EKO2D[?R+>k8s0JGF?0etO;2)mTV2Dm6K2BXat1,(F?0K(^@/iYgI2)dEL3B83:+>PW)2_d$B
1G1OE3B8uT1,h*61E\G,0f:XC1GCF@3&EKO2D[?R+>Fuo0JPF>0ek@71cI-G3&<9G3?U%!1,(C@
0ekF>/i>UK3Ar`M2`;d5+>PW*2)$pE0J5=E1c73M1H@H<0e"Y%4>J$<,Vh&.2)$pD1bL^F1c-pH
3&WZ;1,(F?0K([C/iP[F1bgsL2Du[50JPF=2DR*A2`<KL0fV-N2BXb/0f:XC1,ggC1,LmF3&!?8
1,(F?0K([C/iP[F1bgsL2Du[50JPF=2DR*A2`<KL0fV-N2BXb/0f:XC1,LUB2Dd6F3&ifS+>PW*
2)$pE0J5=E1c73N3&ET;1,(F?0K(^@/iYgI2)dHR1cQU50JPF=2_d*@1bq'F0K:pF3?U(20f:XD
0f(F=1GUaH3&icR+>PW*2)$sD1G1L>0K:a?3AWZ<1,(F?0K1^B/i5=?2)I9M0K1+00JPF=2_d*@
1c$jC3&*6E1ast(4>J$63$^750f:XC1,LUA3&iTJ1GggB+>PW*2)$pD1bL[G3&!-E1bgd/1,(F?
0K([F/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD
1bL[G3&!-E2*!Z>1,(F?0K([F/i>C@2D[<J3&i$90JPF>0JPF;1cI3H3&WQL1a"P-0f:XC1,LUA
3&iTJ1Gq0Q+>PW*2)$pD2_HsC1c@-L1,q691,(F?0K([F/i>C@2D[<J3&i$90JPF=2DR*A2E3ZM
1G^sK1a"P-0f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD2_HsC1c@-L1,q691,(F?0K([F/i>C@2D[<J
3&i$90JPF=2DR*A2E3ZM1G^sK1a"P-0f:XC1,ggC1,LmF3&3HQ+>PW*2)$pD2_HsC1c@-L1,q69
1,(F?0K1[?/i5@@1GCgI2DlU40JPF=2_Zs=1c$sE0KD$L2'=Y.0f:XC1,ggC1,LmF3&3HQ+>PW*
2)$pD2_HsC1c@-L1,q691,(F?0K([F/i>C@2D[<J3&i$90JPF=2_Zs=1c$sE0ebIC2]sk00f:XC
1,ggC1,LmF3&3HQ+>PW*2)-d>2(g^E1H7<J2E*T<1,(F?0K1[?/i5@@1GLR@2E)a60JPF=2DR3D
2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$sC0eP:=1c$j?2)[B91,(F?0K([F/i>C@
2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3$9t10f:XC1,ggC1,LmF3&3HQ+>PW*2)$sC0eP:=1c$j@
1,q071,(F?0K([F/i>C@2D[<J3&i$90JPF=2DR3D2)7!H1H7-L3%6C,4>8$7.4cl02BXb#1,(F?
0K([C/iP[F1bh!E2)?@3+>PW*2)$pD2_HsC1c@-L0fCa/0d&5*0f:XC1,LUB2Dd6F3A<<H+>b2r
0JPF=2D[$>3&i`P2`NTR1*ACr1,(F?0KCjI/i5LG3&!$F0Jst-+>PW*2)$pE0J5=E1c73O1H@35
1ast(4>A99-p014/1<V7.4cl00I\P80`                                          ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
