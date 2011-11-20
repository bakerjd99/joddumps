NB. JOD dictionary dump: 18 Nov 2011 15:36:26
NB. Generated with JOD version; 0.9.4; 3; 14 Jun 2011 09:38:23

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

JODTOOLSVMD=:'0.9.4';3;'14 Jun 2011 09:38:30'

JODVMD=:'0.9.4';3;'14 Jun 2011 09:38:23'

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
0etX00fC.0+>P\p0etL=+>GSn0fCpL+>P_q3AWB40eje*0JG=+0f1"-0K(a12]sn81E\D,+>Yo3
+>PYo1,Ud?+>GYp0eb==+>G_r0f^pF+>GPm1,:^C+>Gbs0ekLF+?1K#0Jah,0d&;.1GBq+2]sh2
1b^%-0H`,10JR'XART[lFCfN8A8,OqBl@ltEbT*+:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9
/M/)TEb/[$ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?+<V+#:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0kP!+0f0=H:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(F;D..]E
1E\7lD/Ws!Anbge+EVNEEcl7BGA2/4+Dtb7+=Lr=De(:>Bl8$(Eb8`iAKYf-@ps1b%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-OgDm
DeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$9g.jFDYu5Ddso&ATT&C/g+eI
E$-NCDe*s$F*(u6-OgE)ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sC'DK9<$BleB-
EZee.Gp%3?F*)/8A0>Ds@ruF'DIIR"ATJ:f5'nn)6qKaF;a!/a1a$^I+=ANG$8EZ-+@Jdg<)Yq@
+>G!XBk(p$6qKaF;[j'g+Bot0BQ&*6@<6K46qKaF;a!/a.!mQj0d&kU6W?u5+<u=X.kWJ!0d%kq
3[]#\F*)/8A1&fK74o]HHS-Ks+@Jdg<)X550d'[C1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@
Gp$O3C`m51EcP`/F<G=:A9;C(F<G+.@ruF'DIIR"ATJ:f:-pQU:2b5c3ZrNXAKZG:De*s$F*&OF
Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`
6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT
>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;%14g4>9J!#ASc0*-ZW`?+t"p6:IJ/N
;cHXj:K/km+s8O[+>7^^%13OO:-pQU@rc-hFCcS+D/aTB+EV19F<G+.@ruF'DIIR"ATJ:fATAo2
ATqZ--Zip@FD>`)0IJqS:IJ/N;cHXj:K/km>]aOuFD>`)0II;:ATAo2ATqZ--Zip@FD>`)0df%T
:IJ/N;cHXj:K/km>]aOuFD>`)0ddD;ATAo2ATqZ--Zip@FD>`)0eat:8l%iS78m/`:JXq@-X:b)
F*)/8A2,bc%16Ze+Dtb7A0<7AATMs.De(RV0IJqS:IJ/N;cHXj:K/km>]aOuFD>`)0eb:/%13OO
:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No0
0F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=m^a6=FqL
@k]Sk:-pQ_A7]RD@<6-m0JG4(F=f'e@UX=l@j#r'Ch[E&-tHn*.3N_DF*)IU%15is/g(T1:-pQU
G%G]'@<?4#3XlEk67r]S:-pQU5uU]^9gquA+>G;f@3AH:5t"dP8Q8,$E-67FA8,OqBl@ltEd8cU
FCfN8C2[W:.4u&::-pQB$;No?+A,Et+CehrCi^_@D]j+4FEMOFFCfN8+D#G6Bl\-0D.RU,+>"^E
F)uJ@ATJtd:IJ,W<Dl1Q+:SZQ67sBhA7TUr+DG_7FCB!%ARlolDIak^:IH=9AThX$DfBQ)DKI"3
Bk)7!Df0!(Bk;?.-u*[2A7]p;C2[W9F`_>6F"%P*:-pQB$;No?+<VeFA0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZD/=89-YdR1FCfN8ATB.-$;No?+<VeCDdd0!-YdR1FCfN8
ATB.@+:SZQ67sB'+>G!ZFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4A+AP6U+CfG'@<?''FCfN8
+Co1rFD5Z2@<-'nEt&IO67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3lfFtbWn@rH7.ATDm(A0>u4+DNee0JXb&+ED%2@;TRd
%15is/g)l'D..]E1E^gZA79RkA0>K&EZdt502-(tFa,$PATDj+Df-\9Afs]A6k'Ju67sB80l:?E
1,'h!C2[X)ATMs)E[`,OAT;j,Eb-V/%13OO:-pQUFCB<6Des?)Gp%0<EbTK7+EDUB+EqOABK@7Y
0HiJ4+?V"o/hSb!E+*j%>\7\dAM.\3F!hD(:-pQU@ps6t@;L"'+EDUB+EqOABHVD1AKXT@6m-Vo
Bl%L*Gp"MUFEArS-usHJ+EV%7FDku6B6bVAATMrB%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0
F<G!7GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B13a68
.1HUn$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>REZf=DF<DrF
@;U4,Eb$O?+<XEG/g+kGFDi:4Bk)7!Df0!(Gmt*lEZen1C`k*>@;U4,Eb$O?+<XEG/g+kL+DGp?
Bl5&8BOr;sBk)7!Df0!(Gmt)i$>"6#A7]R"-Y["+GAhM4-QjNS:-pQUA7]RgFCcS=DfT@t$>sEq
+D58-+=Cl3D0Ko=A1&KB:-pQUGAhM4+DGm>A7]RgFCeu*@ps7mDfd+7ATS@g%15is/g+kGF(KB6
+>GQ(+EqaEA9/l-DKKe>A8,OqBl@ltEd8d9DIal#ASbq"AKZ).AShk`.!KTMA9i-4Df\'&+?Ui&
+=DAOEb'H7Df7!G/0Zek+Dbe8F*&NK3Zot++DEGN0eb:1+?_b.0eb:(,9T)k2'G"<+?V#c@;U4,
Eb$O,$>"6#E-67FGAhM4H#R\?Et&IfEZen(C`mq?Eb'H7Df9\+$4R>;67sC)Bl%T.DJsV>@V$Zj
@VfTuFDi:7ATT&'DL!@8ASbq"ARlp-DfTB0%16uaEZf"+F<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7
Df9\+$4R>;67sBkASbq"AKYDtC`mb0An?!oDI[7!+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze
+>GSnA7]R"GAhM4H#R\?Et&IoATAo9FZhc.F`V,8+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$
+ED%*ATD@"@qB]j$8EZ-+>=pNCi<d(-9`PrDfTB6E,TZ9%16T]ARTU,-OgCl$;No?+B1d.<$5+>
6UO:@;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63A7]h(Ec65F
ATMs(Bk)7!Df0!(Bk;?\67s`uATMs6Dg?G9F*(r,@ruF'DIIR"ATJu9/M/)UATMs6Dg?CH8l%ht
FCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F;D..]E1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0
@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBkAS,Xo
AKZ)+F*&OIFD5Q4%159QHZX+DCi<f+B4Z0-I4cXTEc<-KC2[X)ATMs)E[M;'FCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%13OO:-pQUF`)52B5)F/ATAo%DL!@HATMs.De'u$Bk)7!Df0!(Bk;>p
$9ieh+@Jdg<)Yq@+>b3ZA0<6I%14g4>9H=*6W?uI3Zp."E+rft+@Jdg<)X550d'[CF(fK9E+*g/
+@Jdg<)Yq@+=MRh+u(3.8OHHU.3Kja+=f&t+u(2g/35/#ATMs.De(4E+@Rn*5'nn+0d&kU6W?tn
$8EZ-+>Y-\AS5O#4s36b6W?tn$4R>;67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!
Df0!(Bk;>p$;No?+AQisANCrUBOr<8C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-
Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mE
ATW-7Ebce<Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?t
A9;C(F>5-P$4R=s+Bot0BOu!r+=D2?+<i0a8l%iS78m/`:JXq@-R'ZdF!*,U-OgCl$;No?+B1d.
<$5+>6UO:@;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16W[A3s^GBk&hN0ht%f
.V*7(6=FqL@k]Sk+ET1e+C\c#Bk&86A8,R'+EV19FE9&D$;No?%15is/g+SDF*2>2F#kEQ$;No?
%15is/g)8Z0e"5dFCB&t@<,m$8g&(nDe<^"AISuA67sB'+>PAg-u*[2FCfN8ATB4BG%G]'F!+n7
@;0Od@VfTb$;No?+<Vd_.3MMW5t"dP8Q8,$FCfN8+Co2-@ruF'DIIR"ATKmA$;No?+<VdL+<W(S
ATMs.De(OQ+EV19FD>`)0e=GhATMs.De(RV/0K%GF*)/8A2,bl.3K',:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`bARdGT
+Cf>-G%G]9ARlp*D]idQ/hf%'8l%ha$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A+RG9PJBeGRXuh
$;No?+EV%7FDku6B6bV@@rc:&F<GUHDBO.;FD*]X+>=s"1*A\,+>,9!+E1b2BO#.`Ch555C3(a3
$;No?+Ceht+CT)-D]j(CDBO.;FD)e=BOr;Y:IH=JFD5Q*FEo!LFEAWREcl7BFCB<6Des?)Gp%3?
F*&i?$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3
ASuU(Anba`FD5Z2+Eh=:@N[(0Bk/Y8BkM=%Eb0;$$;No?+DGpFF!+n3B6A'&DKKqP%13OOATAo3
A0<7AATMs.De(OL%16Ze+Co1s+>=63%15is/g,%SD.7's+E(j7A8,OqBl@ltEbT*++E)-?E+*j%
+Dl7BF<GF/FCStn$8EYd+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3FCfN8C2[W;+EV19FD>`)0ea_l
ATMs.De(RV0II;:%14p74WkslI4cXQBk/>?%13OOATAo94ZX]>+Co1s+>=632'>%),9S]`E+rft
+E\eL:-pQUBl7EsF_#')+D>=pA7]cj$4R>REZd.\De'tP3[]#\F*)/8A2#-JATMs.De(RV0II;:
ATAo94ZX]rBk/?8+>=631E\h',9S]`E+rft+E\,#%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;
67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No00F\?u$=mjlE)gdi@rGmh0JG4V67s`u
Ble5nDJ<U!A7[GK0d(Qi/KeS<F)Yr(Gp%$;+>P'KH$!U?F`(o'De*E3%15is/e&._67sBHF)uJ@
ATJu&+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(ON+CTG%Bl%3eCh4%_:-pQU+<VdL
+<VdL-u*[2FCfN8ATB4BG%G]'F!+n7@;0Od@VfTb$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JGFtAR[>N%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'0K3NR@kf_]/KcH`ATMs4
@<6K=+ED%4CgggbF!)lPD/XQ=E-67O%15is/g)o'0emNRGqq&r/KcH_BQ&*6@<6K=+ED%4Cgggb
F!)lQATMs4@<6K=%13OO%15is/h0:f;GU1R4s27aBle5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60
@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UHe:dn,O:IITB
6W?WQ:-hcL78mQ-C2[Wi4ZX^6/g+\=A0<Q8$4R=b+ED%5F_Pl-+=CoBA9;C(FCfJ?%13OO+<Yf;
4ZX^.3ZoelBPDN1BlbD>DJ<U!A7[+t$6UH6%144#-Zs<@@rGmh-Qk!%+Cno&@<?d6AKZ,++<XEG
/g+\5FCB9:E+L/+DBO"B@;]UaEb$:b+E2@>Anc'm%13OO+<WB]>9G^EDe't<-OgCl$6UHT0RI_K
+=D8BF*)/8A2#AR+AP6U+A,Et+EV19F<G+.@ruF'DIIR2+:SYe$6UHT0RIb]F<DrRA1&KB+<VdL
+AP6U+EMXCEb-A-DBO%4F*&O8Bk)7!Df0!(Gmt)i$6UI&Eaa$#+=D;B-QjNS+<VdL+<Vd9$4R=b
+?hK+B4Z0--ZrrI%13OO+<W%SDJ<U!A7[,2/NP"b@<>q"H#R=;F^uU;:-pQUD09oA+DkP/@qZ;Y
%144#.!7Qn-Zj$9F!,1<+E_R9@rGmh-Rg/i3ZrQU+AP6U+Dl7BF<GF/FCStn$4R=b+AP6U+=M;E
Dg-//F)rcQA7]@eDIm?$Bl5%AC2[X)ATMs)E[`+?$6UHG+Bot0BQ&*6@<6K4A8-+(+=D;B-QjNS
+AP6U+Dl7BF<G+.F)Yr(Gp%<FFD,T8F<G.8Ec5t-$4R=b+D#S)DfB9*+>=63%15is/h0=^=?Shj
@rHC.ARfgnA0>T(+DbJ.ATAo:ATDj+Df0V=De:+a+:SYe$4R>QDe!m#F*(/D/h1CM@ru:'F<GZW
/Kf.HF*&OGFEM%8AoD]4-tI7+.3N_DF*),6B.aNd67rU?67sB[BPDN1BlbD*+<Y`DCh\!"Ed8dL
ATMr9GA2/4+CQB8A8bt#D.RU,+D>=pA7]d(FD,*)+EqO9C`m1u$;No?+E_a:+EVNEFCfN8+CoD#
/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU+<VdL/hSb/+E_R6DfT]'FCeu*FCf]=$;No?$;No?
+CfG'@<?'k3Zp18+B)ij+>PW)3$9q03\rTR1G]@F:-pQ_78d#Z;E[2d.!KTMA18X5@;0P!+E)-?
/hSb/$;No?+>Pes;e9nj1,(CA+>GQ21Gh-K1C=Ia67s`W8Q\,>+Cf>1Eb/a&ARlo9/hSa`$?L'&
F`_SFF<DrADe!m#F*&NV+DGm>@3B*'D/FP@FCfN8+EV:*F<G+4ATJu8G@b?-+D)oHCER&%CaTR&
Ec=HaE--@Z0JQ<h/h1LSE(+V_FEoPo0d(Qi/KePDART[l+D#D/FEo!AEc6)>F"Rn/%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%15is/g+SDF*2>2F!+@L5t"dP8Q8,$E-67FA8,OqBl@lt
Ed8dGE+Nnr$4R>;67sBjEb/[$AKYQ$E--@JB6%p5E"*.cEZf"8E$.7jB6%p5E,Kf7CbR4G$4R>;
67sBjEb/[$AKYQ$E--@JB6%p5E$-_TFD,B0+D,P4D'3b,@s)g5+CoV8Bl7Q+A9Da.+ED%7FDl22
F!,C5+D#D/FEo!AEc6)>Et&IfEZf"8E$-N@Ec6)>DKTc30df%1-OgCl$;No?+Dl7;FD5]1AKYl5
Ci"/8FDku,Eaa'$A.8lWEZf"8E$-N@Ec6)>DKTc31+,.2-T`\'/7CRj4D?E%%13OO:-pQU<(0_b
+B)9-6UapP7TE+k$>aWhA9;C(F>,C'A8,OqBl@ltEd:DH/h1[U@:XIkF*')i0k>!.FD5Z2@<-W9
F=f'eCi<`m+>J*`FCfN8+Co1rFD5Z2@<-WG%15is/g(T1:-pQU:iC;qCghEsF!,R<AKYo3A7]d(
0mFg_ATMr9A8,OqBl@ltEd98H$;No?%15is/g,=KEaiI!Bl,m?$;No?+:SZQ67sB[BOr<.ATMr9
A8,OqBl@ltEd8d?ASu("@<?4%DBO"1EbTK7F#ja;:-pQB$;No?+<VdL@rc-hFCfQ*F*(r,@ruF'
DIIR"ATJ:f:-pQU+<VeCDdd0uATMrI0JR*P@ruF'DIIR2%15is/g)8Z+Dbt)A9;C(F>,F'A8,Oq
Bl@ltEd8*$:-pQU+<VeCDdd0uATMrJ0JI$O@ruF'DIIR2%15is/e&._67sBtF`VXI@V$[&F`&=9
DBNk<A7]d6+<XWsAKYl!D.Rc2@<,p%@rH7+FE2M6FCeu*F)N1CBOQ!*A7]@]F_l./$;No?+A*bb
CiF&r@V'Xq@j#i2Ecc#5B-;/9FE8RHBOu$'Bl5&'DfTl0@rri3Eb&a%%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90JP;!@<jU^+>"]aBkhQs.3N>BFCfK)@:Njk
Ci<flCh4_tA7T7^+EVNE@UX=h+C\c$BHR`k:-pQU+<VdL+<VdL+<W6Y-u*[2FCfN8ATB4BEb065
Bl[c4ARl5W%17,eEHPu9AKW@8De*s$F*(u6-OgDmDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>
Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDm
DeX*1ATDl8-Y[=6A1%fn%15is/g*b^6m-PhF`Lu'+EqaEA9/kF+Dk\1B4Z-,E+*j%+Co1rFD5Z2
@<-'nEt&I?0RIYFCLnV\De)dbF`Lu':gnHZ7!3?c4ZX^!Df^#AAT/b?C2dU'BHS[O8l%iS78m/5
.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.F*&O8Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22
A0><%+CQB%$;No?+CoV3E$043EbTK7+DG^9FD,5.C2[W*A7]pqCi=90ASuT4A8,OqBl@ltEbT*+
%14J'@j#i'@<<k[3Zp7%B4Z0--WFYuF@9hQFD5Z2@<-W]F_u(F%14M1/g<"mF(A^$.6T^7HTE?*
+EM(%F:AQd$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$>"6#De't<FCfN8C2[W;-OgCl
$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9Iin
F!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!
FCfN8+CoV3E$043EbTK7+:SZ+-nlf*0eb:1+?DP+0KLX*<+U,m6tp.QBl@ltEd:&qD/]pk@rGk"
EcP`/F<G[BE,9H&?U6tDFE1f2BK8(5?O[>O$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?
A7]1[+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0@r#Tt-Zip@FD>`)0ddD;%15is/g+YEART[l+CT)&
+D5_5F`;CEAo_g,+<k61Cj0f<A9/q;@rH4$@3B)lCh[a.ARlo5/o#$D+D,>(AISuA67sB8+Bot4
4Y@jr@<-F#@rlf9."+-!Eb/Zi+B1d.<&$m@:K:4\8PDQ%+>#2g-R'oI$;No?+?L]m/g<"mB6%r<
4s279+tt-]Des?9ATB+M4s5;,B.4rS-8%J)."43"B0@ko/g<"mG:=Xs4"`61-p1p!4#&12G7=lg
$;No?+Dbt)A0>;u+CT;#BPDX$A0=K1;BTL]Fs(=<D/^V=@rc:&F<E.XFD,B0+DG_7F`M&7+EqB>
BOQ'q+CQC*Df9.q$;No?+Dkh;FEMV8+E(j7@UWdi@;]TuG@bT,+CoD#F_t]-FCeu*GAhM4F!*%W
@;]Tu@;L"'+EM+9F!,=.DKuZu:-pQUDffZ(EZf:0C1UmsF!,17+EV:.+EV19F<G+.@ruF'DIIR2
+>"^JF`MS;ATAo8ATMs7+EV:.+Du+8/ST*EEclG;G%D*i:-pQUDIIX0Eb-A3Afs]3;BU!kF*)>@
ATJtG+E2.>F!,L7@;Kb*+E27ADIdf2Df-[i5uJhEEbTB)FD5o0Et&IO67sB/-nlf*0I\,*3Zp+;
.3L`F5uLZN;cH.b9i+;N9LTBt%15is/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@FD..=-+EM77B5D-%
Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfREEb'56GA2/4Dfp.EA7]glEbTK7Bl@m1+:SZV4ZX]tF(K59
4s2O%0d&7pDJs*2E$-MU%16#s3Zq?D,CUa`4>83,IQATu/g<"m;[j(FEZd%Y3$<0_F<DuY/g<"m
;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$;^ii9/g`27+F?-n0d'C($4R>;67sBtATDEp+DG^98l%ht
F)Q2A@q?)V-n$bm3\W!*3]\B;3[l168oJ6=Dfp)1APcfWBLHu[E"*.aDe!p1Eb0-1+EVI>Ci<fj
5s[eYEaa$&3B9*,%13OO:-pQUB4YslEaa'$+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(
+D#S6DfTnA@<3Q.@;^?5GAhM4Et&IO67sBhEb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)
ATJu&Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD&$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q%13OO:-pQU
E+*6lA0>;uA0>_tCLnUt$>"6#E+*6lA0<7AATMs.De(RM%16Ze+DkP&AKW?J%13OO:-pQUF(fK9
+Cf>4DKKq/$>"6#A8,QsINU<R$4R>REb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&DIn$&9jqp@Bl5UY0ht%f.W/gAA5-KM=(uP+0JO\l/M/)_
ATqZ-D..=)@;I&fBl7I"GB4m<G[YH.Ch4_tDII@"B6@d,/e&._67r]S:-pQU<+U,mF!+OuDId[0
F!,CABk;1(ARlolDII@"B6@d,+E(j7AU%X#E,9*,+D,P7DIal(DBMPI6m-#Y@s)X"DKK</Bl@lA
%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emQaFtkrc
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTgDg!ip+CfG'@<?''G%#E*Dfp+DGA1r*Dg*=7Bk)7!Df0!(Bk;?.%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO:-pQUBkAK*D]ik7@psInDf-\3F!,OCARfFd
Bk:ftFD,5.A8,OqBl@ltEd8c:$;No?+DGm>@rc-hFCeu*Bl5&8BOr;sAS,@nCige1Bl[cpFDl2F
%16uaG@VgDD..3kD0]Z+@ruF'DIIR2-OgCl$;No?+CfG'@<?''GA2/4+DtV)AKY])+Dbt+@<?4%
D@HqjATqZ--Z3L>-T`\c3\P5dA867)CG.%E$4R>;67sB6>TduoFD)e-ASc'tBlmp,F!+n$@qBV$
ARl5WDIn$&+=D#OA8,O$4""N!>\\1fC3=E0ATD$sFEq\6>]=+nBI=o3$4R>;67sBjEb/[$AKYo/
+EqO;A8c[5+B;0(+Dtb4GAhM;+EM4)Eb,[e:-pQUF`(]-D/Ej%F<G"0A0>GoBlkJ0DfQtGDfp(C
DImp6DfTV9ASu[*Ec5i4ASuT!$;No?+Dtb7A0<7<F`__=ATD?04""9<D.R3eDIIT?0O/aAATDis
C1Ld^CLqNkC2[WtF`(u4ATT:B%13OO:-pQUCh[d0GT^O2@ruF'DIIR2+E1b2BFP;D67sBuATqZ-
-Z!L7A8,O$4!u[pDf'&=Df.4MBOri;@;]^h-OgCl$;No?+E)4@Bl@ltC`mh5Bl[`,Blmp'+DGm>
A8,OqBl@ltEd8d<De!p,ASuTuFD5Z2%16uaG@VgDDIn$'E[Npr@lc8XDe*U*DJNg)F>#"'-U_ZY
FD5Z2@<-W9A8bt#D.RU,@<?4%DBLPa/gh)8%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3
E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLWNDffo:AStIYF*)IW0JQ<h/h1aWFDl,0DH(1g
FE9,i0d(Qi/KeP>Df]K#+Co1rFD5Z2@<-W9FCfN8F"Rn/:-pQB$;No?+A,Et+Cf>,D/E^!A9/l7
BQ&$0A0>o(E,Tc=+CQC1D]iS)@ruF'DIIR"ATJu4E+No0ATDg0E\7e.:-pQU<+oi`AKYE%AKZ&4
D.OhY<)P)b+=K['@qBV$Bl@l3<,WmWF_kV<+EVNEFD,B0+D5h2A7]RkDIj7a:-pQU@;]TuFD,62
+CT;%+Co&$DffQ$+DG^9FD,5.AoDL%Dg,o5B-;8*EbTK7/e&._67r]S:-pQU5uU]^9gquA+=LuC
A9;C(FCfJA+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hf3B9*;DfuQs:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@rH7.ATDm(A0>u4+A,Et05<*t0JX(E:-pQU
0emQaFtks!F`:l"FCeu*FDi9o:IH<c/i517.kbWr%13OOFCfN8ASu[*Ec5i4ASuT4-XpLp-T`\J
:IHQ>$4R>REZen(C`k*CD^Pu$ATAnJ+Co&"+=C]2Ch7^&Df0VD%16Ze+>b3OAS`JN3[\?VAKYr1
F)u&)Ch4t'$4R>REZen,A0<Q8$>"6#0Han?A0<Q8$4R>REZen,F)W6LDJs!&A9hj,D.P(($>"6#
1*AS"A8-+(+=D&FFDl,0DC5l#%16Ze+CoD#+=D&FFDl,0DC5l#ATAnK+?:QTDdsn;DJs#nDIdZ5
%13OOATAo(E-#T4+=ANG$>"6#A8lU$F<Dr-<E)FR6W?iZ-Ta(;0F\?u$>"6#ARlo2@ps7sARoLs
-OgDoEZd+[3?VmD+=CfBDfp#0De!p,ASuT;%13OOATAo(DJUFC-OgDoEZen1C`k*C@:Wdo%16Ze
+>G!LDJUFC-OgCl$>"6#B4Z0-4$"a7Dfm14@;^00B4Z0-F`So>$>"6#0d(+?F<EY+-Za3HEd8dF
D]iOuDBNJ.-OgDoEZd%Y0f:(dATT%V3[]2kFWbX7EcYr9F<G:8+F.mJEZeq6Ec5tG%13OOATAo1
@;BEs-RU#Z+:SZhEZd%YD..3k+=D8EATD?)@<,p%DJpY.Bk)7!Df0!(Bk;?.DfB9*+D#5"-OgDo
EZd+[1*CFBCLnV9DII'a-OgCl$;No?+@T7-+E(_4BlA-8Cj@-ODIn$&.3NJMF*&O6AKYDjCh4`2
D]iY7DI[d&Df-\ABOu&j$;No?+Co1rFD5Z2@<-'nF!+n3AKYK!Df]K#+E)9CG@_n@Bl%T.DIn!&
EZeh&+CS_qAISuA67sC&D]iP1ART[l+Dtb7+Co1rFD5Z2@<-'nF!,R<AKZ&&D.OhuE,]W-ATJu+
DfQsKEb/lo.1HUn$;No?+CfG'@<?''@3BH!G9D$GBlS9,Cj@.@@;TRd+Co1rFD5Z2@<-W&$>sEq
+AP@,6qKa/3Zr<OG@Vg?3b2r8DKTf'@;9^k?RI31$4R>;67sC'DK9<$BleB-EZee.A0>o(Eb/lt
F*(u6+Dtb7+Co1rFD5Z2@<-W&$>sEq+>Y-\AS5Nr4u.I[79;lK6OaB?ATAo6AS5Nr14:cM79;lK
6OaA3$>"6#E+*6lA0<7;@:Wdo%16Ze+ED%7FCZLADII'a-OgCl$>"6#E-67F-Zip@FCf?5Bl\-0
D.RU,-QjNS%16Ze+>G!XF`\`R@ps7s-T`\sFDl22+EMXIAnE00Bln$,F`\aEE+Np$DJ()&Bk)7!
Df0!(Bk;?5%16Ze+>b3[F`\`RH#IgQ4""_bEb/ZqCj@.?ARTI!Blk^3$4R>REZfC6G&JKN-OgDo
EZd+[Eb0E4+=ANG$4R>REZfC>+=CZ-DKKoADC5l#ATAo6FEAWQF)Q)>Gpa%.%15is/g*S^;BSq_
D]iOuF(KD8De:+?B5DKqF"&5A@;[3"F`(]2Bl@l3GA2/4Dfp.2$;No?+CT.1DfB9*+Co1rFD5Z2
@<-W9@<3Q5BOuH3@W-@%+CT.rCjC><+DG^9D.RR&Ed8dODfTB0%16uaEZf"2Ddmc1-Zip@FCf?5
Bl\-0D.RU,-QjNS+<Ve%67sBsBleA=B5DKq@;Kuo$>sEq+>GSnB5DKqF!)iPATMs)DK]`7Df0E'
DKI6K+<XEG/g+bKCht58FCB9*@j#YtD.Oi"CghC+BkD'h@<?4%D@Hp^$>"6#F`V,8+=D&FFDl,0
DC5l#ATAnL0d(U[ATJtADJsW8E+No7%13OO%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3
E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLWRASbpdF(K*)A55HD.WT*:ARTXkC2[W*F"Jsd
Anc-kC`me/EbTK7+CT5.Ch[Hk+DG^9@WcC$A8,po+DPh*+ED%0ARTXk+F7a@/e&._67sAi$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`%^67sB90JP:oAR[AN+>"^GDeX*1ATDl8-Y[=6A1&L3DfQt<ATo85De!3lAISuA
67sB90JP;!@<jUc+>"]a8OccQ:+7;sG[kQ4A7]9oAo_g,+EMI<AKWC6A7]_$.3N_DF*)I4$4R>_
AT;j,Eb-@@IUQbtDf0W$@<,j_H>.>'H=gl-ATKJ<C3(a3$=e!aCghC++EVI>Ci<fj5s[eYEaa$&
3B9*,4ZXrV5s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+ED%0ARTXk+Co1rFD5Z2@<-'nEt&IdF`MLc3ZqsIA0<Q8$9g.j1E^UH+=ANG$9g.j
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8
Bl@l3FE1f"CM@[!+Du+?DK?6o4tq>*D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>WDe+$&
EcYr5DEU$'/3Yb78l%iU9gfEt%15is/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@+DG^9E-67FA8,Oq
Bl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6psUF<)Q:S<E)Oc:0L4c4ZX]5C2[Wi-S-Yn/mftK
@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%8l%iC8Q/Sd8O?EV8P`)b8PhQ2+=JEd-UCEt-S.>q
De!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V;Fs2T<(Tk\
>"MO"$;No?+A,Et9ggj%3[\Z\A1h_02(&h?%15is/g+Y;ARfKuFD,*)+CT)&+D5_5F`8I6AT23u
A7]Y#F!+n3AKY])+CT>4De!KiFCeu*B6%p5E,uHq:-pQUFD,B0+DGm>DJsV>DIm<hF)tc1Gp$R=
F<G72B4u+,+ED%'Df'?&DId<h+D,P4+D5_5F`;C2$;No?+EV:*F<G"4AKZ,:ARlp*D]iY1Ebuq/
CghC+ATJ:f-t,.Z/M;JpB4PRmF!)iFDe(4E+D!/JB6%r6-YdR1-OgD2@6,M_/q+pUA7]_$+=CoB
A92j2Eb-UI+D!/JB6%r6-YdR1F*)>@AL@oo-n&Lb/3G:O7TW/V-Rg/i/q+pUA7]_$+=CoBA9E!.
CaUYSAM,*<Ec<-KC2[X*FD5P=%14Ll3Zp",INW96AT2]5-YdR1D..3k-Rg0L/g+eIE$-NCDe*]n
CLnk&$7K=D+>#3p+D54rE-!-LC2[WnDdk(C+D!/JB6%r6-YdR1A8bp)%14Ll3Zp",INW96AT2]5
-YdR1Df-pO+D!/JB6%r6-YdR1Df-p3$7K=D+>#3p+D54rE-!-LC2[X)Df9H5-Rg0L/g+eIE$-NC
De*s.DesJB%13OO:-pQUF`:l"FCcS0De(J;A2PK>BOt[hF*2=BAnc'm+>"^WATVu97S-9B;[j(/
67sBU:K0bD+>>`lDg!ll+>"^XBOr;Y5tiDBF^fN*EcYr5DBND2Bl%=$+Eqj;@;Bp,@q]F`CNFW8
Et&IO67sBiF`\aEA7TM%+CoD%F!,@=F<GX<Dg*=7BkCsgEb0,uATJu'ATW--ASrW&Bl%@%+>"^T
ATDHmE,uHq:-pQUF*1r8ATDj+Df-[AA8,XfATD@"@qB^*+CoC5DJsV>Bl7EsF_#&+@qB\&@;0U%
@q]:gB4Z,n$;No?+>>oM:IIoF2'?aH2/Qc>BkCptF<F1O6psUF<)Q:S<E)Oc:0L4c%13OO:-pQU
An?'oBHTo59H\1\DJ<]oF*%iuF)4!#+?MV,-Z*:0BkCptFD>`)-OgE'@j"tu-ZW]>C2[X(@r`q[
3Zp7%B4Z0-F)29m.!mQj0d(4LA927$.6T^7HTE?*+DPh*F(95"$4R>;67sC$F`&<o5tiD<@;]dk
ATMr9/Kf+GFE8Qo8PDQO%14L30HiJ30eb%!3]\B;3[l1g@;]dkATMs.De':a%15is/g,">DJ<]o
F*&O:Bl%@%+>"^PATMo8D.GLH@q]F`CNFW8Et&IG8PDQO4ZX]:+CR;R/M;Jp4?G0&0d'.Z/4N3)
78k<\/g*MZ%15Qr9LVlC3Zpm`9LVl&/M8/.-YdR1/o>,V-OgCl$;No?+CoC5@;Ka&Anc'mF!,%=
BleA=Bl5&>BlFLg7S-9B;a!/aIP)a48PDQO+<XEG/g)]-8l%iL6o>D\H=_>8F*&T\+@\pr78k<[
/g*8K:IITB;cHXd6<-uV:JP(b:^ma@$;No?+EM47G9Cp;D..-rBl7Q+Anc'mEt&IP<(KGU4ZX]6
0Hb]d0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=/g*VT9LVkh$8EZ-+EM47GApu3F!+7X84?E!
,CUa_0.230HTEK;+AYs-78b7'67sBlG[kQ4A7ZloBl[cpFDl26ATJ:f%15is/g,1GDfB9*%159Q
HSZd_A0<6I%159QHZ*F;I4f#PEcMTr%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%17/fFEMP0C2[X%Ec5](@rtI4/h1pRFEMP0C2[X%Ec5](@rri8/M/)dATW'6
+D,P4+A*bqEc5](@rri1@;]LdATAo9F(Hs5$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JGG'Dg!iq%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'0K<fiCb[Ud/Kchl?SN[?@;BEs
-YdR1E,'63ATMr@+AP6U+CT/5GA(Q.AKYo/+E1b2BFP;D67sB90JGJ)@rsC`+>"^JDfT?!+E1b2
BQG;<D]ik7G@be;@psFi+C\noDfTD3D..NrBPD?s%15is/g)o'0em9O@PKhb/KePABl8!'Ec`EO
BkhQs-Qli.A7]9o/Kf"@FD,_<F*(i.A79LmH=^Ur$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo
3F=p1-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>+0RI_VD`p-(A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3C2[WnATf22De'u5FD5Q4-OgCl
$=e!aF`MM6DKI!K@UX=h-OgDX67sC"Ec5](@rri4@<?0*D09oA+DkP/@q[!"De*BiFs(%2@rc:&
F:AR*C2dU'BQIa(+EVO<Dg,c5+DPk(FD)dEIS*C(:f:(]771$-F(96)E-*`\.3L3'+DPk(FD,`,
E$07@Ci=N/EZcPY-W<B1?RIBQ4*s#8/jrN%<(LA';cI+28l%in@VR>C-XS51$=e!aF`MM6DKI"C
D/a<0@p_Mf6$.-UF(dQo3F<4&%159QHZX+DCi<f+B4Z0-4$"a1BQ&*6@<6K4GB.D>AL@oo%17,c
+Bos9Eap5/FEhmT4Y@j6+D58-+=CoBA8lR-C1UmsBkhT7%13OO0K^b*Db*Z&<$48L3\5,iG]YAW
GB.D>AKY`,@<?0*-[nZ`6r6cW8ju*H06:WDBlJ/IC2[X%Ec5](@rs>;C2bO0$4R>;67sBnASu("
@<?''E,oM4@;]TuE,Tf>+E2@>@qB_&DfQtA@rc:&FE7lu4tq>#Ci^^HC2[X%Eb03/EbZs2$9g.j
D/=89-YdR1E,Tf>E,o\@%13OO:-pQUBl8!7Eb-A.De'u4ATMr9F`_>6Bln'#F!+n3AKZ#)@:XWm
$9g.jD/=89-YdR1FCfN8ATB.-$4R>;67sBt@;BEs@UX=l@j#l)F*&OG@rc:&F:AR@0RGSu?SN[?
@;BEs-YdR1E,'63ATMr@%13OO4tq>%A0?:QDf9P:>9G^EDe't<-OgCl$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$4R=O$4R>aATMs7FEM%f67sa7IT1cE+ET1e
+EV19F<GXHF^cs4$;No?%15is/g+,,BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=%15is/e&._
67sC(ATD6gFD5SQ%15is/g(T1:-pQU+<VdL/hSb/+E_R6DfT]'FCeu*FCf]=%15is/g)8G$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zrcu@rc-hFCf!3I16NY67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB90JP:oAR[AN+>"^GDeX*1ATDl8-Y[=6A1&L.A7T7^+D,P4+Dtb7+DPh*+DG_8ATDBk@q?d!
De!3lAIStU$;No?.Rd65:Js>>+=MGPEb$UAAmoCiF!,C=+>,9!/e&._67sC-IV!P?DfTr6D.S0E
%13OO:-pQ_7S-]F4s4?REcP`$FCeu*/hSb/%175sA79RkC2[WnBleB:Bju4,Bl@la67sa1E+EC!
ASQ-oA8-+,EbT!*FD5Z2+EK+d+E_X6@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df-\DBlG[6
$;No?+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq4.FDkW"EZd+k
0Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)3,N)L1,pC.+ED%1Dg#]&+DG_7FCB!%+C\c$F!+n/
A0>r'EbTK7F!*%WF(oK1Ch[KqATJtd5tiD<@;0V$AStpo@q?)V:-pQU1,(CAF(K;G1a"@m@:Wn[
A0>Q"F*)>@GqO2`F<G[D+Co2-FE2))F`_2*+D,>(ATJ:f:-pQU1,(F;An>F+1a"@m@rH(!F(KB6
+=Cl<De(4<@:Wn[A1VJ6A1hh3Afu,*D/XT/A0>K)Df$VCBlFLg:-pQU+<VdL+<VdL+<W6YB5_^$
Ch580De*EuCh7i6A8-'q@ruX0Gp%6KA79Rk+ED%1Dg#]&%15is/g)o'0em9O@PKea/KeeHA8l'k
/p)>[+Co2,ARfh#Ed8dHCgggbBQ%]tATAo%A7T7^%15is/g)o'0emNRGqh9$/KeeHA7TUg05P??
Fa.eBFCfMGFEhmM@:Wn[A.8kT$?B]tF_Pl-+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgDm
De!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5
@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0&u@<6!&A8,OqBl@ltEbT*+%16TfEcO<(
+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,
Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjb
B6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3
Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T
<(Tk\>"MOR3ZoebDe*3&/1;ku?RHt+BOPq&F^cJ.De+$&EcYr5DCI+a/p_5N-OgDT:IITB;cHXd
6<-uV:JP(b:d$i^F(fK9E+*g/+=JEd-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\
5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V;Fs2T<(Tk\>"MO"$4R>;67sC%@rc:&FE8uUCggdo+CT.u
+C\c$Et&ItCcsg%-YR48FDl2FC2[W*Bl8!6@;KapDe'u2ATMF)C2[W*C2[X%@<-4++DPh*E,ol/
Bl%?'D..<rAn?%*C2[W*CggdaG[YH.Ch5:S0d(4LA8,q'Ec3(8De*C$D/^j3$?L#H3ZrK[/12Q6
@:DWID/^V4De*<gF*&O=DKBo.Ci!j)A7Ath+ED%7ATV[*A7Ath+DPh*E,o]1+DPh*Bl7HmG[F!@
9hZ[EDe+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[/12QTDe*ftAm\M><$6!kDKU2ADffQ3?W:-,
-OgCl$?BW!>9G;6@j#N)A927$-TsL51a$FBF<GX@%13OO:-pQUF(KG9F(96)E--.1$7L6R+u(3T
De*p!E[a.4+F?-n0d(4LA927$%13OO:-pQUEcl7B8jQ,nD..<rAn?%*%14L30HiJ30eb%!3]\B;
3[l1g@;]dkATMs.De':a%15is/g,">DJ<]oF*&O:Bl%@%+>"^PATMo8D.GLH@q]F`CNFW8Et&IG
8PDQO4ZX]:+CR;R/M;Jp4?G0&0d'.Z/4N3)78k<\/g*MZ%15Qr9LVlC3Zpm`9LVl&/M8/.-YdR1
/o>,V-OgCl$;No?+E_X6@<?''Anc'mEt&IO67sB74DA\SFCB!%C2[Wl@<<W<Eb03+@:Njk-YdR1
@UX%*Bl8!6@;KapDe(J0@<<kY8l%iC8Q/Sd8O?EV8P`)b8Pfj':-pQU0KaAeF(KH.De*<cF<D\K
H?*S9Cgggb+=CoBA7At_061WFATV[*A1h>"F=0.B:IITB;cHXd6<-uV:JP(b:^mb,67sB74DA\S
FCB!%C2[W*+<VeQEb03+@:Njk-Y[I>FCB!%C2[W8Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?
+>>olDKBo.Ci!j)A0<!;+F8'>E,8rmAKW@8De*<cCG0C>F*(i,Chdm!@UX%)Bkh]:4%`::6qL<V
;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)C2[W*+<VdL+F8'>E,8rmAKW@@ATMF)C2[W8Bkh]:4%`::
6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)C2[W*+<VdL+F8'>E,8rmAKW@8De*<cCG0^>F(KH.
De*<cCG'=9F!j%A:IITB;cHXd6<-uV:JP(b:^mac4DJeFE+*d(F!)SJ+<VeQEb03+@:Njk-YdR1
E+*d(F"V0AF!j%A:IITB;cHXd6<-uV:JP(b:^mac4DJeFE,ol/Bl%?'+<VeQEb03+@:Njk-YdR1
E,ol/Bl%?5Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SUBleB7Ed;D<A0<!;+F8'>E,8rmAKW@6
BleB7Ed99ZG]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8lR-Anc'm+<VdLH?*S9Cgggb+=CoB
A7At_05>E9E,ol/Bl%?i@;@K0C3(aa8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8kstD0$gB+<VdL
H?*S9Cgggb+=CoBA7At_05>E9E+*d(F(/Qn/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*
F(KB%Df00$B4>:b+<YuNAT2Ho@q?c1C2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh]:4%`::6qL<V
;Fs2T<(Tk\>"MO"$8=SZ@;]dkATMs.De't5+F8'>E,8rmAKW@;@;]dkATMrGBkh]:4%`::6qL<V
;Fs2T<(Tk\>"MO"$8=SY@:Eem@;Tt"AM>em+F8'>E,8rmAKW@8De*Zm@WO2=@:Eem@;Tt"AM>em
/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dO9OVBuF_u(?+<VdL+<YuNAT2Ho@q?c1C2[X!@:F:2
Cggd`F_u(MBkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SWDe*R"FE2:B+<VdL+F8'>E,8rmAKW@8
De*Zm@WO2;De*R"FE2:PBkh`;4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SWDe*C$D/^U?+<VdL+F8'>
E,8rmAKW@8De*Zm@WO2;De*C$D/_+AC31gb8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA7B+kF<D\K
+<VdLH?*S9Cgggb+=CoBA8G[`F"_9HA7B+kF=q9BF=0.B:IITB;cHXd6<-uV:JP(b:^mac4DJeF
E,o]1+<VdL+<VeQEb03+@:Njk-YdR1Cggdo05>E9E,o]1/no'B-Tapr6psUF<)Q:S<E)Oc:0L4c
%13OO:-pQUEb/Zi+Cf>,E+s-"A0>W*A1hh3AfrZW+EV:2F!,(/Ch4`'F!,@=F<GXHDfTE"+DG^9
FD,5.A8,OqBl@ltEd8*$:-pQU@Wcc8BlbD+F_PZ6+DG^9FD,5.E-67FA8,OqBl@ltEbT*++CoD#
F_t]-F<G+.Eb/a&DfU+4$;No?+>>o&C2[X%A7dtc+ED%%A0<9E/gj%_6ROEHCi<g)Ap@Zi8l%i^
?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4ci]De(J>A7d1u$;No?+>>omDe*ftAfr3=
+<VdL+F8'>E,8rmAKW@8De*Bs@kVe3An5gi05>E9/oY?5-Tapr6psUF<)Q:S<E)Oc:0L4c%13OO
:-pQUF*)>@AKYZ.D/:>/DId='+>"^SFD,6++E).6Bl7K)Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1
DImo4Ch[d&Et&I14DJeFBl7HmG[F!@9hZ[UEb03+@:Njk-YdR1A8bs2BQS*-A8bs2C2[WsDId='
/nf?DCaV;::IITB;cHXd6<-uV:JP(b:^ma@$;No?+EMXCEb-A.De*ftAhJ1MF<GO=@:NjkBQ%]t
ATAo*DfQt8De(J>A7cr9+CTG%Bl%3eCh4`-DJX$)AISu#4DJeFE+EQf<*3*BH?*S9Cgggb+=CoB
A7TUg05tH6A8bs2C2[X%A7dH9G]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g,4WDfTD3Ch[d0
GT_'HARfFdBk&9'DffQ3%14dOCh[d0G]%GAATM3X=B$DhEb03+@:Njk-YdR1A8bs2Ch[d0G]%GA
ATKJGG]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g+\C+CT)&+DkP)BkCptF<G10Ch7Z1AU%p1
F<G:8+F7a@%17DmG\M5@+u(308PDQO+=o,f4A&C;6qL<V;Fs2T<(Tk\>"MO"$4R>;67sC%BQ&);
@;^?5Anc'mF!,17+F7a@+EV:*F<G"4AKYl/F<GL>+EV:.+DkP)BkCptF:ARQ<(KGU4ZX]60Hb]d
0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=/g*VT9LVkh$8EZ-+EM47GApu3F!+7X84?E!,CUaX
-SHir3dWn74s3X#84?E!:-pQUAU%^$F_#&+A8-'q@ruX0Bk;>p$4R>;67sC'E+EC!AKXT29J8nS
DeElt6Z6LH+EM[7G%G]8Bl@l3A8-'q@ruX0Bk;?./KeJCF*2>2F!,UCH>.=NAU%c/Df-\=BOu!r
+E1b2BFP;D67sB8+Bot0D/XQ=E-67FF(f-$C`k*JDL-#9+>%^Y/T2a`E?HV[8l%iC8Q/Sd8O?EV
8P`)b8Pgrc+>%+H-S.kc6q:$K7nc?=:IIWJ5u^Aa$8EZ-+EMC<F`_SFF<GX<ASc0*-Zs<QBlG1H
FW`8S+>%RU-S.kc6psUF<)Q:S<E)Oc:0L4c/12PlA0<6N8jPj5:JOMX6r60K8.>n8$;No?+ED%3
E+Nnr$9g.j1E^UH+=ANG$9g.jDe'u=/n9$EEX`?b$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]U5@<6*B3B:FU$?^;u@<?'qDe*]nDJ<]oF*(/D/h2!_A79RkC2[X"@;]dkATMr9
F"JsdF*VY5BQA$/BmO?3+Eh=:F(oQ1F!,17+A,Et+DkP)BkCptFE9&D$;No?+:SZQ67sBhF`_;8
E]P=8DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+>PW)2f<PW1,U0`$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW*
0kP!+0f1")+Cf>(DKBB0F<DrFC2[W1+CSekARloqDfQt<ATo83De'u)DKKH1Amo1\+Dbt+@;KKa
$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0&u@<6!&A8,OqBl@ltEbT*+%159Q
HXh2=E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?
+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%159QHZX+DCi<f+
B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQUD..<r
An?%*+EM%5BlJ08%17/m4ZX]I3[\cQDJ<]oF*)/8A0>_tDJ<]oF*)/8A92[3EarZ.%17,c+Bos9
Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1
+u(3TDe*p!EX`?b$;No?+EM+9+DkP)BkCptF<Ga<EcYr5DK?q4Ec5e;A8,OqBl@ltEd8dNATDj+
Df0V*$>OKiF*(i-E'67'BQ&*6@<6K4-SJLh;H$._:-CWc-RUGn+=ANa-Qll0AoD^$F*)FF-WWZ6
;b9b[4ZXr<-Qli0FCfK6FE/L@@;]dkATMs.De(:J-RU8p<^fnb8P`)E3[Z:&/8B*6G%G]8Bl@l?
-RU8h%16r\DJ<]oF*)/8A3DsrFDj]G;cFlSDe*p2@;Ts+@q]:gB4Z.+EZf4-DJ<]oF*)/8A.8kT
$?K]tG%G\W3ZqjICj0Q,FCfQ7Bl+td7Nc/OAoD^$F*)FF-WWZ6;b9b[4ZXr5@:jUmEcZ>C+DkP)
BkCptFD>`)F)Q2A@q?)VC2[X(FCB$*4Z[XtDg-//F)rHO031M>;b9b[4ZXrAF(966ATB=L031M>
;b9b[4ZXr<-S0"NA9MO)F(oQ1/12em-OgE"@;]dkATMs.De*p-F`Lu'4ZX^-Db*Z&<$5poA92j$
D/^V-BOPdkATMs6+DkP)BkCptFD>`)F)Q2A@q?)V%159QHScjaF`\`RD..<rAn?%*C2[W14%`F=
;Fs\a?X[\fA7%E8@;]dkATMs.De':a4tq=?+E2IF+=D#7DJ<]oF*)/8A92[3EarZ.4%`F=;Fs\a
?X[\fA7%E8@;]dkATMs.De*p-F`Lu'%13OO%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;
I4f#PEcMTr%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%175s
A79RkC2[X(Dfp)1ARoq#E-"c@/h2!_A79RkC2[X(Dfp)1ARoq#E-!.C/M/)fE+EC!ATJu+Bl%@%
+DG^98l%htA8-+,EbT!*FD5Z2+EMIDEarZ'H>.=N%15is/g(T1:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATAn9%15is/g+YEART[lA3(i/@ruWuATAnK0JG?n$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW)
2f<PW0fL4,+Cf>/Bk;?.FDi9o5tiDBF^fN*EcYr5DBNJ(Eb/a&DfU+4$;No?+>PW*0kP!+0f1")
+Cf>-Bl8!'Ec`EOBkhQs-Qli.A7]:&+D5V2B5D-%F*;FDEb0*+G%G1n$;No?+<VdL+<VdL+<VdY
+E2.*Bl5%C/no'A+DPh*+EMIDEarZ'A8-'q@ruX0Gp$O+A7]9\$;No?+>PW*0l:?E0fU:-+DPh*
F)Q2A@qB^mFEMOTBkh]3@:Wn[A.8l@67sB90JP;!@<jUd+>"^GDfBtEDe:,,De*p-F`Lu'F(KH9
E%Yj>F!+n%A7]9oFDi:JBlG2,DfQt0@:O(qE"*-`$?B]tF_Pl-+=DVHA7TUrF'N-o@pF=oE*R^$
Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1-UC$aFE1f2BK8(5-QlV9@rGq!
@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBnASu("@<?''@s)g4ASuT4
A8,OqBl@ltEd8d<F_u)=%16TfEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,
C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+
DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:4tq=U
:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(Bk;?.@;KXh
DBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3[\Z\A92[3EarZf-S-Yn/mftK@q]:kF*1q7
C2[X+ATDj+Df.!T-SB^ZE$l)%5tjj=:/F5U83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL
+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:IITB;cHXd6<-uV:JP(b:d$i^F(fK9E+*g/+@/[m
78?ZF<(JQ4:IITB;cHXd6<-uV:JP(b:^mb3<(Tb^6qL<V;Fs2T<(Tk\>"MOR3Zp^^8OZBN5u^B+
-ZsNFCi_4TBlGF/$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%-Z*:0BkCptFD>`)
F)Q2A@q?ctDe*p-F`Lu'F(KH9E$l)%F)4!#+?MV,F)29m%17,c+Bos9Eap5,De*p!E[O"2+>b3R
ATT&9C^g^\$;No?+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`@jDe*p-
F`Lu'F(KH9E'66)FDj]G;cFlSDe*p-F`Lu'F(KH9E"*-`$;No?+E_X6@<?''D..<rAn?%*06:]H
F`8I;DBO+6EcYr5DBNG-DKKo;Ci!Zn+CSekDf-\.Bl[cpFDl2F%14M*Db*Z&<$6$dDJ<]oF*)/8
A92[3EarZ0+Eqj?FCcRe5t"+::.e;M;bpCk6Uag;<(JPfD..<rAn?%*/no'A-OgDtDe*p-F`Lu'
F(KH9E$0@FBlmo/8jPj5:JOMX6rQl];F<lL5u^B+-YdR1F)Q2A@qB^mFEMOTBkh]:%13OO4tq=>
+E(d5-RT?1%159QHZ*F;-YdR1A7]p3%17,c+Bos9Eap5/F(ZV1De*BiFsfF*+DkP&AKW?J%159Q
HSZd_A0<6I%13OO4tq>%A0<77De(4)$?BW!>9G;6@j#W0B-:r-A1'Mm+DkP&AKW?J%159QHSZd_
A0<6I%13OO4tq>%A0<7BFD5Q4-OgE'@j"tu-ZW]>D0'>4F`_>6F!j+'+DkP&AKW?J%159QHSZd_
A0<6I%13OO:-pQUEb/Zi+D,>(ATJ:fC2[WnAThTmF?MZ-Eb/Zi+DPh*A7]on$>OKiA79RC3ZoOf
+ED%%A0>W*A.8lgFD5Q4A79RC3ZoPcART*lF`_>6Et&Hc$;No?+E_X6@<?''Anc'mF!,17+EMID
EarZ'H>.=@Bl5&%Ch[Hu+:SZI8PDQO4ZX]J4"akp+=A:HDe*BiFtRKDF!,49A1hS2F!,UIBl%iC
Bkh]3C2[X(Dfp)1ATMF)F`8sIC3(a3$8=SWDe*BiG%>$'+<YuNAT2Ho@q?c24tq=Q8PDQO.6C-t
6psUF<)Q:S<E)Oc:0L4c%14dOC2[Wn@<<V7+<VeQEb03+@:Njk-pBA47S-9B;^je#:IITB;cHXd
6<-uV:JP(b:^mac4EYa[Cia,qF<D\KH?*S9Cgggb+=KE/HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0Ka)gA92[3Ear[%ATW'6+<YuNAT2Ho@q?c24u7OT8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c
%13OO:-pQUCLq'r+E_d?Ci^_;DJXS@H>.=@Bl5&7H#@+7GA2/4+A,Et%15is/g)i1F`_>6F(A^$
+<VeQEb03+@:Njk-pBD57S-9B;^je.<(Tb^6qL<V;Fs2T<(Tk\>"MO"$4R>;67sBkD]iJ)C`jj4
Bl%@%+D#e3F*&O=DBO7>E"*/#AU%p1F<WF^7S-9B;]mVD+?W7l6psUF<)Q:S<E)Oc:0L4c%13OO
:-pQUF(fK9+ED%1@;0UnDJ()(Bl%@%%15m184?E>3Zoh)+F>:e+F7R4EZdtM6psUF<)Q:S<E)Oc
:0L4c.3L2p+@\pr78jX&0d'[CF(fK9E+*g/+AYs-78b6QINTa\0.230HTEK;+AYs-78b7'67sBl
G[kQ4A7ZloBl[cpFDl26ATJ:f%15is/g+YBE-WRJD]hY<9J8nSDeElt6Z6LH+EM[7G%G]8Bl@l3
A8-'q@ruX0Bk;>p$8EZ-+EM47GApu3F!,O;ASc0*F(fK9E+*g/+=CZ;E-WQM-S.kc6psUF<)Q:S
<E)Oc:0L4c/12Va+t"p65t"+::.e;M;bpCk6Uag;<(JPfC2[X(Dfp)1AM/:CE$?Y=$;No?+>G!C
+EM47GApu3F!,O;ASc0*F(fK9E+*g/+=CZ;E-WQM-S.kc6psUF<)Q:S<E)Oc:0L4c/12Va+t"p6
:II]K:Ie)I6Vg*=;bpCk6Uag;<(JPfC2[X(Dfp)1AM/:CE$?Y=$4R>;67sC$AT)O!D@Hq:0RI_K
+FPkPF`ML3$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[>~>
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
1,Uj11,^72+>G_r1*A;01Gq081,'h++>GW-3A_j51E\Fq1GCg33$9t!1,h'M+>Ghu1*AA40fC.0
0H`+n1c@*30eje++>Pc42'=V0+>P&p0ebU11,C%.+>Pl93$9q0+>P&q3&rc;0f1".+>Pi33?U%5
+>P&p3&!340ea_*+>GQ+1*A;-+>P&p1Gq*G+?1K!+>PZ30d&2)+>P&p1GL"2+>P&q1G^.4+>P&t
3&Vm<+>P&s1,gm00ea_*+>Pr21E\D/+>P&q3B&c;0f1".+>Yf.0d&2*+>P&o0Jtd30fL41+>GW/
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
0JP:)0KD0M3'&fN$;+)^<)6:`;aOJU9LMEC;cHOj=Y_j067sBQ:IH=):JXY_+@:3bCh+Z%BleB7
Ed8dJATMF)3Zq4.FDkW"EZd.m/0H]%0K9LK%13FL:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-
/heCj6?R!YA0=WiD.7's3Zp152]s52@<?'A+>Y_p:LeJh1,(CA+>GW41,V*I2@9cu:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=WiD.7's3Zp153$9>3@<?'A+>Y_p:LeJh1,(CA
+>GW41,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=WiD.7's3Zp15
3?TG4@<?'A+>Y_p:LeJh1,(CA+>GW41,q<L1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-
/heCj6?R!YA0=WiD.7's3Zp160H_K+@<?'A+>GPm:2b:u1,(CA+>GT31,_0M1C=Hr:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=WiD.7's3Zp160d%T,@<?'A+<WE^7V-$O1,(F;
+>Gc80ebXF3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-/heCj6?R!YA0=WiD.7's3Zp16
1*@]-@<?'A+<WNa7V-$O1,(F;+>Gc81GCjD1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E-
/heCj6?R!YA0=WiD.7's3Zp161E[f.@<?'A+<WQb7V-$O1,(F;+>Gf91GV!H1C=Hr:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp."+@KX[ANCql+@]pO+>PW*0d&20
3]&NO1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU2BYJ#@N[E[0eje*2``fR3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+?(E4ARZc;0JP:)0K;*L0fh'K$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp@(7V-$O1,(F;+>>f:1c%0H1("?q
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp:&+@KX[ANCqn+@]pO
+>PW*0d&/03]&iX2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU3$:\%@N[E[0eje*0KLsG3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibO<+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+?1K5ARZc;0JP:)0ek^D1cdEO$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+?1Jd6t(1K3ZpC)7V-$O1,(F;+>GT3
1H.?M3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3ZpF*+@KX[
ANCqn+@]pO+>PW*0d&223\iQR2),FF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+?:Q6ARZc;0JP:)0KD0L1-.3F$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqo+@]pO+>PW*0d&2/3\`NR0K0=G
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>GPm
7V-$O1,(F;+>GW40K;*M2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=Wi
D.7's3Zp.5+<X'\FCdKU0f1"BARZc;0JP:)0KD0M2EETR$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg1a#8!@N[E[0eje)3BB#R3]&i($49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp.6+@]pO
+>PW*0d&2-3\rWS1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!
E]P<t2BX,1@<?'A+>Get7V-$O1,(F;+>Gi:0f(jF3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./heCj6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0fU:FARZc;0JP:)0KD0L1-.*H$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqg3$:\%@N[E[
0eje)3BAoO3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp.:+@]pO+>PW*0d&2-3\iEN0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*!.+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>Gl!7V-$O1,(F;+>GT30JPUG0a\6p:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1a#)'EZd+k0eje+
0KM$J3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,9sp
6t(1K3Zp@(9jr;i1,(F;+>GZ52)@9N0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk
6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0f'qH@<itN0JP:)0ek^G0KLpK$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1E]D#Gp"jr0eje*1HI3F
3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp.5+AH9i+>PW*0d&213\iNQ0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3b
Ch+Y`F_tT!E]P<u2BX,1@<?'A+>G\q9jr;i1,(F;+>G]61Gh-H2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0f1"I@<itN0JP:)0f1pJ1HI<N
$47,867sBZH#n(=D)reSDe*s.DesJ;@rH4$ASuU$A0<!\F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P<u
3$9>3@<?'A+>G\q9jr;i1,(F;+>G]62)%'I0FA-o:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&
DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp.6+AH9i+>PW*0d&2.3\WNS
0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A
+>Gbs9jr;i1,(F;+>>c92)REM3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!Y
A0=WiD.7's3Zp46+<X'\FCdKU0fC.K@<itN0JP:)0KD0K1cdBJ$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqg2BY_&Gp"jr0eje)3BAlQ3]&`%
$49Np/g+)<F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's
3Zp48+<X'\FCdKU0fC.K@<itN0JP:)0KD0M1cdHJ$47,867sBZH#n(=D)re3:IJ/X:J=\04?R+l
D/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>Gbs9jr;i1,(F;+>Gl;
0f1pH2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp4:+<X'\
FCdKU0fC.K@<itN0JP:)0f_9L2**EM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.:+AH9i+>PW*0d&/13\`QS1c5UI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0fU:M@<itN0JP:)0KD0O3'&iP
$47,867sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!
E]P=!+<X'\FCdKU0fU:M@<itN0JP:)0f1pF2**EF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.;+AH9i+>PW*0d&2)3\W9L0JNnA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,'hF@<itN0JP:)
0ek^H1cdKO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>t>b
6t(1K3Zp13+AH9i+>PW*0d&2+3]&iX1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,'hF@<itN0JP:)0etdI3'&fK$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp13+AH9i+>PW*0d&2.3\rZT
1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU
1,'hF@<itN0JP:)0fV3N0KLsE$47,867sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn9jr;i1,(F;+>Gl;0K;*I2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,9tH@<itN
0JP:)0f;!I1HI3K$47,867sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>P\p9jr;i1,(F;+>G`71Gq3J1^XQs:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,9tH@<itN0JP:)0f;!K
2**NR$47,867sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>P\p9jr;i1,(F;+>G`71c@BK2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,9tH@<itN0JP:)0fD'M1HI<P$47,8
67sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t
2BX,1@<?'A+>P\p9jr;i1,(F;+>Gf90JPUC2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/i"Ol6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,9tH@<itN0JP:)0fM-I3'&cS$47,867sBZH#n(=
D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A
+>P\p9jr;i1,(F;+>Gf90K;*N1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!Y
A0=WiD.7's3Zp.;+<X'\FCdKU1,C%I@<itN0JP:)0K;*L3'&lV$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1E]D#Gp"jr0eje*3'&oW3\WH!
$49Np/g+)<F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU1,C%I@<itN0JP:)0fV3O3BArN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1a#M$Gp"jr0eje*0KM'J3\iAr$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp17+AH9i+>PW*
0d&203]/`T1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u
1*@]-@<?'A+>Pes9jr;i1,(F;+>GQ21,CsH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/i"Ol6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,U1K@<itN0JP:)0ebXF1-.0I$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2BY_&Gp"jr0eje+
0fh0J3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,U0s
6t(1K3Zp1:+AH9i+>PW*0d&2*3\rHN1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0
+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Pku9jr;i1,(F;+>GT32)REL3!p!":-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1,g=M@<itN0JP:)0f;!J
3'&iP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Po!+@KX[
ANCqh2]th'Gp"jr0eje*2``cM3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!n
Bl%<&:3CD_ATBgS1-$I"6t(1K3Zp1;+AH9i+>PW*0d&2,3]&QP1,]IH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>Pr"9jr;i1,(F;+>GT31c[TQ
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp45+<X'\FCdKU
1-$IO@<itN0JP:)0etdE2``ZI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp4$8p,"o1,(F;+>GW41,CsF3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp1#+@KX[ANCqj+A-co+>PW*0d&2,3]/TP1,'%B$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1a#D5DBL\g
0eje*1HIBQ3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>b35F`&<W0JP:)0f1pF1cdKQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
1E[f,F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp7%8p,"o1,(F;+>PW31G_'H0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3Zp='+@KX[ANCqm+A-co+>PW*0d&/03\WHQ
2)5LG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU
2]t_8DBL\g0eje)3'&lN3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&
:3CD_ATBgS3$9>3@<?'A+>GSn8p,"o1,(F;+>>K10JtmK0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./i+Um6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg0d')2DBL\g0eje)0KLsD3\W5p$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.3+A-co
+>PW*0d&/(3\rcW0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0f1"FF`&<W0JP:)0K;*L0KLmH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1a!o-F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+A-co+>PW*0d&/03]&NO1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f1"FF`&<W0JP:)
0KD0M3'&iL$;aMs<*sBYA9;a.Ci_?d:-pQ_C2[X)Df9H5+EK+d+DPh*FDl)6F!,F?F*)AADe!@"
F)Q(O%13OO:-pQUEb0?$Bl5&;BPDR"F)YPtAIStp3?^F?0e"5"+:SYe$;No?+DG_7F`M%9@UX=h
+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBjEb/[$AM7b8Bln&tCh\3,+CQBb:IH=IDf9H5+E(_(
ARffk$;+)^FDl)6F'iWrDe*3<3ZqpNDIn#7-Xgb.A9;a.Ci^sH+<VdL+<VdL+<VdL+<VdL:-pQU
DIn#7FDl)6F!,C1C1Ums%14L<+Z_A*1+=>UEb/[$ASQ-oFDl)6F'i9H:IK;CDesJ;8l%isDf9H5
/4r]+DdmH(+AP6U+E1b1F!,O8Ch=euDIak^:IK75$=\-lCh.:!A25l767s`sF_PZ&C2[W*+EK+d
+C]J-Ch.T0@3B0)Ci"A>@rH4$ASuU$A0=K?6m-;a@:UL&ATMr9F(96)E-*]T%15is/e&._67sBI
F_PZ&F!+m6@rH4$ASuU$A0=K?6m-;a@:UL%@rc:&F=n\6F`&=GBln#2-us/R%15is/e&._67sB'
+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL
+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\
A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7
%15is/g(T1:-pQU+<WB]EbupH@WcC$A86$n-QjO,67sC$F`&=:De'u-@:O=r+=JreF*2G@Eb0<5
ATJu.D/a<*@qg$-BeOBR%15is/g(T1:-pQU6Xb.L@<?QO%15is/e&._67sBUD]iV3Ec5t@@q]F`
CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW*0l:?E0f1")+E_X6@<?'k+D,P4+A,Et+E27>F<G[D
+A?KeFa,$);[j'C$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1
+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW
3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUB4Z0-C2[W*
@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eI
E$-N;F_PZ&C2[W1%13OO:-pQUF(KG9G&:b!$7BS,A9MO)F(oQ1+DPh*@WcC$A7KM!-TsLGHS.od
6rm#M%16igA7B[qCh.'bFCdTr+CT)&FE2)4+EV[H@;Ts2-OgDtDe*="Bl%<iDKJ$&+?hi$De*="
Bl%<iDKH<p%15is/g+kG@rc-tASuT4@WcC$A0>;uA0>r%G%DdJ+Dl7BF<G%(+CoD.AKYGnAoD^$
+:SZQ67sC%@rc:&F<G4-DImisFD5Z2+EVNEBl8!7Eb-A,ART+\EZee.A0>Au@<6K48l%iU9gg+@
@<?!m%15^'6rm#M4ZY!+De*="Bl%<iDKIsTDe*="Bl%<j@<?'0+=Jre1+@WD:IJ5X6k'KFD/a<0
@j#`5F<Dr':IJ5X6miEN%15is/g,4HF<GLEFDuAE+D,>(ATJ:f8l%iE8PDQ93ZoebDe*?rD/Ej%
FCeu8Bkh]:%15^'6qgBB6rZTR<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$B4YslEa`ch
C2[Wf-S.kc6q0aA71BT!67sBi@:O(qE$0(2+Co2-FE2))F`_2*+D,>(AKYr.@:NkZ+DG^9E-67F
A8,OqBl@ltEbT*++EM%5BlJ/:A8-'q@ruX0Gmt*Q:IITB;cHXd6<-uR6q0aA76N[SC2dU'BQIa(
+=JEd-W<B1-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+
7S-9B%13OOBOtU_4ZXrc67sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df$jQ9L]HuBOtU_4Z[7f@:Uo3-mqbV/g+2+
EcYr5DE8mf/1>7OA9MO)F(oQ1.4chh+@:3bCh+Y`F_tT!E]P<j/1;]'C2[WlF_PZ&@r?B;/12P_
6t(1K3Zoe$C2[WlF_PZ&A79Rk.4e.^%17/nDfp/@F`\a>ART*Y$4R>;67sC&F`M@BDf-\ABPDR"
+EML1@q?d%Eb0<'Ectl5Bl@l3A9Dp,DJ()%Df'?&DKKH#+A,Et+Dbt)A.8lZ@m)kdART+#-R^tu
3]&Q?+>G5p1*]I^%13OO:-pQUB4Z0-E,oN/Ec5H!F)u8?+EM%5BlJ/'$?J?k+=Js+0H`,"HTF21
1a$FBF<DrGDe*g-AT0"+$4R>;67sBt@;0U%8l%ht@r,RpF(KD%$>2L_+?MV,-YdR1Df-\4De'u*
De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl#.>%13OO:-pQUB4YslEaa'$+D5_5F`;CEGA2/4
+Cf>,D.RU,ARlosART+\EcVZsF$2Q,F!*"V4!5q61*]I^.3L/g/j:C/+=MXj5WU;K+C?lND..3k
.4HT-+D2,j%15is/g+SAE+Not+E27?F<GOCDe!@"F)Q(AF(96)E-*3S+E2@4AncK4BOtU_ATA4e
F$2Q,F!*"V-o*#@7O]H2+=Js+0H`,"HTF211a$FBF<DrGDe*g*F*&c=$?J?k+D>7-/0K!C$4R>;
67sC%@<Q3)Ci<`m+EM%5BlJ08%17/nDfp/@F`\`RDfp/@F`\a<Bl%?'Ci<flFD5Z23[Y@D.!%O4
+EVNm:K(48F"&5UEbTW,+EM47GApu3F!+(N6qgBB6rZTR<(9GQ71BTFD/XQ=E-67FF!,[IBlmo/
F(fK9E+*g/+A,Et6qL<V;Fs2T<(02E8PDP^$4R>;67sC'E+EC!AKYH)Bl%<&BPDO0DfU+G/Kf+V
DfTE"+CT=6E,8rsDBO%4G]Y'F@:O=r%15^'6pamF9LMEC;cHOj=Zneg-o!e;+>PBm3]\B?+D58-
+=BcW6pamF9LMEC;cHOj=XOXc8l%iA<CokP84c`Z:Jt=Y3Zq$j6pamF9LMEC;cHOj=Y(sV,>:QU
/8/U'A.8l&+E2IF+=BcW6pamF9LMEC;cHOj=XQ9d2*4E+6pamF9LMEC;cHOj=Ub]I$;No?@X3',
+EM7CAKYo'+D58'ATD4$ARlp&Cgh$qFCf]=+EM%5BlJ/'$?L'&F`_SFF<DtU3[8\p/12QMDf'?&
DKKH#+EM%5BlJ/:@X3',F!hD(F)>i<FDuAE+=BcW6m,uXD/Ej%FCeu*@WcC$A0>B#D/a<&FCcg/
$4R>;67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=\-lCh.:!A7KOpE,oN2F(Jl;
0ht%f.UmO7Ch.:!A7KOpE,oN2F(Jl)+EK+d+C]J-Ch.T0@3B0)Ci"A>@rH4'Eb0<5ARloU:IH=A
Ddd0!FCfN8+EM%5BlJ/H+:SZQ67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU6?R!YA9/l%+Cf>,
E,oN2F(Jl)8l%htCi<`m+EM%5BlJ/H+B!?"+EqOABHS^DD(,o$:-pQB$;No?+<VeIAT;j,Eb-@@
B4YslEa`c;C2[W1+<VdL+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL
+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22
De'u5FD5Q4-QjNS+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is
/g(T1:-pQU+<WB]EbupH@WcC$A86$n@rH4'Eb0<5ARm/2+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[
E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQU%15is/g*MiG%G*(F#ja;:-pQB$;No?+AQhtATDg0
EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm+CT.u+F7X6Ch7Z1@:Wne
D@HqJ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(CAD..]F3$9dq
Eb0,sD.PA@ASc9p@<?''@rH4'Eb0<5ARlp)@rc:&F<G[D+EDC=F<GL6+DPh*+CSekDf-!k:-pQU
1,(F;An>F*2'=InF`V+:-u*^0FD,`,E%)oOD]j+7Dg*=CDfTr.@VfTuF*)\DAKYT!Ch4`.@<?1(
%15is/g)o'0em9O@PBba/KePABl8!'Ec`EOBkhQs-Qli.A7]9o@:jUmEZf4;G%ki,+A,Et+DG_8
ATDBk@q?d)D]ib/De':a%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0AF!hD(@rGk"
EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9
@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$
Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp
-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBnATT&0De'u"F_PZ&+E_d?Ch\!*ATJu&
DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;
67sC%ATT&<D.F(_-YdR1G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F/kSo-<_Ysk$>OKi@WcC$A7T+j
AN`'s@;Kb%EbTA5FE;P4D/^jM%16igA7B[qCh.$nF?MZ-5!!FsA7B[qCh.$nF:AQd$;No?+DG_'
Eb0*!DKI"1F_PZ&+CT.u+ELt7AKWQID09oA+C\n)A8c?s+C\noDfTD3%15is/g,4FEbTK7+D58'
ATD4$Bl@l3FDi:9DKBr@AKYYt@:Wqi+CT.u+Cf4rF)rHr:IJ5X6m->TFCStn$;+)^<_YtF3[e`]
A7B[qCh.$nF?=5UA7B[qCh.'bFCcmD-nui".=Ffa6rm#M%172oE,9H&+E2IF+=BcW6rm#M-OgCl
$;No?+EM+9+E)CEE-67FAnc'mEt&IK:IIZD9LV**+=CoBA1hS2F!hD(:-pQU8l%iA5ta@%+<W%H
De*<cCG'=9F!hD(%15^'6qgBB6rZTR<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$B4Ysl
Ea`chC2[Wf-S.kc6q0aA71BT!67sBi@:O(qE$0(2+Co2-FE2))F`_2*+D,>(AKYr.@:NkZ+DG^9
E-67FA8,OqBl@ltEbT*++EM%5BlJ/:A8-'q@ruX0Gmt*Q:IITB;cHXd6<-uR6q0aA76N[SC2dU'
BQIa(+=JEd-W<B1-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1
/4r]+7S-9B%13OO:-pQU8l%htF*VhKASiQ(DKBo.Cht5?BlG2/DBNn@F<G+.@ruF'DIIR"ATJu&
Ch[Hu+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV8P`)b8PhQ2+DPk(FD,`,E$-NCDe*3&/1;ku?RHt+
BOPq&F^cJ.De+$&EcYr5DCI+a/p_5N-OgDT:IITB;cHXd6<-uV:JP(b:d$i^C2dU'BQIa(+=JEd
-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V
;Fs2T<(Tk\>"MO"$4R>UART+43[[Zh/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:-S.q\%16c[@:VM^BOtU_/0H>g:-pQU<b6;mBl@lM
+=A]gC2[X+ATDj+Df.!T-QjNuF_PZ&+AR&r@V'R@+=A]g,!'IWA7B[qCh.$nF=Aag+<X'\FCdKU
-S0"NA7B[qCh.'bFCcmP9L]HuF)>i<FDuAE+D>=pA.8kT$;No?+EVaHDBNk0Afu;2Blmo/F)YPt
AKYr4ATMF'G%#K,Df-\.F`M26B-9fB6m-;a@:TfSBOa1dBOtU_/12i++Z_G7.3L;l/5/MB$4R>;
67sBnATT&6Eb031De!@"F)Q(AF(96)E-*3S+DbUtG%De7DJXS@BOtU_ATAo'Df'?&DKKq/$?J?k
+Co&-BPDR"C3*m*BlJ/:-o!e;+>PBm3]\B?+D58-+=CoBA8lR#E$l)%%15is/g,">Bl5%c:IH=8
CghC+ATJ:fB0A9u4$"K3C2[X$DBN\4A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.CaU>7
$4R>;67sBjDes6$@rri+Ec6)>+Co&&ASu$iDKKqB%16WWE-"0'+D54rE-!?Y4s4JI$4R>`D/XQ=
E-67F-Y%(3E,oN2F(oN)+>,9!+=@U*:-pQUA7]suBlmo/B6%p5E$/h*@:WqiF!(o!BK\C!A7]su
Blmp$F(96)E-*EZ4s525+u(3(HTE9)+D58-+D2,j%15is/g+YBD/aN,F)rI4Cht53Df0)sE+Not
ASuT4GAhM4F!,17+D"tkBHUr.Dfp"A-t+6.Ecl80BOu35%16T`A7[nb+=nX`/jMI-Df'H.-9`P#
."*^53bNJP.4-Z2+D3,G/M8A&4s4BIE,uHq%15is/g+YBD.73sAKYYt@:Wqi+CT.u+EqaEA0>Do
Anc-sFD5Z2F!(o!F$2Q,F!*"V4!6'sBHSiY+Cf>#AIStU$;No?+CT5.ASu$$E,Tf>+E2@>@qB_&
DfQtA@rc:&F:ARu4ZX^,/0JJ7GA(]4ASQ9rEbTK7+=Js+0H`,"HTF211a$FBF<DrGDe*g*F*&c=
$4R>;67sC$ASl@/AKYD(An?0/Eb0)rBl7X&B-;5+A9Dd#@;^00@VfIjCNCV,AoqU)+:SZQ67sBh
F)u&.DJ`s&FE8QV+EV:.BlY>8Eb0<'DI[6#@;]t$H#k*FAK_KiF$2Q,BO`/9+=Afb4YABN/h\>1
3\NWW-Qlo4@;]^hDK0b@Et&Hc$;No?+ELt7AKYK$D/aN,F)to'+Dbt)A0>r'EbTK7Et&ItD/XQ=
E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DK@id%14M)4ZX^-Db*Z&<$662+Eqj?FCcS9BQ&*6@<6K4
8l%iK:I.BJ78m/T8PDP^$?L'&F`_SFF<GWIGB.D>AKZ&-Dg-//F)rHr:IITB;cHXd6<-uR6q0aA
71BS5$;No?+E_X6@<?''@rH4'Eb0<5ARloU:IH=9BleB:Bju4,Bl@l3/Kf(FEHPu9ATJu?Anc'm
Et&IO67sBhDIal/CO0]61,U[qG\&"9DBNG-D/E^!A0>r,ASc0*E+*j%%17/!H?*S9Cgggb+EM47
GApu3F!+(N6q0aA76=+;6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF`:l"FCcS(F_PZ&+D>J1FDl2F
+>"^WFDl22A0><%+E2.*Bl5&8AU&;>D.-ppD[d%G:IINL8PDNC8Q/Sa;HZ.D+=Js+0H`,"HTF21
1a$FBF<Dr':IINL8PDNC8Q/Sa;HY@V$;+)^6<-TN6qBmJ<)6Cp4ZX]X:IINL8PDNC8Q/Sa;HYP!
1*]I^.4f.D@:TfS1a$a[F<Dr':IINL8PDNC8Q/Sa;HYA/1,V-c:IINL8PDNC8Q/Sa;HXG9%15is
/n0*JAKZ&.H=\4;Aft_tDImisFCeu*E,8rsDKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chh
F(96)E-*43H$!V=-OgE(D/XQ=E-67F-V@0&+Cf>,E,oN2F(Jl)@WcC$A0>B#D/a<&FCcg/$4R>;
67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K
@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=\-lCh.:!A7TCqFE2))F`_>9DDEqA
67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%;h$4R>P
De!TlF)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?Q_Km+=BH@6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8
-Y[=6A1%fn%17#lD`p-(A8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%13OO
0d(LYF<DrRE+EC!ASQ-oD..<rAn?%*-OgCl$?C21-Xq44Ch.:!A7KOpE,oN2F(Jl0%17,s+=CW@
Bl%<pDe*s.DesK)Df'H6ATMp(A1%fn%14g4EccCG-ZsB=@<?'qDe*BmF*)G:@Wcd,Df-p3$8EZD
FEAWQF`:l"FCf3*A92[3EarZkF_u)=-OgCl$8EZDFEAWQEb0&u@<6!pDe(4)$4R>;67sBkBk)7!
Df0!(Bk;?.DfB9*ARlotDBNt2Ch7$rASQ-o%15is/g,(C+FPk\Df6'l%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*="Bl%<?3B:FU$4R=O$=\-lCh.:!A8,e"1,2Nj/h1=Q
Bl%<pDe*QsF!)TH/M/)SF_PZ&F"_ZTA79RkF!+m6H>.=@Anc'm+Cf>-FCAm$Bl7Q+8l%ht@r,Rp
F(KDF+:SZQ67r]S:-pQU6?R!YA9/l%+Cf>,D.RU,ARloU:IH=ADdd0!F(96)E-*]T;KZk"GA2/4
+=M8I.1HVZ67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju
67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'n
Et&IO67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1
@q0(kF!,R<BlbD<@rc:&F:ARP67sAi$;No?+<Vd]+ED<A-Xq44Ch.:!A8,e"-QjO,67sC$F`&=:
De'u-@:O=r+=JreF*2G@Eb0<5ATJu.D/a<*@qg$-BeOBR%15is/g(T1:-pQU6Xb.L@<?QO%15is
/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_
:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;C3=DJ1(=Rc
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB90JP:sF`&ll+>"^EA7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*
F`V,7@rH6sBkLm`CG'=9Et&Hc$?B]tF_Pl-+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgDm
De!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I
+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41
DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a
+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-
DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$>OKi
G%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQUC2[WsC3*a,?[,q&/p_5N+DG^9E-67FA8,OqBl@lt
Ed8d9Ch[Hu+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV8P`)b8PhQ2-YdR1Bkh]r-S-Yn/mftK@q]:k
F*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%5tjj=:/F5U83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$
6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:IITB;cHXd6<-uV:JP(b:d$i^5tjj=:/F5U
81[A/6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUB4YslEaa'$+A,Et+Cf4rF)rIF@rc:&FE7luC1D'g
F)to64ZX]I3[\Z\A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^_6De*d(
-OgDtDe*HoCh7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$Et&Hc$;No?+ED%%A0>Au@<6K4Anc'm
F!+q#@r!2qDIal6EbTW,+EVNEH>.=@%14Lu@r,RpF(KD8/1)u5+?V#^@<<kG4ZX^+ART*r/j:D)
3[-:$C2[WpBl%@%%13OO:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2EbTK7Et&I(Eap55EapI[
3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"%14M1/g<"mF)kb>
4ZX^43[-:$F)kb"$4R>;67sC'E+EC!AKYT!Ch7Z1Bl5&7Dfp)1AKZ;5E$/k4+CT)#ASrV"$:[T\
78l?1+=Lu7CghC+ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a3$8=SWDe*BeF<D\K+<VeQEb03+
@:Njk-pB>37S-9B;^je#:IITB;cHXd6<-uV:JP(b:^mac4DJeFF*)>@ARo4k+F8'>E,8rmAKWBb
0mcA]9LVl/4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SWDe*Bs@Urnh+<VeQEb03+@:Njk-pBD57S-9B
;^je#:IITB;cHXd6<-uV:JP(b:^mac4DJeFD..3kA79R&+F8'>E,8rmAKWBb1ODS_9LVl/4%`::
6qL<V;Fs2T<(Tk\>"MO"$8=SWDe+!4Bl%<gF<D]PEb03+@:Njk-pBJ77S-9B;^je#:IITB;cHXd
6<-uV:JP(b:^mac4DJeFFDl)6F(A^$+F8'>E,8rmAKWBb21%ea9LVl/4%`::6qL<V;Fs2T<(Tk\
>"MO"$8=SWDe*d(A79R&+<VeQEb03+@:Njk-pBP97S-9B;^je#:IITB;cHXd6<-uV:JP(b:^mac
4DJeFE,ol/Bl%?'+F8'>E,8rmAKWBb2g\"c9LVl/4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SWDe*fq
Ec#k?+<VeQEb03+@:Njk-pBV;7S-9B;^je#:IITB;cHXd6<-uV:JP(b:^mac4DJeFF`V,7@rH6s
BkLm`CEOaGEb03+@:Njk-pBY<7S-9B;^je#:IITB;cHXd6<-uV:JP(b:^ma@$;No?+CoC5@;Ka&
+D,>(ATJu*G\M5@+DG^9H>.=-$@69.BleA?0d&qW9LVl&/1r&-8l%iC8Q/Sd8O?EV8P`)b8Pfj'
F)>i<FDuAE+A,Et6qL<V;Fs2T<(Tk\>"MO"$4R>;67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+
%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5
@<6*B3B:FU$=\-lCh.:!A9;a.Ci_?d:-pQ_@WcC$A86$nFDl)6F!,NU/KeMFBl%=$+CQC)F_kl>
+Cf>,D.RU,ARloU:IH=IDf9H5+Cf4rF)rIF@rc:&F=n"0:-pQB$;No?+Eh=:@UX@mD)rdK$;No?
%15is/g*MiG%G*(F#ja;:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG
@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB90JGJ'@<jUf+>"^VAStpnARlom@:O(qE$07@+E2@>A9DC(Bl@l3/Kf+KD/a<*Anbgt+A+pn
+DG_7FCB!%05Y-3DKKH-@;]Rd%15is/g)o'0emNRGqh,u/Kf1TA79RkA0>K&EZdtM6m-GeEc`FG
D]h_fDKU1H:K%]0%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G0
3Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$
4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D,2,@q[!*
AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6
-Xq44Ch.:!A1%fn%15is/g,4HF<GaDA.8knC2[X+ATDj+Df-\4De*="Bl%<iDKI6h3\l%78l%iU
9gfEtC2[WlF_PZ&A79Rk4ZX^-F*(i-E$m"B$7BS,A9;a.Ciac2EcYr5DBN\4A9;a.Cia'.Bl%<i
DKI6h3\l%78l%iS:JXY_<_Ysk$>OKiFDl)6F(09+Ch.$nF?MZ-5!!FsA9;a.Cia'.Bl%<iDKH<p
%15is/g+kG@rc-tASuT4@WcC$A0>B#F`);4EX`@J:IJ/X:J=\f9gh-*+=LuCA9;a.Cia'.Bl%<i
DKIsTDe*="Bl%<j@<?'0+=Jre1+@WD:IJ/X:J=\f9gfEtFDYu5Ddso/F`\`R8l%iS:JXY_<_Yt0
%13OO:-pQUF(KG9Dfp/@F`\a<Bl%@%%15^'6rZrX9N+),+=CoBA9;a.Cia*)D/Ej%FCeu8Bkh]:
%15^'6rZrX9N+nZ;cH4X9LV**+DPk(FD,`,E$/n7@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>\\1f
AU&<<>UM'p:IJ/X:J=[r$;No?+C\bhCNXS=De:,&BleB:Bju4,ARloqBl%?'E,8rmARlotDBNn@
F<G+.@ruF'DIIR"ATJu8@rc:&F<G+.Eb/a&DfU+4$;+)^6qL<V;Fs2T<(02E8PDQ93Zr0V@<?1(
AT/b?+tb6A6W,9_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1]+
:IJ/X:J=[r$4R>aBOtU_4ZX]5:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D'oc"FD,5oA3Dsr+EV:.
@:Uo_7P#r8:-pQU<b6;mBl@lM+=A^TDe*s.DesK<ATDj+Df.*R+<X!nBl%<&:3CD_ATBgS-S-Yi
3biSDFDl)6F(09+Ch.$nF=Aag+<X'\FCdKU-S0"NA7B[qCh.'bFCcmP9L]HuF)>i<FDuAE+EV:.
@:TfS%15is/g+e<DImisFCcS:Df9H5+EM%5BlJ/:@;]TuF('6'%14J'@j#l3DesK)EbTK7-TsL5
1*CFMF!)iFDe*s.DesJB%17/nDfp/@F`\`RDfp/@F`\a<Bl%?'Ci<flFD5Z23[Y@D.!%O4+EVNm
:K(48FD,5oA1UDD/9GfKCia*,BlJ/C+Eqj?FCcS9BQ&*6@<6K48l%iS:JXY_<(0_b7S-9B%17/n
Dfp/@F`\aI+Eqj?FCcS9BQ&*6@<6K48l%iC8Q/Sd8O?EV779U:9LTBt%15is/g,:UA79Rk+C]J-
Ch+Z%BleB7Ed8cZ+EMXCEb/c(@<3Q1Cgh$q+EV1>F<GF/@rcJs$:7`a9LMEC;cHOj=ZnA[-o!e;
+>PBm3]\B?+D58-+=BcW6rZrX9N+8X8PDNC8Q/Sa;HY@V$:7`a9LMEC;cHOj=ZnA[6<-TN6qBmJ
<)6Cp/1<7u9L^H^FD,5oA.8l&+E2IF+=BcW6rZrX9N+8X8PDNC8Q/Sa;HYA/1,V-[<CokP84c`Z
:Jt=)$4R>`D/XQ=E-67F-YdR1FDl)6F!+t2D/Ej%FCeu*@WcC$A0>B#D/a<&FCcg/$4R>;67sC$
ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=\-lCh.:!A9;a.Cia*)D/aN,F)to'1,2Nj
/h1=QBl%<pDe*s.DesK)Df'H6ATMp(A0>qF/KeMFBl%=$+Cf>,E,oN2F(Jl)G%G]8Bl@l3De:,6
BOr;Y:IH=IDf9H5+Cf4rF)rIF@rc:&F=n"0:-pQB$;No?+@Bs`DIm?$Ao_g,+=L]ABl%<pDe*s.
DesJD+DkOsEc2Bo:-pQB$;No?+Cf(nDJ*Nk3XlEk67sB80kP!+0K:1,+Cf>(DKBB0F<DrFC2[W1
+CSekARlolAoqU)+Dl%?Bl7Q+8l%htBl8$(Eb8`iAKZ)5+DGS/A.8kT$?B]tF_Pl-+=DVHA7TUr
F'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!p1Eb0-1+=CW,F(H^.$4R>PDe!TlF)rHH-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!
A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs
0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:
Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o-UC$aFE1f2BK8(5-Qm&5F<Gua+D5_6+=CW@
Bl%<pDe(4)$4R>;67sC%ATT&<D.F(_-YdR1G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F/kSo-<_Ysk
$>OKi@WcC$A7T+jAN`'s@;Kb%EbTA5FE;P4D/^jM%14ItDe*s.DesK<ATDj+Df-\4De*s.DesK(
F_PZ&@r?B94ZY?F/kSo-<)6:`;cZU\%16igA9;a.Cia'.Bl%<iDKJ$&+?hi$De*s.DesK(F_PZ&
@r?At$4R>;67sBpDI[]uD.RU,+C]J-Ch+YuDfor>ATA4e8l%iS:JXY_<_YtF3ZohcDe*s.DesK(
F_PZ&@r?BMC2[WlF_PZ&A79Rk.3L#n+>PBo8l%iS:JXY_<_Ysk$7A,*6$.-UF(dQo3@>qgF`\`R
8l%iS:JXY_<_Yt0%13OO:-pQUF(KG9Dfp/@F`\a<Bl%@%%15^'6rZrX9N+),+<VdL-YdR1FDl)6
F"V0AF!hD(:-pQU8l%iS:JXY_6:"7-/g)NVDe*s.DesK(@;@K0C3(a3$;+)^<)6:`;cH1a<(9GQ
76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$B4YslEa`chC2[WfC2[WoG]\"3-S.kc6rZrX9N)B-
%15is/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@+DG^9E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cp
FDl2F%15^'6psUF<)Q:S<E)Oc:0L4c4Y@j)C2[Wi-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T
-SB^ZE$l)%8l%iC8Q/Sd8O?EV8P`)b8PhQ&+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi8l%i^
?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6psUF<)Q:S<E)Oc:0L4c%13OO:-pQU
@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6EbTK7
+Co2,ARfh#Ed8*$8l%iS:JXY_6qL<V;Fs2T<(02E8PDQ93Zr0V@<?1(AT/b?+tb6A6W,9_4)AhF
F(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1]+:IJ/X:J=[r$4R>aBOtU_
4ZX]5:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH33%172jART+43ZoPeBOtU_/5/Ma-mqbV/g+2+EcYr5DE8mf/8B*6FDl)6
F*;,8F(oQ1/12P_6?R!YA0=WiD.7's3Zoe$-mC]eDe*s.DesK(F_PZ&@r?B;/12P_6t(1K3Zoe$
C2[WlF_PZ&A79Rk.4e.^%17/nDfp/@F`\aJBOtU_%13OO:-pQUB4YslEaa'$+EVO?Ci^_?@rc:&
F<G"0A0>r%G%D*i:-pQ\Eap56Df9H5@rc:&F=044+>P'VCi^^HC2[X)Df9H5-OgCl$?L'&F`_SF
F<Dr@Df'H6ATMp,DJ(),De*s.DesJ;/hSb(%13OO:-pQUAn?'oBHUu"@:Wqi+CT.u+Cf>,E,oN2
Et&Ii4Y@jfATqg%FCf3.@rc:&F<Dtd4"qd3.=4*:+>P'PATT%BC2[X)Df9H5-OgCl$;No?+Cf>,
E,oN2F!,@=DId<tASu$iDKI"6Ec6)>+EqaEA9/1e-ZU>N-Ts()@rH4'C*4p;Ec<-KC2[X)Df9H5
-Rg/i/g+e;AT2]5-YdR1FDl)6F!hD(%15is/g+b;FCSu,@;]Tu@rH4'Eb0<5+E27?FDu8=@qB_&
DfQ9oE'5frA7]suBlmp$F(96)E-*3N0fq'31+@Q23Zp7%B4Z0--W!T;<*sBYA9;a.Ci^s5$4R>a
Df9H5@rc:&F?M6!BIn3UE"*-`$?L'&F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@m13[Y@D.!%O(
+EVNm:K(48FD,5oA1Vh@DesK)EbTK7.3NhTBlmo/F(fK9E+*g/+A,Et<)6:`;cH1a<(9GQ71BTF
D/XQ=E-67FF!,[IBlmo/F(fK9E+*g/+A,Et<)6:`;aa2U<)Q:S<E)CT7S-9B%13OO:-pQUF`:l"
FCcS)Df'H6ATMp(A0=K?6m-#SF*)G:@Wcd,Df-[L+ED%5F_Pl-F!,d@Bl%@%%15is/g+S?A0>i,
H>.=R2(iHbAKYo/+Cf>,D..<m+EM4-Cht55@<?/l$?I>9Eb03+@:NjkF(fK9E+*g/+=JUPDe*F(
FE9)_/4r]+<)6:`;^je#:IITB;cHXd6<-uV:JP(b:^ma@$;No?+E_X6@<?''@WcC$A0>Q"F*)>@
Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=+DkOsEc2Bo6<-TN6qBmJ<)6Cp4Y@j*0fq'31+@Q23Zp7%
B4Z0--V@0&<)6:`;aOJU9LMEC;cHOj=XOXc6<-TN6qBmJ<)6Cp4Y@jD<CokP84c`Z:Jt=H-o*#@
7O]m1BOtU_%14p7E-67F-V@0&<)6:`;aOJU9LMEC;cHOj=XQ9d2*4-)8PDNC8Q/Sa;HXG9%15is
/n0*JAKZ&.H=\4;Aft_tDImisFCeu*E,8rsDKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chh
F(96)E-*43H$!V=-OgE(D/XQ=E-67F-V@0&<)6:`;]oRgD/aN,F)to'+C]J-Ch+YuDf'H0ATVK2
%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4=<E\6$.-UF(dQo3@>7CBPDO0DfU,<De(U\B4YslEa`c;C2[W*
/KeP:@;]^h+D>J1FDl2F%13OO4ZsoA/ibO@+?_k1HU1%pI16N+.NikQA79Rk+DPh*Bl7HmGV3ZO
D/:>:D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%13OO4ZsoA/ibO?+?_k1
8p,"o0ek4%1,(F;%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9
<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu
@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4
D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)C2[W8E+EQ'GA1l0+C\n)
Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R>*4WlF23A*'04Zso^@<itN
3@l:.0JP9k$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<
+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?
+CTG%Bl%3eAKZ/1@3BZ*AKZ/-Eag.>C2[WrASc<7/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNE
FD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8
@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.
D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4-u*[2/oY?5.1HUn$6UH6BQS?83\N.1GBYZKDg3mP
ATTSHBOPpmA1qS(C1_TG0P=lL%13OO+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#
E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b
+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!
@:WpY$6UH6@<Q'nCggdhAKYo/+DlBH@Vfsq+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ(($
$6UH6Bl5&8BOr<1Bl%<4%143e$6UH6BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf#pj%144-
+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=
D0%<=$6UH#$9^Np0J5@<0d&VB+AH9i+?(ho1,(F;%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&
-tRKL+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO4ZsoA/ibO<+?_k1
7V-$O0fU^,1,(F;%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd
<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1.NibCE,8rmARloU
:IHRO+=MOb+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBL?AC2[W3+DG_8ATDBk@q@8%$6UH68l%ht
DJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZohcDe*d(.4cSiC2[X$AnEJ7@;]Tu%144#+=LuC
A93$;FCf<.@<?03+DG^9FD,5..!d<bCi<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaE
A9/l%Eb-A(AS,XoARlotDBL?AC2[W3+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+
@;KL&F!,O8@<,jk+E1b2BFP:k.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]gHC
E+*j%F(K;>+Cf>-G%GQ5Bl@m1/e&.1.NiJEA1hh3Afu,*D/XT/A0>K)Df$V=BOr;rDfTD38l%ht
@:WneDBNn,@r#LcAM,)JC2[W8E+EPi$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6
BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+DPh*/oY?5%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)
@X0(EC2[WrASc<7/g+;8FWb1&DBNJ.GA_58@:UKqDe(J>A7c8X+<Ve8DIal/Cgggb+DGp?Bl5&B
@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi0-G@T+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__
@:X(iB.aW#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdk
ATKI5$6Uf@<E)FI+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQn
ATAnK3$;gOEZe@]7Q;hL%144-+@94173HGU@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't
+>Pi-+<V+#+:SZ@4WlF23%cm-4Zso`@rrhL0e=G&0JGHq$6Uf@@:Wn[A0>c$G9CX=A8kstD0%=D
C3(M:@<,dnATVL(+@/pn8P(m!+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UH
AKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!
AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8
+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6Uf@C2[X(Dfp)1AKZ,:ATJu&F(8ou
3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5
De:,6BOr;sDg-)8Ddd0t/e&.1.NiSBDJsP<AncL$F!,17+DPh*/oY?5%13OO4ZsoA/iPC=+?_k1
:LeJh2_6(,0JGHq$6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et
+A?3Q+<r]c@;]TuFCfN8+=D5AFEMP0C2[X%Ec5](@rs(-$6Uf@AncL$A0>;'An?0/FEqhDF!,17
+DPh*/oY?5%13OO4ZsoA/iPC<+?_k1;e9nj1,UU*1,(CA%144-+Cf>,E,9*-ARlooH!t5t@j#8i
F(HJ4AftW&@grbf.NikQA79RkA0>W*A1hh3Afu26+Co&)@rc9mAKYJr@;]^hEt&Hc$9^Np0J5::
0d&VB+B)ij+>Pc)+>PW)3"63;.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,Oq
Bl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3
@:sUhD'3P1+DPh*/oY?5+>"^VARopnATJu8BmO>5De:,,De(J>A7c8X%156]+>>E,/heD24Wm[7
E$-nm/0H]%0K9LK+=\LSAS,LoASu!hF!+n%A7]9oFDi::De(J>A7cqn$6Uf@DIn#7C2[W*BOPpl
@rH=3+Er$R/o5ZHFY70BD'3D#Bln'-D@Hpq%156]+>>E+/heD24Wm%5B-8og/0H]%0K9LK+=\LN
Bl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!.NiJEA1hh3Aftf*A7^!.Bl.g0Dg#]&+:SZ#%156]+>>E*
/hnJ34Wm@>C`kJf/0H]%0K9LK+=\LKDe+!3ATD:!DJ!Tq/no'A+CSekARl5W+=\LHA7]_$+Du+A
+CoD#F_t]-FCeu*Bl5&.De(J>A7c8X+:SZ@4WlF22(gR*4Zso[F_i0T3%Q1-0JGHq$6Uf@C2[W8
E+EQ'A8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ@4WlF21bLI)4Zso[F_i0T0J">%0JGHq$6Uf@
Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+DPh*A7]q#Ddd0!AoD]4Cggc^$6Uf@D/!m+EZf1,
@N]5mBlnD=/Kf(FAn?!*FDi:CFCB33F`8sIC3(M3DKBo2@:UL!Afu/)EbTK7F"V0AEt&I!%156]
+>>E(/iXt:4WmI-Gp"mt/0H]%0K9LK+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku
$4R>*4WlF21G1U/4Zso^@<itO0e=G&0JGHq$6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo
+Ceht+C\n)Ecl7/$4R>*4WlF21G1R.4Zso^@<itN3@l:.0JGHq$6Uf@Anc:,F<GU8Ch7$rAKYo'
+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DBNn=BlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&
BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.
+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1%143e$>OKi2D?n,AS5^uFCfJJ0ht%f
.V`m42D?n,AS5^uFCfJ8F"JsdEb-hCAS5^uFCfJ88l%htA8,OqBl@ltEbT*+/e&._67r]S:-pQU
<+oue+<Y`8EbTK7+<Y]9/TPE8BleB-EcW?G8l%ht+Co1rFD5Z2@<-'nF"SRX8TZ>$+<Y)8+D5V2
A.8l@67sC"Ea`I"Bk(]sFDi:=@;0V$@;0U%@3BDqF*(u6+EM%5BlJ/:FD,*)+Du+>ATJu9BOr<&
De!3tBl@m1%15is/g+S?A0>buD.Rc2De:,#Cht5&@ruF.AKXT@6m-#S@ruF'DIIR"ATKI5$;No?
%15is/g)o'0K<K[E\KBo/Kf+CG%G2,Bl5%AC2[WnATfL3$;No?+>PW)3,N)L1,0n'+DPh*+EVX8
AKZ#)Ec5l<ARl5W:-pQU1,(F:DJs\P1a"@mF(KG9AoD]4D0KQ$@grc?67sB90JP;!@<jOe+>"^W
E,961+DG_8D]idQ0JY:r2_Zs/F(96)E--.1$;No?+>PW*0l:?E1-$I/+Dl%-BkD'jA0>u4+EDUB
+E)-?GA1qJCh[d0GRXuh$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@B4YslEa`c;C2[W1%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ATV?pDK?qAFE2)5B-:YpAoD^$+D,>.F*&OC
@q0Y%Eb0,uAKYo'+=MI`%16QUAoD^$F*)Fc3aEkT/q+ot-7ER\IORN1>9H?e+C-E*$4R>;67sC$
ATW'8DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><@rH4$@;]Us+CT=6FCf]=+EMXFBl7Pm$>=@!F?MZh
3Zp1$3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H%13OO:-pQUF(KG9A8,OqBl@ltEbT*++EVNE
;FNl>=&MUh73E^)+Dl7BF<G%(+D#e:Ch[C$+Co%qBl8$,Df.0:$;No?+AP^3762Q%Bk)7!Df0!(
Bk;?.F*)>@AKZ).AKYN(Bm+&1Ch7^1ATAo8BOuGu$;No?+EqC;AKYetF*&OFAS5^uFCfK(A0>f.
+CT.u+EV:2F!,1<+Du+>+Cf(nDJ*Nk%15is/g,@OASrW!+AtWo6r-QO=Wh6h@ruF'DIIR2+DGm>
Eb-hCAS5^uFCfK(A1f!(D]j(3F(KG&$;No?+EMXCEb/c(A9)C-AKYf#FED)7F!,=.CLnVsCht5)
Bk)7!Df0!(Bk;?.;FNl>=&MUh71BT!67sBiAS,k$AKZ#)/TPE8BleB-EbTE(/e&/.De)!`+>Y-$
+=ArfDe'u9+Bot!E-#T4+=AO776s=C;FshV-RU$@+E(d5Gpa%.Ec5J84s58++E(d5-RU$@+>Y-Y
A0<6I%13OO:-pQUF`)52B5)F/ATA4e1E^^LB4N>Q+FPjbDe't<-QlV91E^UH+=ANG$4R>;67sBk
Bk)7!Df0!(Gp%'7FD,_</KeV8BlkJ>D]in*FCSu,@s)g4ASuT4Ci<flFD5Z2Et&IkDe*m,Dfe-'
+>Y-$+>=63Ec5l<4Y@j)05>E90./;!-SHhi@V'.iEb0<6EZd@c3\`H6-RU>o-SHhV$>F*)+A#%(
8PUC=D_</QDf9_\/g)NO3[ZJ!Df9_?%16Z_F(HsH%144#Ec5l<4Y@j*9L^-V/q+pVDf^"C-Y6e$
D]g;r:JF8*.4fLXDfd*2$>"*c/e&.:%15L"4Y@jlDe*m,Dfd*U%13OO:-pQUEb/ltF*(u6+CfP7
Eb0-1+EqaECM@[!+Co1rFD5Z2@<-'nEt&IO67sC$AS5Nr-YdR1A7]p3+<VdL+<W`o6r5E^C2[Wn
ATfFM4"!Wr6m-#OG%GK.E,B0(F=.M):-pQUEb/lo+=CoBA1&KB+<VdL+<Vdg-q$l_-YdR1-Rh,)
8l%htF)Q2A@q@"s$?B]jA0<7BFD5Q4-QjNS+<VdL4"*Kn/15R^Bl%i<.6AniASu("@;I'/FD5Q*
FD5<--OgE'AS5Nr-Y%(4F*2;@-QjNS+<W`o6r5E^@q'+!.6Ane@V@E6@<-F-DD,UB@;]jsBl5&;
DfTV9Df0,<De<U&-OgE'AS5Nr-Y%(4F*2;@A7]p3+<W`o6r5E^Ao_<tCM[^&A7]p3.6Ane@V@E6
@<-F-DD,UB@;]jsBl5&;DfTV9Df0,<De<U&-OgE'AS5Nr-ZEm1Gpa^W+<VdL+<W`o6r5E^E,8s.
-Rh,)C*7V:Gp$R7GUEq-Eb/lo+=D5IF_<'E+<VdL+<Vdg-q$l_-Y@1/@r$+-F=/M!-Za-IB5Md(
04o$7@r$*-@;op'F)Q2A@q@"s$;No?+ED%+A0<73Ch[BpEclJ7ATfFD4"*Kn/15%GBk(q!F`_/*
Fse_#-Uqod@r$*-A7]pqCi=90ASuT;%17,eB4N,4Bl.9kALATC+<VdL+?Lu>:b3u.D..'g-Rh,)
FD,f6@WQL2F"_KRD'3P1FCfK)@:NjkBl.9kAKYr4De!@"F(oN)-OgDX67sC$AS5Nr-Y[F+B4YUb
FseCT+<W`o6r5E^Bl.9kARo@q-Rh,)FD,f6@WQL)F`T3TF)<%1AThX$DfBQ)DKI68$;No?+ED%+
A0<7/F_#,rF=/1R+<VdL4"*Kn/14nLA7oIq-Rh,)G@b?$Cj@.4F_#,rF<G+&FC?O+$;No?+ED%+
A0<74E-!BL+<VdL+<VdL4"*Kn/15(LF!iCu-YIC>+E_d?Ch\!*ATK4.$?B]jA0<7@D09K%ATfFD
+<VdL4"*Kn/15LUF_>5rFse_#-Za-IB5Md(05tuL+EMIDEarZ.%15is/g,1GB4N,4D0KQ$@j`BA
+<VdL+?Lu>:b3u2G@b8o-Rh,)D/!O)ATMr9ASlC&Dg>o7F!+t$F*1o-FEo!=Df'H%DL!@FASbds
ARm.t$4R>;67sC%ATT%m76s=;:/"e5AoD]4F(K0!@ru9m+Co1rFD5Z2@<-'nEt&I4+E(d5-RU$@
+EMC<F`_SFF<G+5F(KG9-W3B!6r-QO=XP=r+E(d5-ZsNFCi^s5$8WfCA0<6I+Bot0D/XQ=E-67F
A8lU$F<Dr/76s=;:/"e<+Bot,A0<70Df0W=Cih$6$8WfCA0<6I+Bot0D/XQ=E-67FA8lU$F<Dr/
76s=;:/"e<+Bot,A0<7@D09J=%14m6De't<-QlV9F)>i<FDuAE+CoG4ATT%B;FNl>:JOSd-QlV9
De't<Bl.9kAL@oo%15is/g,4KDg*=EAS5^uFCfK(A0>Ds@ruF'DIIR"ATJ:fF)>i<FDuAE+>b3Z
A0<6I%16igA2c1sEb/ltF*(u61,2Nj/h1USA2c1sEb/ltF*(u6+EK+d+ED$FEb/ltF*(u6+A,Et
+Co1rFD5Z2@<-'nF"Rep67rU?67sB[BPDN1+EM%5BlJ/:+ED$FEb/ltF*(u6F!)St:IH<JA8,Oq
Bl@ltEbT*+/g)9.F=2,P+CQB8B5_^!$;No?+E2@0@ruEpAKZ)5+DkP$DKK<$DBN@1D..L-ATAo7
@rc:&F<G[=@<<W0DffQ3+EV:.+Dbt+@<?4%DK?.[67sBhDIal-@;TRs+E(j7@;Ka&@:OCnG%Ddg
:IH=9Bk)7!Df0!(Bk;?<$;No?$;No?+CfG'@<?'k3Zp130K<K[E\KBY:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB90JGJ'
@<jU_+>"^NDe'u4Eb/f)Eb090DffQ$$;No?+>PW*0Q(fP0Jjn(+EM+9+D,P4+Dl=6@q,j@67sB9
0JP;!@<jOe+>"^WE,961+DG_8D]idQ0JY:r2_Zs/F(96)E--..:-pQU1,(F;D..]E3?Tmr@q]:g
B4YTrFDi:BF`&=?DBND,FD)e@Bl5S?Bl8'<$;No?+>PW*0l:?E1,^7,+Cf(nDJ*Nk+EVNEEcl7B
Ao_g,+DQ%:CERG3@ps1b$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@B4YslEa`c;C2[W1$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ATV?pDK?qAFE2)5B-:YpAoD^$+D,>.F*&OC@q0Y%
Eb0,uAKYo'+=MI`$=[RYDfTE1FE0N*>p+JHINU?l-tt;_.6o:c+@Rn*>q$*f:-pQUEb0?8Ec,q@
Eb0<7Cige<Afto(DKU1WF`(o<+Cf>,D..<mF!+n4+EV1>F<GXHEbTE($>=@!F?MZh3Zp1$3\V[(
-mp3G+=nX@+=nW_+FJPZFE2M8.46<H$49Np/g,4HF<G+.@ruF'DIIR"ATJu9D]hqH5t"dP8Q8,$
+>"^QF`VXI@V$ZnG]7J5@rri(AS,XoFD5Z2/db??/g*nb<(/hjA8,OqBl@ltEbT*++EMXCEb-A8
BOr;sEbT].+DbV2FCfJ8FD,62$;No?+EqC;AKYetF*&OFAS5^uFCfK(A0>f.+CT.u+EV:2F!,1<
+Du+>+Cf(nDJ*Nk$;No?+EqL1DBN@1;FNl>:JOSd+Co1rFD5Z2@<-W9BlbD;AM%q6B5)F/ATD?m
/g+,3+ED%7ATS8S67sC%FDl22A0>E'Bm+&1Ch7^1ATDi7D..3k+CT)&+Co1rFD5Z2@<-'nF!+@L
5t"dP8Q8+c:-pQU@V'.iEb-A6AM%q6B5)F/ATDL&B.aO3De)!`+>Y-$+=ArfDe'u9+Bot!E-#T4
+=AO776s=C;FshV-RU$@+E(d5Gp`r>De(1Y+FPjbDe't<-QlV91E^UH+=AND$;No?+E_RBAS5^u
FCfJ"1E^^LB4N>Q+FPjbDe't<-QlV91E^UH+=AND$;No?+Co1rFD5Z2@<-W9E+*j%F!*%WARoLs
+EVNED..NrBHUf-EcP`/F<GC<@psInDf0V':-pQU:/=hX3ZrNXBlbD?ATD6&@rc-hFCfM98g&:g
EcYr5DBO">ARfFdBk&8pEa`iqBOu6--u*p:E[_>j67sC+Dfm1>@<iu>@;^00FDi:CATT%CC3F0/
.3N_N+CQC&Df0W<@;^00G%#30AM+=)De*m,Dfe-'+>Y-$+>=.;G%G\W/g)Mp-Qll0AoD^$F*)FF
3?^F<1a".n$?C''F?M6!-SK4QA1o;]C3F0//13(u$>F*)+A#%(8PUC=D_</QDf9_\/g)NO3[ZJ!
Df9_)AScF!/d`^DEc5l<4Y@j*9L^-V/q+pVDf^"C-Y6e$D]g;r:JF8*.4fLXDfc=tDIb@,.1/I>
4Y@jlDe*m,Dfd*U$49Np/g,1GB5)F/ATAo'F`MM6DKI"FDfTW-DJ()&Bk)7!Df0!(Bk;>mEb/lo
+=CoBA7T7p-QjNS+<Vdg-q$l_-YdR1A7]p3.6AnL:IH=9AThX$DfBQ)DKI65Eb/lo+=CoBA1&KB
+<VdL+<Vdg-q$l_-YdR1-Rh,)8l%htF)Q2A@q@"pEb/lo+=D;RBl%i<+<VdL+<Vdg-q$l_-ZsNF
Ci^sQ4""ZPDImisC`mkBBl%L*Bk;?5$;No?+ED%+A0<70Df0W=Cih$I+<VdL4"*Kn/14q:BI>5j
-Y$V!05t??F)PqLAo_<tCM[^&+EqaECERP5AM%h4Aof=,:-pQUEb/lo+=CZ;DKBr:FC\s+-QjNn
-q$l_-Y@C-DJO'&DId=%-Rh,)@q'+)E+*d.Df.4?Ea`j$Ch[c0GAhM;+E).//T565F!h<8AS5Nr
-ZEm1Gpa^W+<VdL+<W`o6r5E^E,8s.-Rh,)C*7V:Gp$R7GUEi=AS5Nr-Za-IB."fE+<VdL+<W`o
6r5E^F)?&4-Rh,)F)?&4D09JEAo)0kCN:P+E+pG9Dfp)1AL@g[67sC$AS5Nr-Y@1/@r$+-FC\s+
-QkK!6r5E^Ao)0kCN=Q>A7]p3.6AnHCh[BpEZen(G%GK.E,B0(F=.E9AS5Nr-Y[F+B4WG5+<VdL
+<W`o6r5E^Bl.9kALAog-Zj$ED.7R*F`T3TF)<%6DKKH1Amo1\+DG\$B4W3)Ec5H!F)u&5B."$]
67sC$AS5Nr-Y[F+B4YUbFseCT+<W`o6r5E^Bl.9kARo@q-Rh,)FD,f6@WQL)F`T3TF)<%1AThX$
DfBQ)DKI65:-pQUEb/lo+=CW@A7oIq-QjNS+<Vdg-q$l_-Xq4/B4Z04.6Ao$AS#XnGp$R=A7oIq
+Cno&@4)D&AS5Nr-YIC>-QjNS+<VdL+<W`o6r5E^B5ho>.6AniE-!.EFD5Q*FD5<--OOm*B4N,4
F)?&4A7]p3+<VdL+?Lu>:b3u8D09K%ATfFM4"#)dF_>Q6B.n4FD'3n<F`Lu'-OOm*B4N,4D0KQ$
@j`BA+<VdL+?Lu>:b3u2G@b8o-Rh,)D/!O)ATMr9ASlC&Dg>o7F!+t$F*1o-FEo!=Df'H%DL!@F
ASbdsARm.q$;No?+EM+9+AtWo6r-QO=Wh<pEZfF7Ch7*uARlooBk)7!Df0!(Bk;>m1E^UH+=ANZ
>9IHqF(KG9-W3B!6r-QO=XP=r+E(d5-ZsNFCi^s21E^UH+=ANZ>9IHqF(KG9-W3B!6r-QO=XP=r
+E(d5-YdR1-OMXPDe't<-QlV9A8lU$F<Dr/76s=;:/"e<+Bot,A0<7@D09J=$8WfCA0<6I+Bot!
E-#T4+=C&U5t"LD9N`_c>9Iip+=Cl?@:s.!$49Np/g,4KDg*=EAS5^uFCfK(A0>Ds@ruF'DIIR"
ATJ3"D/XQ=E-67F1a$^I+=AND$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<,.De*BsFC.F3<&-=ABkMHpE+g@d:IH=P%144#+<VdL+:SZ20-G"JA0>r=F*(u1+Cf4r
F)rIEASbdsBl@m1BPDE.@<-C,GB43#DJs&s+Bot0FEq\64_ADECh7-.+EqC2B4uBM0e=GdATDL(
BOu3uATL!i/0JP=Ci!U"Ci=>WGA(]4AR.A,$4R=q0-FbCEb-A.De':aF*1r)Ea`p#+Cf51F*(u6
?Xki6HOU<)+<Y`IH#.%TAnc'tARmk3$6UH6@rH1%E]n5QB4uC"Eb0MX%144#+DPh*+DPh*F*)>@
AKY`+A8PajAKY`+A9E!.C`mJ2A7TUf%144#+DbIqAS`JP+<j0kEb-@c:IH=8CghC+ATK%W%144#
+D,P0FE;/BAN_e*3t2N>+<YK/@V'@jF`VXfE]X^;I16Mm$@3gH4s4QSDe'tpA8-'I@UWb^/0K"U
H#.%TA8cR3ARo(.%16faDe'tB4s4TYA0>)eBlZ@G@:O((+EMXMCh5b?Dfg)4A6h8+$>OKi+>#c"
C2[X(FDl22+BrAjE]ml?@r#@3%16igA0<Hf+DPh*D..3k+BrAjE]ml?@r#@3%16igA0<Hf+DPh*
F`_>6+BrAjE]ml?@r#@3%16igA92j2Eb-@F4s4TYA7TUf+BrAjE]ml?@r#?m3t2O3De+!4Bl"nD
4s4TYA9;a.Ci^_'A8-'I@UWb^>p)3<$>OKiFDl)6F!+\!Bl%TqDes?44a1RRFCe`>%16faDe'tp
Anc't@rH1%E]n5QB4uBrCis;p3t2OC+BrGlCi!U"Ci=>WCh[NqFCK'/AR.A,$4R>g+Bot0BOPjk
4_/88D/X<&/0Jb;@V'@=,'mL3C2[X$DBN\4A8c'l,$d8>$>F6nA0>)!F(f!$ANaR<@;Tq#A1Sj>
@:Eea4X+TTDe**jBl8$(Eb8`iAKYf-@ps1b,$d8>$>OKi+BrYj@V'@=,%55)A6a"h@;0U%@r,Rp
F!=mO%16igA92j2Eb-@tCggdaCcrtNC2[X(FDl22>]+V)DfT9!AKYK!@<6K6>rrK&C2[X)Df9H5
+BrYj@V'@=,%55)A9;a.Ci`j!AU&<.DKBN1DBO%>DesJ=>rrK&C2[WnDdjhnCggdaCcrtNC2[Wn
DdlshA8-'q@ruX0Gp%$7C1UmsF!=mO%16igA8PajAKY2n@:Eea4X+<LDe*]nCLpagF(96)E-*42
DIal#F_u)&DJ*NuATD4$Bl@l5>rrK&C2[X*FD5P6>AR_WASaLR@;9^kF`_>6>]++`BlkJ9@VTIa
FE:])@;]TuDffZ(EZfLHBl%L*Bk;?0>rrK&I16NuDe*R"A7^!m85r;W1,V1-FDYhX%144#4D8;7
A3LG0+<VdL4EP:ZCh5e&De)pfEb%aZA7^!<De*rP06CoMCh5d>$6UH6+?X^eH#.%7FEqh:4X+uZ
G]YTKF)rNh%144#+<YT=HYm23B5)6E0KX5^A7TClB0%_pE-lG1EbB*(3\Yt7@kfZaG%G]9Bk(Rf
/R`I0B5TbPDf@d^Bk2=!3\`WN/i@Ti4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?4
3[86KAnGXe4(<,KA7]d5@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3\i<C
2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr+<VdL1+k=>E--L\@l\mZATDm,@ps1*@;KXjDE;lXE'&8X
A9;KG1,:^>1H@HU3B9)[3B9)[3B1u"4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?4
3[86KAnGXe4(<,KA7]d5@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3\i<C
2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr+<VdL1+k=>E--L\@lA[WATDm,@ps1*@;KXjDE;lXE'&8X
A9;KG2)d-B0JG170JG170JG1712q=s@W-9tATBADFEq\63cf4UBk0;7@:O(cEc6)<A1_;0Ci=>T
,A(P"AnGX:@W-9tATBA4Des?43[6=40JG174(<,KA7]d5GA1T0BK@k#0Q;+qE+*9fBl7QE1+k=>
E-)Nr+<VdL1+k=>E-*3X/i#;'F:AR"+<Vd^/i#;'FF>cO1,4-!ATDm,@ps1*@;KXjDE;WKA7TLf
4*PCLFD*]m1b^O9E-+0NDfTB"E\2?SH#.%QF)Pl/A347/@r#^tDfor./Rr^8DfRl`@q0+_AnF,6
DfTB"E\1d>Ci=>T,;:f*0JG1B@W-9tATBAHBk2=!3\`6@E-+0\@:Wn_DJ)!f/hh6d%144#+<WNo
0Q;+V2(gS%F:AR"+<Vda/hh6dI4f"aHZit@FD55nCb9(3BkM<EFDl+[GA1T0BKA%,/hh6d4(<,K
A7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?43[86KAnGXe4(<,KA7]d5@rH1%E]PF!0JG17
0KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3\i<C2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr+<VdL
1+k=>E--L\@krCM@:Wn_DJ(PCDf@`o/i@Ti4)JDHB5)68EbT0"F?2622/mY!A8-'q@ruF'DE;TU
E]\,HEbB*(/So!1F?2622/mY!E+*9fBl7Q8@W-@1Df%Nl/i@TiI4f"a2g]LPA7TClB.\4DE&og.
2/mY!D..HtBl5MCBkM+$3]&HHE-+0`AU&;KBl7HmDKIok1bLY)F?=GMA7TClB.[S2FEDG<3]&HH
E--L\@ko`bE+*9fBl7Q8FDl+Z0fUd>E-+0`AU&;K@;KXjDE;9=DKKH14)eV=A8,po/RiX?FDl"W
1bLJ$FF>cO0en#kBl7K6BOtmjBQQ9i/ho4FBOtmjBQQ9i12q=sA8-'q@ruF'DE;TUEd]QM0f+0#
Bk2=!3]/`J/hh6d4(;W.CM.[+F`(_A@rH1%E]PFWAnGXeAijs?A7TClB0%h,/hh6d%144#+<WHu
/hh6d+>Yo.0Q;+V1H$j>E--L\@l&IDDf0YKF(or33\`C/F?=)QDKIIB@;T^pGre<2F`M2-EX`?u
+<Ve%ATrPT@kf`cBOtmjBQQ9i12q=sA8-'q@ruF'DE;TUEd]QM1j`_NCi=>T,;:f*0KD-TFCf]=
/S&F&DfT9.Bl@lMF`(`$EboH-AUQ1@21&hOCi=>TBl7TqEbTVWFCf]=/S&F&DfT9.Bl@lMBl7Tq
EbTWD/n6UqHZ3D(A8,po/TboM3\`BB0Q;+qE+*9fBl7Q8@W-@1Df%Ni1+k8"FF>cO2g].TDKIIO
BmO>O0fX,o4(`DKF=h]JBkM+$3b!#DA:6(?3.#=MBkM+$3\YMpI4f"a21&eNEb&a%/Rr^8Cgh:(
ANF=>Ci!O!F(KbP@kflg@rH1%E]PFWAhYnm0RYQ`0faSmDf0YKAmoOjCjA'/Dfp)7ATA4e+<VdL
:1\Wt/n6S^AoDR//S8F.Bl&&U<b6;^@;]M%/n6UmHXpi2ARfgrDf.UPFE2e=De+-?@rH1%E]PF!
0JG170KWlbDKIIOBmO>O0f!]i4(`DKF=h*5D/!g33`Kg1ATJ:f+<VdL:1\VY$6UH6+B!,p@;^L,
0mdkJA7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2FDfRl`
0JG170JGS#Df0YKF(or33\`O3F?=)QDKIIB@;T^pGre63Bjkg>AoDR//U(c?B4uBJ@W-'n4)eV=
A8,po/RiX?FDl"W1G1A#FF@gXHZ3D(A8,po/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=
/R`I0B5TbHAS-$G@rH1%E]PF!0JG170KWlbDKIIOFEq\63b`\ECh[B@AoDR//TYWPANDP&E-+0R
Df0YKAmoOjCjA'-EbSru4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2FEDG<3\rBBE--MA1OF(L
A7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2FDfRl`0JG17
0JGS#Df0YKF(or33\`F0F?=)QDKIIB@;T^pGre63Bjkg>AoDR//U(c?B4uBJ@W-'n4)eV=A8,po
/RiX?FDl"W1G1A#FF@gZHZ3D(A8,po/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=/R`I0
B5TbHAS-$G@rH1%E]PF!0JG170KWlbDKIIOBmO>O0f3ik4(`DKF=h*5D/!g33`Kg1ATJ:f+<VdL
:1\VY$6UH6+B!,p@;\/=Df0YKG@bK$BQQ:EDerrGE+*9fBl7Q8@W-@1Df%Nk/hh6dI:tKbE+*9f
Bl7Q8FDl+Z0et@8E-+0XBl7K6BOtmjBQQ9i/hfA/AU&;K@;KXjDE;TFAop+EDes?43[6=40JG17
4(`DKF=hQUH#.%QBlmd"Bk'5:Df0YKF(or33\`F0F?=)QDKIIB@;T^pGreo=D.Rbt$6UH6+AQKl
%144#+<XR#D..<DAoDR//U(c?B4uBJ@W-'n4)eV=A8,po/RiX?FDl"W1G1A#FF@g\HZ3D(A8,po
/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=/R`I0B5TbHAS-$G@rH1%E]PF!0JG170KWlb
DKIIOBmO>O0emWh4(`DKF=h*5D/!g33`Kg1ATJ:f+<VdL:1\Vl;K$D\DEDHKDKIISASGdjF?3lL
Ch,VH@:Wn_DJ(P1Dfg)>D)sI*0Q;,^4>1btH#.%U%144#4>1AZ@:VP2$6UHR@W,e&+Cf4rF)sJg
@kfb`4q.iA+<VdhE$/Y,@<6KQ,%E>a+Cd,c,!HGC+<VdL+<WdfE+*W,@r,RpF$1^W1a$9^,!HGC
+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:
04]!2F_t]-F>%/X0lU#FCL]+Y:Noc,7p7`9@<Q<e<&@KRG!U4d77C4&F_+N4<%V*J=ZLRX04e[.
F?aGT4_8M<<Dt)*%144#+<VdL+<YcE@luDQ4q.iA+<VdL+?V;uE+*WJ%144#+<Wd"E'=^<+<VdL
4EP"@Ch4`!ASc1%@:Wn_DJ)*V0HqWLASc1(E+*6jDJ)*V0HqWLCghC+4X+Aj2'P3n$6UH6+<Vdh
FCK0!Gs2ZE+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Ak0d8dj
$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W0f1"_1,'n9%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%EPS@k]$80fC4>BkhQs4>1bp@;\7<$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@lGN?0Hr\-
,;D)14%X=3ATDBk@q?caDfTB04>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+?V<!@W,e&4q.iA+<Vdh06CW3Ch5d>$6UH6+?XTc@r,Rp
F$1^W0esq:%144#+<VdL4EGIMDBNG*@<6KQ,%E;L@lGSq4>1bp@;\7<$6UH6+?V;r4q.iA+<Vdh
FCAWpAKYJoCi"'!A7TClB0@Fm+s:B,Ci"03@:O"hB0@Fm+s:B3@<6KQ,%E>b,!HGC+<VdL+<Wdg
@W,e&4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jAN=Tr@SB'd7p'q\=\_IZ@n9]n1Nn(f2ahUu
3G)VhC2H^>EG%:PAQN"fARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CSekB6%rR04@$R
$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KFGA9/l;DfTB0+E)9CFCfN8F!,RC+D5_5F`;CEDfQ9o
+<VdL+<VdL+<VdL+<Y`JBlmp-4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ
,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,
04Z^j6"sn$CN2%C7nclS<&.Ho@s<$*6#TP&Fu<973)j6=C2-O_D-9PG=]7aBARoLs5A4jrAStjT
;^+C7$6UH6+<VdL+<VdL+<VdL+Cf>,E,%Kg@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6
+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j@rH4'
Eb0<5+A*bdDe*EA06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k
%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO
@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>O
FEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ*:b?QYGZeX"2.'3oChRZR3D+C4AOKBU
3+d8D=)]a5;b9MS<C_.6A7mQ,A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLA7]R>04@$R
$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOKCh7^"+E(_(ARfh'4>1bp@;\7<$6UH6+<VdL+<VdL
+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL
+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL
+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!
/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jE'cm'BJie#;fOWl>"378B4>^d2d^]2Al<ML2E"'=DDjq0
G'8%K2-O-9ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Co&"B6%rR04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL
4EGIMDBNG*@<6KQ,%E;N5&t4ODg#\7GAhM4F!,CA+EV19FE8R:Ec5e;B6%p5E-!.?EX`?u+<VdL
+<VdL+<VdL+EM[>FCfMU06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,
Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ_/Mfn*Dg"-_=#a_B758pu<)-S5
7VI'>7;Zm/?VWCs1e06A3(u8D8kgsMA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLA8,R:
04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOO@ruF'DIIR2+DG@tDKKT)Bk(RnBl@lO06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,
Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZEDd$^28pF*/1iZ/E9Qs0A6umK[
EcZJKE(4V^F&ca\<bY\o95n$"<bF'sA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLA8-+(
4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOOF)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL
+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<Vdh
E$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL
+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@
B5D-3@rH3;A8bt#D.RU,04Z^jEc#GG7<2j5GXPsr6Uj[iG?&9f=*8Rc96P,t:H!-0:2"HRA2.,0
<_I'YARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CoA+4>1,,%144#+<VdL+<VdL+<VdL
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au
@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W0Hr\kBk)7!Df0!(Gp%!5D.Oi+BleB;4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL
+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3
@rH3;A8bt#D.RU,04Z^jH=L-%D_Wh#AiECW:fqa;E_8ee=_i%98lTn.F@SelF%U@eH#,lp1,Ca?
ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CoD#4>1,,%144#+<VdL+<VdL+<VdL4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Ai,!KUWEc#6,+EqaEA0>B#D/Ej%FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL
4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL
+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7cA7!1Lj9R8Hp
=^O%1;E&8i=^k6JEd)+q8QU*m=%b5$H>Q;N91M?AB.mh,BllRQCcu?I?WC#K4q.iA+<VdL+<VdL
+<VdL+<Ve;E-#T44>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQ
CghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]%ATT&'DIal"BOPdkAKYr#
Ea`frFCfK64>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL
+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL
+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j:h4Q53(ZYS
8kO,(8MrMDDf96$;g;qb6UY$lDFlg57Vksn:fC>(=Yru/ARoLs5A4jrAStjT;^+C7$6UH6+<VdL
+<VdL+<VdL+D#(G04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#
+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4r
F)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%S8=F<G+.@ruF'DIIR2+E(_(
ARfh'4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es
4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA
+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-
A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j8QfnB3(#Q78k!Q;FAm6k=F#%'3)2/#;G1IZGtq49
7RC*/<+f64=);A"ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+D#XW04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL
+?X^a@;[2tCghC+4X+Ai,!KsgF<G[:G]Y'BDKKe>ARoLs+EqO;A8cZS06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@l>Mp%144#+<VdL
+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#
+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-s
De!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ<CFr@[Eb&!88Q0R^;bT#Z6t&SRB4j(mE'[H3E_oSU
=@dIX6SU>f3))&;A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLB4Z0I04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL
4EGIMDBNG*@<6KQ,%E;N5%eGK+E(_(ARfh'4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL
+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL
+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jB2qhi9MA#Y
6VpiEBP'P48SiKoBgQrGAhe'f<DmC=E`,qXD0Au_8p4&bARoLs5A4jrAStjT;^+C7$6UH6+<VdL
+<VdL+<VdL+D58-Ed0]"@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc
+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%eGK+CT)&+EqaEA9/l6
AT;j,Eb/c(FDhTq+<VdL+<VdL+<VdL+<Y6?ARfk)ANVVeE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<
+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQ
CghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL
+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt
/n8g:04]!2F_t]-F>%/X0lo0Y6"Vfd>&J@m@m`Rq;FF5P1/1S>;cH82>%00h6t&PR9kdsS=DD_5
04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y<5DdmcM04@$R$6UH6+<VdL+<VdL+<Vdh
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%E;N5%e\M@UX'qEb/ioEb0,uATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL
4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL
+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/6p&AU.!Z;b17^
7RD6<G&D+sDHBeL0M5#A1GDLC7T<iCB66p>G"m7&CG070BllRQCcu?I?WC#K4q.iA+<VdL+<VdL
+<VdL+<Ve>Ec=,o@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6
+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4r
F)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%AVE@<?''@;]TuD/Ws!ApGM3
Ec6)>F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<Vdh
FCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL
+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0f(XT@7rFr;b1##
@s2Tj<,,6.2`Z2*DJN?F1ML\c1J:>`1M:?3<H1TO04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL
+<VdL+<Y<=4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KXNF<G.*BlkJABl7I"G9D!=G]Z&$
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6
+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL
+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL
+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88
Df99)AM.J2D(fF<@s)X"DKIOB0/6XFD-:%EDdQ=]Fa>`7F&GG%Bhg7";f[.o2Jm#9@:VZ5GZ/Hi
8Td%/5qce[BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve?CiF9.4>1,,%144#+<VdL+<VdL
+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<Wdg
A0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W0Hr\kBle60@<iu:BQ%p5+E(_(ARffk$6UH6+<VdL+<VdL+<Ve;ATM@%BlJ0.
Df0VY06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV
+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIM
DBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL
+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZN2,%UjEG&'(CiVit
;L2#<C1La>@ST4(Ak[#,FY.0</PJo63HIehAk=XeA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL
+<VdLC2[WkB4X1Y@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Al,!I=u0fC^I4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0
+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%E>a+Cd,b,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\hB4W3(AftVu@ruF'DIIR2+E(_(ARfgE06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL
+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc
+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL
+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$
Ch55/Df%.<De!p,ASuTCA1oZV3FmDRH#6_:EB./jCN394F'<!(<d.S"7Sn>/AiNFoCfPXu;b:b&
3-R#eA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLC2[WrASc<J04@$R$6UH6+<VdL+<VdL
+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV
+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a
@;[2tCghC+4X+Ai,!KOOF)Yr(Gp%$CCh[cu+D>>&E$/b2EZdtM6k'JG+<VdL+<VdL+<VdL+EqaE
A90jdF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V
@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL
+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/5%8:Mj-J6u?QjE+s&]
=BKKTAQ(L0<H<@[2+KZ&5tFCiFDtk`2g04O9eU'gBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL
+<VeCB07hU4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\t@;BEs@;]TuCi<`m+D5_5F`9GrF)YQ*
4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL
+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc
@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL
+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)
AM.J2D(fF<@s)X"DKIOB0/5doBQ.<\Ecc5"1djcN20)>DF(]DX8P<tj3*9^;9J^?Y@8B[25t5NZ
75&4_BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeCDe!F#E',d^4q.iA+<VdL+<VdL+<VdL
+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(
CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@k])jB6%p5E-!.?EZfFGBlmp-+CQC:DfTA2DfQtBATMr&$6UH6+<VdL+<VdL+<Ve9
ASc:&B6,2;D`f[oE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL
+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0l:NG9K>'d
6r%]5De3Z<91+#<E&0187Wq[>@mrq39lWi^DFH9u9PRX=04e[.F?aGT4_8M<<Dt)*%144#+<VdL
+<VdL+<VdL+<YN0CLoU]@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc
@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jB4YslEaa'$F!,"-@ruF'
DIIR2+EM%5BlJ084>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL
+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j@8]O/<+0i\9R8X83A"]:@8B`o84PEe
8pN-C1Ke.296j]4DdtRiBl@!)ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Dkq94>1,,
%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0
+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL
+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\nASu("@<?''Ci<`m+EM%5BlJ084>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j1-oDc>"2.Q:15hm6pYQG1,_^K1.YJ+ASjqR
A9]db=[YYMA4CfB?Y*@nARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Dtb7A3;MR4q.iA
+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL
+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\jEb/[$AKYD(DIn#7A8,OqBl@ltEd9c#F)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4r
F)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T
@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<
@s)X"DKIOB0/7TN6?-OV9i4P?E+(GG<G>N02bHIrATVR"6!A5E=F*;610@4H3*/F:;(lKkBllRQ
Ccu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeEDffW4E',d^4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ
%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj
0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg
@k])jGAhM4F!,R<@<<W#Eb-A2Dfd+9DBNS4Dfp#?4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL
+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3
@rH3;A8bt#D.RU,04Z^j0k4!PH:;U>GB[Y99/f4.=*%.lH>\$p?Zp[=6te/f1Gs/j<DI"+CNFDI
ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Du9`04@$R$6UH6+<VdL+<VdL+<Vdh06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%E;N5%S8=F<GI4G9D!=F*&OG@rc:&F?D3tE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<Vdh
FCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL
+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0fWiZEAfgC9/g]D
@VKU:<E+0X3&3cW8T&&oEBuuM>"2%t6?b^m12BI*04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL
+<VdL+<YQG4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\lA8--.DIn#7GAhM44>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jF%pLCAN*Y(Ao(7@ASt+KDer*90l^qe
6:*OdF#SD*9kcV1CfWJi2eOs#ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+E(dQ04@$R
$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@kfea4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KpaASrW$Bk)7!Df0!(Bk;?J06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ
,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l
%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4r
F)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,
ASuTCA1oZJ<AJ&t@S/sa2/Q5j<&dBk<&RcX:ieE^C2ZKt8pEsB<G5<U9kmdI=(<mpA8--MBP]hC
DI6CB,!HGC+<VdL+<VdL+<VdL+<VdLE+*6lA3;MR4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj0Hr[i
$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j
@UWb^F`8I3DIal/@:O'qA8,OqBl@ltEbT*+4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh
@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;
A8bt#D.RU,04Z^jD0SHj:.e#LH?;Vt;)D0e;.;ODDF\tD@7Xo`2,IC,;G((jDf86V:1?LBARoLs
5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+E2?`04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:
+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s
%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N
5&bXd+CT.u+CfG1F)rIEAS,LoASu!h+EqaEA90jdF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6
+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL
+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL
+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7T_>%),?
GtCP$<cM/K@4cG06Y]tL:,Y^ZDKU2)A8Q3[6u=r,DacQB=YF>sBllRQCcu?I?WC#K4q.iA+<VdL
+<VdL+<VdL+<VeGF`]`!@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc
+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5'(gaEb-A3@VTIaFE8R=
DBNJ(@ruF'DIIR24>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL
+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL
+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#
+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j:I?s=
:0'_n;K,6<9N5\%2/m>6E&^L+G]72-1jXI,2d0`]B3Jb!5qQ_&ARoLs5A4jrAStjT;^+C7$6UH6
+<VdL+<VdL+<VdL+ED%+A3;MR4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"
E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL
4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]$AS5^uFCfJ8A8,Oq
Bl@ltEbT*+4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jG&1&Z8oermG[bkR<(B])G"?R_3,h\pAnbCN
95ZLc7!UXXEEQ:#2d^VZARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%7FC[Ke@6P,-
+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#
+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL
+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5&t4UFDl22+C\bhCNXS=A8,OqBl@ltEbT*+4>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jE_^1Q;F3<.=CcG-:JFSb9QWos6ZGbC
75-K3CJRJU@;/P\2gA8;0l0-/ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%:D`f[]
4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE
$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL
+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\sBleA=Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL
+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<Vdh
E$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL
+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@
B5D-3@rH3;A8bt#D.RU,04Z^jGXY,":j6c%;GUq:3Gj%:=#an]3-@St7TiPCCJSVS0h$:UAoVHT
2/Pc8ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%:Df0-24>1,,%144#+<VdL+<VdL
+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<Wdg
A0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W0Hr]$ARf:hF<GL2C1UmsF!,[@FD,T8F:AR"+<VdL+<VdL+<VdL+D#e:Cgh3i
FD5Z2F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<Vdh
FCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL
+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0i1GY:NoK>:el1Z
84@;s=#)He/M2*\6"_ckFuaYSAPGT^>!ZV1EGf5g04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL
+<VdL+<Y]A4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!L$iDBNe)@rcL/4>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6
CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh
@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;
A8bt#D.RU,04Z^j=&_+f@qe:d=A_sm:i]*NGrT\=;Kkl=Guc\";gL`3A2n<]6<[2ADJ`N0ARoLs
5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+EDRG4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>]
,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W
0Hr]$F`&=D@<H[1Ci<s3+EV19FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,Rp
F$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"
DKIOB0/6.';-%B_<&/MdDaRDV6;^9fFZ+M'6ZupG94qFH5tkBUF[9,>@rlU03%niRBllRQCcu?I
?WC#K4q.iA+<VdL+<VdL+<VdL+<VeLF(JlkGs!`g4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC
+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr])
DfTB0+Co2,ARfguGp$U*Ci!Zn+C]U=@1<Pd+<VdL+<VdL+<VdL+EqaEA3;MdE+*WJ%144#+<VdL
+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,Rp
F$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@B
CghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2
F_t]-F>%/X0ht_<7Vaf*@6&%'CfE)`2D%UJ/TtY_3DE:):24B\Dg?JA1hB!c9ij>D04e[.F?aGT
4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YfJATKse@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8
%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N
5&t4VF`M@BGAhM4+E_a:F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE
$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Aj0d8dj$6UH6
+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%E>^,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\C06;)@DE\L:+<VdL+<VdL+<VdL
4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL4>1ecDe+,W%144#+<Wd"
FCAWpANgP1+<VdL4E)EQCghC+4X+Aj1a5*m$6UH6+<VdhF)YQ*+Cf4rF)sJg@k])j-6k6'0KVBM
F)YQ*4q.iA+<Vdh05s)a$6UHR04Jj1Gs2ZE4>1AiD/;BF$>OKiE+*d(F##IF67sa&De*fqEc#k?
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
Ao_g,3XlE*$>=O'E&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0F\?u$=Rg_+Cf>/Gp$gC
+EVNEFD,B0+Co2,ARfh#Ed98H$>OKiE,Tf>1,2Nj/h1USA8lI.F<GWV/KdY]6m-GeF*)AADe!@"
F)Q(AF(96)E-*]T+:SZQ67r]S:-pQU;flGiASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/ARfk)
ARlolAoqU)+A,Et+DGm>Ci<`mARmD&$4R>;67sBpDKBr@AKZ2.+CT;%+DG^9@UX=h+:SZfDe!p1
Eb0-1+=CW,F(H^.$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF*(i2F<G=:A.8l\De*d(+>=63%15is
/g+tK@:UKqDe*s.DesJ($=e!aF`MM6DKI!K@UX=h-OgD:+Z_;"4DJeFF*VhKASlBpFD)dEC2[Wo
G]\![C2[X)Df9H5/no'A-OgCl$;No?+EVaHDBNG-D/Ej%F<GU8FCf?3Bl@l3Df-!k-oiG31bgF%
0b"J)De*g-AT0CZ:-pQ_C2[X%Eb024F"Jsd8l%htE,oN/Ec5H!F)u8?+EM%5BlJ/H%15is/e&._
67sBZFCB9&D.RU,F!,17+EV:2F!,O6EbTK7+CT;%+D#e/@s)m)A0>>mAoD^$+A,Et+DGm>Ci<`m
ARmD&$4R>;67sC&Df?h8AThX$+D#S6DfQtBEa`o0AoD]4@rHC!+A,Et+EqaEA9/k&$>OKiF(Scn
C2[Wi+?_b.0HsjH4!5nC:IH=(=]89g9cunk8PE,^762Q-@<6N58g%\cEc5t@/Nt:),$uHD+BplL
0f't60esk!-R)n?>9I2\$4R>WDe*p7F*(u1E+*j%?[?'B3\qm>+>=63%15is/h1USA93$;FCf<.
@<?0*FtG9gE+*j%+E(j78l%htF*VhKASiPA+>4jZATDX%DIIWuA1e;u:-pQB$;No?+AQisANCrW
@;KXg+D,P4+A*b7/hf"&@;]Tu@:F.uAM+E!:-pQB$;No?+Dl%7@:VDA+DPh*F*VhKASlBpFD)e,
Cf"_XCh4%_:-pQB$;No?+<VeADe*p7F*(u1E+*j%+=Co@@<6O%E[M;'%15is/g+\9Anc-oA0=Je
F*VhKASiQ+De!3tBl@ku$7KY.@<?0*-[oK7A8c@,05"j6ATD3q05>E90./2"Gp!P'.1HUn$=e!a
CghC++=CT4De(4)$;+#Y;cH1`4ZX^#De*p7F*(u1E+*j%+=Co@@<6O%E[MtP+<VdL+<Ve%67sBk
AS,@nCige:@<6O%EZcb[/no'4.3N5:Ch4%_8l%iO;GTbF3Zr0UA93$;FCf<.@<?0*-YdR1E,ol/
Bl%?5Bkh]:+<XEG/g+\9AmoguF<GOCDe<^"AKZ&(EbTK7%16igA8lR(D)*tB5seOB<(o_D3ZoeB
:IH<R1asPUDIal3BOr;Y+Ad)sC1Ums+AH9^@:s.l-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\
/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue+DbIq+EM47
GB4m?Dg*<r:IH=6DIal3BOr;Y+Ad)sC1Ums+AH9^@:s.l+Ceht+C\n)F`V,)+EVO7ATVTsEZe(b
Gp"jr0K:Eh$;<`P7ScBO;a!/a0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38l%ht@;]TuFD,5.8g$rNDe`in
F<F:dDII0hEX`@J:IH=6DIal3BOr;Y+E2@>C1Ums+DkP)@:s.l+CT;%+EVgG+Cf>,E,96*ASuTu
Ed8dKDe=*8@<,p%FDl)6F!,R<@<<W%@;[2sAKYPmF(oH9+Cf>,@VK^kA0>r3+CT)&+EV:.+D,%l
Bl%L*Bk;?.De:,$DffY8F*VhKASlK2@ps6t@V$ZjE,]W-ARlp*D]hXpE,ol0Ea`g%Bl7Q9+B3#c
+A,Et+EMgLFCf;3BlnE-Ch=f6@<3Q1@<-I+Gp$X/G%GK.E+NQ&F`V87B-;8<@qZunDBNA,E,ol*
@q[J($4R>ABPDN1Cggcq@<6L4D.RcL%13OO-o!.n<+ohcC2[X(Dfp)1AKYDlA8c?.BOPs)@V'+g
+DG_7FCB!%ARmD&$4R=j1+=>3+FZpY6r6cW8ju*H+D,P.A7]d(E,TH.FD5W*+EVNE-u*[2A7]p5
-Z^DNDf9_?A8-'q@ruX0Gp$d/F!+q'ASrW#Df00$B6A6+A1e;u%14L>.3Lo!IS*C(<(0_b+D,P.
A7]d(E,TH.FD5W*+EVNE@3BZ'F*&O8Bl[cpFDl2F+D>2)+C\nnDBNG-DJ!TqF`M&(/e&-s$<1pd
Bl8!6@;Ka&FD,5.C2[X(Dfp)1AKYDlA8c?.F`V+:FD,5.8g$r=@r#LcAKX]UDII0hEZee.A0>u-
ASrW2F`&=DBOr<&@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;D\9gME@+B)9<73G`/
<?P"3<^e,s:.-4&78?-C73GQ#73G9"5suh`8OHHK:JO2R8OZQ#8PUC-84=Xp5uU`*;cH1^+AYHL
<(KSZ+A>'f/e&-s$<;.Y+A+#&+Cf>-Anbn#Eb-A8Df9G7FDi:CATT&D8l%iO;GTnR6W>1:DIal=
8l%iS78m/<%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Ad)i+CT.u
+AcutF<FD#De!@"F)Q(A;e'i^E--.1$<1\M+A*bqEc5](@rri1@;]LdATAo%Ci"$6F!,UHATDi7
FDi:4AS,XoAKYE!A0>H.ARfk)AKYE%@VKq)@<-W98g&(nAKYE!A0>i0F*&ODEc5H!F)u8?+EM%5
BlJ08/g)9<BOu'(@3BN0De`inF<G:=+<k9;Bl%l8+EV:.+E2@4E,ol,ATMp2EZfF5EbTK7+EDUB
F!,(/EcZ=R+D,P.Ci=N/A0>?,+EV:.+Du+<D..6'@WcC$A0>i3De!@"F"AGGDes6.G@b;-@X0)<
BOr<*Df^"CE,ol,ATMp2E\8IW<+ohcE,oM4@;]TuE,Tf>+E2@>@qB_&DfQtA@rc:&FE8R5Eb-A8
BOr<%AU/>>FDi:EF(oN)+A,Et+EqOABPD?,FD,5.8g&(nDe`inF<GF/DII0hE\7e..1HVZ67sC&
BOr<*Eb-A%DIal/Df^"CE,ol,ATMp2EcW@3Eb-A(AS,XoARlotDBN@1E,ol3ARfg0F!)qbBkhT0
Anc'm/e&-s$;No?+=LuCA8lR-C1Ums/no'>.3NSMAKYE!A0>i0F*&ODEc5H!F)u8?F!(o!%15is
/g*tg77(!G9LM?A9LV**+=DV1:IJ#W:J+&C<%i<&EbTK705>E9E,oN/E,o\GBkh]:%13OO:-pQU
:et"h6<-TN6q0aA76N[S-[nZ`6r6cW8ju*H06:WDBlJ/IC2[X%Df^#>Eb[4@C3(a3$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBM_oASrV_:IH=HDfp)1AKYMt@ruF'DIIR"ATJ:f<,WmnCi"68FE1f3AKXT@6mm$u
F`V+:GA2/4+EV:.+E2@>C1Ums+DkP)@:s.l+EqB>GA1l0+E_a:+A,Et-Z^DKGA\OEDfp)1AKYMt
@ruF'DIIR"ATKIH%13OO<+oue+EMX9E$/S1F*2>2F!,R<AKY`+A92[3EarZ'@:WneDBNV$F!+q'
ASrW$Dg-#9@:Wq[+EqOABHVD1AKXfX@r#LcAKX]UDII0hEZee.A0>u-AKXT@6m-PhF`Lu'+Co1r
FD5Z2@<-'nF!)lGDe*BiFt"sb-u*[2.3N&:A0<:CFD5Q4.3N;4G%De*AS#a%F(KH9E%W7U;KZk"
FD,5.Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F!;`@Afu2/ATME*A8,OqBl@ltEbT*+
+CT;%+Du+>+EM+9F`8rB$7QDk:-pQUDfB9*+E).6Gp#^T6m-PhF`Lu'+Co1rFD5Z2@<-'nF!(o!
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgCl$;No?+F.mJ+EM47F_kS2BOQ'q+EV:.
+EV:;ARuuV:IH=HDfp)1AKYMt@ruF'DIIR"ATJu4DBO%7AKYr#FD)*jA8,S'+>=63%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@BgR@r!398l%iO;GTnR6W>1I@<?/l$:8<9DfTD3AU&<;@:OCnDJ()6BOr;7C2[X%
Ec5](@rs>;C2bUEAnc'm+D,Y4D'3q6AKXT@6m-PhF`Lu'+Co1rFD5Z2@<-'nF!,=.CLnW0F`M%9
."4ca6r6cW8ju*H.3NSJBl8$6+EVNE-u*[2A7]p5-Z^D8F(96)E-*45Bl[cpFDl2F/e&.:%15is
/g*_t+EV:.F(HJ5@<?1(+CoC5DJsV>D..NrBHVG=AKXSmF!+t2DJ!TqF`Lo4Bl@l3FDl)6+EVNE
F(KG&$;No?+FZpY6r6cW8ju*H+EVNEC2[WnATfGB+C&ttEbTK7+Co2,ARfh#Ed8*$%15is/g)9U
Ec5](@rrh9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLC2[WnATf2$F(96)E-*33$7L"7Ci=N/
EZf+9@<?0*-[nZ`6r6cW8ju*H>]XCqBlJ0!-Rg/i3ZrN_Ci=N/EZcPY-W<B1?RIBQ4*s#8/jrN%
<(LA';cI+28l%in@VR>C-XS51$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFCcRkEc5](@rrhf@;]Ld
ATAn_Bl%@%%16'JAKXSf:i^JhARfg)9jqpJB4Z*+F*)>@ATJu&Cht55Ec5](@rri6ASbdsARlot
DJ!g-D..O#Df-\3DBN@1.P>FME$0+?De`inF<G10Ch54A+Ad)sC1Ums+D,>(ATJu&Eb-A)F)to1
FD50"Cj@-q+EM%5BlJ08+EqOABHU_+A8,XfATD@"F<G10Ch4`#G][M7F(oQ1/g)99BOr;7C2[X%
Ec5](@rs>;C2bUEAnc'm+DGm>F*)>@ARlotDBO%7AKXT@6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Rn/
.1HVZ67sC$F`&=1+A,Et+EV%7FDku6B6bVAATMr9F(96)E-*4ED]iV9FE1f"F<GI4@qB^iEd8dH
Ec5](@rri*Bl%@%/e&-s$?C61+=D5AFEMP0C2[X%Ec5](@rs(@+AP6U+ED%7F_l/@+EM47F_kS2
@;Ka&0dh#O$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM\_G%kStFCcS:D]jL$:IJ#W:J+&C<*XKSEbTK7+Co2,
ARfh#Ed8*$:N0l_+EV:.+Ad)sC1Ums+AH9^@:s.l/0Jh=G%kStFCcS:D]gHW8l%iO;GTnR6W@<3
@rc:&F=A>@DIal.E+No0-u*[2E,ol3ARfg7BkhT9%14Nn$;No?+DtV2BkLjrAKZ)5%16ih@<?0*
-[nZ`6r6cW8ju*H>]XCqBlJ/A%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[aF_PZ&+D,b4Cj@.5Df'?&DKKH#
+A,Et%15^'6m-PhF`Lu'+DGm>F*)>@ARlotDBNJ(@ruF'DIIR2+Cno&@:EYdATKIH+Ad)iF)rIG
BOr;_Ec5](@rrhf@;]LdATAn;6?R!YA0N.*F`__DDBO%>+D58'ATD4$AKZ&4F`Lu'+EM%5BlJ08
/e&.:%15is/g,+RATMo8FD,5.:i^JhARfg)9jqpJB4Z*+,!pEdCh+_4@Wcd7Df-!k%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@:*eGB7=<8l%htF)Q2A@q?)V6"Y4MEZeh6Bl%<oDJ()6BOr<*Ec5](@rri=Dfm14
@;[32Bk;K28l%htF)Q2A@q?d$DBO%7AKYr4De`inF<GF/DII0hE[PoN,#`E&EarZ)+EV%$/e&.:
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!8l%htF)Q2A@q?)V:i^,gF(oN)+EV:.+Ad)sC1Ums+AH9^
@:s.l-Z^CS9Q+?M+s:?;FEDG=+Dbt)A9/l%+D,b4Cj@.5Df'?&DKKH#+EMIDEarZ'Bl8$2+CSc%
Bm+&1@r,RpF(KDF+<XWsBlbD2F!,UHAS-($+D,P4+Co%mF_>?$DJ()#DIal$G]7J;EbTE(+A,Et
+Cf>#AM+E!.1HVZ67sC"Eb0<5+EV:.+Ad)sC1Ums+AH9^@:s.l+<jKt@:UPk$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMi"DBM8SF(o,,8l%htFCfN8Et&IBDBNM8@;Tt"AKZ)+F*&OG@rc:&F<G7*F!+q'ASrW'
ASu("@<?'k+D,Y4D'2GH6m,oUA0>o(An?!oDI[6g/g)9'AS,k$AKZ#9DJj0+B-;;0BlbD<@rc:&
F<G(6ART[l+EMI<AKZ)+F*&O8Bk)7!Df0!(Bk;?<+<V+#%16'GF*&O8Bk)7!Df0!(Gp$U;ART[p
Df-\<AT;j,Eb0;7@3B&uDJ!TqF`M&(+FZpY6rZTR<$5^cEb/a&DfU+U%14Nn$;No?+CfG'@<?''
FCfN8+Co1rFD5Z2@<-'nF!*%WD..=-+A,Et+EV19F<GX7EbTK7F!,L7An?!*FDi:DBOu6r+Co1r
FD5Z2@<-W9DIIBnEt&IsFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqPBPDN1F*(u4+EDUBF!,R<AKYr4De`inF<G[:F*&OG@rc:&F=n[Y<+oi`AKYE%AKYhuDL!@C
FD,6++EV19F<GX7EbTK7F!,OGDfTE"+DG^9FD,5.8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*+
/g)99BOu6r+EM%5BlJ08+E2@>G%kJu+Du==ATD^3F!,%=@;Tt"ATJu4Aftc*G9D!G+E_a:+CT.u
+CS`%F(HId:IH=LDfTB0/e&.:%15is/g*u2ATMo8FD,5.:i^JhARfg)9jqpJB4Z*2F!)Z+ATMr;
+C]J8FDl%L%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bDf0'$F`V88D@HqPBPDN1CggcqF(fK9ARlosDg*=G
D]j1DAKXT@6m-\fFD)e=BOr;Y+Ad)sC1Ums+AH9^@:s.l/e&-s$;,5MDBM>"+@9LPATA4e:2b;e
D.7's+>PW)2[p+'@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/
Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>
Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3
De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6
EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU
@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P
6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9
-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:
+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+
DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&
D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YU
G%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3
Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?
+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$
A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6
>9GX0$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et
+DG_7FCB&sAISuWE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4^u$=e!a
CghC++=Cl<De(4)$4R>;67sBmDes6.GA1r-+CT;%+D>2$A9f:GBkhQs.3NGF@ps1b+EM47Ecbf6
FE9JP$4R>;67sC"Ec5](@rri7BQ%p5@s)m7+>"^YF(HJ*G]7J5@qg$-%15is/g+\9Anc.)Bl@m1
+EMHDBlk_D+D"u&Gp%3I+ED%7ATT&:BOr<!Ec6)>06;8MFCbmg@:q_a+>Y-$+=CoBA7m#nA7T=n
E$0ER%16Nb4ZX]A+?CVm-u*[2F#u0,+CSekB6%r6Gpa%.A7n%d+>Y-$+=CoBA7m#qASc""E$0ER
%16We4ZX]A+?CVm-u*[2F#u0,+Co&"B6%r6Gpa%.+<Vd9$;No?+ED%*ATD@"@qB0nB6%p5E$0@C
Eb'56DJsV>Bl5&+Ec6)>%16ut4ZX]A+?CVm-t-q.Eb/j(+<Z(b+D5R@+>#2gB5Tjb+D5_6+DPh*
B.",q+<Vd9$;No?+EqaEA9/l-DBNS4Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CVmGp%6NARo7q
+FPjbB6%r6C2[Wq-OgD*+<V+#:-pQUB4YslEaa'$+=84P@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$
3ZoeeCi^_6De*K'>9J2=%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!.9
DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%13OO:-pQUEcl7BFCB<6Des?)
Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`
F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s
4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp"AGAhM4Et&IiB0A9u><3m?CiF9.+BplL
I4cXTEc;Hp%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4
D'3>,A7[e2$;No?+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<Y?<+>P&^:-pQUB6%p5E,uHqBQ?6s
+>GYp3Zoeq+D>S1DJUGD/g,E^Eb0E4+=ANa-QlV9Gpa%.%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#
@<?4%DBNP0EZf7<DKg#>A9/1e:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is
/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp7%3ZoduGUtg'+E2IF+F-%\
Bl\9:@rH4$ASuTs?V4*^FDl)6F!,]MA8-+(+F,=D$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'
DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$-R`j`/orHa,CUae/itb6+u(3]
4YAE2B5DKqF!a(g4YD.8Eb0E4-RU8h+Bot6-OgCl$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&Ie
De!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k
4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9
?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!
DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g+_9BlkJ-Df'?"
DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g+_M@;Tt"
ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2
@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`in
F<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`
CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!hD(:-pQU0d(LR+=D,KC2.Zt
-QlV9F)>i<FDuAE+E(d54$"a(De*BiFs(O<A0?#:Bl%i<%13OO:-pQU@s)g4ASuT4F*(i2F<G^F
%15is/g,4PDfp/@F`\aEA0<rp-Z+'=@q-X(FD5Q4-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1
ATDl8-Y[=6A1%fnC2[X(Dfp)1ATMF)F`9)j:-pQ_C2[X(Dfp)1ATMF)F`8HG+EK+d+<Y07ART[l
F!)T6DIak4+Dbt)A9/k9+A,Et+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.Ao_g,+A,Et
+CoV3E-!W@$;No?%15is/g+,,BlbC>+EM%5BlJ/:+<Y07ART[lF!)SJ@;]Tu+Dbt)A9/k9+EV:.
+<X9P6m*TpA7]pqCi=90ASuT!$;No?+Co1rFD5Z2@<-'nF!)lGDe*BiFt=aYC2[W6+E_d?Ci_$X
+<XX%+EDUB+EV:2F!)TH@rc:&F<D]JBOqV[:-pQUAoDL%Dg,o5B-;&6F*&O<DerrF%15is/e&._
67sC(ATD6gFD5SQ%15is/e&._67sB7.3M5*2D-\.0/kL;GT^jGF*&O6AKY])F*(i,Ch7-"Df-\!
Bl7I"GB4mFEZe%iDKU1V%15is/e&._67sB8.3MT'AKXT@6m,oKA8c?.D09oA+C\n)Bl8!6@;Kak
A1f!)F(HId5tiDCD]ib3F*(i,C^g_H67sB'+<Y<.DImisCbKOAA.8l@67r]S:-pQU1+=>FBOr;Y
:IJ,W<Dl1Q+CSekDf-\7F`VXI@V$ZrDKBo.Ci!Zn/g+/8AKXT29H\Fq+DG_7FCB!%%15is/g)8Z
+D58'ATD3q05>E9F)Q2A@q?)V:-pQB$;No?+>YGh<+ohc8k)BG78k=;A7TUr+Dl7BF<G%(+DG_7
FCB!%ARmD9<HD^o8jQ,nFDi:9DKBo.ChsOf:-pQU+<Ve;@<>p2C1_0rATJ:f:-pQB$;No?+>bMi
<+ohc>"MO57S-9B;]oLZA8c?.D09oA+C\n)Bl8!6@;KakA1f!)F(HId5tiDCD]ib3F*(i,C^g_H
67sB'+<Y*5@kW.BE"*.L67r]S:-pQU2(9YIBOr;sBl[cpFDl2F+CdH;C2[WfC,[h$>TbG=Bl5@B
DfQsRBQ%a!07+s8:JF9+05>E905<F"0eXXtCh[d0GUX(/:-pQU+<VeDF`VXI@V$ZnD/aTB/e&._
67r]S:-pQU2CTbDD]hYJ6m-#S@ruF'DIIR"ATJu<Bln#2DIIBnF!)lGDe*BiFt=bNDe(CAF`_>6
F"&5CG\M5@/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
0l:?E1,KFI:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%17,eEHPu9AKW@4Bl%@%+EV%5CERY/B4Z<1A8-'3%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!
@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ATV?pDK?qAFE2)5B-:Yp
AoD^$+D,>.F*&OC@q0Y%Eb0,uAKYo'+=MI`%16QUAoD^$F*)Fc3aEkT/q+ot-7ER\IORN1>9H?e
+C-E*$4R>;67sC$ATW'8DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><@rH4$@;]Us+CT=6FCf]=+EMXF
Bl7Pm$>=@!F?MZh3Zp1$3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H%13OO:-pQUD..3k+CQC'
Bl[cpFDl2F+=JreF*1u&ATMoD+>=pM@;0P#Eb-[/$>j3eARoLq4ZY;@3]/$@3\WT($4R>;67sC)
EbTW,F!+m6Ch[s4+E(j7@X3',F!,RC+D,>(AISujEbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+
.1HUn$?Kd#F`;)6A92[3EarZD3Zp4$3Zp*c$4R>;67sa/ATW'6C2[X(Dfp)1AKW+=/M/(f@rc-h
FCfM9+CT.u+<VeCDdd0t+<Ve!:IH<JA7]pqCi=90ASuT!$;No?+Co1rFD5Z2@<-'nF!,(8Df$Uh
:IH=9F_u)=/e&._67r]S:-pQUD/X<#A3(hUF(KH9E,'<%F)Q2A@q?d*F\-4`DfTCu$4R>VAhG2X
/nS[>BleA=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9D..L-ATBD;C1\h9A8a(0$6UI4D/XQ=
E-67F-Ugp2:Js4r8l%ht@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8Ec*K=$>"$pASGa/+>#3X
AU%p1F<G=:A9qs/4Y@jlE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1AM/:C
E$lc=D_;J++<Y`BDfp/@F`\`R78d#Z;E>pm:IJ,W<Dl1Q+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)
+ED%8F`M@P%16Z_F(K&t/g)_uAn?4$F*&O>E+*j%+=DVHA7TUrF"^sB@kW.BE%cNLBl%@%/no'A
-Qlr</e&.1+EMC<F`_SFF<Dr";Gp:g3ZqTt:`r5!9LVl&@:WneDBNY7+Du+>+DG_7FCB!%ARm/2
Eb0?8Ec*K=$>"*c/e&-s$;No?+DPM&Ch7Z1@V'%XD.OhuDBN@uA8c?.Bl5%c2[p+.AhG2X/kJN)
2BZOK/e&.1+DGF?+>#3XAU%p1F<G=;@<?0*-[oK7A8c@,04\L5@4uA-Bl%@%05>*5Ch7Z?Bkh]:
+CoCC%144#+<Y`BDfp/@F`\`R78d#Z;E>pm7S-9B;]oLZA8c?.BlbD7Dfd+9DKBo.Ci!Zn-QmG@
FEMVA/e&.1+D#G$/e&/!DIb@/$4R>_AT;j,Eb-@@@<,j2H>.=OH=gl-ATK4.$?B]tF_Pl-+=Cf5
DImisCbKOAA1%fn%15is/g*b^6m-PhF`Lu'+Co1rFD5Z2@<-'nF!,17+ED%:ATDj'+E1b2BHV56
A7]cj$=mj\FE9St+?MV3F`_>6F!,49A0>W*A7T7p-OgDsAhG2\+D!/JA8,OqF!,$H+E(d5-RU$I
D_;J++<Y`BDfp/@F`\`R78d#Z;E>qADf'&.8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++D#e3
F*&cPEb0?8Ec*K=$>"$pASGa/+<W?\AM,)RA8,OqF!*"\/j:C?-SB+JF!iCZAM,*P/g<"mH=U`1
+DPh*H>.=@A8a(0$6UI4D/XQ=E-67F-Ugp2:Js4rD/"'4Bl7Q+A9Da.+EM%5BlJ08-QmG@FEMVA
/e&/!DIb@/$4R>WDe*m,Dfe,p+=AgWDe(LK%16f]/g*_T=%Q.0A8a(CC2[X'Df9_\/g)NO3[ZIn
De*m,Dfd*2$>"$pAM,)7$6UI+De*m,Dfe,p+=KoQ+>#3p+D>\7F<DrB@q]d',Y1^*740N8C2[X'
Df9_?%16ZaA1e;u%16inATDj+Df.]j+=Afi+C\noDfTE1FE/Ka+Z_>7+=ANG$>OKiA7]ppBlZ?h
+DPh*Ec5l</8B?>EcYr5DCd.g-OgCl$>F*)+>=p$+<rT`A8-',C2[X'Df9_?A8a(0$6UI.@;BFb
BlY=YC2[X'Df9_,$6UH>-V@0&+EDC=F<G+.Eb/a&DfU+N.3NhTBlmo/C2[X'Df9_K-YdR1Ec5l<
/p)>[-OgD*+DkP&ARoLq+?XCWA7T7pA8-&n$6UI4D/XQ=E-67F-V@0&+EDC=F<G+.Eb/a&DfU+G
@rc-hFCeuD+=A^TDe*BiG%><-%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4rDJsE(D/aTB+A,Et
+EDC=F<G+.Eb/a&DfU+G/Nt:)/8B*6Ec5l<+ED%8F`M@P%16ZaA1e;u%15is/g+YEART[l+Co1r
FD5Z2@<-'nEt&ItD/XQ=E-67FDIn$&+=JpjA8,OqF"&XgC2[WnAThTuE\':+HXpi#FE8lm-ZsNF
Ch\!*ATJu)Bk)7!Df0!(Gpa%.F)>i<FDuAE+Dtb7A0<9THXpi#FE8l^-u*[2A7]ppBlYad0mdGF
@ruc@4""c]A0>r3F`Lu'+Cf>#AKYMt@ruF'DIIR2-OgE(D/XQ=E-67FDIn$&+=K!lA8,OqF"&Xg
C2[WnAThTuE\':-HXpi#FE8lm-YdR1+Co&,ASc:(D.RU,+Co1rFD5Z2@<-W@%13OO:-pQUAU&<;
@:OC%@;]TuEcl7BA8,OqBl@ltEd8d<F_u(?F(96)E--.1$?U-(E+*j%4Y@jlE+*j%+=DV[ASlB>
-OgE)D/a$.D/_Wj+EVI>E+*j%/14tND/_+AC3(a3$4R>SDfT2qBk)6;+Co1rFE8R8D_;J++<Y3/
@rsjd+?O+J@rr.e+<Y`BDfp/@F`\`R9Q+?MBl7QE+=A^NBk)5o$6UI%F_u).@<=Xb+F8'>@:UK/
A8,Oq/13&aC3(aO4)/\EH>.=-$6UH>FDj]G;cFlMF_u).@<<q@GB.D>AKZ)3E+F*.E"*-s+AP6U
+DG_7F`M%9A8,OqBl@ltEd8dH@<?0*DfTB"EX`?u+E(d5HnHg23b2r7FC/a"A7^!7HS/iC@ruc7
>9G^EDe't<-OgD*+AP6U+Dbt)A0>E*D/^V=@rc:&F:AR"+>=s"0H`K"D/a$.D/]pk+<XEG/g+kG
F*2M7+EqB>Eb0)rBl5&-DBO.AEbfB,B-;#/@ps1b%144#@rGk"EcP`/F<G[BE,9H&?U6tDFE1f2
BK8(5?O[>b+AP6U+ED%+ASu("@<?''@rcL/F!,L7An?!oDI[7!%144#FDYu;AS-!H/g)hjB5DKq
F!a'nI4cX_AThu7-RT?1+<Y`BDfp/@F`\`R6ZR*dF!,L7An?!oDI[7!+D58'ATD4$ARmhE-S/eB
@rr.eASu$2%13OOF)>i<FDuAE+=C)f6UO:@;`Z%AAS5^uFCfK(A0=K?6m-#S@ruF'DIIR"ATK4A
>9G^EDe't<-OgE(D/XQ=E-67F1a$^I+=ANG$7QDk%17/fFEMP;De*p-F`Lu'+>=63%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16ocDKU2ADffQ3?W:-,1,Va>
DKU1H;fH;XBkD'h+AQisATJu+DfQsm:IH<Z/ibO>+=KrmGp"jr0ek*d$4R>ABPDN1BlbD=BOr;u
Bl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g*JlAoD^$+E_a>DJ'Cc8l%htDf-\6
Bl8'<+DkOsBPD?qF!,F<ARTXk+ED%%A0>u-ATME*DJsW.F"Rn/%14g=+A,Et+EMIDEarZ'@rGmh
+DGm>A8-+,EbT!*FCeu*Bl5&8BOr;Y:IJ,W<Dl1Q+CSekDf.0M8T&Tk@;Ka&FD,5.%15^'6rQl]
;F<kq@:WneDBNA*A0>o8DBO%7AKZ&(EbTK73XlE*$6UI?@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9F)Q2A@qB^mFEMOTBkh]3%13OO<+oue+EM%5BlJ/:Bl8!6@;Kb$+EV:.+A,Et+Co&,ASc:(
D.RU,+Co1rFD5Z2@<-'nF!,UHBl7Q+D0[7EARfXqD.RTqARlp&@<?0*F*)GF@ruj6AM+E!6"Y4M
EZfCFDJj0+B-8U;De*p-F`Lu'F(KH9E%Yj>F"&5WDfm1DBQ&$0A0>r)AKYMtEb/a&DfTQ'F!,:5
CLoOL-mrbJBPo1?BlbD6Gp"A':JF8,%13OO+<W=NDf'&=C2[d'05>E905<F"0e[9[A7T7p%144#
05,9@AM7e:BPoJ<De(M92_Zs>C2[Vl$6UHEBQ%a!05>E=DD,aCA1q[V0JP5'FD5Q4%144#%16'Q
+EhI1G9D'?Eaj)4A7]glEbSuoA0>T(+D,P.Ci=N3DJ()+FCf<1+EV:.F(HJ)Bk)7!Df0!(Bk;?.
D09oA+C\n)@<Q'nCggdhAM+E!%14j>+A,Et+Eq78+E):7B5)6lCi"A>A7]pqCi=9(A0>f.+BN8p
A8c[5/g+,,AKYr1Ec`FGD]h_fDKU1HG@>P%$=n'mAKYo/+CQBK1*C%?F<FRmF`);D+>GT'0R+^]
H#n(=D(Zr1BOr<)DJXS@9PJBeGT^g:@WGmtGp$U*ChsOfD.-sd+C]U=8l%htDe!:"EcW@;DBO%7
AKWC6F_PB-.3NeFEagXD%13OO+<XEG/g,7S+EhI1G9A;HF_PB-.3L$QDKBo.Cht4d:IJ,W<Dl1Q
+DGq/D'1P^%144#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD*+Co2-E$.5'-YIR9
A90+-$4R=jB6@p!F"&5UDfTW7+D,>*AKYo/+>Ybq@VKp,<FU)gFEJ^"Bl8'<+DkOsBPD?qF"SS,
F<GF/Gp%<LEbce9DBLho+C]&,+:SZOBl8'<+CT=6G@bT,/g)99BOr<,ASkjiDJ=!$+D>\7F<G+*
E+NotASu!lATJu)ATDL.AKYT*Df$V<BOu!r+Cf>,D..<mF"SRE$;+)^+DkP&ATJu;ATE&=Ch[a#
FCeu*F`V+:De:+cBl8'<+EM4-Cht5(Df'?"DIdf@+B)rbCht5(Df'?"DIdf2@<,p%%16TRCi!Zn
+E2@8D..I!Cj@.FD]in8G%E3IEb0,sD.OhuDIal"DfBtEAnc'mF"SS7BOuH3F(fK7Ch+Z4DfTV9
Df-[,$=Rgt+EMXF@;0U%De:+cBl8'<+E)9C<GlMq/g*]'G@br/E\&>*:IH==@<3Q0DJXS@@V'+g
+EV19FCeu*Df-[R1*C%?F<FRmF`);D+Unbf$8X+R8l%ht@rc-hFCfM9BQ%s6+D,>(ATJu&DIal#
Bl[cpFDl26ATJu&DIakuF)uJ@ATJu.F<G7*F!,R<AKYl%@qB_&@<-W&$?BinBQS;<FDi:BART+#
+Eqj?FCcS'DIal,Dg#\7FD,6,AKYT!Ch7Z?+@L?mBl7Q+A7]pqCi=90ASuT48K_tpF<G".C`mS?
%15^'6m-#S@ruF'DIIR"ATJu.DBNeA+='KR9gp0Q05,9@AM7e:BPo7AA8-'q@ruX0GqKO5%144#
:-pQUFDi:FBk;K2G%G]'F!,R<@<<W/@;]duF_kK.AKYZ)F*&O:Bl%@%+=LrAF*(i,C`l>G6rQl]
;F<kqBlmp'+>G;S$6UI0A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%144#A8-+(+?MV3
Eb0,sD.R<nCh7Z1@rH=3Anc'mF!hD(%14p@+A,Et+ED%5F_Pl-F!,LADffQ$+Co1rFD5Z2@<-W9
E+*j%F"AGJ/nHXd+F.mJEZf=0FD,_<D09oA+C\npBl5&;Bln#2@3BW-@<6*)0.m\@%14sA+A,Et
+E_a:F!+(&F!+t2DJ!TqF`M&(+EqC++C]A0GB7>9+CT.u+E1k'+ED%%A7]d6+AH9[AKZ&:Eb-A=
DflKrBOQ'q+CQC%Ec6/CATAo%DIal1ART+\EZfF7FEMOT+<V+#%15[=+F.mJ+D>2,AKYl/F<G(3
DJ!TqF`M&(+CQBb+EqC++C]A0GB7>9+A,Et+EqO9C`m/.FCf<.F<G[D+E_a:+Cf)*Df'32D(T4;
Dg-86EX`@tD]iM0Dg-86+E).6Bl7K)BOu"!/g*_t+F.mJ+CoC5DJsV>BOQ'q+@Bg_Df'&.Bl8!6
@;KakA0<:8De*NmCiCgGGA1l0%16ukF<GdGEbd9:$6UH6%144#+AP6U+E(d54$"a(De*BiFs(O<
A0?#:Bl%i<+BosE+E(d<-Ql/N/g,1GEHPu9ARlooBk)7!Df0!(Bk;>p$6UH6A8-+(+=CoBA8#Oj
E$l)%%16$JD/!fpEbT?8+A,Et+EqO9C`mkAAKZ).AKWXKF)ipFG%ki(AKYr&Afu,*@:Wqi+DGF1
H#IgJBOQ'q+Du+>+EML5@qfOhARlol+E1k'+ED%%A7]d6%13OO2(9Y9:EWD.<$51>73H&U@;]k%
+DG^99PJBeGT]US6m-GWFD,_J+<X!e@;]k%+DkP4+E2@>A9DBn+D#S6DfTnABl5%&$;+)^+D58'
ATD4$ARlp)BOu!r+Cf>,D..<mF"SRX:Mq:VBl7I"GB4mD@:NtbDIml3H#IgJ@ps6tASu!oDf]J4
@VfIjCCLVbDJ!I$FCeu*E+*j%F!,[@FD)e-DfoN*AKYu8DffQ3+Dbb-AKW1,3a>L%DeF*!D'2;^
Ch7Zm+tau\8K_GY+Du+>+EM[GAKYZ)G9D!G%16Wa+EMI<ATVU"DJ()5Bl.R#Bjl$)GA2/4+A?Ke
Fa,$J@<?1(/e&-s$8s=U8l%htFCfN8F!,XECisT++EML1@q?clAS,k$AKYK'ART[pDJ(LC@rH=3
Bl7Q+DfQt@ATMs3EbTE(+C\bhCNXT;/g*r-+BN8pA8c[5%16]fARuupBle&4F)YPtAKY].+ED%8
F`MA2A0>?,+CT.15u:,q@ps1i/g)94DBMVeDKU1HFD,5.-tHp=+EM4-Cht5(Df'?"DIal(F!,UH
ARmD&$<1\M+Co(,@rH4$@;]TuEb0?8Ec,q@Ao_Ho+EML1@q?cpDfQt/Cht52Dfor>ARlp,DesQ5
ATKIH+A!\oDJXS@DImBi+EV:.+Eh[>F_t\!$?TriF<G(3DKK<$DK?pm:IH=9Bk)7!Df0!(Gp$^5
Ch7Z1@Wcc88K_P^+Du+>+DYk5G9CR;G9D!G+Co&*ATDX%DIjr4BOr<0DesQ5AISua@;TQuAo_g,
+CQC/Bl8'<+D,>(AKYr#FD*9L+@p']@q?cS+ED%8F`M@BFD,5.F)>?%Ch7[0+CT,*F`):DDe:,(
Eb/f)F)YPtAKYT'EZbeu@;Ka&D/XQ7FCeu*G&M2>D.Rc@+<XToAKZ).AKXT@6m*miEb/fmBle&=
+Eh=:@N]9$EZen(FCAm"F"SS,AfuA;FWb@+G%De:ARTCkGmt+%D..6s+Eh[>F_t]2+Dl%>DKKH#
+A,Et+DkP4+ED%*F`V+:FDi:3Eb/[$ALns5@:O(qE$0(>+ED%7FDl22+Co1rFD5Z2@<-'nF"Rn/
%144#:-pQUDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C+AP6U+ED%5F_Pl-A0>Ds@ruF'
DIIR"ATJ:f+<Y3/F)W6LAo_HoA8-+#-OgD*+:SZIBl7?qCj@QS8S0)jDfm16DI[U-DKKH1+E2@>
@VfUmF!,UHBl7Q+8l%htE,9)oF(HJ*D..-p+Dk[4@<=OQ@UX%`Eb],F3C%4o@;0O1@rH2n$4R=O
$4R=O$4R=O$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E
:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*-9%15p*5u^<L;GC(Q3[],cDBNb0DKU1O
+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%
@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*
C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*
Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kVM;D/<a$@kVS8A8,plAU#h@
FDYh'$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[X%Eb]GDBkh`!$>OKi
Cggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da.
/no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0ddD;6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^
+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-;;7Deq$K8TZ(nAnGUpEt&Ib
+EqaEA0>f2Bk;1(ARloo@<>pe@<6!&AoD]4@;Ka&FEqh:F!,C5+A*c#DfTB0/g*b^6m)pGF*2G@
DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!,RCDesJ;AoD]4%16Wa
@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh/g(T1%15[E+A*b8/hhMm8l%htEb065Bl[d++EV:.
+D,P.Ci=N3DJ()#A7TUrF#ja;%144#A79Rg05>*5Ch7Ys$6UI"EapbKBlG1($4R>3DfQt;DfTD3
Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G%17#o+EDUB+EV:.
+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df.0O+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKS
DImisC`mP&@N]/hFCf*'Ed98H$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$
@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht
:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/i4pb$;aD^<(9Y]9iF29-[09B
+Dbb0Fa,8V+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]o
F*'$KC3'gkC2[X(Dfp)1AM/:CE"*.hDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[ZC,Rb#
+DNeg1*C<j0JOpa$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'/p_5N.3N>G+CT.1@<,jk
Bm+&1@rH7,@;0UnDJ()5ATDKnCh\3,A0>E*D/]pkG%G]8Bl@m1+E(j7FD,5.FD,]+AKXT@6m-#S
@ruF'DIIR2+Cno&@:EYdATJtBC2[WnATfV>De(DAFD5Q4.1HW+BOQ!*@<,p%F`V,)+EVNE@WcC$
A0>u-AKXT@6m-PrF*(u1/g)9/:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb,[eB5_^!+D#e+D/a<&
F!,C5+D>\;+A,Et+Ceht+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8T#YC
+?(o,GT]US6m-M]EHPu9ATJu9BOr;uDes6.GA1r-+CSekDf0VW%13OO+<Y3'FC?h;Anc'mEt&I!
+CT;#07%>O+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++DG^9-u*[2F)Q2A@q@9=BlGLD@ps6t
@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<H$@A7TUrF"_0;DImis
CbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h
+Dk\3BQ%E6+<W(IDe*p-F`Lu'F(KH9E%Yj>F"&5F@<3Q#AS#`g$6UH6@q]F`CLq$!Df-\!Bl7I"
GB4mA2D-[=/0J[d/hf"&@;]TuCh[d0GT^`[/hf"&+>Ybq@VKp,F*VhKASlK@%144#+AP^3762P_
F<G(%DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&-s$8O%Q;KZk"FD,5.8l%htCggcq,"bX!
+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+D58'ATD3q
+DbIq+Cei%AS5q%GqKO5%144#+A,Et+DbIqF!,.)G%De6Dfd+2AS#a%D.-sd+Cf>,E,9*-AScW7
E,Tc=@:F%a+C\o(G@b?'%144#+BN8pA8c[5+CT.u+A?KeFa,M]+B3#gF!,:-@N]l5Ebf_=Df-\!
Bl7I"GB4m8DIal(F:AR"+<YlBCht5<DfTV9Df-[kBl8'<+CT=6G@bT,3ZrB^Dg#i*ARlp/Dfm15
D]iq9F<G7*G%D*i+<Ve8DL!@9G][A3F<F1O6m-#S@ruF'DIIR"ATKI5$4R>O@;BFpC1K=b5\FqB
Bl#D3Df#pj.1HW'Eb]?-A25l767sa,Eb]?-A0>qF/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is
/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+=\Kh0JGG(@rsFa+>"^EA7T7^+F7X6Ch7Ys$;No?+=\Kh0JGJ)
@rsF[+>"^EA7T7^+@/pn8P(m!+CoV3E,uHq:-pQU.NgK#0K<u\F>5Tp/KebFF(KB6ARloL;aX,J
3&Mh"ATW$.DJ()+DKKe>C2[WnATf22De'u5FD5Q4+E1b0@;TRtATDi$$4R=O$;No?+EMX5DId0r
A0>V0F(96)E--.1$?B]tF_Pl-+=C]2@Wc<+FCB6+-OgCl$;No?+D,P4@q?cK;aX,J3&MgmDBNJ4
D/aP*$;No?+E_a>DJ()5ATW$.DJ+#5Bl5&-DIdI)Bk2?pC`m8&@ruF'DIIR"ATJ:f:-pQU5uU-B
8N8S7@;9^kD..3k?TgFm0b"I!$;No?+F7X6Ch7Z1@:WneDBL?KARuuV5tiD3De!p,ASuTuFD5Z2
+E)-?8g&=lCM>4,$?B]tF_Pl-+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgCl$;No?+Dbt+
@;I'-@rc:&F<GI>F`)7C%15^'6q:-O?[?'B3ZoebDe*s.DesJB%15^'6rR)W?[?'B3ZoebDe*<c
F(o-+ATMs7-OgCl$;No?+E2IF06hMKAdo)8:IA,V78?fL:JFPL:./H8?Q_Km+>=p!+>=63F)>i<
FDuAE+E2?D-[U;;IXNRQ$4R>;67sBo@;]V$+D,P4+E2.*@qfgn+EqaEA9/l-DBNb6@:Wq[+Cf4r
F)to6%15is/g+_G@<6!&-[U;;IXNRQ$;No?+A,Et7oE/+B4Z0--[U;;IXNRQ$7QDk%17/nDfp/@
F`\`RC2[W*E,ol3ARfg)F(KH9E$l)%F`;)6A2Z+s1,2Nj/h2!_C2[W@0JXbl/M/)fE+EC!AKXT@
6m,oKA8c?.2D-[=+D,Y4D'1bi0JP0h$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JP:oAR[AQ%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:Fh
4ZX]55s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$7BP&De(4<B4Z0-4$"a0ART*lGB.D>
AL@oo%16igA2c2e4ZX].+<VdL+=CY[05>E90/kR>05>E9A7]p;F(96)E-*`\%16igA2Z+s@:Wne
DEU$'+=CY[05<C!1,!'HA8c@,05"j6ATD3q05>E90..29%14M(ART*lC2[WA0R,,rC2[W8Bkh]:
.3NhTBlmo/F(fK9E+*g/+DPh*2D?mpA7TUr/151NA1hS2F!hD(-urm-A0>W*A2c2e/151NA9;a.
Ci_4CC3(aO+Eqj?FCcS9BQ&*6@<6K4C2[W@0J['IA8c?:-YdR1AU&<<05>E9FDl)6F"V0AF!hD(
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%13           ~>
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
zz=:zz,'ts001 notopenTests001 zzzJodDictionaryReset''),<<;._1 '' jodmanwintes'
zz=:zz,'ts newdManWin001''                                                  '
zz=:218{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,U11+>P&u+>GW+3?U%4+>GQ10H`),+?256A8bt"ATMrg67s`uDe!m#F*&OH/M/)eATMr9F*)P6
/db??/db??/g+,,BlbD=ATMr9/hSb//g+bEEc#6,FCeu*FCf]=+B3#gF!,R9F*&NW/hSb/+D,P4
D..O.ARlp*AU&;(:-pQU9lG&`+D,P4D..O.ARlosART+\EZek1D/Ej%F<G[:G]Y'MBOQ!*+EqO9
C`jj0AKYT'Ec#6,FCeu*8IA3Z/g+hGE+LXE+B3#gF!)TIATMr9+>,9!/hS7h+D,P4D..O.ARlo+
FCf]=+<XWsBlbC>FCfN8+<W9h/hSa`:-pQUAoD^,@<?U&A0>u*G]Y'&DfTD3AoD^,@<?U&A0>Ps
@:Wqi+Cf>,D.RU,+EV1>F<D]JBOQ!*+EqO9C^Np(/g+V7+D,P4D..O.ARloT+D>\4AM,)J9jr'f
+D>1o+CQC/BlnH5AKYetD.4W3BQ%s'+D,G$ARf9oG@>P":-pQUGA(]4AKYE&+EMF=G9AI[@;]Tu
DJsV>GAhD9+EqL5FCcS(F`\a9De!3iDIjr7BPDR"/g+;8FWba:AI;1!/g*ksEd8dO@<3Q"+D>[G
$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB'+<VdZ/hSb!F`(f0Ec#6,ARlp*AU&;(:-pQ?:-pQU
@rc-hFCeuD+>Pes;e9nj1,(CA+>GQ21c[TS1^XRb67s`V;Gp:g4['u:GAhM4.3N52Bl%i5Df-[M
/hSa`:-pQU1,U1QAT/bI0JGI/0ebXF3BB#S$49Np/h0=^=?Shj@rHC.ARfgnA0<KW/hRJ<:-pQU
F(Jj"DIal!Ci<g!+EM47F_kS2Eb0)rBl5&9DKKf>@q]Fa$49Np/h1CM@ru:'F<GZW/Kf.HF*&OG
FEM%F$;No?$;No?+B3#gF!,R9F*&NW/hSb/+D,P4D..O.ARlp*AU&;(:-pQU<+oue+EV19F<E1g
/hSb!AoD^,@<?U&A0>u*G]X9f67sBTDfTD3AoD^,@<?U&A0>Ps@:Wqi+Cf>,D.RU,+EV1>F<G[=
@<<W9Bl%T.@V$ZoDfT]'FED))+A!\hDfB8?$;No?+B3#gF!,R9F*&NW/hSb/+D,P4D..O.ARlp*
AU&;(:-pQU<+oue+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]X9f67sBTDfTD3AoD^,@<?U&A0>Ps
@:Wqi+Cf>,D.RU,+EV1>F<G[=@<<W9Bl%T.@V$ZoDfT]'FED))+A!\hDfB8?$;No?+AH9bGp$d/
A0>;'Ch\!5Ch4`*@;THrGA(o9AKYT$AS#@_+Eq78+EqL5FCcS'F!,OADg*<U+CT.u+Du+>$;No?
+EqaBC`mq8Blmo/@Wcc8@rGjcBl7K)GA(]4AM,)J=`8F*F(Jo*9jr'f+Eq78+CQC+D_;Al67rU?
67sC(ATD6gFD5SQ$;No?$;No?+<VdL+>,9!/g,:SAoD^,@<?'k+EV1>F:(c0/db??/g+YEART[l
A3(hg2'>h/E$-ni0K:100KM$N3]/`$$@-Q44Y@jk/g)nl1C=J"Bldp0F*'Pt+=D#;-OOU,A7Atg
Bk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPkF(o,,8l%htFCfN8F"Rn/:-pQB
$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MWATMs.De(ON+CT.u+EDUBF!+m6
F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/:-pQB$;No?+CT>4F_t]23Znk=
:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)E[`,IDdd0!
F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@ltEbT*+3ZrKTAKZ)+F*&NQ@rc-h
FCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sBjEb/[$ARmhE1,(C@DJs\R2[p*h67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB72e6K00Jst]A7T7^+=M,GFDl,0DH(1gFE9,i0e"5eD]j+DBlmnq$;No?+>>`bARdGM+CSek
ARlo3A8Z3X@:O=r<+U;rF"&5RD]j+DBlmo//Ke"];cHmc9he&S4ZY8+$;No?+>>`bARdGT+=Lc7
A3s^GBk&hN0e"5RA7T7^%15is/g)i-De!lC2^!3bEc,T/B-;,1+EqL5FCcS9E+*6f+E2@4F(KB8
@<?F*+EVNEF*(i2F<G[:F*)I4$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A,Et+>>E./i5($FCfN8
Bl7Pm$4R>;67s`uAT23uA7]Y#F!*%WFCfN8+E(j7-td(%E-!HNAoD]4F*22=AKYYt@:Wqi%16''
;cHRZ;GAi"4ZY8+$<0Gm<*;L]9gqrC3`JOH<)>kY9e\:E+<VdL:-pQUF(KG9FDi9V+D,P4+CT)&
+Dk\2F(&]mEt&IO67sa!DId9hE+NotASuU2%13OO:-pQUD..]4DImBi+EVNEB4YslEaa'$+=LuC
A9;C(FCfJA%15is/g,"IF!)iFDe*s$F*(u6-QlV9De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^E
De't<-OgCl$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO4tq=>+E(d5-RU#Z+<VdL+<Ve%67sBjCi=B+
+CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f4tq>%A0<7AATMs.De(OL+<Ve%67sC!E+No0F*(i.A79Lh
+AtWo6s!8X<(.oXFCfN8C2[W:.1HUn$7InX3]&Q?+>Fu]:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2
ATDs&FD5Z2+E)-,$4R=O$>OKiD..=+Bl8$(F*)Iu67sa&De*]nDKff4FCfN8F!,NU/Kf+WBlmo/
De:,9Bl7I"GB4mKATMs7+Dkh0Bk(jpB-:c1@;Tt"ATJu.DBMPI6m-#Y@s)X"DKK</Bl@lA%15is
/e&._67sBVE+Np.+CQBj76s=C;FshV+EV19F<G+.@ruF'@<-W9.!0$AFD>`)0I\,QDIal1F`)7C
@3BW&EbT*+%15is/g,(E+C\c#Bk&90Bl7I"GB4mFEbT*&FCeu*FCfN8+EM%5BlJ08+EV:*F<GF7
D/!K&AU%X#E,9*,%15is/g+kG+A,Et+CoD#F_t]-FCB9*Df.TYF(Jo*C2[W8E+EPi$;No?%15is
/g+SDF*2>2F#kEQ$;No?%15is/g)8Z0e"5dFCB&t@<,m$8g&(nDe<^"AISuA67sB'+>PAg-u*[2
FCfN8ATB4BCi<`m+EM%5BlJ/'$;No?+<Vd_.3MMW5t"dP8Q8,$FCfN8+Co1rFD5Z2@<-'nF#kFb
AS!!+ATMr9-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7+:SZQ67r]S:-pQU@rc-hFCeuD+>PW*0lCoQ
0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0emQaFtks!-uNU?A5-KM=(uP+0JP"!@:Wn[A0>u4+EM[>FCbmg%15is
/g,">Gp%!9ARlp*D]i\(DImisFCcRCC2[X)ATMs)E[_G):-pQUD/=89-YdR1FCfN8ATB.@>9Iip
+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$4R>_AT;j,Eb-@@C2[X)ATMs)E[M;'%159Q
HSZd_A0<6I+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%159QHZ*F;-Zip@
FD>`)0IItc+AP6U+E)41DBO"B@;]UaEb$:j76s=C;FshV+=M>CF*)/8A2#GA$4R=j3?^F?0e"5"
+<XEG/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hp^$4R=                    ~>
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
