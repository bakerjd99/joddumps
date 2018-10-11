NB. JOD dictionary dump: 10 Oct 2018 18:20:31
NB. Generated with JOD version; 0.9.996 - dev; 34; 9 Oct 2018 19:25:15
NB. J version: j807/j64/windows/release/commercial/www.jsoftware.com/2018-10-05T10:39:42
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|225346394776877887587393570006481670086|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DIGITS=:'0123456789'

DUMPMSG4=:'NB. J version: '

EDCONSOLE=:'"c:\Program Files\Microsoft VS Code\code.exe"'

EDCONSOLE_NPP=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR00407=:'ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot'

ERR103=:'no backup(s) to restore or search'

ERR104=:'no registered dictionaries'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.996 - dev';34;'9 Oct 2018 19:25:16'

JODVMD=:'0.9.996 - dev';34;'9 Oct 2018 19:25:15'

JSON=:31

MACROTYPE=:21+i.8

MIXEDOVER=:'(<:)=:'

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

PYTHON=:29

SQL=:30

TESTYAMMER=:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bget=:3 : 0

NB.*bget v-- retrieves objects from put dictionary backups.
NB.
NB. (bget) implements  a subset of (get). (bget) fetches  objects
NB. from either the last backup or particular backups.
NB.
NB. OBJECTS ARE NOT DEFINED IN LOCALES for the simple reason that
NB. backup fetches may return many versions of the same object.
NB.
NB. Only put  dictionary backups  are searched there is no backup
NB. path.  Also,  there is no corresponding  (bput)  because  the
NB. files  read  by (bget)  are backups that, once  created,  are
NB. never altered by JOD.
NB.
NB. Also,   certain  objects  are  not  fetched,  name   classes,
NB. timestamps and sizes.
NB.
NB. monad:  bget blcl
NB.
NB.   NB. collect from must current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's header

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
    case. DEFAULT  do. (WORD,0) bgetobjects__ST y
    case. EXPLAIN  do. WORD bgetexplain__ST y
    case. DOCUMENT do. WORD bgetdocument__ST y
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
    case. HEADER   do. GROUP bgslist__ST y  
    case. DEFAULT  do. GROUP bgetgstext__ST y
    case. EXPLAIN  do. GROUP bgetexplain__ST y
    case. DOCUMENT do. GROUP bgetdocument__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST y
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
if. ((0{x) e. WORD,MACRO) *. -.(2{x) e. DEFAULT,MACROTYPE,i. 4 do. jderr ERR001 
elseif. ({. x) e. OBJECTNC do. x bnlsearch__ST y 
elseif.do. jderr ERR001 
end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. maintains argument compatibility with (dnl)
bv=. DEFAULT ~: 2{x
if. bv *. (0{x) e. TEST,GROUP,SUITE do. jderr ERR001 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__DL do. jderr ERR103 return. end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

if. (,NDOT)-:alltrim y do.
  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. bfile=. ({.x) dbakf__DL rbk
        NB. errmsg: jfile read failure
 
  badjr uv=. jread bfile;(1{CNDIR),CNCLASS do. (jderr ERR088,' ->'),<bfile 

elseif.
        ol=. uv{ol [ uv=. /: ol [ 'ol oc'=. uv 
        NB. reduce object list for words and macros if class specified
        if. bv *. (0{x) e. WORD,MACRO do. ol=. (oc = 2{x)#ol [ oc=. uv{oc end.

  isempty pat do. ok ol  NB. return sorted last backup name list

elseif. 0=#ol do. ok ol  NB. nothing left to match
elseif. do.              NB. match prefix, infix suffix
  select. 1{x
    case. 1 do. ok ol nlpfx pat 
    case. 2 do. ok ol nlctn pat
    case. 3 do. ok ol nlsfx pat
    case. do. jderr ERR010
  end.
end.
)

buildjodcompressed=:4 : 0

NB.*buildjodcompressed v-- builds a fully compressed JOD load test script.
NB.
NB. dyad:  blVersion buildjodcompressed blclDirs
NB.
NB. verbatim:
NB.
NB. Builds a compressed JOD load script.
NB. 
NB. Caveats:
NB.
NB. No error checking.
NB. Requires standard J profile.
NB. In addition to standard JOD directories this script also requires 
NB.   the staging directory: .../joddev/alien/stage/jod/
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 08may28 rename/relocate compressed script to root of jod addon
NB. 11feb05 use (jpathsep) to show portable style file paths
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 11nov24 tested on linux
NB. 14nov14 adjusted for j 8.03 (runs on win32 J 8.03 - not 64 - no zfiles)
NB. 15mar15 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17jan09 improve caveat notes for running on jconsole versions
NB. 17mar03 macro script converted to verb

'JODSTAGEDIR JODGITDIR JODADDONDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make, date
'jodversion jodbuildcnt'=.2{.x
jodbuilddate=. alltrim tstamp''
jodbuildcnt=. >:jodbuildcnt

NB. increment build and save - must be done before 
NB. script generation to insure header and class JODVMD match
JODVMD=.(jodbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODVMD';WORD_ajod_;wrep_ajodstore_ 'JODVMD'

NB. set output files
JODFILE=. 'jod.ijs'

NB. working JOD addon script
JODADDONFILE=. JODADDONDIR,JODFILE

NB. backup of JOD script placed in put dictionaries script directory
JODSCRIPTFILE=. JODSCRIPTDIR,JODFILE

NB. JOD staging directory under put dictionaries alien directory
JODSTAGEFILE=. JODSTAGEDIR,JODFILE

head=.'NB. System: JOD  Author: John D. Baker  Email: bakerjd99@gmail.com',LF
head=.head, ('NB. Version: ',(jodversion),'  Build Number: ',(":jodbuildcnt),'  Date: ',jodbuilddate),LF
smoutput head

NB. turn off white space preservation during JOD load
hc=.head,'(9!:41) 0',LF

NB. get preprocessor script - leave only header comments
s=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodprep'

NB. main JOD classes
g=. ;: 'jodon jod jodstore joddob jodmake jodutil' 

NB. collect group dependents 
deps=. gdeps&.> g

smoutput 'compressing ... '
NB. dewhite group headers 
h=. dewhitejscript&.> {:"1 >{: GROUP_ajod_ get g

NB. compress all nondependent words in each group (a cruncher)
code=. , }.@:compj&> ((}.@:grp)&.> g) -.&.> deps

NB. combine header and word definitions 
s=. s , ; , h ,. code

NB. append post processor script
s=. s, dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodpost'

NB. remove a few remaining redundant blanks after 
NB. assignments - their presence annoys me!
s=. hc , '/ =./=./ =:/=:' changenqt s

NB. save compressed load scripts
smoutput 'output file locations:'
(s=. toJ s) write showpass JODADDONFILE
smoutput s  write showpass JODSCRIPTFILE
smoutput s  write showpass JODSTAGEFILE
updateJODfiles s

NB. update build history - stored as plain text macro
JODBUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODBUILDHISTORY'
JODBUILDHISTORY=. JODBUILDHISTORY,(2#LF),head
assert. >0{MACRO_ajod_ put 'JODBUILDHISTORY';TEXT_ajod_;JODBUILDHISTORY

NB.byte size of generated plain text script
smoutput (":#s),' script bytes'
smoutput 'JOD compressed build complete'
)

buildjodtoolscompressed=:4 : 0

NB.*buildjodtoolscompressed v-- builds compressed version of the JOD tools class script.
NB.
NB. dyad: blVersion buildjodtoolscompressed blclDirs
NB.
NB. Cloned from (buildjodtools) macro
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 12jun25 changed line ends to (toJ)
NB. 15mar15 zfiles removed - build redirected to .../joddev/alien/stage/... directories
NB. 17mar93 jod macro converted to verb

'JODSTAGEDIR JODEXTSDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make. date
jodbuilddate=. alltrim tstamp''
'jodtoolsversion jodtoolsbuildcnt'=. 2{.x
jodtoolsbuildcnt=. >:jodtoolsbuildcnt

NB. increment build counter
JODTOOLSVMD=. (jodtoolsbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODTOOLSVMD';WORD_ajod_;wrep_ajodstore_ 'JODTOOLSVMD'

NB. set output files
JODTOOLS=. 'jodtools.ijs'
JODADDONTOOLSFILE=. JODEXTSDIR,JODTOOLS

NB. JOD staging directory under put dictionaries alien directory
JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/',JODTOOLS

NB. backup of tools file placed in put dictionaries script directory
JODSCRIPTTOOLSFILE=. JODSCRIPTDIR,JODTOOLS

thead=. 'NB. System: jodtools  Author: John D. Baker  Email: bakerjd99@gmail.com'
thead=.  thead,LF,('NB. Version: ',jodtoolsversion,'  Build Number: ',(":jodtoolsbuildcnt),'  Date: ',jodbuilddate),LF
smoutput thead

NB. generate tools script and save
smoutput 'compressing jodtools ...'

NB. fetch header and compress
h=. dewhitejscript (1;0 1){:: GROUP_ajod_ get 'jodtools'

NB. compress nondependent group words
'r s'=. compj (grp 'jodtools') -. gdeps 'jodtools'

NB. fetch and compress postprocessor
p=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'POST_jodtools'

s=. toJ thead,h,s,p
smoutput 'output file locations:'
smoutput s write showpass JODADDONTOOLSFILE
smoutput s write showpass JODSCRIPTTOOLSFILE
smoutput s write showpass JODSTAGETOOLSFILE
updateJODTOOLSfiles s

NB. update build history - stored as plain text macro
BUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODTOOLSBUILDHISTORY'
BUILDHISTORY=. BUILDHISTORY,(2#LF),thead
assert. >0{MACRO_ajod_ put 'JODTOOLSBUILDHISTORY';TEXT_ajod_;BUILDHISTORY

NB.byte size of generated plaintext script
smoutput (":#s),' script bytes'
smoutput 'JODTOOLS compressed build complete'
)

checknttab3=:3 : 0

NB.*checknttab3 v-- checks all three (name,[class],text) tables.
NB.
NB. monad:  checknttab3 bt

if. 3 = cols=. {:$y do.  
  NB. there are two species of three column tables - words 
  NB. and macros - distingquished by the codes in column 1
  if. ((i. 4), MACROTYPE) badblia 1 {"1 y do. jderr ERR014
  NB. macro codes start at 21 much higher than J name class codes
  elseif. 3 < <./ ;1 {"1 y do.
    MACROTYPE checknttab2 y
  elseif. do.
    (i. 4) checknttab2 y
  end.
elseif. 2 = cols do.
  NB. two column tables 
  checknttab y
elseif.do. jderr ERR014
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

NB. BUG: j 8.05 win64 can lose y shapes - sy$,y recovers y's shape

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

dbakf=:4 : 0

NB.*dbakf v-- fully qualified backup file path.
NB.
NB. dyad:  clPath =. iaObjectNc dbakf iaBackupNum
NB.
NB.  0 dbakf 17   NB. backup 17 of jwords.ijf
NB.  4 dbakf 5    NB. backup 5 of jmacros.ijf

NB. !(*)=. BAK
BAK,(":y),(;x{JDFILES),IJF
)

dfclose=:3 : 0

NB.*dfclose v-- close dictionary file.
NB.
NB. monad:  dfclose clFilePfx
NB. 
NB.   dfclose__DL 'U'  NB. object noun file pointer prefix

NB. allow mixed assignments (<:)=:
fp=. y,'P'
(fp)=: ".y,'F' [ jclose_jfiles_ ".fp
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
NB.   0 _3 dnl 'ugh' NB. path order listing of words ending with 'ugh'

WORD dnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (dnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ({. x) e. OBJECTNC do. x dnlsearch__ST y else. jderr ERR001 end.
)

dpset=:3 : 0

NB.*dpset v-- set dictionary parameters.
NB.
NB. monad:  dpset zl | clCommand | (cllParm ; uuValue)
NB. dyad:  iaCode dpset (clParm ; uuValue)

NB. objects !(*)=. DL ST
NB. allow mixed assignments (<:)=:

NB. resets should always work - close any open dictionaries
if. y -: 'RESETME' do.
  3 od '' NB. HARDCODE 3 close code
  if. badrc msg=. markmast~0 do. msg else. ok OK004 [ remast 1 end.
elseif. y -: 'RESETALL' do.
  3 od '' NB. HARDCODE 3 close code
  if. badrc msg=. markmast~0 do. msg else. ok OK004 [ remast 0 end.
elseif.do.
  NB. other options require an open dictionary
  if. badrc msg=.checkopen__ST 0 do. msg return. end.
  DL=.  {:{.DPATH__ST

  if. isempty y do.
    NB. display settable parameters of put/first with current values
    ok <|:>{:>jread WF__DL;CNPARMS__ST

  elseif. -.badcl y do.
    NB. if we are resetting READWRITE status dictionary need only be open
    if. 'READWRITE'-:y do.

      NB. check attributes of READONLY dictionary to insure 
      NB. that it will allow read/write operations on all files
      dcfiles=. (WF__DL;TF__DL;GF__DL;SF__DL;MF__DL;UF__DL) ,&.> <IJF
      NB. err msg (JODstore errors): dictionary file attributes do not allow read/write
      if. 0 e. iswriteable__ST dcfiles do. (jderr ERR095__ST),<DNAME__DL return. end.

      if. badrc msg=.libstatus__DL 0 do. msg
      else.
        RW__DL=: -. LIBSTATUS__DL=: 0  NB. library off/read write
        ok OK008;DNAME__DL
      end.
      return.
    end.
    NB. other changes of dictionary parameters require a put dictionary
    if. badrc msg=. checkput__ST 0 do. msg return. end.
    select. y
    case. 'DEFAULTS' do.
      if. badjr dat=. jread JMASTER;CNMFPARMDEFS   do. jderr ERR088
      elseif. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088
      elseif. dpt=. <(}:>dpt),<|: 1 0 1#"1 dat=. >dat
              badreps dpt jreplace WF__DL;CNPARMS__ST  do. jderr ERR017
      elseif.do.
        NB. reset live object parameters
        (({."1 dat) ,&.> locsfx DL)=: {:"1 dat
        ok OK003;DNAME__DL
      end.
    case. 'CLEARPATH' do.
      RPATH__DL=. i.0
      if. badreps (i.0) jreplace UF__DL;CNRPATH__ST do.
        jderr ERR017
      else.
        ok OK005;DNAME__DL
      end.
    case. 'READONLY' do.
      if. badrc msg=.libstatus__DL 1 do. msg
      else.
        RW__DL=: -. LIBSTATUS__DL=: 1  NB. library on/read only
        ok OK007;DNAME__DL
      end.
    case.do. jderr ERR001
    end.

  elseif. -.badbu y do.
    NB. parameter changes only allowed for put dictionaries
    if. badrc msg=. checkput__ST 0 do. msg return. end.
    msg=. ERR019  NB. errmsg: invalid name/parameter
    if. -. (1=#$ y) *. 2=#y do. jderr msg return. end.  
    if. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088 return. end.
    usp=. >{:dpt=. >dpt
    if. ({:$usp) = pos=. ({.usp) i. {.y do. jderr msg return. end.
    if. (>pos{{:usp) badsts >{:y do. jderr msg return. end.
    NB. reset live object
    ('__DL' ,~ >pos{{.usp)=: >{:y
    dpt=. (}:dpt),<usp=. ({:y) (<1;pos)} usp
    if. badreps (<dpt) jreplace WF__DL;CNPARMS__ST do. jderr ERR017 else. ok OK006;y end.

  elseif.do. jderr ERR001
  end.
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
head=. head,LF,DUMPMSG4 , ": , 9!:14 ''
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

dupnames=:] #~ (0 {"1 ]) e. (0 {"1 ]) #~ [: -. [: ~: 0 {"1 ]

ed=:3 : 0

NB.*ed v-- edit dictionary objects.
NB.
NB. (ed) typically fetches, formats and places object(s) in an edit window.
NB.
NB. monad:  ed cl|blcl|bt
NB.
NB.   ed 'wordname'
NB.
NB.   ed ;:'many words mashed into one edit script
NB.
NB.   NB. edit contents of (name,value) and (name,class,value) tables
NB.   ed ; }. 0 10 get }. dnl 're'
NB.   ed ; }. 4 get }. 4 dnl 'build'
NB.   
NB.   NB. place many backup versions in edit window
NB.   ed ; }. bget <;._1 ' word.12 word.11 word.09 word.02'
NB.   ed ; }. 4 bget <;._1 'macro.9 macro.7 macro.2'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. 2=#$ y do. 
  if. badrc uv=. checknttab3 y do. uv return.
  elseif. 3 = {:$ uv=. rv uv   do.
    if. 3 >: <./ jc=. ;1{"1 uv do.
      NB. convert binary nouns to linear representations
      jc=. I. 0=jc
      if. badrc nv=. 0 nounlrep__MK jc{uv do. nv return. end.
      uv=. (rv nv) jc} uv
      NB. format words for editing
      text=. _2 }. ; (0 {"1 uv) ,. (<'=:') ,. (2 {"1 uv) ,. <2#LF
    else.
      NB. format non words for editing
      text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF 
    end.  
  elseif.do.
    NB. format non words for editing
    text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF
  end.
  NB. set default object name - if there is more than one 
  NB. object reset (x) to prevent affixing document command  
  oname=. ;0{0{uv [ x=.  1 < #uv 	
elseif. badrc uv=. x obtext y do. uv return. 
elseif.do. 
  'oname text'=. }.uv 
end.

NB. undocumented and seldom used feature - removed unless someone complains
NB. if. wex <'EDLOCALE' do.   NB. !(*)=. EDLOCALE
NB.   NB. set up to define objects into specified locale if requested
NB.   pfx=.'18!:4 <''',EDLOCALE,''' [ CRLOC_ajodutil_=: 18!:5 '''' '
NB.   sfx=. '18!:4 CRLOC_ajodutil_'
NB.   text=. pfx,LF,LF,text,LF,LF,sfx
NB. end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',oname) changestr DOCUMENTCOMMAND_ijod_
end.

oname et text
)

et=:3 : 0

NB.*et v-- edit text
NB.
NB. monad:  et clText
NB. dyad:  clFile et clText

EDTEMP et y  NB. default edit file
:
NB. write to J temp directory - created by J install
try.

  (toHOST y) write file=. jpath '~temp/' , x , IJS

  NB. open in various editors !(*)=. IFJ6 IFWIN IFJHS IFQT IFIOS IFGTK open
  if. */ wex ;:'IFJ6 IFWIN'  do. 
    if. IFJ6 * IFWIN do. smopen_jijs_ file return. end. NB. J 6.0x win systems
  end. 
  
  if. IFQT do. open file  NB. jqt ide

  NB. JHS on macs - not tested recently
  NB. elseif. IFJHS *. wex <'wwd_qjide_' do. 0 0$(1!:2&2) '$$$edit$$$',file  NB. qjide

  NB. JHS on win 
  elseif. IFJHS do. edit_jhs_ file  

  NB. running in jconsole on Windows systems 
  NB. WARNING: there is no indication of fork failures 
  NB. testing the existence of (EDCONSOLE) and the alleged
  NB. (file) for every edit operation would slow down normal use
  elseif. IFWIN *. IFJHS +: IFQT do. fork_jtask_ EDCONSOLE,' ',file

  NB. remaining editors are marginal, deprecated or rarely used with JOD
  
  NB. iPhone/iPad  
  elseif. IFIOS do. je_z_ file     
  
  NB. GTK systems are deprecated
  elseif. wex <'IFGTK' do.
    if. IFGTK do. open_jgtk_ file  else. jderr ERR0255 end. NB. GTK 

  elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
  end. 
 
catch. jderr ERR0255  NB. errmsg: unable to open TEMP/*.ijs for editing
end.
)

getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
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
if. jvn < 602 do.
  msg=. 'JOD requires J 6.02 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 6.0x-8.0x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN' do.
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
NB. j profile !(*)=. cocurrent
if. r do.
  curr=. 18!:5 ''   NB. current locale
  cocurrent 'base'  NB. run script from base
  try. 0!:0 s
  catchd.
    cocurrent curr  NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  cocurrent curr    NB. restore locale
  ok (y),msg
else.
  t
end.
)

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
    NB. allow mixed assignments (<:)=:
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

loaddir=:3 : 0

NB.*loaddir  v-- loads  the  complete  requested  directory  (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loaddir iaObject
NB.
NB.   loaddir WORD  NB. code specifies directory

if. wex ix=. dnix y do. 0   NB. directory loaded
else.
  fp=. ". ({.ix=. >ix),'F'  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. allow mixed assignments (<:)=:
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)

loadnc=:3 : 0

NB.*loadnc v--  load name class for  (y) Result is 0 for success
NB. and 1 for failure. Currently only words and  macros have name
NB. or type class.
NB.
NB. monad: loadnc iaObject
NB.
NB.   loadnc WORD

NB. allow mixed assignments (<:)=:
if. wex dn=. dnnc y do. 0  NB. class/type loaded
else.
  fp=. ". ({.dn=. >dn),'F'  NB. path file name
  if. badjr dat=. jread fp;CNCLASS do.
    1  NB. cannot load
  else.
    (dn)=: >dat
    -. wex <dn
  end.
end.
)

loadref=:3 : 0

NB.*loadref v--  loads word and  test  reference lists from  uses
NB. file.
NB.
NB. Result is 0 for  success and 1  for failure.  Test references
NB. are not currently stored but the code providing this facility
NB. is  left  in  this  verb  and  (saveref)  to  allow for  easy
NB. expansion of reference types in the future.
NB.
NB. monad: loadref iaObject
NB.
NB.   loadref WORD

NB. allow mixed assignments (<:)=:
if. wex dn=. dnrn y do. 0  NB. references loaded
else.
  cn=. ((WORD,TEST) i. y){CNREF
  if. badjr dat=. jread UF;CNMARK,cn do. NB. object noun !(*)=. UF
    1  NB. cannot load
  else.
    dn=. >dn
    dn=. (<_2}.dn) ,&.> DTSIXCN
    (dn)=: dat
    -. *./ wex dn
  end.
end.
)

loadstamps=:3 : 0

NB.*loadstamps v-- loads directory time stamps (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loadstamps uuIgnore

NB. allow mixed assignments (<:)=:
ts=. DIRTS
if. *./b=. wex ts do. 0  NB. stamps loaded
else.
  ts=. (-.b)#ts          NB. load missing only
  for_st. ts do.
    fp=. ". ({.st=. >st),'F'   NB. path file name
    if. badjr dat=. jread fp;CNMARK do.
      1 return.
    else.
      (st)=: >dat
    end.
  end.
  -. *./ wex ts  NB. check loaded stamps
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

    NB. define nouns - override mixed assignments (<:)=: 
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)

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
    pdo=. {:0{DPATH__ST__JODobj   NB. put dictionary directory object
    rf=. gf=. SCR__pdo            NB. default directory

    NB. redirect script output if ROOTFOLDER exists and is configured - standard profile !(*)=. jpath
    if. wex <'ROOTFOLDER__pdo' do.
      NB. errmsg: ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot
      if. badcl ROOTFOLDER__pdo do. jderr ERR00407 return. end.
      if. 0 < #rf=. alltrim ROOTFOLDER__pdo do. 
        if. '~' ~: {. rf do. jderr ERR00407 return. end.
        NB. do not expand relative path strings - relative paths must be configured
        if. rf -: gt=. jpath rf do. jderr ERR00407 return. else. gf=. tslash2 gt end. 
        rf=. tslash2 rf
      else.
        rf=. gf
      end. 
    end.

    lsn=. gf,gn,IJS__JODobj  NB. errmsg: unable to write load script 
    if. _1 -: (toHOST s) (write :: _1:) lsn do. (jderr ERR00408),<lsn return. end.
    NB. update scripts.ijs
    x addloadscript gn;rf,gn
    
  end.
else.
  v
end.
)

mnl=:3 : 0

NB.*mnl v-- list objects in all registered dictionaries.
NB.
NB. monad:  mnl clStr | zlStr
NB.
NB.   mnl ''     NB. list all words in all registered dictionaries
NB.   mnl 'pfx'  NB. list all words in all registered dictionaries starting with 'pfx'
NB.
NB. dyad:  ilCodes mnl clStr | zlStr
NB.
NB.   4 2  mnl 'ex'  NB. macros with names containing 'ex' in all registered dictionaries
NB.   2 3  mnl 'et'  NB. groups with names ending with 'et' in all registered dictionaries
NB.   4 3 25 mnl '_sql' NB. text macros with names ending '_sql'
NB.   0 _1 mnl 'se'  NB. duplicate words starting with 'se'

WORD mnl y
:

NB. (mnl) does not require open dictionaries 
if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
elseif. do.

  NB. format standard (mnl) (x) options and search
  x=. 3 {. x , (<:#x)}. 1 , DEFAULT
  
  NB. validate options
  if. -.((1{x) e. PATOPS) *. (0{x) e. OBJECTNC do. jderr ERR001 return. end.

  if. MACRO = 0{x do.
    if. -.(2{x) e. MACROTYPE,DEFAULT           do. jderr ERR001 return. end.
  elseif. MACRO ~: 0{x do.
    if. -.(2{x) e. (OBJECTNC,DEFAULT) -. MACRO do. jderr ERR001 return. end.
  end.
  
  x mnlsearch__ST y
end.
)

mnlsearch=:4 : 0

NB.*mnlsearch v-- master name list search.
NB.
NB. dyad:  ilOpt mnlsearch clNamePattern

NB. ERR006 cannot read master
if. badjr d=. >jread (JMASTER,IJF);CNMFTAB do. jderr ERR006 return. end.

NB. ERR104 no registered dictionaries
if. 0 e. $d do. jderr ERR104 return. end.
if. fex f=. (tslash2&.> 2{d) ,&.> <(;(0{x){JDFILES),IJF do.
  r=. 0 2$<'' [ y=. ,y
  g=. (<: |1{x){nlpfx`nlctn`nlsfx
  b=. DEFAULT ~: 2{x
  for_i. i.#f do.
    o=. i{f [ n=. i{0{d

    NB. ERR088  jfile read failure
    if. badjr p=. >jread o;CNLIST do. jderr ERR088 return. end.
    if. b do.
      if. badjr s=. >jread o;CNCLASS do. jderr ERR088 return. end.
      p=. p #~ s = 2{x
    end.

    if. 0=#p do. continue. end.
    r=. r , (p (g `: 6) y) ,. n
  end.
  r=. /:~ r
  if. 0 > 1{x do. ok <dupnames r else. ok <r end. 
else.
  b=. (1:@(1!:4) ::0:) f
  (jderr ERR073) , f #~ -. b
end.
)

namecats=:4 : 0

NB.*namecats v-- extracts and classifies names in J code.
NB.
NB. dyad:  pa namecats ctJcode
NB.
NB. name classifications
NB.   global           global reference or assignment
NB.   local            local reference of assignment
NB.   declared global  names marked with global comment tag (*)=:
NB.   declared local   names marked with local command tag (*)=.
NB.   override mixed   allow mixed assignments (<:)=:
NB.   for. local       implicit for. locals
NB.
NB.  0 namecats jcr 'wordname' NB. only globals
NB.  1 namecats jcr 'wordname' NB. full classification

if. badrc parsed=. parsecode y do.
  parsed  NB. parse error
else.
  'dgbls dlocs parsed'=. }. parsed

  NB. handle quoted assignments and implicit for. locals
  'mgbls mlocs flocs'=. extscopes parsed

  NB. declarations override other scopes
  mgbls=. mgbls -. dlocs [ mlocs=. mlocs -. dgbls
  gbls=. dgbls,mgbls [ locs=. dlocs,mlocs

  NB. pick out assignments
  parsed=. parsed -. ;:')'
  uv0=. parsed #~ 1|.parsed = <'=.'
  uv1=. parsed #~ 1|.parsed = <'=:'

  NB. forbid names from being both local and global
  uv1=. uv0 -. uv0 -. uv1
  
  NB. errmsg: mixed scopes
  if. 0 < #uv1 do. 
    NB. check for mixed assignment override
    if. -.MIXEDOVER +./@E. ,y do. (jderr ERR0159),uv1 return. end.
  end.

  uv1=. parsed -. uv0
  gbls=. gbls , (jnfrblcl uv1) -. locs,JARGS

  if. x do.
    NB. complete name classification
    locs=. locs,jnfrblcl uv0
    uv1=. (<gbls),(<locs),(<dgbls),(<dlocs),<flocs
    ok <GLOBCATS ,. (/:~)@:~. &.> uv1
  else.
    NB. return only unique sorted globals
    ok /:~ ~. gbls
  end.
end.
)

nlctn=:([: I. [: +./"1 ([: ,: ]) E. [: > [) { [

nlpfx=:[ #~ ([: < [: , ]) -:&> ([: # [: , ]) {.&.> [

nlsfx=:[ #~ ([: < [: , ]) -:&> ([: - [: # [: , ]) {.&.> [

nounlrep=:4 : 0

NB.*nounlrep v-- converts nouns stored as binary  to linear  text
NB. representations. Uses  a  scratch locale to temporarily define
NB. nouns.
NB.
NB. dyad:  iaNoex nounlrep bt

NB. override mixed assignments (<:)=:
if. #y do.
  clearso 0
  names=. (errnames=. {."1 y) ,&.> locsfx SO  NB. !(*)=. SO
  try.  
    (names)=: (3!:2)&.> {:"1 y
    names=. (5!:5@<)&.> names
  catch. (jderr ERR016),errnames return. end. NB. retain scratch on failure
  if. x do. names=. names ,&.> LF end.
  y=. names (<a:;2)} y
  clearso 0
end.
ok <y
)

obtext=:4 : 0

NB.*obtext v-- assembles and returns object text
NB.
NB. dyad:  bt =. iaObject obtext blcl

if. badrc text=. checkopen__ST y do. text return. end.
select. x
case. WORD do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. (WORD,NVTABLE) get y do. text return. end.
  if. badrc text=. WORD wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case. DICTIONARY do.
  if. badrc text=. DICTIONARY get '' do. text return. else. text=. rv text end.
  file=. (' ' -.~ ;0{0{DPATH__ST__JODobj),'_DTXT' NB. HARDCODE document text suffix
case. SUITE;GROUP do.
  if. badrc text=. (x,2) make y do. text return. else. text=. rv text end.
  file=. y -. ' '
case. TEST;MACRO do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. x get y do. text return. end.
  if. badrc text=. x wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case.do.
  if. (<x) e. {(SUITE,GROUP);HEADER  do. 
    NB. group and suite headers are frequently edited
    if. badcl y do. jderr ERR0154__MK return. end.
    if. badrc uv=. ({.x) get y do. uv return. else. 'file text'=. , rv uv end.
  elseif. (<x) e. ,{OBJECTNC;DOCUMENT,EXPLAIN do.
    NB. get object documentation text
    if. badrc uv=. x get y do. uv return.
    else.
      NB. merge all document texts
      file=. >{.{. uv=. rv uv
      text=. ; ({:"1 uv) ,&.> <2#LF  NB. HARDCODE 2
     end.
  elseif.do.
    jderr ERR001 return. NB. errmsg: invalid option(s)
  end.
end.
ok file;text
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
  mdt=. 'NB. require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,mdt
  ok 'NB. JOD registrations: ',(tstamp ''),LF,jpathsep mdt
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. insure dictionaries are open
if. badrc msg=. checkopen__ST 0 do. msg return. end.

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

putjson=:3 : 0

NB.*putjson v-- store JSON as JOD text macros.
NB.
NB. monad:  putjson clFile
NB. dyad: clPath putjson clFile

NB. !(*)=. jpath
(jpath '~temp/') putjson y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'json file does not exist' assert fexist file
'file is not json' assert 'json' -: tolower justext file
jsonname=. (justfile winpathsep file),'_json'
json=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ JSON_ajod_
MACRO_ajod_ put jsonname;JSON_ajod_;json
)

putpy=:3 : 0

NB.*putpy v-- store Python code as JOD text macros.
NB.
NB. monad:  putpy clFile
NB. dyad: clPath putpy clFile

NB. !(*)=. jpath
(jpath '~temp/') putpy y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'py file does not exist' assert fexist file
'file is not python' assert 'py' -: tolower justext file
pyname=. (justfile winpathsep file),'_py'
py=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ PYTHON_ajod_
MACRO_ajod_ put pyname;PYTHON_ajod_;py
)

putsql=:3 : 0

NB.*putsql v-- store SQL as JOD text macros.
NB.
NB. monad:  putsql clFile
NB. dyad: clPath putsql clFile

NB. !(*)=. jpath
(jpath '~temp/') putsql y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'sql file does not exist' assert fexist file
'file is not sql' assert 'sql' -: tolower justext file
sqlname=. (justfile winpathsep file),'_sql'
sql=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ SQL_ajod_
MACRO_ajod_ put sqlname;SQL_ajod_;sql
)

releasejod=:4 : 0

NB.*releasejod v-- final JOD replease steps.
NB.
NB. dyad:  blVersion releasejod blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 11feb14 coinsert 'ijod' for new locale
NB. 11may25 (IFWIN) excluded from some (gdeps) tests
NB. 12oct12 (IFWIN IFIOS UNAME) excluded from (gdeps) tests
NB. 15mar17 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17mar03 jod macro converted to verb

'JODSTAGEDIR JODSTAGEPDFDIR JODSTAGEDOCDIR JODGITDOCDIR'=. y

NB. insure build dictionaries are open
assert. >0{od ;:'joddev jod utils' [ 3 od ''

jodversion=. ,>0{x

NB. JOD staging directory under put dictionaries alien directory
locsfx=. ;locsfx__JOD__JODobj {.{:"1 DPATH__ST__JODobj 
JODDOC=. (jpathsep ".'DOC',locsfx),'jod.pdf'

NB. check that all group dependents are in associated groups
NB. this is not necessary but highly recommended for groups
NB. that are used to form classes
JPROFILE=. ;:'IFIOS IFWIN UNAME'
assert. (a: -.~ (gdeps 'jod') -. JPROFILE) e. grp 'jod'
assert. (a: -.~ (gdeps 'jodstore') -. JPROFILE) e. grp 'jodstore'
assert. (a: -.~ (gdeps 'jodutil') -. JPROFILE) e. grp 'jodutil'
assert. (a: -.~ gdeps 'jodmake') e. grp 'jodmake'
assert. (a: -.~ gdeps 'joddob') e. grp 'joddob'
assert. (a: -.~ gdeps 'jodon') e. grp 'jodon'
assert. (a: -.~ gdeps 'jodtools') e. grp 'jodtools'

NB. !(*)=. manifestjoddocument historyjoddoc
sl=. ;: 'manifestjoddocument historyjoddoc'
assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests script
((0!:110) :: 0:) manifestjoddocument

NB. update document scripts
assert. 0<(toJ manifestjoddocument) fwrite showpass JODSTAGEDOCDIR,'manifest.ijs'
assert. 0<(toJ historyjoddoc) fwrite showpass JODSTAGEDOCDIR,'history.txt'
assert. 0<(toJ historyjoddoc) fwrite showpass JODGITDOCDIR,'history.md'

if. fexist JODDOC do.
  NB. copy jod.pdf to stage directory
  pdf=. read JODDOC
  pdf write showpass JODSTAGEPDFDIR,'jod.pdf'
  smoutput 'JODDOCUMENT updated'
else.
  smoutput 'JOD document not found -> ';JODDOC
end.

smoutput 'JOD distribution build complete'
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

rxs=:3 : 0

NB.*rxs v-- regular expression search.
NB.
NB. monad:  rxs ??
NB. dyad:  ?? rxs ??

ok 'NIMP rxs'
:
ok 'NIMP rxs'
)

setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore

locx=. locsfx__JOD__JODobj {.{:"1 DPATH__ST__JODobj
aliendir=. ".'ALI',;locx
JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath '~addons/general/jod/jodexts/'

NB. build directories
JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
)

testenvironment=:3 : 0

NB.*testenvironment v-- sets up the (ijod) locale for running test cases.
NB.
NB. monad:  testenvironment (clTest ; clSystemname ; paYammer)
NB.
NB.   testenvironment 'bad';'JOD'    NB. yammer is off (default)
NB.   testenvironment 'bad';'JOD';1  NB. yammer is on

'type system yammer'=. 3 {. y , <0

NB. control display of (testpass) !(*)=. TESTYAMMER_ijod_
TESTYAMMER_ijod_=: yammer

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

updatejoddistribution=:4 : 0

NB.*updatejoddistribution v-- updates files in JOD distribution.
NB.
NB. dyad: blVersion updatejoddistribution blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 08may28 removed install bats and scripts - simplifies JAL maintenance
NB. 08sep24 added history.txt to distributed files
NB. 11feb14 coinsert 'ijod' added,jod.pdf removed from zip
NB.         google/codeplex directory update removed
NB. 11feb17 jodpdf.txt directory placeholder added
NB. 11may18 joddoc/linuxnotes.txt added
NB. 12jun20 (setjaddonpaths) added for win, linux, mac path
NB. 12jun22 added (macnotes_TXT) 
NB. 12jun25 forcing line ends (toJ)
NB. 12jul07 copy dist zip to dropbox folder
NB. 14jun25 remove dropbox folder copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/state/... directories
NB. 15jul15 remove (jodindex_HTML) large obsolete object
NB. 17mar14 converted to verb

'JODSTAGEDIR JODGITDIR'=. y
jodversion=. ,>0{x

NB. scripts, labs and bats
NB. !(*)=. historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump
NB. !(*)=. LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak jodpdf_TXT linuxnotes_TXT macnotes_TXT 
sl=. 'historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump'
sl=. sl,' LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak'
sl=. ;: sl,' jodpdf_TXT linuxnotes_TXT macnotes_TXT'

rc [ 'rc jodscr'=. 4 get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests manifest script 
((0!:110) :: 0:) manifestjod

NB. update files
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodparms.ijs'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodprofile.ijs'
assert. 0<(toJ historyjod)    fwrite showpass JODSTAGEDIR,'history.txt'
assert. 0<(toJ historyjod)    fwrite showpass JODGITDIR,'history.md'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodbak/jodprofilebak.ijs'
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodbak/jodparmsbak.ijs'
assert. 0<(toJ joduserconfigbak)  fwrite showpass JODSTAGEDIR,'jodbak/joduserconfigbak.ijs'
assert. 0<(toJ manifestjod)   fwrite showpass JODSTAGEDIR,'manifest.ijs'
assert. 0<(toJ labexample001) fwrite showpass JODSTAGEDIR,'jodlabs/labexample001.ijs'
assert. 0<(toJ LabDump)       fwrite showpass JODSTAGEDIR,'jodlabs/labdump.ijs'
assert. 0<(toJ jodintro)      fwrite showpass JODSTAGEDIR,'jodlabs/jodintro.ijt'
assert. 0<(toJ joddump)       fwrite showpass JODSTAGEDIR,'jodlabs/joddump.ijt'
assert. 0<(toJ jodbest)       fwrite showpass JODSTAGEDIR,'jodlabs/jodbest.ijt'

NB. store jodpdf.txt place holder for jod.pdf - available online
assert. 0<(toJ jodpdf_TXT) fwrite showpass JODSTAGEDIR,'joddoc/pdfdoc/jodpdf.txt'

NB. store linux/mac specific notes
assert. 0<(toJ linuxnotes_TXT) fwrite showpass JODSTAGEDIR,'joddoc/linuxnotes.txt'
assert. 0<(toJ macnotes_TXT)   fwrite showpass JODSTAGEDIR,'joddoc/macnotes.txt'

smoutput 'JOD staging directories updated'
)

updatejodmanifest=:3 : 0

NB.*updatejodmanifest v--  set  JOD  addons manifests to  current
NB. version.
NB.
NB. set  interface  lists  - looks for  JODOSHOST  noun  if found
NB. appropriate interface lists are set  otherwise the default or
NB. standard interface lists are used.
NB.
NB. monad: updatejodmanifest uuIgnore

assert. >0{setjodinterface 0

jodversion=. ,>0{JODVMD

NB. get manifest scripts
sl=. ;:'manifestjod manifestjodsource manifestjoddocument'
assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl

NB. set manifest scripts
({."1 jodscr)=. {:"1 jodscr

NB. set manifest versions from dictionary versions
jodstamp=. showpass '/VERSION=:''',( '''' beforestr 'VERSION=:''' afterstr manifestjod),'''/VERSION=:''',jodversion,''''
manifestjod=. toHOST jodstamp changestr manifestjod

scrver=. allwhitetrim LF beforestr 'VERSION=:' afterstr manifestjodsource
jodstamp=. showpass '/VERSION=:',scrver,'/VERSION=:''',jodversion,''''
manifestjodsource=. toHOST jodstamp changestr manifestjodsource

scrver=. allwhitetrim LF beforestr 'VERSION=:' afterstr manifestjoddocument
jodstamp=. showpass '/VERSION=:',scrver,'/VERSION=:''',jodversion,''''
manifestjoddocument=. toHOST jodstamp changestr manifestjoddocument

NB. update manifest scripts
assert. >0{MACRO_ajod_ put 'manifestjod';JSCRIPT_ajod_;manifestjod
assert. >0{MACRO_ajod_ put 'manifestjodsource';JSCRIPT_ajod_;manifestjodsource
assert. >0{MACRO_ajod_ put 'manifestjoddocument';JSCRIPT_ajod_;manifestjoddocument
smoutput 'JOD manifests updated'
)

updatejodsourcedumps=:4 : 0

NB.*updatejodsourcedumps v-- update files in JODSOURCE distribution.
NB.
NB. monad:  blVersion updatejodsourcedumps blclDirectory 
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: -------------------------------------------------------------
NB. 07nov17 copies to JAL subversion directory
NB. 11feb14 coninsert 'ijod' added, google svn removed
NB.         plain *.ijs jod source directory added
NB. 11may18 jodsourcesetup.ijs added
NB. 11may26 copy of jodsourcesetup.ijs added to zip for backup
NB. 12jun20 add (setjaddonpaths, setjaddoncopy) to set paths/copy on win, linux, mac
NB. 12jun25 set all line ends (toJ)
NB. 12jul07 copy source zip to dropbox
NB. 14jun25 remove dropbox copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/stage... directories
NB. 15jun30 toggle RETAINAGE for jodsource dumps
NB. 17mar03 jod macro converted to verb

JODSOURCESTAGEDIR=. y
jodversion=. ,>0{x

NB. scripts, labs and bats !(*)=. manifestjodsource jodsourcesetup
sl=. 'manifestjodsource jodsourcesetup'
sl=. ;: sl

assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. update manifest 
assert. 0<(toJ manifestjodsource) fwrite showpass JODSOURCESTAGEDIR,'manifest.ijs'

assert. >0{3 od ''

assert. >0{od 'joddev'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0
assert. rc [ 'rc msg joddev'=. make ''
assert. >0{dpset 'RETAINAGE';1 
assert. >0{3 od ''

assert. >0{od 'jod'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0 
assert. rc [ 'rc msg jod'=. make ''
assert. >0{dpset 'READONLY' [ dpset 'RETAINAGE';1
assert. >0{3 od ''

assert. >0{od 'utils'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0 
assert. rc [ 'rc msg utils'=. make ''
assert. >0{dpset 'READONLY' [ dpset 'RETAINAGE';1
assert. >0{3 od ''

NB. read files
joddevdat=. read joddev
joddat=.    read jod
utilsdat=.  read utils

NB. update dump files 
FILES=. <;._1 ' joddev.ijs jod.ijs utils.ijs jodsourcesetup.ijs'
FILES=. (<JODSOURCESTAGEDIR) ,&.> FILES
assert. 0<(toJ joddevdat)  fwrite showpass ;0{FILES
assert. 0<(toJ joddat)     fwrite showpass ;1{FILES
assert. 0<(toJ utilsdat)   fwrite showpass ;2{FILES
assert. 0<(toJ jodsourcesetup)  fwrite showpass;3{FILES

smoutput 'JODSOURCE stage directory updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H%$32E2g7+>t>s3$:1'1H$@9+>u,#0f'q-3$:+%1,g=11a"\4+>P\p2_lL10H`80+>Gbs1,C%-
0d&8,+>t>t1*ACr0fC.7+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt2BXb4+>Y,q1*A;*+>Ybq1a"V0
+>Y,t1*AS"2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!1GL"0+>Ybq2]sk1+>Y,s0d&=r1,U1/
0H`5,+?1K$3$9t!1,C%.+?:Q!0H`2-+>k9!1E\Fq1,C%-0H`20+?(E"1*AIt2DlU9+>khq0ea_+
0d&J!1bp10+>Gbs1E\M1+?:Q"1E\Y"1H?R8+>ktu2'=h3+>k9!0H`=t2DQC5+>Yer1*A>4+?1K"
2BXq$1-$I7+>Ynu2BXb7+>GPm1,L+/+>PVn1E\D4+>Y,q2'=V/+>Yhs0f:(13$9t2+>Yer0fL43
1E\G,+>YuF8Ol?O;f6_pATD3q+Cf(nEa`I"ATDi[<D?:a;b&Z:+Eh=:F(oQ1+EV:*F<G(6ART[l
A0>u-BlbD-F_u)0Bl%?L6pjaF;bp(UFCf]=+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%ht
Bl5&.@rH7+Deru-Df-\!Bl7I"GB4mJH#n(=D0&-66VgHU:J=2a:/Fc)DffQ0@:Ul=/nK9=+@S[c
:JOha9LU(C@<?0R76s=1;J1#gF`8I3DIal2F_Pr/+D>=pA7]d(@rGmh8U=!)6tpO\ATDBk@qB.g
Eb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\
.7nhX:IJo7FCfK)@:NkI<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et+DG_8ATDBk@q?c7+E_a:A0>?,
+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$FDl)6F%T4r<)6:`;]odlFCfK)
@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!3TcDKKH1
Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k
+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&AP,ls:.eG\:*=IaC1Ums+Cf>#APGHX
;GU7p:do50@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R";Fs\a/5/?/79D*3<)$%;=A;I?<(0ng
/4*K=74_/!;G0DR=&(;H<(8iA8Q\DL:KBn^D/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B2:i`
<Du7N<(1_7Ap&0)@<?''Ci<flC`mG&ASuU(AnbgsF!,R5B2:i`<Du7P:/l+>D.Oi.@V0b(@psIn
Df-\6Bl.R++>"^LBkM*jEZfO6Cis<1+DbV1F!,:5CLq=-+EVNE@r,RpBMUra<Du7]7TaS<Ap&0)
@<?4%DBNb6@ps0rBk1dmFD5?$ATAo4Eb/isGYhOB85DuW=]@pf:*=UfEbTK7+E(_(ARfg)@rGmh
;c-4e;+r*R@rc:&F<GL2C1Ums+Cf>#AQ2)s<*;L]9gqs%ATMr9D.Rd0@:s-oF*D>?@qZu:+>G!W
DBLVUDe<TjB4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+C\bhCNXT;@W$!uBleA=
DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(qE$/b,Ch7ZsDJXB*@<,jkF(Jd#
@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0
BleA=E+*j1ATD[0@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%ht
Ci<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(JlkF_PZ&F!+t2D/aN,F)to'+Eh=:
F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'ARfLnFECr#1Lk*0@r$-.@;Ka&FD,]+
AKWC=@;TR,>@VJXF)tV<FCf]=.3N_@@VfUs@rH4'Eb0<5C3!m&Dg#]5+CT)&+EqL5FCcS9E+*6f
+D,Y4D'2FnGAhM4F!+n/A0>r,DfTr2DK?q:De!3l+DtV)ATM@%ART[lC2[WnBk)7!Df0!(Gp%$7
C1Ums+CfG'@<?4%DBO+6EaiQg@;BIeF_kl>+E;O4Ch[KqARlom@:O(qE$/b,Ch4`.@<?0nAn,Xq
F(JitDf]J4A8,OqBl@ltEd8d>Bl%?kDJX-'F*&OC@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYd
AKYT!Ch7ZuE-#T4F(KG9A8,OqBl@ltEd8dH@<,dnATVL(F(BE1E+ifkA7]dkEb/[$ATJu9BOr;s
F_u)0Bl%?'@;]TuGB.D>ATJu-ART+\EZf(6AoD^,@<?4%DIdm/DIIBnF)to/ARfg)Df0B:+CoV6
Ch[BfFCcS4@;TRs+DG^9FCAWpAKYGjF(Jl)Df-\0Bl\9:+Cf>+F_u#-A7]:cF<G+.@ruF'DIIR2
+E(_(ARfh'ATVKoBlkJ>AU&<0ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF
+EV=7ATMs%D/aQ2De*d(FEMVA+A,Et+E)-?Eb0<7Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QK
DffZ(Ed)5=ASc!r@;BEs@;]TuCi<`m+A,Et+D5_5F`;/8@:WhUCLh."Ci<`mF!+t2D/a<&FCcS8
AT;j(F*(u(+C\bhCNXS=A8-'q@ruX0Gp"M\.;Wp2A7TCpCi<`mF!,R<AKYK$D/a<&FCcS8AT;j(
F*(u(+Co2,ARfh#Ed8cUGq!QJ@:X7cCi<`m+DtV)AKYK!@<6K4AoD]4.![6a;IsolCige6F!*.Z
AoD]4F*1u&ATMo8@;]Tu0d((HEZet&Bl%p4ASc9nA9)6nCi<`mF!,[FEb$;$DIal3ATMr9Eb/io
Eb0,uAKYf'F*)IGAo_g,+E_a:F!,(/Ch7F$@:XG$@;Tt)Ci<`mF!,"-Eb/a&DfU+GFD5T'+EMX5
D/aP=.![7XDdd1#DfTB0Ci<`mF!,"-@ruF'DIIR2+EqaEA9/l-DKKe>FCB3&ATT&2De!3lATM^)
F)>?$AKYf-@:UL%@rc:&FDYo3Ch[s4+E(_(ARfh'+DG^9@;Ka&Eb/ltF*(u6ARlooBk)7!Df0!(
Bk;@&DJXB*@<,jkD..L-ATAo2@;TQuCh[s4+EM+&Eard#@;TRc@<?R%G][t7@ruc7@;]Tu@r,Rp
F(o6#ATJu3@;TRs+DG^98g%V^A7]Xp@ruU+@;TRs+Cf>-FCAm$Bl7Q+F*1r5FE2)5B0%.`4$"a!
@<?Q5@UXA"-Rg0UCh%R)+=CT>-Z3a>ApA0$FCSu,E,oN%Bm=31+=M/IFD5T+H=\42DfQt:@<-!l
+Dbb5FE8ll+=K<4-YR'6@W*AuDdd`8.3NMEE+X>;-Xq!ADJXB+G\pl2@q[!&@;TQuF*2),Bm=31
3Zoh43[]2]A76U+@:WdhH#G&Z+Du":Ap>FGA76j'Dfor6Eb03"Df0`0Ecc@FDJsZ8F!,OGDfTE"
+CT=6@VK^gEd8dLD]ik1DIm6s+EV1>F<GU8E,oN2ASuTuFD5Z2F)PN0AU&<*F)to0@VfUs+CT.u
+ED%8F`MA@+E(_(ARfg)FCf]=De*d*ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;@)F`_&.Cij`;
F`_[I@;Ka&FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mMF`_A>Df0W<DfTD38lJM\+CT=68l%ht
FCf]=+DkOsEc6#<F`_SJF*)>@AKXfpFD,T1+Cf>#AKYE&+A,Et+EV1>F<GF/@rcL/E-68DEGT]<
DfTD3;c-42@<3P`:IH=IAU&;>D.-ppDf]r1Ch7$rASQ-oAnc-kC`l>G6m-M]E,9)oF(HJ8FCfE4
Ec#i>DK?pm+DkOsEc3(A@rc:&FE;JEFE2MAF!+'tFCfN8+EM%5BlJ08Ed2YGAS6.%@<*K%G]7\7
F)u&6DBO"3@<,jkF(KH&F_PZ&A8-(*F(KH7+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaEA92j(
F*(u2G%ku8DJ`s&FE;#8F!,UE+EV:.+=Lr=De(:>Ci<flCh4`$DfQt@F`))2DJ()6ATMr9@psFi
F*2G4@<?'qDe*BmF*)G:@Wcd,Df0]:A79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:Bju4,Bl@m3E+EC!
ASQ-oD..<rAn?%*F(KG98l%ht@:WneDK?q;@;]dkATMs7+EVNE@s)g4ASuT4G%G]8Bl@m3E+EC!
ASQ-oF)Q2A@qB1nD/aQ=E+EC!AKYT!Ch7Z1Bl5%c:IJ,W<Dl1Q+Co2-FE2))F`_>9D?       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,gp11Gg40+>GPm1,1XA+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%9+>GZ+2'=V-+>Pf/1*A;2+>Gf72'=V/+>G]31a"e$0fM*J+>GYp0ebCC
+>Gl!1,1dI+>G_r0ebF?+>GPm3&`f>0f'q21GU(-2]t+81a"M0+>G]-0d&2-+>G`21a"M1+>GW0
1E\G-+>Pl01*A>,+>G]02'=Y/+>Gi22BXb0+>PW21E\G-+>Yl10d&5++>PW-1E\D/+>GT)2BXb2
+>Yf61E\D1+>GZ41E\G0+>P`/2BX_0+>Gl91a"b#3AiX&DJVXJF(o,<0ht%f.Um:36=FqL@k]V[
F=f'e@UX=l@j!1/DJUaE@UWb^F`8I@@;TQuCh[s4+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3L$\ATMs.De(OV.3N).@r$4+F!,:;@:Wq[+EqOABHUl(Dfo]++EqaEA9/l8
D]in*FCSu,DIIBnF"Rn/:-pQU+<VdL+=M>CF*)/8A2#_e+DGm>Ci<`mARlomGp%3BAKZ)+F*'Gc
EccCG-Z!^0A9;C(F>,C'A8,OqBl@ltEd9#A$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JP:mARdJL%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$p[A79RkA0>K&EZdss
3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1+=BH@6"48D
Bk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)
0JOpa$4R>;67sC&BOu3q+Dl7BF<G%(+CT.1DfB9*+Co1rFD5Z2@<-W&$>sEq+C]5)+=ANG$>sEq
+C]5)+=Ach%16uaEZeh/C`k*GAR[8H1a`_>%16Ze+E(d5FC])qF:ARP67sC)DfTB0+D,Y4D'3\6
F*&O7F`MM6DKI"1@:O(qE"*.cEZeh/C`k)Q%13OO:-pQUFCfN8F!,(8Df$V6Df^"C@s)g4ASuT4
@UWb^F`7csATAnJ+C]5)+=ANG$4R>;67sBlF<G()FCfK$%16Ze+>P'KDJUFC-OgDoEZd.\@W$!)
-RT?1ATAnM+C]5)+=ANG$4R>;67sBiDJUFi:K(4d=WhQqEcQ)=F!,"2C`m>.EZfI;AKYi.F*&O7
F`MM6DKI"1@:O(qE$-_TAU%]rE-)Nr:-pQU@W$!)Df0B:+EM+&EarcoF!+m6F(oN)Ch4`.F`\a:
Bk)7!Df0!(Gp$R)@r$4++EV:.Eb-A-F!,@=+E1b2BFP;D67sBoASu!h+EV:.Eb-A%Eb-A2D]j"-
FD)e8Eb&a%+ED%7F_l/@+Dbb-ANCqV0Ha^W+CoA++=ANG$>"6#1a"Rs@W$!)-XT8;<$re2:-pQU
D.-ppDf[%4DIdI!B-;D4FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bhCNXS*$>"6#1*A=p@W$!)-Z<NC
+<VdL:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC+DG^9@s)g4ASuT4@UWb^F`7cs
%16Ze+>=om+>=pIDJUFC-QjNS+AP6U+CT)&+Du+?DK?q7DBNG3EcP`/F<G%$@r$4+%16Ze+>=om
+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^F`7cs%13OO:-pQUGAhM4
F!,(8Df$V9@<-I(@s)TrEZeh"@r$4+Et&IO67sBiCh%9(De:,$@:O(qE$0%@D.7's+CoD4F"AGF
B0%.t4"`61-S@/1/ho:;0fCX=2(gU?/ho.70et@81a`_>:-pQUAoD^,@<?U&A0>r3+CT)*BON$)
DfTr@+DkP/@q[!&F_t]1Bk&9,DfTr@%16Ze+C]52D0%j$+C]5)+=Ach%16Q[4ZX]L0mdAIF_u1_
3Zri'+C]52D0$-n%16Ze+C]5)+C]+/+<VdL+<VdL+<VdL+AP6U+<Y-2C`k)X0fLI&+<VdL:-pQU
D..NrBOu6-@;Ka&GAhM4F!,17+D5D3ASrW"@:O(qE"*.cEZeh/C`k*GAR[#<@V[)/+<VdL+<XEG
/g)9GDJUFCEb/]40fLI&+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l7FCB33Bl7Q+GA2/4+=D2@@OE:4
DBNS+G%GP6@UWb^F`7csATAnI+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0H`.o@W$!)-Y7NT0fLI&
+AP6U+EqaEA9/l)DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#0d&7p@W$!)-Y7NM
/7NB;+<VdL:-pQU+>Fup+C]5)+=C`F/ho:4+<XEG/g,7IF*)IGASu$mDJ()9Bln#2-Y7NM+DG^9
B5)O#DBNCs@r$4+%16Ze+>P&p+C]5)+=D)<-S/_B+<VdL+AP6U+<WE^1*C%DC`k*DA1fSq-QjO,
67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7F*)G:DJ((>De(4<Bl5&+Bm+'*+C\bhCNXS*$4R>REZd%Y
0d&1n@W$!)-UK13@V[)/+<XEG/g+S=C`m.sG%G]'F!,OG@<-I(DJ()9Bln#2-UK1'Bl5&+Bm+'*
+C\bhCNXS*$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?Xdnh;f-GgAM>f567s`sDJW6gDeio<
0HbHh/KcHNDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1
:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^
@<?0*-[nZ`6rZTR<%i?)F*)/8A2#A?$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW*2/78M1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)
Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!
F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).
2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR
$4R>;67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o
%15is/g,4FBQ60r+?hi#/g)qm+AP6U+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN
1a!o967sBQ+EqaEA0>buD.Oi"CghC+%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is
/g)8Z+@U*\A7]9o+<X'd@ruF'DIIR26Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-
+<VdL+BNK%A5d&JEarcT:18!N6Yp1PF!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?
+DbJ,B0A9u-p22r0I\+q+=K>r0Ha.X8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cI
F(8m'.3L/a-nK]n/6>VF6sjA;De*3(4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'
4&&".;GU7p:dn`"C2[Wi.1HUn$;No?+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o
:-pQU+<Ve<D/aTB+<Y-%@r$4+@r?B2+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro
@UWb^F`7cs:-pQUEaa!$4ZX]5-QjNn+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS
+<Vdg+=D&8D.P>0Dfor>-OgCl$;No?+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2
FED)7DK?6o:-pQU-Vcu\+=A9_+u(2_4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a
9KF:N+=nX^+=K?g@<-!0+=nWtEHQ2AAL9#n+ECn2B+51W$9g.jDe't<FCfN8C2[W:-QlV91E^UH
+=ANG$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p
0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?
+D#S%F(HJ&DL!@6@:O(qE-!-2$:IQN3Zrc1HS-F/:dJ&O?XH`2?XHE$6uQOL%14g4/1_nl0d/S8
2(9Y&+Co2,+@8@e?XH2p/12o"Bkh6-%13OO:-pQUFE2XLF(Jd#@q]RoB-;D3ASrW4BOu3q+CT;%
+Du*?@UWb^F`;CE/KeVLE+NO$ARlopEcQ)=%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&
DJUFC/i+ja$4R>;67sBjEb/[$AKZ).Eb/f)@UWb^F`;C2$4R>;67sBmBl\9:+E(_(ARfg)@rH1"
ARfgrDf-[L+D#D/FEn<&4tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+
Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#Tt-Zip@
FD>`)0II;:+:SZQ67sC&BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia
.3NGF@:W;RDeip+ATMrJ%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EMI<AKYGjF(o,,Bl8*&
Ch[E&@<-"'D.RU,F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*
-OgE#ATAnK+C]5)+=Aco-OgE#ATAo&DJUFL%16uaEZeh/C`khf-OgCl$;No?+EMI<AKYGjF(o,,
Bk1dmFD5i2ATJt'$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bh%14L;+C]5)+=ANc+>#Vs0HahB
C`keoHS?RODJUFC/ghbN$7IVO@W$!)-RU>c/NP"/+C]5)+?M<)0d'qCC`k)X-Qij*-o)oSDJUFC
-Rg/i3Zp1#@W$!)4#)(;+C]5)+=Ach+:SZ+1E^.EC`k)Q.3L3'+>Y-LDJUFW0mb]!@W$!)-S?bh
%14L?+C]5)+=ANc+>#Vs1a$7FC`keoHScjSDJUFC/ghbN$4R>;67sB'@W$!)-S?bU$9g.j@W$!)
-S?bh%14p74WktYDJU[Q-OgCl$=[FSDKTeZ3Zoe&-Qjr_,!$i$1E\1j+taud4#)(kDJUFC/gi(j
/M8.n/gh)8%15is/g+b;FCSu,Ao_g,+<YQ?DIn',F*(u2F<G%$@r$4++>"^IEcQ)=+D#e:ARfgn
A.8l`ATAo&DJUG)@:X7uD%-hiATAnI+C]5)+C\biDKTe*$>sEq+>G!JDJUG)@:X7uD%-hiATAnK
+C]5)+C\biDKTe*$>sEq+>Y-LDJUG)@:X7uD%-hiATAnM+C]5)+C\biDKTe*$4R>;67sBT@;^?5
De:,4ASkjiDJ=!$+EV19FE8R7EbTW0@ps1iGp$X/E+Not+E)-?FD,5.Ci<`mARlp%@VTIaFE9&D
$;No?+A$/fFD,5.Ci<`m+EMC<CLnW1ATMr9F(96)E--.D@<,p%@q]:gB4YTr@3BB)F<GL6+EV:.
F(HJ9ATMs7%15is/g,"RF*&O6AKZ#)G%l#/A1eu6$4R>;67sB'@W$!)-RT?1-tI43+=ANc+>#Vs
@W$!)-RT?1%15is/g)9GDJUFC/n8gBDKI68$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bU$4R>;
67sB'@W$!)-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE
740N,/NP"`DJUFC6;LBN-OgCl$;No?+<Y-2C`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I
:/k1Y6;0fq.3L3'+C]5)+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0HahBC`k)Q%14L;+CoA++=ANc
+>#Vs+>=pIDJUFC-OgCl$;No?+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=pIDJUFC/gh)8%15is
/g)hj@W$!)-SAnIF`):K%14L;+CoA++=ANc+>#Vs0HahBC`keoHX^l/+=Ach%13OO:-pQU0HahB
C`k*C@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'
+>=pIDJUFC6;LBN-OgCl$;No?+>=pIDJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a
5se76-Rg/i3Zp+!@W$!)-V7'4-S.>7HX^l/-S?bU$4R>;67sB8+C]5)+=ANG$7IVj-Za-CCLo2!
ATMrI-T`\sD/X3$0iV_*F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-RT?1%15is/g)kk@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp."@W$!)-S?bU$4R>;67sB8+C]5)+=AdODfor>-OgD20fpb(D/X3$
0N;V)F>,'k+>#Vs0d'qCC`kepHX^l/-S?bU$4R>;67sB8+C]5)+=D&8D.P(($7IVj-Za-CCLo5"
ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k*HD/X3$0ddD;%15is/g)kk@W$!)-Z3@0AM.J2
F`):K%14L<4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+=D5IDeio<-S.>7HX^l/-S?bU$4R>;67sB9
+C]5)+=ANG$7IVj-Xq"4CiaH3CLo1I4""KUDesK3Deio=-T`\iDKKr:Deio<-T`\iDKKr:Deio=
-Rg/i3Zp1#@W$!)-RT?1%15is/g)nl@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;
67sB9+C]5)+=AdODfor>-OgD2-p045/3GU3@6,h[/NP"0+C]5)+?MB+@W$!0/gh)8%15is/g)nl
@W$!)-Z3@0AL@oo-o!e2Bl8$6D/X3$0deCm/NP"0+C]5)+=Cl@FE;;;CLo4J%13OO:-pQU1*C%D
C`k*C@;TR.@rHL-F=.M)-o!e2@W-1$F)>i2AM>J\+>#Vs1*C%DC`k*7Df9G>/3>V6@W$!)-S?bU
$4R>;67sB:+C]5)+=ANG$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!0-OgCl$;No?+>Y-LDJUFC
/gh)8-t7(1+=Ach.3L3'+>Y-LDJUFC/gh)8%15is/g)qm@W$!)-SAnIF`):K%14L<4"#)lBlmp-
D/X3$0deCm/NP"1+C]5)+?M<)@W$!0/gh)8%15is/g)qm@W$!)-Z3@0AL@oo-o!e2F*22=ATM^,
CLo4J.3L3'+>Y-LDJUFCF*/i>$4R>;67sB:+C]5)+=D&8D.P>0Dfor>-OgD2-p045/3GU3@6,h[
/NP"1+C]5)+=D5Q-S.>7HX^l/-S?bU$4R>;67sB;+C]5)+=ANG$7IVj-Za-CCLo1o@:O=r0IJq0
F)>i2AM?he@rcKB-T`\sD/X3$0hl(dEc3WZ4"#)dDeio=9jqOPD_WUg+>#Vs1a$7FC`k)Q%13OO
:-pQU1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68
$;No?+>b3MDJUFCDIIBn-OgDX67sB;+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl
$;No?+>=om+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X
@rHL-F=.M):-pQU0H`(m@W$!)-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj
1*C%DC`k)Q%13OO:-pQU0H`+n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?
+>=on+C]5)+=AdODfor>-OgDX67sB7+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gB
DKI68$;No?+>=oo+C]5)+=ANG$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)
+=Ach%13OO:-pQU0H`.o@W$!)-SAnIF`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.E
C`k*C@;TR.@rHL-F=.M):-pQU0d&1n@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq
+>#Vs0d&1n@W$!)-S?bU$4R>;67sB8+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P((
$;No?+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach
%14LmDJUFC/gi(j/NP"/+>P'KDJUFC/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o
@W$!)-Z3@0AL@oo:-pQU0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU
0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>
-OgDX67sB8+>Y-LDJUFCDIIBn-OgDX67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)
+=ANG$4R>;67sB9+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o
@W$!)-SAnIF`):K%15is/g)nl0d'qCC`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M)
:-pQU1*A=p@W$!)-RT?1%15is/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU
$4R>;67sB9+>P'KDJUFC/n8gBDKI68$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8
D.P>0Dfor>-OgDX67sB9+>Y-LDJUFC-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0
+>Y-LDJUFC/gh)8%15is/g)nl1E^.EC`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU
1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp4$0d'qCC`k)X-OgCl$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFC
DIIBn-OgDX67sB:+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'K
DJUFC/gh)8-t7(1+=Ach.3L3'+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is
/g)qm1*C%DC`k*C@;TR'%15is/g)qm1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1
%15is/g)qm1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC
/n8gBDKI68$;No?+>Y,r+C]5)+=D&8D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;
+>G!JDJUFC-OgCl$;No?+>b2q+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is
/g)tn0d'qCC`k)X@rHL-F=.M):-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2
F`):K%15is/g)tn1*C%DC`k)Q%13OO:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%D
C`k)X-OgCl$;No?+>b2r+C]5)+=AdODfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>b2s+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+C]5)+=Ach%13OO:-pQU1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'
%15is/g)tn1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahB
C`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68
$;No?+>=om+>=pIDJUFCDIIBn-OgDX67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun
+C]5)+=ANG$4R>;67sB7+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO
:-pQU0H`(m0d'qCC`k)X@rHL-F=.M):-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)
-Z3@0AM.J2F`):K%15is/g)hj0d&4o@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp+!0d&4o@W$!)-S?bU$4R>;67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)
+=D&8D.P(($;No?+>=om+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?
+>=om+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)
-SAnIF`):K%15is/g)hj0d&7p@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M)
:-pQU0H`+n0HahBC`k)Q%13OO:-pQU0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahB
C`k)X-OgCl$;No?+>=on+>=pIDJUFC/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7
+>P&n+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach
%14LmDJUFC/gi(j/NP".+>P&o+C]5)+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU
0H`+n0d'qCC`k*C@;TR'%15is/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)
-RT?1%15is/g)hj1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7
+>P&p+C]5)+=AdODfor>-OgDX67sB7+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn
/n8gBDKI68$;No?+>=on+>Y-LDJUFC-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'
+>=on+>Y-LDJUFC/gh)8%15is/g)hj1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0
AL@oo:-pQU0H`+n1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o
0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gB
DKI68$;No?+>=oo+>=pIDJUFCDIIBn-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7
+>Y,p+C]5)+=ANG$4R>;67sB7+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach
%13OO:-pQU0H`.o0d'qCC`k)X@rHL-F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp
@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!1E\Fq@W$!)-S?bU$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q
+C]5)+=D&8D.P(($;No?+>=oo+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl
$;No?+>=oo+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir
@W$!)-SAnIF`):K%15is/g)hj1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU1a"Lq1,0n\DJUFC-OgCl$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
0d&5++C]5)+=Ach%13OO:-pQU1a"Lq1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0
AL@oo:-pQU1a"Lq1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn
0d&5,+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)
-SAnIF`):K%15is/g)tn0d&5,+C]5)+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&5-+C]5)+=ANG$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,C%^DJUFC/gh)8%15is/g)tn0d&5-+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'
%15is/g)tn0d&5-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq
1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X
@rHL-F=.M):-pQU1a"Lq1,L+_DJUFCDIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,U1`DJUFC-OgCl$;No?+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/
+C]5)+=Ach%13OO:-pQU1a"Lq1,U1`DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnI
F`):K%15is/g)tn0d&50+C]5)+=D&8D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is
/g)tn0d&51+C]5)+=ANG$4R>;67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=b
DJUFC/gh)8%15is/g)tn0d&51+C]5)+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is
/g)tn0d&51+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCc
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-
F=.M):-pQU1a"Lq1,pCcDJUFCDIIBn-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU
1a"Or1,0n\DJUFC-OgCl$;No?+>b2r+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>,+C]5)
+=Ach%13OO:-pQU1a"Or1,0n\DJUFC/n8gBDKI68$;No?+>b2r+>PYo@W$!)-Z3@0AL@oo:-pQU
1a"Or1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>P\p@W$!)-RT?1%15is/g)tn1*A>-+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>P&p1*C%DC`k)X-OgCl$;No?+>b2r+>P\p@W$!)-SAnIF`):K
%15is/g)tn1*A>-+C]5)+=D&8D.P(($;No?+>b2r+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>.+C]5)+=ANG$4R>;67sB;+>P&p1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,C%^DJUFC
/gh)8%15is/g)tn1*A>.+C]5)+=AdODfor>-OgDX67sB;+>P&p1E^.EC`k*C@;TR'%15is/g)tn
1*A>.+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1a$7FC`k)Q%13OO:-pQU1a"Or1,L+_DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>Pbr@W$!)-S?bU$4R>;67sB;+>P&p1a$7FC`k)X@rHL-F=.M)
:-pQU1a"Or1,L+_DJUFCDIIBn-OgDX67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,U1`DJUFC-OgCl$;No?+>b2r+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>0+C]5)+=Ach
%13OO:-pQU1a"Or1,U1`DJUFC/n8gBDKI68$;No?+>b2r+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Or
1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pht@W$!)-RT?1%15is/g)tn1*A>1+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>P&p2BZIHC`k)X-OgCl$;No?+>b2r+>Pht@W$!)-SAnIF`):K%15is
/g)tn1*A>1+C]5)+=D&8D.P(($;No?+>b2r+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>2
+C]5)+=ANG$4R>;67sB;+>P&p2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,g=bDJUFC/gh)8
%15is/g)tn1*A>2+C]5)+=AdODfor>-OgDX67sB;+>P&p2]uRIC`k*C@;TR'%15is/g)tn1*A>2
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p3$;[JC`k)Q%13OO:-pQU1a"Or1,pCcDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2r+>Po!@W$!)-S?bU$4R>;67sB;+>P&p3$;[JC`k)X@rHL-F=.M):-pQU
1a"Or1,pCcDJUFCDIIBn-OgDX67sB;+>P&p3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\
DJUFC-OgCl$;No?+>b2s+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G-+C]5)+=Ach%13OO
:-pQU1a"Rs1,0n\DJUFC/n8gBDKI68$;No?+>b2s+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Rs1,0n\
DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>P\p@W$!)-RT?1%15is/g)tn1E\G.+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Y,q1*C%DC`k)X-OgCl$;No?+>b2s+>P\p@W$!)-SAnIF`):K%15is/g)tn
1E\G.+C]5)+=D&8D.P(($;No?+>b2s+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G/+C]5)
+=ANG$4R>;67sB;+>Y,q1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,C%^DJUFC/gh)8%15is
/g)tn1E\G/+C]5)+=AdODfor>-OgDX67sB;+>Y,q1E^.EC`k*C@;TR'%15is/g)tn1E\G/+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1a$7FC`k)Q%13OO:-pQU1a"Rs1,L+_DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>Pbr@W$!)-S?bU$4R>;67sB;+>Y,q1a$7FC`k)X@rHL-F=.M):-pQU1a"Rs
1,L+_DJUFCDIIBn-OgDX67sB;+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC
-OgCl$;No?+>b2s+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G1+C]5)+=Ach%13OO:-pQU
1a"Rs1,U1`DJUFC/n8gBDKI68$;No?+>b2s+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Rs1,U1`DJUFC
DIIBn/n8gBDKI68$;No?+>b2s+>Pht@W$!)-RT?1%15is/g)tn1E\G2+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Y,q2BZIHC`k)X-OgCl$;No?+>b2s+>Pht@W$!)-SAnIF`):K%15is/g)tn1E\G2
+C]5)+=D&8D.P(($;No?+>b2s+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G3+C]5)+=ANG
$4R>;67sB;+>Y,q2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,g=bDJUFC/gh)8%15is/g)tn
1E\G3+C]5)+=AdODfor>-OgDX67sB;+>Y,q2]uRIC`k*C@;TR'%15is/g)tn1E\G3+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Y,q3$;[JC`k)Q%13OO:-pQU1a"Rs1,pCcDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+>Po!@W$!)-S?bU$4R>;67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCc
DJUFCDIIBn-OgDX67sB;+>Y,q3$;[JC`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/
DeioE3B:GVDf'H.;f-GgAM>f567s`tDf'H.;f-GgAM>e\F=f'eFCfN8+=L`<D/a5=+DtV)AKYo#
Ap&0)@<?4%DCuA*:-pQB$;No?+BN5fDBO%7AKW+:FE2)5B-8TU3[m3Q+<Y*3E+NHuF!)T>DBL'1
+A*b!GAhM4+<W(BDf'H..3NhKChsOf:-pQUDdm=$F(8X#AKYE!Gp"5GDe!3l+DtV)ATKIH:L[pY
F(8X#ARlp$@;TRs+<Y-)B5)6++EqOABHVD1AISuA67sC"Eb/isGT\+W:I7NN;aXAN==G@8@;]Tu
+<Y65A0<"=Bln#2+ECn.A8c<-+C\c#AKW*j5tsd69Me8G%15is/g,4XAnGb%ATJt:+Cf>-FE2;9
Ch7-"+C]U=+=L#P7TEAS6V^T0/g)8Z882^MATAn9+Eh10F_,V:+E(j$$;No?+=L#P7TEAS6V^T0
+D58'ATD4$AKYf-DJ*O$+CT.u+DbV1F!,:5CLq=-+EVNE@r,RpBHV2$D.Rc@%15is/e&._67sC(
ATD6gFD5SQ%15is/e&._67sB'+>G;f@<6L4D.Rc2FCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpu
AU%p1FE7lu:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]g
Cb[jX$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-h
FCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_
5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&
-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6-
>9G^EDe't5-RT?1%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B
+CehrCcW[]C1D9,-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?
+Co%qBl7K)GAhM4+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(
.6T^7Ddm=$F(8X#AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]s
G&M;0D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\
DIb@/$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t
+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(
Gmt*lEZfI@E,9H&+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)
GA2/4+E(_$F`V&$FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@
$4R>;67sBsDe!3l+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`
Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s
+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-
FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#
BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh
@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl
$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQU
Eb/Zi+C\bhCER&'A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO
:-pQUCi<flC`me4DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5D
DfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3
F!,::@;TRs+=o,fF)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S
:-pQ_@rH4'C/\tfCLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0emQaFttirF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0f<]gCbd^fEb0,sD.R6#Ao_g,
+=L`<D/a5V@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^sde67sB'+<VdL+<Ve8DIal-ATo7F
F)>i2ALq;!F(o,8Cgh?sALqnEEb0<5/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O.`:-pQU0fX#YGqq/u
F`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FF
Df'&.F*(i.A79Lh+EqaEA9/l8D]iP.D/aN,F)qct9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo
4ZX]A+?CW!%13OO@W-0-4Y@jtARTCkH#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8
+?_>"0F\A-An?3u@qB_&Bm+'/FCB&t@<,n"+?_>"@W-/o$4R>aBOQ!kEb/[#A79=`B5)6r@<6=)
F*(i.A79Lh@<>poC`kkn+C]8-+=\LZ%13OO-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN'
;H6IZ84>oh6r-lZ-QkQ)+C]8-%13OO-V$j+6:":D+@TC"9N=JL6mk,Y+C]8-%14Nn$4R>REZfI@
E,9H&+E2IF+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+LC+$?BW!>9G;6@j#l<F=044+Cf>,
E,$LC9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo-OgD;+Bot0D/XQ=E-67FFEhm:$4R>`BQ%p5
4ZX]A+?CW!%15is/g,%?D.Rc2@;Kb#ART+p+E)./+Cf(nEZcqVDJsV>@q]:gB4YT_$=Q(MGmt++
4YC.c.NgJU$@4if@3@$BGp"RZGmt*0%13OOATAo8D/a<0@j#`5F<DrPBQ%p5-OgE'@j"tu-ZW]>
FEhmT4Z[(kD/a54-Z`s>Ec`Z<$8EZ-+EMC<F`_SFF<G[MF:AQd$4R>\@VTIaFE1r)F$2Q,1E\_$
0F\A'@;T@YDdmHm@rsjd+F,))67sBkD]iq9F<G(3D/aN,F)rIB@VTIaFE7luCi=B:?XIMb?XI_\
C1Ums?XI;]DJ"$4Bl@lP/g)nY$4R>QBl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?
De!3lATJ:f.1HUn$>"6#FDYu5Ddso/F`\`RDdmHm@rua&Aof=/$?BW!>9G;6@j#l<F=044@rH4'
C*4mB@VTIaFE1r)F!hD(0d'[CF)>i<FDuAE+EVjM%13OOB5DKq@;KsqAog*r1E\_$0F\A%Ci<ck
Ci^^K+CT;%+=\LODfd*O+Cf>,E,oN2F(Jl).Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-YI76@UX(n
AS-!2%17,c+Bos9Eap56G]Y;r3ZqpND/a54-YI76@UX(nAS-!2%14g4>9J!(Dfp/@F`\aJG]XB%
%13OOA7]7e@<,piF(9--ATL!q+>b3%+>=63%15is/g+\9@r,RoARlp)@rH<tF!+n3AKZ)5F^o*1
+DtV)ATJu&DIakuEb,[e:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Et&Hc
$?(*!EcPl)AN`(eCi<ckCi_a#+F#"O:-pQ].OdM5+E)F7EcPl)AKYW%Ddm-kEt&Hc$=[pl4YCDd
D`o^pDf7ck+>Fu]+<VdL:-pQU-n6Z/3ZqmMD]i_3D]j.?D[d$_$>+3s?Z':hATKIHGp$X9/e&.1
+<Ve9Df6aJ+DtV)ATM3mDId='+<XEG/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdkARl5W
+<VdL-[0,EB4Z0-@rc^0@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.Rbt$>"*c
/e&-s$>=?r+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=C]2@r,RoARojlDfB9/-OgE'@j"tu-ZW]>
FEhmT4ZX]qDf'H.+=C]2@r,RoARojlDfB9/-OgD;+Bot0D/XQ=E-67FFEhm:$4R>ZBm=3"F(9--
ATL!q+>Y-$+>=63%15is/g+tK@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k%15is/g,@O
ASrW!DL!@ABm=3"+EM%2E+O)5@<,p%A7]jo@ru9m+E).6Gmt*U67sC)BPDR"+EML1@q?csF!,L7
D/XT/A0<HH-td@7@WNt@Eb03.Ecc@3$;No?+CT.u+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/%13OO
Ci<flCcsBnGmt*sDe!3l4ZX]@+=\LMDe!3l%14Nn$4R>REZfI@E,9H&+E2IF+=D#?G\(E,@rH<t
F!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m@Bm=3"F(9--ATK4.$8EZ-+EMC<F`_SFF<G[MF:AQd
$=e!lAp&0+A927!E+O)R3Zp4$3Zp*c$4R>;67sBpAfu2/ATD?)@<,p%@;^?5DIIBn+Cf4rF)u&-
Bk(RnBl@l3Ble?<ATJ:f:-pQUCh[Zr+Cf>-Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].
+ED%1Dg#]&/e&._67sC&BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt-
$;No?+Eh=:@N]2mFCes(F!+n/A0>o(E,Tc=F!+t2DJ"$4ARlooARfObEaa'(Df0VK%13OO:-pQU
@W-0-BlbD-ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k+>"^KD]iY+B6A6+%13OO@W-0JGp"4P+<VdL
+<XEG/g)Pl.6T:+@W-/o$>=?r4YC2^D]gMPGp"5)67sB/.OdMA+C]8-%14Nn$4R>REZfI@E,9H&
+E2IF+=CZ;DJ"$4ARojlDfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=CZ;DJ"$4ARojlDfB9/
-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$
ATVL)FC])qFD5Z2@<-'nF!,QV/KePDART[lF!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/
:-pQB$;No?+B!?"+=Lc3F*)G@H$!V=FC])qFD5Z2@<-'nF"&5RATMr9E,oZ2EZfIB+EDUBDJ=!$
/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AN
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l'D..]E1E^OQA8,XiARlp*D]j(CDBO.;FD)e7ATo7FBkhQs.3N>BFCfK)
@:NjkCi<flCh4%_:-pQU0emQaFttcp-us0FDf9_H+CSekARlo8+CSeqF`VY9A0>u4+EDUB+E)-?
@W-@%+EqO;A8cZ7-6R,=DKU15$;No?+>GfiF`&rg+EV19F<G+.@ruF'DIIR"ATJu'Ea`irARlo8
+Dl%;AKYDlA7]9\$;No?+>Gim@<jU_+DG_7F`M%9IS*C(<(0_b+Co2,ARfh#Ed8d=G\M5@Et&IO
67sB83,N)L1GBq[A7Qf2FDti:.3N_DF*&O8Bk)7!Df0!(Gp%!5D.Oi/Eb/isGRXuh$=e!aF`MM6
DKI!K@UX=h-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V
@<?0*-[nZ`6rZTR<$r+^%15is/g,7IF*(u6+E_d?Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_
Eb065Bl[c--YdR1FCfN8ATB.-$4R>;67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_
@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eY
Eaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[W1
%13OO:-pQU:2b5c3ZrNXAKZFo:IJ/N;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/
AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YD
CERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN8
0ddD;%14g4>9IckCLq$jEaN6iDe*2t4A&C;<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4
+Dbb0Fa,QV@:K`R8l%iS78m/`:JXqQ3ZrNcCghBu11+I)De*2t8l%iS78m/`:JXq!$4R>;67sBj
Eb/[$AKYQ$E--@JFCfN8+Co1rFD5Z2@<-'nF!*%WF(KH8Bl7Q+6r-0M9gqfV6qKaF%15is/g,7S
+>=pWEb0<'Ecu#8+EV:.+EV=7AKZ&9@;Ts+@WGmpA1e;uA8XOkFDti:/13,*-OgDoEZf72G@Vh,
DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj
:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&
E+X>G-SR8&%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&
-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL
:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0JY!b$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r1FEV=ATAo2ATqZ-A8XJ$
:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@
A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:
/13,.-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o
-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM
8OHH)4"qcd$4R>QDEU%&E+X>G-SRD*%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\
F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#
+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0K(9f$>"6#DIn$&+Co@O8l%iS
78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@
>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r
2^]%AATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl
/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF
-Ta")%13OOA8XOkFDti:/13,2-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`S
FE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+
A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SRP.%16Ze+Dtb7A0>E#4%`::<(0_b
;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,
A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0easa
$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m
/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]
+:SYe$=n$;3co=QGUt3s0ddD;ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13/--OgDoEZf72G@Vh,DECHd6rZTR<)QLf
<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$
D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[D)%16Ze
+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc
6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3
%16W`4Z[\(Ap>jS0f16e$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3s2(&h?ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lU
D@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`
ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO:-pQUDfTB"EZf:4+DkP"DJ=38
A7ZloBk)7!Df0!(Bk;>p$=n$;3co=QGUt3s0JFj`$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`
ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#
1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$;No?+EVgG+E):2ATDi7De:,/@:sIl
FEM,*+Co1rFD5Z2@<-'nEt&IeDEU%&E+X>G-S[;/0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lU
D@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`
ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<4&A7]RD@<6-m0JG4V67s`uASa\AF(o,<0JO\l/M/)S@<6-m+Eh10Bk/>7A7]R++EV19
FE9&D$;No?+:SZQ67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!
Df0!(Gp"MWATMs.De(ON/e&._67r]S:-pQU8l%ht@ps1iF!,RC+EM+9F`8IFATMr9ASu[*Ec5i4
ASuT4/KeJCF*2>2F!+(N6rQl];F<kq%15is/g+S5A8c?.Bl8!6@;KakA0>;uA0=K?6m-#OG%GK.
E,B0(F<G+.@ruF'DIIR"ATJtBC2[WnATf_ADe(MDFD5Q4.1HVZ67r]S:-pQU+<YT5+?MV3C2[Wn
ATf22De'u5FD5Q4-QlV91E^UH+=ANG$;No?+<VeDCi^^HC2[X)ATMs)E[M;':-pQU+<YK=@:UK.
C2[X)ATMs)E[MtP%15is/g)8Z0d(LYF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!i(Q:-pQU@rc-h
FCcS:ATMr9A8,OqBl@ltEbT*+%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(C9F(K;E0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72f<PW0JO\[Df0`0Ecbl'+EVNEC,R[u1*A.k
Eb0,sD.R5e$;No?+>GTf@<jR`+E_X6@<?'k+D,P4+A+RG9PJBeGT_0@EcYr5DBNk0+A,Et%15is
/g)l'D..]F0H_cYDe*s$F*(u6.3NYBEHPu9ALD!t$;No?+>GTgDg!ll+Cf(nDJ*Nk+EVNEF`V+:
FCf<.DfT9,Gp$pA@ps1b%15is/g)l.D..]F1a$p[@<?'k+D,P4+A*b9/hf3n$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G0
3Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3
A0>u)Bk)5o$4R>;67sBpDKBB0F<G!7GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO3Zp4$3Zp*c
$=Q(M+>P&i+F+D'@3@$B13a68.1HUn$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l
+D!/J>:D!1$4R>REZfI@E,9H&+E2IF+=Cl3D0Ko=A1&KB+AP6U+DG_8D]iS)@ruF'DIIR2%16Ze
+CoA++=Cl3D0Ko=A1&KB+AP6U+DGm>BlkJ3DBO%7AKYMt@ruF'DIIR2%13OOATAo(AS`J:Bjkk&
DfTA9+<Ve%67sBkASbq"AKZ28Eb#UdDImi2FDYu5Ddso&ATT%BBjkk&DfTA9+<XEG/g,@VEb$;,
F!,")Ch7^"A0>AjDJjB7+D58-%13OO:-pQUBl8!'Ec`EY0JFVnDfTB0+DG_8D]iS)@ruF'DIIR2
+CT.u+Co&"ATVK+FD,6&%14M-DfTB6E,TZ94ZX]J+u(2fGAhM4H#R\?-Qjra0d%TTC3=T>+<iih
/1r&Z/g)l&0I\,-3Zp.20H_S_4<QL)3]/$B-Y["+GAhM4-OgDoEZfI@E,9H&+E2IF+EqaEA9i-4
DfZ?pATAo(AS`K5DfTB6E,TZ9%13OO:-pQUGA1l0+Du+>+C\n)@:F%a+EVNEB4Z0-@;^?5A7]Rg
FCeu*GAhM4Et&IoATAo8D/a<0@j#DqF<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+$4R>;67sBk
ASbq"AKYDtC`mb0An?!oDI[7!+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSnA7]R"GAhM4
H#R\?Et&IoATAo9FZhc.F`V,8+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*ATD@"@qB]j
$8EZ-+>=pNCi<d(-9`PrDfTB6E,TZ9%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!
DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s\sgF(o,E3B:FU$=m^hFE2;FFCfN8A8,OqBl@ltEbT*+:-pQ_A7]h(Ec65FATMs(
Bk)7!Df0!(Bk;?.F=f'eA7]h(Ec65E+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+SD
F*2>2F#kElC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttcp-us0F
Df9_H+CSekARlo8+Du+A+EDUBF!,C=+BN8pA8c[5+CT.u+A?KeFa+?&:-pQU0fNiiDDEmg@UX=l
@j#9"DJ!Tq+EV19F<G"&A7]9\$;No?+>Gim@<jX_+=M>NAp>aIFCfN8+Co1rFD5Z2@<-W9E,oN%
Bm:b/A7T7^%13OO@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1
/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+EV19F<G^JBl%i5Ci<`m+DG_8
D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5
@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[W1%13OO:-pQUF`)52B5)F/ATAo%
DL!@HATMs.De'u$Bk)7!Df0!(Bk;>p$9ieh+@Jdg<)Yq@+>b3ZA0<6I%14g4>9H=*6W?uI3Zp."
E+rft+@Jdg<)X550d'[CF(fK9E+*g/+@Jdg<)Yq@+=MRh+u(3.8OHHU.3Kja+=f&t+u(2g/37ll
Ap>aI74o]HHS-Ks+@Jdg<)X550d'[C1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@Gp$O3C`m51
EcP`/F<G=:A9;C(F<G+.@ruF'DIIR"ATJ:f:-pQU:2b5c3ZrNXAKZG:De*s$F*&OFDf9_?D09oA
+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^
%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r
0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;%14g4>9Is'Ec5l<+A,Et<(0_b;GU(f%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%16W[A5d>`CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<
CLnW1ATMrG%15is/e&._67sBhF)uJ@ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV
+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z+<VdTFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8
A2,bh+EV19FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!
:-pQU0emQaFtks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.Z
Deio<0I\,VEc5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_
:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2
@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b
+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(
Anba`FD5Z2+Eh=:@N[(0Bk/Y8BkM=%Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De'u4A8,Oq%16Ze
+Co1s+>=63%15is/g,%SD.7's+E(j7A8,OqBl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn$8EYd
+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3FCfN8C2[W:0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!
+?^hl+FPjbA8,Qs0F\?u$>"6#FZhc.0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"
F!,.-@:Wqi%13OOATAnL+E(d54$%IoBk)69-QmMBF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F
+?^hl+>G!XBk(p$FU\Ze$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y!klE)UUlCLpL`Bk)'lAM>f5
67s`uBle5lD/X3$<GlM\De*E50HbHh/KcHPBle5B+Co2-E,8s.+E(j7F`(o'De*E3%15is/e&._
67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.
De(OU.3N&B@;0Od@VfTb$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)2eHW10Js:H:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0K3NR@kf_]/KcH`ATMs4@<6K=+ED%4CgggbF!)lPD/XQ=E-67O%15is/g)l'D..]F0H_qi
.!''?GApu3F"&5PAT2Ho@qB^(.!0$AFDtZ0F"%P*:-pQU0fX#YGr%/t/Kf1TA79RkA0>K&EZdss
3%cmD%13OO%15is/h0:f;GU1R4s27aBle5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!
A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$=e!aF`MM6DKI!K@UX=h-OgE'
AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2
AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:
0II;:%175g4ZX^.3ZoelBPDN1BlbD>DJ<U!A7[+t$6UH6%14J*DJ<U!A7[,2/NP"b@<>q"H#R=;
F^uU;:-pQUA79RgFEqh:+DG^9F*(i.A79Lh+A*bqEc5Q(Ch4%_%14g4>9G^EDe't<-OgCl$>"6#
De'u4A8,Oq+<XEG/g*b^6m-S_F*&O8Bk)7!Df0!(Gp!P'%16Ze+EVI>Ci<f+E-67F-ZrrI+<XEG
/g,4WDfTD3Bl5&8ATMr9A8,OqBl@ltEd8*$%16Ze@<6!&-ZrrI+<VdL+<VdL+<V+#%16Ze+EVI>
Ci<f+B4Z0--ZrrI%13OO-Zs<@@rGmh-Qk!%+Cno&@<?d6AKZ,++<XEG/g,"RF*&OA@<?!m%13OO
.!7Qn-Zj$9F!,1<+E_R9@rGmh-Rg/i3ZrQU+AP6U+Dl7BF<GF/FCStn$4R>;67sB/F(fK9E+*g/
.3N/4Anc-oA0>T(+=LuCA9;C(FCfJA+:SZ4+Bot0BQ&*6@<6K4A8-+(+=D;B-QjNS+AP6U+Dl7B
F<G+.F)Yr(Gp%<FFD,T8F<G.8Ec5t-$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?O[>O$;No?
.Rm!34['uuDfTl0@ru9m+DG^9CghEsEZfO:EcYr5DK?q=Afs\g%13OOA8Z3^D/X3$0JH6g/h1CL
Cf>1hCLo1R+ET1e+=Lc<CagKJD/X3$+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0
@;KXg+<Y*5B6A'&DKI!D@psFiF!)TDAfr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1
Eb/a&+s:T;G%#3$A0>AjF(KD8@<,p%@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?
%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1,'.E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq/uF`:l"FCeu*
FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1
+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ-
-Zip@FD>`)0JFj`$4R>REZf:2+EV..@rr.e%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQ
FCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>
F$2-<+tt-R/g*##,<R>$%13OO:-pQUDf0B:+E2IF+Co1rFD5Z2@<-W9BlbD8DBO%7AKYr#FD)*j
1*A_&,@kM!+>=63%15is/g+\=@ruF'DIIR2+DGm>ASlC.Gmt*7+?^hl4s2R&HQY!bA8Z3+-RT?1
0H`M$,<d5)+F>4c+CoA++=ANG$8<Sc+<s&m0d(fc1*C+FC`k)Q%14d34Wkt5+>G!c+>Y-NDJUFC
-OgD:+?^hl4s2R&HQY-fA8Z3+-RT?1%15is/g+kGF(KB6+EMI<AKZ/-Eaj)!$?g;qD.RcO3ZoeZ
GB.4J+C]P8A2,39GB.4L+C]P8A2>SB$=\4"A2$/-+?^/@@Wuj'0g.Q?/I`%rGB.4L4ZX]A+?CVm
GT\IYGpa%.@Wuj'1HdcA0f'q5+=DCV/Kcek.Nj!a%159QHZX+DCi<f+E-67F4$%P&@;TRs%13OO
:-pQUBl8!'Ec`FFDf'&.DJsZ8Et&IoDIIBnF$2Q,-Z4-KA2#-DGB.4K+DuCDA259FGB.4M+DuCD
A2GYC$7ItsDJim"ATK:`3ZoguF_>N9+Cf>6@W-O5-Rh,*BeCM`+>YH.-o!D?0eb%<-oa40,p5E0
+>P3$2^pgNFZLmmDJ<U!A7Zm#AKYH&D^Pu$4tq>*D/a<0@j#`5F<EY+DJim"ATJ:f%13OO-tI43
+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnEt&I)0HanDC`k)Q.3L3'+>G!#+=K<4G&C`*
ATK:C/0I#8DJim"ATJ:f%14L;+>G!LDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2
+AP6U+D#D/FEo!QDfTA2E,oN%Bm:'o-nlc!+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%
DIIBnF!)T#67sBlD/aTB+EqaEA0>T(AncK!$7ISN1E^4GC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C
/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;6F_56"GRXuh$7ISN0d("EC`k*7GB,&[+>#Vs0d&P#
4$%P&@;TRs+<VdL+<VdL:-pQUGAhM4+E2@4AncK!$7ISN1*C+FC`k)^-Rg/i3Zp."4!6UG-Z4-K
A2GYV+<VdL+<VdL:-pQUGAhM4+DG_*Bm:'o-nlc"+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,3E
GB.4K-QjO,67sC)DfTA2F*2),Bm:'o%16uaEZd%Y0HanDC`k)Q+AP6U+E;O4Ch[KqATAo)EcQ)=
Et&IoATAnI+>b3ODJUFC-OgE#ATAnI+>=ol+CoA++=ANG$4R=j0H`(m0HanDC`k)Q.3L3'+>G!#
+?MW%DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DPDfor=.1HV40H`(m0HanDC`k*C
GB.4N-Rg/i3Zp."4!6UG-Z4-KA2GYV:-pQUGAhM4+E2@4AncK4-uNsGDK@69$7ISN1*A7nA8Z3+
-ZW`R-Rg/i3Zp."4!6UG-Z4-KA2>SU+<XEG/g,@VEb$;,DJ!U-+=M,GF`)7L%14L;+>Y,o+CoA+
+=C\S-Rg/i3Zp."4!6UG-Z4-KA2,GS+<Ve%67sC)DfTA2F*2),Bm:aKDJsZ8F"%P*%16uaEZd%Y
1a"IpA8Z3+-ZW`F+<XEG/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1p1E^4GC`k*GA1&KB%16ua
EZd%Y0H`.oA8Z3+-Z3iM%16uaEZd%Y0H`(mA8Z3+-[0TLDJ(=+$>sEq+>=ol+>P'MDJUFC@:s"_
DC5l#+:SZ+0H`(m1E^4GC`k)Q.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3
Eb/isGT\DXATD7$.1HV40H`(m1E^4GC`k*7GB.4M-Rg/i3Zp."4!6UG-Xq:?A2>SU:-pQUGAhM4
+E2@4AncK4.!B0B@WNt-$7ISN1*A@qA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Xq:?A2>SU+<XEG/g,@V
Eb$;,DJ!U-+=MDEEaj)=%14L;+>Y,r+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,GS+<Ve%67sC)
DfTA2F*2),Bm:aKG%G]'F"%P*%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<7Cf>1hCLp4K@rcKe
AU&<<:-pQ_A8Z3^D/X3$9jqOPDcC:mFE8QIF=f'e+Cf(r@r$-.+EV:*F<G".C`mS'@rcK1FCf]=
F!+t$DBL'2AI;1!/g,4DG%G2,@;]TuF(Jp#+C]U=-tI43.4ts&67rU?67sBhF)uJ@ATKm>:-pQ?
:-pQU+<WBf+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(OU.1/g:/g)8Z1+==oC2[X)
ATMs)E[`,SATD7$+CTG%Bl%3eCh3rK67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YE
ART[lA3(hg0JG2%AT0=X$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGOb
67sB80lCoQ1,C%qE+EC!ARloqDfQsm2_Rj=DKU12:-pQU0fX#YGr%/tF`:l"FCeu*AoD]48g$)G
0K0=G@rGk"EcP`/F<Dr?@<6!-$48I04Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&$8EYT3ZoV!
-V@0&6VKp7;GTqmBkhQs?RH1jCh7$q+=AND$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:ldF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=5uL[1/IDi,E+X>X/g)N`ATMs.De(4&$>"6#
De'u4E+X>G-SR5%$49Np/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN
@:O=rEsaWE>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`
$;No?+EMXCEb-A:@<-(#F`S[B@:O=r+EV1>F<G[NE+O)C+<XEtFCcRe:IH=9De3ts:-pQU<^BDN
6pXd@+AG-h;GSE779EMf/g)9.<$5+29i+Md+B)68;FOM,<(KG#<(0ng$;No?+@/pK6<R8V;]o.5
<(J,t:*;i$;bobP5u^9@+B2K?73Frn6q&4f:Jr<(5uUo/;FOP_8OZZG9J-ZI67sBPF<G:=+E_WG
FDi:DBOr;Y:IH=JF(KAF@ps1iATAo8D]j43Ch[EgFCcS:AU&;L$;No?+@0g[+EV1>F<G[NE+O)5
@<,p%ATMp(DKKT$Ci"A>AT;j,G%#2uDKI"CD]iM7FCfMG$4:?b+>b3[F`\a70Kh$9C3*m*BlJ/A
4#/NP-S@#(+DN$?@rc:&F<G[:G]Y&\/hSLYATAnM+E2IF+CQuf/gkIDFCf\E4#/QQ-S@#(+DbJ.
AU#>>AU&;>/hSb($>"6#1a$a[F<G!I4YA*qFDYhA4#/TR-S@#(+D>k6C`mh2G]Y&\/hSLYATAnM
+E2IF+CR&h/gkm\CaV;"1cm';/hS8kD/:>:AU&;>/hSb($>"6#1a$a[F<G!K4YA+(AU&;E4#/ZT
-S@#(+E2.*Bl5&3Ch+Z1AU&;>/hSb($>"6#1a$a[F<G!L4YA*kH$!UF4#/]U-S@#(+CT;"BlnB(
Ed8dDBleA=De:,$H$!V=+>,9!-OOF*+>b3[F`\a72E`Z?D..I#A8c[0-Ta(B4!u.'/hS8`@<--o
Dg-(AFCf]=+>,9!-OOF*+>b3[F`\a72a&c9-ZsNC3%$dC3'/K1/hSb!F`_4T+C]V<ATJtH/hSLY
$7IVj-Yd^4EbTK7-Rg/i3Zp7%0d&5++CoA++=CoF@rc:&F=.DD0fpb!@<?(*-Rg/i3Zp7%0d&5,
+CoA++=Cu6FCf\E$7IVj-YRU=CaUYS/NP"2+>Fuo1E^4GC`k*=FDYhA$7IVj-[9KE-Rg/i3Zp7%
0d&5.+CoA++=DDNCaTQ<0fpb)AU&;E.3L3'+>b2q+>PesA8Z3+-ZipEF=.DD0fpalH$!UF.3L3'
+>b2q+>PhtA8Z3+-Xq@CAL@g50fpb"@<--oDg-(H.3L3'+>b2q+>PkuA8Z3+-Z*:4CLh@-DC5c>
0fpb*FCmK[.3L3'+>b2q+>Po!A8Z3+-ZsNC3%#%?0d'\2@<=Xb+CQrT@50<A1+Zii/7C@d@5TTE
2Cpmt2[Tme67sBkD]j.5G]\!LD..NrBKli7@<<VD3ZpV53Zp7%B4Z0-HS-Ks+Cno&$4:?b+>Y-Y
A0<6I$=dm`@<*J<-OL2U67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$=n*sATU7IF(o,<
0ht%f.V*L>ATU7IF(o,<0d(Qi/KeM2F(o,,-tI:<ATT@DE+*cqD.Rg#EZfF7F>%-;@;]^h+EV19
FE9&A:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU
.3N2HBleB;/db??/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f!Wb
Ftt`Y:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.<)67sB83,N)L1,0nL:JXqZ:J=/F;BU'mF*)IG@:Wn[A-rZRDe!p1Eb0-1+=CW,
F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$;No?+EqaECER>/+Cf5!@<*K"@<6!&DfQtBEaa$&+Dbt+
@;KK^@r,^bEZc_W$4:9]@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9
@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9
A1'Gd8l%i&$;No?+>%q>78m/.;cH%\<.->*$?Tfm@rsjp+=D8BF*)/8A2#\b$4:?b+>P'XA0>u)
Bk)6-+<VdL+<VdL+AP6U+E)41DBMhG5t"LD9N_^?ATAo(E-#T4+=BHR6V0j/2((I?+<XEG/g+Y4
DJjB7+Cf(nDJ*N'E+*cqD.Rg#EXE.K67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(..*EZf:2+EV..
@rrht+>Y-YA0<6I$>"6#A8lU$F<Dr/76s=C;FshV-OOF*+CoG4ATT%B5uU-B8N8RT4#%(REZen3
F(KG9-W3B45tOg;7n"de0a\7_67sBt@;BEsEb/Zi+E).6Gp"[]@q]:gB4W30Bl%T.AmoCi$>"6#
A8lU$F<Dr/76s=;:/"e<$>sEq+CoG4ATT%B5uU-B8N8RT4#%'L:-pQUEb00.ASrVB+Co1rFD5Z2
@<-W9BlbCp76s=;:/"dtATAo3A0>u)Bk)6->9G^EDe't<-OOa&EZen3F(KG9-UCZu8P(m!-Ta!h
$;No?+DG_7F`M%9FCfN8+D5_5F`8I7G\M5@EscK!+CoG4ATT%B;FNl>=&MUh74/Es+BosD+Co&"
+=D8BF*)&8Dfp"H$;No?+E_a>DJ()9DfTB0+DG^9Ci<`mARlouDe'u#CghC+$>"6#-Xgb.A7TUf
-QmANF<GI;?X[\fA7TUf?Q^^D$>"6#B6%r6-Zip@FD#W4F`8]iDJWZgC2[WnDdm&r-RT6.:-pQU
Eb0&qFD5o0+EDC=FE8R6AS5^p+EqOABHS[O-OOF*+CoG4ATT%B;GU(f7Sc]G78bKp-UL*e;GU(f
-OL2U67sBhFED)2E-*4ED]in*CLnW$Ec6)>+EqO9C`m=uBl"o$ARf.kF(HJ4AftPkA0>o2Dfc>(
ATAo1Ci^^HFCfN8B6%p5E$ku":-pQUEb0<'F<G[D+Eh10Bk/?,Df9_?@;]TuEb0)rCLnV?+DG_7
F`M%9FCB3&ATT&,DerrqEZeq<BleB;$8EZ-+DkP&ARoLq?X[\fA7$HAC2dU'BHS[O8l%iS78m/=
FCfN8A8lU$F=.E,EZen3F(KG9-W3`9<(9YW6q(!$4"#JL:IJ/N;cGDlATMs(E-#T4-OOF*+Dkq9
+=D8BF*)&8Dfp"H$47,867sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4
-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh
/Kf+ODeio,+EV19FE8RCAfrL5A18WLDIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."
DJ(R2$;No?%15is/g)QRA18XCATMs7+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#
+DkP)Gp%$IBOu3,8l%ha$;No?+EV19FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3
DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)
AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*2/78M1-#dN:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u4
3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>R
EZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaGDfTB0+E(j7G%#E*
Dfp+DFEqh:Et&IcDf9H$Dg=K,+>=63Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p,To$)%15[?@<Q3L
BOPpi@ru:&4ZX]5BQ&);D09?%+EqaBA0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-@r!G$$=n't@VfUp
CisfADJ*m+A3Dsr.lne<+=fJ^$=RdjATD="F?MZ--8#`7GA^i+ATL!q+?MV3@W-1$@W-N7Ao)Bo
FDYS38SDOUAOC->Ea`I"ATAo(DfoN*AT2I.F*2A5Df9//@;TspEb'*1-OgDH0RInYE,9H&+E2IF
+Eq^3D.Rbt$9g.jF>,j=+>=om0Hb">F<GdF@;TRs%13OO:-pQUARoLs+EqaEA0<:<@;TR,@r,Rp
F"DEEG]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl4"u#*DIIBnF!+[0
ARloF0me!r%13OO:-pQUBl8!'Ec`FGATMs7+CT.u+CT.u+DkOsEc6".$9g.j0d(FXF<DrQATMs%
CiF&r0JFk9-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JOq:-Vcu\+DG_2
De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JY";-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j
1a$a[F<DrJ@:O=r@;Kmr@5'A_4#/NP-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'D`4#/NP
-SZ_o+>G5Q$4R>+0RImr4ZX]?+D58-+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8@;Kmr@5'&<$4R>;
67sBlA8--.FCfN8-uNI1ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd+[
/KcDl4"u#'DIIBnF!+[0ARloF0me!s%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs4ZX^6/g)tnA8Z3+
-Z*:%Ec5B&E+iZ6-OgCl$;No?+D#(tF<GF/@rcK1-uNI1ALq>0A7[<6AU&;G+EV%$Ch4%_0d'[C
F(fK9E+*g/+=CZ4ARfKuARoLsDfQsV+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(1(=R"$4R>REZd.\
De'u4A8,Oq%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B5DKqF$a;VBk&hN0ht%f.VER9@WOkE
F(o,<0JO\l/M/(f@UX=l@j!14Ci<d(.3N_DF*)IU%15is/e&._67sB[ATMs7+CQC)@;0P#Eb-A-
DBO+2Ch[E&DIIBn+D#e>Ea`I"Bl@l3A8-*pDg#]4ARlp-BOu&j$;No?+Dbt)A8,po+EMI<AKYo'
+@:!U+@9X[DIm<nGpdYU8g%V^A7ZltDKKe>8hM5/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,C%qE+EC!ARloqDfQsm2_Rj=DKU15$;No?+>Gim@<jUa
+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>P
De!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tD
@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R=O$;No?+CfG'@<?''@3B`)Eag/8Bln#2DJpY1Ci<ckC`mn0EbSrkCh4`0AS,LoASu!hF"Rn/
:-pQU@;Ka&FD,5.@<6L(B5V9k+DtV)ATJu&Eb-A:@<-(#F`SZt+Cf>-F*(i.FE8Q6$;No?+Du+8
AKZ&-Dfol,+CT5.ARTU%@<3Q/@;TRs+EqL1DBL??Ci<d(.3N>G+CT5.Ch[Hk/e&/0ATMs'Df0W<
@;^1.4ZX]A+?CW!%16N,/g+LUC,$/)@Qc=d?T33g%16T./g)o*E]":5A3DOf?SQ+N%16]1/g+LU
@PKeN$=u@Q+>P`t%16]1/g)ui3"63D%13OO:-pQUF(fK7Ch+YtAKYQ$E--@JB5DKq@;I'&BleA=
/Kf(FAn?!*FDi:>@;TQuBl5&8ASlB/Ci<flCh4%_0KgXEHTE9^Ci<d(+=D8BF*(o1DKBo.DKKr,
-S0@VE,9H&/14dP%13OOATD4#AKW@BATMs'Df0W<@;^1.-OgCl$;No?+>%q>78m/.;cQ1P78m,S
<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l
@lZP0?O[?TCi<d(;f-GgAO1BYBkM<;0JH6g/h1LMDdmcdD/X3$6$%*]B5TCW0H_J\F=f'e+<YB9
A8-'q@rrh9@<6L(B5VQtDKI!DDe:+7+D5M/@UX'^$;No?+E_RAF`2A5A0>buD.Oi+BleA=DJsZ8
F"Rn/:-pQB$;No?+@U<kDfQt2Bldd&G%G]*A0>E*EbTE(+E_a:+E(j78l%htDf-[O3?V+-F<E=m
0f:(.1-.9L3]&Q#$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JPG'@rsCb%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l-D..]E1*C1CDII?tGp$^5GT_*ABlbD7F_Po*DI[5e$;No?
+>Gfl@<jRb+CSek+E)F7EcPl)AKZ)'B-8U/3[m3Q%15is/g)l.D..]F1E^1@@;]^h+E)F7EcPl)
AKZ)'B-;;7+=K?5.6T^7/Kf+GAKYl/F`&<r8Q\DL:KBn^%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$
3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6mk&N%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUDJpY7Bm=3"+CT>4
BkM=#ASuU2%16rdG\(DWDIdI%ARfgJF)u&.DGP%%4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)
+>=63Ap&!$CO&&q+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf>n%-L4Y@j:%16Q-3Zp==
2BWG9.1HUn$;No?+Du*?D/"6+A0><%F(o9)D.RU,F!+n/A0>o(A9Dd#@;^00E+*cuDKKQ'F(KD%
$>jL%ARnAMA8-'q@rt"XF(o9):MV[J3]%s?+>=63-n%f$FD,T'6#pU\D.RU,F"&P$/g)hW$>+Eu
@r$?Q/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`-n$Jl@WcL'.4H\p4ZX]5@rHR#
Dg<]>$7QDk%15is/g,"FG\(D.@<6L(B5VQtDKKqB-t[U>@jrO7F!,UHARlomDffY8Ci<flCi"A>
@;]TuB5DKq@;Kb*%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfRNp3]%s?+>=63Ap&!$4Y@j)H>dqJ
?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15is/g,7LATD?)@<,p%D/"6+A0><%F(o9)
D.RU,F!+q'@psM$AKWC5F`(\<+DtV)AISuA67sBpF!+q1FD)e5De!3lCj@.3DIal&Ci<ckCi"A>
@<6L(B5V9k+EV:2F!,1<+E)$)$;No?+DG^98g%ScF<GX@DfBZ@+DtV)AKZ,:AKYE&+D,&&+CT=6
8l%htBlbD,Df0&rEc,H!%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfRQq3]%s?+>=63-r"8pBQ%EI
EbBN3ASuU2.6T:+0F\A$F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn
$;YhVEcPl)AP$cMBl[cpF?sthBkM<<4ZYDB3Zp*c$;No?+E)F7EcPl)AKYi(G\(D.@<6L(B5VQt
DKKqB-p0O>4ZX#Z-r"8pBQ%EIEbBN3ASuU2.6T:+0F\A$F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>
@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+D5M/@WNZ.Df9E4+D,P4+EqaEA0?&(Cis<1+DG^9@UX=h
+Dbt+@;KKt%15is/g+VK+Co%q@<HC.+Dbt7CER>/+EV19F<GC<@ps1b+D,P4+EV:2F!,R9F*%iu
%15is/g,1GFEMVAF!+t2EcP`$F<GU8F*2;@%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<Z
CG9*]5s]R/DeioE3B:Fo%16Ze+>GSnB5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0OI+36$$m]
CLoLd3F=-C$>"6#B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0jd446$$m]CLoLd3F=-C$>"6#
0eje`Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DGP%&?U6tDF)>i2AN;b2?RH9i%15is/g+\9FCes(
+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"=@;TQuF`V+'$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cp
F?sthBkM<PEcQ)=0OI+36$$m]CLoLd3F=-C$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=0jd446$$m]CLoLd3F=-C$4R>;67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,Et&IfEZf"2
Ddmc1-VnnsEcPl)AP$cMBl[cpF?sthBkM<<?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Vnns
EcPl)AP$cMBl[cpF?sthBkM<<?U6tDF)>i2AN;b2?RH9i%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd
3F?E8DdmcdD/X3$6uQQh0MXqe.VER9@WPIbDeioPDdtIT+ET1e+=Ll=Ddmc:+CoD#F_t]-F<G19
@:sFgDKI"CATMrG+:SZQ67r]S:-pQU<+U,mARlp#@<?($Bjkg#De!:"EcW@;DBN\4A1hh3AhG2t
DKBr@AKY]/+EqaECND*;$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JPP(@<jUb%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV
-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%16rdG\(DoF)u&.DJ`s&F?MZ-1E\_$0F\@a67sBP+D>2,
AKYD(D/"6+A0>N$Ddm-k+CT.u+Dbt+@;I&pF)u&.DJ`s&F=n\9F*1o-Cj@QSFD,B0+DGm+$;No?
+E27;EZf7.D.Oi"BQ%TpAKYH)F<G[=ATD?)@<,p%B5_^!+ED%%F)Pr;+D,P4+EM[8BHU`)F(o9)
D.RU,F"Rn/DIIBnF$2,u4$"a5AKYE%AKYW(Bl7Q+FDi:2AKYW%Ddm-kF!hD(-uNI1ATK:`3ZpO4
@r,RkA7]h(Bl7K)B5DKq@;I;#$7QDk%16T`DJ"$4Bl7QH3Zp4$3Zp*c$;No?+CT)&Dg*=@Bm=3"
+CT>4BkM=#ASuU2+=K?5.6T^$$?K]qE+NisF)sJs+?V#]BldX&@rH=#DJ*<jF'j!,?Zg6nGAh8.
-OgD2F(9--ASbq!F"'75+EM%2E+NisF)qct.1HUn$;No?+Dkh;ARlolF)u&.DJ`s&F<G[GBkM'i
EcW@7EcQ)=%16uaEZf"2Ddmc1-Z*RBARo4jF(o9)D.RU,?U6tDF)>i2AN;b2?RH9i%15is/g,(U
ATDg*A7Zm*@:p]kCi"$6F!,=6G\(D.@<6L(B5VQtDKKq/$>"6#B5DKqF!)i?Df000F(oN)?U6tD
F)>i2AN;b2?RH9i%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B6%riD/X3$0JH6g/h1LSE)UUl
CLo1R+ET1e+=LlCE%)o>Eb/[$AKYQ$E--@JB6%p5E-!W@$;No?%15is/g+SDF*2>2F#kEQ$;No?
%15is/g)8Z+>G;fFCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQU+<Vd^.3MMW
5t"dP8Q8,$E-67FA8,OqBl@ltEd8dGE+No>%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(FBD..]F1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2
-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:
%15is/g,(OASrW!DIal(DKBr@AKXl>5t"dP8Q8+f$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$>"6#
A8lU$F<Dr/76s=C;FshV-OgCl$;No?+CfG'@<?''ASlC.Gp$a?Dfp".$>"6#B6%r64==c^Dfp#:
F_kkJ-OgCl$;No?+CfG'@<?''ASlC.Gp$a?Dfp"A/Kf.KBlbD/DfT\;De!:"EcW@6F`M26B-:`-
D/^V<ATMs3Eb0;7De:,'D/aTB+D5_5F`;C2$>"6#B6%r6-YII<F`;5@ChtgR4!uBb$4R>;67sBt
F_l/6E,9).DKTc3F!,RCCh7WqFCetl$>"6#B6%r6-YII<F`;5@ChtjS4!uC;-RUHR3\3C-/hd_A
%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B6%s-Bll[MF(o,<0ht%f.VEd@Ch[uX@<6-m0JO\l
/M/)S@<6-m+EV19F<G16EZf4-Bl5&.De*ZuFCfK$FCcS<ATD6&-tdR>Ch[u?/e&._67r]S:-pQU
G%G]'@<?4#3ZqjPF*2>2F!)lGDe*ZuFCfK$FCcmD+CT.u+=LuCA18X8F!,:;@:Wq[%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F<De!lC3=Q<j67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW*<-YdR1FCfN8ATAo.De*ZuFCfK$FCcg/$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$8EZ-+>Y-YA0<6I%16Ze
+E(d54$"a(De*BiFs(O<A0?#:Bl%i<%16Ze+EM+9C2[X!Blmp,@<?''-Y#1jFCf<.-OgCl$;No?
+D58'ATD4$AKYetFCf\>AoD]4@;Ka&B6%p5E-!.?DBNn,FD)dK+CQC&Ecl80BOu2n$9NSe+u(3]
BQ&*6@<6K4B6%s-Blk[c+FPjbB6%r=-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?YXLi@:s.M
D/X3$6t(@^0JH6g/h1USA79+^;f-GgAOKsPF"f9jF=f'e-u*[2@:s.#+Cno++DG_8ATDs&C`m4r
DJjB7+C\n)DImHhFD5o0/e&._67r]S:-pQU@rc-hFCeuD+AZKhDdm9u+>Gc*+>PW)2[p*h67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB72e6K00JstjDg*=HF(oN)+=M>CF*)/8A17rp:-pQU0emQaFtu$"F`:l"FCeu*AoD]4
8iJCsBl8'<%15is/g)l.D..]G0d(UXA79RkA0>K&EZdss3%cmD%13OO:-pQ_78d#Z;E[2d-u*[2
@:s.#+Eq78+ED%8F`MA6DJ()!0d((HEZen$Gp$g=FCfK9@;L!;+:SZQ67sBk@<?'A+>Gbs:LeJh
1,(C@+>>f:2)dQM1^sd$$=e!aF`MM6DKI!K@UX=h-OgCl$8<Sc+=K&i3\W!*4=<`s6pjX:5uLKO
?YO7nA7$\n$8EYT3ZoV!-V@0&6VKp7;GTqmBkhQs?RH9i@r,^bEZc_W%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOATAo3A0<7AATMs.De(OU-OgCl
$;No?+Cf5!@<*K!DL!?QH=_,8@:s.#+EqaEA.8l#+Bot!AS`K;/g+\BC`k*OATD]tB4WG"$4R>;
67sBpDKBB0F<G!7GAhM4+Du+A+EVNED..3k+DGp?0Han7H#k*HCh*t^H=_,8@:s.73Zp4$3Zp*c
$=Q(M+F+D'@3@$B0ea%D.1HUn$>"6#E-67F-[K?EDdd9i-OgCl$=RRY4ZX^#De*9hAKW@HATD]t
B4WG"$4R>;67sBmBl\9:+CT.u+DbJ-F<GOFF<G:8FCfK9@;L!-F(fK7Ch+YtAKWZ9$8<Sc+=nWs
-o!eG0fq-51b!c43ZqjDAIStU$;No?.Rm!34[(!/Dfor.ARlp/H$O[PD.I00AnE/r@<?(%+EVNE
Bl8$(B4Z+)+C\noDfTD3@ps1iBl7Q+-tHb3@:s.#+DG^9-u*[2@:s.#%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX
/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>CF*)/8A2#\d
/e&._67r]S:-pQU<+oue+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,
FCfN8+EM%5BlJ08/e&._67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b
+D>>(@q?csF<D]B@:O(o+EV:.%15is/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._
67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<B^B.u4Q$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+>Gim@<jUb+E_X6@<?'k+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@lt
EbT*+-OgCl$9g.jDe't<FCfN8C2[W:0IIuI+>Y-YA0<6I%13OO:-pQUGAhM4F!,C5+Eh16BlA-8
+EVmJATJ:f6;LBN5u^WS0KhH>0F\@U:JXYM<)64C4ZX]?%15Et:J=GR;cGn@+?qJ$0eb:+1(=RW
:JXY`5se764ZX]M/g*"o0f'pt+>OB5%15[%<'aJZ9e\^k+>F<48PW5a5se764ZX]M/g*"o1F+\/
0F\?u$:[]b5u^NL;cGn@+?)533B83.+?qJ$1GCL-1,B@H%15Hn5uLBJ;cGn@+=B`'@;R-2BOQ!*
8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<%13OO;cugo5sd^q+>Y-!2]s@gF#kEk+EqB>@<,p%
F*VV3DesJ;@;]TuFD,*)+DGm>Anc-o-OgCl$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR
8Q/S;/3Hj69iODF%13OO:-pQUF*)>@AKYf-@ps1b+EqaEA9/l-Afu&5ATMF#F:AR*1E\_$0I\@s
%16f]/g)BVCgTIo6$$m]CLoLd3F<nC/i4\]D_;J++<Wj%HRD*F6$$m]CLoLd3@>qgF`\aDCgTIo
6$$m]CLoLd3F<nC/i4"EAScF!BkAt?,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_F(K&t
/g+\C/e&.1+>=o\%16ZaA1e;u.1HUn$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)F>,((
-SZ`,+>G!667sC&ATMr9F(96)E-*H:$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4CiaH3
CLo1I4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2AM>Jn
+?MV38PW5N<)64B+A#=-<'`iE74/NO%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o
@:O=r0IJq;0fpas/g)o*-OgDH0RGW!E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1
Bl7Q+@Wcc8De!:"E-WRIE+*6f/g*_.@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,OqBl@lt
Ed8dGE+Nnr$>aWhA5d>`CLqU!F*'-367sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.@;Ka&
@rH1"ARfgrDf-\9Afr47@VTIaFE8QIBl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#g
F!)TIATMr9+EM%5BlJ/:+Dbb-AKWC;Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq
:-pQUBl8!+A7Zm%FD,6++EV19F<D]I@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]I
DJj0+B+52C67sBsDe!3lAKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*
@<*K$Dg-(O%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!
Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2.:W?
0K'@I:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCcS,DfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*
F*(r,@ruF'DIIR"ATK4.$4R>+0RI_K+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,@VEb'56
De:,8@<-(#F`S[IH#R>9%16Q_Deq^=:JEN+3Zp*c$=[plCdD#r9eedl+>F<4@W-1$9M&/^4ZX]M
/g)l&0I&=^$=[plCfE\e9LV**+?qJ$2'=V0+=&'b%13OOBl8#Y<)64B4ZX]?%16feFAtOm9LV**
+?qJ$2'=\#0eb9j$4R>SCi<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/%13OO@q]:k9M&/^4ZX]5
8K_GY+EqL-F<F-t@;R,rARf.kF(HIc+CoC5GA(E,+A!\dD^Pu$%170%D,`ef4ZX]A+?)5%,Tq.h
+=A:UAKYE%AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1)$4R>ODg52[<CTG@3Zoh56;LBN9M&/^
.4cl07SHTD<(ok^<%0@\;cugo5sc"f%15is/g,4WDfTD3Ci<flCh4`5DfTB0+DGF1E,oN2ASuT!
$7I\Q3Zp+*-RT?1BkAt?,Aq=)5s[eXD/X3$3B9*,+DEGb+CoCC%144#4tq=25s[eXD/X3$3B9)I
+E2IF+Du"&5s[eXD/X3$3B9*,+DEGb%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+E-67FDJUG0
/i4"EAScF!BkAt?A8a(0$6UHF+<V+#ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?0RGMsE-67F
-Za-CCLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-CCLo5"ATMrJ
-T`\2+?^i&+AP6U+EV19F<GX7EbTK7-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQE$-N;Df9H5
D/X3$0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NBDKKr:Deio=
-T`G43[\WZF?rl%9e[](DKJiD6;0fq%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NLF_Pr/F)>i2
AMGPo+?MV3F)>i2AMI.qF*')YF)>i2AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".$9g.j1a$a[
F<DrPD/X3$0hl(dEc3WZ4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\
+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO:-pQUCh7$u
AKYMt@ruF'DIIR2+E)41DJX6"A7Th"E)UUlCLo1R:-pQ_Ci<`mA9Da.;f-GgAM>e\F=f'eA9Da.
+EM%5BlJ/:Eb0'*@:X(iB-;84Deio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?
+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_C
FD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW*2/cuH0Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq9#F`:l"FCeu*AoD]48g$)G
0K1+qAS!nFEccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$
3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;
D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0T
D/X3$FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$
%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
%159QHZ*F;-Zip@FD>`)0JFjs>9G^EDe't<-OgCl$;No?+EVaHDBNk0Afu20D.Rd1@;Tt)%159Q
HXq):ATT%B;FOPN8PVQA741/N%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS
+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl
+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`
CLqU!F*',G$4R>;67sBkF_u(?@s)g4ASuT4@;]TuEb0'*@:TfSA7dtc+DkP&AKW?J+<V+#0d'[C
-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQUFEMVA+E)-?FD5T'F*(i-E-!.1DIal#F_u(NEb0'*
@:TfS4tq=oE-#T4+=C&U<'a)N5t=?k4#%0OA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj
0fga+HTG\L%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#
@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:G_Ddd0uATMrI0JR*P@ruF'DIIR2:-pQ_
Ci<`mFCfN80JG4lBk)7!Df0!(Gp%2\/KekJ@:UK8GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTf@<jU^+=Lr=De(:>Bl8$(Eb8`i
AKYf-@ps1b+CSekARlp*D]iLtF(HJ'@<?0*%15is/g)8Z+<VdL+<W(IDe*s$F*(u6.3NYBEHPu9
ALD&"%15is/g)l'DJs\R1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is/g)l'DJs\R1E\)ZDf^#A
AT0(@Eb0*+G%G28+=M>CF*&iRA7]RgFCeu*/Kf+GAKYGnCi=M,$;No?+>G`gF`&rm+D,2,@q]Ro
B-8U%ATMr]Bk)7!Df0!(GsldlE%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l-C3=DL
0Hat=FCSuuDJ((?8oJ6=Dfp)1APcfWBLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is
/g)l.D..]G0d(UXA79RkA0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V
@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5
-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBQ:IH=HDfp)1
AKZ28Eb'56/KenAEbAs)+E1b2BHUi"@ruF'DIIR"ATJ:f:-pQU:LdmCF(oQ1@;Kb*+ED%1@;BEs
FD,B0+CoV3E$07@+EVX4@r!2sBOPdkATJu.DBMPI6k'Ju67sBE0RIYFCLnV\De)dbF`Lu':gnHZ
7!3?c4ZX]6C2dU'BHS[O8l%iS78m/5.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.F*&O8
Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22A0><%+CQB%$;No?+CoV3E$043EbTK7F!,17+EV:.+=LuC
A9;C(F=A>CAThX$DfBQ)DKI"3Bk)7!Df0!(Gmt*E0RI_K+?MV3C2[X)ATMr9C2[WnATf22De'u5
FD5Q4-QlV91E^UH+=ANG$7Bk(+EM(%F=044+>b3RATT%B<+U,m6tp.QBl@ltEd:&qD/^j3$7L6R
+u(3]A79R/4ZX^43[-:$F(A^$%14J'@j#i'@<<k[3Zp7%B4Z0--VA;f;f?f!@qAJFFD+'bD/^j3
$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%159QHSZd_A0<77De*s$F*&c=$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%16Ze+E(d5FC])qF:AQd$;No?
+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")
CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!FCfN8
+CoV3E$043EbTK7+:SZ+-nlf*0eb:1+?DP+0KLX*<+U,m6tp.QBl@ltEd:&qD/]pk@rGk"EcP`/
F<G[BE,9H&?U6tDFE1f2BK8(5?O[>O$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[
+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0@r#TtFC])qF:AQd$;No?+EV:.+D,P.Ci=N3DJ()+DKBB0
FE8RA@;^?5F(oN)Ch4`*Bl7K)A7]glEbTK7Bl@m1+D,P4+EqaEA9/l;Bln$,F`\a:ATM@%BlJ0.
Df0V=%16#s3Zr$UASrhY+>=om+>Y-XDe404+=ANG$<')K+B'C-INU%$0I\,n3Zrc%+u(3=%16Ze
+>=ot+E2IF+=MRh+u(3=.3L/o+=K3'-9Nn)0H_Se4s525+u(3=.3Nsi-8%J)HTE?*+B&^V%15is
/g,"BEbAr+Bl5%c:IH=HDfp)1AIStp-nlf*0I\,*3Zp+;.3M6$A5dDhEarZW@<?0NF_u(,$=e!a
F`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"
@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)
Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjb
A8Z3+-RT?1%15is/g*nb<(.p)8PN#B+Co&"ATVK+FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9
G%kA--rac!F@9hQFD5Z2@<-W]F_u(H%15is/g+S?A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9
FD,5.9L_Al/M/)eBOu3q-Z^D=+A,Et+DkP&AISuA67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4
F!,[@FD)e=BOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQb$;No?+Cf4rF)to6+CT5.ARTU%
Bl5&(BkCsgEb0-1+Co1rFD5Z2@<-'nF!,C=+EV:.+A,Et+E1b2BJ'`$:-pQU8T#YmBPDN1A8,Oq
Bl@ltEd8cUFCfN8C2[W;.3L$\ATMrB+DGm>@3B`)EagXD8T#X[$;No?+=M>CF*)/8A2>YWBlkJ3
F!+m6DJsZ8/g+&'D/XT3DJ()+F<G7.Eb-A6ASl@/ATJu9BOqV[:-pQU@Wc<2F!,RFBkM'iE\8J9
BOu'(8LJ[m+D,>4ARlp*BPDN18K`4kCht52@;BEsF*2M7%15is/g,7LBlbD,@<6!&BlbD;AT2[$
F(K62ARlotDBO%7ATME*B4YslEaa'$A0>u*F*&O8Bk)7!Df0!(Bk;?<%15is/g*o-Fs&Or/0H]%
0ej+E:-pQU0d'[CA7]R"-Zip@F=.M)%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#TtFC])q
F:ARgEZf4-CLnV9-OgCl$;No?+EM47G9CC6F`);B%16Ze+EM47GApu3F!,"-A0?=D0F\?u$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16oi
@:XIkF*')i11Y*/FD5Z2@<-Wg67sa(Ddd0uATMrI0J[0Q@ruF'DIIR2+ET1e+Dbt)A0<UO+>P']
ATMr9A8,OqBl@ltEd98E:-pQ?:-pQU:iC;qCghEsF!,R<AKYo3A7]d(0mFfr+EV19F<D]:Bk)7!
Df0!(GqL49@<-H4De:,6BOr;/Cgh?sAI;1!/g+b;@<6-lCh4`2ATMr9@psFi/db??/db??/g+SD
F*2>2F#jY'67rU?67sB'+>G;fASuF/B4rE!G][A3F<G+.@ruF'DIIR"ATJu9D]iM3Bl%<&0eb:8
.j0%SEb$;7ATMr9A8,OqBl@ltEd8!e67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YE
ART[lA3(hg0JP;"Dg!lj$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0emQaFttirEb0*+G%G2,@;^?5-uWp4C12-3+Co1r
FD5Z2@<-W#:-pQU0f<]gDDF*mF`V,7+Cf>-Anbn#Eb/c(8l%iS78m/.AoDKrATA,Q67sB83,N)L
1GL"pE+EC!ARloqDfQsm+?1u-2[Tn%De!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*
$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"4/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b
-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL3&
A8,Oq4ZX]5FCfN8C2[W:1+*D9:-pQUDfB9*+CT@7D/XK;+>GbsA8,OqBl@ltEbT*+$:IHQ<)Yq@
+FPjbDe't<-OOF*+E(d5-o!VB/gEbU6W?u5HS.]X6W?tk$;No?+CoV3E$0+.FD)"mEZf4-CLnW#
Bl%?D3ZohcE+*j%+=DV1:IJ/N;cG+n+=nlnC3=E0/no'A-OOF*+>Y-YA0<6I$49Np/g+tK@:UK9
+>J*`A8,OqBl@ltEd8"'EZf:2+EV..@rr%b:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%G
F*)IS+EM[>FCfME+DkOsEc6"+0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b
4<cI%BeCMc.3gr&-OL2U67sBsDdd0!A9Da.+EM%5BlJ/$-n$bm3\W!*3]\B;3[l16Anc'm$=e!a
F`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<+#:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-
ART*n+D,>(AKYK$D/aE2ASuU2$>"6#E+*6lA0>u)Bk)5l$;No?+D58'ATD4$AKYDtC`m5.Df]tB
Eb/ioEb0,uATJtG+DGJ+DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaEA9/)Q67sBhEb-A1Ble?0DJ()#
DIal,@;^?5@;TIfB5_p6+DtV)ATJu&Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD#0d'[C0Hb"EDdmc7
4s58++CoA++=AND$;No?+E1b!CLePrDIal,@;BE]ATAo4@:O(`+EV..@rr&hEZf4-CLnV9-OL2U
67sC%BQ&);@rHL-FE7e#EZen,A0?=D0FA.uEb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FRCi<`mFCfN80JG:nBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C)
A8,OqBl@ltEd8dL/M/)]Ddd0!0mFfs+EV19F<G+.@ruF'DIIR2/db??/db??/g*u/E-5u*FCfM9
+EV:.+E):2ATAnJGT\dbFCfN8+<Y3/@ruF'DIIR2/g*u!Ec`FBAfu2/AKYetEbAqj:-pQUAn>Cl
Bjtmi+EV19F<G(%F(Hs2:-pQ?:-pQU@<6L2F_t]23XSVK/db??/g)kt+=M>CF*)/8A2#_hFCfN8
C2[W:1+=>SEb-A0Ddd0fA-u'u/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k
3Zp130emQaFttcZ:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.<)67sB82/78O1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrq
EXGQ./g)l.D..]G0d(UXA79RkA0>K&EZdss3%cmD$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@
C2[X)ATMs)E[M2$:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UDQ/g)Nj8l%iS78m/5+>#VsC2dU'
BHS[O8l%iS78m/5$4:9]@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9
@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]k$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OL3&A8,Oq1-IZ@-Zip@FD>`)0JY!_FC])qF>H'@+=D8BF*)/8A2#ee$49Np/g,(O
ASrW4ATMr91*C+A@ruF'DIIR2+D,2,@qZunE,]i9GT^[.Ch=f6DfTB0$>"6#De'u4A8,Oq1(%T5
+BM?:6rQ60+CoA++=AND=&2^^;a!/aI4eSs;FFFj=&2^^;c?+Y4ZZY?;FFGH3ZqL";FFG+H[[(c
-p0+I/NP=*=&2^^;^jpU=&2^^;[Nk*:K0J<+>to-+AP6U+Dbt<+EM7CAI8cb@j"tu-ZW]>6q'RD
-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k;FFFj=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k
+BM?:6rOFI+BosE+E(d<-OL2U67sC!E+No0@;]Tu@r,^bEZccPATMs.De(XQ$>"6#De'u4A8,Oq
1C>iZ>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`$>"6#
0H`)(+E2IF+@JXf;[P6%>9G^EDe't<-OL2lEZf:2+EV..@rsI5Eap4r+=D2>+@JXf;^X^h+>=om
0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ$<L#$6rQ60+=KoZ<'2cX=&2^^;^ii;/g+4k;FFFj
0d'[C1E^UH-RT6.ATAo3A0>u)Bk)6@$>"6#0H`)(+E2IF+@JXf;[P6%>9G^EDe't<-OL2U67sBm
ATVEq+CQC/Dfd+?Afu56F`V,)+>P'MBk)6-GAhM4F!+n/A0>o$DId[&Cj@.DAStpnAI<!h+E(d5
FC])qF>=2):JsSZ4ZX]6I4cXQDJUFC-Rg/i/g+4k;FFG^78+&/@j"tu-ZW]>6q'RD-TsL50H`)(
+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k;FFFj6q'RD4ZX]6-nlcj+u(3.77L3)+=nil4s2s30d(.A
A0<9F6q'RD.6fOu3@Q(!4CL940I_Dm6q'RD$8EZ-+>Y-YA0<6I$4:?b+E(d5FC])qF>F88EZd%Y
0ea_hF`\`o77L2_$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3
DIm^-EscK!+E1b!CLeQ0A8,Oq1C=Ia67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^M
B5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKIn
F`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi/da<U>9GUBB5DKqF!a'nI4cXQDJUFC-OL2U
67sC"@:O(`+CT.u+DkP&AI<!h+E1b!CLeQ0A8,Oq1C@]6+DkP&AKW?J$49Np/g,4KDg*=6Dfor>
EscK!+Co1s+FYFe$4:?bAT)O!DBLV?$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf
6$.-UF(dQo3F<,0Ddd0uATMrI0Jm<S@ruF'DIIR2:-pQ_Ci<`mFCfN80JG=oBk)7!Df0!(Gp%2\
/KekJ@:UK8GT\gcFCfN8+Co1rFD5Z2@<-WG%15is/g(T1:-pQU:iC;qCghEsF!,R<AKYo3A7]d(
0mFft+EV19F<G+.@ruF'DIIR2/g*u!Ec`FBAfu2/AISuA67sBs@<-!l+D,1nF(o*"AKZ)+F*&O7
@<6!4%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!9WGCi_.LATMs.De(OV.3N&>
AKYf-@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;
DJs\R1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB82/78O1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrqEX`@N
67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"h
E+*j%+=DV1:IJ/N;cG+R$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%13OOFC])qF>5p>+=D8BF*)/8A2#_c%172fBk)6A4ZX]5FCfN8C2[W:
1a`_>%15is/g+tK@:UK/F`_>6F"&5DEc5e;A9Da.%16Ze+E(d5-ZsNFCi^s5$>"6#D..3k+D,>(
AN`'s-u*^0FD)dEIS*C(<(0_b-RgSo05>WICG'=9F!hD(0d'[C1E^UH+=ANG$4R>;67sC!E+No0
.!0$AFD>`)1asPUDIal"Ch7$q%16Ze+E(d5FC])qF>OF60d'[CDdmc1A7]R(4s2R&I4cj!4s4cQ
F!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgD2-nlf*0I\,*3Zp+;.3L`bBl%>i$=e!aF`MM6
DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&0d'[C1E^UH+=ANG$4R>;67sC!E+No0FCfN8+>G!LBk)7!
Df0!(Gp$^1FCSu,@;p1+Dg3C<@;KNuGAhM4Et&IfEZf:2+EV..@rsF7$>"6#=&2^^;a!/aA8Z3+
-RT?1=&2^^;a!/aI4eSs;FFFm$<L#$6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%215V5#G,?IZ=
6rPO!,?IZ=6rOO%%15d)<'<8b2D?g-:-pQUCi=D<F(or3%13OOEap4r+=D2>+@JXf;^X^h+>=om
0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%1604;FFGH3ZohE:K0G/,?IZ=6rPNWI4cXD:JsSZ
%14g4>9G^EDe(4C%13OOATAo3A0>u)Bk)6A%16Ze+>=om0Hb=WF<Et?7T0a'0d'[C1E^UH+=ANG
$4R>REZf:2+EV..@rsF7$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`
=&2^^;[j(8:JsSZ4ZX]69M\VM/gFFn;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De'u4
A8,Oq1^se'EZd%Y0ea_hF`\`o77L2b$8EZ-+>Y-YA0<6I%13OO:-pQUAn?'oBHU_+Ci=D<De:,7
DKU#3A0<TLA8,Oq+EqaEA9/l%DIal1@;]UoD/=J?Eb0,sD.O.`ATAo3A0>u)Bk)6>%1604;FFGH
3Zoi!/g+\BC`k)Q.3L2p+BM?:6rR#Q9FV>L@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX
=&2^^;^ii9/g+4k;FFFm$:I<P;a!/a-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpc
AN;1^-p1p!4"r+3+@JXf;[j'g+BosE+E(d5-RT?1%16Ze+E(d5FC])qF>OF6ATAnI+>GPmE-67F
6q'RD%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2
%16Ze+E1b!CLeQ0A8,Oq1^sd$$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+
DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaEA9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,
F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC-OgCl
$;No?+E1b!CLePrDIal,@;BEs%16Ze+E1b!CLeQ0A8,Oq1^se'EZf4-CLnV9-OgCl$;No?+EM47
G9CC6F`);B%16Ze+Co1s+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>aWhA9;C(F>,F'A8,OqBl@ltEd:DH/h1[U@:XIkF*')j
0P"m-FD5Z2@<-W9F=f'eCi<`m+>GQp+EV19F<G+.@ruF'DIIR2/e&._67r]S:-pQUG%G]'@<?4#
3ZqjPF*2>2F!)lQATMs.De(OV.3NGF@:Wq[%15is/e&._67sBjEb/[$ARmhE:2b;eD.7's+>Gl:
3?Sb<:-pQB$;No?+<VdL+<VdL+<X9P6m-\^F!,FBARf:_A7]9o@X0)<GAeU8@<-0uATAo7H#n(=
D0%<P<+ohcCghF-ATA4e:-pQU+<VdL+<VdL+=L`.Ci!Zn+A+pt.3N/0FCfM9Ao_g,+>Gl:3A)FH
:IH=8@;[3/FD5Q-+Dbt)A0<T]%15is/g)8Z+<VdL+<VePARTU%Derr,8jQ>tAnc'mF!+q7F<G[=
ATD?)D..]4@V$[$Ec5E'ASlK2GA2/4+EMXCEb/bj$;No?+<VdL+<VdL+<Y--DIIR"ATJu&F!+'t
BlnE-Ch=f'@<3Q1Ec5Dq@Vg<4@q]:gB4YU+%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`%^67sB80lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z/ibO@.h)h\67sB83,`;K0ea_m
E+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>aA8,Oq0g.Q?-Zip@FD>`)0JOpa$?Tfm@rsFZGWe)1-Zip@FD>`)0eb:/%13OO:-pQUDfB9*
+=M>BBk)6>.3N&:A0>N*@:C?61,(C)GAhM4F!,[@FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>
%15:G/g,C`GWe)10H`)(+D58-+=Js"0JG^9I4f&JCaUSZH[RMWDJU[J+<XEG/g,@VEb'5#$9ieh
+EV^I4ZX]?+D58-+FPjb0d("EC`k)Q+<VdL+<VdL+<VdL+<VdL+AP6U+EV19FE7lu5'nn)D/F,Q
3Zp7%B4Z0-I4cX!+CoA++=ANZ+<VdL+<VdL+<VdL+<VdL:-pQUD.-ppDfZ?pB4kj?3ZpOG+?L\j
5\G+V-8%J)I4cXTEc<BR+<VdL+AP6U+EM7CAKYo'+=M>BBk)6>.3N8DDfp#?%17?)GWe)10d(FL
@r!33G^'Z)FEDUf3Zp."E+rft+EV^I+:SZpD/DEs+>G!XBk(p$D/F,!$4R>REZd.\De'u4A8,Oq
0b"I!$;No?+E)41DBL?LA8,Oq0edi$+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7
/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5Io%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1
A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$>"6#A8,QsINU<R$4R>;67sC"@:O'qA8,OqBl@lt
Ed8dLD]j(3@rHO%EZfR7F*(u(+EML1@q?)VATAo4@:O(`+EV..@rsFZGRXuh$;No?+EMXCEb-A;
DfTB0%16Ze+>=om0Hb=WF<GgQGRXuh$;No?+EMXCEb-A8ATMs7%16Ze+>G!XF`\aJFE@s!%15is
/g,4WDfTD3D.-ppDfZ?pATAnM+E2IF+Dkt4%13OO:-pQUEb03$@<?'kCj@.5BOPdkAKZ28Eb$;1
@;TRs+CT.u+EMXCEb,[eEb0,sD.Pjk+>GYp3ZoduHS-Ks+F,CY/M8@t-Qjca5V+674s2s30d%Z$
+=o,f.!R3a,C(^\.j/OY+<u.Z%15:G/g,4KDg-//F)rHX+>GPmE-67F-nlcaAStpnAKZ5BGUXa`
4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S0d(LJDIIBn+F&-U.3L$$@6-J(.=E=`
G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dte+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^
BQ&*6@<6K40H`)(+E2IF+=K#gEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX
+>GPmE-67F-o<&eAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
2'?pNDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dti+ED%2@;TQu
G^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K/kEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o`>iAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$4R>;67sC$AStpnAKZ)+F*&O7DfBE%F!+n/A0>r8DfTCu$9ieh+EM47GApu3F!*1[E-67F-nlca
AStpnAKZ):F=A=\4CL940I_DmFEDU6$9ieh+EM47GApu3F!*1[E-67F-nuibAStpnAKZ):F=A=\
4CL940I_DmFEDU6$9ieh+EM47GApu3F!*1[E-67F-o)ocAStpnAKZ):F=A=\4CL940I_DmFEDU6
$9ieh+EM47GApu3F!*1[E-67F-o2udAStpnAKZ):F=A=\4CL940I_DmFEDU6$9ieh+EM47GApu3
F!*1[E-67F-o<&eAStpnAKZ):F=A=\4CL940I_DmFEDU6$9ieh+EM47GApu3F!*1[E-67F-oE,f
AStpnAKZ):F=A=\4CL940I_DmFEDU6$9ieh+EM47GApu3F!*1[E-67F-oN2gAStpnAKZ):F=A=\
4CL940I_DmFEDU6$9ieh+EM47GApu3F!*1[E-67F-oW8hAStpnAKZ):F=A=\4CL940I_DmFEDU6
$9ieh+EM47GApu3F!*1[E-67F-o`>iAStpnAKZ):F=A=\4CL940I_DmFEDU6$4R>;67sBpDKBB0
F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1%16035tsdH4ZX]rDJUFC-OgDa:-hTC;a!/aI4cXD:-hTC
;[j(485E,_6r-0K4ZXuU/gqrG:-hTC;^iqN0I\+i-8%J)-mMeg5tsdH.3gr&FCfN80ea__ASu("
Bk&9&ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1-OgDoEZd%Y3$<0_F<FX[5tsdH+=o,f;b0\^
<('ML;[j'C$;No?+D58'ATD4$AKYE%@VKq)@<-W9B6%p5E-!.BDfo]+Cj@.FASrW4Bl.F&+DbJ,
B4Z*+FD,*#%15is/g,7LAKYW+Dfp#?+DG^9FD,5..!0$AFD>`)0JP"!A8,OqBl@ltEd8*$B4kj?
3ZpUI+?qJ$0ea_"+>GPm,9UW3B+52B6!-WT:fBqh76N[S,?IW+9gqti$>4!a4ZX][6!-WT:fBqh
73F]F+D5>"%15U':eXGZ<)Yq@+=JX#+tt-PB4iY95:/!H+?W@a=@Z7c;b:.].3Nsa/j:C?=&)%U
78jX&7oE/W8Q/Se4ZX]64<cI%FE2)4DJWZgC2[Wi+?Ui&+=D8BF*',jB6%r=+=n]k+<YK8F`VXI
,!$hh/1r&Z/g)BOB4iY9/1)u5+@f=+9M&/^;[j'q+F>^b0d(+LE$dak7oE/W8Q/Se%13OO:-pQU
B4YslEaa'$+CT;"BlnB(Ed8dJ@;]UoD'3q3F*&OGF_Pr/F!(o!4!8l&+u(3E+>Y-QEc<3V+>Fue
-p/kuF_Pr/-Rg/h-8%J),!%&'4s2s30Hb'^+>GQ(.3L/o+=K$"+?q&(+>G!C+>GQ(+<r!RI4d5s
A8Z3+-RU>cHQ[_h+>G!LDJUFC-OgCl$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG
+DGJ+DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaEA9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+r
BkM@,F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC
-OgCl$;No?+EM47G9CF1@ruF'DIIR2+EMX5FE7luATAo(Bk/?8+>=63%15is/g+Y?Df]J4FCfN8
0ea_\Bk)7!Df0!(Gp$O5A0>AuARTI!F`7csATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:G_Ddd0uATMrJ0JI$O@ruF'DIIR2:-pQ_Ci<`mFCfN8
0JP7lBk)7!Df0!(Gp%2\/KekJ@:UK80JI_o12^VFDfTB"EZf:4+DkP"DJ=38A7Zm*ATMr9A8,Oq
Bl@ltEd98H$;No?%15is/g,=KEaiI!Bl,mR@<6L4D.Rc2.!0$AFD>`)0eb:1+Dbt)A7]9\$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(i.Dg#]/@V'R&0f_6S%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l'DJs\R1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is/g)l.De!lD0HbLWA79Rk
A0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172f
Bk)6>0R,`A+=D8BF*)/8A2,bl-OgE)A8,Oq0eb;+4ZX]5FCfN8C2[W;0JG1.%13OO:-pQUDfB9*
+=M>BBk)6>0R,#h@;]TuB4Z0-@<-:/DIakE0JG17+EqaEA9/l;Bln$,F`\a:AS,XoBl7Pm$>"6#
De'u4A8,Oq0edh]$9ieh+F&-U4ZX]>+>GPmB4Z0--o!D00ebg:I4f&JCaUSZH[RMWDJU[J+<XEG
/g,@VEb'5#$9ieh+D5>"4ZX]uEc<-K-QjNS+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g+eI
Dfp#?%17?)GWe)10d(FL@r!33G^(>?$>4!a4ZX^6/g+e>B+52ZEZd.\De'u4A8,Oq0edh]$4R>;
67sC!E+No0.!0!6@rsFZ0R,#h@;]TuA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>
FCfME+DkOsEc6".$>"6#De'u4A8,Oq0eb;+%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31
/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$9ieh+EM47GApu3F!,"-A0?=D0F\?u$;No?+E1b!CER/%
@ruF'DIIR2+EVNEEb/a!G%G\:G@>Q7ARlp)E+*6f%16Ze+E1b!CLeQ0A8,Oq0eb;+%13OO:-pQU
F*)>@AKZ28Eb'5#$9ieh+EM47GApu3F!*.Z0ea_hF`\aNG^'Z)%15is/g,1GE+NI"ARoV&+Cf(n
DJ*N'GAhM4+DtV)ATJu&DIal2FDl22%17,eDIIBn4ZX]?1E\_$-Ra<o+u(3c.3L2p-7:/`-RV/1
-8%J)4<cL&,!$ht/g)Qe.Nfs].3L,`BeCMQGpa%.5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtc+ED%2
@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JreEb0,sD.Oi7G^(Y[
-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o)ocAStpnAKZ5BGUXa`4CL940I_Dm
G^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1E^^LDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)
F(fK9E+*g/+>=om0Hb=WF<Dtg+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K4
0H`)(+E2IF+=K)iEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F
-oN2gAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2^!-PDIIBn
+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtk+ED%2@;TQuG^+H^+=K?\
3]f#EI3<cZGRXuh$;No?+EM47G9CF1@ruF'DIIR2+EMX5FE7lu5'nn)F(fK9E+*g/+Co1s+FYFe
%13OO:-pQUBl8!'Ec`FGATMr9GAhM4+Co&)@rc:&FD5Z2F!)lBG][t;D.Oi4F(HJ4Afu&8F<G(3
D/E^!A0>PsEb-[/$9ieh0H`=tE-67F."*^YDJUFC-Rg/h/g*8(FCfN80eb:(D/XH++Dk[uDJ=!$
Ch7[/+EV19F<G+*F(96)E-,f4DK?q=AftN*ATD3lAKYf#DJ+')-OgCl$;No?+EM47G9CF1@ruF'
DIIR2+EMX5FE7luATAo(Bk/?8+>=63%15is/g+Y?Df]J4.!0!6@rsFZ0R,#hA8,OqBl@ltEd8d9
DIal"Ch7$m+E_W4$>"6#1E^UH+=ANG$4R>;67sB[78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?ZDJW6gDeioM
EbBGI0MXqe.W''>;f-GgAO1?LF"f9jF=f'e-uEj<.3N\GD/a<&+Eh10Bk/>pEbBN3ASuT4@q]F`
CND*;$;No?%15is/g*MpARfLs+CT)&+Eh10Bk/>pEbBN3ASuT4E+*j1ATD[0+D,P4+=M)ECagtG
$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L5q/e&._67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3,3SR0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*
AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@
6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R>;67sB/D/O/=+E_R<Bkq9&D/XK;+A,Et+EqaEA9/l(De3u4DJsV>Eb065Bl[c-
DfB9*+Co1rFD5Z2@<-'nF"Rn/:-pQU:Ms_dDe:,6BOr;q@<6-m+E_a:F!,C5+=M)ECagK@F!,RC
+EM%$DBNA(C`mb0B5)F/ATD?m+Co1rFD5Z2@<-'nEt&IO67sBmDfQtABl.g*AKYl!D.Oi/@<?U&
Ec,qN%13OOATAo1DJUFC-QjNS+AP6U+EqO9C`mP.F*&O5Cht5<DfTB0+DG^9@;Ka&Eb/ltF*(u6
ARlooBk)7!Df0!(Bk;>p$4R>;67sC%Bl.g*AKY])G%#3$A0><$B6A'&DKKq/$>sEq+=DARDf028
+Dl"4+=ANG$>sEq+Dl"4+>k8a+:SZqATAo1DJUFW3[\f`+C]86ATJu*BP8b&$4R>REZd%YD/O/4
-RU#Z:-pQU@;Ka&GAhM4F!)lJDf/uo.1HVqEZd(ZD/O/4-RU#Z:-pQU@;Ka&FCfN8Et&IfEZd+[
D/O/4-RU#Z:-pQU@;Ka&B6%p5E,uHqATAnL+Dl"4+=ANZ+AP6U+CT)&+EM[>FCfM&$>"6#1a$XQ
C`k)Q+<XEG/g+S=C`mS'@rcL/%13OODImi22'?aRC`k)Q+<XEG/g,(MCj@.@@;TQuCh[s4Et&Hc
$4R=O$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GaATqZ`D/X3$6=FCjEbBN3ASuU20JH6g/h1aM
G@XWhDeioN@:VZEB6A'&DKKqR0HbHh/KebFG%#3$A0<:<ATqZ6+CT;'F_t]-F<G[:F*)IU%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE9jr;i0f_6S+<V+#:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/(S$;No?+>>`lDg!6G+E_X6@<?'k+EVNE8l%ht8g&:gEcYr5DBLhi0JY-f$;No?+>>`bARdDO
+D,P4D..Mq$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB83,N)L1GL"pE+EC!
ARloqDfQsm+?1u-2[p*'$;No?+B3#c+D,P.Ci=N3DJ()+DK'`?F!,O;Dfol,+ED%7F_l.BBl5&)
EcQ)=+Dk\2F(&]mF!)lKATqZ6/e&.tDe!p1Eb0-1+=CW,F(H^.$4R=r+?^hq1a+n6.3L`#8l%iB
9LV6F:J5&/C2[Wi-OgD;+>#Vs+tb68:IIQD76sgI94)CJDe*3&%16T]ARTU%-RT?1%17,eEHPu9
AKW@8De*s$F*(u6-OgDX67sBlG]75(FD5W*+Du+>BPD?s+C]J8+D#S6DfTn.$?Tj#FCf?5Bl\-0
D.RU,+=CW,A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQU-uNU?A18X0@q0(hFE8RC
DJXS@@VfOj+>#/f@W-L&A0>]&F*)IGDe:,%BOPpi@ru:&+Dbb5FE7lu:-pQUAoDL%Dg,o5B-:W'
B6A'&DKKqBF(fK7Ch+YtAKZ#)C1UmsARmD&$4R>;67sBuF_t]1Bk&8oFDl#;%16Ze+Dtb7A0<Q8
$>"6#DIn$&+>XH6ATAo2ATqZ-?S`,uATAo2ATqZ-1,COA%16Ze+Dtb7A0<jH1^se'EZf72G@VgN
/iYjM2J"X#%16Ze+Dtb7A0<UO0d%S]+<VdL:-pQUFD,5.DKTf*ATAo)+DG^98du,=EZf72G@VgQ
@<+16$>"6#DIn$&+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+Dtb7A0<T]
1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU3&_9R%15is/g,4\D.7F"F"AGV
DJ<U!A7Zkm$>"6#DIn$&+EKRk+Du+>@;]LjAL@ooATAo2ATqZ-FZLWmDJsZ8Bk)'lAStpnATK4.
$4R>;67sBuF_t]1Bk&8oEcPT6F!)lO@;]UoD'3n5@;oe!+CT.u+EM7CATK:0$>"6#DIn$&+=KH&
5;Xf61FXS'%16Ze+Dtb7A0<9b-pKO;,;Ubo1CX\&EZf72G@VgE5:A`Q.3gVt,[W>:$>"6#DIn$&
+=KH&5;Xf61FXS)1G1Tq$>"6#DIn$&+=KH&5;Xf61FXS/C,?A,ATAo2ATqZ--pK+E1asY*.3pW#
3&roUAMQ(O$>"6#DIn$&+=KH&5;Xf61FXS/3&ilW3&iiU2`EZS3B9)[3B9)[3B9)[3B9)[3B9)[
3Htu?ATAo2ATqZ--pK+E1asY*.3pW&1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU
3&`fU3&_9R%15is/g+_BE-,f*Et&IfEZf72G@Vh1/hd_AATAo2ATqZ--RT?1ATAo2ATqZ-@6+i)
ATAo2ATqZ-1*^3g%16Ze+Dtb7A0<ZQ@6+i)ATAo2ATqZ-0I/D+3"64+EZf72G@VgM+>>&p%16Ze
+Dtb7A0<QK0I/"q-OgDoEZf72G@VgM+>kE,-YddFF<G[:F*),6B.",qATAo2ATqZ-2'=Rq1F+k$
1a"df$4R>;67sBiDfTB"EboH-AKYJkF(KD%$>"6#DIn$&+>>l)-QjNS+<VdL+<Ve%67sBtBm=3"
+Cei$ATJ:fATAo2ATqZ--RUu'-Ta!k$>"6#DIn$&+=ANu-p0U>@W-04.6An)%16Ze+Dtb7A0<Zi
-RUu'-OgDoEZf72G@VgD-T`\'+<VdL+<VdL+AP6U+CT)'Df^"C@rHC.ARfg)DKTc3+DtV)ALnsA
F_kk:Ci<flFD5Z2%16Ze+Dtb7A0<6I4!uC;-RU#Z+<VdL:-pQU@;Ke!F*&O7DfTl0@rri2F_kk:
DIIBn/0JbI@psInDf.*KA8bt#D.RU,@<?4%D@HqaEZf72G@VgD@W-044!uBu+<VdL+AP6U+Eh10
Bk/?(@;TR,+Du=<C`mP4@psInDf-!kATAo2ATqZ--RUu'@ldk>G[bT0-QjNS:-pQUDKTc3+DtV)
ALnsI@;KXg+Dbt+@<?4%D@HqaEZf72G@VgD-T`\'4""WYF`JUG@rHC!+CT.u+>,9!-Ql/N/g,%S
Cht53@;TR,Ci<flFD5Z2+E)$<A8bt#D.RU,@<?4%D@HqaEZf72G@VgD+=B5u+=A9S+<VdL+AP6U
+C].qDJO;&$>"6#DIn$&+=A9S-T`[u-T`[u-OgCl$;No?+D#R9DIn$&+=D8BF*&cP+<VdL+AP6U
+Du*?Ci<flFD5Z2+>"^XBPDN1@psFi+DGm+$;No?+Du*?Ci=3(ATAo%DBNM2Ec5t@@3B)p@ruF'
DIIR2+DGm>DJs_A@rc-hFCeu*Bl5&%+Co%q@<HC.%15is/g+\=Eb/a&DfU+GCi<flFD5Z2+<W()
@;^3rEd8c_0JG10%13OOATAo2ATqZ--XpLp+Cf(nEcW@.-OgDoEZf72G@VgD0IeFZ$4R>;67sBs
Bkq9rGp%3SE,Te,$>"6#DIn$&+=D8BF*&ck-X:tDFDl+G+<XEG/g+\FBm+&1Ch7^1ATAo6AT;j,
Eb/bj$>"6#DIn$&+=D8BF*&ck-YR(3ALATC+<XEG/g,+AFD)e6F`VXI@V$[&Df9`/A1Sj7/nZdZ
+<Xp&ATD>k$>"6#DIn$&+=D4X4"#(s+<VdL+<VdL+<XEG/g)8\+<h7%ATAo2ATqZ--Zip@F=0-t
@le:7Eb-U@+AP6U+<VjN+q4ljEZf72G@VgDFCfN8-T`\c3[Z$m+<VdL:-pQU+<hpP%16Ze+Dtb7
A0<7AATMr@4""N!>ULX:+<Ve%67sB'Ec5l<ARlomF`\aDD]iS)Eb/a&DfU+GDIIBn%13OO:-pQU
Bl8*&Ch[E&A9)C-AKYl!D.Rc2-r3baA7]^kDId<rF=@Y+ATAo2ATqZ--Zip@F=0-tCi=3(G&M2>
D.Pb5G^++EFBia">\S(\GA1qT2(&h?ATAo2ATqZ--Zip@F=0-t@lcYUG^+=K>]!neH!FitCi=34
>UKsfATAo2ATqZ--Zip@F=0-t@pD'>G][k/FE1f-F)Z&=ARo%UDes?0>]X^iF(cp1$>"6#DIn$&
+=D8BF*&ck-X8]WG][k/FE1f-F)Z&=ARo%UDes?0>]X^iF(cp1$4R>;67sBPDK]H)Bk/>rBOPpi
@ru:&F!,17+DtV)ATJu&DIal/@<?1(/e&._67sBKBk)7!Df0!(Gp%!5D.Rc2@<,p%AoD^,ARloq
Ec5e;-QlW%/UC],0J,:j><siE>pg'g:-pQU@;]TuE+*j%F!,17@r-9uAKZ).AKYDlA8-."Df0!"
+Cf(nEa`I"ATDi7-r<3/84,pG;^ih3FD,B0%15is/g+kL+CQB:F(&Zl+s:rL@WQ+&+E(j7FD,5.
@q]:k@:OCjEcW@EF`;;<Ecbl'+C]U=D/XK;+D>\7FE9&D$4R>REZf72G@VgE-Z3iFCh[cu+D#G$
F!iM+;Cj27Ch7$rALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L6W-TI/15CQ
ARTXk-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE-Z3iFCh[cu+D#G$F!iM47P#p+Ch7$rALAog-Y#2B
H?s[OE$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L<'`i%-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze
+Dtb7A0<9JDJpY=CghBuATJu!+DG^9DIIBnF!iCu-Y#2BH?s[OE$l)%%16Ze+Dtb7A0<7/@:Whc
H#k>p-Y#2BH?s[OE$m2(;Cj23ATMo?%16Ze+Dtb7A0<7/@:WhcH#k>p-Y#2BH?s[OE$m2(;G9P2
-Z!@8F!hD(ATAo2ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/6"o%/157FF)r]<$4R>;67sB4HW3F4
<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\A-A5d>`CLoePB1?<DCbRP<67sa+A5d>`CLoePB1?<D
CbROcF=f'e@UX=l@j!1<A18X8DK]H)Bk/>pEbBN3ASuT4FCfN8F"Rn/:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq4.FDkW"EZd(s3B7NU:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQa
Ftu$"F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]G0d(UXA79RkA0>K&EZdss3%cmD%13OO
:-pQU<+ohcAoDL%Dg,o5B-:o+E-68D+EM47F_kS2Eb0<7Cige6DBNM2Ec5t@D.Rd0@:s.m+=M,=
G@W-T%13OO@rGk"EcP`/F<Dr?@<6!-%13OO0H`M$-o<).0I\,,-V@0&6VKp7;GTqmBkhQs?RH9i
0d&&/+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDmCh7$q+=ANG$4R>_AT;j,Eb-@@C2[X)ATMs)E[M;'
:-pQUAU&0*@ruF&B-:epBl%p4ATJ:fFCfN8ASu[*Ec5i4ASuT4-XpLp-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>;67sB/De(:>@:NeYE--.DDf0B:+Cf58@VfOj+>#/f@q]:k@:OCjEZf14
F*&O5DIal!Dg5i(+Dbb5FE8Q6$;No?+E(j7@q]:k@:OCjEZf14F*)IU+<X]nCh[E&A8,OqBl@lt
Ed8dF@;TRs+Dl7BF<G".F)N14G\M5@+E)-,$;No?+EV:.+DkP.FCfJ8A8,OqBl@ltEd8dD@<6NC
+<X*rATE'<BPD?s+D#A1AKZ&-Dfol,+C\n)Ecko(Cj?Hs:-pQUEb/us@ru9m/e&-s$;No?+Du==
ATDKp+CTA1D0$-nATAo3A0<Q8$>"6#De'tH%16Ze+E(d5?S`,uATAo3A0<W`/iO4HATAo3A0<jH
1^se'EZf:2+>GK.3B&j-1,KFIATAo3A0<UO0d%S]+<VdL:-pQUFD,5.DKTf*ATAo)+DG^98du,=
EZf:2+>dMI1^se'EZf:2+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+E(d5
0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`fU%13OO:-pQUDKTf-EbT#+
@<-BsH#k)VDJsD8DKTc3+ECn.A8c<-F(f!$ATJu&DIal2BmO?3.1HVqEZf:2+=KE75:A`Q.3gVt
,VTZ7ATAo3A0<9a3^5#W1asY*.3p\Y$>"6#De't=4utnV5;Xf61FXSV1CX\&EZf:2+=KE75:A`Q
.3gVt,Vh/.2[p+*EZf:2+=KE75:A`Q.3gVt,WKNq%16Ze+E(d5-pB[V-pKO;,;Ubo0ePFG2`>5&
1^se'EZf:2+=KE75:A`Q.3gVt,WIbC3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze
+E(d5-pB[V-pKO;,;Ubo0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`f+
$4R>;67sC%H#7#/Ci^_-DIal4DJ<U!A7ZllEb-A*DfT<$A7T7h%16Ze+E(d5F#lE2F)Q8CDf028
%16Ze+E(d5FZLWm@W-04%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63E-67t
@;TRTBl.F&FCB$*F$a;VBk&hN:-pQ_E-67t@;TRTBl.F&FCB$*F$a;VBk&hN+ET1e+C\c#Bk&9/
@;KXg+=M2OF=A>M@;TQuFD5T'F*(i-E-!.DATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1
:-pQU+<WBf+CQC-E+*j%+FZpY6rZTR<$5^cEb/a&DfU+GBOPs)@V'+g+EM+9/e&._67sB'%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`e%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l.D..]F1a$p[A79RkA0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$;No?+EqB>DImBi+CQC&Df00$B6A6+A0>DsEb/a&DfU+G%14[>+=LM</NP"h
E+*j%.3L!e8l%iS78m/5%13OO%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l
@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sBjEb/[$AKYl%G9D!=
F*&O8Bk)7!Df0!(Gp!P'A9;]tD.Pjk+=D8BF*)/8A2#A^-o!JA0et2),!'7KA8ZO,?X[\fA7$]3
%16WfE+*j%4ZX]6FE;8,F(d=9@;9^k?Qa*&@<?0*-[nZ`6rZTR<$s+GA9;]tD.Oh!$9g.jDIn$&
+CoS3@;TR;A9;d!FD)*j%159QHZ*F;A9;]tD.O.`%15is/g,4WDfTD3F)Po,+EqaEA9/kF+E_a>
DJ((a-Z^DV+Dbt+@;KKt@<3Q0@VTIaF<GXCF`Lu'%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af
+Du"&H=%dK+<XEG/g,%MF`)70$9g.j-[I-_E-67F-s[sB/q+ot0H`J1+<r<XDJW[+?Q_'G+AP6U
+CSf(ATD7$%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af+Du"&H=%dM+<XEG/g+YBDJF<3@ruF'
DK?6o4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>Y,_:-pQUG%G]'Et&Hc$;No?+B;B.
+Cno&AKYE!A0>u.D.OhbASGs'6#pg`FE2;;B-;8;AT2U"A0>f.+EV:.+Dl%8D@HqiDf9N7FCfDS
3Zr<YG@kAm@;9^k?Q_'`2E;m=+>PYo1*AG4+>>E%%13OO:-pQUF(KG9GAhM4+EV=7ATMs%D/aP=
FDi:6Bm=3"+Eh10F_)!hEap4r+=D2>+Du:B-TsL50Ha^W1a$FBF<Gua+CoA++=ANG$>ss,4ZX]6
4=DI:0mde[F"&AODf9N7FCfD?+=JrnI3<ELEt&I?0RGJr?SOA[E-67FDKKq/$4R>;67sBkD]j.9
D.Rd1@;Tt)+DkP/@qZ;Y-ZW]>DKKqI4ZX]>+C?i[+D58-+FPjbA8Z3+-RT?1D/X?1F*(u4+?^hu
4#))"FE7lu%15is/g,4HF<G(3DJF<3@ruF'DK?q:@<6O0F`\aJD]iY+G\(D.G%#30AISue@j"tu
-ZW]>DKKqI4ZX]>+C?i[+D58-+FPjb0H`(m1*C+FC`k)Q%15is/g,7MD.Rc2@ps6t@V$[*@;KXg
+D,b<F`M%9A79RkEt&Ip@UX+^B5_[!4ZX^'Dg,f(?X[\fA7$H70JPL/0d&5*+>=ol+>>E%+<V+#
DKKq_3Zoh5-np!00mde[F"&4_3Zoht3[?dAHZ!qH.3rh@@;TFcDf0,8+=JrnI3<ELEt&I?0RGJr
?SOA[E-67FDKKq/$;No?+EV=7ATMs%D/aP=D09oA+DkP/@qZ;Y-p'/1DKKqK+>#Vs.!n!#4#))"
FE8lR,9eibD/X?1F*(u4/37]Y@;TFcDf0+q$4R>;67sC$ATV?pDBO%8D.Rd1@;Tt)+DG^9A9Da.
Et&I?0RI>LF(KG9-W3B45tOg;7n"de0b"IR0RI>B4ZX^&@;BEs-RT?14tq=>+E(d5-RT?1%15is
/g,4H@rH6q+Dtb7+EV19F<G+.@ruF'DIIR2%16WfDIIBn1-IZ@-Zip@FD>`)0IJD"0etsJ1+@Po
3b2r8DKTf'@;9^k?RI31$=n6t@<?0<4ZX]6FE;8,F(d=9@;9^k?Qa*&@<?0*-[nZ`6rZTR<$s+G
A9;]tD.PIF%159QHZ!D=A0>E)DIIBn1-9#gE+*j%1(=RS0RI_K+CoS3@;TR2%13OO:-pQUCi<`m
+CoV3E$0(2+D,>.F*&O8Bk)7!Df0!(Gmt*/-nlf*0I\,*3Zp+;.3NsuA7c8X0d'[C@rGk"EcP`/
F<Dqs5s\sgF(o,E3B8Gr$4R>;67sBhCht59Bl.F&FCB$*F!,(8Df$V+DffY8A8,OqBl@ltEbT*+
+Dl7BF<GF/FCStn$?U>E4ZX]uATV?sCij`*?VO1#?V4*^DdmH(0F\@Q0RI_K+CoS3@;TQu>9G^E
De't<-OgE)F"og=+D58-@;Kb%F'i9K94)$u:IK,1C*52>$?U>D+>#VsFE92H$4R>;67sBkATMs6
Dg<IIATMr9A8,OqBl@ltEbT*+%159QHSZdbAS5NrA9;]tD.Oho+>Y-YA0<6I%159QHSZdbAS5Nr
A9;]tD.PIF%14g4>9Is'Ec5l<+CoS5@<?0*%14g4>9Is'Ec5l<+CoS5@<?0<%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eG@<6-m3B9*,Eb0<6A3s^GBk&hO:-pQ_Eb0<6A3s^GBk&hO+ET1e+C\c#Bk&86Eb0<6
A18XCATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;fFCfN8+Co1rFD5Z2@<-W9
.!0$AFD>`)0JFpuAU%p1FE7lu:-pQU+<WEg+=KiX6rZTR<%/r%DerrqEZek1DJ!TqF`M&(%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE;e9oiASkmfEZd+k0JEqC
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0emQaFtu'#F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]F1E^gZA79Rk
A0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%15is/g)l.D..]F
2BZRABlkJ0DfQtAH#n(=D0$hDBln#2<DGn(G&M2>D.Rbt$;No?+>Gim@<jX_+CSeqF`VY9A0>u4
+CfG'@<?''FCfN8+Co1rFD5Z2@<-'nF!,173Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R=o/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS
78m/5%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#
AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$=mj\F?MZ--Zip@FD>`)0JFj`$?U6!GWe)1-Zip@
FD>`)-OgCl$;No?+E)41DBN@1FCfN8+Co1rFD5Z2@<-W9@;]TuE+*6l+DGpM%16Ze+E(d5A8,Oq
%16Ze+E1b!CLePuBk)5o$4R>;67sBuDg*=<DKBB0F<GXCD.Oi-AThX*+C\noDfTD3F(Jp#+DQ%:
CERh>Eb#Ud:-pQUBl8$2+EV:.+EV19F<G+.@ruF'DIIR2/e&.9DIn$0@;TR=3ZoeY-S-Aa3ZqsI
A8ZO,?X[\fA7$H5.3Lc7+>Y-$+=Aoe.Nj!a%16Ze+EVI>Ci<f+E-67FDIn$0@;TQb$>"6dF(HJ3
ATr$#D.O.`ATAo8D/a<0@j#DqF<GI4GA^i+AISuXEaa$#+Dtb7DIIBn%13OO:-pQUEb0<6DfTD3
FD,5.E,oN5BlA-8+C\bhCNXS=/KebL+CoD%F!,@=F<G(3DKK<$D@HqJ67sC&BOr<(ATr$#D.O.`
ATAo6ATMs(+Co1rF:ARpATAo+ATT&4ATr$#D.O.`ATAnL+E(d5-RT?1%15is/g+Y;ARfKuEb0<6
DfTE1+D,Y4D'38/+DbUtF*&OHGAeUIDesQ5ATJ:f:-pQUF`V87B-;>7BlS9,+Co2,ARfh#Ed8d9
DIal#Bk)7!Df0!(Gp%!5D.Rbt$4R>;67sC(DesQ5AKY].+E1b0F<GL6+FZpY6rZTR<"01067sC(
Deq-k3Zoe[3[Y@D%15is/g+.h6Qg>VFD,_<@<,p%DJsV>@;L-rH#k*IEb0<'DKH<p:-pQUG&M1P
4ZX]5>[25c@<4+XAof_4BQ%a!>\\1jDDEn"0O/^2D/^j3$4R>;67sBU8PN#(FE_;)CER5-EZf14
DKU1H@;]TuG&M2>D.Oi"Df00$B+52cATq[!@rsjp+EVR7GUss]3ZqsIA8ZO,?X[\fA7$H5%16Ze
+Dtb7A0>c$G@YDtF?:mcE+*j%+=DV1:IJ/N;cGCt.4f@JG@YDtF:ARpATq^+A8,Oq4ZX^-E+X>G
+<iihA8,RlF_tJoC2[Wi+>=63%15is/g+.h6Qg>VFD,_)$;No?+D#R9DIn$&+Dtb7ATDZsD.PeP
Deq0[-X:b)D/``-/8f$CATDZsD.O.`%15is/g,=UCisT++>F<4ATAo3A0>c$G@YDtF:ARgEZf=0
@r#TtDIn$&Bk)5o$>"6#FDYu5Ddso/F`\`RDIn$0@;TR'%16Ze+ED%7FCZM3ATq[!@rr.eDImi2
B4Z0-DIn$0@;TQb$>"6#1E^UH+=ANG$4R>;67sC(DesQ5AKW`N<DGn(E+*j%Et&IO67sBlEZf:2
+Dtb7ATD<q@rr.e:-pQUATAo4@:O(`+Dtb7ATD<q@rr.e:-pQUATAo8D/a<0@j#`5F<DrKATr$#
D.P(($;No?+D#R9Eb0<6A0>c$G@bf*Bk)5o$;No?+Dtb2+D58-+Dtb7DIIBn%15is/g+_G+>Y-Y
A0<6I%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,FCfN8F*)P6:-pQ_H[\qCI3<V`/Kf.HF*&NQ
H[\qCI46:[FEM%F%15is/e&._67sB[BPDN1FCfN8+>,9!/hS8YDfT]'FED))+EV1>F:ARP67r]S
:-pQU@<6L4D.RcL%15is/e&._67sB'+AP6U+EM+9+DQ%:CERG3@ps1b+DtV)AKZ)5+EV19F<G[N
E+KIc:-pQU+<W$b5s[eYEaa$&3B9)Q5s[eXD/X3$3B9)I+Du9D-Z3L>FCfN8-OgDX67r]S:-pQU
+<WBf+D,>.F*&OHATMr9@<6L4D/aT2Df-!k:-pQU+<WEg+EM+(Df0).FCfN8+CT>4F_u)>Bl@ku
$;No?+<VdL+<VdL+<VdZ/hSac$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(i[IRJX5%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$;No?+EV19F<G:8+Cf5!@<*K"@<6!&BkAK0BPDN1Ao(mg+DGm>E,oN2ASuT4@;]TuF(KG9
FDi9V%15is/g)hj4Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&%15is/g)kk/NP!u/gj7e6pjX:
5uLKO?YO7nA7$\n$;No?+Cf5!@<*J<-OgCl$;No?+EV19F<G:8+EV13E,Tc*Ed8dBF`(t;Ci<fl
Ch4_@+Du+>+CT)&+A,Et%15is/g,7IF*)IG@ps6t@V$[$ATDC$Ec#Au+DG^9C3=E0+Dbt+@;KLr
+EMI<AKYi4F*&OFF`&=9DBNCsF(Gdf@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5
@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8
A2#\b%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;                               ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f_'51GU(.+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>Ghu
1,U1/0H`)/+>Ghu2)l^51*AD-+?:Q%1E\D.+>Gl!0f^@61a"M1+>Y\o0ea_*2'=V0+>bqu0fL43
0H`),+>kkr0f1"10d&2.+>Yer1,0n,1E\G-+>Pes1,0n,2'=Y/+>Pes0f1"/1a"P0+>Pr"0fC.1
1E\G0+>Z##0esk+3?U:(0fNQZCdMQOBk&hO@UX=l@j!1/DJUaE@UWb^F`8I@@;TQuCh[s4+EV19
FE:o/Cf>1hCLo1R-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE:r1D/a5gD/X3$0JIT[F*&NQ@rH4'
C+19C@;TQuDdm=$F(8X#Bl@m!Df'H.;f-GgAM>he@rH4'C+19K@;KXg+CT;'F_t]-F<GXADeio,
FCfN8F(96%@<?(&ATMs(Bk)7!Df0!(Bk;?qEb/[$ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"
ATMBnCdMQOBk&hN0k+R4Bk&9/@;KXg+=Lc3CagKKATMs7A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?r
ATMs6Dg?CH8l%htFCfN8+Co1rFD5Z2@<-'nF(Auq;f-GgAM>edA8,R'+EMC<CLnW1ATMs(Ble5l
D/X3$<GlM\De*E50IUIGF)WQNA8-+(CghT3De:,7DJ<U!A7]:hCf>1hCLo1R-tI43.3N\KDeio,
FCfN8F(B0);f-GgAPHTCEc4ogG]\":BOt[hF!,R<@<<W#Cht52@:O=r+EV1>FE8R7@;[2sAKZ&&
G%G2,@;]TuF(Jp#+C]U=-tI43.:dC=ATU7IF(o,<0k+R4Bk&86A8lU$F=A>O@<,dnATVL(+EM+9
04S[(DJ*N'FCfN8F(Jl\D/X3$0JIQbDeio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=
.3N_@@VfTuARoLsBl7QrCi<d(6=FqL@k]Sk@UX=l@j!14Ci<d(.3N_DF*)J9Ci<d(;f-GgAO1BY
BkM<;0JI3YA8-'q@rri%F)u&.DJ`s&F<GL6+D5M/@UX'qF`)2ADffQ$+DtV)AKYf'F*&OBDfor=
B5DKqF&QpoCLonP@k]SbB5DKqF"&5BDe!p,ASuT4Ao_<mD.RU,+EV19FD#W5;f-GgAM>edB6%r?
+CfG'@<?''ASlC.Gp$a?Dfp#?B6%s-Bll[MF(o,<0k+R4Bk&9-ATMr9AoD]4D..-r+DPh*Ch\!&
Eaa'$+Eh=:@N[(3Ec>i/F=CsCA79+^;f-GgAOKsPF"f9rC2[WkB4WM7A79a+Bl8$(Ectl-+Ceht
DJsV>@V$["AS5FnBm+'(Ddd0TD/X3$FCfN80PkZ9A0>;'F)>?%C`m5+Ci!ZmFD5Z2+E(j7DdmHm
@ruc7Bl8$2+=M>CF*)/8A2#\dCi<`m;f-GgATVL)F>7TM@:UKh+EMC.Cht5(Des6$@ruF'DBNk0
+E(_(ARfh'+DG_8D]gHMATMs.De(OU.;Wp2A7Th"E)UUlCLo1RA9Da.+EM%5BlJ/:Eb0'*@:X(i
B-;84Deio,FCfN8F)5c'A9;C(F>,C'A8,OqBl@ltEd;J>@:UK8GT_*>F*&O8Bk)7!Df0!(H#.D-
A9;C(F>,C(A8,OqBl@ltEd;J>@:UK8GT\aaFCfN8+Co1rFD5Z2@<-X0Ddd0uATMrI0Jd6R@ruF'
DIIR2Ci<`m+>J*`1E^dNF*&O8Bk)7!Df0!(H#.D-A9;C(F>,C*A8,OqBl@ltEd;J>@:UK8GT\gc
FCfN8+Co1rFD5Z2@<-X1DJW6gDeioMEbBGI0IUdUCagKJBl.g*AKZ/)Ch[E&@<-"'D.RU,+Cf(r
@r$.'ATqZ`D/X3$6=FCjEbBN3ASuU20JI3YG%#3$A0<:<ATqZ6+CT;'F_t]-F<G[:F*)JAA5d>`
CLoePB1?<DCbRPP@<6-m+=M/=.3N>BG%#3$A0><$B6A'&DKI"CATMs7E-67t@;TRTBl.F&FCB$*
F$a;VBk&hN@UX=l@j#r'Ch[E&-ua<N.3NM:D.Oi3Bl.F&FCB$*F!,R9F*)JDATMs(6=FqL@k]WH
@<6-m+=M8AF*(qA+EV19FE;P8F*)JFF^fH(F*&NQH[\qCI46:[FEM$                    ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A>.1cR961,'h++>P`-3&r*91a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PZ+1*A;*+>P&o3A<6H+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>u#90d&2/+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bpj00f^@3+>l,9+>Get
1*A;-2Dn*&6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`
F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S5
3]/cU1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>G_r8p+qm1,(F?+>>f:2)[KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/
3\r`V0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A
+>Get8p+qm1,(F?+>GW41bh$H2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.
0fh!I3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh0d')2C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>GVo+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe
0f:(.0fh'G3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r
+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#
$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.:
+<X'\FCdKU1,L+GF_i0U0JPF-0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$F
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1-$IL
F_i0U0JPF-0ebXB1-.0L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp15+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-0KD0K2``WL
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_
+>PW*2'=V-3\iTS1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0JWtB$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Y-+F_;gP0JPF-0ek^G2**HI$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqi+@1-_+>PW*
2'=V23\WBO2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3
@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)5LG$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-F_;gP0JPF-
0fD'K3BAlQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\
FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f'.D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-
0ek^E1cdKQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU2BY;.B-8r`0f:(.2EE]O3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fB@G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp@(6$6f_1,(F?+>>c91,CsG1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+?(E/F_;gP0JPF-
1,1gH1HI9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp13+<X'\
FCdKU3?UV1B-8r`0f:(.0KLsE3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KLsL3\W>s$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqo+@1-_+>PW*2'=V-
3]/ZR0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0ea_9F_;gP0JPF-0K;*M3BAlM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.2+@1-_+>PW*2'=S53\`EO1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1("?q:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT
3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo
6$6f_1,(F?+>G]61c7<J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqg1*Al*B-8r`0f:(.1cdHQ3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<G
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K1cd<G$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqk+AZKh+>PW*
2'=V13\`BN0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0ea_>ARZc;0JPI.0f1pG1HIBN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+?1Jd6t(1K3Zp.6+AH9b+>PW*2BX_03\WKR1,91D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmM+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(F@+>GZ51c7<N1C=Hr:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f1"I@<*JG0JPI.
0f(jI2``WL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqh0Ha(uEZd+k0fC./0fh*F3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&
+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U0f]RJ$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmM+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>PVn9jr&b1,(F@+>GT32).-G2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqo+A-'[+>PW*2]sk1
3\`WU2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
3?Uq&DBL\g0fL410fh'G3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp18+@]pO+>PW*2]sh33\W9L0f'.D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1DARZc;0JPL/0f1pJ0fh*M
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp18+@]pO
+>PW*2]sh33]/TP1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU1,U1DARZc;0JPL/0f1pK2**TP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp18+@]pO+>PW*2]sh43\W6K1-#[K$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,U1DARZc;0JPL/0fD'J3BArU$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2'>A"@N[E[
0fL402EEWJ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp18+@]pO+>PW*2]sh53]&ZS1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>Pes7V-$O1,(FA+>Gf90JbaI3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Pku7V-$O1,(FA+>PW31c%0L1C=Hr
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>Pku7V-$O
1,(FA+>PW31c7<O2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`<L2)P^J$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[
0fL410fh$G3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1E]D#EZd+k0fL403'&lR3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0eskG@<*JG
0JPL/0f1pH0KLsC$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*B;"
EZd+k0fL401cdEP3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU0eskG@<*JG0JPL/0f1pJ1HI<L$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>GYp9jr&b1,(FA+>P`60JGOA3=6*#
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5
+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3ZpC)+@KX[ANCqg1E]D#EZd+k0fL411HI6K3]/]#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f'qH@<*JG0JPL/1,CsH0fh-O
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K
3Zp.5+AH9b+>PW*2]sk33\iQR1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#T$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.5+AH9b+>PW*2]sk3
3]&WR0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU0f1"I@<*JG0JPL/1,1gE0fh!H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b+>PW*2]sk13\iQR1cPgL$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG
0JPL/1,1gF2``ZK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0fC-s6t(1K3Zp.6+AH9b+>PW*2]sk13\rNP2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0f1"I@<*JG0JPL/1,1gG2``cU$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp.6
+AH9b+>PW*2]sk13]&NO1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI0fh$H$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp.6+AH9b+>PW*2]sk13]/ZR
1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU0f1"I@<*JG0JPL/1,1gI2```K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0ej"B$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0f:(J@<*JG0JPL/
1,1gF0fh$D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
1,L*r6t(1K3Zp.4+AH9i+>PW*2]sk13]&]T1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0eskG@<itN0JPL/1,:mF1cdEI$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp.7+AH9i
+>PW*2]sh63]/lX0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3M1HI<K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.8+AH9i+>PW*2]sh73]&]T1,0+C
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU
0fC.K@<itN0JPL/0fV3N3'&lP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1GBpo6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3$:h9DBL\g0fL410KLpF
3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-
@<?'A+>Pr";e9nj1,(FA+>PW30JPUD0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqk+A-'[+>PW*3$9q83\iBM2)#@E$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU1,^7I@;[2C0JPO0
1,:mI1HI<H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp19+A-'[+>PW*3$9t43\W?N2)5LG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2]t_$DBL\g
0fU:11-.3O3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,g=J@;[2C0JPO00etdH3'&`O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgF3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$9jr&b
1,(FB+>>f:2)I?O3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.7+AH9b+>PW*3$9q83\`KQ1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*3$9q03]/iW2)GXI$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se
+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.2+<X'\FCdKU2]tD*EZd+k0fU:10fh$C3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+?(E/E,m'V0JPO00ek^D1-.*L$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp@(
6#^ie1,(FB+>GT30f;!K3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0ea_9E,m'V0JPO00fV3K0fh*F
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp.2+@0se+>PW*3$9q83\`HP2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f^@BE,m'V0JPO00fV3M1cd?G$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t4
3\`QS0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K
3Zp14+AH9i+>PW*3$9q93\rZT1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&
:3CD_ATBgS0f^@!6t(1K3Zp14+AH9i+>PW*3$9t13\WHQ0Jj+D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*3$9t13\iTS1cPgL$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB
+>PZ41c%0H0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,C%I@<itN0JPO01,:mE1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!Y
A0=WiD.7's3Zp4$+@KX[ANCqh1E]D#Gp"jr0fU:21-.-I3\r]%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp16+AH9i+>PW*3$9t33\iEN1,'%B$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB
+>P]51,h6J1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU1,L+J@<itN0JPO00fV3L2``cT$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!Y
A0=WiD.7's3Zp@(+@KX[ANCqh2BY_&Gp"jr0fU:12``WQ3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp19+AH9i+>PW*3$9q83\iHO0K'7F$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB
+>Gi:0fD'H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>Pku9jr;i1,(FB+>Gi:1,M$J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>Pku9jr;i1,(FB+>Gi:1H.?M0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i1,(FB+>Gl;2).-K0FA-o
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i
1,(FB+>>f:2)[KQ2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqh3?V%)Gp"jr0fU:13'&cJ3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Y\o9jr;i1,(FB+>Gi:0ek^F0a\6p
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqi
0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh+A-co+>PW*3$9q13]/oY
1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\
FCdKU1*B23DBL\g0fU:11-.*K3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,
+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>P'3F`&<W0JPO00etdE1cd<I$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-co+>PW*3$9q1
3\iKP0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU1,C%FF`&<W0JPO00ek^G1-.9O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3
+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp19+A-co+>PW*3$9q83]/TP0fB@G$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp44+A-co
+>PW*3$9q23\W?N0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&
:3CD_ATBgS1,C$q6t(1K3ZpF*8p+qm1,(FB+>Gi:1c7<J3!p!":-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+?:Q:F_i0U0JPO00fV3O0KLmC
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/S6+J6?R!YA0=WiD.7's3Zp18+<X'\
FCdKU3?Uq:C`kJe0fU:13BAlK3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9
Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqo+A-cm+>PW*3$9q93\`WU0f]RJ$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*
3$9q73\rQQ1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_
ATBgS1,pC!6t(1K3Zp4$:LeJh1,(FB+>GZ51,CsH1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8u?/KeS8FtIJP+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Y-9@rrhK0JPO00f(jG2``fR$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's3Zp44+<X'\FCdKU
2BYe*F<E=m0fU:11HI6M3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`d
F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCql+AZKh+>PW*3$9q33\iHO1,'%B$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU3$;",F<E=m0fU:13'&iO
3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.
@<?'A+?:Q?@rrhK0JPO00f_9M0fh*G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3ZpF*:LeJh1,(FB+>Gl;1,V*I2$urO6rZrX9N+8X8PDNC
8Q/Sa;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#
+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-
0KD0O2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
0H_K+@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe
0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp=:+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm
+>PW*2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo
8p+qm1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU
1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO
1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[
ANCqh1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`7
2).-H1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%
6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S4
3\rQQ1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^
6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L
3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[
ANCqi+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU
1E\u+B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk
+@1-_+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql
+@1-_+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql
+@1-_+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo
+@1-_+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9
F_;gP0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`
F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_
+>PW*2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?
+>Gc81bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$
+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_1
3]&cV0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^
6t(1K3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2]s50F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/
3]/WQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,
@<?'A+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh
2'>A"@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1D
ARZc;0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$
@N[E[0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=Wi
D.7's3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#
EZd+k0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh3
3\iBM1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\
FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH
@<*JG0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/
1,CsG2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3
+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K
3Zp.6+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I
@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*
2]sk13\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI
1-.0H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-
@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/1,1gH2**NI$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg
1*B;"Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0K'7F$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i
1,(FA+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL40
3'&lU3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p
+@KX[ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh
2BYV#DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g
0fU:21HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&
:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]t_$DBL\g0fU:11-.6O
3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*3$9n83]/cU0JEh@$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU
0f:(J@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se+>PW*
3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN
0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
1*@]-@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A
+>GPm6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K1cdKM$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,
EZd+k0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'2!Gp"jr0fU:13BArS
3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\
FCdKU1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ4
1c%0H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P_q9jr;i1,(FB+>P]5
1,1gF0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK
+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pht9jr;i1,(FB+>Gf9
0KD0L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3$9>3
@<?'A+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK
+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+AH9i+>PW*3$9q8
3\iNQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GSn
+@KX[ANCqh2]th'Gp"jr0fU:13'&iS3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3A_j$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,g=M@<itN0JPO00f_9P0fh-G$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i1,(FB
+>>f:2)[KQ2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.5+<X'\FCdKU1-$IO@<itN0JPO00fV3K0KLsL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqi0Ha(uGp"jr0fU:13'&cK
3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS
0f1!q6t(1K3Zp45+AH9i+>PW*3$9q83\iTS0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU1*B23DBL\g0fU:10fh0P3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3
+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp1#8p,"o1,(FB+>GW40K;*L3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1*B23
DBL\g0fU:11-.-H3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-co+>PW*3$9q13\iKP1,'%B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P_q8p,"o1,(FB
+>GT31bq*L2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=Wi
D.7's3Zp14+<X'\FCdKU1,^7IF`&<W0JPO00fV3O0KLpI$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Y\o8p,"o1,(FB+>GW4
0JbaD2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_
ATBgS1,C$q6t(1K3ZpF*8p+qm1,(FB+>Gi:1c7<J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3ZpF*8p+qm1,(FB+>Gi:2)%'F
1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS
1,U0s6t(1K3ZpF*8p+qm1,(FB+>Gl;0ebXE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3ZpF*8p+qm1,(FB+>Gl;0f_9M0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_ATBgS1,g<u
6t(1K3Zp1<+@1-_+>PW*3$9q73\rQQ1,B7E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p9BcnNbF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqi+AZKh+>PW*3$9q33\iKP1,B7E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Pr"+@KX[
ANCqi+AZKh+>PW*3$9q33\iWT2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRo
A7]p9CEO`dF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCql+AZKh+>PW*3$9q33\`TT1,]IH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCql
+AZKh+>PW*3$9q33\iHO1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,
+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+?1K>@rrhK0JPO00fV3M1HI6F$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqo+AZKh+>PW*
3$9q93\iEN1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`
F_tT!E]P=!1a!o/@<?'A+?:Q?@rrhK0JPO00f_9M2**HM$;Y,PATDs*A4:NZDfTnS2,6Ij.SjMp
ATDs*A4:NZDfTnAF"Jsd@Wc<+Ci<r/@;]TuEb0<2Df0W-F"Rn/%13OO:-pQq4X`$6+CfG#F(dTW
Df-\6AS5_!Bl.:#AKWC3DJUaE@<-"'D.RU,+=LuCA1q[T0Jk3f$;No?+>Pr"9jr&b1,(C>+>GZ5
2)%'G1^sd$$6UH6+<WK`1*C+FC`k*9FXIV*_R"8kDJLA+EcQ)=3Zr<V@ruSt$Gs+l+<YT<+D)`=
+<VeEF^f6)@ruT2GqKO5%15is/j2BH0e"5WBm;Z]D/Ws!Anbge+EV:.+Eh=:@N[(0DJXB*@<,jk
.3N_N+DG_7F`M%&$;No?+EV:*F<G"0Gp%!ICht58ARTUhBHV,*F*)IGE,ol9ATDU4+E)41DBO%>
+Du=<C^g_H67sC&@:F%aF"SS7BPDN1AncL$F!,R<AKZ#%DJLA+EcQ)=+>"^XBOr;rDe*Dg$;No?
+EqaHCh+Z%@<Q3)AmoCiARlp%DBNk>BOu3,@<-"'D.RU,+E1b2FCfK1F"AGF/nZdZ1E\FqA8Z3+
-Xq"4-Qij*:-pQUGA2/4+Du*?F*22=ATJu<Dfol,+D>2,AKYSnBl%?k+:SZQ67sB'2]tD*EZd+k
0Jst-1cd<I3\iE!$4R=O$;No?4?Y)J.3N,@@<6*C+EqL1DBNA0FCf<.FD5W*+EVNEEb/ltF*(u6
+CQC3Eb-@c+>kc*1^sde67sBkBk)7!Df0!(GqL3^<+oi`AKY].+CQC6Df'&.@VK^gEd8dADI[U%
E+*j&@VKXmFEn<&:-pQUBOu3q+>"^HBk)7!Df0!(Bk;?.@rc-hFCeu*@X0(g+>kc*1a$=I+Du+>
+EM47G7=mS67sC&BPDN1ATDg0EZcqVBl7Hq@psIjF!,@3ARloqDfQt;DfTD3Ec5E0F*&O9EcQ)=
%15is/g,7V@;p1"DJ()+DBN@1An?0/Ec6)BBl7L'/e&._67sB93?V%)EZd+k0Jst-1cd<K3\rN#
$4R=b+<Y]9B4N,4C3=E0-T`\c3a?E.Eb&loFD5Z2@<-'nF'NToFDYH#DHppbEc,H1D..-r-OgF"
ZXduk@;0U%ATDg0E]P=X?ZK^dA.8m_ZQLA5Ao_Ho4Y@j"+<YE+Eb/Zi+D<iK%13OO:-pQr4t&08
+D,>43ZrNXAKY`"Bl%@%+Eh=:@WNZ#Eb-A2Dg*=6@;KakA0>u-Ec6)5BHU`$%15is/g+S5G%G]8
AKX#p+EVX4E,]B!+DG_8ATDBk@q?ckDIakuCht59Df?h8AThX$+Cf>1AISuA67sBQ:IH=LDfTB0
+CT;%+CT)-D]j.B@;p0sA1euI<+oue+D#S6DfQtEBl%T.F*),4C`mY+@s)f$$;No?+D,P4+DG_'
Df'H%FD53#AKYGrDIIR2+D,>(ATJu'F`\a?F!,@=G9CjFDfB9.Cj@.FEa`p+ARmD&$4R=O$;No?
4?Y)K.3NhTDf02K+=Lc7F)WQNA8c%#+Du+>+E2@>E+O'+Gp$X3F)Yr(Gp%6IBk)'lAKYMlFCB9:
E+O)"$;No?+>b3,E,m'V0JG@,0f(jH1HI?I%13OO+<VdLF_!Wr+E]^f-Zj$9F!,1<+E_R9@rGmh
-OgD*+<V+#+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg$6UH6%144#+E2IF+=D;B-OgF#R_sfrK#<8Z
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\K#<8ZKYrJ\KYkJ5$Gs,(_Qts>GAhM4
.!$g[E-67FBl5%F5/OX@F`)!3ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\J]!/YKYrJ\KYs2e$6UH6ATD4#AKW@CA1%fn0b"I4+<Y<.F<DrRA1%fn_j\Jr_h,dZ
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5BAS,XoARrZa
%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq%144#+E_3($?TrqF!,1<
+E_R9@rGmh%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth+<V+#+<Ve;Ble59-ZrrI+AP6U+EM47
F_kS2A8-+(CghT3FD,5.5uU-B8K`1fEcYr5DBNP0Ci"$6Bl7Q+8g%V^DK]T/FD5Z2Et&JoR_sfr
K#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYkJ5$Gs,'_QtCX:IH=:EcQ)=3ZqsEAnc-sFD5Z2+D,%rCisc0_Qs[Y_goXX_h#^Y_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq%13OO:-pQr
4t&39+D,>43ZrWbEbf_=Bl5&0@<?($+Eh=:F(oQ1F!,C5+A*b.+EV19F<G(%F(HJ)Ble5nDJ<U!
A7[GK0b"I!$4R=O$;No?4?Y)L.3N2BEc5tZ+EV:.Eb-A-F!+m6Ci=3(+EMX5DIdI!B-;/6DdmNo
D'4%:FD)dFDIIBn@psJ#.3N>B+EV:*F:ARP67sB'A7]7e@<,pi+EM%2E+O)5@<,p%DJsV>@;L-r
H#k*KATW'8DIm?$@rHC.ARfguGp!P'%15is/j2BH1asPZBm;Z]%13OO%13OO:-pQq4X`0:+D#S6
DfRl]-uEC.ALSaG@<3Q'@;0OlDJ()6D]i\(DImisFCcS-Ec6)>F!,[?ASrW4BOr;sAT23uA7]Y#
%15is/g+tEF*&O9D/aT2ARlp*BOr<!Ec6)>+Dbb5F=n[Y%13OO+<YT5+=D;RBl%i<+BosE+E(d5
-RT?1%144#1*BpZ+DkP&AKW@EDfTB#DfT]'FD5Z2-OgCl$;No?4[(8O.3N5:GWHsWBOPdkARlo3
D..3kB6,LEFDi:8@;]UlAKZ).BlbD,@<6!4%13OO%15is/j)9F2CTb[D/aTB+D5_5F`;CE@<,p%
DJsV>@rc-hFCeu*@X0):F`))2DJ()&F_u)=@rc:&FE8R6ARf.kF(HJ,Ec<-KDIIBn-T`\'%15is
/g+b7Bl%i5Df-\+DBNY2G%#3$A0>buD.P=B%13OO:-pQr4t&<<+D,>43Zoh`F)>?$AT9.AD/Ws!
Anbge+EVNEEb0*+G%De)DL!@9D/aT2ATJu+Ec5e;DIIBnCh[s4+C\noDfTCu$;No?+CfG'@<?4$
B-:i-Dfp#?+CT.u+EM[>FCfM&$4R=O$;No?4?Y)O.3N2BEc5tZ+=LuCA79+^.3N>AE,ol9ATDU4
+Co2-E,8s.F!,O<DJ*cs+DtV)AKYJr@<,ddFCfJ8Ch[s4+CT;'F_t]-FE7lu:-pQU1-$IPDg!6Y
0JGF.0ebXC3BAuS%13OO%144#+DPh*@:s-o-Y.:?@<<k>+AP6U+CfP9F!,@/D.O.`ifoD]P^qbX
XQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`Q=]ifo$Lifo&SP`4Ud
JDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXOQ)LV%1;*ZJfs';K&W#H:18!Nifo$_
@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4D'2;^EcZ=FE-69^P_);3FCcRg@<6N5E-69^P_);3H#k*?
Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;ifo&SPap`tJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXUuIVj%1;*ZJfs';K&W#HA0<!;ifo$M0JGF>3AE6@1a!n`+QAW;2`W!'+<VdL+<VdL
+<VdL+<VfdP_(YE0K1[G0ek:;+<VfdP_(hS+<VdL+<VdL+<VdL+<VdLifo&SP_'>Oifo$;ifo&S
Pa(0lJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXR,X?^%1;*ZPi@pXifph0P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\%144#+:SYe$6V)H+DPh*@:s-o
-Xq.=@<?Q<%1;*ZN8g(PifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufT%1;*ZJhc8LK&W#RifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>O
ifo$;ifo&SP_)Y=D.V^kJja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K
+A?3bF<GOFFQ/O:6t(@^+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufD
ifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*?e+<][.Jhf#62_[6H0eP:;
+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL+QAW;1,(C@0KCjB/i5:*+QAW;2`W!'+<VdL+<VdL+<VdL
+<][.K&W#H%1;*ZJfs';K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohi
P_'>Oifo\eP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme
%16igA79+^+?MV3A92j$F<GU8@OE9@:-pQUDegJ-DfQt:BleB;%13OO1E^FNA79+^+FPjb1E^4G
C`k)Q%13OO%15is/j)9F3%5t]EcQ)=3Zr6W@:X(iB-9fB6m-#_D/^V=@rc:&FE8R:@;0P!+EqL1
DBNt2F*)>@Bl7Q+A9Da.+EM%5BlJ08%15is/g,@PFD)e7ATo8=Bl.F&FCB$*F!*%WDJsV>@q]F`
CM@[!+D,P4+E)41DBNJ(@ruF'DIIR"ATJu&F<GXCD.Oi/DeX*2%15is/g)i*+AZKh+>PW*2'=S5
3\`?M1,04F%14d43\V[=-Y#1jC2[W9C2[X%Ectu9D/aPLD.RZ=Bkh]:%13OO+>,9!/g,(LBlnH.
A0>u*G]Y&\/hSac$4R=m/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@FOT+\GNu
+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/I^$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i50RP$9:IH=:EcQ)=
3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
.h)i5Ch7KsFD)e.EcQ)=3ZqsO%17J*+<Y;[/jr9/:/+Yo?Y"(Z@6H4c+<Vdp:-hTC?XI>^%13OO
:-pQr4t&B>+D,>43Zr<YG9CC/ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++DG^9E-682Ci"37
%15is/g)i*+AZKh+>PW*2'=V13\`TT1-#dN%15is/j)9F3@Q(^EcQ)=3Zoh`Ci<d(.3N>B@rHC.
ARfguGp$^8@:sX(F)Po,+Dbt+@;I&pF)u&.DJ`s&FE8RHD]j1?EHQ2AARl5W:-pQUBl7HqEb/a&
+D5M/@UX(o+CT=6@3BE$G\(D.@<6L(B5VQtDKIKR+@^9i+D#e+D/a<&3Znk=:-pQU0KC7O@rrhK
0JPF-0etdI1cdHJ%13OO:-pQUFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE8Q6$>jL%ARnAM
A8-'q@rt"XF(o9)7<3EeE]lH?+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW$7KM/DIY+Y3ZqWL
.j-Mg.Ni"+$7QDk%15is/g+kFE,ol9ATDU4+ED%8F`MA@+Dkh;ARlolF)u&.DJ`s&FE7luB5DKq
F!)iIBm=3"8T&'QEb/a&6$%*]B5U.YEc5tG%13OO:-pQr4t&E?+D,>43Zr9RG\(D.Bl7HqEb/a&
+CT>4BkM=#ASuT4ATDg0EZet.G\(D.%15is/g)l(+AH9i+>PW*2]sh23]&WR2)bsO%15is/g+_C
A1__3/T5*>ATDs*A1_A5Ec5u>%16QeBl%<pDe*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$nA8-+,
EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&/e&-s$=e!aF`MM6DKI!K@UX=h
-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&3B9)I+BosuDe3rt
F(HIV-UC$aC2[WlF_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1r
FD5Z2@<-'nF!+n/A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2FD5Q*FD5<-+CT.u
+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$7AGA
6rR&N7n#g;;BSS-6q9gJ6qL9!8l%iR:K::[78m/O7n#g;;BSS-6rR&N7n$6B7RTgG+A,Et;cH%Q
779p=6qL9!8l%iF8Q8)R6UXLD+A,Et5t"+::..ZO+A,Et;aXGS:fKhS;BSS-6q(3W;aa2T-TsL5
F(KH&F_PZ&A8-(*+>=63%175sA79RkC2[X"@;]dkATMr90F\@]:IJ5X6m,r]Bl%<pDe*?rD/aN,
F)to'+A,Et;cH%Q779^F4%`::7nHZJ8Q%WB:IIK:6r-QG8Q%WB:IJ,K;Fs\a6qL8c$;+)^<)6:`
;cZU\+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'+A,Et;cH%Q779^F4%`::79EMf6qL9<8l%iR6W-KP
<(';U%15^'6rm#M+E_X6@<?'qDe*BmF*)G:@Wcd,Df-[i:IJ,\5t=@38Q%WB:II]E<(';U%15^'
6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C6qL8c$;+)^<_Yt)Eb0&u@<6!p
De't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA6UXLD4%`::7nHZJ:I@NA;@NsB
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A7B[qCh,Od3F<4&%13OO@WcC$
A86$nBkh]E0ht%f.UmO7Ch.:!A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%FCeu*C2[WsC3(M=@rc:&
FE8QIBl5%9C2[WqBlj\W67sBkBl[cpFDl2F/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU+<Y]9
EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6jc[U/g)8Z1E^UH+=ANZ+<VdL+<VdL
+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+$;No?+<VeFA0<rp-YdR1A7]p,
C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/$:-pQ?
:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16
E,95uBlkJ305i9H:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+AQhtATDg0EZek*ARfLiDJ(R/:-pQU
;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>f:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q
67sBjEb/[$ARmhE1,(F;C3=DJ1($cC/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTcF`&ll+CSekARlouDe*g-De<^"AM.\3
F!,49A8kstD0%=DC3(M4De+!3ATD:!DJ!Tq@UX%)Bkh\r:-pQU0f<BYE\K6kEb0*+G%G2,H=gl-
ATJtG+E)CEE-67FA8-'q@ru9m+EVNEC2[WqBlkJ?DId=!+CT)#ASqh^@rGk"EcP`/F<Dr?@<6!-
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]Tu
DfB9*+DPh*+Co1rFD5Z2@<-'nEsci(D`p-(I4cXQBk/>?$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<
+BosE+E(d<-OL2U67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?
DK?/,D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4&C2[X+ATDj+Df.^!+=o]1HV.(%<_Ysh$;No?
+CT)#ASrW*De*QsF!,"-Eb/a&DfU+18l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi
8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL$;+)^7nHZP:IIcH;c#bZ83K!VC2dU'
BQIa(+A,Et7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"0..)6:-pQUB4YslEaa'$+Cf>,D.RU,
ARloU:IH=8CghC++EM%5BlJ08$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]n
CLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5d+De*HoCh7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$
Es`7L67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];
4s525+u(3TDe*HoCh7Yp$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7d:Eap55EapI[
3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"$7L6R+u(3]EapO]
3Zrc1+u(3]EaoF`:-pQUF`:l"FCcS*Bl[cpFDl2F+D,>(ATJ2J8PDQO4ZX]6C1D'gF)to6+=nX^
/g<"mF)kb>+=nil4s2s8/no'A-ON=79LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO
$8=SWDe*BeF<D\K+<Ve=GB.D>AKX&gHU^S#78jOI4DJeFF*)>@ARo4k+D,h<Blmo/4#)(O8PDQO
$8=SWDe*Bs@Urnh+<Ve=GB.D>AKX&iHU^S#78jOI4DJeFD..3kA79R&+D,h<Blmo/4#;4Q8PDQO
$8=SWDe+!4Bl%<gF<D]<GB.D>AKX&kHU^S#78jOI4DJeFFDl)6F(A^$+D,h<Blmo/4#M@S8PDQO
$8=SWDe*d(A79R&+<Ve=GB.D>AKX&mHU^S#78jOI4DJeFE,ol/Bl%?'+D,h<Blmo/4#_LU8PDQO
$8=SWDe*fqEc#k?+<Ve=GB.D>AKX&oHU^S#78jOI4DJeFF`V,7@rH6sBkLm`CEOa3GB.D>AKX&p
HU^S#78jO#F)>i<FDuAE+=CZ;D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RIE+EC!ARm.qF)>i<FDuAE
+A,Et7nHZP:IIcH;c#bZ8.#]!67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+$?'GtDf9P:>9G^E
De(4C$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FR@WcC$A86$n
F`(o81,2Nj/h1=QBl%<pDe+!.BlkJ=/M/)hEbTW,+A,Et+E_R9F<G[:F*)IGFDi:CFCAfrDJ()&
Bl[cpFDl26ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8ZEb065Bl[c--YI".ATD3q
05>E9-QjNS+AP6U+E(_2@;0U%8l%ha$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL:-pQU
@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q
:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/'$;No?%15is/g)8Z0d(LR
+=CW@Bl%<pDe+!.Blk^F+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9N
D^c,&:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;Isij
Bl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JPP(@<jU`%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$aXAT2'uAKZ)+F*)IG@:Wn[
A.8l@67sB83,N)L1GBqjF`M,++EV19F<G"&A7]9\$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC+
+EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5
-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0
C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV9
1E^UH-RT?1%15is/g+S=Bk;0)C2[X*DJ=28A8-'q@ruX0Gmt*Q:II]E<(]qS<DH+b:dJ&O4ZX]0
/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL%15^'6q9gJ
8l%iT:.\D]5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS<DH+b:dJ&O/151NA7oUu05>E9F`(o80..29
%17<"Blmp.ATMs74ZX]B+?CW!%16f]/g+V3A9)0e@;9^k?QaH%F*)Id/g+(m8Q8,c@;9^k?Qa!%
E$0EKA8a(CF)>i<FDuAE+EV19FE8RFATW'8DD!&CDIb@/$7Bq;H#R=;E+*j%-Ts()GRY!oAhG2S
0fpa1.3L3'+EV19FE8R8D_;J++<Y`BDfp/@F`\`R:2_7&/9GuZE+LRJ+EV19FE8QV+EM4)D.Ok<
%16Z_F(Hs5$6UH=Eap56ATMs7-Ts()0d(+?F<GuaFCfN8Et&I!+EMC<F`_SFF<DtU3[8`XF*)IP
/12Pf/9GuZE+LRJ+EV19FE8f=$6UI'DfT3,ATMrG+EV19FE8R8D_;J++<VdLF)>i<FDuAE+D,>(
AN_XgE+*j%+=nXWFEqh:+=nW_0..kn+=K<*HZWh?F=A=`+=AdUC3(a3$6UH6+=M>M85E/`+?M<)
FCfN8.3NhTBlmon@;9^k?Q`rpCh4%_+<Y65A1e;uASu$2%14Nn$4R>;67sBjDes6$@rri%DIal6
EbTW,+Eh16BlA-8+EV19F<GXIBlmp-%15is/g)PiF)>i2ALBQ3:II]E<(]qS<DH+b:dJ&O.3NhT
Blmp.ATMs7+=CoHF*)VHDf028%14L2F)>i2ALBQ3:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7
+=CoBA92U+CLqU!F*)IN%14L2@UX=l@ja?1:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoB
A7AtgBk)6rF*)IN%14L2Cgh?sALBQ3:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoBA8G[p
B4Z0rF*)IN%14L2F*)G6F)r]j8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFDe*p2Eb0<5
FCfN8F!hD(-mrMFF`V4D4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[WmEclG:FCfN8
F!hD(-mrtSAT2'uALBQ3:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoBA8lR#E+*cuFCfN8
F!hD(-mrtVEbAr24%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[X%F`M,+FCfN8F!hD(
-mrSNFCf?#-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1AU&<.DKBN1DKKH2FE8f=
$4R>`D/XQ=E-67F-Xgh-+E_R9F<G[:F*)IGGB.D>FCf>;%13OO:-pQUEb0<6DfTD3DfB9*+Co1r
FD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%16c_F*)>@H"q8.1,fXLB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm0J5@G2BXRoA7]on$4R=b.Ni,9
DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%
ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@
DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3
F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO
+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*Gr
C`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6Cggda
Cb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=
+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%
/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>
+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et
+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXF
De=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(
FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f
7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,
AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)
E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=
+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLb
Ao^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(
Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6
+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&H_#n74a+<XWsBlbD,Df00*
Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+##mkQeDfd*E+F[a0
A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h
+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9
F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,
+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).
BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"Rb*%144#+<VdL
+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2
.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%13CJ%144-+@.,fATo87
@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r
+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2
FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG
/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHu
F!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG
<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SB
ARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!
A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g(H,%144#+<VdL+<VdL%14=),9SZm
3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@
DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1
/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$
D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(
Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG
/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71
DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1
.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s
$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9
A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,
C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=
+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2
GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#
ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdL
D..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL
+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$
AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#
+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e
,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16
E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7
F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3
Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2
FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,
+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=
?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2
@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+
BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:
AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHh
Ap&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.
?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,
BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,
Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7
DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)
F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)
GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkc
Eb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9
Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:E
BOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'o
BHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hd
G@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;
FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044
+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cm
Gp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2
+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=
+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!
+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7
BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<
ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.
A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO
+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;
F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt
+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&
CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2
@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL
:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK
+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dn
ATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&
FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1
@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmogu
F:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#
EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0
+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*
Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?
F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUj
A8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@
$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9
FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL
+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$
+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:E
F(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]
+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>
ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G
78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u
+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>Derrq
EcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>
BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#
+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc
$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL
+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$
A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[Wq
Ec6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1
BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1
Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#
+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#
DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o
:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b
.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@
9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm
3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>
D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4
AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-
F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_
+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9
@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.
$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG
+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=
@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsK
DfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrG
Bkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8
/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-
+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1
+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C
@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@
?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr
3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3
AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.
B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4
+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G
%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#
D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4
+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk
+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=
Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopn
ATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'
DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,
D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-Ph
F`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j
%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#
+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.
Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F
+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99
BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9
$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0
@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&
+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et
+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.
F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/
Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo
@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&
+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9
-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.
D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$
BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1
+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-
E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*
D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&
+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#
+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8
DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJ
BQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'
F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>
@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(
ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-
DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACD
BOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIakt
FECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_A
DfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC
%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A
@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<Fdd
ASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@9
0/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p
@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/
Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>
A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.
ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79Lm
DJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,
ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#
D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0-
-RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,
Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6
FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth
+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'
Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1
+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&
+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.
+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIakt
F(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1
FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2
+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/
FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4Cgggb
F!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.
Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*
@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5
F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@
6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08
/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e
,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1
+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF
%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-
+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn
+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg
+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?
Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#
+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5
BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=
+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^X
BPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID
$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=t
CL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"
F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/
+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2
@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*
F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6
De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf
<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2
%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6
@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfY
AKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:
+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/
@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7
AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*
0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6
ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"
F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=
+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y
2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>
Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2
AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)
AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#
A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@
Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"
DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7
AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.n
DfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'
Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LG
Bl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6
Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3e
Ch4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7
+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVs
Cht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohc
De<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8
Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7
F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.q
Dfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#
+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6
@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8
Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&
,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNE
Ecl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,
1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?
ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?
6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=C
Dg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7
F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56
@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b
-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE
?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$
Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9
E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/C
ARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]Tu
E,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_
+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"
FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:g
B4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p
@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL
0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PK
BOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(
ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#
Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMp
AmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pq
Ci=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`m
F"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,
0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(
1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9
?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^
+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n
$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(
ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU
:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5
?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj
/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZH
FY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*
F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+
/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$
?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK
%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd
/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:
@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!
AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6
@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2C
B-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.
+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5
DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,
+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%
F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;
Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo
@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y
<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#
A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>=-pFDl2FC2[WnDdtOW
B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<
E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<
%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdL
AoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'j
DBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,
D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*
AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI+
+EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>
$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm
3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgr
Df-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'
C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?
DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2
+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*
E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&
@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,
8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jY
C`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b
/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g
%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9
DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D
$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8
AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M
0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!r
FCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?
+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:
F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#
/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*
E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?
+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rt
A7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*
FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ
$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5
DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%
0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSek
Df.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'
Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nn
DBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7
ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)
.1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58
@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4
+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0
+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(
+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJ
A8-'q@ruX0Bk;?<%143e$>OKi@V'V&1,V`k6<$NU9LV**+=BcW6m*m6.3LrgF*&O$Ea`I"Bk(^q
-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/0I8fCLqN/%16QQCLqO$A2uY8B5M'kCbB49D%-h$
%15cp6:4OC9gqfV;a!/a-UMBcF<GOC@:OCn@qB^(AoD]48l%ht/Kf(FG%l#/A0>K&EZdss3%cn0
+AH9b@qZu?0JPO7%15cp6:Oa<<Du%A+>F<4%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A$HmEc5K2@ruF'D@HqO
De=*8@<,p%FDl)6F!+n3AKYf'CLnW)Ddd0fA0>N-DK@i]E,Tr3Eb9H1+EqC*E,TW8+D,P4+EM@-
H"h//+F.mJEZek1A8,po+Co&#Df0V=@Wcc8@;L"'+CnnuB4Z+%F`S[LBOu'(F`V,)+DG\3Ec5o.
Ebp"R+<X3`G%DeADfm16G%G\:F(fK6+F.mJEcYf.Aftf*+EV:.+D,P1F?^lj8K_edDg*<q-Z'uC
Ble?0DJ()#+D,2/+EVO5F!+n/A0=Gd@V'X(H#IgJ@<,p%@<3Q8ASc08+:SYe$<1\QF!,:-@N]T3
FDPZ/ATJu&+Du==@V'R&De:+9@V'V&+E2@0@ruEpATK%<DfQt5F_PAtCh[cuF!,(5EZfLGBl7Q+
8l%i-+<X6'G%De4ARTUsARlp*BOr<"@<,m$G@>bY+DGF1H#IgJFCArr+DlBH@:XOq@q?d)D]i_)
@<-H4H#IgJD/!WrF<G%(+EML1Eb/c)%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+B2onF<G16EZdtM6m-VnATAo(AS,XoARloqDerrqEcVZs=$]_Z8PVc:+B1m';]nb"
66K/p;,p1c78k<p+APp26:Fcp:IZI,;ajS,6q'R::.7Pn8l%ht7Sc]G78d&:%13OO<+oue+DbIq
+ED%5F_Pl-F!+m6DKTf*ATAo3Afs]A6m-)[Ch.*tF!,RC+EDUB/g+,,AKYl%G]Y'LFCfD6FCfN8
F!,(5EZfI;AKYQ/BleB-DI[6#De:,6BOu6r+D,P.A7]e&/e&-s$;"hP-rac!F@o=s6tp[Q@ruX0
Bk;?7+Dbb5FE8R5DL!@IDId<jBl7Km+A,Et+Co2,ARfh#EbT*++Cf>-Anbn#Eb-A8BOu6r+Co2,
ARfh#EbT*++C\noDfTD3Ecl8;Bl7Q+FD,B0+DbIq/g*`'F*)GF@ruF'DK?q=DBNV2G9D!G+CoC5
FD,B0+Ceht+C\n)AoDg0A0>T(+=LuCA1hh3Ago>T8T&Tk@;Ka&FD,5.-u*[2A8bt#D.RU,.3N&0
A8c?.FDi:7ATT%CC2[W8E+EQ0/e&.:%16'GF*(#M6pta0ARfh#EbT*+?YO7nA7%J\1E\_$0F\?u
$;No?.TBu#F@o=s6tp[Q@ruX0Bk;?.FtG9gFCfN8+E_a:EZek1DJ!TqF`M&(+A,Et+Co2,ARfh#
EbT*+/e&._67r]S:-pQU<+oue+<Yi=Eag.6@q]F`CNCU@FD,*)+<Y]9EHPu9ARlo+8l%ht+DbIq
+Co2,ARfh#EbT*++<Y*5AISuA67sBkAS,XoARmD9,"-!SBl7Km+s:E7ATJu3Dfd+=ARTI!FD,5.
+Co2,ARfh#EbT*++<Y6?BleA=Df0B:%15is/g,7L@<<V?C2dU'BIP'8G]7)/A9/l8D]j+>D.Rg&
Bl7Q+DffZ(EZfI;@;[3%FE8R8AS,@nCih9=$;No?%15is/g,"LDII':+<Y019ljqi4Y@jVATMrc
:IITbEb/a&DfTQ'F!,UJ8S;pZEb,[e%15is/g,@OASrW!+ED%0@<?4,AKYMtEb/a&DfU+GA8c%#
+Du+>+D#e3F*&NQC2dU'BIP'8@q]dlF!,1=F!+n3B6A'&DKH<pC2[X*A8-(*+?_>"-[mEi/1)u5
+?MV38l%ht8l%iC<D?:g+A,Et;bpCk6U`+i:IJ/N;cG+R$>OKiF_#&qF!*Uu+DPk(FD*!R4s4TY
A9DEsEcW?G:-pQU+Xefh4Y@jlE+*j%%16r\F))m]/g+nIA9DEsEcW?d+DPh*F_#&qEt&IjAhG2\
+D!/JD..L$+CoCC%144#4s24iBle?0DJ((a:IH=;DerrqEcW?T+Co%qBl7K)@V'.iEb-A6F`))2
DJ((a:IH=A@:F:*+?L]_@<63,,9U`>A9DEsEcVZsAScF!/e&.1+?gnq@;Ka&8l%htAoDKrATDi7
@<,p%A7]@eDIm?++?L]\De+!$AS,um$>"*c/e&.:%13OO<+U,m8l%iCBl[cpFDl26ATJtJ%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[k@:C?hCh7$mF`7cs=$]_Z8PVc:+@Jdg<(Tk\5uL9C;]nG*76smA6m+g!
+Abs-:Jr<5<DHI8:IZI#5sc\n84c`&=%Q(Z+@8L>6q'd<<(01t8PUC-84=Xr79EM3;cH1^/e&-s
$<LnPDBO%7AKX<NF*&O$Ea`I"Bk(^q+DbIq+EDUBF!,1=+CfG'@<?(%+CQC1F_tT!EZf:4+Co1r
FD5Z2@<-'nF!,17+EV:.+=M\2:IJ,W<Dl1Q.3N/8Eb/a&DfU+U+B3#c+Dtb8F<GXHAT/c9Bl%T.
Eb0*+G%De)DL!@CAfu2/ATME*A8,OqBl@ltEbT*+/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m';]nIo
<'_X*<)6=5:/=qD%14Nn$;tGPDg#\c@:DQ7F*'fa@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%16f]
/g*_T=%Q.0A8a(0$6UI4BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q-RgSo+t!g,
+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+=MGJDCH]=Bk)7!Df0!(Bk;?.
ATD4#ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5%f@:LEgDIak`
Bl8'<+E1b2BQFUi+<Y`=ASc0*-ZX&H/TPGG-S0"O@<?0*-[nZ`6rQl];F<l#%144#F)>i<FDuAE
+=Bik@N]c(D/aE6@<-W9@V'V&+E2@0@ruEpATJtBD.-p-Ch[d0GUXbGBk)7!Df0!(Bk;?.ATD4#
ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$R-
F*&ODEa`I"Bk(^q+Co1rFD5Z2@<-'nF!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$;tGPDg#\76=k4[+Ad)e@ruEpATJu1@:C?iBk)7!Df0!(Bk;?<%14Nn$?B]tF_Pl-+=Cf5
DImisCbKOAA1%fn%15is/g,:SEb/ltF*(u6+Co1rFD5Z2@<-'nF!*%W8OlNO;FM]s;Gp:g;[j'f
+>=o`+>Y-\AS5O#4s2pJ-Xq%)DfBtE@W6F#F*&cP>9G^EDe't<-OgCl$;No?+Co&"ATVK+A8,Oq
Bl@ltEd8d>Bl%@%%16!ED/XT/9OVBsATMr]Bk)7!Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
8l%htA8c%#+Du+>+C\nuDf021Bl5&8BOr;Y+EVX8AIStj8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-
84=Xn+B26-73W0J%15gT+D,>.F*&O5DIal,Df^"CBl.g-Ecb`-F<G%,F<GL6+CSf(Bk(]sBlbD<
Bl.g*GrcBA%15j!<^fn/:.82P;BS_'<^fn/F*)>@AKZ8:F`JTs:IH=9Bk)7!Df0!(Bk;?.Bl5%c
+DG_7FCB!%+Co2,ARfh#EbT*++Unbf$:u@aDfol,+CT)-D]iJ3DeW`)@;^?5:K&BQ@;]LdARloo
Bl[cpFDl26ATJu1Bkq9&%14If:i^Je@;R,VBl%@%>UM-5$4R>0Eb/[$AKYD(8l%htD..L-ATAo(
Bk)7!Df0!(Gp$X3Eb/a&DfU+GEc5l<+EV:*F<G:=+Cf>,E,9*-AScW7Bl7HmE+NotASuT4De:+a
/g)9.F=2,P@;L"'+CQC*Df9//Bk1d`+EVNEA7]@eDIjr!+EM[7A8-'q@ruX0Gp%0MEckl6F`M%9
FD,*)+Dkh5Ec5u>+A+#&+Eh=:F(oQ1F"SRX8l%ht@rc-hFCfM9@VK^gEd8dBAnc'mF"SRX<+oia
AKYT!Ch7Z1@<,p%AmoCoCj@.EFCAWpAKYH)F<G%,DIIR"ATJu(@;[2tBOPdkAKZ21ASrV_+Cf(n
DJ*O%/e&.:%15is/g+YEART[l+CQC0@<6O%EZdtM6m-#SEb/a&DfU+GEc5l<+E)CEF(o/r+E(j7
8ge[&A8-'q@ruX0Bk;?<%15is/g+,,BlbD,Eb/[$Bl@l3A7]^kDIal.DBN@1@rH6sBkMR/ARloo
Bl[cpFDl2F+=M\2:IJ,W<Dl1Q.4u&:DIn$&+=CW;FCfN8-T`_kE+*j%+=DV1:IJ,W<Dl1Q04JmB
ATMr@.6AndATMr9E,oAsFD55rF!,R9F*&O8Bk)7!Df0!(Gpa%.%15is/g+,,BlbD2F!+n/+D#e+
D/a<&+>"^YF(HJ&DJsW1ATAo6Df9_?AoD]4H#IhG+Co1rFD5Z2@<-'nF"Rn/%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+A?]^A0>\s@N]2q@ruF'DIIR2+D,Y4D'3A3D/^V=@rc:&F:ARVD]ib1Cisf@Eaa'$+DYP6
+D,1nFEMV8F!,C5+A,Et+EqB>DImBi+CQC1Df0-'E--@JA8,OqBl@ltEd98[<+oue+Dtb8F<GXH
AT/c.Ddd0t+EV:.+=L]<FCfN8.3N/8@ruF'DIIR2+D,Y4D'370A9Da.+EM%5BlJ/:A8-+,EbT!*
FCeu*GA2/4+A,Et/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+DbIq+Co1rFD5Z2@<-WG%14Nn
$;No?+E)41DBNh.G9CF1@ruF'DIIR2%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sBsDdd0!
Ao_g,+D#e+D/a<&+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9
De*Zm@WO2=@:EbiD/_+AC3(a3$4R>;67sC$AS5RlATD4$AKYDtC`mb0An?!oDI[7!+>"^WBQ&);
CghC,+EV:;AS!!$ATMp$B4Z,n$=>S3HS-Ep+D5M/@WNk[+FPjbEb0E4-RT?1%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+@9LHCNXS=@UWb^F`8I4@:O(qE"*-u6:!t3<DXf)5sn:F:`r(j6VCEU+q4kg$;#=^BlbD5
Blmp,@;Kb*+CQC6DIIK,FDi:=@;BEs@3B#f@r$4++EqOABHToC6nTT);f<df@:O(qE$0(2FCf>5
%14Nn$;No?+E)41DBO%7AKYGnF*&ODEa`I"Bk(]sA8,OqBl@ltEd8*$De't<@W6F#F*&cP>9G^E
De't<-OgCl$;No?+C\bhCER>5+E_W4$?0E`CLeP8@W6F#F*&c=$4R>;67sC$ATMs(+ED%'Dg#]4
F!,R<AKYi.F*&O7F`MM6DKI"1@:O(qE"*.pATMs(+=CW;FCfN8-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
<+0QR+CQC6@rc:&F<G+:D/aS+$6iG8919sh+B(X*8PiA/6rcrX+q4kg$7Kk%@r#U(+C\bhCNCV@
E$/V(DIIR2+DPM&Ch7Z1@Wcc8Blk_D+CT)-D]iI2B5_^!+DG@t@3BZ1+<k?=D/^[AH#IhG+Co1r
FD5Z2@<-'nF!+n4+E2.*Bl5&8AU&;L+<X9P6m,uJDBNJ4D/^V+Cht54E+No0A8,OqBl@ltEbT*+
+CT=6@3BW*DJ*cs+A*bt@rc:&F=n\7@rc:&F<G+:D/aP=@<,p%FD,5.D/XK;+EMX5@VfTuG@>b>
FDi:CFDl22+A*beBk)7!Df0!(Bk;?<+<XWsAKY`+A92[3EarZ'@:WneDBNJ(F*)G:@Wcd(F!+n-
C`l>G6m-PhF`Lu'+Cf>#AKY])+EV:2F!,(5Ec!E<$7QDk:-pQUA9Da.+E).6Gp"MEE-,Z4F=@Y+
De't<@W6F#F*&cP>9G^EDe't<-OgCl$;No?+=M)8CLnq;@rc-hFCfM9@3B)p@ruF'DIIR2+CoV3
E$/k4+EV:.+CoV3E$04E@Us1nARfh#Ed8*$@W6F#F*(r8D/_X!+EM47GApu3F'i?jDe*2tD..3k
+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi4F(KD8De:,&F_u(?F(96)E--.1$;+)^+CoV3E$043
EbTK7F!+t$DBND"+E_a:A0>u4+ED%0Ddd0-+Cf>/Gp$O5A0>`#EbAr+A8,OqBl@ltEbT*+/e&.:
%15is/g,1GCi<`m+C];3ATMr&$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4FC]N2
E"*-`$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:A`NGp$N<A8,OqBl@ltEd98H$7QDk:-pQU@rH=305Y9@B4W2p
E-,Z4F<G+.@ruF'DIIR2%16uaG@VgD@W5gqE-WfmC2dU'BHS[O8l%iR:K::[75&+h@rH=3-OgE$
A0<7/E+<g*Gpa_=+>Y-YA0<6I%14d43\V\'3b!&MATMs(F_u(,$4R>;67sBjCh7$q+E1b2BFP;Z
E-#T4+=BNM76sgJ5u^B&%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@;BEs@3BDqF*(u6+ED$FEb/ltF*(u6
+EM%5BlJ/'$6i21919sh+AG.#<(0\-;FN0877TpJ<(0\-;aXGS:fJVJ$4R>7:IH=DDJXS@F(Jp(
+EV:.+Co1rFD5Z2@<-'nF!,L7B5)F/ATD?m+DG^9FD,5.C2IC#FCfJFBkh6&Anc'm+EMHDD..-r
FCAm$Bl7Q+@3BB#F*&OCAfu,*B5)F/ATD?m+Co1rFD5Z2@<-'nF!,1<+CQC*Df9//Bk1d`/g)9/
:IH=8@;[3#ASu("@<?''@3BT%/TPE8BleB-EZfF5EbTK7+EV:*F<GjIFWb1&DBNM$BlksM+:SYe
$:eZFATD4$AKYD(Eb-hCAS5^uFCfJ8F(96)E-*42DIal/F`\a?F<G:8+F.mJEZf4-Bl5%c:IH=9
Bk)7!Df0!(Gp$X3Eb/a&DfU+GEc5l</e&.:%15is/g+e<DImisFCcS8AM%q6B5)F/ATAo7@rc:&
F:ARtATD?p4ZX^,BQ&*6@<6Ks@;9^k?Q_FW3Zp:&De't<-OgCl$;No?+ELt7AKY]/+DG^9FD,5.
D..L-ATAo6Df9_,$?B]uAS3-0EbTW,?X[\fA7$HoE+*j%+=DV1:IJ,W<Dl1Q05>E9Eb/ltF*(u6
/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;e:%nCh[@!@<-W9A8,OqBl@ltEd8dLD]j(3@:X:oCj?Hs
,#^p0+A>?n;F+2`+@Jdg<(Tk\5uL9C;]o%8+AtWo6r-QO=X":^%15mMASrV_:IH=9Bk)7!Df0!(
Bk;?.A7]@eDIjr!+EM+&Earc*E+*j%/g)99BOr;uBl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*
BlbD=BOr<)DJXS@A8,OqBl@ltEd8dLBOQ!*@ps6t@V$ZlBOPdkARmD9+A$YtBlbD,@;KakA0>u-
AKW19F`\fMA8,OqBl@ltEd98[+@UHbDBO%7Dfo]++Du+8E-67FA8,OqBl@ltEbT*++CehtDJsV>
@V$ZlBOPdkARlomGp#^T6m-2c-Z^D=+D5V2A0>SsARQ^'D]j+4F<G[=ASiPf76s=;:/"e5@V'%X
F`V+T%13OO;FNl>:JOSd+Co1rFD5Z2@<-'nF!+t$DBND"+CSbiATMp(A0>?,+CT/5+Du==@V'R&
De:+a:IH=I@<64*/g+%\5t"dP8Q8,$A8,OqBl@ltEbT*++Ceht+E).6Gp$R-+CSbiATMp(A0>?,
+E)./+EV%5CG$_P%13OO94_[RBl7Q+Ch[@!@<-'nF!+@L5t"LD9N`KWEb0E*DKKqB@:Ne]A7]Y#
@;I'*F`]!P+CT=6H#IgJDfB9*+CT.u+Cf5+F(HJ)Bk)7!Df0!(Bk;?<%14Nn$;No?+DkP&AKYH$
FCfN8+AtWo6r-QO=Ub^VA0<7/E-,Z4F=/28+>Y-YA0<6I%16WbF(KG9-W3B!6r-QO=XOXc%15is
/g+VB@rH=3+DGm>DJs_AFD,5.E-67FA8,OqBl@ltEd8*$De'tP3[\BU@rH=3+C];3ATMr@+BosE
+E(d5-RT?1%15is/g+b?EcZ=FB6%p5E%c9TBlmo/F(KH7+E1b2BFP;]Ec<-K@:sV!F`8]i+?MV3
A79Rk@q]F`CERn6@<,meFCfM9FDk\uGp%0NDK9H4ATMF)0II;:%15is/g,%MFCcS*Bk)7!Df0!(
Gp%'7FD)*jA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A69WE$014An?!oDI[7!+E_X6@<?'k%14:P
77C#q;FO&D;FO>J78k=/:ddTK778=/$4R>7:IH=HFDl22F!,[FEb$;5AS,LoASu!hF"SRX;IsHO
Eb0,uATJu*DII!jAKYhuDL!@IF(Js+C`mY8ATD4$Bl@m1/g+&'An?!oDI[7!+CT)&Dg*<PB4Z1*
GUXbWD]ik7@:UL)DfTB0+EV:*F<G(%Cht54FD,6++EqaEA9/l-DBNh.G9CC6DKKH7FE9&D$7QDk
:-pQUDf0B:+E2IF+Co1rFD5Z2@<-W9Eb/ioEb0,uATJu3AS#BpF`:l"FD5W*+>"^WBQ&);CghC,
+D,>2AKYi$F)tc&ATJ:f?SrsQ/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+@L-XF_t]-F<G+.@ruF'DIIR2+E(_(ARfh'%14:I:IA,V78?f)6qKaF8P`)I;HY,<6:s[6<)XtM
$4R>1De!p,ASuTuFD5Z2+DGm>@3BB)DJ()5FCB&tBl7Q+F)Q)1+E275DKI"5DfQt>Ec5T2@;Tjm
EcWiU+AHcqF<GL6+EV:.D'3M#FCcS/F=n\7Df'&.@r,RfD'3P7-Z^DQDJj#qATMp$Ed8d9DIal$
G%GP6A8-+,Ea`I"Bl7Q9+<XI%BOu4*+E2IF+DG^9BOP^h+C\bpARlopAnGt%FE9&W8T#YfGp%$E
Bl7X'DBO%7BlbC@Ble/>F<G.<ASrW7Ec5i.+X/$O7rN<V+CoD#F_t]-FCB9*Df-\/Ch7cuFCfM9
@rGmh/g*`'+A6TpFD*%C+E)45DJ=$,+DGp?F(K<!Eaa'$F!)ZCBlmp,@<?''E,ol0Ea`g%Bl7Q-
+D,Y4D'3q6AKYDtFCfK1@<?4,AKWQI,&(k0Blmp,@<?''E,ol0Ea`g%Bl7Q9+s8!N%13OO8l%ht
E,ol?Bk1dr+CQC1F_tT!EZf:4+D"u&Gp%<>H#k*MD]iS/@s)X"DKI"2De*E3+B`W*+Ceht+D#G4
ATAo%+EM77B5D-%F(K62ASu!h+E)9C@3BApEbAr+A8-++ATDm$FD5Z2/g)9.+EqaHCh+Z/ARfXq
D.RTq+EV:.+D,P4D.R`?+<XToAKXT@6m-#Y@s)X"DKK</Bl@l3AoD]4D/XH++CoD#F_t]-FCB9*
Df-\9E-,f4DK@E>$7QDk:-pQUAoD]4DIn#7GAhM4F!,RFGp$N<F(oN)Ch4`*Bl7K)De:,&De!p,
ASuTuFD5Z2/e&.rAoqU)CghC,F*)Fc3aEkV/q+of5[,?]+>G2kBf^\l5U]hZ74o]g.1HW'F`\`R
@:jUmEbo0*FE;PE-OgCl$;No?+DG_7ATDl8F(K62ASu!h%14d33$<0_F<Dr>AoqU)CghC,F*)FM
4"#&[FCAm$F!,OGEbTE(+=MLa+CSl(ATAo0@<6N5De!:"EcP`/@q?d$AfrLH.45Q3%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15^'6m-VnATJu)De!p,ASuTuFD5Z2+DG^9DIn#7@rH7,AU&<</e&.:%15is/g+bE
EZfI4@qg%++EV:.+CoD#D.RU,+EM+3FCf?"AKY].+D,2,@q]Fa%16W[F)W6L@:jUmEbo0*FE;PE
-OgCl$;No?+C]A*AS,b(+Co&)@rc9mAKZ&:DJa<1DBNS4Dfp"A+>"^XBOr<*@<l<j@r!3!DfQt3
DKKH1Bl7Q+FD,T6AKZ&*DKKH-@qB]j$>=6pDJUGD/g+eIE$-NLF`)&7Df-p3$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'D@Hq=DBNM8@;Tt"AKYo'+Dbt6B-:`'@s)X"DKK</Bl@lA%14Nn$;No?+Dbt6B-:`'@s)X"
DKH<p0H`@uA8-+(+=D5QDK9H4ATMF)0II;:%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@KdQBl7K)H#IhG+E)IA
+A,Et+EM47Ecbf6FE7lu,"+jh8PV\s=\i$q+AZ'6+A,Et+B(g,;H-"`<)XtM$4R>7:IH=LDfTB0
+Ceht+C\n)F`V,)+EqOABPD?,@<,gkFE1f1Gp#^%E,ol0Ea`g+/g)9.AfuA;FWb45DC9NKAnc-n
+CQBb:IH=EEbTB)FD5o0+EV:*F<GF3ATVu9H#IhG+Dtb%A9/l(D]iI2Ch\!5Ch4`.Ec5T2@;Tjq
DJ(R2$4R>ABOu3q+CT;%+DkP)Gp$[C@;Tt"ATJu4Afs]A6m-GhDeF*!D/F!)B-:o++A,Et-Z^DO
Dfp)1AKYK$A7[A98T&Tk@;Ka&FD,5.C2[X(Dfp)1AKYDlA8c?.FDi:7ATT%e:IH=HDfp)1AKYK$
A7[A&$7QDk:-pQUAU%X#E,9*,+E(j7F`V87B-9fB6m-\lEb'56FDi:4AS,XoAKYl%G9CL+@qfan
FD5<-%13OO:-pQUA7]glEbSuo+CQBb:IH=<Ec6)>%16c]?YO7nA7%J\+BplLBP_X*C`lqC+FPjb
B6%r#$4R>;67sC$AM%q6An?!oDI[6#E-67FA8,OqBl@ltEd8dKBQ&);@;^?5ATDg0EcVZsEb09&
Am]7eDe*3<3Zp4$3ZoduDCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc75&NM9I4fPOG&J`U-RU$@
+F,=D$4R>;67sC%BQ&);GAhM4F!,L7An?!oDI[6g+C]U=GAhM4F!,17+CQC*Ec6)>+EV:*F<G"4
AKYl/F<G:8+EV:.+D5_5F`7csC2[Wq?YO7nA7%J\+=CT1Ec6)>-OgE#G[G0"De*3<3Zp4$3Zodu
@;Kb#AS-!++FPjbB5T.@/M8/YDETTpB6%r6C2[Wq-OgCl$;No?+Dkh6F(oN)+D,Y4D'168B6%p5
E%)5'DKm9O-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36ZmHlDf'37AKXT@6m-&OBlkJ0@:O"fBln'#Et&I#
6WI&a:JFDa73G2u6m+od8Q6g%5sn4;8Q88M;^)YX%16'JAKYhuBl5%c:IH=:A8--.GAhM4F!)lK
G:=YCDIak<ARm54@ps6t@V$ZlF`VYCD/"<-A0>?,+Co%qBl7X&B-:V*6r-0M9gqfV6VgEN5u'fj
F(96)E-*]A$7QDk:-pQUA7]@eDIjr$De!p,ASuT4@rH4$@;]TuF(96)E-*3S+FAQ4IXN>QF!,[F
Eb$;1@;TQuE,8rmAS?!uA7]cj$:IZW<D>nW<'sGU9gMNB?YO7nA7$HB3Zp+!3Zp*c$?L'&F`_SF
F<GOC+=DMb:4@U=%14Nn$4R=O$;No?+CfG'@<?''@3BH!G9D*JEb$:E+E)41DK?q3A8--.GA1r*
Dg)WtDKd3N@W6O0Eb$O,$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqBBl7H(FD,5.-t7.>DfTA;+D#(tF<GdA
DId[0+CT.u+Du+>AKYZ)G9B:L6WHiL:/jSV9hdoK6m-S_G]Y'A@<3Q#AS#a%D/Ws!Anbge+CT.u
+DG_7ATDlF+<Xa!ASrW4BOr<-@rc:&F<GdADId[0+DGm>F('6'A0?)1FD)da;H-=A=!0n,6WHiL
:/jSV9hdoK6m-MmDK@E>$4R>?F`&=1DIal"Ci=B++EV:.+=L]<GAhM4.3N24BlkJABl7I"G:j=3
.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:SK>F<G!7GAhM4+DG^9FD,5.A8,OqBl@ltEd98[+A,Et+DGm>
@;L-rH#k*>A8-."DJ()%DfBE%F"SS2EbT0#DII@&+Ceht+E).6Gp$R-+Cf(nDJ*Nk+EqOABHUl2
E,95uBlkJ:F`\aEE+O&uFD5Z2F"Rn/.1HVZ67sBsDdd0!A8,OqBl@ltEd8dODfTA2Bl8$2+D#(t
F<GdADId[0%16ZW+=D5QDK9H4ATMF)0II;:%15is/g+b?DIal3BOr;7F*2A@Bldj,ATTUT+D#(t
F<GdADId[0+CT.u+Du+>+@K!m<D>nW<'sGU9gMNB+:SYe$;No?+Cf5+F(HJ*A8--.GA1r*Dg)Wt
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+@KdQBl7K)8l%htE,ol3ARfg)D.-ppDfZ?p,"+jh8PV\s8l%ht:f:(]
771#s9gM-E:K&GH$4R>DBOu'(E,ol0Ea`g%Bl7Q+GA2/4+A,Et+F.mJ+EVmJBk(RfCj@.AE+No0
@3BW&F<GL6+Co1rFD5Z2@<-'nF"SS/Ddd0!F)Po,+EMgLFCf;3F(96)E--.D@;]TuA7]@eDIjr3
Df'&.BOPdhGp%!CF`)7Q+<XWsBlbD,@;[2sAKYN%DIjr)DBN@1E,ol3ARfg)D.-ppD]j+2EbTK7
/e&.:%15is/g+\9Anc-o+CQC3Ec5](@rri1@:O=r+>"^-+E_a:+EV:.+E2@4AncK4E,o\9AoD]4
F*1u++EM%5BlJ08%17&pC3+N8D/X?14ZX]>+?CW!%13OO:-pQUF*(i.A79Lh+DN$?@rc:&FE7lu
Eb065Bl[c--Y-dtF_;h=@<633%13OO:-pQUCi<flC`me/EbTK7+Du+?DK?p0$>OKiB4#@fDe*3<
3ZoekF`)&7Df-p3$>OKiF'iWrDe*3<3ZoekF`)&7Df0Z.F*)IN%13OO:-pQUE-67UG]IA-%15L!
6WHiL:/jSV9hdoK6sk7I+?_b.-Za-CF`_SFF<GOC+=AO`ISP??-RU8N$7QDk%15is/g,4WDfTD3
D.-ppD[d%1+E2IF+=D,KC3+N8D/X?1-Taq!6W-KP<*s'KDe*3:E,o]7F`)&7Df-!k%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15mK@q?d%Ec5](@rri1@:O=rF!+n3AKYMpAnc-oA0>T.-Z^DA@<6]:FDi:3Df00$
B6A6++F.mJEZdssF(KE6Bl@l3/KetNASrW4BOr<,AT;j,Eb/c(A8,OqBl@ltEbT*++CT.u+EDUB
+EqOABHS^DD(-TLD]j+4FEMOT%14Nn$;No?+EM+9F`8IBEc5](@rr.eEbupHE,o]7F`)&7Df-pF
+Bot,A0<rp-Xq%)DfBtE@W6F#F*&cP>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37:^+S+F.mJ
EZf+8A8lR-Anc'm/no'A%14:J6qL?#=\i$q+DPh*E,ol/Bl%?5Bkh]5%13OO=(l/_+A,Et+Dbt)
A9/l8BOr<-@rc:&F<H$@A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A+DGm>AU%crF`_2*
/g+,,BlbD<@rc:&F<G(%DBND"+E_a:A0>u4+EM+9+E_WG8l%htFD,5.G@>b>H#IgJG@>B2/g*o-
FCcS.Dg*=LDfm14@;[3!G\(B-FCcS6Ec5](@rri1@:O=rF!,[?ASrV_:IH=ADdd0t+EqOABHVA-
DKKH-@qB^(Ch[Zr3XlE*$?Bu+-ZF*@F*2A;Df9M@+Bot,A0<rp-Xq%)DfBtE@W6F#F*&c=$4R>D
5uLHL:.I>fF*)>@AKZ8:F`JUDEc5Q(Ch4`'DBNk8AKYo'+F.mJEZen,@ruF'DIIR"ATKIH+B3#g
F!,(/Ch4`'F!,L7F(KG9GA(Q*+A+pn+E_X6@<?(%+EV:.+A,Et+CSekDf.0:$7QDk:-pQUA8-+(
CghT3C2[X%Ec5Q(Ch555C3'gkATT&8ART+V@;9^k?Qa*&@<?01IUQbtDf0VLB4YslEa`c;C2[W9
C2[X%Ec5Q(Ch555C3(a3$4R>;67sBjCi=B++EV:.+DPh*E,ol/Bl%?5Bkh]3GA1r*Dg)Wt%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+B;?/+A,Et+@npp:`r&!6m+ln6WHiL:/jMY8P`(j$6iJK73G2u6m,#h9Mcit
:.-3m:IA,V78?fJ<(Tk\+q4kg$;#,VFCB!%+EV:.+=Ll6DImisCbKOAA7TUgF_t]-F=A>@A7TUr
+EVNEF`V+:8l%ht:ddbqBOu"!/g(T1.1HVZ67sBsDe!3tBl@l3De:,,De(J>A7cr9+DG_7FCB!%
+CSekDf-[GB4YslEa`c;C2[WnDe!p,ASuT=+EqOABHTo59FV>DE+*j%+=DVHA7TUrF"_0;DImis
CbKOAA7TUgF_t]-F>%TDAn5gi05>E9/oY?5-OgCl$;No?+E)41DK?q8De(J>A7cruAftM)E+EQ'
Eb/ZiATAo-F!+n7@;0Od@VfTuDf-\CDfp(CF*VhKAShk`C2[WrASc<.0F\?u$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l3;fuqo@<-W9@;]TuAnc-kC`mb0D..I#F"Rn/<+ohcAoDL%Dg,o5B-;/6@:OCn@qB^(D..3k
+A,Et+Dl%;AKYr4De+!#FD5o0+CT.u+E_a:Ap%oN%13OO8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-
84=Xn+B26-71BS5$:7$G93"e26:!t3<DXf)5sn:F:^ma@$<0;a73Fl=;aXGS:fJQ*<D?:!$4R>:
5taWh5p/lf;cH1`+AtW[;FO)I;cH1`+B(X*8Pi@q$4R>@78tC'8O?<@;HY,18OHHK:JO2R8OZQ#
<)4W776s=;:/"e"$4R>877C#q;FO&D;FO>J78k=/:ddTK777Rl%15L!6WHiL:/i?(8OHHK:JO2R
=WgL,8ju*H;[j'C$:I<P8PV\s=\i$q+AZ'6+A,Et+B(g,;H-"`<)X55%15I&;cHOe8QnP*8l%ht
779^H+@\Xa8PD]T8OZPe$4R>177KjD73G2u6m,<(:J+&C<$4n$6W-]Y%13OO779^H+B_K?;BT^m
A8lR-Anc'm/no'A%13OO<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JM?+%13OO<+oiaAKYE%
AKY`1F*&OGDf'&.De:,6BOr;Y:IH=EEa`I"Bk(^q+A!\h@<Q3)AoDg0A0?#9AS-($/g)9&F!,aH
FWbgJAKXT@6m-bnFWbmBCht55Ec5Dq@Vg<4Anc-n+F.mJEZf:EDBNe-FD,T'F"SRX%13OO8S0)j
Dfm17Bl7H(@;[2r+E_a:Ap%o4D.Rg&De'u0Ch7$rAKYf#F<GF3+DYk5G:k!\8K_MODBND"+ED%%
@q]Fa+CT@Q%13OO8oJB\+@9LPATAn&$;FrL@qZu?0JPNr$=[FZATDNr3B9?;D..-p/n8g:%14Nn
$4R>WDe*C$D/_6f9L2!E8Q8AP4ZX]58l%ht-o*4o;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08-OgDV
5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P
6VgEN78?f\4ZX]5<+oue+DbIq+Co&#Df0W<Eaa'$F!,.7G9D!G+Dbt)A0>E*D/^Ui:IH=H@rc:&
FE8QV+ED%:Bldir+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P7ScBO;a!/a0b"I!$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l38T&WjDe+!#FD5Z2%15^'6m-PhF`Lu'+Cf>#AKY].+Co2-FE2))F`_2*+DG^9FD,]+
AKXT@6m-#_D/^V=@rc:&FE9&W7!3?c+EM%5BlJ08+CT;%+E2.*Bl5%Z;aX,J+A*bt@rc:&FE8RH
BOQ!*@ps6t@V$ZuDdd0fA0?)1FD)dh-Z^DOFCB&t@<,m$F(96)E-*4AEc5H!F)u&5B-;A/Eaj)B
%13OO<+oue+DbIq+CT>4F_t]2+A,Et+CT.u+EM[EE,Tc=Bl7Q+@:WneDK?q6@<Q3)@V'+g+DG_7
FCB!%ARmD98l%ht@;]TuF*2G@DfTr6DJ()#A7TUrF!+t$DBND"+DG_7FCB!%ARlp-Bln#2FD,5.
8g&(]@r#LcAKYhuDII0hE\7e..1HVZ67sC&D]j1DAKYD(A9Da.+EM%5BlJ/:8l%htD09oA+C\n)
@:OCnG%D*iEb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36Z6jSBkMR/AKYD(
IVNe3F)Q2A@q?cnBl[cpFDl2F%16'Q+EDUB+CQBb:IH=9F_u(?F(96)E-*4DBl.g*Gp%$EASrW!
+Dtb7+Co1rFD5Z2@<-W9@;]TuF`V+:-nlf*0I\Us%13OO7W3;iFD,B0+DbIq+EV:.+EMIDEarZ'
A8,OqBl@ltEbT*++CT;%+CfG'@<?'k+DG^9FD,5.."4ca6rQl];F<l%+ED%0@<?4,AKYMtEb/a&
DfU+U+<Xg*FWbmBCht53AS#BpFDi:3Df00$B6A6++CQBb+D,P.A7]d(FDi:@DeX*2+EVNE@;[2r
@ruj%C`m8&Eb/a&DfU+U+A!\S<)QLe7nd&.;FNrK9he&O6m-VnBl7Q+@3B)pEb/a&DfU+GFD,*)
+DGm>DJsV>Bl5&8BOr;Y+EMgLFCf;3FE1r(+Wsp+FWb45DC9NKG@>B2+F.mJEZf=AARfFmF`S[9
Bk)7!Df0!(Gp$X+FCAWeF(KD8@V'7kB-;D4E+NQ&@X0)1DKBo.Ci!g'B-;;0AKYl%G]Y'#+Eh=:
F(oQ1/e&-s$:8<9DfTD3E,ol,AS#CdDJ()%Df00$B6A6++CQB@IS*C(;bpCk6U`FHA8-'q@ruX0
GqL48DBMP2/hhMm8l8P1F*VhKASlK2FD,5.6Z6jSBkMR/AM6MkCh.*tF!,=2DKR(?E+Np.+EV:.
+Co2,ARfh#Ed8d>DerrqEZek1DJ!TqF`Lo4Bl@l3Anc'm/e&.:%15is/g+YBDJ!TqF`M%9@3C"k
:IJ,W<Dl1Q+Co2,ARfh#Ed8d:AS,k$AKYr4De!?iA8,po+EVNEFD,5.DIn'7+EMX9E%VS,%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+AucfDg#\7E,oN5BlA-8+DbIq+Co1rFD5Z2@<-'nF"Rn/=$]_Z8PVc:+B1m#
+AP@-<$5+=78P+)786QY78k<s8OHHK:JO2R8OZQ#6W-?=<(01t6<PF-;FsY^+Au37;]nk*+B1m'
;]nb"67sB'<(KG#6qKaF8P`)I;Fs;U+=MASBl%j,Ddd0-+DPh*Ci<`m/0J\GA7T7pCi<`m.3M\`
9M?Qq73Fue9LVoL6nTT)8Oah*:K8N)5uL,o5se@I<$5.273Frn:/jYW<)Xo87NbZ$78lVt6qKaF
8P`)I;Fs;U+@K!J:/=h379DuG<E)C0<(KG#:.88a+A>'f+B)6.:bE1a%16'JBlbD<FCfD6A7]@e
DIml3@3B`)Eag/5BOQ!*Eb0*+G%G_;CggcqF)Q2A@q?cnBk)7!Df0!(Bk;?<%14Nn$;tGPDg#\c
@:E/RF`Lu'6tp.QBl@ltEbT*+?YO7nA7%J\+>Y-$+>=63BkAt?-[nZ`6rQl];F<l#+>#VsEc5l<
4Y@jlE+*j%+=DV1:IJ,W<Dl1Q-Qlr</e&.1+EMC<F`_SFF<Dqs+A,Et;bpCk6U`,.Bl[cpFDl2F
+DGm>DJsV>F(KH9E$-_TF(KH9E$/S,A0>u7Gp$O.@;0U3-OgDoCia0%AhG2X/nS[>BleA=C2dU'
BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9/no'A-Qlr</e&.1+EMC<F`_SFF<Dr':IJ,W
<Dl1Q+CSekDf-\3F!,@=F<G:8F*(i,Ch7-"/KebFF*(i,C`m/(A0>u7Gp$O.@;0U3-OgDoCia0%
AhG2t7TW/V+CoCC%144#:-pQU@r,^bEZf:CF<G+.@ruF'DIIR2+Co2,ARfh#EbT*+%144#F(f-$
C`k*GA0<OH+>7^W+t"oiEc5l</14\FFD5Q4Ci<`m-RgSo+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ
/1>OWDfdNX>\\1fCi<`m-RgSo+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>\\1fA7]q#
Ddd0(.4chj-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=MGJDCH]LDfp)1AKYMt@ruF'DIIR"
ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4DBMPI6rQl]
;F<kqE+*j%F!,C=+A?KeFa,$;DIaka@:LF$H#n(=D0$-n+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX
06MANCiaE2@:U_p$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA8H0mA1%fn+<Y`=ASc0*-ZX&H
/TPGG-S0:VDfdNX05>E9A7]q#Ddd0(%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9-uEC&05P??
Fa,>XF)Q2A@q?cnBk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&a
F(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$p3@N]`1F`Lu'+Co1rFD5Z2@<-'nF!,=.DKTB(Cj@W\
%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;tGPDg#\7@;^?5E,oN5BlA-8+Dbt)A0>\s@N]2q
@ruF'DIIR"ATKI5$7QDk:-pQUF`)52B5)F/ATAnF+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcEb/lo
-9`P63[]&lBl%j,Ddd0!C2[X!Ddd0!C2[WnAThm.@:U`.>9G^EDe't<-OgCl$;No?+Cf5!@<*K/
F`\a:Bk)7!Df0!(Gp$X3Eb/a&DfTQ'Et&ISASl@/AP?NA;f?f!@qA&B@ruF'DIIR"ATJtJ%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[bEb/[$AKZ,;Bl%j,Ddd0!A8,OqBl@ltEd8*$7!3?c+EM%5BlJ08+CT;%
+Dbt)A7]9oBl8$2+Co1rFD5Z2@<-'nF"SRX6ZQaHFCcS'+=MASBl%j,Ddd0*+Co1rFD5Z2@<-WG
%14Nn$;No?+CfG'@<?''@3BH!G9D$MBl%i5A8-'q@ruX0Gp$g=+=M\2:IJ,W<Dl1Q.3L2bBlkJA
Bl%T.@V$[&AStpnARlp"@<?($%15is/g+;8FWbODF*&O7Df00$B6A6++=M\2:IJ,W<Dl1Q.3N&:
A0>i0Bl8#8FDi:1DBN@tFEM#.+D#D/FEo!>Bl[cpFDl2F/e&-s$>sF!A0<7BFD5Q4Ci<`m-T`_k
E+*j%+=DV1:IJ,W<Dl1Q06MANCiaE2@:U`74""lRBl5&9FD5Q*FEo!>Bk)7!Df0!(Gpa%.%15is
/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASqqaDe't<F`_>6F)5c'A1&L(+>Y-Y
A0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=(l/_+A,Et+CoV3E$043EbTK7F!,LGDBO%7AU,D/D]iq9
F<G+.F*)PF@N]r7F`JU7F`MM6DKI!n+D#G6Bl\-0D.RU,/g)9&Cht5<DfTB0+CT;%+Co%qBl7Km
+DG^9@3BH1D.7'sARlp)@rc""@q[!$De!3lAKZ).@<<W+F!+t5ART[lA0?)0ASrV_:IH=ADdd0t
/g)9/:IH=9F_u(?F(96)E--.DA8-+(CghT3D.Rd0@:s.m+CSl(ATAo0Ddd0jDJ()$@<?!mATJu4
Afu#$C1UmsF"SRX<+ohcDIn'7+DbIq+EMX9E$/t8@:XF%FD,5.F`_>6BlnVCA8,OqBl@ltEd98H
$4R>D@<-7"DJ)!QA9Da.+EM%5BlJ08+Ceht+C\n)G%G]>+DbJ,B4W3,D]ib9-Z^D=+D5V2A0>Ss
ARQ^'D]j1DAKYDtG@>c<+E_a:+=Joe3d<)++<X?r@:X(iB-:V*A9Da.+EM%5BlJ/:Bl8$2+A*bt
ATMp,Df-\/A8-.(EcW@5@;[2tEaa$&+A*bgDfQtDATE&=Cgh?sAKZ&(EbTK7F"Rn/.1HUn$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$;>AHA0>u-AKZ,;Bl%L*Bk;?.A8,OqBl@ltEd98H$7QDk:-pQUEcl7BFD,5.
F`_>6F!,"9D/^V=@rc:&F:AR2+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM81J
Bl%iCBkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qAS5RlATD4$AKZ,;Bl%i5@rcL/F!,L7An?!oDI[7!
%16'JAKYetF*&OAATMp$B4W2rBle60@<lEp+C]U=@3B*'D/^V=@rc:&F<G:=+CQC5ASl.!A7]d(
FDi:BAS5RlATD4$AKYK'Df]tBEb/ioEb0,uATKIH+A,Et+Co1rFD5Z2@<-'nF!,=.Bl8$$Bl5&;
DfTA2@rcL/F!,L7An?!oDI[7!+EV:*F<G"4AKZ,:ARlotDBNe)DL!@K@<loH+<XWsAKYK'Df]tB
Eb/ioEb0,uATJu&Eb-A2Dfd+CFDl22A0>T(+CoV3E-!.1DIal,F`VXI@V$[&ARfal@<?'k+CSl(
ATE!'Eb'5D%14Nn$;No?+ED%+ASu("@<?''F`_>6Bln'#F!+t5Df]tBEb/ioEb0,uATJu&DIal2
BQ&);Anc:,F<EF`D.Rd0@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R=O$;No?+DkP&
AKZ,;Bl%L*Bk;?.@3BT%@:UL!DJXS@A8,OqBl@ltEd8*$A8lU$F<Dr/76s=;:/"e<%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[kDdd0!C2[Vl$<1\M+E_d?Ch\!*ATJu)Bk)7!Df0!(Gp$gB+Du+A+Dbt)A7]9o
@;]Tu@rcL/F!,L7An?!oDI[7!+D>2,AKYGnASrW5E+EC!ARmD9+B38%@rH4'Ch7^"+EV:.+ED%7
FDl2.FD5Z2+E(j78l%htF)Q2A@q?cmDe*E%G@_n7Dg*=6Eb/[$AKYE!A0>],@:UK/C2[X!Ddd0*
+CT.u+=LuCA7T7pCi<`m.4u&:.1HVZ67sBjEb/[$AKYMt@ruF'DIIR"ATJ:fDIn$&+=CoBA8H0m
A1'GeC2dU'BHS[O8l%iR:K::[75&CoA8H0mA1&ff-YdR1+EMIDEarZ'@rGmh+Co1rFD5Z2@<-W@
%16uaG@VgDC2[WnAThm.@:U`I-u*^0FD)dEIS*C(;bpCk6U`YCDe*BiG&2)*A1&ff-YdR1+Co&,
ASc:(D.RU,+E2IF+Co1rFD5Z2@<-W@%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%htF)Q2A@q?cmDe*E%
A7]^kDIdf2Df-\9@VTIaFE8R=DBO%7AKZ,;Bl%L*Bk;?.A8,OqBl@ltEd98[+B3#gF!,L7CghF"
Df0W0BlG2/F!,=.Bl8$$Bl7Km+C]U=FD,5.E+*j%+E):2ATAo3AftVu@ruF'DIIR"ATKI5$7QDk
:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;?.%14m6De't<-OgCl$;No?+E)41DBL?BDe*[&
@:Uf0@;]Tu.!9WGCiaE2@:Uer$?'Gt4$"a(De*[&@:UL'FD5Q4Ci<`m-OgCl$;No?+Co2-E,8s.
+Co1rFD5Z2@<-W9Bl7O$Ec#6,Bl@ku$=mj]INTae%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+A,Et
+EMIDEarZ'@rGmh/g)99BOr;Y:IH=9Bk)7!Df0!(Gp$X?D/^V3F!,:-EbAr+@V'%XF`V+:BlkJ-
Df0Z*Bl7u7@3BW6@WQX"DKKT$C`m/'Dfor>+E(j7A8bt#D.RU,@<?4%DBNA*A0>u*F*&O8@<>p1
+A$YtD..]4FCArr+CQC)ATo86Df'''FE8RHD]ik7@:Uu"$7QDk:-pQUCi<`m+DPh*%14d43\V[=
C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
;IsKPDImisFCcS0De'u#Ec6#?+ED%*ATD@"@qB]j$:8<9DfTD3Eb/lpDImisFD5W*+DPh*-Z^D?
Ec6#?+ED%*ATD@"@qB^(Ci=6-+CT@7FD,5.DfB9*+Co1rFD5Z2@<-'nF"SRX<+ohc-u*[2Ci<`m
.3N/8@ruF'DIIR2+Du+A+D>2)+CQC5AS,LoASu!h+E1b2BHVD1@<<W+DI[L*A7]g).!9WGCiaE2
@:Uf>%14Nn$;No?+Du+>AKZ).AKWC9De*[&@:Uf0E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k8l%ht@rcL/F!,L7An?!oDI[7!+EqO9C`m8"E+Not+E)-?F`_>6Bln'#F"Rn/.1HVZ67sC$
AS5RlATD4$AKWC9De*[&@:Uf0@rcL/F!,L7An?!oDI[7!+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&
ATJ:f2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl$;No?+DkP&AKWC9De*[&@:Uf0@3BT%@:UL!
DJXS@A8,OqBl@ltEd8*$A8lU$F<Dr/76s=;:/"e<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!C2[Wn
ATeLi:2b>!Ch7]9F!,:;@:UKhDIal"Ec6#?+ED%*ATD@"@q?c2C2[WnAThm.@:Uf>+<W(IDe*Bi
G&2)*A18X8F!,[?@<<V`+CehrC`mh5AKW1-ATfYA@<lF)+tau\<+ohcA7]p9CghU#EZf(;+CQC3
F`\a:Bk)7!Df0!(Gp%3B@<<W5BlnD=Df-\>Df?h;AftM)DKTf*ATAo3Afu/:@:F%a+Co1rFD5Z2
@<-'nF"SS'F`M26B-:_rG%GK.E,B0(F<GL>Cj@.FBOr;sATfYA@<lF)+Cf(nDJ*O%/g)9>Dfm14
@;[3!@<6.!Gp%-=G&M/-+CQC'ATfYA@<lF)+Co1rFD5Z2@<-W9@X0)+Ci=B/DJ()+F=n"0.1HVZ
67sBjCi=B++E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0Bl5&'DfTl0@rri4@<?0*DfTB"EX`@3
+E(d5-RT?1De'tP3[\Z\A7T7pCi<`m+DPh*Ci<`m+E_d?CiaE2@:U_p$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqHDdd0!@;]Tu@rcL/F!,L7An?!oDI[61%14Nn$;No?+Dbt)A0<:8De*BiG&2)*A17rp0HiJ2
+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKDF!hD(%15is/g+kGF*2M7
+CT@7Ch7$rF<GL>AKYW+Dfp"AAU%p1FE8QV+Co%qBl7L'+E2IF+Co1rFD5Z2@<-W9E+*j%%16`g
E$-NCDe*d(-Tc`/+D5_6+=CoBA8c?5%13OO:-pQU@rcL/F!,L7An?!oDI[5e$8irQ/g)hjB5DKq
F!a'nI4cX_AThu7-RU#G$4R>;67sBkAThX$DfBQ)DKI"?@<?0*A8,OqBl@ltEbT*+%16W[A:>XT
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?''Ap%p+Gp$U8D/Ej%FCeu*C2[W*F(96)E--.1$<1\M
+A,Et+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'nF!,.)G%De6Dg*=5AS#a%Eb0<6DfTE"/g(T1%16'Q
+D58'ATD4$AKYT-Ci"A>@rH4$ASuU$A0>u7@:X(oBl@ltC`l=mF(96)E-*47Bl%@%+D,P4+EV:.
+Cf>,E,TW*DKKqBDe:,6BOr;Y:IH=HH#n(=D'4+BFWb1&DBNtBDBN@1F(96)E-*4DFDl22A0>T(
+EV:.+A,Et+Co1rFD5Z2@<-'nF"SRX<+oue+EMX9E$01DDK?qBBPDN1F(96)E-*]A$7QDk:-pQU
B4YslEaa'$+A,Et+EM%5BlJ/:Anc'mF!,17+D,b4Cj@.5Df'?&DKKH#+D,P4D(Z8)EbupH@WcC$
A86$nF)Q2A@q@"s$4R>;67sBjCi=B++Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+Aucg@;TQu8l%htCi<`m+Co1rFD5Z2@<-'nF"Rn/<+ohc8l%htF)Q2A@q?cmDe*E%A8,Oq
Bl@ltEbT*++CT;%+DtV)ARlo3C2[WnATfLF-u*[2.3N&:A0<:CFD5Q4.4u_c9jqpb+EV19F<G"0
A0>?(Bl%<&F(96)E--.DBl5&8BOu6r+Co1rFD5Z2@<-'nF!,=.CLnW2F(HJ4Afu2/ATME*DIIBn
F"SRX<,WmiBm+&1Bl8$2+A,Et+Cf>#AKY]/-Z^D=+D5V2A0>SsARQ^'D]iP.E-WR7DIal1AStpn
AKZ).AKYf-@:UKkBk)7!Df0!(Bk;?<+B<;hDf'?&DKI"0DIal1F`&=DBOr;uDes6.GA1r-+Dbb0
ATJu9D]iP.E-WR7DIal1AStpnAKZ).AKYf-@:UKkBk)7!Df0!(Bk;?<+:SYe$<KMk:.\2N3ZqEt
6VgEN78?f):JOSd+A#$F=\i$?6r+q#:K/H&9N";F6s1X'5upDs-u*[2A7]p5+=LuCA18We:.-3Q
F`_>6F"&5"8OHHK:JO2R8OZQ1%14Nn$;No?+E_RBAS5^uFCfJ%$;No?+>Y-\AS5O#4s2pJ-ZsNF
CiaE2@:UKqDe*[&@:UKqDe*BiG&2)*A0?#:Bl%i5C2[W*C2[WnATfF1$4R>;67sBjCh7$q+CT/5
+DPh*+EMIDEarZ'A8,OqBl@ltEbT*+%15is/g*o-FCdKU@rH4$@;]Us+CT;%+BN8pA8c[5+E):7
ASuU$A1euoDfQtCDJ=><F*VhKASlJt$;No?+ED%1Dg#\7@;]Tu@rH=3+Co2,ARfh#EbT*++DkP)
F^]*&GqKO5:-pQUF(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%i<.4chj
-OgDX67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1f-RgSo+t!g,:-pQU
F(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7p-RgSo+t!g,%15is/g+YB
E-WR:Bk)7!Df0!(Bk;?./Kc]X+E)4@Bl@l3@rH=#ATJu7AT;j,Eb/c(ASlC.Gp%0N@Us1nARfh#
EbT*++:SZQ67sC%BOu!r+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%j,Ddd0(.4chj
+<i0a-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4>ULsO-R'ZdAKWXO-OgDX67sC%BOu!r+=DDDDfBtE
+t"oiC2dU'BHS[O8l%iR:K::[79jSGA8H0mA1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1f
>ULsO-R'ZdAKWXO-OgDX67sC%BOu!r+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7p
Ci<`m-RgSo+s8'W/1>7P@<?0*-[nZ`6rQl];F<lXC2[WnATh<+.4chj+>7:K06noS$4R>;67sC$
AM%q6B5)F/ATAo;Bln#2DIn#7DIIBnEt&IO67sC$AS5Nr-ZsNFCi^sc-u*^0FD)dEIS*C(;bpCk
6Ub7&FD5Q4-Rh,)B4YslEa`c,F`_>6Bln'#F!hD(:-pQUEb/lo+=CoBA1'GeC2dU'BHS[O8l%iR
:K::[79jSGA1&ff-YdR1+EMIDEarZ'@rGmh-OgDX67sC$AS5Nr-YdR1A7]p34"+i_@<?0*-[nZ`
6rQl];F<lXC2[WnATfFM4""c]A0>DoG%GK.E,B0(F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*E"D..I1
%16'JBlbD5@:C@#BQ&*+A0>Q(G9D!G+Dbt)A0>E*D/^V=@rc:&FE9&W+A,Et+EMIDEarZ'@rGmh
+Co1rFD5Z2@<-'nF!,[<Eb-A0Ddd0fA1euI<,Wn%F(HJ9BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"
ATJu2@;BEsF*2M7+EV:.Gp$O9AKYl!D.R6#-u*[2A7]p5/0H?UDe(:>@;]Tu.!9WGCi_$X%13OO
8oJB\+@9LPATA4e9jr'PBHT&a0fTUL@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk%16igA8,q'Ec3]j
9L2!E8Q8AP4ZX]58l%ht-o!.n8T&WjDe+!#FD5Z2-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\
/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue+DbIq+DG_8
Ec5K2@qB^(FD,5.8l%htF*VhKASiPA+ED%:Bldir+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P
78d#Z;H#_>+>F<49L2!7:IA,\4ZX]>%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-\!BOQ!*BlbCh:IIDV$;+)^
+DGm>@3A/bGAhM4+EMXCEa`Tl+CT.u+ED%8EbT*.@;I'-H#n(=D(Z8)%16'JAKYGjF(o,,Bk1d`
+C\nqBl7H(8l%htBlbD=BOQ!*8g&(nDeF*!D/F!)B-:o0+C\o'F<Ga@ATq]r+CT=6DfTK!DJ=E2
DJ()#+Cf>+Ch7*uBl@l3De:,9DfTB0+EVNEE+O'%DfT\;@3BZ#F)*BN:NC)VDJ=E.A0>B#Ci!Zm
FD5Z2F!,C5+EqaEA9/l,@<Q3)@3B#jFED)7+DtV)ANCr%8OHHK:JO2R8OZQ$%14Nn$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqF:IH=>F!+m68g%PQA8c?<+<X6t+DGm>Bl8!6@;KakA0>T(+EV:.+=M\IA7TUr
F'N?hDImisCg:^nA18X1Ea`iqBHV5*+EV:.+CfP7Eb0-1+A*btH#n(=D'3G/Ch.*t+C]U=FD,5.
E+*6l@:s-oD..<jB4Z*+DfQt0Gp%6IH>.>;Bl7Q+FD,5.A8-+,EbT!*FD5Z2+F7a@+=LuCA1i1B
E%*C^+B3#c+Dtb8F<GC.@N]`6AT/c+DJ=3,@;KY(ATJu9BOr;Y:IH=HH#n(=D(Z8).1HVZ67sC'
F(Jl)@X0)<BPDN1Cggc^$?B]tF_Pl-+=Cc8Ch7Z1A8-',FCB6+-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
;flGgF<F1O6k'K&BPDN1F*(u4+EMX5Ecc@FFD,5.8l%htF*VhKASj%/$7QDk:-pQUF*(i2F<G=:
A0<HH@rc-hFCfM9D..L-ATAo*Bl%?'BkAK*ARf:mF('*7%17,eEHPu9AKW@5ASu("@;IT3De(4)
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMhgD/XT/+E)(,+DbIq+Co1rFD5Z2@<-'nEt&IK:IH=>F!,17F*(i,
Ch7-"GA2/4Dfp.E@;^?5A8,OqBl@ltEbT*+/g)8Z<,Wn%F(HId:IH=NDfm1>F`VXI@rc-hFCcS9
Df'&.A8,OqBl@ltEbT*+/g)99BPDN1CggcqF`V,8+D,P7EZeq<@;Tt"AKYMt@ruF'DIIR"ATJtB
Cggd%/0H?W@:EbYFt"sb.!0BQ.3N&:A0<:>CghU.ASrqL+<X9P6m-#S@ruF'DIIR"ATJu&Eb-A'
Eb/[$ARlp-Bln#2FD,5.-uNU?A18WFDIn#7A8,OqBl@ltEd8iOG%G]'/g(T1%15F5AoD^$+CfG'
@<?4$B-;#!@N]2q@ruF'DIIR"ATJu7ASl@/AKYE!Gp%'HBlA#7CggcqA8,OqBl@ltEbT*+/g+,,
BlbD<FCfD6A7]@eDIml3@3B]7Bl%L*Gp%3B@<<W9Bl%T.ATD4#AKYMt@ruF'DIIR"ATJu+Ec5e;
A7]@]F_l.BCi<flFD5Z2F"SS,F<G:=+EDUB+DG^9FD,5.DIn'7+EMX9E%W7B$4R>D5uLHL:.I>f
8Oah%84=Y#786TS;F+2`+A>'f+@Jdg<(Tk\5uL9C;]nG':/jMN:*<,'7ScoV5u^EO:*<\8<?OXp
;FM]o6;LT\+@K!J:/=h379DuG<E)C0<(KG#:.88a+A>'f+B)6.:a$8T.1HV^ASl@/AP?NA6tp.Q
Bl@ltEbT*+?YO7nA7%J\+>Y-$+>=63Ec5l<4Y@jlE+*j%+=DV\F(KA>%16f]/g*_T=%Q.0A8a(0
$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX>\\1fA8,OqF'NNi@Us%n+t!g,+<Y`=ASc0*-ZW`?
0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>\mhX+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eE
C2[WnBk)7+>]an0+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>]=LfH#R>4
+t!g,+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MZBl5@BA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_
F(K&t/g*_T<DH+f+CoCC%144#:-pQU@<QR'A0>>t@;]k%+DG^9E+*j%F!,C=+A?KeFa,$;DIaka
@:LF$H#n(=D0$-n+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A8,OqF"_?<@Us%n-OgD*+EM4-
Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05P'+-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dm
C2[WnBk)7+06D,X-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05t`9H#R>4-OgD*
+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=M)8@kVY4DKU1Q+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDo
Cia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9CggcqA8,Oq
Bl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@D
EbTH4+DbIq+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5+Co1rFD5Z2@<-'nF!*%WBkM=%
Eb-A)EcQ)=Et&I1+>=o`+>Y-YA0<6I%13OO:-pQUF`)52B5)F/ATAo%DL!@@@:C?iBk)7!Df0!(
Bk;?./Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+ED%+A0sJ_4$"a*@:EbYFs(U0@N]c2Gp%'B@<lg'
DC5l#%15is/g,1GD/XT/+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;?.@;]Tu@;Ka&@rH7,ASuU2+>"^M
B5VX.AKYQ)Ec5u>%16!ED/XT/9OVBuBk)7!Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\Q
F!,OGAT/c%Eb/[$ATJu9BOr;7Cggd%+CT.u+=M&7@Us%n.3N/8@ruF'DIIR"ATKI5$7QDk:-pQU
@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$8WfCA0<6I%13OO:-pQU@rc-hFCcRCCggd%+CT.u
+<W(K@:EbYFt"PEBk)7!Df0!(Bk;>p$>sF!A0<79@:CSn$>sF!A0<79@:EbYFsd_+%15is/g+tE
F*&O5G%#*$@:F%a+Co1rFD5Z2@<-'nEt&IpA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[nE+Np$DJ()#
+Cf5+F(oN)+Co1rFD5Z2@<-'nF"Rn/<+ohc8l%ht@rH4$@;]TuAoD]4DfB9*Bl7Q+@;]Tu@r-()
Bl7Q+A8,OqBl@ltEbT*++DGm>-uWWF+E)9C-uX'9DBNJ(@ruF'DIIR2.4u`8:IH=8Df'?"DIdf2
@<,p%F(fK4F<G"0A0>GlF*SmMD]j.IE+LX2$4R=jDe(:>@ps6tDfB9*+Co1rFD5Z2@<-'nF!+@L
5t"dP8Q8,$@;]Tu;FNl>:JOSd/g*H$+F.mJ+Dkh*BQPA.G]75(F<FIM5t"LD9N`KKBk)7!Df0!(
Bk;?.@ps7mDfd+2AKYJr@;]^hA0>?,+A,Et+Cf>,D..<mF"Rn/.1HVZ67sC!E+No0Eb/Zi06_GN
FCbmgDe't<Cggd`ATfF1$4R>;67sC!E+No0Eb/Zi05k`EGmt*9+E(d5-Z!4#-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l3;f?Ma+Cf>,D..<m+ED%8F`M@B@rGmh+C\c#Bk)2n$:/KE+A,Et+Cf>,D..<mF!,L7
FEMVA+C]86ARlp"BleA=Eb0<7Cij_N+B3#c+D,>.F*&O=FCf;3BlbD*+ED%8F`M@B@rGmh3Zoh*
.3N8ADe't=0I\,R@:Uu5+Aucf@;0UnDJ()+FCf<1+CT;%+Dk\2F(&]mF!+n/A1SjGF*1o-Cj@QS
ATDg0EZfC6CghEsA0>T(AoD^,@<?4%DD!%S8l%ht@rH4$@;]Us+E1n4AoD^,+D#e>ASuR'G%De)
EbBN3ASuT4@q]F`CM@[!/g)9.AfuA;FWb.6ART?s@3A0<6m,uXD/E^!A0>i-ARTXk+D#CuBl"o/
AKWC1@;BFpC1K=b5\FqBBl#D3Df$pG@;]TuFCf9)+Dk[4GA(E,+F.mJ+Co1s/e&.:%15is/g,4R
D.Oi$EcQ)9AT)^4+E)41DBNG-D/E^!A9/1eDe't<Bcpi$+CQC0Ble?0DJ()&Bk)7!Df0!(Gpa%.
%15is/g+V3A0>u>E+O)"$?'Gt3=Q<)$;No?+C\bi+ECn.CNBplDe'tH+>Y8j@W-04%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[nDJX$)AKXT@6m-#Y@s)X"DKK</Bl@ku$;+)^+D>2)+D#e>ASuR'G%DdEE+EQ0
+CoD#F_t]-FCB9*Df.0M8l%htA8bt#D.RU,@<?4%DBNFtDBND"+CSbiATMp(A0?)1FD)e=BOr;7
C2[WrASc<7+Eh=:@P/)s%14LuDe*NmCiCgGF)YQ3DK?q/+AbHq+ED%%A7]d(FCB6+/g*b^6m-Vn
AKXSmF!+t2DJ!TqF`M&(+AbHq+ED%%A7]d(Df-\!Bl7I"GB4m8DIak`Bl8'<+EMgLFCf<1+CT.u
+EV:.+<k`CASr\7F(f-$C`m5+D/E^!A0>f.+AH9SF"Rn/.1HVZ67sBkBle60@<itf:IH=9De!p,
ASuTuFD5Z2%16igA8#OjE$-hD$4R>;67sBsDe!3tBl@l3De:,/@;0U%8l%ht:ddbqA8bt#D.RU,
%16ih@<?0*-[oK7A8c@,>\@VcATD3q>\\1fA8bt#D.RU,>]=4cA8bs*%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[cBk)7!Df0!(Gp%'7FD,_)$<1\M+E)41DBNJ(@ruF'DIIR"ATJu4Afs]A6m-#OAnc-o+CQC6
ARTUhBHU`$A0>JqFCSu,E+*j%/g+,,AKWC3Bk/Y8-tI%%FD5Z2@<-W9Bk1dmFD5?$@psInDf.!H
G%G]'+Dbb5FE8RHBOr<*@<?08%14Nn$;No?+EM47G9Cj5FD)*jA8,Qs0F\?u$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$<1\M+Cob+A8,NrAoD^,+E(j7-tI%&.3NYBFEMVAF!,")FCAm"F!+n#Dfp.EFD,5.@rH7,
ASuU2+E(j7ART(^+Co1rFD5Z2@<-W9Df-\>BOr<*@<?08%14Nn$;No?+Co1rFD5Z2@<-W9A7]jk
Bl%i"$8<T5Bk/>?%13OO:-pQUA8,QsINU<e+<XEG/g+h9DIe#8Bk1prD%-g]$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l3;f?Ma+E(_(ARfg)DfTQ'DKK</Bl@ku$<1\M+A,Et+EMgLFCf;3BlbD*+Cf>,E,9*-AKYE!
A0>DoFCAm"ARlopG[YH.Ch4`-Afu#$C1Ums+E):7ASuU$A0>i3DeF*!D/F!)B-:o++A+7/+B3#c
+EMgLFCf;3@rH7+BleB;+E(j7@3BH1D.7's+E(j7@r,RpF(KD8-ua3<AncL$A0?)1FD)dE@;9^k
-RgYj+BN5fDBO%7AKZ&>F*(u1+Dbt)A9/l%+Eh16Bk;C3+E(j7DdmHm@ruc7@<,p%@rc-hFCeu8
+<XWsAKYGjF(o,,@<,jkBlmorFEMV8+DGm>@3BDqBl5&(Bk)7!Df0!(Gp%$7C1Ums+EV:*F<G(3
DKK<$DK?q4Dfp(CF*1r1@VTIaFE9&W7:B\>+E)41DBNJ(@ruF'DIIR2+DGm>@;L"'+CT>4De!Ki
FCeu*GA2/4+CQC'Bl[cpFDl2F+E(_(ARfg7+@KpaARfh#Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlol
DIal#ATMs6Dg>o)+CT=6Eb065Bl[cq/e&.:%15is/g,(AC1UmsF!+q'B5)7$Bl7Q+GA2/4+=CT4
De(4<@<,p%FD,5.8l%ht@r,RpF(KDF%16T`DJUFL%13OO:-pQU8l%ht@rH7+BleB;+E(j7F(okA
@UX=l@j#]!C1UmsF!+n/A0><%%15is/g,">DL!@8Bl[cpFDl2F+E(_(ARfh'+CT=6FD,6+AKYE%
AKYr#FD)e2FCf<1/e&.tDf0A60b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+ohcE-67FA8,OqBl@ltEd8d;
Df0&rE-)Nr<+ohcAnc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+DGm>F)Y]#Bjkg1+<X6t+DGm>
FD,5.Df0B:+<Y3/@ruF'DIIR2+EV:*F<G(%DBND"+Dl%-BkD'jA0>?,+A,Et+Cf>,D..<mF"SRX
6=jY8F`V+:D/XK;+Co1rFD5Z2@<-W9D/Ws!Anba`FD5Z2F!+n3AKYr7F=2,P8K_MOCht59BPDN1
A8,OqBl@ltEd8dLBOr;1E-67H+Co1rFD5Z2@<-WG%13OO8TZ>$+DG\3DfTr.DKI"CD]j1?A7]e&
FCB&t+EV:*F<GjIFWb1&DBO(CAKZ).AKYK$DKKH-FE8RCAfu2/AKYo5BOu3,A8,OqBl@ltEbT*+
+E)-?FD,5.E+*j%+C]J8+F.mJ+CehtDJsV>@q]:gB4W3-BOu$'Bl5&%DL!@K@<jI7$7QDk:-pQU
Anc:,F<GO2FD)e-Bk)7!Df0!(Gp$gB+EV:.+E2IF+Co1rFD5Z2@<-W&$=mj]+>=63%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@C0\@<?4$B-;)'G9CF1@ruF'DIIR"ATKI5$:8<9DfTD3D/Ws!ApJ*.B-;;0AKYK$
DKKH-FE8RCAftN"Gp$X3@ruF'DIIR2+DbV2-Z^D?Eb/[$AKYD(DIn#7,'7aK+s:E1@ruF'DIIR2
+CT.u+DkP&AKY]/+EV:.+E2IF+Co1rFD5Z2@<-WG%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@lt
EbT*+%14m6De't<-OgCl$;No?+CfG'@<?''.!0BQ.1HW%ATqZ--Zj9P-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$;FrEAKWCCDg<cS@3BN3F<G+.@ruF'DIIR2/e&.:%15is/g,(OASrW4Dg<lVCggd`ATf2)
DIal+@:C?2+EVOI+DGm>FD,5.E-67FA8,OqBl@ltEd8*$De'tP3[]#fGp$p3@Us%n+DbIq-OgCl
$;No?+DG_7F`M%9FDlFIBlbD;ART+&GB.D>AISuWE-#T4+=C&U5t"dP8Q8,+%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[fATW$.DJ()#DIal/F`__>DJ()9DfTB0/e&.ZDBO%7AKYT!EcZ=FF(Jj'Bl@l38K`(_
Bk/>Y:IH=>F!+m6GAhM4+EMXCEa`Tl+CT.u+ED%8EbT*.@;I'-H#n(=D(ZqR:2b>!G@_n*Eb-A6
ART+p+EVNE-ua<N.3N&:A0<:5ATT@DF)Po,+EqaEA90@4$4R>3Bl\9:+CfG'@<?''F)Po,+EqaE
A9/l8D]j+CDfTDA%14Nn$;No?+CfG'@<?''F)Po,+EqaEA9/1eEa`irDf%Wu+?qS7+>GPq0eb:(
+AP6U+Du==ATDKp+Du+?D@HqpAU&;[3ZoelBPDN1BlbD*+EV19F<GL6+EV:.+E)./+E2IDAKZ).
Bl7Q2%16]`Ddda/4ZX]@+=eQ\+>GQ(,;Cl+%170%D.7F"F$2Q,F#kEk+E).-AKYi.Eb-A;Bln#2
An>OiBl7Q2%16Q_G\(DK3ZpO/0d(0_+>P&q%17,aFD5Z2@;L!J3Zp.20H_kg,p4U"3b^2h0edi$
+C60J0F\A3DJ<U!A7[nb+E]^f-Zj$9F!,1<+Du+A+E_R9@rGmh-OgDo@:Nt63Zob%4s1sj+<VdL
+<VdL:-pQUFCAZnF<G"&G%G]'%16ZkE,95uBllL!+>b3%+>=63:-pQUAU&01Bk(k!+Eh=:@LWZh
+=f&eGmt*0%13OOGAhM4F$2Q,4$"a0@;]UoD'3q3G]Y'?Ci<a(F!,OLD.7F"F!+q1G\(D.Eaa'(
Df0!"F!,UCBk)'lAKYPm@qZurG]7J5@qg$4%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-ua<N.3N>G+EV:.
+A,Et+Cf>,D..<m+EV:*F<GXHDfTE1+EqaEA90@4$4R>@@<Q3)@;]TuATD4#AKZ).AKZ28Eb'5D
+<XWlCLnW0Df'&.FD5T'+EVNE@rH7.Bl7El+F.mJEcYf.Afu2/@<<W6BOr<1DfTB0+D>2,AKYGn
ASrW%Eaa$#A0>>mAoD^$+E2@>@qB4^Bl7Q9%14Nn$4R>;67sC%@<Q3)GAhM4Et&IqF`\aMDfTB0
%13OO:-pQUATD4#AKYMpAnc-sFD5Z2Et&IfEaa$#+EqaEA9/1e%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15jK
G9Cp;FE2),G%De<BOr<-FDl22A0?)7Eb'56@;]Tu@q]F`CER_4@<<W6BOuH3@<,p%E,ol9ATDU4
+ED%7FDl22A1e;u.1HVZ67sBnATT&=DfTB0%16`ZF<GdGEb'5#$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>c
@s)X"DKK</Bl@l30eb<k$;YPN+E(j7D0[7CATT&6AS$$rF!,1<+E_R4De!p,ASuU$A0>B#A7Znn
$4R>5Dg*=BAoqU%+D>2,AKZ8:FWb@+A0>u4+D,%lAKYZ/DIdd!A90:ED..^!AKZ).Dfp,0DIdf>
+E(j7Ch[cuF!,C5+Cf>#AKZ22FD)e7@<-W9@3B&uD/Ej%F<G:8+EM70BQPjL6Z6gYASuU2+CT;%
+Du+>+D,P4+EqO:E-!.1DIal&Bl\$8/T#':/g+,)Ci!g'B-:]&D/Ej%FE8R5Eb-A%+D>2"Ci*U$
CERP-+D5V2A0>B#A7[A&$4R>7:IH=EEc6,8A7]g)@3BH1D.7's+E(j7G@>c<+EVNEA8bt#D.RU,
+EqaEA90@G=(l/_+CQC:DfTA2BlbD2DKKo;A9DBnA0>T.-Z^D=+D5V2A0>SsARQ^'D]j+CDfTD3
@3BW)DfTqBDf0,/Ch[cu+Co&)@rc:&FD5Z2+E(j7FD,5.GAhM4/e&.:%15is/g,4WDfTD3F(fK4
F<GdGEb$;'ATM@%BlJ0.Df0V*$8<S^+E2IF+=D2<DId[&-T`\r@;]UoD'3P1FCf)rEZfI4@VfU'
%13OO0H`=tE-67F-Y6^rBI>kh@;p1%Bk;?.Ch74#+CT;'F_t]-F<G[D+CT;2@<iu0FCf<1-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$;Y7V@rHL1F(HJ>Dfm14@;[32Bk;K2H#IhG+EMXCEb/c(A7]glEbTK7
Bl@m1+EqOABHS^9ATT@R%14Nn$;No?+D58-+EM47Ec`F8G]7J-DIIX$Df0V*$8<S^+D58-+=D2<
DId[&-T`\e@:Nsu%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9lG&`+Co&*@;0OhA0>E$@s)X"DKK</Bl@l3
@ps6t@V$['FDl22A0>;uA0>o(FE2),G%G2:+B3#gF!,OGAT/c.Ddd0t+CQC5ARTChF*),++D#e+
D/a<&+E(j7GAhM4+CoD#F_t]-FCB9*Df-\3DKKe>FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8d9
DIal3BOu'(A8-+(CghU1+EqOABHS^6Ble5B/e&-s$7KG!F)WQNBlbD*+A,Et+E_d?Ch\!:/g)9.
F<G:=+EV:.+E).6Gp%9AEag/5BOQ!*Eb0?8Ec,q-$=P&eBOPpi@ru:&+Dbb5F<DuUBOu'(F*1u&
ATMp)F_iKLBl8!6ART*lDe:,6BOr</F*1o-+C]86ARlo3Eaq1S@;L't.1HV5%15is/g+tK@:XF%
-t?q!DJ*O%FE/fQ@;]Tu-t?q!DJ*O%FE/fQA8bt#D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?
F`\a:Bk)7!Df0!(Gmt+%@rc:&F<Dr[@:WneDKB&qASu("@;K1`De**fDe*Zm@WPdj@:Eem@;Tt"
AM>em/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\QF!,OGAT2]5A8-+(CghU1+EV:.+Dbt6B-:`'
@s)X"DKI";Ddd0fA0>T(+EV:.+E2@4G%kl;F!,OGAT072$7QDk:-pQUF(fK9+Dbt6B-:`'@s)X"
DKK</Bl@ku$8<S_+Co2-E$-N<BOPdkATMs6-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39lG&`+E2IFFD5W*
+CT.u+D58-FD5W*/e&.9E-67O+CT.u+=Ll6F=A>@Eb-A5F_Pr/+D,G$G\LW'AKYE!A0>AjDBO"B
DfTD3ASuU(Eb-A0De!3lATKIH+B3#c+Dbt+@;KLr+Ceht+C\n)DIIBnA0>f2+Du==@V'RkA1e;u
.1HVZ67sC%@<Q3)FD,5.-t-k/A8PajALSa<De!3lAM7P0@<6K4Bl5%;FDlFK%14IkC2[X"@;BF%
+E2IF+F8>s3Zr<V?X[\fA8PajAR?Qo/g)t[$4R>;67sC$ATVs,AThW-FD,5.-t-k/A8PajALSaG
DfTB0+DG_8D]iJ++=DDYGUFVMDe!3lAIStoG^+H\+D58-+F8>C$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkh
@<,jkBl7Q+AoD]4GAhM4Et&IMBkq9&D/XK;+EMXCEa`Tl+EMgLFCf<1+A,Et+E2@>G%kJuF!,('
@qfanFD5<-+D,P4+EM+&EarcsDJ()6BOr;rDf0Z.DKKqBDe:,+FE8R8@<>pe@<6!4%13OO<+ohc
D..-r+EM+&Earc*@rH4$@;]TuBlbCFA8Z34+=Lc7@ruF'DIIR2+DtV)AKYf'F*)IP/e&.:%15is
/g+tEF*&O5Cht59BOr<1DfTB0+E)-?FD,5.E+*j%+C\npBl7g&DJ()9Bln#2-Y.?I%16ocF*&OQ
/g+\BC`k*9FXIV*%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14LoDJUaE@ps6tF(Jd#@qZusDfQtEDfTB0/0K%G
F*)IS+D5_5F`;CQ+EM[>FCfM9@;]TuD.-ppDf[NR+B3#gF!,OGAT/c%Eb/[$ATJu8Df'&.B6%p5
E-!.1DIal3BOu'(Ch[s4F!+n-C`mh5AKYW+Dfp#?+E)-?FD,5.E+*j%+EV:*F<G%(B5)6+GA2/4
+=BcW6miEN.1HVZ67sBjEb/[$AKZ&4D.Oi&Ec6)>Et&IhEc<-KF*)G:DJ+#<4""NO@;]^hF*)FM
%16`gE$-NEDe!m#F*&ckDJWZgC2[X"@;BF]+DEGb%13OO:-pQUB6%p5E-!.2AS5^pDJ=!$+EqOA
BHS[=Ddt.($8N_Y+CoA++=CuD@j_]m%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+BN5bF<G"4AKZ).ATME*Ap&!/
Gp$O9B6A'&DKI"=F_tT!EcXGS$:9"\DJs_AH#IgJBOQ'q+E2@>@UW_^Gp%!CFD55rA0>u-@<<W/
@;^?58l%ht@rH4$@;]Us+EV%-AKY])FCf)rEZee2B6A'&DKKqP+<X9P6m,oYB6A'&DKI"2De*F#
+CT;%+E(j7@UX=l@ps1iGp%3BEb/f)FEqh:F"AGP@VTIaF<G(3A7]g5+E)4@Bl@l3@rGmhF!+n/
A0>l7@;KXiBk;=+/e&-s$<1\M+E(_(ARfh'+A,Et+EMXCEb0;7@;]TuEb0?5Bk;I!F!+n-C`mD"
G%De7@VTIaF<G(3A7]g7+<XWsAKYl%G]Y'M@:F%a+Co2-E,8s.F!+(N6m-DWC1Ums+Cf>#ATJ:f
.1HVZ67sBQ:IH=D@VTIaF<G(3A7]fk$7J"\0Hb'^+>tYk/1r&,3[\!);FDX,78m/.7oE,_:`r\:
8Q8,$9gM-E:EW%s6W?WQ:-hc\-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;YV_Bl@l3@;]TuEHP]+BkD'j
EZek1A7]g)F(K0!@rri%DIal,De*QoGp%$EFD5Z2F"SRX<+oig+CT;%+CT)&+DG_8AS5RpF"SS)
DfQt;DfTD3Bl7O$Ec#6,Bl@l3@:F.tF<G"4B6A'&DKI"2De*F#+ED%%A0=K?6mm$uDf0B*DIjr$
De!p,ASuTuFD5Z2/e&-s$;PM`+Dbt7CER&-+EMI<AKYi.Eb-@AA8Z34+Cf>,D..<mF"Rn/.1HVZ
67sB/B6%p5E%E,ME-,f4DBLYV/Ken=FCSu,E,oN%Bm;'L/KeP3F(HJ2@<?U&EcVZs1*A:oA8Z3+
-Yt.>$4R>;67sB/D.-ppD_*#LE-,f4DBL\W/Keq>D.Oi"Df0Z*Bl7u7F*)G:DJ(C@/KeqL+DkOs
Ec6"AH"D(,$8`k\+CoA++=CT<-OgCl$;No?+DkP&AKYD(D.-ppD]iJ+A0>r)@<,jk+CSnkBl4@e
1a$a[F<Dr>EcPf+-Taq!6W-KP<*s'KDe*3:-Vcu\+DlBHA8`T.DffZ,DJ((a+DkOsEc3<7$4R>!
+>P'MDJUFC@<*_)$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMGiDfp#?+CT.u+EM[>FCfM&$;+)^+E2@>G%kJu
F!+m6F(oK1Ch4`5@<iu;D]i\5Dfp"AGAhM4F!+n/A0>u*F*)IU+<WrmB6%p5E$/k9+CQC&Des6$
@ruF'DBNk0+A*c#DfTB0/g)9&+EM[>FCcS/F!+m6@rH1"ARfgrDf-\9Afs\gFCfN8+EM%5BlJ08
/g)9>Dfm14Eb/[$AKYE!A0>`-A8,Y$+D5_5F`;CE@;]TuF*22=ATJu<Bln#2FD,5.-tdR>.3NeF
EagX1$7QDk:-pQU@rc-hFCcS'+D5_5F`8IAAfu;9Eb'56GA2/4+DtV)ATJu'AS5^pDJ=!$+EqOA
BHS[4BI=5rB6%r6-Zip@FD#W4F`8]N4!8r(+CoA++=CZ4-OgCl$;No?+CfG'@<?''@3BZ'F*%iu
0d(FXF<DrEASc1$GAhM<A1'Gd0d'[C-RVM^6m-S_F*)IG@<,p%8g&1bEbTK7F!,R<@<<W4ATW'8
DBLZT-RU8N$4R>;67sBjEb/[$AKYD(FCfN8+EM[>FCcRH+Du+>AKYf#Aoo/(EbBN3ASuT4@rGmh
%14m6B6%r6-Zip@FE;S=FCcgB4!8r(+>G!LDJUFC-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht
+Dbb5F<G[=AKYK$DKKH-FE8RCAft`,Dfp#?+E)9CF*22=ATJu<Bln#2-tdR>.1HV5%15is/g+tE
F*&O7Df0Z.DKKqBDe:,6ATMs+Ec6)>+D5_5F`7csB6%r6-Zip@FD#W4F`8];$4R>;67sBjDf0Z.
DKKqBDe:,6ATMs7F_Pr//0JhKFCcS9F_Pr/+Cf>#AKYf#Aoo/(EbBN3ASuT!$8Wf;Ec<-KFCfN8
F*22=AL@oo%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&IPDIjr/Afu2/
AKYhuBl5&%A9MC!FCAfnF!,C5+EMXCEbTE(+A*bdDe*E%Bl5%c:IH=KF"SSD+E2.*Bl5&7@rc:&
F<G:=+EV:*F<GjIFWb1&DBNe)Bl8$$Bl5&%+B(j,7nc>oG%G]8Bl@l3De:,#+EqaEA1SjFATMrE
+D5_5F`8IAEZfFGBlmo/@;]TuFD,6'+D58'ATD4$AKYhuDL!?s+Dbt)A0>r'EbTK7F!,R<@<<W7
F(HJ)Bk)7!Df0!(Gp%$7C1UmsF"SS'@<>pe@<6!&A7]grB5V:$F!+t$Cht59BPDN1,&_@1+Eh=:
F(oQ1+E(j7FD,5.FE2MGBJ(J<$4R>ABOr;uDes6.GA1r-+DG_7ATDm6+CQC6Bl7R"AKZ28Eb$;,
DBL?LDg<cSB6%p5E-!.1DIal3BOu'(B4YslEaa'$F!,O6EbTK7F"Rn/.1HVZ67sBsAS-$,C3=T>
BkDW5FCAWpAKZ/-EafIbChe*6F?MZ4+=AK]3ZpI3>p+MI,%!'R+DEGP0d\S>-s[s,/g+@I.1HUn
$;No?+EMXCEb-A-DBNn@F<G+.@ruF'DIIR2%17&sF<DrIC3=T>-OgCl$;No?+DG_7ATDl8Bl5&%
Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?+:SZ+I4cWt+ED%:D]gDT.3N&0A7oq%-9`P7-Z!O?F*&c=
$4R>;67sBsDf9E6E$-QLAThu@+DG^9C2[W8E+EQ'GA2/4+=LuCA8#OjE%)5'%15is/g+e<DImis
FCcS'Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?+:SZ3+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g+k?
+EV:.+DbV$F<G"4B6A'&DKI"8F!,%1Bk1dc+EV:.+D5_5F`;CE@<,p%D.-sd+DG_8D]gHEDdd0*
+EM%5BlJ08%15is/g,"IF!a'nI4cWt+ED%:D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^@rcL/%16'C
F),hJ+Dbb-AKZ,7A79RoDJ())ASu("@<?'k+EM%5BlJ08/0JG2DBND"+EM76E,96#Bk:ftGA2/4
+A,Et+DkOsEc6"O+<Wrm8l%htD.-ppD]ib8+CT.1@<,gkFE1f1Gp#^%F(96)E-*4EBOQ!*@ps6t
@V$ZoATVEqARlolDIal$G\(B-FCeu*GA2/4+=M8I.4u&:.1HVZ67sBt@:O=r+EV:*F<G4-DImis
FCfM9@;Ka&E-67FA8,OqBl@ltEd8d?Ec6)>Et&IkDe*]n@rcKN3ZoeF67sBnASu("@<?''@;Ka&
E-67FA8,OqBl@ltEd8d?Ec6)>F!iM47P#o@+Dkq9-9`Q#/g)nlEb0E4-RU8h+=@U*%15is/g,4W
DfTD3D.-ppD]gVS@rGmh+>PYoFCf9)F!+(N6m-SbBlbD2F!+m68g&1bEbTK7%14p7E-67F-Z*:-
AT2d6B6%s4-Ta(<4)/\ED.-ppD[d$_$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;u"aDJ=!$+CQBb:IH=B@:O=r
+DGm>@3BW*D/a<&+DkP/FCfJ8De:,1E+Np$DJ()6BOr;pE,]i9E,oZ$FCcS*Bk)7!Df0!(Bk;?.
@;]TuF`V87B-8UCD(-SZ+EDUB+DkOsEc3Q>$7QDk:-pQUAn?'oBHU`$A0>H.ARfk)AKVEhEbupH
D..3kE-688Ec?(I%13OO:-pQUAn?'oBHU`$A0>H.ARfk)AKZ&.Ch7L+Cj@-T+EqO9C`mY6Cj@.6
Ble60@<iu,G]7J5@qg%1+Cf>#AKYo6FDuAE%15is/g)kkEbupHD..3kE-688Ec?(I%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k9jqOPDf[%0Eb-A2Dfd+BATMs6Bk)6rA0>u4+A*bt@rc:&FE9&W+B`W*+Ceht
+CT)-D]j+CDfTD385r;W/0IVp<+T/_+BV?3/0In\=B$go9gMZM6r-lZ/0Iql7Q;N!DIakV=]@g4
F(96)E--.DBl5%c:IH=9Bk)7!Df0!(Bk;?<+<XHtCj@-q+EM%5BlJ08+Ceht+C\n)Ecl7BBQ&*+
G%G\H%14Nn$;No?+EMXCEb-@e@8pf?+=K!#.3N&:A0=EB9hZZX1,C@%FCf]=Et&I5+E2IF+=Cu6
FCf\E4#/QQ-S@#(+A?3CAQU'bDe*E%/hSb(%13OO1a$a[F<DrEFDYhA4#/TR-Qk#o/g*\a9hZ[>
De*E%/hSb(%13OO:-pQUF*)>@AKY)L9H[b]A0><$@VKq)@<-W9<(0ng+=L]EFCfMB/e&.E+E2IF
+=DDNCaV;H9h\o&C2[Wi4"!.4ATMrWFD,B0+DGm>Cgh0l+F%a>4>1efF*'Sn%13OO:-pQU6<R8V
+DGm>F`(o2FCfK3Eb0?(A0>?,FCfM9@;]Tu@ps6tF*)>@AKYGrDIIR"ATJtG+Du+>+ED%'Df'?&
DId<h+D,P4+DbJ,B4W2tBl%@%/e&.E+E2IF+=BKI:+&+Y2EPqj@:W_RC2[Wi+DPk(FD)dEIUQbt
Df0W$B4YslEa`chC2[WfC2IC#FCfJFBkh6-%13OO:-pQU@X3',+EM7CAKYo'+DkOsEc2Bo1a"M1
+D58-+=BKI:+$JX%15is/g,">@rcK1FCf]=+EVmJATJu&Eb-A'Df0Z*DKKqBBl5&8BOr<'@;0U%
8l%ht@r,RpEt&IK;aXGS:fLe1C2[Wi/0IVP<(0nr@;9^k?S!<j<)$%n@;9^k?S!=%9h\o&C2[Wi
/0In\=B&X9C2[Wi/0I8^<(1/&C2[Wi/0IYQ;G0DR=&*+2C2[Wi/0Iql7Q=a`C2[Wi%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[kDdd0jDJ()&Bk)7!Df0!(Gp$X?D/^V=@rc:&F:ARVD]iS%D/X<5FE1f3AKYo5
BOu3,8l%htAn>CmF`M&7+EqB>DImBi+EMI<AKZ28Eb'56Bl5&3F`JU8Bk)7!Df0!(GqL3^<+ohc
DIn'7+EMX9E$/t8@:XF%-u<=$A9Da./no'A.4u&:.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>\s
@N]2q@ruF'DIIR2+CoV3E$043EbTK7/e&.:%15is/g+kGF*2M7+Cf>1Eb/a&+E1b2BFP;eA0<rp
-Zj9P+DbIqA7]p,Cggd#+BosE+E(d5-RT?1%15is/g+tK@:UKkF_u(?F(96)E-)Nr0HiJ2+?XCX
@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Cggdo05P'+A9Da./no'A-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$:K#RE$043EbTK7F!,"3+Du+>+EMXCEb-A;DfTA2Eb/ioEb0,uATKIH+B3#cGp$sHF*&O6
AKYVsDImisFCeu8%14Nn$;No?+E_X6@<?''GAhM4+ED%*ATD@"@qB^(/Kf+JDg*=9Bl\9:+>k9Y
ATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu>-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37r3*Q@;I',
AS,LoASu!hEt&IK:IH==@<3Q'@:O"fBln'#F!,(5EZek#EcQG>DJ()1F`\aIFCB9*@j#YtD.Ohu
DII@,F(o\<Df-[i+EqaEA9/l%DIal3ATMs7/e&-s$<1\M+=Ll=Ddmc:+CT.u+=MARATK:CG%G]'
F!+n/@;L48AKYE!A0>r8DfTD3DIIBn+ED%*ATD@"@qB^6%14Nn$;No?+CT.rCjC><+DtV)ATJ:f
B4Z0--Y.:?@<<k+$4R>;67sBjCghC+BkDW5DIIBn+E_a:+DG^9@UX=h+Dbt+@;KKtGAhM4%14gE
+D5M/@WNY>A92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%166VFWb1&DBO(@A79Rk+D5M/@UX'qGAhM4
+ED%*ATD@"@qB^6%14Nn$;No?+>=pPF!,R<AKZ28Eb$;&De*E%/Kf+VDfTE1+D5M/@UX'qEb/io
Eb0,uATJ:f0Hb"EDdmc1-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$F`V,8.3NYBFE2),G%G_;
F*)>@ARlp(AS,LoASu!hF"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!+D,P4+=LcAFCB8?%176!
ATJtAA92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+F(KDA+C\nlDf'',+Eh=:Gp";RF(Js+Ca(!G
BOu'(@;Ka&GAhM4F!,.)G%De;FDl22A0>o(An?!oDI[7!/e&.:%15is/g+kGF*2M7+EVOI+DGm>
FD,5.E-67FA8,OqBl@ltEd8*$De'tP3[]#fGp$p3@Us%n+DbIq-QlV91E^UH+=ANG$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@Hq$F`V,8.3N,/DBNt2FEMVA+DkP)Gp%-=An?!oDI[6#Ch[s4F!+n5+E).-AM,*)
BOr<-@;TQuE+*j%+EM+&Earc*D.R3j@;]e#D'3P6+E_a:A0>K&EZfC6FE2),G%ki,+ED%*ATD@"
@qB^6%14Nn$;No?+D5M/@UX'qEb/ioEb0,uATJu4Afu;9Eb'56@V'1dDJj0+B-;D4FD)dED'oc"
:-pQUF`V,8+FPjbA8Z3+-Z(4?$4R>;67sBnCi<ckC`mb0An?!oDI[7!+E(j7GAhM4F!,%3A8,po
+EqOABHS[D-OgE*F(KD8I4cWr+>Y-NDJU\A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+ohcF`V,8+E_R9
Df-!k:N1DiDf-[R0d(CH+=MARATK:CEb0?8Ec,q@FD,5.F`V,8/TkrFDf-\9AftM)GAhM4/g)99
BOr</F(KDEF`(o3DBNY7+C\c#Bk(RfCj@.3+E_R9EHPh8Ch[s4+CT)&+EV:.+EqaEA9/l3DBO%7
AKYJkCht59Eb/f)De:,#+EqaEA1e;u.1HVZ67sC'F(KD8F`(o3DBNk0+EVgG+EqaEA9/1e1GL"p
F(KD84$"a!@;Ke!Df0V=F*2A@Bldj,ATTUR%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;#/
@:UL%@rc:&FE7lu8l%ht@ps6tB4YslEaa'$+A*bmDdd0!F(96)E--.DAo_g,+Co1rFD5Z2@<-W9
B6%p5E-!WS+B3#c+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'
DIIR2-Z^DO@rc:&F<GXI@Us1nARfh#Ed98H$7QDk:-pQUB4YslEaa'$+Dbt)A0>r'EbTK7%16rg
F!)iOF`)&7Df-pF+<XEG/g,4XDD,jFDf-\<Bldi.F(KG&$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqiCi^_-
E,]B+A9/l+ASu("@<?'k+EM%5BlJ08+EVNEFD,5.@s)g4ASuT4F`V,7-Z^DOFCB33F`8sIC3(M0
Bl%?'F)N1CBOuH3@ps6t@V$ZuDdd0fA0>T(A7]^kDId<rFDQ4FDe:+a:IHfE$4R>;DffPO+Dkq9
+EM%5BlJ08+CT;%+CSekARlp*D]hkV6;0s<?YWpjDfQssF^f0$@p`tX+D,P4+EV:.+CfP7Eb0-1
+E_a:E\7e..1HVZ67sBsDdd0!B4YslEaa'$A0>r'EbTK7%16oi@:UK.F*2A;Df9M@%13OO@ps1j
Df9N7+>PW*2'=#:67sBmF_kk:-o!.n+CT.u+Dtb7+=Jom+Dl%8DK?q7DBL\g0f9CI%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@g!\ATD4$Bl7Q+F(96)E--.DDf-\.ASkjnA.8l<:IH=8@;[2rCiaM;B4YslEaa'$
+CT.u+Dbt)A0>r'EbTK7F!,[@FD,T8F<G(6ART[pDJ().Ddd0!F(96)E--.R%14Nn$;No?+Dbt)
A0>>iF(o,,F*(i4BleB1@ric*Ec6)>%16oa+=CW>FCB94-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7KOu
FE2UT+Dbt)A9/l%Cht59BOr<1DfTB0+CehrCh7-"@X0))+D5D3ASrW7DfTA@%14Nn$;No?+Dbt)
A0>;sC`mq?Eb'56DImBi+EVNEEcl7B-tIC@@<<q-$>3plEd/]SA92j$F=.M)%13OO:-pQUCi<`m
+DG_8D]iJ/@VKq)@<-W9Ci<flCh7Ys$;No?+=D5P@<?=(@j`C3ATVs;+=C]@FCB8=%15is/g)N%
3@>q^ATVs;+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[a@:O(eDJ()7E$/S,A0>o(F*)>@Bl7Q+
A8,OqBl@ltEbT*+%15^'6m-2b+Cno&@:EYdAKYT'EZdssGAhM4F"AGT@rc:&FE8R5DIal.FD,6+
+E2@4@qfk(F!,FBDeF*!D'3q3G]\!Z+<XBsF*&O8@<>pe@<6!&F*VhKASlK2BOQ'q+Dk[uDK?q4
DfQt0@:O(eDJ()7E$/S,A0>o(F*)>@Bl7Q+A79Rg@UX=hF!+n/A0=K?6m-#YATJu&F!,[<Cht^H
+B3#c+=M2;@r#U(+Eh=:@N],g@r$4+F!,UE+CQC'@<>pe@<6!4%14Nn$;No?+ELt7AKYD(@UWb^
F`8IAAfu2/AKYK*EcP`/F<GOFF<G+.@ruF'DIIR2%17&_@r#Tt-Zj9P-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$7Kk%@r#U(+Cf>/Bk;?.FD,5.@s)g4ASuT4A8,OqBl@ltEd8d>Bl%@%+EVNEFD,5.@UWb^
F`8IEF^elqEb/a&DfU+G@;]TuE,oN%Bm=31+CT)&+EV:.+D,>(ATJu<Bln#2@3B]1BlS9,+D#_-
EZf(6@rc-hF(oN)+C\bhCNXS=DKTf*ATBC4$7QDk:-pQUCh[s4+E2IF+Co1rFD5Z2@<-W9@UWb^
F`8I8Bl%@%%15Ei8Q%]4+F?.r/g)9):dJ&O?XH`2?XHE$6uQOL+<Ve%67sC"F`\a:Bl[cpFDl2F
%16W[EZd\794)$m6qL9--Rp`_C1\h9+<VdL+<VdL+<Ve%67sBi@:O(qE$/b,Ch7Ys$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@Hq$Eb0<6A18XAATMs3Eb0;7FD,5.CghC,+C\bhCNXS=@X0);ASbpfFD5W*+C\bh
CNXS=Anc'mF!,[@FD)e=BOr<"BkM*jF*&ODEb/isGV0F4.1HVZ67sC$ATMs3Eb-A0@<6N5@UWb^
F`7csEb0<6A0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^CM@[!+CQC6@rc:&F<G+:D/]pk-u`U)
CLek:@rc-hFCfM9@VK^gEd8d:@:O(qE-!WS+B`W*+Ceht+CT)-D]iLt@r$4++Co1rFD5Z2@<-'n
F!+n4+CoV3E$043EbTK7F"SRX7!3?c+EM%5BlJ08+CT;%+EM77B5D-%8g&1bEbTK7F!,R<@<<W%
@;[2sAKZ,:ARlp*D]iLt@r$4+/0JG@E-WR7DIal,ATDEp+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBk
F_u(?@;Ka&FD,5.GAhM4F!,C=+EV:.+E1b2BHU`)+CQC6Bl7R"AKYN+D/^V=@rc:&F=n"0FDlG8
F_u(\3ZrKWDg-//F)t\sC2[Wi+DkP&AKW?J%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=(l/_+EqB>Ci<`m
+=M>MH";&7E%)oDDKKe>@3BH!G9CF1@ruF'DIIR2+E(_1ATDs*+D>\;+EV:.+E1b2BHV#1+Cf(n
DJ*Nk/g+,,AKYMt@ruF'DIIR"ATJu-@<Q3)@V'+g+Dk\1B4YU+%14Nn$;No?+Dtb7+Co1rFD5Z2
@<-W&$>sF!A0<7=CghU.ASrk<>9G^EDe't<-OgCl$;No?+E)41D@HqkA0<7=CghU.ASrk)$4R>;
67sBsDdd0!.!0BQA9Da..1HV<+Z_;"4<Q_43ZrN_H";&7E"*-`$;No?+Co1rFD5Z2@<-W9Bl7O$
Ec#6,Bl@ku$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMD_DII?(GAhM4Et&IZDfm1?Dg*=;@<Q3)
F)Po,+DG@t@3BK#+EqL-F<F1O6m-2b+CT)&+CS_tF`]5Y<,WmqARTUs+Dl%;AKZ#)@:UKQ:IHRO
+CoD#F_t]-FCB9*Df-\+DIal1F`&=DBOr<)FD,6++A,Et+DbIqF"SS,AfuA;FWb@+G%De)DL!@D
Ec5E'ASlK>+E;O8F*),7DK?q=EZek1D/a<"Bl8$6+E2..@<6!&ASkjiC`mS++CT@7@UX%`Eb],F
3C%4o@;0O1@rH2n$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj9jr'PBHT&a0fTUL
.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>WDe*g-De<^"AMPu8
67sa&De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.
Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,
05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._
67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7
BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8
AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,j
DJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.
AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is
/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,
Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQis
AKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[
:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)
+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkji
CcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3
Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/
A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7
Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is
/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd
%16WbF(KG9-W3B378uuM-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6
B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4
EbT&q+@S[c:JOha9LU'U+EM+9+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j
:-pQU:.\/V3ZqpTEcP`/FDQ4F779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC
.3K',779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGG
A7]"UDe*E3AU%c1-OgDX67sBL6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1
.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^
=%GbX76sX>4ZX]I0Hb]b4$"a&Df'&.GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl
$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"A
DIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu
-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7Qfn
ASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$
0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QW
De*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$
3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\f
A7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C
-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9
$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?
/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;u
BkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!+
+FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4
Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T
8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8
F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5
E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gI
E-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT
3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*
Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?
+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4
$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6
%16ci4ZX]?+D>S1DJUG"3Zri'+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1Ums
F!,17+ED%:Bldir+E):2ATAo*Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU
+<VdLBQ>4N+<XEG/g+eIDfp#?%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s
+>Y-$+>=63BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'
BP_X*C`n-Y+En8%3XlF1AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&C
DIb@/$@*b-CiF9.+F##U/g,Qp+En8%.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5
B-:W#A0>]&F*&OA@<?!mBl7Q+GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#
@q[!/DfTA2F(fK4F<G[:G]Y&;$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5
F`8IEBQ%p5+EV1>F:ARP67sB'1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47
Ec`FGAU&;>%16ciF$2Q,1E\_$0F\@C+D>h;+F+D'3XlF1AhG38@:XCg?X[\fA7$I'4Y@k%+CoA+
+=ANZ+<Y35/g,?\Eb0?8Ec*KPASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;
+ClT;+<VdL+<VdL+<Ve;D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2
/g*_<+=Jd%Gpsjd/h\D'5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'
HQXXf4s4AF$7QDk%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KL
A1&KB+<VdL+<Ve%67sC)DfT@t$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K
67sB'0d(ORAU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E44ZX]A+?CW!%14d3F)5E4+F+D'
3XlF1AhG38@:Wka?X[\fA7$I#CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($
E-67FGroVPEcZ>4Df'?&DKK5m8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1r
FD5Z2@<-W9GAhM4+CfG1F)rIEAS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k
?Qa5L/g,1GG&JKN-Qlr</g,$SEb0?8Ec*KPASu$2%14M$/1tum+<u=X/M9+=HQk0eF$2-0+D5M/
@WNk[+Ds=pI4fCH$7QDk%15is/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@
CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@
$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD
/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?
G%#30AISufBQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV
9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&Is
ART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5
.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/
><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc't
Blmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4
Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM<
/0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*
5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$
ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk1
4?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO
.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q
/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.
FCf]=05Y--Ec6".$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U+=]!cG]XB%D/)3p
>p)3O1,0t[+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%67sB1/o>$;CLh@-
D@HqiGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:
G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.
0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3
+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:
Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2.6qWi%13OO:-pQUDKTf*ATAo3Afu#$C1UmsF!*%W
F`V,)+C]U=G%#E*Dfp+D.!9WGCi_$JD.-ppDf[$LF(or3E-67R+CSnoE-67R+>,9!.3N>:+E2@4
F(K62%15j+6;p$.+>GPZ$4R>;67sBkF_u(?A9)C-AKWQIF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=
F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`-OgCl$;No?+CoV3E$0+.FD,_<
/Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+YP<(K/5
+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[<(K/5+=AgWDe(M9De*g-G%>`4E-!Z[%13OO
:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,+=MASBl%i>+DkOsEc3'K@r,^bEc?/C.3N>:
+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a$4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.D
F`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4
Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'n
F!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd
+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!
-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupH
E,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I%16igA9Ds)Eas$*Anbme@;@VQ:-pQ_C2[X*F(KB%
Df00$B4>:b+EK+d+D#e+D/a<&+A,Et+E_a:EZek1DJ!TqF`Lo4Bl@l3F(96)E-*]A$;No?%15is
/g+,,BlbC>F(96)E-*4:F!)T:G\(B-FCeu*@V'.iEb-@c:IH=D@VTIaFE8QI@<,p%@rc-hFCeu8
+A$Ya$;No?+Ceht+C\n)F`V,)+EVNEEb/cmAnc-o+CT.u+CfP8FDl#1H=\4B@<-(#F`S[8CghC+
+Du+?DK@EQ<,W3Q:-pQUD..3k+<Yc>BlbD<@rc:&F<D]7@ruF.AKW+9AStpnAKY]/+EVNEC2[X*
F(KB%Df00$B.dn5F!+n/A.8l@67sBjDfBtEBlkmKGA2/4+F.mJEZeq(BlnDI+EVNEFD,5.D..-r
+DPh*+Co2,ARfh#Ed9\T$;No?%15is/g,UOA7TUrF'N?hDImisCg:^nA.8l@67r]S:-pQU<+ohc
DJsZ8F!,:5F*(u(+C\nuDg*=4Eb-A+Df9//@ps7cBk1XoATJu+DfQt@ARo@aBl7X,Bl@lA%13OO
:-pQUF)>i<FDuAE+=CoBA9Ds)Eas$*Anbm1Bkh]3AU%crF`_>8B-8fZ/gh)8%15is/g*tY7Nc__
@:Wqi+DG^9C2[X*FD5P6@r,RpF!*%W@s)g4ASuT4F(KH8Bl7Q+BlbD=BOr;sAS,@nCige1Bl[cp
FDl2F%15is/g+bEEZfI;AKY&gDId[0F!,X;EcYr5DBNk0+@0OV@V$Z[ART+\E\8J4ATMF)+D,P4
+E)@8ATAni6q/;>ART+\EcVZs:-pQU:ddcN76s=1;I<jIDe+!4Bl%->3[[9U>YoHZB6%Et+@^']
ATJtBGW7T1>X;n=@V&e1@rcKs@<<ViART+\EZdb;>Z,-AA7]dd6"=qR;IhR=/nK9=-OgCl$;No?
+ED%7ATT%e-Z^D,6q/;>ART+\EZfIB+DkP/@qZuW:IHRO+AbHq+ED%%A7]d(/KeSB+D,P4+=Lu7
Df0W7Ch551G\&<5$;No?+AbHq;Is9IATD-m?TgFm:ddcN76s=1;I<jIDe+!4Bl%,c$4R>;67sBh
Cij6/DIIX$G%DddBQ%s6F(96)E-*44Df'H%FD53#AKZ#)@:Wqi%15is/g*tY7T)Z@6q(!\@;9^k
F`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>XrIGF*)&;D-U^pG%kN3>\A,$Bk;KE1+m-_AL@oo%15is
/g*u2AS,LoEb/c(G@b5+@WHC2F(KA7Bl5&.De+!4Bl"o%CghC++>"^HAS,@nCige$Bl7I"GB4lr
Bl[cSDg3C8Bl[cpFDl2F%15is/g+4s="muiC2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm9lG>l
Ci!N&7VQmSAoDp!Anc9sAoDoHAU%c6%13OO:-pQU;e9HWDId0rGp%<B@N]-#Dg-86EZf(6+DPh*
F`_>6+Cf4rF)rHU+Co%q@<HC.+BN8pA8c[5+Co2,ARfh#Ed8*$:-pQU='&HX?X[\fA9E!.CgT=d
-UTq":i^JeEa`f-7VQ[MF'M:SFCfK1ATT%`G]7J;Eb08r8OZ`X9M\PT/k&l2-OgCl$;No?+B2os
F<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0
F!,OLF*(u1Et&IO67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.
Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$:R?M:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,V
Bl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%16r\CLoh@F(o,V:IJ/nF*)IY0ht%f
.W&U0AO9gHBk'b26r[`=FE8RG/M/)^@;BEs8l%ht@UX=l@j#l)F*&OG@rc:&F=n"0:-pQB$;No?
+B3#gF!,O6EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+C\c#
Bk%SZ:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5
B-:o++<Yc>AISuA67sB/@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16
Eb/rtDK@E>$;No?%15is/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\K
BlbC>+Cf>-FE2;9Ch7-"+C]U*$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlot
Afr3E<(0_b6Vg]W<%/r$G[k;rA9/l8BOqV[:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[Wl
@<6-mFCfN8F"&5QF_Pr//e&._67r]S:-pQU@<6L4D.RcL%15is/g)8Z%15is/g)8Z0e"52+Cf>-
Anbn#Eb/c(8g%YYEb/a&DfU+GIS*C(<(0_b%15is/e&._67sC(ATD6gFD5SQ+EVNEF`V+:A8aL<
$;No?%15is/g)8Z:-pQUB4YslEaa'$+EM%5BlJ/'$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6
F!i)7+>Y-YA0<6I%15is/g)8ZEbupHD..3k6=FqL@nKNb<+U,mF!hD(:-pQU%15is/g)8Z:-pQU
Ecl7BBljdk:-pQU+<W'd+Z_A-+?XCX@<?0*-[nZ`6rZTR<%gRHF(o,V:IJ/nF*)IUBkh]:%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>H3=Q<j67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE!Ddd0!-YdR1FCfN8ATB.-$>j3eAQ*GaCLp+66r[`=FE92l
:-pQ_D..3k;f-GgAP,`d<+U,mF!,NU/Ken=CLnV\:IH=HD/X3$+EV19F<GX7EbTK7/db??/db??
/g+,,BlbD<@rc:&F<G4-DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m-Pf
Deink:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5
B-:o++<Yc>AI;1!/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4
ASGdpF"Rep67rU?67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>
+<Y04DKKo;Ci!Zn+<Y-=$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlotAfr3E
<(0_b6Vg]W<%/r$G[k;rA9/l8BOqNG67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*p+Deip+
ATMs7.3N\SBlmo=$;No?$;No?+CT>4F_t]23XSVK/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?C3=>H3=8MJ/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4
-XpM*AL@h$Ddd0!-YdR1FCfN8ATB.*D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj
5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-SR/5/ibpM+>"^HATfF1
$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0A
Et&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(
F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)
Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2E+EQk
DdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16ig
A8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>
0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!
%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2
@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@
+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<o
DJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.
-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'
Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^
6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe
$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G
$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!
+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4
ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*
$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$
@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM
6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50J5@<3B8rE
%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y
3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi
05>E9/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,
+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>3DfQt;
DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?
BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f
89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp
%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16
EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._
:-CWc0J5@<3B8u?/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29
-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+
@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOT
Bkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS
:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?
D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%
@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3
F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LG
D/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'
+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.
@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i6
8g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%ht
F)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.
+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>
Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<
+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq
+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBk
ASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*
Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*
$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$
@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%13                                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebU10fU:2+>G_r1,pC30H`/-+>G\q1,0n,0H`,0+>GSn2)6:/1*AD0+>GPm1G^..1E\M/+?(E!
1*ALu1bp15+>Y\o0ea_*1*A;0+>Yr!0fL412BX_5+>Pht0eje+2BX_7+>Yhs0fL421.k>16<-TN
6qBmJ<)6CpEb/`lDKI!n:IH=7F_PZ&+D>J1FDl2F+Dbt/8l%iS:JXY_6<-TN6qBmJ<)6CpEb/`l
DKI!n:IJ/X:J=\0@WcC$A0>Q"F*)>@Gp$pAB2;uXATDs*A4:NZDfTo.F_;h5DeC2$DIal1ATMg/
DKBB1@WcC$A86$nA8-+,EbT!*FD5Z2Ap%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<hF_PZ&C2[Ws
C3+N:A79RkF!+t2D/Ej%FCeu*C2[WsC3(M=@rc:&FE8R=DBN\4A7oUu+Co2,ARfh#Ed;,:Bl%<p
De+!.BlnQ>Blmo/8l%htF`(o8+EV19FE8RHD]j+C@:s:lB-:`!Eb/a&DfTQ'F(f9/FDl2FC2[WT
:IH=6A7TUr+D>J1FDl2F/p)>[+DG^9D..I#A8c[0BPDO0DfU,<De*Bs@nKNb6r-0M9gqfV+CSek
Df-\2BleB7Ed99ZG]Y'BDBNe)Ebf3(GA_/6A7B+kFA+te<(U%_762P`:IH<R1FXG5ATMr9:i]uS
FD55rF)#W(A9Da.9L2!E8Q8AP3Zq$j6m*m5.3MQ-F`Lu'+@C'XAKXB`D/^Ur@rc:&FE;28A8,q'
Ec4W;6<$NU9LUub8l%ht-o!.n8T&WjDe+!#FD5Z2C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>
Anc'mC2[X*F(KB%Df00$B4>:bAU%X#E,9).8l%htF`V,7+Cf>-Anbn#Eaa'(Df-\=@rc:&FDYH%
AO9gHBk'b26r[`=FE;;-CLnV\:IH=7@<6-m+EV19F<GX7EbTK7D..3k;f-GgAP,`d<+U,mF)>?$
AKXT@6m-PfDeio,FCfN8+EM%5BlJ02@;]dkATMs.De)I+9H\1\DJ<]oF*&O:DfQsm:IH=6A7TUr
D..<rAn?%*C2[WnDe!p,ASuT^5tiD<@;]dkATMr9AoD]48l%iC:IA,V78?f)@:WneDJ`g"BkCpt
FD>`)F)Q2A@qA7u9H\1\DJ<]oF*&O:DfQsm:IJ,W<Dl1Q+CSekDf,                     ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' buildjod CR CRLF JADDONJODPATH JADDONJODROOTlinux JADDONJ'
zz=:zz,'ODROOTmac JADDONJODROOTwin JADDONJODSOURCEPATH JODTOOLSBUILDCNT JOD'
zz=:zz,'TOOLSVERSION JODTOOLSVMD JODVMD LF TAB TEMPFILE0 afterstr alltrim a'
zz=:zz,'llwhitetrim beforestr betweenstrs blkaft buildjodcompressed buildjo'
zz=:zz,'dtoolscompressed changenqt changestr charsub ctl dblquote decomm de'
zz=:zz,'whitejscript fexist fwrite jodsystempath jpathsep justfileext lastj'
zz=:zz,'odhistoryversion md5fromstring md5manifest read releasejod setbuild'
zz=:zz,'dirs setjaddoncopy setjaddonpaths setjodinterface showpass smoutput'
zz=:zz,' timestamp toCRLF toHOST toJ tstamp updateJODTOOLSfiles updateJODfi'
zz=:zz,'les updatejoddistribution updatejodmanifest updatejodsourcedumps wi'
zz=:zz,'e write''),(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS C'
zz=:zz,'NMFPARMS CNMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENT'
zz=:zz,'SSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001'
zz=:zz,' ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR'
zz=:zz,'011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 '
zz=:zz,'ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FRE'
zz=:zz,'ESPACE GROUP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJO'
zz=:zz,'Dinterface JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JO'
zz=:zz,'DVMD JSCRIPT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTER'
zz=:zz,'PARMS MAXEXPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK00'
zz=:zz,'4 OK005 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL '
zz=:zz,'PATHSHOWDEL PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TA'
zz=:zz,'B TEST TEXT UNION UTF8 WORD XML afterstr alltrim badappend badblia '
zz=:zz,'badbu badcl badfl badil badjr badlocn badobj badrc badreps badsts b'
zz=:zz,'adunique beforestr bget bnl boxopen catrefs cd changestr checknames'
zz=:zz,' checknttab checknttab2 checknttab3 createjod createmast ctl datefr'
zz=:zz,'num dblquote decomm defzface del destroyjod did didnum dnl dpset dp'
zz=:zz,'table empdnl fex firstone fod fopix gdeps get globals globs grp gsm'
zz=:zz,'akeq guids guidsx host hostsep isempty islocref jappend jcr jcreate'
zz=:zz,' jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace jus'
zz=:zz,'tdrv justpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark'
zz=:zz,' nc newd nlargs now nowfd obidfile od ok packd plt put quote read r'
zz=:zz,'eadnoun readobid regd remast restd rv rxs saveobid second tc trimnl'
zz=:zz,' tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '' j'
zz=:zz,'oddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DI'
zz=:zz,'RVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR'
zz=:zz,'206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 OK201 R'
zz=:zz,'EFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyfiles creat'
zz=:zz,'edl dbakf dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropb'
zz=:zz,'akdir dropdir dropinv dropnc dropref gettstamps justdrvpath libstat'
zz=:zz,'us loadbakdir loaddir loadnc loadref loadstamps maxback movefile nu'
zz=:zz,'mmask packdict packspace puttstamps renamefiles restdict restspace '
zz=:zz,'savedir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake '
zz=:zz,'DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR015'
zz=:zz,'1 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 E'
zz=:zz,'RR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER '
zz=:zz,'OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWIT'
zz=:zz,'CH WRAPTMPWID btclfrcl clearso clfrbtcl createmk dec85 dumpdictdoc '
zz=:zz,'dumpdoc dumpgs dumpheader dumpntstamps dumptext dumptm dumptrailer '
zz=:zz,'dumpwords extscopes fap fmtdumptext fromascii85 getallts getascii85'
zz=:zz,' halfbits htclip jnb jscript jscriptdefs makedump makegs masknb nam'
zz=:zz,'ecats nlfrrle nounlrep opaqnames parsecode putallts rlefrnl sexpin '
zz=:zz,'sonl tabit toascii85 uqtsingle wraplinear wrdglobals writeijs wttex'
zz=:zz,'t''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CN'
zz=:zz,'EXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINI'
zz=:zz,'T ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ER'
zz=:zz,'R059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068'
zz=:zz,' ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR'
zz=:zz,'079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 '
zz=:zz,'ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR0'
zz=:zz,'98 ERR099 ERR100 ERR101 ERR102 ERR103 ERR104 INVGROUPS INVMACROS IN'
zz=:zz,'VSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055'
zz=:zz,' OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTI'
zz=:zz,'T READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwor'
zz=:zz,'ds badcn bnlsearch bnums checkntstamp checkopen checkpath checkput '
zz=:zz,'closedict createst defwords delstuff delwordrefs didstats dnlsearch'
zz=:zz,' dupnames freedisk freedisklinux freediskmac freediskwin fullmonty '
zz=:zz,'getdicdoc getdocument getexplain getgstext getntstamp getobjects ge'
zz=:zz,'trefs gslistnl inputdict invappend invdelete invfetch invreplace is'
zz=:zz,'lib iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscr'
zz=:zz,'eate loadalldirs loadallrefs loadwords mainddir mnlsearch newdparms'
zz=:zz,' newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict p'
zz=:zz,'athnl pathref putdicdoc putexplain putgs putntstamp puttable puttex'
zz=:zz,'ts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub''),(<<;.'
zz=:zz,'_1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 '
zz=:zz,'ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES I'
zz=:zz,'zJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK'
zz=:zz,'00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING'
zz=:zz,'00400 WORDTESTS addgrp addloadscript addloadscript1 allnames allref'
zz=:zz,'s betweenidx createjodtools dayage delgrp firstcomment firstperiod '
zz=:zz,'fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames on'
zz=:zz,'lycomments pr refnames revonex today todayno updatepublic usedby yy'
zz=:zz,'yymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSON'
zz=:zz,'LY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 '
zz=:zz,'ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinte'
zz=:zz,'rface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK02'
zz=:zz,'51 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SC'
zz=:zz,'RIPTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj '
zz=:zz,'createut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 '
zz=:zz,'doctext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfr'
zz=:zz,'eader qt reb revo rm rtt textform2''                                '
zz=:6065{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`,1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
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
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?
+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=
<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/
0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dK
ASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23u
A90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F
<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl
4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*
@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI
-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(n
EcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O
-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloq
Bl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z
+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2
Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*
F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'
6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[WnDdlI./g)WYDe*Bs
@N]/4/KeS<Eb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.4u&::-pQB
$;No?+@KpaARfh#Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlp-BOu'(A8,OqBl@ltEbT*++CT;%+E)41
DIm>f$;No?+CT.u+Co&)FE2;FARlp-BOu'(FD,62+CT;%+Cf5+F(Jl7+<X'dEb/a&DfU+GDdmHm
@ruc7@rH7,@;0Tg$;No?+CQC6ATT&5Aftu0F`)7C@;]TuG%G]'F!,R<@<<W/@;]LdAKWHTBkh6&
Anc'm+Co2,ARfh#EbT*+/e&._67r]S:-pQU8T&W]Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z
-uEC1Gp%!CF`)7C@<,p%Bl7HqEb/a&Cj@.1?QaB#An?!oDI[6g.1HVZ67sB'+Co(oCi=B++<VdL
+Cf5+F(HJ)Bk)7!Df0!(Gp$^5Ch4%_:-pQU+<Y3,DfB9*+<VdL+<YTAASrW$Bk)7!Df0!(Gp$^5
Ch4%_:-pQU+<Y3,E$-8G+<VdL+<Y3/Eb/a&DfU+GAnc'm+E1b2BQFUi:-pQU+<Y34@r<D3+<VdL
+<YQ1D.Oi.Aftr!Bl5&(Bl[cpFDl2F+Cf>,E,TW*DKI"=Dfoq,$;No?+<Ve;DJ=><+<VdL+<VeE
@;TQuDe:,/@;0U%A8-'q@ruX0Gp$g=A7^!.DJsZ8%15is/g)8ZA8Z9p+<VdL+<VdLDIIBn+E(j7
@r,RpF!,@=F`%Wq:-pQU+<Y34DJ^L=+<VdL+<YiAF(o*"AKYo#C1Ums+DtV)ATJ:f:-pQU+<Y38
DfB6$EZcJI+<Y69@<6!&A8-'q@ruX0Gp%!CF`)70$;No?+<Ve;Ec5o7@ium:+<Ve<Eaa$#+Cf4r
F)s!VH#R=;DJsZ8Et&IO67sB'+CoM2E,oN%+<VdL+D#S%F(HJ7AS,LoASu!h+Du+?DK?6o:-pQU
+<Y<.FEDSG@;Tt)+<Y]9@:XF%@rc-hFD5Z2+CT.u+DbJ-FDuAE+Cno&AKZ)/D.Rd1@;Tt)%15is
/g)8ZCi<`mA8-',+<VdLCi<`m+Co2,ARfh#Ed8*$:-pQU+<YK=@:X7c+<VdL+<YK=@:UL)DfTA2
@;]TuD.-ppD]iP+@<6KCFEqh:Et&IO67sB'+Dbt)A9)6n+<VdL+Dbt)A0>o(An?!oDI[7!%15is
/g)8ZCi<`mF*(i-E-!-ECi<`m+EV=7AKZ&9@;Tt)%15is/g)8ZE+*6lA8,Oq+<VdLE+*6lF!,"-
@ruF'DIIR2+CT.u+ELt7ATJu4Ch+Z#Bl%@%+CT=6@3B#f@r$4+%15is/g)8ZE+*6lF)YPtAKW*<
FCfN8F!,(5EZfFGAnGaeBk;1(+C\bhCNXS=F)YPtAISuA67sB'+E2IFFE;P4D/aP=+E_X6@<?''
Bl8**Ecbl'+CfG'@<?4%DBNA*A0>\sF*)ADF<G[>D.Rd1@;Tt)%15is/g)8ZEb0<6A8,Oq+<VdL
Eb0<6DfTE1+Dl%<F<GU8@qBP"+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA8,Oq.1HVZ67sB'+ED%7
FE;D0@q?c*+EV19FE8R:DfQtAF_56"@qfLlF<GU8F*)>@AKZ&5@:NjX$;No?+<VeJ@<Q3mBlY==
+<VeJ@<Q3)A8-'q@ruX0Gmt*U67sB'+ELt7ATD?o+<VdL+ELt7AKZ#)An?!oDI[7!%15is/e&._
67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'A8bp"Ea`iuAKW`^0J,%:3@PCE%16T`
@r,RpF!)i=C2[WnDdk('$=e!gDKBB0F<Dr>C2[X(FDl22-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki
8l%icDdji"AT23uA7]Y#+Co%qBl7X,Bl@m1%13OO:-pQUA8-'q@ruX0Gp%!CF`&=>@;TQuE,oN%
Bm=31%15Kp;GKqb4ZY\e/mg=U-QlJd;FDX,78m/.7oE,_:`r\:8Q8,$9gM-E:F?SY%15is/g+\=
Eb/a&DfU+GDJsZ8+EM[;AncL$F!*%WDfTB"EZf4-FED)7Et&IE<)Z@j6V]d*4?G0&0d%hd<)Xo2
=<Kt+-OgCl$;No?+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt
$7Its-U^O(<)Xo-8Q&,^+@Je!6V]!X4ZX]J+u(3f3Zpg^;GKqb+=nil4te$H<)Z@j6V\'t%15is
/g,%?D.Oi"CghC++CT.u+DkOsEc3(BH#R=;DJsZ8+DtV)ATJ:f6qL9O6TmIm4"akp+=A:5:JsSU
6Qf)h6W-]T6RN<M%15is/g,1GAn?!oDI[6#DdmHm@ruc$$:IH`;FXDE3]oJV?SNZN+BM?:6rHHC
+B1d.<)Q.S-OgCl$;No?+ED%*ATD@"@q?d)Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*
DKI"=Dfoq?DIIBnEt&I)4$"`e77L6T+AtWt8Q[*577KX>-Rh2>+?Ui&+FH3m6qL9S7SY'W-8%J8
+@K1-8Q\>T%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(D..3k:-pQU.V`m4D..3k+CcuT+EM%5BlJ/:
D..3oDJ((=+Cf>#AKYhuDJ='4CghF"Df.TYAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g+,,
BlbD<F^eis@<6K4A7]@eDIml3F`_>6Bln'#F!,(5EZf4-CM@[!+EM%5BlJ08+D,Y4D'08p:-pQU
B6%p5E-!.1DIal2F_Pr/F"SRX8TZ(`CiaM;@rH7,@;0V#+Cf>#AKYT'EZee.@;L48Bl7Q+%15is
/g,%?D.Oi1AS,LoASu!hF!,17+A*c#DfTB0/g(T1:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84S
ATD7$3XlEk67sB'+D58-@;Kb%F!)SJ+<Ve>ATVu9@;Ka&FD5T'F*(i-E,uHq:-pQU+<YN0CLq%!
D/^U?+<VdLA9Da.F!,C1C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD
@;BFeF!)SJ+<VdL+DkP&AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+DtV)ARf.jF!)SJ
+<Ve:CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#AISuA67sB'+E2IF@;Kb%F!)SJ+<VeGF`_[I@;Ka&
FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8l?$;No?+<VeNFED)=F<D\K+<VdL+EqaEA0>;uA0>u*
F*&OHAU&;+$;No?+<VeNEb&g!Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^
A7Z2W:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*]nCLnW/@;]^h+>G`-
/MT7G.1HUn$=e!aCghC++=CT4De*]nCLnk&$=e!gDKBB0F<D\R@;9^k-OgCl$;No?.V*+0ASu$i
DKKqBGV(KiDdmHm@ruc7GA2/4+Co%qBl7X,Bl@l3A7]^kDId<r@qfLq%13OO:-pQUFCAg'+A,Et
+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\-OgCl$;No?
+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo$<L+k:fL.c
=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'@VTIaF:ARU
:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4AR]drCh.T0
B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5B6%r<4s2%%
+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3
F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17+EV:.+EM%5
@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7/12fP+DEGb
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@
ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE-QmANF<Db[
+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6DKI!K-XpM*
ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*ATD?m+EM%5
@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT7h#e7$;No?
.V3L.A7]^kDId<rFE7lu%16igA92j2Eb/!4/h1USA92j2Eb-A'/M/)dFDl2.B4W3(@VTIaF<G(0
@<6KN+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sBOBk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg
@UX=h04np7AKZ&>F*(u1+E_a:A0>u4+EMXCEb,[e:-pQUA8,OqBl@ltEd8dG@VTIaFE9&W;Isf`
@:O"hB-;;0BlbD,CghC++DGm>@;Ka&FD,*)-Z]_(:-pQUEb065Bl[cq+EVNE@q]:gB4W3-BOr;s
Bk)7!Df0!(Gp%0MDfT9!AKZ&>F*(u1/e&._67r]S:-pQU<b6;\+DG_8ATDBk@q@\1$;No?+<Ve:
BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(
BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`
CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2
%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL
+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4
Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1r
FD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdL
F(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#
D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*
$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>
ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU
+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!h
Et&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4
FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not
+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'
+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+
@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE
+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$
:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22
+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE
@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,
+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<
@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#
D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28
Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._
67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO
@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki
8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$
D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(
AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"
+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H
76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k
%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3i
FD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRt
ATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78
+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY
83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*
$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&
$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`
<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'
$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E
:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ
4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O
74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:*9uQ%15is/g,7VBl+u5BkM+$+=M>P@;0OlDJ(C@
E+*j%+Co&"Bl.R+ATDi7+Xefh4Y@jR5u^BC78+-tEc>Q2EbTAR3aEjQINViU+>#2g><3lV/h^H^
+Ab@'845m?,$uHU+C,E`%15is/h1FMA7T7jASu$iDKKr7De*s.DesJi67sa&De*s.DesJ;@kB8T
A7]dqG%G2,FDl)6F!+t/@<6KN+D#e>ASuR'Df-\9AfrL:De+!4Bl#4N%15is/e&._67sBPDKKH1
Amo1\+EqaEA90d@$;No?+<Y*'A7oq%+<Ve8A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=AKW*<
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y*/Ci3ZuATJu(Df&rt
DIml3DIIBnF!,(8Df$UFEb/j#@;TRs.3N&:A0<:=@W#UkATK:C+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<Y*/CiX*!F!)T6Cht53@;TRs+ED%*ATD@"@qB0n@X0)7@VTIaFE8RCDBNh*
D.Oi+BleA=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y3+ChId-+<VeIASl@/AKZ28
Eb'5EFCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<Y<.FE2UK+<Ve>ATT&8AT;j,Eb/c(FDi:5G\(B-FCcR;+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y?6E,KJ7+<Ve;Ble60@<lo:F(fK4
F<G+*F(96)E-,f4DK?q=Afu#$C1UmsF!,C=+=MLa+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
:-pQU+DPh*@:s-o+<Y3'H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u+CfG'@<?4%DBNk0+A,Et+E(_(
ARfh'%15is/g)9ODe*NmCiCL>+Co2-E,8s.+E).6Bl7K)8l%htBOu"!+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'ChFk5+<VdL+DkP&AKYE!A0>],@:UKQ:IH=<Ec6)>+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D/=89+<VdL+DkP&AKYf-@:UL%
@rc:&F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9SDe404+<VdLEb0?8
Ec,q@@3BB#F*&OCAfu#$C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9SDffW4E$-8GGAhM4F!,CA+EV19FE8R:Ec5e;.![6aFD,*)+CT;%+Du+>
+DG^9B6%p5E-!.?EZfFGBlmp-+<VdL+<VdL+<VdL+<Vd9$;No?+<YQD+<VdL+<Ve>ATVu9DIIBn
+CT.u+EV1>F<G19Df$V.A8--.GA1r*Dg-7F+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<YQG+<VdL+<Ve<A8--.@3BH!G9CIAE,95uBlkJADfTA2F`V87B-9fB6m,uXDK]T/
FD5Z2F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YT3DIIBnF!)TJDJ=*5AKZ&4Ecbl'
+E(_(ARfg)@;]TuCi<flCh4`,@;TRs+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<Vd9
$;No?+<YWD+<VdL+<VeGF`\a7DIal"Ec6#?+ED%*ATD@"@q?ck+EqaEA0<HHG%G]>+D>2$A9f;+
F!+n/+D#(tFDl1B6r-0M9gqfV6VgEN5u'fW$;No?+<Y]9Ao;$oATJu:DJ=*5AKZ&4Ecbl'+ED%*
ATD@"@q?d#@;TRs+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?
+<Y]9G&M80GT\,LATW'8DK?q/+Dbb5F<GL6+E2IF+Co1rFD5Z2@<-W9DdmHm@ruc7GA2/4+Du*?
AU&01@;]LqBl@m1+<VdL+<VdL+<Vd9$;No?+<Y`LAU#=?+<VeJATT&9BQ%p5+EqaEA0>H.E,8rs
DIIX$Df-\0Ec5e;-tI7+.3N;8@:Wqi+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YfJ
ARo7q+<VeIATW'8DK?q/+Dbb5F<GL6+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<
DfTB0+E)-?.!R0`+<VdL+:SZQ67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuC
A9;a.Ci^_>@;]^h+>>K+0JG(40JP780I[G<%14LD+Z_G7.3L;e+AP6U+Co2-@psCg+EqL5FCfN4
@:NjX$4R>PDe!TlF)rHO@;9^kFDl)6F!hD(@rH(!F(KB6+<W%?C2[X*FD5P=%16igA9E!.Ced;L
+=_,EA9E!.C`m4>/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'Df-\9
AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8F`_>6
Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,+EV%5
CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:NjkDJsZ8
F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'DIIR2
+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-$;No?
+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=DfT]'
F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9@VTIa
FE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.F<G[:
G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:Bldir
+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7BFCB<6
Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;;DJX$)AKYYtCiBgj:-pQB$;No?
+AQisATKmA$;No?+<Ve<EcQ)=+=84LCERJ*F)tc&ATJtBC2[X*FD5P6Ea`iuAKWZ\1,Ua;0JG:C
3@PCE%16T`@r,RpF!)i=C2[X*FD5P=%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqB
A1]AUA7]^kDId<rF<GdGEb'56%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F)uJ@ATJ:f
5uU]^9gquT5uL?=3[\?WF*2>2F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZee5FD,T5
%15C$<(Ke_9gMZM4ZXs!F`_;8E]PQW$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZek4ART[l
A.8l5;FNlN779j9;G0/6-Y%1.@<?'k3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+Cob+
A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15L+5t"F5;G0/6-Y.L2A3)(I$4R>;67sBkDe!p,ASuTu
FD5Z2+DkP-CER5-EZf4;DII&uBQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f9i"MM6qosF90G<`D/X<#
A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfO:EaiI!Bl+:d<^fnQ5u^EM9gMZM4ZXs6
ATD6gFD5SQ-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4Ec5l<+EqaEA9/1e;GU(f=&2^^
;b]PU90G<`Ec5l<GAhM4F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CNCUM+Co&&ASu%"+E)-?
DffZ(EZf4-Ebf_*$:IZW<D>nW<)#YV92du7+@/q)<D>n\9gMZM4$ckG85E,X5uL?;6W-?=<(02L
5uL?;6s2fD9gMZM4&&LG5t"F5;G0)P78cH<<(TeY5uL?;;GU(f=&2^^;b]PU9+;4;$;No?+Cf>,
D..<m+Dbb0AKYu8DffQ3+AYoYA7]^kDId<rF?1OZDe't6-n6Z//g+\6CiOT9FCcR($?:/N3Zq^9
A7B@pF`2A55V>Vt=%Q-r$4R>;67sa!DId9hE+NotASuU2%13                          ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L9+>P'!+>P_q1E\G1+>t?!2]t%%2)?@7+>bbp3$:%6+?(E#1LbK@Ch.:!A9E!.Ci^_AF(Jl)
FDi:2F_PZ&+A,EtC2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[WnDdm6kEb/a&DfU+GDdmHm
@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3D..3kF(96)E-*4>@;BRpB-8ND@rGmh
+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,Rp
F#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3
De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2
Bl@l3De:+?C2[W3                                                           ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 putNameTimestampsBasic00 restdBasic01''),(<(<''jodcrushtests'')'
zz=:zz,',<0$a:),(<<;._1 '' jodextensiontests grplitBasic01''),(<(<''jodlargete'
zz=:zz,'sts''),<0$a:),(<<;._1 '' jodpreparetests createtestdictionaries loadS'
zz=:zz,'moketest0 loadSmoketest1 loaddumpSmoke00 loadtest001dictionary load'
zz=:zz,'test002dictionary loadtest003dictionary loadtest004dictionary''),(<<'
zz=:zz,';._1 '' jodpurgetests destroytestdictionaries''),(<<;._1 '' jodsmokete'
zz=:zz,'sts compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmok'
zz=:zz,'e00 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 globsSmokeDoc0'
zz=:zz,'0 grpSmoke00 jodageSmokeDays00 newdSmokeBadArguments00 odSmokeArgFa'
zz=:zz,'il00''),(<(<''jodstresstests''),<0$a:),<<;._1 '' loadlargefeasiblecase '
zz=:zz,'loadtest001dictionary loadtest002dictionary loadtest003dictionary l'
zz=:zz,'oadtest004dictionary testdictionarypaths''                          '
zz=:845{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&p0d&2)2E5Mk@:X1_EbArqARTXo@VfUc@<6!T67sa(Ddd0m@<-!lAn>ClBjtmi@psFi
+ET1e+C]J-Ch.T00mFgOBk)7!Df0!(Bk;?.AoD]4FD,5.9L_B%$;No?$;No?+@C0\@<?(%+CT.u
+Dbt)A9/l8BOr;sBk)7!Df0!(Bk;?.F`V,)+DG^9FD,5.Cgh?sAKYSr@<6-lCh3rK67sC&ATMr9
@psFi+=KoQ6RaW1<+ohc9L_AlBlbD2DKKH-A7]9oFDi:2AKYD(@rH4'Ch7^"+D#e+D/a<&$;No?
+<ki;@<6@)@;KCa+s:u=F*&O7@<6!4+B3#c+<X?I6QdLb@<3P6AoDg4+Co1rFD5Z2@<-'nF!,[@
FD)"V67sB80JG1'1GCL:+EqaEA9/l3DBN@1E+*j%/g+,,BlbD2F!,=B@q[!$@<-!lEZcKHBOPd$
+EVmJBk(Rf$;No?+A,Et+E2@>C1UmsF!,R<@<<W7F*1o-Cj@.:@<Q3)1*@]XEZcJ\+Co1rFD5Z2
@<-'nF!)TDAfr4<BOqNG67sC"@<?0*GA2/4+DbV1F!,R<@;[2F0JFVnDfTB0+E1n4+Co1rFD5Z2
@<-WG$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB[BOr<.ATMr9A8,OqBl@ltEd8d;Eb/[$Bl@lB
Ci<`m+EM%5BlJ083XSVK/db??/g)8Z+CfG'@<?(&ATMs(Bk)7!Df0!(Bk;>m:-pQU+<VeCDdd0u
ATMrI0JR*P@ruF'DIIR2$;No?+<VdLCi<`mFCfN80JG7mBk)7!Df0!(Gm[;5/g)8Z+Dbt)A9;C(
F>,C)A8,OqBl@ltEd8!e67sB'+<YK=@:XIkF*')i1h:<1FD5Z2@<-W#:-pQU+<VeKATMs(Bk)7!
Df0!(H#R26BQFMU67rU?67sB'+<YK=@:XIkF*')j0P"m-FD5Z2@<-W9:-pQUDJsV>E+*d/+E(j7
9L_AV:-pQU+<VeCDdd0uATMrJ0JI$O@ruF'DIIR2+AP6U+Du+>+E1b0F<GL6+A>6l$;No?$;No?
+Dl7BF<G%(+EDUB+DG^9DfTB"E\8IW<+ohcDIIBnF!+n3AKYK$DKBo?F^oN)A0>r3+EV:*F<G+*
AmoguF:(c0/g*b/@;Kmr@:EeiBk&9,DfTr6DJ()2F`_[IFD,6&+DG^9@rHC.ARfg)DfTB"EXGQ.
/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emQaFttf[:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:
Eb065Bl[c--YI".ATD3q05>E9-OL1                                             ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)cX<+>P&o1E\M4+>GYp1c?I22]sq4+>GYp2)cX42'=\/+>GYp1,pC21E\P/+>G\q2)$..0d&>-
C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-
De*?uF`V5<ATMs7@rc^5BHVD.F*)IG/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$
A7^"-ASuR'Df0Z.F*)J7G][M7F(oQ1+EV19FE8QV+EV19FE8R:DfQsm:IH=:G][M7F(oQ1F)#W(
Cgh?sATVL)FE;8,EbAr+An>ClBjtmi+EV19FE8QV+EV19FE8RKBln#2Cgh?sAKYH)F<G1,@<6-l
Ch4`"@<>pmDe*g-AT2'uATVL)FE;8:@:UL(@<-(#F`S[IATMr9A8,OqBl@ltEbT*+C2[X%F`M,+
FCfN8F(B!+E,Tf/+E(j7FCfN8+Co1rFD5Z2@<-'nF)#W(F)>i2ATVL)FE;M?Deio,FCfN8F!*%W
F)>?%C`mh2F*&O7@<6"$+Cf(r@r#drB-:]&Eb-A;DfTB0C2[X(FE1r6F*(u7FE;MFEb0<5+EV19
FE8QV+EV19FE8RKBln#2Cgh?sAKZ)5+Eh=:Gp$p3EbAr+A79RgCi<`mCgh?sAS,L^F(o*"ARf.i
AT2[$E+*cu+EV19F<G+.@ruF'DIIR"ATJu+DfQt:@<-!l+D,1nF(o*"AKZ)+F*)I          ~>
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
1E\P#-p0UR/mg=U-QkfK7nHZY+@K4(:eakY1a#4T6VgHU:J=2"779L=:/aq^7:/ed:`r2);D9d]
0K1+C;Go5'1E]+a;DBj^+@npe6q'ur8U=!)6tpO\ATDBk@q?cSH:gt$Bl8$(Eb8`iAQ)Po:..BG
6m,'I8l%isDf9H5+A$lO:IK>IBl8$(Eb8`iAKXT@6rZrX9N+td6m,)t6rm#M+A,R.:*<7s6W-]Z
=\qO09hAGU6r-iP;BSb%7TEAS5u^8q:I7NN;aWoI<$4t'7TEAS:e"P0:g$ag:JN$2;+r*378m/g
5tt'B;BTF]ATT&(DJUG)DJXB*@<,jk+C]J-Ch.:!A7KOpE,oN2F(Jl)@WcC$A86$nFDl)6F(9-*
E,oN2F(Jl)@q]F`CMn69@:D#8@rH4'Eb0<5C*7#,ART[lC2[W*A7At_AftVr@r-()AKYN$C`m8-
F(KG9A9Da.BOtU_ATAo(F`;5,D.Rc2ARlopF<G4-FDc2AFCB$*+DPh*Df-\6B-;#/@:WhUCLh."
+Dbt)A7TCp+Dbt)A8Ym"Ci<`mEb/i*Ci<`mF*(i-E-!.<Ddd1#DfTB0+Dkq9+Dl"4+Dl"4F(Jd#
@q[!&@;TRc@<?Q5DJWg)DBNh5E+X>;DJXB+GT^mBF`)#9AT/c1@WZ1+F<GL4+E2IF@;Kb%F!,FE
FD>l8DBNn@FDuLJE-68DEGQb<ASbpdF(K*)A0>o0+EDRG+ED^J+EM+9@WcC$A7TCpF!,R9F*(u2
G%ku8DJ`s&F<G^FA79RkC2[WnBleB:Bju4,Bl@l3F`:l"FCf3*A8PamBkCptF<G^FA79RkC2[X(
Dfp)1ARoq#E-!BU/1<VC4"akp+=A:@DJVXJF(o,<0d'qCCf>1hCLo1R+Cf>,E,&<gDeio<0HakD
D/a5gD/X3$0JO\[Eb/[$ATVL)FC])qFD5Z2@<-'nF!,")CdMQOBk&hN0d("<F*)G@H$!V=FC])q
FD5Z2@<-'nF!,"-A5d>`CLo1R+Co2-E)UUlCLpL`Bk)'lAM>e\A8Z3^D/X3$0JFV[DJW6gDeioY
@:O=r<+U;rF!,"4F(KG[@<6-m0JO\]A5d>`CLo1R+D5M/@WOkEF(o,<0JO\_Ci<d(;f-GgAO1BY
BkM<;0JFV^Ci<d(;f-GgAOLHH0JFV^Ec=roDeio<0Hb"KE,9616=FqL@k]V[C2[WkB4Y"YDeioP
@<loJ0Hb1M@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',ZCi<`mA9Da.;f-GgAM>e\Ci<`mFCfN8
0JG4lBk)7!Df0!(Gp$pA@:XIkF*')i11Y*/FD5Z2@<-W9Ci<`mFCfN80JG:nBk)7!Df0!(Gp$pA
@:XIkF*')i1h:<1FD5Z2@<-W9Ci<`mFCfN80JP7lBk)7!Df0!(Gp$pA@:XIkF*',j0P"m-FD5Z2
@<-W9D/O/gD/X3$6#pUZ0JFVeATqZ`D/X3$6=FCjEbBN3ASuU20JFVfA5d>`CLoePB1?<DCbROc
E-67t@;TRTBl.F&FCB$*F$a;VBk&hN+ED%7FC[^HF(o,<0d(RLF*)JFF^c^I/1<VC4"akp+=A:@
F_PZ&C2[W*C2[W*C2[WnDdji(De*]nCLnW'De*p2DfTD3C2[X)Df9H5+DPh*F`_>6-RgSp4?P\X
?SNZN+DPh*@UX=l@ru:'FE8R>De*?uF`V5<ATMs7+DPh*AU&<.DKBN1DKKH2FE8R>De*ZmEbAs*
ATMs7+DPh*E,oN/@<,q$ATMs7+DPh*E-626ATVL)FE8R>De*p+Deip+ATMs7+DPh*F*)G6F)uG7
F*)IGCi<`mCgh?sAS,L^F(o*"ARf.iALAoX-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX
9N+8X8PDNC8Q/Sa;HY,<@WQ+$G%G2QEcQ)=F!+q7Bl%<pDe*BmF*)G:@Wcd,Df-\,F_PZ&C2[Ws
C3(M,F_PZ&C2[X*DJ=28BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*@V'V&+DPh*A9Da.+DPh*
Bl8$5D]ie5A8lR-Anc'm+DPh*F`V,7@rH6sBkLm`CERJ&CLoh@F(o,V:IJ/nF*)IGD..3k;f-Gg
AP,`d<+U,mF!,=.DJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ.
.4cl01*AM1,Vh&.2)%!D1G1RE1GCLA2)RB:1,(FA0KCmK/iYXB1cI*C1,^710JPO@2)70E2)-dC
1bgsD2BXb/0fUjE1-$sE0ebRA3&r]M+>PW*3&!3F0ePF>1cI*J1b^^.1,(F?0K:aB/i5IG1,gsB
2_cF10JPOA0JGL>3&!$C1Gq'J3?U(20f:XD1,pmE2)R?Q2)[<P+>PW*2)$sC1+kI@2_m*E3&WN7
1,(F?0K1aD/iGRI1-%3P1H?R50JPF=2_[!>2D[9I0f1jJ1*A>+0f:XD0JY7=1H.'D1cRBK+>PW*
3&!3F3A**I0JGIB2`EN81,(FB0JtUG/i,I@0K:jI2_uR30JPO@2DR'@1c@3J2_d*K0d&5*0f:XD
1,pmE2`WiS0K:jE+>PW*3&!3F1G1[B2_[*K1Gq'51,(F?0K1^F/i,IA3&icM2`2^50JPF=2_d6D
1b^gI1,LgC0d&5*0f:XD0fL^@3&*ER1b^jD+>PW*3&!6G1G1LB2)I6H1H@041,(FB0K([B/i5ID
1cI-F3ADX30JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,LUA1,:RA2`WZS+>PW*2)%!D2D-gE2_[-I
0fLp31,(F?0K:aB/i5@>0K1pN1bg+.0JPL?1GCU;2`3EI0KCpE3$9t10fLdB0Jb=?2)I'K3&i]L
+>PW*2)$sE3A**H2*!EP0K(X.1,(F?0K1^F/i,IE1H@?K3B/-:0JPF=2_m0A1cI0G2)@!F1a"P-
0f:XE0Jb=<1,UjG1GppJ+>PW*2_[*D2(ga?1GgpD2DR051,(FB0eb:@/iPaJ2`*KL2)?@10JPL?
2)-s@2)$gC1bpsE2BXb/0fLdH1-$sH1GUdG0JYLA+>PW*3&**@3A*6N1bq'F0Jtg41,(F?0K1aH
/i,F?1,CdJ0f'q-0JPI>1GL^=1c.'J2`WlP2]sk00f:XD0K(O?1c7'L1-%3H+>PW*3&!0C2_HpF
2)%!E0fUm11,(F?0K1^F/i5FD3ArlP2)cX50JPL?2)-s@2)$gC1bpsE2BXb/0fLdD0f:R@0JbOB
1,^mG+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==1c-sG1,^710JPL?2)-s@2)7!K1H%$I
2]sk00fLdD0f:R@0JbOB1,^mG+>PW*3&!3F0ePF>1b^^E2`3B61,(FB0K(U?/i5RG1,:aJ1Gp:1
0JPOA0JGL>2`W`M0fUsH3$9t10fLdD0f:R@0JbOB1,^mG+>PW*3&**@3%d-L3&*?H3&3H91,(FB
0eb:@/iPaK3AE6D3&Mg60JPOA0JGI=2`NcP1c$j@2'=Y.0fLdD0f:R@0JbOB1,^mG+>PW*2)$sE
3%d*H2`*<G1cIB:1,(F?0K:aB/i,FD2DI$C3&r*:0JPF=2_[!>2Dd3H1G^^C3$9t10fUjF1,CO>
2`<EM1c[9N+>PW*3&!6G1G1LC2`*<E0f(g41,(FB0K([B/i5LF3&EHK2)ZR40JPL?1GCU;2`3EJ
3&<<D2BXb/0f:XD0fL^B1,h3O2)%!41,(F?0K1^F/i>CC2)@6L2)HF20JPOA0JGC;2)R-L1H@6M
1a"P-0fLdB0f1LB3&*?J2_m-C+>PW*3&!3F1bL^F3&WQI2D[-31,(FA0JbF?/iYgF2D[*F2Du[5
0JPL?1GCU;2`3EL1c%$G2BXb/0fLdB0Jb=?2)I3K3&<EM+>PW*2)%!D1G1RE1GCLA2)RB:1,(FA
0KCmK/iYXB1cI*C1,^710JPO@2)?p=2`3NL3&EKP1*A>+0fUjE1GCF?2)d9M1c76J+>PW*3&!3F
0ePF>1cI*J1b^^.1,(F?0K:aB/iG[E2)@6J2E;m80JPOA0JGL>3&!$C1Gq'J3?U(20f:XD1,pmE
2)R?Q2)[<P+>PW*3&**@3A*9F3AN9I1GCR,1,(FB0eb:>/i>LC0ebUH+>PW*3&**@3A*9F3AN9I
1GCR,1,(FB0eb:A/iYOF1,(XC0JXb+0JPOA0JGL>3&!?J0f1dC3$9t10fUmA0KCaF0KCmB2`NfS
+>PW*3&!6G1G1LB2)I6H1H@041,(F?0K1aH/iGXK3&E<K1G^./0JPO@2)6s?3AEHH2)mBL2BXb/
0f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK1bpd.1,(F?0K1^F/i,IA3B8oM2_lL20JPO@
2DR'@1c@3J2_d*K0d&5*0fUjF1,CO>2Dm<M0f(gE+>PW*2)$sE0eP7?1bq$K0f1g31,(F?0K1aH
/iGRF1H.*I1bp1/0JPF=3&!6C2_[$E2D?jA3$9t10f:XE0K(O?2`3HK3AE6C+>PW*2_[$B1bLaJ
1Gh*K0f(U.1,(FA0JbF?/ibX@1,LaB2DQC10JPF=2_mBG1c70I0K(aA1*A>+0fLdA1,ggF2D[0J
2Dm6K+>PW*2)$sE1G1LC1,CdD1,Um21,(F?0K:dB/iGFB0JG171Gg400JPL?2).!A2`EQK2).'H
+>PW*3&**@3%d-L2E*HP1,Uj11,(FA0JtRC/iP^G1,1aG2DZI20JPL?3ANTI3&<<H2_[!E1E\G,
0fUmA0KCaE3A`KO0JG@D+>PW*2)$sE3A*-G2Dd3D3&<B61,(FB0K1[G/iPaH2)R9M2)?@10JPF=
2_[-B1c.'G3ANTP0d&5*0fUmA0Jb==1cRHT1cR3I+>PW*3&**@1G1OB1-%0H0JPF-1,(FA0JtRC
/iP^G0fUjC1,C%.0JPL?2).!A2`EQP1c$sB1a"P-0fLdD0fCXC2`39K2_m9M+>PW*2_[*D2D-pI
2)@-L3B/o>1,(FA0JtRC/iP^H2E!<G2E;m80JPL?2).!A2`EWO3&!3G1E\G,0fUjE1,1C@0JtUG
2`WTM+>PW*3&**@3A*6N2).*M3A<941,(FB0eb:A/iYOF0K(^E3&_s80JPO@2)7!@2`<WR1GLdD
1E\G,0fUmA0K:[D3&iWO0fUpJ+>PW*3&**@3%d-L2`WTI1,q-61,(FB0eb:@/iPaL1,LdA0f:(/
0JPL?2).!A2`NTI3AEHP1a"P-0f:XD1,pmE2)d?J1,LpL+>PW*2)%!E0J5.@1bppH1cI-31,(F?
0eb:=/i>XC3&EBL1bp1/0JPO@2DR'@1cI<J2`*NL3?U(20fUjF1,CO>2`EQL0JP@D+>PW*3&!6G
1G1LC2E3NM1c7061,(FA0JbF?/ibU>3AN9I0K:110JPF=2_m*?1c@9H1,h-J0d&5*0f:XD0fL^B
1,h'H3A`TM+>PW*3&**@2D-jE2_ZsC0fM'71,(FA0JbF?/ibX?1,^mB0K:110JPO@2)7!@2`<WR
1GLdD1E\G,0fLdB0f1LC0fM'K3B/oO+>PW*2_[$A1G1UE2`!0K0f^s21,(FA0JbF?/ibXB3&`fN
2)cs8-p07-1Gg@40JPO@2)7!@2`E`U2_m6M+>PW*2)$sF0eP@A1bgsH1,Cj31,(F?0K1^F/i5@>
3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0fLdE1,(==2`*?H2)I0H+>PW*3&!3F1bLaA0f_0H
1,Ld01,(FA0K([?/iGXF1,q3J1c6C20JPF=2_[6E2)?pG2)@!J3$9t10fUjE1GLL@2DR-D1,q$F
+>PW*2)$sE0J5:A1G_$N2Dd<71,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)6m=3&!6M1Gh!M3$9t1
0f:XD1-$sD2`<KJ3B8iL+>PW*3&!3F1G1XH2)[<G0f(g41,(FA0JtRB/i>@C1,1dG1Gg400JPO@
2)7!@2`<WR1GLjC2'=Y.0fUjE1,COA2`WfR3&*3K+>PW*3&!3F1bLaA2)mBL0ebI-1,(FB0JtX@
/iP[D2)$dF1,C%.0JPF=3&!6C2)R3M2_d9M2'=Y.0f:XE0K(OA2E!HI2`*BK+>PW*2)-d=2(gd@
2`EZR0K(a11,(FA0K([?/iGXF2Dd6E3B/-:0JPO@2)?s>2`EQR1GLgF2]sk00fUjE1GLL@3&ioU
1,1R>+>PW*3&!3G0ePCF1c.3H1GU^.1,(FB0eb=9/iP[F0etUF2)?@10JPOA0JP762`<HP0JkaL
2BXb/0fUjF0JY7<1,([E2`<BJ+>PW*3&!3G0ePCC1,Ua@3&3941,(FB0JtX@/iP[D2)$dF1,C%.
0JPO@2)7!@3&!9O2)-sD3?U(20fUjE1,COA2`WfR3&*3K+>PW*3&!3F1G1XH1GLjL0K(a11,(FB
0JtUB/iPdF3Ai`L2DQC10JPF=3&!9D2_[-H3&`NI2]sk00fUjE1,COA3&`]S1,q*M+>PW*3&!3F
1G1UG3&riS3&ruA1,(FB0JtX?/iP[G2)dNU1GL"-0JPO@2)7!@3&!'I2_[!D1E\G,0fUjE1GCF?
2)d9M1c[BK+>PW*3&!3F1G1UH0JG4=0f_391,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)6s?3&`fQ
2*!NR1*A>+0fUjE1GLL@2DR-D1,q$F+>PW*3&!3F1bLaA1H73M1c7*41,(FB0JtUA/iYdM3&E?G
2)HF20JPO@2)6s?3&rZO0f(XG1E\G,0fUjE1,LUB2E3TN0fUjE+>PW*3&!3F1bL^F3&WQI3&!34
1,(FB0JtUA/iYgE3B/`J0d&5*0fUjE1,LUC0JtgG2)-dB+>PW*3&!3G0ePCC1,Ua@3&3941,(FB
0JtUB/iP[J2D['I0Jst.0JPO@2)7!@2`WfP3&E<E3?U(20fUjE1,^aD1b^[A1Gh*L+>PW*3&!3G
0ePCE1b^aB3&;[40JPO@2)?s>2`WfS2_[!A+>PW*3&!3G0ePCF2_[!D3B/u@1,(FB0JtX@/iPdI
1c[6G1,9t-0JPOA0JP762`<KI1,V!J1E\G,0fUmA0eb4=2D[?I1cRKR+>PW*3&!6E1+kF>2D@!K
2)I<91,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)?s>2`<EK0JYUC1E\G,0fUjE1,LUC0eb@C0JtXC
+>PW*3&!3G0J5:A2_m?L3A`N71,(FB0JtX@/iP[D2)$dF1,C@1-p07-2^C.40fLdB0Jb=?2)I<R
0fD$I+>PW*2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA1-%*M2)-4/0JPF=2_[-B1c@0E0f1R>
2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K1Gq*61,(F?0K1[D/i5IF0f^sB2`Mp8
0JPL?1GL^=3&iZK0fCa@0d&5*0fUmA0K(O@2)@*H2E3ZT+>PW*2)%!D1G1L>2DR0G1H7-41,(FB
0JtUA/ib^B0fCaG0K(%/0JPOA0JGL>3&!$E2)?sA2'=Y.0f:XD0K(O?2E!6I3&<EN+>PW*3&!3F
1G1[C2_d<L0KD$?/1<V9+?:]&0JPF=2_[6E1c73H3&<?J2]sk00f:XD0KCaB2)I-D1-%-M+>PW*
3&!3F2D-pB2DR!C3B&'90JPF=2_[6E1c7*D3A``V3?U(20fUjE1,LUB2`*9G3&i]L+>PW*3&!3G
0J5:B0f:XF3&`W91,(F?0K1[G/i5FA3AWNO2)HF20JPF=2_[6E1c7*F0KCgF1E\G,0fUjE1GLL@
2_m*E2E3WO+>PW*3&!3F2D-pD0K1dD3B8l<1,(F?0K1[G/i5FB1b^[F1H6L40JPO@2)7'B2_[0F
2D?mE3$9t10f:XD0KCaB2)I!I1c[QV+>PW*3&!3G0ePCF3&<NO2E*B61,(FB0JtX?/iP[C2_d6O
0fC.00JPO@2)?s>2`<EK0JbC:3?U(20f:XD0KCaB2)I'B3A<?I+>PW*3&!3G0ePCD1,1aK2DR6@
/1<V9+>Gi$1,(F?0K1[@/iGLE1,:X>3ADX30JPF=2_[!>2D[9I1,LdI3?U(20fLdD0et@=3AriW
1,1^E+>PW*2_[$A1G1UF1cRHN1Gq'51,(F?0K1aA/iG[D1c%'L2`W!90JPO@2)6s?2`E`U1cR9F
3?U(20fLdD0f:R@1,h0N1b^d01,(F?0K1[A/ibpN2DR!@2)6:00JPO@1GCU;1c.0N0fUjI+>PW*
3&!-B1G1L@3&WKF1H@<81,(FB0JbC=/i5CA2DHp?3B83;0JPO@2)70E2)7*N2`E`W3?U(20fLd@
0KCaF3&iZP2E!?I+>PW*2)$sD0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g70JPF=2_[!>
2D[9I0f1mM3$9t10f:XD0JY7=1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPOA0JGL>3&!?J
0f1aA1E\G,0fUmA0KCaF0KCmC2)[3H+>PW*2_[*D1+kFE3AWHF2)-g.1,(FB0JtUD/iPL@2*!WO
0K1+00JPF=2_m*?2E3EN3&3BL+>PW*3&!3G0J5:B1,(OE2)?s01,(FB0eb:;/i>LA0K1[@3?U(2
0fUjE1,pmC0f1X?1bpgC+>PW*3&!-B1G1L@3&`QO0KC720JPO@1GCU;1c.0M0ebCD2'=Y.0fUjC
0Jb=<1cRHM1,UjG+>PW*3&!3G0J5:A2_m?M1GCO+1,(FA0JYC@/i>OG1b^aB2DZI20JPF=2_d!=
1c$g@0Jk[E0d&5*0f:XD0eb4:0fCmC1Gh'K+>PW*3&**@3A*9F3AN9I2)m<51,(FB0eb:A/iYOF
1,(XG1E\G,0fUmA0KCaF0KCmB2`<QM.4cl00I\P$4>838-p014/1<V7.4dS8              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
