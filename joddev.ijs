NB. JOD dictionary dump: 24 Jul 2015 15:58:30
NB. Generated with JOD version; 0.9.980; 17; 24 Jul 2015 15:49:53
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|232590103446231617475144735166094174823|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.980';74;'24 Jul 2015 15:49:54'

JODVMD=:'0.9.980';17;'24 Jul 2015 15:49:53'

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

TESTYAMMER=:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bget=:3 : 0

NB.*bget v-- retrieves objects from dictionary backups.
NB.
NB. (bget) implements a  subset of (get). (bget)  fetches objects
NB. from  either the last backup or particular  backups. Only put
NB. dictionary backups are  searched  there is  no  backup  path.
NB. Also, there is no corresponding (bput) because the files read
NB. by (bget) are backups that,  once created, are  never altered
NB. by JOD.
NB.
NB. Certain objects are not fetched, name classes, timestamps and
NB. sizes.
NB.
NB. monad:  bget blcl
NB.
NB.   NB. collect from must current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB. dyad:  ilCodes bget bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.
NB.   2 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group
NB.
NB.   NB. fetch without defining multiple versions of a word
NB.   0 10 bget <;._1 ' wfoo wfoo.00 wfoo.11 wfoo.07'

WORD bget y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

ok 'NIMP bget' return. NB. NIMP out for now

NB. NIMP are the requested backup names valid?
NB. NIMP are the requested backups present?

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. loc bdefwords__ST y
    case. EXPLAIN  do. WORD bgetexplain__ST y
    case. DOCUMENT do. WORD bgetdocument__ST y
    case. NVTABLE  do. (WORD,0) bgetobjects__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST y
    case. EXPLAIN  do. TEST bgetexplain__ST y
    case. DOCUMENT do. TEST bgetdocument__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. GROUP bgetgstext__ST y
    case. EXPLAIN  do. GROUP bgetexplain__ST y
    case. DOCUMENT do. GROUP bgetdocument__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. SUITE bgetgstext__ST y
    case. EXPLAIN  do. SUITE bgetexplain__ST y
    case. DOCUMENT do. SUITE bgetdocument__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST y
    case. EXPLAIN  do. MACRO bgetexplain__ST y
    case. DOCUMENT do. MACRO bgetdocument__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

compressj=:3 : 0

NB.*compressj v--  removes  all  white  space  from  J words  and
NB. shortens local names. This process reduces the readability of
NB. code and should only be applied to production code.
NB.
NB. monad:  cl =. compressj ct
NB.
NB.   compressj jcr 'verbname'
NB.
NB.   NB. call in object context
NB.   compressj__UT__JODobj jcr_ajod_ 'compressj_base_'

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. check for presence of obfuscation tag
if. o=. 1 e. OBFUSCATE E. ,y do.
  NB. local names less J arguments
  l=. ;(<1;1){m
  l=. l -. JARGS__MK
else.
  NB. local names less any single char names
  l=. ;(<1;1){m
  s=. l #~ 1 = #&> l
  l=. l -. s
end.

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

if. o do.
  NB. form obsfucated name replacements - drop trailing _ in (NAMEALPHA)
  bnr=. (<:#NAMEALPHA)&#.@((}:NAMEALPHA)&i.)^:_1
  r=. ' ' -.~ ,'/' ,"1  (>m) ,"1 '/' ,"1 OBFUSCPFX ,"1 bnr (#m)?OBFUSCCNT   
else.
  NB. form replacements from any remaining chars !(*)=. SHORTNAMES
  NB. J arguments m n x y u v are not on SHORTNAMES
  if. 0=#r=. SHORTNAMES -. ,&.> s do. u return. end.
  if. (#r) < #m do. 
    NB. we have more replacements than available SHORTNAMES
    NB. form base (#r) numbers using SHORTNAMES digits
    bnr=. (#r)&#.@((;r)&i.)^:_1
    r=. r,<"1(#r) }. bnr i. #m
  end.
  r=. ; '/' ,&.> m ,. (#m) {. r
end.

NB. replace tokens
r changetok u
)

createjod=:3 : 0

NB.*createjod  v--  dictionary  object  creation verb. (y)  is  a
NB. dictionary object locale reference. This verb initializes  an
NB. (ijod) locale user interface for the JOD system.  and creates
NB. all necessary subobjects.
NB.
NB. monad:  paRc =. createjod ba
NB.
NB.   JD=: conew 'ajod'
NB.   createjod__JD JD

NB. set default master, profile and user if they don't exist
if. -.wex <'JMASTER' do. JMASTER=:jodsystempath 'jmaster' end.
if. -.wex <'JODPROF' do. JODPROF=:jodsystempath 'jodprofile.ijs' end.
if. -.wex <'JODUSER' do. JODUSER=:jodsystempath 'joduserconfig.ijs' end.

NB. set J version number
JVERSION_ajod_=: (jvn :: _9:) ''

NB. create master file if necessary
if. -. fex <JMASTER,IJF do.
  if. badrc mdat=. createmast JMASTER do. mdat return. end.
end.

NB. execute any user script - allows for redefintions of various
NB. class nouns before JOD objects are created - joduserconfig.ijs
NB. is not installed and must be created by users
if. fex <JODUSER do.
  NB. attempt execution of script - obfuscate names (/:)=: 
  if. (_9 -: ((0!:0) :: _9:) <JODUSER){0 1 do. (jderr ERR026),<13!:12 '' return. end.
end.

NB. initialize master dictionary parameters - used when
NB. creating directory objects to insure that all master
NB. parameters are set in directory objects - this amends
NB. the "jod" class to exploit inheritance in all derived classes
if. badjr mdat=. jread JMASTER;CNMFPARMS do. jderr ERR006 return. end.
MASTERPARMS_ajod_=: > mdat

NB. extension objects and complete (ijod) interface (*)=. JODEXT IZJODALL
JODEXT=: 0$a:
IZJODALL=: IzJODinterface,<'JODobj'

NB. create storage, scratch, maker and utility objects !(*)=. JOD ST SO MK UT
JOD=: y
ST=: conew 'ajodstore'
MK=: conew 'ajodmake'
UT=: conew 'ajodutil'

NB. empty classless object - must see ijod
SO=: cocreate ''    
('ijod';'z') copath ;SO

obs=. JOD;ST;MK;UT;<SO

NB. initialize objects - they need to know each other
createst__ST obs
createmk__MK obs
createut__UT obs

NB. create direct _n_ (ijod) locale interface - if the (ijod)
NB. trap word (jodsf) exists define an error trapping interface
".&.> y defzface IzJODinterface

NB. attempt to create J temp directory ignoring errors
NB. required for JOD edit utilities and not always present on J systems
makedir <jpath '~temp/'

NB. execute any master dictionary profile script
if. fex <JODPROF do. (_9 -: ((0!:0) :: _9:) <JODPROF){1 0 else. 1 end.
)

getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)

lg=:3 : 0

NB.*lg v-- make and load JOD group.
NB.
NB. (lg) assembles and loads  JOD group  scripts. The monad loads
NB. without  the  postprocessor  and  the  dyad  loads  with  the
NB. postprocessor.
NB.
NB. monad:  lg clGroup
NB.
NB.   lg 'groupname'  NB. no postprocessor
NB.
NB. dyad:  uu lg clGroup
NB.
NB.   2 lg 'group'    NB. no postprocessor
NB.   lg~  'group'    NB. postprocessor

NB. (/:)=: obfuscate names
2 lg y
:
if. x-:2 do.
  NB. 2 _2 make assembles entire group script
  NB. with preamble regardless of where the
  NB. group appears on the JOD path
  msg=. OK00404 NB. okmsg: group loaded
  t=. 2 _2 make y
else.
  msg=. OK00405 NB. okmsg: group loaded with postprocessor
  t=. 2 mls y
end.
'r s'=. 2{.t
if. r do.
  curr=. 18!:5 ''   NB. current locale
  18!:4 <'base'     NB. run script from base
  try. 0!:0 s
  catchd.
    18!:4 curr      NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  18!:4 curr        NB. restore locale
  ok (y),msg
else.
  t
end.
)

loadwords=:4 : 0

NB.*loadwords v-- loads dictionary words into target locales.

DL=. {: y  NB. obfuscate (/:)=: directory object !(*)=. DL

NB. NIMP GETFACTOR not used yet
NB. read words and determine name class
if. badjr wu=. jread WF__DL;x{WORDCN__DL do.
  jderr ERR088  NB. errmsg: read failure
else.
  bu=.   0 ~: ; 1&{&> wu
  loc=. >{. y  NB. target locale

  NB. define words that are not nouns
  NB. NIMP may be able to speed things up by switching
  NB. to target locale in top of script and then switching
  NB. back to current - eliminates need to hard wire target locale
  NB. to each word.

  try.
    if. #vu=. bu#wu do.
      0!:0  ; (({.&> vu) ,&.> <loc,'=:') ,&.> ({:&> vu) ,&.> <LF
    end.

    NB. define nouns
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

rm=:3 : 0

NB.*rm v-- runs J macro scripts
NB.
NB. monad:  rm cl|blcl
NB. dyad:  pa rm cl|blcl

NB. (/:)=: obfuscate names
0 rm y
:
if. badrc uv=. MACRO get y do. uv return. end.
uv=. rv uv

if. *./um=. JSCRIPT = ; 1 {"1 uv do.

  scr=. ;({:"1 uv) ,&.> LF
  curr=. 18!:5 ''

  try.
    NB. run from base, (display default, suppress x.-:1) stop on errors
    18!:4 <'base'
    if. x-:1 do. 0!:100 scr else. 0!:101 scr end.
    18!:4 curr
  catchd.
    18!:4 curr  NB. restore locale
    (jderr ERR0256),<13!:12 '' return.
  end.

else.
  NB. errmsg: not J script(s)
  (jderr ERR0252),(-.um)#{."1 uv
end.
)

rtt=:3 : 0

NB.*rtt v-- runs J test scripts
NB.
NB. monad:  rtt cl|blcl
NB.
NB.   rtt 'runmytautology'
NB.   rtt ;: 'run these tautology tests in order'
NB.
NB. dyad:
NB.
NB.   0 rtt 'tautology'
NB.   1 rtt 'silenttautology'
NB.   2 rtt 'plaintest'
NB.   3 rtt 'suite'   NB. make and run tautology test suite
NB.   4 rtt 'suite'   NB. make suite and run silently

0 rtt y
:

NB. HARDCODE: option codes (/:)=: obfuscate names
if. (3-:x) +. 4-:x do. 
  if. badrc uv=. (SUITE,_2) make y do. uv return. end.
  scr=.rv uv
  x=. x-3 NB. run option
else. 
  if. badrc uv=. TEST get y do. uv return. end.
  uv=. rv uv
  scr=. ;({:"1 uv) ,&.> LF
end.

curr=. 18!:5 ''

NB. run from base, (display default, suppress x-:1), stop on errors
18!:4 <'base'
try.
  if. 0-:x     do. 0!:2 scr
  NB. Note: silent execution that fails suppresses all output
  elseif. 1-:x do. (] [ 1!:2&2) 0!:3 scr 
  elseif. 2-:x do. 0!:001 scr
  elseif.do.
    18!:4 curr
    jderr ERR001 return.
  end.
catchd.
  18!:4 curr
  (jderr ERR0256),<13!:12 '' return. 
end.

NB. back to original locale
18!:4 curr
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebL.0f^@3+>G\q2DZI21*A>2+>GPm1G^..2BXb2+>GSn1GL"1+>P\p3?U+4+?:Q%3?U=)1Gp:0
0H`/,+>b2t0d&J!2DH=7+>Y_p0ea_,1*A=p1,C%5+>bhr3$:"8+>P&p0H`.o0f_gO8l%ihDKKH1
Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GF<DuQATV[*A8,q'
ATDBk@q@)\H:gt$Bl8$(Eb8`iAQ)Po:..BG7!!HYDId0rA0>B#Eb-@c:IH=>DKKH1Amo1\8U=!)
7!*?cCi`3E6rZrX9N*&^BkhQs.3N>BFCfK)@:NjkGAhM4F!)SsH:gt$F`_>8FCfK)@:Nk`De+!4
Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk
8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk:I7NN;aWiM7;lXIF`V&$FCcS2De!3l+DG@tDKKT)
Bk;=++EV%):I7NN;aWoI<,Q,]AKYo#Ap&0)@<?4%DBNb0D/")7/Ke_@B4tjs+Eh10F_,V:Ch7[/
+Dbb-AScW7FDi:3CghBu:I7NN;aXAN=DqY\F`V&$FD5Z2+Dbt+@;I'#A7]Y#BkD'jEZf=AAS,Y$
<(0_b=[>bV78e5=F*&OAATMp$B4W3,GA2//BHSlL0d(CP+>=pVAnGLbATVs(FE2),G%G_;DdmHm
@ruc7Ao_g,+Co1rFD5Z2@<-W9@UWb^F`;D3Df'H6ATMp-Eb0*+G%G_;@;Ka&GA(]4AKZ&5@:Njk
Ao_g,+A*c#DfTB0+CT.u+EM47Ecbl1F!,:;@ps0rDIIBnF(96%@<?'qDe*Bm@ruF'DIIR2+E(_(
ARfg)@rc-hFD5Z2+Eh=:@V97oDKKrA@;TsrATT&4@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJ
Bl.F&FCB$*F)5K+@;BEs@;]TuCi<`m+A,Et+D5_5F`;/8@:XS#Eb'6-Ddd0t+Co1rFD5Z2@<-W9
GAhM4F!,17FDi:D@<-!lF<GC<@ps1bF)Z8D@;Kb%F)Z8DF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4
B4Z0nCi"37.<99GF`)7C8g%tZ@rcK1F(96)E--/AFEDPGDK?pm+EV19F<GX7EbTK7Er       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$73+>P&o1*A>+1bp1.1*A>22_uR20H`))1,9t,0H`,-1,U100d&8,3AG#^D/a5gD/X3$0JH6g
/h1@LD/a5gD/X3$0JFVk/M/)eATMr9-t@14E,$gEDIIBn+E(_$F`V&$FD5Z2/e&._67r]S:-pQU
=(l/_+EV:.+<Y`IEbTE(+=Jm(.6T^7+CT5.ARTV#+<YB9+<Y)88g#7#DfTA2+=L`<D/a5=+EqO9
C^g_H67sC!@V0b(@psIj+CT/5+<YK=@ps0rDIIBnF"SS2@V0b(@psIjA0>buD.Rc2+C\npBl5%9
GA2/4+EV:.%15is/g,+RAS,Y$+<W(.6:OsR6Vp6S.3KaADIak4+D#G$+<YlBFD)d>Ea`irDf$U>
@UX=h+<XEF9gq?A:e3k]$;No?+EM[;AncL$F!)SJ@rH7,Ec5c1ARlo+@X0(=-r30!<Du7P:/iYp
+<VdtBkM*jEZcJIG%#30ATJt:De9Fc:-pQU-r30!<Du7P:/iYbB4YslEaa'$+Dbt6B4Z*+@;]Tu
Ch7[/+Dbb-AScW7FDi:3CghBu+DtV)ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8Z
0e"5RF)uJ@ATJu9ATMr9A8,OqBl@ltEd8cUFCfN8C2[W:.3N2HBleB;%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>I2[p*h67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2
?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K
+=D8BF*)/8A2#AR>9G^EDe't5-RT?1%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2
+E(j7C*7_=Eb'5B+CehrCcW[]C1D9,-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la
+Z_J'4:MW,$;No?+Co%qBl7K)GAhM4+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$
3Zp*c$;No?+=Jm(.6T^7Ddm=$F(8X#AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/
A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo
$6UI8+?_>"BakD\DIb@/$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP
.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3
Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^
+CT.u+Co%qBl7K)GA2/4+E(_$F`V&$FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):
Ap&0)@<?'tAM>J@$4R>;67sBsDe!3l+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,
HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr
,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$
+>=63-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo
$6UI8ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*
Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eX
D/X3$3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1
D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>
Ecbl1D.PCK%13OO:-pQUCi<flC`me4DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc
0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc
$8EZ-+EM47GApu3F!,::@;TRs+=o,fF)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%
$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,
@rH4'C/\tfCLo1S:-pQ_@rH4'C/\tfCLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2
AKZ)+F*)IU$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2
$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW)0QUfE0JNo067sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/IG6>/g)l'DJs\R1E^gZA79RkA0>K&EZdtM6m+093A*-=$;No?+>G`gF_iff+ED%2@;TRd+D,Y4
D'16:Df'H.6=FqL@jrO/DIakuA867.FCeu*AoD]48g$)G0Jj,367sB'+<VdL+<Ve8DIal-ATo7F
F)>i2ALq;!F(o,8Cgh?sALqnEEb0<5/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O%]@rGk"EcP`/F<Dr?
@<6!-$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:9]@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$a
F)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&$;No?+>%q>78m/.;cH%\<.->*$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OL2lEZf:2+=D8BF*)/8A2#A<$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56
FDi:3Df'H6ATMo"9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!$4:6\D]h1q+ED%%
Ci"B5Df03*@;TRs@;]t$H#7+84Y@k!BOuHtEb/[#H#7MBDf$U[/g)hTDe<R*ARf:mF(of/F*(i.
A79LhF!*Uu+C]8-$4:lg@<>puARTXj@;TFcBl7QlF)Go;FCB&t@<,meFCB!%+?_>"@W-0-.Nj!D
$7AeA6qL0S;]nq;:K0bN+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[Hh!7nc]F
5tk3"79DoN<CB8D-TsL5@W-/l.1-DnEZfI@E,9H&+E2IF+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL
<,Y`]E+LC(Eap4r+=D2>+EVjM-TsL5@rH4'C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B
$8EZ-+EMC<F`_SFF<G[MF:&@rBQ%p54ZX]A+?CW!$;No?+DtV)ATJu&Ci"-'@:XX+Df0,/@q]:k
+>"^RDfd+3BOPdkARl-V4YD!eGs*cg+=\Kh$@4if@3@$BGp"RZGmYu-$>"6#FDYu5Ddso/F`\`R
F(fK4F=.E9@j"tu-ZW]>FEhmT4Z[(kD/a54-Z`s>Ec`Z90d'[CF)>i<FDuAE+EVjM$47,Y@VTIa
FE1r)F$2Q,1E\_$0FDN&D-pXg@VTIaF?M6!Gp#jK/g+\C+Du+>+Cf>,E,oN2F!,C1C1UmsEsc`%
F*(brBl79bDdmHm@ru'b@rH6sF`V88DETTp1("A!Bl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3
D/aN,F)rI?De!3lATJ2-$4:?b+EVI>Ci<f+E-67F-Z<I/ARfh&AS-!2$?BW!>9G;6@j#l<F=044
@rH4'C*4mB@VTIaFE1r)F!h;L+Bot0D/XQ=E-67FFEhm7$>40n@UX(nAS-!H3\qm>+>=.8Ci<ck
Ci^^K+CT;%+=\LODfd*O+Cf>,E,oN2F(Jl).Nj!D.1-DnEZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(
-OOm(+Bos9Eap56G]Y;r3ZqpND/a54-YI76@UX(nAS-!2$8EZ-+EMC<F`_SFF<G[MF:&?^A7]7e
@<,piF(9--ATL!q+>b3%+>=-0:-pQUA7]7e@<,pi+EM%2E+O)5@<,p%FDl;3BR(_<@;TRs+CT.u
+CT;%$;No?+D#e-Cis9"A0>K)Df$V=BOr;rDf'H6ATMp,Df-\:Ec5H!F)qZqDg#]4EbT&q4Z[4l
Ddm-kF$2Q,GT\,(67sZ9.6T:+Dg#]4EbT&q+D5M/@UX(o$4:6\D`o^dDf7ckFDl(\/g)kk+<VdL
+AP6U+=J]g4ZX]pDf6b3Df6b?Df5siAoD]sDIIBnF"SS\+CoCC$6UH6+C]8-+=\LO@;TRs?YOCg
AU#=?:-pQUBl.g*Bk(k!+D,P4/g+tK@ps1p+Du+>+Cf(nDJ*Nk$6UH6+=DAE+D58-+CfG7DI[?k
A0>f5F<GL6+D#e3F*(u2@q@#14Y@jp@;TRs+=\LO@;TRs$>"*c/d_r!Df6aJ+F+;C$4:?b+EVI>
Ci<f+E-67F-Y-duCgh?qA927!E+O)<$?BW!>9G;6@j#l<F=044+Cf>,E,$LCA7]7e@<,piF(9--
ATK4+0d'[CF)>i<FDuAE+EVjM$4:WaG\(E,@rH<tF$2Q,1E\_$0FA.^67sBsDe!3l+DGm>@<6L(
B5V9k+Dbt+@;I&pDIal&Ci<ckC^Np(/g,@OASrW!DL!@ABm=3"+EM%2E+O)5@<,p%A7]jo@ru9m
+E).6Gm[;5/g,@OBlmo/F)YPtAKY].+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7da67sBhDIal(
A7]Y#BkD'jF!,=6G\(D.F(9--ATJ1cCi<flCcsBnGm\A+@ps1:3Zp1#.NiPG@ps0\.1-DnEZfI@
E,9H&+E2IF+=D#?G\(E,@rH<tF!h<8@j"tu-ZW]>FEhmT4ZX]qDf'H.+=D#?G\(E,@rH<tF!h;L
+Bot0D/XQ=E-67FFEhm7$=e!lAp&0+A927!E+O)R3Zp4$3Zp*`$;No?+DGF1FD,6+AKYE%AKYE!
Gp%!5D.Oi"CghC+BkD'h@<?4%DBNY7F*2&8$;No?+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.I
BPDR"+EML1@q?csF!,L7D/XT/A1e3a67sC&BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T
<+ohc-td@7@WNt*:-pQUG%G]'+Co&*ARfh'+CT.u+ED%4DfTr@+Cf>-Ap&0+A0>Do@r,Ro@<?4%
DK@E;$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AI8cRDf7da
+<VdL+<VdL+AP6U+=J]g4Y@jdDf5trDf7ck@W-0-.Nj!Z+AP6U+=J]g4ZX]pDf5t3$4:?b+EVI>
Ci<f+E-67F-Y%(4Ap&0+A927!E+O)<$?BW!>9G;6@j#l<F=044+Cf>,E,$LC@rH6sF`V,)F(9--
ATK4+$;No?+>%q>78m/.;cQ1P78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!c
Eaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y!k];f-GgAM>f567s`uBk1.ZDeio<0HbHh/KcHPBk/Y8
F)>i2AKZ)+F*'#D$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is/g)8Z0e"5dFCB&t@<,m$8g&(n
De<^"AISuA67sB'+>PAg-u*[2FCfN8ATB4BG%G]'F!+n7@;0Od@VfTb$;No?+<Vd_.3MMW5t"dP
8Q8,$FCfN8+Co2-@ruF'DIIR"ATKmA$;No?+<VdL+<W(SATMs.De(OQ+EV19FD>`)0e=GhATMs.
De(RV/0K%GF*)/8A2,bl.3K',:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`bARdGT+Cf>-G%G]9ARlp*D]idQ/hf%'8l%ha
$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB82/78M0KC7rAStpnARlo3A8,RQ
D/X3$0JFpuAo_g,+=Lc7A3s^GBk&hN0e"4S$;No?+<VdL+<VdL+EDUB+DG^9C3=E0+Dbt+@;KKa
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1
/I`$r$;No?+EV:.+Co1rFD5Z2@<-W9Bk1dmFD5?$@psInDf-\@ATD6&-tI%&.3N>;DJsQ,F!,1=
-Z^D=EbBN3ASuU2/e&/!EZf:2+=D8BF*)/8A2#A?$>"6#A8,Qs0F\?u$;No?+Du==@V'R&De:,&
Bk)7!Df0!(Bk;?.Df-\:@<?0*D09oA+DkP/@qZ;Y0d&V%,9VCe+Co1s+>=63%16Ze+E(d54$"a2
ATMs.De(RFFCfN8C2[W;0HbIKF*)/8A2,bl-OgCl$8`kg+<r"W/g+\=A0<Q8$4R>REZfKf3Zp+!
A8,Qs0F\@H+?^hl+>G!XBk(p$FW_f%67sBpDI[L*A7]g)BOtU_ATA4e%16Ze+>Y-YA0<rp-Zip@
FD>`)0HbIKF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F+?^hl+>G!XBk(p$FU\Ze$;No?+>%q>
78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDF)>i2AN;b2?Y"%j;f-GgAM>f567s`uDJW6gDeio<0HbHh/KcHPDJUaEF)>i2AKZ)+
F*)IU%15is/e&._67sBJBOt[hF!)T6Cht4:FD,5.G%#3$A0<"'EbBN3ASuT4+Cei$ATJt:De:+7
-tI43.4u_c:3CDbEc6)A%15is/g)?UARTUqGp$U8EcP`$F<ViADK]H)Bk/>r@<6"$+CT;%+CT)-
D]j.5F*(u(/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0I\,TBk)7!
Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M
1,'.E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OOATAo3A0<7AATMs.De(OL%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSG
Dfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP
4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g,(MCj@.BF`\a:Bk)7!Df0!(Gp$gB+E)-?FD,5.
E+*j%%14j54Wkt[Bk/>?%13OO:-pQUA8,OqBl@ltEd8dAF!,%2E--@7$8<Sc+<s&m0d(fc0HanD
C`k)Q%14d34Wkt5+>G!c+>G!LDJUFC-OgD:+?^hl4s2R&HQY'dA8Z3+-RT?10H`M$,<d5)+F>4e
+CoA++=ANG$8<Sc+<s&m0d(fc1a$=HC`k)Q%13OO:-pQUBl8!'Ec`FFDf'&.G%G]'Et&J"DIIBn
F$2Q,-Xq:?A2#-8GB.4K+C]P8A259:GB.4M-OgDlGB.4J4ZX]K%16QgEb$mf3Zp!`$=\4"A26;/
+>Y-$+=DCV.Nj!a%16QgEb$sh3Zp.5+?CVmGT\R\1*A%hGpa%.4tq>*D/a<0@j#`5F<EY+G&C`*
ATJ:f%15is/g+kGF(KB6+EMI<AKYl/F`)70$>s`iD.RcO3ZoefGB.4J+DuCDA2,3EGB.4L+DuCD
A2>?GGB.4N-OgD24$%7s@;TRs.6T^7-ms.MCj@.5Dg,Z/H#k>^4"+eq+>P&q.6Aq40L%9G.6Aq;
3?TUj5;aQ=,W@Y24$7XH-Zs<@@rGmh+Dk[4@WHB7%159QHZX+DCi<f+E-67F4$%7s@;TRs%13OO
%14LoDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$7ISNA8Z3+-RU>c/NP"/+?L\o
4$%P&@;TRs.3L/a4$%7s@;TRs%13OO-nlbu+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%
DIIBnF!)T#67sBlD/aTB+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;
+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2Bl7NsGRY!.0H`.oA8Z3+-RU>c/NP"/+?L\o4$%P&
@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+EM[;AncK!$4R=j0H`(mA8Z3+-Xq:?-Rg/i
3Zp."4!6UGG&C`*ATJt:+<VdL+<XEG/g,@VEb$;3Eb/isGRY!.0H`+nA8Z3+-T!2"+>#Vs0d&P#
4$"a,GB.4N-QjNS+<VdL+<XEG/g,@VEb$;,DJ!U-%14L;+>Y-NDJUFCA2,G\+>#Vs0d&P#4$"`u
GB.4K+DuCDA2,GS+AP6U+EqaEA0>r9AnGb%%13OODImi20H`%lA8Z3+-RU$367sC#F^]*#Anbgs
+D#S6DfTn.$>sEq+>=op+CoA++=ANG$>sEq+>=ol+>=pKDJUFC-OgCl$7ISN0d&.mA8Z3+-RU>c
/NP"/+?L]-3c8hDD.Rc2+<VdL+<XEG/g+_BE--@JGAhM4+E2@4AncK4-uNsGDK@69$7ISN0d&.m
A8Z3+-Z4-KA2GY_+>#Vs0d&P#4$"a,GB.4N-Ql/N/g,@VEb$;3Eb/isGT\DPDfor=.1HV40H`+n
0HanDC`k*GA2>S^+>#Vs0d&P#4$"a,GB.4M-QjNS:-pQUGAhM4+DG_*Bm:aKDJsZ8F"%P*-nlc"
+>=pKDJUFCA2,G\+>#Vs0d&P#4$"a,GB.4K-QjNS+AP6U+EqaEA0>r9AnGb%+=M,GF`)7L%13OO
DImi20H`1p0HanDC`k*GA1&KB:-pQUEHP]+BkD'jEZeq6Ec5u>%16uaEZd%Y1a"RsA8Z3+-ZW`F
+<V+#DImi20H`%l1E^4GC`k*CD^Pu$DImi20H`%l0d("EC`k*LEc5i.-OgE#ATAnI+>=on+CoA+
+=CT1@;0U,%143e$7ISN0d&7pA8Z3+-RU>c/NP"/+?L]-3d,CLD.Rc2+<VdL+<XEG/g+_BE--@J
GAhM4+E2@4AncK4.!B0B@WNt-$7ISN0d&7pA8Z3+-Xq:?A2>S^+>#Vs0d&P#4$"`uGB.4M-Ql/N
/g,@VEb$;3Eb/isGT\DXATD7$.1HV40H`+n1E^4GC`k*GA2>S^+>#Vs0d&P#4$"`uGB.4M-QjNS
:-pQUGAhM4+DG_*Bm:aKG%G]'F"%P*-nlc"+>Y-NDJUFCA2,G\+>#Vs0d&P#4$"`uGB.4K-QjNS
+AP6U+EqaEA0>r9AnGb%+=MDEEaj)=%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*
+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,F`:l"FCf3*
A7TCqFE2))F`_>9DGEMN.Wo]@@<?'qDe*BmF*)G:@Wcd,Df-\=/M/)fE+EC!ATJu+Bl%@%+DG^9
8l%htA8-+,EbT!*FD5Z2/e&._67sAi$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBj
Eb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB73,N)L1,pCsASl@/ARlot
DKBo.Cht5'@<?Q5@;]TuF(96)E--.D/Kf+KD/a<*Anbgt+A+pn+DkP$DKKH-@;]Rd%15is/g)i-
F(K;G1a$4;A7]9oBPDO0DfU+UFEhmMFDi:4BleB:Bju4,ARloqBl%@%%15is/g)l'An>F+1a$:H
Bl8!'Ec`EOBkhQs-Qli.A7]:&C2[W8E+EQ'Eb0*+G%G2,Ao_g,+F7a@%15is/g)8Z+<VdL+<Y<8
DeElt04Sp2AT2HsGT^O2Eb/a&DfU+GF`:l"FCcS8ASl@/ARl5W:-pQU0em9O@PKeaC2[X%A7dH9
G]Y'=Bl[cpFDl2F+E2.*@qB=lCh.*t+CSekARl5W:-pQU0emNRGqh9$C2[WnDdtG:Bl8'<DJsW.
F"VQZF<G"&A7]9\$;No?+>GWdF`&rg+=M;BFD>5pA8c@)@<?1(.3N&0A7]9oAoD]4GA1qG+Dbb0
Fa,G[D.-osE+*j%%15is/g)l(C3=DL1*C"9A7]9o-uEC&DJsW.F'hmK<%/q!$;No?+>GWdF`&rl
+D,P4@qfgn+Dbb0AKYQ%A9/kAFDjc#%15is/g)l(C3=>H2]uUKE-WR:BleA=H>.=@FDi:4Ec5o+
Dg3C:DerrqEX`@N67sB81hq/N1,U1pASl@/AKYN(DfB0(GT^U:Ch.*t+Cf>/Gmt*U67sB82/QcB
0fC.pASl@/AKZ;2Bl%@%+>"^JBl%@%+EVNE/hSb0C2[WnATf_8Ch[Hu06;5DFCd*X/hS8WBl[cp
FDl26ATJ:f:-pQU0f<]gCb[diEb0*+G%DdEC2[WsDId='?V"-j9IV*#@<-!l+E(_1Des!,AKYo#
C1Ums%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$a
FE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$
ASbpdF(HJ)Bk)7!Df0!(Bk;>p$=e4!E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3C2[Wn
ATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(e
DJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8Bl@lP3Zot;
0RHDf6rm#M%13OO:-pQU8l%htF*(i'Bl7Q+A8-'q@ruX0Gp%6IA7]d(E-67FA8,OqBl@ltEbT*+
+CT)#ASrW$Bl[cpFDl2F%15^'6rR&N7n#g;;E[&`C2dU'BQIa(+=JEd-UCEt-S.>qDe!j#G[FfM
:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/15L\@:s.)C2[W9-OgCl$;No?+EM%5
BlJ08/0Jb;@WNZ#DIal!@<?Q"$?L#H3Zoe`BleB7Ed;D<A0>T(F*(i,Chdm!+ED%7ATV[*A0>W*
A8kstD0$h7De*g-De<^"AKYhuDJ<]oF*)/8A0>\s@V'dmD/a<&0JG4(C2[WsDKKo;+DPh*A9Da.
-OgE(Ccsg%F)3BT+A?3Q7!3?c+DPh*@V'V&+DG_7FCB!%C2[Wl@<<W4ATMF)C2[Wl@<<W,De*g-
C2G).De+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[/12QTDe*ftAm\M><$6!kDKU2ADffQ3?W:-,
+DkOsDJsW.F'hmK<$r+^%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5
BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EDUB+A+pn+DkP)BkCptF:AR*
-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;67sC'E+EC!AKYT!Ch7Ys$8=RjFDjboC2[X%
@<-4+.3K`U+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*fqEc#kMBkh]:%14dO.!0B"+DPh*E,ol/
Bl%?0+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X%Ec5Q(Ch555C3(a3$8=RjFDjboBPDO0DfU,<
De(:>+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj2/BleB7Ed99ZG]Y;B$8=RjFDjboC2[X%Ec5Q(Ch5%<
+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@A8lR-Anc'm@UX%)Bkh]:%14dO.!0B"+DPh*
E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2De*fqEc#l,@;@K0C3(a3$8=Rj
FDjboC2[X*F(KB%Df00$B4>:b.3KaFGB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@A9Ds)Eas$*
Anbme@;@K0C3(a3$8=RjFDjboD..<rAn?%*C2[W3+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj24@;]dk
ATMrGBkh]:%14dO.!0B"+DbIqAU%X#E,9)>0JP"!Ap890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2
CggdaG[YH.Ch5:S0eR0TF!hD(0K^b*Db;-G@:DWID/^pH+<VdL+<Y9?EbTW,+A,Et;cH%Q779^F
/151NA8G[`F"_?<@UsUuE%Yj>F!hD(0K^b*Db;-eDe*R"FE2:K+<VdL+<Y9?EbTW,+A,Et;cH%Q
779^F/151NA8G[`F"_9HA8,q'Ec3REC31g4$8=RjFDjboC2[WnF_u(H+<VdL+<Ve=GB.D>AKXT@
6rR&N7n#g;;Cj21De*Zm@WO2;De*C$D/_+AC31g4$8=RjFDjboC2[WlATMrB+<VdL+<Ve=GB.D>
AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*<gF*'$KC31g4$4R>;67sBlG%GQ5F^]*&Gp$O5DffZ(
EZf=ADe`inF<GF/DII0hEZf1,@N]l/Cht5'AKYDlA7]9o%13OO:-pQUF*)>@AKYZ.D/:>/DId='
+>"^SFD,6++E).6Bl7K)Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1DImo4Ch[d&Et&IO67sB74=G;i
8g%keA8,plAU%QQ<)$%8+D,h<Blmo/8l%iR<'a#C6qL9--YdR1A8bs2BQS*-A8bs2C2[WsDId='
/nf?DCaTZ!%15is/g,4WDfTD3C2[X%A7dH9G]Y'ICgggb+D>\0A7]d(AoD]4C2[W8E+EQ'/KeJF
@;0Od@VfTuDf0B*DIj7a0K^b*Db;-eDe*ftAm\M><%/r%GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs
@kVe3An5gi05>E9E+EQ5FEhmT%13OO:-pQUF*)>@AKYf'DKU1WD.-osF)Y]#BkD'h+Du+>ATJ:f
0K^b*Db;-gBl8'<DJsW.F'hmK<%/r%GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kVY4DKU2ADffQ3
/p)>[-OgD:4=G;i8g%tZ@r?4,ATM3X=B$^l+<Y9?EbTW,+A,Et;cH%Q779^F/151NA7TUg05Y--
DJsW.F"VQZF=.M)%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr%17/nDfp/@
F`\`RC2[W*F*(i'AKYMtEb/a&DfU+GF`:l"FCeu1%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&                                            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1*A>4+>GVo1Gg4/0H`).+>GPm0fL410d&8.@rH4'C/\tfCLo1RFCfN8+=L`<D/a5=
+DtV)AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+
F*)J6Bk1.ZDeio<0IUIGA18XBD/X3$+EV19FC]9*;f-GgAM>edA8Z34+EMC<CLnW1ATMs7F`:l"
FCf3*A7TCqFE2))F`_>9DKTo/@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df,           ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*A>/1H-F30H`+n1,UjG+>GSn1*A>+3&;[30H`+n0f1mE1a"M/+>P&p0Jt^1
0fL41+?2>;+>Get1*AJ11a"M-+>P&o1cR030f^@3+>l)5+>Get1*A;.1Gh^"6pamF9LMEC;cHOj
=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35
F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cPgL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f:(G
F_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K'7F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Get8p+qm1,(F?+>GW41bh$H
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fL4I
F_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iDs$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0d')2C`kJe0f:(.0fh$F
3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh
1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe0f:(.0fh'G3\rMu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1a#D5C`kJe0f:(.
2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#8l%iS:JXY_6<-TN6qBmJ<)6Cp
1,Vfn/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A
+>b35F_i0U0JPF-0JGOB1HI9F%13FL:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2)l^$6t(1K3Zp='8p+qm1,(F?+>GT31,M$I2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2)ud%6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU
1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tnr+@KX[
ANCqg2'>M6C`kJe0f:(-3BB#U3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp=8+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEN$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1*@]-@<?'A+>Get8p+qm1,(F?+>GQ2
2)mWO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DZHu
6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>u&!+@KX[ANCqg2]t_8C`kJe0f:(.1-.6H3\iW$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=<+<X'\FCdKU0fL4IF_i0U0JPF-
0f1pH1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
2BX,1@<?'A+>Get8p+qm1,(F?+>Gf90JPUC2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2E)a$6t(1K3Zp14+A-cm+>PW*2'=V.3\WKR1,91D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u2%+@KX[ANCqh0d')2C`kJe
0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp=@+<X'\FCdKU1,C%FF_i0U0JPF-0ebXG1HI<P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0H_K+@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!":-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_cEt6t(1K3Zp16+A-cm
+>PW*2'=V.3\iKP1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+?)%u+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@;+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K0KM!L$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1a!o/@<?'A+>Pbr
8p+qm1,(F?+>G`71c[TS1^[]7Bl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!ATJt:
@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu$;No?+Co2,ARfh#Ed98E:-pQ?:-pQU
G%G]'@<?4#3XSVK/db??/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%h^
:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"
ATJ2R67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1
@q0(kF!,R<BlbD<@rc:&F:(c0/db??/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*
D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1/g:/db??/g+SDF*2>2F#jY'67rU?67sBU
D]iV3Ec5t@@q]F`CM@[!/db??/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AI;1!/db??/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emEcDD3gQ:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB80ktiK
0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`CG'=9EsbZ/
/g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%
Ch[Hu$4:9]@s)g4ASuT4-XpM*AL@gpDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-U
F(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?+ED%'DfTA2
DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>mDf9PW3Zri'+Co1s+>=.@
A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`3$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/
A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OOU,A9MO)
F(oQ14ZX]:4tq=U:IJ5X6ja8r67sBhCh[Hu+DPh*Bkh]3A8-'q@ruX0Gm[/>6q9gJ8l%iH8lJPP
<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VQ6B
:II]E<(]qS8P2oX5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U
$49Np/g+e<DImisFCcS)Df'?&DKKH#+A,Et+Cf4rF)rIF@rc:&FE7e(@r,RpF(KDU3ZpLF-YdR1
+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!,49A8c?5$>OKiAnc'mF$2Q,
-p07-?SNuPD..3k-9`Pe@r,RpF(KD"$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quE"C1D'gF)to6
+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)HTE?*+DPh*Anc'mEs`7L67sBjDes6$@rri:@<-(#F`S[B
@:O=r+EM%5BlJ08$7Bk(+EMR5-TsL51a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%@<-4++DPh*F`V,7
@rH6sBkLm`CF9H;HS-Ks+EMR5.6T^7HTE?*+EMR5$49Np/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%
$:[T\78l?1+=Lu7CghC+ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a07S-9B;a!/a-p1*t6q9gJ
8l%iH8lJPP<(JG\/1)u5+@\pr78jOI4DJeFA79R&+<VdL+D,h<Blmo/4"u"N8PDQO$8=SWDe*p2
DfTE"@<<W(GB.D>AKX&hHU^S#78jOI4DJeFA8bpf@<<V7+D,h<Blmo/4#2.P8PDQO$8=SWDe*]n
CLq$bF<D]<GB.D>AKX&jHU^S#78jOI4DJeFF`_>6A79R&+D,h<Blmo/4#D:R8PDQO$8=SWDe*s.
DesK*@<<W(GB.D>AKX&lHU^S#78jOI4DJeFDf0)oF<D\K+D,h<Blmo/4#VFT8PDQO$8=SWDe*g-
De<^"AKW+-GB.D>AKX&nHU^S#78jOI4DJeFE+*d(F!)SJ+D,h<Blmo/4#hRV8PDQO$8=SWDe+!3
ATD:!DJ!Tq@UX$p+D,h<Blmo/4#qXW8PDQO$4:ikDfp/@F`\`R@rH4$ASuU$A0>W*A8,e"+EM%5
BlJ08+E_X6@<?'k-OOp3Dfp/@F`\`u:II]E<(]qS8P2oX5u^A^$;No?+ED%7FDl22+E)41DBNJ(
@ruF'DIIR"ATJ2sA0>f/D]i7,1E^UH-RT6.@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&
?U6tDFE1f2BK8(5?OCI\F*)>@H"q8.1,fXLB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<O0H_qi=BJZ7$6UH#$6Uf@5p1&V
G9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FB
ATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$
F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1
Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7B
B4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+
%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nn
DBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W
?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7
D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\^:%13OO,9nEU0J5@<3B&`:
/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7
E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`J
E,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&
FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+
@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N
+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*
+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S
+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdS
Eap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-
+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4
+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&
@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6
+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[
F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&
E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+
FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeK
Bl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;s
AS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0
@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$
+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.
FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;
A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.
+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."
Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#
EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#
+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6
DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk
+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ
9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$
+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr
<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKr
ATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9
AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53
Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G
$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57
B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u
+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'
ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89
-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj
+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0
?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2?
?k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'
Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%
+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<
%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/
%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e
,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h
+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"
Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C
+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'
+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+
G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.
@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'
DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$
F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7
Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(e
FCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_Soa
A9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2
$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7
EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\
A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H
%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2
+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>
D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+
BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!
ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'
0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pA
DJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0
EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k
9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&
F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]Tu
Eb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7
E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(
F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+
:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5
Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=
+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#
+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q
@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'm
F"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL
+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6
Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE
@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3
F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&
@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO
=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;
F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;
E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LG
Bm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)
+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-
E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR
?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:g
B4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9A
Eag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s
/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0
$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb
$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3
?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu
+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/
+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,dd
FCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL
+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8
@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%
+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555
C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWn
Ec6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3
F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu
0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW
:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(
H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.
C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5
+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o
04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1
A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2
+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;
+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>
+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb
%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8
BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj
+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA
7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<
DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@
DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6
@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19
F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!
Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jG
F*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,
E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=
Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2
AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=
D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6
%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7
EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8
%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-
EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).
F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#
+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,du
AKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj
/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!
?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1
+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(
C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm
+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/
A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]Ld
ATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$
+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6
/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E.
/iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.
@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF
+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO
+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH6
78Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!
Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%
%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XTo
AKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj
0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:Njk
Eb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)
Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>
/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&
%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(
Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5
ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m
:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6
DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWj
Dfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"
F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79Ro
DJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E
%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$
De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*l
Df-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX
6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;m
FCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!
$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1
%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE
@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8
AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4
Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5
+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lF
F>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"
ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*
Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOt
AISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35
%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0
+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/
+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&
?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO
+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>d
BPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rm
ARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH6
8l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7
C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeN
DfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1
De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(
A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=
BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,
B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A
@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#
+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!
@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2
+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh
+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q
7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi
:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J
3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>
F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'
ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30
BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et
+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7
DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh
+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht
9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhD
F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARloo
H!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(n
DJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<
;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho
@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&
A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4
+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%Nn
G:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0
+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b
/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LA
B4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-
0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.
F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:Wag
AoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6
ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+
EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO
+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./Kdbr
Gp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^Z
ATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%
ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]
F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*
DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoC
E+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(
+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8.
/o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@H"q8.
A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?
G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhn
FC65"DIaktE-681+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?
ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%
E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=)
,9SZm3A*<N0d&%j9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0
CCLU[$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n
+EMgGFCBD:A8bt#D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1
%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!
+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:
/NGaC.1HUn$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]u
D.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO
,9nEU0J5@<3AVd0+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3l
G%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9
+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9
+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#
,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!
+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9
ARlp*D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[0
0.@>;%14=),9SZm3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:
F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%
+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''
@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu
@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)
@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!
FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/
B4W_F%144#+D>2)+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7
DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aM
Bln#2FD,5.%144#+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qB
BPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))
F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr
-Z^D@Bl[cpFDl26ATKI5$6TcbD..3k6=FqL@nKNb<+U,mF##IF67sa)@;BF@@<6-m8l%iSATMs7
+EK+d+DkP&AKXT@6m,rIF(o,,FCfN8+EM%5BlJ/H%15is/e&._67sB[BPDN1F(96)E-*48ASu("
@<?(%+CQC6@rc:&F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=7@<6-m%15is/g,7IF*)IU+B3#c
+D58'ATD4$ARlo+F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-
F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/e&._67r]S:-pQU
<+ohc+EM7CAKW*<De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(
Gmt*U67sB/<(0_b6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-
AS#Cn+EV:.%15is/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6
$;No?%15is/g+SDF*2>2F#ja;:-pQU+<V+#:-pQU+<WBf+@.,[Df00$B6A6+A0=JeA8-'q@ruX0
Gp%Q.:IJ/N;cF25:-pQB$;No?+Eh=:@UX@mD)re]D]j1DAKYN%3XlEk67r]S:-pQU+<XEG/g+e<
DImisFCcS9@rc:&F:ARP67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU
+<Y]A+=D#7CLoh@F(o,V:IJ/nF*)IN%15is/g(T1:-pQU+<XEG/g,1WDBNY8%15is/g)8Z-nlf*
1+=>.C2dU'BHS[O8l%iS78m/=6=FqL@nKNb<+U,mF"V0AF!hD(:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbRjY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,
F(H^.$>aWhA0<77De*s$F*(u6-OgE"@;BFQD/X3$8l%iSATMs71,2Nj/h1^HCLpF]DeioV:IJ/n
F*)IGF"JsdD..3k+A,Et+EMC<CLnW1ATMr9F(96)E-*]>:-pQ?:-pQU<+oue+EM%5BlJ/:B4Ysl
Eaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%htF)>i2AI;1!/g,7IF*)IU+B3#c
+D58'ATD4$ARlo+F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+
ALSa<De!3lAKZ22FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC$;No?$;No?+B3#c
+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U
67sB/<(0_b6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn
+EV:.$;No?+Du==@V'R&De:,6ATMs7+DG^9FD,5.-u*[2F)>i2ATVL)FE8lRF*22=AM+<b67rU?
67sBhF)uJ@ATKm>:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
$;No?+CfG'@<?'k3Zp130f<]gCbRjV:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$>aWhA0<77De*s$
F*(u6-OO^!DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]
ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrE/ibOE3%u]h$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>
@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A
%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARl
De*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*
F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[
%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9H
A7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`
F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXs*2D?j.
C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%
%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bq
Ec5T2@;TjqDJ()6Df9GE+A,Et+DGm>%16MdGAhM4+E):7ASuU$A0>DkFCAWeF(HJ+DfQt/Cht59
H#R>9+E(j78g&%]C1UmsF"SS-:IH<7$?L?/E,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=h
F!+n/A0>i3Dg#i*ATJu9Df9H5+D,P4+:SZgDe!p,ASuU(DJ()#DIal3ATMs-DJ((a+Cf>#AM,)7
$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<%15pPBlA#7
G%G]8Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/
%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6
@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")
FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=
AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O
:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIj
B5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UH
AKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E9
05>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'
3XlE=+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM4K".1HW$
@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht6uQRX
D.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE2_ufj$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y
3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi
05>E9/oY?5%14Nn$;s;d76sj@4ZX]5C,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jk-d
$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!
A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@
6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4
F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*
C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)
6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZU63A*<O0II;::eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$K
C3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^
78--9;aii1-YbOn0d(3h0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!0:%15Kl:dn,I;a!/a0H`D!
0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#
+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,
ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'
EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6
DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)
+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s
$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t
@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,
Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+Ad)mDfQs0$?g!$F(oQ1F!,C5+A*bn@;BEs-u*@.
Ch7Z:+CTG%Bl%3eCh4`$Ec5e;F*VhKASiQ2@rc:&FE9&D$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"
ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=
BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(
D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH
+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'n
DfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"C
F`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("
@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%
@:s-o@<=O>$6UH#$6UH6BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)
%14Nn$3                                                                   ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o0d&>/+>Get1,^702]sk6@WcC$A86$nBkh^3E+EC!ATJu(Df'?&DKKH#+DPh*Bkh]3
F(96)E--.DBl5&.De*KpF<G+.Eb/a&DfU,?@;BF@@<6-m8l%iSATMs7D..3k+A,Et+C\c#Bk&9-
ATMr9F(96)E-,r*CLpF]DeioV:IJ/nF*)J?@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&F8       ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ER'
zz=:zz,'R004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR013'
zz=:zz,' ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR'
zz=:zz,'023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GROUP HTML'
zz=:zz,' IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILES JDSDI'
zz=:zz,'RS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVERSION LA'
zz=:zz,'TEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NVTA'
zz=:zz,'BLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK0'
zz=:zz,'09 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK R'
zz=:zz,'EFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML afterstr'
zz=:zz,' alltrim badappend badblia badbu badcl badfl badil badjr badlocn ba'
zz=:zz,'dobj badrc badreps badsts badunique beforestr bget bnl boxopen catr'
zz=:zz,'efs cd changestr checknames checknttab checknttab2 createjod create'
zz=:zz,'mast ctl datefrnum dblquote decomm defzface del destroyjod did didn'
zz=:zz,'um dnl dpset dptable empdnl fex firstone fod fopix gdeps get global'
zz=:zz,'s globs grp gsmakeq guids guidsx host hostsep isempty islocref japp'
zz=:zz,'end jcr jcreate jderr jdmasterr jnfrblcl jodsystempath jpathsep jre'
zz=:zz,'ad jreplace justdrv justpath jvn lfcrtrim locsfx make makedir markm'
zz=:zz,'ast mubmark nc newd nlargs now nowfd obidfile od ok packd plt put q'
zz=:zz,'uote read readnoun readobid regd remast restd rv saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;'
zz=:zz,'._1 '' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN D'
zz=:zz,'IRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR'
zz=:zz,'205 ERR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 '
zz=:zz,'OK201 REFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyfile'
zz=:zz,'s createdl dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall drop'
zz=:zz,'bakdir dropdir dropinv dropnc dropref gettstamps justdrvpath libsta'
zz=:zz,'tus loadbakdir loaddir loadnc loadref loadstamps maxback movefile n'
zz=:zz,'ummask packdict packspace puttstamps renamefiles restdict restspace'
zz=:zz,' savedir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake'
zz=:zz,' DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPTAG ERR0150 ERR0151 ERR015'
zz=:zz,'2 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 E'
zz=:zz,'XPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORT'
zz=:zz,'CHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btcl'
zz=:zz,'frcl clearso clfrbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dum'
zz=:zz,'pheader dumpntstamps dumptext dumptm dumptrailer dumpwords extscope'
zz=:zz,'s fap fmtdumptext fromascii85 getallts getascii85 halfbits htclip j'
zz=:zz,'nb jscript jscriptdefs makedump makegs masknb namecats nlfrrle noun'
zz=:zz,'lrep opaqnames parsecode putallts rlefrnl sexpin sonl tabit toascii'
zz=:zz,'85 uqtsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jods'
zz=:zz,'tore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNM'
zz=:zz,'ARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ER'
zz=:zz,'R052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061'
zz=:zz,' ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR'
zz=:zz,'071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 '
zz=:zz,'ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR0'
zz=:zz,'91 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 E'
zz=:zz,'RR101 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET O'
zz=:zz,'K050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK'
zz=:zz,'062 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnl'
zz=:zz,'pfx allnlsfx apptable appwords badcn bnlsearch bnums checkntstamp c'
zz=:zz,'heckopen checkpath checkput closedict createst defwords delstuff de'
zz=:zz,'lwordrefs didstats dnlsearch freedisk freedisklinux freediskmac fre'
zz=:zz,'ediskwin fullmonty getdicdoc getdocument getexplain getgstext getnt'
zz=:zz,'stamp getobjects getrefs gslistnl inputdict invappend invdelete inv'
zz=:zz,'fetch invreplace islib iswriteable iswriteablelinux iswriteablewin '
zz=:zz,'jdatcreate jwordscreate loadalldirs loadallrefs loadwords mainddir '
zz=:zz,'newdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx o'
zz=:zz,'pendict pathnl pathref putdicdoc putexplain putgs putntstamp puttab'
zz=:zz,'le puttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnu'
zz=:zz,'b''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 '
zz=:zz,'ERR00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROU'
zz=:zz,'PSUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 O'
zz=:zz,'K00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTU'
zz=:zz,'B WARNING00400 WORDTESTS addgrp addloadscript addloadscript1 allnam'
zz=:zz,'es allrefs betweenidx createjodtools dayage delgrp firstcomment fir'
zz=:zz,'stperiod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw o'
zz=:zz,'bnames onlycomments pr refnames revonex today todayno updatepublic '
zz=:zz,'usedby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDM'
zz=:zz,'ARK CWSONLY DOCUMENTMARKS DYADMARK EDTEMP ERR0250 ERR0251 ERR0252 E'
zz=:zz,'RR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinter'
zz=:zz,'face MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK025'
zz=:zz,'1 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCR'
zz=:zz,'IPTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj c'
zz=:zz,'reateut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 d'
zz=:zz,'octext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfre'
zz=:zz,'ader qt reb revo rm rtt textform2''                                 '
zz=:5260{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`-1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+APL&:c]_.@:O(qE$0%,D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN
@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ
67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$
F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u
+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGF
F<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k
+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]Tu
F*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*
$;No?+<VeDDJUF<+<Ve%8PN#B+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlom
Gp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX
6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,
Eb-@@C1_0rATJu7AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R"
;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hV$;EfR;GU7p:dmN.8lJ)T
8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q:ha%15is/g,(AC1Ums+Cf>#
ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=
@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!
@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H
:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhs
Ch[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W
7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA
@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk
-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&
-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:
EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j
:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@
@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=r
A93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA7TUf
:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA92j2
Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"
ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q
@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)
@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'
F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;
An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8Z
A8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(
GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL
+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs
%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL
+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#
Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+DIal+@<6O0F`\a:@<?''FD5T'
F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F%15is/g)8ZCi<`mDIXe3+<VdL
Ci<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeCDdd0sAS*&-+<VeCDdd0!Eb/io
Eb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-E,uHq:-pQU+<YW3@r#Uh@rrh9
+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&F!+m6@UWb^F`7cs:-pQU+<YW3
@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@@:NjX$;No?+<VeGF`__HFCB$*
F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67FFD5T'F*(i-E,uHq:-pQU+<Y]9
F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#Uh@rs./
$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4Eb0<6DfTD3F)YPtAISuA67sB'
+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&AS*&-+<VeJ@<Q3)Eb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IJ`3@N]]"DJ*N'1,(C6
1,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.A92j2Eb-U-$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o%15is/g+\=Eb/a&DfU+GDJsZ8
+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]-
%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(D..O.ATDi$$:Iil8Q\>T4ZY\e
/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=
Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&+FH3m6qL9O9iE/c-8%J8+@K1-
8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/F`&=>@;TRs%15Kp;GKSB3]oJV
?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#C1UmsEt&IE8Q&GU:-CX#4"akp
+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5
DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN+AtWt6V]!X4ZX]J+u(3f3Zpg^
;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7De*]nCLp7-/g)WYDe*]nCLnVu
/M/)d@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._
67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:
Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]Li
H$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\
+Du+?DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is
/g)8ZD..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0
Gmt*U67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE
@;TRc@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL
+E2IFF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeN
DfTA2@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs
+D,Y4D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k
+ECn.B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;
67s`uAT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is
/g,7EB6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K)
.X`ZR$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0
BFP;M;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m
+E(_(ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)
+ED%&F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;
-Qm&BE$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"
EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56
Bl5&8BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A
9LUK[-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1
+EV:*F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng
4ZXr5E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1
Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?
D.7'sARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX
<'a"`$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl
+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!
CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(
ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'
@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\
3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dAF!,C?ASqqa:-pQU
+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!Df0!(Gp%'7FD)*j
:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!+m6E-67F
A8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<Y07
ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+Ap806A9/k9+<Ve;
AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu:-pQU+<Y3/A92j$
FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%D@HqJ67sB'+CoA+
F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"F_t]-F<D]=ATT&5
@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=AKZ&(EbTK7+EV1>
F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1
@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*AS-!++<VdL+D58-
+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/DIIBn+Dbb5FE7lu
:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gmt*U67sB'
+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#ATVK++<Ve;ASbq"
AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9ARloo@<>oe$;No?
+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4AS5Of@rrh9+CfG'
@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9+<VeFE+No0@3B)p
@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is/g)8ZE-686G]7J-
Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688F!)SJ+<VdL+EMXC
Eb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2@;TR,+CfG'@<?4%
DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`IDfTD3-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<+<VdL+EMXCEb-A3
@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'+E2IFGAhM4F!)SJ
+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/@UX'qEb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2DfTD3Ea`iuAKWZa
0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P90G<i+<VdL+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H;cGn@1a!n`+<Ve%
67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO:fBM<2'="a+<XEG
/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO:-pQUD..-r+Co2,
ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^/430":JFYa%13OO
6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4rF)rIBEZf4-@rcK1
FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,C1Ums+Eq78+D,>.
F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$D/aE2ASuTN+EM47
Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr6IF*&OHBl.E(
DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cmDf'H3DIm^-+EV%$
Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h+E1b2BHSlL-tI%&
DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKXH=\4;Afu#$C1Ums
+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(Bl%?'@rH4'Df0-(
FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%8PW;b<Cp.Y;a!/a
8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/rCh4`!Df'H3DIm^-
Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F
%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&@1<Q8:0(=_;cH[Y
3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO:-pQUFE2)4+ED1/BQP@F
FE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY
/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(FDl)6F&#%S.V`m4
FDl)6F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB
$;No?+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5
E%c9TBlmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat
@;TRs+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(
ARfh'+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D
+ED%1Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-
E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Ve;Ble60@<iu6DJX$)AKXT@6m-/SCiCL>+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD
@;BEsCi<`m+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/
G]4cJ+<Y]9FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL
+D58-F!,@/D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+
8l%ht@rH7.ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9
EHPh8F)Q)@ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL
+<VdL+<VdL+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4J
Ed8d@@;]V$+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8
F)Q)@ARlp(AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1Ums
F!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJ
DfTA2AU&01@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE
<(pF;@ps1i+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41
F)tc&ATJtBC2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcm
Eb$;:BPDR"F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!
C2[X*FD5Pd67sB1C2[X*FD5P6@kB8T@3B&uCi!ZmFD5Z2+E(j78l%htF`_>6BlnVCGAhM4F#kFT
G][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu&+EM+9+E(j7
BOPdhGp%6OBl%L*ATJu9BOQ!*F`V+:FD,5.@rHC!%15is/g+b7@qfanFD5<-+E(j78l%htFDi:@
ATDC$Ebuq@@<64*+E(j7B4YslEa`c,F`V+:FDi9o+E2@>B6%EtD.Ra//e&._67r]S:-pQU8T&W]
Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z@rH4'C*4WA+D#e>Eb0*!+Cf>,E,oN2F(oQ1+E(j7
A8,OqBl@ltEd8dODfTB0%15is/g)8ZA7Zl++<VdL+CoM2E$/_4Ec5t@@rGmh+D,Y4D'2GH6m-M]
F*2;@Et&IO67sB'+Co2-E$-8G+<Y3/F)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'%15is/g)8ZA8bs#
+<VdL+D,P4D..N/@rH4$ASuU2+DG^9GAhM4F!+n/A0>E$@s)X"DKKq/$;No?+<Ve<A0<!;+<VdL
ARoLs+E(_(ARfh'+D,Y4D'2GH6k'Ju67sB'+D#X;+<VdL+<Y6+BlkJ>AU&;+$;No?+<Ve>F<D\K
+<VdLB4Z0-FCf]=+E)CE+E(j7ARoLs+EqO;A8c[5%15is/g)8ZEb0E4+<VdL+Dbb5F<GU8@qBP"
Cj@.DAThd/ARlp%@VTIaFE7lu:-pQU+<Y]A+<VdL+<VeIF`&==@:O=rEt&IO67sB'+EDRG+<VdL
+<Y]IDBO%0F`_P<DeF><FCfN8Et&IO67sB'+DPh*BOu"!+<Y-6Dg-86+AbHq+E).6Bl7K)BOu"!
%15is/e&._67sBUDffQ33XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'
0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,!F/KeS8E+NotASuT4GAhM4F!(o!%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4
+CT>4F_t]2%15C";cQO\;b]PU90G<`@<6L4D.RcL-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@<H[*DfQ9o5uglT:JsnQ;G0/6-Xh.>BQ%oP-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@rc-hFCetl$:@][5u^9@9gMZM4ZXs#Eb/[$ARmhL%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt2H!t5+BQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f6s2fD9gMZM4ZXs$H!t5E-OgCl$;No?
+CoD#F_t]-FCB9*Df-\7@<--+AoD]4D/X<#A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15g*:-h9B
5uL?=3[\c_DII':-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4G%G]'@<?4#%16-);F3ZK
8PMoF;G0/6-[''A@UX@mD)s$R$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfC@Dfd+GDfTB0
%16!/:K1Ck;FFGX5uL?=3[\rdDfg2AEb'5P-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<-.)+>"^H
AT23uA9/l3DBNk>BOu3,D..I#Et&IE:IA,V78?fV5uL?S4ZX]O;c?[j78loH;G0);<E)Lb;GBGT
905L=76smA6qosF905OE5t"F5;G0)G:JO2D9gMZM4'"dJ6:"RB9hdoO906$I:K1Ck;FFGX5uL>b
$4R>;67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuTN+DPh*+<`-_.6T:+A7B@pF`2A5
+:SZtF?MZ-?!q2PCiOT9FCd]i8OccQ:(7O>$;No?.V3L.A7]^kDId<rFE7lu              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.3+>P&q+>Pes2BXh8+?(E#1E\Y"1b^%3+>bks2]st6C2[X"@;0U%8l%htA8,OqBl@ltEd8d;
CghC+C2[WnDdm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3
F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u
+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a
:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2Bl@l3De:+?C2[W3                             ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 compjBasic delBasic001 dpsetBasi'
zz=:zz,'c01 globsBasic001 grplitBasic01 putNameTimestampsBasic00 restdBasic'
zz=:zz,'01''),(<(<''jodcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._'
zz=:zz,'1 '' jodsmoketests didSmoke00''),<(<''jodstresstests''),<0$a:          '
zz=:258{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o1E\D-1c9#dA7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPk
F(o,,8l%htFCfN8F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MW
ATMs.De(ON+CT.u+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/
:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z
1+==oC2[X)ATMs)E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@lt
EbT*+3ZrKTAKZ)+F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sC$F`&=GBln#L
%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn:-pQU+<YT5+?MV3C2[WnATf22De'u5
FD5Q4-QjNS%15is/g)8Z1E^^[F<DrGDe*<cF(o-+ATMs7-OgDX67r]S:-pQU@rc-hFCeuD+>PW)
2f<PW1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@:Wn[A0<:<Dffo:AStIYF*)IW0JP"!FDi:CF_Pr/
%15is/g)i,A7]7*1*C"9A7]9o-tI439jqOPDcC:mFE8lRFDi:CF_Pr/+>"^878m/g5tt'B;E[&p
%15is/g)i,A7]7*3?T_\Bk0P=F(o,<0JP"!@:Wn[A.8l@67sB73,`;K0K1+rF`MA6DJ()1DBO.:
Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FGATMs7%15is/g)l'DJs\Q3$<?_A79RkA0>K&
EZdtM6m+093A*-=+EV19FD5W*%15is/g)l(C3=>H2'?UME,ol?AKZ#9DBNY2F*)GF@ruF'DK?6o
%15is/h1CCE+NotASuU2+>"^XATMr9De:+?B4PRmF"&5DDfQtAF_Pr/+D>=pA7]cj$<0Gm<)>kY
9e\:b3\V!M<(0_b=[>bV78c90<(0_b:dIuR0JO[m+<Ve%67sC%ATT&:D]gbWAoD]4@;Ka&D.Rd0
@:s.m%15is/h1FMA7T7jASu$iDKKq/$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''-u*[2FCfN8
ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>+0RGSuDe't<-QjNS+<VdL+<XEG/g+Y?Df]J4@;^?5
DfB9*+Co1rFD5Z2@<-'nEt&I?0RI_K+=D8BF*)/8A2#AR+<XEG/g,(OASrW3FCB&t@<,m$;FNl>
=&MUh73F"#ATMs.De(ON%13OO-oiG31bgF%0d%T667sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5
Bl@l3Df-!k%13OO                                                           ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1E\M4+>GYp1c?I21E\P6+>GYp2)$.-1a"Y0C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7
+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7@rc^5BHVD.F*)IG
/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A8G[pB4Z0rF*)J>@<-!l+D,1nF(o*"
AKZ)+F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W2pF`\a<ARTXo@VfTuA79RgC2[X(D/X3$FCfN8F)u2:
CLnW1ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'6+De*p2Eb0<5FCfN8
F)uGDATMo8FCfN8F!*%WFCfN8F!,[@FD)e5@<-!l+EVNEG%G]>+DbJ,B4W2r@<>o          ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&n+>GZ41hpr>A7]p,/KdY]6m-#OG%GK.E,B0(F:AR?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>MC2[WnAThH(BlbD=BOr;Y:IH=9AThX$DfBQ)DKI!NE-67FA8,OqBl@ltEd98e>@'$i
%15[K+DGm>FD,5.Anc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+E(j78l%ha$=e!bAKYMt@ruF'
DIIR"ATKI5$4R=b+<VdL+<VdL+<Y3/A0<QK+:SZ#+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$6UH6+<VdL+FGnkC2[WnATiH9De+6<FD5Q4HjpE*+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$4R>ABPDN1E+*j%+DGm>FEqh>@ps0rDe:+a:IH=9AThX$DfBQ)DKIKR:1\Vl@;]Tb$?g?(@<?4"
AKYK$A7ZltF!,OGDfTE"+DG^9@3@%=F`\a:ATfOGA8,OqBl@ltEd98H$;GGZAKZ&9@:F%a+EMgL
FCf;3@rGmh+DGm>AoDg0A0>T(+<k?-AT24$+s:<7@q]S"@;I%q$=mj\FD5Z2@<-'nF!+n/A0>Ju
DII?tGp$U8D/F3/+D58'ATDKp+E_d?Ch\!*ATJ:fFCfK0Bl7@$AKZ).AKYr#FD*99$4R>ABPDN1
@<-BsDJ*NtASuT4@WH1#B6,24@;^?5@V'FgAnc@./g*_t+F.mJ+D#(tF:ARc+EqaEA0>u-@<<W+
F!,")Anc-oA0>DoAT24$+E)-?FD,5.E+*j%+EV:.+:SZrEbT0#DII?(GAhM4+DGm>Eb0?$Bl7Km
+=_MO@q]:gB4YU+.Nh-%D/aPI+:SZe@:O(qE-!.1DIal1AM%q6An?!oDI[BuB-;,3ATD4$Bl@m1
+CT;%+Dl72BHUnqF*(u6%16Nb+EV:.Gp$O9AKZ28EbfB,B-;D4FD)e5ATMo8D..NtEbSru/g*Gt
A1Sj;AfqNiH#IgJF(KG9@;Ka&@Wcc8FD,5.E-67FA8,OqBl@ltEd8d8;FNl>:JOSd?n<FGDflKr
E,oN5ASuT4@:Ne]A7]Y#@;I&rBOPdkATJu9D]j+C@:F%a+Cf>#AM+E!%16'JAKYMt@ruF'DIIR2
+CoV3E-!.0C2[WnAThH4+CJr&A7-NgDIaktF`_>6F'oFaA8-+,EbT!*FCeu*@X0)<BOr;oC2[X(
Dfp)1ARHWhA7TUr+D>2,AKYo#C1Ums%172kD.Rd1@;Tt)+EVaHDIm?$De<T(FDi:BARopnAKYT!
Ch4`1BmO>C%16-IEcYr5DK?qEBln#2DdmHm@rri8Bl.F&FCB$*F!+n3AKYE)@;0Od@VfTu%17#k
+@g-f89JAaF(JoD%13OO0eOSQ?tsUjA7]pl>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl05Y-=FCfJGC2[WnATf\?C3(g5$4R=t/g+A+C2[Wj>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGC2[W8Bkh]<%13OO1G0eS@!-R*Ci`ui
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A
.1HUn$4R>H?85_H+B3#c+D,>.F*&O8Bk)7!Df0!(Gp%$C+CQBb:IH=E@<?0*BlbD,@;KakA0;<g
+<VdL+<Yc>AKWIAF`\a:Bk)7!Df0!(GqLQ                                        ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql!,8l%ihDKKH1Amo1\+A$lO:IJo7FCfK)@:NkI<'a8I5uL)n8U=!)7!*?c
Ci^^jH:gt$F`_>8FCfK)@:Njk8l%iS:JXY_<_Yt)8l%iU9gg+"6:OsR6U=[?+AY<n<Du7P:/i?3
6:OsR6Vp6S+B1d.<*;L]9gqr&@V97o+Cf>,E,oN2F(uh-Eb/[$ASQ-o+D58-DKKrA@;Ts+ChFl,
Ddd1#DfTB0+E2IF@;Kb%F!,L?+EDRG-RgSp4?P\X?SNZN+Cf>,E,&<gDeio<0HakDD/a5gD/X3$
0JO\\Bk1.ZDeio<0HanDCf>1hCLo1R+E_X6@<?'qDe*BmF*)G:@Wcd,Df-pO/1<VC4"akp+=A:H
De'u*De*Bs@N]E(A8PajAKY`+A92j2Eb-A.De*s.DesJ;C2[X*FD5P=.4cl04?G0&0d%hdC2[Wl
@<6-mFCfN8F!,49A7KY&F(fZ,F*)IGC2[X!@<-!lFCfN8F!,49A92U+CLqU!F*)IGC2[X(FE1r6
F*(u7FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<@WcC$
A86$nBkh]3BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DkP&AO9gHBk'b26r[`=FE8RA@;BFQD/X3$
8l%iSATMs7+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A@q@#:
/1<V9+>Gl%1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_m3B2DmKM3AifQ3?U(20f:XD0JY7=1H.'D
1cRBK+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1[@/iGLE1,:XB0Jjn-0JPF=2_[!>2D[9I0f:aE
2]sk00f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK1bpd.1,(F?0K1^F/i,IA3B8oM2_lL2
0JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,LUA1,:RA2`WZS+>PW*2)$sD2_HmG2)@6N1-%<:1,(F?
0K1aC/i5LB1GpsD2)HF20JPF=2_[-B1c.'G3ANTP0d&5*0f:XD0fL^A2)[HQ3AEBM+>PW*2)$sE
1G1LA1H%*N1c.'41,(F?0K1[@/iGOB1c$pA2E2g70JPF=2_d6D2)7*N2Dm0J+>PW*2)$sD2_HsC
2`3BO1c7*41,(F?0K1aD/iGRI2DdBR1H$@20JPF=2_m3B2DmKM3AifQ3?U(20f:XD1,LUA2*!QO
3&rcQ+>PW*2)$sE1bL[D3Ar]R3AWQ91,(F?0K1aD/iGRI2DmEP1GU(.0JPF=2_m3B2DmKQ1c[HL
3?U(20f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK1bpd.1,(F?0K1^F/i,IA3B8oM2_lL2
0JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,LUA2)$sL0JY@B+>PW*2)$sD2_HpA2E3TQ1-%371,(F?
0K1aC/i5LB1GpsD2)HF20JPF=2_[-B1c.'G3ANTP0d&5*0f:XD0fL^A2)[HQ3AEBM+>PW*2)$sE
1G1LA1H%*N1c.'41,(F?0K1[@/iGOB1c$pA2E2g70JPF=2_m*?1c@9H1,h-J0d&5*0f:XD0fL^B
1,h'H3A`TM.4cl01*AG"1,(F?0K1^F/i5@>3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0f:XD
0KCaC1GCdG1GUsM+>PW*2)$sE0J5:A1G_$N2Dd<71,(F?0K1^D/i5:C0JtjM0f'q-0JPF=2_d6D
1c7-K0JtjM1a"P-0f:XD1,:I=3&*3J2*!BJ+>PW*2)$sC3A*0F1bggI0JGC-1,(F?0K1a@/iYOF
3&*0H0Jst.0JPF=2_d0B1bh!E2*!WN1FXk'4>J$;,Vh&.2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D
/i5FA1-%*M2)-4/0JPF=2_[-B1c@0E0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE
2D@$K1Gq*61,(F?0K1[D/i5IF0f^sB2`Mp80JPF=2_m3B2Dm0K2*!BM3?U(20f:XD0K(O?2)@!J
1-%3H+>PW*2)$sC2D-gE1b^X@0JYR01,(F?0K1[D/i5CC2D[$G1,g=20JPF=2_[-B1c@6G2E3KM
2]sk00f:XD0fL^A0f(aD1,C^E.4cl01*AG"1,(F?0K1[G/i5FE0fUsF2)cX50JPF=2_[6E1c7*H
0JYXE3$9t10f:XD0KCaB2)I!I1c[QV+>PW*2)$sC3A*-G1H@6K2`3E71,(F?0K1[G/i5FB1,(^B
2DZI20JPF=2_[6E2)@$D2`E]R3$9t10f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH3B9)B
1,(F?0K1[G/i>FC2)7*G2E;m80JPF=2_[6E1c7*F0KCgF1FXk'4>J$60I/D-0f:XD0JY7=1H.'E
1GCgD+>PW*2)$sC1+kI@2_m-F1H@H<1,(F?0K1aA/iG[D1c%'L2`W!90JPF=2_[$?3B/uU3&E?I
1E\G,0f:XD0Jb=A3B&iO0ebI?+>PW*2)$sD0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g7
0JPF=2_[!>2D[9I0f1mM3$9t10f:XD0JY7=1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPF=
2_m3B2DmKQ2)[9J2BXb/0f:XD1,LUA2*!QP3&W]<1,(F?0K1aA/iG[D3&iZO2'=Y.0f:XD0fL^B
3AEHO3&roP+>PW*2)$sC1G1[J2`<EG0JtU.1,(F?0K1^?/i5@<1,(OC1bg+.0JPF=2_d!=1bgmG
0JbOF2'=Y.0f:XD1,LUA2*!QO3A<-C+>PW*2)$sE1bL[D3Ar]S0K(^01,(F?0K1aD/iGRI2DdEJ
1bgF1-p014/1<V7.4cl00I\P$4>8384>6                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
