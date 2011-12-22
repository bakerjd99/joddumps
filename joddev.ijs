NB. JOD dictionary dump: 21 Dec 2011 16:37:11
NB. Generated with JOD version; 0.9.7; 4; 21 Dec 2011 15:13:07

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

JODTOOLSVMD=:'0.9.7';3;'21 Dec 2011 15:13:08'

JODVMD=:'0.9.7';4;'21 Dec 2011 15:13:07'

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
if. ({. x) e. OBJECTNC do. x dnlsearch__ST y else. jderr msg0 end.
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

jpathsep=:'/'&(('\' I.@:= ])})

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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
2)@370eb=)1*ALu2E2g9+>Gbs2]sk7+>GPm1GBq2+>Yer2]sn8+>k9"1E\D/+>kns0ea_*2BX_4
+>P_q0eje,0d&@s1,9t/+>Z##0ea_,0d&2*+>Yhs2BXe2+>k9"0H`7r0ea_.+>GPm1a"V0+>b2r
2'=n%1,C%0+>Pht0ea_*0H`)++>bnt1E\P1+>k9"1E\Y"0f^@21*AD.+?1Ju3$:4(2DH=7+>G_r
3$:"2+?:Q#0d&2-+>Ybq0ea_+1a"b#1,g=7+?2%t2'=b6+?1K"3$9q0+>Y\o0ea_,0H`:s1,0n0
+>l&"3$9t2+>Y,s0d&J!2DlU9+>bhr2]sq7+>GPm2)$.5+>bbp1*A>.+?(Dt3?U("3?U%3+>bhr
0eje,3$:%#1H6L:+>Z##0f'q.3$9q1+>l#!1E\M6+?:Q#2BXk"2)HF6+>tqs2]st7+>GSn2)6:/
2BXk5+>G\q2`Mp=+>ttt2]sk6+>t?"2'=b!2)?@7+>c#"3$:%4+>P&q2'=[t0fC.0+>Z##1a"P1
+>GPm2)l^:+>Y\o3$:+7+>P&r1a"Or1-$I;+>u)"3?U4:+?:Q$1E\Ir1c$77+>Yhs1*AG4+>b2t
0H`))+>Pht3$:%3+>GYp1GBq3+>kqt0f:(13?U=)1,U1/1*A>3+?(E"0H`)(+?2%t3$:";+>GPm
1c.Ks6V0j/20W_FDBLYV5uU-B8N8RMFCf]=+ED%4Eb0<'DKK</Bl@l3BlbD>F(Jl)Bl5&(F_u(?
Anc'mF!*%WA7]@]F_l.B0LAoA7:LOaAKYo1FD5Z2+Cf>#AOBNt:JOSdEb0*+G%De7DJXS@GA(]4
AKZ&5@:NjkFCAfM8OHHK:JO2R=_)5VFD5Z2@<-W9F(K0"+ED%*ATD@"@q?cmDe*EI<D?:a;b&We
ATDj+Df-\:Eb/isGT_*>G]Y'?DfQsm:IH=9F_u)=6rcrX<'a#r@:sX(8l%htA9Da.+EM%5BlJ/:
Eb/^&Bl%<&@rH4$@;]Us8OccQ:.cXMH#n(=D'3_7F`&=CATT&*F`M26B-;/6De<^"AKYf-@:X(i
B-8cK0d(CP+EqO;A8c[5+EMgLFCf<18U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+EqaE
A9/kF+Dbt)A7]9oBl8$2+=Lr=De(:>Ci<flCh61a8l%isDf9H58l%iS:JXY_+F5/EDKKH1Amo1\
+EqaEA91=g8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS
:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'U6r-d"
@;TR.DBNk<+DtV)AM.k/D.Oi2AT2'u@<?F.+Cf(nEa`I"ATCO7=%#hO<DlLhDIn#78l%htDf0B*
DIjr(ASc<.F`M;>+=LiBDf$Uh:IH<Z/ibO>.8W<085i&T=%#JNA8-+(CghU#A0>i"FD)e-ASc't
Blmp,+Cf(nEa`I"ATCU87TE>[F`M:@FDi:?DJX$)AKZ/-EcYr5DBNk0+DPh*/oY?5<DGhS77n\D
H#n(=D'3_7F`&=CATT&*F`M26B-;/6De<^"AKYf-@:X(iB-8cKDIIBnF!,.7F*&OGH#n(=D,jJ-
:e"Pe;G83PEb/isGZ@X8;cQq";G83SF_56"GZ@^43)rpI3$<<SG]Y'HE-,f4DBNG-A7Zl8+ED%1
ASkmfE[W\&03(t@3%7p1="n6#EcZ=F=(uP_Dg-7F8l%ht@WHC2F(KAn='%(lBl8'<Anc:,F<GC6
DKU1H8l%ht@WHC2F(KAn='%+tARfXrA0=rfDId[0F!+(N6m,rZDg-86E`Z=D6;gT\;ajT*ASbpf
FCeu*8l%ht@WHC2F(KB#A7TLp@:XFhEbTK7Bl8!'Ecc@F-uEdA.3N87DImisFCeu*F(96)E--.D
Bl8$2+EMX5EccGC@W$!uBleA=DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(q
E$/b,Ch7ZsDKTf;Eb0?8Ec,q@F`(o5F_)\)@:O(qE$0(>A7]dmA0>]&F*&OCAftVu@ruF'DIIR2
+C\bhCNXS=DKTf*ATDj$FCT-!Earp"DK]T3F(HJ4AftT"Ao_@&@r,XaEa`He@;K@i@qC"8+C]A"
@r#Xt+C\bq@;]Rd3Zr-Q+?_>"@q'Ie@q&k_@;]Rd+Cf4tCh@]sFCT,rFCT,0FDi:5DI[TqARlon
Ch%C#E,oN2F)#`,D/XT/F!+n-C`mq8Blmo/F)YPtAKYT*Df$Uh+EqaEA9/l%DIal2BQ%p5ASuQ3
Ci<flC`mV(D.RcuDfBu6Bl%@%@rH=#ATJti;]o[dCh7ZtEb/[$ARoUfBl[cpFDl2F+E(_(ARfg)
@rc-hFD5Z2+Eh=:@UjFi@<?'qDe*Bm@ruF'DIIR2+E(_(ARfg)@rc-hFD5Z2+Eh=:@UjFi@<?'q
De*s.DesK/DJ=3,@;KY(ATJu3ATo83De'u4Df9H5+E(_(ARfglEb/[$ASkjsFCT?&@<?(%+EV:.
+Co1rFD5Z2@<-W9D..L-ATAo*Bl%?jEb/[$AT`*/DJ=3,@;KY(ATJu:FD5Q*FEo!I@VTIaFE:r7
FD,]+An?4/Ea`I"+EV1>F<G:8+D,>.F*&OHGAeUNI3<'3Ch[a#FCfJ8@UX(]DI[6g+Cf(nEa`I"
ATAo6F`)7]+Cf414Y@jeF`_;;AS*&pCh.*e3&P5X@rGmhF!*bI6V0j/2'=;b@;TR,FCf]=.3N&:
A0<:<@;TR,@rGmh/9GHJF=A>S@:F%aF(AioH=gSqARo@aBl7K)-u!F7A18X8DKKH1Amo1\+D,Y4
D'4%@Eb$;/BleB,ATMs6Dg?)9A7TCaFD5Z2@<-W9DdmHm@rri(ATMs6Dg<IKATD6jATqg%FCf2s
EcP`.Dg#]5+CT)&+ED%(F`(_uDKI"1Cgh3sF!,(8Df$Uh+Cf>#ARoC_Ci=B+@r-()AKYMt@ruF'
DIIR2+D,>(ARoLcDKTf/ASu("@<?(%+CQC8DJ=*5AKYQ/FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5Rp
+C\c#ARloR<CoShBk2:,@<?R$Bk)7!Df0!(Gp%0M@<?4)FD56+A8Z4"BleA=DdmHm@ruc7Bl5&(
Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%A8Z4)ARTUhBQI`nEarcoF!,"-@ruF'DIIR2+DtV)AKYf'
F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DKB?,@ru:'FC]N2D0[7JDfTA2AoD]4
A8bt#D.RU,@<?4%DBL?<Ddt4=FCfN8Bl7QoDe!m#G][P9Ec#6,F!,:;DJ()&De!p,ASuT@+E(_(
ARfg)@;]TuBOtU_ATAo8AU&<-F_u)2ART+\Eas-$@<?(%+EV:.+CoV3E+Wg#AKYE!A0?):Blmp-
+D>=pA7]d(Bl7O$Ec#6,Bl@m"F_u)ADfTB0A9Da.F!,F1FD)e@DfTB0+EVNE@;[2R;aX,J+EM%5
BlJ/:Anc'mARo@_BlkJ.Bk)7!Df0!(Gp%$7C1UmsF(KB'DfB9*Eb00.ASrW$Bk)7!Df0!(Bk;?s
FCeusF<G[:G][MAFE1f"FD,]+AohO.FE1f"F<G".C`ltrEb/j0I=$AbFCf]=+D,Y4D'2eh=<M['
F`Lu'Ao2X#F_u)>AU&</DfT]'FE8QQDIIBn/9GHJF=A>S@:F%aF!,(5EZen8D/a3,B4c(&CJmSj
78cQL6U`+L+EV%5CERe3Eag.C+ED%5F_Pl-+=D8>F)*.8Eb/fmBle'1ATW'8DK?q4Eb/f)A8-+#
06V8MF_t\4F)YPtAKY])+C]V<ATMI(AS#CdF),T+DKU25H$!V=+D,Y*AKYo/+Du+>+=D&FDIk1<
Ch[d0GT_0JCisT+F(TH(ARoLrCNjK1Eb0?8Ec,q@Ao_Ho+Co2-CG0jLCisT++EML1@q?csDBND1
H"D%>AoD]4GA1q;F*VhKASlL$ATVs(FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9A79Rg
@UX=h+D,>(ATMKqFC])qA8bsiATVEqATJu5F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@m%F_PB-
@rc-hFCcS-F_PB-+CT=60fC.`H$!U?F*)G:DJ+#5Df-\=F`;;<Ecbl'+A*btH#n(=D0'?4Bk2:0
B6@p!F!+n4+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)3Zr'XBk2:0+DEG^+Bot$F_PB-GT\db
2/$oLFE;#4@rH7.ATDm6+E1b2BHUP5+EM+5@<,duDfTnAFDi:DBOr<*Eb/ioEcP`%+D>\7F<G16
Ec#N3GB.D>ART%aATVL)FE8R5+C].sC`mY.+D,b4C`m\*FD)e/Bl%?'DIIBnF!,(5EZfRHBlmop
@Vfb#H"h>DEbTW,@:F%aCh[d0G][M<FE8R5+C].sC`mY.+D,b4C`m\*FD)e5Bl8'<+D,>(ATJu+
DfQtEEbTW,@:F%eFEqSAGB.D>ART%aATqj+FCfN8F!,F5Ec#N3F(oQ1F"^sDFE2))F`_29+E(j7
@3B#q@r*9+Aft].Cht55@<?0*Anc'm+DtV)ATJu+DfQtEEbTW,@:F%eFEqV>A7fb#CM%L*D..O-
+=LuCA8#OjE%)o>Df'?"DIal+Bl7K)@;]TuF)YQ3DK?q0Ec6/CATAo3EZf=3Ao_HkA7]drDe*Nm
CiEp!F)Yr(Gp$d3CiCM/DfQsm:IH=LDfTB0C2[X$AnH.-Ec,q@8l%htDe<T(Eb0<7Cige6F!*1[
BkAK/F^nomF)tr9C`m/(A0<QKDffZ(Ed)5=ASQ-oDf0Z>Ec*!l:IH=DDBNt2F*2;@+DGm>0d(1B
+EM[8@qB_&Ap%o4@;]Tu0Hb:UBOu4.Bldj#E+*j%F(K<3FCB&t@<,mmH=_.?FD,5.E+*j%+EM+5
@<-I(Df-\-BOPpi@ru:&+DG^9@r-!jCLq%!D/a$.D/aP=FD,5.@s)g4ASuT4E+*j%+CT=6@3A/b
F(96)E-*47Bl%?tC1h+"+DkOsEc3'm+EM%5BlJ/:Ao_g,+D#(tF<GdADId[0D/=91@;BEsCi<`m
+EM%5BlJ02FD#0,+DkOsEc3(BAU&;>-t7IDATK:CAo_g,+D#(tF<GdADId[0DIn$&@rc-hFCfM9
@3BH!G9CF1@ruF'DIIR2DIn$4AS5Of@ru4$ART[lF!+m6DIn#7A8,OqBl@ltEd8dGEZfC6B5)F/
ATDi7@;[3!G][A3F<G+.@ruF'DIIR2DJWa%B6/0+F*&O6@<6-m+DtV)AKYf'F*&O5EbBN3ASuU2
DJsZ8CiX*+@rH7.ATDm6+Du+?DK?qAFDl22A0><%+C]&&@<-W9FDi:<Bl7KjEZfI8G]Y'KAT2[$
F(K62@<?4%DKB];ARoLs+CQC1ATo8=ATMr9F(96)E-*4FF(oN)+A,Et+Cf>-G%GQ5Bl@m1De*d*
ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;@)@:O(oE+*6fA7]joEc#N.ATJu.Afu2/ATD?)BlbD<
F_56"@qfLlF<G19AS!!*E+*6f+E)-?FD,5.@UWb^F`8IHDesQ5AT2("BQIm!G%G-!E,6Y8Aftr!
F))nBBln#20dh#bD..I#Bl7Q+F(K0!@ru9m+EqaEA9/kF+EM+*+Dbt6B-:`'@s)X"DKKi.Ao_Hk
A7]e%ATW'8DK?q/+E1k'+ED%%A7]d(Ao_g,+CTG%Bl%3eCh4`-E-,f4DKBc>FE;PBEb0;7DdmHm
@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%E-685Bk([l@s;s-FCfM9E-67FA8,OqBl@lt
Ed8d<De!p,AStpuBl@m/FE)GAFCcRk9L2$785DoI78b6[+EV:2F!,X;Eag/3ARo@aBl7Km+CoV8
Bl7Q+AU%crF`_>9DK9<$A9)6oBleB-EZee.A0?#4Eb/ltF*(u6+A,Et+Co1rFD5Z2@<-'nF)ki0
@;TRfBl%@%D/XT/F!+n/A0>o(DIIBnF!+7W+D,>(ATMm'F*(r,@rua&F*)>@AKYetFCfN8+C\bh
CNXS=@rc-hFCeu*@X0(EE+*6lA1;S2FE_qQ@WHC2F(KB6ATMs7+CT.u+EM+9F!,R<AKY&U=!1sm
Dg-86EcZ29Bln$/AS-"&Ch[u6FE_XGA7]RkD/"*'EZeh"Cgh3kARlp(F`)7]+C].04Y@juE,961
BQ@Zr+Cf50ATMs)DK]`7Df0E'DKKr2FE8RIE$079AKYK*EcP`/F<GC<@ps1b+D,P4+EDUBDJ=!$
+EV19F<G(%F(KE7Ddd]sBk]OaFDi:1F(8ou3&Mh!AT2[$F(K62@<?4%DKTo/@<?("F^f0$@s)a$
@<?(%+E2I4Ch[B%F(96)E--.DFCAWpATi!.Ao_HoEb0?8Ec,q@Ao_Ho+C]V<ATJu4DBO+@CisT+
+E)9C<DGn(E+*j%GB.,2Ch[cu@<-R4@;p91FD,5.Ch[cu@<*K2AT2[$F(K62@<?4%DBNk0+DbJ,
B4W2X+E(_(ARfh'+DG_8D]iI2F(KB+ATJu4Afu/)EbTK7+Dbb0ATN'9Blmp#C3+T>Blmp-+D,>(
AKZ)5+E2IF+Co1rFD5Z2@<-W9A8-'q@ruX0H$=IV@WHC2F(KB4ATW'8DK?q/+Er$R+C]A0GB7>9
+D,Y4D'381@;0Od@VfTuDfBf4Df0U                                             ~>
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
1,Uj11,^72+>G_r1*A>-1H7*31,'h++>Gf/3&r*91E\Fq1GCg33$9t!1,h'M+>Ghu1*AA30f^@3
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
@V'R@+>b2`6t(1K3Zp14+@KdN+>PW*0d&2.3\`EO0K0>2:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij
+A,Et+B2-49N*'#F_PZ&+D>J1FDl2F+ED%7ATTsU:LeKb@V'R&1GLF'1,(CA%13OO$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,:d2+@KX[ANCqi0d'8%F<E=m
0K:101-.0J3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS
1,:g3+@KX[ANCqi0d'8%F<E=m0K:101-.0L3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/iYI;+<X!nBl%<&:3CD_ATBgS1,:j4+@KX[ANCqi0d'8%F<E=m0K:101-.0M3\`Gu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,CU,+@KX[ANCqg0Ha,/Fs&Oo
0K:100fh'J3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS
1,CX-+@KX[ANCqV1*B%t@N[E[0eje*2EEQH3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/iYI;+<X!nBl%<&:3CD_ATBgS1,C[.+@KX[ANCqV2'>A"@N[E[0eje*2EEWJ3\W>s$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/iYI;+<X!nBl%<&:3CD_ATBgS1,C^/+@KX[ANCqV2BYJ#@N[E[
0eje*2```M3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>t?3ARZc;0JP:)0fM-M0KLsJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp='7V-$O1,(F;+>Gf92)REL2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp4$+@KX[ANCqm+@]pO+>PW*0d&/03\rKO
1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
2]tS$@N[E[0eje)3BAuQ3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+?1K5ARZc;0JP:)0K;*M3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3ZpC)7V-$O1,(F;+>GQ21,M$H2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=WiD.7's3Zp@(+@KX[ANCqn+@]pO+>PW*
0d&2*3\`HP1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU3$:\%@N[E[0eje*0fh*L3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<
+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+?1K5ARZc;0JP:)0f_9M2**TL$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqo+@]pO+>PW*0d&/13\iHO
1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A
+?:Q6ARZc;0JP:)0fD'I2EENN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&
+AR&r@V'R@+>GVo+@KX[ANCqg0H`hr@N[E[0eje*1-.*K3]&c&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+@]pO+>PW*0d&/13\rZT1-#[K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q
7V-$O1,(F;+>>f:2)@9M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./heCj6?R!YA0=Wi
D.7's3Zp.7+<X'\FCdKU0f1"BARZc;0JP:)0f1pI2**QQ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg2]tS$@N[E[0eje*3'&cM3\`W%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.:+@]pO
+>PW*0d&/13\iHO0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*!.+@:3bCh+Y`F_tT!
E]P<t3$9>3@<?'A+>Ghu7V-$O1,(F;+>>f:1,CsG2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./heCj6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0fU:FARZc;0JP:)0f1pH0fh$D$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<0H_K)F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg3?Ue&@N[E[
0eje*0fh!C3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO<+<X!nBl%<&:3CD_ATBgS
1,0mo6t(1K3Zp7%6#^ie1,(F;+>PW31c7<N3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/hnIk6?R!YA0=WiD.7's3Zp15+<X'\FCdKU2]th'Gp"jr0eje*1HIBL3]/W!$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp.5+AH9i+>PW*0d&2*
3]&NO0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P<u1a!o/
@<?'A+>GYp9jr;i1,(F;+>GZ50JY[H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk
6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0f'qH@<itN0JP:)0fV3L1cd?O$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg1a#M$Gp"jr0eje*1cdEL
3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K
3Zp.6+AH9i+>PW*0d&2-3]&WR1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!+t2D/Ej%FCeu*+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<0d%T*F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg1a#M$Gp"jr0eje*1cdKJ3\rGs$49Np/g+)<
F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./hnIk6?R!YA0=WiD.7's3Zp44+<X'\
FCdKU0f1"I@<itN0JP:)0f;!G3'&`J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*
F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqg2BY_&Gp"jr0eje)3'&oS3\iZ%$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp.8+AH9i+>PW*0d&/13\`HP
1,B7E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*$/+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A
+>Gbs9jr;i1,(F;+>>f:0fD'L2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)3
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO=+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.8+AH9i+>PW*0d&/13\rTR1bf=E$;No?
+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<0d%T*F_PZ&+AR&r@V'R@+>Ykt
+@KX[ANCqg2BY_&Gp"jr0eje*3BAlO3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO=
+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp.8+AH9i+>PW*0d&223\`KQ0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fU:M@<itN0JP:)0KD0K
2``cQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp.:+AH9i+>PW*0d&/13]/lX1GfFG$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.:+AH9i+>PW*0d&2-3\WEP0JEh@$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f^@N@<itN
0JP:)0ebXB0fh!C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@
+>k8a6t(1K3Zp13+AH9i+>PW*0d&2*3]/`T2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*'0+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,'hF@<itN0JP:)0etdH3BAuW$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp13+AH9i+>PW*0d&2+
3]/lX1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P=&+<X'\
FCdKU1,'hF@<itN0JP:)0f;!J2EEZP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp13+AH9i+>PW*0d&213]&NO1,91D$;No?+B*Q,FCf;M+A,Et
<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0Ha(u
Gp"jr0eje*3BAiR3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp15+AH9i+>PW*0d&2.3\iKP0K0=G$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b
@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh1*B;"Gp"jr0eje*
2**NN3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f'pp
6t(1K3Zp15+AH9i+>PW*0d&2.3]&]T1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$
A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B;"Gp"jr0eje*2**QP3\WK"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp15
+AH9i+>PW*0d&2/3]/]S1H>dL$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1*B;"Gp"jr0eje*2``WI3\`N"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp15+AH9i+>PW*
0d&203\WNS0f]RJ$;No?+B*Q,FCf;M+A,Et<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+
F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh1*B;"Gp"jr0eje*2``WP3]/]#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+AH9i+>PW*0d&/03\r`V
1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+>P_q9jr;i1,(F;+>Gi:2*!]O2@9cu:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)3
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+AH9i+>PW*0d&213]/oY1GK4D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>Pbr9jr;i
1,(F;+>GQ22)I?L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU1,L+J@<itN0JP:)0fM-N1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<1*@]+F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh2'>V%Gp"jr0eje*0KLsF3\iDs$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp18+AH9i+>PW*
0d&2)3]&TQ1,K=F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0+@:3bCh+Y`F_tT!E]P<u
1a!o/@<?'A+>Pht9jr;i1,(F;+>PZ42)@9L2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/i"Ol6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=M@<itN0JP:)0ek^F0KM$E$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]th'Gp"jr0eje*
0fh0L3\`T$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!nBl%<&:3CD_ATBgS1,g<u
6t(1K3Zp1:+AH9i+>PW*0d&2.3\r`V1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*'0
+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>Pku9jr;i1,(F;+>Gf91bh$G0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./i"Ol6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU1,pCN@<itN0JP:)0f(jI
0fh'J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1*@]+F_PZ&+AR&r@V'R@+>Y\o+@KX[
ANCqh3?V%)Gp"jr0eje*0fh-O3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO>+<X!n
Bl%<&:3CD_ATBgS1GL!p6t(1K3Zp1<+AH9i+>PW*0d&2+3\`QS0e`qA$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E];4DBL\g0eje*1-.0H3\WN#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>b35
F`&<W0JP:)0f(jJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,F_PZ&+AR&r
@V'R@+>Y,_6t(1K3Zp7%8p,"o1,(F;+>GZ52)mWO2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./i+Um6?R!YA0=WiD.7's3Zp7%+@KX[ANCqj+A-co+>PW*0d&2-3\WBO2)bjL$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A**1+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1a#D5DBL\g0eje+
0KM!G3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+?(E8F`&<W0JP:)0K;*I2EE]N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1E[f,
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp@(8p,"o1,(F;+>>c91bh$H3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./i+Um6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg0d')2DBL\g0eje)0KLmF3]/W!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibO?+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GSn
8p,"o1,(F;+>>K11,1gD0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./i+Um6?R!YA0=Wi
D.7's3Zp.2+<X'\FCdKU0ejeCF`&<W0JP:)0JGOD3BAiL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+A-co+>PW*0d&/03\rHN0K0=G$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f1"FF`&<W
0JP:)0K;*M0KM!J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp.6+A-co+>PW*0d&/13\r`V1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*-2+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,L+KDg!6Y0JP:)0f1pG1cdHK$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<1a!o-F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp17+AQiu+>PW*0d&20
3\WHQ0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*-2+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU1,U1LDg!6Y0JP:)0etdE0fh!E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<1a!o-
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp18+AQiu+>PW*0d&2+3\`TT0f]RJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,g=NDg!6Y0JP:)0etdD2``fS
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp1:
+AQiu+>PW*0d&2+3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`
F_tT!E]P=!+<X'\FCdKU1,g=NDg!6Y0JP:)0etdF0KLmJ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1:+AQiu+>PW*0d&2+3\iBM2)P^J$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,g=NDg!6Y
0JP:)0etdG1-.6H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@
+>t>b6t(1K3Zp1:+AQiu+>PW*0d&2+3]&ZS1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*03+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,g=NDg!6Y0JP:)0etdI1HI6K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW*0d&2.
3\iQR1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU1,pCODg!6Y0JP:)0etdD2```T$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.
F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg+@KdN+>PW*0d&/03]/TP1,91D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>G!,ARci<0JP:)0fV3O1-.*D
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqj
+@KdN+>PW*0d&5*3]&fW1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*03+@:3bCh+Y`
F_tT!E]P<t1E[f.@<?'A+>b3/ARci<0JP:)1,(aH2EEZS$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<2BX,/F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp='6tKjN1,(F;+>GW42)dQR2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./iFgp6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+@KdN+>PW*
0d&2)3]/oY1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P=!
+<X'\FCdKU0eje=ARci<0JP:)0f1pI2**EH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
2BX,/F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.4+@KdN+>PW*0d&/13\W?N0JNnA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0esk>ARci<0JP:)0KD0K
1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp.4+@KdN+>PW*0d&2.3\WNS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU0esk>ARci<0JP:)0f;!H3'&cQ$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<2BX,/F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.8+@KdN+>PW*0d&2)3\rHN0Js1E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@E
ARci<0JP:)0etdI2EEQL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<2BX,/F_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqg3?U_$@j!N\0eje*1-.9P3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOB+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.;+@KdN+>PW*0d&2,3\rKO1GK4D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*34+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN
1,(F;+>G]61GV!J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./iFgp6?R!YA0=WiD.7's
3Zp.5+<X'\FCdKU0f^@EARci<0JP:)0f;!I3'&iO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<2BX,/F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg3?U_$@j!N\0eje*2**NO3]&]$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOC+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>PYo6tKjN1,(F;
+>GZ51H%9M1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./iOmq6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqh0d&kq@j!N\0eje*1cdBH3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOC
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>PYo6tKjN1,(F;+>G`70f(jE3!rJX;cI+=De*s.DesJM
0ht%f.V`m4FDl)6F!,NU/KeeHA9;a.Ci^_<Df^#>Ec5H!F)u8?/e&-s$;No?+ED%8@;0U%GA(]4
ATMg!@q?)V-oiG31bgF%0d$o4%15is/g+kGF*2M7+C\c#AKVEh@rGk"EcP`/F<Dr?@<6!-%13OO
:-pQU@rc-hFCd+>DJ=3,@;KY(AKYD(8l%htFDl)6F!,C1C1Ums%15^'7!*?cCi`rtC2[Wi4ZX]q
Df0-1+=CT4De*s.DesJB+<VdL+<VdL+<VdL+<VdL+AP6U+Dtb7+EVO?Ci^_;@VTIaF:AR*0d/S5
-8I"m@rc-hFCf3*A9;a.Ci`rj8l%isDf9H5+A,EtFDl)6F"BpZ6uQOL+<XEG/g,+AF)rIFASbs$
@;]Tu8l%ir%16QeBl%<pDe(UX:-pQ_@WcC$A86$n+<Y_W/KeMFBl%=$+CQC)F_kl>+Cf>,D.RU,
ARloU:IH=ADdd0!FCfN8+EM%5BlJ/H+:SZQ67r]S:-pQU6?R!YA9/l%+Cf>,D.RU,ARloU:IH=A
Ddd0!F(96)E-*]T;KZk"GA2/4+=M8I.1HVZ67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<
+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4
@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(O
ASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:ARP67sAi$;No?+<Vd]+ED<A-Xq44
Ch.:!A1&KB:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67sAi
$;No?+@BR\ART\%3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5
DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)o'0emNRGqh,u/Kf1TA79RkA0>K&EZdtM6m-GeEc`FGD]h_fDKU1H:K%]0%16T`@s)g4ASuT4
-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#
AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2
@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+DPh*+C]J-Ch+Z2FD5Q*FD5<-+CT.u+Eh=:
F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$;No?+EM+9
+EhU4%14ItDe+$&EcYr5DBN\4A7B[qCh.$nF=04414(WG:IJ5X6k'K<De*="Bl%<j@<?'D3ZqjI
Cij]3D'3qAFCB$*-RT?1C2[WlF_PZ&@r?BO3ZpUIC2[WlF_PZ&@r?At$4R>;67sBpDI[]uD.RU,
+C]J-Ch+YsDIal2@<Q3)/KenQF*&O6AKYN%DIjr"AS,k$AKVEh:-pQUF(96)E-*48ASu("@<?4%
DBO%>+DG_7F`M%9BOtU_ATAo%DIal"CghC++A,Et<_Yt)D..NrBFP;@:IJ5X6p3RZC2[WlF_PZ&
@r?BMC2[WlF_PZ&A79Rk.3L#n+>PBo8l%iU9gfEtFDYu5Ddso/F`\`R8l%iU9gg?<$4R>;67sC%
ATT&5F`_SFF<G10Ch7Ys$;+)^7S-9B4ZX]5C2[WmDf'?&DKKH#/no'A-OgDT:IIlP5t"[@;cH4X
9LV**+DPk(FD,`,E$/n7@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>UM'p:IIZD9LTBt:-pQU@UWb^
F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1rFD5Z2@<-'nF!,O6EbTK7+Co2,
ARfh#Ed8*$8l%iC8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ/gjRb;C="WCi<g)Ap@Zi8l%i^
?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6q0aA71BS5$>=!ZA3Dt$:-pQU;gEG+
ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH33/5/MB$>=!ZA3DteART+#+=JU467sB]ATDj+Df.TY-S-Z\De+$&EcYr5DCI+a
+<X!nBl%<&:3CD_ATBgS-S-Yi3biSD@WcC$A7KM!.4chh+@KX[ANCq]/8B*6@WcC$A7T+jALT0(
7L]]GD/XQ=E-67FBOtU_%13OO:-pQUFEMVA+E)-?GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+CoV8
Bl7Q+@rH4$ASuU$A0=K?6m-;a@:TfSBOa1dBOtU_/12i++Z_G7.3L>m/2AGD7L]\6$;No?+D58-
+E2@4E,ol,ATMp2EZfF5EbTK7%17/>3Zoh*4"qd4.=4*:+>b3RATT%BC2[X%Eb02;%13OO:-pQU
D..-r+A,Et+Cf4rF)to6%16`23ZpLF+=CoBA8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEs
C2[X*FD5P=+:SYe$;No?+D58'ATD4$AKYW+Dfp#?+EqOABHUf'D/Ej%FCeu*BOtU_ATDi$$?J?k
+EJYV+?L\o4>J-T7O]H2-8%J)/0H?h/jMHG1*BpZ->d1,ALT&T4s4JI$4R>;67sBhE,]B+A0>i0
F*&ODEc5H!F)u8?+EM%5BlJ/:/Kf"QAS,Y$+D>=pA7]cj$?J?k+EJYV+=Jui9L^HR/0H>q4"qd4
.=4*:+>b3RATT%BC2[X%Df^"J%17/>3Zr*G+=nXV%13OO:-pQUF('6'+Dbt)A0>r'EbTK7Et&It
D/XQ=E-67F-Z=-LE-67FAnc'm+Dbt+@<?4%DE9-S$7KsY3ZrN_85E/`+EJtSGB.D>AKZ&-Dg-//
F)rHr:IIlP5t"[@;cH4X9LTBtF)>i<FDuAE+EJZLEbTW,+EM47GApu3F!+(N6psUF<)Q:S<E)CT
7S-9B%13OO:-pQUF`:l"FCcS(F_PZ&+D>J1FDl2F+>"^WFDl22A0><%+E2.*Bl5&8AU&;>D.-pp
D[d%G:IINL8PDNC8Q/Sa;HZ.D+=Js+0H`,"HTF211a$FBF<Dr':IINL8PDNC8Q/Sa;HY@V$;+)^
6<-TN6qBmJ<)6Cp4ZX]X:IINL8PDNC8Q/Sa;HYP!1*]I^.4f.D@:TfS1a$a[F<Dr':IINL8PDNC
8Q/Sa;HYA/1,V-c:IINL8PDNC8Q/Sa;HXG9%15is/n0*JAKZ&.H=\4;Aft_tDImisFCeu*E,8rs
DKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chh@rH4$ASuU$A0>r'EbTK7+C]V<ATK4.$?L'&
F`_SFF<Dr':IH=8Df'?&DKKH#+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1r
FD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*?rD/aN,F)to'1,2Nj/h1=QBl%<pDe*?rD/aN,F)to'
+<Y_W/KeMFBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7/g(Kr67rU?
67sC(ATD6gFD5SQ$;No?$;No?+@:3bCh.T0@3B&uD/aN,F)to'+A,Et+Dbt)A0>r'EbTK7/g+&7
DBO.;FD)dFEc!64:-pQ?:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<VdL+AP6U+E(_2@;0U%
8l%h^:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,Oq
Bl@ltEbT*+$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q+<XEG/g,(OASrW$Bk)7!Df0!(
Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:(c0/g(Kr67sB'+>G!ZD'138F_PZ&C2[WmDf'H6ATMp(
A1&KB:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1/g:/g(Kr67sBJ
@<Q3jFE9JM:-pQ?:-pQU:2_7dEcQ)=+Cf(r@r#drB.aNd67sBYAT;j,Eb0;7F*(i.A79Lh+A*bq
Ec5Q(Ch4_tDIal9Anc'mF!+n%A8c>m:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/IG6>/g)i-D..]F3$<6QDIIBn061W?De!3tAKYK$D/aN,F)to'+EM%5BlJ/:FDi:BDf9_?De:,,
De'u!A7TUr$;No?+>GT_AR[>N+E_a:+=LuD@<?1(AT0(@FDi:CBQ&);E,Tc=@:F%a+EMXMCh4`$
Bl%?'E+*j%EsbZ//g)l'An>F*3$;^LBl8!'Ec`EOBkhQs-Qli.A7]9o@:jUmEZf4;G%ki,+A,Et
+DG_8ATDBk@q?d)D]ib/De'2M67sB80lCoQ1,L+qATMs)A0>f.+Dbb0Fa+6#Eb065Bl[c--[oK7
A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:$=e!aF`MM6DKI!K@UX=h-OO@%@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8
-Y[=6A1%]k:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"
ATJ2sDf7d"+FPjbA8,Qs0FD`/+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT6.:-pQUB4Z0-
C2[W*@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?/,D/a<0@j#DqF<Gua
+D5_6+=CW@Bl%<pDe(4&$;No?+EM+9+EhU4$7BS,A9MO)F(oQ1+DPh*@WcC$A7KM!-TsLGHS.od
6rm#M$>OKi@WcC$A7T+jAN`'s@;Kb%EbTA5FE;P4D/^jM$>OKi@WcC$A7KM!4ZX]L3biSD@WcC$
A7KM!$49Np/g+kG@rc-tASuT4@WcC$A0>;uA0>r%G%DdJ+Dl7BF<G%(+CoD.AKYGnAoD^$+::k1
/g,4FEbTK7+D58'ATD4$Bl@l3FDi:9DKBr@AKYYt@:Wqi+CT.u+Cf4rF)rHr:IJ5X6m->TFCStk
8l%iU9gh-*-u*[2@WcC$A7KM!4)/\E@WcC$A7T+jALS`M0d&5#I7d:'<_YshFDYu5Ddso/F`\`R
8l%iU9gg?9$;No?+EM+9+E)CEE-67FAnc'mEsbN86q0aA76N[S-YdR1/no'A-ONU8/g*b^6pa14
4ZX].-YdR1@UX%)Bkh]:$49C$6qgBB6rZTR<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$
B4YslEa`chC2[Wf-S.kc6q0aA71)dV/g+V3@r$4++E(j7A8-+,EbT!*FCeu*Anc'm+E2.*@qB0n
Bl5&4F`\a:Bk)7!Df0!(Bk;?.F(96)E-*45Bl[cpFDl2F$;+)^6qL<V;Fs2T<(02E8PDQ93Zr0V
@<?1(AT/b?+tb6A6W,9_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1
C+1]+:IIZD9LT9q:-pQU8l%htF*VhKASiQ(DKBo.Cht5?BlG2/DBNn@F<G+.@ruF'DIIR"ATJu&
Ch[Hu+Co2,ARfh#Ed8!a:IITB;cHXd6<-uV:JP(b:d$i^C2dU'BQIa(+=CoBA7$]8-mpWS-Qlo4
@<-F3@N]E(A9MO)F(oQ1.4ci!H>.=G$;+)^6qL<V;Fs2T<(Tk\>"MOR3Zr0V@<?1(AT/b?+tb6/
9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1]+:IITB;cHXd
6<-uV:JP(b:^RPCART+43[[Zh/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:-S.q\$>=!ZA3DteART+#+=JU467sB]ATDj+Df.TY-S-Z\
De+$&EcYr5DCI+a+<X!nBl%<&:3CD_ATBgS-S-Yi3biSD@WcC$A7KM!.4chh+@KX[ANCq]/8B*6
@WcC$A7T+jALT0(7LF3RDfp/@F`\a>ART*V$;No?+EVaHDBNk0Afu;2Blmo/F)YPtAKYr4ATMF'
G%#K,Df-\.F`M26B-9fB6m-;a@:T^Y@m)kdART+#-R^tu3]&Q?+>>/o9L]?r:-pQUB4Z0-E,oN/
Ec5H!F)u8?+EM%5BlJ/:/Kek@@<Q3)Df0B:+D>=pA7]d(@rH4$ASuU2$?J?k+Co&-BPDR"C3*m*
BlJ/:-o!e;+>PBm3]\B?+D58-+=CoBA8lR#E$ku":-pQUD..-r+A,Et+Cf4rF)to6$>2L_+?MV,
-YdR1Df-\4De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl#.>$49Np/g+YBCi!ZmF<G4:
Dfp"AA7]^kDId<rFE8Q3A7]_$4ZX]uA7]_$-8%J)B*nueD/XQ=E-67F-Y%(3E,oN2F(oN)+>,9!
+=@Lk67sBkATqg%FCcS-Ec6)>+D>=pA7]e&+:;dF3ZqsEGA(]4ASQ9rEbTK7-8%J)HTE?*+?k-5
+>P'PATT&-$49Np/g+YBD/aN,F)rI4Cht53Df0)sE+NotASuT4GAhM4F!,17+D"tkBHUr.Dfp"A
-t+6.Ecl80BOu35$=e!bAN`'s/0K?n5WWCnD/a5:4s27%I4dcGB6%r?-8%J)B.4rT/g`27+Co&&
Es`7L67sBjDf&rtDIjr(ART+\EZee.A0?)7Eb$;'AS,XoBln'-DK?p-F$2Q,F!*"V4!6'sBHSiY
+Cf>#AI8c>67sBhE,]B+A0>i0F*&ODEc5H!F)u8?+EM%5BlJ/$F$2Q,F"AGEATqg%FCf3.@rc:&
F<Dtd4"qd4.=4*:+>b3RATT%BC2[X%Df^"J$49Np/g,1GD/XT/+CQC)ATo8;ASkjiDJ=!$+ED%(
F`(_uDKI"1Cgh3sF!+n'FCfJ8$;No?+CT>4BkM=#ASuU2+>"^XBOtmu+E2@4F(K6!AKYE!DJsfA
+Dk[5$?J?k+D>7-/0H;n+?_>14YAB14ZY5Z3[Z%[BOPdkASuL0+EIks:-pQUF('6'+Cf>,E,oN2
F(Jl)Ci<`m+EM%5BlJ08$?L'&F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@m13[Y7_F$2Q,FDj]G
;cFl\.3NhTBlmo/F(fK9E+*g/+A,Et9M[rB<(0_b7S-9B$?L'&F`_SFF<GWIGB.D>AKZ&-Dg-//
F)rHr:IITB;cHXd6<-uR6q0aA71'As67sC'E+EC!AKYK$D/aN,F)to'+A,Et+Co2-FE2))F`_>9
DBLMREb065Bl[d++F7X6Ch7Yp:-pQU@;]TuE,0c6E&':'AU%c/Df-\-Df'?"DIal2BOu!r+E1b2
BF8f'H?*S9Cgggb+EM47GApu3F!+(N6q0aA76=+;6psUF<)Q:S<E)Oc:0L4c$49Np/g,:UA79Rk
+C]J-Ch+Z%BleB7Ed8cZ+EMXCEb/c(@<3Q1Cgh$q+EV1>F<GF/@rcJp8l%iA<CokP84c`Z:Jt=Y
3Zoh*4"qd4.=4*:+>b3RATT%B8l%iA<CokP84c`Z:Jt=C$;+)^6<-TN6qBmJ<)6Cp4ZX]X:IINL
8PDNC8Q/Sa;HYP!1*]I^.4f.D@:T^%+E2IF+=BcW6pamF9LMEC;cHOj=XQ9d2*4E+6pamF9LMEC
;cHOj=UGL267u_mFCcS9BmO>5De:,)ASu("@<?'k+E2.*Bl8$(G]Y'L@rc:&F:*)+Dfp/@F`\`S
,!$ri.4chhF(96)E-*43H$!V=-OOp3Dfp/@F`\`R8l%ht@rH4'Eb0<5ARlomF_PZ&+Cf>,E,9*-
AL@fl:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEschr+E)1:+BosE+E(d<-OL2jDe!p1Eb0-1
+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,$=\-lCh.:!A7TCqFE2))F`_>9DDEqA
67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%;h$4R>P
De!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eODe*="Bl%<?3B:Fh4ZX]55s[eODe*="
Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OODf9PW
3ZqsIA0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1%14g4EccCG-ZsB=@<?'q
De*]nDJ<]oF*&cP+<VdL+<XEG/g*GG6$.-UF(dQo3=Q<)$?C21-Xq44Ch.:!A7KOpE,oN2F(Jl0
+<VdL+<VdL+AP6U+@/:ZFE1f2BK8(5%17,s+=CW@Bl%<pDe*s.DesK)Df'H6ATMp(A1&KB+<XEG
/g*GG6$.-UF(dQo3=Q<)$8EZDFEAWQF`:l"FCf3*A7TCqFE2))F`_>9DC6PL+AP6U+@/:ZFE1f2
BK8(5%14g4EccCG-ZsB=@<?'qDe*p-F`Lu'A9Da.F!i(Q+<XEG/g*GG6$.-UF(dQo3=Q<)$8EZD
FEAWQEb0&u@<6!pDe(4<+<VdL+<VdL+<VdL+AP6U+@/:ZFE1f2BK8(5%13OO:-pQUA8,OqBl@lt
EbT*++E)41DIm?$Bl5&6ASbpdF(K*)A.8l@67sC!A0?:QDf9P'$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF67s`sF_PZ&
C2[WsC3(L?F"Jsd@WcC$A90DHE+EC!ATJu&+F7a@+D,>(AKYK$DKK<$DJ=!$+A,Et+Cf4rF)to6
/g(T1:-pQB$;No?+@:3bCh.T0@3B&uD/Ej%FCeu*8l%htCi<`m+EM%5BlJ/H+B!?"+EqOABHS^D
D(,o$:-pQB$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU
+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f
:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeY
F)rIGBPDN1F(96)E-)Nr:-pQU%15is/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*
D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67sAi$;No?+@BR\ART\%3XlEk67r]S
:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?
+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0ktiK0JX(E:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU0emEcDD4!l/KeJ4A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3C2[X*F(KB%
Df00$B4>:b/no'A%13OOEb065Bl[c--[oK7A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%16T`@s)g4
ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEo
ATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1r
FD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,
EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fnC2[X+ATDj+
Df.^!+=o]1HV.(%<_Ysk$4R>;67sBqDe*QsF'j0!G[G\JH>.=@Bl5&4F`\a:Bk)7!Df0!(Gp$O3
Bk;0)A8-'q@ruX0Gmt*Q:IITB;cHXd6<-uV:JP(b:d$ieC2[WsC3*`0/1;ku?RHt+BOPq&F^cJ.
De+$&EcYr5DCI+a/p_5N-OgDK9M%ZJ:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(
HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL%15^'6psUF<)Q:S<E)Oc:0L4c4ZX]O9M%ZJ:dJ&O/4r]+
6qL<V;Fs2T<(Tk\>"MO"$4R>;67sBnASu("@<?''8l%ht@r,RpF!,O6EbTK7Et&Ik@r,RpF(KDU
3ZpLF-YdR1+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!,49A8c?5%16ig
A7fOlATL!q+=K?-+C?iP+DkP&AL9S`C1D'gF)to6%13OO:-pQUEb/Zi+Cf4rF)rI9Bl%@%+C\bh
CER&'A0?):Blmo/FDi:JBlG1($7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3T
De*HoCh7Ys$4R>;67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3R
ATT%V3[\Z\A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1
+u(3]EaoOc%15is/g,:UA79Rk+D,>(ATJu.DBO"=F`Lu'+F7a@+DG^9@;KXhDBKAq7S-9B;a!/a
-u*7.@<6L$F!*"VHS-Ks+EMR5.3L/g/j:C?-SB+JF!hD(0Ka)gA7T+j+<VdL+<YuNAT2Ho@q?c2
4tq=Q8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X(FDl22A79R&H?*S9Cgggb+=KE.HU^S#
78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA7TUfA79R&+<YuNAT2Ho@q?c24u.IS8PDQO.6C-t
6psUF<)Q:S<E)Oc:0L4c%14dOC2[X"@;BFb@<<V7H?*S9Cgggb+=KE0HU^S#78kWs8l%iC8Q/Sd
8O?EV8P`)b8Pfj'0Ka)gA9E!.Ch-sr+<YuNAT2Ho@q?c24u@UU8PDQO.6C-t6psUF<)Q:S<E)Oc
:0L4c%14dOC2[X)Df9H5A79R&H?*S9Cgggb+=KE2HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'
0Ka)gA8c?r@<<V7+<YuNAT2Ho@q?c24uRaW8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X%
Ec5Q(Ch4_3H?*S9Cgggb+=KE4HU^S#78kWs8l%iC8Q/Sd8O?EV8P`)b8Pfj'0Ka)gA8kstD0$gB
+<YuNAT2Ho@q?c24udmY8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%14dOC2[X*F(KB%Df00$B4>:b
+<YuNAT2Ho@q?c24umsZ8PDQO.6C-t6psUF<)Q:S<E)Oc:0L4c%13OO:-pQUA8`T!Cht4:Anc'm
F!,%=BleA=Bl5&>BlFLgH=_>8F*&T\+@\pr78k<[/g*8K:IITB;cHXd6<-uV:JP(b:^mbQD/XQ=
E-67F8l%iC8Q/Sd8O?EV8P`)b8Pfj'%15is/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'Gt
Df9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F<4&@WcC$A86$nFDl)6F##IF67s`sF_PZ&C2[X)Df9H5+EK+d+C]J-Ch.T0@3B0)Ci"A>@rH4$
ASuU$A0=K?6m-SiDesJ;@r,RpF!,O6EbTK7/e&._67r]S:-pQUG%G]'@<?4#3Znk=:-pQB$;No?
+@BR\ART\%3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0r
A0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'
0K<oXGqq?%/Kf(FDIIBnA0>>i@r$4++EVNEE,ol-F^oN-Df-[L+EM76E,96#Bk;?.8jQ,nBl8!6
@;Ka5D..-rFCf>uDI[5e$;No?+>PW*0l:?E0f1")+E_X6@<?'k+D,P4+A,Et+E27>F<G[D+A?Ke
Fa,$);[j'C$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU
Eb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW3Zri'
+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUAn?'oBHV>,EHPu9
ARlp+FD5Q4+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$
A86$n-OgCl$;No?+EM+9+EhU4%14ItDe+$&EcYr5DBN\4A7B[qCh.$nF=04414(WG:IJ5X6k'K<
De*="Bl%<j@<?'D3ZrNcFCB$*-RT?1-YdR1FDl)6F*;,8F(oQ1+DPh*FDl)6F(09+Ch.$nF=044
14(WG:IJ/X:J=\f9gfEtC2[X)Df9H5@WcC$A7KM!4ZX]L3biSDFDl)6F(09+Ch.$nF:AQd$;No?
+DG_'Eb0*!DKI"1F_PZ&+Cf>4DKKH1%15^'6rZrX9N+td6p3RR-u*[2FDl)6F(09+Ch.$nF?=5U
A7B[qCh.'bFCcmD-nui".=Ffa6rZrX9N+td6k'KFD/a<0@j#`5F<Dr':IJ/X:J=\f9gg?<$4R>;
67sC%ATT&5F`_SFF<G10Ch7Ys$;+)^<)6:`;`u`U-YdR1FDl)6F(9-*D.RU,ARmE-C3(a3$;+)^
<)6:`;cH1a<(9GQ76N[SC2dU'BQIa(+DPk(FD)dEIUQbtDf0W$B4YslEa`chC2[WfC2[WoG]\"3
-S.kc6rZrX9N)B-:-pQU@UWb^F`8IAAftVuF*)G:@Wcd(A0>JuCh4`.CgggbA0>T(+E2IF+Co1r
FD5Z2@<-'nF!,O6EbTK7+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV779U:9LV**+DPk(FD,`,E$-PQ
/gjRb;C="WCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e6rZrX
9N)B-%172jART+43ZoeF67sBZH#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:-OgE)BOtU_4ZX].FD,5oA1UDD
/1;l@67sB]ATDj+Df.TY-S0"NA9;a.Ciac2EcYr5DCd.X+@:3bCh+Y`F_tT!E]P<j/1;]'C2[X)
Df9H5@WcC$A7KM!.4chh+@KX[ANCq]/8B*6@WcC$A7T+jALT0(7L]]GD/XQ=E-67FFD,5oA.8kT
$;No?+D58'ATD4$AKZ)5DesJ;F(96)E-*42DIal2@<Q2k$7Bk(+EVO?Cia*,BlJ/A4ZX]@+Dkq9
+=CoBA9;a.Ci^s5$?L'&F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@lM-OgD2F$2Q,FDj]G;cFl]
BOtU_/5/MaFDl)6F(96)E-*NOGB.D>AKZ&-Dg-//F)rHr:IJ/X:J=\d78m/T8PDP^$?L'&F`_SF
F<GWIGB.D>AKZ&-Dg-//F)rHr:IITB;cHXd6<-uR6q0aA71BS5$;No?+E_X6@<?''@WcC$A0>Q"
F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=+DkOsEc2Bo6<-TN6qBmJ<)6Cp4Y@j*0fq'31+@Q2
3Zp7%B4Z0--V@0&<)6:`;aOJU9LMEC;cHOj=XOXc6<-TN6qBmJ<)6Cp4Y@jD<CokP84c`Z:Jt=H
-o*#@7O]m1BOtU_%14p7E-67F-V@0&<)6:`;aOJU9LMEC;cHOj=XQ9d2*4-)8PDNC8Q/Sa;HXG9
%17/nDfp/@F`\`RC2[X)Df9H5+Cf>,D.RU,ARlomF_PZ&+Cf>,E,9*-AL@oo%15is/g,1GF*)>@
AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'GtDf9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&@WcC$A86$nFDl)6F(9-*E,oN2F(Jl;0ht%f.UmO7
Ch.:!A9;a.Cia*)D/aN,F)to'+EK+d+C]J-Ch.T0@rH4'Eb0<5ARlp,ATDj+Df-\9Afu2/AKXT@
6m-SiDesJ;@r,RpF!,O6EbTK7/e&._67r]S:-pQU6Yp[YARloqEc5e;-t7=5Ch.:!A9;a.Ci_$J
D.-ppD[d%K67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0em9O@PBba
/KePABl8!'Ec`EOBkhQs-Qli.A7]9o@:jUmEZf4;G%ki,+A,Et+DG_8ATDBk@q?d)D]ib/De':a
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--[oK7A8c@,>[_Y_>^C+'>^C!rCh7Z?Bkh]:%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]Tu
DfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6
F!i)7+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!
+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO:-pQUF(KG9G&:b!$7BS,A9MO)
F(oQ1+DPh*@WcC$A7KM!-TsLGHS.od6rm#M%16igA7B[qCh.'bFCdTr+CT)&FE2)4+EV[H@;Ts2
-OgD1C2[X)Df9H5G%G]8Bl@l3C2[X)Df9H5@WcC$A7KM!-TsLGHS.od6rZrX9N+td6k'K<De*s.
DesK(F_PZ&@r?BO3ZpUIC2[X)Df9H5@WcC$A7KM!%13OO:-pQUBl7F$ASl!rF<G%8Bl%<&@rHL-
FCfJ%$;+)^<)6:`;cZU\4ZX]6C2[X)Df9H5@WcC$A7KM!4)/\E@WcC$A7T+jALS`M0d&5#I7d:'
<)6:`;cZU\%172oE,9H&+E2IF+=BcW6rZrX9N+td6miEN%15is/g,4HF<GLEFDuAE+D,>(ATJ:f
8l%iS:JXY_4Y@j"+<W%HDe*s.DesJIBkh]:%15is/g*b^6rZrX9N+8D90FmM-YdR1FDl)6F(/Qn
/no'A-OgDT:IJ/X:J=\d78m/T8PDQ93Zr0V@<?1(AT/c,E+*j%+=DVHA7TUrF'N?hDImisCg:^n
A6`kfA7^"-F'L(D8l%iS:JXY_%13OO:-pQU8l%htF*VhKASiQ(DKBo.Cht5?BlG2/DBNn@F<G+.
@ruF'DIIR"ATJu&Ch[Hu+Co2,ARfh#Ed8*$8l%iC8Q/Sd8O?EV8P`)b8PhQ&+=CoBA7$]8-mpWS
-Qlo4@<-F3@N]E(A9MO)F(oQ1.4ci!H>.=G%15^'6psUF<)Q:S<E)Oc:0L4c4Y@jlE+*j%F(K;5
-mC8k5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VR>C8l%iC
8Q/Sd8O?EV8P`)b8Pfj'%15is/g+V3@r$4++E(j7A8-+,EbT!*FCeu*Anc'm+E2.*@qB0nBl5&4
F`\a:Bk)7!Df0!(Bk;?.F(96)E-*45Bl[cpFDl2F%15^'6rZrX9N+>N;cHXd6<-uR6q0aA76N[S
C2dU'BQIa(+=JEd-W<B1-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^
DdmH1/4r]+<)6:`;[j'C$?Trm@:VM^+=BoN/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D'oc"FD,5oA3Dsr+EV:.@:Uo_7P#r8
:-pQU<b6;mBl@lM+=A^TDe*s.DesK<ATDj+Df.*R+<X!nBl%<&:3CD_ATBgS-S-Yi3biSDFDl)6
F(09+Ch.$nF=Aag+<X'\FCdKU-S0"NA7B[qCh.'bFCcmP9L]HuF)>i<FDuAE+EV:.@:TfS%15is
/g+e<DImisFCcS:Df9H5+EM%5BlJ/:@;]TuF('6'%15is/gk[L+EVO?Cia*,BlJ/A4ZX]@+Dkq9
+=CoBA9;a.Ci^s5$4R>`D/XQ=E-67F-Y%(3E,oN2F(oN)+DPh*FDl)6F!*(f/gh)8%15is/g+b;
FCSu,BOtU_ATAo%DIal"Df'H6ATMo%$>;RT+Co&-BPDR"C3*m*BlJ/:-o!e;+>G<l3]\B=+D58-
+=CoBA9;a.Ci^s5$4R>;67sBjDf'H6ATMo8DJsE'AT23uA7]Y#+D5_5F`8IIDfTB0%14J'+EJnn
/g+YBD/a54-tdR>+=CoBA9;a.Ci^sQ+>#2gB4PRmF!)iFDe*s.DesJB%13OO:-pQUAn?'oBHU`$
A0>B#D/aN,F)rICDf^#>Ec5H!F)u8?%17&;/g+\9GA(]4ASQ9rEbTK7+=Js+0H`,"HTF211a$FB
F<Dr-:K(5"C2[X)Df9H5-OgCl$?U3)Cia*,BlJ/W/g+gYF"D8>$4R>`D/XQ=E-67F-Z=-LE-67F
Anc'm+Dbt+@<?4%DK@id%14M)4Y@k!Db*Z&<$69rART+#FDl)6F(96)E-*NOGB.D>AKZ&-Dg-//
F)rHr:IJ/X:J=\d78m/T8PDP^$?L'&F`_SFF<GWIGB.D>AKZ&-Dg-//F)rHr:IJ/X:J=\T8Q/Sd
8O?EV779U:9LTBt%15is/g,:UA79Rk+Cf>,E,oN2F(Jl)8l%htA8-+,EbT!*FD5Z2+>"^VAT;j,
Eb0;7H=gl-ATJ:f:-pQU@;]TuE,0c6E&':'AU%c/Df-\-Df'?"DIal2BOu!r+E1b2BFP;i+F8'>
E,8rmAKZ&-Dg-//F)rHP-YdR1AU&<<0./;C:IJ/X:J=\94%`::6qL<V;Fs2T<(Tk\>"MO"$4R>;
67sC'E+EC!AKYH)Bl%<&BPDO0DfU+G/Kf+VDfTE"+CT=6E,8rsDBO%4G]Y'F@:O=r%15F%8PDNC
8Q/Sa;HZ.8+=Js+0H`,"HTF211a$FBF<Dr':IJ/X:J=\R<CokP84c`Z:Jt=C%15F%8PDNC8Q/Sa
;HZ.8+@9("9LMEC;cHOj=Y(sV,>:QU/9GQ:@:TfS1a$a[F<Dr':IJ/X:J=\R<CokP84c`Z:Jt=C
4#/ZT6<-TN6qBmJ<)6Cp%13OO:-pRBH$!U?F(or3+E(j7B4YslEaa'$A0>i-@;0V$AU&;>F(96)
E-)NrF)>i<FDuAE+=JEp,BG:b-QmJ?EbTK7+C]V<ATK4.$?L'&F`_SFF<Dr':IJ/X:J=\0@rH4'
Eb0<5ARlomF_PZ&+Cf>,E,9*-AL@oo%15is/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'Gt
Df9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F<4&BPDO0DfU,<De(UXB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%13OO4ZsoA/ibOB2'>%F
+@KdN+>Gl-+>PW*0b"I4.Ng-PATTJBF`]&TDJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2
+CoD#F_t]-FCB9*Df.0:$6UH62'?OCF<DqY+:SZ#+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!
Df0!(Gpa^D$4R>*4WlF23A*344ZsoUARci;1+XP'0JP9k$6Uf@-u*[2BOu"!.3NSJBl8$(A0>u4
+Dtb7+E).6Bl7K)G%G]8Bl@l3De:+?C2[W8E+EQ0%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,
ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.
+EM7CAKYo'+DPh*F)Q2A@q@9=BlG[I<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.
+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[;e9M_<+ohc8l%ht:gn!J/e&.1.Ng-LDf'H..3N,/
DBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,
DJ()6BOr;rDf'?&DKI"C@:p]2/M8J83ZqjKH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:
Ch[BnF<GdGEb$d3$6UH6%156]+>>E./i=b74Wm.(@j!TZ+>PW*0b"I4.Ni>;G\(D.@3?t8@;BF'
+C]J++DG^9-tII;E-H5@A901B@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%r
Ch7-"FDi:=@;BF,%144-+D,>4ARlolDBL?ECi_$J@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARffk
$6UH68l%htF*(i2FEMOTBkh]3ASuU1Bk;?.Df-[kBl8'</e&.1.NiSHEb-A8ATMr9@psFiF!+n%
A7]:(%13OO4ZsoA/ibO@+?_k1:2b:u1,UU*1,(F;%144-+E_X6@<?''C2[WsDId='/nf?DC`mh<
+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Uf@AncL$A0>;'-uEC.ALSa2
F_;gK+DkP&AKYK$F_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.Ohu
DIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6Uf@
F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#4ZsoA/ibO?+?_k18p,"o0ek4%
1,(F;%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*
DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&
ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e
7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)C2[W8E+EQ'GA1l0+C\n)Eb0E.F(Jl)
@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R>*4WlF23A*'04Zso^@<itN3@l:.0JP9k
$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1
%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3e
Ch4`4Bji-+BOr<0ATD6&-u*[2BOu"!.4bo8+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7
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
,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4
+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDB
H#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6Tcb+:SZmDe(a[13-r=BleB-E\]@E67sa&De(a[
13-r=BleB-EZfET/Kf(F/TPE8BleB-EZdtM6m-#S@ruF'DIIR"ATKI5$;No?%15is/g+,,BlbC>
F(96)E-*3FEb-hCAS5^uFCfK6+<X9P6m*U_Bk)7!Df0!(Bk;?<+<X6t-Z^CQ@3?\*Df9.q$;No?
+E2@0@ruEpAKZ)5+DkP$DKK<$DBN@1D..L-ATAo7@rc:&F<G[=@<<W0DffQ3+EV:.+Dbt+@<?4%
DK?6o:-pQU@;]TuDIIBnF!,C5+CT)&+CSc%Bm+&18l%htA8,OqBl@ltEbT*+/e&._67r]S:-pQU
1,(CA@;p6@2BXRoF('6'A0>T(+=LuCA7T7p.1HVZ67sB90JGJ'@<jU_+>"^NDe'u4Eb/f)Eb090
DffQ$%15is/g)o'0edK`Ftb`q/Kf+GF<G16EZf4CARf3Z$;No?+>PW*0l:?E0KC7-+EML<BlkJ3
DKKe>C,Rb$05<F"0d(OIEbTK7Et&IO67sB90JP;!@<jUg+>"^QDe*QoBk:ftFDi:BF`&=?DBO.;
DD,g?DKU15$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn@rGjn@<6K4
FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%8@;0V#+EMXFBl7Q+@V'.iEb-A*Bl\9:+E(b"F`MM6
DI[6#De:+?GUX(/@V'.iEb0<6E]lHh+F>_i+>G2kBeFi`5U]hZ74o]g.1HUn$;No?+ED%8F`MA@
+ED%7F_l.BDe:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'LFE2)5B+52]Df^"`3a4Wf1*J\4
+=AQb,$uHD+C-*@+=A:ZHm!NOF_*!L,$tcd%15is/g,4HF<G+.@ruF'DIIR"ATJu9D]hqH5t"dP
8Q8,$+>"^QF`VXI@V$ZnG]7J5@rri(AS,XoFD5Z2/e&._67sBU:K0bD+Co1rFD5Z2@<-'nF!,OG
DfTD3FD,5.A9)C-AKYf#FED)7+EV:.Gmt*U67sC)ATD?)CghC,+ED%+BleB-Eb/c(Df-\+DIal3
BPDN1BlbD7Dfd+3BOPdkARl5W:-pQUGA(Q*+CQBj76s=;:/"e5A8,OqBl@ltEd8dAF!,L7/TPE8
BleB-Eb/c6+B38%Eb0<'F:ARP67sC%FDl22A0>E'Bm+&1Ch7^1ATDi7D..3k+CT)&+Co1rFD5Z2
@<-'nF!+@L5t"dP8Q8+f$;No?+C\noDfTD3Eb-hCAS5^uFCfK,DJ(R2$?C&q4Y@j5+?CVm1E^UH
+F,)6+CoG4ATT%B-W3B!6s!8X<(//^+Bot,A0?.F%17,oA0sJ_I4cX\A0<6I+BosE+E(d5-RT?1
%15is/g,:SEb/ltF*(u6%14m6Eb/lo-9`Q#/g,(C+=ANZ>9G^EDe't<-OgCl$;No?+Co1rFD5Z2
@<-W9E+*j%F!*%WARoLs+EVNED..NrBHUf-EcP`/F<GC<@psInDf0V*$>OKiEc5l<4ZX]A+?CW!
%17,oDfe,p+=AgWDe(LK/1;l!-Qll0AoD^$F*)FF3?^F<1a".n.4ci"-OgDsAhG2t7TW/V+CoCC
+EDC=F?M6!-Y#1b/95ZIF<D#"AScF!/g(T1+<Y]CDfe,p+=KoQ+>#3p+D>\7F<DrB@q]d',Y1^*
740N8Ec5l<+:SZhDIb@/$7QDk6r6$!+DPh*Ec5l<+>=63%15is/g,1GB5)F/ATAo'F`MM6DKI"F
DfTW-DJ()&Bk)7!Df0!(Bk;>p$;No?+ED%+A0<77De*BiFseCT+<VdL4"*Kn/151NA7T7p-Rh,)
8l%htA7]pqCi=90ASuT;%15is/g,1GB4N,4C2[W1+<VdL+<VdL+?Lu>:b3u/De(4E4"!Wr6m-Ph
F`Lu'-OgE'AS5Nr-ZsNFCi^sH+<VdL+<W`o6r5E^F`_>6F!iCu-YI".ATD3q+E_d?Ch\!*ATK4.
$?B]jA0<70Df0W=Cih$I+<VdL4"*Kn/14q:BI>5j-Y$V!05t??F)PqLAo_<tCM[^&+EqaECERP5
AM%h4Aof=/$?B]jA0<70Df0W=Cij3!FseCT4"*Kn/15%M@;]jsBl7HmFse_#-Y$V!05t??F)PqL
Ao_<tCM[^&+EqaECERP5AM%h4Aof=/$?B]jA0<7=CghT:+<VdL+<VdL4"*Kn/15CQ@<j4L4""bc
FDlFI@W-K=%17,eB4N,4F)?&4-QjNS+<VdL+?Lu>:b3u+Ch[BpEclIO.6AnuD09K.F_<@>Ch[Bp
EZee0BcqJ8F`Lu'-OgDX67sC$AS5Nr-Y@1/@r$+-FC\s+-QkK!6r5E^Ao)0kCN=Q>A7]p3.6AnH
Ch[BpEZen(G%GK.E,B0(F=.M)Eb/lo+=Cl?@:s.!+<VdL+<Vdg-q$l_-Y[F+B4WG>4"#,`F_tT/
E-64TE-#k=Bl8$(Eb8`iAKY](@:s-oE,ol,ATMp,DJ(=+$;No?+ED%+A0<76D..'gA7]p3+<VdL
4"*Kn/15.K@:s.^ATfFM4"#,`F_tT/E,9Z<05tuL+Co&,ASc:(D.RU,-OgDX67sC$AS5Nr-Xq4/
B4Z04+<VdL+<W`o6r5E^@Wc3oATT:K4"#5`ASZ+-+C]J(B4Z0-A79Rg-OgDX67sC$AS5Nr-YIC>
-QjNS+<VdL+<W`o6r5E^B5ho>.6AniE-!.EFD5Q*FD5<--OgE'AS5Nr-Za-IB4PRs-QjNS+<W`o
6r5E^F)?&4A7]p3.6AnuD09K.F_<@HF)<%@Dfp)1AL@oo:-pQUEb/lo+=D#MARf3t+<VdL+<Vdg
-q$l_-Z+'=@q-l84""lZA9VU+F<G.3E,9H<ATDi7@psG$@;L%2+Cf>,E+*X0+ED%0@<?'k-OgCl
$;No?+EM+9+AtWo6r-QO=Wh<pEZfF7Ch7*uARlooBk)7!Df0!(Bk;>p$8WfCA0<6I+Bot0D/XQ=
E-67FA8lU$F<Dr/76s=;:/"e<+Bot,A0<7BFD5Q4-OgD=+E(d5-RU$@+EMC<F`_SFF<G+5F(KG9
-W3B!6r-QO=XP=r+E(d5-Y%(4F*2;@-OgD=+E(d5-RU$@+EMC<F`_SFF<G+5F(KG9-W3B!6r-QO
=XP=r+E(d5-Za-IB.",q1E^UH+=ANZ>9J!(Dfp/@F`\a:E-#T4+=C&U5t"LD9N`_c>9Iip+=Cl?
@:s.!%13OO:-pQUF(fK9+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+%17/nDfp/@F`\`_+E(d5-RT?1
C2[WA0JRTZB5)F/ATBO\:-pQ_C2[WA0JRTZB5)F/ATAo7/M/)cAM%q6B5)F/ATAnc:IH=9Bk)7!
Df0!(Bk;?<$;No?$;No?+B3#gF!)TH@rc:&F<D]HAM%q6B5)F/ATDi7+A,Et+<Y3/@ruF'DIIR"
ATKIH+A$Z&F!)T6+<Y<8De'2M67sC"Ea`I"Bk(]sFDi:=@;0V$@;0U%@3BDqF*(u6+EM%5BlJ/:
FD,*)+Du+>ATJu9BOr<&De!3tBl@m1$;No?+CT.u+DtV)ATJu4AftMuC`m.rFD5o0+A,Et+Co1r
FD5Z2@<-'nF"Rep67rU?67sBjEb/[$ARmhE1,(CA@;p6@2@<2G/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>PW)3,N)L1,0n'
+DPh*+EVX8AKZ#)Ec5l<ARl-C67sB90JP8!Dg!fk+>"^WATT&,DfQt;G@b8o$;No?+>PW*0l:?E
0KC7-+EML<BlkJ3DKKe>C,Rb$05<F"0d(OIEbTK7EsbZ//g)o'0emNRGqh<%/KeP:@;]^hA0>u4
+EDUB+E)-?@W-@%+EqO;05P??Fa+6g67sB90JP;!@<jUd+>"^GBOPdkARlp*D]j(CDBNP3Df$V3
F`(t;Ci<flCh3q\@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=Cf5DImisCbKOAA1%^oDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go
@rH(!F(KB6+=Cl<De(4&$;No?+ED%8@;0V#+EMXFBl7Q+@V'.iEb-A*Bl\9:+E(b"F`MM6DI[6#
De:+?GUWu/AS,k$ATMs64ZZjkHS0ai0d\;_/q,67-sIf_/g+FK$49Np/g,1GFEMVAF!,L7F*2;@
+E(j7Ch[d0GV=2WBm:b1Df'?"DIdf2@<3Q5AU&;>F*)G:DJ';iDf^"`3a4Wf1*J\4+=AQb,$uHD
+C-*@+=A:ZHm!NOF_*!L,$tZa:-pQUF(KG9A8,OqBl@ltEbT*++EVNE;FNl>=&MUh73E^)+Dl7B
F<G%(+D#e:Ch[C$+Co%qBl8$,Df.07:-pQU:/=hX3ZqsI@ruF'DIIR"ATJu8FDl22+EV:.+CoM,
G%De4ATW$*EZfI;AU+VX67sC)ATD?)CghC,+ED%+BleB-Eb/c(Df-\+DIal3BPDN1BlbD7Dfd+3
BOPdkARl-C67sC)BOu'(@3AH:5t"LD9N`KKBk)7!Df0!(Gp$gB+ED$FEb/ltF*(u6ARmD9<,Wn"
ATMF)$;No?+EMXCEb/c(A9)C-AKYf#FED)7F!,=.CLnVsCht5)Bk)7!Df0!(Bk;?.;FNl>=&MUh
71)dV/g+V7AoD^$+ED$FEb/ltF*(u6Bl7Q9$?C&q4Y@j5+?CVm1E^UH+F,)6+CoG4ATT%B-W3B!
6s!8X<(//^+Bot,A0?.F$?C&q-9`Q#/g,(C+=ANZ>9G^EDe't<-OL2U67sC'DK9<$BleB-EXFTF
Eb/lo-9`Q#/g,(C+=ANZ>9G^EDe't<-OL2U67sBkBk)7!Df0!(Gp%'7FD,_</KeV8BlkJ>D]in*
FCSu,@s)g4ASuT4Ci<flFD5Z2EsbZ//g*nb<(/hjFD,B0+Eh=:@N]0$ART[lF!+'tG%G]8Bl@l3
F)Y]#BkD'h+C]A"DI[?kF!)lGG%G\C$;No?+F.mJ+DkP4+Eq73F<G[D+EM+9+=LuJATB4BFDi:1
+Cf>-F*(i.F<Ga8Cis;A$>OKiEc5l<4ZX]A+?CW!$>O`qE]l#t-SHhi@V'.iEb0<6EZd@c3\`H6
-RT7ADf9_\/g)MpC2[W9-S0"UATB=L0..*@AhG2t7TW/V+CoCC+EDC=F?M6!-Y#1b/95ZIF:)Sq
F(Hs2+<Y]CDfe,p+=KoQ+>#3p+D>\7F<DrB@q]d',Y1^*740N8Ec5l<$>"*c/da$76r6$!+DPh*
Ec5l<+>=-0:-pQUEb/ltF*(u6+CfP7Eb0-1+EqaECM@[!+Co1rFD5Z2@<-'nEscr!B4N,4C2[Wn
ATfFD+<VdL+?Lu>:b3u/De*BiFse_#-V@0&+Co&,ASc:(D.RU,-OOm*B4N,4C2[W1+<VdL+<VdL
+?Lu>:b3u/De(4E4"!Wr6m-PhF`Lu'-OOm*B4N,4F`_>6F!i(Q+<VdL+?Lu>:b3u:FD5Q4-Rh,)
B4YslEa`c,F`_>6Bln'#F!h;i67sC$AS5Nr-Y%(4F*2;@-QjNS+<W`o6r5E^@q'+!.6Ane@V@E6
@<-F-DD,UB@;]jsBl5&;DfTV9Df0,<De<U&-ONU8/g,1GB4N,4@rH7+F_l/1ATfFD+?Lu>:b3u+
Ea`j$Ch[ctATfFM4""NIBJ4=5EcZ/:04o65DJO'&DBO.AEbce9DIkD<AnH*3$?B]jA0<7=CghT:
+<VdL+<VdL4"*Kn/15CQ@<j4L4""bcFDlFI@W-K=$?B]jA0<7@D09J=+<VdL+<VdL4"*Kn/15LU
F_<'N4"#)dF_>Q6B.mk5Bk(q!+CT5'+EMIDEarZ.$;No?+ED%+A0<73Ch[BpEclJ7ATfFD4"*Kn
/15%GBk(q!F`_/*Fse_#-Uqod@r$*-A7]pqCi=90ASuT;$?B]jA0<76D..'g-QjNS+<VdL4"*Kn
/15.K@:s.!.6Ao!BQ\0$F)Z8C05tuL+DG_8ATDBk@q?csD..'g+E2@>@qB_&Bl7Q2$;No?+ED%+
A0<76D..'gA7]p3+<VdL4"*Kn/15.K@:s.^ATfFM4"#,`F_tT/E,9Z<05tuL+Co&,ASc:(D.RU,
-ONU8/g,1GB4N,4@Wc3oATT:B+<VdL+?Lu>:b3u'F_#,rF=/M!-[0-5CM\8=@Wc3oATT&*@<>p*
$?B]jA0<74E-!BL+<VdL+<VdL4"*Kn/15(LF!iCu-YIC>+E_d?Ch\!*ATK4+Eb/lo+=D5IF_>5r
FseCT+<Vdg-q$l_-Za-IB4PRs-Rh,)F)?&4D09JEE-#k=F)Q2A@q@"pEb/lo+=D#MARf3t+<VdL
+<Vdg-q$l_-Z+'=@q-l84""lZA9VU+F<G.3E,9H<ATDi7@psG$@;L%2+Cf>,E+*X0+ED%0@<?'k
-OL2U67sC%ATT%m76s=;:/"e5AoD]4F(K0!@ru9m+Co1rFD5Z2@<-'nEsa]GDe't<-QlV9A8lU$
F<Dr/76s=;:/"e<+Bot,A0<7BFD5Q4-OMXPDe't<-QlV9A8lU$F<Dr/76s=;:/"e<+Bot,A0<77
De(4&1E^UH+=ANZ>9IHqF(KG9-W3B!6r-QO=XP=r+E(d5-Za-IB."$B+E(d5-RU$@+CoG4ATT%B
;FNl>:JOSd-QlV9De't<Bl.9kAL@fl:-pQUF(fK9+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+$?L'&
F`_SFF<EC_De't<-OL2jDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,
$>OKiA8cQs6r-c;2.UE6Ea`p#+A,Et+F=P)+<VdL+<Vd9$84%TC2[W*F*VhKASiQ"CghC++ED%0
@<?4%DKBK*E$/S0Ec6/C%16ukA7Zlf+EMXMCh5bABl%TsA1SjIASGdjF?M?0+E1n4BlI`sEbT*+
4YeQ2Anc't@rH1%E]nV[Blmol3t2N+$84%T@rHC!+DPh*%170!@V9^iE+gA(Cisf@ATD-f1*CoQ
$6UH6F*)\DANaX>Ci!Zn3t2N>+<Y04Ci=>WCh[NqFD#W*GrlHB+<VeADe'u*De*p2DfTD3C2[X"
@;BEsC2[X*FD5P6C2[WnDdj._+<VeC@:Eea+?^hk6Z7!V+A,Et+Cf4rF)to6,!-5@+<Ve=Df0Z<
BmO>R1,M'%$6UH6CggdaChe*6F?OY+%17Lm$4R>g+>#c"BkhQs+BrAjE]ml?@r!V<F*)\DANaRB
FED))>rrK&BkhQs+>#c"C2[W*>@_Gg4^qi0CFgTLFEq\64_/JQFCeug3t2O3De'tB4s4TYA92j2
Eb-@tA8-'I@UWb^>rrK&C2[W*/Nt:lDe*]nCLnVmA8-'I@UWb^>rrK&C2[W*/Nt:lDe+!4Bl"nr
A8-'I@UWb^>rrK&C2[X(FDl22+>#c"C2[WnDdjhnA8-'I@UWb^>p)3<$>OKiF`_>6+>#c"C2[X)
Df9H5+BrAjE]ml?@r#?m3t2O3De*s.DesJ;>@qScCh%C"DfS!bBPDR">rrK&BkhQs+BrGlCi!U"
Ci=>WCh[NqFCK'/AR.A,$@3h!Anc't@rH1%E]n5QB4uBrCis;p3t2N+$@3h!+EM4)E+M1CBjkjs
DIb:@CggdaCcrtg>]+:pA8c?.C2[X$AnE5m3t2O2C2[W*>9J!#@;od@A8,IhDf0):+DbIqASaLR
BkhQs>]+7nFCfK)@:NjkCi<flCh4er3t2O3De'tpCggdaCcrtNC2[WfDJ`frDBNG*@<6K6>rrK&
C2[X(FDl22+BrYj@V'@=,%55)A92j2Eb/KnF*)>@@:s-o@r,RpF!=mO%16igA9;a.Ci^_'Cggda
CcrtNC2[X)Df9H5>]++tFCf?2Bl@l3FDl)6F!=mO%16igA7TUf+BrYj@V'@=,%55)A7TUf>]+(d
Eb/a&DfU+GDdmHm@ruc9>rrK&C2[X"@;BEs>AR_WASaLR@;9^kD..3k>]+UmEbTK7+CT.u+CoV3
E*R9nASu("@<?4%DB`@J%16igA9E!.C`lqu@:Eea4X+<LDe+!4Bl%$lARoLs+E(_(ARfh'>]*tf
A0>f4BOu3,F`_>6Bln'#F!=mO%17Lm$>OKiBl7HmG[F!@9h[<"4D8hRCd&:8+<Wd[ART+5%144#
+<WdgBln0&5"]a(=)W+i8T&'MGV3oFF?D3uBln0&4q.iA+<VdhF*)\DAKZ)?E+M0VFCf]=04T'E
,!HGC+<VdLDesc;@<-!pDE9I5E+*9fBl7QE0R[neD..HtBl5scI4f"a0RItSEcc#*@;IN(Ch[O"
3co:Z4*PCLFD*]i3AW9FE-+0NDfTB"E\2?SH#.%QF)Pl/A347/@r#^tDfor./Rr^8DfRl`AnGXe
AnF,6DfTB"E\1d>Ci=>T,;:f*0JG1B@W-9tATBAHBk2=!3\`6@E-+0\@:Wn_DJ)!c/i#;'F:AR"
+<Vd^/i#;'F<E=k1,X#m%144#+<WEl1,X#mI4f"iHZit@FD55nCb9(3BkM<EFDl+[GA1T0BK@n(
2(g[F3B9)[3B9)[3B9)ZE-+0NDfTB"E\2?SH#.%QF)Pl/A347/@r#^tDfor./Rr^8DfRl`AnGXe
AnF,6DfTB"E\1d>Ci=>T,;:f*0JG1B@W-9tATBAHBk2=!3\`6@E-+0\@:Wn_DJ)!c/i#;'F:AR"
+<Vd^/i#;'F<E=k1,X#m%144#+<WEl1,X#mI4f"fHZit@FD55nCb9(3BkM<EFDl+[GA1T0BKA"0
/ho%60JG170JG170JG8$F?<rMEb&a%/TZ#ZCh5YKDes,u4(;W.CM.[+F`(_A@rH1%E]PFWAnGXe
AijI?Eb&a%/Rr^8DfRl`0JG170JGRtDfTB"E\2KLA9;KG0eP/!F?=GMA7TClB0%e#1,X#m%144#
+<WEl1,X#m+>PQ)2/mXH$6UH6+>PQ)2/mYc/n6XkHZit@FD55nCb9(3BkM<ED/!NkCh5\PBk2=!
3]/`J/hh6d4(<,KA7]d5F*)\DANFmNCh[EA@UWb^B6%p5DIb>/Des?43[8-EAnGXe4(<,KA7]d5
@rH1%E]PF!0JG170KW`^Eb&a%/U(o>FD*]i/hh6d4)eV=A8,po3]/NDE-)Nr+<VdL2(gS%F<EFn
0Q;+C$6UH6+>kc*E--L\@ki=RATDm,@ps1*@;KXjDE;lXE'&8XA9;KG2DQm=E-+0NDfTB"E\2?S
H#.%QF)Pl/A347/@r#^tDfor./Rr^8DfRl`AnGXeAnF,6DfTB"E\1d>Ci=>T,;:f*0JG1B@W-9t
ATBAHBk2=!3\`6@E-+0\@:Wn_DJ)!c/i#;'F:AR"+<Vd^/i#;'F<E=k1,X#m%144#+<WEl1,X#m
I4f"bHZ3D(A8,po/TboM3]&HHE-+0Y@<-!pDComCB4uBJ1bLY)F?=#IEb/a&Bl@lMCij\ZD..Ht
Bl5M=AS-$F1bLY)F?=GMA7TClB.[S2FEDG<3]&HHE--L\@kfohE+*9fBl7Q8FDl+Z1bLY)F?=>J
EbB*(/TPQ<BQQ9l/i@Ti4*5%YF=h3EA7]Y#3\<0@2/mY!E+*9fBl7Q8@W-@1Df%Nl/i@TiI4f"b
0RIbIA7TClB.\4DE&o^5/hh6d4*5%YF=gp;BkM<E@qBP"ATBkO@:Wn_DJ(P1Dfg)>D)sL+0Q;,^
/n6UjHYdD6AM%S,BkM+$3\`6A2*5J_BkM+$3\`C/F?=#IEb/a&Bl@lMCij]G/n6UlHZs17FD*]m
1b^O9E-+0N@:O(cEc6)<A1_;0Ci=>T,A(P"AnGX:E+*9fBl7QE1H$j>E-)Nr+<VdL1H$j>E-*3Y
2D-\&F<E@t/hh6dI4f"cHY.26F=hQJH=],l12q=sAoDR//S8F.Bl&&U6Z7*fBk;;o$6UH6+AQKl
I4f"a14*\GBkM+$3\`C/F?=#IEb/a&Bl@lMCij]G/n6_b@rH1%E]PF!0JG1@3BM=oG]YNJARfY!
@<?4%DE;oXA7]dtBl7L1/n6bc@rH1%E]RoPBOu3uF?=SUG]YNJARfY!@<?4%DE;KLBOu3uFF>cO
0fXN!@:Wn_DJ(PCDf@`l1+k8"F?=GMA7TClB.[S2FEDG<3\`BB0Q;,^/n6heAoDR//TYWPANDP*
E-+0RDf0YKG@bK$BQQ:EDers4/n6kfBOtmjBQQ9hE--L\@kfif@W-9tATBA4Des5uE-#SO@rH1"
@;p:!I4f"a2LAqPCi=>T,A(OA0JG2//n6UrHY.26F=h*5D/!g33^[h.EbT**%144#+<XEjGC;)R
0RIDMDKIIB@;T^pGreu;Eb&Tr@=9b<0f45fBl[cpFD5Z23c&nYI:@,*H$a%>Ci=>T,;:f*0JG1B
AoDR//TYWPANDP$E-+0RDf0YKAmoOjCjA'@Bl.F&%144#+<XEjG7=m%+<Ve)Df&p#I:t?^E+*9f
Bl7Q8FDl+Z0et@8E-+0XBl7K6BOtmjBQQ9i/hfA/AU&;K@;KXjDE;TFAop+EDes?43[6=40JG17
4(`DKF=hQJH=],l2K3b"AoDR//S8F.Bl&&U6#p[JCcc6IDKIISASGdjF?3lLCh,VH@:Wn_DJ(P1
Dfg)>D)sI*0Q;,^BJOpR@:Wn_DJ(PCDf@`l1+k8"F?=;QDIkD5ASGdjF?2-/0KXAfG]YNGCh[O"
3c&A>F?<uNCi=>T,;:f*0JG1BAoDR//TZ#ZCh5YAFCB!"@ln:@DKIIOBmO>O0f3ik4(`DKF=h*5
D/!g33^Ie#@;J#;Df0YKG@bK$BQQ:EDerrGE+*9fBl7Q8@W-@1Df%Nk/hh6dI:tE`E+*9fBl7Q8
FDl+Z0et@8E-+0XBl7K6BOtmjBQQ9i/hfA/AU&;K@;KXjDE;TFAop+EDes?43[6=40JG174(`DK
F=hQJH=],l1N7FtAoDR//S8F.Bl&&U6#p[JCcc6IDKIISASGdjF?3lLCh,VH@:Wn_DJ(P1Dfg)>
D)sI*0Q;,^BJb'T@:Wn_DJ(PCDf@`l1+k8"F?=;QDIkD5ASGdjF?2-/0KXAfG]YNGCh[O"3c&A>
F?<uNCi=>T,;:f*0JG1BAoDR//TYWPANDP&E-+0RDf0YKAmoOjCjA'@Bl.F&%144#+<XEjG7=m%
+<Ve)Df&p#4(`DKF=h]JBkM+$3b!#DA34a=A7TClB.[S2FEDG<3\rBBE--MA21':NA7TClB.\4D
E&o^//hh6d4)AVKAM%S,BkM+$3\`6@4*5%YF=gp;BkM<ECh74#4(E2FDfRl`0JG170JGS#Df0YK
F*)\DANFOI@;KXf4(`DKF=hQJH=],l1N7FtAoDR//S8F.Bl&&U<,$2\Et&I!+<Ve%ATnRj+<VdL
;K$D\DEDHKDKIISASGdjF?3lLCh,VH@:Wn_DJ(P1Dfg)>D)sI*0Q;,^BJt3V@:Wn_DJ(PCDf@`l
1+k8"F?=;QDIkD5ASGdjF?2-/0KXAfG]YNGCh[O"3c&A>F?<uNCi=>T,;:f*0JG1BAoDR//TYWP
ANDP#E-+0RDf0YKAmoOjCjA'@Bl.F&%144#+<XEjG9Be%D..<DAoDR//U(c?B4uBJ@W-'n4)eV=
A8,po/RiX?FDl"W1G1A#FF?8)F*)\DANgP1+<Wd"BOtU_4q.iA+?X+OA9f;-CghC+4X+Aj1Eo!l
$6UH6+?XTc@r,RpF$1^W0f1"_0fU@@%144#+<VdL4EGIMDBNG*@<6KQ,%EGP@k])j%144#+<VdL
+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,
ASuTCA1oZV;DDrs1,i!Q<(0;\1dYVoBN\:k;H@s,FDOB7<I/e!<&mo0<Dls[F>,@ZA8--MBP]hC
DI6CB,!HGC+<VdL+<VdLFDkYO04@$R$6UH6+<Vdh06;)@DE\L:+<VdL4>1Y;%144#+<Wdg@:F%a
+Ceu!CiEfnA8,po4X)R(+Ceu!CiaQ(@qfgn4X)R(+Cf4rF)sJg@kfhb4q.iA+<VdL+?XaTDe+,W
%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kob_4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%E>a+Cd/\,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W2]uTa
+Cd,a,!K^UDe(s`F)YQ*4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ap+Cd)L4shL/2D@3a
DKKH1Amo1\+BNK%A90jdF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#
+<VdL+<Wd"FE0PS$6UH6+<Vdh06CZAA9g?J$6UH6+?V<!@:F%a4q.iA+<VdhE$/Y,@<6KQ,%E>_
,!HGC+<VdL+<WdfE+*W,@r,RpF$1^W0Haja,!J+BF)YQ*4q.iA+<Vdh05s)a$6UH6+?XaS@VfTu
@qBImE+*9fBl7QH+tt2`@qBImF)YPtBl7QH+tt2`@r,RpF$1^W0f:.=%144#+<VdL4EP%NA9g?J
$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL
+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6
+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS
@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7#uD+.o-5uU9UG'[:d7nR8^=@k;lH?M58E+h7D?V"pK
:/#Y?3HA\4=YF>sBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve8A7T=nE',d^4q.iA+<VdL
+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@k])j@:Wni+EqaEA9/l3EZfI8F*)IGFDi:7Ec6)>F!,CA%144#+<VdL
+<VdL+<VdLF*22=ATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#
+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL
+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:
+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/5b,
AOpTV0PX*O<(^+F<H;SnFC[[U:Khp!<GFKm?SH50:N()Q9P@R-75&4_BllRQCcu?I?WC#K4q.iA
+<VdL+<VdL+<VdL+<Ve:Df'H.4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL
+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL
+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KLTD/aN,F)rHr
+Cf>#ANVVeE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!
E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC
+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n
04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0gnhiDG5:XAofh:;.scZD+$BVFDteZ;)pUJFCeNm
/Tao_853)SFBN-e04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y3+Ccj@Z4q.iA+<VdL
+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@k])jA7]RgFCcS5@VTIaFE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a
$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc
@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL
+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)
AM.J2D(fF<@s)X"DKIOB0/7E46=smg<Ff$J1f@LHC11aaD.,A1F]rBTDHSkU7qccu7='-#G&]BC
=YF>sBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve;ASc""E',d^4q.iA+<VdL+<VdL+<VdL
+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(
CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W0Hr]$ASl@/AKZ28Eb'56DfQtBATMs7+D,Y4D'3J3Dfp#?+E)90$6UH6+<VdL+<VdL
+<VeJF_Pr/F$)*sE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC
+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a
,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?
E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0mP?,7q$=Z3HS=^A1^5)F_F`L=`$WAGtLMB
D*qZ*1N>6A0Q]9J2eP`W04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y3/A3;MR4q.iA
+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6
+<VdL+<VdhFCZM(CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL
+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DEKRnE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC
+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a
,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?
E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0jej&AN*5+:/Wog9/B7c9P$V4G@>N5G]n$q
CN+>pA7JYS=Z&ik=[?)$04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y3/F)X5p@6P,-
+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#
+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL
+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE9PtF)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad
+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,Rp
F$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL
+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2
D(fF<@s)X"DKIOB0/7KaB/E%t@S_5:@5C8?8p#8WB4b4fF&u"XCjJl8Df8BaCh%!1<d7Y<B.mh,
BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve;DJVEg@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*
4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W
0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ
,%E;N5%JA;FD5Z2@<-W9DIIBn+Dbb5FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T
@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<
@s)X"DKIOB0/7c_>'=g=/Mq&u9MA8bE`@'O7R:0mE]-NhFAI!K7S.YnDes]87!^UE1bWENBllRQ
Ccu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve;Ddtm_@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr
$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])j
AoD^,@<<W9DfTA2@rH4$ASuU24>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au
@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL
+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jH::5E3EAh"10.Ob20VqW
BNA8F;/pW#AlVE(G;NAo0JIfi92A2N6V:uEARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL
+CoG4ATU$f@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg
@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5'(:W+CT.u+Cf(nDJ*N'E+*cqD.Rg#
EcX>rF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V
@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL
+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/6:6EC2]W88(UfE`G[g
3GWPOAnY+fB4F:s=DMeG3-du0;FjV_<+K,g;(lKkBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL
+<Ve<A3;MR4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL
+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\lA8--.A8,OqBl@ltEd8dG@VTIaFE9Pt
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6
+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL
+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL
+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88
Df99)AM.J2D(fF<@s)X"DKIOB0/6%$D.Yap2.]BKCia\sF(ABuF_Ng10M>;:@QA^/;,g"O<A7Bb
<`W:<@kVD(BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<Ve<F?D3b4q.iA+<VdL+<VdL+<VdL
+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(
CghC+4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@k])jE-67FFCf]=+DG_8D]iV%BlkJABl7I"G<@O"E+*WJ%144#+<VdL+<VdL+<Wd"
E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ao,!HGC+<VdL+<VdL+<VdL
4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL
+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*D
DeElt/n8g:04]!2F_t]-F>%/X0ii'A:f27D:dmrSE%k3a1hB'`7mq!&2+V[P<+0fD:j,r3Ed:#,
1.aH"04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<Y<.F?D3b4q.iA+<VdL+<VdL+<VdL
+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(
CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,
@r,RpF$1^W0Hr\nATT&5@VTIaFE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V
@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*
+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL
+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7*>;E7EE8QJ2T=#jr+
6!-]pFEqReF]rB3CI2$!ARogZ<cMu"='/(<;(lKkBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL
+<Ve>ATVs;4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\nATT&'Cht5<DfTB0+ED%5F_Pl-
A0>u4%144#+<VdL+<VdL+<VdLAU%crF`_1W06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL
+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg
@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT
+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<
De!p,ASuTCA1oZY1g`O\0Paj0Eb8fK6>'1a9hR69:eakf7sA-G0NpkQ7R^$c?ZB1_DE':\A8--M
BP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdLB5DKqF$)*a4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ
%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar
,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W
0Hr\nCi<ckC`mb0An?!oDI[7!4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!
A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au
@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2t
CghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL
+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j@R=XO9k%$l?U@4KF`MYC
CfYFT<+[gV9Na/*9QEU%@X;[/:IfS&H#d[RARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL
+D5_64>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak
,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\jEb/[$AKYE!A0>`-A8,Y$+D5_5F`;Ca
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oYn1dthG1iQAa=CYiaC0FSO
:fB;5H?3t>=@b5^D)a=E8p3"'B4Y(_8TQOrA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
B666h@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jB4Z0-ARoLs+EqO;A8cZ7FCf]=4>1bp@;\7<
$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<Vdh
FE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,
@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL
+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3
@rH3;A8bt#D.RU,04Z^j>&%nW>$,]M:i^])0M?Ib78@Pl/TF^0H"8gMARo4[6"5(;D.H4\3GUo6
ARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+D>S1DJVEg@6P,-+<VdL+<VdL+<VdL+<Wd"
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,Rp
F$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%E;N5%JAKE,8s.+EM47Ec`FB@VTIaF:AR"+<VdL+<VdL+<VdL+Co&)@rc:&FD5Z2F$)*s
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+
4X+Ao,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,Rp
F$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?
Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X0k`F<Amo[l:Gcm.68DGb9NPt>
@7"Eu6#("*CdE1qAS<Yh:/*`i8l0+k04e[.F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YE;
A79+^4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg
@l#;m-6k6'0KVBMF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL
+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W0f1"_0fL:?%144#+<VdL
+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%/)8+E(j7A8,OqBl@ltEd8dG@VTIaF?D3tE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd
@r,RpF$1^W3$LNq$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL
4CK@BCghC+4X+An+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:
04]!2F_t]-F>%/X0lT-`H#ItF=tO_S=[d+G;`Ji%@4bN(<\d-@GZ89794Vj=G&^GPCJm-904e[.
F?aGT4_8M<<Dt)*%144#+<VdL+<VdL+<VdL+<YE;A8#OjE',d^4q.iA+<VdL+<VdL+<VdL+?V;u
E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+
4X+Aj0Hr[i$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4r
F)sJg@k])jA8-+(CghT3Df0B*DIjr(ASc<.AoD]48l%ha$6UH6+<VdL+<VdL+<VeNDfTB04>1bp
@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ
,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<
AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j/Mp7?<bk*?B/":=C/%f4DeN]\
2K`#?Gtp4e3DVq37!`roB1Ot)EaqfsARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Db[Q
04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#
+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5&F_DAKYE!A0>],@:UKnEc6)>4>1bp@;\7<$6UH6
+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6
CghC+4X+Aq,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh
@3B&r@<6KQ,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;
A8bt#D.RU,04Z^j6<7c=?W_>jDcJV^7;k&(9/(F"DaI#gDacWfA9pp*BM`,5:M)m^BLtWGARoLs
5A4jrAStjT;^+C7$6UH6+<VdL+<VdL+<VdL+Dbt+B6%rR04@$R$6UH6+<VdL+<VdL+<Vdh06;)@
DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg
@kfY]4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+
4X+Ai,!KX[Dfp#?+E)9CF*22=ATJu&+EqaEA0>f2+EV19F:AR"+<VdL+<VdL+<VdL+C\nuDf03/
+EVNa06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV
+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIM
DBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL
+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZSAp-j.3&!`qE+X$"
C,&@KH=q1Q0LJ<Q;Ia3*89R^I9JUKS0lKa#=(<mpA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL
+<VdLD..3k4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%EVW4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ
,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KXNDImisFCfM9A8,OqBl@ltEd8dK
@rc:&FE9PtF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"
FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6
+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m
$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^
0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/6m57;>e1F(\0m2f:W-@SgK/;+sMN1+c+D0eG1a
@<bFj>"NXB1I>eo<A.ooBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeDCi_]l@6P,-+<VdL
+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL
+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL
+<VdL4EGIMDBNG*@<6KQ,%E;N5%eGEATD4$AKYf-@:UL%@rc:&FE9PtF)YQ*4q.iA+<VdL+<VdL
+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL
+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6
+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS
@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/54J@r#7;912N`0Pj-CC,Rh*8U*!]=#ac.7r2^\0Jlp#
6qUuZGZ.s\=YF>sBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeEATqZI04@$R$6UH6+<VdL
+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL
+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL
4EGIMDBNG*@<6KQ,%E;N5%AVE@<?''@3BH!G9CF1@ruF'DIIR24>1bp@;\7<$6UH6+<VdL+<VdL
+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq
,!HGC+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA
+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ
,%EJS%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,
04Z^jF]UnLA9(CA9/LTr0R6Z4=&(\H6oJUuB50_9E,A^'6<,dC9Md]M6:Xm+ARoLs5A4jrAStjT
;^+C7$6UH6+<VdL+<VdL+<VdL+Du+>B6%rR04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL
+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA
+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!L3h
Eb'56FD,*)+CT;%+Du+>+DG^9B6%p5E-",pF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL
+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W
1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T
@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<
@s)X"DKIOB0/51k:J6"&CI`SmAo11"6Ut4!:GI05H9kn]G^)Vi/Sd."EGniP@TdJfD_G[4BllRQ
Ccu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeEF?D3b4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#
+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC
+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr\l
A8--.DIn#7FCfN8+EM%5BlJ/V06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee
4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oYsBP2<C3C-:sD)5X8CH#6m
GAB/n5rD5OA28-j6oA.;88:J85uBCQ8Tuh!A8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
DKe2r@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l
%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5%S8=F<GI4G9D*JEb%9cF)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6
+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m
$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^
0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7NBD+S:t<bZ/^:JtbA8muXS9LU[UC,\IG2)KA5
H9"]63H].=2bl;E1bWENBllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeFA3;MR4q.iA+<VdL
+<VdL+<VdL+?V;uE+*WJ%144#+<VdL+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL
+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Aj1a5*m$6UH6+<VdL+<VdL
+<VdhF)YQ*+Cf4rF)sJg@k])jDfB9*+Co1rFD5Z2@<-'nF$)*sE+*WJ%144#+<VdL+<VdL+<Wd"
E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<VdL4EPTd@r,RpF$1^W3$LNq
$6UH6+<VdL+<VdhFCZM(CghC+4X+Aj,!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL
+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W1E^0a,!HGC+<VdL+<VdL+<VdL+<VdL4CK@BCghC+4X+An
+q4l%+<VdL+<VdL+<VdL+<Ve?Eb/iG,%u(?E-"&n04]!2F"V*DDeElt/n8g:04]!2F_t]-F>%/X
0k=9>@q]=D6;]UW;H-UT7s7ii<`W%<1Ic+t6o@S]8nh:=;g;#O=D_,L04e[.F?aGT4_8M<<Dt)*
%144#+<VdL+<VdL+<VdL+<YW3@r#U;04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kfY]4q.iA+<VdL
+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a@;[2tCghC+4X+Ai,!KIE@r$4+
+CT.u+E1b!CER/%@ruF'DIIR"ATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,Rp
F$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"
DKIOB0/7<g7!)0r7n\/M7WVE`;J]3>3AtbFGtDF8A2,r<==mEC=]96W8mtJ(5qce[BllRQCcu?I
?WC#K4q.iA+<VdL+<VdL+<VdL+<VeGE]c!`4q.iA+<VdL+<VdL+<VdL+?V;uE+*WJ%144#+<VdL
+<VdL+<Wd"E'=^<+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+<VdhFCZM(CghC+4X+Ar,!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]"F`\a7
DIal"Ec6#?+ED%*ATD@"@q?d,DfTB04>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL
+?V<!A3LG0+<VdL+<VdL4>1es4q.iA+<VdL+<VdhFE/L6CghC+4X+Aq,!HGC+<VdL+<VdL+<Wdg
A0>Au@<6KQ,%E>O4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL+<VdL+<VdL+?X^a
@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS%144#+<VdL+<VdL
+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^jF_FreBhiqF853-)
<afDgE+MCO?ZSt#8nr6dGZJ?lDGNZ;3H]7/2E"\kARoLs5A4jrAStjT;^+C7$6UH6+<VdL+<VdL
+<VdL+E2IF4>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL
+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+
4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]%FDl22+E(_(ARfh'+DG^9A8,Oq
Bl@ltEd9c#F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL
4EP*V@r,RpF$1^W2Bk<o$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<Vdh
F)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL
+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/66i1f[:O6Y0/7
8n1OoBM^R*CKYU995AckA8*lHH8dcdA4C38@PL/#B.mh,BllRQCcu?I?WC#K4q.iA+<VdL+<VdL
+<VdL+<VeIAS5O904@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#
+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4r
F)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5&t4IBleB-EZen,@ruF'DIIR"
ATKseF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS
$6UH6+<VdL+?Xad+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL
+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6
+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS
@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7Wd;HZV4EcQD6G;N8h:31SLE+CqI:f_1B=]nC810-eg
2+2Fe<AujDF"_*8BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeIATMs(4>1,,%144#+<VdL
+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL
+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL
+<WdfE+*W,@r,RpF$1^W0Hr]$ATMs3Eb-A&@:O(qE$/\*@ruF'DIIR"ATKseF)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W2Bk<o$6UH6
+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m
$6UH6+<VdL+<VdL+<VdL+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^
0/$jS@rj88Df99)AM.J2D(fF<@s)X"DKIOB0/7KBARA>%2aLPVE\^Eb:0(&191D9g96WfY12:T#
824Oe:j"^A;f"1)5qce[BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeIAThuS04@$R$6UH6
+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL
+<VdL4EGIMDBNG*@<6KQ,%E;N5&=qSF<GU8@qBP"Cj@.DAThd/ARlp%@VTIaFE9PtF)YQ*4q.iA
+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad
+Cf4rF)sJg@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,Rp
F$1^W1*Smk$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL
+?X'T@r,RpF$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2
D(fF<@s)X"DKIOB0/7]?7o<*,D0]#TB4X)?GtqF#BgXk&6XiMf:blf^BOihdG=H1aB1Xst75&4_
BllRQCcu?I?WC#K4q.iA+<VdL+<VdL+<VdL+<VeIATi!0AU$<j@6P,-+<VdL+<VdL+<VdL+<Wd"
F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,Rp
F$1^W0eae8%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%E;N5&t4EASuT4DdmHm@ruc7GA2/4Dfp.2$6UH6+<VdL+<VdL+<Ve<G]7J-DIIX$Df0VY
06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4r
F)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*
@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg@l5G>$6UH6+<VdL+<VdL+<VdL
+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTCA1oZ68Sq7I9OCUkG'QVICKX^o
0JtF6F_a9U/Tc.rFCSlV77CBG@V9[u@Tb?qA8--MBP]hCDI6CB,!HGC+<VdL+<VdL+<VdL+<VdL
Ec!ol@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@k])jEcl7BD.-ppDf\#oF)YQ*4q.iA+<VdL+<VdL
+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<Wd"FE0PS$6UH6+<VdL+?Xad+Cf4rF)sJg
@lPYr%144#+<VdL+<VdL4EP*V@r,RpF$1^W0d8dj$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W1*Smk
$6UH6+<VdL+<VdL+<VdhF)YQ*+Cf4rF)sJg@l#6;1a5*m$6UH6+<VdL+<VdL+<VdL+?X'T@r,Rp
F$1^W2'NJ:+<VdL+<VdL+<VdL+<VdLBQ@Zr4X+Q]FDu:^0/$jS@rj88Df99)AM.J2D(fF<@s)X"
DKIOB0/6O-2e$926ShhA;G^2189]>=DGa;U:0DjC1/q1u6!.YWC,J=]:c!!+=YF>sBllRQCcu?I
?WC#K4q.iA+<VdL+<VdL+<VdL+<VeIFEBVu@6P,-+<VdL+<VdL+<VdL+<Wd"F)YQ*4q.iA+<VdL
+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W0eae8%144#
+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5&td`
+EV%7FDku6B6bVAATMs74>1bp@;\7<$6UH6+<VdL+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0
+<VdL+<VdL+<WdgA0>Au@<6KQ,%EMT4q.iA+<VdL+<VdL+<VdhE$/Y,@<6KQ,%EAP4q.iA+<VdL
+<VdL+<VdL+?X^a@;[2tCghC+4X+Al+Cd5P4q.iA+<VdL+<VdL+<VdL+<Vdh@3B&r@<6KQ,%EJS
%144#+<VdL+<VdL+<VdL+<Y?<AS+(LBQS?8F#ks-A8bt!/n]*@B5D-3@rH3;A8bt#D.RU,04Z^j
9Nb4nBe<:>F%L:;;D:F78833)GrA$5@UDc@>&Q]#=AF!)=CYi^E,mokARoLs5A4jrAStjT;^+C7
$6UH6+<VdL+<VdL+<VdL+E_a:A7BgH04@$R$6UH6+<VdL+<VdL+<Vdh06;)@DE\L:+<VdL+<VdL
+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@lY_s%144#+<VdL
+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5'LpcA9/l(
Bl[cpFDQ4F@ps1iARlomGp$N)$6UH6+<VdL+<VdL+<VeNDfTAN06;)@DE\L:+<VdL+<VdL+<VdL
4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL+<Vdh06D4u%144#+<VdL+<WdgEZek.@<6KQ,%ESV
4q.iA+<VdL+<VdL+?XaV+Cf4rF)sJg@kf/k%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@ko5l%144#
+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%EDO@l,An%144#+<VdL+<VdL+<VdL+<WdT+Cf4rF)sJg
@l5G>$6UH6+<VdL+<VdL+<VdL+D>e,Aj%>OFEDJC3\N-sDe!i@B5_^$Ch55/Df%.<De!p,ASuTC
A1oZ4<CTGn1O3ChBif+M0MXMX9R/45A2ZGB:GP[[AoVa7F_imG6=rqn3CPT4A8--MBP]hCDI6CB
,!HGC+<VdL+<VdL+<VdL+<VdLF`V,84>1,,%144#+<VdL+<VdL+<VdL4>1bp@;\7<$6UH6+<VdL
+<VdL+?V;r4q.iA+<VdL+<VdL+?V<!A3LG0+<VdL+<VdL+<WdgA0>Au@<6KQ,%E>],!HGC+<VdL
+<VdL+<VdL4E)EQCghC+4X+Ak,!HGC+<VdL+<VdL+<VdL+<WdfE+*W,@r,RpF$1^W0Hr]$ATW'8
DBO.AEb$;8F(KDT06;)@DE\L:+<VdL+<VdL+<VdL4>1Y;%144#+<VdL+<VdL4>1ee4q.iA+<VdL
+<VdL+?XaV+Cf4rF)sJg@l>Mp%144#+<VdL+<VdL+<Wdc+Cf4rF)sJg@kf\^4q.iA+<VdL+<VdL
+<VdL+?X^a@;[2tCghC+4X+Ai,!J+BF)YQ*4q.iA+<VdL+<VdL+<Vdh05s)a$6UH6+<VdL+<Vdh
06C_g%144#+<VdL+<VdL4EP*V@r,RpF$1^W3?gWr$6UH6+<VdL+<VdL+?XTc@r,RpF$1^W0ejk9
%144#+<VdL+<VdL+<VdL4EGIMDBNG*@<6KQ,%E;N5!1K>E+*WJ%144#+<VdL+<VdL+<Wd"E'=^<
+<VdL+<VdL+<Wd"FC[QE$6UH6+<VdL+?V<!E]sp>+<VdL+<Wd"FCK0!Gs2ZE+<VdL4>1eb@VfU>
%144#+<Wdc+Cf4rF)sJg@kfea4q.iA+<VdL+?X^a@;[2tCghC+4X+Ai,!I=u0fC^I4>1bp@;\7<
$6UH6+?V;r4q.iA+?V;dDe+,W%153NBQS*-4q.j6De*fqEc#kQ0ht%f.V`m4E+*d(F!,NU/KeS8
AmoguF<G+.@ruF'DIIR2+E1b0@;TRtATDiE%15is/e&._67sB[BPDN1Anc'm+DGm>F`V,)+EVNE
F(KG9+EV:.+<Y3+AmoguF<D]:Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g,7E@VfTu+DG^9FD,5.
D..L-ATAo*Bl%?5+BN5fDBL'1+<YQ5G9CF1@ruF'DIIR2+DGm>@rc-hFCetl$;No?+EV:.+<YW3
Ea`frFCfK6+<YB9+EV:.+<YN0F*(u6+D,>(AKYE%AKZ,:ARlp*D]j+?ARfFdGp"5OBOqV[:-pQU
E+*cqD.Rg#EcW@8DfQt/+E1b0FD56-Cgh?,A8,OqBl@ltEd98[<+ohc+Eh=:@N[(0E-#T4.3N,/
D@HqJ67sBiAKW*<F`V,)+<YcE+<VeDDe*QoGp"5K@<,dnATVL(+<Y`:FED57B6,1<+DG^9+<YB9
A8-4$A9D<s%15is/g+\=@ruF'DIIR"ATKIH+AH9cFCfJ8+D,>(AKYr#Ea`frFCfK6+Ceht+E).6
Gp$R-+Cf(nDJ*Nk+C]U*$;No?+D#(tFD5W*+EV:2F!,(/Ch4_tDIal1ARfal@<?4$B-;;0AKYhu
F*(u6+D,>(AM+E!:-pQB$;No?+B3#c+DkP.FCfJ8Anc'm+Ceht+C\n)Eb/a$ART[lA0?)1FD)e=
BOr;r@;Ka@%15is/e&._67sBjEb/[$ASkjsFC/HkDe*2t8khTM<(0\l@;9^k?O[?;67r]S:-pQU
=$]_Z8PVc:+CT)&+EV:.+<YW3Ea`frFCfK6+CfP7Eb0-1Cj@.>BleB-A0><$AKZ#)EHPu9ARlom
Gmt*U67sC&BOr;Y:IH=HH#n(=D(Zr&AfuA;FWb^9D/XT/+CT/5+E(j7FD,6&+A,Et+EqO9C`m5.
@<6*7+B`W*%15is/g+Y4DBL'C@:j(eGp$O+A0>;kA8-."Df0!"+E1b0@;TRtATDi7@Wcc8+F.mJ
+<Y0&DJjB7+ELt'AScW$$;No?+ED%1Dg#\7@s)g4ASuT4E+*cqD.Rg#EcWiB$4R>:5uU`O;G]YW
9iE/t3Zp+!3Zp*c$4R>;67sB[BOr;uDfT]'F<GL6+EV:2F!,F1Ea`frFCfJ8Anc'm+DGmX%15is
/g)8Z+<YE:@;TQu4!5qnH#R=D+Co&)@rc:&FD5Z2+?L]h@;L't%15is/g(T1:-pQU+<VdLC2RHs
AKY].+CQC9@;KXg+A*bo@;TQb$;No?+<VdL+=M>WE+LI@A7]glEbTK7Bl@l3A8bt#D.RU,F!,R<
AKYr#Ea`frFCfJ8/Kf.\E+L/+F!,L7EHPu9ARl5W:-pQU+<VdL+<VeFDJXS@-nB"LFCf)rE[`,F
F!+t8EcP`/FDQ4FAU%crF`_2*+E)@8ATAo8H#R>9+EqO9C^g_H67sB'+<VdL+<Y-)+E1b1F(Jl)
@<3Q$BOPpi@ru:&+Dbb5FE8QQF(Jo*A8lX!@VfU)/e&._67sB'+<VeM@;L't+DGm>@;[3!G\(B-
FCAWpAKXSfAU&07ATMp,Df-\>BOQ!*E,ol-F^o!(+CQC9@;L't%144#%15p3<(9/@<)6C7+?L\o
.qrmCAS5Rp.3NhQEb'56F*)>@ARlotDBNk8AKYf-Df?h<@<6K4+=Jru4F'%E0Jka<+<VdL+<W`g
0eb9j$:dNa7R9C@:Jr;X4!5q%Bl8$(B4Z*4+EqaEA9/l6ATVs,AThWq+DG^9Df0,/Ci=62+E1b1
F!)kc0KaVC1,(OE.3K`U+?L]$2)#IH6VgN]7R9C@:Jr;s+=JaSDKKH&ATB4B@rH4'Df0-(FE8R7
DfBE%A0>T(+E)./+Dbt7E$0+.F)rHH-o!i04>J`I.3K`U4!6730F\@W<D?:Z5snUI;BS%D-nB"L
FCf)rE[`,L@VTIaFE8R8F_u)/A0>T(+E)./+Dbt7E$0+.F)rHP0g'_D1,L[6+<VdL+<Vdg+>kh^
$:IZW<D>nW<*)XZ<(J,n+=JaSDKKH&ATB4BGA1T0BHV5*+DQ%?FD5?$ARlooDe!p,ASuT4FCf]=
+<W'f0KaVC1,Up<+?L](0b"IU;aX,J3&Mg$+<W`g-nB"LFCf)rE[`,TBOu'E0d(U[AKYE&@qfX:
2'?UN+CoV3E-!-M0Hb:S+>G;f+<VdL+<VdL+<Vdg+>=63%15is/g*GtGp$O+A7]9oE+*cqD.Rg#
EcW@3Eb-A7FDl22A0>T(+EV:.+DkP.FCfJ8Anc'm+EqL1D@HqJ67sBjEb/[$ARlolDIal#BleB:
Bju4,ARlp*D]hYJ6m-#SEb/a&DfU+GDdmHm@rucE+<V+#%15is/g+4];GKeY7lhc:BOu'(A7]@e
DJ=!$+A*bfG]7\7F)u&6DK?q0AKYJkEb/j*C`m.qDfp.EFD,5.4!8$H@<,ddFCfJ8%15is/g,7L
AKXT@6m,uXA7Zl3A8lX!@VfU)+EV:*F<GO2EcYf5+EV:2F!,OGEbTE(+DGm>Ecko,D.RU,@<-WG
%15is/g+1d;b9qa;BS%D-t?q!Ea`I"ATB4BAU&07ATMp,Df-\/G\(B-FCeu*@X0),Bl[cpFDl2F
+E(_(ARfg)G%l#3FDl1B+?L]VEc5o-BlY=M%13OO:-pQU6VgN];FsAL<$47F-t?q!Ea`I"ATB4B
4!6h*C`mb4B4uC.+ED%7ATDs*A.8l@67sBT=\qC^5tsdI78b6i+=JaSDKKH&ATB4BFD,5.@;^.1
ATAnT+>bh_$7QDkC2[X%A7f1J=B%%5<+oue+Co2,ARfh#Ed8dAF!,L7F(KB8ARloqDfQt8De(J>
A7c8X%16igA1hh3Aftf/+Du+>+CoD7DJX6"A7]9oGA2/4+EV:.+Cf>1AKXT@6m,oKA8c?<+B38%
%16Za@:F%a+Dbt+@;I&7C2[WrASc<7+AbHq+ED%%A8,po+CoD7DJX6"A0>W*A1hh3Aft]+Df%NE
$4R>UFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EV)$4R>NDIal"DfBtEBlkJ>D]j.8
BlbD-Bl[cpFDl2F/e&/&De*g*F*'/l:-pQ_C2[X%Df^"CF"Jsd8l%htE,Tf>E,ol,ATMp2EZfF5
EbTK7/g)8G$;No?%15is/g+)7@<?'tASuU2+DG^9FD,B0+EM%5BlJ/:@<,p%AU%crF`_2*+CSl(
ATAnc:IH=>F!,:;@:Wq[/e&-s$;No?+DG_7F`M%9G@_n*Eb-A-DBNCsF(HI'$=e!aF`MM6DKI!K
@UX=h-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4W@<-H4C2[Vl$>OKiDf-[O%13OO:-pQUCi<`m
+DPh*FDl)6Et&IdDe!p1Eb0-1+=CW,F(H^.$8<Va0H`JmDe*p7F*(u1E+*j%+=CoBA7^"-F"_9H
A9;a.Ci_4CC3(a3$4R>;67sC&F`M@B@rH4$ASuT4Eb0?(DKKT2DBNk8%14LD+Z_G7.3L>S$>OKi
E,oN/1,2Nj/h1USA8lR#E$03R/KdY]6m-GhAT2[.@qB_&DfQtA@rc:&F=n"0:-pQB$;No?+B*Aj
FCf<#DKKqBBl5&8BPDN1F(96)E-*42Eb-A)G\(B-FCeu*@V'.iEb-@c:IH=>F!,:;@:Wq[/e&-s
$;No?+EVO@+DbV4AS`K#EcQ)=+EVX4E$/b2EZek1Eb-@c:IH=LDfTB0+:SZmDe*p$?YO7nA7$HB
3Zp+#?Q_EQ-V@0&+B)EA<(0M(7R9U><Dl7H+DbJ-F<F0uATDg0EZcqt+=A@?+=nX>3Zp.5+Z_>5
+=AN\?Q`Pq>n%,M$>OKiF*VhKASlBpFD,$-?TgG++?CW!%13OO:-pQ_C2[X(H#n(=D/`p*BHVIM
/Kf"@FD)e8Afs]A6m-PrF*(u1+>"]h+EV18D/!lrFCeu8%15is/e&._67sBUDffPO+Eh10Bk/>u
DfQsm+>ti+0d'nBA0>;iDg#\E%15is/e&._67sBtDf/uo3ZoP[De*p7F*(u1E+*j%+Cf4aAnc'm
%15is/e&._67sB'+DPh*F*VhKASlBpFD)dEC2IC#FCfJ?%13OO:-pQUA7]@eDIm?$8g&2#F*(u1
+Dbt+@<?4%D@Hq$C2dU'BHS[O@:WneDK@IDASu("@;IT3De(LK.4f`e%14Nn$4R>PDe!TlF)rHO
@;9^k-OgDT9gM]W78c90+DPh*F*VhKASlBpFD)dEC2IC#FCfJ?+<VdL+<VdL+AP6U+Co%q@<HC.
+DkP.FCfJ8-n6i`C1\n;Anc'm%15^'6r6cW7QidTC2[X(H#n(=D/`p*BHS[;De*g-De<^"AM.\3
F!i(Q:-pQUA7]@]F_l.BE,ol/Bl%?'F(96)E-)NrC2[X%Eb]GH2,$;&<(U%_76N[S-V@0&+=K&q
+CT.u+EV:.+A*bQEc5](@rrhf@;]LdATB.-$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@
EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX5sdq79he&O<)Yq@+=C-%BlbD5@:C@#BQ&*9+D>\;
+A,Et+CT.u+EV:.+A*bQEc5](@rrhf@;]LdATAo'@;[2sAKZ,:ARlp*DeEX'BOu3,9jr;i1,(CA
-OgDV5se%:6WI&J3Zp*c$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMPI6m,oUA0>u-AKXSf:i^JhARfg)9jqpJ
B4Z)m$;+)^+CT.u+EV:.+A*bqEc5](@rri1@;]LdATAo%Eb-A8GAeU6Df'H0Bl.F!FCB38+EMI5
FE_/6AKZ)5DesJ;FD,*)+Ceht+C\n)ARTXoCj@.5Df&rtDIm?$F)N10Cht59BOr;u@:O"fBln'#
F!,C5+C]82BHVAAF*(u1F!+t$DBND"+CT5.Ch[Hk+EVNE8g&(nDeF*!D/F!)B.b<+BOr;Y:IH=H
H#n(=D'3P7F(K0"+Eq78+E1b0FDQ4FA7]pqCi=9(A0?#9Bl7Q+F*1u++CT.1@;p1+Ddd-h/e&-s
$<1\QF!,:-@N]*#F*2>2F#ja;%14L<.3MT'AKY`+A92[3EarZ'@:WneDBNV$F!+q'ASrW)DKBo.
Ci!Zn/e&-s$7IYY+@.-!8l%iO;GTnR6W>1?DerrqEZf=>Bl8$,DJ()6D]gHCDe*BiFt"e[+EDC=
F<G+.Eb/a&DfU+GBOPs)@V'+g+Cf>-Anbn#Eb/c6%13OO-o3:p5p1VK:IJ/N;cFlODerrqEZf=>
Bl8$,DJ()6D]iI2FCfN8+Co2,ARfh#Ed8d@@<3Q#AS#a%@rH6sBkMR/ARmD&$4R>AD]ib3F*(i,
C`mh5AKY`+A92[3EarZ'@:WneDBO(CAKZ).AKXSf:gmjL@:s-o9jqpJB4Z*+@;]TuFD,6'+EDUB
+EV:.+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+<XBE919t%<Dl7.=\i$?9i"eY
+@/aj+AtX'5tscj<(KG#9M[rB+@Jdg<(Tk\5uL9C;]nY,+B1m#+A>("<$5+=78P+&7NbZ$8Q-a*
5sd15$4R>BF(HId-Z^D?Df00$B6A6++EVO?C`mh<+EM+9+FZpY6r6cW8ju*H+CT.u+FZpY6rZTR
<%\Ue.1HW)AT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[oEb-A%DIakdDf^"C
:i^JaATMp2EZe:jEbTK7Et&IUBOr;Y+E2@>C1Ums+DkP)@:s.l+CT)&Dg-7FF`V,7F!,RC+Co%q
Bl7K)@;]TuAU%crF`_1;@<,gkFE1f1Gp#^%E,oM4@;]TuE,Tf>+E2@>@qB_&DfQtA@rc:&FE9&W
+BN5fDBN@1E,ol3ARfg)BlbC@@WcC$F<ViLBOr<*Eb031De!@"F)Q(AF(96)E-*4CF`)7CAnc:,
F=\PHDes6.G@b;-@X0)<BOr<(DfT]'C`m20Bl%<&E,ol,ATMoD+D,P.Ci=N/A0>?,+EV:.+E27?
F<GOCDe!@"F)Q(O+<XWsAKYr4AKYE!A0>i0F*&ODEc5H!F)u8?+EM%5BlJ08+CT;%+EV:.+DYP6
F!,RC+E_a>DJ((a:IH=LBln$&DBO%7AKXSfE,ol3ARfg)D..<jB4Z*9%14Nn$;No?+EV:.+E2@4
+CT.u+E27?F<GOCDe!@"F)Q)?+CT;%+Co%qBl7Km+DG^9@3BN0De`inF=2,P.P>FME$/b,Ch54.
$4R>;67sB/C2[X%Ec5](@rs>;C2bUEE,oM4@;]TuE,Tf>+E2@>@qB_&DfTnA%13OO:-pQU:f9_K
<CokP7S-9B4ZX]5IS*C(:f:(]771$-F(96)E-*aJDe*g-AT2U/C+a48F!hD(%15is/g*td;cH(`
8PDNA8PDQ93Zof!8l%iO;GTnR6W>^[@rc:&F>%BIA8lI.FDu88/no'A-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l3:N0l_+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+%16'Q+DGY.F`VYF@<?''8l%i&F!,UHAKZ22
FD)e=BOr<*Ec5](@rri1@;]LdATAo;AKZ22Cht5:F(HId:IHRO+E)IA+EMIDEarZ'A8,OqBl@lt
EbT*+/g(T1%16'JBlbD<FCfD6@<6L4D.Rc2FD,5.C2[X(Dfp)1AKYDlA8c?.BOPs)@V'+g+CoD7
Ci<`mARlp-Bln#2FD,5.:gmjL@:s-o9jqpJB4Z*+@;]TuFD,5.8l%htF)Q2A@q?cnBk)7!Df0!(
Bk;?.-u*[2A7]p5/0H?UDe(:>@;]Tu.!9WGCi_$JBOQ'q+C\nnDBO"3FEMOT+<XR)DBO%7AKYet
@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.F+DGF1FD,6,AKYMt@ruF'DIIR"ATJu&Eb-A2
Dfd+CATW'6/e&.:%15is/g,(OASrW/DJXS@8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.%17#a+?MV3
C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$4R>;67sC+Dfm1DBQ&$0A0>PoG%De<BOr<.BQ@Zq
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++E)-?FD,5.E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[bBOt[h+FZpY6r6cW8ju*H+E1b2BFP;8AS,k$AKYQ/FE1f"FD5W*+EV:.+=LuCA8lR-C1Ums
/no'>.3N5:Ch4`$Ec5e;FD,5.8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.D..3k+EM[GAKWCM8l%iO
;GTnR6W>KWE,TH.FE8RHD]gHCDe*BiFt"e[+C&ttEbTK7+Co2,ARfh#Ed98H$7QDk:-pQU8S0)e
BOu6r+E1b2BQG;,D]iq9F<GF/FCSu,F`V+:8ge[&@rH6sBkMR/@<?4%DBO%>DepP<D]j+4F:ARP
67sC08l%iO;GTnR6W>1MD]ie5A7T7p-Z^D8F(96)E-*45Bl[cpFDl2F%13OO:-pQU+E2@>C1Ums
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<YE;A7T7p+C&ttEbTK7+:SZ+FDku6G@be;C2dU'
BHS[O8l%iO;GTnR6W@<3@rc:&FBg1B+>#VsFDku6G@be;+tb6A6W.8=/1<T,3dWJI:dJ&O?XH`2
?XHE$6uQOL.4ciR-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37qHRLEaa'$+Ad)sC1Ums+AH9^@:s.l+@^']
ATJ:f<+ohc8g$rNDe`inF<F:dDII0hEZfFFDfTE1+CT)&+E2@>C1Ums+ED%0@<?'k+DG_*DfT]'
FD5Z2+DG^9@3@$PBkhT0E,ol3ARfg)Anc'm/g)95Ec5](@rri*Bl%@%+CT;%+D#V8ASuU(@;Kb*
+A*bt@rc:&FE8RKBln#2@3B)pAnGUpASuT4Anc'm+D#e>ASuR'Df.0M+B3#c+=LuCA8lR-C1Ums
/no'>.3N5:Ch4`'F!,OGDfTE"+DG^9FD,5.8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%14Nn$;No?
+EDUB+CQBb:IH=I@<H[1Ci<s3+EV19F<GX7EbTK7+EVNEAU&<;@:OC%DIm<hF('*7+E2@>C1Ums
+D,>(ATKI5$4R>_FEAWQF(KH9E*m?uA8lR-C1Ums-QjO,67sC$ATN!1FE8RGBQ&$0A0>;sC`kG[
Et&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3:18<[B45mn+EVNEIS*C(:f:(]771$ZF(96)E-*45Bl[cpFDl2F
%15mMASrW4BOr;_Ec5](@rrhf@;]LdATB=EDII^&B45mn+EVNE."4ca6r6cW8ju*H>]XCqBlJ/C
+CT.u+E)41DBL?BDe*g-De`inF=q9BE%)5'.1HVZ67sBu@<Q?t@<?''FDhTqC2dU'BHS[O8l%iO
;GTnR6W@<3@rc:&F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@:3bCh+Z#F_kl>+Cf>,D.RU,ARloU:IGX!
8l%htF)Q2A@q?csF!,OGDfTE"+DG^9A8,OqBl@ltEd8d<@<>pe@<6"$/g)95Eb0<5+EV:.+Ad)s
C1Ums+AH9^@:s.l+<j-pBl%<(+C]J8FDl%>FDi:7ASu("@<?''F)Q2A@q?d(@rc:&FE9&D$7QDk
:-pQUE,oN2F!,R<AKXfiDe`inF<F:dDII0hEZcPmF_PZ&+s:?;FEDG=%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[aEc6/CAKXT@6m-PhF`Lu'%15C5FCfJ8@WcC$A8,po+EV:.+E2@>C1Ums+F.mJ+Ceht+EhI1
G9BLR6m-PhF`Lu'+E)-?FD,5.E,ol3ARfg)D..<jB4Z*2F!)Z*Dfp)1AKi7=@:Chu$7QDk%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+A?]^A0=K?6m-PhF`Lu'%15pPATMp,DJ()6BOr;_Ec5](@rrhf@;]LdATB/>
+<jKt@:UQ)@Wcd7Df-\6Ddd0t+CQC)F_kl>+Cf>,D.RU,ARlp)Dfp)1AKY])FDi:1@ruF.AKYK!
@<6L$F"SRX<+oue+DGm>F`V,+F_i14DfQt2AR]dpB5)6r+CT.u+D#e:Ci=?.DJ((a:IH=8De*E3
%14Nn$;No?+E2@4F)rIGBOr;_Ec5](@rrhf@;]LdATAn;9Q+?M+q4kg$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
;KZk"6=FqL@j"B>6m-S_F*)I4$:/PPAU%X#E,9).FCfN8+EM%5BlJ/:BOPs)@V'+g+D58'ATD4$
ARloqEc5e;8l%ht@;]TuEb/ioEb0,uARmD9+@9XODfTD3Ecl8;Bl7Q+FD,B0+EM%5BlJ/:@rc-h
FCcS9Df'&.FCfN8+Co1rFD5Z2@<-'nF"SRX%13OO<+U,m+Co1rFD5Z2@<-W9@rc-hFD5Z2+ED%5
F_Pl-F!+m6@rH6sBkMR/ARlp48l%iS78m/.A8-'q@ruX0GqKO5.1HVZ67sBjEb/[$AKZ)+F*&O8
Bk)7!Df0!(Bk;?./Ken=DL!?s:IH=IATMr9F(96)E--.DEb/ioEZfIB+EV:.F(HJ)Bk)7!Df0!(
Gp%!5D.Rbt$?C61+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\Q
F!,OGAT/c4F`)7CFD,5.E,ol3ARfg)FCfN8+EM%5BlJ/H+<XWsATD?)@<,p%D..=-+E)@8ATAo8
ATMr9F(96)E--.DF*)>@ARlotDBO%7AKXT@6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATKIH+B3#c
F(HJ8@rc:&FE8RDEc6,8A7Zm$F_t]1Dfp+DAU%X#E,9*,+E(j7BQ&);FDi:EF(HJ&DIaku@Wca'
+A,Et+EqaEA90@4$7QDk:-pQU:i^,gF!,R<AKXfiDe`inF<F:dDII0hE[PoN,#i,pF<Vi:F`__D
DCuA*%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C'b@r-:/Bl@ku$<1\QF!,:-@N]`*Dg,c'+D>\;+EVNEF`V+:
8l%htGA2/4+EV:.+A*bQEc5](@rrhf@;]LdATBC4$4R>7DeO#26nTTK@;BFp%15jKG%GN"ATAnK
0JGEp$=[FZATDNr3B9?;D..-p/n8g:%14Nn$4R>WDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G
/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1
@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`
67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3F
BlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#
Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?
+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS
9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4
@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5
D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()
AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(
EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B
+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+
Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o
@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!
$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.
DI[5e$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+:SZfDe!TlF)rHO
BkhQs-OgCl$;No?+D,P.Ci=N3DJ()#Eb-A,@;]V$+=Lr=De(:>Ci<flCh4`1BQ%p5@s)m73XlE*
$;No?+E2@>C1Ums+EM47Ecbf6FE8QV+E_a:+D#e:Ch[BnF<D#":-pQUA7]@eDKKT2DK?qAD]ib9
-Z^DA@<6]:FDi:BATMF)+EV:.+D5_5F`9!TF_Pr/%16NV4ZX]A+?CVmC2[Wq+CSekB6%r6Gpa%.
@<4Rm+>Y-$+=ARPDe*oN1FXGTA7T=nE$0ER%16WY4ZX]A+?CVmC2[Wq+Co&"B6%r6Gpa%.A90mp
+>Y-$+=ARPDe*oN1FXGWASc""E$0ER%144#+:SZQ67sC$AS,LoASu!hA0>N*Dfp"AGAhM4F!,@=
F<G:8+D5_5F`7csDKn<*+>Y-$+=ARGCi"-'Aof(;I4cXTDCH\[/g+eE4Y@jiEc<.9De*K.%144#
+:SZQ67sC)DfTB0+DG^9B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+=DFWF`V,)@X0)E/g+eI
E$/n6A7m8!$6UH6%15is/g+e<DImisFCcRA+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$-Z*[@
+DPh*B-:D$Gpa%.%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?+DG^9Eb0E.
F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1
Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;
67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`
D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E$0@CEb'5#$>='83ZqWf+D>S1DJUG"3Zri'+D5_6
%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*Ec5e;@rGmh
3XlEk67sB'+D>d<1a!o967sBt@:O=r%15is/g)8ZBQ>4N+<XEG/g+eIDfp#?%16ch4ZX]?1E\_$
-[?hJCiF9.+FPjbGp%-=G&JKN-RU8a>9J2=%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3
AoD]4DJsE:DfTB0%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![
Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11a"h%-Ra3j3%5thF`\aO4(`2IF*(o1
D/Ej%FC/BI:IK;CDesJ;GT^O2F)W7I-OgCl$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dO
DfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3ZoduDCdD].3Kja+>#3-0RFuu+EK[u0Hb"E
Ddmc75&NM9I4fPOG&J`U-RU$@+F,=D$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R
3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs
7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=4
8l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8
F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUARoLs+Cf>,D..<m+:SZG
:IA,V78?fL:JFPL:..6++=D5DDg-//F)rICEZc_WH[\_=I4$Bi%13OO:-pQUAU%X#E,9*,+E(j7
8l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.
@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuic
F`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>
>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<%15is/g)kkEbupHE,o].De(4<>9J!(
Dfp/@F`\aEA0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+YHEcP`/F<GXH@<-H4F`7cs:-pQU
F)>i<FDuAE+E(d54$"a+G@b8o+E_d?Ci^s5$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<DrF
C2[W1%16igA92[3Ear[%ATW'61,2Nj/h1USA92[3Ear[%ATW'6+<VeJ/M/(f@rc-hFCfM9+CT.u
+<VeCDdd0t+<Ve!:IH<JA7]pqCi=90ASuT!$;No?+Co1rFD5Z2@<-'nF!,(8Df$Uh:IH=9F_u)=
/e&._67r]S:-pQU<+oue+<VeJ@rc:&F<D\K@rc-hFCfM9+<Y*1A0<"2Ddd0t+<VeKBOr;/8l%ht
+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.-u*[2A7]p8+<YE;A1SjGFD5Q4.4u_c<,Wn"
F`&=DBPDN1+EM%5BlJ/:+EV:.%15is/g+bECi"$6Bl7Q+D09oA+D>\0A3(/,:-pQB$;No?+Eh=:
@UX@mD)r+5:-pQB$;No?+>>5e8g$#E0R,60/hhMmD09oA+C\n)Bl8!6@;KakA0>f.+BN8pA8c[5
+E)9C9PJBeGV0F4:-pQB$;No?+>G;f<+ohc8l%ht@:WneDBNe=F*&O6AKY])F*(i,Ch7-0+B<Jo
+A+pn+EVNEBl8!6@;K`h$;No?+<VdLB4YslEa`c;C2[Vl$;No?%15is/g)nu+B3#c+A,Et;bpCk
6U`,+A7TUr+Dl7BF<G%(+DG_7FCB!%ARmD9<HD^o8jQ,nFDi:9DKBo.ChsOf:-pQU+<Ve>ASu("
@;IT3De*p-F`Lu'%15is/e&._67sB:.3MT'AKXT78PDQO+CSekDf-\7F`VXI@V$ZrDKBo.Ci!Zn
/g+/8AKXT29H\Fq+DG_7FCB!%%15is/g)8Z+Cno&@4uA-Bl%@%%15is/e&._67sB;.3MT'AKY/J
:`r5!9LVl&@:WneDBNe=F*&O6AKY])F*(i,Ch7-0+B<Jo+A+pn+EVNEBl8!6@;K`h$;No?+<VdL
@<,j2H>.=-$;No?%15is/g)8Z+<Ve.5uLHL:.I>fFD,5.@<,j2H>.=@@:WneDBNG3EcP`/FDQ4F
-o!GeARdGT.3NPHCj@.IDfTW7%15is/g)8Z+<VeFDBL_j@VKp,F*VhKASlK@+B)i_+B3#c+A,Et
+AcKZAKYE'3XlEk67r]S:-pQU+<VdL+D>k=E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;
C2[W7E+*Bj0+A7`67r]S:-pQU+<VdL+@^9i+DG_7FE2M6FD5Z2F!,C=+Dbt)A8,po+EV:.F(HJ)
Bk)7!Df0!(Bk;>p$;No?+<VdL+<YlBFD,T8F<G^IBl7Q+FD,B0+EM%5BlJ/H%15is/g)8Z+:SZQ
67sB<.3MT'AKYMtEb/a&DfU+G@ldk0De**f2_Zsk+=MGJDCH]HEZd#KDf'&=HR)-X9gsI`C2[W9
C,[h$0-DZZBl8'<.1HVZ67sB'+<YNDF*&O6AKYQ$E--@X%15is/e&._67sB=.3MB(+A,Et+Co1r
FD5Z2@<-'nF!,[@FD)e7@;TRs+=LuCA7T7p/0J\GA1SjGFD5Q4.3N2HBleAK%15is/e&._67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;D..]F1^sde67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
0k=j*0f^@bA7T7^+Du+>AKYDjDfp.E@<,j2H>.=@AmoCiF`M%9Df-[U1a$7AF<GXMF*(u1Et&Hc
$?B]tF_Pl-+=Cc8Ch7Z1FCB6++ED%+AU#>.BlYR1$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC+
+EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5
-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1GFCAm$F!,OGEbTE(+C\noDfTD3Anc:,F<GL3@s)g4
ASu!h+E(j7.!R0M$=[RYDfTE1FE0N*>p+JHINU?l-tt;_.6o:c+@Rn*>q$3i%15is/g,1GFEMVA
F!,L7F*2;@+E(j7Ch[d0GV=2WBm:b1Df'?"DIdf2@<3Q5AU&;>F*)G:DJ'CcBQ%s64ZZe.+>P*$
0H__k-R)n?/0J4@/0H;_I!d&YEckqB-R)n,$4R>;67sBt@;BEs@3B)pEb/a&DfU+G-nuicF^nom
F)rlT0Hat9Bl%p4ALS&qD..3kA8-'I3\_d=2'=q@0KKXM%15is/g,@YBlmp-+CQC/BleA=De:,$
H$!V=+EVNEAnc'm%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%13OOF(KH9E,'<%F)Q2A
@q@ea+>Y-$+>=63%15is/h1pRFEMP;De*p-F`Lu'+<YhZ/Kc0GEb/[$ATJt:@;]Tu+<YK=@:XF%
+<X9P6m*U_AThX$DfBQ)DKH<p:-pQUA8,OqBl@ltEbT*++D,Y4D'2GH6m-#_D/aPK%15is/e&._
67sBtDf/uo3ZoPdATW'6C2[X(Dfp)1AKZ,<8S;pZEb,[e%16f]/g)_uAn?4$F*&O>E+*j%+=DVH
A7TUrF"_0;DImisCbKOAA1q\7@<6O%E\;'@Ag\^3D_;J++<Y`BDfp/@F`\`R78d#Z;E>pm:IH=6
A7TUr+DGm>DJsV>Bl8!6@;KakA1&L?ATW'8DCuA*AScF!BkAt?/M:XHG\M5@+DPh*H>.=]/g+nJ
@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'/p_5N-Qlr</e&.1+EMC<F`_SF
F<Dr";Gp:g3Zq$j6rQl];F<kq@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8Ec*K=$>"$pASGa/
+>#3XAU%p1F<G=;@<?0*-[oK7A8c@,04Am207%>O07%5ECh7Z?Bkh]:+CoCC%144#F)>i<FDuAE
+=BTU;GU1O+Bh?5+@\pr78k=;A7TUr+DGm>DJsV>Bl8!6@;KakA1&L?ATW'8DCuA*ASu$2%13OO
:-pQUC1_0rATJu'ARf.cAKYE!+CSekDf-\3DBMP1%16f]/g)_u8Oc<1+CoCC%144#BkAt?/M:XH
G\M5@+DPk(FD)dEIUQbtDf0VLA79Rg05>*5Ch7Z@C1_0rATKJ<C3(aFA8a(0$6UH6+EMC<F`_SF
F<Dr";Gp:g3Zq$a8PDQO+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)+ED%8F`M@P%144#ASu$2%16Za
A1e;u%17,eEHPu9AKW@/EapbKBlG_OAnc'mF!hD(Eb065Bl[c--YI".ATD3q05>E9-OgCl$;No?
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++DG^9Eb0E*EcYe7E+*j%+E):2ATA4eA8,OqF$2,u4$"a3
FD5Q4+DPh*+DPh*A7]p3%16f]/g)kkAM,*9Bk)7++D!/JDe't<-Qlr</e&.1+EMC<F`_SFF<Dr"
;Gp:g3ZrK^D.Oh^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.AU%p1F=/2OATW'8DCuA*AScF!
BkAt?+>=pL/g)QQBk)7++=nil4s2s8/no'A-Rg0L/g,Kn+u(3dA8-',C2[X/BlG2*D_;J++<Y`B
Dfp/@F`\`R78d#Z;E>q;Ble?0DJ()&F_u(?F(96)E--.K+ED%8F`M@P%16ZaA1e;u%16igA9)U,
F?M6!-SK4QA1o;>$>F*)+A#%(8PUC=D_</IDe*m,Dfe,p+=CY[-S0"NA9)U,F<D#"AScF!/g(T1
+<YE;A9)U,F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK-RgT]De*m,Dfd*2$>"*c/e&-s$>O`q
EcYr5DETTp-SHhi@V'.iEb0<6EZd@c3\`H6-RT?1C2[WnAThTuE]l#tC2[X'Df9_KC3F0/F(oQ1
/13(u%13OOBkAt?0H`M$,;C<OBlY>2De*m,Dfd+4D_;J++<YN0CLq$jEZdJZDe*m,DfcEq+<W'[
8l%htEc5l<+Co2,ARfh#Ed9#]+Eqj?FCcS0De*m,DfdNXC2[X'Df9_MFEhmT%144#D..3kA8-',
4DJeFA7]ppBlXXi+<Y`BDfp/@F`\`R8l%htEc5l<+Co2,ARfh#Ed8d;Eb/[$ARmhE-S0"NA7T7p
A8-&n$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;E>q<Df0-'E--@J8l%htEc5l<+Co2,ARfh#Ed8cZ
4s24(C2[X'Df9_?Eb0?8Ec*K=$>"*c/e&-s$;No?+CfG'@<?''A8,OqBl@ltEbT*+%17/nDfp/@
F`\aDATqZ--np!YBk)7+.4cl^De*BiG%><-/3>P4A8,OqF"'0uF`_>6Bln'#F!,"-@ruF'DIIR2
-OgE(D/XQ=E-67FDIn$&+=JskA8,OqF"&XgC2[WnAThTuE\':,HXpi#FE8lm-YdR1+EMIDEarZ'
@rGmh+Co1rFD5Z2@<-W@%17/nDfp/@F`\aDATqZ--o--[Bk)7+.4cl^De*BiG%><-/3>V6A8,Oq
F"'0uC2[W*A7]pqCi=90ASuT4A8,OqBl@ltEd9#A$4R>;67sBlG][t7@rri%DIal1F`&=4Bk)7!
Df0!(Gp$X?D/^V=@rc:&FE7luFDYu9@<?0G/g+nJ@<?0*-[p/KD/_-U%172oE+F*.E'5frFDYu9
@<?06-Y.@:E%Yj>F!hD(%16]cEaN?k@rs=GA8,OqF!,"3/e&.1+Co1rF?M6!4(N&8F:AR"+EMC<
F`_SFF<Dr)Ddd0jDJ)!Q-S/eB@rr.e+<XEG/g+4];GKeY7lhc5AT2Ho@q?d,Bln#2D..=)@;I'/
DL-#9E+s3&%144#:-pQUBl5&'@<6!&De:+?H?*S*A18X5@;0P#Eb-@&$6UI%F_u).@<=Xb+F8'>
@:UK/A8,Oq/13&aC3(aO4)/\EH>.=-$6UH>FDj]G;cFlMF_u).@<<q@GB.D>AKZ)3E+F*.E"*-s
+AP6U+DG_7F`M%9A8,OqBl@ltEd8dH@<?0*DfTB"EX`?u+E(d5HnHg23b2r7FC/a"A7^!7HS/iC
@ruc7>9G^EDe't<-OgD*+AP6U+Dbt)A0>E*D/^V=@rc:&F:AR"+>=s"0H`K"D/a$.D/]pk+<XEG
/g+kGF*2M7+EqB>Eb0)rBl5&-DBO.AEbfB,B-;#/@ps1b%144#@rGk"EcP`/F<G[BE,9H&?U6tD
FE1f2BK8(5?O[>b+AP6U+ED%+ASu("@<?''@rcL/F!,L7An?!oDI[7!%144#FDYu;AS-!H/g)hj
B5DKqF!a'nI4cX_AThu7-RT?1+<Y`BDfp/@F`\`R6ZR*dF!,L7An?!oDI[7!+D58'ATD4$ARmhE
-S/eB@rr.eASu$2%13OOF)>i<FDuAE+=C)f6UO:@;`Z%AAS5^uFCfK(A0=K?6m-#S@ruF'DIIR"
ATK4A>9G^EDe't<-OgE(D/XQ=E-67F1a$^I+=ANG$7QDk%17/fFEMP;De*p-F`Lu'+>=63%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16ocDKU2ADffQ3?W:-,
1,Va>DKU1H;fH;XBkD'h+AQisATJu+DfQsm:IH<Z/ibO>+=KrmGp"jr0ek*d$4R>ABPDN1BlbD=
BOr;uBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g*JlAoD^$+E_a>DJ'Cc8l%ht
Df-\6Bl8'<+DkOsBPD?qF!,F<ARTXk+ED%%A0>u-ATME*DJsW.F"Rn/%14g=+A,Et+EMIDEarZ'
@rGmh+DGm>A8-+,EbT!*FCeu*Bl5&8BOr;Y:IJ,W<Dl1Q+CSekDf.0M8T&Tk@;Ka&FD,5.%15^'
6rQl];F<kq@:WneDBNA*A0>o8DBO%7AKZ&(EbTK73XlE*$6UI?@:WneDK@IDASu("@;IT3De*p-
F`Lu'05>E9F)Q2A@qB^mFEMOTBkh]3%13OO<+oue+EM%5BlJ/:Bl8!6@;Kb$+EV:.+A,Et+Co&,
ASc:(D.RU,+Co1rFD5Z2@<-'nF!,UHBl7Q+D0[7EARfXqD.RTqARlp&@<?0*F*)GF@ruj6AM+E!
6"Y4MEZfCFDJj0+B-8U;De*p-F`Lu'F(KH9E%Yj>F"&5WDfm1DBQ&$0A0>r)AKYMtEb/a&DfTQ'
F!,:5CLoOL-mrbJBPo1?BlbD6Gp"A':JF8,%13OO+<W=NDf'&=C2[d'05>E905<F"0e[9[A7T7p
%144#05,9@AM7e:BPoJ<De(M92_Zs>C2[Vl$6UHEBQ%a!05>E=DD,aCA1q[V0JP5'FD5Q4%144#
%16'Q+EhI1G9D'?Eaj)4A7]glEbSuoA0>T(+D,P.Ci=N3DJ()+FCf<1+EV:.F(HJ)Bk)7!Df0!(
Bk;?.D09oA+C\n)@<Q'nCggdhAM+E!%14j>+A,Et+Eq78+E):7B5)6lCi"A>A7]pqCi=9(A0>f.
+BN8pA8c[5/g+,,AKYr1Ec`FGD]h_fDKU1HG@>P%$=n'mAKYo/+CQBK1*C%?F<FRmF`);D+>GT'
0R+^]H#n(=D(Zr1BOr<)DJXS@9PJBeGT^g:@WGmtGp$U*ChsOfD.-sd+C]U=8l%htDe!:"EcW@;
DBO%7AKWC6F_PB-.3NeFEagXD%13OO+<XEG/g,7S+EhI1G9A;HF_PB-.3L$QDKBo.Cht4d:IJ,W
<Dl1Q+DGq/D'1P^%144#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD*+Co2-E$.5'
-YIR9A90+-$4R=jB6@p!F"&5UDfTW7+D,>*AKYo/+>Ybq@VKp,<FU)gFEJ^"Bl8'<+DkOsBPD?q
F"SS,F<GF/Gp%<LEbce9DBLho+C]&,+:SZOBl8'<+CT=6G@bT,/g)99BOr<,ASkjiDJ=!$+D>\7
F<G+*E+NotASu!lATJu)ATDL.AKYT*Df$V<BOu!r+Cf>,D..<mF"SRE$;+)^+DkP&ATJu;ATE&=
Ch[a#FCeu*F`V+:De:+cBl8'<+EM4-Cht5(Df'?"DIdf@+B)rbCht5(Df'?"DIdf2@<,p%%16TR
Ci!Zn+E2@8D..I!Cj@.FD]in8G%E3IEb0,sD.OhuDIal"DfBtEAnc'mF"SS7BOuH3F(fK7Ch+Z4
DfTV9Df-[,$=Rgt+EMXF@;0U%De:+cBl8'<+E)9C<GlMq/g*]'G@br/E\&>*:IH==@<3Q0DJXS@
@V'+g+EV19FCeu*Df-[R1*C%?F<FRmF`);D+Unbf$8X+R8l%ht@rc-hFCfM9BQ%s6+D,>(ATJu&
DIal#Bl[cpFDl26ATJu&DIakuF)uJ@ATJu.F<G7*F!,R<AKYl%@qB_&@<-W&$?BinBQS;<FDi:B
ART+#+Eqj?FCcS'DIal,Dg#\7FD,6,AKYT!Ch7Z?+@L?mBl7Q+A7]pqCi=90ASuT48K_tpF<G".
C`mS?%15^'6m-#S@ruF'DIIR"ATJu.DBNeA+='KR9gp0Q05,9@AM7e:BPo7AA8-'q@ruX0GqKO5
%144#:-pQUFDi:FBk;K2G%G]'F!,R<@<<W/@;]duF_kK.AKYZ)F*&O:Bl%@%+=LrAF*(i,C`l>G
6rQl];F<kqBlmp'+>G;S$6UI0A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%144#A8-+(
+?MV3Eb0,sD.R<nCh7Z1@rH=3Anc'mF!hD(%14p@+A,Et+ED%5F_Pl-F!,LADffQ$+Co1rFD5Z2
@<-W9E+*j%F"AGJ/nHXd+F.mJEZf=0FD,_<D09oA+C\npBl5&;Bln#2@3BW-@<6*)0.m\@%14sA
+A,Et+E_a:F!+(&F!+t2DJ!TqF`M&(+EqC++C]A0GB7>9+CT.u+E1k'+ED%%A7]d6+AH9[AKZ&:
Eb-A=DflKrBOQ'q+CQC%Ec6/CATAo%DIal1ART+\EZfF7FEMOT+<V+#%15[=+F.mJ+D>2,AKYl/
F<G(3DJ!TqF`M&(+CQBb+EqC++C]A0GB7>9+A,Et+EqO9C`m/.FCf<.F<G[D+E_a:+Cf)*Df'32
D(T4;Dg-86EX`@tD]iM0Dg-86+E).6Bl7K)BOu"!/g*_t+F.mJ+CoC5DJsV>BOQ'q+@Bg_Df'&.
Bl8!6@;KakA0<:8De*NmCiCgGGA1l0%16ukF<GdGEbd9:$6UH6%144#+AP6U+E(d54$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d<-Ql/N/g,1GEHPu9ARlooBk)7!Df0!(Bk;>p$6UH6A8-+(+=CoB
A8#OjE$l)%%16$JD/!fpEbT?8+A,Et+EqO9C`mkAAKZ).AKWXKF)ipFG%ki(AKYr&Afu,*@:Wqi
+DGF1H#IgJBOQ'q+Du+>+EML5@qfOhARlol+E1k'+ED%%A7]d6%13OO2(9Y9:EWD.<$51>73H&U
@;]k%+DG^99PJBeGT]US6m-GWFD,_J+<X!e@;]k%+DkP4+E2@>A9DBn+D#S6DfTnABl5%&$;+)^
+D58'ATD4$ARlp)BOu!r+Cf>,D..<mF"SRX:Mq:VBl7I"GB4mD@:NtbDIml3H#IgJ@ps6tASu!o
Df]J4@VfIjCCLVbDJ!I$FCeu*E+*j%F!,[@FD)e-DfoN*AKYu8DffQ3+Dbb-AKW1,3a>L%DeF*!
D'2;^Ch7Zm+tau\8K_GY+Du+>+EM[GAKYZ)G9D!G%16Wa+EMI<ATVU"DJ()5Bl.R#Bjl$)GA2/4
+A?KeFa,$J@<?1(/e&-s$8s=U8l%htFCfN8F!,XECisT++EML1@q?clAS,k$AKYK'ART[pDJ(LC
@rH=3Bl7Q+DfQt@ATMs3EbTE(+C\bhCNXT;/g*r-+BN8pA8c[5%16]fARuupBle&4F)YPtAKY].
+ED%8F`MA2A0>?,+CT.15u:,q@ps1i/g)94DBMVeDKU1HFD,5.-tHp=+EM4-Cht5(Df'?"DIal(
F!,UHARmD&$<1\M+Co(,@rH4$@;]TuEb0?8Ec,q@Ao_Ho+EML1@q?cpDfQt/Cht52Dfor>ARlp,
DesQ5ATKIH+A!\oDJXS@DImBi+EV:.+Eh[>F_t\!$?TriF<G(3DKK<$DK?pm:IH=9Bk)7!Df0!(
Gp$^5Ch7Z1@Wcc88K_P^+Du+>+DYk5G9CR;G9D!G+Co&*ATDX%DIjr4BOr<0DesQ5AISua@;TQu
Ao_g,+CQC/Bl8'<+D,>(AKYr#FD*9L+@p']@q?cS+ED%8F`M@BFD,5.F)>?%Ch7[0+CT,*F`):D
De:,(Eb/f)F)YPtAKYT'EZbeu@;Ka&D/XQ7FCeu*G&M2>D.Rc@+<XToAKZ).AKXT@6m*miEb/fm
Ble&=+Eh=:@N]9$EZen(FCAm"F"SS,AfuA;FWb@+G%De:ARTCkGmt+%D..6s+Eh[>F_t]2+Dl%>
DKKH#+A,Et+DkP4+ED%*F`V+:FDi:3Eb/[$ALns5@:O(qE$0(>+ED%7FDl22+Co1rFD5Z2@<-'n
F"Rn/%144#:-pQUDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C+AP6U+ED%5F_Pl-A0>Ds
@ruF'DIIR"ATJ:f+<Y3/F)W6LAo_HoA8-+#-OgD*+:SZIBl7?qCj@QS8S0)jDfm16DI[U-DKKH1
+E2@>@VfUmF!,UHBl7Q+8l%htE,9)oF(HJ*D..-p+Dk[4@<=OQ@UX%`Eb],F3C%4o@;0O1@rH2n
$4R=O$4R=O$4R=O$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq
6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*6<%15p*5u^<L;GC(Q3[],cDBNb0
DKU1O+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gk
C2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi
@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)
Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kVM;D/<a$@kVS8A8,pl
AU#h@FDYh'$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKi
Cggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[X%Eb]GDBkh`!
$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+
A9Da./no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0ddD;6q($A;Fs\a8P`)E3Zp+!3Zp*c
$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-;;7Deq$K8TZ(nAnGUp
Et&Ib+EqaEA0>f2Bk;1(ARloo@<>pe@<6!&AoD]4@;Ka&FEqh:F!,C5+A*c#DfTB0/g*b^6m)pG
F*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!,RCDesJ;AoD]4
%16Wa@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh/g(T1%15[E+A*b8/hhMm8l%htEb065Bl[d+
+EV:.+D,P.Ci=N3DJ()#A7TUrF#ja;%144#A79Rg05>*5Ch7Ys$6UI"EapbKBlG1($4R>3DfQt;
DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=D
BOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm
+@g!\ATD3q+DbIq+Cei%AS5q%Gp"[]DfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A6t$;,5MDBM8SCLqMq$=[FZATDNr
3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk
6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrE/ibOC
-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA92[3EarZ5H>.=-$>OKiF)Q2A@qB^mFEMOTBkh\u
$7QDk;FO8J5uU383[\Z#0JO\b2D?m/C,[h$-OgDN78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A
@q@9=BlGLDBlbD*DBNA.@q]S"AKYK$DKK<$DJ=!$+EM+7BjkglH=^V0A9Da.%178iEcYr5DK?q=
Afu2/AKZ).Eb/f)8l%htA8,OqBl@ltEd8d<@<>pe@<6"$+=LuCA7T7p/8B*6/9Q&KCi_$7$?Tri
F<G"4AKZ,:ARlp*D]iM3Bl%<&FD,5.8l%htF*VhKASj%B+A,Et+EMgLFCf;3A8,OqBl@ltEbT*+
+CT;%%16`dDe'u%G[YH.Ch7Z1De:,*Dg*<r:IH=8@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i6
8g&2#F*(u1F"Rn/%15[E+A*b8/hhMm8l%htEb065Bl[d++EV:.+D,P.Ci=N3DJ()#A7TUrF#ja;
%144#A79Rg05>*5Ch7Ys$6UI"EapbKBlG1($4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu.DBL?B
De*p-F`Lu'/p_5N.3N,/DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5
BlJ/:IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1
BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euI-u*[2F)Q2A@qB^mFEMOTBkh]<+D>2)+C\nnD@Hpq
+<Y0-ARfLeA0>f.+BN8pA8c[5+DNee0JY1%C,[b!0d'nBA0>]&DKU1HC,[b!0d%Sp1*C%?F<GXM
F*(u1F"Rn/+<Ve%:K0bD+A$Yt@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$4R=t.3MN2
DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#
@<,p%Bl5&8BOr<!ASu("@;I'&@:C?h@<?'nDfU+U%13OO+<Ve!:IH=A@:F:#BOQ'q+Du+>+C\nn
DBNe)A7ZlnDf'H0ATVL"Gp%'EEcb`!Ch4_uATW--ASqqa+<Ve.Bl7I"GB4m8DIak`Bl8'</g)99
BPDN1CggcqGAhM;F!,C=+BN8pA8c[5+CT.u+DGp,$6UH6GA1l0+EqaECERP5+A?KeFa,$;F!,[<
Chu-TE,ol?Bk1dc+F.mJ+CoC5DJsV>BOQ'q%144#+CT/5+D#e>@;^008l%htA8,OqBl@ltEbT*+
/e&-s$=[FZATDNr3B9?;D..-p/n8g:%14Nn$?1$#C2[W<0ht%f.WBECC2[W*F"JsdC2[W*E,ol3
ARfg)F(KH9E%VS,:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE
;e9oiASkmfEZd+k0K0FJ:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB1+>PW)2fE2J0fL4,+CSekARlp0
Anc'mEt&IO67sB1+>PW)3,`;K0eje&+CSekARloL;aX,J3&MghF_u)=%15is/g)Vd1,(CADe!lD
1a"@mBl8!'Ecbl'+@/pn8P(m!+EM+9FD5W*+DG_8D]ie5A7T7p+DPh*+E_d?Ci^_<@<,dnATVL(
Et&Hc$4R>;67sC%FCB&t@<,m$C*7S-EbTK7Et&IsAT;j,Eb-@@A7]4mB-;;)F)*-4$4R>;67sBm
DfT?!+@/pn8P(m!+DG^9A9Da.Et&IO67sC'F(oN)+EM+9FD5W*F!,17+DG_(Bm+3$F^])/A8,Oq
Bl@ltEbT*+%15is/g*GY6V0j/2.'d,De*]nCLpj93Zp-d$4R>;67sC,Anc'mF!+n%A8c?..!&s2
+A+pn+CoD#F_t]-FCB9*Df-\9DBMOoGA1i,.1HW)AT;j,Eb-@@IUQbtDf0W$@<,j_H>.>'H=gl-
ATKJ<C3(a3$4R>;67sBsDe!3l+EM%5BlJ/:DJsZ8F!(o!8l%iF;G^_H?TgFm-YdR1FDl)6F!hD(
8l%iR<CpPD?TgFm-YdR1@UX=l@ru:'FE8f=$4R>;67sC"F`]9]Eb/hl$:IZW<D>nW<'sGU9gMNB
?[?'%4ZX]>+?CW!%17/nDfp/@F`\aFEZc`VISP??-OgCl$;No?+D>2$A9f;0DfQt>CgggfDJ()9
DfTB0+DG^9Ci<`mARlonCghC+ATJ:f:-pQUATD4#AKW@IISP??-OgDX67sBQ:II]N:`sC^F<DrX
ISP??-OgD3%13OOF)>i<FDuAE+=CoBA0>i3De`inF<GX9FEMOM%175sC2[W@0JYC<:-pQ_F`;)6
A2Z+s+EK+d+E_X6@<?''8l%ht@:WneDBLhi0JXb_Ec5e;2_Hd=/e&._67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0kP!+0fKOK:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?Q_Km+=BH@6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R=iBkhQs
-Qm&5F<EY+-ZWd,A0?):Blmo6%13OOC2[WA0R,`A+<VdL+<VdS@lc8XDe(L[0JP4qDe*BiFt[oH
EbTK70..29C2[W@0J['IA8c?K3ZoOm@lc8X2D?m>@:WneDK@IDASu("@;IT3De(LK%13OO-urm-
A0>W*A2c2e/151NA1hS2F!iCZGB.D>AKZ&-Dg-//F)rI=De(a[11=^(Df.*RC2[W8Bkh]:%14M(
ART*lC2[WA0R,,rC2[X)Df9H5/no'A-Rg0^EbTW,+EM47GApu3F!,49A2Z+s@:WneDCd/MDe*F(
FE9*MDe*s.DesJIBkh]:%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<4&                                                                ~>
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
zz=:zz,'x wrep write writenoun''),(<<;._1 '' joddob DFILES DFPTRS DIRCN DIRIX'
zz=:zz,' DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ER'
zz=:zz,'R202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 HEADNM'
zz=:zz,'S OK200 OK201 REFCN REFIX REFTS TEMPFX backnum copydirinv copyfile '
zz=:zz,'copyfiles createdl dfclose dfopen dfp dncn dnix dnnc dnnm dnrn drop'
zz=:zz,'all dropdir dropinv dropnc dropref justdrvpath libstatus loaddir lo'
zz=:zz,'adnc loadref loadstamps maxback movefile nummask packdict packspace'
zz=:zz,' renamefiles restdict restspace savedir saveref tmpdatfile tmpusesf'
zz=:zz,'ile volfree''),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3'
zz=:zz,' DUMPPREAMBLE DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR01'
zz=:zz,'55 ERR0156 ERR0157 ERR0158 ERR0159 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBC'
zz=:zz,'ATS HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPU'
zz=:zz,'T SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk '
zz=:zz,'dec85 dumpdoc dumpgs dumpheader dumptext dumptm dumptrailer dumpwor'
zz=:zz,'ds extscopes fap fmtdumptext fromascii85 halfbits htclip jnb jscrip'
zz=:zz,'t jscriptdefs makedump makegs masknb namecats nounlrep opaqnames pa'
zz=:zz,'rsecode sexpin sonl tabit toascii85 uqtsingle wraplinear wrdglobals'
zz=:zz,' writeijs wttext''),(<<;._1 '' jodon jodoff jodon''),(<<;._1 '' jodstor'
zz=:zz,'e CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK'
zz=:zz,' CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR05'
zz=:zz,'2 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ER'
zz=:zz,'R062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071'
zz=:zz,' ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR'
zz=:zz,'082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 '
zz=:zz,'ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 INVGROUPS INVMACROS INVSU'
zz=:zz,'ITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 OK'
zz=:zz,'056 OK057 OK058 OK059 OK060 OK061 OK062 PATHTIT READSTATS allnlctn '
zz=:zz,'allnlpfx allnlsfx apptable appwords badcn bnlsearch bnums checkopen'
zz=:zz,' checkpath checkput closedict createst defwords delstuff delwordref'
zz=:zz,'s didstats dnlsearch freedisk freedisklinux freediskwin fullmonty g'
zz=:zz,'etdicdoc getdocument getexplain getgstext getobjects getrefs gslist'
zz=:zz,'nl inputdict invappend invdelete invfetch invreplace islib iswritea'
zz=:zz,'ble iswriteablelinux iswriteablewin jdatcreate jwordscreate loadall'
zz=:zz,'dirs loadallrefs loadwords mainddir newdparms newregdict nlctn nlpf'
zz=:zz,'x nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdo'
zz=:zz,'c putexplain putgs puttable puttexts putwords putwordxrs rplctable '
zz=:zz,'rplcwords sortdnub''),(<<;._1 '' jodtester TESTYAMMER ereopen hfd hos'
zz=:zz,'tsep rmroot showpass testenvironment''),(<<;._1 '' jodtools AGEHEADER'
zz=:zz,' CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR00404 ERR00'
zz=:zz,'405 GROUPSUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF O'
zz=:zz,'K00400 OK00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX'
zz=:zz,' TESTSTUB WARNING00400 WORDTESTS addgrp addloadscript addloadscript'
zz=:zz,'1 allnames allrefs betweenidx createjodtools dayage delgrp firstcom'
zz=:zz,'ment firstperiod fsen getrx hlpnl jodage lg locgrp ltx mg mj mls mt'
zz=:zz,' noexp notgrp nt nw obnames onlycomments pr refnames revonex swex t'
zz=:zz,'oday todayno tt updatepublic usedby yyyymondd''),(<<;._1 '' jodutil A'
zz=:zz,'SSUMESMARK AUTHORMARK CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK ER'
zz=:zz,'R0250 ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0257 ERR02'
zz=:zz,'58 ERR0259 ERR0260 ERR0261 ERR0262 IzJODutinterface JODHELP MONADMA'
zz=:zz,'RK NAMEALPHA OK0250 OK0251 OK0252 OK0253 OK0254 OK0255 OK0256 PDF P'
zz=:zz,'DFREADER PDFURL ROOTWORDSMARK SCRIPTDOCCHAR URLPFX URLSUX VERBATIMM'
zz=:zz,'ARK WWW0 WWW0linux WWW1 blkaft changetok compj compressj createut c'
zz=:zz,'tit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 doctext do'
zz=:zz,'cword ed et exobrefs gt jodfork jodhelp ljust obtext pdfreader qt r'
zz=:zz,'eb revo rm rtt setwwwbrowser textform2 wwwbrowser''),<(<''test''),<0$a'
zz=:zz,':                                                                  '
zz=:5629{.zz
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
