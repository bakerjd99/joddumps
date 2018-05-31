NB. JOD dictionary dump: 30 May 2018 18:26:44
NB. Generated with JOD version; 0.9.996 - dev; 13; 30 May 2018 18:11:31
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

JODTOOLSVMD=:'0.9.996 - dev';13;'30 May 2018 18:11:32'

JODVMD=:'0.9.996 - dev';13;'30 May 2018 18:11:31'

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
0fV!41,C%.+>GPm1,1XA+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%1+>Pf/1*A;,+>G]31a"e$0fM*J+>GYp0ebCC+>Gl!1,1dI+>G_r0ebF?
+>GPm3&`f>0f'q21GU(-1a"M00eje*1a"M12)HF12'=V/2DZI20d&502DlU41a"P01H$@11*A;3
3&Da;+?25<@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn
+Dbb5F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S
@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(S
ATMs.De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO:-pQUFD,6+AKYi4F*&O6AKYE!
+E)41DBNJ(@ruF'DIIR2%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFCEb/]40f16e
$4R>REZf:2+EV..@rr.e:-pQUGAhM4F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAo&DJUFC
-OgCl$;No?+EV19FE8R:Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS*$>"6#0d'qCC`k)Q%13OO:-pQU
ATT&)ATVL(@1<QTEZd+[@W$!)-RT?1ATAnL+C]5)+=ANG$>"6#1a$7FC`k)Q%13OO:-pQU@W$!)
9i"\e9N`KTBl\64EcW@6DJUG-DfQtBBOr<'Df^"C@s)g4ASuT4@UWb^F`8HT+D#e-AT2`#$;No?
+C]5)+E).6Gp%0>@<,jkATJu&+EM77B5D-%E-67FA8,OqBl@ltEd8d:@:O(qE$079ATD?)BlbD7
D]j"-FD)*j:-pQUBOu'kAKZ).ATD?)@<,p%DJpY:@<?0*DfTB"EZfC6F*2;@F!,:5CLoOL+>=pF
0d("EC`k)Q%16Ze+>b2s+C]5)+=CMa:K/\a+AP6U+DkOsEc6"AASu$mDJ()9Bln#2-XT8;<$rf&
DBNG3EcP`/F<G%$@r$4+%16Ze+>P&p+C]5)+=D)<-QjNS+AP6U+D5_5F`;CE@rH7,@;0UnDJ()5
F^fE6EbTE(+=D)<-Qm,@+CfP7Eb0-1+C\bhCNXS*$4R>REZd%Y0d&.m@W$!)-RU#Z+<XEG/g+S=
C`mV6F`)7CBl5&'F`MM6DKI"1@:O(qE"*.cEZd%Y0d&1n@W$!)-RU#Z+<XEG/g+S=C`m.sG%G]'
F!,17+CfP7Eb0-1+C\bhCNXS*$4R=O$;No?+EqaEA9/l*Ec5e;E+*d/Bk):%@<*K"@:O(qE,uHq
:-pQU@VfOj+E(j7@UWb^F`8I@F_tT!EZen2FE8uUAS4%H4?G/M+=Acs1G1C@/ho7:0f:R<1bLL=
/ho+60Jk-d$;No?+D,P4D..O.ARlp)D]iJ)E+iZ&F)Q)@F!,=.FCSu,DKTf-EbT#+F)Q)@Et&If
EZeh/F_u1_3ZqmLC`k)X-OgDlCHX^$4u%CnDKTf;4ZX^6/g+V@F_u1/$4R>REZeh/C`m2&+<VdL
+<VdL+<VdL+<XEG/g)9GDJUFC/ho:4+<VdL+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l-DBNS+G%GP6
@UWb^F`7csATAo&DJUFCEb/]-/7NB;+<VdL+<Ve%67sB'@W$!)-ZWd-/ho:4+<XEG/g,">FCSuq
F!+n-C`mq?Eb'56F*(i2FD5W*+EqOABHS[CAR[#0Bl5&+Bm+'*+C\bhCNXS*$>"6#0H`.o@W$!)
-Y7NM/7NB;+<VdL:-pQU+>=oo+C]5)+=C`F/ho:4+<XEG/g,@VEb'56ASu$mDJ()9Bln#2-Y7NM
+DG^9B5)O#DBNCs@r$4+%16Ze+>Fup+C]5)+=C`F-S/_B+<VdL+AP6U+<WB]1E^.EC`k*:GV1^0
-QjO,67sC&ATMs7+D#G$Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"@:O(qE"*.cEZd+[1*C%DC`k*D
A1&p;CEO`B+<XEG/g)8l+>P'KDJUFCDe(IT2^]^j:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3
Bl7Q+-Z<NC+DG^9B5)O#DBNCs@r$4+%13OOATAnI+>Fun+C]5)+=BK'/7NB;+<Ve%67sBhCht5&
A9MO)@WNZ5FCB33Bl7Q+GA2/4+=BK'+DG^9B5)O#DBNCs@r$4+%13OO%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6"48DBk'.`3F?65Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n@W$!2+CT;'F_t]-F<GXADeio,
FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2
@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OL%15is
/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbmdT$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>
Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"m
Ci<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr
-RU8h-7hD1/1)_l-RU?.-mO0`4utqW4XMO(-RU>l%13OO:-pQUB4YslEaa'$+CT)&+E27?F(o*"
AKZ/)Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$4R>;67sC%@q]jF3ZpUIBeCMa+<XEG/g,4H
@<,jk+E;O4Ch[KqATDi$$;No?+DPe(4ZX].+<YAN+>b2`:-pQU8g&=rEb$;1@;TQu@r,RpEt&Hc
$;No?+Eh10Bk/?&AS-$,.!R0`@<-"'D.RU,Et&IO67sB'+<X*hBk1dc+<VdpBk)7!Df0!(GscL\
ATJt:+<VdL+<X'd@ruF'DIIR26Z6LHF&QXYEarc*+<VdL+<Xa(Eb&*[@<,jk8krf3AOC9BF)rHH
+<VdL+<VdL9jqOPDc:4UEarcW@:O=rFEqh:%15is/g+t=Eb@Nr+=K?d/he^s/0H?'+tt-86:s[6
<),ef@;9^k?R[*K+=Jdf-r30%771$L6XO8:De*3(4*+nFE@E"]+=Jdf-nJFq;FFl#C2[Wi.6DT\
BQ6+J/g)u"+=nW`/:/cr9gM-E:L@OFDe*3(4*+nFEB?l\6W-]Z=\qOo@;9^k?RZEk%15is/g,=G
Ch[E&EbT0"F<DuW.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+<VdLASlC.Gp"5=@:O(qE+<d-+<Ve8
Ci!g'@UWb^F`8HGD..NrBQ@ZoASuT4+<YN0FCSuuDIR$aCNXS*$;No?+ECn2B0A9u-RU#Z4!5Xn
/ghba+<VdL+?L\n/n8gBDKI6K4!5Xg-Z3@0ALATC+<VdL4!5ng@;TR.@rHL-F=.M)%15is/g+bE
Ec#6,F!+n-C`mn0Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+=BoN/g)Ma/0Zek+?Lc%
+<iin/j:C4+>=on+F>:e+<Wij-p/k"@W$!)-Rg/h+A=g=0d&"iHQX_!Cgh?s.3L/a4E5L^FCcdO
4s4lSEb>gg%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<DfTB0
/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&
DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&@;^?5@UWb^F`;CE%15Ks4ZX^4
3dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@EZd\794)$o9IqP@/no'4-OgCl
$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bhCNXT;+>"^IG]75(FCeu*ATDg0
EX`@nATAo&DJUFC-OgE#ATAo&DJUFC/gh)8DImi2@W$!)-S@2&%13OO:-pQU@rc-hFCcS:BQ@Zq
+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.jE+*6lA0<7A
ATMs.De(OL%13OO:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj
0fga+Ci<`m;f-GgATVL)F>+.24tq>&@:O(`+=D8BF*)/8A2#A?$6Tcb:-pQUFD,B/A0>f"C1Ums
+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#Tt
-Zip@FD>`)0II;:%15is/g,4RD.Oi!@<6-m+DG_:@;KXg+CT;'F_t]-FE8QV+D#e:ARfgnA0>H(
Ec5t-$>sEq+C]5)+=AdM-OgE#ATAnM+C]5)+=Acn0ddD;DImi21*C%DC`k)X/gh)8DImi2@W$!)
0F\A,ATAo&DJUFX-RT?1%15is/g,4RD.Oi!@<6-m+DG@tDKKT7Bk;?.%14LmDJUFC-Rg/i3ZqmL
C`keoHX^l/+=Ach+:SZ+0HahBC`k)Q.3L3'+>=pIDJUFW0mbSs@W$!)-S?bh%14L<+C]5)+=ANc
+>#Vs0d'qCC`keoHSHXPDJUFC/ghbN$7IYP@W$!)-RU>c/NP"0+C]5)+?M<)1*C%DC`k)X-Qij*
-o2uTDJUFC-Rg/i3Zp4$@W$!)4#)(<+C]5)+=Ach+:SZ+1a$7FC`k)Q.3L3'+>b3MDJUFW0mb`"
@W$!)-S?bh%13OO:-pQU+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8%16QQA8ZO,
4ZX]5/ghbm+<iih0f'q&+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq+D,Y4D'0s=
Df0-2BleB-DKI"1@:O(qE$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQpDImi20HahB
C`m1qA8ZO,%16uaEZd(Z@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\@W$!)@UWeb
F_qQpDImi21a$7FC`m1qA8ZO,%13OO:-pQU9jqpb+E(j7Eb0)rBl7X&B-;;-F*)IG@rc:*Bk(Rf
Cj@.6AT23uA0>f.+EV:.+Dbt)A7]9oDdmHm@rucE%15is/g*_t+EV:.+Dbt)A0>r1Deio,FCfN8
+EM%5BlJ08+CT;%+Cf(nDJ*Nk+CQC/Dfd+?Afu2/ATME*FCfN8Et&IO67sBtF`VXI@V$[&AThd/
ARmD9%13OO:-pQU+C]5)+=ANG$7KG&C`k)Q.3L3'+C]5)+=ANG$4R>;67sB'@W$!)-SAnIF`):K
%14LmDJUFC-Rg/i3ZqmLC`keoHX^l/+=Ach%13OO:-pQU+C]5)+=D&8D.P(($7IVj+?MV36;LBN
5u^WS0H`\X:J=&R:JEPd6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs@W$!)-ULU)9IC8V%15is/g)9G
DJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3ZqmLC`k)s:/iSl4#2.l
DJU[Q-OgCl$;No?+>=pIDJUFC-OgD20HanDC`k)Q.3L3'+<W?\@W$!)-RT?1%15is/g)hj@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!@W$!)-S?bU$4R>;67sB7+C]5)+=AdODfor>-OgD20HanDC`k)Q
.3L3'+>=pIDJUFW0mdAIC`k)X-OgCl$;No?+>=pIDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc
6;LBN5u^WS0d&eY:J=GR;cFl+:JXY`5se76-Rg/i3Zp+!@W$!)-ULU)9IC8V%15is/g)hj@W$!)
-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,/NP".+C]5)+=B`U<$s4Y14*JJ
CaUh_%13OO:-pQU0d'qCC`k)Q%14L<4"#)dDeio<<+U,m0IJq0F)>i2AMI.qF*')`4"#)dDeio=
<+U,m0deCm/NP"/+C]5)+=ANG$4R>;67sB8+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+C]5)+=Ach
%13OO:-pQU0d'qCC`k)X@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFW14*JJCaUh_
%13OO:-pQU0d'qCC`k*C@;TR'%14L<4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'+>G!J
DJUFCF)>i2AMGPA$4R>;67sB8+C]5)+=D&8D.P>0Dfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs
0d'qCC`k*HD/X3$0IJD514*JJCaUh_%13OO:-pQU1*C%DC`k)Q%14L<4""KUDesK3Deio<-T`\b
Df9H5D/X3$0df%1Bl8$6D/X3$0IJq0Bl8$6D/X3$0deCm/NP"0+C]5)+=ANG$4R>;67sB9+C]5)
+=Ach%14LmDJUFC/gi(j/NP"0+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M)-n%24.4dS8
,[i__+>#Vs1*C%DC`keqHX^l/-S?bU$4R>;67sB9+C]5)+=D&8D.P(($7IVj-Y[I?F)>i2AMGP]
+>#Vs1*C%DC`k*>DKKr:Deio=-OgCl$;No?+>P'KDJUFCDIIBn/n8gBDKI68$7IVj-Xq"4CiaH3
CLo1I.3L3'+>P'KDJUFC@W-1$-S.>7HX^l/+=Ach%13OO:-pQU1E^.EC`k)Q%14L<4"#)lBlmp-
D/X3$0deCm/NP"1+C]5)-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$@W$!)-S?bU
$4R>;67sB:+C]5)+=AdODfor>-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`keoHX^l/-S?bU
$4R>;67sB:+C]5)+=D&8D.P(($7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)-ZaDX%13OO:-pQU
1E^.EC`k*C@;TR.@rHL-F=.M)-n%24.4dS8,[i__+>#Vs1E^.EC`k*HFXJ_%14*JJCaUh_%13OO
:-pQU1a$7FC`k)Q%14L<4"#)dDeio<9jqOPD_NP#-Za-CCLo1o@:O=r0df%1F)>i2AMHnf@rcKA
-T`\sD/X3$0hl(dEc3Z[.3L3'+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1+=Ach.3L3'
+>b3MDJUFC/gh)8%15is/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo:-pQU1a$7F
C`k*C@;TR.@rHL-F=.M):-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`(m@W$!)-S?bU$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)+=D&8D.P((
$;No?+>=om+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on+C]5)+=Ach
%14LmDJUFC/gi(j/NP".+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M):-pQU0H`+n
@W$!)-Z3@0AL@oo:-pQU0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q%13OO:-pQU
0H`.o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)+=AdODfor>
-OgDX67sB7+>Y-LDJUFCDIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Fun+C]5)
+=ANG$4R>;67sB8+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO:-pQU0d&1n
@W$!)-SAnIF`):K%15is/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.@rHL-F=.M)
:-pQU0d&4o@W$!)-RT?1%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o@W$!)-S?bU
$4R>;67sB8+>P'KDJUFC/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo+C]5)+=D&8
D.P>0Dfor>-OgDX67sB8+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP"/
+>Y-LDJUFC/gh)8%15is/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0AL@oo:-pQU
0d&7p@W$!)-Z3@0AM.J2F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp1#0d'qCC`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9+>G!JDJUFC
DIIBn-OgDX67sB9+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;67sB9+>P'K
DJUFC/gh)8-t7(1+=Ach.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnIF`):K%15is
/g)nl1*C%DC`k*C@;TR'%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q@W$!)-RT?1
%15is/g)nl1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9+>Y-LDJUFC
/n8gBDKI68$;No?+>P&q+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:
+>G!JDJUFC-OgCl$;No?+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC/gh)8%15is
/g)qm0d'qCC`k)X@rHL-F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)-Z3@0AM.J2
F`):K%15is/g)qm1*C%DC`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1*C%D
C`k)X-OgCl$;No?+>Y,q+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX67sB:+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8-t7(1+=Ach
.3L3'+>Y,r+C]5)+=Ach%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.EC`k*C@;TR'
%15is/g)qm1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68$;No?+>b2q
+C]5)+=D&8D.P(($;No?+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC-OgCl$;No?
+>b2r+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%DC`k)X@rHL-
F=.M):-pQU1a"Or@W$!)-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E^.E
C`k)Q%13OO:-pQU1a"Rs@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl$;No?+>b2s
+C]5)+=AdODfor>-OgDX67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn/n8gBDKI68
$;No?+>=om+>=pIDJUFC-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>=pI
DJUFC/gh)8%15is/g)hj0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0AL@oo:-pQU
0H`(m0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gBDKI68$;No?
+>=om+>G!JDJUFCDIIBn-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fuo+C]5)
+=ANG$4R>;67sB7+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach%13OO:-pQU
0H`(m1*C%DC`k)X@rHL-F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o@W$!)-Z3@0
AM.J2F`):K%15is/g)hj0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!0d&7p@W$!)-S?bU$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup+C]5)+=D&8
D.P(($;No?+>=om+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl$;No?+>=on
+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n@W$!)-SAnI
F`):K%15is/g)hj1*A7n@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-F=.M):-pQU
0H`+n0d'qCC`k)Q%13OO:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0d'qCC`k)X
-OgCl$;No?+>=on+>G!JDJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX67sB7+>P&o
+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)+=Ach%14Lm
DJUFC/gi(j/NP".+>P&p+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M):-pQU0H`+n
1*C%DC`k*C@;TR'%15is/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q@W$!)-RT?1
%15is/g)hj1*A@q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;67sB7+>P&q
+C]5)+=AdODfor>-OgDX67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFCDIIBn/n8gB
DKI68$;No?+>=oo+>=pIDJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo
+>=pIDJUFC/gh)8%15is/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)-Z3@0AL@oo
:-pQU0H`.o0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU0H`.o0d'qC
C`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC/n8gBDKI68
$;No?+>=oo+>G!JDJUFCDIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,q
+C]5)+=ANG$4R>;67sB7+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)+=Ach%13OO
:-pQU0H`.o1*C%DC`k)X@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj1E\Fq@W$!)
-Z3@0AM.J2F`):K%15is/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp+!1E\Ir@W$!)-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7+>Y,r+C]5)
+=D&8D.P(($;No?+>=oo+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)-RT?1%15is
/g)tn0d&5++C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?+>b2q+>PYo
@W$!)-SAnIF`):K%15is/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)-Z3@0AM.J2
F`):K%15is/g)tn0d&5,+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Lq1,9t]DJUFC/gh)8%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo1*C%DC`k*C
@;TR'%15is/g)tn0d&5,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q%13OO:-pQU
1a"Lq1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;+>Fuo1E^.E
C`k)X@rHL-F=.M):-pQU1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU1a"Lq1,L+_DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
0d&5.+C]5)+=Ach%13OO:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-Z3@0
AL@oo:-pQU1a"Lq1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1%15is/g)tn
0d&5/+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q+>Pes@W$!)
-SAnIF`):K%15is/g)tn0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&50+C]5)+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,^7aDJUFC/gh)8%15is/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIHC`k*C@;TR'
%15is/g)tn0d&50+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO:-pQU1a"Lq
1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo2]uRIC`k)X
@rHL-F=.M):-pQU1a"Lq1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,pCcDJUFC-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&52
+C]5)+=Ach%13OO:-pQU1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is/g)tn1*A>,
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo@W$!)-SAnI
F`):K%15is/g)tn1*A>,+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1*A>-+C]5)+=ANG$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,9t]
DJUFC/gh)8%15is/g)tn1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C@;TR'%15is
/g)tn1*A>-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU1a"Or1,C%^
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.EC`k)X@rHL-
F=.M):-pQU1a"Or1,C%^DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU
1a"Or1,L+_DJUFC-OgCl$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>/+C]5)
+=Ach%13OO:-pQU1a"Or1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0AL@oo:-pQU
1a"Or1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn1*A>0+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)-SAnIF`):K
%15is/g)tn1*A>0+C]5)+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>1+C]5)+=ANG$4R>;67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,^7aDJUFC
/gh)8%15is/g)tn1*A>1+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'%15is/g)tn
1*A>1+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or1,g=bDJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X@rHL-F=.M)
:-pQU1a"Or1,g=bDJUFCDIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,pCcDJUFC-OgCl$;No?+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3+C]5)+=Ach
%13OO:-pQU1a"Or1,pCcDJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Or
1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnIF`):K%15is
/g)tn1E\G-+C]5)+=D&8D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G.
+C]5)+=ANG$4R>;67sB;+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]DJUFC/gh)8
%15is/g)tn1E\G.+C]5)+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is/g)tn1E\G.
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2s+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-F=.M):-pQU
1a"Rs1,C%^DJUFCDIIBn-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,L+_
DJUFC-OgCl$;No?+>b2s+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)+=Ach%13OO
:-pQU1a"Rs1,L+_DJUFC/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Rs1,L+_
DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Y,q2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K%15is/g)tn
1E\G1+C]5)+=D&8D.P(($;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G2+C]5)
+=ANG$4R>;67sB;+>Y,q2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC/gh)8%15is
/g)tn1E\G2+C]5)+=AdODfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn1E\G2+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>Pku@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs
1,g=bDJUFCDIIBn-OgDX67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC
-OgCl$;No?+>b2s+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach%13OO:-pQU
1a"Rs1,pCcDJUFC/n8gBDKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs1,pCcDJUFC
DIIBn/n8gBDKI68$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R=j0fU=;
1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1R:-pQ_@rH4'
C/\tfCLo1R+ET1e+EV19F<DuADf'H..3NM:D.Oi.@V0b(@psInDf.0:$;No?%15is/g+5/ASrW4
BOr;/F*)G:DJ((?001OF3ZoPRE,]AsEcW?GBl5%9@3A/b+EqaEA0<!C@rH4'C+19LBl%Sp$;No?
+E(_$F`V&$FCcS'DL!?ICi<flC`mV(D.Rc@+AZHYF`V&$FCeu*DIIBnF!)T7AS5^p+<YlBFD)e=
BOqV[:-pQUE,oN%Bm:aC-r30!<Du7]7T_)^+CT.u+<Ve<DIak4GA2/4+<Y]5DId[&+<Y-%F(HI:
:-hTC5tk*G5n+/r67sC%F_56"G\(q=+<Y04DKKo;Ci!Zn+<Y-=+<W(.6:OsR6UOUJ.4u_c+@p3Z
BOu3,+<Yi9Cis<1+<YT7%15is/g)Q<6:OsR6UOUJ.3N87DImisFCcS2Df03!EZee.A0>]"F)rI?
Bkq9rGp%3I+Cf4rF(c\6@;TRs/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU+<WBf+CT>4
F_t]2+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1E^gZ
A79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$
3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6
A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172f
Bk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$4R>;67sBjBOPpi@ru:&
+EV%$Ch4`0AT2[$F(K62@<?4%DBNk0+DN$CDfTB0/0JG2Chu-T+DPD,+=D>DEagC*$>O'k4ZZe.
+C.&]?SNZO0edr_/h%no+BplL2'G"<+?U)?%15is/g+\9Anc-o+EqaEA0?)1FD)e8@V0b(@psIn
Df-!kDdm=$F(8X#ASl!44ZX]A+?CW!%15is/g)Pq3[m3Q+E(_$F`V&$FCcS2De!3l+DtV)ATJ:f
-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8
ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2
@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]
CLoLd3F=-C$4R>;67sC%FDl22+DG^9A8,OqBl@ltEd8*$ATAo8D/a<0@j#`5F<DrL@V0b(@psIj
D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o+EqOABHV5&Ap&0)@<?'k+DtV)ATJ:f0d'[C
0HiJ20JO\S+?M<)@rH4'C*4mB@V0b(@psIjD.PCK%13OO:-pQUCi<flC`mY*Ap&0)@<?'k+DtV)
ATJ:fDf0!#ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$
3B9*,-OgCl$7I-;DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&`DIIBn
Et&Hc$?Km!Ecbl1D.PCa3Zp4$3Zp*c$7BY.@ps1p+EV:*F<G4-F<Gd=Bl[`34Y@k&%16]cEaO!.
De*c=+F,)?D_;J++<YK=@ps1p%144#G@bK/A.8kg+DDr]/g)BTDe!3lEt&I!+Enqk/g+j;$>"*c
/e&.:%13OO:-pQUCi<flC`m\5@;0U%DIIBnEt&ImDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`
Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*l
EZfI@E,9H&+E2IF+=D5DDfTr2DJ`r=-OgCl$;No?+ED%%A0>>i@r!2qDIal#AS,XoAISu$+BosB
+Z_;20d'[C4#)(lDf'H.+=D5DDfTr2DJ`r=-OgCl$;No?+Dbt+@;I'-BQ%p5+DtV)ATJ:fF)GE'
ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iOBQ%p5ASu?r0OI+36$$m]CLoLd3F=-C$4R=j
,BIa2D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+EMF/D.Rbt$4R=O$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn"kE,&<gDeio<0ht%f.V!C6E,&<gDeio<0d(Qi/KcHODf'H.
.3NeBCh[E&@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et
+>>E./i5'f$;No?+>G`gF_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/DIakuA867.FCeu*
AoD]48g$)G0Jj4G:-pQU+<VdL+<VdL@;]TuDIn#7.!'6DCLo&+@<6-m/8Sa8B4WW8FE1r6F"CgA
F`V4F+EV19FD5W*+ED%+Bl.Dj$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]
FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEo
ATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3
A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56FDi:3Df'H6
ATMo%$;>AUB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AN`'s1E\_$0F\?u$=[pl+?_>"Eb/ZqCjBi8
DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to+>=63De<R*ARf:mF(of/F*(i.A79Lh
F!*Uu+C]8-%13OOFD,*)@<,pfF(A]r@:s:lB45k!Df^#/DId0rA79RgCht4W/g+VAD]gMPGmt)i
$7AeA6qL0S;]nq;:K0bN+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[d$_$7A>;
:I7?@;]nM26VLKJ778Ld3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr)Df02_@;TRs6#pO7ARTCk
Gt;@aA5mJHH#R=B%17,c+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lPATL.XAQ!)JCi"Af@<,mX
DcD"$AL@oo0d'[CF)>i<FDuAE+EVjM%13OOF(fK4F?MZ-1E\_$0F\@a67sBu@;TRs+CT)&Eb/Zi
Gp%$CAKYJr@<*JB+Du+>+Cf(nDJ*Nk%16N,/pRm5Gs*cg+=\Kh%17DE/n#kP+F,(Z+F+D'.1HUn
$>"6#FDYu5Ddso/F`\`RF(fK4F=.M)Eap4r+=D2>+EVjM-TsM#Df'H.+=D5DDfTqI%14g4>9J!(
Dfp/@F`\aJG]XB%%13OODdmHm@rua&Aog*r+>Y-$+>=63Bjkjc?Z0CgARfgF/g,E^:-pQUA8`T.
Dfd+3Df'H6ATMo8DdmHm@ruc$$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4%13OOA8-'q
@ru(&G^*RY/g,E^:-pQUA8`T.Dfd+3Df'H6ATMo8Ci<flCh7Ys$7QDk%16Ze+EVI>Ci<f+E-67F
-Z<I/ARfh&AS-!2%17,c+Bos9Eap56G]Y;r3b*)FE,$LCDdmHm@rua&Aof=/$8EZ-+EMC<F`_SF
F<G[MF:AQd$>40n@UX(nAS-!H3\qm>+>=63B5DKq@;L!-.Ni/?AKWHFDJsV>.Ni5>D/aN,F)to'
+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.
+=Cf<Ddm-kEb/j(-OgD;+Bot0D/XQ=E-67FFEhm:$4R=O$=m^XCgh?qA927!E+O)R3Zp7%3Zp*c
$4R>;67sBkARfObEb/c(F(9--ATJu&Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,og$;No?+D#e-Cis9"
A0>K)Df$V=BOr;rDf'H6ATMp,Df-\:Ec5H!F)qct%17#sATDg*A7[nbB5DKq@;L!J3ZrYi+AP6U
-n6Z//g,(UATDg*A7ZlrCi<ckCi^$m%16Q_D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U+=J]g4ZX]p
Df6b3Df6b?Df6'l%16]cEaN]mD.Rc@+F,)?D_;J++<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBp
D/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT_$6UH6+=DAE+D58-+CfG7DI[?kA0>f5F<GL6
+D#e3F*(u2@q@#14Y@jp@;TRs+=\LO@;TRs%16ZaA1e;u%16ceD]gMPGmt*0%13OOATAo8D/a<0
@j#`5F<DrAARfObEb/d&@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7ARfObEb/d&@rH<t
F!hD(0d'[CF)>i<FDuAE+EVjM%13OOD/"6+A927!E+O)R3Zp4$3Zp*c$4R>;67sBsDe!3l+DGm>
@<6L(B5V9k+Dbt+@;I&pDIal&Ci<ckC^g_H67sC)BOu'(@;^?5D/"6+A0>r'DfB9/+CT;%+Co&*
ARfgnA0>f.Cj?Hs:-pQUGA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=Ddmc:+ED%4DfTr@%15is
/g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEt&Hc$>aWj@;J(Z+F+D'Ci<flCcsg%1*A%hCi<fl
C^g_#%13OOATAo8D/a<0@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044+Cf>,E,$LC
D/"6+A927!E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A+?CW!%13OO
:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?+Dbb-AKYK$
DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0+DGm>FD,5.
F(&ZlF*&OHBPD?s+EVNEA8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5DIal1AT2R.
FE8R7Df000F(Jl)A7]7e@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&
Ci<ckC`k;PB5\o)BkMR/AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ceD`o^^Df6aJ
+F,(P:-pQU-n6Z/3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!hD(Eap4r
+=D2>+EVjM-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!hD(%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd
3F?9:ART[lFCfN8A8,OqBl@ltEbT*+:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9/M/)TEb/[$
ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+&7DBL?<ATMs6Dg?G9F*(r,
@ruF'DIIR"ATK:CFCfN8+E2@8DfQtBD]j(CDJj0+B.aW#:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;An>F+1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80l:?E0f'qhDe*Qo
Bk:ftFDi:BF`&=GBln#2DIn#7-u!F7A18X8DKKH1Amo1\+Dbt+@;KKa$;No?+>GTgDg!lj+=M8I
Ec5l<.3N&0A7]9o/KeJ4C3=T>ARlp*D]j(CDBNk8+C]82BHVM5DId[0+=84IBl8'<%15is/g)l-
C3=DL0HbIKF*&O8Bk)7!Df0!(Bk;?.@WGmpA7]9o/KenKEb-A%A7T7^%15is/g)l.D..]F0d(1J
F*2M7+FZpY6rZTR<$5^cEb/a&DfU+GAU%p1FE7lu:-pQU0fX#YGr%,s@:Wmk.!0E?GUXbWATMr9
A8,OqBl@ltEd8dF@;TQuE,oN%Bm:'o%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL+A,Et<(0_b
+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>;67sC&ATMs)
EZfLHBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO:-pQU
@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,
4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$?U6!GWe)1-Zip@FD>`)-OgCl$;No?+AQisANCrUBOr<88l%iS78m/.
Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1
:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5
>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P$4R=s+Bot*@;BFbBl[QhC2[Wi+?W7l
6rZTR<)QLf<"00D$;No?+CSeqF`VXIF)59+BHUo*EZf14DKU1WD.-o`$;+)^<(0_b;GU(f4ZX^-
F)59+BJNq'C2[Wi+A,Et<(0_b;GU(f%13OO:-pQU@rc-hFCcS+D/aTB+EV19F<G+.@ruF'DIIR"
ATJtG+EM+9FD5W*+@K!m<D>nW<(';F<"01067sC&D]g_VE,oN2ATDs*F!,R<AKZ)/D.Oi2FCB$*
+C]A"DIb@/$=n$;3co=QGUt3r0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F
.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo
+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,+-OgDoEZf72G@Vh,DECHd6rZTR
<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+
De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SR;'
%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f
-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep
0H^f3%16W`4Z[\(Ap>jS0Jb'c$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>Q
FCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHq
F(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r1a`_>ATAo2ATqZ-A8XJ$:IJ/N;cHXj
:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5
A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,/-OgDo
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4
:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd
$4R>QDEU%&E+X>G-SRG+%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-
E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4
+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0K1?g$>"6#DIn$&+Co@O8l%iS78m/`:JXq@
A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!
$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r3%#.BATAo2
ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
A8XOkFDti:/13,3-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ij
C2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!
:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[;&%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-
$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze
+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0ek$b$>"6#DIn$&
+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b
;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;
3co=QGUt3s1+*M<ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k
?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M
9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13/.-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze
+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\
De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[G*%16Ze+Dtb7A0>E#
4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf
<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(
Ap>jS0f:<f$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3
.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW
<(';F<$sa]+:SYe$;No?+E):2ATAo3Aftr!B5VF*F_#&+A8,OqBl@ltEbT*+%16W`4Z[\(Ap>jS
0eb:/%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo
+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ
6W>Ep0H^f3%15is/g,7[D]it=A7]e&+E(j7D..'pBlnK.AKYMt@ruF'DIIR"ATJ:fA8XOkFDti:
/13/+0JFj`$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3
.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW
<(';F<$sa]+:SYe$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=m^a6=FqL@k]Sk:-pQ_A7]RD
@<6-m0JG4(F=f'e@UX=l@j#r'Ch[E&-tHn*.3N_DF*)IU%15is/g(T1:-pQU@<6L4D.RcL%15is
/e&._67sB'+>G;f@3AH:5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.4u&::-pQB$;No?
+A,Et+CehrCi^_@D]j+4FEMOFFCfN8+D#G6Bl\-0D.RU,+>"^EF)uJ@ATJtd:IJ,W<Dl1Q+:SZQ
67sBhA7TUr+DG_7FCB!%ARlolDIak^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.-u*[2A7]p;
C2[W9F`_>6F"%P*:-pQB$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is
/g)8ZD/=89-YdR1FCfN8ATB.-$;No?+<VeCDdd0!-YdR1FCfN8ATB.@+:SZQ67sB'+>G!ZFEAWQ
@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4A+AP6U+CfG'@<?''FCfN8+Co1rFD5Z2@<-'nEt&IO67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0K3lfFtbWn@rH7.ATDm(A0>u4+DNee0JXb&+ED%2@;TRd%15is/g)l'D..]E1E^gZA79Rk
A0>K&EZdt502-(tFa,$PATDj+Df-\9Afs]A6k'Ju67sB80l:?E1,'h!C2[X)ATMs)E[`,OAT;j,
Eb-V/%15is/g)l'DJs\R1E^1@@;]^hA0>u4+E_a:+EV13E,Tc*Ed8dDDe!3lAISuA67sB83,N)L
1,L+rE+*j"A0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]55s[eG@<6-m3B9)I+BosuDe3rtF(HIV
-UC$a@UX=l@lZP0-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6miEN%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq%13OO:-pQUBl8!'Ec`F4+EqaE
A0>;uA0>DoCh7^"+DGp,$>EpcGAhM44ZX]A+?CW!%16N,/g)nl.j0*H$=P&,+>S0N$7QDk%16od
F`VXf3Zodm-RL*"+?CoV+FGdc?SR!PBeCSa-87\5>p*]2+Bp9D%13OOATAo8D/a<0@j#`5F<DrF
@;U4,Eb$O?+<XEG/g+kGFDi:4Bk)7!Df0!(Gmt*lEZen1C`k*>@;U4,Eb$O?+<XEG/g+kL+DGp?
Bl5&8BOr;sBk)7!Df0!(Gmt)i$>"6#A7]R"-Y["+GAhM4-QjNS:-pQUA7]RgFCcS=DfT@t$>sEq
+EVI>Ci<f+B4Z0--Y["+GAhM4-QjO,67sC)DfTA2BlbD-ASbq"ARlon@;]t$F<G4-F:AQd$;No?
+DG_7ATDl80eb:(GAhM4F!,17FDi:4Bk)7!Df0!(Gp$O5A0>DoCh7^"+EV:.D%-h#GAhM4H#R\?
F$2Q,4<cL&-[0KLA9i-4D^QYY+u(2_Che*6F<Dbg+=o,fBeCM_0JFpu4ZX]?0JFUo+?Uc(+Z_J'
4==iOD0Ko=A1%fnATAo8D/a<0@j#`5F<GdGEb'H7Df9\+$>"6#A7]R"GAhM4H#R\?Et&Hc$;No?
+EqO9C`mV6F<G%(+CS_qAKZ)5+D58-+CT/5+Co&"ATVKo+EqaEA9/1eDImi2FDYu5Ddso&ATT%C
0ebg:GAhM4H#R\?F")H[DfTB6E,TZ9%13OO:-pQUA7]RgFCcS'Cht57AS,LoASu!hF!+n/A0>Aq
ARfKuFD,62+CT;%+D5V1AISuXEZd(k+Co&"+EqaEA9i-4DfZ?pDImi2F`fi.+E_a:F!,[FEb'H7
Df9\+$4R>;67sC$AS5RlATD4$AKZ#)An?!oDI[7!%14g4>9GUBB5DKqF!a'nGAhM4H#R\?Et&Hc
$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*
+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,%16WWF*)G@
H$!V=FC])qFD5Z2@<-'nF&#%S.V*+3FE2;FFCfN8A8,OqBl@ltEbT*++ET1e+Co&)FE2;FF!+(N
6m-S_F*&O8Bk)7!Df0!(Bk;?<%15is/e&._67sBhF)uJ@ATKmT-u*[2FCfN8ATB4BBlbD*+Dbt)
A0>r'EbTK7%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp13
0emNRGqh)a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lj+=M8IEc5l<.3N&0A7]9o/KeqLG9CpKDK?q=DBN"p
DId[0F!+n/A0=Q[DKU15$;No?+>GfiF`&rg+C\c#Bk&8qDf00$B-;;-F*&O5A7T7^%15is/g)l.
D..]G0H_ccE+X>D+EV19F<G+.@ruF'DIIR2+E2@4AncK4@:Wn[A.8kT$=e!aF`MM6DKI!K@UX=h
-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`
6rZTR<$r+^%15is/g,7IF*&OIFD5Q4+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+Bosu
De3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^J
Bl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?U6!
GWe)1-Zip@FD>`)-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,OqBl@ltEbT*+%15:G
/g*PR6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-+EM47GApu3F!*kB
6W?uI3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nIE$E+X>D+@Rn*5'nn+0d&kU6W?tn$8EZ-+>Y-\
AS5O#4s36b6W?tn$4R>;67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!Df0!(Bk;>p
$;No?+AQisANCrUBOr<8C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&
$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<
Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P
$4R=s+Bot/D/sQ5F<F1O6rZTR<)QLf<"00D$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QBk1.Z
Deio<0MXqe.V*7(;f-GgAM>e\F=f'e-tI%&.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL
+:SZQ67r]S:-pQU+<WBf+EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$F*(u6.3NeF
Eaj)4@<Q'nCggdhAISuA67sB'+>YGh;FNl>=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+3XlEk67sB'
+<VdL.!0$AFD>`)0JG%#FCfN8C2[W:0e=GhATMs.De(RV/0K%GF*)/8A2,bl.3K',:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>>`bARdGT+Cf>-G%G]9ARlp*D]idQ/hf%'8l%ha$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A+RG
9PJBeGRY!T67sB82/78M0KC7rAStpnARlo3A8,RQD/X3$0JFpuAo_g,+=Lc7A3s^GBk&hN0e"4S
$;No?+<VdL+<VdL+EDUB+DG^9C3=E0+Dbt+@;KKa$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.
ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.
$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/
DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8
A2#\b%13OO:-pQUFD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'+DGJ+DfTE1
+DGpFF!+n3B6A'&DKKqP%16Ze+E(d5FC])qF:ARgEZen,A0<Q8$4R>;67sBuF_tT!EZf:4+Co1r
FD5Z2@<-'nF!,C=+E1b2BHV/7F*&OA@<?!m%14g44WkslI4cXQBk/>?%13OOATAo3A0<rp-Zip@
FD>`)0JO\lATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63%16Ze+E]h.+>=pK
Bk/>?%14s84Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#1E^UH+?MW+A8,Oq
/12Q^ATMs.De(RV0II;:ATAo94ZX]rBk/?8+>=631E\h',9S]`E+rft+E\,#%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$$m]CLoLd3F?<7Cf>1hCLo1R:-pQ_A8Z3^D/X3$0JFVk/M/(nA8Z34+EMC<CLnW1ATMs7
/e&._67r]S:-pQU6YL%@CNCU@@;Ka&+EV:.+Eh10Bk/>/@<-"'D.RU,+<Y0&F(KD8+E(j7+=Lc<
CagtZ+AR&rATD^3Et&IO67sB)DIm6sCj@.5DfTl0@rrn;Bl8*&Ch[E&@psFiF!+n3AKYDtF)N1C
ATMs)A1e;u:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2
@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ife
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&
ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$a
F)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq%13OO
:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g,(MCj@.B
F`\a:Bk)7!Df0!(Gp$gB+E)-?FD,5.E+*j%%14j54Wkt[Bk/>?%13OO:-pQUA8,OqBl@ltEd8dA
F!,%2E--@7$8<Sc+<s&m0d(fc0HanDC`k)Q%14d34Wkt5+>G!c+>G!LDJUFC-OgD:+?^hl4s2R&
HQY'dA8Z3+-RT?10H`M$,<d5)+F>4e+CoA++=ANG$8<Sc+<s&m0d(fc1a$=HC`k)Q%13OO:-pQU
Bl8!'Ec`FFDf'&.G%G]'Et&J"DIIBnF$2Q,-Xq:?A2#-8GB.4K+C]P8A259:GB.4M-OgDlGB.4J
4ZX]K%16QgEb$mf3Zp!`$=\4"A26;/+>Y-$+=DCV.Nj!a%16QgEb$sh3Zp.5+?CVmGT\R\1*A%h
Gpa%.4tq>*D/a<0@j#`5F<EY+G&C`*ATJ:f%15is/g+kGF(KB6+EMI<AKYl/F`)70$>s`iD.RcO
3ZoefGB.4J+DuCDA2,3EGB.4L+DuCDA2>?GGB.4N-OgD24$%7s@;TRs.6T^7-ms.MCj@.5Dg,Z/
H#k>^4"+eq+>P&q.6Aq40L%9G.6Aq;3?TUj5;aQ=,W@Y24$7XH-Zs<@@rGmh+Dk[4@WHB7%159Q
HZX+DCi<f+E-67F4$%7s@;TRs%13OO%14LoDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hD
D.Rbt$7ISNA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs%13OO-nlbu+CoA++=ANc
+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>i3AS,Y$%14L;+>P'M
DJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2Bl7NsGRY!.
0H`.oA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+EM[;
AncK!$4R=j0H`(mA8Z3+-Xq:?-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL+<XEG/g,@VEb$;3Eb/is
GRY!.0H`+nA8Z3+-T!2"+>#Vs0d&P#4$"a,GB.4N-QjNS+<VdL+<XEG/g,@VEb$;,DJ!U-%14L;
+>Y-NDJUFCA2,G\+>#Vs0d&P#4$"`uGB.4K+DuCDA2,GS+AP6U+EqaEA0>r9AnGb%%13OODImi2
0H`%lA8Z3+-RU$367sC#F^]*#Anbgs+D#S6DfTn.$>sEq+>=op+CoA++=ANG$>sEq+>=ol+>=pK
DJUFC-OgCl$7ISN0d&.mA8Z3+-RU>c/NP"/+?L]-3c8hDD.Rc2+<VdL+<XEG/g+_BE--@JGAhM4
+E2@4AncK4-uNsGDK@69$7ISN0d&.mA8Z3+-Z4-KA2GY_+>#Vs0d&P#4$"a,GB.4N-Ql/N/g,@V
Eb$;3Eb/isGT\DPDfor=.1HV40H`+n0HanDC`k*GA2>S^+>#Vs0d&P#4$"a,GB.4M-QjNS:-pQU
GAhM4+DG_*Bm:aKDJsZ8F"%P*-nlc"+>=pKDJUFCA2,G\+>#Vs0d&P#4$"a,GB.4K-QjNS+AP6U
+EqaEA0>r9AnGb%+=M,GF`)7L%13OODImi20H`1p0HanDC`k*GA1&KB:-pQUEHP]+BkD'jEZeq6
Ec5u>%16uaEZd%Y1a"RsA8Z3+-ZW`F+<V+#DImi20H`%l1E^4GC`k*CD^Pu$DImi20H`%l0d("E
C`k*LEc5i.-OgE#ATAnI+>=on+CoA++=CT1@;0U,%143e$7ISN0d&7pA8Z3+-RU>c/NP"/+?L]-
3d,CLD.Rc2+<VdL+<XEG/g+_BE--@JGAhM4+E2@4AncK4.!B0B@WNt-$7ISN0d&7pA8Z3+-Xq:?
A2>S^+>#Vs0d&P#4$"`uGB.4M-Ql/N/g,@VEb$;3Eb/isGT\DXATD7$.1HV40H`+n1E^4GC`k*G
A2>S^+>#Vs0d&P#4$"`uGB.4M-QjNS:-pQUGAhM4+DG_*Bm:aKG%G]'F"%P*-nlc"+>Y-NDJUFC
A2,G\+>#Vs0d&P#4$"`uGB.4K-QjNS+AP6U+EqaEA0>r9AnGb%+=MDEEaj)=%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,A8lU$F@'DWBk&hO:-pQ_A8lU$F@'DWBk&hO+ET1e+C\c#Bk&86A8lU$
F=A>O@<,dnATVL(+EM+904S[(DJ*N'FCfN8F"Rep67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf
+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)IU$;No?$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*12_#R1,'&167sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g)l.D..]F0d'@i:K0eZ9LM<I
+EV19FE8R5A7T7^$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$:-pQUGAhM;
+DG^9@r,^bEZeh"F(HJ4EZfIE@<6*)Ci<flCh3r`Ch7$q+=AND$=e!aCghC++EVI>Ci<fj5s[eY
Eaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OO@%Bl8!'Ec`EO
BkhQs-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5FC])q
F?MZ--Zip@FD>`)0JFj]$>"6#1*CLG+EV..@rrh9+<VdL+<VdL:-pQUDfB9*+AtWo6r-QO=UK%X
EZen3F(KG9-UCZu8P(m!-Ta%*+AP6U+CehtDJsV>@q]:gB4W3)@<,dnATVL($49Np/g,1GDfB9*
+DG_7F`M%9;FNl>=&MUh71*UH+E(d5FC])qF<Fd11E^UH+=ANDATAo(E-#T4+=C&U5t"dP8Q8,+
$>"6#A8lU$F<Dqs;aX,J3&N'F0a_K4+CoG4ATT%B;FOPN8PVQA741/O$49Np/g,">CLnW/ART*l
Df0B:+>"^GBOPdkAKZ22Cht5+@;0NbATAo(E-#T4+=C&U5t"LD9N`_MDImi2A8lU$F<Dqs;aX,J
3&N'F0a\7_67sC$AT)O!DBLMRA8,OqBl@ltEd8dAF!+@L5t"LD9N_^6EZf:2+EV..@rrht+>Y-Y
A0<6I$>sEq+CoG4ATT%B5uU-B8N8RT4"q!K:-pQUBl8!7Eb-A8ATMr9B6%p5E$/_:BleB;$>"6#
A8lU$F<Dr/76s=C;FshV-OMRN>9G[DA7]R"-Zip@FD#W4F`8]8:-pQUF`V87B-;D:Eb'56Bl5&0
Ddd0fA0>W*A0>Au@<6JsATAn@@;9^kA8bp)+E2IF+Du"&@;9^kA8bpa+=ANDATAo+Ec<-KFCfN8
B6%p5E$m_bCgUUcDe*Bs@UC6*-OL2U67sC$ASbdsBm+&1Ec5l<F!+q'B5)6+GA2/4+=DUc$>"6#
A8lU$F<Dr/:JXqZ:J=/F;C=OR6:"";:JXq;$49Np/g+SEFCf<.F<G[D+DkP&AKYW+Dfp"AGA1l0
+D,%rC`m1u@psM$AKYo'+C\bi+EDC=F:)nsEZf48F!)iPATMs+Ec6)>-OL2U67sC$ATMF)+EVNE
G%#3$A0>o2Dfd+1DIal1ASkjkAKWQIBl8!7Eb-A8@<-!lF<G16Ch.*t+D#e3F*)I10d'[CD..3k
A8-'k@;9^k?Q_IGE+*j%+=DV1:IJ/N;cGDlATMs(E-#T4-OOF*+CoG4ATT%B;GU(f7Sc]G78bKp
-[nZ`6rZTR<%i?)F*(r3F(KG@$>"6#D/=89-Zip@FD#W4F`8]8$49Np/g)`m<(0_b+B)9-6UapP
7TE-1/IH'0AT)O!DBLV?$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F??.;f-GgAM>f567sa!A5d>`CLo1R+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJX
F)tV<FCf]=.3KaT@:F%a%15is/g+_9Bln',B.aW#:-pQB$;No?+=Lf3.3N_DF*)IGEb065Bl[c-
D/XH++E_a:EZf(6FCfK9ASuU(Df-\>BOPd$D..=-+E)@8ATAnc:IGX!:-pQUFCfN8F"SRX6$".k
FD,5.+EV19FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeLF(KA7+EqO;A8c[5+<W(NEX`@N67sBoH#R>8
Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&$;No?%15is/g+SD
F*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L
1,C%qE+EC!ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBpDKBB0
F<DuMG%G]<EbTW,.3NhQEb'56De:,8@<-(#F`S[IH#R>9%16Q_Derm$Gs+220F\A$Ci<a(D.Pjk
+>Gl8+=/-p+>Y,q+>P&b+?)4g$;"o>G%F$S@<,ddFCfJU3Zoe`Dg*=@F^o)-GAhD1+EqaHCh+Ys
+EqaBA0>AqF^o20@q^!pCF9PuA8cU"Ch7R%F`V\CB5_^!4ZX]93Zp[1.ln+H@;TspEb'*14ZX]4
/e&/3DIIBnF$2Q,4$"`uDf9H$Dg<I;Ci<a(D.Oh]BOQ'q6YKnK@:OCjEZen2F^f/uE,9Z<F`(i1
De'u!D/a',A8cQ;%159QHZX+DCi<f+E-67FGA^i+ATJ:f4tq>*0KhH>0H`)(+D58-+Eq^3D.Rbt
$4R>;67sBlA8--.GAhM4+=M,9D.P8.CghC+/9GHJF=A>S@:F%a%14g4>9J!#Dg-//F)rHO@q]F`
CER2!Bln96+>Fuj+=A^%0RJ"]@;TRs+Bot"A0<rgHZUqN$4R>;67sBpDKBB0F<G[:F*)IG@;]Tu
@;]TuD.-ppDfZ?p4tq=<+E2IF+=D8BF*(i,E+iZ60IJq0:-pQUBl7g,@rHL2+EV1>F=.M)4tq=<
+E2IF+=D8BF*(i,E+iZ60df%1:-pQUBl7g,@rHL2+EV1>F=.M)4tq=<+E2IF+=D8BF*(i,E+iZ6
1+,.2:-pQUBl7g,@rHL2+EV1>F=.M)4tq=?+E2IF+=D#7@rcKrCiF&r0JFk91,1j<0d%th0ddD;
4tq=?+E2IF+=D#7@rcKrCiF&r0JOq:1,1j<0d%th0ddD;%159QHZUu*3Zp."B4Z0-FDbN(ATL!q
+FPjb0d("EC`k*IATMs%CiF&r0II;:%15is/g+_9BlkJ>ATMrADIIBn/9GHJF=A>S@:F%a%14g4
>9J!#Dg-//F)rHO@q]F`CER2!Bln96+>P&k+=A^%0RInZ@;TRs+Bot"A0<rgHZUtO$4R>+0RIms
4ZX]B+D58-+Dl")D.RcO3Zri'+>b3ODJUFCD.-ppDddI$BONSB%13OO:-pQUARoLs+DkOsEc3'K
DIIBn/7WU/ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd.\/KcDl4"u"u
DIIBnF!+[0ARloF0me!t%13OO%16Ze+>Y-YA0>u)Bk)5o$4R>;67sB4HW3F4<$5+>6UO:@;asb\
I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE
3B:GZCi<d(6=FqL@k]Sk:-pQ_B5DKqF$a;VBk&hN0d(Qi/Kc0F@<6-m+=Ll=Ddmc:+EV19FE9&D
$;No?%15is/g+,)F*)IG@3B/jBl%p4AKY])+Eh10Bk/?(@;TQuAU&<;@:OCnDf-\.Bldd&G%G]*
A0?)0ASqqa:-pQUCi<`mBl7Q+F)Po,+E(j76>p<U6=k1TARfM$-Z^D&+Cf>#AKY])FDi9o/g)8G
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R1E^gZA79Rk
A0>K&EZdt502-(tFa+?&:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@
Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R=O$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]55s[eG@<6-m3B9)I+BosuDe3rt
F(HIV-UC$a@UX=l@lZP0-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/6
4"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%13OO:-pQU@rc-hFCcS'+Eh=:@N]l/FD)e7D]i\/
Ddm-k+Eh16BjkIeAKZ#)An?!oDI[7!/e&._67sBhCht59BOr;pF)u&.DIm?$DIIBnF!+n3AKZ/)
EbTH7F!+'t@rH7+FCB'/F!(o!:-pQUDJsE(+EM47F_kS2@;p0s@<*K!F!,@/D.Rc2GA(Q*+=Ll=
Ddmc:+DGm>@;p1%Bk:g-%172gF*(o1DKBo.DKKq_3Zp4$3Zp*c$=Q(M+C?j<0b"J!4Y@ja2g@7j
$=c4O+>P`n2%9n'4Y@ja0kE9Q$>)FR+C?j40fKOKAN_Xg1,F.a$>)FR+>e$s%14Nn$4R>;67sC%
BQ&$0A0>>m+D#D/FEo!ACi<ckC`mP.F*&NV+ED%*ATAo8D]iq+D.Oi(DBO%4D/^V6De!3lAISu#
4X3.;3Zr'ODdmc1-Zip@FCT6,F*(i.FE:e:/9G`JCi<f7-XS51$4R>REaa$#+=D8BF*(o1DKBo.
DKKqI%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,%16`aDdmcdD/X3$6$%*]B5TCW0MXqe.VER9
@WPIbDeioMF)u&.DD3au+<VeK/M/(f+DG_(Bl[cpF<D]7F)u&.DJ`s&F<D]EAfr3=B5DKq@;HA[
:-pQUF`)2ADffQ$+DtV)AKYf'F*&OBDfor=/e&._67r]S:-pQU7<3EeEZen,F(9-3ATD?m+CoV8
Bl7Q+F`V+:De:+a:IH=DDBLVn+AZKh+>PW*2'=V/3]/`T1bfFH:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<lZF>,]a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gfl@<jR_+D,>*
@;Kb*+D,>4+EV:2F!,@CBld^#@q?)V:-pQU0fNrXGqh0!@:WmkDg#]4EbT&q+EV%)+=LPW.6T^$
$;No?+>Gim@<jUa+Cf(nDJ*N'Dg#]4EbT&q+EV%)+EVNE-p0O>4ZX];+EM+*+Du+?DBMYF=@GVR
<^fmq$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-Ta$l$;No?+>%q>78m/.
;cH%\<.->-$4R>;67sBuD]in2G\(D.@<6L(B5VQtDKKq/$>jL%ARnAMA8-'q@rt"XF(o9):MVXI
3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2.6T:+0F\A$F`(])Gs*c&-[K]RFC.sj@:rpp%14LqF`(\<
4ZX]i+=eQg+=\L>%16N,/g*+_$=Z.Z+>u,9+:SZ,%13OO:-pQUDJpY7Bm=3"+CT>4BkM=#ASuU2
+CT.u+ED%(F`(_uDKI"?@<,psFD,6,ATJ:fD/"6+A4^ZLBl[cpF?sthBkM<ZCG@t51a"h%0F\@;
-r"8pBQ%EIEbBN3ASuU2.4ID4+>=63Ap&!$CO&&q+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=
0H_hf>n%,h-n$KQF_kkC.4H]/3Zoe[Dg,Z/Gpa%..1HUn$;No?+Dkh;ARlolF)u&.DJ`s&FE8QQ
Ap&!$.3N>G+E_a:A0>?"FD)e5De!3lCj@.3DIal&Ci<ckCi"A+$>jL%ARnAMA8-'q@rt"XF(o9)
7<3EeE\KX;1a"h%0F\A$F`(\P/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn
$;No?+EV:.Eb-A%Eb-A1Bm=3"+CT>4BkM=#ASuU2+C\nl@<HX&+=LiEDIY+<DIIBn%15is/g+kL
+C]82BHV,0@ps1iGp$O5A0>N$Ddm-kCj@.3F)u&.DIm?$FD,B0+DGm>Defdh:-pQUBl5%c+C]J8
+EM@;E,^(FDIIBn+E_a:+CT=6Amo^&@<3P`:IH=>F!+t2DI[6uDIm>f$>jL%ARnAMA8-'q@rt"X
F(o9)7<3EeE\T^<1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%16]iDIYg^+=DJRF`^thG@>,k
-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:Ng;iEbT&q8T&'QEb/a&6$%*]B5TFe3]%s?+>=63
:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlEE9kAE[De).SB6A'&DKKqK4Y@j2
%16]iDIYg^+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUB5DKqF!,:;
DejD:AoD]4GAhM4+Eh10F_,V:Bl5&&@<6!&Ci<flCh4^u$;No?+C]U=A7]@]F_l.BCi=6-+DG^9
FCfN8+Dbt+@;KKtAoD]4FD,B0+EV19F:AQd$;No?+ED%8F`MA@+Cf>1Eb/a&+ED%7F_l./$>"6#
B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0OI+36$$m]CLoLd3F=-C$>"6#0eje`Ci<d(+=D#?
G\(DWDIdI%ARfgJF)u&.DGP%%?U6tDF)>i2AN;b2?RH9iATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJ
F)u&.DGP%&?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Z*RBARnAMA8-'q@rt"XF(o9):MV[l
5s[eXD/X3$3B9*,-OgCl$;No?+Co&*ARfg)D/"6+A0>T(A8-'q@rri%F)u&.DJ`s&F<GI0D.Oi4
F(GdfDImi2B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5U.YEc5tP?U6tDF)>i2AN;b2?RH9iDImi2
B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5U.YEc5tQ?U6tDF)>i2AN;b2?RH9i%15is/g,(UATDg*
A7Zm#Bm=3"+CT>4BkM=#ASuU2%16Ze+D5M/@WNY>:Ng;iEbT&q8T&'QEb/a&6$%*]B5TG25s[eX
D/X3$3B9*,-OgDoEZd(k+D5M/@WNY>:Ng;iEbT&q8T&'QEb/a&6$%*]B5TG25s[eXD/X3$3B9*,
-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y=1n@WPIbDeioPDdtIT:-pQ_B5DKqF&QpoCLonP
@k]SZF=f'e-td@7@WNt@A8bt#D.RU,+D,Y&B5M3tF<G[:F*'#W%15is/e&._67sB[ATMs)A0>_t
FCfK,@;I')@q0Y%F!,17+DPh*/oY?5/g*`'F*2M7+DGp?GAhM;F"Rn/:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX#YGqq2c$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G0
3Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$>jL%ARo4j
F(o9)D.RU,4ZX]A+?CW!%15is/g*_.BOQ'q+CQC0Bm=3"+D5M/@UX'q@;]TuCi<flC`m/-F(o9)
D.RU,/g+/8F^]*&Gq:([BPDN1Bla^j:-pQUE,TZ8+DtV)AKYJrDeW]m+C]J8+EV:.Eb-A%Eb-A+
Df9//Eb/[#Df0V=AoD]4F*1u++CT>4BkM=#ASuU2/e&/*@;TRs4Y@j=3[],_+CT;%+D5V,DJ()6
D]iM#+D5M/@UX(o-OgD2DIIBnF"'75+?V#]Cgh3lATMs-DIjr'Ci<ckCaTZ!.1HUn$=e!lAp&0/
DJ)*n+>Y-$+>=63:-pQU@;KauG9Ca:G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#ZF(9--ASbq!F$2,u
4==WQF'iuuDfBE.B4#@o?ZU-mF`(Q1Deio3%14M)@rH<tCh7[/.6T^7F(9--ASbq!Et&I*%13OO
:-pQUD/"6+A0><%F(o9)D.RU,+EVX<B4kdrF!,%7Ec5t-$>sEq+D5M/@WNY>D/"6+A79P#BkM=#
ASuTs5s[eXD/X3$3B9*,-OgCl$;No?+E)F7EcPl)AKZ)'B-:W!Ci=N=+Dkh;ARlolF)u&.DJ`s&
FE7luATAo+Ci<d(+=CZ;DJ"$4Bl7Qj5s[eXD/X3$3B9*,-OgCl$4R>;67sB4HW3F4<$5+>6UO:@
;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/
DeioE3B:GZEc=roDeio<0MXqe.VEd@;f-GgAM>e\F=f'e-tdR>.3N,@ART[l+D#D/FEo!AEc6)>
F"Rn/:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<VdL0e"5eATMr9A8,OqBl@ltEd8cUFCfN8
C2[W:0I\,UG\M5@Et&IO67sB'+<WEg+AtWo6s!8X<(.pKF`\a:Bk)7!Df0!(Gp%$EASs+0$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPP(@<jUa%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$;No?+E)41DBNA*A0>T(F*2M7+AtWo6s!8X<(.6'
ATAo3A0>u)Bk)6->9G^EDe't5-RT?1ATAo(E-#T4+=C&U5t"dP8Q8,+%13OO:-pQU@rc-hFCcS+
D/aTB+D5_5F`7csATAo+Ec<-`-YII<F`;5@ChtdQ%13OO:-pQU@rc-hFCcS+D/aTB+D5_5F`8HT
+EV:2F!,(5Ebuq;@q0Y%F!,"9EbTE(+CoV3E$014F*)>@ATJu4AftZ%E--@JB6%p5E,uHqATAo+
Ec<-KB6%p5E,Kf7Cb[;!-RT?1%15is/g,"RCijB1Ch4`,F_kl8+EVO<ATD4$ARl5WATAo+Ec<-K
B6%p5E,Kf7CbdA"-RUu'-S/[e/3IW!0F\?u$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GZEc>i/
F@'DWBk&hO:-pQ_B6%s-Bll[MF(o,<0d(Qi/KeM2F(o,,FCfN8+D,P4+DkP$DBN\4A8Gt%ATD4$
AKZ/-Eag.>B6%s-BlkdV%15is/e&._67sC(ATD6gFD5SQ+CT>4F_t]2+=LuCA8Gt%ATD4$ALS`E
@;]Tu-u*[2.3N>G+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(hg0JP>$@rsCb%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdS
C2[X)ATMs)EZf+8A8Gt%ATD4$AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5
@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6
+<W%?C2[X!Blmp,@<?'.%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b
+B)6*;H/&r%13OO0d'[C1E^UH+=ANG$>"6#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5$>"6#F(KH.
De*ZuFCfK$FCcRB@lc8bASlB6%13OO:-pQUB4YslEaa'$+DbJ.AU#>0DfQt/Cht5,Ec6)>F!,C=
+E1b2BHSlL@3B'#F`(]&ATA4e4*rS(0d(ONDg-//F)rI:Ec>i/F='0oI4cXTEc<BR%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0P
Ddd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>CF*)/8A2#\d/e&._
67r]S:-pQU<+oue+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8
+EM%5BlJ08/e&._67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(
@q?csF<D]B@:O(o+EV:.%15is/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S
:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<B^B.u4Q$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>Gim@<jUb+E_X6@<?'k+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+
-OgCl$9g.jDe't<FCfN8C2[W:0IIuI+>Y-YA0<6I%13OO:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJ
ATJ:f6;LBN5u^WS0KhH>0F\@U:JXYM<)64C4ZX]?%15Et:J=GR;cGn@+?qJ$0eb:+1(=RW:JXY`
5se764ZX]M/g*"o0f'pt+>OB5%15[%<'aJZ9e\^k+>F<48PW5a5se764ZX]M/g*"o1F+\/0F\?u
$:[]b5u^NL;cGn@+?)533B83.+?qJ$1GCL-1,B@H%15Hn5uLBJ;cGn@+=B`'@;R-2BOQ!*8K_GY
+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<%13OO;cugo5sd^q+>Y-!2]s@gF#kEk+EqB>@<,p%F*VV3
DesJ;@;]TuFD,*)+DGm>Anc-o-OgCl$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;
/3Hj69iODF%13OO:-pQUF*)>@AKYf-@ps1b+EqaEA9/l-Afu&5ATMF#F:AR*1E\_$0I\@s%16f]
/g)BVCgTIo6$$m]CLoLd3F<nC/i4\]D_;J++<Wj%HRD*F6$$m]CLoLd3@>qgF`\aDCgTIo6$$m]
CLoLd3F<nC/i4"EAScF!BkAt?,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_F(K&t/g+\C
/e&.1+>=o\%16ZaA1e;u.1HUn$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)F>,((-SZ`,
+>G!667sC&ATMr9F(96)E-*H:$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4CiaH3CLo1I
4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2AM>Jn+?MV3
8PW5N<)64B+A#=-<'`iE74/NO%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o@:O=r
0IJq;0fpas/g)o*-OgDH0RGW!E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1Bl7Q+
@Wcc8De!:"E-WRIE+*6f/g*_.@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,OqBl@ltEd8dG
E+Nnr$>aWhA5d>`CLqU!F*'-367sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.@;Ka&@rH1"
ARfgrDf-\9Afr47@VTIaFE8QIBl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#gF!)TI
ATMr9+EM%5BlJ/:+Dbb-AKWC;Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq:-pQU
Bl8!+A7Zm%FD,6++EV19F<D]I@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]IDJj0+
B+52C67sBsDe!3lAKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$
Dg-(O%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(
Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2.:W?0K'@I
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCcS,DfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4.$4R>+0RI_K+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,@VEb'56De:,8
@<-(#F`S[IH#R>9%16Q_Deq^=:JEN+3Zp*c$=[plCdD#r9eedl+>F<4@W-1$9M&/^4ZX]M/g)l&
0I&=^$=[plCfE\e9LV**+?qJ$2'=V0+=&'b%13OOBl8#Y<)64B4ZX]?%16feFAtOm9LV**+?qJ$
2'=\#0eb9j$4R>SCi<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/%13OO@q]:k9M&/^4ZX]58K_GY
+EqL-F<F-t@;R,rARf.kF(HIc+CoC5GA(E,+A!\dD^Pu$%170%D,`ef4ZX]A+?)5%,Tq.h+=A:U
AKYE%AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1)$4R>ODg52[<CTG@3Zoh56;LBN9M&/^.4cl0
7SHTD<(ok^<%0@\;cugo5sc"f%15is/g,4WDfTD3Ci<flCh4`5DfTB0+DGF1E,oN2ASuT!$7I\Q
3Zp+*-RT?1BkAt?,Aq=)5s[eXD/X3$3B9*,+DEGb+CoCC%144#4tq=25s[eXD/X3$3B9)I+E2IF
+Du"&5s[eXD/X3$3B9*,+DEGb%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+E-67FDJUG0/i4"E
AScF!BkAt?A8a(0$6UHF+<V+#ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?0RGMsE-67F-Za-C
CLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2
+?^i&+AP6U+EV19F<GX7EbTK7-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQE$-N;Df9H5D/X3$
0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NBDKKr:Deio=-T`G4
3[\WZF?rl%9e[](DKJiD6;0fq%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo
+?MV3F)>i2AMI.qF*')YF)>i2AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".$9g.j1a$a[F<DrP
D/X3$0hl(dEc3WZ4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\d
D]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO:-pQUCh7$uAKYMt
@ruF'DIIR2+E)41DJX6"A7Th"E)UUlCLo1R:-pQ_Ci<`mA9Da.;f-GgAM>e\F=f'eA9Da.+EM%5
BlJ/:Eb0'*@:X(iB-;84Deio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dE
IS*C(<(0_b06CcHFD>`)0JFj`$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/cuH0Js:H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq9#F`:l"FCeu*AoD]48g$)G0K1+q
AS!nFEccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I
+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$
+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$
FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?
+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%159Q
HZ*F;-Zip@FD>`)0JFjs>9G^EDe't<-OgCl$;No?+EVaHDBNk0Afu20D.Rd1@;Tt)%159QHXq):
ATT%B;FOPN8PVQA741/N%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>
FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN
2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>3
0I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!
F*',G$4R>;67sBkF_u(?@s)g4ASuT4@;]TuEb0'*@:TfSA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm
3\W!*3]\Bj0fga+HTG\L%13OO:-pQUFEMVA+E)-?FD5T'F*(i-E-!.1DIal#F_u(NEb0'*@:TfS
4tq=oE-#T4+=C&U<'a)N5t=?k4#%0OA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+
HTG\L%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:G_Ddd0uATMrI0JR*P@ruF'DIIR2:-pQ_Ci<`m
FCfN80JG4lBk)7!Df0!(Gp%2\/KekJ@:UK8GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTf@<jU^+=Lr=De(:>Bl8$(Eb8`iAKYf-
@ps1b+CSekARlp*D]iLtF(HJ'@<?0*%15is/g)8Z+<VdL+<W(IDe*s$F*(u6.3NYBEHPu9ALD&"
%15is/g)l'DJs\R1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is/g)l'DJs\R1E\)ZDf^#AAT0(@
Eb0*+G%G28+=M>CF*&iRA7]RgFCeu*/Kf+GAKYGnCi=M,$;No?+>G`gF`&rm+D,2,@q]RoB-8U%
ATMr]Bk)7!Df0!(GsldlE%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l-C3=DL0Hat=
FCSuuDJ((?8oJ6=Dfp)1APcfWBLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/
ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>;67sBQ:IH=HDfp)1AKZ28Eb'56/KenAEbAs)+E1b2BHUi"@ruF'DIIR"ATJ:f
:-pQU:LdmCF(oQ1@;Kb*+ED%1@;BEsFD,B0+CoV3E$07@+EVX4@r!2sBOPdkATJu.DBMPI6k'Ju
67sBE0RIYFCLnV\De)dbF`Lu':gnHZ7!3?c4ZX]6C2dU'BHS[O8l%iS78m/5.4ci"C2[X%@<?08
Bkh]:%13OO:-pQUAn?'oBHVD.F*&O8Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22A0><%+CQB%$;No?
+CoV3E$043EbTK7F!,17+EV:.+=LuCA9;C(F=A>CAThX$DfBQ)DKI"3Bk)7!Df0!(Gmt*E0RI_K
+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7Bk(+EM(%F=044+>b3RATT%B
<+U,m6tp.QBl@ltEd:&qD/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%14J'@j#i'@<<k[3Zp7%
B4Z0--VA;f;f?f!@qAJFFD+'bD/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%159QHSZd_A0<77
De*s$F*&c=$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#_c
%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-
+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK
@:UL&ATMr9A9Da.+EM%5BlJ/:%14L30HiJ30JFpu3]\B;3[l1NATMr]Bk)7!Df0!(GsldlE"*.a
De!p1Eb0-1+EVI>Ci<fj5s[eYEaa$&3B9*,%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/
AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!CLeP8FCfN8C2[W:0ddD;%15is/g,7LAKYT'
Ci"$6Bl7Q+Bl8!'Ecc@FD..=-+EM77B5D-%Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfREEb'56GA2/4
Dfp.EA7]glEbTK7Bl@m1+:SZV4ZX]tF(K594s2O%0d&7pDJs*2E$-MU%16#s3Zq?D,CUa`4>83,
IQATu/g<"m;[j(FEZd%Y3$<0_F<DuY/g<"m;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$;^ii9/g`27
+F?-n0d'C($4R>;67sBtATDEp+DG^98l%htF)Q2A@q?)V-n$bm3\W!*3]\B;3[l1DDe)dbF`Lu'
:gnHZ7!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("@<?''@;Ka&
@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is/g+SCAKYi(
F)u&5B-:W#A0>_tDL!@5D.73lDfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e;u0d'[C
0Hb"EDdmc74s58++CoA++=ANG$4R>;67sBU:K0b*:.\/V3ZqsECh7^"+EV:.+EqaEA0<:BATMrB
+DGp?@rH3qF!,17+EhI-+=L3#F*'fa@ruF'DIIR27!3?c.1HVZ67sBhDIal+ART+j+EVNED..3k
+D,%rCisc0F!,17+EV:.+A>6l+>#/fFD,6+ALDOA@3A0<6m->TCLmq^:-pQU@Wc<+FD,*)+E(b"
F`MOGGA(Q*+EqaEA9/l;Bln#2FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn%15is/g+Y?
@<6L$F!+n1E+NHu+DG^9A8,XfATD@"F<G+.@ruF'DIIR"ATJu4DBO%7AKXT@6m-GWFD*99$;No?
+A$GnFD,B0+Co1rFD5Z2@<-W9.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9ATD64+A$Gn%15is/g)Qa
ATMs.De(XQ+DGp?BlbD*+Du+?DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+G%G_;FD,4p$;No?+C]J+
-Z^DPEbT0!ATBCG=(l/_+A!r(AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k+EM[GAISuA67sC&BPDN1
@psFi+DGm>Eb031ATMF#FCeu*Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9A8,OqBl@ltEbT*+/e&._
67sBUDg!6Y1FsY(0JP9k$;No?+>G!C+Co&"+=D8BF*&c=$4R>;67sC"@:O(`+CT.u+DkP&AKVEh
ATAo4@:O(`+=D8BF*)/8A2#_c%16Ze+DkP&AKW?J%13OO:-pQUF(fK9+Cf>4DKKq/$>"6#F(fK9
E+*g/+Co1s+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s]U5@<6*B3B:FU$?1-0:18!N<,$2\F*(i-E-"?SF(o,<0MXqe.WBNP:18!N<,$2\F*(i-
E-"?SF(o,<0HbHh/KeM2F(o,,G%#3$A0<:>F`]&TDIIBn+EV=7ATMs%D/aP=FCfN8F"Rn/:-pQB
$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3N%AC2dU'BHVar:IJ/N;cFlMBl[cpFDl2F+D>2)
+C\nnDBO"3F=n"0:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(F?C3=>H1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g,@L+Dtb%A0>;'@rH6sBkMR/ARloo
Bl[cpFDl2F+:SZ0/g)QJ+>#VsC2dU'BIP&OIS*C(<(0_b-OgCl$4R>PDe!TlF)rIGD/a<0@p_Mf
6"48DBk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r
%13OO:-pQU@rc-hFCcS4ATo8=ATMr9A8,OqBl@ltEd8c:$=n6r@;TR=3ZoelATMs.De(OL/1<5.
5;=oBHQkL]Bk2+(D-p^dDe*3&-OgDnFDtZ1BK\C!.!0NH@<6*;?X[\fA7$HoE+*j%+=DV1:IJ/N
;cG+n/7`j?@;TQu%159QHZ!D=A0>E)DIIBn4(NGP@<?/l$4R>+0RI_K+CoS3@;TQb$4R>;67sC%
FDl22+EMI<AKZ28Eb'56/Kf1WBl7Q+8ge[&H6@$B@ps1b+CT=6DdmHm@rri7Dfp)1AISu10RG0n
-QmANF<Du;+F>_i+>GPm4>%a$.3NME?[?'%0H_K567sBuDfor=%159QHRF+e+E2IF+=LM<HS0ai
0ea_4/g)Af+Du"&H=%dL+<XEG/g+S5G%G]'Et&I?0RG0n-QmANF<Du;+F>_i+>GPm4>%a$.3NME
?[?'%1*@]767sBjDf0<4DI[d&Df0V*$9g.j-[I-_E-67F-s[sB/q+ot0H`J1+<r<XDJW[+?Q_-I
+AP6U+Eh=:@WMtc%15is/g+.n6QfoJFCcS'DIal3Bl.E(:1\-U+@1$bF*)G@DJ()5FCfE1ARlp%
DBO%7AKYi.Df-!kD/X?1F*(u44ZX^'Dg,f(?X[\fA7$H63Arl?2]sk1+>P&s2BX\+0F\?u$;No?
+EM+9+EqaEA0>u.D.Rd1@;Tt)+EVNEAncL$A0?&(Cis:u$?BW!>9G;6@j#Z2F!j+3+>=pF0f1"c
ATT&C/g+\BC`k)Q%16upF$2Q,-p/n'4#))"FE8lVD/X?1F*(u4.3L#n.=E=VFE7lu4tq=;+C?i[
+E2IF+Du:B%13OO:-pQUA8`T4Bl.F&FCB$*F!,=.FCStn$7Bk(+Du:B-TsL50Ha^W1a$FBF<Gua
+CoA++=ANG$>j^"DKBo2E$.:d/3>S5DKKq/$4R>;67sC%ATT&)Df0<4DI[d&Df0V=CghC,E-67F
FDi:6Bm=3"+Eh10F_)!hEap4r+=D2>+Du:B-TsL50Ha^W1a$FBF<Gua+>=om+>P'MDJUFC-OgDX
67sC&Bl.F&+Ceht+C\n)G%#3$A0>K,FEMV8+Cno&ATJ:fDdm-l@:sLrAN`'sDJs`2A7&b[De*2t
1,(FA+>Fuo0H`%l0H`&%0H_JI$>ss,4ZX]64=Dn14#))"FE8lR/34n%HTEE60mde[F"&AQ@UX+^
B5_[!.3L#n.=E=VFE7lu4tq=;+C?i[+E2IF+Du:B%15is/g,7MD.Rd1@;Tt)+Dl7BF<GF/FCStn
$7ItjHZ!qH.3L3'+=MRt,Wd`-DKKqK+<r'b+Dl%8DKBo2E%F%g@UX+^B5_[!%13OO:-pQUEb0?$
Bl5&8Bl.F&FCB$*F!,17+CoV3E,uHq4tq=oE-#T4+=C&U<'a)N5t=?k4#%0O4tq=oAj&0tD..3k
+=ANG$9g.j1E^UH+=ANG$4R>;67sC%ARfXrA0>c$G9D!=F*&O8Bk)7!Df0!(Gmt*kFDbN(AMQD0
+=D8BF*)/8A2#A^-o!JA0et2),!'7KA8ZO,?X[\fA7$]3%16WfE+*j%1-IZ@.!0NH@<6*;?X[\f
A7$HoE+*j%+=DV1:IJ/N;cG+n/7`j?@;TR2+:SZA0RI\KG@Vh,FDbN(AMQ>XFDtZ1BJL#(4tq>%
A0>E)DIIBn1(=R"$;No?+Dbt)A0>E*D/^V9Aft]"EcZ=FA8,OqBl@ltEd8*$-n$bm3\W!*3]\B;
3[l1u3b2h3$8EZ-+Cf>"F`MM6DKI!K5s[eG@<6-m3B9)I%13OO:-pQU@;Ka&FD5T'F*(i-E-!.6
Ec5e;@W-@%+Co1rFD5Z2@<-'nF!,=BF*&OA@<?!m%172u1-IZ@B4Z0nCi"37?XHN#?XHE$6uQOL
+>=634tq>%A0>E)DIIBn+BosE+E(d5-RT?1FE90"3Zr'HFCB!%FE:er9hSi#8l%in@VR#>%172u
0d&&/+EVZ[%13OO:-pQUA7]h(Ec64GFCfN8+Co1rFD5Z2@<-'nEt&I?0RGSuEb/lo+CoS3@;TQu
>9G^EDe't<-OgDH0RGSuEb/lo+CoS3@;TR2+:SZ4+Bot/D/sQ5F<G+9E+*j%+:SZ4+Bot/D/sQ5
F<G+9E+*j%1(=R"$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?ZK_!FC[^HF(o,<0ht%f.WT*AFC[^H
F(o,<0d(Qi/KeM2F(o,,-urm?FCZgCFCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU
+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?+<Vd^.3L$2:IJ/N;cG1g
AoDKrATAo'Df00$B6A6+A.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+B)ijFCf;uATAnK0JG0i$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lr+E_X6@<?'k+D,P4+A+RG9PJBe
GRY!T67sB83,N)L1,C%qE+EC!ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,Oq
Bl@ltEbT*+-OgDX67sB83,N)L1,^7dA8--.AoD]4F*VhKASlK2GA2/4+B;0(+Eh[>F_t]2%15is
/g)l.D..]G0Hae7C3=T>ARlp*D]iP1ART[l+EV19F<G+.@ruF'DIIR"ATJu.DE8nTE+*j%+=DV1
:IJ/N;cG+R$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO/M8.nIS*C(
<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OgCl$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]5
5s[eG@<6-m3B9)I+BosuDe3rtF(HIV-UC$a@UX=l@lZP0-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%16W[@rsjp+=D8B
F*)/8A2#\b%172rAp?I"+=D8BF*)/8A1%fn%15is/g,(OASrW!+EV19F<G+.@ruF'DIIR2+CT.u
+E1b!CER>5/e&/!EZf:2+Co1rF:ARgEZf=0@r#TtA8,Oq%13OO:-pQUDJs_ABl8!'Ec`FFDf'&.
DIn!&EZeh&AoD^$+EM+*DBN\:DJLA=DfT@t$;No?+DG_8D]j.8AKZ)+F*&O8Bk)7!Df0!(GqKO5
-uNU?DIIBn4ZX]5@4*TK,!$iWBk2+(D-p^dDe*2t0I\,-3Zp4$3Zoe*+=\LZ-OgDoEZfI@E,9H&
+E2IF+Dtb7DIIBn%16Ze@<6!&DIn$0@;TQb$>"6#FDYu5Ddso&ATT&4ATr$#D.O.`ATD4#AKYl%
GA^i+AIStU$;No?+ED%7FDl22+EV:.+E2@4G%kl;F!+q#@r$4++>"^MF<G+4ATJu3Dfd+3Df0Z*
Bl4@e:-pQUFD,5.DIn$0@;TQb$>"6#Eb0<6A0>Ds@rr.eDImi2B4Z0-DIn$0@;TQb$>"6#1E^UH
+=ANG$4R>;67sBjBOt[h+ED%7FDl22F!,(8Df$V*F<GC2@<6N5FE_XGG&M2>D.Rbt$;No?+E_a>
DJ()7DJ=*5AKYMtEb/a&DfU+G@;]TuA8,OqBl@ltEd8dF@;TRs%13OO:-pQUG&M2>D.Oi(F!,F1
Ec`FBAfuOp:IJ/N;cF25:-pQUG&M1O4ZX]5@lbtH$4R>;67sB\:.$.C@<?1(+CT;%+Du+>+CT)1
@<lo:E,oN2ASuT!$;No?+Eh[>1-IZ@-X9nqDIIT?11kS_>\J%mAR&tgBPoRZ0JHaRASlB6%13OO
:-pQU:.\/V+EVg=@;?utDfQt:Bl8'<+CT.u+Eh[>F_t\4@rH6sBkIk^DIn$&Bk)6J3ZrN`Ap>jL
,!$iWBk2+(D-p^dDe*2t0F\A#EZf72G@Vh6ATq[!@rsd\C2dU'BHS[O8l%iS78m/=-RgTaATq[!
@rr.eDIn$'Eb&loF?MZ-FDti:/0H,t+Co1sDKTf'@;9^k?Q_$3$4R>;67sB\:.$.C@<?1(%15is
/g+_G+Dtb7A0>c$G@bf4@;TR;G&M1P/14\EASlBk-S0.HG@bf4@;TQb$4R>;67sC(DesQ5AKW]:
$>"6#De'u.ATq[!@rr.eATAo4@:O(`+Dtb7A8,Oq%16Ze+EVI>Ci<f+E-67F-Z3L>DIIBn-OgDo
EZfC6F*(q8DIn$&Bk)5o$>sEq+D58-+Dtb7DIIBn%16Ze+>Y-YA0<6I%13OO:-pQUG&M2>D.OhF
+B;0(+E1b2BQFUi:-pQUATAo3A0>c$G@bf*Bk)5o$;No?+D#R9E+*6lA0>c$G@bf*Bk)5o$;No?
+D#R9FDYu5Ddso/F`\`RDIn$0@;TR'%15is/g+_G+ED%7FCZM3ATq^+A8,Oq%15is/g,%CEZf"+
F<GI4GA^i+AISuA67sBlEZd.\De't<-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?Z]k#FE;PH
@ST6B.XQVDIXN>\/M/)eATMr9.!pDBIXNXfF*)P6/db??/db??/g+,,BlbD=ATMr9/hSb//g+bE
Ec#6,FCeu*FCf]=$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z:-pQUF(KG9C3=E0+Dbt+@;KKt
DIIBn+EVNEFCfN8+EVmJAI;1!/g)8Z-SIbO6$.-UF(dQo3A3Za6$$m]CLoLd3@>qeF<DrKATr6-
F*&c::-pQ?:-pQU+<WBf+D,>.F*&OHATMr9@<6L4D/aT2Df,nW67sB'+>PAgF(Jj"DIal3ATMr9
@<6L4D/aT2Df,nW67sB'+<VdL+<VdL+>,9!/db??/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
$;No?+CfG'@<?'k3Zrcu7"0Ok:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=CoBA9;C(
FCfJ?$49Np/g,7IF*&O=DBNG*ARTU%@UX=h+DGF1FD,B0+D,FuB-:o0+E2@4F(K62$;No?+A,Et
6VKp7;GTqmBkhQs?OBOp/g+Y?ARTU%-RT6.:-pQUFCfN8+DG^9FCf<.DfT9,Gp$jEDJLA2De!3l
AKWQIDJsV>@;Ka&8l%h^:-pQUFCfN8F!+t$DBND"+E1n4AoD^,ARlotDBN\:DJLA2De!3lATJu8
Df'&.D09oA+EDUB+DG^9@UX=h$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&
3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL3&ATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5FC])qF?MZ--Zip@FD>`)0JFj]$47,8
67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIV
FDYu5De!-?5s]U5@<6*B3B:F                                                  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1R,1,C%.+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>GPm
0fL401*AD-+?:Q%1E\D.+>Gl!0f^@61a"M1+>Y\o0ea_*2'=V0+>bqu0f1"10d&2-+>kkr0f:(0
1E\G-+>P_q1,L+03?U%3+>Gl!3$9q7@W$!K@<6-m0JR$FF(o,,-t7(1.3N).@r$4++DtV)AKYf'
F*&OHATMs7@W$!\D/X3$0JFnaDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7@rH4'C/\tfCLo1RFCfN8
+=L`<D/a5=+DtV)AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4
F)>i2AKZ)+F*)J5Eb/[$ATVL)FC])qFD5Z2@<-'nF(96%@<?(%+D#D/FEo!$:IH=IATMr9A8,Oq
Bl@ltEbT*+A7]RD@<6-m0JG4j@<6-m+Eh10Bk/>7A7]R++EV19FE:u(F*)G@H$!V=FC])qFD5Z2
@<-'nF(Aj'FE2;FF!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?rBk1.ZDeio<0IUIGA18XBD/X3$+EV19
FC]9*;f-GgAM>edA8Z34+EMC<CLnW1ATMs7A8lU$F@'DWBk&hO@UX=l@j!11E-#T4.3NS<Ea`fr
FCfJ8F(KGH@q]:gB4W3-ATMs7ARn_VDeio<0QV)LCLnW1ATMs7+E(j7-tQp<+=M,9D.P8&@r,Rp
F'U>=AU&;G+EV%$Ch4`#A8-."DJ*TuDdmcS@<6-m0JG4j@<6-m+=Ll=Ddmc:+EV19FE;)2Ddmcd
D/X3$6$%*]B5TCW0PPE8Bl[cpF<G"5F(o9)D.RU,+E(j7B5DKq@;I'/DK0f;FCeu*DIIBn+Dbb5
F<GI>F`)85Ci<d(;f-GgAOLHH0JFnfCi<d(.3N/>@s)X"DKI"5Ea`TtASuT4FCfN8B6%riD/X3$
0JFnfEc<HM@rc-hFCcS+D/aTB+D5_5F`;D7Ec>i/F@'DWBk&hO@UX=l@j#l)F*&O:DfQt;@;0U%
C2[X!Blmp,@<?''G%G]'+=LlCE,961.;Wp2A5d>`CLqU!F*'*PDdd0!@3BW.@;Ka&@rH1"ARfgr
Df-\9Afu#$C1UmsF!,17FDi9MFCfN8C2[W:0I^gV@:W;RDeip+ATMrJCi<`m+CQC6D..6s+Cf>+
Ch7*uBl@l3De:,1@VTIaFE8R=DKKe>.!0$AFD>`)0JFqlDdd0eF_u(rD/X3$0JI$[D/^V=@rc:&
F<GU8Ci<`mBl7Q+F)>i2AKZ)+F*)J>Ddd0uATMrI0JR*P@ruF'DIIR2Ci<`m+>J*`FCfN8+Co1r
FD5Z2@<-X4F`^AeD.Q[\D.Rd1@;Tt)6=FqL@k]TG@<6-m+Eh10Bk/>7E-67O+DtV)AKZ)/D.Rd1
@;Tt)+EV19FE;J6F*(qZ@<6-m0JR$FF(o,,-urm?FCZgCFCfN8F*(u7FE;PH@WZ1&F<DuYIT1cE
.3N\RF^b                                                                  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A>+1c[E91,'h++>PW)3Ar!71a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
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
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Y\o9jr;i1,(FB+>Gi:0ek^F0a^NK
6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&
+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU
0f:(GF_i0U0JPF-0KD0O2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=$0H_K+@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO
1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[
ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW4
1bh$H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"
6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-
0ek^C2``]L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
3$9>3@<?'A+>PYo8p+qm1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe
0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm
+>PW*2'=V23]&NO1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+?),"+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!
8p+qm1,(F?+>G`72).-H1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi
+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+
B-8r`0f:(.0fh$L3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP
0JPF-0f;!G1cdKN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*
2'=V33\iWT1c>[J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*
2'=V-3]&iX0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*
2'=V33]/]S0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*
2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?
+>>c91c[TO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-
3'&lT3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^
6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN
3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6
+AH9b+>PW*2BX_13]&cV0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13
+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C
0JPL/1,1gG0KLmG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA
+>G]62)%'I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh6
3\W?N2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA
+>PW32).-J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.5+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP
1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4
+AH9b+>PW*2]sh33\iBM1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*
2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR
1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$
+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU
0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b
1,(FA+>P`61,V*K0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL41
1HI?K3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7
+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K
3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I
@<*JG0JPL/1,1gI1-.0H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*
2]sk23\W<M0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/1,1gH
2**NI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0K'7F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1
@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg
2BY_&Gp"jr0fL403'&lU3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCKF`&<W
0JPL/1,(aD1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Y_p+@KX[ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB+>Gi:
1,(aH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's
3Zp."+@KX[ANCqh2BYV#DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqh2BYV#DBL\g0fU:21HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]t_$
DBL\g0fU:11-.6O3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*3$9n8
3]/cU0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU0f:(J@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR2$sZt
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[
ANCqm+@0se+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7l
A7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se
+>PW*3$9q13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q1
3\`NR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K1cdKM
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqg3?UV,EZd+k0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'2!
Gp"jr0fU:13BArS3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=Wi
D.7's3Zp.;+<X'\FCdKU1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q
9jr;i1,(FB+>PZ41c%0H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&
:3CD_ATBgS1*@]-@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P_q
9jr;i1,(FB+>P]51,1gF0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pht
9jr;i1,(FB+>Gf90KD0L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&
:3CD_ATBgS3$9>3@<?'A+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:
+AH9i+>PW*3$9q83\iNQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&
+AR&r@V'R@+>GSn+@KX[ANCqh2]th'Gp"jr0fU:13'&iS3\iGt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,g=M@<itN0JPO00f_9P0fh-G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A
+>Po!9jr;i1,(FB+>>f:2)[KQ2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1-$IO@<itN0JPO00fV3K0KLsL$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqi0Ha(u
Gp"jr0fU:13'&cK3\rMu:L\BVEcu#)7<3EeEcWun:-pQ_:L\BVEcu#)7<3EeEcW@E/M/)SF_;h5
DeC2$DIal1ATMg/DKBB1/e&-s$4R>;67tA`-o!.n@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8
EbBN3ASuT4-u*[205<?u1ark@:-pQU1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA+
+=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?
4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)
+CT/5+Du=<C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"DDfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,
BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.
+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=
F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"%15is/g)8q+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq
4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=
@ruF'DIIR2/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)
/KeS<@ruF'DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=
+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)
ATo8;Dfp/9DImlA%15is/g)o0+AH9b+>PW)2'=V13\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!
>\[\fA8,OqBl@ltEbT*+>]++pD..-r>\[\fDImp,@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi
%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'
F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`i
AKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!%15is/g*b^6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99
BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'm
F!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?
De3u4DJsV>E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-
1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7
A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q
%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@
+<Ve<Eaa$#+=D;B-OgD;%144#+D58-+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:
+E_3($?^6#@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J
+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ
+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(
FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8+Cei$AKYMtF)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9
+D#S6DfRl]FD,6+AKY].+CQC/Df021F*(i.A8,po+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9
FD,*)%15is/g)9IARfObEb/c(F(9--ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4
+:SYe$;No?4[(8N.3N5:GWHrV$4R=O$4R>;67tA`-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$
B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMpE+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-
AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAO
Eb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2
F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+
B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+E$-NG@;TR'4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg
+DtV)AM,)7$4R>;67tDb-oNLsAncKN+=LlDD..3kE@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8
E-,f*F!,(8Df$V7@;TRlBleA=@V'.iEb,[e:-pQU@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f
%13OO:-pQq4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn
+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6
C2[WkB4W25A92j$F=/1R:-pQU@s)m7+DtV)AIT"+P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:
Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(H
P_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;
ifo%*+<VfdP_(YE0K1[G0ek:;+<VdLifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*
+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifof>$6UH6%13OO+>P&^C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbX
JDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K
+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,
+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL
+<VdLifo$M0JGF>3AE6@1bg*qifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\e
P^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&
-QjO,67sC!CER5-EZf14F*)I4$4R=u+DPh*@:s-oI4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2B
Ec5tZ+Dbt)A8,po+A,Et+CoV3E$043EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)
E--.1$;No?+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2
@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8X
De(M9De*g-G%>`4E-![LAT089C3(a3$4R=b/hSb/+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"
ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41
DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"
$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r
@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]6
0fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<fl
C`m/-F(o9)D.RU,F!,RC+E_RAF`2A5A.8l@67sBpDIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlol
F)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB73?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&
BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F!(o!D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB
3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3
Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%F(o9)D.RU,Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.
DFJSdDfR37$4R>;67tDb-oi_!AncKN+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4
ARlnm$;No?+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'$;No?+D#G$/T55QDdmd!Ecu#)/S/sCDfTn.
$=\-lCh.:!A7TCqFE2))F`_>9DDEqA67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et
+Co2-FE2))F`_>9DBND2Bl%<4%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tD
C2[WlF_PZ&3B9*,4ZX]55s[eODe*="Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBMPI
6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^E
De(4C%13OO:-pQUB4Z0-8l%ht@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?
DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO-V@0&;cH%Q779^F+A,Et7nHZJ8Q$['
:IJ,W<Dl1Q;cH%Q779^F+A,Et;cH%Q78QBA6qL9!8l%iR<'a#C6r-0<8Q$[':II]E<('ML6qL9!
8l%i@6psgG6qL9!8l%iR6W-KP<(';U+A,Et79EMf6qL9(4ZX^,ATVC(Bl%<jBl\8;0F\?u$?^;u
@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2F(Jl)8l%iR<'a#C6qL9<8l%iF
8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_<_Yt)@WcC$A86$nFDl)6F(9-*
E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a6qL8c$;+)^<_Yt)F`:l"FCf3*
A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL8c$;+)^<_Yt)F`:l"FCf3*A92[3EarZk
F_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)A0=K?6rR&N7n#g;;EIKH6rR&N
7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1?O[>O$4R>OF_PZ&C2[WsC3)-b:-pQ_@WcC$A86$n
Bkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlouDe*QsF!,O6EbTK7F!)T>DBL':De*KpF:(c0/g+\=
Eb/a&DfU+U$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB
+<XEG/g,(AFCAm$+A,Et$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL:-pQU@r-()AKYE!
Gp%$EASrW$Bk)7!Df0!(Bk;>m:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0
A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)F^67rU?67sB'+>G!ZD'138F_PZ&C2[Ws
C3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c#g67rU?67sBh
F)uJ@ATKm>:-pQ?:-pQU:2_7dEcQ)=+Cf(r@r#drB.aNd67sBYAT;j,Eb0;7F*(i.A79Lh+A*bq
Ec5Q(Ch3rK67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP:sF`&lg
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O]:-pQU0emEcDD4!l@:Wn[A0>W*A8lR-Anc'm/no'A+DPh*E+*d(F"V0AF!,49A9Ds)
Eas$*Anbme@;@K0C3'_W67sB82.:HE0JXbkASl@/ARlp0Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*
FDi::De*KpF<G^DA7]d(@;KXhD@-_\De!p1Eb0-1+=CW,F(H^+@rGjn@<6K4FDYu5De!-?5s]U5
@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I$=e!gDKBB0F<DrF
C2[W1$49Np/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+
$?'j$4ZX^6/g+\=A0<Q5De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C$49Np/g+b;FCSu,
Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Esd#+E,9H&+D58-+FPjbB6%r6
-Xq44Ch.:!A1%_!De+$&EcYr5DEU$'/3Yb78l%iU9gf<q:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#
Ed8!a:II]E<(]qS8P2oX5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\
5u^B^?W0p2?V4*^DdmGg8l%iF8Q8;X6qL!L:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6qL!L:dJ&O
/151NA7oUu05>E9Bkh]B-OL2U67sBnASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--..
C1D'gF)to64ZX]I3[\Z\A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^_6
De*d(-OOU,A7fOlATL!q+=K?-+C?iP+DkP&AL9S`C1D'gF)to6$49Np/g,1G@:UKjCghC++D,>(
ATJu'@:O'[-u*7.@<6L$F!*"\/j:C?-Y-Y--Rh2>+ED%%A0rom+F?-n0d(4LA7fOlATJ1c:-pQU
@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2EbTK7Esa:8@j#i5@jaE#+>b3RATT%V3[\Z\A8lR-Anc'm
+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@4t.!mQj0d(OX@jsQ%+F?-n0d(OX@gWQ<67sC'E+EC!
AKYMtEb/a&DfU+GAnc'mEsbB.9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5+?V#(Bkh]:
$:[T\78l?1+=K?E:II]E<(]qS8P2oX5u^B(+=nil4s3<d9LVke0Ka)gA7T+j+<VdL+<Y9?EbTW,
+?M9(7S-9B;[P3@C2[X(FDl22A79R&Ap890FCcRV0mcA]9LVke0Ka)gA7TUfA79R&+<Y9?EbTW,
+?M?*7S-9B;[P3@C2[X"@;BFb@<<V7Ap890FCcRV1ODS_9LVke0Ka)gA9E!.Ch-sr+<Y9?EbTW,
+?ME,7S-9B;[P3@C2[X)Df9H5A79R&Ap890FCcRV21%ea9LVke0Ka)gA8c?r@<<V7+<Y9?EbTW,
+?MK.7S-9B;[P3@C2[X%Ec5Q(Ch4_3Ap890FCcRV2g\"c9LVke0Ka)gA8kstD0$gB+<Y9?EbTW,
+?MQ07S-9B;[P3@C2[X*F(KB%Df00$B4>:b+<Y9?EbTW,+?MT17S-9B;[NkQD/XQ=E-67F-Y%(3
D.RU,ARlouDe*QsF!,O6EbTK7F!,UEA79RkA1%_*D/XQ=E-67F8l%iF8Q8;X6qL!L:dJ&O$49Np
/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>mDe'u/Df6b&+>Y-YA1&`3$=e!aF`MM6DKI!K@UX=h
-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,&F_PZ&C2[X*DJ=2J0ht%f.UmO7Ch.:!A9Dd(
F<GWV/Kf7XBlmo/8l%htF`(o8+EV19FE8RHD]j+C@:s:lB-:`!Eb/a&DfTQ'F"Rn/:-pQB$;No?
+Eh=:@UX@mD)r+5:-pQB$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c
:IGX!:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'
DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*+
+EVNE@:NeYF)rIGBPDN1F(96)E-)Nr:-pQB$;No?+<Vd]+ED<A-Xq44Ch.:!A9Dd(F=/1R:-pQU
Ecl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67r]S:-pQU@<6L4D.RcL
%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX#YGqq,a
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>Gim@<jUb+E2@4E+*cu+EV19FE8R5A7T7^%15is/g)l.D..]G0Hb=WEbAr+
FCfN8+CSekARl5W%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G0
3Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$
4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+CT)#ASrW*
De+!.BlkJ.Bl[cpFDl2F%15^'6q9gJ8l%iT:.\D]5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs
8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGj$;+)^7nHZP:IJ2X8Q8MP<(K/5+DPk(FD,`,
E$.bK6q9gJ8l%iT:.\D]5u^B+-YdR1B5)H@C2[X*DJ=2G-OgCl$?pN)FCfQ*F*)Id3Zp7%3Zp*c
$>F*)+C\biEarHbC2[Wi+EV19FE9St+B)93<(1/&C2[Wi+D5_6+F,)?D_</RD/XQ=E-67FFCfN8
F!,L7FEMVA/g+_CA1e;u-ZjHUE+L/2@<?014Y@k%%16f]/g)Ps4!uC)+>#VsFCfN8F!,"3/e&.1
+EMC<F`_SFF<Dr+D]gDYFEDeIALo2OFCfN8F!*%WF(f!!AK`E1$>"$pAM+E!+<W%P@j#l)F*)IN
4Y@j3+D58-+FPkaATMs7%144#F)>i<FDuAE+=JEp,BRL<FE8l^-QjcfFEDeIALo2OFCfN8F!hD(
+<Y97EaNp"F*'#WFCfN8F!,"3/e&.1+<VeJD/XQ=E-67FAnc'm4Y@jr@<?0*/0K%VH#R=;/0H;n
-Qjr_-p',0FCfN8.3L/a-SB+JF!hD(+<VdL.!0Au:K(484#))(ATMrB+Eqj?FCeffC2[Wi+D,>(
AISth+D#G$/e&/!DIb@/$7QDk%15is/g+YBCi!ZmF<G"0A0?):Blmo/G%#E*Dfp+DFCfN8+EM[>
FCfM&$;No?+=JUYD/X3$-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YddFFE_bDDJ(=+
$7I9CD/X3$-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1F)>i2ATVL)FE8f=$7I92
@<6-m-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1@UX=l@ru:'FE8f=$7I9<@<-!l
-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1Cgh?sATVL)FE8f=$7I9CFE1r6F!j%A
:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoBA92j5ATMp7ATMs7-OgD2-Y%1>F(cp_8l%iF
8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFDe*?uF`V5<ATMs7-OgD2-ZF*;E+*cu-Tapr6q9gJ
8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1E,oN/@<,q$ATMs7-OgD2-ZF3KB4WGP8l%iF8Q8;X
6rcuR<)>k[81>[*EbTW,FCfN8F!)iFDe*g0EbAs*ATMs7-OgD2-Y7OEASu$+4%`::7nHZP:IJ2X
8Q8MP<(JG\GB.D>ATVL)FE8QPC2[WoG][M7F(oQ1FCfN8F!hD(%17/nDfp/@F`\`R@;Ka&F`(o8
+EV19FE8RKEbTW;ASrk)$4R>;67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE
+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>=-p
FDl2FC2[W<0b"J&ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`-$6pc?+>>E%/ibpM+>"^HATeLi%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*
+CJr&A1hh3Amc&T%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14
DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=e,9n<b/hen<3Ahp2
+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9
DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;
EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+
/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&
+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$
F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&
Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8
AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1
Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WD
BlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieS
EbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-
ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ%144#+B3#g
F!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SYa$#j^!
F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+
0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km
+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4
BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4
Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgn
$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).S
B6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$4."J$6Uf@
5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#
?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#
AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6
+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E
+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ
+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+F`S[8BOPdk
AKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q
+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6+<VdL+<Vd9
$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'
ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%
ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$
B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1D
AKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6
+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloq
DfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et
+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"
FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&
@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*
F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNE
F*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL
+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-
+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-
?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG
$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL
+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH
+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h
/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+
BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\LOATo8=ATMr9
F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LA
C2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<
B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E.
/ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0
ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0r
DIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9
%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht
+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2
?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc
?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWr
FD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloq
Ec5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(
@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9
D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1
+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(
Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm
@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<
?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG
/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-
/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL
:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH
+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1
DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJ
F`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)
E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]Tu
CghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB
/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1
DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC
+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL
-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FB
F<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOA
BHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,
@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#
+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"l
F`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$
+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&
+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6
FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohc
A7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7
Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$
AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhu
F*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,
+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).
AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLs
Bl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRt
ATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!
+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6
Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^h
A0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ
:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$
?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C
:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.
A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2
+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.
DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S
%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.
DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e
+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<
DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9
+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs
?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-
G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'
G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7Zlq
DfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^h
F!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2
.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=
$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO
,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`
CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/
@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.A
DBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p
/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1
Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=
@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!
Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*
A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>
DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!
A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`
De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56
%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7
ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:Lt
De(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn
$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,
F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS
?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,Rp
F(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"
FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'
1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dD
Df021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6
DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/
+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/
BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u
+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;
AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5
ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV
8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:
@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;
+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$
F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,
ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(
ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6
+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=
BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4
+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+
F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$
+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD
9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d
+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdL
A8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@
AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.
F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1
F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=
-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(n
DJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!P
ATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,
?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK
%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u
%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQ
G[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/
$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o
+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi
@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL
+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0
+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5
AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5
Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&
B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23
Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_
0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR
=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60
@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<
?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIB
AftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_
0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0
+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(
Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt
2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@
F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF
?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\
<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-g
C`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A
9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6
ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6
Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#
+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5
F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,Oq
Bl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;
F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;
AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7
BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE
@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,
+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX%144#
+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG
@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k
/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4
ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2
+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"
+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cq
FCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&
A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#Oj
E*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2
$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%
Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]4
8g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/
ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<j
B4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1i
F!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmt
GqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm
3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:
Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\
F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!
$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#
+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,Oq
Bl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'm
Et&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*
ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2
AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f
+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q
+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN
1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMu
C^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2q
D/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1
Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&
+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4
ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr
@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!o
DKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!
Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k
$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)
A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi
+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M
:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlol
AoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E
%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5
D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6
ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=
G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:D
BOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5
Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&
/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mP
ATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.
Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>
@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhu
A7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2
F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=
$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&i
FC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo
@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd
<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho
@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#
+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6
?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6
GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&
Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9
ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;
FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYet
EbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A
+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc
+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/
@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%
DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#
AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=
<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"
+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B
8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8
G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'
DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$
FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM
6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%
GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!
F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et
+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJ
Df[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*
A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr
@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S
:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+
@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;Afthr
De(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*
D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1
GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+
EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU
0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@
?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,
1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi
8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a
+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7
FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1
DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63(
$6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1
@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(
G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,
Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>
DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=
@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B
05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBn
F!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<
A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9$6Tcb+:SZkBleB7Ed;D<
A7TUg1,3EQDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru
+@KX`+E_X6@<?'0%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk
0K1L7%13OO+<W-V8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k
%144#+<Y97EZdss3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSn
DJ*BuBjkm%@;p0sDIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.
F*&O7Df'?*F<G[D+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE
3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&ls
E+NotBm:bBD]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6
Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO
,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;
+EM+(FD5Z2+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7
+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(t
FD5W*+=M,9D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?
ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@
+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V
?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3
Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9
/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc
$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5
Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*Nm
CiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu
8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jk
Bl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.
FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@
0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2
@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt
$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3
Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[
@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,
Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#
+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR
=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.
ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNS
G%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b5
1,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cq
FCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_t
DIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g
@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58
@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNE
A8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=
F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1
F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,
EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%
A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZmDe*<gF*'/p9L2!E8Q8AP4ZX]58l%ht-o3:p6=k4[+Ad)e
@ruEpATK4.$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ib'6=FY@EZbeu@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDk9L2!4:JFPP:/k.T3Zoe:ATMr9E,oAsFD55rF!,(5EZdtM6m+'(Eb0E.F(Jl)AoD]4
8g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\4ZX]?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[hDKKo;A9DC(
Bl@ku$<(kTFE_/6AKZ)5DesJ;@<,p%Ch[Zr+Dbt)A7]9oB6A*53ZrB[G@bf,F_i1EARTOrDK?q4
DfQtACghU'DJ();Dfp(C@rGmlDJ()&ASl@'F!+q7F<G".F)N13@;]^hEc6)A+EqL1DBO(CARlot
D/aN6E+O'+GqL3^87?[Q+F.mJ+D#_-EZfF:Dfd+IDfp)AASbs$Bl5&8BOr;uDf9_^+<X5uCMn'7
+A!qt+Dkh6F(oN)+CQC)ATo8=De3u4@;]Tu8K_JRF<GjIFWb+5AKYE&+EqC5Cb?h>$4R>ABPDN1
CggcqDfp/<Bl7L'+CQC1F_tT!EZf:4+<k9+F*&ODEa`I"Bk(^q+s:fE+D5h2A7]RkDIml3AoD]4
F`V87B-9fB6nTT)8LJ[m+DbUtEc,H!+EV:.+D>2(A0?))Grm-_AfuA;FWbd7CLnW*Gp$O+G%kGt
+EVNEBOtUmF<GjIFWbO8B4uB0@V$['E+*cuA0DBh.1HW)AT;j,Eb-@@B4YslEa`c;C2[W1%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[sATMr9AoD]48l%htF`V,7+Co%qBl7Km+D,P.A7]e&%160&;GKeY7lhbl
84c`&9L1uf;FOG_8Q%uU+@.,F<D>eK;BSb)+B;?/;BS@r7S-?D6m,)t6m+rp9LM<I;_ALd%16'J
BlbD5@:C@"AT;j,Eb0;7@3BH1D.7's+E(j78l%htAoDKrATDi7FDi:BF`&fS<+ohcDIn'7+EMX9
E$076F*)IGAoD]4FD,5.AU%p1FCf?"AKYo'+EV:.F(HJ+DerrqEcWiB$4R>6AfrL$ATMrc:IITb
Eb/a&DfTQ'F"&5JBleB;+CT/5+E_R4AS,XoARloU:IH=9Bl[cpFDl26ATJu(Df00$B6A6++EV:.
F(HJ)Bl[cpFDl26ATJu'AS,k$AKZ#9DJj0+B-;;0BlbD5@:Ci38T&TkEckl6Bl@m1+E)-?BQ&);
FDi:4D]j.8BlbD,@;[2sAKYT'F`(_4Bl5%AC2[W8E+EQ0/g*`'F*(i,C`mh5AKWC9De*Bs@s)X"
DKI<M@:WneDBO%>+D58-+=LuCA1hh3Ago>A$7QDk<+U,m8l%iCBl[cpFDl26ATM3mC2[Wi4ZYAA
3Zp*c$4R>;67s`eATMrc:IITbEb/a&DfTQ'F!,WX/Kf.HF*&OIF(KA7@rH6sBkMR/ARloU:IH=9
Bl[cpFDl26ATKI5$;No?%15is/g+,,BlbC>G%G]'+<Y0-ARfLs+<Yc>@<<V7Eb065Bl[cq+<X9P
6m*Ug@:C?iBl[cpFDl26ATJt:@<,og$;No?+Co%qBl7Km/g)?+AS,XoARlu-A8c%#+Du+>+Dk[u
DBO%7AKW++Bl[cpFDl26ATJt:AU%p1F<GL>Cj?Hs:-pQUFD,*)+=LuD@<?03+D#e:@;]Us+EVNE
F)Po,FD,B+B-;,7BOu3,FD,*#+DGq=+Co%q@<HC./e&._67r]S:-pQUD/X<#A3(hU@r+k\B-9>i
+B2onF@o=s6tp[Q@ruX0Bk;?.F`g8gDJsQ,%13OO:-pQUGA(Q*+CQC5ASbdsBm+&1A8-'q@ruX0
Gp$X9ATJu3Dfd+5G\M5@+=LuD@<?03+D#%rDe3u4BlnD=@<-"'D.RU,%16igA9DEsEcW?d/g)Nj
-RLAk/j:C>3[[Nq6m,)t6pt$L:fAK/:IJ,W<Dl1Q+A,Et<(0_b-OgDtDe+!$AS-!+4Y@jlE+*j%
-8%J)C2[X*A8-(*+<XEG/g);c.OdM5+DPk(FD)*jD..L$+?_>"C2[X*A8-(*+?^i^De+!$AS,um
$>F*)+>G!M/g,">F))n/D_;J++<Wij-Z*R=F(oN)+A,Et+D,P.A7]e&+>"^HAS,XoAKYGnAoD^$
+EDUBDJ=!$+A,Et+DbIqF!i(l+DkP.CEOiEC2[X*A8-(*%16Z_F(Hs5$6UHT+=CT6C`l>G6m-)[
Ch.*tF!+n3AKYMpAnc-oA1&K]+DPh*F_#&qEt&IfDIb@/$7QDk%16'GF*(#M6pta0ARfh#EbT*+
+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?3Q+Cf5!@;^4,%160&;GKeY7lhb\8OHHK:JO2R8OZQ#6W-?=
<(01t6<PF-;FsY^+Au37;]nk*+A>'f+B1m';]o.59M?Qq73Fue9LVoL6m,&r+B1m#+AP@-<$5+=
78PTG$4R>DBOu'(FD,5.6=k4[+Ad)e@ruEpATJu1@:C@"F`)7CBlkJ-Eb/[$ATJu&+Du==@V'R&
De:,&Bk)7!Df0!(Bk;?.Bl5&8BOr;7IS*C(;bpCk6U`FHA8-'q@ruX0GqL4=BOr<(AU&;>F*(u4
+EqO9C`mb0D/XT/+CT/5+E(j7FD,6,AKYMt@ruF'DIIR"ATKIH+A#$F=\i$?6U=U=+@/=i<E()?
84c`&6pXd<+B)68:`rM/="Xph.1HV^ASl@/AP?NA6=k4[6tp.QBl@ltEbT*+?YO7nA7%J\+>Y-$
+>=63BkAt?8OccQ:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(;bpCk6U`@O
/12Vh%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9@V'V&+E2@0@ruEpATJtBGA1qD+Co1rFD5Z2
@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>qCgh3sF!,17+AH9S
+CT.u+A?KeFa,$J@<?1(%144#F(f-$C`k*GD'1ENAfrHPC2dU'BHS[O8l%iR:K::[74/NO+<Y`B
Dfp/@F`\`R9OVBQFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+=M)8@kVY4DKU1Q+Co1rFD5Z2@<-'n
F!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6
@<-W9@V'V&+E2@0@ruEpATJu)Bk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqNASl@/AKX<NF*&O$Ea`I"Bk(^q+DbIq+Co1rFD5Z2@<-'nF"Rn/.1HW)AT;j,
Eb-@@B4YslEa`c;C2[W1%13OO:-pQUF`)52B5)F/ATAo(Bk)7!Df0!(Bk;?./KdVT:/=bV+@T1+
:Jt+#$8<SV+=&'c+ED%+A0sJ_4$"`uE+<g*Gp$R8FCfN8-QlV91E^UH+=ANG$4R>;67sBkASbq"
AKYMt@ruF'DIIR2+D,>(ATJ:f;Is]`G%F?U@R=XIF@9hQFD5Z2@<-'nF!*.G$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMPI6m-#YATJu3Dfd+2ASc:&B-:o++EV:.+A*buEb/ek$6i)<6m+ln78k=(:K/H'78-KP
7j(Au+B1m#+A*bU;FO"u%13OO9mIjnBl\9:+CT.u+Dl%<F<G:7E,Tc=@;^00@VKp,De:,#A9MZs
AKY].+EM76E,9e\%13OO:.82P;BS_'<^fn/:.82P;BU%&DfTD3H#IhG+A,Et+Co1rFD5Z2@<-'n
F!,17+A*bjDKBo.Cht5)Bl[cpFDl26ATK"($4R>6+EqaHCh+YsCiaM;@<QR'A0>;uGp#m]+DkP)
@:s.^+Co2,ARfh#EbT*++Dbb-AKVEh-X9JgDeEKq+@^']ATM*(/e&-s$:AiF@<?''@3A0<6m->T
F*(u6+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfd+DBOQ!*BlbD,Df'H0ATVL"Gp$g=A7]^kDId<r
F<GL6+A+7/+A$Z&F!+n-F)N10+D5V2A0>SsARQ^'D]iS%Anc-o+CQC6F^elqEb/a&DfU+GF*)GF
@ruj6AKZ).@<<W/Bl\64EcW?q-Z^DRATDj+Df0VK+<X9P6m,u[ART[lF!+q+DIIR2+DPM&Ch7Z?
+<XWsATME*Anc'mF!+n3AKYSnBl\$8+EMX5@VfTu@Wcc8@VK^gEbT*++Ceht+Cf(nDJ*N'GA(Q*
+A*bdBOPdkATKI5$7QDk:-pQU@rc-hFCcS'+DkP.FCfJ88l%htA8-'q@ruX0Gp%-GDfd+?F`_\=
A7Zm%Afs\nF!,"-Eb/a&DfTQ'F"Rn/:-pQU<+oue+CfG'@<?4%DBNJ$E+Not+E)-?@3B&uDJ!Tq
F`M&(+Co2,ARfh#Ed8cUIS*C(;bpCk6U`FV%16uaG@VgD@W6F#F*&ck-u*^0FD)dEIS*C(;bpCk
6U`Y;E-,Z4F=/M!-XpY.F<GOC@:OCn@qB^(FCfN8+Co1rFD5Z2@<-W@%13OO:-pQU<+oue+DGm>
@;[3!G[YH.Ch4_@+E_a:+CT/+FD,6++EDC=F<G16EZfXGF`JU8Bk)7!Df0!(Bk;?<%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[kDdd0!CggcqA8,OqBl@ltEd8d>Ec5e;A9Da.+EM%5BlJ/'$<1pdBl%U.F*)G2
FCcS1AU,D1ART\'Eb0;7De:+a:IH=LAKYl%ARlol+Du+8ASlC.Gp$X3@ruF'DIIR2/g+,,BlbD7
AU&;>F*(u4+Dbt)A9/l8BOr;7@W6F#F*&iRA8,OqBl@ltEd8d>Ec5e;@3B*'D/^V=@rc:&F<G+.
F*)G:@Wcd(A0?)1FD)dh:IHfE$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15dI@:UKs@:C?iBk)7!Df0!(
GqKO5.1HVZ67sC!E+No0DIn#7A8,OqBl@ltEd8*$De't<@W6F#F*&cP>9G^EDe't<-OgCl$;No?
+Dbt)A0>K)Df$V.G[YH.Ch4`"F_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q
05>E905>E9Cggdo05P'+A9Da./no'A-OgCl$;No?+ED%+ASu("@<?''@;Ka&Eb/ioEb0,uATJtG
+EM47G9C^1F*&OHBQ@Zq+Dk\2F(&]mEt&I`1E_#s+>=pNCi<d(-9`Q#/g,1GG&J`U%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[a@:O(qE$/Uu@r$4++C\bhCNXS*$6hf&6VCEU+@8@]93"e26:!t3<DXkK$4R>6
F<G:=+Dbb6ATD3qCj@.3+EMF/E$07@+DkP&AKYD(@UWb^F`8IIBln#28l%i-+<XU$+C\bhCNXS=
De=*&DBTGr.1HVZ67sC!E+No0FD,5.@V'V&+E2@0@ruEpAKYMt@ruF'DIIR2%17#a+=CW;FCfN8
-QlV91E^UH+=ANG$4R>;67sBi@:O'qBlkJ?E"*.n@:O(`+=CW;FCfN8-OgCl$;No?+ED%7FCZM7
ARfY%ATDi7FD,5.D/XK;+CfP7Eb0-1+C\bhCNXS*$?B^!FCZLA@W6F#F*&c=$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMneCLnVs+EM%5BlJ/:A9Da.F:AR$<'a/G+@.,K6W-KP<$4S/9i*#C$4R=jE+*6lA18X1
@:O(o+E_WG@VK^gEd8dBAnc'mF!+q7F<G:>-Z^D=CiaM;@3B3$De'u)A7]0lFDi9GA9Da.+s;/L
F`JU8Bk)7!Df0!(Bk;?.@<3Q1Cgh$q+EV1>F=n[Y8l%ht@ps6tA9Da.+CT)&+E)41DBNJ(@ruF'
DIIR"ATJu&F!+m6F(oN)Ch4_]+EM%5BlJ/H+B)cjBlJ/:A9Da.F!+n3AKZ).AKYi.F*&OGFCAWp
AKZ2*Gp%3I+EMXCEb-@c+Co1rFD5Z2@<-'nF"SRX<+ohcC2[X(Dfp)1AKYDlA8c?.A8-+,EbT!*
FCfM9@;Ka&8l%htF)Q2A@q?cmDe*E%Bl5&8BPDN1AoD^,/e&.:%15is/g+\ID/^V9DJXS@-t7.;
ATMrB%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sB/D..3k.3N,@ART[lF!+m6A8,OqBl@lt
Ed8d<F_u(?Bl5&8BOr;sF_u(?F*1r&Bl[cpFDl2F%16Q`FCfN8A9Da.4ZX^,BQ&*6@<6Ks@;9^k
?Qa2oCLnV9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+E_a:F!,C5+CoV3E$043EbTK7Et&IK:IH=9
F_u(?F(96)E--.D@ps6t@V$[)F(Jl)FDi:BASc9nA1Sj5DfBtE@;]TuD.Ra#AKYMt@ruF'DIIR"
ATKI5$7QDk:-pQUEb0'*@:UKiE-,Z4F:ARqA0<7/E-,Z4F=/28+>Y-YA0<6I%14d43\V\'3b!&M
ATMs(F_u(,$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq?DfBtE@3B)p@ruF'DIIR2/e&.:%15is/g+YBE-X*R
ATDEp+C];3ATMr9A8,OqBl@ltEd8*$DIn$&+=CW;@rH=3-Tc'^@<?0*-[nZ`6rQl];F<l+@W5gq
E-Wf?$?'Gt-Xq%)DfBtL+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4FC]N2E"*-`$;No?+Cf5!@<*K0
@<?/l$=n*sATT%B6VKp7;G]YY81+iR%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[AKYD(D..L-ATAo6AM%q6
B5)F/ATAo7@rc:&F:AR$9gME@+@.,E5uU`O;BSk+/Q,#-8Q/SW;BSn*;Fs\a+q4kg$;+)^+E).6
Gp%0>ATJu9BOr;sBk)7!Df0!(Bk;?.Eb/ltF*(u6ARlotDBO%7AKY`)@<6O%E\;'@Aft]"Ch4`1
D]in*Bl8$$Bl7X&B-:V*Ch[s4+E(j7Eb/ltF*(u6ARlooBk)7!Df0!(Bk;?.BlbD*+D5V2A0>Ss
ARR26+A,Et+Ceht+D58'ATD4$AKYD(Eb-hCAS5^uFCfJ8F(96)E-*4EBOQ!*H#IgJ@ps6tARoLs
/g)8G$4R>4ASu("@<?''@3BT%/TPE8BleB-EZfF5EbTK7+CT.u+E2IF+DGp?Bl5&=Dfp(CD..-r
+A,Et+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfdT@$7QDk:-pQUB4YslEaa'$+ED$FEb/ltF*(u6
+EM%5BlJ/'$?B]uAS4.e+EM47GApu3F'i?jDe*2t4*s"22'?gJ+=ANG$4R>;67sC%@<Q3)BlkJ3
DBO%7AKYhuF*(u6+EDC=F:ARtATD?p+Eqj?FCeffC2[Wi+DPk(FD)dEIS*C(;bpCk6U`YCDe*m"
B5)F/ATBD;C3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkhF<GC6@WGmtGp$X3@ruF'DIIR2+EVNEEb/Zi
Df0B:%14:X78tC'8O?<@;HY,18OHHK:JO2R8OZQ#<)4W776s=;:/"e7%13OO:N0l_+A,Et+Co1r
FD5Z2@<-'nF!,")Anc-o+CQC6ARTUhBHV8&FD*9L+B3#c+D,>.F*&O8Bk)7!Df0!(Gp%$C+EV:.
+E1b2BHV#1+EV:.+E).6Gp$X3@ruF'DIIR2+EV:*F<G(%DBND"+Cf(nDJ*Nk/g)9.F<G:=+Cehr
Ch7-"FD,5.,&h[H+s:E1@ruF'DIIR2/g)9*G%GP6FD,T8B4rE*Df0N:F<G+.@ruF'DIIR"ATJu(
@;]t$F<G%(+Cf(nDJ*Nk+C]U=8l%htBlk_D+CQC*Df9//Bk1d`+EVNEF(KG9FD,6&+AtWo6r-QO
=Wh0b@psM$ANC8-%16!%5t"LD9N`KKBk)7!Df0!(Bk;?.@ps6t@V$Zj@q0(kF(Jl)@X0))DL!@B
F_tT!EZf:4+A,Et+EV%5CND*N;FNl>=&MUh73H,T@ruF'DIIR"ATJu(@;[3+DJXS@@V$Zj@q0(k
F(Jl)@X0)7DIjr4@<63:+<V+#%15a>AT2@$B-;#)@WGmtBk;?.;FNl>:JOSd+E2@4G%GQ5F!+n$
@qfIbDKK<'+E2IF-Z^D=F!,aHFWbUAASrW!DIal"Ci=B++Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBt
@;BEs@W6F#F*&O&76s=;:/"e"$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1A8lU$F<Dr/76s=;:/"e<
%13OO:-pQU@W5gqE-WR?F!,@=G9D!@AKYr7F<G+.@ruF'DIIR2%17#a+?MV3@W5gqE-WR8E-,Z4
F=/28+>Y-YA0<6I%13OO:-pQUAnc:,F<G4:Dfp"PF*22=AKZ&*FE8RD@<?/l$>4Bu+=CT1Ec6)>
-T`G43[\HHFCerqARfKuH"CE)A79RkF!,RCA79a+F*2A@Bldj,ATTUR%13OO:-pQUDJsW.+Co1r
FD5Z2@<-W9E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[jAS#g'Eb/ioEb0,uATJu:E+EC!
ARl5W,"k?n:`rY)7R^3D:.%HK+B;6+5u^9@+q4kg$;+)^+EMXCEb0;7GAhM4+ED%*ATD@"@qB^6
+<XQnAn?!oDI[7!+D#G!@VfTuD..=-+E_a:Ap%o4DfB9.@<?4%DK@EQ;IsHOEb0,uATJu&Ci"$6
+=Ll6FE2UT+EVNECi<`m+EqaEA9/l8BOQ!*@ps1i+E)@8ATAo;DfTB0+DG^9DIn#7@rH7,AU&<<
/e&.:%15is/g,(MCj@.BF`\a:Bk)7!Df0!(Gp%-=An?!oDI[7!+Dtb%A0?#6A79RoDJ((D+EM47
G9C^1F*&O:Bm+&1D.Rd0@:s.m%16H"+F>^`0Hb"EDdmc74s58++ED%:D]gDT%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[cDe!p,ASuT4A8,OqBl@ltEd8dG@VTIaFE7lu,",3o<D>nW<$4S#6W?WQ:-hc\+AY<r
771$Q+q4kg$:JfBF_t]-FCB9*Df-\3F!+m6Ci=3(+EMX5DIdI!B-;86Eb-A4DeX*2+D,P4+E2@>
B6%EtD.Ra//g)92Df^"CDe:,6BOu$'BOQ!o+DGpM+B*2qAKYK!@;0R$Blk_D+E_R>ARf:mF('*7
+CT.u+D#_-DBNJ(F*)G2@ruF&B.b;L:NU8]EcW@BF`\a?DBNV$Ch=f!@;BFb+D#.sDfTr@/g*`'
+DlBHDfBE.Bl@l3FD,B0+<kN@DC9NKAThX&+EqjEDJ(+:+<X0mDe'u$De!p,ASuTuFD5Z2+D#A#
G%#K(F!+t2A7[A98T#YDDKU&7-Z^DKE+s3(Df-\3F<GX9E+*cqFCfM9,&Ct8ATD4$AKYr4DeF*!
D/F!)B-JI1Ec5e;FD,5.@;L$sEc,<-Bm+&1/Kc6OCi!g-ATD4$AKYr4DeF*!D/F!)B.bAN+<V+#
%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,'@<6]:G@>c<+EVNEA8bt#D.RU,+Cf>#AM,*.Dfm14
@;[3!DKKH1+CQC6Bl7R"AKZ&*DKKH-@q?d$EZed5Cgh?sAKYMtF)to5FCB9*Df.0M+A!]"Dfol,
+ED%'Df'?&DIal3BOr;uDfT]+E\8IW;e9M_8l%htA8bt#D.RU,@<?4%DBNP0EZf4;Eb-A(De!p,
ASuTuFD5Z2+E)4@Bl@m1/e&.:%15is/g+bEEZf72G9D*JEb'56FE2XL@3BW*DJ*cs+Dbb0AKYo'
+CoD#F_t]-FCB9*Df.0:$=ROgATDTqF*)JFE]lHh+FPkk+<s-U+=eQh-7ERhIORN1>9H?e+C-E*
$?1-0+=CT0FCfK/@<6O3FE/`<$4R>;67sBpDKBB0F<GX9DKKH-@q?)V0H`=tE-67F-XgV/ATDTq
F*)JFE[NprEb0?$Bl7u7F*)G:DJ((?GpskEAoqU)+DbJ-F<GL3@s)g4ASu!h+E(j7.!R0g%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k8l%htF`V,8+CoD#F_t]-FCB9*Df-\3DBNh.G9CC6DKKH7FE9&D$7QDk
:-pQUAoD]4FCAZnFE8RHBOr;sDe!WqDKI"BASuU$DI[6#BlbD/ATVEqARl5WA8-+(+=CT0FCfK/
@<6O3FE/`<$4R>;67sBiEbT)sCj@.6ATM@%BjtWrF*2A;Df9M9B6%p5E$-8T+EV:.+E1b7@UWb^
+D,P4+D#G4ATDL&B-;;0Df]J4F(K62ASu!hEt&IiCiF9.+FPjbB6%r6-ZaEJD/X?1-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$:/PPAU%X#E,9).De:,.Df021A8bt#D.RU,@<?4%DCuA*.1HVZ67sBsDf021
A8bt#D.RU,%14d33?VjHF)W6LF*2A@Bldj,ATTUR%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cAS,XoAKZ8:
F`JUCGA\Nq:IH=HBQ%p5@s)m7%14:I77KjD73G`/<Djr8=&'l1:IH=(85E,_6WI)a+q4kg$;+)^
+EqaEA9/l'@;[2sAKZ,:ARlp-Bln$&DBNA.@VKq)@<-W98g&(nDeF*!D0%<P+A$/fH#IgJA8c?5
F<G10DIaku+A,Et+E2@8D/"*+G%De<BOQ!*D.R:#F!,aHF`JUBAS#Cn+CoC5@3BB#FED>1+E2@>
B6%EtD/!m#/e&-s$<1\MEb-A%Eb-A1@;^?5AU%X#E,9*,+E(j78l%htE,ol0Ea`g%Bl7Q+Bl5%c
:IHRO+EMIDEarZ'@rGmh/g*`'F*(i,C`mh5AKY`+A92[3EarZ'@:WneDBO%>+D58-+A,Et+EMID
EarZ'@rGmh/e&.:%15is/g+_M@;Tt"ATJu4Afu5;Bl7Q+8l%htGAhM4F!,RC+Co%qBl7K)DIn#7
Amo1`Ch\!*ATJ:f%15is/g+\9F(96)@V$Zj+A,Et+D5_5F`7csBP1[dC2[Wi4ZX]i3Zr*PE,KJ7
><3mT/g+eIE"*-`$;No?+ED$FEb/ioEb0,uAKYr7F<G+.@ruF'DIIR2+EM47G9C=3Gp$[=Ec5u>
%17,eEb/iiBkhQs?TgFm1E\_$-R`j`/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a(g4YD.8Eb0E4
-RU8h+Bot6-OgCl$;No?+EM47G9D*JEb'56Eb/ioEb0,uARlomGp%<LEb'56Bl5&%+D5_5F`8IF
BOQ!*@<,p%DJsV>Bl5&8BOr<!Ec6)>%16igA7o7`C2[Wi4ZX]5@:sV!F`8];$>t)qBkhQs?TgFm
1E\_$-R`D>CiX*!F!)TR/g+eE.3L2p+D5RT/g+eIE$/n6A7m8!$4R>;67sBtBle?0DJ()(Ec5e;
-t-b/Dfp"J%16ut+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;hF*)>;BmO>58l%htARoLs+D,%lBl%L*
Bk;>p$6hi;;cHOe8QnP*8l%ht779^H+@\Xa8PD]T8OZQ%%13OO<+ohcD..-r+A,Et+D#(tF<GdG
Eb'56-uO5X+CT.u+=Lf3.3N,/DBND"+CfP8FDl#1H=^V0@X0),AS,XoBl7Q+@3@s66WHiL:/jSV
9hdoK6m-P\EbTK7/e&.:%15is/g+\9Anc-o+CoD#F_t]-F<G(3D/E^!A0>r'EbTK7+>"^_ISP??
+DGm>GAhM4+DtV)AKYr.@:Nk^DerrqEX`@D:IA,V78?fL:JFPL:./H'C2[Wi+?_b.0H`D!0F\A1
D/XQ=E-67FE,m'KH[\_=I4#I2.1HUn$4R>;67sBjEb/[$AKYD(DIn#7GAhM4+>"^SE+Np.+D#(t
F<GdADId[0%16us+=CW;GAhM4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:\`IA0>u-AKWC1E-H5@A18X4
A8--.GA1r*Dg*=4DIal-DffP5BQ&);6r-0M9gqfV6VgEN5u'fjFCf]=+D>2)+C\nnDBNe7A8,Xi
ARlolDIal(DKBB0F=n[Y=(l/_+EV:.+EM%5BlJ/:GA1r*Dg*=<F!,O4G%G2,GA2/4+@B%+9J'<g
6r-0M9gqfV6VgEN5u'fjEcl8@/e&-s$;u"a+CT.u+Cf5+F(HJ9BOr;7@W6O0Eb$UAARoLs+EqO;
A8cZE%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqAA8--.@3Bc4Eb$;,DBO%7AKYMt@ruF'DIIR2/g)9/
:IH=>F!+n-G@>c<+D#(tFD5W*+Cf>/Bk;?<+A[#lB5)6lCi^_/@;[3+DJXS@@V$ZlBOPdkARlp-
Bln#2AU&01Bk(k!+E2IF+E)41Eaa'(Df0VK%14Nn$;No?+Dbt)A0>Ds@ruF'DIIR2+EqaEA0>T(
FDi:5A8--.GA1r*Dg)WtARlo2F*2A@Bldj,ATTUR%13OO:-pQUAnc-n+EV:.+=M;RDK9H4ATMF)
0I\,UA8--.GA1r*Dg*=4DIal-Dfd*i:IA,V78?fL:JFPL:.-36$4R>;67sBjCi=B++D#(tF<GdA
DId[0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cAS,XoAKXT@6m-GhDe`inF<GF/@rcL/%14:I77KjD73G2u
6m,<(:J+&C<$4n$6W-]Y+q4kg$<LnPDBNn=DeF*!D/F!)B-;D4FD)dh:IH=NDfm1EH#RJ-@;Kb*
+E)41DBN@1F(KG9De:,&Bk)7!Df0!(Bk;?<+A?]^A0>r3D.Oi2H#n(=D'3n0EbTK7F!+n/A0>Do
Anc-o+EMI<AKYYpDIe#8DJsZ8F"SRX<+oue+Ceht+C\n)A8c?s+DG^9@3BN0De`inF<GF/@rcK1
F(96)E-*]A$7QDk:-pQUA7]@eDIjr!+E2@>C1Ums+DkOsEc3'P+A!\uF(HJ9BOr<*Eb/isGT^sG
C*7,,EZfFG@q[!+@rc:&FE7luE,o]7F`)&7Df.^!+>=p!+>=63%15is/g,4W@;]UaEb$;-+EM%5
BlJ08%17,eEHPu9AKW@2AR]dp+EV%5CF9Pu%15is/g+tK@ps0rF(96)E-*4?Dfor=+:SZmDe*Kf
BkhQs?TgFm-ZaEJD/X?1-OgDtDe*orBkhQs?TgFm-ZaEJD/X?1FCfN8F!hD(%15is/g,+UF>%lZ
AS)AY6r-0M9gqfV6VgEN5u'gTH=%dX3ZoekD/XQ=E-67FE,m'K-[U;;IXNRk-OgD3%13OO:-pQU
F*)>@AKYhu@rcJs$8`lEF`\`RE,o]7F`)&7Df-pa8lJ)T8PiAn@;9^k?TW4IC3+N8D/X?1%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k:MsZR+E2@>C1Ums+DkOsEc6"A@<,p%A7]@eDIm?$Blk_D+D"u&Gp%3I
+Cf>-Anbn#Eb-A=Dfp(C8g&1dF)u&6DBLMRDfB9*+EV:.+ED%5F_Pl-A0>Ds@ruF'DIIR"ATJu&
DIal1F`&=GBln#2-us/R+EVNEF(KH9E%VS,.1HVZ67sC%ATW'6+E2@>C1Ums%17,m+=D,KC3+N8
D/X?1-QjO9+E(d54$"`uE+<g*Gp$R8FCfN8-QlV91E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMAY
BlkJCDfp(CC2[X%Ec5Q(Ch555C3'gk,"4mk<$5=><DjrSDe*g-De<^"AM.\3F!;&#%160MASrV_
:IH=ADdd0t+EV:.+EM%5BlJ/:IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3(M3F!,%=
ARfk)ARmD9<+oue+EM%5BlJ/:@ps6t@V$[)F(Jl)FDi:CATT&;E$.bK6m-SbAKZ2*Gp%BNFWbm:
DKIKR:2b5c+D>\;+F.mJ+Ceht+D#e/@s)m)+E2@>C1Ums+DkOsEc6"AGA(Q*+A,Et+Dbt)A9/l;
Bln#2F(K62ASu!hF!,:5CLoO9$4R>_D'13FEb]Z<DJa<1DC6Q2+E(d54$"`uE+<g*Gp$R8FCfN8
-OgCl$<KMk:.\2N3ZrKcDfTD3H#IhG+E2@>Anc'm+DG^9Df0,/De:,;Dfp(CA8,OqBl@ltEbT*+
/g)99BPDN1Anc'm+DGm>Eb0<'F<Gd@ASrV_5tiDDE+EC!ATJu9BOr;Y:IH=6A7TUr/e&.:%15is
/g+\=F)Yr(Gp$j?A8lR-Anc'm/no'A%16Zg+ED%%A7&b[De*2tC2dU'BIA7;A7TUrF"_0;DImis
CbKOAA1q\9A8lR-Anc'm/no'A-OgCl$;No?+Cf5+F(HJ9BOr<$De*g-De<^"AM.\3F!,[@DId[0
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[t;ahg$:IH<r78-N#5u'fj6r-0M9gqfV5u^EO:(7OS<Du=/8l%ht
84?3K+@/aj+@K!m<D>nW<'aJT:JN)C$4R>6DKBo.Cht59BOr;7B4YslEa`c;C2[WnDe!p,ASuT=
+CSekDf-\>D]j1DAKXT@6m,;o7NcAUCiD!L%14Nn$;No?+Dbt+@<?4%DBNk0+DPh*/oY?5+>"^M
DKBo.Cht5&A7TUr+=Ll6DImisCbKOAA7TUgF_t]-F=A>VBln#28jQ,[$>ONgFD)dEIUQbtDf0VL
B4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7d1u$4R>;67sC!E+Np.+DPh*/oY?5+DGF1
@3BN"Afu,*@:Wqi+DGm>@<Q'nCggdhAKYo/+F.mJEZfFKF*(u1%16igA8#OjE$-hD$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMl#D/E^%Gp$O5A0>JuDII?(Eb0)rEbf_K%16'JAKYT'Ci"$6Bl7Q+E,oAsFD55r
F!,=.CLnV\:IH=BDfTD3E,ol-F^oN-G%De)DIal4F(Js+CcW"4%15^'6m+ln78k=(:K/H'78-KP
7j(Au+B1m#+A*bU;FO"`$4R>/5sn:F:`r(j6VCEU+@8@]93"dt$4R>A5taWh5p0)n;Fs\a+@K4(
:^ma@$;EfZ73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<"00D$<'Am+A>?n;F+2`+@Jdg<(Tk\
5uL9C;]o%8+AtWo6r-QO=Ub]I$;3fV:`rY)7R^3D:.%HK+B;6+5u^9@%13OO6r-0M9gqfV+@Jdg
<(Tk\5uLi.:I7ZB6W?tn$4R>177KjD73G`/<Djr8=&'l1:IH=(85E,_6WI)a%13OO6WI&a:JFDa
73G2u6m+od8Q6g%5sn4;8Q88M;[j'C$:I<P8PV\s8l%ht:f:(]771#s9gM-E:K%]0%15Nl8Q6g8
:K::8C2[X%Ec5Q(Ch555C3'gk%16*673G2u6m,#h9Mcit:.-3m:IA,V78?fJ<(Tk\%13OO%16'J
ATME*@<,p%C3=T>+EMI<AKYo'+EV:.+A,Et+E2@0@ruEpATJtc+D>2,AKYT'F`(_4F`V,+F_iZQ
+@1&kH#IgJF`V+:8l%htH#IgJGA1l0+E2@>@UW_^Gp$^5DIal8Dfp(CDg-(AD.Rg&De*oA+<V+#
%15[=+F.mJ+D,>*A0>;u+CQC8F(Js+C`mS+FD,T'+E2..@<6!&Ch7]2D.Oi*DJs_O+<X5u@ps6t
@V$[&ART(^ARlolF?0j<%15^GBPnqZ@;BFp+:SZP@<,jk+>PW*3"64(@;BFpC1K=b5\FqBBl#D3
Df#pj.1HUn$>OKiA9Da.1,V`k6<$NU9LV**+=BcW6m*m5.3MQ-F`Lu'+@C'XAKXB`D/^Ur@rc:&
FE8f=$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj
.1HVX5sdq79he&O<)Yq@+=C-%BlbD5@:C?iASl@'F*)G2FCfM9BQ&);FDi:<Ddd0!A9Da.+A,Et
+EM%5BlJ08+>"^VAThd/ARloqDfQsm+?1u-GT]^hEarc*1,(FB-OgDV5se%:6WI&J3Zp-d$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMMgFE2;1F^oN-Df-!k8l%htF)Q2A@q?cmDe*E%BlbD-BleB:Bju4,ARlot
DBO%7Eb/f)8l%htA9Da.+EM%5BlJ08/g*Q)D/^V=@rc:&FE8R5Eb-A4Cgh$q+@/pn8P($s+EM%5
BlJ08+EV:*F<G(%DBND"+Dbt)A7]9oGA2/4+A+#&+EMX5DId0rA0>r'EbTK7+E2@>@qB_&Bl7Q+
G%G]'F"Rn/%16'JBlbD5@:C?fF)uJ@ATJtd:IH=6DIal2F`;;<Ecc#5B-:VnA8c@,+D>2,AKYGn
ASrW)DKBo.Ci!Zn/g*b^6m,oUA0>r9E,]`9FD5W*+CSekDf0V=@ps6t@V$ZrDKBo.Ci!Zn+EqOA
BHVD1AKXSfE+*6l@:s-oD..<jB4Z*9%14Nn$;No?+EVNEF`V+:@3B*'D/^V=@rc:&F<F1O6m->h
F*&O6AKYDkFD5o0%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;bDJ!Tq
F`M%9@3C#6De*p-F`Lu'+Co2,ARfh#Ed8*$<,Wn"F`&=1+A,Et+CoV3E$043EbTK7+EM76E,9eB
DfB9*+CQC1ATo8-Bk)7!Df0!(Gp$O5A0?#9AKWBT+Z_;+/g(T1%15RCEZfI;BlbD5@:C@$BOr<-
Dfp)1AKYMt@ruF'DIIR"ATJu&Eb-A'Eb/[$ARlotDBO%7AKWCM8l%iR:K::[74B@"ASbdsBm+&1
A8-'q@ruX0GqL3^=`8F*GA1l0+Dtb%A0>u4+Cf>-Anbn#Eb-A%+A*bgDerrqEZfIB+E275DKI"C
D]iJ++CSc%F^])/A8-'q@ruX0GqL42+B)6;:JODR=WgU26VgEN78?5nF`V87B-:V*A8-'q@ruX0
Gp%3B@<<W+F!,@=F<G:8+EV:.+A*btH#n(=D'3q@AS!#-=`8F*A8c?5F<Gd9DKI"HDfp(CE,oN"
BlA-8+Co1rFD5Z2@<-W9A79Rg@UX=hF!+q'Bl7Q+GA2#-A0>?,+DG_7FCB!%Bl7Q+FD,5.DIn'7
+A*c"ATDj+Df.0:$4R>/AS,k$AKYr4De!?iA8,po+Cf>-Anbn#Eb-A%+=M\2:IJ,W<Dl1Q.3N/8
Eb/a&DfU+U+AZkt8iSFWGT]UU<$67-F*(u1F!,R<AKX?YDJ!TqF`M%H7W3*RATDi7D.RU-+E)41
DK?qBBOr;sBl[cpFDl2F+D,P.A7]d(@rH6sBkMR/@<?4%DBNP*Ch54.$7QDk:-pQU@rH6sBkMR/
AKYD(IS*C(;bpCk6U`,.Bl[cpFDl2F+C\noDfTD3E,ol,AS#CdDJ()6D]j.8AKYl%G]Y'LFCfDD
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[qASl@/AKYr4AThd+F`S[A@:C?iBk)7!Df0!(Bk;?<%160&;GKeY
7lhbl84=Xr79EM3;cH1^+AtX&:KBn_+@Jdg<(Tk\5uL9C;]nG*76smA6m+g!+Abs-:Jr<5<DHI8
:IZI+84c`&9L1ut+<XWS73Fui6W?WQ:-hcL78k<WF`_>6F)5c'A1Sj<De*[&@:Uo3C2[WnAThm.
@:Uf0=%Q(Z+@8L>6q'd<<(02-+<X6F+B_K?+@AFm73Fl_:K:@:<(KG#6VgHV78?f\+AYHL<(KGV
73Fui6W?WQ:-hcL78k<s:EWD.<$4V3771'S73GQ#73G>o=B$D:5sc\m<(0V9%13OO<+oue+EMX9
E$/\&Anc-oF!+m6G%G]'+EV:*F<GU8D/XT/F!,:-@N]`1F`Lu'+Co1rFD5Z2@<-'nF"Rn/.1HV^
ASl@/AP?NA;f?f!@qA&B@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%16f]/g)Nj8l%iR:K::[74030
3ZrH]Dfe,p+DPk(FD)dEIS*C(;bpCk6U`@FA8a(0$6UI4D/XQ=E-67F-UAkI:IJ,W<Dl1Q+Co2,
ARfh#Ed8dAF!,@=F<GX9FEMOF/Kf+GFEMOF@;]TuFE2XL@:s"_DD!:G$>"$pASGa/+>#3XAU%p1
F<G=;@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De(J7C3(aFA8a(0$6UI4D/XQ=E-67F
-V@0&;bpCk6U`,+A7TUr+DGm>DJsV>Bl8!6@;KakA0<HHBl8!6@;Ka&@;]TuFE2XL@:s"_DD!:G
$>"$pASGa/+A#%(8PUC=D_;J++<XEG/g+Y?ARTU%Dfp.EA8,OqBl@ltEd8d<Bl[cpFDl26ATJ:f
+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>]k.&CiaE2@:U`7/12Vh%144#F(f-$C`k*GA0<OH
+>7^W+t"oiEc5l</14\;De*[&@:U`7/12Vh%144#F(f-$C`k*GA0<OH+>7^W+t"oiEc5l</14\;
De*BiG&2)*A1&fW-R'oI$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUGA1qD+EMIDEarZ'A8,Oq
Bl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC%144#:-pQU@<QR'A0>>t@;]k%+DG^9
8l%iR:K::[73HPXFD,_<Df-[kBl8'<+CT.u+AH9S+EMgLFCf<1%144#F(f-$C`k*GD'1ENAfrHP
Ec5l</13)nFD5Q4Ci<`m-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[X!Ddd0(%144#F(f-$
C`k*GD'1ENAfrHPEc5l</13)cDe*BiG&2)*A1%fn+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MP
@:Ls,Bl8'<.3N\MF`Lu'+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<F`_SF
F<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9CggcqF)Q2A@q?cnBk)7!Df0!(Bk;?.D..=)
@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/AKYE!Gp%'HAThd+F`S[ADdd0!
CggcqA8,OqBl@ltEbT*+/e&.:%15is/g,:SEb/ltF*(u6+>"^MB5VX.AKYQ)Ec5u>%14d30H_V`
1E^^LB4N>Q+?MV3F`_>6F)5c'A0>W*A8H0mA0>W*A7T7pCi<`m-QlV91E^UH+=ANG$4R>;67sBj
Ch7$q+E)CE+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$;tGPDg#\c@:E/RF`Lu'6tp.QBl@ltEbT*+
+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C0\@<?''F`_>6F)5c'A0>Ds@ruF'DIIR2%15LGD/^V=@rc:&
FE8R5Eb-A0Ddd0fA0>T(FDi:4Bk)7!Df0!(Bk;?<+<X$lART[l+CQB@F`_>6F)5c'A18X3Bk)7!
Df0!(GqKO5.1HVZ67sBjEb/[$AKYD(DIn#7F`_>6F!,"-Eb/a&DfU+GBl5%AIS*C(;bpCk6U`FH
/KebL+EqO9C`m1u+ED%2@;TRd+DbJ.ATA4e:-pQU=`8F*D09oA+Cf>-Anbn#Eb-@AIS*C(;bpCk
6U`FH@;]TuE,TH.F<G[D+CT.1@:OD%@;I&tD/aTB+Co2,ARfh#Ed98H$4R>[ATqZ--ZsNFCiaE2
@:U`I-u*^0FD)dEIS*C(;bpCk6U`YNFD5Q4Ci<`m-Rh,)D..-r+E_d?Ch\!:+Co1rFD5Z2@<-W@
%13OO:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*%17#a+=D;RBl%j,Ddd0(
+BosE+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%160MASrV_:IH=9F_u(?F(96)E--.DEcl7BFD,62
+CoC5DJsV>A8-+,F`Lq6H#IhG+CfP7Eb0-1+A*bfDK]`7Df0E'DKIKR+@0g[+EqaEA9/l%Eb-A(
AS,XoARlotDBN@1DKTf*ATD?m+EM%5@<?!m+Dbt+@;KKtFD,*)+DGm>@rc-hFCeu*GA(Q*+A,Et
+Dbt)A90@G+A,Et+CoV3E$043EbTK7F!,"-F)Yr(Gp$s8F)tc&ATJu&AoqU)+Dbt)A8,po+C\c$
@q]Fp+E(j7DdmHm@rucE+<XWsAKYl%G]Y'E@:C@#FCfD6Ci<`mF!,R<AKZ,;Bl%L*Gp$X3@ruF'
DIIR2/e&-s$<LYVDJ=!$3ZqsUD/^V=@rc:&FE8R7@;[2sAKZ/-Ed8dD@<-!l+EMHDBlk_D+CQC*
Df9//Bk1d`+EVNEF`V+:@;L-rH#k*NF(HIB0HiK%.4u_c9Q+?MBl7Q+@3B*'D/^V=@rc:&F<G:8
FDi9o+EM+8F(oQ1+D#(tFDl2@+Ceht+CfG#F(c[g+D,P4+Eh=:Gp$p3EbAr+F(96)E--.R%14Nn
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!FD,5.F`_>6Bln'#F!,"-@ruF'DIIR2/e&.:%15is/g,1W
DBO%7AKZ,;Bl%i5A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3
EarZ6F`_>6F"V0AF!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Auc`ASu("@<?''F`_>6F!+t5Df]tBEb/io
Eb0,uATJ:f<+ohcCghC,+Dk\2F(&]m+Co2-E,8s.ARlomGp$N<A9Da.+EM%5BlJ/:BlbD*+ED%1
Bl7HmEZfIB+ED%+ASu("@<?''@rcL/F!,L7An?!oDI[7!/g)9/:IH=9Bk)7!Df0!(Bk;?.D..-r
FCAm$+EqaEA0>B&Df]tBEb/ioEb0,uATJu9BOQ!*@<,p%F`V,)+DG^9D..=-+Eq7>F"SRX<+ohc
@rcL/F!,L7An?!oDI[7!+CT;%+Du+>+EMXCEb/c(Bl5&(F_u)=+CT.u+Dl7BF<G%(+ED%'Eb/[$
ARlolAoqU)G@>N&F"Rn/.1HVZ67sC$AS5RlATD4$AKZ,;Bl%L*Bk;?.@rcL/F!,L7An?!oDI[7!
+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl$4R>;
67sBt@;BEsF`_>6Bln'#F!+m6Eb/Zi+E).6Gp$X3@ruF'DIIR2%16WbF(KG9-W3B!6r-QO=XOXc
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>W*A.8lFBOr</FD5Q*FD5<-+Co1rFD5Z2@<-W9BlbD7Dg*=?
Ddd0fA0>;uA0>B&Df]tBEb/ioEb0,uATJu-@<Q3)@V'+g+E_X6@<?'k/g)99D]iP.D/a<&FCcS:
BOr<,ATMs3Eaa'(Df-\9Afs]A6m-PhF`Lu'+Cf>#AKZ2.+Du+A+CfG'@<?''@;]TuCi<`m+=LuC
A8H0mA18X0DIak<C2[WnAThm.@:Uf>%14Nn$;No?+CfG'@<?''A8,OqBl@ltEbT*+%16uaG@VgD
C2[X!Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+C2[X!Ddd0(.6AnlDe'u3Dfp)1AKYK$A7ZloBk)7!
Df0!(Gpa%.DIn$&+=CoBA7T7pCi<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q05>E9A7]q#Ddd0(.6Anl
De'u$AThX$DfBQ)DKI"?F`\a:Bk)7!Df0!(Gpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m-PhF`Lu'
+Cf>#AKYMpE+NotF!,C=+E(_(ARfh'+DG^9FD,5.F`_>6Bln'#F!,"-@ruF'DIIR2/g)99BPDN1
Eb0&qFD5Z2F(f9,+DGm>D..-rFCAm$ARlomGp%3BAKYr#FD)e8Eb&a%+E(j7A8,OqBl@ltEbT*+
/e&.:%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nF!(o!1E^UH+=ANG$4R>;67sC!E+No0
-u*[2Ci<`m.3N&:A0<:CFD5Q4Ci<`m.1HW&A0<rp-YdR1Ci<`m+E_d?CiaE2@:U_p$4R>;67sBk
Ble60@<iu+Bk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z8+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15dI
@:UKQ:IH=HDfp)1AKYK$A7[A9+B3#c+A,Et+Co1rFD5Z2@<-W9A9Da.+DGm>Cgh?sAKYGn@psM$
AKY]/+Cf>-FCAm$F!+m6F*1r5FCB'/Bjkg#@;Tq*DKI">AftW&@s)X"DKK</Bl@l3@;]TuFCfN8
+Cno&@4iZoF<GF/Gp%3;CLnVs+D,2/+Dl%6ASuU2+EVNECi<`m/e&.:%15is/g+tK@:UKqDe':a
0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De(J7C3(a3$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMhgB4YslEaa'$+DPh*+CfG1F)rIEAS,LoASu!hEt&ICAS,k$AKZ#)B4YslEaa'(DJ(),
De(5:+CfG1F)rIEAS,LoASu!hF!,:;DegJ(F<G[=AKYo1ASrW$Bk)7!Df0!(Bk;?<+<XWsAKWC9
De*[&@:Uf0A8,OqBl@ltEd8dFDg*=;@<3Q"+ED%*ATD@"@q?d%@<?0*FD,*)+DG_'Cis9"F!)lR
FD5Q4Ci<`m.4u&:.1HVZ67sBuDffP5FD,5.-u*[2Ci<`m.3NS<FD)*jA8,S'+>=63%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15^'6m,u[Df]tBEb/ioEb0,uATJu<Bl%T.A7]^kDIal.DBO(DBl%L*Bk;?<%14Nn
$;No?+ED%+ASu("@<?''-u*[2Ci<`m.3N,@Df]tBEb/ioEb0,uATJu&DIal2BQ&);Anc:,F<EF`
D.Rd0@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R>;67sBt@;BEs-u*[2Ci<`m.3N%A
Eb/Zi+E).6Gp$X3@ruF'DIIR2%16WbF(KG9-W3B!6r-QO=XOXc%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^
A0>W*A7T7p%15jKG9C^5F=2,PCi<`m+CT.u+CfG1F)rIEAS,LoASu!h+=LuCA7T7pCi<`m.4u_c
-u*[2A7]q#Ddd0*+DGm>GA(E,+A!\c@;Ka&FD,5.,%P8./Snj@ATAtI+<XWsAKYMpFtIN=H"D"=
BlbD*+E2IF+Co1rFD5Z2@<-W9FD,*)+EM7=F!,C=+EVO@+E(j7@3BH1D.7's+E(j7F*(i"Ch4`"
Bk)7!Df0!(Bk;?<+@L?mBl7Q+A7]pqCi=90ASuT4Df0B:+EV:.+Co&,/Snj@ATAo'BOPdkATKIH
+B`W*+Ceht+D"u&Bl&&;Eb0E4CLnVs+Co&,/Snj@ATAo(Bk)7!Df0!(Gp$RA+Cf5+F(oN)+DGpM
%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@ltEbT*++CT.u+E)41DBNY2+Cf>1Eb/a&+E1b2BHV56
A7]cj$8WfCA0<6I%17#a+?MV3C2[WnAThm.@:UKqDe*[&@:UL'FD5Q4Ci<`m-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@ku$;>AHA0>;uA0>B&Df]tBEb/ioEb0,uAM+E!.1HVZ67sBsDdd0!-u*[2A7]q#Ddd0*
%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9A7]p:Bkh]:%13OO:-pQU
Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/_:BleB;+>"^HAS,XoATJu5F`\a:Bk)7!Df0!(Gp%'7
FD)*jB6%r6-YdR1Df-paI4cXTEc<-KC2[X$DC5l#%15is/g+YEDf]tBEb/ioEb0,uAISu(+F>^`
0Hb"EDdmc74s58++ED%:D]gDT+:SYe$;No?+Co&,ASc:(D.RU,+E1b2BHUi"@ruF'DIIR"ATJ:f
A8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$AKYT-Ci"A>@rH4$ASuU$A0>W*A0>r'EbTK7
Et&IUBOr;Y:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.BOQ'q+Du+A+C\nnDBNt2F*)>@ARmD9
%13OO<,WmlASu("@<?''Ap%p+Gp$U8D/Ej%FCeu*FE1f#Bln'-DII?(8g&1bEbTK7+D,>(ATJu+
DfQtBBOr;rDf'H3DIm^-F!,C5+EV:.+A,Et+EMgLFCf;3H#IgJ@ps6tEcl7B@3BW$EbTK7+EMXC
Eb/c(Bl5&8BOr;Y:IH=9Bk)7!Df0!(Bk;?<+<XWsBlbD<FCfD6Ecl8@+EV:2F!,O6EbTK7/e&.:
%15is/g+e<DImisFCcRe:IH=H@rc:&F<G10Ch7Z1Bl5&*F_kl>+Cf>,D.RU,ARloqDfT\I%17,m
+=CW@Bl%<pDe*p-F`Lu'-OgCl$;No?+Cf5+F(HJ)Bk)7!Df0!(Bk;>p$8WfCA0<6I%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[qAStpnAKXT@6m-;a@:UKkBk)7!Df0!(Bk;?<%16'JAKXT@6m-PhF`Lu'+Cf>#
AKYMt@ruF'DIIR"ATJu&Eb-A2@;TRd+=LuCA7T7p.3L$RDe(:>@;]Tu.!9WGCi_$X+<XBeDL!@H
ATMr9@;]Tu@WcC$A0>r'EbTK7F!,17+EV:.F(HJ)Bk)7!Df0!(Bk;?.D..3k+E_a:+E(j7FD,6,
AKYl!D.Rc@+<XX%+Co20AKY])FDi9o:IH=8De*E%Blk_D+CQC*Df9//Bk1d`+EVNE@rH=3+CT.u
+ED%2@;TQuFD,5.Ci<`m+Co1rFD5Z2@<-'nF"SS8DI[U%D.RU,+CT.u+EDUB+EV:.+D,P.Ci=N3
DJ().Bl7L'+EVNE@rH=3+CT.u+ED%2@;TQuFD,5.Ci<`m+Co1rFD5Z2@<-'nF"SRE$4R>D5uLHL
:.I>f<DGnW9he&O<$4t39N`K07Nbi0<?O\*+AP^3+@/\!76s=E+@ne!73F!nDe*BiFt"O^C2[W3
+@/aj+=MASBl%i>+@Jdg<(Tk\5uL9C;_ALd.1HVZ67sC'DK9<$BleB-EX`@N67sB:+ED%+A0sJ_
4$"a3FD5Q4Ci<`m+DPh*Ci<`m+DPh*A7]q#Ddd0!F`_>6F!,49A0>W*A7T7p-OgCl$;No?+Cf5!
@<*K!DL!@>De'u3Dfp)1AKYMt@ruF'DIIR"ATJ:f:-pQU:2b5c3ZqpND/E^!A9/l%Eb-@pBl7I"
GB4mFEbT*&FCeu8+@^9i+E_R9GT_'QF*(u1Et&IO67sC$ASl@/AKYE!A0>B#E-WR:Bl[cpFDl26
ATJu2@;^3rCi"AL%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lXF`_>6
F!iCf-R'oI$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe(4E/12Vh
%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lXC2[WnATfFM/12Vh%13OO
:-pQU@rH=3+Co1rFD5Z2@<-'nF!*%W04c8EE-,f4DBNG-E+rm)+ED%5F_Pl-A0>H#E--@JF*1r&
Bl[cpFDl26ATJt'$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*-[nZ`6rQl];F<lXF`_>6F)5c'
A1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci`i/.4chj+>7:K06noS$;No?+EM4-Cht4A
G[kZ2Gp":Y/1>7P@<?0*-[nZ`6rQl];F<lXC2[X!Ddd0(.4chj+<i0a-u*^0FD)dEIS*C(;bpCk
6Ub6pDe**#.4chj+>7:K06noS$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*-[nZ`6rQl];F<lX
C2[WnAThm.@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7p>ULsO-R'ZdAKWXO-OgCl
$;No?+ED$FEb/ltF*(u6+EqOABHV2(G9Cd3D.Rbt$;No?+ED%+A0<7BFD5Q4-T`_kE+*j%+=DV1
:IJ,W<Dl1Q>]k.&Ci^sQ4""ZPDImisC`mkBBl%L*Bk;?5%15is/g,1GB4N,4C2[W14"+i_@<?0*
-[nZ`6rQl];F<lXC2[W1.6AnlDe'u3Dfp)1AKYK$A7[+t$;No?+ED%+A0<77De*BiFsf@"C2dU'
BHS[O8l%iR:K::[79jSGA7T7p-Rh,)C2[W*A7]pqCi=90ASuT;%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[r
F_tu(Ed8*$<+oue+DbIq+EM47G@b;-BQ&);FDi:<Ddd0!A9Da.+EM%5BlJ08/g)9/:IH=HDfp)1
AKYK$A7ZloBk)7!Df0!(Bk;?.G@bf++Dbt)A7]:(+<XX%+E_a:+EV:.+A,Et+EMIDEarZ'A8,Oq
Bl@ltEbT*++DkP&AKZ&:Eb-A8BOuH3@<,p%DIIBnA0<:8De*BiFt"sb-u*[2.3N&:A0<:CFD5Q4
.4u&:%15^GBPnqZ@;BFp%15g<Earc*1,(FB%16QQCLqO$A2uY8B5M'kCbB49D%-h$%13OOC2[Ws
DKKo;1,V`k6<$NU9LV**+=BcW6m*m4.3M3"FE2;1F^oN-Df-p3$;<`P5uglT:Js>:+>=p!+>=63
8oJB\+@Ih)6=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX5sdq79he&O<)Yq@+=C-%BlbD5
@:C?nDKKo;A9DBnF!,R<AKXT@6m-PrF*(u1+>"^VAThd/ARloqDfQsm+?1u-GT]^hEarc*1,(FB
-OgDV5se"<;GU1h4ZX]?%15cp6:Oa<<Du%A+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+BN5bF<G:=+A,Et
57Irl:IH=>F!+m68g&=rEb$;6FDl2.B4W2oDIal1ATVs,AThKu+EMgLFCf;A%13OO<+ohc@UX=l
@j#JrARQ]jAS>dqA0=K?6m-2b+EV:*F<F0uE,ol0Ea`g%Bl7Q+BlbD+ATMr9G%kN3ARlolF!,CA
B45[lH>.80+CQC&Des6$@ruF'DBNk0+EqaEA9/l8D]j"1Eb961D'370FCB6+/g*r1B45[lH=^V0
@rH1"ARfgrDf0V=De:,9DfTB0+D>2,AKYD(@V'Y'ATAo2@;TR:+@Jdg<(Tk\5uL9C;]uSW.1HUn
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$;+)^+DGm>@3A/b@:WneDD!%S8TZ(hF!,17F*(i,Ch7-"Bl5&8BOr;7
IUQbtDf0W$B4YslEa`chC2[W3+C]A"DI[?&De:,6BOr;rF`MM6DKI!n+EMgLFCf;3AoDKrATAo&
Gp%3BAKYr#@r#LcAKYhuDII0hEZf:@+C]U=F`)M>E,]N/B-;;0AKYMtF*)G:@Wcd,Df-\DBlG1C
C2[W8H>.=I/g)99BOr<(AU&;>CggcqF*(u4+DG_-FD50"BmO?3+EV:.+A,Et+EMgLFCf;A%14Nn
$;No?+E_a:A0>?,+EV:2F!,:-@LWZbAT;j,Eb-@@Anc'mF!,"-EZfI4F)*-4$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMl"@<-H48l%ha$<1\QF!,OGAT/c5FCB33F!,R<AKXT@6m-PrF*(u1/e&.:%15is/g,4W
@<-H4C2[W*/KePDART[lF!,=.F*(u6+D,>(AKY]!+Dtb#ATMp$Ed8*$Eb065Bl[c--YI".ATD3q
05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is]`G%De7Ch+Z)@:C?iBk)7!Df0!(Bk;>p$;+)^+DGm>
Bl8!6@;KakA0?)1FD,T8F<G"0Gp$X3@ruF'DIIR"ATKIH+<XX%+E_a:+A,Et+F.mJ+Dl7BF<G(6
ART[l+EMI<AKYMt@ruF'DIIR"ATKIH+B3#gF!,:-@N]f7ATJu+Dfp(CAU%X#E,9).A8,OqBl@lt
EbT*++=M&7@OWiN-u<=$A7]p5/0H?_Dg<cS@;]Tu-ua!2H#R>4.4u_c8l%htA8,OqBl@ltEbT*+
+CT;%+CfG'@<?'k+EqOABHVD1AKWC=ATqZ6+<k]7G9CF1@ruF'DIIR2+s;&?EagXD%13OO6=jbI
Eb-A'Eb/[$Bl7Q+CggcqA8,OqBl@ltEbT*++ED%1Dg#\7@;^?5E,oZ2EZf1,@N]2q@ruF'DIIR"
ATKIH<+oue+EMX9E$/\&Anc-oF!+m6F`_>6BlnVCFD,*)+EqO9C`m;0@<6!&A8,OqBl@ltEbT*+
+D,Y4D'3A#AmoguF<GC<@psInDf0VK+A$YtBlbD;F`&=9DBO%7AKYl%G]Y'LFCfDD+:SYe$<KMk
:.\2N3Zq!`+B1m#+B1d(:estT;HY,95sc\^8OHHK:JO2R8OZQ#6VgHV5tOfo8PV`N;GBGV8P`)(
=\i$?6U=U=+@/=i<E()/:EWD.<$4V3771'S73GQ#73G>o=B$D:5sc\m<(0V,%14Nn$;tGPDg#\c
@:DW=@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%17,oDfe,p+DPk(FD)dEIW]^CE[M;'BkAt?8OccQ
:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucsCggd`ATf7F%144#F(f-$
C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]'@:CE.%144#F(f-$C`k*GA0<OH+>7^W+t"p^
Df9_K-X:D)A7TCaFE:]/Dg<NS%144#F(f-$C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]+
CghU.ASr\>%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC.3N/8@ruF'DIIR"ATJu*Eaa$#
A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4DBNn,FD,_<Df-[kBl8'<
+CT.u+AH9S+EMgLFCf<1%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFCggd`ATfF1
$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*O@:CSn$6UI4BOu!r+=D2H+>%VG+=A^\
Df9_K-SK4QA7TCaFE9*WDg<]>$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*SCghU.
ASrk)$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUD.-p-Ch[d0GUXbGBk)7!Df0!(Bk;?.ATD4#
ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$p3
@N]2q@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!ED/XT/
+CT/5+E2@8DfQt:@:C?iBk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+F(HJ&DL!@8Bk)7!Df0!(Bk;?.
/Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+E(d5-RT?1%15is/g,:SEb/ltF*(u6+CT/5+DbIq+Co1r
FD5Z2@<-'nF!*%WBkM=%Eb-A)EcQ)=Et&I1+>=o`+>Y-\AS5O#4s2pJ-Z!4#A7]p,CggcqFDlFI
E,8s.E+No7%13OO:-pQUEb0*+G%De,Bk)7!Df0!(Gp$X3Eb/a&DfTQ'F!+n/A0>;sC`m5+DKKH-
FE8QV+DGJ+DfTD3ATDg0EcVZs;Is]`G%F?U@ROp?FD5Z2@<-'nF!*.G$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqPBPDN1F*(u4+CfG'@<?(%+EV:.+=M&7@OWF.DIak<Cggd`ATfLFA8,OqBl@ltEbT*+/e&.:
%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%15is/g+YEART[l+=M&7
@OWF.DIak4-u<=$A7]p5+Co1rFD5Z2@<-'nEt&IoATqZ--Z!4#-OgE#ATqZ--Z!4#A7]p3%13OO
:-pQUCh[s4+CTG%Bl%3eCh4`"Bk)7!Df0!(Bk;>p$?'Gt-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AZrf
DJ=!$+CQC&Ci=B/DJ()&Bk)7!Df0!(Bk;?<%16'JAKXT@6m,uXD/E^!A0>K&EZf:>ASu4"B-:W#
A0>AuDf]W1B-:`!@ruF'DIIR"ATJu.F!)lLA18X>EZccKE+No0A8,OqBl@ltEd9)d+A,Et+Cf>,
D..<mF!+n3AKZ&-DfTqB@;]TuARTY*+EVNEFEqh:/e&-s$7Kh'.3N,/DBNk:ASrW$Bk)7!Df0!(
Bk;?.;FNl>=&MUh73H#VA0=c=5t"LD9N`tj6$"/oDfm1>BkM+$+D#e:ARfg);FNl>:JOSd+Co1r
FD5Z2@<-'nF!+t$DJjB7+C\n)@q]:gB4YTr@X0(g:IH=8Df'?"DIdf@%14Nn$;No?+E)41DBNt2
@:V$8EbTW,%17#a+=Cu6@Us%n-OgCl$;No?+E)41DBNt2@:V$0DJXS-$8N`BA0<79@:CSn$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMkrD.Oi"Df'?"DIal1ATW'8DBNG-A7Zlm@<6-mEt&IBCht4d:IH=8Df'?"
DIdf2Eb0?8Ec*"/Dg5i(+Dbb5F<GU8F*2;@F"SS7BOr;uBl\9:+DGq/D'3P6+CQC5ATW'8DBNG-
A7[eE-o!.nB5_^!+=Jom+C\bi/g)97ASkjiDJ=!$+DGq/D0$h.Eb-A1ATMp$B4Z-,@;]U,+E_aJ
@;Kb*/0JMEEc5t@Eb0&qFCeu*Bl7O$Ec#6,Bl@lA+<X9P6m,uXD/E^!A9/l4ATDC$Ebuq1G][M7
F(of/+CT;'F_t]-F<G(,ARfLiDJ(RE+A$/fH#IgJ@WH$gCER%.8l%ht@rH4$@;]TuE,9)oF(HJ*
D..-p+Dk[4-t6V#ATDNr3B9?;D..-p/n8g:.3N&:A0>u*Cht52AKZ21@<<W;Dfm15Bk/h*$7QDk
:-pQUF)Po,+D#S6Df0-)F`S[DE+No0@rH4$@;]Us%17#a+=CkG@;R,q+Dkh6F(oN)+Co1rFD5Z2
@<-W@%13OO:-pQU@UWdiFEqh:Et&IpA0<lA$4R>;67sBi@:UL$@;]k%%17#a+>Y,r,U[&>D^Pu$
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+AZlkBl7K)8l%htA8bt#D.RU,@<?4%D@HqF:IH==@<3Q&G][M7F(of/
+=M2>Agnj5De!p,ASuTuFD5Z2/g*b^6m-#Y@s)X"DKK</Bl@l3@ps6t@V$Zj@q0(kF(Jl)GA2/4
+EV:.+=LuCA8#OjE%)oQATD64%13OO-u*[2BOu"!.3N\N@<ZU1+CQBh6q/;>ART+\EZfI4F)*BN
8l%htF`V+:8ge[&@rH6sBkMR/ARlo[6q/;>ART+\EZf:<+BN8pA8c[5+CT.u+A?KeFa,$MH#n(=
D0$h.DIal3BOr;1DfB9*+s:r?ASc0*@rH4$@;]TuDf-[l@:O@2%14Nn$;No?+Co2-E,8s.+A,Et
+CoD#F_t]-FCB9*Df-!kC2[WrASc<.0F\?u$;No?+Dbt+@<?4%DBNk0+DkP$DBMPI6m,;o7Nc5[
@s)X"DKH<pC2dU'BHS[O@:WneDKB&qASu("@;K1`De*Bs@s)X"DKK-&A7f@j@j_]m%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@KpRFD5Z2@<-W9E+*j%Et&IUBOr<)E+No0A8,OqBl@ltEbT*++E(j78l%htA7]@e
DIjr!+EM+&Earc*@;]TuAn?'oBHV8&FD*9L<+ohc-tI%&.3L$LBk)7!Df0!(Gp$g3ASuU(Anba`
FD5Z2.3NeFEag/-BleB;+EV:.+E1b2BJ'`$.1HVZ67sC%BQ&);E+*j%%16W[A0<Q8$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqPBOr;sH!t5t@j#B%Ebuq;AfrL4Bk/Y8Eb0?8Ec,q@A7]jkBl%i5@:F.tF<G[=
AKYK$DKKH-FE8RCAftYn@qZuqBk)7!Df0!(Gp%$C+EV:.+E1b2BJ'`$.1HVZ67sBkBk)7!Df0!(
Gp$X/FCAm"Et&I1+Co1s+>=63%15is/g+\=A0?=D0H_J\:-pQUBOPdhGp$g3Bl@ht$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMkrD.Oi.@VTIaF<GLBBk;1(@<?4%D@HqPBOr;Y:IH=HH#n(=D'3P6+CQC&Df'H0
ATVK+@;]TuA7]jkBl%?k+D#e+D/a<&+E(j7DdmHm@rri3EbT*&FCeu*E,ol0Ea`g%Bl7Q+Bl5%c
/g)99BOr<-H#n(=D'3>,DKBN5FE8RCAftM)DKTf*ATAo3AftT"@<6L$F!)lMEb/isG\(D.GA2/4
+=CT4De(4E/g)9<BOu'(FD,5.F*VhKASiQ+Ddd0t+CQC9@<-'nFEo!IAfu#$C1UmsF!+n3AKYK'
ART[lA1euI<+ohc@UX=l@j#3#@q]RuARfh)Eb-A-F!+m6D..-r+Co1rFD5Z2@<-W9DdmHm@rri8
BOQ!*@rH7,@;0V#+D,P7EZfFG@W,^jARfh'/g*Sk@q[!'E+No0A8,OqBl@ltEd8dAF!+n-F)N10
F)u80Bjl*pA0?)1FD)e*+Co2,ARfh#Ed8dG@VTIaF=n\(Bl[cpFDl2F+E(_(ARfh'+CT;%+CfG'
@<?'k+CT.u+Co&)FE2;FARlolF!,L7EHPu9ARmD&$7QDk:-pQUDdmHm@ruc7@V'1dDJj0+B-;D4
FD)dE@;9^k-Qli<AKZ).AKXT@6m,uU@<6L$F"Rn/@rH7$+>=63%15is/g*b^6m,uXDKBN5FE8RC
Afu//GT^I(F(o,,DdmHm@ruc7@;]Tu@<2kb:-pQUD..=-+Co2,ARfh#Ed8dG@VTIaFE8R5F!,R<
ATD?)@<,p%E+*j%+DGq/D0%<=$=e!lC`kGA$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMnlAKYr7F<G+.@ruF'
DIIR2+Cf>-@qBV$%16'JAKYT!EcZ=FA8,OqBl@ltEd8dGDBO%7AKYr#FD)e2F!,OCARfF_Cb?hQ
8TZ(hF!,R<AKYo/Cj@-GA8,OqBl@ltEd8dLBOQ!*@ps6t@V$[!De*QoBk:ft@X0(g:IH=8Df'?"
DIdf@+<X!^@psM$AKYi.F*&O8Bk)7!Df0!(Gp$sBA8,Xi@psInDf0V=@<,p%E-67MF!+$s@ps1i
+EV:2F!,"-@ruF'DIIR2+EV:.+<kcIF<Vi<Bk)7!Df0!(GqKO5%15[K-Z^DED/aE6FCB'/+EVNE
F`(`$EcZ>2DIal3BOQ!*H#IgJ@ps6tF`V+:FD,5.@rH7,ASuU2+E(j7FD,5.DffZ(EZen,@ruF'
DIIR"ATJu4DBO%7AKYr#FD)e+F`\aODfm14@;]t$F<G(,@;]^h+EV:.D'3P1+CT/5+Eq7>/e&.:
%15is/g+b?EcZ=FE+*j%+Co1rFD5Z2@<-W9BlbD=BOr<*F`\a:Bk)7!Df0!(Gmt*kBk/>?%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[bEb/[$Bl7Q+DIn#7A8,OqBl@ltEbT*+/e&.SAS,k$AKYi.A8,Y$Bl7Q+
FD,5.@rH7,ASuU2+E(j7@;^?5A8,OqBl@ltEd8dDATT;@+CfG'@<?''@3BH!G9A)ODg<NLA8,Oq
Bl@ltEd8d9DIal,@;BEsBlkJ>BOr<*F`\a:Bk)7!Df0!(GqKO5.1HVZ67sBjCi=B++E)41DBNJ(
@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBjEb/[$AKWCCDg<c@$>sF!A0<7ADg<]>$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqI@;BEs.!0BQ.3N%AE-67FA8,OqBl@ltEd98H$7QDk:-pQUDfB9*+EVOI/0Jb;
@Us%n+CT.u+DbIq+>"^XDg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a+?MV3FDlFICggd`ATf24
@:CSn$4R>;67sBpDKBr@AKZ)5Gp$gB+ED%%A1r.IBlmnq$=n*sATT%B;FNl>=&MUh74/NO%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@g!bFD5W*+CT.u+E2IFFD5W*+EqaEA90@4$;#+XFD,5.Anc:,F<GX9@ruF'
DBMLnF(&cn+A,Et+DGm>@3Bc4Eb$;6FDl2.B4W2oDIal1ATVs,AThKu+EMgLFCf;A+<XEtG9D*@
+CT;%+ED%%A9f;>D]gHIF`]&T@;]Tu-td+5.3N\MD.Oi6DfTB0/e&-s$:\`MF*&O7Eb/[$AKZ&4
D.Oi6DfTB0+EVNEF*)>@AM+E!.1HVZ67sBjEb/[$AKZ&4D.Oi6DfTB0%17,aDId[&4ZX]M0ea_)
0I/A,0H_K567sBuF_t]1Bk&9'Dfoq,$?Tj(F?MZ--Zj$9F!,1<+CQC7ATMr9De:,6BOr<)DIjr0
F`M%9FD,B+B.",qAo)BoFE9T++>P&i+=/-b0JF_+0JEqCF*VV3DesJX3ZrK)+=A:MDI[6#D/XH+
+EqOABHUnuASc'uB.",q@W-L&A3Dsr4<cL&BeCM`+>XH6Eaa'(Df0!"F$2Q,0eb:(.j-,\-pB\+
/g)l&GUXbA+>kh^$?^6#@rGmh4ZX^.3ZoelBPDN1BlbD7Dg*=HDJ<U!A7[+t$>!XUBK\C!-8%J)
+<VdL+<VdL+<XEG/g,7E@qg$-@:XOmEafIbAU&01Bk(k!4ZX]B+?CW!%15is/g+_ME,95uBlkJ@
ATD5h$@![D/g,EK$7QDk%17;tEb'5S3ZpLF-ZWX5A8c<-FCf]=+D,G.@<?Q5F*VV3DesJ;@W-L&
A0>o$FD5Z2@;L!-F`(o'De*E%ART(^+D#e:Ch[BnF=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M&F`]&T
BlbD=BOr;Y:IH=8Df'?"DIal3BOQ!*F*)>@ATJu<DfTB0/e&-s$<(AVAKYE!A0>H(@<6!&FD,5.
GAhM4F"SRX<+0QR+EMI<AKZ)/D.Oi3D]iP.DK]`3@q?d.Dfp)AASbs$FD,*)+EV:.+EqaEA9/l,
@<Q3)@V'+g+D#S%F(Jl)@V'.iEb-A4Ec5H!ARoLmB.aW#.1HUn$;No?+ELt7AKZ28Eb'5#$?1-0
+EqaEA9/1e%15is/g+_G@<6!&A7]@eDJ=3,Df0V*$>"6dF(HJ<DfTB0%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k:2b>!Eb0?5Bk;I!+EV:.+EMXCEb/c(GAhM4F!+n/A0>AqARfKuFD,*)+EV:.Gp$O9AKYr4
DfB9.Cj@.DATMs3Eb/c6%14Nn$;No?+D58-+EqaEA9/1eB4Z0-GAhM4Et&Hc$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l36uQRXD.RU,@<?4%DBLYf0b"IcDIjr/Aftr9+E1n6+E1n'G%G_;BlbD>DIdZqF_t]-FCeu*
@rGmh+Unbf$:o)Z+E(k6ASrW(@<Q3)H#IgJBOPEoFDi:6@:NjkBQ\3'Eb/d&/0Je<H"(>-FD,T8
F(&rsF"AGPAfto(DIml3De:,%De*E%GA2/4+DtV.Gp$N<@rH4$ASuT4Bl5&7BkM+$/g*N"D/Ej%
FE8R5Eb-A2Dfd+6DfQtEBl.g1+CT.u+D5D/Cj@ULASs+C<+Tl^Bl7Q+@rH4$ASuU2+CT;%+CQC+
@;Kas@<--+De:,)Df9//@rGmh/e&-s$;+)^+E2@>G%kJuF!+m6DKTf*ATAo3Afu;+H#k*MD]iS/
@s)X"DKI"FDfTB0/g+5/ASrW!+EqaEA0>T-+DG_8Ec5K2@qB0nBlk_D+CQC*Df9//Bk1d`+EVNE
F*)>@AKYD(F(fK4F<GL>AKYf'DIjr$ATM@%BlJ0.Df-\9Afu2/AKZ28Eb$d3$7QDk:-pQUF*)>@
AKZ&-DfTqBGAhM4+Co&)@rc:&FD5Z2Et&I1+?1K_F`\`REa`irDf$j`-ZWX5A8c<-Bl8$(B4Z*+
FCAWpAL@oo%14d33$<0_F<DrB@:Nsu4""HUE,96"F!,:1Aoo/(EbBN3ASuT4FDi:1EcPT6+DGq/
D0%'6$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqKAftT%F`MP7+F.mJ+Ceht+EhI1G9D0LF`JUGFDl22A0>Do
F(96)E-,f4DK?qEBln#2-td+5.4u&:.1HVZ67sBnATT&9BQ%p5+D#e:Cgh3iFD5Z2Et&I1+?1KV
ATT%BEa`irDf$j`-Y6^rBI=5r%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15gJEb-A(ATV?pCh7-"A8bt#D.RU,
@<?4%DBNFtDBND"+EMXCEb/c(@;]TuEb0?5Bk;I!A1f!(BPDN1F*(u4+Dbt)A9/l%+ED%%Ch[s4
Bk&8sG[YH.Ch4`-Afu;9Eb$;'De!p,ASuTuFD5Z2+DG_8D]j.8AKYK*EcP`/F<GOFF<G+.@ruF'
DIIR2+CT.u+EV:.DBNJ(F)Yr(H#k*PBln#2-tI%5E%*CK$4R=jA8-+(.3N>G+CQBb:IH=JFD5Q*
FEoJ]+A$YtBlbD=BOr<)DJXS@G%G]'+EV:*F<GU8FEMVAEt&Ib+Cf(nEa`I"ATAo0BleA=.!K?9
DBO"C@q0(kF(TQ2.3N>BF*(u%A0>f&+EV:.+E_aJ@;I&qDg5i(+=M8?4*G%KF_*!2$7QDk:-pQU
Ci<`mF!)l@BOPdkATMs6.3N&:A0<:1BOPdkATMs6.3N/>@s)X"DKK</Bl@l3Bl8$2+EV:.+CfP7
Eb0-1+E2IF+Co1rFD5Z2@<-W&$?K]tBlJ/:-[oK7A8c@,>\@VcATD3q>\\1f>\\1fCggdo>\mhX
AU%X#E,9)>0JP1oC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBPDN1F*(u4F!,"-F)Yr(H#k*MBOr<&
Df021A8bt#D.RU,+Dbt)A7]9oBl5&8BOr<*Eb0E.Dfp+DF*(u4/e&.:%15is/g,4KDg*=?Df021
A8bt#D.RU,@<?4%D@Hq,+?:QTBle59-Y$guDJ*O%FE/`<$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMYlEb-A4
F`__>DJ()#DIal&ATW$.DJ(R2$7Kk9F=A>@DIak<B4Z06+CT;%+E;O<FCcS,Ch7j*@VfTu@;]Tu
@ps6tF*)>@AKYQ%FD5c,+Dbt+@;KLr/g)99BOr<&De!3lATJu(@;[2sAKYl!D.R6#DfQt<F_tT!
Eb/c6%14Nn$;No?+ELt7AKZ).AKWC0C2[X"@;BF'+Dbt+@;KL.@r,RpF!,17+<koGGp3\)-Xgb.
A8PajALAU>F`\aPH9F;3DJWZgC2[X"@;BF]+DEGN1^sd$$;No?+ED%8EbT*.AKZ).AKWC0C2[X"
@;BF'+EqaEA9/l-DKKe>@;[28G^+H\+Dbt+@;KKa$7C(CGUFVHATT&@H4:2j$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l3;e9BX@q]RoB-:f)EZfREEb'5#$;>/LAKYi.F*&OGFDl2.B4W3,H#n(=D0$gl:IH=EEc6,8
A7]g)Amo1`Ch\!*ATJu+DfQtAARTUhBPD?s+EV:.+Cf>-FCf?3F!,C5+DGq=+Cno&@:EYdAM+E!
%16'JAKYhuBl5&7ARTUhBHUf'D/E^!A0>T-+=Lc<CagJTA8,OqBl@ltEd8dF@;TQuCh[s4F"&^N
$7QDk:-pQUCh[s4+CT)&+EV:.+EqaEA9/l3DBO%7AKYr#FD)e+AS5^pDJ=!$+EqOABHS[5FXIV*
Ch[s4+FPjbA8Z3+-Y.?I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-tI43.3N,/DBO"3@<,jk+D,P4+EqaE
A90:EFCfN8F"AGHEc6)>F"AGTF_Pr/F!+n/A0>_t@rcL//g)99BPDN1F*(u4+CfG'@<?(%+EMI<
AKYW+Dfp#?+CT.u+EV:.DBNb0F*)IG@;Ka&FD,5.B6%p5E-!.?DBO%7AKYr#FD)e=BOQ!*@V'1d
DBO.;FD)dE8l%i&%14Nn$;No?+CfG'@<?''F)Po,+D5_5F`;C2$>4Bu+=D5PEbTE(F!j$s@q]:g
B4Z.+E[M;'B6%r6-Z!^2FCfN8-Tc3^?X[\fA8PajAR?Qo/i4"E%15is/g+eIDfp#?+C\npBl7g&
DJ()9Bln#2-Z!^2-OgD<+>G!LDJUFCCi<f2%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-\!BOQ!*@<,p%FD,6,
AKYT-DJj_B@<-"'D.RU,+Du==@V'S$57IrdGp%!CG9D0LFWb@+G%De8Ec5Dq@Vg<4DJsW2@qB0n
FD,*)+DkP)Gp#^T6m,uXD/E^!A9/l8@;BEsBl8$(B4Z*+@<-"'D.RU,F"SRX8l%ht@<-"'D.RU,
+Cf>#ATJu&Eb-A3AftPkF(o,mCi"A>FD,]+AKZ)?E+O)A+E(_(ARfg)@rGmhF"AGPE-,f4DBNG-
A7]g)@;]TuEHP]+BkD'jEcWiB$4R>ABOr<)@VTIaFE8Qs:IH=HFDl22F!+n/A0>o(FE2),G%G_;
@;Ka&BOQ'q+E(_(ARfg)@rGmhF"SRX<+ohcDIn'7+EV%$Ch4`"Ble60@<lo:8l%htDdmHm@rri'
De*F#%14Nn$;No?+A,Et+E(_(ARfg)@rGmhEt&I)4<cI%BeCMd.3L/o+?MV3=&2^^+B1d.<$4\/
:K:46;cQCg73G;j6W-]&6qKaF8P`)I;HY@V$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqKE-,f4DBNA*A0>l7
@;KXiBk;<-@rGmhF!,O8Ch7*u+CT.u+Dl%-BkDW5DfBf4Df0VK+<XWsAU,D,Eb-A%Cht5.DKKH&
ATDiE+@^9i+Dl%;AKY])AoD^,@<?4%DBN@sDfp.E@<-"'D.RU,+Cf>#ATJu7ART*l8l%i&F!,C=
Ch[cu+CoD#F_t]-FCB9*Df.0:$4R>;Dg*=?Df9D6@<<W5Df'&.D/XH++=Lc<CagK:Df'?"DIdf@
%14Nn$;No?+=LlCDfp"M+E)4@Bl@l30d&%jD..NrBHV87AS,Y$.3L2b@psFi+DkP/FCfK6%14j5
0d("EC`k*A-OgCl$;No?+=M)8@rcK=+E)4@Bl@l31*A.kDIIBn+Cf>-FCAm$F!,OGEbTE(.3L2b
DJpY7@:O=rF!,a>F:AR6+>P'MDJUFC@<*_)$4R>;67sBt@;BEs@3BDq@rcK1@;]TuF(Jd#@qZun
B45Ll%14p7E-67F-Xh%9B4rYS8lJ)T8PiAn@;9^k?TTW167sBtGp$X9+Du+>BPD?s+A*bn@:O=r
-OgCl$8`k\+CoA++=CT<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37riNjE-!.1DIal2F_Pr/Et&IK:IH=E
Ec6,8A7]g)@3BW*D/a<&+Eq7>+EVNEB6%p5E$0@CEb'56@;]TuFCfN8F"SRX5p0f\Dfp"ABlbD*
+Cf>+Ch7*uBl@l3De:+a+EqaEA90@G+@.,kF_Pr/+DGm>@3B&uCi!ZmFD5Z2+E(j78g&4eF*&OG
@rc:&FE9&W+B`W*+CfG'@<?''@;]TuD/Ws!ApGM3Ec6)>F!+n/A0>r9Blmp-+EqOABHVD1AKWC6
Ec<HMG%G]'/e&.:%15is/g+YEART[l+CQC*Ec6)>+E(j7GAhM4F!,[@FD)e7@;TRs+C\npBl7g&
DJ()9Bln#2-Y$g;%16`gE$-NMATMs+Ec6)>-QkJnI4cXQDJUFC@q[5!$4R>;67sBjEb/[$AKYD(
FCfN8%14g4E-67F-YR(-Ci=N9Ebo864!ua*>9G:@8l%htFCfN8F!+n3AKXSfF(96)E--.DFD,*)
+ED%8F`M@B0ln]i-OgCl$;No?+CfG'@<?''@3BZ'F*&OGF_Pr/+>"^RDffP5Ch74#+CT;'F_t]-
F<G(3A7Z2W1E^=NE$-NMATMs7F_Pr/-QkJnI4cWs+CoA++=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqU
Dfm14@;[3(BleA=FD,5.@rH7,ASuU2+E(j7B6%p5E-!.?EZfFGBlmp-+EqOABHS^9Ec<H:$7QDk
:-pQUCh[s4+Cf>-FCf?3F!,C5+EV19FD#W4F`8I9Ec6)>%16`gE$-NMATMs+Ec6)>-OgCl$;No?
+Cf>-FCf?3F!,C5+EV19FE;S=FCd!GDJsW.+EM[>FCcS)De*E%Ch74#+CT;'F_t]-F:AR5+D5_6
+=D8BF*)JGBlmo6%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@;BRpB-:i-Dfp#?+CT.u+EM[>FCfM&$;YPN
+E(j7FD,5.D..-r+CSf(@;^0qB4Z-,De:,5FDl26DJ((a+Cf>#AKY])+A,Et+EhfY+CQC3Cgh$q
+EM%5BlJ/:BlbD=BOQ!*H#IgJ@ps6tD..-rFCAm$+CQBk8PVcL73HbbEcYr5DBNk0+CQC:DfTA>
+EV19F=\PIEc6)>+E)9CF*22=AKYE!A0>u-ASrW'ASu("@<?''D..=-+A*bmDdd0!F(96)E--.D
FD,*)+E_a:+Co1rFD5Z2@<-W9DdmHm@rucE+@KX[@:EYdAKYMpF(o9)ATDi7@ps1i+EV:2F!)ZF
DIjr6ATDj+Df-\9Afu2/AKZ)8F`_:L+q4kg$<1\M+D,P.Ci=N3DJ()+DKBB0FE8R5+EM77B5D-%
GAhM4+DG^9.!0BQ.3N8DDfp#?+CT.u+EV:.DBNS'DImisFCfM9F(96)E--.R%14Nn$;No?+DbV$
F<G=@F*),.Gp%3;@VfTuG%G]'%16odF`VXf3[Z$t-6tVp3[e8VHnHUM0n(6Z/g<"s0L.$l+D!/J
>:D!1$4R>;67sC%FDl22+DG^9E-67FA8,OqBl@ltEd8*$E-67F-Z!O?F*&c=$4R>;67sBpDKBB0
F<G:8+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$7L<T+>P'[AThu7-RU>c@:Wn]Ec<?h+?V#f
C3=T>-OgCl$;No?+Dbt7CNXS=-urmBD^cfCDBN\4A1hh3Afu;3FD)dFC2[WrASc<7%13OO:-pQU
B4YslEaa'$+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$8<T>Ci^pe+FPjb1*CUKG&J`U%13OO
:-pQUBkAK0BOr<&AS-$,@<-"'D.RU,+DGm>ASc'kARlp*BOr<!Ec6)>F!+n3AKYhuA7ZltDKKe>
-u<g1A18XB@rc:&FE7lu:-pQUD/=8?4s58++>P'[AThu>-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqOP
DfZ?p<+0i`F"AGMBkq9&F`:l"FD5W*+D58'ATD4$ARlp)@rc:&FE8uU@ps6t@V$['Bl.g*BkD'j
A0?)1FD)dh:IH=B@:O=rF"SRX5p/cq6m->T@rcK1BlbD*DBNA.@VKq)@<-W98g&1bEbTK7+EV:*
F<G(%DBND"+D,2,@q]Fa+CT.u+D#e/@s)m)A0?)1FD)dFEc!6X%14Nn$;No?+DkOsEc3(BBOQ!*
B4YslEaa'$F!+n-C`m\>F<G+.@ruF'DIIR2+D5_5F`;C2$>OKiD.-ppD`p-(-Vcu\+D58'ATD4$
AKYDtC`m\>F<G+.@ruF'DIIR2+D5_5F`;CL/5/Ma-SQZ[Ci^pe+FPjb1*CUKG&J`U-RU#a%13OO
:-pQUF*)>@AKYhu@rcK1/KePAA7Zl=0d(RLCi"/88l%htFD,B0+DGm>@3A/bF(96)E-)Nr1a$a[
F<DrJ@;BFnF`_8:E-!Bg1,1k*De*]n@rcJs$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNF`))2DJ()#+A,Et
+DkOsEc3(7F!+m6F(oK1Ch4`+@<?U&EZf:4+E)41DJ=!$+EV:.+CT5.Ec5o;Bjl*p+Co1rFD5Z2
@<-'nF!+n/A0?#9Bl7Q+-us/R+>"^VF`&==@:O=r/e&.:%15is/g+b;FCSu,@;]TuAU%crF`_1;
%17,m+=D#7CLqI-FD#W5F!hD(%15is/g+b;FCSu,@;]TuAU%crF`_1;F(oH%DKK]?+>"^[Bl%T.
Df0B:+Co2-E,8s.+D#e:Ch[BnFEo!=De*E%Dfp/@F`\'":-pQU0d(LR+=D#7CLqI-FD#W5F!hD(
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%15g<@rcL/+CT;%+Du+>+ED%7FE2)*FCeu*FDi9o+EM%5BlJ08/g)9>
Dfm14@;[2rCiaM;F*)>@AKXNC9h[)\9OUn3==bRs9h[)\<(0ng/0IYQ;G0DR=&(:h<E)FI+CT.u
+@94173HY]EbTK7F!,17+A,Et+Co1rFD5Z2@<-'nF"SRX:Msuo+A*bt@rc:&FE8R7@;[2sAKZ#9
DBNV2G@br/E\7e..1HVZ67sC%FDl22+A?3CAQU''1,::$@;]Tu85r;W+=K!$.3N_DG]\!9$8`lE
F`\`RCghEsGUGR.1-6j9/hS8?@8pf?+Cf>#AKWTX/gh)8%14p7E-67F-YRU=CaV;"1HQs,/hSb!
85r;W+Cf>#AKWTX/gh)8%15is/g,4WDfTD3=A;I3@;]Tu@<,gkFE1f1Gp$'T=B$Ck@X3',F"&^N
$8`lEF`\`RG\q7E4'53N?X[\fA7%DG4EP.UF?Xe[BlbD2F!,:-D.Oi7D/;<fFCfN84spdH%15is
/g*J`<(.pDF!,UCBl8$(Ec?&1FCeu*@X3',F!+n/A0>AjDBO"BDfTD3@VK^gEbT*++>"^RDfd+B
ARfXqD.RTqARloqDfQt:@<-!l+D,>(ATKI5$8`lEF`\`R6:jp"4#/]UEb/Zi?X[\fA7$HoE+*j%
+=DVHA7TUrF'N?hDImisCg:^nA6`kd@<6O%E\;'@Ag\#p%15is/g+VKFCcS9BmO>5De:,/@:O=r
%14p70f:(dATT%B6:jp"%13OO:-pQUD.-ppD]j.5G]Y'MH#R>9+CT;%+Cf>-FCB'/F!,17+EV:.
+DkP$DBMPI6m,uU@<6K!$;+5a;Fs\a?X[\fA7$l19L2WH=C5KODe*3++@oI+9OD4CDe*3++BV?3
?X[\fA7$l1<(0ng?X[\fA7$l16<R8V?X[\fA7$l19gMZM6r-lZ?X[\fA7$l1<E)FI?X[\fA7#cQ
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+A?]^A8,po+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ/'$<1pdA7]UrDKBo?
@<?''DffZ(EZdtM6m-)Q@<?X4ATJu<AKYl%ARlp)Df'&.GAhM4F!,17+E)CC+Co1rFD5Z2@<-WG
+<XWsAKYl%G]Y'LFCfD6Ci<`mF!)lI@:EbiD/_+AC3(gV%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqH
Ddd0!CggcqA8,OqBl@ltEd8d<F_u(?F(96)E-*]A$7QDk:-pQUBl8!7Eb-A'DfTl0@rri4@<?/l
$?'Gt4$"a2Dg<IA@:EbYFs(U0@OE:&+>Y-YA0<6I%13OO:-pQUCi<`m+CoV3E$043EbTK7%14d4
3\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm@WO2=@:EbiD/_+AC3(a3$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@Hq@F_u(?F(96)E--.DA8`T.Dfd+CFDl22+EqaEA0>o(An?!oDI[7!/g)99BOuH3
D09oA+C\n)B4YslEaa'$A1e;u.1HVZ67sC'E+EC!AKZ28Eb$;5AS,LoASu!hF!*%WF(fK9+D,>.
F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMGc
Ddm-k+ED%*ATD@"@qB]j$;+)^+D>2)+D,%lBl%L*Bk;?.AoD]4@psCuH"h//+E)CE+EMX5FD55-
DIIBn+CT.rCjC)9F!,C=+A*c#DfTB0+CT.u+EV19FE9&D$4R>ABOr;7B5DKqF"&5?DIak<F`V,8
.3NeFEaj)4@;]LiH$X$E@;]TuF*)>@AKYl!D.Oi1AS,LoASu!hF"Rn/.1HVZ67sBhDII@,H=\4:
@;TRs%16`ZF<DrAF*(i4-OgCl$;No?+Cf4rF)u&-Gp%!5D.Oi4F(HJ.DBNCsF(HJ1De!3lAKZ28
Eb#Ud0eje`Ci<d(+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=`8F*@ps6tF`:l"FCcS-Ci<ck
C`mq?Eb$;5AS,LoASu!hF"Rn/.1HVZ67sB7+DGm>FD,5.GAhM4+Cf>#AKWQIF*)>@ATJu,Ci<ck
C`mb0An?!oDI[7!%14d3B5DKqF!)i@F*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:CEb0?5
Bk;I!F!,OGDfTE"+ED%*ATD@"@qB^6%14Nn$;No?+D5M/@UX'qEb/ioEb0,uATJu+DfQsKA92j$
F=@Y+F`V,8+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k.!9TBF"&5@ARfXqATJu;ATE&=,'@s<
Ap%o6+EqL1DBNA(C`mq?Eb'56BOQ'q+EMXCEb/c(Eb/ioEb0,uATKI5$7QDk:-pQUBl8!7Eb-A8
Dg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a+?MV3FDlFICggd`ATf24@:CT,>9G^EDe't<-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@ps6tEb0?8Ec*":@;^?5Eb/ioEb0,uAKYf'F*)IG@<<W1
DI[61+B3#c+ELt.AKYr#FD)e<ARTUhBHV/'@q]:gBle,6BlbD>F(Jl)AoD]4Eb0?5Bk;I%DJ()4
AS,LoASu!hF"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!+E(j7GAhM4F!+q'B5)7$Bl7Q+GA2/4
+=D"R%15is/g,:XATJuB/g+\BC`k*B-OgCl$;No?+D5M/@UX'qEb/ioEb0,uATJu4Afu;9Eb'56
ASu$mDJ()9Bln#2-Z^XE$?^E$F!,l`+>=oo+CoA+-Z^XE$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMnlAKZ,:
ATJu:DJ=$,%15mMFD5Z2+>Y_pDe:+?F`V,8.3NYBFEMVAF!,R<AKZ,:ATKGGDJ=$,+E(j7@3Bc4
Eb$dF+B3#c+E_a:F"MNPBl@l3BlbD+@<6-m@;Kb*+CQC8DJ=*5AKYf'F*&O5Cht59BOr<1DfTB0
+E)-?FD,5.@ps1i+EVX8AKYo'+CQC:DfTA@%14Nn$;No?+E_a:F!,UCBl@l3De:,6GAeUJDfTB0
%14mG+E_a:F!*P*-Y$S$D/X?1F!,OHDK9H4ATMF)0II;:%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$
Bl7Q+Ci<`m+EM%5BlJ08%15^'6m,uJDBNS'DImisFCcRe+Dbt)A0>r'EbTK7F!,(8Df$V-Bk)7!
Df0!(Gp$a?Dfp#?/g)99BOr<!ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEFD,5.E-67F
A8,OqBl@ltEd9$R+EM%5BlJ/:F*1r&Bl[cpFDl2F/e&.:%15is/g+e<DImisFCcS2Ddd0!F(96)
E-)NrD/=89-ZaEJD/X?1-QjNS:-pQUF*2@RD/X?1+ED1;AKZ&*F:AQd$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku
$>jU#+CT5.ASu%"+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYK*EcP`/F<G^IATB/>+EMX5EccGC
/no'A+D,>(AKZ&4+EV:.Gp$U*DBND"+Dbt)A7]9oBl7HmE+NotASuU+Gp%$;+A,Et/e&-s$;PM]
ANCrNCi^_?@rc:&FE8R5Eb-A%A7T7^+EVNE:fThU8OHj"?Qa9-+Ad2iCh[BdC0r)qDfQtBBOr;r
F`MM6DKI"DF(KAE%14Nn$;No?+Dbt)A0>MrDImisFCeu*F(96)E-)NrCi<`m+=D5QDJa<1DC5l#
%16TRCi+*/DK?pU0JPF-+AP6U+D,b4C`k,\.3KaADIal-ATo7F0I\,]Df9N7+DG^91,(F?%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;8*EbTK7F!,C=+Co&#@;]Tb$;+)^+Ceht+CT)-D]i\(
DImisFCcS'DIal+Ddd0!F(96)E--.DGA2/4Dfp.E@rc-hFD5W*+Dbt)A0>r'EbTK7F"Rn/.1HVZ
67sBsDdd0!@UX=l@j#i7@<?4)FD56++D5_5F`7csChFk<@WQX"FE8f=$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@Hq$B4Z1*GUXbODdd0t+CT)&+EV:.+EqaEA9/l'@;KakA0>?,+CQC*Bm+'*+EqaEA1e;u.1HVZ
67sBsDdd0!@;Ka&GAhM4F!,@3ARlp*D]j(CDBL?<F*(i4.1HVsATVs;+=C]@FCB8=%13OO%15is
/g+tK@:UKpDKKe>@<,gkFE1f1Gp$pA@ps1bEt&IO67sB.F*(i4Ci<f2+D58-Ed/]SA92j$F=.M)
:-pQU-TO17+D58-Ed/]SA92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@9LHCM@[!+E_WG@;]TuEb0<6
DfTQ0B-:`!@ruF'DIIR"ATJ:f8l%htBlbD-@<>pe@<6!&AoD]48g&=rEb'5B+EM%5BlJ08+CT.u
+E)@8ATAo4Eb/`pDfp+DE,ol0Ea`f-FCf]=F"SRX9lG)p+Cno&@:EYdAKZ&>F*(u1F!,.)G%De5
ARTIt+D,P4+C\bhCM@[!+E_WG@;]TuEb0<6DfTQ0B-:_nFCAWeF(KD8@;]Tu8l%htA8c%#+CT=6
G@bT,/g)99BOr;7E+*6lA18XEATD6&@UWb^F`;CEF`8I3+Cno&@:EYdAM+E!.1HVZ67sC%@<Q3)
@3B#f@r$4++E(j7FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8*$E+*6lA0<7ADg<]>$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@Hq$E+*6lA18X2DfBE%F!,R<AKYK*EcP`/F<G+.@ruF'DIIR2+D,>(ATJu9D]j.8
AKYGj@r$4++EM[7A8-'q@ruX0Gp$O5A0>i3AS,Y$ATJu&Cht59BOr;uBl%@%+EqOABHU_+F`(o5
F_)\,G%G\:Bl7F$ARTXoDJ()$@:O(qE$0%@D.7's/e&.:%15is/g+tEF*&ODF`\a:Bk)7!Df0!(
Gp$R)@r$4++D,>(ATJ:f6:=CC4ZX^43dWJ%+@K$l<(LA';cI+28l%in@VR#.+AP6U+E2IF+Co2,
ARfh#Ed8*$A8-',6:"7O?U@.P;Cj1F/no'4-QjNS+<VdL+<VdL+AP6U+C\bhCNXS=Anc'mEt&Hc
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$7Kq+F*(qA+ED%7FDl22F!,R<AKYetF*&O6@:O(qE$/V8+EM+1ARfgr
DJ()$@:O(qE$/b,Ch7Z1GA2/4+EV:.+D>J%BOu7,+E2@4AncKB%14Nn$;No?+ED%7FDl22+DbJ-
F<G%$@r$4+%17,eF*(q8-Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgODJ()#+EM%5BlJ/:A9Da.
%14M&@:O(`.3N,@ART[lF!+q+DIIR2+C\bhCNXT;/g)9>Dfm14@;[2rCiaM;@UWb^F`8I6Bk)7!
Df0!(Bk;?.@<3Q%F_u(?F(96)E--.R+<X'pD/^V=@rc:&FE8R5Eb-A7Bl7R"AKXSfF(96)E--.D
FD,*)+Ceht+C\n)F`V,)+EVNE@UWb^F`8lS@rH=3+CT.u+Dk\1B4W2rBk)7!Df0!(Bk;?<%14Nn
$;No?+CoV3E$/S*C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*@<3Q"+EM77B5D-%A9Da.+EM%5BlJ/H
%172qH";&7E'66)F(fK9E+*g/?X[\fA7$Hr@;BEs-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%160MASrW7
AKYf-@:UK/FDlG8F_u(H+DG_8D]iI2DIn#7A8,OqBl@ltEd8dG@WQ+$G%De0Dg*=GBOr<*@<?0*
BlbD,BOPdkARmD9<+ohcA8,OqBl@ltEbT*++D>2,AKYGnASrW-ATDEpA1e;u.1HVZ67sBuATo8-
Bk)7!Df0!(Gmt*uATqZ--ZEm1H#R>4-QlV91E^UH+=ANG$4R>;67sC!E+Nnr$?'Gt-ZEm1H#R>4
-OgCl$;No?+Dbt)A0<:BDg>l9D/^p5$8<Va0H`J#4*s"2FDlG8F_u(,$4R>;67sBkBk)7!Df0!(
Gp$g=AoD^,@<?4%D@Hq`Bk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37VQaKC`mq?Eb'5#$<_:i+Du+A
+D>2,AKZ&4D.Oi(A7]0lDe:,9BOQ!*8l%htBlbD*Cht5&@W-C2/g+,3+DbUtEc*":DfTD3Eb/Zi
+A,Et-Z^D@De!p,ASuTuFD5Z2+CT.u+EDUB+EV:.+E)@8ATAnc:IH=A@:F:1+A$/fH#IgJBOQ'q
+CT/5+E2@>@VfUmF"AGRF_,W9Bl@m1+E)9C@rH4'Cgh$qFE8RDCh7$rAKYQ$@;0O#D.OhuF<G%$
CLqO$A2uY8B5M'kCbB49D%-g]$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%15g<Earc*
1,(FB%14Nn$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%14m6De't<-OgCl$>OKiE,ol/
Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt
+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0
@:WneDK@IDASu("@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk
:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3
C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HG
H#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY
7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?
+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7
DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/
DfTK%FED57B+52C67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._
67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g
+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?
A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is
/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8
@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=L
H$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5
+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-
%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]
F*(i.@q?)VA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3
+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is
/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:
E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-
Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4
+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-
7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu
@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is/g+4d78cQ?9h@K/+=Ci@
D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4
B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/
+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?
+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR1
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@
A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVp
B0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(
-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,
%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!
%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KP
ASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!
CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87
B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k
?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(C
B5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/
F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^
A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?
+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"
EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><
@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4
$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)
+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplL
I4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67F
DdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r
%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0
%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_C
A1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8
F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4
+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG
/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#
@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOs
Ec3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$
+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'
+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)
+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_C
A1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1
GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">
@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQ
AU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u
.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6
F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef
@p`YZDe*2tDETTpEb0E4+=ANZA8a(CDBNt2FEMVA/g+_CA1e;u-uLRgF"&4VINU3p4"u"*0d(O#
/heD\Ci<d(-9`Pi4YD.8D@Hq%%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A
+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY
/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^
DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA
+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+D#(tF<G(3D/E^!A0;<g6r-0M
9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!
Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@
5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(
Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi+B1Wn
+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#
F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH/mg@V
><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)-s^4C
5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7Ncea
Ec#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/>p(OM
+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=Jru
HXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(
HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBmATVEq
+D#(tF<G[:G]YTU@:O=rEt&IuF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1/p)>[
%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U+=]!\
@<--oDg-(.$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(
ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^C
E\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>
Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?
@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g,%SD.7's+E(j7DdmHm
@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRq
BkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+CoV3E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9
@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?
E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX
:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=
0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUu
F`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+A,Et+Eh=:@WNZ6H#RJ-
@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#
E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!
Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3
ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kkEbupHE,o]7D09K)
@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<+BosE+E(d5-RT?1:-pQU
0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1C2[X*F(KB%Df00$B4>:b1,2Nj/h1US
A9Ds)Eas$*Anbme@;@!,/M/)VG[YH.Ch4_]:IH=JF(KA7@rH6sBkMR/@<?4%DBO"1EbTK7/e&._
67r]S:-pQU<+oue+<Y`8EbTK7+DGm>+D#e/@s)m)A0>>mAoD^$+A,Et+E(_(ARfh'+<Y*5AKYK'
ART[lA1eurF:ARP67sBj@;[2sAKZ,:ARlp*D]j(3A7]@eDIjr!DIal"F`VYCD/"<-+Eh16BlA-8
+Cf4rF)rIADfor=/g+,3%15is/g,">CLnV2FD,B0+EM%5BlJ/:+CSc%Bm+&1+ED%2@;TQuBlkJ>
D]ie5A9Ds)Eas$*Anbm1Bkh]3@;]Tb$;No?+Cf>/Gp$gC/0K.NFD)eBDfp(CARoLsF"AGUD]j.8
AKYhuBl5&.De'u$Bl[cpFDl2F3XlEk67r]S:-pQUIUQbtDf0W$B4YslEa`chC2[Vl$;No?%15is
/g+,,AKYl/F`)7CCh[s4ARlomASc:/+CT;%+D5V2A0>AjDIdHl@<?(%+D,P4+ED%(AS,XoBln'-
DCuA*%15is/g,4PDfp/@F`\`RC2[X*F(KB%Df00$B.dn5F!,%=ARfk)Bl7Q+/hSb(%13OO:-pQU
:ddbqEb/ZiATAo-DBN\4A9E!.C`m5(@<6K4/KePGEcP`/F<GX9FED57B-:o0+EV:.+Co%q@<HC.
+Co2,ARfh#Ed8*$:-pQUAoD]4FD,5.=(uP_Dg-7FG%G]8Bl@l3De:+XA8bpg+AucZA7]d6+Aucl
ATT&,DfQt=FD,6++AbHq+ED%%A7]e&%15is/g*tY7T)Z@6q(!\@;9^kF`_>6?TgFt6TSIKEc5T2
@;R,VBl%@%+=MIo2CVlsA8bpg>X;k?Ddm-s+AucZA7]d(6pk3WART+\Ea1n?Ec4id1GURoG\&63
$4R>;67sC$ATMF)+A+#&+AbHq+ED%%A7]d(FDi:=@<?!m+A,Et-Z^D,6q/;>ART+\EZcqVA8`T&
DfQsKC1D1"F)Pl+/nK9=.1HVZ67sBW6q1'c@:Wqi?YWq23Zq6e7T)Z@6q(!\@;9^kF`_>6?O[>O
$;No?+CT).ATDZsFD5o0+@g*`F*)J5EbTK7+Cf>,E+*j&@VfTuEb/ZiATA4e:-pQU:ddcN76s=1
;I<jIDe+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*HBQ%s6B6A&rB6/61ATqBlF*;8/G;D!,AU%c6
%13OO:-pQU:i^,ZATDg&A0?)-@N]-#Dg-86EZf(6+DPh*F`_>6+Cf4rF)rHU+Co%q@<HC.+BN8p
A8c[5+@^'cAO^T_+Co2,ARfh#Ed8*$:-pQU='&HW?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[M
F'MFXH>.23@3A$REb/j$G[+ipEb/j$GV3QPAL@oo%15is/g+)(@rH6q@<-W9G@b5+@WHC2F(KA7
Bl5&.De+!4Bl"o%CghC++>"^HAS,@nCige$Bl7I"GB4m;Bl[cpFDl2F%15is/g+4s=#"&jC2[X*
FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm8T&W]Ec,H1+@UNoCi=?*Ea21)=AV[e;FN3,=@FSH$4R>;
67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?
=(uP_Dg-7FF*VhKASlJt$;No?+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'
Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HVQ6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZ
B6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,D..3k6=FqL@nKNb<+U,m
F##IF67sa)@;BF@@<6-m8l%iSATMs7+EK+d+DkP&AKXT@6m,rIF(o,,FCfN8+EM%5BlJ/H%15is
/e&._67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&F<D]EAfu,&DId[&Cj@.AEb&a%ARloU
:IH=7@<6-m%15is/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)E-*3F@ps6t+C\n)+EDUB/0H'V
FCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGg
ATMr9AoD^$BkM=)/e&._67r]S:-pQU<+ohc+EM7CAKW*<De:+7+EV:.+<Y<.DImisFCeu*+EM%5
BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gmt*U67sB/<(0_b6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$
@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.%15is/g,%SD.7's+E(j7FCfN8F!,17+EV:.
+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6$;No?%15is/g+SDF*2>2F#ja;:-pQU+<V+#:-pQU+<WBf
+@.,[Df00$B6A6+A0=JeA8-'q@ruX0Gp%Q.:IJ/N;cF25:-pQB$;No?+Eh=:@UX@mD)re]D]j1D
AKYN%3XlEk67r]S:-pQU+<XEG/g+e<DImisFCcS9@rc:&F:ARP67sB'+E(d54$"a(De*BiFs(O<
A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<Y]A+=D#7CLoh@F(o,V:IJ/nF*)IN%15is/g(T1:-pQU
+<XEG/g,1WDBNY8%15is/g)8Z-nlf*1+=>.C2dU'BHS[O8l%iS78m/=6=FqL@nKNb<+U,mF"V0A
F!hD(:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbRjY
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$>aWhA0<77De*s$F*(u6-OgE"@;BFQD/X3$8l%iS
ATMs71,2Nj/h1^HCLpF]DeioV:IJ/nF*)IGF"JsdD..3k+A,Et+EMC<CLnW1ATMr9F(96)E-*]>
:-pQ?:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(
8l%htF)>i2AI;1!/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)E-*3F@ps6t+C\n)+EDUB/0H'V
FCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+ALSa<De!3lAKZ22FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_D
F*&O:DfTE'B5VcC$;No?$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7
+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U67sB/<(0_b6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k
+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.$;No?+Du==@V'R&De:,6ATMs7+DG^9FD,5.-u*[2
F)>i2ATVL)FE8lRF*22=AM+<b67rU?67sBhF)uJ@ATKm>:-pQ?:-pQUG%G]'@<?4#3XSVK/db??
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f<]gCbRjV:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:@rGk"
EcP`/F<Dr?@<6!-$>aWhA0<77De*s$F*(u6-OO^!DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]4
8l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrE/ibOE3Ar!3
+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@
+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fq
Ec#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2
De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6s
BkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs
@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+A
C30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem
@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60
+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]
Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-Pn
E,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4
@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-
F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*m
Cj@.DARfXqD.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL
:/ihg8l%iC:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM
6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3m
FDl%G/.Dr,F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%
+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIq
F!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeY
F)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7
+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO
@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9
AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Aiq
3A*<P2(&h?7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<
77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%
E+EQkDdtG8De(J>A7c8X.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9
@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s
$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!H
DfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTu
Df-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\
+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dk
ATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo
<^fnb8P`)E3[ZU63A*<P2BXRoA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI
:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!
3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'
F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk
6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2
@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2
DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,
@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@
%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!
@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2
@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#
D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1
%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5C
F`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^m
FEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9
E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y
:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9
FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.
BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeY
F)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7
+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk                             ~>
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
zz=:zz,'moketest0 loadSmoketest1 loaddumpSmoke00 loadtest001dictionary''),(<'
zz=:zz,'<;._1 '' jodpurgetestdictionaries destroytestdictionaries''),(<<;._1 '
zz=:zz,''' jodpurgetests destroytestdictionaries''),(<<;._1 '' jodsmoketests c'
zz=:zz,'ompjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00 globsSmoke'
zz=:zz,'Assign000 globsSmokeDoc00 grpSmoke00''),<(<''jodstresstests''),<0$a:  '
zz=:601{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C7+>P&o1E\M4+>GYp1c?I22]sq4+>GYp2)cX42'=\/+>GYp2)6:/1a"Y0C2[Wl@<6-mFCfN8
F(/R!Bk&9-ATMs7+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7
@rc^5BHVD.F*)IG/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A7^"-ASuR'Df0Z.
F*)J7G][M7F(oQ1+EV19FE8QV+EV19FE8R:DfQsm:IH=:G][M7F(oQ1F)#W(Cgh?sATVL)FE;8,
EbAr+An>ClBjtmi+EV19FE8QV+EV19FE8RKBln#2Cgh?sAKYH)F<G1,@<6-lCh4`"@<>pmDe*g-
AT2'uATVL)FE;8:@:UL(@<-(#F`S[IATMr9A8,OqBl@ltEbT*+C2[X(D/X3$FCfN8F)u2:CLnW1
ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'4u$>OKiF*)G6F)uG7F*)JE
FE1r6F!,R9F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W3-D]j47Ed8dD@<-!l+Cno&@/            ~>
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
+Co&"6=FqL@k]Sk+Co&)FE2;FFCfN8A8,OqBl@ltEbT*++Co1s;f-GgAM>e\A8Z3^D/X3$0JFV[
E-#T46=FqL@k]V[ARn_VDeio<0Hb"EDdmcS@<6-m0JG4(B5DKqF&QpoCLoeQF(o9)0JG1'B5DKq
F&QpoCLonP@k]SZB6%riD/X3$0JFV^Ec>i/F@'DWBk&hO+Dbt)A5d>`CLqU!F*')YCi<`m;f-Gg
ATVL)F>4nSDdd0eF_u(rD/X3$0JFVcDdd0uATMrI0JR*P@ruF'DIIR2+E2IF:18!N<,$2\F*(i-
E-"?SF(o,<0HbCIF*(qZ@<6-m0JO\lATMs7FEM%?.4cl04?G0&0d%hd@WcC$A86$n+DPh*+DPh*
A8bp"C2[X"@;BEsC2[X(FDl22+DPh*FDl)6F!,49A9E!.CaUY_-p0UR/mg=U-Qm/BA7AtgBk)6r
F*)IGC2[WmEclG:FCfN8F!,49A7^"-ASuR'Df0Z.F*)IGC2[X!@<-!lFCfN8F!,49A8lR#E+*cu
FCfN8F!,49A8l[3B4Z0rF*(r,@ruF'DIIR"ATJu/De*g0EbAs*ATMs7+DPh*F)>i2ATVL)FE8R>
De*p2Eb0<5FCfN8F!iCf-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa
;HY,<@WQ+$G%G2QEcQ)=F!+q7Bl%<pDe*BmF*)G:@Wcd,Df-\,F_PZ&C2[WsC3(M,F_PZ&C2[X*
DJ=28BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*@V'V&+DPh*A9Da.+DPh*Bl8$5D]ie5A8lR-
Anc'm+DPh*F`V,7@rH6sBkLm`CERJ&CLoh@F(o,V:IJ/nF*)IGD..3k;f-GgAP,`d<+U,mF!,=.
DJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*AG4,Vh&.
2)%!D1G1RE1GCLA2)RB:1,(FA0KCmK/iYXB1cI*C1,^710JPO@2)70E2)-dC1bgsD2BXb/0fUjE
1-$sE0ebRA3&r]M+>PW*3&!3F0ePF>1cI*J1b^^.1,(F?0K:aB/i5IG1,gsB2_cF10JPF=2_m?F
2Dm?O3&NTO3?U(20f:XD0JY7=1H.'D1cRBK+>PW*2)$sE1bL[D3ANTP3AWZ<1,(F?0K1[@/iGLE
1,1UF2DQC10JPF=2_[!>2D[9I0f1jJ1*A>+0fUjE1-$sC3&!$G1H.6K+>PW*3&!3F3A**I0JGIB
2`EN81,(F?0K1aH/iGXK3&E<K1G^./0JPO@2)6s?3AEHH2)mBL2BXb/0f:XD0fL^@3&*BP2).$I
+>PW*2)$sD2_Hp@2E3HK1bpd.1,(F?0K1^F/i,IA3B8oM2_lL20JPF=2_m*?1H%'F3&WKJ2]sk0
0f:XD1,LUA1,:RA2`WZS+>PW*2)%!D2D-gE2_[-I0fLp31,(F?0K:aB/i5@>0K1pN1bg+.0JPL?
1GCU;2`3EI0KCpE3$9t10fLdB0Jb=?2)I'K3&i]L+>PW*2)$sE3A**H2*!EP0K(X.1,(F?0K1^F
/i,IE1H@?K3B/-:0JPF=2_m0A1cI0G2)@!F1a"P-0f:XE0Jb=<1,UjG1GppJ+>PW*2_[*D2(ga?
1GgpD2DR051,(FA0JtRB/i>==1c-sG1,^710JPL?3ANTI3&<<H2_[!E1E\G,0f:XD1,pmB2_[!C
2*!BI+>PW*2D?pA1bLUA2)[BR3A<B71,(F?0K1[D/i5CB1H@3N2)-4/0JPO@1b^j@1c@3F3&*-I
0d&5*0f:XD0fL^A2)[HQ3AEBM+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==1c-sG1,^71
0JPL?2)-s@2)$gC1bpsE2BXb/0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(gaA1c[?M1H%071,(FA
0JtRB/i>==1c-sG1,^710JPO@2)6m=3&!0C1H.6M1E\G,0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D
2(ga?1GgpD2DR051,(F?0K1aH/iGRG1c$mD2`Mp80JPF=3&!-@1H.0L0f1UE3?U(20f:XD0JY7=
1c$sE1GC^H+>PW*2_[$A1G1UD1c%*I1,(U/1,(F?0K1^F/i>CC3Ar`K3$9t10f:XD0fL^B1,h'H
3A`TM+>PW*2_[$B1bLaI0fLmI1,:R,1,(FB0JtUB/iP[J2D['G1G^./0JPL?1GL^=3&iWN1GUdF
2BXb/0fLdB0Jb=?2)I0I1H%$I+>PW*2_[$A1G1UD1c@3N1Gq'51,(F?0K:aB/iGXE0JGFC2)ud7
0JPL?3ANTI3&<<H2_ZsA2BXb/0fUjE1GCF?2)d9M1c76J+>PW*3&!3G0J5:A2_m?L2)m?61,(FB
0JtU?/iYOA2_[3J0Jah,0JPF=3&!-@2E3HL1H@3K3?U(20f:XD1,pmE2)R?Q2)[<P+>PW*3&!3G
0J5:A3&!$A2E<`>1,(F?0K1aD/iGRI1-%3P1H?R50JPO@2)?p=2`3QK0JYOH3$9t10fUjE1GCF?
2)m9D1,_-P+>PW*3&!3G0J5:A3&!'D1-%371,(FB0JtX?/iPXI0JG:<1bp1/0JPF=2_m?F2E*WU
1b^mF1E\G,0fUjE1,COC0fLdD3&<EM+>PW*2)$sD2_HmG0fV-M0fLs41,(F?0K1^F/i57?3&3<I
1,0n,0JPF=2_d6D1H7*L3A`EK1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*2)$sE3%d*H2D[9J2)I'2
1,(F?0K:aE/iPI?1c@$B1H6L40JPF=3&!6C1cI9L1H@0E0d&5*0fLdB0f1LB3AWKP1bgdB+>PW*
2_[$B1bLdC0etR@1H%!21,(F?0K1aI/i5FD1GC^D0JXb+0JPL?1,:d@3&WQL2E!EJ2]sk00f:XD
1,CO>2_m0H1GUgE+>PW*2)%!E1+kI>2D?g=0JbO.1,(FA0JtRC/iP^G1,UdG1E\G,0fLdD0fCXC
2`*9E3&NTM+>PW*2_[6I3A*9I1,LpD1,Uj11,(F?0K1aI/i5FD1c$gF1Gg400JPL?0ebU?3&iWN
0f([D0d&5*0f:XD0K(O?1c7'L1-%3H+>PW*3&!0C2_HpF3AEBL3A`N71,(F?0K1^F/i5FD3ArlP
2)cX50JPL?2).!A2`EQJ3&!-D1E\G,0fLdD0fCXC2`*HM1GgdB+>PW*2_[*D2D-pI2)%!K1,_'6
1,(FA0JtRC/iP^H1H%0P3&Vm70JPL?2).!A2`ETP2DR$G3?U(20fLdD0fCXC2`<KP0JtXB+>PW*
3&!3F0ePF>2)70N3AEB61,(FB0JtUB/iP[J2D['G1G^./0JPL?2).!A2`NTI3AEHP1a"P-0f:XD
1,pmE2)d?J1,LpL+>PW*2)%!E0J5.@1bppH1cI-31,(F?0eb:=/i>XC3&EBL1bp1/0JPL?1GL^=
3A<-I1,(X@3$9t10f:XD1,1C<2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*41,(FA0JbF?/ibX?
1,^mB0K:110JPO@2)7!@2`<WR1GLdD1E\G,0fLdB0f1LC0fM'K3B/oO+>PW*2_[$A1G1UE2`!0K
0f^s21,(FA0JbF?/ibXB3&`fN2)cs8-p07-1,C120JPO@2)7!@2`E`U2_m6M+>PW*2)$sF0eP@A
1bgsH1,Cj31,(F?0K1^F/i5@>3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0fLdE1,(==2`*?H
2)I0H+>PW*3&!3F1bLaA0f_0H1,Ld01,(FA0K([?/iGXF1,q3J1c6C20JPF=2_[6E2)?pG2)@!J
3$9t10f:XD1,(=>2)@$K3&WTO+>PW*3&!3F0ePF>2E3KL2E<`>1,(F?0K1aI/i5LF1bq'O1,0n,
0JPO@2)6s?3&icR2)$a@3?U(20fLdD0f:R@0fUpC3A`NK+>PW*3&!3F1bL^F3&WQI3&!341,(FB
0JtUA/iP^L2`*KK1H6L40JPO@2)7!@3&!3L1Gpm@2'=Y.0f:XE0K(O@2)I9O0fV'K+>PW*2)%!D
2D-mG2E!6J1c7*41,(F?0eb:=/iGCB2`EWK2DcO30JPL?2DQs=2E*HN1c-mH3$9t10fUjE1,LUC
0K2!L0f:^H+>PW*3&!3F1G1UF3B&cS0f(d31,(FB0JtUA/iYgH0fV0I2DcO30JPO@2)7!@2`WTQ
2)d3I1*A>+0f:XE0K1UC0K(aI2_[$H+>PW*3&!3F1G1UG2`3QM3&ET;1,(FB0JtUA/iPaL3Ai]S
3B83;0JPO@2)?p=2`<NN2`WlS0d&5*0fUjE1,LUC0JPRH0JYI@+>PW*3&!3G0J5:A2_m?L3A`N7
1,(FB0JtUA/iPdE0JPF>3B/-:0JPO@2)6s?3&`fQ2*!NR1*A>+0fUjE1,LUC0Jb[F2`*BK+>PW*
3&!3F1G1XG3B/iM1Gq!31,(FB0JtUA/iYjF2_d*F3&;[40JPO@2)7!@2`<WR1GLjC2'=Y.0fUjE
1,LUB2E3TN0fUjE+>PW*3&!3F1G1XH0KD*I0eje+0JPO@2)7!@3&!3L1Gpm@2'=Y.0fUjE1,LUB
2E3TN0fUjE+>PW*3&!3F1bL^I2_m?L0JYX21,(FB0JtUD/iPU@1,LdD3Ahp70JPL?2DQs=2E*HN
1c-mH3$9t10fUjE1,LUC0eb@C0JtXC+>PW*3&!3G0J5:A2_m?L3A`N71,(FB0JtUB/iP[J2D['I
0Jt:1-p07-2^C.40fLdB0Jb=?2)I<R0fD$I+>PW*2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA
1-%*M2)-4/0JPF=2_[-B1c@0E0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K
1Gq*61,(F?0K1[D/i5IF0f^sB2`Mp80JPL?1GL^=3&iZK0fCa@0d&5*0f:XE0Jb=>2`*9J1c.-O
+>PW*2)%!D1G1L>2DR0G1H7-41,(FB0JtUA/ib^B0fCaG0K(%/0JPF=3&!-@1c@<L2D[9P2'=Y.
0f:XD0K(O?2E!6I3&<EN+>PW*3&!3F1G1[C2_d<L0KD$?/1<V9+?:]&0JPF=2_[6E1c73H3&<?J
2]sk00f:XD0KCaB2)I-D1-%-M+>PW*3&!3F2D-pB2DR!C3B&'90JPF=2_[6E1c7*D3A``V3?U(2
0fUjE1,LUB2`*9G3&i]L+>PW*3&!3G0J5:A3B&`Q1GLg21,(FB0JtX?/iP[C2)%$M2_uR30JPF=
2_[6E1c7'L1Gq*K1a"P-0f:XD0KCaB2)I'B3A<?I+>PW*3&!3F2D-pD0K1dD3B8l<1,(F?0K1[G
/i5FB1b^[F1H6L40JPO@2)7'B2_[0F2D?mE3$9t10f:XD0KCaB2)I!I1c[QV+>PW*3&!3G0J5:A
2_m?M1cRE:1,(FB0JtX?/iP[C1GCaG2`2^50JPO@2)?p=2`<BL0fM*I2BXb/0fUjE1,LUB2E3TN
1,1^H+>PW*2)$sC3A*-G1bpaF0K(^9/1<V9+>Gi$1,(F?0K1[@/iGLE1,:X>3ADX30JPF=2_[!>
2D[9I1,LdI3?U(20fLdD0et@=3AriW1,1^E+>PW*2_[$A1G1UF1cRHN1Gq'51,(F?0K1aA/iG[D
1c%'L2`W!90JPO@2)6s?2`E`U1cR9F3?U(20fLdD0f:R@1,h0N1b^d01,(F?0K1[A/ibpN2DR!@
2)6:00JPO@1GCU;1c.0N0fUjI+>PW*3&!-B1G1L@3&WKF1H@<81,(FB0JbC=/i5CA2DHp?3B83;
0JPO@2)70E2)7*N2`E`W3?U(20fLd@0KCaF3&iZP2E!?I+>PW*2)$sD0J51:3&ruW2Dd341,(F?
0K1^?/i5:?1H%$F2E2g70JPF=2_[!>2D[9I0f1mM3$9t10f:XD0JY7=1H.'D2)$s31,(F?0K1[@
/iGLE1,1X?1G^./0JPO@2)?p=2`3QK0f1U?+>PW*3&!3G0J5:A3&!'F0KD*81,(FA0JtR?/i>XL
1G^^B0eje+0JPO@2)7'B2_d*G3B/cJ2]sk00f:XD1,1C>3&*BP1,_!41,(FB0JtX?/iP[D0JkaH
1GL"-0JPO@2)70E2`<KL3&i]P3?U(20fUjE1,pmC0f1X?1bpgC+>PW*3&!-B1G1L@3&`QO0KC72
0JPO@1GCU;1c.0M0ebCD2'=Y.0fUjC0Jb=<1cRHM1,UjG+>PW*3&!3G0J5:A2_m?M1GCO+1,(FA
0JYC@/i>OG1b^aB2DZI20JPF=2_d!=1c$g@0Jk[E0d&5*0f:XD0eb4:0fCmC1Gh'K+>PW*3&!3G
0J5:A3&!$B0Jta21,(FB0JtX?/iPXI0JG:<1bp1/0JPO@2)?p=2`3QK0JbC?2CU1*4>838-p014
/1<V7.4cl00I\P80E                                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
