NB. JOD dictionary dump: 22 Dec 2011 15:56:34
NB. Generated with JOD version; 0.9.7; 8; 22 Dec 2011 15:05:32

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

BAKPFX=:'B'

BYTE=:26

CWSONLY=:'(-.)=:'

DICTIONARY=:5

DUMPMSG3=:'NB. Generated with JOD version'

DUMPTAG=:' NB.{*JOD*}'

ERR0261=:'macro is not a J script - not formatted'

ERR0262=:'not supported on current J system'

ERR027=:'unable to set master parameters ->'

ERR065=:'not enough space on drive/volume ->'

ERR096=:'linux/unix dictionary paths must be / rooted ->'

ERR097=:'invalid dictionary document must be character list'

ERR210=:'unable to copy/move/rename files - shell messages ->'

IFWIN=:1

IzJODinterface=:<;._1 ' bnl del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mg mj mls mt noexp notgrp nt nw obnames pr refnames revonex swex tt usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.7';4;'22 Dec 2011 11:28:40'

JODVMD=:'0.9.7';8;'22 Dec 2011 15:05:32'

NDOT=:'.'

NEWDOCURLS=:2 2$<;._1 ' uses https://docs.google.com/document/d/1BOqiuA3ngVYLsjgclYPM4lmpe5PtOya9afEveoHF9_U/edit?hl=en_US# Jodindex https://docs.google.com/document/d/1si5rIsHqTpkKrqOa3UrXmjbyQnVzxDFHFadTFWmbl-Y/edit?hl=en_US#'

OK0256=:'jod.pdf not installed - starting browser for web version'

OK062=:'dictionary document updated ->'

PATHSHOWDEL=:'/'

PDFURL=:'https://docs.google.com/viewer?a=v&pid=explorer&chrome=true&srcid=0B3hRbt360vl5YTQ0ZTdlNWEtMjY1NS00YTNlLTgwNmQtYjdiZWZmNzU3YjYw&hl=en_US'

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
    NB. insure 'buildpublic' text starts with an LF
    mlscfg=. toHOST ;(<(LF }.~ LF-:{.ld),ld) p} c
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

bnl=:3 : 0

NB.*bnl v-- list objects in put dictionary database backup files.
NB.
NB. monad:  dnl clStr | zlStr
NB.
NB.   bnl ''        NB. list all words in last backup
NB.   bnl '.'       NB. list backup suffixes
NB.   bnl 'pfx'     NB. list all words in last backup starting with 'pfx'
NB.   bnl 're.12'   NB. list all words in backup 12 starting with 're'
NB.
NB. dyad:  ilCodes bnl clStr | zlStr
NB.
NB.   4 2  bnl 'ex'     NB. macros with names containing 'ex' in last backup
NB.   2 3  bnl 'et.13'  NB. groups with names ending with 'et' in backup 13

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ({. x) e. OBJECTNC do. x bnlsearch__ST y else. jderr ERR001 end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc dnlsearch (clPattern ; clDir)

NB. put dictionary directory object
DL=. {:0{DPATH

NB. if y is '.' (NDOT) return backup suffixes
if. (,NDOT)-:alltrim y do.
 dot=. (0<#bn=. bnums BAK__DL){'';NDOT
 ok dot ,&.> 'r<0>0.d' 8!:0 bn
else.
 ok 'NIMP bnlsearch'
end.
)

bnums=:3 : 0

NB.*bnums  v--  returns unique backup ordered list  of dictionary
NB. backup numbers.
NB.
NB. monad:  il =. bnums clPath
NB.
NB.   bnums BAK NB. (BAK) directory object noun

NB. requires first character of all (JDFILES) to be the same
\:~ ~. , ". ({.;JDFILES)&beforestr&> {."1 (1!:0) <y,'*',IJF
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

compressj=:3 : 0

NB.*compressj v--  removes  all  white  space  from  J words  and
NB. shortens local names. This process reduces the readability of
NB. code and should only be applied to production code.
NB.
NB. monad:  cl =. compressj ct
NB.
NB.   compressj jcr 'verbname'

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. local names less any single char names
l=. ;(<1;1){m
s=. l #~ 1 = #&> l
l=. l -. s

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

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

NB. replace tokens
r changetok u
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

NB. object nouns !(*)=. BAKNUM DIDNUM DNAME RPATH RW UF SYS WF LIBSTATUS

NB. no backup directories exist at creation
BAKNUM=: _1

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

dewhitejcr=:3 : 0

NB.*dewhitejcr  v--  removes  all redundant  blanks from  J code.
NB. Result is a character list in linear representation format.
NB.
NB. monad:  cl =. dewhitejcr ct
NB.
NB.   dewhitejcr jcr 'anyword'

tt=. ;:&.> <"1 (ljust@:decomm) y  NB. list of tokenized lines
; (blkaft&.> tt) ,&.> LF          NB. insert blanks, LF's and raise
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

dnl=:3 : 0

NB.*dnl v-- list objects in dictionary database files.
NB.
NB. monad:  dnl clStr|zlStr
NB.
NB.   dnl ''        NB. list all words on path
NB.   dnl 'pfx'     NB. list all words on path begining with 'pfx'
NB.
NB. dyad:  ilCodes dnl clStr|zlStr
NB.
NB.   4 2  dnl 'ex'  NB. macros with names containing 'ex'
NB.   0 _1 dnl 'ugh' NB. path order listing of words ending with 'ugh'

WORD dnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (dnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ({. x) e. OBJECTNC do. x dnlsearch__ST y else. jderr ERR001 end.
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

dropbakdir=:3 : 0

NB.*dropbakdir  v--  erases  backup  directory  nouns  loaded  by
NB. (loadbakdir).
NB.
NB. monad:  dropdir uuIgnore

erase (<BAKPFX) ,&.> DIRIX,DIRCN,DIRTS
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

if. (0<#nouns) *. -. a: e. nouns do.
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
if. badrc names=. dnl '' do. names return. else. vnc=. (names=. }.names -. a:) -. nouns end.
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

get=:3 : 0

NB.*get v-- retrieves objects from dictionary database files.
NB.
NB. monad:  get blcl
NB.
NB.   get ;: 'us poor little words'
NB.
NB. dyad:  ilCodes get bluu
NB.
NB.   2 7 put 'GroupName';'Group documentation text ....'

WORD get y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. loc defwords__ST y
    case. EXPLAIN  do. WORD getexplain__ST y
    case. DOCUMENT do. WORD getdocument__ST y
    case. NVTABLE  do. (WORD,0) getobjects__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) getobjects__ST y
    case. EXPLAIN  do. TEST getexplain__ST y
    case. DOCUMENT do. TEST getdocument__ST y
    case. INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. GROUP getgstext__ST y
    case. EXPLAIN  do. GROUP getexplain__ST y
    case. DOCUMENT do. GROUP getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. SUITE getgstext__ST y
    case. EXPLAIN  do. SUITE getexplain__ST y
    case. DOCUMENT do. SUITE getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) getobjects__ST y
    case. EXPLAIN  do. MACRO getexplain__ST y
    case. DOCUMENT do. MACRO getdocument__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. getdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

getdicdoc=:3 : 0

NB.*getdicdoc v-- fetches put dictionary documentation.
NB.
NB. monad:  cl =. getdicdoc uuIgnore

NB. assumes a put dictionary is open.
DL=. {:{.DPATH  NB. directory object !(*)=. DL
if. badjr dat=. jread WP__DL;CNDICDOC do. jderr ERR088 NB. errmsg: read failure
else.
  ok ,>dat
end.
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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


jpathsep=:'/'&(('\' I.@:= ])})

loadbakdir=:4 : 0

NB.*loadbakdir v-- loads complete requested backup directory (y).
NB.
NB. result is 0 for success and 1 for failure.
NB.
NB. dyad: iaBn loadbakdir iaObject
NB.
NB.   NB. word directory from backup 25
NB.   25 loadbackdir WORD

NB. drop backup directory if backup has changed !(*)=. BAKNUM
if. BAKNUM~:x do. dropbakdir 0 end.

if. wex ix=. (<BAKPFX) ,&.> dnix y do. 0  NB. backup directory loaded
else.
  NB. depends on correspondence between (JDFILES) & object codes !(*)=. BAK
  fp=. BAK,(":x),;y{JDFILES  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.>ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. reset backup number
    BAKNUM=: x
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)

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

nlargs=:4 : 0

NB.*nlargs v-- test basic name list arguments
NB.
NB. dyad:  il nlargs cl

if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
NB. do we have a dictionary open?
elseif.do. checkopen__ST 0 
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

put=:3 : 0

NB.*put v-- stores objects in dictionary database files.
NB.
NB. monad:  put blclWords
NB.
NB.   put ;: 'it where the sun dont shine'
NB.
NB. dyad:  ilCodes put bluu
NB.
NB.   2 7 put 'GroupName';'Group documentation text ....'

WORD put y
:
msg=. ERR001 [ loc=. <'base'  NB. errmsg: invalid option(s)

NB. do not save decommented words - set PUTBLACK to 1 to override
if. -. PUTBLACK +. 9!:40'' do.
  NB. errmsg: white space preservation is off - turn on to put
  jderr ERR023 return.
end.

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _1&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc =. <x-.' ' end.
end.

NB. do we have a put dictionary open?
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. format standard (x) options
x=. 2 {. x , DEFAULT

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (loc;<DL) putwords__ST y
    case. EXPLAIN  do. (WORD;<DL) putexplain__ST y
    case. DOCUMENT do. (WORD;1;<DL) puttexts__ST y
    case. NVTABLE  do.
      if. badrc y=. (i. 4) checknttab2 y do. y else. (WORD;<DL) puttable__ST y end.
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. checknttab y do. y else. (TEST;<DL) puttable__ST y end.
    case. EXPLAIN  do. (TEST;<DL) putexplain__ST y
    case. DOCUMENT do. (TEST;1;<DL) puttexts__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. (GROUP;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (GROUP;<DL) putexplain__ST y
    case. DOCUMENT do. (GROUP;1;<DL) puttexts__ST y
    NB. HARDCODE - lines inserted to maintain put/get symmetry for
    NB. the frequent argument cases 2 1 and 3 1 
    case. 1 do. (GROUP;0;<DL) puttexts__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. (SUITE;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (SUITE;<DL) putexplain__ST y
    case. DOCUMENT do. (SUITE;1;<DL) puttexts__ST y
    case. 1 do. (SUITE;0;<DL) puttexts__ST y  NB. HARDCODE
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. MACROTYPE checknttab2 y do. y else. (MACRO;<DL) puttable__ST y end.
    case. EXPLAIN  do. (MACRO;<DL) putexplain__ST y
    case. DOCUMENT do. (MACRO;1;<DL) puttexts__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. putdicdoc__ST y
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

putdicdoc=:3 : 0

NB.*putdicdoc v-- writes put dictionary documenation.
NB.
NB. monad:  putdicdoc clDoc

NB. assumes a put dictionary is open
if. badcl y do. jderr ERR097 NB. errmsg: invalid dictionary document must be character list
else.
  DL=. {:{.DPATH  NB. directory object !(*)=. DL
  if. badreps (<y) jreplace WP__DL;CNDICDOC do. jderr ERR056 NB. errmsg: replace failure
  else.
    ok OK062;DNAME__DL
  end.
end.
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
2)R660ebF,1*ALu2E2g;+>Po!1a"M2+?(Du2]sh/+>Y\o3$:"5+?(E!2]st#2DZI11a"Y2+>GPm
1,^702BXb2+>GSn1GL"1+>P\p1a"S7+>GPm1bg+-0d&8/+>t>u1*AFs2D?73+>GPm2BX_.+>b2t
0d&:q1,U17+>P_q1a"P3+>GPm1,'h*1E\M2+>Y,t1*AFs2DZI8+>Gl!0esk.0d&Fu0fU:9+>tqs
3?U%6+?1K"0H`@u1GL",1a"S0+>GPm1Gg46+>Pku2]t(6+>k9!2'=k$1H6L30H`/*+>GPm1b^%2
+>PYo2BXk8+?1K!0d&7p1bg+5+>u)"2]sq4+?(E"2'=V-+>kns0ea_-0H`@u1b^%-+>P_q2]sh8
+>P'"+>GVo1bp1.0d&83+>b2s3$:1'1H?R41E\J5+>GSn2)QL4+>c&#3?U+9+>k9!1a"\!2DH=5
+>ktu0eje.1*A;0+>kqt0f1"33$:.&2DQC6+>Pht2BXk7+>k9!1E\Y"1cHO30H`20+?1K#0d&4o
1Gp:2+>Gbs1*AA5+>b2r1a"M,+>l,$2BXe0+?1K%1*A=p1c-=1+>Pr"3?U4;+?:Q&1a"e$1c$71
+>bks3?U+7+>P&s2BXh!1b^%,0d&50+?1K#0H`)++>Y\o3?U18+>G_r1cZ[=+>Pes0esk,3$:.&
1b^%,0H`>/+?1K"3?U%1+>bo@;aX,J3&PnnASrVF+@/pn8P(m!+EV1>F<GU8E,oN2ASuTuFD5Z2
+DGm>F`V,)+DG^9A9Da.+D,>(ATJtG+Co%q@<HC.+>?,J92J)[@UWb^F`8I6Bl[cpFDl2F+Du+?
DBNn=AS,Y$6<R8V@X3',+E)4@Bl@l3@rGmh6W[2^:/"f2ASl@/AKYo/Cj@.IBPDR"+EML1@q?d)
@:qu"6W?WQ:-hc\A8,OqBl@ltEd8dKASbs$Eb/ioEb0,uAKYK$A7\//9i+P_7l,="EcYr5DBNn=
AS,Y$+EV1>F<G16EZdtM6m-#_D/aPa<D?:h5t?$*B6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+Yu
Df'?"DIdf[7TW/V8g&2#F*(u1+Du+?DBO"3F<G+:EbTE(+E2@>Anc'm+Dbt)A8,po+>"]j+E)-?
GA1r*Dg-7FF*VhKASlK[H:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:NjkGAhM4F!*%WCi<`m
ARlotDKKe>-u!F7A18X;De!3lAP%2?:IK;CDesJe:IJ/X:J=\0H6?p>FCfK)@:NjkGAhM4F%L[M
:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_<_YtS:IJ/X:J=\0G%G]8
Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCe38:K24?D.P>;+E)9C
DIIBn/oG*7AKZ&*E+*cqFDl1B@q]:k@:OCjE_]&)6r-0M;G:#,ATo7h:IH=DDJX$)AKYYtCiCM>
Eboe>-t[L<D'2GH6m+093A*'9:dJ&O;b0\c6q'd[Ble60@<lEp+E1b2BHUhsCh[a#FCfJ8@q]:k
@:OCjE_o.n<DlM5Eblk?D]it9Ch[cu+Eh=:F(oQ1+E(j7C2[W8E+EQ\:-hTC8g&2#F*(u1+Du+?
DBO"3F<G+:EbTE(+E2@>Anc'm+Dbt)A8,po+>"^R@;TRs+D>\7F<GXMF*(u1<DlLe7T`Yg9H\:p
AS,Y$<DlLh<EN7!9H\D!AnGb%<E)FI<E)FI+EV1>F<GL@FD5Z2+Cf>#AKWQIEb0*!D.7's-o*b8
<E)FI.9BSP0P5$>F*&O+Bl7I"GB4m!:IH=7Ec6/CATCjR="nH)DKU29Bl\9:+Dbb0Fa,$$:IH=7
Ec6/CATCjR=#"c-@rH6q+BN8pA8c[5+A,Et+C]A0GB7>9='&Hi;GU@m78e2<Ch7*uARloU:IH=7
Ec6/CATD3iA8H0mA927$BlJ0.DKBB0FE8QQD/=8B+D58'ATD4$ARlp)@rc:&FE8R=DKKe>F*(i2
FEMP3DJX-'F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj@r$4++D,>(ATM<u
F_u2?ATW'8DK?qCDJ=*5AKYGj@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9@UWb^F`8I@
F_tT!EcY]3@r,at@r,jsG%G]8AKYo'+Cf5"Eaj-#Ch$pp@:NbTCgh3kAUAhJ@WGmeCLqT1@UX(]
DI[6=+DGX74Y@je@WGme@UX(]DI[6#@r,XkAo_@&@r,Ur@r*90D]iV/@rGmhA0>Au@rH4'Eb0<5
C3!m&Dg#]5+CT)&+EqL5FCcS9E+*6f+D,Y4D'2FnGAhM4F!+n/A0>r,DfTr2DK?q:De!3l+DtV)
ATM@"E-Z&0Ch7ZtDfBE%F!+7W+D,>(ATM@%ART[lA8GdjEb/a&DfU+GDdmHm@rri'Eb/[$Bl@l3
G%G]'@rc-hFCf3*A7TCaFD5Z2@<-W9DdmHm@rri'Eb/[$Bl@l3G%G]'@rc-hFCf3*A9;a.Cia<.
Bln&tCh\3,F!,@3G9CX=A0>u4DesJ;DdmHm@ru4$ART[lD..L-@rc-hFCfM9FD,5.A8,OqBl@lt
Ed8dE@<6O%EZet.Ch7*sART[lF`_>8Bln&tCh\3,F!,UIBl%L*Gp%$7C1UmsF(9?7BQ@ZrAU&<;
@:OC%FCf]=+DG^9Anc:,F<G[LD]jCT+Co&"Bl.R+ATAo&@;K@i@qB0n@q]:k@:OCjEZfCFDK@i]
@r*8N/g+YHFD,]+AftT"A7]712.U9.De*F#+@/pn8P(m!+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.
De*E1FCf]=.3N_@@VfUsA7]A!Amo1\A7]@eDIjq=BkhQs.3N>BFCfK)@:NjkAo_g,+EqaEA0>]&
F*(r(F*)G@H"q8.A8,OqBl@ltEd8dG@VTIaF<G+*F*)G@Gp%9AEaiQjGA(]4ASP^qEb0*+G%G_;
@;Ka&Eb/d(DId0nF<G%/@;]k%+D,Y4D'2Fn@rGmhA7f=fDf]K"Ci=B++Co1rFD5Z2@<-W9Anc'm
A8,RlF_tc&DImisFCfM9@3B]1BlS9,+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z*+@UX=hA0=BB
8OR*'A92j$FE:u,@ruF'DIIR2+EMX5FD5f<Bk)3pDJX-'F*&OC@VTIaFE8R=DBNJ(@ruF'DIIR2
+Cno&@:EYdAKYT!Ch7ZuDJXB*@<,jkF(Jd#@q]Fp+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:DfQtA
Bl.g*AKYJr@<,ddFCfJ8Ch[s4+E1b2FCfK1F(B3!FCfN8A9Da+Gp%<LEb$;)DfQt2De!p,ASuTu
FD5Z2+=Lc=@jrOBATMs-DJ*Ku@ru:,FCoH3D..O-+Dbt6B-:`'@s)X"DKIEPDdmHm@rri%DIal'
ART+\EZfI8G][J:DfB/oCLh."ATD4#ATJu'@:O(qE$/\*Eb/a&DfU+GDJsZ8F!,:;@:Wq[+C]U=
-u<g1A7At_A8-'5A9Da.BOtU_ATD:$ART[lF!,R<AKYN+D/a*$Ch4_tDIal6EbTW,F!,.-@:Wqi
+DG_*DfT]'FD5Z2A9Da.GAhM4F(BE1E-!.@@<?0*GAhM4F!,RC+CT.15uU-B8K`(aEbTK7+D,>(
AS#C`A8--.A8,OqBl@ltEd8dG@VTIaFE;#6AT)O!DK9<,E+No0A8,OqBl@ltEbT*+ATVKoBlkJ>
AU&<.G][t7@ruC)AS-!pG][t7@rri%Cht5!BQ@ZrH[U6h+EV1>F<G19Df$UrAQU'rDfp)1AS,e$
A9Da.FCf]=AoD^,@<?Q5-uNI1ALqq7G]YAWFCAWpATJu+DfQt2F_u)3DJ*R"EbeQA7R^3D:.%Gm
/Kf.DF))nAATD6&/Kf(FEHPu9AKW@B@<633Ao_HoA8-+#Eb0?8Ec,q@Ao_Ho+Co2-CG0jLCisT+
+EML1@q?csDBND6FCfN*Eb/fmBle'+Bl8'<@X3',F!,(8AS!!&DBNh8F<DrKDf0,6+Dbb0Fa,$P
DesQ5ATMI(AS#CdF),u6DK9<1F`MA@+D,Y*AKYMtF)*FPDesQ5AKZ&5@:NjkBl5&&FEqG=+D,P4
+EqO;+EMgLFCf<1B4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+Cno&@:EYdAKYT!
Ch7[#ATVHs@q9LfAn?'oBOu6-E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2B6@p!F(96%@<?''
B6@p!F!+n4+>Gbs@X3',+EMXFBl7R)+E)-?F*2G@DfTr2A0=JeF*VhKASlL$F_PB-G\;/5A9/l%
F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF#kFVF_PB-GT^]Q0HaRBB6@p!F*Jf`+>mhNF*)J7
E+<g(G%G]9F!,F1FD)e%0-G=IE+*cqFDl2@+EVNEFD,5.E,oN%ATDg&A0>Q(F*&O:DfT]/F*DY=
FCeliCh7^"F*)IG@3B#q@r*9+Aft].Cht55@<?0*Anc'm+DtV)ATJu+DfQtEEbTW,@:F%eFEqSA
GB.D>ART%aASc'uFa/">F*)IG@3B#q@r*9+Aft].Cht55@<?0*Ch[d0GT^U4Ch7Z1AoD]4GB.D>
ART%aBlnW7F*DY=FCeliCh7g)DKKH2FE8RDATDX%F)u&6DK@I>FEDP;@Wcd(F!,C5+CQC%Ch%9(
De:,(F_kk:E+*j%+D,>(AKYl!D.Rc2AoD]4GB.D>ART%aBlnW8De*HuEbf9*Ec#6,F!)lGDe*Nm
CiCgG@rH4$@;]TuCh[cu+CT.u+EML1GA_IE@WHC2F(KA7DfQt>A7fjn@:WqiC2[WrASc<rBle60
@<iu/ASc<.AoD]48l%htGAhM4F)#W(De<U'F`MA@+A,Et+E(k(+ED%7F_l.BBlbCO+DGF1F*1u&
ATMp)F_i1/DIakD+E)@8ATE!/F(K*)A8c@-F`M@B8l%htDf-\<ATN!1F<G:=+>G!QAfu/;@q0(k
F(TQ2+CT.u+>=pVFD,6+GA2,0C2dU'BQIa(F*(i.A79LhBmO?3+EV:.+E1b2BHVA-E+*d/Bl@l3
@q]:k@:OCjEZf(6+Cf5(Ddd0c@;BCfEboZ&A9/l'Df'H0ATVK+Eb065ATMs)A0>>i@r$4++Co2,
ARfh#Ed8cUGq!T=CLq%!D/a$.D/aP=FD,5.@s)g4ASuT4E+*j%+CT=6@3A/bF(96)E-*47Bl%?t
C1h+"+DkOsEc3'm+EM%5BlJ/:Ao_g,+D#(tF<GdADId[0D/=91@;BEsCi<`m+EM%5BlJ02FD#0,
+DkOsEc3(BAU&;>-t7IDATK:CAo_g,+D#(tF<GdADId[0DIn$&@rc-hFCfM9@3BH!G9CF1@ruF'
DIIR2DIn$4AS5Of@ru4$ART[lF!+m6DIn#7A8,OqBl@ltEd8dGEZfC6B5)F/ATDi7@;[3!G][A3
F<G+.@ruF'DIIR2DJWa%B6/0+F*&O6@<6-m+DtV)AKYf'F*&O5EbBN3ASuU2DJsZ8CiX*+@rH7.
ATDm6+Du+?DK?qAFDl22A0><%+C]&&@<-W9FDi:<Bl7KjEZfI8G]Y'KAT2[$F(K62@<?4%DKB];
ARoLs+CQC1ATo8=ATMr9F(96)E-*4FF(oN)+A,Et+Cf>-G%GQ5Bl@m1De*d*ASuQ3@;]Tu@r-()
ATJu)Bk)7!Df0!(Bk;@)@:O(oE+*6fA7]joEc#N.ATJu.Afu2/ATD?)BlbD<F_56"@qfLlF<G19
AS!!*E+*6f+E)-?FD,5.@UWb^F`8IHDesQ5AT2("BQIm!G%G-!E,6Y8Aftr!F))nBBln#20dh#b
D..I#Bl7Q+F(K0!@ru9m+EqaEA9/kF+EM+*+Dbt6B-:`'@s)X"DKKi.Ao_HkA7]e%ATW'8DK?q/
+E1k'+ED%%A7]d(Ao_g,+CTG%Bl%3eCh4`-E-,f4DKBc>FE;PBEb0;7DdmHm@ruc7Bl5&(Bk)7!
Df0!(Gp$X+FCAWeF(HJ+Bl%@%E-685Bk([l@s;s-FCfM9E-67FA8,OqBl@ltEd8d<De!p,AStpu
Bl@m/FE)GAFCcRk9L2$785DoI78b6[+EV:2F!,X;Eag/3ARo@aBl7Km+CoV8Bl7Q+AU%crF`_>9
DK9<$A9)6oBleB-EZee.A0?#4Eb/ltF*(u6+A,Et+Co1rFD5Z2@<-'nF)ki0@;TRfBl%@%D/XT/
F!+n/A0>o(DIIBnF!+7W+D,>(ATMm'F*(r,@rua&F*)>@AKYetFCfN8+C\bhCNXS=@rc-hFCeu*
@X0(EE+*6lA1;S2FE_qQ@WHC2F(KB6ATMs7+CT.u+EM+9F!,R<AKY&U=!1smDg-86EcZ29Bln$/
AS-"&Ch[u6FE_XGA7]RkD/"*'EZeh"Cgh3kARlp(F`)7]+C].04Y@juE,961BQ@Zr+Cf50ATMs)
DK]`7Df0E'DKKr2FE8RIE$079AKYK*EcP`/F<GC<@ps1b+D,P4+EDUBDJ=!$+EV19F<G(%F(KE7
Ddd]sBk]OaFDi:1F(8ou3&Mh!AT2[$F(K62@<?4%DKTo/@<?("F^f0$@s)a$@<?(%+E2I4Ch[B%
F(96)E--.DFCAWpATi!.Ao_HoEb0?8Ec,q@Ao_Ho+C]V<ATJu4DBO+@CisT++E)9C<DGn(E+*j%
GB.,2Ch[cu@<-R4@;p91FD,5.Ch[cu@<*K2AT2[$F(K62@<?4%DBNk0+DbJ,B4W2X+E(_(ARfh'
+DG_8D]iI2F(KB+ATJu4Afu/)EbTK7+Dbb0ATN'9Blmp#C3+T>Blmp-+D,>(AKZ)5+E2IF+Co1r
FD5Z2@<-W9A8-'q@ruX0H$=IV@WHC2F(KB4ATW'8DK?q/+Er$R+C]A0GB7>9+D,Y4D'381@;0Od
@VfTuDfBf4Df0U                                                            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&u+>G`/2]t+'0ebCBA8bt"ATMrCA8bt"ATMr9FtG9gFCfN8+EV1>F<G16EZen2@s)X"
DKK</Bl@l3-tI7+.3NeFEagX.$;#=^F(&TiASuQ3D.Oi3D]j+CARTBtFCf]=+D,Y4D'3M+FD,6+
+CT.u+F.mC+EVNE@WcC$A0>u*F*%b!@<6"$+D,P4+EV:.+<W(CDdt4=+Eh=:@NZe&F`\`t+Dl7B
F<G%(@psM$AKW+6DJXS@Eb0'$@:F%a$?L,tFE_/6AKZ).@<<W&De3u4AU%WnFDQ4FGA(E,+DGp?
@r,RfD0$hAD]iS/+DGm>@:NeYE-,MtCh3rqD]in8BeB`"<+oue+CT)!DfTQ6BPel9@<3Q"A79G!
ARloqEc5e;@;[2R:eW!?ChI[,Bln$*/g*`-+ED%5F_Pl-EscSpB4rE/E+NTk+C]8-Ch7$m+<Y--
F<GF/DJ='4CghF"Df-\+DIal(F!)TCDfd+1F!,%+An>IoBm+%pBl5%9@s)g4ASuT48g&2#F*(u1
F!+n4+DGp?BlbD2DBL'CDf'&.+@/gt+EMgLFCf<1/g*PnF)Yi8AI;$WF!,@=DCodGFD5T#C`m2*
DerunDK?qBBPDN1G%G]'+DGm>F*),4C`m=uF*&O9DJsZ1BHVD8+C\mhAo`$.FCoZ3Cj@.3E,]W-
ARmD9:Mq9tD0[6\0JH3l=s+q_<$3<#@:NtbDIjq5H#IgJ+Ceht+DkP&AI:1H/2/b3+DbV,B67f0
Bl7F$ARTXoDJ()4AT2Ho@qBLgDKKqN+=M>FAKZ28EcZ=F@psFi.4cTUDBN?p0d%TUAS5F\H$!U?
+EMXFBl7Q++DG^9@;p1+Dg5u5@<?'sGp"5JDIjq5F(Jj"DIb@B+@^9i+<WBm0FDT0Ci<d.FCcS9
FE2)5B6,2;H#RJ-@;I&/DfB9.@<?4%DK?pC@rH4'Ch7^"+DGm>Ch7[/+EV:*DBN?pFCf?3BHV5*
+EM+(Df0)<$49=<B4rE/E+NTk+EM[7F*)G:DJ()4AT2Ho@qBLgDKI"8F!,"-AnGaeF_l.BFDi:1
@q]RfG%De1DBMOY@;]Tu5u:5tASu[*Ec5i4ASuU2/g+,,BlbD?ATD6&GAhV?A0>>m+CQC*Df9//
@ps7cBk1XoAKYT'EXH5m+D#e>ATDZsC`m5+D/a3*ARlp(Dfp/9DIkF-$=nEjA3(hU@r+MG@;]^h
A0=#f+Cf4e@<-!lFE8R7BOPdkATMs6+Cf4dFE.]q$6UHd67sC)@<iu;D]i%T8OH9A73HYnEbTE(
F!+n4+EqC5C^LLl+E_1-@<-EP/g,9t+>GQ+1E\1jBeCMc0JFUl:-pQUF`(o'De*E%F*)G:DJ';!
+Cno&@<?d6AKZ,*BOPq&+<VdL+<VdL+<VdL:-pQU-tHb.@<?d6ALSa6Ec5e;C*7J9De<^"AI8be
+E_aJ@PBqt+=Jru0Ipii0ek,(F^o)nEcW?G:-pQUF*1r5FE2)5B6+D&+E_aJ@PL"u+=K$#1Fm/l
2^s)r@q]:kEsa$4A79RgFEqh:+E_aJ@PA-3+Cno&@<?d6AKZ,:F^d'4$6UHd67sC%FE2)5B6,2;
BOQ!*GA1l0+Du+>+E(b"F`JU=DBO%7AKYo3BkM-t@;H8n+E_R5G;)04+E]^f1b^U=2_/Sp1G]@\
+E_R5G;265+E]^f2)$d?2_/Sp2[Tm7+=f&t+E_R5G;(../g,:HBOPq&+<Ve%67sBuDfd+9DBO(3
BOPq&$6UHA/h\>iDIn#H+@Rn*F^o)nEcVQp+<Yf:BOPq&DIn#T/g)Pi0./;nF*1qG/13(u/9PiA
G;(Qq0./;nF*1qH/13(u/9PiAG;1Nh@q]:gB4Z.+EZfL7BOPq&$47mu.kWItF`(c70H`e:+E_1-
@<-F,ATo7>:-pQUDJs_ABl5&7FE2)5B*ob(.kWItF`(c70d&n;+E_1-@<-F,ATnIg$4:`\FD,`0
AThW7E+*j%F(o3/AKZ.J/KeM=E,6Y8Aftr!F))nBBln#20dh#bD..I#Bl7Q+F(K0!@ru9m+EqaE
A90@4$4R>7:IH=;ATVEqATJu)Bk)7!Df0!(Gp%<LEb'56A7]^kDIdI!B-8=8DBL'DBOtmu+E27?
Bln'-DBNk8%172jAKZ#)An?!oDI[6#+E1b2BIk9EEZf=0FD)d>AoD]4F(fK4F=n[Y6Z6j`Bk1dq
+<Yc>AKW+*@<5uh$?p/pEb-@9FD,5.GAhM4+<W(SATMrB+<YB>+<Y3+Anc-oA0><%+CQC1Dfoq?
+DG^9A8,OqBl@ltEd8*$.!0$AFD>`)0I\,QDIak4@<3Q"+Eh=:@N]B&+=M>CF*)/8A2,MU@;]Tu
A8c%#+Du+>+E(b"F`JU=D@Hq$FCfN8C2[W=.4u`/+=Ll6F=A=TDe:+7.!0$AF=A=T@rHL+A0>o(
FEMVA+CQC1Dfoq?+E)9CG%G]'%16WWE+NotBl7Q+Df-\:@<?0*DfTB"E\8J#F!,@=F`)7C@<,p%
F*)>@ARlotDBND&DIIR2+D,P4D..Mq$=Rg_+<Y*/C`mY<BOu3,GAhM4F!+n3AKZ&9DfTE"+CT=6
FCf]=+EM%5BlJ08+DGpFF!+t5Bln'!@;HA[FDi:1Cj0<5F!,FBDfB9.Cj@.5CghC+BkDW5GAhM4
F!,[?ASrW"F_PZ&Bl7Q+-uEC.ALS`EA9Da.Et&IbDIal1ATW'8DJ=!$+EM+&Earc*Ch[s4F"AGF
B0%.h+>Fum+CoA++=ANG$4R>ABPDN1GAhM4+EM47GB4lLGA(E,+EqaEA9/k9GA1l0+C\n)F(K0!
@ru9m+D,Y4D'370+E1b2BHU`)%172jAKYr#FD)e2F!,RF@<Q4&F(Jl)A9Dp,DJ()(ATVEq+E)41
Eaa'(Df0VK%13OOG%G]'@<?4#3Zr!YE,95uBlkJ.AS,XoBln'-D@Hp^$?0EqBQIm!G%Eft+>Y-$
+=AQk+?Ukq4s5,"+<t2R?SNZO4")=#/j:D'.3Nsi-8%J)0e"5-4"`61+FZ?o4!8er%13OOD/X<#
A3(hU@Vg""+?_>"E+*j%F(o3/AKYGu@r,4bEb'5#$4R=b+E2Nf/g)Q)4$"`uDf6b1Eb/ZpBl7Q+
BQ%f:.4emg/1<VB3[\QYD]iY4ART@gDJ(=G/7CRj4?GSOBQ%f3BOu3q+EVO?-OgCl$6UHd67sC%
BQ&*9+EqL5@q[!/DfTB0+EqO9C`m1u+D,2,@q]Fa+D,Y4D'3e+FD)*j+<W(O@<?1(Bk;I!+E2NR
+<r3c4s4fg%13OO%13OO%13OO                                                 ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1-%991H6L4+>GPm0f_$F+>GPm1,_'O+>P\p0f1mL+>GSn0fLsM+>P_q0ebOH+>GSn3AWW;0f1"-
0K(a10f'q,3AWB42]sn81E\D,+>GQ*2]sh2+?);@+>Ghu0f(U@+>GSn1H%$30f'q31,U100d&5,
2)6:00d&2.2`;d60d&201b^%-0d&221b^%-0d&8/2)cX50d&222DlU;+>GQ+1a"M0+>GQ/0d&2-
+>GZ22BX_7+>Yc41a"M/+>GQ)1a"M,+>Gi81a"M1+>Gl12'=V/+>GW13$9q3+?287+>GSn3&W]<
0ea_*1,_'60esk+1,q!20fC./0f1m50f^@20K:d03$:(;3$9t2+>bi/1a"M3+>GZ/0H`,)+>Pl8
0k,$:6=FqL@k]W467s`sDJVXJF(o,<0d(Qi/KeM2F(o,,@UWb^F`8I@@;TQuCh[s4+EV19FE9&A
:-pQ?:-pQU6$%*iD.Rc2.!0$AFD>`)0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56
+EVNED..NrBF7L$/g,%?D.Rc@$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP:mARdJL$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OOm*
EHPu9AKW@8De*s$F*(u6-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-ONU8/g)`m<(0_b+B)6*;H/&r$49Np/g,7LATD?)D09oA+C\n)@;[3+E+No0
A8,OqBl@ltEd8"0ATAo&DJUFC-OOa&EZeh/C`k)X-OOa&EZeh/C`k*GAR[8H1a`V;ATAo3A0<7A
ATMs.De(RM$;No?+EqaEA9/l*Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS'ATAo&DJUFC-OL2U67sC&
ATMs7+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE!g/s+>G!JDJUFC-OL2U67sBlF<G()FCfK$$>"6#
1*C%DC`k)Q$>"6#1E^.EC`k)Q$>"6#1a$7FC`k)Q$49Np/g+V@C`lGJ;cHFn+Dkh5Ec5u>+CoA+
+D,P4+EV:.+Dl%<F<G(9EcP`/F<G%$@r$4++>"^IG[k<(F:(c0/g+V@C`mY6Cj@.EARTUhBOu6-
@3BW*DJ*cs+E2IF+Co1rFD5Z2@<-W9@UWb^F`8IFBOu3q+DGm>DJpY:@<?/i:-pQUBOu'kAKZ).
ATD?)@<,p%DJpY:@<?0*DfTB"EZfC6F*2;@F!,:5CLoOL+>=pF0d("EC`k)Q$>"6#1a"Rs@W$!)
-XT8;<$re2:-pQUD.-ppDf[%4DIdI!B-;D4FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bhCNXS'ATAnK
+>P'KDJUFCDe(4<+<Ve%67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7F*)G:DJ((>De(4<Bl5&'F`MM6
DKI"1@:O(qE!cq`EZd%Y0d&.m@W$!)-RU#Z+<XEG/g+S=C`mV6F`)7CBl5&'F`MM6DKI"1@:O(q
E!g/s+>=om+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^F`7Zp$;No?
+EqaEA9/l*Ec5e;E+*d/Bk):%@<*K"@:O(qE,u@]67sBiCh%9(De:,$@:O(qE$0%@D.7's+CoD4
F"AGFB0%.t4"`61-S@/1/ho:;0fCX=2(gU?/ho.70et@81a`W*67sBmDfT]'FED))+EMHD@;Kmr
@3BW0Ecc@FD..NrBHV28D.Ra%@j#i2Ecc@0ATAo&DKTf;4ZX]pDJUFC/gh!8CHX^$4u%CnDKTf;
4ZX^6/g+V@F_u1,$>"6#@W$!)@V[)/+<VdL+<VdL+<VdL:-pQU+C]5)+=Acr2^]^j+<Ve%67sBt
@<?!mATJu&Cht5<DfTB0+DG^9B5)O#DBNCs@r$4+$>"6#@W$!)-ZWd--S/_B+<VdL+<VdL:-pQU
+C]5)+=D2@@P0Ao-QjO,67sBt@<?!mATJu&Cht5<DfTB0+EMX5Ecc#5B-;D4FD)dEEb/]-+DG^9
B5)O#DBNCs@r$4+$>"6#0H`.o@W$!)-Y7NM/7NB;+<VdL:-pQU+>=oo+C]5)+=C`F/ho:4+<XEG
/g,@VEb'56ASu$mDJ()9Bln#2-Y7NM+DG^9B5)O#DBNCs@r$4+$>"6#0d&7p@W$!)-Y7NM/7NB;
+<VdL:-pQU+>Fup+C]5)+=C`F/ho:4+<XEG/g,7IF*)IGASu$mDJ()9Bln#2-Y7NM+DG^9B5)O#
DBNCs@r$4+$>"6#1*A=p@W$!)-Z<NC/7NB;+<VdL:-pQU+>P&p+C]5)+=D)</ho:4+<XEG/g+eI
Dfp#?+Cf>-FCAm$Bl7Q+F*1r5FE2)5B-8R?A1&L6DBNS+G%GP6@UWb^F`7ZpATAnI+>Fun+C]5)
+=BK'/7NB;+<Ve%67sBhCht5&A9MO)@WNZ5FCB33Bl7Q+GA2/4+=BK'+DG^9B5)O#DBNCs@r$4+
$47,867sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:GVDf'H.6=FqL@no?C.V!C6E,%^JF(o,,F=f'e@UX=l@j#r'
Ch[E&-t@14E,$gE@<-"'D.RU,+EV19FE9&D$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(i3AT2a&D.7's+>PW)0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,C%qE+EC!ARloq
DfQsm:IH<Z/ibO@.h)gp$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>R
EZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0F<GXCD.Oi2FCB&t@<,m$GAhM4F!,RC+Cf>,E,oN2
Et&IMDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X3Zp4$3Zp*c$4R>ODf6a]/g,1G@;Kb*Ci=3(
DIIBnF(&s(Dg?22+?_>"FD,62@<,pfF*VVAFDl"=4Y@j2%17#cAU%crATMp,G%G`:@;]UaEb'56
4Y@jdDf6'l%172j@<>puARTXj@;TFcBl7QlF)Go;FCB&t@<,meFCB!%+?_>"@W-0-.Nj!G$4R=i
<(02H:K:=9;,pCk7787n5tsdH+@/mo+@/\":EW#&<DGnP7787d:KL:=+?_>"@W-/o$4R=i7nc]F
5tk3"79DoN<CB8D-TsL5@W-/o$7QDk%16Ze+EVI>Ci<f+E-67F-VSGrB22lPATL.XAQ!)JCi"Af
@<,mXDcD"$AL@ooEap4r+=D2>+EVjM-TsL5@rH4'C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJH
H#R=B%14g4>9J!(Dfp/@F`\aJG]XB%%17/iDfTq_3Zp4$3Zp*c$;No?+DtV)ATJu&Ci"-'@:XX+
Df0,/@q]:k+>"^RDfd+3BOPdkARl5W@6H5g%17AD/n#kP+>OB5H9Elh+=\LZ+=\LZ%14Nn$4R>R
EZfI@E,9H&+E2IF+=D5DDfTqI%17,c+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.M)0d'[CF)>i<
FDuAE+EVjM%13OO%17#_C1UmsEb/j(4ZX]A+?CW!%16fXD-pXg@VTIaF?M6!Gp#jK/g+\C+Du+>
+Cf>,E,oN2F!,C1C1UmsEt&ImDf^#-?YOCb?Z0CgARfgh?Xn"lAp&0/Df.]j+>OB5%16W[Eb/a&
?[-g??Tg"aGp#jK/g+\C+Du+>+Cf>,E,oN2F!,:;@ps1bEt&I*%13OOATAo8D/a<0@j#`5F<DrL
@VTIaFE1r)F!hD(Eap4r+=D2>+EVjM-TsM#Df'H.+=D):C1UmsEb/j(-OgD;+Bot0D/XQ=E-67F
FEhm:$4R>TCi<ckCiX*!F$2Q?+?CW!%16`aDdm-kF!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5
+F+D'.1HUn$>"6#FDYu5Ddso/F`\`RB5DKq@;KsqAof=/$?BW!>9G;6@j#l<F=044+Cf>,E,$LC
B5DKq@;KsqAof=/$8EZ-+EMC<F`_SFF<G[MF:AQd$4R>QARfObEb/d&@rH<tF$2Q,1a"h%0F\?u
$;No?+Co%nCgh?qA0>r'DfB9/+CT;%+EVOE@q^-1DIIBnF!+n/A0><$AISuA67sBlG[kQ4A7]9o
Ao_g,+EV:.+Cf>,E,oN2F(oQ1+E2@>@qB_&%13OODg#]4EbT&q4Z[4lDdm-kF$2Q,GT\,(67sZ9
.6T:+Dg#]4EbT&q+D5M/@UX(o%13OO@W-0J/nf0A4YChpD`o]q0d%S]+<Ve%67sB/.OdMA+C]8-
+D>\3+EVO?%13OOAoD]sDIIBnF"SS\+CoCC%144#+<Y-3D]gMPDIIBnF'iX!A7^!.+AP6U+DG\3
Ch[BnF<G16E\8JNDe!3lF!,@=F<G(,@;]^hA.8kg+<VdSG@_n0ATT&)Ecl80BOt]sDfp.EDe:,'
G\M5@ASu!h-QkQ)+DtV)ATJtD+DtV)ATJ:fASu$2%144#+<V+#BQ%f3.Nj!G$7QDk%16Ze+EVI>
Ci<f+E-67F-Y-duCgh?qA927!E+O)<%17,c+Bos9Eap56G]Y;r3ZqpND/a54-Y-duCgh?qA927!
E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16rdG\(E,@rH<tF$2Q,1E\_$0F\?u$;No?+Dbt+@;I'#
F!+n4F(o9)ARlp"De!3l+CT.u+D5M/@UX'^$;No?+EqL1DBNA*Gp$s<G\(D.F(9--ATJu&Eb-A(
ATVKnFCeu*Df0B:%15is/g,@OBlmo/F)YPtAKY].+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7lu
:-pQU@;]TuBk1dmFD5?$ATJu2Bm=3"+EM%2E+O)"$4R>YDe!3l4Y@k&+<Vd9$>aWj@;J(f+>P&h
+Dbt+@;I&/+:SZ,%13OOATAo8D/a<0@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044
+Cf>,E,$LCD/"6+A927!E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A
+?CW!%13OO:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?
+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0
+DGm>FD,5.F(&ZlF*&OHBPD?s+EVNEA8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5
DIal1AT2R.FE8R7Df000F(Jl)A7]7e@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+
@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ce
D`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<t
F!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!hD(%13OO:-pQU<(0_b+B)9-
6UapP7TE+k$4R>REb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$.-UF(dQo3F<4&@rc-hFCfQ*F*(r,@ruF'DIIR"ATLU5/h1@OART[lFCfN8A8,OqBl@ltEbT*+
+ET1e+CfG'@<?(%+D#D/FEo!$:IH=IATMr9A8,OqBl@ltEbT*+/e&._67sB'%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AN%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'D..]E
1E^OQA8,XiARlp*D]j(CDBO.;FD)e7ATo7FBkhQs.3N>BFCfK)@:NjkCi<flCh4%_:-pQU0emQa
Fttcp-us0FDf9_H+CSekARlo8+CSeqF`VY9A0>u4+EDUB+E)-?@W-@%+EqO;A8cZ7-6R,=DKU15
$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sC&ATMs)EZfLHBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+
@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+
@;KKa$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV
-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,Oq
Bl@ltEbT*+%15:G/g*PR6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-
+EM47GApu3F!*kB6W?uI3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nID,FCfN8C2[W1.3M&3+?k-)
+u(3.8OHHU%14g4>9G^EEb/lo-9`P?8OHHU%13OO:-pQUA7]h(Ec64G@;Ka&@s)g4ASuT4C2[X)
ATMr9A8,OqBl@ltEbT*+%15is/g*o-FCdKUFD,5.IS*C(<(0_b+EDC=F<GFCF*&O6AKZ&*F<E.X
F`V+:8g%V^DJ!TqF`M%9%15^'6rZTR<)QLf<'<8bC2dU'BHS[O8l%iS78m/5%13OO:-pQU<DGn(
GA1r*Dg-7FDImp6DfTV9Ec5l<%15is/g*b^6rZTR<)QLf<'<8b-X9nnARf4f@<4+V>]k+!EcYK#
A7At_ATD$jDe*s$F*',a%13OO0d'[CEc#i8Dfd*o:IJ/N;cHXj:K.c1%15is/g+YEART[l+D#D/
FEo!NATMr9A8,OqBl@ltEbT*+%16Ze+Dtb7A0<7AATMs.De(OL4%`::<(0_b;GU(f/14\EATMs.
De(OL%16Ze+Dtb7A0<7AATMs.De(RM4%`::<(0_b;GU(f/14\EATMs.De(RM%16Ze+Dtb7A0<7A
ATMs.De(UN4%`::<(0_b;GU(f/14\EATMs.De(UN%16Ze+Dtb7A0<7AATMs.De(XO4%`::<(0_b
;GU(f/14\EATMs.De(XO%16Ze+Dtb7A0<7AATMs.De([P4%`::<(0_b;GU(f/14\EATMs.De([P
%16Ze+Dtb7A0<7AATMs.De(RV-Tapr6rZTR<)QLf<%KD%FCfN8C2[W;0II;:ATAo2ATqZ--Zip@
FD>`)0eb:/4%`::<(0_b;GU(f/14\EATMs.De(RV0II;:%15is/g++^;cFl<<C9,B;c?.c9FV=<
$;No?+ED%3E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QASa\AF(o,<0JQ<h/h1CCCdMQOBk&hN0d(Qi
/KeM2F(o,,G%#3$A0<:2AS`e<FCfN8F"Rn/:-pQU%15is/g,=KEaiI!Bl,m?$;No?%15is/g*GY
;cQO\;`Z$U.3N%A;FNl>=&MUh73HPlF<G+.@ruF'DIIR2+=M>CF*)/8A2#Gb%15is/e&._67sBQ
:IH=8@;Kb$+EVNEF(KH9E$076F*&O9DK]`7Df0E'DKI!Q+CT>4F_t]2+A,Et;bpCk6U`+,$;No?
+CSekDf-\3DKBo.Ci!Zn+CT.u+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!)lGDe*BiFt[TK
A1r(IBl%i>%15is/e&._67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU
+<YN;F!)iFDe*s$F*(u6-OgDX67sB'+Dbt)A0<77De*s$F*(u6-QjN@$;No?+<Vd]+EDRG+=CZ>
ART[lFCfN8A8,OqBl@ltEbT*+-QjO,67sBjEb/[$AKZ)+F*&O8Bk)7!Df0!(Bk;>p$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)i,DJs\P0d'tEDK]T3FCeu*FDi::2D-[=+>"^VAStpnARl5W:-pQU0emNRGqh)tF`:l"FCeu*
AoD]48iJCsBl8'<+Eh=:F(oQ1+E(j78l%ha$;No?+>GTf@<jU^+=LuCA9;C(FCfJA+ED%5F_Pl-
-Y*Yn:-pQU0emQaFttir@q]:gB4YTrFDi:EF(HJ9ASlC)Eaa!6+Dbt+@;KKa$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm
-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBpDKBB0
F<G!7GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B13a68
.1HUn$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>REZfI@E,9H&
+E2IF+=Cl3D0Ko=A1&KB+AP6U+DG_8D]iS)@ruF'DIIR2%16Ze+CoA++=Cl3D0Ko=A1&KB+AP6U
+DGm>BlkJ3DBO%7AKYMt@ruF'DIIR2%13OOATAo(AS`J:Bjkk&DfTA9+<Ve%67sBkASbq"AKZ28
Eb#UdDImi2FDYu5Ddso&ATT%BBjkk&DfTA9+<XEG/g,@VEb$;,F!,")Ch7^"A0>AjDJjB7+D58-
%13OO:-pQUBl8!'Ec`EY0JFVnDfTB0+DG_8D]iS)@ruF'DIIR2+CT.u+Co&"ATVK+FD,6&%14M-
DfTB6E,TZ94ZX]J+u(2fGAhM4H#R\?-Qjra0d%TTC3=T>+<iih/1r&Z/g)l&0I\,-3Zp.20H_S_
4<QL)3]/$B-Y["+GAhM4-OgDoEZfI@E,9H&+E2IF+EqaEA9i-4DfZ?pATAo(AS`K5DfTB6E,TZ9
%13OO:-pQUGA1l0+Du+>+C\n)@:F%a+EVNEB4Z0-@;^?5A7]RgFCeu*GAhM4Et&IoATAo8D/a<0
@j#DqF<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+$4R>;67sBkASbq"AKYDtC`mb0An?!oDI[7!
+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSnA7]R"GAhM4H#R\?Et&IoATAo9FZhc.F`V,8
+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*ATD@"@qB]j$8EZ-+>=pNCi<d(-9`PrDfTB6
E,TZ9%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:f
ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU
$=m^hFE2;FFCfN8A8,OqBl@ltEbT*+:-pQ_A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?.F=f'eA7]h(
Ec65E+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+SDF*2>2F#kElC2[X)ATMs)E[`,F
F!+m6Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttcp-us0FDf9_H+CSekARlo8+Du+A+EDUB
F!,C=+BN8pA8c[5+CT.u+A?KeFa+?&%16T`@s)g4ASuT4-XpM*AL@oo%15is/g,7IF*&OIFD5Q4
+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>
Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDm
DeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,OqBl@ltEbT*+%15:G/g*PR
6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-+EM47GApu3F!*kB6W?uI
3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nID,FCfN8C2[W1.3M&3+?k-)+u(3.8OHHU%14g4>9G^E
Eb/lo-9`P?8OHHU%13OO:-pQUA7]h(Ec64G@;Ka&@s)g4ASuT4C2[X)ATMr9A8,OqBl@ltEbT*+
%15is/g*o-FCdKUFD,5.IVNe3FCfN8+EDC=F<GFCF*&O6AKZ&*F<E.XF`V+:8g%V^DJ!TqF`M%9
%15^'6rZTR<)QLf<'<8bC2dU'BHS[O8l%iS78m/5%13OO:-pQU<DGn(GA1r*Dg-7FDImp6DfTV9
Ec5l<%15is/g*b^6rZTR<)QLf<'<8b-X9nnARf4f@<4+V>]k+!EcYK#A7At_ATD$jDe*s$F*',a
%13OO0d'[CEc#i8Dfd*o:IJ/N;cHXj:K.c1%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3
E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QBk0P=F(o,<0JQ<h/h1CGA3s^GBk&hN0d(Qi/KeM2F(o,,
-tI%&.3N_DF*)IU%15is/e&._67sBhF)uJ@ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bq
Ec5Q(Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C
;FshV+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z+<VdTFCfN8C2[W:/0K%GF*)/8A2,VXFCfN8
C2[W;0J">gATMs.De(RV0I\+R$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,A7]7*3?VgMDK]T3FCeu*FDi::2D-[=+A,Et
%15is/g)l'DJs\Q3$<?_A79RkA0>K&EZdt502-(tFa+?&%16T`@s)g4ASuT4-XpM*AL@oo%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%15is/g,7LAKYMt@ruF'DIIR2+DG@tDKKT)Bk(Rn
Bl@l3G%G]'+=Lc7A18X8B5VX.ATJ:f:-pQUBlk_D+CT;'F_t]-FE9&D$4R>REZf:2+=D8BF*)/8
A2#A?$>"6#A8,Qs0F\?u$;No?+Du==@V'R&De:,&Bk)7!Df0!(Bk;?.Df-\:@<?0*D09oA+DkP/
@qZ;Y0d&V%,9VCe+Co1s+>=63%16Ze+E(d54$"a2ATMs.De(RFFCfN8C2[W;0HbIKF*)/8A2,bl
-OgCl$8`kg+<r"W/g+\=A0<Q8$4R>REZfKf3Zp+!A8,Qs0F\@H+?^hl+>G!XBk(p$FW_f%67sBp
DI[L*A7]g)BOtU_ATA4e%16Ze+>Y-YA0<rp-Zip@FD>`)0HbIKF*)/8A2,bl-OgDoEZfKf3ZqsI
A0?=D0F\@F+?^hl+>G!XBk(p$FU\Ze$=dm`@<*_C+AP6U+EV19FD5W*+E2IDB4Z-,@UX=h+Dbt+
@;KKa$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&If
Eb00.ASrVE%13OOA8-+(<GlM\De*E50JQ<h/h1CGF)Y,sBk)'lAM>em+ET1e+Co2-E,8s.+E(j7
1*C%OFCcS;DJ<U!A7[A&$;No?%15is/g*H$F*2>2F!+m6;FNl>=&MUh73HPlF<G+.@ruF'DIIR2
+=M>CF*)/8A2#GT@<Q'nCggdhAISuA67sB'+<VdL+<VdTC2[X)ATMs)E[`,SATD7$+CTG%Bl%3e
Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130K3TT@PBYK
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>PW)2e6K00esk'+=M>CF*)A0F)rcQEb03+@:Nki+=M;JDfp/@F`]&A$;No?
+>PW*0l:?E1,'h&+=M;EDg-//F)rcQEb03+@:Nki+=M>CF*)A0F)rc>$4R=O$;No?.Rd65:Js>>
+=Lc7F)WQNA8c%#+Du+>+E2@>E+O'+Gp$X3F)Yr(Gp%6IBk)'lAKYMlFCB9:E+O)"$;No?+>b3,
E,m'V0JG@,0f(jH1HI?I%13OO+<XHV78?HN6psU6<(Tk\5uL9C;dX6RDe*3<3Zri'+Co1s+>=63
%144#Eb065Bl[c--YdR1FCfN8ATB.-$4R=b+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9
$6UH=F`(o'De*E,+>#VsA79RgFEqh:+E_3;+AP6U+Cno&@<?d6AKY])+EMX5DId0rA0=JeE,ol/
Bl%>i$4R=b+>G!C+>Y-YA0<6I%13OO+<Wj%HZ*F;-Zip@FD>`)0IItc:-pQU8l%htFCfN8+Co1r
FD5Z2@<-W9%13OO+<Wj%HZ4+L+=D;B-QjNS+<VdL:-pQUF*)>@AKY])+EV19F<G+.@ruF'DIIR2
%13OO+<Y69@<6!&-ZrrI+<VdL+<VdL+<V+#%144#4tq=rATT%BF^uj/$4R=b+=D;LBk)'lALATP
3ZqsAFCB9:E+L/7A0<!i67sBtF`VXID..NrBFP:X$6UH>FZLWmFD,B0+DGm>F`(o'De*E,.3L3'
+E_3;:-pQUD09oA+DkP/@qZ;Y%144#:-pQU.!''?GApu3F"&5BAS,XoARlotDBL?BDe*s$F*(u6
.3K',+<WB]>9J!#Dg-//F)rI7Ble59-ZrrI+<VdL:-pQUD09oA+Co2-E,8s.+EqOABQ&$8+D#S6
DfQ9o%144#ATD@#E+No00F\?u$;No?.Rm!34['uuDfTl0@ru9m+DG^9CghEsEZfO:EcYr5DK?q=
Afs\g%13OO%16W`Ce\>JEc4ogG]\"%67s`uDJW$U@rcKeAU&<<+ET1e+<Y0-ARfLs+EV:*F<G".
C`jj;@:O=r+<Yc;G]\!L@ps6t@V$['@<Q3m%15is/g+S?A0>r)ASrW"Gp"MGDJUaS%15is/e&._
67sC(ATD6gFD5SQ%15is/e&._67sB'+@/q)<D>n\3ZrHS@:XS&Blmo/E-67FA8,OqBl@ltEd8cU
FCfN8C2[W:.1HVZ67sB'+<VdL+<VdL+<W(IDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQaFttirF`:l"FCeu*AoD]4
8iJCsBl8'<%13OO@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%16Ze+E(d5-Zip@FD>`)0II;:%15is/g+\9
Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUF*)>@AKZ/)EbTH7
F!,=.@rcK1FCf]=+EVmJATKIH+AQisAKXT@6m-#YATJ:f:-pQU<^BDN6pXd@+AG-h;GSE779EMf
/g)9.<$5+29i+Md+B)68;FOM,<(KG#<(0ng%15is/g+4e<(J,t:*;i$;bobP5u^9@+B2K?73Frn
6q&4f:Jr<(5uUo/;FOP_8OZZG9J-b]:-pQU8TZ(hF!,UE+EVNEFD,5.8l%htF`V,704SF,Ch7W0
FDi:F@;KXg@<?''FCf]=/e&/!EZd1]E-67F@5'hs-Yd^4EbTK7-Ta(<4!uX5/g+mOF(96)E-*4E
AU&;>/hSb(%16Ze+>b3[F`\a70g.-:CghEsGUGR.1-6j9/hS8_@<?(*+EV1>F<E1g/gh)8ATAnM
+E2IF+CR#g/gk=SD/:R]1,D!>/hSb!BQS*-+EV1>F<E1g/gh)8ATAnM+E2IF+CR&h/gkm\CaV;"
1cm';/hS8kD/:>:AU&;>/hSb(%16Ze+>b3[F`\a71d*H=FCf]=-Ta(@4!uX5/g,+L@;0U%Derr,
FCf]=+>,9!-OgDoEZd1]E-67F@5U2#-Xq@CALBPp2EN9=/hS8TEaia)Eaa!6+Dbb5F<GL6+C]V<
ATJtH/hSL\$4R>;67sBU8PN#(/KeP3F(HIL3$9VL<(8hr+DGm>@3BW1ARfF_C`m4rF(HsH+B3#c
+EV1>F:ARP67sC&D]iM#+ELt7ARlotF!,UCBk)'lAKZ)+G]Y'BDBO%7AKXuP7Q;N%DI[TqBl7Q9
%15is/g+,,AKZ)+G]Y'PBl%T.@V$[!@;0V$@;0UjA0>T(+B;B13$;gOEc#6,+ECn4BOu2n$;No?
+EV:*DBO%7AKX9;6V0ilA8cU"Ch4_uH$!U?Bl7HmGT_$<E,oN2ASuTuFD5Z2+EV:*F:ARP67sBQ
-Z^Cf+Z_J'B4YslEaa'$F!,(5EZek*@<-E3Dfp/CBk1ctDe:+N+C]&,+@/pn8P(ND$;No?+B3#g
F!,L7E,oN2ASuTuFD5Z2+DGm>D/XH++Cf>,E+*6u+CT.u+D,&&+Dl%;AKZ#)@:WeUCh4%_%15is
/g+.n7Q=@9=B%F9%15is/g+_G+>b3[F`\a72*EQ7-ZsNC3%$dC3'1,>7Q=@9=B#_:%14L<4""ca
@rc:&F=/L[/NP"2+>Fuo0d("EC`k*?F(96)E-*H:$7IVj-Z!45AU#RO+>#Vs1a"Lq1,9t_DJUFC
CghEsGUEq--o!e2BQS*--Rg/i3Zp7%0d&5-+CoA++=CiED/:R/$7IVj-[9KE-Rg/i3Zp7%0d&5.
+CoA++=DDNCaTZ!-o!e2FCf]=-Rg/i3Zp7%0d&5/+CoA++=D8BG]Y;B$7IVj-Xq@CALAoL/NP"2
+>Fuo2BZOJC`k*7H$!UF%13OO:-pQU-o!e2F`_4T-Rg/i3Zp7%0d&52+CoA++=D;RAiM.I$4R=s
+BrAbF?M6!@5'6@0e?`g/7C=c3ajiS$4R>;67sBkD]j.5G]\!LD..NrBKlq5A79R&/NP"<HTE9+
+D58-+F>^b0d("8F:AQd$>"6#1E^UH+=ANG$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1G
DfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%16Wa@ru:'FA>.T.V*I-FCfN8+ET1e+EV19
F<GXHF^cJ*DfQsKA8bs,+EV19FD5W*/db??/db??/g+,,BlbD2F!+m6+EMI;Blmd(Gp%3?F*&OK
Bln#2@3?\'De!p,ASuT4BOtU_ATAo8BOQ!*GA1l0+C\mh:-pQUF`V+:FDi:DATMr9A8bs1$;No?
$;No?+Eh=:@UX@mD)r#!67rU?67sB'+<VdZ/hSb!F`(f0Ec#6,ARlp*AU&;(:-pQ?:-pQU@rc-h
FCeuD+>Pes;e9nj1,(CA+>GQ21Gh-K1C=Ia67s`V;Gp:g4['u:GAhM4.3N52Bl%i5Df-[M/hSa`
:-pQU1,U1QAT/bI0JGI/0ebXE1cdEK$49Np/h0=^=?Shj@rHC.ARfgnA0<KW/hRJ<F)>i<FDuAE
+=C]<@ru:'F<E.XBlbD*+CoV3D0[7GATMr9FD,*)+CoD%F!,OJAS#s+AgJd>+CT)&-OOKtFDuAE
6uQQh0ht%f.VE=7E-67jDdtIU+ET1e+C\c#Bk&9/@;KXg+=Ll6F>%TUF=A>CBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3FCfN8F"Rn/:-pQU%15is/g,=KEaiI!Bl,m?$;No?%15is/g*GY;cQO\;`Z%3
Bk)7!Df0!(Gp"MWATMs.De(ON+D#e3F*)I4$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JP:mARdGT%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sBhFED)2E-*48ATT;6DJ()#DIal/F`]!Q
Bl7Q+A8bt#D.RU,@<?4%DBO.:ASrW.DffZ,DJ()+F!,C?ASqqaDImi22'?OCF<DqY%16uaEZd4^
E-67F-Z3jEBPD?s+DGm>DfB9*+CoD/Ap&/B%13OO:-pQUB4Z0-Ao_g,+AtWo6r-QO=We.\ATAnK
+E(d5-Zip@FD>`)0II;:ATAnN+D58-+=ANG$4R>;67sC%BQ&$0A8Wc:+C\n)@:F%a+EVNEF`:l"
FCcR($>sEq+>k9\F`\`RBOuH3H#IgJ@ps7mDfd+GEbTW,+EVNEEb/ZiDf0B:+Co1rFD5Z2@<-'n
F!hD(ATAnL+E(d5-RT?1%15is/g,(OASrW2ART*lGB.D>AKVEhATAo3A0<7AATMs.De(OL%15Kp
6UX^;4ZX]5FD,B0+DGm>F)Po,+CoD#F_t]-FCB9*Df-p3$>"6#2'?j\F<EtC6UX^;%13OO:-pQU
F(fK7Ch+Z*@<?!m%15Kp6UX^;+>#Vs0d(FL@r!2E+D58-+>=63%15is/g+\=@ruF'DIIR2+CoD#
F_t]-FCB9*Df-\3F!+n/Gp$O9@VKq)@<-W9@q]:k@:OCjEZf14F*%iu6qKa6:I@9++CQlFH[[)%
2)$^<+=&'b2)YmNATAnN+E2IF+@Jdg6r-/Z$:IHQ6r-/m/NP"/+E2%)CEPJWB4Z0-0F\?u$>"6#
2'?j\F<DqZFCfN8C2[W:.3N/8@ruF'DIIR2+CoD#F_t]-@<?4%DBO%4F*)IGE+*g/ARm.t$4R>;
67sB[78m/.;cQ1P78m,S<D3i/@r,^bEZc_W%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p
$>"6hDfB9*+>=63B5DKqF$a;VBk&hN0ht%f.VER9@WOkEF(o,<0JO\l/M/(f@UX=l@j#E#Ddmc1
FCfN8F"Rn/:-pQB$;No?+B2onFE8R5+D,%rCisc0+DG^9G%#3$A0>buD.Oi$G][t7@ruF'DBNJ(
F(9-3ATD?m+EqL1D@HqJ67sBsDdd0jDJ()5Df'&.De:+YDdjhUATD["@r$?;F!+'t@rGmh+DG_8
D]hY)+<V+#:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll
+E_X6@<?'k+D,P4+A+RG9PJBeGRXuh$=dm`@<*J<-QlV9@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgE)ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sBjEb/[$AKYD(
G%G]'+EqOABHV22+D5M/@UX'qG%#E*@:F%a+ED%*ATD@"@qB^6%15is/g+S=C`mh5AKYE&F(o9)
ARlp$@;TRs+CT;%+Eh16BlA-8+A*bdDf0W<@;^1.+:SZQ67sBuDf0,/F(fK7Ch+YsE,]AsEZee3
+DtV)ATJu<BOu'(-td@7@WNt@BlbD*E,]W-ARmD&$?Tj#FCT6,F*(i.FE9T++>Y-$+>=63@6H4c
?SQ:M%16Q-/g+L[GW-'=@m)Fe1,Er.%16W//g+LUAN(&*Aj%ah?SQ"E2[p+*4Y@j41O'?9Aj%ah
1iPD`$7QDk%15is/g,4KDfol,+C\n)ASlC.Gp$a9Ddm-k+Dbb5F:AR24X3.;3Zr'ODdmc8FCfN8
@rH7+FCB'/F!hD(%16Ze@<6!&-Zip@FCT6,F*(i.FE8f=$4R=O$;No?+B1d.<$5+>6UO:@;asb\
%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63B5DKqF%(=qEa`I"Bl@lC
0JQ<h/h1LMDdmcVG][t7@ruF'DD3b!+ET1e+EV19F<GI0D.Oi$G][t7@ruF'DBNP0EZcb[.6T:+
@;]Tu-n6Z/3XlEk67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQa
FttirF`:l"FCeu*AoD]48iJCsBl8'<%13OO@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,F(H^.$4R>;
67s`V;Gp:g4[(!,EZfI8F*&O8ATM@%BlJ0.Df.TF$;No?+>>`-De!lB0f:(bG][t7@ruF'DBNk0
+Co%nCgh?qA0<9M.6Sek@;TRs+D,%rCi^_CBOu'(FD,6+AKY].+CQB%$;No?+EM77B5D-%EHQ2A
AKW?CE,oN"ARoLmB-;86D.Oi#ARfObEaa'(Df0VK%13OOFCfN8GAhM44ZX]A+?CW!%13OO:-pQU
Eb065Bl[c--Y-q3-QjQ\.OdM5+DPk(FD)*j:-pQUCi<`m+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%
Bkh]3+Xefh4Y@k'Eb/Zi+F7R4EZcJI+<V+#%16Wa@rPjuBK[sjC2dU'BHS[O@:WneDKB&qASu("
@;K1`De**fDe*Bs@pE\hD/<a$@pCAj$>+!gATL!e+>=pb+u(3dA8-',A8bss@<?06-Y..*F_t]-
FE9'\BlGF/$=mRe@6H4cH?*S*A0N`NAnc'mF!*"d+?X1Q@rPjuBFP:t%13OOFCfN8GAhM40g.Q?
1E\_$0F\?u$;No?+ED%5F_Pl-+=C]6E[MtQ-n6Z//g+nJ@<?/l$;No?+Dbt)A0?>0A7TUrF'N-o
@pF=oE*R^$Bl%@%Bkh]3+Xefh4Y@k'Eb/Zi+F7R4EZcJI+<V+#%16Wa@rPjuBK[sjC2dU'BHS[O
@:WneDKB&qASu("@;K1`De**fDe*Bs@pE\hD/<a$@pCAj$>+!gATL!e+>=pb+u(3dA8-',A8bss
@<?06-Y..*F_t]-FE9'\BlGF/$=mRe@6H4cH?*S*A0N`NAnc'mF!*"d+?X1Q@rPjuBFP:t%13OO
%15is/g+,,ATD?)F(fK7Ch+YtAKYl/+D5M/@UX(o+Dbb5FCeu*Bl5&&DffY8@psFiEt&Hc$;No?
+Cf4rF)u&-Gp%!5D.Oi4F(GdfEap4r+=D2>+D5L<4Y@j4+F>^`0eje`Ci<d(+=D8BF*)VEEb$mP
%13OO:-pQUB5DKq@;I&rDfor>+DGm>H=_,8%14d34Wkk$+F>4U-9`P,+F>:e+D5L"$4R=O$;No?
+Cf4rF)u&-Gp%!5D.Oi4F(GdfEap4r+=D2>+D5L<4Y@j4+F>^`0eje`Ci<d(+=D8BF*)VEEb$O,
$4R>;67sBnCi<ckC`m5+F`):DBlbDCATD\u$8<Sc+<W?\HQXO[4s2R&HQk0eB5A"a%15is/h0=^
=?Shj0K1Y'@rs@Y2'=InFE1f"ARlp*D]gHHE+*a(@;TRs.3N>BF(KB6ARlonDe*E%FDi:BAT2Ho
@q?bl$;No?+E;OBFCcRB+Cf(nEcW@IBln#2@VfIjCNCV?D]iJ3DeW`)@rH6sF`V87B-8U>@<64%
@OV`n%13OO%13OO%16`gE(+V_FEoPo0ht%f.VEd@7;[!cGq^p,+ET1e+CfG'@<?''ASlC.Gp$a?
Dfp#?/e&-s$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+CT>4F_t]2+AtWo6s!8X
<(.pKF`\a:Bk)7!Df0!(Gp%$EASqqa%15is/g+YEART[l+D#D/FEo!AEc6)>%16Ze+D5_6+?V#a
Ec6)>DKTc30II;:%15is/g+YEART[l+D#D/FEo!AEc6)>+>"^XBPDN1AoD^,+E(b"F`MOGA9Dp,
DJ()&F_u(?Eb0<6DfTE1+E(j7ASlC.Gp$a?Dfp#?%16Ze+D5_6+=CfBDfp#:F_kkK-T`\'%13OO
:-pQUD09Z:BlIm"+Du=<Ci^_@Des!*@<?'k%16Ze+D5_6+=CfBDfp#:F_kkL-T`\'4!uC,@6,r%
BeD(K$4R>;67sB[78m/.;cQ1P78m,S<D3i/C2[WkB4XJ>H#kYn0ht%f.V`m4@:s.>@<loJ0JO\l
/M/(nC2[WkB4WM7A79a+Bl8$(Ectl-+CehtDJsV>@V$["AS5FnBm+&?%15is/e&._67sBjEb/[$
ARmhE:LeKb@V'R&0fCR*1,(C@%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,A7]7)2'?dTG9D$LBl7Q+.!0$AFD>`)
.1HVZ67sB80lCoQ1,pD!E+EC!ARloqDfQsm2_Rj=DKU15$4R>;67s`V;Gp:g4['u:C2[WkB4WM7
G@>P8Eb0?8Ec,T/B-:P9+D,P4+Cno++DG_8ATDs&Ci_3O%15is/g+\5FCdKU0fC.M@rrhK0JGF.
0KD0O2``WL%13OO@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%16Ze+E(d5-Zip@FD>`)0II;:%15is/g+Y?
ARTU%@;^?5.!fHFDdd9i.3NhQEb#Ud0d'[CA7]R"I4cXQDJUFCH=_,8@:s.!%13OO:-pQUBl8!'
Ec`F4+EqaEA0>c.G9D!G+DkP&AKY]/+>=pK@<lo:Derqn$@69(Ddd9i4ZX]A+?CW!%16N,/g,EK
$=P&,+>GPZ$7QDk%16Ze+E2IF+=DJHEc5B!AL@oo%16NVAN`'sC2[WkB4W25H=_,8@:s.!%13OO
:-pQUAnc:,F<G"0A0>\sF*&ODF`\a?DKKH1G%#3.+EM47F_kS2@V$Z9%14d34Wl9u4")gF4>AoQ
+>bNo3]\BlB4VMZ%15is/h0=^=?ShjEc6)<A7]9oH$O[\D/Efo/nS]<A79RkF!,RC+DG_8AS5Rp
F!+q'AoD^$+CehrCh[d"+=Lc/H!t>s.3N>B+=LuCA79+^.1HUn$;No?+ED%3E+No0@;^?5A8,Oq
Bl@ltEbT*++:SZhEb00.ASrVE%13OO%16oi@:XIkF*')i0k>!.FD5Z2@<-Wg67sa(Ddd0uATMrI
0JR*P@ruF'DIIR2+ET1e+Dbt)A0<UO+EV19F<G+.@ruF'DIIR2/e&._67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emNRGqq&r-u!F7A18X8DKKH1Amo1\+Dbt+@;KKt
@:Wn[A0>u4+C\c#AKYGjFD)d+$;No?+<VdL+<VdL+=LuCA9;C(FCfJA+ED%5F_Pl--Y6ft$;No?
+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>GTgDg!ll+=LoAF*)J7E%)oMASl@/
ARm>7.!0$AF=A>CASbq"ARlo8+EM+*+C\nuDg)Wt%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR
+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU8l%htF)Q2A@q?d,
DfTB0+>"^QATDEpF!,F1FD)e-Bk)7!Df0!(Bk;>p$9g.jD..3k+A-Q_;f?f!@qAJFFD+'bD/_X!
+=LuD@<?0*-[nZ`6rZTR<$s+G-SK4QA8kt!BJ+"6F!hD(%15is/g+b;FCSu,FCfN8+Co1rFD5Z2
@<-W9@rH7,ASuU2+EMXCEb/c(@<3Q"+:SZQ67sBkF_u(?F(96)E-*4:DBO%7AKY`+A0>DoG%GK.
E,B0(F<G+.@ruF'DIIR"ATJ:f-ZW]>F(A^$-TsL51a$FBF<Dr1ATMr]Bk)7!Df0!(GsldlE$l)%
.!mQj0d(OJ@<<q]3Zrc1+u(3]A79Qh$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>R
EZf:2+=D8BF*)/8A2,G@$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=
ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc
.3gr&-OgCl$;No?+Dbt)A0>u*F*&O8F_u(?F(96)E-*33$7I;V+Z_>30I\,*3Zp+;.3MT$F*'fa
@ruF'DIIR27!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sC"@:O'qA8,Oq
Bl@ltEd8dLD]j(3D/XT/+<k?-@:UQ)Anc'm+Cf>,E,TW*DKKq/$>"6#E+*6lA0<7AATMs.De(RM
%13OO:-pQUFD,5.AoDL%Dg,o5B-:o+F(KB6F!,=.DL!@GBl7R"AKYf'DIjr$ATM@%BlJ0.Df0V=
AoD]4GAhM4F!,[@FD,T8F<G+*F(96)E-,f4DK?p0$<')K+D,\+DC.Oi0H`(m1E^RRAU&/:-RT?1
;a!/a;]m<6+=K?+.3O(#+F>^b0d'C($>"6#0H`=tE-67F.!mQj0d'CD+=o,f-o`n-4>%g3+<r3s
+F?-n0d'CD+F>^f/j:D)3[-:$;[j'C$;No?+Dk\1B4W3"DBMPI6m-PhF`Lu'%14L30HiJ2.3LZ4
+>>i*+?W87A5dDhEarZW@<?0NF_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&%15is
/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<L
Eb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"D
A7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g*nb<(.p)8PN#B+Co&"ATVK+
FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9G%kA--rac!F@9hQFD5Z2@<-W]F_u(H%15is/g+S?
A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9FD,5.9L_Al/M/)eBOu3q-Z^D=+A,Et+DkP&AISuA
67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4F!,[@FD)e=BOr<-@;TQuDIIBn+CT.u+Co1uAn?!o
DI[c2DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,XfATD@"F<G+.@ruF'DIIR"ATJu4DBO%7
AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9
ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+
G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k
+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9
A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k$8EZ-+Co&"+=D8BF*&c=$4R>;67sC"@:O(`
+CT.u+DkP&AKVEhATAo4@:O(`+=D8BF*)/8A2,G@$>"6#D..3k+=ANG$4R>;67sC%BQ&);@rHL-
FE7luATAo(Bk/?8+>=63%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDFE1f2BK8(5?O[?YDdd0uATMrI0J[0Q@ruF'DIIR2:-pQ_Ci<`mFCfN80JG7mBk)7!
Df0!(Gp%2\/KekJ@:UK8GT\aaFCfN8+Co1rFD5Z2@<-WG%15is/g(T1:-pQU:iC;qCghEsF!,R<
AKYo3A7]d(0mFfr+EV19F<G+.@ruF'DIIR2/g*u!Ec`FBAfu2/AISuA67sBs@<-!l+D,1nF(o*"
AKZ)+F*&O7@<6!4%15is/e&._67sC(ATD6gFD5SQ+CT>4F_t]2+D#G/F_>A1AU&<*DKI"3Bk)7!
Df0!(Bk;?.FDi:2F_PZ&+:SZQ67sB'+<VdL+<VdL+>GQ(0In8iDfTA2FCfN8+Co1rFD5Z2@<-W&
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;"Dg!lj%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l'DJs\R1E^^LD/XT/A0>;uGp"MRCh.9hE[`,ABk)7!Df0!(Gp!P'%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo
3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO:-pQUEb0*+G%De<ATMr9-6R&AA0>r=
F*(u1+Co1rFD5Z2@<-'nF!,(8Df$V.G][A3F<GC6F*%iu5'nn)6qKaF;a!/a1a$^I+=ANG$8EZ-
+@Jdg<)Yq@+>G!XBk(p$6qKaF;[j'g+BosV8OHHU4ZX]6HS-Ks+@Jdg<)Y4g,CUae/g)Ys0-W+n
-nID,FCfN8C2[W1.3M&3+?k-)+u(3.8OHHU%14g4>9H=*6W?uI3Zpg^6W?u,/M8/-3[\Z\A7T7p
+DPh*+E)(,C12-1%13OO:-pQUDfB9*+CT@7D/XK;+>GbsA8,OqBl@ltEbT*+%16Ze+E(d5-o!VB
/gEbU6W?u5HS0_!+E(d5-RT?1%15is/g+\ID/^V:@<?0*%16Ze+DkP&AKYT!Ch5aj+=LuD@<?0*
-[p/KD/^jO+=nlnC3=E0/no'A-OgDoEZd.\De't<-OgCl$;No?+Dbt)A0<WM0mFgOBk)7!Df0!(
Gmt*lEZf:2+=D8BF*)/8A25MA$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uU
F*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%
BeCMc.3gr&-OgCl$;No?+Dbt)A0>E*D/^V=@rc:&F<D#"-n$bm3\W!*3]\B;3[l16Anc'm%16T`
@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sC"@:O'qA8,OqBl@ltEd8dLD]j(3D/XT/
+<k?-@:UQ)Anc'm+Cf>,E,TW*DKKq/$>"6#E+*6lA0<7AATMs.De(UN%13OO:-pQUB4YslEaa'$
+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(+D#S6DfTnA@<3Q.@;^?5GAhM4Et&IO67sBh
Eb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)ATJu&Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD&
$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q%13OO:-pQUE+*6lA0>;uA0>_tCLnUt$>"6#E+*6lA0<7A
ATMs.De(UN%16Ze+DkP&AKW?J%13OO:-pQUF(fK9+Cf>4DKKq/$>"6#A8,QsINU<R$4R>REb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&Ci<`m
FCfN80JG:nBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C)A8,OqBl@ltEd8dL/M/)]Ddd0!0mFfs+EV19
F<G+.@ruF'DIIR2/e&._67sAi$;No?+AcuqF_kK.ATJu9BOr<)Eb&a%+>J*`1E^dNF*&O8Bk)7!
Df0!(GqL49@<-H4De:,6BOqV[:-pQUCgh?sAKYSr@<6-lCh4`2ATMr9@psFi/e&._67r]S:-pQU
G%G]'@<?4#3ZohmATMs.De(RRFCfN8C2[W<.3N&>AKYf-@:Wq[%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;DJs\R0b"Ib67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm
-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sC!E+No0FCfN8+>P'MBk)7!Df0!(Gp$^1
FCSu,@;p1+Dg3C<@;KNuGAhM4Et&IfEZf:2+=D8BF*)/8A25MA$>"6#=&2^^;a!/aA8Z3+-RT?1
=&2^^;a!/aI4eSs;FFFm$<L#$6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%215V5#G,?IZ=6rPO!
,?IZ=6rOO%%15d)<'<8b2D?g-:-pQUCi=D<F(or3%13OOEap4r+=D2>+@JXf;^X^h+>=om0Hb">
F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%1604;FFGH3ZohE:K0G/,?IZ=6rPNWI4cXD:JsSZ%14g4
>9G^EDe(4C%13OO:-pQUDfB9*+CT.u+Cf5!@<*J=FCfN8C2[W=.1HVqEZf:2+=D8BF*)/8A2>SB
$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%16Ze
+>=om0Hb=WF<Et?7T0a'0d'[C1E^UH+=ANG$4R>REZf:2+=D8BF*)/8A25MA$?BW!>9G;6@j"0.
7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]69M\VM/gFFn;FFG4
+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De't<FCfN8C2[W=-OgDoEZd%Y0ea_hF`\`o77L2b
$8EZ-+>Y-YA0<6I%13OO:-pQUAn?'oBHU_+Ci=D<De:,7DKU#3A0<WMA8,Oq+EqaEA9/l%DIal1
@;]UoD/=J?Eb0,sD.O.`ATAo3A0<7AATMs.De(UN%1604;FFGH3Zoi!/g+\BC`k)Q.3L2p+BM?:
6rR#Q9FV>L@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k;FFFm$:I<P
;a!/a-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpcAN;1^-p1p!4"r+3+@JXf;[j'g
+BosE+E(d5-RT?1%16Ze+E(d5-Zip@FD>`)1FEV=ATAnI+>GPmE-67F6q'RD%13OO:-pQUE+*6l
+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!CLeP8FCfN8
C2[W=-OgCl$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+DfTQ0B-:c+Ec5u>
+CT=6D..=-+EqaEA9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,F!,@/D.Rc2@<,p%
Bl.g0DfB9.Cj@.6ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC-OgCl$;No?+E1b!CLePr
DIal,@;BEs%16Ze+E1b!CLeP8FCfN8C2[W=-OgDoEZf4-CLnV9-OgCl$;No?+EM47G9CC6F`);B
%16Ze+Co1s+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s]U5@<6*B3B:FU$>aWhA9;C(F>,C*A8,OqBl@ltEd:DH/h1[U@:XIkF*')i1h:<1FD5Z2
@<-W9F=f'eCi<`m+>J*`1a$mOF*&O8Bk)7!Df0!(GqKO5:-pQU%15is/g*u/E-5u*FCfM9FD,5.
DfTB"EZd)]+>b3_ATMr9A8,OqBl@ltEd98[:gnBd+E(j7FD,4p$;No?+DbJ,B4W2tARTXo@VfTu
FCfN8+Cei$AM+E!:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBF`_>6F"DEEF*)/8A2,WWATMs.
De(UP+CT;%+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JP;"Dg!lk%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV
-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6miEN%15is/g+tK@:UK/F`_>6F"&5DEc5e;A9Da.%16Ze+E(d5-ZsNFCi^s5$>"6#D..3k+D,>(
AN`'s-u*^0FD)dEIWT.<E$m(c-SK4WDJLk=C3(a3$8EZ-+>Y-YA0<6I%13OO:-pQUDfB9*+=M>C
F*)/8A2G_X@;]Tu@r,^bEX`@eEZf:2+=D8BF*)/8A2GYC$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1-n$bm3\W!*3]\B;3[l16Anc'm%16T`@s)g4
ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$8EZ-+>Y-YA0<6I%13OO:-pQUDfB9*+EV19F<E:\A8,Oq
Bl@ltEd8d>ATVEq+CT5.Ec61FBOP^h+EqaEA9/1eATAo3A0<7AATMs.De(RM%16Ze+BM?:6rQ60
+CoA++=ANG$<L#$6rQ60+FPkD:JsSZ%1604;FFG^78,j*=&2^^;a!/a=&2^^;]pF9+=JX#/jM!L
.3hni;FFG459j6*;FFFm$4R>9:K0J<+>to-+AP6U+Dbt<+EM7CAIStU$?BW!>9G;6@j"0.7T1Zt
3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]69M\VM/gFFn;FFG4+FPjb
=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De't<FCfN8C2[W>-OgDoEZd%Y0ea_hF`\`o77L2b$8EZ-
+>Y-YA0<6I%13OOATAo3A0<7AATMs.De(RM%17,c+Bos9Eap4[77L3'4ZX]>+>GPmB4Z0--qmE9
4>%j[:JsSZ.3Nsi+BM?:6rOO%=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:6rOO%0d'[C1E^UH
-RT?1%16Ze+E(d5-Zip@FD>`)1a`_>ATAnI+>GPmE-67F6q'RD%14g4>9G^EDe't<-OgCl$;No?
+D,2,@qZun+Dbt<+E(j7F`)>CARlo<+Co1rF<GdGEb'56@;]TuEa`irDf'<9+ED%2@;TQb$>"6#
De't<FCfN8C2[W;-OgDa:JsSZ4ZX]6I4cXQDJUFC-Rg/i/g+4k;FFG^78+-tEap4r+=D2>+@JXf
;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%15Kl7T2H2+=JWl+F>:e+@JXf;^ih?
-8%J)4<cL&BP(ct-mM,K7T1a#0kE?o+=K?\3]f#EI3:pH7T0a'0d'[C1E^UH+=ANG$4R>REZf:2
+=D8BF*)/8A2GYC$>"6#0H`)(+E2IF+@JXf;[j'C$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+
G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0@r#Tt-Zip@FD>`)1a`_>%15is/g+e<DImis
FCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'5#$;No?
+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi
/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#Tt
-Zip@FD>`)1a`_>ATAo1@;BEs-RT?1%15is/g,4KDg*=6Dfor>Et&IfEZen,A0?=D0F\?u$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16oi
@:XIkF*')j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P@ruF'DIIR2+ET1e+Dbt)A0<T\GT_*>
F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8C2[W;.3NGF@:Wq[
%15is/e&._67sBjEb/[$ARmhE:2b;eD.7's+>Gl:3?Sb<:-pQB$;No?+<VdL+<VdL+<X9P6m-\^
F!,FBARf:_A7]9o@X0)<GAeU8@<-0uATAo7H#n(=D0%<P<+ohcCghF-ATA4e:-pQU+<VdL+<VdL
+=L`.Ci!Zn+A+pt.3N/0FCfM9Ao_g,+>Gl:3A)FH:IH=8@;[3/FD5Q-+Dbt)A0<T]%15is/g)8Z
+<VdL+<VePARTU%Derr,8jQ>tAnc'mF!+q7F<G[=ATD?)D..]4@V$[$Ec5E'ASlK2GA2/4+EMXC
Eb/bj$;No?+<VdL+<VdL+<Y--DIIR"ATJu&F!+'tBlnE-Ch=f'@<3Q1Ec5Dq@Vg<4@q]:gB4YU+
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,9tpE+EC!
ARloqDfQsm:IH<Z/ibO@.h)gp$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>;67sC!E+No0.!0$AFD>`)0e"5RDIal&Ea`E"0etF:+EqaEA9/l;Bln$,F`\a:AS,XoBl7Pm
$>"6#De't<FCfN8C2[W;-OgDHHS-FcG^)A4+>=om0Hb">F<Dtd1,(CH,CM1TDJU[J.=6IqA8Z32
-QjO,67sC)DfTB0%15:G/g,7XF?MZ-0d(+?F<Gua+>G!LDJUFC-QjNS+<VdL+<VdL+<VdL+<XEG
/g,7IF*)I4$9ieh+Dkt44ZX]B+D58-+FPjb1a$=HC`k)Q+<VdL+<VdL+<VdL+<VdL+AP6U+DkOs
Ec6".$>4!a4ZX]J3ZpL,,=#m^E$d2$+FPjbB6%r=-QjNS+<XEG/g,4LH=\4;AfrL:De*s$F*',c
+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGRY"%FEBZ,+>G!XBk(p$FEDUI%16rhD*9p&0d(FL@r!3(
D/B^h%16Ze+>Y-YA0<7AATMs.De(RM%13OO:-pQUDfB9*+=M>CF*)/8A2,be+CT.u+Co&"ATVK+
@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5-Zip@FD>`)0easa
$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1ATAo(
Bk/?8+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0
@r#Tt-Zip@FD>`)0easa$4R>;67sC%FDl22+EqaEA9/1eATAnI+>GPmE-67FG^+HB$4R>;67sC%
FDl22+EV19FE7luATAnJ+E2IF+EV^I%13OO:-pQUF*)>@AKYhu@rcL/%16Ze+>b3[F`\aCD/B^h
%15is/g,1GE+NI"ARoV&+Cf(nDJ*N'GAhM4+DtV)ATJu&DIal2FDl22%17,eDIIBn4ZX]?1E\_$
-Ra<o+u(3c.3L2p-7:/`-RV/1-8%J)4<cL&,!$ht/g)Qe.Nfs].3L,`BeCMQGpa%.5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtc+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=JreEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o)oc
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1E^^LDIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtg+ED%2@;TQuG^+H^+=K?\3]f#E
I3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K)iEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G
/g,4KDg-//F)rHX+>GPmE-67F-oN2gAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3
F!*.Z0ea_hF`\`S2^!-PDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=W
F<Dtk+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRXuh$;No?+ED%2@;TQuFCfN8+Cf>/Bk;?.@;]Tu
F*)>@AISu1HS-F^BQ&*6@<6K40d(FXF<Dtc+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^
BQ&*6@<6K40d(FXF<Dtd+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FX
F<Dte+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dtf+ED%2@;TQu
FEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dtg+ED%2@;TQuFEDUR+=K?\3]f#E
I3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dth+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^
BQ&*6@<6K40d(FXF<Dti+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FX
F<Dtj+ED%2@;TQuFEDUR+=K?\3]f#EI3<WRF:AR@HS-F^BQ&*6@<6K40d(FXF<Dtk+ED%2@;TQu
FEDUR+=K?\3]f#EI3<WRF:AQd$;No?+DG_7ATDl8FCfN8+EqaEA0>DoF(96)E-,f4DK?6o=&)%U
78l?1+CoA++=ANG$<Ktg9gquD3Zri'+BM<(9gqti$<'Jk;H-%[6W6-/-pK=4,?IW+9gqu0,<.A+
+=&9d4s26u=&)%U78kW[4=>5^F*',j+D58'ATDKp+Dk[uDJ=!$Ch7[/+EV19F<G+*F(96)E-,f4
DK@07$>"6#0H`=tE-67F=&)%U78k<[/g+(`:Jt.[:IA%i$4R>;67sBnASu("@<?''@<,gkFE1f1
Gp$a?Dfp#?+EDCCB4u+,+EV14+EV=7ATJu1@<-!lEZfI;@;ZM]:-pQUFD,5.B6%p5E-!.9DBO%7
AKWCCATMs.De(RO+Co1rFD5Z2@<-W&$>4!a4ZX]L3ZpX>+>GPm.NgH"+<r"AB4hY\9gMlO;G^:`
>"(S8+<sr_5tsdH%16`\B0A9u9gMlO;G^:`>"'Pr/g+e>B+52<;G^%Y;cH[Y3Zoh!4<cI%B4kj+
+?q2*4s2s^6!-WT:fBqh74B@+-8%J)4BG9D9gqti$:duj9M&/^;a!/a-p/\-+EVX<D/O/s@;9^k
?Q_HT0d%icATMrJ0P>EF-Qjra0d%TTC3=T>+<iih+=o,fBeCMQB4kj++=nil4s3?n:eXGZ<)X55
4!8l&+u(3QEc<?h+@f=+9M&/^;[j'C$;No?+D58'ATD4$AKYE%@VKq)@<-W9Ea`irDf$V=ATMr9
F*22=ATJt'$9KAW/g<"m>9G^EB6%r80H`(m-n%2*F*22=ALAoL/1)u5+<iin/j:C?+tt-R/g)l&
0I\+q/g)Pu0H`S(0H`(m>9GXS0H_S_,CM1!+CoA++=ANc+F>5Z/g)kkA8Z3+-RT?1%15is/g+e<
DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'5#
$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e
@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g,4KDg*=7Bk)7!Df0!(Gp%0M@<?Q"
$>"6#A8,QsINU<R$4R>;67sBjCi=B++EV19F>5HlA8,OqBl@ltEd8d9DIal"Ch7$m+E_W4$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,Ci<`m
FCfN80eb:lBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,F'A8,OqBl@ltEd8dL/M/)]Ddd0!0eb;++>RhF
+E):2ATAo3Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-WG%15is/e&._67sC(ATD6gFD5SQ+CT>4
F_t]2+=M>CF*)/8A25SVCi<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et
+>>E./i5'f$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4
FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+E)41
DBL?LATMs.De(RV.3N&:A0>MrF<G"4Dfor.+>GQ(0JFVnDfTB0+EqOABQ&$8+Co%qBl7X&B+52Z
EZf:2+=D8BF*)/8A2,bc%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1TDJU[J.=6IqA8Z32
-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%
67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL+E(d5-Zip@FD>`)
0easa$4R>;67sC!E+No0FCfN80eb:(@;]TuA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS
+EM[>FCfME+DkOsEc6".$>"6#De't<FCfN8C2[W;0JFj`$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s+FYFe%13OO:-pQU
E+*6l+Co1rFD5Z2@<-W9FDi:BARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6lA0<7AATMs.De(RV
0II;:%15is/g,4WDfTD3GAhM4Et&I?HS-F^BQ&*6@<6K40H`)(+E2IF+F&-U%13OO:-pQUEb03$
@<?'kCj@.5BOPdkAKZ28Eb$;1@;TRs+CT.u+EMXCEb,[eEb0,sD.Pjk+>GYp3ZoduHS-Ks+F,CY
/M8@t-Qjca5V+674s2s30d%Z$+=o,f.!R3a,C(^\.j/OY+<u.Z%15:G/g,4KDg-//F)rHX+>GPm
E-67F-nlcaAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S0d(LJ
DIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dte+ED%2@;TQuG^+H^
+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K#gEb0,sD.Oi7G^(Y[-p1p!4"r+3
+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o<&eAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh
+EM47GApu3F!*.Z0ea_hF`\`S2'?pNDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/
+>=om0Hb=WF<Dti+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF
+=K/kEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o`>iAStpn
AKZ5BGUXa`4CL940I_DmG^+HB$4R>;67sC%BQ&);A8,OqBl@ltEd8dKFCB94%15:G/g,4KDg-//
F)rI7Bk/?8+>=63%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=-tRXFEb0*!+E_a:
+E(j7E-67F@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f4=>5^F*',j0Hb4N
Eb-A1ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7KsFD*$2$4R>;67sC%
BQ&);A8,OqBl@ltEd8dKFCB94%16Ze+Co1s+FYFe%13OO:-pQU@r-()AKWCCATMs.De(RV0I\,T
Bk)7!Df0!(Gp$O5A0>AuARTI!F`7csATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<
$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,
%16r\CLp7`Chte#67sa)@;BFLF_kkJ+ET1e+CoV3E$/S,A0>o(Ci<`m+D#D/FEo!>Bk)7!Df0!(
Bk;?<%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE;e9oiASkmf
EZd+k0JEqC:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttirF`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l'DJs\R
2]uO>A7]9oASlC.Gp%'7FD)e=ATMs7%13OO@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,F(H^.$?B]t
F_Pl-+=CoBA9;C(FCfJ?%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%16Ze+E(d5-Zip@
FD>`)0II;:%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=r
Et&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO
ATAnm78m/>4ZX^&@;BEs-RT?1%14L30HiJ2.3LZ4+>>i*+F?-l<(0_b0F\?u$>"6#A8,QsINU<R
$>"6#1E^UH+=ANG$4R>;67sBlD/aTB+E1b2BHVD.F*)I4$4R>;67sB9+D#D/FEo!>Bk)7!Df0!(
Bk;?.Df-\:@<?/l$>"6#De't<FCfN8C2[W;-OgD;+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+
-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/?8+>=63ATAnm
78m/?4ZX^&@;BEs-RT?1-n$bm3\W!*3]\B;3[l1u3ZqBj;cGI\$>"6#1E^UH+=ANG$4R>;67sB:
+D#D/FEo!>Bk)7!Df0!(Bk;?.Df-\:@<?/l$>"6#De't<FCfN8C2[W<-OgD;+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%16Ze+E(d54$"a2ATMs.De(OE
FCfN8C2[W;-OgDoEZen,A0?=D0F\A#EZe=M;cGM83Zr9JCLnV9-OgD2-nlf*0I\,*3Zp+;.3Nsu
+B1d.<&+miATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5
A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$>j3eAPcfWBQRg,F>,FE67sa)@;BFN@<?1)ATMrI0d(Qi
/Kf+GFE8RIE$076F*&O8Bk)7!Df0!(Bk;?.AoD]4E+*j%+DtV)AKYK!@<6K4FCfN8F"Rn/:-pQB
$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8C2[W:/0K%GF*)/8A2,VXFCfN8C2[W<.3N,@ART[l
A.8l@67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;"Dg!lm
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l'DJs\R2^!0\Ch[u6Bl8$2+EVgG+EV19FE8QQD..3k:gnHZFCfN80JP+q
@<?0Z@<?1)ATMrI1+<Y>%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%15is
/g,7IF*&O8Bk)7!Df0!(Bk;>p$=mj\FE9T++?MV3FCfN8C2[W:+<Yc;F*)/8A2,3KATMs.De(UN
%17<$H#R>94ZX]I3[\f`F`&=1A9MO)@N]i*EagC*$4R>[Dfor0Bm;d%+>GPm,p5E0+>kE!0F\A4
ATD6lBm;d%+>Y-$+=DCV.Nj!a%16NSG%G]'AncKQ3Zp."3Zoem>V7B5$=e!lC1_1)4ZX]@+?CVm
Fs(p4/gh)8%15is/g,%MF`&=1A9MO)@N]i*EafIbFCfN84ZX]?0H`S4+>GPZ$>"6#De'tE+E2%)
CER/%@ruc$$>"6#FDYu5Ddso/F`\`f3[]#\F*&OBDfor0Bm;!7$>"6#1E^UH+=ANG$>"6#De'tF
+E2%)CER/%@ruc$$?Tj#F?MZ-0d&M"-ZrZA%16Ze+EVI>Ci<f+E-67F4$"a2ATMr9G%G]'AncK;
%16Ze+>Y-YA0<6I%16Ze+E(d51*COM@r!2tBk)7+%172gF*'Q++>Y-$+=DCV.j0*b%16Ze+EVI>
Ci<f+E-67F4$"a2ATMr9@:XOmEaiWpGT^L7DJEctGUEq-ATAnI+C?iGA8Z3+-RT?1ATAnL+E(d5
-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16r\CLp=NFD,c-F*')k:-pQ_D..3k:gnHZFCfN8
0JXbm/M/)^@;BFq+E1b2BHV8*Ec#r@@<?4%DK?q=AfrL=@;BFN@<?1)ATMrI0e"^a$;No?%15is
/g,=KEaiI!Bl,mR@<6L4D.Rc2.!0$AFD>`)0J">gATMs.De(RR+EV19FD>`)1+=>UEb/[$ARl5W
:-pQU+<VdL+<VdL+<Y*1A0>u*F*&NQD..3k:gnHZFCfN80JP"!Ecl7/$;No?+:SZQ67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;DJs\R2[p*h67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G0
3Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+EV19F<G+.@ruF'DIIR"ATJ:fA8,Oq
F$2Q,4$"a2ATMs.De(OE+EV19FD>`)0d(RLF*)/8A25MA$?pT;E+O)R3ZpLF-Z3jFDBN@uG%G]'
+Eh=:@ODTl%16]]Ch7QoFD*fu+=LuD@<?0*-[p/KD/^jO/13(u%13OO:-pQU@;Ka&E+*j%+E1n4
D09r/FD5Z2F!,O;Dfol,+DkP&AISucF?MZ--tt:W1FXG4/g;tl0d(0_+>XH6%16Ze+E(d5-np!e
F=DQIBk)7+%172jBlcEu+=JpjE-*OUGBA+LATJ:fATAo8D/a<0@j#`5F<DrQBPDN8%16Ze+DkP&
AKYT!Ch7QoFD*3Q0J7'SF!hD(ATAnL+E(d5-RT?1%16Ze+E(d5-o$'fF=DQIBk)7+%172jBlcEu
+=JskE-*OUGBA+LATJ:fATAo8D/a<0@j#`5F<DrQBPDN8%16Ze+DkP&AKYT!Ch7QoFD*3Q0eR0T
F!hD(ATAnL+E(d5-RT?1%16Ze+E(d5-o--gF=DQIBk)7+%172jBlcEu+=K!lE-*OUGBA+LATJ:f
ATAo8D/a<0@j#`5F<DrQBPDN8%16Ze+DkP&AKYT!Ch7QoFD*3Q1+m9UF!hD(ATAnL+E(d5-RT?1
%16Ze+E(d5-o63hF=DQIBk)7+%172jBlcEu+=K$mE-*OUGBA+LATJ:fATAo8D/a<0@j#`5F<DrQ
BPDN8%16Ze+DkP&AKYT!Ch7QoFD*3Q1G3BVF!hD(ATAnL+E(d5-RT?1%16Ze+E(d5-o?9iF=DQI
Bk)7+%172jBlcEu+=K'nE-*OUGBA+LATJ:fATAo8D/a<0@j#`5F<DrQBPDN8%16Ze+DkP&AKYT!
Ch7QoFD*3Q1bNKWF!hD(ATAnL+E(d5-RT?1%16Ze+E(d5-oH?jF=DQIBk)7+%172jBlcEu+=K*o
E-*OUGBA+LATJ:fATAo8D/a<0@j#`5F<DrQBPDN8%16Ze+DkP&AKYT!Ch7QoFD*3Q2(iTXF!hD(
ATAnL+E(d5-RT?1%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>REb00.ASrVE%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&DIn$&6=FCjEbBN3ASuU20JG4V
67sa*ATqZO@:VZEB6A'&DKKqR0JO\l/M/)ZDK]H)Bk/>7DIn$&.3N&>B6A'&DKI"CATMs7/e&._
67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AH9i+>Gl:3?TFR$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/Os%15is/g)i%F(K;5+<Wm5%15is/g)i,DJs\@+<YfGA79RkA0>u4+A,Et+A*c"ATDj+Df-[U
/hf%2%15is/g)i,A7]7)2'?LLEc#6,%15is/g)l'DJs\R1E^gZA79RkA0>K&EZdt502-(tFa+?&
%15is/g+,,AKYT'Ci"$6Bl7Q+Bl7m4FE8RGBQ&$0A0>o(F*2;@+DG^9ATDg0EZf41F)tc&ATJtB
DIn$&.4u&:@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%172g
F*(u2G%ku8DJ`s&F<Dr?@:U`I-V@0&-OgCl$;No?+=M,=G@W-F@:NeYE--.DDf0B:+C].sC`k;]
+C]86ARlp"BleB;+E(j7@q]:k@:OCjEZf14F*)I4$;No?+D,P.Ci=N3DJ()#EbBN3ASuU2+EM47
F_kS2@V$[&ASPddFCeu8%13OO:-pQUDKTf-EbT#+@<?F)Et&IfEZf72G@VgM%16Ze+Dtb7A0<Z;
$>"6#DIn$&+C?o6$>"6#DIn$&+>P`*2[p+*EZf72G@VgUC,?A,ATAo2ATqZ-0ePFG2`>5&1^se'
EZf72G@VgNGVL<`+<VdL+AP6U+EV:.+Du==@V'R&AKY])+A*(MATAo2ATqZ-1gtD]%16Ze+Dtb7
A0<ik3&ilW3&`cT2`EZU3B9)[3B9)[3B9)[3B9)[3B9)[GRY!kEZf72G@VgN0etL?1GgpG2)[?O
2`NcW3H@&<2`N`U2`N`U2`N`U2`N`U2`N`U2`N`*$4R>;67sC%H#7#/Ci_-MF`(o'De*E%%16Ze
+Dtb7A0>qS-Qm;FFCB&qD.P(($>"6#DIn$&+E]^f-Z3jFDJ<U!A7]XeD.Rc9%13OO:-pQUDKTf-
EbT#+@<-BsH#k)VEa`irDf$V<BOPjkF!+n/A0>r-H=_.H%16Ze+Dtb7A0<9b-pKO;,;Ubo0F\A#
EZf72G@VgE5:A`Q.3gVt,Vol:ATAo2ATqZ--pK+E1asY*.3r7V%16Ze+Dtb7A0<9b-pKO;,;Ubo
1,COA%16Ze+Dtb7A0<9b-pKO;,;Ubo3,18Z$>"6#DIn$&+=KH&5;Xf61FXS(/iYjM2J"X#%16Ze
+Dtb7A0<9b-pKO;,;Ubo3&ilW3&ilV2`EZS2`WlY3B9)[3B9)[3B9)[3B9)[3B;<n$>"6#DIn$&
+=KH&5;Xf61FXS(0etL?1GgpG2)[?O2`NcW3H@&<2`N`U2`N`U2`N`U2`N`U2`N`U2`N`*$4R>;
67sBlD/aT2ATJ:fATAo2ATqZ-BeD(K$>"6#DIn$&+=ANG$>"6#DIn$&+CR;?$>"6#DIn$&+>P0M
3XlF-EZf72G@VgP,@NVB$>"6#DIn$&+>>&r/iX:IATAo2ATqZ-0H`%p0F\A#EZf72G@VgM+>>&g
.OPZ4ATAo2ATqZ-0H`4u4==ldF*&OHATMs-DJ(=+$>"6#DIn$&+>k8q+>Y9$+>b3$%13OO:-pQU
@W-9tATDU$DIjr#@<6"$%16Ze+Dtb7A0<Qf-RU#Z+<VdL+<VdL:-pQUD/"6+A0>AjF(KD%$>"6#
DIn$&+=ANu-RUu0%16Ze+Dtb7A0<6I4"*3R-Xq"4-Rh,)-OgDoEZf72G@VgP4!uC;-RT?1ATAo2
ATqZ--RUu'-QjNS+<VdL+<XEG/g+S=D/XK;+Cf>1Eb/a&+Du=<C`mV(D.P7@DKTc3+Dbt+@<?4%
D@HqaEZf72G@VgD-T`\'4!uBu+<VdL+AP6U+CT)'Df^"C@rHC.ARfg)DKTc3+DtV)ALns?De!3t
Bl@l?+CoD#F_t]-FCB9*Df-!kATAo2ATqZ--Xq"4-T`\'+<VdL+<XEG/g,=GCh[E&DIIBn/0JhQ
Cht51De!3tBl@ku$>"6#DIn$&+=ANu-Y#2BG^*\9D^QYM+AP6U+Du=<C`mV(D.P7@G%#3$A0>],
@psInDf-!kATAo2ATqZ--RUu'-T`\fDfp(CF(9-/AKYE!A0<KW/ghc:67sBuF_kk:DIIBn/8T67
@<?4%DBNk5+CoD#F_t]-FCB9*Df-!kATAo2ATqZ--Qjcu-QjcZ+<VdL+<XEG/g+V>@;]k%%16Ze
+Dtb7A0<6B+=B5u+=B5u+=@U*%15is/g+_G+Dtb7A0<7AATMr@+<VdL+<XEG/g,%M+Dbt+@<?4%
DBLMRFD,B0+Cei$AKY].%15is/g,%M+Dbt6B4Z*+@;[3!EcQ)=+CQC'Bk)7!Df0!(Gp$gB+Du+A
+CfG'@<?'k+DG^9@3B)lAmoguF:ARP67sBkBl[cpFDl2F+Dbt+@<?4%DBL&M8muU[@<-W91,(C9
.1HUn$>"6#DIn$&+=CW,A0>Aq@<-E3>UKsfATAo2ATqZ--SR"t%13OO:-pQUCh[ZrCj@.FH#R\C
%16Ze+Dtb7A0<7AATMr@4""9ZH?=(E-QjO,67sBkEbT].+DbV2FCfJ8Eb065Bl[cq%16Ze+Dtb7
A0<7AATMr@4""]QEb-U@+<Ve%67sC"@<?0*D09oA+C\n)Ec5l<ARm>7AM.UJ+<Ve3BOu3q%16Ze
+Dtb7A0<7@-T`\s-QjNS+<VdL+<Ve%67sB'+s8'=$>"6#DIn$&+=D8BF*&ck-Y#2NATD?0+<XEG
/g)8\+<h7%ATAo2ATqZ--Zip@F=0-t@lbt[+<VdL+AP6U+<VjN+q4ljEZf72G@VgDFCfN8-T`\c
3a=$T+<VdL:-pQU+EDC=FCeu*@Wcc8DJpY.Bl[cpFDl2F+DtV)AIStU$;No?+DG_:@;KXg+CoM,
G%De6@;TRs+=L#a+Co&&ASu$iDKI<:$>"6#DIn$&+=D8BF*&ck-Z!^=B6J30F_t\N>^1L2Dff6&
CKtRk>^'n"3Ai/n$>"6#DIn$&+=D8BF*&ck-Y#1u>^1L8Dd7-fDL#JsDes?0F'L(%$>"6#DIn$&
+=D8BF*&ck-Y$CBG^+=K>]b!pDKBc8F(Jle@rH1%DHq7!@<6*0%16Ze+Dtb7A0<7AATMr@4""8o
G^+=K>]b!pDKBc8F(Jle@rH1%DHq7!@<6*0%13OO:-pQU8T&][Ch[E&@q]:k@:OCjEcW@;DBNh*
D.Rc2@;]TuE+*j%F"Rn/:-pQU6tp.QBl@ltEd8dF@;TRs+CT;%+D,P4D.R6#Ao_g,+=A:9@4ce2
>;.Wh?!BTH>$WKb$;No?+CT.u+E1b2BQG;1DI[L*A7Zm*BOr;pA7TCrBl@ltC`m5$@<,ddFCfK6
+=L&P<(KAI;H#"e+EV:2Et&IO67sBpF!+m6,'.1)AKi7<F^fE'F<GL6+EV:.+Cf(nEa`I"ATDi7
F*2G@DfTr2A0>?,+Dl%<F<G78F*)IU%13OOATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L6W,H_E,9)o
F(H^J4""N!>^C^<Df@'5$>"6#DIn$&+=JUTD]ik1DIjr%DIdf9/43</7P#p+Ch7$rALAog-Y#2B
H?s[OE$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L9L^Q\E,9)oF(H^J4""N!>^C^<Df@'5$>"6#
DIn$&+=JUTD]ik1DIjr%DIdf9/6"o%/15CQARTXk-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE-Z3iF
F)59+BOu6->Td`u+DtV)ATK4J4""N!>^C^<Df@'5$4R>REZf72G@VgD@UWeVDg?CO4""N!>^C^<
Df@'T6W,H_Ch7[/-OgDoEZf72G@VgD@UWeVDg?CO4""N!>^C^<Df@'T6W-TI/157FF)r]<$>"6#
DIn$&+=CW,A7BJ&F!j$s@ldk@H?=(E-S/4_67aL#ATMo?%13OO:-pQU<(0_b+B)9-6UapP7TE+k
$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No00F\A,ATqZZ@;].\DD3b!:-pQ_
DIn$&9jqp@Bl5UY0d(Qi/KeqBG@Vh5@;^3rC`lenDId[0F!,%=@;Tt"AKYE!@;KjpF_,VH%15is
/e&._67sB[ATMs7+BN8pA8c[5+E):7ASuU$A0>;u@;KjpF_,V:De:,'G[YH.Ch7Z1AoDg0A0>T(
+A,Et+CoD#F_t]-FCB9*Df.0:$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*0lCoQ0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFtks!@rc-hFCcS<@<-(#F`S[LBl7I"
G9CF1@ruF'DIIR"ATJt'$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;67sBpAftu0
+Dbt+@<?4%DBNY7+EML5@qfOhARlp*BOr;sBk)7!Df0!(Gp!P':-pQUBlbD,Eb/[$ARlotDBO%7
AKYMpAmoguF<G+.Eb/a&DfU+4$>sF!A0<7:@;BFkH":W!FD5Z2@<-W@%13OO:-pQU@rc-hFCcS=
Bln#2DIIBn+DG^9Ci<flFD5Z2%16uaG@VgDDIn#>4""N!05>E9C3=E00..29%15is/g)fP+E1b2
BHUhsCh[a#FCfK6+CSbiAT2a&A.8l`ATqZ--Z+->Bk&MP-Y#2BC2[WtF`(u+Ea3[-H#.%sE+*j%
-Qij*%15is/g+YEART[l+E)-?GA1r*Dg-7F<DGn(DImp6DfTV9F(f!&AISuA67sC'DI[U%D.RU,
+CT.u+D#(tF<G16EZfXGF`JUBATW-7Ebce/DK]`7Df0E'DKH<p:-pQUDIn$&+=D)MFED2-Eb-U[
-X9nnARf4f@<4+V>]k+!EcYK#A7At_ATD$jDe*U*DJO-$F=/1?$4R>;67sBsBl8'<+Co1rFD5Z2
@<-W9E+*j%%15is/g,%CG@VgDCh[ctBk&MP-SK.OD.PA=DD-*FAM8(4DJ*N.%13OO:-pQUDfBf4
Df0!"+EV:2Eb$;,FCf;3BlbD-Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@ku$>sF!A0<7;ATq^+-T`\c
3\P5dA867)CLqR/0./h/6tp.QBl@ltEd8d<De!p,ASuTuFD5Z2+>,9!-OgCl$;No?+B1d.<$5+>
6UO:@;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>@\OFDl,0DD3b!
:-pQ_DJsW8E+No@0JO\l/M/)S@<6-m+Du*?A8,OqBl@ltEd8dGE+No0FCfN8F"Rn/:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+>GTgDg!lq+E_X6@<?'k+D,P4+A+RG9PJBeGRXuh$;No?+A,Et+Cf>,D/E^!A9/l7BQ&$0
A0>o(E,Tc=+CQC1D]iS)@ruF'DIIR"ATJu4E+No0ATDg0E\7e.:-pQU<+oi`AKYE%AKZ&4D.OhY
<)P)b+=K['@qBV$Bl@l3<,WmWF_kV<+EVNEFD,B0+D5h2A7]RkDIj7a:-pQU@;]TuFD,62+CT;%
+Co&$DffQ$+DG^9FD,5.AoDL%Dg,o5B-;8*EbTK7/g(T1%16T]ARTU%-RU$@+Cf>"F`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'FCfN8ASu[*Ec5i4ASuT4-XpLp-T`\J:IHQ>$4R>R
EZen(C`k*CD^Pu$ATAnJ+Co&"+=C]2Ch7^&Df0VD%16Ze+>b3OAS`JN3[\?VAKYr1F)u&)Ch4t'
$4R>REZen,A0<Q8$>"6#0Han?A0<Q8$4R>REZen,F)W6LDJs!&A9hj,D.P(($>"6#1*AS"A8-+(
+=D&FFDl,0DC5l#%16Ze+CoD#+=D&FFDl,0DC5l#ATAnK+?:QTDdsn;DJs#nDIdZ5%13OOATAo(
E-#T4+=ANG$>"6#A8lU$F<Dr-<E)FR6W?iZ-Ta(;0F\?u$>"6#ARlo2@ps7sARoLs-OgDoEZd+[
3?VmD+=CfBDfp#0De!p,ASuT;%13OOATAo(DJUFC-OgDoEZen1C`k*C@:Wdo%16Ze+>G!LDJUFC
-OgCl$>"6#B4Z0-4$"a7Dfm14@;^00B4Z0-F`So>$>"6#0d(+?F<EY+-Za3HEd8dFD]iOuDBNJ.
-OgDoEZd%Y0f:(dATT%V3[]2kFWbX7EcYr9F<G:8+F.mJEZeq6Ec5tG%13OOATAo1@;BEs-RU#Z
+:SZhEZd%YD..3k+=D8EATD?)@<,p%DJpY.Bk)7!Df0!(Bk;?.DfB9*+D#5"-OgDoEZd+[1*CFB
CLnV9DII'a-OgCl$;No?+@T7-+E(_4BlA-8Cj@-ODIn$&.3NJMF*&O6AKYDjCh4`2D]iY7DI[d&
Df-\ABOu&j$;No?+Co1rFD5Z2@<-'nF!+n3AKYK!Df]K#+E)9CG@_n@Bl%T.DIn!&EZeh&+CS_q
AISuA67sC&D]iP1ART[l+Dtb7+Co1rFD5Z2@<-'nF!,R<AKZ&&D.OhuE,]W-ATJu+DfQsKEb/lo
.1HUn$;No?+CfG'@<?''@3BH!G9D$GBlS9,Cj@.@@;TRd+Co1rFD5Z2@<-W&$>sEq+AP@,6qKa/
3Zr<OG@Vg?3b2r8DKTf'@;9^k?RI31$4R>;67sC'DK9<$BleB-EZee.A0>o(Eb/ltF*(u6+Dtb7
+Co1rFD5Z2@<-W&$>sEq+>Y-\AS5Nr4u.I[79;lK6OaB?ATAo6AS5Nr14:cM79;lK6OaA3$>"6#
E+*6lA0<7;@:Wdo%16Ze+ED%7FCZLADII'a-OgCl$>"6#E-67F-Zip@FCf?5Bl\-0D.RU,-QjNS
%16Ze+>G!XF`\`R@ps7s-T`\sFDl22+EMXIAnE00Bln$,F`\aEE+Np$DJ()&Bk)7!Df0!(Bk;?5
%16Ze+>b3[F`\`RH#IgQ4""_bEb/ZqCj@.?ARTI!Blk^3$4R>REZfC6G&JKN-OgDoEZd+[Eb0E4
+=ANG$4R>REZfC>+=CZ-DKKoADC5l#ATAo6FEAWQF)Q)>Gpa%.%15is/g*S^;BSq_D]iOuF(KD8
De:+?B5DKqF"&5A@;[3"F`(]2Bl@l3GA2/4Dfp.2$;No?+CT.1DfB9*+Co1rFD5Z2@<-W9@<3Q5
BOuH3@W-@%+CT.rCjC><+DG^9D.RR&Ed8dODfTB0%16uaEZf"2Ddmc1-Zip@FCf?5Bl\-0D.RU,
-QjNS+<Ve%67sBsBleA=B5DKq@;Kuo$>sEq+>GSnB5DKqF!)iPATMs)DK]`7Df0E'DKI6K+<XEG
/g+bKCht58FCB9*@j#YtD.Oi"CghC+BkD'h@<?4%D@Hp^$>"6#F`V,8+=D&FFDl,0DC5l#ATAnL
0d(U[ATJtADJsW8E+No7%13OO%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5
A8,OqBl@ltEbT*++:SZhEb00.ASrVEDJsW8E+NodATMs70JG4V67sa*Dffo:AStIYF*)IW0JO\l
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
+Co1rFD5Z2@<-'nEt&IfEb00.ASrVEDe).SB4bRdCbROt:-pQ_De).SB4bRdCbROt+ET1e+C\c#
Bk&86De(:>Bl8*&Ch[E&@<-"'D.RU,+EV19FE9&D$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(i/@ruWuATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lq+E_X6@<?'k
+D,P4+A+RG9PJBeGRXuh$;No?+B3#c+D,P.Ci=N3DJ()+DK'`?F!,O;Dfol,+ED%7F_l.BBl5&)
EcQ)=+Dk\2F(&]mF!)lKATqZ6/e&-s$=dm`@<*J<-QlV9@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgE)ATMs)DK]`7Df0E'DKI!K@UWdp4"!Wr6miEN%15is/g)Q\A18X0@q0(h
FE8RCDJXS@@r-O%Ch%9(/M/)TBOPpi@ru:&+Dbb5F<G"0A0>?"G\(D.Ch[s4F!(o!:-pQUDe:,%
BOPpi@ru:&+Dbb5FE9&W+BDoeBk/>sBk)7!Df0!(Gp%!5D.Rc2D09oA+CT)-D]iV9BleA=Df-!k
:-pQUFD,5.D..L-ATAo(Bk)7!Df0!(Gp$p3F*'#W+@UHbEd;b?Bl7Q+AScF!+EM47F_kS2@V$[&
F_#'"Gmt*U67sC$ASPddFCeu8%13OO:-pQUDKTf-EbT#+@<?F)Et&IfEZf:2+>=63ATAo3A0<Z;
$>"6#De'tt1CX\&EZf:2+>P`*2[p+*EZf:2+?4*m%16Ze+E(d50ePFG2`>5&1^se'EZf:2+>J*q
+<VdL+<Ve%67sC&BOr<(F_tT!EZep9Bl5%c%16Ze+E(d51gtD]%16Ze+E(d53&ilW3&ilV2`EZS
2`WlY3B9)[3B9)[3B9)[3B9)[3B;<n$>"6#De'tF0etL?1GgpG2)[?O2`NcW3H@&<2`N`U2`N`U
2`N`U2`N`U2`N`U2`N`*$4R>;67sBuF_t]1Bk&8oEcPT6F!)lKDf-\8F_kk:Ea`irDf$V<BOPjk
F!+n/A0>r-H=_.H%16Ze+E(d5-pB[V-pKO;,;Ubo0F\A#EZf:2+=KE75:A`Q.3gVt,Vol:ATAo3
A0<9a3^5#W1asY*.3r7V%16Ze+E(d5-pB[V-pKO;,;Ubo1,COA%16Ze+E(d5-pB[V-pKO;,;Ubo
3,18Z$>"6#De't=4utnV5;Xf61FXS(/iYjM2J"X#%16Ze+E(d5-pB[V-pKO;,;Ubo3&ilW3&ilV
2`EZS2`WlY3B9)[3B9)[3B9)[3B9)[3B;<n$>"6#De't=4utnV5;Xf61FXS(0etL?1GgpG2)[?O
2`NcW3H@&<2`N`U2`N`U2`N`U2`N`U2`N`U2`M6R%15is/g,4\D.7F"F!+n/A0?#4Bk)'lAKYE%
AKYT'Eai`nA7]Wf$>"6#De'u33]nd2Dg-5?DJ(=+$>"6#De'u53ZoeZDf7!4$4R>;67sB[78m/.
;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%17#a;Is9I
Df0B:0JG4V67sa+A5ZuIA8c@%Gq^p,+ET1e+C\c#Bk&86De(:>Eb/Zi+E).6Gp%3?F*)IU%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE:LeKb@V'R&0f_6S%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l'DJs\R3$<?_A79RkA0>K&EZdt502-(tFa+?&%15is/g*GlFCfJ8@3B)p@ruF'
DIIR2+D>2)+C\nnDBNk:ASu'i+ED%%A1__;Cj@-q:IH=8Df'?"DIdet$;No?+EM47F_kS2DJsV>
@V$Zj@VfTuFDi:3BOPdkAKY]/+DG^9@;^?5G@>bL%13OO@r,^bEZc_W+BosuDe!p1Eb0-1+=CW,
F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%172gF*(u2G%ku8DJ`s&F<Dr?@:U`I-V@0&-OgCl$>sEq
+E(d5-Zip@FD>`)0IItc+<VdL:-pQUDfB9*+Eqj?FCbmgDImi2A8lU$F<Dr/76s=C;FshV-QjO,
67sBpDKBr@AKZ2;Blmop@VfTb$4R=s+Bot5G^)A4+>F<4%16uaEZf=DF<DrUG^(SY+<VdL:-pQU
Bl8!7Eb-A(Bk)7!Df0!(Gp$gB+Du+>+D#D/FEn<&%16uaEZd.\De't<-QjNS+<VdL:-pQU@r-()
AKYE!A0>o(/T5T>DBNt2@:Us.DJXS-$>sEq+>P'XA0<7AATMs.De(OL%13OO%16Ze+E2IF+=DDY
GUFUV+<VdL:-pQUF(fK7Ch+Z+Dfd+2AKYr1F)u&)Ch4`2D]j"AF>%09CbKF;Ddk@P/hS8XF<G()
FCfK$%13OOATAo(AS`J:G^+H\+:SYe$>"6#B6%r6-Z3@'@4+,aG^+H\%13OOATAnI+D5M/@WNY>
G^+H\%13OOATAo(Ddsn;G^+H\%13OO%15is/g++^;cFl<<C9,B;c?.c9FV=<$;No?+ED%3E+No0
@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$?0E`CLg.JDL!oj:-pQ_E+*6lA5-KMGq^rqF=f'e
D09Z:BlIm"+=M2;@r#U(+EV19FE9&D$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(i3AT2a&D.7's+>PW)0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1-$J"E+EC!ARloqDfQsm
2_Rj=DKU15$4R>PCh7$q+=ANZ>9IEo@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$=mj\F?MZ--Zip@FD>`)0II;:%15is/g+,,
ATD?)G@>P8@3BB)DJ(PBFCB&tBl7Q+@Wc<+Bl5&6ASbpdF(KD8E,oZ2EZfIB+C]J-Ch+YD2E;3R
:-pQUFD,*)+Cei&F(Jl)FD,5.-u`U)CLek:G%G]'+EVNE@rHC.F`;FFFD,5.A8-'q@ruX0Bk;?.
De:,0F_kk'$;No?+E(_(ARfh'/0JXZANCrJAfu2/ATD?)G@bf++Du*?F*22=ATJu.DBN@1A8,Oq
Bl@ltEd8dLBOr;uBl\9:%15is/g)Q]@:O(`.3NhQF_kS2@rHC.F`;FFFD,5.A8-'q@ruX0Gp%3B
AKZ&*@rH6q+=M2;@r#U(+EqaHCh*t^:-pQUEb03.Ec`F7Bl[cpFDl2F+Cnnt@:s.(+B3#c+D,&)
CigeD@<3Q5Ea`HhA0>u4+=M>KE+EC!Anc'm.3N&:A.8l@67sB/FDYu>F(JrtCh5%J%13OOATAo3
A0>Ds@rr.e%15is/g+Y?ARTU%@;^?5F*22=ATJ:f0d'[C1E^4>C`n-Y+>Y-NDJUFC-OgCl$;No?
+Dl7;FD5]1AKYr#@r#U&F!,O;Dfol,+EqaECCLV^EZf=0@r#TtA8,Oq%16Ze+E1b!CLePuBk)5o
$>"6#E+*6lA0>Ds@rr.eATAo4@:O(`+Co1rF:AQd$;No?+B1d.<$5+>6UO:@;asb\%13OOATD@#
E+No00F\A0ASbpdF(K*)A55HD.WT*:ARTXkC2[W*F"JsdAnc-kC`me/EbTK7+CT5.Ch[Hk+DG^9
@WcC$A8,po+DPh*+ED%0ARTXk+F7a@/e&._67sAi$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/
+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80kP!+0f1")
+Cf>(DKBB0F<DrFC2[W1+D,P4+Dtb7+Dbt+@;KKa$;No?+>GTf@<jUc+>"]a8OccQ:+7;sG[kQ4
A7]9oAo_g,+EMI<AKWC6A7]_$.3N_DF*)I4$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=DVH
A7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1-UC$a
FE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$
ASbpdF(HJ)Bk)7!Df0!(Bk;>p$=e4!E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3C2[Wn
ATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(e
DJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8Bl@lP3Zot;
0RHDf6rm#M%13OO:-pQU8l%htF*VhKASiQ(DKBo.Cht5?BlG2/DBNn@F<G+.@ruF'DIIR"ATJu&
Ch[Hu+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV8P`)b8PhQ2+=CoBA7$]8-mpWS-Qlo4@<-F3@N]E(
A9MO)F(oQ1.4ci!H>.=G%15^'6psUF<)Q:S<E)Oc:0L4c4ZX]6+tb6/9M$T_4)AhFF(TZ(?V4*^
?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1]+:IITB;cHXd6<-uV:JP(b:^mb,67sBQ
:IIoF2*EuJC2[W8D.GLO%13OO:-pQU@q]F`CER_4@<<W#Cht5,Ec6)>+Co&&ASu$iDKKqB@<,p%
Bl5&%F)u80Bjl*pA0>N*Dfp#?%15is/g,7LBlbD2F!,@=F<GI4@qB_&@<-W9@Wcc8BPD*mCj@.D
ARfXqD.RTqARloqDfQt5Ec6)>Et&IO67sC&BOQ!*@<,p%F`V,)+EVNEAoD^,+Cf4rF)to6%14Ll
3Zp",INW96AT2]5-YdR1-Rg0L/g+eIE$-NCDe(4)$7K=D+>#3p+D54rE-!-LC2[X(FDl22-Rg0L
/g+eIE$-NCDe*p2DfTD:%14L3@6,r%-V6d/8PUW^+>#3p+D54rE-!-LC2[X*FD5P=.3N1S+D5_6
+=CoBA9E!.CaTZ!-t,.Z/M;JpB4PRmF!)iFDe*]nCLnkB+D!/JB6%r6-YdR1D..3k-OgD2@6,M_
/q+pUA7]_$+=CoBA7TUf-Rg0L/g+eIE$-NCDe*Bs@ODTl-t,.Z/M;JpB4PRmF!)iFDe*d(-Rg0L
/g+eIE$-NCDe*d(-OgD2@6,M_/q+pUA7]_$+=CoBA9;a.Ci^sQ+D!/JB6%r6-YdR1FDl)6F!hD(
%15is/g,:UA79Rk+DPh*/o>,V+Cf(r@r$..D'3G)Ch4_@+EM+9F!*qD9LVkh$;No?+AP^3762PF
2f<PW1,C%)+EV:.+A+pn+EM[7G%G]8Bl@l3@WcC$A9/l;Eb/ZpF!+t+ARfLsF_u1/$;No?+C]J8
+E(e$Cj@.6De3u4DJsV>F(fK9+Co1uAn?!oDI[7!+C\o(G@b?'+D,>(ATJtG+E1n4BOPk$%15is
/g,4X@Wl='F(oQ1+<k?1AnGUpASu!hF!;`;D]iq9F<G:8@r-9uAKYJoEcb`(DBNG&@;]^hEt&IO
67sB74A&C;9ggi]D.GM@@;]dkATMr98l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g+b;FCSu,8jQ,n
D..<rAn?%*%17/m4ZX]I3Zoee@;]dkATMs.De(4)$?BW!>9G;6@j#N)A927$-TsL51a$FBF<GX@
%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EDUB+A+pn+DkP)BkCptF<E.XF(KH7
+@\pr78jX&-n$bm3\`?C.3LZ4+>>i*+DkP)BkCptFD>`)%13OO:-pQUD..<rAn?%*+D,>(ATJtG
+DbV1F!,=12'?CBARfLsF_u1/$:[T\78l?1+=nXD3Zp",INUa7/mg=U9L^R&8PDQO+>#2g6W+@#
7S-9B;a!/a7S-9B;]mYE+?V#dDe(J;A2P_D$4R>;67sBkD]iJ)C`m>(Ch7Z1AU%p1F<G:8+F7a@
%15Qr9LVlC3Zrl(+@\pr78k<O:-pQU/3HO#6qp',%17DmG\M5@+u(308PDQO+=o,f4A&C;6qL<V
;Fs2T<(Tk\>"MO"$4R>;67sC%BQ&);Eb0)rBl7X&B-:f#Ch7Ys$;XVl78c90+=JodHQk0eH=U`1
+A,Et6qL<V;Fs2T<(Tk\>"MO>+>#2g7S-9B;[j'g+Bot0BQ&*6@<6K4:K0kR;BR35+=AfiIQDg:
-9`PJ<(KGU+AP6U+D#e-Cis9"+Co2,ARfh#EbT*+%13OO:-pQUEb00.ASqqa4tq=>+E(d5-RT?1
4tq>%A0?:Q@s)g4%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F<4&Eb0<6A3s^GBk&hO:-pQ_Eb0<6A3s^GBk&hO+ET1e+C\c#Bk&86Eb0<6A18XCATMs7/e&._
67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JG0i
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTgDg!lr+E_X6@<?'k+D,P4+A+RG9PJBeGRXuh$4R>PCh7$q+=ANZ>9IEo
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgCl$=mj\F?MZ--Zip@FD>`)0II;:%15is/g,(OASrW!+EV19F<G+.@ruF'DIIR2+CT.u
+E1b!CER>5/e&/!EZf:2+Co1rF:ARgEZf=0@r#TtA8,Oq%13OO:-pQUDJs_ABl8!'Ec`FFDf'&.
DIn!&EZeh&AoD^$+EM+*DBN\:DJLA=DfT@t$;No?+DG_8D]j.8AKZ)+F*&O8Bk)7!Df0!(GqKO5
-uNU?DIIBn4ZX]5@4*TK,!$iWBk2+(D-p^dDe*2t0I\,-3Zp4$3Zoe*+=\LZ-OgDoEZf=DF<GI4
GA^i+AISuXEaa$#+Dtb7DIIBn%16Ze+D58-+Dtb7DIIBn%16Ze@<6!&DIn$0@;TQb$4R>;67sC$
ATMs3Eb-A8BOr<*Eb0E.Dfp+D@UWb^F`8HT+DGp?A8c%#+Du+>+Cf>-FCAm$%15is/g,7LAKYl%
GA^i+AISuXEZfC6F*(q8A8,Oq%16uaEZf"+F<GI4GA^i+AISuXEZd.\De't<-OgCl$;No?+Cf(r
@r!3-ATMs3Eb0;7Ao_g,+CT@7Ch7$rF<G[LD]j4ACisT+Et&IO67sC'F(oN)+E_R9EHPh8A8-'q
@ruX0Gp$O5A0>Ds@ruF'DIIR2+DtV)ATJ:f%178sCb\(6+=CY[-OgE+Deq0l3ZoeT>]"%^@r>^r
0JHaSF(KB5>\[eY@;BFp-OgCl$;No?+APL&:`sk(ART?sAoD]4Ch[d0GT^F4A0?&6CisT++Cf>-
Anble$>"6#DIn$&+Dtb7DIIBn4*GOY0e=\*FCf<.0./;gATr$#D.O.`DIn$'Ec,<&AN`'s-XeAR
+<iihA8,RlF_tJoC2[Wi+>=63ATAo2ATqZ-DIn$'Ec,<&ANP'RCbdOh>]aOoE*ObADIn$'Ec,<&
AIStU$;No?+Eh[>F_t\40b"J$EZf:2+Dtb7DIIBn%16Ze+E1b!CLeQ*ATr$#D.O.`ATAo4F`\`R
DIn$0@;TR'%16Ze+ED%7FCZM3ATr$#D.O.`DImi2B4Z0-DIn$0@;TQb$>"6#1E^UH+=ANG$4R>;
67sC(DesQ5AKW`;$>"6#De'u.ATq^+DIIBn%16Ze+E1b!CLeQ*ATq^+DIIBn%16Ze+E2IF+=D&<
G@bf4@;TR'%16Ze+ED%7FCZM3ATq^+DIIBn%16uaEZf"+F<GI4G@bf4@;TQb$>"6#1E^UH+=ANG
$4R>;67sB[78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB$?Kd#F`:]&De*g-De`inFA>.T.W]0C
F`:]&De*g-De`inF<GZW/Kf+GFEMOFAoD]48g&(nDe`inF<GF/DII0hEZfLGAM+E!:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130K3lfFtkud$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>PW)3,3SP0ea_%+>Y-I0d(=ACLnV9C2[X%C2J'(F*&cP:-pQU@;^@7BOu3q+E)-?E+*j%%15is
/g)o'0K<u\F>,Wr/KeYDEarZ'E+*j%F!,RC+Dbt?ATAo'@<6!&@V'.iEb-A1@<?!mBl7Pm$;No?
+>PW*0kP!+0fU:-+Cf>(DKBB0F<DrFC2[W1+CSekARlo8+E1b2BQG;;FCB&t@<-(.ARl5W%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFt5s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%159QHZ*h@4ZX]rBk/>?%159QHSZd_A0<6I%159QHZ*F;
4$"a(De*BiFs(O<A0?#:Bl%i<%13OO@rGk"EcP`/F<Dr?@<6!-%15is/g,+RDe`inF<GO2FD)e6
F`VXID..NrBHV&.A7T7p+C&ttEbTK7%14LuE+*j%F(K;5FDku6G@be;C2dU'BHS[O8l%iO;GTnR
6W>^[@rc:&F>#!j+>#VsC2dU'BQIa(+EVO<Dg,c5+<iEc;aXGi-S-Z-HTHL+6r60K87,_&<*s!)
:IK,1C+1\]?RH9i@rGk"EcP`/F<G[BE,9H&?U6tDFE1f2BK8(5?O[>O$9g.jFDYu5Ddso&ATT%V
3[\u^Dg-//F)rIJEbTW,-OgCl$?BW!>9G;6@j#W1G]Y;r/g)tnB4Z0--YdR1E,ol3ARfgrC2bO0
$4R=r4=G;i85E/`+?Op2/8]KRF=A>VEbTW,+DPk(FD)dEIS*C(:f:(]771$-F(96)E-*aJDe*g-
De`inF=q9BE$l)%%15is/g+e<DImisFCcS6Eb-A%DIal/Df^"CE,ol,ATMp2EZfF5EbTK7Et&I?
0RIYQF!)iFDe*g-AT2U/C*sGt4tq>#Ci^^HC2[X%Df^#>EbZs2$4R>;67sBpDKBr@AKY`+A0>u*
F*&OIFD5Q*FD5<-+CT;%+ED%%A9eUk4tq>#Ci^^HC2[X)ATMs)E[M;'%15is/g,">CLnVt@<6-m
+EV19F<GX7EbTK7%159QHSZdO0d(=ACLnV9C2[X%C2J'(F*&c=$4R>+0RI_K+FPk\Df6b&+>Y-Y
A0<6I%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&%13OO
%172gF*(r,@ruF'DIIR2E+*j%F&#%S.Wf6CFC])qFD5Z2@<-X4@<?1(+ET1e+EM+9F!*2^+A>6l
+EV19F<G+.@ruF'DIIR2+E1b2BQGd8$;No?%15is/g+)(FE8RD@<?1(+D,P4+DbJ,B4W2tARTXo
@VfTuFCfN8+Cei$AKYMt@ruF'DIIR"ATKI5$;No?%15is/g,=KEaiI!Bl,mR@<6L2F_t]2+=M>C
F*)/8A2,WWATMs.De(USFCfN8C2[W=/9GHEFD>`)1asP`Ddd0fA.8l@67sAi$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emQaFttf^$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G0
3Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$>"6#De'tP3[]#\F*)/8A2,3KATMs.De(UG
FCfN8C2[W=+EV19FD>`)1a`_>%15is/g+Y?ARTU%@s)g4ASuT4E+*j%+CT.u+CfG'@<?''@3BT!
DId[&+D5_5F`8H4$;No?+D5_5F`;&4B-;8,FE8RHBOr;Y:IH=EF`\a:Bk)7!Df0!(Gp%'7FD)*j
ATAo(E-#T4+=BNM76sgJ5u^B&%16Ze+D5_6+=JUX@;]UgE\SpmBP(ct5;?_0.3L\p-o*J!59M0n
I4f&JC`k)Q.=6IqA8Z32-OgDoEZd.\De't<FCfN8C2[W;-OgCl$>"6#A8lU$F<Dqu9LV6F:dJ&O
-OgDoEZf"8E$-PVEa`irB6#aT/8/X++?qSl3@Q(4+=K!!+?ptn+FPkQDJUFC-RjCj/nAj9-RT?1
ATAnL+E(d5-Zip@FD>`)1+*M<%16Ze+CoG4ATT%B6VKp7;G]YY81+iRATAo+Ec<-L-ZWX5A7op=
-S/qCA0=)kAN;1^4!5q,0H`S&,9VCeA8Z3+-RU?iI4f&JCaUS>$>"6#1E^UH+=ANG$4R>;67sC$
AT)O!DBNA*A0>r,Dg*=C@<?1(%16Ze+E(d54$"a2ATMs.De(RFFCfN8C2[W<+EV19FD>`)1E^dN
F*)/8A2GYC$>"6#A8,QsINU<R$4R>REb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$.-UF(dQo3F?l>F*)JFF^e*4/h23s<.96<F=f'eFCfN8+EMXI@P/)s:-pQB
$;No?+B3#gF!,R9F*&NW/hSb/+D,P4D..O.ARlp*AU&;+$;No?%15is/g,=KEaiI!Bl,m?$;No?
+:SZQ67sB'+<VdZ/hSb!F`(f0Ec#6,ARlp*AU&;+$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+FAQIEb/[$ARp7<%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?+EqaECER>/+Cf5!@<*K"@<6!&DfQtBEaa$&+Dbt+
@;KKa$;No?+Cf5!@<*J<-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,F`:l"FCf3*A7TCqFE2))F`_>9DGEMN.Wo]@@<?'qDe*BmF*)G:@Wcd,Df-\=/M/)f
E+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2+F7a@/e&._67sAi$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB73,N)L1,pCsASl@/ARlotDKBo.Cht5'@<?Q5@;]TuF(96)E--.D/Kf+KD/a<*Anbgt+A+pn
+DkP$DKKH-@;]Rd%15is/g)i-F(K;G1a$4;A7]9oBPDO0DfU+UFEhmMFDi:4BleB:Bju4,ARloq
Bl%@%%15is/g)l'An>F+1a$:HBl8!'Ec`EOBkhQs-Qli.A7]:&C2[W8E+EQ'Eb0*+G%G2,Ao_g,
+F7a@%15is/g)8Z+<VdL+<Y<8DeElt04Sp2AT2HsGT^O2Eb/a&DfU+GF`:l"FCcS8ASl@/ARl5W
:-pQU0em9O@PKeaC2[X%A7dH9G]Y'=Bl[cpFDl2F+E2.*@qB=lCh.*t+CSekARl5W:-pQU0emNR
Gqh9$C2[WnDdtG:Bl8'<DJsW.F"VQZF<G"&A7]9\$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=DVHA7TUrF'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1
+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
:-pQUEb0&u@<6!&A8,OqBl@ltEbT*+%16TfEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp
-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>
Ea`HnBl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ1
4ZX]:4tq=U:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!Df0!(
Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3ZoebDe*3&/1;ku?RHt+BOPq&
F^cJ.De+$&EcYr5DCI+a/p_5N-OgDT:IITB;cHXd6<-uV:JP(b:d$i^F(fK9E+*g/+=JEd-UCEt
-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/4r]+6qL<V;Fs2T
<(Tk\>"MO"$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%-YR48FDl2FC2[W*Bl8!6
@;KapDe'u2ATMF)C2[W*C2[X%@<-4++DPh*E,ol/Bl%?'D..<rAn?%*C2[W*CggdaG[YH.Ch5:S
0d(4LA8,q'Ec3(8De*C$D/^j3$?L#H3ZrK[/12Q6@:DWID/^V4De*<gF*&O=DKBo.Ci!j)A7Ath
+ED%7ATV[*A7Ath+DPh*E,o]1+DPh*Bl7HmG[F!@9hZ[EDe+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I
3ZrK[/12QTDe*ftAm\M><$6!kDKU2ADffQ3?W:-,-OgCl$?BW!>9G;6@j#N)A927$-TsL51a$FB
F<GX@%13OO:-pQUF(KG9F(96)E--.1$7L6R+u(3TDe*p!E[a.4+F?-n0d(4LA927$%13OO:-pQU
Ecl7B8jQ,nD..<rAn?%*%14L30HiJ30eb%!3]\B;3[l1g@;]dkATMs.De':a%15is/g,">DJ<]o
F*&O:Bl%@%+>"^PATMo8D.GLH@q]F`CNFW8Et&IG8PDQO4ZX]:+CR;R/M;Jp4?G0&0d'.Z/4N3)
78k<\/g*MZ%15Qr9LVlC3Zpm`9LVl&/M8/.-YdR1/o>,V-OgCl$;No?+E_X6@<?''Anc'mEt&IO
67sB74DA\SFCB!%C2[Wl@<<W<Eb03+@:Njk-YdR1@UX%*Bl8!6@;KapDe(J0@<<kY8l%iC8Q/Sd
8O?EV8P`)b8Pfj':-pQU0KaAeF(KH.De*<cF<D\KH?*S9Cgggb+=CoBA7At_061WFATV[*A1h>"
F=0.B:IITB;cHXd6<-uV:JP(b:^mb,67sB74DA\SFCB!%C2[W*+<VeQEb03+@:Njk-Y[I>FCB!%
C2[W8Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>olDKBo.Ci!j)A0<!;+F8'>E,8rmAKW@8
De*<cCG0C>F*(i,Chdm!@UX%)Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)C2[W*
+<VdL+F8'>E,8rmAKW@@ATMF)C2[W8Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$;No?+>>ouATMF)
C2[W*+<VdL+F8'>E,8rmAKW@8De*<cCG0^>F(KH.De*<cCG'=9F!j%A:IITB;cHXd6<-uV:JP(b
:^mac4DJeFE+*d(F!)SJ+<VeQEb03+@:Njk-YdR1E+*d(F"V0AF!j%A:IITB;cHXd6<-uV:JP(b
:^mac4DJeFE,ol/Bl%?'+<VeQEb03+@:Njk-YdR1E,ol/Bl%?5Bkh]:4%`::6qL<V;Fs2T<(Tk\
>"MO"$8=SUBleB7Ed;D<A0<!;+F8'>E,8rmAKW@6BleB7Ed99ZG]Y;p8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0Ka)gA8lR-Anc'm+<VdLH?*S9Cgggb+=CoBA7At_05>E9E,ol/Bl%?i@;@K0C3(aa8l%iC
8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8kstD0$gB+<VdLH?*S9Cgggb+=CoBA7At_05>E9E+*d(F(/Qn
/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*F(KB%Df00$B4>:b+<YuNAT2Ho@q?c1C2[Wl
@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SZ@;]dkATMs.De't5
+F8'>E,8rmAKW@;@;]dkATMrGBkh]:4%`::6qL<V;Fs2T<(Tk\>"MO"$8=SY@:Eem@;Tt"AM>em
+F8'>E,8rmAKW@8De*Zm@WO2=@:Eem@;Tt"AM>em/no'A-Tapr6psUF<)Q:S<E)Oc:0L4c%14dO
9OVBuF_u(?+<VdL+<YuNAT2Ho@q?c1C2[X!@:F:2Cggd`F_u(MBkh]:4%`::6qL<V;Fs2T<(Tk\
>"MO"$8=SWDe*R"FE2:B+<VdL+F8'>E,8rmAKW@8De*Zm@WO2;De*R"FE2:PBkh`;4%`::6qL<V
;Fs2T<(Tk\>"MO"$8=SWDe*C$D/^U?+<VdL+F8'>E,8rmAKW@8De*Zm@WO2;De*C$D/_+AC31gb
8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA7B+kF<D\K+<VdLH?*S9Cgggb+=CoBA8G[`F"_9HA7B+k
F=q9BF=0.B:IITB;cHXd6<-uV:JP(b:^mac4DJeFE,o]1+<VdL+<VeQEb03+@:Njk-YdR1Cggdo
05>E9E,o]1/no'B-Tapr6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUEb/Zi+Cf>,E+s-"A0>W*A1hh3
AfrZW+EV:2F!,(/Ch4`'F!,@=F<GXHDfTE"+DG^9FD,5.A8,OqBl@ltEd8*$:-pQU@Wcc8BlbD+
F_PZ6+DG^9FD,5.E-67FA8,OqBl@ltEbT*++CoD#F_t]-F<G+.Eb/a&DfU+4$;No?+>>o&C2[X%
A7dtc+ED%%A0<9E/gj%_6ROEHCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$
6uQOL.4ci]De(J>A7d1u$;No?+>>omDe*ftAfr3=+<VdL+F8'>E,8rmAKW@8De*Bs@kVe3An5gi
05>E9/oY?5-Tapr6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUF*)>@AKYZ.D/:>/DId='+>"^SFD,6+
+E).6Bl7K)Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1DImo4Ch[d&Et&I14DJeFBl7HmG[F!@9hZ[U
Eb03+@:Njk-YdR1A8bs2BQS*-A8bs2C2[WsDId='/nf?DCaV;::IITB;cHXd6<-uV:JP(b:^ma@
$;No?+EMXCEb-A.De*ftAhJ1MF<GO=@:NjkBQ%]tATAo*DfQt8De(J>A7cr9+CTG%Bl%3eCh4`-
DJX$)AISu#4DJeFE+EQf<*3*BH?*S9Cgggb+=CoBA7TUg05tH6A8bs2C2[X%A7dH9G]Y;p8l%iC
8Q/Sd8O?EV8P`)b8Pfj'%15is/g,4WDfTD3Ch[d0GT_'HARfFdBk&9'DffQ3%14dOCh[d0G]%GA
ATM3X=B$DhEb03+@:Njk-YdR1A8bs2Ch[d0G]%GAATKJGG]Y;p8l%iC8Q/Sd8O?EV8P`)b8Pfj'
%15is/g+\C+CT)&+DkP)BkCptF<G10Ch7Z1AU%p1F<G:8+F7a@%17DmG\M5@+u(308PDQO+=o,f
4A&C;6qL<V;Fs2T<(Tk\>"MO"$4R>;67sC%BQ&);@;^?5Anc'mF!,17+F7a@+EV:*F<G"4AKYl/
F<GL>+EV:.+DkP)BkCptF:ARQ<(KGU4ZX]60Hb]d0d(dQBlY=g:IITB;cHXd6<-uV:JP(b:amM=
/g*VT9LVkh$8EZ-+EM47GApu3F!+7X84?E!,CUaX-SHir3dWn74s3X#84?E!:-pQUAU%^$F_#&+
A8-'q@ruX0Bk;>p$4R>;67sC'E+EC!AKXT29J8nSDeElt6Z6LH+EM[7G%G]8Bl@l3A8-'q@ruX0
Bk;?./KeJCF*2>2F!,UCH>.=NAU%c/Df-\=BOu!r+E1b2BFP;D67sB8+Bot0D/XQ=E-67FF(f-$
C`k*JDL-#9+>%^Y/T2a`E?HV[8l%iC8Q/Sd8O?EV8P`)b8Pgrc+>%+H-S.kc6q:$K7nc?=:IIWJ
5u^Aa$8EZ-+EMC<F`_SFF<GX<ASc0*-Zs<QBlG1HFW`8S+>%RU-S.kc6psUF<)Q:S<E)Oc:0L4c
/12PlA0<6N8jPj5:JOMX6r60K8.>n8$;No?+ED%3E+Nnr$9g.j1E^UH+=ANG$9g.jDe'u=/n9$E
EX`?b$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$?^;u@<?'q
De*]nDJ<]oF*(/D/h2!_A79RkC2[X"@;]dkATMr9F"JsdF*VY5BQA$/BmO?3+Eh=:F(oQ1F!,17
+A,Et+DkP)BkCptFE9&D$;No?+:SZQ67sBhF`_;8E]P=8DeO#26nTTK@;BFp+<V+#:-pQU@rc-h
FCeuD+>PW)2f<PW1,U0`$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW*0kP!+0f1")+Cf>(DKBB0F<DrFC2[W1+CSek
ARloqDfQt<ATo83De'u)DKKH1Amo1\+Dbt+@;KKa$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo
3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OO:-pQUEb0&u@<6!&A8,OqBl@ltEbT*+%159QHXh2=E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH
0RI_K+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,
EcYr5DBO%A@:O(eDJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKi
G%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQUD..<rAn?%*+EM%5BlJ08%17/m4ZX]I3[\cQDJ<]o
F*)/8A0>_tDJ<]oF*)/8A92[3EarZ.%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?
+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EM+9+DkP)BkCpt
F<Ga<EcYr5DK?q4Ec5e;A8,OqBl@ltEd8dNATDj+Df0V*$>OKiF*(i-E'67'BQ&*6@<6K4-SJLh
;H$._:-CWc-RUGn+=ANa-Qll0AoD^$F*)FF-WWZ6;b9b[4ZXr<-Qli0FCfK6FE/L@@;]dkATMs.
De(:J-RU8p<^fnb8P`)E3[Z:&/8B*6G%G]8Bl@l?-RU8h%16r\DJ<]oF*)/8A3DsrFDj]G;cFlS
De*p2@;Ts+@q]:gB4Z.+EZf4-DJ<]oF*)/8A.8kT$?K]tG%G\W3ZqjICj0Q,FCfQ7Bl+td7Nc/O
AoD^$F*)FF-WWZ6;b9b[4ZXr5@:jUmEcZ>C+DkP)BkCptFD>`)F)Q2A@q?)VC2[X(FCB$*4Z[Xt
Dg-//F)rHO031M>;b9b[4ZXrAF(966ATB=L031M>;b9b[4ZXr<-S0"NA9MO)F(oQ1/12em-OgE"
@;]dkATMs.De*p-F`Lu'4ZX^-Db*Z&<$5poA92j$D/^V-BOPdkATMs6+DkP)BkCptFD>`)F)Q2A
@q?)V%159QHScjaF`\`RD..<rAn?%*C2[W14%`F=;Fs\a?X[\fA7%E8@;]dkATMs.De':a4tq=?
+E2IF+=D#7DJ<]oF*)/8A92[3EarZ.4%`F=;Fs\a?X[\fA7%E8@;]dkATMs.De*p-F`Lu'%13OO
%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%175sA79RkC2[X(Dfp)1ARoq#E-"c@/h2!_A79Rk
C2[X(Dfp)1ARoq#E-!.C/M/)fE+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2+EMIDEarZ'
H>.=N%15is/g(T1:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i/@ruWu
ATAnK0JG?n$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`lDg!io+Cf>/Bk;?.FDi9o5tiDBF^fN*EcYr5
DBNJ(Eb/a&DfU+4$;No?+>GT_AR[AN+Cf>-Bl8!'Ec`EOBkhQs-Qli.A7]:&+D5V2B5D-%F*;FD
Eb0*+G%G1n$;No?+<VdL+<VdL+E2.*Bl5%C/no'A+DPh*+EMIDEarZ'A8-'q@ruX0Gp$O+A7]9\
$;No?+>GTf@<jRe+DPh*F)Q2A@qB^mFEMOTBkh]3@:Wn[A.8l@67sB80l:?E1,^7bDfBtEDe:,,
De*p-F`Lu'F(KH9E%Yj>F!+n%A7]9oFDi:JBlG2,DfQt0@:O(qE"*-`$?B]tF_Pl-+=DVHA7TUr
F'N-o@pF=oE*R^$Bl%@%/no'A-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBnASu("
@<?''@s)g4ASuT4A8,OqBl@ltEd8d<F_u)=%16TfEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%
A0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+
Df-\>Ea`HnBl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)
F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+A,Et+EMgLFCf;3Bl8!6@;Ka&H>.=@Bl5&4F`\a:Bk)7!
Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3[\Z\A92[3EarZf-S-Yn
/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%5tjj=:/F5U83K!V+tb6/9M$T_4)AhFF(TZ(
?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:IITB;cHXd6<-uV:JP(b:d$i^
F(fK9E+*g/+@/[m78?ZF<(JQ4:IITB;cHXd6<-uV:JP(b:^mb3<(Tb^6qL<V;Fs2T<(Tk\>"MOR
3Zp^^8OZBN5u^B+-ZsNFCi_4TBlGF/$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%
-Z*:0BkCptFD>`)F)Q2A@q?ctDe*p-F`Lu'F(KH9E$l)%F)4!#+?MV,F)29m%17,c+Bos9Eap5,
De*p!E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3T
De*p!EX`@jDe*p-F`Lu'F(KH9E'66)FDj]G;cFlSDe*p-F`Lu'F(KH9E"*-`$;No?+E_X6@<?''
D..<rAn?%*06:]HF`8I;DBO+6EcYr5DBNG-DKKo;Ci!Zn+CSekDf-\.Bl[cpFDl2F%14M*Db*Z&
<$6$dDJ<]oF*)/8A92[3EarZ0+Eqj?FCcRe5t"+::.e;M;bpCk6Uag;<(JPfD..<rAn?%*/no'A
-OgDtDe*p-F`Lu'F(KH9E$0@FBlmo/8jPj5:JOMX6rQl];F<lL5u^B+-YdR1F)Q2A@qB^mFEMOT
Bkh]:%13OO4tq=>+E(d5-RT?1%159QHZ*F;-YdR1A7]p3%17,c+Bos9Eap5/F(ZV1De*BiFsfF*
+DkP&AKW?J%159QHSZd_A0<6I%13OO4tq>%A0<77De(4)$?BW!>9G;6@j#W0B-:r-A1'Mm+DkP&
AKW?J%159QHSZd_A0<6I%13OO4tq>%A0<7BFD5Q4-OgE'@j"tu-ZW]>D0'>4F`_>6F!j+'+DkP&
AKW?J%159QHSZd_A0<6I%13OO:-pQUEb/Zi+D,>(ATJ:fC2[WnAThTmF?MZ-Eb/Zi+DPh*A7]on
$>OKiA79RC3ZoOf+ED%%A0>W*A.8lgFD5Q4A79RC3ZoPcART*lF`_>6Et&Hc$;No?+E_X6@<?''
Anc'mF!,17+EMIDEarZ'H>.=@Bl5&%Ch[Hu+:SZI8PDQO4ZX]J4"akp+=A:HDe*BiFtRKDF!,49
A1hS2F!,UIBl%iCBkh]3C2[X(Dfp)1ATMF)F`8sIC3(a3$8=SWDe*BiG%>$'+<YuNAT2Ho@q?c2
4tq=Q8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[Wn@<<V7+<VeQEb03+@:Njk-pBA47S-9B
;^je#:IITB;cHXd6<-uV:JP(b:^mac4EYa[Cia,qF<D\KH?*S9Cgggb+=KE/HU^S#78kWs8l%iC
8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA92[3Ear[%ATW'6+<YuNAT2Ho@q?c24u7OT8PDQO.6C-t6psUF
<)Q:S<E)Oc:0L4c%13OO:-pQUCLq'r+E_d?Ci^_;DJXS@H>.=@Bl5&7H#@+7GA2/4+A,Et%15is
/g)i1F`_>6F(A^$+<VeQEb03+@:Njk-pBD57S-9B;^je.<(Tb^6qL<V;Fs2T<(Tk\>"MO"$4R>;
67sBkD]iJ)C`jj4Bl%@%+D#e3F*&O=DBO7>E"*/#AU%p1F<WF^7S-9B;]mVD+?W7l6psUF<)Q:S
<E)Oc:0L4c%13OO:-pQUF(fK9+ED%1@;0UnDJ()(Bl%@%%15m184?E>3Zoh)+F>:e+F7R4EZdtM
6psUF<)Q:S<E)Oc:0L4c.3L2p+@\pr78jX&0d'[CF(fK9E+*g/+AYs-78b6QINTa\0.230HTEK;
+AYs-78b7'67sBlG[kQ4A7ZloBl[cpFDl26ATJ:f%15is/g+YBE-WRJD]hY<9J8nSDeElt6Z6LH
+EM[7G%G]8Bl@l3A8-'q@ruX0Bk;>p$8EZ-+EM47GApu3F!,O;ASc0*F(fK9E+*g/+=CZ;E-WQM
-S.kc6psUF<)Q:S<E)Oc:0L4c/12Va+t"p65t"+::.e;M;bpCk6Uag;<(JPfC2[X(Dfp)1AM/:C
E$?Y=$;No?+>G!C+EM47GApu3F!,O;ASc0*F(fK9E+*g/+=CZ;E-WQM-S.kc6psUF<)Q:S<E)Oc
:0L4c/12Va+t"p6:II]K:Ie)I6Vg*=;bpCk6Uag;<(JPfC2[X(Dfp)1AM/:CE$?Y=$4R>;67sC$
AT)O!D@Hq:0RI_K+FPkPF`ML3$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
FE1f2BK8(5?O[>                                                            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)$.4+>P&o0H`,1+?(Du2]sk1+>P_q1,0n,2'=Y/+>Pes1,0n,2'=V3+>Y_p1,0n-2e$Z@6=FqL
@k]WH@<6-m+C\bhCNXS=DIIBn+Dbb5F<G[:F*)J6De!m#F*)M8F*&OGFEM%8AoD]4-tI7+.3N_D
F*),6B5DKpA9;C(F>,C'A8,OqBl@ltEd;J>@:UK8GT_*>F*&O8Bk)7!Df0!(H#.D-A9;C(F>,C(
A8,OqBl@ltEd;J>@:UK8GT\aaFCfN8+Co1rFD5Z2@<-X0Ddd0uATMrI0Jd6R@ruF'DIIR2Ci<`m
+>J*`1E^dNF*&O8Bk)7!Df0!(H#.D-A9;C(F>,C*A8,OqBl@ltEd;J>@:UK8GT\gcFCfN8+Co1r
FD5Z2@<-X7ATW'6?YXLiE,ol3ARfh'ATW'6+D,P4+A*bqEc5](@rri1@;]LdATAo9F(KK5A79Rk
C2[WnBleB:Bju4,Bl@m3E+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2+F7a@         ~>
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
1,Uj11,^72+>G_r1*A>-3AE<41,'h++>Gf11,g=11E\Fq1GCg33$9t!1,h'M+>Ghu1*AA30f^@3
0H`+n2D[?90eje++>Pc41E\D.+>P&p0ebU11,C%.+>Po:0d&2)+>P&r3&`i?0f1".+>Pi33?U%5
+>P&p3&!340ea_*+>GQ+1*A;-+>P&p1Gq*G+?1K!+>PZ30d&2)+>P&p1GL"2+>P&q1G^.4+>P&t
3&Vm<+>P&s1,gm00ea_*+>Pr21E\D/+>P&r1b^a/0f1".+>Yf.0d&2*+>P&o0f(O,0fL41+>GW/
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
6t(1K3Zp18+AQiu+>PW*0d&2+3\`TT0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i=ao6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqh2]tk6Fs&Oo0eje*1-.*I3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*03+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,g=NDg!6Y0JP:)0etdD2``fQ$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOA+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku:2b:u1,(F;+>GW4
1,(aC2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1:
+AQiu+>PW*0d&2+3\iBM2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i=ao6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqh2]tk6Fs&Oo0eje*1-.3H3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y0JP:)0etdH1cdHO$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOA+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(F;+>GW42)@9J2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW*
0d&2-3\`KQ0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i=ao6?R!YA0=WiD.7's3ZpF*+@KX[
ANCqh2]tk6Fs&Oo0eje*2**KM3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>Po!:2b:u1,(F;+>>c92).-K1("?q:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh3$:t7Fs&Oo0eje*1-.*J3\r]%$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>G!,ARci<0JP:)0K;*N
0KLsC$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOA+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp."
6tKjN1,(F;+>Gi:2).-L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@
+>G\q+@KX[ANCqj+@KdN+>PW*0d&5*3]&fW0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i=ao
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1a#1t@j!N\0eje+0KM'L3]&c&$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU2BYD!@j!N\0eje*1-.9O3]/c%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU3?U_$@j!N\0eje*
0KM'O3\iT#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOB+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>GSn6tKjN1,(F;+>GZ51,1gI0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
2BX,/F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.3+@KdN+>PW*0d&2-3\rNP1,TCG$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./iFgp6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg0d&kq@j!N\0eje*1cdEM3\W5p
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0esk>ARci<
0JP:)0KD0J1-.9P$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOB+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>GVo6tKjN1,(F;+>>f:0etdI2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&
+AR&r@V'R@+?1Jd6t(1K3Zp.4+@KdN+>PW*0d&2.3\WNS0K9CH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./iFgp6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1*Atr@j!N\0eje*2**HO3\`K!$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*3I+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Gbs6tKjN1,(F;+>GQ2
1GCjD1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2DlU"6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg
3?U_$@j!N\0eje*1-.9N3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*3I+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Gl!6tKjN1,(F;+>GW42)mWQ2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
2DlU"6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg3?U_$@j!N\0eje*1HI<H3\i]&$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*3I+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Gl!6tKjN1,(F;+>G]61GV!J
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2DlU"6?R!YA0=WiD.7's3Zp='+@KX[ANCqg3?U_$
@j!N\0eje*2**KP3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*3I+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Gl!6tKjN1,(F;+>G`71H%9N1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2]s50
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp14+@KdN+>PW*0d&2,3\rZT1GK4D$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./iOmq6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh0d&kq@j!N\0eje*1cdBH3\r]%$49Np
/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOC+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>PYo6tKjN1,(F;+>G]61GCjI3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2]s50F_PZ&+AR&r
@V'R@+>b2`6t(1K3Zp14+@KdN+>PW*0d&2.3\`EO0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/iOmq6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh1*Atr@j!N\0eje*0fh'L3\r]%$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*65+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,9t?ARci<0JP:)0ek^G2``ZR
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOC+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>P\p6tKjN
1,(F;+>GW40JbaI3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2]s50F_PZ&+AR&r@V'R@+?1Jd
6t(1K3Zp15+@KdN+>PW*0d&2.3\WEP1GT;0:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+A,Et+B2-4
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
@V'R@+?(Dc6t(1K3Zp18+AQiu+>PW*0d&2+3\`TT0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,g=NDg!6Y0JP:)0etdD2``fS$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp1:+AQiu+>PW*
0d&2+3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P=!
+<X'\FCdKU1,g=NDg!6Y0JP:)0etdF0KLmJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
2'=#.F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1:+AQiu+>PW*0d&2+3\iBM2)P^J$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,g=NDg!6Y0JP:)0etdG
1-.6H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp1:+AQiu+>PW*0d&2+3]&ZS1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU1,g=NDg!6Y0JP:)0etdI1HI6K$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW*0d&2.3\iQR1G]@F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,pCO
Dg!6Y0JP:)0etdD2```T$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqg+@KdN+>PW*0d&/03]/TP1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>G!,ARci<0JP:)0fV3O1-.*D$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqj+@KdN+>PW*
0d&5*3]&fW1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+>b3/ARci<0JP:)1,(aH2EEZS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
2BX,/F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp='6tKjN1,(F;+>GW42)dQR2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./iFgp6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+@KdN+>PW*0d&2)3]/oY
1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU
0eje=ARci<0JP:)0f1pI2**EH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&
+AR&r@V'R@+>b2`6t(1K3Zp.4+@KdN+>PW*0d&/13\W?N0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0esk>ARci<0JP:)0KD0K1-.9P$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.4+@KdN
+>PW*0d&2.3\WNS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU0esk>ARci<0JP:)0f;!H3'&cQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<2BX,/F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.8+@KdN+>PW*0d&2)3\rHN0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@EARci<0JP:)
0etdI2EEQL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqg3?U_$@j!N\0eje*1-.9P3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOB
+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.;+@KdN+>PW*0d&2,3\rKO1GK4D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN1,(F;+>G]6
1GV!J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./iFgp6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU0f^@EARci<0JP:)0f;!I3'&iO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/
F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg3?U_$@j!N\0eje*2**NO3]&]$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOC+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>PYo6tKjN1,(F;+>GZ51H%9M
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./iOmq6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh
0d&kq@j!N\0eje*1cdBH3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOC+<X!nBl%<&
:3CD_ATBgS1E[f.@<?'A+>PYo6tKjN1,(F;+>G`70f(jE3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./iOmq6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh1*Atr@j!N\0eje*0fh'L3]&Mt:et"h
?YXLiFDl)6F##IF67sa&De*s.DesJ;F"JsdC2[X)Df9H5+E27?FDu8=@qB_&DfRH>$4R>;67sC$
ATV?pDBO.:Blmp-E+*6f%14LD+Z_G7.3L>f%13OO:-pQUBl8!7Eb-A&@<6!&%16T`@s)g4ASuT4
-XpM*AL@oo%15is/g+YEART[l055<<FD50"BmO>5@3A0<6m-SiDesJ;DdmHm@rr.e8l%isDf9H5
?YO7nA7%J\+Cf>-ATo7E@;9^kFDl)6F!i(Q+<VdL+<VdL+<VdL+<Ve%67sBuATo8=Df9H5+E(_(
ARffk$7IVP3\i$;.3N,@ART[lC2[X)Df9H5?XHE$7!*?cCi^^k:IK;CDesJG8l%in@VR#.:-pQU
E+*g/+EM+1AftN"A0=K?6ureE@WcC$A86$n1,2Nj/h1=QBl%<pDe't5F"Jsd@WcC$A9/l%+D,b4
Cj@.5Df'?&DKKH#+A,Et+Dbt)A0>u*F*&OG@rc:&F=n[F$;No?%15is/g*K'Bl%=$+CQC&Df'?&
DKKH#+A,Et+Dbt)A0>r'EbTK7/g+&7DBO.;FD)dFEc!67$;No?%15is/g)8ZEb065Bl[c--YI".
ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%ha$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL
:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6
F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/'$;No?+:SZQ67sB'
+>G!ZD'138F_PZ&C2[W1+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ3
05i9K$;No?+:SZQ67sBJ@<Q3jFE9JP$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'
EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU1,(F;D..]E1a"@mF`:l"FCeu*AoD]48l%htE,Tc=+EVNE9PJBeGT]d\%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5
-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0
ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-
A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBnATT&0De'u"F_PZ&+E_d?Ch\!*
ATJu&DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)
$4R>;67sC%ATT&<D.F(_-YdR1G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F/kSo-<_Ysk$>OKi@WcC$
A7T+jAN`'s@;Kb%EbTA5FE;P4D/^jM%16igA7B[qCh.$nF?MZ-5!!FsA7B[qCh.$nF:AQd$;No?
+DG_'Eb0*!DKI"1F_PZ&+CT.u+ELt7AKWQID09oA+C\n)A8c?s+C\noDfTD3%15is/g,4FEbTK7
+D58'ATD4$Bl@l3FDi:9DKBr@AKYYt@:Wqi+CT.u+Cf4rF)rHr:IJ5X6m->TFCStn$;+)^<_YtF
3[e`]A7B[qCh.$nF?=5UA7B[qCh.'bFCcmD-nui".=Ffa6rm#M%172oE,9H&+E2IF+=BcW6rm#M
-OgCl$;No?+EM+9+E)CEE-67FAnc'mEt&IK:IIZD9LV**+=CoBA7KOpD.RU,ARmE-C3(a3$;+)^
9M[rB<(0_b7S-9B4ZX^#E+*j%F(K;5C2dU'BHS[O@:WneDKB&qASu("@;K1`De**#/4r]+7S-9B
%15is/g+V3@r$4++E(j7A8-+,EbT!*FCeu*Anc'm+E2.*@qB0nBl5&4F`\a:Bk)7!Df0!(Bk;?.
F(96)E-*45Bl[cpFDl2F%15^'6psUF<)Q:S<E)CT7S-9B4ZX^#E+*j%F(K;5-mC8k;aXG1/3@Zd
@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iE8PDP^$4R>UART+4
3[[Zh/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D'pl.7L]]<ART+43bW)5A1SiO-Vcu\+BE&oF(oQ13Zoe$-u*[2
G%G]8Bl@l</12P_6?R!YA0=WiD.7's3Zoe$-mC]eDe*="Bl%<iDKI<Y-QjO"@<?'A+=A^TDe*="
Bl%<j@<?'0/5/MB$?L'&F`_SFF<G7.@:TfS%15is/g,7YEc*"<DBO.:Blmo/F)YPtAKYr4ATMF'
G%#K,Df-\.F`M26B-:]&D/Ej%FCeu*8l%htCi<`m%16cY4Z[7f@:Uo:-oiG31bgF%0deM-,>:Q9
$4R>;67sBnATT&6Eb031De!@"F)Q(AF(96)E-)NrF$2Q,-o!e;+>PBm3]\B?+D58-+=CoBA8lR#
E$l)%%15is/g,">Bl5%c:IH=8CghC+ATJ:fB0A9u4$"K3C2[X$DBN\4A0>W*A92j2Eb-A.De*Bs
@N]E(A8PajAKY`+A9E!.CaU>7$4R>;67sBnASu("@<?''B6%p5E-!.GBln#2@rH4$ASuU$A0>Ps
@:WqiEt&It4ZX^,+=nWs+=K?-,>:QU+=nil4s2C!."*^53[ca+?SWsF@;BF'.4.5$B+51W$;No?
+CT5.ASu$$E,Tf>+E2@>@qB_&DfQtA@rc:&F<E.XE,oN%Bm:b6ART+\EX`@s4ZX^,+=nW`1*]I^
.3L/a-o!e;+>PBm3]\B?+D58-+=CoBA8lI.F=.M)F$2Q,BO`/9+EIu!%15is/g,4DG%De4Ddd0!
F(96)E--.1$?L'&F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@lM-OgD2F$2Q,FDj]G;cFl\.3NhT
Blmo/F(fK9E+*g/+A,Et9M[rB<(0_b7S-9B%17/nDfp/@F`\aI+Eqj?FCcS9BQ&*6@<6K48l%iC
8Q/Sd8O?EV779U:9LTBt%15is/g,:UA79Rk+C]J-Ch+Z%BleB7Ed8cZ+EMXCEb/c(@<3Q1Cgh$q
+EV1>F<GF/@rcJs$;+)^6<-TN6qBmJ<)6Cp4ZX]60fq'31+@Q23Zp7%B4Z0--V@0&6<-TN6qBmJ
<)6Cp-OgDT:IINL8PDNC8Q/Sa;HZ.D+A,Et6<-TN6qBmJ<)6Cp/1<7u9L^H^BOtU_%14p7E-67F
-V@0&6<-TN6qBmJ<)6Cp-Ta(@4%`::6<-TN6qBmJ<)6Cp%13OO:-pRBH$!U?F(or3+E(j7B4Ysl
Eaa'$A0>i-@;0V$AU&;>F(96)E-)NrF)>i<FDuAE+=JEp,BG:b-Qlo;D/Ej%FCeu*F(96)E-*43
H$!V=-OgE(D/XQ=E-67F-V@0&+Cf>,D.RU,ARlomF_PZ&+Cf>,E,9*-AL@oo%15is/g,1GF*)>@
AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'GtDf9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&@WcC$A86$n@rH4'Eb0<5ARmPN:-pQ_@WcC$A86$n
@rH4'Eb0<5ARlo+F"Jsd@WcC$A9/l%+D,b4Cj@.5Df'H6ATMp(A0=K?6m-;a@:UL&ATMr9F(96)
E-*]T$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBIF_PZ&F!+m6@rH4'Eb0<5ARloU:IH=ADdd0!
F(96)E-*]T;KZk"GA2/4+=M8I.1/g:/db??/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+<Ve%
67sC!@WZ$mDBMPI6jc[U/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5
+E)41DBNJ(@ruF'DIIR"ATJ2R67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<VdL:-pQUDfB9*
+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/$:-pQU$;No?+<Vd]+ED<A-Xq44Ch.:!
A7KOpE,oN2F(Jl0+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ305i9H
:-pQU$;No?+@BR\ART\%3XSVK/db??/g*o-+D#S6DfQt1BOt[hBl7Q9$;No?+AucjF_Pl-F!,OG
@;]UaEb$:b+E2@>Anc'm+CT.u+F7X6Ch7Z1@:WneD@0-*/db??/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O]:-pQU0K<oXGqq?%Eb0,sD.PA@ASc9p@<?''@rH4'Eb0<5ARlp)@rc:&F<G[D
+EDC=F<GL6+DPh*+CSekDf,nW67sB80kP!+0JstqF(HIBC2dU'BQIa(.3N_N+EM47G9CjCEcb`!
Ch4`1FEq\6+D,>(AKYr#FD,_&:-pQU0em9O@PBba@rH(!F(KB6+=Cl<De(4<@:Wn[A0>;mFCfJ8
D/XT3DJ((a:IH=>DKKH1Amo1\+EVNEBkhQs$;No?+>GTgDg!lm+EV19FCeu*Df-\6Bl8'<$4:fb
EHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0AF!h<)De!p1Eb0-1+=CW,F(H^+@rGjn@<6K4
FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I
$=e!gDKBB0F<DrFC2[W1$49Np/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*
A8,OqBl@ltEbT*+$?'j$4ZX^6/g+\=A0<Q5De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C
$49Np/g+e<F<G=:A0>?(Bl%<&F`_>6Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=$?U-(
Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OL2U67sC%ATT&<D.Eu$C2[X+ATDj+Df-\4De*="Bl%<i
DKI6h3\l%78l%iU9gf>'De*="Bl%<j@<?'D3ZqjICij]3D'3qAFCB$*-RT79De*="Bl%<iDKJ$&
+?hi$De*="Bl%<iDKH3m:-pQUBl7F$ASl!rF<G%8Bl%<&@;]TuF('6'+>"^QF`VXI@V$ZmDf0,/
@V'.iEb-@#:-pQUF(96)E-*48ASu("@<?4%DBO%>+DG_7F`M%9BOtU_ATAo%DIal"CghC++A,Et
<_Yt)D..NrBF7@-6rm#M4ZY!+De*="Bl%<iDKIsTDe*="Bl%<j@<?'0+=Jre1+@WD:IJ5X6je$Q
E,9H&+E2IF+=BcW6rm#M-OL2U67sC%ATT&5F`_SFF<G10Ch7Yp8l%iE8PDQ93ZoebDe(J7C3(a0
:-pQU8l%iA5ta@%+<W%HDe*<cCG'=9F!h;%8l%iK:I.BJ78m/T8PDQ93Zr0V@<?1(AT/c,E+*j%
+=DVHA7TUrF'N?hDImisCg:^nA6^K58l%iE8PDP[:-pQU@UWb^F`8IAAftVuF*)G:@Wcd(A0>Ju
Ch4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6EbTK7+Co2,ARfh#Ed8!a:IITB;cHXd6<-uR
6q0aA76N[SC2dU'BQIa(+=JEd-W<B1-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^
?W0p2?V4*^DdmH1/4r]+7S-9B$49Np/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@+DG^9E-67FA8,Oq
Bl@ltEbT*++CT)#ASrW$Bl[cpFDl2F$;+)^6qL<V;Fs2T<(Tk\>"MOR3Zr0V@<?1(AT/b>C2[Wi
-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$kub:IITB;cHXd6<-uV:JP(b:d$i^C2dU'
BQIa(+=JEd-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1
/4r]+6qL<V;Fs2T<(Tk\>"MNt$>=!ZA3Dt$:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df$jQ9L]A&ART+43bW)5A1SiO-Vcu\+BE&o
F(oQ13Zoe$-u*[2G%G]8Bl@l</12P_6?R!YA0=WiD.7's3Zoe$-mC]eDe*="Bl%<iDKI<Y-QjO"
@<?'A+=A^TDe*="Bl%<j@<?'0/5/M?F)>i<FDuAE+D>=pA-rZ=67sC&F`M@BDe<T(GA(]4AKZ&5
@:NjkE,oN2ATDs&FD5Z2+CoV8Bl7Q+8l%htCi<`m$><p43bW)5A1T)V3?^F?0e"5!-S.q\$49Np
/g+e<F<GOCAT2[.@qB_&DfQtA@rc:&F<E.XCh7$uAKYo/Cj@.:ART+\EZek1D/Ej%FE7e14ZX]r
ATqg%FCf3.@rc:&F<Dtd4"qd4.=4*:+>b3RATT%BC2[X%Eb02;$49Np/g,">Bl5%c:IH=8CghC+
ATJ2k4ZX]I3ZoebDe*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6-Qia':-pQU
@rH1"ARfg)B6%p5E$/\&E+NotASuU2+:;XjE-"0'+D54rE-!?Y4s4JF$?L'&F`_SFF<Dr@Df'H6
ATMp,DJ((E/hS7o$;No?+Co&-BPDR"+D5_5F`8I:ART+\EcW?1BK\C!A7]suBlmp$F(96)E-*EZ
4s525+u(3(HTE9)+D58-+D2#g:-pQU@rH4'Eb0<5+CT)&+Du+8A7]^kDId<rF<GdGEb'56Bl5&)
@:NsnB6%p5E$-Q;+CfG7DI[?kE[_?*De*EB3ZosrI4dcG@rH4'C*l+e-n'Kr5WWOuE%*+d4s4Je
+>#2m/j:CgAT2\t$;No?+Cf>,@VK^k+D>=pA7]d(@;]TuGAhM4+Co%qBl7X,Bl@m1+:<0Q3ZrJd
/0I"s/0JUK/1r&TDe*Dd$;No?+CT5.ASu$$E,Tf>+E2@>@qB_&DfQtA@rc:&F:*(P3ZrJp+Co&-
BPDR"C3*m*BlJ/:-o!e;+>PBm3]\B?+D58-+=CoBA8lI.F=.D&:-pQUEb0*+G%De)+D,2/+ED%1
@;0UnDJ()4ARoq$A79@t+C].qDJO;9@:jUmEZb]a67sBhF)u&.DJ`s&FE8QV+EV:.BlY>8Eb0<'
DI[6#@;]t$H#k*FAK_D%4ZX^!@j!<F-SHT*/h]@?0-ED=00M?D+Cf(nDJ*NuEHE=E$49Np/g,4D
G%De+Df'H6ATMp(A0>],@:UL%@rc:&FE7e1D/XQ=E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DK@id
$7KsY3ZrN_85E/`+EJtSGB.D>AKZ&-Dg-//F)rHr:IIlP5t"[@;cH4X9LT;0D/XQ=E-67FF!,[I
Blmo/F(fK9E+*g/+A,Et6qL<V;Fs2T<(02E8PDP[$;No?+E_X6@<?''@rH4'Eb0<5ARloU:IH=9
BleB:Bju4,Bl@l3/Kf(FEHPu9ATJu?Anc'mEsbZ//g+S?A0>i,H>.=R2(iHbAKYo/+Cf>,D..<m
+EM4-Cht55@<?/iF!,dLAT2Ho@q?d(BQ&*6@<6K48l%iE8PDQ78l%iC8Q/Sd8O?EV8P`)b8Pfa$
:-pQUF`:l"FCcS(F_PZ&+D>J1FDl2F+>"^WFDl22A0><%+E2.*Bl5&8AU&;>D.-ppD[K*46pamF
9LMEC;cHOj=Zneg-o!e;+>PBm3]\B?+D58-+=BcW6pamF9LMEC;cHOj=XOPK:IINL8PDNC8Q/Sa
;HZ.D+A,Et6<-TN6qBmJ<)6Cp/1<7u9L^H^BOtU_$8`lEF`\`R8l%iA<CokP84c`Z:Jt=C4#/ZT
8l%iA<CokP84c`Z:Jt=&$;No?@X3',+EM7CAKYo'+D58'ATD4$ARlp&Cgh$qFCf]=+EM%5BlJ/$
F)>i<FDuAE+=JEp,BG:b-QmJ?EbTK7+C]V<ATK4+F)>i<FDuAE+=BcW6m,uXD/aN,F)to'+C]J-
Ch+YuDf'H0ATVK2$49Np/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>mDe'u/Df6b&+>Y-YA1&`3
$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,&F_PZ&C2[WnBleB:
Bju4,Bl@lE0ht%f.UmO7Ch.:!A7TCqFE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3
@WcC$A.8kT$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?Q_Km
+=BH@6#(=K@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6
A1%fn%17#lD`p-(A8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%13OO0d(LY
F<DrRE+EC!ASQ-oD..<rAn?%*-QjNS+<VdL:-pQU5s[eYEaa$&3B9)/$4R>_F!)i>F_PZ&C2[Wm
Df'H6ATMp(A1&KB+<VdL+<Ve%67sBH5s]U5@<6*B3B7NUEcW?N@WcC$A86$nFDl)6F(9-*E,oN2
F(Jl0+<VdL:-pQU5s[eYEaa$&3B9)/$4R=s+EDRG+=D;NA79RkC2[WnBleB:Bju4,Bl@l:+<Ve%
67sBH5s]U5@<6*B3B7NU0d(LYF<DrRE+EC!ASQ-oF)Q2A@qB1nD/aPD+<VdL:-pQU5s[eYEaa$&
3B9)/$4R=s+EDRG+=D2@Ch7$rASQ-o-QjNS+<VdL+<VdL+<Ve%67sBH5s]U5@<6*B3B7NU%15is
/g+\=@ruF'DIIR"ATJu4E+NouA0>T(+ED%0ARTXkC2[Vl$;No?+E(d5I4fGVD[d$_$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A7B[qCh,Od3F<4&%13OO@WcC$A86$nBkh]E
0ht%f.UmO7Ch.:!A8,e"+<Y_W/KeMFBl%=$06M5E@<?(%+CQC=BlG2,Bl%?'@rH7,@;0UnDJ((a
:IH=8CghC+ATKIH%15is/e&._67sBIF_PZ&F!+m6@rH4$ASuU$A0=K?6m-;a@:UL%@rc:&F=n\6
F`&=GBln#2-us/R%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$
+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,Oq
Bl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"
ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/g(T1:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG
/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ305i9K$;No?+:SZQ67sBJ@<Q3j
FE9JP$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8FCB&t@<,m$8g&(n
De<^"AISuA67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:s
F`&lg%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g)l'C3=DJ2]s[p@:Wn[A0>W*A8lR-Anc'm/no'A+DPh*E+*d(F"V0A
F!,49A9Ds)Eas$*Anbme@;@K0C3'gk%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'mF"V0A
F!hD(@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!
A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs
0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:
Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1
%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+DPh*Bkh]rG[G]&GV4;VE$/k4+E2IF+Co1r
FD5Z2@<-W9@;KXhDBNJ(Eb/a&DfU+4$;+)^6qL<V;Fs2T<(Tk\>"MOR3[\Z\A8,e"?RIBQ-SAaR
+Cf(nEcZA4+DPh*G%G]8Bl@l</13&rBlGF/$:.?W78?ZF<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$
6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VQ>Z8l%iC8Q/Sd8O?EV8P`)b8PhQ2+@/[m
78?ZF<(JQ4:IITB;cHXd6<-uV:JP(b:^ma@$;No?+D58'ATD4$AKXT@6m,uU@<6K4F(96)E--.1
$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;
C2[X$DC5l#C2[WpBl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G@:UKjCghC+
+D,>(ATJu'@:O'q@;]TuGB.D>AKZ)5+F7a@+:SZ+C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi
-8%J)HTE?*+DPh*Anc'mEt&Hc$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7lu-ZW]>
F)kb<4ZX]B+D58-+?MV3C2[X%Ec5Q(Ch4`(De*fqEc#k?C2[X*F(KB%Df00$B4>:b-OgD2HS-Ks
+EMR5.6T^7HTE?*+EMR5%13OO:-pQUF`:l"FCcS,Bl%@%+DG^9F)Q2A@q?d/BlG2/DBNA(Bk;0)
%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5+?V#(Bkh]:%14dOC2[Wn@<<V7+<VdL
H?*S9Cgggb+=KE-HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA92j2Eb/ciF<GmMAT2Ho
@q?c24u%CR8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[WnDdm6cF<D\KH?*S9Cgggb+=KE/
HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8PajARo4k+<YuNAT2Ho@q?c24u7OT8PDQO
.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*FD5Q%@<<V7H?*S9Cgggb+=KE1HU^S#78kWs8l%iC
8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA9;a.Cia,qF<GmMAT2Ho@q?c24uI[V8PDQO.6C-t6psUF<)Q:S
<E)Oc:0L4c%14dOC2[X$DId0t+<VdLH?*S9Cgggb+=KE3HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b
8Pfj'0Ka)gA8lR-Anc'm+<YuNAT2Ho@q?c24u[gX8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dO
C2[X%@<-4++<VdLH?*S9Cgggb+=KE5HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA9Ds)
Eas$*Anbme@;?u.H?*S9Cgggb+=KE6HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g+\C
+CT)&+<Y91Ch7Z1AU%p1F<G:8+F7a@%17DmG\M5@+u(308PDQO+=o,f4A&C;6qL<V;Fs2T<(Tk\
>"MO"$?L'&F`_SFF<F1O6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2
@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%16QeBl%<pDe*s.DesJM0ht%f.UmO7Ch.:!A9;a.Ci^_?/M/)SF_PZ&F!+m6
Ap%p+Gp$U8D/Ej%FCeu*8l%htFDl)6F!+t/@<6K4F(96)E-*]A$;No?%15is/g,=KEaiI!Bl,mR
%15is/e&._67sBJ@<Q3jFE9JP$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9
ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,(CAD..]F3$9dqEb0,sD.R6#@UWb^F`8IFD]j">De+!#FD5Z2+>"^WBl.g*BkD'j
F!+(@9H\%eF*(i,CbKX6Bl8$(DIIEmAISuA67sB90JP;!@<jRa+>"^YE+EC!ARloqDfQsm:IH=E
DfTqBFDi9qBl8'<+AYoF$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&
3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6
A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+
%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;
FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua
+D5_6+=CW@Bl%<pDe(4)$4R>;67sC%ATT&<D.F(_-YdR1G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F
/kSo-<_Ysk$>OKi@WcC$A7T+jAN`'sFE;P4D/^jM%14ItDe*s.DesK<ATDj+Df-\4De*s.DesK(
F_PZ&@r?B94ZY?F/kSo-<)6:`;cZU\%16igA9;a.Cia'.Bl%<iDKJ$&+?hi$De*s.DesK(F_PZ&
@r?At$4R>;67sBpDI[]uD.RU,+C]J-Ch+YuDfor>ATA4e8l%iS:JXY_<_YtF3ZohcDe*s.DesK(
F_PZ&@r?BMC2[WlF_PZ&A79Rk.3L#n+>PBo8l%iS:JXY_<_Ysk$?U-(Ci<f+E-67F-V@0&<)6:`
;cZU\-OgCl$;No?+EM+9+E)CEE-67FAnc'mEt&IK:IJ/X:J=\M/g)NVDe*s.DesK)Df'?&DKKH#
/no'A-OgDT:IJ/X:J=\d78m/T8PDQ93Zr0V@<?1(AT/c,E+*j%+=DVHA7TUrF'N?hDImisCg:^n
A6`kfA7^"-F'L(D8l%iS:JXY_%15is/g+V3@r$4++E(j7A8-+,EbT!*FCeu*Anc'm+E2.*@qB0n
Bl5&4F`\a:Bk)7!Df0!(Bk;?.F(96)E-*45Bl[cpFDl2F%15^'6psUF<)Q:S<E)CT7S-9B4ZX^#
E+*j%F(K;5-mC8k;aXG1/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in
@VR>C8l%iS:JXY_%13OOFD,5oA3Dsr-Vcu\+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df$j2$?Trm@:VM^
+<Yc>ART+#9L^Q]-Vcu\+BE&oF(oQ13Zoe$C2[X)Df9H5G%G]8Bl@l?-QjNuF_PZ&+AR&r@V'R@
+=A]g,!'IWA9;a.Cia'.Bl%<iDKI<Y-QjO"@<?'A+=A^TDe*="Bl%<j@<?'0/5/MB$?L'&F`_SF
F<G[=ART*Y$4R>;67sBnASu("@<?''FDl)6F!,O6EbTK7+CT.u+ELt7AIStoEap56Df9H5@rc:&
F=044+>P'VCi^^HC2[X)Df9H5-OgE(D/XQ=E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DE9-S$7KsY
3ZrN_85E/`+EV:.@:Uo_7P&Y"DesK)EbTK7.3NhTBlmo/F(fK9E+*g/+A,Et<)6:`;cH1a<(9GQ
71BTFD/XQ=E-67FF!,[IBlmo/F(fK9E+*g/+A,Et6qL<V;Fs2T<(02E8PDP^$4R>;67sC'E+EC!
AKYH)Bl%<&BPDO0DfU+G/Kf+VDfTE"+CT=6E,8rsDBO%4G]Y'F@:O=r%15F%8PDNC8Q/Sa;HZ.8
+=Js+0H`,"HTF211a$FBF<Dr':IJ/X:J=\R<CokP84c`Z:Jt=C%15F%8PDNC8Q/Sa;HZ.8+@9("
9LMEC;cHOj=Y(sV,>:QU/9GQ:@:TfS1a$a[F<Dr':IJ/X:J=\R<CokP84c`Z:Jt=C4#/ZT6<-TN
6qBmJ<)6Cp%13OOF)>i<FDuAE+=CoBA9;a.Ci^_/Df'?&DKKH#+C]J-Ch+YuDf'H0ATVK2%13OO
:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*s.DesK)Df'H6ATMp(
A25l767s`sF_PZ&C2[X)Df9H5@rH4'Eb0<5ARlp)/M/)SF_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1
+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-*]A$;No?%15is/g*MtDf0,s+D,Y4D'169F_PZ&
C2[X)Df9H5.3NJ9@rcJs$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l'An>F*3$9dq@rH(!F(KB6+=Cl<De(4<@:Wn[A0>;mFCfJ8D/XT3DJ((a:IH=>DKKH1Amo1\
+EVNEBkhQs%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@L@:WneDKB&kEar@#BlI='Anc'm
F"V0AF!hD(@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#
AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2
@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5
DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%15is/g,4HF<GaD
A.8knC2[X+ATDj+Df-\4De*="Bl%<iDKI6h3\l%78l%iU9gfEtC2[WlF_PZ&A79Rk4ZX]oCi"36
Bl+u7F*(i-E$m"B$7BS,A9;a.Ciac2EcYr5DBN\4A9;a.Cia'.Bl%<iDKI6h3\l%78l%iS:JXY_
<_Ysk$>OKiFDl)6F(09+Ch.$nF?MZ-5!!FsA9;a.Cia'.Bl%<iDKH<p%15is/g+kG@rc-tASuT4
@WcC$A0>B#F`);4EX`@J:IJ/X:J=\f9gh-*+=LuCA9;a.Cia'.Bl%<iDKIsTDe*="Bl%<j@<?'0
+=Jre1+@WD:IJ/X:J=\f9gfEtFDYu5Ddso/F`\`R8l%iS:JXY_<_Yt0%13OO:-pQUF(KG9Dfp/@
F`\a<Bl%@%%15^'6rZrX9N+),+<VdL-YdR1FDl)6F"V0AF!hD(:-pQU8l%iS:JXY_6:"7-/g)NV
De*s.DesK(@;@K0C3(a3$;+)^<)6:`;cH1a<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$
B4YslEa`chC2[WfC2[WoG]\"3-S.kc6rZrX9N)B-%15is/g*b^6m-PrF*(u1+DG_7FCB!%+F7a@
+DG^9E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6psUF<)Q:S<E)Oc:0L4c4Y@j)
C2[Wi-S-Yn/mftK@q]:kF*1q7C2[X+ATDj+Df.!T-SB^ZE$l)%8l%iC8Q/Sd8O?EV8P`)b8PhQ&
+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$
6uQOL.4e(e6psUF<)Q:S<E)Oc:0L4c%13OO:-pQU@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.
CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6EbTK7+Co2,ARfh#Ed8*$8l%iS:JXY_6qL<V;Fs2T
<(02E8PDQ93Zr0V@<?1(AT/b?+tb6A6W,9_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K
87,_&<*s!):IK,1C+1]+:IJ/X:J=[r$4R>aBOtU_4ZX]5:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH33%172jART+43ZoPe
BOtU_/5/Ma-mqbV/g+2+EcYr5DE8mf/8B*6FDl)6F*;,8F(oQ1/12P_6?R!YA0=WiD.7's3Zoe$
-mC]eDe*s.DesK(F_PZ&@r?B;/12P_6t(1K3Zoe$C2[WlF_PZ&A79Rk.4e.^%17/nDfp/@F`\aJ
BOtU_%13OO:-pQUB4YslEaa'$+EVO?Ci^_?@rc:&F<G"0A0>r%G%D*i:-pQ\Eap56Df9H5@rc:&
F=044+>P'VCi^^HC2[X)Df9H5-OgCl$?L'&F`_SFF<Dr@Df'H6ATMp,DJ(),De*s.DesJ;/hSb(
%13OO:-pQUAn?'oBHUu"@:Wqi+CT.u+Cf>,E,oN2Et&Ii4Y@jfATqg%FCf3.@rc:&F<Dtd4"qd3
.=4*:+>P'PATT%BC2[X)Df9H5-OgCl$;No?+Cf>,E,oN2F!,@=DId<tASu$iDKI"6Ec6)>+EqaE
A9/1e-ZU>N-Ts()@rH4'C*4p;Ec<-KC2[X)Df9H5-Rg/i/g+e;AT2]5-YdR1FDl)6F!hD(%15is
/g+b;FCSu,@;]Tu@rH4'Eb0<5+E27?FDu8=@qB_&DfQ9oE'5frA7]suBlmp$F(96)E-*3N0fq'3
1+@Q23Zp7%B4Z0--W!T;<*sBYA9;a.Ci^s5$4R>aDf9H5@rc:&F?M6!BIn3UE"*-`$?L'&F`_SF
F<DrLF`_SFF<G10Ch4`*De!3tBl@m13[Y@D.!%O(+EVNm:K(48FD,5oA1Vh@DesK)EbTK7.3NhT
Blmo/F(fK9E+*g/+A,Et<)6:`;cH1a<(9GQ71BTFD/XQ=E-67FF!,[IBlmo/F(fK9E+*g/+A,Et
<)6:`;aa2U<)Q:S<E)CT7S-9B%13OO:-pQUF`:l"FCcS)Df'H6ATMp(A0=K?6m-#SF*)G:@Wcd,
Df-[L+ED%5F_Pl-F!,d@Bl%@%%15is/g+S?A0>i,H>.=R2(iHbAKYo/+Cf>,D..<m+EM4-Cht55
@<?/l$?I>9Eb03+@:NjkF(fK9E+*g/+=JUPDe*F(FE9)_/4r]+<)6:`;^je#:IITB;cHXd6<-uV
:JP(b:^ma@$;No?+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=+DkOs
Ec2Bo6<-TN6qBmJ<)6Cp4Y@j*0fq'31+@Q23Zp7%B4Z0--V@0&<)6:`;aOJU9LMEC;cHOj=XOXc
6<-TN6qBmJ<)6Cp4Y@jD<CokP84c`Z:Jt=H-o*#@7O]m1BOtU_%14p7E-67F-V@0&<)6:`;aOJU
9LMEC;cHOj=XQ9d2*4-)8PDNC8Q/Sa;HXG9%15is/n0*JAKZ&.H=\4;Aft_tDImisFCeu*E,8rs
DKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chhF(96)E-*43H$!V=-OgE(D/XQ=E-67F-V@0&
<)6:`;]oRgD/aN,F)to'+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2
@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%16c_F*)>@H"q8.1,3EQDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$%156]
+>>E./iGR04ZsoUARci;3@l:.0JP9k$6Uf@-td+5/9#`R.3NMHG9CL/FCSu,@;]TuF(KG9E-67F
A8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1+<WNaB4Z0--RU#G$6UH62'?j\F<DrADe!p,ASuT4
FD,B0+Co1rFD5Z2@<-W@+:SYe$9^Np0J5@<2BY.G+@KdN+>GW&+>PW*0b"I4.Ng-SDe*NmCiCgG
E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+=LuCA1hh3Agn/r+<Vdq:fAnf<(0n3@;]Tu
85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNE
Eb/d(@q?d)BOr<-BmO>5De:,,De*p-F`Lu'/p_5N/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od
@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g+)(AKXrcAKXT@6m,<7B4W\)$6Uf@
-t@14E,$gE@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'
+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+=Jfo.6T^7@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$
$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#4ZsoA/ibOA+?_k16tKjN1b9b)0JP9k$6Uf@AncL$
A0>;'-uEC.ALSa2F_;h2DBL?<F_u)ADfTB0.3N%AE+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'
DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+=\LGBm=3"+CT.1-uEdA.3N)BB-;;0@<<W2Ec5K2@qB0n
Bl7F!EcP`$F:AR"+<X9P6m-Pm@<-I4E%Yj>F!,%3FE2),F!,C=+A?KeFa,MJ$6Uf@D/XH++EV19
F<G(%F(KD8@:Wn[A1e;u%156]+>>E./i4\64WmL<Fs&Ot/0H]%0ej+E+=\LVE+EC!AKY`+A8,pl
AU#h@FDYh:FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq.Ni>;G\(D.
@3?t8@;BF'+C]J++>"^Q@;BEs@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-
@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.
E+*j%/e&.1.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%156]+>>E./i+V5
4Wm@>DBLYg/0H]%0ej+E+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h
/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/
A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(
DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKY`+A1hh3Afu;3Cht5'
AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$9^Np0J5@<1*A_C+AH9i
+>Pr.+>PW*0b"I4.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?Ke
Fa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+F[a0A8c@,
05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%
DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N[(6De*NmCiCgS%144#+D>2)+C\nnDBNG-DK]T3FCeu*
FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!
F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+
FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!LC2[W8E+EQ0%13OO+<Ve?FEDI_0/%NnG:m?C
GV3lFF>%]K@<,pi05"^.Ap#sbB4EV)$4R=b+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8s
G[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et
+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'
AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?D0[75Ci<r/@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6
B-7Wj+<Ve@DBO%7AKZ22Ch,.-$6Tcb+<Ve?FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D%-g]
$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'Q
F*(u1F"Rn/+<V+#4ZsoA/ibO=+?_k19jr;i2_6(,0JP9k$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<
Eag.>ATT@DFDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R>*4WlF23A*!.
4ZsoWARZc:3%Q1-0JP9k$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'
9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144-+ED%4Cgggb
A0=K?6mm$u.!d<bCi<flCh4`'DKKH1Amo1\+EqOABHU`$+=Lr=De(:>Bl8$(Eb8`iAM+E!+<Ve!
:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+=LuCA8c?7/0H?UDe*cuAgnj2DIak!$6UH6
-u*[2F*VhKASlBpFD**GBl5&8BOr;7H79tQDe!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6
GAhM4F!+n3AKYMpAnc-oA0>T(+=Lr=De(:>GA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&
Ci<flCh4u8+EM+&Earc*E+*j%%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4
+=LuD@<?1(AT0(@@rH7.ASuU(Df0VK%144-+DPh*/oY?5+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c
:IH=6A7TUr+E1b!CLLje/g)9ODe(J>A7c8X+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FB
Afu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<C2[W8E+EPi$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=
DIjr"Gp"MMDe*NmCiCgU+B`W*+Ceht+CoD7DJX6"A0>W*A1hh3Ado(i+<Y*1A0>i-@:NjkBlkJ3
DBOC:A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2+EVNEAStpcCh4%_+<VeCDe!3l+AbHq
+ED%%A8,po/e&.1.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,
@;]^hF"Rn/+=\L6<(8hiD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9
ASkmfEZd+s+D,P4+B;B13%6Hh$6Uf@6<R8V+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,
Cis;31,^a-+:SZ#%156]+>>E-/heD24WmO1F<E@o/0H]%0K9LK+=\LBA7T7^+Dtb7+DPh*E+*d(
F"V0AF!,F1Ea`frFCfJ85uU-B8N8RMFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%
+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:
2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1
@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+=\LKDe*p-F`Lu'+E_a:F!+n4
@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.
H=\4;Afu2/AKYN%GA_58@:XF3%144-+Dkh1DfQt4Bm=31+DG^9C2[W8E+EPi$4R>*4WlF22_Hm/
4Zso`@rrhP/0H]%0K9LK+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^9
8l%ht9OVBQ,;^NODIal3ATMr9-Z`j@F`:]&De*g-De`inF=.M)+=\LGBm=3"+CQC)ATo8=H#R\C
+DG^9C2[W8E+EPi$4R>*4WlF22_Hj.4ZsodAT/bI2(Tk*0JGHq$6Uf@@rH4'Ch7^"A0>E.@:X(^
+Cei$AKYo'+CoD#%144-+E_X6@<?'k+DPh*/oY?5+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO4ZsoA
/iPC;+?_k1;e9nj1,LO)1,(CA%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-
Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth.NibCE,8rmARloU:IH=9Bl[cpFDl2F
+Co1pB6%Et+DG^9C2[W8E+EQ'/Kf(FA9DBnF!,O<H=\4;Afti,A1hh3Ado(V$9^Np0J5::0H`MA
+B)ij+>Pc)+>PW)3"63;.NibCAn?!oDI[7!+CSekARlp*D]ie5A1hh3AfqNi+=\LOATo83De'u(
@<,mgDfBtEGB\6`CisQ:/n8g:+D#(tFD5Z2%143e$9^Np0J5790H`MA+@1-_+>Gi,+>PW)3"63;
.NiSBDJsP<C2[W*F(96)E-*46A8-.,%144-+DPh*/oY?5+DG_(AU#>3D/aN6G%G2,%143e$9^Np
0J5480d&VB+A-cm+>PZ&+>PW)3"63;.NiJEA9Ds)Eas$*Anbm1Bkh]3@:Wn[A.8kg.NiA7AT2]5
DJs_AA8bt#D.RU,ARlotDBN\4A1hh3Ado(i%156]+>>E*/heD24Wm@>C`kGl/0H]%0K9LK+=\LK
De(J>A7crpDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%156]+>>E)/heD24Wm@>C`kGd/0H]%0K9LK
+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9C2[WnAThm.@:UKmDfQt:@:BZQ+=\LNBl7j0
+DbIq+D#(tFE8QV+ED%*ATAo8D]j+C@<-I4E%Yj>F!,17F*(u%A0>f&+EM%5BlJ08/no'A%143e
$9^Np0J5.63$:@I+AH9i+>Y`'+>PW)3"63;.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgr
Df-!k%156]+>>E(/iOn94WmI-Gp"mt/0H]%0K9LK+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51
@:F:#@ps6t@V$[&F`%Wq%156]+>>E(/iFh84WmI-Gp"k&/0H]%0K9LK+=\LGBl\9:+ED%0ARTXk
+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u
@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!
+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1%143e$>OKi2D?n,AS5^uFCfJJ
0ht%f.V`m42D?n,AS5^uFCfJ8F"JsdEb-hCAS5^uFCfJ88l%htA8,OqBl@ltEbT*+/e&._67r]S
:-pQU<+oue+<Y`8EbTK7+<Y]9/TPE8BleB-EcW?G8l%ht+Co1rFD5Z2@<-'nF"SRX8TZ>$+<Y)8
+D5V2A.8l@67sC"Ea`I"Bk(]sFDi:=@;0V$@;0U%@3BDqF*(u6+EM%5BlJ/:FD,*)+Du+>ATJu9
BOr<&De!3tBl@m1%15is/g+S?A0>buD.Rc2De:,#Cht5&@ruF.AKXT@6m-#S@ruF'DIIR"ATKI5
$;No?%15is/g)o'0K<K[E\KBo/Kf+CG%G2,Bl5%AC2[WnATfL3$;No?+>PW)3,N)L1,0n'+DPh*
+EVX8AKZ#)Ec5l<ARl5W:-pQU1,(F:DJs\P1a"@mF(KG9AoD]4D0KQ$@grc?67sB90JP;!@<jOe
+>"^WE,961+DG_8D]idQ0JY:r2_Zs/F(96)E--.1$;No?+>PW*0l:?E1-$I/+Dl%-BkD'jA0>u4
+EDUB+E)-?GA1qJCh[d0GRXuh$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@B4YslEa`c;C2[W1
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ATV?pDK?qAFE2)5B-:YpAoD^$+D,>.
F*&OC@q0Y%Eb0,uAKYo'+=MI`%16QUAoD^$F*)Fc3aEkT/q+ot-7ER\IORN1>9H?e+C-E*$4R>;
67sC$ATW'8DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><@rH4$@;]Us+CT=6FCf]=+EMXFBl7Pm$>=@!
F?MZh3Zp1$3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H%13OO:-pQUF(KG9A8,OqBl@ltEbT*+
+EVNE;FNl>=&MUh73E^)+Dl7BF<G%(+D#e:Ch[C$+Co%qBl8$,Df.0:$;No?+AP^3762Q%Bk)7!
Df0!(Bk;?.F*)>@AKZ).AKYN(Bm+&1Ch7^1ATAo8BOuGu$;No?+EqC;AKYetF*&OFAS5^uFCfK(
A0>f.+CT.u+EV:2F!,1<+Du+>+Cf(nDJ*Nk%15is/g,@OASrW!+AtWo6r-QO=Wh6h@ruF'DIIR2
+DGm>Eb-hCAS5^uFCfK(A1f!(D]j(3F(KG&$;No?+EMXCEb/c(A9)C-AKYf#FED)7F!,=.CLnVs
Cht5)Bk)7!Df0!(Bk;?.;FNl>=&MUh71BT!67sBiAS,k$AKZ#)/TPE8BleB-EbTE(/e&/.De)!`
+>Y-$+=ArfDe'u9+Bot!E-#T4+=AO776s=C;FshV-RU$@+E(d5Gpa%.Ec5J84s58++E(d5-RU$@
+>Y-YA0<6I%13OO:-pQUF`)52B5)F/ATA4e1E^^LB4N>Q+FPjbDe't<-QlV91E^UH+=ANG$4R>;
67sBkBk)7!Df0!(Gp%'7FD,_</KeV8BlkJ>D]in*FCSu,@s)g4ASuT4Ci<flFD5Z2Et&IkDe*m,
Dfe-'+>Y-$+>=63Ec5l<4Y@j)05>E90./;!-SHhi@V'.iEb0<6EZd@c3\`H6-RU>o-SHhV$>F*)
+A#%(8PUC=D_</QDf9_\/g)NO3[ZJ!Df9_?%16Z_F(HsH%144#Ec5l<4Y@j*9L^-V/q+pVDf^"C
-Y6e$D]g;r:JF8*.4fLXDfd*2$>"*c/e&.:%15L"4Y@jlDe*m,Dfd*U%13OO:-pQUEb/ltF*(u6
+CfP7Eb0-1+EqaECM@[!+Co1rFD5Z2@<-'nEt&IO67sC$AS5Nr-YdR1A7]p3+<VdL+<W`o6r5E^
C2[WnATfFM4"!Wr6m-#OG%GK.E,B0(F=.M):-pQUEb/lo+=CoBA1&KB+<VdL+<Vdg-q$l_-YdR1
-Rh,)8l%htF)Q2A@q@"s$?B]jA0<7BFD5Q4-QjNS+<VdL4"*Kn/15R^Bl%i<.6AniASu("@;I'/
FD5Q*FD5<--OgE'AS5Nr-Y%(4F*2;@-QjNS+<W`o6r5E^@q'+!.6Ane@V@E6@<-F-DD,UB@;]js
Bl5&;DfTV9Df0,<De<U&-OgE'AS5Nr-Y%(4F*2;@A7]p3+<W`o6r5E^Ao_<tCM[^&A7]p3.6Ane
@V@E6@<-F-DD,UB@;]jsBl5&;DfTV9Df0,<De<U&-OgE'AS5Nr-ZEm1Gpa^W+<VdL+<W`o6r5E^
E,8s.-Rh,)C*7V:Gp$R7GUEq-Eb/lo+=D5IF_<'E+<VdL+<Vdg-q$l_-Y@1/@r$+-F=/M!-Za-I
B5Md(04o$7@r$*-@;op'F)Q2A@q@"s$;No?+ED%+A0<73Ch[BpEclJ7ATfFD4"*Kn/15%GBk(q!
F`_/*Fse_#-Uqod@r$*-A7]pqCi=90ASuT;%17,eB4N,4Bl.9kALATC+<VdL+?Lu>:b3u.D..'g
-Rh,)FD,f6@WQL2F"_KRD'3P1FCfK)@:NjkBl.9kAKYr4De!@"F(oN)-OgDX67sC$AS5Nr-Y[F+
B4YUbFseCT+<W`o6r5E^Bl.9kARo@q-Rh,)FD,f6@WQL)F`T3TF)<%1AThX$DfBQ)DKI68$;No?
+ED%+A0<7/F_#,rF=/1R+<VdL4"*Kn/14nLA7oIq-Rh,)G@b?$Cj@.4F_#,rF<G+&FC?O+$;No?
+ED%+A0<74E-!BL+<VdL+<VdL4"*Kn/15(LF!iCu-YIC>+E_d?Ch\!*ATK4.$?B]jA0<7@D09K%
ATfFD+<VdL4"*Kn/15LUF_>5rFse_#-Za-IB5Md(05tuL+EMIDEarZ.%15is/g,1GB4N,4D0KQ$
@j`BA+<VdL+?Lu>:b3u2G@b8o-Rh,)D/!O)ATMr9ASlC&Dg>o7F!+t$F*1o-FEo!=Df'H%DL!@F
ASbdsARm.t$4R>;67sC%ATT%m76s=;:/"e5AoD]4F(K0!@ru9m+Co1rFD5Z2@<-'nEt&I4+E(d5
-RU$@+EMC<F`_SFF<G+5F(KG9-W3B!6r-QO=XP=r+E(d5-ZsNFCi^s5$8WfCA0<6I+Bot0D/XQ=
E-67FA8lU$F<Dr/76s=;:/"e<+Bot,A0<70Df0W=Cih$6$8WfCA0<6I+Bot0D/XQ=E-67FA8lU$
F<Dr/76s=;:/"e<+Bot,A0<7@D09J=%14m6De't<-QlV9F)>i<FDuAE+CoG4ATT%B;FNl>:JOSd
-QlV9De't<Bl.9kAL@oo%15is/g,4KDg*=EAS5^uFCfK(A0>Ds@ruF'DIIR"ATJ:fF)>i<FDuAE
+>b3ZA0<6I%16igA2c1sEb/ltF*(u61,2Nj/h1USA2c1sEb/ltF*(u6+EK+d+ED$FEb/ltF*(u6
+A,Et+Co1rFD5Z2@<-'nF"Rep67rU?67sB[BPDN1+EM%5BlJ/:+ED$FEb/ltF*(u6F!)St:IH<J
A8,OqBl@ltEbT*+/g)9.F=2,P+CQB8B5_^!$;No?+E2@0@ruEpAKZ)5+DkP$DKK<$DBN@1D..L-
ATAo7@rc:&F<G[=@<<W0DffQ3+EV:.+Dbt+@<?4%DK?.[67sBhDIal-@;TRs+E(j7@;Ka&@:OCn
G%Ddg:IH=9Bk)7!Df0!(Bk;?<$;No?$;No?+CfG'@<?'k3Zp130K<K[E\KBY:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB9
0JGJ'@<jU_+>"^NDe'u4Eb/f)Eb090DffQ$$;No?+>PW*0Q(fP0Jjn(+EM+9+D,P4+Dl=6@q,j@
67sB90JP;!@<jOe+>"^WE,961+DG_8D]idQ0JY:r2_Zs/F(96)E--..:-pQU1,(F;D..]E3?Tmr
@q]:gB4YTrFDi:BF`&=?DBND,FD)e@Bl5S?Bl8'<$;No?+>PW*0l:?E1,^7,+Cf(nDJ*Nk+EVNE
Ecl7BAo_g,+DQ%:CERG3@ps1b$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@B4YslEa`c;C2[W1
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ATV?pDK?qAFE2)5B-:YpAoD^$+D,>.F*&OC
@q0Y%Eb0,uAKYo'+=MI`$=[RYDfTE1FE0N*>p+JHINU?l-tt;_.6o:c+@Rn*>q$*f:-pQUEb0?8
Ec,q@Eb0<7Cige<Afto(DKU1WF`(o<+Cf>,D..<mF!+n4+EV1>F<GXHEbTE($>=@!F?MZh3Zp1$
3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H$49Np/g,4HF<G+.@ruF'DIIR"ATJu9D]hqH5t"dP
8Q8,$+>"^QF`VXI@V$ZnG]7J5@rri(AS,XoFD5Z2/db??/g*nb<(/hjA8,OqBl@ltEbT*++EMXC
Eb-A8BOr;sEbT].+DbV2FCfJ8FD,62$;No?+EqC;AKYetF*&OFAS5^uFCfK(A0>f.+CT.u+EV:2
F!,1<+Du+>+Cf(nDJ*Nk$;No?+EqL1DBN@1;FNl>:JOSd+Co1rFD5Z2@<-W9BlbD;AM%q6B5)F/
ATD?m/g+,3+ED%7ATS8S67sC%FDl22A0>E'Bm+&1Ch7^1ATDi7D..3k+CT)&+Co1rFD5Z2@<-'n
F!+@L5t"dP8Q8+c:-pQU@V'.iEb-A6AM%q6B5)F/ATDL&B.aO3De)!`+>Y-$+=ArfDe'u9+Bot!
E-#T4+=AO776s=C;FshV-RU$@+E(d5Gp`r>De(1Y+FPjbDe't<-QlV91E^UH+=AND$;No?+E_RB
AS5^uFCfJ"1E^^LB4N>Q+FPjbDe't<-QlV91E^UH+=AND$;No?+Co1rFD5Z2@<-W9E+*j%F!*%W
ARoLs+EVNED..NrBHUf-EcP`/F<GC<@psInDf0V':-pQU:/=hX3ZrNXBlbD?ATD6&@rc-hFCfM9
8g&:gEcYr5DBO">ARfFdBk&8pEa`iqBOu6--u*p:E[_>j67sC+Dfm1>@<iu>@;^00FDi:CATT%C
C3F0/.3N_N+CQC&Df0W<@;^00G%#30AM+=)De*m,Dfe-'+>Y-$+>=.;G%G\W/g)Mp-Qll0AoD^$
F*)FF3?^F<1a".n$?C''F?M6!-SK4QA1o;]C3F0//13(u$>F*)+A#%(8PUC=D_</QDf9_\/g)NO
3[ZJ!Df9_)AScF!/d`^DEc5l<4Y@j*9L^-V/q+pVDf^"C-Y6e$D]g;r:JF8*.4fLXDfc=tDIb@,
.1/I>4Y@jlDe*m,Dfd*U$49Np/g,1GB5)F/ATAo'F`MM6DKI"FDfTW-DJ()&Bk)7!Df0!(Bk;>m
Eb/lo+=CoBA7T7p-QjNS+<Vdg-q$l_-YdR1A7]p3.6AnL:IH=9AThX$DfBQ)DKI65Eb/lo+=CoB
A1&KB+<VdL+<Vdg-q$l_-YdR1-Rh,)8l%htF)Q2A@q@"pEb/lo+=D;RBl%i<+<VdL+<Vdg-q$l_
-ZsNFCi^sQ4""ZPDImisC`mkBBl%L*Bk;?5$;No?+ED%+A0<70Df0W=Cih$I+<VdL4"*Kn/14q:
BI>5j-Y$V!05t??F)PqLAo_<tCM[^&+EqaECERP5AM%h4Aof=,:-pQUEb/lo+=CZ;DKBr:FC\s+
-QjNn-q$l_-Y@C-DJO'&DId=%-Rh,)@q'+)E+*d.Df.4?Ea`j$Ch[c0GAhM;+E).//T565F!h<8
AS5Nr-ZEm1Gpa^W+<VdL+<W`o6r5E^E,8s.-Rh,)C*7V:Gp$R7GUEi=AS5Nr-Za-IB."fE+<VdL
+<W`o6r5E^F)?&4-Rh,)F)?&4D09JEAo)0kCN:P+E+pG9Dfp)1AL@g[67sC$AS5Nr-Y@1/@r$+-
FC\s+-QkK!6r5E^Ao)0kCN=Q>A7]p3.6AnHCh[BpEZen(G%GK.E,B0(F=.E9AS5Nr-Y[F+B4WG5
+<VdL+<W`o6r5E^Bl.9kALAog-Zj$ED.7R*F`T3TF)<%6DKKH1Amo1\+DG\$B4W3)Ec5H!F)u&5
B."$]67sC$AS5Nr-Y[F+B4YUbFseCT+<W`o6r5E^Bl.9kARo@q-Rh,)FD,f6@WQL)F`T3TF)<%1
AThX$DfBQ)DKI65:-pQUEb/lo+=CW@A7oIq-QjNS+<Vdg-q$l_-Xq4/B4Z04.6Ao$AS#XnGp$R=
A7oIq+Cno&@4)D&AS5Nr-YIC>-QjNS+<VdL+<W`o6r5E^B5ho>.6AniE-!.EFD5Q*FD5<--OOm*
B4N,4F)?&4A7]p3+<VdL+?Lu>:b3u8D09K%ATfFM4"#)dF_>Q6B.n4FD'3n<F`Lu'-OOm*B4N,4
D0KQ$@j`BA+<VdL+?Lu>:b3u2G@b8o-Rh,)D/!O)ATMr9ASlC&Dg>o7F!+t$F*1o-FEo!=Df'H%
DL!@FASbdsARm.q$;No?+EM+9+AtWo6r-QO=Wh<pEZfF7Ch7*uARlooBk)7!Df0!(Bk;>m1E^UH
+=ANZ>9IHqF(KG9-W3B!6r-QO=XP=r+E(d5-ZsNFCi^s21E^UH+=ANZ>9IHqF(KG9-W3B!6r-QO
=XP=r+E(d5-YdR1-OMXPDe't<-QlV9A8lU$F<Dr/76s=;:/"e<+Bot,A0<7@D09J=$8WfCA0<6I
+Bot!E-#T4+=C&U5t"LD9N`_c>9Iip+=Cl?@:s.!$49Np/g,4KDg*=EAS5^uFCfK(A0>Ds@ruF'
DIIR"ATJ3"D/XQ=E-67F1a$^I+=AND$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf
6$.-UF(dQo3F<,.De*BsFC.F3<&-=ABkMHpE+g@d:IH=P%144#+<VdL+:SZ20-G"JA0>r=F*(u1
+Cf4rF)rIEASbdsBl@m1BPDE.@<-C,GB43#DJs&s+Bot0FEq\64_ADECh7-.+EqC2B4uBM0e=Gd
ATDL(BOu3uATL!i/0JP=Ci!U"Ci=>WGA(]4AR.A,$4R=q0-FbCEb-A.De':aF*1r)Ea`p#+Cf51
F*(u6?Xki6HOU<)+<Y`IH#.%TAnc'tARmk3$6UH6@rH1%E]n5QB4uC"Eb0MX%144#+DPh*+DPh*
F*)>@AKY`+A8PajAKY`+A9E!.C`mJ2A7TUf%144#+DbIqAS`JP+<j0kEb-@c:IH=8CghC+ATK%W
%144#+D,P0FE;/BAN_e*3t2N>+<YK/@V'@jF`VXfE]X^;I16Mm$@3gH4s4QSDe'tpA8-'I@UWb^
/0K"UH#.%TA8cR3ARo(.%16faDe'tB4s4TYA0>)eBlZ@G@:O((+EMXMCh5b?Dfg)4A6h8+$>OKi
+>#c"C2[X(FDl22+BrAjE]ml?@r#@3%16igA0<Hf+DPh*D..3k+BrAjE]ml?@r#@3%16igA0<Hf
+DPh*F`_>6+BrAjE]ml?@r#@3%16igA92j2Eb-@F4s4TYA7TUf+BrAjE]ml?@r#?m3t2O3De+!4
Bl"nD4s4TYA9;a.Ci^_'A8-'I@UWb^>p)3<$>OKiFDl)6F!+\!Bl%TqDes?44a1RRFCe`>%16fa
De'tpAnc't@rH1%E]n5QB4uBrCis;p3t2OC+BrGlCi!U"Ci=>WCh[NqFCK'/AR.A,$4R>g+Bot0
BOPjk4_/88D/X<&/0Jb;@V'@=,'mL3C2[X$DBN\4A8c'l,$d8>$>F6nA0>)!F(f!$ANaR<@;Tq#
A1Sj>@:Eea4X+TTDe**jBl8$(Eb8`iAKYf-@ps1b,$d8>$>OKi+BrYj@V'@=,%55)A6a"h@;0U%
@r,RpF!=mO%16igA92j2Eb-@tCggdaCcrtNC2[X(FDl22>]+V)DfT9!AKYK!@<6K6>rrK&C2[X)
Df9H5+BrYj@V'@=,%55)A9;a.Ci`j!AU&<.DKBN1DBO%>DesJ=>rrK&C2[WnDdjhnCggdaCcrtN
C2[WnDdlshA8-'q@ruX0Gp%$7C1UmsF!=mO%16igA8PajAKY2n@:Eea4X+<LDe*]nCLpagF(96)
E-*42DIal#F_u)&DJ*NuATD4$Bl@l5>rrK&C2[X*FD5P6>AR_WASaLR@;9^kF`_>6>]++`BlkJ9
@VTIaFE:])@;]TuDffZ(EZfLHBl%L*Bk;?0>rrK&I16NuDe*R"A7^!m85r;W1,V1-FDYhX%144#
4D8;7A3LG0+<VdL4EP:ZCh5e&De)pfEb%aZA7^!<De*rP06CoMCh5d>$6UH6+?X^eH#.%7FEqh:
4X+uZG]YTKF)rNh%144#+<YT=HYm23B5)6E0KX5^A7TClB0%_pE-lG1EbB*(3\Yt7@kfZaG%G]9
Bk(Rf/R`I0B5TbPDf@d^Bk2=!3\`WN/i@Ti4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/
Des?43[86KAnGXe4(<,KA7]d5@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po
3\i<C2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr+<VdL1+k=>E--L\@l\mZATDm,@ps1*@;KXjDE;lX
E'&8XA9;KG1,:^>1H@HU3B9)[3B9)[3B1u"4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/
Des?43[86KAnGXe4(<,KA7]d5@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po
3\i<C2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr+<VdL1+k=>E--L\@lA[WATDm,@ps1*@;KXjDE;lX
E'&8XA9;KG2)d-B0JG170JG170JG1712q=s@W-9tATBADFEq\63cf4UBk0;7@:O(cEc6)<A1_;0
Ci=>T,A(P"AnGX:@W-9tATBA4Des?43[6=40JG174(<,KA7]d5GA1T0BK@k#0Q;+qE+*9fBl7QE
1+k=>E-)Nr+<VdL1+k=>E-*3X/i#;'F:AR"+<Vd^/i#;'FF>cO1,4-!ATDm,@ps1*@;KXjDE;WK
A7TLf4*PCLFD*]m1b^O9E-+0NDfTB"E\2?SH#.%QF)Pl/A347/@r#^tDfor./Rr^8DfRl`@q0+_
AnF,6DfTB"E\1d>Ci=>T,;:f*0JG1B@W-9tATBAHBk2=!3\`6@E-+0\@:Wn_DJ)!f/hh6d%144#
+<WNo0Q;+V2(gS%F:AR"+<Vda/hh6dI4f"aHZit@FD55nCb9(3BkM<EFDl+[GA1T0BKA%,/hh6d
4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?43[86KAnGXe4(<,KA7]d5@rH1%E]PF!
0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3\i<C2/mXH$6UH6+>PQ)2/mX[1+k=>E-)Nr
+<VdL1+k=>E--L\@krCM@:Wn_DJ(PCDf@`o/i@Ti4)JDHB5)68EbT0"F?2622/mY!A8-'q@ruF'
DE;TUE]\,HEbB*(/So!1F?2622/mY!E+*9fBl7Q8@W-@1Df%Nl/i@TiI4f"a2g]LPA7TClB.\4D
E&og.2/mY!D..HtBl5MCBkM+$3]&HHE-+0`AU&;KBl7HmDKIok1bLY)F?=GMA7TClB.[S2FEDG<
3]&HHE--L\@ko`bE+*9fBl7Q8FDl+Z0fUd>E-+0`AU&;K@;KXjDE;9=DKKH14)eV=A8,po/RiX?
FDl"W1bLJ$FF>cO0en#kBl7K6BOtmjBQQ9i/ho4FBOtmjBQQ9i12q=sA8-'q@ruF'DE;TUEd]QM
0f+0#Bk2=!3]/`J/hh6d4(;W.CM.[+F`(_A@rH1%E]PFWAnGXeAijs?A7TClB0%h,/hh6d%144#
+<WHu/hh6d+>Yo.0Q;+V1H$j>E--L\@l&IDDf0YKF(or33\`C/F?=)QDKIIB@;T^pGre<2F`M2-
EX`?u+<Ve%ATrPT@kf`cBOtmjBQQ9i12q=sA8-'q@ruF'DE;TUEd]QM1j`_NCi=>T,;:f*0KD-T
FCf]=/S&F&DfT9.Bl@lMF`(`$EboH-AUQ1@21&hOCi=>TBl7TqEbTVWFCf]=/S&F&DfT9.Bl@lM
Bl7TqEbTWD/n6UqHZ3D(A8,po/TboM3\`BB0Q;+qE+*9fBl7Q8@W-@1Df%Ni1+k8"FF>cO2g].T
DKIIOBmO>O0fX,o4(`DKF=h]JBkM+$3b!#DA:6(?3.#=MBkM+$3\YMpI4f"a21&eNEb&a%/Rr^8
Cgh:(ANF=>Ci!O!F(KbP@kflg@rH1%E]PFWAhYnm0RYQ`0faSmDf0YKAmoOjCjA'/Dfp)7ATA4e
+<VdL:1\Wt/n6S^AoDR//S8F.Bl&&U<b6;^@;]M%/n6UmHXpi2ARfgrDf.UPFE2e=De+-?@rH1%
E]PF!0JG170KWlbDKIIOBmO>O0f!]i4(`DKF=h*5D/!g33`Kg1ATJ:f+<VdL:1\VY$6UH6+B!,p
@;^L,0mdkJA7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2F
DfRl`0JG170JGS#Df0YKF(or33\`O3F?=)QDKIIB@;T^pGre63Bjkg>AoDR//U(c?B4uBJ@W-'n
4)eV=A8,po/RiX?FDl"W1G1A#FF@gXHZ3D(A8,po/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.A
FCf]=/R`I0B5TbHAS-$G@rH1%E]PF!0JG170KWlbDKIIOFEq\63b`\ECh[B@AoDR//TYWPANDP&
E-+0RDf0YKAmoOjCjA'-EbSru4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2FEDG<3\rBBE--MA
1OF(LA7TClB.\4DE&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2FDfRl`
0JG170JGS#Df0YKF(or33\`F0F?=)QDKIIB@;T^pGre63Bjkg>AoDR//U(c?B4uBJ@W-'n4)eV=
A8,po/RiX?FDl"W1G1A#FF@gZHZ3D(A8,po/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=
/R`I0B5TbHAS-$G@rH1%E]PF!0JG170KWlbDKIIOBmO>O0f3ik4(`DKF=h*5D/!g33`Kg1ATJ:f
+<VdL:1\VY$6UH6+B!,p@;\/=Df0YKG@bK$BQQ:EDerrGE+*9fBl7Q8@W-@1Df%Nk/hh6dI:tKb
E+*9fBl7Q8FDl+Z0et@8E-+0XBl7K6BOtmjBQQ9i/hfA/AU&;K@;KXjDE;TFAop+EDes?43[6=4
0JG174(`DKF=hQUH#.%QBlmd"Bk'5:Df0YKF(or33\`F0F?=)QDKIIB@;T^pGreo=D.Rbt$6UH6
+AQKl%144#+<XR#D..<DAoDR//U(c?B4uBJ@W-'n4)eV=A8,po/RiX?FDl"W1G1A#FF@g\HZ3D(
A8,po/TboM3\`BB0Q;+qCh[cu/SJ^0B4uBJ0eP.AFCf]=/R`I0B5TbHAS-$G@rH1%E]PF!0JG17
0KWlbDKIIOBmO>O0emWh4(`DKF=h*5D/!g33`Kg1ATJ:f+<VdL:1\Vl;K$D\DEDHKDKIISASGdj
F?3lLCh,VH@:Wn_DJ(P1Dfg)>D)sI*0Q;,^4>1btH#.%U%144#4>1AZ@:VP2$6UHR@W,e&+Cf4r
F)sJg@kfb`4q.iA+<VdhE$/Y,@<6KQ,%E>a+Cd,c,!HGC+<VdL+<WdfE+*W,@r,RpF$1^W1a$9^
,!HGC+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt
/n8g:04]!2F_t]-F>%/X0lU#FCL]+Y:Noc,7p7`9@<Q<e<&@KRG!U4d77C4&F_+N4<%V*J=ZLRX
04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<YcE@luDQ4q.iA+<VdL+?V;uE+*WJ%144#+<Wd"E'=^<
+<VdL4EP"@Ch4`!ASc1%@:Wn_DJ)*V0HqWLASc1(E+*6jDJ)*V0HqWLCghC+4X+Aj2'P3n$6UH6
+<VdhFCK0!Gs2ZE+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Ak
0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W0f1"_1,'n9%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EPS@k]$80fC4>BkhQs4>1bp@;\7<$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@lGN?
0Hr\-,;D)14%X=3ATDBk@q?caDfTB04>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+?V<!@W,e&4q.iA+<Vdh06CW3Ch5d>$6UH6+?XTc
@r,RpF$1^W0esq:%144#+<VdL4EGIMDBNG*@<6KQ,%E;L@lGSq4>1bp@;\7<$6UH6+?V;r4q.iA
+<VdhFCAWpAKYJoCi"'!A7TClB0@Fm+s:B,Ci"03@:O"hB0@Fm+s:B3@<6KQ,%E>b,!HGC+<VdL
+<Wdg@W,e&4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jAN=Tr@SB'd7p'q\=\_IZ@n9]n1Nn(f
2ahUu3G)VhC2H^>EG%:PAQN"fARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CSekB6%rR
04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KFGA9/l;DfTB0+E)9CFCfN8F!,RC+D5_5F`;CE
DfQ9o+<VdL+<VdL+<VdL+<Y`JBlmp-4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP
4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r
@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#
D.RU,04Z^j6"sn$CN2%C7nclS<&.Ho@s<$*6#TP&Fu<973)j6=C2-O_D-9PG=]7aBARoLs5A4jr
AStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Cf>,E,%Kg@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr
$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j
@rH4'Eb0<5+A*bdDe*EA06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA
+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,
Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ*:b?QYGZeX"2.'3oChRZR3D+C4
AOKBU3+d8D=)]a5;b9MS<C_.6A7mQ,A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLA7]R>
04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOKCh7^"+E(_(ARfh'4>1bp@;\7<$6UH6+<VdL
+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA
+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-
A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jE'cm'BJie#;fOWl>"378B4>^d2d^]2Al<ML2E"'=
DDjq0G'8%K2-O-9ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Co&"B6%rR04@$R$6UH6
+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL
+<VdL4EGIMDBNG*@<6KQ,%E;N5&t4ODg#\7GAhM4F!,CA+EV19FE8R:Ec5e;B6%p5E-!.?EX`?u
+<VdL+<VdL+<VdL+EM[>FCfMU06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ_/Mfn*Dg"-_=#a_B758pu
<)-S57VI'>7;Zm/?VWCs1e06A3(u8D8kgsMA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
A8,R:04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL
4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP
4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOO@ruF'DIIR2+DG@tDKKT)Bk(RnBl@lO
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZEDd$^28pF*/1iZ/E9Qs0A
6umK[EcZJKE(4V^F&ca\<bY\o95n$"<bF'sA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
A8-+(4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP
4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KOOF)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA
+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL
+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL
+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!
/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jEc#GG7<2j5GXPsr6Uj[iG?&9f=*8Rc96P,t:H!-0:2"HR
A2.,0<_I'YARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CoA+4>1,,%144#+<VdL+<VdL
+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<Wdg
A0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<Wdf
E+*W,@r,RpF$1^W0Hr\kBk)7!Df0!(Gp%!5D.Oi+BleB;4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r
4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<Vdh
E$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL
+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@
B5D-3@rH3;A8bt#D.RU,04Z^jH=L-%D_Wh#AiECW:fqa;E_8ee=_i%98lTn.F@SelF%U@eH#,lp
1,Ca?ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+CoD#4>1,,%144#+<VdL+<VdL+<VdL
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au
@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Ai,!KUWEc#6,+EqaEA0>B#D/Ej%FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6
+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL
+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL
+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7cA7!1Lj
9R8Hp=^O%1;E&8i=^k6JEd)+q8QU*m=%b5$H>Q;N91M?AB.mh,BllRQCcu?I?WC#K4q.iA+<VdL
+<VdL+<VdL+<Ve;E-#T44>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r
4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL
4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]%ATT&'DIal"BOPdk
AKYr#Ea`frFCfK64>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL
+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL
+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#
+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j:h4Q5
3(ZYS8kO,(8MrMDDf96$;g;qb6UY$lDFlg57Vksn:fC>(=Yru/ARoLs5A4jrAStjT;^+C7$6UH6
+<VdL+<VdL+<VdL+D#(G04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;
%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc
+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%S8=F<G+.@ruF'DIIR2
+E(_(ARfh'4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P
4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8
F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j8QfnB3(#Q78k!Q;FAm6k=F#%'3)2/#;G1IZ
Gtq497RC*/<+f64=);A"ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+D#XW04@$R$6UH6
+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL
+<VdL+?X^a@;[2tCghC+4X+Ai,!KsgF<G[:G]Y'BDKKe>ARoLs+EqO;A8cZS06;)@DE\L:+<VdL
+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@l>Mp%144#
+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An
%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC
3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ<CFr@[Eb&!88Q0R^;bT#Z6t&SRB4j(mE'[H3
E_oSU=@dIX6SU>f3))&;A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLB4Z0I04@$R$6UH6
+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL
+<VdL4EGIMDBNG*@<6KQ,%E;N5%eGK+E(_(ARfh'4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL
+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL
+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#
+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jB2qhi
9MA#Y6VpiEBP'P48SiKoBgQrGAhe'f<DmC=E`,qXD0Au_8p4&bARoLs5A4jrAStjT;^+C7$6UH6
+<VdL+<VdL+<VdL+D58-Ed0]"@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh
05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL
+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%eGK+CT)&+EqaE
A9/l6AT;j,Eb/c(FDhTq+<VdL+<VdL+<VdL+<Y6?ARfk)ANVVeE+*WJ%144#+<VdL+<VdL+<Wd"
E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL
4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL
+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*D
DeElt/n8g:04]!2F_t]-F>%/X0lo0Y6"Vfd>&J@m@m`Rq;FF5P1/1S>;cH82>%00h6t&PR9kdsS
=DD_504e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y<5DdmcM04@$R$6UH6+<VdL+<VdL
+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV
+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIM
DBNG*@<6KQ,%E;N5%e\M@UX'qEb/ioEb0,uATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6
+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL
+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL
+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/6p&AU.!Z
;b17^7RD6<G&D+sDHBeL0M5#A1GDLC7T<iCB66p>G"m7&CG070BllRQCcu?I?WC#K4q.iA+<VdL
+<VdL+<VdL+<Ve>Ec=,o@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc
+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%AVE@<?''@;]TuD/Ws!
ApGM3Ec6)>F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL
+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0f(XT@7rFr
;b1##@s2Tj<,,6.2`Z2*DJN?F1ML\c1J:>`1M:?3<H1TO04e[.F?aGT4_8M<<Dt)*%144#+<VdL
+<VdL+<VdL+<Y<=4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KXNF<G.*BlkJABl7I"G9D!=
G]Z&$F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS
$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL
+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6
+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS
@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/6XFD-:%EDdQ=]Fa>`7F&GG%Bhg7";f[.o2Jm#9@:VZ5
GZ/Hi8Td%/5qce[BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve?CiF9.4>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr\kBle60@<iu:BQ%p5+E(_(ARffk$6UH6+<VdL+<VdL+<Ve;ATM@%
BlJ0.Df0VY06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL
4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL
+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZN2,%UjEG&'(
CiVit;L2#<C1La>@ST4(Ak[#,FY.0</PJo63HIehAk=XeA8--MBP]hCDI6CB,!HGC+<VdL+<VdL
+<VdL+<VdLC2[WkB4X1Y@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<VdL+?X^a
@;[2tCghC+4X+Al,!I=u0fC^I4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%E>a+Cd,b
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\hB4W3(AftVu@ruF'DIIR2+E(_(ARfgE
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#
+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL
+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL
+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@
B5_^$Ch55/Df%.<De!p,ASuTCA1oZV3FmDRH#6_:EB./jCN394F'<!(<d.S"7Sn>/AiNFoCfPXu
;b:b&3-R#eA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLC2[WrASc<J04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL
+?X^a@;[2tCghC+4X+Ai,!KOOF)Yr(Gp%$CCh[cu+D>>&E$/b2EZdtM6k'JG+<VdL+<VdL+<VdL
+EqaEA90jdF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL
4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL
+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/5%8:Mj-J6u?Qj
E+s&]=BKKTAQ(L0<H<@[2+KZ&5tFCiFDtk`2g04O9eU'gBllRQCcu?I?WC#K4q.iA+<VdL+<VdL
+<VdL+<VeCB07hU4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL
+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\t@;BEs@;]TuCi<`m+D5_5F`9Gr
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6
+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL
+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL
+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88
Df99)AM.J2D(fF<@s)X"DKIOB0/5doBQ.<\Ecc5"1djcN20)>DF(]DX8P<tj3*9^;9J^?Y@8B[2
5t5NZ75&4_BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeCDe!F#E',d^4q.iA+<VdL+<VdL
+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<Vdh
FCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@k])jB6%p5E-!.?EZfFGBlmp-+CQC:DfTA2DfQtBATMr&$6UH6+<VdL+<VdL
+<Ve9ASc:&B6,2;D`f[oE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL
+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%
+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0l:NG
9K>'d6r%]5De3Z<91+#<E&0187Wq[>@mrq39lWi^DFH9u9PRX=04e[.F?aGT4_8M<<Dt)*%144#
+<VdL+<VdL+<VdL+<YN0CLoU]@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh
05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL
+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jB4YslEaa'$F!,"-
@ruF'DIIR2+EM%5BlJ084>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0
+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ
,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<
AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j@8]O/<+0i\9R8X83A"]:@8B`o
84PEe8pN-C1Ke.296j]4DdtRiBl@!)ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Dkq9
4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\nASu("@<?''Ci<`m+EM%5BlJ084>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j1-oDc>"2.Q:15hm6pYQG1,_^K1.YJ+
ASjqRA9]db=[YYMA4CfB?Y*@nARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Dtb7A3;MR
4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE
$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL
+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\jEb/[$AKYD(DIn#7A8,OqBl@ltEd9c#F)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad
+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,Rp
F$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL
+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2
D(fF<@s)X"DKIOB0/7TN6?-OV9i4P?E+(GG<G>N02bHIrATVR"6!A5E=F*;610@4H3*/F:;(lKk
BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeEDffW4E',d^4q.iA+<VdL+<VdL+<VdL+?V;u
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+
4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@k])jGAhM4F!,R<@<<W#Eb-A2Dfd+9DBNS4Dfp#?4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r
4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<Vdh
E$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL
+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@
B5D-3@rH3;A8bt#D.RU,04Z^j0k4!PH:;U>GB[Y99/f4.=*%.lH>\$p?Zp[=6te/f1Gs/j<DI"+
CNFDIARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Du9`04@$R$6UH6+<VdL+<VdL+<Vdh
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%E;N5%S8=F<GI4G9D!=F*&OG@rc:&F?D3tE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL
+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL
+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL
+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0fWiZEAfgC
9/g]D@VKU:<E+0X3&3cW8T&&oEBuuM>"2%t6?b^m12BI*04e[.F?aGT4_8M<<Dt)*%144#+<VdL
+<VdL+<VdL+<YQG4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQ
CghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\lA8--.DIn#7GAhM44>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<
AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jF%pLCAN*Y(Ao(7@ASt+KDer*9
0l^qe6:*OdF#SD*9kcV1CfWJi2eOs#ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+E(dQ
04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@kfea4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KpaASrW$Bk)7!Df0!(Bk;?J06;)@DE\L:+<VdL
+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.
@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg
@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT
+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<
De!p,ASuTCA1oZJ<AJ&t@S/sa2/Q5j<&dBk<&RcX:ieE^C2ZKt8pEsB<G5<U9kmdI=(<mpA8--M
BP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLE+*6lA3;MR4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ
%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj
0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg
@k])j@UWb^F`8I3DIal/@:O'qA8,OqBl@ltEbT*+4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL
+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3
@rH3;A8bt#D.RU,04Z^jD0SHj:.e#LH?;Vt;)D0e;.;ODDF\tD@7Xo`2,IC,;G((jDf86V:1?LB
ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+E2?`04@$R$6UH6+<VdL+<VdL+<Vdh06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%E;N5&bXd+CT.u+CfG1F)rIEAS,LoASu!h+EqaEA90jdF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#
+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL
+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:
+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7T_
>%),?GtCP$<cM/K@4cG06Y]tL:,Y^ZDKU2)A8Q3[6u=r,DacQB=YF>sBllRQCcu?I?WC#K4q.iA
+<VdL+<VdL+<VdL+<VeGF`]`!@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh
05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL
+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5'(gaEb-A3@VTIa
FE8R=DBNJ(@ruF'DIIR24>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0
+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS
%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j
:I?s=:0'_n;K,6<9N5\%2/m>6E&^L+G]72-1jXI,2d0`]B3Jb!5qQ_&ARoLs5A4jrAStjT;^+C7
$6UH6+<VdL+<VdL+<VdL+ED%+A3;MR4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL
+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL
+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]$AS5^uFCfJ8
A8,OqBl@ltEbT*+4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL
+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O
4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al
+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(L
BQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jG&1&Z8oermG[bkR<(B])G"?R_3,h\p
AnbCN95ZLc7!UXXEEQ:#2d^VZARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%7FC[Ke
@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g
%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#
+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5&t4UFDl22+C\bhCNXS=A8,OqBl@ltEbT*+4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<
AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jE_^1Q;F3<.=CcG-:JFSb9QWos
6ZGbC75-K3CJRJU@;/P\2gA8;0l0-/ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%:
D`f[]4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC
+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\sBleA=Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'
4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA
+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL
+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL
+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!
/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jGXY,":j6c%;GUq:3Gj%:=#an]3-@St7TiPCCJSVS0h$:U
AoVHT2/Pc8ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+ED%:Df0-24>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr]$ARf:hF<GL2C1UmsF!,[@FD,T8F:AR"+<VdL+<VdL+<VdL+D#e:
Cgh3iFD5Z2F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL
+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0i1GY:NoK>
:el1Z84@;s=#)He/M2*\6"_ckFuaYSAPGT^>!ZV1EGf5g04e[.F?aGT4_8M<<Dt)*%144#+<VdL
+<VdL+<VdL+<Y]A4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!L$iDBNe)@rcL/4>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<Vdh
FE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL
+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3
@rH3;A8bt#D.RU,04Z^j=&_+f@qe:d=A_sm:i]*NGrT\=;Kkl=Guc\";gL`3A2n<]6<[2ADJ`N0
ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+EDRG4>1,,%144#+<VdL+<VdL+<VdL4>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,Rp
F$1^W0Hr]$F`&=D@<H[1Ci<s3+EV19FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T
@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<
@s)X"DKIOB0/6.';-%B_<&/MdDaRDV6;^9fFZ+M'6ZupG94qFH5tkBUF[9,>@rlU03%niRBllRQ
Ccu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeLF(JlkGs!`g4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ
%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar
,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W
0Hr])DfTB0+Co2,ARfguGp$U*Ci!Zn+C]U=@1<Pd+<VdL+<VdL+<VdL+EqaEA3;MdE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd
@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL
4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:
04]!2F_t]-F>%/X0ht_<7Vaf*@6&%'CfE)`2D%UJ/TtY_3DE:):24B\Dg?JA1hB!c9ij>D04e[.
F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YfJATKse@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*
4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W
0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%E;N5&t4VF`M@BGAhM4+E_a:F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"
FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Aj0d8dj
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA
+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%E>^,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\C06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL4>1ecDe+,W%144#
+<Wd"FCAWpANgP1+<VdL4E)EQCghC+4X+Aj1a5*m$6UH6+<VdhF)YQ*+Cf4rF)sJg@k])j-6k6'
0KVBMF)YQ*4q.iA+<Vdh05s)a$6UHR04Jj1Gs2ZE4>1AiD/;BF$>OKiE+*d(F##IF67sa&De*fq
Ec#k?F"JsdA7]@]F_l.BA8,OqBl@ltEd8dH@<,dnATVL(F"Rn/:-pQB$;No?+B3#gF!,(/Ch4`'
F!,UHARlp*D]j+4F<D]JBOr;/A7]@]F_l.B+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQUFCAWp
AKW+0DBO%7AKYhuF*(u6+D,>(AM,*,BOu'(+CQB8DIn#7A8,OqBl@ltEd8dAF!+t5ART[lA.8l@
67sC&BOr;/E+*cqD.Rg#EcW?GBl5&8BOr;/D..L-ATAo*Bl%?'@<,p%F`V,)+EVNEF)Y]#BkDW5
+EV:.%15is/g,+AEa`frFCfK6+D,P4+CQC3@<-I(@s)TrEZen,@ruF'DIIR2/g+,,AKW+=ATD6&
-tI:<ATT@D@ps6a$;No?+C\n)+<YfJARlo+FDi9E+Dl%-BkDW5+E1b0@;TRtATAn9F(KH8Bl7R)
+<Ve@DBL&EBl7HqG%kK0@;HA[:-pQUA8,OqBl@ltEbT*+/g)92@<6O%EZcK:Bl%?'E+*cqD.Rg#
EcW@5@;[3+DJXS@@V$ZlBOPdkARlomGmt*U67sBlA8-."DJ()6BPDN1Anc'm+CT.u+ED%'Eb/[$
Bl7Q+FD,5.D..L-ATAo*Bl%?5%15is/e&._67sB[BOr<'@<6O%EZet.Ch4`!@;[2sAKZ#)@rc-h
FCeu*GA2/4+EV:.+CehrCcW"4:-pQB$;No?+CfG'@<?'t@<6Nt@;9^k?Q_s85uU`O;I<jIDe*2a
$;No?%15is/g+4];GKeY7lhc$Cht59BOr;/E+*cqD.Rg#EcW@5F`MM6DKK]?+Dbb5FCeu*@<,p%
Eb065Bl[cq+C]U*$;No?+EV:.+A,Et+EMgLFCf;A+A$/fH#IgJEb0*+G%De)DL!@CAfu2/ASiP^
:IH=LBl%T.@rc"!BJ(E1DflKr:-pQU@ps6t+ELt'AScW7@:Wmk@:Wn_FD5Z2@;I'*@<,dnATVL(
F!+q7F<D]ODfm0F@ps7mDfd+C@:j(eGmt*U67sC$ASl@/AKYK*EcP`/F<GO2Ea`frFCfK6/e&-s
$;Efb<(0\]5uLEU+?_b.0H`D!0F\?u$;No?+B3#c+D,P4D..N/De:,6BPDN1E+*cqD.Rg#EZet.
Ch4`'F#ja;:-pQU+<VdLC2RHsAKX&W.!0`RALSa4ATM@%BlJ0.Df-[Z+Eh10F_)!h:-pQU%15is
/g)8Z+<YE:@;TQuBlbD*+Eh10Bk/>Y+DtV)AISuA67sB'+<VdTFEqh:.3N/4F(96)E-,f4DBNJ.
@s)X"DKKqBFD,5.E+*cqD.Rg#EZcqVFEqh:+DGm>Eb065Bl[cq%15is/g)8Z+<VdL+E).6Gp"Lc
Bl8$(B4Z*4+DGm>@s)g4ASuU+Gp$[CARfk)ARlp%FD,6++EVmJATJu<Bl%Sp$;No?+<VdL+<VdL
@V$[$@<6L$A0><%+Cf(nEa`I"ATAo0BleB;+=M;BAKYN&FCAWpALT5@$;No?+<VdL+Eh10F_)\0
F!+n/+D#e/@s)m%@VfTu8g%\iE,oN2F(oQ1+EV:*F<GOCDe+!#ATJu&+Eh10F_)!h+<V+#:fUIa
5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,OGDfTE"+DG^9Df0,/Ci=62+E1b1F!)SR0eb_84>JTI
3%5sm+<VdL4!6730F\@Z78u`B6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0+ED%8EbT*.ARlotDBNk8
AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg+>Pf.%15Hu:g$7R6W?iZ+?L\o.qrmCAS5Rp.3N,=
D/aE2ASuU2+Cf>/Bk:ftBl5&3DIjr,Df9S;E+*g/+<W'e4F'%E1b^@$+<W`g0eb9j$:Ilg:e!`<
<)6C74!5q%Bl8$(B4Z*4+E(_(ARfh'+CoV3E+NQ&Bl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e
+<VdL+?L]'0F\@W:IA,V78?f`8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#
F_t]-F<G[:G]Y&N-o*J=Gs!i>2(9Y0+>tq`$:.TX8P(m!+<VdL4!5q%Bl8$(B4Z*4+EqL1DET]s
F`V+:@<5pmBfIsmBl5&(F_u)=+=JodDfQsT.3K`U+<VdL+<VdL+?L]"%13OO:-pQU6#Lrj@:Wn[
A0>i"Ea`frFCfK6+CT;%+EMXCEb/c(Bl5&8BOr<'@<6O%EZet.Ch4`5BOu&j$;No?+CfG'@<?'k
+CT.u+Co2-FE2))F`_2*+EVNE8l%htA8-'q@ruX0Gp%$7C1UmsF"SRX%13OO:-pQU=$]_Z8PVc:
+EqL1DBNJ$Anc-sDJ((a+D#e:Eb0<5Bl@m1+C\n)@psChAp%o4@:F.tF<G[=AKX&W@q]:k@:OCj
EZbeu:-pQUFD,5.8l%ht@rGmh+=Lc>FCAWpALSaDBOQ!*E+*d.ATJu9BPDN1F*)G:DJ()+F!,LG
A8,mlDKK<-GqKO5:-pQU<_64]<)6C74!5q]BOPpi@ru:&.3N2HE,oN2F(oQ1+D#e/@s)m)A0>?,
+Co2,ARfh#Ed8dG@VTIaF<Ga@F(o`7EZcJd+CoM2E+E['+>=63%15is/g*MW:g$[f7n?T%4!5q]
BOPpi@ru:&.3L\p6#:?[EbT0"FE8RFATMF'G%G1n$;No?+AH!85uL!C78u]R+?L\o.qrmCAS5Rp
.3N_GAKYE!F*D29+?L]&1(=R>%16igA8l'k?W:-,1,W$EBlbD-Bl[cpFDl2F+DGm>Eb0<'Ecu#)
+D,P4+DPh*/oY?5%13OOC2[W8E+EQ'BlbD7Dfd+4Dg-)8Ddd0fA0?)1FD)e=BOr;rDfTD38l%ht
@:WneDD!&2D]fJrAStpcCh4`*De!3l+=LuCA8#OjE%)o+6q/;>ART+`DJ()&Dg-)8Ddd0!C2[W8
E+EQ'Ao_g,3XlE*$>=O'E&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0F\?u$=Rg_+Cf>/
Gp$gC+EVNEFD,B0+Co2,ARfh#Ed98H$>OKiE,Tf>1,2Nj/h1USA8lI.F<GWV/KdY]6m-GeF*)AA
De!@"F)Q(AF(96)E-*]T+:SZQ67r]S:-pQU;flGiASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/
ARfk)ARlolAoqU)+A,Et+DGm>Ci<`mARmD&$4R>;67sBpDKBr@AKZ2.+CT;%+DG^9@UX=h+:SZf
De!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF*(i2F<G=:A.8l\De*d(+>=63
%15is/g+tK@:UKqDe*s.DesJ($=e!aF`MM6DKI!K@UX=h-OgD:+Z_;"4DJeFF*VhKASlBpFD)dE
C2[WoG]\![C2[X)Df9H5/no'A-OgCl$;No?+EVaHDBNG-D/Ej%F<GU8FCf?3Bl@l3Df-!k-oiG3
1bgF%0b"J)De*g-AT0CZ:-pQ_C2[X%Eb024F"Jsd8l%htE,oN/Ec5H!F)u8?+EM%5BlJ/H%15is
/e&._67sBZFCB9&D.RU,F!,17+EV:2F!,O6EbTK7+CT;%+D#e/@s)m)A0>>mAoD^$+A,Et+DGm>
Ci<`mARmD&$4R>;67sC&Df?h8AThX$+D#S6DfQtBEa`o0AoD]4@rHC!+A,Et+EqaEA9/k&$>OKi
F(ScnC2[Wi+?_b.0HsjH4!5nC:IH=(=]89g9cunk8PE,^762Q-@<6N58g%\cEc5t@/Nt:),$uHD
+BplL0f't60esk!-R)n?>9I2\$4R>WDe*p7F*(u1E+*j%?[?'B3\qm>+>=63%15is/h1USA93$;
FCf<.@<?0*FtG9gE+*j%+E(j78l%htF*VhKASiPA+>4jZATDX%DIIWuA1e;u:-pQB$;No?+AQis
ANCrW@;KXg+D,P4+A*b7/hf"&@;]Tu@:F.uAM+E!:-pQB$;No?+Dl%7@:VDA+DPh*F*VhKASlBp
FD)e,Cf"_XCh4%_:-pQB$;No?+<VeADe*p7F*(u1E+*j%+=Co@@<6O%E[M;'%15is/g+\9Anc-o
A0=JeF*VhKASiQ+De!3tBl@ku$7KY.@<?0*-[oK7A8c@,05"j6ATD3q05>E90./2"Gp!P'.1HUn
$=e!aCghC++=CT4De(4)$;+#Y;cH1`4ZX^#De*p7F*(u1E+*j%+=Co@@<6O%E[MtP+<VdL+<Ve%
67sBkAS,@nCige:@<6O%EZcb[/no'4.3N5:Ch4%_8l%iO;GTbF3Zr0UA93$;FCf<.@<?0*-YdR1
E,ol/Bl%?5Bkh]:+<XEG/g+\9AmoguF<GOCDe<^"AKZ&(EbTK7%16igA8lR(D)*tB5seOB<(o_D
3ZoeB:IH<R1asPUDIal3BOr;Y+Ad)sC1Ums+AH9^@:s.l-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^G
BPnq\/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue+DbIq
+EM47GB4m?Dg*<r:IH=6DIal3BOr;Y+Ad)sC1Ums+AH9^@:s.l+Ceht+C\n)F`V,)+EVO7ATVTs
EZe(bGp"jr0K:Eh$;<`P7ScBO;a!/a0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38l%ht@;]TuFD,5.8g$rN
De`inF<F:dDII0hEX`@J:IH=6DIal3BOr;Y+E2@>C1Ums+DkP)@:s.l+CT;%+EVgG+Cf>,E,96*
ASuTuEd8dKDe=*8@<,p%FDl)6F!,R<@<<W%@;[2sAKYPmF(oH9+Cf>,@VK^kA0>r3+CT)&+EV:.
+D,%lBl%L*Bk;?.De:,$DffY8F*VhKASlK2@ps6t@V$ZjE,]W-ARlp*D]hXpE,ol0Ea`g%Bl7Q9
+B3#c+A,Et+EMgLFCf;3BlnE-Ch=f6@<3Q1@<-I+Gp$X/G%GK.E+NQ&F`V87B-;8<@qZunDBNA,
E,ol*@q[J($4R>ABPDN1Cggcq@<6L4D.RcL%13OO-o!.n<+ohcC2[X(Dfp)1AKYDlA8c?.BOPs)
@V'+g+DG_7FCB!%ARmD&$4R=j1+=>3+FZpY6r6cW8ju*H+D,P.A7]d(E,TH.FD5W*+EVNE-u*[2
A7]p5-Z^DNDf9_?A8-'q@ruX0Gp$d/F!+q'ASrW#Df00$B6A6+A1e;u%14L>.3Lo!IS*C(<(0_b
+D,P.A7]d(E,TH.FD5W*+EVNE@3BZ'F*&O8Bl[cpFDl2F+D>2)+C\nnDBNG-DJ!TqF`M&(/e&-s
$<1pdBl8!6@;Ka&FD,5.C2[X(Dfp)1AKYDlA8c?.F`V+:FD,5.8g$r=@r#LcAKX]UDII0hEZee.
A0>u-ASrW2F`&=DBOr<&@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;D\9gME@+B)9<
73G`/<?P"3<^e,s:.-4&78?-C73GQ#73G9"5suh`8OHHK:JO2R8OZQ#8PUC-84=Xp5uU`*;cH1^
+AYHL<(KSZ+A>'f/e&-s$<;.Y+A+#&+Cf>-Anbn#Eb-A8Df9G7FDi:CATT&D8l%iO;GTnR6W>1:
DIal=8l%iS78m/<%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Ad)i
+CT.u+AcutF<FD#De!@"F)Q(A;e'i^E--.1$<1\M+A*bqEc5](@rri1@;]LdATAo%Ci"$6F!,UH
ATDi7FDi:4AS,XoAKYE!A0>H.ARfk)AKYE%@VKq)@<-W98g&(nAKYE!A0>i0F*&ODEc5H!F)u8?
+EM%5BlJ08/g)9<BOu'(@3BN0De`inF<G:=+<k9;Bl%l8+EV:.+E2@4E,ol,ATMp2EZfF5EbTK7
+EDUBF!,(/EcZ=R+D,P.Ci=N/A0>?,+EV:.+Du+<D..6'@WcC$A0>i3De!@"F"AGGDes6.G@b;-
@X0)<BOr<*Df^"CE,ol,ATMp2E\8IW<+ohcE,oM4@;]TuE,Tf>+E2@>@qB_&DfQtA@rc:&FE8R5
Eb-A8BOr<%AU/>>FDi:EF(oN)+A,Et+EqOABPD?,FD,5.8g&(nDe`inF<GF/DII0hE\7e..1HVZ
67sC&BOr<*Eb-A%DIal/Df^"CE,ol,ATMp2EcW@3Eb-A(AS,XoARlotDBN@1E,ol3ARfg0F!)qb
BkhT0Anc'm/e&-s$;No?+=LuCA8lR-C1Ums/no'>.3NSMAKYE!A0>i0F*&ODEc5H!F)u8?F!(o!
%15is/g*tg77(!G9LM?A9LV**+=DV1:IJ#W:J+&C<%i<&EbTK705>E9E,oN/E,o\GBkh]:%13OO
:-pQU:et"h6<-TN6q0aA76N[S-[nZ`6r6cW8ju*H06:WDBlJ/IC2[X%Df^#>Eb[4@C3(a3$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBM_oASrV_:IH=HDfp)1AKYMt@ruF'DIIR"ATJ:f<,WmnCi"68FE1f3AKXT@
6mm$uF`V+:GA2/4+EV:.+E2@>C1Ums+DkP)@:s.l+EqB>GA1l0+E_a:+A,Et-Z^DKGA\OEDfp)1
AKYMt@ruF'DIIR"ATKIH%13OO<+oue+EMX9E$/S1F*2>2F!,R<AKY`+A92[3EarZ'@:WneDBNV$
F!+q'ASrW$Dg-#9@:Wq[+EqOABHVD1AKXfX@r#LcAKX]UDII0hEZee.A0>u-AKXT@6m-PhF`Lu'
+Co1rFD5Z2@<-'nF!)lGDe*BiFt"sb-u*[2.3N&:A0<:CFD5Q4.3N;4G%De*AS#a%F(KH9E%W7U
;KZk"FD,5.Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F!;`@Afu2/ATME*A8,OqBl@lt
EbT*++CT;%+Du+>+EM+9F`8rB$7QDk:-pQUDfB9*+E).6Gp#^T6m-PhF`Lu'+Co1rFD5Z2@<-'n
F!(o!De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgCl$;No?+F.mJ+EM47F_kS2BOQ'q
+EV:.+EV:;ARuuV:IH=HDfp)1AKYMt@ruF'DIIR"ATJu4DBO%7AKYr#FD)*jA8,S'+>=63%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@BgR@r!398l%iO;GTnR6W>1I@<?/l$:8<9DfTD3AU&<;@:OCnDJ()6BOr;7
C2[X%Ec5](@rs>;C2bUEAnc'm+D,Y4D'3q6AKXT@6m-PhF`Lu'+Co1rFD5Z2@<-'nF!,=.CLnW0
F`M%9."4ca6r6cW8ju*H.3NSJBl8$6+EVNE-u*[2A7]p5-Z^D8F(96)E-*45Bl[cpFDl2F/e&.:
%15is/g*_t+EV:.F(HJ5@<?1(+CoC5DJsV>D..NrBHVG=AKXSmF!+t2DJ!TqF`Lo4Bl@l3FDl)6
+EVNEF(KG&$;No?+FZpY6r6cW8ju*H+EVNEC2[WnATfGB+C&ttEbTK7+Co2,ARfh#Ed8*$%15is
/g)9UEc5](@rrh9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLC2[WnATf2$F(96)E-*33$7L"7
Ci=N/EZf+9@<?0*-[nZ`6r6cW8ju*H>]XCqBlJ0!-Rg/i3ZrN_Ci=N/EZcPY-W<B1?RIBQ4*s#8
/jrN%<(LA';cI+28l%in@VR>C-XS51$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFCcRkEc5](@rrhf
@;]LdATAn_Bl%@%%16'JAKXSf:i^JhARfg)9jqpJB4Z*+F*)>@ATJu&Cht55Ec5](@rri6ASbds
ARlotDJ!g-D..O#Df-\3DBN@1.P>FME$0+?De`inF<G10Ch54A+Ad)sC1Ums+D,>(ATJu&Eb-A)
F)to1FD50"Cj@-q+EM%5BlJ08+EqOABHU_+A8,XfATD@"F<G10Ch4`#G][M7F(oQ1/g)99BOr;7
C2[X%Ec5](@rs>;C2bUEAnc'm+DGm>F*)>@ARlotDBO%7AKXT@6m-PhF`Lu'+Co1rFD5Z2@<-'n
F"Rn/.1HVZ67sC$F`&=1+A,Et+EV%7FDku6B6bVAATMr9F(96)E-*4ED]iV9FE1f"F<GI4@qB^i
Ed8dHEc5](@rri*Bl%@%/e&-s$?C61+=D5AFEMP0C2[X%Ec5](@rs(@+AP6U+ED%7F_l/@+EM47
F_kS2@;Ka&0dh#O$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM\_G%kStFCcS:D]jL$:IJ#W:J+&C<*XKSEbTK7
+Co2,ARfh#Ed8*$:N0l_+EV:.+Ad)sC1Ums+AH9^@:s.l/0Jh=G%kStFCcS:D]gHW8l%iO;GTnR
6W@<3@rc:&F=A>@DIal.E+No0-u*[2E,ol3ARfg7BkhT9%14Nn$;No?+DtV2BkLjrAKZ)5%16ih
@<?0*-[nZ`6r6cW8ju*H>]XCqBlJ/A%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[aF_PZ&+D,b4Cj@.5Df'?&
DKKH#+A,Et%15^'6m-PhF`Lu'+DGm>F*)>@ARlotDBNJ(@ruF'DIIR2+Cno&@:EYdATKIH+Ad)i
F)rIGBOr;_Ec5](@rrhf@;]LdATAn;6?R!YA0N.*F`__DDBO%>+D58'ATD4$AKZ&4F`Lu'+EM%5
BlJ08/e&.:%15is/g,+RATMo8FD,5.:i^JhARfg)9jqpJB4Z*+,!pEdCh+_4@Wcd7Df-!k%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@:*eGB7=<8l%htF)Q2A@q?)V6"Y4MEZeh6Bl%<oDJ()6BOr<*Ec5](@rri=
Dfm14@;[32Bk;K28l%htF)Q2A@q?d$DBO%7AKYr4De`inF<GF/DII0hE[PoN,#`E&EarZ)+EV%$
/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!8l%htF)Q2A@q?)V:i^,gF(oN)+EV:.+Ad)sC1Ums
+AH9^@:s.l-Z^CS9Q+?M+s:?;FEDG=+Dbt)A9/l%+D,b4Cj@.5Df'?&DKKH#+EMIDEarZ'Bl8$2
+CSc%Bm+&1@r,RpF(KDF+<XWsBlbD2F!,UHAS-($+D,P4+Co%mF_>?$DJ()#DIal$G]7J;EbTE(
+A,Et+Cf>#AM+E!.1HVZ67sC"Eb0<5+EV:.+Ad)sC1Ums+AH9^@:s.l+<jKt@:UPk$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMi"DBM8SF(o,,8l%htFCfN8Et&IBDBNM8@;Tt"AKZ)+F*&OG@rc:&F<G7*F!+q'
ASrW'ASu("@<?'k+D,Y4D'2GH6m,oUA0>o(An?!oDI[6g/g)9'AS,k$AKZ#9DJj0+B-;;0BlbD<
@rc:&F<G(6ART[l+EMI<AKZ)+F*&O8Bk)7!Df0!(Bk;?<+<V+#%16'GF*&O8Bk)7!Df0!(Gp$U;
ART[pDf-\<AT;j,Eb0;7@3B&uDJ!TqF`M&(+FZpY6rZTR<$5^cEb/a&DfU+U%14Nn$;No?+CfG'
@<?''FCfN8+Co1rFD5Z2@<-'nF!*%WD..=-+A,Et+EV19F<GX7EbTK7F!,L7An?!*FDi:DBOu6r
+Co1rFD5Z2@<-W9DIIBnEt&IsFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'D@HqPBPDN1F*(u4+EDUBF!,R<AKYr4De`inF<G[:F*&OG@rc:&F=n[Y<+oi`AKYE%AKYhu
DL!@CFD,6++EV19F<GX7EbTK7F!,OGDfTE"+DG^9FD,5.8l%htA7]pqCi=90ASuT4A8,OqBl@lt
EbT*+/g)99BOu6r+EM%5BlJ08+E2@>G%kJu+Du==ATD^3F!,%=@;Tt"ATJu4Aftc*G9D!G+E_a:
+CT.u+CS`%F(HId:IH=LDfTB0/e&.:%15is/g*u2ATMo8FD,5.:i^JhARfg)9jqpJB4Z*2F!)Z+
ATMr;+C]J8FDl%L%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bDf0'$F`V88D@HqPBPDN1CggcqF(fK9ARlos
Dg*=GD]j1DAKXT@6m-\fFD)e=BOr;Y+Ad)sC1Ums+AH9^@:s.l/e&-s$;,5MDBM>"+@9LPATA4e
:2b;eD.7's+>PW)2[p+'@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKiE,ol/Bl%?90ht%f.V`m4
E,ol/Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et
+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("
@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#g
F!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i
:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.
+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5
F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/f
Df0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq
@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C
67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E
8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kG
FCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*
$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%
CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=
3]&Q6>9GX0$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./
+A,Et+DG_7FCB&sAISuWE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4^u
$=e!aCghC++=Cl<De(4)$4R>;67sBmDes6.GA1r-+CT;%+D>2$A9f:GBkhQs.3NGF@ps1b+EM47
Ecbf6FE9JP$4R>;67sC"Ec5](@rri7BQ%p5@s)m7+>"^YF(HJ*G]7J5@qg$-%15is/g+\9Anc.)
Bl@m1+EMHDBlk_D+D"u&Gp%3I+ED%7ATT&:BOr<!Ec6)>06;8MFCbmg@:q_a+>Y-$+=CoBA7m#n
A7T=nE$0ER%16Nb4ZX]A+?CVm-u*[2F#u0,+CSekB6%r6Gpa%.A7n%d+>Y-$+=CoBA7m#qASc""
E$0ER%16We4ZX]A+?CVm-u*[2F#u0,+Co&"B6%r6Gpa%.+<Vd9$;No?+ED%*ATD@"@qB0nB6%p5
E$0@CEb'56DJsV>Bl5&+Ec6)>%16ut4ZX]A+?CVm-t-q.Eb/j(+<Z(b+D5R@+>#2gB5Tjb+D5_6
+DPh*B.",q+<Vd9$;No?+EqaEA9/l-DBNS4Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CVmGp%6N
ARo7q+FPjbB6%r6C2[Wq-OgD*+<V+#:-pQUB4YslEaa'$+=84P@<Q3)Ci<`m+EM%5BlJ/'$?KiC
3Zp4$3ZoeeCi^_6De*K'>9J2=%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5
E-!.9DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%13OO:-pQUEcl7BFCB<6
Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-
1+%$`F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE
%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp"AGAhM4Et&IiB0A9u><3m?CiF9.
+BplLI4cXTEc;Hp%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%
+D,Y4D'3>,A7[e2$;No?+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<Y?<+>P&^:-pQUB6%p5E,uHq
BQ?6s+>GYp3Zoeq+D>S1DJUGD/g,E^Eb0E4+=ANa-QlV9Gpa%.%15is/g,4LDJ*cs+Dbb0AKYQ/
E,8s#@<?4%DBNP0EZf7<DKg#>A9/1e:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r
%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp7%3ZoduGUtg'+E2IF
+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,]MA8-+(+F,=D$4R>;67sC$AS5RlATD4$AKYr7F<G+.
@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$-R`j`/orHa,CUae/itb6
+u(3]4YAE2B5DKqF!a(g4YD.8Eb0E4-RU8h+Bot6-OgCl$;No?+D>2$A9f;-C`m8,@j#GrCiEs+
Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in
@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>
@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%
ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g+_9BlkJ-
Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g+_M
@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1r
FD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOC
De`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67
B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!hD(:-pQU0d(LR+=D,K
C2.Zt-QlV9F)>i<FDuAE+E(d54$"a(De*BiFs(O<A0?#:Bl%i<%13OO:-pQU@s)g4ASuT4F*(i2
F<G^F%15is/g,4PDfp/@F`\aEA0<rp-Z+'=@q-X(FD5Q4-OgCl$=e!aF`MM6DKI!K@UX=h-OgDm
DeX*1ATDl8-Y[=6A1%fnC2[X(Dfp)1ATMF)F`9)j:-pQ_C2[X(Dfp)1ATMF)F`8HG+EK+d+<Y07
ART[lF!)T6DIak4+Dbt)A9/k9+A,Et+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.Ao_g,
+A,Et+CoV3E-!W@$;No?%15is/g+,,BlbC>+EM%5BlJ/:+<Y07ART[lF!)SJ@;]Tu+Dbt)A9/k9
+EV:.+<X9P6m*TpA7]pqCi=90ASuT!$;No?+Co1rFD5Z2@<-'nF!)lGDe*BiFt=aYC2[W6+E_d?
Ci_$X+<XX%+EDUB+EV:2F!)TH@rc:&F<D]JBOqV[:-pQUAoDL%Dg,o5B-;&6F*&O<DerrF%15is
/e&._67sC(ATD6gFD5SQ%15is/e&._67sB7.3M5*2D-\.0/kL;GT^jGF*&O6AKY])F*(i,Ch7-"
Df-\!Bl7I"GB4mFEZe%iDKU1V%15is/e&._67sB8.3MT'AKXT@6m,oKA8c?.D09oA+C\n)Bl8!6
@;KakA1f!)F(HId5tiDCD]ib3F*(i,C^g_H67sB'+<Y<.DImisCbKOAA.8l@67r]S:-pQU1+=>F
BOr;Y:IJ,W<Dl1Q+CSekDf-\7F`VXI@V$ZrDKBo.Ci!Zn/g+/8AKXT29H\Fq+DG_7FCB!%%15is
/g)8Z+D58'ATD3q05>E9F)Q2A@q?)V:-pQB$;No?+>YGh<+ohc8k)BG78k=;A7TUr+Dl7BF<G%(
+DG_7FCB!%ARmD9<HD^o8jQ,nFDi:9DKBo.ChsOf:-pQU+<Ve;@<>p2C1_0rATJ:f:-pQB$;No?
+>bMi<+ohc>"MO57S-9B;]oLZA8c?.D09oA+C\n)Bl8!6@;KakA1f!)F(HId5tiDCD]ib3F*(i,
C^g_H67sB'+<Y*5@kW.BE"*.L67r]S:-pQU+<VdL+BLj,:.\2N3ZrNXAKYE%@kW.BE$/S"A8c?.
@s)g4ASuU+Gp"Li0k=j*0f^[*Df0B:+EqaECNBpl:-pQU+<VdL+E)-?1GWERF<GXMF*(u1F"SS6
ARuu`BOr;Y:IH=%@:s-o@<=O>$;No?%15is/g)8Z+<Ve?FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(g!EAM%Y8A1_b/B4W_*$;No?%15is/g)8Z+<VdrDfQt7DKBo?F^oN-Df0V=Df-\6Ddd0j
DJ()6BOu6r+Co1rFD5Z2@<-'nEt&IO67sB'+<VdLGA2/4Dfp.EF`V87B-;;0BlbD<@rc:&F=n"0
:-pQU+<Vd9$;No?+>kSj<+ohcA8-'q@ruX0Gp$TX>\\1f>\Z2O0jGhLGA1qD+E)9C05,9@AM8BU
85DrKI4o>RA1q[V0JP4'-u<U8Fa,>E$;No?+<VdLD09oA+C\n)ASlC.GqKO5:-pQB$;No?+>tYk
:2_7I:IH=9Bk)7!Df0!(Bk;?.GA2/4+DtV)ATJtBC2[WnATfUIC2[W6+E_d?Ci_$JAU%p1F=n"0
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emNRGqq2c$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>GT]ARdGT+CSekARlp$DffP5@:F.tF<G"4@kW.BE$/b$Bl%p4AKYo/+>u&!@VKp,
F*VhKASlJt$4R>_AT;j,Eb-@@Anc'mF!,R5F))n=AS5S!+Co2,-OgCl$=e!aF`MM6DKI!K@UX=h
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
Bk)5o$6UI4D/XQ=E-67F-VSGeA8,po3Zoe$A8,Oq%144#:-pQU=$]_Z8PVc:+ED%4Cgggb+EqOA
BHV/#DKTB(+E_RJBlJ$*DJ'Cc+<XEG/g+kG+Cei$AKYo'+=MPVART*u+D,%rCisc0+:SZ#+CoV3
E+EC!4Y@k'Eb/Zi+=Lc7@rs7L/no'A-Rh,lDe+0.E"*-s+=M>M85E/`+CoV3E+EC!.3NhTBlmo/
FDYu-F_u(,$6UHd67sBpDKBr@AKYMt@ruF'DIIR2+E1b2BHV56A7]cj$6UI0A0?7P-pB\&Bk)6l
Bl7HmGU[tlA8,OqF!+[01E^UH+=ANG$6UHd67sBsDdd0!A9Da.+EM%5BlJ/'$6UHF+Z_;"4EPFZ
A9Da.%144#:-pQUBl8!7Eb-A;AKZ#)D..-r+DG^9GAhM;Bl7Q+Ci<flCh4%_+<Y04@s)g4ASuT4
FDYu5De!-?5s]U5@<6*B3B:FU$6UHd67sC$AS5RlATD4$AKYK'Df]tBEb/ioEb0,uATJ:f+<YcC
E,oN%F$2,u0Hb"EDdmc74s58++ED%:D]gDT%144#F)>i<FDuAE+=BNsDf]tBEb/ioEb0,uATJu,
ASu("@<?'k3Zoe$A8,Oq%16ZaA1e;u%17/nDfp/@F`\`R;cQ1P78m,G+ED%+BleB-Eb/c(8l%ht
A8,OqBl@ltEbT*+-QlV91E^UH+=ANG$?L'&F`_SFF<EC_De't<-OgD3%13OOF(KH9E,'<%F)Q2A
@q?c:%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&Ch[d0
G]%GAATM3X=B%%59PJBeGT]q(ARfFdBk&8\DffQ3+D,P4+A,Et+>>E./i"Ot9jr;i1,(F;.1HUn
$<1\QF!,1<+EV:.+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX6=jbIEb-A9
F(oN)%15^'6m-Dc+Dbb0Fa,$G@:NtbDIml3E,9)oF(HJ7ART*lFD,6,AKYl/FCfMG%13OO0e"5;
:IH=HDfp)1AKYK$A7ZltF!,"-F*)G:@Wcd(A0>T(+EV:.+A,Et;bpCk6U`,+A7TUr/g*`'F*(i,
C`mh5AKVEh8l%iR:K::[73H#LA8c?.@;]TuEcl7BFD,5.F(96)E-+,M$4R=b+F[a0A8c@,05"j6
ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>F!(o!%16'JBlbD<@rc:&F<G:8F*(i,Ci^_@
BOr;Y:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.F`V87B-;&:+ED%'Df'?&DId<h+E1b2BHVA<
Eckl6F`M%G%15C5FCfJ8Ecl8;Bl7Q+-u*[2F)Q2A@qB^mFEMOTBkh]<+F.mJ+EM47F_kS2F(Jo*
A8-'q@ruX0Bk;?.Ch[Zr3ZoguC2[d'-Qm,E+DlBH,Y1^*74AZQ%144#05,9@AM7e:BPoJ<De(M9
2_Zs>C2[WnATeLi+<W=NDf'&=C2[d'05>E905<F"0e[9[A.8kg+>7DHD.PA8DeO#AC2[W9C,[h$
06MANCi^$m+<V+#<,Wn&Bk;K2G%G]'F!,")F(96)@V''mBl5&*Des6.GA1r-+DGq/D0$hABOu6r
+Co1rFD5Z2@<-'nF!,=BF*&O6AKYE)@;0Od@VfU.%13OO1+=><:IH=L@<3Q0EbT0#DII?tGp$X/
G%GK.E+NQ&Df-\!Bl7I"GB5AZ<+ohcE,Tc=+EVNE9PJBeGT_3=Et&IeDf0,/Df-\++>Ybq@VKp,
<FU)gFEJ]\0eP/)+EMgLFCf;A+B3#c+E).6Gp#dpDKU1HCh[@!@<-W9@ps1i%16r\A7ZlmGp#^T
6m-DX@s)g5+DG^9FD,5.-td[:A901BG%G]'/g(T1%144#:-pQUFDi:FBk;K2-td[:A901B-u!R?
FCB!%+A,Et;bpCk6U`,3FCf;30e!P=+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$6UI%Ble594$"a%F_PB--OgCl$7KP0Bk296+EqaECNCV1Bl7K)Df-[R1*C%?F<FRmF`);D+A?Ke
Fa,$G@:NtbDImlA+A$YtD..]4GAhM;+E)-?2DcOcBlkI,$;>/OFa,$;F!,[<Cht^H+B3#c+ED%1
@;0UnDJ()*Df^"CA7]^kDId<r@qfLq+Co&(Bm+&1Ao_g,+EM4-Cht5(Df'?"DIdf@+:SZM:IH=B
@;BFq+Eh=:Gp$p;D/"*'A0?#9AKYo'+A?KeFa,$MBOu!r+Cf>,D..<mF"SS6BOu!r+Cf>,D..<m
F!+n3AKVEh@ps1iARlp&EbTB!EbT?8+EVNED/XT//0JtEDIIBn+CT.u+Cf>/Gp$^5Ch7Z?+B3#c
Gp%0ADfol,+EqaECERP5+:SZdDL!@GFE1f(DBNk0+A?KeFa,$IEZeA"Bm;6Q88i]`G%G\F+A,Et
+D>2)+E).6Gp$R-ASrW4ATMs)A0>f.+>Ybq@VKp,<FU)gFEJ`9$4R=u.3M5Y6m,u[ART[lF!,.7
F*&O:Bl%@%+CT.u+Co2,ARfh#EbT*++CT.u+CT>4F_t]2+DGp?BOPs)FD,5.DIm<hF)tc1Gmt+$
BkM+$F!,RC+ED%%A1SjIEbTW,+CT.u+Dl%?AKZ).ATME*Anc'mF"SS'F`M26B-:_rG%GK.E,B0(
F<F-tE-67F@;Ka&D0ZQt8l%htA8,OqBl@ltEbT*++DG^9D0[6L85DrK+=JmVDf'&=C2[d'.3N/8
Eb/a&DfU+U%13OO+<XEG/g,7S+EhI1G9D'?Eaj)4FD,*)+DkP)BlJ32@<?''BQ%s6+D,>(ATJtB
Bl8!6@;Ka&8l%iR:K::[73H;dASiPE.1HV,+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5
-RT?1+<Y3/F)W6`3[\rZDIIBnAnc'mF!+t2E-Z&0Ch7Z8%13OO1asP>:IH=GAT;j,Eb0;7Ec5l<
ARlooBk)7!Df0!(Gp%'7FD,_H+DEH>/hA,jDfp(CE+*j%F!,=BF*&O6AS5^p+EqOABHU_+F)59+
BHSr\%13OO2(9Y?:IH=JF(KD88ge[&@rH6sBkMR/ARlp-ARZckEc6/CATAo%DIal/A7cs)ART+\
E\8J/@;BEsF*2M7+F.mJ%16cWG%De)+C]A0GB7>9+CT.u+ED%%A7]d(F(KH9E%W7U%13OO8S0)j
Dfm19@<Q3)DJsV>@rH6sBkMR/ARlol+A*c#ARZckEc6/CATAnc:IH=LBl%T.@<?U&D/aS>FDi:E
F(HJ(BQA$.Bm"8E@WHC2F(KA$$?U2/@WHC2F(HJ4DJX$)AKYYtCiD!L8S0)jDfm15D]iq9F<G7*
G%Dd`BQA$.AKY])F*(i,Ch7-"-u*[2BOu"!.3NhKChsOfDJsV>GAhM;/e&.1+<V+#+<Ve%67sC!
A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`I:-pQUEb065Bl[cq+Co1rFD5Z2@<-'nEt&I!
+<Y3/F)W6LC2[WrASc<5%13OO;e^)_Cgh?uCj@-q:IH=LBl%T.F`V+:FD,5.06M>V04f<@DI[6#
E+EQ'Eb/ZiATAo-AfuA;FWb@+G%De6Dfd+CE+NNnAnbge+CQC3A7cs)ART+\E\7e.%14sA+@K!J
:/=h3<Du=/@VfIjCNCV4DBMVeDKU1H8l%htE+*j%F"SRX6>U(JCNCV8@<iu7Ec5K2@q?coEcQ)=
F!,17+:SZM:IH=<ASu("@<?'k+EM4-Cht5(Df'?"DIdf@+<XHt+BN8pA8c[5+DkOsBPD?qF!,aH
FWb1&DBNM.@r-()AKYGu@;]ii$>FBiATMs)A0>i"FD,_<GA2/4+CoD5@VfTuEHQ2AATJu1Bkq9&
,%EZ=:i^JeEa`f-7VQ[MF'KnA+<X5u@;R-)Dfd+CF`M%9BQ&);FDhTqA8`T3Df''-BPD?s+EM76
Bl%KlEZfR?FD)djBl8'<+E1b2BQGd8$4R>#.3M5Y6m-S_F*)IGG&M2>D.Oi2E+*6f+C\noDfTD3
@rc-hFD5W*/0JG@E-Z/8B-;,5+ED%7FDl26DJ()$@:O(qE-!WS:Mq:VBl7I"GB43#Ao_Ho+Co2-
CER\;@:NjkBlbD;ATW'8DIm?$@X0))DBM5A8K_MOCht^H+AZkt9PJBeGT_*AAKWC3AgnjDBOu!r
+Cf>,D..<m+DGm>F`V,)/e&.eBOr;sAftT%D/E^!A0>o(FEMVAF!,(8AS!!*E+*6f+D,P4+CT)&
+Dl%>DKKH#+Eh[>F_t]2/g)9.+E).6Gp%!9ARlp*BOr<0DesQ5AISugBOQ!*@rH7,@;0V#+A,Et
+Co1rFD5Z2@<-W9Anc'mF!+q7F<F-tA8`T.Dfd+;DJs_ABQ&);FDi:4ATVL(D/!m!+EV:.+Eh[>
F_t\!$>s9hAKYT*Df$V*+Dbb0Fa,$@Bl%?'E+*j%/g)9-ASu!h+A!\rATW'8DBO%7AKZ&2@;Kak
F*&O5D/XQ7F<GL6+D,Y*AKZ&5@:NjkAoD]4%16N[C`mS5F`);4A0?&6CisT+F"SRX;e9M_FD,5.
8l%ht-t[L2ARoLrCFLBLATD6&AoD]4A7]jkBl%iC+A$/fH#IgJBOQ'q+ED%%Ci"A+$?L&mCht5;
DesQ5ATJu2Dfor>ARloU:IH=B@<iu9AS-(+AKZ)5+CfG'@<?'3+C\bhCNXS=DfQt@ATMs3Eb-A(
Bk)7!Df0!(Bk;?<%13OO+<XEG/g,(C+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RU$367sC$
AT;j,Eb/c(A8,OqBl@ltEbT*+%144#A8-+(+=CcAAS#CdF)*-4$6UH#$:\`I@;Kb*/0IMr+F.mJ
+D#G#Dfor>ATAo4Ec5E'ASlK2F`V87B-9fB6m-GbARTXk+D#CuBl"o/AKYE'3Zqm?CLqO$A2uY8
B5M'kCbB49D%-g]$4R=O$4R=O$4R>Z@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg
:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0J5@<2^]%A:eX/S7ScoV
;a!/hGA1q;Ch[d0GUFUV+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c
$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@
GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi
@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2BQS*-
A8bs2C2[WsDId='/nf?DC^g_dDe*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6
F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9H
A8lR(D(]O;F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&Ik
De*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-YbOn0d(3h0JXbc2_Zs6%15Kl;aXGS:fL"^
:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+FDl)6
/g*`-+E(k(ATDi$$=P'$DfTA2DfTQ'DKKH#+Cno&@:EYdAKYT'EZee,C`mhFE+O)5De:+a+EqaE
A90@G8l%ht%170!E,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)
FDl)6F!,(5EZbeuA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g%V^A7[A9%13OO8T#YC+?(o,GT]US
6m-M]EHPu9ATJu9BOr;uDes6.GA1r-+CSekDf0VW%13OO+<Y3'FC?h;Anc'mEt&I!+CT;#07%>O
+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__D
DCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9
DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+G/KetP+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>
$4R>UFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_*$4R>7DeO#26=FY@
EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:
DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U
:JO&6-SR/5/iP-e$;aD^<(9Y]9iF29-[09B+Dbb0Fa,8V+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[X(Dfp)1AM/:CE"*.hDe*p-F`Lu'
F(KH9E%Yj>Et&I*%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JOpa$:I<]6W-KP<(Tk\4ZX]>+?CW!
%14LuDe*p-F`Lu'/p_5N.3N>G+CT.1@<,jkBm+&1@rH7,@;0UnDJ()5ATDKnCh\3,A0>E*D/]pk
G%G]8Bl@m1+E(j7FD,5.FD,]+AKXT@6m-#S@ruF'DIIR2+Cno&@:EYdATJtBC2[WnATfV>De(DA
FD5Q4.1HW+BOQ!*@<,p%F`V,)+EVNE@WcC$A0>u-AKXT@6m-PrF*(u1/g)9/:IH=HH#n(=D'3A'
@ruF'DIIR"ATJu&Eb,[eB5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+Ceht+C\n)F`V,)+EVNE@WcC$
A0>B#D/a<&GT]U$F*VhKASlK@%13OO8T#YC+?(o,GT]US6m-M]EHPu9ATJu9BOr;uDes6.GA1r-
+CSekDf0VW%13OO+<Y3'FC?h;Anc'mEt&I!+CT;#07%>O+:SYe$;+)^+EMIDEarZ'A8,OqBl@lt
EbT*++DG^9-u*[2F)Q2A@q@9=BlGLD@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"
+EV:.+A*bt@rc:&F<H$@A7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk
%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+<W(IDe*p-F`Lu'F(KH9E%Yj>F"&5F
@<3Q#AS#`g$6UH6@q]F`CLq$!Df-\!Bl7I"GB4mA2D-[=/0J[d/hf"&@;]TuCh[d0GT^`[/hf"&
+>Ybq@VKp,F*VhKASlK@%144#+AP^3762P_F<G(%DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB
/e&-s$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#
+A,Et+DbIqF!+n3AKY])+EV:.+D58'ATD3q+DbIq+Cei%AS5q%GqKO5%144#+A,Et+DbIqF!,.)
G%De6Dfd+2AS#a%D.-sd+Cf>,E,9*-AScW7E,Tc=@:F%a+C\o(G@b?'%144#+BN8pA8c[5+CT.u
+A?KeFa,M]+B3#gF!,:-@N]l5Ebf_=Df-\!Bl7I"GB4m8DIal(F:AR"+<YlBCht5<DfTV9Df-[k
Bl8'<+CT=6G@bT,3ZrB^Dg#i*ARlp/Dfm15D]iq9F<G7*G%D*i+<Ve8DL!@9G][A3F<F1O6m-#S
@ruF'DIIR"ATKI5$4R>O@;BFpC1K=b5\FqBBl#D3Df#pj.1HW'Eb]?-A25l767sa,Eb]?-A0>qF
/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?
+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+=\Kh0JGG(@rsFa
+>"^EA7T7^+F7X6Ch7Ys$;No?+=\Kh0JGJ)@rsF[+>"^EA7T7^+@/pn8P(m!+CoV3E,uHq:-pQU
.NgK#0K<u\F>5Tp/KebFF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+DKKe>C2[WnATf22De'u5FD5Q4
+E1b0@;TRtATDi$$4R=O$;No?+EMX5DId0rA0>V0F(96)E--.1$?B]tF_Pl-+=C]2@Wc<+FCB6+
-OgCl$;No?+D,P4@q?cK;aX,J3&MgmDBNJ4D/aP*$;No?+E_a>DJ()5ATW$.DJ+#5Bl5&-DIdI)
Bk2?pC`m8&@ruF'DIIR"ATJ:f:-pQU5uU-B8N8S7@;9^kD..3k?TgFm0b"I!$;No?+F7X6Ch7Z1
@:WneDBL?KARuuV5tiD3De!p,ASuTuFD5Z2+E)-?8g&=lCM>4,$?B]tF_Pl-+=DVHA7TUrF'N-o
@pF=oE*R^$Bl%@%/no'A-OgCl$;No?+Dbt+@;I'-@rc:&F<GI>F`)7C%15^'6q:-O?[?'B3Zoeb
De*s.DesJB%15^'6rR)W?[?'B3ZoebDe*<cF(o-+ATMs7-OgCl$;No?+E2IF06hMKAdo)8:IA,V
78?fL:JFPL:./H8?Q_Km+>=p!+>=63F)>i<FDuAE+E2?D-[U;;IXNRQ$4R>;67sBo@;]V$+D,P4
+E2.*@qfgn+EqaEA9/l-DBNb6@:Wq[+Cf4rF)to6%15is/g+_G@<6!&-[U;;IXNRQ$;No?+A,Et
7oE/+B4Z0--[U;;IXNRQ$7QDk%17/nDfp/@F`\`RC2[W*E,ol3ARfg)F(KH9E$l)%F`;)6A2Z+s
1,2Nj/h2!_C2[W@0JXbl/M/)fE+EC!AKXT@6m,oKA8c?.2D-[=+D,Y4D'1bi0JP0h$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AQ%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:Fh4ZX]55s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$7BP&De(4<B4Z0-4$"a0ART*lGB.D>AL@oo%16igA2c2e4ZX].+<VdL+=CY[05>E90/kR>
05>E9A7]p;F(96)E-*`\%16igA2Z+s@:WneDEU$'+=CY[05<C!1,!'HA8c@,05"j6ATD3q05>E9
0..29%14M(ART*lC2[WA0R,,rC2[W8Bkh]:.3NhTBlmo/F(fK9E+*g/+DPh*2D?mpA7TUr/151N
A1hS2F!hD(-urm-A0>W*A2c2e/151NA9;a.Ci_4CC3(aO+Eqj?FCcS9BQ&*6@<6K4C2[W@0J['I
A8c?:-YdR1AU&<<05>E9FDl)6F"V0AF!hD(%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%13                                                   ~>
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
zz=:zz,'DICTIONARY DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003'
zz=:zz,' ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR'
zz=:zz,'013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 '
zz=:zz,'ERR023 ERR024 ERR025 ERR026 ERR027 EXPLAIN FREESPACE GROUP HTML IFW'
zz=:zz,'IN IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILES JDS'
zz=:zz,'DIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVERSION '
zz=:zz,'LATEX LF MACRO MACROTYPE MASTERPARMS MAXEXPLAIN MAXNAME NVTABLE OBJ'
zz=:zz,'ECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK009 PARM'
zz=:zz,'DIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK REFERENC'
zz=:zz,'E SUITE SYMBOLLIM TAB TEST TEXT UNAME UNION UTF8 WORD XML afterstr '
zz=:zz,'alltrim badappend badblia badbu badcl badil badjr badlocn badobj ba'
zz=:zz,'drc badreps badsts badunique beforestr bnl boxopen catrefs cd chang'
zz=:zz,'estr checknames checknttab checknttab2 createjod createmast ctl dbl'
zz=:zz,'quote decomm defzface del destroyjod did didnum dnl dpset dptable e'
zz=:zz,'mpdnl fex firstone fod fopix gdeps get globals globs grp gsmakeq gu'
zz=:zz,'ids guidsx host hostsep isempty islocref jappend jcr jcreate jderr '
zz=:zz,'jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv ju'
zz=:zz,'stpath jvn lfcrtrim locsfx make makedir markmast mubmark nc newd nl'
zz=:zz,'args now nowfd obidfile od ok packd plt put quote read readnoun rea'
zz=:zz,'dobid regd remast restd rv saveobid second tc trimnl tstamp uses we'
zz=:zz,'x wrep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRC'
zz=:zz,'N DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ER'
zz=:zz,'R201 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210'
zz=:zz,' HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum copydirinv co'
zz=:zz,'pyfile copyfiles createdl dfclose dfopen dfp dncn dnix dnnc dnnm dn'
zz=:zz,'rn dropall dropbakdir dropdir dropinv dropnc dropref justdrvpath li'
zz=:zz,'bstatus loadbakdir loaddir loadnc loadref loadstamps maxback movefi'
zz=:zz,'le nummask packdict packspace renamefiles restdict restspace savedi'
zz=:zz,'r saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake DUMPMS'
zz=:zz,'G0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPPREAMBLE DUMPTAG ERR0150 ERR0151 '
zz=:zz,'ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 EXP'
zz=:zz,'LAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCH'
zz=:zz,'ARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfr'
zz=:zz,'cl clearso clfrbtcl createmk dec85 dumpdoc dumpgs dumpheader dumpte'
zz=:zz,'xt dumptm dumptrailer dumpwords extscopes fap fmtdumptext fromascii'
zz=:zz,'85 halfbits htclip jnb jscript jscriptdefs makedump makegs masknb n'
zz=:zz,'amecats nounlrep opaqnames parsecode sexpin sonl tabit toascii85 uq'
zz=:zz,'tsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodon jod'
zz=:zz,'off jodon''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC '
zz=:zz,'CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZ'
zz=:zz,'E DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 E'
zz=:zz,'RR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR06'
zz=:zz,'7 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ER'
zz=:zz,'R077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087'
zz=:zz,' ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR'
zz=:zz,'097 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK0'
zz=:zz,'50 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK06'
zz=:zz,'2 PATHTIT READSTATS allnlctn allnlpfx allnlsfx apptable appwords ba'
zz=:zz,'dcn bnlsearch bnums checkopen checkpath checkput closedict createst'
zz=:zz,' defwords delstuff delwordrefs didstats dnlsearch freedisk freedisk'
zz=:zz,'linux freediskwin fullmonty getdicdoc getdocument getexplain getgst'
zz=:zz,'ext getobjects getrefs gslistnl inputdict invappend invdelete invfe'
zz=:zz,'tch invreplace islib iswriteable iswriteablelinux iswriteablewin jd'
zz=:zz,'atcreate jwordscreate loadalldirs loadallrefs loadwords mainddir ne'
zz=:zz,'wdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx ope'
zz=:zz,'ndict pathnl pathref putdicdoc putexplain putgs puttable puttexts p'
zz=:zz,'utwords putwordxrs rplctable rplcwords sortdnub''),(<<;._1 '' jodtest'
zz=:zz,'er TESTYAMMER ereopen hfd hostsep rmroot showpass testenvironment'')'
zz=:zz,',(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR'
zz=:zz,'00402 ERR00403 ERR00404 ERR00405 GROUPSUITES IzJODtools JODLOADEND '
zz=:zz,'JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 OK00403 OK00404'
zz=:zz,' OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 WORDTESTS addgr'
zz=:zz,'p addloadscript addloadscript1 allnames allrefs betweenidx createjo'
zz=:zz,'dtools dayage delgrp firstcomment firstperiod fsen getrx hlpnl joda'
zz=:zz,'ge lg locgrp ltx mg mj mls mt noexp notgrp nt nw obnames onlycommen'
zz=:zz,'ts pr refnames revonex swex today todayno tt updatepublic usedby yy'
zz=:zz,'yymondd''),(<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSO'
zz=:zz,'NLY DOCUMENTMARKS DYADMARK ERR0250 ERR0251 ERR0252 ERR0253 ERR0254 '
zz=:zz,'ERR0255 ERR0256 ERR0257 ERR0258 ERR0259 ERR0260 ERR0261 ERR0262 IzJ'
zz=:zz,'ODutinterface JODHELP MONADMARK NAMEALPHA OK0250 OK0251 OK0252 OK02'
zz=:zz,'53 OK0254 OK0255 OK0256 PDF PDFREADER PDFURL ROOTWORDSMARK SCRIPTDO'
zz=:zz,'CCHAR URLPFX URLSUX VERBATIMMARK WWW0 WWW0linux WWW1 blkaft changet'
zz=:zz,'ok compj compressj createut ctit de dewhitejcr dewhitejscript disp '
zz=:zz,'doc docct2 docfmt2 doctext docword ed et exobrefs gt jodfork jodhel'
zz=:zz,'p ljust obtext pdfreader qt reb revo rm rtt setwwwbrowser textform2'
zz=:zz,' wwwbrowser''),<(<''test''),<0$a:                                     '
zz=:5658{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DQC8+>P&u+>tu/+>Y,q3&WZ;2BX_72)-44+>PW.2]st#2_uR9+>Pr73?U=)1GUa/3$9t11H$@7
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
1CX[c5snOG4ZYD/$4R>;67sBkBk)7!Df0!(Gp%0>Ch=f1AS,LoASu!h%15Kp6W?WQ:-hc\4ZYG0
$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF!,C=3ZqL";FE'878m/:7oE,_:b5OF8Q8,0
9gM-E:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm
@rri'De*E1+Co&&ASu%"+E)-Y+AY<r771$L6OaB3@:X:cC-=U^3Zp",+BplL.P<@s><3lX+C-+$
/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&+=84M@<?0*E-6&.FEM#6
Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O6V(*R4ZXr53\E!3/5SW3
845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^kDIdI!B-;,1+D>\7F<F@X
%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h4Wn#ZI45U4%13OO:-pQU
AU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRs%16imF*)A0FD*fu
><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[/g*tV<(KDG9I;n3$;No?
+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQUC2[X(H#n(=D/`p*BHV#1
+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,XoARlotDBN\4A8c?<Bkh\u
$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.C2[X(H#n(=D/`p*BHS[;
De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*F(KB%Df00$B.dn5F!hD(
%15is/h1FMA7T7jASu$iDKKq/$>OKiA8bpP67sBqDe*Bs@P2A0F!*%d+Co2,ARfh#Ed8dG@VTIa
F<G(0@<6KN+D#e>ASuR'Df-\9AfrL:De*p2DfTD<%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'
+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)
+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9
+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?
%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q
@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm
%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdL
A8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8ZA8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#
Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+G
Bl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%
+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&
DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;
Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#Dfor=%15is/g)8ZCi<`mA8-',+<VdLCi<`m+Co2,
ARfh#Ed8*$:-pQU+<YK=@:X7c+<VdL+<YK=@:UL)DfTA2@;]TuD.-ppD]iP+@<6KCFEqh:Et&IO
67sB'+Dbt)A9)6n+<VdL+Dbt)A0>o(An?!oDI[7!%15is/g)8ZCi<`mF*(i-E-!-ECi<`m+EV=7
AKZ&9@;Tt)%15is/g)8ZE+*6lA8,Oq+<VdLE+*6lF!,"-@ruF'DIIR2+CT.u+ELt7ATJu4Ch+Z#
Bl%@%+CT=6@3B#f@r$4+%15is/g)8ZE+*6lF)YPtAKW*<FCfN8F!,(5EZfFGAnGaeBk;1(+C\bh
CNXS=F)YPtAISuA67sB'+ED%7FC])qF<D\K+ED%7FDl22F!,=<F*&OFARf:hF<G%$@r$4++CfG'
@<?'k+C]U=-u`U)CLh-hF=@Y+:-pQU+<Y]9F*)JB@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"A
ATMs3Eb-A7E+*6f%15is/g)8ZF('6'A8-',+<VdLF('6'+Co2,ARfh#Ed8*$:-pQU+<Y`6G%G]*
Afr3=+<Y`6G%De:AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m
+=KiX6tC4F+ECn.B4W2@0JG(61cZuo$4R>PDe!TlF)rHO@;9^kA8bp)%16T`Bl8!'Ec`EO@;9^k
F*)>@AL@oo%15is/h1CCE+NotASuU2+F#Ii+A,EtA8bp"A7]^kDId<rF<G+*Anc-sFD5Z2Et&Hc
$;No?+Co2,ARfh#Ed8dFDfoq?DIIBn+E2@4AncL$Et&IE8Q&;X;a!0(4"akp+=A:5:JsS'<(0_b
+@f=*<DXf:<Cp.Y+AG-h;GSYL$4R>;67sBkBl[cpFDl2F+Du+?DBO"CAnGb%ATJtG+E):2ATAo1
@<?U&EcVZs6r[)V=@5hH3]oJV?SNZN+B28^8Q[*&:+$JX%15is/g,7MD.Rd1@;Ts7+DG_(AU#>6
BleA=@;]Tu@rH4'Df0-(F<GI>F`&=>@;TRs%14LF3[[<e;H-R;6qL9J=<L"';F=2,.6T^74<cL&
Ho`B<8Q&;X;]mV</j:p26r[)V=@5gm$4R>;67sBu@;TQu@r,RpF!+n/A0>_t@rcK1FEqh:+Du+?
DBNh*D.Rbt$:IH`:.%0*4?G0&0d%hd=&2^^:.$-u5snOG:.$B<$4R>;67sC$AS,LoASu!h+E(_(
ARfh'%15Kp;GotZ4ZY\e/mg=U-QlJd;FFDO7NbZ!;cHX`7OJWP%15is/g,1GAn?!oDI[6#FD5T'
F*(i-E%E,GDId='+Dbb5F<G"0A0>B#D/aE2ASuT4DJsZ8+DtV)ATJ:f-p'I;;FO&S;]nt,7S-])
;FO&B:+%JR3ZpO/0d(j)+@Je!;FXD(/1)u50-EY^;b:(Y:(7O>$;No?.V3L.A7]^kDId<rFE;28
A8PajAPPQE+DPh*D..3k/no'A+>#/fF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nO
G][M7F(oQ1+E(j7-q[9'.1HVZ67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.
AoD]4D..3oDJ()5@rc:&FE8R:Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.
DKK<$DK?q1De*E%AoD]4@;]LiH$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G
%15is/e&._67sBPDKKH1Amo1\+Du+?DK?pI+Eh=:@WOR>$;No?+<VeNEb&g!Ddm-kF!)SJ+D#e>
Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^A7Z2W:-pQU+<YQ1D.R3cFE8QI+<VdL@r,RpF(o6#
ATJu3@;TRs+DG^98g%V^A7Z2W:-pQU+<YN0CLq%!D/^U?+<VdLA9Da.F!,C1C1UmsF!,C=+E1b2
BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD@;BFeF!)SJ+<VdL+DkP&AKYW+Dfp"A@;]Tu
F*22=AKZ&(EbTK7Et&IO67sB'+EqpLAU&;>+<VdL+<VeNDfTA2@;]TuFCfN8+EV1>F:ARP67r]S
:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuCA8PajAKZ#%DJ*N'0f:X:0f_6C%13OO
@rGjn@<6K4-Xgb.A8PajAL@oo@rH(!F(KB6+<W%?C2[W1%13OO:-pQ_A7]^kDId<rFE8RL/M/)`
@VTIaFE8RKBln#2A7]@eDJ=3,Df-\.AT23uA7]XgBk;>p$4R>1<D?:d;FNlG6;0g23Zp+!3Zp*c
$;No?%15is/g+,,BlbD-F_u(?F(96)E-*44@;[2sAKYMtEb/a&Cj@.>Ddd0fA0>?,+A*c#Bln"t
$;No?+EMX5DId0rA0<QL3\V[t@rc:&F<G(3D/E^!A9/l-Afu2/AKYT'Ci"$6Bl7Pm$;No?+Cf>-
A8-."Df0V=@<,p%F('0)F(T,tA3(/,:-pQB$;No?+<Vd].3M5*BOPs)@V'+g+Dbt)A7]9oGA2/4
+EV:.+EMX5DId0rA0>i3De<^"AISuA67sB'+>PAg8l%htBOPs)@V'+g+Dbt)A7]9\$;No?+<Vd_
.3Lo!FCB3&ATT%e:IH=EF`\a:Bk)7!Df0!(Gp$gB+E)41DBNt2@:V$8EbTW,%15is/e&._67sBU
DffPO+A,Et+ED%&F_PZ&+Cf>,D..<mF!+n3AKYhuEbf5s+EqOABHVD1AISuA67sBjDf'?&DKI!r
68!U78l%i)I3<TL+EV:.Gp$U*DBND"+D"u&Bl&&;AoDg0A.8l@67sC)Bln#2GA2/4+EV1>F<G.*
Bln96F"Rn/:-pQB$;No?+@L?hE$043EbTK7F!+t$DBND"+Dbt)A7]9oGA2/4+D#e:Eb0<5Bl@m1
+Dbb-ANC8-:-pQB$;No?+<Vd\+Z_;"4==W">]aOoE*QprD/aQ+EbTK7/no'A-OgD3%13OO:-pQU
FCAg'+A,Et+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\
-OgCl$;No?+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo
$<L+k:fL.c=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'
@VTIaF:ARU:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4
AR]drCh.T0B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5
B6%r<4s2%%+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4
ASuT4-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17
+EV:.+EM%5@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7
/12fP+DEGb-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>
BOQ!*F*)>@ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE
-QmANF<Db[+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6
DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*
ATD?m+EM%5@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT
7h#e7$;No?.V3L.A7]^kDId<rFE;28A8c?\67sa&De*d(+EK+d+E2.*@qB^(-u*[2Df.!H@;]Tu
-u*[2De<T1+DG^9H6@$B@ps1b/e&-s$=e!aF`MM6DKI!KH7'./C2[X(FDl22:-pQUC2[X(FDl22
/no'A+>#/fF*)>@@:s-oDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[W3%15is/e&._67sBO
Bk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg@UX=h04np7AKZ&>F*(u1+E_a:A0>u4+EMXCEb,[e:-pQU
A8,OqBl@ltEd8dG@VTIaFE9&W;Isf`@:O"hB-;;0BlbD,CghC++DGm>@;Ka&FD,*)-Z]_(:-pQU
Eb065Bl[cq+EVNE@q]:gB4W3-BOr;sBk)7!Df0!(Gp%0MDfT9!AKZ&>F*(u1/e&._67r]S:-pQU
<b6;\+DG_8ATDBk@q@\1$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2
+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1r
FD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'
DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@lt
EbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8Z
A7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'
%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,
Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0q
De!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<
DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9
Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVj"C1UmsF!)SJB4Z0-DdmHm@ruc$$;No?+<Ve>ATVs(
Aof(;+<VdLB4Z0-Eb/ioEb0,uATJ:f:-pQU+<Y<<Ch[s4DJUF<+<Ve>Ec6)>+CT.u+EM[>FCcS4
@;TQuCh[s4Et&IO67sB'+DG_4F`_/.@rrh9+<Yc;F*&O:DfQt=@VTIaFE8R=DBNn@F<G+.@ruF'
DIIR2%15is/g)8ZBl8*&E,]B+A0<!;+CT5.ASu$$Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:A7]Rg
FCcR;+<Y3+Ch7^"+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%P<-@qZu-+<Ve=ATVEq+DG_:ATDm(
A0>DkFC>Uc:-pQU+<YB9G&h/5Cgggb+<VeLE+EC!AKY])G%G]9ARloo@<>oe$;No?+<VeEATr0+
B4P^dF<D\K@rc-hFCcS4ATo88EZfC6B5)F/ATAo(Bk)7!Df0!(Gmt*U67sB'+E)41DIdHkF<D\K
+<YTAASrW!+Co1rFD5Z2@<-W&$;No?+<VeG@<?1#C`jiC+<VdLE+*j%+DtV)AKYf'F*)I4$;No?
+<VeGF`_2>E,8rsDBL&EF*)>@AKZ&-DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<VeGF`_8;
+<VdL+<VdLF*)>@AKYW+Dfp#?+CT.u+EM[>FCfM&$;No?+<VeGF`__6@VfTu+<VdLF*)>@AKWC=
@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI+<VeJ
FDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeGF`_hG
Eb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ckC`mb0
An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@AKZ#%
DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?
.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=3\V[!
+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^4ZYDB
+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa4ZYGC
+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is/g,">
Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8:.%fO
:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC++E)9C
D.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm@rri;
@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2
@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'Df0-(
F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI
@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^CghC,
+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,E,TW*
DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%@<?0*
/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3+E(j7
DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(AKYK$
D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%<`<!i
<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm+Cf>,
E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$
=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe$;!un
<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:*9uQ%15is/h1FMA7T7j
ASu$iDKKr7De*s$F*(u6:-pQ_C2[X)ATMs)EZf!H/KeeHA0>u*F*&OG@rc:&F<G^JBl%L*Bk;?<
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;D..]E1CX[d
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB80kP!+0f1"$C2[X)ATMs)E[`,KDg*=?Ddd0fA0>T(FDi9MBkhQs.3NGF@ps1b
%15is/g)l'DJs\Q3$9VkATMs)DK]`7Df0E'DKI<M@q]:gB4YTrFDi:3Eb/[$AKWC4E\&>NATB=E
FCfN8E+*g/.3N>B+=Lr=De(:+$4R>PDe!TlF)rHOBkhQs-OgDtDe*s.DesJi67sa&De*s.DesJ;
@kB8T8l%htFDl)6F!+t/@<6K4/KeVLFCf?#F!+(N6m-VoBl%L*Gp$U5@<6KB%15is/e&._67sBP
DKKH1Amo1\+EqaEA90d@$;No?+<Y*'A7oq%+<Ve8A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=
AKW*<+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y*/Ci3ZuATJu(
Df&rtDIml3DIIBnF!,(8Df$UFEb/j#@;TRs.3N&:A0<:=@W#UkATK:C+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<Vd9$;No?+<Y*/CiX*!F!)T6Cht53@;TRs+ED%*ATD@"@qB0n@X0)7@VTIaFE8RC
DBNh*D.Oi+BleA=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y3+ChId-+<VeIASl@/
AKZ28Eb'5EFCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<Y<.FE2UK+<Ve>ATT&8AT;j,Eb/c(FDi:5G\(B-FCcR;+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y?6E,KJ7+<Ve;Ble60@<lo:
F(fK4F<G+*F(96)E-,f4DK?q=Afu#$C1UmsF!,C=+=MLa+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<V+#:-pQU+DPh*@:s-o+<Y3'H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u+CfG'@<?4%DBNk0+A,Et
+E(_(ARfh'%15is/g)9ODe*NmCiCL>+Co2-E,8s.+E).6Bl7K)8l%htBOu"!+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'ChFk5+<VdL+DkP&AKYE!A0>],@:UKQ:IH=<Ec6)>+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D/=89+<VdL+DkP&AKYf-
@:UL%@rc:&F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'D0-mC+<VdL+D58-+DkOsEc3(BAU&;>Ao_g,+D#(tF<GdADId[0+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DJs*2E$-8G+ED%8F`MA@+CQC/
BleA=De:,1@VTIaFE8RKBln#2DJpY/G]7J-DIIX$Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'DJsW0Ec<-D+EqaEA9/l3EZfI8F*)IGAo_g,+=MLa+EV:*F<G"4AKYl/F<G:8+D5_5
F`;CEDfQtAF_Pr/F!)SJ+<VdL+<VdL+<VdL%15is/g)9SF<D\K+<VdLB4Z1++DtV)AKYE!A0>u*
G]Y'?Ec5e;ARoLs+EqO;A8c[5+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is
/g)9SG9A"N+<VdLARoLs+CQC1ATo8.G]7J5@qg$-GAhM4+E_a>DJ((a:IH=8Df0`0DKKT2DK?pC
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9T@W#UkATJt:F`(o5F_)\:DfTr2A0>f"C1Ums
+CT.u+Dbt+@;KKtDIIBnF!,(8Df$UFF`V,8.3NYBF*2;@+<VdL+<VdL+<VdL+<VdL%15is/g)9U
EZcJI+<VdLE-67F@;]Tu@rcL/F!,L7An?!oDI[6#@3Bc4Eb$:E+Eh=:Gp$d/DIe#8@<3Q"DBNM$
Bln96+@K!m<D>nW<'sGU9gMNB%15is/g)9WAS,ggD.Rc2F`(o5F_)\:DfTr2A0>o(An?!oDI[6#
DIIBnF!,(8Df$UFF`V,8.3NYBF*2;@+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9WATi!0
AU#=?Eb0?8Ec,q@@3BB#F*&OCAfu&8F<G+.@ruF'DIIR2+E(_(ARfh'+EqOABHV22+D#e:Cgh3i
FD5Z2F!)SJ+<VdL+<VdL%15is/g)9XG@c"A+<VdLF(KG9F(fK4F<GdGEb$;(G]7J-Bl7@$Bl@l3
Ao_g,+=Lc=@jrO6ART+\EZcJI+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9ZF(JlkGp"4P
Eb0?8Ec,q@@3BB#F*&OCAfu;9Eb'56Ao_g,+=MLa+EV:*F<EtC;FNrP9N`KJ@;Ka&GAhM4F!,C=
+=MI`+<VdL+<V+#:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*s.DesJ;
Ea`iuAKWZ\1b^U80JG480JFpb$4R=j3?^F?0e"5!+<XEG/g+\=F(8X!A0?)0Blmp-E+*6f%13OO
@rGjn@<6K4-Xgb.A9;a.Ci^s5$=e!gDKBB0F<D\R@;9^kF`_>6-OgDtDe+!4Bl$O2/g+nIA9E!.
CbBF:F!*%d+CQC&Des6$@ruF'DBNk0+A,Et+E_d?Ch\!:+EqaEA90@4$;No?%15is/g+,,BlbD<
F^eis@<6K4A7]@eDIml3@3BW&F<GL6+D>2$A9f;?FD5Q*FCfM9FD,*)+E_a:+EV:.+Cf>1AISuA
67sBm@:O"fBln'#F!,C5+A,Et+EVNEE+O'%DfT\;FCB6+F!,C5+D58'ATD3q+E_a:+EVNE8g&(n
DeF*!D/Ej)F"Rn/:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84SATD7$3XlEk67sB'+Cf>,E,$L<
+<Y6?FE1r0AKYK$D/aN,F)u&6DBNk0+Co1rFD5Z2@<-W9GAhM4Et&IO67sB'+Co%++<VdL+<Y38
Df?h1EcQ)=+Cf>#AKYT*Df$Uh:IH=GATN!1FE7lu:-pQU+<Y3/F)W6E+<Ve;Ble60@<iu+Bk)7!
Df0!(Gp%$7C1UmsEt&IO67sB'+CoD#+<VdL+<Y97Ec#6,+Cf>,D.RU,F!,17+EqaEA9/l%DIal#
De!p,ASuU2%15is/g)8ZARlo++<VdL+D#(tF<GL2C1UmsF!,(8Df$Uh:IGX!:-pQU+<Y6;+<VdL
+<Ve<A8--.FCf]=%15is/g)8ZB657=+<VdL+D58-+EV1>F<GLEF<GL6+D#(tF<GdADId[0Et&IO
67sB'+ED%:D]g/F+<YK7F*&OFARf:hFDQ4FEb0E.F(Jl)DdmHm@ruc$$;No?+<VeID'0rD+<VdL
Ecl7BD.-ppDfZ?p:-pQU+<Y]HF<D\K+<VeIF`&=D@<H[1Ci<s3+EV19FE7lu:-pQU+<YE;A8#Oj
E$-9EE+*s.+C]A0GB7>9+D,P4+E).6Bl7K)BOu"!%15is/e&._67sBUDffQ33XlEk67sB'+D#S6
DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.
A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67sBjF`MM6DKI"7ASc<.FDl,4@ri(d8l%iG78-N@
3Zp+!3Zp*c$:.$tDKKH-FE8Qd+>Ih50l(8S2c"Ws77UN<6=G%N=]@4U<d$cNCdgcmH?Edu3E.S1
;HZ#%0F\@T8oJ63DId='+?L]#CKP(RH$XdZ88DsXAk?rKEE+ed8Ph6[Anj"X91EQ494Ck(78[lH
BgtAt$:8<FFAR!d@ruEpATJtU+>I\91N>uH/O=5E3(%e1<B"bS0L[j?BOt%V7lN5IF%f&GA2/4L
H$!&!@grc4CghC+ATJt:+?L]#CMu4&CfWQ.8kqoa;+#VB<DGDRC342\A6:ZtD.RNt/SA*dFE_A/
G>rVm$:A`BATJt:+<Vdg+>HABF>-BI=Aj!SGA1&6G>Ue&3D"Bi7o42&0hZ+;BJr^iGY:VA9R'u^
1^sd[AT23uA7]Y#;e9H\Bl@l34!68"DE2];3(S0DEbf$&C,[hACNi9DD*pc`@4bMl;F,1e1IkSo
EI)RtEd%s"6tp[Q@ruX0Bk;?.4!67M9ghie6V(ohA8PsH:LYn47;,J@APZcL67jcF1hK]i@R;nL
9K"b!BfHP/8T&WjDe+!#FD5Z2+?L]#0i;Xd76#9Z0L9Vl6pYuO?YX:N@o.J/CIE893&kYQ;DWK5
:2tJ0E(j+<$;tGOARTXk:2b5cF!*Oe0k!CZF?";bA5@2P6W#]rEDfXcC3)+(GA1K(G!e$(G\g5s
/Qt/8Df\]e%16NSA7oq%+<VdL4!67h3Gh2o9L2TI=E]!n:.Iod86AG>G'\<j6uZg"Am\)DD,*cE
B/t!D='5t>@rH4'C*4WA+<W`g0gTMb88E3!C.Crs8lRQGEas<8A3k-0>';c'C,f1"0PY>uDf&WN
BN\8&%16WWC`jiC+<VdL4!67G:b?QYGZeX"2.'3oChRZR3D+C4AOKBU3+d8D=)]a5;b9MS<C_.6
A7l>YA7]RiEc<-D+<W`g0lTHGAnX&%A5dJ);HcP)@:s%d@5hP9>%UZM=Z/0.BPo^sH?OITEA^p&
%16W[A0<!;+<VdL4!68'/Mfn*Dg"-_=#a_B758pu<)-S57VI'>7;Zm/?VWCs1e06A3(u8D8kfa%
A8-+(+<VdL+<W`g0jej&AN*5+:/Wog9/B7c9P$V4G@>N5G]n$qCN+>pA7JYS=Z&ik=[?)$%16W`
C`jiC+<VdL4!67uD.b[oEahgh6t%l=7S7cH<G,oFF`UVWG&2J#2K*M/BP_0h0iiO"94n\@A8bs#
+<VdL+<W`g0m[>5G&K)e1hJ[?9Mei3<,tT#6!7uD2G-qj:NT)r8TRLBCjBhbH8795%16WbF(KG9
+<VdL4!68(77;8Y<_Rfp<`rceG>^A5<`rm/EH688<Cp891fm=(0R@S/:J42F8nSS?ARlo++<VdL
+<W`g0i2D#6T@Y.BM(m;<Co&.CN"-'BN'.g@m`XdCMl^'Gt)UJ85N5aA6C`d%16Zg+<VdL+<VdL
4!67L=`%b16T&FI7;R$e;fcJOH$*g\:,#==94Bo,:/Ot[6<,^=B3&&7Ch!n]B4Z0-+<VdL+<W`g
0ii'A:f27D:dmrSE%k3a1hB'`7mq!&2+V[P<+0fD:j,r3Ed:#,1.aH"%16`ZFE2UK+<VdL4!67j
<DkhN9M&8P:ffYjAjKNjCijr:6?QID0l'*U;IsBZ;H@dSG#qd<G#8\UB5DKqF!)SJ+<W`g0lo0Y
6"Vfd>&J@m@m`Rq;FF5P1/1S>;cH82>%00h6t&PR9kdsS=DD_5%16`gE$-8G+<VdL4!67e6=kF:
@T,g)6:O:aEcu>:<c1u<AhZhN=Yha*E^j#;H=q=q7s7UPEbc*kB657=+<VdL+<W`g0f(XT@7rFr
;b1##@s2Tj<,,6.2`Z2*DJN?F1ML\c1J:>`1M:?3<H1TO%16cbE,KJ7+<VdL4!67]C2I*W=DqPC
Ecl[^964!":2*HTEDpn'A2\:9A79"7@X(ggA4^o(CI&C:C2[WkB4W2.+<W`g0k`F<Amo[l:Gcm.
68DGb9NPt>@7"Eu6#("*CdE1qAS<Yh:/*`i8l0+k%16igA8#OjE$-8G4!67s3FmDRH#6_:EB./j
CN394F'<!(<d.S"7Sn>/AiNFoCfPXu;b:b&3-Pf=ChFk5+<VdL+<W`g0eG4XD,tF?D.bPABkg@E
=Dqka;`8buEd:D;7la@2847cGE+_^#G&h(e%16oi@qTh$+<VdL4!67E<bQGZ=E8M%<A[*4D`)Q.
0QUlF6:jgg76"C[H;$,.:gm-qAjJn"8OX'qD..3k+<VdL+<W`g0l:NG9K>'d6r%]5De3Z<91+#<
E&0187Wq[>@mrq39lWi^DFH9u9PRX=%16rgF!)SJ+<VdL4!67d;FP>"@<6'TH8f_%/RhOb:JjeV
7kuYgGqgm,=^cPJH!3dX@l$GcDcI5RDIn$&+<VdL+<W`g0eu%)CKa2#6r%/ECd^R(2DR0^GVVfk
3+ZqsCh.cE1g*478n:D9;dX*=%16ukFD#W5+<VdL4!68#=$gn;E_TD(1iQkWGu\Q[:,bd52J$uC
C-c$BD-2*N<AIZM:cMNC7o9^&DKI!D+<VdL+<W`g0em0696s$B7sB/hD+cfT7osb-0m[_`6!ne[
GXQ3sCGRhfDcKPA=_i(s%16us+<VdL+<VdL4!67;BP2<C3C-:sD)5X8CH#6mGAB/n5rD5OA28-j
6oA.;88:J85uBCQ8TtUNDe't5+<VdL+<W`g0lp'+8S'h]BkD0W;Is`<@;fsU758ds2aThg1ikU%
3DF3JF_k);:,cfB%17&_@r#Tt+<VdL4!67g<AJ&t@S/sa2/Q5j<&dBk<&RcX:ieE^C2ZKt8pEsB
<G5<U9kmdI=(;[HE,m'D+<VdL+<W`g0l;/'FA>Fu96t\LF&=blCf+Y%2Ju$18RY/#0f;d0/Q,2D
;f?SH@8:8t%17&sF<D\K+<VdL4!68#BNehY:3fE%9ic77@::a,AOC3>F&"VcC2S0=<b-&b:IK%[
F`0],2H^IrEb/lo+<VdL+<W`g0i(.n<DHR^AQ!J>@n]j8:c33-=`?>nCNsf/Bf(-^2`FoN7V>n6
0gRC(%17,eF*(q8+<VdL4!68$Cf4D.EcQ2F@WsY.7o",K88r*!E)9SIBj"S3DDG6\Gr8!0=]IC>
?ZQY`Eb0E4+<VdL+<W`g0lg$#?W'3L6!.Z<1/CV><_RU.7RM/gG==2@C26U90k"cmFZ4PDCb]`l
%17,eG&M80GT\+O4!68&77U3OGAVV':M46!D0\lX3,(`>F[KV-=\pkh:M=8n7<_45EG%j#D++m@
EbupA+<VdL+<W`g0i1GY:NoK>:el1Z84@;s=#)He/M2*\6"_ckFuaYSAPGT^>!ZV1EGf5g%17,t
F<D\K+<VdL4!67Z<&\8rBgX[Y;,U4eE_(D"3,VSkG>;:d<\dWQH9kYD3,1<;>#7"mD-7;TF`V,)
@X0(=+<W`g0hb_I<bX-b136$*6W,U);+PDD2L.2JG%+fOB3K4>9NY&46!.W,F)Z.Z%176!ATJt:
+<VdL4!67Q<CTGn1O3ChBif+M0MXMX9R/45A2ZGB:GP[[AoVa7F_imG6=rqn3COAa.1HUn$;No?
.V*+0ASu$iDKKqBA1]AUA7]^kDId<rF<GdGEb'56%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0
DfQt/F)uJ@ATJ:f5uU]^9gquT5uL?=3[\?WF*2>2F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-
CER5-EZee5FD,T5%15C$<(Ke_9gMZM4ZXs!F`_;8E]PQW$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-
CER5-EZek4ART[lA.8l5;FNlN779j9;G0/6-Y%1.@<?'k3[Y@D%15is/g+\C@s)X"DKK</Bl@l3
D..I#+D,P4+Cob+A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15L+5t"F5;G0/6-Y.L2A3)(I$4R>;
67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZf4;DII&uBQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f9i"MM
6qosF90G<`D/X<#A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfO:EaiI!Bl+:d<^fnQ
5u^EM9gMZM4ZXs6ATD6gFD5SQ-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4Ec5l<+EqaE
A9/1e;GU(f=&2^^;b]PU90G<`Ec5l<GAhM4F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CNCUM
+Co&&ASu%"+E)-?DffZ(EZf4-Ebf_*$:IZW<D>nW<)#YV92du7+@/q)<D>n\9gMZM4$ckG85E,X
5uL?;6W-?=<(02L5uL?;6s2fD9gMZM4&&LG5t"F5;G0)P78cH<<(TeY5uL?;;GU(f=&2^^;b]PU
9+;4;$;No?+D>>&E$0:DC`m\;AS,Y$+:SZX;G9nV=?S\mBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;
A8bt#D.RU,04Z^`%15is/g+.l9Me2\4ZX]5BQS?83\N-sDe!i@B5_^$Ch55/Df%..Bk;KQA8bsL
6p2n,$4R>;67sBoASc<.F`MFDF*2),Bm:'o<DlLh<EMCF-SK%ABllRQCcu?I?WC#L-OgCl$;No?
+EM+9+CoD#F_t]-FCeu*GAhM4+E_^@F!(o!:-pQUA7]@eDIm?$Bl5&7F`:o4@r,RpF(KD8+<`-_
.6T:+6W,%8AoqU)F*)FF@V'.iEb0<6EZee,Cij]3D'3@uCiOT9FCcR;%15^'6qBa?:d$i^Ho`BY
Ci"36Bl,1L4s27$4!u@aAS,k$ATMs6+<W`g-T`\&@:jUmEcZ>C.4.5$-t-q.FE2)4-8%J)4?G0&
1*B1b6qBa?:`q>B+@B$U+=nil4s2sf;G:"h=:GU0:II`B9Mdl5+=JX#<DlLe7T_)^/1)u5+>J48
:II`B9Md/\-o!0!+A,Et84?3K%15^'6qBa?:d$i^-mq;QDe)[QB4WGP-YRUDE&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0./2"/kSo-84?3K%15^'6qBa?:d$i^-ndV(0RHDf
6qBa?:amN6+u(34:II`B9Mc0*%15is/g+YBD/E^!A0>]&DIjr1F`2A5F!+7W+Co&&ASu$iDKH<p
EHF?)+C/Ac@Vg%,DffPU/kJN68PT^%%15is/h1FMA7T7jASu$iDKKq/$3                 ~>
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
zz=:zz,'sts newdManWin001''),(<<;._1 '' loadlargefeasiblecase loadtest001dict'
zz=:zz,'ionary loadtest002dictionary loadtest003dictionary loadtest004dicti'
zz=:zz,'onary testdictionarypaths''),<<;._1 '' makePathtests makePathtest01 m'
zz=:zz,'akePathtest02''                                                     '
zz=:416{.zz
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
