NB. JOD dictionary dump:  7 Apr 2018 11:18:06
NB. Generated with JOD version; 0.9.993 - dev; 12; 7 Apr 2018 11:15:49
NB. J version: j807/j64/windows/beta-c/commercial/www.jsoftware.com/2018-03-13T17:40:01
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

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.993 - dev';13;'7 Apr 2018 11:16:36'

JODVMD=:'0.9.993 - dev';13;'7 Apr 2018 11:16:36'

MACROTYPE=:21+i.8

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
    if. -.'(<:)=:' +./@E. ,y do. (jderr ERR0159),uv1 return. end.
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
0f_081H$@2+?1K"2BY"&2Du[9+>Pku0f1"21E\G.+>Pku0ea_+1E\D1+>P_q0eje,0d&@s1,9t4
+?))!3?U+4+?:Q%3?U=)1Gp:00H`/,+>b2t0d&J!2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!
1GL",0H`5,+>P&p1E\Fq3?U%1+>bhr1*A>.+?:Q$1*AP!1H?R;+>ttt2BXe3+?1K"2BX_.+>Pbr
1*A>++>Y,p3?U%8+>bks1,'h,3(-b@:eakY1eJm6ATDj+Df-\>BOQ!*@rc-hFCeu*FD,B0+CoV3
E+Wg#AOT!S:JOha9LX&7G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+DPD)DKB`4
AKYo/+BN8pA8c[5+EMgLFCf<184>g478dc=Dfp"A@;]TuF*22=AKYYt@:Wqi+Cf>#AP%2?:IJo7
FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+9+=M;BFD>`)
Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@6m-2]FCfK)@:Nk?
H:gt$FDl)6F%T4r<)6:`;]mK&C2[W3+DG_8ATDBk@q?d,DfTB0+<X7%8l%itFD5W7ATDBk@qBCn
A9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#
@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'T5snOG<*<$dD.-ppD]j.5G]Y'MH#R>9/0JJ7
E+NotF#kF9;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM6r-lZ/6,Y=3);k1<Du7N
<(1_7Ap&0)@<?''Ci<flC`mG&ASuU(AnbgsF!,R5B2:i`<Du7P:/l+>D.Oi.@V0b(@psInDf-\6
Bl.R++>"^LBkM*jEZfO6Cis<1+DbV1F!,:5CLq=-+EVNE@r,RpBMUra<Du7]7TaS<Ap&0)@<?4%
DBNb6@ps0rBk1dmFD5?$ATAo4Eb/isGZ7+1<*;L]9gqs%ATMr9D.Rd0@:s-oF*D>?@qZu:+>G!W
DBLVUDe<TjB4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+C\bhCNXT;@W$"'ARTUh
BQI`nEarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtABl.g*AKYJr@<,dd
FCfJ8Ch[s4+E1b2FCfK1F(09+Ch.:!A7KOpE,oN2F(JlkF_PZ&F!+m6Ap%p+Gp$U8D/aN,F)to'
+A,Et+Dbt)A0>u*F*&OG@rc:&FCKB,Ch.:!A9;a.Cia*)D/aN,F)to'@WcC$A9/l'Df'H6ATMp(
A0?&,EcYr5DBNk0+EV:.+A,Et+EVO?Ci^_/CghC++EM%5BlJ0(BOt[hDKKu/@P_M-ARfLs+CT)&
+EV:;ARuu4DIIBn/6cV#@<6Kq/9GHJF=A>S@:F%aF(9-*E,oN2F)#`,D/XT/F!+n-C`mq8Blmo/
F)YPtAKYT*Df$Uh+EqaEA9/l%DIal2BQ%p5ASuQ3Ci<flC`mV(D.RcuEb/[$ASQ-oA8,OqBl@lt
Ed8dG@VTIaF<G(6ART[pDf-\@ATD6jF_u)2ART+\Eas-$@<?(%+EV:.+CoV3E+Wg#AKYE!A0?):
Blmp-+D>=pA7]d(Bl7O$Ec#6,Bl@m#A7]:cF<G+.@ruF'DIIR2+E(_(ARfh'ATVKoBlkJ>AU&<0
ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aQ4B5M'mAKYE!
A0>],@:UKQ:IH=<Ec6)>Ci<`mGAhM4F)5c'A9/l(Bk)7!Df0!(Gp%<LEb'56Bl8$2+EV%4B4Z0-
Ci<flCh7[*@;TRc@<?R%G][t7@ruc7@;]Tu@r,RpF(o6#ATJu3@;TRs+DG^98g%V^A7]XsF`)#9
AT2-tDK]T3FE8RBDfor=+EMXCEb/c(@<3Q#Bl7@"Gp%3I+Dbb0ARTU%FCf]=+ED%4Eb0<'DKK</
Bl@m1Ddmg"G][A8F(K2tCh7Z1@;]TuEb0?8Ec,q@DdmHm@rri8AU&<9F`_&.Cij`;F`_[I@;Ka&
FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mOASbpdF(K*)A7fOn@;I&Y:IH=GAT2Hs@<6!&F*(u4
F)l,<F`)7C8g%tZ@rcK1F(96)E--/AFEDPGDK?pm+EV19F<GX7EbTK7F*2G4@<?'qDe*]nDJ<]o
F*)J7F<F1O6m,oKA8c@,+DkP)BkCptFE8RHD]iP4EcP`/F<Ga<EcYr5DKTo/@<?'qDe*p-F`Lu'
A9Da.F*2G4@<?''Anc'mF!,17+A,Et;bpCk6U`,.BleB:Bju4,Bl@k                    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebR00f'q-+>GPm0ekUH0H`)*+>PW-1*A;,+>Pl71E\G.+>Z#:2BXb2+>GT10d&2)+>GT+1*A;*
+>Pc/2'=n%0fLg@+>Gl!1,1UF+>G\q0ekRH+>G\q0f(O<+>G_r0ek[E+>PYo1,_$J@W$!\D/X3$
0JH6g/h1=JCf>1hCLo1R+ET1e+=L]:CagK8EbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBh
F)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+
A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0II;::-pQU+:SZQ67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>K0b"Ib67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm
-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;
67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-
+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$
Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC#F`2A54ZXr<-RU5l5U\01-RU8h.6o:+
INUg85U\cB-RU8h.4G]5%15is/g+e<DImisFCcS'Cht55Df]u6@VfTuG%#3$A0<:0DJUaE@<-"'
D.RU,+E1b2FCfK1Et&Hc$;No?+EM%+EBQ?*5!!C1+>Y,_:-pQUF(Jd#@q[!)F^]*#AnbgsEt&IO
67sBqDIYgj+<VdLBeCMb+<XEG/g*b/GAhM4+DtV)AKYK!@<6K!$4R>;67sC(@;KXg+DbV$F<DuV
.3N&>B6A'&DKKq/$;No?+<VdL7;Q[KARlo++@KpRFD5Z2@<-W\De*F#+<VdL+<VdL6tp.QBl@lt
Ed:#jA7]g\ARTUhBHSE?+<VdL=)W+i;e9BX@q\J0@;TRCCghC++<VdL+<VdL+<XBe@rcKdARTUh
BMDoFEc6&FE+KIc:-pQUCgh?s4ZX]64D?E%.3L/a-p/\-+AY<r771$L6XO8:De*3(+=nW`/:/d@
6:s[6<),ef@;9^k?R\'X@q]j2+=nW`/:/cr=&2^^?X[\fA7$cIF(8m'4)$;i1asOu+=Jdf-nJ(Y
6W-]e@;9^k?R\'X@q]jD9gM-E:K1In7:0J<De*3(%13OO:-pQUG%#3$A0>o,B4uB0.![6a@<-"'
D.RU,+E1b2FCfK1Et&IO67sB'+<Y64E--@J+C\bhCNXT+DKI!D+CT)&Bl7Bg@r$4++<YN0FCT!)
ARf:hF<D\KD..NrBPD?n@:O(qE"*.L67sC$@<-!D3Zodt+<W`g+=Ach+<VdL+<Vdg+=AdODfor>
-QkJn+<W%L@;TR'+<VdL+<W`g-Z3@0AM.J2F`):K%13OO:-pQUAoD^,@<?Q5@;Ka&G%#3$A0<:0
DJUaE@<-"'D.RU,+E1b2FCfK1Et&IO67sB.:-pQU-Qjra0d%T#+u(2a3[QIC+>Fum+>P'd+u(2_
4s279-Qll9C`k)S+=nX/3Zp."/0K9^-p2<SEb?gD/0I&pF`2A5-8%J)Eaa!$%13OO4tq>%A0<7A
ATMs.De(OL+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGT
F_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R
/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^
DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&$4R>;67sC&Ed8dKARTUhBPD?s
+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-$>sEq+C]5)+=ANG$>sEq
+C]5)+=Ach%16uaEZeh/C`k)X1FEV=%15is/g+YEART[l+EV:;ARuun@:O(qE,uHq%15is/g+b?
EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#Tt-Zip@FD>`)0II;:%15is/g,4H
@rH6q+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrI
%159QHZ3D'CLeP8FCfN8C2[W:-OgD*%15is/g,7LBl[`,DdmHm@rri'Des6$@ruF'D@Hq-+Bos:
-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$9g.jE+*6lA0<7AATMs.De(OL%13OO:-pQU
F)Po,+C\c#Bk&9"DK]H)Bk/>pEbBN3ASuU2+>"^IG]75(FCeu*ATDg0EX`@nATAo&DJUFC/n$+:
$>sEq+>b3MDJUFC/hJe*%16uaEZd+[@W$!)-S@#!%16uaEZeh/C`kD@$>sEq+C]5)+?V#!%13OO
:-pQUF)Po,+C\c#Bk&9"A7]Y#Bln'#F!(o!-t7(1+=ANc+>#Vs@W$!)4#)(kDJUFC/ghbN$7ISN
@W$!)-RU>c/NP".+C]5)+?M<)0HahBC`k)X-Qij*-nuiRDJUFC-Rg/i3Zp."@W$!)4#)(:+C]5)
+=Ach+:SZ+1*C%DC`k)Q.3L3'+>P'KDJUFW0mbYu@W$!)-S?bh%14L>+C]5)+=ANc+>#Vs1E^.E
C`keoHSZdRDJUFC/ghbN$7I_R@W$!)-RU>c/NP"2+C]5)+?M<)1a$7FC`k)X-Qij*%15is/g)9G
DJUFC/gh)84tq=mDJUFC/ghbN$8`kg+<t?5CaUh_%13OO@UWebF_s9&+=Ach+=nWZ3Zp.5+=eQY
/g)Q(0mdAIC`k)X-Rg/i/g)Mo-OgCl$;No?+D,2,@qZusEc5e;+Du+8AU%p1FCf?3+C\bhCNXS=
/KeVFEc5t@AU&0*@ru9m%16uaEZeh/C`m1qA8ZO,%16uaEZd%Y@W$!)@UWebF_qQpDImi20d'qC
C`m1qA8ZO,%16uaEZd+[@W$!)@UWebF_qQpDImi21E^.EC`m1qA8ZO,%16uaEZd1]@W$!)@UWeb
F_qQp%15is/g*ksDL!@CAfu,*D..-rBl7Q+FCfN8F!+t5Bln'!@;Kb*+Co&&ASu$$Df-\>BOr<&
Ddd0fA0>f"C1UmsF"Rn/:-pQU8S0)eBOr<&Ddd0!F)>i2AKZ)+F*&OG@rc:&FE8R5Eb-A'BOPdk
ARlol+Dbt<+E(j7FD,6,AKZ)+F*)I4$;No?+Dl7BF<G%(+ED%:Bldir/g(T1%15is/g)9GDJUFC
-OgD2A8Z3+-RU>c/NP"`DJUFC-OgCl$;No?+<Y-2C`k)X@rHL-F=.M)-t7(1+=ANc+>#Vs@W$!)
4#)(kDJUFC/gh)8%15is/g)9GDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc6;LBN5u^WS0d&eY
:J=GR;cFl+:JXY`5se76-Rg/i3ZqmLC`k)l:JXY3%13OO:-pQU+C]5)+=D&8D.P>0Dfor>-OgD2
0fpaS:/jMY:JEMj4"!Tp<)c.M9LU<X+>#Vs@W$!)-V7'4-S.>7HX^l/-S?bU$4R>;67sB7+C]5)
+=ANG$7ISNA8Z3+-RU>c/NP!s0HahBC`k)Q%13OO:-pQU0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs
0HahBC`k)X-OgCl$;No?+>=pIDJUFC/n8gBDKI68$7ISNA8Z3+-RU>c/NP".+C]5)+?M<)@W$!)
-S?bU$4R>;67sB7+C]5)+=D&8D.P(($7IVj+?MV36;LBN5u^WS0H`\X:J=&R:JEPd6;LBN9M&/^
+@8k"9N4;E9LU<X+>#Vs0HahBC`k)l:JXY3%13OO:-pQU0HahBC`k*C@;TR.@rHL-F=.M)-o!e2
8PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+>=pIDJUFC8PW54/3>V6@W$!0/gh)8%15is/g)kk@W$!)
-RT?1-o!e2F)>i2AM@(pF*')`4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'+>G!JDJUFC
-OgCl$;No?+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>G!JDJUFC/gh)8%15is/g)kk@W$!)-SAnI
F`):K%14L<4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+?M?*@W$!0/gh)8%15is/g)kk@W$!)-Z3@0
AL@oo-o!e2F)>i2AMI.qF*')`4"#)dDeio=<+U,m0deCm/NP"/+C]5)+=D5IDeio=-OgCl$;No?
+>G!JDJUFCDIIBn/n8gBDKI68$7IVj-Za-CCLo2!ATMrI-Rg/i3Zp."@W$!)-Za-CCLo1I/3>V6
@W$!0/gh)8%15is/g)nl@W$!)-RT?1-o!e2@W-1$F)>i2AM>Jn-Xq"4CiaH3CLo4J4""`[FE;;;
CLo1I4""`[FE;;;CLo4J.3L3'+>P'KDJUFC-OgCl$;No?+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'
+>P'KDJUFC/gh)8%15is/g)nl@W$!)-SAnIF`):K%14L34>A994>8$h3[l1'3Zp1#@W$!)4#;4m
DJU[Q-OgCl$;No?+>P'KDJUFCDIIBn-OgD20fpasDKKr:Deio=-Rg/i3Zp1#@W$!)-Y[I?F)>i2
AMGPA$4R>;67sB9+C]5)+=D&8D.P>0Dfor>-OgD20fpalDf9H5D/X3$0IJ:l/NP"0+C]5)+=CW:
DepdP4#2.lDJUFC/gh)8%15is/g)qm@W$!)-RT?1-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJU[J
%13OO:-pQU1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E^.EC`k)X-OgCl$;No?+>Y-LDJUFC/n8gB
DKI68$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)4#)(kDJU[Q-OgCl$;No?+>Y-LDJUFCDIIBn
-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`k*HFXIV*%15is/g)qm@W$!)-Z3@0AM.J2F`):K
%14L34>A994>8$h3[l1'3Zp4$@W$!)-ZaDX/3>V6@W$!0/gh)8%15is/g)tn@W$!)-RT?1-o!e2
F)>i2AM?he@rcKA-T`\sD/X3$0MPtcEc3Z[4"#)dDeio=9jqOPD_NP#-Za-CCLo4p@:O=r0deCm
/NP"2+C]5)+=ANG$4R>;67sB;+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+C]5)+=Ach%13OO:-pQU
1a$7FC`k)X@rHL-F=.M):-pQU1a$7FC`k*C@;TR'%15is/g)tn@W$!)-Z3@0AM.J2F`):K%15is
/g)hj0d'qCC`k)Q%13OO:-pQU0H`(m@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d'qCC`k)X-OgCl
$;No?+>=om+C]5)+=AdODfor>-OgDX67sB7+>G!JDJUFCDIIBn-OgDX67sB7+>G!JDJUFCDIIBn
/n8gBDKI68$;No?+>=on+C]5)+=ANG$4R>;67sB7+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=on
+C]5)+=Ach%13OO:-pQU0H`+n@W$!)-SAnIF`):K%15is/g)hj1*C%DC`k*C@;TR'%15is/g)hj
1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`.o@W$!)-RT?1%15is/g)hj1E^.EC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`.o@W$!)-S?bU$4R>;67sB7+>Y-LDJUFC/n8gBDKI68$;No?+>=oo+C]5)+=D&8
D.P(($;No?+>=oo+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>G!JDJUFC-OgCl$;No?+>Fun+C]5)
+=Ach%14LmDJUFC/gi(j/NP"/+>G!JDJUFC/gh)8%15is/g)kk0d'qCC`k)X@rHL-F=.M):-pQU
0d&1n@W$!)-Z3@0AL@oo:-pQU0d&1n@W$!)-Z3@0AM.J2F`):K%15is/g)kk1*C%DC`k)Q%13OO
:-pQU0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."1*C%DC`k)X-OgCl$;No?+>Fuo+C]5)+=AdO
Dfor>-OgDX67sB8+>P'KDJUFCDIIBn-OgDX67sB8+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>Fup
+C]5)+=ANG$4R>;67sB8+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Fup+C]5)+=Ach%13OO:-pQU
0d&7p@W$!)-SAnIF`):K%15is/g)kk1E^.EC`k*C@;TR'%15is/g)kk1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU1*A:o@W$!)-RT?1%15is/g)nl0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1*A:o@W$!)
-S?bU$4R>;67sB9+>G!JDJUFC/n8gBDKI68$;No?+>P&o+C]5)+=D&8D.P(($;No?+>P&o+C]5)
+=D&8D.P>0Dfor>-OgDX67sB9+>P'KDJUFC-OgCl$;No?+>P&p+C]5)+=Ach%14LmDJUFC/gi(j
/NP"0+>P'KDJUFC/gh)8%15is/g)nl1*C%DC`k)X@rHL-F=.M):-pQU1*A=p@W$!)-Z3@0AL@oo
:-pQU1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)nl1E^.EC`k)Q%13OO:-pQU1*A@q@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp1#1E^.EC`k)X-OgCl$;No?+>P&q+C]5)+=AdODfor>-OgDX67sB9+>Y-L
DJUFCDIIBn-OgDX67sB9+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Y,p+C]5)+=ANG$4R>;67sB:
+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,p+C]5)+=Ach%13OO:-pQU1E\Cp@W$!)-SAnIF`):K
%15is/g)qm0d'qCC`k*C@;TR'%15is/g)qm0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1E\Fq@W$!)
-RT?1%15is/g)qm1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1E\Fq@W$!)-S?bU$4R>;67sB:+>P'K
DJUFC/n8gBDKI68$;No?+>Y,q+C]5)+=D&8D.P(($;No?+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX
67sB:+>Y-LDJUFC-OgCl$;No?+>Y,r+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>Y-LDJUFC/gh)8
%15is/g)qm1E^.EC`k)X@rHL-F=.M):-pQU1E\Ir@W$!)-Z3@0AL@oo:-pQU1E\Ir@W$!)-Z3@0
AM.J2F`):K%15is/g)tn0d'qCC`k)Q%13OO:-pQU1a"Lq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
0d'qCC`k)X-OgCl$;No?+>b2q+C]5)+=AdODfor>-OgDX67sB;+>G!JDJUFCDIIBn-OgDX67sB;
+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>b2r+C]5)+=ANG$4R>;67sB;+>P'KDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2r+C]5)+=Ach%13OO:-pQU1a"Or@W$!)-SAnIF`):K%15is/g)tn1*C%DC`k*C
@;TR'%15is/g)tn1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs@W$!)-RT?1%15is/g)tn1E^.E
C`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs@W$!)-S?bU$4R>;67sB;+>Y-LDJUFC/n8gBDKI68$;No?
+>b2s+C]5)+=D&8D.P(($;No?+>b2s+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fum+C]5)+=ANG
$4R>;67sB7+>Fum+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fum+C]5)+=Ach%13OO:-pQU0H`(m
0HahBC`k)X@rHL-F=.M):-pQU0H`(m0HahBC`k*C@;TR'%15is/g)hj0d&.m@W$!)-Z3@0AM.J2
F`):K%15is/g)hj0d&1n@W$!)-RT?1%15is/g)hj0d&1n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!
0d&1n@W$!)-S?bU$4R>;67sB7+>Fun+C]5)+=AdODfor>-OgDX67sB7+>Fun+C]5)+=D&8D.P((
$;No?+>=om+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=om+>P'KDJUFC-OgCl$;No?+>=om+>P'K
DJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>P'KDJUFC/gh)8%15is/g)hj0d&4o@W$!)-SAnIF`):K
%15is/g)hj0d&4o@W$!)-Z3@0AL@oo:-pQU0H`(m1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`(m
1E^.EC`k)Q%13OO:-pQU0H`(m1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m1E^.EC`k)X-OgCl
$;No?+>=om+>Y-LDJUFC/n8gBDKI68$;No?+>=om+>Y-LDJUFCDIIBn-OgDX67sB7+>Fup+C]5)
+=D&8D.P>0Dfor>-OgDX67sB7+>P&n+C]5)+=ANG$4R>;67sB7+>P&n+C]5)+=Ach%14LmDJUFC
/gi(j/NP".+>P&n+C]5)+=Ach%13OO:-pQU0H`+n0HahBC`k)X@rHL-F=.M):-pQU0H`+n0HahB
C`k*C@;TR'%15is/g)hj1*A7n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A:o@W$!)-RT?1%15is
/g)hj1*A:o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A:o@W$!)-S?bU$4R>;67sB7+>P&o+C]5)
+=AdODfor>-OgDX67sB7+>P&o+C]5)+=D&8D.P(($;No?+>=on+>G!JDJUFCDIIBn/n8gBDKI68
$;No?+>=on+>P'KDJUFC-OgCl$;No?+>=on+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>P'K
DJUFC/gh)8%15is/g)hj1*A=p@W$!)-SAnIF`):K%15is/g)hj1*A=p@W$!)-Z3@0AL@oo:-pQU
0H`+n1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1E^.EC`k)Q%13OO:-pQU0H`+n1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`+n1E^.EC`k)X-OgCl$;No?+>=on+>Y-LDJUFC/n8gBDKI68$;No?
+>=on+>Y-LDJUFCDIIBn-OgDX67sB7+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,o+C]5)
+=ANG$4R>;67sB7+>Y,o+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,o+C]5)+=Ach%13OO:-pQU
0H`.o0HahBC`k)X@rHL-F=.M):-pQU0H`.o0HahBC`k*C@;TR'%15is/g)hj1E\@o@W$!)-Z3@0
AM.J2F`):K%15is/g)hj1E\Cp@W$!)-RT?1%15is/g)hj1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!1E\Cp@W$!)-S?bU$4R>;67sB7+>Y,p+C]5)+=AdODfor>-OgDX67sB7+>Y,p+C]5)+=D&8
D.P(($;No?+>=oo+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>P'KDJUFC-OgCl$;No?+>=oo
+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>P'KDJUFC/gh)8%15is/g)hj1E\Fq@W$!)-SAnI
F`):K%15is/g)hj1E\Fq@W$!)-Z3@0AL@oo:-pQU0H`.o1*C%DC`k*C@;TR.@rHL-F=.M):-pQU
0H`.o1E^.EC`k)Q%13OO:-pQU0H`.o1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o1E^.EC`k)X
-OgCl$;No?+>=oo+>Y-LDJUFC/n8gBDKI68$;No?+>=oo+>Y-LDJUFCDIIBn-OgDX67sB7+>Y,r
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo0d'qCC`k)Q%13OO:-pQU1a"Lq1,0n\DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>PYo@W$!)-S?bU$4R>;67sB;+>Fuo0d'qCC`k)X@rHL-F=.M):-pQU
1a"Lq1,0n\DJUFCDIIBn-OgDX67sB;+>Fuo0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,9t]
DJUFC-OgCl$;No?+>b2q+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5,+C]5)+=Ach%13OO
:-pQU1a"Lq1,9t]DJUFC/n8gBDKI68$;No?+>b2q+>P\p@W$!)-Z3@0AL@oo:-pQU1a"Lq1,9t]
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P_q@W$!)-RT?1%15is/g)tn0d&5-+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo1E^.EC`k)X-OgCl$;No?+>b2q+>P_q@W$!)-SAnIF`):K%15is/g)tn
0d&5-+C]5)+=D&8D.P(($;No?+>b2q+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5.+C]5)
+=ANG$4R>;67sB;+>Fuo1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,L+_DJUFC/gh)8%15is
/g)tn0d&5.+C]5)+=AdODfor>-OgDX67sB;+>Fuo1a$7FC`k*C@;TR'%15is/g)tn0d&5.+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2'?@GC`k)Q%13OO:-pQU1a"Lq1,U1`DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2q+>Pes@W$!)-S?bU$4R>;67sB;+>Fuo2'?@GC`k)X@rHL-F=.M):-pQU1a"Lq
1,U1`DJUFCDIIBn-OgDX67sB;+>Fuo2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,^7aDJUFC
-OgCl$;No?+>b2q+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&50+C]5)+=Ach%13OO:-pQU
1a"Lq1,^7aDJUFC/n8gBDKI68$;No?+>b2q+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Lq1,^7aDJUFC
DIIBn/n8gBDKI68$;No?+>b2q+>Pku@W$!)-RT?1%15is/g)tn0d&51+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Fuo2]uRIC`k)X-OgCl$;No?+>b2q+>Pku@W$!)-SAnIF`):K%15is/g)tn0d&51
+C]5)+=D&8D.P(($;No?+>b2q+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&52+C]5)+=ANG
$4R>;67sB;+>Fuo3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,pCcDJUFC/gh)8%15is/g)tn
0d&52+C]5)+=AdODfor>-OgDX67sB;+>Fuo3$;[JC`k*C@;TR'%15is/g)tn0d&52+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>P&p0d'qCC`k)Q%13OO:-pQU1a"Or1,0n\DJUFC/gh)8-t7(1+=Ach
.3L3'+>b2r+>PYo@W$!)-S?bU$4R>;67sB;+>P&p0d'qCC`k)X@rHL-F=.M):-pQU1a"Or1,0n\
DJUFCDIIBn-OgDX67sB;+>P&p0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,9t]DJUFC-OgCl
$;No?+>b2r+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>-+C]5)+=Ach%13OO:-pQU1a"Or
1,9t]DJUFC/n8gBDKI68$;No?+>b2r+>P\p@W$!)-Z3@0AL@oo:-pQU1a"Or1,9t]DJUFCDIIBn
/n8gBDKI68$;No?+>b2r+>P_q@W$!)-RT?1%15is/g)tn1*A>.+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>P&p1E^.EC`k)X-OgCl$;No?+>b2r+>P_q@W$!)-SAnIF`):K%15is/g)tn1*A>.+C]5)
+=D&8D.P(($;No?+>b2r+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>/+C]5)+=ANG$4R>;
67sB;+>P&p1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,L+_DJUFC/gh)8%15is/g)tn1*A>/
+C]5)+=AdODfor>-OgDX67sB;+>P&p1a$7FC`k*C@;TR'%15is/g)tn1*A>/+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>P&p2'?@GC`k)Q%13OO:-pQU1a"Or1,U1`DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2r+>Pes@W$!)-S?bU$4R>;67sB;+>P&p2'?@GC`k)X@rHL-F=.M):-pQU1a"Or1,U1`DJUFC
DIIBn-OgDX67sB;+>P&p2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,^7aDJUFC-OgCl$;No?
+>b2r+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>1+C]5)+=Ach%13OO:-pQU1a"Or1,^7a
DJUFC/n8gBDKI68$;No?+>b2r+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Or1,^7aDJUFCDIIBn/n8gB
DKI68$;No?+>b2r+>Pku@W$!)-RT?1%15is/g)tn1*A>2+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>P&p2]uRIC`k)X-OgCl$;No?+>b2r+>Pku@W$!)-SAnIF`):K%15is/g)tn1*A>2+C]5)+=D&8
D.P(($;No?+>b2r+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>3+C]5)+=ANG$4R>;67sB;
+>P&p3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,pCcDJUFC/gh)8%15is/g)tn1*A>3+C]5)
+=AdODfor>-OgDX67sB;+>P&p3$;[JC`k*C@;TR'%15is/g)tn1*A>3+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Y,q0d'qCC`k)Q%13OO:-pQU1a"Rs1,0n\DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+>PYo@W$!)-S?bU$4R>;67sB;+>Y,q0d'qCC`k)X@rHL-F=.M):-pQU1a"Rs1,0n\DJUFCDIIBn
-OgDX67sB;+>Y,q0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,9t]DJUFC-OgCl$;No?+>b2s
+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G.+C]5)+=Ach%13OO:-pQU1a"Rs1,9t]DJUFC
/n8gBDKI68$;No?+>b2s+>P\p@W$!)-Z3@0AL@oo:-pQU1a"Rs1,9t]DJUFCDIIBn/n8gBDKI68
$;No?+>b2s+>P_q@W$!)-RT?1%15is/g)tn1E\G/+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q
1E^.EC`k)X-OgCl$;No?+>b2s+>P_q@W$!)-SAnIF`):K%15is/g)tn1E\G/+C]5)+=D&8D.P((
$;No?+>b2s+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G0+C]5)+=ANG$4R>;67sB;+>Y,q
1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,L+_DJUFC/gh)8%15is/g)tn1E\G0+C]5)+=AdO
Dfor>-OgDX67sB;+>Y,q1a$7FC`k*C@;TR'%15is/g)tn1E\G0+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>Y,q2'?@GC`k)Q%13OO:-pQU1a"Rs1,U1`DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pes
@W$!)-S?bU$4R>;67sB;+>Y,q2'?@GC`k)X@rHL-F=.M):-pQU1a"Rs1,U1`DJUFCDIIBn-OgDX
67sB;+>Y,q2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,^7aDJUFC-OgCl$;No?+>b2s+>Pht
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G2+C]5)+=Ach%13OO:-pQU1a"Rs1,^7aDJUFC/n8gB
DKI68$;No?+>b2s+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Rs1,^7aDJUFCDIIBn/n8gBDKI68$;No?
+>b2s+>Pku@W$!)-RT?1%15is/g)tn1E\G3+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2]uRI
C`k)X-OgCl$;No?+>b2s+>Pku@W$!)-SAnIF`):K%15is/g)tn1E\G3+C]5)+=D&8D.P(($;No?
+>b2s+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G4+C]5)+=ANG$4R>;67sB;+>Y,q3$;[J
C`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,pCcDJUFC/gh)8%15is/g)tn1E\G4+C]5)+=AdODfor>
-OgDX67sB;+>Y,q3$;[JC`k*C@;TR'%15is/g)tn1E\G4+C]5)+=D&8D.P>0Dfor>-OgCl$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$7IVg+Z_G/+?V#\@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?97D/a5gD/X3$0JH6g/h1@LD/a5gD/X3$0JFVk/M/)eATMr9
-t@14E,$gEDIIBn+E(_$F`V&$FD5Z2/e&._67r]S:-pQU=(l/_+EV:.+<Y`IEbTE(+=Jm(.6T^7
+CT5.ARTV#+<YB9+<Y)88g#7#DfTA2+=L`<D/a5=+EqO9C^g_H67sC!@V0b(@psIj+CT/5+<YK=
@ps0rDIIBnF"SS2@V0b(@psIjA0>buD.Rc2+C\npBl5%9GA2/4+EV:.%15is/g,+RAS,Y$+<W(.
6:OsR6Vp6S.3KaADIak4+D#G$+<YlBFD)d>Ea`irDf$U>@UX=h+<XEF9gq?A:e3k]$;No?+EM[;
AncL$F!)SJ@rH7,Ec5c1ARlo+@X0(=-r30!<Du7P:/iYp+<VdtBkM*jEZcJIG%#30ATJt:De9Fc
:-pQU-r30!<Du7P:/iYbB4YslEaa'$+Dbt6B4Z*+@;]TuCh7[/+Dbb-AScW7FDi:3CghBu+DtV)
ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8Z0e"5RF)uJ@ATJu9ATMr9A8,OqBl@lt
Ed8cUFCfN8C2[W:.3N2HBleB;%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F?C3=>I2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)
ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!
@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't5-RT?1
%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B+CehrCcW[]C1D9,
-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?+Co%qBl7K)GAhM4
+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(.6T^7Ddm=$F(8X#
AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC
%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk%15is
/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$
F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&
+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)GA2/4+E(_$F`V&$
FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@$4R>;67sBsDe!3l
+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)
@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4
Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-FD,*)+D58-+EqC2
Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk+<t]@@ps1p
%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G
0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$;No?+EMXCEb-A-
DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQUEb/Zi+C\bhCER&'
A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO:-pQUCi<flC`me4
DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tD
F)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs+=o,f
F)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S:-pQ_@rH4'C/\tf
CLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU$;No?$;No?+CT>4F_t]2
3XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMn:-pQU@rc-hFCeuD+>PW)0QUfE0JNo067sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g)l'DJs\R1E^gZA79RkA0>K&
EZdtM6m+093A*-=$;No?+>G`gF_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/DIakuA867.
FCeu*AoD]48g$)G0Jj,367sB'+<VdL+<Ve8DIal-ATo7FF)>i2ALq;!F(o,8Cgh?sALqnEEb0<5
/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O%]@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=CoBA9;C(FCfJ?
$4:9]@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\
6$$m]CLoLd3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$;No?
+>%q>78m/.;cH%\<.->*$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL2lEZf:2+=D8BF*)/8
A2#A<$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56FDi:3Df'H6ATMo"9Q+f]:18!NF$XhX
;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!$4:6\D]h1q+ED%%Ci"B5Df03*@;TRs@;]t$H#7+84Y@k!
BOuHtEb/[#H#7MBDf$U[/g)hTDe<R*ARf:mF(of/F*(i.A79LhF!*Uu+C]8-$4:lg@<>puARTXj
@;TFcBl7QlF)Go;FCB&t@<,meFCB!%+?_>"@W-0-.Nj!D$7AeA6qL0S;]nq;:K0bN+AP3s78k<p
;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[Hh!7nc]F5tk3"79DoN<CB8D-TsL5@W-/l.1-Dn
EZfI@E,9H&+E2IF+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+LC(Eap4r+=D2>+EVjM-TsL5
@rH4'C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B$8EZ-+EMC<F`_SFF<G[MF:&@rBQ%p5
4ZX]A+?CW!$;No?+DtV)ATJu&Ci"-'@:XX+Df0,/@q]:k+>"^RDfd+3BOPdkARl-V4YD!eGs*cg
+=\Kh$@4if@3@$BGp"RZGmYu-$>"6#FDYu5Ddso/F`\`RF(fK4F=.E9@j"tu-ZW]>FEhmT4Z[(k
D/a54-Z`s>Ec`Z90d'[CF)>i<FDuAE+EVjM$47,Y@VTIaFE1r)F$2Q,1E\_$0FDN&D-pXg@VTIa
F?M6!Gp#jK/g+\C+Du+>+Cf>,E,oN2F!,C1C1UmsEsc`%F*(brBl79bDdmHm@ru'b@rH6sF`V88
DETTp1("A!Bl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?De!3lATJ2-$4:?b+EVI>
Ci<f+E-67F-Z<I/ARfh&AS-!2$?BW!>9G;6@j#l<F=044@rH4'C*4mB@VTIaFE1r)F!h;L+Bot0
D/XQ=E-67FFEhm7$>40n@UX(nAS-!H3\qm>+>=.8Ci<ckCi^^K+CT;%+=\LODfd*O+Cf>,E,oN2
F(Jl).Nj!D.1-DnEZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(-OOm(+Bos9Eap56G]Y;r3ZqpND/a54
-YI76@UX(nAS-!2$8EZ-+EMC<F`_SFF<G[MF:&?^A7]7e@<,piF(9--ATL!q+>b3%+>=-0:-pQU
A7]7e@<,pi+EM%2E+O)5@<,p%FDl;3BR(_<@;TRs+CT.u+CT;%$;No?+D#e-Cis9"A0>K)Df$V=
BOr;rDf'H6ATMp,Df-\:Ec5H!F)qZqDg#]4EbT&q4Z[4lDdm-kF$2Q,GT\,(67sZ9.6T:+Dg#]4
EbT&q+D5M/@UX(o$4:6\D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U+=J]g4ZX]pDf6b3Df6b?Df5si
AoD]sDIIBnF"SS\+CoCC$6UH6+C]8-+=\LO@;TRs?YOCgAU#=?:-pQUBl.g*Bk(k!+D,P4/g+tK
@ps1p+Du+>+Cf(nDJ*Nk$6UH6+=DAE+D58-+CfG7DI[?kA0>f5F<GL6+D#e3F*(u2@q@#14Y@jp
@;TRs+=\LO@;TRs$>"*c/d_r!Df6aJ+F+;C$4:?b+EVI>Ci<f+E-67F-Y-duCgh?qA927!E+O)<
$?BW!>9G;6@j#l<F=044+Cf>,E,$LCA7]7e@<,piF(9--ATK4+0d'[CF)>i<FDuAE+EVjM$4:Wa
G\(E,@rH<tF$2Q,1E\_$0FA.^67sBsDe!3l+DGm>@<6L(B5V9k+Dbt+@;I&pDIal&Ci<ckC^Np(
/g,@OASrW!DL!@ABm=3"+EM%2E+O)5@<,p%A7]jo@ru9m+E).6Gm[;5/g,@OBlmo/F)YPtAKY].
+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7da67sBhDIal(A7]Y#BkD'jF!,=6G\(D.F(9--ATJ1c
Ci<flCcsBnGm\A+@ps1:3Zp1#.NiPG@ps0\.1-DnEZfI@E,9H&+E2IF+=D#?G\(E,@rH<tF!h<8
@j"tu-ZW]>FEhmT4ZX]qDf'H.+=D#?G\(E,@rH<tF!h;L+Bot0D/XQ=E-67FFEhm7$=e!lAp&0+
A927!E+O)R3Zp4$3Zp*`$;No?+DGF1FD,6+AKYE%AKYE!Gp%!5D.Oi"CghC+BkD'h@<?4%DBNY7
F*2&8$;No?+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e3a
67sC&BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt*:-pQUG%G]'+Co&*
ARfh'+CT.u+ED%4DfTr@+Cf>-Ap&0+A0>Do@r,Ro@<?4%DK@E;$;No?+C]8-+DGm>A7]7e@<,pi
+Dbt+@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AI8cRDf7da+<VdL+<VdL+AP6U+=J]g4Y@jdDf5tr
Df7ck@W-0-.Nj!Z+AP6U+=J]g4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-Y%(4Ap&0+A927!E+O)<
$?BW!>9G;6@j#l<F=044+Cf>,E,$LC@rH6sF`V,)F(9--ATK4+$;No?+>%q>78m/.;cQ1P78m,S
<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2
?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$ATVL)FC])qFD5Z2@<-'nF!,QV/KePDART[l
F!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjEb/[$ARmhE1,(F;An>F+1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80l:?E0f'qhDe*QoBk:ft
FDi:BF`&=GBln#2DIn#7-u!F7A18X8DKKH1Amo1\+Dbt+@;KKa$;No?+>GTgDg!lj+=M8IEc5l<
.3N&0A7]9o/KeJ4C3=T>ARlp*D]j(CDBNk8+C]82BHVM5DId[0+=84IBl8'<%15is/g)l-C3=DL
0HbIKF*&O8Bk)7!Df0!(Bk;?.@WGmpA7]9o/KenKEb-A%A7T7^%13OO@rGk"EcP`/F<Dr?@<6!-
%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(
<(0_b-OgCl$;No?+EV19FCfJ8F`_>6F!,:;@:UKpDKKe>-u!F7A18X;De!3lAISueAT;j,Eb-@@
C2[X)ATMs)E[M;'%15is/g+YEART[l+EV13E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUA7]@eDIjr4ATMr9F`_>6Et&IuATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$4R>;67sC'DK9<$BleB-EZee.Gp%3?F*)/8A0>Ds@ruF'DIIR"ATJ:f5'nn)
6qKaF;a!/a1a$^I+=ANG$8EZ-+@Jdg<)Yq@+>G!XBk(p$6qKaF;[j'g+Bot0BQ&*6@<6K46qKaF
;a!/a.!mQj0d&kU6W?u5+<u=X.kWJ!0d%kq3[]#\F*)/8A1&fK74o]HHS-Ks+@Jdg<)X550d'[C
1E^^LB4N>Q+@Jdg<)X55%15is/g+\9F*)G@Gp$O3C`m51EcP`/F<G=:A9;C(F<G+.@ruF'DIIR"
ATJ:f:-pQU:2b5c3ZrNXAKZFo:IJ/N;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/
AKVEh8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YD
CERY9DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN8
0ddD;%14g4>9Is'Ec5l<+A,Et<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4+Dbb0Fa,QV
@:K`R8l%iS78m/`:JXqQ3Zq$j6rZTR<)QLf<%KD%-OgCl$;No?+CfG'@<?''ASlC.Gp%3?F*&O8
Bk)7!Df0!(Bk;?./Kf+GFED57B-9T<6WHiL:/jVQ6W=L%:-pQUFDi9U+E2@4F(KB8ATJu9BOr<.
Bl.E(F*(i-E$/V1@;]U.%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W]3[]#\F*)/8A2#\b%16Ze
+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\
De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>REZf72G@Vh,DECHd6rZTR<)QLf<%MQt
4ZXs4ATMs.De(OV-OgDoEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@
A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOATAo2ATqZ-
A8XJ$:IJ/N;cHXj:K/lUDEU$.FCfN8C2[W:1+*M<ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh
/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F
<$sa]+:SYe$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8XOk-Zip@FD>`)0Jb'c$>"6#2'?j\F<DuR
F*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!
E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W]3[]#\F*)/8
A2#hf%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$
D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>REZf72G@Vh,DECHd6rZTR
<)QLf<%MQt4ZXs4ATMs.De(OZ-OgDoEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUDEU$.FCfN8C2[W:2CAq@ATAnN+E2IF+=M>QFCB$*?X[\f
A7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t
<D>nW<(';F<$sa]+:SYe$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8XOk-Zip@FD>`)0K1?g$>"6#
2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-Y
A0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W]
3[]#\F*)/8A2#tj%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lU
DBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>REZf72G@Vh,
DECHd6rZTR<)QLf<%MQt4ZXs4ATMs.De(O^-OgDoEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl
/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF
-Ta")%13OOATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUDEU$.FCfN8C2[W;0II;:ATAnN+E2IF+=M>Q
FCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHq
F(KG9-U^`t<D>nW<(';F<$sa]+:SYe$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8XOk-Zip@FD>`)
0ek$b$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#
%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16Ze+Dtb7A0>E#4%`::<(0_b
;GU(f/7`W]3[]#\F*)/8A2,he%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N
;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>R
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt4ZXs4ATMs.De(RY-OgDoEZd4^E-67F.!0NP@;Tsj@;9^k
?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M
9gqfV6qKaF-Ta")%13OOATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUDEU$.FCfN8C2[W;1a`_>ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8XOk
-Zip@FD>`)0f:<f$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt
+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%15is/g,(QA7]d(
De:,/@:sIlFEM,*+Co1rFD5Z2@<-'nEt&IfEZf72G@Vh,DECHd6rZTR<)QLf<%MQt4ZXs4ATMs.
De(RV0II;:ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip
+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$;No?+EVgG+E):2ATDi7
De:,/@:sIlFEM,*+Co1rFD5Z2@<-'nEt&IfEZf72G@Vh,DECHd6rZTR<)QLf<%MQt4ZXs4ATMs.
De(RV0JFj`$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,
A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%15is/g++^;cFl<<C9,B
;c?.c9FV=<$;No?+ED%3E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QATMs6Dg?G9F*(r,@ruF'DIIR"
ATLU5/h1CCF*)G@H$!V=FC])qFD5Z2@<-'nF!,QV/KeS8F*)G@H#k*#:IH=IATMr9A8,OqBl@lt
EbT*+/e&._67r]S:-pQU@<6L4D.RcL+=LuCA9;C(FCfJA+DGm>@3BB)@:UL%@rc:&F:ARP67sB'
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;!@<jR`%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)l'DJs\R0d%lbD/sQ5F=A>@A7T7^+>"^RDg*=EF`)7CDf-\!Bl7I"GB4m8DIak`Bl8'<
%15is/g)l-C3=DL0Hah5F(o,,@rH6sBkJQ1ATMr9@:Wn[A.8kT$=e!aF`MM6DKI!K@UX=h-OgCl
$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR
<$r+^%15is/g,7IF*&OIFD5Q4+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,eEHPu9AKW@8De*s$
F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rt
F(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*
A8,OqBl@ltEbT*+%15:G/g*PR6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn
$8EZ-+EM47GApu3F!*kB6W?uI3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nID,FCfN8C2[W1.3M&3
+?k-)+u(3.8OHHU%14g4>9G^EEb/lo-9`P?8OHHU%13OO:-pQUA7]h(Ec64G@;Ka&@s)g4ASuT4
C2[X)ATMr9A8,OqBl@ltEbT*+%15is/g*o-FCdKUFD,5.IVNe3FCfN8+EDC=F<GFCF*&O6AKZ&*
F<E.XF`V+:8g%V^DJ!TqF`M%9%15^'6rZTR<)QLf<'<8bC2dU'BHS[O8l%iS78m/5%13OO:-pQU
<DGn(GA1r*Dg-7FDImp6DfTV9Ec5l<%15is/g*b^6rZTR<)QLf<'<8b-X9nnARf4f@<4+V>]k+!
EcYK#A7At_ATD$jDe*s$F*',a%13OO0d'[CEc#i8Dfd*o:IJ/N;cHXj:K.c1%15is/g++^;cFl<
<C9,B;c?.c9FV=<$;No?+ED%3E+No0@;^?5A8,OqBl@ltEbT*+%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QBk1.ZDeio<0MXqe.V*7(
;f-GgAM>e\F=f'e-tI%&.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL+:SZQ67r]S:-pQU
+<WBf+EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdh
AISuA67sB'+>YGh;FNl>=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+3XlEk67sB'+<VdL.!0$AFD>`)
0J">gATMs.De(RR+EV19FD>`)0eb.$FCfN8C2[W;0JFpu%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(C9F(K;E0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72e6K00f^@dDf0`0
Ecbl'+EVNEC,R[u1*B1b6k'Ju67sB80lCoQ0fU:uE+EC!ARloqDfQsm2_Rj=DKU15$;No?+>G`g
F_i`l+ED%2@;TRd+=Lc7A5d>`CLo1R.3N5CDf$UFA8,R@@<6-m0JG41+:SZQ67sB'+<VdL+<VeI
F`&=9DBN\:DJLA2De!3lAIStU$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\
6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2+Eh=:
@N[(0Bk/Y8BkM=%Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De't<FCfN8C2[W:-OgDoEZen,A0<Q8
$4R>;67sBuF_tT!EZf:4+Co1rFD5Z2@<-'nF!,C=+E1b2BHV/7F*&OA@<?!m%14g44WkslI4cXQ
Bk/>?%13OOATAo3A0<rp-Zip@FD>`)0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!+?^hl+FPjb
A8,Qs0F\?u$>"6#FZhc.0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"F!,.-@:Wqi
%13OOATAnL+E(d54$"a2ATMs.De(OEFCfN8C2[W;0JFj`$>"6#FZhc.A8,QsINU<R$8Wef+<r!`
+E2%)CERa/$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K
@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWDJW6gDeio<0MXqe.V*F5;f-GgAM>e\
F=f'e-tI43.3N\KDeio,FCfN8F"Rn/:-pQB$;No?+@BgR@r$-.+CT)&+<Yc>AKZ/)Ch[E&+CT;'
F_t]-F<D]9@<6"$+<YT7+<W(CDJUaS+<XF%D.Ra+F`S!!:-pQU,&Ut#Ebp"D@rHC.ARfg++DG_:
@;KXg+Cei$ATJu&Eb-A%CiaM;FCfN8ARmD&$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd]
.3L$\ATMs.De(ON+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JPG"F_ife%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+Bosu
De3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrD
Df9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%16Ze+E(d5-Zip@FD>`)0II;:%15is/g+\9
Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUDf0B:+E2IF+Co1r
FD5Z2@<-W9BlbD8DBO%7AKYr#FD)*j1*A_&,@kM!+>=63%15is/g+\=@ruF'DIIR2+DGm>ASlC.
Gmt*7+?^hl4s2R&HQY!bA8Z3+-RT?10H`M$,<d5)+F>4c+CoA++=ANG$8<Sc+<s&m0d(fc1*C+F
C`k)Q%14d34Wkt5+>G!c+>Y-NDJUFC-OgD:+?^hl4s2R&HQY-fA8Z3+-RT?1%15is/g+kGF(KB6
+EMI<AKZ/-Eaj)!$?g;qD.RcO3ZoeZGB.4J+C]P8A2,39GB.4L+C]P8A2>SB$=\4"A2$/-+?^/@
@Wuj'0g.Q?/I`%rGB.4L4ZX]A+?CVmGT\IYGpa%.@Wuj'1HdcA0f'q5+=DCV/Kcek.Nj!a%159Q
HZX+DCi<f+E-67F4$%P&@;TRs%13OO:-pQUBl8!'Ec`FFDf'&.DJsZ8Et&IoDIIBnF$2Q,-Z4-K
A2#-DGB.4K+DuCDA259FGB.4M+DuCDA2GYC$7ItsDJim"ATK:`3ZoguF_>N9+Cf>6@W-O5-Rh,*
BeCM`+>YH.-o!D?0eb%<-oa40,p5E0+>P3$2^pgNFZLmmDJ<U!A7Zm#AKYH&D^Pu$4tq>*D/a<0
@j#`5F<EY+DJim"ATJ:f%13OO-tI43+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnEt&I)
0HanDC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f%14L;+>G!LDJUFC-Rg/i3Zp."
4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2E,oN%Bm:'o-nlc!+CoA++=ANc
+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>T(AncK!$7ISN1E^4G
C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;6F_56"GRXuh
$7ISN0d("EC`k*7GB,&[+>#Vs0d&P#4$%P&@;TRs+<VdL+<VdL:-pQUGAhM4+E2@4AncK!$7ISN
1*C+FC`k)^-Rg/i3Zp."4!6UG-Z4-KA2GYV+<VdL+<VdL:-pQUGAhM4+DG_*Bm:'o-nlc"+CoA+
+=C\S-Rg/i3Zp."4!6UG-Xq:?A2,3EGB.4K-QjO,67sC)DfTA2F*2),Bm:'o%16uaEZd%Y0HanD
C`k)Q+AP6U+E;O4Ch[KqATAo)EcQ)=Et&IoATAnI+>b3ODJUFC-OgE#ATAnI+>=ol+CoA++=ANG
$4R=j0H`(m0HanDC`k)Q.3L3'+>G!#+?MW%DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/is
GT\DPDfor=.1HV40H`(m0HanDC`k*CGB.4N-Rg/i3Zp."4!6UG-Z4-KA2GYV:-pQUGAhM4+E2@4
AncK4-uNsGDK@69$7ISN1*A7nA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Z4-KA2>SU+<XEG/g,@VEb$;,
DJ!U-+=M,GF`)7L%14L;+>Y,o+CoA++=C\S-Rg/i3Zp."4!6UG-Z4-KA2,GS+<Ve%67sC)DfTA2
F*2),Bm:aKDJsZ8F"%P*%16uaEZd%Y1a"IpA8Z3+-ZW`F+<XEG/g,.V@;KXiBk;<-ATDg0EcVZs
DImi20H`1p1E^4GC`k*GA1&KB%16uaEZd%Y0H`.oA8Z3+-Z3iM%16uaEZd%Y0H`(mA8Z3+-[0TL
DJ(=+$>sEq+>=ol+>P'MDJUFC@:s"_DC5l#+:SZ+0H`(m1E^4GC`k)Q.3L3'+>G!#+?MW-DIIBn
F!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DXATD7$.1HV40H`(m1E^4GC`k*7GB.4M-Rg/i
3Zp."4!6UG-Xq:?A2>SU:-pQUGAhM4+E2@4AncK4.!B0B@WNt-$7ISN1*A@qA8Z3+-ZW`R-Rg/i
3Zp."4!6UG-Xq:?A2>SU+<XEG/g,@VEb$;,DJ!U-+=MDEEaj)=%14L;+>Y,r+CoA++=C\S-Rg/i
3Zp."4!6UG-Xq:?A2,GS+<Ve%67sC)DfTA2F*2),Bm:aKG%G]'F"%P*%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$$m]CLoLd3F??.;f-GgAM>f567sa!A5d>`CLo1R+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3.3L$V
@;TR,>@VJXF)tV<FCf]=.3KaT@:F%a%15is/g+_9Bln',B.aW#:-pQB$;No?+=Lf3.3N_DF*)IG
Eb065Bl[c-D/XH++E_a:EZf(6FCfK9ASuU(Df-\>BOPd$D..=-+E)@8ATAnc:IGX!:-pQUFCfN8
F"SRX6$".kFD,5.+EV19FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeLF(KA7+EqO;A8c[5+<W(NEX`@N
67sBoH#R>8Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&$;No?
%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W&$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ifn%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eX
D/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8
-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8
%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaGDfTB0
+E(j7G%#E*Dfp+DFEqh:Et&IcDf9H$Dg=K,+>=63Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p,To$)
%15[?@<Q3LBOPpi@ru:&4ZX]5BQ&);D09?%+EqaBA0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-@r!G$
$=n't@VfUpCisfADJ*m+A3Dsr.lne<+=fJ^$=RdjATD="F?MZ--8#`7GA^i+ATL!q+?MV3@W-1$
@W-N7Ao)BoFDYS38SDOUAOC->Ea`I"ATAo(DfoN*AT2I.F*2A5Df9//@;TspEb'*1-OgDH0RInY
E,9H&+E2IF+Eq^3D.Rbt$9g.jF>,j=+>=om0Hb">F<GdF@;TRs%13OO:-pQUARoLs+EqaEA0<:<
@;TR,@r,RpF"DEEG]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl4"u#*
DIIBnF!+[0ARloF0me!r%13OO:-pQUBl8!'Ec`FGATMs7+CT.u+CT.u+DkOsEc6".$9g.j0d(FX
F<DrQATMs%CiF&r0JFk9-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JOq:
-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JY";-Vcu\+DG_2De!^.F!,R9
G]Y;B$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'A_4#/NP-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r@;Kmr
@5'D`4#/NP-SZ_o+>G5Q$4R>+0RImr4ZX]?+D58-+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8@;Kmr
@5'&<$4R>;67sBlA8--.FCfN8-uNI1ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2u
A8-.(EZd+[/KcDl4"u#'DIIBnF!+[0ARloF0me!s%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs4ZX^6
/g)tnA8Z3+-Z*:%Ec5B&E+iZ6-OgCl$;No?+D#(tF<GF/@rcK1-uNI1ALq>0A7[<6AU&;G+EV%$
Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsV+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(1(=R"
$4R>+0RGSuDe't<FCfN8C2[W:-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y=1n@WPIbDeioM
F)u&.DD3au:-pQ_B5DKqF&QpoCLoeQF(o9)0JG1'+<YbX/Kc/YBl7HqEb/a&+<Y*6F(o9)D.RU,
+<YT7+<Ve>Ci<ckC^g_H67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>F`)7Q%15is/e&._67sBLEcQ)=
+Co2-@rHO%Eb/c(A9Dp,DJ()7F(HJ4Afs]A6m-Dc+>>eu:LeJh1,(F?+>GW42)I?N0b"Ib67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH0KBRL:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0fNrXGqh&sAnc-kCi"A>AncK4FD,B0+Du=9F(&rrAISuA67sB82f2uK0f:(^A7Qg$G%G]7
Bk1ctFCAf)-seq`4ZX#Z%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/
DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO<(0_b=[>bV78c90+>F<4%172gF*(u2G%ku8DJ`s&
F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g,%M+Dkh;ARlolF)u&.DJ`s&
FE7luD/"6+A4^ZLBl[cpF?sthBkM<ZCG7n41a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%16]i
DI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$=Q(M+?0f;@Qcap2E!H9%14Nn
$4R>;67sBuD]in2G\(D.@<6L(B5VQtDKKqB@;]TuEb/d(DId0nF<GO2Eb0-1BOu6rEt&InBm=3"
8T&'QEb/a&6$%*]B5UL\0g.QS+?CW!%14L39kAE[De).SB6A'&DKKqK.6T:+0F\A$F`(])Gs*c&
-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14L3-n&PIChtOL.4ID@+=CZ;G@GK9-OgD3
%13OO:-pQUD/"6+A0><%F(o9)D.RU,F!)lCF`(\<+DGm>F`V,)+C]82BHV,0@ps1iGp$O5A0>N$
Ddm-kCj?HsD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0KhHR+?CW!%16]iDIYg^+=DJRF`^thG@>,k
-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUFD,6+AKYE%AKYi(G\(D.@<6L(B5VQtDKKqB
@V'%XF`V+:-t[U>@jrO<@;TQb$;No?+DGm>@W-@%+Dbt+@;Kb*+CT.u+D5M/@UX(hGp$O:F(o9)
ARlp*BPDN1BlbD8CCLVG67sBpDBMOo@Wcc8F)5c6E-WRD@;TQuF`V+:@<3Q'@<*K!F!+(N6m-2b
+Cf>-@qB[uARl5WD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0g.QS+?CW!%14LXATVU(A3k6KF_t]-
FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R><G%G]7
Bk1dHDIdI%ARfgJF)u&.DD=:81a"h%0F\@a67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)l;
3[m3Q%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R>;67sBnCi<d(+Dbt7CNCV1DfQtEDfTA2G%#30ATJu.DBNCsF(HJ1De!3l
AKVEh:-pQU@X0),AS,@nCige9Df9D6Bl5&8ATMr9Ci<flCh4`$DfQtBBPDN1FCfN8%13OO:-pQU
Eb0?8Ec,q@@rHC.ARfg)Eb0<7Cig*nATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DGP%%?U6tD
F)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Z*RBARnAMA8-'q@rt"XF(o9):MVXk5s[eXD/X3$3B9*,
-OgDoEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9):MV[l5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/
@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCGB0^5s]R/DeioE3B:Fo%13OO:-pQUA7]jo@rri1Bm=3"
+DG_(Bl[cpF<G"5F(o9)D.RU,+DtV)AKZ,:AISuaATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.
DFJSdDfRO=5s[eXD/X3$3B9*,-OgE#ATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfRR>
5s[eXD/X3$3B9*,-OgCl$;No?+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKq/$>"6#B5DKqF!)i+
G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%16Ze+>GSnB5DKqF!)i+G%G]7Bk1dH
DIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,Ci<`m
;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9
Afu#$C1UmsF!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU<+oue+EV19F<GX7EbTK7+DGm>
+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08/db??/g*`-+EM47F_kS2DJsV>
+CT).ATAn9FD,5.+EDUBDJ=!$+Dbt+@;KKtBOu'kAKY]/+<YK/@r$-.FD,4m:-pQUF`V\6C`mh2
F*&OGATW'6+CT.u+EV1'EZen2GA]#?:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3L$\ATMs.
De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE
1,(F?@<H3:2@<2G/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+$48sNHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I$49Np/g,@VEb'56De:,8
@<-(#F`S[IH#R>9$:7Na9L2WR9e\^k+>=-h:JXYM<)64C4ZX]?$:7Na9MA#V<'<8b5;"'50JF_,
$:7Na9N4;E9LV**+?qJ$2'=V0+=&'b$49@"<'aJZ9e\^k+>F3p:/k1Y6;0g23ZpX>+>k8t,V^u,
$496r:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%^$:@?M;G9Y\<'<8b-V5FhD'4%9@<<V`+CT+0
@V'%XF`V+:8K_P^+EqL-F<F-tA8`h&$<()%<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF@W-((
+CT.u+EV:*F<G:=+D,>*AL@fl6;L]^<)lCW4ZX]64@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW
<'`hX$;No?+EMXCEb-A0De!3lAKZ28Eb'4u4tq>*D/a<0@j#`5F<Db[-Z3a-5s[eXD/X3$3B9*,
+DEGb-OL2U67sBh+EV19F:(2cHSHX^F`\`RF)>i2AM@(pF*')`4!ua*4WlI%:-pQUFCfN8+EM%5
BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$0IJq)4$"`U:JXYM<)64B+@8k"
9L2WR9edbW:JXY`5se76-ON$kHY7A<+=Cl@FE;;;CLo1I4!6UG-V7'45u^WS0H`q^<)c.M9LU<9
$;No?+EMI<AKYhu@rcL/$9g.J1a$a[F<DrPD/X3$0MPtcEc3WZ4#/NP-YY1U1,C9b4tp1t+E2IF
+=D5IDeio<9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8+E(b"F`;UKF)YPtAM,)s+CT+0
@3BB#@V'RgC`t/5$;No?+DbUtG%De,Bk)7!Df0!(Gp%$EASqikDdd0TD/X3$FCfN80ht%f.Vs$3
A5d>`CLqU!F*',ZF=f'e+Dbt)A0>;'F)>?%C`m5+Ci!ZmFD5Z2+E(j7+E(_(ARfh'+<YB9FDhL]
67sB/FCfN8C2[W:.4ts&67rU?67sB[BPDN1+EV19F<D]I@rc:&F<D]BBkq9&-u<g1A5d>`CLqU!
F*')b+<YB>+<YcOE+rfjCi"A>+EDUB$;No?+DG_7Bk1ctDffZ(EZfI8F*&NIF(96)E--.R+A$Yt
F(fK7Ch+Z+Dfd*E@;L$sEZfI;AKW+9F`))2DJ';O67sBsDe!3lAKYYtDI[6#BlkJ6@:O(o+EV:.
+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU
@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OL2U67sC)
DfTB0+E(j7G%#E*Dfp+DFEqh:EscApDeq^=:JEN+3Zp*`@W-1$5u^WS0g.Q?0a_B.Der*=;cGn@
+?qJ$0eb:+1(%K/DerB=6;0g23ZpX>+>k8r1E[qc1("A&DKJ0D:JEN+3Zp-aBl8#l5se764ZX]M
/g*"o1F+\/0FA/!Ci<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/$4:9V@<,%5;cGn@+=B`'@;R-2
BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$4:j"D,`ef4ZX]A+?)5%,Tq.h+=A:UAKYE%
AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$=[pu;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR
8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.jFDYu5Ddso/F`\`M/gkOQ?U6tD
F)>i2AN;b2?Qa&81a`V;:-pQUF)Po,+EV19FE7dQ0RGMsE-67F-Za-CCLo5"ATMrI-T`\1+?^i%
+AP6U+EV19F<GX7EbTK7-ON$kHSHX^F`\`RF)>i2AMI.qF*',a4!ud+4WlL&:-pQUFCfN8+EM%5
BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$0df%*4$"`uDf9GX<)64B+C]8-
CdD#r9edc"Df9Gk5se76-ON$kHY7A<+=Cl@FE;;;CLo4J4!6UG-Y[I?5u^WS0Hb(IFAtOm9LU<9
$;No?+CQC6F_Pr/$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo+?MV3F)>i2AMI.qF*')YF)>i2AMI.q
F*',a$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AMHnf@rcKA-Ta(<4""_p+>P`#$9g.J
1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@88
8K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dGE+Np'Ddd0eF_u(rD/X3$0JH6g
/h1[U@:WnkD/`EjDeio<0HbHh/KeSHD/^V=@rc:&F<GU8Ci<`mBl7Q+F)>i2AKZ)+F*)IU%15is
/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gp!P':-pQU
+<VdL+ED%+A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0II;::-pQU+:SZQ67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?De!lC2%9mf67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!a
F`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2
AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<
De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio3
4ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio5
4ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OgCl$;No?+EVaHDBNk0
Afu20D.Rd1@;Tt)%159QHXq):ATT%B;FOPN8PVQA741/N%13OO:-pQUA7]RgFCcS'Cht5<DfTB0
/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&
DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1r
FD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1
+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sBkF_u(?@s)g4ASuT4@;]TuEb0'*@:TfSA7dtc
+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQUFEMVA+E)-?FD5T'F*(i-
E-!.1DIal#F_u(NEb0'*@:TfS4tq=oE-#T4+=C&U<'a)N5t=?k4#%0OA7dtc+DkP&AKW?J+<V+#
0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*
+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:G_Ddd0uATMrI
0JR*P@ruF'DIIR2:-pQ_Ci<`mFCfN80JG4lBk)7!Df0!(Gp%2\/KekJ@:UK8GT_*>F*&O8Bk)7!
Df0!(GqKO5:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTf@<jU^
+=Lr=De(:>Bl8$(Eb8`iAKYf-@ps1b+CSekARlp*D]iLtF(HJ'@<?0*%15is/g)8Z+<VdL+<W(I
De*s$F*(u6.3NYBEHPu9ALD&"%15is/g)l'DJs\R1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is
/g)l'DJs\R1E\)ZDf^#AAT0(@Eb0*+G%G28+=M>CF*&iRA7]RgFCeu*/Kf+GAKYGnCi=M,$;No?
+>G`gF`&rm+D,2,@q]RoB-8U%ATMr]Bk)7!Df0!(GsldlE%)oAEc5e;-u*[2FCfN8.3N/8@ruF'
DIIR2%15is/g)l-C3=DL0Hat=FCSuuDJ((?8oJ6=Dfp)1APcfWBLHu[E%)oAEc5e;-u*[2FCfN8
.3N/8@ruF'DIIR2%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?
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
$4R>REZf:2+=D8BF*)/8A2#_c%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS
+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT?1%15is/g+tK@:UL&ATMr9A9Da.+EM%5BlJ/:%14L30HiJ30JFpu3]\B;3[l1N
ATMr]Bk)7!Df0!(GsldlE"*.aDe!p1Eb0-1+EVI>Ci<fj5s[eYEaa$&3B9*,%13OO:-pQUE+*6l
+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2ASuU2%16Ze+E1b!CLeP8FCfN8
C2[W:0ddD;%15is/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@FD..=-+EM77B5D-%Ch[cu+Co&)@rc:&
FD5Z2F!,(5EZfREEb'56GA2/4Dfp.EA7]glEbTK7Bl@m1+:SZV4ZX]tF(K594s2O%0d&7pDJs*2
E$-MU%16#s3Zq?D,CUa`4>83,IQATu/g<"m;[j(FEZd%Y3$<0_F<DuY/g<"m;^ih?/g)Q%0IAn7
+tt,a-9`Q!3[-:$;^ii9/g`27+F?-n0d'C($4R>;67sBtATDEp+DG^98l%htF)Q2A@q?)V-n$bm
3\W!*3]\B;3[l1DDe)dbF`Lu':gnHZ7!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU
$4R>;67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.
DL!@KDfTB0%15is/g+SCAKYi(F)u&5B-:W#A0>_tDL!@5D.73lDfp+DDIIBnF!+n3AKY](E,ol9
ATDU4+Co%nCgh?qA1e;u0d'[C0Hb"EDdmc74s58++CoA++=ANG$4R>;67sBU:K0b*:.\/V3ZqsE
Ch7^"+EV:.+EqaEA0<:BATMrB+DGp?@rH3qF!,17+EhI-+=L3#F*'fa@ruF'DIIR27!3?c.1HVZ
67sBhDIal+ART+j+EVNED..3k+D,%rCisc0F!,17+EV:.+A>6l+>#/fFD,6+ALDOA@3A0<6m->T
CLmq^:-pQU@Wc<+FD,*)+E(b"F`MOGGA(Q*+EqaEA9/l;Bln#2FD,5.F(&os+DtV)AKYE!A0>Ds
AnGUpASuT4DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,XfATD@"F<G+.@ruF'DIIR"ATJu4
DBO%7AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9.!0$AFD>`)0e"4nFCfN8.3N>G
+CQC9ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?DD!&0ASl@/Bl7Q+BlkJ2ATD?)
Eb0*+G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(AKYT!G\(D.FD,B0+A!]"Bl%T.
D..3k+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*Bl5&8BOu6r+D58'ATD4$ARlp*
ATMr9A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k$;No?+>G!C+Co&"+=D8BF*&c=$4R>;
67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+=D8BF*)/8A2#_c%16Ze+DkP&AKW?J%13OO:-pQU
F(fK9+Cf>4DKKq/$>"6#F(fK9E+*g/+Co1s+FYFe%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K
@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3                           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c-=6+>P&o0H`,/+>GVo1-$I31*AA0+>GPm0fC./0H`)/+?:Q%1E\D4+>kubDJW6gDeio<0IUCJ
CagK8EbBN3ASuT4F)>i2AKZ)+F*)J5Df'H.;f-GgAM>f[ATMr9-t@14E,$gEDIIBn+E(_$F`V&$
FD5Z2@rH4'C/\tfCLo1S-t@14E,$gEG%#3$A0><$B6A'&DKI"BD/X3$+EV19FE:u,A5d>`CLo1R
-tI%&.3N\KDeio,FCfN8A8Z3^D/X3$0JFncDJUaEF)>i2AKZ)+F*)J7A5d>`CLo1RF)>i2AKZ)+
F*)IGDe:+?ARm54-uNI1ALq%qCghC+>qC)/G]YAWFCAWpAKYPpBln',B4l%!@WPIbDeioMF)u&.
DD3auBl7HqEb/a&+CT>4BkM=#ASuT4De:,)Ci<ckC`mk<EHQ2AARlp$@;TQuCh[s4+Du+?DK> ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fLj10fL42+>G_r1*A;11cI<81,'h++>Gc72E)a51a"Or2E!NT+>PVn1*AS30d&2*+>P&p0K:j2
0ea_*+>Gf52`)X31E\Fq1,UjB+?(Du+>GZ33B&'>+>P'"2D[<83$9t!1,(OA2]sh/+>P&s3B&`:
0fC.0+>G]50H`)/+>P'!3&Da42]sju2DR*30eje++>G`/0d&22+>P&s3AVd42]sju0f1aD8l%iA
<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#
+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO0f][M$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp='8p+qm1,(F?+>GT31,M$I2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QR$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2'>M6C`kJe
0f:(-3BB#U3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2'=#0@<?'A+>Get8p+qm1,(F?+>GQ22)mWO1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`O$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2]t_8C`kJe
0f:(.1-.6H3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?1Jd
6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Get8p+qm1,(F?+>Gf90JPUC1^XQs:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PYo8p+qm1,(F?+>GT30K2$J0a\6p
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PYo8p+qm
1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t
1*@]-@<?'A+>P_q8p+qm1,(F?+>GQ22)@9L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!":-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>P_q8p+qm1,(F?+>GT31,CsI
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Pbr
8p+qm1,(F?+>G`71H7EP3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t2BX,1@<?'A+>Pbr8p+qm1,(F?+>G`71b^sH2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>Pbr8p+qm1,(F?+>G`71c[TS1C=Hr:-pQU;gEG+
ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp17
+A-cm+>PW*2'=V33\`HP0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS0f^@!6t(1K3Zp1;+A-cm+>PW*2'=V23]&fW0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f'.D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp1<+A-cm+>PW*2'=V-
3\W<M1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K
3Zp1<+A-cm+>PW*2'=V-3]/lX1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+>Y-+F_;gP0JPF-0K;*L1HI<O$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Jj+D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD
2EEWL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqi
+@1-_+>PW*2'=V.3\`WU1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>Y-+F_;gP0JPF-0ek^F1-.*E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.3]&]T0es(C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKM
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi+@1-_
+>PW*2'=V33]&TQ0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
3?TG4@<?'A+>b3,F_;gP0JPF-0KD0J2**TM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU2'>2-B-8r`0f:(.2EETP3]&]$$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fB@G
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp='6$6f_
1,(F?+>>f:0K(sH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+>t?.F_;gP0JPF-0ebXF3BAlN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU2BY;.B-8r`0f:(.0fh$H3\iQ"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)bjL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp='6$6f_
1,(F?+>Gc82)@9I3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>t?.F_;gP0JPF-0fV3M1-.-J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN3\`Gu$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1,fOI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3ZpF*6$6f_
1,(F?+>GQ21,:mJ1C=Hr:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3ZpF*6$6f_1,(F?+>GQ21-%BL1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+?:Q1F_;gP0JPF-0ebXG1-.-F$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*
2'=S43]&iX0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0ea_9F_;gP0JPF-0KD0K1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Vm%6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqg0H`Z(B-8r`0f:(.0KLsC3]&T!$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GSn6$6f_1,(F?+>>c91cIHN3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`0f:(.
1cdHN3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>GVo6$6f_1,(F?+>G]61cRNN3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3A;Qu6?R!YA0=Wi
D.7's3Zp7%+@KX[ANCqg+B)ij+>PW*2'=V33\rTR0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0d'D+E$-ni0f:(.2EEZL3]&Z#$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.*L
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO
+>PW*2BX_23\`EO2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU0f1"I@<*JG0JPI.0etdD2``]L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&
6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#M$EZd+k0fC./1HI?M3]&W"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Jj+D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>PVn9jr&b
1,(F@+>GT31GLpG2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,'hF@<*JG0JPI.0ek^G2EEQQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh0Ha(uEZd+k0fC./0fh0H3\WK"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gE3BB#Q$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3ZpF*8muT[1,(FA
+>PZ41,CsG2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqo+A-'[+>PW*2]sk13\rHN0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU1,U1DARZc;0JPL/0f1pF0fh$F$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP1H5^K$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,U1DARZc;0JPL/0f1pK
0KLsI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp18
+@]pO+>PW*2]sh33]/cU2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1,U1DARZc;0JPL/0f;!G0KLsL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh53\i]V1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pes7V-$O1,(FA+>Gc81GCjE
0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,U1D
ARZc;0JPL/0fD'L1cdBN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqh2'>A"@N[E[0fL402``WK3]/l($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&W"$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh2]tS$@N[E[0fL410KM$J
3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh
2]tS$@N[E[0fL410KM'G3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P<t+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'K$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Po!7V-$O1,(FA+>PZ40f1pI
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp4$9jr&b1,(FA+>Gi:1H%9K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$9jr&b1,(FA+>Gi:1c7<L2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM
1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqg1*B;"EZd+k0fL401cdEL3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0eskG@<*JG0JPL/0f1pI2EETQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GVo9jr&b1,(FA+>G]6
1H7EP1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a
6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1E]D#EZd+k0fL411HI3D3\WQ$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f'qH@<*JG0JPL/
1,CsF2``fQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+>GYp9jr&b1,(FA+>P`60fD'M1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsH2**KQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp.5+AH9b+>PW*2]sk33\rcW2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f'qH@<*JG0JPL/1,CsJ1HI6H$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6
+AH9b+>PW*2]sk13\`?M0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.6+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2**QR$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp.6+AH9b+>PW*2]sk13\iWT
0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU0f1"I@<*JG0JPL/1,1gG1-.9N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0f1"I@<*JG0JPL/
1,1gH0KM$N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp.6+AH9b+>PW*2]sk13]/WQ0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0G$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b
+>PW*2]sk13]/iW1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp15+<X'\FCdKU0f1"I@<*JG0JPL/1,:mE1-.-E$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp.7+AH9b+>PW*2]sk13\iEN0ej"B
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU
0eskG@<itN0JPL/1,1gH2**KP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,U0s6t(1K3Zp.4+AH9i+>PW*2]sk23\`HP1GK4D$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0f:(J@<itN0JPL/0fM-N
3'&`N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u
6t(1K3Zp.8+AH9i+>PW*2]sh73\rQQ1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.8+AH9i+>PW*
2]sh73]&fW1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU1E];4DBL\g0fL401-.6M3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>Po!8p,"o1,(FA+>PW30f1pJ1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqh3?V73
E$-ni0fL410KLmB3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!1E[f.@<?'A+>k96@;[2C0JPO00fV3L0KM'F$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp19+A-'[+>PW*3$9t33]&WR1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh
2BYV#DBL\g0fU:21-.9J3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU1,^7I@;[2C0JPO01,CsF1HIBK$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp1:+A-'[+>PW*3$9q23]&fW0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh1a#8!@N[E[0fU:10KLmE3\`W%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1E]D#EZd+k0fU:03BB#S
3]/o)$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0f:(J@<*JG0JPO00fV3K2**QS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+?(E/E,m'V0JPO00ebXG2``fQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+?(E/E,m'V0JPO00ek^C
2**KP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp@(6#^ie1,(FB+>GT30ebXE2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0KBII$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2]tD*EZd+k0fU:1
0fh$H3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+?(E/E,m'V0JPO00ek^D2EEWP$;+)^<)6:`;aOJU9LMEC;cHOj=Y_j067sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#pj:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2)cX#6t(1K3Zp7%8p+qm1,(F?
+>>K10f(jG0F\?r$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+>l,$+@KX[ANCql+A-cm+>PW*2'=V.3\iNQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>l/%+@KX[ANCqg2'>M6C`kJe0f:(-3BB#T3]&i($49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=7+<X'\FCdKU0f:(GF_i0U
0JPF-0KD0O2EETP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=$0d%T,@<?'A+>G_r8p+qm1,(F?+>GQ20JkgH2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DQBt6t(1K3Zp.9+A-cm+>PW*2'=V-3]/lX0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u"u+@KX[ANCqg2]t_8
C`kJe0f:(.1-.3N3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp=;+<X'\FCdKU0fL4IF_i0U0JPF-0etdH0fh'K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2'=#0@<?'A+>Get8p+qm1,(F?+>G]61,M$K1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2Du[#6t(1K3Zp.9
+A-cm+>PW*2'=V43\W9L0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>u/$+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iGt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=?+<X'\FCdKU1,0nDF_i0U0JPF-0ek^D1HI<H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3?TG4@<?'A
+>P_q8p+qm1,(F?+>GQ22)@9L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2_Z?s6t(1K3Zp16+A-cm+>PW*2'=V.3\iEN1cPgL$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)"t+@KX[ANCqh1E];4C`kJe0f:(.0fh'G
3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@:+<X'\
FCdKU1,L+GF_i0U0JPF-0f;!J3'&lV$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=%1E[f.@<?'A+>Pbr8p+qm1,(F?+>G`71b^sH3!p!":-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`)X"6t(1K3Zp17+A-cm+>PW*2'=V2
3]&iX2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)/#
+@KX[ANCqh3$:h9C`kJe0f:(.2**QR3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp@>+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$G$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2]s52@<?'A+>Pr"8p+qm1,(F?
+>GQ20JY[E2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2`Mp&6t(1K3Zp1<+A-cm+>PW*2'=V-3]/lX1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp4$6$6f_1,(F?+>>c91G_'J3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-
0KD0K2``WM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=!
+<X'\FCdKU1E\u+B-8r`0f:(.0KLsI3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqi+@1-_+>PW*2'=V.3\`WU1GoLH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp4$6$6f_1,(F?+>GT3
1GV!F1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>Y-+F_;gP0JPF-0ek^G2**HJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1E\u+B-8r`0f:(.2**EJ3]/`$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi+@1-_+>PW*2'=V33]&TQ
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp7%6$6f_1,(F?+>>f:0JtmK1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp:&6$6f_1,(F?+>Gc81H@KN
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K
3Zp='6$6f_1,(F?+>>f:0K(sH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0f'pp6t(1K3Zp='6$6f_1,(F?+>GQ21c[TO1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I
2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp='6$6f_1,(F?+>GT31,M$L3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0fC-s6t(1K3Zp='6$6f_1,(F?+>Gc82)@9J0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp='6$6f_1,(F?+>Gi:1GV!G
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K
3Zp@(6$6f_1,(F?+>>c91,CsG2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp@(6$6f_1,(F?+>PZ41c%0J3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3ZpF*6$6f_1,(F?+>GQ21,:mJ
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3ZpF*6$6f_1,(F?+>GQ22)73I1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0K;*M3BAlN$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg0H`Z(B-8r`0f:(-3BAlN3\rT"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Vm%6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
0H`Z(B-8r`0f:(.0KLsC3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp.3+@1-_+>PW*2'=S43]&cV1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo6$6f_1,(F?+>G]61c7<J2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0esk;
F_;gP0JPF-0f1pJ3'&fK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3A;Qu6?R!YA0=Wi
D.7's3Zp7%+@KX[ANCqg+B)ij+>PW*2'=V33\rTR0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>G!;AT/bI0JPF-0fD'L0fh-K$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqk+AZKh+>PW*
2'=V13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>GPm7V-$O1,(F@+>G]60f(jJ2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmM+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(F@+>GZ51cIHL2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>PVn9jr&b1,(F@
+>GT31GLpG3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>PVn9jr&b1,(F@+>GT31c@BM0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmM+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>PVn9jr&b1,(F@+>GT32).-G3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU3?Uq&DBL\g0fL41
0fh'D3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^
6t(1K3ZpF*8muT[1,(FA+>PZ41,CsG2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU3?Uq&DBL\g0fL410fh*E3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp18+@]pO+>PW*2]sh33\W9L
0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pes7V-$O1,(FA+>G]61bh$K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU1,U1DARZc;0JPL/0f1pK0KM!I$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2'>A"@N[E[0fL402EEWJ3\iQ"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp18
+@]pO+>PW*2]sh53]&ZS1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>Pes7V-$O1,(FA+>Gf90JbaI3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+@]pO+>PW*2]sk03]&WR1c5UI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh
2]tS$@N[E[0fL410KM$J3]/c%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!Y
A0=WiD.7's3Zp.4+<X'\FCdKU1,g=FARZc;0JPL/1,(aH0fh*L$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh3$:\%@N[E[0fL41
0fh$C3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>Po!7V-$O1,(FA+>PZ40f1pI1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+AH9b+>PW*2]sh73\rZT0f04E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU1E]D#EZd+k0fL403'&lR3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GVo9jr&b1,(FA+>G]61,(aE1("?q:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*B;"
EZd+k0fL401cdEL3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>GVo9jr&b1,(FA+>G]61H%9L3!p!":-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*B;"EZd+k0fL40
1cdEP3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>GVo9jr&b1,(FA+>G]61c%0K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1E]D#EZd+k0fL411HI3D3\`;q
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>GYp9jr&b1,(FA+>P`60K2$M1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg1E]D#EZd+k0fL411HI6K3]/]#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GYp
9jr&b1,(FA+>P`61,1gH3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0f'qH@<*JG0JPL/1,CsH2**NI$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1E]D#EZd+k
0fL411HI<P3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS0esjo6t(1K3Zp.5+AH9b+>PW*2]sk33]&WR0f04E$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>G\q9jr&b1,(FA+>PZ4
0ek^C2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp.6+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqg1a#M$EZd+k0fL410fh'K3\`As
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s
6t(1K3Zp.6+AH9b+>PW*2]sk13\rNP2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>G\q9jr&b1,(FA+>PZ41H.?O3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU
0f1"I@<*JG0JPL/1,1gH0KM$N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqg1a#M$EZd+k0fL410fh0I3\iJu$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp.6+AH9b
+>PW*2]sk13]/iW1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u0d%T,@<?'A+>G\q9jr&b1,(FA+>P]50JY[D1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0f:(J@<*JG0JPL/
1,1gF0fh$E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P_q+@KX[ANCqg1*B;"Gp"jr0fL410fh-K3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp.4+AH9i+>PW*2]sk23\`HP
1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
2'=#0@<?'A+>G_r9jr;i1,(FA+>Gf92)mWN2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0fC.K@<itN0JPL/0fV3M1HI<M$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqg2BY_&Gp"jr0fL403'&lR3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.8+AH9i+>PW*2]sh73]&fW1c,OH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Y-4
F`&<W0JPL/0etdH2EEWS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh3$:h9DBL\g0fL410KLpF3]&Z#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp1<+B)ij+>PW*
2]sk03\W9L1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!1*@]-@<?'A+>k96@;[2C0JPO00fV3L0KM'G$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp19+A-'[+>PW*3$9t33]&WR
1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU1,^7I@;[2C0JPO01,:mJ1-.3I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp19+A-'[+>PW*3$9t43\W?N2)>RH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU
1,g=J@;[2C0JPO00etdG3BAiN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1:+A-'[+>PW*3$9q23]&fW0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,L+CARZc;
0JPO00ebXB1cdBG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>t>b6t(1K3Zp4$9jr&b1,(FB+>>f:2)REK0FA-o:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2'>V%EZd+k0fU:13'&cO
3]/Su$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+?(E/E,m'V0JPO00ebXG2``fR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp@(6#^ie1,(FB+>GT30JtmH3!p!":-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU
2]tD*EZd+k0fU:10fh$C3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp@(6#^ie1,(FB+>GT30etdE0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2]tD*EZd+k
0fU:10fh$H3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&
:3CD_ATBgS0f'pp6t(1K3Zp@(6#^ie1,(FB+>GT30fD'K2@<5hF(KB8ARn5MEc5u>1,Vfn/h0Y+
F(KB8ARn5MEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R=O$;No?4?Y)I.3N,@@<6*C
+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuHDe(M92)$j9%15is/g)o0+AH9b+>PW)2'=V0
3]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43
+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUh
BIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4
D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is
/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA+
+=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V
0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-
EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!
D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@ltEbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9
F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(RnATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0
EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL
%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#
_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L
.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)
F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4
F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6
@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is
/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"
H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'l
AL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaE
A12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIAF^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZ
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@q
ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2
F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4K
Dfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr
_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?
4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\
De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNXATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'
ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1
@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2B
Ec5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<r
F:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH
+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr
-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%
+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX
67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-
BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[p
DJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+
Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u
1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQ
PcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+
6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:
Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL
+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;
ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^
+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$(
$K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$h
AKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbX
JDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;
0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL
+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\
ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>
$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-N
DJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0jDJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?
ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r
@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-
3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6
ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X
6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0
E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_
$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%
Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*
Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQtDKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cp
F<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh
1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n
@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8S.3N5:GWHsaBm=3"+DG_(Bl[cp
F<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB81*B;"Gp"jr0fL401HI?K3]/i*$4R>;67sBl
DIb>;Ah@q1F(KB8ARmB(EcQ)=Et&IcF_PZ&C2[WnBleB:Bju4,Bl@lE0ht%f.UmO7Ch.:!A7TCq
FE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A.8kT$=e!aF`MM6DKI!K@UX=h
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
De(4C$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FRBPDO0DfU,<
De(U^%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO,9nEU0J5@<3B8l</KeS8Fq"d$+:SZ#.NhZ4E,]`9F<G16EZdss2D-[<+D#G$ARmD&
$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8
Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1
%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeD
Bm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)
+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn
+CT.rCjC)9F!,R5B-:S1?90Mu?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTG
ATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1
+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(U
ATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=LPW.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC
+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j
6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*
BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^
+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P
0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqB
ARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(
AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!
A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;
Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j
01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4
ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0
.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjKDe(J>A7cs,E+EC!ARmD&$4R=e,9n<b
/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b.Ni,1FC65"A867.FCeu*FDi:C
F`;;<Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt+<VeFE+Np.+DG^9?u]pqA7]-k
ARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl$6UH6FDi:CF`;;<Ec`FGBPDN1
An>CmF`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i%144#+<VdL+<Y6++=DAOEb'&r
D.P(($6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%$6Uf@?uKR`+ED%%A867.
FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065Bl[cm%144#+<YN0Gp%!C
F<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT?1+<VdL+<VdL:-pQU
8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6+<VdL+AP6U+ED%5F_Pl-
+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE+E(d5-RT?1+<VdL+<VdL
Eb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL+>,9!/e&-s$6pc?+>>E.
/ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IGBl.g*ASl!r
FCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NiV?G9D!=F*&OG@rc:&FE8R5A7T7^
+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"
FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-
D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;
+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t
/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$
F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)
?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.
EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psIn
Df-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE
+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<
%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-
%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%
BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=
.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;u
A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.
Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*
@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk
+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(q
E$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\
Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2
BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__
ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%
0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk
?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1
@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2
?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ
+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu
+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2
@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL
+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!
?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN
-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBn
F!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+
-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6
@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL
+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf
78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS
=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3
AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM
@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6
Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5
DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$
@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08
/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-
FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#
+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh
%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9
-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums
+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7
?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;
+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4Ysl
Eaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%
F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("
@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#
+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&
$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;
E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL
+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4
+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&
FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$
AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqR
Eb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)
Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8s
G[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0
Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO
,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A
@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1
BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p
9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3
F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9
DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*
FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1H
F*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%
?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA
<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<
Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43
Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(
+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*
%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;
Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N
.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]G
F(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1
E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL
+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts()
,@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs
/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9
F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:
@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1
+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2
AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%
0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5
%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6
D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2
%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0
F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$
A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+
BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk
>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f
+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*Qs
F'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.
A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl
+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#
+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth
+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-
DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#
+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eur
F<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(
Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(n
DJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP
8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)
+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z
=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqB
B6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*E
Df021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m
+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth
+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+
D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$
7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&
FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8
F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%
@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.
CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-
FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^
73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1
Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@lt
Ci"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?
+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9
;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#
ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]A
Be=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>
F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&
Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(t
FE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+
D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co
@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:
>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RG
ATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%
+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"
@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*
FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@n
Cige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKt
A9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680
H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=
@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<fl
Ch5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3
F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-
F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J
+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%
EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-
FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsg
E\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?
Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@F
BOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L
+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#
.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<
2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et
/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6
+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>
A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<
+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.
+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+
Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$
A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(
ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[
DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq
+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=)
,9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+
?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:
@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd
/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#
F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"C
BPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n
+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u
+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE
+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%
Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%
@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-
+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*
$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>
De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-
+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>
Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)
+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V
%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;
%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%
@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8
ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+
ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7
A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)
A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#
+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#
EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_
9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgr
DJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7k
DKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-
F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-
FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt
+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.
Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu
+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.
Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OG
Bl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s
$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od
@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%
+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j7
8l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<
0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?
@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!
$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku
$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'
+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@e
DIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*
BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%q
Bl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#
@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(
AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht
@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6
+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..C
Bl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?cs
F<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<fl
C`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNE
Eb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4
D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5
BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA
%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-
FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX
6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2
@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:
ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,
+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6
%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO
+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3
ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3
Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4
AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU
0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,
+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q
@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=)
,9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj
$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pG
ARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:
ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U
0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7
De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6
De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq
$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb
+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)
E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNE
CghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31
+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK
%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2
EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8
A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6
%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RK
Bln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1
+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:
F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL
+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@H"q8.A8bs52eQ]>ATD3q
05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$4R=e,9n<b/ibOE3AM^/+Co&,%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,
0JPHp$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u
+<VeJF`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O
2]s[p9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<
F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#
%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF
3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<
G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(
BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!
Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(n
DJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,
FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO
+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'P
BHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5
/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,
ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,
FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3
F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5S
A8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E.
/iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs
@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiu
ASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-
FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@
?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/
A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKh
Ddm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&L
A8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))
-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F
+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUg
F_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq
8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg
$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&
+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4
D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5
?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nn
DBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:
DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>
Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($
$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!
A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5
$6TcbC2[WlATMrK2,$;&<(U%_76N[S-V@0&+=K#p+@9X\F<FD#@:OCn@qB^/%15cp6:"UN85E,H
3Zp+!3Zp*c$;,5MDBM=u+@9LPATAn&$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\
4ZX]56=k4[+E2@0@ruEpATJu+DfQsm:IH<W+ED%:Bldir+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi
$;<`P7ScBO;a!/a0b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38T&WjDe+!#FD5Z2%16$PAor6*Eb-A8Df9H5
+CT;%+Dbb-AKYf-@:Wq[+D5h7F#kF_Dg,c5Ap%o4G@b3%Df0V=AoD]4F)591Bl7Q+H#IhG+Cf>#
Bl7Q+A7]UrDK?q0F`\a7CiaM;A79@gATD^3F!,[?ASrW5F(Jl)Bl.g0DfB9.Cj@WU+@opaAKZ8:
FWb7=ATAo7BQ%u8H#IhGF(K0"+DG^9FD,5.AoDU059M(?+DYk5G9BI)D'3\0F)u&5B-:V*An?0/
FDk`3+CT.u+A!\bATT&?Dfm12Eb-A%F!,[<Cht^H%13OO<+oue+DbIq+E)CECh[cuF!+m6DKTf*
ATAo3Afr:,ATMr9E,oAsFD55rF!;`FEZf";Bk1dkBl7L'+D,P4+E_a>DJ((a:IHfX+A!r(AKYf#
@<-6sA0>u-AKYYpEb$;:@<jpWBkAK5Dfm1E@;BEsD0[74A9MZsAKZ)5+D>=pEc`FLDfm1>BkM+$
+C\n)F)YQ.ARlqn$7QDkEb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+U,m
+D,P4+A,Et+E_a:EZen(Anc-oA0>K&Ch.*tEt&IX5uLHL:.I>f<(KSZ+A>'f+AtX*<Cp(W;]n@K
:/t"T78b7(7Nb]078b6r77KjD7787j:IH<p:J=/F;H#1W$4R>ABPDN1CggcqEb065Bl[d++CQC1
F_tT!EZf:4+A,Et+D,P.A7]e&+EVNEEcl7P+B3#c+Dtb8F<GXHAT/c6ATMs7+D,P4+EV:.+D#e3
F*(u2@q?d$Afu2/ATME*AoDKrATDiE%13OO8S0(n<+U,m8l%iCBl[cpFDl26ATK:CCh[s4F!+n/
Gp%6IA7]@eDIm?$8l%htA8-'q@ruX0Bk;?.@rH6sBkMR/AKZ).ATME*A8-'q@ruX0Bk;?.@V'.i
Eb-A6F`))2DJ()6BPDN1Cggd*+A$HlFE2M6FD5Z2F!,C=+D>\;+EVNEA8`T4BPDN1@ps6t@V$Zo
Dfor.+DG^9-u*[2/oY?5.4u`7DKBo.Cht59BOr;7C2[WnDe!p,ASuT=+CSekDf-\>D]i\(F<DuH
De(J>A7d8C%14Nn$<1SXF@o=s6tp[Q@ruX0Bk;?mBkhQs?TgG++?CW!%13OO:-pQ_<+U,m8l%iC
Bl[cpFDl26ATJu;/M/)eATMr9F`V,7+Cf>-Anbn#Eb/c(8l%htA8-'q@ruX0Bk;?<%15is/e&._
67sB[BPDN1+Eh=:@NZe'BOt[hF!)TIBOQ!*+ED%5F_Pl-A0<!e:IH<JCggcqA8-'q@ruX0Bk;?.
+CT;%%15is/g+\9Anc-oA1euK6tKtEDIm?&+CoD%F!,@=F<GF3@;[30BOr;/A8-'q@ruX0Bk;?.
+D#e3F*&OCDJXS-$;No?+EV:*F<DuHE+*j%.3N2HE+*WpF!,RC+EMI<ATVU"DJ()1FD,6++EV:*
DBNY8F!,")AmoguF=n"0:-pQB$;No?+Dl%7@:VDA+Cf4^F(ZUY/g+,)F*(#M6pta0ARfh#EbT*+
+E_fuB5VX.AIStU$;No?+EqL1DBN@1Eb0&qFD5o0+Co2,ARfh#Ed8d<De3u4DJsV>AU%p1F<DuH
E+*j%.3N23BQ%I'+DGq=+CT;'F_t]-F:ARlDe+!$Bl\8;4Y@j)IO?Hn-8%J)4$"`]:IH<t:IITN
9i+b28l%iR:K::[73G2u6rZTR<$r+^C2[X*A7]@o+?_>"C2dU'BI5>q+DPh*F_#3,F!)T#67sB(
-n6Z//g+nJ@<?/l$>j3mCEPbm+DPh*F_#3,F!*UgC2[X*A7]@o%16f]/g)kkAM,*B@<63,A8a(0
$6UHT+=D#?F)u&5B-9fB6m-)[Ch.*tF!*%WA7]@eDIjr"AS,k$AKZ#9DJj0+B-9fB6m-;S@WNn>
4!8BKF))mC+DPh*F_#3,Et&IfCia/?%144#4s24]Cht4d:IH=;DerrqEcW@3Eb-A(AS,XoARm/2
4!89VA9DEoAoeCgASu$2%14Nn$4R>AATMrc:IITbEb/a&DfTQ'F!*.G$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMV]@N]/sARTJ!E"*.U5uLHL:.I>f6qKaF8P`)I;Fs;U+@B$q5u^9@+@93R:f9k\;BSk;:/`92
7NbAj66K5u8Q-a58PDf#6:E"b78--L7787i:*<M,73G>o=B$DA<(0V9%13OO=(l/_+EV:.+@9X\
F<FD#@:OCn@qB^(CggcqEcl8@+DGp?@rc-hFCfM9@3BH1D.7's+E(j7A8,OqBl@ltEbT*++DG^9
FD,5.."4ca6rQl];F<l%+Co2,ARfh#Ed98[<+ohcDIn'7+EMX9E$0@=Cht57ASl@/AKYE!Gp%$;
+EV:.F(HJ)Bk)7!Df0!(Bk;?<+<X6F+B_K?+@AFm73Fl_:K:@:<(KSZ+@JLp5p0**:J`0/:KK.X
$7QDk;Is]`G%F?U@R=XIF@9hQFD5Z2@<-'nF'iWrDe*3<3Zp4$3Zp*c$>F*)+A#%(8PUC=D_;J+
+<Y`=ASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<l#.4chj-OgD*+EMC<F`_SFF<Dr)
@:C@$ASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(.!KBC.3N/8@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!
BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4DBMY^@j#2tA0=Q[DKU1HE+*j%Et&I!
+EM4-Cht4AEbupNEb6FA/8B-4FD)dEIS*C(;bpCk6U`@3$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*
Ed8d:ATMr9E,oAsFD55rF!)lJ@:Ls,Bl8'<.3N/8@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.
D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+F`S[IASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(
A8,OqBl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;Is]`G%Dd_
ATMr9:i]uSFD55rF!,:-@N]2q@ruF'DIIR"ATKI5$7QDkEb065Bl[c--YI".ATD3q05>E9-OgCl
$;No?+E_RBAS5^uFCfJ8A8,OqBl@ltEbT*++>"^-7nuiX73G#s;GU1h%14d30H_V`1E^^LB4N>Q
+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQUA7]RgFCcS*Bk)7!Df0!(Gp$^5Ch7Ys
$;tGPDg#\c@:DQ7F*'fa@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[i:IH=9De3u4DJsV>
@V'@oDJ()+DBO%7AKXSfFE1r(%14:O:IH<n:IS2):/=h36:FRD:.HEu:*<M,73G2F<)Q.R+q4kg
$;GdgAnc:,F<G"0A0>`-F*&O=D/aE6FCB'/+C]&,+E(j7@:XOq@q?csF!,O<D/a<:3XlE*$;O#j
78b7'792iT+AP@+78b7LFDl22+F.mJEZdtM6m-#S@ruF'DIIR"ATJu.DBMOoBl8!6@;Ka&A8-'q
@ruX0Bk;?/%13OO8K`4qF_kS2@;L"'+CTG3Bk/>pDL!@#;]opcDII0hA0>DsEb/a&DfTQ'F!,:5
CLnUt$7B(TEc5T!D'2;^Ch7Zm-S>i8%15ICART[l+CQBb:IH=B@<6O%EZen,@ruF'DIIR2+Co2,
ARfh#Ed8dJDf9_?FD,*)+DGm>@rH4'Ch7^"Cj@.;DId<tASu$iDKI">Afs\u+<X6t-Z^D=CiaM;
@3B3$De'u)A7]0lFDi:4AS,XoAKYD(F*1r&Bl[cpFDl2F+EMXFF^oN9Eb-A8BOQ!*D/"$2DfTnA
8ge[&G%G]8Bl@m1/g)9/:IH=8Eb/[$ATJu'Bl7@"Gp$j6Bl%@%/g)99BOu6r+D,>(ATJu&Eb-A*
@;0auGp%0M@:F%a+C]J8+C]&&@<-'nF!+t$DBNG&@;]^h+EqL1DBMOo@q]:gB4Z-:%14Nn$;No?
+CfG'@<?''@3BDqF*(u6+A,Et+Co2,ARfh#Ed8dJDf9_?Dfp/CBk1ctDe:+a-Z^D@Bl[cpFDl26
ATKI5$;No?+B3#gF!+t5ART[pDf-\.AT23uA0>f.+CQC&Df00$B6A6+A0>DsEb/a&DfU+G."4ca
6rQl];F<l%/e&/*ATqZ--Xq%:ATMr@4"+i_@<?0*-[nZ`6rQl];F<l+@W6F#F*&cY4""KKF*&OD
Ea`I"Bk(^q+EV19F<G+.@ruF'DIIR2-OgCl$;No?+B3#gF!,1<+CT.1AU%X#E,9)./Kf1WAKYE!
DffZ(EZfC@Dfd+6DfQtGDfp(CA8,OqBl@ltEbT*+/e&-s$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39Q+?M+DbIq
+Co1rFD5Z2@<-W9Ao_g,+CoV3E$043EbTK7%16'Q+DGY.F`VYF@<?''CLqc6An>CmF`M&7+E(j7
8l%htG@_n7AS#Bp@3BH+DIm[(FEo!>Bk)7!Df0!(GqL4=BPDN1DIn'7+EMX9E$/t8@:XF%FD,5.
-t7.;ATMrB+Co1rFD5Z2@<-W9Ao_g,+CQC'F_u(?F(96)E-*45BleB:Bju4,ARlp-Bln#28l%i-
%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!CggcqA8,OqBl@ltEd98H$7QDk:-pQUDfB9*+Dtb7
+Co1rFD5Z2@<-W&$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1%15is/g+tK@:UKmEc5e;AU%X#E,9).
A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A8G[`F"_?<@UsUu
E%Yj>F!hD(%15is/g,1GB4YslEaa'$+CT)&+ED%*ATD@"@qB^(/Kf+JDg*=?@<6N5FD,]+AKYi$
F)tc&ATJ:f?S`gO/g)hjB5DKqF!a'nI4cX_AThu>-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36=FA>F`8I4
@:O(qE$/Uu@r$4+%14:G5sn:F:`r(j6VCEU+@8@]93"e4%13OO8TZ(hF!,:5FCfK$Ci"A>@3BW/
@;m?2D]in*CLnVs+C\bhCNXS=GA2/4+A,Et/g)98D]iLt@r$4++E(k6ASrY#$7QDk:-pQUDfB9*
+EV:.+C\o'F<GOC@:OCn@q?cnBk)7!Df0!(Gmt+!A0<7/E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU
@UWb^+DGp?F`7csE+*6lA0<7/E-,Z4F=.M)%15is/g,1GF*(q8Eb/a!G%G]8+EV:.+Dl%<F<G(9
EcP`/F<G%$@r$4+%17,eF*(q8-Xq%:ATMr@%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[s@;BEs@3BW$EbTK7
+CoV3E-)Nr,#gj$73Fl=;aXGS:fJQ*<D?:6%13OO-u`U)CLek:@UWb^F!,UE+C]&&@<-W9C1_0r
ATJu'F`\a?F=2,P@;L"'+CQC*Df9//Bk1d`+EVNE,%Ph5E$?EMDfp(CA8,OqBl@ltEbT*++CT=6
E,8rsDBO%4G]YP\+A,Et+Ceht+CoV3E$/S*C`mY8ASrW$Bk)7!Df0!(Bk;?.@<3Q"+EM77B5D-%
8g&1bEbTK7/g+)&EbTK7+CoV3E-!.1Eb-A8BOr<'Df^"CF*(i"Ch4`5@<iu;D]j+CDfTD38g%YY
@ruF'DIIR"ATKIH+B3#c+DPh*F)Q2A@q?ckA7TUr+Co2-FE2))F`_29+CT)&+A,Et+EMIDEarZ'
@rGmh+DG^9FD,B0+D,P4D(Z8).1HVZ67sBkF_u(?Df0B:+=L]<FCfN8.1HW&A0<7/E-,Z4F=/28
+>Y-YA0<6I%13OO:-pQU-uEC.ALSa3Eb/[$ATJu&+Co1rFD5Z2@<-W9A9Da.+DG^9FD,5.A9Da.
+EM[7A8-'q@ruX0Gmt*iE-,Z4FC]N2E'66)F(fK9E+*g/?X[\fA7$Hr@;BEs-RT?1%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+B*2qAKZ,:ATJu4AftW,D/^V=@rc:&FE7lu8l%htA9Da.+EM%5BlJ08+Ceht+C\n)
F`V,)+EVNEEb0'*@:Uo3@rH=3+CT.u+Dk\1B4W2rBk)7!Df0!(Bk;?<%14Nn$;No?+ED%0Ddd0!
@W6F#F*%iuDe't<@W6F#F*&cP>9G^EDe't<-OgD:+Z_;"HTGVTFCfN8A9Da.%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-!k6Z6ph+CQC'Bk)7!Df0!(GqKO5.1HVZ67sBjDfBtTD.Ra#AKYH$FCfN8+Co1rFD5Z2
@<-W&$>sF!A0<7/E+<g*Gpb[gE+*j%+=DV1:IJ,W<Dl1Q04Jm1DfBtL%17#a+=CW;@rH=3-QlV9
1E^UH+=ANG$8<Va0Hb^'@W6F#F*(r8D/]pk%15is/g+Y?ARTU%E+*j%%16WbF(KG9-UUQr5uLNF
<(JAG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^CLnVs+DkP.FCfJ8Eb-hCAS5^uFCfJ8F(96)E-)Nr,#(?r
73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<$DbY%15^'6m-DcCj@.EAS#p*FD,5.A8,OqBl@lt
EbT*++ED%+BleB-Eb/c(Bl5&8BOr<$D..L-ATBD;C1\T#Bl%?'F)N1<@;0V$@;0UnDJ()#+Dbb5
F<GL6+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++DGm>@3B3$De'u)A7]1%+<X9P6m,uJDBNS'DImis
FCcS'+ED$FEb/ltF*(u6+EM%5BlJ/:FD,*)+F.mJ+Ceht+D#(tF=n[Y%13OO7qHRLEaa'$+CQC5
AM%q6B5)F/ATAo7@rc:&F<G"0A0>i6F<G:>+DG^9H#IhG+DkP$DBMPI6m-#S@ruF'DIIR2+Co2,
ARfh#Ed8dJDf9_M%14Nn$;No?+D58'ATD4$AKZ#)/TPE8BleB-EZfF5EbTK7%17,eEb/lH3ZrKW
Dg-//F)t\sC2[Wi+?Op2+>k9[A0<6I%13OO:-pQUF('6'+DGp?Bl5&8BOr<'@<6O%EZfC@DfcEq
Eb09&B-;D=Blmon@;9^k?Qa*&@<?0*-[nZ`6rQl];F<l+C2[X'AS5^uFCfJFBkh]:%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[rATT&2Bju*kEd8d<Bk)7!Df0!(Gp%3I+ED%%A8c@%Gmt*);ajY.9M%QK5uLi.
6qKaF8P`)I;Fs;U+B2,Z;FNl>:JOSd+q4kg$;YVPDBMPI6m-#S@ruF'DIIR"ATJu)AS,XoAKYD(
F(Jd#@q[!(@<?08+<XWsAKYT!EcZ=FA8,OqBl@ltEd8dGDBO%7AKYr#FD)e2F!,R<AKYo/Cj@.6
Bk)7!Df0!(Gp%3B@<<W%@;[2sAKYJr@;]^hA1euI8TZ(hF!+t$Ci!Zn+EV:.+<kcIF<Vi<Bk)7!
Df0!(GqL3^7<W6[+EV:8F_>A1DJsE3F`\a:Bk)7!Df0!(Bk;?.@ps7mDfd+2AKYJr@;]^hA0>?,
+A,Et+DGpFF!+m6B5_^!+DG@t@3BZ1+EM+9+EV:.D'2_F5t"LD9N`KIARf.kF(IBA$4R>?76s=;
:/"e5A8,OqBl@ltEbT*++Ceht+C\n)@:NeYF)to'+C]U=@;^?5DKTf*ATAo3Afs]A6m-S[F),hL
+AtWo6s!8X<(.p?Bk)7!Df0!(Bk;?.@ps6tDf0B:+C\n)@:NeYF)to'+C]U=Df0,/FCB6+/g)8G
$4R>8AS#gpDJ().Bju*kEbT*++AtWo6r-QO=Wh[(AThX&FE8R5@q04`ASuTuC`m\>F=2,P@<3Q:
Dfm1@E+No0@;]Tu@r-()AKYMt@ruF'DIIR"ATKI5$7QDk:-pQUD..3k+C];3ATMr9;FNl>:JOSd
%17#a+=CW;FCfN8-QlV91E^UH+=ANG$=n*sATT%B;FNl>:JOSd-OgCl$;No?+C];"DfBtEBlbD7
Dg*=GBOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Xq%)DfBtE@W6F#F*&cP>9G^EDe't<-OgCl$;No?
+D,>.F*&O;Ec6)>06;8MFCcS9ATVu9E+*j%%16`gE$-N:B6%p5E$m^i4$"a"@<?'jBOt[h+F.O,
Eb&U#ATJu9De*:%+EM[CEbTT+F(KGI-OgCl$;No?+Du+>AKYMt@ruF'DIIR2+E1b2BFP;ZBk2Z8
0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l394_[R+ED%*ATD@"@qB^(F`:l"FCetl$6i,378P+)77K^D78?3=
;]o(:6pXd@6m<'I%15^'6m-PmDfTE1+EqaEA0>o(An?!oDI[7!/g)97AS,LoASu!hF!,%3@:F%a
+DkP)Gp%6NAS-($+E)41Eaa'(Df0VK+Auc_ATD@"@qB^(@;KauG9A;HATVs;.3N_N+Dbt)A0?)7
Eb'56FD,*)+CehrC`mY<BOu3,GAhM4F!,17+Dtb7+Cf>-FCf]=F"Rn/.1HVZ67sC!DJXS@E-67F
A8,OqBl@ltEd8dJAS,LoASu!hF!,@3ARlp+E+EC!Bl7Q+/Kf+JDg*=?@<6N5AncF"+Dk\2F(&]m
Et&I`2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36uQRXD.RU,+Co1r
FD5Z2@<-W9DdmHm@ruc$$6hl66WHiL:/i?(8OHHK:JO2R=WgL,8ju*H;^)YX%15LA@s)X"DKK</
Bl@l3BlbD*+Dbt6B-;8;@;]UiDJ()5DfTD3E,TH.F<G16EZf=ADeF*!D/Ej)F"SRX9lG)p+E(j7
FD,6&+D>2*AKY]//g+)2D.Oi"Cgh$p+DGpFF!,UCDIm<hF)tc1Gp$O5A0>H,ASrW$BleB:@:OCn
DJ(RE+A[)mATDi7E-67FBl5&,@;KNu@UX%`A0>GqAoD^3F"SS,DBNeA+E)45DJ=$,+EV:2F!)Z@
F)E@I+D#_-DBO.DDf022+s8!uDf9//A8bt#D.RU,@<?4%DBNM,AThL(ATJu(De*E3+A$Gn95\lo
BI@jDDfBE.Bl@l3BlkJ=AT2'u@<?(%+<kW9FCfK$FCcS6Ec5T2@;TjqDJ(.9Ao_g,+EV:.+CT).
ATDZsFD5o0+>"][Bl%U"FCfK$FCcS6Ec5T2@;TjqDJ(RG+<Vd9$4R>7:IH=EEc6,8A7]g)@3BH1
D.7's+E(j7ARTY*+Eq7>F!,RC+CoD#F_t]-F<G(3A7[A9=`8F*@ps6tASuU$EZed5F(oN)Ch4`1
ASuU$DI[6#DfQt/+DbJ,B4W2rBle?,Ecb`3Bl@lA+<X5uGAhV?A0>o(@rH4$ASu$$FD,5.AoD^,
ATBCG+B)i_+A,Et+CoD#F_t]-FCB9*Df-\0DfQt;DfTD3A8bt#D.RU,@<?4%DBNk:FD5Z2F"Rn/
.1HVZ67sBmDfQt<ATo8@DfTB0+EVXL+CQC6Bl7R"AKYf'DIjr/AftW&@s)X"DKK</Bl@lA%16NU
FCfK/@<6O3FE0N*>p+PJINTk#>9GF=0d\;_3drMC-sIf_/g+FK%17&sF<Dr>AoqU)CghC,F*)FM
%13OO:-pQUBl8!'Ec`FFASuU$DI[5e$8<S^+E2IF+=CT0FCfK/@<6O3FE/`j-ZWd?@;0V#+EMXF
Bl7Q+.![6a@:jUmEZf1,F*&OC@q0Y%Eb0,uAKYo'+=MI`-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^
+E_a:F!,"3@s)X"DKK</Bl@l3Bl5&2ATo8,Df0Z.G]\!Z%14Nn$;No?+D,P4+EV%%BlnD=FD,5.
A8bspASuT4F(K62ASu!h+DGm>An?'oBOt]`$=mjlE$-N:AoqU)CghC,F*)FM%13OO:-pQU@WH0o
Ao)`8A7]glEbSuo+EM[CD/X?1+D5_5F`8HG/Kf.KAKYr#H"(2lCER5-EZeq2FCfK,DJ()6BQ%s'
+EM+3FCf?"ATJ:fBP_X*C`n-Y+D5_6+=D5QDJa<1DC5l#%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15C=+D#e+
D/a<&+E(j7Ci=3(+CoD#F_t]-FCB9*Df.0:$7QDk:-pQUCi=3(+CoD#F_t]-F:AR2+?:QTBle59
-ZaEJEbTT+F(KGI-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tKtEDIjr9Dfp(CDg-(A8l%htF(fK4FCTH8
Et&I#6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb;^)YX%15^'6m-\lEb'56@ps6t@V$[)F(Jl)
GA2/4Bl5&%Eaia)Eaa!6+A*bqEc5T2@;U'<+<X6f+F.mJ+CoD.-ZgJCBl7H(@3A0<6m-GhBl.R+
Bm+&1FD,*)+Dk\$FE8RMDfp(CDImBiF!,"3+CQC/BlnH5AKYr4DeF*!D/F!)B.aW#%16'JATD?)
@<,p%D..=-+D#e+D/a<&F!,C5+A,Et+E2@>B6%EtD/!m#+DG^98l%i&F!,OBF`Lu'+Cf>#AM,)s
DKBo.Cht59BOr<$De*p-F`Lu'+CSekDf-\>D]i\(F<F1O6m-PhF`Lu'+Cf>#AM+E!.1HVZ67sBl
G[YH.Ch7Z1De:,7F(oN)+A,Et+EqaEA9/l8D]iS%Anc-o+Dtb7+D,%lBl%L*Bk;>p$4R>;67sBk
ATM@%BjtWr@3A0<6m-,_Dfp".$>='ZBkhQs?TgFm><3m?CiF9.+BplLI4cXTEc;Hp%15is/g,1G
/TPE7ATD@"@q?d%F`\a:Bk)7!Df0!(Gp%0ADg*=4DL!@9EcQ)=Et&IsATD?o?YO7nA7%J\+>Y-$
+=ART/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[DETV#/okNHD^Qn[-QlV9Gpa%.%15is/g,4K
Dg*=JDfTB0+ED%*ATD@"@qB0n@X0)?DfTB0+DG^9@3B3'Dfp"AFD,*)+CT;%+Du+>+DG^9FD,5.
B6%p5E"*.hDe*KfBkhQs?TgFm-XgY.Dfp"H%16ut?YO7nA7%J\+>Y-$+=ARGCi"-'Aof(;I4cXT
DCH\[/g+eE4Y@jiEc<.9De*K.%13OO:-pQUD/"'4Bl7Q+Ao_g,+=LZ2Ec6)>.1HW%GT\@]%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[bF`VYCD/"<-+A,Et+D#(tF<G1(@qfanFD5<-%14:H<Dujm9hAMW+A,Et
+@S[i<$4Xr6V0sC<(TMW+q4kg$<1\M+DkP$DBMPI6m-&OBlkJADfTB0+=M,O.3N&:A0<:3A18X2
@;[2sAKYK*F*)>;BmO?$+C]U=A7]@eDJ=!$+CQB\:IA,V78?fL:JFPL:.-4G@rc:&F=n"0.1HVZ
67sBkAS,XoAKYN%@s)X"DKI"2Df'?"DIal2@rc:&F<E.XH[\_=I3<6F+EqaEA0>buD.Oi/Cgggb
BQ%]tATA4e6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+>=p!+>=63F)>i<FDuAE+E2?D-[U;;IXNRQ
$7QDk%13OO:-pQU@rc-hFCcS'+Dtb7+EqaEA0<HHDfB9*F!,%)BlkJABl7I"G7=msG9A8BE-H5@
A1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15R=DIal3BOr;7@W6O0Eb$UAARoLs+EqO;A8cZ7@;]TuDJsW.
+D>\;+@K!m<D>nW<'sGU9gMNB+EV1>F<G7*F!+q'ASrW-De*QoBk:ft@;]TuBl8!'Ec`oV+BN5f
DBO%7AKZ&(EbTK7+EqO;A8cZ7BlbD<@<Q3m+EqOABHTZ?<(nlF+@K!m<D>nW<'sGU9gMNB+EDUB
F"Rn/%16!UDBNA*A0>AuDf]J4FD,5.-t7.>DfTA;+D#(tF<GdADId[0/e&.:%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-!k7:^+S+CQC:DfTA2Bl5&8BOr;sBk)7!Df0!(GqL3^8l%htBlbD*Cj0<5F!,%)Bln',
B-:]&E+rm)/g*r1BkM-t@;L!-@ps6tDf0B:+C\n)@q]:gB4YTrGA2/4+D#e:Ch[BnF<GOFF<GL@
ATD4$Bl@m1/e&.:%15is/g+tK@:UKkBk)7!Df0!(Gp%<LEb$;,DKKe>ARoLs+EqO;A8cZ$$>!`j
-ZaEJEbTT+F(KGI-OgCl$;No?+D,>*A0>u-AKWCBF`)56F(KE(F>,-dARoLs+EqO;A8cZ7@;]Tu
DJsV>6r-0M9gqfV6VgEN5u'fj%13OO:-pQU@r-()AKYPpBlkJABl7I"G7=lg$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l36tKtEDIjq_:IH=EEc5](@rri1@:O=rEt&I#6q'R::.69t:IH=%;GTnR6W>1&5snOG;^)YX
%160MASrW0Ec5T2@;TjqDJ()9Bln#28l%htH#IgJFEqh>@ps1iGp%$EASrW!+EM+9+E(j7A8,Oq
Bl@ltEbT*+/g*i+@:UL%Df'&.F*VhKASiQ2@rc:&FE8R5DIal#AS,XoAKZ&4D.Oi'@;]V$+Du+?
DK@EQ+B3#gF!+t$DBND"+CoD.AKY])+CQC3Ec5](@rri1@:O=r+EM%5BlJ/H%14Nn$;No?+Co%q
Bl7K)@3BN0De`inF<GF/@rcK1/KdV-F`V+:FD,5.E,oN%Bm:b>EbZ_/DfQtAF^o)-F(96)E--.1
$?1$#F*2A;Df9MV3Zp+!3Zp*c$4R>;67sC%FCB&t@<,m$C*7S-EbTK7Et&IsAT;j,Eb-@@A7]4m
B-;;)F)*-4$4R>;67sBsDe!3l+EM%5BlJ/:DJsZ8F!(o!C2[Wq?YO7nA7%J\+=D5QDJa<1DC5l#
C2[X(?YO7nA7%J\+=D5QDJa<1DKKH2FE8f=$4R>;67sC"F`]9]Eb/hl$:IZW<D>nW<'sGU9gMNB
?[?'%4ZX]5F)>i<FDuAE+E2?D-RX7i:4@U=-RT?1.1HUn$;No?+EMXCEb-A1@:O=r%14p7E-67F
-ZF*@F*2A;Df9M@4%`F=;Fs\a?X[\fA7%E;Eb]Z<DJa<1D@Hp^$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;YPL
AKYr4De`inF<GF/@rcL/+CT;%+Co%qBl7Km+DGpFF!,%&F*SmMD]iP.DJ!TqF`M%9H#IhG+A*bt
ATMp,Df-[L+E)41DBO%7AKZ#)EHPu9ARlooBk)7!Df0!(Bk;?.@;]TuEcl7BGA2/4+=M8I.3N_N
+EM+9F`8rB$7QDk:-pQUF(KH9E$0+?De`inF:ARtD'13FEb]Z<DJa<1DC6PL>9Iip+?MV3@W5gq
E-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[dA8--.H#IhG+DPh*E,ol/Bl%?5
Bkh\u$6ho,8Q6g8:K::8C2[X%Ec5Q(Ch555C3(R.$4R>DBOu'(8l%htCi<`mF!,R<AKZ&(EbTK7
+F[a0A8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]3BlbD.G\(B-FCeu8+B3#gF!,O6EbTK7
+Ceht+C\n)F`V,)+EVNEF(KG9F`8Hq:IH=IBOr<1@<iu@Dfm1H@;^0>+AQisAKYZ)G9D0LFWb1&
DBNM8ARfk)AKYr4De`inF<GF/@rcL/+EqL1DBMPI6m-;a@:XF%GA2/4+EM+3FCf?"ATJu1Bkq9@
%13OOEbupHE,o]7F`)&7Df-pF>9Iip+?MV3@W5gqE-WR8E-,Z4F=.M)%160&;GKeY7lhc6FDl22
+F.mJEZf=ADe<^"AKY])+E)./+E(j7H#IhG+Co1rFD5Z2@<-'nF"SRX<+oue+D,>(AKY].+ED%7
ATT&=BOu'(8jQ,nF`:l"FCfM9FD,5.8l%ht@:WneDCuA*.1HVZ67sBkBle60@<iu1De*g-De<^"
AM.\3Et&IfF<GU8@:W_RC2[Wi+DPk(FD*%N@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3
F!hD(%15is/g+Y?Df]J4FD,5.C2[X%Ec5Q(Ch555C3(MABl7I"G7=lg$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JM?+,#qQ1+A,Et+@npp:`r&!6m+ln6WHiL:/jMY
8P`)*%13OO8T&Tk@;Ka&FD,5.-td+/ATD3q05>E9A8bt#D.RU,.3N&0A8c?.FDi:EF(HId:IH=%
6q/;4ASc<<+:SZ,%15is/g+tK@psInDf-\9Afti,A1hh3AfrZJBl8!6@;Ka&@:WneDBL??ASu("
@;IT3De*Bs@s)X"DKI<MGA2/4+A+pn%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,
05tH6A8bs2C2[W8E+EQ.%13OO:-pQUDfB9*F!,49A1hh3Aftf"+CQC3A7cs)ART+\EZf(;+CTG%
Bl%3eCh4`-DBO4CF`JUGH#n(=D%-heDe*NmCiCLN%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rF_tu(Ed8d9
DIal%Bl7?q+ED%1@<-.)/e&.eBOr;uDes6.GA1r-+E2@0@ruEpATJu2@;BEs8l%htD/XH++E2@>
A9DC(Bm+&1@;]TuF`V,+F_j)J$4R>7:IH<n:IS2):/=h36:FRD:.HEu:*<M,73G2F<)Q.R%13OO
6:!t3<DXf)5sn:F:`r(j6VCEU%13OO<'a/G+@.,K6W-KP<$4S/9i)9+%15fq919sh+AG.#<(0\-
;FN0877TpJ<(0\-;aXGS:fIl2%16$&<$4k+6;g*I=Wg+(6W?WQ:-hcL78k=.:EWP(5t"LD9N_f3
%15`s78P+)77K^D78?3=;]o(:6pXd@6k'J4$:IZW<D>nW<$4S#6W?WQ:-hc\+AY<r771$Q%13OO
6q'R::.6:.:K::8:KL:68l%ht;b0\^<'sYb;[j'C$:@fl<)64[>"'Q+:IH<o6qL?#7R9C59M&2T
78jX&%15Kl7S-?D+A,Et+Abs38ju*H+AG-h;GU4#$4R>26qL?#=\i$q+DPh*E,ol/Bl%?5Bkh\u
$4R>B;ahg$:IH<r78-N#5u'fj6r-0M9gqfV5u^EO:(7O>$4R>ABOu6r+CT;%+DQ%?F<GXCD.Oi.
Afu2/AKXT@6m-Gh@:OCn@qB^(8K_\TG%De.Dfor.+E_a:Ap%oB+<Wsk+F.mJ+E_a:+A,Et+F.mJ
+EqO9C`m\;Ddm-aCj@.8Bl7H(H#IhG+E)IA+Dk\3BQ%F&/g)8G$4R>6AfuA;FWb:1DIakuDBN@1
F`V,+F_i1;ATVU(A0>i-ARTXk+DbV2+Dk[4CMn'7/g)9.+Ceht+C\n)Eb/ZhBOt]s@<=O>$4R>7
DeO#26=FY@EZbeu9jr'PBHT&a0fTUL@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk%16igA7Th"E&':E
5seOB<(o_D3ZoeB:IH<R1+=>EDfp)1AKX?YA7ZlOF_u(?;e'i^E--.K%15cp6:"UN85E,H3Zp+!
3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3ZoeL
BPDN1CggcqA7]UrDKBo?@<?(%+D>\;+EVNECi<`m+CoV3E$.bK6m-P\EbTK7F!*%WEb0E.F(Jl)
AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\4ZX]?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[hDKKo;
A9DC(Bl@ku$;+)^+EMIDEarZ'@rGmh+DGm>A8-+,EbT!*FCeu*Bl5&8BQ@Zq+A,Et+CoV3E$043
EbTK7F"SS'F_u(?F(96)E--.D@<,p%E,8rsDBM5D6V0il8g&1bEbTK7F!,R<@<<W%@;[2sAKYf-
@:Wq[+EqOABHTnpF!,OG@;]UaEb$;6@rc:&F<GOCDe!@"F(oN)+Eh=:@WO.2$4R>ABPDN1Cggcq
@<6L4D.Rc28l%ht@;]TuF*2G@DfTr6DJ()#A7TUrF!,.)G%De*AS#a%Bl8!6@;KakA1eus:IH=6
DIal2F`;;<Ecc#5B-:VnA8c@,+Ceht+C\n)Bl8!6@;KakA0?)1FD)e=BOr;Y+E1b!CLLje+DkP)
@:s.l/e&.:%15is/g,7S+E_a:+CQC'F_u(?F(96)E-*3p:IH=BF`VXI@V$Zj@ruF.AISueAT;j,
Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bDf00$B6A6++CQCAC2[X(Dfp)1AKYMt
Eb/a&DfU+4$<1pdEcl7B@3A0<6m-#_D/^V=@rc:&F<GX=D/a<:+E)41DBN@1DIn#7A8,OqBl@lt
Ed8d9DIal4F(HIB0HiJ2.4u_P$4R>3DfQtBBPDN1CggcqFD,5.F)Q2A@q?cnBk)7!Df0!(Bk;?.
@<,p%@rc-hFCeu*Bl5&8BOr;7IS*C(;bpCk6U`FHEb0&qFD5o0+Co2,ARfh#Ed98[+B`W*+EqO9
C`mV,ARlp*D]iP.DJ!TqF`M%9@3A/bAoDKrATAo8D]j";Bl8#8FDi:1DBN@tFEM#.+Co2,ARfh#
Ed98[8K^r2;GU%X9N`K9770jF9gqfF+E_a>DJ()#+Co2,ARfh#Ed8dLBOQ!*BlbD7Dfd+9DBO%7
AKXSfF*VhKASiQ3Eb/f*+B`W*+CoD.-ZgJT@;^00H#IhG+E2@4@qfk(F!,"-@ruF'DIIR2+Cno&
@:EYdATJu'ASH$p+EqO=ARlomGp$g=F*(i,Ch[d"+EV:.+Dtb8F<F0uG%G]8Bl@lA%13OO6=jbI
Eb-A4Ec5H!ARoLmB-:]&DJ!TqF`M%9@3?tI8l%iR:K::[74B?iBl[cpFDl2F/g*r-+A+UG0R+^4
;,eZZH#n(=D0$hABOr;RDf00$B6A6+01KkrA7]e&+Dk\-FWbUAASuQ3FD,5.A8-'q@ruX0Gp$^;
Ch.*t+Cf>-Anbn#Eaa'(Df-\0Bl%?5%14Nn$;No?+Cf>-Anbn#Eb-A%+FZpY6rQl];F<kqA8-'q
@ruX0Gp$R-AoD^$+E2@>@qB4^Bl7Q+FDi:DBOr<(AU&;>F*(u4/e&-s$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
;Is]`G%De8Eb0E.Dfp+DCggcqA8,OqBl@ltEbT*+/e&.h5uLHL:.I>f<(KG#:.88a+B)6.:`rY)
9i"eY;]nJ"6W?WQ:-hcL78k<r;FNlN7787b=WgO=8P`5,;H6Ij+AYHL<(KSZ+A>'f/g)9984=Xh
8OHHK:JO2R8OZQ#.!9WGCiaE2@:Uo3C2[X!Ddd0-+DPh*A7]q#Ddd0*+BM-.9HZYj+@JXl78u]D
/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m#+@Aq"<(0P];]nk*+B1m#;ahfs8OHHK:JO2R8OZQ#6r+q#
:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^/e&-s$<1\QF!,OGAT/c&AS,XoATJu&+Eh=:@N]c+
@<<W4ASl@/ATJu1@:C@#Dfp)1AKYMt@ruF'DIIR"ATKI5$7QDk;Is]`G%F?U@T.2fEarZKBk)7!
Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A'AhG2RIS*C(;bpCk6U`@F/NP"pDf9_\/g+nJ@<?0*-[nZ`
6rQl];F<l#+CoCC%144#F)>i<FDuAE+=BGt8l%iR:K::[73H,TEb/a&DfU+GBlbD7Dfd+CATW'6
+>"^WATW'6+CT.u+EVXL+CSnkBl5ON%16Z_F(K&t/g)_uAn?4$F*&O>E+*j%+=DVHA7TUrF"_0;
DImisCbKOAA92[3EarZ6C2[W8Bkh]:+CoCC%144#F)>i<FDuAE+=BcW6rQl];F<kq@:WneDBNY7
+Du+>+DG_7FCB!%ARlo8+DG_7FCB!%+CT.u+EVXL+CSnkBl5ON%16Z_F(K&t/g*_T=%Q.0A8a(0
$6UHd67sBjCh7$q+E)CE+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$6UI4BOu!r+=D2?+>7dY06&*Y
-S-ZdDf9_K-X:e9Bl%j,Ddd0(.4chj-OgD*+EM4-Cht4AEb$:GF!*,U+<i0a-us6EF=\eEC2[X!
Ddd0(.4chj-OgD*+EM4-Cht4AEb$:GF!*,U+<i0a-us6EF=\eEC2[WnAThm.@:U`7/12Vh%144#
F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC.3N\MF`Lu'+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDo
Cia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>qCgh3sF!,17+A,Et;bpCk6U`,:@<?1(+E)-?
9PJBeGT^F4A0=TT@j#i<F*(u1Et&I!+EM4-Cht4AEbupNEb6FA/95ZIF=\dmF`_>6F)5c'A1%fn
+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9Ci<`m-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dm
C2[WnAThm.@:U_p$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUD.-p-Ch[d0GUXbVDfp)1AKYMt
@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+
F`S[IASlC)Eaa!6+DbIq+EMIDEarZ'A8,OqBl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@DEb0E.Dfp+DCi<`m+DbIq+Co1rFD5Z2@<-'nF"Rn/
.1HVZ67sC'DK9<$BleB-EZcqVBkM=%Eb-A)EcQ)=Et&I1+>=o`+>Y-\AS5O#4s2pJ-ZsNFCiaE2
@:UKqDe*[&@:UKqDe*BiG&2)*A1&L(+>Y-YA0<6I%13OO:-pQU@r,^bEZf:CF<G+.@ruF'DIIR2
+Co2,ARfh#EbT*+%16!ED/XT/9OVC/Dfp)1AOL6BFD5Z2@<-'nF!*.G$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM;eART[l+E_d?CiaE2@:UKkBk)7!Df0!(Gmt*KF_u(?F(96)E--.D@<,p%Ci<`mARlotDKKe>
A8,OqBl@ltEbT*+/g)9(Eb/[$AKYD(.!9WGCiaE2@:Uf0A8,OqBl@ltEd98H$7QDk:-pQU@rc-h
FCcS'+Dtb7+E_d?Ci^_0Bl[cpFDl2F+DG^9."4ca6rQl];F<l%+>"^MF<GdACht5'AKZ#)DIIBn
A0>\sFCfJ%$;No?+B`W*+Dl7BF<G(3DJ!TqF`M%9."4ca6rQl];F<l%+CT.u+E275DKI"CD]iJ+
+CSc%F^])/ASlC.Gp$X3Eb/a&DfU+U%13OODIn$&+=D;RBl%j,Ddd0(4"+i_@<?0*-[nZ`6rQl]
;F<l+F`_>6F)5c'A1&ff-Z*:+DBO(DBl%L*Gp$X3@ruF'DIIR2-OgCl$;No?+Cf5+F(HJ&DL!@C
E+No0A8,OqBl@ltEbT*++CT.u+E)41D@HqkA0<7BFD5Q4Ci<`m-QlV91E^UH+=ANG$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@HqSBOu'(8l%htA9Da.+EM%5BlJ08+EDUB+EV:.Gp$X9+Du+>+Co2-FEMV5+F.mJ
EZek7EcP`/F<F0uASu[*Ec5i4ASuTB+<WsdC`mq?Eb'56@<,p%A7]@eDIm?$Bl5&%+Du==@V'Rk
A0>r'Eaa'"BHV,0@ps1b+EV:*F<G:=+CfG'@<?'k+EqL1DBMPI6m-;a@:XF3+<X9P6m-#_D/^V=
@rc:&FE8R8Ble60@<iu4ATMp$B4Z-,@:jUmEZf1:@:X(iB-:YlFCSuqF!,C5+E(_(ARfh'/g)99
BOr<(AU&;>CggcqF*(u4+Dbt)A9/l8BOr</FD5Q*FEo!>Bk)7!Df0!(GqKO5%160FEc,T/B0%/G
F_u(?F(96)E--.D@ps6t@V$[*ATE&=Cgh?sAKZ&4+DGpFF!+m6B5_^!+DG@t@3BZ1+E_a:+CT)1
@<lo:F`V+:-nlf*GUY6f+A?]^A8,po+CQC'F_u(?F(96)E-*4:DKKe>8g&1dF)u&6DBNM$Bln96
F!+t$DBNG0@<6*)8g%_aEZfO:Ed8dD@<-!l+EM%5BlJ08/e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
9Q+?M+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(GqKO5.1HVZ67sC$F`&=DBOr</FD5Q4+CoV3E$043
EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'06MANCi_4CC3(a3$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMhgB4YslEaa'$+E_d?Ci^_/Ec6#?+ED%*ATD@"@qB]j$<1\M+DbJ-F<GF3
F)tc&AKYMtF)Yr(H"CM/@X0))+CoV3E$043EbTK7+DGm>@3BT%D/!luATAo8D]j(3B4YslEaa'$
+CfG1F)rIEAS,LoASu!hF"SRX8l%htA8,OqBl@ltEbT*++DkP$DKK<$DBO.AEb$;&Ec6#?+ED%*
ATD@"@qB^(FD,*)+CT;%+E_a:A0>T(+DkP)Gp%<>H#kS\+B3#c+CfG1F)rIEAS,LoASu!hF!+n3
AKYl/F<GXHDfTE"+DG^9A9Da.F!+n/A0>`3F*&O6AKZ#)@rc-hFCeu*@:jUmEd(r4A90@4$7QDk
:-pQUEb/lpDImisFCcS;FD5Q*FD5<-+CfG1F)rIEAS,LoASu!hF!+n/A0>r,Dg*=9Bl\9:+>k9Y
ATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%13OO:-pQUD..3k+E_d?Ch\!*ATJu&
+ED%%A0>f.Cj@.6Bk)7!Df0!(Gmt*kE-#T4+=C&U5t"LD9N`_P$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk
@:UKqDe':a<+ohcF`_>6Bln'#F!,"-@ruF'DIIR2+DGm>DJs_ACi<`mARlolDIal"Ec6#?+ED%*
ATD@"@qB^(BOQ'q+C\nnDBO(@A79RkA1euI<,WmhDf'H0ATVK+FD,5.Eb0<6DfT9.Bl@l3De:+a
:IH=HDfp)1AKYK$A7Zm-AKYl/G9CC9ART[l+CT.u+Dbt)A0<:8De*[&@:Uf0@;]Tu-u*[2A7]q#
Ddd0*/e&.:%15is/g+YEART[l+Co1rFD5Z2@<-'nEt&IoATqZ--YdR1Ci<`m-T`_kE+*j%+=DV1
:IJ,W<Dl1Q05>E9Ci<`m-Rh,)C2[W*F)Q2A@q?cmDe*E%A8,OqBl@ltEd9#A$>sF!A0<77De*Bi
G&2)*A1'GeC2dU'BHS[O8l%iR:K::[75&CoA7T7pCi<`m-Rh,)C2[W*A7]pqCi=90ASuT4E-67F
A8,OqBl@ltEd9#A$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=HDfp)1AKYK$A7ZloAT23uA9/l3DBNk,
C1UmsF!,17+EV:.+E_d?Ch\!*ATJu)Bk)7!Df0!(GqL3^<+oue+ED%0@<?4%DKBK*E$/k9+DkP$
DKK<$DIm?$@X0)<BOr<*@<?0*DfTB"EZf:4+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5
+E)41DBNJ(@ruF'DIIR"ATJt'$8WfCA0<6I%13OO:-pQUDfB9*+=LuCA8H0mA18X0DIak<F`_>6
F)5c'A17rpDe'tP3[\Z\A8H0mA0?#:Bl%j,Ddd0(%13OO:-pQUA8-+(CghT3A8,OqBl@ltEd8dA
DJ!g-D..O#Df-!kA8,S'+<W?I$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!8l%htF)Q2A@q?cmDe*E3
+<XWsAKXT@6m-#S@ruF'DIIR2+CoV3E$/k9+DbJ,B4W2pARf.kF(HJ.F<G(3DKK<$DK?q/+EM[7
F*(i.FD50"+CT,*F`):DDe:,&De!p,ASuTuFD5Z2+CT.u+EV19F<G+&FC?dE8TZ(l@<iu;@;BEs
@3B/nG9Ca@D.RU,F!,RC+Dbt)A1e;u.1HVZ67sBsDdd0!C2[Vl$8<Va0H`JmE+*j%+=DVHA7TUr
F"_0;DImisCbKOAA92[3EarZ6C2[W8Bkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qAS5RlATD4$AKY`+
A0>B&Df]tBEb/ioEb0,uATJ:f6=jbIEb-A6AS5RlATD4$Bl7Q+C2[W1F!+t5Df]tBEb/ioEb0,u
ATJu1Df9D6@<<W6BOr<)E+No0A8,OqBl@ltEbT*+/g)99BOr;7C2[X!Ddd0*+Co1rFD5Z2@<-W9
DJs_ABOPs)@3BT%An?!oDI[6#E+*j%+EV:*F<G:8@r-9uATJtBF`_>6F)5c'A19,?$7QDk:-pQU
DJsW.+EV:.+=LuCA8H0mA18X?@<?/l$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=8Ec6#?
+ED%*ATD@"@qB^(GA1l0+Co&&ASu$$Df-\?FD5Q*FD5<-/e&.:%15is/g,1GB4YslEaa'$+=LuC
A8H0mA18X2Ec6#?+ED%*ATD@"@qB^(@;]TuF(fK9+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"E
Ddmc74s58++ED%:D]gDT%13OO:-pQUD..3k+=LuCA8H0mA18X0+ED%%A0>f.Cj@.6Bk)7!Df0!(
Gmt*kE-#T4+=C&U5t"LD9N`_P$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk@:UKqDe*BiFq"dRDg*=?ATT;@
+Dbt)A0>;uA0>B&Df]tBEb/ioEb0,uAKWC9De*BiG&2)*A19,R+=LuCA7T7pCi<`m.3N>G+EqL-
F<F-t@ps1i+EV:.+<k?-FtIN=H"D"?/g)99BOr;sATfYA@<lF)+DGm>@3BN3F<G+.@ruF'DIIR2
+EV:*F<GX=FE8RCDBO%>E$0(2+CQC1F_tT!EZf:4+EMX5@VfTuA8,OqBl@ltEbT*+/g*Q)EbTE(
+Co&,ASc:(D.RU,+E).6Gp%3BAKYMpFtIN=H"D"=@q]:gB4Z-:+<Xg*FWb1&DBNM!F(oH9+ED%:
Deio,@3B)lFtIN=H"D"=A8,OqBl@ltEd8d:Gp$U5Df]W1B-:o1/e&.:%15is/g+Y?Df]J4DfB9*
+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW)DBNG-EcP`$F<GO2FD)e8Eb&a%%14m6De't<-OgE$A0<rp
-YdR1A7]q#Ddd0!C2[X!Ddd0!F`_>6F)5c'A1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15dI@:UKhDIal"
Ec6#?+ED%*ATD@"@q@8%$7QDk:-pQUCi<`m+=LuCA7T7pCi<`m.1HV<+Z_;"4DJhDFD)dEIUQbt
Df0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A-OgCl$;No?+DG_7F`M%9@<<W.ARTY%+E)./
+D5_5F`8I7G\M5@F!*%WA7]@eDIml3E-67FA8,OqBl@ltEd8dH@<?/l$>4Bu+=CoBA8c?54+/_(
B6%r6-YdR1Df-p3$4R>;67sBjEc6#?+ED%*ATD@"@q?)V2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN
-Qij*%15is/g+\9G%GK.E,B0(F<GO2FD)e-Bk)7!Df0!(Bk;>p$=mj]INU<R$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMG\DImisFCcS,F_kl>+Cf>,D.RU,ARlouDe'u3@rc:&FE7lu<+ohc8l%htF)Q2A@q?cm
De*E%A8,OqBl@ltEbT*++D>2,AKYl/G9C@+ASrW2ATMs3Eb/c6+:SYe$<1pdB4YslEaa'$+D,b4
Cj@.5Df'?&DKKH#+EVX4A8-."Df0!"+A*bt@rc:&F<G10Ch7Z1AoD]4FD,5.@rH4'Df0-(FE8RC
Afu2/AKXT@6m-PrF*(u1+F.mJ+Ceht+EDUB+CQC6@rc:&F<GXHDfTE"+DG^9FD,5.8l%htA8,Oq
Bl@ltEbT*+/g)99BPDN1F*(u4+EDUBF!,R<BlbD<@rc:&F=n"0.1HVZ67sBnASu("@<?''8l%ht
F(96)E-*47Bl%@%+DG^9Ap%p+Gp$U8D/Ej%FCeu*AoD^,/e&/.D'138F_PZ&C2[X(Dfp)1AL@oo
%15is/g+Y?Df]J4A8,OqBl@ltEbT*+%14m6De't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is`SD.Oh^
:IH=ADdd0!A8,OqBl@ltEbT*+/e&.eBOr;Y:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.@<,p%
DIIBnA0<:8De*BiFt"O^C2[W3+CT.u+=MASBl%i>/g)92@;^?5FCfN8+CT.u+C]J-Ch+Z0@rc:&
FE8R=DBO%7ATME*A8,OqBl@ltEbT*++DkP&AKZ,:AKYo'+EV:.F(HJ3@;TRs/g)99D]iS)G%De1
DKKe>8l%ht@rGmh+DGpFF!+m6B5_^!+DG@t@3BZ1+Cf>/Gp$O5A0>o(DIIBn+EV:.+Dbt)A0>Ds
@ruF'DIIR"ATKIH<Gl;bD/Ej%F<G"0A0>o8DBO%7AKYT'Ci"$6Bl7Q+Ch[cuF!,RC+Cf>/Gp$O5
A0>o(DIIBn+EV:.+Dbt)A0>Ds@ruF'DIIR"ATKIH%13OO=$]_Z8PVc:+B;0(:JFPP:/i?3:/"e5
8Oah*:K8N*:EWD.<$4J#;FNl>=Wg7$<^e,ZC2[WnATfLF-u*[2.3LoO6m*n#FD5Q4.3M#M6W?WQ
:-hcL78kfJ$7QDk:-pQUF`)52B5)F/ATA4e:-pQU1E^^LB4N>Q+?MV3F`_>6F)5c'A0>W*A8H0m
A0>W*A7T7pCi<`m+E_d?Ci^_6De'u*De*BiFsd_+%15is/g+Y?ARTU%@;^?5C2[W*F)Q2A@q?cn
Bk)7!Df0!(Bk;>p$;No?+AQisANCrDDf'?"DIdf2@<,p%=(uP_Dg-7FDfTQ'DKKH#/g*W%EZfLB
Bm:bAH#n(=D0$-n:-pQUEb0*+G%De)DIal"DfBtEA8-'q@ruX0Bk;?.D..=)@;Kb*/e&._67sC%
BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci^sQ/12Vh%15is/g,4KASc0*
-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lXC2[W1.4chj-OgDX67sC%BOu!r+=D2?+>7dY
06&*Y-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]p3.4chj-OgCl$;No?+Cf>/Gp$X3@ruF'DIIR"
ATJtG+>7:KDfBf4Df-\-DfBE%F!,L7EHPu9ARlopD/aTB+EM[7A8-'q@ruX0Bk;?.%15is/g,4K
ASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&CiaE2@:U`7/12Va+t"oiC2dU'BHS[O
8l%iR:K::[79jtWBl%iq-RgSo+s8OM+>8!f%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1
:IJ,W<Dl1Q>\\1fCi<`m-RgSo+s8'W/1>7P@<?0*-[nZ`6rQl];F<lXC2[Wf-RgSo+s8OM+>8!f
%15is/g,4KASc0*-[9->E-WQM-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]q#Ddd0(.4chj+<i0a
-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiG$HCD/12Va04c7ZGpa%.%15is/g,1G/TPE8BleB-EZfR?
FD)e7ATo87@;TRs%15is/g,1GB4N,4F`_>6F!j$tC2dU'BHS[O8l%iR:K::[79jtWBl%i<.6Ani
ASu("@;I'/FD5Q*FD5<--OgDX67sC$AS5Nr-YdR1-T`_kE+*j%+=DV1:IJ,W<Dl1Q>\\1f-Rh,)
C2[W*F)Q2A@q?cmDe*E,%15is/g,1GB4N,4C2[WnATfF_-u*^0FD)dEIS*C(;bpCk6Ub6pDe*Bi
Fse_#-YdR1+Co&,ASc:(D.RU,-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;fuqo@<-W&$<1\QF!,:-@N]`*
Dg,c'+D>\;+EVNECi<`m+CoV3E$043EbTK7F"SRX8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*+
+EqC;AKYf-@:Wq[/g)99D]j1DAKZ).AKXT@6m-PhF`Lu'+Co1rFD5Z2@<-'nF!,=.CLnW0F`M%9
FD,62+CT;%+DtV)ARlo3C2[WnATfLR+=LuCA18X0DIak<F`_>6F"&^N$4R>7DeO#26=FY@EX`@M
@<,jk+>PW*3"64(@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKiBl8$5D_a1D5seOB<(o_D3ZoeB
:IH<R0e"5:DKKo;A9DC(Bl@l:%15cp6:"UN85E,H3Zp+!3Zp*c$;,5MDBM>"+@9LPATA4e@UX%`
Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3ZoeLBPDN1CggcqBl8$5De+!#ATJu9BOr;Y
:IH=HH#n(=D'1DQEb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!6;Gp:g;a!/a0b"I`
5se%:6WI&J3Zp*c$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBN"o@<<W+F!+(N6pD+f8l%htBlbD*+A*c#DfTA2
F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1/e&-s$<1\M+C\c#Bk&9"A7]0l@V'4eDIak^:IH=>
F!,R<@<<Va+E2@>B6%EtD/!m#+DGm>@V'V&+EhI1G@b;-@<3Q0EbAfuBmOK2B-:V*@rH1"ARfgr
Df-\9Afu;9Eb'56FDi:@ATDC$Ebuq-+EV%5CG$`*EbAfuBmO?$+Cf>+Ch7*uBl@m1+E(j7GAhM4
F!,.)G%De)+C\o(FCfJ8DIIBn3Zpg^6W?WQ:-hcL78k?=$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'
6m-2b+CQBb+CSekDf.0M+A$YtBlbD2DKBo.Ci!Zn+DG^9FD,5.."5T8A8c@,>\@VcATD3q>\\1f
.3N)?@;]Rg+E(j7FD,5.@s)g4ASuT48g&2#F*(u1+D,P.A7]d(@X0)<BOr<*@:O(]B4W3&@;]Ld
ATAo3EZeh:+E_RJBlJ$*DJ()6BOr;sBleB:Bju4,Bl@l3H>.=@-u*[2/p_5N.4u_c<+ohcDIn'7
+DbIq+EMX9E$/k4Bln&tCh\3,F!,R<AKXT@6m-PrF*(u1/e&.:%15is/g,:XARlomGp%3BBlbD5
@:BZQEb065Bl[c--Y@(/ATJu)BlY><@<633%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rFCB33+A,Et%16'J
BlbD<FCfD6F*(i2FE8RHBOr;Y:IH=HH#n(=D(Z8).1HVZ67sC%FCB33+DPh*+>"^GEb/[$ATJu2
@<6O%EZet.Ch4`'Aftu&@qB_&@<-W&$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+AucfDg#\7Derr,CggcqA8,OqBl@ltEbT*+%15^'6m-2b+DG_7FCB!%ARlp-Bln$,F`\a7
DL!@8Bk)7!Df0!(Bk;?<+<Ve+D]j1DAKXT@6m-bnFWbODF*&O7Eb/[$AKZ&4D.Oi#Bk)7!Df0!(
Bk;?<+<XWsBlbD5@:C@%F(KD8AoDg4+D#e+D/a<&+Co1rFD5Z2@<-'nF!)lI@:CZ:+=M&7@Us%n
.4cSiFDlFR+CT.u+=M2F@<lg'DCI1\+A,Et+Co1rFD5Z2@<-'nF!+n3AKYK'ART[lA0?)1FD)e=
BOr;7DIn$&.3KgPATo8-Bk)7!Df0!(Gp4ASATD64+:SYe$:8<9DfTD3@rc-hFD5W*+DbIq+Co1r
FD5Z2@<-'nF!,L7D/XT/+CT/5+E2@8DfQt:@:C?iBk)7!Df0!(Bk;?<+B3#gF!,OGAT/c&AS,Xo
ATJu&+E_d?Ch\!:+EV:*F<GdACht5*Eaa$#+Co1rFD5Z2@<-'nF!,(8Df$V-AS,@nCige9De!3t
Bl@m1/g*`-+DGm>Ecl7BBl5&8BOr<(AU&;>F*(u4/g(T1%160&;GKeY7lhba7NbZ$73GPu9i+V`
5uLi.9L1uf6qKaF8P`)I;Fs;U+@Aq"<'a)N+A#<t:JsnQ<(Tk\+B_K?+@AFm73Fl_:K:@:6r+q#
:K/H*=@GSW<(.p/84=Xr79EM39L1uf;cH1^+Unc-%16!ED/XT/9OVBuBk)7!Df0!(Bk;?mBkhQs
?TgFm1E\_$0F\A0Df9_\/g+nJ@<?0*-[p2ZATB.-$>F*)+A#%(8PUC=D_;J++<Y`=ASc0*-ZW`?
0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>\mhXA7]p.-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l<
/14\;De*Bm@rucsCggcs-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucsFDlFK
-OgD*+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucsE,8s.E+No2-OgD*+EMC<F`_SF
F<Dr)@:C@$ASlC)Eaa!6+=MGJDCH]=Bk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/+A#%&:.\P1
A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5&4@<?1(+E)-?9PJBeGT^F4A0=TT@j#i<F*(u1Et&I!
+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05P'+A7]p3%144#F(f-$C`k*GD'1ENAfrHP
Ec5l</13)cDe*Bm@rucFCggd#%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFFDlFP
%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*Bm@rucFE,8s.E+No7%144#F)>i<FDuAE+=Bik
@N]c(D/aE6@<-W9-uEC&05P??Fa,>XA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/nAlQ%144#
F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5BlA-8+EV13E,Tc*Ed8dD@:C?iBk)7!Df0!(Bk;?.D..=)
@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/AKYE!Gp%'HBlA#7CggcqA8,Oq
Bl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5A8,OqBl@ltEbT*++>"^MB5VX.AKYQ)Ec5u>%14d3
0H_V`1E^UH+=ANG$4R>;67sC'DK9<$BleB-EZee.Gp$p3@N]2q@ruF'DIIR"ATJtG+DGJ+DfTD3
ATDg0EcVZs0H`%l,TnlcEb/lo-9`P63[\`P@Us%n+DbIq+EVOI+E2.*H#R>4-OgCl$;No?+ED%1
Dg#\7A8,OqBl@ltEd8d<Bl[cpFDl26ATJu&DIakuCht5(Df0Z.DKKqB/Keb?DJsQ,+D#S6DfTn.
$;tGPDg#\c@:DW=@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k<+oue+EMX9E$/Y2ART[l
F!,R<AKWC;@:CZ.@;]Tu-u<=$A7]p5+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBjCi=B++CT/5+E)41
DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBjEb/[$AKWC;@:CZ.@;]Tu+=M&7@Us%n.3N/8
@ruF'DIIR"ATJ:fDIn$&+=Cu6@ODTlDIn$&+=Cu6@Us%n-OgCl$;No?+Dbb5F<G"8@;0Od@VfTu
A8,OqBl@ltEbT*+%17#a+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM_oASu4"B-:V*@r-()Bl7Q+A8,Oq
Bl@ltEbT*+/e&.eBOr;Y:IH=8Df'?"DIal%DfQt=E+Np$DJ()#DIal"Ci=B/DJ()&Bk)7!Df0!(
Bk;?.BlbCFDe(:>DfQsKDfB9*+Co1rFD5Z2@<-WB/g*b^6m,uXD/E^!A9/l%Eb-A7BQ%p5+CT.u
+D"u&Gp%3I+EVmJAM+E!%14M%A18X2@;[3+E+No0A8,OqBl@ltEbT*++AtWo6s!8X<(.p<DIakf
76s=;:/"eC+@1&kH#IgJD/!WrF<G.>E+NO$+AtWo6r-QO=Wh6h@ruF'DIIR"ATJu(@;]t$F<G%(
+Cf(nDJ*Nk+C]U=8l%ht@rH4$@;]Us/e&.:%15is/g,(OASrW2ART+&GB.D>AISubA0<79@:EbY
Fsd_+%15is/g,(OASrW2ART+&Df0B:%14j5De't<Cggd#%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rDf'&.
@rH4$@;]TuEb0?8Ec*"0De*E%@UX=l@ri(d6#:?[8l%ht@rH4$@;]Us+ED%8F`M@B@W-L&A0>]&
F*&OFATN!1FE9&W<+ohcAnc:,F<G:>ASiQ(F!+m6Eb0?8Ec*"0De*E?+=Jrn+D5V2A0<9S.3N).
A1euI;Is]RBl7X&B-:o1ASlK2@<,p%D.Rd0@:s.m+CT.u/0K(VF^]*&Gq:(LEcQ)=+ED%0@<?'k
+DG_*DfT]'FD5Z2/g)9/:IH=8Df'?"DIdf2E+O'%DfT\;AU&<.DKBN8AKYE%B6A'&DKI"2BOt[h
Bl7Q9+<X6f+F.mJ+C]A&@;?uo+A,Et+Cf>,D..<m+E2..@<6!&ASkjiC`mS++=L]-CLqO$A2uY8
B5M'kCbB49D(-T9DIal3ASc0*D.Oi6BOQ!*H#IgJA8,R,%14Nn$;No?+EMI<AKYQ)Ec5i,Dfp+D
DfB9*+Cf>,D..<mEt&IpA0<76+CT+0@3BE$F)u&5B-:`!@ruF'DIIR2-OgCl$;No?+C\bi+EVmJ
ATJ:fDe'tN%13OO:-pQU@UWdiEa`j$Et&IpA0<ZN1F+>WDf7!4$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM_m
Ch[cu+A,Et+CoD#F_t]-FCB9*Df-!k8l%htBOPs)AU&<.DKBN8AKWC?A7d85A8bt#D.RU,@<?4%
DD!&(:IH=9De!p,ASuTuFD5Z2+Ceht+C\n)@:NeYF)to'+EqOABHVD1AKWC9De*NmCiCgGG%G]'
/e&-s$7KY-A8#OjE%)oNE+*s.F!+m6:ddbqEb/ZiATAo8@<63:+A,Et+E_a:+A+#&+Cf>-Anbn#
Eb/c(:ddbqEb/ZiATAo3DBN"pDId[0F!+n/A0=Q[DKU1HF*VhKASlK2@;]TuFD,5.,&_F3DB^3E
BOu!r+Cf>,D..<m+E)-?9jqOQ/e&.:%15is/g+\=F)Yr(Gp#^T6m-#Y@s)X"DKK</Bl@ku$>OKi
BOu"!+>=63%15is/g+tK@psInDf-\9Aftr!Bl5%c:IH=%6q/;0De!p,ASuT!$>ONgFD)dEIUQbt
Df0W$B4YslEa`chC2[WnDe!p,ASuTpE+EQkDdt.($4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>]@ruF'DIIR2
+E1b2BQFUi<+ohcDfB9*+Co1rFD5Z2@<-'nF!,C5+A,Et+Co%qBl7K)@3BW&@<,jk+CT.u+D,2,
@q[!(@<?08+B3#c+=Lc7A18WLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DCH]OATD6&Ch[s4F!,R<
AKYr#FD*99$7QDk:-pQUF(fK9+E1b2BFP;ZBk/>?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k<+ohcA9hTo
Bk&8tDfT\;De:+?A8,R'+ED%8F`MA@+Co&*@;0P!+CS_tF`\aJBOr;rDf0Z.DKKqBDe:,'@:Nsn
A8,OqBl@ltEd8dGDBO%7AKYr#FD*99$7QDk:-pQUA8,OqBl@ltEd8d<ATV?pCi^$m0Han?A0<Q8
$4R>;67sBkBk/?8+>=o\+AP6U+D>2$A9f;3A8,t!%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rDf'&.DdmHm
@rri3EbT*&FCB9*Df-!k<+ohc8l%htF*VhKASiQ(F!+m6@rH4'Ch7^"+CT.u+Co&*@;0OhA0>H.
@;Tt"AKYo'+E(_(ARfg)DfTQ'DKKH#+E2@>B6%EtD/!m#+DG^98hM5/<+ohcF*VhKASiQ"Df0W1
F*)IGDe:,#+Du==@V'R&De:,%CghC+ATJtBE,oN%Bm=3"+EqOABHS[2C2[W1.4u_c=(l/_+EV:.
+EMgLFCf;3Ci<`mF!+m6G%#E*ATW2?De:,1@VTIaFE8R5Eb-A'Eb/[$ARmD9+B3#c+C\c#Bk&8o
EarcsFCes(F`M%9BlbD*+DkP$DBNJ(@ruF'DIIR2+E(_(ARfg)FD,*)+Cf>-FCAm$F!,(5F`JUG
F^f8uC1UmsF"SS(@:NsnDfB9*+Co1rFD5Z2@<-W9BlbD*CiaM;@<6L.@qf@nARlp-Bln#2@3B)p
Eb/a&DfU+GDdmHm@rs=G6tp[Q@ruX0Gp%$7C1UmsF!+n3AKYK'ART[lA0>;uA0>DoF*)G@H"CM/
@<3Q3AT;j,Eb/c6%14Nn$;No?+E(_(ARfh'+C\npBl7g&DJ()9Bln#2-Xgb.A1&L.Eb-A8BOr;Y
:IH=8CghC+ATKI5$=e!lC`kD@$4R>;67sBQ:IH=8Df0W1F*)IGDe:,5Bm:b0@<6-m+E(_(ARfh'
+CT.u+CT=#$;No?+DkP)Gp$X3Eb/a&DfU+GDdmHm@ruc7@<3Q5BOu3q+CT;%+E1b2BHV#2ASlK@
%16T`DJUFM%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sBOr<*F`\a:Bk)7!Df0!(Gp$U8DI[6sF:ARVBOr;u
Bl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*BlbD<E+NNn@;IP=+A$YtBlbD=BOr<)DJXS@+Co1r
FD5Z2@<-W9FD,*)+Ceht+C\n)D/Ws!Anbge+C]U=8l%ht@rH4$@;]Us/g)9'ARf.kF(HJ2Df^"C
A8,OqBl@ltEd8dEDe*QoBk(RnBl@m1+CT;%+E2IF-Z^D%+CehrC`mh5BlbD-Bk)7!Df0!(Gp%3B
AKW19F`\fMA8,OqBl@ltEd98H$4R>6F=2,PBl.g-Ecb`-F<G[D+E_R4ATDj6@;]TuFD,*)+F.mJ
+Ceht+E_a:+EV:.+Cf>-FCf?3F!,C5+EV:.+E)@8ATAo(Bk)7!Df0!(Bk;?.Df-\>BOr<*@<?0*
@Wcc8H#IgJ@ps7mDfd+3BOPdkAKZ).ASiQ(DBNA*Gp%<>GqKO5.1HVZ67sBmBl\9:+E1b2BHUi"
@ruF'DIIR2+DGm>FD,5.E-67FA8,OqBl@ltEd8*$A8,Qs0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36ZQaH
FD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/6=jbIEb-A1De*QoH"h//+EV:.+Cf>-FCf?3F!,C5+CT/5
+Co1rFD5Z2@<-W9Ch7]9F!+t5ART[l+CQC1ATo7@FDlFK+Co1rFD5Z2@<-W9@;]TuD..3k+DGp?
FD,5.E-67FA8,OqBl@ltEd98H$7QDk:-pQU@r-()AKYo1ASrW$Bk)7!Df0!(Bk;>p$8WfCA0<6I
%13OO:-pQU@rc-hFCcRCFDlFR%16uaG@VgDFDlFP%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9jqgK+=M>M
GpskE+E2IF+Co1rFD5Z2@<-WG%14Nn$;No?+E)41DBO%>Gq:(S@:EbYFs(42A0>\s@N[6FFDlFI
BlbD=BOr<*F`\a:Bk)7!Df0!(Gmt+!A0<rp-Zj9P+DbIqA7]p,Cggd#%13OO:-pQUBl8!7Eb-A8
Dg<I>F!,L7@:V$8EbTW,%16WbF(KG9-W3B!6s!8X<(//D$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\FED57
B-:W#A0>i6FED57B-;D:Eb'5D%15[E+EV:.+D,>.F*&OGARfgrDf-[h+ELt*A0=K?6m-2b+CQC:
DfTA2F*)>@@:s-o@;]TuEb0?5Bk;HrC`meEF*(u1/g)93Dg*=JAKYE%AKZ#)@:XX+FDi9ME-67O
+CT.u+=Ll6F=A>RDf'&.GAhM4F"Rn/%15R=EcZ=F@rc-hFCcS9Df'&.GAhM4F!,RC+EMXCEb-j4
$7QDk:-pQU@rc-hFCcS9Df'&.GAhM4Et&Is@;]UoD*9p&5;=i70eak-0JFUl:-pQUDKTf-EbT#+
DJsZ8%172gG]Z)0+=D8EBlbD2F!+m6FCfN8+E(j7FD,5.Df0,/E-624+EV:2DJ(=+$>+*m@<?QR
3Zp1#.j-,\0eb:+0eb9j$?LK0@W-((4ZX^,3ZodmDf0&r+Dl%;AKZ22FD)e/AS#[lDJ(=+$=[pu
ARmqb+?Ui&+DEGN1*A@^$?BQsBl@ltCi_a#+>GQ(+=eQ\+=KE7BeCM_0R,#h?6D*Z%175qBk)'l
AN`'sFZLWmFD,B0+DGm>DJs_AF`(o'De*E,%16ZT@q\"d+=8^)+<VdL+<VdL+<Ve%67sC&@:O"n
+CSf(ATD5h$>"I$Ch[BnF?MZ-1a"h%0F\@a67sBlG]7J5@qg$-G%G]'%17>&.kVri%14Nn$4R>d
DfTB04ZX]I3[\rVDId[&+EV1>F<G13Ddda/+EMgF@W-((+C]86ARlp(@<?4%DII@&+E_R9@rGmh
+D"tkBHUl2E,95uBlk^3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$E-67O+DGm>FD,5.8l%ht@rH4$@;]Tu
FD,*)+EMXCEb0;7GAhM4F"Rn/%16$BG%De)DIal$Eaa$#+EV:.+EqaEA90@G+B2cbAKZ&4D.Oi3
Bl.E(FDi:3Df0`4DI[6#H#IhGF(K0"+EV:*F<G[=AKZ28Eb'56BOQ'q+C\nnDBNM2@<6!j+C\no
DfTD3E,ol,AS#CdDJ(R2$7QDk%15is/g,4DG%De?DfTB0%17&sF<GdGEb'5#$4R>;67sBlEaa$#
+Co%qBl7X,Bl@m1%16Ze@<6!&GAhM4Et&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;PM`+ED%8EbT*.AKZ).
AKZ&9DfTE"+EqaEA9/l%DIal"BOt[h+EV:*F<G[=AU,D,Eb-A4Ec5o.Ebp"DEb0<6DfTE"/e&.:
%15is/g+e<F<GdGEb'5#$>3pl+EqaEA9/1e%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@L-XF_t]-FCB9*Df-[P
0JO"D:Ms_dDe:,/Gp%';F<GO6AThX++DGm>F`(`.@s)X"DKKH#+Cf>#AK_Ki%15XEG9Cg9FCf>4
BOQ'q+F.mJ+D>1o+EVNEAmo1\+D>n8A9)6lF"AGN@<l<n+EV:8F`Uu/A90:EDe:,.Bl7L'+E(j7
@rGmh+EqOABHV2$Ed8d9+Cf>,D.RU,+DG^9F(o9#F=n\'Df'?&DKKqB@<,p%DJsV>AoD]4GA1o5
F!+n/A0>N!Ebp"QD.RT;+B2ogCh[d"+Cf>,D.RU,F!+n3AKYD(BOP^nD..I#+E(j7B5_^!+Cf>#
AM+E!%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,9@<lo:FDi:4De!p,ASuT4GAhM4F"SS:BOu'(
@3Bc4Eb$;,F!,17FE2;1F^nun+DGpFF!+m6B5_^!+DG@t@3BZ1+EMXCEb-A%+EM47Ec`FBDIjr,
Bl7K)A7]glEbTK7Bl@l3De:,6BOr<1DfTA@%14Nn$;No?+EMXCEb-A7BQ%p5+EqaEA0>DoF(96)
E-,f4DK?6o0H`=tE-67F-ZWX5A8c<44"#&WDId[&+DG_8AS5Rp+EV%$Ch4t'$4R=r+?1K_F`\`R
ART(^-T`\aE,]W-ATJu1AS-$,@<-"'D.RU,+EVNE@<-BsGp$gCASlK9%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k:M(_ZDfp)AAKZ8:FWb1&DBO+:ATo8BDfp(CF*)>@ARlooATM@%BlJ0.Df0V=GA2/4+=Ll6
F=AgO$7QDk:-pQUB4Z0-F(fK4F<G.>E,8s#@<?4%DK?6o0H`=tB4Z0--ZWX5A8c<44""TJ@q[5!
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqIDfTD3A7]jkBl%?k+CoD#F_t]-FCB9*Df-\-@;[2sAKZ&9DfTE"
+CT.u+ED%8EbT*.ARmD9<+oue+EMX9E$/t8@:XF%@3BT%@;KY!FD55-AU%X#E,9).De:,9DfTA2
A8bt#D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$O5A0>u-ASrW$Ble60
@<lo:GA2/4+=Lc7F)WQ\%13OO-tI%5E%)oDF!+m68l%htF`_>6BlnVQ+<X6t+DGm>FD,5.Df0B:
+Eh=:@N]c+@<<W4ATW'8DK?6o@3B&n@<,ddFCfJ8Ch[s4+=MGIASrW3F^nomF)tr9CagK@DKBo2
@:UL!Afu2/AKZ,:F^])/@W-L&A0<:@@lnjBCis;<%14Nn$;No?+Dbt)A9/kA@q]:gB4Z.+E[`,>
DIak<@q]:gB4Z.+E[`,ADe!p,ASuTuFD5Z2+DG_8D]j.8AKYK*EcP`/F<GOFF<G+.@ruF'DIIR2
%17/dEbTK7+=DVHA7TUrF'N?hDImisCg:^nA6`kfA8G[`F'NNi@V'dmD/a<&0JG46Bkh]:%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k<+oue+EMX9E-!.4Ble60@<lo:FD,5.Ci=3(+CoD#F_t]-F<GC<@:Wq[
+DG^9FD,5.E,oN5BlA-8+EMX9E%VS,.1HVZ67sC%BQ&);Ci=3(+CoD#F_t]-FCB9*Df-!k0H`@u
A8-+(+=CZ4@;]^hF*)FM%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[lDfTD3E-68EBl7Q+@;]TuB4Z1,Bl7Q9
%14M&F`]&T@;]Tu-td+5.3N&>AKYu8Blmo/Ao)%'Bjtmi+CT.u+Ceht+EMXCEb-A)DKKT5AKYf-
@ps1bF"SRX<+ohcCi<flCh7Z1@ps6t@V$["@;TRd+E)9CDKTf*ATD?m/e&.:%15is/g,4DG%De<
BOr;7@;9^kD..3k.3NGF@ps1b04Sg,F)rI<DBL-FDg<N9$7B7sDe*]nCLnk9E-67FH?q_8+Du"&
@;9^kD..3k?Qa&8+>aN7%15is/g,1GFE2),G%De<BOr;7@;9^kD..3k.3NhQEb'56Bl8$2+CT.1
-[9l\-Qm5D@ps1b%14J-G^(SYB4Z0-H?p#-%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B)i[EarcsDJ()(DfQtE
DfTB0%15dCCLnW*Df^"CF*)>@@:s-oF*VhKASlK28l%htE,ol?Bk1dr+D,%lBl%L*Bk;?.AoD]4
F(Jd#@q]RoB-;;0AKYK$DKKH-FE8RCAftf0F!,"%FCAWeF(Hs5$4R>ABOr<'@;0U%F(Jd#@qZup
Df'?"DIal(F!)lADJUaE-tI%%FD5Z2@<-W9DIIBn+Dbb5FE8l`%14Nn$;No?+Dbb5F<G".C`mh5
AKZ28Eb'56Df-\>BOr<*@<?0*@V'1dDJj0+B-;D4FD)dEA9B7/$>aEtF<Gua+CoA++=C]B-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$7KG&CagK:@;[3/ARTUhBHUo*EZfREEb'5B+EV19FE8uUB6%p5E-!QQ
F*22=ATJu&DIal,@:O=rF"SRX<+oue+EMX9E$/Y2ART[lF!,OBD.Oi&Ec6)>F!+n/A0>u-ASrW,
BleB;+CT)&+EV:.+D5_5F`;CEDf-\>BOr<*@<?0*FD,*)+C\npBl5&;Bln#2-V@0&-OgD3%15is
/g+YEART[l+EMI<AKYW+Dfp#?%16`gE$-NLFE2)5B6,F^-Y$guDJ*O%FE/`<$>4Bu+=CuD@ru:'
F=0.fCgUUcDe*]nCLpiqBeD4O$4R>;67sBnEc6)>F!+q'B5)7$Bl7Q+GA2/4+=CuD@j_]m1*A:o
A8Z3+-Z!^2-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3=(l#a+CT;%+EV:.F(HJ+F`))B+CT;'F_t]-F<GID
D.7'sF$C*@6?s\kDg*=LDfm19@<Q3)E,ol+@:F%u+Du+>Bk(^b+EV:*F<GF/DL!?s:IH=8Df'?"
DIdf2FCArr+DG_8AS5Rp+CT;'F_t]-FE9&W+A,Et+CT;'F_t]-F<G(3A7]g)@<,p%De:,$@<6-m
@;Kb*+EV:;AS!!+H#R>9/0Jk?C1Ums+Cf>#ATKCFDfBf4Df-\-De*F#+CT.u+E;O4Ch[KqATDiE
%13OO<+ohcDdmHm@ruc78l%htF*)>@ATJu&DIal1ATVs,AThX++CT)&+D>2,AKYo#C1Ums+Cf>#
ATKIH+B3#c+Dtb8F<G[6@VfTuA8-+(CghU1+A,Et+E(_(ARfg)@rGmhEt&I*%15is/g*b^6m-DW
C1Ums+Cf>#ATJ:f-p/\-+DEGN2CTb"/g*5:-Wa)A6m,Gt;cFl0;GU:h+B)93<(.p(5snOG+@Jdg
<(Tk\5uLi5%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:N1DiDf-\+DIal0F^]*#Anbgs+Cf>#ATJu8ASbpf
F<G"0A0>`-A8,Y$+E)4@Bl@m1/g)99BOuH3@<,p%@;Ka&Bl8$(B4Z+)/g*W%EZf4;Eb-A-DJ!g-
D..O#Df-\+@W-C2+CT;'F_t]-F<G(3A7]g)Eb/Zi+A,Et-Z^DKDJX$)AKYN%@s)X"DKK</Bl@lA
%13OO:2b>!Ci=6-+CT@7F)Po,+Dl%;AKWC3DJUaE@rH4$@;]Us/e&.:%15is/g)QTEc6)>/0JkM
FD5Z2+>Fuj+DkP/@q[!(Eb/isGUXae+Cei$AKYhuFED)7Et&I3+>G!LDJUFCCaTZ!%15is/g)QZ
@:O=r/0JkMFD5Z2+>P&k+DtV)AKYK$DKK<$DK?qAFE2)5B.4rT+Du*?D.-ppDf[%HATS@g1a"Or
A8Z3+-Xh$C%13OO:-pQUD..3k+CQC0@:O=r+CT.u+EM+&Earc*@:s"_D@Hq0+E2IF+=CT<EbB&5
4%`F=;Fs\a?X[\fA7%DG:-pQUD0[77D]iq9FD,B+B-9ehD.-ppD^Pu$%14p71*C+FC`k*6E[M;'
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+@gHjF`;CE@;]TuF*22=ATJ:f8l%htE,ol?Bk1dr+CQC6Bl.g*AKZ2*
Gp%3I+D5_5F`8IIDfTB0+CT.u+EV19FE9&W+@.,_Ec6)>+DGm>@3B&uCi!ZmFD5Z2+E(j78g&=r
Eb'5D+<WrmF*22=AKY].+CQC&Des6$@ruF'DBNk0+A*buATMr9F(96)E--.R+<Xg*FWb17ART[l
+CT.u+Dl%-BkDW5B6%p5E-!.1DIal2F_Pr/F!,[@FD)e=BOr;7B6%r?+Eh=:@P/)s.1HVZ67sBj
Eb/[$AKYD(B6%p5E$0(2+EqaEA9/l;Bln#2DIIBnF!+q'B5)7$Bl7Q+GA2/4+=CZ4-OgDqEc<-K
FCfN8B6%p5E$lbi+FPjbA8Z3+-Y$g;%13OO:-pQU@rc-hFCcS'+EV19F:AR3+E2IF+=Ci6Ci"$6
DfTZ)-T`\1+Bos9-V@0&+EV19FE8R5Eb-@c+EM%5BlJ08+EV:*F<GU8FEMVA+>Ipb-RT?1%15is
/g+YEART[l+CQC7ATMr9F*22=AKWQIDJsW.+DbV$F<G"4B6A'&DKI"2De*Dg$8Wf;Ec<-KFCfN8
F*22=ALAT^+FPjb0d("EC`k)Q%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=`8F*@ps6tCh[s4+EV:.+Cf>-
FCf?3F!,C5+D5_5F`;CEDfQtAF_Pr/F!,[@FD)dFB6%r?%14Nn$;No?+Dbb5F<G(3DKKH-FE8RC
Afu2,F*)&8Dfp"AB6%p5E"*.eEc<-KFCfN8B6%p5E$l)%%15is/g+YBDKKH-FE8RCAfu2,F*)JG
Blmo;+Du+>AKZ&:Blmo/@rGmh+DbV$F<G"4B6A'&DKH<p1E^=NE$-NMATMs7F_Pr/-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l39jqgODJ())Ec6)>F!+n/A0>r9Blmp-%15mKAKYo'+EV:.+DkP$DBN@uG%#91
@:s.m+E(j7F*)>@Bl7Q+8g%V^A7ZltDBMPI6m-Yo/g+RFE,8rsDBO"1EbTK7+DGm>FD,*)+F.mJ
+Ceht+DkP$DKK<$DBN@1;b9_S9LU(IATDj+Df-\9AftM)GAhM4/0K%GF*&rUB6%p5E$0(>+EM[>
FCcS'DIal3BOu'(B4YslEaa'$+DkP)Gp#^%Ci<`m+EM%5BlJ08+EV:*F<G^IAKYMt@ruF'DIIR2
+E(_(ARfh'/g*PjFCAWeF(HJ)ATMQuDImj0+CehrC`mh5BlbC@Df0,/G%G]8Bl@l3De:,6BOr<.
EclJ;/g:`3%16'JAKYT'Ci"$6Bl7Q+Bl8!'Ecc@F@3BW*DJ*cs+EqaEA0>T(+=M>MGpskKEc6)>
F!+n/A0>u-ASrW'ASu("@<?(%+EM%5BlJ08/e&.:%15is/g+tAAoo/1F`VY=ApGM@@:F%a+Eh=:
@LWZ\C3=T>4ZXr5-RL*"+?CoV+FGdc?SR!PBeCSa-87\5>p*]2+Bp9D%13OO:-pQUF*)>@AKY])
+E2IF+Co1rFD5Z2@<-W&$?1-0+=Cu?F`VXP%13OO:-pQUBl8!'Ec`F<DBNA(C`m\>F<G+.@ruF'
DIIR2+D5_5F`;CE%14M3/g)nlEb0E4+=ANc+CSekB6%r<4s2s8Che*6F=.M)%15is/g+tKDejK7
+=M8AG&JfPBl5&.De(J>A7cs.Bln#2-u*[2BOu"!.1HUn$;No?+D58'ATD4$AKYDtC`m\>F<G+.
@ruF'DIIR2+D5_5F`;CE%14d3D/=8?4s58++>P'[AThu>-OgCl$;No?+DGF1FD,5.Ch74#+CT;'
F_t]-F<G:=+D#A'A7]9oFD,5.B6%p5E-!.1Eb-A1@:WplBl8$2+=M&E@:Uf0F(96)E--.1$;No?
+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9SEc6".$<1GTCND$LCh[Zr+E_X6
@<?4$B-:huDImisFCeu*F(96)E--.P+Ceht+C\n)F(oK1Ch[KqARlp-Bln#28l%htD.-ppDf[NR
+@.,B:IH=B@:O=r+DGm>@;[2rEaia)Eaa!6+A*bt@rc:&F<G[=@<<W%@;[2sAKYSrFCSuqA0>;u
A0>H.ARfk)ARlp-Bln#2-us/R/e&.:%15is/g,">@rcK1FD,*)+D58'ATD4$ATJu&Cht55F`\a:
Bk)7!Df0!(Gp$a?Dfp#?%16igA8PabEc4*%+=BoN/g+e<DImisFCcS'Cht55F`\a:Bk)7!Df0!(
Gp$a?Dfp#?-S.q\/13+oD/=8?4s58++>P'[AThu>-RU8a-OgCl$;No?+EMXCEb-A1@:O=r+>"^G
De*E%1,0nnASc1(+A,Et+EV:2F!,1<+CQBb+EM%5BlJ/'$8`lEF`\`RD..3kE-688Ec?(I4#/NP
C2[X"@:O=r%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k;KZkpBl7Q+@3A0<6m->T@rcK1BlbD*+EM76E,9).
D..O.ATAo3Afu#2ASu4"B-;;0AKYE#E,ol9EbSs(AKYMt@ruF'DIIR"ATJu&DIal4F(oN)+=M8I
.3L2bEcl7BD.-ppD_;J+.1HVZ67sBmATVEq+CT.u+D#e/@s)m)+:SZuD'13C@;BFnF`_8:E-!B9
$4R>;67sBmATVEq+CT.u+D#e/@s)m)+EM75ASuU+Gp"[]GA1l0+E).6Gp$X3F)Yr(Gp$[CE,95u
BlnVC@rGmh+E)CEE-673$;No?+>G!ZD'13C@;BFnF`_8:E-!B9$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqI
@:O=rF!+n3AKYl/F<GU8F*)G:@ru9m+EVNE8g&1bEbTK7F"SRX=`8F*@ps6t@;L"'+EMXCEb-@a
<)$%;+A?3CAQUK+=A;I?+B1d3<%K.d5uL?D:KL:B+B;B13$;XIA0=3A<(.pN@rc:&FE8R=DBMPI
6m-#S@ruF'DIIR"ATKIH+AZlkGp#^%F(96)E--.D@ps6t@V$[&F`&=8Dg,c9ATBC4$7QDk:-pQU
F*)>@AKXZT<+T/S-o*P,+CT.u+@oI+9HY`=1FXGgAU&<<%14p7E-67F-Z!45AU#Ra1,:p=/hSb!
9OUn3=<M*lA7Zl9/hSL\$4R>!+E2IF+=CiED/:R]1,D!>+>,9!+@oI+9H[h`A7Zl9/hSL\$4R>;
67sC%FDl22+BV?3+CT.u+CT;"BlnB(Ed8d,79EM3-t7IDATK:Q%14p7E-67F-[9KE-TbF)9OD4C
De*3:-TlK^F*'TfBPDN1BlbD5@;TQuG\q7Z06CcHF?V&]$4R>;67sBI=]@g4BlbD>DJ=!1ATDa1
ATVKo+C]V<ATJu&DIal"@;[3/FDl22+C]&&@<-'nF!*%WDJsV>Eb/a!D/Ej%A7]9oAoD]4Cgh?s
AKYT!Ch7Z?%14p7E-67F-ULC"-Ta(A4*"n@A7&b[De*2tC2dU'BHS[O@:WneDKB&qASu("@;K1`
De**fD..L-ATBD;C1\h&$4R>;67sBiH$!U?F(or3+E(j7D.-ppD[d%1+>G_rB4Z0--ULC"-OgCl
$;No?+DkOsEc3(BAU&;>FEqh:F!+n3AKYK$DKK<)FE8R=DBO%7AKYhuBl5%c:IH=8CghC+%15^+
6W-KP<*s'KDe*3++A>(#79Eo*C2[Wi/0IJ_9h\o&C2[Wi/0J%h9OD4CDe*3++B1d3<*s'KDe*3+
+@9417:0J<De*3++AG."912QW:1%FEDe*3++B;B13+$*/De*2a$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk
@:X(iB-:`!@ruF'DIIR2+CoV3E$043EbTK7%16'Q+Co&#Df0W<Eaa'$+E)@8ATAnc:IH=;ART\'
Eb0;7G@_n7AS#BpF)Po,+EqaEA9/l-DBNk?EZen,@ruF'DIIR2/g)99BOr<(AU&;>F*(u4+Dbt)
A9/kACggd`F_u(MBkh]</e&.:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+DbIq+Co1rFD5Z2@<-W9
A9Da.+EM%5BlJ/H%14Nn$;No?+DG_7F`M%9@rHC.ARfg)E+*j%%17#a+?MV3FDlFICggd`ATf24
@:CT,>9G^EDe't<-OgCl$;No?+Dbt)A0>E*D/^V=@rc:&F:AR2+Z_;"4DJhDFD)dEIUQbtDf0VL
B4YslEa`c;C2[W9C2[X!@:F:2Cggd`F_u(MBkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k7!3?c+EM%5
BlJ08+CoC5DJsV>F*)>@AKZ28Eb$;5AS,LoASu!hF"SRX<+oig+Dl7BF<G%(+D58'ATD4$ARmD&
$7QDk:-pQUF`:l"FCcS=DfTA2Eb/ioEb0,uATJtG+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u
+>=pNCi<d(-9`Q#/g,1GG&J`U%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fCi<ckC`mb0An?!oDI[7!%15^'
6m-/OF!,('@qfanFD5<-+D,P4+Cei#Ed;A:B-;,8F<GXH@<?3n+DtV)AKYE!@;L41BlbD8DBMOo
GAhM4F!+n/A0>u*F*)IU%13OO<+ohc-td@7@WNt@@;]Tu.!9TBF"&5TATD7$+CT.rCjC><+CT.u
+EMXCEb-A2@;TQuEb/ioEb0,uATKI5$7QDk:-pQU@;]LiH$X$EDIIBnEt&IhATT%BA92j$F=.M)
%15is/g+Y?@<6L(ApGM:@;TQuF`V+:Bl5&&@<6!&Ci<flCh4`5DfT@t$8F7XB5DKqF!)i@F*(i4
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht+E_X6@<?''B5DKq@;I'1DfTA2Eb/ioEb0,uATKI5
$7QDk:-pQU0Hb(N+EV:.+EqaEA0>B#A7Zl8+EMXCEb0;7B5DKq@;I',AS,LoASu!hEt&I1+D5M/
@WNY>A92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+F(KDA+ED%8EbT*.ATJu8FDl22A0>o(An?!o
DI[7!/e&.:%15is/g+eCDdm-k+ED%*ATD@"@qB^(AoD]4-tIC@@<<q-$?^E$F!)i@F*(i4-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@V'%fD.Rc2G%G]>+<krLAS-($+s;)CASrW!Cht5<DfTB0
+D>2,AKZ&9DfTE"+ED%*ATD@"@qB^6%14Nn$;No?+DG_7F`M%9FDlFIBlbD=BOr<*F`\a:Bk)7!
Df0!(Gmt+!A0<rp-Zj9P+DbIqA7]p,Cggd#+BosE+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+
F(KDA+Ceht+ED%8F`M@BD..=-+ED%*ATD@"@q?d!BleB;+CT@7Df0&r/g+,,AKZ&&D.Oi/@<?0*
F(Jd#@q[!%ARfC^DJ=0/+DGm>F`V,)+D,P4+ED%8EbT*.Bl7Q+Eb/ioEb0,uATKI5$7QDk:-pQU
B5DKq@;I',AS,LoASu!hF!,C5+EqaEA9/l&AS5^pDJ=!$+EqOABHS[>-OgDX67sC'F(KD8I4cXQ
DJUFCD'oc"%15is/g+eCDdm-k+ED%*ATD@"@qB^(De:,9DfTB0+D#G$Bl7Q+GA2/4+=D4X%176!
ATJuB/g)hj1E^4GCaX9O%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sBOr</F(KD8F`(o3D@HqKE-,f4DBL_i
+E(j7.!9TBF"&5PATW'8DK?qBBOr</F(KDEF`(o3DBNk0+CQC:DfTA@+<XWsAKZ,:ATKGGDJ=$,
+DGm>@UX=l@ps1iGp$N<F`(o5F_)\3BleA=@;Ka&FD,5.GAhM4F!,C=+EV:.+CehrC`mh?AS!!&
AftM)GAhM4/e&.:%15is/g,:XATJu:DJ=$,+E(j7FE_XGGAhM4Et&I40d(U[ATJtU3[\EGCi+*/
DK?qAF`)56F(KE(F>,'O$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFD5W*+Dbt)A0>r'EbTK7Et&IK
:IH=8@;[3#ASu("@<?''8g%qg@:UL%@rc:&FE8R:Ec5e;A8,OqBl@ltEd8d?Ec6)>F"SRX<+ohc
B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF+Co1rFD5Z2@<-W@F!,O6EbTK7
+EM[7A8-'q@ruX0GqKO5.1HVZ67sBnASu("@<?''Ci<`m+EM%5BlJ/'$>jU#+=D5QDJa<1DC6PL
+AP6U+EM[C05YWGDBNt6F(HJ8ATS@g%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16rgF!+n1E+NotF!,+,DImis
FCeu*F(96)E--.DFDi:DBOr;rF`MM6DKI"DF(KA>F!,OG@<-I4E%Yj>F!,(/Ch4`1D]j.8AU,D.
@;[2sAKYf-@:Wq[+DG_(AT23uA7]Y#Cj@.AAfs]A6nSoU%15jKFCdKUD/=89F(96)E--.D@<,p%
@:Wn[A0>u4+Ac')9M%TYC0r*%EZe2$@Vfag?YWpjAoD]4FD,5.@s)g4ASuT4F`V,7/e&.:%15is
/g+tK@:UKnASu("@<?'k+EM%5BlJ/'$>aWhA0<7@F`)&7Df-p3$4R>P@;Ke!Df0V=1,(F?+<XEG
/g+bKCht4B0e"4f@;]TuDIn#7-nm(mD/X?1F!,17+>PW*2%9m%$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37qHRL
Eaa'(DJ()5@rc:&FE8RCDBNJ$D..<m%15^'6m,uJDBNA(F)N16ASu("@<?''@;]TuCi<`m+EM%5
BlJ08+EqOABQ&$8+CfG'@<?4$B-;#/@:UL%@rc:&FE9&D$7QDk:-pQUCi<`m+C\c#Bk&9,FCB9*
F*),+F!,+9Dfp".$>a>t-Xq.=@<?Q<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-td+5Ed0#UCi<`mF!+n-
C`mh5AKZ28Eb'56@ps1iARlomGp$N<B5)O#DBO.AEb$d3$7QDk:-pQUCi<`m+CT)&+EqaEA9/l2
AS#BpFDi:BF`&<MA92j$F=@Y+B4Z1*GT\AEF*(i4-OgCl$4R>;67sBsDdd0!Bl8$2+CT;"BlnB(
Ed8dDDe!3lATJ:f:-pQU-ZaB<FDPl*-Qm&5FE2UK-Y.:?@<<k+$;No?+=B00-Qm&5FE2UK-Y.:?
@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBM8S@r#drB-;>9+CT.u+ED%7FDl26DJ()&Bk)7!Df0!(Bk;>p
$;+)^+DGm>A79Rg@UX=h+D,P4+A*c#DfTB0/0K"DEbTK7F!+n/A0>f4BOu3,E,oN"BlA-8+E2@>
B6%Et+EV1>FE9&W+AHcqF<G+&FCAWeF(HJ8H#n(=D0$h5@<Q3)D.R-nF!,(5EZeh"@r#drB-;>9
+CT.u+ED%7FDl26DJ()&@<>pe@<6"$+CT.u+A,Et+CoD%F!+n4+EqC5Cb?hQ<+ohc-u`U)CLek:
G%G]'+C\bhCNXT;+E_WG@3B)hFCAWeF(Hs5$7QDk:-pQUF('6'+CQC%@:O(qE$0(2+EV:.+CfP7
Eb0-1+E2IF+Co1rFD5Z2@<-W&$?0E`CLeP8FDlFP%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-u`U)CLek:
@rH=#ATJu9BOr;rF`MM6DKI"3Bk)7!Df0!(Gp$^5Ch7Z1FDi:DBOr;q@:O(qE$04E@Us1nARfh#
Ed8d9DIal/Eb/isG\(q=@;Ka&FD,5.Anc'mF!,[@FD)e*+E_R9EHPh8AThX*+DG_'Eb/[#Bl7Q+
@UWb^F`8I@F_tT!E\7e..1HVZ67sBsBleA=E-67FA8,OqBl@ltEd8d:@:O(qE$/b,Ch7Ys$:7-P
;E[&`HTHL++<X'K5u^B^?W0p2?V4*^DdmH(+<XEG/g,+UF<G+.Eb/a&DfU+4$=mjk+@8@e?XH,f
8Q%)e.P>FMAg\]D+<VdL+<VdL+<XEG/g+V3@r$4++D,>(ATJ:f%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M(
ATMs(.3NYBF*)>@ATJu9BOr<&@<6N5@UWb^F`8I4Gp%0>Ch7*uBl7Q+@UWb^F`8I8Bl%@%+EqOA
BHVD1AKYZ#B4tjtF<GOCAS,Y$/e&.:%15is/g,1GF*)>@AKYetF*&O6@:O(qE"*.pATMs(+=D8L
Gpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[Bl7Q+@3BW$EbTK7+CoV3E"*.&E+*6lA18X2Eb/[$ATJu'
Bl7@"Gp$R)@r$4+F"SRX=`8F*@ps6t@;L"'+C\bhCNXS=A8,OqBl@ltEbT*++CT=6A9Da.+EM%5
BlJ08/g)9)F_u(?F(96)E--.D@<,p%F(oN)Ch4_]+EM%5BlJ08+EV:*F<G(%DBND"+E_a:A0>u4
+C\bhCNXSI+Cf>/Gp$O5A0>`#EbAr+A8,OqBl@ltEbT*+/e&.:%15is/g+\ID/^V+Cht59BOr<1
DfTB0+E)-?FD,5.E+*j%+CT=6@3BW*DJ*cs+CoV3E$043EbTK7/e&/0Dg>l9D/_X!+EM47GApu3
F'i?jDe*2tD..3k+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqSBOu'(G@_n5Ddd0!.!0BQA9Da..3N>B
FDi:1+Dtb7+Co1rFD5Z2@<-W9Ddmd!Ecu":BQ&);FD,5.E+*j%+DGm>@q]:gB4YU++B3#c+Co1r
FD5Z2@<-'nF!,.)G%De*AS#a%D.Ra#ARmD&$7QDk:-pQUDIn#7A8,OqBl@ltEd8*$DIn$&+=D,E
@<lg'DC6Q2+>Y-YA0<6I%13OO:-pQUDfB9*%17#a+=D,E@<lg'DC5l#%15is/g+tK@:UK/FDlG8
F_u(H%14d43\V[=+?Op2+EVOIA9Da.%13OO:-pQUA8,OqBl@ltEd8dADJ!g-D..O#Df-!kA8,S'
+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@^'_@;I'1DfTB0%166VFWbR?G9CR-G%De;Df'&.Bk1d`+E(j7
GA(E,+A,Et+DGm>@;Ka&@:F.tF=n\8D]ik-@<-6.D/XH++ED%%A0=K?6mm$uA8bt#D.RU,@<?4%
DBNA*A0>o8DBO%7AKYo5BOu3,8l%htCggdo/g*_t+F.mJ+D>2,AKYE!Gp%'HDdmNoD0%6NEHPi6
FD5Z2F!,CA+Cf>,E,8rsDKKqBE,9)oF(HJ*D..-p+Dk[4@<<W$@;BFpC1K=b5\FqBBl#D3Df#pj
%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-hH@<,jk+>PW*3"63D%15is/g+Y?Df]J4
@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%16igA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm
+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"
AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9
%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&
F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nn
DBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!
:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U
;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$C
AKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41
DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3
Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$
DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3
DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:X
AS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b
5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC
%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*
C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7
Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'
F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$=n*sATT%B;FOMQ
<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'
EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)$4R>;67sB/BkhQs.3N2BEc5tO+Dk\2
F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>
F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/
$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7
Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1
B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsH
C1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk
A90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56
DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@ji
Ec<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9
$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_u
G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]
/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf
+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7
%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B
+D5_5F`;CEBl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d$_$;No?+EDUB
+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7lu
EcaH*+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<
F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>+EqaEA9/1eBP0Ih+BplL
BP_X*C`lqC+FPjbB6%r#$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)
DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U
+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38
@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?
%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7
GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/
FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5
+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=
%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%
4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrK
ATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL
+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n
0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn
$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG
/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AU
BPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_
@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1
D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2
@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Ds=p+ED%:D]gDT
+CoCC+Dr<BATW'8DD!&CDIb@/$7KdC/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'nDETV#/oD+*
.1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I
4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$
+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa
%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//
F)sK*>p*>o0d/S5-8H#;%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9
E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-
4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\
3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n
+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!
Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)
ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A
4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn
$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*
+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-
0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<
-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT
/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDfZ?p
FEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X
+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rs4ZZjk4!6:6
,$uHS+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.B
C*7S-EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p
+C-E=/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*
Eb/a&DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8
ASlAq$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#
F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a
0ea%D%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5
ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MAS
Bl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"
E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1r
FD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?
+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q
@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1
+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,
E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[
+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67F
De'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5
-Z*F6-QlV91E^UH+=ANG$4R>WDe+!3ATD:!DJ!Tq@UX%-0ht%f.V`m4F`V,7@rH6sBkLm`CER[M
/KeVL@;Tt"AKXT@6m-VnATAo'Df00$B6A6'FD5Z2+EM%5BlJ/H%15is/e&._67sB[BPDN1+EM%5
BlJ/:BlbC>AU%crF`_2*+C\noDfTD38l%htDdmHm@ruc7+CT;%+CfG'@<?'k/g*`-%15is/g+Y4
DBND"+E_a:A0>u4+ED%(AS,XoAKYE!A0>B)F*)>;BmO>5G%#E*Dfp+D@r,RpF!,@=F`)7Q+B37g
$;No?+DkP&AKW+;BPDN1F(96)E-*3F@:OCnG%Dd=Eb0,sD.Oi(F<G[D+DPh*F`V,7@rH6sBkK&4
C3(M+DIa1`:-pQU@rH=3+DGpK+EqOABHVS=F`JU9A8-.,/0K%Q+EV:.+DkP$DBN\4A0>DsEb/a&
DfU+a%15is/e&._67sC0@:WneDKB&qASu("@;K1`De':a:-pQB$;No?+B3#c+Du+?DK?q:BleB-
A0>>mCi=M?@<,p%B5_^!+CehtA8,R_FCfM9AoD]4Eb/cmAnc-sFD5Z2/e&-s$;No?+EMC<F`_SF
F<DrGDe+!3ATD:!DJ!Tq/no'A+D#e/@s)m-DJ((E/hSL\$4R>;67sBW6q/;>ART+\EZf(6+DPh*
F`_>6+Cf4rF)rHU+CfP7Eb0-1+EM+9FD5W*+DGm>FD,5.A7]@]F_l.BA8-'q@ruX0Gmt*U67sBm
DfQtBBOr;fBl7I"GB4mMATDj+Df-\9AfsBMDdm9#;Is9IATBCG;Iso\F<G16EZf:BBOu3,:ddbq
Eb/ZiATDi$$;No?+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Z1.!R^0.9o/L
Ddm9_6"=qR@UX@$;Is9IATAn]6X3N#@:Wqi>X;k?Dc1+%1+m-_AL@oo%15is/g,1GF(KG98ge[&
:ddbqEb/ZiATAo8D]in*FCSu,8l%i&F!+:I7Nc__@:Wqi+>"^HD]iY1EZccF@rH7+Deru;AU%c8
%15is/g*tY7T*f+A7]dgC0s+b+AbHq;FNl>78dK$C2[X*FD5Pu%13OO:-pQU@;L$sEc,<-Bm+&1
7qcg^FE:r4BlJ/:@rH4'@<?3mCh4`0ART+\EX`@N67sBW6q1'C5t".>?X[\fA9E!.CgT=d-UTq"
:i^JeEa`f-7VQ[MF'M4KDf^#5F_tArF*;8/G?ed%G%kN31GURoG\&63$4R>;67sBWEb/ioEcP`%
+EqC++C]A0GB7>9+DG^9C2[X*FD5P6@r,RpF!*%WA7]@]F_l.B=(uP_Dg-7F7VQmS7W3MoA8-'q
@ruX0Gmt*U67sB^='%(_@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>YT-_Bl%To+@^'cAS,k*
>\7\jAS,k*/nK9=-OgCl$;No?+B)i]Df0)oEd8dOARZckEc6/CATAo-DBN\4A9E!.C`m5(@<6K4
/KeS8AmoguF<FY!DId[0F!,"-Eb/a&DfU+4$;No?+BMWG0je@(De+!4Bl%->3[[9U>YoHZB6%Et
+@^']ATM*JDKKH1DImo47<icfDfTE0>Y.@d:eXY_74q#274/NO%15is/g+,)G]Y'>A8-.(EZfIB
+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n
:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&EZccF
@rH7+Deru9AU%c8%15Nl6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3j
DJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgE"@;BF@@<6-m8l%iSATMs71,2Nj/h1^HCLoh@F(o,V
:IJ/nF*)IGF"JsdD..3k+A,Et+C\c#Bk&9-ATMr9F(96)E-*]A$;No?%15is/g+,,BlbD<@rc:&
F<G4-DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m,rIF(o+n$;No?+EV19
FE9&W<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqV[
:-pQU-t6V+ALSa<De!3lAKZ22FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC%15is
/e&._67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>+<Y04DKKo;
Ci!Zn+<Y-=%15is/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]
:/iYbAU%]rARoj)FD,4p$;No?+Du==@V'R&De:,6ATMs7+DG^9FD,5.-u*[2@UX=l@ru:'FE8lR
F*22=AM+E!:-pQB$;No?+CT>4F_t]23XlEk67sB'+:SZQ67sB'+>G;f5p0ZUDJ!TqF`M&(+A*be
Bl[cpFDl2F+FZpY6rZTR<"01067r]S:-pQUG%G]'@<?4#3ZrN_+E_a:+CoCO%15is/e&._67sB'
+AP6U+D58'ATD4$AKZ&(EbTK7%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<
-OgDX67sB'+ED<A-Z*:-AO9gHBk'b26r[`=FE8f=$;No?+:SZQ67sB'+AP6U+EDUB+DGp,$;No?
+<VdT0HiJ4.3L`fE+*j%+=DV1:IJ/N;cGD:@<6-m8l%iSATMs7/no'A-OgDX67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M0KBRL:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4
ASuT4-XpM*AL@ooCi<`m+=CoBA9;C(FCfJ?%16r\CLpF]DeioV:IJ/nF*)IY0ht%f.W&U0AQ*Ga
CLp+66r[`=FE8RG/M/)^@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&F=mnq67rU?67sB[BPDN1F(96)
E-*48ASu("@<?(%+CQC6@rc:&F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=HD/X3$$;No?+EV19
FE9&W<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqNG
67sB/@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16Eb/rtDK@E;:-pQ?
:-pQU<+ohc+EM7CAKW*<De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$
A0<"(Gm[;5/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYb
AU%]rARoj)FD,4m:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[X(D/X3$FCfN8F"&5QF_Pr/
/db??/db??/g+SDF*2>2F#jY'67rU?67sC(ATD6gFD5SQ$;No?$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*2/78M0KBJ867sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhpDe!p1Eb0-1+=CW,F(H^+Ci<`m
+=CoBA9;C(FCfJ?$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq
6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*<P1E\7lA7]p3%15p*5u^<L;GC(Q
3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>
+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&Ii
BleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A
%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg
05Y--DJsW.F"VQZF:ARlDe*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0A
Et&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+k
F=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%
9LV6G76N[ZC,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a$Nm0Jstf3&!65C,dn+-OgDN78QEJ
6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M
@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^
6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;
AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;)F"/hhN'
3%cn0+A,Et+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDCuA*:i^8gEZfO:EcYr5DK?q=
Afs\gD..3k+=Lu:Bl%@%.3N&B@;0Od@VfTuAo_g,+EMgLFCf;3F(96)E--.R%13OO8S0)jDfm1:
DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)
CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq
+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et
+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2
@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)j
Dfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ
@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc
%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%
F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/
B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#.1HW$@;]dkATMs.De*Bs
@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,
@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE3AMrk$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/
DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9
/oY?5%14Nn$;s;d76sj@4ZX]5C,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jjne3&!3;
%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi
+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y
:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cj
FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/S
A8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn
$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq
6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrE/ibOE3AVd0+Co&,-OgDZ9L2WI
:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!
3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'
F(KH9E%Yj>Et&I*%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jjne
3&!3;%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63
-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14Lu
De*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7
FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.
E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%
Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!
Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"
ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7
+?(o,GV;$/0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+Ad)mDfQs0$?g!$
F(oQ1F!,C5+A*bn@;BEs-u*@.Ch7Z:+CTG%Bl%3eCh4`$Ec5e;F*VhKASiQ2@rc:&FE9&D$4R>7
:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"
FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6
/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sI
C3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%ht
Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.
+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4
ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR
%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$3                                ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO20H`+n0f:(/3$9t1+>Yer0eje.1*A;*+>Yer0f'q/0d&20+>Pht0fL412BX_/+>Pht0f^@4
1a"M3+>YcF:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<rqF_PZ&C2[WsC3+N:A79Rk
F!+t2D/Ej%FCeu*C2[WsC3(M=@rc:&FE8R=DBN\4A7oUu+Co2,ARfh#Ed;>4F*)>@H"q8.8l%ht
@:WneDBNV,F*)>@GqO2`F<G:8+DkP-CLh@-DJ3a*FDl2FC2[WnDduC86psg<<D>nW<$5U[A8c?.
BPDO0DfU+UFEhmMBl5&1@<--oDg-)9@;BF@@<6-m8l%iSATMs7D..3k+A,Et+C\c#Bk&9-ATMr9
F(96)E-,r*CLpF]DeioV:IJ/nF*)J?@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&FDYH(BkCptFD>`)
8jQ,nD..<rAn?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-F@nhm+DkP)BkCptF<G16
EZdtM6psg<<D>nW<$5U[A8c@&@;]dkATMs.De*p-F`Lu'8jQ,nD..<rAn?%*+D,P4+A,Et;bpCk
6U`,+A7TUr                                                                ~>
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
zz=:zz,'0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SO'
zz=:zz,'GRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clf'
zz=:zz,'rbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntst'
zz=:zz,'amps dumptext dumptm dumptrailer dumpwords extscopes fap fmtdumptex'
zz=:zz,'t fromascii85 getallts getascii85 halfbits htclip jnb jscript jscri'
zz=:zz,'ptdefs makedump makegs masknb namecats nlfrrle nounlrep opaqnames p'
zz=:zz,'arsecode putallts rlefrnl sexpin sonl tabit toascii85 uqtsingle wra'
zz=:zz,'plinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNC'
zz=:zz,'OMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPU'
zz=:zz,'TDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR0'
zz=:zz,'54 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 E'
zz=:zz,'RR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR07'
zz=:zz,'3 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ER'
zz=:zz,'R084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093'
zz=:zz,' ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR'
zz=:zz,'103 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK0'
zz=:zz,'50 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK06'
zz=:zz,'2 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpf'
zz=:zz,'x allnlsfx apptable appwords badcn bnlsearch bnums checkntstamp che'
zz=:zz,'ckopen checkpath checkput closedict createst defwords delstuff delw'
zz=:zz,'ordrefs didstats dnlsearch freedisk freedisklinux freediskmac freed'
zz=:zz,'iskwin fullmonty getdicdoc getdocument getexplain getgstext getntst'
zz=:zz,'amp getobjects getrefs gslistnl inputdict invappend invdelete invfe'
zz=:zz,'tch invreplace islib iswriteable iswriteablelinux iswriteablewin jd'
zz=:zz,'atcreate jwordscreate loadalldirs loadallrefs loadwords mainddir ne'
zz=:zz,'wdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx ope'
zz=:zz,'ndict pathnl pathref putdicdoc putexplain putgs putntstamp puttable'
zz=:zz,' puttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub'''
zz=:zz,'),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ER'
zz=:zz,'R00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPS'
zz=:zz,'UITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK0'
zz=:zz,'0401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB '
zz=:zz,'WARNING00400 WORDTESTS addgrp addloadscript addloadscript1 allnames'
zz=:zz,' allrefs betweenidx createjodtools dayage delgrp firstcomment first'
zz=:zz,'period fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obn'
zz=:zz,'ames onlycomments pr refnames revonex today todayno updatepublic us'
zz=:zz,'edby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMAR'
zz=:zz,'K CWSONLY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 E'
zz=:zz,'RR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJO'
zz=:zz,'Dutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK02'
zz=:zz,'50 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDS'
zz=:zz,'MARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok compclut compj com'
zz=:zz,'pressj createut ctit de dewhitejcr dewhitejscript disp doc docct2 d'
zz=:zz,'ocfmt2 doctext docword ed et exobrefs gt jodfork jodhelp ljust obte'
zz=:zz,'xt pdfreader qt reb revo rm rtt textform2''                         '
zz=:6005{.zz
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
zz=:zz,'etests compjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00''),'
zz=:zz,'<(<''jodstresstests''),<0$a:                                         '
zz=:294{.zz
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
1E\P#-p0UR/mg=U-QkfK7nHZY+@K4(:eakY1a#4T6VgHU:J=2"78d#<0JahB76s=1;BSPW8l%ih
DKKH1Amo1\+A$lO:IJo7FCfK)@:NkI<'a8I5uL)n8U=!)7!*?cCi^^jH:gt$F`_>8FCfK)@:Njk
8l%iS:JXY_<_Yt)8l%iU9gg*u5snOG<*<$d+AY<n<Du7N<(.p*6:OsR6UOUJ+AY<n<Du7]7T^d4
78m/g5tt'B;BTF]ATT&(DJUG)DJXB*@<,jk+C]J-Ch.:!A7KOpE,oN2F(Jl)@WcC$A86$nFDl)6
F(9-*E,oN2F(Jl)@q]F`CMn69@:D#8@rH4'Eb0<5C*7#,ART[lC2[W*A7At_AftVr@r-()AKYN&
F(KG9A9Da.BOtU_ATAo)A0>H*+D58-DKKrA@;Ts+C2[X$DBNb.+Dbt)A7At_A8-',Ci<`mA8-',
Ci<`mDIXf*Ddd0sAS*'$Ddd0tFCB$*F!,:;@:XS#Eb'56DIIBn@psJ#+Du+?DJX?)E$0(.FCf]=
+E(d5E-682Ci"37+ED%0ARTXkC2[W*Ebuq>FEAXHATVC(Bl%<jBl\8;F`:l"FCf3*A7TCqFE2))
F`_>9DBO(@A79RkC2[X"@;]dkATMr9F`:l"FCf3*A92[3EarZkF_u)=-RgSp4?P\X?SNZN+C]5)
;f-GgAM>e\@rH4'C/\tfCLo1R+Cf>,E,&<gDeio<0d'tHART[lFCfN8A8,OqBl@ltEbT*++Co&)
FE2;FFCfN8A8,OqBl@ltEbT*++Co1s;f-GgAM>e\A8Z3^D/X3$0JFV\A5d>`CLo1R+D5M/@WPIb
DeioMF)u&.DD3au+Dbt)A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>4nSDdd0eF_u(rD/X3$0JFVc
Ddd0uATMrI0JR*P@ruF'DIIR2-RgSp4?P\X?SNZN+C]J-Ch.:!A0>W*A0>W*A7TUf+DPh*D..3k
+DPh*F*)>@AKY`+A9;a.Ci^_6De+!4Bl#.G/1<VC4"akp+=A:HDe*<cF(o-+ATMs7+DPh*@rc^5
BQRg,FE8R>De*ZmEbAs*ATMs7+DPh*F)>i2ATVL)FE8R>De*p2Eb0<5FCfN8F!iCf-p0UR/mg=U
-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,<@WQ+$G%G2QEcQ)=F!+q7Bl%<p
De*BmF*)G:@Wcd,Df-\,F_PZ&C2[WsC3(M2BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#C2[WlATMr9
C2[WnF_u(?C2[WsDKKo;+DPh*E,ol/Bl%?'C2[X*F(KB%Df00$B4>:b+DkP&AO9gHBk'b26r[`=
FE8RA@;BFQD/X3$8l%iSATMs7+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCpt
FD>`)F)Q2A@q@#:/1<V9+>kl!1,(F?0K:aB/iGXE0JGFC2)ud70JPL?3ANTI3&<<H2_ZsA2BXb/
0fLd@0KCaF3&!6N2E3TN+>PW*2)%!D1G1LB3&3EJ0K1^/1,(F?0K1aH/iGRE3&icR2)ud70JPF=
2_[!>2D[9I0f1jJ1*A>+0f:XD1,LUA2*!EP2*!HQ+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1[@
/iGLE1,1UF2DQC10JPF=2_[!>2D[9I1,Ca@1a"P-0f:XD0JY7=1H.'D2)@*K+>PW*2)$sE3%d*J
3B/iL3&<?51,(F?0K1^F/i,IA3&icM2`2^50JPF=2_d6D1b^gI1,LgC0d&5*0f:XD0fL^@3&*ER
1b^jD+>PW*2)$sE0eP7?1bq$K0f1g31,(F?0K1aD/iGI?0f:mM1H?R50JPF=3&!6C1c@9H2Dm3J
1a"P-0f:XE0Jb=<1GUXC2`W]L+>PW*2_[$A1G1UD1bpaF1GUp41,(FA0JbC=/iPXE1-%<R1GU(.
0JPF=2_mBG1H.0O1-%$H0d&5*0f:XD0fL^@3&NKP2DR9P+>PW*2)$sE1G1LC1,CdD1,Um21,(F?
0K:aB/i5=@1H%$H1-$I40JPL?2)-s@2)$gC1bpsE2BXb/0fLdD0f:R@0JbOB1,^mG+>PW*2_[6I
3A*9I1,LpD1,Uj11,(F?0K1aH/i,F?1,CdJ0f'q-0JPI>1GL^=1c.'J2`WlP2]sk00f:XD0K(O?
1c7'L1-%3H+>PW*3&!0C2_HpF2)%!E0fUm11,(F?0K1^F/i5FD3ArlP2)cX50JPL?2)-s@2)$gC
1bpsE2BXb/0fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD2DR051,(FA0JtRB/i>==1c-sG
1,^710JPL?2)-s@2)7!K1H%$I2]sk00fLdD0f:R@0JbOB1,^mG+>PW*2_[*D2(ga?1GgpD2DR05
1,(FA0JtRB/i>==1c-sG1,^710JPF=2_m?F2DmEM1GUdG3$9t10f:XE0Jb=;2`3KJ1bgsM+>PW*
2)$sC1+kIA1GgmD0K(m51,(FA0JbC=/iPXE1H70G0K(%/0JPF=2_d6D2)7*N2Dm0J+>PW*2)$sD
2_HsC2`3BO1c7*41,(FA0JbF?/iYgF2`!BJ1,0n,0JPL?1GL^=3&iWN1GUdF2BXb/0fLdB0Jb=?
2)I0I1H%$I+>PW*2_[$A1G1UD1c@3N1Gq'51,(F?0K:aB/iGXE0JGFC2)ud70JPL?3ANTI3&<<H
2_ZsA2BXb/0fLd@0KCaF3&!6N2E3TN+>PW*2)%!D1G1RF1,UjJ1,_-81,(F?0K1aH/iGRE3&icR
2)ud70JPO@1b^j@1c@?R2Dd9H2'=Y.0f:XD1,LUA2*!EP2*!HQ+>PW*3&!0C2_HpF3B/oR2)7$3
1,(FB0JkIB/i5IH3&WTN1,U100JPO@1b^j@1c@?R2E<cT1E\G,0fUjD0K1U@2E<`T1cHO40JPF=
2_m?F2E*WU1b^mF1E\G,0f:XD0fL^@3&*BP2).$I+>PW*2)$sD2_Hp@2E3HK1bpd.1,(F?0K1^F
/i,IA3B8oM2_lL20JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,pmE2)[6L1Gq!E+>PW*2)%!D2D-pB
1Gh!D0f(d31,(F?0K:aE/i5LE2)@6I0eje+0JPL?1GL^=3&rcO3A`HH1E\G,0fLdB0f1LC0ekF?
1,CgD+>PW*2)$sE3A*-G2D[$F1b^[-1,(FA0JYCB/iYaF1c@6L1,g=20JPF=2_m0A1cI0G2)@!F
1a"P-0f:XE0et@>0fC^>0JG:>+>PW*2_[*D2D-pI1bppC3&;[40JPL?2).!A2`EQK0fV$K1E\G,
0fLdH1-$sH1GUdG0JYLA+>PW*2)$sE3A*-G2Dd3D3&<B61,(FA0JP7A/iYgF2DI!F1bg+.0JPF=
2_[-B1c.'G3ANTP0d&5*0fUjD0K1U@2E<KL2E<TM+>PW*2)$sD2_HpE2E<ZU0f:m41,(FA0JtRC
/iP^G0fUjC1,C%.0JPL?2).!A2`EQP1c$sB1a"P-0fLdD0fCXC2`39K2_m9M+>PW*2_[*D2D-pI
2)@-L3B/o>1,(FA0JtRC/iP^H2E!<G2E;m80JPL?2).!A2`EWO3&!3G1E\G,0fLdD0fCXC2_[!D
3AN9E+>PW*2_[*D2D-pJ1GCgD2`NW:1,(F?0K1aH/iGRG1c$mD2`Mp80JPF=3&**>1H73H2)[9M
0d&5*0f:[>0JtI?3A<EL1,h$F+>PW*2_[$B1bLdB0KCmB2_[361,(F?0K1aA/i5IF0JYRG1GL"-
0JPF=2_d6D2)7*J1H@9L1a"P-0fLdB0f1LC0eb@@1,1IB+>PW*2_[$B1bLdC2`NWS3&WK61,(FA
0JbC=/iP[I1GLmE3ADX30JPL?1GL^=3AE<L2`NKK2^p:+4>J$61F+_00f:XD1GLL?2)I$I1bpjG
+>PW*2)$sD2_HpC1-%3P2`<Z=1,(F?0K1aA/i5FF0f(RD1c-=10JPL?2DQs=2E*HL1,UmG1E\G,
0fLdE1,(==2`*9L2_m3I+>PW*2)$sC3A*0F0K:pG1-%<:1,(F?0K1a@/iPXD1H@EQ1c?I30JPF=
2_mBG1cI<L1-%?M0d&5*0fLdD0f:R@0fUpC3A`NK+>PW*2)%!D2D-jE1cREK3&WW:1,(F?0K:aE
/iGUG2D@'H2)HF20JPF>0JG@:2D@'K2`<?J1a"P-0fLdE1,(==2`*EL1b^pL+>PW*2)%!D2_I$C
2DdBP0JbX11,(F?0K1^F/i5FC2D@!K3&Da50JPF=2_m-@1cR3G2`3TM1a"P-0fLdE1,(==2`*?H
2)I0H+>PW*2_[-F0J57B1bq$L1,Lj21,(F?0K1[G/i>FA0f1mE0K(%/0JPF=2_m'>3&!?P0etX@
2'=Y.0f:XD1GCF;2Dd-K1H%'H+>PW*2_[*D2(gaA2`<QR3ANB51,(F?0K:aE/iG^D0f(R@0fC.0
0JPF=3&!6C2E<HG2`EKM3?U(20f:[>0JtI@1,CdC1c@$G+>PW*2_[-F0J57B1c@0I0KD*A/1<V9
+?(Q$0JPL?1GCU;2`3EP3AEEP1*A>+0f:XD0K(O?2)dEQ2DR'J+>PW*2)$sC2D-gD1GUsG3AiN6
1,(F?0K1[D/i5IC0JPC<1,g=20JPF=2_[-B1c.*K1GCaC2]sk00f:XD0K(O?2E!6I3&<EN+>PW*
2)$sC2D-gE2_d<I0K1s61,(FA0JbF?/iYgG1,1[A0eje+0JPF=3&!-@2E*HJ2Dd6L3?U(20f:XE
0Jb=<1,^mG1,CmF+>PW*2_[6I3A*9I1,V$N0JbI,1,(F?0K:aB/i5IG1H%$J3Ahp70JPF=2_[-B
1c@6G2E3KM2]sk00fLd@0KCaF3&*9G2`EHN.4cl01*AG"1,(F?0K1[G/i5FE0fUsF2)cX50JPF=
2_[6E1c7*H0JYXE3$9t10f:XD0KCaB2)I!I1c[QV+>PW*2)$sC3A*-G1H@6K2`3E71,(F?0K1[G
/i5FB1,(^B2DZI20JPF=2_mBG2D[?I2D@'D2BXb/0f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G
1b^pH3B9)B1,(F?0K1aI/iGLE0f(R>1GL"-0JPF=2_[6E1c7*F0KCgF1FXk'4>J$62^C.40f:XD
0JY7=1H.'E1GCgD+>PW*2)$sC1+kI@2_m-F1H@H<1,(FA0JtR?/i>XI3&r`K2`)X40JPL?1GCU;
2`EQQ3&<?J2BXb/0f:XD1,1C>3&*6G2`EZU+>PW*2_[*D2(gaA2`N]P0Jst.0JPF=2_[$?3B9#V
1,1I?1*A>+0fUjC0Jb=<1cREK3&!?81,(FB0JbC=/i5CE2DHmA3Ahp70JPO@1GCU;1c.$I0ek@B
3?U(20fLdD0et@=3ANKQ1,LdA+>PW*2_Zs?3A*9N3&3EN2D[-31,(F?0K1^?/i5:B3B8uU1c$70
0JPF=2_d!=1bgjD2D[-I3$9t10f:XD0JY7=1H.'D1c[NT+>PW*2)$sC1+kI@2_m*F0K1+00JPF=
2_[!>2D[9I0f:X@1E\G,0fUjD0K1U@2E<`T3B&l>1,(FB0JkIB/i5IH3&`NJ3&Mg60JPL?2)-j=
2*!ZQ1GC[@0d&5*0fLdB0f1LC0fUjC2E!BJ+>PW*2)$sE0eP@D0fV-J2DlU40JPO@1b^j@1c7*L
2)I!B2BXb/0fLdB0et@=3B9#U0f1j41,(FB0JbC=/i5CE2_d9G3?U(20fUjC0Jb=<1cRBJ0Jb^H
+>PW*3&!-B1G1L@3&iZK2)@-51,(FB0JbC=/i57B1c[BK1a"P-0fLdA1,U[A2E*HH1c%$G+>PW*
2)$sD0J51<0JY==2Dd-21,(F?0K1^?/i5:@2)$gC3&Mg60JPO@1b^j@1c@?R2Dd9H2'=Y.0fUjD
0K1U@2E<`T1cHO40JPO@1b^j@1c@?R2Dd?A/1<V7.4cl00I\P$4>838-p014/3GT          ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
