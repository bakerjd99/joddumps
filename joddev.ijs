NB. JOD dictionary dump: 05 Dec 2019 14:03:52
NB. Generated with JOD version; 1.0.0 - dev; 19; 05 Dec 2019 14:02:18
NB. J version: j901/j64avx/windows/beta-s/commercial/www.jsoftware.com/2019-12-02T12:51:33
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


ERR010=:'invalid name pattern(s)'

ERR105=:'unreadable or missing backup timestamp'

ERR106=:'invalid backup number(s)'

ERR107=:'not in backup(s) -> '

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.0 - dev';19;'05 Dec 2019 14:02:19'

JODVMD=:'1.0.0 - dev';19;'05 Dec 2019 14:02:18'

MAXNAME=:128

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


backnum=:3 : 0

NB.*backnum v-- increments backup pack count and backup/restoration timestamp.
NB.
NB. monad:  backnum ia
NB.
NB.   backnum 0 NB. typical call

NB. HARDCODE pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (>:y{nums) y}nums else. nums=. 0 , 6!:0'' end.
((0{nums) , 6!:0'') jreplace WF;1
<.y{nums NB. integer result
)

backupdates=:4 : 0

NB.*backupdates v-- scans put dictionary backup files and returns
NB. backup dates.
NB.
NB. This  verb  attempts  to   read  component  index  1  of  put
NB. dictionary  (jwords)  backup files.  The resulting data takes
NB. these possible forms.
NB.
NB. verbatim:
NB.
NB.   1. bnum,timestamp - pack count and timestamp
NB.   2. bnum,0         - pack count and 0
NB.   3. _1`            - jread error - probably an older unreadable binary
NB.   4. _2             - trapped jread error - serious problemos
NB.
NB. dyad:  bt =. blObj backupdates ilBnums
NB.
NB.   NB. DL is put dictionary object
NB.   NB. bnums is a list of put dictionary backup numbers
NB.
NB.   DL backupdates bnums

NB. HARDCODE: component 1
uv=. >jread"1 (<1) ,.~  (<BAK__x) ,&.> (":&.> <"0 y) ,&.> 0{JDFILES
bstamps=. }."1 uv [ bn=. 0 {"1 uv

NB. format timestamps
bstamps=. (<"0 bn) ,. <"1 tstamp"1 bstamps

NB. errmsg: unreadable or missing backup timestamp
bstamps=. (<ERR105) (<(I. 0>bn);1)} bstamps
)

bchecknames=:4 : 0

NB.*bchecknames v-- checks backup name patterns.
NB.
NB. dyad:  ilObjBn bchecknames blclBnames
NB.
NB.   NB. valid ordered put dictionary backup numbers
NB.   bn=. rv_ajod_ checkback__ST__JODobj _1{0{DPATH__ST__JODobj
NB.
NB.   NB. first item of (x) is a dictionary object code
NB.   (WORD,bn) bchecknames__ST__JODobj <;._1' booo hhh re.12 bx.14 er.99'
NB.
NB.   NB. names are not required for the special DICTIONARY case
NB.   (DICTIONARY,bn) bchecknames__ST__JODobj <;._1' .71 .73 .65'

NB. errmsg: invalid name pattern(s)
if. +./ badcl&> y do. jderr ERR010 return. end.

NB. split backup name patterns
nbk=. (splitbname&> y) -.&.> ' '

NB. if backup number is absent use most recent
nbk=. (<":1{x) (<(I. 0 = #&> 1 {"1 nbk);1)} nbk

NB. names must be valid
if. DICTIONARY = 0{x do. bnm=. 0 {"1 nbk 
elseif. badrc bnm=. checknames 0 {"1 nbk do. bnm return. 
elseif.do. bnm=. }.bnm 
end.

NB. backup numbers must be valid
if. 0 e. (1 {"1 nbk) *./@e.&> <DIGITS do. jderr ERR106 return. end.
bn=. , _1&".&> 1 {"1 nbk

NB. errmsg: invalid backup number(s)
if. 0 e. bn e. x do. jderr ERR106 return. end.  

NB. return unique checked names and backup numbers
ok <~.bnm ,. <"0 bn
)

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
NB. monad:  bget cl|blcl
NB.
NB.   NB. get last word backup
NB.   bget 'oops'
NB.
NB.   NB. collect from most current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget cl|bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.   5 bget }. bnl '.'  NB. dictionary document versions in all backups
NB.
NB.   NB. get a suite header from particular backup
NB.   3 bget 'sweet.04'
NB.
NB.   NB. get long documents of an object
NB.   2 9 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   NB. all short explanations of words in last backup
NB.   0 8 get }. revo ''
NB.
NB.   NB. three versions of a group's header - similar to (get) where
NB.   NB. (2 get 'group') returns the group header
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's word list

WORD bget y
:
msg=. ERR001

if. (2<#x) +. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. are backups present?
if. badrc uv=. checkback__ST {:0{DPATH__ST do. uv return. else. bn=. rv uv end.

NB. format standard (x) options
x=. x , (-2-#x) {. DEFAULT 

NB. are backup names and numbers valid?
if. badrc bnm=. (({.x),bn) bchecknames__ST ,boxopen y do. bnm return. else. bnm=. rv bnm end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (WORD,0) bgetobjects__ST bnm
    case. EXPLAIN  do. WORD bgetexplain__ST bnm
    case. DOCUMENT do. (WORD,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST bnm
    case. EXPLAIN  do. TEST bgetexplain__ST bnm
    case. DOCUMENT do. (TEST,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. GROUP bgslist__ST bnm  
    case. DEFAULT  do. GROUP bgetgstext__ST bnm
    case. EXPLAIN  do. GROUP bgetexplain__ST bnm
    case. DOCUMENT do. (GROUP,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST bnm
    case. DEFAULT  do. SUITE bgetgstext__ST bnm
    case. EXPLAIN  do. SUITE bgetexplain__ST bnm
    case. DOCUMENT do. (SUITE,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST bnm
    case. EXPLAIN  do. MACRO bgetexplain__ST bnm
    case. DOCUMENT do. (MACRO,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST bnm
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

bgetdicdoc=:3 : 0

NB.*bgetdicdoc v-- get backup versions of the dictionary document.
NB.
NB. monad:  bgetdicdoc btNameBn

NB. there is only one document per dictionary unique 
NB. dictionary backup numbers insure no redundant file reads
bn=. ~.1 {"1 y 

NB. put dictionary object  !(*)=. doj
doj=. {:{.DPATH

NB. dictionary document results combine dictionary name 
NB. with backup numbers to differentiate versions
NB. NOTE: the resulting label may not be a valid J name
ro=. ((<DNAME__doj) ,&.> ":&.> bn) ,. a:

NB. backup path and file suffix
'pth fsx'=. bpathsfx WORD 

ubn=. ;bn
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file    

  NB. read document component 
  if. badjr dat=. jread fn;CNDICDOC do. jderr ERR088 return. end.
 
  NB. update results
  ro=. dat (<(I. bob=ubn);1)} ro

end.
ok <ro  NB. return object table 
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok (<'NIMP bgetdocument'),<y
)

bgetexplain=:4 : 0

NB.*bgetobjects v-- get short explanations from backups.
NB.
NB. dyad: il bgetobjects btNameBn

NB. object names 
nnm=. 0 {"1 y [ obj=. 0{x

NB. results are boxed name value tables
ro=. nnm ,. a:

'pth fsx'=. bpathsfx obj

NB. fetch backup objects by backup number - optimizes file reads
cpm=. CNLIST,CNEXPLAIN
ubn=. ~.bn=. ; 1 {"1 y
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file

  NB. read backup explanations errmsg: read failure
  if. badjr 'ixn sex'=. jread fn;cpm do. jderr ERR088 return. end.

  NB. explanations must exist in backup(s) errmsg: not in backups ->
  sn=. nnm {~ rx=. I. bob=bn
  if. 0 e. uv=. sn e. ixn do. (jderr ERR107),(sn #~ -.uv) ,&.> <NDOT,":bob return. end.

  NB. update results
  ro=. (sex {~ ixn i. sn) (<rx;1)} ro

end.
ok <ro  NB. return object table 
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. monad:  bgetgstext ??
NB. dyad:  ?? bgetgstext ??

ok (<'NIMP bgetgstext'),<y
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. dyad: il bgetobjects btNameBn

NB. object code, offset and names
nnm=. 0 {"1 y [ 'obj offset'=. x 

NB. results are boxed name value tables
NB. words & macro have three columns
ro=. nnm ,"0 1 (1 + (offset=0) * obj e. WORD,MACRO)$a:

NB. long document results are column subsets 
if. 0=offset do. cols=. i. {:$ro else. cols=. 0 _1 end.

NB. backup path and file suffix
'pth fsx'=. bpathsfx obj

NB. fetch backup objects by backup number - optimizes file reads
cpm=. CNLIST,CNCOMPS
ubn=. ~.bn=. ; 1 {"1 y
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file

  NB. read backup directory index  errmsg: read failure
  if. badjr 'ixn ixc'=. jread fn;cpm do. jderr ERR088 return. end.

  NB. objects must exist in backup(s) errmsg: not in backups ->
  sn=. nnm {~ rx=. I. bob=bn
  if. 0 e. uv=. sn e. ixn do. (jderr ERR107),(sn #~ -.uv) ,&.> <NDOT,":bob return. end.

  NB. read object components
  if. badjr dat=. jread fn;offset+(ixn i. sn){ixc do. jderr ERR088 return. end.

  NB. update results
  ro=. (cols {"1 >dat) rx} ro

end.
ok <ro  NB. return object table 
)

bgslist=:4 : 0

NB.*bgslist v-- get backup versions of group/suite lists.
NB.
NB. monad:  bgslist ??
NB. dyad:  ?? bgslist ??

ok (<'NIMP bgslist'),<y
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
NB.
NB.   14 bnl '.'  NB. display pack/backup dates

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT

NB. special list backup dates case first
if. (INPUT=0{x) *. (,NDOT__ST)-:alltrim y do. x bnlsearch__ST y return. end.

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
if. badrc uv=. checkback DL do. uv return. else. bn=. rv uv end.

NB. search name pattern and requested backup
'pat rbk'=. splitbname y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

NB. nonempty patterns must be valid J names without embedded locales
if. #uv=. pat -. ' ' do.
  if. badrc uv=. checknames pat do. uv return. end. 
end.

bdot=. (,NDOT)-:alltrim y 

if. bdot *. INPUT={.x do.

  NB. show pack/backup dates
  ok <DL backupdates bn

elseif. bdot do.

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

bpathsfx=:3 : 0

NB.*bpathsfx v-- backup file path and file name suffix.
NB.
NB. monad:  (clPath ; clSfx) =. bpathsfx iaObj
NB. 
NB.   NB. calls in object context
NB.   bpathsfx__ST__JODobj WORD_ajod_
NB.   bpathsfx__ST__JODobj MACRO_ajod_

doj=. {:{.DPATH         NB. put dictionary object 
fsx=. (;y{JDFILES),IJF  NB. backup file name suffix

NB. backup file path !(*)=. doj
pth=. ". ({.;dncn__doj y),'P__doj'
pth=. (>:pth i: PATHDEL) {. pth

NB. return path and suffix
(pth , (;{:JDSDIRS) , PATHDEL);fsx
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
NB. 19aug27 load task addon first for J 9.01

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
NB. load task addon before executing any JOD start up code - changed for J 9.01
hc=.head,'load ''task''',LF,'(9!:41) 0',LF

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

checkback=:3 : 0

NB.*checkback v-- return list of put dictionary backup numbers.
NB.
NB. monad:  ilbn checkback baObj
NB.
NB.   checkback {:0{DPATH  

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__y do. jderr ERR103 else. ok bn end.
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
NB.   ed ;:'many words mashed into one edit script'
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

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',oname) changestr DOCUMENTCOMMAND_ijod_
end.

oname et text
)

releasejod=:4 : 0

NB.*releasejod v-- final JOD release steps.
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
NB. 19nov29 remove (beforstr, afterstr) in (jodstore) test - verbs in superclass (jod)

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
assert. (a: -.~ (gdeps 'jodstore') -. JPROFILE , ;:' beforestr afterstr') e. grp 'jodstore'
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

splitbname=:'.'&beforestr ; '.'&afterstr

tstamp=:3 : 0

NB.*tstamp v-- standard j 8_07 library timestamp.
NB.
NB. A renamed version of the standard  J 8.07 era  timestamp. JOD
NB. used an earlier version of this verb, see (tstamp2), that did
NB. not handle all zero timestamps.
NB.
NB. monad:  clDate =. tstamp il | fl
NB.
NB.   tstamp '' NB. now timestamp
NB.   tstamp 0 0 0 0 0 0  NB. zero stamp

if. 0 = #y do. w=. 6!:0'' else. w=. y end.
r=. }: $ w
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. w
d=. '+++::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='+') } d
(r,20) $ d
)

tstamp2=:3 : 0
NB.*tstamp v-- time stamp
NB. older timestamp - replaced with new J definition
yy=. <.y,(0=#y)#6!:0 ''
'yy m d h n s'=. 6{.yy
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
f=. _2: {. '0'&,@":
t=. (2":d),(m{mth),(":yy),;f&.>h,n,s
r=. 'xx xxx xxxx xx:xx:xx'
t (I. r='x') } r
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1j41,^71+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1Gg45+>tqs0eje.3$9q1+>Pku
1a"V4+>GPm1c?I21*AA5+>GSn1cQU40H`2-+>GSn1,L+4+>bbp1E\P1+?:Q'2BXt%1H-F23$:%9
+?:Q%1*A=p1,C%-0H`,,+>GPm1,pC7+>Yer2]st<8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1
Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;CDesJe
:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`i
ALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_
+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'T6!-lJ9gro-
G\M#;D'3Y+DJ+')+E(j7A8,OqBl@ltEd8dF@;TRs@UWb^DKTf1DI[]uD.RU,F!+q#@r$4++E1b!
CER,*F`):D@;]Tu@UWb^F`9!SATMs3Eaa'(Df-\>Bl.F&FCB$*@UWb^F`:l"FCfN7@ps7r+E2IF
+Co1rFD5Z2@<-W9@UWb^F`8I8Bl%@%+CT.u+ED%8F`MA@+C\bhCNXS=A79RkF(/WmARfLn@;TRs
@q]F`CNCV-@:O(qE$0%,D.Oi/@<?U&Ec,r-B4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3e?F<G+.
@ruF'DIIR2+C\bhCNXT;@V97oA8,OaDe!EkF<G%$@r$4++Eh=:F(oQ1F!,C5+EV:.+Co1rFD5Z2
@<-W9A8bt#D.RU,@V97oA8bt#D.RU,B4Z0-@UWb^F`8IHATDj+Df0V=De:,1@VTIaF<G+4@s)X"
DKKr/B4Z0rG]7J-Bl7QpF<G%$@r$4++Eh=:F(oQ1F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%
DKB9"ATVR+FCf]=B4Z0-@UWb^F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcY]&ATVj"
C1UmsF(]'++E(_(ARfh'+D,Y4D'3:r@r$4+F(/d'Ch[s4B4Z0-@UWb^F`8IHATDj+Df0V=De:,)
Ec6)>06;8MFCcS2BleB;@W$!uBleA=DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'
@:O(qE$/b,Ch7ZsDJXB*@<,jkF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4
F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0@W5atBQId1@UWb^F`8I8Bl%?'E+*j%
+CT.u+D,>(AKYl!D.Oi2F_56"G[bf0Ch.:!A7KOpE,oN2F(JlkF_PZ&F!+m6Ap%p+Gp$U8D/aN,
F)to'+A,Et+Dbt)A0>u*F*&OG@rc:&FCSuq@r#O^@r$0tF*&O:DfQtBBOr<*Eb0<'DI[6#De:,2
F`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATMEnARoLs+Co1rFD5Z2@<-W9DdmHm@rud4ASbpdF(K*)
A7fOn@;I&Y:IH=GASbpdF(HJ8FCfE4F)Yr0FCK,rD.Rd-Ch[u6@UWb^F`8I@@;TQuE+*j1ATDZ2
@r-7.FCB$*F*(i.A79Lh+DN#Y?SFD]Ch[@!@<-W9FD5T'F*(i-E--/C@;Ts=FD5T'+EMX5D/^V9
Ch.*t+EV=7ATMs%D/^UL+ED%4CgggbA0?)1FD)e7ATo7h+Co%qBl7X,Bl@k               ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)l^;+>P&o0d&A70Jst-0H`,+3B/-90H`)*1,C[.0ea_11,pC22]sh00f^@30d&5*1c$7/2]t(=
2.C30FAm$pCLo1R:-pQ_@V97o;f-GgAM>e\F=f'e-t6h#F=A>@EbBN3ASuT4F)>i2AKZ)+F*)IU
%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8c:
$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67sB'
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPRuARdDN%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)
A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)
A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6mj*P67sBB0d%T667sC+@;TjmEZf:<+:SYe$?Tfm@rsjp+=D8B
F*)/8A2#\b%13OO:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j
5U[k++?hhO-p8n)-RU8j.1HVZ67r]S:-pQU:-pQUB4YslEaa'$+CT)&+E27?F(o*"AKZ/)Ch[E&
-t6h#F=A>@EbBN3ASuT4E+*j1ATD[0%15is/e&._67sBqDIYgj+AY<r771$L6XO8:De*3+6qKaF
8P`)I;H[@8C2[Wi+<V+#:-pQB$;No?+AP6U+Eh10Bk/?&AS-$,.!R0`@<-"'D.RU,F!*%WBl7Es
F_#3(B-:c%Bk1dc+=MI`%15is/g+t=Eb@Nr+=K?d/he^s/0H?'+tt-SDIY+</0H>lHRMZV8ju*H
:.&AsC2[Wi.6BL33@Q'[$;No?%15is/g*nU/g,=GCh[E&EbT0"F<DuW.3N&>B6A'&DKI"?@<?U&
Ec,q-$;No?+AP6U+<VdL+DtV)AKW*<4!5Y`@;TR.@rHL-F<D\f+<YK7F*&OCAftPk@r$4++DtV)
ATJ:f:-pQUEaa!$4ZX]5DIIBn-QjNn+=D&8D.P>0Dfor>-QkJn+=CW7@r+J,@;TRs-OgDX67r]S
:-pQU:-pQUG%#3$A0<:0B4Z06+CT;'F_t]-F<GO2FED)7DK?6o:-pQUC12-q4ZX]J+u(3%+u(2a
3[QIC+>Fum+>P'd+u(2_4s279-Qll2ATT%B.3L/a9KF:N+=nX^+=K?g@<-!0+=nWt-ujBJFCcdO
4s587Eaa!$.3L/aHTH1UEb>gg:-pQB$;No?+AP6U+EqL1DBL?P.3N>G+>k9)+@Jdg<(Tk\5uLi.
@;^?5DIIBn+E1b0F<GL6+DtV)AM.J2F`):DE+*j1ATD[0+CT;%+DGJ+DfTE"%15is/g+n;Eb@Nr
+DP>*B-8`J-T*#UB4Z0--RU8h-QkJn-T*#UB4Z0--RUNVDfor>-RU8a4!5n.+C\tpF<G%/@r+MN
F`);B-OgDX67r]S:-pQU:-pQUB6%p5E-!.1DIal2F_Pr/F!,.)G%De)DBN@uA8-."Df0!"+Cei$
AKZ)5+D,2,@qZuo@:O(qE$0%,D.Oi+BleB;%15is/g+n;Eb@Nr+DP>*B-8`J-Scf!+C\tpF<DqY
DIIBn-RU8a4!5n++>G!JB4Z0--RWe?D.P>0Dfor>-RU8a4!5n++>G!JB4Z0-@VfOj6;Cs+ATK4.
$;No?+DP>*B0A9uC12-q+=nW_1E\Cp@V97o+=AOS@;TR'-RU#u+=Arf0d'q<ATT%B-Z3@0AM.J2
F`):K-RU#u+=Arf0d'q<ATT&(Ch%9J:18!NF!hD(%159QHZ*F;FC])qF<Fd11E^UH+=ANG$4R>;
67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1
A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+D#S%F(HJ&
DL!@6@:O(qE-!-2$:IQN3Zrc1HS-F/:dJ&O?XH`2?XHE$6uQOL%14g4/1_nl0d/S82(9Y&+Co2,
+@8@e?XH2p/12o"Bkh6-%13OO:-pQUFE2XLF(Jd#@q]RoB-;D3ASrW4BOu3q+CT;%+Du*?@UWb^
F`;CE/KeVLE+NO$ARlopEcQ)=%16uaEZeh(ATT%BDJsW1Bl7Q2%16uaEZeh(ATT%V3[]#f+EM+*
-OgE#ATAo&B4Z0--YR(3AL@oo%15is/g+YEART[l+EV:;ARuun@:O(qE,uHq%15is/g+b?EcZ=F
DdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#TtFC])qF:AQd$;No?+EM+(Df0).DdmHm
@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6l
A0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca
3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])qF:AQd$;No?+AP6U+EMI<AKYGjF(o,,Bl8*&
Ch[E&@<-"'D.RU,F!*%WAU&0*@ru9m+D#S6DfQ9oDImi20H`=t0Hah;ATT%BG[YW*?[$O/DJ(=>
+AP6U+Dbb5FE8RCAftN(+Dl%<F<E=]%16uaEZeh(ATT%B/n$+:$>sEq+>b3MB4Z0--S?u*-OgE#
ATAnK+C\tpF<Dq`/gh)8DImi2@V97o+>=63DImi2@V97o+?V#!%13OO:-pQU:-pQU8g&"[D.Rc2
GA2/4+D#D!ARo=_A0>],@ps1bF!+n3AKYl/F<G:8+A,Et+Co1rFD5Z2@<-'nEt&IoATAo&B4Z0-
-Y[X/?[$O/DJ(=+$>sEq+C\tpF<DrFF'i9cG%GPu?[$O/DJ*O$-OgE#ATAo&B4Z0--ZaBDCi!I&
Ec5i.?RH9iDImi2@V97o+=CSE-QjNS+<Ve%67sBuDfd+1+A*bo@;TQb$4R>;67sBU67sBhE,]B+
A9/l'F`MM6DKI"5Bl\9:+C\bhCNXS=DKTf*ATAn&$;<`a<'j>[9g(N[4#%k)+C]5)+=Ach+:SZq
ATAo&B4Z0--Z+-9@UWeS-S.qW;cH(Y<D<o0DImi2@V97o+=D#O?XI8NA1&p%5uU`L:/t!t$>sEq
+C\tpF<DrGF`VXO?=%&aAp%o;/5/?.<'j>[9aqF=$;No?+DG_7F`M%9G%#E*Dfp+DDdmHm@ruc7
@<,p%Bl5&0@<6N5@UWb^F`7cs4tq>%A0>u)Bk)6->9G^EDe't<-OgDTF`VY$ART(^AU-F"+DEGN
1CX[^F`(u+GslRkGs+22-V5FkD]j7;@<<V`+CoC5@V'%XF`V+:8K_GY+EqL-F<F-t@;RA$$:f#F
<-N%mBkM+$4ZX]4/j9^O9mK]H@qg$cATD6C3Zoq+%15gT7<icfBk(k!<b6;\4ZX]A+?CW!%17>&
.j0*H$7QDkATAo8D/a<0@j#`5F<EY+-VAN&FAQOW@q]G!+@pWmCLqcZDfU+G7rMp;GA1l-B4uB0
9mK]H@qg$cATD6&9mK0PE,95uBlmBeEagC=%13OO:-pQUF)Po,+EM47Ec`FJDfTA2AU&01@;]Lq
Bl@m1%16Ze+>=ot+E2IF+=Bd(F*(5i@:Nt^Gpb[$@<,p%FD,B+B6,29ARTCkGp$jEF*&ODART(^
Gpa%.ATAnI+?1K_F`\`R9mK0PE,95uBlmBeEagCX-Y7OACh[BnF<Ga<Eaj)4B4Z0-DJpY<ATMg%
@rri*Ec5e;C*7/3EclFN%13OO:-pQUF)Po,+Dbt6B-;D:Eb$;(G]7J-DIIX$Df0V*$:/KE=)W+p
:2`sF@<k!s+>=p!+>=63+<Y*/C`mq?Ebce+DIal-D]j"8@<iu4@;BFq+DP=pCER%.A9D^)+C]87
%144#@;Ka&GAhM;+CT.u+Du*?E,8s.+DkP&ATJu/@:O'q@3B*'Cht5'Dg;d!+<Y*/C`mq?Ebce+
DIal-D]j"8@<iu4@;BFq+DP=pCER%.A9D^)+C]87%144#@;Ka&GAhM;+CT.u+Du*?E,8s.+DkP&
ATJu/@:O'q@3B*'Cht5'Dg;d!+<YT7+Cf>4EcYe7C11Uf+Eq78+CQC'F_kk:@W-N7@;^@7@<iu:
D]iLt@r!3/D]j7BEbce4@:O'^$7QDk%16Ze+>=ou+E2IF+=BZtA5mbeCh[NqF=0.9Ci!0kEbeEg
:i'Qc%16Ze+>=ou+E2IF+=Bm/<+09NFB2sn@OF6'Ci!0kEbeEg:i'Qc%13OO<+U,m<+U;r0KhH>
-Zip@F<G[:G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a3b2r8DKTf'@;9^k?RI31$<1SX
FAugrF>5p>+=D#EEb-A8ATMr9FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(
D-p^dDe*3&-OgD^ATMrmAU&;P4ZX]5AThX&+Dl%;AKZ)+F*&OHAU&;>D.-sd+E_R9EHPh8FDi:D
BPDN1FCfN83Zoe$,!'7KA8ZO,?X[\fA7$]3%16Ze+>G!XF`\`R<+U,m<+U;r0IJq]ATMrmAU&;N
%16Ze+>G!XF`\`R<+U,m<+U;r0df%^ATMrmAU&;O%16Ze+>G!XF`\`R<+U,m<+U;r1+,._ATMrm
AU&;P%13OO:-pQUF)Po,+EM47Ec`F4DIal+Df021FCfN8+D#e:Cgh3iFD5Z2Et&IfEZd(Z3$<0_
F<Dr1ATMrmAU&;P-T`\oE+No0FCfN8F!+n3AKYi.Eb-A6AThWnCh[d"+EV:*DBNk:ASrW#De*E,
%16Ze+>G!!+E2IF+=C-"F*(AmG]YVe4$d\!=)W+p:2`sF@<i:h%15g<@rcKeAU&;N4ZX]5D.-pp
D]j.5G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a3b2r8DKTf'@;9^k?RI31$;Fr=Ec4og
G]YZ'3ZoeeDfTD3D.-ppD]j.5G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a3b2r8DKTf'
@;9^k?RI31$>"6#1a$a[F<Dr*@:O=r<+U;r0IJq]79EMr@;9^k?TUtj@rcKeAU&;N%16Ze+>b3[
F`\`R9jqOPDcC:mF>5.)<(0ng?X[\fA7%Dm@:O=r<+U;r0b"I!$;No?+EMI<AKZ&-DfTqB@;]Tu
Ci=3(+EV19F<G.>E,8s#@<?4%DK?6oATAnM+?1K_F`\`R9jqOPDcC:mF>,((-Z*R8Bcq8$@rcK1
AU&01@;]LqBl@l:%16Ze+>b3$+E2IF+=Bll@rcKeAU&;N-TaV1CfbOqCJJeECghSu$4R>;67sBp
DKBB0F<G+.@ruF'DIIR2+CoD#F_t]-F<E.XBl8!7Eb-A8ATMr9A8,OqBl@ltEd8d<De!p,ASuT4
BlbD@EbTW,@:F%a%172fBk)6-/NP"90mdGFA0<QK%16Ze+CoG4ATT%B6r-0M9gqfV6qKaF-Ta$l
$>"6#2'?j\F<Etc@mk6F<+U;r4ZX]5A8,OqBl@ltEd8d<De!p,ASuT4FCf]=+DkOtAKZ,5BlS9,
+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&-OgCl$;No?+D58'ATD4$ATJu1@<6N5@UWb^
F`7cs4tq>&@:O(`+EV..@rrh&$;<`a<'j>[9g(N[4#%k)+C]5)+=Ach+:SYe$;No?+C\c#Bk&9/
@;KXg+CT;'F_t]-FE7luATAo&B4Z0--VAN&FAQOW@q]G!-QjNS+<VdL%16Ze+C\tpF<Dr'F`VY$
ART(^AU,XS9L2TV6;CNT%16Ze+C\tpF<EY+-VAN&FAQOW@q]G!+@pWmCLqcZDfU+G7rMp;GA1l-
B4uB7+:SZhEZeh(ATT%C4$"`]F`VY$ART(^AU,CgDe)gkBl%KrBQPUN+=nil4s2s]5uU`L:/t"2
+<Vd9$>"6#0Hah;ATT%B8p,2s:h='FBOuH:+<VdL+<Vd9$>"6#0Hah;ATT%B8p,2s:h='FBOuH:
/5/?.<'j>[9ctPf$>"6#0Hah;ATT%C4$"`[F`(u+GslRkGp#UqA5mbeCh[NqF=/L[/1)u5+?W=`
;cH(Y<D<o0ATAnJ+C\tpF<Dr1ATMrmAU&;N-QjNS+<VdL+:SZhEZd(Z@V97o+=C-"F*(AmG]YYf
/5/?.<'j>[9ctPf$>"6#0d'q<ATT%V3[[m<F*(AmG]YV^<+U,m<+U;r1++1e+:SZ#%15is/g)nl
@V97o+=D&8D.P(;+<VdL+<Vd9$;No?+>P'KB4Z0--Z3@0AM.J2F`):K+<V+#:-pQU1*C%=ATT&(
Ch%9J:18!NF!)SJ+:SZQ67sB:+C\tpF<DrK@;TR'+<VdL+<VdL%15is/g)qm@V97o+=D&8D.P>0
Dfor>-QjN@$;No?+>Y-LB4Z0-@VfOj6;Cs+ATJt:%144#%16Ze+>b3MB4Z0--V\#ZEc4ogG]YVe
+<VdL+<V+#ATAnM+C\tpF<Dr*@:O=r<+U;r0IJDF5uU`L:/t!t$6UH#$;No?+>b3MB4Z0-@VfOj
6;Cs+ATJt:+<V+#:-pQU2'?@@ATT%BDIIBn-QjNS+<VdL+:SZQ67sB<+C\tpF<DrK@;TR.@rHL-
F=/1R%15is/g*"o@V97o+C].sCdLm*D.Rc2+:SZ#+:SZhEZd%Y3$;[CATT%B9mK0PE,95uBlmBe
EagC=+<VdL%16Ze+>=ot+C\tpF<Dr*GsussCh[BnFB2sn@OE^#5uU`L:/t!t$>"6#0H`=t@V97o
+?MV39mK0PE,95uBlmBeEag.]De)gkBl%KrBQPU2$>"6#0H`@u@V97o+=BZtA5mbeCh[NqF=/1R
%144#+<V+#:-pQU0H`@u@V97o+=D&8D.P>0Dfor>-OgDX67sB7+?:QRB4Z0-@VfOj6;Cs+ATJt:
%15is/g)kk3$;[CATT%BDIIBn-QjNS+<Vd9$;No?+>Fuu+C\tpF<DrK@;TR.@rHL-F=.M):-pQU
0d&Fu@V97o+C].sCdLm*D.Rc2+:SZQ67sB8+?:QRB4Z0--Z3@0ALATC+<VdL%15is/g)kk3?VdD
ATT%BDIIBn/n8gBDKI68$;No?+>G!!+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1*AP!@V97o+=D&8
D.P(;+<VdL+:SZQ67sB9+?1KQB4Z0--Z3@0AM.J2F`):K%15is/g)nl3$;[CATT&(Ch%9J:18!N
F!)S7$;No?+>P'"+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU1*AS"@V97o+=D&8D.P>0Dfor>-OgDX
67sB9+?:QRB4Z0-@VfOj6;Cs+ATJt:%15is/g)qm3$;[CATT%BDIIBn-QjNS+<Vd9$;No?+>Y-"
+C\tpF<DrK@;TR.@rHL-F=.M):-pQU1E\Y"@V97o+C].sCdLm*D.Rc2+:SZQ67sB:+?:QRB4Z0-
-Z3@0ALATC+<VdL%15is/g)qm3?VdDATT%BDIIBn/n8gBDKI68$;No?+>Y-#+C\tpF<G%/@r+J,
@;TRs+<V+#:-pQU1a"b#@V97o+=D&8D.P(;+<VdL+:SZQ67sB;+?1KQB4Z0--Z3@0AM.J2F`):K
%15is/g)tn3$;[CATT&(Ch%9J:18!NF!)S7$;No?+>b3$+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU
1a"e$@V97o+=D&8D.P>0Dfor>-OgDX67sB;+?:QRB4Z0-@VfOj6;Cs+ATJt:%13OOATAn]Bk'PL
@mXU6CHX^$2'?@@ATT%B-OgCl$;No?+CoD#F_t]-F<G[:G]\!LD09oA+DkP/@qZ;Y-p&Pu3\2C;
+FPjb6tp.!Ddu+B@r!M9/NP"BBk'PL@oR#aF:AR"+<VdL+<VdL+:SZhEZd4^@V97o+A>("<'j>[
9ctQ$+<Vd9$>"6#2'?@@ATT&C/g+V@C`k)X-QjO,67sBkDe!p,ASuU2+D,Y4D'38'C`m1q@r$4+
Et&I!+:SZQ67sB9+>G!JB4Z0--Z3@0ALATC+<VdL%15is/g)nl0d'q<ATT%BDIIBn/n8gBDKI68
$;No?+>P&o+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1E\Cp@V97o+=D&8D.P(;+<VdL+:SZQ67sB:
+>G!JB4Z0--Z3@0AM.J2F`):K%15is/g)qm0d'q<ATT&(Ch%9J:18!NF!)S7$4R=O$;No?+>%q>
78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDF)>i2AN;b2?Xdnh6=FqL@k]W467s`sDJVXJF(o,<0d(Qi/KeM2F(o,,-t7(1.3N).
@r$4++DtV)AKYf'F*&OHATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$A
FD>`)0JP"!@UWb^F`;CECi<`mARlp-Bln#2ASuF/B4rE3DfTB0+EVNED..NrBHV2$D.Rc@%15is
/g)8Z+<VdTFCfN8C2[W:0e"5ZF!,:;@:Wq[+C]U=FD,5.FCfN83ZrHbF<DrIDdd0uATMrI0JR*P
@ruF'DIIR2-OgDX67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
0k=j*1,'.E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCeu*AoD]48g$)G0K1+qAS!nFEccCG-Y%1.
@<?(&ATMs(Bk)7!Df0!(Bk;?5%15is/g)l.D..H?1*C"9A7]9o-u`U)CLek:FDi:9DKBr@AKYQ%
Dfo]++C\bhCNXT;+D#e3F*&O:DfQtBATMr&$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEo
ATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO:-pQU
FD,6+AKYi4F*&O6AKYE!+E)41DBNJ(@ruF'DIIR2%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#
ATAo&DJUFCEb/]40f16e$4R>REZf:2+EV..@rr.e:-pQUGAhM4F!,(8Df$V6Df^"C@s)g4ASuT4
@UWb^F`7csATAo&DJUFC-OgCl$;No?+EV19FE8R:Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS*$>"6#
0d'qCC`k)Q%13OO:-pQUATT&)ATVL(@1<QTEZd+[@W$!)-RT?1ATAnL+C]5)+=ANG$>"6#1a$7F
C`k)Q%13OO:-pQU@W$!)9i"\e9N`KTBl\64EcW@6DJUG-DfQtBBOr<'Df^"C@s)g4ASuT4@UWb^
F`8HT+D#e-AT2`#$;No?+C]5)+E).6Gp%0>@<,jkATJu&+EM77B5D-%E-67FA8,OqBl@ltEd8d:
@:O(qE$079ATD?)BlbD7D]j"-FD)*j:-pQUBOu'kAKZ).ATD?)@<,p%DJpY:@<?0*DfTB"EZfC6
F*2;@F!,:5CLoOL+>=pF0d("EC`k)Q%16Ze+>b2s+C]5)+=CMa:K/\a+AP6U+DkOsEc6"AASu$m
DJ()9Bln#2-XT8;<$rf&DBNG3EcP`/F<G%$@r$4+%16Ze+>P&p+C]5)+=D)<-QjNS+AP6U+D5_5
F`;CE@rH7,@;0UnDJ()5F^fE6EbTE(+=D)<-Qm,@+CfP7Eb0-1+C\bhCNXS*$4R>REZd%Y0d&.m
@W$!)-RU#Z+<XEG/g+S=C`mV6F`)7CBl5&'F`MM6DKI"1@:O(qE"*.cEZd%Y0d&1n@W$!)-RU#Z
+<XEG/g+S=C`m.sG%G]'F!,17+CfP7Eb0-1+C\bhCNXS*$4R>;67sBpDKBr@AKYQ%Dfo]++C\bh
CNXT;+D#e3F*&O:DfQtBBPDN1FCfN8%16Ze+E1b!CLeQ0A8,Oq%16Ze+E1b!CLeQ0A8,Oq%13OO
:-pQUGAhM4F!,(8Df$V9@<-I(@s)TrEZeh"@r$4+Et&IO67sBiCh%9(De:,$@:O(qE$0%@D.7's
+CoD4F"AGFB0%.t4"`61-S@/1/ho:;0fCX=2(gU?/ho.70et@81a`_>:-pQUAoD^,@<?U&A0>r3
+CT)*BON$)DfTr@+DkP/@q[!&F_t]1Bk&9,DfTr@%16Ze+C]52D0%j$+C]5)+=Ach%16Q[4ZX]L
0mdAIF_u1_3Zri'+C]52D0$-n%16Ze+C]5)+C]+/+<VdL+<VdL+<VdL+AP6U+<Y-2C`k)X0fLI&
+<VdL:-pQUD..NrBOu6-@;Ka&GAhM4F!,17+D5D3ASrW"@:O(qE"*.cEZeh/C`k*GAR[#<@V[)/
+<VdL+<XEG/g)9GDJUFCEb/]40fLI&+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l7FCB33Bl7Q+GA2/4
+=D2@@OE:4DBNS+G%GP6@UWb^F`7csATAnI+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0H`.o@W$!)
-Y7NT0fLI&+AP6U+EqaEA9/l)DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#0d&7p
@W$!)-Y7NM/7NB;+<VdL:-pQU+>Fup+C]5)+=C`F/ho:4+<XEG/g,7IF*)IGASu$mDJ()9Bln#2
-Y7NM+DG^9B5)O#DBNCs@r$4+%16Ze+>P&p+C]5)+=D)<-S/_B+<VdL+AP6U+<WE^1*C%DC`k*D
A1fSq-QjO,67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7F*)G:DJ((>De(4<Bl5&+Bm+'*+C\bhCNXS*
$4R>REZd%Y0d&1n@W$!)-UK13@V[)/+<XEG/g+S=C`m.sG%G]'F!,OG@<-I(DJ()9Bln#2-UK1'
Bl5&+Bm+'*+C\bhCNXS*$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>P
De!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@UX=l@lZP0?Xdnh;f-GgAM>f567s`s
DJW6gDeio<0HbHh/KcHNDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL
%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@
FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8C2[W:0II;::-pQU+:SZQ67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>K0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,`;K0esk[A867.
FCeu*AoD]40fU=;1a$:A@;]^h%15is/g)l/A7]7)1E^dNF*&O:DfQt7DK]H)Bk/>Y+DtV)ATJu&
DIal$D.7'eA7]9oCi<flCh7Z1@:Wn[A.8kT$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)
ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!
@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&
ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hR
Ddd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y0
3[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5
FCfN8C2[W:0II;:%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g
-Rh;/,CUb!3^>)V-7:/g-RgJR$4R>;67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@W$!2
+CT;'F_t]-F<GO2FED)7DK?6o%15is/g,4FBQ60r+?hi#/g)qm+AP6U+EM+&Earc*EHP]+BkD'j
EcVZs:-pQUC2RNE3ZoOf+DEGN1a!o967sBQ+EqaEA0>buD.Oi"CghC+%13OO:-pQUG%#3$A0>]"
Aoo.DGUXbDEbBN3ASuU2%15is/g)8Z+@U*\A7]9o+<X'd@ruF'DIIR26Z6LHF!)SJ+<VdL+@KpR
FD5Z2@<-W\De*F#;e9BX@qZu-+<VdL+BNK%A5d&JEarcT:18!N6Yp1PF!)SJ+<VdL+<Ve$@:O=r
;e9BX@q\SF@rcL0H#R=($;No?+DbJ,B0A9u-p22r0I\+q+=K>r0Ha.X8ju*H:.&AsC2[Wi.3L/a
-nK]n:I7ZB6W?fJ?X[\fA7$cIF(8m'.3L/a-nK]n/6>VF6sjA;De*3(4*+nFEB@ke+>bMi/0H>l
HRLF>5snOG?X[\fA7$cIF(8m'4&&".;GU7p:dn`"C2[Wi.1HUn$;No?+Eh10Bk/?,BkM+$+=MLa
+CT;'F_t]-F<GO2FED)7DK?6o:-pQU+<Ve<D/aTB+<Y-%@r$4+@r?B2+<Y*/Ch[cr@:O(qE$-9?
@<?!mEb/`lDKI!D+DkP/@q]Ro@UWb^F`7cs:-pQUEaa!$4ZX]5-QjNn+<W$a-QjNS+<VdL4!5n'
@rHL-F=/1m+<VdSDIIBn-QjNS+<Vdg+=D&8D.P>0Dfor>-OgCl$;No?+D,P4D..O-+CT)&+Eh10
Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o:-pQU-Vcu\+=A9_+u(2_4!HC%,!%&'4s2R&0H`+n
HQk0e+?gnr4=;7\DJUFC.3L/a9KF:N+=nX^+=K?g@<-!0+=nWtEHQ2AAL9#n+ECn2B+51W$9g.j
De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGT
F_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R
/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^
DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&$4R>;67sC&Ed8dKARTUhBPD?s
+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-$>sEq+C]5)+=ANG$>sEq
+C]5)+=Ach%16uaEZeh/C`k)X1FEV=%15is/g+YEART[l+EV:;ARuun@:O(qE,uHq%15is/g+b?
EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#TtFC])qF:AQd$;No?+EM+(Df0).
DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.j
E+*6lA0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*
3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])qF:AQd$;No?+EMI<AKYGjF(o,,Bl8*&
Ch[E&@<-"'D.RU,F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*
-OgE#ATAnK+C]5)+=Aco-OgE#ATAo&DJUFL%16uaEZeh/C`khf-OgCl$;No?+A*bo@;TRs+EqOA
BHUl'@V'(\ARlp"De!3lATJu&Eb-A2Dfd+9DBMPI6m-#S@ruF'DIIR"ATJ:fDImi2@W$!)-Y[X/
?[$O/DJ(=+$>sEq+C]5)+=ClE?XIAfAStj^GB.V>B4Z*2%16uaEZeh/C`k*HFD5Q-?[$O/DJ*<(
%16uaEZeh/C`k*6-79oY+<VdL:-pQUDJsV>@3A/bDIIBn%13OO:-pQU@;p0sDIdf2@s)g4ASuT4
Anc:,F<G%$@r$4++Du==@V'R&%15cp;cH(Y<D>V;+=Ach/0I#/+F>5?DJUFC/ghbN$>sEq+C]5)
+=D#O?XdGS?RIBu5uU`L:/t!t$>sEq+C]5)+=D#O?XI8NA1&p%5uU`L:/t!t$>sEq+C]5)+=CoH
F*&a8?=A%iF_iEV9L2TV6;CNT%13OO:-pQUF)Po,+C\c#Bk&9"A7]Y#Bln'#F!(o!-t7(1+=ANc
+>#Vs@W$!)4#)(kDJUFC/ghbN$7ISN@W$!)-RU>c/NP".+C]5)+?M<)0HahBC`k)X-Qij*-nuiR
DJUFC-Rg/i3Zp."@W$!)4#)(:+C]5)+=Ach+:SZ+1*C%DC`k)Q.3L3'+>P'KDJUFW0mbYu@W$!)
-S?bh%14L>+C]5)+=ANc+>#Vs1E^.EC`keoHSZdRDJUFC/ghbN$7I_R@W$!)-RU>c/NP"2+C]5)
+?M<)1a$7FC`k)X-Qij*%15is/g)9GDJUFC/gh)84tq=mDJUFC/ghbN$8`kg+<t?5CaUh_%13OO
@UWebF_s9&+=Ach+=nWZ3Zp.5+=eQY/g)Q(0mdAIC`k)X-Rg/i/g)Mo-OgCl$;No?+D,2,@qZus
Ec5e;+Du+8AU%p1FCf?3+C\bhCNXS=/KeVFEc5t@AU&0*@ru9m%16uaEZeh/C`m1qA8ZO,%16ua
EZd%Y@W$!)@UWebF_qQpDImi20d'qCC`m1qA8ZO,%16uaEZd+[@W$!)@UWebF_qQpDImi21E^.E
C`m1qA8ZO,%16uaEZd1]@W$!)@UWebF_qQp%15is/g*ksDL!@CAfu,*D..-rBl7Q+FCfN8F!+t5
Bln'!@;Kb*+Co&&ASu$$Df-\>BOr<&Ddd0fA0>f"C1UmsF"Rn/:-pQU8S0)eBOr<&Ddd0!F)>i2
AKZ)+F*&OG@rc:&FE8R5Eb-A'BOPdkARlol+Dbt<+E(j7FD,6,AKZ)+F*)I4$;No?+Dl7BF<G%(
+ED%:Bldir/g(T1%15is/g)9GDJUFC-OgD2A8Z3+-RU>c/NP"`DJUFC-OgCl$;No?+<Y-2C`k)X
@rHL-F=.M)-t7(1+=ANc+>#Vs@W$!)4#)(kDJUFC/gh)8%15is/g)9GDJUFCDIIBn-OgD20fpL>
3[[6i:J=&R:JEMc6;LBN5u^WS0d&eY:J=GR;cFl+:JXY`5se76-Rg/i3ZqmLC`k)l:JXY3%13OO
:-pQU+C]5)+=D&8D.P>0Dfor>-OgD20fpaS:/jMY:JEMj4"!Tp<)c.M9LU<X+>#Vs@W$!)-V7'4
-S.>7HX^l/-S?bU$4R>;67sB7+C]5)+=ANG$7ISNA8Z3+-RU>c/NP!s0HahBC`k)Q%13OO:-pQU
0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0HahBC`k)X-OgCl$;No?+>=pIDJUFC/n8gBDKI68$7ISN
A8Z3+-RU>c/NP".+C]5)+?M<)@W$!)-S?bU$4R>;67sB7+C]5)+=D&8D.P(($7IVj+?MV36;LBN
5u^WS0H`\X:J=&R:JEPd6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs0HahBC`k)l:JXY3%13OO:-pQU
0HahBC`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+>=pIDJUFC8PW54
/3>V6@W$!0/gh)8%15is/g)kk@W$!)-RT?1-o!e2F)>i2AM@(pF*')`4"#)dDeio=<+U,m0IJq0
F)>i2AMI.qF*',a.3L3'+>G!JDJUFC-OgCl$;No?+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>G!J
DJUFC/gh)8%15is/g)kk@W$!)-SAnIF`):K%14L<4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+?M?*
@W$!0/gh)8%15is/g)kk@W$!)-Z3@0AL@oo-o!e2F)>i2AMI.qF*')`4"#)dDeio=<+U,m0deCm
/NP"/+C]5)+=D5IDeio=-OgCl$;No?+>G!JDJUFCDIIBn/n8gBDKI68$7IVj-Za-CCLo2!ATMrI
-Rg/i3Zp."@W$!)-Za-CCLo1I/3>V6@W$!0/gh)8%15is/g)nl@W$!)-RT?1-o!e2@W-1$F)>i2
AM>Jn-Xq"4CiaH3CLo4J4""`[FE;;;CLo1I4""`[FE;;;CLo4J.3L3'+>P'KDJUFC-OgCl$;No?
+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>P'KDJUFC/gh)8%15is/g)nl@W$!)-SAnIF`):K%14L3
4>A994>8$h3[l1'3Zp1#@W$!)4#;4mDJU[Q-OgCl$;No?+>P'KDJUFCDIIBn-OgD20fpasDKKr:
Deio=-Rg/i3Zp1#@W$!)-Y[I?F)>i2AMGPA$4R>;67sB9+C]5)+=D&8D.P>0Dfor>-OgD20fpal
Df9H5D/X3$0IJ:l/NP"0+C]5)+=CW:DepdP4#2.lDJUFC/gh)8%15is/g)qm@W$!)-RT?1-o!e2
F*22=ATM^,CLo4J.3L3'+>Y-LDJU[J%13OO:-pQU1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E^.E
C`k)X-OgCl$;No?+>Y-LDJUFC/n8gBDKI68$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)4#)(k
DJU[Q-OgCl$;No?+>Y-LDJUFCDIIBn-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`k*HFXIV*
%15is/g)qm@W$!)-Z3@0AM.J2F`):K%14L34>A994>8$h3[l1'3Zp4$@W$!)-ZaDX/3>V6@W$!0
/gh)8%15is/g)tn@W$!)-RT?1-o!e2F)>i2AM?he@rcKA-T`\sD/X3$0MPtcEc3Z[4"#)dDeio=
9jqOPD_NP#-Za-CCLo4p@:O=r0deCm/NP"2+C]5)+=ANG$4R>;67sB;+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+C]5)+=Ach%13OO:-pQU1a$7FC`k)X@rHL-F=.M):-pQU1a$7FC`k*C@;TR'%15is
/g)tn@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d'qCC`k)Q%13OO:-pQU0H`(m@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!0d'qCC`k)X-OgCl$;No?+>=om+C]5)+=AdODfor>-OgDX67sB7+>G!JDJUFC
DIIBn-OgDX67sB7+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=on+C]5)+=ANG$4R>;67sB7+>P'K
DJUFC/gh)8-t7(1+=Ach.3L3'+>=on+C]5)+=Ach%13OO:-pQU0H`+n@W$!)-SAnIF`):K%15is
/g)hj1*C%DC`k*C@;TR'%15is/g)hj1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`.o@W$!)-RT?1
%15is/g)hj1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o@W$!)-S?bU$4R>;67sB7+>Y-LDJUFC
/n8gBDKI68$;No?+>=oo+C]5)+=D&8D.P(($;No?+>=oo+C]5)+=D&8D.P>0Dfor>-OgDX67sB8
+>G!JDJUFC-OgCl$;No?+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>G!JDJUFC/gh)8%15is
/g)kk0d'qCC`k)X@rHL-F=.M):-pQU0d&1n@W$!)-Z3@0AL@oo:-pQU0d&1n@W$!)-Z3@0AM.J2
F`):K%15is/g)kk1*C%DC`k)Q%13OO:-pQU0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."1*C%D
C`k)X-OgCl$;No?+>Fuo+C]5)+=AdODfor>-OgDX67sB8+>P'KDJUFCDIIBn-OgDX67sB8+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>Fup+C]5)+=ANG$4R>;67sB8+>Y-LDJUFC/gh)8-t7(1+=Ach
.3L3'+>Fup+C]5)+=Ach%13OO:-pQU0d&7p@W$!)-SAnIF`):K%15is/g)kk1E^.EC`k*C@;TR'
%15is/g)kk1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1*A:o@W$!)-RT?1%15is/g)nl0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs1*A:o@W$!)-S?bU$4R>;67sB9+>G!JDJUFC/n8gBDKI68$;No?+>P&o
+C]5)+=D&8D.P(($;No?+>P&o+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>P'KDJUFC-OgCl$;No?
+>P&p+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>P'KDJUFC/gh)8%15is/g)nl1*C%DC`k)X@rHL-
F=.M):-pQU1*A=p@W$!)-Z3@0AL@oo:-pQU1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)nl1E^.E
C`k)Q%13OO:-pQU1*A@q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#1E^.EC`k)X-OgCl$;No?+>P&q
+C]5)+=AdODfor>-OgDX67sB9+>Y-LDJUFCDIIBn-OgDX67sB9+>Y-LDJUFCDIIBn/n8gBDKI68
$;No?+>Y,p+C]5)+=ANG$4R>;67sB:+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,p+C]5)+=Ach
%13OO:-pQU1E\Cp@W$!)-SAnIF`):K%15is/g)qm0d'qCC`k*C@;TR'%15is/g)qm0d'qCC`k*C
@;TR.@rHL-F=.M):-pQU1E\Fq@W$!)-RT?1%15is/g)qm1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs
1E\Fq@W$!)-S?bU$4R>;67sB:+>P'KDJUFC/n8gBDKI68$;No?+>Y,q+C]5)+=D&8D.P(($;No?
+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>Y-LDJUFC-OgCl$;No?+>Y,r+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"1+>Y-LDJUFC/gh)8%15is/g)qm1E^.EC`k)X@rHL-F=.M):-pQU1E\Ir@W$!)
-Z3@0AL@oo:-pQU1E\Ir@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d'qCC`k)Q%13OO:-pQU1a"Lq
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d'qCC`k)X-OgCl$;No?+>b2q+C]5)+=AdODfor>-OgDX
67sB;+>G!JDJUFCDIIBn-OgDX67sB;+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>b2r+C]5)+=ANG
$4R>;67sB;+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+C]5)+=Ach%13OO:-pQU1a"Or@W$!)
-SAnIF`):K%15is/g)tn1*C%DC`k*C@;TR'%15is/g)tn1*C%DC`k*C@;TR.@rHL-F=.M):-pQU
1a"Rs@W$!)-RT?1%15is/g)tn1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs@W$!)-S?bU$4R>;
67sB;+>Y-LDJUFC/n8gBDKI68$;No?+>b2s+C]5)+=D&8D.P(($;No?+>b2s+C]5)+=D&8D.P>0
Dfor>-OgDX67sB7+>Fum+C]5)+=ANG$4R>;67sB7+>Fum+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>Fum+C]5)+=Ach%13OO:-pQU0H`(m0HahBC`k)X@rHL-F=.M):-pQU0H`(m0HahBC`k*C@;TR'
%15is/g)hj0d&.m@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&1n@W$!)-RT?1%15is/g)hj0d&1n
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&1n@W$!)-S?bU$4R>;67sB7+>Fun+C]5)+=AdODfor>
-OgDX67sB7+>Fun+C]5)+=D&8D.P(($;No?+>=om+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=om
+>P'KDJUFC-OgCl$;No?+>=om+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>P'KDJUFC/gh)8
%15is/g)hj0d&4o@W$!)-SAnIF`):K%15is/g)hj0d&4o@W$!)-Z3@0AL@oo:-pQU0H`(m1*C%D
C`k*C@;TR.@rHL-F=.M):-pQU0H`(m1E^.EC`k)Q%13OO:-pQU0H`(m1E^.EC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`(m1E^.EC`k)X-OgCl$;No?+>=om+>Y-LDJUFC/n8gBDKI68$;No?+>=om+>Y-L
DJUFCDIIBn-OgDX67sB7+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&n+C]5)+=ANG$4R>;
67sB7+>P&n+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&n+C]5)+=Ach%13OO:-pQU0H`+n0HahB
C`k)X@rHL-F=.M):-pQU0H`+n0HahBC`k*C@;TR'%15is/g)hj1*A7n@W$!)-Z3@0AM.J2F`):K
%15is/g)hj1*A:o@W$!)-RT?1%15is/g)hj1*A:o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A:o
@W$!)-S?bU$4R>;67sB7+>P&o+C]5)+=AdODfor>-OgDX67sB7+>P&o+C]5)+=D&8D.P(($;No?
+>=on+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=on+>P'KDJUFC-OgCl$;No?+>=on+>P'KDJUFC
/gh)8-t7(1+=Ach.3L3'+>=on+>P'KDJUFC/gh)8%15is/g)hj1*A=p@W$!)-SAnIF`):K%15is
/g)hj1*A=p@W$!)-Z3@0AL@oo:-pQU0H`+n1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1E^.E
C`k)Q%13OO:-pQU0H`+n1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1E^.EC`k)X-OgCl$;No?
+>=on+>Y-LDJUFC/n8gBDKI68$;No?+>=on+>Y-LDJUFCDIIBn-OgDX67sB7+>P&q+C]5)+=D&8
D.P>0Dfor>-OgDX67sB7+>Y,o+C]5)+=ANG$4R>;67sB7+>Y,o+C]5)+=Ach%14LmDJUFC/gi(j
/NP".+>Y,o+C]5)+=Ach%13OO:-pQU0H`.o0HahBC`k)X@rHL-F=.M):-pQU0H`.o0HahBC`k*C
@;TR'%15is/g)hj1E\@o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\Cp@W$!)-RT?1%15is/g)hj
1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Cp@W$!)-S?bU$4R>;67sB7+>Y,p+C]5)+=AdO
Dfor>-OgDX67sB7+>Y,p+C]5)+=D&8D.P(($;No?+>=oo+>G!JDJUFCDIIBn/n8gBDKI68$;No?
+>=oo+>P'KDJUFC-OgCl$;No?+>=oo+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>P'KDJUFC
/gh)8%15is/g)hj1E\Fq@W$!)-SAnIF`):K%15is/g)hj1E\Fq@W$!)-Z3@0AL@oo:-pQU0H`.o
1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`.o1E^.EC`k)Q%13OO:-pQU0H`.o1E^.EC`k)X-OgD2
@W$!)-S?bq+>#Vs0H`.o1E^.EC`k)X-OgCl$;No?+>=oo+>Y-LDJUFC/n8gBDKI68$;No?+>=oo
+>Y-LDJUFCDIIBn-OgDX67sB7+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo0d'qCC`k)Q
%13OO:-pQU1a"Lq1,0n\DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>PYo@W$!)-S?bU$4R>;67sB;
+>Fuo0d'qCC`k)X@rHL-F=.M):-pQU1a"Lq1,0n\DJUFCDIIBn-OgDX67sB;+>Fuo0d'qCC`k*C
@;TR.@rHL-F=.M):-pQU1a"Lq1,9t]DJUFC-OgCl$;No?+>b2q+>P\p@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp7%0d&5,+C]5)+=Ach%13OO:-pQU1a"Lq1,9t]DJUFC/n8gBDKI68$;No?+>b2q+>P\p
@W$!)-Z3@0AL@oo:-pQU1a"Lq1,9t]DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P_q@W$!)-RT?1
%15is/g)tn0d&5-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1E^.EC`k)X-OgCl$;No?+>b2q
+>P_q@W$!)-SAnIF`):K%15is/g)tn0d&5-+C]5)+=D&8D.P(($;No?+>b2q+>P_q@W$!)-Z3@0
AM.J2F`):K%15is/g)tn0d&5.+C]5)+=ANG$4R>;67sB;+>Fuo1a$7FC`k)X-OgD2@W$!)-S?bq
+>#Vs1a"Lq1,L+_DJUFC/gh)8%15is/g)tn0d&5.+C]5)+=AdODfor>-OgDX67sB;+>Fuo1a$7F
C`k*C@;TR'%15is/g)tn0d&5.+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2'?@GC`k)Q%13OO
:-pQU1a"Lq1,U1`DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pes@W$!)-S?bU$4R>;67sB;+>Fuo
2'?@GC`k)X@rHL-F=.M):-pQU1a"Lq1,U1`DJUFCDIIBn-OgDX67sB;+>Fuo2'?@GC`k*C@;TR.
@rHL-F=.M):-pQU1a"Lq1,^7aDJUFC-OgCl$;No?+>b2q+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp7%0d&50+C]5)+=Ach%13OO:-pQU1a"Lq1,^7aDJUFC/n8gBDKI68$;No?+>b2q+>Pht@W$!)
-Z3@0AL@oo:-pQU1a"Lq1,^7aDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pku@W$!)-RT?1%15is
/g)tn0d&51+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2]uRIC`k)X-OgCl$;No?+>b2q+>Pku
@W$!)-SAnIF`):K%15is/g)tn0d&51+C]5)+=D&8D.P(($;No?+>b2q+>Pku@W$!)-Z3@0AM.J2
F`):K%15is/g)tn0d&52+C]5)+=ANG$4R>;67sB;+>Fuo3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Lq1,pCcDJUFC/gh)8%15is/g)tn0d&52+C]5)+=AdODfor>-OgDX67sB;+>Fuo3$;[JC`k*C
@;TR'%15is/g)tn0d&52+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p0d'qCC`k)Q%13OO:-pQU
1a"Or1,0n\DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>PYo@W$!)-S?bU$4R>;67sB;+>P&p0d'qC
C`k)X@rHL-F=.M):-pQU1a"Or1,0n\DJUFCDIIBn-OgDX67sB;+>P&p0d'qCC`k*C@;TR.@rHL-
F=.M):-pQU1a"Or1,9t]DJUFC-OgCl$;No?+>b2r+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
1*A>-+C]5)+=Ach%13OO:-pQU1a"Or1,9t]DJUFC/n8gBDKI68$;No?+>b2r+>P\p@W$!)-Z3@0
AL@oo:-pQU1a"Or1,9t]DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>P_q@W$!)-RT?1%15is/g)tn
1*A>.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p1E^.EC`k)X-OgCl$;No?+>b2r+>P_q@W$!)
-SAnIF`):K%15is/g)tn1*A>.+C]5)+=D&8D.P(($;No?+>b2r+>P_q@W$!)-Z3@0AM.J2F`):K
%15is/g)tn1*A>/+C]5)+=ANG$4R>;67sB;+>P&p1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or
1,L+_DJUFC/gh)8%15is/g)tn1*A>/+C]5)+=AdODfor>-OgDX67sB;+>P&p1a$7FC`k*C@;TR'
%15is/g)tn1*A>/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2'?@GC`k)Q%13OO:-pQU1a"Or
1,U1`DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Pes@W$!)-S?bU$4R>;67sB;+>P&p2'?@GC`k)X
@rHL-F=.M):-pQU1a"Or1,U1`DJUFCDIIBn-OgDX67sB;+>P&p2'?@GC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Or1,^7aDJUFC-OgCl$;No?+>b2r+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>1
+C]5)+=Ach%13OO:-pQU1a"Or1,^7aDJUFC/n8gBDKI68$;No?+>b2r+>Pht@W$!)-Z3@0AL@oo
:-pQU1a"Or1,^7aDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pku@W$!)-RT?1%15is/g)tn1*A>2
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2]uRIC`k)X-OgCl$;No?+>b2r+>Pku@W$!)-SAnI
F`):K%15is/g)tn1*A>2+C]5)+=D&8D.P(($;No?+>b2r+>Pku@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1*A>3+C]5)+=ANG$4R>;67sB;+>P&p3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,pCc
DJUFC/gh)8%15is/g)tn1*A>3+C]5)+=AdODfor>-OgDX67sB;+>P&p3$;[JC`k*C@;TR'%15is
/g)tn1*A>3+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q0d'qCC`k)Q%13OO:-pQU1a"Rs1,0n\
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>PYo@W$!)-S?bU$4R>;67sB;+>Y,q0d'qCC`k)X@rHL-
F=.M):-pQU1a"Rs1,0n\DJUFCDIIBn-OgDX67sB;+>Y,q0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
1a"Rs1,9t]DJUFC-OgCl$;No?+>b2s+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G.+C]5)
+=Ach%13OO:-pQU1a"Rs1,9t]DJUFC/n8gBDKI68$;No?+>b2s+>P\p@W$!)-Z3@0AL@oo:-pQU
1a"Rs1,9t]DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>P_q@W$!)-RT?1%15is/g)tn1E\G/+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q1E^.EC`k)X-OgCl$;No?+>b2s+>P_q@W$!)-SAnIF`):K
%15is/g)tn1E\G/+C]5)+=D&8D.P(($;No?+>b2s+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1E\G0+C]5)+=ANG$4R>;67sB;+>Y,q1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,L+_DJUFC
/gh)8%15is/g)tn1E\G0+C]5)+=AdODfor>-OgDX67sB;+>Y,q1a$7FC`k*C@;TR'%15is/g)tn
1E\G0+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q2'?@GC`k)Q%13OO:-pQU1a"Rs1,U1`DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2s+>Pes@W$!)-S?bU$4R>;67sB;+>Y,q2'?@GC`k)X@rHL-F=.M)
:-pQU1a"Rs1,U1`DJUFCDIIBn-OgDX67sB;+>Y,q2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs
1,^7aDJUFC-OgCl$;No?+>b2s+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G2+C]5)+=Ach
%13OO:-pQU1a"Rs1,^7aDJUFC/n8gBDKI68$;No?+>b2s+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Rs
1,^7aDJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pku@W$!)-RT?1%15is/g)tn1E\G3+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Y,q2]uRIC`k)X-OgCl$;No?+>b2s+>Pku@W$!)-SAnIF`):K%15is
/g)tn1E\G3+C]5)+=D&8D.P(($;No?+>b2s+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G4
+C]5)+=ANG$4R>;67sB;+>Y,q3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,pCcDJUFC/gh)8
%15is/g)tn1E\G4+C]5)+=AdODfor>-OgDX67sB;+>Y,q3$;[JC`k*C@;TR'%15is/g)tn1E\G4
+C]5)+=D&8D.P>0Dfor>-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GUDJW6gDeio<0ht%f
.Um:3;f-GgAM>h]F=f'e-t7(1.3N/8F)Yr(Gp%'7@r!`,@:O(qE$/\"FCfMG%15is/e&._67sBh
F)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8c:$;No?+<VdL+<Y]9
B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67sB'%15is/g+YEART[l
A3(hg0JPS)@<++Y%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV
-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq
+BosE+E(d5-RT?1%15is/g+kGF*2M7+EqB>BOQ'q+EMI<AKYGj@r$4+Et&IfEZf=0@r#TtFC])q
F:ARgEZf=0@r#TtFC])qF:AQd$;No?+B)rlG9CI6@V'(\ARlom@:O(qE$/\"FCfMG+B3#cF(HJ)
@<?(%+EqO9C`m/*E+NHu%15is/g+SD+F7U>D]iS!FCfM9Bl5&3Ch.*t+C\bhCNXT;/g+)2D.Rg'
D.Rc28g%SWDIIR"ATJ:f:-pQU@q]:gB4W3,D]in>@q[!,BOQ!*CghEsEZfO:EcYr5DK?q1@;]t$
F<GU8@:UJi$;No?+E)(,ATAo&Bl7@"Bk;?<+A$GnFD,*)+Cei$AKY])F*(u%A0>f&+CQC'@<?&i
$;No?+CT.1ATDg0EZf41F)tc&AKZ22Cht5'AKYMtF)Yr(H"CM=%16Ze+>G\q@W$!)-S?bU$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]R/DeioE3B:FU$>3pl6tp.QAU&;qD/X3$0JH6g/h1LFF@9hQFCf]=;f-Gg
AM>e\F=f'eBl%U.F*)G2FCcRCB4Z06+Co1rFD5Z2@<-W9FCf]=F"Rn/:-pQB$;No?+B3#gF!,R9
F*&O=Ci"68FE1f3ATJu8Df'&.,'7O/CLqcC@W-0/+=MI`+CT;'F_t]-F<G(3A7]g)De9Fc:-pQU
-td+5.3NhJASrW&ATVEqBl7Q+FD,5.+Co1rFD5Z2@<-W9+CoD#F_t]-F=n\8BOr;sBk)7!Df0!(
Gmt*U67sBkDe!p,ASuT4BlbD*+EM77B5D-%@r*9+AftQ.FCfMG%15is/e&._67sB[BOu6r+Cf>#
ATJu)ATDL.AKYT*Df$V8FD,6++=Ll6F=A>NE-,f4DK@EQ8K_M]F_kS2@:Wmk@rGmh%15is/g,7S
+<ki;B6A$!EbTi2+s:u@BlbC>@Wcc8@<3Q5BOu6r+CT;%+CT)&+D>2(D/<d)F!,1=-Z^CQDJsV+
$;No?+EqaEFD)e2F=n"0:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU
.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcH
FD>`)0JFj`$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPS)
@<+([%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2
AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172f
Bk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+S=C`mh5ATME*
An?'oBOu6-B4Z0-FD,5.F(&os+Co1rFD5Z2@<-W9FCf]=%16Ze+>k9SATT%B-OgDoEZd4^2]uaE
F<DqY%16Ze+>k9#+>G!OATT%B-OgDoEZd4^2]sdsB4Z0--RT?1%16uaEZd4^2]sjuB4Z0--RU#Z
:-pQUEb0?8Ec,q@ATDg0EX`@nATAnN+C@&M+D58-+=ANG$>sEq+>k9#+>Y-QATT%B-OgCl$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDFE1f2BK8(5?YjXhA9;C(F>5I'A8,OqBl@ltEd:DH/h1[U@:XIkF*',j0P"m-
FD5Z2@<-W9F=f'eCi<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIlFEM,*+EV19F<G+.@ruF'DIIR2
/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lQATMs.De(RV0I\,\Ddd0fA.8l@67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AQiuASkmfEZd(s3B7NU:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0emQaFttfqF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0fX)]F>5HlF`:l"FCeu*AoD]4
8g$)G0K0FJ%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OOFC])qF>5Io
4ZX]5FCfN8C2[W;0JFj`$?Tfm@rsFZ0R,`A+=D8BF*)/8A2,bl0II;:%15is/g,(OASrV=FC])q
F>5Io.3N&:A0>MrF<G"4Dfor.+>GQ(0JFVnDfTB0+EqOABQ&$8+Co%qBl7X&B+52ZEZf:2+EV..
@rsFZGRY!DHS-FcG^)A4+>=om0Hb">F<Dtd0JG4859kS/A8Z32-RjCj/nAj9-RU#Z:-pQUGAhM4
Et&I?HS-FRB4j@g+D5_6+=ANZ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL:-pQUB6%p5E,uHq
G^+Hr3Zp."E+rft+F&-U+:SZjB4j@g+FPjbB4kid$>"6#1E^UH+EV..@rsFZGRXuh$;No?+E)41
DBL?LA8,Oq0eb;+.3N&:A0>DoCh7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN
@:O=rEt&IfEZf:2+EV..@rsFZ0R+$60d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ
@WO[b4<cI%BeCMc.3gr&-OgDHHS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sC"@:O'qA8,OqBl@lt
Ed8dLD]j(3@rHO%EZfR7F*(u(+EML1@q?)VATAo4@:O(`+EV..@rsFZ0R+$6%15is/g,4WDfTD3
GAhM4Et&I?HS-F^BQ&*6@<6K40H`)(+E2IF+F&-U%13OO:-pQUEb03$@<?'kCj@.5BOPdkAKZ28
Eb$;1@;TRs+CT.u+EMXCEb,[eEb0,sD.Pjk+>GYp3ZoduHS-Ks+F,CY/M8@t-Qjca5V+674s2s3
0d%Z$+=o,f.!R3a,C(^\.j/OY+<u.Z%15:G/g,4KDg-//F)rHX+>GPmE-67F-nlcaAStpnAKZ5B
GUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S0d(LJDIIBn+F&-U.3L$$@6-J(
.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dte+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!D
HS-F^BQ&*6@<6K40H`)(+E2IF+=K#gEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//
F)rHX+>GPmE-67F-o<&eAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_h
F`\`S2'?pNDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dti+ED%2
@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K/kEb0,sD.Oi7G^(Y[
-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o`>iAStpnAKZ5BGUXa`4CL940I_Dm
G^+HB$4R>;67sC%BQ&);A8,OqBl@ltEd8dKFCB94%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is
/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=-tRXFEb0*!+E_a:+E(j7E-67F@rH4$@;]Tu
BOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f4=>5^F*',j0Hb4NEb-A1ARTIjDJ*csF)rIG
ATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7KsFD*$2$4R>;67sC%BQ&);A8,OqBl@ltEd8dK
FCB94%16Ze+Co1s+FYFe%13OO:-pQU@r-()AKWCCA8,Oq0eb;+.3N/8@ruF'DIIR2+CT.u+Cf5!
@;[31E"*.cEZd.\De't<-OgCl$;No?+B1d.<$5+>6UO:@;asb\%13OOATD@#E+No00F\?u$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$?1-09jr9a@;TRSD/X3$
0JH6g/h1g_FA61gDIIBn;f-GgAM>e\F=f'eFCfN8+AG.(:-hTC+DbV,B67f0@q]F`CG$&':-pQB
$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2+>"^WAS!!+
ATMr9@rc-hFCfQ*F*(r,@ruF'DIIR"ATJ:f:-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*
-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/g)8Z+<VdL+<VdL/hSb/%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FCD..H>3"63i67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G0
3Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$;No?+EVaHDBO45D/Ej)+E)-?%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mk&N%15is/g)`m
<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I
%16Ze+CoG4ATT%B;FNl>=&MUh74/NO%15is/g,">CLnW+@;TQuFDl(?Ci=3(+CT.u+CT>4BkM<+
@W,n%F!,X7Cis:u$=[^^CjA0)+=CW4B5Dj2@;TR'/58E4:-hTC?X[\fA7$Q/;^W"]-t6n'Cj@Hm
3Zr,h+>P&p%13OO:-pQU@<?U&D/aS>FDi:@F`\`X+EM47F_kS2AmoCi%16uaEZfI@E,9H&+E2IF
+C]%tCj@-4$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?N                           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C7+>P&o0d&51+>GPm1Gg4/0H`,/+>GPm1GL",2]sn4+>PYo1cQU42]sk5@V97o;f-GgAM>ed
@V97o.3N&>B6A'&DKI"BD/X3$+EV19FE:o/CdMQOBk&hO@UX=l@j!1/DJUaE@UWb^F`8I@@;TQu
Ch[s4+EV19FE:o/Cf>1hCLo1R-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE:o/Cf>1hCLo1S-t7(1
.3N/8F)Yr(Gp%'7@r!`,@:O(qE$/\"FCfN+ATU=S@ru:,FAm$pCLo1RBl%U.F*)G2FCcRCB4Z06
+Co1rFD5Z2@<-W9FCf]=F)5c'A9;C(F>5I'A8,OqBl@ltEd;J>@:UK80JI_o12^VFDfTB"EZf:4
+DkP"DJ=38A7Zm*ATMr9A8,OqBl@ltEd;VHFA61gDIIBn;f-GgAM>f[ATMr99gMlV5tscjCh7Ks
FD)e,BOt[h                                                                ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*AA/1,pC30H`+n1Gh!J+>PVn1*A;*3&2U20H`+n1,(C:3$9q3+>P&q0Jtd3
2]sju2E3T;0ea_*+>u280H`))+>P&o1bpd.0f^@3+>l,9+>Get1*A;-2D[s$6pamF9LMEC;cHOj
=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K
3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0K9CH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO
1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3Zp1:+@1-_+>PW*3?U%23\W6K1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*3?U%23\rKO1H>dL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fB@G$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pku6$6f_1,(FC
+>GW41,:mE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU1-$ICF_;gP0JPR10f(jH2EEWR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!Y
A0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@21HI?J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1GoLH$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>>So:LeJh
1,(FC+>>f:2*!]T1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*
3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S0Ja%C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*
3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4+@KdN+>PW*3?U%13\iWT0fTLI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*
3?U%53\r`V1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B7E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1bf=E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp+6+@KdN+>PW*
3?U%33]/iW0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0fTM4:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P\p
9jr&b1,(FC+>Gf91,CsJ0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0e`qA$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@2
2EEZK3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp16+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_1,(FC+>GT31GLpI0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp1:+@1-_+>PW*3?U%33\`HP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]tD/B-8r`0f^@21-.0G3\WH!$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1-$ICF_;gP
0JPR10f(jH2EEWS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1-$ICF_;gP0JPR10f(jI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR10f1pI2EEWQ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0JahI
@rrhK0JPR10KD0O3BB#R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D
2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='
+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K1HI?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC+>G`71c[TN3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3
+@KdN+>PW*3?U%43]/]S0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf1*Atr@j!N\0f^@21cdEH3\`K!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0JXb=ARci<0JPR1
0f1pJ3BArN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t1a!o/@<?'A+>>So6tKjN1,(FC+>GQ21,h6K3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCqf1a#1t@j!N\0f^@21cd?K3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L3'&lO$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>Yq6tKjN
1,(FC+>GW42)dQM1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0f]SMF_PZ&C2[WnBleB:Bju4,Bl@lE
0ht%f.UmO7Ch.:!A7TCqFE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A1e;u
%15is/g+YEART[l+EV13E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!p1Eb0-1+=CW,F(H^.$=e!a
CghC++EVI>Ci<fj5s[eODe*="Bl%<?3B:G03Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$Eaa$#+?V#;
5s]7(A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(
Bk;?.@;]TuDfB9*+A,Et+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,
C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBnATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&DIal5ATDj+
Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;67sC%ATT&*
BleB:Bju4,Bl@l3A8-'q@ruX0Bk;>p$>O*^BlZ?t+=BcW6rR&N7n#g;;BSS-6q9gJ6qL9!8l%iR
:K::[78m/O7n#g;;BSS-6rR&N7n$6B7RTgG+A,Et;cH%Q779p=6qL9(%16i\A8-'I3Zr0JA8-',
/0H;_8l%iF8Q8)R6UXLD+A,Et5t"+::..ZO+A,Et;aXGS:fKhS;BSS-6q(3W;aa2T-Qij*-u*:'
BlYXc3ZrKTFCKB,Ch.'jEcW?W%13OO:-pQUB4YslEaa'$+Co2-FE2))F`_>9DBO"1EbTK7Et&J!
E+EC!ASQ-oD..<rAn?%*+>=638l%iU9gg+5F_PZ&C2[WmDf'H6ATMp(A0=K?6rR&N7n#g;;EIKH
6q9gJ6qL9<8l%i@6psgG6qL9<8l%iR6W-KP<(';U%15^'6rZrX9N+td6m,r]Bl%<pDe*s.DesK)
Df'H6ATMp(A0=K?6rR&N7n#g;;EIKH6q(3W;aa2T4%`::;aXGS:fKhS;@Nt*:IJ5X6m-VkA79Rk
C2[WnBleB:Bju4,Bl@l38l%iR<'a#C6qL9<8l%iF8Q8)L;@Nt*:IJ5X6m-VkA79RkC2[X(Dfp)1
ARoq#E-!-o:IJ,W<Dl1Q;cH%Q779^F%15^'6rm#M+ED%0ARTXkC2[W*8l%iR<'a#C6qL9<8l%iR
<'a#C:ddc@8Q%WB:IJ,\5t=@3:I@NA;EIKH6q9gJ6r-0<8Q$!)%15is/g+\9F*)G@Gp$R=Bl%<&
Ci<flCh4%_@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1?O[>O
$4R>UBleB7Ed;D<A26(Q$4R>TASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK&/heDYATf1J+=K]j@<?X4AKX?YD/a<&FCcRmASbpd
F(HIG+Du+>+ED%0ARTXkA0?//F=@Y+%144-+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>
A7f3Y$4R=b.NfjTE+NNn@;I&o@W$!i+Cei$AKYDlA7]9oFDi:4Ble60@<iu)@:O(qE$/b,Ch4`"
@<?(%+>"^WARuulC2[W8E+EQg%143e$6Uf@>@:oQATV<&8p,)uFCfJ89OVC9-n,T4%144-+EMI<
AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6pc?
+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC
+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u
@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#
+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9
+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>
ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&
A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7
F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8
ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9
FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr
$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*
FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n
+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//
De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(t
FDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&
A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7Zlt
F!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo
+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>
/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno
+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LG
Bl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js
/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4t
ATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk
+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:D
BOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3
Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TE
EbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^C
FE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5
CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&H_#n74a+<XWs
BlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+##mkQe
Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E
0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(
AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%
F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$
+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"Rb*
%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EI
EbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%13CJ%144-
+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.j
F'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#
FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#
+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<
.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y
.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J+<Ve+BOr<*Eb0E.Dfp+D@q]:g
B4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,
AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g(H,%144#+<VdL+<VdL
%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(
FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*
F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6s
BkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:E
F(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#
+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ft
AoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!
D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6
@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf
+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41
DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE
+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL
+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b
.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9
ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I
%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL
+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-Y
A0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ
/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQu
Ch[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19
F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-
+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4
Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b
/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!t
BmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<fl
C`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i
/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-
@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH
3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,
AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9m
AKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&
+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3
A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<
DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5
DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I
0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,
@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W
4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-
4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL
+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P
@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE
2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,
AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#
+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043
EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*
A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;
F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+G
BOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk
/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL
+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[
B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<
Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+
Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO
+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[
+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$
FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3
DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#
+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,
AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9
E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\no
DfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.
D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8
Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''
FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#k
Bln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dn
ATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1
$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A
+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:g
B4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr
<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,
Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q
;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrp
DerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@lt
Ed8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9
C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA
+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9
FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t
%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQU
B4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeD
Ci^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnu
De*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIakt
Cijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&
G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH
+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:g
B4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."
Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1
/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/
%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,
ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80
+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4
+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!
Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<
ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@
Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1r
FD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A
?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&
F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2
C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR
05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg
/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A
+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=
05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*
1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQt
DKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL
+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#
@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2
A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m
/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>
+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/
EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I
+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4
+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ck
DIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue
+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/
F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-
+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H
%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*
Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&s
Bl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9
Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%
+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg
.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9o
FDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDb
Ec6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$
FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>
:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh
7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL
+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#
.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%
+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_A
A8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/Q
E$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*
BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:
+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>
@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl
/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,
DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf
+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,
Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7
%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(n
Ea`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6
+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$
?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6
@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"
AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$
?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq
+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM
6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-
E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+
EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&
+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0
BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2
@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u
+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#
+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ
6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=
/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/
Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_
6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth
+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!
+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M
+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNE
FCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds
@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$
+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%
+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1Ums
F!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9
D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)
@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#
+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*
+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!
ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi
+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'
DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:
$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!
Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cj
C2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[Wr
ASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%
+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17
+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&
EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1
Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/
DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(
Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!
@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU
0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF
+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNa
E-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k
$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T
+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds
@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!
Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#
+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=
@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1
@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5
Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm
@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7
@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u
+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#u
FE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@
+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*
EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k
?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsg
Eb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6
@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*
0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)
AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)
@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq
/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir
+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;
%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8
Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?
+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4
+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&
+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0
ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD
/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+
D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>
F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)
D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LU
BPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1
/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&
?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi
7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR
/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4
CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!
+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#
+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth
+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#
AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0
Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4
D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.
Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7
Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y
$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNE
AStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</
Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44
De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA
6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;
+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK6
6V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4
FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3
B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*
DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]4
8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.
A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l
:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c
:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=
H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"
A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr
@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l
+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibC
E,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7
C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^
+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o
06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSB
DJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=)
,9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#
.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl
/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)
/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*
A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)
DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LN
Bl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq
$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(
+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht
/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6
@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et
+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4
+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<
ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2
@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2F
C2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>=-pFDl2F
C2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b
+=\LWATDj+Df-\,F_u(?AoD]48g$,H0JO\ZATV?'E+*iuBJ'`$%14=),9SZm3A*<P3$9dq7V-%L
F^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b+=\LAEd2Y5+EM+(FD5Z2+CSekARmD9
%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144#.Ni,9DJW]'F(Jj'Bl@l3@:Wn[
A1e;u%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#
.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[
Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H
;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>
$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7h
F)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,
1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e
+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE
3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_
F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G
$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV1
4ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq
/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3
A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*
DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm
@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'
FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%
$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b
@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N
+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-
FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%
+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23
Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm
3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[Wn
De!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,
G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"
F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-
+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/
ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!
FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;
+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0
>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD
0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs
@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq
+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r
%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'
F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)
Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3
AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'
ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6
@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWD
Des-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+
%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_t
DIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<
%143e$>OKiE,oN/1,2Nj/h1USA8lR#E$03R/KdY]6m-GhAT2[.@qB_&DfQtA@rc:&F=n"0:-pQB
$;No?+B*AjFCf<#DKKqBBl5&8BPDN1F(96)E-*42Eb-A)G\(B-FCeu*@V'.iEb-@c:IH=>F!,:;
@:Wq[/e&-s$;No?+EVO@+DbV4AS`K#EcQ)=+EVX4E$/b2EZek1Eb-@c:IH=LDfTB0+:SZmDe*p$
?YO7nA7$HB3Zp+#?Q_EQ-V@0&+B)EA<(0M(7R9U><Dl7H+DbJ-F<F0uATDg0EZcqt+=A@?+=nX>
3Zp.5+Z_>5+=AN\?Q`Pq>n%,M$>OKiF*VhKASlBpFD,$-?TgG++?CW!%13OO:-pQ_C2[X(H#n(=
D/`p*BHVIM/Kf"@FD)e8Afs]A6m-PrF*(u1+>"]h+EV18D/!lrFCeu8%15is/e&._67sBUDffPO
+Eh10Bk/>uDfQsm+>ti+0d'nBA0>;iDg#\E%15is/e&._67sBtDf/uo3ZoP[De*p7F*(u1E+*j%
+Cf4aAnc'm%15is/e&._67sB'+DPh*F*VhKASlBpFD)dEC2IC#FCfJ?%13OO:-pQUA7]@eDIm?$
8g&2#F*(u1+Dbt+@<?4%D@Hq$C2dU'BHS[O@:WneDK@IDASu("@;IT3De(LK.4f`e%14Nn$4R>P
De!TlF)rHO@;9^k-OgDT9gM]W78c90+DPh*F*VhKASlBpFD)dEC2IC#FCfJ?+<VdL+<VdL+AP6U
+Co%q@<HC.+DkP.FCfJ8-n6i`C1\n;Anc'm%15^'6r6cW7QidTC2[X(H#n(=D/`p*BHS[;De*g-
De<^"AM.\3F!i(Q:-pQUA7]@]F_l.BE,ol/Bl%?'F(96)E-)NrC2[X%Ec5Q(Ch5@V:-pQ_C2[X%
Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%ht
E,ol/Bl%?'F(96)E-*]T;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImis
CbKOAA1nB!:-pQB$;No?+EqOABHVD1AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue
+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA
67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B
+A,Et%15is/g,@VEbfB,B-:c'G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4
ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`
DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)q
A9f;9E+No0+Dk\2F(&]mF!,R<@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is
/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*o-FCcS:D]g/p
+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8
ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$
:-pQUF`V,+F_iZ>$;No?%15is/g+SFFD,T53Zq%5BPnq\/g*JhCLqMq$;No?+D#CuBl#gQ+C\bp
ATDNr3B9?;D..-p/n8g:%13OO:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j
1bg+W+>F<4%15is/g,"FDJ<s1D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%
+=M;BAKY`+A79+^.1HVE+Z_>4+BosJ%13OO:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+Deru-F(or3
+>"^EF`_P=@<?3n+D,P4+Dbb0Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9
F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et+DG_7FCB&sAISuA67sBt
F_l/6E,9).8l%htBl8!6@;]RdF!+n3AKYr'Ec#N4FCeu*@Wcc8DJsV>Eb/a!D/Ej%A7]9\$=n*s
ATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//
E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)$4R>;67sC!G%G]7Bk1ct
779L=:/aq^73F0)F(KG9-u*71DKB`4AM.P=ALSa5A8-.(EZcqVF`V+:Ap%p++E1b2BFP;D67sBU
8PN#B+CfP7Eb0-1Cj@-l6pjaF;bp(U+DGm>GA1r*Dg-7FDf0B:+>"^WAS!!-ATD6&-tRKL+:SZH
6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Zm9ke*XDf]i/F<FU_+@C'XAR&_`
A7[B)G\&'H%15is/g*SN6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATJtBGW7T1
>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF
5tsp63ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDX67sB^84?EF5tsp63Zoe`Df'&5%13OO:-pQU
-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu
-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(
?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(%15is/g+S5A0>DoCh7^"
+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"BF_Pr/%16NV4ZX]A+?CW!%16f]
/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T
8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg
.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@/$7QDkA7n%d+>Y-$+>=63
BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(
4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HV,+<V+#:-pQU
Eb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.lGWe)11E\_$0F\A'AhG2X/pClO
?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38
@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%14LlCi"-'Aof(;I4cXT
DCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6Ec6)>+E_a>DJ()#+EqaEA.8lg
B0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj
+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KP
ASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImisFCcS)F`MM6DKI"6Ec6)>+CT.u
+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+Dkq9
+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk%15is/g,7SE$-QJF`\a:
Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.F(oQ1+E):2ATA4eFE]l/+ED%:
D[d%qB0A9u1+%$QG&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6E,8rsDKKH2
F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M%13OO:-pQUEcl7B
D.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is
/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$>=KD
3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9
Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?
EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$
0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.
+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;u
Gp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(+CT.u
+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHVM;
Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*B6%p5E$048
DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4F<G[:
G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+-RU#Z
+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;A0<!;
+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#+A"1.
-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$?IP@+=8^)
+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4-QjNS
+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is/g)8k
+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A%16f]
/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO
4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@lt
Ed8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Ds=p
+ED%:D]gDT+CoCC+Dr<BATW'8DD!&CDIb@/$7KdC/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'n
DETV#/oD+*.1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\f
A7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"
G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs
7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't
%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&
Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;A8c[5+Dc11
Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)><3le+Z_P)-t+`T
IPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>
GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S
?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ8
4ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C
0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$Ch4`$
Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*
Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_/h%uO
+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5
%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>/Kf+G
AKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@5U\E3
3\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk--nIV3
0d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff+BplL
I4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6"A
@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gf
F:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)Vr
D..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji+>P\r?Q_EQB657=
+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'
$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach
+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$
C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o
+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(FD)*jC2c<s
+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#
F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a
0ea%D%15is/g,@OATD?)@;R,Y+E_a:A0>?,+EMI<AKYhu@rcL/+Eh10F_,V:-[0KLCF:6CEZc`C
Df'&5%15is/g+4d78cQ?9h@K/+=DAOEbd$3$4R>;67sBkF_u(?A9)C-AKWQIF`V,)+C]U=.!9WG
Ci_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`-OgCl$;No?
+CoV3E$0+.FD,_</Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is
/g*P^9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[<(K/5+=AgWDe(M9De*g-
G%>`4E-!Z[%13OO:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,+=MASBl%i>+DkOsEc3'K
@r,^bEc?/C.3N>:+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a$4R>;67sBQ:IH=KATD7$
+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is
/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*
+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/
F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,K
C3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I
%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I%16r\DJ<]oF*)/8A25l767sBt
@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[
4ZXrF/hen3+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8
Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[
%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2
De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMG
FEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKi
Cggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a
$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R
8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172q
Deq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!
FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7
:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%ht
BlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr
+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</
Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m
+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]
6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+C
ARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7
Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$
Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f
+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn
;b9b[4ZX]50J5@<3B9&H%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29
-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-p
FDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!
+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%ht
F*VhKASj%/$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;g
D]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>
@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
Dds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ9
0ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2
+B*3$EarZ.%16-);H$._:-CWc0eP.40H_qiA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'
-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr
9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&Ik
De*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;
C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$
+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043
EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]Tu
A8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*
F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!
Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1
+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE
@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?
A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT
%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9
F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-
F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>D
F`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo
+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@
6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=
+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,
@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk                   ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ER'
zz=:zz,'R003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012'
zz=:zz,' ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR'
zz=:zz,'022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GRO'
zz=:zz,'UP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface'
zz=:zz,' JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRI'
zz=:zz,'PT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXE'
zz=:zz,'XPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK'
zz=:zz,'006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDE'
zz=:zz,'L PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEX'
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),<<;.'
zz=:zz,'_1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN C'
zz=:zz,'NLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 '
zz=:zz,'ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR0'
zz=:zz,'60 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 E'
zz=:zz,'RR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR08'
zz=:zz,'0 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ER'
zz=:zz,'R090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099'
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS '
zz=:zz,'INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052'
zz=:zz,' OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 '
zz=:zz,'OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx app'
zz=:zz,'table appwords backupdates badcn bchecknames bgetdicdoc bgetdocumen'
zz=:zz,'t bgetexplain bgetgstext bgetobjects bgslist bnlsearch bnums bpaths'
zz=:zz,'fx checkback checkntstamp checkopen checkpath checkput closedict cr'
zz=:zz,'eatest defwords delstuff delwordrefs didstats dnlsearch dupnames fr'
zz=:zz,'eedisk freedisklinux freediskmac freediskwin fullmonty getdicdoc ge'
zz=:zz,'tdocument getexplain getgstext getntstamp getobjects getrefs gslist'
zz=:zz,'nl inputdict invappend invdelete invfetch invreplace islib iswritea'
zz=:zz,'ble iswriteablelinux iswriteablewin jdatcreate jwordscreate loadall'
zz=:zz,'dirs loadallrefs loadwords mainddir mnlsearch newdparms newregdict '
zz=:zz,'nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathre'
zz=:zz,'f putdicdoc putexplain putgs putntstamp puttable puttexts putwords '
zz=:zz,'putwordxrs rpdtrim rplctable rplcwords sortdnub splitbname''        '
zz=:3141{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`/0d&Fu1G^g@C2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9
B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'
+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]Rg
FCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/
@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is
/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>
ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5
Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07
ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt
@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)
AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$
:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG
@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG
+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%
+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS
@:O(`.1HVZ67sB'+ED^J+<VdL+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8Z
F`V,8+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU
+<X*nEc5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,e
EHPu9AKW@8Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
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
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X(FDl22:-pQ_C2[X(
FDl22+CcuT+EMXCEa`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?
+@p3WATJu9BOr</DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is
/g+\=@ruF'DIIR2+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is
/g,1GEHPu9ARlp*D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is
/g+2+Eag/*DKKH1Amo1\3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@lt
Ed8dAF!,C?ASqqa:-pQU+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8
Bk)7!Df0!(Gp%'7FD)*j:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,Oq
Bl@ltEd8dAF!+m6E-67FA8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'
DIIR"ATJ:f:-pQU+<Y07ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU
+<Y3+Ap806A9/k9+<Ve;AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIa
FE7lu:-pQU+<Y3/A92j$FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,
@<?4%D@HqJ67sB'+CoA+F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.
FC]<"F_t]-F<D]=ATT&5@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-
F(fK4F<GL2C1Ums+D#e:Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]Tu
F*22=AKZ&(EbTK7+EV1>F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u
+DbJ-F<GOFF<G[>D.Rd1@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8Z
B4Z1*AS-!++<VdL+D58-+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9
Blmo/DIIBn+Dbb5FE7lu:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:
Bk)7!Df0!(Gmt*U67sB'+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9
G%>0#ATVK++<Ve;ASbq"AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,
G%G]9ARloo@<>oe$;No?+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8Z
DIn$4AS5Of@rrh9+CfG'@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m
@rrh9+<VeFE+No0@3B)p@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;
%15is/g)8ZE-686G]7J-Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8Z
E-688F!)SJ+<VdL+EMXCEb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXC
Eb-A2@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<
+<Y`IDfTD3-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68E
AU&<<+<VdL+EMXCEb-A3@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO
67sB'+E2IFGAhM4F!)SJ+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4
+D5M/@UX'qEb/ioEb0,uATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lG
De*p2DfTD3Ea`iuAKWZa0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4
De(4)$4R>;67s`uAT23uA7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0
:/+#P90G<i+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k
6V^<H;cGn@1a!n`+<Ve%67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE
:.%fO:fBM<2'="a+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4
%13OO:-pQUD..-r+Co2,ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*
9M&/^/430":JFYa%13OO6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn
+Cf4rF)rIBEZf4-@rcK1FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1
DBNk,C1Ums+Eq78+D,>.F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(
F?1OTBk)7!Df0!(Gp$X9@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(
AKYK$D/aE2ASuTN+EM47Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^A8,OqBl@ltEd8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3
DIm^-3Zr6IF*&OHBl.E(DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"
@q?cmDf'H3DIm^-+EV%$Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,Lo
ASu!h+E1b2BHSlL-tI%&DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZrKXH=\4;Afu#$C1Ums+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMl
FC?;(Bl%?'@rH4'Df0-(FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W
8PT^%8PW;b<Cp.Y;a!/a8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&
@3B/rCh4`!Df'H3DIm^-Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)4
6V^QO>"'u0:.88]9L26F%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8
+Cno&@1<Q8:0(=_;cH[Y3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOf\$4R>;
67sBu@;TR.DBNk<+DtV)AM.k/D.Oi2AT2'u@<?F.+Cf(nEa`I"ATA4e:..lW4ZXrC-Qij*%15is
/g,7VBl+u5BkM+$+=M>P@;0OlDJ(C@E+*j%+Co&"Bl.R+ATDi7+Xefh4Y@jR5u^BC78+-tEc>Q2
EbTAR3aEjQINViU+>#2g><3lV/h^H^+Ab@'845m?,$uHU+C,E`%15is/g,4SCh[u6@UWb^F`8I@
@;TQuE+*j1ATDZ2@r)S]F)Yr0FCK,rD.Pjk+=KuQ:K/ZMAS,k$ATMs6+?L]@6r-c/@:jUmEcZ>C
.1HUn$;No?.V3L.A7]^kDId<rFE7                                              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P&q+>Pes3$:%3C2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[X(FDl22F*)>@@:s-o
DdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[W3                                  ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests bgetSmoke00 bnlSmoke00 bnlSmoke01 compjSmok'
zz=:zz,'e00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeM'
zz=:zz,'acroTexts edSmoke00 globsSmokeAssign000 globsSmokeDoc00 grpSmoke00 '
zz=:zz,'jodageSmokeDays00 mnlSmokeArgs00 newdSmokeBadArguments00 odSmokeArg'
zz=:zz,'Fail00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''                     '
zz=:314{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>PljDe*p+Deip+ATMs7-t6h#F=A>@EbBN3ASuT4F)>i2AKZ)+F*)I~>
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
1E\P#-p0UR/mg=U-QkiU;D9gZ+@T1+0ebI-78d#<0K(%B;Go5'2]t\<8l%ihDKKH1Amo1\+A$lO
:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)9gMlV5tscj@UWb^DKTe=
@UWb^F`:l"FCfM9@Uj(_@r#sjD.Rc2@V97o+C\tpFC])qA8bs#@V97oA8bt#D.RU,+C\tpFCf]9
Cgh$q+C\tpFD#Z:AU&;>@V97oDdmHm@ruc7@V9auBleA=@W$!)@W$"'ARTUhBHUc'@<?1(Ap>G-
F_PZ&C2[WmDf'H6ATMp(A0>AqARfLb@:O'qARlp(ASbpdF(K*)A0>r4Ch\!#DIIBn+EV[H@;Ts+
FE;P4D/_6X.4cl04?G0&0d%hd@V97o;f-GgAM>e\@W$!K@<6-m0JO\ZDJW6gDeio<0HahBCf>1h
CLo1S+D58-6tp.QAU&;qD/X3$0JFVcDdd0uATMrJ0JI$O@ruF'DIIR2+E2IF9jr9a@;TRSD/X3$
0JFk'/1<VC4"akp+=A:HDe'u*De*p2DfTD:.4cl0/3G:pDe*p+Deip+ATMs7-RgSp4?P\X?SNZN
+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=Wh0rBl%<pDe*BmF*)G:@Wcd,Df-\2
BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#C2[X%Eb024C2[X%Ec5Q(Ch4`+@;]dkATMs.De'u-@;]dk
ATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$80I/D-0f^sD0JY7;3&WNI2_[6L
+>PW*3A<6E1+kC@1bpgH1,Lp41,(FC0etF</i>FF1c@'K2)QL30JPRB1,(L:2)dER3&NQR+>PW*
3A<6D1bL^G2Dm6F2)[H;1,(FC0JbF?/iP^I2)6pE2E;m80JPRA1GL^=2`EWP1,:^F3?U(20f^pD
0f1LA2`<NK3&**A+>PW*3A<6D1bL^G2Dm6F3ANN91,(FC0JbFC/i>XJ1Gq$H2DZI20JPRA1GU[;
1c.*E0JPLH1a"P-0f^pD1,:I=2_d!F2Dd9O+>PW*3AE6D3A*3E3AEEL3AEE71,(FC0JbF@/i>F?
2`<ZM1H?R50JPRA1GLa>2)mBK0K(jD1*A>+0f^pD0f:R@3&NZO0fUpJ+>PW*3A<6D2(gaG1bgjE
1,gp11,(FC0JbF@/i>UI2`WQK3&Mg60JPRA1GLa>2)m<J2DI0J0d&5*0f^pD0f:R@3A<BK2Dd-2
1,(FC0JbI>/i5RH1H7?J0eje+0JPRA1GLa>2)I<J3AicU3?U(20f^sD0JtI?0f:[F3&33I+>PW*
3A<EJ2_HsA3AWNN1c%!31,(FC0JbF@/i>ID0JYIF1bg+.0JPRB0JGC;2)?pC3&33C2]sk00f^sC
1-$sF2)mTP1cI9N+>PW*3AE6D3A*3H2*!HJ2_d<81,(FC0JbI>/i5@?2`NfP2`W!90JPRA1GU^<
1bq'N2)I3I0d&5*0f^sD0JY7;3&WNI2_[6L+>PW*3A<6E1+kC@1bpgH1,Lp41,(FC0etF</i>FF
1c@'K2)QL30JPRB1,(L:2)dER3&NQR+>PW*3AE9C2(gaG1c[?O2`2^50JPRB1,(R<2)mEQ1H7<N
+>PW*3AE9C2(gaG1c[?O2`2^50JPRB1,(R<2)mEQ1c-pG2]sk00f^sD0JtI?3&EWO3ANTO+>PW*
3A<6D3%d*H1GUXD2*!W=1,(FC0JbI=/i5CC2`3QR0JXb+0JPRA1GU^<2)@6P1cIBM2BXb/0f^sD
0JY7=0f1UE2`ETO+>PW*3AE9C1bL[D2)I*G0JG@,1,(FC0etF?/i>CA1c%$G1GL"-0JPRB1,(I9
2*!KO1cR6H0d&5*0f^sD0JtI?2)mBK3&r`N+>PW*3AE9C1+kFE3&`TM0fV$51,(FC0etF?/i>CD
0KD!F1H-F30JPRB1,(I92D?j>1H7?S3?U(20f^pD1,:I=3ArZQ3&!'A+>PW*3AE9C1G1L=3&*-D
3Arl?1,(FC0etF?/i>@C1Gh!E1,C%.0JPRA3&3EF2)%$H2)[9I2'=Y.0f^pD0f:R@2D?mA1,1U?
+>PW*3AE3A2D-jC0JkaE0ekU01,(FC0ekFD/iGUG3AriU0f1".0JPRB0etaA2Dd9O1GUmD3?U(2
0f^sD0JtI?2DI$I0JkUA+>PW*3A<6E1+kC=3B/lQ2D[':/1<V9+?(Q$0JPRB1,(O;1c@-E1bq!H
0d&5*0f^pD1,:I>1Gq!L0K1g21,(FC0etF=/i5@>1c7*G2`)X40JPRA1GU^<2)R'B2Dm?L2BXb/
0f^pD0f:RA1c$jB0eb@C+>PW*3A<EJ3A*0H0eb@C0JG=+1,(FC0JbFC/iGUB2DHsE2)ud70JPRB
1,(R<2)m?O3AWQM2'=Y.0f^pD1,:I>1H7-M3&NEL+>PW*3AE9C1G1L?1,LjF1H.-51,(FC0JbI>
/i>LA0JYXD0f:(/0JPRA1GLa>2Dd<P1,LdG2BXb/0f^pI1-$sE2)-d?3A<-D+>PW*3A<6D3%d*J
0JPRJ0K(^9/1<V9+>P2t0JPRA3&3EF1cI0F3&i]L1*A>+0f^pD0f:R@1c@0H3AN9C+>PW*3A<EJ
2_HpG1,:gK1GU^.1,(FC0etF?/i>@C2`*6E2_lg5-p07=0f^pD1,:I>2)7*L1cRKQ.l]LC/ibXD
2)mKJ2Dm?G0KD'ABeD.`0e"Y%4>J$60I/D-0f^pD0f1LA2`<NK2`WTM+>PW*3A<6D1bL^G2Dm6K
3AEB61,(FC0ekC;/i5L@1GLdB2E2g70JPRA1GLjA2*!TL1,^gD1a"P-0f^pI1-$sF0K1^?3B&cO
+>PW*3A<EJ2_HpE3&<9E3A_j60JPRA1GLa>1H76P2)R3G2]sk00f^pD0f1LA2`<NK1,h$H+>PW*
3A<6D1bL^G2Dm6F2`*?61,(FC0JbF?/iP^I2)6pG1c-=10JPRB1,(R<2)mEQ1c%-P2'=Y.0f^sD
0JtI?3&EWP1cI-31,(FC0ekC;/i5L@1GLdB2E2g70JPRA3&3KH2D?sD2_m*A2BXb/0f^pI1-$sF
0K1^?3B&cO+>PW*3A<EJ2_HsA2E3TN1,Ud/1,(FC0JbFD/i5CF2*!WM2E)a60JPRB1,(R<2)mEQ
1H@0D2]sk00f^sD0JtI?3&EWO3AE3H+>PW*3AE9C2(gaG1c[?P0ebO8/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
