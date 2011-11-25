NB. JOD dictionary dump: 25 Nov 2011 14:42:50
NB. Generated with JOD version; 0.9.4; 13; 25 Nov 2011 12:18:18

NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|231095660428535070795580909681989140332|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


ASCII85=:0

BYTE=:26

DUMPMSG3=:'NB. Generated with JOD version'

DUMPTAG=:' NB.{*JOD*}'

ERR0261=:'macro is not a J script - not formatted'

ERR0262=:'not supported on current J system'

ERR027=:'unable to set master parameters ->'

ERR065=:'not enough space on drive/volume ->'

ERR096=:'linux/unix dictionary paths must be / rooted ->'

ERR210=:'unable to copy/move/rename files - shell messages ->'

IFWIN=:1

IzJODinterface=:<;._1 ' del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mg mj mls mt noexp notgrp nt nw obnames pr refnames revonex swex tt usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.4';7;'25 Nov 2011 12:18:19'

JODVMD=:'0.9.4';13;'25 Nov 2011 12:18:18'

NEWDOCURLS=:2 2$<;._1 ' uses https://docs.google.com/document/d/1BOqiuA3ngVYLsjgclYPM4lmpe5PtOya9afEveoHF9_U/edit?hl=en_US# Jodindex https://docs.google.com/document/d/1si5rIsHqTpkKrqOa3UrXmjbyQnVzxDFHFadTFWmbl-Y/edit?hl=en_US#'

OK0256=:'jod.pdf not installed - starting browser for web version'

PATHSHOWDEL=:'/'

PDFURL=:'https://docs.google.com/viewer?a=v&pid=explorer&chrome=true&srcid=0B3hRbt360vl5Y2I0MDdlZGYtNTNiZi00YWU5LTlhYTctMGQzOTZjYjQ4OGVl&hl=en'

UNAME=:'Win'

URLPFX=:'https://docs.google.com/document/d/'

URLSUX=:'/edit?hl=en_US#'

UTF8=:28

WWW0=:'C:\Program Files\Internet Explorer\IEXPLORE.EXE'

WWW0linux=:'chromium-browser'

WWW1=:'c:\Program Files\Mozilla Firefox\firefox.exe'

WWWBROWSER=:'C:\Program Files\Internet Explorer\IEXPLORE.EXE'

test=:i.10

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


addloadscript=:4 : 0

NB.*addloadscript  v--  inserts  (mls)  generated   scripts  into
NB. startup.ijs.
NB.
NB. Changed: 08jun12 this verb was modifying the scripts.ijs file
NB. in the  J system tree. This file is now frequently updated by
NB. JAL so startup.ijs is now modified.
NB.
NB. Changed:  11feb02 j  7.01  introduced Public_j_  in place  of
NB. PUBLIC_j_  modified   to   use  new  noun.   Path  separation
NB. characters also standardized.
NB.
NB. dyad:  baPublic addloadscript (clGroup ; clPathGroup)


NB. standardize path separation character
y =. jpathsep&.> y

if. 1=x do.

  NB. get startup.ijs
  NB. J path utility !(*)=. jpath
  tags=. JODLOADSTART;JODLOADEND
  if. fex<cfg=. jpath '~config/startup.ijs' do.
    scripts=. read cfg
    'p c'=. tags betweenidx scripts
  else.
    NB. no startup.ijs
    p=. scripts=. ''
  end.

  if. 1=#p do.
    if. badrc ld=. (;p{c) addloadscript1 y do. ld return. else. ld=.>1{ld end.
    mlscfg=. toHOST ;(<ld) p} c
  elseif. 0=#p do.
    NB. no JOD load scripts append current
    ld=. (0{tags),(<LF,'buildpublic_j_ 0 : 0',LF),(0{y),(<'  '),(1{y),(<LF,')',LF),1{tags
    mlscfg=. toHOST scripts , (2#LF), WARNING00400 , LF , ;ld
  elseif.do.
    NB. errmsg: tag error in startup.ijs file
    (jderr ERR00401),<cfg return.
  end.

  NB. create/update startup.ijs
  if. _1 -: mlscfg (write :: _1:) cfg do.
    NB. errmsg: cannot write/create startup.ijs file
    (jderr ERR00402),<cfg return.
  end.

  NB. directly update public script noun if present
  y=.  y ,&.> '';IJS
  if.     wex <'Public_j_' do. Public_j_=: Public_j_ updatepublic y  NB. J 7.0x
  elseif. wex <'PUBLIC_j_' do. PUBLIC_j_=: PUBLIC_j_ updatepublic y  NB. J 6.0x
  end.

  ok OK00400;1{y  NB. okmsg: load script saved
elseif. 0=x do.
  ok OK00401;(1{y) ,&.> <IJS NB. okmsg: file saved
elseif.do.
  NB. errmsg: invalid make load script option (0 or 1)
  jderr ERR00403
end.
)

btclfrcl=:3 : 0

NB.*btclfrcl v-- inverse of clfrbtcl.
NB.
NB. monad:  btcl =. btclfrcl cl

NB. length of prefix
len=. ".(pos=. y i. ' '){. y
y=. (>:pos) }. y

NB. prefix and shape of bt
shp=. 2 {. pfx=. ". len {. y
pfx=. 2 }. pfx
tab=. len }. y

if. #tab do.
  zm=. 0<pfx
  bm=. 0 #~ #tab
  ri=. }:0,+/\zm#pfx
  bm=. 1 ri } bm
  shp $ zm #^:_1 bm <;.1 tab
else.
  shp$<''  NB. all nulls
end.
)

cbracbalance=:[: +/\ ('{' = ]) - '}' = ]

clfrbtcl=:3 : 0

NB.*clfrbtcl v-- btcl to encoded cl.
NB.
NB. This verb  converts a boxed table of character lists to a  cl
NB. representation that can be used  to recreate the boxed table.
NB. It  is used instead of (5!:5) for btcl as (5!:5)  generates a
NB. large  a.   index  representation  for  character  data  when
NB. selected "control" characters are present.
NB.
NB. monad:  cl =. clfrbtcl btcl

NB. shape and lengths of all char lists
sp=. $ y
lc=. , #&> y

NB. first number is length of prefix
pfx=. ":sp,lc
(":$pfx),' ',pfx, ;y
)

copyfiles=:4 : 0

NB.*copyfiles v-- copies OS files.
NB.
NB.
NB. dyad:  blclSource copyfiles blclTarget

if. IFWIN do.
  rc=.copyfile"1 x ,. y ,. <0
  NB. errmsg: unable to copy files
  if. *./0 <; {."1 rc do. OK else. (jderr ERR208),(15!:11)'' end.
else.
  NB. copy current dictionary files 
  NB. NOTE: assumes path file names that do not wreak linux (cp) command
  if. isempty rc=. host"1  > (<'cp ') ,&.> x ,&.> ' ' ,&.> y do. OK
  else.
    NB. result not empty probably some OS error
    NB. errmsg:  unable to copy/move/rename files - shell messages ->
    (jderr ERR210),<,rc
  end.
end.
)

createdl=:3 : 0

NB.*createdl v-- directory object creation verb.
NB.
NB. monad:  create bluu

NB. object nouns !(*)=. DIDNUM DNAME RPATH RW UF SYS WF LIBSTATUS

'username dpath readstatus dparms'=. y
DNAME=: ,>username  NB. user name for this dictionary
DIDNUM=: >1{dparms  NB. unique dictionary id number

NB. set master parameters first and then values specific
NB. to this dictionary - insures all master parms are defined
NB. (MASTERPARMS) is added to the "jod" class by (createjod)
({."1 MASTERPARMS)=: {:"1 MASTERPARMS   NB. !(*)=. MASTERPARMS
({.>{:dparms)=: {:>{:dparms

NB. is this a library?
LIBSTATUS=: islib dparms
RW=: (-.LIBSTATUS) * 1=readstatus  NB. open read status

NB. script, suite, macro, document, dump, backup directories
(DSUBDIRS)=: PARMDIRS{dparms

NB. full dictionary file names (without extensions) and pointers
NB. NOTE: the (dpath) does not have to match the paths of (DSUBDIRS)
(DFILES)=: uv=. dpath ,&.> JDFILES
(DFPTRS)=: uv

NB. dictionary directory - NIMP: provide some mechanism for
NB. decoupling the word directory from the main dictionary
SYS=: ((justdrv WF) ,':', justpath WF),PATHDEL

NB. tweak for UNC and rooted linux paths
SYS=: (':'={.SYS)}.SYS

NB. set dictionary's reference path
if. badjr rp=. jread UF;CNRPATH do. 0 else. 1 [ RPATH=: > rp end.
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
  NB. attempt execution of script
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

createjodtools=:3 : 0

NB.*createjodtools v-- initializes new jod tools object
NB.
NB. monad:  createjodtools blclObjects
NB.
NB.   JODtools_ijod_=: conew 'ajodtools'        NB. new tools object
NB.   createjodtools__JODtools JODtools,JODobj  NB. pass self and tools

NB. use JOD object reference to locate extant subobjects
NB. Note: currently these object references are not used
NB. but are defined so that native JOD words can be accessed
NB. by words in JODtools instances in future additions to this class
NB. !(*)=. ST MK UT SO
self=.0{y [ jod=.1{y
ST=:ST__jod
MK=:MK__jod
UT=:UT__jod
SO=:SO__jod

NB. append object reference to list of JOD extensions
NB. adding to this list allows (destroyjod) to destroy
NB. all JOD extension objects with JOD core objects
JODEXT__jod=: JODEXT__jod,self

NB. add tool words to overall JOD (ijod) locale interface
NB. (*)=. IZJODALL JODEXT
IZJODALL__jod=: IZJODALL__jod,IzJODtools,<'JODtools'

NB. define direct (ijod) locale interface for tools - if the (ijod)
NB. trap word (jodsf) exists define an error trapping interface
(i.0 0)"_ ".&.> self defzface IzJODtools
)

createmast=:3 : 0

NB.*createmast v-- creates the dictionary master file. The master
NB. file  holds  the  master dictionary  directory and dictionary
NB. parameters. The master file tracks the state of dictionaries.
NB. In  this  system  only  one   task  can   open  a  dictionary
NB. read/write. When  opening a  dictionary  the master  file  is
NB. checked to  determine  if  the  dictionary  has  been  opened
NB. read/write  by  another  task.  Dictionaries  can  be  opened
NB. read/only by any number of tasks.
NB.
NB. monad:  createmast clFile
NB.
NB.   createmast_ajod_  JMASTER_ajod_  NB. recreate master

fn=.  hostsep y
if. IFWIN do.
  syp=. PATHDEL ,~ (justdrv , ':'"_ , justpath) fn
else.
  syp=. PATHDEL ,~ justpath fn
end.

if. badappend jcreate fn do.
  jderr ERR011 NB. errmsg: error(s) creating dictionary master file
  return.
end.

fn=. jopen_jfiles_ fn
cn=. (<0;now '') jappend fn     NB. c0 use bit and last change
'jodversion jodbuildcnt'=. 2{.JODVMD
cn=. cn, (<jodversion;jodbuildcnt,didnum 0) jappend fn  NB. c1 version, build #, unique id
cn=. cn, (4 0$'') jappend fn    NB. c2 dictionary directory
cn=. cn, (4 0$'') jappend fn    NB. c3 directory backup
cn=. cn, (3#<'') jappend fn     NB. c4,c5,c6 RESERVED

NB. parse parameter settings --- sets (MASTERPARMS)
try.
  0!:0 <syp,PARMFILE
  parms=. <dptable MASTERPARMS    NB. created by 0!:0 !(*)=. MASTERPARMS
catchd.
  jclose_jfiles_ fn
  (jderr ERR027),<syp,PARMFILE return. 
end.

cn=. cn, parms jappend fn       NB. c7 active dictionary parameters
cn=. cn, parms jappend fn       NB. c8 active parameter backup
cn=. cn, parms jappend fn       NB. c9 default parameters
cn=. cn, (i.0) jappend fn       NB. c10 dictionary log
jclose_jfiles_ fn
if. 0 > <./cn do.
  jderr ERR011
else.
  ok {: cn  NB. return last component
end.
)

createut=:3 : 0

NB.*createut v-- initializes utility objects.
NB.
NB. monad:  createut blObrefs
NB.
NB.   createut__UT JOD;ST;MK;UT;<S0

NB. object references !(*)=. JOD ST MK UT SO
'JOD ST MK UT SO'=: y

NB. set shortnames !(*)=. SHORTNAMES
SHORTNAMES=: ,&.> <"0 [ 52 {. NAMEALPHA
SHORTNAMES=: SHORTNAMES -. ;:'m n x y u v'

NB. set browser 
WWWBROWSER=: setwwwbrowser 0

NB. add to overall jod interface
IZJODALL__JOD=: IZJODALL__JOD,IzJODutinterface

NB. define direct (ijod) locale interface for utilities
".&.> UT defzface IzJODutinterface
)

cuthref=:] {.~ [: >: 1 { [: I. 0 = cbracbalance

dec85=:3 : 0

NB.*dec85  v-- decodes ASCII85  (name,text)  and (name,code,text)
NB. tables.
NB.
NB. monad:  cl55=. dec85 cl

tab=. fromascii85 y
tab=. btclfrcl tab

NB. there are two types of tables in JOD (name,text) and (name,code,text)
assert. ({:$tab) e. 2 3

if. 3={:$tab do.
  NB. codes must be integers in JOD name,code,text tables
  codes=. <a:;1 
  val=. ".&.> codes { tab
  tab=. val codes } tab
end.

NB. put commands are expecting (5!:5) strings
5!:5 <'tab'
)

defzface=:4 : 0

NB.*defzface v-- define (ijod) interface from word list.
NB.
NB. dyad:  blcl =. clSuffix defzface blclWords

NB. if the top level error trap word exists
NB. define an error trapping interface
if. 3 = (4!:0) <'jodsf_ijod_' do. 
  iface=. (y ,&.> locsfx x) ,&.> <' :: jodsf'
else.
  iface=. y ,&.> locsfx x
end.
(y ,&.> <'_ijod_=:') ,&.> iface
)

destroyjod=:3 : 0

NB.*destroyjod v--  dictionary  object  destroy  verb.  This  verb
NB. erases the JOD (ijod) locale user interface.
NB.
NB. monad:  destroyjd uuIgnore

NB. close any open dictionaries
3 od ''

NB. erase current direct _n_ ijod locale references
NB. (*)=. IZJODALL JODEXT
(4!:55) IZJODALL ,&.> locsfx 'z'

NB. destroy sub-objects !(*)=. ST MK UT SO
coerase ST,MK,UT,SO

NB. destroy any JOD class extension objects
coerase JODEXT

NB. return self reference
18!:5 ''
)

dfclose=:3 : 0

NB.*dfclose v-- close dictionary file.
NB.
NB. monad:  dfclose clFilePfx
NB. 
NB.   dfclose__DL 'U'  NB. object noun file pointer prefix

fp=. y,'P'
(fp)=: ".y,'F' [ jclose_jfiles_ ".fp
)

didnum=:3 : 0

NB.*didnum  v--  generates  a  unique extended  precision integer
NB. based GUID.  The GUID is designed to produce a unique  global
NB. identifier every time it's called.
NB.
NB. monad:  didnum uuIgnore

NB. Original Windows only code
NB. call dll to get GUID
NB. guid=. genguid <16#' '
NB. if. 0 ~: >{. guid do. jderr ERR021
NB. else.
NB.  NB. guid as 128 bit mask
NB.  guid=. , (a. i. >{: guid){ truth 8
NB.
NB.  NB. convert mask to an integer computing
NB.  NB. only required extended powers of 2
NB.  pos=. I. guid
NB.  +/(2x ^ pos) pos} guid
NB. end.

NB. More general Win/Linux/Mac code
guidsx i.0
)

didstats=:4 : 0

NB.*didstats v-- dictionary statistics. Returns a table of object
NB. counts and reference paths for each dictionary in path order.
NB.
NB. dyad:  uuIgnore didstats uuIgnore

NB. are any dictionaries open?
if. badrc uv=. checkopen 0 do. uv return. end.

NB. gerund of directory object (loadstamps) calls
ger=. (<'loadstamps') ,&.> locsfx ol=. {:"1 DPATH
if. +./(ger `:0) 0 do.
  jderr ERR054  NB. errmsg: unable to load directory
else.
  dn=. DIRTS__oj [ oj=. {. {:"1 DPATH  NB. (*)=. oj
  hd=. '' ; '--' ; HEADNMS__oj

  NB. collect values of directory object nouns
  uv=.('RW';'RPATH';dn) fullmonty&><ol
  rpaths=. 1{uv [ rs=. (;{.uv){READSTATS
  dt=. ({."1 DPATH) ,. rs ,. {.&> |: 2 }. uv
  dt=. hd , dt

  NB. read master to get as complete a list of names and numbers
  NB. as possible. Some (DIDNUM)'s may still be missing - missing
  NB. dictionaries reported as dictionary numbers - hey life is cruel!
  if. badjr uv=. jread JMASTER;CNMFTAB do.
    jderr ERR006 return. NB. errmsg: cannot read master
  end.

  rb=. <"0 (~. ;rpaths) -. ;1{uv =. >uv
  hd=. (0{uv) , ":&.> rb  NB. all dictionary names
  dn=. (1{uv) , rb        NB. dictionary numbers

  NB. display formatted paths with each dictionary using current names
  rpaths=. ;&.>PATHSHOWDEL,L:0((<;dn)i.&.>rpaths){&.><hd
  ok <dt ,. PATHTIT ; rpaths
end.
)

dnlsearch=:4 : 0

NB.*dnlsearch  v--  searches  dictionary name  lists  for  simple
NB. character list patterns.
NB.
NB. dyad: ilObjOptNc dnlsearch (clPattern ; clDir)
NB.
NB.   3 2 7 dnlsearch 'boo'   NB. suite names containing 'boo'
NB.   3 _2 0 dnlsearch 'boo'  NB. nouns with names containing 'boo'

mop=. ERR001
if. -.(second x) e. PATOPS do. jderr mop return. end.

NB. following code is essentially (pathnl) - maintained
NB. inline because (pob) and (oj) used elsewhere
pob=. {:"1 DPATH [ dt=. |{.x
if. badrc msg=. dt loadalldirs pob do. msg return. end.
nl=. (>dnix__oj dt) fullmonty pob [ oj=. {.pob  NB. (*)=. oj

if. DEFAULT~:{:x do.
   NB. object noun !(*)=. HASTYPE
   if. (({.x) e. WORD,MACRO) *. ({:x) e. HASTYPE do.
     ger=. (<'loadnc') ,&.> locsfx pob
     if. +./(ger `:0) dt do.
       jderr ERR054 return. NB. errmsg: unable to load directory
     end.
     dc=. ;&.> (>dnnc__oj dt) fullmonty pob

     NB. remove items of (nl) that do not have type ({:x)
     nl=. (dc =&.> <{:x) #&.> nl
     
   else.
     jderr mop return.
   end.
end.

x=. second x
if. isempty y do.
  if. 0>x do. ok (/:~)&.> nl return. else. ok sortdnub nl end.
elseif. do.
  y=. ,y
  NB. insure nulls behave
  sublists=. 0>x
  shape=. (sublists#0),0
  nl=. (<shape$'') (I. 0=#&> nl)} nl
  NB. remove any empties 
  if. 0=#nl=. nl -. a: do. ok'' return. end.
  select. |x
    case. 1 do. if. sublists do. ok nl allnlpfx y else. ok nl nubnlpfx y end.
    case. 2 do. if. sublists do. ok nl allnlctn y else. ok nl nubnlctn y end.
    case. 3 do. if. sublists do. ok nl allnlsfx y else. ok nl nubnlsfx y end.
    case. do. jderr mop
  end.
end.
)

doctest=:3 : 0

NB.*doctest v-- dummy word for documentation (doc) testing.
NB.
NB. Mary had  a little  lamb - little lamb - little  lamb  little
NB. lamb that she ate with gusto.
NB.
NB. monad:  cl =. doctest cl
NB.
NB.  doctest 'format me'

y
)

doctext=:4 : 0

NB.*doctext v-- formats long document, object and header text.
NB.
NB. dyad:  iaObject doctext clName
NB.
NB.   0 doctext 'word'
NB.   1 doctext 'test'

if. badcl y do. jderr ERR001  NB. errmsg: invalid options
elseif. badrc uv=. checkput__ST y   do. uv
elseif. badrc uv=. checknames__ST y do. uv
elseif. ((1=#x) *. ({.x) e. TEST,MACRO) +. x e. (GROUP,SUITE) ,. 1  do. 
        if. badrc uv=. x obtext y do. uv return. else. uv=. >{:uv end.
        NB. format leading comments of test, macro and group/suite header scripts
        DL=.{:{.DPATH__ST
        uv=. ctl (DOCUMENTWIDTH__DL;0;0;'NB.') docct2 ];._1 LF,uv-.CR
        if. x-:MACRO do.
          NB. format only J script macros
          if. badrc uv2=. (MACRO,INCLASS) get y do. uv2 return. end. 
          NB. errmsg: macro is not a J script - not formatted
          if. JSCRIPT=>{:uv2 do. x put y;JSCRIPT;uv else. jderr ERR0261 end.
        else.
          x put y;uv
        end.
elseif. -. (<x) e. {OBJECTNC;DOCUMENT do. jderr ERR001
elseif. y=. }. uv
        DL=.{:{.DPATH__ST
        badrc uv=. ((x=.{.x);<DL) inputdict__ST y do. uv
elseif. badrc uv=. x getdocument__ST y do. uv
elseif.do.
  NB. document text using same formatting
  NB. conventions applied to words.
  uv=. (1;0 1){:: uv
  uv=. ];. _2 (uv -. CR),LF
  uv=. ctl ; (DOCUMENTWIDTH__DL;DOCUMENTMARKS) docfmt2 uv
  (x,DOCUMENT) put y,<uv
end.
)

dumpheader=:3 : 0

NB.*dumpheader  v--  creates  the  dumpfile  and  writes   header
NB. information.
NB.
NB. monad:  dumpheader clPathFile
NB.
NB.   dumpheader 'c:\go\ahead\dump\my\dictionary.ijs'

NB. error msg: unable to create dumpfile
if. _1 -: '' (write :: _1:) y do. (jderr ERR0156),<y return. end.

NB. make box characters portable
9!:7 , PORTCHARS [ curchars=. , 9!:6 ''

NB. format header text
head=. DUMPMSG0 , tstamp ''
head=. head,LF,DUMPMSG3 , ;(<'; ') ,&.> ":&.>JODVMD 
head=. head,LF,DUMPPREAMBLE
head=. head,LF,ctl 'NB. ',"1 ' ' , DUMPMSG1 , ": 0 1 {"1 DPATH__ST
head=. head,LF,LF

NB. reset box characters
9!:7 curchars

NB. set up J environment to process script - assumes that
NB. JOD is loaded and that a target put dictionary is open
tag=. DUMPTAG,LF

NB. retain white space 
head=. head,'9!:41 [ 1',tag

head=. head,'cocurrent ''base''',tag
head=. head,'sonl_z_=: ''sonl__MK__JODobj i.4''',tag
head=. head, (SOPASS-.' '),'_z_=:] [ 1!:2&2',tag
head=. head,'SOLOCALE_z_=:":>SO__JODobj',tag
head=. head,'soput_z_=:SOLOCALE&put',tag
head=. head,'soclear_z_=: ''0 0 $ clearso__MK__JODobj 0''',tag

NB. append header error msg: unable to append to dumpfile
if. _1 -: (toHOST head) fap <y do. (jderr ERR0155),<y else. OK end.
)

dumpwords=:4 : 0

NB.*dumpwords v-- dumps path words to an ASCII script file. Nouns
NB. are dumped first in alphabetic order and then remaining words
NB. are dumped in alphabetic order.
NB.
NB. dyad:  iaBlockSize dumpwords clPathFile
NB.
NB.   50 dumpwords 'c:\j405\addons\jod\joddev\dump\joddev.ijs'

NB. dump all nouns
if. badrc nouns=. did 0 do. nouns return.
else.
  if. 2=#nouns do. NB. HARDCODE 2 
    NB. only one dictionary on the path - common case
    if. badrc nouns=. (WORD,1,WORD) dnl '' do. nouns return. else. nouns=. }. nouns end.
  else.
    NB. more than one dictionary on path - requires deeper look to determine
    NB. whether a path order fetched word is a noun or something else
    if. badrc nouns=. 0 _1 0 dnl '' do. nouns return. end.
    if. badrc other=. 0 _1 dnl ''   do. other return. end.
    
    other=. }.other
    nouns=. }.nouns
    other=. other -.&.> nouns
    
    NB. sorted list of nouns that will be retrieved in path order
    nouns=. /:~ ~. ; nouns -.&.> ~.@:;&.> <"1 ,\ other
    
  end.
end.

putclr=. LF,LF,SOPASS,SOPUT,LF,SOCLEAR
putso=. LF,SOSWITCH,LF
noc=. WORD,0
out=. <y
space=. 2           NB. generates one blank line between objects
wnc=. WORD,INCLASS  NB. word name class code

if. -. a: e. nouns do.
  if. badrc wnc=. (WORD,INCLASS) invfetch__ST nouns do. wnc return.
  else. wnc=.(-x) <\ rv wnc
  end.
  names=. (-x) <\ nouns
  for_blk. names do.

    NB. get block of nouns
    if. badrc uv=. noc getobjects__ST >blk do. uv return. else. uv=. rv uv end.

    NB. check component-directory name class for consistency - classes must
    NB. be consistent to insure that the dump script can properly reload
    if. 1 e. mask=.-.(>blk_index{wnc) = ; 1 {"1 uv do.
      NB. error msg: directory-component name class inconsistency -- dump aborted
      (jderr ERR0157),mask#0{"1 uv return.
    end.

    NB. convert to linear representations
    NB. NIMP not wrapping large binaries
    if. badrc uv=. 0 nounlrep uv do. uv return. else. uv=.rv uv end.
    uv=. space jscript jscriptdefs uv

    NB. insert JOD commands to reload
    uv=. toHOST putso,uv,putclr

    NB. append to file
    if. _1 -: uv fap out do. (jderr ERR0155),out return. end.
  end.
end.

NB. append all remaining words that are stored as text
if. badrc names=. dnl '' do. names return. else. vnc=. (names=. }.names) -. nouns end.
nouns=.0

if. #vnc do.
  if. badrc wnc=. (WORD,INCLASS) invfetch__ST vnc do. wnc return.
  else. wnc=.(-x) <\ rv wnc
  end.
  vnc=. (-x) <\ vnc
  for_blk. vnc do.
    if. badrc uv=. noc getobjects__ST >blk do. uv return. else. uv=. rv uv end.
    if. 1 e. mask=.-.(>blk_index{wnc) = ; 1 {"1 uv do.
      (jderr ERR0157),mask#0{"1 uv return.
    end.
    uv=. space jscript jscriptdefs uv
    uv=. toHOST putso,uv,putclr
    if. _1 -: uv fap out do. (jderr ERR0155),out return. end.
  end.
end.

NB. dump word documentation
if. -. a: e. names do. (x;WORD;out) dumpdoc names else. OK end.
)

ed=:3 : 0

NB.*ed v-- edit dictionary objects
NB.
NB. monad:  ed cl|blcl
NB.
NB.   ed 'wordname'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. badrc uv=. x obtext y do. uv return. else. 'file text'=. }.uv end.

if. wex <'EDLOCALE' do.   NB. !(*)=. EDLOCALE
  NB. set up to define objects into specified locale if requested
  pfx=.'18!:4 <''',EDLOCALE,''' [ CRLOC_ajodutil_=: 18!:5 '''' '
  sfx=. '18!:4 CRLOC_ajodutil_'
  text=. pfx,LF,LF,text,LF,LF,sfx
end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',file) changestr DOCUMENTCOMMAND_ijod_
end.

file et text
)

ereopen=:3 : 0

NB.*ereopen v-- reopen dictionaries
NB.
NB. monad:  ereopen uuIgnore

1 [ od OPENJODDICTIONARIES_ijod_ [ 3 od '' NB. !(*)=. od OPENJODDICTIONARIES_ijod_
)

et=:3 : 0

NB.*et v-- edit text
NB.
NB. monad:  et clText
NB. dyad:  clFile et clText

'99' et y  NB. default edit file is 99.ijs
:
NB. write to J temp directory - created by J install
try.
  (toHOST y) write file=. jpath '~temp\' , x , IJS

  if. 0 e. wex ;:'IFJHS IFJ6 IFGTK' do.
    NB. probably on a J 6.0x system
    smopen_jijs_ file   NB. J 6.0x 
  else.
    NB. open in various J7/6 editors !(*)=. IFJHS IFGTK IFJ6
    if. IFJHS     do. open_jhs_ file 
    elseif. IFGTK do. open_jgtk_ file
    elseif. IFJ6  do. smopen_jijs_ file   NB. J 6.0x 
    elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
    end. 
  end.

  NB. NIMP: modify to support various versions of J
  NB. using IFGTK IFWIN IFJHS IFUNIX settings or more
  NB. or more primitive !: calls 

catch. jderr ERR0255
end.
)

extracthrefs=:4 : 0

NB.*extracthrefs v-- extract all \href{}{} text from TeX source.
NB.
NB. Extract urls  and displayed tex  in LaTeX source. Assumes the
NB. \href{}{}  commands  are  properly  balanced and <: (hlength)
NB. characters  long. If  the LaTeX source compiles  it's  almost
NB. always the case that these conditions are satisfied.
NB.
NB. dyad:  btcl =. clPath extracthrefs clFilepat
NB.
NB.   path=. 'c:\jod\602\joddev\document\'
NB.   path extracthrefs 'jod*.tex'

href=. '\href{'
hlength=. 250   NB. maximum length of \href{}{}
texnames=. {."1 (1!:0) x,y
texsource=. ; read&.> (<x) ,&.> texnames
texsource=. hlength {.&.> (href E. texsource) <;.1 texsource
splithref@cuthref&> (<:#href)&}.&.> texsource
)

fmtdumptext=:4 : 0

NB.*fmtdumptext  v--  formats  (name,text)  tables  for  dumping.
NB. Result is a J script character list or null.
NB.
NB. dyad:  (clName ; iaWidth) fmtdumptext btNameText
NB.
NB.   ('z';67) fmtdumptext 1 pick 0 8 get }. dnl ''

NB. remove null entries
if. #text=. y #~ 0 < #&> {:"1 y do.
 
  ascii85=. 0 NB. do not use ascii85 default

  NB. if setting exists in class use it
  if. 0=nc<'ASCII85'     do. ascii85=. 1=ASCII85
  elseif.
      NB. if ASCII85 setting exists in put dictionary directory use it
      do=. {: {.DPATH__ST
      0=nc<'ASCII85__do' do. ascii85=. 1=ASCII85__do
  end.

  NB. The (5!:5) representation will produce
  NB. a large a. index representation when any
  NB. unprintable characters are present.  To get
  NB. a compact representation for ASCII85 5!:5 must
  NB. be replaced in this context
  if. ascii85 do. text=. clfrbtcl ":&.> text else. text=. 5!:5 <'text' end.

  (x,<ascii85) wraplinear text
else.
  ''
end.
)

fork=:fork_jtask_

freedisk=:3 : 0

NB.*freedisk v-- returns free disk/volume space in bytes.
NB.
NB. monad:  freedisk clDisk | clLinuxVolume
NB.
NB.   freedisk 'c:\'       NB. :\ required for windows
NB.   freedisk '/sd1/dev'  NB. linux file system root - null sums all devices

if. IFWIN do. freediskwin y
else.
  NB. NOTE: NIMP: I don't know how to determine which
  NB. linux volume the dictionary will be on so I return
  NB. the minimum of all not 'none' mounted volumes.
  <./freedisklinux 0
end.
)

freedisklinux=:3 : 0

NB.*freedisklinux v-- bytes free on not 'none' linux volumes.
NB.
NB. monad:  fl =. freedisklinux uuIgnore
NB.
NB.   freedisklinux 0   NB. bytes (possibly floating) free on mounted filesystems

NB. linux shell command fetches free 1k blocks - expected format is:
NB. Filesystem           1K-blocks      Used Available Use% Mounted on
NB. /dev/sda1            149301564  11113004 130604408   8% /
NB. none                    764396       648    763748   1% /dev
NB. none                    771004      1364    769640   1% /dev/shm
NB. none                    771004        96    770908   1% /var/run
NB. none                    771004         0    771004   0% /var/lock
txt=. host 'df -l'

NB. cut into lines and drop header
txt=. }. <;._2 txt  

NB. remove all 'none' filesystems HARDCODE: length of 'none'
NB. NIMP: ignoring empty result - hey there
NB. has to be at least one mounted filesystem!
txt=. txt #~ -. 'none'&-:&> 4 {.&.> txt

NB. bytes free using 1000 byte blocks - this will
NB. underestimate free space and leave a little safety cushion
1000 * 3 {"1 ] _1&".&> txt
)

freediskwin=:3 : 0

NB.*freediskwin v-- returns free disk/volume space in btyes for win systems
NB.
NB. monad:  freediskwin clDisk | clLinuxVolume
NB.
NB.   freediskwin 'c:\'       NB. :\ required for windows

s=. 'kernel32 GetDiskFreeSpaceA i *c *i *i *i *i' cd y;(,0);(,0);(,0);(,0)
*/ ; 2 3 4 { s
)

guids=:3 : 0

NB.*guids v-- create guids as 16 byte strings on supported J systems.
NB.
NB. This verb taken from ~addons/general/misc/guids.ijs returns guids
NB. on Windows, Linux and Mac systems. 
NB.
NB. monad:  guids zl | ilShape
NB. 
NB.   guids ''    NB. create guid as a 16-byte character string
NB.   guids $0
NB.   guids 3 4   NB. create 3x4 array of 16-byte strings

NB. J profile utilities (*)=. LIBUUID find_dll LIBUUID_z_

if. IFWIN do.
  cmd=. 'ole32 CoCreateGuid i *c'
else.
  if. _1 = nc <'LIBUUID' do.
    if. UNAME-:'Linux' do.
      LIBUUID_z_=: 'libuuid.so.1'
    else.
      LIBUUID_z_=: '"',(find_dll 'System'),'"'
    end.
  end.
  cmd=. LIBUUID,' uuid_generate n *c'
end.
>{:"1 cmd 15!:0"1 0 <"1 (y,16)$' '
)

guidsx=:256 #. [: x: a. i. guids

hostsep=:'\'&(('/' I.@:= ])})

iswriteable=:3 : 0

NB.*iswriteable  v--  tests  a blcl of full  path file  names for
NB. writeablity.
NB.
NB. This verb takes  a list of full path file names and tests the
NB. read/write status of  the files.  The  result is boolean list
NB. with 1 denoting "writeable" and 0 denoting "not-writeable."
NB.
NB. monad:  pl =. iswriteable blclPathFile

if. IFWIN do. iswriteablewin y else. iswriteablelinux y end.
)

iswriteablelinux=:3 : 0

NB.*iswriteablelinux  v-- tests a blcl of full path  linux  files
NB. for writeablity.
NB.
NB. monad:  pl =. iswriteablelinux blclPathFile

NB. NIMP: check linux file read/write/access status
NB. NIMP: returns all 1's for now
(#,y)#1
)

iswriteablewin=:'w-'"_ -:"1 [: ] 1 3"_ {"1 [: ;"1 [: ] _2: {."1 [: > [: ,&(1!:0)&.> ]

jodfork=:[: fork [: ; 1 0 2 { ' ' ; qt

jodhelp=:3 : 0

NB.*jodhelp v-- display help for JOD words.
NB.
NB. monad:  jodhelp zl | cl
NB.
NB.   jodhelp ''       NB. display help index
NB.   jodhelp 'get'    NB. (get) help
NB.
NB. dyad:  uuIgnore jodhelp uuIgnore
NB.        clPDF jodhelp uuIgnore
NB.
NB.   jodhelp~ 0  NB. list know help topics
NB.
NB.   'PDF' jodhelp 0  NB. open PDF
NB.   jodhelp~ 'PDF'

www=. wwwbrowser 0
if. badcl y do. jderr ERR0257 NB. errmsg: invalid help word
elseif. IFWIN *. -.fex <www do. (jderr ERR0258),<www  NB. errmsg: browser not found
elseif. #y  do.
  word=. <alltrim y
  if. ({:$JODHELP)=pos=. (0{JODHELP) i. word do.
    (jderr ERR0259),word NB. errmsg: no help for
  else.
    jodfork www ; pos{1{JODHELP
    (ok OK0253),word NB. msg: starting browser help
  end.
elseif.do.
  NB. HARDCODE: jod index is first in list
  jodfork www ; 0{1{JODHELP
  ok OK0254
end.
:
if. x -: PDF do.
  jodpdf=. jpath '~addons\general\jod\joddoc\pdfdoc\jod.pdf'
  if. fex<jodpdf do.
    NB. jod.pdf is installed and local
    pdfrdr=. pdfreader 0
    if. fex<pdfrdr do.
      NB. spawn PDF browse task - requires configured PDF reader on host
      jodfork pdfrdr;jodpdf
      ok OK0255 NB. msg starting PDF reader
    else.
      (jderr ERR0260),<pdfrdr NB. errmsg: PDF reader not found
    end.
  else.
    NB. jod.pdf is not installed - browse web version
    www=. wwwbrowser 0
    NB. PDFURL needs to be " quoted on Linux to invoke properly
    if. IFWIN do. jodfork www;PDFURL else. jodfork www;dblquote<PDFURL end.
    ok OK0256 NB. msg: jod.pdf not installed - starting browser for web version
  end.
else.
  NB. display available help topics
  /:~ 0{JODHELP
end.
)

jodoff=:3 : 0

NB.*jodoff v-- turns JOD off  result is  1  if  successful and  0
NB. otherwise.
NB.
NB. Destroys dictionary objects, clears JOD classes and drops the
NB. (ijod) interface. This  verb plus (jodon) and (jodsystempath)
NB. remain in the (z) locale after off'ing JOD and can be used to
NB. reload the system.
NB.
NB. monad:  jodoff uuIgnore

NB. HARDCODE: JODobj_ijod_ ajod ijod base
try.
  jo=. <'JODobj_ijod_'
  if. 0 = (4!:0) jo do. (4!:55) jo [ (18!:55) destroyjod__JODobj 0 end.

  NB. erase jod classes
  (18!:55) w #~ 'ajod'&-:@:(4&{.)&> w=. 18!:1 ] 0

  NB. erase (ijod) interface and clear base path
  ((18!:2<'base')-.<'ijod') 18!:2 <'base'
  (18!:55)<'ijod'

  _1=(4!:0) jo
catchd.
   0
end.
)

jodon=:3 : 0

NB.*jodon v--  turn  JOD on  result  is 1  if  successful  and  0
NB. otherwise.
NB.
NB. Tests the  current J environment and creates or activates JOD
NB. objects.
NB.
NB. monad:  paRc =. jodon uuIgnore

NB. format of (9!:14) has changed without warning in the past
jvn=. 9!:14 ''

NB. first value before '/' is the version number (we hope).
jvn=. , (jvn i. '/') {. jvn
if. #jvn do. jvn=. 0 ". jvn #~ jvn e. '0123456789' else. jvn=. 0 end.

sp=. ] [ 1!:2&2
if. jvn <: 601 do.
  msg=. 'JOD requires J 6.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 6.0x/7.0x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. 0 e. (4!:0);:'load conew coclass coerase coinsert copath' do.
  msg=. 'JOD depends on core J load and class utilities.'
  0 [ sp msg=. msg,LF,'Load J with a standard profile to use JOD.'
  return.
end.

NB. HARDCODE: JODobj_ijod_ ijod ajod
jodob=. nc 'JODobj_ijod_'          NB. name class of JOD object pointer
jodco=. (<'ajod') e. 18!:1 ] 0     NB. JOD class status

if. (0=jodob) *. jodco      do. 1  NB. JOD is loaded
elseif. (_1=jodob) *. jodco do.
  NB. jod is off and classes are loaded - create objects !(*)=. conew
  JODobj_ijod_=: conew 'ajod'
  if. jodcs=. createjod__JODobj JODobj_ijod_ do. 1 else. 0 [ ex 'JODobj_ijod_' end.
elseif. -. jodco do.
  NB. JOD classes absent load and start system !(*)=. load
  ex 'JODobj_ijod_'
  NB. JOD load now requires addon path
  load 'general/jod'
  0 = nc 'JODobj_ijod_'
elseif.do. 0 NB. utterly screwed up system state
end.
)

jpathsep=:'/'&(('\' I.@:= ])})

makedump=:3 : 0

NB.*makedump  v-- dumps the current path as a J  script file. The
NB. dump script can be run back  into  JOD  to rebuild  a  single
NB. dictionary that contains all objects on the current path. The
NB. dump script is a simple ASCII file  that is intended for long
NB. term storage of J  words in a form that is immune to  changes
NB. in binary storage formats.
NB.
NB. monad:  makedump uuIgnore

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. create dump file in put dump directory !(*)=. DL
DL=.{:{.DPATH__ST

NB. dumpfactor is set from the put dictionary
df=. DUMPFACTOR__DL

NB. default dump file name is the put dictionary name
if. isempty y   do. dumpfile=. DMP__DL,DNAME__DL,IJS
elseif. badcl y do. jderr ERR0158 return. NB. error msg: invalid dump file
elseif.do. dumpfile=. y
end.

NB. standardize path character
dumpfile=. jpathsep dumpfile

if.     badrc uv=. dumpheader dumpfile        do. uv
elseif. badrc uv=. df dumpwords dumpfile      do. uv
elseif. badrc uv=. (df,TEST) dumptm dumpfile  do. uv
elseif. badrc uv=. (df,MACRO) dumptm dumpfile do. uv
elseif. badrc uv=. (df,GROUP) dumpgs dumpfile do. uv
elseif. badrc uv=. (df,SUITE) dumpgs dumpfile do. uv
elseif. badrc uv=. dumptrailer dumpfile       do. uv
elseif.do.
  (ok OK0151),<dumpfile
end.
)

mj=:] ; 21"_ ; gt

mls=:3 : 0

NB.*mls v-- make load script.
NB.
NB. Generates a J (load) script from a JOD group and  an optional
NB. POST_ process macro script.
NB.
NB. monad:  mls clGroupName
NB.
NB.   NB. generate script and add to public scripts
NB.   mls 'JODaddon'
NB.
NB.   scripts 'e'       NB. JODaddon is now on scripts
NB.   load 'JODaddon'   NB. load's like any J load script
NB.
NB. dyad:  baPublic mls clGroupName
NB.
NB.   NB. make script but do not add to public scripts
NB.   0 mls 'JODaddon'
NB. 
NB.   NB. make script and return text
NB.   2 mls 'JODaddon'

1 mls y
:

NB. HARDCODE: option qualifier codes
NB. 2 _2 make assembles entire group script
NB. with preamble regardless of where the
NB. group appears on the JOD path
v=. 2 _2 make gn=. y -. ' '
'r s'=. 2{.v
if. r do.
  NB. group make succeeded - append any POST_ script
  postpfx=. POSTAMBLEPFX
  if. badrc sp=. 4 dnl postpfx do. sp return. end.
  if. (<ps=. postpfx , gn) e. }.sp do.
    v=. 4 get ps
    'r p'=. 2{.v
    if. r do. s=. s , (2#LF) , (<0;2) {:: p else. v return. end.
  end.
  if. 2-:x do. ok s
  else.
    pdo=. {:0{DPATH__ST__JODobj      NB. put dictionary directory object
    lsn=. (SCR__pdo),gn,IJS__JODobj  NB. load script full path name
    (toHOST s) write lsn
    NB. update scripts.ijs
    x addloadscript gn;(SCR__pdo),gn
  end.
else.
  v
end.
)

mt=:] ; 25"_ ; gt

newd=:3 : 0

NB.*newd v-- creates a new dictionary
NB.
NB. monad:  newd clName | (clName ; clPath)
NB.
NB.  newd 'New0Dict'             NB. store in default J user directory
NB.  newd 'New1Dict';'c:\put\it\here'           NB. windows drives 
NB.  newd 'New2Dict';'\\shared\netdrive\new2'   NB. windows UNC shares
NB.  newd 'New3Dict';'/home/john/temp/new3'     NB. linux rooted paths 

if. badcl y do.
  1 newregdict__ST y
else.
  drn=. y -. y -. ALPHA  NB. safe directory chars only
  1 newregdict__ST y;hostsep (jpath '~user\'),JJODDIR,(255<.#drn){.drn
end.
)

newregdict=:4 : 0

NB.*newregdict v-- creates a new dictionary  or registers an extant
NB. dictionary.
NB.
NB. dyad:  iaOptions newregdict (clDictionary ; clPathroot)
NB.
NB.   NB. register extant dictinary
NB.   0 newregdict 'dictionary name';'c:\where\it\lives' NB. drive required
NB.
NB.   NB. create new dictionary
NB.   1 newregdict 'new name';'c:\new\location'

mf=.  JMASTER  NB. master file
msg=. ERR061   NB. errmsg: invalid dictionary name;path[;documentation]

if. (badbu y) +. 1~:#$ y  do. jderr msg
elseif. (3<#y) +. 2>#y    do. jderr msg
elseif. +./badcl&> y      do. jderr msg
elseif.do.

  NB. names and paths cannot be empty - sorry
  'name path doc'=. 3{.y,<''
  name=. alltrim name [ path=. hostsep alltrim path
  if. 0&e. (#name),#path do. jderr msg return. end.

  NB. restrict dictionary name and path characters
  if. 0&e. name e. ' ',ALPHA do.
    jderr ERR062 return. NB. errmsg: invalid characters in name
  elseif. 0&e. path e. PATHCHRS,ALPHA do.
    jderr ERR063 return. NB. errmsg: invalid characters in path
  end.

  disk=.'' NB. empty disk suppresses space testing

  if. IFWIN do.
    NB. check for UNC paths
    if. (2#PATHDEL) -: 2{.path do.
      NB. insure UNC paths are terminated
      path=. path,(PATHDEL={:path)}.PATHDEL

      NB. NIMP: NOTE: (freedisk)'ing windows network drives (more
      NB. than once) is time consuming and typically unnecesary!
      NB. These volumes are often huge and JOD empty dictionaries
      NB. are tiny - hence we ASSUME sufficient space. The following
      NB. commented code tests UNC volumes.

      NB. test if the maximum size of subpaths exceeds threshold
      NB. depends on (freedisk) returning zero for invalid paths
      NB. omit root \\ and last nonexistant path
      NB. if. 0=#uv=. _1 }. 2 }.;&.> <"1 ,/\ <;.2 path do. 
      NB.   (jderr ERR065),<path return. NB. errmsg: not enough space on drive
      NB. end.
      NB. if. (>./freedisk&> uv) < FREESPACE do. (jderr ERR065),<path return. end. 
    else. 
      NB. check for windows drive letter (required) and 
      NB. determine if there is enough space on the target drive
      NB. errmsg: target drive is required
      if. isempty tdrv=. justdrv path do. jderr ERR064  return. end.
      
      NB. windows drive letters
      disk=. tdrv,':',PATHDEL
    end.
  else.
    NB. require rooted linux paths 
    if. PATHDEL ~: {.path do. (jderr ERR096),<path return. end.

    NB. NIMP: how does one determine the volume name for a given
    NB. fully qualified linux file that resides on said volume?  
    disk=. path
  end.

  if. (x=1) *. 0<#disk do. NB. HARDCODE (x) option
    bytes=. freedisk disk
    NB. errmsg: not enough space 
    if. bytes < FREESPACE do. (jderr ERR065),<disk return. end.
  end.

  NB. attempt to read master
  if. badjr uv=. jread mf;CNMFTAB,CNMFPARMS,CNMFDLOG do.
    jderr ERR006 return. NB. errmsg: cannot read master
  end.

  NB. mark master - this verb updates if successful
  NB. all error calls should use (jdmasterr) until
  NB. the master is cleared at the end of this verb
  if. badrc msg=. markmast 1 do. msg return. end.

  NB. master table, dictionary parameters, number log
  'mdt dpt dlg'=. uv
  NB. errmsg: dictionary name in use
  if. (<name) e. 0{mdt do. jdmasterr ERR066 return. end.

  if. x=1 do.
    NB. attempt to create main root directory
    if. badrc path=. mainddir path do. path [ markmast~0 return. end.

    NB. attempt to create standard subdirectories
    path=. {: path
    if. 0&e. uv=. makedir"0 path ,&.> JDSDIRS do.
      jdmasterr ERR067 return. NB. errmsg: unable to create subdirectories
    end.
    path=. > path

    dn=. didnum 0   NB. unique dictionary number
    uv=. newdparms JDSDIRS;dpt;name;dn;path

    NB. create empty dictionary files
    uv=. <(doc;uv) jwordscreate path,>0{JDFILES
    uv=. uv , (}.JDFILES) jdatcreate&.> <path
    if. 0&e. ;{.&> uv do.
      jdmasterr ERR068 return. NB. errmsg: unable to setup dictionary file(s)
    end.
    newmdt=. mdt,.name;dn;path;0
    okm=.OK050
  else.
    path=. (-PATHDEL={:path) }. path,PATHDEL

    NB. test existence of dictionary files
    fn=. JDFILES ,&.> <IJF
    if. 1 e. uv=. -. fex"1 dcfiles=. <@:;"1 (<path) ,"0 / fn do.
      (jdmasterr ERR073),<name return. NB. errmsg: missing dictionary file(s)
    end.

    NB. NIMP should run under a trap here to protect
    NB. against files that appear to be dictionary but are not

    NB. read dictionary parameter table and documentation
    if. badjr dat=. jread (file=. path,>{.JDFILES);CNPARMS,CNDICDOC do.
      jdmasterr ERR088 return. NB. errmsg: jfile read failure
    end.

    NB. dictionary parameters and unique id
    'dpt olddoc'=. dat
    dn=. 1 {:: dpt

    NB. didnum's must be unique
    NB. errmsg: duplicate dictionary id number
    if. dn e. ; 1{mdt do. jdmasterr ERR092 return. end.

    NB. if not a libary adjust dictionary paths, name and documentation
    if. -.islib dpt do.

      NB. test dictionary file attributes - we must be able to read/write
      if. 0 e. iswriteable dcfiles do.
        NB. errmsg: dictionary file attributes do not allow read/write
        jdmasterr ERR095 return.
      end.

      dpt=. ((<path) ,&.> JDSDIRS ,&.> PATHDEL) PARMDIRS} dpt
      dpt=. (<name) 0} dpt
      doc=. (*#doc){olddoc;doc
      if. badreps (dpt;doc) jreplace file;CNPARMS,CNDICDOC do.
        jdmasterr ERR056  NB. errmsg: jfile replace failure
      end.
    end.

    newmdt=. mdt,.name;dn;path;0
    okm=. OK058
  end.

  NB. update master dictionary table+backup, didnum log, open status
  uv=. (newmdt;mdt;dlg,dn) jreplace mf;CNMFTAB,CNMFTABBCK,CNMFDLOG
  if. 0&> <./uv do. jdmasterr ERR069 return. end. NB. errmsg: error updating master

  NB. free master file for other tasks
  if. badrc msg=. markmast~0 do. msg return. end.

  ok okm;name;jpathsep path
end.
)

nounlrep=:4 : 0

NB.*nounlrep v-- converts nouns stored as binary  to linear  text
NB. representations. Uses  a  scratch locale to temporarily define
NB. nouns.
NB.
NB. dyad:  iaNoex nounlrep bt

if. #y do.
  clearso 0
  names=. (errnames=. {."1 y) ,&.> locsfx SO  NB. !(*)=. SO
  try.
    (names)=: (3!:2)&.> {:"1 y
    names=. (5!:5@<)&.> names
  catch. (jderr ERR016),errnames return. end.
  if. x do. names=. names ,&.> LF end.
  y=. names (<a:;2)} y
  clearso 0
end.
ok <y
)

nt=:3 : 0

NB.*nt v-- edit a new test script using JOD conventions.
NB.
NB. This  verb  looks   for  (TESTSTUB)  on  the  path   of  open
NB. dictionaries allowing easy user defined test script formats.
NB.
NB. monad:  nt clTest
NB.
NB.   nt 'scriptname'

name=. y -. ' '

NB. get teststub document from open dictionaries
'r s'=.2{.t=. 1 get TESTSTUB
if. r do.
  'datess timess'=.yyyymondd 0
  test=. ('/{~T~}/',name,'/{~created~}/',datess,'/{~errortime~}/',datess,' ',timess) changestr >1{,s
  name et test
else.
  t
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


od=:3 : 0

NB.*od v-- opens and closes dictionaries.
NB.
NB. monad: od clDictionary|blclDictionary
NB.
NB. dyad:  iaOption od clDictionary|blclDictionary
NB.
NB.   od 'test dictionary';'another test dictionary'  NB. open r/w
NB.   3 od 'test dictionary'                          NB. close

1 od y
:
msg=. ERR005 NB. errmsg: invalid or missing dictionary names

NB. list all registered dictionaries (short form)
if. badjr mdt=. jread JMASTER;CNMFTAB do.
  jderr ERR006 return.
end.
dl=. 0{>mdt

select. x
case. 1 do.   NB. HARDCODE: magic numbers read/write codes

  if. isempty y do. ok /:~ dl
  else.
    NB. open read/write
    y=. boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. boxopen ,y
  if. *./y e. dl do. y opendict__ST 2;mdt else. jderr msg end.

case. 3 do.

  NB. close dictionaries
  if. badrc msg1=. checkopen__ST 0 do. msg1 return. end.
  if. isempty y do. y=. {."1 DPATH__ST else. y=.boxopen ,y end.
  if. *./y e. dl do. mdt closedict__ST y else. jderr msg end.

case. 4 do.

  NB. HARDCODE (mdt rows) display dictionary names and source paths
  mdt=. jpathsep&.> 0 2{>mdt
  ok <(/:0{mdt){ |: mdt

case. 5 do. 

  NB. return the currently registered dictionaries as a (regd) script
  mdt=. quote&.> 0 2{>mdt
  mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt
  NB. prefix command to close and unregister all current dictionaries
  mdt=. '3 regd&> }. od'''' [ 3 od ''''',LF,mdt
  ok 'NB. JOD registrations: ',(tstamp ''),LF,jpathsep mdt
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

packspace=:3 : 0

NB.*packspace v-- determines if there is sufficient free space on
NB. the backup volume.
NB.
NB. The  test  is  conservative  in  that  you  must  have enough
NB. freespace to  copy the  current  unpacked dictionary.  Packed
NB. dictionaries  are  always  smaller  so this  leaves a  safety
NB. margin.
NB.
NB. monad:  packspace uuIgnore
NB.
NB.   packspace__DL 0

NB. object nouns !(*)=. SYS BAK
NB. size of current unpacked dictionary
bytes=. +/ ; 2 {"1 ] 1!:0 <SYS,'*',IJF

NB. errmsg: not enough free disk space for operation 
if. bytes<volfree BAK do. OK else. jderr ERR204 end.
)

pathsieve=:(0 < #&>) #^:_1 ([: ; 1 {.&.>~ #&.>) <;.1 [: ~: ;

pdfreader=:3 : 0

NB.*pdfreader v-- returns a pdf reader from available options.
NB.
NB. monad:  clPDFExe =. pdfreader uuIgnore

NB. prefer J's pdf readers otherwise take JOD reader !(*)=. PDFREADER
if. wex<'PDFREADER__JODtools' do. pdfrdr=. PDFREADER__JODtools else. pdfrdr=.'' end.

if.     wex<'PDFReader_j_' do. if. 0<#PDFReader_j_ do. pdfrdr=. PDFReader_j_ end. NB. J 7.0x
elseif. wex<'PDFREADER_j_' do. if. 0<#PDFREADER_j_ do. pdfrdr=. PDFREADER_j_ end. NB. J 6.0x
end.
pdfrdr
)

qt=:]

regd=:3 : 0

NB.*regd v-- register and unregister JOD dictionaries.
NB.
NB. monad:  regd blcl
NB.
NB.   regd 'name';'c:\location\of\files';'documentation...'
NB.
NB. dyad:  iaOption make cl
NB.
NB.   3 regd 'name'  NB. unregister dictionary

0 newregdict__ST y
:
if. x-:3 do. NB. HARDCODE option
  NB. errmsg: invalid or missing dictionary name(s)
  if. badcl y do. jderr ERR005 return. end.
  NB. errmsg: dictionary in use - cannot unregister
  if. (<,y) e. {."1 DPATH__ST do. jderr ERR018 return. end.
  NB. errmsg: cannot read master
  if. badjr mdt=. jread JMASTER;CNMFTAB do. jderr ERR006 return. end.
  mdt=.>mdt
  mu=. (0{mdt)=<,y
  if. +./mu do.
    'path inuse'=. 2 3{mu #"1 mdt
    NB. errmsg: dictionary in use - cannot unregister
    if. inuse do. jderr ERR018 return. end.
    newmdt=. (-.mu)#"1 mdt
    if. badrc msg=. markmast 1 do. msg return. end.
    if. badreps ((<newmdt),<mdt) jreplace JMASTER;CNMFTAB,CNMFTABBCK do.
      jdmasterr ERR017 return.  NB. errmsg: jfile replace error
    end.
    if. badrc msg=. markmast~0 do. msg return. end.
    (ok OK001),y;jpathsep path
  else.
    jderr ERR005
  end.
else.
  jderr ERR001
end.
)

renamefiles=:4 : 0

NB.*renamefiles v-- moves and renames OS files.
NB.
NB. NOTE: tested on  Win32  and Linux 32 bit systems  may work on
NB. others.
NB.
NB. dyad:  blclSource renamefiles blclTarget

if. IFWIN do.
  rc=.movefile"1 x ,. y
  NB. errmsg: unable to rename files
  if. *./0 <; {."1 rc do. OK else. (jderr ERR205),(15!:11)'' end.
else.
  NB. move current dictionary files to backup location
  NB. NOTE: assumes path file names that do not wreak linux (mv) command
  if. isempty rc=. host"1  > (<'mv ') ,&.> x ,&.> ' ' ,&.> y do. OK
  else.
    NB. result not empty probably some OS error
    NB. errmsg:  unable to copy/move/rename files - shell messages ->
    (jderr ERR210),<,rc
  end.
end.
)

restdict=:4 : 0

NB.*restdict v-- restore latest backup created by (packd)
NB.
NB. dyad:  blclFiles restdict clName

NB. object nouns !(*)=. DIDNUM DNAME SYS

if. (,DNAME) -: ,y do.

  NB. clear current object directory - frees space
  dropall 0

  NB. NIMP restore comes from the same volume as the
  NB. dictionary.  This code depends on the fact we
  NB. are dealing with a standard dictionary directory
  NB. that is contained on ONE volume.
  path=. ((justpath`justdrvpath@.IFWIN) SYS),PATHDEL

  dcfiles=. JDFILES ,&.> <IJF            NB. dictionary file names with extension
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS   NB. HARDCODE 5 backup directory index
  target=. (<path) ,&.> dcfiles          NB. current dictionary files
  source=. (<bckpath) ,&.> (<":>x) ,&.> dcfiles  NB. lastest backup files

  NB. test backup files errmsg: missing backup files - restore aborted
  if. -.fex source do. jderr ERR207 return. end.

  NB. Check DIDNUM of backup dictionary against current object
  NB. they must match to maintain master/dictionary relationships.
  NB. WARNING uses fact that the WORD file is first ON (source) list
  if. badjr dat=. jread (>{.source);CNPARMS do.
      jderr ERR088 return. NB. errmsg: jfile read failure
  end.

  NB. read alleged backup DIDNUM
  dn=. ((1&{::@>) :: 0:) dat
  if. -. dn -: DIDNUM do. jderr ERR209 return. end.

  NB. erase current dictionary files and copy last backup
  (1!:55) target
  if. badrc msg=.source copyfiles target do. msg return. end.

  NB. increment pack count to prevent clash with backup
  NB. this causes gaps in the backup count but insures we never clash
  pfn=.backnum 0

  NB. insure new directory is reloaded when needed
  dropall 0

  ok OK201;DNAME;<:pfn  NB. name & pack count of restored dictionary
else.
  jderr ERR202
end.
)

rmroot=:3 : 0

NB.*rmroot v-- delete a directory all contents - windows and linux.
NB.
NB. monad:  rmroot clRoot

NB. require 'task' !(*)=. shell
if. IFWIN do.
  shell 'rd "',y,'" /s /q'
else.
  shell 'rm -rf ',y
end.
)

setwwwbrowser=:3 : 0

NB.*setwwwbrowser v-- tests and sets the WWW browser.
NB.
NB. This  verb  performs simple tests on purported  browsers  and
NB. sets the first browser passing the test. This way you can set
NB. a preferred browser but also maintain some fall backs.
NB.
NB. monad:  clBrowser =. setwwwbrowser uuIgnore

if. IFWIN do.
  if.     fex <WWW0 do. WWW0
  elseif. fex <WWW1 do. WWW1
  elseif.do. ''
  end.
else.
  NB. linux browsers - should open with command lines like:
  NB.   chrominum-browser http://www.jsoftware.com
  WWW0linux
end.
)

splithref=:] <;.1~ 0 = _1 |.!.0 cbracbalance

testenvironment=:3 : 0

NB.*testenvironment v-- sets up the base locale for running test cases.
NB.
NB. monad:  testenvironment (clTest ; clSystemname)
NB.
NB.   testenvironment 'bad';'JOD'

'type system'=. y

NB. record any open dictionaries and close 
NB. require 'jod' !(*)=. did od OPENJODDICTIONARIES_ijod_
OPENJODDICTIONARIES_ijod_=: }. did 0
3 od ''

NB. display or pass !(*)=. testpass
testpass_ijod_=: ]`showpass@.(TESTYAMMER-:1)

NB. test utils !(*)=. err er ner
er_ijod_=: err@:testpass  NB. expected result
ner_ijod_=: -.@:er        NB. negative expected result

select. type
case. 'bad' do.
  err_ijod_=: [: -. 1: -: [: > {.
  1
case. 'good' do.
  err_ijod_=: 1: -: [: > {.
  1
case.do.
  0 [ showpass 'TEST ENVIRONMENT SETUP ERROR'
end.
)

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
assert. 4 <: len  NB. fails on short cl
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

updatepublic=:4 : 0

NB.*updatepublic v-- updates public scripts table.
NB.
NB. dyad:  btcl =. btclPublic updatepublic blNamePath
NB.
NB.   Public_j_ updatepublic 'name';'c:/where/the/script/things/are.ijs'

p=. (0 {"1 x) i. 0{y
if. p<#x do.
  NB. update entry
  x=. y p} x
else.
  NB. new entry - sort public scripts
  x=. x , y
  x=. (/:0 {"1 x){x
end.
)

volfree=:3 : 0

NB.*volfree v-- returns free bytes on volume or UNC path.
NB.
NB. monad: na =. volfree clPathDisk
NB.
NB.   volfree 'c'
NB.   volfree '\\unc\share\'
NB.   volfree '/home/john'   NB. NIMP: linux paths ignored for now

if. IFWIN do.
  if. (2#PATHDEL)-:2{.y do. freediskwin y else. freediskwin (justdrv y),':',PATHDEL end.
else.
  <./freedisklinux 0
end.
)

wraplinear=:4 : 0

NB.*wraplinear v--  wraps  the linear representation  of large  J
NB. objects  into a series of script lines.  The  linear  form of
NB. large J objects can produce very long lines in script  files.
NB. Many  editors  cannot  deal with  very long lines. This  verb
NB. produces  an  equivalent  representation  that  can always be
NB. edited.
NB.
NB. dyad:  (clTempName ; iaWidth) wraplinear clLinear
NB.        (clTempName ; iaWidth ; paAscii85) wraplinear clLinear
NB.
NB.   ('z';67) wraplinear 5!:5 <'bighonkingarray'
NB.   ('z';67;1) wraplinear 'uses ascii85',LF,'encoding - better for most texts'

NB. temporary noun name, line length, ascii85 representation
'temp width ascii85'=. 3 {. x,<0

if. ascii85 do.
  NB. use ASCII85 encoding.  This representation is
  NB. about three times more compact than the default
  NB. representation but requires roughly three times
  NB. the CPU with current algorithms to encode/decode
  temp,'=:dec85__MK__JODobj 0 : 0',LF,')' ,~ toascii85 y
else.
  head=. temp,'=:'''''                NB. null header
  tail=. temp,'=:',(":#y),'{.',temp   NB. trim to correct length
  line=. temp,'=:',temp,','           NB. next line

  NB. wrap text and insure each line is properly quoted
  body=. ctl line ,"1 quote"1 (-width) ]\ y
  head,LF,body,LF,tail
end.
)

writeijs=:4 : 0

NB.*writeijs v-- writes file to put dictionary directory
NB.
NB. dyad:  (iaObject ; clFile) writeijs clText

'obj file'=. x
DL=.{:{.DPATH__ST
NB. get put dictionary script directory
path=.jpathsep dfp__DL obj
m=. (toHOST y) (write :: _1:) path=.path,file,IJS
NB. errmsg: file write failure with target path and file appended
if. m -: _1 do. (jderr ERR0153),<path else. (ok OK0150),<path end.
)

wwwbrowser=:3 : 0

NB.*wwwbrowser v-- returns a www browser from available options.
NB.
NB. monad:  clBrowserExe =. wwwbrowser uuIngore

NB. prefer J's live configured browser otherwise take JOD's browser !(*)=. WWWBROWSER
if. wex<'WWWBROWSER__UT__JODobj' do. www=. WWWBROWSER__UT__JODobj else. www=.'' end.

if.     wex<'Browser_j_' do. if. 0<#Browser_j_ do. www=. Browser_j_ end.  NB. J 7.0x
elseif. wex<'BROWSER_j_' do. if. 0<#BROWSER_j_ do. www=. BROWSER_j_ end.  NB. J 6.0x
end.
www
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6s03&Da5+?(E$3$:%#0fC.6+>Yer2]sn8+>k9"1E\D/+>kns0ea_*2BX_4+>P_q0eje,0d&@s
1,9t,0H`2,+>GSn1Gg44+>Ybq2'=e2+>t>s0H`1p1bg+0+>Pes3?U(5+>b2r2BX_.+>PVn0f'q/
1a"b#0f^@21*AD.+?1Ju3$:4(0f:(5+>Y\o3?U+4+>G\q1GU(-0H`/.+?1K!2]t%%3%uI4+>l#!
3$:":+>GPm1GBq1+>PYo2BXk8+?1K!0d&J!2DlU9+>bhr2]sq7+>GPm2)$..+>P_q2]sh8+>P'"
+>GVo1bp1.0d&83+>b2s3$:1'1H?R41E\J5+>GSn2)QL6+>ktu2BXn4+?(E#1a"M-+>kns0fC.3
1E\D/+?)8&2]t"6+?(Du2BXn#2)QL6+>kqt3$:%:+?1K#0d&4o1Gp:2+>Gbs1*AA5+>b2r1a"M,
+>l,$1*AD1+>P&p3?U=)2DlU;+>u&!3?U.7+>P&s2BXh!1b^%,0d&50+>GYp1GBq3+>kqt0f:(1
3?U=)1,U1/1*A>3+?(E"0H`)(+?2%t3$:";+>GPm1c.Ks6V0j/20W_FDBLYV5uU-B8N8RMFCf]=
+ED%4Eb0<'DKK</Bl@l3BlbD>F(Jl)Bl5&(F_u(?Anc'mF!*%WA7]@]F_l.B0LAoA7:LOaAKYo1
FD5Z2+Cf>#AOKNm:eakY1Nm>MF(oQ1+E2@4AncK4FCf]=+D,P4+A,Et+CoV3E-"EI9i+eT7s&0P
F!+(N6m-#_D/^V=@rc:&F<GU8@WcC$A0>B#D/E^!A91=3=%Q.Z+EMgLFCf;3DJsZ8+EM+9+CoV8
Bl7Q+E,ol/Bl%?'Ci<`mBl7Q+/KcbjDf-\ABl7I"GB4mJH#n(=D0&9p8l%ihDKKH1Amo1\@rHC!
+A,Et+DG_8ATDBk@q?d,DfTB0+>"^PDdd0fA0>T(FDi9MBkhQs.3NGF@ps1b8U=!)7!*?cCi`3E
6rZrX9N*'[+DG_8ATDBk@q?d,DfTB08U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28
Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*K
D..3k+CT.u+Cno&APPZq6r-0M;G:#,ATo7h:IH=DDJX$)AKYYtCiCM>Eboe>-t[L<D'2GH6m+09
3A*'9:dJ&O;b0\c6q'd[Ble60@<lEp+E1b2BHUhsCh[a#FCfJ8@q]:k@:OCjE_o.n<DlM5Eblk?
D]it9Ch[cu+Eh=:F(oQ1+E(j7C2[W8E+EQ\:-hTC8g&2#F*(u1+Du+?DBO"3F<G+:EbTE(+E2@>
Anc'm+Dbt)A8,po+>"^R@;TRs+D>\7F<GXMF*(u1<DlLh<EN7!9H\D!AnGb%<E)FI<E)FI+EV1>
F<GL@FD5Z2+Cf>#AKWQIEb0*!D.7's-o*b8<E)FI.9BSP0P5$>F*&O+Bl7I"GB4m!:IH=7Ec6/C
ATCjR="nH)DKU29Bl\9:+Dbb0Fa,$$:IH=7Ec6/CATCjR=#"c-@rH6q+BN8pA8c[5+A,Et+C]A0
GB7>9='&Hi;GU@m78e2<Ch7*uARloU:IH=7Ec6/CATD3iA8H0mA927$BlJ0.DKBB0FE8QQD/=8B
+D58'ATD4$ARlp)@rc:&FE8R=DKKe>F*(i2FEMP3FCT-!Earp"DK]T3F(HJ4AftT"Ao_@&@r,Xa
Ea`He@;K@i@qC"8+C]A"@r#Xt+C\bq@;]Rd3Zr-Q+?_>"@q'Ie@q&k_@;]Rd+Cf4tCh@]sFCT,r
FCT,0FDi:5DI[TqARlonCh%C&H"Lc,ATM@"E+rm)+AYoYAnc'mF(96%@<?'kCh.7#ARfh#Ed8dG
@VTIaF<G(6ART[pDf-\@ATD6iEb/[$ASQ-oA8,OqBl@ltEd8dG@VTIaF<G(6ART[pDf-\@ATD6i
Eb/[$ASQ-oFDl)6F(oN+FD50"BmO?3+Dtb7+DPh*+EVO?Ci^_;@VTIaFCT?&@<?'t@<6O#Eb/[$
ATJu9BOr;sBk)7!Df0!(Gp$s4F*(u6+D,>(ARfal@<?('FD5W,FD50"BmO?3+E_d?Ch\!:+E(_(
ARfh'@s)m,Eb/ioG][t7@rri8AU&;>Bl5&*Bl\9:+EVgG+FAMZA7]RkD/"*'EZeh"Cgh3kARlon
BOPpi@ru:&+EDUBF#kFRC`kkn+CfP9BQ@Zr+Cf4uARd\WA7]7hA7]g)5uU-B8N8RM-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>0A7[<6AU&;G+EV%$Ch7ZuAS-7#@:NkZAS,XoAKWC8C2[W3+DG_8ATDBk
@q?cpEc5e;GAhM4+Dbb5FC\s(FE2;FC2[WnBk)7!Df0!(Gp%$7C1Ums+Co&)FE2;F+Eh=:@Us(\
Ci=B+@r-()AKYMt@ruF'DIIR2+D,>(ARoLcDKTf/ASu("@<?(%+CQC8DJ=*5AKYQ/FCf?#ARlp&
Eb/`pF(oQ1+DG_8AS5Rp+C\c#ARloR<CoShBk2:,@<?R$Bk)7!Df0!(Gp%0M@<?4)FD56+A8Z4)
ARTUhBQI`nEarcoF!,"-@ruF'DIIR2+DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5
F<GO2FED)7DKB?,@ru:'FC]N2D0[7JDfTA2AoD]4A8bt#D.RU,@<?4%DBL?<Ddt4=FCfN8Bl7Qo
De!m#G][P9Ec#6,F!,:;DJ()&De!p,ASuT@+E(_(ARfg)@;]TuBOtU_ATAo8AU&<-F_u)2ART+\
Eas-$@<?(%+EV:.+CoV3E+Wg#AKYE!A0?):Blmp-+D>=pA7]d(Bl7O$Ec#6,Bl@m#A7]:cF<G+.
@ruF'DIIR2+E(_(ARfh'ATD@#E+Np-AT)O!DBNJ(@ruF'DIIR"ATMF)ARoLs+EV1>FCf]=Ea`I"
BQ@ZrF(KT<Ea`I"+CT)&+C&T#AS-:;H[R#YAU&;>Ao_g,+B2oS+EMIDEarZmD00<2D/aT.G][P9
Ec#6,F!)lK@;TR,FCf]=.3N_@@VfUs+D,P4+CoV3E+s3&AoD^*;FO&D;FO>J73F0)FCB6++Eh=:
@N[6FEb065Bl[c--Zid<CF<_7AS#CdF),f-FEMVAF!,(8ARuupBle&CG&M2>D.Oi2E+*6f+DG^9
@X3',F(TH(ARoLrCM[^&Fa.A@FCfM9Ao_Ho+E)-?DJsV>-Z3j?ALAU:Bl8'<+Eh[>F_t]2Ao_Ho
A8-+#GA1r8ATW'8DK?q4Eb/f)A8-+#06V8MF_t\4F)YPtAKY])+C]G<ATJu+DfQtEBl5&7H#n(=
D0'?4Bk29pEb/[$AKYW.Bk29-@<3PG2BZISFCcS9FE2)5B6,26DBO"CE,]`9FCeu*8g&2#F*(u1
F(]W0A93!.F_PB-+CT=6AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDiQ+D5h2A92u<BeD(^>9IR$
Bk2:0+>Y,tBQ%s6F(K<#Df0`0Ecc@FE+*j%+C$QBF(K<!Eaa'.EcW@FD]j.8AKYr4AS,LoEb/c(
BQ%s6+D,P4D/"'8EbTW,@:F%aFCfN8F!+m6@VfOj+E(j7Ap%p++E1b2BHUo$Ch4`,@;TRs+D,P4
+Eqj?FCeliCh\!:BleK=Blmop@VfUlBl8'<FCfN8F!+m6@VfOj+E(j7Ap%p++E1b2BHV,*DKU1H
Anc'mF!,(5EZfRHBlmop@Vfb#H"h>DEbTW,@:F%aGA1r:ATMs7+E1n4D/"'4Bl@m104AsEEbT!*
FCfM9De:,#+C].sC`mY.+D,b4C`m\*FD)e/Bl%?'DIIBnF!,(5EZfRHBlmop@Vfb#H"q8.AoD^*
AoD^,@<?Q5-u*[2BOu"!.3N,=D/E^!A0>]&DIjr!DIal2E+*s.F!+q4Dg-86EZf:@+E1k'Eb/Zi
ATDO(A8#OjE+E[(E,8s.+D>>&E$/b2EZdtM6m-\lEb'6+De*cuAor09DK?pm:IH=DAnE0+ATN!1
F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0C2[X$DKL#ADBMPI6m-Dc+ED%7F_l.B
BlbCO+DGF1F*1u&ATMp)F_i1/DIakD+E)@8ATE!/F(K**@<?1(AT2^4@;]UaEb&m1ATJu9BOr<*
@<?0*F(K<!Ecc#6DBNG&@<,ddFCfJ8Bl5&'Ci*TrARoq#E+F*.E-!.DBOr;rF`MM6DKI"?@<?0*
@<3Q"+A*bt@rc:&F<G10Ch7HuB4Z0-D.-ppD]hXpF(96)E-*47Ec5e;ARoLs+EqO;A8c[/CiaH%
CLnW)Ddd0!F(96)E-,r=B4Z0-D.-ppD]j.5G]Y&V@X3',F"&5DEc5e;ARoLs+EqO;A8c[0ATqZp
Eb/[$ATJu&+Dtb7+Co1rFD5Z2@<-X2ATr0+B4P^dFCT?&@<?(%+CQC1ATo8-Bk)7!Df0!(Gp%$G
+ED%+BleB-EcW@3DBNM8FCB'/+Co1rFD5Z2@<-X2FCeusF<G!7DIn#7FCfN8+EM%5BlJ/:F`V87
B-9fB6m,uXDK]T/FD5Z2F)PT-E+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+E+*6lF)YPtARo@o
ATDX%DIml3BkAK0BOu3q+DGm>F*2),Bk(jgDKI"5Eb/f)F)YPtAKYo/+EV:.+C\bhCNXS=G&M2>
D.RZpFD,`0AThWoCiF25De:,/@<63,GA2/4+>G6b+DkP-CM@[!+EM+1ARfgnA0?)7Eb'56/Kf+G
AKYf-DJ()&De!p,ASuU/A7fjn@:WqiEb0?8Ec,q@@3BN"Afu,*@:Wqi+D,Y4D'381@;0Od@VfTu
DfBf4Df0W9FE)GAFCcRk9L2$785DoI78b6[+EV:2F!,X;Eag/3ARo@aBl7Km+CoV8Bl7Q+AU%cr
F`_>9DK9<$A9)6oBleB-EZee.A0?#4Eb/ltF*(u6+A,Et+Co1rFD5Z2@<-'nF)ki0@;TRfBl%@%
D/XT/F!+n/A0>o(DIIBnF!+7W+D,>(ATMp(FE_qQ@WHC2F(KB6ATMs7+CT.u+EM+9F!,R<AKY&U
=!1smDg-86EcZ29Bln$/AS-"&Ch[u6FE_XGA7]RkD/"*'EZeh"Cgh3kARlp(F`)7]+C].04Y@ju
E,961BQ@Zr+Cf50ATMs)DK]`7Df0E'DKKr2FE8RIE$079AKYK*EcP`/F<GC<@ps1b+D,P4+EDUB
DJ=!$+EV19F<G(%F(KE7Ddd]sBk]OaFDi:1F(8ou3&Mh!AT2[$F(K62@<?4%DKTo/@<?("F^f0$
@s)a$@<?(%+E2I4Ch[B%F(96)E--.DFCAWpATi!.Ao_HoEb0?8Ec,q@Ao_Ho+C]V<ATJu4DBO+@
CisT++E)9C<DGn(E+*j%GB.,2Ch[cu@<-R4@;p91FD,5.Ch[cu@<*K2AT2[$F(K62@<?4%DBNk0
+DbJ,B4W2X+E(_(ARfh'+DG_8D]iI2F(KB+ATJu4Afu/)EbTK7+Dbb0ATN'9Blmp#C3+T>Blmp-
+D,>(AKZ)5+E2IF+Co1rFD5Z2@<-W9A8-'q@ruX0H$=IV@WHC2F(KB4ATW'8DK?q/+Er$R+C]A0
GB7>9+D,Y4D'381@;0Od@VfTuDfBf4Df0U                                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>G`/2e6i:FCfN8.V*I-FCfN8+Ef=g+EV19F<G[:G]Y'?DfQt2De!p,ASuTuFD5Z2
+=Lc=@jrODATD64$49@H+ELt%A7]Y"+Dk[4FDi:CFCels+EV1>F<G19Df$V1Bln$"EZee.A0?/9
DBO%>+C]J-Ch+Z1ATMr#@psFiF!,(5EZfI;AKW*DA8bs,+<Yi=Eag.6@Wcc88K_kmF*&O6ARf.k
F(HI:Df0B:+ED%0BjkIeAI<KsAor6*Eb-A8BOQ!*A8c%#+D#e+@ruO4+EqL-F<G:>+Cf4rBl.o6
FDi:4D]ib8+CSbiAT2a"@VfT_FDi:=DeUg2$<1\QF!+n-B5_g)FD,M6G@>P8@:WecFCeu*Ao_g,
+CT.15u:5t@;KRpEbTW/D(Zr&F<GU8EHPu9ATJ2lBkM*%F)Y]%A0>?"DerunDBL'2BlkJ7@;]du
F_kK.Bl@l3@;]TuBlbC>DJsV>@<3Q&AnGUaFD5o0$>FB#+CfP7Eb0-1+A*btH#n(=D0$h.F!,1=
+DGm>Bl5%9F)Po,+<WsH9H\D%F*(u1F"SS'ATMg)FCbeO-Z^DJDf..FE-,f2@;I&qDf9H'@;^-/
FD,B0+Eh=:@N]B++EMX=Cht5+@<6N5ASuF/B4rE0D]iM#$>+=$Blms0Ci"A>@;p1%Bk:g-+AZkt
+DlBH1b^UX86R,Y:/i>YD.-pfBl7K)+F.mJ+<Y0&DBNe)CLmi.0J"n30Hb1CDJ+')+DG_'Eb/[#
Bl7Q+Eb03+@:NkcASuU2/0H?_BOr<1DfTo@+Cei$ALT/QBl5&%$8EYGD.R?g@X3',+<Y`IEbTE(
+<YB9+CT5.Ec62:D..NtCj@-GDf0,/+EM+(Df0)<+<X-lEZcJZ0JEiLBl%]sH$!U?F*)G:DJ+#5
FEqh>@ps0r+E)41Eaa'(Df0V=+Cf>,E,9*-AKY].+DbV1F!,R<@;[2r$?TisFD)e8Afu/+@rH6q
/d_qVBkM*%F)Y]%A0>r9@WQX3Bl7Q+Eb03+@:NkcASuT4BlbD-BkCsk@s)U0+EVNE@:NtbAThW-
Bl5%c$=Rg_+@/gt+D#G6Bl\-0D.RU,F"SS7BPDN1G%G]'+EqaHCh+YtAKYD(B5_^!+CehtA8,R_
FCcS,DfQ1nDBNM8FCfK1@;I&rDf'H-Ch7-"Ec6)BBl7K7$4:<h@:VDA+Cf4TBOPdkARloH/g+Y?
<+0f[ATVu9@q]:gB4Z.+EZek.;fm$e$47mu:-pQUG@>b>FDi:%:.[fK6q&5>FE2)5B6,2(F!,[<
ChsFc+<Yf:BOPq&4Y@k"3Zp.21G^.(+DEGN2)$^,+AP6U+E_R9@rGmh+EMXFBl7Pj+<Y3'FCB9:
E+L/7@q]:kF!)SJ+<VdL+<VdL+AP6U+=Lc/FCB9:E+LI@Ao_g,+DN$<Ec5Q(Ch3q\+<YfJF^d$f
/g)Ps0JG"k/ho(0HZ`h3@<-E3+AP6U+EM[7F*)G:DJ+"t+<YfJF^d'g/g)Pu0f(=o/iP5+F^o)n
EcVR1+Cno&@<?d6AKZ,:F^d$3+<Y3'FCB9:E+L/7F*1qH$47mu:-pQUF*)G:DJ+#5FD,*)+EqO9
C`mV6F<GL3@s)f7Bl5&8BOr<)EbT0#DII>g+<YfEATogk/g,9t+>bc+1,g^t/i,9j+<YfEATojl
/g,9t+>ki.0fLUs/iO+E+<W0e0-GCTATogN74o^*@q]:kF!)SJ:-pQUDJsV>Bl5&9@q]:kEsa$4
.kWItF`(c70d&n;+E_1-@<-Dr$6UI6@q]:kF)GQ54Y@j*-SHhuF`V\70J"S)-S0CXATogZ-SHhu
F`V\70e=\*-S0CXATojX+Cf(nDJ*O%FE/LH@q]:kEs`6s+=f&t+E_R5G;(../g,:HBOPq&DIn#7
+AP6U+Du+A+DG^9F*)G:DJ';!+=f&t+E_R5G;14//g,:HBOPq&DIn#!$47+               ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P'"+>GQ+2fN2IBQIm!G%E.B@<?1(Bk;I!+Ef=g+C]/+C`mY.+DkP.CERh8FD)dO-Z^DI
@<--tDJ()5ASbpfFCeu*GAhM4F"Rn/%15^'6m-)QFCSuqF!,"-@ruF'DIIR2+EqaEA9/l(AT23u
A8,po+<YT?+<Yc>ASH0-E,Tf3FD5Z2+E)-,$?Trm+ED%*ATD@"@q?c*E+*j%/0JkO+E1b2BHSF0
DfQtABQ%p5/g)9(Df0W1A7]d(+EV:.+<Y0&F(GdfGA(Q.AKW+;BOr<1DfTA2+=M>CF*&iR+DGm>
+Co%qBl7Km+CT=6@3BH+F`&<EBl5&(Bk)7!Df0!(Gmt*/FCfN8C2[W:.3N&:A0<"'F!+m6G%G]'
+DG^9.!0$AFD>`)0e"5RDIal#De3u4DJsV>De!:"EZf(6%14M*ATMs.De(XQ/g*G&-td+5.3KaO
Afr3EFCfN8.3KaCDfol,+ED%8F`M@B@3BH+F`&<EDfQtDATD5h$=m^eASu$mDJ()1DBNn,FD)e8
Eb&a%/g*H$+Du+?DK?q/Eb-A7FDl22A0>T(+C]&&@<-W9AoD^,@<;qc@;]Tu+CT)&+E)@8ATAo;
DfTB0+CT;%+EMXCEb/c(@<3Q5AU&;>F(96)E--.DBlk_D+CfG+FD55nC^g_nD]iJ)G@>c<+E2@>
E+O'+Gp$U5@<6L(ApGMCDfTB0+EqL1DBND2Bl%<oDJ((?D..3k.3KaDF_u)=%16N]A0>o(FEMVA
Bl7Q+F(Jd#@q[!$BleB;/0JM:3Zp+!0d&.mA8Z3+-RT?1%16'JBlbD@DfTA2F(fK9F!)TLBOQ!*
GAhM4F!)TLBl%T.@V$['ASbpfFCeu*Ao_g,+CQB8E+*j%+CT=#$?Trm+E1b2BHV#1+EVX4G%G]8
ARlooF`M26B-:etFCSu,DfB9.@<?4%DK@E>$4R>cATD6gFD5SQ+D#e:Ch[BnF<G+*Anc-sFD5Z2
%13OOE+*j%F(o3/AN`'s1E\_$-R^Yk4<l1:+F,CY,@3E<0d%l+-mL&k4s5,"+F>^f/j:C4.3L`7
/hnIkIQAT5+F,=D$4R>ZDf/uo3ZoPSCiF254Y@jr@<?1(Bk;I!+C].sCfbOqA9/1e%144#E-FGt
+=K?63[\BTD]iY4ART@gDJ()*Df7!P/7CRj-p0RP-YI@9+D,Y*@;BRpB.#,Z@6,r%4$"a&Df6b3
ATD?)FDl(F%13OO+<XEG/g,4KDg-7FGA(]#BHVM;Eb'56GA1l0+C\n)An?'oBOt]sAo_g,+E1b2
BFP:k+=M2;FD,`0AThW-E-E`R,:5$,+E2N6$4R=O$4R=O$4R=                         ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,:d21-$I4+>GPm1,_'O+>P\p0f1mL+>GSn0fLsM+>P_q0ebOH+>GSn3AWW;0f1"-0K(a10f'q,
3AWB42]sn81E\D.+?);@+>Ghu0f(U@+>GSn1H%$31,0n,1,Ug01,0n+2)dE91,0n+2`*321,0n+
3A`E41,0n-1c7371,0n+3Ar`;3?U1:2]sh1+>Gc21*A;3+>Yc41a"M/+>GQ)1a"M1+>Gl12'=V-
+>P]01E\D1+>GT-3?U%:+>GQ00d&Fu1b^^.1,0n.1,CU,0fL401Ggd.1,'h+2`NO%Df'H.6=FqL
@no?C.V!C6E,%^JF(o,,F=f'e@UX=l@j#r'Ch[E&-t@14E,$gE@<-"'D.RU,+EV19FE9&D$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(i3AT2a&D.7's+>PW)0F\@a
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB80lCoQ1,C%qE+EC!ARloqDfQsm:IH<Z/ibO@.h)gp$=e!aF`MM6DKI!K@UX=h
-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$a
FE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0F<GXC
D.Oi2FCB&t@<,m$GAhM4F!,RC+Cf>,E,oN2Et&IMDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X
3Zp4$3Zp*c$4R>ODf6a]/g,1G@;Kb*Ci=3(DIIBnF(&s(Dg?22+?_>"FD,62@<,pfF*VVAFDl"=
4Y@j2%17#cAU%crATMp,G%G`:@;]UaEb'564Y@jdDf6'l%172j@<>puARTXj@;TFcBl7QlF)Go;
FCB&t@<,meFCB!%+?_>"@W-0-.Nj!G$4R=i<(02H:K:=9;,pCk7787n5tsdH+@/mo+@/\":EW#&
<DGnP7787d:KL:=+?_>"@W-/o$4R=i7nc]F5tk3"79DoN<CB8D-TsL5@W-/o$7QDk%16Ze+EVI>
Ci<f+E-67F-VSGrB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@ooEap4r+=D2>+EVjM-TsL5@rH4'
C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B%14g4>9J!(Dfp/@F`\aJG]XB%%17/iDfTq_
3Zp4$3Zp*c$;No?+DtV)ATJu&Ci"-'@:XX+Df0,/@q]:k+>"^RDfd+3BOPdkARl5W@6H5g%17AD
/n#kP+>OB5H9Elh+=\LZ+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=D5DDfTqI%17,c+Bos9Eap56
G]Y;r3b*)FE,$LCF(fK4F=.M)0d'[CF)>i<FDuAE+EVjM%13OO%17#_C1UmsEb/j(4ZX]A+?CW!
%16fXD-pXg@VTIaF?M6!Gp#jK/g+\C+Du+>+Cf>,E,oN2F!,C1C1UmsEt&ImDf^#-?YOCb?Z0Cg
ARfgh?Xn"lAp&0/Df.]j+>OB5%16W[Eb/a&?[-g??Tg"aGp#jK/g+\C+Du+>+Cf>,E,oN2F!,:;
@ps1bEt&I*%13OOATAo8D/a<0@j#`5F<DrL@VTIaFE1r)F!hD(Eap4r+=D2>+EVjM-TsM#Df'H.
+=D):C1UmsEb/j(-OgD;+Bot0D/XQ=E-67FFEhm:$4R>TCi<ckCiX*!F$2Q?+?CW!%16`aDdm-k
F!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5+F+D'.1HUn$>"6#FDYu5Ddso/F`\`RB5DKq@;Ksq
Aof=/$?BW!>9G;6@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=/$8EZ-+EMC<F`_SFF<G[MF:AQd
$4R>QARfObEb/d&@rH<tF$2Q,1a"h%0F\?u$;No?+Co%nCgh?qA0>r'DfB9/+CT;%+EVOE@q^-1
DIIBnF!+n/A0><$AISuA67sBlG[kQ4A7]9oAo_g,+EV:.+Cf>,E,oN2F(oQ1+E2@>@qB_&%13OO
Dg#]4EbT&q4Z[4lDdm-kF$2Q,GT\,(67sZ9.6T:+Dg#]4EbT&q+D5M/@UX(o%13OO@W-0J/nf0A
4YChpD`o]q0d%S]+<Ve%67sB/.OdMA+C]8-+D>\3+EVO?%13OOAoD]sDIIBnF"SS\+CoCC%144#
+<Y-3D]gMPDIIBnF'iX!A7^!.+AP6U+DG\3Ch[BnF<G16E\8JNDe!3lF!,@=F<G(,@;]^hA.8kg
+<VdSG@_n0ATT&)Ecl80BOt]sDfp.EDe:,'G\M5@ASu!h-QkQ)+DtV)ATJtD+DtV)ATJ:fASu$2
%144#+<V+#BQ%f3.Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-Y-duCgh?qA927!E+O)<%17,c+Bos9
Eap56G]Y;r3ZqpND/a54-Y-duCgh?qA927!E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16rdG\(E,
@rH<tF$2Q,1E\_$0F\?u$;No?+Dbt+@;I'#F!+n4F(o9)ARlp"De!3l+CT.u+D5M/@UX'^$;No?
+EqL1DBNA*Gp$s<G\(D.F(9--ATJu&Eb-A(ATVKnFCeu*Df0B:%15is/g,@OBlmo/F)YPtAKY].
+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7lu:-pQU@;]TuBk1dmFD5?$ATJu2Bm=3"+EM%2E+O)"
$4R>YDe!3l4Y@k&+<Vd9$>aWj@;J(f+>P&h+Dbt+@;I&/+:SZ,%13OOATAo8D/a<0@j#`5F<DrJ
Bm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044+Cf>,E,$LCD/"6+A927!E+O)<%14g4>9J!(Dfp/@
F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A+?CW!%13OO:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)
AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"
+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0+DGm>FD,5.F(&ZlF*&OHBPD?s+EVNEA8a(C+B3#c
+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5DIal1AT2R.FE8R7Df000F(Jl)A7]7e@<,duBl@m1
/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AIStU$=[pl
4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ceD`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmMD[d%&%13OO
ATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m6Df000
F(Jm'@rH<tF!hD(%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>REb00.ASrVE%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&@rc-hFCfQ*F*(r,@ruF'DIIR"
ATLU5/h1@OART[lFCfN8A8,OqBl@ltEbT*++ET1e+CfG'@<?(%+D#D/FEo!$:IH=IATMr9A8,Oq
Bl@ltEbT*+/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JP:oAR[AN%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l'D..]E1E^OQA8,XiARlp*D]j(CDBO.;FD)e7ATo7FBkhQs
.3N>BFCfK)@:NjkCi<flCh4%_:-pQU0emQaFttcp-us0FDf9_H+CSekARlo8+CSeqF`VY9A0>u4
+EDUB+E)-?@W-@%+EqO;A8cZ7-6R,=DKU15$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sC&ATMs)
EZfLHBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO:-pQU
@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,
4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?
+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,OqBl@ltEbT*+%15:G/g*PR6W?uI3Zp7%De't<-OgD;
+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-+EM47GApu3F!*kB6W?uI3Zoht/g<"m6qKaF;^ih6
INU-n0-W+n-nID,FCfN8C2[W1.3M&3+?k-)+u(3.8OHHU%14g4>9G^EEb/lo-9`P?8OHHU%13OO
:-pQUA7]h(Ec64G@;Ka&@s)g4ASuT4C2[X)ATMr9A8,OqBl@ltEbT*+%15is/g*o-FCdKUFD,5.
IS*C(<(0_b+EDC=F<GFCF*&O6AKZ&*F<E.XF`V+:8g%V^DJ!TqF`M%9%15^'6rZTR<)QLf<'<8b
C2dU'BHS[O8l%iS78m/5%13OO:-pQU<DGn(GA1r*Dg-7FDImp6DfTV9Ec5l<%15is/g*b^6rZTR
<)QLf<'<8b-X9nnARf4f@<4+V>]k+!EcYK#A7At_ATD$jDe*s$F*',a%13OO0d'[CEc#i8Dfd*o
:IJ/N;cHXj:K.c1%15is/g+YEART[l+D#D/FEo!NATMr9A8,OqBl@ltEbT*+%16Ze+Dtb7A0<7A
ATMs.De(OL4%`::<(0_b;GU(f/14\EATMs.De(OL%16Ze+Dtb7A0<7AATMs.De(RM4%`::<(0_b
;GU(f/14\EATMs.De(RM%16Ze+Dtb7A0<7AATMs.De(UN4%`::<(0_b;GU(f/14\EATMs.De(UN
%16Ze+Dtb7A0<7AATMs.De(XO4%`::<(0_b;GU(f/14\EATMs.De(XO%16Ze+Dtb7A0<7AATMs.
De([P4%`::<(0_b;GU(f/14\EATMs.De([P%16Ze+Dtb7A0<7AATMs.De(RV-Tapr6rZTR<)QLf
<%KD%FCfN8C2[W;0II;:ATAo2ATqZ--Zip@FD>`)0eb:/4%`::<(0_b;GU(f/14\EATMs.De(RV
0II;:%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5A8,OqBl@ltEbT*+%16Ze
AT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?Q
ASa\AF(o,<0JQ<h/h1CCCdMQOBk&hN0d(Qi/KeM2F(o,,G%#3$A0<:2AS`e<FCfN8F"Rn/:-pQU
%15is/g,=KEaiI!Bl,m?$;No?%15is/g*GY;cQO\;`Z$U.3N%A;FNl>=&MUh73HPlF<G+.@ruF'
DIIR2+=M>CF*)/8A2#Gb%15is/e&._67sBQ:IH=8@;Kb$+EVNEF(KH9E$076F*&O9DK]`7Df0E'
DKI!Q+CT>4F_t]2+A,Et;bpCk6U`+,$;No?+CSekDf-\3DKBo.Ci!Zn+CT.u+A,Et+Co&,ASc:(
D.RU,+Co1rFD5Z2@<-'nF!)lGDe*BiFt[TKA1r(IBl%i>%15is/e&._67sB'+E(d54$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<YN;F!)iFDe*s$F*(u6-OgDX67sB'+Dbt)A0<77
De*s$F*(u6-QjN@$;No?+<Vd]+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-QjO,67sBjEb/[$
AKZ)+F*&O8Bk)7!Df0!(Bk;>p$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,DJs\P0d'tEDK]T3FCeu*FDi::2D-[=+>"^V
AStpnARl5W:-pQU0emNRGqh)tF`:l"FCeu*AoD]48iJCsBl8'<+Eh=:F(oQ1+E(j78l%ha$;No?
+>GTf@<jU^+=LuCA9;C(FCfJA+ED%5F_Pl--Y*Yn:-pQU0emQaFttir@q]:gB4YTrFDi:EF(HJ9
ASlC)Eaa!6+Dbt+@;KKa$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>R
EZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0F<G!7GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO
3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B13a68.1HUn$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z
/g<"s0L.$l+D!/J>:D!1$4R>REZfI@E,9H&+E2IF+=Cl3D0Ko=A1&KB+AP6U+DG_8D]iS)@ruF'
DIIR2%16Ze+CoA++=Cl3D0Ko=A1&KB+AP6U+DGm>BlkJ3DBO%7AKYMt@ruF'DIIR2%13OOATAo(
AS`J:Bjkk&DfTA9+<Ve%67sBkASbq"AKZ28Eb#UdDImi2FDYu5Ddso&ATT%BBjkk&DfTA9+<XEG
/g,@VEb$;,F!,")Ch7^"A0>AjDJjB7+D58-%13OO:-pQUBl8!'Ec`EY0JFVnDfTB0+DG_8D]iS)
@ruF'DIIR2+CT.u+Co&"ATVK+FD,6&%14M-DfTB6E,TZ94ZX]J+u(2fGAhM4H#R\?-Qjra0d%TT
C3=T>+<iih/1r&Z/g)l&0I\,-3Zp.20H_S_4<QL)3]/$B-Y["+GAhM4-OgDoEZfI@E,9H&+E2IF
+EqaEA9i-4DfZ?pATAo(AS`K5DfTB6E,TZ9%13OO:-pQUGA1l0+Du+>+C\n)@:F%a+EVNEB4Z0-
@;^?5A7]RgFCeu*GAhM4Et&IoATAo8D/a<0@j#DqF<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+
$4R>;67sBkASbq"AKYDtC`mb0An?!oDI[7!+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSn
A7]R"GAhM4H#R\?Et&IoATAo9FZhc.F`V,8+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*
ATD@"@qB]j$8EZ-+>=pNCi<d(-9`PrDfTB6E,TZ9%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;
67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=m^hFE2;FFCfN8A8,OqBl@ltEbT*+:-pQ_A7]h(
Ec65FATMs(Bk)7!Df0!(Bk;?.F=f'eA7]h(Ec65E+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?
%15is/g+SDF*2>2F#kElC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQa
Fttcp-us0FDf9_H+CSekARlo8+Du+A+EDUBF!,C=+BN8pA8c[5+CT.u+A?KeFa+?&%16T`@s)g4
ASuT4-XpM*AL@oo%15is/g,7IF*&OIFD5Q4+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I
+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19
F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5
FCfN8C2[W*A8,OqBl@ltEbT*+%15:G/g*PR6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)
CEQ#:6W?tn$8EZ-+EM47GApu3F!*kB6W?uI3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nID,FCfN8
C2[W1.3M&3+?k-)+u(3.8OHHU%14g4>9G^EEb/lo-9`P?8OHHU%13OO:-pQUA7]h(Ec64G@;Ka&
@s)g4ASuT4C2[X)ATMr9A8,OqBl@ltEbT*+%15is/g*o-FCdKUFD,5.IVNe3FCfN8+EDC=F<GFC
F*&O6AKZ&*F<E.XF`V+:8g%V^DJ!TqF`M%9%15^'6rZTR<)QLf<'<8bC2dU'BHS[O8l%iS78m/5
%13OO:-pQU<DGn(GA1r*Dg-7FDImp6DfTV9Ec5l<%15is/g*b^6rZTR<)QLf<'<8b-X9nnARf4f
@<4+V>]k+!EcYK#A7At_ATD$jDe*s$F*',a%13OO0d'[CEc#i8Dfd*o:IJ/N;cHXj:K.c1%15is
/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QBk0P=F(o,<
0JQ<h/h1CGA3s^GBk&hN0d(Qi/KeM2F(o,,-tI%&.3N_DF*)IU%15is/e&._67sBhF)uJ@ATKmT
%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:
@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z
+<VdTFCfN8C2[W:/0K%GF*)/8A2,VXFCfN8C2[W;0J">gATMs.De(RV0I\+R$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,
A7]7*3?VgMDK]T3FCeu*FDi::2D-[=+A,Et%15is/g)l'DJs\Q3$<?_A79RkA0>K&EZdt502-(t
Fa+?&%16T`@s)g4ASuT4-XpM*AL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%15is
/g,7LAKYMt@ruF'DIIR2+DG@tDKKT)Bk(RnBl@l3G%G]'+=Lc7A18X8B5VX.ATJ:f:-pQUBlk_D
+CT;'F_t]-FE9&D$4R>REZf:2+=D8BF*)/8A2#A?$>"6#A8,Qs0F\?u$;No?+Du==@V'R&De:,&
Bk)7!Df0!(Bk;?.Df-\:@<?0*D09oA+DkP/@qZ;Y0d&V%,9VCe+Co1s+>=63%16Ze+E(d54$"a2
ATMs.De(RFFCfN8C2[W;0HbIKF*)/8A2,bl-OgCl$8`kg+<r"W/g+\=A0<Q8$4R>REZfKf3Zp+!
A8,Qs0F\@H+?^hl+>G!XBk(p$FW_f%67sBpDI[L*A7]g)BOtU_ATA4e%16Ze+>Y-YA0<rp-Zip@
FD>`)0HbIKF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F+?^hl+>G!XBk(p$FU\Ze$=dm`@<*_C
+AP6U+EV19FD5W*+E2IDB4Z-,@UX=h+Dbt+@;KKa$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is
/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%13OOA8-+(<GlM\De*E50JQ<h/h1CG
F)Y,sBk)'lAM>em+ET1e+Co2-E,8s.+E(j71*C%OFCcS;DJ<U!A7[A&$;No?%15is/g*H$F*2>2
F!+m6;FNl>=&MUh73HPlF<G+.@ruF'DIIR2+=M>CF*)/8A2#GT@<Q'nCggdhAISuA67sB'+<VdL
+<VdTC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130K3TT@PBYK$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)2e6K00esk'+=M>CF*)A0
F)rcQEb03+@:Nki+=M;JDfp/@F`]&A$;No?+>PW*0l:?E1,'h&+=M;EDg-//F)rcQEb03+@:Nki
+=M>CF*)A0F)rc>$4R=O$;No?.Rd65:Js>>+=Lc7F)WQNA8c%#+Du+>+E2@>E+O'+Gp$X3F)Yr(
Gp%6IBk)'lAKYMlFCB9:E+O)"$;No?+>b3,E,m'V0JG@,0f(jH1HI?I%13OO+<XHV78?HN6psU6
<(Tk\5uL9C;dX6RDe*3<3Zri'+Co1s+>=63%144#Eb065Bl[c--YdR1FCfN8ATB.-$4R=b+E_3X
3ZrQ++=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9$6UH=F`(o'De*E,+>#VsA79RgFEqh:+E_3;+AP6U
+Cno&@<?d6AKY])+EMX5DId0rA0=JeE,ol/Bl%>i$4R=b+>G!C+>Y-YA0<6I%13OO+<Wj%HZ*F;
-Zip@FD>`)0IItc:-pQU8l%htFCfN8+Co1rFD5Z2@<-W9%13OO+<Wj%HZ4+L+=D;B-QjNS+<VdL
:-pQUF*)>@AKY])+EV19F<G+.@ruF'DIIR2%13OO+<Y69@<6!&-ZrrI+<VdL+<VdL+<V+#%144#
4tq=rATT%BF^uj/$4R=b+=D;LBk)'lALATP3ZqsAFCB9:E+L/7A0<!i67sBtF`VXID..NrBFP:X
$6UH>FZLWmFD,B0+DGm>F`(o'De*E,.3L3'+E_3;:-pQUD09oA+DkP/@qZ;Y%144#:-pQU.!''?
GApu3F"&5BAS,XoARlotDBL?BDe*s$F*(u6.3K',+<WB]>9J!#Dg-//F)rI7Ble59-ZrrI+<VdL
:-pQUD09oA+Co2-E,8s.+EqOABQ&$8+D#S6DfQ9o%144#ATD@#E+No00F\?u$;No?.Rm!34['uu
DfTl0@ru9m+DG^9CghEsEZfO:EcYr5DK?q=Afs\g%13OO%16W`Ce\>JEc4ogG]\"%67s`uDJW$U
@rcKeAU&<<+ET1e+<Y0-ARfLs+EV:*F<G".C`jj;@:O=r+<Yc;G]\!L@ps6t@V$['@<Q3m%15is
/g+S?A0>r)ASrW"Gp"MGDJUaS%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+@/q)<D>n\
3ZrHS@:XS&Blmo/E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.1HVZ67sB'+<VdL+<VdL+<W(IDe*s$
F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC
:IGX!:-pQU0emQaFttirF`:l"FCeu*AoD]48iJCsBl8'<%13OO@r,^bEZc_W+BosuDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
%16Ze+E(d5-Zip@FD>`)0II;:%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGT
F_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R
/g*##,<R>$%13OO:-pQUF*)>@AKZ/)EbTH7F!,=.@rcK1FCf]=+EVmJATKIH+AQisAKXT@6m-#Y
ATJ:f:-pQU<^BDN6pXd@+AG-h;GSE779EMf/g)9.<$5+29i+Md+B)68;FOM,<(KG#<(0ng%15is
/g+4e<(J,t:*;i$;bobP5u^9@+B2K?73Frn6q&4f:Jr<(5uUo/;FOP_8OZZG9J-b]:-pQU8TZ(h
F!,UE+EVNEFD,5.8l%htF`V,704SF,Ch7W0FDi:F@;KXg@<?''FCf]=/e&/!EZd1]E-67F@5'hs
-Yd^4EbTK7-Ta(<4!uX5/g+mOF(96)E-*4EAU&;>/hSb(%16Ze+>b3[F`\a70g.-:CghEsGUGR.
1-6j9/hS8_@<?(*+EV1>F<E1g/gh)8ATAnM+E2IF+CR#g/gk=SD/:R]1,D!>/hSb!BQS*-+EV1>
F<E1g/gh)8ATAnM+E2IF+CR&h/gkm\CaV;"1cm';/hS8kD/:>:AU&;>/hSb(%16Ze+>b3[F`\a7
1d*H=FCf]=-Ta(@4!uX5/g,+L@;0U%Derr,FCf]=+>,9!-OgDoEZd1]E-67F@5U2#-Xq@CALBPp
2EN9=/hS8TEaia)Eaa!6+Dbb5F<GL6+C]V<ATJtH/hSL\$4R>;67sBU8PN#(/KeP3F(HIL3$9VL
<(8hr+DGm>@3BW1ARfF_C`m4rF(HsH+B3#c+EV1>F:ARP67sC&D]iM#+ELt7ARlotF!,UCBk)'l
AKZ)+G]Y'BDBO%7AKXuP7Q;N%DI[TqBl7Q9%15is/g+,,AKZ)+G]Y'PBl%T.@V$[!@;0V$@;0Uj
A0>T(+B;B13$;gOEc#6,+ECn4BOu2n$;No?+EV:*DBO%7AKX9;6V0ilA8cU"Ch4_uH$!U?Bl7Hm
GT_$<E,oN2ASuTuFD5Z2+EV:*F:ARP67sBQ-Z^Cf+Z_J'B4YslEaa'$F!,(5EZek*@<-E3Dfp/C
Bk1ctDe:+N+C]&,+@/pn8P(ND$;No?+B3#gF!,L7E,oN2ASuTuFD5Z2+DGm>D/XH++Cf>,E+*6u
+CT.u+D,&&+Dl%;AKZ#)@:WeUCh4%_%15is/g+.n7Q=@9=B%F9%15is/g+_G+>b3[F`\a72*EQ7
-ZsNC3%$dC3'1,>7Q=@9=B#_:%14L<4""ca@rc:&F=/L[/NP"2+>Fuo0d("EC`k*?F(96)E-*H:
$7IVj-Z!45AU#RO+>#Vs1a"Lq1,9t_DJUFCCghEsGUEq--o!e2BQS*--Rg/i3Zp7%0d&5-+CoA+
+=CiED/:R/$7IVj-[9KE-Rg/i3Zp7%0d&5.+CoA++=DDNCaTZ!-o!e2FCf]=-Rg/i3Zp7%0d&5/
+CoA++=D8BG]Y;B$7IVj-Xq@CALAoL/NP"2+>Fuo2BZOJC`k*7H$!UF%13OO:-pQU-o!e2F`_4T
-Rg/i3Zp7%0d&52+CoA++=D;RAiM.I$4R=s+BrAbF?M6!@5'6@0e?`g/7C=c3ajiS$4R>;67sBk
D]j.5G]\!LD..NrBKlq5A79R&/NP"<HTE9++D58-+F>^b0d("8F:AQd$>"6#1E^UH+=ANG$4R>;
67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE
%16Wa@ru:'FA>.T.V*I-FCfN8+ET1e+EV19F<GXHF^cJ*DfQsKA8bs,+EV19FD5W*/db??/db??
/g+,,BlbD2F!+m6+EMI;Blmd(Gp%3?F*&OKBln#2@3?\'De!p,ASuT4BOtU_ATAo8BOQ!*GA1l0
+C\mh:-pQUF`V+:FDi:DATMr9A8bs1$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB'+<VdZ/hSb!
F`(f0Ec#6,ARlp*AU&;(:-pQ?:-pQU@rc-hFCeuD+>Pes;e9nj1,(CA+>GQ21Gh-K1C=Ia67s`V
;Gp:g4['u:GAhM4.3N52Bl%i5Df-[M/hSa`:-pQU1,U1QAT/bI0JGI/0ebXE1cdEK$49Np/h0=^
=?Shj@rHC.ARfgnA0<KW/hRJ<F)>i<FDuAE+=C]<@ru:'F<E.XBlbD*+CoV3D0[7GATMr9FD,*)
+CoD%F!,OJAS#s+AgJd>+CT)&-OOL&DdmcS@<6-m0JG4V67sa#Ci<d(6=FqL@k]Sk+ET1e+<Y-%
F(o,,B5DKqF!,R9F*)IU%15is/e&._67sB[ATMs7+CQC)@;0P#Eb-A-DBO+2Ch[E&DIIBn+D#e>
Ea`I"Bl@l3A8-*pDg#]4ARlp-BOu&j$;No?+Dbt)A8,po+EMI<AKYo'+@:!U+@9X[DIm<nGpdYU
8g%V^A7ZltDKKe>8hM5/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB80lCoQ1,C%qE+EC!ARloqDfQsm2_Rj=DKU15$4R>PCh7$q+=ANZ>9IEo@s)g4ASuT4-XpM*
AL@ooEb065Bl[c--YdR1FCfN8ATB.-$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?
+CfG'@<?''@3B`)Eag/8Bln#2DJpY1Ci<ckC`mn0EbSrkCh4`0AS,LoASu!hF"Rn/:-pQU@;Ka&
FD,5.@<6L(B5V9k+DtV)ATJu&Eb-A:@<-(#F`SZt+Cf>-F*(i.FE8Q6$;No?+Du+8AKZ&-Dfol,
+CT5.ARTU%@<3Q/@;TRs+EqL1DBL??Ci<d(.3N>G+CT5.Ch[Hk/e&/0ATMs'Df0W<@;^1.4ZX]A
+?CW!%16N,/g+LUC,$/)@Qc=d?T33g%16T./g)o*E]":5A3DOf?SQ+N%16]1/g+LU@PKeN$=u@Q
+>P`t%16]1/g)ui3"63D%13OO:-pQUF(fK7Ch+YtAKYQ$E--@JB5DKq@;I'&BleA*$8=Uf5'o=5
B5DKqF!l'@F*(o1DKBo.DKKqI%13OOATD4#AKW@BATMs'Df0W<@;^1.-OgCl$4R>;67sB[78m/.
;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%16`aDdmcV
G][t7@ruF'DD3b!:-pQ_B5DKqF%(=qEa`I"Bl@lC0JO\l/M/)eATMr9DIIBn+D#e>Ea`I"Bl@l3
AoD]4-n6Z//g+S?A0<9M.6T^$$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)l'DJs\R1E^gZA79RkA0>K&EZdt502-(tFa+?&%16T]ARTU%-RU$@+Cf>"F`MM6DKI!K
@UX=h-OgCl$;No?.Rd65:Js>>+E)9CFCfN8+Co&)@rc:&FD5Z23XlEk67sB72_T)ZF>#@++D#e>
Ea`I"Bl@l3De:,&ARfObEb/c(-n6Z/+DtV)ATJu+@;0P!+EqL1DBO%7ATD?)BlbD*+:SZQ67sC%
Bl7R"AKYu8DffP5-QmAKARf:^Bl7Q+F)Po,+Co%nCgh?mFD5Z2F"Rn/%172gF*)VEEb%<o+>Y-$
+>=63%15is/g,1GEHPu9AKW@2BlYRD+Xefh4Y@jlE+*j%%15is/g+tK@:UK.IUQbtDf0W$@<,j_
H>.>'H=gl-ATMR#F!)VS.OdM5+F8'>@:UL,A8-',+<VdL%13OOA8bss@<?0G/g+nJ@<?0*-[oK7
A8c@,>\@VcATD3q>\\1f>\\1fA8bs_BQS*-A8bs_-OgDpBl%@%4Y@j2+F>:e+F7R4EZen2@rPju
BIkNADe!p,ASuU2/p_5N-OgDn@<>p@/g,I\ART*n0d((BCh7Z1/1r&-A8bss@<?/l$7QDk%172g
F*)VEEb$mf3Zp4$3Zp*c$4R>;67sC$AT;j,Eb-@@A8-'3+<`-_.6T:+C2dU'BFP;D67sBsDdd0!
IUQbtDf0W$@<,j_H>.>'H=gl-ATMR#F!)VS.OdM5+F8'>@:UL,A8-',+<VdL%13OOA8bss@<?0G
/g+nJ@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>\\1fA8bs_BQS*-A8bs_-OgDpBl%@%4Y@j2+F>:e
+F7R4EZen2@rPjuBIkNADe!p,ASuU2/p_5N-OgDn@<>p@/g,I\ART*n0d((BCh7Z1/1r&-A8bss
@<?/l$7QDk%13OO:-pQU<+oi`AKZ&-Dfol,+C\n)DJpY1Ci<ckCi^_8BleB-A0>T(+C]82BHUen
F(KD%$4R>;67sBjCghC+BkDW5DIIBn+E_a:%17,c+Bos9Eap5)CaV@u+>P'd/g)l'+D5M/@WNY>
FCfN8GAhM40ddD;%15is/g+eCDdm-k+Cf>4DKI"8F!,d?Ec2Bo0H`M$+>=pb+<r3s+>G!c+u(3Q
C^g^\$4R>;67sBjCghC+BkDW5DIIBn+E_a:%17,c+Bos9Eap5)CaV@u+>P'd/g)l'+D5M/@WNY>
FCfN8GAhM4-OgCl$;No?+D5M/@UX'q@rHL-F<G:=+F7U>D[d%-+?^hi0Hb]b,:5Ss0d(fe0d(+F
%13OO:-pQ_7S-]F4s2O<05k?B0/5=,/Kf.U@:NkZ+EVNE-uX'5EGf3%ATK:CBl8!'Ecbl'+Cf>#
AKZ)5+ED%4Cgggb+:SZQ67sC#F`2A5+=A:ABOPq&+EqOABHUc#@;]k%+EVNE@<QR'A0>B#DJ"$4
Bl7Q+-uEC6CMmT1%13OO%13OO%13OOB6%r[D/aTB0JG4V67sa#Ec=HaE--@Z0JO\l/M/)TEb/[$
AKYQ$E--@JB6%p5E-!W@$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sBhF)uJ@
ATJtl76s=C;FshV+E2IF+Co1rFD5Z2@<-W9DfB9*%13OO:-pQU@rc-hFCcS+D/aTB+D5_5F`7cs
ATAo+Ec<-`-YII<F`;5@ChtdQ%13OO:-pQU@rc-hFCcS+D/aTB+D5_5F`8HT+EV:2F!,(5Ebuq;
@q0Y%F!,"9EbTE(+CoV3E$014F*)>@ATJu4AftZ%E--@JB6%p5E,uHqATAo+Ec<-KB6%p5E,Kf7
Cb[;!-RT?1%15is/g,"RCijB1Ch4`,F_kl8+EVO<ATD4$ARl5WATAo+Ec<-KB6%p5E,Kf7CbdA"
-RUu'-S/[e/3IW!0F\?u$;No?+B1d.<$5+>6UO:@;asb\%16oi@:XIkF*')i0k>!.FD5Z2@<-Wg
67sa(Ddd0uATMrI0JR*P@ruF'DIIR2+ET1e+Dbt)A0<UO+EV19F<G+.@ruF'DIIR2/e&._67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emNRGqq&r-u!F7A18X8DKKH1
Amo1\+Dbt+@;KKt@:Wn[A0>u4+C\c#AKYGjFD)d+$;No?+<VdL+<VdL+=LuCA9;C(FCfJA+ED%5
F_Pl--Y6ft$;No?+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>GTgDg!ll+=LoA
F*)J7E%)oMASl@/ARm>7.!0$AF=A>CASbq"ARlo8+EM+*+C\nuDg)Wt%16T`@s)g4ASuT4-XpM*
AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU
8l%htF)Q2A@q?d,DfTB0+>"^QATDEpF!,F1FD)e-Bk)7!Df0!(Bk;>p$9g.jD..3k+A-Q_;f?f!
@qAJFFD+'bD/_X!+=LuD@<?0*-[nZ`6rZTR<$s+G-SK4QA8kt!BJ+"6F!hD(%15is/g+b;FCSu,
FCfN8+Co1rFD5Z2@<-W9@rH7,ASuU2+EMXCEb/c(@<3Q"+:SZQ67sBkF_u(?F(96)E-*4:DBO%7
AKY`+A0>DoG%GK.E,B0(F<G+.@ruF'DIIR"ATJ:f-ZW]>F(A^$-TsL51a$FBF<Dr1ATMr]Bk)7!
Df0!(GsldlE$l)%.!mQj0d(OJ@<<q]3Zrc1+u(3]A79Qh$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2,G@$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ
+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ
@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+Dbt)A0>u*F*&O8F_u(?F(96)E-*33$7I;V+Z_>30I\,*
3Zp+;.3MT$F*'fa@ruF'DIIR27!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;
67sC"@:O'qA8,OqBl@ltEd8dLD]j(3D/XT/+<k?-@:UQ)Anc'm+Cf>,E,TW*DKKq/$>"6#E+*6l
A0<7AATMs.De(RM%13OO:-pQUFD,5.AoDL%Dg,o5B-:o+F(KB6F!,=.DL!@GBl7R"AKYf'DIjr$
ATM@%BlJ0.Df0V=AoD]4GAhM4F!,[@FD,T8F<G+*F(96)E-,f4DK?p0$<')K+D,\+DC.Oi0H`(m
1E^RRAU&/:-RT?1;a!/a;]m<6+=K?+.3O(#+F>^b0d'C($>"6#0H`=tE-67F.!mQj0d'CD+=o,f
-o`n-4>%g3+<r3s+F?-n0d'CD+F>^f/j:D)3[-:$;[j'C$;No?+Dk\1B4W3"DBMPI6m-PhF`Lu'
%14L30HiJ2.3LZ4+>>i*+?W87A5dDhEarZW@<?0NF_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-U
F(dQo3F<4&%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=
F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%
+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g*nb<(.p)
8PN#B+Co&"ATVK+FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9G%kA--rac!F@9hQFD5Z2@<-W]
F_u(H%15is/g+S?A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9FD,5.9L_Al/M/)eBOu3q-Z^D=
+A,Et+DkP&AISuA67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4F!,[@FD)e=BOr<-@;TQuDIIBn
+CT.u+Co1uAn?!oDI[c2DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,XfATD@"F<G+.@ruF'
DIIR"ATJu4DBO%7AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9.!0$AFD>`)0e"4n
FCfN8.3N>G+CQC9ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?DD!&0ASl@/Bl7Q+
BlkJ2ATD?)Eb0*+G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(AKYT!G\(D.FD,B0
+A!]"Bl%T.D..3k+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*Bl5&8BOu6r+D58'
ATD4$ARlp*ATMr9A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k$8EZ-+Co&"+=D8BF*&c=
$4R>;67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+=D8BF*)/8A2,G@$>"6#D..3k+=ANG$4R>;
67sC%BQ&);@rHL-FE7luATAo(Bk/?8+>=63%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?YDdd0uATMrI0J[0Q@ruF'DIIR2:-pQ_Ci<`m
FCfN80JG7mBk)7!Df0!(Gp%2\/KekJ@:UK8GT\aaFCfN8+Co1rFD5Z2@<-WG%15is/g(T1:-pQU
:iC;qCghEsF!,R<AKYo3A7]d(0mFfr+EV19F<G+.@ruF'DIIR2/g*u!Ec`FBAfu2/AISuA67sBs
@<-!l+D,1nF(o*"AKZ)+F*&O7@<6!4%15is/e&._67sC(ATD6gFD5SQ+CT>4F_t]2+D#G/F_>A1
AU&<*DKI"3Bk)7!Df0!(Bk;?.FDi:2F_PZ&+:SZQ67sB'+<VdL+<VdL+>GQ(0In8iDfTA2FCfN8
+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JP;"Dg!lj%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R1E^^LD/XT/A0>;uGp"MRCh.9hE[`,ABk)7!Df0!(
Gp!P'%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO:-pQUEb0*+G%De<
ATMr9-6R&AA0>r=F*(u1+Co1rFD5Z2@<-'nF!,(8Df$V.G][A3F<GC6F*%iu5'nn)6qKaF;a!/a
1a$^I+=ANG$8EZ-+@Jdg<)Yq@+>G!XBk(p$6qKaF;[j'g+BosV8OHHU4ZX]6HS-Ks+@Jdg<)Y4g
,CUae/g)Ys0-W+n-nID,FCfN8C2[W1.3M&3+?k-)+u(3.8OHHU%14g4>9H=*6W?uI3Zpg^6W?u,
/M8/-3[\Z\A7T7p+DPh*+E)(,C12-1%13OO:-pQUDfB9*+CT@7D/XK;+>GbsA8,OqBl@ltEbT*+
%16Ze+E(d5-o!VB/gEbU6W?u5HS0_!+E(d5-RT?1%15is/g+\ID/^V:@<?0*%16Ze+DkP&AKYT!
Ch5aj+=LuD@<?0*-[p/KD/^jO+=nlnC3=E0/no'A-OgDoEZd.\De't<-OgCl$;No?+Dbt)A0<WM
0mFgOBk)7!Df0!(Gmt*lEZf:2+=D8BF*)/8A25MA$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5
F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu
+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+Dbt)A0>E*D/^V=@rc:&F<D#"-n$bm3\W!*3]\B;
3[l16Anc'm%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sC"@:O'qA8,OqBl@lt
Ed8dLD]j(3D/XT/+<k?-@:UQ)Anc'm+Cf>,E,TW*DKKq/$>"6#E+*6lA0<7AATMs.De(UN%13OO
:-pQUB4YslEaa'$+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(+D#S6DfTnA@<3Q.@;^?5
GAhM4Et&IO67sBhEb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)ATJu&Eb-A-D/aN6E+O'+
Gp$X/@r,RoARmD&$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q%13OO:-pQUE+*6lA0>;uA0>_tCLnUt
$>"6#E+*6lA0<7AATMs.De(UN%16Ze+DkP&AKW?J%13OO:-pQUF(fK9+Cf>4DKKq/$>"6#A8,Qs
INU<R$4R>REb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<4&Ci<`mFCfN80JG:nBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C)A8,OqBl@ltEd8dL/M/)]
Ddd0!0mFfs+EV19F<G+.@ruF'DIIR2/e&._67sAi$;No?+AcuqF_kK.ATJu9BOr<)Eb&a%+>J*`
1E^dNF*&O8Bk)7!Df0!(GqL49@<-H4De:,6BOqV[:-pQUCgh?sAKYSr@<6-lCh4`2ATMr9@psFi
/e&._67r]S:-pQUG%G]'@<?4#3ZohmATMs.De(RRFCfN8C2[W<.3N&>AKYf-@:Wq[%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;DJs\R0b"Ib67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sC!E+No0FCfN8+>P'M
Bk)7!Df0!(Gp$^1FCSu,@;p1+Dg3C<@;KNuGAhM4Et&IfEZf:2+=D8BF*)/8A25MA$>"6#=&2^^
;a!/aA8Z3+-RT?1=&2^^;a!/aI4eSs;FFFm$<L#$6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%21
5V5#G,?IZ=6rPO!,?IZ=6rOO%%15d)<'<8b2D?g-:-pQUCi=D<F(or3%13OOEap4r+=D2>+@JXf
;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%1604;FFGH3ZohE:K0G/,?IZ=6rPNW
I4cXD:JsSZ%14g4>9G^EDe(4C%13OO:-pQUDfB9*+CT.u+Cf5!@<*J=FCfN8C2[W=.1HVqEZf:2
+=D8BF*)/8A2>SB$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN
2(9b4-RT?1%16Ze+>=om0Hb=WF<Et?7T0a'0d'[C1E^UH+=ANG$4R>REZf:2+=D8BF*)/8A25MA
$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]6
9M\VM/gFFn;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De't<FCfN8C2[W=-OgDoEZd%Y
0ea_hF`\`o77L2b$8EZ-+>Y-YA0<6I%13OO:-pQUAn?'oBHU_+Ci=D<De:,7DKU#3A0<WMA8,Oq
+EqaEA9/l%DIal1@;]UoD/=J?Eb0,sD.O.`ATAo3A0<7AATMs.De(UN%1604;FFGH3Zoi!/g+\B
C`k)Q.3L2p+BM?:6rR#Q9FV>L@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9
/g+4k;FFFm$:I<P;a!/a-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpcAN;1^-p1p!
4"r+3+@JXf;[j'g+BosE+E(d5-RT?1%16Ze+E(d5-Zip@FD>`)1FEV=ATAnI+>GPmE-67F6q'RD
%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze
+E1b!CLeP8FCfN8C2[W=-OgCl$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+
DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaEA9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,
F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC-OgCl
$;No?+E1b!CLePrDIal,@;BEs%16Ze+E1b!CLeP8FCfN8C2[W=-OgDoEZf4-CLnV9-OgCl$;No?
+EM47G9CC6F`);B%16Ze+Co1s+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>aWhA9;C(F>,C*A8,OqBl@ltEd:DH/h1[U@:XIk
F*')i1h:<1FD5Z2@<-W9F=f'eCi<`m+>J*`1a$mOF*&O8Bk)7!Df0!(GqKO5:-pQU%15is/g*u/
E-5u*FCfM9FD,5.DfTB"EZd)]+>b3_ATMr9A8,OqBl@ltEd98[:gnBd+E(j7FD,4p$;No?+DbJ,
B4W2tARTXo@VfTuFCfN8+Cei$AM+E!:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBF`_>6F"DEE
F*)/8A2,WWATMs.De(UP+CT;%+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JP;"Dg!lk%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I
+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&
F<DrDDf9/64"!Wr6miEN%15is/g+tK@:UK/F`_>6F"&5DEc5e;A9Da.%16Ze+E(d5-ZsNFCi^s5
$>"6#D..3k+D,>(AN`'s-u*^0FD)dEIWT.<E$m(c-SK4WDJLk=C3(a3$8EZ-+>Y-YA0<6I%13OO
:-pQUDfB9*+=M>CF*)/8A2G_X@;]Tu@r,^bEX`@eEZf:2+=D8BF*)/8A2GYC$8EZ-+E(_1+Co&"
-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1-n$bm3\W!*3]\B;3[l16
Anc'm%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$8EZ-+>Y-YA0<6I%13OO:-pQUDfB9*
+EV19F<E:\A8,OqBl@ltEd8d>ATVEq+CT5.Ec61FBOP^h+EqaEA9/1eATAo3A0<7AATMs.De(RM
%16Ze+BM?:6rQ60+CoA++=ANG$<L#$6rQ60+FPkD:JsSZ%1604;FFG^78,j*=&2^^;a!/a=&2^^
;]pF9+=JX#/jM!L.3hni;FFG459j6*;FFFm$4R>9:K0J<+>to-+AP6U+Dbt<+EM7CAIStU$?BW!
>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]69M\VM
/gFFn;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De't<FCfN8C2[W>-OgDoEZd%Y0ea_h
F`\`o77L2b$8EZ-+>Y-YA0<6I%13OOATAo3A0<7AATMs.De(RM%17,c+Bos9Eap4[77L3'4ZX]>
+>GPmB4Z0--qmE94>%j[:JsSZ.3Nsi+BM?:6rOO%=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:
6rOO%0d'[C1E^UH-RT?1%16Ze+E(d5-Zip@FD>`)1a`_>ATAnI+>GPmE-67F6q'RD%14g4>9G^E
De't<-OgCl$;No?+D,2,@qZun+Dbt<+E(j7F`)>CARlo<+Co1rF<GdGEb'56@;]TuEa`irDf'<9
+ED%2@;TQb$>"6#De't<FCfN8C2[W;-OgDa:JsSZ4ZX]6I4cXQDJUFC-Rg/i/g+4k;FFG^78+-t
Eap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%15Kl7T2H2+=JWl
+F>:e+@JXf;^ih?-8%J)4<cL&BP(ct-mM,K7T1a#0kE?o+=K?\3]f#EI3:pH7T0a'0d'[C1E^UH
+=ANG$4R>REZf:2+=D8BF*)/8A2GYC$>"6#0H`)(+E2IF+@JXf;[j'C$;No?+E1b!CER/%@ruF'
DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0@r#Tt-Zip@FD>`)1a`_>
%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)
Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.
Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g,+A@r#Tt@;]TuD..3k
+:SZhEZf=0@r#Tt-Zip@FD>`)1a`_>ATAo1@;BEs-RT?1%15is/g,4KDg*=6Dfor>Et&IfEZen,
A0?=D0F\?u$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,%16oi@:XIkF*')j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P@ruF'DIIR2+ET1e
+Dbt)A0<T\GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8
C2[W;.3NGF@:Wq[%15is/e&._67sBjEb/[$ARmhE:2b;eD.7's+>Gl:3?Sb<:-pQB$;No?+<VdL
+<VdL+<X9P6m-\^F!,FBARf:_A7]9o@X0)<GAeU8@<-0uATAo7H#n(=D0%<P<+ohcCghF-ATA4e
:-pQU+<VdL+<VdL+=L`.Ci!Zn+A+pt.3N/0FCfM9Ao_g,+>Gl:3A)FH:IH=8@;[3/FD5Q-+Dbt)
A0<T]%15is/g)8Z+<VdL+<VePARTU%Derr,8jQ>tAnc'mF!+q7F<G[=ATD?)D..]4@V$[$Ec5E'
ASlK2GA2/4+EMXCEb/bj$;No?+<VdL+<VdL+<Y--DIIR"ATJu&F!+'tBlnE-Ch=f'@<3Q1Ec5Dq
@Vg<4@q]:gB4YU+%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
0lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z/ibO@.h)gp$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9
@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$4R>;67sC!E+No0.!0$AFD>`)0e"5RDIal&Ea`E"0etF:+EqaEA9/l;Bln$,
F`\a:AS,XoBl7Pm$>"6#De't<FCfN8C2[W;-OgDHHS-FcG^)A4+>=om0Hb">F<Dtd1,(CH,CM1T
DJU[J.=6IqA8Z32-QjO,67sC)DfTB0%15:G/g,7XF?MZ-0d(+?F<Gua+>G!LDJUFC-QjNS+<VdL
+<VdL+<VdL+<XEG/g,7IF*)I4$9ieh+Dkt44ZX]B+D58-+FPjb1a$=HC`k)Q+<VdL+<VdL+<VdL
+<VdL+AP6U+DkOsEc6".$>4!a4ZX]J3ZpL,,=#m^E$d2$+FPjbB6%r=-QjNS+<XEG/g,4LH=\4;
AfrL:De*s$F*',c+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGRY"%FEBZ,+>G!XBk(p$FEDUI%16rh
D*9p&0d(FL@r!3(D/B^h%16Ze+>Y-YA0<7AATMs.De(RM%13OO:-pQUDfB9*+=M>CF*)/8A2,be
+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5
-Zip@FD>`)0easa$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN
2(9b4-RT?1ATAo(Bk/?8+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*
F)YPtAISuXEZf=0@r#Tt-Zip@FD>`)0easa$4R>;67sC%FDl22+EqaEA9/1eATAnI+>GPmE-67F
G^+HB$4R>;67sC%FDl22+EV19FE7luATAnJ+E2IF+EV^I%13OO:-pQUF*)>@AKYhu@rcL/%16Ze
+>b3[F`\aCD/B^h%15is/g,1GE+NI"ARoV&+Cf(nDJ*N'GAhM4+DtV)ATJu&DIal2FDl22%17,e
DIIBn4ZX]?1E\_$-Ra<o+u(3c.3L2p-7:/`-RV/1-8%J)4<cL&,!$ht/g)Qe.Nfs].3L,`BeCMQ
Gpa%.5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtc+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^
BQ&*6@<6K40H`)(+E2IF+=JreEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX
+>GPmE-67F-o)ocAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
1E^^LDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtg+ED%2@;TQu
G^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K)iEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oN2gAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2^!-PDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtk+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRXuh$;No?+ED%2@;TQuFCfN8
+Cf>/Bk;?.@;]TuF*)>@AISu1HS-F^BQ&*6@<6K40d(FXF<Dtc+ED%2@;TQuFEDUR+=K?\3]f#E
I3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dtd+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^
BQ&*6@<6K40d(FXF<Dte+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FX
F<Dtf+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dtg+ED%2@;TQu
FEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dth+ED%2@;TQuFEDUR+=K?\3]f#E
I3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dti+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^
BQ&*6@<6K40d(FXF<Dtj+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FX
F<Dtk+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AQd$;No?+DG_7ATDl8FCfN8+EqaEA0>DoF(96)
E-,f4DK?6o=&)%U78l?1+CoA++=ANG$<Ktg9gquD3Zri'+BM<(9gqti$<'Jk;H-%[6W6-/-pK=4
,?IW+9gqu0,<.A++=&9d4s26u=&)%U78kW[4=>5^F*',j+D58'ATDKp+Dk[uDJ=!$Ch7[/+EV19
F<G+*F(96)E-,f4DK@07$>"6#0H`=tE-67F=&)%U78k<[/g+(`:Jt.[:IA%i$4R>;67sBnASu("
@<?''@<,gkFE1f1Gp$a?Dfp#?+EDCCB4u+,+EV14+EV=7ATJu1@<-!lEZfI;@;ZM]:-pQUFD,5.
B6%p5E-!.9DBO%7AKWCCATMs.De(RO+Co1rFD5Z2@<-W&$>4!a4ZX]L3ZpX>+>GPm.NgH"+<r"A
B4hY\9gMlO;G^:`>"(S8+<sr_5tsdH%16`\B0A9u9gMlO;G^:`>"'Pr/g+e>B+52<;G^%Y;cH[Y
3Zoh!4<cI%B4kj++?q2*4s2s^6!-WT:fBqh74B@+-8%J)4BG9D9gqti$:duj9M&/^;a!/a-p/\-
+EVX<D/O/s@;9^k?Q_HT0d%icATMrJ0P>EF-Qjra0d%TTC3=T>+<iih+=o,fBeCMQB4kj++=nil
4s3?n:eXGZ<)X554!8l&+u(3QEc<?h+@f=+9M&/^;[j'C$;No?+D58'ATD4$AKYE%@VKq)@<-W9
Ea`irDf$V=ATMr9F*22=ATJt'$9KAW/g<"m>9G^EB6%r80H`(m-n%2*F*22=ALAoL/1)u5+<iin
/j:C?+tt-R/g)l&0I\+q/g)Pu0H`S(0H`(m>9GXS0H_S_,CM1!+CoA++=ANc+F>5Z/g)kkA8Z3+
-RT?1%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4
+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3
Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g,4KDg*=7Bk)7!
Df0!(Gp%0M@<?Q"$>"6#A8,QsINU<R$4R>;67sBjCi=B++EV19F>5HlA8,OqBl@ltEd8d9DIal"
Ch7$m+E_W4$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,Ci<`mFCfN80eb:lBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,F'A8,OqBl@ltEd8dL/M/)]
Ddd0!0eb;++>RhF+E):2ATAo3Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-WG%15is/e&._67sC(
ATD6gFD5SQ+CT>4F_t]2+=M>CF*)/8A25SVCi<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lk+E_X6
@<?'k+D,P4+A,Et+>>E./i5'f$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_
5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&
-OgCl$;No?+E)41DBL?LATMs.De(RV.3N&:A0>MrF<G"4Dfor.+>GQ(0JFVnDfTB0+EqOABQ&$8
+Co%qBl7X&B+52ZEZf:2+=D8BF*)/8A2,bc%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1T
DJU[J.=6IqA8Z32-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<Ve%67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL
+E(d5-Zip@FD>`)0easa$4R>;67sC!E+No0FCfN80eb:(@;]TuA7]RgFCcS'Cht5<DfTB0/0JSG
Dfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$>"6#De't<FCfN8C2[W;0JFj`$8EZ-+E(_1+Co&"
-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s
+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6l
A0<7AATMs.De(RV0II;:%15is/g,4WDfTD3GAhM4Et&I?HS-F^BQ&*6@<6K40H`)(+E2IF+F&-U
%13OO:-pQUEb03$@<?'kCj@.5BOPdkAKZ28Eb$;1@;TRs+CT.u+EMXCEb,[eEb0,sD.Pjk+>GYp
3ZoduHS-Ks+F,CY/M8@t-Qjca5V+674s2s30d%Z$+=o,f.!R3a,C(^\.j/OY+<u.Z%15:G/g,4K
Dg-//F)rHX+>GPmE-67F-nlcaAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z
0ea_hF`\`S0d(LJDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dte
+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K#gEb0,sD.Oi7
G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o<&eAStpnAKZ5BGUXa`4CL94
0I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2'?pNDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)
5'nn)F(fK9E+*g/+>=om0Hb=WF<Dti+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6
@<6K40H`)(+E2IF+=K/kEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPm
E-67F-o`>iAStpnAKZ5BGUXa`4CL940I_DmG^+HB$4R>;67sC%BQ&);A8,OqBl@ltEd8dKFCB94
%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=
-tRXFEb0*!+E_a:+E(j7E-67F@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f
4=>5^F*',j0Hb4NEb-A1ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7Ks
FD*$2$4R>;67sC%BQ&);A8,OqBl@ltEd8dKFCB94%16Ze+Co1s+FYFe%13OO:-pQU@r-()AKWCC
ATMs.De(RV0I\,TBk)7!Df0!(Gp$O5A0>AuARTI!F`7csATAnL+E(d5-RT?1%15is/g++^;cFl<
<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%16r\CLp7`Chte#67sa)@;BFLF_kkJ+ET1e+CoV3E$/S,A0>o(Ci<`m+D#D/
FEo!>Bk)7!Df0!(GqKO5:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zq@4E-,Z.@V'R&1,(C9%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R1E^gZA79RkA0>K&EZdt502-(tFa+?&
%16T]ARTU%-RU$@+Cf>"F`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'FCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OOATAo3A0<7AATMs.De(OL%13OO:-pQUA7]RgFCcS'Cht5<
DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%16Ze+B1d.<%pHr+DkP&AKW?J%13OO-n$bm
3\W!*3]\B;3[l1u3ZqBj;cGF[$4R>REZen,A0?=D0F\?u$;No?+B1d.<$5+>6UO:@;asb\%13OO
:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63D..3k:gnHZFCfN8:-pQ_D..3k
:gnHZFCfN8+ET1e+EM+9F!,UE+EV19F<G+.@ruF'DIIR"ATJu+DfQt>@<?0*DIIBn+Cf4rF)rIG
ATMs7/db??/db??/g,=KEaiI!Bl,mR@<6L4D.Rc2.!0$AFD>`)0J">gATMs.De(RR+EV19FD>`)
1+=>UEb/[$ARl-C67sB'$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*
0lCoQ1,K>567sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/IDhpDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*@rGjn@<6K4
FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I
$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi<K:-pQUFCfN8+Co1r
FD5Z2@<-'nEscGl@rucT3ZpLF-Zip@FD>`)0H_K[ATMs.De(RFFCfN8C2[W<-OP'>H#R>94ZX]I
3[\f`F`&=1A9MO)@N]i*EagC'$>sd)DJ!U-4ZX]?0H_Ya5;aQ@,V^t[G%G]'AncKQ3Zp4$3Zoep
+=\LZ-OO9mG%G]'AncKQ3Zp."3Zoem>V7B2@rH7"AncKQ3Zp1#3Zoen+E^pA-OL2U67sBuDfoq?
@:XOmEag/7ATD5eFCfN84ZX]?0H`S4+>GPWATAo3A0<QKE+rft+Co1rFE7e#EZfI@E,9H&+E2IF
+?MV3FCfN8+Du+?DJ!U--OOF*+>Y-YA0<6I$>"6#De'tF+E2%)CER/%@ruc!FCfN84ZX]?+?CVm
F^-:$ATAo8D/a<0@j#`5F<EY+-Zip@F<Ga<EaiWpGUEi0EZd.\De't<-OOF*+E(d51*COM@r!2t
Bk)7+$?Tj#F?MZ-1E\_$-[6aa+F,=AATAo8D/a<0@j#`5F<EY+-Zip@F<G"&G%G]'AncK4@rH7"
AncK;$>"6#0Ha^W+CoA++=ANDATAnL+E(d5-RT6.Anc'mE+*j%4ZX]6C2dU'BHS[OFCf<.-RgSo
0..)6:-pQU@;Ka&E+*j%+E1n4D09r/FD5Z2F!,O;Dfol,+DkP&AI<Bu4ZX]6BeCPb.3Lo/+tt,o
+DEGN1C=J#EZf:2+=JpjE-*OUA8,OqEsd#&BlcEu+=JpjE-*OUGBA+LATJ2iEZfI@E,9H&+E2IF
+=D8EBlbX/ATAo1@;BEsAnc'mE+*j%/13,(Bkh]:$>"6#1E^UH+=AND$>"6#De't=0mdk].=5T>
@ruc!FD,B04ZX]60mdk].=68\H#R>9$>"6#FDYu5Ddso/F`\`RFD,B0-OOF*+DkP&AKYT!Ch7Qo
FD*3Q0eR0TF!h<+EZd.\De't<-OL2lEZf:2+=K!lE-*OUA8,OqEsd#&BlcEu+=K!lE-*OUGBA+L
ATJ2iEZfI@E,9H&+E2IF+=D8EBlbX/ATAo1@;BEsAnc'mE+*j%/132*Bkh]:$>"6#1E^UH+=AND
$>"6#De't=1OF(_.=5T>@ruc!FD,B04ZX]61OF(_.=68\H#R>9$>"6#FDYu5Ddso/F`\`RFD,B0
-OOF*+DkP&AKYT!Ch7QoFD*3Q1G3BVF!h<+EZd.\De't<-OL2lEZf:2+=K'nE-*OUA8,OqEsd#&
BlcEu+=K'nE-*OUGBA+LATJ2iEZfI@E,9H&+E2IF+=D8EBlbX/ATAo1@;BEsAnc'mE+*j%/138,
Bkh]:$>"6#1E^UH+=AND$>"6#De't=21':a.=5T>@ruc!FD,B04ZX]621':a.=68\H#R>9$>"6#
FDYu5Ddso/F`\`RFD,B0-OOF*+DkP&AKYT!Ch7QoFD*3Q2(iTXF!h<+EZd.\De't<-OL1f:-pQU
<(0_b+B)9-6UapP7TE+h$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&
?U6tDFE1f2BK8(5?OC[^G@X$KA3k6KF_t]-FE9,i0ht%f.W/gAA3s^86#pU\D.RU,F"f:&+ET1e
+DG_:@;KXg+=M,=G@W-F@<-"'D.RU,+EV19FE9&D$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(i-@<itM3B9)B+:SZQ67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/KbK0:-pQU0JIQZE$-8G5<fSa:-pQU
0K3lfFs%nMF`:l"FCeu*FDi9o:IH<t+Eh=:F(oQ1+>ti+1+Ne@:-pQU0K3NR@k]b_AoD^,@<;qc
:-pQU0emQaFttirF`:l"FCeu*AoD]48iJCsBl8'<%13OO:-pQU<+ohcAoDL%Dg,o5B-:o+E-68D
+EM47F_kS2Eb0<7Cige6DBNM2Ec5t@D.Rd0@:s.m+=M,=G@W-T%16T]ARTU%-RU$@+Cf>"F`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'FCfN8ASu[*Ec5i4ASuT4-XpLp-T`\J:IHQ>
$4R>;67sB/DIn$&.3N&/@qBV$F!,C=Cj@.4Ch%9(/M/)SDg5i(+Dbb5FE8RCAftSs@<,ddFCfJ8
Ch[s4Et&IO67sBmDes6.GA1r-+CT;'F_t]-FE8RGBQ&$0A0>>m+ED%.ARfgnA1e;u%15is/g,%S
D.Ra%@j#3%Df'P)$>"6#DIn$&+>=63ATAo2ATqZ-1CX\&EZf72G@Vh'1CX\&EZf72G@VgO1G1Tq
$>"6#DIn$&+?4*m%16Ze+Dtb7A0<TZ3&roUAMQ(O$>"6#DIn$&+>J*q+<VdL+<Ve%67sC&BOr<(
F_tT!EZep9Bl5%c%16Ze+Dtb7A0<^;E\n44ATAo2ATqZ-3&ilW3&ilV2`EZS2`WlY3B9)[3B9)[
3B9)[3B9)[3B;<n$>"6#DIn$&+>GT+1,C^C1c7-K2E*QS3&s!>2`N`U2`N`U2`N`U2`N`U2`N`U
2`N`U2[p*'$;No?+EMgF@W-((/0K(QBk)'lAKVEhATAo2ATqZ-F#kZkDJsW*DIIBn-OgDoEZf72
G@Vh=3ZoefDfor3@rGmhDIIBnF!hD(%15is/g,%SD.Ra%@j#3#Eaa67+=M8=DId[&+EM4)E+O)5
@;]TuF(or3F"%P*ATAo2ATqZ--pK+E1asY*.3pSV$>"6#DIn$&+=KH&5;Xf61FXS*%16Ze+Dtb7
A0<9b-pKO;,;Ubo?S`,uATAo2ATqZ--pK+E1asY*.3pZ)/iO4HATAo2ATqZ--pK+E1asY*.3plf
1^se'EZf72G@VgE5:A`Q.3gVt,V^o23B&j-1,KFIATAo2ATqZ--pK+E1asY*.3pl43&ilW3&`cT
2`EZU3B9)[3B9)[3B9)[3B9)[3B9)[GRY!kEZf72G@VgE5:A`Q.3gVt,V_#/1,C^C1c7-K2E*QS
3&s!>2`N`U2`N`U2`N`U2`N`U2`N`U2`N`U2[p*'$;No?+D#D/FD5<-%16Ze+Dtb7A0>S=0F\A#
EZf72G@VgD-OgDoEZf72G@Vh)3XlF-EZf72G@VgO,@NVB$>"6#DIn$&+>Y6N3XlF-EZf72G@VgM
,Vgu3%16Ze+Dtb7A0<QK0I/=]$>"6#DIn$&+>=ol,UY&h%16Ze+Dtb7A0<QK2'b:3C3=T>+EV19
FD5W*-OgDoEZf72G@VgR+>=oo,W6c%+?9l<%15is/g+VAEb&a%Ch[cu+Cei$ATJ:fATAo2ATqZ-
0KUX0+<VdL+<VdL+<XEG/g,"FG\(D.@psFiEt&IfEZf72G@VgD-T`\'4"q*NATAo2ATqZ--RUu(
4?P!#Df7!P4!uBb$>"6#DIn$&+>Z),-T`\'%16Ze+Dtb7A0<6I4!uBu+<VdL+<VdL:-pQU@;Ke!
F*&O7DfTl0@rri2F_kk:DIIBn/0JhQCht51De!3tBl@ku$>"6#DIn$&+=ANu-RUu'-QjNS+<Ve%
67sBhCi+*3F<G(3EcP`$F<GIDCht53@;TR,+Dbt+@<?4%DCco@De!p,ASuTuFD5Z2%16Ze+Dtb7
A0<7/Df7!b-RU#Z+<VdL:-pQUG%#3$A0>buD.P7@DKTc3+Dbt+@<?4%D@HqaEZf72G@VgD-T`\c
3a?oS@W-04+<Ve%67sBuF_kk:DIIBn/0K+ECh[E&Ci<flFD5Z2%16Ze+Dtb7A0<6I4!uC;-Y@:>
EZfF5DfTD3@;]Tu/hSb(+AP6U+Du=<C`mV(D.P87De!3tBl@l3DegJ+De!p,ASuTuFD5Z2%16Ze
+Dtb7A0<6B-T`[u-QjNS+<VdL:-pQU@VfIjCNBplATAo2ATqZ--QjNZ4!u-u4!u-u%13OO:-pQU
ATAo2ATqZ--Zip@F=/1R+<VdL:-pQUDJpY6De!3tBl@l3/Kf.KBlbD,@<6!&Bla^j:-pQUDJpY6
Df03!EZee.+D#S6DfQt/+Co1rFD5Z2@<-W9BlbD7Dg*=6Eb/[$ARlotDBN@1A7]@]F_l./$;No?
+Co2,ARfh#Ed8dDDe!3tBl@l3+=KijDKTB.Gp"jr0JFpb$4R>REZf72G@VgD@UWdi@q]:kF!+^8
%16Ze+Dtb7A0<6R.OPZ4%15is/g+tECLq=-+EVmJDfZ?pATAo2ATqZ--Zip@F=0-t>^C^<Df@'H
+AP6U+CoM,G%De4ATW$*EZfC6EHPu9ARl5WATAo2ATqZ--Zip@F=0-tBOu3q-QjNS+AP6U+E1b2
BHV/7F*&O6AKZ#3DffQ$/0JLVB.b;L+C&SkEb,[eATAo2ATqZ--Z^Xs-Z^XX+<VdL+<VdL+AP6U
+<VjN+q4ljEZf72G@VgDFCfN8-T`\c3bW)FALATC:-pQU+<hpP%16Ze+Dtb7A0<7AATMr@4""N!
-QjNS+<Ve%67sB'+s8'=$>"6#DIn$&+=D8BF*&ck-Y#2B-QjNS+<XEG/g)9WDf9`/A0>?(F<GI>
+Co2,ARfh#Ed8dF@;TQb$4R>;67sBpDK]H)Bk/>sEbT].+DtV)ATJtB:K&BHAT23uA7]Y#.1HVq
EZf72G@VgDFCfN8-T`\lDf032DesQ5ANF(@G]%GA>]4C_Bl71"Bl5pg-OgDoEZf72G@VgDFCfN8
-T`\c3]^MjG][k/D..=->[q\gDf0W$-OgDoEZf72G@VgDFCfN8-T`\c>WR+SFDkE+Ea`j,E,Tf/
A6`V_Ci=2rF)59+BI=5rATAo2ATqZ--Zip@F=0-t>WR+SFDkE+Ea`j,E,Tf/A6`V_Ci=2rF)59+
BI=5r%15is/g*`'G%#3$A0>Aq@<,ddFCfK6+DG^9DIIBnF!+n/A0>i"FD,_J%15is/g*Pr@ruF'
DIIR2+DtV)ATJu&Eb-A*DfT]+A0>K)Df$UE+Br8+H<j`//NI*@5qQ8G-OgDX67sBhDIal/@<?1(
+DG_'Cis9"+EV:.+CSekBln'-DII?(@q]:k@:OCjEcW?O:dJ&O6V(*R.3KaTBPDMs$;No?+DGm>
@3?b8@:j'p+EM[7F(KG9De:,6BOr;rBOPpi@ru:&F!,OHE,]`9FCeu*@X0)5Df^"CBQ%s6F"Rn/
%16Ze+Dtb7A0<9JDJpY6Bl7K)ASu%"-S.V_/15CQARTXk-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE
-Z3iFCh[cu+D#G$F!iM+;G9P2-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7A0<9JDJpY6Bl7K)
ASu%"-S.q\/15CQARTXk-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE-Z3iFCh[cu+D#G$F!iM<5sd+M
E,9)oF(H^J4""N!>^C^<Df@'5$>"6#DIn$&+=JUTD]j+;@<6*nF!+^1Bl5&2@;TRs-Rh,)@ldk@
H?=(E-OgCl$>"6#DIn$&+=CW,A7BJ&F!j$s@ldk@H?=(E-S.V_/157FF)r]<$>"6#DIn$&+=CW,
A7BJ&F!j$s@ldk@H?=(E-S.V_9L^Q\Ch7[/-OgDoEZf72G@VgD@UWeVDg?CO4""N!>^C^<Df@'T
<'`i%-Z!@8F!hD(%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5A8,OqBl@lt
EbT*+%16ZeAT)O!DBLVB$>sF!A5-KM=(uP+0JQ<h/h1aMG@XEVDHCOi0JG4(F=f'eDIn$&+DkP)
F^])/=(uP_Dg-7FAU%X#E,9).@;]LiDeF3(F"Rn/:-pQB$;No?+B2onFE8R+Bl7I"GB4mFEbT*&
FCeu*@;]LiDeF3(F!,C5+D#e+D/a<&F!,(5F`(_4Bl5%c:IH=9De!p,ASuTuFD5Z2/e&._67sB'
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;"Dg!ip%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)l'DJs\Q3$;^OART[l+Eh16BlA-8+EqO;A8cZ7A8,OqBl@ltEbT*++:SYe$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+DGF1DJpY6De!3tBl@l3BlbD<E+NNnAnbge+EV:.
+Co1rFD5Z2@<-W9%15is/g+kL+CfG'@<?'k+DG^9FD,5.A7]@]F_l.BA8-'q@ruX0Gmt*uATqZ-
-Z*:-ASl^'Bk)7!Df0!(Gpa%.%15is/g+YEART[l+EqOABHV2$D.Oi(DBNb6@psInDf-!kDIn$&
+=D&<G:,I"@lc8XDe*U*DJLmQ%13OO:-pQU03fW=@<?0*A7]RkD/"*'EcW@3@q0(hFCetl$>sF!
A0<7:H":W!-T`\c3a?E<A867)CLqNkF*)\DAR'1_FD*$E%13OO:-pQU@rc-hFCcS5DBO.;DId[0
F!+IX6Qg8XFE_YDCER\3@<,og$;No?+E_R3Df'?&DKI"0DIal$A8--.AoD]4H#IhG+Dtb4GAhM;
+D#G6Bl\-0D.RU,%15is/g,%CG@VgDDfp/DBOu3q-T`\\>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp
>\\1fC3=E0DImo;+:SYe$;No?+Dbb0Fa,$>Bk)7!Df0!(Gp%'7FD)*j:-pQUDIn$&+=Cu>DIdHk
-T`\/BQ%a!05k_]FD,5=Ea`iuAL@oo%15is/g,(OFD5Z2@;I'.BPDKt+DGq/D'3P6+Co1rFD5Z2
@<-W9A8bt#D.RU,@<?4%D@HqjATqZ--Z3L>ATB.[-Y#1jC2[WtF`(u+F*'&_4"!F1@ruF'DIIR2
+CoD#F_t]-FCB9*Df-[M/hSL\$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5
+Co1rFD5Z2@<-'nEt&IfEb00.ASrVEDJsW8E+NodATMs70JG4V67sa*Dffo:AStIYF*)IW0JO\l
/M/)TCi=B+A0>Ds@ruF'DIIR2+EV19FE9&D$;No?%15is/g*b^6m,uXD/F,uDIdf2F(fK7Ch+Z/
AT2R.F<G!7DJpY.Bk)7!Df0!(Bk;?.DfB9*+D#S6DfRH>$;No?+B3#cEb-A%Eb-A7Df'&.79!/4
F!)l"G[k<(FD5Z2+B38%;KZee.3N_N+EV:2F!,+<Bk1dkBl7Jk$;No?+CT.u+EV:.Gp$O9AKYMp
DJsW.A0>T(+EV:.+D,P.Ci=N3DJ()5@rc:&F=n"0:-pQB$;No?+@/q)<D>n\3ZohcDe*s$F*(u6
.3NGF@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE0f_6S
DJs\-$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>>`bARdDO+Cf>-G%G]9ARlp*D]hYJ6n`:-2D?lq$;No?+>GTgDg!ip
+E_X6@<?'k+EVNE8l%ht3A*-@0Inek2[p*'$?Tj#FCf?5Bl\-0D.RU,+=CW,A1'Gd8l%i&%13OO
ATAo(AS`J:DJpm3$>"6#0d("<C`k*9ASbq"Bl@m1-OgDoEZd1]A7]R"4$"`tEb-A4Df]u6@VfU'
%13OOATAo(Bk/>?%16Ze+>=pKBk/>?%13OOATAo(Ble59-Z3j3De+-,Df'&5%16Ze+>P'"+Co2-
E$-NGDffo:ASrk)$4R>REZen2@j!.:Dffo:ASrk)$>"6#1*AS"A8bs#-Z3j4@;]Uo-OgCl$>"6#
A8lU$F<DqY%16Ze+CoG4ATT%B:fUIa5snUI;C=O]0JEqC%16Ze+D#(+-Y$S&FCeusF=.M)ATAnK
+?:QUA0<74Ec6)>A8bt#D.RU,-OgCl$>"6#A8Z3+-RT?1ATAo(DJUFCDII'a-OgDoEZd(ZA8Z3+
-RT?1%16Ze+D58-+?MV3H#IgJ@ps7s+D58-+E_`Q%16Ze+>G!OATT%V3[\ueEcQFJDJpY-@;[2u
D^Pu$ATAnI+>G_rB4Z0-4$"a7Dfm1AATDj+F*&O=DBO4CF`JU9EcQ)=-OgCl$>"6#D..3k+=ANZ
+<V+#ATAnI+DkP&AKW@BBOu3q+CT;%+Du*?A8,OqBl@ltEbT*++E)41DBNM(BI=5rATAnK+>P'V
@;BEs-Z3@'@4)Kk%15is/g*S^;BTmeG%kl;F)6+E-uNU?A18X<F`VXI@V$Zj@VfTuFDi:6F`(]2
Bl@l3GA(Q*%15is/g+\=@ruF'DIIR"ATJu&Eb-A'Ci=B+A0>f2+EqB>GA1l0+Dtb6ATAo&AKYDj
Ch4%_:-pQUFDi:3Eb/[$AKYl%G9CF1@ruF'DIIR"ATJu9BOr<-@;TQu@;p1%Bk;?.AoD]4-urm3
A17rp%15is/g+YEART[l+CQC1ATo8>DJ=*5AScW7DIIBnA0>Ds@ruF'DIIR2%16uaEZe+G=%#VI
4ZX^'ATqZ-,!'7KA8ZO,?X[\fA7$]3%13OO:-pQUF`)52B5)F/ATAo%DIal1ATD?pBleB-EZf72
G9CF1@ruF'DIIR2%16uaEZd.\Eb/lo+?hQ-:.85P8OEpoDImi2Eb/lo+>S?t:.85P8OEpo%16Ze
+E1b!CLeP8DII'a-OgDoEZfC6F*(q8-Z3@'@4)Kk%16Ze+E2IF+=D8BF*(u2G%ku8DJ`s&F=/1R
+:SZhEZd(ZE-67F-Y$S&F=0-tF*)>@AKZ&9F_55.GA2/4Dfp.EDfB9*Bl7Q+A8,OqBl@ltEbT*+
-OgDoEZd1]E-67F-[BWQ-T`\i+ED%%Ci"A>D.R-n+DGpF%13OOATAo6AThu7-RT?1ATAnK+ED%:
D]gDT%13OOATAo6D'139@;^1-F`&Q9$>"6#EccCG-Za3HEd9#A$4R>;67sBL<)Oi<GAeU6@<6"$
+E(j7-td@7@WNt@@ps6tAp&!$FD5Z2+EqOABQ&$8%15is/g+S?+E)41DBNJ(@ruF'DIIR2+CT=6
FD,62+C]82BHU`$@;L48AKY])+Dk\,DfU+GGAhM4Et&IoATAo+Ci<d(+=D8BF*(u2G%ku8DJ`s&
F=/1R+<VdL:-pQUCh[s4+D5M/@UX(o%16uaEZd(k+D5M/@WNY>FCfN8ASu[*Ec5i4ASuT;+<Ve%
67sBmF_kk:F*(i4Bk&9'@;TQu@r,RpF(o6#@psInDf-!k%16Ze+E_a:F!)iJDffo:ASrk)$>"6#
1GL"pF(KD8-Z3jEDfB9*-OgCl$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5
+Co1rFD5Z2@<-'nEt&IfEb00.ASrVEEb0&u@<6!pDe)U0/h1mQCh7$rASQ-o+EK+d+D,>*@;I'-
@rc:&F<G"2E,96"A0>T(+C]J-Ch.6tB-:r-A0>o(Ch7$rAKZ;5E%VS,:-pQU%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+AZKhDdm9u+>PW)2%9mf67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,(F;An>F+1a"@m@rH(!F(KB6+=Cl<De(4<AoD]4DIn#7Ci<flCh4%_:-pQU1,(F;
D..]F2'=In-qQm08PU]WAU%^$F_#&o+D,Y4D'3n<D.Oh<B4PRmF"&5RATMs7%13OOEb065Bl[c-
-[oK7A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFt
5s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is
/g,1GCh7$rAKYMt@ruF'DIIR"ATJ:f@s)g44ZX]rBk/>?%159QHSZd_A0<6I%159QHZ*F;4$"a(
De*BiFs(O<A0?#:Bl%i<%13OO:-pQUAn?'oBHV>,EHPu9ARlp+FD5Q4+CT.u+Eh=:F(oQ1+EVX4
@r#drB-;)1F`)70$9g.jFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OOC2[X+ATDj+Df.^!
+=o]1HV.(%<_Ysk$4R>;67sBQ:IH=HH#n(=D'3P1F*(i,C`n%<E$/k4+E2IF+Co1rFD5Z2@<-'n
F!+n-Bk;0)A8-'q@ruX0Gmt*Q:IITB;cHXd6<-uV:JP(b:d$i^-YdR1?RIBQ-SAaR+Cf(nEcZA4
+DPh*G%G]8Bl@l</13&rBlGF/$;+)^6qL<V;Fs2T<(Tk\>"MOR3Zogp/giqY8LH&NCi<g)Ap@Zi
8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6psUF<)Q:S<E)Oc:0L4c%15is
/g*b^6qp',4ZXs*De(J;A2P_D$4R>;67sBjBOt[h+EV:*F<G".C`mA2Dfp"AA7]^kDId<rFE8R5
Eb-A-DBNA/F)PQ&@<?'k+D5_5F`;C2$;No?+EV:2F!,1<+Du+>+Dtb#ATMp$Ed8d:F`\a>BkM*q
Gp%-=@rH4$ASu$iA0>K&EZf"8Dfp#?%15is/g,7L@<<W#Eb-A9F(Jl)FDi:6DfT\;@r,RpF(KD%
$7K=D+>#3p+D54rE-!-LC2[W1.3N1S+D5_6+=CoBA1%fn-t,.Z/M;JpB4PRmF!)iFDe*p2DfTD:
.3N1S+D5_6+=CoBA92j2Eb-U-$7I<23\3B@8OccQ:+%J5/M;JpB4PRmF!)iFDe+!4Bl#.G+D!/J
B6%r6-YdR1F`_>6-OgD2@6,M_/q+pUA7]_$+=CoBA8PajALAoLAM,*<Ec<-KC2[X"@;BF%%14Ll
3Zp",INW96AT2]5-YdR1A8bp).3N1S+D5_6+=CoBA7TUf-OgD2@6,M_/q+pUA7]_$+=CoBA8c?5
.3N1S+D5_6+=CoBA8c?5%14Ll3Zp",INW96AT2]5-YdR1FDl)6F!iCZAM,*<Ec<-KC2[X)Df9H5
-OgCl$;No?+E_X6@<?''C2[W8D.GLH@q]F`CNFW8+D,>(AKWQIF(KH7+@\pr78jX&:-pQU:/=hX
3Zp+8DJs\R1E\7lFD,5.8jQ,nF*1r8ATDj+Df-\,F_PZ&F!,[IART@q+Cf(r@r$..D0$-n:-pQU
@Wcc8De*BpGp$X9ATJu3Dfd+CBQ&);A8,XfATD@"@qB^(@V'Y*AS#a%Anc'mF!*%WE+O''@;p8s
$;No?+EM[7G%G]8Bl@l3,%PD"An?!oDI[7!+s:E7+Du+>+DG_'Cis9"+Ceu'FCAm$+Cf(nDJ*O%
%15is/g)i18l%iL6o?*(A2S44DJ<]oF*&Ns:IITB;cHXd6<-uV:JP(b:^ma@$;No?+D,2,@qZuW
5tiD<@;]dkATMr&$?L#H3ZpLF+=D#7DJ<]oF*)/8A1%fnEap4r+=D2>+DPh*F(95<4ZX]B+D58-
+EM?.$7L6R+u(3TDe*p!E[a.4+F?-n0d(4LA927$%13OO:-pQUEcl7B8jQ,nD..<rAn?%*+>"^W
ATVu97S-9B;[j'^-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;67sBt@;]dkATMr9Anc'm
F!*%WCh7[/+DkXH+Cf(r@r$..D0$-n7S-9B;a!/a/0J@^+>#3p+?V_<?SNZs7P%##9LVl&/M8/5
;@Nt&8PDQO4ZX]T8PDQO+>#2g4==l^A1h_02(&h?%15is/g+\C+CT)&+D,>(ATJu*G\M5@+DG^9
H>.=-$:[T\78l?1+FYpc7S-9B;]m2X67sB34A&C;9ggiJ$@69.BleA?0d&qW9LVl&/1r&-8l%iC
8Q/Sd8O?EV8P`)b8Pfj'%15is/g,4KDg*=EASkjiDJ=!$+D,>(ATJ:f:K0kR;E[&`-nlcj+u(3d
A8-',8l%iC8Q/Sd8O?EV8P`)b8PgiY/M8/88PDQO%14g4>9J!#Dg-//F)rI"<(KGU+<u=X-SHir
3dWn74s3X#84?E!:-pQUAU%^$F_#&+A8-'q@ruX0Bk;>p$4R>;67sC$AT)O!D@Hq:0RGSuDe't<
-OgDH0RI_K+FPkPF`ML3$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2
BK8(5?O[?`ATW'6?YXLiE,ol3ARfgW67sa/ATW'6?YXLiE,ol3ARfg)F=f'eF(KH9E$/b2EZdss
E,ol3ARfg)D..<jB4Z*+F`V+H%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(C@DJs\Q3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JGJ$F_icd+>"]l+C?iGD..3k+=CoBA8l:#
FCfN8-Ql/N/g+S?H$<q5Eb-A3DBNn,FD)*j:-pQU1,(CADe!lC2]s[pAoD^"AKYr#FD,_<FDi:<
Dg,c5+Cei$AKYGnAoD^$+DkP/@q]RoB+52C67sB90JP:oAR[AR+>"^GDeX*1ATDl8-Y[=6A1&L.
A7T7^+>"^T@<?1(+EMX5DId0rBmO?$%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03[[3Z
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO4tq>%
Df7d"+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%16T`@s)g4
ASuT4-XpM*AL@oo:-pQUE,ol3ARfg)E+*j%+Dl7BF<GF/FCSu,C2[WnATf2$F(96)E-)Nr-u*^0
FD,`,E$07@Ci=N/EZf+9@<?0*-[nZ`6r6cW8ju*H06:WDBlJ/I-Rg/i3Zr0V@<?1(AT/c6Des?9
ATAn;/gjRb;I:e&-p)c:HS.]_5u^B^?W0p2?V4*^DdmH1/14dP%16T`@s)g4ASuT4FDYu5De!-?
5s]U5@<6*B3B:FU$4R>+0RInYE,9H&+D58-+?MV3F(fK9E+*g/+Eqj?FCcg/$4R>_@j"tu-ZW]>
D01#E-Ts()1a$FBF<DrGDe*g-De`inFD5K/-OgCl$8=RjFDj]G;cFl$HTE]pFEhmV+Eqj?FCcS0
E+*j%+=DV1:IJ#W:J+&C<%i<&EbTK705>E9E,ol3ARfg7BkhT7%13OO:-pQUB4YslEaa'$+E2@4
+CT.u+E27?F<GOCDe!@"F)Q(AF(96)E--.1$9g.jD/=89-YdR1E,oN/E,o\@%159QHYmS?+=CoB
A8lI.FDu88-OgCl$;No?+DG_7F`M%9C2[W*FCfN8+E_d?Ch\!*ATJu&Eb-A6ART+p%159QHYmS?
+=CoBA9;C(FCfJ?%13OO:-pQUD..3k+C\c#Bk&9-ATMr9F(96)E-)Nr4tq=>+C?iGD..3k+=CoB
A8l:#FCfN8-OgCl$9g.jDe'u=/oPZH+BosE+E(d5-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%13OO%13OOFCfN8A8,OqBl@ltEd;V4FD,_j67sa0ATMs(
Bk)7!Df0!(H#R26BQG;</M/)dATVu90mFg77RJ;?ATMr9A8,OqBl@ltEd8dH@<?1(/e&._67r]S
:-pQU;e:&l+E1b2BQG;.DfQt:@<-!l+D,1nF(o*"AKZ)+F*&O7@<6!&A8,OqBl@ltEbT*+/e&._
67r]S:-pQUG%G]'@<?4#3ZqjPF)uJ@ATJtBFCfN8C2[W;/9GHEFD>`)1+[NYF*)/8A2>cYATMs.
De([R+Dbt)A7]9\$;No?+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(F;DJs\R1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>REZf:2+?MV3FCfN8C2[W;+EV19FD>`)1*C[MF*)/8A2>?MATMs.De([P%13OO:-pQU@r,^b
EZek7EcP`/F<GO2FD)e*DIal"Eb/[$AKYD(Ea`irDf$V0Ec6)>+:SZQ67sBnEc6)>Bl7Q+F(KH7
+EV:.+A,Et+E2IF+Co1rFD5Z2@<-W9E+*j%%16Ze+CoG4ATT%B6VKp7;G]YY81+iRATAo+Ec<-L
-ZWX5A7op;-S/qCA0=)kAN;1^4!5q,0H`S&,9VCeA8Z3+-RU?iI4f&JCaUS>$>"6#1E^UH+=D8B
F*)/8A2,G@$4R>REZen3F(KG9-UUQr5uLNF<(JAG$>"6#B6%r6-ms%DDIdC#1++VdAn3#K0kE?o
+?L\o1,'h8+<r"W/nAj9+=ANcH[RMWDJU[J%16Ze+>Y-YA0<7AATMs.De(UN%13OOATAo(E-#T4
+=BNM76sgJ5u^B&%16Ze+D5_6+=JUX@;]UgE\f'oBP(ct5;?_0.3L\p-o*J!59M0nI4f&JC`k)Q
.=6IqA8Z32-OgDoEZd.\De't<-OgCl$;No?+ED%3E+No0@;]TuF(fK9+E1b2BQFUiATAo3A0<rp
-Zip@FD>`)0d(RLF*)/8A259LATMs.De(XHFCfN8C2[W>-OgDoEZen,A0?=D0F\?u$>"6hDfB9*
+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,FCfN8F*)P6
:-pQ_H[\qCI3<V`/Kf.HF*&OGFEM%F%15is/e&._67sB[BPDN1FCfN8+>,9!/hS8YDfT]'FED))
+EV1>F:ARP67r]S:-pQUG%G]'@<?4#3XlEk67sAi$;No?+<VdL+>,9!/g,:SAoD^,@<?'k+EV1>
F:ARP67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(i[IUdD0@<?'k
IXMY4:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU1,(F;An>F+1a"@m@rH(!F(KB6+=Cl<De(4<@:Wn[A0>K&EZf72G9CX=
A0>T(FCfK)@:NjkCi<flCh4%_%15is/h0:f;GU1R4s27tDfTA;+D,%rCi^_;DBLPa/hRS?:-pQU
H[]OHEc5u?Bl.F1I16Mm$;No?.Rm!34['uuDfTl0@ru9m+>,9!/e&/1E+EC!ASQ-oA8-+,EbT!*
FD5Z2:-pQ_F`:l"FCf3*A7TCqFE2))F`_>9DBO!P/Kf1TA79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:
Bju4,Bl@l3H>.=N%15is/g(T1:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[l
A3(i/@ruWuATAnK0JG?n$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'0K<oXGqq?%/Kf(FD/XT/A0>T(
F*(i,C`m1qFE8R5DIal2@rc:&FE8QV+EM76E,96#Bk;?.8jQ,nD..-rFCf>uDI[5e$;No?+>PW)
3-/YM1,L+*+CSekARlosBleB7Ed99ZG]Y'MD]iS)F*)G:@Wcd(A0>JuCh7Ys$;No?+>PW*0kP!+
0f1")+Cf>(DKBB0F<DrFC2[W1+CSekARm?,De(J>A7cs)ASl@/ARloqEc5e;H>.=-$;No?+<VdL
+<VdL+<VdY+D5V2B5D-4@rGmhE,9*1+Co2,ARfh#Ed8dME+EC!AKZ#)D/XT/A.8l@67sB90JP:o
AR[AQ+>"^NDe*ftAhJ1MF<G+.Eb/a&DfU+GE,8rmAS?!uA7]d(@:Wn[A.8l@67sB90JP;!@<jRe
+>"^NDe*Bs@kVY4DKU2ADffQ3/p)>[+CSekARl5W%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='
Anc'mF"V0AF!hD(@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEo
ATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%0ARTXk+Co1rFD5Z2
@<-'nEt&IdF`MLc3ZqsIA0<Q8$9g.j1E^UH+=ANG$9g.jDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5
$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o4tq>*
D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>WDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt%15is
/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@+DG^9E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cpFDl2F
%15^'6psUF<)Q:S<E)Oc:0L4c4ZX]5C2[Wi-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^Z
E$l)%8l%iC8Q/Sd8O?EV8P`)b8PhQ2+EM47GApu3F!)kT/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^
DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF(96)
E--.P+DbIqF!+n/A0>>iFE7luF)4!#+=Ci:F*)>@H"q8.+DG_7FCB!%C2[W*Eb0<'FD>`)+DPh*
E+*d(F!,49A8lR-Anc'm+DkP)BkCptFD>`)+DbIqAU%X#E,9)>0JO\bDe*R"FE2:BC2[WnF_u(F
%17/m4ZX^,Cb-qV9OVBuF_u(?C2[WlATMr9Bl8!6@;KapDe*<cF<GU8F(KH.De*<cF<G=:A8lR(
D'3S3A8,plAU%QQ<)$%/C2[X*F(KB%Df00$B4>:b-OgE(Ccsg%4$"L*Cb-qVC2[X%A7f1J=B$DZ
Bl8'<DJsW.F'hmK<$r+^%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5
BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EDUB+A+pn+DkP)BkCptF:AR*
-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;67sBt@;]dkATMr9Anc'mF!*%WCh7[/+DkXH
+Cf(r@r$..D0$-n7S-9B;a!/a/0J@^+>#3p+?V_<?SNZs7P%##9LVl&/M8/5;@Nt&8PDQO4ZX]T
8PDQO+>#2g4==l^A1h_02(&h?%15is/g,:UA79Rk+D,>(ATJ:f:-pQU0Ka&eF*(i,Chdm!@UX@$
H?*S9Cgggb+=CoBA7At_055<FFCB!%C2[W8@UX@+4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ou
ATMF)C2[Wl@<<V7+F8'>E,8rmAKW@8De*<cCG0^>F(KH.De(J0@<<kY8l%iC8Q/Sd8O?EV8P`)b
8Pfj':-pQU0Ka&eF*(i,Chdm!+<VdLH?*S9Cgggb+=Cl@F*(i,Chdm!/no'A-Tapr6psUF<)Q:S
<E)Oc:0L4c%15is/g)i1Bl8!6@;KapDe't5+<YuNAT2Ho@q?c1C2[Wl@;@N1DKBo.Ci!j)A7At_
/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%15is/g)i1Eb0<'FD>`)+<VdL+<YuNAT2Ho@q?c1Eb0<'
FD>`)/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%15is/g)i1Eb0<'FD>`)+<VdL+<YuNAT2Ho@q?c1
C2[Wl@;@N:ATMF)C2[Wl@;@K0C3(aa8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8kstD0$gB+<VdL
H?*S9Cgggb+=CoBA8kstD0%=DC3(aa8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8lR-Anc'm+<VdL
H?*S9Cgggb+=CoBA8lR-Anc'm/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOBPDO0DfU,<De't5
+<YuNAT2Ho@q?c1BPDO0DfU+UFEhmT4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SWDe*g-De<^"AKW*<
+F8'>E,8rmAKW@8De*<cCG0F@A8lR-Anc'm@UX%)Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SW
De*fqEc#k?+<VdL+F8'>E,8rmAKW@8De*<cCG0F@A8kstD0'/pCG'=9F!j%A:IITB;cHXd6<-uV
:JP(b:^mac4DJeFF`V,7@rH6sBkLm`CEOaGEb03+@:Njk-YdR1@UX%*C2[X*F(KB%Df00$B4>:b
/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOD..<rAn?%*C2[W*+<YuNAT2Ho@q?c1D..<rAn?%*
/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOCggdaG[YH.Ch5:S0d(d_AT2Ho@q?c1C2[X!@:F:2
CggdaG[YH.Ch5:S0eR0TF!j%A:IITB;cHXd6<-uV:JP(b:^mac4A90m7!3?c+<VdL+<VeQEb03+
@:Njk-YdR1Cggdo05P'+A9Da./no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOC2[WsDKKo;+<VdL
+<YuNAT2Ho@q?c1C2[X!@:F:2C2[WsDKKo;/no'B-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOC2[Wn
F_u(?+<VdL+<YuNAT2Ho@q?c1C2[X!@:F:2C2[WnF_u(MBkh`;4%`::6qL<V;Fs2T<(Tk\>"MO"
$8=SWDe*<gF*&NI+<VdL+F8'>E,8rmAKW@8De*Zm@WO2;De*<gF*'$KC31gb8l%iC8Q/Sd8O?EV
8P`)b8Pfj'0Ka)gA8lR(D'0rD+<VdLH?*S9Cgggb+=CoBA8G[`F"_9HA8lR(D(]O;F=0.B:IITB
;cHXd6<-uV:JP(b:^ma@$;No?+ED%%A0>B#D/a3*ARlouDe(J>A7cr9/Kf.KBlbD/Bl%?'BlbD7
Dfd+CFDl22A0>T(+EV:.+Co1rFD5Z2@<-W&$;No?+C]J8+DGm>@WcC$F<G:8+EV:.+E2IF+Co1r
FD5Z2@<-'nF!,"3@s)X"DKI"3Bl[cpFDl2F%15is/g)i1,AM.-E+EQD3ZrHS@:UK/+tb62:I?K\
4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1\]C2[W8E+EQ.%15is
/g)i1C2[X%A7cr,+<VdL+<YuNAT2Ho@q?c1C2[WnDdtG>A7f@j@kVS8A1hh3Ag]Z4:IITB;cHXd
6<-uV:JP(b:^ma@$;No?+EMXCEb-A,FDYh:Bl7HmGT\R\DffZ(EZf:<Ch[cu+D,>(ATJu&@q0(k
F(Jl)G%kA-Bl8$(Ec,H1+Dbb0CNBpl0Ka)gA8,plAU%QQ<)$%/H?*S9Cgggb+=CoBA7TUg05,HE
Ch.Ho05>E9Bl7HmGV3ZOD/:R]8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g,4WDfTD3C2[X%A7dH9
G]Y'ICgggb+D>\0A7]d(AoD]4C2[W8E+EQ'/KeJF@;0Od@VfTuDf0B*DIj7a0Ka)gA8l'k?W:-,
+F8'>E,8rmAKW@8De*Bs@kVe3An5gi05>E9E+EQ5FEhmT4%`::6qL<V;Fs2T<(Tk\>"MO"$4R>;
67sC%FDl22+Dbb0Fa,$ME+NNnAnb`tDJsW.Et&I14D\_LFa.eBFCfN#<*3*BH?*S9Cgggb+=CoB
A7TUg05P??Fa.eBFCfMGFEhmT4%`::6qL<V;Fs2T<(Tk\>"MO"$4R>;67sBkD]iJ)C`mS'DJ<]o
F*&O:Bl%@%+D#e3F*&O=DBO7>E"*/#AU%p1F<WF^7S-9B;]mVD+?W7l6psUF<)Q:S<E)Oc:0L4c
%13OO:-pQUF(fK9+CT/5+D,>(ATJu.DBO7>E$079@<<W#Eb-A2Dfd+?DBO%7AKYhuDJ<]oF*%iu
:K0kR;E[&`-nlcj+u(3dA8-',8l%iC8Q/Sd8O?EV8P`)b8PgiY/M8/88PDQO%14g4>9J!#Dg-//
F)rI"<(KGU+<u=X+=AfiIQDg:-9`PJ<(KGU+AP6U+D#e-Cis9"+Co2,ARfh#EbT*+%13OO:-pQU
F`:l"FCcRe5tiq%Df99)AOCBHAKZ&:@Wl='F(oQ1+Co2,ARfh#EbT*++>"^EF)uJ@ATJu:DL-#9
/nK9=+E)-?F(f-$C`m\*FD)*j:-pQU0d'[CF)>i<FDuAE+EM4-Cht4AF`)M>E$-`T+>%LS/TDm\
/4r]+6qL<V;Fs2T<(Tk\>"MOA-Qk!O+=A^4:II]K:Ie)I6Vg*=:dJ&O%14g4>9J!(Dfp/@F`\aI
BOu!r+=D;LH>.=@/Ti0fD]gWO+=A^4:IITB;cHXd6<-uV:JP(b:b3t:/S#tO/4r2r6r-QM:IJ#F
<(IH*%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%175sA79RkC2[X"@;]dkATMrg67sa1E+EC!
ASQ-oD..<rAn?%*+EK+d+EMgG@q]n$DJ=E.F!,X;EcYr5DK?q7DBMPI6m->TDJ<]oF*)IU%15is
/g(T1:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zp130K3lfFttot%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)o'0em9O@PK\^/KePABl8!'Ec`EOBkhQs-Qli.A7]9oAoD]4DIn#7C2[W*Bl8$(
Eb8`iAKYf-@ps1b%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0
>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%0ARTXk+Co1r
FD5Z2@<-'nEt&I?0RI;PEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,C2[W*
F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8
Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X
6k'J4$;No?+DkP)BkCptF<GX7EbTK7Et&ItCcsg%4$"a+@;]dkATMs.De'u-@;]dkATMs.De*p-
F`Lu'-OgE'@j"tu-ZW]>C2[X(@r`q[3Zp7%B4Z0-F)29m%15is/g,4HF<GX7EbTK7Et&I)HS-Ks
+DPh*F(95>4ZX^43[-:$C2[X(@r`"c%15is/g,4HF<GF/DJ<]oF*&OJATDj+Df0V=Ao_g,+Co1r
FD5Z2@<-W9G%G]8Bl@m1%16igA92j$D/_X!F(fK9E+*g/+=AgC78d&U:JO&6-RU8m-m0lb-RU$G
AS,k$ATMs6+=C2Y;H$._:-CWc-RU$FAoqU)F*)FFD..<rAn?%*C2[W3/12em031M>;b9b[4ZXr<
-S0"NA9MO)F(oQ1/12em-OgE"@;]dkATMs.De)!l+EVNm:K(48C2[X(FCB$*+Cf(nDJ*O%FE/L@
@;]dkATMs.De':a%17/dEcu#74ZX]oCi"</Blmp.EbTA59L^.6AS,k$ATMs6+=C2Y;H$._:-CWc
+CSl(ATDj6EZf4-DJ<]oF*)/8A92[3EarYi$>OKiF*(i-E'67'BQ&*6@<6K4-SJLh;H$._:-CWc
/9><AG%G\F-SJLh;H$._:-CWc-RUH[De+$&EcYr5DCd._-RT?1D..<rAn?%*C2[X(Dfp)1AN`'s
FDj]G;cFlSDe*p2@;Ts+@q]:gB4Z.+EZf4-DJ<]oF*)/8A92[3EarYi$4R>+0RGW!E-67F-Z*:0
BkCptFD>`)-Taq!6W-KP<*s'KDe*3:D..<rAn?%*C2[Vl$9g.j1a$a[F<DrJ@;]dkATMs.De*p-
F`Lu'-Taq!6W-KP<*s'KDe*3:D..<rAn?%*C2[X(Dfp)1AIStU$4R>;67sC$AT)O!D@Hq:0RGSu
De't<-OgDH0RI_K+FPkPF`ML3$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
FE1f2BK8(5?O[?bE+EC!ASQ-oF)Q2A@qB1nD/aPk67sa1E+EC!ASQ-oF)Q2A@qB1nD/aP=F"Jsd
F`:l"FCfM9Anc'mF!,17+A,Et+Co2-FE2))F`_>9DBO"=F`Lu'+F7a@/e&._67sAi$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)i,DJs\Q2]uUKE+rm)+EVNE8jQ,nF*1r8ATDj+Df-\.Bl[cpFDl2F%15is/g)l'
An>F+1a$:HDJ=!0ATDl8-Y[=6A1&L.A7T7^/0JSDDeElt+EM^D+ED%1Dg#]&%15is/g)8Z+<VdL
+<YW>@;0U%.P>FMF!,49A0>r3F`Lu'+Co2,ARfh#Ed8d9A7T7^%15is/g)l'D..]E3$;sSA92[3
Ear[%ATW'6/no'A+CSekARl5W:-pQU0emNRGqq9#@rH=3+E(j7C2[X(Dfp)1ATMF)F`8sIC3(M+
A7T7^+EVNEH>.=@AoD]4@UWb^F`7cs%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0A
F!hD(@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03[[3Z6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUB4YslEaa'$+CfP7Eb0-1+Co1rFD5Z2
@<-W9A9Da.Et&IdF`MLc3ZqsIA0<Q8$9g.j1E^UH+=ANG$9g.jDe'tP3[\Z\A7T7p+DPh*+E_d?
Ci^s5$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o
4tq>*D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>WDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt
%15is/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@+DG^9E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cp
FDl2F%15^'6psUF<)Q:S<E)Oc:0L4c4ZXs*De*p-F`Lu'?RIBQ-SAaR+Cf(nEcZA4+DPh*G%G]8
Bl@l</13&rBlGF/$:.?W78?ZF<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*
+@K$l<(LA';cI+28l%in@VQ>Z8l%iC8Q/Sd8O?EV8P`)b8PhQ2+EM47GApu3F!*bB8OZBN5u^B+
8l%iC8Q/Sd8O?EV8P`)b8Pfj'<E)O`;aa2U<)Q:S<E)Oc:0L4c4ZX]O9M%ZJ:dJ&O/15R^Bl%iC
H>.=G%13OO:-pQUF(96)E--.P+DbIqF!+n/A0>>iFE7luF)4!#+=D#7DJ<]oF*)/8A92[3EarZ'
C2[X(Dfp)1ATMF)F`8];$?L#H3ZpLF+EM?.$4R>_@j"tu-ZW]>C2[X(@r`q[3Zp7%B4Z0-F)29m
%15is/g,4HF<GX7EbTK7Et&I)HS-Ks+DPh*F(95>4ZX^43[-:$C2[X(@r`"cC2[X(Dfp)1ATMF)
F`9K)+EVNm:K(48C2[X(Dfp)1ATMF)F`7cs%15is/g,:UA79Rk+DkP)BkCptF>%]HFEMOFBl5&:
ATDj+Df-\-Df0Z;Des6$A0>;kA8c?.A8-'q@ruX0Gmt*/FDj]G;cFlV@;]dkATMs.De*p-F`Lu'
.3NhTBlmo/8jPj5:JOMX6rQl];F<lL5u^B+-Z*:0BkCptF=q9BF!hD(C2[X(Dfp)1ATMF)F`8II
EbTW,+A+pf6r-QM:IJ,W<Dl1Q:dJ&O/151NA92[3Ear[%ATW'6/no'A-OgCl$9g.j1E^UH+=ANG
$4R>+0RI_K+=CoBA7T7p-OgE'@j"tu-ZW]>D0'>4C2[WnATfFa/g,">CLnV9-OgDH0RGSuDe't<
-OgCl$9g.jDe't<C2[W1%17,c+Bos9Eap5/F(ZV1De(4Y/g,">CLnV9-OgDH0RGSuDe't<-OgCl
$9g.jDe't<F`_>6F!hD(Eap4r+=D2>+Dl14+E_d?Ci^se/g,">CLnV9-OgDH0RGSuDe't<-OgCl
$;No?+ED%%A0>JuCh7Ys$>OKiA7]pp@<=Xn+ED%%A0>W*A7T7p%16igA7T+j4ZX].+<Y]9@:UKq
De':aF`_>6F(A^$4ZX].Eb/Zi+E_d?Ci^$m%15is/g,:UA79Rk+D,>(ATJu.DBO"=F`Lu'+F7a@
+DG^9@;KXhDBKAq7S-9B;a!/a4?G0&0d%hdC2[WnATf\?C3(M4De(J7C3(M?FD5Q4/no'A+DPh*
F)Q2A@qB^mFEMOTBkh]:%14dOC2[WnAThTmF<D]PEb03+@:Njk-pB>37S-9B;^je#:IITB;cHXd
6<-uV:JP(b:^mac4DJeFA79R&+<VdLH?*S9Cgggb+=KE.HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0KaK"Bl%j$@<<V7+F8'>E,8rmAKWBb14)J^9LVl/4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SW
De*p-F`Lu'F(KH9E$-9LEb03+@:Njk-pBG67S-9B;^je#:IITB;cHXd6<-uV:JP(b:^ma@$;No?
+DYP"E$0:FBl%i5Df0B:+F7a@+DG^9F*VY5+EqOABHToC6k'Ju67sB74EYa[Cia,qF<D\KH?*S9
Cgggb+=KE/HU^S#78kWs<E)O`;aa2U<)Q:S<E)Oc:0L4c%13OO:-pQUA8`T!Cht4:Anc'mF!,%=
BleA=Bl5&>BlFLgH=_>8F*&T\+@\pr78k<[/g*8K:IITB;cHXd6<-uV:JP(b:^ma@$;No?+EM47
G9Cp;D..-rBl7Q+Anc'mEt&IP<(KGU4ZX]60Hb]d0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=
/g*VT9LVkh$8EZ-+EM47GApu3F!+7X84?E!,CUaX-SHir3dWn74s3X#84?E!:-pQUAU%^$F_#&+
A8-'q@ruX0Bk;>p$4R>;67sBjDfBtEFDi9o5tiq%Df99)AOCBHAKZ&:@Wl='F(oQ1+Co2,ARfh#
EbT*+%14g4>9J!#Dg-//F)rIFBOu!r+EM47GApu3F!)i?DfBtE+t"p6:IITB;cHXd6<-uV:JP(b
:b3t<+<i0a8jPj5:JOMX6rQl];F<lL5u^B+-YdR1F)Q2A@q@9=BlG7D%15is/g)kk>9J!#Dg-//
F)rIFBOu!r+EM47GApu3F!)i?DfBtE+t"p6:IITB;cHXd6<-uV:JP(b:b3t<+<i0a8l%iF:JXJS
770j=78lu^;F<lL5u^B+-YdR1F)Q2A@q@9=BlG7D%13OO:-pQUEb00.ASqqa4tq>%A0?:Q@s)g4
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&         ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^73+>P&u+>Pku1,0n,1E\D1+>Y_p1,0n-2e6i:FCfN8FCfN8+EMXI@N]9$EZcc@Ddt4=FCfN8
Bl7R"Ddd0uATMrI0JR*P@ruF'DIIR2Ci<`m+>J*`FCfN8+Co1rFD5Z2@<-X7ATW'6?YXLiE,ol3
ARfh'ATW'6+D,P4+A*bqEc5](@rri1@;]LdATAo9F(KK5A79RkC2[WnBleB:Bju4,Bl@m3E+EC!
ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2+F7a@                                  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>Gc/11Y<5FCfN8.V*I-FCfN8+Ef=g+EV19F<G[:G]Y'?DfQt2De!p,ASuTuFD5Z2
+=Lc=@jrODATD64$49aGBlbD=AU&;>BlbD*F)u80Bjl*pA0?)1FD)e=BOr<&Df021A8bt#D.RU,
@<?4%DBNk0+CQC7ATMr#FCfN8/g*`-+EqO9C`m1u+D,P4D..O.ARl,T8TZ(r@:Wn[DK?q;AKZ)5
+EMX9@;I'.AU&;>Ao_g,+D>J2BOu3,@;]TuH#IRCFDi:2F_PZ&+EV19F:)MdF(KD8AoD]4+EV:.
+=Lc=@jrODATD6&+C]J8+A![uD09oA+<Y-)@psM$AKYo/Cj@.DASc'h@VfT_F)PZ4G@>N'+EV:*
F<G+4ATJu*G[Y*(Cj@.IBOQ!*BlkJ-Cgh$pF!,RC+CoC5BlbD*@q0(hFCAWpAI<Nt+Dl%2/d_qb
BPDN1@;KRpEbTW/D'4%2F!+n%@;p="A0>K)Df$V*DBM5A9H[b[B5_g)FD,MD+A$YtEb065Bl[d+
$>=-dBHVA8AS#Bp@W-1$ARTI!+C]&,+DkP)BlJ32@<?4%DBL'1DIal(F!,@=F<G"5+D#.sARfgr
G%D"pDBL'3F`MM6DKI!n+EMgLFCf<1+CT=6BlkI?BlbD2DBL'CDf'&.5u:5tF*VhKASlK@+@Kd^
E+sE*$;)[e+Du+8/T5TMBl.9p+C]8-Ch7$mF!,R<BlbD?ATD6&BlbD<FD5Q-+D,&'F<G.4Dfo]+
+EVNE@V#mYEcl)<Ap%p+Gp$O7E,96"A1euI:Mq:lGp"4d0JH3l=s+q_<$3<#@:NtbDIjr9Dfm14
@;[21D..3k$8O:d0JG1'Ch7KsFD)e2DI[]u@<6.#B-;5+E,8rmASl!rFE8uU.!0-6+EqaEF*&O7
@<6!//0JYE+CPU3+<YN4B457pFCcR;F*)G:DJ()+DBL'1E,]i9G\M#'FCf96+<YT?AKW+:ARfXr
A1euI7W3;i+>GQ($>X?lDdn!6AKW+:FE2)5B6,2;H#RJ-@;I&/DfB9.@<?4%DK?q1Df'H0ATVK+
BlbD5ATMo8FD,*#+CPV!ASuU'+E(j7F(Jj"DIb@,$<1\QF!,1<+<Y)8FCfN8+E(j7+EV:.+E)./
+E2IDAKZ).Bl7Q+FD,*)+DGm>@r,^bDBNA*A0>K)ARu3WDIak4A7]q&Bk/>/De:+7GA(E,-Z^CQ
AThd(+<Y*1A0<"(@:UK'H"D(?+<Y`IBl%T.+EMI<AS?"+$?B]iEb0<*Bl7Q+@;]TuF(KTA/d_qr
H!t5E+<Y016YKnGB4YTr4Y@jeCfFh`B4Z1++Cf(nDJ*O%FE/L6Cf>Fr$47+_+AP6U+Eq7>+EVNE
<DH+Q:IIVoF*)G:DJ+#5@<3Q8ASc/i$6UI6@q]:kF$2,uFZLX"0JbL-.j/OY+>ki,+<XEG/g,:S
Bk)'lAKZ&9EbTE($6UI%@<>q"H#R=;F^o)nEcW?G+<VdL+<VdL+<XEG/g)QQ@<>q"H#R=D+D,Y4
D'3R9E,ol/Bl%>f$6UI6F*1qG4Y@j*0eb:3BeD+p.=62IBOPq&+<XEG/g,4X@WQX3Bl7R)$6UI6
F*1qH4Y@j*1GL[9BeD=nHZ`h3@<-Dr+<Y3'FCB9:E+L/7F*1qG$6UI%@<>q"H#R=;F`V\70a\71
+AP6U+EMXFBl7R)+EV:*F<GdACht53Dfd+?@q0Y%+DG^9FD,5.DfTQ)Bl7?q$6UI6DIn#G4Y@k"
3Zp750JYR;BeD1t$6UI6DIn#H4Y@k"3Zp:61,1^<BeD=O$6UHA/h\>iDIn#G+@Rn*F^o)nEcW?G
+AP6U+Du+>+DG^9F^o)nEcVR1+=f&t+E_R5G;14//g,:HBOPq&$47muF^o)nEcZ,0G<IQ$-mpYq
/9Q#V@PB>\0./;nDIn#G/13(u/9Q#V@PKD]0./;nDIn#H.3N,6@;]^hF*)FFF^o)nEcVQp+<W0e
0-GCTATogN74o^*@q]:kF)GQ5+<XEG/g,%MG9CU;+EMXFBl7Pj+<W0e0-GCTATojO74o^*@q]:k
F)GQ5$47+I$47+I                                                           ~>
)
showpass 1 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,Uj11,^72+>G_r1*A;12E<Q91,'h++>GW31c?I21E\Fq1GCg33$9t!1,h'M+>Ghu1*AA30f^@3
0H`+n1c@*30eje++>Pc41E\D.+>P&p0ebU11,C%.+>Pl93$9q0+>P&r0K2!70f1".+>Pi33?U%5
+>P&p3&!340ea_*+>GQ+1*A;-+>P&p1Gq*G+?1K!+>PZ30d&2)+>P&p1GL"2+>P&q1G^.4+>P&t
3&Vm<+>P&s1,gm00ea_*+>Pr21E\D/+>P&q3B&c;0f1".+>Yf.0d&2*+>P&o0f(O,0fL41+>GW/
1E\Ru1*AP52'=k$1*AG32G-b56<-TN6qBmJ<)6Cp1,Vfn/g*b^6m+g=Bl%<&883-eDfU+GEb0<'
F?1O?@ruWuATAnL0e=G&0JGHq$4R=L$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=Wi
D.7's3Zp452]s52@<?'A+>Y_p:LeJh1,(CA+>GW41,V*I1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5=;0H_K)F_PZ&+AR&r@V'R@+>Y`3+<X'\FCdKU1GL"J@rrhK0JGI/0etdF2``WI$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1GLm4+@KX[ANCqi0d'8%F<E=m0K:10
1-.0M3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3%cm-+@:3bCh+Y`F_tT!E]P=!1,'gn6t(1K
3ZoP#+@]pO+>PW*0d&2.3\`<L0fKFH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=Wi
D.7's3Zp460d%T,@<?'A+<WE^7V-$O1,(F;+>G`72)dQR0FA-o:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5=;0H_K)F_PZ&+AR&r@V'R@+>Yc.+<X'\FCdKU+>P'/ARZc;0JP:)0fD'H2EENJ$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1GUa/+@KX[ANCqV1*B%t@N[E[0eje*
2EE]N3]/Su$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
+>P'/ARZc;0JP:)0fD'M1cdHO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_
ATBgS1*@]-@<?'A+<WE^7V-$O1,(F;+>Gf90JY[C1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>Y,_6t(1K3ZoP$+@]pO+>PW*0d&2/3\rWS0es(C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp7%+@KX[ANCqV1E].u@N[E[0eje*2EE]O3\WK"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU+>Y-0ARZc;
0JP:)0fM-J0fh!E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+<WH_7V-$O1,(F;+>Gf91,M$K1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&
+AR&r@V'R@+?(Dc6t(1K3ZoP%+@]pO+>PW*0d&/13]&cV1H>dL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./heCj6?R!YA0=WiD.7's3ZpC)+@KX[ANCqV2'>A"@N[E[0eje*1HIBP3\rGs$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU+>k92ARZc;0JP:)0fD'J
0fh!H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3ZoP&
+@]pO+>PW*0d&2/3\r]U1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU+>k92ARZc;0JP:)0fD'L3BB#T$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<
+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3ZoP&+@]pO+>PW*0d&2/3]/TP0fTLI$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU+>k92ARZc;0JP:)0fD'M2EENP
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp:&7V-$O
1,(F;+>Gf90K2$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>G_r
+@KX[ANCqk+@]pO+>PW*0d&213\WKR0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!Y
A0=WiD.7's3Zp.8+<X'\FCdKU2BYJ#@N[E[0eje*2``ZO3\`N"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>t?3ARZc;0JP:)0fV3J3'&iR$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp@(7V-$O1,(F;+>>c9
1,_0K3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm
+@]pO+>PW*0d&/13]&TQ1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's
3Zp13+<X'\FCdKU2]tS$@N[E[0eje*0KLpF3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.
+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+?1K5ARZc;0JP:)0K;*M3BAuQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3ZpC)7V-$O1,(F;+>>f:0ebXE3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>P_q+@KX[ANCqn+@]pO+>PW*
0d&/13\rKO0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp17+<X'\
FCdKU3$:\%@N[E[0eje*0fh'G3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`
F_tT!E]P<u2'=#0@<?'A+?1K5ARZc;0JP:)0f_9M2**NQ$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO<+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3ZpF*7V-$O1,(F;+>>f:1,:mE2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqo+@]pO+>PW*0d&2)3\WEP
1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU3?Ue&
@N[E[0eje*1cd<G3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<u
3?TG4@<?'A+>GPm7V-$O1,(F;+>GW40K;*L2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg0d&qs@N[E[0eje)3BAiK3\WH!$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>G\q7V-$O1,(F;+>>f:1Gq3I1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqg1a#8!@N[E[
0eje)3BAuT3\WK"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=!1E[f.
@<?'A+>G\q7V-$O1,(F;+>GT30etdE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&
+AR&r@V'R@+>Yhs+@KX[ANCqg1a#8!@N[E[0eje*1cdEM3]&]$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>G_r7V-$O1,(F;+>GT30JkgH3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqg2'>A"@N[E[0eje*
0fh-J3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A
+>Gbs7V-$O1,(F;+>>f:0fM-J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r
@V'R@+>Yu"+@KX[ANCqg2BYJ#@N[E[0eje)3BArQ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*!.+@:3bCh+Y`F_tT!E]P=!3?TG4@<?'A+>Gbs7V-$O1,(F;+>>f:2)REK0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>bbp+@KX[ANCqg2BYJ#@N[E[0eje*0KM'I
3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="0d%T,@<?'A+>Gbs
7V-$O1,(F;+>GT31,(aG0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@
+>bhr+@KX[ANCqg2BYJ#@N[E[0eje*0fh-J3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.
+@:3bCh+Y`F_tT!E]P="1E[f.@<?'A+>Gbs7V-$O1,(F;+>GW40JkgI0FA-o:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>bnt+@KX[ANCqg2]tS$@N[E[0eje*0KLpJ3\WQ$
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="2'=#0@<?'A+>Get7V-$O
1,(F;+>GT32)dQP1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>bu!
+@KX[ANCqg2]tS$@N[E[0eje*1HI6N3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3b
Ch+Y`F_tT!E]P="2]s52@<?'A+>Get7V-$O1,(F;+>GZ51,CsK3=6*#:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>c&#+@KX[ANCqg2]tS$@N[E[0eje*1HI?J3\`T$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="3?TG4@<?'A+>Get7V-$O1,(F;
+>Gi:0f(jE2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>khq+@KX[
ANCqg2]tS$@N[E[0eje*3'&fQ3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`
F_tT!E]P=#0d%T,@<?'A+>Ghu7V-$O1,(F;+>>f:1,1gF2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<0H_K)F_PZ&+AR&r@V'R@+>kns+@KX[ANCqg3$:\%@N[E[0eje)3BAoO3\`K!$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=#1E[f.@<?'A+>Ghu7V-$O1,(F;+>G]6
1,1gD0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>ktu+@KX[ANCqg
3?Ue&@N[E[0eje*0fh!C3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!
E]P=#2'=#0@<?'A+>b3,E,m'V0JP:)1,(aG2**QP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=
+<X!nBl%<&:3CD_ATBgS2)ZR"6t(1K3Zp@(9jr;i1,(F;+>GZ52)@9M3=6*#:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqg1E]D#Gp"jr0eje*0fh-F3\`N"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>GYp9jr;i
1,(F;+>GZ50JY[H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>l/%
+@KX[ANCqg1E]D#Gp"jr0eje*3'&fO3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3b
Ch+Y`F_tT!E]P=$0H_K+@<?'A+>G\q9jr;i1,(F;+>GW40fM-K1C=Hr:-pQU;gEG+ASjIN8l%ht
4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp=?+<X'\FCdKU0f1"I@<itN0JP:)
0f1pK1cdHQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K
3Zp.8+AH9i+>PW*0d&/03]/cU1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=Wi
D.7's3Zp@8+<X'\FCdKU0fC.K@<itN0JP:)0KD0K1cdBH$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO=+<X!nBl%<&:3CD_ATBgS2_cEt6t(1K3Zp.8+AH9i+>PW*0d&/13\`NR1c,OH$;No?+B*Q,
FCf;M+A,Et+?VbrDf'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=%1*@]-@<?'A+>Gbs
9jr;i1,(F;+>>f:1GV!I1C=Hr:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk
6?R!YA0=WiD.7's3Zp@;+<X'\FCdKU0fC.K@<itN0JP:)0f_9L1cd?K$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS2`)X"6t(1K3Zp.8+AH9i+>PW*0d&223\`KQ0Jj+D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp."+@KX[ANCqg3$:q(Gp"jr
0eje)3BAlR3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0fU:M@<itN0JP:)0KD0O3'&iN$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.:+AH9i+>PW*0d&2-3\WBO2)>RH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg3?V%)Gp"jr0eje*0KLmA
3]/l($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,'hF
@<itN0JP:)0ek^H1cdKM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>PVn9jr;i1,(F;+>GW41c[TR2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp13+AH9i+>PW*0d&2+3]/lX0fKFH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i"Ol6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh0Ha(uGp"jr0eje*2**NO3]&Z#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,'hF@<itN0JP:)
0fV3N0KLpK$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqh0Ha(uGp"jr0eje*3BAiQ3\`Gu$49Np/g+)<F*(u13Zq$j6m+TS@rH4$
ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp13+AH9i+>PW*0d&223\WNS
1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,9tH
@<itN0JP:)0f;!I1HI3H$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh1*B;"Gp"jr0eje*2**NN3\WK"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>P\p9jr;i1,(F;+>G`71c7<M2[Tm!
:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.7+<X'\
FCdKU1,9tH@<itN0JP:)0f;!K2EENJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&
:3CD_ATBgS0fC-s6t(1K3Zp15+AH9i+>PW*0d&2/3]/]S1H5^K$;No?+B*Q,FCf;M+A,Et+?Vbr
Df'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>P\p9jr;i1,(F;+>Gf9
0JPUB3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh
1*B;"Gp"jr0eje*2``WP3\`T$$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>
+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp15+AH9i+>PW*0d&203\WNS1cPgL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,C%I@<itN0JP:)0K;*L3'&lS
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+AH9i
+>PW*0d&213]/oY0Ja%C$;No?+B*Q,FCf;M+A,Et+?VbrDf'?&DKKH#5!C)TF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3b
Ch+Y`F_tT!E]P<u1*@]-@<?'A+>P_q9jr;i1,(F;+>Gi:2*!]Q2[Tm!:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh1a#M$Gp"jr0eje*0KM'J3\`T$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pbr9jr;i1,(F;
+>Gf92)I?N0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>P_q+@KX[
ANCqh2'>V%Gp"jr0eje*0KLsF3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>Pes9jr;i1,(F;+>GQ21bq*I1("?q:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqh2BY_&Gp"jr0eje+0fh0J3\rT"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Pku9jr;i1,(F;+>GT3
1GCjG3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqh
2]th'Gp"jr0eje*0fh0L3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!
E]P<u3$9>3@<?'A+>Pku9jr;i1,(F;+>G`71H7EO1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
1*@]+F_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqh2]th'Gp"jr0eje*2``cM3\WQ$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>Po!9jr;i1,(F;+>GZ51bh$H
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3?V%)
Gp"jr0eje*0fh-O3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=!
1*@]-@<?'A+>Pr"9jr;i1,(F;+>GW40fM-I3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp4$8p,"o1,(F;+>GW41,CsF2@9cu:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp7%8p,"o1,(F;+>GZ52)%'G2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp7%8p,"o1,(F;+>GZ5
2)mWO1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp7%
8p,"o1,(F;+>G]60JkgJ2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@
+>k8a6t(1K3Zp7%8p,"o1,(F;+>PW31G_'G2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,
F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp@(8p,"o1,(F;+>>c90K(sK3=6*#:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp@(8p,"o1,(F;+>>c91bh$H2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+A-co+>PW*0d&/(
3\WEP1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg
0d')2DBL\g0eje)0KLsC3]/l($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!
E]P<t0H_K+@<?'A+>GSn8p,"o1,(F;+>>K11H@KM0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+A-co+>PW*0d&/03\rHN0Js1E$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./i4[n6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1a#D5DBL\g0eje)3'&lM3\rW#
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f1"FF`&<W
0JP:)0KD0M3'&fN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO@+<X!nBl%<&:3CD_ATBgS1a!o/
@<?'A+>Pbr:2b:u1,(F;+>G]60f1pI3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp17+AQiu+>PW*0d&2-3\rTR1GoLH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./i4[n6?R!YA0=WiD.7's3Zp='+@KX[ANCqh1a#P3Fs&Oo0eje*1cdKJ3\`>r$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,L+KDg!6Y0JP:)0f;!L
3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO@+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pbr
:2b:u1,(F;+>Gc82)mWQ1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@
+?:Pe6t(1K3Zp17+AQiu+>PW*0d&203\WHQ0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i4[n
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,L+KDg!6Y0JP:)1,CsG1-.*J$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO@+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp18+AQiu+>PW*0d&2+3\WKR2)YdK
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i4[n6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,U1LDg!6Y
0JP:)0etdE0fh!C$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO@+<X!nBl%<&:3CD_ATBgS0f'pp
6t(1K3Zp18+AQiu+>PW*0d&2+3\`TT0fTM4:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+A,Et+B2-4
9N*'#F_PZ&+D>J1FDl2F+ED%7ATTsU:LeKb@V'R&1GLF'1,(CA%13OO$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,:d2+@KX[ANCqi0d'8%F<E=m0K:101-.0J
3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,:g3+@KX[
ANCqi0d'8%F<E=m0K:101-.0L3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!n
Bl%<&:3CD_ATBgS1,:j4+@KX[ANCqi0d'8%F<E=m0K:101-.0M3\`Gu$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,CU,+@KX[ANCqg0Ha,/Fs&Oo0K:100fh'J
3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,CX-+@KX[
ANCqV1*B%t@N[E[0eje*2EEQH3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!n
Bl%<&:3CD_ATBgS1,C[.+@KX[ANCqV2'>A"@N[E[0eje*2EEWJ3\W>s$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,C^/+@KX[ANCqV2BYJ#@N[E[0eje*2```M
3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>t?3ARZc;0JP:)0fM-M0KLsJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp='7V-$O1,(F;+>Gf92)REL2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp4$+@KX[ANCqm+@]pO+>PW*0d&/03\rKO1,fOI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU2]tS$@N[E[
0eje)3BAuQ3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS
2'=#0@<?'A+?1K5ARZc;0JP:)0K;*M3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3ZpC)7V-$O1,(F;+>GQ21,M$H2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp@(+@KX[ANCqn+@]pO+>PW*0d&2*3\`HP
1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU
3$:\%@N[E[0eje*0fh*L3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+?1K5ARZc;0JP:)0f_9M2**TL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqo+@]pO+>PW*0d&/13\iHO1GB.C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+?:Q6ARZc;
0JP:)0fD'I2EENN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqg0H`hr@N[E[0eje*1-.*K3]&c&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO<+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+@]pO+>PW*0d&/13\rZT1-#[K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q7V-$O1,(F;
+>>f:2)@9M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp.7
+<X'\FCdKU0f1"BARZc;0JP:)0f1pI2**QQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg2]tS$@N[E[0eje*3'&cM3\`W%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.:+@]pO+>PW*0d&/1
3\iHO0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t3$9>3
@<?'A+>Ghu7V-$O1,(F;+>>f:1,CsG2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0fU:FARZc;0JP:)0f1pH0fh$D$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg3?Ue&@N[E[0eje*0fh!C
3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp7%6#^ie1,(F;+>PW31c7<N3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!Y
A0=WiD.7's3Zp15+<X'\FCdKU2]th'Gp"jr0eje*1HIBL3]/W!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp.5+AH9i+>PW*0d&2*3]&NO0f]RJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>GYp
9jr;i1,(F;+>GZ50JY[H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=Wi
D.7's3Zp18+<X'\FCdKU0f'qH@<itN0JP:)0fV3L1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg1a#M$Gp"jr0eje*1cdEL3\WDu$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp.6+AH9i
+>PW*0d&2-3]&WR1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!+t2D/Ej%FCeu*+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*
F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg1a#M$Gp"jr0eje*1cdKJ3\rGs$49Np/g+)<F*(u13Zq$j
6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0f1"I
@<itN0JP:)0f;!G3'&`J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r
@V'R@+>Y_p+@KX[ANCqg2BY_&Gp"jr0eje)3'&oS3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp.8+AH9i+>PW*0d&/13\`HP1,B7E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>Gbs9jr;i
1,(F;+>>f:0fD'L2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=
+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.8+AH9i+>PW*0d&/13\rTR1bf=E$;No?+B*Q,FCf;M
+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqg
2BY_&Gp"jr0eje*3BAlO3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&
:3CD_ATBgS1H$?u6t(1K3Zp.8+AH9i+>PW*0d&223\`KQ0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fU:M@<itN0JP:)0KD0K2``cQ$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.:+AH9i
+>PW*0d&/13]/lX1GfFG$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.:+AH9i+>PW*0d&2-3\WEP0JEh@$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f^@N@<itN0JP:)0ebXB
0fh!C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp13+AH9i+>PW*0d&2*3]/`T2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU1,'hF@<itN0JP:)0etdH3BAuW$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp13+AH9i+>PW*0d&2+3]/lX1,'%B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,'hF
@<itN0JP:)0f;!J2EEZP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r
@V'R@+?:Pe6t(1K3Zp13+AH9i+>PW*0d&213]&NO1,91D$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b
@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0Ha(uGp"jr0eje*
3BAiR3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp15+AH9i+>PW*0d&2.3\iKP0K0=G$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$
A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh1*B;"Gp"jr0eje*2**NN3\`Gu
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp15
+AH9i+>PW*0d&2.3]&]T1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B;"Gp"jr0eje*2**QP3\WK"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp15+AH9i+>PW*
0d&2/3]/]S1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1*B;"Gp"jr0eje*2``WI3\`N"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp15+AH9i+>PW*0d&203\WNS
0f]RJ$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r
@V'R@+>Ghu+@KX[ANCqh1*B;"Gp"jr0eje*2``WP3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+AH9i+>PW*0d&/03\r`V1cYmM$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P_q9jr;i
1,(F;+>Gi:2*!]O2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>
+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+AH9i+>PW*0d&213]/oY1GK4D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>Pbr9jr;i1,(F;+>GQ2
2)I?L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU1,L+J@<itN0JP:)0fM-N1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh2'>V%Gp"jr0eje*0KLsF3\iDs$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp18+AH9i+>PW*0d&2)3]&TQ
1,K=F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A
+>Pht9jr;i1,(F;+>PZ42)@9L2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!Y
A0=WiD.7's3Zp18+<X'\FCdKU1,g=M@<itN0JP:)0ek^F0KM$E$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]th'Gp"jr0eje*0fh0L3\`T$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1:
+AH9i+>PW*0d&2.3\r`V1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`
F_tT!E]P<u3$9>3@<?'A+>Pku9jr;i1,(F;+>Gf91bh$G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU1,pCN@<itN0JP:)0f(jI0fh'J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh3?V%)
Gp"jr0eje*0fh-O3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_
ATBgS1GL!p6t(1K3Zp1<+AH9i+>PW*0d&2+3\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A**1+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E];4DBL\g0eje*1-.0H3\WN#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>b35F`&<W0JP:)
0f(jJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r@V'R@+>Y,_
6t(1K3Zp7%8p,"o1,(F;+>GZ52)mWO2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um
6?R!YA0=WiD.7's3Zp7%+@KX[ANCqj+A-co+>PW*0d&2-3\WBO2)bjL$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1a#D5DBL\g0eje+0KM!G3\`;q
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+?(E8
F`&<W0JP:)0K;*I2EE]N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp@(8p,"o1,(F;+>>c91bh$H3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./i+Um6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg0d')2DBL\g0eje)0KLmF3]/W!$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GSn8p,"o1,(F;
+>>K11,1gD0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU0ejeCF`&<W0JP:)0JGOD3BAiL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+A-co+>PW*0d&/03\rHN0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f1"FF`&<W0JP:)0K;*M
0KM!J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@+>Y,_6t(1K
3Zp.6+A-co+>PW*0d&/13\r`V1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3b
Ch+Y`F_tT!E]P="+<X'\FCdKU1,L+KDg!6Y0JP:)0f1pG1cdHK$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp17+AQiu+>PW*0d&203\WHQ0Jj+D
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,U1L
Dg!6Y0JP:)0etdE0fh!E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp18+AQiu+>PW*0d&2+3\`TT0f]S;:K(5"C2[X)Df9H51,2Nj/h1USA9;a.
Ci^_?/M/)[De*s.DesJ;E,Tf>E,ol,ATMp2E\7e.%15is/g,1GFCAm$+EqL5FCfN4@:NjX$7InX
3]&Q?+>FuJ$4R>;67sBpDKBr@AKYGjF(HI'$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+CfG'@<?'6
Bl7X,BjkglH=\4-+A,Et+EVO?Ci^_;@VTIaF:ARL:IK;CDesK%BkhQs?TgFm@rH6rG9A8AC2[X)
Df9H5-QjNS+<VdL+<VdL+<VdL+<XEG/g,%CG9D!GDesJ;DdmHm@rr.e-nul+1+"b*+CfG'@<?'q
De*s.DesK%?V4*^FDl)6F!+(N7!*?cCi_.":IK,1C*4Wo67sC"@<6K4F(K0"+CT.u+A,EtEt&Ic
F_PZ&C2[W<0ht%f.UmO7Ch.:!A0<"9/M/)SF_PZ&F!+m6Ap%p+Gp$U8D/Ej%FCeu*8l%htCi<`m
+EV19F<GX7EbTK7/g(T1:-pQB$;No?+@:3bCh.T0@3B&uD/Ej%FCeu*8l%htCi<`m+EM%5BlJ/H
+B!?"+EqOABHS^DD(,o$:-pQB$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfs
Bl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(
@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@lt
EbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr:-pQU%15is/g)8Z0d(LR+=CW@Bl%<pDe(4<+AP6U
+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQU%15is/g*MiG%G*(
F#ja;:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>
Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JP;!@<jRa
+>"^YE+EC!ARloqDfQsm:IH=EDfTqBFDi9qBl8'<+AYoF$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.
E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4
-QlV91E^UH-RT?1%15is/g+e<F<G=:A0>?(Bl%<&F`_>6Bln'#F!+n/A0?&,EcYr5DBO%A@:O(e
DJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%15is/g,4HF<GaDA.8knC2[X+
ATDj+Df-\4De*="Bl%<iDKI6h3\l%78l%iU9gfEtC2[WlF_PZ&A79Rk4ZX]oCi"36Bl+u7F*(i-
E$m"B$>OKi@WcC$A7KM!4ZX]L3biSD@WcC$A7KM!%13OO:-pQUBl7F$ASl!rF<G%8Bl%<&@;]Tu
F('6'+>"^QF`VXI@V$ZmDf0,/@V'.iEb-@&$;No?+EM%5BlJ/:B4YslEaa'(Df-\>D]ib3F*2M7
+D>=pA7]d(@;]Tu@r,RpF!+(N6rm#M+DkP/@qZ;Y8l%iU9gh-*-u*[2@WcC$A7KM!4)/\E@WcC$
A7T+jALS`M0d&5#I7d:'<_Ysk$?U-(Ci<f+E-67F-V@0&<_Yt0%13OO:-pQUF(KG9Dfp/@F`\a<
Bl%@%%15^'6q0aA76N[S-YdR1@rH4$ASuU$A1hS2F!hD(8l%iK:I.BJ78m/T8PDQ93Zr0V@<?1(
AT/c,E+*j%+=DVHA7TUrF'N?hDImisCg:^nA6^K58l%iE8PDP^$;No?+C\bhCNXS=De:,&BleB:
Bju4,ARloqBl%?'E,8rmARlotDBNn@F<G+.@ruF'DIIR"ATJu8@rc:&F<G+.Eb/a&DfU+4$;+)^
6qL<V;Fs2T<(02E8PDQ93Zr0V@<?1(AT/b?+tb6A6W,9_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f
3[-:$6r60K87,_&<*s!):IK,1C+1]+:IIZD9LTBt%16c[@:VM^-Vcu\+B*Q,FCf;M+A,Et+?Vbr
Df'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
-S.q\%16c[@:VM^BOtU_/0H>g:-pQU<b6;mBl@lM+=A]gC2[X+ATDj+Df.!T-QjNuF_PZ&+AR&r
@V'R@+=A]g,!'IWA7B[qCh.$nF=Aag+<X'\FCdKU-S0"NA7B[qCh.'bFCcmP9L]HuF)>i<FDuAE
+D>=pA.8kT$;No?+EVaHDBNk8+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNJ4EbTE(+Cf>,D.RU,
ARloU:IH=ADdd/c$><p43bW)5A1T)V3?^F?0e"5"-S."t9L]Hu%15is/g+e<F<GOCAT2[.@qB_&
DfQtA@rc:&F:ARu4ZX]60fq'31+@Q23Zp7%B4Z0--YdR1E,oN/-OgCl$;No?+DkP$DBMPI6m,uU
@<6L$Et&Ih4ZX]I3ZoebDe*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6-Qij*
%15is/g+e<DImisFCcS-Ec6)>F!,[@FD)e,Df'?&DKKH#+D>=pA7]e&%17/>3ZrJd/0I"s-p070
9L^HR/1)u5+=nW`I4dcG-o)oP1+$jHCLnqD-9`Pb%13OO:-pQU@;p0sDIal/Df^"CE,ol,ATMp2
EZfF5EbTK7+>"^TEb/isGT^[2@:Wqi%17/>3ZrJd/0H>r,>:QU+=nW`0fq'31+@Q23Zp7%B4Z0-
-YdR1E,Tf>-OgE(4ZX^!@j!<FEt&Hc$;No?+ELt7AKYf-@:UL%@rc:&FE7luF)>i<FDuAE+=D)M
FDuAE+D,>(AKYf-@psInDf.T`%14M)4ZX^-Db*Z&<$662+Eqj?FCcS9BQ&*6@<6K48l%iK:I.BJ
78m/T8PDP^$?L'&F`_SFF<GWIGB.D>AKZ&-Dg-//F)rHr:IITB;cHXd6<-uR6q0aA71BS5$;No?
+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=+DkOsEc2Bo8l%iA<CokP
84c`Z:Jt=Y3Zoh*4"qd4.=4*:+>b3RATT%B8l%iA<CokP84c`Z:Jt=C%15^'6pamF9LMEC;cHOj
=Zneg8l%iA<CokP84c`Z:Jt=H-o*#@7O]m%ART*Y$8`lEF`\`R8l%iA<CokP84c`Z:Jt=C4#/ZT
8l%iA<CokP84c`Z:Jt=)$4R>;67u_mFCcS9BmO>5De:,)ASu("@<?'k+E2.*Bl8$(G]Y'L@rc:&
F:ARuD/XQ=E-67F-mC\sF"&Xf+Cf>,D.RU,ARlp)@rc:&F<G%<FCfM@%17/nDfp/@F`\`R8l%ht
@rH4$ASuU$A0>?(Bl%<&@rH4'Ch7^"-OgCl$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ:f
De'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2
BK8(5?O[?OF_PZ&C2[WmDf'H6ATMp(A25l767s`sF_PZ&C2[WmDf'H6ATMp(A0<"9/M/)SF_PZ&
F!+m6Ap%p+Gp$U8D/aN,F)to'+A,Et+Dbt)A0>u*F*&OG@rc:&F=n[C:-pQ?:-pQUG%G]'@<?4#
3XSVK/db??/g*K'Bl%=$+CQC&Df'H6ATMp(A0=K?6m-;a@:UL%@rc:&F=n\6F`&=GBln#2-us/R
$;No?$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL+<XEG/g,(AFCAm$+A,Et$;No?+<Vd_
+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEsbZ/
/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+<Ve%67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeY
F)rIGBPDN1F(96)E-)F^67sAf:-pQU+<WB]EbupH@WcC$A86$n@rH4'Eb0<5ARm/2+AP6U+EDUB
+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c#g67sAf:-pQU6Xb.L@<?QO$;No?
$;No?+AQhtATDg0EZek*ARfLiDJ(R/:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%?'@;]Tu
H=gl-ATJu&A7TUr$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB73,N)L
1,pCsAStpnAM8(8Ci<flFCcS)Df'H6ATMp(A0>r'EbTK7+EVNEEc5l<+E(j7C2[W*@:WneD@0-*
/g)l'An>F*2'@$_AKWC9E+*j%F(K;>+EVNEF(fK9+E27>FCAWpAKZ&9H#.%7Anc'm+E1b2BQFMU
67sB80kP!+0K:1bDeX*1ATDl8-Y[=6A1&L.A7T7^+CSl(ATAo1Dg#i4B-9fB6m-2]FCfK)@:Njk
FDi:9C2[Vi:-pQU0emQaFttlsFCfN8ARlp%DBNb0DKU12$?B]tF_Pl-+=DVHA7TUrF'N-o@pF=o
E*R^$Bl%@%/no'A-OO@%@s)g4ASuT4-XpM*AL@gpDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1
+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?
+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>mDf9PW3Zri'
+Co1s+>=.@A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`3$;No?+D58-+DPh*+C]J-Ch+Z2
FD5Q*FD5<-+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)7-FDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&
C2[W1$49Np/g,4HF<GaDA-s]!De+$&EcYr5DBN\4A7B[qCh.$nF=04414(WG:IJ5X6jd[IA7B[q
Ch.'bFCdTr+CT)&FE2)4+EV[H@;Ts2-OOU,A7B[qCh.$nF?MZ-5!!FsA7B[qCh.$nF:&@M67sBp
DI[]uD.RU,+C]J-Ch+YsDIal2@<Q3)/KenQF*&O6AKYN%DIjr"AS,k$AKV=T67sC%@rc:&F<G4-
DImisFD5Z2+EVNEBl8!7Eb-A,ART+\EZee.A0>Au@<6K48l%iU9gg+@@<?!m$;+)^<_YtF3[e`]
A7B[qCh.$nF?=5UA7B[qCh.'bFCcmD-nui".=Ffa6rm#M$?U-(Ci<f+E-67F-V@0&<_Yt0$49Np
/g,4HF<GLEFDuAE+D,>(ATJ2N:IIZD9LV**+=CoBA1hS2F!h;i67sBQ:IIN890G<Y+=CoBA7At_
/no'A-OL2Q:IIlP5t"[@;cH4X9LV**+DPk(FD,`,E$/n7@<?0*-[oK7A8c@,>\@VcATD3q>\\1f
>UM'p:IIZD9LT:`67sBi@:O(qE$0(2+Co2-FE2))F`_2*+D,>(AKYr.@:NkZ+DG^9E-67FA8,Oq
Bl@ltEbT*++EM%5BlJ/:A8-'q@ruX0Gm[/>6psUF<)Q:S<E)CT7S-9B4ZX^#E+*j%F(K;5-mC8k
;aXG1/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iE8PDP[
$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&
DfU+18l%iC8Q/Sd8O?EV8P`)b8PhQ2+DPk(FD,`,E$-NCDe*3&/1;ku?RHt+BOPq&F^cJ.De+$&
EcYr5DCI+a/p_5N-ONIA6psUF<)Q:S<E)Oc:0L4c4ZX^#E+*j%F(K;5-mC8k5tjit/3@Zd@rl7,
?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iC8Q/Sd8O?EV8P`)b8Pfa$
BOtU_4ZXrc67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D'pl.7LEg?@:VM^BOtU_/0H>g:-pQU<b6;mBl@lM+=A]gC2[X+ATDj+Df.!T
-QjNuF_PZ&+AR&r@V'R@+=A]g,!'IWA7B[qCh.$nF=Aag+<X'\FCdKU-S0"NA7B[qCh.'bFCcmP
9L]A1D/XQ=E-67FBOtU_$49Np/g,7YEc*"<AnE00BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3A9Dp,
DJ((a:IH=ADdd/`BOa1dBOtU_/12i++Z_G7.3L;l/5/M?$;No?+D58-+E2@4E,ol,ATMp2EZfF5
EbTK7+>"^PARTan+E).6Gp$d3@:Wqi+Cf>,D.RU,EsctO3ZqsEGA(]4ASQ9rEbTK7+=Js+0H`,"
HTF211a$FBF<DrGDe*g-AT0"($;No?+DkP$DBMPI6m,uU@<6L$EscPC3ZpLF+=CoBA8c?.C2[W*
C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P=+:8HN67sBjDes6$@rri+Ec6)>+Co&&ASu$i
DKKqB$=m^eF$2Q,B4PRmF!`M'+D2#gF)>i<FDuAE+=CZ;D/aN,F)u&5B-8fZ/g)MK:-pQUA7]su
Blmo/B6%p5E$/h*@:WqiF!(g'4ZX]rATqg%FCf3.@rc:&F=&V(+F?-n0d&Z,3Zp1#B4Z0-B*nu@
67sBjDf'H6ATMo8@;Ka&DJsE'AT23uA7]Y#+EqaEA9/l-DBNM!@qZutEc6)>+=LY@@rc^0@q]Fo
.10R'A7[nb+=nX`/jMI-Df'H.-9`P#."*^53bNJP.4-Z2+D3,G/M8A&4s4BIE,u?n:-pQU@rH3n
Bl7K)BOtU_ATAo%DIal6DfTA2A7]@eDJ=3,Df0V=$?J?k+EJYV+?L\s+D;lK/g+YBA7Z)T:-pQU
@;p0sDIal/Df^"CE,ol,ATMp2EZfF5EbTK7$?J?k+EK(VA7]suBlmp$F(96)E-*3N0fq'31+@Q2
3Zp7%B4Z0--YdR1E,Tf>-OL2U67sC$ASl@/AKYD(An?0/Eb0)rBl7X&B-;5+A9Dd#@;^00@VfIj
CNCV,AoqU)+::k1/g+SDF(o9)D.RU,F!*%WFD,6"EZf=AATMF#@q?ckDJjB<F!,=2+UW9R3Zr*G
+=nW_0-ED100Lp@+?_b=4ZXr5@q]:gB4Yt#F<GW3$;No?+ELt7AKYK$D/aN,F)to'+Dbt)A0>r'
EbTK7Escu*Dfp/@F`\`RDfp/@F`\a<Bl%?'Ci<flFD5Z2F#kZU.!%O4+EVNm:K(48F"&5UEbTW,
+EM47GApu3F!+(N6qgBB6rZTR<(9GQ71+*QDfp/@F`\aI+Eqj?FCcS9BQ&*6@<6K48l%iC8Q/Sd
8O?EV779U:9LT9q:-pQUF`:l"FCcS)Df'H6ATMp(A0=K?6m-#SF*)G:@Wcd,Df-[L+ED%5F_Pl-
F!,d@Bl%@%$;No?+CT.u+E2+BBlGgb/nK9=+E)-?@rH4$@;]TuF(f-$C`m\*FD)#&+F8'>E,8rm
AKZ&-Dg-//F)rHr:IIZD9LV$8:IITB;cHXd6<-uV:JP(b:^RP)67sC'E+EC!AKYH)Bl%<&BPDO0
DfU+G/Kf+VDfTE"+CT=6E,8rsDBO%4G]Y'F@:O=r$;+)^6<-TN6qBmJ<)6Cp4ZX]60fq'31+@Q2
3Zp7%B4Z0--V@0&6<-TN6qBmJ<)6Cp-ONIA6pamF9LMEC;cHOj=Zneg8l%iA<CokP84c`Z:Jt=H
-o*#@7O]m%ART*V1a$a[F<Dr':IINL8PDNC8Q/Sa;HYA/1,V-c:IINL8PDNC8Q/Sa;HX>6:-pRB
H$!U?F(or3+E(j7B4YslEaa'$A0>i-@;0V$AU&;>F(96)E-)G.D/XQ=E-67F-mC\sF"&Xf+EM%5
BlJ/:@X3',F!h<9D/XQ=E-67F-V@0&+Cf>,E,oN2F(Jl)@WcC$A0>B#D/a<&FCcg,$;No?+ED%7
FDl22+E)41DBNJ(@ruF'DIIR"ATJ2sA0>f/D]i7,1E^UH-RT6.@rGk"EcP`/F<Dr?@<6!-$=e!c
Eaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?OC7bBl%<pDe*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$n
A8-+,EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&%13OO@rGjn@<6K4FDYu5
De!-?5s]7(A7B[qCh,Od3F<ml3Zoe95s]7(A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\
Df7d"+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgCl$8EZDFEAWQF`:l"
FCf3*A8PamBkCptF=.M)%17,s+=CW@Bl%<pDe*?rD/aN,F)to'-OgE'F!)i>F_PZ&C2[X)Df9H5
@rH4'Eb0<5ARm.t$4R=s+EDRG+=D;NA79RkC2[WnBleB:Bju4,Bl@l:%14g4EccCG-ZsB=@<?'q
De*p-F`Lu'A9Da.F!hD(%14g4EccCG-ZWd7ARTXkC2[W1%13OO:-pQUA8,OqBl@ltEbT*++E)41
DIm?$Bl5&6ASbpdF(K*)A.8l@67sC!A0?:QDf9P'$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(L?
F"Jsd@WcC$A90DHE+EC!ATJu&+F7a@+D,>(AKYK$DKK<$DJ=!$+A,Et+Cf4rF)to6/g(T1:-pQB
$;No?+@:3bCh.T0@3B&uD/Ej%FCeu*8l%htCi<`m+EM%5BlJ/H+B!?"+EqOABHS^DD(,o$:-pQB
$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU+<WH_De't<
-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5
+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1
F(96)E-)Nr:-pQU%15is/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*D.-ppD]gG_
+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67sAi$;No?+@BR\ART\%3XlEk67r]S:-pQU:2_7d
EcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<V+#:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0ktiK0JX(E:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0emEcDD4!l/KeJ4A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b
/no'A%13OOEb065Bl[c--[oK7A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%16T`@s)g4ASuT4-XpM*
AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_
5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'n
F!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<
A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A
@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fnC2[X+ATDj+Df.^!+=o]1
HV.(%<_Ysk$4R>;67sBqDe*QsF'j0!G[G\JH>.=@Bl5&4F`\a:Bk)7!Df0!(Gp$O3Bk;0)A8-'q
@ruX0Gmt*Q:IITB;cHXd6<-uV:JP(b:d$ieC2[WsC3*`0/1;ku?RHt+BOPq&F^cJ.De+$&EcYr5
DCI+a/p_5N-OgDK9M%ZJ:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.
:dJ&O?XH`2?XHE$6uQOL%15^'6psUF<)Q:S<E)Oc:0L4c4ZX]O9M%ZJ:dJ&O/4r]+6qL<V;Fs2T
<(Tk\>"MO"$4R>;67sBnASu("@<?''8l%ht@r,RpF!,O6EbTK7Et&Ik@r,RpF(KDU3ZpLF-YdR1
+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!,49A8c?5%16igA7fOlATL!q
+=K?-+C?iP+DkP&AL9S`C1D'gF)to6%13OO:-pQUEb/Zi+Cf4rF)rI9Bl%@%+C\bhCER&'A0?):
Blmo/FDi:JBlG1($7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Ys
$4R>;67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3RATT%V3[\Z\
A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1+u(3]EaoOc
%15is/g,:UA79Rk+D,>(ATJu.DBO"=F`Lu'+F7a@+DG^9@;KXhDBKAq7S-9B;a!/a-u*7.@<6L$
F!*"VHS-Ks+EMR5.3L/g/j:C?-SB+JF!hD(0Ka)gA7T+j+<VdL+<YuNAT2Ho@q?c24tq=Q8PDQO
.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X(FDl22A79R&H?*S9Cgggb+=KE.HU^S#78kWs8l%iC
8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA7TUfA79R&+<YuNAT2Ho@q?c24u.IS8PDQO.6C-t6psUF<)Q:S
<E)Oc:0L4c%14dOC2[X"@;BFb@<<V7H?*S9Cgggb+=KE0HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0Ka)gA9E!.Ch-sr+<YuNAT2Ho@q?c24u@UU8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dO
C2[X)Df9H5A79R&H?*S9Cgggb+=KE2HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8c?r
@<<V7+<YuNAT2Ho@q?c24uRaW8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X%Ec5Q(Ch4_3
H?*S9Cgggb+=KE4HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8kstD0$gB+<YuNAT2Ho
@q?c24udmY8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*F(KB%Df00$B4>:b+<YuNAT2Ho
@q?c24umsZ8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUA8`T!Cht4:Anc'mF!,%=BleA=
Bl5&>BlFLgH=_>8F*&T\+@\pr78k<[/g*8K:IITB;cHXd6<-uV:JP(b:^mbQD/XQ=E-67F8l%iC
8Q/Sd8O?EV8P`)b8Pfj'%15is/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'GtDf9P:>9G^E
De(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&@WcC$
A86$nFDl)6F##IF67s`sF_PZ&C2[X)Df9H5+EK+d+C]J-Ch.T0@3B0)Ci"A>@rH4$ASuU$A0=K?
6m-SiDesJ;@r,RpF!,O6EbTK7/e&._67r]S:-pQUG%G]'@<?4#3Znk=:-pQB$;No?+@BR\ART\%
3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/
Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'0K<oXGqq?%
/Kf(FDIIBnA0>>i@r$4++EVNEE,ol-F^oN-Df-[L+EM76E,96#Bk;?.8jQ,nBl8!6@;Ka5D..-r
FCf>uDI[5e$;No?+>PW*0l:?E0f1")+E_X6@<?'k+D,P4+A,Et+E27>F<G[D+A?KeFa,$);[j'C
$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2
E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUAn?'oBHV>,EHPu9ARlp+FD5Q4
+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl
$;No?+EM+9+EhU4%14ItDe+$&EcYr5DBN\4A7B[qCh.$nF=04414(WG:IJ5X6k'K<De*="Bl%<j
@<?'D3ZrNcFCB$*-RT?1-YdR1FDl)6F*;,8F(oQ1+DPh*FDl)6F(09+Ch.$nF=04414(WG:IJ/X
:J=\f9gfEtC2[X)Df9H5@WcC$A7KM!4ZX]L3biSDFDl)6F(09+Ch.$nF:AQd$;No?+DG_'Eb0*!
DKI"1F_PZ&+Cf>4DKKH1%15^'6rZrX9N+td6p3RR-u*[2FDl)6F(09+Ch.$nF?=5UA7B[qCh.'b
FCcmD-nui".=Ffa6rZrX9N+td6k'KFD/a<0@j#`5F<Dr':IJ/X:J=\f9gg?<$4R>;67sC%ATT&5
F`_SFF<G10Ch7Ys$;+)^<)6:`;`u`U-YdR1FDl)6F(9-*D.RU,ARmE-C3(a3$;+)^<)6:`;cH1a
<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$B4YslEa`chC2[WfC2[WoG]\"3-S.kc6rZrX
9N)B-:-pQU@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'n
F!,O6EbTK7+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ/gjRb;C="W
Ci<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6rZrX9N)B-%172j
ART+43ZoeF67sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:-OgE)BOtU_4ZX].FD,5oA1UDD/1;l@67sB]
ATDj+Df.TY-S0"NA9;a.Ciac2EcYr5DCd.X+@:3bCh+Y`F_tT!E]P<j/1;]'C2[X)Df9H5@WcC$
A7KM!.4chh+@KX[ANCq]/8B*6@WcC$A7T+jALT0(7L]]GD/XQ=E-67FFD,5oA.8kT$;No?+D58'
ATD4$AKZ)5DesJ;F(96)E-*42DIal2@<Q2k$7Bk(+EVO?Cia*,BlJ/A4ZX]@+Dkq9+=CoBA9;a.
Ci^s5$?L'&F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@lM-OgD2F$2Q,FDj]G;cFl]BOtU_/5/Ma
FDl)6F(96)E-*NOGB.D>AKZ&-Dg-//F)rHr:IJ/X:J=\d78m/T8PDP^$?L'&F`_SFF<GWIGB.D>
AKZ&-Dg-//F)rHr:IITB;cHXd6<-uR6q0aA71BS5$;No?+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]
F*)>@ARlolF!,F<@;0U%FCf]=+DkOsEc2Bo6<-TN6qBmJ<)6Cp4Y@j*0fq'31+@Q23Zp7%B4Z0-
-V@0&<)6:`;aOJU9LMEC;cHOj=XOXc6<-TN6qBmJ<)6Cp4Y@jD<CokP84c`Z:Jt=H-o*#@7O]m1
BOtU_%14p7E-67F-V@0&<)6:`;aOJU9LMEC;cHOj=XQ9d2*4-)8PDNC8Q/Sa;HXG9%17/nDfp/@
F`\`RC2[X)Df9H5+Cf>,D.RU,ARlomF_PZ&+Cf>,E,9*-AL@oo%15is/g,1GF*)>@AKYo1ASrW$
Bk)7!Df0!(Bk;>p$?'GtDf9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6$.-UF(dQo3F<4&@WcC$A86$nFDl)6F(9-*E,oN2F(Jl;0ht%f.UmO7Ch.:!A9;a.
Cia*)D/aN,F)to'+EK+d+C]J-Ch.T0@rH4'Eb0<5ARlp,ATDj+Df-\9Afu2/AKXT@6m-SiDesJ;
@r,RpF!,O6EbTK7/e&._67r]S:-pQU6Yp[YARloqEc5e;-t7=5Ch.:!A9;a.Ci_$JD.-ppD[d%K
67r]S:-pQU@q]:gB4YU7%15is/g)l'An>F*3$9dq@rH(!F(KB6+=Cl<De(4<@:Wn[A0>;mFCfJ8
D/XT3DJ((a:IH=>DKKH1Amo1\+EVNEBkhQs%13OOEb065Bl[c--[oK7A8c@,>[_Y_>^C+'>^C!r
Ch7Z?Bkh]:%16T`@s)g4ASuT4-XpM*AL@oo%16T`@r,RpF!)SQ5s[eYEaa$&3B9)I+BosuDe3rt
F(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'
DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[Wn
ATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+
Df-\>Ea`HnBl7Q+DJsZ8Et&I(5s[eYEaa$&3B9)I+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%15is
/g,4HF<GaDA.8knC2[X+ATDj+Df-\4De*="Bl%<iDKI6h3\l%78l%iU9gfEtC2[WlF_PZ&A79Rk
4ZX]oCi"36Bl+u7F*(i-E$m"B$7BS,A9;a.Ciac2EcYr5DBN\4A9;a.Cia'.Bl%<iDKI6h3\l%7
8l%iS:JXY_<_Ysk$>OKiFDl)6F(09+Ch.$nF?MZ-5!!FsA9;a.Cia'.Bl%<iDKH<p%15is/g+kG
@rc-tASuT4@WcC$A0>B#F`);4EX`@J:IJ/X:J=\f9gh-*+=LuCA9;a.Cia'.Bl%<iDKIsTDe*="
Bl%<j@<?'0+=Jre1+@WD:IJ/X:J=\f9gfEt-UC$aFE1f2BK8(5-QmANF<Dr':IJ/X:J=\f9gg?<
$4R>;67sC%ATT&5F`_SFF<G10Ch7Ys$;+)^<)6:`;`u`U+<VdSC2[X)Df9H5/no'A-OgDX67sBQ
:IJ/X:J=\R5ta?n+=CoBA9;a.Cia&oCG'=9F!hD(8l%iS:JXY_<(0_b7S-9B4ZX^#E+*j%F(K;5
C2dU'BHS[O@:WneDKB&qASu("@;K1`De**fDe*F(FE:\7/4r]+<)6:`;[j'C$;No?+A,Et+EMgL
FCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V
;Fs2T<(Tk\>"MOR/g)NVDe*3&/1;ku?RHt+BOPq&F^cJ.De+$&EcYr5DCI+a/p_5N-OgDT:IITB
;cHXd6<-uV:JP(b:d$ERC2dU'BQIa(+=JEd-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'
0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V;Fs2T<(Tk\>"MO"$4R>;67sBi@:O(qE$0(2+Co2-
FE2))F`_2*+D,>(AKYr.@:NkZ+DG^9E-67FA8,OqBl@ltEbT*++EM%5BlJ/:A8-'q@ruX0Gmt*Q
:IJ/X:J=\T8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ/gjRb;C="WCi<g)Ap@Zi8l%i^?V4*^
DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6rZrX9N)B-%172jART+43ZoeF67sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df$j2$?Trm@:VM^+<Yc>ART+#9L^Q]-Vcu\+BE&oF(oQ13Zoe$C2[X)Df9H5G%G]8Bl@l?-QjNu
F_PZ&+AR&r@V'R@+=A]g,!'IWA9;a.Cia'.Bl%<iDKI<Y-QjO"@<?'A+=A^TDe*="Bl%<j@<?'0
/5/MB$?L'&F`_SFF<G[=ART*Y$4R>;67sBnASu("@<?''FDl)6F!,O6EbTK7+CT.u+ELt7AISuA
67sX+@j#l3DesK)EbTK7-TsL51*CFMF!)iFDe*s.DesJB%13OOF)>i<FDuAE+=CZ;D/aN,F)u&5
B-:r-A9;a.Ci^^O/hSL\$4R>;67sBmATVEq+D>=pA7]d(@;]Tu@rH4'Eb0<5%16c3/g+\9GA(]4
ASQ9rEbTK7+=Js+0H`)!HTF211*C4@F<DrGDe*s.DesJB%13OO:-pQU@rH4'Eb0<5+Du+8A7]^k
DId<rF<G4:Dfp"AGAhM4Et&I(EZfEN4Y@jeDf'H.+=LlCE$-NCDe*s.DesJB.3L2p+D54rE-!-L
C2[X)Df9H5-OgCl$;No?+D,2,@qZunDIal"Df'H6ATMo8E,Tf>E,ol,ATMp2EX`@p4Y@jfATqg%
FCf3.@rc:&F<Dtd4"qd4.=4*:+>b3RATT%B:et"h?YXLiFDl)6F!hD(%172qDesK)EbTK74Y@jj
/9<@]%13OOF)>i<FDuAE+=D)MFDuAE+D,>(AKYf-@psInDf0VW-OgD2F$2,uFDj]G;cFl]BOtU_
/9GfKCia*,BlJ/C+Eqj?FCcS9BQ&*6@<6K48l%iS:JXY_<(0_b7S-9B%17/nDfp/@F`\aI+Eqj?
FCcS9BQ&*6@<6K48l%iS:JXY_6qL<V;Fs2T<(02E8PDP^$4R>;67sC'E+EC!AKYK$D/aN,F)to'
+A,Et+Co2-FE2))F`_>9DBLMREb065Bl[d++F7X6Ch7Ys$;No?+CT.u+E2+BBlGgb/nK9=+E)-?
@rH4$@;]TuF(f-$C`m\*FD)*jF!,dLAT2Ho@q?d(BQ&*6@<6K4-mrbJA7^"-F"\ml8l%iS:JXY_
.6C-t6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF`:l"FCcS(F_PZ&+D>J1FDl2F+>"^WFDl22A0><%
+E2.*Bl5&8AU&;>D.-ppD[d%?<CokP84c`Z:Jt=Y/g)Ps4"qd4.=4*:+>b3RATT%B8l%iS:JXY_
6<-TN6qBmJ<)6Cp-OgDL<CokP84c`Z:Jt=Y/g*J\8PDNC8Q/Sa;HYP!1*]I^.4fRSART*Y$8`lE
F`\`R8l%iS:JXY_6<-TN6qBmJ<)6Cp-Ta(@4$lq=9LMEC;cHOj=Ub]I$;No?@X3',+EM7CAKYo'
+D58'ATD4$ARlp&Cgh$qFCf]=+EM%5BlJ/'$?L'&F`_SFF<DtU3[8\p/12Q]@rc:&F<G%<FCfM@
%17/nDfp/@F`\`R8l%iS:JXY_+Cf>,E,oN2F(Jl)@WcC$A0>B#D/a<&FCcg/$4R>;67sC$ATMs3
Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIV-UC$aFE1f2BK8(5-OgDrBleB7Ed;D<A25lPASu("@;IT3De'tB+Cf(nDJ*N'BPDO0
DfU+4$4R>*4WlF23A*-24Zso_Dg!6Y2(Tk*0JP9k$6Uf@F`:l"FCcS0De*R"A7^!<BQS*-+EVNE
Eb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+=\LGBm=3"+CQB@D..3k.3N)B
B-8cKD..3k+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!
A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+=\LV
E+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SYe$9^Np0J5@<1E\hD+A-co+>GT%
+>PW*0b"I4.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6
Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)
Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?
6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+DPh*/oY?5+EqO9C`m1u+ED%:Bldir
+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO4ZsoA/ibO>+?_k19jr;i1-$m.1,(F;
%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5
D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6IUQbtDf0VLB4YslEa`c;
C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od
@V$[*Bji-+BOr<0ATD6&-u*[2BOu"!.4bo8+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7
+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVs
Cht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohc
De<TtBl7K):ddbqA8bt#D.RU,+=LuCA1hh3Agn/r%144#+D>k=E&oX*GB\6`@W-KDDImoCF(f!&
ARmH,@;9Cs2)&ZQ0F\?u$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7
F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.q
Dfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#
+CTG%Bl%3eCh4`-DBNeA+C]/*B-:VpFCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+%144#+DG^9
FD,5.GA1l(/e&.1%144#+D>k=E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH2n$4R=b.NihHBlbD?
ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#
%156]+>>E./hnJ34WmI-Gp#$s+>PW*0b"I4.NiSBDJsP<AncK4De:,'A8--.G%G]'+=LfC.3N_N
+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$9^Np0J5@<0H`MA+@]pO+>Gi,
+>PW*0b"I4.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;
EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+=\LSAT2Ho@qB0n8l%i&F!)lW
.3NGF@ps1b+DG_8ATDBk@q?d,Bln#2@;[29BkhQs.3N>BFCfK)@:Nk$%144#+A,Et+Du+A+Co%q
Bl7L'+E).6Gp%3BEb/f)GAhM4F#kElC2[X$DCI+Z-u*[2De<T1+CT.u+:SZ#+<W(IDe*p7F*(u1
E+*j%.3N>B+EV:.+=MOb+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%
A7]@eDIm?$Bl5%ABkhQs.3NhJBk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DO
ARTUhBHV8&FD)*j+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi9MC2dU'BQIa(
.3N,=DK]T/FD5Z2F"Rn/+=\LKDe(J>A7cs)ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:
@:O(]B4W\<+DPh*/oY?5%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!
+DG_7FCB!%+E1b!CLLje/g+nIA1hh3Ado(i+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=-u*[2
BOu"!.4u`GDfm14@;[2uDg-)8Ddd0!C2[W8E+EPi$6UH6@;]TuE,8rmAKY]/+DG^9IUQbtDf0VL
B4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kSsHD]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2
$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%144-
+B;B13$<'H@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCg
DfQt#<(8hr/e&.1.Nh&\<(.pH@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G
$6Tcb4ZsoA/iYI;+?_k1:LeJh1GLF'1,(CA%144-+CSekARlp$ATo83De*fqEc#kMBkh]3E+*cq
D.Rg#EZdYH6V0j/2'@!S@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou
3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#
FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;
G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144-+DPh*F)Q2A@q?d*F(KD8@<5pmBfIsmAoD]4
8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.
A8c[0Ci<`mF"Rn/+=\LNBl7j0+D,>4ATJu.DBN\4A1hh3Ado(V$9^Np0J5::1E\hD+AZKh+?(ho
1,(CA%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP
+CT.u+EV19F<DrPATW'6?YXLiE,ol3ARfg0%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN\4A1hh3
Ado(V$9^Np0J5::1*A_C+B)ij+>Pf*+>PW)3"63;.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,&
Dds4`+=\LVE+EC!ARlouDe(J>A7cs+D]iS%F(96)@V$ZlBOPdkATJ:f%156]+>>E,/hnJ34Wm[7
E$-nm/0H]%0K9LK+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9
FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$
DBN\4A1hh3AfrZJEb/d(@qB^(F(or3+E(j7C2[W8E+EPi$4R>*4WlF22_Hd,4ZsodAT/bI1b9b)
0JGHq$6Uf@Eb/ioEb0,uATJu&A7T7^+EVNEC2[W8E+EQ'%144-+Dtb7+DPh*+D>2(A7KOsGp%<T
G:m]SCiq@?Df$V.A8-."Df-!k+:SZ@4WlF22D-[+4ZsoRF_;gO3%Q1-0JGHq$6Uf@D/!m+EZf+8
A0>r'EbTK7+D#(tFE7lu+=\LKDe(J>A7cruDId='+DG\3Ec6,4A0;<g+:SZ@4WlF22(gU+4Zso[
F_i0U0e=G&0JGHq$6Uf@C2[X*F(KB%Df00$B.dn5F!+n%A7]9\$6Uf@B4PRmF!,@=G9CF7@s)X"
DKKH#+DG^9C2[W8E+EPi$6Tcb4ZsoA/i>78+?_k18p+qm0fU^,1,(CA%144-+DPh*/oY?5+CoD#
F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb4ZsoA/i517+?_k18p+qm0eb.$1,(CA%144-+DG_7F`M%9
@<<W.ARTY%+E)./+D5_5F`8I;DBN\4A7T7pCi<`m+D,P4+DbIq%144-+Dkh1DfQt:@:C?jA8-.,
+>"^VAS,Lo+EVNEF*(i2FEMOTBkh]3Bl8!6ART*lDe:,5@rc:&FE9'KC3'gk+:SZ@4WlF21G1X0
4Zso^@<itO0e=G&0JGHq$6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO4ZsoA
/i,+=+?_k19jr;i1GLF'1,(CA%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"
+EDUB%13OO4ZsoA/i,+<+?_k19jr;i1-$m.1,(CA%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>
,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df-\:EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE
@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%
F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+:SZ#%16igA2Z+sEb/ltF*(u61,2Nj/h1USA2Z+s
Eb/ltF*(u6+EK+d+ED$FEb/ltF*(u6+A,Et+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+B3#gF!)TH
@rc:&F<D]HAM%q6B5)F/ATDi7+A,Et+<Y3/@ruF'DIIR"ATKIH+A$Z&F!)T6+<Y<8De':a:-pQU
E,oAsFD55r+EVNED..-rFCAm$+CQC0@<6O%EZfF5EbTK7+EV:*F<GI>FCfM9FD,5.Ci<flFD5Z2
Et&IO67sBhDIal-@;TRs+E(j7@;Ka&@:OCnG%Ddg:IH=9Bk)7!Df0!(Bk;?<%15is/e&._67sB9
0JGIpE,mWj+>"^W@<Q3m+DG^9-u*[2A7]p5%15is/g)o'0K<oXGqq)s/KeeHA0>u7AS!!)ATD^-
FCetl$;No?+>PW*0Q(fP0Jjn(+EM+9+D,P4+Dl=6@q,rT:-pQU1,(F;D..]D3?TmrF)Yr0F<G:8
FDi::2D?m>C,[h$+EM%5BlJ08%15is/g)o'0emNRGqqB&/KenKA8,XiARlp*D]j(CDBNk8+EqO;
05P??Fa+?&%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YI".ATD3q05>E9-OgDmDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0?$Bl7u7F*)G:DJ()$AS,k$AKYT!EcZ=FDe!:"EcP`/
@q?d$AfrLH.1HVnAS,k$ATMs64ZZjkHS0ai0d\;_/q,67-sIf_/g+FK%13OO:-pQUEb0?8Ec,q@
Eb0<7Cige<Afto(DKU1WF`(o<+Cf>,D..<mF!+n4+EV1>F<GXHEbTE(%16ceF*'Q+><3l^+Z_;"
-R^>d?Q^mB>p([@-Qmea+EVXHALSuN?O[>O$;No?+EM+9+Co1rFD5Z2@<-'nF!,RC+AtWo6s!8X
<(.oP/KenQF*&O6AKYQ/E,95uF<G+*Anc.)Bl@lA%15is/g*nb<(/hjA8,OqBl@ltEbT*++EMXC
Eb-A8BOr;sEbT].+DbV2FCfJ8FD,62%15is/g,@LEb-A0@<6N5Eb/ltF*(u6ARlp%DBNA*A0>u-
BlbD2F!,@=F<G(,@;]^hA.8l@67sC)BOu'(@3AH:5t"LD9N`KKBk)7!Df0!(Gp$gB+ED$FEb/lt
F*(u6ARmD9<,Wn"ATMF)%15is/g,4WDfTE"+CoM,G%De4ATW$*EcW@?@;BEs@;Ka&A8,OqBl@lt
EbT*++AtWo6s!8X<(.6':-pQU@V'.iEb-A6AM%q6B5)F/ATDL&B.aW#Ec5JO/g)qm3Zoe++E(d5
Gp$<6A8lU$F<DqY;FNl>=&MUh740H*>9Iip+F,=D$?C&q-9`Q#/g,(C+=ANZ>9G^EDe't<-OgCl
$;No?+E_RBAS5^uFCfJ%$8WfFAS5O#4s58++E(d5-RU$@+>Y-YA0<6I%13OO:-pQUA8,OqBl@lt
Ed8dH@<?1(+>"^IA8--.FDi:=@<?!m+CfP7Eb0-1+Dbt+@<?4%DK?6oC2[X'Df9_\3Zp4$3Zp*c
$?C''F?M6!-SK4QA1o;]-mpYq+C\noDfTE1FE/Ka+Z_>7+=ANc/13(u%16f]/g*_T=%Q.0A8a(C
Ec5l<4Y@j)@lbtgEc5l<+:SZhCia/?+:SZ#+EDC=F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK
-RgTeDf9_?%16ZaA1e;u.1HVP:d$ERC2[X'Df9_?0F\?u$;No?+ED%+BleB-EZek7EcP`/F<GdG
EbfB,B-:`!@ruF'DIIR"ATJ:f:-pQUEb/lo+=CoBA7T7p-QjNS+<Vdg-q$l_-YdR1A7]p3.6AnL
:IH=9AThX$DfBQ)DKI68$;No?+ED%+A0<77De(4<+<VdL+<VdL4"*Kn/151NA1&ff-V@0&+EMID
EarZ.%17,eB4N,4F`_>6F!i(Q+<VdL+?Lu>:b3u:FD5Q4-Rh,)B4YslEa`c,F`_>6Bln'#F!hD(
Eb/lo+=CZ;DKBr:F=/1R+<Vdg-q$l_-Y$V!-Rh,)@q'+)E+*d.Df.4?Ea`j$Ch[c0GAhM;+E)./
/T565F!hD(Eb/lo+=CZ;DKBr:FC\s+-QjNn-q$l_-Y@C-DJO'&DId=%-Rh,)@q'+)E+*d.Df.4?
Ea`j$Ch[c0GAhM;+E).//T565F!hD(Eb/lo+=D,E@<j4C+<VdL+<Vdg-q$l_-ZEm1Gpb%&-YacG
Dg<I7Dg3W=$?B]jA0<7@D09J=+<VdL+<VdL4"*Kn/15%GBk(q!F`\u[4"#)dF_>Q6B.mk5Bk(q!
+CT5'+EMIDEarZ.%15is/g,1GB4N,4Ao)0kCN=Q>A7]p3+?Lu>:b3u+Ch[BpEclJ7ATfFM4"!L6
Bk(q!+Co&,ASc:(D.RU,-OgE'AS5Nr-Y[F+B4WG5+<VdL+<W`o6r5E^Bl.9kALAog-Zj$ED.7R*
F`T3TF)<%6DKKH1Amo1\+DG\$B4W3)Ec5H!F)u&5B.",q:-pQUEb/lo+=Cl?@:s.^ATfFD+<Vdg
-q$l_-Y[F+B4YUbFse_#-Zj$ED.7R*CisePE-#k=A7]pqCi=90ASuT;%15is/g,1GB4N,4@Wc3o
ATT:B+<VdL+?Lu>:b3u'F_#,rF=/M!-[0-5CM\8=@Wc3oATT&*@<>p*%15is/g,1GB4N,4B5ho>
+<VdL+<VdL+?Lu>:b3u,E-!BU4""Z[F!,UIBl%L*Bk;?5%17,eB4N,4F)?&4A7]p3+<VdL+?Lu>
:b3u8D09K%ATfFM4"#)dF_>Q6B.n4FD'3n<F`Lu'-OgDX67sC$AS5Nr-Z+'=@q-l/+<VdL+<W`o
6r5E^D0KQ$@j`]e-Z*R.G@bi;+D#D/Ci=T1EcW@5@<6R"CijqF@rH4'@;^?5Eb0&qFCeu1%13OO
:-pQUF(KG9;FNl>:JOSd+D,P4+EM+1ARfgnA0>Ds@ruF'DIIR"ATJ:f1E^UH+=ANZ>9J!(Dfp/@
F`\a:E-#T4+=C&U5t"LD9N`_c>9Iip+=D;RBl%i<%14m6De't<-QlV9F)>i<FDuAE+CoG4ATT%B
;FNl>:JOSd-QlV9De't<@rH7+F_l.I%14m6De't<-QlV9F)>i<FDuAE+CoG4ATT%B;FNl>:JOSd
-QlV9De't<F)?&4-OgD=+E(d5-RU$@+EMC<F`_SFF<G+5F(KG9-W3B!6r-QO=XP=r+E(d5-Y[F+
B4WG"$4R>;67sC%BQ&);Eb/ltF*(u6ARlooBk)7!Df0!(Bk;>p$?L'&F`_SFF<EC_De't<-OgDt
De(d\0lgi<BleB-E\]@E67sa&De(d\0lgi<BleB-EZfET/Kf(F/TPE8BleB-EZdtM6m-#S@ruF'
DIIR"ATKI2:-pQ?:-pQU<+oue+<Y`8EbTK7+<Y]9/TPE8BleB-EcW?G8l%ht+Co1rFD5Z2@<-'n
F"SRX8TZ>$+<Y)8+D5V2A-u'u/g,+R@:OCn@q?d)D]in*Bl8$$Bl5&%+DkP.FCfJ8F(96)E-*4E
BOQ!*DJsW.F!,R<AKYf-@psInDf0V':-pQU@;]TuDIIBnF!,C5+CT)&+CSc%Bm+&18l%htA8,Oq
Bl@ltEbT*+/db??/db??/g+YEART[lA3(hg0JGIpE,mWj$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU1,(CAD..]F0d&%j
C2[W*FE1r(+ED%6Df9`/A-u'u/g)o'0edK`Ftb`q/Kf+GF<G16EZf4CARf3W:-pQU1,(F;D..]D
3?TmrF)Yr0F<G:8FDi::2D?m>C,[h$+EM%5BlJ08$;No?+>PW*0l:?E0f^@.+Cf(nDJ*Nk+EVNE
Ecl7BDf-\,DffY8GA1qJCh[d0GR@24/g)o'0emNRGqq9#/KeP:@;]^hA0>u4+EDUB+D,Y4D'3S9
DJLA2De!3lAI8cSDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YI".ATD3q05>E9-OO@%@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/D
DeX*1ATDl8-Y[=6A1%]k:-pQUEb0?$Bl7u7F*)G:DJ()$AS,k$AKYT!EcZ=FDe!:"EcP`/@q?d$
AfrLH.10NqAoD^$F*)Fc3aEkT/q+ot-7ER\IORN1>9H?e+C-E'$;No?+ED%8F`MA@+ED%7F_l.B
De:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'LFE2)5B*r<jF*'Q+><3l^+Z_;"-R^>d?Q^mB
>p([@-Qmea+EVXHALSuN?O@-867sC%ATT&*Bk)7!Df0!(Bk;?.FDi:"76s=C;FshV+<W6YD09oA
+C\n)AU&01Bk)6-A7]@eDKKT2DCu8k67sBU:K0bD+Co1rFD5Z2@<-'nF!,OGDfTD3FD,5.A9)C-
AKYf#FED)7+EV:.Gm[;5/g,@LEb-A0@<6N5Eb/ltF*(u6ARlp%DBNA*A0>u-BlbD2F!,@=F<G(,
@;]^hA-u'u/g,@OASrW!+AtWo6r-QO=Wh6h@ruF'DIIR2+DGm>Eb-hCAS5^uFCfK(A1f!(D]j(3
F(KG#:-pQUF*)>@ARlooEbT].+DbV2FCfK6+DkP&AKYDtC`m8&@ruF'DIIR"ATJtl76s=C;FshV
$;No?+C\noDfTD3Eb-hCAS5^uFCfK,DJ(R/Ec5JO/g)qm3Zoe++E(d5Gp$<6A8lU$F<DqY;FNl>
=&MUh740H*>9Iip+F,=AEc5J84s58++E(d5-RU$@+>Y-YA0<6I$49Np/g,:SEb/ltF*(u6$8WfF
AS5O#4s58++E(d5-RU$@+>Y-YA0<6I$49Np/g+\=@ruF'DIIR2+E1b2BQG:J+D#(tF<G[D+DkP/
@qZupF`MM6DKI";De!3tBl@m1$;No?+AP^3762Q5BPDN1G%G]'+CfG'@<?(%+A*c"ATDj+Df-\=
E+NNnAnb`t@WGmp@q]Fp+=LuJATB4,:-pQUH#IgJD..]4G@>B2+EVNEF(KG9-u*p:E[`,QD]iI2
@rH7+FCB'/+Eh10F_*04C2[X'Df9_\3Zp4$3Zp*`C3F0/4Y@j)0..lOAS,k$ATMs6+?:T+0f1"#
-OOm4Dfe,p+=AgWDe(LK/8B?>E\&Rk-OOR"/g*_T=%Q.0A8a(CEc5l<4Y@j)@lbtgEc5l<$>"$p
AM+<4+EDC=F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK-RgTeDf9_)ASu$2$7Q<M:d$ERC2[X'
Df9_?0FA.^67sC$AS5^uFCfJ8@s)g4ASuT4GAhM;Bl7Q+A8,OqBl@ltEbT*+$?B]jA0<77De*Bi
FseCT+<VdL4"*Kn/151NA7T7p-Rh,)8l%htA7]pqCi=90ASuT;$?B]jA0<77De(4<+<VdL+<VdL
4"*Kn/151NA1&ff-V@0&+EMIDEarZ.$?B]jA0<7BFD5Q4-QjNS+<VdL4"*Kn/15R^Bl%i<.6Ani
ASu("@;I'/FD5Q*FD5<--ONU8/g,1GB4N,4@rH7+F_l.I+<VdL+?Lu>:b3u(@V@,<4""NIBJ4=5
EcZ/:04o65DJO'&DBO.AEbce9DIkD<AnH*3$;No?+ED%+A0<70Df0W=Cij3!FseCT4"*Kn/15%M
@;]jsBl7HmFse_#-Y$V!05t??F)PqLAo_<tCM[^&+EqaECERP5AM%h4Aof=,Eb/lo+=D,E@<j4C
+<VdL+<Vdg-q$l_-ZEm1Gpb%&-YacGDg<I7Dg3W:Eb/lo+=D5IF_<'E+<VdL+<Vdg-q$l_-Za-I
B.#,i-Za-IB5Md(04o$7@r$*-@;op'F)Q2A@q@"p:-pQUEb/lo+=Cc;Bk(q!F`_/*FseCo-q$l_
-Y@1/@r$+-FC\s+-Rh,)7VldKCN:P.AThX$DfBQ)DKI65Eb/lo+=Cl?@:s.!+<VdL+<Vdg-q$l_
-Y[F+B4WG>4"#,`F_tT/E-64TE-#k=Bl8$(Eb8`iAKY](@:s-oE,ol,ATMp,DJ(=(:-pQUEb/lo
+=Cl?@:s.^ATfFD+<Vdg-q$l_-Y[F+B4YUbFse_#-Zj$ED.7R*CisePE-#k=A7]pqCi=90ASuT;
$;No?+ED%+A0<7/F_#,rF=/1R+<VdL4"*Kn/14nLA7oIq-Rh,)G@b?$Cj@.4F_#,rF<G+&FC?O(
Eb/lo+=Cf@F!i(Q+<VdL+<Vdg-q$l_-YIC>-Rh,)B5ho7F`_>6Bln'#F!h<8AS5Nr-Za-IB4PRs
-QjNS+<W`o6r5E^F)?&4A7]p3.6AnuD09K.F_<@HF)<%@Dfp)1AL@h*AS5Nr-Z+'=@q-l/+<VdL
+<W`o6r5E^D0KQ$@j`]e-Z*R.G@bi;+D#D/Ci=T1EcW@5@<6R"CijqF@rH4'@;^?5Eb0&qFCeu1
$49Np/g,4HF<FIM5t"LD9N`KMDfQtAASbpfFCeu*A8,OqBl@ltEbT*+$8WfCA0<6I+Bot!E-#T4
+=C&U5t"LD9N`_c>9Iip+=D;RBl%i<$8WfCA0<6I+Bot!E-#T4+=C&U5t"LD9N`_c>9Iip+=CoB
A1%^?+E(d5-RU$@+CoG4ATT%B;FNl>:JOSd-QlV9De't<F)?&4-OMXPDe't<-QlV9A8lU$F<Dr/
76s=;:/"e<+Bot,A0<76D..'g-OL2U67sC%BQ&);Eb/ltF*(u6ARlooBk)7!Df0!(Bk;>mF)>i<
FDuAE+>b3ZA0<6I$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FR
C2[WnDff>S:K0),A8,[s@;om&8l%htHOU<)+<VdL+<V+#0/"G_De'u3H#n(=D'3>)@<6K4Eb0&q
FD5Z2F(f9,+CT;2Dg-73$>scmAKY2"F*)\DANaX>Ci!Zn/0K.JBkM+$4Y\K1E+O'(E+ig'Bk;?K
1+XP[Bl%TqDes?44a1RRFCe`>%13OO0/"GXDfTD3C2[Vl$?L?!B6%F"BHUf$F`VY9EaN<3+F=P)
+<VeJFEq\64_ADECh7-=%144#+Cf>+DfS!WBkM+$B6%R/3t2N>+<YE;A0>W*A92j2Eb-A.De*]n
CLnW'De+!4Bl"o,De*Bs@LWYe+<YK/@V'?u4Wkq9DfTD38l%ht@r,RpF(KD:3t2N>+<Y97DKKr6
H=]5p1cl-R+<VeC@:EeaC3=T>4`WUn$@N?j%17D(/Nt:kC2[W*>@_Gg4^qi0CFgTLFEq\64_/JQ
FCeug3t2O2C2[W*/Nt:lDe'tpA8-'I@UWb^/0K"UH#.%TA8cR3ARo(.%16igA0<Hf+DPh*F*)>@
AKY2fBlZ@G@:O(Y3t2O3De'tB4s4TYA8PajAKY2fBlZ@G@:O(Y3t2O3De'tB4s4TYA9E!.C`lqm
BlZ@G@:O(Y3t2O3De*p2DfTD3/Nt:lDe*Bs@N\lcBlZ@G@:O(Y+?L#>C2[X*FD5P6/Nt:lDe*s.
DesJ;>@_Gg4^qi0CL&&E%16igA9;a.Ci^_'Anc't@rH1%E]nV[Blmol3t2O2C2[W*>@qScCh%C"
DfS!WBkM+$@Vg0u>rrK&H6?F(Bl%TqDes?44`"hFBQR^"F_+i?%13OOH6?E7F(f!$ANaR<@;Tq#
A1Sj>@:Eea4X,2WDJF*#Df-\4De*cuAg1MB%16faDe'tp+EM4)E+M1CBjkjsDIb:@CggdaCcrtV
C2[WfDJ=!1ATDBk@q?d!De!3lAKkDA%16igA0>)m@:Eea4X+<LDe**jD..-r+Cf4rF)rO23t2O3
De*p2DfTD3>AR_WASaLR@;9^kF*)>@AR'+oFDl2.B4W2qCghC+,$d8>$>OKiFDl)6F!+\'@:Eea
4X+<LDe*s.DesK"DIn'7ASuR'Df-\>Df9H5,$d8>$>OKiA8bp">AR_WASaLR@;9^kA8bp^DIdI%
ARfh#Ed8dG@VTIaFE8X33t2O3De*]nCLnVmCggdaCcrtNC2[X"@;BFZDKB<.BlJ/:@;]TuA9Da.
>]+1cDImisFD5Z2,$d8>$>OKiF`_>6+BrYj@V'@=,%55)A9E!.Cg:jhA8--.DdmHm@rucsDIIEn
+E)@8ATAo9FD5Q*FD5<-,$d8>$@N?jC2[WsDId='?V"-j9JSIfBQS*-4q.iA+?X=K@:VP2$6UH6
+?Xa[FDPMP8oJ6ADfTA[DId='/oP9B4>1ejFDPMP%144#+<WdfFEq\6+EVmJAN_5ZAU&;M@rl]8
4q.iA+<VeFCjU#-EbB*(3\WX7@:Wn_DJ)!aI;jOM@<-!pDE9J"/n6UiHZit@FD55nCb9(3BkM<E
FDl+[GA1T0BK@k.1G1P(F?<rMEb&a%/TZ#ZCh5YKDes,u4(;W.CM.[+F`(_A@rH1%E]PFWAnGXe
AijI?Eb&a%/Rr^8DfRl`0JG170JGRtDfTB"E\2KLA9;KG0eP/!F?=GMA7TClB0%e#1,X#m%144#
+<WEl1,X#m+>PQ)2/mXH$6UH6+>PQ)2/mYc/n6ngG%G]9Bk(Rf/R`I0B5TbPDf@d^Bk2=!3\iHJ
/i,LJ3B9)[3B9)[3B9'<F?<rMEb&a%/TZ#ZCh5YKDes,u4(;W.CM.[+F`(_A@rH1%E]PFWAnGXe
AijI?Eb&a%/Rr^8DfRl`0JG170JGRtDfTB"E\2KLA9;KG0eP/!F?=GMA7TClB0%e#1,X#m%144#
+<WEl1,X#m+>PQ)2/mXH$6UH6+>PQ)2/mYc/n6edG%G]9Bk(Rf/R`I0B5TbPDf@d^Bk2=!3]/iK
0eb:80JG170JG170J[Th4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?43[86KAnGXe
4(<,KA7]d5@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3\i<C2/mXH$6UH6
+>PQ)2/mX[1+k=>E-)Nr+<VdL1+k=>E--L\@koccG%G]9Bk(Rf/R`I0B5TbIBk1ajANP*MA9;KG
2)I!>0Q;+q@W-9tATBADFEq\63cf4UBk0;7@:O(cEc6)<A1_;0Ci=>T,@b4qAnGX:@W-9tATBA4
Des?43[6=40JG174(<,KA7]d5GA1T0BK@k#0Q;+qE+*9fBl7QE2(gS%F:AR"+<Vda/hh6d+>kc*
E-)Nr+<VdL2(gS%FF>cO0me(TEcc#*@;IN(Ch[O"3co:Z4*PCLFD*]n1+k8"F?<rMEb&a%/TZ#Z
Ch5YKDes,u4(;W.CM.[+F`(_A@rH1%E]PFWAnGXeAijI?Eb&a%/Rr^8DfRl`0JG170JGRtDfTB"
E\2KLA9;KG0eP/!F?=GMA7TClB0%e#1,X#m%144#+<WEl1,X#m+>PQ)2/mXH$6UH6+>PQ)2/mYc
/n6Y`E+*9fBl7Q8FDl+Z1bLY)F?=>JEbB*(/TPQ<BQQ9l/i@Ti4(N&GARfgrDf.UPFE0H[@<-!p
DCo[9Aop'j/i@Ti4)eV=A8,po/RiX?FDl"W1bLY)FF>cO0fOGu@:Wn_DJ(PCDf@`o/i@Ti4)JDH
B5)68EbT0"F?2622/mY!FCf]=/ST*5ASuTN/Mo(;E-+0\@:Wn_DJ(P1Dfg)>D)sL+2/mYc/n6Xj
HZ3D(A8,po/TboM3\`TH0Q;+qFCf]=/R`I0B5Tb?ASuU$E]\5KA7TClB.[S2FEDG<3]&HCE--L\
@kf]bCh[cu/SJ^0B4uBJ0eP1<4(r2>B4uBJ0f!]i4(N&GARfgrDf.UPFE2d^@kfcdGA1T0BKA"-
0J5%uF?<r?@r#^tDfor./Rr^8DfRl`AnGXeAnF,D@:Wn_DJ)!d2D-\&F:AR"+<Vd_2D-\&F<E@t
/hh6d+>Yo.0Q;,^/n6\aAoDR//TYWPANDP$E-+0RDf0YKAmoOjCjA'/Dfp)7ATA4e+<VdL:1\Wt
/n6UkHY?u)B4uBJ0f!]i4(N&GARfgrDf.UPFE2d^@l/OBDes?43[6=40JGLI4*5%YF=h$7@rHBr
FD5Z23d#=NATDU$DIn5K@l8UCDes?43b`JFATDL,4*5%YF=h$7@rHBrFD5Z23b`JFATDL,I4f"a
3.#UQA7TClB.\4DE&o^//hh6d4)eV=A8,po/RiX?FDl"W0et@8E--L\@lJaHDf0YKF(or33\`U5
F?=)QDKIISASGdjF?3lLCh.rH@lSgKASGdjF?2*pFF>cO0f=;eDfTB"E\1d>Ci!O!F(ICBDes5u
E-#T=/n6UoHXgu1DfRl`AnE_N0JIo-@kfujAoDR//S8F.Bl&&U6Z7*fBk;;o$6UH6+AQKlI4f"`
HY.26F=h*5D/!g33`]g4A79@aI4f"a1j`bIEb/a&Bl@lMCij]G@W,e&HXgu1DfRl`0JG170JGS#
Df0YKF(or33\`C/F?=)QDKIIB@;T^pGreo=D.Rbt$6UH6+AQKl%144#+<XR#D..=1BJFjQ@:Wn_
DJ(PCDf@`l1+k8"F?=;QDIkD5ASGdjF?2-/0KXAfG]YNGCh[O"3c&A>F?<uNCi=>T,;:f*0JG1B
AoDR//TYWPANDP(E-+0RDf0YKAmoOjCjA'-EbSru4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2
FEDG<3\rBBE--MA14*tKA7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<E
Ch74#4(E2FDfRl`0JG170JGS#Df0YKF*)\DANFOI@;KXf4(`DKF=hQJH=],l1iROuAoDR//S8F.
Bl&&U6#p[JCcc6IDKIISASGdjF?3lLCh,VH@:Wn_DJ(P1Dfg)>D)sI*0Q;,^BJY!S@:Wn_DJ(PC
Df@`l1+k8"F?=;QDIkD5ASGdjF?2-/0KXAfG]YNGCh[O"3c&A>F?<uNCi=>T,;:f*0JG1BAoDR/
/TYWPANDP%E-+0RDf0YKAmoOjCjA'-EbSru4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2FEDG<
3\rBBE--MA1ja1MA7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#
4(E2FDfRl`0JG170JGS#Df0YKF(or33\`I1F?=)QDKIIB@;T^pGreo=D.Rbt$6UH6+AQKl%144#
+<XR#D..<DAoDR//U(c?B4uBJ@W-'n4)eV=A8,po/RiX?FDl"W1G1A#FF@g[HZ3D(A8,po/TboM
3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=/R`I0B5TbHAS-$G@rH1%E]PF!0JG170KWlbDKIIO
FEq\63b`\ECh[B@AoDR//TYWPANDP%E-+0RDf0YKAmoOjCjA'@Bl.F&%144#+<XEjG7=m%+<Ve)
Df&p#4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2FEDG<3\rBBE--MA2LBCOA7TClB.\4DE&o^/
/hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2FDfRl`0JG170JGS#Df0YKF(or3
3\`@.F?=)QDKIIB@;T^pGreo=D.Rbt$6UH6+AQKl+B!,p@;\/=Df0YKG@bK$BQQ:EDerrGE+*9f
Bl7Q8@W-@1Df%Nk/hh6dI690(FEq\64q.iA+?V;jART+5%144#4CW5>Gp$U5@<6KQ,%E>`,!HGC
+<VdL4E)EQCghC+4X+Aj1a$9_3$LNq$6UH6+<VdhF)YQ*+Cf4rF)sJg@l,<<0Hr[i$6UH6+<VdL
+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"
DKIOB0/7ED0l(8S2c"Ws77UN<6=G%N=]@4U<d$cNCdgcmH?Edu3E.S1;HZ#%0J@!JBllRQCcu?I
?WC#K4q.iA+<VdL+<VeKDdtm_@6P,-+<VdL+<Wd"F)YQ*4q.iA+<Vdh05s)a$6UH6+?XaS@VfTu
@qBImE+*9fBl7QH+tt2`@qBImF)YPtBl7QH+tt2`@r,RpF$1^W0f:.=%144#+<VdL4EP%NA9g?J
$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W1,0t:%144#+<VdL
+<VdL+<Wdc+Cf4rF)sJg@kfe_@ko_^4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ap+Cd)J
@kfkc5&"bMA3;MdE+*WJ%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EPS@k])j-6k6'0KVjD
FCfK)@:Njk=)W+iF$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+?V<!E]sp>+<VdL+<Wd"FCK0!Gs2ZE+<VdL4>1eb@VfU>%144#+<Wdc+Cf4rF)sJg@kf__
4q.iA+<VdL+?X^a@;[2tCghC+4X+Ai+Cd>S5!1K>E+*WJ%144#+<Wd"E'=^<+<VdL4EP"@Ch4`!
ASc1%@:Wn_DJ)*V0HqWLASc1(E+*6jDJ)*V0HqWLCghC+4X+Aj2'P3n$6UH6+<VdhFCK0!Gs2ZE
+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL
+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL
+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2
F"V*DDeElt/n8g:04]!2F_t]-F>%/X0kE@^7:JqV;b'r5H<F!58n1Co8MbO9FuMg.BK9[388<!:
9Q=]*Eb/<T04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y*'A7oq%4>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr\hA7Ta(GAhM4F!,CA+EV19FE8RHD]i\5Dfp#?+E)90$6UH6+<VdL
+<VdL+<VeJF_Pr/F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL
+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%
+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0gTMb
88E3!C.Crs8lRQGEas<8A3k-0>';c'C,f1"0PY>uDf&WNBN\8&04e[.F?aGT4_8M<<Dt)*%144#
+<VdL+<VdL+<VdL+<Y04D/a5P04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL
4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL
+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%AMJE,oN2F!+'t
@rGmh4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es
4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA
+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-
A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j6r5IQ9R']PF#@<%BP_@!6odk]E+MF73B1VmAQNh&
FAkb%9iX]*=_).uARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Co&"4>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr\kASbq"AKYo#C1UmsF$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<
+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQ
CghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL
+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt
/n8g:04]!2F_t]-F>%/X0lTHGAnX&%A5dJ);HcP)@:s%d@5hP9>%UZM=Z/0.BPo^sH?OITEA^p&
04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y3+ChId-4>1,,%144#+<VdL+<VdL+<VdL
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au
@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Ai,!L$YD/XT/+EqaEA9/l3EZfI8F*)IGAo_g,+D5_5F`;CEDfQ9o+<VdL+<VdL+<VdL
+<Y`JBlmp-4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jGqCgB@;g<LFB:G4/O_C:BN.`0D+82a8k!T6
6XNSEEAU0>F>urQB1blOARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Co1s4>1,,%144#
+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL
+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL
+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\kBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z24>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j?Z0+Z2bJ<i;D`Ad1JE!dAOLQ_@<-F6G&Tod
E-##i@od;H2+qmk5uqVOARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Co2-E',d^4q.iA
+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL
+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\kBle60@<iu+Bk)7!Df0!(Gp%$7C1UmsF$)*sE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd
@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL
4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:
04]!2F_t]-F>%/X0lh,D1duFo:O#991IFW(FE^_tAlj+r=%d^QH;?G;Dbat^@q7;pGZIIM04e[.
F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y34Ccj@Z4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ
%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj
0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg
@k])jA8,OqBl@ltEd8dF@;TQuCh[s4F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@B
CghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2
F_t]-F>%/X0m[>5G&K)e1hJ[?9Mei3<,tT#6!7uD2G-qj:NT)r8TRLBCjBhbH879504e[.F?aGT
4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y35@luDQ4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC
+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\m
DfT]'F<GdGEb$;&Df'?&DKKq^06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ`77;8Y<_Rfp<`rceG>^A5
<`rm/EH688<Cp891fm=(0R@S/:J42F8nTegA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
A8lU$F?D3b4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jF(KG9@;]Tu@q]:gB4W3)@<,dnATVL(
F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(
CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL
+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0i2D#6T@Y.BM(m;<Co&.
CN"-'BN'.g@m`XdCMl^'Gt)UJ85N5aA6C`d04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL
+<Y6+4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP
4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KRKBlkJ.Bk)7!Df0!(Gp%$7C1UmsF$)*s
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL
+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL
4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL
+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*D
DeElt/n8g:04]!2F_t]-F>%/X0hGMbAiN.8AP,C-F*(?%A6=,"BfJjA92\Dl3I+@s<(92S0N;[c
<`a*I04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y6;4>1,,%144#+<VdL+<VdL+<VdL
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au
@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W0Hr]"F`\aJAU&;>Bl8$2+D#(tF<GdADId[04>1bp@;\7<$6UH6+<VdL+<VdL+?V;r
4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<Vdh
E$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL
+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@
B5D-3@rH3;A8bt#D.RU,04Z^j<bj9`;0$2D77gEs0N1Y%AOKrs6t^-i88pjo@<,1@G$%:UGsa;A
8N9EtARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+D58-4>1,,%144#+<VdL+<VdL+<VdL
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au
@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Ai,!KXNF<GL2C1UmsF$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(
CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL
+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0kXKa3D<+<<^T\b3G<"j
=@m=NH"fTf>%TL)6<-opA9(RKEG]l#=A!a604e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL
+<Y<.FE2Ug04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL
+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KXNF<G".C`mq?Eb'56Eb065Bl[cq
+EVN2$6UH6+<VdL+<VdL+<Ve<G\(B-FCdQfF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T
@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<
@s)X"DKIOB0/7N)?U89XCKbUrAn+1pB2V,l9/94<9iG"]G?SH0>!udg787K'EEHsn3%niRBllRQ
Ccu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve>Ci<d(4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai
,!KXUDdm-k+ED%*ATD@"@qB^D06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZH6=kF:@T,g)6:O:aEcu>:
<c1u<AhZhN=Yha*E^j#;H=q=q7s7UPEbd=>A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
B6%rR04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL
4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP
4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KLWART[l+CT.u+Dl%-BkDW5B6%p5E-",p
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,Rp
F$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdL
BQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/57>7:AhGE)T;0@q0[s>#]65
;`?^_F)Gbq82Fss3&=3"Fu*cDAQ<_AF"_*8BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve>
F?D3b4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\nATT&+A8--.GA1r*Dg*=GAU&;Z06;)@DE\L:
+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<Wdg
EZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4r
F)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL
+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/
Df%.<De!p,ASuTCA1oZ@C2I*W=DqPCEcl[^964!":2*HTEDpn'A2\:9A79"7@X(ggA4^o(CI'Ub
A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLBP_X*Ccj@Z4q.iA+<VdL+<VdL+<VdL+?V;u
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+
4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@k])jA8-+(CghT3F(fK4F<GL2C1Ums%144#+<VdL+<VdL+<VdLA7]glEbTK7Bl@m14>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<
AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jBJiIq@<#pU1i.2!1/`El=))8S
6=N\UC1^.U6$4bjBIunQ9f[8e:hE9PARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+DPh*
@:s.604@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W
1Eo"0,;D)14$50;E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Aj1a$9_2^1Ep$6UH6+<VdL
+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j@:s-oDe:,&Bk)7!Df0!(Gp%$7C1Ums4>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6
CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh
@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;
A8bt#D.RU,04Z^jE&hHSDg?2'/TEdR7;HmA3-/83/QR'r1.G)b<+\*_A8G7hEDoGE;E/kRARoLs
5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+DPh*BOu"!4>1,,%144#+<VdL+<VdL+<VdL4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,Rp
F$1^W0Hr\kBle60@<iu6DJX$)AKYYtCiCM/DfQsm:IGX!+<VdL+<VdL+<VdL+<YlHEb'5R06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,
Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oYh1f%shCIE#P0Q:`@9itM9BOt+#
F]EI-:,PO%:I.N>H?=+=82k^4@neUfA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLChGj`
@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g
%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6
+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jD..3k+CT.u+Dbt)A0>N*Dfp"]06;)@DE\L:+<VdL
+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.
@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg
@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT
+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<
De!p,ASuTCA1oZ(<bQGZ=E8M%<A[*4D`)Q.0QUlF6:jgg76"C[H;$,.:gm-qAjJn"8OY:DA8--M
BP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLCi<frEc=,o@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*
4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W
0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%E;N5%enSF`;CEDfQtAF_Pr/F!+m6GAhM4+E)9CFCfN8%144#+<VdL+<VdL+<VdL@V'@oDJ+#5
FDj8pF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V
@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL
+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7<UG"anU0LSZTAoD6q
0hXl[B5fX\6Ul5s@q.quG"lsM12]N8DbOnI@kVD(BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL
+<VeD@;BF:04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL
+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg
@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%eGEATD4$ATJu)Bk)7!Df0!(Gp%0<
EbTK7F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!
E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC
+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n
04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0k!sKC/eV_B2!V1DE0:X:gm-s9LqZ//P::C/MgO<
GY<<c8T/)p6>:@<04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YN;F$)*a4q.iA+<VdL
+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@k])jB4YslEaa'$+Dbt)A0>r'EbTK7F$)*sE+*WJ%144#+<VdL+<VdL
+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL
+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL
+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2
F"V*DDeElt/n8g:04]!2F_t]-F>%/X0eu%)CKa2#6r%/ECd^R(2DR0^GVVfk3+ZqsCh.cE1g*47
8n:D9;dX*=04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YQ5G@Wfh@6P,-+<VdL+<VdL
+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL
4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@k])j@rc-hFCcS'+Dtb7+Co1rFD5Z2@<-WU06;)@DE\L:+<VdL+<VdL+<VdL
4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#
+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg
@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTC
A1oZ[=$gn;E_TD(1iQkWGu\Q[:,bd52J$uCC-c$BD-2*N<AIZM:cMNC7o:pNA8--MBP]hCDI6CB
,!HGC+<VdL+<VdL+<VdL+<VdLDJsW0Ec=,o@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#
+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5'Lpc
A9/l8BOQ!*@<,p%DJsV>Bl5&+Ec6)>F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@B
CghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2
F_t]-F>%/X0em0696s$B7sB/hD+cfT7osb-0m[_`6!ne[GXQ3sCGRhfDcKPA=_i(s04e[.F?aGT
4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YQD4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KRK
BlkJ8ATo8=ATMr9F(96)E-+2qF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g
%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,Rp
F$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdL
BQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/5G"B5ogi5ta.R1Lb'62cWh$
CH+(82+_[r13#TJ2-NI?C-m,1;)2oYG;!N<BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeE
G<@Ne4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jARoLs+Dtb7+EqaEA3;MdE+*WJ%144#+<VdL
+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC
+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n
04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0lp'+8S'h]BkD0W;Is`<@;fsU758ds2aThg1ikU%
3DF3JF_k);:,cfB04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YT54>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%E>a,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr]!E+No0A8,OqBl@ltEbT*+4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r
4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC
+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS
%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j
A5tBpBOXS#;)N2g<)bhIG#UA#<`!in7VZj02+i*cBiShFGYMpTD-(4#ARoLs5A4jrAStjT;^+C7
$6UH6+<VdL+<VdL+<VdL+E1b!CLfO\@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL
+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL
+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%7r1CNXS=
@;]TuE+*6l+Co1rFD5Z2@<-'nF$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+
4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-
F>%/X0l;/'FA>Fu96t\LF&=blCf+Y%2Ju$18RY/#0f;d0/Q,2D;f?SH@8:8t04e[.F?aGT4_8M<
<Dt)*%144#+<VdL+<VdL+<VdL+<YWD4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL
+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KsgF<G"0
A0>B&Df]tBEb/ioEb0,uAKZ28Eb'5R06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL
4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV
+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIM
DBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL
+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ[BNehY:3fE%9ic77
@::a,AOC3>F&"VcC2S0=<b-&b:IK%[F`0],2H_\EA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL
+<VdLE-67b04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL
+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!L'iDfTD3DdmHm@ruc7Bl5&(Bk)7!
Df0!(Gs!a$E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<Vdh
FCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL
+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0i(.n<DHR^AQ!J>
@n]j8:c33-=`?>nCNsf/Bf(-^2`FoN7V>n60gRC(04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL
+<VdL+<Y]9B4O+X@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6
+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,Rp
F$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jEb/ltF*(u6+Co1rFD5Z2@<-'n
F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>
+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL
+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL
+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2
F"V*DDeElt/n8g:04]!2F_t]-F>%/X0m7A2=\<^TEd2&;1fQt?F*:)nA2nO)<b?&K=\EWf<^_3j
6uc@02`G)b04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y]9F*(qT04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL
+?X^a@;[2tCghC+4X+Ai,!L$YF*)>@AKYGj@r$4++Co1rFD5Z2@<-'nF$)*sE+*WJ%144#+<VdL
+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC
+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n
04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0lg$#?W'3L6!.Z<1/CV><_RU.7RM/gG==2@C26U9
0k"cmFZ4PDCb]`l04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y]9G&KJr@6P,-+<VdL
+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL
+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@k])jCh[s4+ED%'ASuU+Gp%-=G%l#/A0>f"C1UmsF$)*sE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd
@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL
4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:
04]!2F_t]-F>%/X0mH,W;,DIRGu@FNAN=UQ:00Dh6TB3U@RaKs12B[!A2-Ms7V6XQ8Mt?R04e[.
F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y]9G&M80GW[Wf4q.iA+<VdL+<VdL+<VdL+?V;u
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+
4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@k])jEb/`lDKI">@VTIaFE8RKBln$,F`\'"+<VdL+<VdL+<VdL+<Y6?E,8s#@<?4%DK@on
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,Rp
F$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdL
BQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/69pD,5@L?VjL@Gt:A>=][@4
2(^D&CI)SbFETZd@qAA'79VudB5qfu=YF>sBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeI
D*0I[4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]$F`&==@:O=rF$)*sE+*WJ%144#+<VdL+<VdL
+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W
3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+
4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-
F>%/X0iq=5@Uj+>1K[LP:f)1'GBl/c;,VU5=a=%'<)\*/=CaC+2*tJC1N%&404e[.F?aGT4_8M<
<Dt)*%144#+<VdL+<VdL+<VdL+<Y]HF?D3b4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL
+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6
+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jEcl7B
FCB<6Des?)Gp%3?F*)Ic06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<VdL+?XaV+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL
+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>
$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ2
=]&46/Q=KH8T-so0LAW-Blu=Z2FDXs?V>$8Da@'!:3Aj)@q0S!E]>^`A8--MBP]hCDI6CB,!HGC
+<VdL+<VdL+<VdL+<VdLF`V,)@X1'h@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL
+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL
+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jGAhM4F!,"-
Eb/a&Cj@.5@;KakA0>?,+CP]d+<VdL+<VdL+<VdL+<YlHEb%9cF)YQ*4q.iA+<VdL+<VdL+<Vdh
05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr
%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6
+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W
2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB
0/64%7Rh/LH!r^I=):hi:,X[tGqF2M2E=K-1/;RrEGp,FCc#]iAkc>e75&4_BllRQCcu?I?WC#K
4q.iA+<VdL+<VdL+<VdL+<VeLF(KDT04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!L$YFEMVA
+EqaEA0?#9ATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL
+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W0ejk9%144#+<VdL+<VdL
+<VdL4EGIMDBNG*@<6KQ,%E;N5!1K>E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Aj0d8dj
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+?V<!@W,e&4q.iA+<Vdh06CW3Ch5d>
$6UH6+?XTc@r,RpF$1^W0f1(<%144#+<VdL4EGIMDBNG*@<6KQ,%E;N4shL/2D@3T06;)@DE\L:
+<VdL4>1Y;%144#4>1/^A9g?J$9TtTFDYhX%16igA8kstD0%He:-pQ_C2[X%@<-4++EK+d+Co%q
@<HC.+Co1rFD5Z2@<-W9E+*cqD.Rg#EcWiB$;No?%15is/g+,,BlbD/Bl%?'BlbD>F(Jl)FDi:C
ATT%;FD,5.+Co%q@<HC.+<Y3/@ruF'DIIR2+E1b0@;TRtATDi$$;No?+EV%$Ch4_3Bl5&8BOr<'
@<6O%EZet.Ch54A=(l/_+<Y)8+Dtb7+Co1rFD5Z2@<-W9BlbD,Eb/[$ARl5W:-pQUFD,5.+E1b0
@;TRtATDi7+DG^9FD,5.+DkP.FCfJ8Anc'm+CT;%+E_a:A0>u4+EML5@qfP#+<Yc>AISuA67sC"
@<,dnATVL(F!,(5EZed5E+*d/Bk):%@<*K$Bk)7!Df0!(GqL4=BOr;/G%G]'+=Lc>F(KGB+Ceht
%15is/g+V7+<VeLF(Jl)+EVNE+<YN>A8,Y$+<YW3Ea`frFCfJ8+EM+9FD5W*F!)SJBl5%9+DG_(
Bm+3$F^](q$;No?+Co1rFD5Z2@<-'nF"SRX9jr*bATAn9Anc'm+E1b0@;TRtATDi7@ps6tDf0B:
+C\n)@q]:gB4YTr@X/Ci:-pQUARoLsBl7Q+FD,B0+D,>(AKYE!A0>o(@rc-hFD5W*+EV:.+DkP.
FCfJ8Anc'm/e&._67r]S:-pQU<+ohcD..L-ATAo*Bl%?'@ps6t@V$[&ARfal@<?'k+EqOABHVD1
AKYJkChu-A$;No?%15is/g+YEART[lD..L-?X[\fA7$HO9gM]W78dK$C2[Wi%15is/e&._67sB^
5uLHL:.I>f@;Ka&FD,5.+E1b0@;TRtATDi7@s)g4ASuU+Gp$p;F*(u(+CT;%+ED%5F_Pl-A0>?,
%15is/g,7LAKXT@6m-PrF*(u1/g*_t+F.mJ+ED%1Dg#\7@;^?5De:,6BOu$'8l%htGA1l0+CfG#
F(d0K=`8El$;No?+Ceht+<Y`6An>e(+CSek+CSekBln'-DII?(E+*cqD.Rg#EcW@4F`\`KH#IgJ
+CehtDJsV>F(&ZlCj?Hs:-pQUEb0*+G%De+F`MM6DKI"?@<,dnATVL(F"Rn/%15fq;cH1`:dIuR
;]n4a+>=p!+>=63%15is/g+,,AKYT'Ec#6,+E(j7FD,B0+E1b0@;TRtATAo*Bl%?'Blc<E$;No?
+<VdL+DPe&D.OhO+=M>WE+LI@A7]glEbTK7Bl@l34!8]TCis:u$;No?+:SZQ67sB'+<VeADIIBn
+DGm>@3B`%Ch[E&8g&"[D.O.`:-pQU+<VdL.!0`RALSa4ATM@%BlJ0.Df-\.De!p,ASuU2+EV:.
+E1b0@;TRtATAnF+EVmJAKY].+ED%5F_Pl-A.8l@67sB'+<VdL+<YT?Cj@-O.qrmCAS5Rp.3N>G
+CfP7Eb0-1Cj@.7G\(B-FCeu*DffZ(EZfILE+O)5GA1l0%15is/g)8Z+<VdL+C\n)E+*g/ARlol
F!+t+@<,ddFCfJ8Ch[s4F!)lPARuupE-,MtCh5%J%15is/g)8Z+<Yi9Cis;3BlbD*DBNM8ARfk)
@:F%a+A*bfG]7\7F)u&6DBO%7@<<W2Ec5K2@qB^(@3B`%Cis:u$6UH#$;a`%7R9C@:Jr;X4!5q%
Bl8$(B4Z*4+EqaEA9/l7FDl22A0>T(+E)./+Dbt7E$0+.F)rHH-o!D<Gs!i91cQp,+<VdL+?L]#
0JEqC7n$BH5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,L7FE2),G%G2,Bl5&3DIjr,Df9S;E+*g/
+=Jru4F'%E0Jka<+<VdL4!6:90F\@V:Jb1`5snUI;BS%D-nB"LFCf)rE[`,@Df'H3DIm^-F!+t2
E+rlo+DG^9Df0,/Ci=62+E1b1F!)SR0g'_D1,L[6+<Vdg+>GQ(%15L'9i+;F6W?iZ+?L\o.qrmC
AS5Rp.3NP<C1UmsF!,"9D/a&s+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<VdL+<W`g2)#IH
6r-0M9gqfV=%PeZ80Bu:-nB"LFCf)rE[`,TBk2=!+E(j7C3=T>BkD'jA0>E$@s)X"DKI"CAU&;>
+=K!!4F'%E2)Qg*4!6F9%15C"6V0j/2'="a+?L\o.qrmCAS5Rp.3NhJASsXc+E_a:+CT>$Bk]Oa
+DG^9A9Da.F!)kb+E)9C0e"4f+<VdL+<VdL+<W`g0F\?u$;No?+@0mj+CSekARlp&@<,dnATVL(
F!+n3AKZ&9DfTE"+DG^9FD,5.D..L-ATAo*Bl%?'GA(Q*%15is/g+YEART[lA0>;uA0>DsF*)G:
@Wcd(A0>u4+A,Et+Co2,ARfh#Ed8dG@VTIaFE9&W+:SYe$;No?+BLj,:.\2N3ZrW[ASrW$AS,Xo
Bl7Q+8g%\iE,oN2F(oQ1F!+q'+Cei#AS-($+CS_tF`\aJBOr;J+Cf(nEa`I"ATAn&$;No?+EV:.
+A,Et+Cf>#AKWC3E-,MtCh5%<FD,*)+E1b0F(KD8FD,B0+EMXFBl7Q+BlbD;F_#3'ASuTuEd98H
$;No?+BD'48Q8J`+?L\o@q]:k@:OCjE[`,BG]7\7F)u&6DBNM8ARfk)ARlomGp$X3Eb/a&DfU+G
DdmHm@rri:Ble!1DfQsC4!8'SDfB6$EZd%F$4R>;67sBJ:Jb1l8Ol<N+?L\o@q]:k@:OCjE[`+m
+@0g[+ED1/BQS;<Eb0<'Ecu#)%15is/g*kk:dIuF9gr#M;BS%D-nB"LFCf)rE[`,QBOr;pDKC#5
EZdFd1boLI.1HW!De*ftAm\M><&-=1BPDN1A8-'q@ruX0Gp$gB+ED%7ATDs*A0>K&EZf+8A1hh3
Ado(V$>OKi/oY?5+DGm>DJsV>A8c[0Ci<`mARlp-Bln#2FD,5.@rHC!+A,Et+CSekDf.0M<,Wlg
$>"*`@VfTuCi<flC`k-@De*NmCiCgG:ddbqEb/ZiBl7Q+A8c[0Ci<`m+DPh*/oY?5+D,Y4D)r+5
%16cjFDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k\?!%16N]A0>B#E-WR?F<G[D+EV:2
F!,"-Eb/a&DfU+U%16igA8lI.F>>RG67sa&De*g*F*&OG/M/);:IH=EDf^#>Ec5H!F)u8?+EM%5
BlJ/H+<V+#:-pQB$;No?+B*AjFCf<#DKKqBBl5&8BPDN1F(96)E-*42Eb-A)G\(B-FCeu*@:jUm
EZdtM6m-2b+Dbt)A7]:(%13OO:-pQUBl8!7Eb-A;AKYE%AKY])+C\c#AKVEh@rGk"EcP`/F<Dr?
@<6!-%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+EMX5Ec`F=De':aC2[X$DBLVB$4R>;67sBsDdd0!
C2[X)Df9H5%16T`@s)g4ASuT4-XpM*AL@oo0HiJ2+?XCWA93$;FCf<.@<?0*-YdR1AU&<<05>E9
FDl)6F"V0AF!hD(%15is/g,7YEc*"0Df'?&DKI"AATVL$FD5Z2+E)-,$7InX3]&Q?+>F<4C2[X%
Eb02F0ht%f.V`m4E,oN/+EK+d+A,Et+E2@4E,ol,ATMp2EZfF5EbTK7/e&._67r]S:-pQU;flGi
ASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/ARfk)ARlomAS,k$AKXT@6m-2b+Dbt)A7]:(%13OO
:-pQUFDl+@Ch7d$C`m;0Ec5t@FE1f/+D,P4+Cf>1AKXT@6m-\lEb'56%16igA92?iBkhQs?Q_Km
+>>!H+?L\n8l%ht;d!$u784mo5tOaM;FNVhCghC,+A*bfEcQ)=+>#c"-R)n?/0J.X+>GYq3\`B4
-RU*F+Boso%13OOC2[X(H#n(=D/`p*BO?'m4ZYAA3Zp*c$4R>;67sa&De*p7F*(u1E+*j%+Ef=g
+E1b2BHV5*+A,Et+EMgLFCf;3/Kc\hFCfK0Bl7@$ARmD&$;No?%15is/g*o-FCdKUG%#3$A0>K&
EZdss2D-[<+CT.u+CS_tG%E98$;No?%15is/g,"LDII':+<YE;A93$;FCf<.@<?0*@r+tRBl%>i
$;No?%15is/g)8ZC2[X(H#n(=D/`p*BHS[;D..L-ATB.-$4R>;67sBkAS,XoARloU+EMgLFCf;3
Ci<flFD5Z2%14LuE+*j%+=DVHA7TUrF"_0;DImisCbKOAA1o;Z/9r?I$7QDk%16T`@r,RpF!)i=
C2[W1%15^%5uU`O;E[&`C2[X(H#n(=D/`p*BHS[;D..L-ATB.@+<VdL+<VdL:-pQUA7]@]F_l.B
D..L-ATAnA.P>FMAgnj7Bl%>i$;+)^:f:(Y4ZX^#De*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A
-QjO,67sBkAS,@nCige=Ec5Q(Ch4`1@rc:&F:ARlDe*g-C2G^`9L2!E8Q8AP4ZX]58l%ht-o<@q
@;]TuFD,5.8g$rNDe`inF<F:dDII0hE[M;'9L2!2<E)Lb;E[&`0H`D!0F\@]DeO#26nTTK@;BFp
%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV;a!/a-WFbnF!,:-@N]`*Dg-7FBQ&);
8l%ht@;]TuFD,5.8g$rNDe`inF<F:dDII0hEZek#DBND"+E_a:A0>u4B4Z0uATAnf@<itN0JGI6
%15cp6:Oa<<Du%A+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A,Et+CT.u+EV:.+A*bQEc5](@rrhf@;]Ld
ATA4e8l%ht@;]TuFD,5.8g&(nDe`inF<GF/DII0hEZee2AKZ)=D]iP.D/a<*D.RU,@<-W9F)PZ4
G@>N'+EVO?Ci^_@BOQ!*@ps6t@V$Zn@<6.!Gp$U8D.73sARlp)D]iJ)C`mh5AKYSn@qfanFD5<-
+E(j7@W-@%+EMgLFCf<1+Ceht+C\n)@;p1%Bk:ftFDi9o+E2@>B6%EtD/!m#/g+,,AKXT@6m-Pr
F*(u1+DGq=ASbs$G@>P8E+*d/Cj@.6AThX$DfB8u+E_a>DJ()5F^o)-@;[2rE,]i9@:Nt'%13OO
<+oue+DbIq+CT>4F_t]23XlE*$7IVX+B3#c+DPh*F)Q2A@q?ckA7TUr+D>2)+C\nnDBNY2F*(i,
Ch7-0%13OO-o*4o5p1VK:IJ#W:J+&C<$5dkCh.*t+E275DKKT1B-;;7+=LuCA7T7p.490ZEc5l<
+Co2,ARfh#Ed8d@@<3Q#AS#a%@rH6sBkMR/ARmD&$4R=j1FXG4+FZpY6rZTR<$5dkCh.*t+E275
DKKT1B-;;7+CQC7ATMr9A8-'q@ruX0Gp$d/F!+q'ASrW#Df00$B6A6+A1e;u%16'Q+DG_7FCB!%
+EV:.+DPh*F)Q2A@q?ckA7TUr+E_a:+EV:.+A*bQ@:O(]B4W2[@;]LdATAo%DIal3BOu'(Ecl7B
FD,5.Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ+AG-p73GN/;FM^2:K8N3:KBn,
5u'fj;FO>H9gp1(84=Xp:I.Ak6qKaF8P`)I;Fs;U+A#<N<(KG#9L2TV+B)6.:`rP'+B1m';]nb"
67r]S%16*VAKXSmF!+t2DJ!TqF`M%9FDl)6+EVNEF(KG9IS*C(:f:(]771#s@;]TuIS*C(<(0_b
/e&.:%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMbrAKYE!A0=]eF*&O$
Ec5H!F)u8?+B)cjBlJ08%16'JAKXSfE,ol3ARfg)D..<jB4Z*+@;KauGB4mLF(KB5+EVNEA7]@e
DIjr!DIal$G\(B-FCcS'Eaia)Eaa!6+A*bqEb-A%DIal/Df^"CE,ol,ATMp2EZfF5EbTK7F"SRX
=(l/_+CQC3Ec5](@rri-F!)Z9F_PZ6+s:u@AKYr4AT2[.@qB_&DfQtA@rc:&F<GUHDK?q4Bl\9:
/0JPCCi"$6ARlomGp%3BAKYl/Ec#6$+C]J-Ch+Z-Ec5H!F)rlTAoDL%Dg,c'+C]U=FD,5.E,Tf>
+E2@>@qB_&DfRHQ+B3#c+E2@4+CT.u+E27?F<GOCDe!@"F)Q(AF(96)E--.D@<,p%FD,5.CLqd4
+EVNEF`V87B-9fB6m-\fFD,B++EV:.+A*bqEc5](@rri1@;]LdATBC4$7QDk:-pQUFD,5.E,oM4
@;]TuE,Tf>+E2@>@qB_&DfTnA@<,p%A7]@eDIm?$Bl5&%+E2@>C1Ums-Z^C[/no'>+D,>(AM+E!
%15is/g)QWDe*g-De`inF=q9BE%)oKEb-A%DIal/Df^"CE,ol,ATMp2EcW?4$4R>;67sBW;FNoP
8PDNA8PDQ93Zof!8l%iO;GTnR6W>^[@rc:&F>%BIA8lR#E,]i4/no'A-OgCl$;No?+Abj4<'jSV
9LM?A9LV**+=DV1:IJ#W:J+&C<%i<&EbTK705>E9E,Tf>E,o\GBkh]:%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[nE+No08l%htF)Q2A@q?cnBk)7!Df0!(Bk;>p$<1pdBl%U.F*)G2FCcRe:IHRO+E_a:+EqOA
BHVD1AKYr4De`inF<GF/DII0hEZfR;+EqO9C`mkAAKXT@6mm$uDg-(AF)Q2A@q?cnBk)7!Df0!(
Bk;?<+:SYe$<1\QF!,OGAT/c#F)uJ@ATJu9BOr<$De*p-F`Lu'+CSekDf-\2@<3Q#AS#a%A8c[.
Ddd0fA0?)1FD)e=BOr;_@:O(]B4W2[@;]LdATAo%DIal3BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"
ATJtBC2[WnATfLR+=LuCA18X0DIak<F`_>6F"&5F@<Q3)@V'+g+EM+9F`8rU+B!?"+EV:.+DbIq
+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE8WKBkAK0BOu6r+Co1rFD5Z2@<-'nF!+n3AKYl/
F<GX9FEMOT%14Nn$;No?+E)41DBNk8Cj@-q:IH=HDfp)1AKYMt@ruF'DIIR"ATJt'$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1%15is/g,FXFWba=Dfol,+D>2,AKZ).AKZ).Eb/f)
8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.Df-\>BOr<*@<?/l$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM;[ARfKuIS*C(:f:(]771#sE+*j%%15F5AoD^$+D#e>Ea`I"Bl7Q+FD,5.-u*[2E,ol3ARfg7
BkhT9+D,>(AKYT*Df$V=BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"ATJu2@;BEsF*2M7+=M\2:IJ#W
:J+&C<%/r/DeX*2F!,RC+=LuCA7T7p.490Z>]XCqBlJ/:A8-'q@ruX0GqKO5.1HVZ67sBPAfu2/
ATME*E+*j%F!,"3+Du+>+DkP/@q[!-F(HId-Z^D?Df00$B6A6'FD5Z2+EVO?C`mh<+EM+9%15is
/g,U8:IJ#W:J+&C<$6:$+DPh*A7]p3F!+_/@rc:&F<G+.Eb/a&DfU+4$4R>;67sB'E,ol3ARfg)
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+DPh*A7]p,>]XCqBlJ/:%14M*Des?9ATAo.E+*j%
+=DV1:IJ#W:J+&C<*XKSEbTK7>ULsC/NP"rDes?9ATAn;/gjRb;I:e&-p)c:HS.]_5u^B^?W0p2
?V4*^DdmH1/14dP%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?'':i^JhARfg)9jqpJB4Z*+7VQ[M
Et&IUBOr;Y+Ad)sC1Ums+AH9^@:s.l+EMXCEb0;7@;Ka&E,ol3ARfg)Eb0&qFCeu*Bl7O$Ec#6,
Bl@l3Bl5&%+=]!XC2b;7Ec5](@rri*Bl%?5+<XL$De`inF<G10Ch7Z1@<,p%ATMp(DKKT$Ci"A>
8g&1bEbTK7F!,[@FD)e*+Co1uAn?!oDKI"5Bl%?'AU&<.DKBN1DD!%S<+ohc-u*[2E,ol3ARfg7
BkhT9+D,>(AKY].+EMXCEb/c(Bl5&8BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5$7QDk:-pQU
Ecl7B@3A0<6m-S[F`_P<DeF><FCfN8+EM%5BlJ/:FDi:5G][t7@rri2ARf:m@<-W9E,ol3ARfg)
Anc'mF"Rn/%17,tF<DrPATW'6?YXLiE,ol3ARfg0+<XEG/g,1GF*2;@F!,O;Dfol,+CT)&+>G6b
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[m@<Q?t@<?''FDi:N8l%iO;GTnR6W@<3@rc:&F<G+.Eb/a&DfU+4
$;YVPDBO%7AKXfiDe`inF<F:dDII0hE\&>N@<Q?t@<?''FDi9MIS*C(:f:(]771$ZF(96)E-*NO
@;]TuDfB9*+=LuCA8lR-C1Ums/no'>.1HV5%15is/g,%?G%kStFCcS:D[d%gE+*j%+=DV1:IJ#W
:J+&C<*XKSEbTK7-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36?R!YA0>K,Ci"A>@rH4$ASuU$A0=K?6k'Jq
:IH=HDfp)1AKY].+EMXCEb/c(Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(KDF+<XL$ATMo8FD,5.:i^Jh
ARfg)9jqpJB4Z*+,!pEdCh+_4@Wcd7Df-\>D]i\(DImisFCcS9Dfp)1AKZ&(EbTK7F"Rn/.1HVZ
67sC"Eb0<5+EV:.+Ad)sC1Ums+AH9^@:s.l+<j-pBl%<(+C]J8FDl%+$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM8dDg-86+A,Et+EMIDEarYi$:/9GATAo&F_PZ&Bl7Q+FD,5.E,ol3ARfg)H#IgJ@ps6tG%kN3
+A,Et+EMIDEarZ'Df-\>BOr<*Ec5](@rri1@;]LdATB/>+<ja&F`Lu'+s:u9@P/)s.1HUn$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l39Q+?M+A,Et+EMIDEarYi$;bbSF)u&5B-;;0AKXfiDe`inF<F:dDII0hE[PoN
,"uo`A0N.*F`__DDBNb6@:XF%@3B0)Ci"A>@rH4$ASuU$A0>r3F`Lu'+DG_8D]iIuFD5o0+Cf4r
F)to6/g)99BPDN1BlbD>F(Js+C`m>.EZen(@Wc<rBl7Q+@;]TuAU&01DfTQ0B-9fB6m,uXA7[A&
$7QDk:-pQUE,oN2F!,R<AKXfiDe`inF<F:dDII0hEZcQ"Ddd0#%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[q
F`&<g@<6-m+A,Et+EV19FE7lu6#IfVG[YH.Ch4`2ATMr9F(96)E-*49@<3Q#AS#a%B4YslEaa'$
A0>K)Df$Uh:IH=6DIal1AS,LoASu!hA1euI6=jbIEb-A6F`))2DJ()6BPDN1F(96)E-*44Eb/[$
AKZ&4D.Oi3ATMr9A8,OqBl@ltEbT*+/g)8G$4R>AATMr9A8,OqBl@ltEd8d;Eb/[$Bl@l3Eb065
Bl[d++CQC&Df00$B6A6+A0?=n:IJ/N;cFlMBl[cpFDl2F/e&.:%15is/g+YEART[l+EV19F<G+.
@ruF'DIIR"ATJtG+DkP)Gp#^T6m-S_F*&OG@rc:&FE8RFAS,Lo+EVNEFD,6,AKYMt@ruF'DIIR2
+DtV)ATJ:fEccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k<+oue
+EMX9E$01DDK?qBBOr<*Ec5](@rri8ATMr9F(96)E-*]T+B3#cEb-A%Eb-A1@;^?5DffZ(EZfI8
F*&OG@rc:&FE8RGFDl22A0>T(+EV:.+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF"SRX<+oia
AKZ&(EbTK7F!,FBDg#i*AKYl5D.Ra+F`S[:G[YH.Ch7Z1De:,*Dg*=GD]j1DAKYE!A0>;iF`V+:
8l%htGAhM4F"Rn/.1HVZ67sBWEb0<5+EV:.+Ad)sC1Ums+AH9^@:s.l-Z^CS<+U,m+s:?;FEDG=
/e&-s$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l36Z6jPCisf5Df-!k<+oue+DbIq+EM47G@b;-BQ&);FDi:EF(HId
:IH=LBln#2FD,5.8g$rNDe`inF<F:dDII0hE\7e.%15^GBPnq\/g*JhCLqMq$;PM_ASkmfEZd+k
0K0FJ@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk%16igA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d
+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(
EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is
/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?
F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0
ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQU
GAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[
7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'
F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=
ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B+
+Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.
F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsC
AU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($
/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqB
Bl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO
:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.
@q?)VA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt%16T`@r,RpF!)iE
C2[W1%13OO:-pQUAoDL%Dg,o5B-:W'AKYYpDIe#8-u!F7A18X;De!3lAKZ&-DfTr0F`_[c%13OO
:-pQUE,ol3ARfg)F(fK4FCTH8F!*%WF`V+:AU&01Bk(k!+:SZQ67sBkAS,XoFD5Z2F!,OB+DGpF
F!,%&F*SmMD]j(3F(KG9FD,5.B6%p5E%c9TBlmnq$=RR13Zp4$3ZoebDe*K'@:Wn]Ec<.H-OgDk
F$2Q,1E\_$-R`_JA90gg.3N&0A7oq%+F,=D$=md43Zp4$3ZoebDe*K'A7]RiEc<.H-OgDnF$2Q,
1E\_$-R`_JA90gg.3N/4ChId-+F,=D$6UH6%15is/g,1GAn?!oDI[6g+D5_5F`8IIDfTB0+Du+>
+DG^9B6%p5E"*.lGWe)11E\_$-R`D>CiX*!F!)TR/g+eE.3L2p+D5RT/g+eIE$/n6A7m8!$6UH6
%15is/g,@VEb'56Bl5&+Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$-[?hWF(JlkGp%Mf+D5_6
+DPh*B.",q+<Vd9$;No?+D58'ATD4$AKW<BF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CVmD/=89
C2[Wq+Bot6-OgCl$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CEBl5&6AThd/
Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<
@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is
/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX
%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>+EqaEA9/1eBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#
$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?
%15is/g)8ZBQ>4P+<XEG/g,">@rcJs$;No?+<Ve?EZd+[+AP6U+D5_5F`;C2$>=HC3Zp.5+?CVm
Gp$d:E,KJ7I4cXf+ED%:D]gDT-RU$@+F,=D$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-\0
DfQt<Df0c;Eb'5#$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(OR
AU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E44ZX]B+?CVm.!R:&.3NSPF<GijAnc:,FCT6+
D.RU,?XHE$7!*?cCi^_D+Co2-E$0ER%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(Gp%<L
Eb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+=ART/1tum+<u=X/M9+=HQk0eF$2-0+D5M/
@WNk[DETV#/okNHD^Qn[-QlV9Gpa%.%15is/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n
+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z
/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!)
:IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8
Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>;67sBlA8--.@rH4$@;]Tu%15L!
6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sBlG[YH.Ch7Z1De:+a
:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&
DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[
E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g+
+EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^s5$;No?+>G!ZD'13FEb]?-A1&L(+EMC<
F`_SFF<GL4+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?+CfP7Eb0-1+EMX5Ec`FHE"*.L67sC%
D/XQ=E-67FDe'tP3[\cgARf3mF`_>6F!hD(%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+=Cl<
De(4)$>OKiF)Q2A@qB^mFEMOX0ht%f.V`m4F)Q2A@qB^mFEMOF+<Y_W/Kc0GEb/[$ATJt:@;]Tu
+<YK=@:XF%+<X9P6m*U_AThX$DfBQ)DKH<p:-pQUA8,OqBl@ltEbT*++D,Y4D'2GH6m-#_D/aPK
%15is/e&._67sB[BPDN1+<Y`8EbTK7+<Ve:Eb/[$ATJt:+CT.u+<YK=@:XF%+<Yc>AKW*f:IH<J
+Co&,ASc:(D.RU,%15is/g+\=@ruF'DIIR"ATJtBC2[WnATfUI+DPh*/0K(WBl%i>/g)99D]j(C
DBO%7BlbC>F(96)E-*3FFD,4p$;No?+D,P.Ci=N3DJ()/F`VXIBQ%]t3XlEk67r]S:-pQUG%G]'
@<?4#3XlEk67r]S:-pQU0I\,:+>ti+GV;!.0R+^WF`VXI@V$ZrDKBo.Ci!Zn+E)-?=(uP_Dg-7F
DfQsoBl8'</e&._67r]S:-pQU0e"5EBOr;Y:IH=6A7TUr+Dl7BF<G%(+DG_7FCB!%ARmD9<HD^o
8jQ,nFDi:9DKBo.ChsOf:-pQU+<Ve>ASu("@;IT3De':a:-pQB$;No?+>PAg<+ohc8l%iR:K::[
73H#LA8c?.D09oA+C\n)Bl8!6@;KakA1f!)F(HId5tiDCD]ib3F*(i,C^g_H67sB'+<Y<.DImis
CbKOAA92[3EarYi$;No?%15is/g)r!+B3#c+A,*p9LVl&@:WneDBNe=F*&O6AKY])F*(i,Ch7-0
+B<Jo+A+pn+EVNEBl8!6@;K`h$;No?+<VdLA79Rg05>*5Ch7Ys$;No?%15is/g)u"+B3#c+Bh?5
+@\pr78k=;A7TUr+Dl7BF<G%(+DG_7FCB!%ARmD9<HD^o8jQ,nFDi:9DKBo.ChsOf:-pQU+<Ve8
EapbKBlFLg:-pQB$;No?+>kSj<+ohcA8-'q@ruX0Gp$TX>\\1f>\Z2O0jGhLGA1qD+E)9C05,9@
AM8BU85DrKI4o>RA1q[V0JP4'-u<U8Fa,>E$;No?+<VdLD09oA+C\n)ASlC.GqKO5:-pQB$;No?
+>tYk:2_7I:IH=9Bk)7!Df0!(Bk;?.GA2/4+DtV)ATJtBC2[WnATfUIC2[W6+E_d?Ci_$JAU%p1
F=n"0:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emNRGqq2c
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$4R>_AT;j,Eb-@@Anc'mF!,R5F))n=AS5S!+Co2,-OgCl$=e!aF`MM6DKI!K@UX=h
-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0?$Bl7u7F*)G:DJ()$AS,k$AKYT!
EcZ=FDe!:"EcP`/@q?d$AfrLH.1HVnAS,k$ATMs64ZZjkHS0ai0d\;_/q,67-sIf_/g+FK%13OO
:-pQUEb0?8Ec,q@Eb0<7Cige<Afto(DKU1WF`(o<+Cf>,D..<mF!+n4+EV1>F<GXHEbTE(%16ce
F*'Q+><3l^+Z_;"-R^>d?Q^mB>p([@-Qmea+EVXHALSuN?O[>O$;No?+DkP&AKYD(A8-'q@ruX0
Gp"Li+EM[8@qB_&/0HVhAmoCiF`M%B%16r\CLq$jE]lH<+Z_J'3]\rU%13OO:-pQUGB.D>ATJu&
+Dbb5F<GL6+C]V<ATJu9D]iY+Ch4%_GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5%17/f
FEMP;De*p-F`Lu'4ZX]A+?CW!%13OO:-pQ_F(KH9E,'<%F)Q2A@q?c*FtG9g+CfG'@<?(%+<Y*1
A0<!;Ci<`mF!)SJ8l%ht+Co&,ASc:(D.RU,%15is/g+\=@ruF'DIIR"ATJu+Ec5e;8l%htA9Da.
F"Rn/:-pQB$;No?+Dl%7@:VDA+EM+9F`;)6A92[3EarZ'F`g8gDJsQ,%13OOBkAt?/M:XHG\M5@
+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2IC#FCfJFBkh6-+CoCC%144#F)>i<FDuAE+=BTU
;GU1O+A,Et+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)+ED%8F`M@P%16Z_F(K&t/g)_uAn?4$F*&O>
De+0.E'5frC2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@q@9=BlGFBA8a(0
$6UI4D/XQ=E-67F-Ugp2:Js4r8l%iR:K::[73H#LA8c?.BlbD7Dfd+9DKBo.Ci!Zn-QmG@FEMVA
/e&/!Cia0%AhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@I>EapbKBlG_OAnc'mF"V0AF!i)@D_;J+
+<Y`BDfp/@F`\`R78d#Z;E>q(8PgO!8PDQO+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)+ED%8F`M@P
%16ZaA1e;u%15is/g+n@Bl%@%+C\nl@;TQu@;[2rA7TUr+DG^98iI1dBkAt?/M9Ua8i@f&D_;J+
+<YB1/g)_uAn?4$F*&O>E+*j%+=DVHA7TUrF"_'4FC?h;Anc'mF"_9?Bl%@%/no'A-Qlr</e&.1
+<VeJD/XQ=E-67F-Ugp2:Js4r8k)BG78k=;A7TUr+DGm>DJsV>Bl8!6@;KakA1&L?ATW'8DCuA*
+<Y65A1e;uASu$2%13OOEb065Bl[c--Xh%*07%>O07%5ECh7Z8%17,eEHPu9AKW@5ASu("@;IT3
De(4)$4R>;67sBQ:IH=HDfp)1AKYMt@ruF'DIIR"ATJu.DBNt2G%G]8AKYr#FD)e8Eb&a%%16W[
@rucT/g*5:-ZsNFCi^_6De'u*De*BiFsd_+BkAt?0d($[+Co1rFE8R9/g,(C+=ANZA8a(0$6UI4
D/XQ=E-67F-Ugp2:Js4rF)Po,+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,%=BleAD+ED%8
F`M@P%16Z_F(K&t/g)8j+D!/J-tI%%FE8QU-8%J)4=;aqC3(aO+D!/JHS-Ks+F7R4EZf+8A9qs/
+CoCC%144#F)>i<FDuAE+=BTU;GU1O+Dkh6F(oN)+CoV3E$043EbTK7F!i)NATW'8DCuA*ASu$2
%13OOC2[X'Df9_\/g)MpC2[W9-OgDsAhG2t7TW/V+CoCC+DPh*Ec5l<4Y@j)@lbtgC2[X'Df9_?
%16Z_F(HsH%144#C2[X'Df9_\/g)Q97Na98INW<BF*&NPARfCl+='KR9gpEY/8B*6Ec5l<+:SZh
DIb@/$4R>WG%G]8Bl@lP/g)Mp-Qll0AoD^$F*)FF3?^F<1a".n%16igA7T7pA8-'I/g+nIA9)U,
F=_0MATDj+Df.*R0..29%16f]/g)hj4Wkt(+Co2,+DPh*Ec5l<+CoCC%144#D..3kA8-',4DJeF
Ec5l<%144#-mqV_6m-MgDfd+4Bl[cpFDl2F-Rg0^EbTW,+DPh*Ec5l</151NA9)U,F=qZ[F=.M)
+<YN0CLq$jEZdJZDe*BiG%><-%144#F)>i<FDuAE+=BcW6m-MgDfd+4Bl[cpFDl2F+CfG'@<?'k
3Zoe$C2[WnAThTuEX`@eCia/?%144#F)>i<FDuAE+=BTU;GU1O+Du+8ASlC.Gp#^T6m-MgDfd+4
Bl[cpFDl2F+>#c"-S0"NA9)U,F<GU8FEMVA/e&/!DIb@/$4R>;67sBjEb/[$AKYMt@ruF'DIIR"
ATJ:fF)>i<FDuAE+Dtb7A0<9SHXpi#FE8l^-u*[2A7]ppBlYad0RI>E@ruc@4"#/mBl%L*Bk;?.
A8,OqBl@ltEd9#A$?L'&F`_SFF<GI4G@VgE0mdGF@ruc@/1>7OA7T7pA8-'84#)(mBk)7+.6Anl
De'u3Dfp)1AKYK$A7ZloBk)7!Df0!(Gpa%.F)>i<FDuAE+Dtb7A0<9UHXpi#FE8l^-u*[2A7]pp
BlYad14*PG@ruc@4""c]A0>DoG%GK.E,B0(F<G+.@ruF'DIIR2-OgCl$;No?+D#e>Ea`I"+CT.u
+EDUB+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08%172oE,]6-BK[sjC2dU'BHS[OFCf<.0..29FDYu-
F_u(\/g,7QE,]6-BIkNAF_u(MBkh]:%13OOAoD]sA8,Oq/g+\=@ruc7A8a(0$6UI%Bk)6J/g*5d
Bk)5o$6UI4D/XQ=E-67F-VSGeA8,po3Zoe$A8,Oq%144#A9Da.A79RC/g,I\ART*l-tI%%F=\dl
Bkh]:.6D9_A9qs/%144#.!0Au:K(48A9Da.A79R/+Eqj?FCcS:D/a$.D/]pk+<XEG/g+kGF*2M7
+Co1rFD5Z2@<-W9E+*j%+E):2ATA4e+<YT5+FGdi5!!4g@ru'lDId='.=3[XBk)7++BosE+E(d5
-RT?1+<XEG/g+tK@:UKkF_u(?F(96)E-)Nr+<W?]3\V[=FDYu-F_u(,$6UHd67sBpDKBr@AKZ2.
+ED%1@;0U%Bl5&;DfTW-DJ().De!3lAISth+Cf>"F`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&
+<XEG/g,1GB4YslEaa'$+CfG1F)rIEAS,LoASu!hEt&I!+EVI>Eb/j(4Y@j2+D5M/@WNk[+FPjb
Eb0E4+=ANG$6UI4D/XQ=E-67F-UVomF)rIEAS,LoASu!hF!,+,DImisFCeuD+=A^NBk)5o$>"*c
/e&-s$?L'&F`_SFF<Dr0<C9,B;c>_"Eb/ltF*(u6ARloU:IH=9Bk)7!Df0!(Bk;?5+BosE+E(d5
-RT?1F)>i<FDuAE+>b3ZA0<6I%14Nn$4R>`ATW'6C2[X(Dfp)1AKWZ9$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?YBl8'<DJsW.F'hmK<&-=)Bl8'<+B*5j
@qfOh@j"NbFCfM9AoD]48l%ht0J5@<1*@u>@<itN0JP:2%13OO<+oue+DGm>FD,5.Anc:,F<F7k
DKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTTKAS,k$AKZ,:Bl7Pm$;+)^+E)-?Ch[d0GT^j3
@q]RoATJu5Ch7$rAKZ#)@:UL&BOu6r+Du+>ATKI5$4R=s.3M5Y6m-PhF`Lu'+Cf>#AKY].+Co2-
FE2))F`_2*+DG^9FD,5.8l%iR:K::[73H#LA8c?<+A$HlFCB!%+EV:.+:SZM:IJ,W<Dl1Q+CSek
Df-\+DIal1F`&=DBOr<-@rc:&F?0j<%144#IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3
Ear[%ATW'6/no'A+:SYe$<1\QF!,O6EbTK7+DG_7FCB!%F!,R<AKXT@6m-#OG%GK.E,B0(F<G+.
@ruF'DIIR"ATJu:F(oN)+DlBHEb/a!D/Ej%A7]9oE+*j%+EMXFF^oN9Eb-j4$:/9GATAo6F`))2
DJ((?C2[X(Dfp)1ATMF)F`8sIC3(gHH#IgJF(fK7Ch+Z0ARuupBl[cpFDl26ATJu1Bkq9@+=JUP
DeO#9+DGm>D0[6L85DrK.1HUn$6UHEBQ%a!05>E=DD,aCA1q[V0JP4qDe*BiFq"d$+>7DHD.PA8
DeO#AC2[W9C,[h$05>E9%144#05,9@AM7e:BPoJ<De(M92_Zs>F`_>6Et&I!+:SZWD]j4;ATo8?
ATD7$+Co&)@rc9mARlotDBNP0Ci"$6Bl7Q+Blmp'F!,R<ATME*A8,OqBl@ltEbT*++Dl7BF<G%(
+CTG%Bl%3eCh54.$4R=t.3M5Y6m-\^F!,CABkM-t@;Kb*+Co&,ASc:(ARlp%DBN"pDId[0F"SS7
BOr<*DfTqBFDi9qBl8'<+Eq78%16WaDIjr/DBN@11GU(^BlkIt@WcR1FW`Cn/hhMmF*VhKASj%B
<+ohcDf0B:+A?KeFa,$FBju*kEd8d;@;K`h$>j3^AKYH-+A,Et+E(b"F`MOGBl5&8BOr;7B6@p!
F"&5TATD64+:SYe$6UHd67sC&D]j4;ATo7FB6@p!F"&4[Bl8!6@;Ka&8l%iR:K::[73H;dASiPE
.1HV,+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1+<Y3/F)W6`3[\Q_Bk294%13OO
-td[:A901BGAhM;F!,(/DIjr/DBL_j+C]&,+B;lnDKL"D9PJBeGT^j3@q]RoATKIH8TZ(l@<iu>
DfTV9Df-[U1a$7AF<D#"9PJBeGT^F9+EqC5Cb?hQ<+ohcEb0)rBl7X&B-:l+F*&O8AT23uA7]Xg
Bk;?.A7]dqG%De.Ec5e;F(f-$C`m5+D/E^!A90@G%15^'6m->TCLqQ0G%G]>+Dbb/Blmos+E_a:
+E(j79PJBeGT_'@ASc0*@rH4$@;]Us/g+)+ASc0*@rH4$@;]Us+CT;%+:SZf@;KakA0>i3Bl.:!
Bl&&;FDi:=Dg#\C+ED%2@;TQu@;]Tu@rH=3+D,>(ATKIH<+oig+EM47F_kS2GAhM;+E)-?%16N]
Gp%0MEa`["+E(j79PJBeGT^pF+B<;nGV1+0Dg,c9ATB=E8l%htBOPs)Df0B:+C\nnDBO%4F*(u(
+E)-?1GU(^BlkIt@WcR1FWh2$%14m?+A,Et+CfG'@<?(%+D>\7F<G10Ch7Z1@;]TuA8-'q@ruX0
Bk;?.@;]Tu@<6L4D.Rc2BlkJ2@<3Q5BOr<(ARf:mF('*7%17,iB4uC.+EVNEEb/Zi/0K.WBlmo/
@;]TuD/XT/+EV:.F(HJ+Bl%@%/g*Q)EbTE(+Co&,ASc:(D.RU,+A!\pF`\a7Cht52Gmt*Q:IH=9
Bk)7!Df0!(Bk;?.Bl5&1Gp"A':JF8#-nf7PD.PA8DeO#;+Co2,ARfh#Ed98H$4R=b+AP6U+EVNE
G%kN3+Eh=:@WNZ6BOQ!*D..<rE-5u*FCcS.Df^"CAnc'mF!)lFDKBo.Cht4d:IJ,W<Dl1Q+DGq/
D'1P^%144#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD*+Co2-E$.5'-ZWd9@;TRf
Bl%@%+Cf>/H"Lc,ATK4.$4R>!.3M5Y6m-M]EHPu9ATJu7Df9`/A0>Ds@ruF'DIIR2+E1b2BQG^I
BeEsL/0K4VF`JUD@<?1(+Dl7BF<G%(B5)6+GA2/4+CQC6CghBu+>5>V$4R>".3M5Y6m-VnATJtd
-Z^D?Df00$B6A6+A0?)-@N]-#Dg-86EZee.A0>i%Afu,*@:Wqi/g*ksCLnW0F`M%9H#Ig7$><jk
AKYD(@WHC2F(KA7@;]TuEb/ZiATAo7ATW'6/g)8G$4R>6AfuA;FWb@+G%De6Dfd+3Df00$B6A6+
A0>;'8g&=h@N]-#Dg-86EZdtM6m-\fCht5&FED)2E-*4ED]j1DAKYJrEc5f/F_r^>Ec6/CATA4e
FDi:2Ec6/CAKYo/Ch[cu+D>>&E%W8)AfuA;FWb45+Du+>+D>2,AKX?REc5f++DG_7FCB!%ARlo3
C2[WrASc<7+EqO9C^g_hDfd+GDfTVG%144#+:SZ#+<XEG/g,(C+?MV3C2[WnATf22De'u5FD5Q4
-QlV91E^UH-RU$367sC$AT;j,Eb/c(A8,OqBl@ltEbT*+%144#+Co2-E$-NCDe*NmCiCa2$4R>@
Bl.R#@<-'uGp#^T6m-\fCht5:F(HJ9BOr;>F`VRVAThd*@q?d%A7cs)ART+\EZf(.+F.mJ+D>2,
AKYl/F<GXDARfFdBk:ft@3BN"Afu,*@:Wqi/e&-s$8j7T6r+q#:K/H:;ahg<Cgh3sF!,17+A?Ke
Fa,$$:IH=E@<?1(/g)9'Cgh3sF!,=.Gp%'HDe+!#AKYQ)Ec5u>+DG^9%15^'6m-,RDImisFCeu*
F(f-$C`m5+D/E^!A90@G+AZkt=(uP_Dg-7FD.-pfBl7L'+F.mJ+Ceht+D#G#Ci=B++C].qDJK[g
Bl7NoF*(u(+E1b2BQG;?Bln#2A8cU"Ch4`/F`2A5F!,:5CLnV4@ldjkEc5T2@;R,VBl%@%>TtdC
+A!\aD'3_7F<GXIEb-A,Dg*=GD[d%aD]j+>D.Rg&Bl7Q+F(oK*Ch[<u+EqOABHTu_DKU1HE+*j%
F"Rn/%15!B+A,Et+EV19FE8RJDesQ5AKZ&5@:Njk@V'.iEb-A'Eb/[$Bl7Q7+Cf>/H"h//+E)9C
Eb0<6DfTQ0B-:Yl@r$4+F"SS2DBN"pDId[0Et&IgEb/f)A8-+#+EML1@q?csF!,L7FEMVAARlom
Gp$O5+@/gq+CehrCb?hQ:Mq:KBl8'<+EV:.+=Lc4.3N\FASc0*@rH4$@;]TuBlbD>F(Jl7%16'J
AKYMq+Cf>,D..<m+ED%8F`MA@+D,Y*AKZ&5@:NjkAoD]4@;Ka&D/XQ7FCeu*G&M2>D.Rc@+<X5u
Df0B:+Dtb%A0>u-AKZ/7CisT+%172j@<<W%Df0Z*Bl7u78l%htA8,OqBl@ltEd8d>Bl%@%+C]J8
+A!\dD]iq9F<G@:Dg*=;Dg*=GD]iS%FCfK0Bl7K)FD,5.G&M2>D.O.`DIIBn+D,Y4D'370Ch[d0
GT^U4Ch4`.@<?08+<X3dDI[6#8K`%bFEMVA+EV:.+EMC.Ci![(F<G"/Dfor>+E(j7Ao_Ho+EML1
@q?cpDfQs0$=Rae+Dl%>DKKH#+Eh[>F_t]2/g)98AS!!+BOr;Y:IH<RAo_HoA8-+#.3NeFEag/'
DfQt2ATV?pCi_3O8S0)jDfm19@<Q3)Eb/ZqCj?HsF)>?%C`mn>CisT+F!,=<F`);4A0=K?6m->T
Gp%-=Ap&0++EVNE@rc-hFCd!G@UWb^F`8IAEZfC6F*)>@AKYMt@ruF'DIIR"ATKI5$4R=b+AP6U
+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-Ql/N/g,1GEHPu9ARlooBk)7!Df0!(Bk;>p
$6UI%Ble59-Y@C1ARoLrCF9Pu+<V+#7VQaKCi"AJ+A$/fH#IgJASu!rF`);4EZf=ADdmNoD0$hB
F(oN)+A,Et+E2..@<6!&ASkjiC`mS++CT@Q+C\bpATDNr3B9?;D..-p/n8g:%13OO%13OO%13OO
%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)
6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrE/ibO@-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<-QjNS+<Vd9
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0A
Et&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(
F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)
Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG6FDYi)DdtG8De*R"A7^!<BQS*-%16ig
A7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"
E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9E,o]1/no'B%16igA8G[`F"_9H
A7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*
%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JOpa$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]
ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()6Df9GE+A$YtDe<TmEcVZs@3Bc4Eb$;2
EbT*&FCeu*A79Rg@UX=h+D,P4+CT)&+EVmJATJu4Afs\gGAhM4F"SS-:IH<7$?L?/E,Tc=F!,:5
DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJu9Df9H5+D,P4+:SZgDe!p,ASuU(
DJ()#DIal3ATMs-DJ((a+Cf>#AM,)7$4R>6DBMOo2_He/+A,Et+ED%5F_Pl-F!,R<AKYT'Ci"$6
Bl7Q+@:WneDK@iJ$4R=b+Cno&@4uA-Bl%@%%144#@<,j2H>.=@%13OO7W3;iD/XH++DG_*DfT]'
FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!
+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&
@N]/hFCf*'Ed8cZ+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDs8o04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM4K"%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49
D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\
4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0J5@<1a`_>:eX/S7ScoV
;a!/hGA1q;Ch[d0GUFUV+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c
$>j3hBkCptF=q9BEt&IkDe*p-F`Lu'/p_5N%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@
4ZXs*2D?j.C,Rb$+DNhh0ddD;6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ5H>.=I+DGm>
@;[2rEarcsG%De+Df0Z*Bl7X&B-;8,EbSruBmO?$+CoV3E"*.tATDj+Df0V=De:,6BOr<.BQ@Zq
+A,Et+Co1rFD5Z2@<-W9A79Rg@UX=hF!)lGDe*BiFt@BHA1VkFBl%i>%172j@<<W#Eb-A9F(Jl)
FDi:2F_PZ&+EV:.+A,Et+EMgLFCf;A+<X9P6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AISuZDf9//
AU%X#E,9*,+E(j7BQ&);8l%ht@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=
$4R>6DBMOo2_He/+A,Et+ED%5F_Pl-F!,R<AKYT'Ci"$6Bl7Q+@:WneDK@iJ$4R=b+Cno&@4uA-
Bl%@%%144#@<,j2H>.=@%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.Bl5%AC2[X(Dfp)1AM/:C
E%)o>@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+F[a0A8c@,
05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!
D/Ej%A7]9oD.Rg&De(IC+=LuCA92[3Ear[%ATW'6/no'A.3N;4F!+q'ASqqa+<Ve:BOt[hARlp%
DBN"pDId[0F!,3U/hf%3+DNhf0JO\YDIal+Bl8'<+DNhf0JO[m1GU(^BlkJ=H#n(=D0%<=$6UH6
:/=hX3Zq"9+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%13OO1+=>DF`&=DBOr;Y:IH=A
@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.
B4YslEa`c,Cggcq@psIjB5_g9/e&-s$6UH68l%htCggdo+D>2,AKYl/F<G%(ASrW-@:Wpl@rH4'
Ch7^"Cj@.BDfTr.@VfTu@V'Y*AS#`g$6UH6=(uP_Dg-7F@;]Tu9PJBeGV1*]<+oue+DbIq+EqaE
CNCV:DBN"pDId[0F!+n/A0>T.%144#+EqO9C`mq?Ebce9DBMVeDKU1H@<3Q8ASc0D+E2@>G%kJu
A0?/9FWb45+Du+>+D>2,AISth+<Y*1Gp$[CFCB'/+A,Et+Co1rFD5Z2@<-'nF"Rn/%16QQCLqO$
A2uY8B5M'kCbB49D%-h$%17&pC2.Zt1,2Nj/h1g\C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK
0JGEp$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU.NgK#0K3o[F>5]s/KeJ4A7]9oH=gl-ATJ:f:-pQU
.NgK#0K<u\F>5Km/KeJ4A7]9o5uU-B8N8RMA9Da.Et&IO67sB1+>PW)3,`;K0f1")+DG_7ATDm(
A0=0:6V0j/2'?sOFED57B-:o+FDi::De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs%13OO:-pQU
F*(i.A79Lh+DN$?@rc:&FE7luEb065Bl[c--Y-dtF_;h=@<633%13OO:-pQUAoD^"AKX9;6V0j/
2'?UN+CoV3E,uHq:-pQUF`V87B-;8,FED57B6,20DBNY2A8-4$A9D<s+Co1rFD5Z2@<-'nEt&IO
67sBH;aX,J3&P&OC2[X"@;BF]4ZX]?%13OO:-pQUH=gl-ATJu&A7TUr+=M;BAKXT29H[ka@s)X"
DKK</Bl@l3Df-[i+EqO8BdjJuEb065Bl[c--[oK7A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%13OO
:-pQUCi<flC`me/EbTK7+Du+?DK?p0$;+)^7oE/jH=&fr+=CoBA9;a.Ci^s5$;+)^;cQCrH=&fr
+=CoBA7AtgBk)6rF*)IN%13OO:-pQUE-67UG]IA-%15L!6WHiL:/jSV9hdoK6sk7I+?_b.0H`D!
0F\A1D/XQ=E-67FE,m'KH[\_=I4#I2%15is/g+h9DIe#8AoD]4E,8rmBl7Q+GAhM4F!,17+Dbt)
A7]9o@r,RpF(KD%$;No?+D#S%F(HIAH[\_=I4#I2:-pQU8l%iF;G\KKATT%BH[\_=I4#I2.1HUn
$?L'&F`_SFF<DrGDe'u0Ec5](@rri7ATW'6-OgE*E,'<%2D?mA0ht%f.Wo]FDe(a[1*CWi/Kf1T
A79Rk+A,Et+CSekDf-[U/hf%'Ao_g,+?(o,0eNnB:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130em9O@PKeN$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-U
F(dQo3F<ml3Zoe95s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO-Y[=6A1&L4ATT%V3[\rZ
@:UL)EbTW,-OgCl$>OKi2_]J>3ZoOf+<VdL-Y#1jC2[W92_Zs>C2[WnATf_J@rc:&F>#!N$>OKi
2D?mpA7TUr4ZX].-Y#1jC,Rb$04AC%Df0VLB4YslEa`c;C2[W9-OgCl$7Kq+@:UKqDe(d\GUt4W
De(J7C3(aO+Eqj?FCcS9BQ&*6@<6K4C2[W@0J['IA8c?:-YdR1/no'A-OgD2Eb/Zi+DPh*2_]J-
-YdR1FDl)6F"V0AF!iCZGB.D>AKZ&-Dg-//F)rI=De(a[11=^(Df.*RC2[WoG]\![C2[X)Df9H5
/no'A-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3  ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' buildjod CR CRLF JADDONJODPATH JADDONJODSOURCEPATH JODGOO'
zz=:zz,'GLECODEPATH JODGOOGLECODESOURCEPATH JODTOOLSBUILDCNT JODTOOLSVERSIO'
zz=:zz,'N JODTOOLSVMD JODVMD LF TAB TEMPFILE0 afterstr alltrim allwhitetrim'
zz=:zz,' beforestr betweenstrs blkaft changenqt changestr charsub ctl dblqu'
zz=:zz,'ote decomm dewhitejscript jodsystempath jpathsep lastjodhistoryvers'
zz=:zz,'ion md5fromstring md5manifest read showpass smoutput timestamp toCR'
zz=:zz,'LF toHOST toJ tstamp write zreplace''),(<<;._1 '' doctest doctest reb'
zz=:zz,'''),(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARM'
zz=:zz,'S CNMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART '
zz=:zz,'DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ERR004 ERR'
zz=:zz,'005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR013 ERR014 '
zz=:zz,'ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR023 ERR0'
zz=:zz,'24 ERR025 ERR026 ERR027 EXPLAIN FREESPACE GROUP HTML IFWIN IJF IJS '
zz=:zz,'INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILES JDSDIRS JJODDI'
zz=:zz,'R JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVERSION LATEX LF MA'
zz=:zz,'CRO MACROTYPE MASTERPARMS MAXEXPLAIN MAXNAME NVTABLE OBJECTNC OK OK'
zz=:zz,'001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK009 PARMDIRS PARMFI'
zz=:zz,'LE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK REFERENCE SUITE SYM'
zz=:zz,'BOLLIM TAB TEST TEXT UNAME UNION UTF8 WORD XML afterstr alltrim bad'
zz=:zz,'append badblia badbu badcl badil badjr badlocn badobj badrc badreps'
zz=:zz,' badsts badunique beforestr boxopen catrefs cd changestr checknames'
zz=:zz,' checknttab checknttab2 createjod createmast ctl dblquote decomm de'
zz=:zz,'fzface del destroyjod did didnum dnl dpset dptable empdnl fex first'
zz=:zz,'one fod fopix gdeps get globals globs grp gsmakeq guids guidsx host'
zz=:zz,' hostsep isempty islocref jappend jcr jcreate jderr jdmasterr jnfrb'
zz=:zz,'lcl jodsystempath jpathsep jread jreplace justdrv justpath jvn lfcr'
zz=:zz,'trim locsfx make makedir markmast mubmark nc newd now nowfd obidfil'
zz=:zz,'e od ok packd plt put quote read readnoun readobid regd remast rest'
zz=:zz,'d rv saveobid second tc trimnl tstamp uses wex wrep write writenoun'
zz=:zz,'''),(<<;._1 '' joddob DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN D'
zz=:zz,'IRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR'
zz=:zz,'205 ERR206 ERR207 ERR208 ERR209 ERR210 HEADNMS OK200 OK201 REFCN RE'
zz=:zz,'FIX REFTS TEMPFX backnum copydirinv copyfile copyfiles createdl dfc'
zz=:zz,'lose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropdir dropinv dr'
zz=:zz,'opnc dropref justdrvpath libstatus loaddir loadnc loadref loadstamp'
zz=:zz,'s maxback movefile nummask packdict packspace renamefiles restdict '
zz=:zz,'restspace savedir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '
zz=:zz,''' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPPREAMBLE DUMPTAG '
zz=:zz,'ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR'
zz=:zz,'0158 ERR0159 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS OK01'
zz=:zz,'50 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH W'
zz=:zz,'RAPTMPWID btclfrcl clearso clfrbtcl createmk dec85 dumpdoc dumpgs d'
zz=:zz,'umpheader dumptext dumptm dumptrailer dumpwords extscopes fap fmtdu'
zz=:zz,'mptext fromascii85 halfbits htclip jnb jscript jscriptdefs makedump'
zz=:zz,' makegs masknb namecats nounlrep opaqnames parsecode sexpin sonl ta'
zz=:zz,'bit toascii85 uqtsingle wraplinear wrdglobals writeijs wttext''),(<<'
zz=:zz,';._1 '' jodon jodoff jodon''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCR'
zz=:zz,'EATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNR'
zz=:zz,'EF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055'
zz=:zz,' ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR'
zz=:zz,'065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 '
zz=:zz,'ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR0'
zz=:zz,'85 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 E'
zz=:zz,'RR095 ERR096 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS OFFSET'
zz=:zz,' OK050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 '
zz=:zz,'PATHTIT READSTATS allnlctn allnlpfx allnlsfx apptable appwords badc'
zz=:zz,'n checkopen checkpath checkput closedict createst defwords delstuff'
zz=:zz,' delwordrefs didstats dnlsearch freedisk freedisklinux freediskwin '
zz=:zz,'fullmonty getdocument getexplain getgstext getobjects getrefs gslis'
zz=:zz,'tnl inputdict invappend invdelete invfetch invreplace islib iswrite'
zz=:zz,'able iswriteablelinux iswriteablewin jdatcreate jwordscreate loadal'
zz=:zz,'ldirs loadallrefs loadwords mainddir newdparms newregdict nlctn nlp'
zz=:zz,'fx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putexpl'
zz=:zz,'ain putgs puttable puttexts putwords putwordxrs rplctable rplcwords'
zz=:zz,' sortdnub''),(<<;._1 '' jodtester TESTYAMMER ereopen hfd hostsep rmro'
zz=:zz,'ot showpass testenvironment''),(<<;._1 '' jodtools AGEHEADER CR DOCUM'
zz=:zz,'ENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR00404 ERR00405 GROUP'
zz=:zz,'SUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK'
zz=:zz,'00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB'
zz=:zz,' WARNING00400 WORDTESTS addgrp addloadscript addloadscript1 allname'
zz=:zz,'s allrefs betweenidx createjodtools dayage delgrp firstcomment firs'
zz=:zz,'tperiod fsen getrx hlpnl jodage lg locgrp ltx mg mj mls mt noexp no'
zz=:zz,'tgrp nt nw obnames onlycomments pr refnames revonex swex today toda'
zz=:zz,'yno tt updatepublic usedby yyyymondd''),(<<;._1 '' jodutil ASSUMESMAR'
zz=:zz,'K AUTHORMARK CREATEDMARK DOCUMENTMARKS DYADMARK ERR0250 ERR0251 ERR'
zz=:zz,'0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0257 ERR0258 ERR0259 ERR026'
zz=:zz,'0 ERR0261 ERR0262 IzJODutinterface JODHELP MONADMARK NAMEALPHA OK02'
zz=:zz,'50 OK0251 OK0252 OK0253 OK0254 OK0255 OK0256 PDF PDFREADER PDFURL R'
zz=:zz,'OOTWORDSMARK SCRIPTDOCCHAR URLPFX URLSUX VERBATIMMARK WWW0 WWW0linu'
zz=:zz,'x WWW1 blkaft changetok compj compressj createut ctit de dewhitejcr'
zz=:zz,' dewhitejscript disp doc docct2 docfmt2 doctext docword ed et exobr'
zz=:zz,'efs gt jodfork jodhelp ljust obtext pdfreader qt reb revo rm rtt se'
zz=:zz,'twwwbrowser textform2 wwwbrowser''),<(<''test''),<0$a:                '
zz=:5545{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DQC8+>P&u+>tu/+>Y,q3&*B82BX_72)-44+>PW.2]st#2_uR9+>Pr73?U=)1GUa/3$9t11H$@7
+>c);2.UW8FCfN8:-pQ_A8bt"ATMr9F=f'eFCfN8+EMXI@P/!_67rU?67sB[BPDN1FCfN8+>,9!
/hS8YDfT]'FED))+EV1>F<FOrBlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=$;No?+AHcpAKYT'
Ec#6,FCeu*BOtU_ATAn9@rH4$ASuT4FCf]=+EV:*F<GdACht5'AKYT'Ec#6,FCeu*+@uo867sBo
DfB8?+<XWsBlbC>FCfN8+<VdZ/hSb/+<Y97Ec#6,FCeu*+EV1>F<D]*BPDN1+EV19F<D\Y/hSb/
$;No?+D,P4D..O.ARlp*AU&;>9lG&`+<Y97Ec#6,FCeu*BOtU_ATAn9@rH4$ASuT4FCf]=+EV:*
F<GdAChsGR67sBiAKYT'Ec#6,FCeu*8K_\bE+LXE9jr'f+<Y?+A0>;'Ch\!5Ch4`*@;THrGA(o9
AKYT$AS#@_+Eq78$;No?+EqL5FCcS'F!,OADg*<U+CT.u+Du+>+EqaBC`mq8Blmo/@Wcc8@rGjc
Bl7K)GA(]4AM,*.Dfm1DARu3D67sBT@<-W9G@>P8@3B6%/db??/db??/g,=KEaiI!Bl,m<:-pQ?
:-pQU+<VdL/hSb/+E_R6DfT]'FCeu*FCf]=$;No?$;No?+CfG'@<?'k3Zp18+B)ij+>PW)3$9q0
3]&iX2)GXI:-pQ_78d#Z;E[2d.!KTMA18X5@;0P!+E)-?/hSb/$;No?+>Pes;e9nj1,(CA+>GQ2
1c[TS1^XRb67s`W8Q\,>+Cf>1Eb/a&ARlo9/hSa`C2[WX67sBqDe(J7C3(LL/Ken=Bl5%c:IH=9
Bk)7!Df0!(Gp$U5@<6K!$;No?%15is/g*GrC`mY<BOu3,A8,OqBl@ltEd8d;CghC+ATJu&Eb-A)
G][M7F(oQ1F!,C5+EV:.+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig+CT)&+E_a:+EMX5DId0r
A0>B#DKBo.DKKqB@;]TuG%G]'F!,")Anc-oA0>T(+EV:2F!+t/@<6KB%15is/e&._67sBJEb/[$
Bl7Q+@3A0<6m-DWC1Ums+Co%qBl7L'+CQB@BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?+@Kd^
FE2;FBl7Q+@3A0<6m-DWC1Ums+D#S%F(KD8FD,5.-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is
/e&._67sBJDf0Z*Bl7uQ+Co1rFD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<@;^1./0JYEFCfK)@:Njk
G%G]'Et&IO67r]S:-pQU8T&W]Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$@:F%a+C]U=BkhQs+Dbt+
@;KL(%15is/g)8ZA7]R"+<VdLA7]RgFCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;
@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<
+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8
Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&
ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&
Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/io
Eb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is
/g)8ZD..3k+<VdLB4YslEaa'$+A*bt@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dtb7
A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)
Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdL
E-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeI
AS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3
Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+E_a:F!)SJ+EqaEA9/l9F(Jl)
@X0)?DfTB0+CT.u+EV19FE7lu:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l'
:IH=:EcQ)=F!*.j0J+t83@PCE%16T`@r,RpF!)SQ@;9^k-OgDmDeX*1ATDl8-Y[=6A1%fnEb065
Bl[c--Yd7-Ch7Z1Eb/lpGT_*:F)*-4$4R>;67s`uAT23uA7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$
Bl5&8BPDN1F(Jj'Bl@l3BOQ'q+ED%0@<?'k+Co%qBl7X,Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh
@j$(?Ci<flCh4`,Dfor=+EM+9+CoV8Bl7Q+8g&(nDe<^"AKYf-@:X(iB+52C67sB/.OdMA+A#%(
8PUC.:-hTC%13OO:-pQUCh[cu+D,1rA1Sj5@<-C&@:s-oEb0?8Ec*ENFCAW$@;]TuCh[cu+D#G$
Et&IM7Qide0RI4\%15I#4ZY;RHXSN9$<0;X4ZYTM@4hur6W-TI4ZYr./5/MB$4R>;67sBt@:O=r
+EM%5BlJ/:DfBf4Df-\-De*F#+>"^XD]iJ!A0>`-Eb-A%A7Qfk+Dtb7+E(_(ARfg)@rGmh%15is
/g+S?A0>`-A8,Y$+EV:.+D,P.Ci=N3DJ()&AS,XoBln'-DBNk0+AG-h;GU7p:dkg#8lJ)T8PiAL
3\iE!$;<`b79D]61,9:G85r;W4ZY>S%16339KbEl1^sdk79EMP3\iQ%$:7lp76N[e2@U!n<(8i1
3\iZ($4R>;67sBt@:O=r+EV1>F<G[NE+O)A+Co&&ASu%"+E)-Y+A,R";Fs\a/5/?/79D*3<)$%;
=A;I?<(0ng/6,Y=3"63h5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?<
<(8hV$4R>;67sC!@VTIaF<G(3A7]fk$<L#$6p3Rb%16'';cGn@0b"I[;GU:h4ZY>-$<'qr<(/r2
1CX[c5snOG4ZYD/$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF!,C=3ZqL";FE'878m/:
7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO
:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"+E)-Y+AY<r771$L6OaB3@:X:cC-=U^3Zp",+BplL
.P<@s><3lX+C-+$/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&+=84M
@<?0*E-6&.FEM#6Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O6V(*R
4ZXr53\E!3/5SW3845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^kDIdI!
B-;,1+D>\7F<F@X%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h4Wn#Z
I45U4%13OO:-pQUAU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRs
%16imF*)A0FD*fu><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[/g*tV
<(KDG9I;n3$;No?+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQUC2[X(
H#n(=D/`p*BHV#1+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,XoARlot
DBN\4A8c?<Bkh\u$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.C2[X(
H#n(=D/`p*BHS[;De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*F(KB%
Df00$B.dn5F!hD(%15is/h1FMA7T7jASu$iDKKq/$>OKiA8bpP67sBqDe*Bs@P2A0F!*%d+Co2,
ARfh#Ed8dG@VTIaF<G(0@<6KN+D#e>ASuR'Df-\9AfrL:De*p2DfTD<%15is/e&._67sBKBl[cp
FDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"ATJu&Eb-A3E+NouA.8l@67sBh
DIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q@ruX0Gp%$7C1UmsF!+t2DKK<$
D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)@:s-o.P>FMAft]"Ch4`"Bl[cp
FDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;:-pQU+<W(L@;^?5DJsZ8
F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;An,XqF(HI:+<Ve:Ci=B++Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1rFD5Z2@<-W9Anc'm%15is/g)8Z
A7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8ZA8Ymp+<VdL+<VdLDIIBn+E(j7
D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(GT\+O+<VdL+DtV)AKYo'+DkP$
DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL+<YQ1D.Oi.AftT"@<6K4DJsZ8
%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs%15is/g)8ZA9)U-A8-',+<VdL
ATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL+D#S%F(HJ(CghC+06DJYAKYl/
F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#Dfor=%15is/g)8ZCi<`mA8-',
+<VdLCi<`m+Co2,ARfh#Ed8*$:-pQU+<YK=@:X7c+<VdL+<YK=@:UL)DfTA2@;]TuD.-ppD]iP+
@<6KCFEqh:Et&IO67sB'+Dbt)A9)6n+<VdL+Dbt)A0>o(An?!oDI[7!%15is/g)8ZCi<`mF*(i-
E-!-ECi<`m+EV=7AKZ&9@;Tt)%15is/g)8ZE+*6lA8,Oq+<VdLE+*6lF!,"-@ruF'DIIR2+CT.u
+ELt7ATJu4Ch+Z#Bl%@%+CT=6@3B#f@r$4+%15is/g)8ZE+*6lF)YPtAKW*<FCfN8F!,(5EZfFG
AnGaeBk;1(+C\bhCNXS=F)YPtAISuA67sB'+ED%7FC])qF<D\K+ED%7FDl22F!,=<F*&OFARf:h
F<G%$@r$4++CfG'@<?'k+C]U=-u`U)CLh-hF=@Y+:-pQU+<Y]9F*)JB@:Njk+<Yc;F*)IGAoD]4
F*2),Bk(jgDKI"AATMs3Eb-A7E+*6f%15is/g)8ZF('6'A8-',+<VdLF('6'+Co2,ARfh#Ed8*$
:-pQU+<Y`6G%G]*Afr3=+<Y`6G%De:AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*n
Ec5t@D.Rd0@:s.m+=KiX6tC4F+ECn.B4W2@0JG(61cZuo$4R>PDe!TlF)rHO@;9^kA8bp)%16T`
Bl8!'Ec`EO@;9^kF*)>@AL@oo%15is/h1CCE+NotASuU2+F#Ii+A,EtA8bp"A7]^kDId<rF<G+*
Anc-sFD5Z2Et&Hc$;No?+Co2,ARfh#Ed8dFDfoq?DIIBn+E2@4AncL$Et&IE8Q&;X;a!0(4"akp
+=A:5:JsS'<(0_b+@f=*<DXf:<Cp.Y+AG-h;GSYL$4R>;67sBkBl[cpFDl2F+Du+?DBO"CAnGb%
ATJtG+E):2ATAo1@<?U&EcVZs6r[)V=@5hH3]oJV?SNZN+B28^8Q[*&:+$JX%15is/g,7MD.Rd1
@;Ts7+DG_(AU#>6BleA=@;]Tu@rH4'Df0-(F<GI>F`&=>@;TRs%14LF3[[<e;H-R;6qL9J=<L"'
;F=2,.6T^74<cL&Ho`B<8Q&;X;]mV</j:p26r[)V=@5gm$4R>;67sBu@;TQu@r,RpF!+n/A0>_t
@rcK1FEqh:+Du+?DBNh*D.Rbt$:IH`:.%0*4?G0&0d%hd=&2^^:.$-u5snOG:.$B<$4R>;67sC$
AS,LoASu!h+E(_(ARfh'%15Kp;GotZ4ZY\e/mg=U-QlJd;FFDO7NbZ!;cHX`7OJWP%15is/g,1G
An?!oDI[6#FD5T'F*(i-E%E,GDId='+Dbb5F<G"0A0>B#D/aE2ASuT4DJsZ8+DtV)ATJ:f-p'I;
;FO&S;]nt,7S-]);FO&B:+%JR3ZpO/0d(j)+@Je!;FXD(/1)u50-EY^;b:(Y:(7O>$;No?.V3L.
A7]^kDId<rFE;28A8PajAPPQE+DPh*D..3k/no'A+>#/fF(96)E-*4>@;BRpB-8ND@rGmh+DkP)
BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-q[9'.1HVZ67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-o
F!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG
+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]LiH$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(
Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\+Du+?DK?pI+Eh=:@WOR>$;No?+<VeNEb&g!
Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^A7Z2W:-pQU+<YQ1D.R3cFE8QI
+<VdL@r,RpF(o6#ATJu3@;TRs+DG^98g%V^A7Z2W:-pQU+<YN0CLq%!D/^U?+<VdLA9Da.F!,C1
C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD@;BFeF!)SJ+<VdL+DkP&
AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+EqpLAU&;>+<VdL+<VeNDfTA2@;]TuFCfN8
+EV1>F:ARP67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuCA8PajAKZ#%DJ*N'
0f:X:0f_6C%13OO@rGjn@<6K4-Xgb.A8PajAL@oo@rH(!F(KB6+<W%?C2[W1%13OO:-pQ_A7]^k
DId<rFE8RL/M/)`@VTIaFE8RKBln#2A7]@eDJ=3,Df-\.AT23uA7]XgBk;>p$4R>1<D?:d;FNlG
6;0g23Zp+!3Zp*c$;No?%15is/g+,,BlbD-F_u(?F(96)E-*44@;[2sAKYMtEb/a&Cj@.>Ddd0f
A0>?,+A*c#Bln"t$;No?+EMX5DId0rA0<QL3\V[t@rc:&F<G(3D/E^!A9/l-Afu2/AKYT'Ci"$6
Bl7Pm$;No?+Cf>-A8-."Df0V=@<,p%F('0)F(T,tA3(/,:-pQB$;No?+<Vd].3M5*BOPs)@V'+g
+Dbt)A7]9oGA2/4+EV:.+EMX5DId0rA0>i3De<^"AISuA67sB'+>PAg8l%htBOPs)@V'+g+Dbt)
A7]9\$;No?+<Vd_.3Lo!FCB3&ATT%e:IH=EF`\a:Bk)7!Df0!(Gp$gB+E)41DBNt2@:V$8EbTW,
%15is/e&._67sBUDffPO+A,Et+ED%&F_PZ&+Cf>,D..<mF!+n3AKYhuEbf5s+EqOABHVD1AISuA
67sBjDf'?&DKI!r68!U78l%i)I3<TL+EV:.Gp$U*DBND"+D"u&Bl&&;AoDg0A.8l@67sC)Bln#2
GA2/4+EV1>F<G.*Bln96F"Rn/:-pQB$;No?+@L?hE$043EbTK7F!+t$DBND"+Dbt)A7]9oGA2/4
+D#e:Eb0<5Bl@m1+Dbb-ANC8-:-pQB$;No?+<Vd\+Z_;"4==W">]aOoE*QprD/aQ+EbTK7/no'A
-OgD3%13OO:-pQUFCAg'+A,Et+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!
-Ql/N/pf'?:IH[\-OgCl$;No?+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u
+Dbb0AKZ22A9;Jo$<L+k:fL.c=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^b
EcW@E@rc""@q[!'@VTIaF:ARU:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7
F)u&6DBO%7@<<W4AR]drCh.T0B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&
@1<QB:Ie;Z4ZXr5B6%r<4s2%%+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6
?RI3D>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXC
Eb0;7GAhM4F!,17+EV:.+EM%5@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ
?RI3P;bp(_6U=C7/12fP+DEGb-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQU
AU&07ATMp,Df-\>BOQ!*F*)>@ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk
$<'_s<E)pd=B%FE-QmANF<Db[+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?
@q]Fp+EVNEDKTf*ATD?m+EM%5@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$
6uQOL-S.Yc9i+eT7h#e7$;No?.V3L.A7]^kDId<rFE;28A8c?\67sa&De*d(+EK+d+E2.*@qB^(
-u*[2Df.!H@;]Tu-u*[2De<T1+DG^9H6@$B@ps1b/e&-s$=e!aF`MM6DKI!KH7'./C2[X(FDl22
:-pQUC2[X(FDl22/no'A+>#/fF*)>@@:s-oDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[W3
%15is/e&._67sBOBk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg@UX=h04np7AKZ&>F*(u1+E_a:A0>u4
+EMXCEb,[e:-pQUA8,OqBl@ltEd8dG@VTIaFE9&W;Isf`@:O"hB-;;0BlbD,CghC++DGm>@;Ka&
FD,*)-Z]_(:-pQUEb065Bl[cq+EVNE@q]:gB4W3-BOr;sBk)7!Df0!(Gp%0MDfT9!AKZ&>F*(u1
/e&._67r]S:-pQU<b6;\+DG_8ATDBk@q@\1$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"
Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%
+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:
+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+
F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(
ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+
Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/
@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0
%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01
@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-
B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVj"C1UmsF!)SJB4Z0-DdmHm@ruc$
$;No?+<Ve>ATVs(Aof(;+<VdLB4Z0-Eb/ioEb0,uATJ:f:-pQU+<Y<<Ch[s4DJUF<+<Ve>Ec6)>
+CT.u+EM[>FCcS4@;TQuCh[s4Et&IO67sB'+DG_4F`_/.@rrh9+<Yc;F*&O:DfQt=@VTIaFE8R=
DBNn@F<G+.@ruF'DIIR2%15is/g)8ZBl8*&E,]B+A0<!;+CT5.ASu$$Bl8**Ecbl'+Cno&@1<Q=
67sB'+DG_:A7]RgFCcR;+<Y3+Ch7^"+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%P<-@qZu-+<Ve=
ATVEq+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G&h/5Cgggb+<VeLE+EC!AKY])G%G]9ARloo@<>oe
$;No?+<VeEATr0+B4P^dF<D\K@rc-hFCcS4ATo88EZfC6B5)F/ATAo(Bk)7!Df0!(Gmt*U67sB'
+E)41DIdHkF<D\K+<YTAASrW!+Co1rFD5Z2@<-W&$;No?+<VeG@<?1#C`jiC+<VdLE+*j%+DtV)
AKYf'F*)I4$;No?+<VeGF`_2>E,8rsDBL&EF*)>@AKZ&-DfTqBDdmHm@rri)G]7J-DIIX$Df0V*
$;No?+<VeGF`_8;+<VdL+<VdLF*)>@AKYW+Dfp#?+CT.u+EM[>FCfM&$;No?+<VeGF`__6@VfTu
+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWG
FED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9
$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28
Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,
-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO
@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc
$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#
%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*
$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6
F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,
6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>bu
D.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1Og
BOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2
ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBm
Bl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!
Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,
E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,Lo
ASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*
ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*
DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/
A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]
9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'
@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO
:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*
F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:*9uQ
%15is/h1FMA7T7jASu$iDKKr7De*s$F*(u6:-pQ_C2[X)ATMs)EZf!H/KeeHA0>u*F*&OG@rc:&
F<G^JBl%L*Bk;?<%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(F;D..]E1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^67sB80kP!+0f1"$C2[X)ATMs)E[`,KDg*=?Ddd0fA0>T(FDi9M
BkhQs.3NGF@ps1b%15is/g)l'DJs\Q3$9VkATMs)DK]`7Df0E'DKI<M@q]:gB4YTrFDi:3Eb/[$
AKWC4E\&>NATB=EFCfN8E+*g/.3N>B+=Lr=De(:+$4R>PDe!TlF)rHOBkhQs-OgDtDe*s.DesJi
67sa&De*s.DesJ;@kB8T8l%htFDl)6F!+t/@<6K4/KeVLFCf?#F!+(N6m-VoBl%L*Gp$U5@<6KB
%15is/e&._67sBPDKKH1Amo1\+EqaEA90d@$;No?+<Y*'A7oq%+<Ve8A7Qg,DfTB006CcHFE8RH
D]i\5Dfp"PF*22=AKW*<+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?
+<Y*/Ci3ZuATJu(Df&rtDIml3DIIBnF!,(8Df$UFEb/j#@;TRs.3N&:A0<:=@W#UkATK:C+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y*/CiX*!F!)T6Cht53@;TRs+ED%*ATD@"@qB0n
@X0)7@VTIaFE8RCDBNh*D.Oi+BleA=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y3+
ChId-+<VeIASl@/AKZ28Eb'5EFCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y<.FE2UK+<Ve>ATT&8AT;j,Eb/c(FDi:5G\(B-FCcR;
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y?6E,KJ7
+<Ve;Ble60@<lo:F(fK4F<G+*F(96)E-,f4DK?q=Afu#$C1UmsF!,C=+=MLa+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<V+#:-pQU+DPh*@:s-o+<Y3'H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u+CfG'
@<?4%DBNk0+A,Et+E(_(ARfh'%15is/g)9ODe*NmCiCL>+Co2-E,8s.+E).6Bl7K)8l%htBOu"!
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'ChFk5+<VdL+DkP&AKYE!A0>],@:UKQ:IH=<Ec6)>
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D/=89
+<VdL+DkP&AKYf-@:UL%@rc:&F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D0-mC+<VdL+D58-+DkOsEc3(BAU&;>Ao_g,+D#(tF<GdA
DId[0+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DJs*2E$-8G
+ED%8F`MA@+CQC/BleA=De:,1@VTIaFE8RKBln#2DJpY/G]7J-DIIX$Df0V=+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DJsW0Ec<-D+EqaEA9/l3EZfI8F*)IGAo_g,+=MLa+EV:*F<G"4
AKYl/F<G:8+D5_5F`;CEDfQtAF_Pr/F!)SJ+<VdL+<VdL+<VdL%15is/g)9SF<D\K+<VdLB4Z1+
+DtV)AKYE!A0>u*G]Y'?Ec5e;ARoLs+EqO;A8c[5+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9SG9A"N+<VdLARoLs+CQC1ATo8.G]7J5@qg$-GAhM4+E_a>DJ((a:IH=8
Df0`0DKKT2DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9T@W#UkATJt:F`(o5F_)\:
DfTr2A0>f"C1Ums+CT.u+Dbt+@;KKtDIIBnF!,(8Df$UFF`V,8.3NYBF*2;@+<VdL+<VdL+<VdL
+<VdL%15is/g)9UEZcJI+<VdLE-67F@;]Tu@rcL/F!,L7An?!oDI[6#@3Bc4Eb$:E+Eh=:Gp$d/
DIe#8@<3Q"DBNM$Bln96+@K!m<D>nW<'sGU9gMNB%15is/g)9WAS,ggD.Rc2F`(o5F_)\:DfTr2
A0>o(An?!oDI[6#DIIBnF!,(8Df$UFF`V,8.3NYBF*2;@+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
%15is/g)9WATi!0AU#=?Eb0?8Ec,q@@3BB#F*&OCAfu&8F<G+.@ruF'DIIR2+E(_(ARfh'+EqOA
BHV22+D#e:Cgh3iFD5Z2F!)SJ+<VdL+<VdL%15is/g)9XG@c"A+<VdLF(KG9F(fK4F<GdGEb$;(
G]7J-Bl7@$Bl@l3Ao_g,+=Lc=@jrO6ART+\EZcJI+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is
/g)9ZF(JlkGp"4PEb0?8Ec,q@@3BB#F*&OCAfu;9Eb'56Ao_g,+=MLa+EV:*F<EtC;FNrP9N`KJ
@;Ka&GAhM4F!,C=+=MI`+<VdL+<V+#:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]m
F!)lGDe*s.DesJ;Ea`iuAKWZ\1b^U80JG480JFpb$4R=j3?^F?0e"5!+<XEG/g+\=F(8X!A0?)0
Blmp-E+*6f%13OO@rGjn@<6K4-Xgb.A9;a.Ci^s5$=e!gDKBB0F<D\R@;9^kF`_>6-OgDtDe+!4
Bl$O2/g+nIA9E!.CbBF:F!*%d+CQC&Des6$@ruF'DBNk0+A,Et+E_d?Ch\!:+EqaEA90@4$;No?
%15is/g+,,BlbD<F^eis@<6K4A7]@eDIml3@3BW&F<GL6+D>2$A9f;?FD5Q*FCfM9FD,*)+E_a:
+EV:.+Cf>1AISuA67sBm@:O"fBln'#F!,C5+A,Et+EVNEE+O'%DfT\;FCB6+F!,C5+D58'ATD3q
+E_a:+EVNE8g&(nDeF*!D/Ej)F"Rn/:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84SATD7$3XlEk
67sB'+Cf>,E,$L<+<Y6?FE1r0AKYK$D/aN,F)u&6DBNk0+Co1rFD5Z2@<-W9GAhM4Et&IO67sB'
+Co%++<VdL+<Y38Df?h1EcQ)=+Cf>#AKYT*Df$Uh:IH=GATN!1FE7lu:-pQU+<Y3/F)W6E+<Ve;
Ble60@<iu+Bk)7!Df0!(Gp%$7C1UmsEt&IO67sB'+CoD#+<VdL+<Y97Ec#6,+Cf>,D.RU,F!,17
+EqaEA9/l%DIal#De!p,ASuU2%15is/g)8ZARlo++<VdL+D#(tF<GL2C1UmsF!,(8Df$Uh:IGX!
:-pQU+<Y6;+<VdL+<Ve<A8--.FCf]=%15is/g)8ZB657=+<VdL+D58-+EV1>F<GLEF<GL6+D#(t
F<GdADId[0Et&IO67sB'+ED%:D]g/F+<YK7F*&OFARf:hFDQ4FEb0E.F(Jl)DdmHm@ruc$$;No?
+<VeID'0rD+<VdLEcl7BD.-ppDfZ?p:-pQU+<Y]HF<D\K+<VeIF`&=D@<H[1Ci<s3+EV19FE7lu
:-pQU+<YE;A8#OjE$-9EE+*s.+C]A0GB7>9+D,P4+E).6Bl7K)BOu"!%15is/e&._67sBUDffQ3
3XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'0JG7>0J+t41H@HE%13OO
@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67sBjF`MM6DKI"7ASc<.FDl,4
@ri(d8l%iG78-N@3Zp+!3Zp*c$:.$tDKKH-FE8Qd+>Ih50l(8S2c"Ws77UN<6=G%N=]@4U<d$cN
CdgcmH?Edu3E.S1;HZ#%0F\@T8oJ63DId='+?L]#CKP(RH$XdZ88DsXAk?rKEE+ed8Ph6[Anj"X
91EQ494Ck(78[lHBgtAt$:8<FFAR!d@ruEpATJtU+>I\91N>uH/O=5E3(%e1<B"bS0L[j?BOt%V
7lN5IF%f&GA2/4LH$!&!@grc4CghC+ATJt:+?L]#CMu4&CfWQ.8kqoa;+#VB<DGDRC342\A6:Zt
D.RNt/SA*dFE_A/G>rVm$:A`BATJt:+<Vdg+>HABF>-BI=Aj!SGA1&6G>Ue&3D"Bi7o42&0hZ+;
BJr^iGY:VA9R'u^1^sd[AT23uA7]Y#;e9H\Bl@l34!68"DE2];3(S0DEbf$&C,[hACNi9DD*pc`
@4bMl;F,1e1IkSoEI)RtEd%s"6tp[Q@ruX0Bk;?.4!67M9ghie6V(ohA8PsH:LYn47;,J@APZcL
67jcF1hK]i@R;nL9K"b!BfHP/8T&WjDe+!#FD5Z2+?L]#0i;Xd76#9Z0L9Vl6pYuO?YX:N@o.J/
CIE893&kYQ;DWK5:2tJ0E(j+<$;tGOARTXk:2b5cF!*Oe0k!CZF?";bA5@2P6W#]rEDfXcC3)+(
GA1K(G!e$(G\g5s/Qt/8Df\]e%16NSA7oq%+<VdL4!67h3Gh2o9L2TI=E]!n:.Iod86AG>G'\<j
6uZg"Am\)DD,*cEB/t!D='5t>@rH4'C*4WA+<W`g0gTMb88E3!C.Crs8lRQGEas<8A3k-0>';c'
C,f1"0PY>uDf&WNBN\8&%16WWC`jiC+<VdL4!67G:b?QYGZeX"2.'3oChRZR3D+C4AOKBU3+d8D
=)]a5;b9MS<C_.6A7l>YA7]RiEc<-D+<W`g0lTHGAnX&%A5dJ);HcP)@:s%d@5hP9>%UZM=Z/0.
BPo^sH?OITEA^p&%16W[A0<!;+<VdL4!68'/Mfn*Dg"-_=#a_B758pu<)-S57VI'>7;Zm/?VWCs
1e06A3(u8D8kfa%A8-+(+<VdL+<W`g0jej&AN*5+:/Wog9/B7c9P$V4G@>N5G]n$qCN+>pA7JYS
=Z&ik=[?)$%16W`C`jiC+<VdL4!67uD.b[oEahgh6t%l=7S7cH<G,oFF`UVWG&2J#2K*M/BP_0h
0iiO"94n\@A8bs#+<VdL+<W`g0m[>5G&K)e1hJ[?9Mei3<,tT#6!7uD2G-qj:NT)r8TRLBCjBhb
H8795%16WbF(KG9+<VdL4!68(77;8Y<_Rfp<`rceG>^A5<`rm/EH688<Cp891fm=(0R@S/:J42F
8nSS?ARlo++<VdL+<W`g0i2D#6T@Y.BM(m;<Co&.CN"-'BN'.g@m`XdCMl^'Gt)UJ85N5aA6C`d
%16Zg+<VdL+<VdL4!67L=`%b16T&FI7;R$e;fcJOH$*g\:,#==94Bo,:/Ot[6<,^=B3&&7Ch!n]
B4Z0-+<VdL+<W`g0ii'A:f27D:dmrSE%k3a1hB'`7mq!&2+V[P<+0fD:j,r3Ed:#,1.aH"%16`Z
FE2UK+<VdL4!67j<DkhN9M&8P:ffYjAjKNjCijr:6?QID0l'*U;IsBZ;H@dSG#qd<G#8\UB5DKq
F!)SJ+<W`g0lo0Y6"Vfd>&J@m@m`Rq;FF5P1/1S>;cH82>%00h6t&PR9kdsS=DD_5%16`gE$-8G
+<VdL4!67e6=kF:@T,g)6:O:aEcu>:<c1u<AhZhN=Yha*E^j#;H=q=q7s7UPEbc*kB657=+<VdL
+<W`g0f(XT@7rFr;b1##@s2Tj<,,6.2`Z2*DJN?F1ML\c1J:>`1M:?3<H1TO%16cbE,KJ7+<VdL
4!67]C2I*W=DqPCEcl[^964!":2*HTEDpn'A2\:9A79"7@X(ggA4^o(CI&C:C2[WkB4W2.+<W`g
0k`F<Amo[l:Gcm.68DGb9NPt>@7"Eu6#("*CdE1qAS<Yh:/*`i8l0+k%16igA8#OjE$-8G4!67s
3FmDRH#6_:EB./jCN394F'<!(<d.S"7Sn>/AiNFoCfPXu;b:b&3-Pf=ChFk5+<VdL+<W`g0eG4X
D,tF?D.bPABkg@E=Dqka;`8buEd:D;7la@2847cGE+_^#G&h(e%16oi@qTh$+<VdL4!67E<bQGZ
=E8M%<A[*4D`)Q.0QUlF6:jgg76"C[H;$,.:gm-qAjJn"8OX'qD..3k+<VdL+<W`g0l:NG9K>'d
6r%]5De3Z<91+#<E&0187Wq[>@mrq39lWi^DFH9u9PRX=%16rgF!)SJ+<VdL4!67d;FP>"@<6'T
H8f_%/RhOb:JjeV7kuYgGqgm,=^cPJH!3dX@l$GcDcI5RDIn$&+<VdL+<W`g0eu%)CKa2#6r%/E
Cd^R(2DR0^GVVfk3+ZqsCh.cE1g*478n:D9;dX*=%16ukFD#W5+<VdL4!68#=$gn;E_TD(1iQkW
Gu\Q[:,bd52J$uCC-c$BD-2*N<AIZM:cMNC7o9^&DKI!D+<VdL+<W`g0em0696s$B7sB/hD+cfT
7osb-0m[_`6!ne[GXQ3sCGRhfDcKPA=_i(s%16us+<VdL+<VdL4!67;BP2<C3C-:sD)5X8CH#6m
GAB/n5rD5OA28-j6oA.;88:J85uBCQ8TtUNDe't5+<VdL+<W`g0lp'+8S'h]BkD0W;Is`<@;fsU
758ds2aThg1ikU%3DF3JF_k);:,cfB%17&_@r#Tt+<VdL4!67g<AJ&t@S/sa2/Q5j<&dBk<&RcX
:ieE^C2ZKt8pEsB<G5<U9kmdI=(;[HE,m'D+<VdL+<W`g0l;/'FA>Fu96t\LF&=blCf+Y%2Ju$1
8RY/#0f;d0/Q,2D;f?SH@8:8t%17&sF<D\K+<VdL4!68#BNehY:3fE%9ic77@::a,AOC3>F&"Vc
C2S0=<b-&b:IK%[F`0],2H^IrEb/lo+<VdL+<W`g0i(.n<DHR^AQ!J>@n]j8:c33-=`?>nCNsf/
Bf(-^2`FoN7V>n60gRC(%17,eF*(q8+<VdL4!68$Cf4D.EcQ2F@WsY.7o",K88r*!E)9SIBj"S3
DDG6\Gr8!0=]IC>?ZQY`Eb0E4+<VdL+<W`g0lg$#?W'3L6!.Z<1/CV><_RU.7RM/gG==2@C26U9
0k"cmFZ4PDCb]`l%17,eG&M80GT\+O4!68&77U3OGAVV':M46!D0\lX3,(`>F[KV-=\pkh:M=8n
7<_45EG%j#D++m@EbupA+<VdL+<W`g0i1GY:NoK>:el1Z84@;s=#)He/M2*\6"_ckFuaYSAPGT^
>!ZV1EGf5g%17,tF<D\K+<VdL4!67Z<&\8rBgX[Y;,U4eE_(D"3,VSkG>;:d<\dWQH9kYD3,1<;
>#7"mD-7;TF`V,)@X0(=+<W`g0hb_I<bX-b136$*6W,U);+PDD2L.2JG%+fOB3K4>9NY&46!.W,
F)Z.Z%176!ATJt:+<VdL4!67Q<CTGn1O3ChBif+M0MXMX9R/45A2ZGB:GP[[AoVa7F_imG6=rqn
3COAa.1HUn$;No?.V*+0ASu$iDKKqBA1]AUA7]^kDId<rF<GdGEb'56%13OO:-pQUA8bt#D.RU,
@<?4%DBNe)Ebce0DfQt/F)uJ@ATJ:f5uU]^9gquT5uL?=3[\?WF*2>2F#kZX$4R>;67sBkDe!p,
ASuTuFD5Z2+DkP-CER5-EZee5FD,T5%15C$<(Ke_9gMZM4ZXs!F`_;8E]PQW$4R>;67sBkDe!p,
ASuTuFD5Z2+DkP-CER5-EZek4ART[lA.8l5;FNlN779j9;G0/6-Y%1.@<?'k3[Y@D%15is/g+\C
@s)X"DKK</Bl@l3D..I#+D,P4+Cob+A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15L+5t"F5;G0/6
-Y.L2A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZf4;DII&uBQ\3*@<-'jDBNA*A0>H.
@;Tt"ATJ:f9i"MM6qosF90G<`D/X<#A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfO:
EaiI!Bl+:d<^fnQ5u^EM9gMZM4ZXs6ATD6gFD5SQ-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4Ec5l<+EqaEA9/1e;GU(f=&2^^;b]PU90G<`Ec5l<GAhM4F#kZX$4R>;67sBkDe!p,ASuTu
FD5Z2+DkP-CNCUM+Co&&ASu%"+E)-?DffZ(EZf4-Ebf_*$:IZW<D>nW<)#YV92du7+@/q)<D>n\
9gMZM4$ckG85E,X5uL?;6W-?=<(02L5uL?;6s2fD9gMZM4&&LG5t"F5;G0)P78cH<<(TeY5uL?;
;GU(f=&2^^;b]PU9+;4;$;No?+D>>&E$0:DC`m\;AS,Y$+:SZX;G9nV=?S\mBQS?8F#ks-A8bt!
/n]*@B5D-3@rH3;A8bt#D.RU,04Z^`%15is/g+.l9Me2\4ZX]5BQS?83\N-sDe!i@B5_^$Ch55/
Df%..Bk;KQA8bsL6p2n,$4R>;67sBoASc<.F`MFDF*2),Bm:'o<DlLh<EMCF-SK%ABllRQCcu?I
?WC#L-OgCl$;No?+EM+9+CoD#F_t]-FCeu*GAhM4+E_^@F!(o!:-pQUA7]@eDIm?$Bl5&7F`:o4
@r,RpF(KD8+<`-_.6T:+6W,%8AoqU)F*)FF@V'.iEb0<6EZee,Cij]3D'3@uCiOT9FCcR;%15^'
6qBa?:d$i^Ho`BYCi"36Bl,1L4s27$4!u@aAS,k$ATMs6+<W`g-T`\&@:jUmEcZ>C.4.5$-t-q.
FE2)4-8%J)4?G0&1*B1b6qBa?:`q>B+@B$U+=nil4s2sf;G:"h=:GU0:II`B9Mdl5+=JX#<DlLe
7T_)^/1)u5+>J48:II`B9Md/\-o!0!+A,Et84?3K%15^'6qBa?:d$i^-mq;QDe)[QB4WGP-YRUD
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0./2"/kSo-84?3K%15^'6qBa?
:d$i^-ndV(0RHDf6qBa?:amN6+u(34:II`B9Mc0*%15is/g+YBD/E^!A0>]&DIjr1F`2A5F!+7W
+Co&&ASu$iDKH<pEHF?)+C/Ac@Vg%,DffPU/kJN68PT^%%15is/h1FMA7T7jASu$iDKKq/$3  ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>Gf73Fm&<FCfN8.V*I-FCfN8+Ef=g+EV19F<G[:G]Y'?DfQt2De!p,ASuTuFD5Z2
+=Lc=@jrODATD64$49RH@q?d*E,TV:@3BZ+D.Oi3BOu3q+<Yl:F!+m6@VKp,De:,)Ec6)>+CoD#
F_t]-FCB9*Df-\>AU&;(FD,*)+Eq78+CTJ+F_kl>+D,P4D..O.ARmD9<+oi\+CQC6F`:o4+D>>,
D]iOuD.OhuCi=3(+EV:*F:)VoG\(D.@3B6%EcPl'Ch4`&DfTl4@VfTuBQ%p3Bjtmi+EMC2Ci"A>
D.Rd0/d_qbBPDN1FCf]=+DGm>@<6L.@qf@nARlp-Bln#2FD,5.Ci=3(+CoD#F_t]-FCB9*Df-\9
AftM)FCfN8$?Tj#F=n\-F<GdACht5'AKYT'Ec#6,FCeti$;#=^F(&TiASuQ3D.Oi3D]j+CARTBt
FCf]=+D,Y4D'3M+FD,6++CT.u+F.mC+EVNE@WcC$A0>u*F*%b!@<6"$+D,P4+EV:.+=Lc=@jrOD
ATD6&@Wcc8+A!\mF`VXI+C\nl@<HX&+<YT?Cj@-GEb0'$@:F%a$?L,tFE_/6AKZ).@<<W&De3u4
AU%WnFDQ4FGA(E,+DGp?@r,RfD0$hAD]iS/+DGm>@:NeYE-,MtCh3rqD]in8BeB`"<+oue+CT)!
DfTQ6BPel9@<3Q"A79G!ARloqEc5e;@;[2R:eW!?ChI[,Bln$*/g*`-+ED%5F_Pl-EscSpB4rE/
E+NTk+C]8-Ch7$m+<Y--F<GF/DJ='4CghF"Df-\+DIal(F!)TCDfd+1F!,%+An>IoBm+%pBl5&'
F`MM6DKI!n+EMgLFCf<1+CT=6BlkI?BlbC>Bl5&7Df'&.+@/gt+EMgLFCf<1/g*PnF)Yi8AI;$W
F!,@=DCodGFD5T#C`m2*DerunDK?qBBPDN1G%G]'+DGm>F*),4C`m=uF*&O9DJsZ1BHVD8+C\mh
Ao`$.FCoZ3Cj@-G@;p1%Bk:g-+AZkt+DlBH1b^UX86R,Y:/i?Q@:NtbDIjq5H#IgJ+Ceht+DkP&
AI:1H/2/b3+DbV,B67f0Bl7F$ARTXoDJ()4AT2Ho@qBLgDKKqN+=M>FAKZ28EcZ=F@psFi.4cTU
DBN?p0d%TUAS5F\H$!U?+EMXFBl7Q++DG^9+CT5.Ec62:D..NtCj@-GDf0,/+EM+(Df0)<+<X-l
EZd(j0FDT0Ci<d.FCcS9FE2)5B6,2;H#RJ-@;I')E+O&uFD5Z2F!)T8Df'H0ATVK+BlbD5ATMo8
FD,*#+<Y)"FCf?3BHV5*+EM+(Df0)<$49aGBlbD2F!+m6FCfN8+E(j7FD,5.Df0,/E-624+EV:2
DJ()6BOQ!*+DGm>@r,^bDBNA*A0<",Eb/eh@;]Tu+Co&,DeW`)+E(j7+<YlA@<<l<+<Y6=Bl"n7
@;]Tu+C\bi+<Yr@F<D]IFD5Q-+<Y`DD.RC!G7&A%Ao_I(BPD?s+CT.u+EM+=GqKF2A9hTo3ZoPT
CdVlEDJ*Nk+?_>"@r,+QEbAs*F!+t+@;]^hF*)FF@r,(cEXE-\+<XEG/g,@HGp%3I+B;0.6Vg*=
+EMXFBl7R)+CT=6G@bT,$47muF^o)nEcXAr+E]^f0ebC>+=eRK/g*#*0H_K567sC'DJ<U!A7Zm)
FE2)5B*ob(A79RgFEqh:+E_1-@<-E3+<VdL+<VdL+<Ve%67sB/A79RgFEqh:.3N5CDf$V3+E2@>
Anc'm$47muF`V\70Kh$2-o!D0.qpUj0e%Hl@q]:kF!)T#67sC%F^fE6EbTE(Esa$4F`V\70g.-3
-o3S6.qpUp.=62IBOPq&$6UI%@<>q"H#R=;F`V\70FApFA79RgFEqh:+E_aJ@PJ2s+<XEG/g,4W
EbTE(F!,R<@<<W9Bl%T.DJsV>De!:"EZf(6+EV:.+E):7B5)6lC^M:-F`(c70Kh$2FZLX%0JG7@
.qpUl1C>6IF`(c70g.-3FZLX&0JY@A.qpUp$47mu.kWItF`(c70H`e:+E_1-@<-E3+<XEG/g,%M
F<G:8+E_1-@<-Dr+<W0e0-GCTATojO74o^*@q]:kEs`6s+E_1-@<-F,ATp9i+=JTj-S0C]F^d$U
-SHhuF`(c70J"S)-S0C]F^d'V-SHhuF`(c70e"5TBOPdkATMs6+E_1-@<-Dr$6UHA/h\>iDIn#G
+@Rn*F^o)nEcZ,0G9A#'67sBuDg*=<DBO"BEbTE($6UHA/h\>iDIn#H+@Rn*F^o)nEcZ,0G7"Za
$47+I$47+I$3                                                              ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' doctest dispUnicode001 doctest''),(<<;._1 '' jodbasictests '
zz=:zz,'delBasic001 didBasic001 dispUnicode001 dnlMacroTexts newdBadArgumen'
zz=:zz,'ts001 notopenTests001 zzzJodDictionaryReset''),(<<;._1 '' jodmanwinte'
zz=:zz,'sts newdManWin001''),<<;._1 '' loadlargefeasiblecase createtestdictio'
zz=:zz,'naries loadtest001dictionary loadtest002dictionary loadtest003dicti'
zz=:zz,'onary loadtest004dictionary testdictionarypaths''                   '
zz=:383{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.1+>P&u+>GW+3?U%4+>GQ10H`),+?256+>PYo0ebLFA8bt"ATMrg67s`uDe!m#F*&OH/M/)e
ATMr9F*)P6/db??/db??/g+,,BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=+B3#gF!,R9F*&NW
/hSb/+D,P4D..O.ARlp*AU&;(:-pQU9lG&`+D,P4D..O.ARlosART+\EZek1D/Ej%F<G[:G]Y'M
BOQ!*+EqO9C`jj0AKYT'Ec#6,FCeu*8IA3Z/g+hGE+LXE+B3#gF!)TIATMr9+>,9!/hS7h+D,P4
D..O.ARlo+FCf]=+<XWsBlbC>FCfN8+<W9h/hSa`:-pQUAoD^,@<?U&A0>u*G]Y'&DfTD3AoD^,
@<?U&A0>Ps@:Wqi+Cf>,D.RU,+EV1>F<D]JBOQ!*+EqO9C^Np(/g+V7+D,P4D..O.ARloT+D>\4
AM,)J9jr'f+D>1o+CQC/BlnH5AKYetD.4W3BQ%s'+D,G$ARf9oG@>P":-pQUGA(]4AKYE&+EMF=
G9AI[@;]TuDJsV>GAhD9+EqL5FCcS(F`\a9De!3iDIjr7BPDR"/g+;8FWba:AI;1!/g*ksEd8dO
@<3Q"+D>[G$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB'+<VdZ/hSb!F`(f0Ec#6,ARlp*AU&;(
:-pQ?:-pQU@rc-hFCeuD+>Pes;e9nj1,(CA+>GQ21c[TS1^XRb67s`V;Gp:g4['u:GAhM4.3N52
Bl%i5Df-[M/hSa`:-pQU1,U1QAT/bI0JGI/0ebXF3BB#S$49Np/h0=^=?Shj@rHC.ARfgnA0<KW
/hRJ<:-pQUF(Jj"DIal!Ci<g!+EM47F_kS2Eb0)rBl5&9DKKf>@q]Fa$49Np/h1CM@ru:'F<GZW
/Kf.HF*&OGFEM%F$;No?$;No?+B3#gF!,R9F*&NW/hSb/+D,P4D..O.ARlp*AU&;(:-pQU<+oue
+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]X9f67sBTDfTD3AoD^,@<?U&A0>Ps@:Wqi+Cf>,D.RU,
+EV1>F<G[=@<<W9Bl%T.@V$ZoDfT]'FED))+A!\hDfB8?$;No?+B3#gF!,R9F*&NW/hSb/+D,P4
D..O.ARlp*AU&;(:-pQU<+oue+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]X9f67sBTDfTD3AoD^,
@<?U&A0>Ps@:Wqi+Cf>,D.RU,+EV1>F<G[=@<<W9Bl%T.@V$ZoDfT]'FED))+A!\hDfB8?$;No?
+AH9bGp$d/A0>;'Ch\!5Ch4`*@;THrGA(o9AKYT$AS#@_+Eq78+EqL5FCcS'F!,OADg*<U+CT.u
+Du+>$;No?+EqaBC`mq8Blmo/@Wcc8@rGjcBl7K)GA(]4AM,)J=`8F*F(Jo*9jr'f+Eq78+CQC+
D_;Al67rU?67sC(ATD6gFD5SQ$;No?$;No?+<VdL+>,9!/g,:SAoD^,@<?'k+EV1>F:(c0/db??
/g+YEART[lA3(hg2'>h/E$-ni0K:100KM$N3]/`$$@-Q44Y@jk/g)nl1C=J"Bldp0F*'Pt+=D#;
-OOU,A7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPkF(o,,8l%htFCfN8
F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MWATMs.De(ON+CT.u
+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/:-pQB$;No?+CT>4
F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)
E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@ltEbT*+3ZrKTAKZ)+
F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sBjEb/[$ARmhE1,(C@DJs\R2[p*h
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB72e6K00Jst]A7T7^+=M,GFDl,0DH(1gFE9,i0e"5eD]j+DBlmnq$;No?+>>`b
ARdGM+CSekARlo3A8Z3X@:O=r<+U;rF"&5RD]j+DBlmo//Ke"];cHmc9he&S4ZY8+$;No?+>>`b
ARdGT+=Lc7A3s^GBk&hN0e"5RA7T7^%15is/g)i-De!lC2^!3bEc,T/B-;,1+EqL5FCcS9E+*6f
+E2@4F(KB8@<?F*+EVNEF*(i2F<G[:F*)I4$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A,Et+>>E.
/i5($FCfN8Bl7Pm$4R>;67s`uAT23uA7]Y#F!*%WFCfN8+E(j7-td(%E-!HNAoD]4F*22=AKYYt
@:Wqi%16'';cHRZ;GAi"4ZY8+$<0Gm<*;L]9gqrC3`JOH<)>kY9e\:E+<VdL:-pQUF(KG9FDi9V
+D,P4+CT)&+Dk\2F(&]mEt&IO67sa!DId9hE+NotASuU2%13OO:-pQUD..]4DImBi+EVNEB4Ysl
Eaa'$+=LuCA9;C(FCfJA%15is/g,"IF!)iFDe*s$F*(u6-QlV9De'tP3[\Z\A7T7p+DPh*+E_d?
Ci^sH>9G^EDe't<-OgCl$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO4tq=>+E(d5-RU#Z+<VdL+<Ve%
67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f4tq>%A0<7AATMs.De(OL+<Ve%67sC!E+No0
F*(i.A79Lh+AtWo6s!8X<(.oXFCfN8C2[W:.1HUn$7InX3]&Q?+>Fu]:-pQUF(KG9GA(]4AKZ&5
@:NjkE,oN2ATDs&FD5Z2+E)-,$4R=O$>OKiD..=+Bl8$(F*)Iu67sa&De*]nDKff4FCfN8F!,NU
/Kf+WBlmo/De:,9Bl7I"GB4mKATMs7+Dkh0Bk(jpB-:c1@;Tt"ATJu.DBMPI6m-#Y@s)X"DKK</
Bl@lA%15is/e&._67sBVE+Np.+CQBj76s=C;FshV+EV19F<G+.@ruF'@<-W9.!0$AFD>`)0I\,Q
DIal1F`)7C@3BW&EbT*+%15is/g,(E+C\c#Bk&90Bl7I"GB4mFEbT*&FCeu*FCfN8+EM%5BlJ08
+EV:*F<GF7D/!K&AU%X#E,9*,%15is/g+kG+A,Et+CoD#F_t]-FCB9*Df.TYF(Jo*C2[W8E+EPi
$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is/g)8Z0e"5dFCB&t@<,m$8g&(nDe<^"AISuA67sB'
+>PAg-u*[2FCfN8ATB4BCi<`m+EM%5BlJ/'$;No?+<Vd_.3MMW5t"dP8Q8,$FCfN8+Co1rFD5Z2
@<-'nF#kFbAS!!+ATMr9-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7+:SZQ67r]S:-pQU@rc-hFCeuD
+>PW*0lCoQ0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFtks!-uNU?A5-KM=(uP+0JP"!@:Wn[A0>u4+EM[>
FCbmg%15is/g,">Gp%!9ARlp*D]i\(DImisFCcRCC2[X)ATMs)E[_G):-pQUD/=89-YdR1FCfN8
ATB.@>9Iip+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$4R>_AT;j,Eb-@@C2[X)ATMs)
E[M;'%159QHSZd_A0<6I+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%159Q
HZ*F;-Zip@FD>`)0IItc+AP6U+E)41DBO"B@;]UaEb$:j76s=C;FshV+=M>CF*)/8A2#GA$4R=j
3?^F?0e"5"+<XEG/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hp^$4R>YDdd0m@<-!l
An>ClBjtmi@psFi:-pQ_Ci<`mCgh?sAS,L^F(o*"ARf.iAKZ(H/KeMFBl%=$+>J*`A8,OqBl@lt
EbT*++D,P4+EV:.+A>6l/db??/db??/g*N%ART[lF!+n/A0>],@:XF%FD,5.A8,OqBl@ltEbT*+
+E_a:A0>T(+EV:.+DbJ,B4W2tARTXo@VfT_:-pQUFCfN8+Cei$AKWBp7RJUW+B3#c+A>6l+DGm>
Bl8$(DId<h+EVNE@V$Zj+Cf>,E,9*-AKYQ/@;Tt"AI;1!/g)?YARTXuDII?jAKi7=ATMr9@psFi
/g+,,AKW*h7RJ:@BOPs)+D,P7EZen,@ruF'DIIR"ATJu<Bln"q:-pQU0eb:8+>Y]*0HbRXEb'56
Df-\++E1b2BJ(E,BPDN1BlbD6F^o)-Cgh?sATAn9FD,*#+<YcOE+rfjC^Np(/g*b^6m-GhDe`in
FE8RHBOQ!*F`V\6Ci"A>BOQ'q+>P&^DfQsC1E^4B@ruF'DIIR"ATJt:De:+7FD,4m:-pQUE+*j%
+EqOABHV,&F)rIGBOPd$2)$^,GAhM4F!,F5EZen,@ruF'DIIR2/db??/db??/g,=KEaiI!Bl,m<
:-pQ?:-pQU<+ohcFCfN8+Co1rFD5Z2@<-W9@rc-hFD5Z205PQ8A0>r'EbTK7F#jY'67rU?67sB'
+<Y07ART[lFCfN8A8,OqBl@ltEbT*+$;No?+<VdLCi<`mFCfN80JG4lBk)7!Df0!(Gm[;5/g)8Z
+Dbt)A9;C(F>,C(A8,OqBl@ltEd8!e67sB'+<YK=@:XIkF*')i1Lt30FD5Z2@<-W#:-pQU+<VeC
Ddd0uATMrI0Jm<S@ruF'DIIR2$;No?+<VdLFCfN8A8,OqBl@ltEd;V4FD,_&:-pQ?:-pQU+<VeC
Ddd0uATMrI0ed-P@ruF'DIIR2+AP6U+Du+>+E1b0F<GL6+A>6l$;No?+<VdLCi<`mFCfN80eb:l
Bk)7!Df0!(Gp#jK/g,%MF<GO2Ec`FBAfsc:6OHRT/db??/g,"RF*&O6AKZ#9DBNY2+E):2ATBCG
+B3#c+DtV)ATJu&Eb-A'Df0W<Eckl6ARlp)D]j.8@<<W&AS,@nCig"Z67sBQ+CT)*BOP@]FD55-
F)Q)@Bl7Q+E-68D+EV:.D'3P1+Cf>1Eb/a&+E):2ATA,Q67rU?67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EXGQ./g+YEART[lA3(hg0JP;"Dg!lk$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$?B]tF_Pl-+=Cf5DImisCbKOAA1%]k~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ALu3&!:%De!m#F*&mBDe!m#F*&OJ/M/)eATMr9FCf]=+D,P4+CoD#F_t]-FCB9*Df-[G
A8bs,+Eh=:@P.upGA(E,+CQC)Eb/ZpBl7Q+E+*X+Ci<`m+E(j7DJsE6ASuR#/g*_.@;R-.@:UL&
D]j(3E,Tc=+EV:*F:)GmC`m\;AThd+F`S[6FED)2E-*4ED]iY1Ec#6,+EV:2F!)T=Bk1dnF`S[6
@W-*tDIIX$Df-\2@<Q2hAmoCiARmD#$>j^!@:VDA+Cf4TBOPdkARloH/g+Y?<+0f[ATVu9A8bt"
ATMr9@r,(cEXE-\+<XEG/g,@HGp%3I+B;0.6Vg*=+EMXFBl7R)+CT=6G@bT,$47muF^o)nEcXAr
+E]^f0ebC>+=eRK/g*#*0H_K567sC'DJ<U!A7Zm)FE2)5B*ob(A79RgFEqh:+E_1-@<-E3+<VdL
+<VdL+<Ve%67sB/A79RgFEqh:.3N5CDf$V3+E2@>Anc'm$47muF`V\70Kh$2-o!D0.qpUj0e%Hl
@q]:kF!)T#67sC%F^fE6EbTE(Esa$4F`V\70g.-3-o3S6.qpUp.=62IBOPq&$6UI%@<>q"H#R=;
F`V\70FApFA79RgFEqh:+E_aJ@PJ2s+<XEG/g,4WEbTE(F!,R<@<<W9Bl%T.DJsV>De!:"EZf(6
+EV:.+E):7B5)6lC^M:-F`(c70Kh$2FZLX%0JG7@.qpUl1C>6IF`(c70g.-3FZLX&0JY@A.qpUp
$47mu.kWItF`(c70H`e:+E_1-@<-E3+<XEG/g,%MF<G:8+E_1-@<-Dr+<W0e0-GCTATojO74o^*
@q]:kEs`6s+E_1-@<-F,ATp9i+=JTj-S0C]F^d$U-SHhuF`(c70J"S)-S0C]F^d'V-SHhuF`(c7
0e"5TBOPdkATMs6+E_1-@<-Dr$6UHA/h\>iDIn#G+@Rn*F^o)nEcZ,0G9A#'67sBuDg*=<DBO"B
EbTE($6UHA/h\>iDIn#H+@Rn*F^o)nEcZ,0G7"Za$47+I$47+I$47+I$3                 ~>
)
showpass 3 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
