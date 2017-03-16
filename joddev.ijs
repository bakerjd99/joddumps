NB. JOD dictionary dump: 15 Mar 2017 21:25:07
NB. Generated with JOD version; 0.9.992 - dev; 23; 15 Mar 2017 21:21:11
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

EDCONSOLE=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.992 - dev';22;'15 Mar 2017 21:21:12'

JODVMD=:'0.9.992 - dev';23;'15 Mar 2017 21:21:11'

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

    NB. define nouns
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
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
0fUm11G^./+?:Q&2BXn#1,g=11a"\4+>P\p1,g=10H`/-+>Gbs1,C%-0d&8,+>t>t1*AS"2_uR:
+>Y_p3?U1>+?:Q#2'=V-+>Ybq1a"V0+?:Q'2BX_6+>bu!1,C%12'=V.+>bks3?U47+?:Q#0d&4o
1,C%.+?:Q!0H`2-+>P&p1E\\#1bp15+>ttt2BXe3+?1K"2BX_.+>Pbr1*A>++>Y,p3?U%8+>bks
1,'h,3(65&:JOha9LX&7G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+DPD)DKB`4
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
Ed8dG@VTIaF<G(6ART[pDf-\@ATD6kA7]:cF<G+.@ruF'DIIR2+E(_(ARfh'ATVKoBlkJ>AU&<0
ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aQ4B5M'mAKYE!
A0>],@:UKQ:IH=<Ec6)>Ci<`mGAhM4F)5c'A9/l(Bk)7!Df0!(Gp%<LEb'56Bl8$2+EV%4B4Z0-
Ci<flCh7[*Dfor6Eb03"Df0`0Ecc@FDJsZ8F!,OGDfTE"+CT=6@VK^gEd8dLD]ik1DIm6s+EV1>
F<GU8E,oN2ASuTuFD5Z2F)PN0AU&<*F)to0@VfUs+CT.u+ED%8F`MA@+E(_(ARfg)FCf]=E-682
Ci"37E-68D+CT)&+EV=7ATMs%D/aP=/Kf+GAKWC6ATV?sCij_IEb0&u@<6!pDe*HoDII?(8l%ht
Eb03+ARTXk+EMX9E-$&:Ecl8@+A*bn@:O=r+EM%5BlJ08EccDDF`)7C8g&4eF*&OG@rc:&FE;SD
A79RkC2[X"@;]dkATMs7ATT%e:IH=6A7TUrF!,=.DJ<]oF*)IGFDi:3F`MM6DKI"EATDj+Df0]:
A79RkC2[X(Dfp)1ARoq#E-$/@A79Rk+D,>(ATJu.DBMPI6rQl];F<kqA8-+,EbT!*FD5Z2    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&Da40H`+n0ea_)0fM'G+>GVo1,(O?+>GVo1,h-J+>GPm0ekF=+>GPm1,LaD+?:Q!2_d!/0f^@2
0K1m40f1"-0fD$70f1"-1GLR+0f:(.0f_%!DJW6gDeio<0MXqe.Um:3;f-GgAM>e\F=f'e-t7(1
.3N&>B6A'&DKI"BD/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4n
FCfN8C2[W:.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#AmC2dU'BHS[O8l%iS
78m/=FCfN8C2[W:-OgDX67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JPG"F_iig%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV
-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG
@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;R
Deip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<.3L]5-ZW]>
Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j5U[k++?hhO-p8n)-RU8j.1HUn$;No?+D58'
ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%13OO:-pQUF(8m'
4ZX]L3b^2h1E[f867sC%ARTUhBHV;;@;KXiBk;=+%15is/g+nH@m)jq+<Ve@/g)tn+AP6U+A*c#
DfTA2DIIBn+Cf4rF)qct%15is/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE7lu:-pQU+<VdqCh[Ek
A0<!;6tp.QBl@ltEd:#jA7]g)+<VdL+<VdpBk)7!Df0!(GscL\ATLd]@<,jk+<VdL+<Ve.DfTAe
ARTUhBM)$.D.Q(N@<6K4+<VdL+<VdL+AH9SEc4lf@<,jk9jqOPDfg8DAISuA67sBs@<-!D3Zoh5
BeD(g+=nW`4<cI%:I7ZB6W?fJ?X[\fA7$c./0H>lHRMZV8ju*H:.&AsC2[Wi.6DT\BQ5ID/0H>l
HRLFH:JsSf@;9^k?R\'X@q]jDBeCMb.3L/a-nK]n/58Dt;GUY.C2[Wi.6DT\BQ6+.5snOG<*<$d
?X[\fA7$bp$4R>;67sC(@;KXg+ED1/BQP@FGpskEEbBN3ASuT4E+*j1ATD[0%15is/g)8Z+D#D/
FEnuO@UWb^F`:i.F<D\K@;KaoDIR$aCNXS=+DkP/@q]mo@qBP"+<VeD@<?!mBl7Bg@r$4+%15is
/g,1CEb@Nr+=ANZ+?L\g-S?bh+<VdL+<W`g-SAnIF`):K+?L\g+=D&8D.P(;+<VdL+?L\nDIIBn
/n8gBDKI68$4R>;67sBmDfT]'FE8R5Cht5;@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%15is
/g)N:67sB.+=n]k+<W`i0d%Z$-8%J)0d&.m1*Cof0d%T&+=K?"+C]5)+=AT\/0IVI+>Fui+F>4Z
4D\GHB.4rS+?XXdDffP;/j:Cu@<,ui$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OgCl$;No?
+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")
CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBlEaa$#+CT/5
+C\bhCNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD+>G!LBlY=_
5tbQl6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2D]iLt@r$4+
F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)+=Act-OgCl
$;No?+CfG'@<?''FD,]+AKYGj@r$4+Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!ZmFD5Z2+>"^I
D/aTB%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-
+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6lA0<7AATMs.De(OL%143e
$;No?+EV:2Eb$;2@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-Gg
ATVL)F>4434tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%Df'&.@UX=l@j#K'G%#3$A0><$B6A'&
DKKqB/KeVLE+NO$ARlopEcQ)=%16uaEZeh/C`k)X@4)KkDImi21a$7FC`k)X/MSU^$>sEq+>P'K
DJUFC/hSL\$>sEq+C]5)+>=63DImi2@W$!)4=;Kc$4R>;67sC%Df'&.@UX=l@j#JrASuU(FD5<-
+:SZ+@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-Qij*-nlcQDJUFC-Rg/i3Zp+!@W$!)4#)(9+C]5)
+=Ach+:SZ+0d'qCC`k)Q.3L3'+>G!JDJUFW0mbVt@W$!)-S?bh%14L=+C]5)+=ANc+>#Vs1*C%D
C`keoHSQ^QDJUFC/ghbN$7I\Q@W$!)-RU>c/NP"1+C]5)+?M<)1E^.EC`k)X-Qij*-o<&UDJUFC
-Rg/i3Zp7%@W$!)4#)(=+C]5)+=Ach+:SYe$;No?+<Y-2C`k)X-OgDH0RI8HC`k)X-Qij*1a"q(
,@YP,-S?bU$4R>O@:X7uD*9p&-S?bh/0H,t+>GYp.j-#g+=K<+HX^l/+=Ach.3L2p+=Ach%13OO
:-pQUAn?'oBHUo-Df$U>DJsE(G\M5@ASuT4@UWb^F`8HT+D#S6DfQt3G]75(FCetl$>sEq+C]5)
+C\biDKTe*$>sEq+>=pIDJUG)@:X7uD%-hiATAnJ+C]5)+C\biDKTe*$>sEq+>P'KDJUG)@:X7u
D%-hiATAnL+C]5)+C\biDKTe*$>sEq+>b3MDJUG)@:X7uD%-g]$;No?+AH9^Gp%$;+ED%1@;0Un
DJ()6ATMs7+CfG+FD55nCi"A>A7]^kDIal.DBO%7AKYf-@:Wq[+E(_(ARfh'/e&._67sBPAfu2/
AKYf-@:UL%D/X3$+EV19F<GX7EbTK7F!+n3AKYJr@;]^hA0>;'Ci=D<De:,6BOu6r+EV19FE7lu
:-pQUD09oA+C\n)Eb0E.F(Jl7+:SYe$;No?+<Y-2C`k)Q%14LoDJUFC-Rg/i3ZqmLC`k)Q%13OO
:-pQU+C]5)+=AdODfor>-OgD2@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-OgCl$;No?+<Y-2C`k*C
@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'+C]5)
+=BKO:J<,F$4R>;67sB'@W$!)-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,
/NP"`DJUFC8PW54/3>V6@W$!0/gh)8%15is/g)hj@W$!)-RT?1-nlcSDJUFC-Rg/i3ZoP!+C]5)
+=ANG$4R>;67sB7+C]5)+=Ach%14LmDJUFC/gi(j/NP".+C]5)+=Ach%13OO:-pQU0HahBC`k)X
@rHL-F=.M)-nlcSDJUFC-Rg/i3Zp+!@W$!)4#)(kDJUFC/gh)8%15is/g)hj@W$!)-Z3@0AL@oo
-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP".+C]5)+=BKO
:J<,F$4R>;67sB7+C]5)+=D&8D.P>0Dfor>-OgD20fpaS:/jMY:JEMj4"!Tp<)c.M9LU<X+>#Vs
0HahBC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>G!JDJUFC-OgD20fpb(D/X3$0N;V)F>,((-Za-C
CLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k)Q%13OO:-pQU0d'qCC`k)X-OgD2@W$!)
-S?bq+>#Vs0d'qCC`k)X-OgCl$;No?+>G!JDJUFC/n8gBDKI68$7IVj-Za-CCLo2!ATMrI-Rg/i
3Zp."@W$!)4#2.lDJU[Q-OgCl$;No?+>G!JDJUFCDIIBn-OgD20fpb(D/X3$0iV_*F>,((-Za-C
CLo5"ATMrJ-Rg/i3Zp."@W$!)-Za-CCLo4J%13OO:-pQU0d'qCC`k*C@;TR.@rHL-F=.M)-o!e2
F)>i2AM@(pF*')`.3L3'+>G!JDJUFCF)>i2AM>J_4#2.lDJU[Q-OgCl$;No?+>P'KDJUFC-OgD2
0fpalDf9H5D/X3$0IJq0@W-1$F)>i2AMGPo-Y[I?F)>i2AM>Jn-Y[I?F)>i2AMGP]+>#Vs1*C%D
C`k)Q%13OO:-pQU1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*C%DC`k)X-OgCl$;No?+>P'KDJUFC
/n8gBDKI68$7I;b0e"Y90I1'f.3L3'+>P'KDJUFW1OESKCaUh_%13OO:-pQU1*C%DC`k*C@;TR'
%14L<4""`[FE;;;CLo4J.3L3'+>P'KDJUFCBl8$6D/X3$0ddD;%15is/g)nl@W$!)-Z3@0AM.J2
F`):K%14L<4""KUDesK3Deio<-Rg/i3Zp1#@W$!)-Xq"4CaUbq14*JJC`k)X-OgCl$;No?+>Y-L
DJUFC-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.ECaUS>$4R>;67sB:+C]5)+=Ach%14LmDJUFC
/gi(j/NP"1+C]5)+=Ach%13OO:-pQU1E^.EC`k)X@rHL-F=.M)-o!e2F*22=ATM^,CLo4J.3L3'
+>Y-LDJUFW0mdAICaUh_%13OO:-pQU1E^.EC`k*C@;TR'%14L<4"#)lBlmp-D/X3$0deCm/NP"1
+C]5)+=D5Q-OgCl$;No?+>Y-LDJUFCDIIBn/n8gBDKI68$7I;b0e"Y90I1'f.3L3'+>Y-LDJUFC
F*/i]4#2.lDJU[Q-OgCl$;No?+>b3MDJUFC-OgD20fpb(D/X3$0MPtcEc3WZ4"#)dDeio<9jqOP
D_WV$-Za-CCLo4p@:O=r0IJq0F)>i2AMHnf@rcKB-Rg/i3Zp7%@W$!)-RT?1%15is/g)tn@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp7%@W$!)-S?bU$4R>;67sB;+C]5)+=AdODfor>-OgDX67sB;+C]5)
+=D&8D.P(($;No?+>b3MDJUFCDIIBn/n8gBDKI68$;No?+>=om+C]5)+=ANG$4R>;67sB7+>G!J
DJUFC/gh)8-t7(1+=Ach.3L3'+>=om+C]5)+=Ach%13OO:-pQU0H`(m@W$!)-SAnIF`):K%15is
/g)hj0d'qCC`k*C@;TR'%15is/g)hj0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n@W$!)-RT?1
%15is/g)hj1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n@W$!)-S?bU$4R>;67sB7+>P'KDJUFC
/n8gBDKI68$;No?+>=on+C]5)+=D&8D.P(($;No?+>=on+C]5)+=D&8D.P>0Dfor>-OgDX67sB7
+>Y-LDJUFC-OgCl$;No?+>=oo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y-LDJUFC/gh)8%15is
/g)hj1E^.EC`k)X@rHL-F=.M):-pQU0H`.o@W$!)-Z3@0AL@oo:-pQU0H`.o@W$!)-Z3@0AM.J2
F`):K%15is/g)kk0d'qCC`k)Q%13OO:-pQU0d&1n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."0d'qC
C`k)X-OgCl$;No?+>Fun+C]5)+=AdODfor>-OgDX67sB8+>G!JDJUFCDIIBn-OgDX67sB8+>G!J
DJUFCDIIBn/n8gBDKI68$;No?+>Fuo+C]5)+=ANG$4R>;67sB8+>P'KDJUFC/gh)8-t7(1+=Ach
.3L3'+>Fuo+C]5)+=Ach%13OO:-pQU0d&4o@W$!)-SAnIF`):K%15is/g)kk1*C%DC`k*C@;TR'
%15is/g)kk1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0d&7p@W$!)-RT?1%15is/g)kk1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs0d&7p@W$!)-S?bU$4R>;67sB8+>Y-LDJUFC/n8gBDKI68$;No?+>Fup
+C]5)+=D&8D.P(($;No?+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>G!JDJUFC-OgCl$;No?
+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>G!JDJUFC/gh)8%15is/g)nl0d'qCC`k)X@rHL-
F=.M):-pQU1*A:o@W$!)-Z3@0AL@oo:-pQU1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)nl1*C%D
C`k)Q%13OO:-pQU1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#1*C%DC`k)X-OgCl$;No?+>P&p
+C]5)+=AdODfor>-OgDX67sB9+>P'KDJUFCDIIBn-OgDX67sB9+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>P&q+C]5)+=ANG$4R>;67sB9+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>P&q+C]5)+=Ach
%13OO:-pQU1*A@q@W$!)-SAnIF`):K%15is/g)nl1E^.EC`k*C@;TR'%15is/g)nl1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU1E\Cp@W$!)-RT?1%15is/g)qm0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
1E\Cp@W$!)-S?bU$4R>;67sB:+>G!JDJUFC/n8gBDKI68$;No?+>Y,p+C]5)+=D&8D.P(($;No?
+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>P'KDJUFC-OgCl$;No?+>Y,q+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"1+>P'KDJUFC/gh)8%15is/g)qm1*C%DC`k)X@rHL-F=.M):-pQU1E\Fq@W$!)
-Z3@0AL@oo:-pQU1E\Fq@W$!)-Z3@0AM.J2F`):K%15is/g)qm1E^.EC`k)Q%13OO:-pQU1E\Ir
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1E^.EC`k)X-OgCl$;No?+>Y,r+C]5)+=AdODfor>-OgDX
67sB:+>Y-LDJUFCDIIBn-OgDX67sB:+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+C]5)+=ANG
$4R>;67sB;+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+C]5)+=Ach%13OO:-pQU1a"Lq@W$!)
-SAnIF`):K%15is/g)tn0d'qCC`k*C@;TR'%15is/g)tn0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
1a"Or@W$!)-RT?1%15is/g)tn1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or@W$!)-S?bU$4R>;
67sB;+>P'KDJUFC/n8gBDKI68$;No?+>b2r+C]5)+=D&8D.P(($;No?+>b2r+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Y-LDJUFC-OgCl$;No?+>b2s+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y-L
DJUFC/gh)8%15is/g)tn1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs@W$!)-Z3@0AL@oo:-pQU1a"Rs
@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&.m@W$!)-RT?1%15is/g)hj0d&.m@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!0d&.m@W$!)-S?bU$4R>;67sB7+>Fum+C]5)+=AdODfor>-OgDX67sB7+>Fum
+C]5)+=D&8D.P(($;No?+>=om+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=om+>G!JDJUFC-OgCl
$;No?+>=om+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>G!JDJUFC/gh)8%15is/g)hj0d&1n
@W$!)-SAnIF`):K%15is/g)hj0d&1n@W$!)-Z3@0AL@oo:-pQU0H`(m0d'qCC`k*C@;TR.@rHL-
F=.M):-pQU0H`(m1*C%DC`k)Q%13OO:-pQU0H`(m1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m
1*C%DC`k)X-OgCl$;No?+>=om+>P'KDJUFC/n8gBDKI68$;No?+>=om+>P'KDJUFCDIIBn-OgDX
67sB7+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fup+C]5)+=ANG$4R>;67sB7+>Fup+C]5)
+=Ach%14LmDJUFC/gi(j/NP".+>Fup+C]5)+=Ach%13OO:-pQU0H`(m1E^.EC`k)X@rHL-F=.M)
:-pQU0H`(m1E^.EC`k*C@;TR'%15is/g)hj0d&7p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A7n
@W$!)-RT?1%15is/g)hj1*A7n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A7n@W$!)-S?bU$4R>;
67sB7+>P&n+C]5)+=AdODfor>-OgDX67sB7+>P&n+C]5)+=D&8D.P(($;No?+>=on+>=pIDJUFC
DIIBn/n8gBDKI68$;No?+>=on+>G!JDJUFC-OgCl$;No?+>=on+>G!JDJUFC/gh)8-t7(1+=Ach
.3L3'+>=on+>G!JDJUFC/gh)8%15is/g)hj1*A:o@W$!)-SAnIF`):K%15is/g)hj1*A:o@W$!)
-Z3@0AL@oo:-pQU0H`+n0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1*C%DC`k)Q%13OO:-pQU
0H`+n1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1*C%DC`k)X-OgCl$;No?+>=on+>P'KDJUFC
/n8gBDKI68$;No?+>=on+>P'KDJUFCDIIBn-OgDX67sB7+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX
67sB7+>P&q+C]5)+=ANG$4R>;67sB7+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&q+C]5)
+=Ach%13OO:-pQU0H`+n1E^.EC`k)X@rHL-F=.M):-pQU0H`+n1E^.EC`k*C@;TR'%15is/g)hj
1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\@o@W$!)-RT?1%15is/g)hj1E\@o@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp+!1E\@o@W$!)-S?bU$4R>;67sB7+>Y,o+C]5)+=AdODfor>-OgDX67sB7
+>Y,o+C]5)+=D&8D.P(($;No?+>=oo+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>G!JDJUFC
-OgCl$;No?+>=oo+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>G!JDJUFC/gh)8%15is/g)hj
1E\Cp@W$!)-SAnIF`):K%15is/g)hj1E\Cp@W$!)-Z3@0AL@oo:-pQU0H`.o0d'qCC`k*C@;TR.
@rHL-F=.M):-pQU0H`.o1*C%DC`k)Q%13OO:-pQU0H`.o1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`.o1*C%DC`k)X-OgCl$;No?+>=oo+>P'KDJUFC/n8gBDKI68$;No?+>=oo+>P'KDJUFCDIIBn
-OgDX67sB7+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,r+C]5)+=ANG$4R>;67sB7+>Y,r
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,r+C]5)+=Ach%13OO:-pQU0H`.o1E^.EC`k)X@rHL-
F=.M):-pQU0H`.o1E^.EC`k*C@;TR'%15is/g)hj1E\Ir@W$!)-Z3@0AM.J2F`):K%15is/g)tn
0d&5++C]5)+=ANG$4R>;67sB;+>Fuo0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,0n\DJUFC
/gh)8%15is/g)tn0d&5++C]5)+=AdODfor>-OgDX67sB;+>Fuo0d'qCC`k*C@;TR'%15is/g)tn
0d&5++C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1*C%DC`k)Q%13OO:-pQU1a"Lq1,9t]DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2q+>P\p@W$!)-S?bU$4R>;67sB;+>Fuo1*C%DC`k)X@rHL-F=.M)
:-pQU1a"Lq1,9t]DJUFCDIIBn-OgDX67sB;+>Fuo1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq
1,C%^DJUFC-OgCl$;No?+>b2q+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5-+C]5)+=Ach
%13OO:-pQU1a"Lq1,C%^DJUFC/n8gBDKI68$;No?+>b2q+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Lq
1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-RT?1%15is/g)tn0d&5.+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo1a$7FC`k)X-OgCl$;No?+>b2q+>Pbr@W$!)-SAnIF`):K%15is
/g)tn0d&5.+C]5)+=D&8D.P(($;No?+>b2q+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5/
+C]5)+=ANG$4R>;67sB;+>Fuo2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,U1`DJUFC/gh)8
%15is/g)tn0d&5/+C]5)+=AdODfor>-OgDX67sB;+>Fuo2'?@GC`k*C@;TR'%15is/g)tn0d&5/
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2BZIHC`k)Q%13OO:-pQU1a"Lq1,^7aDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>Pht@W$!)-S?bU$4R>;67sB;+>Fuo2BZIHC`k)X@rHL-F=.M):-pQU
1a"Lq1,^7aDJUFCDIIBn-OgDX67sB;+>Fuo2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,g=b
DJUFC-OgCl$;No?+>b2q+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&51+C]5)+=Ach%13OO
:-pQU1a"Lq1,g=bDJUFC/n8gBDKI68$;No?+>b2q+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Lq1,g=b
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Po!@W$!)-RT?1%15is/g)tn0d&52+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo3$;[JC`k)X-OgCl$;No?+>b2q+>Po!@W$!)-SAnIF`):K%15is/g)tn
0d&52+C]5)+=D&8D.P(($;No?+>b2q+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>,+C]5)
+=ANG$4R>;67sB;+>P&p0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,0n\DJUFC/gh)8%15is
/g)tn1*A>,+C]5)+=AdODfor>-OgDX67sB;+>P&p0d'qCC`k*C@;TR'%15is/g)tn1*A>,+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1*C%DC`k)Q%13OO:-pQU1a"Or1,9t]DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2r+>P\p@W$!)-S?bU$4R>;67sB;+>P&p1*C%DC`k)X@rHL-F=.M):-pQU1a"Or
1,9t]DJUFCDIIBn-OgDX67sB;+>P&p1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,C%^DJUFC
-OgCl$;No?+>b2r+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>.+C]5)+=Ach%13OO:-pQU
1a"Or1,C%^DJUFC/n8gBDKI68$;No?+>b2r+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Or1,C%^DJUFC
DIIBn/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-RT?1%15is/g)tn1*A>/+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>P&p1a$7FC`k)X-OgCl$;No?+>b2r+>Pbr@W$!)-SAnIF`):K%15is/g)tn1*A>/
+C]5)+=D&8D.P(($;No?+>b2r+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>0+C]5)+=ANG
$4R>;67sB;+>P&p2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,U1`DJUFC/gh)8%15is/g)tn
1*A>0+C]5)+=AdODfor>-OgDX67sB;+>P&p2'?@GC`k*C@;TR'%15is/g)tn1*A>0+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>P&p2BZIHC`k)Q%13OO:-pQU1a"Or1,^7aDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2r+>Pht@W$!)-S?bU$4R>;67sB;+>P&p2BZIHC`k)X@rHL-F=.M):-pQU1a"Or1,^7a
DJUFCDIIBn-OgDX67sB;+>P&p2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,g=bDJUFC-OgCl
$;No?+>b2r+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>2+C]5)+=Ach%13OO:-pQU1a"Or
1,g=bDJUFC/n8gBDKI68$;No?+>b2r+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Or1,g=bDJUFCDIIBn
/n8gBDKI68$;No?+>b2r+>Po!@W$!)-RT?1%15is/g)tn1*A>3+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>P&p3$;[JC`k)X-OgCl$;No?+>b2r+>Po!@W$!)-SAnIF`):K%15is/g)tn1*A>3+C]5)
+=D&8D.P(($;No?+>b2r+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G-+C]5)+=ANG$4R>;
67sB;+>Y,q0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,0n\DJUFC/gh)8%15is/g)tn1E\G-
+C]5)+=AdODfor>-OgDX67sB;+>Y,q0d'qCC`k*C@;TR'%15is/g)tn1E\G-+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Y,q1*C%DC`k)Q%13OO:-pQU1a"Rs1,9t]DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2s+>P\p@W$!)-S?bU$4R>;67sB;+>Y,q1*C%DC`k)X@rHL-F=.M):-pQU1a"Rs1,9t]DJUFC
DIIBn-OgDX67sB;+>Y,q1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,C%^DJUFC-OgCl$;No?
+>b2s+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G/+C]5)+=Ach%13OO:-pQU1a"Rs1,C%^
DJUFC/n8gBDKI68$;No?+>b2s+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Rs1,C%^DJUFCDIIBn/n8gB
DKI68$;No?+>b2s+>Pbr@W$!)-RT?1%15is/g)tn1E\G0+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Y,q1a$7FC`k)X-OgCl$;No?+>b2s+>Pbr@W$!)-SAnIF`):K%15is/g)tn1E\G0+C]5)+=D&8
D.P(($;No?+>b2s+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G1+C]5)+=ANG$4R>;67sB;
+>Y,q2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,U1`DJUFC/gh)8%15is/g)tn1E\G1+C]5)
+=AdODfor>-OgDX67sB;+>Y,q2'?@GC`k*C@;TR'%15is/g)tn1E\G1+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Y,q2BZIHC`k)Q%13OO:-pQU1a"Rs1,^7aDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+>Pht@W$!)-S?bU$4R>;67sB;+>Y,q2BZIHC`k)X@rHL-F=.M):-pQU1a"Rs1,^7aDJUFCDIIBn
-OgDX67sB;+>Y,q2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,g=bDJUFC-OgCl$;No?+>b2s
+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G3+C]5)+=Ach%13OO:-pQU1a"Rs1,g=bDJUFC
/n8gBDKI68$;No?+>b2s+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Rs1,g=bDJUFCDIIBn/n8gBDKI68
$;No?+>b2s+>Po!@W$!)-RT?1%15is/g)tn1E\G4+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q
3$;[JC`k)X-OgCl$;No?+>b2s+>Po!@W$!)-SAnIF`):K%15is/g)tn1E\G4+C]5)+=D&8D.P((
$;No?+>b2s+>Po!@W$!)-Z3@0AM.J2F`):K%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%u
Eb00.ASrVE%13OO-o!\)3]&9.4==THF(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn"k
E,&<gDeio<0MXqe.V!C6E,&<gDeio<0HbHh/Kf.HF*&NQ@rH4'C+19C@;TQuDdm=$F(8X#Bl@lA
%15is/e&._67sB^BOu'(FD,5.+EMXFBl7Q+-ndV14ZX].@;p0s@<-E3+DG^9+CQBb+<YlHEb$:8
-t@14E,$gEGA1l0%15is/g,(AAp&0)@<?''@;^?5+Dbt+@;I'(@;TRs/g*r!Ap&0)@<?'k+DtV)
ATJt:@V'1dDBL'GBln#2FD,4p$;No?+E2@4AncK4+=L#P7TEAS:e"P9+<Y*1A0<!;ASu$$+EqOA
BHSF<@;]UoD'0s1@<6!&+AP3s76sUD83m[l:-pQUF*2),Bm=31+<Ve:Df0Z;Des6$A0<"(Gp"4X
:I7NN;aWoI<%0FB+<X3hB4tjs+<VeM@;L'tF!)TDAdo)B67sB/:I7NN;aWoI<%/r&ASu("@<?''
Ci=3(ATAo%DIal+ATMo8Ch[ZrCj@.FD]iP+@<6*)DIIBnF"Rn/:-pQB$;No?+Eh=:@UX@mD)r+5
:-pQB$;No?+<Vd].3N&?F*2>2F!,R9F*&O8Bk)7!Df0!(Gp"MWATMs.De(ON+D#e3F*)I4$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<!B-OgCl$;No?+Cf(nEa`I"ATAo8@:F%a+ED%4
Eb0<'DKK</Bl@l3De:,,+EqaEA90:E@ps1i3ZoP[@r`\>G%G]'-OgDt@ra^n><3m44"akp+=Jru
HXSNU+=nX>3Zp:'3]/$B%13OO:-pQUA7]@eDIjr7DfTA2GA2/4+E(_$F`V&$FD5Z2%17#_Ap&0)
@<?'tAM?8.+>Y-$+>=63:-pQU-ndV14ZX^(@V0b(@psIj+Dbt+@;I'(@;TRs%14J!De!3lF!,R<
@<<W)ATT&=ASH0q-Ts()Gmt*mDfT3.Df90)/g,E^A8a(0$6UI-De!3lEt&I!+EqC2Eb#Ud+<YA@
4Y@j%Ci<flCi^$m+<YkN4Y@jk%16ZaA1e;u.1HUn$;No?+Dbt+@;I'*Cgh$q+DtV)ATJ:fCi3Zu
ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$3B9*,-OgCl
$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z<I+F`V&$FCf<#0II;:%15is
/g,1G@:UKi@:O'q@;]TuA7]@eDIjr7Bln#2Ddm=$F(8X#ARlp$@;TRs%14g4>9GUC3\W6B+BosM
0mdDKD/a54-Z<I+F`V&$FCf<#0II;:%15is/g+tK@ps0rDdm=$F(8X#ARlp$@;TRs%17#k@;TRs
4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]CLoLd3F=-C$4R=j
,B%I.D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+E).+D.Rbt$4R>`BQ%p5
ASu?r0KhH>1E\_$0F\@:Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC
%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk%15is
/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>F(fK4
FCf?,AM@IW5s]R/DeioE3B:Fo%13OO:-pQUF*)>@AKY])+Co1rFD5Z2@<-W&$>"6#FDYu5Ddso/
F`\`RF(fK4FCf?,AM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7Jk$8EZ-+>=s"0JG4(>9H!^
HXgu2E,$LCF(fK4FCf?,AM>J@$4R>;67sBsDe!3l+EM47Ec`FA@;TRs%17/o@;TRs4ZX]I-p04G
0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$7I-?DIIBnF"&4p
+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&dDIIBnEt&Hc$4R>;67sB4HW3F4<$5+>
6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]R/DeioE3B:GVDf'H.;f-GgAM>i667s`tDf'H.;f-GgAM>h]F=f'e-t@14E,$gEG%#3$A0><$
B6A'&DKI"BD/X3$+EV19FE9&A:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3L$\ATMs.De(ON
+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(C9
F(K;E0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et+>>E./i5'c:-pQU0f<]gCbd^f
Eb0,sD.R6#Ao_g,+=L`<D/a5V@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^ZuE/g)8Z+<VdL
+<Y*1A0>c$G9A;TD/X3$/7N%/Bk&]1@<-!l/9>oRATMoD@rc^5BIP'GATMs-DJ()4AS5^oAI8cS
De!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$=e!aCghC++EVI>Ci<fj5s[eXD/X3$
3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OO@%Bl8!'Ec`EOBkhQs
-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5FCfN8ASu[*
Ec5i4ASuT4-YI@9A1'Gd8l%i&$4:?b+E(d5-Zip@FD>`)0II27:-pQUBl8!'Ec`FFDf'&.F*(i.
A79Lh+EqaEA9/l8D]iP.D/aN,F)q[^Df02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X3Zp4$3Zp*`
$=[pl+?_>"Eb/ZqCjBi8DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to+>=.@An?3u
@qB_&Bm+'/FCB&t@<,n"+?_>"@W-/l$?TriFCB3$@<5sfD..'kDJ*C!DJsT<@;]UaEb&U#@;Ka&
4Y@jdDf6aJ+F+;$-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh6r-lZ-QkQ)
+C]8-$48.N9M[u@9N*'&=@5b^6q'Kk4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-VSGrB22lPATL.X
AQ!)JCi"Af@<,mXDcD"$AL@h*@j"tu-ZW]>FEhmT4ZX]qDf'H.+=Bj$DJ)^QD.RcSEb/-[@;Kb*
87?OL<,Y`]E+LC(0d'[CF)>i<FDuAE+EVjM$4:ifDfTq_3Zp4$3Zp*`:-pQUDIIBnF!+n-CiX)q
A9f;9DIjr#BOPp(/KeqLF<G(,@;]^hA-ua./pReL4YC.c.NgJRH9Elh+=\LZ+=\LZ$7Q;hATAo8
D/a<0@j#`5F<DrPBQ%p5-OOm(+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.DM+Bot0D/XQ=E-67F
FEhm7$4:]\C1UmsEb/j(4ZX]A+?CW!$>Epc?XI_\C1Ums4Y@k&+AP6U+CoC5DJsV>@rH4'Eb0<5
+E(_(ARfh'$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4$4:<XEb/a&?[-g??Tg"aGp#jK
/g+\C+Du+>+Cf>,E,oN2F!,:;@ps1bEsa?'$>"6#FDYu5Ddso/F`\`RDdmHm@rua&Aof=,Eap4r
+=D2>+EVjM-TsM#Df'H.+=D):C1UmsEb/j(-OMRN>9J!(Dfp/@F`\aJG]X9"B5DKq@;KsqAog*r
1E\_$0FDH/Ddm-kF!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5+F+;C$4:?b+EVI>Ci<f+E-67F
-YI76@UX(nAS-!2$?BW!>9G;6@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=,0d'[CF)>i<FDuAE
+EVjM$47,NARfObEb/d&@rH<tF$2Q,1a"h%0FA.^67sBkARfObEb/c(F(9--ATJu&Eb-A8DfoQ'
Gp%!5D.Rc2@;]Tu@<,od:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Es`7m
G%G]7Bk1d<3bN8I@UX(o4ZX^1+<XEG/gr1u4Y@jqG%G]7Bk1ctB5DKq@;Kul$=[pl4YCDdD`o^p
Df7ck+>Fu]+<VdL:-pQU-n6Z/3ZqmMD]i_3D]j.?D[Hh`DfT3&@;TRs/g,E^A8a(-+<VdL@W-0-
.NiV;D.RcqBl7HmGT\,(67sBpD/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT\+<VdL-[0,E
B4Z0-@rc^0@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.RbqASu$2$4:HbD]gMP
GmYu-$>"6#FDYu5Ddso/F`\`RA7]7e@<,piF(9--ATK4+Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7
ARfObEb/d&@rH<tF!h;L+Bot0D/XQ=E-67FFEhm7$>jL%ARojlDfB9/4ZX]A+?CW!$49Np/g+tK
@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k$;No?+EqL1DBNA*Gp$s<G\(D.F(9--ATJu&
Eb-A(ATVKnFCeu*Df0B:$;No?+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2,/KcHSCi<d(.3NYBE,Tc=
EsbZ//g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEs`7jDe!3l4Y@k&$>aWj@;J(f+>P&h+Dbt+
@;H9"$4:?b+EVI>Ci<f+E-67F-Z*RBARojlDfB9/-OOm(+Bos9Eap56G]Y;r3ZqpND/a54-Z*RB
ARojlDfB9/-OMRN>9J!(Dfp/@F`\aJG]X9"@rH6sF`V,)F(9--ATL!q+>Y-$+>=-0:-pQUBkAK0
BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V$:-pQUCh[Zr+Cf>-Ap&0+A0>r'
DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&/db??/g,7LBlbD2F!,R<AKZ&&An?%*+EV:2
DJ()6D]iS//g)99BOr;7B5DKqF"%Gk67sC(ATD6&A7]jo@ruc7@;]TuEb03.Ecc@F@rH6sF`V,)
+Co%nCgh?mFD5Z2F"Re,:-pQU@W-0-BlbD-ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k+>"^KD]iY+
B6A6+$4:6\D`r@g+<VdL+<VdL:-pQU-n6Z//g+VAD[L/rD`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmM
D[Ip#$>"6#FDYu5Ddso/F`\`R@rH6sF`V,)F(9--ATK4+Eap4r+=D2>+EVjM-TsL5@rH4'C*4m6
Df000F(Jm'@rH<tF!h;%:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.sDe!p1Eb0-1
+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8,RQD/X3$0JH6g/h1CGA5d>`CLo1R
+ET1e+=Lc7A18XBD/X3$+EV19F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R
@;]UaEb$:b+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQU
+<WHh+AtWo6s!8X<(.pOATMr9A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8A2#PWFCfN8
C2[W;/0K%GF*)/8A2,bh+EV19FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4
+DNee0JXbC:IGX!:-pQU0emQaFtks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?R
DIIBnA0<:2Bk1.ZDeio<0I\,VEc5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.
F`(t;Ci<flCh4%_%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OO:-pQUFD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'
+DGJ+DfTE1+DGpFF!+n3B6A'&DKKqP%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/>?%13OO:-pQU
DKTf*ATAo3AftVu@ruF'DIIR"ATJu4DBNn,FD)e6F`VXID..NrBFP;'+?^hl+FPjbA8,Qs0F\?u
$>"6#De'tP3[]#\F*)/8A2,3KATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63
%16Ze+E]h.+>=pKBk/>?%14s84Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#
1E^UH+?MV3FCfN8C2[W:+EV19FD>`)0eb:/%16Ze+E]h.+Co1s+FYFe%14m64Wksl0d(FL@r!30
%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R+ET1e+=Lc<
CagKJD/X3$+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5B6A'&DKI!D
@psFiF!)TDAfr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;G%#3$A0>Aj
F(KD8@<,p%@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8
C2[W:.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(F?C3=>J0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBkASbq"AKYDt
C`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!
4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.@ruF'DIIR2
+DGm>Df-\>BOr<*@<?/l$8N_e+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/FEn<&0H`M$
,<d5)+F>4b+CoA++=ANG$8<Sc+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'MDJUFC-OgD:
+?^hl4s2R&HQY*eA8Z3+-RT?10H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0F<GXCD.Oi5
ATD7$%178r@;TRs4ZX]5@Wuj'0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp$=\4"A2-5.
+>"$0@Wuj'1-IZ@1E\_$-[6a`+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH0RInYE,9H&
+E2IF+?MW-DIIBnEt&Hc$;No?+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&NEb$jHDKg,3
0d(@XEb$pJDKg,31E^RZEb%!S%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu-tt:V1*AA%
4")g;5;=i@4"*'K+=/-p2'=Y"2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5Ddso/F`\`f
3c8hDD.Rbt$4R=O$7KG&C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f-nlcSDJUFC
-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/+?L\o4$%P&
@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q.3L3'+>G!#
+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-NDJUFC-Rg/i
3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o%14L;+>G!L
DJUFC@Wui?.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC
1aa^p/NP"/+?L]-3[\fhEb%!S+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4GC`k*90deCm
/NP"/+?L]-3[\B\Eb$mIDKg,30de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pKDJUFC-Ql/N
/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q%13OO-nlbu
+>=pKDJUFC-Rg/i3Zp."4!6UGDJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKDJsZ8
F"%P*-nlbu+>=pKDJUFCDKg,31aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3AS,Y$+=M,G
F`)7L%14L;+>P&n+CoA++=D2?1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2Bl7NsGT\DP
Dfor=.1HV40H`.o0HanDC`k*90deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4+EM[;AncK4
-uNsGDK@69$4R>[ATAnI+>b2p+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.$>sEq+>=op
+>Y-NDJUFCEb$O?+:SZqATAnI+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DARDf028%16ua
EZd%Y0H`+nA8Z3+-XgXrBl5:-$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL
+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo/NP"/+?L]-
3[\B\Eb$sR+AP6U+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo/NP"/+?L]-
3[\B\Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm/NP"/+?L]-
3[\B\Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>6UO:@;asb\
I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE
3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WLDIIBn/6cV#
@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7+ED%5F_Pl-
+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19FE9&W+@1&k
+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o:-pQUBR+Q.
EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is/e&._67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2
?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K
+=D8BF*)/8A2#AR>9G^EDe't<-OgCl$;No?+DG_7ATDl8-uX9?Ed)P<FCcmDGAhM4F!,C5+Eh16
BlA-8+EVmJATJ:f@W-1$@W-NT3Zp*c$>+*m@<??t4ZX]?3B&',+?pu)+>P&p+=&'g2[p*cBOQ'q
6YKnK@:OCjE]lH+-YRFB+Dl72BHVM;De'u7Dfol,+CQC:Df9//@q^!pCER,#F^o27%16WaF^f/u
E,9Z<F`(i1De)!l+=fJq5ThR<%16N\E+O'#Dfe-'+=8]M$?pArD.RcO3ZpLF-Xq"4Cgq=.+D,G.
@<??t+A$6TG%F$S@<,ddFCfJ8A8cU"Ch7R%F`V\CB5_^!+CT,+ATD="F=.M)4tq>*D/a<0@j#`5
F<GdF@;TRs%159QHZUr)3Zp+!0ea__ATT&=DIIBnEt&Hc$;No?+D#(tF<GdGEb$:@DIIBn/7WL)
F)rmSAU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4GA^i+ATJtu
+D#(+4#))(0F\?u$;No?+DG_7ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^F`\`RFCfN8
@;Kmr@5'A_4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`4"!ci/g+kG
DJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[IAU&;E%159Q
HScjaF`\`RD.-ppDddI$BONSK-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$BONSL-Ta(<
4!ua*.j-Po%13OO4tq>*0g.Q?0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)BONSB%13OO
:-pQUARoLs+EV19F=;$8D.P8?AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsU
+>"]`/3>P4FDbN(ATJtu+D#(+4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,I4cX!+CoA+
+=D#7@rcKrCiF&r0II;:%15is/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@@VfTb$8EZ-
+EM47GApu3F!)i?BOt[h+D#(tFDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4%13OO4tq=>
+E(d5-Zip@FD>`)0II;:%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcdD/X3$6$%*]B5TCW
0MXqe.VER9@WPIbDeioMF)u&.DD3au+<VeK/M/(f+DG_(Bl[cpF<D]7F)u&.DJ`s&F<D]EAfr3=
B5DKq@;H9G67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>F`)7Q$;No?$;No?+@U<kDfQt2Bldd&G%G]*
A0>E*EbTE(+E_a:+E(j78l%i!+>>eu:LeJh1,(F?+>GW42)I?N0d&f$FD)"V67sBj@<6"$+EM47
F_kS2+ED%8F`M@B+Du*?+Dkh;ARlo+@<6L(B5VQtDKKqB+C]J8+<Yc>AKZ&*@rH6q$;No?+D,%r
Ci_39:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?De!lC3=8MJ
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$@rGjn@<6K4FDYu5De!-?
5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I$=e!gDKBB0
F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=5uL[1/IDh[
67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DWDIdI%ARfgJF)u&.DGP%23]%s?
+>=-t67sB/9kAE[De).SB6A'&DKKqK4Y@j2$>+Eu@m)Fe-[K]RFC.sj@:rpp$7KM/DIY+Y3ZqWL
.j-Mg.Ni"(.1-DW67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DWDIdI%ARfgJ
F)u&.DFJSdDfS!%1a"h%0FB4&ATVU(A3k6KF_t]-FE8lo/g)hTAp&!$4Y@j)H>dqJ?W2/WB4!"n
-t[U>@jsQ%+Bos=+>=of+C,='$47,867sC$ATW'8DK?q1DfTl0@rri6ATN!1F:)T"+D5M/@WNY>
D/"6+A4^ZLBl[cpF?sthBkM<ZCF9Gr:-pQUEb03.Ecc@FATDg0DIma/F!,=6G\(D.@<6L(B5VQt
DKH4\67sC)Bl%T.FD,]5G9C=8F(KB6Bl@l3F`);8C`m>(G\(D./Kf.HF*)IGF(fK7Ch+Z+@:opY
EZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M2$$;No?+>%q>78m/.;cQ1P78m,S<D7fm
$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?YjXh
A5d>`CLqU!F*'*267sa(Ddd0TD/X3$FCfN80H_K[/M/(fCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3
De:,1@VTIaFE8QIBl8$2$;No?+=M>CF*)/8A2#Gb$;No?$;No?+B3#gF!,R9F*&OG@rc:&F<G:=
+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%FD,6++EV19F<GX7EbTK7F"Rep67sBPF<GX<Dfol,+Du+>
+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o+EV:.$;No?+E_aJ@;I'.
ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8
C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD
+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OL2U67sC)DfTB0+E(j7
G%#E*Dfp+DFEqh:Esb60:J=&R:JEN+3Zp*`6;LBN5u^WS0g.Q?0a^6C:J=GR;cGn@+?qJ$0eb:+
1($?D:J=_R6;0g23ZpX>+>k8r1E[qc1("@[:/jMY:JEN+3Zp-a8PW5a5se764ZX]M/g*"o1F+\/
0FA.V9M[rR9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/$49-k5uLBJ;cGn@+=B`'@;R-2BOQ!*8K_GY
+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$49^79iODF4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"
F!+n/A0>u-@<<W+F!,(/DIk1&$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj6
9iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.jFDYu5Ddso/F`\`M/gkOQ?U6tDF)>i2AN;b2
?Qa&81a`V;:-pQU@3BZ'F*%aQ0RGMsE-67F-Za-CCLo2!ATMrI-T`\1+?^i%+AP6U+EV19F<GX7
EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN5u^WS0H`\X
:J=&R:JEPd6;LBN<'`iE74/F+0RIGQE$-NBDKKr:Deio<-T`G43[[Ko<'aJZ9e[\]:/k1Y6;0fq
$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AM?he@rcKA-Ta(<4""_p+>P`#$9g.J1a$a[
F<DrPD/X3$0MPtcEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY
+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dGE+NnoCi<`m;f-GgATVL)F>6NW/h1[U
@:W;RDeip+ATMrJ+ET1e+<YK=@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+<YT3C1UmsF!)T>DKKe(
:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU<+oue+<Yc;F*&NIF(96)E-*3FCh[Zr+=M&E@:W;RDeip+
ATMrI.3KaIF!)TIH#RJ-@;Kb*+<Y]ID@0-*/g+kGF(o/r+E)@8ATAo8ATMr9+EM%5BlJ08/g*`-
+EM47F_kS2DJsV>+CT).ATAo8BOr;/Ecl8;Bl7Pj:-pQUCi<flCh4`&ASu!h+DGp?CggghF!,R<
AKZ,:F^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/db??/db??/g+SDF*2>2F#jY'67rU?67sB'
+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gm[;5/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?
+CfG'@<?'k3Zp130f<B^B.u4N:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT6.:-pQU
GAhM4F!,C5+Eh16BlA-8+EVmJATJ2fDf9GX<)64B4ZX]>$=[plCdD#r9eedl+>F44Df9Gc8Q/SO
3ZpX>+>GQ(,;KU8Df9Gk5se764ZX]M/g*"o0f'pt+>O92Bl8#Y<)64B4ZX]?$>FC"<'`iE76N[S
5;"'9+>Y8t0JEh@Ao)BoFA,8)<'<8b2`E?L3?TUj5;"'70JF_,1C=J!BOPpT8Q/SO3ZoeA+CT+0
GA(E,+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OL3%H#6MH69R@P1E\V8+=&(N3ZodmG@_n*
Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0$4:6\GZ.RA7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR
9M&/^.4dS[=\Vj]64+&p67sC%FDl22+Dbt+@;KKtGAhM4Esb)bHZX+DCi<f+E-67F+tb6\CgTIo
6$$m]CLoLd3F<nC/i4p_$;No?+EMI<AKZ)+F*)I14tq=<+E2IF+=D5IDeio=<+U,m0IJq00d&V%
0d'4X/g,7IF*&OG@rc:&F=.DZ0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U+EV19F<GX7
EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AMGPo+?MV3@W-1$5u^WS0HahC
Deq^=:JEPd@W-1$<'`iE74/F+0RIGQE$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](DKJiD6;0fq
$49Np/g+RFF*22=AI:UTHSZdWEc<-KF*22=ATM^,CLo4J4!6UG-Za-CCLo5"ATMrI+EMC<CLo5"
ATMrJ-OL2U67sC%Df'&.D.-ppDfZ7L0O$@VE-67F-Za-CCLo4p@:O=r0IJq;0fpas/g)o*-ON$k
>;RIAF`\`RF)>i2AMHnf@rcKB-Ta(<4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#Gp%0I@:Nk$
+A!\aD'370Ch[?iEa`c--OL2U67sBsARTan+Co1rFD5Z2@<-W9DfB9*Ci<`mA9Da.;f-GgAM>f5
67sa(Ddd0eF_u(rD/X3$0JFVk/M/)UF_u(?F(96)E-*4CASc9nA8,po+EMC<CLnW1ATMs7/e&._
67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@ltEd8c:$;No?
+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#A?$;No?+<V+#:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH0Js:H:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.Ddd0TD/X3$
-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$
.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%13OO4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT?1%15is/g,7YEc*"<
AnE0-Bl.F&FCB$*Et&I?0RI>LF(KG9-W3B45tOg;7n"de0F\?u$;No?+Co&"ATVK+@;Ka&GAhM4
F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1
A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2+EV19F<G+.
@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C-n$bm3\`<B
.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUA9Da.+CfP7Eb0-1+CT.u+ED%0Ddd/c$=ma3
3Zr9JCLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+EVaHDBNk8+EV=7ATMs%
D/aP=@;]TuA9Da.061W?Ddd/c$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$=ma33Zr9JCLnV9-QjN@
$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R=j0fU=;1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,         ~>
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
0f1[/0f1"/+>G_r1*A;.0K:s51,'h++>GZ/2)l^51a"Or2E!BN+>PVn1*AS30d&2*+>P&p0K:j2
0ea_*+>Gc62_uR21E\Fq1,UjB+>GPm1*AG.2)-4.2BXat0f1mE+>Get1*AP91a"M3+>P&t1,L+.
0d&4o0f1mN+>Gl!1*AG71E\D2+>P&o1c7']:IINL8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;m
Bl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2)cX#6t(1K3Zp7%8p+qm1,(F?+>>K10f(jF3=Q<&
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>t?7F_i0U
0JPF-0ek^E1cdBL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqg2'>M6C`kJe0f:(-3BB#T3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,]IH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G_r8p+qm1,(F?+>GQ20JkgH1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0fL4IF_i0U
0JPF-0ebXG3'&cM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp='
+@KX[ANCqg2]t_8C`kJe0f:(.1-.3N3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.9+A-cm+>PW*2'=V/3]&QP1,]IH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Get8p+qm1,(F?+>G]61,M$K1C=Hr
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0fL4IF_i0U
0JPF-0fM-I0fh$G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,0nDF_i0U0JPF-0ek^D1HI<H$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,C%FF_i0U0JPF-0ebXG1HI<O
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,C%F
F_i0U0JPF-0ek^E0fh-N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp.6+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,L+GF_i0U0JPF-0f;!J3'&lU$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K
0KM!K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU
1,L+GF_i0U0JPF-0f;!K3BB#R$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>Pbr8p+qm1,(F?+>Gc80f1pF1("?q:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>Po!8p+qm1,(F?+>G`7
1cRNM1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+>Po!8p+qm1,(F?+>G`72).-H1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P<u0d%T,@<?'A+>Pr"8p+qm1,(F?+>GQ20JY[E2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"8p+qm1,(F?+>GQ22)mWP1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-
3'&iO3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp4$6$6f_1,(F?+>>f:0fM-I1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P=!+<X'\FCdKU1E\u+B-8r`0f:(.0KLsI3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp4$6$6f_1,(F?+>GT30f_9N1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G
3\W;r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$
6$6f_1,(F?+>GT31c7<K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU1E\u+B-8r`0f:(.2**EJ3]/]#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp4$6$6f_1,(F?+>Gc81bq*G3!p!":-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO3]/Z"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_
+>PW*2'=V33\iWT1c5UI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
0ejdn6t(1K3Zp:&6$6f_1,(F?+>Gc81H@KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>t?.F_;gP0JPF-0KD0J2EEQI$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU2BY;.B-8r`0f:(.0KM$N3\`Dt
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_
+>PW*2'=V.3\`KQ1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
0f:'r6t(1K3Zp='6$6f_1,(F?+>GT31,M$L2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>t?.F_;gP0JPF-0fD'M1HI3M$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU2BY;.B-8r`0f:(.3'&iN3\`N"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_
+>PW*2'=S43\iKP0f04E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp@(6$6f_1,(F?+>PZ41c%0J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+?:Q1F_;gP0JPF-0ebXD1-.9K$47,867sBZH#n(=D)re3
:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+?:Q1F_;gP
0JPF-0ebXD3BAiM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU3?UV1B-8r`0f:(.0KM'H3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg0H`Z(B-8r`0f:(-3BAlN3\rQ!$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2BX,/F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*
2'=V-3\iBM1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\
FCdKU0eje:F_;gP0JPF-0K;*M2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0Js1E$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibp7+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0esk;F_;gP0JPF-0f1pJ3'&cS$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.";e9nj1,(F?+>Gc8
1Gh-H1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg
+B)ij+>PW*2'=V33]&QP1c,OH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>GPm7V-$O1,(F@+>G]60f(jJ2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg1a#M$EZd+k0fC./1-.*J3\iGt
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b
+>PW*2BX_13]&]T1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>G\q9jr&b1,(F@+>GZ51cIHL1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,'hF@<*JG0JPI.0ek^F0fh'K$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh0Ha(uEZd+k0fC./0fh-L3\`W%
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp13+AH9b
+>PW*2BX_/3]/WQ0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU3?Uq&DBL\g0fL410fh$L3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+?:Q:@;[2C0JPL/1,1gF1HI6J$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3ZpF*8muT[1,(FA+>PZ41GCjD2@9cu:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL40
1cd<F3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pes7V-$O1,(FA+>G]61bh$I3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp='+@KX[ANCqh2'>A"@N[E[0fL401cdKJ3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pes7V-$O1,(FA+>G]62)REP2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402**EF
3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pes
7V-$O1,(FA+>Gc81-%BO3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp.2+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLpB$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp18+@]pO+>PW*2]sh63\W?N
2)kpM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp1:
+@]pO+>PW*2]sk03]&WR1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_
ATBgS0f1!q6t(1K3Zp1:+@]pO+>PW*2]sk03]&]T2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpG+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp1:+@]pO+>PW*2]sk03]/WQ1H,XJ$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[
0fL410fh$C3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU1,pCGARZc;0JPL/1,1gE1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-7@<*JG0JPL/0fV3M2EEQJ$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG
0JPL/0fV3N2**KM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>GVo9jr&b1,(FA+>G]61,(aE0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+AH9b+>PW*2]sh33\rTR1GT:E$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*B;"
EZd+k0fL401cdEN3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GVo9jr&b1,(FA+>G]61c%0K2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.5
+AH9b+>PW*2]sk33\W6K0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp@(+@KX[ANCqg1E]D#EZd+k0fL411HI3K3]/`$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A
+>GYp9jr&b1,(FA+>P`61,1gH3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg1E]D#EZd+k0fL411HI9K3\i]&$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>GYp9jr&b1,(FA+>P`6
1H@KR2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo
+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>G\q9jr&b1,(FA+>PZ40ek^C2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg1a#M$EZd+k
0fL410fh'I3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t2'=#0@<?'A+>G\q9jr&b1,(FA+>PZ41,h6K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>G\q
9jr&b1,(FA+>PZ41H.?O3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Ghu+@KX[ANCqg1a#M$EZd+k0fL410fh-F3]&i($49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>G\q9jr&b1,(FA+>PZ42).-H
2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[
ANCqg1a#M$EZd+k0fL410fh0I3\iGt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>G\q9jr&b1,(FA+>PZ42)dQP0FA-o:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqg1a#M$EZd+k0fL41
1-.*E3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
1E[f.@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE0a^NK6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*
2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QS$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+@<?'A+>G_r8p+qm
1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU0fL4I
F_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c,OH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[ANCqg
2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm1,(F?+>GT30f(jH
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K
3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E
1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1*@]-
@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh1a#D5C`kJe0f:(.
2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@=
+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm+>PW*
2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?
+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.
3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b
6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.2EEZM
3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[
ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW
0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[
ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ
1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[
ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP
0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[
ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-3\iHO
2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo+@KX[
ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K1HI<K
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0K'7F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo
6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibU.+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m
0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b+>PW*
2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/
1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F
3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLsH
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh
2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&]$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU
1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,pCGARZc;0JPL/
1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`Gu
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.
@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM1,91D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0eskG
@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/
0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF0KLpB
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5
+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*2]sk1
3\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A
+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$
EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b1,(FA
+>PZ41,1gE1($fdF(KB8ARn5MEc5u>1,Vfn/h0Y+F(KB8ARn5MEc5u>+EK+d+C]J++Dbt/+CT.u
+ED%7E,TW8ATKI5$4R=O$;No?4?Y)I.3N,@@<6*C+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-
F<DuHDe(M92)$j9%15is/g)o0+AH9b+>PW)2'=V03]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/
$Gs,i@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.n
AncKN+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUhBIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@B
F_kk:F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4
ATJu9BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6+
+CT;'F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA++=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9
GAhV?A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>U
Eaa$&3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@lt
Ed98[+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,Oq
Bl@ltEbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(
Bk(RnATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCC
FD5W(F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm
@ruF'DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-
+D,Y*AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%
DJs_A@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu
@;Ka&FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7
Ec5t@GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8
BlbD7Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=
F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K
0b"I!$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#
@rGmh%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaEA12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX
_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%
F(HIAF^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@qZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lg
DJ<U!A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4KDfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+
Df-\0Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,Xo
Bln'-DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:
EcYr5DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=
3ZrNXATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc
:-pQU+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;
67tDb-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2BEc5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7
ASu("@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<rF:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5
E$/t2F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,
@<?4%DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi
/e&-s$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.
F(96)E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.
+:SYe$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.
Ao_g,+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[pDJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is
/j)9F2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi
@ru:&+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^
+=C]@FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbX
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
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH
+QAW;1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R
3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbX
JDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:
+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5
E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufh
ifo$($K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.
Jhf#62_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQ
P^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U
+E)$<AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-NDJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=Z
Ddd0jDJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO
67sC)Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.
@<<W5Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9
E,p,4F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41
DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;
.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>
4YB,o;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+
AoD]4DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])
$4R>;67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(
B5VQtDKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cpF<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#
ASuTB+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%
Eb-A2D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;
9kAE[De).SB6A'&DKKqK4Y@j2%16]iDIYg^+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf
>n%,i%13OO:-pQUBl.g0DfB9.Cj@.DATW'8DK?q;Bm=3"+CT>4BkM=#ASuU2%16`aDdmc1-Z*RB
ARnAMA8-'q@rt"XF(o9)7<3EeE[M;'%15is/j2BH3%5t^Bm;ZJ$4R>;67sBlDIb>;Ah@q1F(KB8
ARmB(EcQ)=Et&Hc$=\-lCh.:!A7TCqFE2))F`_>9DDEqA67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3
F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%;h$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC+
+EVI>Ci<fj5s[eODe*="Bl%<?3B:G03Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$Eaa$#+?V#;5s]7(
A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.
@;]TuDfB9*+A,Et+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA1&`6$4R>;67sBnATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&DIal5ATDj+Df-\>
Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R=i8l%iR<'a#C6qL9!
8l%iF8Q8)L;BSS-6rQl];F<lO<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA;BSS-
6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$[':IJ,K;Fs\a6qL9!8l%iD=B&3e8Q$p!3ZrKTFCKB,Ch.'j
EcW?W%13OOF`:l"FCf3*A8PamBkCptF<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\
5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&
C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU
9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q779^F4%`::7nHZJ8Q$!)8l%iU9gg+HE+EC!
ASQ-oF)Q2A@qB1nD/aP=8l%iR:K::[78m/O7n#g;;@Nt*:IJ5X6m-M]Ch7$rASQ-o+A,Et;cH%Q
779^F4%`::;cH%Q78QBA6qL9<8l%iR<'a#C6r-0<8Q%WB:II]E<('ML6qL8c$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF
67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;
A7oUu$;No?+Co2,ARfh#Ed98E:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g)8ZEb065Bl[c--YI".
ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%h^:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%
67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ2R67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<
+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:(c0/db??/g)8Z0d(LR
+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI
.1/g:/db??/g+SDF*2>2F#jY'67rU?67sBUD]iV3Ec5t@@q]F`CM@[!/db??/g+&'EHPu9ATJu8
FCB&t@<,m$8g&(nDe<^"AI;1!/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k
3Zp130emEcDD3gQ:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.<)67sB80ktiK0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+
/no'A+DPh*F`V,7@rH6sBkLm`CG'=9EsbZ//g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SF
F<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu$4:9]@s)g4ASuT4-XpM*AL@gpDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go
@rH(!F(KB6+=Cl<De(4&$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$
Bk)7!Df0!(Bk;>mDf9PW3Zri'+Co1s+>=.@A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`3
$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=$?U-(Ci<f+
B4Z0-I4cXTEc<-K@WcC$A86$n-OOU,A9MO)F(oQ14ZX]:4tq=U:IJ5X6ja8r67sBhCh[Hu+DPh*
Bkh]3A8-'q@ruX0Gm[/>6q9gJ8l%iH8lJPP<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1
C*7jUHTE?*+@K$l<(LA';cI+28l%in@VQ6B:II]E<(]qS8P2oX5u^B<3Zr0V@<?1(AT/ba:II]E
<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U$49Np/g+e<DImisFCcS)Df'?&DKKH#+A,Et+Cf4r
F)rIF@rc:&FE7e(@r,RpF(KDU3ZpLF-YdR1+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6
+DPh*FDl)6F!,49A8c?5$>OKiAnc'mF$2Q,-p07-?SNuPD..3k-9`Pe@r,RpF(KD"$;No?+ED%%
A0>Au@<6K4Anc'mF!+q#@quE"C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)HTE?*+DPh*
Anc'mEs`7L67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08$7Bk(+EMR5-TsL51a$FBF<EY+
-YdR1E,ol/Bl%?'C2[X%@<-4++DPh*F`V,7@rH6sBkLm`CF9H;HS-Ks+EMR5.6T^7HTE?*+EMR5
$49Np/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%$:[T\78l?1+=Lu7CghC+ATJtF+F>^b0d(OX@jrNO
-8%J)4=;aqC3(a07S-9B;a!/a-p1*t6q9gJ8l%iH8lJPP<(JG\/1)u5+@\pr78jOI4DJeFA79R&
+<VdL+D,h<Blmo/4"u"N8PDQO$8=SWDe*p2DfTE"@<<W(GB.D>AKX&hHU^S#78jOI4DJeFA8bpf
@<<V7+D,h<Blmo/4#2.P8PDQO$8=SWDe*]nCLq$bF<D]<GB.D>AKX&jHU^S#78jOI4DJeFF`_>6
A79R&+D,h<Blmo/4#D:R8PDQO$8=SWDe*s.DesK*@<<W(GB.D>AKX&lHU^S#78jOI4DJeFDf0)o
F<D\K+D,h<Blmo/4#VFT8PDQO$8=SWDe*g-De<^"AKW+-GB.D>AKX&nHU^S#78jOI4DJeFE+*d(
F!)SJ+D,h<Blmo/4#hRV8PDQO$8=SWDe+!3ATD:!DJ!Tq@UX$p+D,h<Blmo/4#qXW8PDQO$4:ik
Dfp/@F`\`R@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+E_X6@<?'k-OOp3Dfp/@F`\`u:II]E<(]qS
8P2oX5u^A^$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ2sA0>f/D]i7,1E^UH-RT6.@rGk"
EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?OCI\F*)>@H"q8.1,04FB4Ysl
Ea`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=)
,9SZm3A*<P1*A.kA7]on$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&
?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@
DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeK
D]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U
+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"p
DId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#
ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*
FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO
+=\KVC2[W8E+EQ'F`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4
Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*
AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(
+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs
+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<
F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#
+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL
+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-
0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#
4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*
+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYr
Cg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC
%13OO+=\LOATo8=ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5
EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.
FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3
De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh
.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6
Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$
ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA
+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/
EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,
ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*
FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,
+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,
+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9
D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o
+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL
+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2
-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$
@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6+
+Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>Go
Bljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt
$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%
%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lq
A0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'
ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm
@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'
D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLEC
F=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%
EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'
F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>
+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%
@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL
+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9
FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2
$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#
+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-
FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>
F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5
D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1
ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"
ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):
ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&
Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMp
FCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/
F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.
@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC
+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\I
D/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl
$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG
%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(
%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"
Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!Tq
F`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5
DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0
@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$
+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2
+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-
Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)
%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.
A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8Gst
B-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b
.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!
+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555
C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1
+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZe
F*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_
+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqB
Cggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(n
DJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#
+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#
+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,Xi
ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5
Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5
+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4
D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+
E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQ
FD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f
89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
F_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#
D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"
+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3
/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlor
ATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9
?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(
+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>
%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J
+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/
EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7
Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU
%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV
+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(i
B-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu
@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#
AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W9
0f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI
-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG
+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,
AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,
ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,
Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*
+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#
+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4
$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-
@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)
Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#
+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F
0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2
+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/Q
E$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6
?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.
CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe
?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H
+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>I
IR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC
@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%
H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:
DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tm
E$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c
%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4
E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LA
D.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(t
F<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q
05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b
.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc
+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?p
Ci^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FD
F)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2
/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(
DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE
>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#
+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<
%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*
+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&L
E-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0A
F'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV
-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=
/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(
CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;
@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4
+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7
F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nn
DBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$
F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(
Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9
BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3
Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaG
A8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/
+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbi
ATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR
:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-
F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F
9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;7
8g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg
05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*
+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q
$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0
De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1
+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#
.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM
@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&
A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa
0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6
De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6
Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'
Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,
@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B
-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(
+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3
De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)
Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5
H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2
E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNE
Df0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j
-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#
,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@
A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#
+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lY
FCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^
/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-
D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=f
ARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQu
DIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%
/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?
+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7
A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2
+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!I
Aft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*
Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0
/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX
<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6
+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)
A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nn
DBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.
ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9
Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3Amemm
BQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBe
GT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2
+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.t
F<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1
Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu
8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4
+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/
%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,
0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1
/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs
?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoF
De*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(
EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0n
Df-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'
A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3
Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN
@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj
/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8
Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs
@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)
8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cu
D.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K
7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p
%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s
+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UH
AKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!
AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8
+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:
F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).
AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T
%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<
Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-
+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq
$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5
?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+
G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!
F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(F
A9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibC
An?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]S
Ciq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,
+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;
E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5
F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU
0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm
$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>
+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0
F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt
/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)
+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/
$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)
A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#
+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhK
ASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2s
AKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'Y
BPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-
+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,
A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9
$6Tcb+:SZkBleB7Ed;D<A7TUg1,iiWDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B8i;/KeS8Fq"cf
$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(F@%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme
@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4
AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0
+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@
@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo
$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#
E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGC
A7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%
0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSek
ARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/
$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=)
,9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcq
F`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&
+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%
+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'Q
F*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4
+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O
/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!
AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,n
G%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-
GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0
H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E.
/ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinG
EcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL
89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/
Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,
+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#
F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3
ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,u
ATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<
2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8
D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(
Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6
A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(
F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4
+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uo
Eb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^
:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId
5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6
Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'
F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm
+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1
$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7
+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g
+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju
67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B3
78uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./
+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*
+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+
Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.
E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2
EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:
Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8
B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0
$4R>;67sBtBl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!
De*9hALS&q3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1
D..O#@j#B%EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.62BXb3%13OO:-pQUA8`T.Dfd+BATMF)
+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)VA8lU$F<Dr/78lWS
9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4
+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g)QVC2[W3+D#S6DfRKRD.Rd0
@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8Dfd+C
ATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9F=.M)
:J48O:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4
ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq
-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?
A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^
A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVp
F$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?
+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2
Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC
+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eI
E$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#
:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3i
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)
+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjb
B5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'
$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu
@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:E
B6%p5E-!.9DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%13OO:-pQUEcl7B
FCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&Is
F?MZ-1+%$`F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<
FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp"AGAhM4Et&IiB0A9u><3m?
CiF9.+BplLI4cXTEc;Hp%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%
Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<+>P&^:-pQU
B6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!%16f]/g+V3
A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*
$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?
+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/
@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaEA0>r,DfTqB
FCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47Ec`FGAU&;+
$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X
3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;
FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL
+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6/38&*+=f&t
+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)A.8kp%13OO
:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U
+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8E
BleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)+C\bi@r,L\
C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<GijAnc:,FCT6+
D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&
Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2tDETTpEb0E4+=ANZ
A8a(CDBNt2FEMVA/g+_CA1e;u-uLRgF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pi4YD.8D@Hq%
%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N
0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$
-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@
$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!GApu3
F$2Qi+BosC+Z_A*1(=R"$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6
@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C
5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'
1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf
3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDfZ?pFEBZ,
>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%
67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rs4ZZjk4!6:6,$uHS
+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-
EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=
/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&
DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq
$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h
+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B
@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>
C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVh
DfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d5
4$"a1D09K%ATf2;D09J6F`_>6F!hD(:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6%13OOC2[X*
F(KB%Df00$B4>:b1,2Nj/h1USA9Ds)Eas$*Anbme@;@!,/M/)VG[YH.Ch4_]:IH=JF(KA7@rH6s
BkMR/@<?4%DBO"1EbTK7/e&._67r]S:-pQU<+oue+<Y`8EbTK7+DGm>+D#e/@s)m)A0>>mAoD^$
+A,Et+E(_(ARfh'+<Y*5AKYK'ART[lA1eurF:ARP67sBj@;[2sAKZ,:ARlp*D]j(3A7]@eDIjr!
DIal"F`VYCD/"<-+Eh16BlA-8+Cf4rF)rIADfor=/g+,3%15is/g,">CLnV2FD,B0+EM%5BlJ/:
+CSc%Bm+&1+ED%2@;TQuBlkJ>D]ie5A9Ds)Eas$*Anbm1Bkh]3@;]Tb$;No?+Cf>/Gp$gC/0K.N
FD)eBDfp(CARoLsF"AGUD]j.8AKYhuBl5&.De'u$Bl[cpFDl2F3XlEk67r]S:-pQUIUQbtDf0W$
B4YslEa`chC2[Vl$;No?%15is/g+,,AKYl/F`)7CCh[s4ARlomASc:/+CT;%+D5V2A0>AjDIdHl
@<?(%+D,P4+ED%(AS,XoBln'-DCuA*%15is/g,4PDfp/@F`\`RC2[X*F(KB%Df00$B.dn5F!,%=
ARfk)Bl7Q+/hSb(%13OO:-pQU:ddbqEb/ZiATAo-DBN\4A9E!.C`m5(@<6K4/KePGEcP`/F<GX9
FED57B-:o0+EV:.+Co%q@<HC.+Co2,ARfh#Ed8*$:-pQUAoD]4FD,5.=(uP_Dg-7FG%G]8Bl@l3
De:+XA8bpg+AucZA7]d6+AuclATT&,DfQt=FD,6++AbHq+ED%%A7]e&%15is/g*tY7T)Z@6q(!\
@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%+=MIo2CVlsA8bpg>X;k?Ddm-s+AucZA7]d(6pk3W
ART+\Ea1n?Ec4id1GURoG\&63$4R>;67sC$ATMF)+A+#&+AbHq+ED%%A7]d(FDi:=@<?!m+A,Et
-Z^D,6q/;>ART+\EZcqVA8`T&DfQsKC1D1"F)Pl+/nK9=.1HVZ67sBW6q1'c@:Wqi?YWq23Zq6e
7T)Z@6q(!\@;9^kF`_>6?O[>O$;No?+CT).ATDZsFD5o0+@g*`F*)J5EbTK7+Cf>,E+*j&@VfTu
Eb/ZiATA4e:-pQU:ddcN76s=1;I<jIDe+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*HBQ%s6B6A&r
B6/61ATqBlF*;8/G;D!,AU%c6%13OO:-pQU:i^,ZATDg&A0?)-@N]-#Dg-86EZf(6+DPh*F`_>6
+Cf4rF)rHU+Co%q@<HC.+BN8pA8c[5+@^'cAO^T_+Co2,ARfh#Ed8*$:-pQU='&HW?X[\fA9E!.
CgT=d-UTq":i^JeEa`f-7VQ[MF'MFXH>.23@3A$REb/j$G[+ipEb/j$GV3QPAL@oo%15is/g+)(
@rH6q@<-W9G@b5+@WHC2F(KA7Bl5&.De+!4Bl"o%CghC++>"^HAS,@nCige$Bl7I"GB4m;Bl[cp
FDl2F%15is/g+4s=#"&jC2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm8T&W]Ec,H1+@UNoCi=?*
Ea21)=AV[e;FN3,=@FSH$4R>;67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>
DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$;No?+Al)k8k;l'@rH6sBkMR/@<?4%
DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HVQ6pjaF;bp(U
?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=
+t!g,D..3k6=FqL@nKNb<+U,mF##IF67sa)@;BF@@<6-m8l%iSATMs7+EK+d+DkP&AKXT@6m,rI
F(o,,FCfN8+EM%5BlJ/H%15is/e&._67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&F<D]E
Afu,&DId[&Cj@.AEb&a%ARloU:IH=7@<6-m%15is/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)
E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-F(HdCCi<flCh4`5Bln#2
8g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/e&._67r]S:-pQU<+ohc+EM7CAKW*<De:+7
+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gmt*U67sB/<(0_b6Vg]W
<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.%15is/g,%S
D.7's+E(j7FCfN8F!,17+EV:.+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6$;No?%15is/g+SDF*2>2
F#ja;:-pQU+<V+#:-pQU+<WBf+@.,[Df00$B6A6+A0=JeA8-'q@ruX0Gp%Q.:IJ/N;cF25:-pQB
$;No?+Eh=:@UX@mD)re]D]j1DAKYN%3XlEk67r]S:-pQU+<XEG/g+e<DImisFCcS9@rc:&F:ARP
67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<Y]A+=D#7CLoh@F(o,V
:IJ/nF*)IN%15is/g(T1:-pQU+<XEG/g,1WDBNY8%15is/g)8Z-nlf*1+=>.C2dU'BHS[O8l%iS
78m/=6=FqL@nKNb<+U,mF"V0AF!hD(:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zp130f<]gCbRjY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$>aWhA0<77De*s$
F*(u6-OgE"@;BFQD/X3$8l%iSATMs71,2Nj/h1^HCLpF]DeioV:IJ/nF*)IGF"JsdD..3k+A,Et
+EMC<CLnW1ATMr9F(96)E-*]>:-pQ?:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)E-*3F
De:,4@;]UoD/=J?DfTB"Eb/c(8l%htF)>i2AI;1!/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)
E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+ALSa<De!3lAKZ22FD)dh
+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC$;No?$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>
AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U67sB/<(0_b6Vg]W<%0FB
+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.$;No?+Du==@V'R&
De:,6ATMs7+DG^9FD,5.-u*[2F)>i2ATVL)FE8lRF*22=AM+<b67rU?67sBhF)uJ@ATKm>:-pQ?
:-pQUG%G]'@<?4#3XSVK/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp13
0f<]gCbRjV:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$>aWhA0<77De*s$F*(u6-OO^!DJ<]oF*)/8
A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A
$<BSn;b9b[4ZXrE/ibOE3AM^/+Co&,-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL
+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+
/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%
@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme
@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG>
A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!
$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.
Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-YbOn0d(3h0JXbc2_Zs/
C,dn%+DNki1*C<k0Jahd3&!03C,dn)-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!
D/F!)B-;;7Deq$K8l%htBlbC+$=P'$DfTA2DfTQ'DKKH#+Cno&@:EYdAKYT'EZee,C`mhFE+O)5
De:+a+E(_(ARfh'/g*b^6m)pGF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u
+E2@>G%kJuF!,RCDesJ;AoD]4%16Wa@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh/g(T1%15]M
2_He/0/tR<GT]US6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0:$;bbWDfQtDATDj+
Df0V=De:+a+DkP&AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;"hP
H#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59
BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0Oh
A0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).
AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=
FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U
+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.
+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!
@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#
%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;
%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\
4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Aiq3A*<P1+*M<:eX/S7ScoV;a!/h-OgDV
5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+U
FEhm:$?0NfA8bs2C2[W8E+EPi$7QDk;FO8J5uU383Zoeb2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1
C,dn'+DNki1a$Nm0Jt3e$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7
-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,
@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et
+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7
E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*
$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F
3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[
71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZU63A*<P
1*A.kA7]p3%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("
@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4
/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0d(3j0JO\b
3&!*1C,dn'+DNki1a$Nm0Jt3e$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS
:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?
D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%
@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3
F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LG
D/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'
+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.
@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i6
8g&2#F*(u1F"Rn/%15]M2_He/0/tR<GT]US6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSek
Df.0M:i^8gEZbeuG%G]8Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=
D'3n0EbTK7F"Rn/%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ
@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QW
De*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb
1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%ht
Cggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9
AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)
FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])
AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk              ~>
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
zz=:zz,'G2 DUMPMSG3 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155'
zz=:zz,' ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EXPPFX1'
zz=:zz,' GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPAS'
zz=:zz,'S SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl cre'
zz=:zz,'atemk dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamps dump'
zz=:zz,'text dumptm dumptrailer dumpwords extscopes fap fmtdumptext fromasc'
zz=:zz,'ii85 getallts getascii85 halfbits htclip jnb jscript jscriptdefs ma'
zz=:zz,'kedump makegs masknb namecats nlfrrle nounlrep opaqnames parsecode '
zz=:zz,'putallts rlefrnl sexpin sonl tabit toascii85 uqtsingle wraplinear w'
zz=:zz,'rdglobals writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCR'
zz=:zz,'EATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNR'
zz=:zz,'EF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055'
zz=:zz,' ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR'
zz=:zz,'065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 '
zz=:zz,'ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR0'
zz=:zz,'85 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 E'
zz=:zz,'RR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR103 INVGR'
zz=:zz,'OUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 '
zz=:zz,'OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 O'
zz=:zz,'K064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsf'
zz=:zz,'x apptable appwords badcn bnlsearch bnums checkntstamp checkopen ch'
zz=:zz,'eckpath checkput closedict createst defwords delstuff delwordrefs d'
zz=:zz,'idstats dnlsearch freedisk freedisklinux freediskmac freediskwin fu'
zz=:zz,'llmonty getdicdoc getdocument getexplain getgstext getntstamp getob'
zz=:zz,'jects getrefs gslistnl inputdict invappend invdelete invfetch invre'
zz=:zz,'place islib iswriteable iswriteablelinux iswriteablewin jdatcreate '
zz=:zz,'jwordscreate loadalldirs loadallrefs loadwords mainddir newdparms n'
zz=:zz,'ewregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pat'
zz=:zz,'hnl pathref putdicdoc putexplain putgs putntstamp puttable puttexts'
zz=:zz,' putwords putwordxrs rpdtrim rplctable rplcwords sortdnub''),(<<;._1'
zz=:zz,' '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ER'
zz=:zz,'R00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJ'
zz=:zz,'ODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00'
zz=:zz,'402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00'
zz=:zz,'400 WORDTESTS addgrp addloadscript addloadscript1 allnames allrefs '
zz=:zz,'betweenidx createjodtools dayage delgrp firstcomment firstperiod fs'
zz=:zz,'en getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames only'
zz=:zz,'comments pr refnames revonex today todayno updatepublic usedby yyyy'
zz=:zz,'mondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY'
zz=:zz,' DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 ER'
zz=:zz,'R0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterf'
zz=:zz,'ace MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251'
zz=:zz,' OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRI'
zz=:zz,'PTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj cr'
zz=:zz,'eateut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 do'
zz=:zz,'ctext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfrea'
zz=:zz,'der qt reb revo rm rtt textform2''                                  '
zz=:5996{.zz
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
1E\P#-p0UR/mg=U-QkfK7nHZY+@S[c:JOha9LU'm;Go5'1E]4W5t".>+A$lO:IJo7FCfK)@:Njk
8U=!)6tpO\ATDBk@qAS<5u'g6;FDX!H:gt$FDl)6F!+&#8l%itFD5W7ATDBk@q?cT:IJ/X:J=\f
9gg*r:IJ5X6m,2i6W-]Z=\qO0:I7NN;aWiM73GAm7TEAS6V^T':I7NN;aXAN=<LR3;cHmc9he&S
+C\tpF<G%1C`m2)Cia/rEarc*@WcC$A86$n@rH4'Eb0<5ARlomF_PZ&C2[X)Df9H5@rH4'Eb0<5
ARlonBOt[hDKKu/@P]-:Df'H6ATMp-+CfG'@<?'qDe'u$@UX%a+D#(+ATT&-ATVg3F*(i-E$/t0
+Dbt)A9Vs4A9/l2Dfor6Eb024Ddmg"G]Y'HA0>i6FCB!%FE8RFASbpdF(K*)A0>o0+EDRG+EM+9
@WcC$A7TCpF!,UEA79RkC2[WnBleB:Bju4,Bl@l3F`:l"FCf3*A8PamBkCptF<G^FA79RkC2[X(
Dfp)1ARoq#E-!BU/1<VC4"akp+=A:@DJW6gDeio<0HakDD/a5gD/X3$0JFVZDf'H.;f-GgAM>h]
A8,RQD/X3$0JFV[DJW6gDeio<0Haq;;f-GgAM>e\B5DKqF&QpoCLoeQF(o9)0JG1'Ci<`m;f-Gg
ATVL)F>+hRDdd0TD/X3$FCfN80d(:N@:WnkD/`EjDeio<0IJ;#-p0UR/mg=U-Qll@Bl%<pDe'u*
De'u*De*Bs@N]E(A8PajAKY`+A92j2Eb-A.De*s.DesJ;C2[X*FD5P=.4cl04?G0&0d%hdC2[Wl
@<6-mFCfN8F!,49A7KY&F(fZ,F*)IGC2[X!@<-!lFCfN8F!,49A92U+CLqU!F*)IGC2[X(FE1r6
F*(u7FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<:L\BV
Ecu#)7<3EeEcW@4F_PZ&C2[WnBleB:Bju4,Bl@l3@WcC$A86$nBkh]3BPDO0DfU,<De'u(BleB7
Ed;D<A7TUg+DPh*E,ol/Bl%?'C2[X*F(KB%Df00$B4>:b+DkP&AO9gHBk'b26r[`=FE8RA@;BFQ
D/X3$8l%iSATMs7+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A
@q@#:/1<V9+>bbt1,(F?0K:aB/iGXE0JGFC2)ud70JPL?0ebU?3&iTM3AriT1E\G,0f:XE0Jb=<
2E3HN1,(XA+>PW*2)$sE3%d*H2)mQQ2DmK;1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_m3B2DmKM
3AifQ3?U(20f:XD0JY7=1H.'D1cRBK+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1[@/iGLE1,:XB
0Jjn-0JPF=2_[!>2D[9I0f:aE2]sk00f:XD1,pmE2`WiS0K:jE+>PW*2)$sD2_HmG0fV-M0fLs4
1,(F?0K1^F/i57?3&3<I1,0n,0JPF=2_d6D1H7*L3A`EK1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*
2)$sE1bL[A1,1XF3AWZ<1,(F?0K:aE/i5IF0K(dC2`)X40JPF=3&!-@1c$m@2`E`R0d&5*0fLdB
0Jb=?2)I'B3AWEM+>PW*2_[$A1G1UD1bq'N3&<<41,(F?0K1aI/i,FD3ANTK2DH=00JPF=2_d6D
1H76J3ArWQ3$9t10f:XD1,CO>2_m0H1GUgE+>PW*2)%!D1G1L>2)@-H2)7071,(F?0K1aH/i,F?
1,CdJ0f'q-0JPI>1GL^=1c.'J2`WlP2]sk00f:XD0K(O?1c7'L1-%3H+>PW*2)$sD2_HpE2E<ZU
0f:m41,(F?0K1aC/i5FA2DmKO1c6C20JPF=2_mBG1c7'G1Gh'L1*A>+0f:XD1,pmE2)d?J1,LpL
+>PW*2)%!D1G1IB2)[0G0fV091,(F?0K1[@/iGOB1c$pA2E2g70JPL?1GCU;2`3EJ3&<<D2BXb/
0f:XD0fL^B1,h3O2)%!41,(F?0K1^F/i>CC2)@6L2)HF20JPL?1GL^=3&iWO1H.'E0d&5*0fLdB
0f1LB3&*<I1,LmI+>PW*2_[$A1G1UD1c7*G2D[661,(FA0JbC=/iPXE2DmHM2)ZR40JPF=3&!-@
2E*EG0K1jH3?U(20fLd@0KCaF3&!6N2E3TN+>PW*2)%!D1G1RF1,UjJ1,_-81,(F?0K1aH/iGRE
3&icR2)ud70JPL?1GLa>3&ioW0f:X>1*A>+0f:XD1,LUA2*!EP2*!HQ+>PW*2_[$B2(gjJ3B&ZM
0JP=*1,(FA0JbF@/iYgN2_d0D0esk,0JPL?1GLa>3&ioW1-%-E2BXb/0fLdB0f:RC3&roP2)I<O
+>PW*2)$sE3%d*J3B/iL3&<?51,(F?0K1^F/i,IA3&icM2`2^50JPF=2_d6D1b^gI1,LgC0d&5*
0f:XD0fL^@3&*ER1b^jD+>PW*2)$sE0eP7?1bq$K0f1g31,(F?0K1aH/iGRF1H.*I1bp1/0JPF=
3&!6C2_[$E2D?jA3$9t10f:XE0K(O?2`3HK3AE6C+>PW*2_[$B1bLaJ1Gh*K0f(U.1,(FA0JbF?
/ibX@1,LaB2DQC10JPF=2_mBG1c70I0K(aA1*A>+0fLdA1,ggF2D[0J2Dm6K+>PW*2)$sE1G1LC
1,CdD1,Um21,(F?0K:dB/iGFB0JG171Gg400JPF=2_mBG1c70J1GCdE1a"P-0fLd@0KCaF3&*<G
1Gq!D+>PW*2)$sC2D-gC2)@6J3AiN61,(F?0K1^F/i5FD3ArlP2)cX50JPF=2_m0A1c7'I2*!KM
2'=Y.0f:XD1-$sD2)[6M2`*HN+>PW*2)$sE3%d*H2`*<G1cIB:1,(F?0K:d@/i,ID1,UsH2_cF1
0JPF>0JG@:2*!?M1bq!H1*A>+0fLdB0f1LC0JGLB0K1[F+>PW*2)$sE0eP:@2_[!G2`!021,(F?
0K1^F/i>CC2)@6L2)HF20JPL?1GL^=3AE3C2DR!@3$9t10fLdB0f1LC0fM'K3B/oO+>PW*2_[$A
1G1UE2`!0K0f^s21,(FA0JbF?/ibXB3&`fN2)cs8-p07-0eak.0JPF=2`!0@2Dm<G3&EBH2]sk0
0f:XD0fL^A1GUsJ3B&iV+>PW*2)$sE0eP:?3&*3E2`*?61,(F?0K1[G/i>F=3&NKI3B/-:0JPF=
2_m'>2`3BI3B/oR2BXb/0f:XD1-$sD2`<KJ3B8iL+>PW*2)-d=3A*0F2`EEL1H@?91,(F?0K:aE
/i>LC3&`QO2DlU40JPF=3&!6C2E!HO0K1gG1a"P-0f:[>0JtI@0K1pL2D@$G+>PW*2)%!D2_I$C
2DdBP0JbX11,(F?0K1^F/i5FC2D@!K3&Da50JPF=2_m-@1cR3G2`3TM1a"P-0f:XD0KCaC1GggC
3A<-F+>PW*2)$sE0J5==3B/`K2D@!21,(F?0K1dA/i,CB0f_$J1c-=10JPF>0JGL>2)I*D3&iZM
+>PW*2)%!D2D-mJ0JP@=1GLd11,(F?0K:aE/iG^D0fM$H2E;m80JPF>0JG@:2DR'G1,LmC2CU1*
4>J$<,Vh&.2_[$A1G1UD1c[QN2E<N81,(F?0K1[D/i5FE2E3TM1H6L40JPF=2_[-B1c7'E3ANTP
0d&5*0f:XD0K(O?2Dd*B1b^[D+>PW*2)$sC2D-gC2E!?F2_m<71,(F?0K1[D/i5IE0K(mH2)cX5
0JPF=2_[-B1c@9I3AE3H3$9t10fLdB0f1LB3&36D2DHp@+>PW*2)%!D1G1RE1bpsG1cIE;1,(F?
0K:aB/i5=A1,^mD3&2U30JPF=2_[-B1c@0E0f1R>2]sk00f:XE0Jb=<2E3KN1H.<O+>PW*2)$sC
2D-gE2D@$K1Gq*61,(FA0JP7A/iYgF2)7*L0fUU5-p07-2'aq20f:XD0KCaB2)d6L1G^mI+>PW*
2)$sC3A*-G1c-mA3AWW;1,(F?0K1[G/i5FB0KCsM3B83;0JPF=2_[6E1c7'L1Gq*K1a"P-0f:XD
0KCaB2)I'B3A<?I+>PW*2)$sE3A*3G3A<?F2_[-41,(F?0K1[G/i5FB1b^[F1H6L40JPF=2_[6E
1c7*D3A``V3?U(20f:XD1-$sF1H.$E1,1R>+>PW*2)$sC3A*-G1bpaF0K(^9/1<V9+>G\u1,(F?
0K1[@/iGLE1,:X>3ADX30JPF=2_[!>2D[9I1,LdI3?U(20f:[>0JtI>0JPLG1-%9N+>PW*2_[$A
1G1UF1cRHN1Gq'51,(F?0K1aA/iG[D1c%'L2`W!90JPF=2_[$?3B/uU3&E?I1E\G,0f:XD0Jb=A
3B&iO0ebI?+>PW*2)-d>2D-dC3AriO1,M!61,(FA0JP7A/iYgM1,h*L1G^./0JPF=2_d!=1bgsM
3ArcP1E\G,0f:XD0eb4:0f:aF1G^pK+>PW*2)$sC1+kI@2_m*E3B/u@1,(F?0K1[@/iGLE1,1X?
2]sk00f:XD0JY7=1H.'D2)$gB+>PW*2_[$B2(gjJ3B&]R1,q*51,(FA0JbF@/iYgN2`!-C3?U(2
0f:[>0KCaC1bggI0JP:>+>PW*2_[$B1bLdC3&!-H2Dd341,(F?0K1aA/iG[D3&iZO2'=Y.0fLdB
0et@>0eb=>2`<BK+>PW*2_[$B1+kFE3B&fM1cQU50JPL?1GLa>3&ioS3ArWH2BXb/0fLdA1,U[A
2E*HH1c%$G+>PW*2)$sD0J51<0JY==2Dd-21,(F?0K1^?/i5:@2)$gC3&Mg60JPL?1GLa>3&ioW
0f:aG+>PW*2_[$B2(gjJ3B&ZM1c7$21,(FA0JbF@/iYgN2_d0H0Jb./-p014/1<V7.4cl00I\P$
4>8384>6                                                                  ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
