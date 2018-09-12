NB. JOD dictionary dump: 29 Aug 2018 17:34:11
NB. Generated with JOD version; 0.9.996 - dev-i; 27; 29 Aug 2018 17:33:22
NB. J version: j807/j64/windows/beta-i/commercial/www.jsoftware.com/2018-08-22T14:27:51
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

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.996 - dev-i';27;'29 Aug 2018 17:33:23'

JODVMD=:'0.9.996 - dev-i';27;'29 Aug 2018 17:33:22'

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
if. _1 e. (4!:0);:'load conew coclass coerase coinsert copath jpath UNAME IFWIN' do.
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

WORD mnl y
:

NB. (mnl) does not require open dictionaries 
if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
elseif. do.

  NB. format standard (mnl) (x) options and search
  x=.  x , (<:#x)}. 1 , DEFAULT

  ok 'NIMP mnl'  NB. NIMP out for now
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
1GUp42DH=0+>t>s3$:1'1H$@9+>u,#0f'q-3$:+%1,g=11a"\4+>P\p2_lL10H`80+>Gbs1,C%-
0d&8,+>t>t1*ACr0fC.7+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt2BXb4+>Y,q1*A;*+>Ybq1a"V0
+>Y,t1*AS"2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!1GL"0+>Ybq2]sk1+>k8s2'=V-+>khq
1*A>.+>P'"+>GPm1bp12+>kqt1*A>.+>GPm1c6C7+>bhr2BXn8+?(E#0H`)(+>Y_p3?U.6+>Y,p
2BXdu1c$76+>Z##3$:+7+>t>u1E\Fq1-$I:+>Ynu2]sk9+>k8t2BXn#1,pC20H`,-+>P&p0H`.o
0f^@21*AA0+>G_r1cQU50d&8.+>Get1c$700H`/26qKm?<)[[WD.R`rC`m5$@<,ddFCfK66rcrX
9iFP=8g&:gEcYr5DBO%7@<<W%Eb/[$ARlp*BPDN1A9Da.Anc'm779L=:/aq^7<E*cF<G.*Bln96
+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9C1D1"F)Pl++E)-?=(uP_Dg-7FF*VhKASlKW6pjaF
;bp(U?VXEoDJsW.E+*9-.kYCXAKXE06VgHU:J=2"E+*j%84>g478dc=Dfp"A@;]TuF*22=AKYYt
@:Wqi+Cf>#AP%2?:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7
A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1
AKXT@6m-2]FCfK)@:Njk/Kf1WARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&
8U=!)7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sA
C2[WsDKKH1Amo1\.7nhX:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_
<_YtS:IJ/X:J=\0G%G]8Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>Dk
FCe'C:JOM\:JN$N@VTIaF<G(3A7\J$6W-]Z=\qP(@:O=r+EV1>F<G[NE+O)A+Co&&ASu%"3Zq$n
6W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B<E)FI9hAGU6r-iP;Jg,mARlol
F)u&.DJ`s&F<GLFATDg*A7Zm*@:rA&7TEAS5u^9k@V0b(@psIj+Dbt+@;I'#A7]Y#BkD'jEcW@F
@:rA&7TEAS6V^Tu@;TQuDdm=$F(8X#Bl@l3Ch[a#F<E.XBPD*mATAo:@;L'tF!,:1F)rI?Bkq9r
Gp%3I+Cf4rF(e?97TEAS:e"Q*@V0b(@psInDf-\6De!3l+DG@tDKKT)Bk;<-E,oN%Bm<HW<(Ke[
:g$ag:JN$R@rc:&F<GL2C1Ums+Cf>#AQ)H";c-42F(96)E-*4@@VTIaF<G(3A7\_/;cHmc9he&S
FCfN8+Dk\2F(&]m+EMa@FCSu,/KcbjDf-[O+E(k(@V97oEb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-
Bk)7!Df0!(Gp$R)@r$4+F(0$'Ch[s4+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8d<@<>pe@<6!&
@UWb^F`8I8Bl%@%@W$"'ARTUhBQI`nEarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5
FE8R:DfQtABl.g*AKYJr@<,ddFCfJ8Ch[s4+E1b2FCfK1F(09+Ch.:!A7KOpE,oN2F(JlkF_PZ&
F!+m6Ap%p+Gp$U8D/aN,F)to'+A,Et+Dbt)A0>u*F*&OG@rc:&FCKB,Ch.:!A9;a.Cia*)D/aN,
F)to'@WcC$A9/l'Df'H6ATMp(A0?&,EcYr5DBNk0+EV:.+A,Et+EVO?Ci^_/CghC++EM%5BlJ0(
BOt[hDKKu/@P_M-ARfLs+CT)&+EV:;ARuu4DIIBn/6cV#@<6Kq/9GHJF=A>S@:F%aF(9-*E,oN2
F)#`,D/XT/F!+n-C`mq8Blmo/F)YPtAKYT*Df$Uh+EqaEA9/l%DIal2BQ%p5ASuQ3Ci<flC`mV(
D.RcuEb/[$ASQ-oA8,OqBl@ltEd8dG@VTIaF<G(6ART[pDf-\@ATD6j@UX%aAp%p+Gp%*L@;KXi
Bk:ft@UWb^F`8I8Bl%?'E+*j%A7f=fDf]K"Ci=B++Co1rFD5Z2@<-W9Anc'mA8lU$FE;#8+Co1r
FD5Z2@<-W9E+*cqD.Rg#EcYc6D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u+Eqj?FCfM9
BOtU_ATAo-DJ!g-D..O#Df0,sARoLs+Co1rFD5Z2@<-W9DdmHm@rud'FCeusF<G[:G][S0FDc2A
FCB$*B4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E-#c4A8c@-F`M@B8l%ht
Df-\<ATN!1F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0ChITnCLnVsDIal+Ddd0!
8l%htB6%p5E,9H$A7At_A8-(#Ddd0t+Cf>,E,9*-AKZ#)EHPi6FCeu*@UWb^F`8I6Bl[cpFDl2F
+=MLaCi<`mA8-(#Ddd0t+EV:.+Cf>,E,9*-AKZ#)EHPi6FCeu*A8-'q@ruX0Gp"M\.;Wp2A8Ymn
Ddd0!DIIBn+Cf4rF)rI9DfQsKGpsk6ATN!1F<G:=+>=pMDfQtAF^nomF)rI4DIakE+D,P4+D,%r
Cisc0Ci<`mEb/j!Ddd0t+EqaEA0>;uA0>u*F*&OFAS,LoASu!h+Dbb5FE8R:Ec5e;F`V,8+D,>(
ASc9nA92j$D/aQ4Ddd0t+Co2,ARfh#Ed8dLBl.E(F*(i-E-!-MGq!QJ@:XS#Eb'6-Ddd0t+Co1r
FD5Z2@<-W9GAhM4F!,17FDi:D@<-!lF<GC<@ps1bF)>`7D..3k+Dbt)A0>r'EbTK7D/O0+BleA=
DdmHm@ruc7Bl5&%Cht57AS5^uFCfK(A0>Ds@ruF'DIIR"ATM`tD.R3cFE;#<FE1f"FE8R5DIal"
CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#ASuF/DJX?)E+<g(G%G]9F!,@=F`)7CF*)>@ARlolF!+q+
DIIR2+EVNECh[cu@<*K4AU&;>Eb031ATMF#FCB9*Df0W7@WZ1+FCB63ASkmmATJu&DIal1ATW'8
DK?q=@VTIaF<G[:G][k7DfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nF)Z8D@;Kb%F)Z8DF!+n-
C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.<'EOC3+<2F*)>@AKXTD:JN$@F!+(N6m-S_G]Y'F
@:O=rF)Z8DE-ZMHDfTD3:jI.rDf-\-De*E%@<3P`:IH=IAU&;>D.-ppDf]l?FE;G<F*)>@AKXoK
9H[bb+A,Et+EV1>F<GF/@rcL/Eb0&u@<6!pDe*HoDII?(8l%htEb03+ARTXk+EMX9E-$&:Ecl8@
+A*bn@:O=r+EM%5BlJ08EccDDF`)7C8g&4eF*&OG@rc:&FE;M7FCKB,Ch.'jEcZ;5FE8RD@<?1(
+E_a:A0>?,+A,Et+C]J-Ch+Z4DfTB0FCfN8ASu[*Ec5i4ASuU2ATVu9F`8IFBOr;7BkhQs.3NGF
@ps1b+D,P4+EDUBDJ=!$+EV19F<G(%F(KE8E+EC!ASQ-oA8-+,EbT!*FD5Z2F`:l"FCfM9Anc'm
F!,17+A,Et+Co2-FE2))F`_>9DKTo/@<?'qDe*]nDJ<]oF*)J7F<F1O6m,oKA8c@,+DkP)BkCpt
FE8RHD]iP4EcP`/F<Ga<EcYr5DKTo/@<?'qDe*p-F`Lu'A9Da.F*2G4@<?''Anc'mF!,17+A,Et
;bpCk6U`,.BleB:Bju4,Bl@k                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,Up31GU(.+>GPm1,1XA+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%9+>GZ+2'=V-+>Pf/1*A;2+>Gf72'=V/+>G]31a"e$0fM*J+>GYp0ebCC
+>Gl!1,1dI+>G_r0ebF?+>GPm3&`f>0f'q21GU(-2]t+81a"M0+>G]-0d&2-+>G`21a"M1+>GW0
1E\G-+>Pl01*A>,+>G]02'=Y/+>Gi22BXb0+>PW21E\D/+>GT)2BXb2+>Yf61E\D1+>GZ41E\G0
+>P`/2BX_0+>Gl91a"b#3AiX&DJVXJF(o,<0ht%f.Um:36=FqL@k]V[F=f'e@UX=l@j!1/DJUaE
@UWb^F`8I@@;TQuCh[s4+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\
ATMs.De(OV.3N).@r$4+F!,:;@:Wq[+EqOABHUl(Dfo]++EqaEA9/l8D]in*FCSu,DIIBnF"Rn/
:-pQU+<VdL+=M>CF*)/8A2#_e+DGm>Ci<`mARlomGp%3BAKZ)+F*'GcEccCG-Z!^0A9;C(F>,C'
A8,OqBl@ltEd9#A$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JP:mARdJL%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@
Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#
+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JOpa$4R>;67sC&BOu3q
+Dl7BF<G%(+CT.1DfB9*+Co1rFD5Z2@<-W&$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/
C`k*GAR[8H1a`_>%16Ze+E(d5FC])qF:ARP67sC)DfTB0+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(q
E"*.cEZeh/C`k)Q%13OO:-pQUFCfN8F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAnJ+C]5)
+=ANG$4R>;67sBlF<G()FCfK$%16Ze+>P'KDJUFC-OgDoEZd.\@W$!)-RT?1ATAnM+C]5)+=ANG
$4R>;67sBiDJUFi:K(4d=WhQqEcQ)=F!,"2C`m>.EZfI;AKYi.F*&O7F`MM6DKI"1@:O(qE$-_T
AU%]rE-)Nr:-pQU@W$!)Df0B:+EM+&EarcoF!+m6F(oN)Ch4`.F`\a:Bk)7!Df0!(Gp$R)@r$4+
+EV:.Eb-A-F!,@=+E1b2BFP;D67sBoASu!h+EV:.Eb-A%Eb-A2D]j"-FD)e8Eb&a%+ED%7F_l/@
+Dbb-ANCqV0Ha^W+CoA++=ANG$>"6#1a"Rs@W$!)-XT8;<$re2:-pQUD.-ppDf[%4DIdI!B-;D4
FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bhCNXS*$>"6#1*A=p@W$!)-Z<NC+<VdL:-pQUB6%p5E-!.3
Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC+DG^9@s)g4ASuT4@UWb^F`7cs%16Ze+>=om+>=pIDJUFC
-QjNS+AP6U+CT)&+Du+?DK?q7DBNG3EcP`/F<G%$@r$4+%16Ze+>=om+>G!JDJUFC-QjNS+AP6U
+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^F`7cs%13OO:-pQUGAhM4F!,(8Df$V9@<-I(@s)Tr
EZeh"@r$4+Et&IO67sBiCh%9(De:,$@:O(qE$0%@D.7's+CoD4F"AGFB0%.t4"`61-S@/1/ho:;
0fCX=2(gU?/ho.70et@81a`_>:-pQUAoD^,@<?U&A0>r3+CT)*BON$)DfTr@+DkP/@q[!&F_t]1
Bk&9,DfTr@%16Ze+C]52D0%j$+C]5)+=Ach%16Q[4ZX]L0mdAIF_u1_3Zri'+C]52D0$-n%16Ze
+C]5)+C]+/+<VdL+<VdL+<VdL+AP6U+<Y-2C`k)X0fLI&+<VdL:-pQUD..NrBOu6-@;Ka&GAhM4
F!,17+D5D3ASrW"@:O(qE"*.cEZeh/C`k*GAR[#<@V[)/+<VdL+<XEG/g)9GDJUFCEb/]40fLI&
+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l7FCB33Bl7Q+GA2/4+=D2@@OE:4DBNS+G%GP6@UWb^F`7cs
ATAnI+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0H`.o@W$!)-Y7NT0fLI&+AP6U+EqaEA9/l)DIdI!
B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#0d&7p@W$!)-Y7NM/7NB;+<VdL:-pQU+>Fup
+C]5)+=C`F/ho:4+<XEG/g,7IF*)IGASu$mDJ()9Bln#2-Y7NM+DG^9B5)O#DBNCs@r$4+%16Ze
+>P&p+C]5)+=D)<-S/_B+<VdL+AP6U+<WE^1*C%DC`k*DA1fSq-QjO,67sBnEc6)>F!+t2DKK<$
DJ=!$+EM[7F*)G:DJ((>De(4<Bl5&+Bm+'*+C\bhCNXS*$4R>REZd%Y0d&1n@W$!)-UK13@V[)/
+<XEG/g+S=C`m.sG%G]'F!,OG@<-I(DJ()9Bln#2-UK1'Bl5&+Bm+'*+C\bhCNXS*$4R=O$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tD@UX=l@lZP0?Xdnh;f-GgAM>f567s`sDJW6gDeio<0HbHh/KcHNDJUaE@<-"'
D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8
A2#GTA8,OqBl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`6rZTR<%i?)
F*)/8A2#A?$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
2/78M1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/
DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08
%17,c+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)
F>5-P$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;R
Deio3%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR$4R>;67sBnASu("@<?''
@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o%15is/g,4FBQ60r+?hi#
/g)qm+AP6U+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN1a!o967sBQ+EqaEA0>bu
D.Oi"CghC+%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is/g)8Z+@U*\A7]9o+<X'd
@ruF'DIIR26Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-+<VdL+BNK%A5d&JEarcT
:18!N6Yp1PF!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?+DbJ,B0A9u-p22r0I\+q
+=K>r0Ha.X8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cIF(8m'.3L/a-nK]n/6>VF
6sjA;De*3(4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'4&&".;GU7p:dn`"C2[Wi
.1HUn$;No?+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o:-pQU+<Ve<D/aTB+<Y-%
@r$4+@r?B2+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro@UWb^F`7cs:-pQUEaa!$
4ZX]5-QjNn+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS+<Vdg+=D&8D.P>0Dfor>
-OgCl$;No?+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o:-pQU-Vcu\
+=A9_+u(2_4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a9KF:N+=nX^+=K?g@<-!0
+=nWtEHQ2AAL9#n+ECn2B+51W$9g.jDe't<FCfN8C2[W:-QlV91E^UH+=ANG$4R>;67sBkASbq"
AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&
I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+D#S%F(HJ&DL!@6@:O(q
E-!-2$:IQN3Zrc1HS-F/:dJ&O?XH`2?XHE$6uQOL%14g4/1_nl0d/S82(9Y&+Co2,+@8@e?XH2p
/12o"Bkh6-%13OO:-pQUFE2XLF(Jd#@q]RoB-;D3ASrW4BOu3q+CT;%+Du*?@UWb^F`;CE/KeVL
E+NO$ARlopEcQ)=%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFC/i+ja$4R>;67sBj
Eb/[$AKZ).Eb/f)@UWb^F`;C2$4R>;67sBmBl\9:+E(_(ARfg)@rH1"ARfgrDf-[L+D#D/FEn<&
4tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl
+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#Tt-Zip@FD>`)0II;:+:SZQ67sC&
BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ
%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EMI<AKYGjF(o,,Bl8*&Ch[E&@<-"'D.RU,F!*%W
AU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*-OgE#ATAnK+C]5)+=Aco
-OgE#ATAo&DJUFL%16uaEZeh/C`khf-OgCl$;No?+EMI<AKYGjF(o,,Bk1dmFD5i2ATJt'$7KA$
C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bh%14L;+C]5)+=ANc+>#Vs0HahBC`keoHS?RODJUFC/ghbN
$7IVO@W$!)-RU>c/NP"/+C]5)+?M<)0d'qCC`k)X-Qij*-o)oSDJUFC-Rg/i3Zp1#@W$!)4#)(;
+C]5)+=Ach+:SZ+1E^.EC`k)Q.3L3'+>Y-LDJUFW0mb]!@W$!)-S?bh%14L?+C]5)+=ANc+>#Vs
1a$7FC`keoHScjSDJUFC/ghbN$4R>;67sB'@W$!)-S?bU$9g.j@W$!)-S?bh%14p74WktYDJU[Q
-OgCl$=[FSDKTeZ3Zoe&-Qjr_,!$i$1E\1j+taud4#)(kDJUFC/gi(j/M8.n/gh)8%15is/g+b;
FCSu,Ao_g,+<YQ?DIn',F*(u2F<G%$@r$4++>"^IEcQ)=+D#e:ARfgnA.8l`ATAo&DJUG)@:X7u
D%-hiATAnI+C]5)+C\biDKTe*$>sEq+>G!JDJUG)@:X7uD%-hiATAnK+C]5)+C\biDKTe*$>sEq
+>Y-LDJUG)@:X7uD%-hiATAnM+C]5)+C\biDKTe*$4R>;67sBT@;^?5De:,4ASkjiDJ=!$+EV19
FE8R7EbTW0@ps1iGp$X/E+Not+E)-?FD,5.Ci<`mARlp%@VTIaFE9&D$;No?+A$/fFD,5.Ci<`m
+EMC<CLnW1ATMr9F(96)E--.D@<,p%@q]:gB4YTr@3BB)F<GL6+EV:.F(HJ9ATMs7%15is/g,"R
F*&O6AKZ#)G%l#/A1eu6$4R>;67sB'@W$!)-RT?1-tI43+=ANc+>#Vs@W$!)-RT?1%15is/g)9G
DJUFC/n8gBDKI68$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bU$4R>;67sB'@W$!)-Z3@0AL@oo
-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP"`DJUFC6;LBN
-OgCl$;No?+<Y-2C`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+C]5)
+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0HahBC`k)Q%14L;+CoA++=ANc+>#Vs+>=pIDJUFC-OgCl
$;No?+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=pIDJUFC/gh)8%15is/g)hj@W$!)-SAnIF`):K
%14L;+CoA++=ANc+>#Vs0HahBC`keoHX^l/+=Ach%13OO:-pQU0HahBC`k*C@;TR'%14L<4!6UG
-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'+>=pIDJUFC6;LBN-OgCl
$;No?+>=pIDJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3Zp+!@W$!)
-V7'4-S.>7HX^l/-S?bU$4R>;67sB8+C]5)+=ANG$7IVj-Za-CCLo2!ATMrI-T`\sD/X3$0iV_*
F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-RT?1%15is/g)kk@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp."@W$!)-S?bU$4R>;67sB8+C]5)+=AdODfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qC
C`kepHX^l/-S?bU$4R>;67sB8+C]5)+=D&8D.P(($7IVj-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*
F>5-l+>#Vs0d'qCC`k*HD/X3$0ddD;%15is/g)kk@W$!)-Z3@0AM.J2F`):K%14L<4"#)dDeio<
<+U,m0IJ:l/NP"/+C]5)+=D5IDeio<-S.>7HX^l/-S?bU$4R>;67sB9+C]5)+=ANG$7IVj-Xq"4
CiaH3CLo1I4""KUDesK3Deio=-T`\iDKKr:Deio<-T`\iDKKr:Deio=-Rg/i3Zp1#@W$!)-RT?1
%15is/g)nl@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)+=AdODfor>
-OgD2-p045/3GU3@6,h[/NP"0+C]5)+?MB+@W$!0/gh)8%15is/g)nl@W$!)-Z3@0AL@oo-o!e2
Bl8$6D/X3$0deCm/NP"0+C]5)+=Cl@FE;;;CLo4J%13OO:-pQU1*C%DC`k*C@;TR.@rHL-F=.M)
-o!e2@W-1$F)>i2AM>J\+>#Vs1*C%DC`k*7Df9G>/3>V6@W$!)-S?bU$4R>;67sB:+C]5)+=ANG
$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!0-OgCl$;No?+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'
+>Y-LDJUFC/gh)8%15is/g)qm@W$!)-SAnIF`):K%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)
+?M<)@W$!0/gh)8%15is/g)qm@W$!)-Z3@0AL@oo-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJUFC
F*/i>$4R>;67sB:+C]5)+=D&8D.P>0Dfor>-OgD2-p045/3GU3@6,h[/NP"1+C]5)+=D5Q-S.>7
HX^l/-S?bU$4R>;67sB;+C]5)+=ANG$7IVj-Za-CCLo1o@:O=r0IJq0F)>i2AM?he@rcKB-T`\s
D/X3$0hl(dEc3WZ4"#)dDeio=9jqOPD_WUg+>#Vs1a$7FC`k)Q%13OO:-pQU1a$7FC`k)X-OgD2
@W$!)-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68$;No?+>b3MDJUFCDIIBn
-OgDX67sB;+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl$;No?+>=om+C]5)+=Ach
%14LmDJUFC/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X@rHL-F=.M):-pQU0H`(m
@W$!)-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*C%DC`k)Q%13OO:-pQU
0H`+n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?+>=on+C]5)+=AdODfor>
-OgDX67sB7+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+C]5)
+=ANG$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)+=Ach%13OO:-pQU0H`.o
@W$!)-SAnIF`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.EC`k*C@;TR.@rHL-F=.M)
:-pQU0d&1n@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n@W$!)-S?bU
$4R>;67sB8+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P(($;No?+>Fun+C]5)+=D&8
D.P>0Dfor>-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP"/
+>P'KDJUFC/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0AL@oo:-pQU
0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>-OgDX67sB8+>Y-LDJUFC
DIIBn-OgDX67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)+=ANG$4R>;67sB9+>G!J
DJUFC/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o@W$!)-SAnIF`):K%15is
/g)nl0d'qCC`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1*A=p@W$!)-RT?1
%15is/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9+>P'KDJUFC
/n8gBDKI68$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX67sB9
+>Y-LDJUFC-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC/gh)8%15is
/g)nl1E^.EC`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)-Z3@0AM.J2
F`):K%15is/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$0d'qC
C`k)X-OgCl$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFCDIIBn-OgDX67sB:+>G!J
DJUFCDIIBn/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'KDJUFC/gh)8-t7(1+=Ach
.3L3'+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is/g)qm1*C%DC`k*C@;TR'
%15is/g)qm1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1%15is/g)qm1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC/n8gBDKI68$;No?+>Y,r
+C]5)+=D&8D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>G!JDJUFC-OgCl$;No?
+>b2q+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is/g)tn0d'qCC`k)X@rHL-
F=.M):-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*C%D
C`k)Q%13OO:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl$;No?+>b2r
+C]5)+=AdODfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>b2s+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+C]5)+=Ach
%13OO:-pQU1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'%15is/g)tn1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahBC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`(m0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68$;No?+>=om+>=pIDJUFC
DIIBn-OgDX67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun+C]5)+=ANG$4R>;67sB7
+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO:-pQU0H`(m0d'qCC`k)X
@rHL-F=.M):-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)-Z3@0AM.J2F`):K%15is
/g)hj0d&4o@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&4o@W$!)
-S?bU$4R>;67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)+=D&8D.P(($;No?+>=om
+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?+>=om+>Y-LDJUFC/gh)8
-t7(1+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)-SAnIF`):K%15is/g)hj
0d&7p@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0HahBC`k)Q
%13OO:-pQU0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl$;No?+>=on
+>=pIDJUFC/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7+>P&n+C]5)+=D&8D.P>0
Dfor>-OgDX67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>P&o+C]5)+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU0H`+n0d'qCC`k*C@;TR'
%15is/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)-RT?1%15is/g)hj1*A=p
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7+>P&p+C]5)+=AdODfor>
-OgDX67sB7+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=on
+>Y-LDJUFC-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>Y-LDJUFC/gh)8
%15is/g)hj1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU0H`+n1E^.E
C`k*C@;TR.@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o0HahBC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gBDKI68$;No?+>=oo+>=pI
DJUFCDIIBn-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)+=ANG$4R>;
67sB7+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach%13OO:-pQU0H`.o0d'qC
C`k)X@rHL-F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0AM.J2F`):K
%15is/g)hj1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Fq
@W$!)-S?bU$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q+C]5)+=D&8D.P(($;No?
+>=oo+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo+>Y-LDJUFC
/gh)8-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir@W$!)-SAnIF`):K%15is
/g)hj1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,0n\
DJUFC-OgCl$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)+=Ach%13OO
:-pQU1a"Lq1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Lq1,0n\
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn0d&5,+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)-SAnIF`):K%15is/g)tn
0d&5,+C]5)+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5-+C]5)
+=ANG$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC/gh)8%15is
/g)tn0d&5-+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'%15is/g)tn0d&5-+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X@rHL-F=.M):-pQU1a"Lq
1,L+_DJUFCDIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,U1`DJUFC
-OgCl$;No?+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach%13OO:-pQU
1a"Lq1,U1`DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq1,U1`DJUFC
DIIBn/n8gBDKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnIF`):K%15is/g)tn0d&50
+C]5)+=D&8D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&51+C]5)+=ANG
$4R>;67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8%15is/g)tn
0d&51+C]5)+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is/g)tn0d&51+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2q+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU1a"Lq1,pCc
DJUFCDIIBn-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,0n\DJUFC-OgCl
$;No?+>b2r+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>,+C]5)+=Ach%13OO:-pQU1a"Or
1,0n\DJUFC/n8gBDKI68$;No?+>b2r+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Or1,0n\DJUFCDIIBn
/n8gBDKI68$;No?+>b2r+>P\p@W$!)-RT?1%15is/g)tn1*A>-+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>P&p1*C%DC`k)X-OgCl$;No?+>b2r+>P\p@W$!)-SAnIF`):K%15is/g)tn1*A>-+C]5)
+=D&8D.P(($;No?+>b2r+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>.+C]5)+=ANG$4R>;
67sB;+>P&p1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,C%^DJUFC/gh)8%15is/g)tn1*A>.
+C]5)+=AdODfor>-OgDX67sB;+>P&p1E^.EC`k*C@;TR'%15is/g)tn1*A>.+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>P&p1a$7FC`k)Q%13OO:-pQU1a"Or1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2r+>Pbr@W$!)-S?bU$4R>;67sB;+>P&p1a$7FC`k)X@rHL-F=.M):-pQU1a"Or1,L+_DJUFC
DIIBn-OgDX67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,U1`DJUFC-OgCl$;No?
+>b2r+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>0+C]5)+=Ach%13OO:-pQU1a"Or1,U1`
DJUFC/n8gBDKI68$;No?+>b2r+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Or1,U1`DJUFCDIIBn/n8gB
DKI68$;No?+>b2r+>Pht@W$!)-RT?1%15is/g)tn1*A>1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>P&p2BZIHC`k)X-OgCl$;No?+>b2r+>Pht@W$!)-SAnIF`):K%15is/g)tn1*A>1+C]5)+=D&8
D.P(($;No?+>b2r+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>2+C]5)+=ANG$4R>;67sB;
+>P&p2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,g=bDJUFC/gh)8%15is/g)tn1*A>2+C]5)
+=AdODfor>-OgDX67sB;+>P&p2]uRIC`k*C@;TR'%15is/g)tn1*A>2+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>P&p3$;[JC`k)Q%13OO:-pQU1a"Or1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r
+>Po!@W$!)-S?bU$4R>;67sB;+>P&p3$;[JC`k)X@rHL-F=.M):-pQU1a"Or1,pCcDJUFCDIIBn
-OgDX67sB;+>P&p3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\DJUFC-OgCl$;No?+>b2s
+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G-+C]5)+=Ach%13OO:-pQU1a"Rs1,0n\DJUFC
/n8gBDKI68$;No?+>b2s+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Rs1,0n\DJUFCDIIBn/n8gBDKI68
$;No?+>b2s+>P\p@W$!)-RT?1%15is/g)tn1E\G.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q
1*C%DC`k)X-OgCl$;No?+>b2s+>P\p@W$!)-SAnIF`):K%15is/g)tn1E\G.+C]5)+=D&8D.P((
$;No?+>b2s+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G/+C]5)+=ANG$4R>;67sB;+>Y,q
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,C%^DJUFC/gh)8%15is/g)tn1E\G/+C]5)+=AdO
Dfor>-OgDX67sB;+>Y,q1E^.EC`k*C@;TR'%15is/g)tn1E\G/+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>Y,q1a$7FC`k)Q%13OO:-pQU1a"Rs1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pbr
@W$!)-S?bU$4R>;67sB;+>Y,q1a$7FC`k)X@rHL-F=.M):-pQU1a"Rs1,L+_DJUFCDIIBn-OgDX
67sB;+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC-OgCl$;No?+>b2s+>Pes
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G1+C]5)+=Ach%13OO:-pQU1a"Rs1,U1`DJUFC/n8gB
DKI68$;No?+>b2s+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Rs1,U1`DJUFCDIIBn/n8gBDKI68$;No?
+>b2s+>Pht@W$!)-RT?1%15is/g)tn1E\G2+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2BZIH
C`k)X-OgCl$;No?+>b2s+>Pht@W$!)-SAnIF`):K%15is/g)tn1E\G2+C]5)+=D&8D.P(($;No?
+>b2s+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G3+C]5)+=ANG$4R>;67sB;+>Y,q2]uRI
C`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,g=bDJUFC/gh)8%15is/g)tn1E\G3+C]5)+=AdODfor>
-OgDX67sB;+>Y,q2]uRIC`k*C@;TR'%15is/g)tn1E\G3+C]5)+=D&8D.P>0Dfor>-OgDX67sB;
+>Y,q3$;[JC`k)Q%13OO:-pQU1a"Rs1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Po!@W$!)
-S?bU$4R>;67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCcDJUFCDIIBn-OgDX67sB;
+>Y,q3$;[JC`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*
+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GVDf'H.;f-Gg
AM>f567s`tDf'H.;f-GgAM>e\F=f'eFCfN8+=L`<D/a5=+DtV)AKYo#Ap&0)@<?4%DCuA*:-pQB
$;No?+BN5fDBO%7AKW+:FE2)5B-8TU3[m3Q+<Y*3E+NHuF!)T>DBL'1+A*b!GAhM4+<W(BDf'H.
.3NhKChsOf:-pQUDdm=$F(8X#AKYE!Gp"5GDe!3l+DtV)ATKIH:L[pYF(8X#ARlp$@;TRs+<Y-)
B5)6++EqOABHVD1AISuA67sC"Eb/isGT\+W:I7NN;aXAN==G@8@;]Tu+<Y65A0<"=Bln#2+ECn.
A8c<-+C\c#AKW*j5tsd69Me8G%15is/g,4XAnGb%ATJt:+Cf>-FE2;9Ch7-"+C]U=+=L#P7TEAS
6V^T0/g)8Z882^MATAn9+Eh10F_,V:+E(j$$;No?+=L#P7TEAS6V^T0+D58'ATD4$AKYf-DJ*O$
+CT.u+DbV1F!,:5CLq=-+EVNE@r,RpBHV2$D.Rc@%15is/e&._67sC(ATD6gFD5SQ%15is/e&._
67sB'+>G;f@<6L4D.Rc2FCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCb[jX$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"
ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=
5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't5-RT?1%15is
/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B+CehrCcW[]C1D9,-[''A
@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?+Co%qBl7K)GAhM4+EqOA
BHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(.6T^7Ddm=$F(8X#AKYf-
@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC%144#
Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk%15is/g+tK
@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#
ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&+E2IF
+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)GA2/4+E(_$F`V&$FCeu*
DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@$4R>;67sBsDe!3l+E(_$
F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'t
AM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4Ci3Zu
ATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\
/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk+<t]@@ps1p%144#
G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G0e"5l
+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(
@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>Do
Anc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO:-pQUCi<flC`me4DfTqB
DIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2
AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs+=o,fF)GE'
ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S:-pQ_@rH4'C/\tfCLo1S
+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA
$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttirF`:l"
FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V@<6-m.3N&:
A0>;kC3=T>ARloqDfQsm+?1u-1^sde67sB'+<VdL+<Ve8DIal-ATo7FF)>i2ALq;!F(o,8Cgh?s
ALqnEEb0<5/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O.`:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0
F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]
CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)
0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FFDf'&.F*(i.A79Lh+EqaE
A9/l8D]iP.D/aN,F)qct9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!%13OO@W-0-
4Y@jtARTCkH#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8+?_>"0F\A-An?3u@qB_&
Bm+'/FCB&t@<,n"+?_>"@W-/o$4R>aBOQ!kEb/[#A79=`B5)6r@<6=)F*(i.A79Lh@<>poC`kkn
+C]8-+=\LZ%13OO-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh6r-lZ-QkQ)
+C]8-%13OO-V$j+6:":D+@TC"9N=JL6mk,Y+C]8-%14Nn$4R>REZfI@E,9H&+E2IF+=Bj$DJ)^Q
D.RcSEb/-[@;Kb*87?OL<,Y`]E+LC+$?BW!>9G;6@j#l<F=044+Cf>,E,$LC9Q+f]:18!NF$XhX
;Is9QCjAQ[Eb&-f<-`Fo-OgD;+Bot0D/XQ=E-67FFEhm:$4R>`BQ%p54ZX]A+?CW!%15is/g,%?
D.Rc2@;Kb#ART+p+E)./+Cf(nEZcqVDJsV>@q]:gB4YT_$=Q(MGmt++4YC.c.NgJU$@4if@3@$B
Gp"RZGmt*0%13OOATAo8D/a<0@j#`5F<DrPBQ%p5-OgE'@j"tu-ZW]>FEhmT4Z[(kD/a54-Z`s>
Ec`Z<$8EZ-+EMC<F`_SFF<G[MF:AQd$4R>\@VTIaFE1r)F$2Q,1E\_$0F\A'@;T@YDdmHm@rsjd
+F,))67sBkD]iq9F<G(3D/aN,F)rIB@VTIaFE7luCi=B:?XIMb?XI_\C1Ums?XI;]DJ"$4Bl@lP
/g)nY$4R>QBl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?De!3lATJ:f.1HUn$>"6#
FDYu5Ddso/F`\`RDdmHm@rua&Aof=/$?BW!>9G;6@j#l<F=044@rH4'C*4mB@VTIaFE1r)F!hD(
0d'[CF)>i<FDuAE+EVjM%13OOB5DKq@;KsqAog*r1E\_$0F\A%Ci<ckCi^^K+CT;%+=\LODfd*O
+Cf>,E,oN2F(Jl).Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-YI76@UX(nAS-!2%17,c+Bos9Eap56
G]Y;r3ZqpND/a54-YI76@UX(nAS-!2%14g4>9J!(Dfp/@F`\aJG]XB%%13OOA7]7e@<,piF(9--
ATL!q+>b3%+>=63%15is/g+\9@r,RoARlp)@rH<tF!+n3AKZ)5F^o*1+DtV)ATJu&DIakuEb,[e
:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Et&Hc$?(*!EcPl)AN`(eCi<ck
Ci_a#+F#"O:-pQ].OdM5+E)F7EcPl)AKYW%Ddm-kEt&Hc$=[pl4YCDdD`o^pDf7ck+>Fu]+<VdL
:-pQU-n6Z/3ZqmMD]i_3D]j.?D[d$_$>+3s?Z':hATKIHGp$X9/e&.1+<Ve9Df6aJ+DtV)ATM3m
DId='+<XEG/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdkARl5W+<VdL-[0,EB4Z0-@rc^0
@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.Rbt$>"*c/e&-s$>=?r+=\LZ%14Nn
$4R>REZfI@E,9H&+E2IF+=C]2@r,RoARojlDfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=C]2
@r,RoARojlDfB9/-OgD;+Bot0D/XQ=E-67FFEhm:$4R>ZBm=3"F(9--ATL!q+>Y-$+>=63%15is
/g+tK@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k%15is/g,@OASrW!DL!@ABm=3"+EM%2
E+O)5@<,p%A7]jo@ru9m+E).6Gmt*U67sC)BPDR"+EML1@q?csF!,L7D/XT/A0<HH-td@7@WNt@
Eb03.Ecc@3$;No?+CT.u+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/%13OOCi<flCcsBnGmt*sDe!3l
4ZX]@+=\LMDe!3l%14Nn$4R>REZfI@E,9H&+E2IF+=D#?G\(E,@rH<tF!hD(Eap4r+=D2>+EVjM
-TsL5@rH4'C*4m@Bm=3"F(9--ATK4.$8EZ-+EMC<F`_SFF<G[MF:AQd$=e!lAp&0+A927!E+O)R
3Zp4$3Zp*c$4R>;67sBpAfu2/ATD?)@<,p%@;^?5DIIBn+Cf4rF)u&-Bk(RnBl@l3Ble?<ATJ:f
:-pQUCh[Zr+Cf>-Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&/e&._67sC&
BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt-$;No?+Eh=:@N]2mFCes(
F!+n/A0>o(E,Tc=F!+t2DJ"$4ARlooARfObEaa'(Df0VK%13OO:-pQU@W-0-BlbD-ARfObEb/c(
Ci<flC`m/(A0>N$Ddm-k+>"^KD]iY+B6A6+%13OO@W-0JGp"4P+<VdL+<XEG/g)Pl.6T:+@W-/o
$>=?r4YC2^D]gMPGp"5)67sB/.OdMA+C]8-%14Nn$4R>REZfI@E,9H&+E2IF+=CZ;DJ"$4ARojl
DfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=CZ;DJ"$4ARojlDfB9/-OgCl$;No?+>%q>78m/.
;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDF)>i2AN;b2?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$ATVL)FC])qFD5Z2@<-'n
F!,QV/KePDART[lF!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+B!?"+=Lc3
F*)G@H$!V=FC])qFD5Z2@<-'nF"&5RATMr9E,oZ2EZfIB+EDUBDJ=!$/e&._67sB'%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AN%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'
D..]E1E^OQA8,XiARlp*D]j(CDBO.;FD)e7ATo7FBkhQs.3N>BFCfK)@:NjkCi<flCh4%_:-pQU
0emQaFttcp-us0FDf9_H+CSekARlo8+CSeqF`VY9A0>u4+EDUB+E)-?@W-@%+EqO;A8cZ7-6R,=
DKU15$;No?+>GfiF`&rg+EV19F<G+.@ruF'DIIR"ATJu'Ea`irARlo8+Dl%;AKYDlA7]9\$;No?
+>Gim@<jU_+DG_7F`M%9IS*C(<(0_b+Co2,ARfh#Ed8d=G\M5@Et&IO67sB83,N)L1GBq[A7Qf2
FDti:.3N_DF*&O8Bk)7!Df0!(Gp%!5D.Oi/Eb/isGRXuh$=e!aF`MM6DKI!K@UX=h-OgCl$;No?
+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^
%15is/g,7IF*(u6+E_d?Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_Eb065Bl[c--YdR1FCfN8
ATB.-$4R>;67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGjn@<6K4FDYu5De!-?
5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[W1%13OO:-pQU:2b5c3ZrNX
AKZFo:IJ/N;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh8l%iS78m/`:JXqQ
3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9DfcEq:-pQU8l%iS
78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;%14g4>9IckCLq$j
EaN6iDe*2t4A&C;<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4+Dbb0Fa,QV@:K`R8l%iS
78m/`:JXqQ3ZrNcCghBu11+I)De*2t8l%iS78m/`:JXq!$4R>;67sBjEb/[$AKYQ$E--@JFCfN8
+Co1rFD5Z2@<-'nF!*%WF(KH8Bl7Q+6r-0M9gqfV6qKaF%15is/g,7S+>=pWEb0<'Ecu#8+EV:.
+EV=7AKZ&9@;Ts+@WGmpA1e;uA8XOkFDti:/13,*-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt
%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@Hqa
EZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SR8&%16Ze+Dtb7
A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR
<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`
4Z[\(Ap>jS0JY!b$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\f
A7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t
<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r1FEV=ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@Hqa
EZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL
+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,.-OgDoEZf72G@Vh,
DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj
:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&
E+X>G-SRD*%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&
-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL
:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0K(9f$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r2^]%AATAo2ATqZ-A8XJ$
:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@
A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:
/13,2-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o
-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM
8OHH)4"qcd$4R>QDEU%&E+X>G-SRP.%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\
F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#
+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0easa$>"6#DIn$&+Co@O8l%iS
78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@
>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3s
0ddD;ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl
/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF
-Ta")%13OOA8XOkFDti:/13/--OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`S
FE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+
A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[D)%16Ze+Dtb7A0>E#4%`::<(0_b
;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,
A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0f16e
$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m
/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]
+:SYe$=n$;3co=QGUt3s2(&h?ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OO:-pQUDfTB"EZf:4+DkP"DJ=38A7ZloBk)7!Df0!(Bk;>p
$=n$;3co=QGUt3s0JFj`$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$;No?+EVgG+E):2ATDi7De:,/@:sIlFEM,*+Co1rFD5Z2@<-'n
Et&IeDEU%&E+X>G-S[;/0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&A7]RD@<6-m
0JG4V67s`uASa\AF(o,<0JO\l/M/)S@<6-m+Eh10Bk/>7A7]R++EV19FE9&D$;No?+:SZQ67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(ON
/e&._67r]S:-pQU8l%ht@ps1iF!,RC+EM+9F`8IFATMr9ASu[*Ec5i4ASuT4/KeJCF*2>2F!+(N
6rQl];F<kq%15is/g+S5A8c?.Bl8!6@;KakA0>;uA0=K?6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"
ATJtBC2[WnATf_ADe(MDFD5Q4.1HVZ67r]S:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV9
1E^UH+=ANG$;No?+<VeDCi^^HC2[X)ATMs)E[M;':-pQU+<YK=@:UK.C2[X)ATMs)E[MtP%15is
/g)8Z0d(LYF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!i(Q:-pQU@rc-hFCcS:ATMr9A8,OqBl@lt
EbT*+%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(C9F(K;E
0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`%^67sB72f<PW0JO\[Df0`0Ecbl'+EVNEC,R[u1*A.kEb0,sD.R5e$;No?+>GTf
@<jR`+E_X6@<?'k+D,P4+A+RG9PJBeGT_0@EcYr5DBNk0+A,Et%15is/g)l'D..]F0H_cYDe*s$
F*(u6.3NYBEHPu9ALD!t$;No?+>GTgDg!ll+Cf(nDJ*Nk+EVNEF`V+:FCf<.DfT9,Gp$pA@ps1b
%15is/g)l.D..]F1a$p[@<?'k+D,P4+A*b9/hf3n$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0
>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)5o$4R>;67sBp
DKBB0F<G!7GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B
13a68.1HUn$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>REZfI@
E,9H&+E2IF+=Cl3D0Ko=A1&KB+AP6U+DG_8D]iS)@ruF'DIIR2%16Ze+CoA++=Cl3D0Ko=A1&KB
+AP6U+DGm>BlkJ3DBO%7AKYMt@ruF'DIIR2%13OOATAo(AS`J:Bjkk&DfTA9+<Ve%67sBkASbq"
AKZ28Eb#UdDImi2FDYu5Ddso&ATT%BBjkk&DfTA9+<XEG/g,@VEb$;,F!,")Ch7^"A0>AjDJjB7
+D58-%13OO:-pQUBl8!'Ec`EY0JFVnDfTB0+DG_8D]iS)@ruF'DIIR2+CT.u+Co&"ATVK+FD,6&
%14M-DfTB6E,TZ94ZX]J+u(2fGAhM4H#R\?-Qjra0d%TTC3=T>+<iih/1r&Z/g)l&0I\,-3Zp.2
0H_S_4<QL)3]/$B-Y["+GAhM4-OgDoEZfI@E,9H&+E2IF+EqaEA9i-4DfZ?pATAo(AS`K5DfTB6
E,TZ9%13OO:-pQUGA1l0+Du+>+C\n)@:F%a+EVNEB4Z0-@;^?5A7]RgFCeu*GAhM4Et&IoATAo8
D/a<0@j#DqF<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+$4R>;67sBkASbq"AKYDtC`mb0An?!o
DI[7!+CT.u+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSnA7]R"GAhM4H#R\?Et&IoATAo9FZhc.
F`V,8+EqaEA9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*ATD@"@qB]j$8EZ-+>=pNCi<d(-9`Pr
DfTB6E,TZ9%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"
ATJ:fATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\sgF(o,E
3B:FU$=m^hFE2;FFCfN8A8,OqBl@ltEbT*+:-pQ_A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?.F=f'e
A7]h(Ec65E+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+SDF*2>2F#kElC2[X)ATMs)
E[`,FF!+m6Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttcp-us0FDf9_H+CSekARlo8+Du+A
+EDUBF!,C=+BN8pA8c[5+CT.u+A?KeFa+?&:-pQU0fNiiDDEmg@UX=l@j#9"DJ!Tq+EV19F<G"&
A7]9\$;No?+>Gim@<jX_+=M>NAp>aIFCfN8+Co1rFD5Z2@<-W9E,oN%Bm:b/A7T7^%13OO@rGk"
EcP`/F<Dr?@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%
+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+EV19F<G^JBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa
$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5
@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+Co%q
Bl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*
;H/&r%13OOFDti:4ZX]5FCfN8C2[W1%13OO:-pQUF`)52B5)F/ATAo%DL!@HATMs.De'u$Bk)7!
Df0!(Bk;>p$9ieh+@Jdg<)Yq@+>b3ZA0<6I%14g4>9H=*6W?uI3Zp."E+rft+@Jdg<)X550d'[C
F(fK9E+*g/+@Jdg<)Yq@+=MRh+u(3.8OHHU.3Kja+=f&t+u(2g/37llAp>aI74o]HHS-Ks+@Jdg
<)X550d'[C1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@Gp$O3C`m51EcP`/F<G=:A9;C(F<G+.
@ruF'DIIR"ATJ:f:-pQU:2b5c3ZrNXAKZG:De*s$F*&OFDf9_?D09oA+C\n)F(KG9/Kf1WAKXSf
@rH6sBkMR/AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0
F!,@3FE_YDCERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp
>\\1fFCfN80ddD;%14g4>9Is'Ec5l<+A,Et<(0_b;GU(f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&
3B9*,%16W[A5d>`CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<CLnW1ATMrG%15is/e&._
67sBhF)uJ@ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQU+<WEg+=LuC
A9;C(FCfJA+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV+EV19F<G+.F(9<+Df0!(
Bk;?H%15is/g)8Z+<VdTFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8A2,bh+EV19FD>`)0eb:1
+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQaFtks!F`:l"
FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,VEc5e;-tI%&
6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_:-pQU0fX#YGqq/uF`:l"
FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd
3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])q
F?MZ--Zip@FD>`)0JFj`$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2+Eh=:@N[(0
Bk/Y8BkM=%Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De'u4A8,Oq%16Ze+Co1s+>=63%15is/g,%S
D.7's+E(j7A8,OqBl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn$8EYd+<r"W/g+\=A0<Q8$4R>R
EZf:2+?MV3FCfN8C2[W:0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!+?^hl+FPjbA8,Qs0F\?u
$>"6#FZhc.0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"F!,.-@:Wqi%13OOATAnL
+E(d54$%IoBk)69-QmMBF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F+?^hl+>G!XBk(p$FU\Ze
$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!c
Eaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y!klE)UUlCLpL`Bk)'lAM>f567s`uBle5lD/X3$<GlM\
De*E50HbHh/KcHPBle5B+Co2-E,8s.+E(j7F`(o'De*E3%15is/e&._67sBhF)uJ@ATKmA$;No?
%15is/g)8Z0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(OU.3N&B@;0Od@VfTb
$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)2eHW10Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kf_]/KcH`
ATMs4@<6K=+ED%4CgggbF!)lPD/XQ=E-67O%15is/g)l'D..]F0H_qi.!''?GApu3F"&5PAT2Ho
@qB^(.!0$AFDtZ0F"%P*:-pQU0fX#YGr%/t/Kf1TA79RkA0>K&EZdss3%cmD%13OO%15is/h0:f
;GU1R4s27aBle5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is
/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%175g4ZX^.3Zoel
BPDN1BlbD>DJ<U!A7[+t$6UH6%14J*DJ<U!A7[,2/NP"b@<>q"H#R=;F^uU;:-pQUA79RgFEqh:
+DG^9F*(i.A79Lh+A*bqEc5Q(Ch4%_%14g4>9G^EDe't<-OgCl$>"6#De'u4A8,Oq+<XEG/g*b^
6m-S_F*&O8Bk)7!Df0!(Gp!P'%16Ze+EVI>Ci<f+E-67F-ZrrI+<XEG/g,4WDfTD3Bl5&8ATMr9
A8,OqBl@ltEd8*$%16Ze@<6!&-ZrrI+<VdL+<VdL+<V+#%16Ze+EVI>Ci<f+B4Z0--ZrrI%13OO
-Zs<@@rGmh-Qk!%+Cno&@<?d6AKZ,++<XEG/g,"RF*&OA@<?!m%13OO.!7Qn-Zj$9F!,1<+E_R9
@rGmh-Rg/i3ZrQU+AP6U+Dl7BF<GF/FCStn$4R>;67sB/F(fK9E+*g/.3N/4Anc-oA0>T(+=LuC
A9;C(FCfJA+:SZ4+Bot0BQ&*6@<6K4A8-+(+=D;B-QjNS+AP6U+Dl7BF<G+.F)Yr(Gp%<FFD,T8
F<G.8Ec5t-$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?O[>O$;No?.Rm!34['uuDfTl0@ru9m
+DG^9CghEsEZfO:EcYr5DK?q=Afs\g%13OOA8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R+ET1e+=Lc<
CagKJD/X3$+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5B6A'&DKI!D
@psFiF!)TDAfr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;G%#3$A0>Aj
F(KD8@<,p%@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*2/78M1,'.E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u4
3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>R
EZf:2+EV..@rr.e%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN
@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$
%13OO:-pQUDf0B:+E2IF+Co1rFD5Z2@<-W9BlbD8DBO%7AKYr#FD)*j1*A_&,@kM!+>=63%15is
/g+\=@ruF'DIIR2+DGm>ASlC.Gmt*7+?^hl4s2R&HQY!bA8Z3+-RT?10H`M$,<d5)+F>4c+CoA+
+=ANG$8<Sc+<s&m0d(fc1*C+FC`k)Q%14d34Wkt5+>G!c+>Y-NDJUFC-OgD:+?^hl4s2R&HQY-f
A8Z3+-RT?1%15is/g+kGF(KB6+EMI<AKZ/-Eaj)!$?g;qD.RcO3ZoeZGB.4J+C]P8A2,39GB.4L
+C]P8A2>SB$=\4"A2$/-+?^/@@Wuj'0g.Q?/I`%rGB.4L4ZX]A+?CVmGT\IYGpa%.@Wuj'1HdcA
0f'q5+=DCV/Kcek.Nj!a%159QHZX+DCi<f+E-67F4$%P&@;TRs%13OO:-pQUBl8!'Ec`FFDf'&.
DJsZ8Et&IoDIIBnF$2Q,-Z4-KA2#-DGB.4K+DuCDA259FGB.4M+DuCDA2GYC$7ItsDJim"ATK:`
3ZoguF_>N9+Cf>6@W-O5-Rh,*BeCM`+>YH.-o!D?0eb%<-oa40,p5E0+>P3$2^pgNFZLmmDJ<U!
A7Zm#AKYH&D^Pu$4tq>*D/a<0@j#`5F<EY+DJim"ATJ:f%13OO-tI43+=ANc+>#Vs0d&P#-p'J5
DIIBnF"&4_+?MW%DIIBnEt&I)0HanDC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f
%14L;+>G!LDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2
E,oN%Bm:'o-nlc!+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB
+EqaEA0>T(AncK!$7ISN1E^4GC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQU
ASlC.Gp%<LEb$;6F_56"GRXuh$7ISN0d("EC`k*7GB,&[+>#Vs0d&P#4$%P&@;TRs+<VdL+<VdL
:-pQUGAhM4+E2@4AncK!$7ISN1*C+FC`k)^-Rg/i3Zp."4!6UG-Z4-KA2GYV+<VdL+<VdL:-pQU
GAhM4+DG_*Bm:'o-nlc"+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,3EGB.4K-QjO,67sC)DfTA2
F*2),Bm:'o%16uaEZd%Y0HanDC`k)Q+AP6U+E;O4Ch[KqATAo)EcQ)=Et&IoATAnI+>b3ODJUFC
-OgE#ATAnI+>=ol+CoA++=ANG$4R=j0H`(m0HanDC`k)Q.3L3'+>G!#+?MW%DIIBnF!)SJ+<VdL
:-pQUASlC.Gp%<LEb$;3Eb/isGT\DPDfor=.1HV40H`(m0HanDC`k*CGB.4N-Rg/i3Zp."4!6UG
-Z4-KA2GYV:-pQUGAhM4+E2@4AncK4-uNsGDK@69$7ISN1*A7nA8Z3+-ZW`R-Rg/i3Zp."4!6UG
-Z4-KA2>SU+<XEG/g,@VEb$;,DJ!U-+=M,GF`)7L%14L;+>Y,o+CoA++=C\S-Rg/i3Zp."4!6UG
-Z4-KA2,GS+<Ve%67sC)DfTA2F*2),Bm:aKDJsZ8F"%P*%16uaEZd%Y1a"IpA8Z3+-ZW`F+<XEG
/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1p1E^4GC`k*GA1&KB%16uaEZd%Y0H`.oA8Z3+-Z3iM
%16uaEZd%Y0H`(mA8Z3+-[0TLDJ(=+$>sEq+>=ol+>P'MDJUFC@:s"_DC5l#+:SZ+0H`(m1E^4G
C`k)Q.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DXATD7$.1HV4
0H`(m1E^4GC`k*7GB.4M-Rg/i3Zp."4!6UG-Xq:?A2>SU:-pQUGAhM4+E2@4AncK4.!B0B@WNt-
$7ISN1*A@qA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Xq:?A2>SU+<XEG/g,@VEb$;,DJ!U-+=MDEEaj)=
%14L;+>Y,r+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,GS+<Ve%67sC)DfTA2F*2),Bm:aKG%G]'
F"%P*%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<7Cf>1hCLp4K@rcKeAU&<<:-pQ_A8Z3^D/X3$
9jqOPDcC:mFE8QIF=f'e+Cf(r@r$-.+EV:*F<G".C`mS'@rcK1FCf]=F!+t$DBL'2AI;1!/g,4D
G%G2,@;]TuF(Jp#+C]U=-tI43.4ts&67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf+AtWo6s!8X
<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(OU.1/g:/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%
Bl%3eCh3rK67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JG2%AT0=X
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O]:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGOb67sB80lCoQ1,C%qE+EC!
ARloqDfQsm2_Rj=DKU12:-pQU0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0=G@rGk"EcP`/F<Dr?
@<6!-$48I04Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&$8EYT3ZoV!-V@0&6VKp7;GTqmBkhQs
?RH1jCh7$q+=AND$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6mi=:67sB4HW3F4<$5+=5uL[1/IDi,E+X>X/g)N`ATMs.De(4&$>"6#De'u4E+X>G-SR5%$49Np
/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEsaWE>9IinF!,")
CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`$;No?+EMXCEb-A:@<-(#
F`S[B@:O=r+EV1>F<G[NE+O)C+<XEtFCcRe:IH=9De3ts:-pQU<^BDN6pXd@+AG-h;GSE779EMf
/g)9.<$5+29i+Md+B)68;FOM,<(KG#<(0ng$;No?+@/pK6<R8V;]o.5<(J,t:*;i$;bobP5u^9@
+B2K?73Frn6q&4f:Jr<(5uUo/;FOP_8OZZG9J-ZI67sBPF<G:=+E_WGFDi:DBOr;Y:IH=JF(KAF
@ps1iATAo8D]j43Ch[EgFCcS:AU&;L$;No?+@0g[+EV1>F<G[NE+O)5@<,p%ATMp(DKKT$Ci"A>
AT;j,G%#2uDKI"CD]iM7FCfMG$4:?b+>b3[F`\a70Kh$9C3*m*BlJ/A4#/NP-S@#(+DN$?@rc:&
F<G[:G]Y&\/hSLYATAnM+E2IF+CQuf/gkIDFCf\E4#/QQ-S@#(+DbJ.AU#>>AU&;>/hSb($>"6#
1a$a[F<G!I4YA*qFDYhA4#/TR-S@#(+D>k6C`mh2G]Y&\/hSLYATAnM+E2IF+CR&h/gkm\CaV;"
1cm';/hS8kD/:>:AU&;>/hSb($>"6#1a$a[F<G!K4YA+(AU&;E4#/ZT-S@#(+E2.*Bl5&3Ch+Z1
AU&;>/hSb($>"6#1a$a[F<G!L4YA*kH$!UF4#/]U-S@#(+CT;"BlnB(Ed8dDBleA=De:,$H$!V=
+>,9!-OOF*+>b3[F`\a72E`Z?D..I#A8c[0-Ta(B4!u.'/hS8`@<--oDg-(AFCf]=+>,9!-OOF*
+>b3[F`\a72a&c9-ZsNC3%$dC3'/K1/hSb!F`_4T+C]V<ATJtH/hSLY$7IVj-Yd^4EbTK7-Rg/i
3Zp7%0d&5++CoA++=CoF@rc:&F=.DD0fpb!@<?(*-Rg/i3Zp7%0d&5,+CoA++=Cu6FCf\E$7IVj
-YRU=CaUYS/NP"2+>Fuo1E^4GC`k*=FDYhA$7IVj-[9KE-Rg/i3Zp7%0d&5.+CoA++=DDNCaTQ<
0fpb)AU&;E.3L3'+>b2q+>PesA8Z3+-ZipEF=.DD0fpalH$!UF.3L3'+>b2q+>PhtA8Z3+-Xq@C
AL@g50fpb"@<--oDg-(H.3L3'+>b2q+>PkuA8Z3+-Z*:4CLh@-DC5c>0fpb*FCmK[.3L3'+>b2q
+>Po!A8Z3+-ZsNC3%#%?0d'\2@<=Xb+CQrT@50<A1+Zii/7C@d@5TTE2Cpmt2[Tme67sBkD]j.5
G]\!LD..NrBKli7@<<VD3ZpV53Zp7%B4Z0-HS-Ks+Cno&$4:?b+>Y-YA0<6I$=dm`@<*J<-OL2U
67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$=n*sATU7IF(o,<0ht%f.V*L>ATU7IF(o,<
0d(Qi/KeM2F(o,,-tI:<ATT@DE+*cqD.Rg#EZfF7F>%-;@;]^h+EV19FE9&A:-pQ?:-pQU@<6L4
D.RcL$;No?$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;/db??/db??
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f!WbFtt`Y:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB8
3,N)L1,0nL:JXqZ:J=/F;BU'mF*)IG@:Wn[A-rZRDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1
FCfN8ATB.*$;No?+EqaECER>/+Cf5!@<*K"@<6!&DfQtBEaa$&+Dbt+@;KK^@r,^bEZc_W$4:9]
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$;No?+>%q>
78m/.;cH%\<.->*$?Tfm@rsjp+=D8BF*)/8A2#\b$4:?b+>P'XA0>u)Bk)6-+<VdL+<VdL+AP6U
+E)41DBMhG5t"LD9N_^?ATAo(E-#T4+=BHR6V0j/2((I?+<XEG/g+Y4DJjB7+Cf(nDJ*N'E+*cq
D.Rg#EXE.K67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(..*EZf:2+EV..@rrht+>Y-YA0<6I$>"6#
A8lU$F<Dr/76s=C;FshV-OOF*+CoG4ATT%B5uU-B8N8RT4#%(REZen3F(KG9-W3B45tOg;7n"de
0a\7_67sBt@;BEsEb/Zi+E).6Gp"[]@q]:gB4W30Bl%T.AmoCi$>"6#A8lU$F<Dr/76s=;:/"e<
$>sEq+CoG4ATT%B5uU-B8N8RT4#%'L:-pQUEb00.ASrVB+Co1rFD5Z2@<-W9BlbCp76s=;:/"dt
ATAo3A0>u)Bk)6->9G^EDe't<-OOa&EZen3F(KG9-UCZu8P(m!-Ta!h$;No?+DG_7F`M%9FCfN8
+D5_5F`8I7G\M5@EscK!+CoG4ATT%B;FNl>=&MUh74/Es+BosD+Co&"+=D8BF*)&8Dfp"H$;No?
+E_a>DJ()9DfTB0+DG^9Ci<`mARlouDe'u#CghC+$>"6#-Xgb.A7TUf-QmANF<GI;?X[\fA7TUf
?Q^^D$>"6#B6%r6-Zip@FD#W4F`8]iDJWZgC2[WnDdm&r-RT6.:-pQUEb0&qFD5o0+EDC=FE8R6
AS5^p+EqOABHS[O-OOF*+CoG4ATT%B;GU(f7Sc]G78bKp-UL*e;GU(f-OL2U67sBhFED)2E-*4E
D]in*CLnW$Ec6)>+EqO9C`m=uBl"o$ARf.kF(HJ4AftPkA0>o2Dfc>(ATAo1Ci^^HFCfN8B6%p5
E$ku":-pQUEb0<'F<G[D+Eh10Bk/?,Df9_?@;]TuEb0)rCLnV?+DG_7F`M%9FCB3&ATT&,Derrq
EZeq<BleB;$8EZ-+DkP&ARoLq?X[\fA7$HAC2dU'BHS[O8l%iS78m/=FCfN8A8lU$F=.E,EZen3
F(KG9-W3`9<(9YW6q(!$4"#JL:IJ/N;cGDlATMs(E-#T4-OOF*+Dkq9+=D8BF*)&8Dfp"H$47,8
67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIV
FDYu5De!-?5s]U5@<6*B3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RC
AfrL5A18WLDIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QR
A18XCATMs7+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha
$;No?+EV19FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0
F!)SRDfQ9o:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+
F(Jl7%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(
Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1-#dN
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)
FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/
DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is
/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-Y
A0<6I%13OO:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaGDfTB0+E(j7G%#E*Dfp+DFEqh:Et&IcDf9H$
Dg=K,+>=63Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p,To$)%15[?@<Q3LBOPpi@ru:&4ZX]5BQ&);
D09?%+EqaBA0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-@r!G$$=n't@VfUpCisfADJ*m+A3Dsr.lne<
+=fJ^$=RdjATD="F?MZ--8#`7GA^i+ATL!q+?MV3@W-1$@W-N7Ao)BoFDYS38SDOUAOC->Ea`I"
ATAo(DfoN*AT2I.F*2A5Df9//@;TspEb'*1-OgDH0RInYE,9H&+E2IF+Eq^3D.Rbt$9g.jF>,j=
+>=om0Hb">F<GdF@;TRs%13OO:-pQUARoLs+EqaEA0<:<@;TR,@r,RpF"DEEG]YAWFCAWpAISu$
+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl4"u#*DIIBnF!+[0ARloF0me!r%13OO:-pQU
Bl8!'Ec`FGATMs7+CT.u+CT.u+DkOsEc6".$9g.j0d(FXF<DrQATMs%CiF&r0JFk9-Vcu\+DG_2
De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JOq:-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j
0d(FXF<DrQATMs%CiF&r0JY";-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j1a$a[F<DrJ@:O=r@;Kmr
@5'A_4#/NP-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'D`4#/NP-SZ_o+>G5Q$4R>+0RImr
4ZX]?+D58-+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8@;Kmr@5'&<$4R>;67sBlA8--.FCfN8-uNI1
ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd+[/KcDl4"u#'DIIBnF!+[0
ARloF0me!s%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs4ZX^6/g)tnA8Z3+-Z*:%Ec5B&E+iZ6-OgCl
$;No?+D#(tF<GF/@rcK1-uNI1ALq>0A7[<6AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKu
ARoLsDfQsV+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(1(=R"$4R>REZd.\De'u4A8,Oq%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eXD/X3$3B9*,B5DKqF$a;VBk&hN0ht%f.VER9@WOkEF(o,<0JO\l/M/(f@UX=l
@j!14Ci<d(.3N_DF*)IU%15is/e&._67sB[ATMs7+CQC)@;0P#Eb-A-DBO+2Ch[E&DIIBn+D#e>
Ea`I"Bl@l3A8-*pDg#]4ARlp-BOu&j$;No?+Dbt)A8,po+EMI<AKYo'+@:!U+@9X[DIm<nGpdYU
8g%V^A7ZltDKKe>8hM5/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB80lCoQ1,C%qE+EC!ARloqDfQsm2_Rj=DKU15$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.
ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.
$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a
@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R=O$;No?+CfG'@<?''
@3B`)Eag/8Bln#2DJpY1Ci<ckC`mn0EbSrkCh4`0AS,LoASu!hF"Rn/:-pQU@;Ka&FD,5.@<6L(
B5V9k+DtV)ATJu&Eb-A:@<-(#F`SZt+Cf>-F*(i.FE8Q6$;No?+Du+8AKZ&-Dfol,+CT5.ARTU%
@<3Q/@;TRs+EqL1DBL??Ci<d(.3N>G+CT5.Ch[Hk/e&/0ATMs'Df0W<@;^1.4ZX]A+?CW!%16N,
/g+LUC,$/)@Qc=d?T33g%16T./g)o*E]":5A3DOf?SQ+N%16]1/g+LU@PKeN$=u@Q+>P`t%16]1
/g)ui3"63D%13OO:-pQUF(fK7Ch+YtAKYQ$E--@JB5DKq@;I'&BleA=/Kf(FAn?!*FDi:>@;TQu
Bl5&8ASlB/Ci<flCh4%_0KgXEHTE9^Ci<d(+=D8BF*(o1DKBo.DKKr,-S0@VE,9H&/14dP%13OO
ATD4#AKW@BATMs'Df0W<@;^1.-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?O[?TCi<d(;f-Gg
AO1BYBkM<;0JH6g/h1LMDdmcdD/X3$6$%*]B5TCW0H_J\F=f'e+<YB9A8-'q@rrh9@<6L(B5VQt
DKI!DDe:+7+D5M/@UX'^$;No?+E_RAF`2A5A0>buD.Oi+BleA=DJsZ8F"Rn/:-pQB$;No?+@U<k
DfQt2Bldd&G%G]*A0>E*EbTE(+E_a:+E(j78l%htDf-[O3?V+-F<E=m0f:(.1-.9L3]&Q#$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG'@rsCb%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)l-D..]E1*C1CDII?tGp$^5GT_*ABlbD7F_Po*DI[5e$;No?+>Gfl@<jRb+CSek+E)F7
EcPl)AKZ)'B-8U/3[m3Q%15is/g)l.D..]F1E^1@@;]^h+E)F7EcPl)AKZ)'B-;;7+=K?5.6T^7
/Kf+GAKYl/F`&<r8Q\DL:KBn^%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV
-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6mk&N%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUDJpY7Bm=3"+CT>4BkM=#ASuU2%16rdG\(DW
DIdI%ARfgJF)u&.DGP%%4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$CO&&q+=DJR
F`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf>n%-L4Y@j:%16Q-3Zp==2BWG9.1HUn$;No?+Du*?
D/"6+A0><%F(o9)D.RU,F!+n/A0>o(A9Dd#@;^00E+*cuDKKQ'F(KD%$>jL%ARnAMA8-'q@rt"X
F(o9):MV[J3]%s?+>=63-n%f$FD,T'6#pU\D.RU,F"&P$/g)hW$>+Eu@r$?Q/g)NfDfp//;g2Y_
?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`-n$Jl@WcL'.4H\p4ZX]5@rHR#Dg<]>$7QDk%15is/g,"F
G\(D.@<6L(B5VQtDKKqB-t[U>@jrO7F!,UHARlomDffY8Ci<flCi"A>@;]TuB5DKq@;Kb*%16rd
G\(DWDIdI%ARfgJF)u&.DFJSdDfRNp3]%s?+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y
3ZqWL.j-Mg.Ni"+$7QDk%15is/g,7LATD?)@<,p%D/"6+A0><%F(o9)D.RU,F!+q'@psM$AKWC5
F`(\<+DtV)AISuA67sBpF!+q1FD)e5De!3lCj@.3DIal&Ci<ckCi"A>@<6L(B5V9k+EV:2F!,1<
+E)$)$;No?+DG^98g%ScF<GX@DfBZ@+DtV)AKZ,:AKYE&+D,&&+CT=68l%htBlbD,Df0&rEc,H!
%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfRQq3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2.6T:+0F\A$
F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;YhVEcPl)AP$cMBl[cp
F?sthBkM<<4ZYDB3Zp*c$;No?+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z-r"8p
BQ%EIEbBN3ASuU2.6T:+0F\A$F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`
.1HUn$;No?+D5M/@WNZ.Df9E4+D,P4+EqaEA0?&(Cis<1+DG^9@UX=h+Dbt+@;KKt%15is/g+VK
+Co%q@<HC.+Dbt7CER>/+EV19F<GC<@ps1b+D,P4+EV:2F!,R9F*%iu%15is/g,1GFEMVAF!+t2
EcP`$F<GU8F*2;@%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCG9*]5s]R/DeioE3B:Fo
%16Ze+>GSnB5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0OI+36$$m]CLoLd3F=-C$>"6#B5DKq
F!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0jd446$$m]CLoLd3F=-C$>"6#0eje`Ci<d(+=D#?G\(DW
DIdI%ARfgJF)u&.DGP%&?U6tDF)>i2AN;b2?RH9i%15is/g+\9FCes(+Dkh;ARlotDIdI%ARfg)
@<6L(B5VQtDKI"=@;TQuF`V+'$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0OI+3
6$$m]CLoLd3F=-C$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0jd446$$m]CLoLd
3F=-C$4R>;67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,Et&IfEZf"2Ddmc1-VnnsEcPl)AP$cM
Bl[cpF?sthBkM<<?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-VnnsEcPl)AP$cMBl[cpF?sth
BkM<<?U6tDF)>i2AN;b2?RH9i%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcdD/X3$6uQQh
0MXqe.VER9@WPIbDeioPDdtIT+ET1e+=Ll=Ddmc:+CoD#F_t]-F<G19@:sFgDKI"CATMrG+:SZQ
67r]S:-pQU<+U,mARlp#@<?($Bjkg#De!:"EcW@;DBN\4A1hh3AhG2tDKBr@AKY]/+EqaECND*;
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPP(@<jUb%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>
Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDm
DeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<
<'aD]I4Ym8%16rdG\(DoF)u&.DJ`s&F?MZ-1E\_$0F\@a67sBP+D>2,AKYD(D/"6+A0>N$Ddm-k
+CT.u+Dbt+@;I&pF)u&.DJ`s&F=n\9F*1o-Cj@QSFD,B0+DGm+$;No?+E27;EZf7.D.Oi"BQ%Tp
AKYH)F<G[=ATD?)@<,p%B5_^!+ED%%F)Pr;+D,P4+EM[8BHU`)F(o9)D.RU,F"Rn/DIIBnF$2,u
4$"a5AKYE%AKYW(Bl7Q+FDi:2AKYW%Ddm-kF!hD(-uNI1ATK:`3ZpO4@r,RkA7]h(Bl7K)B5DKq
@;I;#$7QDk%16T`DJ"$4Bl7QH3Zp4$3Zp*c$;No?+CT)&Dg*=@Bm=3"+CT>4BkM=#ASuU2+=K?5
.6T^$$?K]qE+NisF)sJs+?V#]BldX&@rH=#DJ*<jF'j!,?Zg6nGAh8.-OgD2F(9--ASbq!F"'75
+EM%2E+NisF)qct.1HUn$;No?+Dkh;ARlolF)u&.DJ`s&F<G[GBkM'iEcW@7EcQ)=%16uaEZf"2
Ddmc1-Z*RBARo4jF(o9)D.RU,?U6tDF)>i2AN;b2?RH9i%15is/g,(UATDg*A7Zm*@:p]kCi"$6
F!,=6G\(D.@<6L(B5VQtDKKq/$>"6#B5DKqF!)i?Df000F(oN)?U6tDF)>i2AN;b2?RH9i%13OO
:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B6%riD/X3$0JH6g/h1LSE)UUlCLo1R+ET1e+=LlCE%)o>
Eb/[$AKYQ$E--@JB6%p5E-!W@$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is/g)8Z+>G;fFCfN8
+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQU+<Vd^.3MMW5t"dP8Q8,$E-67FA8,Oq
Bl@ltEd8dGE+No>%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(FBD..]F1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\
6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g,(OASrW!DIal(
DKBr@AKXl>5t"dP8Q8+f$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$>"6#A8lU$F<Dr/76s=C;FshV
-OgCl$;No?+CfG'@<?''ASlC.Gp$a?Dfp".$>"6#B6%r64==c^Dfp#:F_kkJ-OgCl$;No?+CfG'
@<?''ASlC.Gp$a?Dfp"A/Kf.KBlbD/DfT\;De!:"EcW@6F`M26B-:`-D/^V<ATMs3Eb0;7De:,'
D/aTB+D5_5F`;C2$>"6#B6%r6-YII<F`;5@ChtgR4!uBb$4R>;67sBtF_l/6E,9).DKTc3F!,RC
Ch7WqFCetl$>"6#B6%r6-YII<F`;5@ChtjS4!uC;-RUHR3\3C-/hd_A%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eXD/X3$3B9*,B6%s-Bll[MF(o,<0ht%f.VEd@Ch[uX@<6-m0JO\l/M/)S@<6-m+EV19F<G16
EZf4-Bl5&.De*ZuFCfK$FCcS<ATD6&-tdR>Ch[u?/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2
F!)lGDe*ZuFCfK$FCcmD+CT.u+=LuCA18X8F!,:;@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F<De!lC3=Q<j67sB4/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?
@<6!-%17,eEHPu9AKW*<-YdR1FCfN8ATAo.De*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eY
Eaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8
+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$8EZ-+>Y-YA0<6I%16Ze+E(d54$"a(De*BiFs(O<
A0?#:Bl%i<%16Ze+EM+9C2[X!Blmp,@<?''-Y#1jFCf<.-OgCl$;No?+D58'ATD4$AKYetFCf\>
AoD]4@;Ka&B6%p5E-!.?DBNn,FD)dK+CQC&Ecl80BOu2n$9NSe+u(3]BQ&*6@<6K4B6%s-Blk[c
+FPjbB6%r=-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?YXLi@:s.MD/X3$6t(@^0JH6g/h1US
A79+^;f-GgAOKsPF"f9jF=f'e-u*[2@:s.#+Cno++DG_8ATDs&C`m4rDJjB7+C\n)DImHhFD5o0
/e&._67r]S:-pQU@rc-hFCeuD+AZKhDdm9u+>Gc*+>PW)2[p*h67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72e6K00Jstj
Dg*=HF(oN)+=M>CF*)/8A17rp:-pQU0emQaFtu$"F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.
D..]G0d(UXA79RkA0>K&EZdss3%cmD%13OO:-pQ_78d#Z;E[2d-u*[2@:s.#+Eq78+ED%8F`MA6
DJ()!0d((HEZen$Gp$g=FCfK9@;L!;+:SZQ67sBk@<?'A+>Gbs:LeJh1,(C@+>>f:2)dQM1^sd$
$=e!aF`MM6DKI!K@UX=h-OgCl$8<Sc+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$8EYT3ZoV!
-V@0&6VKp7;GTqmBkhQs?RH9i@r,^bEZc_W%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OOATAo3A0<7AATMs.De(OU-OgCl$;No?+Cf5!@<*K!DL!?Q
H=_,8@:s.#+EqaEA.8l#+Bot!AS`K;/g+\BC`k*OATD]tB4WG"$4R>;67sBpDKBB0F<G!7GAhM4
+Du+A+EVNED..3k+DGp?0Han7H#k*HCh*t^H=_,8@:s.73Zp4$3Zp*c$=Q(M+F+D'@3@$B0ea%D
.1HUn$>"6#E-67F-[K?EDdd9i-OgCl$=RRY4ZX^#De*9hAKW@HATD]tB4WG"$4R>;67sBmBl\9:
+CT.u+DbJ-F<GOFF<G:8FCfK9@;L!-F(fK7Ch+YtAKWZ9$8<Sc+=nWs-o!eG0fq-51b!c43ZqjD
AIStU$;No?.Rm!34[(!/Dfor.ARlp/H$O[PD.I00AnE/r@<?(%+EVNEBl8$(B4Z+)+C\noDfTD3
@ps1iBl7Q+-tHb3@:s.#+DG^9-u*[2@:s.#%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!@3BW.@;Ka&
@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>CF*)/8A2#\d/e&._67r]S:-pQU<+oue
+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08/e&._
67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o
+EV:.%15is/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S:-pQU@<6L4D.RcL
%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<B^B.u4Q$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E_X6
@<?'k+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$9g.jDe't<
FCfN8C2[W:0IIuI+>Y-YA0<6I%13OO:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJATJ:f6;LBN5u^WS
0KhH>0F\@U:JXYM<)64C4ZX]?%15Et:J=GR;cGn@+?qJ$0eb:+1(=RW:JXY`5se764ZX]M/g*"o
0f'pt+>OB5%15[%<'aJZ9e\^k+>F<48PW5a5se764ZX]M/g*"o1F+\/0F\?u$:[]b5u^NL;cGn@
+?)533B83.+?qJ$1GCL-1,B@H%15Hn5uLBJ;cGn@+=B`'@;R-2BOQ!*8K_GY+C\nl@<HX&+A!\d
D]j7;@<<V`+CoC<%13OO;cugo5sd^q+>Y-!2]s@gF#kEk+EqB>@<,p%F*VV3DesJ;@;]TuFD,*)
+DGm>Anc-o-OgCl$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj69iODF%13OO
:-pQUF*)>@AKYf-@ps1b+EqaEA9/l-Afu&5ATMF#F:AR*1E\_$0I\@s%16f]/g)BVCgTIo6$$m]
CLoLd3F<nC/i4\]D_;J++<Wj%HRD*F6$$m]CLoLd3@>qgF`\aDCgTIo6$$m]CLoLd3F<nC/i4"E
AScF!BkAt?,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_F(K&t/g+\C/e&.1+>=o\%16Za
A1e;u.1HUn$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)F>,((-SZ`,+>G!667sC&ATMr9
F(96)E-*H:$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4CiaH3CLo1I4!6UG-ULU)9L2WR
9e[\V:JXYM<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2AM>Jn+?MV38PW5N<)64B+A#=-
<'`iE74/NO%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o@:O=r0IJq;0fpas/g)o*
-OgDH0RGW!E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1Bl7Q+@Wcc8De!:"E-WRI
E+*6f/g*_.@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,OqBl@ltEd8dGE+Nnr$>aWhA5d>`
CLqU!F*'-367sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afr47
@VTIaFE8QIBl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#gF!)TIATMr9+EM%5BlJ/:
+Dbb-AKWC;Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq:-pQUBl8!+A7Zm%FD,6+
+EV19F<D]I@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]IDJj0+B+52C67sBsDe!3l
AKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O%15is/e&._
67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2.:W?0K'@I:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0fX#YGqq3!F`:l"FCcS,DfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.
$4R>+0RI_K+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,@VEb'56De:,8@<-(#F`S[IH#R>9
%16Q_Deq^=:JEN+3Zp*c$=[plCdD#r9eedl+>F<4@W-1$9M&/^4ZX]M/g)l&0I&=^$=[plCfE\e
9LV**+?qJ$2'=V0+=&'b%13OOBl8#Y<)64B4ZX]?%16feFAtOm9LV**+?qJ$2'=\#0eb9j$4R>S
Ci<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/%13OO@q]:k9M&/^4ZX]58K_GY+EqL-F<F-t@;R,r
ARf.kF(HIc+CoC5GA(E,+A!\dD^Pu$%170%D,`ef4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"
F!+n/A0>u-@<<W+F!,(/DIk1)$4R>ODg52[<CTG@3Zoh56;LBN9M&/^.4cl07SHTD<(ok^<%0@\
;cugo5sc"f%15is/g,4WDfTD3Ci<flCh4`5DfTB0+DGF1E,oN2ASuT!$7I\Q3Zp+*-RT?1BkAt?
,Aq=)5s[eXD/X3$3B9*,+DEGb+CoCC%144#4tq=25s[eXD/X3$3B9)I+E2IF+Du"&5s[eXD/X3$
3B9*,+DEGb%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+E-67FDJUG0/i4"EAScF!BkAt?A8a(0
$6UHF+<V+#ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?0RGMsE-67F-Za-CCLo5"ATMrI-T`\1
+?^i%+AP6U+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U+EV19
F<GX7EbTK7-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQE$-N;Df9H5D/X3$0df%*4$"`uDf9GX
<)64B+C]8-CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](
DKJiD6;0fq%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo+?MV3F)>i2AMI.q
F*')YF)>i2AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".$9g.j1a$a[F<DrPD/X3$0hl(dEc3WZ
4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+
F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO:-pQUCh7$uAKYMt@ruF'DIIR2+E)41
DJX6"A7Th"E)UUlCLo1R:-pQ_Ci<`mA9Da.;f-GgAM>e\F=f'eA9Da.+EM%5BlJ/:Eb0'*@:X(i
B-;84Deio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU
.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcH
FD>`)0JFj`$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
2/cuH0Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq9#F`:l"FCeu*AoD]48g$)G0K1+qAS!nFEccCG-Y%1.
@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV
-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG
@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;R
Deip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<.3L]5-ZW]>
Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%159QHZ*F;-Zip@FD>`)
0JFjs>9G^EDe't<-OgCl$;No?+EVaHDBNk0Afu20D.Rd1@;Tt)%159QHXq):ATT%B;FOPN8PVQA
741/N%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".
$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is
/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1f
Ddd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sBk
F_u(?@s)g4ASuT4@;]TuEb0'*@:TfSA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+
HTG\L%13OO:-pQUFEMVA+E)-?FD5T'F*(i-E-!.1DIal#F_u(NEb0'*@:TfS4tq=oE-#T4+=C&U
<'a)N5t=?k4#%0OA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]R/DeioE3B:G_Ddd0uATMrI0JR*P@ruF'DIIR2:-pQ_Ci<`mFCfN80JG4lBk)7!
Df0!(Gp%2\/KekJ@:UK8GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>GTf@<jU^+=Lr=De(:>Bl8$(Eb8`iAKYf-@ps1b+CSekARlp*
D]iLtF(HJ'@<?0*%15is/g)8Z+<VdL+<W(IDe*s$F*(u6.3NYBEHPu9ALD&"%15is/g)l'DJs\R
1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is/g)l'DJs\R1E\)ZDf^#AAT0(@Eb0*+G%G28+=M>C
F*&iRA7]RgFCeu*/Kf+GAKYGnCi=M,$;No?+>G`gF`&rm+D,2,@q]RoB-8U%ATMr]Bk)7!Df0!(
GsldlE%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l-C3=DL0Hat=FCSuuDJ((?8oJ6=
Dfp)1APcfWBLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l.D..]G0d(UXA79Rk
A0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?
+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBQ:IH=HDfp)1AKZ28Eb'56/KenAEbAs)
+E1b2BHUi"@ruF'DIIR"ATJ:f:-pQU:LdmCF(oQ1@;Kb*+ED%1@;BEsFD,B0+CoV3E$07@+EVX4
@r!2sBOPdkATJu.DBMPI6k'Ju67sBE0RIYFCLnV\De)dbF`Lu':gnHZ7!3?c4ZX]6C2dU'BHS[O
8l%iS78m/5.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.F*&O8Bk)7!Df0!(Gp$U8DKKH-
FE8RGFDl22A0><%+CQB%$;No?+CoV3E$043EbTK7F!,17+EV:.+=LuCA9;C(F=A>CAThX$DfBQ)
DKI"3Bk)7!Df0!(Gmt*E0RI_K+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$7Bk(+EM(%F=044+>b3RATT%B<+U,m6tp.QBl@ltEd:&qD/^j3$7L6R+u(3]A79R/4ZX^43[-:$
F(A^$%14J'@j#i'@<<k[3Zp7%B4Z0--VA;f;f?f!@qAJFFD+'bD/^j3$7L6R+u(3]A79R/4ZX^4
3[-:$F(A^$%159QHSZd_A0<77De*s$F*&c=$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%16Ze+E(d5FC])qF:AQd$;No?+Co&"ATVK+@;Ka&GAhM4
F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1
A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!FCfN8+CoV3E$043EbTK7+:SZ+
-nlf*0eb:1+?DP+0KLX*<+U,m6tp.QBl@ltEd:&qD/]pk@rGk"EcP`/F<G[BE,9H&?U6tDFE1f2
BK8(5?O[>O$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-
Et&IfEZf=0@r#TtFC])qF:AQd$;No?+EV:.+D,P.Ci=N3DJ()+DKBB0FE8RA@;^?5F(oN)Ch4`*
Bl7K)A7]glEbTK7Bl@m1+D,P4+EqaEA9/l;Bln$,F`\a:ATM@%BlJ0.Df0V=%16#s3Zr$UASrhY
+>=om+>Y-XDe404+=ANG$<')K+B'C-INU%$0I\,n3Zrc%+u(3=%16Ze+>=ot+E2IF+=MRh+u(3=
.3L/o+=K3'-9Nn)0H_Se4s525+u(3=.3Nsi-8%J)HTE?*+B&^V%15is/g,"BEbAr+Bl5%c:IH=H
Dfp)1AIStp-nlf*0I\,*3Zp+;.3M6$A5dDhEarZW@<?0NF_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf
6$.-UF(dQo3F<4&%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'
EcQ)=F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs
+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g*nb
<(.p)8PN#B+Co&"ATVK+FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9G%kA--rac!F@9hQFD5Z2
@<-W]F_u(H%15is/g+S?A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9FD,5.9L_Al/M/)eBOu3q
-Z^D=+A,Et+DkP&AISuA67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4F!,[@FD)e=BOr<-@;TQu
DIIBn+CT.u+Co1uAn?!oDKI"=@;TQb$;No?+Cf4rF)to6+CT5.ARTU%Bl5&(BkCsgEb0-1+Co1r
FD5Z2@<-'nF!,C=+EV:.+A,Et+E1b2BJ'`$:-pQU8T#YmBPDN1A8,OqBl@ltEd8cUFCfN8C2[W;
.3L$\ATMrB+DGm>@3B`)EagXD8T#X[$;No?+=M>CF*)/8A2>YWBlkJ3F!+m6DJsZ8/g+&'D/XT3
DJ()+F<G7.Eb-A6ASl@/ATJu9BOqV[:-pQU@Wc<2F!,RFBkM'iE\8J9BOu'(8LJ[m+D,>4ARlp*
BPDN18K`4kCht52@;BEsF*2M7%15is/g,7LBlbD,@<6!&BlbD;AT2[$F(K62ARlotDBO%7ATME*
B4YslEaa'$A0>u*F*&O8Bk)7!Df0!(Bk;?<%15is/g*o-Fs&Or/0H]%0ej+E:-pQU0d'[CA7]R"
-Zip@F=.M)%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#TtFC])qF:ARgEZf4-CLnV9-OgCl
$;No?+EM47G9CC6F`);B%16Ze+EM47GApu3F!,"-A0?=D0F\?u$>"6hDfB9*+>=63%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16oi@:XIkF*')i11Y*/FD5Z2
@<-Wg67sa(Ddd0uATMrI0J[0Q@ruF'DIIR2+ET1e+Dbt)A0<UO+>P']ATMr9A8,OqBl@ltEd98E
:-pQ?:-pQU:iC;qCghEsF!,R<AKYo3A7]d(0mFfr+EV19F<D]:Bk)7!Df0!(GqL49@<-H4De:,6
BOr;/Cgh?sAI;1!/g+b;@<6-lCh4`2ATMr9@psFi/db??/db??/g+SDF*2>2F#jY'67rU?67sB'
+>G;fASuF/B4rE!G][A3F<G+.@ruF'DIIR"ATJu9D]iM3Bl%<&0eb:8.j0%SEb$;7ATMr9A8,Oq
Bl@ltEd8!e67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP;"Dg!lj
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O]:-pQU0emQaFttirEb0*+G%G2,@;^?5-uWp4C12-3+Co1rFD5Z2@<-W#:-pQU0f<]g
DDF*mF`V,7+Cf>-Anbn#Eb/c(8l%iS78m/.AoDKrATA,Q67sB83,N)L1GL"pE+EC!ARloqDfQsm
+?1u-2[Tn%De!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$;No?+DGm>8l%iS78m/.
@rH6sBkMR/ARn"4/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OL2jDe!TlF)rIGD/a<0
@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!
F(KB6+=Cl<De(4&$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL3&A8,Oq4ZX]5FCfN8C2[W:
1+*D9:-pQUDfB9*+CT@7D/XK;+>GbsA8,OqBl@ltEbT*+$:IHQ<)Yq@+FPjbDe't<-OOF*+E(d5
-o!VB/gEbU6W?u5HS.]X6W?tk$;No?+CoV3E$0+.FD)"mEZf4-CLnW#Bl%?D3ZohcE+*j%+=DV1
:IJ/N;cG+n+=nlnC3=E0/no'A-OOF*+>Y-YA0<6I$49Np/g+tK@:UK9+>J*`A8,OqBl@ltEd8"'
EZf:2+EV..@rr%b:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOs
Ec6"+0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OL2U
67sBsDdd0!A9Da.+EM%5BlJ/$-n$bm3\W!*3]\B;3[l16Anc'm$=e!aF`MM6DKI"CD/a<0@p_Mf
6$.-UF(dQo3F<+#:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2
ASuU2$>"6#E+*6lA0>u)Bk)5l$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+
DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaEA9/)Q67sBhEb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6
+DtV)ATJu&Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD#0d'[C0Hb"EDdmc74s58++CoA++=AND$;No?
+E1b!CLePrDIal,@;BE]ATAo4@:O(`+EV..@rr&hEZf4-CLnV9-OL2U67sC%BQ&);@rHL-FE7e#
EZen,A0?=D0FA.uEb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5
@<6*B3B:FRCi<`mFCfN80JG:nBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C)A8,OqBl@ltEd8dL/M/)]
Ddd0!0mFfs+EV19F<G+.@ruF'DIIR2/db??/db??/g*u/E-5u*FCfM9+EV:.+E):2ATAnJGT\db
FCfN8+<Y3/@ruF'DIIR2/g*u!Ec`FBAfu2/AKYetEbAqj:-pQUAn>ClBjtmi+EV19F<G(%F(Hs2
:-pQ?:-pQU@<6L2F_t]23XSVK/db??/g)kt+=M>CF*)/8A2#_hFCfN8C2[W:1+=>SEb-A0Ddd0f
A-u'u/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emQaFttcZ:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.<)67sB82/78O1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrqEXGQ./g)l.D..]G0d(UX
A79RkA0>K&EZdss3%cmD$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$:-pQU
BlbCh:IJ/N;cFlLDf00$B6A6+A3UDQ/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5$4:9]
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>/DDeX*1ATDl8-Y[=6A1%]k$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL3&A8,Oq
1-IZ@-Zip@FD>`)0JY!_FC])qF>H'@+=D8BF*)/8A2#ee$49Np/g,(OASrW4ATMr91*C+A@ruF'
DIIR2+D,2,@qZunE,]i9GT^[.Ch=f6DfTB0$>"6#De'u4A8,Oq1(%T5+BM?:6rQ60+CoA++=AND
=&2^^;a!/aI4eSs;FFFj=&2^^;c?+Y4ZZY?;FFGH3ZqL";FFG+H[[(c-p0+I/NP=*=&2^^;^jpU
=&2^^;[Nk*:K0J<+>to-+AP6U+Dbt<+EM7CAI8cb@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ
<'2cX=&2^^;^ii9/g+4k;FFFj=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:6rOFI+BosE+E(d<
-OL2U67sC!E+No0@;]Tu@r,^bEZccPATMs.De(XQ$>"6#De'u4A8,Oq1C>iZ>9IinF!,")CaM=g
0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`$>"6#0H`)(+E2IF+@JXf;[P6%
>9G^EDe't<-OL2lEZf:2+EV..@rsI5Eap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=
6rPNWHS-FB:JsSZ$<L#$6rQ60+=KoZ<'2cX=&2^^;^ii;/g+4k;FFFj0d'[C1E^UH-RT6.ATAo3
A0>u)Bk)6@$>"6#0H`)(+E2IF+@JXf;[P6%>9G^EDe't<-OL2U67sBmATVEq+CQC/Dfd+?Afu56
F`V,)+>P'MBk)6-GAhM4F!+n/A0>o$DId[&Cj@.DAStpnAI<!h+E(d5FC])qF>=2):JsSZ4ZX]6
I4cXQDJUFC-Rg/i/g+4k;FFG^78+&/@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^
;^ii9/g+4k;FFFj6q'RD4ZX]6-nlcj+u(3.77L3)+=nil4s2s30d(.AA0<9F6q'RD.6fOu3@Q(!
4CL940I_Dm6q'RD$8EZ-+>Y-YA0<6I$4:?b+E(d5FC])qF>F88EZd%Y0ea_hF`\`o77L2_$;No?
+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-EscK!+E1b!CLeQ0
A8,Oq1C=Ia67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3
F!,=.DL!@KDfTB0$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3
Ec5o.Ebp"DA7]7e@<,pi/da<U>9GUBB5DKqF!a'nI4cXQDJUFC-OL2U67sC"@:O(`+CT.u+DkP&
AI<!h+E1b!CLeQ0A8,Oq1C@]6+DkP&AKW?J$49Np/g,4KDg*=6Dfor>EscK!+Co1s+FYFe$4:?b
AT)O!DBLV?$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,0Ddd0u
ATMrI0Jm<S@ruF'DIIR2:-pQ_Ci<`mFCfN80JG=oBk)7!Df0!(Gp%2\/KekJ@:UK8GT\gcFCfN8
+Co1rFD5Z2@<-WG%15is/g(T1:-pQU:iC;qCghEsF!,R<AKYo3A7]d(0mFft+EV19F<G+.@ruF'
DIIR2/g*u!Ec`FBAfu2/AISuA67sBs@<-!l+D,1nF(o*"AKZ)+F*&O7@<6!4%15is/e&._67sBh
F)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!9WGCi_.LATMs.De(OV.3N&>AKYf-@:Wq[%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;DJs\R1(=Rc67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB82/78O1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrqEX`@N67sB83,N)L1GL"pE+EC!
ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is
/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R
$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%13OOFC])qF>5p>+=D8BF*)/8A2#_c%172fBk)6A4ZX]5FCfN8C2[W:1a`_>%15is/g+tK@:UK/
F`_>6F"&5DEc5e;A9Da.%16Ze+E(d5-ZsNFCi^s5$>"6#D..3k+D,>(AN`'s-u*^0FD)dEIS*C(
<(0_b-RgSo05>WICG'=9F!hD(0d'[C1E^UH+=ANG$4R>;67sC!E+No0.!0$AFD>`)1asPUDIal"
Ch7$q%16Ze+E(d5FC])qF>OF60d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b
4<cI%BeCMc.3gr&-OgD2-nlf*0I\,*3Zp+;.3L`bBl%>i$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-U
F(dQo3F<4&0d'[C1E^UH+=ANG$4R>;67sC!E+No0FCfN8+>G!LBk)7!Df0!(Gp$^1FCSu,@;p1+
Dg3C<@;KNuGAhM4Et&IfEZf:2+EV..@rsF7$>"6#=&2^^;a!/aA8Z3+-RT?1=&2^^;a!/aI4eSs
;FFFm$<L#$6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%215V5#G,?IZ=6rPO!,?IZ=6rOO%%15d)
<'<8b2D?g-:-pQUCi=D<F(or3%13OOEap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=
6rPNWHS-FB:JsSZ%1604;FFGH3ZohE:K0G/,?IZ=6rPNWI4cXD:JsSZ%14g4>9G^EDe(4C%13OO
ATAo3A0>u)Bk)6A%16Ze+>=om0Hb=WF<Et?7T0a'0d'[C1E^UH+=ANG$4R>REZf:2+EV..@rsF7
$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]6
9M\VM/gFFn;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De'u4A8,Oq1^se'EZd%Y0ea_h
F`\`o77L2b$8EZ-+>Y-YA0<6I%13OO:-pQUAn?'oBHU_+Ci=D<De:,7DKU#3A0<TLA8,Oq+EqaE
A9/l%DIal1@;]UoD/=J?Eb0,sD.O.`ATAo3A0>u)Bk)6>%1604;FFGH3Zoi!/g+\BC`k)Q.3L2p
+BM?:6rR#Q9FV>L@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k;FFFm
$:I<P;a!/a-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpcAN;1^-p1p!4"r+3+@JXf
;[j'g+BosE+E(d5-RT?1%16Ze+E(d5FC])qF>OF6ATAnI+>GPmE-67F6q'RD%13OO:-pQUE+*6l
+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!CLeQ0A8,Oq
1^sd$$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+DfTQ0B-:c+Ec5u>+CT=6
D..=-+EqaEA9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,F!,@/D.Rc2@<,p%Bl.g0
DfB9.Cj@.6ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC-OgCl$;No?+E1b!CLePrDIal,
@;BEs%16Ze+E1b!CLeQ0A8,Oq1^se'EZf4-CLnV9-OgCl$;No?+EM47G9CC6F`);B%16Ze+Co1s
+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5
@<6*B3B:FU$>jZs;f-GgAO1?LF"f:C67sa)DJW6gDeioMEbBGI0HbHh/KcHYDJUaEF(oK1Ch4`4
@;KXg+CT;'F_t]-F<G(,ARfLs/e&._67r]S:-pQU6YL%@CNCV,Cht5;@;KXg+CT;'F_t]-F<GO2
FED)7DK?q4DfQsKD/O/=/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f/hSac$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPP%F`&lg%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$;No?+=M)ECagKLDJX$&AKYi.F*&Ns:IH=LDfTB0
+CoD%F!,@=F<GU8EHPu9AKYo1ASrW$Bk)7!Df0!(Bk;?<%15is/g*r-AKYo'+EV:.+C\c#Bk&9.
F(KD8De:+?D/O/=+DGm>FDi:C@ps6t@;Ka&Eb/ltF*(u6ARlooBk)7!Df0!(Bk;>p$;No?+D,P4
+EM76E,9).DIIBn+E1b2FCfK1F"Rn/%16Ze+Dl"4+=ANZ+<Ve%67sC)Bl%T.Ch[s4+CT)&+EqaE
A9/l-DBNA(C`mb0B5)F/ATD?m+Co1rFD5Z2@<-'nEt&Hc$;No?+EM76E,9).Bl8*&Ch[E&@<-"'
D.RU,Et&IoATAn@GB.V>B."g=DJUFC-OgE#ATAo1DJUFQ+<Vd9$>sEq+Dl"4+?MV3DJpY,Dg5i7
+D#5"-OgCl$>"6#0Hb4MC`k)Q+<XEG/g+S=C`mq?Eb'56-uEm?@:Uer$>"6#0d(=NC`k)Q+<XEG
/g+S=C`mh2F*)I4$>"6#1*CFOC`k)Q+<XEG/g+S=C`mA2Dfp#?%16Ze+>Y-WDJUFC-QjO,67sBh
Cht58F_Pr/Et&IfEZd1]D/O/4-RU#Z:-pQU@;Ka&D.-ppDfZ?p%16uaEZd4^D/O/4-RU#Z:-pQU
Df0B:+DtV)AKYf'F*)I4$4R=O$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Z'G!A5d>`CLoh@
A3k6KF_t]-FE9,i:-pQ_DIn$&;f-GgAO9g96#pU\D.RU,F"f9jF=f'eBl8*&Ch[E&-uNU?A18X0
EbBN3ASuT4FCfN8F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zq.*Gp"h%3B83)%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P++:SZQ67sB72f<PW+<VeLE+EC!ARlp*D]hYJ6m,)EG%G]8Bl@l3
2D-[=.h)h\67sB72e6K00JstbDfT]'F:ARP67sB80lCoQ1,C%qE+EC!ARloqDfQsm2_Rj=DKU15
$;No?+>Gim@<jX`+E_X6@<?'k+D,P4+A*b9/hf3n$4R>;67sB[BOr;uDes6.GA1r-+DG_4F`_[I
F(fK7Ch+Z/ATN!1F<G:8+D#S6DfQt;ATMp$B4Z-,-uNU?A19,?$=e!aF`MM6DKI!K@UX=h-OgCl
$8<Sc+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$8EYT3ZoV!-V@0&6VKp7;GTqmBkhQs?RH9i
@r,^bEZc_W%13OOEb065Bl[c--YdR1FCfN8ATB.-$;No?+D#e:ARfgrDJ()0DffZ,DJ()$F`\a;
EcQ)=Et&IuATMs)DK]`7Df0E'DKI!K@UWdp4"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is
/g)Q[ATqZ6+CSbiAT2a4+E).6Gp$R4@r*8>/KeM@G\(D.Ch[s4F!,C5+Cf(nEa`I"ATAo0BleB;
%15is/g+bECi"$6Bl7Q+@<-"'D.RU,F!,O;Dfol,+C\n)Eb/us@ru9m/e&-s$;No?+Du==ATDKp
+CTA1D0$-nATAo2ATqZ-0F\A#EZf72G@VgP%16Ze+Dtb7A0>58%16Ze+Dtb7A0<W`/iO4HATAo2
ATqZ-3,18Z$>"6#DIn$&+>GK.3B&j-1,KFIATAo2ATqZ-0mGDq+<VdL+<XEG/g,7LAKYl5D.7's
+Cu[0DBMO\$>"6#DIn$&+>dMI1^se'EZf72G@VgU3&ilW3&iiU2`EZS3B9)[3B9)[3B9)[3B9)[
3B9)[3Htu?ATAo2ATqZ-0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`fU
%13OO:-pQUF*VV3DesJG+E_R9@rGmh+:SZhEZf72G@Vh;3[Z%fDffE*@;TR'%16Ze+Dtb7A0?"U
+=D&FF`(o'De*Es@;TRs-OgCl$;No?+Du==ATDKp+CT;2@<lo:-ura6A8c<-F(f!$ATJu&DIal2
BmO?3.1HVqEZf72G@VgE5:A`Q.3gVt,VTZ7ATAo2ATqZ--pK+E1asY*.3p\Y$>"6#DIn$&+=KH&
5;Xf61FXSV1CX\&EZf72G@VgE5:A`Q.3gVt,Vh/.2[p+*EZf72G@VgE5:A`Q.3gVt,WKNq%16Ze
+Dtb7A0<9b-pKO;,;Ubo0ePFG2`>5&1^se'EZf72G@VgE5:A`Q.3gVt,WIbC3&ilW2`EZS2`E`W
3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+Dtb7A0<9b-pKO;,;Ubo0ekF=1G^jE2)R9M2`E]U3B;+=
3&`fU3&`fU3&`fU3&`fU3&`fU3&`fU%13OO:-pQUASlC.Bk;>p$>"6#DIn$&+DEG^%16Ze+Dtb7
A0<6I%16Ze+Dtb7A0>;A%16Ze+Dtb7A0<WP@6+i)ATAo2ATqZ-1F$<h%16Ze+Dtb7A0<QO1+kNq
$>"6#DIn$&+>=ol,VTZ7ATAo2ATqZ-0H`%p-RpJQ$>"6#DIn$&+>=oq,WmGhF`VXIFCfN8Bl7Q2
%16Ze+Dtb7A0<`P0H`.s2BXh!3=Q<)$;No?+C]80A7]dtBl7K)@psFiEt&IfEZf72G@VgM4!uBu
+<VdL+<VdL+AP6U+Dkh;ARlon@<6"$%16Ze+Dtb7A0<6I4!uC;0F\A#EZf72G@VgD-T`_=4==TV
D^Qtq-RT?1ATAo2ATqZ-1HQs34!uBb$>"6#DIn$&+=ANu-RU#Z+<VdL+<Ve%67sBhCi+*3F<G(3
EcP`$F<GIDCht53@;TR,+Du=<C`mP4@psInDf-!kATAo2ATqZ--RUu'-T`\'+<VdL+<XEG/g+S=
D/XK;+Cf>1Eb/a&+Du=<C`mV(D.P7@Ci<flFD5Z2/0JJA@s)X"DKK</Bl@ku$>"6#DIn$&+=CW:
D^RUo-QjNS+<Ve%67sC(@;KXg+DtV)ALnsAF_kk:Ci<flFD5Z2%16Ze+Dtb7A0<6I4""N!>^1L&
Df7!G+<XEG/g,%SCht53@;TR,+Eh10Bk/?&De!3tBl@ku$>"6#DIn$&+=ANu-RUu'AoDg4+EM%2
Eb-A%DIakB/hSLo:-pQUDKTc3+DtV)ALqY9@psInDf-\9CER/+@s)X"DKK</Bl@ku$>"6#DIn$&
+=A9Z4!u-u+<VdL+<Ve%67sBiCgh3sEt&IfEZf72G@VgD+<W$n-Qjcu-QjcG$4R>;67sBlEZf72
G@VgDFCfN8-QjNS+<Ve%67sBuD]ik7@psInDf-[L+EV:2F!+t$F(HJ.Et&IO67sBuD]ik7DJ*O$
+CT.1ATDg0EZed5A8,OqBl@ltEd8dAF!,@=G9CC9ART[lA0>T(+CQC'AS,@nCig*n:-pQUA8-'q
@ruX0Gp$pA@psInDf-[?-q[ocF^]<9+>PW)0I[G<%16Ze+Dtb7A0<7/@:UKjBOPq&+C$9'$>"6#
DIn$&+=Aim-OgCl$;No?+Dbb-AScW7FEqhDEt&IfEZf72G@VgDFCfN8-T`\\H?s[OE$lbN:-pQU
A9)C-AKYf#FED)7+ED%5F_Pl-A.8lWEZf72G@VgDFCfN8-T`\hATD?0+<VdL:-pQUE+*j%+Dl7B
F<G%(+EDC=FCeu6+D!0</g)8Z>\I\hAISuXEZf72G@VgDF!j$sF!i(Q+<VdL+<VdL:-pQU+<hpP
%16Ze+Dtb7A0<7AATMr@4""N!BOu3q-QjO,67sB'+s8'=$>"6#DIn$&+=D8BF*&ck-Y#1b+<VdL
+<XEG/g)8\+<h7%ATAo2ATqZ--Zip@F=0-t@ldjB+<VdL+AP6U+<Y]CDffQ$+C]J8+Du*?A8-'q
@ruX0Gp%!5D.O.`%15is/g+kGG%#3$A0>E'Bm+&1DIIBnF!)l,;]oU^E+NotASuT=%16Ze+Dtb7
A0<7AATMr@4""i_DJ+-2CisT+3a?oSDJsW%DeiTlDHqC"DE0R%%16Ze+Dtb7A0<7AATMr@4""N!
3a?oSFDkE$@;^?q@rH1%DKB&1%16Ze+Dtb7A0<7AATMr@4""NC3d>mkDd7C)@;^.*Df]K#>[q\g
Df/g$CghBu-OgDoEZf72G@VgDFCfN8-T`\\3d>mkDd7C)@;^.*Df]K#>[q\gDf/g$CghBu-OgCl
$;No?+A$Ho@;KXg+Cf(nEa`I"ATDi7Bl5&2@;TRs+CT.u+E1b2BQGd8$;No?+@KpRFD5Z2@<-W9
DIIBnF!+n3AKYT'Ec#Au+D,Y4D'12K>@B+0?!B!73F,iT/QuF-%15is/g+S?A0>i"FD,_<Bl7Es
F_#&+FD,5.@:Wn_FD5Z2@;I&rBOPpi@ru:&F!)l-5u^BB85`A8+<Yc>Bla^j:-pQUBlbD*+<kl8
An<//F*1r5ATT&5Afu2/AKYJr@<,ddFCfK6+EM[EE,Tc=ARlomGp$sBF*&O<Df^#A/e&-s$>"6#
DIn$&+=JUTD]ik1DIjr%DIdf9/43;d-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7A0<9JDJpY6
Bl7K)ASu%"-S.V_9L^Q\E,9)oF(H^J4""N!>^C^<Df@'5$>"6#DIn$&+=JUTD]ik1DIjr%DIdf9
/5/Ma-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7A0<9JDJpY6Bl7K)ASu%"-S/4_67aL'Ch7$r
ALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN+EM@-F(f-++C$%'DBNh*D.Rc9.6Ane3a?uWFDl+G
%13OOATAo2ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/43;d-Z!@8F!hD(ATAo2ATqZ--XpLp@W-O5
-T`\c3a?uWFDl+G/43</7P#p'ATMo?%16Ze+Dtb7A0<7/@:WhcH#k>p-Y#2BH?s[OE$m295sd+M
Ch7[/-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$?'HRD/X3$6#pU-@;0O3
0MXqe.W8irD/X3$6#pU-@;0O30HbHh/KeM2F(o,,-uWWF+DG_:@;KXg+CT;'F_t]-F<G[:F*)IU
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE:LeKb@V'R&0f_6S
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l'DJs\R3$<?_A79RkA0>K&EZdt502-(tFa+?&:-pQU0fX#YGr%/tF`:l"
FCeu*AoD]48g$)G0K0FJ%15is/g+,,AKYT'Ci"$6Bl7Q+Bl7m4FE8RGBQ&$0A0>o(F*2;@+DG^9
ATDg0EZf41F)tc&ATJtBDIn$&.4u&:%16T`@s)g4ASuT4-XpM*AL@oo%14d34Wl.0+Z_;++?V#D
:IIQD76sgI94)CJDe*3&%14g4/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$=dm`@<*J<-OgCl$?B]t
F_Pl-+=CoBA9;C(FCfJ?%15is/g+_ME+NO$Bl7Q+AmoCiF`M&7%172gF*(u2G%ku8DJ`s&F<Dr?
@:U`I-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+=M/=.3N&/@qBV$F!,C=Cj@.5Cj]].
@r*8>/KeP:@<,ddFCfJ8Ch[s4+CT.u+C]86ARlp"BleB;+:SZQ67sC!AftSs@<,ddFCfJ8Ch[s4
F"SRX<affYA0>Ds@ruF'DIIR2+DtV)ATJu2F`VXI@;L"'+D#e3F*&OCD@HqJ67sC&BOr<'@<6O%
EZen,@ruF'DIIR2+DbJ-F=n[Y7<W6_H$!_6DJ()'Cia/1F(fK7Ch+YtAKZ#9A7]S&%15is/g,1G
C1UmsARmD&$4R>;67sBuF_t]1Bk&8oFDl#;%16Ze+E(d50F\A#EZf:2+>XH6ATAo3A0>58%16Ze
+E(d51,COA%16Ze+E(d53,18Z$>"6#De'tF/iYjM2J"X#%16Ze+E(d50mGDq+<VdL+<XEG/g,7L
AKYl5D.7's+Cu[0DBMO\$>"6#De'tI@<+16$>"6#De'tM3&ilW3&iiU2`EZS3B9)[3B9)[3B9)[
3B9)[3B9)[3Htu?ATAo3A0<T]1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU
3&_9R%15is/g,%SD.Ra%@j#3#Eaa67+=M,GDBNh>Cht57@;]UoD'3n5@;oe!+CT.u+EM7CATK:0
$>"6#De't=4utnV5;Xf61FXS'%16Ze+E(d5-pB[V-pKO;,;Ubo1CX\&EZf:2+=KE75:A`Q.3gVt
,[W>:$>"6#De't=4utnV5;Xf61FXS)1G1Tq$>"6#De't=4utnV5;Xf61FXS/C,?A,ATAo3A0<9a
3^5#W1asY*.3pW#3&roUAMQ(O$>"6#De't=4utnV5;Xf61FXS/3&ilW3&iiU2`EZS3B9)[3B9)[
3B9)[3B9)[3B9)[3Htu?ATAo3A0<9a3^5#W1asY*.3pW&1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU
3&`fU3&`fU3&`fU3&`fU3"63($;No?+EMgF@W-((+CT.u+E_R9@rGmh+CT;%+D,P4@VK@`ASqqa
ATAo3A0>qS4=>2gGB.V>B.",qATAo3A0?"U+=CW:D^Pu$%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%17&sFA?7]AQ3A\ATMs%D/aP_@<6-m0JH6g/h1g_FA?7]AQ3A\ATMs%D/aP_
@<6-m0JFVk/M/)S@<6-m+Eh10Bk/>7E-67O+DtV)AKZ)/D.Rd1@;Tt)+EV19FE9&D$;No?%15is
/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"5R+DPk(FD)eG8l%iS78m/.A8-'q@ruX0Gp$d/F!+q'
ASrW3ATTO6$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
2/78M0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCeu*AoD]48g$)G0K0FJ%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC)AKYl%ARlol+Cf>-Anbn#Eb/c(A8-'q
@ruX0Gp!P'/M8.o>p(^[+DPk(FD**G-[nZ`6rZTR<$r+^%13OO@rGjn@<6K4FDYu5De!-?5s\sg
F(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$;No?+CfG'@<?''DIn#7FCfN8+Co1rFD5Z2@<-W9%16WfDIIBn4ZX]5FCfN8C2[W:-S-Z#1-[KK
.=37"A8,RlF_tJoC2[Wi-RT?1A9;d!FD*fu+=M>QCghBu11+I)De*2tC2dU'BHS[O8l%iS78m/5
.4f"ODIIBn+:SZA0RI\KG@Vh,FDbN(ANOFEE+*j%%13OO4tq>%A0>E)DIIBn%13OO:-pQUF*)>@
AKZ&4D.Oi6DfTB0+>"^YF(oN)+A+#&+F5/HDe!3lAKYE&+E(_(ARfg)F)Q2A@q?)V4tq=2H7'hS
F`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>=o\:-pQUDJsZ8Et&I?0RG0n-QmANF<Du;+F>_i+>GPm
4>%a$.3NME?[?'%0d%T667sBhA9MO)@WMtc4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq
+>P&^:-pQU@rH7"F`(]2Bl@m1%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af+Du"&H=%dN+<XEG
/g,=KEaj)!$4R>;67sB\<'qd=@<?''@;]TuFD5T'+AQK^C`l#aD0'f>Df021F*(u4E+NQ&Df-\>
BOr<'Df9M&$>j^"DKBo2E'66)DJs`2A7&b[De*2t0f_-P+?(Du0d&4o2)ZR2/hd_A%15is/g,4H
F<GdGEb$;7Bl.F&FCB$*F!,RC+D,>4ARlp,@;L't%17,c+Bos9Eap50FE8fm3Zp+!?SOA[B4Z0-
I4cXQDJUFC-OgE#FE9T++=K?#,Wd`-DKKqK,].I<DKBo2E%)nX0e%MnDKKq/$9g.j0Ha^W1a$a[
F<GICEt&Hc$;No?+CoC5FD5T'F*(i-E-!.=@<?!m%14J'@j#Z2F!j+3+>=pF0f1"cATT&C/g+\B
C`k)Q%16rjDf0W<AT/bT+=oT/HZ!qH%13OO:-pQUF(KG9@rH7"F`(]2Bl@m1+DbJ-FDuAE+EVNE
AncL$A0?&(Cis:u$?BW!>9G;6@j#Z2F!j+3+>=pF0f1"cATT&C/g)hj0d&4oA8Z3+-RT?1:-pQU
FD5T'F!+t$DBND"+Eh10Bk/>uF`_bHAKYMlFCfM&$?'B^D..'qDIksl+Du+AAn57WC2[Wi+>PW*
2]sgt1,'h)+>=ol/heCj%16upF$2Q,-p/n3HTNs/DKKqK+=oPr.!n!#4#))"FE8lVDdm-l@:sLr
ALS`M0e%MnDKKq/$9g.j0Ha^W1a$a[F<GICEt&IO67sC&Bl.F&FCB$*F!,=BF*&OA@<?!m%14LF
0mde[F"&4`3Zoht3[?dAHZ!qH.3KiZ0d(=ODf0W<AT01]Ddm-l@:sLrAIStU$;No?+ED%8@;0U%
FD5T'F*(i-E-!.9DBNJ4D/aP*$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$9g.jA7dtc+DkP&AKW?J
%159QHSZd_A0<6I%13OO:-pQUF(Jj"DIal-ATo8=ATMr9A8,OqBl@ltEd8*$A9;]tD.PIc3Zoel
ATMs.De(OL/1<5.5;=oBHQkL]Bk2+(D-p^dDe*3&-OgDnFDtZ1BJM_3+=M>QCghBu11+I)De*2t
C2dU'BHS[O8l%iS78m/5.4f"ODIIBn1*@#54tq>$ATqZ-A9;]tD.PIaA9;d!FD*E=$9g.jDe'u$
FDbN(AMO]%%15is/g+tK@:UKkF_u(?De:,(Bl\9:+Co1rFD5Z2@<-W&$7I;V+Z_;++?DP+0KLX*
HTG\L%14g4>9IEo@s)g4ASuT4-UC$a@UX=l@lZP0-OgCl$;No?+CT)&+EV=7ATMs%D/aP=Ao_g,
+C]82BHUi"@ruF'DIIR"ATJu2F`VXID..NrBFP;jF##m>+D58-@;Kb%F'i9K94)$u:IK,1C*52>
$9g.jDe'u$FDbN(AKY2"1E^UH+=ANG$?U>D4ZX]uATV?sCij`*?VO1#?V4*^DdmH(0F\A2F"ndh
3ZrNc1(=R"$;No?+Co&)FE2;F+EV19F<G+.@ruF'DIIR"ATJ:f4tq=>+ED%+A0>E)DIIBn+BosE
+E(d5-RT?14tq=>+ED%+A0>E)DIIBn1*@#50d'[CEc#i8Dfd+4FDtZ1BHR`k0d'[CEc#i8Dfd+4
FDtZ1BJL#(%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?f<F*(qZ@<6-m0JQ<h/h1mQF*(qZ@<6-m
0JO\l/M/)S@<6-m+=M8AF*(qA+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd]
.3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;%15is/g)8Z1+==o8l%iS78m/7+D,P.
A7]d(@rH6sBkMR/ARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zq@4E-,Z.@V'R&1,(C9%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R3?WH`A79RkA0>K&EZdt502-(tFa+?&
:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2
@<-'nF!hD(:-pQU0fX#YGqq9#ARoLs+D,P4+EMgLFCf<1+EqOABHU;M6QgPjCisT+Et&IO67sB8
3,N)L1GBq[A867.FCeu*FDi:3Eb/[$AKZ)+F*&O8Bk)7!Df0!(Bk;?.Bl5sSC2dU'BHS[O8l%iS
78m/5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$8!kQ-[nZ`6rZTR
<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a
@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>QBk)6J3ZoelATMs.
De(OU-OgE)E+X>X3ZoelATMs.De(4)$4R>;67sC!E+No0@3BZ'F*&O8Bk)7!Df0!(Gp$O5A0>i"
@r!3$F=n"0ATAo3A0>Ds@rr.eATAo4@:O(`+Co1rF:AQd$;No?+Du+A+DG_7ATDl8F)Po,+Dtb6
ATAo&AS,k$AKZ&*ASrW*F`(t;GAhM4%15is/g+kGFDi:DBOr<.ATMr9A8,OqBl@ltEd98H$7Ke'
GA^i+AN`'s-XeAR+<iihA8,RlF_tJoC2[Wi+>>5e4ZX]A+?CVm1*A%hGpa%.ATAo8D/a<0@j#`5
F<GI4GA^i+AISuXEaa$#+Dtb7DIIBn%16Ze+EVI>Ci<f+B4Z0-DIn$0@;TQb$>"6dF(HJ3ATr$#
D.O.`%15is/g,1GF*)>@AKZ).AKYr4AThd+F`S[7@:O(qE$-_TBlkJ.De3u4DJsV>@rH7,@;0Tg
$;No?+EV:.+Dtb7DIIBn%16Ze+ED%7FCZM)Bk)5o$>sEq+D58-+Dtb7DIIBn%16Ze+>Y-YA0<6I
%13OO:-pQU@q]F`CERY/F*)>@ATJu+Ec5e;@<<W.ARTY%+EVgG+Eh[>F_t]2%15is/g,:XBl7Q+
F`(o5F_)\+Bl[cpFDl2F+CT.u+Co1rFD5Z2@<-W9DIIBnEt&Hc$;No?+Eh[>F_t\4BlbD9@<-H4
De:,@8l%iS78m.p$;No?+Eh[>0g.Q?-Y#1b%13OO:-pQU<DGn(E+*j%F!+n3AKYl/F<G".G@>c<
+E2@4F(K62%15is/g,=UCbe.7+=CE!E,K**0J[6]10eL2D.QseDeO#D0JG1cFCf<.-OgCl$;No?
+APL&:`sk(ART?sAoD]4Ch[d0GT^F4A0?&6CisT++Cf>-Anble$>sF!A8,Oq4ZX^-E+X>G+<iih
A8,RlF_tJoC2[Wi+>=63ATAo2ATqZ-DIn$&Bk)6H-u*^0FD)dEIS*C(<(0_b0./2"DIn$&Bk)5o
$>sF!ATD<q@rsjp+EVR7GUss]3ZqsIA8ZO,?X[\fA7$H5%13OO:-pQU<DGn(E+*j%Et&IO67sBl
EZf72G@Vh6ATq^+DIIBn4*GOY1+XeXFCf<.>UM(?ATq^+DIIBn%13OO:-pQUG&M2>D.OhE%16Ze
+E(d5DIn$&Bk)5o$>"6#E+*6lA0>c$G@YDtF:ARgEZfI@E,9H&+E2IF+=D&<GA^i+AL@ooATAo6
ATMs(+Dtb7A8,Oq%16uaEZf"+F<GI4GA^i+AISuXEZd.\De't<-OgCl$;No?+Eh[>F_t\41*BRl
6Qg>VFD,_)$;No?+D#R9De'u.ATq^+A8,Oq%15is/g+_G+E1b!CLeQ*ATq^+A8,Oq%15is/g+_G
+EVI>Ci<f+E-67F-Z3L>DIIBn-OgDX67sBlEZfC6F*(q8DIn$'Eb&loF:ARP67sBuATAo+ATT&4
ATr$#D.O.`:-pQUATAnL+E(d5-RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?l>F*)JFF^e*4
/h23s<.96<F=f'eFCfN8+=MSc<.96E+EMXI@P/)s:-pQB$;No?+B3#gF!,R9F*&NW/hSb/+D,P4
D..O.ARlp*AU&;+$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Ve%67sC%ATT&0F`(t;Ci<fl
Ch4`,@;TQuFDi:DATMr9FEqh:%15is/g)8Z-SIbO6$.-UF(dQo3A3Za6$$m]CLoLd3@>qeF<DrK
ATr6-F*&c=$;No?%15is/g)8Z0e"5WBl\9:+EV19F<G"5F*2>=FD5Z2%15is/g)8Z1+=>eARfXr
A0>u*F*&O5F)uJ@E-,f4D@HqJ67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+FAQ*IXMY4:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC&ATMr9Bl5&'Ch7$q+C\c#AKY]!+EV:2F!,(2@:p]s
F!,FBATMF#F<G"0A0>r)F<G[D+>F<4:-pQU0H`M$-o<).0I\,,-V@0&6VKp7;GTqmBkhQs?RH9i
:-pQU0d&&/+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDX67sBjCh7$q+=ANG$4R>;67sC&ATMr9Bl5&8
ASlC)Eaa!6+DQ%:CERG3@ps1b+>"^RDfd+1Cht4d:IGX!:-pQUFCfN8F!+t$DBND"+E1n4AoD^,
ARlotDBN\:DJLA2De!3lATJu8Df'&.D09oA+EDUB+DG^9@UX=h%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*
+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,         ~>
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
0fUp20fU:3+>G_r1*A>-1cRH;1,'h++>P],2)ud61a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PZ+1*A;*+>P&o3&roT+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>u#90d&2/+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bpp20f^@3+>l,9+>Get
1*A;-2E+6(6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
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
3$9q73\rQQ1,92/:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo
/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U
0JPF-0ek^E1cdBM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=#3?TG4@<?'A+>G_r8p+qm1,(F?+>>f:2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2D?6r6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6
C`kJe0f:(.0KLmE3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp=9+<X'\FCdKU0fL4IF_i0U0JPF-0ebXG3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1E[f.@<?'A+>Get8p+qm1,(F?+>GW41H7EL2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DcO!6t(1K3Zp.9
+A-cm+>PW*2'=V/3]&QP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>u)"+@KX[ANCqg2]t_8C`kJe0f:(.1cdBK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$J
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2]s52@<?'A
+>PYo8p+qm1,(F?+>GT30K2$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2E2g%6t(1K3Zp14+A-cm+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u5&+@KX[ANCqh1E];4C`kJe0f:(.0KM'I
3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@8+<X'\
FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=%0d%T,@<?'A+>P_q8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm+>PW*2'=V2
3\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?))!
+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp@<+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K3BB#S$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2'=#0@<?'A+>Po!8p+qm1,(F?
+>G`71cRNM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2`;d$6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+?)5%+@KX[ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU1-$ILF_i0U
0JPF-0ebXG3'&fP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-3'&iO3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$6$6f_1,(F?
+>GQ21,_0L1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.
3]&]T0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp4$6$6f_1,(F?+>G`70JkgJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK
+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO
3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU2'>2-B-8r`0f:(.2EETP3]&`%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU2'>2-B-8r`0f:(.2EEWS3\`Q#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP
3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU2BY;.B-8r`0f:(.0KM$N3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU2BY;.B-8r`0f:(.0fh$H3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU2BY;.B-8r`0f:(.0fh'H
3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU2BY;.B-8r`0f:(.2EE]O3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU2BY;.B-8r`0f:(.3'&iN3\`Q#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN
3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.;+<X'\
FCdKU2]tD/B-8r`0f:(/0fh-I3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp13+<X'\FCdKU3?UV1B-8r`0f:(.0KLsE3]/`$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KM'H
3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K
3Zp.2+@1-_+>PW*2'=S43]&iX0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+>GPm6$6f_1,(F?+>>f:0f(jH1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0eje:F_;gP0JPF-0K;*M2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`0f:(.1cdHN3\WH!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+@1-_+>PW*2'=V13]&fW1,'%B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<G+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;
AT/bI0JPF-0fD'K1cd<H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqg+B)ij+>PW*2'=V33]&QP1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.-D$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0H`hr@N[E[
0fC./1cd?I3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's
3Zp."+@KX[ANCqg1a#M$EZd+k0fC./1HI?O3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&_s&6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh0Ha(uEZd+k0fC./0fh*F3\i]&$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh0Ha(uEZd+k
0fC./0fh-L3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqh0Ha(uEZd+k0fC./0fh0H3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3ZpF*8muT[1,(FA+>PZ41,(aC2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU3?Uq&DBL\g0fL41
0fh'G3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_
6t(1K3ZpF*8muT[1,(FA+>PZ41GCjD2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,U1DARZc;0JPL/0f1pF0fh$I$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2'>A"@N[E[0fL401cdHJ
3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp18+@]pO+>PW*2]sh33]/TP1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS2]s52@<?'A+>Pes7V-$O1,(FA+>Gc81GCjF2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,U1DARZc;0JPL/0fD'L1cdBN
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh
2'>A"@N[E[0fL402``WK3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!Y
A0=WiD.7's3Zp.2+<X'\FCdKU1,g=FARZc;0JPL/1,(aG1HI?M$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Pku7V-$O1,(FA+>PW31c7<O
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0esjo6t(1K
3Zp1:+@]pO+>PW*2]sk03]/WQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%j
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!7V-$O1,(FA+>PZ40ebXG2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%
@N[E[0fL410fh$G3\rT"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+>Y-7@<*JG0JPL/0fV3M2EEQL$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$9jr&b1,(FA+>Gi:
1c7<L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp."+@KX[ANCqg1*B;"EZd+k0fL401cdBG3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqg1*B;"EZd+k0fL401cdEN3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GVo9jr&b1,(FA+>G]61H7EP1C=Hr:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg1*B;"
EZd+k0fL401cdHL3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>GYp9jr&b1,(FA+>P`60JGOB0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg1E]D#EZd+k0fL41
1HI3K3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS3$9>3@<?'A+>GYp9jr&b1,(FA+>P`60fD'M1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1E]D#EZd+k0fL411HI9G3]&i(
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp.5+AH9b+>PW*2]sk33\iQR1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>GYp9jr&b1,(FA+>P`61H@KR2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU
0f'qH@<*JG0JPL/1,CsJ1HI6I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg1a#M$EZd+k0fL410fh$D3\WK"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b
+>PW*2]sk13\iQR1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>G\q9jr&b1,(FA+>PZ41,h6K1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f1"I@<*JG0JPL/
1,1gG1-.9N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Get+@KX[ANCqg1a#M$EZd+k0fL410fh*L3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp.6+AH9b+>PW*2]sk13]&NO
1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
3?TG4@<?'A+>G\q9jr&b1,(FA+>PZ42)73J1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI2```L$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[
ANCqg1a#M$EZd+k0fL411-.*E3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp.7+AH9b+>PW*2]sk13\iEN0es(C$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>GVo
9jr;i1,(FA+>PZ41c7<M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0eskG@<itN0JPL/1,:mF1cdEI$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqg2'>V%Gp"jr
0fL402``fU3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS1,^6t6t(1K3Zp.8+AH9i+>PW*2]sh73\rQQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>Gbs9jr;i1,(FA+>Gi:
1c7<L0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp1;+<X'\FCdKU0fC.K@<itN0JPL/0fV3N3'&lQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqi+A-co+>PW*2]sh13]&`U1H>dL
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+
@<?'A+>Po!8p,"o1,(FA+>PW30f1pJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\FCdKU1-$IUAT/bI0JPL/1,(aC0fh'E$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqk
+A-'[+>PW*3$9q83\iBM2),FF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,^7I@;[2C0JPO01,:mI1HI<I$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp19+A-'[+>PW*
3$9t33]/ZR1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<u+<X'\FCdKU1,^7I@;[2C0JPO01,CsF1HIBL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp1:+A-'[+>PW*3$9q23\rcW
0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,g=J@;[2C0JPO00etdH3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp17+@]pO+>PW*3$9q03\WBO1,'%B$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU
1E]D#EZd+k0fU:03BB#T3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>G_r9jr&b1,(FB+>Gi:0f;!L0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*
3$9q03]/iW2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P='+<X'\FCdKU2]tD*EZd+k0fU:10fh!G3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp@(6#^ie1,(FB+>GT30ebXE
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.3
+<X'\FCdKU2]tD*EZd+k0fU:10fh$E3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp@(6#^ie1,(FB+>GT30f;!K3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU
2]tD*EZd+k0fU:10fh$I3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.2+@0se+>PW*3$9q83\`?M1GK4D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>GPm6#^ie
1,(FB+>Gi:0f1pK1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.8+<X'\FCdKU0f^@BE,m'V0JPO00fV3M1cd?H$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1E\u&EZd+k0fU:2
1HI6L3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.:
+<X'\FCdKU1,0nG@<itN0JPO00f_9N2EEZN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l<+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo9jr;i1,(FB+>PW30K(sG2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*
3$9t13\iTS1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp16+AH9i+>PW*3$9t23]&WR0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1a!o-F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp16+AH9i+>PW*3$9t33\W?N1GfFG$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp16+AH9i+>PW*
3$9t33\`KQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp16+AH9i+>PW*3$9t33\iEN1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1a!o-F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp16+AH9i+>PW*3$9t33\iWT0Jj+D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp17+AH9i+>PW*
3$9q83\iWT1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp19+AH9i+>PW*3$9q73\WQT1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1a!o-F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp19+AH9i+>PW*3$9q83\iHO0K'7F$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:+AH9i+>PW*
3$9q83\`NR0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@
+>GPm+@KX[ANCqh2]th'Gp"jr0fU:13'&fO3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3A_j$6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,g=M@<itN0JPO00fV3M2``]L$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i
1,(FB+>Gl;2).-K0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpL+<X!nBl%<&:3CD_
ATBgS0f'pp6t(1K3Zp1;+AH9i+>PW*3$9n83]/fV2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Pr"9jr;i1,(FB+>Gi:0ebXD
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU1GBqG@<itN0JPO00fV3K0fh*G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqi0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp45+AH9i+>PW*3$9q93\`NR0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRo
A7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>P'3F`&<W0JPO00ek^H3BAoQ$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh+A-co
+>PW*3$9q23\WNS1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3b
Ch+Y`F_tT!E]P<t3$9>3@<?'A+>P'3F`&<W0JPO00etdE1cd<I$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh1E];4DBL\g0fU:1
0fh'G3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_
ATBgS1,'gn6t(1K3Zp16+A-co+>PW*3$9q13]&TQ2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>Pht8p,"o1,(FB+>Gi:2)%'G
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp44+A-co+>PW*3$9q23\W?N0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>P_q+@KX[ANCqo+A-cm+>PW*3$9q83]&]T0KBII
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pbr
+@KX[ANCqo+A-cm+>PW*3$9q83]/TP0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqo+A-cm+>PW*3$9q93\`<L1GoLH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[
ANCqo+A-cm+>PW*3$9q93\`WU1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRo
A7]p9BcnNbF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqh3?UV1B-8r`0fU:12```N3\iJu:L\BVEcu#)
7<3EeEcWun:-pQ_:L\BVEcu#)7<3EeEcW@E/M/)SF_;h5DeC2$DIal1ATMg/DKBB1/e&-s$4R>;
67tA`-o!.n@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8EbBN3ASuT4-u*[205<?u1ark@:-pQU
1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*
FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.
G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)+CT/5+Du=<C`me1@<,jk+Dbb5FE8RD
Ec5o.Ebp"DDfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@
/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0
/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"
%15is/g)8q+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.
Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=@ruF'DIIR2/g)99BOu3q+DGm>@3BW0
D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)/KeS<@ruF'DIIR"ATJu(Eb/[$ARlom
Gp#^%2(gR>+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;
Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)ATo8;Dfp/9DImlA%15is/g)o0+AH9b
+>PW)2'=V13\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!>\[\fA8,OqBl@ltEbT*+>]++pD..-r
>\[\fDImp,@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*l
BKKf8$4R>;67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]+
+CT-s$;No?+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!
%15is/g*b^6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"
F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L
@;p0sA1e;u%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?De3u4DJsV>E,ol9ATDU4+Co2-E,8s.
+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWm
FD,B0+DGm>F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F
-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\
_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;%144#+D58-
+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([Y
Eb$S>.3N/4Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e
$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<Y3/
F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-
G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8Z
JA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYs2e$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8
+Cei$AKYMtF)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9+D#S6DfRl]FD,6+AKY].+CQC/Df021
F*(i.A8,po+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9FD,*)%15is/g)9IARfObEb/c(F(9--
ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4+:SYe$;No?4[(8N.3N5:GWHrV$4R=O
$4R>;67tA`-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1
DBO%7AKYMpE+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5
-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAOEb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;
+D,>43ZqpG@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=
E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+
E$-NG@;TR'4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg+DtV)AM,)7$4R>;67tDb-oNLsAncKN
+=LlDD..3kE@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRlBleA=@V'.i
Eb,[e:-pQU@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f%13OO:-pQq4X`6<+D#S6DfRl]-u*[2
@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,
Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6C2[WkB4W25A92j$F=/1R:-pQU@s)m7
+DtV)AIT"+P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
O:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%
+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZT
F*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%*+<VfdP_(YE0K1[G0ek:;+<VdL
ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*+<][.Ji>\4+<VdL+<VdL+<VdL+<Vfd
P_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$(
$K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$6UH6
%13OO+>P&^C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$Ud
Bl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;
ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF
+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1bg*qifo$R
3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&-QjO,67sC!CER5-EZf14F*)I4$4R=u
+DPh*@:s-oI4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et+CoV3E$043
EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)E--.1$;No?+EqOABHV2(G9D!AD.Rd1
@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?
+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8XDe(M9De*g-G%>`4E-![LAT089C3(a3
$4R=b/hSb/+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)
%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"
+<X'I5tsdT?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(
Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ
+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC+E_RAF`2A5
A.8l@67sBpDIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H
+:SZQ67sB73?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)
D.RU,F!(o!D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)
+>=63-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%
F(o9)D.RU,Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfR37$4R>;67tDb-oi_!AncKN
+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i1,(FA+>GZ5
1c%0M2[p*'$;No?+D#G$/T55QDdmd!Ecu#)/S/sCDfTn.$=\-lCh.:!A7TCqFE2))F`_>9DDEqA
67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDC2[WlF_PZ&3B9*,4ZX]55s[eODe*="
Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU
Eb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBMPI6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'
+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUB4Z0-8l%ht@WcC$
A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;
F_PZ&C2[W1%13OO-V@0&;cH%Q779^F+A,Et7nHZJ8Q$[':IJ,W<Dl1Q;cH%Q779^F+A,Et;cH%Q
78QBA6qL9!8l%iR<'a#C6r-0<8Q$[':II]E<('ML6qL9!8l%i@6psgG6qL9!8l%iR6W-KP<(';U
+A,Et79EMf6qL9(4ZX^,ATVC(Bl%<jBl\8;0F\?u$?^;u@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M
+C]J-Ch.:!A7KOpE,oN2F(Jl)8l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN
8PiAS8Q$!)8l%iS:JXY_<_Yt)@WcC$A86$nFDl)6F(9-*E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD
=B&3e8Q%WB:IJ,K;Fs\a6qL8c$;+)^<_Yt)F`:l"FCf3*A7TCqFE2))F`_>9DBMPI6rR&N7n#g;
;EIKH6q9gJ6qL8c$;+)^<_Yt)F`:l"FCf3*A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)
8l%iU9gg+EASbpdF(K*)A0=K?6rR&N7n#g;;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<
8l%iF8Q8)R6UXLD%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$
A2uY1?O[>O$4R>OF_PZ&C2[WsC3)-b:-pQ_@WcC$A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,
ARlouDe*QsF!,O6EbTK7F!)T>DBL':De*KpF:(c0/g+\=Eb/a&DfU+U$;No?$;No?+Eh=:@UX@m
D)r#!67rU?67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$+A,Et$;No?+<Vd_
+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>m:-pQU
+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIG
BPDN1F(96)E-)F^67rU?67sB'+>G!ZD'138F_PZ&C2[WsC3(aF+AP6U+EDUB+DPh*+DkOsEc3'K
0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c#g67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU:2_7dEcQ)=
+Cf(r@r#drB.aNd67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch3rK67rU?67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP:sF`&lg$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0emEcDD4!l@:Wn[
A0>W*A8lR-Anc'm/no'A+DPh*E+*d(F"V0AF!,49A9Ds)Eas$*Anbme@;@K0C3'_W67sB82.:HE
0JXbkASl@/ARlp0Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*FDi::De*KpF<G^DA7]d(@;KXhD@-_\
De!p1Eb0-1+=CW,F(H^+@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0
>9IEoATD4#AKX)_5s[eYEaa$&3B9)I$=e!gDKBB0F<DrFC2[W1$49Np/g,1G@rHBu+E)41DBNJ(
@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+$?'j$4ZX^6/g+\=A0<Q5De'tP3[\Z\
A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C$49Np/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+
Df-\>Ea`HnBl7Q+DJsZ8Esd#+E,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%_!De+$&EcYr5DEU$'
/3Yb78l%iU9gf<q:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#Ed8!a:II]E<(]qS8P2oX5u^B<3ZoV!
-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGg8l%iF8Q8;X
6qL!L:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6qL!L:dJ&O/151NA7oUu05>E9Bkh]B-OL2U67sBn
ASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--..C1D'gF)to64ZX]I3[\Z\A0>W*A92j2
Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^_6De*d(-OOU,A7fOlATL!q+=K?-+C?iP
+DkP&AL9S`C1D'gF)to6$49Np/g,1G@:UKjCghC++D,>(ATJu'@:O'[-u*7.@<6L$F!*"\/j:C?
-Y-Y--Rh2>+ED%%A0rom+F?-n0d(4LA7fOlATJ1c:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2
EbTK7Esa:8@j#i5@jaE#+>b3RATT%V3[\Z\A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme
@;@4t.!mQj0d(OX@jsQ%+F?-n0d(OX@gWQ<67sC'E+EC!AKYMtEb/a&DfU+GAnc'mEsbB.9LVlC
3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5+?V#(Bkh]:$:[T\78l?1+=K?E:II]E<(]qS8P2oX
5u^B(+=nil4s3<d9LVke0Ka)gA7T+j+<VdL+<Y9?EbTW,+?M9(7S-9B;[P3@C2[X(FDl22A79R&
Ap890FCcRV0mcA]9LVke0Ka)gA7TUfA79R&+<Y9?EbTW,+?M?*7S-9B;[P3@C2[X"@;BFb@<<V7
Ap890FCcRV1ODS_9LVke0Ka)gA9E!.Ch-sr+<Y9?EbTW,+?ME,7S-9B;[P3@C2[X)Df9H5A79R&
Ap890FCcRV21%ea9LVke0Ka)gA8c?r@<<V7+<Y9?EbTW,+?MK.7S-9B;[P3@C2[X%Ec5Q(Ch4_3
Ap890FCcRV2g\"c9LVke0Ka)gA8kstD0$gB+<Y9?EbTW,+?MQ07S-9B;[P3@C2[X*F(KB%Df00$
B4>:b+<Y9?EbTW,+?MT17S-9B;[NkQD/XQ=E-67F-Y%(3D.RU,ARlouDe*QsF!,O6EbTK7F!,UE
A79RkA1%_*D/XQ=E-67F8l%iF8Q8;X6qL!L:dJ&O$49Np/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(
Bk;>mDe'u/Df6b&+>Y-YA1&`3$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<,&F_PZ&C2[X*DJ=2J0ht%f.UmO7Ch.:!A9Dd(F<GWV/Kf7XBlmo/8l%htF`(o8+EV19
FE8RHD]j+C@:s:lB-:`!Eb/a&DfTQ'F"Rn/:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+<VeI
AT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL
+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[Wn
ATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr
:-pQB$;No?+<Vd]+ED<A-Xq44Ch.:!A9Dd(F=/1R:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2
F(KD8Bl.g*Bk(k!+DEKI.1HVZ67r]S:-pQU@<6L4D.RcL%15is/e&._67sBUD]iV3Ec5t@@q]F`
CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX#YGqq,a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E2@4
E+*cu+EV19FE8R5A7T7^%15is/g)l.D..]G0Hb=WEbAr+FCfN8+CSekARl5W%16T`@s)g4ASuT4
-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#
AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2
@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+CT)#ASrW*De+!.BlkJ.Bl[cpFDl2F%15^'6q9gJ
8l%iT:.\D]5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2
?V4*^DdmGj$;+)^7nHZP:IJ2X8Q8MP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iT:.\D]5u^B+-YdR1
B5)H@C2[X*DJ=2G-OgCl$?pN)FCfQ*F*)Id3Zp7%3Zp*c$>F*)+C\biEarHbC2[Wi+EV19FE9St
+B)93<(1/&C2[Wi+D5_6+F,)?D_</RD/XQ=E-67FFCfN8F!,L7FEMVA/g+_CA1e;u-ZjHUE+L/2
@<?014Y@k%%16f]/g)Ps4!uC)+>#VsFCfN8F!,"3/e&.1+EMC<F`_SFF<Dr+D]gDYFEDeIALo2O
FCfN8F!*%WF(f!!AK`E1$>"$pAM+E!+<W%P@j#l)F*)IN4Y@j3+D58-+FPkaATMs7%144#F)>i<
FDuAE+=JEp,BRL<FE8l^-QjcfFEDeIALo2OFCfN8F!hD(+<Y97EaNp"F*'#WFCfN8F!,"3/e&.1
+<VeJD/XQ=E-67FAnc'm4Y@jr@<?0*/0K%VH#R=;/0H;n-Qjr_-p',0FCfN8.3L/a-SB+JF!hD(
+<VdL.!0Au:K(484#))(ATMrB+Eqj?FCeffC2[Wi+D,>(AISth+D#G$/e&/!DIb@/$7QDk%15is
/g+YBCi!ZmF<G"0A0?):Blmo/G%#E*Dfp+DFCfN8+EM[>FCfM&$;No?+=JUYD/X3$-Tapr6q9gJ
8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YddFFE_bDDJ(=+$7I9CD/X3$-Tapr6q9gJ8l%iT:.\D]
5u^B(+Eqj?FCfQ*F*)IG-YdR1F)>i2ATVL)FE8f=$7I92@<6-m-Tapr6q9gJ8l%iT:.\D]5u^B(
+Eqj?FCfQ*F*)IG-YdR1@UX=l@ru:'FE8f=$7I9<@<-!l-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?
FCfQ*F*)IG-YdR1Cgh?sATVL)FE8f=$7I9CFE1r6F!j%A:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.
ATMs7+=CoBA92j5ATMp7ATMs7-OgD2-Y%1>F(cp_8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8
F!)iFDe*?uF`V5<ATMs7-OgD2-ZF*;E+*cu-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG
-YdR1E,oN/@<,q$ATMs7-OgD2-ZF3KB4WGP8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iF
De*g0EbAs*ATMs7-OgD2-Y7OEASu$+4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[Wo
G][M7F(oQ1FCfN8F!hD(%17/nDfp/@F`\`R@;Ka&F`(o8+EV19FE8RKEbTW;ASrk)$4R>;67sC$
ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>=-pFDl2FC2[W<2[p+,ASu("@;IT3De'tB
+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E%/ibpM
+>"^HATeLi%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lg
C3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+CIW+6VgHU:J=2b+EM+9
+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551
G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>
@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c
+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_
;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b
/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p
779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%
$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^
0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0
+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(C
De:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1
Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSek
ARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//
+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9
A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!Tq
F`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,
Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ
%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL
+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9
DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A
+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1
Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1
DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#
ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT
9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B
$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0
DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().
AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/
+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL
:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*
4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+
F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/
$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6
+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(
+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4
AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);
FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLs
DfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhK
ASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3
E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=
>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>
A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO
+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.
$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k
%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2u
AISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%
0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6
?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$
2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM
%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<
-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL
+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(q
E$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KV
DIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i
/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNE
E,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq
%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)
+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4
Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/
DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)
@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RK
Bln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-
AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6
A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.
Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4
?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=
.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4+
+Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U
-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U
+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o
+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b
+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5
1a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd
$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6
+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=)
,9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"
DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681
+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9
A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-h
FD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)
E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@
+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5
@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*
$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3
+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*
@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bB
Ddda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(
Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL
+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&V
G9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o
+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE
?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)
E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,Oq
Bl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-h
FCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[p
DJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@lt
EbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O
<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8
E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(
Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=
@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)
E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&
F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!
ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97
Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.
+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8p
E+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'
Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8
@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?
ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`fr
FCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(
+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL
+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#
+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;
@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2?
?m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%
A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO
+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7Zlq
DfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`
B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1H
F*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(n
DJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4
+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT+
+EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'
DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:B
F`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%
@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-
+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%
8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;o
C2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR2
7!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*
3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=
DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+
De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht
<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>49
2(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b5
1,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIaku
F)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-
+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(
?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@
?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;e
D.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8
DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6
Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?
+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a54
4$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"
F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0
AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=
+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*
1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^
0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3
FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCr
Bl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht
@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5
ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1
DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#
+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#
.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4
DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU
76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9
$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL
+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k
$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc
+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjH
F)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9
EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6
F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAk
Ble59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK
@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7F
DId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSek
ARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+
@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8
F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91
EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB
$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;
FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<s
EcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9
A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!
Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3
BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b
.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:E
DJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#
.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.
E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(
GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*
A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@
A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9
$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco
-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX
<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@
ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-
+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn
+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&
+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUK
DfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*
BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*Qo
Bk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:
DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.
+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-
ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F
+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2
@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j
@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2
BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7
@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr
.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,
E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&
DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,
ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d
+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNE
E,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n
/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&
A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)
ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6
@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;
C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>
C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$
+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r
+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa
$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]Tu
F(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6
+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]
/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj
/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r
+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$
BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96
GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!E
AM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<E
Blmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"
+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E.
/i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3
@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LG
Bm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOT
Bkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=)
,9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,Lo
ASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+
/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!
A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9
$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o
0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,
AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>Aj
DBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'
FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)
Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN
3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?Ke
Fa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,A
A7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-
FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0
Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3
E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5
G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*
GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNn
Anb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-
F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=L
Bl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G
$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMm
F*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(t
F<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b
/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>
DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9
$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1
Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn
@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1
Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p
$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.
F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+
G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).
@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T
+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&
A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j
@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#
F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A
@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:
+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=)
,9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`fr
FCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou
3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#
FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;
G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou
3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5
De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b
/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#
F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.
@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LD
Df'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%
F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<
AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth
%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8
BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!h
F!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i
-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK
%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,
%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[
A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"
+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?
+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&
A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC
/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq
$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt
/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU
0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNB
A0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(
Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdh
Ch7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0
Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnX
Ebo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!
A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XW
BPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL%143e$6Tcb
BPDO0DfU,<De*Bs@kocOASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0
-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"
ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8
F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDl
A7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL
%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO
,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`
CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJF`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+
/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<
ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,
D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI
%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.
Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(
AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*
2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[
A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t
%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?
+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%
E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)
AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,
FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgL
FCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4
D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc
3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk
/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDE
ATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0
+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098
AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<
3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:
F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9
F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3
FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=
/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#
D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](
@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!h
F!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC
2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2
+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8
+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oK
A8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(
@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4
F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,
ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?
6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT2
9H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0
DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[WlATMrK2,$;&<(U%_76N[S-V@0&+=K#p
+@9X\F<FD#@:OCn@qB^/%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM=u+@9LPATAn&$=[FZATDNr
3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]56=k4[+E2@0@ruEpATJu+DfQsm:IH<W+ED%:
Bldir+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P7ScBO;a!/a0b"I!$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
8T&WjDe+!#FD5Z2%16$PAor6*Eb-A8Df9H5+CT;%+Dbb-AKYf-@:Wq[+D5h7F#kF_Dg,c5Ap%o4
G@b3%Df0V=AoD]4F)591Bl7Q+H#IhG+Cf>#Bl7Q+A7]UrDK?q0F`\a7CiaM;A79@gATD^3F!,[?
ASrW5F(Jl)Bl.g0DfB9.Cj@WU+@opaAKZ8:FWb7=ATAo7BQ%u8H#IhGF(K0"+DG^9FD,5.AoDU0
59M(?+DYk5G9BI)D'3\0F)u&5B-:V*An?0/FDk`3+CT.u+A!\bATT&?Dfm12Eb-A%F!,[<Cht^H
%13OO<+oue+DbIq+E)CECh[cuF!+m6DKTf*ATAo3Afr:,ATMr9E,oAsFD55rF!;`FEZf";Bk1dk
Bl7L'+D,P4+E_a>DJ((a:IHfX+A!r(AKYf#@<-6sA0>u-AKYYpEb$;:@<jpWBkAK5Dfm1E@;BEs
D0[74A9MZsAKZ)5+D>=pEc`FLDfm1>BkM+$+C\n)F)YQ.ARlqn$7QDkEb065Bl[c--YI".ATD3q
05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+U,m+D,P4+A,Et+E_a:EZen(Anc-oA0>K&Ch.*tEt&IX
5uLHL:.I>f<(KSZ+A>'f+AtX*<Cp(W;]n@K:/t"T78b7(7Nb]078b6r77KjD7787j:IH<p:J=/F
;H#1W$4R>ABPDN1CggcqEb065Bl[d++CQC1F_tT!EZf:4+A,Et+D,P.A7]e&+EVNEEcl7P+B3#c
+Dtb8F<GXHAT/c6ATMs7+D,P4+EV:.+D#e3F*(u2@q?d$Afu2/ATME*AoDKrATDiE%13OO8S0(n
<+U,m8l%iCBl[cpFDl26ATK:CCh[s4F!+n/Gp%6IA7]@eDIm?$8l%htA8-'q@ruX0Bk;?.@rH6s
BkMR/AKZ).ATME*A8-'q@ruX0Bk;?.@V'.iEb-A6F`))2DJ()6BPDN1Cggd*+A$HlFE2M6FD5Z2
F!,C=+D>\;+EVNEA8`T4BPDN1@ps6t@V$ZoDfor.+DG^9-u*[2/oY?5.4u`7DKBo.Cht59BOr;7
C2[WnDe!p,ASuT=+CSekDf-\>D]i\(F<DuHDe(J>A7d8C%14Nn$<1SXF@o=s6tp[Q@ruX0Bk;?m
BkhQs?TgG++?CW!%13OO:-pQ_<+U,m8l%iCBl[cpFDl26ATJu;/M/)eATMr9F`V,7+Cf>-Anbn#
Eb/c(8l%htA8-'q@ruX0Bk;?<%15is/e&._67sB[BPDN1+Eh=:@NZe'BOt[hF!)TIBOQ!*+ED%5
F_Pl-A0<!e:IH<JCggcqA8-'q@ruX0Bk;?.+CT;%%15is/g+\9Anc-oA1euK6tKtEDIm?&+CoD%
F!,@=F<GF3@;[30BOr;/A8-'q@ruX0Bk;?.+D#e3F*&OCDJXS-$;No?+EV:*F<DuHE+*j%.3N2H
E+*WpF!,RC+EMI<ATVU"DJ()1FD,6++EV:*DBNY8F!,")AmoguF=n"0:-pQB$;No?+Dl%7@:VDA
+Cf4^F(ZUY/g+,)F*(#M6pta0ARfh#EbT*++E_fuB5VX.AIStU$;No?+EqL1DBN@1Eb0&qFD5o0
+Co2,ARfh#Ed8d<De3u4DJsV>AU%p1F<DuHE+*j%.3N23BQ%I'+DGq=+CT;'F_t]-F:ARlDe+!$
Bl\8;4Y@j)IO?Hn-8%J)4$"`]:IH<t:IITN9i+b28l%iR:K::[73G2u6rZTR<$r+^C2[X*A7]@o
+?_>"C2dU'BI5>q+DPh*F_#3,F!)T#67sB(-n6Z//g+nJ@<?/l$>j3mCEPbm+DPh*F_#3,F!*Ug
C2[X*A7]@o%16f]/g)kkAM,*B@<63,A8a(0$6UHT+=D#?F)u&5B-9fB6m-)[Ch.*tF!*%WA7]@e
DIjr"AS,k$AKZ#9DJj0+B-9fB6m-;S@WNn>4!8BKF))mC+DPh*F_#3,Et&IfCia/?%144#4s24]
Cht4d:IH=;DerrqEcW@3Eb-A(AS,XoARm/24!89VA9DEoAoeCgASu$2%14Nn$4R>AATMrc:IITb
Eb/a&DfTQ'F!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMV]@N]/sARTJ!E"*.U5uLHL:.I>f6qKaF8P`)I
;Fs;U+@B$q5u^9@+@93R:f9k\;BSk;:/`927NbAj66K5u8Q-a58PDf#6:E"b78--L7787i:*<M,
73G>o=B$DA<(0V9%13OO=(l/_+EV:.+@9X\F<FD#@:OCn@qB^(CggcqEcl8@+DGp?@rc-hFCfM9
@3BH1D.7's+E(j7A8,OqBl@ltEbT*++DG^9FD,5.."4ca6rQl];F<l%+Co2,ARfh#Ed98[<+ohc
DIn'7+EMX9E$0@=Cht57ASl@/AKYE!Gp%$;+EV:.F(HJ)Bk)7!Df0!(Bk;?<+<X6F+B_K?+@AFm
73Fl_:K:@:<(KSZ+@JLp5p0**:J`0/:KK.X$7QDk;Is]`G%F?U@R=XIF@9hQFD5Z2@<-'nF'iWr
De*3<3Zp4$3Zp*c$>F*)+A#%(8PUC=D_;J++<Y`=ASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`
6rQl];F<l#.4chj-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(.!KBC
.3N/8@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIj
CNCV4DBMY^@j#2tA0=Q[DKU1HE+*j%Et&I!+EM4-Cht4AEbupNEb6FA/8B-4FD)dEIS*C(;bpCk
6U`@3$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8d:ATMr9E,oAsFD55rF!)lJ@:Ls,Bl8'<.3N/8
@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+
F`S[IASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(A8,OqBl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%Dd_ATMr9:i]uSFD55rF!,:-@N]2q@ruF'DIIR"ATKI5
$7QDkEb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+E_RBAS5^uFCfJ8A8,OqBl@ltEbT*++>"^-
7nuiX73G#s;GU1h%14d30H_V`1E^^LB4N>Q+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO
:-pQUA7]RgFCcS*Bk)7!Df0!(Gp$^5Ch7Ys$;tGPDg#\c@:DQ7F*'fa@ruF'DIIR"ATJtJ%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[i:IH=9De3u4DJsV>@V'@oDJ()+DBO%7AKXSfFE1r(%14:O:IH<n:IS2)
:/=h36:FRD:.HEu:*<M,73G2F<)Q.R+q4kg$;GdgAnc:,F<G"0A0>`-F*&O=D/aE6FCB'/+C]&,
+E(j7@:XOq@q?csF!,O<D/a<:3XlE*$;O#j78b7'792iT+AP@+78b7LFDl22+F.mJEZdtM6m-#S
@ruF'DIIR"ATJu.DBMOoBl8!6@;Ka&A8-'q@ruX0Bk;?/%13OO8K`4qF_kS2@;L"'+CTG3Bk/>p
DL!@#;]opcDII0hA0>DsEb/a&DfTQ'F!,:5CLnUt$7B(TEc5T!D'2;^Ch7Zm-S>i8%15ICART[l
+CQBb:IH=B@<6O%EZen,@ruF'DIIR2+Co2,ARfh#Ed8dJDf9_?FD,*)+DGm>@rH4'Ch7^"Cj@.;
DId<tASu$iDKI">Afs\u+<X6t-Z^D=CiaM;@3B3$De'u)A7]0lFDi:4AS,XoAKYD(F*1r&Bl[cp
FDl2F+EMXFF^oN9Eb-A8BOQ!*D/"$2DfTnA8ge[&G%G]8Bl@m1/g)9/:IH=8Eb/[$ATJu'Bl7@"
Gp$j6Bl%@%/g)99BOu6r+D,>(ATJu&Eb-A*@;0auGp%0M@:F%a+C]J8+C]&&@<-'nF!+t$DBNG&
@;]^h+EqL1DBMOo@q]:gB4Z-:%14Nn$;No?+CfG'@<?''@3BDqF*(u6+A,Et+Co2,ARfh#Ed8dJ
Df9_?Dfp/CBk1ctDe:+a-Z^D@Bl[cpFDl26ATKI5$;No?+B3#gF!+t5ART[pDf-\.AT23uA0>f.
+CQC&Df00$B6A6+A0>DsEb/a&DfU+G."4ca6rQl];F<l%/e&/*ATqZ--Xq%:ATMr@4"+i_@<?0*
-[nZ`6rQl];F<l+@W6F#F*&cY4""KKF*&ODEa`I"Bk(^q+EV19F<G+.@ruF'DIIR2-OgCl$;No?
+B3#gF!,1<+CT.1AU%X#E,9)./Kf1WAKYE!DffZ(EZfC@Dfd+6DfQtGDfp(CA8,OqBl@ltEbT*+
/e&-s$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l39Q+?M+DbIq+Co1rFD5Z2@<-W9Ao_g,+CoV3E$043EbTK7%16'Q
+DGY.F`VYF@<?''CLqc6An>CmF`M&7+E(j78l%htG@_n7AS#Bp@3BH+DIm[(FEo!>Bk)7!Df0!(
GqL4=BPDN1DIn'7+EMX9E$/t8@:XF%FD,5.-t7.;ATMrB+Co1rFD5Z2@<-W9Ao_g,+CQC'F_u(?
F(96)E-*45BleB:Bju4,ARlp-Bln#28l%i-%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!Cggcq
A8,OqBl@ltEd98H$7QDk:-pQUDfB9*+Dtb7+Co1rFD5Z2@<-W&$?'Gt-Xq%:ATMr@+BosE+E(d5
-RT?1%15is/g+tK@:UKmEc5e;AU%X#E,9).A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUr
F"_0;DImisCbKOAA1q\9A8G[`F"_?<@UsUuE%Yj>F!hD(%15is/g,1GB4YslEaa'$+CT)&+ED%*
ATD@"@qB^(/Kf+JDg*=?@<6N5FD,]+AKYi$F)tc&ATJ:f?S`gO/g)hjB5DKqF!a'nI4cX_AThu>
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l36=FA>F`8I4@:O(qE$/Uu@r$4+%14:G5sn:F:`r(j6VCEU+@8@]
93"e4%13OO8TZ(hF!,:5FCfK$Ci"A>@3BW/@;m?2D]in*CLnVs+C\bhCNXS=GA2/4+A,Et/g)98
D]iLt@r$4++E(k6ASrY#$7QDk:-pQUDfB9*+EV:.+C\o'F<GOC@:OCn@q?cnBk)7!Df0!(Gmt+!
A0<7/E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU@UWb^+DGp?F`7csE+*6lA0<7/E-,Z4F=.M)%15is
/g,1GF*(q8Eb/a!G%G]8+EV:.+Dl%<F<G(9EcP`/F<G%$@r$4+%17,eF*(q8-Xq%:ATMr@%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[s@;BEs@3BW$EbTK7+CoV3E-)Nr,#gj$73Fl=;aXGS:fJQ*<D?:6%13OO
-u`U)CLek:@UWb^F!,UE+C]&&@<-W9C1_0rATJu'F`\a?F=2,P@;L"'+CQC*Df9//Bk1d`+EVNE
,%Ph5E$?EMDfp(CA8,OqBl@ltEbT*++CT=6E,8rsDBO%4G]YP\+A,Et+Ceht+CoV3E$/S*C`mY8
ASrW$Bk)7!Df0!(Bk;?.@<3Q"+EM77B5D-%8g&1bEbTK7/g+)&EbTK7+CoV3E-!.1Eb-A8BOr<'
Df^"CF*(i"Ch4`5@<iu;D]j+CDfTD38g%YY@ruF'DIIR"ATKIH+B3#c+DPh*F)Q2A@q?ckA7TUr
+Co2-FE2))F`_29+CT)&+A,Et+EMIDEarZ'@rGmh+DG^9FD,B0+D,P4D(Z8).1HVZ67sBkF_u(?
Df0B:+=L]<FCfN8.1HW&A0<7/E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU-uEC.ALSa3Eb/[$ATJu&
+Co1rFD5Z2@<-W9A9Da.+DG^9FD,5.A9Da.+EM[7A8-'q@ruX0Gmt*iE-,Z4FC]N2E'66)F(fK9
E+*g/?X[\fA7$Hr@;BEs-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*2qAKZ,:ATJu4AftW,D/^V=@rc:&
FE7lu8l%htA9Da.+EM%5BlJ08+Ceht+C\n)F`V,)+EVNEEb0'*@:Uo3@rH=3+CT.u+Dk\1B4W2r
Bk)7!Df0!(Bk;?<%14Nn$;No?+ED%0Ddd0!@W6F#F*%iuDe't<@W6F#F*&cP>9G^EDe't<-OgD:
+Z_;"HTGVTFCfN8A9Da.%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k6Z6ph+CQC'Bk)7!Df0!(GqKO5.1HVZ
67sBjDfBtTD.Ra#AKYH$FCfN8+Co1rFD5Z2@<-W&$>sF!A0<7/E+<g*Gpb[gE+*j%+=DV1:IJ,W
<Dl1Q04Jm1DfBtL%17#a+=CW;@rH=3-QlV91E^UH+=ANG$8<Va0Hb^'@W6F#F*(r8D/]pk%15is
/g+Y?ARTU%E+*j%%16WbF(KG9-UUQr5uLNF<(JAG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^CLnVs+DkP.
FCfJ8Eb-hCAS5^uFCfJ8F(96)E-)Nr,#(?r73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<$DbY
%15^'6m-DcCj@.EAS#p*FD,5.A8,OqBl@ltEbT*++ED%+BleB-Eb/c(Bl5&8BOr<$D..L-ATBD;
C1\T#Bl%?'F)N1<@;0V$@;0UnDJ()#+Dbb5F<GL6+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++DGm>
@3B3$De'u)A7]1%+<X9P6m,uJDBNS'DImisFCcS'+ED$FEb/ltF*(u6+EM%5BlJ/:FD,*)+F.mJ
+Ceht+D#(tF=n[Y%13OO7qHRLEaa'$+CQC5AM%q6B5)F/ATAo7@rc:&F<G"0A0>i6F<G:>+DG^9
H#IhG+DkP$DBMPI6m-#S@ruF'DIIR2+Co2,ARfh#Ed8dJDf9_M%14Nn$;No?+D58'ATD4$AKZ#)
/TPE8BleB-EZfF5EbTK7%17,eEb/lH3ZrKWDg-//F)t\sC2[Wi+?Op2+>k9[A0<6I%13OO:-pQU
F('6'+DGp?Bl5&8BOr<'@<6O%EZfC@DfcEqEb09&B-;D=Blmon@;9^k?Qa*&@<?0*-[nZ`6rQl]
;F<l+C2[X'AS5^uFCfJFBkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rATT&2Bju*kEd8d<Bk)7!Df0!(
Gp%3I+ED%%A8c@%Gmt*);ajY.9M%QK5uLi.6qKaF8P`)I;Fs;U+B2,Z;FNl>:JOSd+q4kg$;YVP
DBMPI6m-#S@ruF'DIIR"ATJu)AS,XoAKYD(F(Jd#@q[!(@<?08+<XWsAKYT!EcZ=FA8,OqBl@lt
Ed8dGDBO%7AKYr#FD)e2F!,R<AKYo/Cj@.6Bk)7!Df0!(Gp%3B@<<W%@;[2sAKYJr@;]^hA1euI
8TZ(hF!+t$Ci!Zn+EV:.+<kcIF<Vi<Bk)7!Df0!(GqL3^7<W6[+EV:8F_>A1DJsE3F`\a:Bk)7!
Df0!(Bk;?.@ps7mDfd+2AKYJr@;]^hA0>?,+A,Et+DGpFF!+m6B5_^!+DG@t@3BZ1+EM+9+EV:.
D'2_F5t"LD9N`KIARf.kF(IBA$4R>?76s=;:/"e5A8,OqBl@ltEbT*++Ceht+C\n)@:NeYF)to'
+C]U=@;^?5DKTf*ATAo3Afs]A6m-S[F),hL+AtWo6s!8X<(.p?Bk)7!Df0!(Bk;?.@ps6tDf0B:
+C\n)@:NeYF)to'+C]U=Df0,/FCB6+/g)8G$4R>8AS#gpDJ().Bju*kEbT*++AtWo6r-QO=Wh[(
AThX&FE8R5@q04`ASuTuC`m\>F=2,P@<3Q:Dfm1@E+No0@;]Tu@r-()AKYMt@ruF'DIIR"ATKI5
$7QDk:-pQUD..3k+C];3ATMr9;FNl>:JOSd%17#a+=CW;FCfN8-QlV91E^UH+=ANG$=n*sATT%B
;FNl>:JOSd-OgCl$;No?+C];"DfBtEBlbD7Dg*=GBOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Xq%)
DfBtE@W6F#F*&cP>9G^EDe't<-OgCl$;No?+D,>.F*&O;Ec6)>06;8MFCcS9ATVu9E+*j%%16`g
E$-N:B6%p5E$m^i4$"a"@<?'jBOt[h+F.O,Eb&U#ATJu9De*:%+EM[CEbTT+F(KGI-OgCl$;No?
+Du+>AKYMt@ruF'DIIR2+E1b2BFP;ZBk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l394_[R+ED%*ATD@"
@qB^(F`:l"FCetl$6i,378P+)77K^D78?3=;]o(:6pXd@6m<'I%15^'6m-PmDfTE1+EqaEA0>o(
An?!oDI[7!/g)97AS,LoASu!hF!,%3@:F%a+DkP)Gp%6NAS-($+E)41Eaa'(Df0VK+Auc_ATD@"
@qB^(@;KauG9A;HATVs;.3N_N+Dbt)A0?)7Eb'56FD,*)+CehrC`mY<BOu3,GAhM4F!,17+Dtb7
+Cf>-FCf]=F"Rn/.1HVZ67sC!DJXS@E-67FA8,OqBl@ltEd8dJAS,LoASu!hF!,@3ARlp+E+EC!
Bl7Q+/Kf+JDg*=?@<6N5AncF"+Dk\2F(&]mEt&I`2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l36uQRXD.RU,+Co1rFD5Z2@<-W9DdmHm@ruc$$6hl66WHiL:/i?(8OHHK
:JO2R=WgL,8ju*H;^)YX%15LA@s)X"DKK</Bl@l3BlbD*+Dbt6B-;8;@;]UiDJ()5DfTD3E,TH.
F<G16EZf=ADeF*!D/Ej)F"SRX9lG)p+E(j7FD,6&+D>2*AKY]//g+)2D.Oi"Cgh$p+DGpFF!,UC
DIm<hF)tc1Gp$O5A0>H,ASrW$BleB:@:OCnDJ(RE+A[)mATDi7E-67FBl5&,@;KNu@UX%`A0>Gq
AoD^3F"SS,DBNeA+E)45DJ=$,+EV:2F!)Z@F)E@I+D#_-DBO.DDf022+s8!uDf9//A8bt#D.RU,
@<?4%DBNM,AThL(ATJu(De*E3+A$Gn95\loBI@jDDfBE.Bl@l3BlkJ=AT2'u@<?(%+<kW9FCfK$
FCcS6Ec5T2@;TjqDJ(.9Ao_g,+EV:.+CT).ATDZsFD5o0+>"][Bl%U"FCfK$FCcS6Ec5T2@;Tjq
DJ(RG+<Vd9$4R>7:IH=EEc6,8A7]g)@3BH1D.7's+E(j7ARTY*+Eq7>F!,RC+CoD#F_t]-F<G(3
A7[A9=`8F*@ps6tASuU$EZed5F(oN)Ch4`1ASuU$DI[6#DfQt/+DbJ,B4W2rBle?,Ecb`3Bl@lA
+<X5uGAhV?A0>o(@rH4$ASu$$FD,5.AoD^,ATBCG+B)i_+A,Et+CoD#F_t]-FCB9*Df-\0DfQt;
DfTD3A8bt#D.RU,@<?4%DBNk:FD5Z2F"Rn/.1HVZ67sBmDfQt<ATo8@DfTB0+EVXL+CQC6Bl7R"
AKYf'DIjr/AftW&@s)X"DKK</Bl@lA%16NUFCfK/@<6O3FE0N*>p+PJINTk#>9GF=0d\;_3drMC
-sIf_/g+FK%17&sF<Dr>AoqU)CghC,F*)FM%13OO:-pQUBl8!'Ec`FFASuU$DI[5e$8<S^+E2IF
+=CT0FCfK/@<6O3FE/`j-ZWd?@;0V#+EMXFBl7Q+.![6a@:jUmEZf1,F*&OC@q0Y%Eb0,uAKYo'
+=MI`-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^+E_a:F!,"3@s)X"DKK</Bl@l3Bl5&2ATo8,Df0Z.
G]\!Z%14Nn$;No?+D,P4+EV%%BlnD=FD,5.A8bspASuT4F(K62ASu!h+DGm>An?'oBOt]`$=mjl
E$-N:AoqU)CghC,F*)FM%13OO:-pQU@WH0oAo)`8A7]glEbSuo+EM[CD/X?1+D5_5F`8HG/Kf.K
AKYr#H"(2lCER5-EZeq2FCfK,DJ()6BQ%s'+EM+3FCf?"ATJ:fBP_X*C`n-Y+D5_6+=D5QDJa<1
DC5l#%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15C=+D#e+D/a<&+E(j7Ci=3(+CoD#F_t]-FCB9*Df.0:$7QDk
:-pQUCi=3(+CoD#F_t]-F:AR2+?:QTBle59-ZaEJEbTT+F(KGI-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
6tKtEDIjr9Dfp(CDg-(A8l%htF(fK4FCTH8Et&I#6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb
;^)YX%15^'6m-\lEb'56@ps6t@V$[)F(Jl)GA2/4Bl5&%Eaia)Eaa!6+A*bqEc5T2@;U'<+<X6f
+F.mJ+CoD.-ZgJCBl7H(@3A0<6m-GhBl.R+Bm+&1FD,*)+Dk\$FE8RMDfp(CDImBiF!,"3+CQC/
BlnH5AKYr4DeF*!D/F!)B.aW#%16'JATD?)@<,p%D..=-+D#e+D/a<&F!,C5+A,Et+E2@>B6%Et
D/!m#+DG^98l%i&F!,OBF`Lu'+Cf>#AM,)sDKBo.Cht59BOr<$De*p-F`Lu'+CSekDf-\>D]i\(
F<F1O6m-PhF`Lu'+Cf>#AM+E!.1HVZ67sBlG[YH.Ch7Z1De:,7F(oN)+A,Et+EqaEA9/l8D]iS%
Anc-o+Dtb7+D,%lBl%L*Bk;>p$4R>;67sBkATM@%BjtWr@3A0<6m-,_Dfp".$>='ZBkhQs?TgFm
><3m?CiF9.+BplLI4cXTEc;Hp%15is/g,1G/TPE7ATD@"@q?d%F`\a:Bk)7!Df0!(Gp%0ADg*=4
DL!@9EcQ)=Et&IsATD?o?YO7nA7%J\+>Y-$+=ART/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[
DETV#/okNHD^Qn[-QlV9Gpa%.%15is/g,4KDg*=JDfTB0+ED%*ATD@"@qB0n@X0)?DfTB0+DG^9
@3B3'Dfp"AFD,*)+CT;%+Du+>+DG^9FD,5.B6%p5E"*.hDe*KfBkhQs?TgFm-XgY.Dfp"H%16ut
?YO7nA7%J\+>Y-$+=ARGCi"-'Aof(;I4cXTDCH\[/g+eE4Y@jiEc<.9De*K.%13OO:-pQUD/"'4
Bl7Q+Ao_g,+=LZ2Ec6)>.1HW%GT\@]%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bF`VYCD/"<-+A,Et+D#(t
F<G1(@qfanFD5<-%14:H<Dujm9hAMW+A,Et+@S[i<$4Xr6V0sC<(TMW+q4kg$<1\M+DkP$DBMPI
6m-&OBlkJADfTB0+=M,O.3N&:A0<:3A18X2@;[2sAKYK*F*)>;BmO?$+C]U=A7]@eDJ=!$+CQB\
:IA,V78?fL:JFPL:.-4G@rc:&F=n"0.1HVZ67sBkAS,XoAKYN%@s)X"DKI"2Df'?"DIal2@rc:&
F<E.XH[\_=I3<6F+EqaEA0>buD.Oi/CgggbBQ%]tATA4e6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km
+>=p!+>=63F)>i<FDuAE+E2?D-[U;;IXNRQ$7QDk%13OO:-pQU@rc-hFCcS'+Dtb7+EqaEA0<HH
DfB9*F!,%)BlkJABl7I"G7=msG9A8BE-H5@A1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15R=DIal3BOr;7
@W6O0Eb$UAARoLs+EqO;A8cZ7@;]TuDJsW.+D>\;+@K!m<D>nW<'sGU9gMNB+EV1>F<G7*F!+q'
ASrW-De*QoBk:ft@;]TuBl8!'Ec`oV+BN5fDBO%7AKZ&(EbTK7+EqO;A8cZ7BlbD<@<Q3m+EqOA
BHTZ?<(nlF+@K!m<D>nW<'sGU9gMNB+EDUBF"Rn/%16!UDBNA*A0>AuDf]J4FD,5.-t7.>DfTA;
+D#(tF<GdADId[0/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k7:^+S+CQC:DfTA2Bl5&8BOr;sBk)7!
Df0!(GqL3^8l%htBlbD*Cj0<5F!,%)Bln',B-:]&E+rm)/g*r1BkM-t@;L!-@ps6tDf0B:+C\n)
@q]:gB4YTrGA2/4+D#e:Ch[BnF<GOFF<GL@ATD4$Bl@m1/e&.:%15is/g+tK@:UKkBk)7!Df0!(
Gp%<LEb$;,DKKe>ARoLs+EqO;A8cZ$$>!`j-ZaEJEbTT+F(KGI-OgCl$;No?+D,>*A0>u-AKWCB
F`)56F(KE(F>,-dARoLs+EqO;A8cZ7@;]TuDJsV>6r-0M9gqfV6VgEN5u'fj%13OO:-pQU@r-()
AKYPpBlkJABl7I"G7=lg$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tKtEDIjq_:IH=EEc5](@rri1@:O=rEt&I#
6q'R::.69t:IH=%;GTnR6W>1&5snOG;^)YX%160MASrW0Ec5T2@;TjqDJ()9Bln#28l%htH#IgJ
FEqh>@ps1iGp%$EASrW!+EM+9+E(j7A8,OqBl@ltEbT*+/g*i+@:UL%Df'&.F*VhKASiQ2@rc:&
FE8R5DIal#AS,XoAKZ&4D.Oi'@;]V$+Du+?DK@EQ+B3#gF!+t$DBND"+CoD.AKY])+CQC3Ec5](
@rri1@:O=r+EM%5BlJ/H%14Nn$;No?+Co%qBl7K)@3BN0De`inF<GF/@rcK1/KdV-F`V+:FD,5.
E,oN%Bm:b>EbZ_/DfQtAF^o)-F(96)E--.1$?1$#F*2A;Df9MV3Zp+!3Zp*c$4R>;67sC%FCB&t
@<,m$C*7S-EbTK7Et&IsAT;j,Eb-@@A7]4mB-;;)F)*-4$4R>;67sBsDe!3l+EM%5BlJ/:DJsZ8
F!(o!C2[Wq?YO7nA7%J\+=D5QDJa<1DC5l#C2[X(?YO7nA7%J\+=D5QDJa<1DKKH2FE8f=$4R>;
67sC"F`]9]Eb/hl$:IZW<D>nW<'sGU9gMNB?[?'%4ZX]5F)>i<FDuAE+E2?D-RX7i:4@U=-RT?1
.1HUn$;No?+EMXCEb-A1@:O=r%14p7E-67F-ZF*@F*2A;Df9M@4%`F=;Fs\a?X[\fA7%E;Eb]Z<
DJa<1D@Hp^$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;YPLAKYr4De`inF<GF/@rcL/+CT;%+Co%qBl7Km+DGpF
F!,%&F*SmMD]iP.DJ!TqF`M%9H#IhG+A*btATMp,Df-[L+E)41DBO%7AKZ#)EHPu9ARlooBk)7!
Df0!(Bk;?.@;]TuEcl7BGA2/4+=M8I.3N_N+EM+9F`8rB$7QDk:-pQUF(KH9E$0+?De`inF:ARt
D'13FEb]Z<DJa<1DC6PL>9Iip+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[dA8--.H#IhG+DPh*E,ol/Bl%?5Bkh\u$6ho,8Q6g8:K::8C2[X%Ec5Q(Ch555C3(R.
$4R>DBOu'(8l%htCi<`mF!,R<AKZ&(EbTK7+F[a0A8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5
Bkh]3BlbD.G\(B-FCeu8+B3#gF!,O6EbTK7+Ceht+C\n)F`V,)+EVNEF(KG9F`8Hq:IH=IBOr<1
@<iu@Dfm1H@;^0>+AQisAKYZ)G9D0LFWb1&DBNM8ARfk)AKYr4De`inF<GF/@rcL/+EqL1DBMPI
6m-;a@:XF%GA2/4+EM+3FCf?"ATJu1Bkq9@%13OOEbupHE,o]7F`)&7Df-pF>9Iip+?MV3@W5gq
E-WR8E-,Z4F=.M)%160&;GKeY7lhc6FDl22+F.mJEZf=ADe<^"AKY])+E)./+E(j7H#IhG+Co1r
FD5Z2@<-'nF"SRX<+oue+D,>(AKY].+ED%7ATT&=BOu'(8jQ,nF`:l"FCfM9FD,5.8l%ht@:Wne
DCuA*.1HVZ67sBkBle60@<iu1De*g-De<^"AM.\3Et&IfF<GU8@:W_RC2[Wi+DPk(FD*%N@:Wne
DK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F!hD(%15is/g+Y?Df]J4FD,5.C2[X%Ec5Q(Ch555
C3(MABl7I"G7=lg$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JM?+
,#qQ1+A,Et+@npp:`r&!6m+ln6WHiL:/jMY8P`)*%13OO8T&Tk@;Ka&FD,5.-td+/ATD3q05>E9
A8bt#D.RU,.3N&0A8c?.FDi:EF(HId:IH=%6q/;4ASc<<+:SZ,%15is/g+tK@psInDf-\9Afti,
A1hh3AfrZJBl8!6@;Ka&@:WneDBL??ASu("@;IT3De*Bs@s)X"DKI<MGA2/4+A+pn%16ih@<?0*
-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EQ.%13OO:-pQUDfB9*F!,49
A1hh3Aftf"+CQC3A7cs)ART+\EZf(;+CTG%Bl%3eCh4`-DBO4CF`JUGH#n(=D%-heDe*NmCiCLN
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[rF_tu(Ed8d9DIal%Bl7?q+ED%1@<-.)/e&.eBOr;uDes6.GA1r-
+E2@0@ruEpATJu2@;BEs8l%htD/XH++E2@>A9DC(Bm+&1@;]TuF`V,+F_j)J$4R>7:IH<n:IS2)
:/=h36:FRD:.HEu:*<M,73G2F<)Q.R%13OO6:!t3<DXf)5sn:F:`r(j6VCEU%13OO<'a/G+@.,K
6W-KP<$4S/9i)9+%15fq919sh+AG.#<(0\-;FN0877TpJ<(0\-;aXGS:fIl2%16$&<$4k+6;g*I
=Wg+(6W?WQ:-hcL78k=.:EWP(5t"LD9N_f3%15`s78P+)77K^D78?3=;]o(:6pXd@6k'J4$:IZW
<D>nW<$4S#6W?WQ:-hc\+AY<r771$Q%13OO6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb;[j'C
$:@fl<)64[>"'Q+:IH<o6qL?#7R9C59M&2T78jX&%15Kl7S-?D+A,Et+Abs38ju*H+AG-h;GU4#
$4R>26qL?#=\i$q+DPh*E,ol/Bl%?5Bkh\u$4R>B;ahg$:IH<r78-N#5u'fj6r-0M9gqfV5u^EO
:(7O>$4R>ABOu6r+CT;%+DQ%?F<GXCD.Oi.Afu2/AKXT@6m-Gh@:OCn@qB^(8K_\TG%De.Dfor.
+E_a:Ap%oB+<Wsk+F.mJ+E_a:+A,Et+F.mJ+EqO9C`m\;Ddm-aCj@.8Bl7H(H#IhG+E)IA+Dk\3
BQ%F&/g)8G$4R>6AfuA;FWb:1DIakuDBN@1F`V,+F_i1;ATVU(A0>i-ARTXk+DbV2+Dk[4CMn'7
/g)9.+Ceht+C\n)Eb/ZhBOt]s@<=O>$4R>7DeO#26=FY@EZbeu9jr'PBHT&a0fTUL@UX%`Eb],F
3C%4o@;0O1@rH2n$7QDk%16igA7Th"E&':E5seOB<(o_D3ZoeB:IH<R1+=>EDfp)1AKX?YA7ZlO
F_u(?;e'i^E--.K%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o
@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3ZoeLBPDN1CggcqA7]UrDKBo?@<?(%+D>\;+EVNECi<`m
+CoV3E$.bK6m-P\EbTK7F!*%WEb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\
4ZX]?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[hDKKo;A9DC(Bl@ku$;+)^+EMIDEarZ'@rGmh+DGm>A8-+,
EbT!*FCeu*Bl5&8BQ@Zq+A,Et+CoV3E$043EbTK7F"SS'F_u(?F(96)E--.D@<,p%E,8rsDBM5D
6V0il8g&1bEbTK7F!,R<@<<W%@;[2sAKYf-@:Wq[+EqOABHTnpF!,OG@;]UaEb$;6@rc:&F<GOC
De!@"F(oN)+Eh=:@WO.2$4R>ABPDN1Cggcq@<6L4D.Rc28l%ht@;]TuF*2G@DfTr6DJ()#A7TUr
F!,.)G%De*AS#a%Bl8!6@;KakA1eus:IH=6DIal2F`;;<Ecc#5B-:VnA8c@,+Ceht+C\n)Bl8!6
@;KakA0?)1FD)e=BOr;Y+E1b!CLLje+DkP)@:s.l/e&.:%15is/g,7S+E_a:+CQC'F_u(?F(96)
E-*3p:IH=BF`VXI@V$Zj@ruF.AISueAT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[bDf00$B6A6++CQCAC2[X(Dfp)1AKYMtEb/a&DfU+4$<1pdEcl7B@3A0<6m-#_D/^V=@rc:&
F<GX=D/a<:+E)41DBN@1DIn#7A8,OqBl@ltEd8d9DIal4F(HIB0HiJ2.4u_P$4R>3DfQtBBPDN1
CggcqFD,5.F)Q2A@q?cnBk)7!Df0!(Bk;?.@<,p%@rc-hFCeu*Bl5&8BOr;7IS*C(;bpCk6U`FH
Eb0&qFD5o0+Co2,ARfh#Ed98[+B`W*+EqO9C`mV,ARlp*D]iP.DJ!TqF`M%9@3A/bAoDKrATAo8
D]j";Bl8#8FDi:1DBN@tFEM#.+Co2,ARfh#Ed98[8K^r2;GU%X9N`K9770jF9gqfF+E_a>DJ()#
+Co2,ARfh#Ed8dLBOQ!*BlbD7Dfd+9DBO%7AKXSfF*VhKASiQ3Eb/f*+B`W*+CoD.-ZgJT@;^00
H#IhG+E2@4@qfk(F!,"-@ruF'DIIR2+Cno&@:EYdATJu'ASH$p+EqO=ARlomGp$g=F*(i,Ch[d"
+EV:.+Dtb8F<F0uG%G]8Bl@lA%13OO6=jbIEb-A4Ec5H!ARoLmB-:]&DJ!TqF`M%9@3?tI8l%iR
:K::[74B?iBl[cpFDl2F/g*r-+A+UG0R+^4;,eZZH#n(=D0$hABOr;RDf00$B6A6+01KkrA7]e&
+Dk\-FWbUAASuQ3FD,5.A8-'q@ruX0Gp$^;Ch.*t+Cf>-Anbn#Eaa'(Df-\0Bl%?5%14Nn$;No?
+Cf>-Anbn#Eb-A%+FZpY6rQl];F<kqA8-'q@ruX0Gp$R-AoD^$+E2@>@qB4^Bl7Q+FDi:DBOr<(
AU&;>F*(u4/e&-s$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is]`G%De8Eb0E.Dfp+DCggcqA8,OqBl@ltEbT*+
/e&.h5uLHL:.I>f<(KG#:.88a+B)6.:`rY)9i"eY;]nJ"6W?WQ:-hcL78k<r;FNlN7787b=WgO=
8P`5,;H6Ij+AYHL<(KSZ+A>'f/g)9984=Xh8OHHK:JO2R8OZQ#.!9WGCiaE2@:Uo3C2[X!Ddd0-
+DPh*A7]q#Ddd0*+BM-.9HZYj+@JXl78u]D/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m#+@Aq"<(0P]
;]nk*+B1m#;ahfs8OHHK:JO2R8OZQ#6r+q#:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^/e&-s
$<1\QF!,OGAT/c&AS,XoATJu&+Eh=:@N]c+@<<W4ASl@/ATJu1@:C@#Dfp)1AKYMt@ruF'DIIR"
ATKI5$7QDk;Is]`G%F?U@T.2fEarZKBk)7!Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A'AhG2RIS*C(
;bpCk6U`@F/NP"pDf9_\/g+nJ@<?0*-[nZ`6rQl];F<l#+CoCC%144#F)>i<FDuAE+=BGt8l%iR
:K::[73H,TEb/a&DfU+GBlbD7Dfd+CATW'6+>"^WATW'6+CT.u+EVXL+CSnkBl5ON%16Z_F(K&t
/g)_uAn?4$F*&O>E+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[W8Bkh]:+CoCC%144#
F)>i<FDuAE+=BcW6rQl];F<kq@:WneDBNY7+Du+>+DG_7FCB!%ARlo8+DG_7FCB!%+CT.u+EVXL
+CSnkBl5ON%16Z_F(K&t/g*_T=%Q.0A8a(0$6UHd67sBjCh7$q+E)CE+Co1rFD5Z2@<-W9A8-'q
@ruX0Bk;>p$6UI4BOu!r+=D2?+>7dY06&*Y-S-ZdDf9_K-X:e9Bl%j,Ddd0(.4chj-OgD*+EM4-
Cht4AEb$:GF!*,U+<i0a-us6EF=\eEC2[X!Ddd0(.4chj-OgD*+EM4-Cht4AEb$:GF!*,U+<i0a
-us6EF=\eEC2[WnAThm.@:U`7/12Vh%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC.3N\M
F`Lu'+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>q
Cgh3sF!,17+A,Et;bpCk6U`,:@<?1(+E)-?9PJBeGT^F4A0=TT@j#i<F*(u1Et&I!+EM4-Cht4A
EbupNEb6FA/95ZIF=\dmF`_>6F)5c'A1%fn+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9Ci<`m
-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnAThm.@:U_p$6UI4D/XQ=E-67F-VRrX+EV13
E,Tc*Ed8cUD.-p-Ch[d0GUXbVDfp)1AKYMt@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.D_;J+
+<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+F`S[IASlC)Eaa!6+DbIq+EMIDEarZ'A8,OqBl@lt
EbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@DEb0E.
Dfp+DCi<`m+DbIq+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sC'DK9<$BleB-EZcqVBkM=%Eb-A)EcQ)=
Et&I1+>=o`+>Y-\AS5O#4s2pJ-ZsNFCiaE2@:UKqDe*[&@:UKqDe*BiG&2)*A1&L(+>Y-YA0<6I
%13OO:-pQU@r,^bEZf:CF<G+.@ruF'DIIR2+Co2,ARfh#EbT*+%16!ED/XT/9OVC/Dfp)1AOL6B
FD5Z2@<-'nF!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;eART[l+E_d?CiaE2@:UKkBk)7!Df0!(Gmt*K
F_u(?F(96)E--.D@<,p%Ci<`mARlotDKKe>A8,OqBl@ltEbT*+/g)9(Eb/[$AKYD(.!9WGCiaE2
@:Uf0A8,OqBl@ltEd98H$7QDk:-pQU@rc-hFCcS'+Dtb7+E_d?Ci^_0Bl[cpFDl2F+DG^9."4ca
6rQl];F<l%+>"^MF<GdACht5'AKZ#)DIIBnA0>\sFCfJ%$;No?+B`W*+Dl7BF<G(3DJ!TqF`M%9
."4ca6rQl];F<l%+CT.u+E275DKI"CD]iJ++CSc%F^])/ASlC.Gp$X3Eb/a&DfU+U%13OODIn$&
+=D;RBl%j,Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+F`_>6F)5c'A1&ff-Z*:+DBO(DBl%L*Gp$X3
@ruF'DIIR2-OgCl$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*++CT.u+E)41D@HqkA0<7B
FD5Q4Ci<`m-QlV91E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqSBOu'(8l%htA9Da.+EM%5BlJ08
+EDUB+EV:.Gp$X9+Du+>+Co2-FEMV5+F.mJEZek7EcP`/F<F0uASu[*Ec5i4ASuTB+<WsdC`mq?
Eb'56@<,p%A7]@eDIm?$Bl5&%+Du==@V'RkA0>r'Eaa'"BHV,0@ps1b+EV:*F<G:=+CfG'@<?'k
+EqL1DBMPI6m-;a@:XF3+<X9P6m-#_D/^V=@rc:&FE8R8Ble60@<iu4ATMp$B4Z-,@:jUmEZf1:
@:X(iB-:YlFCSuqF!,C5+E(_(ARfh'/g)99BOr<(AU&;>CggcqF*(u4+Dbt)A9/l8BOr</FD5Q*
FEo!>Bk)7!Df0!(GqKO5%160FEc,T/B0%/GF_u(?F(96)E--.D@ps6t@V$[*ATE&=Cgh?sAKZ&4
+DGpFF!+m6B5_^!+DG@t@3BZ1+E_a:+CT)1@<lo:F`V+:-nlf*GUY6f+A?]^A8,po+CQC'F_u(?
F(96)E-*4:DKKe>8g&1dF)u&6DBNM$Bln96F!+t$DBNG0@<6*)8g%_aEZfO:Ed8dD@<-!l+EM%5
BlJ08/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(GqKO5
.1HVZ67sC$F`&=DBOr</FD5Q4+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("
@;IT3De*p-F`Lu'06MANCi_4CC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgB4YslEaa'$+E_d?Ci^_/
Ec6#?+ED%*ATD@"@qB]j$<1\M+DbJ-F<GF3F)tc&AKYMtF)Yr(H"CM/@X0))+CoV3E$043EbTK7
+DGm>@3BT%D/!luATAo8D]j(3B4YslEaa'$+CfG1F)rIEAS,LoASu!hF"SRX8l%htA8,OqBl@lt
EbT*++DkP$DKK<$DBO.AEb$;&Ec6#?+ED%*ATD@"@qB^(FD,*)+CT;%+E_a:A0>T(+DkP)Gp%<>
H#kS\+B3#c+CfG1F)rIEAS,LoASu!hF!+n3AKYl/F<GXHDfTE"+DG^9A9Da.F!+n/A0>`3F*&O6
AKZ#)@rc-hFCeu*@:jUmEd(r4A90@4$7QDk:-pQUEb/lpDImisFCcS;FD5Q*FD5<-+CfG1F)rIE
AS,LoASu!hF!+n/A0>r,Dg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu7
-RT?1%13OO:-pQUD..3k+E_d?Ch\!*ATJu&+ED%%A0>f.Cj@.6Bk)7!Df0!(Gmt*kE-#T4+=C&U
5t"LD9N`_P$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk@:UKqDe':a<+ohcF`_>6Bln'#F!,"-@ruF'DIIR2
+DGm>DJs_ACi<`mARlolDIal"Ec6#?+ED%*ATD@"@qB^(BOQ'q+C\nnDBO(@A79RkA1euI<,Wmh
Df'H0ATVK+FD,5.Eb0<6DfT9.Bl@l3De:+a:IH=HDfp)1AKYK$A7Zm-AKYl/G9CC9ART[l+CT.u
+Dbt)A0<:8De*[&@:Uf0@;]Tu-u*[2A7]q#Ddd0*/e&.:%15is/g+YEART[l+Co1rFD5Z2@<-'n
Et&IoATqZ--YdR1Ci<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q05>E9Ci<`m-Rh,)C2[W*F)Q2A@q?cm
De*E%A8,OqBl@ltEd9#A$>sF!A0<77De*BiG&2)*A1'GeC2dU'BHS[O8l%iR:K::[75&CoA7T7p
Ci<`m-Rh,)C2[W*A7]pqCi=90ASuT4E-67FA8,OqBl@ltEd9#A$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF
:IH=HDfp)1AKYK$A7ZloAT23uA9/l3DBNk,C1UmsF!,17+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(
GqL3^<+oue+ED%0@<?4%DKBK*E$/k9+DkP$DKK<$DIm?$@X0)<BOr<*@<?0*DfTB"EZf:4+Co1r
FD5Z2@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJt'$8WfCA0<6I%13OO
:-pQUDfB9*+=LuCA8H0mA18X0DIak<F`_>6F)5c'A17rpDe'tP3[\Z\A8H0mA0?#:Bl%j,Ddd0(
%13OO:-pQUA8-+(CghT3A8,OqBl@ltEd8dADJ!g-D..O#Df-!kA8,S'+<W?I$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'D@HqHDdd0!8l%htF)Q2A@q?cmDe*E3+<XWsAKXT@6m-#S@ruF'DIIR2+CoV3E$/k9+DbJ,
B4W2pARf.kF(HJ.F<G(3DKK<$DK?q/+EM[7F*(i.FD50"+CT,*F`):DDe:,&De!p,ASuTuFD5Z2
+CT.u+EV19F<G+&FC?dE8TZ(l@<iu;@;BEs@3B/nG9Ca@D.RU,F!,RC+Dbt)A1e;u.1HVZ67sBs
Ddd0!C2[Vl$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[W8Bkh]:%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[qAS5RlATD4$AKY`+A0>B&Df]tBEb/ioEb0,uATJ:f6=jbIEb-A6AS5Rl
ATD4$Bl7Q+C2[W1F!+t5Df]tBEb/ioEb0,uATJu1Df9D6@<<W6BOr<)E+No0A8,OqBl@ltEbT*+
/g)99BOr;7C2[X!Ddd0*+Co1rFD5Z2@<-W9DJs_ABOPs)@3BT%An?!oDI[6#E+*j%+EV:*F<G:8
@r-9uATJtBF`_>6F)5c'A19,?$7QDk:-pQUDJsW.+EV:.+=LuCA8H0mA18X?@<?/l$=mj]INU<R
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqF:IH=8Ec6#?+ED%*ATD@"@qB^(GA1l0+Co&&ASu$$Df-\?FD5Q*
FD5<-/e&.:%15is/g,1GB4YslEaa'$+=LuCA8H0mA18X2Ec6#?+ED%*ATD@"@qB^(@;]TuF(fK9
+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D]gDT%13OO:-pQUD..3k+=LuC
A8H0mA18X0+ED%%A0>f.Cj@.6Bk)7!Df0!(Gmt*kE-#T4+=C&U5t"LD9N`_P$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMVk@:UKqDe*BiFq"dRDg*=?ATT;@+Dbt)A0>;uA0>B&Df]tBEb/ioEb0,uAKWC9De*Bi
G&2)*A19,R+=LuCA7T7pCi<`m.3N>G+EqL-F<F-t@ps1i+EV:.+<k?-FtIN=H"D"?/g)99BOr;s
ATfYA@<lF)+DGm>@3BN3F<G+.@ruF'DIIR2+EV:*F<GX=FE8RCDBO%>E$0(2+CQC1F_tT!EZf:4
+EMX5@VfTuA8,OqBl@ltEbT*+/g*Q)EbTE(+Co&,ASc:(D.RU,+E).6Gp%3BAKYMpFtIN=H"D"=
@q]:gB4Z-:+<Xg*FWb1&DBNM!F(oH9+ED%:Deio,@3B)lFtIN=H"D"=A8,OqBl@ltEd8d:Gp$U5
Df]W1B-:o1/e&.:%15is/g+Y?Df]J4DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW)DBNG-EcP`$
F<GO2FD)e8Eb&a%%14m6De't<-OgE$A0<rp-YdR1A7]q#Ddd0!C2[X!Ddd0!F`_>6F)5c'A1%fn
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%15dI@:UKhDIal"Ec6#?+ED%*ATD@"@q@8%$7QDk:-pQUCi<`m+=LuC
A7T7pCi<`m.1HV<+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A
-OgCl$;No?+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I7G\M5@F!*%WA7]@eDIml3E-67FA8,Oq
Bl@ltEd8dH@<?/l$>4Bu+=CoBA8c?54+/_(B6%r6-YdR1Df-p3$4R>;67sBjEc6#?+ED%*ATD@"
@q?)V2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-Qij*%15is/g+\9G%GK.E,B0(F<GO2FD)e-Bk)7!
Df0!(Bk;>p$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFCcS,F_kl>+Cf>,D.RU,ARlou
De'u3@rc:&FE7lu<+ohc8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*++D>2,AKYl/G9C@+ASrW2
ATMs3Eb/c6+:SYe$<1pdB4YslEaa'$+D,b4Cj@.5Df'?&DKKH#+EVX4A8-."Df0!"+A*bt@rc:&
F<G10Ch7Z1AoD]4FD,5.@rH4'Df0-(FE8RCAfu2/AKXT@6m-PrF*(u1+F.mJ+Ceht+EDUB+CQC6
@rc:&F<GXHDfTE"+DG^9FD,5.8l%htA8,OqBl@ltEbT*+/g)99BPDN1F*(u4+EDUBF!,R<BlbD<
@rc:&F=n"0.1HVZ67sBnASu("@<?''8l%htF(96)E-*47Bl%@%+DG^9Ap%p+Gp$U8D/Ej%FCeu*
AoD^,/e&/.D'138F_PZ&C2[X(Dfp)1AL@oo%15is/g+Y?Df]J4A8,OqBl@ltEbT*+%14m6De't<
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is`SD.Oh^:IH=ADdd0!A8,OqBl@ltEbT*+/e&.eBOr;Y:IH=H
Dfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.@<,p%DIIBnA0<:8De*BiFt"O^C2[W3+CT.u+=MASBl%i>
/g)92@;^?5FCfN8+CT.u+C]J-Ch+Z0@rc:&FE8R=DBO%7ATME*A8,OqBl@ltEbT*++DkP&AKZ,:
AKYo'+EV:.F(HJ3@;TRs/g)99D]iS)G%De1DKKe>8l%ht@rGmh+DGpFF!+m6B5_^!+DG@t@3BZ1
+Cf>/Gp$O5A0>o(DIIBn+EV:.+Dbt)A0>Ds@ruF'DIIR"ATKIH<Gl;bD/Ej%F<G"0A0>o8DBO%7
AKYT'Ci"$6Bl7Q+Ch[cuF!,RC+Cf>/Gp$O5A0>o(DIIBn+EV:.+Dbt)A0>Ds@ruF'DIIR"ATKIH
%13OO=$]_Z8PVc:+B;0(:JFPP:/i?3:/"e58Oah*:K8N*:EWD.<$4J#;FNl>=Wg7$<^e,ZC2[Wn
ATfLF-u*[2.3LoO6m*n#FD5Q4.3M#M6W?WQ:-hcL78kfJ$7QDk:-pQUF`)52B5)F/ATA4e:-pQU
1E^^LB4N>Q+?MV3F`_>6F)5c'A0>W*A8H0mA0>W*A7T7pCi<`m+E_d?Ci^_6De'u*De*BiFsd_+
%15is/g+Y?ARTU%@;^?5C2[W*F)Q2A@q?cnBk)7!Df0!(Bk;>p$;No?+AQisANCrDDf'?"DIdf2
@<,p%=(uP_Dg-7FDfTQ'DKKH#/g*W%EZfLBBm:bAH#n(=D0$-n:-pQUEb0*+G%De)DIal"DfBtE
A8-'q@ruX0Bk;?.D..=)@;Kb*/e&._67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W
<Dl1Q>]k.&Ci^sQ/12Vh%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lX
C2[W1.4chj-OgDX67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]p3
.4chj-OgCl$;No?+Cf>/Gp$X3@ruF'DIIR"ATJtG+>7:KDfBf4Df-\-DfBE%F!,L7EHPu9ARlop
D/aTB+EM[7A8-'q@ruX0Bk;?.%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q
>]k.&CiaE2@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%iq-RgSo+s8OM+>8!f%15is
/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fCi<`m-RgSo+s8'W/1>7P@<?0*
-[nZ`6rQl];F<lXC2[Wf-RgSo+s8OM+>8!f%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1
:IJ,W<Dl1Q>\\1fA7]q#Ddd0(.4chj+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiG$HCD/12Va
04c7ZGpa%.%15is/g,1G/TPE8BleB-EZfR?FD)e7ATo87@;TRs%15is/g,1GB4N,4F`_>6F!j$t
C2dU'BHS[O8l%iR:K::[79jtWBl%i<.6AniASu("@;I'/FD5Q*FD5<--OgDX67sC$AS5Nr-YdR1
-T`_kE+*j%+=DV1:IJ,W<Dl1Q>\\1f-Rh,)C2[W*F)Q2A@q?cmDe*E,%15is/g,1GB4N,4C2[Wn
ATfF_-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiFse_#-YdR1+Co&,ASc:(D.RU,-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l3;fuqo@<-W&$<1\QF!,:-@N]`*Dg,c'+D>\;+EVNECi<`m+CoV3E$043EbTK7F"SRX
8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*++EqC;AKYf-@:Wq[/g)99D]j1DAKZ).AKXT@6m-Ph
F`Lu'+Co1rFD5Z2@<-'nF!,=.CLnW0F`M%9FD,62+CT;%+DtV)ARlo3C2[WnATfLR+=LuCA18X0
DIak<F`_>6F"&^N$4R>7DeO#26=FY@EX`@M@<,jk+>PW*3"64(@;BFpC1K=b5\FqBBl#D3Df#pj
.1HUn$>OKiBl8$5D_a1D5seOB<(o_D3ZoeB:IH<R0e"5:DKKo;A9DC(Bl@l:%15cp6:"UN85E,H
3Zp+!3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T
3ZoeLBPDN1CggcqBl8$5De+!#ATJu9BOr;Y:IH=HH#n(=D'1DQEb0E.F(Jl)AoD]48g$)G0R+^7
@<,jk+>PW*3%#.B9L2!6;Gp:g;a!/a0b"I`5se%:6WI&J3Zp*c$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBN"o
@<<W+F!+(N6pD+f8l%htBlbD*+A*c#DfTA2F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1/e&-s
$<1\M+C\c#Bk&9"A7]0l@V'4eDIak^:IH=>F!,R<@<<Va+E2@>B6%EtD/!m#+DGm>@V'V&+EhI1
G@b;-@<3Q0EbAfuBmOK2B-:V*@rH1"ARfgrDf-\9Afu;9Eb'56FDi:@ATDC$Ebuq-+EV%5CG$`*
EbAfuBmO?$+Cf>+Ch7*uBl@m1+E(j7GAhM4F!,.)G%De)+C\o(FCfJ8DIIBn3Zpg^6W?WQ:-hcL
78k?=$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m-2b+CQBb+CSekDf.0M+A$YtBlbD2DKBo.Ci!Zn
+DG^9FD,5.."5T8A8c@,>\@VcATD3q>\\1f.3N)?@;]Rg+E(j7FD,5.@s)g4ASuT48g&2#F*(u1
+D,P.A7]d(@X0)<BOr<*@:O(]B4W3&@;]LdATAo3EZeh:+E_RJBlJ$*DJ()6BOr;sBleB:Bju4,
Bl@l3H>.=@-u*[2/p_5N.4u_c<+ohcDIn'7+DbIq+EMX9E$/k4Bln&tCh\3,F!,R<AKXT@6m-Pr
F*(u1/e&.:%15is/g,:XARlomGp%3BBlbD5@:BZQEb065Bl[c--Y@(/ATJu)BlY><@<633%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[rFCB33+A,Et%16'JBlbD<FCfD6F*(i2FE8RHBOr;Y:IH=HH#n(=D(Z8)
.1HVZ67sC%FCB33+DPh*+>"^GEb/[$ATJu2@<6O%EZet.Ch4`'Aftu&@qB_&@<-W&$?B]tF_Pl-
+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AucfDg#\7Derr,CggcqA8,OqBl@ltEbT*+
%15^'6m-2b+DG_7FCB!%ARlp-Bln$,F`\a7DL!@8Bk)7!Df0!(Bk;?<+<Ve+D]j1DAKXT@6m-bn
FWbODF*&O7Eb/[$AKZ&4D.Oi#Bk)7!Df0!(Bk;?<+<XWsBlbD5@:C@%F(KD8AoDg4+D#e+D/a<&
+Co1rFD5Z2@<-'nF!)lI@:CZ:+=M&7@Us%n.4cSiFDlFR+CT.u+=M2F@<lg'DCI1\+A,Et+Co1r
FD5Z2@<-'nF!+n3AKYK'ART[lA0?)1FD)e=BOr;7DIn$&.3KgPATo8-Bk)7!Df0!(Gp4ASATD64
+:SYe$:8<9DfTD3@rc-hFD5W*+DbIq+Co1rFD5Z2@<-'nF!,L7D/XT/+CT/5+E2@8DfQt:@:C?i
Bk)7!Df0!(Bk;?<+B3#gF!,OGAT/c&AS,XoATJu&+E_d?Ch\!:+EV:*F<GdACht5*Eaa$#+Co1r
FD5Z2@<-'nF!,(8Df$V-AS,@nCige9De!3tBl@m1/g*`-+DGm>Ecl7BBl5&8BOr<(AU&;>F*(u4
/g(T1%160&;GKeY7lhba7NbZ$73GPu9i+V`5uLi.9L1uf6qKaF8P`)I;Fs;U+@Aq"<'a)N+A#<t
:JsnQ<(Tk\+B_K?+@AFm73Fl_:K:@:6r+q#:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^+Unc-
%16!ED/XT/9OVBuBk)7!Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A0Df9_\/g+nJ@<?0*-[p2ZATB.-
$>F*)+A#%(8PUC=D_;J++<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>\mhXA7]p.
-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucsCggcs-OgD*+EM4-Cht4AEb$:G
F!*,U+<i0aEc5l</14\;De*Bm@rucsFDlFK-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;
De*Bm@rucsE,8s.E+No2-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=MGJDCH]=Bk)7!Df0!(
Bk;?.ATD4#ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5&4@<?1(
+E)-?9PJBeGT^F4A0=TT@j#i<F*(u1Et&I!+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+
05P'+A7]p3%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFCggd#%144#F(f-$C`k*G
D'1ENAfrHPEc5l</13)cDe*Bm@rucFFDlFP%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm
@rucFE,8s.E+No7%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9-uEC&05P??Fa,>XA8,OqBl@lt
EbT*++D#S%F(Jl0%16Z_F(K&t/nAlQ%144#F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5BlA-8+EV13
E,Tc*Ed8dD@:C?iBk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqNASl@/AKYE!Gp%'HBlA#7CggcqA8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5A8,Oq
Bl@ltEbT*++>"^MB5VX.AKYQ)Ec5u>%14d30H_V`1E^UH+=ANG$4R>;67sC'DK9<$BleB-EZee.
Gp$p3@N]2q@ruF'DIIR"ATJtG+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcEb/lo-9`P63[\`P@Us%n
+DbIq+EVOI+E2.*H#R>4-OgCl$;No?+ED%1Dg#\7A8,OqBl@ltEd8d<Bl[cpFDl26ATJu&DIaku
Cht5(Df0Z.DKKqB/Keb?DJsQ,+D#S6DfTn.$;tGPDg#\c@:DW=@ruF'DIIR"ATJtJ%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k<+oue+EMX9E$/Y2ART[lF!,R<AKWC;@:CZ.@;]Tu-u<=$A7]p5+Co1rFD5Z2
@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBj
Eb/[$AKWC;@:CZ.@;]Tu+=M&7@Us%n.3N/8@ruF'DIIR"ATJ:fDIn$&+=Cu6@ODTlDIn$&+=Cu6
@Us%n-OgCl$;No?+Dbb5F<G"8@;0Od@VfTuA8,OqBl@ltEbT*+%17#a+=ANG$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBM_oASu4"B-:V*@r-()Bl7Q+A8,OqBl@ltEbT*+/e&.eBOr;Y:IH=8Df'?"DIal%DfQt=
E+Np$DJ()#DIal"Ci=B/DJ()&Bk)7!Df0!(Bk;?.BlbCFDe(:>DfQsKDfB9*+Co1rFD5Z2@<-WB
/g*b^6m,uXD/E^!A9/l%Eb-A7BQ%p5+CT.u+D"u&Gp%3I+EVmJAM+E!%14M%A18X2@;[3+E+No0
A8,OqBl@ltEbT*++AtWo6s!8X<(.p<DIakf76s=;:/"eC+@1&kH#IgJD/!WrF<G.>E+NO$+AtWo
6r-QO=Wh6h@ruF'DIIR"ATJu(@;]t$F<G%(+Cf(nDJ*Nk+C]U=8l%ht@rH4$@;]Us/e&.:%15is
/g,(OASrW2ART+&GB.D>AISubA0<79@:EbYFsd_+%15is/g,(OASrW2ART+&Df0B:%14j5De't<
Cggd#%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rDf'&.@rH4$@;]TuEb0?8Ec*"0De*E%@UX=l@ri(d6#:?[
8l%ht@rH4$@;]Us+ED%8F`M@B@W-L&A0>]&F*&OFATN!1FE9&W<+ohcAnc:,F<G:>ASiQ(F!+m6
Eb0?8Ec*"0De*E?+=Jrn+D5V2A0<9S.3N).A1euI;Is]RBl7X&B-:o1ASlK2@<,p%D.Rd0@:s.m
+CT.u/0K(VF^]*&Gq:(LEcQ)=+ED%0@<?'k+DG_*DfT]'FD5Z2/g)9/:IH=8Df'?"DIdf2E+O'%
DfT\;AU&<.DKBN8AKYE%B6A'&DKI"2BOt[hBl7Q9+<X6f+F.mJ+C]A&@;?uo+A,Et+Cf>,D..<m
+E2..@<6!&ASkjiC`mS++=L]-CLqO$A2uY8B5M'kCbB49D(-T9DIal3ASc0*D.Oi6BOQ!*H#IgJ
A8,R,%14Nn$;No?+EMI<AKYQ)Ec5i,Dfp+DDfB9*+Cf>,D..<mEt&IpA0<76+CT+0@3BE$F)u&5
B-:`!@ruF'DIIR2-OgCl$;No?+C\bi+EVmJATJ:fDe'tN%13OO:-pQU@UWdiEa`j$Et&IpA0<ZN
1F+>WDf7!4$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM_mCh[cu+A,Et+CoD#F_t]-FCB9*Df-!k8l%htBOPs)
AU&<.DKBN8AKWC?A7d85A8bt#D.RU,@<?4%DD!&(:IH=9De!p,ASuTuFD5Z2+Ceht+C\n)@:NeY
F)to'+EqOABHVD1AKWC9De*NmCiCgGG%G]'/e&-s$7KY-A8#OjE%)oNE+*s.F!+m6:ddbqEb/Zi
ATAo8@<63:+A,Et+E_a:+A+#&+Cf>-Anbn#Eb/c(:ddbqEb/ZiATAo3DBN"pDId[0F!+n/A0=Q[
DKU1HF*VhKASlK2@;]TuFD,5.,&_F3DB^3EBOu!r+Cf>,D..<m+E)-?9jqOQ/e&.:%15is/g+\=
F)Yr(Gp#^T6m-#Y@s)X"DKK</Bl@ku$>OKiBOu"!+>=63%15is/g+tK@psInDf-\9Aftr!Bl5%c
:IH=%6q/;0De!p,ASuT!$>ONgFD)dEIUQbtDf0W$B4YslEa`chC2[WnDe!p,ASuTpE+EQkDdt.(
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBM>]@ruF'DIIR2+E1b2BQFUi<+ohcDfB9*+Co1rFD5Z2@<-'nF!,C5
+A,Et+Co%qBl7K)@3BW&@<,jk+CT.u+D,2,@q[!(@<?08+B3#c+=Lc7A18WLA8,OqBl@ltEd8dA
A7]Y#BkD'h@<?4%DCH]OATD6&Ch[s4F!,R<AKYr#FD*99$7QDk:-pQUF(fK9+E1b2BFP;ZBk/>?
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k<+ohcA9hToBk&8tDfT\;De:+?A8,R'+ED%8F`MA@+Co&*@;0P!
+CS_tF`\aJBOr;rDf0Z.DKKqBDe:,'@:NsnA8,OqBl@ltEd8dGDBO%7AKYr#FD*99$7QDk:-pQU
A8,OqBl@ltEd8d<ATV?pCi^$m0Han?A0<Q8$4R>;67sBkBk/?8+>=o\+AP6U+D>2$A9f;3A8,t!
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[rDf'&.DdmHm@rri3EbT*&FCB9*Df-!k<+ohc8l%htF*VhKASiQ(
F!+m6@rH4'Ch7^"+CT.u+Co&*@;0OhA0>H.@;Tt"AKYo'+E(_(ARfg)DfTQ'DKKH#+E2@>B6%Et
D/!m#+DG^98hM5/<+ohcF*VhKASiQ"Df0W1F*)IGDe:,#+Du==@V'R&De:,%CghC+ATJtBE,oN%
Bm=3"+EqOABHS[2C2[W1.4u_c=(l/_+EV:.+EMgLFCf;3Ci<`mF!+m6G%#E*ATW2?De:,1@VTIa
FE8R5Eb-A'Eb/[$ARmD9+B3#c+C\c#Bk&8oEarcsFCes(F`M%9BlbD*+DkP$DBNJ(@ruF'DIIR2
+E(_(ARfg)FD,*)+Cf>-FCAm$F!,(5F`JUGF^f8uC1UmsF"SS(@:NsnDfB9*+Co1rFD5Z2@<-W9
BlbD*CiaM;@<6L.@qf@nARlp-Bln#2@3B)pEb/a&DfU+GDdmHm@rs=G6tp[Q@ruX0Gp%$7C1Ums
F!+n3AKYK'ART[lA0>;uA0>DoF*)G@H"CM/@<3Q3AT;j,Eb/c6%14Nn$;No?+E(_(ARfh'+C\np
Bl7g&DJ()9Bln#2-Xgb.A1&L.Eb-A8BOr;Y:IH=8CghC+ATKI5$=e!lC`kD@$4R>;67sBQ:IH=8
Df0W1F*)IGDe:,5Bm:b0@<6-m+E(_(ARfh'+CT.u+CT=#$;No?+DkP)Gp$X3Eb/a&DfU+GDdmHm
@ruc7@<3Q5BOu3q+CT;%+E1b2BHV#2ASlK@%16T`DJUFM%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sBOr<*
F`\a:Bk)7!Df0!(Gp$U8DI[6sF:ARVBOr;uBl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*BlbD<
E+NNn@;IP=+A$YtBlbD=BOr<)DJXS@+Co1rFD5Z2@<-W9FD,*)+Ceht+C\n)D/Ws!Anbge+C]U=
8l%ht@rH4$@;]Us/g)9'ARf.kF(HJ2Df^"CA8,OqBl@ltEd8dEDe*QoBk(RnBl@m1+CT;%+E2IF
-Z^D%+CehrC`mh5BlbD-Bk)7!Df0!(Gp%3BAKW19F`\fMA8,OqBl@ltEd98H$4R>6F=2,PBl.g-
Ecb`-F<G[D+E_R4ATDj6@;]TuFD,*)+F.mJ+Ceht+E_a:+EV:.+Cf>-FCf?3F!,C5+EV:.+E)@8
ATAo(Bk)7!Df0!(Bk;?.Df-\>BOr<*@<?0*@Wcc8H#IgJ@ps7mDfd+3BOPdkAKZ).ASiQ(DBNA*
Gp%<>GqKO5.1HVZ67sBmBl\9:+E1b2BHUi"@ruF'DIIR2+DGm>FD,5.E-67FA8,OqBl@ltEd8*$
A8,Qs0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36ZQaHFD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/6=jbIEb-A1
De*QoH"h//+EV:.+Cf>-FCf?3F!,C5+CT/5+Co1rFD5Z2@<-W9Ch7]9F!+t5ART[l+CQC1ATo7@
FDlFK+Co1rFD5Z2@<-W9@;]TuD..3k+DGp?FD,5.E-67FA8,OqBl@ltEd98H$7QDk:-pQU@r-()
AKYo1ASrW$Bk)7!Df0!(Bk;>p$8WfCA0<6I%13OO:-pQU@rc-hFCcRCFDlFR%16uaG@VgDFDlFP
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k9jqgK+=M>MGpskE+E2IF+Co1rFD5Z2@<-WG%14Nn$;No?+E)41
DBO%>Gq:(S@:EbYFs(42A0>\s@N[6FFDlFIBlbD=BOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Zj9P
+DbIqA7]p,Cggd#%13OO:-pQUBl8!7Eb-A8Dg<I>F!,L7@:V$8EbTW,%16WbF(KG9-W3B!6s!8X
<(//D$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\FED57B-:W#A0>i6FED57B-;D:Eb'5D%15[E+EV:.+D,>.
F*&OGARfgrDf-[h+ELt*A0=K?6m-2b+CQC:DfTA2F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1
/g)93Dg*=JAKYE%AKZ#)@:XX+FDi9ME-67O+CT.u+=Ll6F=A>RDf'&.GAhM4F"Rn/%15R=EcZ=F
@rc-hFCcS9Df'&.GAhM4F!,RC+EMXCEb-j4$7QDk:-pQU@rc-hFCcS9Df'&.GAhM4Et&Is@;]Uo
D*9p&5;=i70eak-0JFUl:-pQUDKTf-EbT#+DJsZ8%172gG]Z)0+=D8EBlbD2F!+m6FCfN8+E(j7
FD,5.Df0,/E-624+EV:2DJ(=+$>+*m@<?QR3Zp1#.j-,\0eb:+0eb9j$?LK0@W-((4ZX^,3Zodm
Df0&r+Dl%;AKZ22FD)e/AS#[lDJ(=+$=[puARmqb+?Ui&+DEGN1*A@^$?BQsBl@ltCi_a#+>GQ(
+=eQ\+=KE7BeCM_0R,#h?6D*Z%175qBk)'lAN`'sFZLWmFD,B0+DGm>DJs_AF`(o'De*E,%16ZT
@q\"d+=8^)+<VdL+<VdL+<Ve%67sC&@:O"n+CSf(ATD5h$>"I$Ch[BnF?MZ-1a"h%0F\@a67sBl
G]7J5@qg$-G%G]'%17>&.kVri%14Nn$4R>dDfTB04ZX]I3[\rVDId[&+EV1>F<G13Ddda/+EMgF
@W-((+C]86ARlp(@<?4%DII@&+E_R9@rGmh+D"tkBHUl2E,95uBlk^3$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@Hq$E-67O+DGm>FD,5.8l%ht@rH4$@;]TuFD,*)+EMXCEb0;7GAhM4F"Rn/%16$BG%De)DIal$
Eaa$#+EV:.+EqaEA90@G+B2cbAKZ&4D.Oi3Bl.E(FDi:3Df0`4DI[6#H#IhGF(K0"+EV:*F<G[=
AKZ28Eb'56BOQ'q+C\nnDBNM2@<6!j+C\noDfTD3E,ol,AS#CdDJ(R2$7QDk%15is/g,4DG%De?
DfTB0%17&sF<GdGEb'5#$4R>;67sBlEaa$#+Co%qBl7X,Bl@m1%16Ze@<6!&GAhM4Et&Hc$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$;PM`+ED%8EbT*.AKZ).AKZ&9DfTE"+EqaEA9/l%DIal"BOt[h+EV:*F<G[=
AU,D,Eb-A4Ec5o.Ebp"DEb0<6DfTE"/e&.:%15is/g+e<F<GdGEb'5#$>3pl+EqaEA9/1e%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@L-XF_t]-FCB9*Df-[P0JO"D:Ms_dDe:,/Gp%';F<GO6AThX++DGm>F`(`.
@s)X"DKKH#+Cf>#AK_Ki%15XEG9Cg9FCf>4BOQ'q+F.mJ+D>1o+EVNEAmo1\+D>n8A9)6lF"AGN
@<l<n+EV:8F`Uu/A90:EDe:,.Bl7L'+E(j7@rGmh+EqOABHV2$Ed8d9+Cf>,D.RU,+DG^9F(o9#
F=n\'Df'?&DKKqB@<,p%DJsV>AoD]4GA1o5F!+n/A0>N!Ebp"QD.RT;+B2ogCh[d"+Cf>,D.RU,
F!+n3AKYD(BOP^nD..I#+E(j7B5_^!+Cf>#AM+E!%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,9
@<lo:FDi:4De!p,ASuT4GAhM4F"SS:BOu'(@3Bc4Eb$;,F!,17FE2;1F^nun+DGpFF!+m6B5_^!
+DG@t@3BZ1+EMXCEb-A%+EM47Ec`FBDIjr,Bl7K)A7]glEbTK7Bl@l3De:,6BOr<1DfTA@%14Nn
$;No?+EMXCEb-A7BQ%p5+EqaEA0>DoF(96)E-,f4DK?6o0H`=tE-67F-ZWX5A8c<44"#&WDId[&
+DG_8AS5Rp+EV%$Ch4t'$4R=r+?1K_F`\`RART(^-T`\aE,]W-ATJu1AS-$,@<-"'D.RU,+EVNE
@<-BsGp$gCASlK9%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:M(_ZDfp)AAKZ8:FWb1&DBO+:ATo8BDfp(C
F*)>@ARlooATM@%BlJ0.Df0V=GA2/4+=Ll6F=AgO$7QDk:-pQUB4Z0-F(fK4F<G.>E,8s#@<?4%
DK?6o0H`=tB4Z0--ZWX5A8c<44""TJ@q[5!$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqIDfTD3A7]jkBl%?k
+CoD#F_t]-FCB9*Df-\-@;[2sAKZ&9DfTE"+CT.u+ED%8EbT*.ARmD9<+oue+EMX9E$/t8@:XF%
@3BT%@;KY!FD55-AU%X#E,9).De:,9DfTA2A8bt#D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?
F`\a:Bk)7!Df0!(Gp$O5A0>u-ASrW$Ble60@<lo:GA2/4+=Lc7F)WQ\%13OO-tI%5E%)oDF!+m6
8l%htF`_>6BlnVQ+<X6t+DGm>FD,5.Df0B:+Eh=:@N]c+@<<W4ATW'8DK?6o@3B&n@<,ddFCfJ8
Ch[s4+=MGIASrW3F^nomF)tr9CagK@DKBo2@:UL!Afu2/AKZ,:F^])/@W-L&A0<:@@lnjBCis;<
%14Nn$;No?+Dbt)A9/kA@q]:gB4Z.+E[`,>DIak<@q]:gB4Z.+E[`,ADe!p,ASuTuFD5Z2+DG_8
D]j.8AKYK*EcP`/F<GOFF<G+.@ruF'DIIR2%17/dEbTK7+=DVHA7TUrF'N?hDImisCg:^nA6`kf
A8G[`F'NNi@V'dmD/a<&0JG46Bkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k<+oue+EMX9E-!.4Ble60
@<lo:FD,5.Ci=3(+CoD#F_t]-F<GC<@:Wq[+DG^9FD,5.E,oN5BlA-8+EMX9E%VS,.1HVZ67sC%
BQ&);Ci=3(+CoD#F_t]-FCB9*Df-!k0H`@uA8-+(+=CZ4@;]^hF*)FM%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[lDfTD3E-68EBl7Q+@;]TuB4Z1,Bl7Q9%14M&F`]&T@;]Tu-td+5.3N&>AKYu8Blmo/Ao)%'
Bjtmi+CT.u+Ceht+EMXCEb-A)DKKT5AKYf-@ps1bF"SRX<+ohcCi<flCh7Z1@ps6t@V$["@;TRd
+E)9CDKTf*ATD?m/e&.:%15is/g,4DG%De<BOr;7@;9^kD..3k.3NGF@ps1b04Sg,F)rI<DBL-F
Dg<N9$7B7sDe*]nCLnk9E-67FH?q_8+Du"&@;9^kD..3k?Qa&8+>aN7%15is/g,1GFE2),G%De<
BOr;7@;9^kD..3k.3NhQEb'56Bl8$2+CT.1-[9l\-Qm5D@ps1b%14J-G^(SYB4Z0-H?p#-%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+B)i[EarcsDJ()(DfQtEDfTB0%15dCCLnW*Df^"CF*)>@@:s-oF*VhKASlK2
8l%htE,ol?Bk1dr+D,%lBl%L*Bk;?.AoD]4F(Jd#@q]RoB-;;0AKYK$DKKH-FE8RCAftf0F!,"%
FCAWeF(Hs5$4R>ABOr<'@;0U%F(Jd#@qZupDf'?"DIal(F!)lADJUaE-tI%%FD5Z2@<-W9DIIBn
+Dbb5FE8l`%14Nn$;No?+Dbb5F<G".C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*@V'1dDJj0+B-;D4
FD)dEA9B7/$>aEtF<Gua+CoA++=C]B-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7KG&CagK:@;[3/ARTUh
BHUo*EZfREEb'5B+EV19FE8uUB6%p5E-!QQF*22=ATJu&DIal,@:O=rF"SRX<+oue+EMX9E$/Y2
ART[lF!,OBD.Oi&Ec6)>F!+n/A0>u-ASrW,BleB;+CT)&+EV:.+D5_5F`;CEDf-\>BOr<*@<?0*
FD,*)+C\npBl5&;Bln#2-V@0&-OgD3%15is/g+YEART[l+EMI<AKYW+Dfp#?%16`gE$-NLFE2)5
B6,F^-Y$guDJ*O%FE/`<$>4Bu+=CuD@ru:'F=0.fCgUUcDe*]nCLpiqBeD4O$4R>;67sBnEc6)>
F!+q'B5)7$Bl7Q+GA2/4+=CuD@j_]m1*A:oA8Z3+-Z!^2-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3=(l#a
+CT;%+EV:.F(HJ+F`))B+CT;'F_t]-F<GIDD.7'sF$C*@6?s\kDg*=LDfm19@<Q3)E,ol+@:F%u
+Du+>Bk(^b+EV:*F<GF/DL!?s:IH=8Df'?"DIdf2FCArr+DG_8AS5Rp+CT;'F_t]-FE9&W+A,Et
+CT;'F_t]-F<G(3A7]g)@<,p%De:,$@<6-m@;Kb*+EV:;AS!!+H#R>9/0Jk?C1Ums+Cf>#ATKCF
DfBf4Df-\-De*F#+CT.u+E;O4Ch[KqATDiE%13OO<+ohcDdmHm@ruc78l%htF*)>@ATJu&DIal1
ATVs,AThX++CT)&+D>2,AKYo#C1Ums+Cf>#ATKIH+B3#c+Dtb8F<G[6@VfTuA8-+(CghU1+A,Et
+E(_(ARfg)@rGmhEt&I*%15is/g*b^6m-DWC1Ums+Cf>#ATJ:f-p/\-+DEGN2CTb"/g*5:-Wa)A
6m,Gt;cFl0;GU:h+B)93<(.p(5snOG+@Jdg<(Tk\5uLi5%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:N1Di
Df-\+DIal0F^]*#Anbgs+Cf>#ATJu8ASbpfF<G"0A0>`-A8,Y$+E)4@Bl@m1/g)99BOuH3@<,p%
@;Ka&Bl8$(B4Z+)/g*W%EZf4;Eb-A-DJ!g-D..O#Df-\+@W-C2+CT;'F_t]-F<G(3A7]g)Eb/Zi
+A,Et-Z^DKDJX$)AKYN%@s)X"DKK</Bl@lA%13OO:2b>!Ci=6-+CT@7F)Po,+Dl%;AKWC3DJUaE
@rH4$@;]Us/e&.:%15is/g)QTEc6)>/0JkMFD5Z2+>Fuj+DkP/@q[!(Eb/isGUXae+Cei$AKYhu
FED)7Et&I3+>G!LDJUFCCaTZ!%15is/g)QZ@:O=r/0JkMFD5Z2+>P&k+DtV)AKYK$DKK<$DK?qA
FE2)5B.4rT+Du*?D.-ppDf[%HATS@g1a"OrA8Z3+-Xh$C%13OO:-pQUD..3k+CQC0@:O=r+CT.u
+EM+&Earc*@:s"_D@Hq0+E2IF+=CT<EbB&54%`F=;Fs\a?X[\fA7%DG:-pQUD0[77D]iq9FD,B+
B-9ehD.-ppD^Pu$%14p71*C+FC`k*6E[M;'%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@gHjF`;CE@;]TuF*22=
ATJ:f8l%htE,ol?Bk1dr+CQC6Bl.g*AKZ2*Gp%3I+D5_5F`8IIDfTB0+CT.u+EV19FE9&W+@.,_
Ec6)>+DGm>@3B&uCi!ZmFD5Z2+E(j78g&=rEb'5D+<WrmF*22=AKY].+CQC&Des6$@ruF'DBNk0
+A*buATMr9F(96)E--.R+<Xg*FWb17ART[l+CT.u+Dl%-BkDW5B6%p5E-!.1DIal2F_Pr/F!,[@
FD)e=BOr;7B6%r?+Eh=:@P/)s.1HVZ67sBjEb/[$AKYD(B6%p5E$0(2+EqaEA9/l;Bln#2DIIBn
F!+q'B5)7$Bl7Q+GA2/4+=CZ4-OgDqEc<-KFCfN8B6%p5E$lbi+FPjbA8Z3+-Y$g;%13OO:-pQU
@rc-hFCcS'+EV19F:AR3+E2IF+=Ci6Ci"$6DfTZ)-T`\1+Bos9-V@0&+EV19FE8R5Eb-@c+EM%5
BlJ08+EV:*F<GU8FEMVA+>Ipb-RT?1%15is/g+YEART[l+CQC7ATMr9F*22=AKWQIDJsW.+DbV$
F<G"4B6A'&DKI"2De*Dg$8Wf;Ec<-KFCfN8F*22=ALAT^+FPjb0d("EC`k)Q%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-!k=`8F*@ps6tCh[s4+EV:.+Cf>-FCf?3F!,C5+D5_5F`;CEDfQtAF_Pr/F!,[@FD)dF
B6%r?%14Nn$;No?+Dbb5F<G(3DKKH-FE8RCAfu2,F*)&8Dfp"AB6%p5E"*.eEc<-KFCfN8B6%p5
E$l)%%15is/g+YBDKKH-FE8RCAfu2,F*)JGBlmo;+Du+>AKZ&:Blmo/@rGmh+DbV$F<G"4B6A'&
DKH<p1E^=NE$-NMATMs7F_Pr/-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgODJ())Ec6)>F!+n/A0>r9
Blmp-%15mKAKYo'+EV:.+DkP$DBN@uG%#91@:s.m+E(j7F*)>@Bl7Q+8g%V^A7ZltDBMPI6m-Yo
/g+RFE,8rsDBO"1EbTK7+DGm>FD,*)+F.mJ+Ceht+DkP$DKK<$DBN@1;b9_S9LU(IATDj+Df-\9
AftM)GAhM4/0K%GF*&rUB6%p5E$0(>+EM[>FCcS'DIal3BOu'(B4YslEaa'$+DkP)Gp#^%Ci<`m
+EM%5BlJ08+EV:*F<G^IAKYMt@ruF'DIIR2+E(_(ARfh'/g*PjFCAWeF(HJ)ATMQuDImj0+Cehr
C`mh5BlbC@Df0,/G%G]8Bl@l3De:,6BOr<.EclJ;/g:`3%16'JAKYT'Ci"$6Bl7Q+Bl8!'Ecc@F
@3BW*DJ*cs+EqaEA0>T(+=M>MGpskKEc6)>F!+n/A0>u-ASrW'ASu("@<?(%+EM%5BlJ08/e&.:
%15is/g+tAAoo/1F`VY=ApGM@@:F%a+Eh=:@LWZ\C3=T>4ZXr5-RL*"+?CoV+FGdc?SR!PBeCSa
-87\5>p*]2+Bp9D%13OO:-pQUF*)>@AKY])+E2IF+Co1rFD5Z2@<-W&$?1-0+=Cu?F`VXP%13OO
:-pQUBl8!'Ec`F<DBNA(C`m\>F<G+.@ruF'DIIR2+D5_5F`;CE%14M3/g)nlEb0E4+=ANc+CSek
B6%r<4s2s8Che*6F=.M)%15is/g+tKDejK7+=M8AG&JfPBl5&.De(J>A7cs.Bln#2-u*[2BOu"!
.1HUn$;No?+D58'ATD4$AKYDtC`m\>F<G+.@ruF'DIIR2+D5_5F`;CE%14d3D/=8?4s58++>P'[
AThu>-OgCl$;No?+DGF1FD,5.Ch74#+CT;'F_t]-F<G:=+D#A'A7]9oFD,5.B6%p5E-!.1Eb-A1
@:WplBl8$2+=M&E@:Uf0F(96)E--.1$;No?+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+AH9SEc6".$<1GTCND$LCh[Zr+E_X6@<?4$B-:huDImisFCeu*F(96)E--.P+Ceht+C\n)
F(oK1Ch[KqARlp-Bln#28l%htD.-ppDf[NR+@.,B:IH=B@:O=r+DGm>@;[2rEaia)Eaa!6+A*bt
@rc:&F<G[=@<<W%@;[2sAKYSrFCSuqA0>;uA0>H.ARfk)ARlp-Bln#2-us/R/e&.:%15is/g,">
@rcK1FD,*)+D58'ATD4$ATJu&Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?%16igA8PabEc4*%+=BoN
/g+e<DImisFCcS'Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?-S.q\/13+oD/=8?4s58++>P'[AThu>
-RU8a-OgCl$;No?+EMXCEb-A1@:O=r+>"^GDe*E%1,0nnASc1(+A,Et+EV:2F!,1<+CQBb+EM%5
BlJ/'$8`lEF`\`RD..3kE-688Ec?(I4#/NPC2[X"@:O=r%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;KZkp
Bl7Q+@3A0<6m->T@rcK1BlbD*+EM76E,9).D..O.ATAo3Afu#2ASu4"B-;;0AKYE#E,ol9EbSs(
AKYMt@ruF'DIIR"ATJu&DIal4F(oN)+=M8I.3L2bEcl7BD.-ppD_;J+.1HVZ67sBmATVEq+CT.u
+D#e/@s)m)+:SZuD'13C@;BFnF`_8:E-!B9$4R>;67sBmATVEq+CT.u+D#e/@s)m)+EM75ASuU+
Gp"[]GA1l0+E).6Gp$X3F)Yr(Gp$[CE,95uBlnVC@rGmh+E)CEE-673$;No?+>G!ZD'13C@;BFn
F`_8:E-!B9$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqI@:O=rF!+n3AKYl/F<GU8F*)G:@ru9m+EVNE8g&1b
EbTK7F"SRX=`8F*@ps6t@;L"'+EMXCEb-@a<)$%;+A?3CAQUK+=A;I?+B1d3<%K.d5uL?D:KL:B
+B;B13$;XIA0=3A<(.pN@rc:&FE8R=DBMPI6m-#S@ruF'DIIR"ATKIH+AZlkGp#^%F(96)E--.D
@ps6t@V$[&F`&=8Dg,c9ATBC4$7QDk:-pQUF*)>@AKXZT<+T/S-o*P,+CT.u+@oI+9HY`=1FXGg
AU&<<%14p7E-67F-Z!45AU#Ra1,:p=/hSb!9OUn3=<M*lA7Zl9/hSL\$4R>!+E2IF+=CiED/:R]
1,D!>+>,9!+@oI+9H[h`A7Zl9/hSL\$4R>;67sC%FDl22+BV?3+CT.u+CT;"BlnB(Ed8d,79EM3
-t7IDATK:Q%14p7E-67F-[9KE-TbF)9OD4CDe*3:-TlK^F*'TfBPDN1BlbD5@;TQuG\q7Z06CcH
F?V&]$4R>;67sBI=]@g4BlbD>DJ=!1ATDa1ATVKo+C]V<ATJu&DIal"@;[3/FDl22+C]&&@<-'n
F!*%WDJsV>Eb/a!D/Ej%A7]9oAoD]4Cgh?sAKYT!Ch7Z?%14p7E-67F-ULC"-Ta(A4*"n@A7&b[
De*2tC2dU'BHS[O@:WneDKB&qASu("@;K1`De**fD..L-ATBD;C1\h&$4R>;67sBiH$!U?F(or3
+E(j7D.-ppD[d%1+>G_rB4Z0--ULC"-OgCl$;No?+DkOsEc3(BAU&;>FEqh:F!+n3AKYK$DKK<)
FE8R=DBO%7AKYhuBl5%c:IH=8CghC+%15^+6W-KP<*s'KDe*3++A>(#79Eo*C2[Wi/0IJ_9h\o&
C2[Wi/0J%h9OD4CDe*3++B1d3<*s'KDe*3++@9417:0J<De*3++AG."912QW:1%FEDe*3++B;B1
3+$*/De*2a$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk@:X(iB-:`!@ruF'DIIR2+CoV3E$043EbTK7%16'Q
+Co&#Df0W<Eaa'$+E)@8ATAnc:IH=;ART\'Eb0;7G@_n7AS#BpF)Po,+EqaEA9/l-DBNk?EZen,
@ruF'DIIR2/g)99BOr<(AU&;>F*(u4+Dbt)A9/kACggd`F_u(MBkh]</e&.:%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-!k9Q+?M+DbIq+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ/H%14Nn$;No?+DG_7F`M%9@rHC.
ARfg)E+*j%%17#a+?MV3FDlFICggd`ATf24@:CT,>9G^EDe't<-OgCl$;No?+Dbt)A0>E*D/^V=
@rc:&F:AR2+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F:2Cggd`F_u(MBkh]:
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k7!3?c+EM%5BlJ08+CoC5DJsV>F*)>@AKZ28Eb$;5AS,LoASu!h
F"SRX<+oig+Dl7BF<G%(+D58'ATD4$ARmD&$7QDk:-pQUF`:l"FCcS=DfTA2Eb/ioEb0,uATJtG
+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(-9`Q#/g,1GG&J`U%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[fCi<ckC`mb0An?!oDI[7!%15^'6m-/OF!,('@qfanFD5<-+D,P4+Cei#Ed;A:B-;,8
F<GXH@<?3n+DtV)AKYE!@;L41BlbD8DBMOoGAhM4F!+n/A0>u*F*)IU%13OO<+ohc-td@7@WNt@
@;]Tu.!9TBF"&5TATD7$+CT.rCjC><+CT.u+EMXCEb-A2@;TQuEb/ioEb0,uATKI5$7QDk:-pQU
@;]LiH$X$EDIIBnEt&IhATT%BA92j$F=.M)%15is/g+Y?@<6L(ApGM:@;TQuF`V+:Bl5&&@<6!&
Ci<flCh4`5DfT@t$8F7XB5DKqF!)i@F*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht+E_X6
@<?''B5DKq@;I'1DfTA2Eb/ioEb0,uATKI5$7QDk:-pQU0Hb(N+EV:.+EqaEA0>B#A7Zl8+EMXC
Eb0;7B5DKq@;I',AS,LoASu!hEt&I1+D5M/@WNY>A92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+
F(KDA+ED%8EbT*.ATJu8FDl22A0>o(An?!oDI[7!/e&.:%15is/g+eCDdm-k+ED%*ATD@"@qB^(
AoD]4-tIC@@<<q-$?^E$F!)i@F*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@V'%fD.Rc2
G%G]>+<krLAS-($+s;)CASrW!Cht5<DfTB0+D>2,AKZ&9DfTE"+ED%*ATD@"@qB^6%14Nn$;No?
+DG_7F`M%9FDlFIBlbD=BOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Zj9P+DbIqA7]p,Cggd#+BosE
+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+F(KDA+Ceht+ED%8F`M@BD..=-+ED%*ATD@"@q?d!
BleB;+CT@7Df0&r/g+,,AKZ&&D.Oi/@<?0*F(Jd#@q[!%ARfC^DJ=0/+DGm>F`V,)+D,P4+ED%8
EbT*.Bl7Q+Eb/ioEb0,uATKI5$7QDk:-pQUB5DKq@;I',AS,LoASu!hF!,C5+EqaEA9/l&AS5^p
DJ=!$+EqOABHS[>-OgDX67sC'F(KD8I4cXQDJUFCD'oc"%15is/g+eCDdm-k+ED%*ATD@"@qB^(
De:,9DfTB0+D#G$Bl7Q+GA2/4+=D4X%176!ATJuB/g)hj1E^4GCaX9O%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[sBOr</F(KD8F`(o3D@HqKE-,f4DBL_i+E(j7.!9TBF"&5PATW'8DK?qBBOr</F(KDEF`(o3
DBNk0+CQC:DfTA@+<XWsAKZ,:ATKGGDJ=$,+DGm>@UX=l@ps1iGp$N<F`(o5F_)\3BleA=@;Ka&
FD,5.GAhM4F!,C=+EV:.+CehrC`mh?AS!!&AftM)GAhM4/e&.:%15is/g,:XATJu:DJ=$,+E(j7
FE_XGGAhM4Et&I40d(U[ATJtU3[\EGCi+*/DK?qAF`)56F(KE(F>,'O$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMG\DImisFD5W*+Dbt)A0>r'EbTK7Et&IK:IH=8@;[3#ASu("@<?''8g%qg@:UL%@rc:&FE8R:
Ec5e;A8,OqBl@ltEd8d?Ec6)>F"SRX<+ohcB4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>
+EV:.+E2IF+Co1rFD5Z2@<-W@F!,O6EbTK7+EM[7A8-'q@ruX0GqKO5.1HVZ67sBnASu("@<?''
Ci<`m+EM%5BlJ/'$>jU#+=D5QDJa<1DC6PL+AP6U+EM[C05YWGDBNt6F(HJ8ATS@g%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%16rgF!+n1E+NotF!,+,DImisFCeu*F(96)E--.DFDi:DBOr;rF`MM6DKI"DF(KA>
F!,OG@<-I4E%Yj>F!,(/Ch4`1D]j.8AU,D.@;[2sAKYf-@:Wq[+DG_(AT23uA7]Y#Cj@.AAfs]A
6nSoU%15jKFCdKUD/=89F(96)E--.D@<,p%@:Wn[A0>u4+Ac')9M%TYC0r*%EZe2$@Vfag?YWpj
AoD]4FD,5.@s)g4ASuT4F`V,7/e&.:%15is/g+tK@:UKnASu("@<?'k+EM%5BlJ/'$>aWhA0<7@
F`)&7Df-p3$4R>P@;Ke!Df0V=1,(F?+<XEG/g+bKCht4B0e"4f@;]TuDIn#7-nm(mD/X?1F!,17
+>PW*2%9m%$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37qHRLEaa'(DJ()5@rc:&FE8RCDBNJ$D..<m%15^'6m,uJ
DBNA(F)N16ASu("@<?''@;]TuCi<`m+EM%5BlJ08+EqOABQ&$8+CfG'@<?4$B-;#/@:UL%@rc:&
FE9&D$7QDk:-pQUCi<`m+C\c#Bk&9,FCB9*F*),+F!,+9Dfp".$>a>t-Xq.=@<?Q<%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k-td+5Ed0#UCi<`mF!+n-C`mh5AKZ28Eb'56@ps1iARlomGp$N<B5)O#DBO.A
Eb$d3$7QDk:-pQUCi<`m+CT)&+EqaEA9/l2AS#BpFDi:BF`&<MA92j$F=@Y+B4Z1*GT\AEF*(i4
-OgCl$4R>;67sBsDdd0!Bl8$2+CT;"BlnB(Ed8dDDe!3lATJ:f:-pQU-ZaB<FDPl*-Qm&5FE2UK
-Y.:?@<<k+$;No?+=B00-Qm&5FE2UK-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM8S@r#drB-;>9
+CT.u+ED%7FDl26DJ()&Bk)7!Df0!(Bk;>p$;+)^+DGm>A79Rg@UX=h+D,P4+A*c#DfTB0/0K"D
EbTK7F!+n/A0>f4BOu3,E,oN"BlA-8+E2@>B6%Et+EV1>FE9&W+AHcqF<G+&FCAWeF(HJ8H#n(=
D0$h5@<Q3)D.R-nF!,(5EZeh"@r#drB-;>9+CT.u+ED%7FDl26DJ()&@<>pe@<6"$+CT.u+A,Et
+CoD%F!+n4+EqC5Cb?hQ<+ohc-u`U)CLek:G%G]'+C\bhCNXT;+E_WG@3B)hFCAWeF(Hs5$7QDk
:-pQUF('6'+CQC%@:O(qE$0(2+EV:.+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W&$?0E`CLeP8FDlFP
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k-u`U)CLek:@rH=#ATJu9BOr;rF`MM6DKI"3Bk)7!Df0!(Gp$^5
Ch7Z1FDi:DBOr;q@:O(qE$04E@Us1nARfh#Ed8d9DIal/Eb/isG\(q=@;Ka&FD,5.Anc'mF!,[@
FD)e*+E_R9EHPh8AThX*+DG_'Eb/[#Bl7Q+@UWb^F`8I@F_tT!E\7e..1HVZ67sBsBleA=E-67F
A8,OqBl@ltEd8d:@:O(qE$/b,Ch7Ys$:7-P;E[&`HTHL++<X'K5u^B^?W0p2?V4*^DdmH(+<XEG
/g,+UF<G+.Eb/a&DfU+4$=mjk+@8@e?XH,f8Q%)e.P>FMAg\]D+<VdL+<VdL+<XEG/g+V3@r$4+
+D,>(ATJ:f%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M(ATMs(.3NYBF*)>@ATJu9BOr<&@<6N5@UWb^F`8I4
Gp%0>Ch7*uBl7Q+@UWb^F`8I8Bl%@%+EqOABHVD1AKYZ#B4tjtF<GOCAS,Y$/e&.:%15is/g,1G
F*)>@AKYetF*&O6@:O(qE"*.pATMs(+=D8LGpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[Bl7Q+@3BW$
EbTK7+CoV3E"*.&E+*6lA18X2Eb/[$ATJu'Bl7@"Gp$R)@r$4+F"SRX=`8F*@ps6t@;L"'+C\bh
CNXS=A8,OqBl@ltEbT*++CT=6A9Da.+EM%5BlJ08/g)9)F_u(?F(96)E--.D@<,p%F(oN)Ch4_]
+EM%5BlJ08+EV:*F<G(%DBND"+E_a:A0>u4+C\bhCNXSI+Cf>/Gp$O5A0>`#EbAr+A8,OqBl@lt
EbT*+/e&.:%15is/g+\ID/^V+Cht59BOr<1DfTB0+E)-?FD,5.E+*j%+CT=6@3BW*DJ*cs+CoV3
E$043EbTK7/e&/0Dg>l9D/_X!+EM47GApu3F'i?jDe*2tD..3k+=ANG$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqSBOu'(G@_n5Ddd0!.!0BQA9Da..3N>BFDi:1+Dtb7+Co1rFD5Z2@<-W9Ddmd!Ecu":BQ&);
FD,5.E+*j%+DGm>@q]:gB4YU++B3#c+Co1rFD5Z2@<-'nF!,.)G%De*AS#a%D.Ra#ARmD&$7QDk
:-pQUDIn#7A8,OqBl@ltEd8*$DIn$&+=D,E@<lg'DC6Q2+>Y-YA0<6I%13OO:-pQUDfB9*%17#a
+=D,E@<lg'DC5l#%15is/g+tK@:UK/FDlG8F_u(H%14d43\V[=+?Op2+EVOIA9Da.%13OO:-pQU
A8,OqBl@ltEd8dADJ!g-D..O#Df-!kA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@^'_@;I'1DfTB0
%166VFWbR?G9CR-G%De;Df'&.Bk1d`+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n\8D]ik-@<-6.
D/XH++ED%%A0=K?6mm$uA8bt#D.RU,@<?4%DBNA*A0>o8DBO%7AKYo5BOu3,8l%htCggdo/g*_t
+F.mJ+D>2,AKYE!Gp%'HDdmNoD0%6NEHPi6FD5Z2F!,CA+Cf>,E,8rsDKKqBE,9)oF(HJ*D..-p
+Dk[4@<<W$@;BFpC1K=b5\FqBBl#D3Df#pj%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49
D%-hH@<,jk+>PW*3"63D%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1
%16igA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is
/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ
67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/
Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!
Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE
+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._
67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5
CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*
DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7
Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a
/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#
DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$
DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)
6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPt
AKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3
FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<
F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]
4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+
DIjq_:IH=>DKBo.DI[5e$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b
+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<
De(4)$4R>;67sC!G%G]7Bk1ct779L=:/aq^73F0)F(KG9-u*71DKB`4AM.P=ALSa5A8-.(EZcqV
F`V+:Ap%p++E1b2BFP;D67sBU8PN#B+CfP7Eb0-1Cj@-l6pjaF;bp(U+DGm>GA1r*Dg-7FDf0B:
+>"^WAS!!-ATD6&-tRKL+:SZH6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Zm
9ke*XDf]i/F<FU_+@C'XAR&_`A7[B)G\&'H%15is/g*SN6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]
>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%15is/g,:XARlom
Gp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDX67sB^84?EF
5tsp63Zoe`Df'&5%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>
-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4
ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuq
F!hD(%15is/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"B
F_Pr/%16NV4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7
F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi
+?V#dDe*o:+CoCC+=LuCA90gg.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]
DIb@/$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EK
AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\f
A7$HA-YdR1F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk
+D#G$/g(T1.1HV,+<V+#:-pQUEb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.l
GWe)11E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj
+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KP
ASu$2%14LlCi"-'Aof(;I4cXTDCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6
Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</I
A7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6
C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImis
FCcS)F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%Qj
C2[Wi+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6
$7QDk%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.
F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D
@<H[1Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t
4ZX]@-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=
E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplL
BP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&
E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`
:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5
FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrK
ATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZ
A8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5
+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#
Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE
+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%
ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e
@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mn
AhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KP
ASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFVi
ATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ
67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6
-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$
3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8
DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+
ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c
$>F*)+C\biEarHbC2[Wi+Ds=p+ED%:D]gDT+CoCC+Dr<BATW'8DD!&CDIb@/$7KdC/orHa,CUae
/itb6+u(3]4YAE2B5DKqF!a'nDETV#/oD+*.1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&Ie
De!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k
4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9
?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!
DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g+_9BlkJ-Df'?"
DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-
+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`
?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"
.1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?
+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*
+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,
><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp
0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#
FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,
FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io
3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p
+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO
:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDfZ?pFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K
:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=
+<XEG/g)VrD..I#A8c[0%16rs4ZZjk4!6:6,$uHS+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,7
06CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V
@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$
ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU
+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBuF_tT!
EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.j
F`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(E
F`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO
:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!
$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9
A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-pp
D]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g*b^6m-Ya
Eaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl
$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?
E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7
Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A
-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH
+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-QlV91E^UH+=ANG$>OKiF`V,7@rH6sBkLm`
CGIV>67sa&De+!3ATD:!DJ!Tq@UX$pF"JsdAU%X#E,9).8l%htF`V,7+Cf>-Anbn#Eaa'(Df-\=
@rc:&F=n"0:-pQB$;No?+B3#gF!)TH@rc:&F<G:=+<Y6?ARfk)ARlomAS,k$AKXT@6m-DWC1Ums
F!)T6Eb-A'Eb/[$ARmD98TYCK:-pQU@ps6t@V$[)F(Jl)FDi:BARo@aBl7K)@;]Tu@s)j7Df'37
AKZ/)EbTH7F!+t/@<6K4DJsZ8F"SS7D[d%K67sBt@;BEs+EV:2F!,O6EbTK7+<Y*&FD5o0+<Y]9
DIIBn+DGp?FDi::De+!3ATD:!DJ!Tq/no'A+CT.u%15is/g+YBE-WR?F=\PYBln#2H#IhG+D#(t
FE8uUFDi:DBOr<'@;0U%C2[W*A8-'q@ruX0GrcBA:-pQB$;No?+F[a0A8c@,>\@VcATD3q>\\1f
%15is/e&._67sB[BOr<(Dfor=+Dbb5FCeu*@V'@oG9C=7AKYW(De'u#@;]UiA79RkF!,(5EZfC6
A7]@eDJ=3,Df.0:$4R>;67sC%D/XQ=E-67F-YdR1F`V,7@rH6sBkK&4C3(M/G\(B-FD5W*+>,9!
-OgCl$;No?+AbHq+ED%%A7]d(Bl5&.De+!4Bl"o%CghC++>"^GF`MM6DKI"BATW$.DJ()+F!,R<
AKYMpAmoguF<G+.Eb/a&DfU+4$;No?+D,P4+EV:.+BN8pA8c[5+Eh=:F(oQ1+E(j76"FnCAKXl^
@:Wqi/g+&'F(KG9AoD]4DffZ(EZe1H7Nc__@:WqiEt&IO67sBW6q1'C5t".>?X[\fA9E!.CgT=d
-UTq":i^JeEa`f-7VQ[MF!)lU3&W3j6"FnCAR%N2Ec5DqF<FIm@:Wqi+@JS%;Is9IATD$A@rcKc
A2>tnAU%c6%13OO:-pQUEb0<'F<F1'F!+:I7Nc__@:Wqi+EVNED..NrBHToC6mm$u:ddbqEb/Zi
ATAnF+CoC5AoD]4-u*71DKB`4AM.P=ALS&q:-pQU:ddcNART+\EaNQg4ZX]^6q1'C5t".>?X[\f
A9E!.CgRVY%15is/g+S=FCfK1@<?4,AKXKVDf^#A@rc:&F<G(3D/`p*Bjtmi+ED%%A7]cj$;No?
+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm7qcg^FD#`5>\A,$Bk;KnB6/61
ATopc/nK9=-OgCl$;No?+Ad)iAn?"'ARlp-ARZckEc6/CATAo-DBN\4A9E!.C`m5(@<6K4/KeS8
AmoguF<FY!DId[0F!*qdEb.^YGT^O2Eb/a&DfU+4$;No?+BMWG0OJ7'De+!4Bl%->3[[9U>YoHZ
B6%Et+@^']ATM*NDgH,6CgeGUBl[csDg5N!Bl[csDg3mGG\&63$4R>;67sBZARfXrA79M(+EqC+
+C]A0GB7>9+DG^9C2[X*FD5P6@r,RpF!*%WA7]@]F_l.B=(uP_Dg-7FA8-'q@ruX0Gmt*U67sB^
='%+`@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>Y/gTATD["F<F"sE,9H5ATD$I79EA[:JsV6
79Du+%13OO:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+
/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%15is/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>
DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q779L=:/aq^7:0J<De+!4Bl%->
3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$>j3eAO9gH
Bk'b26r[`=FE92l:-pQ_D..3k6=FqL@nKNb<+U,mF!,NU/Ken=CLnV\:IH=7@<6-m+EV19F<GX7
EbTK7/e&._67r]S:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?
DfTB"Eb/c(8l%ht@UX=l@grc?67sC&ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)
+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.%15is/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL
+=Joe3\r3-FCfN8+D,P4ASGdpF"Rn/:-pQB$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("
@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/Ci:-pQU-r`W6<'sG]:/iYp+<XWpF*)IG
@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h.3N2H@qB4^F!,R<AISuA67sBuF_tT!EZf:4+EV19
FE8R=DBO%7AKWC9De*<cF(o-+ATMs7.3N\SBlmo=%15is/e&._67sBhF)uJ@ATKmA$;No?+<Vd9
$;No?+<Vd].3Lo!@rH6sBkMR/ARloU+Co2,ARfh#Ed8dV8l%iS78m.p$;No?%15is/g,=KEaiI!
Bl,mRFDi:EF(HJ)D`S=7:-pQB$;No?+<Ve%67sBnASu("@<?''F(96)E-)Nr:-pQU+<YT5+?MV3
C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$;No?+<VeID'13C@;BF@@<6-m8l%iSATMs7-OgDX
67sAi$;No?+<Ve%67sC$F`&=9F:ARP67sB'+=Joe3\i-,4DJhDFD)dEIS*C(<(0_b01')gBk'b2
6r[`=FE9'KC3(a3$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JPG"F_i`l%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%16oi@:UK.C2[X)ATMs)E[M;'D..3k
;f-GgAP,`d<+U,mF##IF67sa)@;BFQD/X3$8l%iSATMs7+EK+d+DkP&AKXT@6m-PfDeio,FCfN8
+EM%5BlJ/H$;No?$;No?+B3#gF!,O6EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9
+E):2ATD?m+A,Et+EMC<CLmiJ67sC&ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)
+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.$;No?+=L]-F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C
-nlf*1FXGgATMr9AoD^$BkM=)/db??/db??/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$
A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9Ch7-"+C]U':-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%
+ED%4ART[lA0>Su+<W(378m/Q:K:.h.3N2H@qB4^F!,R<AI;1!/g,%SD.7's+E(j7FCfN8F!,17
+EV:.+=LuCA92U+CLqU!F*)IP+EM[>FCd'3:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+Eh=:@UX@m
D)r#!67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JPG"F_i`l$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O]$=e!aF`MM6DKI!K@UX=h-OO[.@:UK.C2[X)ATMs)E[M32@;]dkATMs.De(UX:-pQUD..<r
An?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc
0J5@<3B8u?/KeS8FtIDU%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0
Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi
/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`
F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*
C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3
/p)>[%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`
F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16ig
A8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<
%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht
-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["
Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'
$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO
8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et
+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:Wne
DBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTu
FD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*Bj
F!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.
:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>
F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8
FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*
DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#
+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj
/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-)
;H$._:-CW\-SR/5/ibpL-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q
3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_
F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!
3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et
+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`
AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_
FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].
+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'
1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(
Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibpM+>"^HATfY>-OgDP:J=/F;E[&gB4YslEa`c;C2[X(
Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4C
C3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pf
ATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKn
Ch\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+
D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P
+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0
@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!
A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=H
H#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:
A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0r
ATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XG
G@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1
AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQ
C2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e
$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et
+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+C
ARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'
F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-
DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$3            ~>
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
zz=:zz,'eadnoun readobid regd remast restd rv saveobid second tc trimnl tsl'
zz=:zz,'ash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '' joddo'
zz=:zz,'b BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS'
zz=:zz,' DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR206 '
zz=:zz,'ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 OK201 REFCN'
zz=:zz,' REFIX REFTS TEMPFX backnum copydirinv copyfile copyfiles createdl '
zz=:zz,'dbakf dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropbakdi'
zz=:zz,'r dropdir dropinv dropnc dropref gettstamps justdrvpath libstatus l'
zz=:zz,'oadbakdir loaddir loadnc loadref loadstamps maxback movefile nummas'
zz=:zz,'k packdict packspace puttstamps renamefiles restdict restspace save'
zz=:zz,'dir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake DUMP'
zz=:zz,'MSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR0151 ER'
zz=:zz,'R0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR01'
zz=:zz,'60 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK01'
zz=:zz,'50 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH W'
zz=:zz,'RAPTMPWID btclfrcl clearso clfrbtcl createmk dec85 dumpdictdoc dump'
zz=:zz,'doc dumpgs dumpheader dumpntstamps dumptext dumptm dumptrailer dump'
zz=:zz,'words extscopes fap fmtdumptext fromascii85 getallts getascii85 hal'
zz=:zz,'fbits htclip jnb jscript jscriptdefs makedump makegs masknb namecat'
zz=:zz,'s nlfrrle nounlrep opaqnames parsecode putallts rlefrnl sexpin sonl'
zz=:zz,' tabit toascii85 uqtsingle wraplinear wrdglobals writeijs wttext''),'
zz=:zz,'(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPL'
zz=:zz,'AIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ER'
zz=:zz,'R050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059'
zz=:zz,' ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR'
zz=:zz,'069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 '
zz=:zz,'ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR0'
zz=:zz,'89 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 E'
zz=:zz,'RR099 ERR100 ERR101 ERR102 ERR103 INVGROUPS INVMACROS INVSUITES INV'
zz=:zz,'TESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 OK056 OK05'
zz=:zz,'7 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT READSTATS'
zz=:zz,' afterlaststr allnlctn allnlpfx allnlsfx apptable appwords badcn bn'
zz=:zz,'lsearch bnums checkntstamp checkopen checkpath checkput closedict c'
zz=:zz,'reatest defwords delstuff delwordrefs didstats dnlsearch freedisk f'
zz=:zz,'reedisklinux freediskmac freediskwin fullmonty getdicdoc getdocumen'
zz=:zz,'t getexplain getgstext getntstamp getobjects getrefs gslistnl input'
zz=:zz,'dict invappend invdelete invfetch invreplace islib iswriteable iswr'
zz=:zz,'iteablelinux iswriteablewin jdatcreate jwordscreate loadalldirs loa'
zz=:zz,'dallrefs loadwords mainddir newdparms newregdict nlctn nlpfx nlsfx '
zz=:zz,'nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc putexp'
zz=:zz,'lain putgs putntstamp puttable puttexts putwords putwordxrs rpdtrim'
zz=:zz,' rplctable rplcwords sortdnub''),(<<;._1 '' jodtools AGEHEADER CR DOC'
zz=:zz,'UMENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR00404 ERR00405 ERR'
zz=:zz,'00406 ERR00407 ERR00408 GROUPSUITES IzJODtools JODLOADEND JODLOADST'
zz=:zz,'ART JODTOOLSVMD LF OK00400 OK00401 OK00402 OK00403 OK00404 OK00405 '
zz=:zz,'OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 WORDTESTS addgrp addload'
zz=:zz,'script addloadscript1 allnames allrefs betweenidx createjodtools da'
zz=:zz,'yage delgrp firstcomment firstperiod fsen getrx hlpnl jodage lg loc'
zz=:zz,'grp mls noexp notgrp nt nw obnames onlycomments pr refnames revonex'
zz=:zz,' today todayno updatepublic usedby yyyymondd''),<<;._1 '' jodutil ASS'
zz=:zz,'UMESMARK AUTHORMARK CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK EDCO'
zz=:zz,'NSOLE EDTEMP ERR0250 ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR025'
zz=:zz,'6 ERR0260 ERR0261 ERR0262 IzJODutinterface MONADMARK NAMEALPHA OBFU'
zz=:zz,'SCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251 OK0252 OK0255 OK0256 PDF PD'
zz=:zz,'FREADER PDFREADERMAC ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaf'
zz=:zz,'t changetok compclut compj compressj createut ctit de dewhitejcr de'
zz=:zz,'whitejscript disp doc docct2 docfmt2 doctext docword ed et exobrefs'
zz=:zz,' gt jodfork jodhelp ljust obtext pdfreader qt reb revo rm rtt textf'
zz=:zz,'orm2''                                                              '
zz=:6035{.zz
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
0K1+C;Go5'1E]4W5t".>+A$lO:IJo7FCfK)@:Njk8U=!)6tpO\ATDBk@qAS<5u'g6;FDX!H:gt$
FDl)6F!+&#8l%itFD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r:IJ5X6m,*#:JN$,5snOG<*<$d+AGF0
779pP78b7(6:OsR6U=[?+AY<n<Du7P:/i?36:OsR6Vp6S+Ac3?85Du';c-42<(0_b=[>bV78b7;
B4Z0-@W$!)@W$"'ARTUhBHUc,Bl%<pDe*?rD/aN,F)to'+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'
+Cf(r@r#t(FCAW7+Cf>,E,oN2F(uh-Eb/[$ASQ-o+CnqiCM"]"An,XqF(HJ)E-#T4+CoV3E+ifk
A7]d(ARlopF<G4-FDc2AFCB$*+DPh*Df-\6B-;#/@:WhUCLh."+Dbt)A7TCp+Dbt)A8Ym"Ci<`m
Eb/i*Ci<`mF*(i-E-!.<Ddd1#DfTB0+Dkq9+Dl"4+DtV)ARf.jF!,@=F`)#9AT/c1@WZ1+F<GL4
+E2IF@;Kb%F!,FEFD>l8DBNn@FDuLJE-68DEGQb<ASbpdF(K*)A0>o0+EDRG+EM+9@WcC$A7TCp
F!,R9F*(u2G%ku8DJ`s&F<G^FA79RkC2[WnBleB:Bju4,Bl@l3F`:l"FCf3*A8PamBkCptF<G^F
A79RkC2[X(Dfp)1ARoq#E-!BU/1<VC4"akp+=A:@DJVXJF(o,<0d'qCCf>1hCLo1R+Cf>,E,&<g
Deio<0HakDD/a5gD/X3$0JO\[Eb/[$ATVL)FC])qFD5Z2@<-'nF!,")CdMQOBk&hN0d("<F*)G@
H$!V=FC])qFD5Z2@<-'nF!,"-A5d>`CLo1R+Co2-E)UUlCLpL`Bk)'lAM>e\A8Z3^D/X3$0JFV[
DJW6gDeioY@:O=r<+U;rF!,"4F(KG[@<6-m0JO\]A5d>`CLo1R+D5M/@WOkEF(o,<0JO\_Ci<d(
;f-GgAO1BYBkM<;0JFV^Ci<d(;f-GgAOLHH0JFV^Ec=roDeio<0Hb"KE,9616=FqL@k]V[C2[Wk
B4Y"YDeioP@<loJ0Hb1M@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',ZCi<`mA9Da.;f-GgAM>e\
Ci<`mFCfN80JG4lBk)7!Df0!(Gp$pA@:XIkF*')i11Y*/FD5Z2@<-W9Ci<`mFCfN80JG:nBk)7!
Df0!(Gp$pA@:XIkF*')i1h:<1FD5Z2@<-W9D/O/gD/X3$6#pUZ0JFVeATqZ`D/X3$6=FCjEbBN3
ASuU20JFVfA5d>`CLoePB1?<DCbROcE-67t@;TRTBl.F&FCB$*F$a;VBk&hN+ED%7FC[^HF(o,<
0d(RLF*)JFF^c^I/1<VC4"akp+=A:@F_PZ&C2[W*C2[W*C2[WnDdji(De*]nCLnW'De*p2DfTD3
C2[X)Df9H5+DPh*F`_>6-RgSp4?P\X?SNZN+DPh*@UX=l@ru:'FE8R>De*?uF`V5<ATMs7+DPh*
AU&<.DKBN1DKKH2FE8R>De*ZmEbAs*ATMs7+DPh*E,oN/@<,q$ATMs7+DPh*E-626ATVL)FE8R>
De*p+Deip+ATMs7+DPh*F*)G6F)uG7F*)IGCi<`mCgh?sAS,L^F(o*"ARf.iALAoX-p0UR/mg=U
-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,<@WQ+$G%G2QEcQ)=F!+q7Bl%<p
De*BmF*)G:@Wcd,Df-\,F_PZ&C2[WsC3(M,F_PZ&C2[X*DJ=28BPDO0DfU,<De'u(BleB7Ed;D<
A7TUg+DPh*@V'V&+DPh*A9Da.+DPh*Bl8$5D]ie5A8lR-Anc'm+DPh*F`V,7@rH6sBkLm`CERJ&
CLoh@F(o,V:IJ/nF*)IGD..3k;f-GgAP,`d<+U,mF!,=.DJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUg
F_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*AJ2,Vh&.2)%!D1G1RE1GCLA2)RB:1,(FA0KCmK
/iYXB1cI*C1,^710JPO@2)70E2)-dC1bgsD2BXb/0fUjE1-$sE0ebRA3&r]M+>PW*3&!3F0ePF>
1cI*J1b^^.1,(F?0K:aB/i5IG1,gsB2_cF10JPF=2_m?F2Dm?O3&NTO3?U(20f:XD0JY7=1H.'D
1cRBK+>PW*2)$sE1bL[D3ANTP3AWZ<1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_[!>2D[9I0f1jJ
1*A>+0fUjE1-$sC3&!$G1H.6K+>PW*3&!3F3A**I0JGIB2`EN81,(FB0K([B/i5ID1cI-F3ADX3
0JPF=2_m?F2E*WU1b^mF1E\G,0fUjE1,COC0fLdD3&<EM+>PW*2)$sD2_HmG0fV-M0fLs41,(F?
0K1^F/i57?3&3<I1,0n,0JPF=2_d6D1H7*L3A`EK1*A>+0fUjF1,CO>2Dm<M0f(gE+>PW*3&!6G
1G1LB2)I6H1H@041,(F?0K1aA/i,CB1,q0H1cHO40JPF=2_m3B2DR$B2)dNO3?U(20f:XE0K(O?
2E*<J2).$H+>PW*2)%!D1G1L?1,(XG3A`H51,(FA0JbC=/iPXE1,(^E1,pC30JPL?1GCU;2`3EI
3B/uS1*A>+0f:XD1-$sC2`3TN3A<?G+>PW*2)$sD2_HmG2)@6N1-%<:1,(F?0K1aC/i5LB1GpsD
2)HF20JPF=3&!-@1bppE2D[3G3?U(20fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD2DR05
1,(FA0KCmK/iYXB1cI*D2)?@10JPF=2_m?F1H.!C1Gq0I1E\G,0fC^A0f1L>1c70M3B8cP+>PW*
2)$sC2D-gC2)@6J3AiN61,(FB0JkIB/i5ID0K:dA3&)O20JPF=2_d6D1c70O2E<KL2]sk00fLdD
0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==1c-sG1,^710JPL?2)-s@
2)$gC1bpsE2BXb/0fLdD0f:R@1,M!I2D[6M+>PW*2_[*D2(ga?1GgpD2DR051,(FB0JtU?/iYOA
0JbXH2)?@10JPO@2D?m=1c[EK1,_-K2'=Y.0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD
2DR051,(F?0K1aH/iGRG1c$mD2`Mp80JPF=3&!-@1H.0L0f1UE3?U(20f:XD0JY7=1c$sE1GC^H
+>PW*3&!6G1G1LC2DR3J3AEN:1,(FB0K([B/i5LG1c$g?1H?R50JPO@2DR'@1cI<P1c.$H2BXb/
0fLdB0Jb=?2)I*K1GUXB+>PW*2)$sD2_HsC2`WcR0K:110JPF=2_d6D2)7*J1H@9L1a"P-0fLdB
0f1LB3&*?J2_m-C+>PW*3&!3F1bL^F3&WQI2D[-31,(FA0JbF?/iYgF2D[*F2Du[50JPL?1GCU;
2`3EL1c%$G2BXb/0fLdB0Jb=?2)I3K3&<EM+>PW*2)%!D1G1RE1GCLA2)RB:1,(FA0KCmK/iYXB
1cI*C1,^710JPO@2)?p=2`3NL3&EKP1*A>+0fUjE1GCF?2)d9M1c76J+>PW*3&!3F0ePF>1cI*J
1b^^.1,(F?0K:aB/iG[E2)@6J2E;m80JPF=2_m?F2Dm?O3&NTO3?U(20fUjH1-$sG1GLa@2E*<F
+>PW*3&!6E1+kF<3&`fU0JYL.1,(FB0K:gJ/iPR@2)$pI0JXb+0JPO@3&3KH2`!0G0K(jD1*A>+
0fUjH1-$sG1GLaA2_[3J+>PW*3&!<I3A*6H0f:XD0K1+00JPO@2DR'@1c@3J2_d*K0d&5*0f:XD
1,pmE2`WiS0K:jE+>PW*3&!3F1G1[B2_[*K1Gq'51,(F?0K1^F/i,IA3&icM2`2^50JPF=2_d6D
1b^gI1,LgC0d&5*0f:XD0fL^@3&*ER1b^jD+>PW*3&!6G1G1LB2)I6H1H@041,(FB0K([B/i5ID
1cI-F3ADX30JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,pmE2)[6L1Gq!E+>PW*2)%!D2D-pB1Gh!D
0f(d31,(F?0K:aE/i5LE2)@6I0eje+0JPL?1GL^=3&rcO3A`HH1E\G,0fLdB0f1LC0ekF?1,CgD
+>PW*2)$sE3A*-G2D[$F1b^[-1,(FA0JYCB/iYaF1c@6L1,g=20JPF=2_m0A1cI0G2)@!F1a"P-
0f:XE0et@>0fC^>0JG:>+>PW*2_[*D2D-pI1bppC3&;[40JPL?2).!A2`EQK0fV$K1E\G,0fLdH
1-$sH1GUdG0JYLA+>PW*2)$sE3A*-G2Dd3D3&<B61,(FB0K1[G/iPaH2)R9M2)?@10JPF=2_[-B
1c.'G3ANTP0d&5*0fUjD0K1U@2E<KL2E<TM+>PW*2)$sD2_HpE2E<ZU0f:m41,(FA0JtRC/iP^G
0fUjC1,C%.0JPL?2).!A2`EQP1c$sB1a"P-0fLdD0fCXC2`39K2_m9M+>PW*2_[*D2D-pI2)@-L
3B/o>1,(FA0JtRC/iP^H2E!<G2E;m80JPL?2).!A2`EWO3&!3G1E\G,0fUjE1,1C@0JtUG2`WTM
+>PW*3&!6E1+kF=1H.9I2DlU40JPO@2)7!@2`<WR1GLdD1E\G,0fLdD0fCXC3&<6K0fM'K+>PW*
2)$sE3%d*H2`*<G1cIB:1,(F?0K:d@/i,ID1,UsH2_cF10JPF>0JG@:2*!?M1bq!H1*A>+0fUjF
1,CO>2`<EM1c[9N+>PW*3&!6G1G1LC2`*<E0f(g41,(FB0K([B/i5LF3&EHK2)ZR40JPL?1GL^=
3A<-I1,(X@3$9t10f:XD1,1C<2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*41,(FA0JbF?/ibX?
1,^mB0K:110JPO@2)7!@2`<WR1GLdD1E\G,0fLdB0f1LC0fM'K3B/oO+>PW*2_[$A1G1UE2`!0K
0f^s21,(FA0JbF?/ibXB3&`fN2)cs8-p07-1GU420JPO@2)7!@2`E`U2_m6M+>PW*2)$sF0eP@A
1bgsH1,Cj31,(F?0K1^F/i5@>3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0fLdE1,(==2`*?H
2)I0H+>PW*3&!3F1bLaA0f_0H1,Ld01,(FA0K([?/iGXF1,q3J1c6C20JPF=2_[6E2)?pG2)@!J
3$9t10fUjE1GLL@2DR-D1,q$F+>PW*2)$sE0J5:A1G_$N2Dd<71,(FB0JtX@/iP[D2)$dF1,C%.
0JPO@2)6m=3&!6M1Gh!M3$9t10f:XD1-$sD2`<KJ3B8iL+>PW*3&!3F1G1XH2)[<G0f(g41,(FA
0JtRB/i>@C1,1dG1Gg400JPO@2)7!@2`<WR1GLjC2'=Y.0fUjE1,COA2`WfR3&*3K+>PW*3&!3F
1bLaA2)mBL0ebI-1,(FB0JtX@/iP[D2)$dF1,C%.0JPF=3&!6C2)R3M2_d9M2'=Y.0f:XE0K(OA
2E!HI2`*BK+>PW*2)-d=2(gd@2`EZR0K(a11,(FA0K([?/iGXF2Dd6E3B/-:0JPO@2)?s>2`EQR
1GLgF2]sk00fUjE1GLL@3&ioU1,1R>+>PW*3&!3G0ePCF1c.3H1GU^.1,(FB0K(U?/i>C<3&EQP
0f:(/0JPO@2)?s>2`<EK0JYUC1E\G,0fUjE1GLL@2DR-D1,q$F+>PW*3&!3F1bLaA2`W`M2)707
1,(FB0JtUA/iP^L2`*KK1H6L40JPO@2)6s?3&i]K3&rZN1a"P-0fUjE1,LUB3AENO2_[-F+>PW*
2)%!D2_I$C2DdBP0JbX11,(FB0JtUA/iPaK2)m?N1cQU50JPO@2)6s?2`NcW2)[ES3?U(20fUjE
1GCF?2Dm?N3B8lM+>PW*3&!3F1bLaA0f_0H1,Ld01,(FB0JtX?/iPXH1,q*N1c$700JPO@2)6s?
2`WQG0f:[G3$9t10fUjE1GLL@2DR-D1,q$F+>PW*3&!3F1G1XG3&<EP2)m?61,(FB0JtX@/iP[D
2)$dF1,C%.0JPO@2)7!@3&!-J1cI6K1a"P-0fUjE1,COB2`WiS0f([D+>PW*3&!3F1G1XI0K1^B
1cR961,(FB0JtUB/iP[J2D['I0Jst.0JPO@2)7!@2`<WR1GLjC2'=Y.0fUjE1,COB3&!?P0ekC*
1,(FB0JtUB/iYOB3&<EH0Jst.0JPO@2)?s>2`<EK0JYUC1E\G,0fUjE1,LUB2E3TN0fUjE+>PW*
3&!3F1bL^I2_m?L0JYX21,(FB0JtUD/iPU@1,LdD3Ahp70JPO@2)?s>2`NWJ1c%*I+>PW*3&!3G
0ePCF2`3NJ1,0n,0JPO@2)?s>2`WfN1,M!N3$9t10fUjE1GLL@3A`QQ0JbI>+>PW*3&!6E1+kF>
2D@!K2)I<91,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)?s>2`<EK0JYUC1E\G,0fUjE1,LUC0eb@C
0JtXC+>PW*3&!3G0J5:A2_m?L3A`N71,(FB0JtX@/iP[D2)$dF1,C@1-p07-2^C.40fLdB0Jb=?
2)I<R0fD$I+>PW*2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA1-%*M2)-4/0JPF=2_[-B1c@0E
0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K1Gq*61,(F?0K1[D/i5IF0f^sB
2`Mp80JPL?1GL^=3&iZK0fCa@0d&5*0fUjF1,CO>2_m0D1,LdB+>PW*2)%!D1G1L>2DR0G1H7-4
1,(FB0JtUA/ib^B0fCaG0K(%/0JPF=3&!-@1c@<L2D[9P2'=Y.0f:XD0K(O?2E!6I3&<EN+>PW*
3&!3F1G1[C2_d<L0KD$?/1<V9+?:]&0JPF=2_[6E1c73H3&<?J2]sk00f:XD0KCaB2)I-D1-%-M
+>PW*3&!3F2D-pB2DR!C3B&'90JPF=2_[6E1c7*D3A``V3?U(20fUjE1,LUB2`*9G3&i]L+>PW*
3&!3G0J5:B0f:XF3&`W91,(F?0K1[G/i5FA3AWNO2)HF20JPF=2_[6E1c7*F0KCgF1E\G,0fUjE
1GLL@2_m*E2E3WO+>PW*3&!3F2D-pD0K1dD3B8l<1,(F?0K1[G/i5FB1b^[F1H6L40JPO@2)7'B
2_[0F2D?mE3$9t10f:XD0KCaB2)I!I1c[QV+>PW*3&!3G0ePCF3&<NO2E*B61,(FB0JtX?/iP[C
2_d6O0fC.00JPO@2)?s>2`<EK0JbC:3?U(20f:XD0KCaB2)I'B3A<?I+>PW*3&!3G0ePCD1,1aK
2DR6@/1<V9+>Gi$1,(F?0K1[@/iGLE1,:X>3ADX30JPF=2_[!>2D[9I1,LdI3?U(20fLdD0et@=
3AriW1,1^E+>PW*2_[$A1G1UF1cRHN1Gq'51,(F?0K1aA/iG[D1c%'L2`W!90JPO@2)6s?2`E`U
1cR9F3?U(20fLdD0f:R@1,h0N1b^d01,(F?0K1[A/ibpN2DR!@2)6:00JPO@1GCU;1c.0N0fUjI
+>PW*3&!-B1G1L@3&WKF1H@<81,(FB0JbC=/i5CA2DHp?3B83;0JPO@2)70E2)7*N2`E`W3?U(2
0fLd@0KCaF3&iZP2E!?I+>PW*2)$sD0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g70JPF=
2_[!>2D[9I0f1mM3$9t10f:XD0JY7=1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPO@3&3KH
2`!0G0fD$G3?U(20fUjH1-$sG1GLaA3&ioQ+>PW*2_[*D1+kFE3AWHF2)-g.1,(FB0JtUD/iPL@
2*!WO0K1+00JPF=2_m*?2E3EN3&3BL+>PW*3&!3G0J5:B1,(OE2)?s01,(FB0K1[G/iPdM3&<6G
0KC720JPO@2)7-D1bggB0f1X@1a"P-0fUjC0Jb=<1cREK3&!?81,(FB0JbC=/i5CE2DHmA3Ahp7
0JPO@1GCU;1c.0O1,:^C2BXb/0fUjE1GCF?2)d9M2)?p@+>PW*2_[!B2(gaE2`*3F1H%$31,(F?
0K1^?/i5@<1,(OC1bg+.0JPF=2_d!=1bgmG0JbOF2'=Y.0fUjH1-$sG1GLa@2E3ZU+>PW*3&!<I
3A*6H0f:XC3&il?1,(FB0K:gJ/iPR@2)$pJ3&i?<-p014/1<V7.4cl00I\P$4>8384>6      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
