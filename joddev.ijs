NB. JOD dictionary dump: 23 May 2018 22:28:25
NB. Generated with JOD version; 0.9.994; 5; 23 May 2018 22:27:03
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-16T14:58:11
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

EDCONSOLE=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR00407=:'ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot'

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.994';5;'23 May 2018 22:27:04'

JODVMD=:'0.9.994';5;'23 May 2018 22:27:03'

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
NB.   override mixed   allow mixed assignments (^:)=:
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
1,(I+1H-F3+?1K"2BY"&2Du[9+>Pku0f1"21E\G.+>Pku0ea_+1E\D1+>P_q0eje,1E\Ru1,L+6
+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt0ea_+1*ACr1bg+5+?)2$0fU:42BXb2+>l#!0eje-1E\\#
2DH=7+>Y_p0ea_-0H`+n1,C%.+?:Q!0H`2-+>P&p1E\\#1bp15+>Z##3$:+7+>t>u1E\Y"1H$@1
0H`,-+>P&p0H`.o0f^@22]sq5+>PVn1H7d&9i+P_7l3g\G%G]8Bl@l3FD,*)+CfG'@<?'k+EV:2
F!,"9D/a*$Ch6%'6VgHU:J=3!AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBN\(
Df0W7Ch4`-DBN"pDId[0F!,OLF*(u1F%A_c6q(!dEc6)>+CT.u+EM[>FCcS.ART+\EZek1A7\>Y
8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GF<DuQ
ATV[*A8,q'ATDBk@q@)\H:gt$Bl8$(Eb8`iAQ)Po:..BG7!!HYDId0rA0>B#Eb-@c:IH=>DKKH1
Amo1\8U=!)7!*?cCi`3E6rZrX9N*&^BkhQs.3N>BFCfK)@:NjkGAhM4F!)SsH:gt$F`_>8FCfK)
@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs
@;]TuA79Rk$49C$6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCbdd9gM-E:K1In7;ZICEc3(BAU&;>
FEqh:F"AGEAT23uA90dS8lJ)T8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE
7Q=+6=@GVR<^fo'Bm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%):I7NN;aWiM7;lXIF`V&$FCcS2
De!3l+DG@tDKKT)Bk;=++EV%):I7NN;aWoI<,Q,]AKYo#Ap&0)@<?4%DBNb0D/")7/Ke_@B4tjs
+Eh10F_,V:Ch7[/+Dbb-AScW7FDi:3CghBu:I7NN;aXAN=DqY\F`V&$FD5Z2+Dbt+@;I'#A7]Y#
BkD'jEZf=AAS,Y$<(0_b=[>bV78e5=F*&OAATMp$B4W3,GA2//BHSlL0d(CP+>=pVAnGLbATVs(
FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9@UWb^F`;D2DJXB*@<,jkF(Jd#@q]Fp+E2IF
+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1
ATD[0@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19
F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(JlkF_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7
FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'ARfLnFECr#1Lk*0@r$-.@;Ka&FD,]+AKWC=@;TR,
>@VJXF)tV<FCf]=.3N_@@VfUs@rH4'Eb0<5C3!m&Dg#]5+CT)&+EqL5FCcS9E+*6f+D,Y4D'2Fn
GAhM4F!+n/A0>r,DfTr2DK?q:De!3l+DtV)ATM@%ART[lC2[WnBk)7!Df0!(Gp%$7C1Ums+CfG'
@<?4%DBO+6EaiR%D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u+Eqj?FCfM9BOtU_ATAo-
DJ!g-D..O#Df0,sARoLs+Co1rFD5Z2@<-W9DdmHm@rud'FCeusF<G[:G][S0FDc2AFCB$*B4Z0-
DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E-#i.D..3k+CT.u+Dbt)A0=K?6m-,_
Dfp#8Ddd1#DfTB0Ci<`mF!,"-@ruF'DIIR2+EqaEA9/l-DKKe>FCB3&ATT&2De!3lATM`tD.R3c
FE;#<FE1f"FE8R5DIal"CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#ASuF/DJX?)E+<g(G%G]9F!,@=
F`)7CF*)>@ARlolF!+q+DIIR2+EVNECh[cu@<*K4AU&;>Eb031ATMF#FCB9*Df0W7@WZ1+FCB63
ASkmmATJu&DIal1ATW'8DK?q=@VTIaF<G[:G][nIFCB!%FE;DDFE8R5Cht59Bl.F&FCB$*F!*%W
F(Jo*-td+5@;Kb%F")-@Ch7$rASQ-oAnc-kC`l>G6m-M]E,9)oF(HJ8FCfE4Ec#i>DK?pm+DkOs
Ec3(A@rc:&FE;JEFE2MAF!+'tFCfN8+EM%5BlJ08F`:l"FCf3*A8PamBkCptFE;#8+A,Et+CSek
Df0V=D..<rAn?%*F!,RC+CfP7Eb0-1+Eh=:F(oQ1F`:l"FCf3*A92[3EarZkF_u)=F`:l"FCcS,
Bl%@%+DG^98l%iR:K::[73H,TF*)G:@Wcd,Df,                                    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1a10fU:2+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#70d&5-+>GT10d&2)+>GW*3?U%1
+>Pf/1*A;,+>G`11a"e$0fM*J+>GYp0ebCC+>Gl!1,:R>+>GPm3&`f>0f1"-0fD$70f1"-1GLR+
0f:(.0f_$41,0n,2E!E80esk+2)7-63$:(=2e$Z@;f-GgAM>f567s`sDJW6gDeio<0HbHh/KcHN
DJUaE@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf
+=M>CF*)/8A2#GTA8,OqBl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`
6rZTR<%i?)F*)/8A2#A?$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*2/78M1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#
+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8
+EM%5BlJ08%17,c+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m
;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0
@j#T+@:W;RDeio3%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*
;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR$4R>;67sBn
ASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o%15is/g,4F
BQ60r+?hi#/g)qm+AP6U+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN1a!o967sBQ
+EqaEA0>buD.Oi"CghC+%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is/g)8Z+@U*\
A7]9o+<X'd@ruF'DIIR26Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-+<VdL+BNK%
A5d&JEarcT:18!N6Yp1PF!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?+DbJ,B0A9u
-p22r0I\+q+=K>r0Ha.X8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cIF(8m'.3L/a
-nK]n/6>VF6sjA;De*3(4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'4&&".;GU7p
:dn`"C2[Wi.1HUn$;No?+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o:-pQU+<Ve<
D/aTB+<Y-%@r$4+@r?B2+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro@UWb^F`7cs
:-pQUEaa!$4ZX]5-QjNn+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS+<Vdg+=D&8
D.P>0Dfor>-OgCl$;No?+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o
:-pQU-Vcu\+=A9_+u(2_4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a9KF:N+=nX^
+=K?g@<-!0+=nWtEHQ2AAL9#n+ECn2B+51W$9g.jDe't<FCfN8C2[W:-QlV91E^UH+=ANG$4R>;
67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1
A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+D#S%F(HJ&
DL!@6@:O(qE-!-2$:IQN3Zrc1HS-F/:dJ&O?XH`2?XHE$6uQOL%14g4/1_nl0d/S82(9Y&+Co2,
+@8@e?XH2p/12o"Bkh6-%13OO:-pQUFE2XLF(Jd#@q]RoB-;D3ASrW4BOu3q+CT;%+Du*?@UWb^
F`;CE/KeVLE+NO$ARlopEcQ)=%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFC/i+ja
$4R>;67sBjEb/[$AKZ).Eb/f)@UWb^F`;C2$4R>;67sBmBl\9:+E(_(ARfg)@rH1"ARfgrDf-[L
+D#D/FEn<&4tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku
$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#Tt-Zip@FD>`)0II;:
+:SZQ67sC&BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;R
Deip+ATMrJ%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EMI<AKYGjF(o,,Bl8*&Ch[E&@<-"'
D.RU,F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*-OgE#ATAnK
+C]5)+=Aco-OgE#ATAo&DJUFL%16uaEZeh/C`khf-OgCl$;No?+EMI<AKYGjF(o,,Bk1dmFD5i2
ATJt'$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bh%14L;+C]5)+=ANc+>#Vs0HahBC`keoHS?RO
DJUFC/ghbN$7IVO@W$!)-RU>c/NP"/+C]5)+?M<)0d'qCC`k)X-Qij*-o)oSDJUFC-Rg/i3Zp1#
@W$!)4#)(;+C]5)+=Ach+:SZ+1E^.EC`k)Q.3L3'+>Y-LDJUFW0mb]!@W$!)-S?bh%14L?+C]5)
+=ANc+>#Vs1a$7FC`keoHScjSDJUFC/ghbN$4R>;67sB'@W$!)-S?bU$9g.j@W$!)-S?bh%14p7
4WktYDJU[Q-OgCl$=[FSDKTeZ3Zoe&-Qjr_,!$i$1E\1j+taud4#)(kDJUFC/gi(j/M8.n/gh)8
%15is/g+b;FCSu,Ao_g,+<YQ?DIn',F*(u2F<G%$@r$4++>"^IEcQ)=+D#e:ARfgnA.8l`ATAo&
DJUG)@:X7uD%-hiATAnI+C]5)+C\biDKTe*$>sEq+>G!JDJUG)@:X7uD%-hiATAnK+C]5)+C\bi
DKTe*$>sEq+>Y-LDJUG)@:X7uD%-hiATAnM+C]5)+C\biDKTe*$4R>;67sBT@;^?5De:,4ASkji
DJ=!$+EV19FE8R7EbTW0@ps1iGp$X/E+Not+E)-?FD,5.Ci<`mARlp%@VTIaFE9&D$;No?+A$/f
FD,5.Ci<`m+EMC<CLnW1ATMr9F(96)E--.D@<,p%@q]:gB4YTr@3BB)F<GL6+EV:.F(HJ9ATMs7
%15is/g,"RF*&O6AKZ#)G%l#/A1eu6$4R>;67sB'@W$!)-RT?1-tI43+=ANc+>#Vs@W$!)-RT?1
%15is/g)9GDJUFC/n8gBDKI68$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bU$4R>;67sB'@W$!)
-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP"`
DJUFC6;LBN-OgCl$;No?+<Y-2C`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq
.3L3'+C]5)+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0HahBC`k)Q%14L;+CoA++=ANc+>#Vs+>=pI
DJUFC-OgCl$;No?+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=pIDJUFC/gh)8%15is/g)hj@W$!)
-SAnIF`):K%14L;+CoA++=ANc+>#Vs0HahBC`keoHX^l/+=Ach%13OO:-pQU0HahBC`k*C@;TR'
%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'+>=pIDJUFC
6;LBN-OgCl$;No?+>=pIDJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i
3Zp+!@W$!)-V7'4-S.>7HX^l/-S?bU$4R>;67sB8+C]5)+=ANG$7IVj-Za-CCLo2!ATMrI-T`\s
D/X3$0iV_*F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-RT?1%15is/g)kk@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp."@W$!)-S?bU$4R>;67sB8+C]5)+=AdODfor>-OgD20fpb(D/X3$0N;V)F>,'k
+>#Vs0d'qCC`kepHX^l/-S?bU$4R>;67sB8+C]5)+=D&8D.P(($7IVj-Za-CCLo5"ATMrI-T`\s
D/X3$0iV_*F>5-l+>#Vs0d'qCC`k*HD/X3$0ddD;%15is/g)kk@W$!)-Z3@0AM.J2F`):K%14L<
4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+=D5IDeio<-S.>7HX^l/-S?bU$4R>;67sB9+C]5)+=ANG
$7IVj-Xq"4CiaH3CLo1I4""KUDesK3Deio=-T`\iDKKr:Deio<-T`\iDKKr:Deio=-Rg/i3Zp1#
@W$!)-RT?1%15is/g)nl@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)
+=AdODfor>-OgD2-p045/3GU3@6,h[/NP"0+C]5)+?MB+@W$!0/gh)8%15is/g)nl@W$!)-Z3@0
AL@oo-o!e2Bl8$6D/X3$0deCm/NP"0+C]5)+=Cl@FE;;;CLo4J%13OO:-pQU1*C%DC`k*C@;TR.
@rHL-F=.M)-o!e2@W-1$F)>i2AM>J\+>#Vs1*C%DC`k*7Df9G>/3>V6@W$!)-S?bU$4R>;67sB:
+C]5)+=ANG$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!0-OgCl$;No?+>Y-LDJUFC/gh)8-t7(1
+=Ach.3L3'+>Y-LDJUFC/gh)8%15is/g)qm@W$!)-SAnIF`):K%14L<4"#)lBlmp-D/X3$0deCm
/NP"1+C]5)+?M<)@W$!0/gh)8%15is/g)qm@W$!)-Z3@0AL@oo-o!e2F*22=ATM^,CLo4J.3L3'
+>Y-LDJUFCF*/i>$4R>;67sB:+C]5)+=D&8D.P>0Dfor>-OgD2-p045/3GU3@6,h[/NP"1+C]5)
+=D5Q-S.>7HX^l/-S?bU$4R>;67sB;+C]5)+=ANG$7IVj-Za-CCLo1o@:O=r0IJq0F)>i2AM?he
@rcKB-T`\sD/X3$0hl(dEc3WZ4"#)dDeio=9jqOPD_WUg+>#Vs1a$7FC`k)Q%13OO:-pQU1a$7F
C`k)X-OgD2@W$!)-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68$;No?+>b3M
DJUFCDIIBn-OgDX67sB;+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl$;No?+>=om
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X@rHL-F=.M)
:-pQU0H`(m@W$!)-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*C%DC`k)Q
%13OO:-pQU0H`+n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?+>=on+C]5)
+=AdODfor>-OgDX67sB7+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gBDKI68$;No?
+>=oo+C]5)+=ANG$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)+=Ach%13OO
:-pQU0H`.o@W$!)-SAnIF`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.EC`k*C@;TR.
@rHL-F=.M):-pQU0d&1n@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n
@W$!)-S?bU$4R>;67sB8+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P(($;No?+>Fun
+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach%14LmDJUFC
/gi(j/NP"/+>P'KDJUFC/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0
AL@oo:-pQU0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>-OgDX67sB8
+>Y-LDJUFCDIIBn-OgDX67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)+=ANG$4R>;
67sB9+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o@W$!)-SAnI
F`):K%15is/g)nl0d'qCC`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1*A=p
@W$!)-RT?1%15is/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9
+>P'KDJUFC/n8gBDKI68$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8D.P>0Dfor>
-OgDX67sB9+>Y-LDJUFC-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC
/gh)8%15is/g)nl1E^.EC`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)
-Z3@0AM.J2F`):K%15is/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp4$0d'qCC`k)X-OgCl$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFCDIIBn-OgDX
67sB:+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'KDJUFC/gh)8
-t7(1+=Ach.3L3'+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is/g)qm1*C%D
C`k*C@;TR'%15is/g)qm1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1%15is/g)qm
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC/n8gBDKI68
$;No?+>Y,r+C]5)+=D&8D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>G!JDJUFC
-OgCl$;No?+>b2q+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is/g)tn0d'qC
C`k)X@rHL-F=.M):-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1*C%DC`k)Q%13OO:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl
$;No?+>b2r+C]5)+=AdODfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'KDJUFCDIIBn
/n8gBDKI68$;No?+>b2s+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+C]5)+=Ach%13OO:-pQU1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'%15is/g)tn
1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahBC`k)X-OgD2
@W$!)-S?bq+>#Vs0H`(m0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68$;No?+>=om
+>=pIDJUFCDIIBn-OgDX67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun+C]5)+=ANG
$4R>;67sB7+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO:-pQU0H`(m
0d'qCC`k)X@rHL-F=.M):-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)-Z3@0AM.J2
F`):K%15is/g)hj0d&4o@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!
0d&4o@W$!)-S?bU$4R>;67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)+=D&8D.P((
$;No?+>=om+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?+>=om+>Y-L
DJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)-SAnIF`):K
%15is/g)hj0d&7p@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`+n
0HahBC`k)Q%13OO:-pQU0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl
$;No?+>=on+>=pIDJUFC/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7+>P&n+C]5)
+=D&8D.P>0Dfor>-OgDX67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach%14LmDJUFC
/gi(j/NP".+>P&o+C]5)+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU0H`+n0d'qC
C`k*C@;TR'%15is/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)-RT?1%15is
/g)hj1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7+>P&p+C]5)
+=AdODfor>-OgDX67sB7+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>=on+>Y-LDJUFC-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>Y-L
DJUFC/gh)8%15is/g)hj1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU
0H`+n1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o0HahBC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gBDKI68$;No?
+>=oo+>=pIDJUFCDIIBn-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)
+=ANG$4R>;67sB7+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach%13OO:-pQU
0H`.o0d'qCC`k)X@rHL-F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0
AM.J2F`):K%15is/g)hj1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!1E\Fq@W$!)-S?bU$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q+C]5)+=D&8
D.P(($;No?+>=oo+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo
+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir@W$!)-SAnI
F`):K%15is/g)hj1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-F=.M):-pQU
1a"Lq1,0n\DJUFC-OgCl$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)
+=Ach%13OO:-pQU1a"Lq1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU
1a"Lq1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn0d&5,+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)-SAnIF`):K
%15is/g)tn0d&5,+C]5)+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn
0d&5-+C]5)+=ANG$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC
/gh)8%15is/g)tn0d&5-+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'%15is/g)tn
0d&5-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X@rHL-F=.M)
:-pQU1a"Lq1,L+_DJUFCDIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq
1,U1`DJUFC-OgCl$;No?+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach
%13OO:-pQU1a"Lq1,U1`DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq
1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnIF`):K%15is
/g)tn0d&50+C]5)+=D&8D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&51
+C]5)+=ANG$4R>;67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8
%15is/g)tn0d&51+C]5)+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is/g)tn0d&51
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU
1a"Lq1,pCcDJUFCDIIBn-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,0n\
DJUFC-OgCl$;No?+>b2r+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>,+C]5)+=Ach%13OO
:-pQU1a"Or1,0n\DJUFC/n8gBDKI68$;No?+>b2r+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Or1,0n\
DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>P\p@W$!)-RT?1%15is/g)tn1*A>-+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P&p1*C%DC`k)X-OgCl$;No?+>b2r+>P\p@W$!)-SAnIF`):K%15is/g)tn
1*A>-+C]5)+=D&8D.P(($;No?+>b2r+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>.+C]5)
+=ANG$4R>;67sB;+>P&p1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,C%^DJUFC/gh)8%15is
/g)tn1*A>.+C]5)+=AdODfor>-OgDX67sB;+>P&p1E^.EC`k*C@;TR'%15is/g)tn1*A>.+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1a$7FC`k)Q%13OO:-pQU1a"Or1,L+_DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2r+>Pbr@W$!)-S?bU$4R>;67sB;+>P&p1a$7FC`k)X@rHL-F=.M):-pQU1a"Or
1,L+_DJUFCDIIBn-OgDX67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,U1`DJUFC
-OgCl$;No?+>b2r+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>0+C]5)+=Ach%13OO:-pQU
1a"Or1,U1`DJUFC/n8gBDKI68$;No?+>b2r+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Or1,U1`DJUFC
DIIBn/n8gBDKI68$;No?+>b2r+>Pht@W$!)-RT?1%15is/g)tn1*A>1+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>P&p2BZIHC`k)X-OgCl$;No?+>b2r+>Pht@W$!)-SAnIF`):K%15is/g)tn1*A>1
+C]5)+=D&8D.P(($;No?+>b2r+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>2+C]5)+=ANG
$4R>;67sB;+>P&p2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,g=bDJUFC/gh)8%15is/g)tn
1*A>2+C]5)+=AdODfor>-OgDX67sB;+>P&p2]uRIC`k*C@;TR'%15is/g)tn1*A>2+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>P&p3$;[JC`k)Q%13OO:-pQU1a"Or1,pCcDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2r+>Po!@W$!)-S?bU$4R>;67sB;+>P&p3$;[JC`k)X@rHL-F=.M):-pQU1a"Or1,pCc
DJUFCDIIBn-OgDX67sB;+>P&p3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\DJUFC-OgCl
$;No?+>b2s+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G-+C]5)+=Ach%13OO:-pQU1a"Rs
1,0n\DJUFC/n8gBDKI68$;No?+>b2s+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Rs1,0n\DJUFCDIIBn
/n8gBDKI68$;No?+>b2s+>P\p@W$!)-RT?1%15is/g)tn1E\G.+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y,q1*C%DC`k)X-OgCl$;No?+>b2s+>P\p@W$!)-SAnIF`):K%15is/g)tn1E\G.+C]5)
+=D&8D.P(($;No?+>b2s+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G/+C]5)+=ANG$4R>;
67sB;+>Y,q1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,C%^DJUFC/gh)8%15is/g)tn1E\G/
+C]5)+=AdODfor>-OgDX67sB;+>Y,q1E^.EC`k*C@;TR'%15is/g)tn1E\G/+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Y,q1a$7FC`k)Q%13OO:-pQU1a"Rs1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2s+>Pbr@W$!)-S?bU$4R>;67sB;+>Y,q1a$7FC`k)X@rHL-F=.M):-pQU1a"Rs1,L+_DJUFC
DIIBn-OgDX67sB;+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC-OgCl$;No?
+>b2s+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G1+C]5)+=Ach%13OO:-pQU1a"Rs1,U1`
DJUFC/n8gBDKI68$;No?+>b2s+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Rs1,U1`DJUFCDIIBn/n8gB
DKI68$;No?+>b2s+>Pht@W$!)-RT?1%15is/g)tn1E\G2+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Y,q2BZIHC`k)X-OgCl$;No?+>b2s+>Pht@W$!)-SAnIF`):K%15is/g)tn1E\G2+C]5)+=D&8
D.P(($;No?+>b2s+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G3+C]5)+=ANG$4R>;67sB;
+>Y,q2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,g=bDJUFC/gh)8%15is/g)tn1E\G3+C]5)
+=AdODfor>-OgDX67sB;+>Y,q2]uRIC`k*C@;TR'%15is/g)tn1E\G3+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Y,q3$;[JC`k)Q%13OO:-pQU1a"Rs1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+>Po!@W$!)-S?bU$4R>;67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCcDJUFCDIIBn
-OgDX67sB;+>Y,q3$;[JC`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%
$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GV
Df'H.;f-GgAM>f567s`tDf'H.;f-GgAM>e\F=f'eFCfN8+=L`<D/a5=+DtV)AKYo#Ap&0)@<?4%
DCuA*:-pQB$;No?+BN5fDBO%7AKW+:FE2)5B-8TU3[m3Q+<Y*3E+NHuF!)T>DBL'1+A*b!GAhM4
+<W(BDf'H..3NhKChsOf:-pQUDdm=$F(8X#AKYE!Gp"5GDe!3l+DtV)ATKIH:L[pYF(8X#ARlp$
@;TRs+<Y-)B5)6++EqOABHVD1AISuA67sC"Eb/isGT\+W:I7NN;aXAN==G@8@;]Tu+<Y65A0<"=
Bln#2+ECn.A8c<-+C\c#AKW*j5tsd69Me8G%15is/g,4XAnGb%ATJt:+Cf>-FE2;9Ch7-"+C]U=
+=L#P7TEAS6V^T0/g)8Z882^MATAn9+Eh10F_,V:+E(j$$;No?+=L#P7TEAS6V^T0+D58'ATD4$
AKYf-DJ*O$+CT.u+DbV1F!,:5CLq=-+EVNE@r,RpBHV2$D.Rc@%15is/e&._67sC(ATD6gFD5SQ
%15is/e&._67sB'+>G;f@<6L4D.Rc2FCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCb[jX$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't5
-RT?1%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B+CehrCcW[]
C1D9,-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?+Co%qBl7K)
GAhM4+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(.6T^7Ddm=$
F(8X#AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X
+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk
%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>
Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*lEZfI@
E,9H&+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)GA2/4+E(_$
F`V&$FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@$4R>;67sBs
De!3l+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D):
Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0BQ&*6
@<6K4Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-FD,*)+D58-
+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk+<t]@
@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I
-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$;No?+EMXC
Eb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQUEb/Zi+C\bh
CER&'A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO:-pQUCi<fl
C`me4DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=
?U6tDF)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs
+=o,fF)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S:-pQ_@rH4'
C/\tfCLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQa
FttirF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V
@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^sde67sB'+<VdL+<Ve8DIal-ATo7FF)>i2ALq;!
F(o,8Cgh?sALqnEEb0<5/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O.`:-pQU0fX#YGqq/uF`:l"FCeu*
FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1
+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ-
-Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FFDf'&.F*(i.
A79Lh+EqaEA9/l8D]iP.D/aN,F)qct9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!
%13OO@W-0-4Y@jtARTCkH#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8+?_>"0F\A-
An?3u@qB_&Bm+'/FCB&t@<,n"+?_>"@W-/o$4R>aBOQ!kEb/[#A79=`B5)6r@<6=)F*(i.A79Lh
@<>poC`kkn+C]8-+=\LZ%13OO-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh
6r-lZ-QkQ)+C]8-%13OO-V$j+6:":D+@TC"9N=JL6mk,Y+C]8-%14Nn$4R>REZfI@E,9H&+E2IF
+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+LC+$?BW!>9G;6@j#l<F=044+Cf>,E,$LC9Q+f]
:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo-OgD;+Bot0D/XQ=E-67FFEhm:$4R>`BQ%p54ZX]A+?CW!
%15is/g,%?D.Rc2@;Kb#ART+p+E)./+Cf(nEZcqVDJsV>@q]:gB4YT_$=Q(MGmt++4YC.c.NgJU
$@4if@3@$BGp"RZGmt*0%13OOATAo8D/a<0@j#`5F<DrPBQ%p5-OgE'@j"tu-ZW]>FEhmT4Z[(k
D/a54-Z`s>Ec`Z<$8EZ-+EMC<F`_SFF<G[MF:AQd$4R>\@VTIaFE1r)F$2Q,1E\_$0F\A'@;T@Y
DdmHm@rsjd+F,))67sBkD]iq9F<G(3D/aN,F)rIB@VTIaFE7luCi=B:?XIMb?XI_\C1Ums?XI;]
DJ"$4Bl@lP/g)nY$4R>QBl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?De!3lATJ:f
.1HUn$>"6#FDYu5Ddso/F`\`RDdmHm@rua&Aof=/$?BW!>9G;6@j#l<F=044@rH4'C*4mB@VTIa
FE1r)F!hD(0d'[CF)>i<FDuAE+EVjM%13OOB5DKq@;KsqAog*r1E\_$0F\A%Ci<ckCi^^K+CT;%
+=\LODfd*O+Cf>,E,oN2F(Jl).Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-YI76@UX(nAS-!2%17,c
+Bos9Eap56G]Y;r3ZqpND/a54-YI76@UX(nAS-!2%14g4>9J!(Dfp/@F`\aJG]XB%%13OOA7]7e
@<,piF(9--ATL!q+>b3%+>=63%15is/g+\9@r,RoARlp)@rH<tF!+n3AKZ)5F^o*1+DtV)ATJu&
DIakuEb,[e:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Et&Hc$?(*!EcPl)
AN`(eCi<ckCi_a#+F#"O:-pQ].OdM5+E)F7EcPl)AKYW%Ddm-kEt&Hc$=[pl4YCDdD`o^pDf7ck
+>Fu]+<VdL:-pQU-n6Z/3ZqmMD]i_3D]j.?D[d$_$>+3s?Z':hATKIHGp$X9/e&.1+<Ve9Df6aJ
+DtV)ATM3mDId='+<XEG/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdkARl5W+<VdL-[0,E
B4Z0-@rc^0@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.Rbt$>"*c/e&-s$>=?r
+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=C]2@r,RoARojlDfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]q
Df'H.+=C]2@r,RoARojlDfB9/-OgD;+Bot0D/XQ=E-67FFEhm:$4R>ZBm=3"F(9--ATL!q+>Y-$
+>=63%15is/g+tK@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k%15is/g,@OASrW!DL!@A
Bm=3"+EM%2E+O)5@<,p%A7]jo@ru9m+E).6Gmt*U67sC)BPDR"+EML1@q?csF!,L7D/XT/A0<HH
-td@7@WNt@Eb03.Ecc@3$;No?+CT.u+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/%13OOCi<flCcsBn
Gmt*sDe!3l4ZX]@+=\LMDe!3l%14Nn$4R>REZfI@E,9H&+E2IF+=D#?G\(E,@rH<tF!hD(Eap4r
+=D2>+EVjM-TsL5@rH4'C*4m@Bm=3"F(9--ATK4.$8EZ-+EMC<F`_SFF<G[MF:AQd$=e!lAp&0+
A927!E+O)R3Zp4$3Zp*c$4R>;67sBpAfu2/ATD?)@<,p%@;^?5DIIBn+Cf4rF)u&-Bk(RnBl@l3
Ble?<ATJ:f:-pQUCh[Zr+Cf>-Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&
/e&._67sC&BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt-$;No?+Eh=:
@N]2mFCes(F!+n/A0>o(E,Tc=F!+t2DJ"$4ARlooARfObEaa'(Df0VK%13OO:-pQU@W-0-BlbD-
ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k+>"^KD]iY+B6A6+%13OO@W-0JGp"4P+<VdL+<XEG/g)Pl
.6T:+@W-/o$>=?r4YC2^D]gMPGp"5)67sB/.OdMA+C]8-%14Nn$4R>REZfI@E,9H&+E2IF+=CZ;
DJ"$4ARojlDfB9/-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=CZ;DJ"$4ARojlDfB9/-OgCl$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$ATVL)FC])q
FD5Z2@<-'nF!,QV/KePDART[lF!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?
+B!?"+=Lc3F*)G@H$!V=FC])qFD5Z2@<-'nF"&5NEbTH4+EVNEEcl8;Bl7Q9%15is/g)8G$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130em9O@PK\K$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>GTf@<jR`+Dl%-BkD'jA0>u4+EDUB+EqOABHV2(G9A;JC2[W3+DG_8ATDBk@q?d!De!3lAISuA
67sB80lCoQ1,0n"Ec#i8DfdEN@:Wn[A0<HH@:X+qF*(u(+EVNEEcl7BDf-\,DffY8GA1r*Dg*<N
+Dbb0Fa+?&:-pQU0fNiiDDEmgFCfN8+Co1rFD5Z2@<-'nF!+q4@;]UeA0<HHD/XH++CSekARl5W
:-pQU0fX#YGqq)sBl8!7Eb-AB8l%iS78m/.A8-'q@ruX0Gp$[CBleB;%13OO@rGk"EcP`/F<Dr?
@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dE
IS*C(<(0_b-OgCl$;No?+EV19FCfJ8F`_>6F!,:;@:UKpDKKe>-u!F7A18X;De!3lAISueAT;j,
Eb-@@C2[X)ATMs)E[M;'%15is/g+YEART[l+EV13E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!Tl
F)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUA7]@eDIjr4ATMr9F`_>6Et&IuATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$4R>;67sBUDffPO+EV:.+FZpY6rZTR<$64"Dfd+=F`VXI@V$['ATT%H
+E_a:+A*bdDf00$B6A6++:SZM:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+B;0(
+EqO;A8c[5+Dtb4GAhM;+EDC=F:ARP67sBQ:IJ/N;cHXj:K0J<+=CE!D.R3eDIIT?0O/aAATDis
C1Ld^CLqNkC2[X)ATMrJ-OgCl$8EZ-+DkP&ARoLq?X[\fA7$HA8l%iS78m/`:JXq!$4R>;67sBh
A867.F<GX@@<6*)AoD]4Ch[d0GV<oB@grc;:IJ/N;cHXj:K0J<+EV[@@<6*;?X[\fA7$HO:IJ/N
;cHXj:K.c1%15is/g+YEART[l+D#D/FEo!NATMr9A8,OqBl@ltEbT*++>"^WATW$.DJ(([:IA,V
78?fM8OHGd$;No?+EVNE0Hb=TATMF'G%G_;FD,5.FD5T'+EMX5D/^V,Ea`ir/e&.uDEU$.FCfN8
C2[W:0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M
/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV
6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0JOpa$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2#bd%16Ze+Dtb7A0>E#
4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf
<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4
ATMs.De(OX-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi
-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V
78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W:1a`_>ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@Hqa
EZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL
+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0Jt3e$>"6#DIn$&
+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b
;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;
3[]#\F*)/8A2#nh%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$g
De*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ
6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(O\-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt
%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@Hqa
EZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W:3%#.BATAo2
ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
A8XOk-Zip@FD>`)0KCKi$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2,bc%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f
/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#
%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(RW-OgDo
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4
:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd
$4R>QDEU$.FCfN8C2[W;1+*M<ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0f(0d$>"6#DIn$&+Co@O8l%iS78m/`
:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip
+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2,ng
%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f
-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep
0H^f3%16W`4ZXs4ATMs.De(R[-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`S
FE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+
A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>;67sC!Eb&a%+E(j7D..'pBlnK.AKYMt@ruF'DIIR"
ATJ:fA8XOk-Zip@FD>`)0eb:/%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuR
F*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!
E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%15is/g,7[D]it=A7]e&+E(j7D..'pBlnK.AKYMt@ruF'
DIIR"ATJ:fA8XOk-Zip@FD>`)0eb:8-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\
F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$
DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1G
DfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?\67s`uATMs6Dg?G9
F*(r,@ruF'DIIR"ATJu9/M/)UATMs6Dg?CH8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?
+CT>4F_t]23ZohcDe*s$F*(u6.3N>G+CQC/Ddd0!F(96)E-)Nr:-pQU+:SZQ67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;D..]E1CX[d67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,0n"
Ec#i8DfdEN@:Wn[A0<HHDJs_AEcl8@+E)-?=(uP_Dg-7F@;]Tu9PJBeGRY!T67sB82emJQ1,'h[
@<6-m+Cf>-Anbm#FCfN8+CSekARl5W%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL+A,Et<(0_b
+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>;67sC&ATMr9
F`_>6F!,:;@:UKpDKKe>-u!F7A18X;De!3lAISueAT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBkAS,XoAKZ)+F*&OIFD5Q4%172gF*(u2G%ku8DJ`s&
F<DrDDf9/64"!Wr6miEN%15is/g,:SEb/ltF*(u6+CT/5+EV19FD>`)+Co1rFD5Z2@<-'nEt&I?
HS-F/8OHHU4ZX]B+E(d5-RT?10d'[C6qKaF;a!/a0d(FL@r!2T8OHHU%14g4>9J!#Dg-//F)rHl
8OHHU4ZX]6HS-Ks+@Jdg<)Y4g,CUac/h\D'+=Jd%-Zip@FD>`)-Rg0,/g*?)/g<"m6qKaF;[j'g
+BosE+ED%+A0sJ_6qKaF;[j'C$;No?+Co&)FE2;F+CT)&+CfP7Eb0-1+DPh*FCfN8+Co1rFD5Z2
@<-'nEt&IO67sBUDffPO+EV:.+F\'DA9;C(F<GUBDfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$
B6A6++:SZM:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+B;0(+EqO;A8c[5+Dtb4
GAhM;+EDC=F:ARP67sBQ:IJ/N;cHXj:K0J<+=CE!D.R3eDIIT?0O/aAATDisC1Ld^CLqNkC2[X)
ATMrJ-OgCl$8EZ-+ED=>Df9_?8l%iS78m/`:JXq!$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is
/g,1GDfB9*+CT/5+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&A8,RQD/X3$0JH6g/h1CGA5d>`CLo1R+ET1e+=Lc7
A18XBD/X3$+EV19F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b
+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQU+<WHh+AtWo
6s!8X<(.pOATMr9A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8A2#\g+EV19FD>`)0JP+$
FCfN8C2[W;0J">gATMs.De(RV0I\+R$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,A7]7*3?VgMDK]T3FCeu*FDi::2D-[=
+A,Et%15is/g)l'DJs\Q3$<?_A79RkA0>K&EZdt502-(tFa+?&:-pQU0f<]gCbRjlEb0,sD.R6#
-tI%&;f-GgAM>ee+D,Y4D'16;Bk0P=F(o,<0JP"!%15is/g)8Z+<VdL+<Y]IDBNY2+DQ%:CERG3
@ps1b%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(
Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2
AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU
/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$;No?+EV:.+Co1rFD5Z2@<-W9
Bk1dmFD5?$@psInDf-\@ATD6&-tI%&.3N>;DJsQ,F!,1=-Z^D=EbBN3ASuU2/e&/!EZf:2+EV..
@rr.eATAo(Bk/>?%13OO:-pQUDKTf*ATAo3AftVu@ruF'DIIR"ATJu4DBNn,FD)e6F`VXID..Nr
BFP;'+?^hl+FPjbA8,Qs0F\?u$>"6#De'tP3[]#\F*)/8A2#_\FCfN8C2[W;0HbIKF*)/8A2,bl
-OgCl$8`kg+<r"W/g+\=A0<Q8$4R>REZfKf3Zp+!A8,Qs0F\@H+?^hl+>G!XBk(p$FW_f%67sBp
DI[L*A7]g)BOtU_ATA4e%16Ze+>Y-YA0<rpFC])qF=\d^FCfN8C2[W;0JFj`$>"6#FZhc.A8,Qs
INU<R$8Wef+<r!`+E2%)CERa/$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWDJW6gDeio<0MXqe
.V*F5;f-GgAM>e\F=f'e-tI43.3N\KDeio,FCfN8F"Rn/:-pQB$;No?+@BgR@r$-.+CT)&+<Yc>
AKZ/)Ch[E&+CT;'F_t]-F<D]9@<6"$+<YT7+<W(CDJUaS+<XF%D.Ra+F`S!!:-pQU,&Ut#Ebp"D
@rHC.ARfg++DG_:@;KXg+Cei$ATJu&Eb-A%CiaM;FCfN8ARmD&$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,C%qE+EC!
ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2
?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq
4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])qF:AQd$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>
F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+
,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sC!DJXS@E-67FA8,OqBl@ltEd8dAF!,C=+EV:.+E1b2
BFP;(+?^hlA8,Qs0F\?u$;No?+Co1rFD5Z2@<-W9BlbD.D/aTB%14d34Wkt5+>G!c+>=pKDJUFC
-OgD:+?^hl4s2R&HQY$cA8Z3+-RT?10H`M$,<d5)+F>4d+CoA++=ANG$8<Sc+<s&m0d(fc1E^4G
C`k)Q%14d34Wkt5+>G!c+>b3ODJUFC-OgCl$;No?+DG_7ATDl8F)Po,+Eh=:@WMtcG&C`*ATL!q
+=CWBEb$jH@Wuj'0d'qLEb$pJ@Wuj'1FEV=@Wuj'0KhH>4Uha-GB.4K4ZX];%16QgEb$pg3Zp4$
3Zoep+=\LZ-OgDlGB.4M4ZX]?1E\_$-[6ac+>P&h+F,=D$9g.jFDYu5Ddso/F`\`f3d,CLD.Rbt
$4R>;67sBpDKBB0F<GXCD.Oi-Dfor=%16uj@;TRs4ZX]5DKg,30Hb7WEb$mIDKg,31*CIYEb$sK
DKg,31a`_>-p'J-DIIBnF"'75+=JU[B5Di9@rHR#Dg?CO.6Aql/g)nl1FYC60ebgH0I](33&r*-
+?q_+1*ee;.6BY73[]&fBk)'lAKYi$+C]A0-OgDH0RInYE,9H&+E2IF+?MW%DIIBnEt&Hc$4R=j
A8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs%14L;+CoA++=ANc+>#Vs0d&P#-p'J5
DIIBnF"&4_+?MW%DIIBnEt&Hc$7ISN0d("EC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"
ATJt::-pQUASlC.Gp%<LEb$;3Eb/isGRY!.0H`+nA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a
4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+DG_*Bm:'o-nlc"+CoA++=ANc+>#Vs0d&P#-p'J5DIIBn
F"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>r9AnGb%%13OO-nlbu+CoA++=CWBE[N:Y/NP"/
+?L]-3d,CLD.Rc2+<VdL+<Ve%67sC)DfTA2E,oN%Bm:'o-nlc!+CoA++=Aun.3L3'+>G!#+?MV3
DKg,31aaCg+<VdL+<Ve%67sC)DfTA2Bl7NsGRY!.0H`.oA8Z3+-Y+qZ.3L3'+>G!#+?MV3@Wuj'
0d(@XEb$mP+<XEG/g,@VEb$;6F_56"GRXuh$>sEq+>=ol+CoA++=ANZ:-pQUEHP]+BkD'jEZeq6
Ec5u>%16uaEZd%Y1a$=HC`k)Q%16uaEZd%Y0H`%lA8Z3+-RT?1%14L;+>Fum+CoA++=ANc+>#Vs
0d&P#4$%7s@;TRs+<VdL+<Ve%67sBlD/aTB+EqaEA0>i3AS,Y$+=M,GF`)7L%14L;+>Fum+CoA+
+=D&NEb%!S.3L3'+>G!#+?MV3DKg,31aaD@67sC)DfTA2E,oN%Bm:aKDJsZ8F"%P*-nlc!+>=pK
DJUFCEb$sR.3L3'+>G!#+?MV3DKg,31FF:f+AP6U+EqaEA0>T(AncK4-uNsGDK@69$7ISN1E\@o
A8Z3+-Y+qZ.3L3'+>G!#+?MV3DKg,30de(d+<XEG/g,@VEb$;6F_56"GT\DPDfor=.1HUn$>sEq
+>=op+>=pKDJUFCEb$O?+AP6U+E;O4Ch[KqATAo)EcQ)=Et&IoATAnI+>b2s+CoA++=D2?-QjN@
$>sEq+>=ol+>Y-NDJUFCDJpm3$>sEq+>=ol+>G!LDJUFCGB.V>B.",qDImi20H`%l1*C+FC`k*6
B45Ll-OgD*%14L;+>Fup+CoA++=ANc+>#Vs0d&P#4$%P&@;TRs+<VdL+<Ve%67sBlD/aTB+EqaE
A0>i3AS,Y$+=MDEEaj)=%14L;+>Fup+CoA++=CWBEb$sR.3L3'+>G!#+?MV3@Wuj'1FF;?67sC)
DfTA2E,oN%Bm:aKG%G]'F"%P*-nlc!+>Y-NDJUFCEb$sR.3L3'+>G!#+?MV3@Wuj'1FF:f+AP6U
+EqaEA0>T(AncK4.!B0B@WNt-$7ISN1E\IrA8Z3+-Y+qZ.3L3'+>G!#+?MV3@Wuj'0de(d+<XEG
/g,@VEb$;6F_56"GT\DXATD7$.1HUn$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y"+sATU7IF(o,<
0ht%f.V*L>ATU7IF(o,<0d(Qi/KeM2F(o,,-tI:<ATT@DE+*cqD.Rg#EZfF7F>%-;@;]^h+EV19
FE9&D$;No?%15is/g*H$F*2>2F!(o!:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.
De(OU.3N2HBleB;/g(T1:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(F<DJs\R0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,0nL:JXqZ:J=/F;BU'mF*)IG@:Wn[A.8kT
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g,@VEbce3DBNG*ARTU%
@UX=h+E)9CFE1f2BHV,0@ps1b%16T]ARTU%-RT?1%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5
?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq
4ZX]5FCfN8C2[W:0II;:%16Ze+>P'XA0>u)Bk)6-+<VdL+<VdL+AP6U+E)41DBMhG5t"LD9N_f3
DImi2A8lU$F<Dqs;aX,J3&N'F0d%T667sBj@;]t$F<G(,@;]^h+E1b0@;TRtATA4e%15is/g,1G
DfB9*+DG_7F`M%9;FNl>=&MUh71BT8EZf:2+EV..@rrht+>Y-YA0<6I%16Ze+CoG4ATT%B;FNl>
=&MUh74/NOATAo(E-#T4+=BHR6V0j/2((I?%16Ze+CoG4ATT%B;FOPN8PVQA741/O%13OO:-pQU
D..3k+ED%%A0>f.Cj@-T+Cf(nDJ*N'GA1l0+D,%rC^g__EZen3F(KG9-W3B!6r-QO=XOXcDImi2
A8lU$F<Dqs;aX,J3&N'F0b"I!$;No?+ED%3E+No0/KeS<@ruF'DIIR2+DGm>;FNl>:JOSd%16Ze
+E(d5FC])qF<Fd11E^UH+=ANG$>sEq+CoG4ATT%B5uU-B8N8RT4"qd"%13OO:-pQUBl8!7Eb-A8
ATMr9B6%p5E$/_:BleB;%16Ze+CoG4ATT%B;FNl>=&MUh74/NO0d'[C1*C+=C`k*IATMs+Ec6)>
-OgDX67sC'F(oN)+EqaEA9/l-DBNb6@:Wq[+DPh*+Cf4rF)qctATAn@@;9^kA8bp)+E2IF+Du"&
@;9^kA8bpa+=ANG$>"6#B6%r6-Zip@FD#W4F`8]iDJWZgC2[WnDdm&r-RT?1%15is/g,1GCghF"
G%De:Df9`=+C\npBl5&;Bln#2-[mEP$>"6#A8lU$F<Dr/:JXqZ:J=/F;C=OR6:"";:JXq;%13OO
:-pQU@<?U&D/aS>FDi:=@;BEsB6%p5E$0@=Cht5+@;0O#@V'%XF`V+:De:,$@:UL$Df9_,$>sEq
+Dkq9+=D8BF*)&8Dfp"H%13OO:-pQUEb0<'F<G[D+Eh10Bk/?,Df9_?@;]TuEb0)rCLnV?+DG_7
F`M%9FCB3&ATT&,DerrqEZeq<BleB;%14g4>9IckCLq$jEaN6iDe*2t4DJhDFD)dEIS*C(<(0_b
06CcHFC]?3ATT:/$>"6#A8lU$F<Dr/:JXqZ:J=/F;C=ORIS*C(<(0_b06CcHFC]?3ATT:/$>"6#
D/=89-Zip@FD#W4F`8];$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>P
De!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?Y*bHD/X3$0JH6g/h1FC
;f-GgAM>e\F=f'eF)>i2AKW+;ATMs7+E(j7-tQp<+=M,9D.P8&@r,RpF'U>=AU&;G+<Yc7@VfTb
$;No?+D#(tFD5W*/e&._67r]S:-pQU-tQp<+EV19FE8RFAT;j,Eb-A1DfTD3F`V,7+DG_8ATDs*
DKKT2DBO%7@;[3)@;^?5DffZ(EZdtM6k'Ju67sC&ATMs7/g)9&F!)TIBOr;/FCfN8F!)TGF`&<E
FD,62+<Y`E@<ZT3+<YfJATAn9GA1r*Dg-7F+=M/K%15is/g+hQE+O'+Bl7^-+DG^98k;l0+EV:*
F<GFCF*&O6AKYQ/@;T^rARlolDIal"Ci=B+A1e;u:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU
+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JPG"F_ifn%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1
Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eX
D/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.
De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+kGF(KB6+=M/OATE!8Blmo8+EqaE
A9/l3Afu8*EbTH7F!,RME+O)"$=[plCgq=.4ZX]>%16]`Ddda)AN`'s0f_08,p5Dp1E\Fq1*@hb
2`D0Q8SDOUAOC->Ea`I"ATBpp+=Ci@G9CaF@q[!/Df9//GAhV?A0>;'GAhD1+Cf)-@r!2sBQ[g#
-OgDnDfoN*AT2I.F*2A5Df9/L3Zoq6+@%&"3XlF)D/a',A8cQQ3Zob%%17;s@;TRs4ZX]I3[\BT
Derm$Gp$^8Ddda)AKXQX@<Q3LBOPpi@ru:&+CoD5@VfUpCisfADJ*m+A0>;tE+O'#Dfd?9$9g.j
FDYu5Ddso/F`\aMDIIBnEt&I?0RImq4ZX]>+>GPmB4Z0-GA^i+ATJ:f%15is/g+_9BlkJADfTA2
-uNI1ALq>-@<6K@FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(tFDl1B0d&%j-S.>5
HZs@9D.Rc2>9IKf+?M<)F>+.2%15is/g+kGF(KB6+EV19FE8R5DIakuDIal,@:O=rEt&I?0RGMs
E-67F-Zip@FCB!)BONSK-T`\N67sBpDJjB&Dfp+DFCf]=-OgDH0RGMsE-67F-Zip@FCB!)BONSL
-T`\N67sBpDJjB&Dfp+DFCf]=-OgDH0RGMsE-67F-Zip@FCB!)BONSM-T`\N67sBpDJjB&Dfp+D
FCf]=-OgDH0RGW!E-67F-Z*:%Ec5B&E+iZ60IJq;0fpa;+=eQh-OgDH0RGW!E-67F-Z*:%Ec5B&
E+iZ60df%<0fpa;+=eQh-OgCl$9g.jF>5p>+>G!OATT&:DIIBnF$2Q,I4cWs+CoA++=D8BF*(i,
E+iZ6-OgCl$;No?+D#(tF<G[:F*&gJ@;TR,FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h
+D#(tFDl1B1*A.k-S.>5HZX.6D.Rc2>9IKf+?M<)F>443%159QHZV#+3Zp7%B4Z0-D/Nd!ATL!q
+FPjb1a$=HC`k*B@:O=r@;Kmr@5'&<$4R>;67sBlA8--.D.-ppD]gHG@;TR,@rGmh/9GHJF=A>S
@:F%a%14g4>9J!#Dg-//F)rHO@q]F`CER2!Bln96+>Y,l+=A^%0RIYS@;TRs+Bot"A0<rgHZV"P
$4R=O$>"6#1E^UH+EV..@rr.e%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcS@<6-m0JG4V
67sa#Ci<d(6=FqL@k]Sk+ET1e+<Y-%F(o,,-td@7@WNt@FCfN8F"Rn/:-pQB$;No?+B2onFE8R5
+D,%rCisc0+DG^9G%#3$A0>buD.Oi$G][t7@ruF'DBNJ(F(9-3ATD?m+EqL1D@HqJ67sBsDdd0j
DJ()5Df'&.De:+YDdjhUATD["@r$?;F!+'t@rGmh+DG_8D]hY)+<V+#:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T
67sB83,N)L1,C%qE+EC!ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@lt
EbT*+-OgCl$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%13OO@rGjn@<6K4
FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4
<$5+=5uL[1/I`$r$4R>;67sBjEb/[$AKYD(G%G]'+EqOABHV22+D5M/@UX'qG%#E*@:F%a+ED%*
ATD@"@qB^6%15is/g+S=C`mh5AKYE&F(o9)ARlp$@;TRs+CT;%+Eh16BlA-8+A*bdDf0W<@;^1.
+:SZQ67sBuDf0,/F(fK7Ch+YsE,]AsEZee3+DtV)ATJu<BOu'(-td@7@WNt@BlbD*E,]W-ARmD&
$?Tj#FCT6,F*(i.FE9T++>Y-$+>=63@6H4c?SQ:M%16Q-/g+L[GW-'=@m)Fe1,Er.%16W//g+LU
AN(&*Aj%ah?SQ"E2[p+*4Y@j41O'?9Aj%ah1iPD`$7QDk%15is/g,4KDfol,+C\n)ASlC.Gp$a9
Ddm-k+Dbb5F<E.XEb/ioEZfIB+DtV)AKY])+EV13E$/t8@ps1b%14dP,<gH8+D5M/@WNY>FCfN8
@rH7+FCB'/F'g:GFDYu5Ddt=G?RH9i%16Ze@<6!&-Zip@FCT6,F*(i.FE8f=$4R>;67sB4HW3F4
<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s\sgF(o,E3B:FU$>40n@WPIbDeioMF)u&.DD3au:-pQ_B5DKqF&QpoCLoeQF(o9)0JG1'
+<YbX/Kc/YBl7HqEb/a&+<Y*6F(o9)D.RU,+<YT7+<Ve>Ci<ckC^g_H67sC'DK0f;FCeu*DIIBn
+Dbb5F<GI>F`)7Q%15is/e&._67sBLEcQ)=+Co2-@rHO%Eb/c(A9Dp,DJ()7F(HJ4Afs]A6m-Dc
+>>eu:LeJh1,(F?+>GW42)I?N0b"Ib67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/cuH0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fNrXGqh&sAnc-kCi"A>AncK4FD,B0+Du=9
F(&rrAISuA67sB82f2uK0f:(^A7Qg$G%G]7Bk1ctFCAf)-seq`4ZX#Z:-pQU0fX#YGqq/u@q]:g
B4W3(G%G]7Bk1ctFCAf)FDi9M4?=oS3Zp!sF(Jo*DJsZ8+AGF0779pP78aR%%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1
+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
<(0_b=[>bV78c90+>F<4%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<
<'aD]I4Ym8%15is/g,%M+Dkh;ARlolF)u&.DJ`s&FE7luD/"6+A4^ZLBl[cpF?sthBkM<ZCG7n4
1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%16]iDI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y
3ZqWL.j-Mg.Ni"+$=Q(M+?0f;@Qcap2E!H9%14Nn$4R>;67sBuD]in2G\(D.@<6L(B5VQtDKKqB
@;]TuEb/d(DId0nF<GO2Eb0-1BOu6rEt&InBm=3"8T&'QEb/a&6$%*]B5UL\0g.QS+?CW!%14L3
9kAE[De).SB6A'&DKKqK.6T:+0F\A$F`(])Gs*c&-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg
+=\L>%14L3-n&PIChtOL.4ID@+=CZ;G@GK9-OgD3%13OO:-pQUD/"6+A0><%F(o9)D.RU,F!)lC
F`(\<+DGm>F`V,)+C]82BHV,0@ps1iGp$O5A0>N$Ddm-kCj?HsD/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=0KhHR+?CW!%16]iDIYg^+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO
:-pQUFD,6+AKYE%AKYi(G\(D.@<6L(B5VQtDKKqB@V'%XF`V+:-t[U>@jrO<@;TQb$;No?+DGm>
@W-@%+Dbt+@;Kb*+CT.u+D5M/@UX(hGp$O:F(o9)ARlp*BPDN1BlbD8CCLVG67sBpDBMOo@Wcc8
F)5c6E-WRD@;TQuF`V+:@<3Q'@<*K!F!+(N6m-2b+Cf>-@qB[uARl5WD/"6+A4^ZLBl[cpF?sth
BkM<PEcQ)=0g.QS+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp
%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R><G%G]7Bk1dHDIdI%ARfgJF)u&.DD=:81a"h%0F\@a
67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%14LXATVU(A3k6KF_t]-FE8lo/g)hW
$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBnCi<d(+Dbt7
CNCV1DfQtEDfTA2G%#30ATJu.DBNCsF(HJ1De!3lAKVEh:-pQU@X0),AS,@nCige9Df9D6Bl5&8
ATMr9Ci<flCh4`$DfQtBBPDN1FCfN8%13OO:-pQUEb0?8Ec,q@@rHC.ARfg)Eb0<7Cig*nATAo+
Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DGP%%?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Z*RB
ARnAMA8-'q@rt"XF(o9):MVXk5s[eXD/X3$3B9*,-OgDoEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"X
F(o9):MV[l5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCGB0^
5s]R/DeioE3B:Fo%13OO:-pQUA7]jo@rri1Bm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+DtV)AKZ,:
AISuaATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfRO=5s[eXD/X3$3B9*,-OgE#ATAo+
Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfRR>5s[eXD/X3$3B9*,-OgCl$;No?+E)F7EcPl)
AKYi(G\(D.@<6L(B5VQtDKKq/$>"6#B5DKqF!)i+G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/
DeioE3B:Fo%16Ze+>GSnB5DKqF!)i+G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo
%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B6%riD/X3$0JH6g/h1LSE)UUlCLo1R+ET1e+=LlC
E%)o>Eb/[$AKYQ$E--@JB6%p5E-!W@$;No?%15is/g+SDF*2>2F#kEQ$;No?%15is/g)8Z+>G;f
FCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1FE7lu:-pQU+<Vd^.3MMW5t"dP8Q8,$E-67F
A8,OqBl@ltEd8dGE+No>%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(FBD..]F1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g,(OASrW!
DIal(DKBr@AKXl>5t"dP8Q8+f$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$>"6#A8lU$F<Dr/76s=C
;FshV-OgCl$;No?+CfG'@<?''ASlC.Gp$a?Dfp".$>"6#B6%r64==c^Dfp#:F_kkJ-OgCl$;No?
+CfG'@<?''ASlC.Gp$a?Dfp"A/Kf.KBlbD/DfT\;De!:"EcW@6F`M26B-:`-D/^V<ATMs3Eb0;7
De:,'D/aTB+D5_5F`;C2$>"6#B6%r6-YII<F`;5@ChtgR4!uBb$4R>;67sBtF_l/6E,9).DKTc3
F!,RCCh7WqFCetl$>"6#B6%r6-YII<F`;5@ChtjS4!uC;-RUHR3\3C-/hd_A%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!
@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU
<+oue+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08
/db??/g*`-+EM47F_kS2DJsV>+CT).ATAn9FD,5.+EDUBDJ=!$+Dbt+@;KKtBOu'kAKY]/+<YK/
@r$-.FD,4m:-pQUF`V\6C`mh2F*&OGATW'6+CT.u+EV1'EZen2GA]#?:-pQ?:-pQU@<6L4D.RcL
$;No?$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA,Q67sBjEb/[$ARmhE1,(F?@<H3:2@<2G/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$48sNHZ*F;-Zip@FD>`)0IIuI+>Y-Y
A0<6I$49Np/g,@VEb'56De:,8@<-(#F`S[IH#R>9$:7Na9L2WR9e\^k+>=-h:JXYM<)64C4ZX]?
$:7Na9MA#V<'<8b5;"'50JF_,$:7Na9N4;E9LV**+?qJ$2'=V0+=&'b$49@"<'aJZ9e\^k+>F3p
:/k1Y6;0g23ZpX>+>k8t,V^u,$496r:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%^$:@?M;G9Y\
<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h&$<()%<'`i63Zp4$2`Dj)
+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*F<G:=+D,>*AL@fl6;L]^<)lCW4ZX]64@2h>9MA#V
<%0@H4@W"?5u^NL;cG1s4B#BW<'`hX$;No?+EMXCEb-A0De!3lAKZ28Eb'4u4tq>*D/a<0@j#`5
F<Db[-Z3a-5s[eXD/X3$3B9*,+DEGb-OL2U67sBh+EV19F:(2cHSHX^F`\`RF)>i2AM@(pF*')`
4!ua*4WlI%:-pQUFCfN8+EM%5BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$
0IJq)4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXY`5se76-ON$kHY7A<+=Cl@FE;;;CLo1I4!6UG
-V7'45u^WS0H`q^<)c.M9LU<9$;No?+EMI<AKYhu@rcL/$9g.J1a$a[F<DrPD/X3$0MPtcEc3WZ
4#/NP-YY1U1,C9b4tp1t+E2IF+=D5IDeio<9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8
+E(b"F`;UKF)YPtAM,)s+CT+0@3BB#@V'RgC`t/5$;No?+DbUtG%De,Bk)7!Df0!(Gp%$EASqik
Ddd0TD/X3$FCfN80ht%f.Vs$3A5d>`CLqU!F*',ZF=f'e+Dbt)A0>;'F)>?%C`m5+Ci!ZmFD5Z2
+E(j7+E(_(ARfh'+<YB9FDhL]67sB/FCfN8C2[W:.4ts&67rU?67sB[BPDN1+EV19F<D]I@rc:&
F<D]BBkq9&-u<g1A5d>`CLqU!F*')b+<YB>+<YcOE+rfjCi"A>+EDUB$;No?+DG_7Bk1ctDffZ(
EZfI8F*&NIF(96)E--.R+A$YtF(fK7Ch+Z+Dfd*E@;L$sEZfI;AKW+9F`))2DJ';O67sBsDe!3l
AKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?
+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8
A2#AR>9G^EDe't<-OL2U67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:EscApDeq^=:JEN+3Zp*`@W-1$
5u^WS0g.Q?0a_B.Der*=;cGn@+?qJ$0eb:+1(%K/DerB=6;0g23ZpX>+>k8r1E[qc1("A&DKJ0D
:JEN+3Zp-aBl8#l5se764ZX]M/g*"o1F+\/0FA/!Ci<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/
$4:9V@<,%5;cGn@+=B`'@;R-2BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$4:j"D,`ef
4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$=[pu;cHad7QidT
-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.j
FDYu5Ddso/F`\`M/gkOQ?U6tDF)>i2AN;b2?Qa&81a`V;:-pQUF)Po,+EV19FE7dQ0RGMsE-67F
-Za-CCLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-ON$kHSHX^F`\`RF)>i2AMI.qF*',a
4!ud+4WlL&:-pQUFCfN8+EM%5BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$
0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-ON$kHY7A<+=Cl@FE;;;CLo4J4!6UG
-Y[I?5u^WS0Hb(IFAtOm9LU<9$;No?+CQC6F_Pr/$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo+?MV3
F)>i2AMI.qF*')YF)>i2AMI.qF*',a$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AMHnf
@rcKA-Ta(<4""_p+>P`#$9g.J1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+
B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dG
E+Np'Ddd0eF_u(rD/X3$0JH6g/h1[U@:WnkD/`EjDeio<0HbHh/KeSHD/^V=@rc:&F<GU8Ci<`m
Bl7Q+F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)
0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcH
FD>`)0II;::-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?
De!lC2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`
@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]
CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1
$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN8
0ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`
CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>+0RI_K+=D8BF*)/8A2#AR>9G^E
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
BLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?
3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBQ:IH=H
Dfp)1AKZ28Eb'56/KenAEbAs)+E1b2BHUi"@ruF'DIIR"ATJ:f:-pQU:LdmCF(oQ1@;Kb*+ED%1
@;BEsFD,B0+CoV3E$07@+EVX4@r!2sBOPdkATJu.DBMPI6k'Ju67sBE0RIYFCLnV\De)dbF`Lu'
:gnHZ7!3?c4ZX]6C2dU'BHS[O8l%iS78m/5.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.
F*&O8Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22A0><%+CQB%$;No?+CoV3E$043EbTK7F!,17+EV:.
+=LuCA9;C(F=A>CAThX$DfBQ)DKI"3Bk)7!Df0!(Gmt*E0RI_K+?MV3C2[X)ATMr9C2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$7Bk(+EM(%F=044+>b3RATT%B<+U,m6tp.QBl@ltEd:&qD/^j3
$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%14J'@j#i'@<<k[3Zp7%B4Z0--VA;f;f?f!@qAJFFD+'b
D/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%159QHSZd_A0<77De*s$F*&c=$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#_c%13OO:-pQUA7]RgFCcS'Cht5<
DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL&ATMr9A9Da.+EM%5BlJ/:
%14L30HiJ30JFpu3]\B;3[l1NATMr]Bk)7!Df0!(GsldlE"*.aDe!p1Eb0-1+EVI>Ci<fj5s[eY
Eaa$&3B9*,%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2
ASuU2%16Ze+E1b!CLeP8FCfN8C2[W:0ddD;%15is/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@FD..=-
+EM77B5D-%Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfREEb'56GA2/4Dfp.EA7]glEbTK7Bl@m1+:SZV
4ZX]tF(K594s2O%0d&7pDJs*2E$-MU%16#s3Zq?D,CUa`4>83,IQATu/g<"m;[j(FEZd%Y3$<0_
F<DuY/g<"m;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$;^ii9/g`27+F?-n0d'C($4R>;67sBtATDEp
+DG^98l%htF)Q2A@q?)V-n$bm3\W!*3]\B;3[l1DDe)dbF`Lu':gnHZ7!3?c%16T`@s)g4ASuT4
FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^M
B5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is/g+SCAKYi(F)u&5B-:W#A0>_tDL!@5D.73l
Dfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e;u0d'[C0Hb"EDdmc74s58++CoA++=ANG
$4R>;67sBU:K0b*:.\/V3ZqsECh7^"+EV:.+EqaEA0<:BATMrB+DGp?@rH3qF!,17+EhI-+=L3#
F*'fa@ruF'DIIR27!3?c.1HVZ67sBhDIal+ART+j+EVNED..3k+D,%rCisc0F!,17+EV:.+A>6l
+>#/fFD,6+ALDOA@3A0<6m->TCLmq^:-pQU@Wc<+FD,*)+E(b"F`MOGGA(Q*+EqaEA9/l;Bln#2
FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,Xf
ATD@"F<G+.@ruF'DIIR"ATJu4DBO%7AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9
.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?
DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(
AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*
Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k$;No?
+>G!C+Co&"+=D8BF*&c=$4R>;67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+=D8BF*)/8A2#_c
%16Ze+DkP&AKW?J%13OO:-pQUF(fK9+Cf>4DKKq/$>"6#F(fK9E+*g/+Co1s+FYFe%13OOATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$?B^!
FC[^HF(o,<0ht%f.WT*AFC[^HF(o,<0d(Qi/KeM2F(o,,-urm?FCZgCFCfN8F"Rep67rU?67sBh
F)uJ@ATKm>:-pQ?:-pQU+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I1:-pQ?
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE;e9oiASkmfEZd+k0JEi/67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/IG6>/g)l'DJs\R3?WH`A79RkA0>K&EZdt502-(tFa+6g67sB83,N)L1,C%qE+EC!ARlp*D]iP.
EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OL2jDe!p1Eb0-1+=CW,F(H^+
Eb065Bl[c--YdR1FCfN8ATB.*$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]55s[eG@<6-m
3B9)I+BosuDe3rtF(HIV-UC$a@UX=l@lZP0-OO@%Bl8!'Ec`EOBkhQs-OL3&ATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5A8,Oq4ZX]5FCfN8C2[W:0II27:-pQU
DfB9*+CQC7ATMr9A8,OqBl@ltEd8d9DIal/@:O'qBlks7ATAo3A0>Ds@rr&hEZf=0@r#TtA8,Oq
$49Np/g,%MG9CU;F(KB6+EMI<AKYl%G%G\:@V'.iEb-A7AS#a%C3=E0+EqaEA-u'u/g+kGFDi:D
BOr<.ATMr9A8,OqBl@ltEd98E-uNU?DIIBn4ZX]5@4*TK,!$iWBk2+(D-p^dDe*2t0I\,-3Zp4$
3Zoe*+=\LZ-OOF*+EVI>Ci<f+E-67FDIn$0@;TQ_ATD4#AKYl%GA^i+AI<!h+EVI>Ci<f+B4Z0-
DIn$0@;TQ_ATD4#AKYl%GA^i+AI8c>67sC$ATMs3Eb-A8BOr<*Eb0E.Dfp+D@UWb^F`8HT+DGp?
A8c%#+Du+>+Cf>-FCAm$$;No?+EV:.+Dtb7DIIBn$>"6#Eb0<6A0>Ds@rr&qATAo+ATT&4ATr$#
D.O&cEZd.\De't<-OL2U67sBjBOt[h+ED%7FDl22F!,(8Df$V*F<GC2@<6N5FE_XGG&M2>D.Rbq
:-pQUF`V87B-;>7BlS9,+Co2,ARfh#Ed8d9DIal#Bk)7!Df0!(Gp%!5D.Rbq$?g?(0g.Q?-Y#1b
$?g?(1-IZ@-X9nqDIIT?11kS_>\J%mAR&tgBPoRZ0JHaRASlB6$49Np/g*n\9i)sSG@b2u+D,P4
+Dbb0Fa,$;DIal5DesQ5AKYK$DJ!Tq$>"6#DIn$&+Dtb7DIIBn4*GOY0e=\*FCf<.0./;gATr$#
D.O&lATq^+DIIBn4ZX]5@4*TK,!$iWBk2+(D-p^dDe*2t0FDB3+Dtb7A0>c$G@bf4@;TR;G&M1P
/14\EASlBk-S0.HG@bf4@;TQ_$;No?+Eh[>F_t\40a_K4+E(d5DIn$0@;TQ_ATAo4@:O(`+Dtb7
DIIBn$>"6#FDYu5Ddso/F`\`RDIn$0@;TR'$>"6#Eb0<6A0>c$GA^i+AI<<dEZf"+F<GI4GA^i+
AI<!h+>Y-YA0<6I$49Np/g,=UCisT++>O:8EZf:2+Dtb7ATDZsD.O&cEZf=0@r#TtDIn$'Ec,<&
AI<!h+EVI>Ci<f+E-67F-Z3L>ATDZsD.P(%ATAo6ATMs(+Dtb7ATDZsD.O&lATAo+ATT&4ATq^+
DIIBn$>"6#1E^UH+=AND$;No?+>%q>78m/.;cQ1P78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/
F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?Z]k#FE;PH@ST6B.XQVDIXN>\/M/)e
ATMr9F*)P6/e&._67r]S:-pQU<+oue+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]XB%:-pQB$;No?
+Eh=:@UX@mD)r+5:-pQU%15is/g)8Z+<W9h/hS8hDJ!g-D..NtA0>u*G]XB%:-pQU+:SZQ67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhEH[\A3I16NY67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g,@VEbce3DBNG*ARTU%@UX=h+E)9C
FE1f2BHV,0@ps1b%15is/g+Y?ARTU%-RT?1%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm
-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5
FCfN8C2[W:0II;:%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;                     ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`2^41*A=p0ea_*2BX_0+>Pr"0esk-1a"P/+>Ykt1,C%/0H`)(+>Gbs0ea_)2]sh1+>bbp3?U18
+>Gl!2)HF10H`,.+>GVo0f`]\Cf>1hCLo1R-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE:r1D/a5g
D/X3$0JIT[F*&NQ@rH4'C+19C@;TQuDdm=$F(8X#Bl@m!Df'H.;f-GgAM>he@rH4'C+19K@;KXg
+CT;'F_t]-F<GXADeio,FCfN8F(96%@<?(&ATMs(Bk)7!Df0!(Bk;?qEb/[$ATJu*D/aTB+A,Et
+EV19F<G+.@ruF'DIIR"ATMBnF*)G@H$!V=FC])qFD5Z2@<-'nF(Aj'FE2;FF!+(N6m-S_F*&O8
Bk)7!Df0!(Bk;?rBk1.ZDeio<0IUIGA18XBD/X3$+EV19FC]9*;f-GgAM>edA8Z34+EMC<CLnW1
ATMs7A8lU$F@'DWBk&hO@UX=l@j!11E-#T4.3NS<Ea`frFCfJ8F(KGH@q]:gB4W3-ATMs7ARn_V
Deio<0QV)LCLnW1ATMs7+E(j7-tQp<+=M,9D.P8&@r,RpF'U>=AU&;G+EV%$Ch4`#A8-."DJ*Tu
DdmcdD/X3$6$%*]B5TCW0PPE8Bl[cpF<G"5F(o9)D.RU,+E(j7B5DKq@;I'/DK0f;FCeu*DIIBn
+Dbb5F<GI>F`)85Ec=roDeio<0IURSE%)o>Eb/[$AKYQ$E--@JB6%p5E-$&2F*(qZ@<6-m0JR$F
F(o,,-urm?FCZgCFCfN8Er                                                    ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A;30et[11,'h++>Gi62`Mp71a"Or2E!NT+>PVn1*AS30d&2*+>P&p0K:j2
0esk,+>Gi71*A;*+>P&o3&E?I+>GYp1*A>12_lL7+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>to23?U%7+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bpd.0f^@3+>l,9+>Get
1*A;-2D[s$6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
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
+>P]51,h6J1C?`M6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/
3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe
0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm
+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get
8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU
1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S
1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[
ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`7
1H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!
6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-
0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%
2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe
0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-
0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT3
1c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP
2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[
ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ
0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[
ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ
2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP
0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[
ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR
0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+
E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*
2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*
2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk1
3\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.
@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP
2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18
+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&
+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A
+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO
+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N
2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K
3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b
+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk3
3\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg
1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b
1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL41
0fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;
+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG
@<itN0JPL/1,1gH2**NI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*
2]sh63]/lX0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N
2**KI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lU3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\
FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&
8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2BYV#DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB
+>P]52)73K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:21HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%
+@KX[ANCqh2]t_$DBL\g0fU:11-.6O3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi
+AH9b+>PW*3$9n83]/cU0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB
+>GQ22)dQR2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3ZpF*+@KX[ANCqm+@0se+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn
+@KX[ANCqm+@0se+>PW*3$9q13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm
+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V
0JPO00fV3K1cdKM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,EZd+k0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t4
3\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu
+@KX[ANCqh0d'2!Gp"jr0fU:13BArS3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB
+>PW31,_0M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ41c%0H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB
+>P]50f;!J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>P_q9jr;i1,(FB+>P]51,1gF0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB+>P]51,h6J1^[#fF(KB8ARn5M
Ec5u>1,Vfn/h0Y+F(KB8ARn5MEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R=O$;No?
4?Y)I.3N,@@<6*C+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuHDe(M92)$j9%15is/g)o0
+AH9b+>PW)2'=V03]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i@;]j'ATDg0E]P=\Ch%R)
%19tY+<VeFCER43+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN+Dl%-BkD'jA0>u-AKZ/-
Eag.>A8Z4)ARTUhBIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:F(Jd#@q[!$BleB;+E2@>
E+O'+Gp%$EASrW4D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9BOr<,@;]j'ATDg0EZcqV
FD,5.@rGmh%15is/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'F_t]-F<GO2FED)7DK@?O
AM.UJ+>Y,q+CoA++=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?A0>PoG%De.@;0OhA0;<g
:-pQU+?(E/E,m'V0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&3ZrW[ASrW!FED)2E-,f3
B-;;7+ED%+BleB-EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[+B3#cEb-A-F!+m6F)Po,
+C]&&@<-W9Bl7F!D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@ltEbT*++CfG'@<?'k+C]U=
8g#uD0Jjn_D]iq9F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(RnATJu3AS#BpAoD]4D/XH+
+EDC0F`VXIATDg0EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(F"Rn/:-pQU1-$IO@<*JG
0JG@,0f1pF2EEWL%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'DIIR"ATM*oATVctBl70j
@<-6sFDYH#DC5l#_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*AN_Xg+<VeA?ZK^dA0>PI
Ado(V$;No?4[(8L.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A@ps1iARlp*BQA$6B4rDr
D@HqJ67sBhA9MO)F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&FDl+@Ch7d$C`m5+Eb,[e
:-pQU8l%htGAhM4F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@GA1l0+EMX=Cht54@q0Y%
%15is/g+bEEZf(6@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7Dg*=CEc5o.Ebp"DFE1f/
E+NQ4%13OO%15is/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<
DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UH6+E_3X3ZrQ++=D8E
BlbD2F!,UCBk)'lAL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<YWGF<DrR
A1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h,dZ_h>p\_h>nA
%19tY0uC7O+EqaEA12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIAF^uj/$8Dts+<Ve>ATT%B
F^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,(_Qts>GAhM4
.!$g[A7]@eDIm@qZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10KG
+<Yf;%172jBlbD2F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6A8-+(
+=D;B-Ql/N/g,4KDfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0Des6.GA1r-+A*bdDf0`0
DKKT2DK?6o_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-DBNP"Bl%p4A\tb_$H%D3
KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\R10K4$;No?4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5DK?q=Afs\g/Kf.HF*&O7
@<6!&A8-+(<GlM\De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNXATD?)BlbD*+Dbt6B-;8;
@;]UiDJ()2Ec5E'ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU+Co%nCgh?qA0>r'DfB9/
+CT;%+Du+>+CT)1@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb-o<@qAncKN+:SYe$4R=O
$;No?4?Y)M.3N2BEc5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("@<?''B6%p5E-!.GBOu'(
FD,5.A7]^kDId<rF:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2F*'#W+:SYe$6UI0A0<7B
FD5Q4-QlV91E^UH+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%DC5l#%15is/j2BH2(9Y[
Bm;Z]@q]:gB4YTr-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s$4R>;67tA`-oNLsASlC.
Gp$a?Dfp#?+CT;%+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)E--.D@V'%XF`V+:B6%r6
-Z3@0ALBPe-OgDX67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe$;No?4[(8P.3N5:GWHrq
B6.ouCLqK7+Dl%-BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,+DtV)ASc(%F<G%(AoD^$
%15is/g+YEART[pDJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F2^ok\EcQ)=3ZohcDe*9h
ALSa9D/aN6E+O'+Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&+Dbb5F<G"4B6A'&DKKq/
$;No?+>Pr":2b:u1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@FCB8=+<XEG/g+YHFE8RB
@;TQb$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6
$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;
P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a
+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;1,(C@0KCjB/i4[n+<][.
Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe+<VdL+<VdL+<VdL+QAW;
ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(H
Pa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjBF+<V+#
%1445+<YE;A79+^+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'c
F*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZ
SDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%(+<Vfd
P_(YE0K1[G0ek:;0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:;+<][.Ji>\4
+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifof>$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<AoD]4Ch[s4Et&Hc$8Wf>
De*9hAKZCR+>Y-NDJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0jDJ((a:IH=9F_u(?F(96)
E--.DAmoCiF!,[?ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)Bln#2DIn#7FD5T'F*(i-
E-!-R+Du+>+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5Df'&.E,TH.F:ARP67sB7
2'>\)F<E=m0f:(-3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4F_u)=05Y9>/no'A-OgCl
$6UrR/hS8bD/"*6ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;
Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o;GKqb?XI>^>@BZI+<VdL
6r$$B7:0D4D[d$_$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'n
F!,17+E2IF@;Kb%Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;67tA`-oi_!ATDg0E]P<k
B5DKqF"&5GDI[U*Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQtDKKqBFDi:EDK0f;FCetl
$;No?+DG_(Bl[cpF<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB+<X-lEZeq<@;Tt"ANCqC
$;No?+>>eu:LeJh1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQt
DKKqB%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2
%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(
B5VQtDKKq/$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8S.3N5:GWHsa
Bm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB81*B;"Gp"jr0fL401HI?K
3]/i*$4R>;67sBlDIb>;Ah@q1F(KB8ARmB(EcQ)=Et&IcF_PZ&C2[WnBleB:Bju4,Bl@lE0ht%f
.UmO7Ch.:!A7TCqFE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A.8kT$=e!a
F`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&
3B9)I+BosuDe3rtF(HIV-UC$aC2[WlF_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'
DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=
A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2
FD5Q*FD5<-+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$
A86$n-OgCl$7AGA6rR&N7n#g;;BSS-6q9gJ6qL9!8l%iR:K::[78m/O7n#g;;BSS-6rR&N7n$6B
7RTgG+A,Et;cH%Q779p=6qL9!8l%iF8Q8)R6UXLD+A,Et5t"+::..ZO+A,Et;aXGS:fKhS;BSS-
6q(3W;aa2T-TsL5F(KH&F_PZ&A8-(*+>=63%175sA79RkC2[X"@;]dkATMr90F\@]:IJ5X6m,r]
Bl%<pDe*?rD/aN,F)to'+A,Et;cH%Q779^F4%`::7nHZJ8Q%WB:IIK:6r-QG8Q%WB:IJ,K;Fs\a
6qL8c$;+)^<)6:`;cZU\+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'+A,Et;cH%Q779^F4%`::79EMf
6qL9<8l%iR6W-KP<(';U%15^'6rm#M+E_X6@<?'qDe*BmF*)G:@Wcd,Df-[i:IJ,\5t=@38Q%WB
:II]E<(';U%15^'6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C6qL8c$;+)^
<_Yt)Eb0&u@<6!pDe't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA6UXLD4%`::
7nHZJ:I@NA;@NsB$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A7B[qCh,Od
3F<4&%13OO@WcC$A86$nBkh]E0ht%f.UmO7Ch.:!A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%FCeu*
C2[WsC3(M=@rc:&FE8QIBl5%9C2[WqBlj\W67sBkBl[cpFDl2F/db??/db??/g,=KEaiI!Bl,m<
:-pQ?:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6jc[U/g)8Z1E^UH
+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+$;No?+<VeF
A0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0
+EM%5BlJ/$:-pQ?:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuic
F`;;?ATMp(F!,16E,95uBlkJ305i9H:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+AQhtATDg0EZek*
ARfLiDJ(R/:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>f:-pQ?:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F;C3=DJ1($cC/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTcF`&ll+CSekARlou
De*g-De<^"AM.\3F!,49A8kstD0%=DC3(M4De+!3ATD:!DJ!Tq@UX%)Bkh\r:-pQU0f<BYE\K6k
Eb0*+G%G2,H=gl-ATJtG+E)CEE-67FA8-'q@ru9m+EVNEC2[WqBlkJ?DId=!+CT)#ASqh^@rGk"
EcP`/F<Dr?@<6!-$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+Bosu
De3rtF(HIV-UC$aFE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ARfY!A0>f0ASrW$Bk)7!
Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEsci(D`p-(I4cXQBk/>?$?'Gt4$"a(De*Bi
Fs(O<A0?#:Bl%i<+BosE+E(d<-OL2U67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3
FE1f"CM@[!+Du+?DK?/,D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4&C2[X+ATDj+Df.^!+=o]1
HV.(%<_Ysh$;No?+CT)#ASrW*De*QsF!,"-Eb/a&DfU+18l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY
8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL$;+)^7nHZP:IIcH
;c#bZ83K!VC2dU'BQIa(+A,Et7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"0..)6:-pQUB4Ysl
Eaa'$+Cf>,D.RU,ARloU:IH=8CghC++EM%5BlJ08$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3
C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5d+De*HoCh7ZN3Zoh51*BpY.3NJ9
CLnhV+DPD&@<6L$Es`7L67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^$7KY!CghC+ATJtF-8%J)4==ZJ
F=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Yp$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&
FE7d:Eap55EapI[3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"
$7L6R+u(3]EapO]3Zrc1+u(3]EaoF`:-pQUF`:l"FCcS*Bl[cpFDl2F+D,>(ATJ2J8PDQO4ZX]6
C1D'gF)to6+=nX^/g<"mF)kb>+=nil4s2s8/no'A-ON=79LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O
.3L/g/j:CI8PDQO$8=SWDe*BeF<D\K+<Ve=GB.D>AKX&gHU^S#78jOI4DJeFF*)>@ARo4k+D,h<
Blmo/4#)(O8PDQO$8=SWDe*Bs@Urnh+<Ve=GB.D>AKX&iHU^S#78jOI4DJeFD..3kA79R&+D,h<
Blmo/4#;4Q8PDQO$8=SWDe+!4Bl%<gF<D]<GB.D>AKX&kHU^S#78jOI4DJeFFDl)6F(A^$+D,h<
Blmo/4#M@S8PDQO$8=SWDe*d(A79R&+<Ve=GB.D>AKX&mHU^S#78jOI4DJeFE,ol/Bl%?'+D,h<
Blmo/4#_LU8PDQO$8=SWDe*fqEc#k?+<Ve=GB.D>AKX&oHU^S#78jOI4DJeFF`V,7@rH6sBkLm`
CEOa3GB.D>AKX&pHU^S#78jO#F)>i<FDuAE+=CZ;D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RIE+EC!
ARm.qF)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ8.#]!67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+
$?'GtDf9P:>9G^EDe(4C$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B
3B:FR@WcC$A86$nF`(o81,2Nj/h1=QBl%<pDe+!.BlkJ=/M/)hEbTW,+A,Et+E_R9F<G[:F*)IG
FDi:CFCAfrDJ()&Bl[cpFDl26ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8ZEb065
Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%ha$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL
+<VdL+<VdL:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$;No?+<VeFA0<rp-YdR1A7]p,
C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/'$;No?
%15is/g)8Z0d(LR+=CW@Bl%<pDe+!.Blk^F+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6
+DG\3Ch[BnF<G9ND^c,&:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#dr
B.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#2
6nTTK@;BFp%15is/g+YEART[lA3(hg0JPP(@<jU`%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.
@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA1&`6$4R>;67sBhCh[Hu+DPh*F`(o8+Co2,ARfh#Ed8*$8l%iF8Q8;X6rcuR
<)>k[83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1
C(1MB:II]E<(]qS<DH+b:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6rcuR<)>k[81Z-'De*KpF>%BI
A9Dd(F>#!N$4R>dEbTW,FCfN8F$2Q,1a"h%0F\A'AhG38@:XCg?X[\fA7$I$ATMs74Y@jU<Cp.Y
?X[\fA7$HlEc<.H+CoCC+EMC<F`_SFF<G[:F*)IGEb0?8Ec*KPASu$2%14J)FEqh:+E1b2BI>qq
+F">&BkAt?-o!e2-Rg/i3ZrNUF*)IGA8a(0$6UI4D/XQ=E-67F-VeS&-S0@]H#R=G-QmMBF*)IG
/Kf+J@;TR!-OgDoCia/?%144#-ZW]>FCfN8F!j+'+>G!OATT&C/p(ZGFE7lu+<Y`BDfp/@F`\`S
,!$rjATMs7.4chh-S0@]H#R=G-QmMBF*)IN%144#AoD]sFCfN8/g,7IF*)IGA8a(0$6UH6+EMC<
F`_SFF<G10Ch5a^+E1b2BHSiKFEDeIAKWNH-SHhi/0H?&0RInQF*&iR/0H;mBkh]:%144#+<W(S
Db*Z&<$47WHZWh?F=A>VEbTW,?X[\fA7$HkBl%>i$6UI&DIb@/$>"*c/e&.:%13OO:-pQU@rH1"
ARfg)@;]TuGB.D>AKZ/)EbTH7F!,R9F*&OGF_Pr/Et&IO67sB/-Za-CCLnkT8l%iF8Q8;X6rcuR
<)>k[81>[*EbTW,FCfN8F!)iFF`VYKEc5i.-OgD2-Za-CCLnkT8l%iF8Q8;X6rcuR<)>k[81>[*
EbTW,FCfN8F!)iFDe*p+Deip+ATMs7-OgD2-XpM*Bk&MP8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,
FCfN8F!)iFDe*<cF(o-+ATMs7-OgD2-Z!43B4WGP8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8
F!)iFDe*ZmEbAs*ATMs7-OgD2-ZaBMATMo?4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QP
C2[X(FE1r6F*(u7FE8f=$7I93EclG:-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1
@rc^5BQRg,FE8f=$4R>`D/XQ=E-67F-Xgh-+E_R9F<G[:F*)IGGB.D>FCf>;%13OO:-pQUEb0<6
DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16c_F*)>@H"q8.1,04FB4YslEa`c;C2[W*/KeP:
@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm0J5@G1a"@m
A7]on$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE-uNI1ARf.jF"&5QFDl22+Dkh;ARlol
F)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9
De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F
;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=
F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QP
FsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL
+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)
D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/
F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL
%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hA
D]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VL
B6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu
@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s
$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0
E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!
+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;
ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2
%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.Ohu
DII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7
EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2
%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7
EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE
@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y
:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-
BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9o
FDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG
+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8
A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_
+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m
+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2
DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k
8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+
/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1
>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<YE;A1hh3Afu58A79RkA1e;u%14=),9SZm
3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+D
E,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWl
A8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/
ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8Ygm
AL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>
ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>
+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ
:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c-
-YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeI
AS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<
3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,
ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+Dtb7+EV19F<GX7EbTK7F!+n%A7]9o
FDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!
ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,
D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI
0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5
+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$
F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j
-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4
%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%
DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XL
Bl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7
$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE
$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-
H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G
+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7r
AR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=p
A7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('
@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4+
+DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+H
AM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%
+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">
F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*
2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf
0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%
D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)
D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth
+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!
+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@lt
Ed8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL
:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF
0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT
%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs
+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itD
AooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"
FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL
+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9
<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:
BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%
+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9
Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1
ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1
/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOe
F*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R
+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,
?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#
+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc
$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B
;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)
FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)
A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG
@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("
@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#
+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImis
FCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6
?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e
+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36
F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL
+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9
-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7
F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn
-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaE
A90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4
D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2
?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6
G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e
,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S
@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*
@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1
@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3
+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;
Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)
AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$M
H#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq
+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+u
ATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<
DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<
+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9
?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn
$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;
AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?
>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8
Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--
ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL
+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%
?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@
%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=
+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s
?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#
+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*
G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*
1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_(
$6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeD
F_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku
$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51
FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#
AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWs
AKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQ
C2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!
+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"
?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t
@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl
>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6
+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#
+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,
B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6
@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-
+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"
ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:g
B4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X
<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+
?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'
Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:
Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;
DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,
FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#
+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13
E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]
IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&
AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=
+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%
E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&
@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9
EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<
,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+
G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"
Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU
0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'
ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[
Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&
/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=
+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3q
C`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLs
F!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/
Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]g
Cht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i
%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8
F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%
DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlom
Gp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*
ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+Amogu
F<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"
F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:
?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043
EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3l
ANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/
?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.
FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK
7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i
+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9
DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp
/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6
De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<
@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'
F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-
+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC
2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-
+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL
+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3
Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M
8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.
A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0
Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"
+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'm
F!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?Ke
Fa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1Cggcq
Eb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?
+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k
?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'
F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-
+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=
BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)
E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu
85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNE
Eb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'n
CggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7
B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@
?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'
+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'H
Ado(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@
AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3
@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*
E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ
$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k
$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#
F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1
DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$
F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#
Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$
De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6
@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0
%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+
9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&
B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?Ke
Fa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d+
+A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs
@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+
BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%
6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#
DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K)
:ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45Oe
FYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=
ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO
+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3e
Ch4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5
Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a
:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=
+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,
DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO
+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k
+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'
Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,Xo
ATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%
?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@e
DIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUh
BHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,
E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6
A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7
FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=
DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/
+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l
+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:B
AS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,
+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)
E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq
$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,
Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)
AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#
ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3
FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4
A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9
$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b
.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*
F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5
?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'
+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b
/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;
A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cp
FDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?
+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc
+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=
A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46
A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf
/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7
@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&
A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK
%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#
.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&
FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<
@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=
Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63(
$6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4
%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'
/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9
$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@
FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#
+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8
Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LS
BPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>=-pFDl2FC2[WnDdtOWB4YslEa`c;
C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]%14=),9SZm3A*<P1a"@mA7]p,%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!
AoD]48g&:gEcYr5DBLnk0K1L7%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;
EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<
3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!
E,]B+A8-92FDi:2ATW$*EX`?u+<VeJF`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8
F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc
$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4
F!,O8@ruF'DBN@uA7]:(+<V+#%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?
G9C:'Df'H.?m'Q"B-:S1001OF3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYq
Bln',B-8U?@;TR,>@VJXF)tV<G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6
G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#
.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@
+CJhnFC65"DIaktE-681+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGB
E,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG
+>"^%E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f
%14=),9SZm3A*<N0d&%j9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.
+Dbb0CCLU[$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[Wr
ASc<n+EMgGFCBD:A8bt#D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u
+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*
@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9
FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1
/MJb:/NGaC.1HUn$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3
DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1
%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>
A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[
F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-
FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1
+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D
:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-
G%G]9ARlp*D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#
A8c[00.@>;%14=),9SZm3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S
+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_
+>PW%+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u
@<?''@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu
@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$Yt
BOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8
Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8
A1_b/B4W_F%144#+D>2)+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC
+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:
F`\aMBln#2FD,5.%144#+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5
DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-
FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*
A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[WlATMrK2,$;&<(U%_76N[S-V@0&+=K#p+@9X\F<FD#
@:OCn@qB^/%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM=u+@9LPATAn&$=[FZATDNr3B9?;D..-p
/n8g:%14Nn$;<`P6VgEN78?f\4ZX]56=k4[+E2@0@ruEpATJu+DfQsm:IH<W+ED%:Bldir+D,P4
+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P7ScBO;a!/a0b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38T&WjDe+!#
FD5Z2%16$PAor6*Eb-A8Df9H5+CT;%+Dbb-AKYf-@:Wq[+D5h7F#kF_Dg,c5Ap%o4G@b3%Df0V=
AoD]4F)591Bl7Q+H#IhG+Cf>#Bl7Q+A7]UrDK?q0F`\a7CiaM;A79@gATD^3F!,[?ASrW5F(Jl)
Bl.g0DfB9.Cj@WU+@opaAKZ8:FWb7=ATAo7BQ%u8H#IhGF(K0"+DG^9FD,5.AoDU059M(?+DYk5
G9BI)D'3\0F)u&5B-:V*An?0/FDk`3+CT.u+A!\bATT&?Dfm12Eb-A%F!,[<Cht^H%13OO<+oue
+DbIq+E)CECh[cuF!+m6DKTf*ATAo3Afr:,ATMr9E,oAsFD55rF!;`FEZf";Bk1dkBl7L'+D,P4
+E_a>DJ((a:IHfX+A!r(AKYf#@<-6sA0>u-AKYYpEb$;:@<jpWBkAK5Dfm1E@;BEsD0[74A9MZs
AKZ)5+D>=pEc`FLDfm1>BkM+$+C\n)F)YQ.ARlqn$7QDkEb065Bl[c--YI".ATD3q05>E9-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l3<+U,m+D,P4+A,Et+E_a:EZen(Anc-oA0>K&Ch.*tEt&IX5uLHL:.I>f
<(KSZ+A>'f+AtX*<Cp(W;]n@K:/t"T78b7(7Nb]078b6r77KjD7787j:IH<p:J=/F;H#1W$4R>A
BPDN1CggcqEb065Bl[d++CQC1F_tT!EZf:4+A,Et+D,P.A7]e&+EVNEEcl7P+B3#c+Dtb8F<GXH
AT/c6ATMs7+D,P4+EV:.+D#e3F*(u2@q?d$Afu2/ATME*AoDKrATDiE%13OO8S0(n<+U,m8l%iC
Bl[cpFDl26ATK:CCh[s4F!+n/Gp%6IA7]@eDIm?$8l%htA8-'q@ruX0Bk;?.@rH6sBkMR/AKZ).
ATME*A8-'q@ruX0Bk;?.@V'.iEb-A6F`))2DJ()6BPDN1Cggd*+A$HlFE2M6FD5Z2F!,C=+D>\;
+EVNEA8`T4BPDN1@ps6t@V$ZoDfor.+DG^9-u*[2/oY?5.4u`7DKBo.Cht59BOr;7C2[WnDe!p,
ASuT=+CSekDf-\>D]i\(F<DuHDe(J>A7d8C%14Nn$<1SXF@o=s6tp[Q@ruX0Bk;?mBkhQs?TgG+
+?CW!%13OO:-pQ_<+U,m8l%iCBl[cpFDl26ATJu;/M/)eATMr9F`V,7+Cf>-Anbn#Eb/c(8l%ht
A8-'q@ruX0Bk;?<%15is/e&._67sB[BPDN1+Eh=:@NZe'BOt[hF!)TIBOQ!*+ED%5F_Pl-A0<!e
:IH<JCggcqA8-'q@ruX0Bk;?.+CT;%%15is/g+\9Anc-oA1euK6tKtEDIm?&+CoD%F!,@=F<GF3
@;[30BOr;/A8-'q@ruX0Bk;?.+D#e3F*&OCDJXS-$;No?+EV:*F<DuHE+*j%.3N2HE+*WpF!,RC
+EMI<ATVU"DJ()1FD,6++EV:*DBNY8F!,")AmoguF=n"0:-pQB$;No?+Dl%7@:VDA+Cf4^F(ZUY
/g+,)F*(#M6pta0ARfh#EbT*++E_fuB5VX.AIStU$;No?+EqL1DBN@1Eb0&qFD5o0+Co2,ARfh#
Ed8d<De3u4DJsV>AU%p1F<DuHE+*j%.3N23BQ%I'+DGq=+CT;'F_t]-F:ARlDe+!$Bl\8;4Y@j)
IO?Hn-8%J)4$"`]:IH<t:IITN9i+b28l%iR:K::[73G2u6rZTR<$r+^C2[X*A7]@o+?_>"C2dU'
BI5>q+DPh*F_#3,F!)T#67sB(-n6Z//g+nJ@<?/l$>j3mCEPbm+DPh*F_#3,F!*UgC2[X*A7]@o
%16f]/g)kkAM,*B@<63,A8a(0$6UHT+=D#?F)u&5B-9fB6m-)[Ch.*tF!*%WA7]@eDIjr"AS,k$
AKZ#9DJj0+B-9fB6m-;S@WNn>4!8BKF))mC+DPh*F_#3,Et&IfCia/?%144#4s24]Cht4d:IH=;
DerrqEcW@3Eb-A(AS,XoARm/24!89VA9DEoAoeCgASu$2%14Nn$4R>AATMrc:IITbEb/a&DfTQ'
F!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMV]@N]/sARTJ!E"*.U5uLHL:.I>f6qKaF8P`)I;Fs;U+@B$q
5u^9@+@93R:f9k\;BSk;:/`927NbAj66K5u8Q-a58PDf#6:E"b78--L7787i:*<M,73G>o=B$DA
<(0V9%13OO=(l/_+EV:.+@9X\F<FD#@:OCn@qB^(CggcqEcl8@+DGp?@rc-hFCfM9@3BH1D.7's
+E(j7A8,OqBl@ltEbT*++DG^9FD,5.."4ca6rQl];F<l%+Co2,ARfh#Ed98[<+ohcDIn'7+EMX9
E$0@=Cht57ASl@/AKYE!Gp%$;+EV:.F(HJ)Bk)7!Df0!(Bk;?<+<X6F+B_K?+@AFm73Fl_:K:@:
<(KSZ+@JLp5p0**:J`0/:KK.X$7QDk;Is]`G%F?U@R=XIF@9hQFD5Z2@<-'nF'iWrDe*3<3Zp4$
3Zp*c$>F*)+A#%(8PUC=D_;J++<Y`=ASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<l#
.4chj-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(.!KBC.3N/8@ruF'
DIIR"ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4DBMY^
@j#2tA0=Q[DKU1HE+*j%Et&I!+EM4-Cht4AEbupNEb6FA/8B-4FD)dEIS*C(;bpCk6U`@3$6UI4
D/XQ=E-67F-VRrX+EV13E,Tc*Ed8d:ATMr9E,oAsFD55rF!)lJ@:Ls,Bl8'<.3N/8@ruF'DIIR"
ATJu*Eaa$#A1%fnAScF!BkAu.D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+F`S[IASlC)
Eaa!6+C\o'F<GOC@:OCn@qB^(A8,OqBl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k;Is]`G%Dd_ATMr9:i]uSFD55rF!,:-@N]2q@ruF'DIIR"ATKI5$7QDkEb065
Bl[c--YI".ATD3q05>E9-OgCl$;No?+E_RBAS5^uFCfJ8A8,OqBl@ltEbT*++>"^-7nuiX73G#s
;GU1h%14d30H_V`1E^^LB4N>Q+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQUA7]Rg
FCcS*Bk)7!Df0!(Gp$^5Ch7Ys$;tGPDg#\c@:DQ7F*'fa@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[i:IH=9De3u4DJsV>@V'@oDJ()+DBO%7AKXSfFE1r(%14:O:IH<n:IS2):/=h36:FRD
:.HEu:*<M,73G2F<)Q.R+q4kg$;GdgAnc:,F<G"0A0>`-F*&O=D/aE6FCB'/+C]&,+E(j7@:XOq
@q?csF!,O<D/a<:3XlE*$;O#j78b7'792iT+AP@+78b7LFDl22+F.mJEZdtM6m-#S@ruF'DIIR"
ATJu.DBMOoBl8!6@;Ka&A8-'q@ruX0Bk;?/%13OO8K`4qF_kS2@;L"'+CTG3Bk/>pDL!@#;]opc
DII0hA0>DsEb/a&DfTQ'F!,:5CLnUt$7B(TEc5T!D'2;^Ch7Zm-S>i8%15ICART[l+CQBb:IH=B
@<6O%EZen,@ruF'DIIR2+Co2,ARfh#Ed8dJDf9_?FD,*)+DGm>@rH4'Ch7^"Cj@.;DId<tASu$i
DKI">Afs\u+<X6t-Z^D=CiaM;@3B3$De'u)A7]0lFDi:4AS,XoAKYD(F*1r&Bl[cpFDl2F+EMXF
F^oN9Eb-A8BOQ!*D/"$2DfTnA8ge[&G%G]8Bl@m1/g)9/:IH=8Eb/[$ATJu'Bl7@"Gp$j6Bl%@%
/g)99BOu6r+D,>(ATJu&Eb-A*@;0auGp%0M@:F%a+C]J8+C]&&@<-'nF!+t$DBNG&@;]^h+EqL1
DBMOo@q]:gB4Z-:%14Nn$;No?+CfG'@<?''@3BDqF*(u6+A,Et+Co2,ARfh#Ed8dJDf9_?Dfp/C
Bk1ctDe:+a-Z^D@Bl[cpFDl26ATKI5$;No?+B3#gF!+t5ART[pDf-\.AT23uA0>f.+CQC&Df00$
B6A6+A0>DsEb/a&DfU+G."4ca6rQl];F<l%/e&/*ATqZ--Xq%:ATMr@4"+i_@<?0*-[nZ`6rQl]
;F<l+@W6F#F*&cY4""KKF*&ODEa`I"Bk(^q+EV19F<G+.@ruF'DIIR2-OgCl$;No?+B3#gF!,1<
+CT.1AU%X#E,9)./Kf1WAKYE!DffZ(EZfC@Dfd+6DfQtGDfp(CA8,OqBl@ltEbT*+/e&-s$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l39Q+?M+DbIq+Co1rFD5Z2@<-W9Ao_g,+CoV3E$043EbTK7%16'Q+DGY.F`VYF
@<?''CLqc6An>CmF`M&7+E(j78l%htG@_n7AS#Bp@3BH+DIm[(FEo!>Bk)7!Df0!(GqL4=BPDN1
DIn'7+EMX9E$/t8@:XF%FD,5.-t7.;ATMrB+Co1rFD5Z2@<-W9Ao_g,+CQC'F_u(?F(96)E-*45
BleB:Bju4,ARlp-Bln#28l%i-%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!CggcqA8,OqBl@lt
Ed98H$7QDk:-pQUDfB9*+Dtb7+Co1rFD5Z2@<-W&$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1%15is
/g+tK@:UKmEc5e;AU%X#E,9).A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImis
CbKOAA1q\9A8G[`F"_?<@UsUuE%Yj>F!hD(%15is/g,1GB4YslEaa'$+CT)&+ED%*ATD@"@qB^(
/Kf+JDg*=?@<6N5FD,]+AKYi$F)tc&ATJ:f?S`gO/g)hjB5DKqF!a'nI4cX_AThu>-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l36=FA>F`8I4@:O(qE$/Uu@r$4+%14:G5sn:F:`r(j6VCEU+@8@]93"e4%13OO
8TZ(hF!,:5FCfK$Ci"A>@3BW/@;m?2D]in*CLnVs+C\bhCNXS=GA2/4+A,Et/g)98D]iLt@r$4+
+E(k6ASrY#$7QDk:-pQUDfB9*+EV:.+C\o'F<GOC@:OCn@q?cnBk)7!Df0!(Gmt+!A0<7/E-,Z4
F=/28+>Y-YA0<6I%13OO:-pQU@UWb^+DGp?F`7csE+*6lA0<7/E-,Z4F=.M)%15is/g,1GF*(q8
Eb/a!G%G]8+EV:.+Dl%<F<G(9EcP`/F<G%$@r$4+%17,eF*(q8-Xq%:ATMr@%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[s@;BEs@3BW$EbTK7+CoV3E-)Nr,#gj$73Fl=;aXGS:fJQ*<D?:6%13OO-u`U)CLek:
@UWb^F!,UE+C]&&@<-W9C1_0rATJu'F`\a?F=2,P@;L"'+CQC*Df9//Bk1d`+EVNE,%Ph5E$?EM
Dfp(CA8,OqBl@ltEbT*++CT=6E,8rsDBO%4G]YP\+A,Et+Ceht+CoV3E$/S*C`mY8ASrW$Bk)7!
Df0!(Bk;?.@<3Q"+EM77B5D-%8g&1bEbTK7/g+)&EbTK7+CoV3E-!.1Eb-A8BOr<'Df^"CF*(i"
Ch4`5@<iu;D]j+CDfTD38g%YY@ruF'DIIR"ATKIH+B3#c+DPh*F)Q2A@q?ckA7TUr+Co2-FE2))
F`_29+CT)&+A,Et+EMIDEarZ'@rGmh+DG^9FD,B0+D,P4D(Z8).1HVZ67sBkF_u(?Df0B:+=L]<
FCfN8.1HW&A0<7/E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU-uEC.ALSa3Eb/[$ATJu&+Co1rFD5Z2
@<-W9A9Da.+DG^9FD,5.A9Da.+EM[7A8-'q@ruX0Gmt*iE-,Z4FC]N2E'66)F(fK9E+*g/?X[\f
A7$Hr@;BEs-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*2qAKZ,:ATJu4AftW,D/^V=@rc:&FE7lu8l%ht
A9Da.+EM%5BlJ08+Ceht+C\n)F`V,)+EVNEEb0'*@:Uo3@rH=3+CT.u+Dk\1B4W2rBk)7!Df0!(
Bk;?<%14Nn$;No?+ED%0Ddd0!@W6F#F*%iuDe't<@W6F#F*&cP>9G^EDe't<-OgD:+Z_;"HTGVT
FCfN8A9Da.%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k6Z6ph+CQC'Bk)7!Df0!(GqKO5.1HVZ67sBjDfBtT
D.Ra#AKYH$FCfN8+Co1rFD5Z2@<-W&$>sF!A0<7/E+<g*Gpb[gE+*j%+=DV1:IJ,W<Dl1Q04Jm1
DfBtL%17#a+=CW;@rH=3-QlV91E^UH+=ANG$8<Va0Hb^'@W6F#F*(r8D/]pk%15is/g+Y?ARTU%
E+*j%%16WbF(KG9-UUQr5uLNF<(JAG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^CLnVs+DkP.FCfJ8Eb-hC
AS5^uFCfJ8F(96)E-)Nr,#(?r73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<$DbY%15^'6m-Dc
Cj@.EAS#p*FD,5.A8,OqBl@ltEbT*++ED%+BleB-Eb/c(Bl5&8BOr<$D..L-ATBD;C1\T#Bl%?'
F)N1<@;0V$@;0UnDJ()#+Dbb5F<GL6+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++DGm>@3B3$De'u)
A7]1%+<X9P6m,uJDBNS'DImisFCcS'+ED$FEb/ltF*(u6+EM%5BlJ/:FD,*)+F.mJ+Ceht+D#(t
F=n[Y%13OO7qHRLEaa'$+CQC5AM%q6B5)F/ATAo7@rc:&F<G"0A0>i6F<G:>+DG^9H#IhG+DkP$
DBMPI6m-#S@ruF'DIIR2+Co2,ARfh#Ed8dJDf9_M%14Nn$;No?+D58'ATD4$AKZ#)/TPE8BleB-
EZfF5EbTK7%17,eEb/lH3ZrKWDg-//F)t\sC2[Wi+?Op2+>k9[A0<6I%13OO:-pQUF('6'+DGp?
Bl5&8BOr<'@<6O%EZfC@DfcEqEb09&B-;D=Blmon@;9^k?Qa*&@<?0*-[nZ`6rQl];F<l+C2[X'
AS5^uFCfJFBkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rATT&2Bju*kEd8d<Bk)7!Df0!(Gp%3I+ED%%
A8c@%Gmt*);ajY.9M%QK5uLi.6qKaF8P`)I;Fs;U+B2,Z;FNl>:JOSd+q4kg$;YVPDBMPI6m-#S
@ruF'DIIR"ATJu)AS,XoAKYD(F(Jd#@q[!(@<?08+<XWsAKYT!EcZ=FA8,OqBl@ltEd8dGDBO%7
AKYr#FD)e2F!,R<AKYo/Cj@.6Bk)7!Df0!(Gp%3B@<<W%@;[2sAKYJr@;]^hA1euI8TZ(hF!+t$
Ci!Zn+EV:.+<kcIF<Vi<Bk)7!Df0!(GqL3^7<W6[+EV:8F_>A1DJsE3F`\a:Bk)7!Df0!(Bk;?.
@ps7mDfd+2AKYJr@;]^hA0>?,+A,Et+DGpFF!+m6B5_^!+DG@t@3BZ1+EM+9+EV:.D'2_F5t"LD
9N`KIARf.kF(IBA$4R>?76s=;:/"e5A8,OqBl@ltEbT*++Ceht+C\n)@:NeYF)to'+C]U=@;^?5
DKTf*ATAo3Afs]A6m-S[F),hL+AtWo6s!8X<(.p?Bk)7!Df0!(Bk;?.@ps6tDf0B:+C\n)@:NeY
F)to'+C]U=Df0,/FCB6+/g)8G$4R>8AS#gpDJ().Bju*kEbT*++AtWo6r-QO=Wh[(AThX&FE8R5
@q04`ASuTuC`m\>F=2,P@<3Q:Dfm1@E+No0@;]Tu@r-()AKYMt@ruF'DIIR"ATKI5$7QDk:-pQU
D..3k+C];3ATMr9;FNl>:JOSd%17#a+=CW;FCfN8-QlV91E^UH+=ANG$=n*sATT%B;FNl>:JOSd
-OgCl$;No?+C];"DfBtEBlbD7Dg*=GBOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Xq%)DfBtE@W6F#
F*&cP>9G^EDe't<-OgCl$;No?+D,>.F*&O;Ec6)>06;8MFCcS9ATVu9E+*j%%16`gE$-N:B6%p5
E$m^i4$"a"@<?'jBOt[h+F.O,Eb&U#ATJu9De*:%+EM[CEbTT+F(KGI-OgCl$;No?+Du+>AKYMt
@ruF'DIIR2+E1b2BFP;ZBk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l394_[R+ED%*ATD@"@qB^(F`:l"
FCetl$6i,378P+)77K^D78?3=;]o(:6pXd@6m<'I%15^'6m-PmDfTE1+EqaEA0>o(An?!oDI[7!
/g)97AS,LoASu!hF!,%3@:F%a+DkP)Gp%6NAS-($+E)41Eaa'(Df0VK+Auc_ATD@"@qB^(@;Kau
G9A;HATVs;.3N_N+Dbt)A0?)7Eb'56FD,*)+CehrC`mY<BOu3,GAhM4F!,17+Dtb7+Cf>-FCf]=
F"Rn/.1HVZ67sC!DJXS@E-67FA8,OqBl@ltEd8dJAS,LoASu!hF!,@3ARlp+E+EC!Bl7Q+/Kf+J
Dg*=?@<6N5AncF"+Dk\2F(&]mEt&I`2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l36uQRXD.RU,+Co1rFD5Z2@<-W9DdmHm@ruc$$6hl66WHiL:/i?(8OHHK:JO2R=WgL,
8ju*H;^)YX%15LA@s)X"DKK</Bl@l3BlbD*+Dbt6B-;8;@;]UiDJ()5DfTD3E,TH.F<G16EZf=A
DeF*!D/Ej)F"SRX9lG)p+E(j7FD,6&+D>2*AKY]//g+)2D.Oi"Cgh$p+DGpFF!,UCDIm<hF)tc1
Gp$O5A0>H,ASrW$BleB:@:OCnDJ(RE+A[)mATDi7E-67FBl5&,@;KNu@UX%`A0>GqAoD^3F"SS,
DBNeA+E)45DJ=$,+EV:2F!)Z@F)E@I+D#_-DBO.DDf022+s8!uDf9//A8bt#D.RU,@<?4%DBNM,
AThL(ATJu(De*E3+A$Gn95\loBI@jDDfBE.Bl@l3BlkJ=AT2'u@<?(%+<kW9FCfK$FCcS6Ec5T2
@;TjqDJ(.9Ao_g,+EV:.+CT).ATDZsFD5o0+>"][Bl%U"FCfK$FCcS6Ec5T2@;TjqDJ(RG+<Vd9
$4R>7:IH=EEc6,8A7]g)@3BH1D.7's+E(j7ARTY*+Eq7>F!,RC+CoD#F_t]-F<G(3A7[A9=`8F*
@ps6tASuU$EZed5F(oN)Ch4`1ASuU$DI[6#DfQt/+DbJ,B4W2rBle?,Ecb`3Bl@lA+<X5uGAhV?
A0>o(@rH4$ASu$$FD,5.AoD^,ATBCG+B)i_+A,Et+CoD#F_t]-FCB9*Df-\0DfQt;DfTD3A8bt#
D.RU,@<?4%DBNk:FD5Z2F"Rn/.1HVZ67sBmDfQt<ATo8@DfTB0+EVXL+CQC6Bl7R"AKYf'DIjr/
AftW&@s)X"DKK</Bl@lA%16NUFCfK/@<6O3FE0N*>p+PJINTk#>9GF=0d\;_3drMC-sIf_/g+FK
%17&sF<Dr>AoqU)CghC,F*)FM%13OO:-pQUBl8!'Ec`FFASuU$DI[5e$8<S^+E2IF+=CT0FCfK/
@<6O3FE/`j-ZWd?@;0V#+EMXFBl7Q+.![6a@:jUmEZf1,F*&OC@q0Y%Eb0,uAKYo'+=MI`-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$;+)^+E_a:F!,"3@s)X"DKK</Bl@l3Bl5&2ATo8,Df0Z.G]\!Z%14Nn
$;No?+D,P4+EV%%BlnD=FD,5.A8bspASuT4F(K62ASu!h+DGm>An?'oBOt]`$=mjlE$-N:AoqU)
CghC,F*)FM%13OO:-pQU@WH0oAo)`8A7]glEbSuo+EM[CD/X?1+D5_5F`8HG/Kf.KAKYr#H"(2l
CER5-EZeq2FCfK,DJ()6BQ%s'+EM+3FCf?"ATJ:fBP_X*C`n-Y+D5_6+=D5QDJa<1DC5l#%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%15C=+D#e+D/a<&+E(j7Ci=3(+CoD#F_t]-FCB9*Df.0:$7QDk:-pQUCi=3(
+CoD#F_t]-F:AR2+?:QTBle59-ZaEJEbTT+F(KGI-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tKtEDIjr9
Dfp(CDg-(A8l%htF(fK4FCTH8Et&I#6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb;^)YX%15^'
6m-\lEb'56@ps6t@V$[)F(Jl)GA2/4Bl5&%Eaia)Eaa!6+A*bqEc5T2@;U'<+<X6f+F.mJ+CoD.
-ZgJCBl7H(@3A0<6m-GhBl.R+Bm+&1FD,*)+Dk\$FE8RMDfp(CDImBiF!,"3+CQC/BlnH5AKYr4
DeF*!D/F!)B.aW#%16'JATD?)@<,p%D..=-+D#e+D/a<&F!,C5+A,Et+E2@>B6%EtD/!m#+DG^9
8l%i&F!,OBF`Lu'+Cf>#AM,)sDKBo.Cht59BOr<$De*p-F`Lu'+CSekDf-\>D]i\(F<F1O6m-Ph
F`Lu'+Cf>#AM+E!.1HVZ67sBlG[YH.Ch7Z1De:,7F(oN)+A,Et+EqaEA9/l8D]iS%Anc-o+Dtb7
+D,%lBl%L*Bk;>p$4R>;67sBkATM@%BjtWr@3A0<6m-,_Dfp".$>='ZBkhQs?TgFm><3m?CiF9.
+BplLI4cXTEc;Hp%15is/g,1G/TPE7ATD@"@q?d%F`\a:Bk)7!Df0!(Gp%0ADg*=4DL!@9EcQ)=
Et&IsATD?o?YO7nA7%J\+>Y-$+=ART/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[DETV#/okNH
D^Qn[-QlV9Gpa%.%15is/g,4KDg*=JDfTB0+ED%*ATD@"@qB0n@X0)?DfTB0+DG^9@3B3'Dfp"A
FD,*)+CT;%+Du+>+DG^9FD,5.B6%p5E"*.hDe*KfBkhQs?TgFm-XgY.Dfp"H%16ut?YO7nA7%J\
+>Y-$+=ARGCi"-'Aof(;I4cXTDCH\[/g+eE4Y@jiEc<.9De*K.%13OO:-pQUD/"'4Bl7Q+Ao_g,
+=LZ2Ec6)>.1HW%GT\@]%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bF`VYCD/"<-+A,Et+D#(tF<G1(@qfan
FD5<-%14:H<Dujm9hAMW+A,Et+@S[i<$4Xr6V0sC<(TMW+q4kg$<1\M+DkP$DBMPI6m-&OBlkJA
DfTB0+=M,O.3N&:A0<:3A18X2@;[2sAKYK*F*)>;BmO?$+C]U=A7]@eDJ=!$+CQB\:IA,V78?fL
:JFPL:.-4G@rc:&F=n"0.1HVZ67sBkAS,XoAKYN%@s)X"DKI"2Df'?"DIal2@rc:&F<E.XH[\_=
I3<6F+EqaEA0>buD.Oi/CgggbBQ%]tATA4e6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+>=p!+>=63
F)>i<FDuAE+E2?D-[U;;IXNRQ$7QDk%13OO:-pQU@rc-hFCcS'+Dtb7+EqaEA0<HHDfB9*F!,%)
BlkJABl7I"G7=msG9A8BE-H5@A1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15R=DIal3BOr;7@W6O0Eb$UA
ARoLs+EqO;A8cZ7@;]TuDJsW.+D>\;+@K!m<D>nW<'sGU9gMNB+EV1>F<G7*F!+q'ASrW-De*Qo
Bk:ft@;]TuBl8!'Ec`oV+BN5fDBO%7AKZ&(EbTK7+EqO;A8cZ7BlbD<@<Q3m+EqOABHTZ?<(nlF
+@K!m<D>nW<'sGU9gMNB+EDUBF"Rn/%16!UDBNA*A0>AuDf]J4FD,5.-t7.>DfTA;+D#(tF<GdA
DId[0/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k7:^+S+CQC:DfTA2Bl5&8BOr;sBk)7!Df0!(GqL3^
8l%htBlbD*Cj0<5F!,%)Bln',B-:]&E+rm)/g*r1BkM-t@;L!-@ps6tDf0B:+C\n)@q]:gB4YTr
GA2/4+D#e:Ch[BnF<GOFF<GL@ATD4$Bl@m1/e&.:%15is/g+tK@:UKkBk)7!Df0!(Gp%<LEb$;,
DKKe>ARoLs+EqO;A8cZ$$>!`j-ZaEJEbTT+F(KGI-OgCl$;No?+D,>*A0>u-AKWCBF`)56F(KE(
F>,-dARoLs+EqO;A8cZ7@;]TuDJsV>6r-0M9gqfV6VgEN5u'fj%13OO:-pQU@r-()AKYPpBlkJA
Bl7I"G7=lg$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tKtEDIjq_:IH=EEc5](@rri1@:O=rEt&I#6q'R::.69t
:IH=%;GTnR6W>1&5snOG;^)YX%160MASrW0Ec5T2@;TjqDJ()9Bln#28l%htH#IgJFEqh>@ps1i
Gp%$EASrW!+EM+9+E(j7A8,OqBl@ltEbT*+/g*i+@:UL%Df'&.F*VhKASiQ2@rc:&FE8R5DIal#
AS,XoAKZ&4D.Oi'@;]V$+Du+?DK@EQ+B3#gF!+t$DBND"+CoD.AKY])+CQC3Ec5](@rri1@:O=r
+EM%5BlJ/H%14Nn$;No?+Co%qBl7K)@3BN0De`inF<GF/@rcK1/KdV-F`V+:FD,5.E,oN%Bm:b>
EbZ_/DfQtAF^o)-F(96)E--.1$?1$#F*2A;Df9MV3Zp+!3Zp*c$4R>;67sC%FCB&t@<,m$C*7S-
EbTK7Et&IsAT;j,Eb-@@A7]4mB-;;)F)*-4$4R>;67sBsDe!3l+EM%5BlJ/:DJsZ8F!(o!C2[Wq
?YO7nA7%J\+=D5QDJa<1DC5l#C2[X(?YO7nA7%J\+=D5QDJa<1DKKH2FE8f=$4R>;67sC"F`]9]
Eb/hl$:IZW<D>nW<'sGU9gMNB?[?'%4ZX]5F)>i<FDuAE+E2?D-RX7i:4@U=-RT?1.1HUn$;No?
+EMXCEb-A1@:O=r%14p7E-67F-ZF*@F*2A;Df9M@4%`F=;Fs\a?X[\fA7%E;Eb]Z<DJa<1D@Hp^
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$;YPLAKYr4De`inF<GF/@rcL/+CT;%+Co%qBl7Km+DGpFF!,%&F*SmM
D]iP.DJ!TqF`M%9H#IhG+A*btATMp,Df-[L+E)41DBO%7AKZ#)EHPu9ARlooBk)7!Df0!(Bk;?.
@;]TuEcl7BGA2/4+=M8I.3N_N+EM+9F`8rB$7QDk:-pQUF(KH9E$0+?De`inF:ARtD'13FEb]Z<
DJa<1DC6PL>9Iip+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[d
A8--.H#IhG+DPh*E,ol/Bl%?5Bkh\u$6ho,8Q6g8:K::8C2[X%Ec5Q(Ch555C3(R.$4R>DBOu'(
8l%htCi<`mF!,R<AKZ&(EbTK7+F[a0A8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]3BlbD.
G\(B-FCeu8+B3#gF!,O6EbTK7+Ceht+C\n)F`V,)+EVNEF(KG9F`8Hq:IH=IBOr<1@<iu@Dfm1H
@;^0>+AQisAKYZ)G9D0LFWb1&DBNM8ARfk)AKYr4De`inF<GF/@rcL/+EqL1DBMPI6m-;a@:XF%
GA2/4+EM+3FCf?"ATJu1Bkq9@%13OOEbupHE,o]7F`)&7Df-pF>9Iip+?MV3@W5gqE-WR8E-,Z4
F=.M)%160&;GKeY7lhc6FDl22+F.mJEZf=ADe<^"AKY])+E)./+E(j7H#IhG+Co1rFD5Z2@<-'n
F"SRX<+oue+D,>(AKY].+ED%7ATT&=BOu'(8jQ,nF`:l"FCfM9FD,5.8l%ht@:WneDCuA*.1HVZ
67sBkBle60@<iu1De*g-De<^"AM.\3Et&IfF<GU8@:W_RC2[Wi+DPk(FD*%N@:WneDK@IDASu("
@;IT3De(M9De*g-De<^"AM.\3F!hD(%15is/g+Y?Df]J4FD,5.C2[X%Ec5Q(Ch555C3(MABl7I"
G7=lg$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JM?+,#qQ1+A,Et
+@npp:`r&!6m+ln6WHiL:/jMY8P`)*%13OO8T&Tk@;Ka&FD,5.-td+/ATD3q05>E9A8bt#D.RU,
.3N&0A8c?.FDi:EF(HId:IH=%6q/;4ASc<<+:SZ,%15is/g+tK@psInDf-\9Afti,A1hh3AfrZJ
Bl8!6@;Ka&@:WneDBL??ASu("@;IT3De*Bs@s)X"DKI<MGA2/4+A+pn%16ih@<?0*-[oK7A8c@,
05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EQ.%13OO:-pQUDfB9*F!,49A1hh3Aftf"
+CQC3A7cs)ART+\EZf(;+CTG%Bl%3eCh4`-DBO4CF`JUGH#n(=D%-heDe*NmCiCLN%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[rF_tu(Ed8d9DIal%Bl7?q+ED%1@<-.)/e&.eBOr;uDes6.GA1r-+E2@0@ruEp
ATJu2@;BEs8l%htD/XH++E2@>A9DC(Bm+&1@;]TuF`V,+F_j)J$4R>7:IH<n:IS2):/=h36:FRD
:.HEu:*<M,73G2F<)Q.R%13OO6:!t3<DXf)5sn:F:`r(j6VCEU%13OO<'a/G+@.,K6W-KP<$4S/
9i)9+%15fq919sh+AG.#<(0\-;FN0877TpJ<(0\-;aXGS:fIl2%16$&<$4k+6;g*I=Wg+(6W?WQ
:-hcL78k=.:EWP(5t"LD9N_f3%15`s78P+)77K^D78?3=;]o(:6pXd@6k'J4$:IZW<D>nW<$4S#
6W?WQ:-hc\+AY<r771$Q%13OO6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb;[j'C$:@fl<)64[
>"'Q+:IH<o6qL?#7R9C59M&2T78jX&%15Kl7S-?D+A,Et+Abs38ju*H+AG-h;GU4#$4R>26qL?#
=\i$q+DPh*E,ol/Bl%?5Bkh\u$4R>B;ahg$:IH<r78-N#5u'fj6r-0M9gqfV5u^EO:(7O>$4R>A
BOu6r+CT;%+DQ%?F<GXCD.Oi.Afu2/AKXT@6m-Gh@:OCn@qB^(8K_\TG%De.Dfor.+E_a:Ap%oB
+<Wsk+F.mJ+E_a:+A,Et+F.mJ+EqO9C`m\;Ddm-aCj@.8Bl7H(H#IhG+E)IA+Dk\3BQ%F&/g)8G
$4R>6AfuA;FWb:1DIakuDBN@1F`V,+F_i1;ATVU(A0>i-ARTXk+DbV2+Dk[4CMn'7/g)9.+Ceht
+C\n)Eb/ZhBOt]s@<=O>$4R>7DeO#26=FY@EZbeu9jr'PBHT&a0fTUL@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDk%16igA7Th"E&':E5seOB<(o_D3ZoeB:IH<R1+=>EDfp)1AKX?YA7ZlOF_u(?;e'i^
E--.K%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n
$7QDk9L2!4:JFPP:/k.T3ZoeLBPDN1CggcqA7]UrDKBo?@<?(%+D>\;+EVNECi<`m+CoV3E$.bK
6m-P\EbTK7F!*%WEb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\4ZX]?%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[hDKKo;A9DC(Bl@ku$;+)^+EMIDEarZ'@rGmh+DGm>A8-+,EbT!*FCeu*
Bl5&8BQ@Zq+A,Et+CoV3E$043EbTK7F"SS'F_u(?F(96)E--.D@<,p%E,8rsDBM5D6V0il8g&1b
EbTK7F!,R<@<<W%@;[2sAKYf-@:Wq[+EqOABHTnpF!,OG@;]UaEb$;6@rc:&F<GOCDe!@"F(oN)
+Eh=:@WO.2$4R>ABPDN1Cggcq@<6L4D.Rc28l%ht@;]TuF*2G@DfTr6DJ()#A7TUrF!,.)G%De*
AS#a%Bl8!6@;KakA1eus:IH=6DIal2F`;;<Ecc#5B-:VnA8c@,+Ceht+C\n)Bl8!6@;KakA0?)1
FD)e=BOr;Y+E1b!CLLje+DkP)@:s.l/e&.:%15is/g,7S+E_a:+CQC'F_u(?F(96)E-*3p:IH=B
F`VXI@V$Zj@ruF.AISueAT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bDf00$
B6A6++CQCAC2[X(Dfp)1AKYMtEb/a&DfU+4$<1pdEcl7B@3A0<6m-#_D/^V=@rc:&F<GX=D/a<:
+E)41DBN@1DIn#7A8,OqBl@ltEd8d9DIal4F(HIB0HiJ2.4u_P$4R>3DfQtBBPDN1CggcqFD,5.
F)Q2A@q?cnBk)7!Df0!(Bk;?.@<,p%@rc-hFCeu*Bl5&8BOr;7IS*C(;bpCk6U`FHEb0&qFD5o0
+Co2,ARfh#Ed98[+B`W*+EqO9C`mV,ARlp*D]iP.DJ!TqF`M%9@3A/bAoDKrATAo8D]j";Bl8#8
FDi:1DBN@tFEM#.+Co2,ARfh#Ed98[8K^r2;GU%X9N`K9770jF9gqfF+E_a>DJ()#+Co2,ARfh#
Ed8dLBOQ!*BlbD7Dfd+9DBO%7AKXSfF*VhKASiQ3Eb/f*+B`W*+CoD.-ZgJT@;^00H#IhG+E2@4
@qfk(F!,"-@ruF'DIIR2+Cno&@:EYdATJu'ASH$p+EqO=ARlomGp$g=F*(i,Ch[d"+EV:.+Dtb8
F<F0uG%G]8Bl@lA%13OO6=jbIEb-A4Ec5H!ARoLmB-:]&DJ!TqF`M%9@3?tI8l%iR:K::[74B?i
Bl[cpFDl2F/g*r-+A+UG0R+^4;,eZZH#n(=D0$hABOr;RDf00$B6A6+01KkrA7]e&+Dk\-FWbUA
ASuQ3FD,5.A8-'q@ruX0Gp$^;Ch.*t+Cf>-Anbn#Eaa'(Df-\0Bl%?5%14Nn$;No?+Cf>-Anbn#
Eb-A%+FZpY6rQl];F<kqA8-'q@ruX0Gp$R-AoD^$+E2@>@qB4^Bl7Q+FDi:DBOr<(AU&;>F*(u4
/e&-s$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is]`G%De8Eb0E.Dfp+DCggcqA8,OqBl@ltEbT*+/e&.h5uLHL
:.I>f<(KG#:.88a+B)6.:`rY)9i"eY;]nJ"6W?WQ:-hcL78k<r;FNlN7787b=WgO=8P`5,;H6Ij
+AYHL<(KSZ+A>'f/g)9984=Xh8OHHK:JO2R8OZQ#.!9WGCiaE2@:Uo3C2[X!Ddd0-+DPh*A7]q#
Ddd0*+BM-.9HZYj+@JXl78u]D/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m#+@Aq"<(0P];]nk*+B1m#
;ahfs8OHHK:JO2R8OZQ#6r+q#:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^/e&-s$<1\QF!,OG
AT/c&AS,XoATJu&+Eh=:@N]c+@<<W4ASl@/ATJu1@:C@#Dfp)1AKYMt@ruF'DIIR"ATKI5$7QDk
;Is]`G%F?U@T.2fEarZKBk)7!Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A'AhG2RIS*C(;bpCk6U`@F
/NP"pDf9_\/g+nJ@<?0*-[nZ`6rQl];F<l#+CoCC%144#F)>i<FDuAE+=BGt8l%iR:K::[73H,T
Eb/a&DfU+GBlbD7Dfd+CATW'6+>"^WATW'6+CT.u+EVXL+CSnkBl5ON%16Z_F(K&t/g)_uAn?4$
F*&O>E+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[W8Bkh]:+CoCC%144#F)>i<FDuAE
+=BcW6rQl];F<kq@:WneDBNY7+Du+>+DG_7FCB!%ARlo8+DG_7FCB!%+CT.u+EVXL+CSnkBl5ON
%16Z_F(K&t/g*_T=%Q.0A8a(0$6UHd67sBjCh7$q+E)CE+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p
$6UI4BOu!r+=D2?+>7dY06&*Y-S-ZdDf9_K-X:e9Bl%j,Ddd0(.4chj-OgD*+EM4-Cht4AEb$:G
F!*,U+<i0a-us6EF=\eEC2[X!Ddd0(.4chj-OgD*+EM4-Cht4AEb$:GF!*,U+<i0a-us6EF=\eE
C2[WnAThm.@:U`7/12Vh%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC.3N\MF`Lu'+Co1r
FD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>qCgh3sF!,17
+A,Et;bpCk6U`,:@<?1(+E)-?9PJBeGT^F4A0=TT@j#i<F*(u1Et&I!+EM4-Cht4AEbupNEb6FA
/95ZIF=\dmF`_>6F)5c'A1%fn+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9Ci<`m-OgD*+EM4-
Cht4AEbupNEb6FA/95ZIF=\dmC2[WnAThm.@:U_p$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cU
D.-p-Ch[d0GUXbVDfp)1AKYMt@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.D_;J++<Y`BDfp/@
F`\`R7<2gXAKYE!Gp%'HAThd+F`S[IASlC)Eaa!6+DbIq+EMIDEarZ'A8,OqBl@ltEbT*++DkP)
F^]*&GqLHR$>"*c/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@DEb0E.Dfp+DCi<`m
+DbIq+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sC'DK9<$BleB-EZcqVBkM=%Eb-A)EcQ)=Et&I1+>=o`
+>Y-\AS5O#4s2pJ-ZsNFCiaE2@:UKqDe*[&@:UKqDe*BiG&2)*A1&L(+>Y-YA0<6I%13OO:-pQU
@r,^bEZf:CF<G+.@ruF'DIIR2+Co2,ARfh#EbT*+%16!ED/XT/9OVC/Dfp)1AOL6BFD5Z2@<-'n
F!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;eART[l+E_d?CiaE2@:UKkBk)7!Df0!(Gmt*KF_u(?F(96)
E--.D@<,p%Ci<`mARlotDKKe>A8,OqBl@ltEbT*+/g)9(Eb/[$AKYD(.!9WGCiaE2@:Uf0A8,Oq
Bl@ltEd98H$7QDk:-pQU@rc-hFCcS'+Dtb7+E_d?Ci^_0Bl[cpFDl2F+DG^9."4ca6rQl];F<l%
+>"^MF<GdACht5'AKZ#)DIIBnA0>\sFCfJ%$;No?+B`W*+Dl7BF<G(3DJ!TqF`M%9."4ca6rQl]
;F<l%+CT.u+E275DKI"CD]iJ++CSc%F^])/ASlC.Gp$X3Eb/a&DfU+U%13OODIn$&+=D;RBl%j,
Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+F`_>6F)5c'A1&ff-Z*:+DBO(DBl%L*Gp$X3@ruF'DIIR2
-OgCl$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*++CT.u+E)41D@HqkA0<7BFD5Q4Ci<`m
-QlV91E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqSBOu'(8l%htA9Da.+EM%5BlJ08+EDUB+EV:.
Gp$X9+Du+>+Co2-FEMV5+F.mJEZek7EcP`/F<F0uASu[*Ec5i4ASuTB+<WsdC`mq?Eb'56@<,p%
A7]@eDIm?$Bl5&%+Du==@V'RkA0>r'Eaa'"BHV,0@ps1b+EV:*F<G:=+CfG'@<?'k+EqL1DBMPI
6m-;a@:XF3+<X9P6m-#_D/^V=@rc:&FE8R8Ble60@<iu4ATMp$B4Z-,@:jUmEZf1:@:X(iB-:Yl
FCSuqF!,C5+E(_(ARfh'/g)99BOr<(AU&;>CggcqF*(u4+Dbt)A9/l8BOr</FD5Q*FEo!>Bk)7!
Df0!(GqKO5%160FEc,T/B0%/GF_u(?F(96)E--.D@ps6t@V$[*ATE&=Cgh?sAKZ&4+DGpFF!+m6
B5_^!+DG@t@3BZ1+E_a:+CT)1@<lo:F`V+:-nlf*GUY6f+A?]^A8,po+CQC'F_u(?F(96)E-*4:
DKKe>8g&1dF)u&6DBNM$Bln96F!+t$DBNG0@<6*)8g%_aEZfO:Ed8dD@<-!l+EM%5BlJ08/e&.:
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(GqKO5.1HVZ67sC$
F`&=DBOr</FD5Q4+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-
F`Lu'06MANCi_4CC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgB4YslEaa'$+E_d?Ci^_/Ec6#?+ED%*
ATD@"@qB]j$<1\M+DbJ-F<GF3F)tc&AKYMtF)Yr(H"CM/@X0))+CoV3E$043EbTK7+DGm>@3BT%
D/!luATAo8D]j(3B4YslEaa'$+CfG1F)rIEAS,LoASu!hF"SRX8l%htA8,OqBl@ltEbT*++DkP$
DKK<$DBO.AEb$;&Ec6#?+ED%*ATD@"@qB^(FD,*)+CT;%+E_a:A0>T(+DkP)Gp%<>H#kS\+B3#c
+CfG1F)rIEAS,LoASu!hF!+n3AKYl/F<GXHDfTE"+DG^9A9Da.F!+n/A0>`3F*&O6AKZ#)@rc-h
FCeu*@:jUmEd(r4A90@4$7QDk:-pQUEb/lpDImisFCcS;FD5Q*FD5<-+CfG1F)rIEAS,LoASu!h
F!+n/A0>r,Dg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%13OO
:-pQUD..3k+E_d?Ch\!*ATJu&+ED%%A0>f.Cj@.6Bk)7!Df0!(Gmt*kE-#T4+=C&U5t"LD9N`_P
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMVk@:UKqDe':a<+ohcF`_>6Bln'#F!,"-@ruF'DIIR2+DGm>DJs_A
Ci<`mARlolDIal"Ec6#?+ED%*ATD@"@qB^(BOQ'q+C\nnDBO(@A79RkA1euI<,WmhDf'H0ATVK+
FD,5.Eb0<6DfT9.Bl@l3De:+a:IH=HDfp)1AKYK$A7Zm-AKYl/G9CC9ART[l+CT.u+Dbt)A0<:8
De*[&@:Uf0@;]Tu-u*[2A7]q#Ddd0*/e&.:%15is/g+YEART[l+Co1rFD5Z2@<-'nEt&IoATqZ-
-YdR1Ci<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q05>E9Ci<`m-Rh,)C2[W*F)Q2A@q?cmDe*E%A8,Oq
Bl@ltEd9#A$>sF!A0<77De*BiG&2)*A1'GeC2dU'BHS[O8l%iR:K::[75&CoA7T7pCi<`m-Rh,)
C2[W*A7]pqCi=90ASuT4E-67FA8,OqBl@ltEd9#A$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=HDfp)1
AKYK$A7ZloAT23uA9/l3DBNk,C1UmsF!,17+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(GqL3^<+oue
+ED%0@<?4%DKBK*E$/k9+DkP$DKK<$DIm?$@X0)<BOr<*@<?0*DfTB"EZf:4+Co1rFD5Z2@<-'n
F"Rn/.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJt'$8WfCA0<6I%13OO:-pQUDfB9*
+=LuCA8H0mA18X0DIak<F`_>6F)5c'A17rpDe'tP3[\Z\A8H0mA0?#:Bl%j,Ddd0(%13OO:-pQU
A8-+(CghT3A8,OqBl@ltEd8dADJ!g-D..O#Df-!kA8,S'+<W?I$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqH
Ddd0!8l%htF)Q2A@q?cmDe*E3+<XWsAKXT@6m-#S@ruF'DIIR2+CoV3E$/k9+DbJ,B4W2pARf.k
F(HJ.F<G(3DKK<$DK?q/+EM[7F*(i.FD50"+CT,*F`):DDe:,&De!p,ASuTuFD5Z2+CT.u+EV19
F<G+&FC?dE8TZ(l@<iu;@;BEs@3B/nG9Ca@D.RU,F!,RC+Dbt)A1e;u.1HVZ67sBsDdd0!C2[Vl
$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[W8Bkh]:%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[qAS5RlATD4$AKY`+A0>B&Df]tBEb/ioEb0,uATJ:f6=jbIEb-A6AS5RlATD4$Bl7Q+
C2[W1F!+t5Df]tBEb/ioEb0,uATJu1Df9D6@<<W6BOr<)E+No0A8,OqBl@ltEbT*+/g)99BOr;7
C2[X!Ddd0*+Co1rFD5Z2@<-W9DJs_ABOPs)@3BT%An?!oDI[6#E+*j%+EV:*F<G:8@r-9uATJtB
F`_>6F)5c'A19,?$7QDk:-pQUDJsW.+EV:.+=LuCA8H0mA18X?@<?/l$=mj]INU<R$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqF:IH=8Ec6#?+ED%*ATD@"@qB^(GA1l0+Co&&ASu$$Df-\?FD5Q*FD5<-/e&.:
%15is/g,1GB4YslEaa'$+=LuCA8H0mA18X2Ec6#?+ED%*ATD@"@qB^(@;]TuF(fK9+D,>.F*&N^
+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D]gDT%13OO:-pQUD..3k+=LuCA8H0mA18X0
+ED%%A0>f.Cj@.6Bk)7!Df0!(Gmt*kE-#T4+=C&U5t"LD9N`_P$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk
@:UKqDe*BiFq"dRDg*=?ATT;@+Dbt)A0>;uA0>B&Df]tBEb/ioEb0,uAKWC9De*BiG&2)*A19,R
+=LuCA7T7pCi<`m.3N>G+EqL-F<F-t@ps1i+EV:.+<k?-FtIN=H"D"?/g)99BOr;sATfYA@<lF)
+DGm>@3BN3F<G+.@ruF'DIIR2+EV:*F<GX=FE8RCDBO%>E$0(2+CQC1F_tT!EZf:4+EMX5@VfTu
A8,OqBl@ltEbT*+/g*Q)EbTE(+Co&,ASc:(D.RU,+E).6Gp%3BAKYMpFtIN=H"D"=@q]:gB4Z-:
+<Xg*FWb1&DBNM!F(oH9+ED%:Deio,@3B)lFtIN=H"D"=A8,OqBl@ltEd8d:Gp$U5Df]W1B-:o1
/e&.:%15is/g+Y?Df]J4DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW)DBNG-EcP`$F<GO2FD)e8
Eb&a%%14m6De't<-OgE$A0<rp-YdR1A7]q#Ddd0!C2[X!Ddd0!F`_>6F)5c'A1%fn%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15dI@:UKhDIal"Ec6#?+ED%*ATD@"@q@8%$7QDk:-pQUCi<`m+=LuCA7T7pCi<`m
.1HV<+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A-OgCl$;No?
+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I7G\M5@F!*%WA7]@eDIml3E-67FA8,OqBl@ltEd8dH
@<?/l$>4Bu+=CoBA8c?54+/_(B6%r6-YdR1Df-p3$4R>;67sBjEc6#?+ED%*ATD@"@q?)V2'@5u
+>=pNCi<d(-9`Q#/g,1GG&JKN-Qij*%15is/g+\9G%GK.E,B0(F<GO2FD)e-Bk)7!Df0!(Bk;>p
$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFCcS,F_kl>+Cf>,D.RU,ARlouDe'u3@rc:&
FE7lu<+ohc8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*++D>2,AKYl/G9C@+ASrW2ATMs3Eb/c6
+:SYe$<1pdB4YslEaa'$+D,b4Cj@.5Df'?&DKKH#+EVX4A8-."Df0!"+A*bt@rc:&F<G10Ch7Z1
AoD]4FD,5.@rH4'Df0-(FE8RCAfu2/AKXT@6m-PrF*(u1+F.mJ+Ceht+EDUB+CQC6@rc:&F<GXH
DfTE"+DG^9FD,5.8l%htA8,OqBl@ltEbT*+/g)99BPDN1F*(u4+EDUBF!,R<BlbD<@rc:&F=n"0
.1HVZ67sBnASu("@<?''8l%htF(96)E-*47Bl%@%+DG^9Ap%p+Gp$U8D/Ej%FCeu*AoD^,/e&/.
D'138F_PZ&C2[X(Dfp)1AL@oo%15is/g+Y?Df]J4A8,OqBl@ltEbT*+%14m6De't<-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l3;Is`SD.Oh^:IH=ADdd0!A8,OqBl@ltEbT*+/e&.eBOr;Y:IH=HDfp)1AKYK$
A7ZloBk)7!Df0!(Bk;?.@<,p%DIIBnA0<:8De*BiFt"O^C2[W3+CT.u+=MASBl%i>/g)92@;^?5
FCfN8+CT.u+C]J-Ch+Z0@rc:&FE8R=DBO%7ATME*A8,OqBl@ltEbT*++DkP&AKZ,:AKYo'+EV:.
F(HJ3@;TRs/g)99D]iS)G%De1DKKe>8l%ht@rGmh+DGpFF!+m6B5_^!+DG@t@3BZ1+Cf>/Gp$O5
A0>o(DIIBn+EV:.+Dbt)A0>Ds@ruF'DIIR"ATKIH<Gl;bD/Ej%F<G"0A0>o8DBO%7AKYT'Ci"$6
Bl7Q+Ch[cuF!,RC+Cf>/Gp$O5A0>o(DIIBn+EV:.+Dbt)A0>Ds@ruF'DIIR"ATKIH%13OO=$]_Z
8PVc:+B;0(:JFPP:/i?3:/"e58Oah*:K8N*:EWD.<$4J#;FNl>=Wg7$<^e,ZC2[WnATfLF-u*[2
.3LoO6m*n#FD5Q4.3M#M6W?WQ:-hcL78kfJ$7QDk:-pQUF`)52B5)F/ATA4e:-pQU1E^^LB4N>Q
+?MV3F`_>6F)5c'A0>W*A8H0mA0>W*A7T7pCi<`m+E_d?Ci^_6De'u*De*BiFsd_+%15is/g+Y?
ARTU%@;^?5C2[W*F)Q2A@q?cnBk)7!Df0!(Bk;>p$;No?+AQisANCrDDf'?"DIdf2@<,p%=(uP_
Dg-7FDfTQ'DKKH#/g*W%EZfLBBm:bAH#n(=D0$-n:-pQUEb0*+G%De)DIal"DfBtEA8-'q@ruX0
Bk;?.D..=)@;Kb*/e&._67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&
Ci^sQ/12Vh%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lXC2[W1.4chj
-OgDX67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]p3.4chj-OgCl
$;No?+Cf>/Gp$X3@ruF'DIIR"ATJtG+>7:KDfBf4Df-\-DfBE%F!,L7EHPu9ARlopD/aTB+EM[7
A8-'q@ruX0Bk;?.%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&CiaE2
@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jtWBl%iq-RgSo+s8OM+>8!f%15is/g,4KASc0*
-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fCi<`m-RgSo+s8'W/1>7P@<?0*-[nZ`6rQl]
;F<lXC2[Wf-RgSo+s8OM+>8!f%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q
>\\1fA7]q#Ddd0(.4chj+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiG$HCD/12Va04c7ZGpa%.
%15is/g,1G/TPE8BleB-EZfR?FD)e7ATo87@;TRs%15is/g,1GB4N,4F`_>6F!j$tC2dU'BHS[O
8l%iR:K::[79jtWBl%i<.6AniASu("@;I'/FD5Q*FD5<--OgDX67sC$AS5Nr-YdR1-T`_kE+*j%
+=DV1:IJ,W<Dl1Q>\\1f-Rh,)C2[W*F)Q2A@q?cmDe*E,%15is/g,1GB4N,4C2[WnATfF_-u*^0
FD)dEIS*C(;bpCk6Ub6pDe*BiFse_#-YdR1+Co&,ASc:(D.RU,-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
;fuqo@<-W&$<1\QF!,:-@N]`*Dg,c'+D>\;+EVNECi<`m+CoV3E$043EbTK7F"SRX8l%htF)Q2A
@q?cmDe*E%A8,OqBl@ltEbT*++EqC;AKYf-@:Wq[/g)99D]j1DAKZ).AKXT@6m-PhF`Lu'+Co1r
FD5Z2@<-'nF!,=.CLnW0F`M%9FD,62+CT;%+DtV)ARlo3C2[WnATfLR+=LuCA18X0DIak<F`_>6
F"&^N$4R>7DeO#26=FY@EX`@M@<,jk+>PW*3"64(@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKi
Bl8$5D_a1D5seOB<(o_D3ZoeB:IH<R0e"5:DKKo;A9DC(Bl@l:%15cp6:"UN85E,H3Zp+!3Zp*c
$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3ZoeLBPDN1
CggcqBl8$5De+!#ATJu9BOr;Y:IH=HH#n(=D'1DQEb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*
3%#.B9L2!6;Gp:g;a!/a0b"I`5se%:6WI&J3Zp*c$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBN"o@<<W+F!+(N
6pD+f8l%htBlbD*+A*c#DfTA2F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1/e&-s$<1\M+C\c#
Bk&9"A7]0l@V'4eDIak^:IH=>F!,R<@<<Va+E2@>B6%EtD/!m#+DGm>@V'V&+EhI1G@b;-@<3Q0
EbAfuBmOK2B-:V*@rH1"ARfgrDf-\9Afu;9Eb'56FDi:@ATDC$Ebuq-+EV%5CG$`*EbAfuBmO?$
+Cf>+Ch7*uBl@m1+E(j7GAhM4F!,.)G%De)+C\o(FCfJ8DIIBn3Zpg^6W?WQ:-hcL78k?=$7QDk
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%15^'6m-2b+CQBb+CSekDf.0M+A$YtBlbD2DKBo.Ci!Zn+DG^9FD,5.
."5T8A8c@,>\@VcATD3q>\\1f.3N)?@;]Rg+E(j7FD,5.@s)g4ASuT48g&2#F*(u1+D,P.A7]d(
@X0)<BOr<*@:O(]B4W3&@;]LdATAo3EZeh:+E_RJBlJ$*DJ()6BOr;sBleB:Bju4,Bl@l3H>.=@
-u*[2/p_5N.4u_c<+ohcDIn'7+DbIq+EMX9E$/k4Bln&tCh\3,F!,R<AKXT@6m-PrF*(u1/e&.:
%15is/g,:XARlomGp%3BBlbD5@:BZQEb065Bl[c--Y@(/ATJu)BlY><@<633%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[rFCB33+A,Et%16'JBlbD<FCfD6F*(i2FE8RHBOr;Y:IH=HH#n(=D(Z8).1HVZ67sC%
FCB33+DPh*+>"^GEb/[$ATJu2@<6O%EZet.Ch4`'Aftu&@qB_&@<-W&$?B]tF_Pl-+=Cf5DImis
CbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AucfDg#\7Derr,CggcqA8,OqBl@ltEbT*+%15^'6m-2b
+DG_7FCB!%ARlp-Bln$,F`\a7DL!@8Bk)7!Df0!(Bk;?<+<Ve+D]j1DAKXT@6m-bnFWbODF*&O7
Eb/[$AKZ&4D.Oi#Bk)7!Df0!(Bk;?<+<XWsBlbD5@:C@%F(KD8AoDg4+D#e+D/a<&+Co1rFD5Z2
@<-'nF!)lI@:CZ:+=M&7@Us%n.4cSiFDlFR+CT.u+=M2F@<lg'DCI1\+A,Et+Co1rFD5Z2@<-'n
F!+n3AKYK'ART[lA0?)1FD)e=BOr;7DIn$&.3KgPATo8-Bk)7!Df0!(Gp4ASATD64+:SYe$:8<9
DfTD3@rc-hFD5W*+DbIq+Co1rFD5Z2@<-'nF!,L7D/XT/+CT/5+E2@8DfQt:@:C?iBk)7!Df0!(
Bk;?<+B3#gF!,OGAT/c&AS,XoATJu&+E_d?Ch\!:+EV:*F<GdACht5*Eaa$#+Co1rFD5Z2@<-'n
F!,(8Df$V-AS,@nCige9De!3tBl@m1/g*`-+DGm>Ecl7BBl5&8BOr<(AU&;>F*(u4/g(T1%160&
;GKeY7lhba7NbZ$73GPu9i+V`5uLi.9L1uf6qKaF8P`)I;Fs;U+@Aq"<'a)N+A#<t:JsnQ<(Tk\
+B_K?+@AFm73Fl_:K:@:6r+q#:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^+Unc-%16!ED/XT/
9OVBuBk)7!Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A0Df9_\/g+nJ@<?0*-[p2ZATB.-$>F*)+A#%(
8PUC=D_;J++<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>\mhXA7]p.-OgD*+EM4-
Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucsCggcs-OgD*+EM4-Cht4AEb$:GF!*,U+<i0a
Ec5l</14\;De*Bm@rucsFDlFK-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucs
E,8s.E+No2-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=MGJDCH]=Bk)7!Df0!(Bk;?.ATD4#
ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5&4@<?1(+E)-?9PJBe
GT^F4A0=TT@j#i<F*(u1Et&I!+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05P'+A7]p3
%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFCggd#%144#F(f-$C`k*GD'1ENAfrHP
Ec5l</13)cDe*Bm@rucFFDlFP%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFE,8s.
E+No7%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9-uEC&05P??Fa,>XA8,OqBl@ltEbT*++D#S%
F(Jl0%16Z_F(K&t/nAlQ%144#F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5BlA-8+EV13E,Tc*Ed8dD
@:C?iBk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/
AKYE!Gp%'HBlA#7CggcqA8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5A8,OqBl@ltEbT*+
+>"^MB5VX.AKYQ)Ec5u>%14d30H_V`1E^UH+=ANG$4R>;67sC'DK9<$BleB-EZee.Gp$p3@N]2q
@ruF'DIIR"ATJtG+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcEb/lo-9`P63[\`P@Us%n+DbIq+EVOI
+E2.*H#R>4-OgCl$;No?+ED%1Dg#\7A8,OqBl@ltEd8d<Bl[cpFDl26ATJu&DIakuCht5(Df0Z.
DKKqB/Keb?DJsQ,+D#S6DfTn.$;tGPDg#\c@:DW=@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k<+oue+EMX9E$/Y2ART[lF!,R<AKWC;@:CZ.@;]Tu-u<=$A7]p5+Co1rFD5Z2@<-'nF"Rn/
.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBjEb/[$AKWC;
@:CZ.@;]Tu+=M&7@Us%n.3N/8@ruF'DIIR"ATJ:fDIn$&+=Cu6@ODTlDIn$&+=Cu6@Us%n-OgCl
$;No?+Dbb5F<G"8@;0Od@VfTuA8,OqBl@ltEbT*+%17#a+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM_o
ASu4"B-:V*@r-()Bl7Q+A8,OqBl@ltEbT*+/e&.eBOr;Y:IH=8Df'?"DIal%DfQt=E+Np$DJ()#
DIal"Ci=B/DJ()&Bk)7!Df0!(Bk;?.BlbCFDe(:>DfQsKDfB9*+Co1rFD5Z2@<-WB/g*b^6m,uX
D/E^!A9/l%Eb-A7BQ%p5+CT.u+D"u&Gp%3I+EVmJAM+E!%14M%A18X2@;[3+E+No0A8,OqBl@lt
EbT*++AtWo6s!8X<(.p<DIakf76s=;:/"eC+@1&kH#IgJD/!WrF<G.>E+NO$+AtWo6r-QO=Wh6h
@ruF'DIIR"ATJu(@;]t$F<G%(+Cf(nDJ*Nk+C]U=8l%ht@rH4$@;]Us/e&.:%15is/g,(OASrW2
ART+&GB.D>AISubA0<79@:EbYFsd_+%15is/g,(OASrW2ART+&Df0B:%14j5De't<Cggd#%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[rDf'&.@rH4$@;]TuEb0?8Ec*"0De*E%@UX=l@ri(d6#:?[8l%ht@rH4$
@;]Us+ED%8F`M@B@W-L&A0>]&F*&OFATN!1FE9&W<+ohcAnc:,F<G:>ASiQ(F!+m6Eb0?8Ec*"0
De*E?+=Jrn+D5V2A0<9S.3N).A1euI;Is]RBl7X&B-:o1ASlK2@<,p%D.Rd0@:s.m+CT.u/0K(V
F^]*&Gq:(LEcQ)=+ED%0@<?'k+DG_*DfT]'FD5Z2/g)9/:IH=8Df'?"DIdf2E+O'%DfT\;AU&<.
DKBN8AKYE%B6A'&DKI"2BOt[hBl7Q9+<X6f+F.mJ+C]A&@;?uo+A,Et+Cf>,D..<m+E2..@<6!&
ASkjiC`mS++=L]-CLqO$A2uY8B5M'kCbB49D(-T9DIal3ASc0*D.Oi6BOQ!*H#IgJA8,R,%14Nn
$;No?+EMI<AKYQ)Ec5i,Dfp+DDfB9*+Cf>,D..<mEt&IpA0<76+CT+0@3BE$F)u&5B-:`!@ruF'
DIIR2-OgCl$;No?+C\bi+EVmJATJ:fDe'tN%13OO:-pQU@UWdiEa`j$Et&IpA0<ZN1F+>WDf7!4
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBM_mCh[cu+A,Et+CoD#F_t]-FCB9*Df-!k8l%htBOPs)AU&<.DKBN8
AKWC?A7d85A8bt#D.RU,@<?4%DD!&(:IH=9De!p,ASuTuFD5Z2+Ceht+C\n)@:NeYF)to'+EqOA
BHVD1AKWC9De*NmCiCgGG%G]'/e&-s$7KY-A8#OjE%)oNE+*s.F!+m6:ddbqEb/ZiATAo8@<63:
+A,Et+E_a:+A+#&+Cf>-Anbn#Eb/c(:ddbqEb/ZiATAo3DBN"pDId[0F!+n/A0=Q[DKU1HF*VhK
ASlK2@;]TuFD,5.,&_F3DB^3EBOu!r+Cf>,D..<m+E)-?9jqOQ/e&.:%15is/g+\=F)Yr(Gp#^T
6m-#Y@s)X"DKK</Bl@ku$>OKiBOu"!+>=63%15is/g+tK@psInDf-\9Aftr!Bl5%c:IH=%6q/;0
De!p,ASuT!$>ONgFD)dEIUQbtDf0W$B4YslEa`chC2[WnDe!p,ASuTpE+EQkDdt.($4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBM>]@ruF'DIIR2+E1b2BQFUi<+ohcDfB9*+Co1rFD5Z2@<-'nF!,C5+A,Et+Co%q
Bl7K)@3BW&@<,jk+CT.u+D,2,@q[!(@<?08+B3#c+=Lc7A18WLA8,OqBl@ltEd8dAA7]Y#BkD'h
@<?4%DCH]OATD6&Ch[s4F!,R<AKYr#FD*99$7QDk:-pQUF(fK9+E1b2BFP;ZBk/>?%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k<+ohcA9hToBk&8tDfT\;De:+?A8,R'+ED%8F`MA@+Co&*@;0P!+CS_tF`\aJ
BOr;rDf0Z.DKKqBDe:,'@:NsnA8,OqBl@ltEd8dGDBO%7AKYr#FD*99$7QDk:-pQUA8,OqBl@lt
Ed8d<ATV?pCi^$m0Han?A0<Q8$4R>;67sBkBk/?8+>=o\+AP6U+D>2$A9f;3A8,t!%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[rDf'&.DdmHm@rri3EbT*&FCB9*Df-!k<+ohc8l%htF*VhKASiQ(F!+m6@rH4'
Ch7^"+CT.u+Co&*@;0OhA0>H.@;Tt"AKYo'+E(_(ARfg)DfTQ'DKKH#+E2@>B6%EtD/!m#+DG^9
8hM5/<+ohcF*VhKASiQ"Df0W1F*)IGDe:,#+Du==@V'R&De:,%CghC+ATJtBE,oN%Bm=3"+EqOA
BHS[2C2[W1.4u_c=(l/_+EV:.+EMgLFCf;3Ci<`mF!+m6G%#E*ATW2?De:,1@VTIaFE8R5Eb-A'
Eb/[$ARmD9+B3#c+C\c#Bk&8oEarcsFCes(F`M%9BlbD*+DkP$DBNJ(@ruF'DIIR2+E(_(ARfg)
FD,*)+Cf>-FCAm$F!,(5F`JUGF^f8uC1UmsF"SS(@:NsnDfB9*+Co1rFD5Z2@<-W9BlbD*CiaM;
@<6L.@qf@nARlp-Bln#2@3B)pEb/a&DfU+GDdmHm@rs=G6tp[Q@ruX0Gp%$7C1UmsF!+n3AKYK'
ART[lA0>;uA0>DoF*)G@H"CM/@<3Q3AT;j,Eb/c6%14Nn$;No?+E(_(ARfh'+C\npBl7g&DJ()9
Bln#2-Xgb.A1&L.Eb-A8BOr;Y:IH=8CghC+ATKI5$=e!lC`kD@$4R>;67sBQ:IH=8Df0W1F*)IG
De:,5Bm:b0@<6-m+E(_(ARfh'+CT.u+CT=#$;No?+DkP)Gp$X3Eb/a&DfU+GDdmHm@ruc7@<3Q5
BOu3q+CT;%+E1b2BHV#2ASlK@%16T`DJUFM%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sBOr<*F`\a:Bk)7!
Df0!(Gp$U8DI[6sF:ARVBOr;uBl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*BlbD<E+NNn@;IP=
+A$YtBlbD=BOr<)DJXS@+Co1rFD5Z2@<-W9FD,*)+Ceht+C\n)D/Ws!Anbge+C]U=8l%ht@rH4$
@;]Us/g)9'ARf.kF(HJ2Df^"CA8,OqBl@ltEd8dEDe*QoBk(RnBl@m1+CT;%+E2IF-Z^D%+Cehr
C`mh5BlbD-Bk)7!Df0!(Gp%3BAKW19F`\fMA8,OqBl@ltEd98H$4R>6F=2,PBl.g-Ecb`-F<G[D
+E_R4ATDj6@;]TuFD,*)+F.mJ+Ceht+E_a:+EV:.+Cf>-FCf?3F!,C5+EV:.+E)@8ATAo(Bk)7!
Df0!(Bk;?.Df-\>BOr<*@<?0*@Wcc8H#IgJ@ps7mDfd+3BOPdkAKZ).ASiQ(DBNA*Gp%<>GqKO5
.1HVZ67sBmBl\9:+E1b2BHUi"@ruF'DIIR2+DGm>FD,5.E-67FA8,OqBl@ltEd8*$A8,Qs0F\?u
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l36ZQaHFD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/6=jbIEb-A1De*QoH"h//
+EV:.+Cf>-FCf?3F!,C5+CT/5+Co1rFD5Z2@<-W9Ch7]9F!+t5ART[l+CQC1ATo7@FDlFK+Co1r
FD5Z2@<-W9@;]TuD..3k+DGp?FD,5.E-67FA8,OqBl@ltEd98H$7QDk:-pQU@r-()AKYo1ASrW$
Bk)7!Df0!(Bk;>p$8WfCA0<6I%13OO:-pQU@rc-hFCcRCFDlFR%16uaG@VgDFDlFP%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k9jqgK+=M>MGpskE+E2IF+Co1rFD5Z2@<-WG%14Nn$;No?+E)41DBO%>Gq:(S
@:EbYFs(42A0>\s@N[6FFDlFIBlbD=BOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Zj9P+DbIqA7]p,
Cggd#%13OO:-pQUBl8!7Eb-A8Dg<I>F!,L7@:V$8EbTW,%16WbF(KG9-W3B!6s!8X<(//D$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMG\FED57B-:W#A0>i6FED57B-;D:Eb'5D%15[E+EV:.+D,>.F*&OGARfgr
Df-[h+ELt*A0=K?6m-2b+CQC:DfTA2F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1/g)93Dg*=J
AKYE%AKZ#)@:XX+FDi9ME-67O+CT.u+=Ll6F=A>RDf'&.GAhM4F"Rn/%15R=EcZ=F@rc-hFCcS9
Df'&.GAhM4F!,RC+EMXCEb-j4$7QDk:-pQU@rc-hFCcS9Df'&.GAhM4Et&Is@;]UoD*9p&5;=i7
0eak-0JFUl:-pQUDKTf-EbT#+DJsZ8%172gG]Z)0+=D8EBlbD2F!+m6FCfN8+E(j7FD,5.Df0,/
E-624+EV:2DJ(=+$>+*m@<?QR3Zp1#.j-,\0eb:+0eb9j$?LK0@W-((4ZX^,3ZodmDf0&r+Dl%;
AKZ22FD)e/AS#[lDJ(=+$=[puARmqb+?Ui&+DEGN1*A@^$?BQsBl@ltCi_a#+>GQ(+=eQ\+=KE7
BeCM_0R,#h?6D*Z%175qBk)'lAN`'sFZLWmFD,B0+DGm>DJs_AF`(o'De*E,%16ZT@q\"d+=8^)
+<VdL+<VdL+<Ve%67sC&@:O"n+CSf(ATD5h$>"I$Ch[BnF?MZ-1a"h%0F\@a67sBlG]7J5@qg$-
G%G]'%17>&.kVri%14Nn$4R>dDfTB04ZX]I3[\rVDId[&+EV1>F<G13Ddda/+EMgF@W-((+C]86
ARlp(@<?4%DII@&+E_R9@rGmh+D"tkBHUl2E,95uBlk^3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$E-67O
+DGm>FD,5.8l%ht@rH4$@;]TuFD,*)+EMXCEb0;7GAhM4F"Rn/%16$BG%De)DIal$Eaa$#+EV:.
+EqaEA90@G+B2cbAKZ&4D.Oi3Bl.E(FDi:3Df0`4DI[6#H#IhGF(K0"+EV:*F<G[=AKZ28Eb'56
BOQ'q+C\nnDBNM2@<6!j+C\noDfTD3E,ol,AS#CdDJ(R2$7QDk%15is/g,4DG%De?DfTB0%17&s
F<GdGEb'5#$4R>;67sBlEaa$#+Co%qBl7X,Bl@m1%16Ze@<6!&GAhM4Et&Hc$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$;PM`+ED%8EbT*.AKZ).AKZ&9DfTE"+EqaEA9/l%DIal"BOt[h+EV:*F<G[=AU,D,Eb-A4
Ec5o.Ebp"DEb0<6DfTE"/e&.:%15is/g+e<F<GdGEb'5#$>3pl+EqaEA9/1e%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+@L-XF_t]-FCB9*Df-[P0JO"D:Ms_dDe:,/Gp%';F<GO6AThX++DGm>F`(`.@s)X"DKKH#
+Cf>#AK_Ki%15XEG9Cg9FCf>4BOQ'q+F.mJ+D>1o+EVNEAmo1\+D>n8A9)6lF"AGN@<l<n+EV:8
F`Uu/A90:EDe:,.Bl7L'+E(j7@rGmh+EqOABHV2$Ed8d9+Cf>,D.RU,+DG^9F(o9#F=n\'Df'?&
DKKqB@<,p%DJsV>AoD]4GA1o5F!+n/A0>N!Ebp"QD.RT;+B2ogCh[d"+Cf>,D.RU,F!+n3AKYD(
BOP^nD..I#+E(j7B5_^!+Cf>#AM+E!%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,9@<lo:FDi:4
De!p,ASuT4GAhM4F"SS:BOu'(@3Bc4Eb$;,F!,17FE2;1F^nun+DGpFF!+m6B5_^!+DG@t@3BZ1
+EMXCEb-A%+EM47Ec`FBDIjr,Bl7K)A7]glEbTK7Bl@l3De:,6BOr<1DfTA@%14Nn$;No?+EMXC
Eb-A7BQ%p5+EqaEA0>DoF(96)E-,f4DK?6o0H`=tE-67F-ZWX5A8c<44"#&WDId[&+DG_8AS5Rp
+EV%$Ch4t'$4R=r+?1K_F`\`RART(^-T`\aE,]W-ATJu1AS-$,@<-"'D.RU,+EVNE@<-BsGp$gC
ASlK9%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:M(_ZDfp)AAKZ8:FWb1&DBO+:ATo8BDfp(CF*)>@ARloo
ATM@%BlJ0.Df0V=GA2/4+=Ll6F=AgO$7QDk:-pQUB4Z0-F(fK4F<G.>E,8s#@<?4%DK?6o0H`=t
B4Z0--ZWX5A8c<44""TJ@q[5!$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqIDfTD3A7]jkBl%?k+CoD#F_t]-
FCB9*Df-\-@;[2sAKZ&9DfTE"+CT.u+ED%8EbT*.ARmD9<+oue+EMX9E$/t8@:XF%@3BT%@;KY!
FD55-AU%X#E,9).De:,9DfTA2A8bt#D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?F`\a:Bk)7!
Df0!(Gp$O5A0>u-ASrW$Ble60@<lo:GA2/4+=Lc7F)WQ\%13OO-tI%5E%)oDF!+m68l%htF`_>6
BlnVQ+<X6t+DGm>FD,5.Df0B:+Eh=:@N]c+@<<W4ATW'8DK?6o@3B&n@<,ddFCfJ8Ch[s4+=MGI
ASrW3F^nomF)tr9CagK@DKBo2@:UL!Afu2/AKZ,:F^])/@W-L&A0<:@@lnjBCis;<%14Nn$;No?
+Dbt)A9/kA@q]:gB4Z.+E[`,>DIak<@q]:gB4Z.+E[`,ADe!p,ASuTuFD5Z2+DG_8D]j.8AKYK*
EcP`/F<GOFF<G+.@ruF'DIIR2%17/dEbTK7+=DVHA7TUrF'N?hDImisCg:^nA6`kfA8G[`F'NNi
@V'dmD/a<&0JG46Bkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k<+oue+EMX9E-!.4Ble60@<lo:FD,5.
Ci=3(+CoD#F_t]-F<GC<@:Wq[+DG^9FD,5.E,oN5BlA-8+EMX9E%VS,.1HVZ67sC%BQ&);Ci=3(
+CoD#F_t]-FCB9*Df-!k0H`@uA8-+(+=CZ4@;]^hF*)FM%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[lDfTD3
E-68EBl7Q+@;]TuB4Z1,Bl7Q9%14M&F`]&T@;]Tu-td+5.3N&>AKYu8Blmo/Ao)%'Bjtmi+CT.u
+Ceht+EMXCEb-A)DKKT5AKYf-@ps1bF"SRX<+ohcCi<flCh7Z1@ps6t@V$["@;TRd+E)9CDKTf*
ATD?m/e&.:%15is/g,4DG%De<BOr;7@;9^kD..3k.3NGF@ps1b04Sg,F)rI<DBL-FDg<N9$7B7s
De*]nCLnk9E-67FH?q_8+Du"&@;9^kD..3k?Qa&8+>aN7%15is/g,1GFE2),G%De<BOr;7@;9^k
D..3k.3NhQEb'56Bl8$2+CT.1-[9l\-Qm5D@ps1b%14J-G^(SYB4Z0-H?p#-%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+B)i[EarcsDJ()(DfQtEDfTB0%15dCCLnW*Df^"CF*)>@@:s-oF*VhKASlK28l%htE,ol?
Bk1dr+D,%lBl%L*Bk;?.AoD]4F(Jd#@q]RoB-;;0AKYK$DKKH-FE8RCAftf0F!,"%FCAWeF(Hs5
$4R>ABOr<'@;0U%F(Jd#@qZupDf'?"DIal(F!)lADJUaE-tI%%FD5Z2@<-W9DIIBn+Dbb5FE8l`
%14Nn$;No?+Dbb5F<G".C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*@V'1dDJj0+B-;D4FD)dEA9B7/
$>aEtF<Gua+CoA++=C]B-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7KG&CagK:@;[3/ARTUhBHUo*EZfRE
Eb'5B+EV19FE8uUB6%p5E-!QQF*22=ATJu&DIal,@:O=rF"SRX<+oue+EMX9E$/Y2ART[lF!,OB
D.Oi&Ec6)>F!+n/A0>u-ASrW,BleB;+CT)&+EV:.+D5_5F`;CEDf-\>BOr<*@<?0*FD,*)+C\np
Bl5&;Bln#2-V@0&-OgD3%15is/g+YEART[l+EMI<AKYW+Dfp#?%16`gE$-NLFE2)5B6,F^-Y$gu
DJ*O%FE/`<$>4Bu+=CuD@ru:'F=0.fCgUUcDe*]nCLpiqBeD4O$4R>;67sBnEc6)>F!+q'B5)7$
Bl7Q+GA2/4+=CuD@j_]m1*A:oA8Z3+-Z!^2-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3=(l#a+CT;%+EV:.
F(HJ+F`))B+CT;'F_t]-F<GIDD.7'sF$C*@6?s\kDg*=LDfm19@<Q3)E,ol+@:F%u+Du+>Bk(^b
+EV:*F<GF/DL!?s:IH=8Df'?"DIdf2FCArr+DG_8AS5Rp+CT;'F_t]-FE9&W+A,Et+CT;'F_t]-
F<G(3A7]g)@<,p%De:,$@<6-m@;Kb*+EV:;AS!!+H#R>9/0Jk?C1Ums+Cf>#ATKCFDfBf4Df-\-
De*F#+CT.u+E;O4Ch[KqATDiE%13OO<+ohcDdmHm@ruc78l%htF*)>@ATJu&DIal1ATVs,AThX+
+CT)&+D>2,AKYo#C1Ums+Cf>#ATKIH+B3#c+Dtb8F<G[6@VfTuA8-+(CghU1+A,Et+E(_(ARfg)
@rGmhEt&I*%15is/g*b^6m-DWC1Ums+Cf>#ATJ:f-p/\-+DEGN2CTb"/g*5:-Wa)A6m,Gt;cFl0
;GU:h+B)93<(.p(5snOG+@Jdg<(Tk\5uLi5%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:N1DiDf-\+DIal0
F^]*#Anbgs+Cf>#ATJu8ASbpfF<G"0A0>`-A8,Y$+E)4@Bl@m1/g)99BOuH3@<,p%@;Ka&Bl8$(
B4Z+)/g*W%EZf4;Eb-A-DJ!g-D..O#Df-\+@W-C2+CT;'F_t]-F<G(3A7]g)Eb/Zi+A,Et-Z^DK
DJX$)AKYN%@s)X"DKK</Bl@lA%13OO:2b>!Ci=6-+CT@7F)Po,+Dl%;AKWC3DJUaE@rH4$@;]Us
/e&.:%15is/g)QTEc6)>/0JkMFD5Z2+>Fuj+DkP/@q[!(Eb/isGUXae+Cei$AKYhuFED)7Et&I3
+>G!LDJUFCCaTZ!%15is/g)QZ@:O=r/0JkMFD5Z2+>P&k+DtV)AKYK$DKK<$DK?qAFE2)5B.4rT
+Du*?D.-ppDf[%HATS@g1a"OrA8Z3+-Xh$C%13OO:-pQUD..3k+CQC0@:O=r+CT.u+EM+&Earc*
@:s"_D@Hq0+E2IF+=CT<EbB&54%`F=;Fs\a?X[\fA7%DG:-pQUD0[77D]iq9FD,B+B-9ehD.-pp
D^Pu$%14p71*C+FC`k*6E[M;'%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@gHjF`;CE@;]TuF*22=ATJ:f8l%ht
E,ol?Bk1dr+CQC6Bl.g*AKZ2*Gp%3I+D5_5F`8IIDfTB0+CT.u+EV19FE9&W+@.,_Ec6)>+DGm>
@3B&uCi!ZmFD5Z2+E(j78g&=rEb'5D+<WrmF*22=AKY].+CQC&Des6$@ruF'DBNk0+A*buATMr9
F(96)E--.R+<Xg*FWb17ART[l+CT.u+Dl%-BkDW5B6%p5E-!.1DIal2F_Pr/F!,[@FD)e=BOr;7
B6%r?+Eh=:@P/)s.1HVZ67sBjEb/[$AKYD(B6%p5E$0(2+EqaEA9/l;Bln#2DIIBnF!+q'B5)7$
Bl7Q+GA2/4+=CZ4-OgDqEc<-KFCfN8B6%p5E$lbi+FPjbA8Z3+-Y$g;%13OO:-pQU@rc-hFCcS'
+EV19F:AR3+E2IF+=Ci6Ci"$6DfTZ)-T`\1+Bos9-V@0&+EV19FE8R5Eb-@c+EM%5BlJ08+EV:*
F<GU8FEMVA+>Ipb-RT?1%15is/g+YEART[l+CQC7ATMr9F*22=AKWQIDJsW.+DbV$F<G"4B6A'&
DKI"2De*Dg$8Wf;Ec<-KFCfN8F*22=ALAT^+FPjb0d("EC`k)Q%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
=`8F*@ps6tCh[s4+EV:.+Cf>-FCf?3F!,C5+D5_5F`;CEDfQtAF_Pr/F!,[@FD)dFB6%r?%14Nn
$;No?+Dbb5F<G(3DKKH-FE8RCAfu2,F*)&8Dfp"AB6%p5E"*.eEc<-KFCfN8B6%p5E$l)%%15is
/g+YBDKKH-FE8RCAfu2,F*)JGBlmo;+Du+>AKZ&:Blmo/@rGmh+DbV$F<G"4B6A'&DKH<p1E^=N
E$-NMATMs7F_Pr/-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgODJ())Ec6)>F!+n/A0>r9Blmp-%15mK
AKYo'+EV:.+DkP$DBN@uG%#91@:s.m+E(j7F*)>@Bl7Q+8g%V^A7ZltDBMPI6m-Yo/g+RFE,8rs
DBO"1EbTK7+DGm>FD,*)+F.mJ+Ceht+DkP$DKK<$DBN@1;b9_S9LU(IATDj+Df-\9AftM)GAhM4
/0K%GF*&rUB6%p5E$0(>+EM[>FCcS'DIal3BOu'(B4YslEaa'$+DkP)Gp#^%Ci<`m+EM%5BlJ08
+EV:*F<G^IAKYMt@ruF'DIIR2+E(_(ARfh'/g*PjFCAWeF(HJ)ATMQuDImj0+CehrC`mh5BlbC@
Df0,/G%G]8Bl@l3De:,6BOr<.EclJ;/g:`3%16'JAKYT'Ci"$6Bl7Q+Bl8!'Ecc@F@3BW*DJ*cs
+EqaEA0>T(+=M>MGpskKEc6)>F!+n/A0>u-ASrW'ASu("@<?(%+EM%5BlJ08/e&.:%15is/g+tA
Aoo/1F`VY=ApGM@@:F%a+Eh=:@LWZ\C3=T>4ZXr5-RL*"+?CoV+FGdc?SR!PBeCSa-87\5>p*]2
+Bp9D%13OO:-pQUF*)>@AKY])+E2IF+Co1rFD5Z2@<-W&$?1-0+=Cu?F`VXP%13OO:-pQUBl8!'
Ec`F<DBNA(C`m\>F<G+.@ruF'DIIR2+D5_5F`;CE%14M3/g)nlEb0E4+=ANc+CSekB6%r<4s2s8
Che*6F=.M)%15is/g+tKDejK7+=M8AG&JfPBl5&.De(J>A7cs.Bln#2-u*[2BOu"!.1HUn$;No?
+D58'ATD4$AKYDtC`m\>F<G+.@ruF'DIIR2+D5_5F`;CE%14d3D/=8?4s58++>P'[AThu>-OgCl
$;No?+DGF1FD,5.Ch74#+CT;'F_t]-F<G:=+D#A'A7]9oFD,5.B6%p5E-!.1Eb-A1@:WplBl8$2
+=M&E@:Uf0F(96)E--.1$;No?+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9S
Ec6".$<1GTCND$LCh[Zr+E_X6@<?4$B-:huDImisFCeu*F(96)E--.P+Ceht+C\n)F(oK1Ch[Kq
ARlp-Bln#28l%htD.-ppDf[NR+@.,B:IH=B@:O=r+DGm>@;[2rEaia)Eaa!6+A*bt@rc:&F<G[=
@<<W%@;[2sAKYSrFCSuqA0>;uA0>H.ARfk)ARlp-Bln#2-us/R/e&.:%15is/g,">@rcK1FD,*)
+D58'ATD4$ATJu&Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?%16igA8PabEc4*%+=BoN/g+e<DImis
FCcS'Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?-S.q\/13+oD/=8?4s58++>P'[AThu>-RU8a-OgCl
$;No?+EMXCEb-A1@:O=r+>"^GDe*E%1,0nnASc1(+A,Et+EV:2F!,1<+CQBb+EM%5BlJ/'$8`lE
F`\`RD..3kE-688Ec?(I4#/NPC2[X"@:O=r%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;KZkpBl7Q+@3A0<
6m->T@rcK1BlbD*+EM76E,9).D..O.ATAo3Afu#2ASu4"B-;;0AKYE#E,ol9EbSs(AKYMt@ruF'
DIIR"ATJu&DIal4F(oN)+=M8I.3L2bEcl7BD.-ppD_;J+.1HVZ67sBmATVEq+CT.u+D#e/@s)m)
+:SZuD'13C@;BFnF`_8:E-!B9$4R>;67sBmATVEq+CT.u+D#e/@s)m)+EM75ASuU+Gp"[]GA1l0
+E).6Gp$X3F)Yr(Gp$[CE,95uBlnVC@rGmh+E)CEE-673$;No?+>G!ZD'13C@;BFnF`_8:E-!B9
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqI@:O=rF!+n3AKYl/F<GU8F*)G:@ru9m+EVNE8g&1bEbTK7F"SRX
=`8F*@ps6t@;L"'+EMXCEb-@a<)$%;+A?3CAQUK+=A;I?+B1d3<%K.d5uL?D:KL:B+B;B13$;XI
A0=3A<(.pN@rc:&FE8R=DBMPI6m-#S@ruF'DIIR"ATKIH+AZlkGp#^%F(96)E--.D@ps6t@V$[&
F`&=8Dg,c9ATBC4$7QDk:-pQUF*)>@AKXZT<+T/S-o*P,+CT.u+@oI+9HY`=1FXGgAU&<<%14p7
E-67F-Z!45AU#Ra1,:p=/hSb!9OUn3=<M*lA7Zl9/hSL\$4R>!+E2IF+=CiED/:R]1,D!>+>,9!
+@oI+9H[h`A7Zl9/hSL\$4R>;67sC%FDl22+BV?3+CT.u+CT;"BlnB(Ed8d,79EM3-t7IDATK:Q
%14p7E-67F-[9KE-TbF)9OD4CDe*3:-TlK^F*'TfBPDN1BlbD5@;TQuG\q7Z06CcHF?V&]$4R>;
67sBI=]@g4BlbD>DJ=!1ATDa1ATVKo+C]V<ATJu&DIal"@;[3/FDl22+C]&&@<-'nF!*%WDJsV>
Eb/a!D/Ej%A7]9oAoD]4Cgh?sAKYT!Ch7Z?%14p7E-67F-ULC"-Ta(A4*"n@A7&b[De*2tC2dU'
BHS[O@:WneDKB&qASu("@;K1`De**fD..L-ATBD;C1\h&$4R>;67sBiH$!U?F(or3+E(j7D.-pp
D[d%1+>G_rB4Z0--ULC"-OgCl$;No?+DkOsEc3(BAU&;>FEqh:F!+n3AKYK$DKK<)FE8R=DBO%7
AKYhuBl5%c:IH=8CghC+%15^+6W-KP<*s'KDe*3++A>(#79Eo*C2[Wi/0IJ_9h\o&C2[Wi/0J%h
9OD4CDe*3++B1d3<*s'KDe*3++@9417:0J<De*3++AG."912QW:1%FEDe*3++B;B13+$*/De*2a
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMVk@:X(iB-:`!@ruF'DIIR2+CoV3E$043EbTK7%16'Q+Co&#Df0W<
Eaa'$+E)@8ATAnc:IH=;ART\'Eb0;7G@_n7AS#BpF)Po,+EqaEA9/l-DBNk?EZen,@ruF'DIIR2
/g)99BOr<(AU&;>F*(u4+Dbt)A9/kACggd`F_u(MBkh]</e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
9Q+?M+DbIq+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ/H%14Nn$;No?+DG_7F`M%9@rHC.ARfg)E+*j%
%17#a+?MV3FDlFICggd`ATf24@:CT,>9G^EDe't<-OgCl$;No?+Dbt)A0>E*D/^V=@rc:&F:AR2
+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F:2Cggd`F_u(MBkh]:%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k7!3?c+EM%5BlJ08+CoC5DJsV>F*)>@AKZ28Eb$;5AS,LoASu!hF"SRX<+oig
+Dl7BF<G%(+D58'ATD4$ARmD&$7QDk:-pQUF`:l"FCcS=DfTA2Eb/ioEb0,uATJtG+EM47G9CL3
EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(-9`Q#/g,1GG&J`U%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[f
Ci<ckC`mb0An?!oDI[7!%15^'6m-/OF!,('@qfanFD5<-+D,P4+Cei#Ed;A:B-;,8F<GXH@<?3n
+DtV)AKYE!@;L41BlbD8DBMOoGAhM4F!+n/A0>u*F*)IU%13OO<+ohc-td@7@WNt@@;]Tu.!9TB
F"&5TATD7$+CT.rCjC><+CT.u+EMXCEb-A2@;TQuEb/ioEb0,uATKI5$7QDk:-pQU@;]LiH$X$E
DIIBnEt&IhATT%BA92j$F=.M)%15is/g+Y?@<6L(ApGM:@;TQuF`V+:Bl5&&@<6!&Ci<flCh4`5
DfT@t$8F7XB5DKqF!)i@F*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht+E_X6@<?''B5DKq
@;I'1DfTA2Eb/ioEb0,uATKI5$7QDk:-pQU0Hb(N+EV:.+EqaEA0>B#A7Zl8+EMXCEb0;7B5DKq
@;I',AS,LoASu!hEt&I1+D5M/@WNY>A92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+F(KDA+ED%8
EbT*.ATJu8FDl22A0>o(An?!oDI[7!/e&.:%15is/g+eCDdm-k+ED%*ATD@"@qB^(AoD]4-tIC@
@<<q-$?^E$F!)i@F*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@V'%fD.Rc2G%G]>+<krL
AS-($+s;)CASrW!Cht5<DfTB0+D>2,AKZ&9DfTE"+ED%*ATD@"@qB^6%14Nn$;No?+DG_7F`M%9
FDlFIBlbD=BOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Zj9P+DbIqA7]p,Cggd#+BosE+E(d5-RT?1
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%14M+F(KDA+Ceht+ED%8F`M@BD..=-+ED%*ATD@"@q?d!BleB;+CT@7
Df0&r/g+,,AKZ&&D.Oi/@<?0*F(Jd#@q[!%ARfC^DJ=0/+DGm>F`V,)+D,P4+ED%8EbT*.Bl7Q+
Eb/ioEb0,uATKI5$7QDk:-pQUB5DKq@;I',AS,LoASu!hF!,C5+EqaEA9/l&AS5^pDJ=!$+EqOA
BHS[>-OgDX67sC'F(KD8I4cXQDJUFCD'oc"%15is/g+eCDdm-k+ED%*ATD@"@qB^(De:,9DfTB0
+D#G$Bl7Q+GA2/4+=D4X%176!ATJuB/g)hj1E^4GCaX9O%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sBOr</
F(KD8F`(o3D@HqKE-,f4DBL_i+E(j7.!9TBF"&5PATW'8DK?qBBOr</F(KDEF`(o3DBNk0+CQC:
DfTA@+<XWsAKZ,:ATKGGDJ=$,+DGm>@UX=l@ps1iGp$N<F`(o5F_)\3BleA=@;Ka&FD,5.GAhM4
F!,C=+EV:.+CehrC`mh?AS!!&AftM)GAhM4/e&.:%15is/g,:XATJu:DJ=$,+E(j7FE_XGGAhM4
Et&I40d(U[ATJtU3[\EGCi+*/DK?qAF`)56F(KE(F>,'O$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImis
FD5W*+Dbt)A0>r'EbTK7Et&IK:IH=8@;[3#ASu("@<?''8g%qg@:UL%@rc:&FE8R:Ec5e;A8,Oq
Bl@ltEd8d?Ec6)>F"SRX<+ohcB4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF
+Co1rFD5Z2@<-W@F!,O6EbTK7+EM[7A8-'q@ruX0GqKO5.1HVZ67sBnASu("@<?''Ci<`m+EM%5
BlJ/'$>jU#+=D5QDJa<1DC6PL+AP6U+EM[C05YWGDBNt6F(HJ8ATS@g%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
%16rgF!+n1E+NotF!,+,DImisFCeu*F(96)E--.DFDi:DBOr;rF`MM6DKI"DF(KA>F!,OG@<-I4
E%Yj>F!,(/Ch4`1D]j.8AU,D.@;[2sAKYf-@:Wq[+DG_(AT23uA7]Y#Cj@.AAfs]A6nSoU%15jK
FCdKUD/=89F(96)E--.D@<,p%@:Wn[A0>u4+Ac')9M%TYC0r*%EZe2$@Vfag?YWpjAoD]4FD,5.
@s)g4ASuT4F`V,7/e&.:%15is/g+tK@:UKnASu("@<?'k+EM%5BlJ/'$>aWhA0<7@F`)&7Df-p3
$4R>P@;Ke!Df0V=1,(F?+<XEG/g+bKCht4B0e"4f@;]TuDIn#7-nm(mD/X?1F!,17+>PW*2%9m%
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l37qHRLEaa'(DJ()5@rc:&FE8RCDBNJ$D..<m%15^'6m,uJDBNA(F)N16
ASu("@<?''@;]TuCi<`m+EM%5BlJ08+EqOABQ&$8+CfG'@<?4$B-;#/@:UL%@rc:&FE9&D$7QDk
:-pQUCi<`m+C\c#Bk&9,FCB9*F*),+F!,+9Dfp".$>a>t-Xq.=@<?Q<%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k-td+5Ed0#UCi<`mF!+n-C`mh5AKZ28Eb'56@ps1iARlomGp$N<B5)O#DBO.AEb$d3$7QDk
:-pQUCi<`m+CT)&+EqaEA9/l2AS#BpFDi:BF`&<MA92j$F=@Y+B4Z1*GT\AEF*(i4-OgCl$4R>;
67sBsDdd0!Bl8$2+CT;"BlnB(Ed8dDDe!3lATJ:f:-pQU-ZaB<FDPl*-Qm&5FE2UK-Y.:?@<<k+
$;No?+=B00-Qm&5FE2UK-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM8S@r#drB-;>9+CT.u+ED%7
FDl26DJ()&Bk)7!Df0!(Bk;>p$;+)^+DGm>A79Rg@UX=h+D,P4+A*c#DfTB0/0K"DEbTK7F!+n/
A0>f4BOu3,E,oN"BlA-8+E2@>B6%Et+EV1>FE9&W+AHcqF<G+&FCAWeF(HJ8H#n(=D0$h5@<Q3)
D.R-nF!,(5EZeh"@r#drB-;>9+CT.u+ED%7FDl26DJ()&@<>pe@<6"$+CT.u+A,Et+CoD%F!+n4
+EqC5Cb?hQ<+ohc-u`U)CLek:G%G]'+C\bhCNXT;+E_WG@3B)hFCAWeF(Hs5$7QDk:-pQUF('6'
+CQC%@:O(qE$0(2+EV:.+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W&$?0E`CLeP8FDlFP%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k-u`U)CLek:@rH=#ATJu9BOr;rF`MM6DKI"3Bk)7!Df0!(Gp$^5Ch7Z1FDi:D
BOr;q@:O(qE$04E@Us1nARfh#Ed8d9DIal/Eb/isG\(q=@;Ka&FD,5.Anc'mF!,[@FD)e*+E_R9
EHPh8AThX*+DG_'Eb/[#Bl7Q+@UWb^F`8I@F_tT!E\7e..1HVZ67sBsBleA=E-67FA8,OqBl@lt
Ed8d:@:O(qE$/b,Ch7Ys$:7-P;E[&`HTHL++<X'K5u^B^?W0p2?V4*^DdmH(+<XEG/g,+UF<G+.
Eb/a&DfU+4$=mjk+@8@e?XH,f8Q%)e.P>FMAg\]D+<VdL+<VdL+<XEG/g+V3@r$4++D,>(ATJ:f
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%14M(ATMs(.3NYBF*)>@ATJu9BOr<&@<6N5@UWb^F`8I4Gp%0>Ch7*u
Bl7Q+@UWb^F`8I8Bl%@%+EqOABHVD1AKYZ#B4tjtF<GOCAS,Y$/e&.:%15is/g,1GF*)>@AKYet
F*&O6@:O(qE"*.pATMs(+=D8LGpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[Bl7Q+@3BW$EbTK7+CoV3
E"*.&E+*6lA18X2Eb/[$ATJu'Bl7@"Gp$R)@r$4+F"SRX=`8F*@ps6t@;L"'+C\bhCNXS=A8,Oq
Bl@ltEbT*++CT=6A9Da.+EM%5BlJ08/g)9)F_u(?F(96)E--.D@<,p%F(oN)Ch4_]+EM%5BlJ08
+EV:*F<G(%DBND"+E_a:A0>u4+C\bhCNXSI+Cf>/Gp$O5A0>`#EbAr+A8,OqBl@ltEbT*+/e&.:
%15is/g+\ID/^V+Cht59BOr<1DfTB0+E)-?FD,5.E+*j%+CT=6@3BW*DJ*cs+CoV3E$043EbTK7
/e&/0Dg>l9D/_X!+EM47GApu3F'i?jDe*2tD..3k+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqSBOu'(
G@_n5Ddd0!.!0BQA9Da..3N>BFDi:1+Dtb7+Co1rFD5Z2@<-W9Ddmd!Ecu":BQ&);FD,5.E+*j%
+DGm>@q]:gB4YU++B3#c+Co1rFD5Z2@<-'nF!,.)G%De*AS#a%D.Ra#ARmD&$7QDk:-pQUDIn#7
A8,OqBl@ltEd8*$DIn$&+=D,E@<lg'DC6Q2+>Y-YA0<6I%13OO:-pQUDfB9*%17#a+=D,E@<lg'
DC5l#%15is/g+tK@:UK/FDlG8F_u(H%14d43\V[=+?Op2+EVOIA9Da.%13OO:-pQUA8,OqBl@lt
Ed8dADJ!g-D..O#Df-!kA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@^'_@;I'1DfTB0%166VFWbR?
G9CR-G%De;Df'&.Bk1d`+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n\8D]ik-@<-6.D/XH++ED%%
A0=K?6mm$uA8bt#D.RU,@<?4%DBNA*A0>o8DBO%7AKYo5BOu3,8l%htCggdo/g*_t+F.mJ+D>2,
AKYE!Gp%'HDdmNoD0%6NEHPi6FD5Z2F!,CA+Cf>,E,8rsDKKqBE,9)oF(HJ*D..-p+Dk[4@<<W$
@;BFpC1K=b5\FqBBl#D3Df#pj%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-hH@<,jk
+>PW*3"63D%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%16igA8lR-
Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBH
DBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQU
IUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u
$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J
@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG
+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL
:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is
/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<
Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;
AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S
:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a
+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaH
Ch+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N
67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'
G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);
H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0
F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/
1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>
DKBo.DI[5e$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]aBkhQs
.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)$4R>;
67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX76sX>4ZX]I0Hb]b4$"a&Df'&.GAhM;+EV19F=.M)
:-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij
8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/
0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOm
DJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C
@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:Vn
A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?
G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'
A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]
/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t
78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1
+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t
78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE
+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9
@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^
A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2t
B5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ
67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63
BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH
0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F!,17+ED%:
Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6
E,8rsDKKH2F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M%13OO
:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(
Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`8IIDfTB0%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eI
E"*-`$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#
ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'
0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$
+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZ
De*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk
%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e
:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l
+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;
-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%M
F!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u
4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi
+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</N
CL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'
DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n
+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%
67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>
Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6
F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,u
ATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$Hs4Y@jtAThu7-RU$ID_</M+ED%8F`M@P
+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4`+/q#?i%14Nn$4R>;67sBo@;]V$
+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>
@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT
0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(
Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;
%13OO:-pQUARoLs+Cf>,D..<m+:SZG:IA,V78?fL:JFPL:..6++=D5DDg-//F)rICEZc_WH[\_=
I4$Bi%13OO:-pQUEb/Zi+=84TEbTW,+D,>(ATJ:fEb/Zi4ZY;@3\_s0?!oc[/grM2-9a[C1Eee5
.4H\T$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$?B]dA8Z=.DEU$:+Z_AD-nul+0d\;S
?p$\,-o3V*5!UMP+Z_;+.4H\T$?pN)FCf?.F`'?'-sJ_T1Eee6+Bp9;-nul+1*Bk14?tMI1GU:@
5U\E33\W!3.3Mn*$4R>;67sC$ART*l<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF!*%WAmob&ATAo8
BOPd$-urm-A9;?2+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?B]dA9;?;4ZZe.+?V_<
?SWrl+=K6s@4iuO/1)u5INViU+?V_<?SWa.3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_
/h%uO.3L#n1OEO_.3L2pINU?g3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$4R>;67sC)EbTW,F!,R5
@VfUs+CT=6<'`hnA7]RkD/"*'A0=Q8+EV18D/!lrFCeu*FCf]=+>"^WAS!!#Df021A8bt#D.RU,
+DG^9.!9WGCi_$7$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4K]g><3lT><3lT
>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'5U\0K-o!%s/0Zet5U\3:5U\*7
03g+R0gI-M-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f.3MhU+FPjd0d'[]+?Lc%+=K6s
@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/%173!4ZZjk4!80X%16ro
4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gk
D.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD0S3)>p)3O1,:%\+?L]YF<D\K:-pQU
.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)E-)NrDf\'&
+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a-S?bh/0H;_
-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0Gmt*qF?MZh
3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.hCcsg%-nlf*
0I]8%F:AQd$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>+DkOs
Ec6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUA9Da.
+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(
:fg4`6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcC
D/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX
:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1W
ARlomGp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a
4$"`:%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZf
De!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^W
BQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/
%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARloo
Ble60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,
F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^EDe't<
-OgCl$>OKiF`V,7@rH6sBkLm`CGIV>67sa&De+!3ATD:!DJ!Tq@UX$pF"JsdAU%X#E,9).8l%ht
F`V,7+Cf>-Anbn#Eaa'(Df-\=@rc:&F=n"0:-pQB$;No?+B3#gF!)TH@rc:&F<G:=+<Y6?ARfk)
ARlomAS,k$AKXT@6m-DWC1UmsF!)T6Eb-A'Eb/[$ARmD98TYCK:-pQU@ps6t@V$[)F(Jl)FDi:B
ARo@aBl7K)@;]Tu@s)j7Df'37AKZ/)EbTH7F!+t/@<6K4DJsZ8F"SS7D[d%K67sBt@;BEs+EV:2
F!,O6EbTK7+<Y*&FD5o0+<Y]9DIIBn+DGp?FDi::De+!3ATD:!DJ!Tq/no'A+CT.u%15is/g+YB
E-WR?F=\PYBln#2H#IhG+D#(tFE8uUFDi:DBOr<'@;0U%C2[W*A8-'q@ruX0GrcBA:-pQB$;No?
+F[a0A8c@,>\@VcATD3q>\\1f%15is/e&._67sB[BOr<(Dfor=+Dbb5FCeu*@V'@oG9C=7AKYW(
De'u#@;]UiA79RkF!,(5EZfC6A7]@eDJ=3,Df.0:$4R>;67sC%D/XQ=E-67F-YdR1F`V,7@rH6s
BkK&4C3(M/G\(B-FD5W*+>,9!-OgCl$;No?+AbHq+ED%%A7]d(Bl5&.De+!4Bl"o%CghC++>"^G
F`MM6DKI"BATW$.DJ()+F!,R<AKYMpAmoguF<G+.Eb/a&DfU+4$;No?+D,P4+EV:.+BN8pA8c[5
+Eh=:F(oQ1+E(j76"FnCAKXl^@:Wqi/g+&'F(KG9AoD]4DffZ(EZe1H7Nc__@:WqiEt&IO67sBW
6q1'C5t".>?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[MF!)lU3&W3j6"FnCAR%N2Ec5DqF<FIm
@:Wqi+@JS%;Is9IATD$A@rcKcA2>tnAU%c6%13OO:-pQUEb0<'F<F1'F!+:I7Nc__@:Wqi+EVNE
D..NrBHToC6mm$u:ddbqEb/ZiATAnF+CoC5AoD]4-u*71DKB`4AM.P=ALS&q:-pQU:ddcNART+\
EaNQg4ZX]^6q1'C5t".>?X[\fA9E!.CgRVY%15is/g+S=FCfK1@<?4,AKXKVDf^#A@rc:&F<G(3
D/`p*Bjtmi+ED%%A7]cj$;No?+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm
7qcg^FD#`5>\A,$Bk;KnB6/61ATopc/nK9=-OgCl$;No?+Ad)iAn?"'ARlp-ARZckEc6/CATAo-
DBN\4A9E!.C`m5(@<6K4/KeS8AmoguF<FY!DId[0F!*qdEb.^YGT^O2Eb/a&DfU+4$;No?+BMWG
0OJ7'De+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*NDgH,6CgeGUBl[csDg5N!Bl[csDg3mGG\&63
$4R>;67sBZARfXrA79M(+EqC++C]A0GB7>9+DG^9C2[X*FD5P6@r,RpF!*%WA7]@]F_l.B=(uP_
Dg-7FA8-'q@ruX0Gmt*U67sB^='%+`@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>Y/gTATD["
F<F"sE,9H5ATD$I79EA[:JsV679Du+%13OO:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;
Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%15is/g+"j01nc6+Cf>-
Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q
779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.
E+*9-.kYCXAKiK2$>j3eAO9gHBk'b26r[`=FE92l:-pQ_D..3k6=FqL@nKNb<+U,mF!,NU/Ken=
CLnV\:IH=7@<6-m+EV19F<GX7EbTK7/e&._67r]S:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6
F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%ht@UX=l@grc?67sC&ATMs7/g+,,AKYVsDImis
FCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.%15is/g)QO@<6!/+Dbt+
@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4ASGdpF"Rn/:-pQB$;No?+B3#c+<Y`>
H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/Ci:-pQU
-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h.3N2H@qB4^F!,R<
AISuA67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*<cF(o-+ATMs7.3N\SBlmo=%15is/e&._
67sBhF)uJ@ATKmA$;No?+<Vd9$;No?+<Vd].3Lo!@rH6sBkMR/ARloU+Co2,ARfh#Ed8dV8l%iS
78m.p$;No?%15is/g,=KEaiI!Bl,mRFDi:EF(HJ)D`S=7:-pQB$;No?+<Ve%67sBnASu("@<?''
F(96)E-)Nr:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$;No?+<VeID'13C
@;BF@@<6-m8l%iSATMs7-OgDX67sAi$;No?+<Ve%67sC$F`&=9F:ARP67sB'+=Joe3\i-,4DJhD
FD)dEIS*C(<(0_b01')gBk'b26r[`=FE9'KC3(a3$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`l%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%16oi
@:UK.C2[X)ATMs)E[M;'D..3k;f-GgAP,`d<+U,mF##IF67sa)@;BFQD/X3$8l%iSATMs7+EK+d
+DkP&AKXT@6m-PfDeio,FCfN8+EM%5BlJ/H$;No?$;No?+B3#gF!,O6EbTK7+D58'ATD4$ATJu&
+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+EMC<CLmiJ67sC&ATMs7/g+,,AKYVsDImis
FCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.$;No?+=L]-F(HdCCi<fl
Ch4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/db??/db??/g+,,AKW+:BmO>5
+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9Ch7-"+C]U':-pQU-r`W6
<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h.3N2H@qB4^F!,R<AI;1!
/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA92U+CLqU!F*)IP+EM[>FCd'3:-pQ?:-pQU@<6L4
D.RcL$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YE
ART[lA3(hg0JPG"F_i`l$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OO[.@:UK.C2[X)ATMs)E[M32
@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpR
FD5Z2@<-W@%16-);H$._:-CWc0J5@<3B8oD%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]
9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A
%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)
Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKi
A8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5
/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9
@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn
$;s;d76sj@4ZXs*3&!'7%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX
:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u
+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=h
F!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*
+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=
+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&
FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"
ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+
BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<s
DKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9
/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).
AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9
Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BV
F@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;
C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCpt
FD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9
@s)X"DKK</Bl@l:%16-);H$._:-CW\-SR/5/ibpK-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,
ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63
D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado(r%16!%9LV6G76N[S-RT?1
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuq
De!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et
+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m
@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$
@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht
:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibpK-OgDP:J=/F;E[&gB4Ysl
Ea`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D
-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u
$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-YbUp0ddD;6q'p@:./#D
3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=
DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6
F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDE
Bl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$
+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7
F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2
F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht
%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<
AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*
F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4Ysl
Ea`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTq
ARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA
+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7
F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7
$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>
$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm
@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#
$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn
$3                                                                        ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2_Z@/0d&4o0f:(/3$9t1+>Yer0eje.1*A;,+>bks0ea_+1E\D.+>beq0fL412BX_5+>Pht0eje+
2BX_7+>Yhs0fL421.k>16<-TN6qBmJ<)6CpEb/`lDKI!n:IH=7F_PZ&+D>J1FDl2F+Dbt/8l%iS
:JXY_6<-TN6qBmJ<)6CpEb/`lDKI!n:IJ/X:J=\0@WcC$A0>Q"F*)>@Gp$pAB4?!tCh.:!A8,e"
F`:l"FCfM9@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+DG^9C2[WqBlkJ.Bl[cpFDl2F@WcC$A86$n
F`(o8GB.D>AKXT@6m-ViBlkJ>ATMs7+EVNEF*(i'Bl7Q+A8-'q@ruX0Bk;@!BleB7Ed;D<A4fWc
+CSekDf-\2BleB7Ed99ZG]Y'BDBNe)Ebf3(GA_).F*)>@H"q8.A8bsM:IITH6WHiL:/i?EA7TUr
+D>J1FDl2F/p)>[+DG^9D..I#A8c[0D..3k6=FqL@nKNb<+U,mF)>?$AKXT@6m,rIF(o,,FCfN8
+EM%5BlJ02@;BFQD/X3$8l%iSATMs7D..3k+A,Et+EMC<CLnW1ATMr9F(96)E-,r*DJ<]oF*)/8
A4f-]+DkP)BkCptF<G16EZdtM6m,oKA8c@&@;]dkATMs.De*Bs@s)X"DKJK:9H\1\DJ<]oF*&O:
DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AP,6^+DkP)BkCptF<G16EZdtM6rQl]
;F<kq@:WneD?                                                              ~>
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
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 grplitBasic01 putNameTimestampsBasic00 restdBasic01''),(<(<''j'
zz=:zz,'odcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._1 '' jodsmok'
zz=:zz,'etests compjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00 gl'
zz=:zz,'obsSmokeAssign000 grpSmoke00''),<(<''jodstresstests''),<0$a:          '
zz=:325{.zz
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
1E\P#-p0UR/mg=U-QkfK7nHZY+@K4(:eakY1a#4T6VgHU:J=2"78d#;0JkIB+@T1+0ebC+84>g4
78b7"H:gt$Bl8$(Eb8`iAKXQj8l%ihDKKH1Amo1\;cH%X6pX^=+A$lO:IK;CDesJ;8U=!)7!3Tc
DKKH1Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)9gM-E:K1In73G;r=@GVR<^fn/:I7NN;aWiM73GAm
7TEAS6V^T':I7NN;aXAN=<LR3;cHmc9he&S+C\tpF<G%1C`m2)Cia/rEarc*@WcC$A86$n@rH4'
Eb0<5ARlomF_PZ&C2[X)Df9H5@rH4'Eb0<5ARlonBOt[hDKKu/@P]-:Df'H6ATMp-+CfG'@<?'q
De'u$@UX%a+Co(oCi=B++CoG4ATT&*F_u)2ART+\EZeq(+D#X;B4Z1&FE;P4D/^V4De*d(+Db[5
Ci<`m@UX%_BlY>4Ddd0eBlY>4Ddd0o@j#T+@:XCiAfto.@:XG$@;Tt)+Dbt)A9Vs4A9/l1Ci^_:
@;TRc@<?Q5DJsZ8CiX*++E(_2AU&;>De'u0F`_&.Cij_@Eb0&u@<6!pDe'u2D'3k@F<GX9FCKB,
Ch.'jEcW@GE+EC!ASQ-oA8-+,EbT!*FD5Z2+E_X6@<?'qDe*]nDJ<]oF*&OIE+EC!ASQ-oF)Q2A
@qB1nD/aPD.4cl04?G0&0d%hd@W$!\D/X3$0JFVZDf'H.;f-GgAM>e\@rH4'C/\tfCLo1S+CfG'
@<?(&ATMs(Bk)7!Df0!(Bk;?.A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?.A8,RQD/X3$0JFV[DJW6g
Deio<0HanFF(KG[@<6-m0JO\]A5d>`CLo1R+D5M/@WOkEF(o,<0JO\_Ci<d(;f-GgAO1BYBkM<;
0JFV^Ec=roDeio<0Hb1M@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',ZCi<`mA9Da.;f-GgAM>e\
Ci<`mFCfN80JG4lBk)7!Df0!(Gp%-=F*(qZ@<6-m0JO\lATMs7FEM%?.4cl04?G0&0d%hd@WcC$
A86$n+DPh*+DPh*A8bp"C2[X"@;BEsC2[X(FDl22+DPh*FDl)6F!,49A9E!.CaUY_-p0UR/mg=U
-Qm/BA7AtgBk)6rF*)IGC2[WmEclG:FCfN8F!,49A8G[pB4Z0rF*)IGC2[X(D/X3$FCfN8F!,49
A92j5ATMp7ATMs7-RgSp4?P\X?SNZN+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj
=WgLLF(KB8ARn5MEc5u>+C]J-Ch.:!A7TCqFE2))F`_>9DBND2Bl%<pDe*QsF!+q7Bl%<pDe+!.
BlkJ2BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#C2[WlATMr9C2[WnF_u(?C2[WsDKKo;+DPh*E,ol/
Bl%?'C2[X*F(KB%Df00$B4>:b+DkP&AO9gHBk'b26r[`=FE8RA@;BFQD/X3$8l%iSATMs7+DkP)
BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A@q@#:/1<V9+>ku$1,(F?
0K:aB/iGXE0JGFC2)ud70JPL?3ANTI3&<<H2_ZsA2BXb/0fLd@0KCaF3&!6N2E3TN+>PW*3&!3F
0ePF>1cI*J1b^^.1,(F?0K:aB/i5IG1,gsB2_cF10JPF=2_m?F2Dm?O3&NTO3?U(20f:XD0JY7=
1H.'D1cRBK+>PW*2)$sE1bL[D3ANTP3AWZ<1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_[!>2D[9I
0f1jJ1*A>+0f:XD0JY7=1H.'E1GgdB+>PW*2)$sC1+kI@2_m*F1Gq*61,(F?0K1aH/iGXK3&E<K
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
1,:R,1,(FA0JbF?/iYgF2D[*F2Du[50JPL?1GCU;2`3EL1c%$G2BXb/0fLdB0Jb=?2)I3K3&<EM
+>PW*2)%!D1G1RE1GCLA2)RB:1,(FA0KCmK/iYXB1cI*C1,^710JPL?0ebU?3&iTM3AriT1E\G,
0fUjE1,1C@0Jk^B3&E<F+>PW*2)%!D1G1RF1,UjJ1,_-81,(F?0K1aH/iGRE3&icR2)ud70JPO@
2)6s?3AWNL2D?gC3$9t10f:XD1,LUA2*!EP2*!HQ+>PW*3&!3F1G1[D2)I3F0K(m51,(FB0JtUA
/ib^F1c@$A2E2g70JPO@2)6s?3AWNL2Dm9K3?U(20fUjE1,COC1Gq!I0JkR.1,(F?0K1aH/iGXK
3&E<K1G^./0JPO@2)6s?3AEHH2)mBL2BXb/0f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK
1bpd.1,(F?0K1^F/i,IA3B8oM2_lL20JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,pmE2)[6L1Gq!E
+>PW*2)%!D2D-pB1Gh!D0f(d31,(F?0K:aE/i5LE2)@6I0eje+0JPL?1GL^=3&rcO3A`HH1E\G,
0fLdB0f1LC0ekF?1,CgD+>PW*2)$sE3A*-G2D[$F1b^[-1,(FA0JYCB/iYaF1c@6L1,g=20JPF=
2_m0A1cI0G2)@!F1a"P-0f:XE0et@>0fC^>0JG:>+>PW*2_[*D2D-pI1bppC3&;[40JPL?2).!A
2`EQK0fV$K1E\G,0fLdH1-$sH1GUdG0JYLA+>PW*2)$sE3A*-G2Dd3D3&<B61,(FA0JP7A/iYgF
2DI!F1bg+.0JPF=2_[-B1c.'G3ANTP0d&5*0fUjD0K1U@2E<KL2E<TM+>PW*2)$sD2_HpE2E<ZU
0f:m41,(FA0JtRC/iP^G0fUjC1,C%.0JPL?2).!A2`EQP1c$sB1a"P-0fLdD0fCXC2`39K2_m9M
+>PW*2_[*D2D-pI2)@-L3B/o>1,(FA0JtRC/iP^H2E!<G2E;m80JPL?2).!A2`EWO3&!3G1E\G,
0fUjE1,1C@0JtUG2`WTM+>PW*3&!3F1G1[B3&NBE3&Mg60JPL?2).!A2`NTI3AEHP1a"P-0f:XD
1,pmE2)d?J1,LpL+>PW*2)%!E0J5.@1bppH1cI-31,(F?0eb:=/i>XC3&EBL1bp1/0JPL?1GL^=
3A<-I1,(X@3$9t10f:XD1,1C<2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*41,(FA0JbF?/ibX?
1,^mB0K:110JPL?1GL^=3AEHP1c[NR0d&5*0fLdB0Jb=?2E*EH3AENK+>PW*2_[$B1bLdC1H7<Q
0Jtd</1<V9+>Gi$1,(F?0K1dB/iGRD0fV!F1H-F30JPF=2_d6D1c$mI2*!TR3?U(20f:XD1,1C<
2)m<H1,h$H+>PW*2_[-F0J57B1c-sF1c7'31,(FA0K([?/iGXF1,q3J1c6C20JPF=2_[6E2)?pG
2)@!J3$9t10f:XD1,(=>2)@$K3&WTO+>PW*3&!3F0ePF>2E3KL2E<`>1,(F?0K1aI/i5LF1bq'O
1,0n,0JPO@2)6s?3&icR2)$a@3?U(20fLdD0f:R@0fUpC3A`NK+>PW*3&!3F1G1UF3B&cS0f(d3
1,(F?0K:aE/i>LC3&`QO2DlU40JPF=3&!6C2E!HO0K1gG1a"P-0f:[>0JtI@0K1pL2D@$G+>PW*
2_[-F0J57B1c@0I0KD*81,(FB0JtUA/iP^L2`*KK1H6L40JPO@2)6s?3&i]K3&rZN1a"P-0f:XE
0K1UC0K(aI2_[$H+>PW*3&!3F1G1UG2`3QM3&ET;1,(FB0JtUA/iPaL3Ai]S3B83;0JPO@2)6m=
3&!9G1,h'J3$9t10fLdE1,(==2`*9L2_m3I+>PW*3&!3F1G1UH0JG4=0f_391,(FB0JtUA/iYdL
1Gq0M3&2U30JPO@2)6s?2`NZN1c$mF1E\G,0fUjE1,COB2`WiS0f([D+>PW*3&!3F1G1XI0K1^B
1cR961,(FB0JtUA/ib[D3AE9J2Du[50JPO@2)6s?3&iTP3&*-B+>PW*2)%!D2D-mJ0JP@=1GLd1
1,(F?0K:aE/iG^D0fM$H2E;m80JPF>0JG@:2DR'G1,LmC2BXb/0fLdE1,(==2`*EL1b^pL+>PW*
3&!3F1G1UF3B&cS0f(d31,(FB0JtUA/iYgH0fV0I2Dcj6-p07-2^C.40fLdB0Jb=?2)I<R0fD$I
+>PW*2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA1-%*M2)-4/0JPF=2_[-B1c@0E0f1R>2]sk0
0f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K1Gq*61,(F?0K1[D/i5IF0f^sB2`Mp80JPL?
1GL^=3&iZK0fCa@0d&5*0f:XE0Jb=>2`*9J1c.-O+>PW*2)%!D1G1L>2DR0G1H7-41,(FB0JtUA
/ib^B0fCaG0K(%/0JPF=3&!-@1c@<L2D[9P2'=Y.0f:XD0K(O?2E!6I3&<EN+>PW*3&!3F1G1[C
2_d<L0KD$?/1<V9+>kE"0JPF=2_[6E1c73H3&<?J2]sk00f:XD0KCaB2)I-D1-%-M+>PW*2)$sC
3A*-G1b^pH3B9)B1,(F?0K1[G/i5FA3AWNO2)HF20JPF=2_[6E1c7*F0KCgF1E\G,0f:XD1-$sF
1H@-I0K1[D+>PW*2)$sC3A*-G1c-mA3AWW;1,(F?0K1[G/i5FB0KCsM3B83;0JPO@2)6s?3&rfN
1H%$I2]sk00f:XD0KCaB2)I'B3A<?I.4cl01*A;2,Vh&.2)$sC1+kI@2_m-E0KCj11,(F?0K1[@
/iGLE1,:[B3B83;0JPL?2)-j=2*!QS3AN<J1a"P-0fLdB0Jb=?2`*KR1G^mH+>PW*2)$sE0eP@D
0f1[F2`E`>1,(FB0JtUA/iP^L2`*KM0KC720JPL?2)-s@2)7*M2Dd*F+>PW*2)$sC1G1[J2`<EG
0JtU.1,(FB0JbC=/i5CE2_d9G3?U(20fUjC0Jb=<1cRBJ0Jb^H+>PW*3&!-B1G1L@1c@'C0KD-9
1,(FA0JtR?/i>XE2E<NL1GL"-0JPL?0ebU?3&ilQ2`<QM1E\G,0f:XD0eb4:0fV0R2E!BJ+>PW*
2)$sD0J51:2)@-H1H%381,(F?0K1[@/iGLE1,1UG3&i$90JPF=2_[!>2D[9I0f:XD+>PW*2)$sC
1+kI@2_m*F0JbL-1,(FB0JtUA/ib^F1c@3G3&_s80JPO@2)6s?3AWNL2DmKK1*A>+0fLdD0et@=
3B8lO0JtR>+>PW*2_[$B1bLdC3&!-H2Dd341,(F?0K1aA/iG[D3&iZO2'=Y.0fUjE1,COA2`WfR
3&<6K+>PW*3&!3F1G1[C1-%'K0f(a21,(FB0JtUA/iP^L2`*KM0KC720JPO@1GCU;1c.0N0fUjI
+>PW*3&!-B1G1L@3&WKF1H@<81,(FB0JbC=/i5CE3&36H1H$@20JPO@1bg[:2`3TL0JYLA2]sk0
0fLdA1,U[A2E*HH1c%$G+>PW*2)$sD0J51<0JY==2Dd-21,(F?0K1^?/i5:@2)$gC3&Mg60JPO@
2)6s?3AWNL2D?mC1E\G,0fUjE1,COC1Gq!I0JkR.1,(FB0JtUA/ib^F1c@$C1c$R3-p014/1<V7
.4cl00I\P$4>8384>6                                                        ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
