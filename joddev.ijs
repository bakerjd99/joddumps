NB. JOD dictionary dump: 31 May 2018 19:17:01
NB. Generated with JOD version; 0.9.996 - dev; 15; 31 May 2018 19:16:03
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
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

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.996 - dev';15;'31 May 2018 19:16:03'

JODVMD=:'0.9.996 - dev';15;'31 May 2018 19:16:03'

MACROTYPE=:21+i.8

MIXEDOVER=:'(<:)=:'

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

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
  elseif. IFJHS *. wex <'wwd_qjide_' do. 0 0$(1!:2&2) '$$$edit$$$',file  NB. qjide
  elseif. IFJHS do. open_jhs_ file  NB. JHS ide 

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
1,q692)?@1+?1K"2BY"&2Du[41E\G4+>t>t2]sh3+>u"u1,9t-2]sh/+>Yer0fC.01E\D,+>Y_p
2BXb1+?:Q'1E\\#1-$I;+>Y_p3?U1>+?:Q#2'=V-+>Ybq1a"V0+>Y,t1*AS"2`;d53$:%9+>P_q
2)QL20d&;/+?:Q&0d&J!1GL"0+>Ybq2]sk1+>k8s2'=V-+>khq1*A>.+>P'"+>GPm1bp12+>kqt
1*A>.+>GPm1c6C7+>bhr2BXn8+?(E#0H`)(+>Y_p3?U.6+>Y,p2BXt%1H?R;+>ttt2BXe3+>P&p
3?U:(1H$@10H`,-+>P&p0H`.o0f^@21*AA0+>G_r1cQU50d&8.+>Get1c$700H`/26rcrX9iFP=
8g&:gEcYr5DBO%7@<<W%Eb/[$ARlp*BPDN1A9Da.Anc'm779L=:/aq^7<E*cF<G.*Bln96+EVNE
F`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9C1D1"F)Pl++E)-?=(uP_Dg-7FF*VhKASlKW6pjaF;bp(U
?VXEoDJsW.E+*9-.kYCXAKXE06VgHU:J=2"E+*j%84>g478dc=Dfp"A@;]TuF*22=AKYYt@:Wqi
+Cf>#AP%2?:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ
+EM+9+=M;BFD>`)Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@
6m-2]FCfK)@:Nk?H:gt$FDl)6F%T4r<)6:`;]mK&C2[W3+DG_8ATDBk@q?d,DfTB0+<X7%8l%it
FD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1
/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'T5snOG<*<$dD.-ppD]j.5
G]Y'MH#R>9/0JJ7E+NotF#kF9;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM6r-lZ
/6,Y=3))tH779pP78du:G\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAfX6:OsR6U=[?Ddm=$F(8X#
AKYf-@ps0rBk1dmFD5?$ATDi7FCAfX6:OsR6UOUJDIIBn+E(_$F`V&$FD5Z2+Dbb/BlkIL+D>J%
BOu3,G%#30ATJu1ATMo8Ch[ZrCj@.FD]iP+@<6*X6:OsR6Vp6SDdm=$F(8X#Bl@l3Ci<flC`mG&
ASuU(Anbgs+E2@4AncKh78m/g5tt'B;KQJkF<GF3F)tc&AKZ&<Blmiu+>"]j+E)-?0Hb:GAn#Ca
FE1r7EbT*.ATJu4@VTIaFE8R:Ec5e;A8,OqBl@ltEd8d:@:O(qE-#K+Ci!g,F<GL2C1UmsF!,17
+E2IF+Co1rFD5Z2@<-W9A79Rg@UX=h+C\bhCNXS=Anc'mF(0$'F(Jd#@q]pp@<,jkATJu5F`\a:
Bk)7!Df0!(Gp$R)@r$4++DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7
DKB90Bl%<pDe*?rD/aN,F)to'@WcC$A9/l%+D,b4Cj@.5Df'H6ATMp(A0=K?6m-;a@:UL&ATMr9
F(96)E-,Q3Bl%<pDe*s.DesK)Df'H6ATMp(A7B[qCh.T0@rH4'Eb0<5ARlp,ATDj+Df-\9Afu2/
AKXT@6m-SiDesJ;@r,RpF!,O6EbTK7@q]F`CMn69@:D$&BOt[hF!+n-C`mh5Eb/f)-uNI1ALq%q
CghC+>qC)/G]YAWFCAWpATM@"D/aN,F)u):ASl@/ATJu&Cht5<BPDR"+EML1@q?cpEc5e;8g&=r
Eb'56@;]TuF(fK4FCf?2+Dbt+@;I'(@;TRs@rc-hFCf3*A7TCaFD5Z2@<-W9DdmHm@rri'Eb/[$
Bl@l3G%G]'A7At_AnH1%Cj@.CF^]*#Anbge+C\bhCNXS=Anc'm+E1b2BOk^bCi=B+@r-()AKYMt
@ruF'DIIR2+D,>(ARob$ATW!)F<G+.@ruF'DIIR2+E1b0@;TRtATDj&F_u)2ART+\Eas-$@<?(%
+EV:.+CoV3E+Wg#AKYE!A0?):Blmp-+D>=pA7]d(Bl7O$Ec#6,Bl@m#A7]:cF<G+.@ruF'DIIR2
+E(_(ARfh'ATVKoBlkJ>AU&<0ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF
+EV=7ATMs%D/aQ2De*d(FEMVA+A,Et+E)-?Eb0<7Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QK
DffZ(Ed)5=ASc!r@;BEs@;]TuCi<`m+A,Et+D5_5F`;/8@:WhUCLh."Ci<`mF!+t2D/a<&FCcS8
AT;j(F*(u(+C\bhCNXS=A8-'q@ruX0Gp"M\.;Wp2A7TCpCi<`mF!,R<AKYK$D/a<&FCcS8AT;j(
F*(u(+Co2,ARfh#Ed8cUGq!QJ@:X7cCi<`m+DtV)AKYK!@<6K4AoD]4.![6a;IsolCige6F!*.Z
AoD]4F*1u&ATMo8@;]Tu0d((HEZet&Bl%p4ASc9nA9)6nCi<`mF!,[FEb$;$DIal3ATMr9Eb/io
Eb0,uAKYf'F*)IGAo_g,+E_a:F!,(/Ch7F$@:XG$@;Tt)Ci<`mF!,"-Eb/a&DfU+GFD5T'+EMX5
D/aP=.![7XDdd1#DfTB0Ci<`mF!,"-@ruF'DIIR2+EqaEA9/l-DKKe>FCB3&ATT&2De!3lATM^)
F)>?$AKYf-@:UL%@rc:&FDbN(ARf.jF(KT<Ea`I"F!+n/A0>Au@<6L(Anbgt+DtV)ATJu.DBMOo
@rGmhDJsZ8CiX*+@rH7.ATDm6+Du+?DK?qAFDl22A0><%+C]&&@<-W9FDi:<Bl7KjEZfI8G]Y'K
AT2[$F(K62@<?4%DKB`*FCf]=@<6L$D.7<mF!+n/A0>o(FEMVAF!,C1C1Ums+EV1>FDk].E+Np.
+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+E-682Ci"37E-68D+CT)&+EV=7ATMs%D/aP=/Kf+GAKWC6
ATV?sCij_IEb0&u@<6!pDe*HoDII?(8l%htEb03+ARTXk+EMX9E-$&:Ecl8@+A*bn@:O=r+EM%5
BlJ08EccDDF`)7C8g&4eF*&OG@rc:&FE;M7FCKB,Ch.'jEcZ;5FE8RD@<?1(+E_a:A0>?,+A,Et
+C]J-Ch+Z4DfTB0FCfN8ASu[*Ec5i4ASuU2ATVu9F`8IFBOr;7BkhQs.3NGF@ps1b+D,P4+EDUB
DJ=!$+EV19F<G(%F(KE8E+EC!ASQ-oA8-+,EbT!*FD5Z2F`:l"FCfM9Anc'mF!,17+A,Et+Co2-
FE2))F`_>9DKTo/@<?'qDe*]nDJ<]oF*)J7F<F1O6m,oKA8c@,+DkP)BkCptFE8RHD]iP4EcP`/
F<Ga<EcYr5DKTo/@<?'qDe*p-F`Lu'A9Da.F*2G4@<?''Anc'mF!,17+A,Et;bpCk6U`,.BleB:
Bju4,Bl@k                                                                 ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,Lp41GL"-+>GPm1,1XA+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%9+>GZ+2'=V-+>Pf/1*A;2+>Gf72'=V/+>G]31a"e$0fM*J+>GYp0ebCC
+>Gl!1,1dI+>G_r0ebF?+>GPm3&`f>0f'q21GU(-2]t+81a"M0+>G]-0d&2-+>G`21a"M1+>GW0
1E\G-+>Pl01*A>,+>G]02'=Y/+>Gi22BXb0+>PW21E\G/+>Yf61E\D1+>GZ41E\G0+>P`/2BX_0
+>Gl91a"b#3AiX&DJVXJF(o,<0ht%f.Um:36=FqL@k]V[F=f'e@UX=l@j!1/DJUaE@UWb^F`8I@
@;TQuCh[s4+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(OV
.3N).@r$4+F!,:;@:Wq[+EqOABHUl(Dfo]++EqaEA9/l8D]in*FCSu,DIIBnF"Rn/:-pQU+<VdL
+=M>CF*)/8A2#_e+DGm>Ci<`mARlomGp%3BAKZ)+F*'GcEccCG-Z!^0A9;C(F>,C'A8,OqBl@lt
Ed9#A$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:mARdJL
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l.D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)
FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sg
F(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is
/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JOpa$4R>;67sC&BOu3q+Dl7BF<G%(
+CT.1DfB9*+Co1rFD5Z2@<-W&$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k*GAR[8H
1a`_>%16Ze+E(d5FC])qF:ARP67sC)DfTB0+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZeh/
C`k)Q%13OO:-pQUFCfN8F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAnJ+C]5)+=ANG$4R>;
67sBlF<G()FCfK$%16Ze+>P'KDJUFC-OgDoEZd.\@W$!)-RT?1ATAnM+C]5)+=ANG$4R>;67sBi
DJUFi:K(4d=WhQqEcQ)=F!,"2C`m>.EZfI;AKYi.F*&O7F`MM6DKI"1@:O(qE$-_TAU%]rE-)Nr
:-pQU@W$!)Df0B:+EM+&EarcoF!+m6F(oN)Ch4`.F`\a:Bk)7!Df0!(Gp$R)@r$4++EV:.Eb-A-
F!,@=+E1b2BFP;D67sBoASu!h+EV:.Eb-A%Eb-A2D]j"-FD)e8Eb&a%+ED%7F_l/@+Dbb-ANCqV
0Ha^W+CoA++=ANG$>"6#1a"Rs@W$!)-XT8;<$re2:-pQUD.-ppDf[%4DIdI!B-;D4FD)dE?UR[h
-Qm,@+CfP7Eb0-1+C\bhCNXS*$>"6#1*A=p@W$!)-Z<NC+<VdL:-pQUB6%p5E-!.3Df0Z*Bl7X&
B-;8<@WQX3Bl7Q+-Z<NC+DG^9@s)g4ASuT4@UWb^F`7cs%16Ze+>=om+>=pIDJUFC-QjNS+AP6U
+CT)&+Du+?DK?q7DBNG3EcP`/F<G%$@r$4+%16Ze+>=om+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(
ATD7$+DG^9@s)g4ASuT4@UWb^F`7cs%13OO:-pQUGAhM4F!,(8Df$V9@<-I(@s)TrEZeh"@r$4+
Et&IO67sBiCh%9(De:,$@:O(qE$0%@D.7's+CoD4F"AGFB0%.t4"`61-S@/1/ho:;0fCX=2(gU?
/ho.70et@81a`_>:-pQUAoD^,@<?U&A0>r3+CT)*BON$)DfTr@+DkP/@q[!&F_t]1Bk&9,DfTr@
%16Ze+C]52D0%j$+C]5)+=Ach%16Q[4ZX]L0mdAIF_u1_3Zri'+C]52D0$-n%16Ze+C]5)+C]+/
+<VdL+<VdL+<VdL+AP6U+<Y-2C`k)X0fLI&+<VdL:-pQUD..NrBOu6-@;Ka&GAhM4F!,17+D5D3
ASrW"@:O(qE"*.cEZeh/C`k*GAR[#<@V[)/+<VdL+<XEG/g)9GDJUFCEb/]40fLI&+AP6U+DkP/
@q]Fp+CT)&+EqaEA9/l7FCB33Bl7Q+GA2/4+=D2@@OE:4DBNS+G%GP6@UWb^F`7csATAnI+>Y-L
DJUFCAU#RR@V[)/+<Ve%67sB'0H`.o@W$!)-Y7NT0fLI&+AP6U+EqaEA9/l)DIdI!B-;D4FD)dE
AU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#0d&7p@W$!)-Y7NM/7NB;+<VdL:-pQU+>Fup+C]5)+=C`F
/ho:4+<XEG/g,7IF*)IGASu$mDJ()9Bln#2-Y7NM+DG^9B5)O#DBNCs@r$4+%16Ze+>P&p+C]5)
+=D)<-S/_B+<VdL+AP6U+<WE^1*C%DC`k*DA1fSq-QjO,67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7
F*)G:DJ((>De(4<Bl5&+Bm+'*+C\bhCNXS*$4R>REZd%Y0d&1n@W$!)-UK13@V[)/+<XEG/g+S=
C`m.sG%G]'F!,OG@<-I(DJ()9Bln#2-UK1'Bl5&+Bm+'*+C\bhCNXS*$4R=O$;No?+>%q>78m/.
;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tD@UX=l@lZP0?Xdnh;f-GgAM>f567s`sDJW6gDeio<0HbHh/KcHNDJUaE@<-"'D.RU,+EMC<
CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#GTA8,Oq
Bl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#A?
$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1GK=G
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9
Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R
+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUEHQ2A
AN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR$4R>;67sBnASu("@<?''@;Ka&E,Tf=
Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o%15is/g,4FBQ60r+?hi#/g)qm+AP6U
+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN1a!o967sBQ+EqaEA0>buD.Oi"CghC+
%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is/g)8Z+@U*\A7]9o+<X'd@ruF'DIIR2
6Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-+<VdL+BNK%A5d&JEarcT:18!N6Yp1P
F!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?+DbJ,B0A9u-p22r0I\+q+=K>r0Ha.X
8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cIF(8m'.3L/a-nK]n/6>VF6sjA;De*3(
4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'4&&".;GU7p:dn`"C2[Wi.1HUn$;No?
+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o:-pQU+<Ve<D/aTB+<Y-%@r$4+@r?B2
+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro@UWb^F`7cs:-pQUEaa!$4ZX]5-QjNn
+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS+<Vdg+=D&8D.P>0Dfor>-OgCl$;No?
+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o:-pQU-Vcu\+=A9_+u(2_
4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a9KF:N+=nX^+=K?g@<-!0+=nWtEHQ2A
AL9#n+ECn2B+51W$9g.jDe't<FCfN8C2[W:-QlV91E^UH+=ANG$4R>;67sBkASbq"AKYDtC`mq?
Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQ
F!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+D#S%F(HJ&DL!@6@:O(qE-!-2$:IQN
3Zrc1HS-F/:dJ&O?XH`2?XHE$6uQOL%14g4/1_nl0d/S82(9Y&+Co2,+@8@e?XH2p/12o"Bkh6-
%13OO:-pQUFE2XLF(Jd#@q]RoB-;D3ASrW4BOu3q+CT;%+Du*?@UWb^F`;CE/KeVLE+NO$ARlop
EcQ)=%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFC/i+ja$4R>;67sBjEb/[$AKZ).
Eb/f)@UWb^F`;C2$4R>;67sBmBl\9:+E(_(ARfg)@rH1"ARfgrDf-[L+D#D/FEn<&4tq>&@:O(`
+=D8BF*)/8A2#A?$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*
3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#Tt-Zip@FD>`)0II;:+:SZQ67sC&BPDKt+E(_(
ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%159QHZ3D'
CLeP8FCfN8C2[W:-OgCl$;No?+EMI<AKYGjF(o,,Bl8*&Ch[E&@<-"'D.RU,F!*%WAU&0*@ru9m
+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*-OgE#ATAnK+C]5)+=Aco-OgE#ATAo&
DJUFL%16uaEZeh/C`khf-OgCl$;No?+EMI<AKYGjF(o,,Bk1dmFD5i2ATJt'$7KA$C`k)Q.3L3'
+C]5)+?M<)@W$!)-S?bh%14L;+C]5)+=ANc+>#Vs0HahBC`keoHS?RODJUFC/ghbN$7IVO@W$!)
-RU>c/NP"/+C]5)+?M<)0d'qCC`k)X-Qij*-o)oSDJUFC-Rg/i3Zp1#@W$!)4#)(;+C]5)+=Ach
+:SZ+1E^.EC`k)Q.3L3'+>Y-LDJUFW0mb]!@W$!)-S?bh%14L?+C]5)+=ANc+>#Vs1a$7FC`keo
HScjSDJUFC/ghbN$4R>;67sB'@W$!)-S?bU$9g.j@W$!)-S?bh%14p74WktYDJU[Q-OgCl$=[FS
DKTeZ3Zoe&-Qjr_,!$i$1E\1j+taud4#)(kDJUFC/gi(j/M8.n/gh)8%15is/g+b;FCSu,Ao_g,
+<YQ?DIn',F*(u2F<G%$@r$4++>"^IEcQ)=+D#e:ARfgnA.8l`ATAo&DJUG)@:X7uD%-hiATAnI
+C]5)+C\biDKTe*$>sEq+>G!JDJUG)@:X7uD%-hiATAnK+C]5)+C\biDKTe*$>sEq+>Y-LDJUG)
@:X7uD%-hiATAnM+C]5)+C\biDKTe*$4R>;67sBT@;^?5De:,4ASkjiDJ=!$+EV19FE8R7EbTW0
@ps1iGp$X/E+Not+E)-?FD,5.Ci<`mARlp%@VTIaFE9&D$;No?+A$/fFD,5.Ci<`m+EMC<CLnW1
ATMr9F(96)E--.D@<,p%@q]:gB4YTr@3BB)F<GL6+EV:.F(HJ9ATMs7%15is/g,"RF*&O6AKZ#)
G%l#/A1eu6$4R>;67sB'@W$!)-RT?1-tI43+=ANc+>#Vs@W$!)-RT?1%15is/g)9GDJUFC/n8gB
DKI68$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bU$4R>;67sB'@W$!)-Z3@0AL@oo-o!e+4$"`U
:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP"`DJUFC6;LBN-OgCl$;No?
+<Y-2C`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+C]5)+=B`U<$s4Y
14*JJCaUh_%13OO:-pQU0HahBC`k)Q%14L;+CoA++=ANc+>#Vs+>=pIDJUFC-OgCl$;No?+>=pI
DJUFC/gh)8-t7(1+=Ach.3L3'+>=pIDJUFC/gh)8%15is/g)hj@W$!)-SAnIF`):K%14L;+CoA+
+=ANc+>#Vs0HahBC`keoHX^l/+=Ach%13OO:-pQU0HahBC`k*C@;TR'%14L<4!6UG-ULU)9L2WR
9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'+>=pIDJUFC6;LBN-OgCl$;No?+>=pI
DJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3Zp+!@W$!)-V7'4-S.>7
HX^l/-S?bU$4R>;67sB8+C]5)+=ANG$7IVj-Za-CCLo2!ATMrI-T`\sD/X3$0iV_*F>,((-Za-C
CLo5"ATMrJ-Rg/i3Zp."@W$!)-RT?1%15is/g)kk@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."@W$!)
-S?bU$4R>;67sB8+C]5)+=AdODfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qCC`kepHX^l/
-S?bU$4R>;67sB8+C]5)+=D&8D.P(($7IVj-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs
0d'qCC`k*HD/X3$0ddD;%15is/g)kk@W$!)-Z3@0AM.J2F`):K%14L<4"#)dDeio<<+U,m0IJ:l
/NP"/+C]5)+=D5IDeio<-S.>7HX^l/-S?bU$4R>;67sB9+C]5)+=ANG$7IVj-Xq"4CiaH3CLo1I
4""KUDesK3Deio=-T`\iDKKr:Deio<-T`\iDKKr:Deio=-Rg/i3Zp1#@W$!)-RT?1%15is/g)nl
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)+=AdODfor>-OgD2-p045
/3GU3@6,h[/NP"0+C]5)+?MB+@W$!0/gh)8%15is/g)nl@W$!)-Z3@0AL@oo-o!e2Bl8$6D/X3$
0deCm/NP"0+C]5)+=Cl@FE;;;CLo4J%13OO:-pQU1*C%DC`k*C@;TR.@rHL-F=.M)-o!e2@W-1$
F)>i2AM>J\+>#Vs1*C%DC`k*7Df9G>/3>V6@W$!)-S?bU$4R>;67sB:+C]5)+=ANG$7IVj-ZaEE
FCfN1Deio=-Rg/i3Zp4$@W$!0-OgCl$;No?+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Y-LDJUFC
/gh)8%15is/g)qm@W$!)-SAnIF`):K%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)+?M<)@W$!0
/gh)8%15is/g)qm@W$!)-Z3@0AL@oo-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJUFCF*/i>$4R>;
67sB:+C]5)+=D&8D.P>0Dfor>-OgD2-p045/3GU3@6,h[/NP"1+C]5)+=D5Q-S.>7HX^l/-S?bU
$4R>;67sB;+C]5)+=ANG$7IVj-Za-CCLo1o@:O=r0IJq0F)>i2AM?he@rcKB-T`\sD/X3$0hl(d
Ec3WZ4"#)dDeio=9jqOPD_WUg+>#Vs1a$7FC`k)Q%13OO:-pQU1a$7FC`k)X-OgD2@W$!)-S?bq
+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68$;No?+>b3MDJUFCDIIBn-OgDX67sB;
+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl$;No?+>=om+C]5)+=Ach%14LmDJUFC
/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X@rHL-F=.M):-pQU0H`(m@W$!)-Z3@0
AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*C%DC`k)Q%13OO:-pQU0H`+n@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?+>=on+C]5)+=AdODfor>-OgDX67sB7
+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+C]5)+=ANG$4R>;
67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)+=Ach%13OO:-pQU0H`.o@W$!)-SAnI
F`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0d&1n
@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n@W$!)-S?bU$4R>;67sB8
+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P(($;No?+>Fun+C]5)+=D&8D.P>0Dfor>
-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>P'KDJUFC
/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0AL@oo:-pQU0d&4o@W$!)
-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>-OgDX67sB8+>Y-LDJUFCDIIBn-OgDX
67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)+=ANG$4R>;67sB9+>G!JDJUFC/gh)8
-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o@W$!)-SAnIF`):K%15is/g)nl0d'qC
C`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1*A=p@W$!)-RT?1%15is/g)nl
1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9+>P'KDJUFC/n8gBDKI68
$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>Y-LDJUFC
-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC/gh)8%15is/g)nl1E^.E
C`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)-Z3@0AM.J2F`):K%15is
/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$0d'qCC`k)X-OgCl
$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFCDIIBn-OgDX67sB:+>G!JDJUFCDIIBn
/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,q
+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is/g)qm1*C%DC`k*C@;TR'%15is/g)qm
1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1%15is/g)qm1E^.EC`k)X-OgD2@W$!)
-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC/n8gBDKI68$;No?+>Y,r+C]5)+=D&8
D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>G!JDJUFC-OgCl$;No?+>b2q+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is/g)tn0d'qCC`k)X@rHL-F=.M):-pQU
1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*C%DC`k)Q%13OO
:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl$;No?+>b2r+C]5)+=AdO
Dfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>b2s
+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+C]5)+=Ach%13OO:-pQU
1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'%15is/g)tn1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m
0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68$;No?+>=om+>=pIDJUFCDIIBn-OgDX
67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun+C]5)+=ANG$4R>;67sB7+>Fun+C]5)
+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO:-pQU0H`(m0d'qCC`k)X@rHL-F=.M)
:-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&4o
@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&4o@W$!)-S?bU$4R>;
67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)+=D&8D.P(($;No?+>=om+>P'KDJUFC
DIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?+>=om+>Y-LDJUFC/gh)8-t7(1+=Ach
.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)-SAnIF`):K%15is/g)hj0d&7p@W$!)
-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0HahBC`k)Q%13OO:-pQU
0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl$;No?+>=on+>=pIDJUFC
/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7+>P&n+C]5)+=D&8D.P>0Dfor>-OgDX
67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&o+C]5)
+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU0H`+n0d'qCC`k*C@;TR'%15is/g)hj
1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)-RT?1%15is/g)hj1*A=p@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7+>P&p+C]5)+=AdODfor>-OgDX67sB7
+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=on+>Y-LDJUFC
-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>Y-LDJUFC/gh)8%15is/g)hj
1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU0H`+n1E^.EC`k*C@;TR.
@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gBDKI68$;No?+>=oo+>=pIDJUFCDIIBn
-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)+=ANG$4R>;67sB7+>Y,p
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach%13OO:-pQU0H`.o0d'qCC`k)X@rHL-
F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0AM.J2F`):K%15is/g)hj
1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Fq@W$!)-S?bU
$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q+C]5)+=D&8D.P(($;No?+>=oo+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo+>Y-LDJUFC/gh)8-t7(1
+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir@W$!)-SAnIF`):K%15is/g)hj1E\Ir
@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,0n\DJUFC-OgCl
$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)+=Ach%13OO:-pQU1a"Lq
1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Lq1,0n\DJUFCDIIBn
/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn0d&5,+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)-SAnIF`):K%15is/g)tn0d&5,+C]5)
+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5-+C]5)+=ANG$4R>;
67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC/gh)8%15is/g)tn0d&5-
+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'%15is/g)tn0d&5-+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X@rHL-F=.M):-pQU1a"Lq1,L+_DJUFC
DIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,U1`DJUFC-OgCl$;No?
+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach%13OO:-pQU1a"Lq1,U1`
DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq1,U1`DJUFCDIIBn/n8gB
DKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnIF`):K%15is/g)tn0d&50+C]5)+=D&8
D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&51+C]5)+=ANG$4R>;67sB;
+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8%15is/g)tn0d&51+C]5)
+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is/g)tn0d&51+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q
+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU1a"Lq1,pCcDJUFCDIIBn
-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,0n\DJUFC-OgCl$;No?+>b2r
+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>,+C]5)+=Ach%13OO:-pQU1a"Or1,0n\DJUFC
/n8gBDKI68$;No?+>b2r+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Or1,0n\DJUFCDIIBn/n8gBDKI68
$;No?+>b2r+>P\p@W$!)-RT?1%15is/g)tn1*A>-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p
1*C%DC`k)X-OgCl$;No?+>b2r+>P\p@W$!)-SAnIF`):K%15is/g)tn1*A>-+C]5)+=D&8D.P((
$;No?+>b2r+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>.+C]5)+=ANG$4R>;67sB;+>P&p
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,C%^DJUFC/gh)8%15is/g)tn1*A>.+C]5)+=AdO
Dfor>-OgDX67sB;+>P&p1E^.EC`k*C@;TR'%15is/g)tn1*A>.+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>P&p1a$7FC`k)Q%13OO:-pQU1a"Or1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Pbr
@W$!)-S?bU$4R>;67sB;+>P&p1a$7FC`k)X@rHL-F=.M):-pQU1a"Or1,L+_DJUFCDIIBn-OgDX
67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,U1`DJUFC-OgCl$;No?+>b2r+>Pes
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>0+C]5)+=Ach%13OO:-pQU1a"Or1,U1`DJUFC/n8gB
DKI68$;No?+>b2r+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Or1,U1`DJUFCDIIBn/n8gBDKI68$;No?
+>b2r+>Pht@W$!)-RT?1%15is/g)tn1*A>1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2BZIH
C`k)X-OgCl$;No?+>b2r+>Pht@W$!)-SAnIF`):K%15is/g)tn1*A>1+C]5)+=D&8D.P(($;No?
+>b2r+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>2+C]5)+=ANG$4R>;67sB;+>P&p2]uRI
C`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,g=bDJUFC/gh)8%15is/g)tn1*A>2+C]5)+=AdODfor>
-OgDX67sB;+>P&p2]uRIC`k*C@;TR'%15is/g)tn1*A>2+C]5)+=D&8D.P>0Dfor>-OgDX67sB;
+>P&p3$;[JC`k)Q%13OO:-pQU1a"Or1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Po!@W$!)
-S?bU$4R>;67sB;+>P&p3$;[JC`k)X@rHL-F=.M):-pQU1a"Or1,pCcDJUFCDIIBn-OgDX67sB;
+>P&p3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\DJUFC-OgCl$;No?+>b2s+>PYo@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G-+C]5)+=Ach%13OO:-pQU1a"Rs1,0n\DJUFC/n8gBDKI68
$;No?+>b2s+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Rs1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2s
+>P\p@W$!)-RT?1%15is/g)tn1E\G.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q1*C%DC`k)X
-OgCl$;No?+>b2s+>P\p@W$!)-SAnIF`):K%15is/g)tn1E\G.+C]5)+=D&8D.P(($;No?+>b2s
+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G/+C]5)+=ANG$4R>;67sB;+>Y,q1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs1a"Rs1,C%^DJUFC/gh)8%15is/g)tn1E\G/+C]5)+=AdODfor>-OgDX
67sB;+>Y,q1E^.EC`k*C@;TR'%15is/g)tn1E\G/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q
1a$7FC`k)Q%13OO:-pQU1a"Rs1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pbr@W$!)-S?bU
$4R>;67sB;+>Y,q1a$7FC`k)X@rHL-F=.M):-pQU1a"Rs1,L+_DJUFCDIIBn-OgDX67sB;+>Y,q
1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC-OgCl$;No?+>b2s+>Pes@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp7%1E\G1+C]5)+=Ach%13OO:-pQU1a"Rs1,U1`DJUFC/n8gBDKI68$;No?
+>b2s+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Rs1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pht
@W$!)-RT?1%15is/g)tn1E\G2+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2BZIHC`k)X-OgCl
$;No?+>b2s+>Pht@W$!)-SAnIF`):K%15is/g)tn1E\G2+C]5)+=D&8D.P(($;No?+>b2s+>Pht
@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G3+C]5)+=ANG$4R>;67sB;+>Y,q2]uRIC`k)X-OgD2
@W$!)-S?bq+>#Vs1a"Rs1,g=bDJUFC/gh)8%15is/g)tn1E\G3+C]5)+=AdODfor>-OgDX67sB;
+>Y,q2]uRIC`k*C@;TR'%15is/g)tn1E\G3+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q3$;[J
C`k)Q%13OO:-pQU1a"Rs1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Po!@W$!)-S?bU$4R>;
67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCcDJUFCDIIBn-OgDX67sB;+>Y,q3$;[J
C`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<
3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GVDf'H.;f-GgAM>f567s`t
Df'H.;f-GgAM>e\F=f'eFCfN8+=L`<D/a5=+DtV)AKYo#Ap&0)@<?4%DCuA*:-pQB$;No?+BN5f
DBO%7AKW+:FE2)5B-8TU3[m3Q+<Y*3E+NHuF!)T>DBL'1+A*b!GAhM4+<W(BDf'H..3NhKChsOf
:-pQUDdm=$F(8X#AKYE!Gp"5GDe!3l+DtV)ATKIH:L[pYF(8X#ARlp$@;TRs+<Y-)B5)6++EqOA
BHVD1AISuA67sC"Eb/isGT\+W:I7NN;aXAN==G@8@;]Tu+<Y65A0<"=Bln#2+ECn.A8c<-+C\c#
AKW*j5tsd69Me8G%15is/g,4XAnGb%ATJt:+Cf>-FE2;9Ch7-"+C]U=+=L#P7TEAS6V^T0/g)8Z
882^MATAn9+Eh10F_,V:+E(j$$;No?+=L#P7TEAS6V^T0+D58'ATD4$AKYf-DJ*O$+CT.u+DbV1
F!,:5CLq=-+EVNE@r,RpBHV2$D.Rc@%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+>G;f
@<6L4D.Rc2FCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCb[jX$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUa
+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>P
De!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/
DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't5-RT?1%15is/g+Y;@<,dd
FCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B+CehrCcW[]C1D9,-[''A@ODTlC1D9I
3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?+Co%qBl7K)GAhM4+EqOABHV5&Ap&0)
@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(.6T^7Ddm=$F(8X#AKYf-@ps0rDIIBn
Et&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC%144#Ci<flCi^$m
+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk%15is/g+tK@ps0rE,8rs
DBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tD
F)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&+E2IF+=D):Ap&0)
@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)GA2/4+E(_$F`V&$FCeu*DIIBnEt&I2
+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@$4R>;67sBsDe!3l+E(_$F`V&$FCeu*
DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/
DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,(M
@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s
?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8l
ASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c
0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2
%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o%14g4
>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO:-pQUCi<flC`me4DfTqBDIIBnEt&It
DIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i
%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs+=o,fF)GE'ATJ:f%13OO
:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S:-pQ_@rH4'C/\tfCLo1S+ET1e+=L`<
D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is
/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttirF`:l"FCeu*AoD]4
8l%ht0J5@<1b0"B:-pQU0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V@<6-m.3N&:A0>;kC3=T>
ARloqDfQsm+?1u-1^sde67sB'+<VdL+<Ve8DIal-ATo7FF)>i2ALq;!F(o,8Cgh?sALqnEEb0<5
/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O.`:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u4
3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>R
EZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FFDf'&.F*(i.A79Lh+EqaEA9/l8D]iP.
D/aN,F)qct9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!%13OO@W-0-4Y@jtARTCk
H#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8+?_>"0F\A-An?3u@qB_&Bm+'/FCB&t
@<,n"+?_>"@W-/o$4R>aBOQ!kEb/[#A79=`B5)6r@<6=)F*(i.A79Lh@<>poC`kkn+C]8-+=\LZ
%13OO-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh6r-lZ-QkQ)+C]8-%13OO
-V$j+6:":D+@TC"9N=JL6mk,Y+C]8-%14Nn$4R>REZfI@E,9H&+E2IF+=Bj$DJ)^QD.RcSEb/-[
@;Kb*87?OL<,Y`]E+LC+$?BW!>9G;6@j#l<F=044+Cf>,E,$LC9Q+f]:18!NF$XhX;Is9QCjAQ[
Eb&-f<-`Fo-OgD;+Bot0D/XQ=E-67FFEhm:$4R>`BQ%p54ZX]A+?CW!%15is/g,%?D.Rc2@;Kb#
ART+p+E)./+Cf(nEZcqVDJsV>@q]:gB4YT_$=Q(MGmt++4YC.c.NgJU$@4if@3@$BGp"RZGmt*0
%13OOATAo8D/a<0@j#`5F<DrPBQ%p5-OgE'@j"tu-ZW]>FEhmT4Z[(kD/a54-Z`s>Ec`Z<$8EZ-
+EMC<F`_SFF<G[MF:AQd$4R>\@VTIaFE1r)F$2Q,1E\_$0F\A'@;T@YDdmHm@rsjd+F,))67sBk
D]iq9F<G(3D/aN,F)rIB@VTIaFE7luCi=B:?XIMb?XI_\C1Ums?XI;]DJ"$4Bl@lP/g)nY$4R>Q
Bl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?De!3lATJ:f.1HUn$>"6#FDYu5Ddso/
F`\`RDdmHm@rua&Aof=/$?BW!>9G;6@j#l<F=044@rH4'C*4mB@VTIaFE1r)F!hD(0d'[CF)>i<
FDuAE+EVjM%13OOB5DKq@;KsqAog*r1E\_$0F\A%Ci<ckCi^^K+CT;%+=\LODfd*O+Cf>,E,oN2
F(Jl).Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-YI76@UX(nAS-!2%17,c+Bos9Eap56G]Y;r3ZqpN
D/a54-YI76@UX(nAS-!2%14g4>9J!(Dfp/@F`\aJG]XB%%13OOA7]7e@<,piF(9--ATL!q+>b3%
+>=63%15is/g+\9@r,RoARlp)@rH<tF!+n3AKZ)5F^o*1+DtV)ATJu&DIakuEb,[e:-pQUAU%^$
F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Et&Hc$?(*!EcPl)AN`(eCi<ckCi_a#+F#"O
:-pQ].OdM5+E)F7EcPl)AKYW%Ddm-kEt&Hc$=[pl4YCDdD`o^pDf7ck+>Fu]+<VdL:-pQU-n6Z/
3ZqmMD]i_3D]j.?D[d$_$>+3s?Z':hATKIHGp$X9/e&.1+<Ve9Df6aJ+DtV)ATM3mDId='+<XEG
/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdkARl5W+<VdL-[0,EB4Z0-@rc^0@q]Fa+E)CE
+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.Rbt$>"*c/e&-s$>=?r+=\LZ%14Nn$4R>REZfI@
E,9H&+E2IF+=C]2@r,RoARojlDfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=C]2@r,RoARojl
DfB9/-OgD;+Bot0D/XQ=E-67FFEhm:$4R>ZBm=3"F(9--ATL!q+>Y-$+>=63%15is/g+tK@ps0r
BlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k%15is/g,@OASrW!DL!@ABm=3"+EM%2E+O)5@<,p%
A7]jo@ru9m+E).6Gmt*U67sC)BPDR"+EML1@q?csF!,L7D/XT/A0<HH-td@7@WNt@Eb03.Ecc@3
$;No?+CT.u+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/%13OOCi<flCcsBnGmt*sDe!3l4ZX]@+=\LM
De!3l%14Nn$4R>REZfI@E,9H&+E2IF+=D#?G\(E,@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'
C*4m@Bm=3"F(9--ATK4.$8EZ-+EMC<F`_SFF<G[MF:AQd$=e!lAp&0+A927!E+O)R3Zp4$3Zp*c
$4R>;67sBpAfu2/ATD?)@<,p%@;^?5DIIBn+Cf4rF)u&-Bk(RnBl@l3Ble?<ATJ:f:-pQUCh[Zr
+Cf>-Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&/e&._67sC&BPDN1BlbD=
BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt-$;No?+Eh=:@N]2mFCes(F!+n/A0>o(
E,Tc=F!+t2DJ"$4ARlooARfObEaa'(Df0VK%13OO:-pQU@W-0-BlbD-ARfObEb/c(Ci<flC`m/(
A0>N$Ddm-k+>"^KD]iY+B6A6+%13OO@W-0JGp"4P+<VdL+<XEG/g)Pl.6T:+@W-/o$>=?r4YC2^
D]gMPGp"5)67sB/.OdMA+C]8-%14Nn$4R>REZfI@E,9H&+E2IF+=CZ;DJ"$4ARojlDfB9/-OgE'
@j"tu-ZW]>FEhmT4ZX]qDf'H.+=CZ;DJ"$4ARojlDfB9/-OgCl$;No?+>%q>78m/.;cQ1P78m,S
<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$ATVL)FC])qFD5Z2@<-'nF!,QV/KePD
ART[lF!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+B!?"+=Lc3F*)G@H$!V=
FC])qFD5Z2@<-'nF"&5RATMr9E,oZ2EZfIB+EDUBDJ=!$/e&._67sB'%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AN%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'D..]E1E^OQ
A8,XiARlp*D]j(CDBO.;FD)e7ATo7FBkhQs.3N>BFCfK)@:NjkCi<flCh4%_:-pQU0emQaFttcp
-us0FDf9_H+CSekARlo8+CSeqF`VY9A0>u4+EDUB+E)-?@W-@%+EqO;A8cZ7-6R,=DKU15$;No?
+>GfiF`&rg+EV19F<G+.@ruF'DIIR"ATJu'Ea`irARlo8+Dl%;AKYDlA7]9\$;No?+>Gim@<jU_
+DG_7F`M%9IS*C(<(0_b+Co2,ARfh#Ed8d=G\M5@Et&IO67sB83,N)L1GBq[A7Qf2FDti:.3N_D
F*&O8Bk)7!Df0!(Gp%!5D.Oi/Eb/isGRXuh$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+DGm>8l%iS
78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g,7I
F*(u6+E_d?Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_Eb065Bl[c--YdR1FCfN8ATB.-$4R>;
67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGjn@<6K4FDYu5De!-?5s]U5@<6*B
3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is
/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[W1%13OO:-pQU:2b5c3ZrNXAKZFo:IJ/N
;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*
-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9DfcEq:-pQU8l%iS78m/`:JXqQ
3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;%14g4>9IckCLq$jEaN6iDe*2t
4A&C;<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4+Dbb0Fa,QV@:K`R8l%iS78m/`:JXqQ
3ZrNcCghBu11+I)De*2t8l%iS78m/`:JXq!$4R>;67sBjEb/[$AKYQ$E--@JFCfN8+Co1rFD5Z2
@<-'nF!*%WF(KH8Bl7Q+6r-0M9gqfV6qKaF%15is/g,7S+>=pWEb0<'Ecu#8+EV:.+EV=7AKZ&9
@;Ts+@WGmpA1e;uA8XOkFDti:/13,*-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\
F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$
DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SR8&%16Ze+Dtb7A0>E#4%`::
<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt
+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS
0JY!b$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh
/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F
<$sa]+:SYe$=n$;3co=QGUt3r1FEV=ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F
.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo
+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,.-OgDoEZf72G@Vh,DECHd6rZTR
<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+
De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SRD*
%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f
-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep
0H^f3%16W`4Z[\(Ap>jS0K(9f$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>Q
FCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHq
F(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r2^]%AATAo2ATqZ-A8XJ$:IJ/N;cHXj
:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5
A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,2-OgDo
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4
:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd
$4R>QDEU%&E+X>G-SRP.%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-
E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4
+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0easa$>"6#DIn$&+Co@O8l%iS78m/`:JXq@
A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!
$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3s0ddD;ATAo2
ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
A8XOkFDti:/13/--OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ij
C2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!
:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[D)%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-
$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze
+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0f16e$>"6#DIn$&
+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b
;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;
3co=QGUt3s2(&h?ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k
?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M
9gqfV6qKaF-Ta")%13OO:-pQUDfTB"EZf:4+DkP"DJ=38A7ZloBk)7!Df0!(Bk;>p$=n$;3co=Q
GUt3s0JFj`$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3
.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW
<(';F<$sa]+:SYe$;No?+EVgG+E):2ATDi7De:,/@:sIlFEM,*+Co1rFD5Z2@<-'nEt&IeDEU%&
E+X>G-S[;/0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k
?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M
9gqfV6qKaF-Ta")%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&A7]RD@<6-m0JG4V67s`u
ASa\AF(o,<0JO\l/M/)S@<6-m+Eh10Bk/>7A7]R++EV19FE9&D$;No?+:SZQ67sBhF)uJ@ATKmA
$;No?%15is/g)8Z0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(ON/e&._67r]S
:-pQU8l%ht@ps1iF!,RC+EM+9F`8IFATMr9ASu[*Ec5i4ASuT4/KeJCF*2>2F!+(N6rQl];F<kq
%15is/g+S5A8c?.Bl8!6@;KakA0>;uA0=K?6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJtBC2[Wn
ATf_ADe(MDFD5Q4.1HVZ67r]S:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$;No?+<VeDCi^^HC2[X)ATMs)E[M;':-pQU+<YK=@:UK.C2[X)ATMs)E[MtP%15is/g)8Z0d(LY
F<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!i(Q:-pQU@rc-hFCcS:ATMr9A8,OqBl@ltEbT*+%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(C9F(K;E0b"Ib67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB72f<PW0JO\[Df0`0Ecbl'+EVNEC,R[u1*A.kEb0,sD.R5e$;No?+>GTf@<jR`+E_X6
@<?'k+D,P4+A+RG9PJBeGT_0@EcYr5DBNk0+A,Et%15is/g)l'D..]F0H_cYDe*s$F*(u6.3NYB
EHPu9ALD!t$;No?+>GTgDg!ll+Cf(nDJ*Nk+EVNEF`V+:FCf<.DfT9,Gp$pA@ps1b%15is/g)l.
D..]F1a$p[@<?'k+D,P4+A*b9/hf3n$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#
AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)5o$4R>;67sBpDKBB0F<G!7
GAhM4+CT.u+Co&"ATVK+BljdkBjkk&DfTAO3Zp4$3Zp*c$=Q(M+>P&i+F+D'@3@$B13a68.1HUn
$>aI"F*'Q++=A9Z-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>REZfI@E,9H&+E2IF
+=Cl3D0Ko=A1&KB+AP6U+DG_8D]iS)@ruF'DIIR2%16Ze+CoA++=Cl3D0Ko=A1&KB+AP6U+DGm>
BlkJ3DBO%7AKYMt@ruF'DIIR2%13OOATAo(AS`J:Bjkk&DfTA9+<Ve%67sBkASbq"AKZ28Eb#Ud
DImi2FDYu5Ddso&ATT%BBjkk&DfTA9+<XEG/g,@VEb$;,F!,")Ch7^"A0>AjDJjB7+D58-%13OO
:-pQUBl8!'Ec`EY0JFVnDfTB0+DG_8D]iS)@ruF'DIIR2+CT.u+Co&"ATVK+FD,6&%14M-DfTB6
E,TZ94ZX]J+u(2fGAhM4H#R\?-Qjra0d%TTC3=T>+<iih/1r&Z/g)l&0I\,-3Zp.20H_S_4<QL)
3]/$B-Y["+GAhM4-OgDoEZfI@E,9H&+E2IF+EqaEA9i-4DfZ?pATAo(AS`K5DfTB6E,TZ9%13OO
:-pQUGA1l0+Du+>+C\n)@:F%a+EVNEB4Z0-@;^?5A7]RgFCeu*GAhM4Et&IoATAo8D/a<0@j#Dq
F<Dtd0L$e+DfTB6E,TZ9.=68WEb'H7Df9\+$4R>;67sBkASbq"AKYDtC`mb0An?!oDI[7!+CT.u
+Cf(r@r!3/BOuH3@<,p%B5_[!%16Ze+>GSnA7]R"GAhM4H#R\?Et&IoATAo9FZhc.F`V,8+EqaE
A9i-4DfZ?p%15is/g,1GB4YslEaa'$+ED%*ATD@"@qB]j$8EZ-+>=pNCi<d(-9`PrDfTB6E,TZ9
%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"ATJ:fATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\sgF(o,E3B:FU$=m^h
FE2;FFCfN8A8,OqBl@ltEbT*+:-pQ_A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?.F=f'eA7]h(Ec65E
+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+SDF*2>2F#kElC2[X)ATMs)E[`,FF!+m6
Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttcp-us0FDf9_H+CSekARlo8+Du+A+EDUBF!,C=
+BN8pA8c[5+CT.u+A?KeFa+?&:-pQU0fNiiDDEmg@UX=l@j#9"DJ!Tq+EV19F<G"&A7]9\$;No?
+>Gim@<jX_+=M>NAp>aIFCfN8+Co1rFD5Z2@<-W9E,oN%Bm:b/A7T7^%13OO@rGk"EcP`/F<Dr?
@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dE
IS*C(<(0_b-OgCl$;No?+EV19F<G^JBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0
>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8
+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FDti:4ZX]5FCfN8C2[W1%13OO:-pQUF`)52B5)F/ATAo%DL!@HATMs.De'u$Bk)7!Df0!(Bk;>p
$9ieh+@Jdg<)Yq@+>b3ZA0<6I%14g4>9H=*6W?uI3Zp."E+rft+@Jdg<)X550d'[CF(fK9E+*g/
+@Jdg<)Yq@+=MRh+u(3.8OHHU.3Kja+=f&t+u(2g/37llAp>aI74o]HHS-Ks+@Jdg<)X550d'[C
1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@Gp$O3C`m51EcP`/F<G=:A9;C(F<G+.@ruF'DIIR"
ATJ:f:-pQU:2b5c3ZrNXAKZG:De*s$F*&OFDf9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/
AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YD
CERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN8
0ddD;%14g4>9Is'Ec5l<+A,Et<(0_b;GU(f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16W[
A5d>`CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<CLnW1ATMrG%15is/e&._67sBhF)uJ@
ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA
+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV+EV19F<G+.F(9<+Df0!(Bk;?H%15is
/g)8Z+<VdTFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8A2,bh+EV19FD>`)0eb:1+:SZQ67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQaFtks!F`:l"FCeu*AoD]4
8iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,VEc5e;-tI%&6=FqL@k]Sk
.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3
DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*
AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@
6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2+Eh=:@N[(0Bk/Y8BkM=%
Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De'u4A8,Oq%16Ze+Co1s+>=63%15is/g,%SD.7's+E(j7
A8,OqBl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn$8EYd+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3
FCfN8C2[W:0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!+?^hl+FPjbA8,Qs0F\?u$>"6#FZhc.
0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"F!,.-@:Wqi%13OOATAnL+E(d54$%Io
Bk)69-QmMBF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F+?^hl+>G!XBk(p$FU\Ze$;No?+>%q>
78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDF)>i2AN;b2?Y!klE)UUlCLpL`Bk)'lAM>f567s`uBle5lD/X3$<GlM\De*E50HbHh
/KcHPBle5B+Co2-E,8s.+E(j7F`(o'De*E3%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z
0e"5R+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp"MWATMs.De(OU.3N&B@;0Od@VfTb$;No?+<Vd^
.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW)2eHW10Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kf_]/KcH`ATMs4@<6K=
+ED%4CgggbF!)lPD/XQ=E-67O%15is/g)l'D..]F0H_qi.!''?GApu3F"&5PAT2Ho@qB^(.!0$A
FDtZ0F"%P*:-pQU0fX#YGr%/t/Kf1TA79RkA0>K&EZdss3%cmD%13OO%15is/h0:f;GU1R4s27a
Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie
1,(C>+>GZ51G_'K0b"I!$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`
@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]
CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?
+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%175g4ZX^.3ZoelBPDN1BlbD>
DJ<U!A7[+t$6UH6%14J*DJ<U!A7[,2/NP"b@<>q"H#R=;F^uU;:-pQUA79RgFEqh:+DG^9F*(i.
A79Lh+A*bqEc5Q(Ch4%_%14g4>9G^EDe't<-OgCl$>"6#De'u4A8,Oq+<XEG/g*b^6m-S_F*&O8
Bk)7!Df0!(Gp!P'%16Ze+EVI>Ci<f+E-67F-ZrrI+<XEG/g,4WDfTD3Bl5&8ATMr9A8,OqBl@lt
Ed8*$%16Ze@<6!&-ZrrI+<VdL+<VdL+<V+#%16Ze+EVI>Ci<f+B4Z0--ZrrI%13OO-Zs<@@rGmh
-Qk!%+Cno&@<?d6AKZ,++<XEG/g,"RF*&OA@<?!m%13OO.!7Qn-Zj$9F!,1<+E_R9@rGmh-Rg/i
3ZrQU+AP6U+Dl7BF<GF/FCStn$4R>;67sB/F(fK9E+*g/.3N/4Anc-oA0>T(+=LuCA9;C(FCfJA
+:SZ4+Bot0BQ&*6@<6K4A8-+(+=D;B-QjNS+AP6U+Dl7BF<G+.F)Yr(Gp%<FFD,T8F<G.8Ec5t-
$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?O[>O$;No?.Rm!34['uuDfTl0@ru9m+DG^9CghEs
EZfO:EcYr5DK?q=Afs\g%13OOA8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R+ET1e+=Lc<CagKJD/X3$
+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5B6A'&DKI!D@psFiF!)TD
Afr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;G%#3$A0>AjF(KD8@<,p%
@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,T
Bk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
2/78M1,'.E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@
Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#
+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..
@rr.e%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2
+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQU
Df0B:+E2IF+Co1rFD5Z2@<-W9BlbD8DBO%7AKYr#FD)*j1*A_&,@kM!+>=63%15is/g+\=@ruF'
DIIR2+DGm>ASlC.Gmt*7+?^hl4s2R&HQY!bA8Z3+-RT?10H`M$,<d5)+F>4c+CoA++=ANG$8<Sc
+<s&m0d(fc1*C+FC`k)Q%14d34Wkt5+>G!c+>Y-NDJUFC-OgD:+?^hl4s2R&HQY-fA8Z3+-RT?1
%15is/g+kGF(KB6+EMI<AKZ/-Eaj)!$?g;qD.RcO3ZoeZGB.4J+C]P8A2,39GB.4L+C]P8A2>SB
$=\4"A2$/-+?^/@@Wuj'0g.Q?/I`%rGB.4L4ZX]A+?CVmGT\IYGpa%.@Wuj'1HdcA0f'q5+=DCV
/Kcek.Nj!a%159QHZX+DCi<f+E-67F4$%P&@;TRs%13OO:-pQUBl8!'Ec`FFDf'&.DJsZ8Et&Io
DIIBnF$2Q,-Z4-KA2#-DGB.4K+DuCDA259FGB.4M+DuCDA2GYC$7ItsDJim"ATK:`3ZoguF_>N9
+Cf>6@W-O5-Rh,*BeCM`+>YH.-o!D?0eb%<-oa40,p5E0+>P3$2^pgNFZLmmDJ<U!A7Zm#AKYH&
D^Pu$4tq>*D/a<0@j#`5F<EY+DJim"ATJ:f%13OO-tI43+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_
+?MW%DIIBnEt&I)0HanDC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f%14L;+>G!L
DJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2E,oN%Bm:'o
-nlc!+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>T(
AncK!$7ISN1E^4GC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<L
Eb$;6F_56"GRXuh$7ISN0d("EC`k*7GB,&[+>#Vs0d&P#4$%P&@;TRs+<VdL+<VdL:-pQUGAhM4
+E2@4AncK!$7ISN1*C+FC`k)^-Rg/i3Zp."4!6UG-Z4-KA2GYV+<VdL+<VdL:-pQUGAhM4+DG_*
Bm:'o-nlc"+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,3EGB.4K-QjO,67sC)DfTA2F*2),Bm:'o
%16uaEZd%Y0HanDC`k)Q+AP6U+E;O4Ch[KqATAo)EcQ)=Et&IoATAnI+>b3ODJUFC-OgE#ATAnI
+>=ol+CoA++=ANG$4R=j0H`(m0HanDC`k)Q.3L3'+>G!#+?MW%DIIBnF!)SJ+<VdL:-pQUASlC.
Gp%<LEb$;3Eb/isGT\DPDfor=.1HV40H`(m0HanDC`k*CGB.4N-Rg/i3Zp."4!6UG-Z4-KA2GYV
:-pQUGAhM4+E2@4AncK4-uNsGDK@69$7ISN1*A7nA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Z4-KA2>SU
+<XEG/g,@VEb$;,DJ!U-+=M,GF`)7L%14L;+>Y,o+CoA++=C\S-Rg/i3Zp."4!6UG-Z4-KA2,GS
+<Ve%67sC)DfTA2F*2),Bm:aKDJsZ8F"%P*%16uaEZd%Y1a"IpA8Z3+-ZW`F+<XEG/g,.V@;KXi
Bk;<-ATDg0EcVZsDImi20H`1p1E^4GC`k*GA1&KB%16uaEZd%Y0H`.oA8Z3+-Z3iM%16uaEZd%Y
0H`(mA8Z3+-[0TLDJ(=+$>sEq+>=ol+>P'MDJUFC@:s"_DC5l#+:SZ+0H`(m1E^4GC`k)Q.3L3'
+>G!#+?MW-DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DXATD7$.1HV40H`(m1E^4G
C`k*7GB.4M-Rg/i3Zp."4!6UG-Xq:?A2>SU:-pQUGAhM4+E2@4AncK4.!B0B@WNt-$7ISN1*A@q
A8Z3+-ZW`R-Rg/i3Zp."4!6UG-Xq:?A2>SU+<XEG/g,@VEb$;,DJ!U-+=MDEEaj)=%14L;+>Y,r
+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,GS+<Ve%67sC)DfTA2F*2),Bm:aKG%G]'F"%P*%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<7Cf>1hCLp4K@rcKeAU&<<:-pQ_A8Z3^D/X3$9jqOPDcC:m
FE8QIF=f'e+Cf(r@r$-.+EV:*F<G".C`mS'@rcK1FCf]=F!+t$DBL'2AI;1!/g,4DG%G2,@;]Tu
F(Jp#+C]U=-tI43.4ts&67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf+AtWo6s!8X<(.pKF`\a:
Bk)7!Df0!(Gp"MWATMs.De(OU.1/g:/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh3rK
67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JG2%AT0=X$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]
:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGOb67sB80lCoQ1,C%qE+EC!ARloqDfQsm
2_Rj=DKU12:-pQU0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0=G@rGk"EcP`/F<Dr?@<6!-$48I0
4Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&$8EYT3ZoV!-V@0&6VKp7;GTqmBkhQs?RH1jCh7$q
+=AND$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4
HW3F4<$5+=5uL[1/IDi,E+X>X/g)N`ATMs.De(4&$>"6#De'u4E+X>G-SR5%$49Np/g+\9Ch7^"
+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEsaWE>9IinF!,")CaM=g0d(ls
-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`$;No?+EMXCEb-A:@<-(#F`S[B@:O=r
+EV1>F<G[NE+O)C+<XEtFCcRe:IH=9De3ts:-pQU<^BDN6pXd@+AG-h;GSE779EMf/g)9.<$5+2
9i+Md+B)68;FOM,<(KG#<(0ng$;No?+@/pK6<R8V;]o.5<(J,t:*;i$;bobP5u^9@+B2K?73Frn
6q&4f:Jr<(5uUo/;FOP_8OZZG9J-ZI67sBPF<G:=+E_WGFDi:DBOr;Y:IH=JF(KAF@ps1iATAo8
D]j43Ch[EgFCcS:AU&;L$;No?+@0g[+EV1>F<G[NE+O)5@<,p%ATMp(DKKT$Ci"A>AT;j,G%#2u
DKI"CD]iM7FCfMG$4:?b+>b3[F`\a70Kh$9C3*m*BlJ/A4#/NP-S@#(+DN$?@rc:&F<G[:G]Y&\
/hSLYATAnM+E2IF+CQuf/gkIDFCf\E4#/QQ-S@#(+DbJ.AU#>>AU&;>/hSb($>"6#1a$a[F<G!I
4YA*qFDYhA4#/TR-S@#(+D>k6C`mh2G]Y&\/hSLYATAnM+E2IF+CR&h/gkm\CaV;"1cm';/hS8k
D/:>:AU&;>/hSb($>"6#1a$a[F<G!K4YA+(AU&;E4#/ZT-S@#(+E2.*Bl5&3Ch+Z1AU&;>/hSb(
$>"6#1a$a[F<G!L4YA*kH$!UF4#/]U-S@#(+CT;"BlnB(Ed8dDBleA=De:,$H$!V=+>,9!-OOF*
+>b3[F`\a72E`Z?D..I#A8c[0-Ta(B4!u.'/hS8`@<--oDg-(AFCf]=+>,9!-OOF*+>b3[F`\a7
2a&c9-ZsNC3%$dC3'/K1/hSb!F`_4T+C]V<ATJtH/hSLY$7IVj-Yd^4EbTK7-Rg/i3Zp7%0d&5+
+CoA++=CoF@rc:&F=.DD0fpb!@<?(*-Rg/i3Zp7%0d&5,+CoA++=Cu6FCf\E$7IVj-YRU=CaUYS
/NP"2+>Fuo1E^4GC`k*=FDYhA$7IVj-[9KE-Rg/i3Zp7%0d&5.+CoA++=DDNCaTQ<0fpb)AU&;E
.3L3'+>b2q+>PesA8Z3+-ZipEF=.DD0fpalH$!UF.3L3'+>b2q+>PhtA8Z3+-Xq@CAL@g50fpb"
@<--oDg-(H.3L3'+>b2q+>PkuA8Z3+-Z*:4CLh@-DC5c>0fpb*FCmK[.3L3'+>b2q+>Po!A8Z3+
-ZsNC3%#%?0d'\2@<=Xb+CQrT@50<A1+Zii/7C@d@5TTE2Cpmt2[Tme67sBkD]j.5G]\!LD..Nr
BKli7@<<VD3ZpV53Zp7%B4Z0-HS-Ks+Cno&$4:?b+>Y-YA0<6I$=dm`@<*J<-OL2U67sB4HW3F4
<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$=n*sATU7IF(o,<0ht%f.V*L>ATU7IF(o,<0d(Qi/KeM2
F(o,,-tI:<ATT@DE+*cqD.Rg#EZfF7F>%-;@;]^h+EV19FE9&A:-pQ?:-pQU@<6L4D.RcL$;No?
$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;/db??/db??/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f!WbFtt`Y:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB83,N)L1,0nL
:JXqZ:J=/F;BU'mF*)IG@:Wn[A-rZRDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*
$;No?+EqaECER>/+Cf5!@<*K"@<6!&DfQtBEaa$&+Dbt+@;KK^@r,^bEZc_W$4:9]@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/D
DeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$;No?+>%q>78m/.;cH%\
<.->*$?Tfm@rsjp+=D8BF*)/8A2#\b$4:?b+>P'XA0>u)Bk)6-+<VdL+<VdL+AP6U+E)41DBMhG
5t"LD9N_^?ATAo(E-#T4+=BHR6V0j/2((I?+<XEG/g+Y4DJjB7+Cf(nDJ*N'E+*cqD.Rg#EXE.K
67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(..*EZf:2+EV..@rrht+>Y-YA0<6I$>"6#A8lU$F<Dr/
76s=C;FshV-OOF*+CoG4ATT%B5uU-B8N8RT4#%(REZen3F(KG9-W3B45tOg;7n"de0a\7_67sBt
@;BEsEb/Zi+E).6Gp"[]@q]:gB4W30Bl%T.AmoCi$>"6#A8lU$F<Dr/76s=;:/"e<$>sEq+CoG4
ATT%B5uU-B8N8RT4#%'L:-pQUEb00.ASrVB+Co1rFD5Z2@<-W9BlbCp76s=;:/"dtATAo3A0>u)
Bk)6->9G^EDe't<-OOa&EZen3F(KG9-UCZu8P(m!-Ta!h$;No?+DG_7F`M%9FCfN8+D5_5F`8I7
G\M5@EscK!+CoG4ATT%B;FNl>=&MUh74/Es+BosD+Co&"+=D8BF*)&8Dfp"H$;No?+E_a>DJ()9
DfTB0+DG^9Ci<`mARlouDe'u#CghC+$>"6#-Xgb.A7TUf-QmANF<GI;?X[\fA7TUf?Q^^D$>"6#
B6%r6-Zip@FD#W4F`8]iDJWZgC2[WnDdm&r-RT6.:-pQUEb0&qFD5o0+EDC=FE8R6AS5^p+EqOA
BHS[O-OOF*+CoG4ATT%B;GU(f7Sc]G78bKp-UL*e;GU(f-OL2U67sBhFED)2E-*4ED]in*CLnW$
Ec6)>+EqO9C`m=uBl"o$ARf.kF(HJ4AftPkA0>o2Dfc>(ATAo1Ci^^HFCfN8B6%p5E$ku":-pQU
Eb0<'F<G[D+Eh10Bk/?,Df9_?@;]TuEb0)rCLnV?+DG_7F`M%9FCB3&ATT&,DerrqEZeq<BleB;
$8EZ-+DkP&ARoLq?X[\fA7$HAC2dU'BHS[O8l%iS78m/=FCfN8A8lU$F=.E,EZen3F(KG9-W3`9
<(9YW6q(!$4"#JL:IJ/N;cGDlATMs(E-#T4-OOF*+Dkq9+=D8BF*)&8Dfp"H$47,867sB4HW3F4
<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?
5s]U5@<6*B3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WL
DIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7
+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19
FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o
:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1-#dN:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2
@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b
+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO
:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaGDfTB0+E(j7G%#E*Dfp+DFEqh:Et&IcDf9H$Dg=K,+>=63
Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p,To$)%15[?@<Q3LBOPpi@ru:&4ZX]5BQ&);D09?%+EqaB
A0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-@r!G$$=n't@VfUpCisfADJ*m+A3Dsr.lne<+=fJ^$=Rdj
ATD="F?MZ--8#`7GA^i+ATL!q+?MV3@W-1$@W-N7Ao)BoFDYS38SDOUAOC->Ea`I"ATAo(DfoN*
AT2I.F*2A5Df9//@;TspEb'*1-OgDH0RInYE,9H&+E2IF+Eq^3D.Rbt$9g.jF>,j=+>=om0Hb">
F<GdF@;TRs%13OO:-pQUARoLs+EqaEA0<:<@;TR,@r,RpF"DEEG]YAWFCAWpAISu$+Bot0BQ&*6
@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl4"u#*DIIBnF!+[0ARloF0me!r%13OO:-pQUBl8!'Ec`FG
ATMs7+CT.u+CT.u+DkOsEc6".$9g.j0d(FXF<DrQATMs%CiF&r0JFk9-Vcu\+DG_2De!^.F!,R9
G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JOq:-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQ
ATMs%CiF&r0JY";-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'A_4#/NP
-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'D`4#/NP-SZ_o+>G5Q$4R>+0RImr4ZX]?+D58-
+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8@;Kmr@5'&<$4R>;67sBlA8--.FCfN8-uNI1ALqq7G]YAW
FCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd+[/KcDl4"u#'DIIBnF!+[0ARloF0me!s
%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs4ZX^6/g)tnA8Z3+-Z*:%Ec5B&E+iZ6-OgCl$;No?+D#(t
F<GF/@rcK1-uNI1ALq>0A7[<6AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsV
+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(1(=R"$4R>REZd.\De'u4A8,Oq%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eXD/X3$3B9*,B5DKqF$a;VBk&hN0ht%f.VER9@WOkEF(o,<0JO\l/M/(f@UX=l@j!14Ci<d(
.3N_DF*)IU%15is/e&._67sB[ATMs7+CQC)@;0P#Eb-A-DBO+2Ch[E&DIIBn+D#e>Ea`I"Bl@l3
A8-*pDg#]4ARlp-BOu&j$;No?+Dbt)A8,po+EMI<AKYo'+@:!U+@9X[DIm<nGpdYU8g%V^A7Zlt
DKKe>8hM5/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ
1,C%qE+EC!ARloqDfQsm2_Rj=DKU15$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3
D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0
-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R=O$;No?+CfG'@<?''@3B`)Eag/8
Bln#2DJpY1Ci<ckC`mn0EbSrkCh4`0AS,LoASu!hF"Rn/:-pQU@;Ka&FD,5.@<6L(B5V9k+DtV)
ATJu&Eb-A:@<-(#F`SZt+Cf>-F*(i.FE8Q6$;No?+Du+8AKZ&-Dfol,+CT5.ARTU%@<3Q/@;TRs
+EqL1DBL??Ci<d(.3N>G+CT5.Ch[Hk/e&/0ATMs'Df0W<@;^1.4ZX]A+?CW!%16N,/g+LUC,$/)
@Qc=d?T33g%16T./g)o*E]":5A3DOf?SQ+N%16]1/g+LU@PKeN$=u@Q+>P`t%16]1/g)ui3"63D
%13OO:-pQUF(fK7Ch+YtAKYQ$E--@JB5DKq@;I'&BleA=/Kf(FAn?!*FDi:>@;TQuBl5&8ASlB/
Ci<flCh4%_0KgXEHTE9^Ci<d(+=D8BF*(o1DKBo.DKKr,-S0@VE,9H&/14dP%13OOATD4#AKW@B
ATMs'Df0W<@;^1.-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?O[?TCi<d(;f-GgAO1BYBkM<;
0JH6g/h1LMDdmcdD/X3$6$%*]B5TCW0H_J\F=f'e+<YB9A8-'q@rrh9@<6L(B5VQtDKI!DDe:+7
+D5M/@UX'^$;No?+E_RAF`2A5A0>buD.Oi+BleA=DJsZ8F"Rn/:-pQB$;No?+@U<kDfQt2Bldd&
G%G]*A0>E*EbTE(+E_a:+E(j78l%htDf-[O3?V+-F<E=m0f:(.1-.9L3]&Q#$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG'@rsCb%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l-
D..]E1*C1CDII?tGp$^5GT_*ABlbD7F_Po*DI[5e$;No?+>Gfl@<jRb+CSek+E)F7EcPl)AKZ)'
B-8U/3[m3Q%15is/g)l.D..]F1E^1@@;]^h+E)F7EcPl)AKZ)'B-;;7+=K?5.6T^7/Kf+GAKYl/
F`&<r8Q\DL:KBn^%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2
AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mk&N%15is
/g)`m<(0_b+B)6*;H/&r%13OO:-pQUDJpY7Bm=3"+CT>4BkM=#ASuU2%16rdG\(DWDIdI%ARfgJ
F)u&.DGP%%4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$CO&&q+=DJRF`^thG@>,k
-OgD2Ap&!$.6T^7>9GF=0H_hf>n%-L4Y@j:%16Q-3Zp==2BWG9.1HUn$;No?+Du*?D/"6+A0><%
F(o9)D.RU,F!+n/A0>o(A9Dd#@;^00E+*cuDKKQ'F(KD%$>jL%ARnAMA8-'q@rt"XF(o9):MV[J
3]%s?+>=63-n%f$FD,T'6#pU\D.RU,F"&P$/g)hW$>+Eu@r$?Q/g)NfDfp//;g2Y_?RH9i-t[U>
@jsQ%+Bos=+>=of+C,E`-n$Jl@WcL'.4H\p4ZX]5@rHR#Dg<]>$7QDk%15is/g,"FG\(D.@<6L(
B5VQtDKKqB-t[U>@jrO7F!,UHARlomDffY8Ci<flCi"A>@;]TuB5DKq@;Kb*%16rdG\(DWDIdI%
ARfgJF)u&.DFJSdDfRNp3]%s?+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg
.Ni"+$7QDk%15is/g,7LATD?)@<,p%D/"6+A0><%F(o9)D.RU,F!+q'@psM$AKWC5F`(\<+DtV)
AISuA67sBpF!+q1FD)e5De!3lCj@.3DIal&Ci<ckCi"A>@<6L(B5V9k+EV:2F!,1<+E)$)$;No?
+DG^98g%ScF<GX@DfBZ@+DtV)AKZ,:AKYE&+D,&&+CT=68l%htBlbD,Df0&rEc,H!%16rdG\(DW
DIdI%ARfgJF)u&.DFJSdDfRQq3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2.6T:+0F\A$F`(\P/g)Nf
Dfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;YhVEcPl)AP$cMBl[cpF?sthBkM<<
4ZYDB3Zp*c$;No?+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z-r"8pBQ%EIEbBN3
ASuU2.6T:+0F\A$F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;No?
+D5M/@WNZ.Df9E4+D,P4+EqaEA0?&(Cis<1+DG^9@UX=h+Dbt+@;KKt%15is/g+VK+Co%q@<HC.
+Dbt7CER>/+EV19F<GC<@ps1b+D,P4+EV:2F!,R9F*%iu%15is/g,1GFEMVAF!+t2EcP`$F<GU8
F*2;@%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCG9*]5s]R/DeioE3B:Fo%16Ze+>GSn
B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0OI+36$$m]CLoLd3F=-C$>"6#B5DKqF!)iIBm=3"
8T&'QEb/a&6$%*]B5UL\0jd446$$m]CLoLd3F=-C$>"6#0eje`Ci<d(+=D#?G\(DWDIdI%ARfgJ
F)u&.DGP%&?U6tDF)>i2AN;b2?RH9i%15is/g+\9FCes(+Dkh;ARlotDIdI%ARfg)@<6L(B5VQt
DKI"=@;TQuF`V+'$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0OI+36$$m]CLoLd
3F=-C$>sEq+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0jd446$$m]CLoLd3F=-C$4R>;
67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,Et&IfEZf"2Ddmc1-VnnsEcPl)AP$cMBl[cpF?sth
BkM<<?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-VnnsEcPl)AP$cMBl[cpF?sthBkM<<?U6tD
F)>i2AN;b2?RH9i%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcdD/X3$6uQQh0MXqe.VER9
@WPIbDeioPDdtIT+ET1e+=Ll=Ddmc:+CoD#F_t]-F<G19@:sFgDKI"CATMrG+:SZQ67r]S:-pQU
<+U,mARlp#@<?($Bjkg#De!:"EcW@;DBN\4A1hh3AhG2tDKBr@AKY]/+EqaECND*;$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPP(@<jUb%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eX
D/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8
-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8
%16rdG\(DoF)u&.DJ`s&F?MZ-1E\_$0F\@a67sBP+D>2,AKYD(D/"6+A0>N$Ddm-k+CT.u+Dbt+
@;I&pF)u&.DJ`s&F=n\9F*1o-Cj@QSFD,B0+DGm+$;No?+E27;EZf7.D.Oi"BQ%TpAKYH)F<G[=
ATD?)@<,p%B5_^!+ED%%F)Pr;+D,P4+EM[8BHU`)F(o9)D.RU,F"Rn/DIIBnF$2,u4$"a5AKYE%
AKYW(Bl7Q+FDi:2AKYW%Ddm-kF!hD(-uNI1ATK:`3ZpO4@r,RkA7]h(Bl7K)B5DKq@;I;#$7QDk
%16T`DJ"$4Bl7QH3Zp4$3Zp*c$;No?+CT)&Dg*=@Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$?K]q
E+NisF)sJs+?V#]BldX&@rH=#DJ*<jF'j!,?Zg6nGAh8.-OgD2F(9--ASbq!F"'75+EM%2E+Nis
F)qct.1HUn$;No?+Dkh;ARlolF)u&.DJ`s&F<G[GBkM'iEcW@7EcQ)=%16uaEZf"2Ddmc1-Z*RB
ARo4jF(o9)D.RU,?U6tDF)>i2AN;b2?RH9i%15is/g,(UATDg*A7Zm*@:p]kCi"$6F!,=6G\(D.
@<6L(B5VQtDKKq/$>"6#B5DKqF!)i?Df000F(oN)?U6tDF)>i2AN;b2?RH9i%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,B6%riD/X3$0JH6g/h1LSE)UUlCLo1R+ET1e+=LlCE%)o>Eb/[$AKYQ$
E--@JB6%p5E-!W@$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is/g)8Z+>G;fFCfN8+Co1rFD5Z2
@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQU+<Vd^.3MMW5t"dP8Q8,$E-67FA8,OqBl@ltEd8dG
E+No>%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FBD..]F
1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,Rp
F!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g,(OASrW!DIal(DKBr@AKXl>
5t"dP8Q8+f$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$>"6#A8lU$F<Dr/76s=C;FshV-OgCl$;No?
+CfG'@<?''ASlC.Gp$a?Dfp".$>"6#B6%r64==c^Dfp#:F_kkJ-OgCl$;No?+CfG'@<?''ASlC.
Gp$a?Dfp"A/Kf.KBlbD/DfT\;De!:"EcW@6F`M26B-:`-D/^V<ATMs3Eb0;7De:,'D/aTB+D5_5
F`;C2$>"6#B6%r6-YII<F`;5@ChtgR4!uBb$4R>;67sBtF_l/6E,9).DKTc3F!,RCCh7WqFCetl
$>"6#B6%r6-YII<F`;5@ChtjS4!uC;-RUHR3\3C-/hd_A%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$
3B9*,B6%s-Bll[MF(o,<0ht%f.VEd@Ch[uX@<6-m0JO\l/M/)S@<6-m+EV19F<G16EZf4-Bl5&.
De*ZuFCfK$FCcS<ATD6&-tdR>Ch[u?/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lGDe*Zu
FCfK$FCcmD+CT.u+=LuCA18X8F!,:;@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(F<De!lC3=Q<j67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW*<-YdR1FCfN8ATAo.De*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,
4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8+=Cl<De(4)
$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX
67sB4HW3F4<$5+=5uL[1/I`$r$8EZ-+>Y-YA0<6I%16Ze+E(d54$"a(De*BiFs(O<A0?#:Bl%i<
%16Ze+EM+9C2[X!Blmp,@<?''-Y#1jFCf<.-OgCl$;No?+D58'ATD4$AKYetFCf\>AoD]4@;Ka&
B6%p5E-!.?DBNn,FD)dK+CQC&Ecl80BOu2n$9NSe+u(3]BQ&*6@<6K4B6%s-Blk[c+FPjbB6%r=
-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?YXLi@:s.MD/X3$6t(@^0JH6g/h1USA79+^;f-Gg
AOKsPF"f9jF=f'e-u*[2@:s.#+Cno++DG_8ATDs&C`m4rDJjB7+C\n)DImHhFD5o0/e&._67r]S
:-pQU@rc-hFCeuD+AZKhDdm9u+>Gc*+>PW)2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72e6K00JstjDg*=HF(oN)
+=M>CF*)/8A17rp:-pQU0emQaFtu$"F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]G0d(UX
A79RkA0>K&EZdss3%cmD%13OO:-pQ_78d#Z;E[2d-u*[2@:s.#+Eq78+ED%8F`MA6DJ()!0d((H
EZen$Gp$g=FCfK9@;L!;+:SZQ67sBk@<?'A+>Gbs:LeJh1,(C@+>>f:2)dQM1^sd$$=e!aF`MM6
DKI!K@UX=h-OgCl$8<Sc+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$8EYT3ZoV!-V@0&6VKp7
;GTqmBkhQs?RH9i@r,^bEZc_W%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OOATAo3A0<7AATMs.De(OU-OgCl$;No?+Cf5!@<*K!DL!?QH=_,8@:s.#
+EqaEA.8l#+Bot!AS`K;/g+\BC`k*OATD]tB4WG"$4R>;67sBpDKBB0F<G!7GAhM4+Du+A+EVNE
D..3k+DGp?0Han7H#k*HCh*t^H=_,8@:s.73Zp4$3Zp*c$=Q(M+F+D'@3@$B0ea%D.1HUn$>"6#
E-67F-[K?EDdd9i-OgCl$=RRY4ZX^#De*9hAKW@HATD]tB4WG"$4R>;67sBmBl\9:+CT.u+DbJ-
F<GOFF<G:8FCfK9@;L!-F(fK7Ch+YtAKWZ9$8<Sc+=nWs-o!eG0fq-51b!c43ZqjDAIStU$;No?
.Rm!34[(!/Dfor.ARlp/H$O[PD.I00AnE/r@<?(%+EVNEBl8$(B4Z+)+C\noDfTD3@ps1iBl7Q+
-tHb3@:s.#+DG^9-u*[2@:s.#%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgr
Df-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>CF*)/8A2#\d/e&._67r]S:-pQU<+oue+EV19F<GX7
EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08/e&._67sBPF<GX<
Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o+EV:.%15is
/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._
67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130f<B^B.u4Q$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E_X6@<?'k+D,P4
+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$9g.jDe't<FCfN8C2[W:
0IIuI+>Y-YA0<6I%13OO:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJATJ:f6;LBN5u^WS0KhH>0F\@U
:JXYM<)64C4ZX]?%15Et:J=GR;cGn@+?qJ$0eb:+1(=RW:JXY`5se764ZX]M/g*"o0f'pt+>OB5
%15[%<'aJZ9e\^k+>F<48PW5a5se764ZX]M/g*"o1F+\/0F\?u$:[]b5u^NL;cGn@+?)533B83.
+?qJ$1GCL-1,B@H%15Hn5uLBJ;cGn@+=B`'@;R-2BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`
+CoC<%13OO;cugo5sd^q+>Y-!2]s@gF#kEk+EqB>@<,p%F*VV3DesJ;@;]TuFD,*)+DGm>Anc-o
-OgCl$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj69iODF%13OO:-pQUF*)>@
AKYf-@ps1b+EqaEA9/l-Afu&5ATMF#F:AR*1E\_$0I\@s%16f]/g)BVCgTIo6$$m]CLoLd3F<nC
/i4\]D_;J++<Wj%HRD*F6$$m]CLoLd3@>qgF`\aDCgTIo6$$m]CLoLd3F<nC/i4"EAScF!BkAt?
,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_F(K&t/g+\C/e&.1+>=o\%16ZaA1e;u.1HUn
$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)F>,((-SZ`,+>G!667sC&ATMr9F(96)E-*H:
$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4CiaH3CLo1I4!6UG-ULU)9L2WR9e[\V:JXYM
<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2AM>Jn+?MV38PW5N<)64B+A#=-<'`iE74/NO
%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o@:O=r0IJq;0fpas/g)o*-OgDH0RGW!
E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1Bl7Q+@Wcc8De!:"E-WRIE+*6f/g*_.
@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,OqBl@ltEd8dGE+Nnr$>aWhA5d>`CLqU!F*'-3
67sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afr47@VTIaFE8QI
Bl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#gF!)TIATMr9+EM%5BlJ/:+Dbb-AKWC;
Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq:-pQUBl8!+A7Zm%FD,6++EV19F<D]I
@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]IDJj0+B+52C67sBsDe!3lAKYYtDI[6#
BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O%15is/e&._67sBhF)uJ@
ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2.:W?0K'@I:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!
F`:l"FCcS,DfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>+0RI_K
+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,@VEb'56De:,8@<-(#F`S[IH#R>9%16Q_Deq^=
:JEN+3Zp*c$=[plCdD#r9eedl+>F<4@W-1$9M&/^4ZX]M/g)l&0I&=^$=[plCfE\e9LV**+?qJ$
2'=V0+=&'b%13OOBl8#Y<)64B4ZX]?%16feFAtOm9LV**+?qJ$2'=\#0eb9j$4R>SCi<a(9M&/^
4ZX]E2_I*N+=/-p/g)r(0I&>/%13OO@q]:k9M&/^4ZX]58K_GY+EqL-F<F-t@;R,rARf.kF(HIc
+CoC5GA(E,+A!\dD^Pu$%170%D,`ef4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"F!+n/A0>u-
@<<W+F!,(/DIk1)$4R>ODg52[<CTG@3Zoh56;LBN9M&/^.4cl07SHTD<(ok^<%0@\;cugo5sc"f
%15is/g,4WDfTD3Ci<flCh4`5DfTB0+DGF1E,oN2ASuT!$7I\Q3Zp+*-RT?1BkAt?,Aq=)5s[eX
D/X3$3B9*,+DEGb+CoCC%144#4tq=25s[eXD/X3$3B9)I+E2IF+Du"&5s[eXD/X3$3B9*,+DEGb
%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+E-67FDJUG0/i4"EAScF!BkAt?A8a(0$6UHF+<V+#
ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?0RGMsE-67F-Za-CCLo5"ATMrI-T`\1+?^i%+AP6U
+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U+EV19F<GX7EbTK7
-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQE$-N;Df9H5D/X3$0df%*4$"`uDf9GX<)64B+C]8-
CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](DKJiD6;0fq
%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo+?MV3F)>i2AMI.qF*')YF)>i2
AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".$9g.j1a$a[F<DrPD/X3$0hl(dEc3WZ4#/NP-YY1U
1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9
+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO:-pQUCh7$uAKYMt@ruF'DIIR2+E)41DJX6"A7Th"
E)UUlCLo1R:-pQ_Ci<`mA9Da.;f-GgAM>e\F=f'eA9Da.+EM%5BlJ/:Eb0'*@:X(iB-;84Deio,
FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'
DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`
$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH0Js:H
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0fX#YGqq9#F`:l"FCeu*AoD]48g$)G0K1+qAS!nFEccCG-Y%1.@<?(&ATMs(
Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2
AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG@rc:&FE7lu
Eap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ
-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-Gg
AL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%159QHZ*F;-Zip@FD>`)0JFjs>9G^E
De't<-OgCl$;No?+EVaHDBNk0Afu20D.Rd1@;Tt)%159QHXq):ATT%B;FOPN8PVQA741/N%13OO
:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!
@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$
FCfN80F\@D+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sBkF_u(?@s)g4
ASuT4@;]TuEb0'*@:TfSA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO
:-pQUFEMVA+E)-?FD5T'F*(i-E-!.1DIal#F_u(NEb0'*@:TfS4tq=oE-#T4+=C&U<'a)N5t=?k
4#%0OA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]R/DeioE3B:G_Ddd0uATMrI0JR*P@ruF'DIIR2:-pQ_Ci<`mFCfN80JG4lBk)7!Df0!(Gp%2\
/KekJ@:UK8GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTf@<jU^+=Lr=De(:>Bl8$(Eb8`iAKYf-@ps1b+CSekARlp*D]iLtF(HJ'
@<?0*%15is/g)8Z+<VdL+<W(IDe*s$F*(u6.3NYBEHPu9ALD&"%15is/g)l'DJs\R1*C^YA79Rk
A0>K&EZdtM6m+093A*-=%15is/g)l'DJs\R1E\)ZDf^#AAT0(@Eb0*+G%G28+=M>CF*&iRA7]Rg
FCeu*/Kf+GAKYGnCi=M,$;No?+>G`gF`&rm+D,2,@q]RoB-8U%ATMr]Bk)7!Df0!(GsldlE%)oA
Ec5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l-C3=DL0Hat=FCSuuDJ((?8oJ6=Dfp)1APcfW
BLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l.D..]G0d(UXA79RkA0>K&EZdss
3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?+DGm>8l%iS
78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBQ:IH=HDfp)1AKZ28Eb'56/KenAEbAs)+E1b2BHUi"
@ruF'DIIR"ATJ:f:-pQU:LdmCF(oQ1@;Kb*+ED%1@;BEsFD,B0+CoV3E$07@+EVX4@r!2sBOPdk
ATJu.DBMPI6k'Ju67sBE0RIYFCLnV\De)dbF`Lu':gnHZ7!3?c4ZX]6C2dU'BHS[O8l%iS78m/5
.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.F*&O8Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22
A0><%+CQB%$;No?+CoV3E$043EbTK7F!,17+EV:.+=LuCA9;C(F=A>CAThX$DfBQ)DKI"3Bk)7!
Df0!(Gmt*E0RI_K+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7Bk(+EM(%
F=044+>b3RATT%B<+U,m6tp.QBl@ltEd:&qD/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%14J'
@j#i'@<<k[3Zp7%B4Z0--VA;f;f?f!@qAJFFD+'bD/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$
%159QHSZd_A0<77De*s$F*&c=$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq
4ZX]5FCfN8C2[W:0ddD;%16Ze+E(d5FC])qF:AQd$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>
F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+
,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!FCfN8+CoV3E$043EbTK7+:SZ+-nlf*0eb:1
+?DP+0KLX*<+U,m6tp.QBl@ltEd:&qD/]pk@rGk"EcP`/F<G[BE,9H&?U6tDFE1f2BK8(5?O[>O
$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0
@r#TtFC])qF:AQd$;No?+EV:.+D,P.Ci=N3DJ()+DKBB0FE8RA@;^?5F(oN)Ch4`*Bl7K)A7]gl
EbTK7Bl@m1+D,P4+EqaEA9/l;Bln$,F`\a:ATM@%BlJ0.Df0V=%16#s3Zr$UASrhY+>=om+>Y-X
De404+=ANG$<')K+B'C-INU%$0I\,n3Zrc%+u(3=%16Ze+>=ot+E2IF+=MRh+u(3=.3L/o+=K3'
-9Nn)0H_Se4s525+u(3=.3Nsi-8%J)HTE?*+B&^V%15is/g,"BEbAr+Bl5%c:IH=HDfp)1AIStp
-nlf*0I\,*3Zp+;.3M6$A5dDhEarZW@<?0NF_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo
3F<4&%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4
+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3
Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g*nb<(.p)8PN#B
+Co&"ATVK+FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9G%kA--rac!F@9hQFD5Z2@<-W]F_u(H
%15is/g+S?A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9FD,5.9L_Al/M/)eBOu3q-Z^D=+A,Et
+DkP&AISuA67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4F!,[@FD)e=BOr<-@;TQuDIIBn+CT.u
+Co1uAn?!oDKI"=@;TQb$;No?+Cf4rF)to6+CT5.ARTU%Bl5&(BkCsgEb0-1+Co1rFD5Z2@<-'n
F!,C=+EV:.+A,Et+E1b2BJ'`$:-pQU8T#YmBPDN1A8,OqBl@ltEd8cUFCfN8C2[W;.3L$\ATMrB
+DGm>@3B`)EagXD8T#X[$;No?+=M>CF*)/8A2>YWBlkJ3F!+m6DJsZ8/g+&'D/XT3DJ()+F<G7.
Eb-A6ASl@/ATJu9BOqV[:-pQU@Wc<2F!,RFBkM'iE\8J9BOu'(8LJ[m+D,>4ARlp*BPDN18K`4k
Cht52@;BEsF*2M7%15is/g,7LBlbD,@<6!&BlbD;AT2[$F(K62ARlotDBO%7ATME*B4YslEaa'$
A0>u*F*&O8Bk)7!Df0!(Bk;?<%15is/g*o-Fs&Or/0H]%0ej+E:-pQU0d'[CA7]R"-Zip@F=.M)
%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#TtFC])qF:ARgEZf4-CLnV9-OgCl$;No?+EM47
G9CC6F`);B%16Ze+EM47GApu3F!,"-A0?=D0F\?u$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16oi@:XIkF*')i11Y*/FD5Z2@<-Wg67sa(
Ddd0uATMrI0J[0Q@ruF'DIIR2+ET1e+Dbt)A0<UO+>P']ATMr9A8,OqBl@ltEd98E:-pQ?:-pQU
:iC;qCghEsF!,R<AKYo3A7]d(0mFfr+EV19F<D]:Bk)7!Df0!(GqL49@<-H4De:,6BOr;/Cgh?s
AI;1!/g+b;@<6-lCh4`2ATMr9@psFi/db??/db??/g+SDF*2>2F#jY'67rU?67sB'+>G;fASuF/
B4rE!G][A3F<G+.@ruF'DIIR"ATJu9D]iM3Bl%<&0eb:8.j0%SEb$;7ATMr9A8,OqBl@ltEd8!e
67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP;"Dg!lj$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]
:-pQU0emQaFttirEb0*+G%G2,@;^?5-uWp4C12-3+Co1rFD5Z2@<-W#:-pQU0f<]gDDF*mF`V,7
+Cf>-Anbn#Eb/c(8l%iS78m/.AoDKrATA,Q67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[Tn%
De!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$;No?+DGm>8l%iS78m/.@rH6sBkMR/
ARn"4/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-U
F(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<
De(4&$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL3&A8,Oq4ZX]5FCfN8C2[W:1+*D9:-pQU
DfB9*+CT@7D/XK;+>GbsA8,OqBl@ltEbT*+$:IHQ<)Yq@+FPjbDe't<-OOF*+E(d5-o!VB/gEbU
6W?u5HS.]X6W?tk$;No?+CoV3E$0+.FD)"mEZf4-CLnW#Bl%?D3ZohcE+*j%+=DV1:IJ/N;cG+n
+=nlnC3=E0/no'A-OOF*+>Y-YA0<6I$49Np/g+tK@:UK9+>J*`A8,OqBl@ltEd8"'EZf:2+EV..
@rr%b:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6"+0d'[C
Ddmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OL2U67sBsDdd0!
A9Da.+EM%5BlJ/$-n$bm3\W!*3]\B;3[l16Anc'm$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo
3F<+#:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2$>"6#
E+*6lA0>u)Bk)5l$;No?+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+DfTQ0B-:c+
Ec5u>+CT=6D..=-+EqaEA9/)Q67sBhEb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)ATJu&
Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD#0d'[C0Hb"EDdmc74s58++CoA++=AND$;No?+E1b!CLePr
DIal,@;BE]ATAo4@:O(`+EV..@rr&hEZf4-CLnV9-OL2U67sC%BQ&);@rHL-FE7e#EZen,A0?=D
0FA.uEb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FR
Ci<`mFCfN80JG:nBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C)A8,OqBl@ltEd8dL/M/)]Ddd0!0mFfs
+EV19F<G+.@ruF'DIIR2/db??/db??/g*u/E-5u*FCfM9+EV:.+E):2ATAnJGT\dbFCfN8+<Y3/
@ruF'DIIR2/g*u!Ec`FBAfu2/AKYetEbAqj:-pQUAn>ClBjtmi+EV19F<G(%F(Hs2:-pQ?:-pQU
@<6L2F_t]23XSVK/db??/g)kt+=M>CF*)/8A2#_hFCfN8C2[W:1+=>SEb-A0Ddd0fA-u'u/db??
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emQaFttcZ:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB8
2/78O1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrqEXGQ./g)l.D..]G0d(UXA79RkA0>K&
EZdss3%cmD$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$:-pQUBlbCh:IJ/N
;cFlLDf00$B6A6+A3UDQ/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5$4:9]@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/D
DeX*1ATDl8-Y[=6A1%]k$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL3&A8,Oq1-IZ@-Zip@
FD>`)0JY!_FC])qF>H'@+=D8BF*)/8A2#ee$49Np/g,(OASrW4ATMr91*C+A@ruF'DIIR2+D,2,
@qZunE,]i9GT^[.Ch=f6DfTB0$>"6#De'u4A8,Oq1(%T5+BM?:6rQ60+CoA++=AND=&2^^;a!/a
I4eSs;FFFj=&2^^;c?+Y4ZZY?;FFGH3ZqL";FFG+H[[(c-p0+I/NP=*=&2^^;^jpU=&2^^;[Nk*
:K0J<+>to-+AP6U+Dbt<+EM7CAI8cb@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^
;^ii9/g+4k;FFFj=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:6rOFI+BosE+E(d<-OL2U67sC!
E+No0@;]Tu@r,^bEZccPATMs.De(XQ$>"6#De'u4A8,Oq1C>iZ>9IinF!,")CaM=g0d(ls-8%J)
Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;K`$>"6#0H`)(+E2IF+@JXf;[P6%>9G^EDe't<
-OL2lEZf:2+EV..@rsI5Eap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB
:JsSZ$<L#$6rQ60+=KoZ<'2cX=&2^^;^ii;/g+4k;FFFj0d'[C1E^UH-RT6.ATAo3A0>u)Bk)6@
$>"6#0H`)(+E2IF+@JXf;[P6%>9G^EDe't<-OL2U67sBmATVEq+CQC/Dfd+?Afu56F`V,)+>P'M
Bk)6-GAhM4F!+n/A0>o$DId[&Cj@.DAStpnAI<!h+E(d5FC])qF>=2):JsSZ4ZX]6I4cXQDJUFC
-Rg/i/g+4k;FFG^78+&/@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k
;FFFj6q'RD4ZX]6-nlcj+u(3.77L3)+=nil4s2s30d(.AA0<9F6q'RD.6fOu3@Q(!4CL940I_Dm
6q'RD$8EZ-+>Y-YA0<6I$4:?b+E(d5FC])qF>F88EZd%Y0ea_hF`\`o77L2_$;No?+E1b!CER/%
@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-EscK!+E1b!CLeQ0A8,Oq1C=Ia
67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@K
DfTB0$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"D
A7]7e@<,pi/da<U>9GUBB5DKqF!a'nI4cXQDJUFC-OL2U67sC"@:O(`+CT.u+DkP&AI<!h+E1b!
CLeQ0A8,Oq1C@]6+DkP&AKW?J$49Np/g,4KDg*=6Dfor>EscK!+Co1s+FYFe$4:?bAT)O!DBLV?
$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,0Ddd0uATMrI0Jm<S
@ruF'DIIR2:-pQ_Ci<`mFCfN80JG=oBk)7!Df0!(Gp%2\/KekJ@:UK8GT\gcFCfN8+Co1rFD5Z2
@<-WG%15is/g(T1:-pQU:iC;qCghEsF!,R<AKYo3A7]d(0mFft+EV19F<G+.@ruF'DIIR2/g*u!
Ec`FBAfu2/AISuA67sBs@<-!l+D,1nF(o*"AKZ)+F*&O7@<6!4%15is/e&._67sBhF)uJ@ATKmA
$;No?+:SZQ67sB'+>G;f.!9WGCi_.LATMs.De(OV.3N&>AKYf-@:Wq[%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;DJs\R1(=Rc67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB82/78O
1,^7tF(KA7@rH6sBkMR/ARloU:IJ/N;cFlODerrqEX`@N67sB83,N)L1GL"pE+EC!ARloqDfQsm
+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g+kL+A,Et
<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OOFC])q
F>5p>+=D8BF*)/8A2#_c%172fBk)6A4ZX]5FCfN8C2[W:1a`_>%15is/g+tK@:UK/F`_>6F"&5D
Ec5e;A9Da.%16Ze+E(d5-ZsNFCi^s5$>"6#D..3k+D,>(AN`'s-u*^0FD)dEIS*C(<(0_b-RgSo
05>WICG'=9F!hD(0d'[C1E^UH+=ANG$4R>;67sC!E+No0.!0$AFD>`)1asPUDIal"Ch7$q%16Ze
+E(d5FC])qF>OF60d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc
.3gr&-OgD2-nlf*0I\,*3Zp+;.3L`bBl%>i$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&
0d'[C1E^UH+=ANG$4R>;67sC!E+No0FCfN8+>G!LBk)7!Df0!(Gp$^1FCSu,@;p1+Dg3C<@;KNu
GAhM4Et&IfEZf:2+EV..@rsF7$>"6#=&2^^;a!/aA8Z3+-RT?1=&2^^;a!/aI4eSs;FFFm$<L#$
6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%215V5#G,?IZ=6rPO!,?IZ=6rOO%%15d)<'<8b2D?g-
:-pQUCi=D<F(or3%13OOEap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB
:JsSZ%1604;FFGH3ZohE:K0G/,?IZ=6rPNWI4cXD:JsSZ%14g4>9G^EDe(4C%13OOATAo3A0>u)
Bk)6A%16Ze+>=om0Hb=WF<Et?7T0a'0d'[C1E^UH+=ANG$4R>REZf:2+EV..@rsF7$?BW!>9G;6
@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]69M\VM/gFFn
;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De'u4A8,Oq1^se'EZd%Y0ea_hF`\`o77L2b
$8EZ-+>Y-YA0<6I%13OO:-pQUAn?'oBHU_+Ci=D<De:,7DKU#3A0<TLA8,Oq+EqaEA9/l%DIal1
@;]UoD/=J?Eb0,sD.O.`ATAo3A0>u)Bk)6>%1604;FFGH3Zoi!/g+\BC`k)Q.3L2p+BM?:6rR#Q
9FV>L@j"tu-ZW]>6q'RD-TsL50H`)(+D58-+=KoZ<'2cX=&2^^;^ii9/g+4k;FFFm$:I<P;a!/a
-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpcAN;1^-p1p!4"r+3+@JXf;[j'g+BosE
+E(d5-RT?1%16Ze+E(d5FC])qF>OF6ATAnI+>GPmE-67F6q'RD%13OO:-pQUE+*6l+Co1rFD5Z2
@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!CLeQ0A8,Oq1^sd$$;No?
+D58'ATD4$AKYDtC`m5.Df]tBEb/ioEb0,uATJtG+DGJ+DfTQ0B-:c+Ec5u>+CT=6D..=-+EqaE
A9/1e:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6
ARfObEb/c6%14g4>9GUBB5DKqF!a'nI4cXQDJUFC-OgCl$;No?+E1b!CLePrDIal,@;BEs%16Ze
+E1b!CLeQ0A8,Oq1^se'EZf4-CLnV9-OgCl$;No?+EM47G9CC6F`);B%16Ze+Co1s+FYFe%13OO
ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU
$>sF!A5d>`CLoh@A3k6KF_t]-FE9,i:-pQ_DIn$&;f-GgAO9g96#pU\D.RU,F"f9jF=f'eBl8*&
Ch[E&-uNU?A18X0EbBN3ASuT4FCfN8F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zq.*Gp"h%3B83)%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++:SZQ67sB72f<PW+<VeLE+EC!ARlp*D]hYJ
6m,)EG%G]8Bl@l32D-[=.h)h\67sB72e6K00JstbDfT]'F:ARP67sB80lCoQ1,C%qE+EC!ARloq
DfQsm2_Rj=DKU15$;No?+>Gim@<jX`+E_X6@<?'k+D,P4+A*b9/hf3n$4R>;67sB[BOr;uDes6.
GA1r-+DG_4F`_[IF(fK7Ch+Z/ATN!1F<G:8+D#S6DfQt;ATMp$B4Z-,-uNU?A19,?$=e!aF`MM6
DKI!K@UX=h-OgCl$8<Sc+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$8EYT3ZoV!-V@0&6VKp7
;GTqmBkhQs?RH9i@r,^bEZc_W%13OOEb065Bl[c--YdR1FCfN8ATB.-$;No?+D#e:ARfgrDJ()0
DffZ,DJ()$F`\a;EcQ)=Et&IuATMs)DK]`7Df0E'DKI!K@UWdp4"!Wr6miEN:-pQU/ULGc;cFl<
<'aD]I4Ym8%15is/g)Q[ATqZ6+CSbiAT2a4+E).6Gp$R4@r*8>/KeM@G\(D.Ch[s4F!,C5+Cf(n
Ea`I"ATAo0BleB;%15is/g+bECi"$6Bl7Q+@<-"'D.RU,F!,O;Dfol,+C\n)Eb/us@ru9m/e&-s
$;No?+Du==ATDKp+CTA1D0$-nATAo2ATqZ-0F\A#EZf72G@VgP%16Ze+Dtb7A0>58%16Ze+Dtb7
A0<W`/iO4HATAo2ATqZ-3,18Z$>"6#DIn$&+>GK.3B&j-1,KFIATAo2ATqZ-0mGDq+<VdL+<XEG
/g,7LAKYl5D.7's+Cu[0DBMO\$>"6#DIn$&+>dMI1^se'EZf72G@VgU3&ilW3&iiU2`EZS3B9)[
3B9)[3B9)[3B9)[3B9)[3Htu?ATAo2ATqZ-0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU
3&`fU3&`fU3&`fU%13OO:-pQUF*VV3DesJG+E_R9@rGmh+:SZhEZf72G@Vh;3[Z%fDffE*@;TR'
%16Ze+Dtb7A0?"U+=D&FF`(o'De*Es@;TRs-OgCl$;No?+Du==ATDKp+CT;2@<lo:-ura6A8c<-
F(f!$ATJu&DIal2BmO?3.1HVqEZf72G@VgE5:A`Q.3gVt,VTZ7ATAo2ATqZ--pK+E1asY*.3p\Y
$>"6#DIn$&+=KH&5;Xf61FXSV1CX\&EZf72G@VgE5:A`Q.3gVt,Vh/.2[p+*EZf72G@VgE5:A`Q
.3gVt,WKNq%16Ze+Dtb7A0<9b-pKO;,;Ubo0ePFG2`>5&1^se'EZf72G@VgE5:A`Q.3gVt,WIbC
3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+Dtb7A0<9b-pKO;,;Ubo0ekF=1G^jE
2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`fU%13OO:-pQUASlC.Bk;>p$>"6#DIn$&
+DEG^%16Ze+Dtb7A0<6I%16Ze+Dtb7A0>;A%16Ze+Dtb7A0<WP@6+i)ATAo2ATqZ-1F$<h%16Ze
+Dtb7A0<QO1+kNq$>"6#DIn$&+>=ol,VTZ7ATAo2ATqZ-0H`%p-RpJQ$>"6#DIn$&+>=oq,WmGh
F`VXIFCfN8Bl7Q2%16Ze+Dtb7A0<`P0H`.s2BXh!3=Q<)$;No?+C]80A7]dtBl7K)@psFiEt&If
EZf72G@VgM4!uBu+<VdL+<VdL+AP6U+Dkh;ARlon@<6"$%16Ze+Dtb7A0<6I4!uC;0F\A#EZf72
G@VgD-T`_=4==TVD^Qtq-RT?1ATAo2ATqZ-1HQs34!uBb$>"6#DIn$&+=ANu-RU#Z+<VdL+<Ve%
67sBhCi+*3F<G(3EcP`$F<GIDCht53@;TR,+Du=<C`mP4@psInDf-!kATAo2ATqZ--RUu'-T`\'
+<VdL+<XEG/g+S=D/XK;+Cf>1Eb/a&+Du=<C`mV(D.P7@Ci<flFD5Z2/0JJA@s)X"DKK</Bl@ku
$>"6#DIn$&+=CW:D^RUo-QjNS+<Ve%67sC(@;KXg+DtV)ALnsAF_kk:Ci<flFD5Z2%16Ze+Dtb7
A0<6I4""N!>^1L&Df7!G+<XEG/g,%SCht53@;TR,+Eh10Bk/?&De!3tBl@ku$>"6#DIn$&+=ANu
-RUu'AoDg4+EM%2Eb-A%DIakB/hSLo:-pQUDKTc3+DtV)ALqY9@psInDf-\9CER/+@s)X"DKK</
Bl@ku$>"6#DIn$&+=A9Z4!u-u+<VdL+<Ve%67sBiCgh3sEt&IfEZf72G@VgD+<W$n-Qjcu-QjcG
$4R>;67sBlEZf72G@VgDFCfN8-QjNS+<Ve%67sBuD]ik7@psInDf-[L+EV:2F!+t$F(HJ.Et&IO
67sBuD]ik7DJ*O$+CT.1ATDg0EZed5A8,OqBl@ltEd8dAF!,@=G9CC9ART[lA0>T(+CQC'AS,@n
Cig*n:-pQUA8-'q@ruX0Gp$pA@psInDf-[?-q[ocF^]<9+>PW)0I[G<%16Ze+Dtb7A0<7/@:UKj
BOPq&+C$9'$>"6#DIn$&+=Aim-OgCl$;No?+Dbb-AScW7FEqhDEt&IfEZf72G@VgDFCfN8-T`\\
H?s[OE$lbN:-pQUA9)C-AKYf#FED)7+ED%5F_Pl-A.8lWEZf72G@VgDFCfN8-T`\hATD?0+<VdL
:-pQUE+*j%+Dl7BF<G%(+EDC=FCeu6+D!0</g)8Z>\I\hAISuXEZf72G@VgDF!j$sF!i(Q+<VdL
+<VdL:-pQU+<hpP%16Ze+Dtb7A0<7AATMr@4""N!BOu3q-QjO,67sB'+s8'=$>"6#DIn$&+=D8B
F*&ck-Y#1b+<VdL+<XEG/g)8\+<h7%ATAo2ATqZ--Zip@F=0-t@ldjB+<VdL+AP6U+<Y]CDffQ$
+C]J8+Du*?A8-'q@ruX0Gp%!5D.O.`%15is/g+kGG%#3$A0>E'Bm+&1DIIBnF!)l,;]oU^E+Not
ASuT=%16Ze+Dtb7A0<7AATMr@4""i_DJ+-2CisT+3a?oSDJsW%DeiTlDHqC"DE0R%%16Ze+Dtb7
A0<7AATMr@4""N!3a?oSFDkE$@;^?q@rH1%DKB&1%16Ze+Dtb7A0<7AATMr@4""NC3d>mkDd7C)
@;^.*Df]K#>[q\gDf/g$CghBu-OgDoEZf72G@VgDFCfN8-T`\\3d>mkDd7C)@;^.*Df]K#>[q\g
Df/g$CghBu-OgCl$;No?+A$Ho@;KXg+Cf(nEa`I"ATDi7Bl5&2@;TRs+CT.u+E1b2BQGd8$;No?
+@KpRFD5Z2@<-W9DIIBnF!+n3AKYT'Ec#Au+D,Y4D'12K>@B+0?!B!73F,iT/QuF-%15is/g+S?
A0>i"FD,_<Bl7EsF_#&+FD,5.@:Wn_FD5Z2@;I&rBOPpi@ru:&F!)l-5u^BB85`A8+<Yc>Bla^j
:-pQUBlbD*+<kl8An<//F*1r5ATT&5Afu2/AKYJr@<,ddFCfK6+EM[EE,Tc=ARlomGp$sBF*&O<
Df^#A/e&-s$>"6#DIn$&+=JUTD]ik1DIjr%DIdf9/43;d-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze
+Dtb7A0<9JDJpY6Bl7K)ASu%"-S.V_9L^Q\E,9)oF(H^J4""N!>^C^<Df@'5$>"6#DIn$&+=JUT
D]ik1DIjr%DIdf9/5/Ma-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7A0<9JDJpY6Bl7K)ASu%"
-S/4_67aL'Ch7$rALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN+EM@-F(f-++C$%'DBNh*D.Rc9
.6Ane3a?uWFDl+G%13OOATAo2ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/43;d-Z!@8F!hD(ATAo2
ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/43</7P#p'ATMo?%16Ze+Dtb7A0<7/@:WhcH#k>p-Y#2B
H?s[OE$m295sd+MCh7[/-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$?'HR
D/X3$6#pU-@;0O30MXqe.W8irD/X3$6#pU-@;0O30HbHh/KeM2F(o,,-uWWF+DG_:@;KXg+CT;'
F_t]-F<G[:F*)IU%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
:LeKb@V'R&0f_6S%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R3$<?_A79RkA0>K&EZdt502-(tFa+?&:-pQU
0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0FJ%15is/g+,,AKYT'Ci"$6Bl7Q+Bl7m4FE8RGBQ&$0
A0>o(F*2;@+DG^9ATDg0EZf41F)tc&ATJtBDIn$&.4u&:%16T`@s)g4ASuT4-XpM*AL@oo%14d3
4Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&%14g4/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$=dm`
@<*J<-OgCl$?B]tF_Pl-+=CoBA9;C(FCfJ?%15is/g+_ME+NO$Bl7Q+AmoCiF`M&7%172gF*(u2
G%ku8DJ`s&F<Dr?@:U`I-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+=M/=.3N&/@qBV$
F!,C=Cj@.5Cj]].@r*8>/KeP:@<,ddFCfJ8Ch[s4+CT.u+C]86ARlp"BleB;+:SZQ67sC!AftSs
@<,ddFCfJ8Ch[s4F"SRX<affYA0>Ds@ruF'DIIR2+DtV)ATJu2F`VXI@;L"'+D#e3F*&OCD@HqJ
67sC&BOr<'@<6O%EZen,@ruF'DIIR2+DbJ-F=n[Y7<W6_H$!_6DJ()'Cia/1F(fK7Ch+YtAKZ#9
A7]S&%15is/g,1GC1UmsARmD&$4R>;67sBuF_t]1Bk&8oFDl#;%16Ze+E(d50F\A#EZf:2+>XH6
ATAo3A0>58%16Ze+E(d51,COA%16Ze+E(d53,18Z$>"6#De'tF/iYjM2J"X#%16Ze+E(d50mGDq
+<VdL+<XEG/g,7LAKYl5D.7's+Cu[0DBMO\$>"6#De'tI@<+16$>"6#De'tM3&ilW3&iiU2`EZS
3B9)[3B9)[3B9)[3B9)[3B9)[3Htu?ATAo3A0<T]1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU
3&`fU3&`fU3&`fU3&_9R%15is/g,%SD.Ra%@j#3#Eaa67+=M,GDBNh>Cht57@;]UoD'3n5@;oe!
+CT.u+EM7CATK:0$>"6#De't=4utnV5;Xf61FXS'%16Ze+E(d5-pB[V-pKO;,;Ubo1CX\&EZf:2
+=KE75:A`Q.3gVt,[W>:$>"6#De't=4utnV5;Xf61FXS)1G1Tq$>"6#De't=4utnV5;Xf61FXS/
C,?A,ATAo3A0<9a3^5#W1asY*.3pW#3&roUAMQ(O$>"6#De't=4utnV5;Xf61FXS/3&ilW3&iiU
2`EZS3B9)[3B9)[3B9)[3B9)[3B9)[3Htu?ATAo3A0<9a3^5#W1asY*.3pW&1,:XA1c.'I2E!KQ
3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU3"63($;No?+EMgF@W-((+CT.u+E_R9@rGmh+CT;%
+D,P4@VK@`ASqqaATAo3A0>qS4=>2gGB.V>B.",qATAo3A0?"U+=CW:D^Pu$%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%17&sFA?7]AQ3A\ATMs%D/aP_@<6-m0JH6g/h1g_FA?7]
AQ3A\ATMs%D/aP_@<6-m0JFVk/M/)S@<6-m+Eh10Bk/>7E-67O+DtV)AKZ)/D.Rd1@;Tt)+EV19
FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"5R+DPk(FD)eG8l%iS78m/.A8-'q
@ruX0Gp$d/F!+q'ASrW3ATTO6$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/78M0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCeu*AoD]48g$)G0K0FJ
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC)AKYl%ARlol+Cf>-
Anbn#Eb/c(A8-'q@ruX0Gp!P'/M8.o>p(^[+DPk(FD**G-[nZ`6rZTR<$r+^%13OO@rGjn@<6K4
FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4
<$5+=5uL[1/I`$r$;No?+CfG'@<?''DIn#7FCfN8+Co1rFD5Z2@<-W9%16WfDIIBn4ZX]5FCfN8
C2[W:-S-Z#1-[KK.=37"A8,RlF_tJoC2[Wi-RT?1A9;d!FD*fu+=M>QCghBu11+I)De*2tC2dU'
BHS[O8l%iS78m/5.4f"ODIIBn+:SZA0RI\KG@Vh,FDbN(ANOFEE+*j%%13OO4tq>%A0>E)DIIBn
%13OO:-pQUF*)>@AKZ&4D.Oi6DfTB0+>"^YF(oN)+A+#&+F5/HDe!3lAKYE&+E(_(ARfg)F)Q2A
@q?)V4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>=o\:-pQUDJsZ8Et&I?0RG0n-QmAN
F<Du;+F>_i+>GPm4>%a$.3NME?[?'%0d%T667sBhA9MO)@WMtc4tq=2H7'hSF`\`S>p+JHINU@!
+?V8!,:OaQCgVKq+>P&^:-pQU@rH7"F`(]2Bl@m1%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af
+Du"&H=%dN+<XEG/g,=KEaj)!$4R>;67sB\<'qd=@<?''@;]TuFD5T'+AQK^C`l#aD0'f>Df021
F*(u4E+NQ&Df-\>BOr<'Df9M&$>j^"DKBo2E'66)DJs`2A7&b[De*2t0f_-P+?(Du0d&4o2)ZR2
/hd_A%15is/g,4HF<GdGEb$;7Bl.F&FCB$*F!,RC+D,>4ARlp,@;L't%17,c+Bos9Eap50FE8fm
3Zp+!?SOA[B4Z0-I4cXQDJUFC-OgE#FE9T++=K?#,Wd`-DKKqK,].I<DKBo2E%)nX0e%MnDKKq/
$9g.j0Ha^W1a$a[F<GICEt&Hc$;No?+CoC5FD5T'F*(i-E-!.=@<?!m%14J'@j#Z2F!j+3+>=pF
0f1"cATT&C/g+\BC`k)Q%16rjDf0W<AT/bT+=oT/HZ!qH%13OO:-pQUF(KG9@rH7"F`(]2Bl@m1
+DbJ-FDuAE+EVNEAncL$A0?&(Cis:u$?BW!>9G;6@j#Z2F!j+3+>=pF0f1"cATT&C/g)hj0d&4o
A8Z3+-RT?1:-pQUFD5T'F!+t$DBND"+Eh10Bk/>uF`_bHAKYMlFCfM&$?'B^D..'qDIksl+Du+A
An57WC2[Wi+>PW*2]sgt1,'h)+>=ol/heCj%16upF$2Q,-p/n3HTNs/DKKqK+=oPr.!n!#4#))"
FE8lVDdm-l@:sLrALS`M0e%MnDKKq/$9g.j0Ha^W1a$a[F<GICEt&IO67sC&Bl.F&FCB$*F!,=B
F*&OA@<?!m%14LF0mde[F"&4`3Zoht3[?dAHZ!qH.3KiZ0d(=ODf0W<AT01]Ddm-l@:sLrAIStU
$;No?+ED%8@;0U%FD5T'F*(i-E-!.9DBNJ4D/aP*$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$9g.j
A7dtc+DkP&AKW?J%159QHSZd_A0<6I%13OO:-pQUF(Jj"DIal-ATo8=ATMr9A8,OqBl@ltEd8*$
A9;]tD.PIc3ZoelATMs.De(OL/1<5.5;=oBHQkL]Bk2+(D-p^dDe*3&-OgDnFDtZ1BJM_3+=M>Q
CghBu11+I)De*2tC2dU'BHS[O8l%iS78m/5.4f"ODIIBn1*@#54tq>$ATqZ-A9;]tD.PIaA9;d!
FD*E=$9g.jDe'u$FDbN(AMO]%%15is/g+tK@:UKkF_u(?De:,(Bl\9:+Co1rFD5Z2@<-W&$7I;V
+Z_;++?DP+0KLX*HTG\L%14g4>9IEo@s)g4ASuT4-UC$a@UX=l@lZP0-OgCl$;No?+CT)&+EV=7
ATMs%D/aP=Ao_g,+C]82BHUi"@ruF'DIIR"ATJu2F`VXID..NrBFP;jF##m>+D58-@;Kb%F'i9K
94)$u:IK,1C*52>$9g.jDe'u$FDbN(AKY2"1E^UH+=ANG$?U>D4ZX]uATV?sCij`*?VO1#?V4*^
DdmH(0F\A2F"ndh3ZrNc1(=R"$;No?+Co&)FE2;F+EV19F<G+.@ruF'DIIR"ATJ:f4tq=>+ED%+
A0>E)DIIBn+BosE+E(d5-RT?14tq=>+ED%+A0>E)DIIBn1*@#50d'[CEc#i8Dfd+4FDtZ1BHR`k
0d'[CEc#i8Dfd+4FDtZ1BJL#(%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?f<F*(qZ@<6-m0JQ<h
/h1mQF*(qZ@<6-m0JO\l/M/)S@<6-m+=M8AF*(qA+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;%15is/g)8Z1+==o
8l%iS78m/7+D,P.A7]d(@rH6sBkMR/ARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C9%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R3?WH`A79RkA0>K&
EZdt502-(tFa+?&:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$
ATVL)FC])qFD5Z2@<-'nF!hD(:-pQU0fX#YGqq9#ARoLs+D,P4+EMgLFCf<1+EqOABHU;M6QgPj
CisT+Et&IO67sB83,N)L1GBq[A867.FCeu*FDi:3Eb/[$AKZ)+F*&O8Bk)7!Df0!(Bk;?.Bl5sS
C2dU'BHS[O8l%iS78m/5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tD@UX=l
@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<
De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>Q
Bk)6J3ZoelATMs.De(OU-OgE)E+X>X3ZoelATMs.De(4)$4R>;67sC!E+No0@3BZ'F*&O8Bk)7!
Df0!(Gp$O5A0>i"@r!3$F=n"0ATAo3A0>Ds@rr.eATAo4@:O(`+Co1rF:AQd$;No?+Du+A+DG_7
ATDl8F)Po,+Dtb6ATAo&AS,k$AKZ&*ASrW*F`(t;GAhM4%15is/g+kGFDi:DBOr<.ATMr9A8,Oq
Bl@ltEd98H$7Ke'GA^i+AN`'s-XeAR+<iihA8,RlF_tJoC2[Wi+>>5e4ZX]A+?CVm1*A%hGpa%.
ATAo8D/a<0@j#`5F<GI4GA^i+AISuXEaa$#+Dtb7DIIBn%16Ze+EVI>Ci<f+B4Z0-DIn$0@;TQb
$>"6dF(HJ3ATr$#D.O.`%15is/g,1GF*)>@AKZ).AKYr4AThd+F`S[7@:O(qE$-_TBlkJ.De3u4
DJsV>@rH7,@;0Tg$;No?+EV:.+Dtb7DIIBn%16Ze+ED%7FCZM)Bk)5o$>sEq+D58-+Dtb7DIIBn
%16Ze+>Y-YA0<6I%13OO:-pQU@q]F`CERY/F*)>@ATJu+Ec5e;@<<W.ARTY%+EVgG+Eh[>F_t]2
%15is/g,:XBl7Q+F`(o5F_)\+Bl[cpFDl2F+CT.u+Co1rFD5Z2@<-W9DIIBnEt&Hc$;No?+Eh[>
F_t\4BlbD9@<-H4De:,@8l%iS78m.p$;No?+Eh[>0g.Q?-Y#1b%13OO:-pQU<DGn(E+*j%F!+n3
AKYl/F<G".G@>c<+E2@4F(K62%15is/g,=UCbe.7+=CE!E,K**0J[6]10eL2D.QseDeO#D0JG1c
FCf<.-OgCl$;No?+APL&:`sk(ART?sAoD]4Ch[d0GT^F4A0?&6CisT++Cf>-Anble$>sF!A8,Oq
4ZX^-E+X>G+<iihA8,RlF_tJoC2[Wi+>=63ATAo2ATqZ-DIn$&Bk)6H-u*^0FD)dEIS*C(<(0_b
0./2"DIn$&Bk)5o$>sF!ATD<q@rsjp+EVR7GUss]3ZqsIA8ZO,?X[\fA7$H5%13OO:-pQU<DGn(
E+*j%Et&IO67sBlEZf72G@Vh6ATq^+DIIBn4*GOY1+XeXFCf<.>UM(?ATq^+DIIBn%13OO:-pQU
G&M2>D.OhE%16Ze+E(d5DIn$&Bk)5o$>"6#E+*6lA0>c$G@YDtF:ARgEZfI@E,9H&+E2IF+=D&<
GA^i+AL@ooATAo6ATMs(+Dtb7A8,Oq%16uaEZf"+F<GI4GA^i+AISuXEZd.\De't<-OgCl$;No?
+Eh[>F_t\41*BRl6Qg>VFD,_)$;No?+D#R9De'u.ATq^+A8,Oq%15is/g+_G+E1b!CLeQ*ATq^+
A8,Oq%15is/g+_G+EVI>Ci<f+E-67F-Z3L>DIIBn-OgDX67sBlEZfC6F*(q8DIn$'Eb&loF:ARP
67sBuATAo+ATT&4ATr$#D.O.`:-pQUATAnL+E(d5-RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`
3F?l>F*)JFF^e*4/h23s<.96<F=f'eFCfN8+=MSc<.96E+EMXI@P/)s:-pQB$;No?+B3#gF!,R9
F*&NW/hSb/+D,P4D..O.ARlp*AU&;+$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Ve%67sC%
ATT&0F`(t;Ci<flCh4`,@;TQuFDi:DATMr9FEqh:%15is/g)8Z-SIbO6$.-UF(dQo3A3Za6$$m]
CLoLd3@>qeF<DrKATr6-F*&c=$;No?%15is/g)8Z0e"5WBl\9:+EV19F<G"5F*2>=FD5Z2%15is
/g)8Z1+=>eARfXrA0>u*F*&O5F)uJ@E-,f4D@HqJ67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+FAQ*IXMY4:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC&ATMr9Bl5&'Ch7$q+C\c#AKY]!
+EV:2F!,(2@:p]sF!,FBATMF#F<G"0A0>r)F<G[D+>F<4:-pQU0H`M$-o<).0I\,,-V@0&6VKp7
;GTqmBkhQs?RH9i:-pQU0d&&/+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDX67sBjCh7$q+=ANG$4R>;
67sC&ATMr9Bl5&8ASlC)Eaa!6+DQ%:CERG3@ps1b+>"^RDfd+1Cht4d:IGX!:-pQUFCfN8F!+t$
DBND"+E1n4AoD^,ARlotDBN\:DJLA2De!3lATJu8Df'&.D09oA+EDUB+DG^9@UX=h%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&
3B9*,                                                                     ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fV-81GL"-+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>Ghu
1,U1/0H`)/+>Ghu2)l^51*AD-+?:Q%1E\D.+>Gl!0f^@61a"M1+>Y\o0ea_*2'=V0+>bqu0fL43
0H`),+>kkr0f1"10d&2.+>Yer1,0n,1E\G-+>Pes1,0n,2'=Y/+>Pes1,C%.3?U%7+>Yer1,L+0
3?U%3+>Gl!3$9q7@W$!K@<6-m0JR$FF(o,,-t7(1.3N).@r$4++DtV)AKYf'F*&OHATMs7@W$!\
D/X3$0JFnaDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7@rH4'C/\tfCLo1RFCfN8+=L`<D/a5=+DtV)
AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)J5
Eb/[$ATVL)FC])qFD5Z2@<-'nF(96%@<?(%+D#D/FEo!$:IH=IATMr9A8,OqBl@ltEbT*+A7]RD
@<6-m0JG4j@<6-m+Eh10Bk/>7A7]R++EV19FE:u(F*)G@H$!V=FC])qFD5Z2@<-'nF(Aj'FE2;F
F!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?rBk1.ZDeio<0IUIGA18XBD/X3$+EV19FC]*,E)UUlCLpL`
Bk)'lAM>edA8-+(.3N/8F)Yr(Gp%$;+E_R9@rGmhA8Z3^D/X3$0JFncDJUaEF)>i2AKZ)+F*)J6
DJW6gDeioY@:O=r<+U;rF(8lp@r$-.FD,*)+CT)&+DkOsEc3(BAU&<<+Ceht+C\n)F('6'A0>;u
A0>r)ASrW"Gp"MGDJUb4E-#T46=FqL@k]WH@<6-m+=Lc>F(KGB+E1b0@;TRtATAo7ATTS8BOPdk
AKZ)+F*)J7A5d>`CLo1RF)>i2AKZ)+F*)IGDe:+?ARm54-uNI1ALq%qCghC+>qC)/G]YAWFCAWp
AKYPpBln',B4l%!@WOkEF(o,<0JR$FF(o,,-td@7@WNt@FCfN8F(]<-@WPIbDeioMF)u&.DD3au
Bl7HqEb/a&+CT>4BkM=#ASuT4De:,)Ci<ckC`mk<EHQ2AARlp$@;TQuCh[s4+Du+?DKBH,Ddmcd
D/X3$6uQQh0IURMDdmc:+CoD#F_t]-F<G19@:sFgDKI"CATMs+Ec=roDeio<0IURSE%)o>Eb/[$
AKYQ$E--@JB6%p5E-#Z4E,9616=FqL@k]WH@<6-m+EV19F<G16EZf4-Bl5&.De*ZuFCfK$FCcS<
ATD6&-tdR>Ch[u?C2[WkB4Y"YDeioP@<loJ0IU[SA79+^.3N/0Gp$g=FCfK9@;I&r@;]t$F<G%(
+Dtb'@<?4,ASc9nA5d>`CLqU!F*'*PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!,17
FDi9MFCfN8C2[W:0I^gV@:W;RDeip+ATMrJCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:,1@VTIa
FE8R=DKKe>.!0$AFD>`)0JFqlDdd0eF_u(rD/X3$0JI$[D/^V=@rc:&F<GU8Ci<`mBl7Q+F)>i2
AKZ)+F*)J>Ddd0uATMrI0JR*P@ruF'DIIR2Ci<`m+>J*`FCfN8+Co1rFD5Z2@<-X0Ddd0uATMrI
0J[0Q@ruF'DIIR2Ci<`m+>J*`1*C[MF*&O8Bk)7!Df0!(H#.D-A9;C(F>,C)A8,OqBl@ltEd;J>
@:UK8GT\dbFCfN8+Co1rFD5Z2@<-X0Ddd0uATMrI0Jm<S@ruF'DIIR2Ci<`m+>J*`1a$mOF*&O8
Bk)7!Df0!(H#@2;A5d>`CLoh@A3k6KF_t]-FE9,iBl8*&Ch[E&-uNU?A18X0EbBN3ASuT4FCfN8
F)PSfD/X3$6#pU-@;0O30OeI3Bk&86De(:>Bl8*&Ch[E&@<-"'D.RU,+EV19FE;DDFA?7]AQ3A\
ATMs%D/aP_@<6-m0JHsEF(o,,G%#3$A0<:>F`]&TDIIBn+EV=7ATMs%D/aP=FCfN8F)ki5FC[^H
F(o,<0k+R4Bk&86Eb0<6A18XCATMs7FCfN8F*)P6FCfN8+=MSc<.96E+EMXI@K            ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A>+2`E`>1,'h++>PW,3A;R11a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PZ+1*A;*+>P&o3&`NH+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
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
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C?`M6rZrX9N+8X8PDNC8Q/Sa
;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[
ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O
2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+
@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.
0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:
+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*
2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm
1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%F
F_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh
1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K
3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ
1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi
+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+
B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_
+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_
+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_
+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_
+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP
0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*
2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc8
1bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV
0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ
0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"
@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;
0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[
0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU
1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k
0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&
:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM
1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG
2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\
FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6
+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG
0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk1
3\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn
+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A
+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/1,1gH2**NI$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1*B;"
Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0K'7F$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i1,(FA
+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lU
3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[
ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2BYV#
DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:2
1HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]t_$DBL\g0fU:11-.6O3\WK"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*3$9n83]/cU0JEh@$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J
@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se+>PW*3$9q1
3\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-
@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm
6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K1cdKM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,EZd+k
0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&
:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'2!Gp"jr0fU:13BArS3]&W"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU
1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3b
Ch+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ41c%0H
1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P_q9jr;i1,(FB+>P]51,1gF
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pht9jr;i1,(FB+>Gf90KD0L
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A
+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+AH9i+>PW*3$9q83\iNQ
1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh2]th'Gp"jr0fU:13'&iS3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$
6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,g=M@<itN0JPO00f_9P0fh-G$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i1,(FB+>>f:
2)[KQ2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's
3Zp.5+<X'\FCdKU1-$IO@<itN0JPO00fV3K0KLsL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqi0Ha(uGp"jr0fU:13'&cK3\rMu
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q
6t(1K3Zp45+AH9i+>PW*3$9q83\iTS0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C?oeF(KB8
ARn5MEc5u>1,Vfn/h0Y+F(KB8ARn5MEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R=O
$;No?4?Y)I.3N,@@<6*C+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuHDe(M92)$j9%15is
/g)o0+AH9b+>PW)2'=V03]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i@;]j'ATDg0E]P=\
Ch%R)%19tY+<VeFCER43+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN+Dl%-BkD'jA0>u-
AKZ/-Eag.>A8Z4)ARTUhBIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:F(Jd#@q[!$BleB;
+E2@>E+O'+Gp%$EASrW4D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9BOr<,@;]j'ATDg0
EZcqVFD,5.@rGmh%15is/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'F_t]-F<GO2FED)7
DK@?OAM.UJ+>Y,q+CoA++=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?A0>PoG%De.@;0Oh
A0;<g:-pQU+?(E/E,m'V0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&3ZrW[ASrW!FED)2
E-,f3B-;;7+ED%+BleB-EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[+B3#cEb-A-F!+m6
F)Po,+C]&&@<-W9Bl7F!D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@ltEbT*++CfG'@<?'k
+C]U=8g#uD0Jjn_D]iq9F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(RnATJu3AS#BpAoD]4
D/XH++EDC0F`VXIATDg0EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(F"Rn/:-pQU1-$IO
@<*JG0JG@,0f1pF2EEWL%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'DIIR"ATM*oATVct
Bl70j@<-6sFDYH#DC5l#_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*AN_Xg+<VeA?ZK^d
A0>PIAdo(V$;No?4[(8L.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A@ps1iARlp*BQA$6
B4rDrD@HqJ67sBhA9MO)F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&FDl+@Ch7d$C`m5+
Eb,[e:-pQU8l%htGAhM4F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@GA1l0+EMX=Cht54
@q0Y%%15is/g+bEEZf(6@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7Dg*=CEc5o.Ebp"D
FE1f/E+NQ4%13OO%15is/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60
@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UH6+E_3X3ZrQ+
+=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<YWG
F<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h,dZ_h>p\
_h>nA%19tY0uC7O+EqaEA12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIAF^uj/$8Dts+<Ve>
ATT%BF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,(_Qts>
GAhM4.!$g[A7]@eDIm@qZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
R10KG+<Yf;%172jBlbD2F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6
A8-+(+=D;B-Ql/N/g,4KDfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0Des6.GA1r-+A*bd
Df0`0DKKT2DK?6o_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-DBNP"Bl%p4A\tb_
$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\R10K4$;No?4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5DK?q=Afs\g/Kf.H
F*&O7@<6!&A8-+(<GlM\De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNXATD?)BlbD*+Dbt6
B-;8;@;]UiDJ()2Ec5E'ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU+Co%nCgh?qA0>r'
DfB9/+CT;%+Du+>+CT)1@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb-o<@qAncKN+:SYe
$4R=O$;No?4?Y)M.3N2BEc5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("@<?''B6%p5E-!.G
BOu'(FD,5.A7]^kDId<rF:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2F*'#W+:SYe$6UI0
A0<7BFD5Q4-QlV91E^UH+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%DC5l#%15is/j2BH
2(9Y[Bm;Z]@q]:gB4YTr-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s$4R>;67tA`-oNLs
ASlC.Gp$a?Dfp#?+CT;%+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)E--.D@V'%XF`V+:
B6%r6-Z3@0ALBPe-OgDX67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe$;No?4[(8P.3N5:
GWHrqB6.ouCLqK7+Dl%-BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,+DtV)ASc(%F<G%(
AoD^$%15is/g+YEART[pDJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F2^ok\EcQ)=3Zohc
De*9hALSa9D/aN6E+O'+Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&+Dbb5F<G"4B6A'&
DKKq/$;No?+>Pr":2b:u1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@FCB8=+<XEG/g+YH
FE8RB@;TQb$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#Ip
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(H
P_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''
9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQ
Pe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;1,(C@0KCjB/i4[n
+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe+<VdL+<VdL+<VdL
+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHp
Jdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjBF
+<V+#%1445+<YE;A79+^+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,
+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;
P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%(
+<VfdP_(YE0K1[G0ek:;0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:;+<][.
Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifof>$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<AoD]4Ch[s4Et&Hc
$8Wf>De*9hAKZCR+>Y-NDJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0jDJ((a:IH=9F_u(?
F(96)E--.DAmoCiF!,[?ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)Bln#2DIn#7FD5T'
F*(i-E-!-R+Du+>+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5Df'&.E,TH.F:ARP
67sB72'>\)F<E=m0f:(-3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4F_u)=05Y9>/no'A
-OgCl$6UrR/hS8bD/"*6ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o;GKqb?XI>^>@BZI
+<VdL6r$$B7:0D4D[d$_$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2
@<-'nF!,17+E2IF@;Kb%Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;67tA`-oi_!ATDg0
E]P<kB5DKqF"&5GDI[U*Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQtDKKqBFDi:EDK0f;
FCetl$;No?+DG_(Bl[cpF<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB+<X-lEZeq<@;Tt"
ANCqC$;No?+>>eu:LeJh1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(
B5VQtDKKqB%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[De).SB6A'&DKKqK
4Y@j2%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.
@<6L(B5VQtDKKq/$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8S.3N5:
GWHsaBm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB81*B;"Gp"jr0fL40
1HI?K3]/i*$4R>;67sBlDIb>;Ah@q1F(KB8ARmB(EcQ)=Et&IcF_PZ&C2[WnBleB:Bju4,Bl@lE
0ht%f.UmO7Ch.:!A7TCqFE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A1e;u
%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K
@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is
/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(
I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]
Bl%<&F`_>6Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6
-Xq44Ch.:!A1%fn%14IT:IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\
5t=@?6q0R9;BSS-6rR&N7n#gA6UXLD+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-6rQHN8PiAS
8Q$[':IIWR<)Z1V;C=Ug+EM+9@WcC$A7TCpF!*.G$4R>bE+EC!ASQ-oD..<rAn?%*+>=638l%iU
9gg+5F_PZ&C2[WmDf'H6ATMp(A0=K?6rR&N7n#g;;EIKH6q9gJ6qL9<8l%i@6psgG6qL9<8l%iR
6W-KP<(';U%15^'6rZrX9N+td6m,r]Bl%<pDe*s.DesK)Df'H6ATMp(A0=K?6rR&N7n#g;;EIKH
6q(3W;aa2T4%`::;aXGS:fKhS;@Nt*:IJ5X6m-VkA79RkC2[WnBleB:Bju4,Bl@l38l%iR<'a#C
6qL9<8l%iF8Q8)L;@Nt*:IJ5X6m-VkA79RkC2[X(Dfp)1ARoq#E-!-o:IJ,W<Dl1Q;cH%Q779^F
%15^'6rm#M+ED%0ARTXkC2[W*8l%iR<'a#C6qL9<8l%iR<'a#C:ddc@8Q%WB:IJ,\5t=@3:I@NA
;EIKH6q9gJ6r-0<8Q$!)%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*="
Bl%<?3B:FU$4R=O$=\-lCh.:!A8,e"1,2Nj/h1=QBl%<pDe*QsF!,NU/Kf1TA79RkF!)T8Df'?&
DKKH#+DPh*Bkh]3F(96)E--.D+DG^9+DPh*B5)Gp:-pQUA8-'q@ruX0GqKG!67rU?67sC(ATD6g
FD5SQ$;No?$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGOb67sB'
+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEsbZ/
/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&
+EV:2F!,O6EbTK7$;No?$;No?+<Vd]+ED<A-Xq44Ch.:!A8,e"-QjO,67sC$F`&=:De'u-@:O=r
+=JreF*2G@Eb0<5ATJu.D/a<*@qg$-BeOBR$;No?$;No?+CT>4F_t]23XSVK/db??/g*o-+D#S6
DfQt1BOt[hBl7Q9$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm$;No?$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*0ktiK0JWu167sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g)l'C3=DJ2]uO>
A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b/no'A$;No?+>G`^
E,mWf+ED%1Dg#]&+F7X6Ch7Z1/KetSFDuAE+Co2,ARfgnA0>u4+DPh*B5)H1F`(`$EZee,Bk;/h
$=e!aF`MM6DKI!K@UX=h-OO@%@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5
-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]k:-pQUEb/a!Eb$;2E+No0
A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ2sDf7d"+FPjbA8,Qs0FD`/+?MV3
C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT6.:-pQUAn?'oBHV>,EHPu9ARlp+FD5Q4+CT.u+Eh=:
F(oQ1+EVX4@r#drB-;)1F`)7-FDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1$>OKiG%G]8Bl@lP
3Zot;0RHDf6rm#M$49Np/g+S=Bk;0)C2[WsC3(M.Bl[cpFDl2F$;+)^7nHZP:IIcH;c#bZ83K!V
+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C'mR/6q9gJ
8l%iH8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPfC2[WqBll"CDe*QsF"\mJ$;No?
+D58'ATD4$AKYK$D/Ej%FCeu*8l%ht@r,RpF!,O6EbTK7EscYlCghC+ATL!q+?MV3C2[W*C2[X(
FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5+DPh*Df-p0C2[WpBl%@%4ZX]64>J$d
0e"5^@;BF$4s4TMCghC+ATJ1c:-pQUEb/Zi+Cf4rF)rI9Bl%@%+C\bhCC2J)@r,RpF(KD8/1)u5
+?V#^@<<kG4ZX^+ART*r/j:D)3[-:$C2[WpBl%@%$49Np/g+YBCi!ZmF<Ga8EbTH7F!,=.@rcK1
F(96)E--..-ZW]>F)kb<4ZX]B+D58-+?MV3C2[X%Ec5Q(Ch4`(De*fqEc#k?C2[X*F(KB%Df00$
B4>:b-OM8K/g<"mF)kb>4ZX^43[-:$F)kat$;No?+E_X6@<?''A8-'q@ruX0Gp$^5Ch7Yp7S-9B
;a!/a-u*7.@<6L$F!*"VHS-Ks+EMR5.3L/g/j:C?-SB+JF!h;a8PDQO4ZX]64A&C;7nHZP:IIcH
;c#bZ81>Z4-8%J)7S-9B;[P3@C2[Wn@<<V7+<VdLAp890FCcRV0RH8\9LVke0Ka)gA92j2Eb/ci
F<G1>EbTW,+?M<)7S-9B;[P3@C2[WnDdm6cF<D\KAp890FCcRV14)J^9LVke0Ka)gA8PajARo4k
+<Y9?EbTW,+?MB+7S-9B;[P3@C2[X*FD5Q%@<<V7Ap890FCcRV1j_\`9LVke0Ka)gA9;a.Cia,q
F<G1>EbTW,+?MH-7S-9B;[P3@C2[X$DId0t+<VdLAp890FCcRV2L@nb9LVke0Ka)gA8lR-Anc'm
+<Y9?EbTW,+?MN/7S-9B;[P3@C2[X%@<-4++<VdLAp890FCcRV3."+d9LVke0Ka)gA9Ds)Eas$*
Anbme@;?u.Ap890FCcRV3I=4e9LVke$?L'&F`_SFF<Dr@Df'?&DKKH#+DPh*Bkh]3F(96)E--.D
F`:l"FCeu1$?L'&F`_SFF<F1O6q9gJ8l%iH8lJPP<(I?':-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2
@<-'nEschr+E)1:+BosE+E(d<-OL2jDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,$=\-lCh.:!A9Dd(F>>RG67s`sF_PZ&C2[X*DJ=28F"JsdGB.D>AKXT@6m-ViBlkJ>
ATMs7+EVNEF*(i'Bl7Q+A8-'q@ruX0Bk;?<%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'
+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL
+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\
A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7
%15is/e&._67sB'+>G!ZD'138F_PZ&C2[X*DJ=2?+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?
ATMp(F!,16E,95uBlkJ305i9K$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+AQhtATDg0EZek*
ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FBD..]F1(=Rc67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+m
Eb02uEb-A8ATMs7+CSekARl5W:-pQU0fX#YGr%,sE-626AKZ)+F*&O5A7T7^%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!
@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!
Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1
A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBhCh[Hu+DPh*F`(o8+Co2,ARfh#Ed8*$8l%iF
8Q8;X6rcuR<)>k[83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&
<*s!):IK,1C(1MB:II]E<(]qS<DH+b:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6rcuR<)>k[81Z-'
De*KpF>%BIA9Dd(F>#!N$4R>dEbTW,FCfN8F$2Q,1a"h%0F\A'AhG38@:XCg?X[\fA7$I$ATMs7
4Y@jU<Cp.Y?X[\fA7$HlEc<.H+CoCC+EMC<F`_SFF<G[:F*)IGEb0?8Ec*KPASu$2%14J)FEqh:
+E1b2BI>qq+F">&BkAt?-o!e2-Rg/i3ZrNUF*)IGA8a(0$6UI4D/XQ=E-67F-VeS&-S0@]H#R=G
-QmMBF*)IG/Kf+J@;TR!-OgDoCia/?%144#-ZW]>FCfN8F!j+'+>G!OATT&C/p(ZGFE7lu+<Y`B
Dfp/@F`\`S,!$rjATMs7.4chh-S0@]H#R=G-QmMBF*)IN%144#AoD]sFCfN8/g,7IF*)IGA8a(0
$6UH6+EMC<F`_SFF<G10Ch5a^+E1b2BHSiKFEDeIAKWNH-SHhi/0H?&0RInQF*&iR/0H;mBkh]:
%144#+<W(SDb*Z&<$47WHZWh?F=A>VEbTW,?X[\fA7$HkBl%>i$6UI&DIb@/$>"*c/e&.:%13OO
:-pQU@rH1"ARfg)@;]TuGB.D>AKZ/)EbTH7F!,R9F*&OGF_Pr/Et&IO67sB/-Za-CCLnkT8l%iF
8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFF`VYKEc5i.-OgD2-Za-CCLnkT8l%iF8Q8;X6rcuR
<)>k[81>[*EbTW,FCfN8F!)iFDe*p+Deip+ATMs7-OgD2-XpM*Bk&MP8l%iF8Q8;X6rcuR<)>k[
81>[*EbTW,FCfN8F!)iFDe*<cF(o-+ATMs7-OgD2-Z!43B4WGP8l%iF8Q8;X6rcuR<)>k[81>[*
EbTW,FCfN8F!)iFDe*ZmEbAs*ATMs7-OgD2-ZaBMATMo?4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>
ATVL)FE8QPC2[X(FE1r6F*(u7FE8f=$7I93EclG:-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*
F*)IG-YdR1@rc^5BQRg,FE8f=$7I9@Eb02uEb-U[8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8
F!)iFDe*g-AT2'uATVL)FE8f=$7I9@F`M,+-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG
-YdR1E-626ATVL)FE8f=$7I95G][M7A1'H2:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoB
A7^"-ASuR'Df0Z.F*)IN%13OOF)>i<FDuAE+=CT6C`mk<BlkJ>ATMs7+Eqj?FED)3-OgCl$;No?
+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?UBleB7Ed;D<A25kK$>3pfATD3q05>E9
+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<b/hen<
3Ar!3+Co&,%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LA779L=
:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlok
C1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#
C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^Q
Bm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.
+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.
Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*
Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+
?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7
G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W
<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0D
E`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#
+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h
+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuST
E-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uogu
BlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H@;omo@rj;B
Ci=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5
DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc
@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6
+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG
/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"8T&'QEb/a&
6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL
-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5
B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+
A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UH
ARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+
A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0
@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL
+=Lc<.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0
DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaE
A9/l9F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2
Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1
DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%
Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLs
DfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9
-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!Tq
F`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6
+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=
>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p
9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2
C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?
DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4
$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9
$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSek
ARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:
AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^u
FE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q
05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNF
Ci^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%
B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*
?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(
Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.
@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@
FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo
$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7
BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlom
Gp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsn
Dg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaE
A9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0
DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8
E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=
F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9
EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b
.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?
+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"
+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A
+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`
BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A
@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bh
CLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;
Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA+
+=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<t
ASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)
@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKn
Ch\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*
+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1
@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums
+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF
@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn
04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C
/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL
+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.
Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\
D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:
Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[
+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O
+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm
5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7Bjkgl
H=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)
0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeE
Dfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWs
BlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4
?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&
A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.
FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36
F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL
+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA
741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-
E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651
@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*
+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5
BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3
F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)
E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW
6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!
Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$3
67sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9
+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW
6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/
G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@
8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*
?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.
DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+
FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$
C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE
2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!
ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC
+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'
+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V
;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8
ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/
%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=
$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"
+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!
Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#
+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$
B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8
/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#c
F(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"
F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::
3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:g
B4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6
+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#
+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU
0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'
ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$
BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9
@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po
%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@
?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$
ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).
@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>
F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s
$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A
+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'
+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/
F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL
+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6
+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.
?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et
+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'
DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A
@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&
Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.Q
Bl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$
F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#
+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\
Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0
+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#
F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,
ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6
F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))
F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9
EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4
+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7F
DId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8
@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*
D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:
DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"
Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB
-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,
+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,Xo
ARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1
+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"
A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#
+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$
AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e
+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.
@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;k
A8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%ht
A8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSE
Ec5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU
0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>Jq
FCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'
A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7
E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3
GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V
78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)
E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIakt
F)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUB
F"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$
AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s
$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6
Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#
+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD
9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2
BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*
Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$
GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/
@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1
+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3
Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_
+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S
+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbt
Df0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!
ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&
?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0
Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4
+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(
?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D
+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'
ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%
%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)
+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s
+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/
+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!
$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!
Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*
FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#
F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)
BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])
+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?8
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'
@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0
FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1
+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'
?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"
ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun
+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-
+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQ
A79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*
Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56
GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4
Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%ht
FCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTu
FD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6
ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7
DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[
+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*
AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%
FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&
DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2A
DffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&
?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,
+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(
BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#
D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@
$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8
DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCr
Bl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#
Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&
+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7C
Df-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS
/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/
+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*Qo
Bk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;
Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'
DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@
FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.
+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$
BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j
+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0
DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!
CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!
+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0
De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")Np
A8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%
A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'
BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W
3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%
@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1
A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1
FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6
F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6s
ATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1
+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@lt
EbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+
EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk
+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@
F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?
+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q
+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7
AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@lt
Ed8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1p
B6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"
+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?
G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k
+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e
$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK
%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#
+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`l
De!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7
F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<
CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl
$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5Cggcq
F(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#
/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,
F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNE
FD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5
BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i
3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6
+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i
+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#
+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<
De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>=-pFDl2FC2[WnDdtOWB4YslEa`c;C2[WnDe!p,
ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#.NieS
@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*t
F!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W
$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O
$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4
G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA
%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdL
F*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3
+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb
/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e
,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsn
A7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<
F_*!EFCAWpATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,
%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$
+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^h
F!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57
B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@
+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?
2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1
@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl
$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE
?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C
%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K
+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,
ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"
ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:
@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/
?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8
+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"
EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-
E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.
FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi
8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"
DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et
+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#
+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<
AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=
BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3Amemm
BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!
G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3
+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"
ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#
+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"
BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e
$>OKi@V'V&1,V`k6<$NU9LV**+=BcW6m*m6.3LrgF*&O$Ea`I"Bk(^q-OgDV5sdk;<(Ke_4ZX]>
+?CW!%15^GBPnq\/0I8fCLqN/%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV;a!/a
-UMBcF<GOC@:OCn@qB^(AoD]48l%ht/Kf(FG%l#/A0>K&EZdss3%cn0+AH9b@qZu?0JPO7%15cp
6:Oa<<Du%A+>F<4%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A$HmEc5K2@ruF'D@HqODe=*8@<,p%FDl)6F!+n3
AKYf'CLnW)Ddd0fA0>N-DK@i]E,Tr3Eb9H1+EqC*E,TW8+D,P4+EM@-H"h//+F.mJEZek1A8,po
+Co&#Df0V=@Wcc8@;L"'+CnnuB4Z+%F`S[LBOu'(F`V,)+DG\3Ec5o.Ebp"R+<X3`G%DeADfm16
G%G\:F(fK6+F.mJEcYf.Aftf*+EV:.+D,P1F?^lj8K_edDg*<q-Z'uCBle?0DJ()#+D,2/+EVO5
F!+n/A0=Gd@V'X(H#IgJ@<,p%@<3Q8ASc08+:SYe$<1\QF!,:-@N]T3FDPZ/ATJu&+Du==@V'R&
De:+9@V'V&+E2@0@ruEpATK%<DfQt5F_PAtCh[cuF!,(5EZfLGBl7Q+8l%i-+<X6'G%De4ARTUs
ARlp*BOr<"@<,m$G@>bY+DGF1H#IgJFCArr+DlBH@:XOq@q?d)D]i_)@<-H4H#IgJD/!WrF<G%(
+EML1Eb/c)%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B2onF<G16
EZdtM6m-VnATAo(AS,XoARloqDerrqEcVZs=$]_Z8PVc:+B1m';]nb"66K/p;,p1c78k<p+APp2
6:Fcp:IZI,;ajS,6q'R::.7Pn8l%ht7Sc]G78d&:%13OO<+oue+DbIq+ED%5F_Pl-F!+m6DKTf*
ATAo3Afs]A6m-)[Ch.*tF!,RC+EDUB/g+,,AKYl%G]Y'LFCfD6FCfN8F!,(5EZfI;AKYQ/BleB-
DI[6#De:,6BOu6r+D,P.A7]e&/e&-s$;"hP-rac!F@o=s6tp[Q@ruX0Bk;?7+Dbb5FE8R5DL!@I
DId<jBl7Km+A,Et+Co2,ARfh#EbT*++Cf>-Anbn#Eb-A8BOu6r+Co2,ARfh#EbT*++C\noDfTD3
Ecl8;Bl7Q+FD,B0+DbIq/g*`'F*)GF@ruF'DK?q=DBNV2G9D!G+CoC5FD,B0+Ceht+C\n)AoDg0
A0>T(+=LuCA1hh3Ago>T8T&Tk@;Ka&FD,5.-u*[2A8bt#D.RU,.3N&0A8c?.FDi:7ATT%CC2[W8
E+EQ0/e&.:%16'GF*(#M6pta0ARfh#EbT*+?YO7nA7%J\1E\_$0F\?u$;No?.TBu#F@o=s6tp[Q
@ruX0Bk;?.FtG9gFCfN8+E_a:EZek1DJ!TqF`M&(+A,Et+Co2,ARfh#EbT*+/e&._67r]S:-pQU
<+oue+<Yi=Eag.6@q]F`CNCU@FD,*)+<Y]9EHPu9ARlo+8l%ht+DbIq+Co2,ARfh#EbT*++<Y*5
AISuA67sBkAS,XoARmD9,"-!SBl7Km+s:E7ATJu3Dfd+=ARTI!FD,5.+Co2,ARfh#EbT*++<Y6?
BleA=Df0B:%15is/g,7L@<<V?C2dU'BIP'8G]7)/A9/l8D]j+>D.Rg&Bl7Q+DffZ(EZfI;@;[3%
FE8R8AS,@nCih9=$;No?%15is/g,"LDII':+<Y019ljqi4Y@jVATMrc:IITbEb/a&DfTQ'F!,UJ
8S;pZEb,[e%15is/g,@OASrW!+ED%0@<?4,AKYMtEb/a&DfU+GA8c%#+Du+>+D#e3F*&NQC2dU'
BIP'8@q]dlF!,1=F!+n3B6A'&DKH<pC2[X*A8-(*+?_>"-[mEi/1)u5+?MV38l%ht8l%iC<D?:g
+A,Et;bpCk6U`+i:IJ/N;cG+R$>OKiF_#&qF!*Uu+DPk(FD*!R4s4TYA9DEsEcW?G:-pQU+Xefh
4Y@jlE+*j%%16r\F))m]/g+nIA9DEsEcW?d+DPh*F_#&qEt&IjAhG2\+D!/JD..L$+CoCC%144#
4s24iBle?0DJ((a:IH=;DerrqEcW?T+Co%qBl7K)@V'.iEb-A6F`))2DJ((a:IH=A@:F:*+?L]_
@<63,,9U`>A9DEsEcVZsAScF!/e&.1+?gnq@;Ka&8l%htAoDKrATDi7@<,p%A7]@eDIm?++?L]\
De+!$AS,um$>"*c/e&.:%13OO<+U,m8l%iCBl[cpFDl26ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[k
@:C?hCh7$mF`7cs=$]_Z8PVc:+@Jdg<(Tk\5uL9C;]nG*76smA6m+g!+Abs-:Jr<5<DHI8:IZI#
5sc\n84c`&=%Q(Z+@8L>6q'd<<(01t8PUC-84=Xr79EM3;cH1^/e&-s$<LnPDBO%7AKX<NF*&O$
Ea`I"Bk(^q+DbIq+EDUBF!,1=+CfG'@<?(%+CQC1F_tT!EZf:4+Co1rFD5Z2@<-'nF!,17+EV:.
+=M\2:IJ,W<Dl1Q.3N/8Eb/a&DfU+U+B3#c+Dtb8F<GXHAT/c9Bl%T.Eb0*+G%De)DL!@CAfu2/
ATME*A8,OqBl@ltEbT*+/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m';]nIo<'_X*<)6=5:/=qD%14Nn
$;tGPDg#\c@:DQ7F*'fa@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%16f]/g*_T=%Q.0A8a(0$6UI4
BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q-RgSo+t!g,+<Y`BDfp/@F`\`R9OVBQ
FCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+=MGJDCH]=Bk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/
+A#%&:.\P1A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5%f@:LEgDIak`Bl8'<+E1b2BQFUi+<Y`=
ASc0*-ZX&H/TPGG-S0"O@<?0*-[nZ`6rQl];F<l#%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9
@V'V&+E2@0@ruEpATJtBD.-p-Ch[d0GUXbGBk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0
$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+Co1r
FD5Z2@<-'nF!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;tGPDg#\76=k4[
+Ad)e@ruEpATJu1@:C?iBk)7!Df0!(Bk;?<%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is
/g,:SEb/ltF*(u6+Co1rFD5Z2@<-'nF!*%W8OlNO;FM]s;Gp:g;[j'f+>=o`+>Y-\AS5O#4s2pJ
-Xq%)DfBtE@W6F#F*&cP>9G^EDe't<-OgCl$;No?+Co&"ATVK+A8,OqBl@ltEd8d>Bl%@%%16!E
D/XT/9OVBsATMr]Bk)7!Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38l%htA8c%#+Du+>+C\nu
Df021Bl5&8BOr;Y+EVX8AIStj8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-84=Xn+B26-73W0J%15gT
+D,>.F*&O5DIal,Df^"CBl.g-Ecb`-F<G%,F<GL6+CSf(Bk(]sBlbD<Bl.g*GrcBA%15j!<^fn/
:.82P;BS_'<^fn/F*)>@AKZ8:F`JTs:IH=9Bk)7!Df0!(Bk;?.Bl5%c+DG_7FCB!%+Co2,ARfh#
EbT*++Unbf$:u@aDfol,+CT)-D]iJ3DeW`)@;^?5:K&BQ@;]LdARlooBl[cpFDl26ATJu1Bkq9&
%14If:i^Je@;R,VBl%@%>UM-5$4R>0Eb/[$AKYD(8l%htD..L-ATAo(Bk)7!Df0!(Gp$X3Eb/a&
DfU+GEc5l<+EV:*F<G:=+Cf>,E,9*-AScW7Bl7HmE+NotASuT4De:+a/g)9.F=2,P@;L"'+CQC*
Df9//Bk1d`+EVNEA7]@eDIjr!+EM[7A8-'q@ruX0Gp%0MEckl6F`M%9FD,*)+Dkh5Ec5u>+A+#&
+Eh=:F(oQ1F"SRX8l%ht@rc-hFCfM9@VK^gEd8dBAnc'mF"SRX<+oiaAKYT!Ch7Z1@<,p%AmoCo
Cj@.EFCAWpAKYH)F<G%,DIIR"ATJu(@;[2tBOPdkAKZ21ASrV_+Cf(nDJ*O%/e&.:%15is/g+YE
ART[l+CQC0@<6O%EZdtM6m-#SEb/a&DfU+GEc5l<+E)CEF(o/r+E(j78ge[&A8-'q@ruX0Bk;?<
%15is/g+,,BlbD,Eb/[$Bl@l3A7]^kDIal.DBN@1@rH6sBkMR/ARlooBl[cpFDl2F+=M\2:IJ,W
<Dl1Q.4u&:DIn$&+=CW;FCfN8-T`_kE+*j%+=DV1:IJ,W<Dl1Q04JmBATMr@.6AndATMr9E,oAs
FD55rF!,R9F*&O8Bk)7!Df0!(Gpa%.%15is/g+,,BlbD2F!+n/+D#e+D/a<&+>"^YF(HJ&DJsW1
ATAo6Df9_?AoD]4H#IhG+Co1rFD5Z2@<-'nF"Rn/%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>\s@N]2q
@ruF'DIIR2+D,Y4D'3A3D/^V=@rc:&F:ARVD]ib1Cisf@Eaa'$+DYP6+D,1nFEMV8F!,C5+A,Et
+EqB>DImBi+CQC1Df0-'E--@JA8,OqBl@ltEd98[<+oue+Dtb8F<GXHAT/c.Ddd0t+EV:.+=L]<
FCfN8.3N/8@ruF'DIIR2+D,Y4D'370A9Da.+EM%5BlJ/:A8-+,EbT!*FCeu*GA2/4+A,Et/e&.:
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+DbIq+Co1rFD5Z2@<-WG%14Nn$;No?+E)41DBNh.G9CF1
@ruF'DIIR2%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sBsDdd0!Ao_g,+D#e+D/a<&+CoV3
E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm@WO2=@:EbiD/_+A
C3(a3$4R>;67sC$AS5RlATD4$AKYDtC`mb0An?!oDI[7!+>"^WBQ&);CghC,+EV:;AS!!$ATMp$
B4Z,n$=>S3HS-Ep+D5M/@WNk[+FPjbEb0E4-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@9LHCNXS=@UWb^
F`8I4@:O(qE"*-u6:!t3<DXf)5sn:F:`r(j6VCEU+q4kg$;#=^BlbD5Blmp,@;Kb*+CQC6DIIK,
FDi:=@;BEs@3B#f@r$4++EqOABHToC6nTT);f<df@:O(qE$0(2FCf>5%14Nn$;No?+E)41DBO%7
AKYGnF*&ODEa`I"Bk(]sA8,OqBl@ltEd8*$De't<@W6F#F*&cP>9G^EDe't<-OgCl$;No?+C\bh
CER>5+E_W4$?0E`CLeP8@W6F#F*&c=$4R>;67sC$ATMs(+ED%'Dg#]4F!,R<AKYi.F*&O7F`MM6
DKI"1@:O(qE"*.pATMs(+=CW;FCfN8-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+0QR+CQC6@rc:&F<G+:
D/aS+$6iG8919sh+B(X*8PiA/6rcrX+q4kg$7Kk%@r#U(+C\bhCNCV@E$/V(DIIR2+DPM&Ch7Z1
@Wcc8Blk_D+CT)-D]iI2B5_^!+DG@t@3BZ1+<k?=D/^[AH#IhG+Co1rFD5Z2@<-'nF!+n4+E2.*
Bl5&8AU&;L+<X9P6m,uJDBNJ4D/^V+Cht54E+No0A8,OqBl@ltEbT*++CT=6@3BW*DJ*cs+A*bt
@rc:&F=n\7@rc:&F<G+:D/aP=@<,p%FD,5.D/XK;+EMX5@VfTuG@>b>FDi:CFDl22+A*beBk)7!
Df0!(Bk;?<+<XWsAKY`+A92[3EarZ'@:WneDBNJ(F*)G:@Wcd(F!+n-C`l>G6m-PhF`Lu'+Cf>#
AKY])+EV:2F!,(5Ec!E<$7QDk:-pQUA9Da.+E).6Gp"MEE-,Z4F=@Y+De't<@W6F#F*&cP>9G^E
De't<-OgCl$;No?+=M)8CLnq;@rc-hFCfM9@3B)p@ruF'DIIR2+CoV3E$/k4+EV:.+CoV3E$04E
@Us1nARfh#Ed8*$@W6F#F*(r8D/_X!+EM47GApu3F'i?jDe*2tD..3k+=ANG$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMkrD.Oi4F(KD8De:,&F_u(?F(96)E--.1$;+)^+CoV3E$043EbTK7F!+t$DBND"+E_a:
A0>u4+ED%0Ddd0-+Cf>/Gp$O5A0>`#EbAr+A8,OqBl@ltEbT*+/e&.:%15is/g,1GCi<`m+C];3
ATMr&$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4FC]N2E"*-`$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$:A`NGp$N<A8,OqBl@ltEd98H$7QDk:-pQU@rH=305Y9@B4W2pE-,Z4F<G+.@ruF'DIIR2
%16uaG@VgD@W5gqE-WfmC2dU'BHS[O8l%iR:K::[75&+h@rH=3-OgE$A0<7/E+<g*Gpa_=+>Y-Y
A0<6I%14d43\V\'3b!&MATMs(F_u(,$4R>;67sBjCh7$q+E1b2BFP;ZE-#T4+=BNM76sgJ5u^B&
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[l@;BEs@3BDqF*(u6+ED$FEb/ltF*(u6+EM%5BlJ/'$6i21919sh
+AG.#<(0\-;FN0877TpJ<(0\-;aXGS:fJVJ$4R>7:IH=DDJXS@F(Jp(+EV:.+Co1rFD5Z2@<-'n
F!,L7B5)F/ATD?m+DG^9FD,5.C2IC#FCfJFBkh6&Anc'm+EMHDD..-rFCAm$Bl7Q+@3BB#F*&OC
Afu,*B5)F/ATD?m+Co1rFD5Z2@<-'nF!,1<+CQC*Df9//Bk1d`/g)9/:IH=8@;[3#ASu("@<?''
@3BT%/TPE8BleB-EZfF5EbTK7+EV:*F<GjIFWb1&DBNM$BlksM+:SYe$:eZFATD4$AKYD(Eb-hC
AS5^uFCfJ8F(96)E-*42DIal/F`\a?F<G:8+F.mJEZf4-Bl5%c:IH=9Bk)7!Df0!(Gp$X3Eb/a&
DfU+GEc5l</e&.:%15is/g+e<DImisFCcS8AM%q6B5)F/ATAo7@rc:&F:ARtATD?p4ZX^,BQ&*6
@<6Ks@;9^k?Q_FW3Zp:&De't<-OgCl$;No?+ELt7AKY]/+DG^9FD,5.D..L-ATAo6Df9_,$?B]u
AS3-0EbTW,?X[\fA7$HoE+*j%+=DV1:IJ,W<Dl1Q05>E9Eb/ltF*(u6/no'A-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l3;e:%nCh[@!@<-W9A8,OqBl@ltEd8dLD]j(3@:X:oCj?Hs,#^p0+A>?n;F+2`+@Jdg
<(Tk\5uL9C;]o%8+AtWo6r-QO=X":^%15mMASrV_:IH=9Bk)7!Df0!(Bk;?.A7]@eDIjr!+EM+&
Earc*E+*j%/g)99BOr;uBl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*BlbD=BOr<)DJXS@A8,Oq
Bl@ltEd8dLBOQ!*@ps6t@V$ZlBOPdkARmD9+A$YtBlbD,@;KakA0>u-AKW19F`\fMA8,OqBl@lt
Ed98[+@UHbDBO%7Dfo]++Du+8E-67FA8,OqBl@ltEbT*++CehtDJsV>@V$ZlBOPdkARlomGp#^T
6m-2c-Z^D=+D5V2A0>SsARQ^'D]j+4F<G[=ASiPf76s=;:/"e5@V'%XF`V+T%13OO;FNl>:JOSd
+Co1rFD5Z2@<-'nF!+t$DBND"+CSbiATMp(A0>?,+CT/5+Du==@V'R&De:+a:IH=I@<64*/g+%\
5t"dP8Q8,$A8,OqBl@ltEbT*++Ceht+E).6Gp$R-+CSbiATMp(A0>?,+E)./+EV%5CG$_P%13OO
94_[RBl7Q+Ch[@!@<-'nF!+@L5t"LD9N`KWEb0E*DKKqB@:Ne]A7]Y#@;I'*F`]!P+CT=6H#IgJ
DfB9*+CT.u+Cf5+F(HJ)Bk)7!Df0!(Bk;?<%14Nn$;No?+DkP&AKYH$FCfN8+AtWo6r-QO=Ub^V
A0<7/E-,Z4F=/28+>Y-YA0<6I%16WbF(KG9-W3B!6r-QO=XOXc%15is/g+VB@rH=3+DGm>DJs_A
FD,5.E-67FA8,OqBl@ltEd8*$De'tP3[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1%15is/g+b?
EcZ=FB6%p5E%c9TBlmo/F(KH7+E1b2BFP;]Ec<-K@:sV!F`8]i+?MV3A79Rk@q]F`CERn6@<,me
FCfM9FDk\uGp%0NDK9H4ATMF)0II;:%15is/g,%MFCcS*Bk)7!Df0!(Gp%'7FD)*jA8,S'+>=63
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+A69WE$014An?!oDI[7!+E_X6@<?'k%14:P77C#q;FO&D;FO>J78k=/
:ddTK778=/$4R>7:IH=HFDl22F!,[FEb$;5AS,LoASu!hF"SRX;IsHOEb0,uATJu*DII!jAKYhu
DL!@IF(Js+C`mY8ATD4$Bl@m1/g+&'An?!oDI[7!+CT)&Dg*<PB4Z1*GUXbWD]ik7@:UL)DfTB0
+EV:*F<G(%Cht54FD,6++EqaEA9/l-DBNh.G9CC6DKKH7FE9&D$7QDk:-pQUDf0B:+E2IF+Co1r
FD5Z2@<-W9Eb/ioEb0,uATJu3AS#BpF`:l"FD5W*+>"^WBQ&);CghC,+D,>2AKYi$F)tc&ATJ:f
?SrsQ/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@L-XF_t]-F<G+.@ruF'
DIIR2+E(_(ARfh'%14:I:IA,V78?f)6qKaF8P`)I;HY,<6:s[6<)XtM$4R>1De!p,ASuTuFD5Z2
+DGm>@3BB)DJ()5FCB&tBl7Q+F)Q)1+E275DKI"5DfQt>Ec5T2@;TjmEcWiU+AHcqF<GL6+EV:.
D'3M#FCcS/F=n\7Df'&.@r,RfD'3P7-Z^DQDJj#qATMp$Ed8d9DIal$G%GP6A8-+,Ea`I"Bl7Q9
+<XI%BOu4*+E2IF+DG^9BOP^h+C\bpARlopAnGt%FE9&W8T#YfGp%$EBl7X'DBO%7BlbC@Ble/>
F<G.<ASrW7Ec5i.+X/$O7rN<V+CoD#F_t]-FCB9*Df-\/Ch7cuFCfM9@rGmh/g*`'+A6TpFD*%C
+E)45DJ=$,+DGp?F(K<!Eaa'$F!)ZCBlmp,@<?''E,ol0Ea`g%Bl7Q-+D,Y4D'3q6AKYDtFCfK1
@<?4,AKWQI,&(k0Blmp,@<?''E,ol0Ea`g%Bl7Q9+s8!N%13OO8l%htE,ol?Bk1dr+CQC1F_tT!
EZf:4+D"u&Gp%<>H#k*MD]iS/@s)X"DKI"2De*E3+B`W*+Ceht+D#G4ATAo%+EM77B5D-%F(K62
ASu!h+E)9C@3BApEbAr+A8-++ATDm$FD5Z2/g)9.+EqaHCh+Z/ARfXqD.RTq+EV:.+D,P4D.R`?
+<XToAKXT@6m-#Y@s)X"DKK</Bl@l3AoD]4D/XH++CoD#F_t]-FCB9*Df-\9E-,f4DK@E>$7QDk
:-pQUAoD]4DIn#7GAhM4F!,RFGp$N<F(oN)Ch4`*Bl7K)De:,&De!p,ASuTuFD5Z2/e&.rAoqU)
CghC,F*)Fc3aEkV/q+of5[,?]+>G2kBf^\l5U]hZ74o]g.1HW'F`\`R@:jUmEbo0*FE;PE-OgCl
$;No?+DG_7ATDl8F(K62ASu!h%14d33$<0_F<Dr>AoqU)CghC,F*)FM4"#&[FCAm$F!,OGEbTE(
+=MLa+CSl(ATAo0@<6N5De!:"EcP`/@q?d$AfrLH.45Q3%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m-Vn
ATJu)De!p,ASuTuFD5Z2+DG^9DIn#7@rH7,AU&<</e&.:%15is/g+bEEZfI4@qg%++EV:.+CoD#
D.RU,+EM+3FCf?"AKY].+D,2,@q]Fa%16W[F)W6L@:jUmEbo0*FE;PE-OgCl$;No?+C]A*AS,b(
+Co&)@rc9mAKZ&:DJa<1DBNS4Dfp"A+>"^XBOr<*@<l<j@r!3!DfQt3DKKH1Bl7Q+FD,T6AKZ&*
DKKH-@qB]j$>=6pDJUGD/g+eIE$-NLF`)&7Df-p3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq=DBNM8@;Tt"
AKYo'+Dbt6B-:`'@s)X"DKK</Bl@lA%14Nn$;No?+Dbt6B-:`'@s)X"DKH<p0H`@uA8-+(+=D5Q
DK9H4ATMF)0II;:%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@KdQBl7K)H#IhG+E)IA+A,Et+EM47Ecbf6FE7lu
,"+jh8PV\s=\i$q+AZ'6+A,Et+B(g,;H-"`<)XtM$4R>7:IH=LDfTB0+Ceht+C\n)F`V,)+EqOA
BPD?,@<,gkFE1f1Gp#^%E,ol0Ea`g+/g)9.AfuA;FWb45DC9NKAnc-n+CQBb:IH=EEbTB)FD5o0
+EV:*F<GF3ATVu9H#IhG+Dtb%A9/l(D]iI2Ch\!5Ch4`.Ec5T2@;TjqDJ(R2$4R>ABOu3q+CT;%
+DkP)Gp$[C@;Tt"ATJu4Afs]A6m-GhDeF*!D/F!)B-:o++A,Et-Z^DODfp)1AKYK$A7[A98T&Tk
@;Ka&FD,5.C2[X(Dfp)1AKYDlA8c?.FDi:7ATT%e:IH=HDfp)1AKYK$A7[A&$7QDk:-pQUAU%X#
E,9*,+E(j7F`V87B-9fB6m-\lEb'56FDi:4AS,XoAKYl%G9CL+@qfanFD5<-%13OO:-pQUA7]gl
EbSuo+CQBb:IH=<Ec6)>%16c]?YO7nA7%J\+BplLBP_X*C`lqC+FPjbB6%r#$4R>;67sC$AM%q6
An?!oDI[6#E-67FA8,OqBl@ltEd8dKBQ&);@;^?5ATDg0EcVZsEb09&Am]7eDe*3<3Zp4$3Zodu
DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc75&NM9I4fPOG&J`U-RU$@+F,=D$4R>;67sC%BQ&);
GAhM4F!,L7An?!oDI[6g+C]U=GAhM4F!,17+CQC*Ec6)>+EV:*F<G"4AKYl/F<G:8+EV:.+D5_5
F`7csC2[Wq?YO7nA7%J\+=CT1Ec6)>-OgE#G[G0"De*3<3Zp4$3Zodu@;Kb#AS-!++FPjbB5T.@
/M8/YDETTpB6%r6C2[Wq-OgCl$;No?+Dkh6F(oN)+D,Y4D'168B6%p5E%)5'DKm9O-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l36ZmHlDf'37AKXT@6m-&OBlkJ0@:O"fBln'#Et&I#6WI&a:JFDa73G2u6m+od
8Q6g%5sn4;8Q88M;^)YX%16'JAKYhuBl5%c:IH=:A8--.GAhM4F!)lKG:=YCDIak<ARm54@ps6t
@V$ZlF`VYCD/"<-A0>?,+Co%qBl7X&B-:V*6r-0M9gqfV6VgEN5u'fjF(96)E-*]A$7QDk:-pQU
A7]@eDIjr$De!p,ASuT4@rH4$@;]TuF(96)E-*3S+FAQ4IXN>QF!,[FEb$;1@;TQuE,8rmAS?!u
A7]cj$:IZW<D>nW<'sGU9gMNB?YO7nA7$HB3Zp+!3Zp*c$?L'&F`_SFF<GOC+=DMb:4@U=%14Nn
$4R=O$;No?+CfG'@<?''@3BH!G9D*JEb$:E+E)41DK?q3A8--.GA1r*Dg)WtDKd3N@W6O0Eb$O,
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqBBl7H(FD,5.-t7.>DfTA;+D#(tF<GdADId[0+CT.u+Du+>AKYZ)
G9B:L6WHiL:/jSV9hdoK6m-S_G]Y'A@<3Q#AS#a%D/Ws!Anbge+CT.u+DG_7ATDlF+<Xa!ASrW4
BOr<-@rc:&F<GdADId[0+DGm>F('6'A0?)1FD)da;H-=A=!0n,6WHiL:/jSV9hdoK6m-MmDK@E>
$4R>?F`&=1DIal"Ci=B++EV:.+=L]<GAhM4.3N24BlkJABl7I"G:j=3.1HUn$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$:SK>F<G!7GAhM4+DG^9FD,5.A8,OqBl@ltEd98[+A,Et+DGm>@;L-rH#k*>A8-."DJ()%
DfBE%F"SS2EbT0#DII@&+Ceht+E).6Gp$R-+Cf(nDJ*Nk+EqOABHUl2E,95uBlkJ:F`\aEE+O&u
FD5Z2F"Rn/.1HVZ67sBsDdd0!A8,OqBl@ltEd8dODfTA2Bl8$2+D#(tF<GdADId[0%16ZW+=D5Q
DK9H4ATMF)0II;:%15is/g+b?DIal3BOr;7F*2A@Bldj,ATTUT+D#(tF<GdADId[0+CT.u+Du+>
+@K!m<D>nW<'sGU9gMNB+:SYe$;No?+Cf5+F(HJ*A8--.GA1r*Dg)Wt%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+@KdQBl7K)8l%htE,ol3ARfg)D.-ppDfZ?p,"+jh8PV\s8l%ht:f:(]771#s9gM-E:K&GH$4R>D
BOu'(E,ol0Ea`g%Bl7Q+GA2/4+A,Et+F.mJ+EVmJBk(RfCj@.AE+No0@3BW&F<GL6+Co1rFD5Z2
@<-'nF"SS/Ddd0!F)Po,+EMgLFCf;3F(96)E--.D@;]TuA7]@eDIjr3Df'&.BOPdhGp%!CF`)7Q
+<XWsBlbD,@;[2sAKYN%DIjr)DBN@1E,ol3ARfg)D.-ppD]j+2EbTK7/e&.:%15is/g+\9Anc-o
+CQC3Ec5](@rri1@:O=r+>"^-+E_a:+EV:.+E2@4AncK4E,o\9AoD]4F*1u++EM%5BlJ08%17&p
C3+N8D/X?14ZX]>+?CW!%13OO:-pQUF*(i.A79Lh+DN$?@rc:&FE7luEb065Bl[c--Y-dtF_;h=
@<633%13OO:-pQUCi<flC`me/EbTK7+Du+?DK?p0$>OKiB4#@fDe*3<3ZoekF`)&7Df-p3$>OKi
F'iWrDe*3<3ZoekF`)&7Df0Z.F*)IN%13OO:-pQUE-67UG]IA-%15L!6WHiL:/jSV9hdoK6sk7I
+?_b.-Za-CF`_SFF<GOC+=AO`ISP??-RU8N$7QDk%15is/g,4WDfTD3D.-ppD[d%1+E2IF+=D,K
C3+N8D/X?1-Taq!6W-KP<*s'KDe*3:E,o]7F`)&7Df-!k%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15mK@q?d%
Ec5](@rri1@:O=rF!+n3AKYMpAnc-oA0>T.-Z^DA@<6]:FDi:3Df00$B6A6++F.mJEZdssF(KE6
Bl@l3/KetNASrW4BOr<,AT;j,Eb/c(A8,OqBl@ltEbT*++CT.u+EDUB+EqOABHS^DD(-TLD]j+4
FEMOT%14Nn$;No?+EM+9F`8IBEc5](@rr.eEbupHE,o]7F`)&7Df-pF+Bot,A0<rp-Xq%)DfBtE
@W6F#F*&cP>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37:^+S+F.mJEZf+8A8lR-Anc'm/no'A
%14:J6qL?#=\i$q+DPh*E,ol/Bl%?5Bkh]5%13OO=(l/_+A,Et+Dbt)A9/l8BOr<-@rc:&F<H$@
A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A+DGm>AU%crF`_2*/g+,,BlbD<@rc:&F<G(%
DBND"+E_a:A0>u4+EM+9+E_WG8l%htFD,5.G@>b>H#IgJG@>B2/g*o-FCcS.Dg*=LDfm14@;[3!
G\(B-FCcS6Ec5](@rri1@:O=rF!,[?ASrV_:IH=ADdd0t+EqOABHVA-DKKH-@qB^(Ch[Zr3XlE*
$?Bu+-ZF*@F*2A;Df9M@+Bot,A0<rp-Xq%)DfBtE@W6F#F*&c=$4R>D5uLHL:.I>fF*)>@AKZ8:
F`JUDEc5Q(Ch4`'DBNk8AKYo'+F.mJEZen,@ruF'DIIR"ATKIH+B3#gF!,(/Ch4`'F!,L7F(KG9
GA(Q*+A+pn+E_X6@<?(%+EV:.+A,Et+CSekDf.0:$7QDk:-pQUA8-+(CghT3C2[X%Ec5Q(Ch555
C3'gkATT&8ART+V@;9^k?Qa*&@<?01IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3(a3
$4R>;67sBjCi=B++EV:.+DPh*E,ol/Bl%?5Bkh]3GA1r*Dg)Wt%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B;?/
+A,Et+@npp:`r&!6m+ln6WHiL:/jMY8P`(j$6iJK73G2u6m,#h9Mcit:.-3m:IA,V78?fJ<(Tk\
+q4kg$;#,VFCB!%+EV:.+=Ll6DImisCbKOAA7TUgF_t]-F=A>@A7TUr+EVNEF`V+:8l%ht:ddbq
BOu"!/g(T1.1HVZ67sBsDe!3tBl@l3De:,,De(J>A7cr9+DG_7FCB!%+CSekDf-[GB4YslEa`c;
C2[WnDe!p,ASuT=+EqOABHTo59FV>DE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TD
An5gi05>E9/oY?5-OgCl$;No?+E)41DK?q8De(J>A7cruAftM)E+EQ'Eb/ZiATAo-F!+n7@;0Od
@VfTuDf-\CDfp(CF*VhKAShk`C2[WrASc<.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;fuqo@<-W9@;]Tu
Anc-kC`mb0D..I#F"Rn/<+ohcAoDL%Dg,o5B-;/6@:OCn@qB^(D..3k+A,Et+Dl%;AKYr4De+!#
FD5o0+CT.u+E_a:Ap%oN%13OO8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-84=Xn+B26-71BS5$:7$G
93"e26:!t3<DXf)5sn:F:^ma@$<0;a73Fl=;aXGS:fJQ*<D?:!$4R>:5taWh5p/lf;cH1`+AtW[
;FO)I;cH1`+B(X*8Pi@q$4R>@78tC'8O?<@;HY,18OHHK:JO2R8OZQ#<)4W776s=;:/"e"$4R>8
77C#q;FO&D;FO>J78k=/:ddTK777Rl%15L!6WHiL:/i?(8OHHK:JO2R=WgL,8ju*H;[j'C$:I<P
8PV\s=\i$q+AZ'6+A,Et+B(g,;H-"`<)X55%15I&;cHOe8QnP*8l%ht779^H+@\Xa8PD]T8OZPe
$4R>177KjD73G2u6m,<(:J+&C<$4n$6W-]Y%13OO779^H+B_K?;BT^mA8lR-Anc'm/no'A%13OO
<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JM?+%13OO<+oiaAKYE%AKY`1F*&OGDf'&.De:,6
BOr;Y:IH=EEa`I"Bk(^q+A!\h@<Q3)AoDg0A0?#9AS-($/g)9&F!,aHFWbgJAKXT@6m-bnFWbmB
Cht55Ec5Dq@Vg<4Anc-n+F.mJEZf:EDBNe-FD,T'F"SRX%13OO8S0)jDfm17Bl7H(@;[2r+E_a:
Ap%o4D.Rg&De'u0Ch7$rAKYf#F<GF3+DYk5G:k!\8K_MODBND"+ED%%@q]Fa+CT@Q%13OO8oJB\
+@9LPATAn&$;FrL@qZu?0JPNr$=[FZATDNr3B9?;D..-p/n8g:%14Nn$4R>WDe*C$D/_6f9L2!E
8Q8AP4ZX]58l%ht-o*4o;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08-OgDV5sdk;<(Ke_4ZX]>+?CW!
%15^GBPnq\/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue
+DbIq+Co&#Df0W<Eaa'$F!,.7G9D!G+Dbt)A0>E*D/^Ui:IH=H@rc:&FE8QV+ED%:Bldir+D,P4
+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P7ScBO;a!/a0b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38T&WjDe+!#
FD5Z2%15^'6m-PhF`Lu'+Cf>#AKY].+Co2-FE2))F`_2*+DG^9FD,]+AKXT@6m-#_D/^V=@rc:&
FE9&W7!3?c+EM%5BlJ08+CT;%+E2.*Bl5%Z;aX,J+A*bt@rc:&FE8RHBOQ!*@ps6t@V$ZuDdd0f
A0?)1FD)dh-Z^DOFCB&t@<,m$F(96)E-*4AEc5H!F)u&5B-;A/Eaj)B%13OO<+oue+DbIq+CT>4
F_t]2+A,Et+CT.u+EM[EE,Tc=Bl7Q+@:WneDK?q6@<Q3)@V'+g+DG_7FCB!%ARmD98l%ht@;]Tu
F*2G@DfTr6DJ()#A7TUrF!+t$DBND"+DG_7FCB!%ARlp-Bln#2FD,5.8g&(]@r#LcAKYhuDII0h
E\7e..1HVZ67sC&D]j1DAKYD(A9Da.+EM%5BlJ/:8l%htD09oA+C\n)@:OCnG%D*iEb065Bl[c-
-YI".ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36Z6jSBkMR/AKYD(IVNe3F)Q2A@q?cnBl[cp
FDl2F%16'Q+EDUB+CQBb:IH=9F_u(?F(96)E-*4DBl.g*Gp%$EASrW!+Dtb7+Co1rFD5Z2@<-W9
@;]TuF`V+:-nlf*0I\Us%13OO7W3;iFD,B0+DbIq+EV:.+EMIDEarZ'A8,OqBl@ltEbT*++CT;%
+CfG'@<?'k+DG^9FD,5.."4ca6rQl];F<l%+ED%0@<?4,AKYMtEb/a&DfU+U+<Xg*FWbmBCht53
AS#BpFDi:3Df00$B6A6++CQBb+D,P.A7]d(FDi:@DeX*2+EVNE@;[2r@ruj%C`m8&Eb/a&DfU+U
+A!\S<)QLe7nd&.;FNrK9he&O6m-VnBl7Q+@3B)pEb/a&DfU+GFD,*)+DGm>DJsV>Bl5&8BOr;Y
+EMgLFCf;3FE1r(+Wsp+FWb45DC9NKG@>B2+F.mJEZf=AARfFmF`S[9Bk)7!Df0!(Gp$X+FCAWe
F(KD8@V'7kB-;D4E+NQ&@X0)1DKBo.Ci!g'B-;;0AKYl%G]Y'#+Eh=:F(oQ1/e&-s$:8<9DfTD3
E,ol,AS#CdDJ()%Df00$B6A6++CQB@IS*C(;bpCk6U`FHA8-'q@ruX0GqL48DBMP2/hhMm8l8P1
F*VhKASlK2FD,5.6Z6jSBkMR/AM6MkCh.*tF!,=2DKR(?E+Np.+EV:.+Co2,ARfh#Ed8d>Derrq
EZek1DJ!TqF`Lo4Bl@l3Anc'm/e&.:%15is/g+YBDJ!TqF`M%9@3C"k:IJ,W<Dl1Q+Co2,ARfh#
Ed8d:AS,k$AKYr4De!?iA8,po+EVNEFD,5.DIn'7+EMX9E%VS,%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Aucf
Dg#\7E,oN5BlA-8+DbIq+Co1rFD5Z2@<-'nF"Rn/=$]_Z8PVc:+B1m#+AP@-<$5+=78P+)786QY
78k<s8OHHK:JO2R8OZQ#6W-?=<(01t6<PF-;FsY^+Au37;]nk*+B1m';]nb"67sB'<(KG#6qKaF
8P`)I;Fs;U+=MASBl%j,Ddd0-+DPh*Ci<`m/0J\GA7T7pCi<`m.3M\`9M?Qq73Fue9LVoL6nTT)
8Oah*:K8N)5uL,o5se@I<$5.273Frn:/jYW<)Xo87NbZ$78lVt6qKaF8P`)I;Fs;U+@K!J:/=h3
79DuG<E)C0<(KG#:.88a+A>'f+B)6.:bE1a%16'JBlbD<FCfD6A7]@eDIml3@3B`)Eag/5BOQ!*
Eb0*+G%G_;CggcqF)Q2A@q?cnBk)7!Df0!(Bk;?<%14Nn$;tGPDg#\c@:E/RF`Lu'6tp.QBl@lt
EbT*+?YO7nA7%J\+>Y-$+>=63BkAt?-[nZ`6rQl];F<l#+>#VsEc5l<4Y@jlE+*j%+=DV1:IJ,W
<Dl1Q-Qlr</e&.1+EMC<F`_SFF<Dqs+A,Et;bpCk6U`,.Bl[cpFDl2F+DGm>DJsV>F(KH9E$-_T
F(KH9E$/S,A0>u7Gp$O.@;0U3-OgDoCia0%AhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IDASu("
@;IT3De*p-F`Lu'05>E9/no'A-Qlr</e&.1+EMC<F`_SFF<Dr':IJ,W<Dl1Q+CSekDf-\3F!,@=
F<G:8F*(i,Ch7-"/KebFF*(i,C`m/(A0>u7Gp$O.@;0U3-OgDoCia0%AhG2t7TW/V+CoCC%144#
:-pQU@r,^bEZf:CF<G+.@ruF'DIIR2+Co2,ARfh#EbT*+%144#F(f-$C`k*GA0<OH+>7^W+t"oi
Ec5l</14\FFD5Q4Ci<`m-RgSo+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>\\1fCi<`m
-RgSo+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>\\1fA7]q#Ddd0(.4chj-OgD*+EMC<
F`_SFF<Dr)@:C@$ASlC)Eaa!6+=MGJDCH]LDfp)1AKYMt@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!
BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4DBMPI6rQl];F<kqE+*j%F!,C=+A?Ke
Fa,$;DIaka@:LF$H#n(=D0$-n+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX06MANCiaE2@:U_p$6UI4
BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA8H0mA1%fn+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9
A7]q#Ddd0(%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9-uEC&05P??Fa,>XF)Q2A@q?cnBk)7!
Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.Dfp+D
FCf<.DfT9,Gp$p3@N]`1F`Lu'+Co1rFD5Z2@<-'nF!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$;tGPDg#\7@;^?5E,oN5BlA-8+Dbt)A0>\s@N]2q@ruF'DIIR"ATKI5$7QDk
:-pQUF`)52B5)F/ATAnF+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcEb/lo-9`P63[]&lBl%j,Ddd0!
C2[X!Ddd0!C2[WnAThm.@:U`.>9G^EDe't<-OgCl$;No?+Cf5!@<*K/F`\a:Bk)7!Df0!(Gp$X3
Eb/a&DfTQ'Et&ISASl@/AP?NA;f?f!@qA&B@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[b
Eb/[$AKZ,;Bl%j,Ddd0!A8,OqBl@ltEd8*$7!3?c+EM%5BlJ08+CT;%+Dbt)A7]9oBl8$2+Co1r
FD5Z2@<-'nF"SRX6ZQaHFCcS'+=MASBl%j,Ddd0*+Co1rFD5Z2@<-WG%14Nn$;No?+CfG'@<?''
@3BH!G9D$MBl%i5A8-'q@ruX0Gp$g=+=M\2:IJ,W<Dl1Q.3L2bBlkJABl%T.@V$[&AStpnARlp"
@<?($%15is/g+;8FWbODF*&O7Df00$B6A6++=M\2:IJ,W<Dl1Q.3N&:A0>i0Bl8#8FDi:1DBN@t
FEM#.+D#D/FEo!>Bl[cpFDl2F/e&-s$>sF!A0<7BFD5Q4Ci<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q
06MANCiaE2@:U`74""lRBl5&9FD5Q*FEo!>Bk)7!Df0!(Gpa%.%15is/g+Y?Df]J4@;^?5DfB9*
+Co1rFD5Z2@<-'nF!+n/A0>f0ASqqaDe't<F`_>6F)5c'A1&L(+>Y-YA0<6I%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-!k=(l/_+A,Et+CoV3E$043EbTK7F!,LGDBO%7AU,D/D]iq9F<G+.F*)PF@N]r7F`JU7
F`MM6DKI!n+D#G6Bl\-0D.RU,/g)9&Cht5<DfTB0+CT;%+Co%qBl7Km+DG^9@3BH1D.7'sARlp)
@rc""@q[!$De!3lAKZ).@<<W+F!+t5ART[lA0?)0ASrV_:IH=ADdd0t/g)9/:IH=9F_u(?F(96)
E--.DA8-+(CghT3D.Rd0@:s.m+CSl(ATAo0Ddd0jDJ()$@<?!mATJu4Afu#$C1UmsF"SRX<+ohc
DIn'7+DbIq+EMX9E$/t8@:XF%FD,5.F`_>6BlnVCA8,OqBl@ltEd98H$4R>D@<-7"DJ)!QA9Da.
+EM%5BlJ08+Ceht+C\n)G%G]>+DbJ,B4W3,D]ib9-Z^D=+D5V2A0>SsARQ^'D]j1DAKYDtG@>c<
+E_a:+=Joe3d<)++<X?r@:X(iB-:V*A9Da.+EM%5BlJ/:Bl8$2+A*btATMp,Df-\/A8-.(EcW@5
@;[2tEaa$&+A*bgDfQtDATE&=Cgh?sAKZ&(EbTK7F"Rn/.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AH
A0>u-AKZ,;Bl%L*Bk;?.A8,OqBl@ltEd98H$7QDk:-pQUEcl7BFD,5.F`_>6F!,"9D/^V=@rc:&
F:AR2+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM81JBl%iCBkh]:%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[qAS5RlATD4$AKZ,;Bl%i5@rcL/F!,L7An?!oDI[7!%16'JAKYetF*&OAATMp$
B4W2rBle60@<lEp+C]U=@3B*'D/^V=@rc:&F<G:=+CQC5ASl.!A7]d(FDi:BAS5RlATD4$AKYK'
Df]tBEb/ioEb0,uATKIH+A,Et+Co1rFD5Z2@<-'nF!,=.Bl8$$Bl5&;DfTA2@rcL/F!,L7An?!o
DI[7!+EV:*F<G"4AKZ,:ARlotDBNe)DL!@K@<loH+<XWsAKYK'Df]tBEb/ioEb0,uATJu&Eb-A2
Dfd+CFDl22A0>T(+CoV3E-!.1DIal,F`VXI@V$[&ARfal@<?'k+CSl(ATE!'Eb'5D%14Nn$;No?
+ED%+ASu("@<?''F`_>6Bln'#F!+t5Df]tBEb/ioEb0,uATJu&DIal2BQ&);Anc:,F<EF`D.Rd0
@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R=O$;No?+DkP&AKZ,;Bl%L*Bk;?.@3BT%
@:UL!DJXS@A8,OqBl@ltEd8*$A8lU$F<Dr/76s=;:/"e<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!
C2[Vl$<1\M+E_d?Ch\!*ATJu)Bk)7!Df0!(Gp$gB+Du+A+Dbt)A7]9o@;]Tu@rcL/F!,L7An?!o
DI[7!+D>2,AKYGnASrW5E+EC!ARmD9+B38%@rH4'Ch7^"+EV:.+ED%7FDl2.FD5Z2+E(j78l%ht
F)Q2A@q?cmDe*E%G@_n7Dg*=6Eb/[$AKYE!A0>],@:UK/C2[X!Ddd0*+CT.u+=LuCA7T7pCi<`m
.4u&:.1HVZ67sBjEb/[$AKYMt@ruF'DIIR"ATJ:fDIn$&+=CoBA8H0mA1'GeC2dU'BHS[O8l%iR
:K::[75&CoA8H0mA1&ff-YdR1+EMIDEarZ'@rGmh+Co1rFD5Z2@<-W@%16uaG@VgDC2[WnAThm.
@:U`I-u*^0FD)dEIS*C(;bpCk6U`YCDe*BiG&2)*A1&ff-YdR1+Co&,ASc:(D.RU,+E2IF+Co1r
FD5Z2@<-W@%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%htF)Q2A@q?cmDe*E%A7]^kDIdf2Df-\9@VTIa
FE8R=DBO%7AKZ,;Bl%L*Bk;?.A8,OqBl@ltEd98[+B3#gF!,L7CghF"Df0W0BlG2/F!,=.Bl8$$
Bl7Km+C]U=FD,5.E+*j%+E):2ATAo3AftVu@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp%$E
ASrW$Bk)7!Df0!(Bk;?.%14m6De't<-OgCl$;No?+E)41DBL?BDe*[&@:Uf0@;]Tu.!9WGCiaE2
@:Uer$?'Gt4$"a(De*[&@:UL'FD5Q4Ci<`m-OgCl$;No?+Co2-E,8s.+Co1rFD5Z2@<-W9Bl7O$
Ec#6,Bl@ku$=mj]INTae%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+A,Et+EMIDEarZ'@rGmh/g)99
BOr;Y:IH=9Bk)7!Df0!(Gp$X?D/^V3F!,:-EbAr+@V'%XF`V+:BlkJ-Df0Z*Bl7u7@3BW6@WQX"
DKKT$C`m/'Dfor>+E(j7A8bt#D.RU,@<?4%DBNA*A0>u*F*&O8@<>p1+A$YtD..]4FCArr+CQC)
ATo86Df'''FE8RHD]ik7@:Uu"$7QDk:-pQUCi<`m+DPh*%14d43\V[=C2dU'BHS[O@:WneDK@ID
ASu("@;IT3De*p-F`Lu'05>E9/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;IsKPDImisFCcS0De'u#
Ec6#?+ED%*ATD@"@qB]j$:8<9DfTD3Eb/lpDImisFD5W*+DPh*-Z^D?Ec6#?+ED%*ATD@"@qB^(
Ci=6-+CT@7FD,5.DfB9*+Co1rFD5Z2@<-'nF"SRX<+ohc-u*[2Ci<`m.3N/8@ruF'DIIR2+Du+A
+D>2)+CQC5AS,LoASu!h+E1b2BHVD1@<<W+DI[L*A7]g).!9WGCiaE2@:Uf>%14Nn$;No?+Du+>
AKZ).AKWC9De*[&@:Uf0E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%ht@rcL/F!,L7
An?!oDI[7!+EqO9C`m8"E+Not+E)-?F`_>6Bln'#F"Rn/.1HVZ67sC$AS5RlATD4$AKWC9De*[&
@:Uf0@rcL/F!,L7An?!oDI[7!+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(
-9`Q#/g,1GG&JKN-OgCl$;No?+DkP&AKWC9De*[&@:Uf0@3BT%@:UL!DJXS@A8,OqBl@ltEd8*$
A8lU$F<Dr/76s=;:/"e<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!C2[WnATeLi:2b>!Ch7]9F!,:;
@:UKhDIal"Ec6#?+ED%*ATD@"@q?c2C2[WnAThm.@:Uf>+<W(IDe*BiG&2)*A18X8F!,[?@<<V`
+CehrC`mh5AKW1-ATfYA@<lF)+tau\<+ohcA7]p9CghU#EZf(;+CQC3F`\a:Bk)7!Df0!(Gp%3B
@<<W5BlnD=Df-\>Df?h;AftM)DKTf*ATAo3Afu/:@:F%a+Co1rFD5Z2@<-'nF"SS'F`M26B-:_r
G%GK.E,B0(F<GL>Cj@.FBOr;sATfYA@<lF)+Cf(nDJ*O%/g)9>Dfm14@;[3!@<6.!Gp%-=G&M/-
+CQC'ATfYA@<lF)+Co1rFD5Z2@<-W9@X0)+Ci=B/DJ()+F=n"0.1HVZ67sBjCi=B++E)41DBNJ(
@ruF'DIIR"ATJu&DIal.E+No0Bl5&'DfTl0@rri4@<?0*DfTB"EX`@3+E(d5-RT?1De'tP3[\Z\
A7T7pCi<`m+DPh*Ci<`m+E_d?CiaE2@:U_p$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!@;]Tu@rcL/
F!,L7An?!oDI[61%14Nn$;No?+Dbt)A0<:8De*BiG&2)*A17rp0HiJ2+?XCX@<?0*-[oK7A8c@,
05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKDF!hD(%15is/g+kGF*2M7+CT@7Ch7$rF<GL>AKYW+
Dfp"AAU%p1FE8QV+Co%qBl7L'+E2IF+Co1rFD5Z2@<-W9E+*j%%16`gE$-NCDe*d(-Tc`/+D5_6
+=CoBA8c?5%13OO:-pQU@rcL/F!,L7An?!oDI[5e$8irQ/g)hjB5DKqF!a'nI4cX_AThu7-RU#G
$4R>;67sBkAThX$DfBQ)DKI"?@<?0*A8,OqBl@ltEbT*+%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[fASu("@<?''Ap%p+Gp$U8D/Ej%FCeu*C2[W*F(96)E--.1$<1\M+A,Et+EMIDEarZ'@rGmh
+Co1rFD5Z2@<-'nF!,.)G%De6Dg*=5AS#a%Eb0<6DfTE"/g(T1%16'Q+D58'ATD4$AKYT-Ci"A>
@rH4$ASuU$A0>u7@:X(oBl@ltC`l=mF(96)E-*47Bl%@%+D,P4+EV:.+Cf>,E,TW*DKKqBDe:,6
BOr;Y:IH=HH#n(=D'4+BFWb1&DBNtBDBN@1F(96)E-*4DFDl22A0>T(+EV:.+A,Et+Co1rFD5Z2
@<-'nF"SRX<+oue+EMX9E$01DDK?qBBPDN1F(96)E-*]A$7QDk:-pQUB4YslEaa'$+A,Et+EM%5
BlJ/:Anc'mF!,17+D,b4Cj@.5Df'?&DKKH#+D,P4D(Z8)EbupH@WcC$A86$nF)Q2A@q@"s$4R>;
67sBjCi=B++Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Aucg@;TQu8l%ht
Ci<`m+Co1rFD5Z2@<-'nF"Rn/<+ohc8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*++CT;%+DtV)
ARlo3C2[WnATfLF-u*[2.3N&:A0<:CFD5Q4.4u_c9jqpb+EV19F<G"0A0>?(Bl%<&F(96)E--.D
Bl5&8BOu6r+Co1rFD5Z2@<-'nF!,=.CLnW2F(HJ4Afu2/ATME*DIIBnF"SRX<,WmiBm+&1Bl8$2
+A,Et+Cf>#AKY]/-Z^D=+D5V2A0>SsARQ^'D]iP.E-WR7DIal1AStpnAKZ).AKYf-@:UKkBk)7!
Df0!(Bk;?<+B<;hDf'?&DKI"0DIal1F`&=DBOr;uDes6.GA1r-+Dbb0ATJu9D]iP.E-WR7DIal1
AStpnAKZ).AKYf-@:UKkBk)7!Df0!(Bk;?<+:SYe$<KMk:.\2N3ZqEt6VgEN78?f):JOSd+A#$F
=\i$?6r+q#:K/H&9N";F6s1X'5upDs-u*[2A7]p5+=LuCA18We:.-3QF`_>6F"&5"8OHHK:JO2R
8OZQ1%14Nn$;No?+E_RBAS5^uFCfJ%$;No?+>Y-\AS5O#4s2pJ-ZsNFCiaE2@:UKqDe*[&@:UKq
De*BiG&2)*A0?#:Bl%i5C2[W*C2[WnATfF1$4R>;67sBjCh7$q+CT/5+DPh*+EMIDEarZ'A8,Oq
Bl@ltEbT*+%15is/g*o-FCdKU@rH4$@;]Us+CT;%+BN8pA8c[5+E):7ASuU$A1euoDfQtCDJ=><
F*VhKASlJt$;No?+ED%1Dg#\7@;]Tu@rH=3+Co2,ARfh#EbT*++DkP)F^]*&GqKO5:-pQUF(f-$
C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%i<.4chj-OgDX67sC%BOu!r+=D2?
+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1f-RgSo+t!g,:-pQUF(f-$C`k*GA0<OH+>7^W
+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7p-RgSo+t!g,%15is/g+YBE-WR:Bk)7!Df0!(Bk;?.
/Kc]X+E)4@Bl@l3@rH=#ATJu7AT;j,Eb/c(ASlC.Gp%0N@Us1nARfh#EbT*++:SZQ67sC%BOu!r
+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%j,Ddd0(.4chj+<i0a-u*^0FD)dEIS*C(
;bpCk6Ub7&FD5Q4>ULsO-R'ZdAKWXO-OgDX67sC%BOu!r+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR
:K::[79jSGA8H0mA1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1f>ULsO-R'ZdAKWXO-OgDX
67sC%BOu!r+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7pCi<`m-RgSo+s8'W/1>7P
@<?0*-[nZ`6rQl];F<lXC2[WnATh<+.4chj+>7:K06noS$4R>;67sC$AM%q6B5)F/ATAo;Bln#2
DIn#7DIIBnEt&IO67sC$AS5Nr-ZsNFCi^sc-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4-Rh,)B4Ysl
Ea`c,F`_>6Bln'#F!hD(:-pQUEb/lo+=CoBA1'GeC2dU'BHS[O8l%iR:K::[79jSGA1&ff-YdR1
+EMIDEarZ'@rGmh-OgDX67sC$AS5Nr-YdR1A7]p34"+i_@<?0*-[nZ`6rQl];F<lXC2[WnATfFM
4""c]A0>DoG%GK.E,B0(F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*E"D..I1%16'JBlbD5@:C@#BQ&*+
A0>Q(G9D!G+Dbt)A0>E*D/^V=@rc:&FE9&W+A,Et+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'nF!,[<
Eb-A0Ddd0fA1euI<,Wn%F(HJ9BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"ATJu2@;BEsF*2M7+EV:.
Gp$O9AKYl!D.R6#-u*[2A7]p5/0H?UDe(:>@;]Tu.!9WGCi_$X%13OO8oJB\+@9LPATA4e9jr'P
BHT&a0fTUL@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk%16igA8,q'Ec3]j9L2!E8Q8AP4ZX]58l%ht
-o!.n8T&WjDe+!#FD5Z2-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/g*JhCLqMq$=[FZATDNr
3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue+DbIq+DG_8Ec5K2@qB^(FD,5.8l%ht
F*VhKASiPA+ED%:Bldir+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P78d#Z;H#_>+>F<49L2!7
:IA,\4ZX]>%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-\!BOQ!*BlbCh:IIDV$;+)^+DGm>@3A/bGAhM4+EMXC
Ea`Tl+CT.u+ED%8EbT*.@;I'-H#n(=D(Z8)%16'JAKYGjF(o,,Bk1d`+C\nqBl7H(8l%htBlbD=
BOQ!*8g&(nDeF*!D/F!)B-:o0+C\o'F<Ga@ATq]r+CT=6DfTK!DJ=E2DJ()#+Cf>+Ch7*uBl@l3
De:,9DfTB0+EVNEE+O'%DfT\;@3BZ#F)*BN:NC)VDJ=E.A0>B#Ci!ZmFD5Z2F!,C5+EqaEA9/l,
@<Q3)@3B#jFED)7+DtV)ANCr%8OHHK:JO2R8OZQ$%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=>
F!+m68g%PQA8c?<+<X6t+DGm>Bl8!6@;KakA0>T(+EV:.+=M\IA7TUrF'N?hDImisCg:^nA18X1
Ea`iqBHV5*+EV:.+CfP7Eb0-1+A*btH#n(=D'3G/Ch.*t+C]U=FD,5.E+*6l@:s-oD..<jB4Z*+
DfQt0Gp%6IH>.>;Bl7Q+FD,5.A8-+,EbT!*FD5Z2+F7a@+=LuCA1i1BE%*C^+B3#c+Dtb8F<GC.
@N]`6AT/c+DJ=3,@;KY(ATJu9BOr;Y:IH=HH#n(=D(Z8).1HVZ67sC'F(Jl)@X0)<BPDN1Cggc^
$?B]tF_Pl-+=Cc8Ch7Z1A8-',FCB6+-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;flGgF<F1O6k'K&BPDN1
F*(u4+EMX5Ecc@FFD,5.8l%htF*VhKASj%/$7QDk:-pQUF*(i2F<G=:A0<HH@rc-hFCfM9D..L-
ATAo*Bl%?'BkAK*ARf:mF('*7%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMhgD/XT/+E)(,+DbIq+Co1rFD5Z2@<-'nEt&IK:IH=>F!,17F*(i,Ch7-"GA2/4Dfp.E@;^?5
A8,OqBl@ltEbT*+/g)8Z<,Wn%F(HId:IH=NDfm1>F`VXI@rc-hFCcS9Df'&.A8,OqBl@ltEbT*+
/g)99BPDN1CggcqF`V,8+D,P7EZeq<@;Tt"AKYMt@ruF'DIIR"ATJtBCggd%/0H?W@:EbYFt"sb
.!0BQ.3N&:A0<:>CghU.ASrqL+<X9P6m-#S@ruF'DIIR"ATJu&Eb-A'Eb/[$ARlp-Bln#2FD,5.
-uNU?A18WFDIn#7A8,OqBl@ltEd8iOG%G]'/g(T1%15F5AoD^$+CfG'@<?4$B-;#!@N]2q@ruF'
DIIR"ATJu7ASl@/AKYE!Gp%'HBlA#7CggcqA8,OqBl@ltEbT*+/g+,,BlbD<FCfD6A7]@eDIml3
@3B]7Bl%L*Gp%3B@<<W9Bl%T.ATD4#AKYMt@ruF'DIIR"ATJu+Ec5e;A7]@]F_l.BCi<flFD5Z2
F"SS,F<G:=+EDUB+DG^9FD,5.DIn'7+EMX9E%W7B$4R>D5uLHL:.I>f8Oah%84=Y#786TS;F+2`
+A>'f+@Jdg<(Tk\5uL9C;]nG':/jMN:*<,'7ScoV5u^EO:*<\8<?OXp;FM]o6;LT\+@K!J:/=h3
79DuG<E)C0<(KG#:.88a+A>'f+B)6.:a$8T.1HV^ASl@/AP?NA6tp.QBl@ltEbT*+?YO7nA7%J\
+>Y-$+>=63Ec5l<4Y@jlE+*j%+=DV\F(KA>%16f]/g*_T=%Q.0A8a(0$6UI4BOu!r+=D2?+>7dY
06&*Y-S0:VDfdNX>\\1fA8,OqF'NNi@Us%n+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eE
C2[WnBk)7+>\mhX+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>]an0+t!g,
+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>]=LfH#R>4+t!g,+<Y`BDfp/@F`\`R
9OVBQFCf<.DfT9,Gp"MZBl5@BA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC
%144#:-pQU@<QR'A0>>t@;]k%+DG^9E+*j%F!,C=+A?KeFa,$;DIaka@:LF$H#n(=D0$-n+<Y`=
ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A8,OqF"_?<@Us%n-OgD*+EM4-Cht4AEbupNEb6FA/95ZI
F=\dmC2[WnBk)7+05P'+-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+06D,X-OgD*
+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05t`9H#R>4-OgD*+EMC<F`_SFF<Dr)@:C@$
ASlC)Eaa!6+=M)8@kVY4DKU1Q+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<
F`_SFF<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9CggcqA8,OqBl@ltEbT*++DkP)F^]*&
GqLHR$>"*c/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@DEbTH4+DbIq+Co1rFD5Z2
@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5+Co1rFD5Z2@<-'nF!*%WBkM=%Eb-A)EcQ)=Et&I1+>=o`
+>Y-YA0<6I%13OO:-pQUF`)52B5)F/ATAo%DL!@@@:C?iBk)7!Df0!(Bk;?./Keb?DJsQ,+D#S6
DfTn.$8<SV+=&'c+ED%+A0sJ_4$"a*@:EbYFs(U0@N]c2Gp%'B@<lg'DC5l#%15is/g,1GD/XT/
+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;?.@;]Tu@;Ka&@rH7,ASuU2+>"^MB5VX.AKYQ)Ec5u>%16!E
D/XT/9OVBuBk)7!Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\QF!,OGAT/c%Eb/[$ATJu9
BOr;7Cggd%+CT.u+=M&7@Us%n.3N/8@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp%$EASrW$
Bk)7!Df0!(Bk;>p$8WfCA0<6I%13OO:-pQU@rc-hFCcRCCggd%+CT.u+<W(K@:EbYFt"PEBk)7!
Df0!(Bk;>p$>sF!A0<79@:CSn$>sF!A0<79@:EbYFsd_+%15is/g+tEF*&O5G%#*$@:F%a+Co1r
FD5Z2@<-'nEt&IpA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[nE+Np$DJ()#+Cf5+F(oN)+Co1rFD5Z2
@<-'nF"Rn/<+ohc8l%ht@rH4$@;]TuAoD]4DfB9*Bl7Q+@;]Tu@r-()Bl7Q+A8,OqBl@ltEbT*+
+DGm>-uWWF+E)9C-uX'9DBNJ(@ruF'DIIR2.4u`8:IH=8Df'?"DIdf2@<,p%F(fK4F<G"0A0>Gl
F*SmMD]j.IE+LX2$4R=jDe(:>@ps6tDfB9*+Co1rFD5Z2@<-'nF!+@L5t"dP8Q8,$@;]Tu;FNl>
:JOSd/g*H$+F.mJ+Dkh*BQPA.G]75(F<FIM5t"LD9N`KKBk)7!Df0!(Bk;?.@ps7mDfd+2AKYJr
@;]^hA0>?,+A,Et+Cf>,D..<mF"Rn/.1HVZ67sC!E+No0Eb/Zi06_GNFCbmgDe't<Cggd`ATfF1
$4R>;67sC!E+No0Eb/Zi05k`EGmt*9+E(d5-Z!4#-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+Cf>,
D..<m+ED%8F`M@B@rGmh+C\c#Bk)2n$:/KE+A,Et+Cf>,D..<mF!,L7FEMVA+C]86ARlp"BleA=
Eb0<7Cij_N+B3#c+D,>.F*&O=FCf;3BlbD*+ED%8F`M@B@rGmh3Zoh*.3N8ADe't=0I\,R@:Uu5
+Aucf@;0UnDJ()+FCf<1+CT;%+Dk\2F(&]mF!+n/A1SjGF*1o-Cj@QSATDg0EZfC6CghEsA0>T(
AoD^,@<?4%DD!%S8l%ht@rH4$@;]Us+E1n4AoD^,+D#e>ASuR'G%De)EbBN3ASuT4@q]F`CM@[!
/g)9.AfuA;FWb.6ART?s@3A0<6m,uXD/E^!A0>i-ARTXk+D#CuBl"o/AKWC1@;BFpC1K=b5\FqB
Bl#D3Df$pG@;]TuFCf9)+Dk[4GA(E,+F.mJ+Co1s/e&.:%15is/g,4RD.Oi$EcQ)9AT)^4+E)41
DBNG-D/E^!A9/1eDe't<Bcpi$+CQC0Ble?0DJ()&Bk)7!Df0!(Gpa%.%15is/g+V3A0>u>E+O)"
$?'Gt3=Q<)$;No?+C\bi+ECn.CNBplDe'tH+>Y8j@W-04%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[nDJX$)
AKXT@6m-#Y@s)X"DKK</Bl@ku$;+)^+D>2)+D#e>ASuR'G%DdEE+EQ0+CoD#F_t]-FCB9*Df.0M
8l%htA8bt#D.RU,@<?4%DBNFtDBND"+CSbiATMp(A0?)1FD)e=BOr;7C2[WrASc<7+Eh=:@P/)s
%14LuDe*NmCiCgGF)YQ3DK?q/+AbHq+ED%%A7]d(FCB6+/g*b^6m-VnAKXSmF!+t2DJ!TqF`M&(
+AbHq+ED%%A7]d(Df-\!Bl7I"GB4m8DIak`Bl8'<+EMgLFCf<1+CT.u+EV:.+<k`CASr\7F(f-$
C`m5+D/E^!A0>f.+AH9SF"Rn/.1HVZ67sBkBle60@<itf:IH=9De!p,ASuTuFD5Z2%16igA8#Oj
E$-hD$4R>;67sBsDe!3tBl@l3De:,/@;0U%8l%ht:ddbqA8bt#D.RU,%16ih@<?0*-[oK7A8c@,
>\@VcATD3q>\\1fA8bt#D.RU,>]=4cA8bs*%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cBk)7!Df0!(Gp%'7
FD,_)$<1\M+E)41DBNJ(@ruF'DIIR"ATJu4Afs]A6m-#OAnc-o+CQC6ARTUhBHU`$A0>JqFCSu,
E+*j%/g+,,AKWC3Bk/Y8-tI%%FD5Z2@<-W9Bk1dmFD5?$@psInDf.!HG%G]'+Dbb5FE8RHBOr<*
@<?08%14Nn$;No?+EM47G9Cj5FD)*jA8,Qs0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\M+Cob+A8,Nr
AoD^,+E(j7-tI%&.3NYBFEMVAF!,")FCAm"F!+n#Dfp.EFD,5.@rH7,ASuU2+E(j7ART(^+Co1r
FD5Z2@<-W9Df-\>BOr<*@<?08%14Nn$;No?+Co1rFD5Z2@<-W9A7]jkBl%i"$8<T5Bk/>?%13OO
:-pQUA8,QsINU<e+<XEG/g+h9DIe#8Bk1prD%-g]$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+E(_(ARfg)
DfTQ'DKK</Bl@ku$<1\M+A,Et+EMgLFCf;3BlbD*+Cf>,E,9*-AKYE!A0>DoFCAm"ARlopG[YH.
Ch4`-Afu#$C1Ums+E):7ASuU$A0>i3DeF*!D/F!)B-:o++A+7/+B3#c+EMgLFCf;3@rH7+BleB;
+E(j7@3BH1D.7's+E(j7@r,RpF(KD8-ua3<AncL$A0?)1FD)dE@;9^k-RgYj+BN5fDBO%7AKZ&>
F*(u1+Dbt)A9/l%+Eh16Bk;C3+E(j7DdmHm@ruc7@<,p%@rc-hFCeu8+<XWsAKYGjF(o,,@<,jk
BlmorFEMV8+DGm>@3BDqBl5&(Bk)7!Df0!(Gp%$7C1Ums+EV:*F<G(3DKK<$DK?q4Dfp(CF*1r1
@VTIaFE9&W7:B\>+E)41DBNJ(@ruF'DIIR2+DGm>@;L"'+CT>4De!KiFCeu*GA2/4+CQC'Bl[cp
FDl2F+E(_(ARfg7+@KpaARfh#Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlolDIal#ATMs6Dg>o)+CT=6
Eb065Bl[cq/e&.:%15is/g,(AC1UmsF!+q'B5)7$Bl7Q+GA2/4+=CT4De(4<@<,p%FD,5.8l%ht
@r,RpF(KDF%16T`DJUFL%13OO:-pQU8l%ht@rH7+BleB;+E(j7F(okA@UX=l@j#]!C1UmsF!+n/
A0><%%15is/g,">DL!@8Bl[cpFDl2F+E(_(ARfh'+CT=6FD,6+AKYE%AKYr#FD)e2FCf<1/e&.t
Df0A60b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+ohcE-67FA8,OqBl@ltEd8d;Df0&rE-)Nr<+ohcAnc:,
F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+DGm>F)Y]#Bjkg1+<X6t+DGm>FD,5.Df0B:+<Y3/@ruF'
DIIR2+EV:*F<G(%DBND"+Dl%-BkD'jA0>?,+A,Et+Cf>,D..<mF"SRX6=jY8F`V+:D/XK;+Co1r
FD5Z2@<-W9D/Ws!Anba`FD5Z2F!+n3AKYr7F=2,P8K_MOCht59BPDN1A8,OqBl@ltEd8dLBOr;1
E-67H+Co1rFD5Z2@<-WG%13OO8TZ>$+DG\3DfTr.DKI"CD]j1?A7]e&FCB&t+EV:*F<GjIFWb1&
DBO(CAKZ).AKYK$DKKH-FE8RCAfu2/AKYo5BOu3,A8,OqBl@ltEbT*++E)-?FD,5.E+*j%+C]J8
+F.mJ+CehtDJsV>@q]:gB4W3-BOu$'Bl5&%DL!@K@<jI7$7QDk:-pQUAnc:,F<GO2FD)e-Bk)7!
Df0!(Gp$gB+EV:.+E2IF+Co1rFD5Z2@<-W&$=mj]+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C0\@<?4$
B-;)'G9CF1@ruF'DIIR"ATKI5$:8<9DfTD3D/Ws!ApJ*.B-;;0AKYK$DKKH-FE8RCAftN"Gp$X3
@ruF'DIIR2+DbV2-Z^D?Eb/[$AKYD(DIn#7,'7aK+s:E1@ruF'DIIR2+CT.u+DkP&AKY]/+EV:.
+E2IF+Co1rFD5Z2@<-WG%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@ltEbT*+%14m6De't<-OgCl
$;No?+CfG'@<?''.!0BQ.1HW%ATqZ--Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;FrEAKWCCDg<cS
@3BN3F<G+.@ruF'DIIR2/e&.:%15is/g,(OASrW4Dg<lVCggd`ATf2)DIal+@:C?2+EVOI+DGm>
FD,5.E-67FA8,OqBl@ltEd8*$De'tP3[]#fGp$p3@Us%n+DbIq-OgCl$;No?+DG_7F`M%9FDlFI
BlbD;ART+&GB.D>AISuWE-#T4+=C&U5t"dP8Q8,+%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fATW$.DJ()#
DIal/F`__>DJ()9DfTB0/e&.ZDBO%7AKYT!EcZ=FF(Jj'Bl@l38K`(_Bk/>Y:IH=>F!+m6GAhM4
+EMXCEa`Tl+CT.u+ED%8EbT*.@;I'-H#n(=D(ZqR:2b>!G@_n*Eb-A6ART+p+EVNE-ua<N.3N&:
A0<:5ATT@DF)Po,+EqaEA90@4$4R>3Bl\9:+CfG'@<?''F)Po,+EqaEA9/l8D]j+CDfTDA%14Nn
$;No?+CfG'@<?''F)Po,+EqaEA9/1eEa`irDf%Wu+?qS7+>GPq0eb:(+AP6U+Du==ATDKp+Du+?
D@HqpAU&;[3ZoelBPDN1BlbD*+EV19F<GL6+EV:.+E)./+E2IDAKZ).Bl7Q2%16]`Ddda/4ZX]@
+=eQ\+>GQ(,;Cl+%170%D.7F"F$2Q,F#kEk+E).-AKYi.Eb-A;Bln#2An>OiBl7Q2%16Q_G\(DK
3ZpO/0d(0_+>P&q%17,aFD5Z2@;L!J3Zp.20H_kg,p4U"3b^2h0edi$+C60J0F\A3DJ<U!A7[nb
+E]^f-Zj$9F!,1<+Du+A+E_R9@rGmh-OgDo@:Nt63Zob%4s1sj+<VdL+<VdL:-pQUFCAZnF<G"&
G%G]'%16ZkE,95uBllL!+>b3%+>=63:-pQUAU&01Bk(k!+Eh=:@LWZh+=f&eGmt*0%13OOGAhM4
F$2Q,4$"a0@;]UoD'3q3G]Y'?Ci<a(F!,OLD.7F"F!+q1G\(D.Eaa'(Df0!"F!,UCBk)'lAKYPm
@qZurG]7J5@qg$4%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-ua<N.3N>G+EV:.+A,Et+Cf>,D..<m+EV:*
F<GXHDfTE1+EqaEA90@4$4R>@@<Q3)@;]TuATD4#AKZ).AKZ28Eb'5D+<XWlCLnW0Df'&.FD5T'
+EVNE@rH7.Bl7El+F.mJEcYf.Afu2/@<<W6BOr<1DfTB0+D>2,AKYGnASrW%Eaa$#A0>>mAoD^$
+E2@>@qB4^Bl7Q9%14Nn$4R>;67sC%@<Q3)GAhM4Et&IqF`\aMDfTB0%13OO:-pQUATD4#AKYMp
Anc-sFD5Z2Et&IfEaa$#+EqaEA9/1e%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15jKG9Cp;FE2),G%De<BOr<-
FDl22A0?)7Eb'56@;]Tu@q]F`CER_4@<<W6BOuH3@<,p%E,ol9ATDU4+ED%7FDl22A1e;u.1HVZ
67sBnATT&=DfTB0%16`ZF<GdGEb'5#$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>c@s)X"DKK</Bl@l30eb<k
$;YPN+E(j7D0[7CATT&6AS$$rF!,1<+E_R4De!p,ASuU$A0>B#A7Znn$4R>5Dg*=BAoqU%+D>2,
AKZ8:FWb@+A0>u4+D,%lAKYZ/DIdd!A90:ED..^!AKZ).Dfp,0DIdf>+E(j7Ch[cuF!,C5+Cf>#
AKZ22FD)e7@<-W9@3B&uD/Ej%F<G:8+EM70BQPjL6Z6gYASuU2+CT;%+Du+>+D,P4+EqO:E-!.1
DIal&Bl\$8/T#':/g+,)Ci!g'B-:]&D/Ej%FE8R5Eb-A%+D>2"Ci*U$CERP-+D5V2A0>B#A7[A&
$4R>7:IH=EEc6,8A7]g)@3BH1D.7's+E(j7G@>c<+EVNEA8bt#D.RU,+EqaEA90@G=(l/_+CQC:
DfTA2BlbD2DKKo;A9DBnA0>T.-Z^D=+D5V2A0>SsARQ^'D]j+CDfTD3@3BW)DfTqBDf0,/Ch[cu
+Co&)@rc:&FD5Z2+E(j7FD,5.GAhM4/e&.:%15is/g,4WDfTD3F(fK4F<GdGEb$;'ATM@%BlJ0.
Df0V*$8<S^+E2IF+=D2<DId[&-T`\r@;]UoD'3P1FCf)rEZfI4@VfU'%13OO0H`=tE-67F-Y6^r
BI>kh@;p1%Bk;?.Ch74#+CT;'F_t]-F<G[D+CT;2@<iu0FCf<1-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku
$;Y7V@rHL1F(HJ>Dfm14@;[32Bk;K2H#IhG+EMXCEb/c(A7]glEbTK7Bl@m1+EqOABHS^9ATT@R
%14Nn$;No?+D58-+EM47Ec`F8G]7J-DIIX$Df0V*$8<S^+D58-+=D2<DId[&-T`\e@:Nsu%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k9lG&`+Co&*@;0OhA0>E$@s)X"DKK</Bl@l3@ps6t@V$['FDl22A0>;u
A0>o(FE2),G%G2:+B3#gF!,OGAT/c.Ddd0t+CQC5ARTChF*),++D#e+D/a<&+E(j7GAhM4+CoD#
F_t]-FCB9*Df-\3DKKe>FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8d9DIal3BOu'(A8-+(CghU1
+EqOABHS^6Ble5B/e&-s$7KG!F)WQNBlbD*+A,Et+E_d?Ch\!:/g)9.F<G:=+EV:.+E).6Gp%9A
Eag/5BOQ!*Eb0?8Ec,q-$=P&eBOPpi@ru:&+Dbb5F<DuUBOu'(F*1u&ATMp)F_iKLBl8!6ART*l
De:,6BOr</F*1o-+C]86ARlo3Eaq1S@;L't.1HV5%15is/g+tK@:XF%-t?q!DJ*O%FE/fQ@;]Tu
-t?q!DJ*O%FE/fQA8bt#D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?F`\a:Bk)7!Df0!(Gmt+%
@rc:&F<Dr[@:WneDKB&qASu("@;K1`De**fDe*Zm@WPdj@:Eem@;Tt"AM>em/no'A-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$<1\QF!,OGAT2]5A8-+(CghU1+EV:.+Dbt6B-:`'@s)X"DKI";Ddd0fA0>T(
+EV:.+E2@4G%kl;F!,OGAT072$7QDk:-pQUF(fK9+Dbt6B-:`'@s)X"DKK</Bl@ku$8<S_+Co2-
E$-N<BOPdkATMs6-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39lG&`+E2IFFD5W*+CT.u+D58-FD5W*/e&.9
E-67O+CT.u+=Ll6F=A>@Eb-A5F_Pr/+D,G$G\LW'AKYE!A0>AjDBO"BDfTD3ASuU(Eb-A0De!3l
ATKIH+B3#c+Dbt+@;KLr+Ceht+C\n)DIIBnA0>f2+Du==@V'RkA1e;u.1HVZ67sC%@<Q3)FD,5.
-t-k/A8PajALSa<De!3lAM7P0@<6K4Bl5%;FDlFK%14IkC2[X"@;BF%+E2IF+F8>s3Zr<V?X[\f
A8PajAR?Qo/g)t[$4R>;67sC$ATVs,AThW-FD,5.-t-k/A8PajALSaGDfTB0+DG_8D]iJ++=DDY
GUFVMDe!3lAIStoG^+H\+D58-+F8>C$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkh@<,jkBl7Q+AoD]4GAhM4
Et&IMBkq9&D/XK;+EMXCEa`Tl+EMgLFCf<1+A,Et+E2@>G%kJuF!,('@qfanFD5<-+D,P4+EM+&
EarcsDJ()6BOr;rDf0Z.DKKqBDe:,+FE8R8@<>pe@<6!4%13OO<+ohcD..-r+EM+&Earc*@rH4$
@;]TuBlbCFA8Z34+=Lc7@ruF'DIIR2+DtV)AKYf'F*)IP/e&.:%15is/g+tEF*&O5Cht59BOr<1
DfTB0+E)-?FD,5.E+*j%+C\npBl7g&DJ()9Bln#2-Y.?I%16ocF*&OQ/g+\BC`k*9FXIV*%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%14LoDJUaE@ps6tF(Jd#@qZusDfQtEDfTB0/0K%GF*)IS+D5_5F`;CQ+EM[>
FCfM9@;]TuD.-ppDf[NR+B3#gF!,OGAT/c%Eb/[$ATJu8Df'&.B6%p5E-!.1DIal3BOu'(Ch[s4
F!+n-C`mh5AKYW+Dfp#?+E)-?FD,5.E+*j%+EV:*F<G%(B5)6+GA2/4+=BcW6miEN.1HVZ67sBj
Eb/[$AKZ&4D.Oi&Ec6)>Et&IhEc<-KF*)G:DJ+#<4""NO@;]^hF*)FM%16`gE$-NEDe!m#F*&ck
DJWZgC2[X"@;BF]+DEGb%13OO:-pQUB6%p5E-!.2AS5^pDJ=!$+EqOABHS[=Ddt.($8N_Y+CoA+
+=CuD@j_]m%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+BN5bF<G"4AKZ).ATME*Ap&!/Gp$O9B6A'&DKI"=F_tT!
EcXGS$:9"\DJs_AH#IgJBOQ'q+E2@>@UW_^Gp%!CFD55rA0>u-@<<W/@;^?58l%ht@rH4$@;]Us
+EV%-AKY])FCf)rEZee2B6A'&DKKqP+<X9P6m,oYB6A'&DKI"2De*F#+CT;%+E(j7@UX=l@ps1i
Gp%3BEb/f)FEqh:F"AGP@VTIaF<G(3A7]g5+E)4@Bl@l3@rGmhF!+n/A0>l7@;KXiBk;=+/e&-s
$<1\M+E(_(ARfh'+A,Et+EMXCEb0;7@;]TuEb0?5Bk;I!F!+n-C`mD"G%De7@VTIaF<G(3A7]g7
+<XWsAKYl%G]Y'M@:F%a+Co2-E,8s.F!+(N6m-DWC1Ums+Cf>#ATJ:f.1HVZ67sBQ:IH=D@VTIa
F<G(3A7]fk$7J"\0Hb'^+>tYk/1r&,3[\!);FDX,78m/.7oE,_:`r\:8Q8,$9gM-E:EW%s6W?WQ
:-hc\-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;YV_Bl@l3@;]TuEHP]+BkD'jEZek1A7]g)F(K0!@rri%
DIal,De*QoGp%$EFD5Z2F"SRX<+oig+CT;%+CT)&+DG_8AS5RpF"SS)DfQt;DfTD3Bl7O$Ec#6,
Bl@l3@:F.tF<G"4B6A'&DKI"2De*F#+ED%%A0=K?6mm$uDf0B*DIjr$De!p,ASuTuFD5Z2/e&-s
$;PM`+Dbt7CER&-+EMI<AKYi.Eb-@AA8Z34+Cf>,D..<mF"Rn/.1HVZ67sB/B6%p5E%E,ME-,f4
DBLYV/Ken=FCSu,E,oN%Bm;'L/KeP3F(HJ2@<?U&EcVZs1*A:oA8Z3+-Yt.>$4R>;67sB/D.-pp
D_*#LE-,f4DBL\W/Keq>D.Oi"Df0Z*Bl7u7F*)G:DJ(C@/KeqL+DkOsEc6"AH"D(,$8`k\+CoA+
+=CT<-OgCl$;No?+DkP&AKYD(D.-ppD]iJ+A0>r)@<,jk+CSnkBl4@e1a$a[F<Dr>EcPf+-Taq!
6W-KP<*s'KDe*3:-Vcu\+DlBHA8`T.DffZ,DJ((a+DkOsEc3<7$4R>!+>P'MDJUFC@<*_)$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMGiDfp#?+CT.u+EM[>FCfM&$;+)^+E2@>G%kJuF!+m6F(oK1Ch4`5@<iu;
D]i\5Dfp"AGAhM4F!+n/A0>u*F*)IU+<WrmB6%p5E$/k9+CQC&Des6$@ruF'DBNk0+A*c#DfTB0
/g)9&+EM[>FCcS/F!+m6@rH1"ARfgrDf-\9Afs\gFCfN8+EM%5BlJ08/g)9>Dfm14Eb/[$AKYE!
A0>`-A8,Y$+D5_5F`;CE@;]TuF*22=ATJu<Bln#2FD,5.-tdR>.3NeFEagX1$7QDk:-pQU@rc-h
FCcS'+D5_5F`8IAAfu;9Eb'56GA2/4+DtV)ATJu'AS5^pDJ=!$+EqOABHS[4BI=5rB6%r6-Zip@
FD#W4F`8]N4!8r(+CoA++=CZ4-OgCl$;No?+CfG'@<?''@3BZ'F*%iu0d(FXF<DrEASc1$GAhM<
A1'Gd0d'[C-RVM^6m-S_F*)IG@<,p%8g&1bEbTK7F!,R<@<<W4ATW'8DBLZT-RU8N$4R>;67sBj
Eb/[$AKYD(FCfN8+EM[>FCcRH+Du+>AKYf#Aoo/(EbBN3ASuT4@rGmh%14m6B6%r6-Zip@FE;S=
FCcgB4!8r(+>G!LDJUFC-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht+Dbb5F<G[=AKYK$DKKH-
FE8RCAft`,Dfp#?+E)9CF*22=ATJu<Bln#2-tdR>.1HV5%15is/g+tEF*&O7Df0Z.DKKqBDe:,6
ATMs+Ec6)>+D5_5F`7csB6%r6-Zip@FD#W4F`8];$4R>;67sBjDf0Z.DKKqBDe:,6ATMs7F_Pr/
/0JhKFCcS9F_Pr/+Cf>#AKYf#Aoo/(EbBN3ASuT!$8Wf;Ec<-KFCfN8F*22=AL@oo%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+AH9[Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&IPDIjr/Afu2/AKYhuBl5&%A9MC!FCAfn
F!,C5+EMXCEbTE(+A*bdDe*E%Bl5%c:IH=KF"SSD+E2.*Bl5&7@rc:&F<G:=+EV:*F<GjIFWb1&
DBNe)Bl8$$Bl5&%+B(j,7nc>oG%G]8Bl@l3De:,#+EqaEA1SjFATMrE+D5_5F`8IAEZfFGBlmo/
@;]TuFD,6'+D58'ATD4$AKYhuDL!?s+Dbt)A0>r'EbTK7F!,R<@<<W7F(HJ)Bk)7!Df0!(Gp%$7
C1UmsF"SS'@<>pe@<6!&A7]grB5V:$F!+t$Cht59BPDN1,&_@1+Eh=:F(oQ1+E(j7FD,5.FE2MG
BJ(J<$4R>ABOr;uDes6.GA1r-+DG_7ATDm6+CQC6Bl7R"AKZ28Eb$;,DBL?LDg<cSB6%p5E-!.1
DIal3BOu'(B4YslEaa'$F!,O6EbTK7F"Rn/.1HVZ67sBsAS-$,C3=T>BkDW5FCAWpAKZ/-EafIb
Che*6F?MZ4+=AK]3ZpI3>p+MI,%!'R+DEGP0d\S>-s[s,/g+@I.1HUn$;No?+EMXCEb-A-DBNn@
F<G+.@ruF'DIIR2%17&sF<DrIC3=T>-OgCl$;No?+DG_7ATDl8Bl5&%Cht55F`\a:Bk)7!Df0!(
Gp$a?Dfp#?+:SZ+I4cWt+ED%:D]gDT.3N&0A7oq%-9`P7-Z!O?F*&c=$4R>;67sBsDf9E6E$-QL
AThu@+DG^9C2[W8E+EQ'GA2/4+=LuCA8#OjE%)5'%15is/g+e<DImisFCcS'Cht55F`\a:Bk)7!
Df0!(Gp$a?Dfp#?+:SZ3+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g+k?+EV:.+DbV$F<G"4B6A'&
DKI"8F!,%1Bk1dc+EV:.+D5_5F`;CE@<,p%D.-sd+DG_8D]gHEDdd0*+EM%5BlJ08%15is/g,"I
F!a'nI4cWt+ED%:D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^@rcL/%16'CF),hJ+Dbb-AKZ,7A79Ro
DJ())ASu("@<?'k+EM%5BlJ08/0JG2DBND"+EM76E,96#Bk:ftGA2/4+A,Et+DkOsEc6"O+<Wrm
8l%htD.-ppD]ib8+CT.1@<,gkFE1f1Gp#^%F(96)E-*4EBOQ!*@ps6t@V$ZoATVEqARlolDIal$
G\(B-FCeu*GA2/4+=M8I.4u&:.1HVZ67sBt@:O=r+EV:*F<G4-DImisFCfM9@;Ka&E-67FA8,Oq
Bl@ltEd8d?Ec6)>Et&IkDe*]n@rcKN3ZoeF67sBnASu("@<?''@;Ka&E-67FA8,OqBl@ltEd8d?
Ec6)>F!iM47P#o@+Dkq9-9`Q#/g)nlEb0E4-RU8h+=@U*%15is/g,4WDfTD3D.-ppD]gVS@rGmh
+>PYoFCf9)F!+(N6m-SbBlbD2F!+m68g&1bEbTK7%14p7E-67F-Z*:-AT2d6B6%s4-Ta(<4)/\E
D.-ppD[d$_$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;u"aDJ=!$+CQBb:IH=B@:O=r+DGm>@3BW*D/a<&+DkP/
FCfJ8De:,1E+Np$DJ()6BOr;pE,]i9E,oZ$FCcS*Bk)7!Df0!(Bk;?.@;]TuF`V87B-8UCD(-SZ
+EDUB+DkOsEc3Q>$7QDk:-pQUAn?'oBHU`$A0>H.ARfk)AKVEhEbupHD..3kE-688Ec?(I%13OO
:-pQUAn?'oBHU`$A0>H.ARfk)AKZ&.Ch7L+Cj@-T+EqO9C`mY6Cj@.6Ble60@<iu,G]7J5@qg%1
+Cf>#AKYo6FDuAE%15is/g)kkEbupHD..3kE-688Ec?(I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9jqOP
Df[%0Eb-A2Dfd+BATMs6Bk)6rA0>u4+A*bt@rc:&FE9&W+B`W*+Ceht+CT)-D]j+CDfTD385r;W
/0IVp<+T/_+BV?3/0In\=B$go9gMZM6r-lZ/0Iql7Q;N!DIakV=]@g4F(96)E--.DBl5%c:IH=9
Bk)7!Df0!(Bk;?<+<XHtCj@-q+EM%5BlJ08+Ceht+C\n)Ecl7BBQ&*+G%G\H%14Nn$;No?+EMXC
Eb-@e@8pf?+=K!#.3N&:A0=EB9hZZX1,C@%FCf]=Et&I5+E2IF+=Cu6FCf\E4#/QQ-S@#(+A?3C
AQU'bDe*E%/hSb(%13OO1a$a[F<DrEFDYhA4#/TR-Qk#o/g*\a9hZ[>De*E%/hSb(%13OO:-pQU
F*)>@AKY)L9H[b]A0><$@VKq)@<-W9<(0ng+=L]EFCfMB/e&.E+E2IF+=DDNCaV;H9h\o&C2[Wi
4"!.4ATMrWFD,B0+DGm>Cgh0l+F%a>4>1efF*'Sn%13OO:-pQU6<R8V+DGm>F`(o2FCfK3Eb0?(
A0>?,FCfM9@;]Tu@ps6tF*)>@AKYGrDIIR"ATJtG+Du+>+ED%'Df'?&DId<h+D,P4+DbJ,B4W2t
Bl%@%/e&.E+E2IF+=BKI:+&+Y2EPqj@:W_RC2[Wi+DPk(FD)dEIUQbtDf0W$B4YslEa`chC2[Wf
C2IC#FCfJFBkh6-%13OO:-pQU@X3',+EM7CAKYo'+DkOsEc2Bo1a"M1+D58-+=BKI:+$JX%15is
/g,">@rcK1FCf]=+EVmJATJu&Eb-A'Df0Z*DKKqBBl5&8BOr<'@;0U%8l%ht@r,RpEt&IK;aXGS
:fLe1C2[Wi/0IVP<(0nr@;9^k?S!<j<)$%n@;9^k?S!=%9h\o&C2[Wi/0In\=B&X9C2[Wi/0I8^
<(1/&C2[Wi/0IYQ;G0DR=&*+2C2[Wi/0Iql7Q=a`C2[Wi%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0j
DJ()&Bk)7!Df0!(Gp$X?D/^V=@rc:&F:ARVD]iS%D/X<5FE1f3AKYo5BOu3,8l%htAn>CmF`M&7
+EqB>DImBi+EMI<AKZ28Eb'56Bl5&3F`JU8Bk)7!Df0!(GqL3^<+ohcDIn'7+EMX9E$/t8@:XF%
-u<=$A9Da./no'A.4u&:.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>\s@N]2q@ruF'DIIR2+CoV3
E$043EbTK7/e&.:%15is/g+kGF*2M7+Cf>1Eb/a&+E1b2BFP;eA0<rp-Zj9P+DbIqA7]p,Cggd#
+BosE+E(d5-RT?1%15is/g+tK@:UKkF_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6
ATD3q05>E905>E9Cggdo05P'+A9Da./no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:K#RE$043EbTK7
F!,"3+Du+>+EMXCEb-A;DfTA2Eb/ioEb0,uATKIH+B3#cGp$sHF*&O6AKYVsDImisFCeu8%14Nn
$;No?+E_X6@<?''GAhM4+ED%*ATD@"@qB^(/Kf+JDg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ/g)hj
B5DKqF!a'nI4cX_AThu>-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37r3*Q@;I',AS,LoASu!hEt&IK:IH==
@<3Q'@:O"fBln'#F!,(5EZek#EcQG>DJ()1F`\aIFCB9*@j#YtD.OhuDII@,F(o\<Df-[i+EqaE
A9/l%DIal3ATMs7/e&-s$<1\M+=Ll=Ddmc:+CT.u+=MARATK:CG%G]'F!+n/@;L48AKYE!A0>r8
DfTD3DIIBn+ED%*ATD@"@qB^6%14Nn$;No?+CT.rCjC><+DtV)ATJ:fB4Z0--Y.:?@<<k+$4R>;
67sBjCghC+BkDW5DIIBn+E_a:+DG^9@UX=h+Dbt+@;KKtGAhM4%14gE+D5M/@WNY>A92j$F=.M)
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%166VFWb1&DBO(@A79Rk+D5M/@UX'qGAhM4+ED%*ATD@"@qB^6%14Nn
$;No?+>=pPF!,R<AKZ28Eb$;&De*E%/Kf+VDfTE1+D5M/@UX'qEb/ioEb0,uATJ:f0Hb"EDdmc1
-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$F`V,8.3NYBFE2),G%G_;F*)>@ARlp(AS,LoASu!h
F"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!+D,P4+=LcAFCB8?%176!ATJtAA92j$F=.M)%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%14M+F(KDA+C\nlDf'',+Eh=:Gp";RF(Js+Ca(!GBOu'(@;Ka&GAhM4F!,.)
G%De;FDl22A0>o(An?!oDI[7!/e&.:%15is/g+kGF*2M7+EVOI+DGm>FD,5.E-67FA8,OqBl@lt
Ed8*$De'tP3[]#fGp$p3@Us%n+DbIq-QlV91E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$F`V,8
.3N,/DBNt2FEMVA+DkP)Gp%-=An?!oDI[6#Ch[s4F!+n5+E).-AM,*)BOr<-@;TQuE+*j%+EM+&
Earc*D.R3j@;]e#D'3P6+E_a:A0>K&EZfC6FE2),G%ki,+ED%*ATD@"@qB^6%14Nn$;No?+D5M/
@UX'qEb/ioEb0,uATJu4Afu;9Eb'56@V'1dDJj0+B-;D4FD)dED'oc":-pQUF`V,8+FPjbA8Z3+
-Z(4?$4R>;67sBnCi<ckC`mb0An?!oDI[7!+E(j7GAhM4F!,%3A8,po+EqOABHS[D-OgE*F(KD8
I4cWr+>Y-NDJU\A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+ohcF`V,8+E_R9Df-!k:N1DiDf-[R0d(CH
+=MARATK:CEb0?8Ec,q@FD,5.F`V,8/TkrFDf-\9AftM)GAhM4/g)99BOr</F(KDEF`(o3DBNY7
+C\c#Bk(RfCj@.3+E_R9EHPh8Ch[s4+CT)&+EV:.+EqaEA9/l3DBO%7AKYJkCht59Eb/f)De:,#
+EqaEA1e;u.1HVZ67sC'F(KD8F`(o3DBNk0+EVgG+EqaEA9/1e1GL"pF(KD84$"a!@;Ke!Df0V=
F*2A@Bldj,ATTUR%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;#/@:UL%@rc:&FE7lu8l%ht
@ps6tB4YslEaa'$+A*bmDdd0!F(96)E--.DAo_g,+Co1rFD5Z2@<-W9B6%p5E-!WS+B3#c+D58'
ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^DO@rc:&F<GXI
@Us1nARfh#Ed98H$7QDk:-pQUB4YslEaa'$+Dbt)A0>r'EbTK7%16rgF!)iOF`)&7Df-pF+<XEG
/g,4XDD,jFDf-\<Bldi.F(KG&$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqiCi^_-E,]B+A9/l+ASu("@<?'k
+EM%5BlJ08+EVNEFD,5.@s)g4ASuT4F`V,7-Z^DOFCB33F`8sIC3(M0Bl%?'F)N1CBOuH3@ps6t
@V$ZuDdd0fA0>T(A7]^kDId<rFDQ4FDe:+a:IHfE$4R>;DffPO+Dkq9+EM%5BlJ08+CT;%+CSek
ARlp*D]hkV6;0s<?YWpjDfQssF^f0$@p`tX+D,P4+EV:.+CfP7Eb0-1+E_a:E\7e..1HVZ67sBs
Ddd0!B4YslEaa'$A0>r'EbTK7%16oi@:UK.F*2A;Df9M@%13OO@ps1jDf9N7+>PW*2'=#:67sBm
F_kk:-o!.n+CT.u+Dtb7+=Jom+Dl%8DK?q7DBL\g0f9CI%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$
Bl7Q+F(96)E--.DDf-\.ASkjnA.8l<:IH=8@;[2rCiaM;B4YslEaa'$+CT.u+Dbt)A0>r'EbTK7
F!,[@FD,T8F<G(6ART[pDJ().Ddd0!F(96)E--.R%14Nn$;No?+Dbt)A0>>iF(o,,F*(i4BleB1
@ric*Ec6)>%16oa+=CW>FCB94-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7KOuFE2UT+Dbt)A9/l%Cht59
BOr<1DfTB0+CehrCh7-"@X0))+D5D3ASrW7DfTA@%14Nn$;No?+Dbt)A0>;sC`mq?Eb'56DImBi
+EVNEEcl7B-tIC@@<<q-$>3plEd/]SA92j$F=.M)%13OO:-pQUCi<`m+DG_8D]iJ/@VKq)@<-W9
Ci<flCh7Ys$;No?+=D5P@<?=(@j`C3ATVs;+=C]@FCB8=%15is/g)N%3@>q^ATVs;+=C]@FCB8=
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[a@:O(eDJ()7E$/S,A0>o(F*)>@Bl7Q+A8,OqBl@ltEbT*+%15^'
6m-2b+Cno&@:EYdAKYT'EZdssGAhM4F"AGT@rc:&FE8R5DIal.FD,6++E2@4@qfk(F!,FBDeF*!
D'3q3G]\!Z+<XBsF*&O8@<>pe@<6!&F*VhKASlK2BOQ'q+Dk[uDK?q4DfQt0@:O(eDJ()7E$/S,
A0>o(F*)>@Bl7Q+A79Rg@UX=hF!+n/A0=K?6m-#YATJu&F!,[<Cht^H+B3#c+=M2;@r#U(+Eh=:
@N],g@r$4+F!,UE+CQC'@<>pe@<6!4%14Nn$;No?+ELt7AKYD(@UWb^F`8IAAfu2/AKYK*EcP`/
F<GOFF<G+.@ruF'DIIR2%17&_@r#Tt-Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kk%@r#U(+Cf>/
Bk;?.FD,5.@s)g4ASuT4A8,OqBl@ltEd8d>Bl%@%+EVNEFD,5.@UWb^F`8IEF^elqEb/a&DfU+G
@;]TuE,oN%Bm=31+CT)&+EV:.+D,>(ATJu<Bln#2@3B]1BlS9,+D#_-EZf(6@rc-hF(oN)+C\bh
CNXS=DKTf*ATBC4$7QDk:-pQUCh[s4+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I8Bl%@%%15Ei8Q%]4
+F?.r/g)9):dJ&O?XH`2?XHE$6uQOL+<Ve%67sC"F`\a:Bl[cpFDl2F%16W[EZd\794)$m6qL9-
-Rp`_C1\h9+<VdL+<VdL+<Ve%67sBi@:O(qE$/b,Ch7Ys$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$Eb0<6
A18XAATMs3Eb0;7FD,5.CghC,+C\bhCNXS=@X0);ASbpfFD5W*+C\bhCNXS=Anc'mF!,[@FD)e=
BOr<"BkM*jF*&ODEb/isGV0F4.1HVZ67sC$ATMs3Eb-A0@<6N5@UWb^F`7csEb0<6A0<7ADg<]>
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMY^CM@[!+CQC6@rc:&F<G+:D/]pk-u`U)CLek:@rc-hFCfM9@VK^g
Ed8d:@:O(qE-!WS+B`W*+Ceht+CT)-D]iLt@r$4++Co1rFD5Z2@<-'nF!+n4+CoV3E$043EbTK7
F"SRX7!3?c+EM%5BlJ08+CT;%+EM77B5D-%8g&1bEbTK7F!,R<@<<W%@;[2sAKZ,:ARlp*D]iLt
@r$4+/0JG@E-WR7DIal,ATDEp+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBkF_u(?@;Ka&FD,5.GAhM4
F!,C=+EV:.+E1b2BHU`)+CQC6Bl7R"AKYN+D/^V=@rc:&F=n"0FDlG8F_u(\3ZrKWDg-//F)t\s
C2[Wi+DkP&AKW?J%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=(l/_+EqB>Ci<`m+=M>MH";&7E%)oDDKKe>
@3BH!G9CF1@ruF'DIIR2+E(_1ATDs*+D>\;+EV:.+E1b2BHV#1+Cf(nDJ*Nk/g+,,AKYMt@ruF'
DIIR"ATJu-@<Q3)@V'+g+Dk\1B4YU+%14Nn$;No?+Dtb7+Co1rFD5Z2@<-W&$>sF!A0<7=CghU.
ASrk<>9G^EDe't<-OgCl$;No?+E)41D@HqkA0<7=CghU.ASrk)$4R>;67sBsDdd0!.!0BQA9Da.
.1HV<+Z_;"4<Q_43ZrN_H";&7E"*-`$;No?+Co1rFD5Z2@<-W9Bl7O$Ec#6,Bl@ku$=mj]INU<R
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMD_DII?(GAhM4Et&IZDfm1?Dg*=;@<Q3)F)Po,+DG@t@3BK#+EqL-
F<F1O6m-2b+CT)&+CS_tF`]5Y<,WmqARTUs+Dl%;AKZ#)@:UKQ:IHRO+CoD#F_t]-FCB9*Df-\+
DIal1F`&=DBOr<)FD,6++A,Et+DbIqF"SS,AfuA;FWb@+G%De)DL!@DEc5E'ASlK>+E;O8F*),7
DK?q=EZek1D/a<"Bl8$6+E2..@<6!&ASkjiC`mS++CT@7@UX%`Eb],F3C%4o@;0O1@rH2n$4R>7
DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj9jr'PBHT&a0fTUL.1HVZ67sBjCi=B++CT/5
+E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>WDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G
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
$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*
@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)
FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/
AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%16WbF(KG9-W3B378uuM
-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/
A0>Q(@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4EbT&q+@S[c:JOha9LU'U
+EM+9+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j:-pQU:.\/V3ZqpTEcP`/
FDQ4F779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC.3K',779L=:/aq^7:0J<
De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGGA7]"UDe*E3AU%c1-OgDX
67sBL6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08
DJsW.E+*9-.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX76sX>4ZX]I0Hb]b
4$"a&Df'&.GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+=Lr=De(:>ATDg0
E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi
.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>
+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8
Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi
+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/
$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EK
AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\f
A7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$
/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6
Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0n
GAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^
A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2t
B5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%
%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63
BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_C
A1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:
A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!
F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?
+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)V
GAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9a
AThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=
F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+DkOsEc3(ABl%?u
FDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&
E$/b2EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6%16ci4ZX]?+D>S1DJUG"
3Zri'+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2
ATAo*Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eI
Dfp#?%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef
@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1
AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U
/g,Qp+En8%.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!m
Bl7Q+GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:
G]Y&;$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP
67sB'1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,
1E\_$0F\@C+D>h;+F+D'3XlF1AhG38@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8
Ec*KPASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;
D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'
5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is
/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)
DfT@t$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0
FCfN8-QjNS+<XEG/g,7IF*%iuF)5E44ZX]A+?CW!%14d3F)5E4+F+D'3XlF1AhG38@:Wka?X[\f
A7$I#CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&
DKK5m8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1
F)rIEAS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?Qa5L/g,1GG&JKN-Qlr<
/g,$SEb0?8Ec*KPASu$2%14M$/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+Ds=pI4fCH$7QDk
%15is/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM
-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[
FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl
$;No?+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ
3aEk4+>G$#1+"ac$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3
F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S?p$\,
-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB
3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5
+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%
+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*Eb/Zi
FC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_/h%uO+?^io
3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5%15is
/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>/Kf+GAKYf-
DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@5U\E33\W!3
.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk--nIV30d\;"
+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff+BplLI4c]u
+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6".$?UAQ
3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U+=]!cG]XB%D/)3p>p)3O1,0t[+?L]YF<D\K
:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%67sB1/o>$;CLh@-D@HqiGWe)n+?L]$1*U'J
4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?
@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF
+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cp
FDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.
%16id4ZX]60HiJ2.6qWi%13OO:-pQUDKTf*ATAo3Afu#$C1UmsF!*%WF`V,)+C]U=G%#E*Dfp+D
.!9WGCi_$JD.-ppDf[$LF(or3E-67R+CSnoE-67R+>,9!.3N>:+E2@4F(K62%15j+6;p$.+>GPZ
$4R>;67sBkF_u(?A9)C-AKWQIF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'
DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`-OgCl$;No?+CoV3E$0+.FD,_</Kf1WARlomGp"MXFD5Q4
.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+YP<(K/5+=AgWDe(M9De*C$D/aPL
-OgDX67sBK<D?:d;H?U[<(K/5+=AgWDe(M9De*g-G%>`4E-!Z[%13OO:-pQU@r,^bEZen,@ruF'
DIIR"ATJtG+E_a:A0>?,+=MASBl%i>+DkOsEc3'K@r,^bEc?/C.3N>:+E2@4F(K62%15is/g*MT
76sgD6qKaE4ZX]I3[Z9a$4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h
+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B
@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>
C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVh
DfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d5
4$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;
E$lc4+>Y-YA0<6I%16igA9Ds)Eas$*Anbme@;@VQ:-pQ_C2[X*F(KB%Df00$B4>:b+EK+d+D#e+
D/a<&+A,Et+E_a:EZek1DJ!TqF`Lo4Bl@l3F(96)E-*]A$;No?%15is/g+,,BlbC>F(96)E-*4:
F!)T:G\(B-FCeu*@V'.iEb-@c:IH=D@VTIaFE8QI@<,p%@rc-hFCeu8+A$Ya$;No?+Ceht+C\n)
F`V,)+EVNEEb/cmAnc-o+CT.u+CfP8FDl#1H=\4B@<-(#F`S[8CghC++Du+?DK@EQ<,W3Q:-pQU
D..3k+<Yc>BlbD<@rc:&F<D]7@ruF.AKW+9AStpnAKY]/+EVNEC2[X*F(KB%Df00$B.dn5F!+n/
A.8l@67sBjDfBtEBlkmKGA2/4+F.mJEZeq(BlnDI+EVNEFD,5.D..-r+DPh*+Co2,ARfh#Ed9\T
$;No?%15is/g,UOA7TUrF'N?hDImisCg:^nA.8l@67r]S:-pQU<+ohcDJsZ8F!,:5F*(u(+C\nu
Dg*=4Eb-A+Df9//@ps7cBk1XoATJu+DfQt@ARo@aBl7X,Bl@lA%13OO:-pQUF)>i<FDuAE+=CoB
A9Ds)Eas$*Anbm1Bkh]3AU%crF`_>8B-8fZ/gh)8%15is/g*tY7Nc__@:Wqi+DG^9C2[X*FD5P6
@r,RpF!*%W@s)g4ASuT4F(KH8Bl7Q+BlbD=BOr;sAS,@nCige1Bl[cpFDl2F%15is/g+bEEZfI;
AKY&gDId[0F!,X;EcYr5DBNk0+@0OV@V$Z[ART+\E\8J4ATMF)+D,P4+E)@8ATAni6q/;>ART+\
EcVZs:-pQU:ddcN76s=1;I<jIDe+!4Bl%->3[[9U>YoHZB6%Et+@^']ATJtBGW7T1>X;n=@V&e1
@rcKs@<<ViART+\EZdb;>Z,-AA7]dd6"=qR;IhR=/nK9=-OgCl$;No?+ED%7ATT%e-Z^D,6q/;>
ART+\EZfIB+DkP/@qZuW:IHRO+AbHq+ED%%A7]d(/KeSB+D,P4+=Lu7Df0W7Ch551G\&<5$;No?
+AbHq;Is9IATD-m?TgFm:ddcN76s=1;I<jIDe+!4Bl%,c$4R>;67sBhCij6/DIIX$G%DddBQ%s6
F(96)E-*44Df'H%FD53#AKZ#)@:Wqi%15is/g*tY7T)Z@6q(!\@;9^kF`_>6?TgFt6TSIKEc5T2
@;R,VBl%@%>XrIGF*)&;D-U^pG%kN3>\A,$Bk;KE1+m-_AL@oo%15is/g*u2AS,LoEb/c(G@b5+
@WHC2F(KA7Bl5&.De+!4Bl"o%CghC++>"^HAS,@nCige$Bl7I"GB4lrBl[cSDg3C8Bl[cpFDl2F
%15is/g+4s="muiC2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm9lG>lCi!N&7VQmSAoDp!Anc9s
AoDoHAU%c6%13OO:-pQU;e9HWDId0rGp%<B@N]-#Dg-86EZf(6+DPh*F`_>6+Cf4rF)rHU+Co%q
@<HC.+BN8pA8c[5+Co2,ARfh#Ed8*$:-pQU='&HX?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[M
F'M:SFCfK1ATT%`G]7J;Eb08r8OZ`X9M\PT/k&l2-OgCl$;No?+B2osF<G.*Bln96+EVNEF`V+:
GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&IO67sBX
<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7
Ch5//G\&<5$:R?M:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0
@:Ul=>]+J%AT2'g.k<5`G\&'H%16r\CLoh@F(o,V:IJ/nF*)IY0ht%f.W&U0AO9gHBk'b26r[`=
FE8RG/M/)^@;BEs8l%ht@UX=l@j#l)F*&OG@rc:&F=n"0:-pQB$;No?+B3#gF!,O6EbTK7+D58'
ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+C\c#Bk%SZ:-pQUFCfN8F"SS7
BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5B-:o++<Yc>AISuA67sB/
@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16Eb/rtDK@E>$;No?%15is
/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9Ch7-"
+C]U*$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlotAfr3E<(0_b6Vg]W<%/r$
G[k;rA9/l8BOqV[:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[Wl@<6-mFCfN8F"&5QF_Pr/
/e&._67r]S:-pQU@<6L4D.RcL%15is/g)8Z%15is/g)8Z0e"52+Cf>-Anbn#Eb/c(8g%YYEb/a&
DfU+GIS*C(<(0_b%15is/e&._67sC(ATD6gFD5SQ+EVNEF`V+:A8aL<$;No?%15is/g)8Z:-pQU
B4YslEaa'$+EM%5BlJ/'$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is
/g)8ZEbupHD..3k6=FqL@nKNb<+U,mF!hD(:-pQU%15is/g)8Z:-pQUEcl7BBljdk:-pQU+<W'd
+Z_A-+?XCX@<?0*-[nZ`6rZTR<%gRHF(o,V:IJ/nF*)IUBkh]:%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>H3=Q<j67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgE!Ddd0!-YdR1FCfN8ATB.-$>j3eAQ*GaCLp+66r[`=FE92l:-pQ_D..3k;f-GgAP,`d
<+U,mF!,NU/Ken=CLnV\:IH=HD/X3$+EV19F<GX7EbTK7/db??/db??/g+,,BlbD<@rc:&F<G4-
DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m-PfDeink:-pQUFCfN8F"SS7
BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5B-:o++<Yc>AI;1!/g)QO
@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4ASGdpF"Rep67rU?67sB[
BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>+<Y04DKKo;Ci!Zn+<Y-=
$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlotAfr3E<(0_b6Vg]W<%/r$G[k;r
A9/l8BOqNG67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*p+Deip+ATMs7.3N\SBlmo=$;No?
$;No?+CT>4F_t]23XSVK/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA,Q67sBjEb/[$ARmhE1,(F?C3=>H3=8MJ/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4-XpM*AL@h$Ddd0!-YdR1
FCfN8ATB.*D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP
@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-SR/5/ibpM+>"^HATfF1$:[fb6q(!:3[\QODImis
CbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\
ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3
Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_
05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0
G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARl
De*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3RE
C30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2
Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*
%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0
Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@lt
Ed8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+
@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0
A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjI
FU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6
@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,
@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER
6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&
@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?r
ASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht
:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-
AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!(
$7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP
:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50J5@<3B8rE%15R#9LM<I4ZXs'ASu("
@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B
;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn$;s;d
76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>
A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3
F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o
@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*
$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'k
CbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U
<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0J5@<3B8u?/KeS8
Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+
DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKi
A7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU38
3[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;
C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-
A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsG
ATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(
+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0
@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'
DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&
F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'
6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(
Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#
+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>
FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs
+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'X
AKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIj
B5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3
+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht
:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;
C2[W7E+*Bj0+A7;%13                                                        ~>
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
zz=:zz,'DVMD JSCRIPT JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS'
zz=:zz,' MAXEXPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK0'
zz=:zz,'05 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHS'
zz=:zz,'HOWDEL PATOPS PUTBLACK REFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNIO'
zz=:zz,'N UTF8 WORD XML afterstr alltrim badappend badblia badbu badcl badf'
zz=:zz,'l badil badjr badlocn badobj badrc badreps badsts badunique befores'
zz=:zz,'tr bget bnl boxopen catrefs cd changestr checknames checknttab chec'
zz=:zz,'knttab2 checknttab3 createjod createmast ctl datefrnum dblquote dec'
zz=:zz,'omm defzface del destroyjod did didnum dnl dpset dptable empdnl fex'
zz=:zz,' firstone fod fopix gdeps get globals globs grp gsmakeq guids guids'
zz=:zz,'x host hostsep isempty islocref jappend jcr jcreate jderr jdmasterr'
zz=:zz,' jnfrblcl jodsystempath jpathsep jread jreplace justdrv justpath jv'
zz=:zz,'n lfcrtrim locsfx make makedir markmast mubmark nc newd nlargs now '
zz=:zz,'nowfd obidfile od ok packd plt put quote read readnoun readobid reg'
zz=:zz,'d remast restd rv saveobid second tc trimnl tslash2 tstamp uses val'
zz=:zz,'date wex wrep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPT'
zz=:zz,'RS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ER'
zz=:zz,'R200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209'
zz=:zz,' ERR210 ERR211 ERR212 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX '
zz=:zz,'backnum copydirinv copyfile copyfiles createdl dbakf dfclose dfopen'
zz=:zz,' dfp dncn dnix dnnc dnnm dnrn dropall dropbakdir dropdir dropinv dr'
zz=:zz,'opnc dropref gettstamps justdrvpath libstatus loadbakdir loaddir lo'
zz=:zz,'adnc loadref loadstamps maxback movefile nummask packdict packspace'
zz=:zz,' puttstamps renamefiles restdict restspace savedir saveref tmpdatfi'
zz=:zz,'le tmpusesfile volfree''),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMS'
zz=:zz,'G2 DUMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR015'
zz=:zz,'4 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX'
zz=:zz,'0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS '
zz=:zz,'SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl c'
zz=:zz,'learso clfrbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumpheade'
zz=:zz,'r dumpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap '
zz=:zz,'fmtdumptext fromascii85 getallts getascii85 halfbits htclip jnb jsc'
zz=:zz,'ript jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep o'
zz=:zz,'paqnames parsecode putallts rlefrnl sexpin sonl tabit toascii85 uqt'
zz=:zz,'single wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore C'
zz=:zz,'NCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CN'
zz=:zz,'PARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 E'
zz=:zz,'RR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR06'
zz=:zz,'2 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ER'
zz=:zz,'R072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082'
zz=:zz,' ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR'
zz=:zz,'092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 '
zz=:zz,'ERR102 ERR103 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT '
zz=:zz,'OFFSET OK050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 '
zz=:zz,'OK061 OK062 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlc'
zz=:zz,'tn allnlpfx allnlsfx apptable appwords badcn bnlsearch bnums checkn'
zz=:zz,'tstamp checkopen checkpath checkput closedict createst defwords del'
zz=:zz,'stuff delwordrefs didstats dnlsearch freedisk freedisklinux freedis'
zz=:zz,'kmac freediskwin fullmonty getdicdoc getdocument getexplain getgste'
zz=:zz,'xt getntstamp getobjects getrefs gslistnl inputdict invappend invde'
zz=:zz,'lete invfetch invreplace islib iswriteable iswriteablelinux iswrite'
zz=:zz,'ablewin jdatcreate jwordscreate loadalldirs loadallrefs loadwords m'
zz=:zz,'ainddir newdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nu'
zz=:zz,'bnlsfx opendict pathnl pathref putdicdoc putexplain putgs putntstam'
zz=:zz,'p puttable puttexts putwords putwordxrs rpdtrim rplctable rplcwords'
zz=:zz,' sortdnub''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 E'
zz=:zz,'RR00401 ERR00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00'
zz=:zz,'408 GROUPSUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF O'
zz=:zz,'K00400 OK00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX'
zz=:zz,' TESTSTUB WARNING00400 WORDTESTS addgrp addloadscript addloadscript'
zz=:zz,'1 allnames allrefs betweenidx createjodtools dayage delgrp firstcom'
zz=:zz,'ment firstperiod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp'
zz=:zz,' nt nw obnames onlycomments pr refnames revonex today todayno updat'
zz=:zz,'epublic usedby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK '
zz=:zz,'CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250'
zz=:zz,' ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ER'
zz=:zz,'R0262 IzJODutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFU'
zz=:zz,'SCPFX OK0250 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC'
zz=:zz,' ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok compclut'
zz=:zz,' compj compressj createut ctit de dewhitejcr dewhitejscript disp do'
zz=:zz,'c docct2 docfmt2 doctext docword ed et exobrefs gt jodfork jodhelp '
zz=:zz,'ljust obtext pdfreader qt reb revo rm rtt textform2''               '
zz=:6015{.zz
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
FDl)6F!+&#8l%itFD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r:IJ5X6m,2i6W-]Z=\qO09hAGU6r-iP
;BSb%7TEAS5u^8q:I7NN;aWoI<$4t'7TEAS:e"P0<(0_b=[>bV78b7;B4Z0-@W$!)@W$"'ARTUh
BHUc,Bl%<pDe*?rD/aN,F)to'+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'+Cf(r@r#t(FCAW7+Cf>,
E,oN2F(uh-Eb/[$ASQ-o+CnqiCM"]"An,XqF(HJ)E-#T4+CoV3E+ifkA7]d(ARlopF<G4-FDc2A
FCB$*+DPh*Df-\6B-;#/@:WhUCLh."+Dbt)A7TCp+Dbt)A8Ym"Ci<`mEb/i*Ci<`mF*(i-E-!.<
Ddd1#DfTB0+Dkq9+DtV)ARf.jF!,@=F`)#9AT/c1@WZ1+F<GL4+E2IF@;Kb%F!,L7Ch7$rASQ-o
+ED<AEccCGF(KH&F_PZ&A8-(*+EV19FCf?5Bl\-0D.RU,+E_X6@<?'qDe*BmF*)G:@Wcd,Df-\?
E+EC!ASQ-oD..<rAn?%*+E_X6@<?'qDe*p-F`Lu'A9Da.F!iCf-p0UR/mg=U-Qll9CdMQOBk&hO
+C]5);f-GgAM>e\@rH4'C/\tfCLo1R+Cf>,E,&<gDeio<0d'tHART[lFCfN8A8,OqBl@ltEbT*+
+Co&"6=FqL@k]Sk+Co&)FE2;FFCfN8A8,OqBl@ltEbT*++Co1s;f-GgAM>e\A8-+(;f-GgAQ<V^
@rGmh0JFV[DJW6gDeio<0HanDCf>1hCLp4K@rcKeAU&<<+CoG4ATU7IF(o,<0d(%<;f-GgAM>e\
B5DKqF$a;VBk&hN0d(+FDdmcdD/X3$6$%*]B5TCW0Hb"EDdmcdD/X3$6uQQh0Hb"KE)UUlCLo1R
+D5_6Ch[uX@<6-m0JO\bDe*9hAQ*GaCLonBH#kYn+Dbt)A5d>`CLqU!F*')YCi<`m;f-GgATVL)
F>4nSDdd0eF_u(rD/X3$0JFVcDdd0uATMrI0JR*P@ruF'DIIR2+Dbt)A9;C(F>,C(A8,OqBl@lt
Ed8dDDdd0uATMrI0Jd6R@ruF'DIIR2+Dbt)A9;C(F>,C*A8,OqBl@ltEd8dFATqZ`D/X3$6=FCj
EbBN3ASuU20JFVfA5d>`CLoePB1?<DCbROcE-67t@;TRTBl.F&FCB$*F$a;VBk&hN+ED%7FC[^H
F(o,<0d(RLF*)JFF^c^I/1<VC4"akp+=A:@F_PZ&C2[W*C2[W*C2[WnDdji(De*]nCLnW'De*p2
DfTD3C2[X)Df9H5+DPh*F`_>6-RgSp4?P\X?SNZN+DPh*@UX=l@ru:'FE8R>De*?uF`V5<ATMs7
+DPh*AU&<.DKBN1DKKH2FE8R>De*ZmEbAs*ATMs7+DPh*E,oN/@<,q$ATMs7+DPh*E-626ATVL)
FE8R>De*p+Deip+ATMs7+DPh*F*)G6F)uG7F*)IGCi<`mCgh?sAS,L^F(o*"ARf.iALAoX-p0UR
/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,<@WQ+$G%G2QEcQ)=F!+q7
Bl%<pDe*BmF*)G:@Wcd,Df-\,F_PZ&C2[WsC3(M,F_PZ&C2[X*DJ=28BPDO0DfU,<De'u(BleB7
Ed;D<A7TUg+DPh*@V'V&+DPh*A9Da.+DPh*Bl8$5D]ie5A8lR-Anc'm+DPh*F`V,7@rH6sBkLm`
CERJ&CLoh@F(o,V:IJ/nF*)IGD..3k;f-GgAP,`d<+U,mF!,=.DJ<]oF*)/8A0>_tDJ<]oF*)/8
A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*AG4,Vh&.2)%!D1G1RE1GCLA2)RB:1,(FA
0KCmK/iYXB1cI*C1,^710JPO@2)70E2)-dC1bgsD2BXb/0fUjE1-$sE0ebRA3&r]M+>PW*3&!3F
0ePF>1cI*J1b^^.1,(F?0K:aB/i5IG1,gsB2_cF10JPF=2_m?F2Dm?O3&NTO3?U(20f:XD0JY7=
1H.'D1cRBK+>PW*2)$sE1bL[D3ANTP3AWZ<1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_[!>2D[9I
0f1jJ1*A>+0fUjE1-$sC3&!$G1H.6K+>PW*3&!3F3A**I0JGIB2`EN81,(F?0K1aH/iGXK3&E<K
1G^./0JPO@2)6s?3AEHH2)mBL2BXb/0f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK1bpd.
1,(F?0K1^F/i,IA3B8oM2_lL20JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,LUA1,:RA2`WZS+>PW*
2)%!D2D-gE2_[-I0fLp31,(F?0K:aB/i5@>0K1pN1bg+.0JPL?1GCU;2`3EI0KCpE3$9t10fLdB
0Jb=?2)I'K3&i]L+>PW*2)$sE3A**H2*!EP0K(X.1,(F?0K1^F/i,IE1H@?K3B/-:0JPF=2_m0A
1cI0G2)@!F1a"P-0f:XE0Jb=<1,UjG1GppJ+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==
1c-sG1,^710JPL?3ANTI3&<<H2_[!E1E\G,0f:XD1,pmB2_[!C2*!BI+>PW*2D?pA1bLUA2)[BR
3A<B71,(F?0K1[D/i5CB1H@3N2)-4/0JPO@1b^j@1c@3F3&*-I0d&5*0f:XD0fL^A2)[HQ3AEBM
+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==1c-sG1,^710JPL?2)-s@2)$gC1bpsE2BXb/
0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(gaA1c[?M1H%071,(FA0JtRB/i>==1c-sG1,^710JPO@
2)6m=3&!0C1H.6M1E\G,0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD2DR051,(F?0K1aH
/iGRG1c$mD2`Mp80JPF=3&!-@1H.0L0f1UE3?U(20f:XD0JY7=1c$sE1GC^H+>PW*2_[$A1G1UD
1c%*I1,(U/1,(F?0K1^F/i>CC3Ar`K3$9t10f:XD0fL^B1,h'H3A`TM+>PW*2_[$B1bLaI0fLmI
1,:R,1,(FB0JtUB/iP[J2D['G1G^./0JPL?1GL^=3&iWN1GUdF2BXb/0fLdB0Jb=?2)I0I1H%$I
+>PW*2_[$A1G1UD1c@3N1Gq'51,(F?0K:aB/iGXE0JGFC2)ud70JPL?3ANTI3&<<H2_ZsA2BXb/
0fUjE1GCF?2)d9M1c76J+>PW*3&!3G0J5:A2_m?L2)m?61,(FB0JtU?/iYOA2_[3J0Jah,0JPF=
3&!-@2E3HL1H@3K3?U(20f:XD1,pmE2)R?Q2)[<P+>PW*3&!3G0ePF>1,q!C3&ii>1,(F?0K1aD
/iGRI1-%3P1H?R50JPO@2)?s>3&!*I0ekXI2]sk00fUjE1GLLA0JYUB0fV-O+>PW*3&!3G0ePF>
1,q!I3&ET;1,(FB0JtX@/iYO?3&*0H0JXb+0JPF=2_m?F2E*WU1b^mF1E\G,0fUjE1,COC0fLdD
3&<EM+>PW*2)$sD2_HmG0fV-M0fLs41,(F?0K1^F/i57?3&3<I1,0n,0JPF=2_d6D1H7*L3A`EK
1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*2)$sE3%d*H2D[9J2)I'21,(F?0K:aE/iPI?1c@$B1H6L4
0JPF=3&!6C1cI9L1H@0E0d&5*0fLdB0f1LB3AWKP1bgdB+>PW*2_[$B1bLdC0etR@1H%!21,(F?
0K1aI/i5FD1GC^D0JXb+0JPL?1,:d@3&WQL2E!EJ2]sk00f:XD1,CO>2_m0H1GUgE+>PW*2)%!E
1+kI>2D?g=0JbO.1,(FA0JtRC/iP^G1,UdG1E\G,0fLdD0fCXC2`*9E3&NTM+>PW*2_[6I3A*9I
1,LpD1,Uj11,(F?0K1aI/i5FD1c$gF1Gg400JPL?0ebU?3&iWN0f([D0d&5*0f:XD0K(O?1c7'L
1-%3H+>PW*3&!0C2_HpF3AEBL3A`N71,(F?0K1^F/i5FD3ArlP2)cX50JPL?2).!A2`EQJ3&!-D
1E\G,0fLdD0fCXC2`*HM1GgdB+>PW*2_[*D2D-pI2)%!K1,_'61,(FA0JtRC/iP^H1H%0P3&Vm7
0JPL?2).!A2`ETP2DR$G3?U(20fLdD0fCXC2`<KP0JtXB+>PW*3&!3F0ePF>2)70N3AEB61,(FB
0JtUB/iP[J2D['G1G^./0JPL?2).!A2`NTI3AEHP1a"P-0f:XD1,pmE2)d?J1,LpL+>PW*2)%!E
0J5.@1bppH1cI-31,(F?0eb:=/i>XC3&EBL1bp1/0JPL?1GL^=3A<-I1,(X@3$9t10f:XD1,1C<
2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*41,(FA0JbF?/ibX?1,^mB0K:110JPO@2)7!@2`<WR
1GLdD1E\G,0fLdB0f1LC0fM'K3B/oO+>PW*2_[$A1G1UE2`!0K0f^s21,(FA0JbF?/ibXB3&`fN
2)cs8-p07-1GL.10JPO@2)7!@2`E`U2_m6M+>PW*2)$sF0eP@A1bgsH1,Cj31,(F?0K1^F/i5@>
3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0fLdE1,(==2`*?H2)I0H+>PW*3&!3F1bLaA0f_0H
1,Ld01,(FA0K([?/iGXF1,q3J1c6C20JPF=2_[6E2)?pG2)@!J3$9t10fUjE1GLL@2DR-D1,q$F
+>PW*2)$sE0J5:A1G_$N2Dd<71,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)6m=3&!6M1Gh!M3$9t1
0f:XD1-$sD2`<KJ3B8iL+>PW*3&!3F1G1XH2)[<G0f(g41,(FA0JtRB/i>@C1,1dG1Gg400JPO@
2)7!@2`<WR1GLjC2'=Y.0fUjE1,COA2`WfR3&*3K+>PW*3&!3F1bLaA2)mBL0ebI-1,(FB0JtX@
/iP[D2)$dF1,C%.0JPF=3&!6C2)R3M2_d9M2'=Y.0f:XE0K(OA2E!HI2`*BK+>PW*2)-d=2(gd@
2`EZR0K(a11,(FA0K([?/iGXF2Dd6E3B/-:0JPO@2)?s>2`EQR1GLgF2]sk00fUjE1GLL@3&ioU
1,1R>+>PW*3&!3G0ePCF1c.3H1GU^.1,(FB0JtX@/iP[D2)$dF1,C%.0JPO@2)?s>2`<EK0JYUC
1E\G,0fUjE1,LUC0K2!L0f:^H+>PW*3&!3F1G1UF3B&cS0f(d31,(FB0JtUA/iYgH0fV0I2DcO3
0JPO@2)7!@2`WTQ2)d3I1*A>+0f:XE0K1UC0K(aI2_[$H+>PW*3&!3F1G1UG2`3QM3&ET;1,(FB
0JtUA/iPaL3Ai]S3B83;0JPO@2)?p=2`<NN2`WlS0d&5*0fUjE1,LUC0JPRH0JYI@+>PW*3&!3G
0J5:A2_m?L3A`N71,(FB0JtUA/iPdE0JPF>3B/-:0JPO@2)?s>2`<EK0JYUC1E\G,0fUjE1,COB
2`NTN3AicO+>PW*3&!3G0ePCC1,Ua@3&3941,(FB0JtUB/iYO@3&EQN2)HF20JPO@2)6s?3&`iW
1bgdD1a"P-0fUjE1,COB3A<BH1Gh'I+>PW*3&!3F1bL^F3&WQI3&!341,(FB0JtUB/iP[J2D['I
0Jst.0JPO@2)6s?3&iTP3&*-B+>PW*3&!3F1bLaA2)mBL0ebI-1,(FB0JtX@/iP[D2)$dF1,C%.
0JPO@2)7!@2`<WR1GLjC2'=Y.0fUjE1,LUB3B&]Q1b^[F+>PW*3&!3F2D-pF0JYI@1c[E91,(FB
0JtX@/iPaH0JkRF1E\G,0fUjE1GLL@3B&fS0JY@*1,(FB0JtX@/iPdL0JYIF3&i$90JPO@2)?s>
2`W]O3A<6E1*A>+0fUjE1GLL@2DR-D1,q$F+>PW*3&!3G0ePCC1,Ua@3&3941,(FB0JtUB/iYR>
1-%$G1Gg400JPO@2)?p=2`3NL3&EWP1E\G,0fUjE1GLL@2DR-D1,q$F.4cl01*AM$1,(FA0JbC=
/iPXE3B8fP3AM^40JPF=2_[-B1c73M3&WNJ3$9t10f:XD0K(O?2)@!J1-%3H+>PW*2)$sC2D-gE
1b^X@0JYR01,(F?0K1[D/i5CC2D[$G1,g=20JPF=2_[-B1c@6G2E3KM2]sk00f:XD0K(O?2E*?N
0ebOG+>PW*2_[$B1bLaI1,:RB0ekC*1,(F?0K:aB/iGXF1,^sG2`W!90JPF=3&!-@1bpsE2DR'J
1*A>+0fUjE1,COC1GLUB0fUjF+>PW*2)%!D1G1LB3&<HK2`W`<1,(F?0K1[D/i5IE0K(mH2)cX5
0JPO@2)6s?3ANNJ3A`EM2CU1*4>J$>,Vh&.2)$sC3A*-G2_d9J1Gq*61,(F?0K1[G/i5FB1b^[F
1H6L40JPO@2)7'B2_[-F0f(gK+>PW*2)$sC3A*-G1b^pH3B9)B1,(FB0JtUB/iP^G1,CmL1GU(.
0JPO@2)?p=2`<BJ0KD*O1E\G,0f:XD0KCaB2)@6K2)dBL+>PW*2)$sC3A*-G1bpaF0K(^01,(FB
0JtX@/iP^E0f1dJ2_uR30JPO@2)7'B2_m'G1G_$O1E\G,0f:XD0KCaB2)I-D1-%-M+>PW*3&!3F
2D-pB2_d3E1,_*71,(F?0K1[G/i5FB0KCsM3B83;0JPO@2)?s>2`WiR3&NTQ1*A>+0fUjE1GCF?
2DI-F2`WTN+>PW*3&!3G0ePCC1,UaA0JGL01,(F?0K1[G/i5FB1,(^B2DZI20JPO@2)?s>2`EKH
3&rlP3%6C,4>J$63$^750f:XD0JY7=1H.'E1GCgD+>PW*2)$sC1+kI@2_m-F1H@H<1,(FA0JtR?
/i>XI3&r`K2`)X40JPL?1GCU;2`EQQ3&<?J2BXb/0f:XD1,1C>3&*6G2`EZU+>PW*3&!3F1G1UF
3B&cS1GCg31,(FA0JtRB/i>CC3&WTI2'=Y.0f:XD0Jb=A3B&iO0ebI?+>PW*3&!-B1G1L@3&`QO
0KC720JPO@1GCU;1c.0M0ebCD2'=Y.0fUjC0Jb=<1c.*F0ebUJ+>PW*3&!3F3A*0E2`WfU3B9)B
1,(FA0JP7A/iYgM1,h*L1G^./0JPF=2_d!=1bgsM3ArcP1E\G,0f:XD0eb4:0f:aF1G^pK+>PW*
2)$sC1+kI@2_m*E3B/u@1,(F?0K1[@/iGLE1,1X?2]sk00f:XD0JY7=1H.'D2)$gB+>PW*3&!3G
0ePF>1,q!I2E*B61,(FB0JtX@/iYO?3&*BO1cZ[60JPL?2)-j=2*!ZQ1GC[@0d&5*0fUjE1,^aD
0f([I3&30H+>PW*2)$sE0eP@D0fV-J2DlU40JPO@2)?p=2`<EF1cR?K0d&5*0fUjE1-$sG2Dd6M
3&<HQ+>PW*3&!3F3%d$B1bpdB1,:[/1,(FB0JbC=/i5CE2_d9G3?U(20fUjC0Jb=<1cRBJ0Jb^H
+>PW*3&!-B1G1L@3&iZK2)@-51,(FB0JtX?/iPXH1,q-I0JO\*0JPL?1,:^>2)[BM0JkRD1E\G,
0f:XD0eb4:1GCR<1c@0F+>PW*2)$sD0J51:2Dm0E1cR?81,(FB0JtX@/iYO?3&*0D1c6C20JPO@
2)?s>3&!*I0etR@+>PW*3&!3G0ePF>1,q!D1,Lj;/1<V7.4cl00I\P$4>838-p014/3GT     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
