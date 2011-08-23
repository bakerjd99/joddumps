NB. JOD dictionary dump:  7 Jun 2011 10:03:26
NB. Generated with JOD version; 0.9.3; 7; 7 Jun 2011 08:41:27

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

JODTOOLSVMD=:'0.9.3';7;'7 Jun 2011 08:41:29'

JODVMD=:'0.9.3';7;'7 Jun 2011 08:41:27'

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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

NB.*testenvironment v-- sets up the current locale for running test cases.
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
testpass=: ]`showpass@.(TESTYAMMER-:1)

NB. test utils !(*)=. err er ner
er=: err@:testpass  NB. expected result
ner=: -.@:er        NB. negative expected result

select. type
case. 'bad' do.
  err=: [: -. 1: -: [: > {.
  1
case. 'good' do.
  err=: 1: -: [: > {.
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
1c-m/3&2U3+?(E$3$:%#0fC.6+>Yer2]sn8+>k9"1E\D/+>kns0ea_*2BX_4+>P_q0eje,0d&@s
1,9t,0H`2,+>GSn1Gg44+>Ybq2'=e2+>t>s0H`1p1bg+0+>Pes3?U(5+>b2r2BX_.+>PVn0f'q/
1a"b#0f^@21*AD.+?1Ju3$:4(0f:(5+>Y\o3?U+4+>G\q1GU(-0H`/.+?1K!2]t%%3%uI4+>l#!
3$:":+>GPm1GBq1+>PYo2BXk8+?1K!0d&Ct1bp14+>bqu0ea_-0H`+n1,C%3+>Gl!1*AS"0esk.
1*A;++>Yu"1a"S6+?1K"3?U%4+>Yu"0eje.2'=b!2)HF6+>tqs2]st7+>GSn2)6:/2BXk5+>G\q
2`Mp=+>ttt2]sk6+>t?"2'=b!2)?@7+>c#"3$:%4+>P&q2'=[t0fC.0+>Z##1a"P1+>GPm2)l^6
+>bnt1*A>4+?:Q&2'=n%1c$70+>l&"1a"V/+>GSn1,^701E\J-+?:Q%1E\D0+>c)$3?U(7+>GVo
1,pC8+>bbp0ea_00H`=t1H?R40H`2/5uU-B8N8SOBOu'(0d&b\6V0j/2'@!PG]Y'KAT2[$F(K62
@<?4%DBNY7+E_a:A0>T(+CoV3E$/b,Ch7Z1/KeS8AmoguF<E8(=]@h!H$!U?DfBf4Df-\-De*EI
<D?:a;b&WeATDj+Df-\:Eb/isGT_*>G]Y'?DfQsm:IH=9F_u)=6rcrX<'a#r@:sX(8l%htA9Da.
+EM%5BlJ/:Eb/^&Bl%<&@rH4$@;]Us8OccQ:.cXMH#n(=D'3_7F`&=CATT&*F`M26B-;/6De<^"
AKYf-@:X(iB-8cK0d(CP+EqO;A8c[5+EMgLFCf<18U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1
Amo1\+EqaEA9/kF+Dbt)A7]9oBl8$2+=Lr=De(:>Ci<flCh61a8l%isDf9H58l%iS:JXY_+F5/E
DKKH1Amo1\+EqaEA91=g8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`
;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#
@<?'U79;lQ6WI#X;f6/j+A,Et+E).6Bl7K)BOu"!+E_^@F!)lCEc5e;8l%ht0J5@<1+?$c<(KqY
:KKqQ9OqjYE,8s.ARlp&@<?0*A7]RkD/"*'EZek*@<,ddFCfJh6q10S9QbAl+EVNEDf0B*DIjr6
ATDj+Df-\9Afti,A1hh3AlVSl9gqYsF*VhKASiQ-Dfoq?F(KG9A9Dp,DJ()2Ec5Q(Ch4`*Ddd0j
DJ((D+DtV)ATJu-Df^"CF*VhKASkFF9N+qn<DlL5F*2),Bm<WW7Q=CI7Q;N4AU&;>DfBf4Df-\-
De*E%/Kf(FD.RQnATB1S3%n927Q;hu='%(fBl\9:+BN8pA8c[5+A,Et+C]A0GB7>9='&HWCh[d0
G\1Z1F*&O@Bl8'<+A,Et+C]A0GB7>9='&HXF(Jj"DIakkBl7I"GB4m!:IH=7Ec6/CATCjR=$fe\
=&VOcF(K0!@ru9m+A,Et+C]A0GB7>9@:WnbDdd0t@rc:&FD5W6ATDm6+=M)CF"&5EASu("@<?'k
+EM%5BlJ08+DG_8D]j+C@<-I4E+3p!Ch@]tCh[d1ATDj'+E(j7@r,at@WZ*r@q'Ie@q&k_@;]Rd
H[R#GEa`HnATT&(@;K@i@q@\DBl"nT/g+Y5Ea`He@;K@i@q?cmCh%9nEaj-#CgqKrC`mh<+D#G#
De*Ei+Cf4tDfBu6Bl%@%@rH=#ATJti;]o[dCh7ZtEb/[$ARoUfBl[cpFDl2F+E(_(ARfg)@rc-h
FD5Z2+Eh=:@UjFi@<?'qDe*Bm@ruF'DIIR2+E(_(ARfg)@rc-hFD5Z2+Eh=:@UjFi@<?'qDe*s.
DesK/DJ=3,@;KY(ATJu3ATo83De'u4Df9H5+E(_(ARfglEb/[$ASkjsFCT?&@<?(%+EV:.+Co1r
FD5Z2@<-W9D..L-ATAo*Bl%?jEb/[$AT`*/DJ=3,@;KY(ATJu:FD5Q*FEo!I@VTIaFE:r7FD,]+
An?4/Ea`I"+EV1>F<G:8+D,>.F*&OHGAeUNI3<'3Ch[a#FCfJ8@UX(]DI[6g+Cf(nEa`I"ATAo6
F`)7]+Cf414Y@jeF`_;;AS*&pCh.*e3&P5X@rGmhF!*bI6V0j/2'=;b@;TR,FCf]=.3N&:A0<:<
@;TR,@rGmh/9GHJF=A>S@:F%aF(AioH=gSqARo@aBl7K)-u!F7A18X8DKKH1Amo1\+D,Y4D'4%@
Eb$;/BleB,ATMs6Dg?)9A7TCaFD5Z2@<-W9DdmHm@rri(ATMs6Dg<IKATD6jAn,XqF(JitDf]J4
A8,OqBl@ltEd8d>Bl%?kBk2+(D.dEtATD4$ATJu&+E_R9EHPh8AU&<.DId<h+E2@4@qg!uDf-\3
DKKH&ATAo&@<6!j+@fF'6tC"BF*(i4F(AupFD5Z2@<-W9F*(i4BleB1@rl1!@ru:'FC]N2D0[7J
DfTA2AoD]4A8bt#D.RU,@<?4%DBL?<Ddt4=FCfN8Bl7QoDe!m#G][P9Ec#6,F!,:;DJ()&De!p,
ASuT@+E(_(ARfg)@;]TuBOtU_ATAo8AU&<-F_u)2ART+\Eas-$@<?(%+EV:.+CoV3E+Wg#AKYE!
A0?):Blmp-+D>=pA7]d(Bl7O$Ec#6,Bl@m#A7]:cF<G+.@ruF'DIIR2+E(_(ARfh'ATD@#E+Np-
AT)O!DBNJ(@ruF'DIIR"ATMF)ARoLs+EV1>FCf]=Ea`I"BQ@ZrF(KT<Ea`I"+CT)&+C&T#AS-:;
H[R#YAU&;>Ao_g,+B2oS+EMIDEarZmD00<2D/aT.G][P9Ec#6,F!)lK@;TR,FCf]=.3N_@@VfUs
+D,P4+CoV3E+s3&AoD^*;FO&D;FO>J73F0)FCB6++Eh=:@N[6FEb065Bl[c--Zid<CF<_7AS#Cd
F),f-FEMVAF!,(8ARuupBle&CG&M2>D.Oi2E+*6f+DG^9@X3',F(TH(ARoLrCM[^&Fa.A@FCfM9
Ao_Ho+E)-?DJsV>-Z3j?ALAU:Bl8'<+Eh[>F_t]2Ao_HoA8-+#GA1r8ATW'8DK?q4Eb/f)A8-+#
06V8MF_t\4F)YPtAKY])+C]G<ATJu+DfQtEBl5&7H#n(=D0'?4Bk29pEb/[$AKYW.Bk29-@<3PG
2BZISFCcS9FE2)5B6,26DBO"CE,]`9FCeu*8g&2#F*(u1F(]W0A93!.F_PB-+CT=6AU&<.DId<h
+E2@4@qg!uDf-\3DKKH&ATDiQ+D5h2A92u<BeD(^>9IR$Bk2:0+>Y,tBQ%s6F(K<#Df0`0Ecc@F
E+*j%+C$QBF(K<!Eaa'.EcW@FD]j.8AKYr4AS,LoEb/c(BQ%s6+D,P4D/"'8EbTW,@:F%aFCfN8
F!+m6@VfOj+E(j7Ap%p++E1b2BHUo$Ch4`,@;TRs+D,P4+Eqj?FCeliCh\!:BleK=Blmop@VfUl
Bl8'<FCfN8F!+m6@VfOj+E(j7Ap%p++E1b2BHV,*DKU1HAnc'mF!,(5EZfRHBlmop@Vfb#H"h>D
EbTW,@:F%aGA1r:ATMs7+E1n4D/"'4Bl@m104AsEEbT!*FCfM9De:,#+C].sC`mY.+D,b4C`m\*
FD)e/Bl%?'DIIBnF!,(5EZfRHBlmop@Vfb#H"q8.AoD^*AoD^,@<?Q5-u*[2BOu"!.3N,=D/E^!
A0>]&DIjr!DIal2E+*s.F!+q4Dg-86EZf:@+E1k'Eb/ZiATDO(A8#OjE+E[(E,8s.+D>>&E$/b2
EZdtM6m-\lEb'6+De*cuAor09DK?pm:IH=DAnE0+ATN!1F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u
+>=pVFD,6+GA2,0C2[X$DKL#ADBMPI6m-Dc+ED%7F_l.BBlbCO+DGF1F*1u&ATMp)F_i1/DIakD
+E)@8ATE!/F(K**@<?1(AT2^4@;]UaEb&m1ATJu9BOr<*@<?0*F(K<!Ecc#6DBNG&@<,ddFCfJ8
Bl5&'Ci*TrARoq#E+F*.E-!.DBOr;rF`MM6DKI"?@<?0*@<3Q"+A*bt@rc:&F<G10Ch7HuB4Z0-
D.-ppD]hXpF(96)E-*47Ec5e;ARoLs+EqO;A8c[/CiaH%CLnW)Ddd0!F(96)E-,r=B4Z0-D.-pp
D]j.5G]Y&V@X3',F"&5DEc5e;ARoLs+EqO;A8c[0ATqZpEb/[$ATJu&+Dtb7+Co1rFD5Z2@<-X2
ATr0+B4P^dFCT?&@<?(%+CQC1ATo8-Bk)7!Df0!(Gp%$G+ED%+BleB-EcW@3DBNM8FCB'/+Co1r
FD5Z2@<-X2FCeusF<G!7DIn#7FCfN8+EM%5BlJ/:F`V87B-9fB6m,uXDK]T/FD5Z2F)PT-E+Np.
+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+E+*6lF)YPtARo@oATDX%DIml3BkAK0BOu3q+DGm>F*2),
Bk(jgDKI"5Eb/f)F)YPtAKYo/+EV:.+C\bhCNXS=G&M2>D.RZsAo_HkA7]e%ATW'8DK?q/+E1k'
+ED%%A7]d(Ao_g,+CTG%Bl%3eCh4`-E-,f4DKBf>EHQ2AAKXfC5sn(3:J=/F;BRP6FD,B0+Eh=:
@N]]&A7]@eDIm?$A9Dp,DJ()'G\(B-FD5Z2Eb/loEb/ltF*(u6+CT.u+E_RBAS5^uFCfJ88l%ht
A8,OqBl@ltEbT*+Eb0,sD.R<nCh7[)Dg#]5+CT.u+ED%2@;TRs+AYoYAnc'mF)to7GB\7?Ec6/C
ATDm(F*)IG@;]TuF(KH7+EV:.+BMWG+C]A0GB7>9F)Yr0FD,]+Aohp-BlkJ>GAeU7ASc'tBlmp,
+C\bq@;]RdA0>o8DK@i]@Vd/M/g,4SCh\!)Eb/i*@r-6uF*(u2G%ku8DJ`s&FE;#8F!,UE+EV:.
+CfP7Eb0-1+Dbt+@;KKtAoD]4Ecl8;Bl7Q+FCfN8+Cei$ATMs3@<5pmBfItlD]iJ0@qfX:2'?pN
E,oN2ASuTuFD5Z2F`:l"FCfE6@VfagF`:l"FCfM9E-5W+Bk&9,@rc:&FE8RH@:F%aG&M2/Eb/g&
ATW'8DK?q4Eb/f)@X3',F!,C=+Eh[>F_t\4DfQt#:.$.C@<?1,Ea`p'Bl7KjEd)P4E-!.DBOr<&
Bl7KjEZfC6E,oN2ASuTuFD5Z2+E(j7Cgh?sAKXSfDdmHm@ruc7Bl8$2+CQC6ATDKrF!,C5+EM%5
BlJ/:Ch[cuF*DY=FCf0$F*DY=FCfM9Anc'm+EVNEE-67FA8,OqBl@ltEd8d<Bl[cpFDl2FGB\7?
Ec6/CATDg&FEMVAF!+m6GB\6R@WHC2F(KA7Ao_g,+CTG%Bl%3eCh4`-E-,f4DK>           ~>
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
3Ahp61*A=p1,9t,1,:R,0eje*2E3B51,C%51GL",1a"M,2DcO8+>Yr4+>PYo1,Ud?+>GPm1,:^C
+>Gbs0ekLF+?1K#0Jah,0d&;.1GBq+2]sh21b^%-0H`,10JR'XART[lFCfN8A8,OqBl@ltEbT*+
:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9/M/)TEb/[$ATJu*D/aTB+A,Et+EV19F<G+.@ruF'
DIIR"ATKI5$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
0kP!+0f0=H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU1,(F;D..]E1E\7lD/Ws!Anbge+EVNEEcl7BGA2/4+Dtb7+=Lr=
De(:>Bl8$(Eb8`iAKYf-@ps1b%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19
F<G^JBl%i"$9g.jFDYu5Ddso&ATT&C/g+eIE$-NCDe*s$F*(u6-OgE)ATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$4R>;67sC'DK9<$BleB-EZee.Gp%3?F*)/8A0>Ds@ruF'DIIR"ATJ:f5'nn)
6qKaF;a!/a1a$^I+=ANG$8EZ-+@Jdg<)Yq@+>G!XBk(p$6qKaF;[j'g+Bot0BQ&*6@<6K46qKaF
;a!/a.!mQj0d&kU6W?u5+<u=X.kWJ!0d%kq3[]#\F*)/8A1&fK74o]HHS-Ks+@Jdg<)X550d'[C
1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@Gp$O3C`m51EcP`/F<G=:A9;C(F<G+.@ruF'DIIR"
ATJ:f:-pQU:2b5c3ZrNXAKZG:De*s$F*&OFDf9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/
AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YD
CERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN8
0ddD;%14g4>9J!#ASc0*-ZW`?+t"p6:IJ/N;cHXj:K/km+s8O[+>7^^%13OO:-pQU@rc-hFCcS+
D/aTB+EV19F<G+.@ruF'DIIR"ATJ:fATAo2ATqZ--Zip@FD>`)0IJqS:IJ/N;cHXj:K/km>]aOu
FD>`)0II;:ATAo2ATqZ--Zip@FD>`)0df%T:IJ/N;cHXj:K/km>]aOuFD>`)0ddD;ATAo2ATqZ-
-Zip@FD>`)0eat:8l%iS78m/`:JXq@-X:b)F*)/8A2,bc%16Ze+Dtb7A0<7AATMs.De(RV0IJqS
:IJ/N;cHXj:K/km>]aOuFD>`)0eb:/%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!
DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]U5@<6*B3B:FU$=m^a6=FqL@k]Sk:-pQ_A7]RD@<6-m0JG4(F=f'e@UX=l@j#r'
Ch[E&-tHn*.3N_DF*)IU%15is/g(T1:-pQUG%G]'@<?4#3XlEk67r]S:-pQU5uU]^9gquA+>G;f
@3AH:5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.4u&::-pQB$;No?+A,Et+CehrCi^_@
D]j+4FEMOFFCfN8+D#G6Bl\-0D.RU,+>"^EF)uJ@ATJtd:IJ,W<Dl1Q+:SZQ67sBhA7TUr+DG_7
FCB!%ARlolDIak^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.-u*[2A7]p;C2[W9F`_>6F"%P*
:-pQB$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZD/=89-YdR1
FCfN8ATB.-$;No?+<VeCDdd0!-YdR1FCfN8ATB.@+:SZQ67sB'+>G!ZFEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4A+AP6U+CfG'@<?''FCfN8+Co1rFD5Z2@<-'nEt&IO67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(C@DJs\P
0d&%j@rH7.ATDm(A0>u4+DNee0JXb&+ED%2@;TRd%15is/g)o'0emNRGqh)t/Kf1TA79RkA0>K&
EZdt502-(tFa,$PATDj+Df-\9Afs]A6k'Ju67sB90JP;!@<jU^+>"]aC2[X)ATMs)E[`,OAT;j,
Eb-V/%13OO:-pQUFCB<6Des?)Gp%0<EbTK7+EDUB+EqOABK@7Y0HiJ4+?V"o/hSb!E+*j%>\7\d
AM.\3F!hD(:-pQU@ps6t@;L"'+EDUB+EqOABHVD1AKXT@6m-VoBl%L*Gp"MUFEArS-usHJ+EV%7
FDku6B6bVAATMrB%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0F<G!7GAhM4+CT.u+Co&"ATVK+
BljdkBjkk&DfTAO3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B13a68.1HUn$>aI"F*'Q++=A9Z-6tVp
3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>REZf=DF<DrF@;U4,Eb$O?+<XEG/g+kGFDi:4
Bk)7!Df0!(Gmt*lEZen1C`k*>@;U4,Eb$O?+<XEG/g+kL+DGp?Bl5&8BOr;sBk)7!Df0!(Gmt)i
$>"6#A7]R"-Y["+GAhM4-QjNS:-pQUA7]RgFCcS=DfT@t$>sEq+D58-+=Cl3D0Ko=A1&KB:-pQU
GAhM4+DGm>A7]RgFCeu*@ps7mDfd+7ATS@g%15is/g+kGF(KB6+>GQ(+EqaEA9/l-DKKe>A8,Oq
Bl@ltEd8d9DIal#ASbq"AKZ).AShk`.!KTMA9i-4Df\'&+?Ui&+=DAOEb'H7Df7!G/0Zek+Dbe8
F*&NK3Zot++DEGN0eb:1+?_b.0eb:(,9T)k2'G"<+?V#c@;U4,Eb$O,$>"6#E-67FGAhM4H#R\?
Et&IfEZen(C`mq?Eb'H7Df9\+$4R>;67sC)Bl%T.DJsV>@V$Zj@VfTuFDi:7ATT&'DL!@8ASbq"
ARlp-DfTB0%16uaEZf"+F<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+$4R>;67sBkASbq"AKYDt
C`mb0An?!oDI[7!+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSnA7]R"GAhM4H#R\?Et&Io
ATAo9FZhc.F`V,8+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*ATD@"@qB]j$8EZ-+>=pN
Ci<d(-9`PrDfTB6E,TZ9%16T]ARTU,-OgCl$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQUEb00.
ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?\67s`u
ATMs6Dg?G9F*(r,@ruF'DIIR"ATJu9/M/)UATMs6Dg?CH8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/
:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;D..]E1CX[d
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBkAS,XoAKZ)+F*&OIFD5Q4%159QHZX+D
Ci<f+B4Z0-I4cXTEc<-KC2[X)ATMs)E[M;'FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO
:-pQUF`)52B5)F/ATAo%DL!@HATMs.De'u$Bk)7!Df0!(Bk;>p$9ieh+@Jdg<)Yq@+>b3ZA0<6I
%14g4>9H=*6W?uI3Zp."E+rft+@Jdg<)X550d'[CF(fK9E+*g/+@Jdg<)Yq@+=MRh+u(3.8OHHU
.3Kja+=f&t+u(2g/35/#ATMs.De(4E+@Rn*5'nn+0d&kU6W?tn$8EZ-+>Y-\AS5O#4s36b6W?tn
$4R>;67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!Df0!(Bk;>p$;No?+AQisANCrU
BOr<8C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&$;+)^<(0_b;GU(f
4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<Df9_,$;No?+A,Et
<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P$4R=s+Bot0BOu!r
+=D2?+<i0a8l%iS78m/`:JXq@-R'ZdF!*,U-OgCl$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQU
Eb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16W[F)Y,sBk)'lAM>em:-pQ_A8-+(<GlM\De*E50JO\l
/M/)UBle60@<iu6AfriO@X3',+E_R9@rGmh/e&._67r]S:-pQU6$%*iD.Rc2@3AH:5t"dP8Q8,$
E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.3N&B@;0Od@VfTb$;No?+<VdL+<VdL+=LuCA9;C(FCfJA
+Eh=:@WNZ#G%#*$@:F%a%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(C@An>F*2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JGFrARdGM+>"]aFCfN8E+*g/.3NYBE,8rmATJtB
F)>i<FDuAE.1HVZ67sB90JP;!@<jU^+>"]aF(fK9E+*g/.3NYBE,8rmATJtBFCfN8E+*g/.1HUn
$4R>;67s`V;Gp:g4['u:A8-+(.3N/>ATJu3Dfd+@Ec5o.Ebp"DA8-+(CghT3F`(o'De*E%A79Rg
FEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%144#:JaJT8l%iC8OHHK:JO2R8OZQbBkhQs
?TgFmI4cXQBk/>?%13OO+<Y]9EHPu9AKW@8De*s$F*(u6-OgCl$6UI6A3DsrFZLWmFD,B0+DGm>
F`(o'De*E,%144#+:SZ#+=D;LBk)'lALATP3ZqsAFCB9:E+L/7A0<!i67sBk@<>q"H#R=;Bl5&7
FCB&t@<,m$8g&(nDe<^"AIStU$6UHG+BosE+E(d5-RT?1%144#4tq>%A0<7AATMs.De(OL+<XEG
/g*b^6m-S_F*&O8Bk)7!Df0!(Gp!P'%144#4tq>&F`\`RF^ujB+<VdL+<XEG/g,4WDfTD3Bl5&8
ATMr9A8,OqBl@ltEd8*$%144#ATD4#AKW@CA1&KB+<VdL+<VdL%13OO+<Wj%HY6o3+=D;B-OgCl
$6UH=F`(o'De*E,+>#VsA79RgFEqh:+E_3;+AP6U+Dl7BF<GF/FCStn$4R=b+=M@n+=D8EBlbD2
F!,UCBk)'lALAoL/NP"sA0=W6/g,"RF*&OA@<?!m%13OO+<XEG/g)Q`BQ&*6@<6K=+Co%qBl7Km
+DG^9-u*[2FCfN8ATB4B%144#0d'[CF(fK9E+*g/+Co2-E$-NNA1&KB+<XEG/g,"RF*&O8Ble60
@<iu>Bln$,F`\a;EcQ)=%13OO+<Y69AT)O!DBLVB$4R>;67s`W8Q\,>+Cf>1Eb/a&ARlotDBNb(
FCfJ8G%G]8Bl@m1+E(j78g"QM%13OOA8bt"ATMrg67s`uDe!m#F*&OH/M/)eATMr9F*)P6+D,P4
+=Lc=@jrOBATMs-DJ(R/:-pQ?:-pQU<+oue+DGm>@3?\6Des-0@<-W9FCfN8+EqOABHU_++CoD#
F_t]-F<G7.@:Wqi+EV:*F<GdACht5'AI;1!/g,:XAKZ)5+EV19F<G+4@kJ*`67rU?67sC(ATD6g
FD5SQ$;No?$;No?+<VdL+>,9!/g,:SAoD^,@<?'k+EV1>F:(c0/db??/g+YEART[lA3(hg2'>h/
E$-ni0K:100KM!H3\rQ!$;No?.Rd65:Js>>+=MGPEb$UAAmoCiF!,C=+>,9!/db??/g)o,+B)ij
+>PW)3$9q03\rTR1G]@F:-pQ_7S-]F4s4?REcP`$FCeu*/hSb/$4:ikDfp/@F`\`RA8bt"ATMr9
/KebK+CQC'F_tu@+EV19F<G[=@<<W&De3u4F*D2,F<G0A->O`4ChtI+Ci<`mFCfN80JG4lBk)7!
Df0!(Gtp[Y.Vs$3A9;C(F>,C'A8,OqBl@ltEd8dL/M/)]Ddd0!0mFg_ATMr9A8,OqBl@ltEd98H
$;No?+:SZQ67sBWDfBi8@<?(%+EV:.+E):2ATAnJGT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?
+Eh=:@UX@mD)r+5:-pQU%15is/g+,,AKZ)+F*&O8Bk)7!Df0!(Gp$a2DImisFD5Z2+EM%5BlJ08
3XlEk67r]S:-pQU+<Ve:Eb/[$ATVL)FC])qFD5Z2@<-'nEt&IO67sB'+<YK=@:XIkF*')i0k>!.
FD5Z2@<-W&$;No?+<VdLCi<`mFCfN80JP7lBk)7!Df0!(Gmt*U67sB'+<YK=@:XIkF*',j0P"m-
FD5Z2@<-W&$;No?%15is/g,"RF*&O6AKZ#9DBNY2+E):2ATBCG+B3#c+DtV)ATJu&Eb-A'Df0W<
Eckl6ARlp)D]j.8@<<W&AS,@nCig*n:-pQU8g%PYE+iZhATVWr+EMIAFD5W*+E2IFF!,R<ASiQ(
DBNG-EcP`$F<GLBA7]cj$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)o'0emNRGqq&r/KcHUC2[W3+DG_8ATDBk@q?d!De!3lAKYDlA7]9oFDi:2@<6!&@UX@l+:SZQ
67sB'+<VdL+<VdL+>"]aC2[X)ATMs)E[`,OAT;j,Eb-V0A.8kT$?B]tF_Pl-+=CoBA9;C(FCfJ?
%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B
3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+A,Et+EMID
EarZ'GAhM4F!*%WD.Ra#ATJu5@<?0*A8,OqBl@ltEbT*+%159QHYm2,AKXT`A5dDhEarZW@<?0N
F_u(\3Zr*SF*)J7E$-QDE+*j%+=DV1:IJ/N;cG+n/13)cDe*fqFD*:@C3(a3$4R>;67sBmATVEq
+EV19F<G+.@ruF'DIIR2+Cf>-FCf?3F!,OGDfTE"+CT=6@3?!d:-pQUA9Da.+EM%5BlJ/:Bl5&8
BOr<$De'u$AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;>p$7Bk(+EM(%F=044+>b3RATT%B<+U,m6tp.Q
Bl@ltEd:&qD/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9
A1'Gd8l%i&%13OOATAo3A0<7AATMs.De(RM%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?
/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26u
DdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL&ATMr9A9Da.+EM%5BlJ/:%14L30HiJ30JFpu
3]\B;3[l1NATMr]Bk)7!Df0!(GsldlE"*.aDe!p1Eb0-1+EVI>Ci<fj5s[eYEaa$&3B9*,%13OO
:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!
CLeP8FCfN8C2[W;-OgCl$;No?+CfG'@<?''@;Ka&B6%p5E-!.6Ec5e;,%5;(GAhM4F!;`:Df'?"
+Co&"Bl.s'A0<?SC1hc6Anc'm%15is/g)kk>9J,Q/g,+AEcYf%F*8ZSI6&KkART*l<(0_b0h5,;
<DZ.V9LUBQ/M8.n+t!g,:-pQU4!8l&+u(3QEc<?h+=K>r0HbIUCi=N/E[ED&+FYqU.3L/g/j:C+
IQATa4YD(6+u(3a.3L`7/hnIs4CL940e%Hn%13OO:-pQUCi<`m+CT.1@<,jkBm+&u+A+pt+Co&,
+CoV3E$043EbTK7+>"^XBPDN1Bl8!7Eb0;7G@_n1@<Q3)@3B3$De':a:-pQUD/"6:F`M%9De:,$
@:UKhDIal6ASc0*A8bt#D.RU,ARlp-DfTB0+>"^EDIakuCiaM;F(KH7+DkP)Gmt*U67sC!FD,6+
+E(_(ARfh'+DG^9FD,5.FCfN8+Co1rFD5Z2@<-W9/KeYJEcbu+EZfI8F*)IGFD,5.DJsDEBl8$5
F`V8?AISuA67sBu@<?X4AKYo'+A+pt+ED%7FDl22F!*%WE,9Z<+ED%%Ci"A>E,Tl:A9/l3DBMP;
;BTq!Bl.R+Bm+'/%15is/g)Pj0HiJ2.3LZ4+>>i*+?W7^;H-(`<('_\:e"#M71BS5$;No?+EV:.
+D,P.Ci=N3DJ()+DKBB0FE8RA@;^?5F(oN)Ch4`*Bl7K)A7]glEbTK7Bl@m1+D,P4+EqaEA9/l;
Bln$,F`\a:ATM@%BlJ0.Df0V=%16#s3Zr$UASrhY+>=om+>Y-XDe404+=ANG$<')K+B'C-INU%$
0I\,n3Zrc%+u(3=%16Ze+>=ot+E2IF+=MRh+u(3=.3L/o+=K3'-9Nn)0H_Se4s525+u(3=.3Nsi
-8%J)HTE?*+B&^V%15is/g,"BEbAr+Bl5%c:IH=HDfp)1AIStp-nlf*0I\,*3Zp+;.3L`FDe)db
F`Lu':gnHZ7!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("@<?''
@;Ka&@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is/g+SC
AKYi(F)u&5B-:W#A0>_tDL!@5D.73lDfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e;u
0d'[C0Hb"EDdmc74s58++CoA++=ANG$4R>;67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+=D8B
F*)/8A2,G@$>"6#D..3k+=ANG$4R>;67sC%BQ&);@rHL-FE7luATAo(Bk/?8+>=63%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?_ASbpd
F(K*)A55HD.WT*:ARTXkC2[W*F"JsdAnc-kC`me/EbTK7+CT5.Ch[Hk+DG^9@WcC$A8,po+DPh*
+ED%0ARTXk+F7a@/e&._67sAi$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$
ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JP:oAR[AN+>"^GDeX*1ATDl8
-Y[=6A1&L3DfQt<ATo85De!3lAISuA67sB90JP;!@<jUc+>"]a8OccQ:+7;sG[kQ4A7]9oAo_g,
+EMI<AKWC6A7]_$.3N_DF*)I4$4R>_AT;j,Eb-@@IUQbtDf0W$@<,j_H>.>'H=gl-ATKJ<C3(a3
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZXrV5s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eY
Eaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%0ARTXk+Co1rFD5Z2@<-'nEt&IdF`MLc
3ZqsIA0<Q8$9g.j1E^UH+=ANG$9g.jDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R>;67sBmATVEq
+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o4tq>*D/a<0@j#DqF<Gua
+D5_6+=CW@Bl%<pDe(4)$4R>WDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt%15is/g*b^6m-PrF*(u1
+DG_7FCB!%+F7a@+DG^9E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6psUF<)Q:S
<E)Oc:0L4c4ZX]5C2[Wi-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%8l%iC8Q/Sd
8O?EV8P`)b8PhQ2+=JEd-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2
?V4*^DdmH1/4r]+6qL<V;Fs2T<(Tk\>"MO"$;No?+A,Et9ggj%3[\Z\A1h_02(&h?%15is/g+Y;
ARfKuFD,*)+CT)&+D5_5F`8I6AT23uA7]Y#F!+n3AKY])+CT>4De!KiFCeu*B6%p5E,uHq:-pQU
FD,B0+DGm>DJsV>DIm<hF)tc1Gp$R=F<G72B4u+,+ED%'Df'?&DId<h+D,P4+D5_5F`;C2$;No?
+EV:*F<G"4AKZ,:ARlp*D]iY1Ebuq/CghC+ATJ:f-t,.Z/M;JpB4PRmF!)iFDe(4E+D!/JB6%r6
-YdR1-OgD2@6,M_/q+pUA7]_$+=CoBA92j2Eb-UI+D!/JB6%r6-YdR1F*)>@AL@oo-n&Lb/3G:O
7TW/V-Rg/i/q+pUA7]_$+=CoBA9E!.CaUYSAM,*<Ec<-KC2[X*FD5P=%14Ll3Zp",INW96AT2]5
-YdR1D..3k-Rg0L/g+eIE$-NCDe*]nCLnk&$7K=D+>#3p+D54rE-!-LC2[WnDdk(C+D!/JB6%r6
-YdR1A8bp)%14Ll3Zp",INW96AT2]5-YdR1Df-pO+D!/JB6%r6-YdR1Df-p3$7K=D+>#3p+D54r
E-!-LC2[X)Df9H5-Rg0L/g+eIE$-NCDe*s.DesJB%13OO:-pQUF`:l"FCcS0De(J;A2PK>BOt[h
F*2=BAnc'm+>"^WATVu97S-9B;[j(/67sBU:K0bD+>>`lDg!ll+>"^XBOr;Y5tiDBF^fN*EcYr5
DBND2Bl%=$+Eqj;@;Bp,@q]F`CNFW8Et&IO67sBiF`\aEA7TM%+CoD%F!,@=F<GX<Dg*=7BkCsg
Eb0,uATJu'ATW--ASrW&Bl%@%+>"^TATDHmE,uHq:-pQUF*1r8ATDj+Df-[AA8,XfATD@"@qB^*
+CoC5DJsV>Bl7EsF_#&+@qB\&@;0U%@q]:gB4Z,n$;No?+>>oM:IIoF2'?aH2/Qc>BkCptF<F1O
6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUAn?'oBHTo59H\1\DJ<]oF*%iuF)4!#+?MV,-Z*:0BkCpt
FD>`)-OgE'@j"tu-ZW]>C2[X(@r`q[3Zp7%B4Z0-F)29m.!mQj0d(4LA927$.6T^7HTE?*+DPh*
F(95"$4R>;67sC$F`&<o5tiD<@;]dkATMr9/Kf+GFE8Qo8PDQO%14L30HiJ30eb%!3]\B;3[l1g
@;]dkATMs.De':a%15is/g,">DJ<]oF*&O:Bl%@%+>"^PATMo8D.GLH@q]F`CNFW8Et&IG8PDQO
4ZX]:+CR;R/M;Jp4?G0&0d'.Z/4N3)78k<\/g*MZ%15Qr9LVlC3Zpm`9LVl&/M8/.-YdR1/o>,V
-OgCl$;No?+CoC5@;Ka&Anc'mF!,%=BleA=Bl5&>BlFLg7S-9B;a!/aIP)a48PDQO+<XEG/g)]-
8l%iL6o>D\H=_>8F*&T\+@\pr78k<[/g*8K:IITB;cHXd6<-uV:JP(b:^ma@$;No?+EM47G9Cp;
D..-rBl7Q+Anc'mEt&IP<(KGU4ZX]60Hb]d0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=/g*VT
9LVkh$8EZ-+EM47GApu3F!+7X84?E!,CUa_0.230HTEK;+AYs-78b7'67sBlG[kQ4A7ZloBl[cp
FDl26ATJ:f%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%17/fFEMP0C2[X%Ec5](@rtI4/h1pR
FEMP0C2[X%Ec5](@rri8/M/)dATW'6+D,P4+A*bqEc5](@rri1@;]LdATAo9F(Hs5$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JGG'Dg!iq%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)o'0K<fiCb[Ud/Kchl?SN[?@;BEs-YdR1E,'63ATMr@+AP6U+CT/5GA(Q.AKYo/+E1b2BFP;D
67sB90JGJ)@rsC`+>"^JDfT?!+E1b2BQG;<D]ik7G@be;@psFi+C\noDfTD3D..NrBPD?s%15is
/g)o'0em9O@PKhb/KePABl8!'Ec`EOBkhQs-Qli.A7]9o/Kf"@FD,_<F*(i.A79LmH=^Ur$4R>P
De!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>+0RI_VD`p-(A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K
+?MV3C2[WnATf22De'u5FD5Q4-OgCl$=e!aF`MM6DKI!K@UX=h-OgDX67sC"Ec5](@rri4@<?0*
D09oA+DkP/@q[!"De*BiFs(%2@rc:&F:AR*C2dU'BQIa(+EVO<Dg,c5+DPk(FD)dEIS*C(:f:(]
771$-F(96)E-*`\.3L3'+DPk(FD,`,E$07@Ci=N/EZcPY-W<B1?RIBQ4*s#8/jrN%<(LA';cI+2
8l%in@VR>C-XS51$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&%159QHZX+DCi<f+B4Z0-
4$"a1BQ&*6@<6K4GB.D>AL@oo%17,c+Bos9Eap5/FEhmT4Y@j6+D58-+=CoBA8lR-C1UmsBkhT7
%13OO0K^b*Db*Z&<$48L3\5,iG]YAWGB.D>AKY`,@<?0*-[nZ`6r6cW8ju*H06:WDBlJ/IC2[X%
Ec5](@rs>;C2bO0$4R>;67sBnASu("@<?''E,oM4@;]TuE,Tf>+E2@>@qB_&DfQtA@rc:&FE7lu
4tq>#Ci^^HC2[X%Eb03/EbZs2$9g.jD/=89-YdR1E,Tf>E,o\@%13OO:-pQUBl8!7Eb-A.De'u4
ATMr9F`_>6Bln'#F!+n3AKZ#)@:XWm$9g.jD/=89-YdR1FCfN8ATB.-$4R>;67sBt@;BEs@UX=l
@j#l)F*&OG@rc:&F:AR@0RGSu?SN[?@;BEs-YdR1E,'63ATMr@%13OO4tq>%A0?:QDf9P:>9G^E
De't<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$4R=O
$4R>aATMs7FEM%f67sa7IT1cE+ET1e+EV19F<GXHF^cs4$;No?%15is/g+,,BlbD=ATMr9/hSb/
/g+bEEc#6,FCeu*FCf]=%15is/e&._67sC(ATD6gFD5SQ%15is/g(T1:-pQU+<VdL/hSb/+E_R6
DfT]'FCeu*FCf]=%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zrcu@rc-hFCf!3I16NY67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JP:oAR[AN+>"^GDeX*1ATDl8-Y[=6A1&L.A7T7^
+D,P4+Dtb7+DPh*+DG_8ATDBk@q?d!De!3lAIStU$;No?.Rd65:Js>>+=MGPEb$UAAmoCiF!,C=
+>,9!/e&._67sC-IV!P?DfTr6D.S0E%13OO:-pQ_7S-]F4s4?REcP`$FCeu*/hSb/%175sA79Rk
C2[WnBleB:Bju4,Bl@la67sa1E+EC!ASQ-oA8-+,EbT!*FD5Z2+EK+d+E_X6@<?(%+D,>(ATJu.
DBMPI6m-#SF*)G:@Wcd,Df-\DBlG[6$;No?+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6
$;No?+CfG'@<?'k3Zq4.FDkW"EZd+k0Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)3,N)L1,pC.
+ED%1Dg#]&+DG_7FCB!%+C\c$F!+n/A0>r'EbTK7F!*%WF(oK1Ch[KqATJtd5tiD<@;0V$AStpo
@q?)V:-pQU1,(CAF(K;G1a"@m@:Wn[A0>Q"F*)>@GqO2`F<G[D+Co2-FE2))F`_2*+D,>(ATJ:f
:-pQU1,(F;An>F+1a"@m@rH(!F(KB6+=Cl<De(4<@:Wn[A1VJ6A1hh3Afu,*D/XT/A0>K)Df$VC
BlFLg:-pQU+<VdL+<VdL+<W6YB5_^$Ch580De*EuCh7i6A8-'q@ruX0Gp%6KA79Rk+ED%1Dg#]&
%15is/g)o'0em9O@PKea/KeeHA8l'k/p)>[+Co2,ARfh#Ed8dHCgggbBQ%]tATAo%A7T7^%15is
/g)o'0emNRGqh9$/KeeHA7TUg05P??Fa.eBFCfMGFEhmM@:Wn[A.8kT$?B]tF_Pl-+=DVHA7TUr
F'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-U
F(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0&u
@<6!&A8,OqBl@ltEbT*+%16TfEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,
C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+
DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:4tq=U
:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXh
DBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3ZoebDe*3&/1;ku?RHt+BOPq&F^cJ.De+$&
EcYr5DCI+a/p_5N-OgDT:IITB;cHXd6<-uV:JP(b:d$i^F(fK9E+*g/+=JEd-UCEt-S.>qDe!j#
G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V;Fs2T<(Tk\>"MO"
$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%-YR48FDl2FC2[W*Bl8!6@;KapDe'u2
ATMF)C2[W*C2[X%@<-4++DPh*E,ol/Bl%?'D..<rAn?%*C2[W*CggdaG[YH.Ch5:S0d(4LA8,q'
Ec3(8De*C$D/^j3$?L#H3ZrK[/12Q6@:DWID/^V4De*<gF*&O=DKBo.Ci!j)A7Ath+ED%7ATV[*
A7Ath+DPh*E,o]1+DPh*Bl7HmG[F!@9hZ[EDe+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[/12QT
De*ftAm\M><$6!kDKU2ADffQ3?W:-,-OgCl$?BW!>9G;6@j#N)A927$-TsL51a$FBF<GX@%13OO
:-pQUF(KG9F(96)E--.1$7L6R+u(3TDe*p!E[a.4+F?-n0d(4LA927$%13OO:-pQUEcl7B8jQ,n
D..<rAn?%*%14L30HiJ30eb%!3]\B;3[l1g@;]dkATMs.De':a%15is/g,">DJ<]oF*&O:Bl%@%
+>"^PATMo8D.GLH@q]F`CNFW8Et&IG8PDQO4ZX]:+CR;R/M;Jp4?G0&0d'.Z/4N3)78k<\/g*MZ
%15Qr9LVlC3Zpm`9LVl&/M8/.-YdR1/o>,V-OgCl$;No?+E_X6@<?''Anc'mEt&IO67sB74DA\S
FCB!%C2[Wl@<<W<Eb03+@:Njk-YdR1@UX%*Bl8!6@;KapDe(J0@<<kY8l%iC8Q/Sd8O?EV8P`)b
8Pfj':-pQU0KaAeF(KH.De*<cF<D\KH?*S9Cgggb+=CoBA7At_061WFATV[*A1h>"F=0.B:IITB
;cHXd6<-uV:JP(b:^mb,67sB74DA\SFCB!%C2[W*+<VeQEb03+@:Njk-Y[I>FCB!%C2[W8Bkh]:
4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>olDKBo.Ci!j)A0<!;+F8'>E,8rmAKW@8De*<cCG0C>
F*(i,Chdm!@UX%)Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)C2[W*+<VdL+F8'>
E,8rmAKW@@ATMF)C2[W8Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)C2[W*+<VdL
+F8'>E,8rmAKW@8De*<cCG0^>F(KH.De*<cCG'=9F!j%A:IITB;cHXd6<-uV:JP(b:^mac4DJeF
E+*d(F!)SJ+<VeQEb03+@:Njk-YdR1E+*d(F"V0AF!j%A:IITB;cHXd6<-uV:JP(b:^mac4DJeF
E,ol/Bl%?'+<VeQEb03+@:Njk-YdR1E,ol/Bl%?5Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SU
BleB7Ed;D<A0<!;+F8'>E,8rmAKW@6BleB7Ed99ZG]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)g
A8lR-Anc'm+<VdLH?*S9Cgggb+=CoBA7At_05>E9E,ol/Bl%?i@;@K0C3(aa8l%iC8Q/Sd8O?EV
8P`)b8Pfj'0Ka)gA8kstD0$gB+<VdLH?*S9Cgggb+=CoBA7At_05>E9E+*d(F(/Qn/no'A-Tapr
6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*F(KB%Df00$B4>:b+<YuNAT2Ho@q?c1C2[Wl@;@N2De+!3
ATD:!DJ!Tq@UX%)Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SZ@;]dkATMs.De't5+F8'>E,8rm
AKW@;@;]dkATMrGBkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SY@:Eem@;Tt"AM>em+F8'>E,8rm
AKW@8De*Zm@WO2=@:Eem@;Tt"AM>em/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dO9OVBuF_u(?
+<VdL+<YuNAT2Ho@q?c1C2[X!@:F:2Cggd`F_u(MBkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SW
De*R"FE2:B+<VdL+F8'>E,8rmAKW@8De*Zm@WO2;De*R"FE2:PBkh`;4%`::6qL<V;Fs2T<(Tk\
>"MO"$8=SWDe*C$D/^U?+<VdL+F8'>E,8rmAKW@8De*Zm@WO2;De*C$D/_+AC31gb8l%iC8Q/Sd
8O?EV8P`)b8Pfj'0Ka)gA7B+kF<D\K+<VdLH?*S9Cgggb+=CoBA8G[`F"_9HA7B+kF=q9BF=0.B
:IITB;cHXd6<-uV:JP(b:^mac4DJeFE,o]1+<VdL+<VeQEb03+@:Njk-YdR1Cggdo05>E9E,o]1
/no'B-Tapr6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUEb/Zi+Cf>,E+s-"A0>W*A1hh3AfrZW+EV:2
F!,(/Ch4`'F!,@=F<GXHDfTE"+DG^9FD,5.A8,OqBl@ltEd8*$:-pQU@Wcc8BlbD+F_PZ6+DG^9
FD,5.E-67FA8,OqBl@ltEbT*++CoD#F_t]-F<G+.Eb/a&DfU+4$;No?+>>o&C2[X%A7dtc+ED%%
A0<9E/gj%_6ROEHCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4ci]
De(J>A7d1u$;No?+>>omDe*ftAfr3=+<VdL+F8'>E,8rmAKW@8De*Bs@kVe3An5gi05>E9/oY?5
-Tapr6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF*)>@AKYZ.D/:>/DId='+>"^SFD,6++E).6Bl7K)
Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1DImo4Ch[d&Et&I14DJeFBl7HmG[F!@9hZ[UEb03+@:Njk
-YdR1A8bs2BQS*-A8bs2C2[WsDId='/nf?DCaV;::IITB;cHXd6<-uV:JP(b:^ma@$;No?+EMXC
Eb-A.De*ftAhJ1MF<GO=@:NjkBQ%]tATAo*DfQt8De(J>A7cr9+CTG%Bl%3eCh4`-DJX$)AISu#
4DJeFE+EQf<*3*BH?*S9Cgggb+=CoBA7TUg05tH6A8bs2C2[X%A7dH9G]Y;p8l%iC8Q/Sd8O?EV
8P`)b8Pfj'%15is/g,4WDfTD3Ch[d0GT_'HARfFdBk&9'DffQ3%14dOCh[d0G]%GAATM3X=B$Dh
Eb03+@:Njk-YdR1A8bs2Ch[d0G]%GAATKJGG]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g+\C
+CT)&+DkP)BkCptF<G10Ch7Z1AU%p1F<G:8+F7a@%17DmG\M5@+u(308PDQO+=o,f4A&C;6qL<V
;Fs2T<(Tk\>"MO"$4R>;67sC%BQ&);@;^?5Anc'mF!,17+F7a@+EV:*F<G"4AKYl/F<GL>+EV:.
+DkP)BkCptF:ARQ<(KGU4ZX]60Hb]d0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=/g*VT9LVkh
$8EZ-+EM47GApu3F!+7X84?E!,CUaX-SHir3dWn74s3X#84?E!:-pQUAU%^$F_#&+A8-'q@ruX0
Bk;>p$4R>;67sC'E+EC!AKXT29J8nSDeElt6Z6LH+EM[7G%G]8Bl@l3A8-'q@ruX0Bk;?./KeJC
F*2>2F!,UCH>.=NAU%c/Df-\=BOu!r+E1b2BFP;D67sB8+Bot0D/XQ=E-67FF(f-$C`k*JDL-#9
+>%^Y/T2a`E?HV[8l%iC8Q/Sd8O?EV8P`)b8Pgrc+>%+H-S.kc6q:$K7nc?=:IIWJ5u^Aa$8EZ-
+EMC<F`_SFF<GX<ASc0*-Zs<QBlG1HFW`8S+>%RU-S.kc6psUF<)Q:S<E)Oc:0L4c/12PlA0<6N
8jPj5:JOMX6r60K8.>n8$;No?+ED%3E+Nnr$9g.j1E^UH+=ANG$9g.jDe'u=/n9$EEX`?b$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$?^;u@<?'qDe*]nDJ<]o
F*(/D/h2!_A79RkC2[X"@;]dkATMr9F"JsdF*VY5BQA$/BmO?3+Eh=:F(oQ1F!,17+A,Et+DkP)
BkCptFE9&D$;No?+:SZQ67sBhF`_;8E]P=8DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+>PW)
2f<PW1,U0`$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>PW*0kP!+0f1")+Cf>(DKBB0F<DrFC2[W1+CSekARloqDfQt<
ATo83De'u)DKKH1Amo1\+Dbt+@;KKa$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU
Eb0&u@<6!&A8,OqBl@ltEbT*+%159QHXh2=E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3
C2[WnATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A
@:O(eDJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8Bl@lP
3Zot;0RHDf6rm#M%13OO:-pQUD..<rAn?%*+EM%5BlJ08%17/m4ZX]I3[\cQDJ<]oF*)/8A0>_t
DJ<]oF*)/8A92[3EarZ.%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5
BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EM+9+DkP)BkCptF<Ga<EcYr5
DK?q4Ec5e;A8,OqBl@ltEd8dNATDj+Df0V*$>OKiF*(i-E'67'BQ&*6@<6K4-SJLh;H$._:-CWc
-RUGn+=ANa-Qll0AoD^$F*)FF-WWZ6;b9b[4ZXr<-Qli0FCfK6FE/L@@;]dkATMs.De(:J-RU8p
<^fnb8P`)E3[Z:&/8B*6G%G]8Bl@l?-RU8h%16r\DJ<]oF*)/8A3DsrFDj]G;cFlSDe*p2@;Ts+
@q]:gB4Z.+EZf4-DJ<]oF*)/8A.8kT$?K]tG%G\W3ZqjICj0Q,FCfQ7Bl+td7Nc/OAoD^$F*)FF
-WWZ6;b9b[4ZXr5@:jUmEcZ>C+DkP)BkCptFD>`)F)Q2A@q?)VC2[X(FCB$*4Z[XtDg-//F)rHO
031M>;b9b[4ZXrAF(966ATB=L031M>;b9b[4ZXr<-S0"NA9MO)F(oQ1/12em-OgE"@;]dkATMs.
De*p-F`Lu'4ZX^-Db*Z&<$5poA92j$D/^V-BOPdkATMs6+DkP)BkCptFD>`)F)Q2A@q?)V%159Q
HScjaF`\`RD..<rAn?%*C2[W14%`F=;Fs\a?X[\fA7%E8@;]dkATMs.De':a4tq=?+E2IF+=D#7
DJ<]oF*)/8A92[3EarZ.4%`F=;Fs\a?X[\fA7%E8@;]dkATMs.De*p-F`Lu'%13OO%15is/g,1G
DfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%175sA79RkC2[X(Dfp)1ARoq#E-"c@/h2!_A79RkC2[X(Dfp)1
ARoq#E-!.C/M/)fE+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2+EMIDEarZ'H>.=N%15is
/g(T1:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i/@ruWuATAnK0JG?n
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>PW)2f<PW0fL4,+Cf>/Bk;?.FDi9o5tiDBF^fN*EcYr5DBNJ(
Eb/a&DfU+4$;No?+>PW*0kP!+0f1")+Cf>-Bl8!'Ec`EOBkhQs-Qli.A7]:&+D5V2B5D-%F*;FD
Eb0*+G%G1n$;No?+<VdL+<VdL+<VdY+E2.*Bl5%C/no'A+DPh*+EMIDEarZ'A8-'q@ruX0Gp$O+
A7]9\$;No?+>PW*0l:?E0fU:-+DPh*F)Q2A@qB^mFEMOTBkh]3@:Wn[A.8l@67sB90JP;!@<jUd
+>"^GDfBtEDe:,,De*p-F`Lu'F(KH9E%Yj>F!+n%A7]9oFDi:JBlG2,DfQt0@:O(qE"*-`$?B]t
F_Pl-+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo
3F=p1-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>;67sBnASu("@<?''@s)g4ASuT4A8,OqBl@ltEd8d<F_u)=%16TfEcO<(+Co1s+>=634tq=>
+E(d5-RT?14tq>%A0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?
Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!
A1%fn%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@
Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3[\Z\
A92[3EarZf-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%5tjj=:/F5U83K!V+tb6/
9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:IITB;cHXd
6<-uV:JP(b:d$i^F(fK9E+*g/+@/[m78?ZF<(JQ4:IITB;cHXd6<-uV:JP(b:^mb3<(Tb^6qL<V
;Fs2T<(Tk\>"MOR3Zp^^8OZBN5u^B+-ZsNFCi_4TBlGF/$4R>;67sC%@rc:&FE8uUCggdo+CT.u
+C\c$Et&ItCcsg%-Z*:0BkCptFD>`)F)Q2A@q?ctDe*p-F`Lu'F(KH9E$l)%F)4!#+?MV,F)29m
%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5BlJ08%14M1/g<"mC2[X(
@ra"]3Zrc1+u(3TDe*p!EX`@jDe*p-F`Lu'F(KH9E'66)FDj]G;cFlSDe*p-F`Lu'F(KH9E"*-`
$;No?+E_X6@<?''D..<rAn?%*06:]HF`8I;DBO+6EcYr5DBNG-DKKo;Ci!Zn+CSekDf-\.Bl[cp
FDl2F%14M*Db*Z&<$6$dDJ<]oF*)/8A92[3EarZ0+Eqj?FCcRe5t"+::.e;M;bpCk6Uag;<(JPf
D..<rAn?%*/no'A-OgDtDe*p-F`Lu'F(KH9E$0@FBlmo/8jPj5:JOMX6rQl];F<lL5u^B+-YdR1
F)Q2A@qB^mFEMOTBkh]:%13OO4tq=>+E(d5-RT?1%159QHZ*F;-YdR1A7]p3%17,c+Bos9Eap5/
F(ZV1De*BiFsfF*+DkP&AKW?J%159QHSZd_A0<6I%13OO4tq>%A0<77De(4)$?BW!>9G;6@j#W0
B-:r-A1'Mm+DkP&AKW?J%159QHSZd_A0<6I%13OO4tq>%A0<7BFD5Q4-OgE'@j"tu-ZW]>D0'>4
F`_>6F!j+'+DkP&AKW?J%159QHSZd_A0<6I%13OO:-pQUEb/Zi+D,>(ATJ:fC2[WnAThTmF?MZ-
Eb/Zi+DPh*A7]on$>OKiA79RC3ZoOf+ED%%A0>W*A.8lgFD5Q4A79RC3ZoPcART*lF`_>6Et&Hc
$;No?+E_X6@<?''Anc'mF!,17+EMIDEarZ'H>.=@Bl5&%Ch[Hu+:SZI8PDQO4ZX]J4"akp+=A:H
De*BiFtRKDF!,49A1hS2F!,UIBl%iCBkh]3C2[X(Dfp)1ATMF)F`8sIC3(a3$8=SWDe*BiG%>$'
+<YuNAT2Ho@q?c24tq=Q8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[Wn@<<V7+<VeQEb03+
@:Njk-pBA47S-9B;^je#:IITB;cHXd6<-uV:JP(b:^mac4EYa[Cia,qF<D\KH?*S9Cgggb+=KE/
HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA92[3Ear[%ATW'6+<YuNAT2Ho@q?c24u7OT
8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUCLq'r+E_d?Ci^_;DJXS@H>.=@Bl5&7H#@+7
GA2/4+A,Et%15is/g)i1F`_>6F(A^$+<VeQEb03+@:Njk-pBD57S-9B;^je.<(Tb^6qL<V;Fs2T
<(Tk\>"MO"$4R>;67sBkD]iJ)C`jj4Bl%@%+D#e3F*&O=DBO7>E"*/#AU%p1F<WF^7S-9B;]mVD
+?W7l6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF(fK9+ED%1@;0UnDJ()(Bl%@%%15m184?E>3Zoh)
+F>:e+F7R4EZdtM6psUF<)Q:S<E)Oc:0L4c.3L2p+@\pr78jX&0d'[CF(fK9E+*g/+AYs-78b6Q
INTa\0.230HTEK;+AYs-78b7'67sBlG[kQ4A7ZloBl[cpFDl26ATJ:f%15is/g+YBE-WRJD]hY<
9J8nSDeElt6Z6LH+EM[7G%G]8Bl@l3A8-'q@ruX0Bk;>p$8EZ-+EM47GApu3F!,O;ASc0*F(fK9
E+*g/+=CZ;E-WQM-S.kc6psUF<)Q:S<E)Oc:0L4c/12Va+t"p65t"+::.e;M;bpCk6Uag;<(JPf
C2[X(Dfp)1AM/:CE$?Y=$;No?+>G!C+EM47GApu3F!,O;ASc0*F(fK9E+*g/+=CZ;E-WQM-S.kc
6psUF<)Q:S<E)Oc:0L4c/12Va+t"p6:II]K:Ie)I6Vg*=;bpCk6Uag;<(JPfC2[X(Dfp)1AM/:C
E$?Y=$4R>;67sC$AT)O!D@Hq:0RI_K+FPkPF`ML3$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDFE1f2BK8(5?O[>                                             ~>
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
1,La/1,U11+>G_r1*A;/2)[-21,'h++>GT.2DlU31E\Fq1GCg33$9t!1,h'M+>Ghu1*AA40fC.0
0H`+n1c@*30eje++>Pc42'=V0+>P&p0ebU11,C%.+>Pl93$9q0+>P&q2`Wi?0f1".+>Pi33?U%5
+>P&p3&!340ea_*+>GQ+1*AP!1*A>,3ADX20H`+n1GUj22]sju1G^g02]sju2E3T;2]sju2)7*E
+>GPm1*A>40Jah+1a"Or1H@BN+>G\q1*AA/0eje*0d&4o0ebID+>Get1*A;,2)?@5+>P'!1c6C8
+>P&s2)\'&6pamF9LMEC;cHOj=Y_j067sBQ:IH<lF_PZ&+@p3fFDl2F+ED%7ATTsU:LeKb@V'R&
1GLF'1,(CA%13OO$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3%cm-+@:3bCh+Y`F_tT!E]P=!0fL3t
6t(1K3Zp45+AZKh+>PW)3$9q23\iQR0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!Y
A0=WiD.7's3Zp453$9>3@<?'A+>Y_p:LeJh1,(CA+>GW41,h6J0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5=;0H_K)F_PZ&+AR&r@V'R@+>Y`4+<X'\FCdKU1GL"J@rrhK0JGI/0etdF3'&cL$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1GUX,+@KX[ANCqV1*B%t@N[E[
0eje*2**HG3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3%cm-+@:3bCh+Y`F_tT!E]P=!1,0mo
6t(1K3ZoP#+@]pO+>PW*0d&2.3]/iW2)#@E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!Y
A0=WiD.7's3Zp461*@]-@<?'A+<WE^7V-$O1,(F;+>Gc80K(sG1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5=;0H_K)F_PZ&+AR&r@V'R@+>Yc/+<X'\FCdKU+>P'/ARZc;0JP:)0fD'M1-.9H$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+<WE^7V-$O1,(F;
+>Gc82)I?N2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K
3ZoP#+@]pO+>PW*0d&203\W<M0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=Wi
D.7's3Zp4$+@KX[ANCqV1E].u@N[E[0eje*2EEWO3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*!.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU+>Y-0ARZc;0JP:)0fD'M1HI3K$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+<WH_7V-$O1,(F;+>Gf90ek^C
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3ZoP$+@]pO
+>PW*0d&203\iNQ1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp@(
+@KX[ANCqV1a#8!@N[E[0eje)3BAuU3\rc'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3b
Ch+Y`F_tT!E]P=&+<X'\FCdKU+>k92ARZc;0JP:)0f(jJ2```K$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+<WNa7V-$O1,(F;+>Gc81,1gD2@9cu:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqV2'>A"@N[E[0eje*
2EEWQ3]&`%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A
+<WNa7V-$O1,(F;+>Gc81c[TS2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r
@V'R@+>GVo+@KX[ANCqV2'>A"@N[E[0eje*2EE]L3\`T$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*!.+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+<WNa7V-$O1,(F;+>Gc82)[KL3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqk+@]pO+>PW*0d&203\WKR
0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU2'>A"
@N[E[0eje*3'&`P3\W;r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t
2BX,1@<?'A+>t?3ARZc;0JP:)0fM-J2EEQN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp='7V-$O1,(F;+>Gi:0K;*L2@9cu:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@]pO+>PW*0d&/03\iTS1-#[K$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU2]tS$@N[E[0eje)
3BAuP3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+?(E4ARZc;0JP:)0ebXC1cd?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_
ATBgS1,0mo6t(1K3ZpC)7V-$O1,(F;+>>c91c[TR1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqn+@]pO+>PW*0d&/13\`<L1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp16+<X'\FCdKU3$:\%@N[E[0eje)3BArN3\WH!
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+?1K5ARZc;
0JP:)0ek^E1HI?P$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1,U0s
6t(1K3ZpC)7V-$O1,(F;+>Gl;1,V*K3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&
+AR&r@V'R@+>Pht+@KX[ANCqo+@]pO+>PW*0d&/13\iHO0K0=G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./heCj6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU3?Ue&@N[E[0eje*0KLmF3\rW#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+?:Q6ARZc;0JP:)0f1pF
1-.6O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.2
+@]pO+>PW*0d&2+3\WNS1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU0eje?ARZc;0JP:)0KD0J0fh!H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<
+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp.6+@]pO+>PW*0d&/13\rWS0Jj+D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0f1"BARZc;0JP:)0KD0N2EENN
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp.6+@]pO
+>PW*0d&2*3\`BN0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp48
+<X'\FCdKU0f1"BARZc;0JP:)0f1pI2**QO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!n
Bl%<&:3CD_ATBgS1Gp9t6t(1K3Zp.7+@]pO+>PW*0d&2*3\WBO1H>dL$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU0f:(CARZc;0JP:)0ek^G1cdBP$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp.8+@]pO+>PW*
0d&/13\`QS0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp4<+<X'\
FCdKU0fC.DARZc;0JP:)0KD0M1cd?F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&
:3CD_ATBgS1H?R#6t(1K3Zp.8+@]pO+>PW*0d&/13]/cU0JNnA$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./heCj6?R!YA0=WiD.7's3Zp75+<X'\FCdKU0fC.DARZc;0JP:)0ebXG1HI9M$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1bg*q6t(1K3Zp.8+@]pO+>PW*0d&2*
3\iBM1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp77+<X'\FCdKU
0fC.DARZc;0JP:)0ek^G1cd?H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_
ATBgS1c$6s6t(1K3Zp.8+@]pO+>PW*0d&2+3\WBO1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/heCj6?R!YA0=WiD.7's3Zp79+<X'\FCdKU0fL4EARZc;0JP:)0ebXC3'&`R$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1c6Bu6t(1K3Zp.9+@]pO+>PW*0d&2*3]/iW
1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp7;+<X'\FCdKU0fL4E
ARZc;0JP:)0f(jF3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS
1cHO"6t(1K3Zp.9+@]pO+>PW*0d&2,3\iKP2)u!N$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj
6?R!YA0=WiD.7's3Zp7=+<X'\FCdKU0fL4EARZc;0JP:)0f(jI1-.-L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS1cZ[$6t(1K3Zp.9+@]pO+>PW*0d&213\`EO0K'7F
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp:6+<X'\FCdKU0fL4EARZc;
0JP:)0fV3L2EETQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS2)-3r
6t(1K3Zp.:+@]pO+>PW*0d&/13\iEN1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!Y
A0=WiD.7's3Zp:8+<X'\FCdKU0fU:FARZc;0JP:)0KD0L1HI6J$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS2)??t6t(1K3Zp.:+@]pO+>PW*0d&2-3\iEN0JNnA$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp::+<X'\FCdKU0f^@GARZc;0JP:)
0ek^C0fh-O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS2)QL!6t(1K
3Zp7%6#^ie1,(F;+>PW31c7<N2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r
@V'R@+>l&"+@KX[ANCqm+AH9i+>PW*0d&2,3]/]S1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/hnIk6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU0f'qH@<itN0JP:)0ek^G0KLpH$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS2)l^$6t(1K3Zp.5+AH9i+>PW*0d&2,3\W<M
2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f'qH
@<itN0JP:)0fV3L1cd?L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS
2D?6r6t(1K3Zp.6+AH9i+>PW*0d&2+3\`QS1,B7E$;No?+B*Q,FCf;M+A,Et+?VbrDf'?&DKKH#
5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>G\q9jr;i1,(F;+>G]62)I?N3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>u5&+@KX[ANCqg2BY_&Gp"jr
0eje)3'&oS3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=%0H_K+
@<?'A+>Gbs9jr;i1,(F;+>>f:0f1pH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&
+AR&r@V'R@+?)"t+@KX[ANCqg2BY_&Gp"jr0eje)3BAlQ3]&Z#$49Np/g+)<F*(u13Zq$j6m+TS
@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS2_lKu6t(1K3Zp.8+AH9i+>PW*0d&/1
3\rNP1G]@F$;No?+B*Q,FCf;M+A,Et+?VbrDf'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!
E]P=%1E[f.@<?'A+>Gbs9jr;i1,(F;+>Gl;0f1pG2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0d%T*F_PZ&+AR&r@V'R@+?),"+@KX[ANCqg2BY_&Gp"jr0eje*3BAlP3\WAt$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fU:M@<itN0JP:)0KD0K2``cO
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Ghu9jr;i
1,(F;+>>f:2)mWQ1("?q:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!Y
A0=WiD.7's3Zp4$+@KX[ANCqg3$:q(Gp"jr0eje*1cd<I3]/]#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*'0+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f^@N@<itN0JP:)0ebXB0KM'N$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>PVn9jr;i1,(F;+>GT3
2)I?O1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp13
+AH9i+>PW*0d&2+3]&iX1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's
3Zp@(+@KX[ANCqh0Ha(uGp"jr0eje*1-.9P3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0
+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,'hF@<itN0JP:)0f;!J2EEZO$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>PVn9jr;i1,(F;+>Gi:1b^sF3=6*#
:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU1,'hF@<itN0JP:)0f_9K2``ZM$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0Ha(uGp"jr0eje*3BAiR3\rW#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>P\p9jr;i1,(F;+>G`7
1,CsF1^XQs:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's
3Zp.5+<X'\FCdKU1,9tH@<itN0JP:)0f;!J2**EM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>
+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp15+AH9i+>PW*0d&2.3]&]T1H,XJ$;No?+B*Q,FCf;M
+A,Et+?VbrDf'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>P\p9jr;i
1,(F;+>G`71c@BK1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqh1*B;"Gp"jr0eje*2EE]O3\r`&$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp15+AH9i+>PW*0d&203\W9L0KBII$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,9tH@<itN0JP:)
0fM-I3'&cR$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r
@V'R@+>Gl!+@KX[ANCqh1*B;"Gp"jr0eje*2``WP3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P_q9jr;i1,(F;+>>c91H7EP2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh1E]D#Gp"jr0eje*3'&oW
3\W>s$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp16+AH9i+>PW*0d&213]/oY1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol
6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,L+J@<itN0JP:)0ebXG1cd?N$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp17+AH9i+>PW*0d&203]/`T1bf=E
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,U1K@<itN
0JP:)0ebXD1HI9F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,L*r
6t(1K3Zp18+AH9i+>PW*0d&2)3]&TQ1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!Y
A0=WiD.7's3Zp18+<X'\FCdKU1,^7L@<itN0JP:)1,1gI1HI<K$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp1:+AH9i+>PW*0d&2*3\rHN1H5^K$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1,g=M@<itN0JP:)
0ek^H2**HM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K
3Zp1:+AH9i+>PW*0d&2.3\r`V1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=Wi
D.7's3Zp1<+<X'\FCdKU1,g=M@<itN0JP:)0fM-M0fh!K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO>+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp1;+AH9i+>PW*0d&2,3]&QP1,K=F$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp45+<X'\FCdKU1-$IO@<itN0JP:)0ek^G
3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp1<
+AH9i+>PW*0d&2+3\`QS0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's
3Zp."+@KX[ANCqi+A-co+>PW*0d&2+3\iKP0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um
6?R!YA0=WiD.7's3Zp1#+@KX[ANCqj+A-co+>PW*0d&2,3]/TP0fKFH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp4$+@KX[ANCqj+A-co+>PW*0d&2,3]/lX0f04E$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp7%+@KX[ANCqj+A-co+>PW*0d&2-
3\WBO2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp:&+@KX[ANCqj
+A-co+>PW*0d&5*3\rQQ0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's
3Zp='+@KX[ANCqm+A-co+>PW*0d&/03\WHQ1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqm+A-co+>PW*0d&/03]&QP1,fP4:IJ/X:J=\R<CokP84c`Z
:Jt=N2,6Ij+A,Et+B2-49N*'#F_PZ&+D>J1FDl2F+ED%7ATTsU:LeKb@V'R&1GLF'1,(CA%13OO
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,:d2+@KX[ANCqi
0d'8%F<E=m0K:101-.0J3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&
:3CD_ATBgS1,:g3+@KX[ANCqi0d'8%F<E=m0K:101-.0L3\WAt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,:j4+@KX[ANCqi0d'8%F<E=m0K:101-.0M3\`Gu
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,CU,+@KX[ANCqg
0Ha,/Fs&Oo0K:100fh'J3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&
:3CD_ATBgS1,CX-+@KX[ANCqV1*B%t@N[E[0eje*2EEQH3]&i($49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,C[.+@KX[ANCqV2'>A"@N[E[0eje*2EEWJ3\W>s
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,C^/+@KX[ANCqV
2BYJ#@N[E[0eje*2```M3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+>t?3ARZc;0JP:)0fM-M0KLsJ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp='7V-$O1,(F;+>Gf92)REL2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp4$+@KX[ANCqm+@]pO+>PW*
0d&/03\rKO1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU2]tS$@N[E[0eje)3BAuQ3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<
+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+?1K5ARZc;0JP:)0K;*M3BB#U$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3ZpC)7V-$O1,(F;+>GQ21,M$H
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp@(+@KX[ANCqn
+@]pO+>PW*0d&2*3\`HP1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU3$:\%@N[E[0eje*0fh*L3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+?1K5ARZc;0JP:)0f_9M2**TL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqo+@]pO+>PW*
0d&/13\iHO1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t
0d%T,@<?'A+?:Q6ARZc;0JP:)0fD'I2EENN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg0H`hr@N[E[0eje*1-.*K3]&c&$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+@]pO+>PW*0d&/1
3\rZT1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t1a!o/
@<?'A+>G\q7V-$O1,(F;+>>f:2)@9M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"BARZc;0JP:)0f1pI2**QQ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg2]tS$@N[E[0eje*3'&cM
3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K
3Zp.:+@]pO+>PW*0d&/13\iHO0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3b
Ch+Y`F_tT!E]P<t3$9>3@<?'A+>Ghu7V-$O1,(F;+>>f:1,CsG2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0fU:FARZc;0JP:)0f1pH0fh$D
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg
3?Ue&@N[E[0eje*0fh!C3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&
:3CD_ATBgS1,0mo6t(1K3Zp7%6#^ie1,(F;+>PW31c7<N3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp15+<X'\FCdKU2]th'Gp"jr0eje*1HIBL3]/W!$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp.5+AH9i
+>PW*0d&2*3]&NO0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!
E]P<u1a!o/@<?'A+>GYp9jr;i1,(F;+>GZ50JY[H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./hnIk6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0f'qH@<itN0JP:)0fV3L1cd?O$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg1a#M$Gp"jr
0eje*1cdEL3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS
1,g<u6t(1K3Zp.6+AH9i+>PW*0d&2-3]&WR1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!+t2D/Ej%
FCeu*+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg1a#M$Gp"jr0eje*1cdKJ3\rGs
$49Np/g+)<F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU0f1"I@<itN0JP:)0f;!G3'&`J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<0d%T*F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqg2BY_&Gp"jr0eje)3'&oS3\iZ%$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp.8+AH9i+>PW*
0d&/13\`HP1,B7E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=!
1E[f.@<?'A+>Gbs9jr;i1,(F;+>>f:0fD'L2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&
DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.8+AH9i+>PW*0d&/13\rTR
1bf=E$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r
@V'R@+>Ykt+@KX[ANCqg2BY_&Gp"jr0eje*3BAlO3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp.8+AH9i+>PW*0d&223\`KQ0K0=G$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fU:M@<itN
0JP:)0KD0K2``cQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@
+>P&^6t(1K3Zp.:+AH9i+>PW*0d&/13]/lX1GfFG$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$
ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.:+AH9i+>PW*0d&2-3\WEP
0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0f^@N@<itN0JP:)0ebXB0fh!C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp13+AH9i+>PW*0d&2*3]/`T2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,'hF@<itN0JP:)0etdH3BAuW$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp13+AH9i
+>PW*0d&2+3]/lX1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1,'hF@<itN0JP:)0f;!J2EEZP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp13+AH9i+>PW*0d&213]&NO1,91D$;No?+B*Q,
FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[
ANCqh0Ha(uGp"jr0eje*3BAiR3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!n
Bl%<&:3CD_ATBgS0ejdn6t(1K3Zp15+AH9i+>PW*0d&2.3\iKP0K0=G$;No?+B*Q,FCf;M+A,Et
<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh1*B;"
Gp"jr0eje*2**NN3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_
ATBgS0f'pp6t(1K3Zp15+AH9i+>PW*0d&2.3]&]T1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b
@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B;"Gp"jr0eje*
2**QP3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f:'r
6t(1K3Zp15+AH9i+>PW*0d&2/3]/]S1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$
A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1*B;"Gp"jr0eje*2``WI3\`N"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp15
+AH9i+>PW*0d&203\WNS0f]RJ$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh1*B;"Gp"jr0eje*2``WP3]/]#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+AH9i+>PW*
0d&/03\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u
0H_K+@<?'A+>P_q9jr;i1,(F;+>Gi:2*!]O2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&
DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+AH9i+>PW*0d&213]/oY
1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+>Pbr9jr;i1,(F;+>GQ22)I?L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!Y
A0=WiD.7's3Zp14+<X'\FCdKU1,L+J@<itN0JP:)0fM-N1cdHM$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh2'>V%Gp"jr0eje*0KLsF3\iDs
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp18
+AH9i+>PW*0d&2)3]&TQ1,K=F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>Pht9jr;i1,(F;+>PZ42)@9L2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=M@<itN0JP:)0ek^F0KM$E$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]th'
Gp"jr0eje*0fh0L3\`T$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_
ATBgS1,g<u6t(1K3Zp1:+AH9i+>PW*0d&2.3\r`V1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>Pku9jr;i1,(F;+>Gf91bh$G0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU1,pCN@<itN
0JP:)0f(jI0fh'J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@
+>Y\o+@KX[ANCqh3?V%)Gp"jr0eje*0fh-O3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO>+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp1<+AH9i+>PW*0d&2+3\`QS0e`qA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E];4DBL\g0eje*
1-.0H3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>b35F`&<W0JP:)0f(jJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp7%8p,"o1,(F;+>GZ52)mWO2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp7%+@KX[ANCqj+A-co+>PW*0d&2-3\WBO2)bjL
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1a#D5
DBL\g0eje+0KM!G3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+?(E8F`&<W0JP:)0K;*I2EE]N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1E[f,F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp@(8p,"o1,(F;+>>c91bh$H3=8SY;cI+=De*s.
DesJM0ht%f.V`m4FDl)6F!,NU/KeeHA9;a.Ci^_<Df^#>Ec5H!F)u8?/e&-s$;No?+ED%8@;0U%
GA(]4ATMg!@q?)V-oiG31bgF%0d$o4%15is/g+kGF*2M7+C\c#AKVEh@rGk"EcP`/F<Dr?@<6!-
%13OO:-pQU@rc-hFCd+>DJ=3,@;KY(AKYD(8l%htFDl)6F!,C1C1Ums%15^'7!*?cCi`rtC2[Wi
4ZX]qDf0-1+=CT4De*s.DesJB+<VdL+<VdL+<VdL+<VdL+AP6U+Dtb7+EVO?Ci^_;@VTIaF:AR*
0d/S5-8I"m@rc-hFCf3*A9;a.Ci`rj8l%isDf9H5+A,EtFDl)6F"BpZ6uQOL+<XEG/g,+AF)rIF
ASbs$@;]Tu8l%ir%16QeBl%<pDe(UX:-pQ_@WcC$A86$n+<Y_W/KeMFBl%=$+CQC)F_kl>+Cf>,
D.RU,ARloU:IH=ADdd0!FCfN8+EM%5BlJ/H+:SZQ67r]S:-pQU6?R!YA9/l%+Cf>,D.RU,ARloU
:IH=ADdd0!F(96)E-*]T;KZk"GA2/4+=M8I.1HVZ67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3
De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?
Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG
/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:ARP67sAi$;No?+<Vd]+ED<A
-Xq44Ch.:!A1&KB:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ
67sAi$;No?+@BR\ART\%3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d+
+EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)o'0emNRGqh,u/Kf1TA79RkA0>K&EZdtM6m-GeEc`FGD]h_fDKU1H:K%]0%16T`@s)g4
ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEo
ATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1r
FD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+DPh*+C]J-Ch+Z2FD5Q*FD5<-+CT.u
+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$;No?
+EM+9+EhU4%14ItDe+$&EcYr5DBN\4A7B[qCh.$nF=04414(WG:IJ5X6k'K<De*="Bl%<j@<?'D
3ZqjICij]3D'3qAFCB$*-RT?1C2[WlF_PZ&@r?BO3ZpUIC2[WlF_PZ&@r?At$4R>;67sBpDI[]u
D.RU,+C]J-Ch+YsDIal2@<Q3)/KenQF*&O6AKYN%DIjr"AS,k$AKVEh:-pQUF(96)E-*48ASu("
@<?4%DBO%>+DG_7F`M%9BOtU_ATAo%DIal"CghC++A,Et<_Yt)D..NrBFP;@:IJ5X6p3RZC2[Wl
F_PZ&@r?BMC2[WlF_PZ&A79Rk.3L#n+>PBo8l%iU9gfEtFDYu5Ddso/F`\`R8l%iU9gg?<$4R>;
67sC%ATT&5F`_SFF<G10Ch7Ys$;+)^7S-9B4ZX]5C2[WmDf'?&DKKH#/no'A-OgDT:IIlP5t"[@
;cH4X9LV**+DPk(FD,`,E$/n7@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>UM'p:IIZD9LTBt:-pQU
@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6EbTK7
+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ/gjRb;C="WCi<g)Ap@Zi
8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6q0aA71BS5$>=!ZA3Dt$:-pQU
;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH33/5/MB$>=!ZA3DteART+#+=JU467sB]ATDj+Df.TY-S-Z\De+$&EcYr5
DCI+a+<X!nBl%<&:3CD_ATBgS-S-Yi3biSD@WcC$A7KM!.4chh+@KX[ANCq]/8B*6@WcC$A7T+j
ALT0(7L]]GD/XQ=E-67FBOtU_%13OO:-pQUFEMVA+E)-?GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2
+CoV8Bl7Q+@rH4$ASuU$A0=K?6m-;a@:TfSBOa1dBOtU_/12i++Z_G7.3L>m/2AGD7L]\6$;No?
+D58-+E2@4E,ol,ATMp2EZfF5EbTK7%17/>3Zoh*4"qd4.=4*:+>b3RATT%BC2[X%Eb02;%13OO
:-pQUD..-r+A,Et+Cf4rF)to6%16`23ZpLF+=CoBA8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"
@;BEsC2[X*FD5P=+:SYe$;No?+D58'ATD4$AKYW+Dfp#?+EqOABHUf'D/Ej%FCeu*BOtU_ATDi$
$?J?k+EJYV+?L\o4>J-T7O]H2-8%J)/0H?h/jMHG1*BpZ->d1,ALT&T4s4JI$4R>;67sBhE,]B+
A0>i0F*&ODEc5H!F)u8?+EM%5BlJ/:/Kf"QAS,Y$+D>=pA7]cj$?J?k+EJYV+=Jui9L^HR/0H>q
4"qd4.=4*:+>b3RATT%BC2[X%Df^"J%17/>3Zr*G+=nXV%13OO:-pQUF('6'+Dbt)A0>r'EbTK7
Et&ItD/XQ=E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DE9-S$7KsY3ZrN_85E/`+EJtSGB.D>AKZ&-
Dg-//F)rHr:IIlP5t"[@;cH4X9LTBtF)>i<FDuAE+EJZLEbTW,+EM47GApu3F!+(N6psUF<)Q:S
<E)CT7S-9B%13OO:-pQUF`:l"FCcS(F_PZ&+D>J1FDl2F+>"^WFDl22A0><%+E2.*Bl5&8AU&;>
D.-ppD[d%G:IINL8PDNC8Q/Sa;HZ.D+=Js+0H`,"HTF211a$FBF<Dr':IINL8PDNC8Q/Sa;HY@V
$;+)^6<-TN6qBmJ<)6Cp4ZX]X:IINL8PDNC8Q/Sa;HYP!1*]I^.4f.D@:TfS1a$a[F<Dr':IINL
8PDNC8Q/Sa;HYA/1,V-c:IINL8PDNC8Q/Sa;HXG9%15is/n0*JAKZ&.H=\4;Aft_tDImisFCeu*
E,8rsDKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chh@rH4$ASuU$A0>r'EbTK7+C]V<ATK4.
$?L'&F`_SFF<Dr':IH=8Df'?&DKKH#+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*
+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*?rD/aN,F)to'1,2Nj/h1=QBl%<pDe*?rD/aN,
F)to'+<Y_W/KeMFBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7/g(T1
:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+@:3bCh.T0@3B&uD/aN,F)to'+A,Et+Dbt)A0>r'
EbTK7/g+&7DBO.;FD)dFEc!67$;No?%15is/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+<Ve%
67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<VdL:-pQU@r-()AKYE!
Gp%$EASrW$Bk)7!Df0!(Bk;>p$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q+<XEG/g,(O
ASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:ARP67sAi$;No?+<Vd]+ED<A-Xq44
Ch.:!A7KOpE,oN2F(Jl0+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ3
05i9K$;No?+:SZQ67sBJ@<Q3jFE9JP$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'
EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AKYE!A0?21Bl%@%+CSekDf-!k:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)3,N)L1,pC.+ED%2@;TR/Eb0'*@psIj+Cf>,
E,oN2F(Jl)F(96)E-*4ED]j(=Dfd+?Afti,A0>;kA8c>p$;No?+>PW*0kP!+0Jst)+E_a:+=LuD
@<?1(AT0(@FDi:CBQ&);E,Tc=@:F%a+EMXMCh4`$Bl%?'E+*j%Et&IO67sB90JP:oAR[>Q+>"^G
DeX*1ATDl8-Y[=6A1&L.A7T7^+CSl(ATAo1Dg#i4B-9fB6m-2]FCfK)@:NjkFDi:9C2[Vl$4R>_
AT;j,Eb-@@IUQbtDf0W$@<,j_H>.>'H=gl-ATKJ<C3(a3$=e!aF`MM6DKI!K@UX=h-OgDmDe!Tl
F)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41
DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH
>9G^EDe(4C%13OO:-pQUB4Z0-C2[W*@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!
+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO:-pQUF(KG9G&:b!$7BS,A9MO)
F(oQ1+DPh*@WcC$A7KM!-TsLGHS.od6rm#M%16igA7B[qCh.'bFCdTr+CT)&FE2)4+EV[H@;Ts2
-OgDtDe*="Bl%<iDKJ$&+?hi$De*="Bl%<iDKH<p%15is/g+kG@rc-tASuT4@WcC$A0>;uA0>r%
G%DdJ+Dl7BF<G%(+CoD.AKYGnAoD^$+:SZQ67sC%@rc:&F<G4-DImisFD5Z2+EVNEBl8!7Eb-A,
ART+\EZee.A0>Au@<6K48l%iU9gg+@@<?!m%15^'6rm#M4ZY!+De*="Bl%<iDKIsTDe*="Bl%<j
@<?'0+=Jre1+@WD:IJ5X6k'KFD/a<0@j#`5F<Dr':IJ5X6miEN%15is/g,4HF<GLEFDuAE+D,>(
ATJ:f8l%iE8PDQ93ZoebDe(J7C3(a3$;No?+A,Et6:"7-3ZoOmC2[Wl@;@K0C3(a3$4R>7:IIlP
5t"[@;cH4X9LV**+DPk(FD,`,E$/n7@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>UM'p:IIZD9LTBt
:-pQU@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6
EbTK7+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ/gjRb;C="WCi<g)
Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6q0aA71BS5$;No?+A,Et
+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^
6qL<V;Fs2T<(Tk\>"MOR3Zr0V@<?1(AT/b>C2[Wi-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T
-SB^ZE$l)%8l%iC8Q/Sd8O?EV8P`)b8PhQ2+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi8l%i^
?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6psUF<)Q:S<E)Oc:0L4c%13OOBOtU_
4ZXrc67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D'pl.7L]]<ART+43bW)5A1SiO-Vcu\+BE&oF(oQ13Zoe$-u*[2G%G]8Bl@l</12P_
6?R!YA0=WiD.7's3Zoe$-mC]eDe*="Bl%<iDKI<Y-QjO"@<?'A+=A^TDe*="Bl%<j@<?'0/5/MB
$?L'&F`_SFF<G7.@:TfS%15is/g,7YEc*"<AnE00BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3A9Dp,
DJ((a:IH=ADdd/c$><p43bW)5A1T)V3?^F?0e"5!-S.q\%13OO:-pQUB4Z0-E,oN/Ec5H!F)u8?
+EM%5BlJ/:/Kek@@<Q3)Df0B:+D>=pA7]d(@rH4$ASuU2%17/>3ZqsEGA(]4ASQ9rEbTK7+=Js+
0H`,"HTF211a$FBF<DrGDe*g-AT0"+$4R>;67sBt@;0U%8l%ht@r,RpF(KD%$>2L_+?MV,-YdR1
Df-\4De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl#.>%13OO:-pQU@rH1"ARfg)B6%p5
E$/\&E+NotASuU2+:SZgAT2]R3Zr'GAT2];/j:Cj%13OOF)>i<FDuAE+=CZ;D/aN,F)u&5B-8fZ
/g)MN$;No?+Co&-BPDR"+D5_5F`8I:ART+\EcW?4$>;R`+Co&-BPDR"C3*m*BlJ/@/j:D)3[-:$
5'o=51*C4@F<G3*$4R>;67sBjDf'H6ATMo8@;Ka&DJsE'AT23uA7]Y#+EqaEA9/l-DBNM!@qZut
Ec6)>+=LY@@rc^0@q]Fo.1HVoDe*EB3ZosrI4dcG@rH4'C*l+e-n'Kr5WWOuE%*+d4s4Je+>#2m
/j:CgAT2]"$4R>;67sBjDf&rtDIjr(ART+\EZee.A0?)7Eb$;'AS,XoBln'-DK?p0$?J?k+EJYV
+?L\s+D;lK/g+YBA7Z2W%15is/g+SAE+Not+E27?F<GOCDe!@"F)Q(AF(96)E-)NrF$2Q,F"AGE
ATqg%FCf3.@rc:&F<Dtd4"qd4.=4*:+>b3RATT%BC2[X%Df^"J%13OO:-pQUEb0*+G%De)+D,2/
+ED%1@;0UnDJ()4ARoq$A79@t+C].qDJO;9@:jUmEZbeu:-pQU@<6L(B5VQtDKKqB/Kf.KASH0-
E,oN2ASu!h+CT/*Dg?CHD.Ok"$?J?k+D>7-/0H;n+?_>14YAB14ZY5Z3[Z%[BOPdkASuL0+EIu!
%15is/g,4DG%De+Df'H6ATMp(A0>],@:UL%@rc:&FE7luF)>i<FDuAE+=D)MFDuAE+D,>(AKYf-
@psInDf0VW-OgD2F$2Q,FDj]G;cFl\.3NhTBlmo/F(fK9E+*g/+A,Et9M[rB<(0_b7S-9B%17/n
Dfp/@F`\aI+Eqj?FCcS9BQ&*6@<6K48l%iC8Q/Sd8O?EV779U:9LTBt%15is/g,:UA79Rk+Cf>,
E,oN2F(Jl)8l%htA8-+,EbT!*FD5Z2+>"^VAT;j,Eb0;7H=gl-ATJ:f:-pQU@;]TuE,0c6E&':'
AU%c/Df-\-Df'?"DIal2BOu!r+E1b2BFP;i+F8'>E,8rmAKZ&-Dg-//F)rHr:IIZD9LV$8:IITB
;cHXd6<-uV:JP(b:^ma@$;No?+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%
FCf]=+DkOsEc2Bo8l%iA<CokP84c`Z:Jt=Y3Zoh*4"qd4.=4*:+>b3RATT%B8l%iA<CokP84c`Z
:Jt=C%15^'6pamF9LMEC;cHOj=Zneg8l%iA<CokP84c`Z:Jt=H-o*#@7O]m%ART*Y$8`lEF`\`R
8l%iA<CokP84c`Z:Jt=C4#/ZT8l%iA<CokP84c`Z:Jt=)$4R>;67u_mFCcS9BmO>5De:,)ASu("
@<?'k+E2.*Bl8$(G]Y'L@rc:&F:ARuD/XQ=E-67F-mC\sF"&Xf+EM%5BlJ/:@X3',F!hD(F)>i<
FDuAE+=BcW6m,uXD/aN,F)to'+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1r
FD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$nA8-+,EbT!*
FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&%13OO@rGjn@<6K4FDYu5De!-?5s]7(
A7B[qCh,Od3F<ml3Zoe95s]7(A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\Df7d"+Co1s
+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgCl$8EZDFEAWQF`:l"FCf3*A8Pam
BkCptF=.M)%17,s+=CW@Bl%<pDe*?rD/aN,F)to'-OgE'F!)i>F_PZ&C2[X)Df9H5@rH4'Eb0<5
ARm.t$4R=s+EDRG+=D;NA79RkC2[WnBleB:Bju4,Bl@l:%14g4EccCG-ZsB=@<?'qDe*p-F`Lu'
A9Da.F!hD(%14g4EccCG-ZWd7ARTXkC2[W1%13OO:-pQUA8,OqBl@ltEbT*++E)41DIm?$Bl5&6
ASbpdF(K*)A.8l@67sC!A0?:QDf9P'$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(L?F"Jsd@WcC$
A90DHE+EC!ATJu&+F7a@+D,>(AKYK$DKK<$DJ=!$+A,Et+Cf4rF)to6/g(T1:-pQB$;No?+@:3b
Ch.T0@3B&uD/Ej%FCeu*8l%htCi<`m+EM%5BlJ/H+B!?"+EqOABHS^DD(,o$:-pQB$;No?+<VeI
AT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL
+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[Wn
ATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr
:-pQU%15is/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2
F(KD8Bl.g*Bk(k!+DEKI.1HVZ67sAi$;No?+@BR\ART\%3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r
@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<V+#:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0ktiK0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(F;C3=DJ
2]s[p@:Wn[A0>W*A8lR-Anc'm/no'A+DPh*E+*d(F"V0AF!,49A9Ds)Eas$*Anbme@;@K0C3'gk
%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0AF!hD(@rGk"EcP`/F<Dr?@<6!-%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]Tu
DfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6
F!i)7+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!
+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X
6k'J4$;No?+DPh*Bkh]rG[G]&GV4;VE$/k4+E2IF+Co1rFD5Z2@<-W9@;KXhDBNJ(Eb/a&DfU+4
$;+)^6qL<V;Fs2T<(Tk\>"MOR3[\Z\A8,e"?RIBQ-SAaR+Cf(nEcZA4+DPh*G%G]8Bl@l</13&r
BlGF/$:.?W78?ZF<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA'
;cI+28l%in@VQ>Z8l%iC8Q/Sd8O?EV8P`)b8PhQ2+@/[m78?ZF<(JQ4:IITB;cHXd6<-uV:JP(b
:^ma@$;No?+D58'ATD4$AKXT@6m,uU@<6K4F(96)E--.1$>O'e@<6L$F$2Q,4$"a(De'u*De*p2
DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5l#C2[WpBl%@%4ZX]64>J$d
0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G@:UKjCghC++D,>(ATJu'@:O'q@;]TuGB.D>AKZ)5
+F7a@+:SZ+C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)HTE?*+DPh*Anc'mEt&Hc$;No?
+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7lu-ZW]>F)kb<4ZX]B+D58-+?MV3C2[X%Ec5Q(
Ch4`(De*fqEc#k?C2[X*F(KB%Df00$B4>:b-OgD2HS-Ks+EMR5.6T^7HTE?*+EMR5%13OO:-pQU
F`:l"FCcS,Bl%@%+DG^9F)Q2A@q?d/BlG2/DBNA(Bk;0)%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l
+u(3]EapO@/1)u5+?V#(Bkh]:%14dOC2[Wn@<<V7+<VdLH?*S9Cgggb+=KE-HU^S#78kWs8l%iC
8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA92j2Eb/ciF<GmMAT2Ho@q?c24u%CR8PDQO.6C-t6psUF<)Q:S
<E)Oc:0L4c%14dOC2[WnDdm6cF<D\KH?*S9Cgggb+=KE/HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0Ka)gA8PajARo4k+<YuNAT2Ho@q?c24u7OT8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dO
C2[X*FD5Q%@<<V7H?*S9Cgggb+=KE1HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA9;a.
Cia,qF<GmMAT2Ho@q?c24uI[V8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X$DId0t+<VdL
H?*S9Cgggb+=KE3HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8lR-Anc'm+<YuNAT2Ho
@q?c24u[gX8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X%@<-4++<VdLH?*S9Cgggb+=KE5
HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA9Ds)Eas$*Anbme@;?u.H?*S9Cgggb+=KE6
HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g+\C+CT)&+<Y91Ch7Z1AU%p1F<G:8+F7a@
%17DmG\M5@+u(308PDQO+=o,f4A&C;6qL<V;Fs2T<(Tk\>"MO"$?L'&F`_SFF<F1O6psUF<)Q:S
<E)Oc:0L4c%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*s.
DesJM0ht%f.UmO7Ch.:!A9;a.Ci^_?/M/)SF_PZ&F!+m6Ap%p+Gp$U8D/Ej%FCeu*8l%htFDl)6
F!+t/@<6K4F(96)E-*]A$;No?%15is/g,=KEaiI!Bl,mR%15is/e&._67sBJ@<Q3jFE9JP$;No?
%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA
67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(CAD..]F3$9dqEb0,s
D.R6#@UWb^F`8IFD]j">De+!#FD5Z2+>"^WBl.g*BkD'jF!+(@9H\%eF*(i,CbKX6Bl8$(DIIEm
AISuA67sB90JP;!@<jRa+>"^YE+EC!ARloqDfQsm:IH=EDfTqBFDi9qBl8'<+AYoF$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+Bosu
De3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(
@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3
C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5
ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;67sC%
ATT&<D.F(_-YdR1G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F/kSo-<_Ysk$>OKi@WcC$A7T+jAN`'s
FE;P4D/^jM%14ItDe*s.DesK<ATDj+Df-\4De*s.DesK(F_PZ&@r?B94ZY?F/kSo-<)6:`;cZU\
%16igA9;a.Cia'.Bl%<iDKJ$&+?hi$De*s.DesK(F_PZ&@r?At$4R>;67sBpDI[]uD.RU,+C]J-
Ch+YuDfor>ATA4e8l%iS:JXY_<_YtF3ZohcDe*s.DesK(F_PZ&@r?BMC2[WlF_PZ&A79Rk.3L#n
+>PBo8l%iS:JXY_<_Ysk$?U-(Ci<f+E-67F-V@0&<)6:`;cZU\-OgCl$;No?+EM+9+E)CEE-67F
Anc'mEt&IK:IJ/X:J=\M/g)NVDe*s.DesK)Df'?&DKKH#/no'A-OgDT:IJ/X:J=\d78m/T8PDQ9
3Zr0V@<?1(AT/c,E+*j%+=DVHA7TUrF'N?hDImisCg:^nA6`kfA7^"-F'L(D8l%iS:JXY_%15is
/g+V3@r$4++E(j7A8-+,EbT!*FCeu*Anc'm+E2.*@qB0nBl5&4F`\a:Bk)7!Df0!(Bk;?.F(96)
E-*45Bl[cpFDl2F%15^'6psUF<)Q:S<E)CT7S-9B4ZX^#E+*j%F(K;5-mC8k;aXG1/3@Zd@rl7,
?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iS:JXY_%13OOFD,5oA3Dsr
-Vcu\+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df$j2$?Trm@:VM^+<Yc>ART+#9L^Q]-Vcu\+BE&oF(oQ1
3Zoe$C2[X)Df9H5G%G]8Bl@l?-QjNuF_PZ&+AR&r@V'R@+=A]g,!'IWA9;a.Cia'.Bl%<iDKI<Y
-QjO"@<?'A+=A^TDe*="Bl%<j@<?'0/5/MB$?L'&F`_SFF<G[=ART*Y$4R>;67sBnASu("@<?''
FDl)6F!,O6EbTK7+CT.u+ELt7AIStoEap56Df9H5@rc:&F=044+>P'VCi^^HC2[X)Df9H5-OgE(
D/XQ=E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DE9-S$7KsY3ZrN_85E/`+EV:.@:Uo_7P&Y"DesK)
EbTK7.3NhTBlmo/F(fK9E+*g/+A,Et<)6:`;cH1a<(9GQ71BTFD/XQ=E-67FF!,[IBlmo/F(fK9
E+*g/+A,Et6qL<V;Fs2T<(02E8PDP^$4R>;67sC'E+EC!AKYH)Bl%<&BPDO0DfU+G/Kf+VDfTE"
+CT=6E,8rsDBO%4G]Y'F@:O=r%15F%8PDNC8Q/Sa;HZ.8+=Js+0H`,"HTF211a$FBF<Dr':IJ/X
:J=\R<CokP84c`Z:Jt=C%15F%8PDNC8Q/Sa;HZ.8+@9("9LMEC;cHOj=Y(sV,>:QU/9GQ:@:TfS
1a$a[F<Dr':IJ/X:J=\R<CokP84c`Z:Jt=C4#/ZT6<-TN6qBmJ<)6Cp%13OOF)>i<FDuAE+=CoB
A9;a.Ci^_/Df'?&DKKH#+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2
@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%16QeBl%<pDe*s.DesK)Df'H6ATMp(A25l767s`sF_PZ&C2[X)Df9H5@rH4'
Eb0<5ARlp)/M/)SF_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4
F(96)E-*]A$;No?%15is/g*MtDf0,s+D,Y4D'169F_PZ&C2[X)Df9H5.3NJ9@rcJs$;No?%15is
/g+Y;@;]^hA3(/,:-pQU0em9O@PBba/KePABl8!'Ec`EOBkhQs-Qli.A7]9o@:jUmEZf4;G%ki,
+A,Et+DG_8ATDBk@q?d)D]ib/De':a%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0A
F!hD(@rGk"EcP`/F<Dr?@<6!-%13OO@rGjn@<6K4+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*+
+CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*
+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUAn?'oBHV>,EHPu9ARlp+FD5Q4+CT.u+Eh=:F(oQ1+EVX4
@r#drB-;)1F`)70$7A,*6$.-UF(dQo3@>q^ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO:-pQUF(KG9
G&:b!$7BS,A9MO)F(oQ1+DPh*@WcC$A7KM!-TsLGHS.od6rm#M%16igA7B[qCh.'bFCdTr+CT)&
FE2)4+EV[H@;Ts2-OgD1C2[X)Df9H5G%G]8Bl@l3C2[X)Df9H5@WcC$A7KM!-TsLGHS.od6rZrX
9N+td6k'K<De*s.DesK(F_PZ&@r?BO3ZpUIC2[X)Df9H5@WcC$A7KM!%13OO:-pQUBl7F$ASl!r
F<G%8Bl%<&@rHL-FCfJ%$;+)^<)6:`;cZU\4ZX]6C2[X)Df9H5@WcC$A7KM!4)/\E@WcC$A7T+j
ALS`M0d&5#I7d:'<)6:`;cZU\%14IK5s]U5@<6*B3B8H0E-67F-V@0&<)6:`;cZU\-OgCl$;No?
+EM+9+E)CEE-67FAnc'mEt&IK:IJ/X:J=\M/g)8Z+=CoBA9;a.Ci_4CC3(a3$;No?+A,Et<)6:`
;aNcC4Y@j)C2[X)Df9H5@UX%)Bkh]:%15^'6rZrX9N+nZ;cH4X9LV**+DPk(FD,`,E$/n7@<?0*
-[oK7A8c@,>\@VcATD3q>\\1f>\\1fAU&<<>UM'p:IJ/X:J=[r$4R>;67sBQ:IH=HH#n(=D'3P1
F*(i,C`n%<E$/k4+E2IF+Co1rFD5Z2@<-'nF!+n-Bk;0)A8-'q@ruX0Gmt*Q:IITB;cHXd6<-uV
:JP(b:d$ER-YdR1?RIBQ-SAaR+Cf(nEcZA4+DPh*G%G]8Bl@l</13&rBlGF/$;+)^6qL<V;Fs2T
<(Tk\>"MOR/g+nJ@<?1(AT/b?+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K
87,_&<*s!):IK,1C+1]+:IITB;cHXd6<-uV:JP(b:^ma@$;No?+C\bhCNXS=De:,&BleB:Bju4,
ARloqBl%?'E,8rmARlotDBNn@F<G+.@ruF'DIIR"ATJu8@rc:&F<G+.Eb/a&DfU+4$;+)^<)6:`
;aa2U<)Q:S<E)CT7S-9B4ZX^#E+*j%F(K;5-mC8k;aXG1/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jU
HTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iS:JXY_%13OOFD,5oA3Dsr-Vcu\+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:-OgE)
BOtU_4ZX].FD,5oA1UDD/1;l@67sB]ATDj+Df.TY-S0"NA9;a.Ciac2EcYr5DCd.X+@:3bCh+Y`
F_tT!E]P<j/1;]'C2[X)Df9H5@WcC$A7KM!.4chh+@KX[ANCq]/8B*6@WcC$A7T+jALT0(7L]]G
D/XQ=E-67FFD,5oA.8kT$;No?+D58'ATD4$AKZ)5DesJ;F(96)E-*42DIal2@<Q2k$;No?-ZW]>
FDl)6F(96)E-*Hj3Zp1#D/=89-YdR1FDl)6F!hD(%17/nDfp/@F`\`R@rH4'Eb0<5Bl7Q+C2[X)
Df9H5+>,9!-OgCl$;No?+D,2,@qZuuART+\EZee.A0>B#D/aN,F)qctBK[sjA7]suBlmp$F(96)
E-*3N0fq'30e%H13Zp1#B4Z0--YdR1FDl)6F!hD(%15is/g+YBD/aN,F)rIADf0)sE+NotASuT4
B6%p5E$0@CEb'5#$7Bj:F!j+'+Cf>,E,$LDB6%r6-YdR1FDl)6F!iCZ/M8/YA7]_$+=CoBA9;a.
Ci^s5$4R>;67sBmATVEq+CT.u+Cf>,E,oN2F!,F?F*)AADe!@"F)Q(.$?/-\+Co&-BPDR"C3*m*
BlJ/:-o!e;+>PBm3]\B?+D58-+=Bu];cI+=De*s.DesJB%13OOFDl)6F(96)E-+5q+D<<I/8u%*
%17/nDfp/@F`\`RDfp/@F`\a<Bl%?'Ci<flFD5Z2F#kZX$7KsY/g,7S85E/`+EV:.@:Up2Df9H5
@rc:&F=A>VEbTW,+EM47GApu3F!+(N6rZrX9N+nZ;cH4X9LTBtF)>i<FDuAE+EJZLEbTW,+EM47
GApu3F!+(N6rZrX9N+>N;cHXd6<-uR6q0aA71BS5$;No?+E_X6@<?''@rH4'Eb0<5ARloU:IH=9
BleB:Bju4,Bl@l3/Kf(FEHPu9ATJu?Anc'mEt&IO67sBhDIal/CO0]61,U[qG\&"9DBNG-D/E^!
A0>r,ASc0*E+*j%%17/!H?*S9Cgggb+EM47GApu3F!)kYC2[WoG]\![-S.kc6rZrX9N*B%8l%iC
8Q/Sd8O?EV8P`)b8Pfj'%15is/g,:UA79Rk+C]J-Ch+Z%BleB7Ed8cZ+EMXCEb/c(@<3Q1Cgh$q
+EV1>F<GF/@rcJs$:7`a9LMEC;cHOj=ZnA[-o!e;+>PBm3]\B?+D58-+=BcW6rZrX9N+8X8PDNC
8Q/Sa;HY@V$:7`a9LMEC;cHOj=ZnA[6<-TN6qBmJ<)6Cp/1<7u9L^H^FD,5oA.8l&+E2IF+=BcW
6rZrX9N+8X8PDNC8Q/Sa;HYA/1,V-[<CokP84c`Z:Jt=)$4R>;67u_mFCcS9BmO>5De:,)ASu("
@<?'k+E2.*Bl8$(G]Y'L@rc:&F:ARuD/XQ=E-67F-mC\sF"&Xf+EM%5BlJ/:@X3',F!hD(F)>i<
FDuAE+=BcW6rZrX9N*'DDf'H6ATMp(A0>?(Bl%<&@rH4'Ch7^"-OgCl$;No?+ED%7FDl22+E)41
DBNJ(@ruF'DIIR"ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?V#;5s]U5@<6*B3B8Gr$>=-pFDl2FC2[W<2.pK<ATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt)i
$9^Np0J5@<1E\hD+F@!b:43QY+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.
DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,
F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?
De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKY`+A1hh3Afu;3
Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$9^Np0J5@<1*A_C
+AH9i+>Pr.+>PW*0b"I4.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c
+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+F[a0
A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,
@<?4%DCco=G%#*$@:EdjG%kA-FD,5.G%G]'+=LuCA8#OjE%*=I$6UH6BOPs)@V'+g+Cf>-G%G]9
ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=
De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(
DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<DuHDe(J>A7d8"$4R=b+<Y?>FDs8o06_Va
/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k\?!%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh
@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*
8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9
C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\7Gp$R4DeC2$AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19
FD5W*+:SZ#+<YB9+EV:.+EqO9A1e;u+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/
+EMgLFCf<1/e&.1+:SZ@4WlF23A*$/4Zso^@<itS/0H]%0ej+E+=\LNBl7j0+D,>4+E(j7ARoLs
+Eh=:@N[(1F=A>SD]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%156]+>>E.
/heD24Wm4*@N[Bb/0H]%0ej+E+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu
8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6Uf@Eb03+
@:NkZ+A,Et-Z^CYH79tQDe!3lAKY])FCfK)@:NjkGA2/4+CT.1-u!F7A18X8DKKH1Amo1\/e&.1
+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS-u*[2Df.!T+=LuCA8c'l.3N&:A0;<g
+<VdTC2[X(H#n(=D/`p*BIP'<DBO%7AKWCI.3NGF@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V
+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9-u!F7A18XFBPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%
F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'
+EVNE-u*^0FD,`,E%)o>Df0`0DKKT2DK@E>$6Uf@C2[W8E+EQ'Eb0*+G%G2,Ao_g,+EV:.+Cf>1
AKXT@6m,oKA8c?.E+*6l@:s.(+<YE;A1hh3Ado(i+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0
F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*?De(J>A7c8X+<Ve@F!,@=G9C@8Dg-86A0>f.
/So-=AKYH-+=LuCA8#OjE%*C^=`8F*@ps6tA8c[0Ci<`m+DPh*/oY?5%144#+CT.u+E2.*@q?cs
F<G:8+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtFCFDi:5DII!jAISth+<YK=@ps0r
:ddbqEb/ZiBl7Q9%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u
+Cf(nDJ*O%/e&.1.Nh_j7Q;N-@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)
Eb0*!D.7's+>Po!AoD]4<E)FI.4u&:+=\L#=]@g4D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4
+Eh10F_)[N2D-*p%143e$9^Np0J5=;0H`MA+AZKh+>Y`'+>PW)3"63;.Ni/1A7]9oDIn#7C2[X%
@<-4+/no'A+E1b0@;TRtATAnZ;aX,J3&Mh#BOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,
Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$
Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(
ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1.NiJEA92[3EarZ'F`V,8
+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.
+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6Uf@D/!m+EZet.G\(q=Bl5&.De(J>A7c8X%156]+>>E,
/i+V54WmO1F<ELn+>PW)3"63;.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&
Bl5%c:IH=!@:C?(1a$4EA0>u*F*&NPF(KH9E*m?uA8lR-C1Ums-OgD*.Ni>;G\(D.@3B/nG9D!Q
E,Te?Bl5&.De(J>A7c8X%156]+>>E,/i"P44Wm[7E$-nn/0H]%0K9LK+=\LDDf'H0ATVKo+Cob+
A8,Nr@psFi+E(j7A8bre$6Uf@F`:l"FCeu*C2[W8E+EQ'FDi:4ATM@%BjtWr@q]:gB4Z,n$4R>*
4WlF22_Hg-4ZsodAT/bI1b9b)0JGHq$6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4
D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%144-+ED%4CgggbA0=K?6m-#SEb/a&
DfU+GA8,IbEa`f-Bl5&.De(J>A7cr9+ED%(F^o!(+EM7CAKYo'+DPh*/oY?5%13OO4ZsoA/iPC:
+?_k1;e9nj1,LO)1,(CA%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+DPh*/oY?5+:SZ#.NiV?G9CX=
A0>PoEb&ZuE-WRMGBYZUF_l1Q@rH3,ARoLsBl@ku$6Tcb4ZsoA/iG=9+?_k16$6f_0fU^,1,(CA
%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Uf@C2[W8E+EQ'Bl7HmGT^^;E,ol?ARlnm$6Tcb
4ZsoA/i>79+?_k18p+qm1,1=&1,(CA%144-+DPh*F`V,7@rH6sBkK&4C3(M+A7T7^%144-+D54r
E-!.>Dg*=7De!p,ASuU$A0>T(+DPh*/oY?5%143e$9^Np0J5480H`MA+A-cm+>Gi,+>PW)3"63;
.NiJEA1hh3AftW&@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$9^Np0J5170H`MA+A-cm+>GQ$+>PW)
3"63;.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&.De*BiG&2)*A0>K&EZf1,@LWYe.NiSB
DJsP<CggcqARoLsF!*%WEb/ioEZfIB+EMX5EccGC/no'A+DG_7FCelk+E(j7F(96)E--.RBkh\u
$6Tcb4ZsoA/i,+>+?_k19jr;i1GLF'1,(CA%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'
@ruF'D@Hp^$9^Np0J5.62]t7H+AH9i+>Y`'+>PW)3"63;.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<
C`mP&@WNZ%@;[2sAKZ#9D@Hp^$9^Np0J5.62BY.G+AH9i+>Pr.+>PW)3"63;.Ni>;EcZ=FEb0&u
@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@l3E,oZ2EX`?u+<YcE+EV:2F!,L7
Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1
Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6Tcb+:SZmDe(a[13-r=BleB-
E\]@E67sa&De(a[13-r=BleB-EZfET/Kf(F/TPE8BleB-EZdtM6m-#S@ruF'DIIR"ATKI5$;No?
%15is/g+,,BlbC>F(96)E-*3FEb-hCAS5^uFCfK6+<X9P6m*U_Bk)7!Df0!(Bk;?<+<X6t-Z^CQ
@3?\*Df9.q$;No?+E2@0@ruEpAKZ)5+DkP$DKK<$DBN@1D..L-ATAo7@rc:&F<G[=@<<W0DffQ3
+EV:.+Dbt+@<?4%DK?6o:-pQU@;]TuDIIBnF!,C5+CT)&+CSc%Bm+&18l%htA8,OqBl@ltEbT*+
/e&._67r]S:-pQU1,(CA@;p6@2BXRoF('6'A0>T(+=LuCA7T7p.1HVZ67sB90JGJ'@<jU_+>"^N
De'u4Eb/f)Eb090DffQ$%15is/g)o'0edK`Ftb`q/Kf+GF<G16EZf4CARf3Z$;No?+>PW*0l:?E
0KC7-+EML<BlkJ3DKKe>C,Rb$05<F"0d(OIEbTK7Et&IO67sB90JP;!@<jUg+>"^QDe*QoBk:ft
FDi:BF`&=?DBO.;DD,g?DKU15$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=Cf5DImisCbKOA
A1%fn@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_
5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%8@;0V#+EMXFBl7Q+@V'.iEb-A*
Bl\9:+E(b"F`MM6DI[6#De:+?GUX(/@V'.iEb0<6E]lHh+F>_i+>G2kBeFi`5U]hZ74o]g.1HUn
$;No?+ED%8F`MA@+ED%7F_l.BDe:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'LFE2)5B+52]
Df^"`3a4Wf1*J\4+=AQb,$uHD+C-*@+=A:ZHm!NOF_*!L,$tcd%15is/g,4HF<G+.@ruF'DIIR"
ATJu9D]hqH5t"dP8Q8,$+>"^QF`VXI@V$ZnG]7J5@rri(AS,XoFD5Z2/e&._67sBU:K0bD+Co1r
FD5Z2@<-'nF!,OGDfTD3FD,5.A9)C-AKYf#FED)7+EV:.Gmt*U67sC)ATD?)CghC,+ED%+BleB-
Eb/c(Df-\+DIal3BPDN1BlbD7Dfd+3BOPdkARl5W:-pQUGA(Q*+CQBj76s=;:/"e5A8,OqBl@lt
Ed8dAF!,L7/TPE8BleB-Eb/c6+B38%Eb0<'F:ARP67sC%FDl22A0>E'Bm+&1Ch7^1ATDi7D..3k
+CT)&+Co1rFD5Z2@<-'nF!+@L5t"dP8Q8+f$;No?+C\noDfTD3Eb-hCAS5^uFCfK,DJ(R2$?C&q
4Y@j5+?CVm1E^UH+F,)6+CoG4ATT%B-W3B!6s!8X<(//^+Bot,A0?.F%17,oA0sJ_I4cX\A0<6I
+BosE+E(d5-RT?1%15is/g,:SEb/ltF*(u6%14m6Eb/lo-9`Q#/g,(C+=ANZ>9G^EDe't<-OgCl
$;No?+Co1rFD5Z2@<-W9E+*j%F!*%WARoLs+EVNED..NrBHUf-EcP`/F<GC<@psInDf0V*$>OKi
Ec5l<4ZX]A+?CW!%17,oDfe,p+=AgWDe(LK/1;l!-Qll0AoD^$F*)FF3?^F<1a".n.4ci"-OgDs
AhG2t7TW/V+CoCC+EDC=F?M6!-Y#1b/95ZIF<D#"AScF!/g(T1+<Y]CDfe,p+=KoQ+>#3p+D>\7
F<DrB@q]d',Y1^*740N8Ec5l<+:SZhDIb@/$7QDk6r6$!+DPh*Ec5l<+>=63%15is/g,1GB5)F/
ATAo'F`MM6DKI"FDfTW-DJ()&Bk)7!Df0!(Bk;>p$;No?+ED%+A0<77De*BiFseCT+<VdL4"*Kn
/151NA7T7p-Rh,)8l%htA7]pqCi=90ASuT;%15is/g,1GB4N,4C2[W1+<VdL+<VdL+?Lu>:b3u/
De(4E4"!Wr6m-PhF`Lu'-OgE'AS5Nr-ZsNFCi^sH+<VdL+<W`o6r5E^F`_>6F!iCu-YI".ATD3q
+E_d?Ch\!*ATK4.$?B]jA0<70Df0W=Cih$I+<VdL4"*Kn/14q:BI>5j-Y$V!05t??F)PqLAo_<t
CM[^&+EqaECERP5AM%h4Aof=/$?B]jA0<70Df0W=Cij3!FseCT4"*Kn/15%M@;]jsBl7HmFse_#
-Y$V!05t??F)PqLAo_<tCM[^&+EqaECERP5AM%h4Aof=/$?B]jA0<7=CghT:+<VdL+<VdL4"*Kn
/15CQ@<j4L4""bcFDlFI@W-K=%17,eB4N,4F)?&4-QjNS+<VdL+?Lu>:b3u+Ch[BpEclIO.6Anu
D09K.F_<@>Ch[BpEZee0BcqJ8F`Lu'-OgDX67sC$AS5Nr-Y@1/@r$+-FC\s+-QkK!6r5E^Ao)0k
CN=Q>A7]p3.6AnHCh[BpEZen(G%GK.E,B0(F=.M)Eb/lo+=Cl?@:s.!+<VdL+<Vdg-q$l_-Y[F+
B4WG>4"#,`F_tT/E-64TE-#k=Bl8$(Eb8`iAKY](@:s-oE,ol,ATMp,DJ(=+$;No?+ED%+A0<76
D..'gA7]p3+<VdL4"*Kn/15.K@:s.^ATfFM4"#,`F_tT/E,9Z<05tuL+Co&,ASc:(D.RU,-OgDX
67sC$AS5Nr-Xq4/B4Z04+<VdL+<W`o6r5E^@Wc3oATT:K4"#5`ASZ+-+C]J(B4Z0-A79Rg-OgDX
67sC$AS5Nr-YIC>-QjNS+<VdL+<W`o6r5E^B5ho>.6AniE-!.EFD5Q*FD5<--OgE'AS5Nr-Za-I
B4PRs-QjNS+<W`o6r5E^F)?&4A7]p3.6AnuD09K.F_<@HF)<%@Dfp)1AL@oo:-pQUEb/lo+=D#M
ARf3t+<VdL+<Vdg-q$l_-Z+'=@q-l84""lZA9VU+F<G.3E,9H<ATDi7@psG$@;L%2+Cf>,E+*X0
+ED%0@<?'k-OgCl$;No?+EM+9+AtWo6r-QO=Wh<pEZfF7Ch7*uARlooBk)7!Df0!(Bk;>p$8WfC
A0<6I+Bot0D/XQ=E-67FA8lU$F<Dr/76s=;:/"e<+Bot,A0<7BFD5Q4-OgD=+E(d5-RU$@+EMC<
F`_SFF<G+5F(KG9-W3B!6r-QO=XP=r+E(d5-Y%(4F*2;@-OgD=+E(d5-RU$@+EMC<F`_SFF<G+5
F(KG9-W3B!6r-QO=XP=r+E(d5-Za-IB.",q1E^UH+=ANZ>9J!(Dfp/@F`\a:E-#T4+=C&U5t"LD
9N`_c>9Iip+=Cl?@:s.!%13OO:-pQUF(fK9+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+%17/nDfp/@
F`\`_+E(d5-RT?1C2[WA0JRTZB5)F/ATBO\:-pQ_C2[WA0JRTZB5)F/ATAo7/M/)cAM%q6B5)F/
ATAnc:IH=9Bk)7!Df0!(Bk;?<$;No?$;No?+B3#gF!)TH@rc:&F<D]HAM%q6B5)F/ATDi7+A,Et
+<Y3/@ruF'DIIR"ATKIH+A$Z&F!)T6+<Y<8De'2M67sC"Ea`I"Bk(]sFDi:=@;0V$@;0U%@3BDq
F*(u6+EM%5BlJ/:FD,*)+Du+>ATJu9BOr<&De!3tBl@m1$;No?+CT.u+DtV)ATJu4AftMuC`m.r
FD5o0+A,Et+Co1rFD5Z2@<-'nF"Rep67rU?67sBjEb/[$ARmhE1,(CA@;p6@2@<2G/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?
+>PW)3,N)L1,0n'+DPh*+EVX8AKZ#)Ec5l<ARl-C67sB90JP8!Dg!fk+>"^WATT&,DfQt;G@b8o
$;No?+>PW*0l:?E0KC7-+EML<BlkJ3DKKe>C,Rb$05<F"0d(OIEbTK7EsbZ//g)o'0emNRGqh<%
/KeP:@;]^hA0>u4+EDUB+E)-?@W-@%+EqO;05P??Fa+6g67sB90JP;!@<jUd+>"^GBOPdkARlp*
D]j(CDBNP3Df$V3F`(t;Ci<flCh3q\@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=Cf5DImisCbKOA
A1%^oDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?+ED%8@;0V#+EMXFBl7Q+@V'.iEb-A*Bl\9:
+E(b"F`MM6DI[6#De:+?GUWu/AS,k$ATMs64ZZjkHS0ai0d\;_/q,67-sIf_/g+FK$49Np/g,1G
FEMVAF!,L7F*2;@+E(j7Ch[d0GV=2WBm:b1Df'?"DIdf2@<3Q5AU&;>F*)G:DJ';iDf^"`3a4Wf
1*J\4+=AQb,$uHD+C-*@+=A:ZHm!NOF_*!L,$tZa:-pQUF(KG9A8,OqBl@ltEbT*++EVNE;FNl>
=&MUh73E^)+Dl7BF<G%(+D#e:Ch[C$+Co%qBl8$,Df.07:-pQU:/=hX3ZqsI@ruF'DIIR"ATJu8
FDl22+EV:.+CoM,G%De4ATW$*EZfI;AU+VX67sC)ATD?)CghC,+ED%+BleB-Eb/c(Df-\+DIal3
BPDN1BlbD7Dfd+3BOPdkARl-C67sC)BOu'(@3AH:5t"LD9N`KKBk)7!Df0!(Gp$gB+ED$FEb/lt
F*(u6ARmD9<,Wn"ATMF)$;No?+EMXCEb/c(A9)C-AKYf#FED)7F!,=.CLnVsCht5)Bk)7!Df0!(
Bk;?.;FNl>=&MUh71)dV/g+V7AoD^$+ED$FEb/ltF*(u6Bl7Q9$?C&q4Y@j5+?CVm1E^UH+F,)6
+CoG4ATT%B-W3B!6s!8X<(//^+Bot,A0?.F$?C&q-9`Q#/g,(C+=ANZ>9G^EDe't<-OL2U67sC'
DK9<$BleB-EXFTFEb/lo-9`Q#/g,(C+=ANZ>9G^EDe't<-OL2U67sBkBk)7!Df0!(Gp%'7FD,_<
/KeV8BlkJ>D]in*FCSu,@s)g4ASuT4Ci<flFD5Z2EsbZ//g*nb<(/hjFD,B0+Eh=:@N]0$ART[l
F!+'tG%G]8Bl@l3F)Y]#BkD'h+C]A"DI[?kF!)lGG%G\C$;No?+F.mJ+DkP4+Eq73F<G[D+EM+9
+=LuJATB4BFDi:1+Cf>-F*(i.F<Ga8Cis;A$>OKiEc5l<4ZX]A+?CW!$>O`qE]l#t-SHhi@V'.i
Eb0<6EZd@c3\`H6-RT7ADf9_\/g)MpC2[W9-S0"UATB=L0..*@AhG2t7TW/V+CoCC+EDC=F?M6!
-Y#1b/95ZIF:)SqF(Hs2+<Y]CDfe,p+=KoQ+>#3p+D>\7F<DrB@q]d',Y1^*740N8Ec5l<$>"*c
/da$76r6$!+DPh*Ec5l<+>=-0:-pQUEb/ltF*(u6+CfP7Eb0-1+EqaECM@[!+Co1rFD5Z2@<-'n
Escr!B4N,4C2[WnATfFD+<VdL+?Lu>:b3u/De*BiFse_#-V@0&+Co&,ASc:(D.RU,-OOm*B4N,4
C2[W1+<VdL+<VdL+?Lu>:b3u/De(4E4"!Wr6m-PhF`Lu'-OOm*B4N,4F`_>6F!i(Q+<VdL+?Lu>
:b3u:FD5Q4-Rh,)B4YslEa`c,F`_>6Bln'#F!h;i67sC$AS5Nr-Y%(4F*2;@-QjNS+<W`o6r5E^
@q'+!.6Ane@V@E6@<-F-DD,UB@;]jsBl5&;DfTV9Df0,<De<U&-ONU8/g,1GB4N,4@rH7+F_l/1
ATfFD+?Lu>:b3u+Ea`j$Ch[ctATfFM4""NIBJ4=5EcZ/:04o65DJO'&DBO.AEbce9DIkD<AnH*3
$?B]jA0<7=CghT:+<VdL+<VdL4"*Kn/15CQ@<j4L4""bcFDlFI@W-K=$?B]jA0<7@D09J=+<VdL
+<VdL4"*Kn/15LUF_<'N4"#)dF_>Q6B.mk5Bk(q!+CT5'+EMIDEarZ.$;No?+ED%+A0<73Ch[Bp
EclJ7ATfFD4"*Kn/15%GBk(q!F`_/*Fse_#-Uqod@r$*-A7]pqCi=90ASuT;$?B]jA0<76D..'g
-QjNS+<VdL4"*Kn/15.K@:s.!.6Ao!BQ\0$F)Z8C05tuL+DG_8ATDBk@q?csD..'g+E2@>@qB_&
Bl7Q2$;No?+ED%+A0<76D..'gA7]p3+<VdL4"*Kn/15.K@:s.^ATfFM4"#,`F_tT/E,9Z<05tuL
+Co&,ASc:(D.RU,-ONU8/g,1GB4N,4@Wc3oATT:B+<VdL+?Lu>:b3u'F_#,rF=/M!-[0-5CM\8=
@Wc3oATT&*@<>p*$?B]jA0<74E-!BL+<VdL+<VdL4"*Kn/15(LF!iCu-YIC>+E_d?Ch\!*ATK4+
Eb/lo+=D5IF_>5rFseCT+<Vdg-q$l_-Za-IB4PRs-Rh,)F)?&4D09JEE-#k=F)Q2A@q@"pEb/lo
+=D#MARf3t+<VdL+<Vdg-q$l_-Z+'=@q-l84""lZA9VU+F<G.3E,9H<ATDi7@psG$@;L%2+Cf>,
E+*X0+ED%0@<?'k-OL2U67sC%ATT%m76s=;:/"e5AoD]4F(K0!@ru9m+Co1rFD5Z2@<-'nEsa]G
De't<-QlV9A8lU$F<Dr/76s=;:/"e<+Bot,A0<7BFD5Q4-OMXPDe't<-QlV9A8lU$F<Dr/76s=;
:/"e<+Bot,A0<77De(4&1E^UH+=ANZ>9IHqF(KG9-W3B!6r-QO=XP=r+E(d5-Za-IB."$B+E(d5
-RU$@+CoG4ATT%B;FNl>:JOSd-QlV9De't<Bl.9kAL@fl:-pQUF(fK9+ED%+BleB-Eb/c(A8,Oq
Bl@ltEbT*+$?L'&F`_SFF<EC_De't<-OL2jDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,$>OKiA8cQs6r-c;2.UE6Ea`p#+A,Et+F=P)+<VdL+<Vd9$84%TC2[W*F*VhK
ASiQ"CghC++ED%0@<?4%DKBK*E$/S0Ec6/C%16ukA7Zlf+EMXMCh5bABl%TsA1SjIASGdjF?M?0
+E1n4BlI`sEbT*+4YeQ2Anc't@rH1%E]nV[Blmol3t2N+$84%T@rHC!+DPh*%170!@V9^iE+gA(
Cisf@ATD-f1*CoQ$6UH6F*)\DANaX>Ci!Zn3t2N>+<Y04Ci=>WCh[NqFD#W*GrlHB+<VeADe'u*
De*p2DfTD3C2[X"@;BEsC2[X*FD5P6C2[WnDdj._+<VeC@:Eea+?^hk6Z7!V+A,Et+Cf4rF)to6
,!-5@+<Ve=Df0Z<BmO>R1,M'%$6UH6CggdaChe*6F?OY+%17Lm$4R>g+>#c"BkhQs+BrAjE]ml?
@r!V<F*)\DANaRBFED))>rrK&BkhQs+>#c"C2[W*>@_Gg4^qi0CFgTLFEq\64_/JQFCeug3t2O3
De'tB4s4TYA92j2Eb-@tA8-'I@UWb^>rrK&C2[W*/Nt:lDe*]nCLnVmA8-'I@UWb^>rrK&C2[W*
/Nt:lDe+!4Bl"nrA8-'I@UWb^>rrK&C2[X(FDl22+>#c"C2[WnDdjhnA8-'I@UWb^>p)3<$>OKi
F`_>6+>#c"C2[X)Df9H5+BrAjE]ml?@r#?m3t2O3De*s.DesJ;>@qScCh%C"DfS!bBPDR">rrK&
BkhQs+BrGlCi!U"Ci=>WCh[NqFCK'/AR.A,$@3h!Anc't@rH1%E]n5QB4uBrCis;p3t2N+$@3h!
+EM4)E+M1CBjkjsDIb:@CggdaCcrtg>]+:pA8c?.C2[X$AnE5m3t2O2C2[W*>9J!#@;od@A8,Ih
Df0):+DbIqASaLRBkhQs>]+7nFCfK)@:NjkCi<flCh4er3t2O3De'tpCggdaCcrtNC2[WfDJ`fr
DBNG*@<6K6>rrK&C2[X(FDl22+BrYj@V'@=,%55)A92j2Eb/KnF*)>@@:s-o@r,RpF!=mO%16ig
A9;a.Ci^_'CggdaCcrtNC2[X)Df9H5>]++tFCf?2Bl@l3FDl)6F!=mO%16igA7TUf+BrYj@V'@=
,%55)A7TUf>]+(dEb/a&DfU+GDdmHm@ruc9>rrK&C2[X"@;BEs>AR_WASaLR@;9^kD..3k>]+Um
EbTK7+CT.u+CoV3E*R9nASu("@<?4%DB`@J%16igA9E!.C`lqu@:Eea4X+<LDe+!4Bl%$lARoLs
+E(_(ARfh'>]*tfA0>f4BOu3,F`_>6Bln'#F!=mO%17Lm$>OKiE+*d(F##IF67sa&De*fqEc#k?
F"JsdA7]@]F_l.BA8,OqBl@ltEd8dH@<,dnATVL(F"Rn/:-pQB$;No?+B3#gF!,(/Ch4`'F!,UH
ARlp*D]j+4F<D]JBOr;/A7]@]F_l.B+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQUFCAWpAKW+0
DBO%7AKYhuF*(u6+D,>(AM,*,BOu'(+CQB8DIn#7A8,OqBl@ltEd8dAF!+t5ART[lA.8l@67sC&
BOr;/E+*cqD.Rg#EcW?GBl5&8BOr;/D..L-ATAo*Bl%?'@<,p%F`V,)+EVNEF)Y]#BkDW5+EV:.
%15is/g,+AEa`frFCfK6+D,P4+CQC3@<-I(@s)TrEZen,@ruF'DIIR2/g+,,AKW+=ATD6&-tI:<
ATT@D@ps6a$;No?+C\n)+<YfJARlo+FDi9E+Dl%-BkDW5+E1b0@;TRtATAn9F(KH8Bl7R)+<Ve@
DBL&EBl7HqG%kK0@;HA[:-pQUA8,OqBl@ltEbT*+/g)92@<6O%EZcK:Bl%?'E+*cqD.Rg#EcW@5
@;[3+DJXS@@V$ZlBOPdkARlomGmt*U67sBlA8-."DJ()6BPDN1Anc'm+CT.u+ED%'Eb/[$Bl7Q+
FD,5.D..L-ATAo*Bl%?5%15is/e&._67sB[BOr<'@<6O%EZet.Ch4`!@;[2sAKZ#)@rc-hFCeu*
GA2/4+EV:.+CehrCcW"4:-pQB$;No?+CfG'@<?'t@<6Nt@;9^k?Q_s85uU`O;I<jIDe*2a$;No?
%15is/g+4];GKeY7lhc$Cht59BOr;/E+*cqD.Rg#EcW@5F`MM6DKK]?+Dbb5FCeu*@<,p%Eb065
Bl[cq+C]U*$;No?+EV:.+A,Et+EMgLFCf;A+A$/fH#IgJEb0*+G%De)DL!@CAfu2/ASiP^:IH=L
Bl%T.@rc"!BJ(E1DflKr:-pQU@ps6t+ELt'AScW7@:Wmk@:Wn_FD5Z2@;I'*@<,dnATVL(F!+q7
F<D]ODfm0F@ps7mDfd+C@:j(eGmt*U67sC$ASl@/AKYK*EcP`/F<GO2Ea`frFCfK6/e&-s$;Efb
<(0\]5uLEU+?_b.0H`D!0F\?u$;No?+B3#c+D,P4D..N/De:,6BPDN1E+*cqD.Rg#EZet.Ch4`'
F#ja;:-pQU+<VdLC2RHsAKX&W.!0`RALSa4ATM@%BlJ0.Df-[Z+Eh10F_)!h:-pQU%15is/g)8Z
+<YE:@;TQuBlbD*+Eh10Bk/>Y+DtV)AISuA67sB'+<VdTFEqh:.3N/4F(96)E-,f4DBNJ.@s)X"
DKKqBFD,5.E+*cqD.Rg#EZcqVFEqh:+DGm>Eb065Bl[cq%15is/g)8Z+<VdL+E).6Gp"LcBl8$(
B4Z*4+DGm>@s)g4ASuU+Gp$[CARfk)ARlp%FD,6++EVmJATJu<Bl%Sp$;No?+<VdL+<VdL@V$[$
@<6L$A0><%+Cf(nEa`I"ATAo0BleB;+=M;BAKYN&FCAWpALT5@$;No?+<VdL+Eh10F_)\0F!+n/
+D#e/@s)m%@VfTu8g%\iE,oN2F(oQ1+EV:*F<GOCDe+!#ATJu&+Eh10F_)!h+<V+#:fUIa5snUI
;BR)D+=JaSDKKH&ATB4BGAhM4F!,OGDfTE"+DG^9Df0,/Ci=62+E1b1F!)SR0eb_84>JTI3%5sm
+<VdL4!6730F\@Z78u`B6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0+ED%8EbT*.ARlotDBNk8AKYf-
Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg+>Pf.%15Hu:g$7R6W?iZ+?L\o.qrmCAS5Rp.3N,=D/aE2
ASuU2+Cf>/Bk:ftBl5&3DIjr,Df9S;E+*g/+<W'e4F'%E1b^@$+<W`g0eb9j$:Ilg:e!`<<)6C7
4!5q%Bl8$(B4Z*4+E(_(ARfh'+CoV3E+NQ&Bl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e+<VdL
+?L]'0F\@W:IA,V78?f`8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#F_t]-
F<G[:G]Y&N-o*J=Gs!i>2(9Y0+>tq`$:.TX8P(m!+<VdL4!5q%Bl8$(B4Z*4+EqL1DET]sF`V+:
@<5pmBfIsmBl5&(F_u)=+=JodDfQsT.3K`U+<VdL+<VdL+?L]"%13OO:-pQU6#Lrj@:Wn[A0>i"
Ea`frFCfK6+CT;%+EMXCEb/c(Bl5&8BOr<'@<6O%EZet.Ch4`5BOu&j$;No?+CfG'@<?'k+CT.u
+Co2-FE2))F`_2*+EVNE8l%htA8-'q@ruX0Gp%$7C1UmsF"SRX%13OO:-pQU=$]_Z8PVc:+EqL1
DBNJ$Anc-sDJ((a+D#e:Eb0<5Bl@m1+C\n)@psChAp%o4@:F.tF<G[=AKX&W@q]:k@:OCjEZbeu
:-pQUFD,5.8l%ht@rGmh+=Lc>FCAWpALSaDBOQ!*E+*d.ATJu9BPDN1F*)G:DJ()+F!,LGA8,ml
DKK<-GqKO5:-pQU<_64]<)6C74!5q]BOPpi@ru:&.3N2HE,oN2F(oQ1+D#e/@s)m)A0>?,+Co2,
ARfh#Ed8dG@VTIaF<Ga@F(o`7EZcJd+CoM2E+E['+>=63%15is/g*MW:g$[f7n?T%4!5q]BOPpi
@ru:&.3L\p6#:?[EbT0"FE8RFATMF'G%G1n$;No?+AH!85uL!C78u]R+?L\o.qrmCAS5Rp.3N_G
AKYE!F*D29+?L]&1(=R>%16igA8l'k?W:-,1,W$EBlbD-Bl[cpFDl2F+DGm>Eb0<'Ecu#)+D,P4
+DPh*/oY?5%13OOC2[W8E+EQ'BlbD7Dfd+4Dg-)8Ddd0fA0?)1FD)e=BOr;rDfTD38l%ht@:Wne
DD!&2D]fJrAStpcCh4`*De!3l+=LuCA8#OjE%)o+6q/;>ART+`DJ()&Dg-)8Ddd0!C2[W8E+EQ'
Ao_g,3XlE*$>=O'E-"&n04]!2F"V*DDeElt/n8g:06V&@G@beZ@6Jc\E+riGAU&01DfTE0-=^_0
Df'&KFE2M8-?F3;Bk0@\68N:Q@WXCa0Qq7i=Y`Q&9giN.>";_;:/ju&>%oZE=]\T\9N5hA=]AmQ
9h/',:K1M4=_^ej:IeH%->73YASqqa%16N]A0>B#E-WR?F<G[D+EV:2F!,"-Eb/a&DfU+UC2[X%
Df^"U0ht%f.V`m4E,Tf>+EK+d+A,Et+E27?FDu8=@qB_&DfQtA@rc:&F=n[Y%15is/e&._67sBZ
FCB9&D.RU,F!,17+EV:2F!,O6EbTK7+CT;%+D#e/@s)m)A0>;mFCfJ88l%htBlbD5Ddd0fA1e;u
%15is/g+kGF*2M7+EqB>@<,p%Bl5&&@<6!&%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+=Cl<
De(4)$4R>;67sC%FCB33+DPh*%16igA8c?.0F\?u$;No?+Dbt)A0>W*A9;a.Ci^$m@rGk"EcP`/
F<Dr?@<6!-%14d43\V[=C2[X(H#n(=D/`p*BHS[;De*F(FE9*MDe*s.DesJIBkh]:%13OO:-pQU
FEMVA+Cf>,D.RU,+ED%8ASuU(Df-\9D@Hq$3?^F?0e"5"%16igA8lR#E&'.C67sa&De*g-AT/c5
/M/);:IH=EEb031De!@"F)Q(AF(96)E-*]A$;No?%15is/g+)7@<?'tASuU2+DG^9FD,B0+EM%5
BlJ/:@<,p%AU%crF`_2*+C\noDfTD38l%htBlbD5Ddd0fA1e;u%15is/g,7SE$/t.G%GJ4ATDg0
EZfIE@;m?$DfQt1DfTD38l%htGAhM4F!(o!C2[X(Am]7eDe*2t4ZX]>,$uHS+=BcW6m,E2;cH1[
+@\Xg9N=tZ3Zr6IF*&Ns+D#S6DfQsP4s23s?Q^mB><3l]1Eee61*@ql,$uHs+C,E`%16igA93$;
FCf<.@<?0iH=&fr1E\_$0F\?u$;No?.V`m4F*VhKASlBpFD)e?/M/)a@<?0*De:+a:IH=HH#n(=
D'1DQ0-G@JEc#N.@<?'k/e&._67r]S:-pQU:2b5c3ZrTSCh[E&AoD]48g$#E0JO\YDIaku@W-F$
/e&._67r]S:-pQUD/X<#A3(hUC2[X(H#n(=D/`p*BHUf$:hFEXAISuA67r]S:-pQU+<YE;A93$;
FCf<.@<?0*-YdL,F*(u6-OgCl$;No?+Co%qBl7Km+A*btH#n(=D'3Y5@psInDf-!k-u*^0FD)dE
IUQbtDf0VLB4YslEa`c;C2[W9-RgTl+:SZ,%13OO@rGjn@<6K4-Xgb.A1%fn8khTM<(0\J3Zr0U
A93$;FCf<.@<?0*-YdL,F*(u6-QjNS+<VdL+<XEG/g+\9AmoguF<GF/F*(u6+=J]lBkh6/+D,>(
AISu=:IJ#W:I[K.+DPh*F*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(aF+AP6U+Co%q@<HC.+E2@>
Anc'm+EM%5BlJ/'$>OKiE,o]11,V`k6<$NU9LV**+=BcW6m*m7.3N&:A0>u-AKXSf:i^JhARfg)
9jqpJB4Z*2%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDk9L2!4:JFPP:/k.T3ZoeLBPDN1CggcqF(fK9F!,.7G9BLR6m,oUA0>u-AKXSf:i^Jh
ARfg)9jqpJB4Z*+@ps6t@V$[)F(Jl)FDkf'FD,6++AH9i+>PW)3%#.B9L2!7:IA,\4ZX]>%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[i:IH=6DIal3BOr;Y+Ad)sC1Ums+AH9^@:s.l%15^'6m,oUA0>u-AKXSf
E,ol3ARfg)D..<jB4Z*+@<,p%FE_XG@rH4'Ch[`tDKK<-Gp%0HAor6*Eb-A8Df9H5+EV:*F<G(%
DBND"+D"u&Bl&&;@rH3nBl7Km+EMHD@;Ka&FD,5.Amo1`Ch\!*ATJu4AftQ$FD)e<H#n(=D0$h0
@;[2sAKYE#E,96"A0>u4+A*bqEc5T2@;TjqDJ(RE<+ohc8l%htF*VhKASiQ(FE;#0Afu;+F!,F1
Ecc,C+Co&,ASc:(ARlp+F(oN)+EM[8BHU`$+CT5.Ec5ArBJ'`$%16'JBlbD5@:C?fF)uJ@ATKmA
$4R=j0e"5EBOr<$De*p-F`Lu'+CSekDf-\2@<3Q#AS#a%Bl8!6@;KakA1e;u%14L=.3Lo!IS*C(
:f:(]771#sAoDKrATAo4DeX*2Bl7Q+FDi9MC2[WnATfLMF!,LADfd+4Bl[cpFDl2F+D>2)+C\nn
DBNG-DJ!TqF`M&(/e&-s$7I\Z+@.-!8l%iS78m/.AoDKrATAo4DeX*2Bl7Q+FDi:1+EV19F<G+.
Eb/a&DfU+GBOPs)@V'+g+Cf>-Anbn#Eb/c6%13OO<,WmnDKBo.Cht59BOr<$De*p-F`Lu'+CSek
Df-\?F(HJ9BOr;Y+AcKVCLLje+AH9^@:s.l+CT.u+EV:.DBNtBDBO%7AKYet@NZje:IH=(Dfp)1
AKX?YA7ZlOF_u(?;e'i^E--.R+s8"&5taWh;cQ^a+B_K?+AGX473Flk6m,Ar:-hTC+B1m#+A>Qs
6m+lh6W?WQ:-hcL78k=#:*<M,73G8i;cFl<<(0V+:IZI+84c`&9L1ut%13OO<HD^o8ge[&@rH6s
BkMR/AKZ)5DepP<D]j+4F<H$):IJ#W:J+&C<$5UeA0?=n:IJ/N;cG@Y$7QDkEb065Bl[c--YI".
ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3:i^+i@;]Tu:iCDs+Ad)s@qB_&DfQt!@rc:&FE7lu
<+ohc8g&(nDe`inF<GF/DII0hEZee,Ci=N=+E_a:EcW@FD]iS%Anc-o+CT.u+D#e/@s)m)+CT;"
BlnB(Ed8d"+E2@4+CT.u+E27?F<GOCDe!@"F)Q(AF(96)E--.R+<Xa!ASrW!+E2@>C1Ums+DGm>
,%>\/CigjDFD,5.E,oN/Ec5H!F)u8?+EM%5BlJ/:Ecl8@+D,>.F*&rUAoDL%Dg,c'+C]U=FD,5.
DJsQ4@;I&qF_PZ&+E2@>@qB_&/0JPCCi"$6ARlomGp%3BAKYr1F*&ODEc5H!F)u8?/g)99BOr<*
Eb-A%DIal/Df^"CE,ol,ATMp2EZfF5EbTK7F!+n3AKZ).AKYc"H#k*MD]j1DBl7Q+8l%htGA2/4
Bl5&8BOr;Y+E2@>C1Ums+DkP)@:s.l/e&.:%15is/g,7LAKYr4AKYE!A0>i0F*&ODEc5H!F)u8?
F!+n3AKYMpAnc-oA0>T(+CQC3Ec5](@rs)>+=]!XC2b;-Bl%?5%13OO:-pQU-u*[2E,ol3ARfg7
BkhT9+E2@4+CT.u+E27?F<GOCDe!@"F)Q)?+:SYe$;No?+Abs)6<-TN6q0aA76N[S-[nZ`6r6cW
8ju*H06:WDBlJ/IC2[X%Eb03/Eb[4@C3(a3$4R>;67sBW:K(4Z<CokP7S-9B4ZX]5IS*C(:f:(]
771$-F(96)E-*aJDe*g*F*)AAC+a48F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AZrfDBMPI6m-PhF`Lu'
+Co1rFD5Z2@<-'nEt&IUD]ib1Cisf@Eaa'$+A,Et-Z^DQF(HJ<Bln#2FD,5.E,ol3ARfg)D..<j
B4Z*+G@_n@Bl%T.F`V+:8l%i&F!,CFDBO"=F`Lu'+Co1rFD5Z2@<-'nF"SRE$4R>ABPDN1F*(u4
+CT>4F_t]2+EV:.+DPh*F)Q2A@q?ckA7TUr+D>2)+C\nnDBNJ.GAM2+A7]9oGA2/4+EV:.+AcKV
CLLje+AH9^@:s.l+CT.u+EV:.+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++=LuCA7T7p.4cSiC2[W3
+CT.u+=MASBl%i>+D>2,AKYGnASrW3ATW'6/g)97F`&=DBOr<&@:C?'8l%ht;f?f!@q?cMDe*E%
7!3?c+B)cjBlJ08+s:T3+EV:.F(HJ)Bk)7!Df0!(Bk;?.@<,p%DJsV>F(KH9E%VS,.1HVZ67sC!
E+No0Df0B:+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++:SZrA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA0<6I%13OO:-pQUH#IgJF(fK7Ch+Z%@<Q3)FD,5.FD,]+AKXT@6m-PhF`Lu'+Co1rFD5Z2
@<-'nF!,C=+EV:.+E1b2BFP;ZBk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36YL%@CES'u:IJ#W:J+&C
<$6-gFD)*j6=jbIEb-A)G][t7@ruF&B-;;0AKWC9De*g-De`inF=q9BE%)oABl%?'Ao_g,+EV:.
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++DkP&AKZ&:Eb-@AIS*C(:f:(]771$'+E275DKKqBFDi9M
C2[WnATfLMF!+_/@rc:&F<G+.Eb/a&DfU+U%14Nn$;No?+A$/fFD,6,AKYr#FD,_<A8`T.Dfd+=
@<?!m+E_a:+A+#&+Cf>-Anbn#Eaa'(Df-\>Df9G7FDi:CATS@g:-pQUIS*C(:f:(]771#sFDi::
De*BiFsh>R>]XCqBlJ/:A8-'q@ruX0Gmt)i$;No?+<YWDDe`inF<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VeADe*BiFs(%2@rc:&F<D#".!0BDDg,c5+DPk(FD)dEIS*C(:f:(]771$ZF(96)
E-,>4.3L3'+EVO<Dg,c5+<iEc;aXGi-S-Z-HTHL+6r60K87,_&<*s!):IK,1C+1\]?RH9i%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@g!\ATD4$AKXfiDe`inF<F:dDII0hEZdhcCh7Ys$<1\M+A*bQEc5](@rrhf
@;]LdATAo7FDl22F!+n-C`m\;De`inF<GU8CghEsA0>T(AoD^,@<?4%DBNY2+CQBB/no'>+E2@>
C1Ums+D,>(AM,)J:i^JhARfg)Anc'mF!+n3AKYQ*F(K62BjkgoGp#^%F(96)E--.DGA2/4+CQC'
BkCsgEb0-1+D,>(AKYQ/FCf?2Bl@lA+<XWsAKWC9De*g-De`inF=q9BE%)oABl%?'BlbD<FDl22
A0>T(+EV:.+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&.:%15is/g,1WDBN@18l%htFCB<6Des?)
Gp%3?F*&OG@rc:&F<G[D+D#e>Ea`I"+Dtb#ATM:#Gp%'HDe`inF<G10Ch7Z?%13OOEccCG-Z`j@
F`:]&De*g-De`inF=/1R:-pQUEb0<7Cij_@F(fK7Ch+YsCht4K-Z]_(%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+AQ?gBkLjrAKZ)5+FZpY6r6cW8ju*H>]XCqBlJ/:A8-'q@ruX0Gmt*VE+No0FD,5.:i^JhARfg)
9jqpJB4Z*7+DtV2BkLjrAKZ)5+=M\2:IJ#W:J+&C<*XKSEbTK7.3N&:A0>f0ASrV=C2[X%Ec5](
@rs>;C2bU2$7QDk:-pQUDII^&B45mn+EVN2$>ONgFD)dEIS*C(:f:(]771$ZF(96)E-*H:$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBM8gBl%<&Ap%p+Gp$U8D/Ej%FCeu*8l%ha$;+)^+EMIDEarZ'BlbD<FDl22
A0>T(+Co1rFD5Z2@<-W9A79Rg@UX=hF"SRX:i^,gF!,R<AKXfiDe`inF<F:dDII0hEZcPmF_PZ&
+s:?;FEDG=+EVNEB4YslEaa'$+EMIDEarZ'F(96)E--.R%14Nn$;No?+E2@4F)rIGBOr;_Ec5](
@rrhf@;]LdATAn;6?R!YA0N.*F`__DD@Hp^$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36?7!gF(HId:IH=HDfp)1
AISu4AoqU)+C]J-Ch.6tB-;;0AKYr4De`inF<GjIFWb1&DBO+:ATo7h:IH=HDfp)1AKYo/+EV:.
+E2@>C1Ums+DkP)@:s.l-Z^CS;f?f!@q?i,FCAW2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk@:UKQ
:IH=HDfp)1AISuCEb0<5Bl7Q+FD,5.:i^JhARfg)9jqpJB4Z*2F!)Z#Ddd0#+C]J8FDl%>Ci<`m
F!+m6Ap%p+Gp$U8D/Ej%FCeu*F)Q2A@q?csDKKe>@:OCnG%De+CghC+ATKIH+B3#gF!,1<+E_a:
Ap%o4AoD]4A7]4mB4kprB-:W#A0>H.E,9H5Bl7Q+8l%ht@rGmh/e&.:%15is/g,+RATMo8FD,5.
:i^JhARfg)9jqpJB4Z*+,"uo`A0MHi%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B!?"+@9LXBk&8X:IH=IATMs7
%15C=+D#e+D/a<&+EV19F<GX7EbTK7+D>2)+C\nnDBNS'DImisFCeu*Ao_g,+A,Et+CT.u+ED%*
ATD@"@qB1'+<X!^AoD^$+EDUBDJ=!$+EV:2F!,O6EbTK7+CfG'@<?''F)Po,+EV19F<G+.@ruF'
DIIR"ATKIH+:SYe$<1SXF<G+.@ruF'DIIR2+CfG'@<?4%DBNt2EHPu9ATJu&+Cf>-Anbn#Eb/c(
IS*C(<(0_b+Co2,ARfh#Ed98H$7QDk:-pQU@rc-hFCcS:ATMr9A8,OqBl@ltEbT*++>"^Q@;^?5
8l%htFCfN8+EM%5BlJ08+ED%*ATAo8D]j.8ATME*A8,OqBl@ltEd8dF@;TRs%17,tF<Dr@Eb/[$
ATVL)FC])qFD5Z2@<-'nF!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'JBlbD<FCfD6Ecl8@+EV:.+E2@>
C1Ums+EV19F<GX7EbTK7/g)99BOu3q+CT;%+DkP)Gp%$IBOu3,FCfN8+EM%5BlJ08+EMXCEb/c(
Bl5&8BOr;Y:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?<+<XWsATME*F(96)E--.DE,ol?Bk1ct
DKTf-Ec6)A+D#e+D/a<&F!,C5+D>\;+EVNEF`V+:@;]Tu@:FA#AKXT@6m-\lEb'5D%14Nn$;No?
+Ad)iF)rIGBOr;_Ec5](@rrhf@;]LdATB/>+<jcrF*&TK@Wcd7Df.0:$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM;bDI[L*F(oQ1%16'JBlbD5@:C@#BQ&*+A0>Q(G9D!G+E_a:+A,Et+EqOABHVD1AKXSf:i^Jh
ARfg)9jqpJB4Z*9%13OO8oJB\+@Ih)6=FY@EX`@NDg#]/@V'R&1,(C@%16QQCLqO$A2uY8B5M'k
CbB49D%-h$%13OOC2[X%Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'H
De<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\+EV:2F!,O6
EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOABHVD1AKYl!
D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)
+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)
+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'G%ku8DJ`s&
F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8
AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo78lWS
9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<@<<W(Eb065
ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:
+D#e3FD5W*+A+6q$;No?%15is/g*o-FCcS:D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62
ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9
+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?%15is/g+SFFD,T5
3Zq%5BPnq\/g*JhCLqMq$;No?+D#CuBl#gQ+C\bpATDNr3B9?;D..-p/n8g:%13OO:-pQUF(KG9
GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g+\C+Du+>+ED%7ATT&/
AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%16WbF(KG9-W3B378uuM
-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKVEh@rGjn@<6K4-Y[=6A1%fn%15is/g+bECi"$6
Bl7Q+@<,p%BOPdhGp"MLC2[W3+Dbt+@;KKtF(fK4FCTH8F#ja;%15is/g,+RDe`inF<GX<DfTr0
F`_[I/Kf1WAKYQ/E,95uBlkI,$;No?+Co%qBl8$,Df0V=F)N18F=2,PARTY*+EVNEEb0<'F<G[=
AKYW+Dfp"PF*22=AISuTB0A9u1E\_$-YdR1B-:VnA7oq%+F,=D$=S!=3Zp4$3ZoduC2[X(4#8<.
@:Wn]Ec<.H-OgDnB0A9u1E\_$-YdR1B-:_rChId-+F,=D$=n3@3Zp4$3ZoduC2[X(4#8<.A7]Ri
Ec<.H-OgD*+<V+#:-pQUEb/ioEb0,uARlorEc6)>+EqaEA9/l2Dfd+9DBNS4Dfp".$>t)O3Zp4$
3Zodu@;Kb#AS-!++FPjbB5T.@/M8/YDETTpB6%r6C2[Wq-OgD*+<V+#:-pQUGAhM4F!,17+D5_5
F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zoeq+E_a:A7Bg,I4cXTEc<.9De*K.%144#+:SZQ67sBn
ASu("@<?''-6RA<G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+=D#BF!,49A7m#h+F,=D$4R>;67sC&
Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHS
G&IfsFD!`t+>P9aAThu$$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>
+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+
Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!
+D,P4+D5_5F`8IIDfTB0%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*-`$;No?+EM47Ec`F;ASc<.
Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<Y?<+>b2`:-pQU
D.-ppD[d%K67sB'+D>d<1*@]767sBnEc6)>Et&IiE]lH+0f'q5+=DFWBP_X*C`n-Y+F,)MAThu7
-RU8h+Bot6-OgCl$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+D,P4+Du+8GAhM4Et&IO67sB'
1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL
:-pQUFCfN8%17/mAU$@!+>b3%+=AR^/3#($E-67FGroVPEcZ>4Df'?&DKK5m8l%isDf9H5+F##>
Ble59Gpa%.%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIEAS,LoASu!h
Et&IsATD?o4ZX]A+?CVm-uLRgF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9c<1/q#?mAThu>-RU8a
>9J2=%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT
0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-
1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"
6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!
GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23Zoek
BQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FH
E-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)
D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0
Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\uc
F_>5rFs(jCF_;h>FD5Q4-OgDX67sB8+ED<A-ZF*@C2[W1+Bot0D/XQ=E-67FDe'tP3[\Z\A7T7p
+DPh*+E_d?Ci^s5$4R>;67sBjF`MM6DKI"BFCB33+E_W4$;No?+EMC<F`_SFF<GL4+?MV3D0KQ$
@j#o9Bl%i<%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EOBkhQs-OgDtDe*p-F`Lu'F(KH9
E&'.C67sa&De*p-F`Lu'F(KH9E$-8GF"Jsd+CfG'@<?(%+<Y*1A0<!;Ci<`mF!)SJ8l%ht+Co&,
ASc:(D.RU,%15is/g+\=@ruF'DIIR"ATJu+Ec5e;8l%htA9Da.F"Rn/:-pQB$;No?+B3#gF!)SJ
F(96)E-*3F+CfG'@<?(%+<Ve8DIak4Ci<`mF!)SJFD,5.+A,Et+<Ve;AThX$DfBQ)DKH<p:-pQU
A8,OqBl@ltEbT*++=LuCA7T7p/0H'MDe(CAF`_>6F"&^a+B38%Ecl7BFD,B0+<Y`8EbTK7+<Yc>
AISuA67sBmDes6.GA1r-+Dl7BF<G78Ch,R9$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)hs
+A*b7/hhN'2_He/+Dl7BF<G%(+DG_7FCB!%ARlp%DBN"pDId[0F!,CA+A?KeFa,MJ$;No?%15is
/g)kt+B3#c+A,Et+CSekDf-\7F`VXI@V$ZrDKBo.Ci!Zn/g+/8AKXT29H\Fq+DG_7FCB!%%15is
/g)8Z+D58'ATD3q05>E9%15is/e&._67sB9.3MT'AKXT@6rQl];F<kq@:WneDBNe=F*&O6AKY])
F*(i,Ch7-0+B<Jo+A+pn+EVNEBl8!6@;K`h$;No?+<VdLB4YslEa`c;C2[X(Dfp)1AISuA67r]S
:-pQU1FXGGBOr;Y7S-9B;]oLZA8c?.D09oA+C\n)Bl8!6@;KakA1f!)F(HId5tiDCD]ib3F*(i,
C^g_H67sB'+<Y3'FC?h;Anc'mEt&IO67r]S:-pQU1asPHBOr;i8PgO!8PDQO+CSekDf-\7F`VXI
@V$ZrDKBo.Ci!Zn/g+/8AKXT29H\Fq+DG_7FCB!%%15is/g)8Z+CT;#07%>O%15is/e&._67sB<
.3MT'AKYMtEb/a&DfU+G@ldk0De**f2_Zsk+=MGJDCH]HEZd#KDf'&=HR)-X9gsI`C2[W9C,[h$
0-DZZBl8'<.1HVZ67sB'+<YNDF*&O6AKYQ$E--@X%15is/e&._67sB=.3MB(+A,Et+Co1rFD5Z2
@<-'nF!,[@FD)e7@;TRs+=LuCA7T7p/0J\GA1SjGFD5Q4.3N2HBleAK%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;D..]F1^sde67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$?B]tF_Pl-
+=Cc8Ch7Z1FCB6++ED%+AU#>.BlYR1$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj
5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1
ATDl8-Y[=6A1%fn%15is/g,1GFCAm$F!,OGEbTE(+C\noDfTD3Anc:,F<GL3@s)g4ASu!h+E(j7
.!R0M$=[RYDfTE1FE0N*>p+JHINU?l-tt;_.6o:c+@Rn*>q$3i%15is/g,1GFEMVAF!,L7F*2;@
+E(j7Ch[d0GV=2WBm:b1Df'?"DIdf2@<3Q5AU&;>F*)G:DJ'CcBQ%s64ZZe.+>P*$0H__k-R)n?
/0J4@/0H;_I!d&YEckqB-R)n,$4R>;67sBt@;BEs@3B)pEb/a&DfU+G-nuicF^nomF)rlT0Hat9
Bl%p4ALS&qD..3kA8-'I3\_d=2'=q@0KKXM%15is/g,@YBlmp-+CQC/BleA=De:,$H$!V=+EVNE
Anc'm%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%13OOF(KH9E,'<%F)Q2A@q@ea+>Y-$
+>=63%15is/h1pRFEMP;De*p-F`Lu'+<YhZ/Kc0GEb/[$ATJt:@;]Tu+<YK=@:XF%+<X9P6m*U_
AThX$DfBQ)DKH<p:-pQUA8,OqBl@ltEbT*++D,Y4D'2GH6m-#_D/aPK%15is/e&._67sBtDf/uo
3ZoPdATW'6C2[X(Dfp)1AKZ,<8S;pZEb,[e%16f]/g)_uAn?4$F*&O>E+*j%+=DVHA7TUrF"_0;
DImisCbKOAA1q\7@<6O%E\;'@Ag\^3D_;J++<Y`BDfp/@F`\`R78d#Z;E>pm:IH=6A7TUr+DGm>
DJsV>Bl8!6@;KakA1&L?ATW'8DCuA*AScF!BkAt?/M:XHG\M5@+DPh*H>.=]/g+nJ@<?0*-[oK7
A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'/p_5N-Qlr</e&.1+EMC<F`_SFF<Dr";Gp:g
3Zq$j6rQl];F<kq@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8Ec*K=$>"$pASGa/+>#3XAU%p1
F<G=;@<?0*-[oK7A8c@,04Am207%>O07%5ECh7Z?Bkh]:+CoCC%144#F)>i<FDuAE+=BTU;GU1O
+Bh?5+@\pr78k=;A7TUr+DGm>DJsV>Bl8!6@;KakA1&L?ATW'8DCuA*ASu$2%13OO:-pQUC1_0r
ATJu'ARf.cAKYE!+CSekDf-\3DBMP1%16f]/g)_u8Oc<1+CoCC%144#BkAt?/M:XHG\M5@+DPk(
FD)dEIUQbtDf0VLA79Rg05>*5Ch7Z@C1_0rATKJ<C3(aFA8a(0$6UH6+EMC<F`_SFF<Dr";Gp:g
3Zq$a8PDQO+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)+ED%8F`M@P%144#ASu$2%16ZaA1e;u%17,e
EHPu9AKW@/EapbKBlG_OAnc'mF!hD(Eb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+A,Et+EMID
EarZ'A8,OqBl@ltEbT*++DG^9Eb0E*EcYe7E+*j%+E):2ATA4eA8,OqF$2,u4$"a3FD5Q4+DPh*
+DPh*A7]p3%16f]/g)kkAM,*9Bk)7++D!/JDe't<-Qlr</e&.1+EMC<F`_SFF<Dr";Gp:g3ZrK^
D.Oh^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.AU%p1F=/2OATW'8DCuA*AScF!BkAt?+>=pL
/g)QQBk)7++=nil4s2s8/no'A-Rg0L/g,Kn+u(3dA8-',C2[X/BlG2*D_;J++<Y`BDfp/@F`\`R
78d#Z;E>q;Ble?0DJ()&F_u(?F(96)E--.K+ED%8F`M@P%16ZaA1e;u%16igA9)U,F?M6!-SK4Q
A1o;>$>F*)+A#%(8PUC=D_</IDe*m,Dfe,p+=CY[-S0"NA9)U,F<D#"AScF!/g(T1+<YE;A9)U,
F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK-RgT]De*m,Dfd*2$>"*c/e&-s$>O`qEcYr5DETTp
-SHhi@V'.iEb0<6EZd@c3\`H6-RT?1C2[WnAThTuE]l#tC2[X'Df9_KC3F0/F(oQ1/13(u%13OO
BkAt?0H`M$,;C<OBlY>2De*m,Dfd+4D_;J++<YN0CLq$jEZdJZDe*m,DfcEq+<W'[8l%htEc5l<
+Co2,ARfh#Ed9#]+Eqj?FCcS0De*m,DfdNXC2[X'Df9_MFEhmT%144#D..3kA8-',4DJeFA7]pp
BlXXi+<Y`BDfp/@F`\`R8l%htEc5l<+Co2,ARfh#Ed8d;Eb/[$ARmhE-S0"NA7T7pA8-&n$>"$p
AM+E!+<Y`BDfp/@F`\`R78d#Z;E>q<Df0-'E--@J8l%htEc5l<+Co2,ARfh#Ed8cZ4s24(C2[X'
Df9_?Eb0?8Ec*K=$>"*c/e&-s$;No?+CfG'@<?''A8,OqBl@ltEbT*+%17/nDfp/@F`\aDATqZ-
-np!YBk)7+.4cl^De*BiG%><-/3>P4A8,OqF"'0uF`_>6Bln'#F!,"-@ruF'DIIR2-OgE(D/XQ=
E-67FDIn$&+=JskA8,OqF"&XgC2[WnAThTuE\':,HXpi#FE8lm-YdR1+EMIDEarZ'@rGmh+Co1r
FD5Z2@<-W@%17/nDfp/@F`\aDATqZ--o--[Bk)7+.4cl^De*BiG%><-/3>V6A8,OqF"'0uC2[W*
A7]pqCi=90ASuT4A8,OqBl@ltEd9#A$4R>;67sBlG][t7@rri%DIal1F`&=4Bk)7!Df0!(Gp$X?
D/^V=@rc:&FE7luFDYu9@<?0G/g+nJ@<?0*-[p/KD/_-U%172oE+F*.E'5frFDYu9@<?06-Y.@:
E%Yj>F!hD(%16]cEaN?k@rs=GA8,OqF!,"3/e&.1+Co1rF?M6!4(N&8F:AR"+EMC<F`_SFF<Dr)
Ddd0jDJ)!Q-S/eB@rr.e+<Y3;D/a#oF?M6!H?*S*A0<:2Bk)69-SB+JF!iCuC2[X/BlFLg+<W(S
Db*Z&<$5^oD/a#oF=A>VEbTW,+EVI>A9Da.%144#:-pQUBl8!7Eb-A(Bk)7!Df0!(Gp%'7FD)e8
Eb&a%%144#De'u</grnEA8,Oq?YOCgAU#YN/nA[+FE8R/+>Y-YA0<6I%144#:-pQUCi<`m+CoV3
E$043EbTK7%144#0HiJ2+?Xa_E+F*.E"*-s+AP6U+DG_7F`M%9G@_n;ASkjiDBNY2+EqaECM@[!
+Dbt+@;KKa$6UI$De!p1Eb0-1+EVI>Ci<fj5s[eYEaa$&3B9*,%144#:-pQUEb/lpDImisFCcS)
Ec6#?+ED%*ATD@"@qB]j$6UI5D/aN,Aog*f+>=pNCi<d(-9`Q#/g,1GG&JKN-OgD*+EMC<F`_SF
F<DquEc6#?+ED%*ATD@"@qB^(B4YslEaa'$A3(h\/7`I)F:ARgDIb@/$4R>`D/XQ=E-67F-W=#4
6UapP3ZrHSB5)F/ATD?m+A,Et+Co1rFD5Z2@<-'nF!i)7+>Y-YA0<6I%17/nDfp/@F`\`_+E(d5
-RT?1.1HUn$?Kd#F`;)6A92[3EarZ'0F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s]U5@<6*B3B:FU$>aEoFa.eBFCfN#<*3*T2,%_%Fa,$-E+NNnAnb`t:2b5cF!,(5EZdtM
6m+093A*'0-r",q+>PW*0e!P=%16'JBlbD2F!,R<AKYT!EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:
F(oQ1+E(j78l%i-+@9XODfTD3F`V87B+52?:IH=DDBNb0DKU1HD.-pfBl7L'+E2..@<6!&Eb/Zi
+EV:.F(HJ3DffQ3/e&-s$8EtP8l%htF)Q2A@q?cmDe*E%BlbD-BleB:Bju4,ARlotDBO%7AKXT@
6rQl];F<kq@:WneDD!&'DKBo.Cht59BOr:q$;+)^;bpCk6U`,+A7TUr+CT.u+EDUB+EV:.+EM%5
BlJ/T%13OO+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3(L,$4R>A
BPDN1F(96)E-*4:DKBo.Ci"/8FD,5.8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++E_a>DJ()/
Gp%-=@rH4$ASu$iA0>i"FD)e<FE2M6FEMV8/e&.RAoqU)+EDUBDJ=!$+=LuCA92[3Ear[%ATW'6
/no'A.3NnSFWba=Dfol,+EM+*+Co2,ARfh#EbT*++Dbb-ANCq^-YdR5DC6Q@F!,=F+='KR9gpK?
$4R=b+>7DHD.PA8DeO#AC2[W9C,[h$05>E9A7]on$6UHEBQ%a!05>E=DD,aCA1q[V0JP4qDe':a
+<W=NDf'&=C2[d'05>E905<F"0e[ZkBl%i"$6UH#$<1pdG%kN3+Eh=:@WNZ&ATM@%BjtXa+DG^9
AoDL%Dg,o5B-:o1ASlK2FD,6,AKYMt@ruF'DIIR"ATJu2F`VXI@V$ZjG%#*$@:F%a/e&-s$8O%Q
8l%htG@>P8DfTQ)Bl7?qCj@.6AThX$DfB8u+E)-?=(uP_Dg-7T+B3#c+E27>F<G[D+A?KeFa,$Q
@<2kbA8c?s+E)-?@3@?]+C]&,+B;lnDKL"D0ek:7GT_'QF*(u1/g+,,AKYo/Cj@-sBl8'<+Dbb$
Eaa!6+CehrC^g_g@:Wpl@X0(g:IH=D@q0Y%F!,17+EV:.+=LlFBk296+Eh=:@P/c4$4R=b+AP6U
+EVNEG%kN3+=LlFBk296+=LrAF*(i,C`l>G6rQl];F<kqBlmp'+>G;S$6UI0A0<rp-YdR1A7]p,
C2[W*F`_>6F!i)7+>Y-YA0<6I%144#A8-+(+?MV3B6@p!F!hD(%14LrF_PB-.3NhQEbf_=Anc-o
+E)-?1GU(^BlkIt@WcR1FWa@lDKU1HD.-pfBl7L'/g*`-+DkP4+EqaECERP5+>u&!@VKp,%15dC
DKU1H@<3Q8ASc08+<XWsAKZ#)D..-rBl7Q+BQ%s6+Co&&ASu$iDI[BlF!,")EbT].+D,Y4D'3n5
ASc0*@rH4$@;]Us/g(T18l%htD..3kF!,X;Ed8dDBl.R+ARlp+F(HJ4Afsc]DKU1HF(f-$C`m5+
D/E^!A90@G;eT`YC`m5+D/E^!A9/l%Eb-@&$=dL\Ch7-"E,oZ0@<-'uGp%3I+Dl%?ALnsEAStpn
AKYE!A0>B#E-WR<Bl%@%/g+,,AU,D>BQ&$0A0?)7Ebce9DBKAq@;^?5F*)G2Bl5&3Afsc]DKU1H
DfQt#DJ=>J+@pEpAThX*/0IP\6m-/OF!,C=Cj@.4AS#a%FCfN8ARlp%DBL_j+C]&,+B;lnDKL"E
%13OO1FXG=:IH=8Eb/[$ATJu-Df^"CAnc'mF!+n/A0>DsEb/a&DfTQ'F!+n/A0><%F*2>2F!,1=
+D>2)+EV:.+Dtb#ATMp$Ed8*$EbT0"FE8RHD]j(3@:Uo3GB.D>AKYE!A0>`-G%De<BOu6r+D,>(
ATKIH7!3NaDJ()&AThX$DfBQ)DKI!m+E2IF+CT)&+DlB5$;+)^+Co1rFD5Z2@<-'nF!,17+DlBH
,Y1^*73F!3BQ%a!05>E=DCH]=Bl[cpFDl2F/e&-s$6UHd67sC&D]j4;ATo8?ATD7$+EV:*F<GF/
DJ='4CghEs+D>\7F<G10Ch7Z1-u!R?FCB!%+A,Et;bpCk6U`,3FCf;30e!P=+<YT5+?MV3C2[Wn
ATf22De'u5FD5Q4-QlV91E^UH+=ANG$6UI%Ble594$"a0AStpnAS,XmATJu(DfBu6Bl%@%-OgCl
$8a1S8l%htEb065Bl[d++EDC=FCeu*A8,OqBl@ltEd8dH@<?1(/0JXZAM,MVH#IhG+E1b2BQG;5
F`VXI@V'1dDBO.;FD)e*+EM@-F(c[L/e&-s$8j7T8l%htF`V,8+A+#&+Cf>-Anbn#Eb/c(G@b5+
@WHC2F(KA7@;]TuE+EQ'Eb/ZiATBCG9jqgK+EM[GAKZ8:FU\[k@<Q3)@3B$"Dg-86EZee.A0>o(
@:Wqi+EM+9F`8rU+:SYe$;"hPH#IgJBOQ'q+Du+>+Cf>-Anbn#Eb/c(@3A/bG@b5+@WHC2F(KA7
8l%htGA1l0+CTA6ASlC.+EVNEF`V+:@q]n$D/"-0/Ria=GB7>9%172q+C]A0GB7=<Df0B*DIjr(
ASc<<+A$/fH#IgJA8`T.Dfd+8@<Q3)6YLLYD.Oi(DKBo.Ci!Zn+=LuCA8#OjE%)oRBl%Sp$>sd(
+EqaECG$&'+<Vd9$6UH6:-pQUDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C+AP6U+ED%5
F_Pl-A0>Ds@ruF'DIIR"ATJ:f+<Ve;Ble59-YdR1BOu"!-OgCl$<(YUBl%3uBl&&;8l%htGA1l0
+E_a:+EV:.+>7kYE\D!IBl7El+E1k'+ED%%A7]d(BkAK5Dfm19@<Q3)DJsV>F)Y]#BkD'jA0>;'
E+EQ'Eb/ZiATBC4$4R>".3M#S+AP^3+B;?/+C].qDJO;9Bl5%eBl8'<+A,Et+E1b2BQGdK+@9mQ
DJO;9D..]4E,ol-F^nu*ATDg0EcW@;DBKAq8l%htB4YslEaa'$A0>r,ASc0*@rH4$@;]Us/g)94
DBN"pDId[0F!,=.@q]RoATJu>Dfm14@;[3!DI[L$F(HJ'Cgh3s%16feAn?%*ARlp&@<?1(+EqOA
BHUi(F^f/u+E;OBFCfM9Ch[Zr+<k;V>YoHZB6%Et+@^']ATM*#/g)9.+CT+0DJsV>F*2M7+D>\;
+EVN2$=n&tF)Po,FD,B+B-;80D/!g#@<*K7Bln#29PJBeGT^s6FD,_J%13OO2CTb@:IH=IATMs7
+Eh[>F_t\4F)YPtAKYGnAoD^$+CfG'@<?4$B.P08DfBu9DJ()1EZfC6F*)>@Bl7Q+@UWb^F`;CS
+AZkt=(uP_Dg-73$>+<iAKYMtF))n>E+*6f+DGm>Eb0?8Ec,H!+C]U=@;[2R:e;d>@;Ka4+<XHt
+A?KeFa,$NBOr;7A7d85F(f-$C`m5+D/E^!A0>T-+E_a:A1e;u<+ohcA7croDf'?"DIal1ATW'8
DK?q4Eb/f)F)YPtAKYT'EZee,C`mS5F`);4A0?&6CisT+F"SRX8K_qhCj@.@AS#BpFD,5.G&M2>
D.O.`FD,*)+Cf>-FCAm$F!+(N6m-#S@ruF'DIIR2+D,>(ATJu'F`\`t+CoC5DJsV>CMn'7+D>\;
+EVNEA7]joEc#N.AKZ).AKZ/7CisT+%16u]D.Oi%Ec5e;@3BB#DKU1HAnc'm+E1b2BJ(DM87c[K
AKXPeEb0?8Ec*"ABOr<-D..6sATMr9@;Tq*DKI">Aft]+AS!!*E+*6f+D,P4+:SZdCht52Dfor>
ARlp,DesQ5ATKIH+B)i_+EV:.+A,Et+=LiBAS#CdF)*3IG%G]'+D,P4+Co&*@;0P!/g*_t+F.mJ
+D>2,AKZ#)@;Kb*%17/n@;Ka&G&M2>D.Rc2D/XQ7FCeu*8l%htD..]4Eb/j*F(HJ9D]iP1ART[l
/0JD1@r$4++E)9CEb0<6DfTD3A8,OqBl@ltEbT*+/e&-s$6UHd67sC!A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA1&`I:-pQUEb065Bl[cq+Co1rFD5Z2@<-'nEt&I!+Co2-E$-N?Eb/fmBle&;
%144#%15R=DII?tGq:(0AfuA;FWb75@rHL-FCfJ8E,ol+Ch7I)+E_a>DJ((a:IH=ECh7$rAKYQ$
@;0O#D.OhuF?1OR@;BFpC1K=b5\FqBBl#D3Df#pj%13OO%13OO%13OOD..<rAn?%*C2[W<0ht%f
+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U
:JO&6-SR/5/i+ja$;aD^<(9Y]9iF29-[09B+Dbb0Fa,8V+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u
$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2
De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2A
DffQ3/p)>[%16igA7TUg05,HECh.Ho05>E9Bl7HmGV3ZOD/9XgC2[WnDdtG>A7f@j@kVS8A8l'k
/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9
Bl8$5D_>a=F:ARlDe*Zm@WO2;De*g-C2GS;C30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo
05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[\Z#0JO\b
2D?m/C,[h$-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G
+CQBb+E2@>B6%EtD/!m#+EVO?Cb?i%F<GL6An?"(%16MdGAhM4+E):7ASuU$A0>DkFCAWeF(HJ+
DfQt/Cht59H#R>9+E(j78g&=rEb'5D+A,Et+:S[!F`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+
FCAWeF(KD8@;]TuE,ol?Bk1dr+EVO?Ci^_2DfQs0$=n'bF_t]-FD5W*+CT.u+EV19FD5W*+A*bd
De*E3+:SYe$;#+X8g$&F0R+^4:IH=GAT;j,Eb0;7FD,5.AoDL%Dg,o5B-:VnA8c@,3XlE*$6UI%
@<>p2C1_0rATJ:f+<Y*5@kW.BE$,Ss%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=L
BkqE*E+*BjF!)l&DJ!f06?RBlDf.!5$?'r-Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2
@ruF'DD!+U8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqKO5%15^G
BPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)
BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.
%16-);H$._:-CWc0J5@<1FEV=:eX/S7ScoV;a!/hGA1q;Ch[d0GUFUV+<VdL%15cp6:4%<77U-O
=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*p-F`Lu'/p_5N%16ig
A92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0ddD;6q($A;Fs\a8P`)E
3Zp+!3Zp*c$7KY-A92[3EarZ5H>.=I+DGm>@;[2rEarcsG%De+Df0Z*Bl7X&B-;8,EbSruBmO?$
+CoV3E"*.tATDj+Df0V=De:,6BOr<.BQ@Zq+A,Et+Co1rFD5Z2@<-W9A79Rg@UX=hF!)lGDe*Bi
Ft@BHA1VkFBl%i>%172j@<<W#Eb-A9F(Jl)FDi:2F_PZ&+EV:.+A,Et+EMgLFCf;A+<X9P6m-Pr
F*(u1+Co1rFD5Z2@<-'nF!+n3AISuZDf9//AU%X#E,9*,+E(j7BQ&);8l%ht@ps6t@V$[)F(Jl)
FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>6DBMOo2_He/+A,Et+ED%5F_Pl-F!,R<AKYT'
Ci"$6Bl7Q+@:WneDK@iJ$4R=b+Cno&@4uA-Bl%@%%144#@<,j2H>.=@%13OO8l%htF)Q2A@q?cn
Bk)7!Df0!(Bk;?.Bl5%AC2[X(Dfp)1AM/:CE%)o>@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*
$8EtP;KZk"FD,5.8g&1bEbTK7+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9
E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC+=LuCA92[3Ear[%ATW'6
/no'A.3N;4F!+q'ASqqa+<Ve:BOt[hARlp%DBN"pDId[0F!,3U/hf%3+DNhf0JO\YDIal+Bl8'<
+DNhf0JO[m1GU(^BlkJ=H#n(=D0%<=$6UH6:/=hX3Zq"9+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA
+EVNEEcl7P%13OO1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08
/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.B4YslEa`c,Cggcq@psIjB5_g9/e&-s$6UH68l%ht
Cggdo+D>2,AKYl/F<G%(ASrW-@:Wpl@rH4'Ch7^"Cj@.BDfTr.@VfTu@V'Y*AS#`g$6UH6=(uP_
Dg-7F@;]Tu9PJBeGV1*]<+oue+DbIq+EqaECNCV:DBN"pDId[0F!+n/A0>T.%144#+EqO9C`mq?
Ebce9DBMVeDKU1H@<3Q8ASc0D+E2@>G%kJuA0?/9FWb45+Du+>+D>2,AISth+<Y*1Gp$[CFCB'/
+A,Et+Co1rFD5Z2@<-'nF"Rn/%16QQCLqO$A2uY8B5M'kCbB49D%-h$%17&pC2.Zt1,2Nj/h1g\
C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JGEp$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU.NgK#
0K3o[F>5]s/KeJ4A7]9oH=gl-ATJ:f:-pQU.NgK#0K<u\F>5Km/KeJ4A7]9o5uU-B8N8RMA9Da.
Et&IO67sB1+>PW)3,`;K0f1")+DG_7ATDm(A0=0:6V0j/2'?sOFED57B-:o+FDi::De*BiFs(O<
A0?#:Bl%i5E+*cqD.Rg#EcVZs%13OO:-pQUF*(i.A79Lh+DN$?@rc:&FE7luEb065Bl[c--Y-dt
F_;h=@<633%13OO:-pQUAoD^"AKX9;6V0j/2'?UN+CoV3E,uHq:-pQUF`V87B-;8,FED57B6,20
DBNY2A8-4$A9D<s+Co1rFD5Z2@<-'nEt&IO67sBH;aX,J3&P&OC2[X"@;BF]4ZX]?%13OO:-pQU
H=gl-ATJu&A7TUr+=M;BAKXT29H[ka@s)X"DKK</Bl@l3Df-[i+EqO8BdjJuEb065Bl[c--[oK7
A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%13OO:-pQUCi<flC`me/EbTK7+Du+?DK?p0$;+)^7oE/j
H=&fr+=CoBA9;a.Ci^s5$;+)^;cQCrH=&fr+=CoBA7AtgBk)6rF*)IN%13OO:-pQUE-67UG]IA-
%15L!6WHiL:/jSV9hdoK6sk7I+?_b.0H`D!0F\A1D/XQ=E-67FE,m'KH[\_=I4#I2%15is/g+h9
DIe#8AoD]4E,8rmBl7Q+GAhM4F!,17+Dbt)A7]9o@r,RpF(KD%$;No?+D#S%F(HIAH[\_=I4#I2
:-pQU8l%iF;G\KKATT%BH[\_=I4#I2.1HUn$?L'&F`_SFF<DrGDe'u0Ec5](@rri7ATW'6-OgE*
E,'<%2D?mA0ht%f.Wo]FDe(a[1*CWi/Kf1TA79Rk+A,Et+CSekDf-[U/hf%'Ao_g,+?(o,0eNnB
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130em9O@PKeN$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F<ml3Zoe95s]U5@<6*B3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OO-Y[=6A1&L4ATT%V3[\rZ@:UL)EbTW,-OgCl$>OKi2_]J>3ZoOf+<VdL-Y#1j
C2[W92_Zs>C2[WnATf_J@rc:&F>#!N$>OKi2D?mpA7TUr4ZX].-Y#1jC,Rb$04AC%Df0VLB4Ysl
Ea`c;C2[W9-OgCl$7Kq+@:UKqDe(d\GUt4WDe(J7C3(aO+Eqj?FCcS9BQ&*6@<6K4C2[W@0J['I
A8c?:-YdR1/no'A-OgD2Eb/Zi+DPh*2_]J--YdR1FDl)6F"V0AF!iCZGB.D>AKZ&-Dg-//F)rI=
De(a[11=^(Df.*RC2[WoG]\![C2[X)Df9H5/no'A-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3                                          ~>
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
zz=:zz,' sortdnub''),(<<;._1 '' jodtester TESTYAMMER ereopen hostsep showpass'
zz=:zz,' testenvironment''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR'
zz=:zz,'00400 ERR00401 ERR00402 ERR00403 ERR00404 ERR00405 GROUPSUITES IzJO'
zz=:zz,'Dtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK004'
zz=:zz,'02 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING004'
zz=:zz,'00 WORDTESTS addgrp addloadscript addloadscript1 allnames allrefs b'
zz=:zz,'etweenidx createjodtools dayage delgrp firstcomment firstperiod fse'
zz=:zz,'n getrx hlpnl jodage lg locgrp ltx mg mj mls mt noexp notgrp nt nw '
zz=:zz,'obnames onlycomments pr refnames revonex swex today todayno tt upda'
zz=:zz,'tepublic usedby yyyymondd''),(<<;._1 '' jodutil ASSUMESMARK AUTHORMAR'
zz=:zz,'K CREATEDMARK DOCUMENTMARKS DYADMARK ERR0250 ERR0251 ERR0252 ERR025'
zz=:zz,'3 ERR0254 ERR0255 ERR0256 ERR0257 ERR0258 ERR0259 ERR0260 ERR0261 E'
zz=:zz,'RR0262 IzJODutinterface JODHELP MONADMARK NAMEALPHA OK0250 OK0251 O'
zz=:zz,'K0252 OK0253 OK0254 OK0255 OK0256 PDF PDFREADER PDFURL ROOTWORDSMAR'
zz=:zz,'K SCRIPTDOCCHAR URLPFX URLSUX VERBATIMMARK WWW0 WWW0linux WWW1 blka'
zz=:zz,'ft changetok compj compressj createut ctit de dewhitejcr dewhitejsc'
zz=:zz,'ript disp doc docct2 docfmt2 doctext docword ed et exobrefs gt jodf'
zz=:zz,'ork jodhelp ljust obtext pdfreader qt reb revo rm rtt setwwwbrowser'
zz=:zz,' textform2 wwwbrowser''),<(<''test''),<0$a:                           '
zz=:5534{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DQC8+>P&u+>tu/+>Y,q3&*B82BX_72)-44+>PW.2]st#2_uR9+>Pr73?U=)1,Ls53$9t11H$@7
+>c&<2.UW8FCfN8:-pQ_A8bt"ATMr9F=f'eFCfN8+EMXI@P/!_67rU?67sB[BPDN1FCfN8+>,9!
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
/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JP:oAR[AN+>"]aC2[X)ATMs)E[`,KDg*=?Ddd0fA0>T(
FDi9MBkhQs.3NGF@ps1b%13OO@rGjn@<6K4-Y[=6A1%fnC2[X)Df9H5:-pQ_C2[X)Df9H5+CcuT
+A,Et+EVO?Ci^_/CghC++>"^IG][M7A9/kc:IH=JFD5Q*FEo!=CghC+/e&._67r]S:-pQU8T&W]
Eb8`iAKZ28Eb'5P%15is/g)9FA7T=nE$-8G@:WmkGAhM4F"_WHF*)IGFDi:7Ec6)>06;8MFCcR;
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9FCi!utD.Rc2@rH3n
Bl7L'+DtV)ATJu+Ec5e;-urm2DIIBnF"&5?DIak<DdmTmD.Rc;+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9FCi"-'Aof(;@;Ka&DIIBnF!,L7An?!oDI[6g+C]U=DdmHm@ruc7Df-\8
@;TQuCh[s4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9IASc""E$-8GEb0*+G%De?
DfTB006CcHFE8R:Ec5e;B6%p5E-![RF_Pr/F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL%15is/g)9LATVs;+<VdLB4Z0-Eb065Bl[cq+EVNEAU%crF`_1;+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9MCiF9.+<VdLA8-+(CghU1+EM47
Ec`F7ATM@%BlJ0.Df0V=De:,1@VTIaFE8RCDBL?Q.3K`U+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9
$;No?+<YE;A79+^+<Ve;@<lo:F(oN%AKYetF*&O7BOPdkAKYE!A0>B&ART[pDf-\9Afs]A6m-DW
C1UmsEt&IO67sB'C2[WrASc<.+<Y3/F)Yr(Gp%$CCh[cu+A,Et+D>>&E$-8G+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+Db[5+<VdL+<YN0CLnVsDIal+Ddd0!8l%htB6%p5E$-8G+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Dkq9+<VdL+<YN0CLnW)Ddd0!
F(96)E-*3F+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<V+#:-pQU+Dl3C+<VdL+<Y<.F<GF/@rcK1FCf]=+D,Y4D'3D#BlkJABl7I"G9A"N+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/G]4cJ+<Y]9FEMVAF!+m6Ch[s4
+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2Dfd+9DBNS4Dfp#?
+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL+D58-F!,@/D.OhuDIal3AU&;>
Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+8l%ht@rH7.ASuU(Df0V=+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9EHPh8F)Q)@ARlp%@VTIaF<G"0
A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+:SZQ67sB'E,m'D
+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4JEd8d@@;]V$+CT=6@;[3!A8-.(
EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8F)Q)@ARlp(AS,LoASu!h+DtV)
ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'Eb0E4DIn&8
+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%
DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJDfTA2AU&01@;0UfFD5Z2+D,Y4
D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'F`V,)@X0(=+ED%8
F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i+EqaEA9/l3DBL?P
.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X)Df9H5+ECn.
B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcmEb$;:BPDR"F)YPtAIStU$=e!a
CghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!C2[X*FD5Pd67sBqDe+!4Bl#D9
C3(LL/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5D%15is/e&._67sB[BPDN1F*1r%
CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8F`_>6Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQU
Amo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,+EV%5CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2
@;TjmEcWiB$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<
G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'DIIR2+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>
ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-$;No?+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@lt
Ed8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=DfT]'F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#
D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9@VTIaFE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdL
ARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.F<G[:G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU
+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB
+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7BFCB<6Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>
F)YQ3DBND/Dg-86EZet4EZf:<Ch[cu+D>>&E"*.L67r]S:-pQU:2b5cF#ja;:-pQU+<Y69Ec5t@
-6R5B+Dk\2F(&]mF!)lGDe+!4Bl"o4@;]^h+>>K)2)$U90Jb^L.1HUn$=e!aCghC++=CT4De+!4
Bl#.+$=e!gDKBB0F<Dr>C2[W1%13OO:-pQU@s)g4ASuT4BOu"!+EVO@Bk)2n$;+)^84?3K4ZX]>
+?CW!%15BgDf0Z.DKKqB4!67s;DDrs1,i!Q<(0;\1dYVoBN\:k;H@s,FDOB7<I/e!<&mo0<Dls[
F>+.25tZ'+8T&'MGT]'j0l'm$?[6sDF\$:_DIuIZ?ZB(%8P)`8Ch@E92G6MPDbFP=>");)H"f`6
%15F5F*(6!@:OCn@qB^(4!67o=u1.i3A!O682rtYF]CA;3&!cYF(f,^CI^<>G&p>HF_!4LFa8(/
B4DAX6Yp1PF(KD8+<W`g0l(\f7Vl*cAkGfh?Vs19BN7eb=DDqm7q>^Y@Vo[mBe<su=EJb"ATq*p
%15I@A7]g)+<VdL4!67K2c3%^;0-nqEaqC;H"D(SH;?:d2G\.#APl*DH>#iFG&q1M9K,I[=\T>4
6tL=KDId<rFAla\FD5Z2+?L]#FDa*Y<]EWm/TPW6Eb[Ne:2>&D:2N?f87=)NAl:p468M,7H?"7M
9QG=d$:JTKARfh#EbT*++?L]#8kh]N@7*S";IjWW6Vh/C1du(RG@aQZBgOC'1Gi]C=^j]S;G8u+
881$m$;#,WEc5K2@ruF'DBM"`0elO>=%,)g8h`PLC.(@211+d1:Ld4I2/>U%8N8\E<DkVrD,,(p
/T=B\%16!ECh7$rAPR/cATJtU+>I=sH#6)JDH]AAEA1sMBlJ)h7SQTo85`E)89%LAA7'.2;_r]B
;E8c"CCLVZA7T=nE$-8G+?L]#Dcnna7r)!jEC<i29Q#,i:.J,?<]2NaF@]SUG@EF*0mRb;<B)RK
@l.0p$=e!kE,$L<+<Vdg+>Glt:fqpa95JfEB3KS#9mKcL8hr_"@SCr%;J8ubARA2374g3;DG#4Q
5n+03AS`J3+<VdL+?L]#F*(9%8Qf4e;+P:eGu/fQG%=ZFBkg"*APtEbDGbCo5t"[.7Wr]/=u1(+
$=m^aB6%r6+<Vdg+>GZ_7<_dA3I4S'>!Z+YGZS<t9kHp_DKAN]DG+t?1,:UFCi;p5=\pep9aqG?
Bk/>/+<VdL+?L]#1ib9h9OBJ@8QA2=H>,fi>&HZI<G5f_7RgosBiTFq9mToC@8D2=@ngkN$=mjl
E$-8G+<Vdg+>I>DBMq,V9l3aM:ea;5Am'%N6?--e=]n$F@qe\W3I,(WG'[&'C1L=W71BT7DJUF<
+<VdL+?L]#=_KBt;.b#1E_',(BM^K`9j1P-B5MWe2d^-A8iKd;@7NaHG%j?!9fPiV$=n'b+<VdL
+<Vdg+>ILb=*R7jEdCo/<%pp1F]Ch?8MkBaF$r_V;e%D&FY.lU@Ua4TD_65l9aqG?E-#T4+<VdL
+?L]#6YBO\1GMs#0P)t[8p3!k9l!?rF&bk%AoKGK<(qI985=IkEDC^N1hnuZ$>!`j+<VdL+<Vdg
+>Iq*>%VntCILc\F]qOX7TF8K1brQ=G%ENjCc#on2H+K\=DVns@UrVB1^se'F<D\K+<VdL+?L]#
3(ukBE`Ye"=E-0186/,NCbff^1GE<6>&._jB2NtD78GLF@o[eF;HI?;$>3pl+<VdL+<Vdg+>J+/
2/Zt_AlNAX1Lt/lG]$;uEC3)]86/c)<)7=%AoCC_@T5(&G?7Eh@grcXATVs;+<VdL+?L]#2L8GI
?V53OCIC-m7WLF^Cisf2H$;2D@q7GnE)fIs=^c,kEcsBA7qtU)$>40n@WNY7+<Vdg+>HVX83nph
3+bs&@n&h';0m+O/TaEQGu%(QF[L"k=)W1s;07(>1KAR4=Ub^NEc<-D+<VdL+?L]#<GbBNH=:Yi
0hk\g9k$gq3,E>IApR3g<D.%G0Q)/47Sbs;2cb65E_8"p$>4H'+<VdL+<Vdg+>IA)C,BL8Bk02%
E`#q`=Z/6`C.EP,8S2*tDIcdmDe3oWD,54]Bj",,<=K:KCiF9.+<VdL+?L]#;bL4[8P+"^A9gjj
0i^hUDI5n$AT^9q<D6=o;+GJCE%j.=FECPC:I@P[$>OKi@:s-o+<Vdg+>Hqe6u5_!92[NG:IIrb
C.2/]<cpc'BQ%N8<cr%q2.&(M:eO/Z1.QRI0F\A(De*NmCiCL>+?L]#6V0(K<cUc+;_hu\6VgfO
1N5rt5tE^eFu21#G\:#iC2%TeEGe*$?WM4W$>a>t+<VdL+<Vdg+>H;:F(9;YE^aS=2c)k@:GbU&
2H;Rl:K):&1M9!m;d**nDf\p"G\M=e@grc]De!F#E$-8G+?L]#:1%`jH>dA<AoDC!7!^G!2.g>o
9M89(E^NWC6T-_o85WPIBgG=$E_'[L$>j3eAKW*<+<Vdg+>H;?<Cp=N1K8$cBN@Vt=(HG`:g#VX
9Pnul8nqdIAiVk*;K6&PGrB#N5n+0<Ci^^A+<VdL+?L]#>&RM26o.P+CbTLFDg-4j>#%Fd0hYAZ
AN3%M9ljHT2JI/KCfbIr6SWWk$>sF!A0<!;+<Vdg+>GH9D.5LnGBGl61h(bf76*,+H!sirD*_ZJ
:/4ARG#hQr0j-8HDgFru;%3kMDffW4E$-8G+?L]#D,itq3AjPf1Ia94<AA2rG=HIf2aM+NAo;T^
@8\gX;++2?2-*(UBi.k>$>sr.+<VdL+<Vdg+>HJhGu.UM7PK!tASkC%2b.m`/QFek7sRcp2bmq0
B2X%R95?k'6T0%*@grc_G9A"N+<VdL+?L]#3C?\RGtiQe0MHb.<_cda<F99N3(u&<Ce8nr7TjF\
93+o$<,[(KBMN1L$?'Gt+<VdL+<Vdg+>IeJ>#ApT7o_9N2IfW>78[hP9NNf68TR]d87X_q9l<X<
<-VtA=[mOP0F\A.@:O(`+<VdL+?L]#@T-`C:I]1YGXQ1g@7W.G<_%(:Eb/<m<EV%Q/P\#q;dj0>
6$H1!7pdqZ$?1#.+<VdL+<Vdg+>Ib::iJ![H>>iBBl.][0f=/BEc$)@F'(_C6#osr0L:"YGZeio
6q)2Q0F\A.F`\`K+<VdL+?L]#3*%eA1hoW>H>6;CE(N')=(Q8VBmETj6VVWA=a*:d@<uTB89\WJ
9/1Js$?B]jA0<!;+<Vdg+>IeW9OUh99lFlg89fDH/O`B93)31V@59eo=@[1P1.>)9H8mTmFA>4Z
G7=n"ATMs(+<VdL+?L]#0k<jc=$]?";+a5U3(IG(8TT/YCH62c85<i!F_#eiAjet,=(3t39i4Uo
$?B^$D]g/F+<Vdg+>IF^F=fmm2fWk8=%YAj1N#ob;f5Q)DfS`R1iZkk89]0#:dS6#;D;r]3"648
ATi!0AU#=?+?L]#@8'6I9P74>E^jhV;H#J@9NXkBB6RH]8SCh76@*QhDJhd!929ItAi4K9$?Bu+
+<VdL+<Vdg+>HPu94LsjG^*&.H"2#.2Jk$Y2+T]#APm2c/TbQ<Eca<f7<D=#Bm2:W3"648FEAWJ
+<VdL+?L]#@WGO*@6nd)8Q\l4;JBc>>'2W=GVh`Q:Nq(EAPFaj<A\?,0PsuO@9-A;$?^E$A7Bg,
+<Vdg+>I#06V_DK@S9a</M2$Y=(Y!*6UF4dB2E29G#:S?CK>OUFY.fP;FEH&;%3kTF(KD8+<VdL
+?L]#6;MT8F[7g$B3&//F)#>tCfsS/1i.#JAMm;+:O-A/@:hrOAT(+/3F>bq$7QDk%15is/h1CC
E+NotASuU2+Cm&U+Co&&ASu$iDKI"FDfTB0+:SYe$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4
@<6L4D.Rbt$:.Th<D>n\9gMZM4ZXs!F)uJ@ATKm[%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0
DfQt/F`_;8EX`@A<E)Lb;GBGT90G<`@<H[*DfRld%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0
DfQt1Eb/[$ARl5W6W-?=<(02L5uL?=3[\EXART[lA3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-
CER5-EZen<@:UKoF`(i#EbSs"+CT.u+D#e+D/a<&Et&IE=[>GM5uL?=3[\H`@:VDH%13OO:-pQU
A8bt#D.RU,@<?4%DBNe)Ebce0DfQt;Df/uo+D>n8B45gp@;[2rDIal$G[YH.Ch7Ys$;F;k5t"F5
;G0/6-Z*d>@:VDH%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQtDATD6gFD5S$$<BSn6:"RB
9hdoO90G<`G%G]'@<?4#3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+EDC=F<GdGEb'5#
$;sYq<*)jn6rQfG;G0/6-ZX-DFE_YDA90dZ%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebf_=/KeS8
E+NotF!,C=+E)@8ATAo1@<-.)%15L!6WHiL:/jqR;G0qO3Zp^e;cQO\;b]PU905F><(Ke_9gMZM
4$un75u^9@9gMZM4%*4;6qosF905jD:-h9B5uL?;<^fnQ5u^EM9gMZM4&SjM<*)jn6rQfG;G.H+
%15is/g+h=CiCM>Eblk;Eb/isGT[G&<DlLe7T_f7-YRUDE-"&n04]!2F"V*DDeElt/n8g:04]!2
F_t]-F>%/X-OgDX67sB\;G9nV=?S\f-YRUDE&oX*A8bt!/n]*@B5D-3@rH3;<bZ,h5@e\B8OP]h
%13OO:-pQUBOu"!+E_^D+EM[;AncK!$<9tt;cQp_3[ZRlA8--MBP]hCDI6CB,:<p-%15is/g,4H
F<G+4@s)X"DKKH#+EqaEA0?#8Ci^^.$;No?+Co%qBl7Km+DG^9F*2G5EarooF)to6+<VgU.OdM5
+@B$L@:jUmEcZ>C+C\noDfTE1FE/L4Ci"36Bl+u'@Vg%,DffP5+:SZM:II`B9Mdl5+FH3m@;Kb%
EbTA;/j:C+-T`\&@V'.iEb0<6EZcJd+=B5u-=LM.ATDj6E[`>!+=LZ7Cij]3D'gl!+?V_<?SW`r
:II`B9Mci`/g*MZ.3L/g/j:C?<DlLh<EK\;8l%iG78-N@3Zoh!4B59Q:e"P9+=nil4s2S,8l%iG
78-N,+=JrnI3;-X6qBa?:^mb(:II`B9Mdl5+=Jm(+>A.7:II`B9Md/\HQk0e8l%iG78-Me$4R>;
67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuT!$?:/N3Zq^9A7B@pF`2A55V>Vt=%Q-r
$4R>;67sa!DId9hE+NotASuU2%13                                              ~>
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
zz=:zz,'(<<;._1 '' doctest dispUnicode001 doctest''),<<;._1 '' jodbasictests d'
zz=:zz,'elBasic001 didBasic001 dispUnicode001 dnlMacroTexts newdBadArgument'
zz=:zz,'s001 notopenTests001 zzzJodDictionaryReset''                        '
zz=:177{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fU:2+>P&u+>GW+3?U%4+>GQ+2e6i:FCfN8:-pQ_A8bt"ATMr9F=f'eFCfN8+EMXI@P/!_67rU?
67sB[BPDN1FCfN8+>,9!/hS8YDfT]'FED))+EV1>F<FOrBlbD=ATMr9/hSb//g+bEEc#6,FCeu*
FCf]=$;No?+AHcpAKYT'Ec#6,FCeu*BOtU_ATAo'Df'?&DKI"CAU&;>FD,*)+<YlBCht4:@V$Zo
DfT]'FED))+@uo867sBoDfB8?+<XWsBlbC>FCfN8+<W9h/hSb!+<Y97Ec#6,FCeu*+EV1>F<D]*
BPDN1+EV19F<D\Y/hSb/$;No?+D,P4D..O.ARlp*AU&;>9lG&`+D,P4D..O.ARlosART+\EZek1
D/Ej%F<G[:G]Y&NFD,*)+<YlBChsGR67sBiAKYT'Ec#6,FCeu*8K_\bE+LXE+AH9bGp$d/A0>;'
Ch\!5Ch4`*@;THrGA(o9AKYT$AS#@_+Eq78$;No?+EqL5FCcS'F!,OADg*<U+CT.u+Du+>+EqaB
C`mq8Blmo/@Wcc8@rGjcBl7K)GA(]4AM,*.Dfm1DARu3D67sBT@<-W9G@>P8@3B6%/db??/db??
/g,=KEaiI!Bl,m<:-pQ?:-pQU+<VdL/hSb/+E_R6DfT]'FCeu*FCf]=$;No?$;No?+CfG'@<?'k
3Zp18+B)ij+>PW)3$9q03]&iX2)GXI:-pQ_78d#Z;E[2d.!KTMA18X5@;0P!+E)-?/hSb/$;No?
+>Pes;e9nj1,(CA+>GQ21c[TS1^XRb67s`W8Q\,>+Cf>1Eb/a&ARlo9/hSa`$;No?+EM+(Df0).
@VfsmCER\3Dfol,+ED%1@;0U%F`);>F^o)rA-rZ=67s`uDe!m#F*&OH/M/)eATMr9F*)P6/db??
/db??/g+,,BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=$;No?+B3#gF!,R9F*&NW/hSb/+D,P4
D..O.ARlp*AU&;(:-pQU9lG&`+D,P4D..O.ARlosART+\EZek1D/Ej%F<G[:G]Y'MBOQ!*GA1l0
+C\n)AoD^,@<?U&A0=GdBQ%j$/db??/g+,,BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=$;No?
+B3#gF!,R9F*&NW/hSb/+D,P4D..O.ARlp*AU&;(:-pQU9lG&`+D,P4D..O.ARlosART+\EZek1
D/Ej%F<G[:G]Y'MBOQ!*GA1l0+C\n)AoD^,@<?U&A0=GdBQ%j$/db??/g*ksEd8d@@:UKh+Dbb6
FDPM2Cgh0i+EqL;F(HJ+Ch70fAKZ2*F!,[?Blmo/@<3Q4DJs_A/KeJ>A0>c.F:(c0/g,@VDepP?
BPDR"+C]J8+Cf>"@;0Uj+EqL5FCd'I+B`W*+EM+*+AH9bGp%<>F!+m6BQ#L1:-pQ?:-pQUG%G]'
@<?4#3XSVK/db??/g)8Z+<W9h/hS8hDJ!g-D..NtA0>u*G]X9f67rU?67sBjEb/[$ARmhE1,U1Q
AT/bI0JGI/0ebXF3BB#S$4;&sFZh?"BeCM`+>X?3A8-*tF`VXf/g)NYAL@h"De*<cF(o-+ATMs7
:-pQ_C2[Wl@<6-mFCfN8F!,QV/Kf+WBlmo/De:,$@<6-m+A,Et+EV19FE9&D$;No?%15is/g*r/
ASuQ3@3AH:5t"dP8Q8,$FCfN8+Co1rFD5Z%Ed8cUFCfN8C2[W:.3N&:A0>o8DK?q/+EM+7Bk;>p
$;No?+E(j7@UX=l@j"B>6m-S_F*&OG@rc:&FE9&D$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is
/g)8Z0e"5dFCB&t@<,m$8g&(nDe<^"AISuA67sB'+>PAg-u*[2FCfN8ATB4BCi<`m+EM%5BlJ/'
$;No?+<Vd_.3MMW5t"dP8Q8,$FCfN8+Co1rFD5Z2@<-'nF#kFbAS!!+ATMr9-t@:/@<?(&ATMs(
Bk)7!Df0!(Bk;?7+:SZQ67r]S:-pQU+<V+#:-pQU@rc-hFCeuD+>PW)2f<PW1,fXL:-pQU@q]:g
B4YU7+>PW)2e6K00Jst)+CSekARlo3DJsW8E+NodATMs70JG41+EVNEF*22=AISuA67sBjBOPdk
ARmhE1,(C@A7]7*1*A.k@:Wn[A0<:2DJW$U@rcKeAU&<<.3N_N+EM[>FCcRH+B1d.<*;L]9gqrC
3\V!M:-pQU@q]:gB4YU7+>PW)2e6K00f^@.+=Lc7A3s^GBk&hN0e"5RA7T7^%15is/g+Y;@;]^h
A3(hg0JGJ)@rsC`+>"^XF`MA6DJ()1DBO.:Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FG
ATMs7%13OO:-pQ_A7]^kDId<rFE8QV+EV19F<GL6+=Ll5AT2]>+D,P4+EM[>FCcS.ART+\EX`@T
78m/^5uLE20g.QO%16'';cHmc9he&S4ZZP2;cHRZ;GAi"+<VdL+AP6U+EM+9+EVNE0d((HEZee,
C`mS+F)tc&ATJ:f:-pQ_ASu$hAT23uA7]Y#Et&Hc$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''
-u*[2FCfN8ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA0<6I%13OOCi<`m+=CoBA9;C(FCfJ?%13OO4tq=>+E(d5-RU#Z+<VdL+<Ve%67sBjCi=B+
+CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f4tq>%A0<7AATMs.De(OL+<Ve%67sC!E+No0F*(i.A79Lh
+AtWo6s!8X<(.oXFCfN8C2[W:.1HUn$7InX3]&Q?+>Fu]:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2
ATDs&FD5Z2+E)-,$4R=O$3                                                    ~>
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
