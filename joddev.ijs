NB. JOD dictionary dump: 07 Dec 2019 13:59:00
NB. Generated with JOD version; 1.0.0 - dev; 27; 07 Dec 2019 13:56:54
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

JODTOOLSVMD=:'1.0.0 - dev';27;'07 Dec 2019 13:56:54'

JODVMD=:'1.0.0 - dev';27;'07 Dec 2019 13:56:54'

MAXNAME=:128

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


abv=:3 : 0

NB.*abv v-- all backup version names.
NB.
NB. Returns all valid backup names matching name prefix (y). 
NB.
NB. monad:  blclBNames =. abv zl|clPfx
NB.
NB.   abv 'ch'  NB. all words in all backups starting with 'ch'
NB.   abv ''    NB. all words in all backups
NB.
NB. dyad:   blclBNames =. il abv zl|clPfx
NB.
NB.   2 abv 'jod'  NB. all group names in all backups starting with 'jod'
NB.   4 abv ''     NB. all macros in all backups

0 abv y NB. word default
:
if. badcl_ajod_ y do. jderr_ajod_ ERR002_ajod_ return. end.
if. -.isempty_ajod_ y do. if. badrc_ajod_ uv=.  checknames_ajod_ y do. uv return. else. y=. rv_ajod_ uv end. end. 
if. badrc_ajod_ uv=. x bnl '.' do. uv return. else. bn=. }.uv end.

NB. names matching prefix in all backups
pfx=. (<a:) -.&.>~ }.@(x&bnl)&.> (<y) ,&.> bn
b=. 0 < #&> pfx 

NB. return backup names from most recent to older backups
\:~ ;<"1@;"1&.> (b # pfx) ,"0&.> <"0 b # bn
)

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
    case. HEADER   do. (GROUP,2) bgetobjects__ST bnm
    case. DEFAULT  do. GROUP bgetgstext__ST bnm
    case. EXPLAIN  do. GROUP bgetexplain__ST bnm
    case. DOCUMENT do. (GROUP,1) bgetobjects__ST bnm
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. (SUITE,2) bgetobjects__ST bnm
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
NB. unless the JOD dictionary name is a valid J name.
ro=. ((<DNAME__doj) ,&.> '_' ,&.> ":&.> bn) ,. a:

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

NB. insure any empty documents have literal datatype
ok <btextlit ro
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok (<'NIMP bgetdocument'),<y
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get short explanations from backups.
NB.
NB. dyad: il bgetexplain btNameBn

NB. object names 
nnm=. 0 {"1 y [ obj=. 0{x

NB. results are boxed name literal value tables
ro=. nnm ,. <,''

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

  NB. distinquish object names with backup number suffix
  ro=. (((<rx;0){ro) ,&.> <'_',":bob) (<rx;0)} ro

end.

NB. insure any empty explanations have literal datatype
ok <btextlit ro
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. dyad: il bgetobjects btNameBn

if. badrc uv=. (x,0) bgetobjects y do. uv else. ok <0 1 {"1 rv uv end.
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. dyad: il bgetobjects btNameBn

NB. object code, offset and names
nnm=. 0 {"1 y [ 'obj offset'=. x 

NB. HARDCODE: 2 indicates fetching group/suite list(s)
offset=. (bgslist=. offset=2){offset,0

NB. results are boxed name value tables
NB. words & macro have three columns
ro=. nnm ,"0 1 (1 + (offset=0) * obj e. WORD,MACRO)$a:

NB. HARDCODE: result columns
cols=. 0 _1
if. (0=offset) *. -.bgslist do. cols=. i. {:$ro end.

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

  NB. distinquish object names with backup number suffix
  ro=. (((<rx;0){ro) ,&.> <'_',":bob) (<rx;0)} ro

end.

NB. for nonwords insure any empty texts have literal datatype
if. obj~:WORD do. ro=. btextlit ro end.

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

btextlit=:3 : 0

NB.*btextlit v-- force any empty backup text to literal datatype.
NB.
NB. To insure that (ed) can always edit  (bget) backup name value
NB. tables force any empty texts to a literal dataype. If this is
NB. not done the result may  fail the name, value argument  tests
NB. of (ed).
NB.
NB. monad:  bt =. btextlit bt

(<'') (<(I. 0 = #&> _1 {"1 y);_1)} y
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
0f:p51,pC3+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1Gg41+>Pbr2]t"5+>GSn2)l^5
0d&51+>b2t2'=V-+>bu!0esk-3?U%2+>c&#0ea_,1*A;++>Pbr2]sq2+>Y,t1*AS"2`;d<+>Yr!
3$:%:+>Ghu1c?I:+>kns1*A>.+>GPm1,C%-0H`,1+>t>u1E\V!2*"6S8l%ihDKKH1Amo1\@rHC!
+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\
H:gt$FDl)6F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.
De*R"FCfK)@:Njt8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f
9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&
APGHm:-hTCD..['D09\<Ch7KsFD)e8AftVu@ruF'DIIR2+DtV)ATM9hG%#3'+C\bhCNXS=G%G]8
Bl@l3DIIBnF(/QfCMn93Bl7F$ASl!rFE8R6@:O(qE$0+.@r!2sDfor>+CT.u+C\bhCNXSLEb0<6
DfT9.Bl@l3FD5T'F*(i-E+36cCNXT,@<?(%F(8WrF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=Anc'm
F!+n/A0>o(FEMVAF!+q#@r$4++Cno&ATM<jBOt[hDIIBnF(8lp@r$-.@UWb^F`8I@@;TQuE+*j1
ATD[0@V97oEb0?5Bk;I!F!,C1C1UmsF!,(8Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+F(/cnFC])q
A8bsjATT&(@:O(qE$0=8EcYr5DK?q=Afu2/AKYMt@ruF'DIIR2+CoD#F_t]-FCJloFC]<"F_t]-
FD#0,+C\bhCNXS=G%G]8Bl@m1+E(j7DdmHm@rri(De!p,ASuU2@V97oAU&01@;0UlATT&(@:O(q
E$0=8EcYr5DK?q=Afu/.DfTqBDdmHm@rri)G]7J-DIIX$Df0W*B4Z0tF*(u<FD#0,+C\bhCNXS=
G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/BOtU_ATDj$B4Z1'@VTIaFE;)+F<GL2C1UmsF!,(8Df$V+
@:O(qE-#K$F)5Q3FD#0,+C\bhCNXS=G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/Ch[s4F(0$'Ch[s4
+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8d<@<>pe@<6!&@UWb^F`8I8Bl%@%@W$"'ARTUhBQI`n
EarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtABl.g*AKYJr@<,ddFCfJ8
Ch[s4+E1b2FCfK1F(0)sFD,`-G[b)kCNXS=Anc'm+E1b2BHU`$A0>JuCh4`,@;TQuF*2),Bm=*/
AU&<5Blms*EarZ'@;^?5ASlC.Gp$R)@r$4++EV1>F<G[D+Dbb6ATD3q+Cno&@<?d6AR]drCh.:!
A7KOpE,oN2F(JlkF_PZ&F!+m6Ap%p+Gp$U8D/aN,F)to'+A,Et+Dbt)A0>u*F*&OG@rc:&FCSuq
@r#O^@r$0tF*&O:DfQtBBOr<*Eb0<'DI[6#De:,2F`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATMEn
ARoLs+Co1rFD5Z2@<-W9DdmHm@rud4ASbpdF(K*)A7fOn@;I&Y:IH=GASbpdF(HJ8FCfE4F)Yr0
FCK,rD.Rd-Ch[u6@UWb^F`8I@@;TQuE+*j1ATDZ2@r-7.FCB$*F*(i.A79Lh+DN#Y?SFD]Ch[@!
@<-W9FD5T'F*(i-E--/C@;Ts=FD5T'+EMX5D/^V9Ch.*t+EV=7ATMs%D/^UL+ED%4CgggbA0?)1
FD)e7ATo7h+Co%qBl7X,Bl@k                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)l^;+>P&o0d&D62`;d50H`,+3B/-90H`)*1,C[.0ea_11,pC22]sh00f^@30d&5*1c$7/2]t(=
2.C30FAm$pCLo1R:-pQ_@V97o;f-GgAM>e\F=f'e-t6h#F=A>@EbBN3ASuT4F)>i2AKZ)+F*)IU
%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8c:
$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67r]S
:-pQU+<WEg+=LuCA9;C(FCfJA+DGm>@3BB)@:UL%@rc:&F:ARP67sB'%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPRuARdDN%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?
@<6!-%13OO:-pQUD..3k+DPh*FCfN8ATAo*Ec5e;8l%htA8-+,EbT!*FD5Z2+Co1rFD5Z2@<-'n
Et&IO67r]S:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$;No?+<VeDCi^^H
C2[X)ATMs)E[M;'Ci<`m+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G0
3Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>Ci<`m;f-GgALBW%+>G!O
ATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"mCi<`m;f-GgALTc'+F?-n
0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-Ql/N/g*51+<XEG/g,FJD/Ej)+E)-?%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>;
67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr-RU8h-7hD1/1)_l-RU?.-mO0`4utqW4XMO(
-RU>l%15is/e&._67sBU67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@V97o.3N&>B6A'&
DKI"?@<?U&Ec,q-$;No?%15is/g+nH@m)jq:I7ZB6W?fJ?X[\fA7$lU8OHHK:JO2R=^PTPDe*2t
+:SZQ67r]S:-pQU:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2+>"^MDI[L*A8,po+D#A'A7]9o
.!R0M$;No?+DbJ,B0A9u-p22r0I\+q+=K>r0Hb+J@jrNO+=Jdf-r30%771$L6XO8:De*3(4#e?C
.3K',:-pQB$;No?+AP6U+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o:-pQU:-pQU
+<VdLDIIBn+<Vdg+<YQ1D.P>0Dfor>+<W`g+Dbb5F<GL6+C\bhCNXS=DIIBnEt&IO67sC$@<-!D
3Zoef@;TR'+<W`g-Z3@0AM.J2F`):K+?L\g-Xpn%CdLm*D.Rc9%15is/e&._67sBU67sC(@;KXg
+=L]3ATT@D@<-"'D.RU,+E1b2FCfK1Et&IO67sBq@<-!D3ZpO/0d&P%0d%Z$-8%J)0d&.m1*Cof
0d%T&+=K?"+C\tpF<Dq[+=nX/3Zp."/0K9^-p2<SEb?gD/0I&'EHQ2AAL9#n+FQ:k@<-!0+=nX^
3c\YLB+52C67r]S:-pQU:-pQUGA(Q*+=MI`+DGm>2'>%)6qKaF8P`)I;HY,NDL!@B@;TQuE+*d/
+E(j7DIIBn/n8gBDKI"?@<?U&Ec,q@@<,p%BkM=%Eb/bj$;No?+DP>*B0A9uC12-q+=nW_2'?@@
ATT%B-RU8h+?L\n2'?@@ATT%B-SAnIF`):K-RU#u+=B#h@V97o+C].sCdW,`DKKqI%15is/e&._
67sBU67sBnEc6)>F!+n/A0>r9Blmp-+D>2,AKYE!+CSekBln'-DII?(@psFi+EVNEAn?'oBHUbm
@r$4++DtV)AKYf'F*)I4$;No?+DP>*B0A9uC12-q+=nW_1*A:o@V97o+=AOS@;TR'-RU#u+=Aoe
0d'q<ATT%B-Z3@0AM.J2F`):K-RU#u+=Aoe0d'q<ATT&(Ch%9J:18!NF!hD(:-pQUC12-q4ZX^#
@<-!'/0H;r+>G!JB4Z0--RWe?D.P(B-QkJn-Sll"+C\tpF<DqYDIIBn/n8gBDKI6R-QkJn-Sll"
+C\tpF<G%/@r+J,@;TRs-OgCl$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&
+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27
+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!
6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_
C1\h&$4R>;67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgn
A0>H(Ec5t-$>sEq+C\tpF<DrKDffZ,DJ(=+$>sEq+C\tpF<EY+-Zj8LF(Jo1%16uaEZeh(ATT%B
BOu3q-OgCl$;No?+CfG'@<?''FD,]+AKYGj@r$4+Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!Zm
FD5Z2+>"^ID/aTB%159QHZ3D'CLeQ0A8,Oq%13OO:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2
%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.24tq>&@:O(`+EV..@rr.e+:SZQ
67sC&BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+
ATMrJ%159QHZ3D'CLeQ0A8,Oq%13OO:-pQU:-pQUF)Po,+C\c#Bk&9"DK]H)Bk/>pEbBN3ASuU2
+>"^IG]75(FCeu*ATDg0EX`@nATAnI+?1Jt+C\tpF<DrU@<-!fGB.V>B."fE:-pQUCh[s4F!,C5
+CT@7D/XK;+>P&K$>sEq+C\tpF<Dq`@4)KkDImi21a$7?ATT%B/hJe*%16uaEZd+[@V97o+=Aco
-OgE#ATAo&B4Z0-0F\A,ATAo&B4Z0-4=;Kc$4R>;67sBU67sBQ+DtV)ATJu<Bln#2ASkmfA7T7^
+Dbt+@;KLr+CT;%+Du+>+DG^98l%htA8,OqBl@ltEbT*+%16uaEZeh(ATT%BBldWgGB.V>B.",q
DImi2@V97o+=ClE?XIAfAStj^GB.V>B4Z*2%16uaEZeh(ATT%BF*),4CgVC,Df02p-OgE#ATAo&
B4Z0--Xe>L+<VdL+<XEG/g,%MF<G!78g&"[D.O.`%15is/g*nU/g+SAE+NotF!+t8EcP`/F<G10
EcZ=F@UWb^F`8I@F_tT!EZbeu9L2TV6;CNT4ZX]I0d(fc@W$!)-S?bh%16uaEZeh(ATT%BD0]Jt
@:W^m/5/?.<'j>[9aqGIATAo&B4Z0--Z+-9?XdGS-S.qW;cH(Y<D<o0DImi2@V97o+=CoHF*&a8
?=A%iF_iEV9L2TV6;CNT%13OO:-pQUBl8!7Eb-A:@<-(#F`S[D@VTIaFE8R5Eb-A-DBNb(F*&O6
@:O(qE"*.<0RI_K+EV..@rrht+>Y-YA0<6I%15^MF*(5i@:Nt^Gs+22BeCMa%15XKDJNg/6uR*k
4ZX]58K_P^+EqL-F<F-tA8`T"ARf.kF(HIc+CT+0GA(E,+A!\aD'oc"7rMp;GA1l-B4uBM3Zob%
4q.inGuS3^BlmBeEah0m+=f)S$;Ge7G]7J5@qg$cATD6C3Zp4$3Zp*c$@![D+F+D'.1HVqEZfI@
E,9H&+E2IF+?MV38p,2s:h='FBOuH389JfcAU-[^Ed8ctDe)gkBl%KrBQP@kGuS3^BlmBeEag.c
GsussCh[BnFB2sn@OE9-$4R>;67sC%Df'&.F(fK4F<GdGEb$;(G]7J-DIIX$Df0V*$>"6#0H`=t
E-67F-VAN&FAQOW@q]G!-T`\aEb-A8BPD?sF!,L7@;Kb*+DQ%?F<GO6@:Ntr-OgDoEZd%Y3$<0_
F<Dr*GsussCh[BnFB2sn@OF5bAU&01Bk(k!+Eh=:@WNZ)ATT&4D]j(3F)Y]#F<G19Df$V3+D5h;
F`So>$4R>;67sC%Df'&.Ci=3(+EqaEA0>H.E,8s#@<?4%DK?6o6#:@=DfTVgDbt7YGs+220H`D!
0F\@3+CT)&+EqaECER&'A0>c.+E2.*Gp$s4CLqQ0C11Uf+CQC'F_kk:@W-N$$6UI"Cht5<DfTV9
@;]TuDJpY:CghT3D..3kF!,4+@r!2q+CoV2C`m2*Gmt*'+CT)&+EqaECER&'A0>c.+E2.*Gp$s4
CLqQ0C11Uf+CQC'F_kk:@W-N$$6UI"Cht5<DfTV9@;]TuDJpY:CghT3D..3kF!,4+@r!2q+CoV2
C`m2*Gmt*'+E(j7@rHL1F(HJ/@:O'qG@>P8@3B*'Cht5'Dg<I6DL$G7Gp%0H+C\bhCER_;+EqaE
CERA#@quM\.1HUn$>"6#0H`@uE-67F-V&)c<-N%mBkM+$-TaV1CfbOqCJJeECghSu$>"6#0H`@u
E-67F-V\kc@:O"n<b6;\-TaV1CfbOqCJJeECghSu$4R>AATMrmAU&;N4ZX]5FCfN8+EV1>F<GF/
A7Zm+DJ=*5AKZ)5+EV:2F!,R9F*'Gc-S-H&A8,RlF_tJoC2[Wi-RT?1<+U,m<+U;r0g.Q?-Z*dB
AKZ)+F*&OHAU&;>D.-sd+E_R9EHPh8FDi:DBPDN1FCfN83Zoe$,!'7KA8ZO,?X[\fA7$]3%16'G
F*(AmG]Y](3Zoe]G%GP6D/XH++EV19F<G[:G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a
3b2r8DKTf'@;9^k?RI31$>"6#0d(FXF<Dr1ATMrmAU&;N-Tb:=F*(AmG]YVK$>"6#0d(FXF<Dr1
ATMrmAU&;O-Tb:=F*(AmG]YYL$>"6#0d(FXF<Dr1ATMrmAU&;P-Tb:=F*(AmG]Y\M$4R>;67sC%
Df'&.F(fK4F<G"0A0>],DJ()6ATMr9AU&01@;]LqBl@m1%16Ze+>Fuu+E2IF+=C-"F*(AmG]Y\g
4""rcASrW4ATMs7+CT;%+Dl%;AKZ#)G%G)uBl7Q+FD,*#+E)41DBNG-A7[+t$>"6#0d&J!E-67F
-WFYuFAugrF>,((6#:@=DfTVgDbt7YGmt)i$;Fr=Ec4ogG]YW&3Zoee@:O=r+EV1>F<GF/A7Zm+
DJ=*5AKZ)5+EV:2F!,R9F*'Gc-S-H&A8,RlF_tJoC2[Wi-RT?19jqOPDcC:mF>5p>+=D#EEb-A1
@:O=r+EV1>F<GF/A7Zm+DJ=*5AKZ)5+EV:2F!,R9F*'Gc-S-H&A8,RlF_tJoC2[Wi-RT?1ATAnM
+E2IF+=Bll@rcKeAU&;N-Tb9r=B&X9C2[Wi4&'-nEc4ogG]YVK$>"6#1a$a[F<Dr*@:O=r<+U;r
0df%^79EMr@;9^k?TUtj@rcKeAU&;O%13OO:-pQUF)Po,+EM47Ec`F4DIal+Df021FCfN8+D#e:
Cgh3iFD5Z2Et&IfEZd1]3$<0_F<Dr*@:O=r<+U;r0IJq0D/!m%+DkOsEc3(3G]7J-DIIX$Df-p3
$>"6#1a"e$E-67F-V\#ZEc4ogG]YVe4$d\!=)W+p:2`sF@<i:h%15is/g,4RD.Oi&Ec6)>F!+n/
A0>r9Blmp-%16Ze+D5_6+AI,[FEM2-7riNjE'66)4$"``GuJg-AnFPRDfp"A9mK]H@qg$cATD6&
9mK0PE,95uBlmBeEagC*$>"6#B6%r68p,2s7riNjE'66)4$"`]F`VXpEc6)>+A-ctFAQOW@q]G!
+@pWmCLqcZDfU+G7rMp;GA1l-B4uB7%16Ze+>Y-QEc<.#ATMrlD/X3$;fuerAN`'s4$"`gATMrl
D/X3$;fuerAKXr`F*(AmG]YV^<+U,m<+U;r1+*M<%15is/g+kGF(KB6+Co1rFD5Z2@<-W9A8bt#
D.RU,+>"^MDKBr@AKZ)+F*&O8Bk)7!Df0!(Gp$X9@s)X"DKI"8F!,[IBlmop@VfUT%172fBk)6-
/NP"90mdGFA0<QK%16Ze+CoG4ATT%B6r-0M9gqfV6qKaF-Ta$l$>"6#2'?j\F<Etc@mk6F<+U;r
4ZX]5A8,OqBl@ltEd8d<De!p,ASuT4FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,c
Bk2+(D-p^dDe*3&-OgCl$;No?+D58'ATD4$ATJu1@<6N5@UWb^F`7cs4tq>&@:O(`+EV..@rrh&
$;<`a<'j>[9g(N[4#%k)+C]5)+=Ach+:SYe$;No?+C\c#Bk&9/@;KXg+CT;'F_t]-FE7luATAo&
B4Z0--VAN&FAQOW@q]G!-QjNS+<VdL%16Ze+C\tpF<Dr'F`VY$ART(^AU,XS9L2TV6;CNT%16Ze
+C\tpF<EY+-VAN&FAQOW@q]G!+@pWmCLqcZDfU+G7rMp;GA1l-B4uB7+:SZhEZeh(ATT%C4$"`]
F`VY$ART(^AU,CgDe)gkBl%KrBQPUN+=nil4s2s]5uU`L:/t"2+<Vd9$>"6#0Hah;ATT%B8p,2s
:h='FBOuH:+<VdL+<Vd9$>"6#0Hah;ATT%B8p,2s:h='FBOuH:/5/?.<'j>[9ctPf$>"6#0Hah;
ATT%C4$"`[F`(u+GslRkGp#UqA5mbeCh[NqF=/L[/1)u5+?W=`;cH(Y<D<o0ATAnJ+C\tpF<Dr1
ATMrmAU&;N-QjNS+<VdL+:SZhEZd(Z@V97o+=C-"F*(AmG]YYf/5/?.<'j>[9ctPf$>"6#0d'q<
ATT%V3[[m<F*(AmG]YV^<+U,m<+U;r1++1e+:SZhEZd+[@V97o+=Bd(F*'omDfp"H+<VdL+<VdL
%16Ze+>P'KB4Z0--VAN&F@U@iF`8]Z9L2TV6;CNT%16Ze+>P'KB4Z0-4$"`]F`VXpEc6)>+AI,[
FEM2-7riNjE$l)%+<V+#:-pQU1E^.>ATT%BDIIBn-QjNS+<VdL+:SZQ67sB:+C\tpF<DrK@;TR.
@rHL-F=/1R%15is/g)qm@V97o+C].sCdLm*D.Rc2+:SZ#+:SZhEZd1]@V97o+=Bll@rcKeAU&;N
-QjNS+<Vd9$>"6#1a$7?ATT%B9jqOPDcC:mF>,'n9L2TV6;CNT%16Ze+>b3MB4Z0-4$"``@:O=r
<+U;r0Ha(u@rcKeAU&;N-QjN@$6UH#$;No?+EMI<AKYN%DC9NK@psCh+Cei$ATJt'$>"6#2'?@@
ATT%B<affYA56QMATL.I@qBV$ARm/2+<VdL:-pQUE-67FA8,OqBl@ltEd8d<De!p,ASuT4Eb0?8
Ec,H!+<Vd9$>"6#2'?@@ATT%B8RZI7Db4SZDfTE"-S.qW;cH(Y<D=SY:-pQUBkAJs@:O(qE$0%@
D.7's+DGm>E,oN2ASuT4BlkJ7F`VXI@V$[#CEO`/$>"6#2'?@@ATT%V3[])ZCh[E&DIIBnF!,10
DJsQ,A1&KB:-pQUE-67FA8,OqBl@ltEd8d<De!p,ASuT4Eb0?8Ec,H!+:SYe$;No?+E)CE+E(j7
Ea`iuAKYGj@r$4++Du==@V'S$+D#S6DfQt=F`\'"DImi22'?@@ATT%C4$"a'DK]H)Bk/>q@:O(q
E$0%@D.7's-Rg/h-8%J)4=;a//0[,00H_kg+te9r9L2TV6;CNT+<V+#+<V+#ATAnI+?1KQB4Z0-
-V\kTG]7J5@qg$cATD6-+<VdL+:SZhEZd%Y3$;[CATT%B9mK0PE,95uBlmBeEagCI9L2TV6;CNT
%16Ze+>=ot+C\tpF<EY+-V\kTG]7J5@qg$cATD6&7rMp;GA1l-B4uB7%16Ze+>=ou+C\tpF<Dr$
De)gkBl%KrBQPUE+<V+#ATAnI+?:QRB4Z0--V&)c<-N%mBkM+$-S.qW;cH(Y<D<o0%15is/g)hj
3?VdDATT&(Ch%9J:18!NF!)S7$;No?+>Fuu+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU0d&Fu@V97o
+=D&8D.P>0Dfor>-OgDX67sB8+?1KQB4Z0-@VfOj6;Cs+ATJt:%15is/g)kk3?VdDATT%BDIIBn
-QjNS+<Vd9$;No?+>G!!+C\tpF<DrK@;TR.@rHL-F=.M):-pQU0d&J!@V97o+C].sCdLm*D.Rc2
+:SZQ67sB9+?1KQB4Z0--Z3@0ALATC+<VdL%15is/g)nl3$;[CATT%BDIIBn/n8gBDKI68$;No?
+>P'!+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1*AS"@V97o+=D&8D.P(;+<VdL+:SZQ67sB9+?:QR
B4Z0--Z3@0AM.J2F`):K%15is/g)nl3?VdDATT&(Ch%9J:18!NF!)S7$;No?+>Y-"+C\tpF<DrK
@;TR'+<VdL+<V+#:-pQU1E\Y"@V97o+=D&8D.P>0Dfor>-OgDX67sB:+?1KQB4Z0-@VfOj6;Cs+
ATJt:%15is/g)qm3?VdDATT%BDIIBn-QjNS+<Vd9$;No?+>Y-#+C\tpF<DrK@;TR.@rHL-F=.M)
:-pQU1E\\#@V97o+C].sCdLm*D.Rc2+:SZQ67sB;+?1KQB4Z0--Z3@0ALATC+<VdL%15is/g)tn
3$;[CATT%BDIIBn/n8gBDKI68$;No?+>b3#+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1a"e$@V97o
+=D&8D.P(;+<VdL+:SZQ67sB;+?:QRB4Z0--Z3@0AM.J2F`):K%15is/g)tn3?VdDATT&(Ch%9J
:18!NF!)S7$4R>REZdba@mk6F6=FA>4ZX]C+C\tpF<DqY%13OO:-pQUA8bt#D.RU,+EV1>FE8RA
F`VXID..NrBFP:s4!8l2/0I,!I4cX1Bk'PL@mXU6CFLAX3Zph)@mk6F<+U;r%144#+<VdL+<VdL
%16Ze+>k9NB4Z0-9L2TV6;CNT+<VdL+<V+#ATAnN+C\tpF<Gua+C]5)+=Ach+<XEG/g+\C@s)X"
DKKqBAo_g,+CT)&+C\bhCNXT;%144#%16Ze+@gHjF`9`WF?MZ-1*A:o@V97o+=Bm/;fm.oAk-l[
F`8]N+:SYe$;No?+D5_5F`8I>BleB;+Dl7BF<GF/FCSu,/KetPA7]d(BlbD2EcP`-AThL"F:AR*
004P)4*s">+?gor/g*Z)Dfp"e@<<q@/NP"-3dr3"/kpUiFEM2-7riNjE"*-s+<Vd9$>"6#1*A:o
@V97o+=Bm/;fm.oAk-l[F`8]Z9L2TV6;CNT%13OO:-pQU1*A:o@V97o+C].sCdLm*D.Rc2+:SZQ
67sB:+>G!JB4Z0--Z3@0ALATC+<VdL%15is/g)qm0d'q<ATT%BDIIBn/n8gBDKI68$;No?+>Y,p
+C\tpF<G%/@r+J,@;TRs+<V+#%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@W$!K@<6-m0JQ<h
/h1=JCdMQOBk&hO+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5F<G[:F*)IU%15is/e&._
67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.
DJsZ1BHVM;Eb'56FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(SATMs.De(OV.3N>G+Dbt)A7]9o
@X0)<BOr<.ATMrS+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+r
E+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?+>Gim
@<++Y+CSekARlo3E+*6lA18XCD]ib3F*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI8F*%iu
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf
6"48DBk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r
%13OOFC])qF?MZ--Zip@FD>`)0JOpa$4R>;67sC&BOu3q+Dl7BF<G%(+CT.1DfB9*+Co1rFD5Z2
@<-W&$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k*GAR[8H1a`_>%16Ze+E(d5FC])q
F:ARP67sC)DfTB0+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZeh/C`k)Q%13OO:-pQUFCfN8
F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAnJ+C]5)+=ANG$4R>;67sBlF<G()FCfK$%16Ze
+>P'KDJUFC-OgDoEZd.\@W$!)-RT?1ATAnM+C]5)+=ANG$4R>;67sBiDJUFi:K(4d=WhQqEcQ)=
F!,"2C`m>.EZfI;AKYi.F*&O7F`MM6DKI"1@:O(qE$-_TAU%]rE-)Nr:-pQU@W$!)Df0B:+EM+&
EarcoF!+m6F(oN)Ch4`.F`\a:Bk)7!Df0!(Gp$R)@r$4++EV:.Eb-A-F!,@=+E1b2BFP;D67sBo
ASu!h+EV:.Eb-A%Eb-A2D]j"-FD)e8Eb&a%+ED%7F_l/@+Dbb-ANCqV0Ha^W+CoA++=ANG$>"6#
1a"Rs@W$!)-XT8;<$re2:-pQUD.-ppDf[%4DIdI!B-;D4FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bh
CNXS*$>"6#1*A=p@W$!)-Z<NC+<VdL:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC
+DG^9@s)g4ASuT4@UWb^F`7cs%16Ze+>=om+>=pIDJUFC-QjNS+AP6U+CT)&+Du+?DK?q7DBNG3
EcP`/F<G%$@r$4+%16Ze+>=om+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4
@UWb^F`7cs%15is/g+kGF*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI;BlbD=ATMr&$>"6#
E+*6lA0>u)Bk)5o$>"6#E+*6lA0>u)Bk)5o$4R>;67sC)DfTB0+D,Y4D'3e+Ecc#*F_kK,+C\bh
CNXT;%15is/g+V>@r*9+AftPk@r$4++Du==@V'R&A8cR2/0JM:3ZpOH/hnIr/i#480fL^>2D-^A
/ho180f(F:1+k7;-OgDX67sBmDfT]'FED))+EMHD@;Kmr@3BW0Ecc@FD..NrBHV28D.Ra%@j#i2
Ecc@3$>"6#@W$=*F$2Q,@W$!)-S?bU$=[d63ZpU@HX^l8D0%j$+FPjb@W$=*Et&Hc$>"6#@W$!)
@V[)/+<VdL+<VdL+<VdL:-pQU+C]5)+=Acr2^]^j+<Ve%67sBt@<?!mATJu&Cht5<DfTB0+DG^9
B5)O#DBNCs@r$4+%16Ze+C]5)+=D2@@OE^9CEO`B+<VdL+AP6U+<Y-2C`k*GAR[8H2^]^j:-pQU
D..NrBOu6-@;Ka&GAhM4F!,OG@<-I(DJ()9Bln#2-ZWd--Qm,@+D5D3ASrW"@:O(qE"*.cEZd%Y
1E^.EC`k*:GUG%OCEO`B+<XEG/g)8j+>Y-LDJUFCAU#g^2^]^j:-pQUGAhM4F!,%3A8,po+EqOA
BHS[6GUFVJDBNS+G%GP6@UWb^F`7csATAnJ+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0d&7p@W$!)
-Y7NT0fLI&+AP6U+EV19FE8R9DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#1*A=p
@W$!)-Z<NC/7NB;+<VdL:-pQU+>P&p+C]5)+=D)</ho:4+<XEG/g+eIDfp#?+Cf>-FCAm$Bl7Q+
F*1r5FE2)5B-8R?A1&L6DBNS+G%GP6@UWb^F`7cs%16Ze+>=om+>G!JDJUFC674<nCEO`B+AP6U
+CT)&+CSf(ATD7$+EMX5Ecc#5B-;D4FD)dE673miDBNS+G%GP6@UWb^F`7cs%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eG@<6-m3B9*,@W$!\D/X3$0JH6g/h1=JCf>1hCLo1R+ET1e+=L]:CagK8EbBN3ASuT4
F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0JFpu
A8,OqBl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.
De(OU-OgDX67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"
F_iig%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g)l.De!lD1*C"9C3=T>ARloqDfQsT3$C=>+Cf(nDJ*Mi$;No?+>Gle
ARdDM+EV19F<G16EZf(6G%#3$A0=JeDIIBnF!+n/A0>H#@V'(\ARlp"De!3lATJu&A7T7^%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eX
D/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8
-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`
CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`
CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6J3ZoelATMs.De(OU-OgCl$;No?+>%q>78m/.;cH%\
<.->-$4R>;67sC#F`2A54ZXr<-RU5l5U\01-RU8h.6o:+INUg85U\cB-RU8h.4G]5%15is/g+e<
DImisFCcS'Cht55Df]u6@VfTuG%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&Hc$;No?+EM%+
EBQ?*5!!C1+>Y,_:-pQUF(Jd#@q[!)F^]*#AnbgsEt&IO67sBqDIYgj+<VdLBeCMb+<XEG/g*b/
GAhM4+DtV)AKYK!@<6K!$4R>;67sC(@;KXg+DbV$F<DuV.3N&>B6A'&DKKq/$;No?+<VdL7;Q[K
ARlo++@KpRFD5Z2@<-W\De*F#+<VdL+<VdL6tp.QBl@ltEd:#jA7]g\ARTUhBHSE?+<VdL=)W+i
;e9BX@q\J0@;TRCCghC++<VdL+<VdL+<XBe@rcKdARTUhBMDoFEc6&FE+KIc:-pQUCgh?s4ZX]6
4D?E%.3L/a-p/\-+AY<r771$L6XO8:De*3(+=nW`/:/d@6:s[6<),ef@;9^k?R\'X@q]j2+=nW`
/:/cr=&2^^?X[\fA7$cIF(8m'4)$;i1asOu+=Jdf-nJ(Y6W-]e@;9^k?R\'X@q]jD9gM-E:K1In
7:0J<De*3(%13OO:-pQUG%#3$A0>o,B4uB0.![6a@<-"'D.RU,+E1b2FCfK1Et&IO67sB'+<Y64
E--@J+C\bhCNXT+DKI!D+CT)&Bl7Bg@r$4++<YN0FCT!)ARf:hF<D\KD..NrBPD?n@:O(qE"*.L
67sC$@<-!D3Zodt+<W`g+=Ach+<VdL+<Vdg+=AdODfor>-QkJn+<W%L@;TR'+<VdL+<W`g-Z3@0
AM.J2F`):K%13OO:-pQUAoD^,@<?Q5@;Ka&G%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&IO
67sB.:-pQU-Qjra0d%T#+u(2a3[QIC+>Fum+>P'd+u(2_4s279-Qll9C`k)S+=nX/3Zp."/0K9^
-p2<SEb?gD/0I&pF`2A5-8%J)Eaa!$%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"
ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g
0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBlEaa$#+CT/5+C\bh
CNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD+>G!LBlY=_5tbQl
6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2D]iLt@r$4+F!*%W
AU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)+=Act-OgCl$;No?
+CfG'@<?''FD,]+AKYGj@r$4+Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!ZmFD5Z2+>"^ID/aTB
%159QHZ3D'CLeQ0A8,Oq%13OO:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ3
0JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.24tq>&@:O(`+EV..@rr.e+:SZQ67sC&BPDKt+E(_(
ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%159QHZ3D'
CLeQ0A8,Oq%13OO:-pQUF)Po,+C\c#Bk&9"DK]H)Bk/>pEbBN3ASuU2+>"^IG]75(FCeu*ATDg0
EX`@nATAo&DJUFC/n$+:$>sEq+>b3MDJUFC/hJe*%16uaEZd+[@W$!)-S@#!%16uaEZeh/C`kD@
$>sEq+C]5)+?V#!%13OO:-pQU8g&"[D.Rc2GA2/4+D#D!ARo=_A0>],@ps1bF!+n3AKYl/F<G:8
+A,Et+Co1rFD5Z2@<-'nEt&IoATAo&DJUFCBldWgGB.V>B.",qDImi2@W$!)-Y[X/?Y+ClDI6ap
Ec5i.ATB.-$>sEq+C]5)+=D5PBl%TmGB.V>B4!"q$>sEq+C]5)+=CSE-QjNS+<Ve%67sBuDfd+1
+A*bo@;TQb$4R>;67sBhE,]B+A9/l'F`MM6DKI"5Bl\9:+C\bhCNXS=DKTf*ATAn&$;<`a<'j>[
9g(N[-S?bt+?M;#HQZd8C`k)X-Qij*DImi2@W$!)-Z+-9@UWeS-S.qW;cH(Y<D<o0DImi2@W$!)
-Z+-9?XdGS-S.qW;cH(Y<D<o0DImi2@W$!)-YddFF=(=#@<Z=+CaUc-5uU`L:/t!t$4R>;67sC%
Df'&.@UX=l@j#JrASuU(FD5<-+:SZ+@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-Qij*-nlcQDJUFC
-Rg/i3Zp+!@W$!)4#)(9+C]5)+=Ach+:SZ+0d'qCC`k)Q.3L3'+>G!JDJUFW0mbVt@W$!)-S?bh
%14L=+C]5)+=ANc+>#Vs1*C%DC`keoHSQ^QDJUFC/ghbN$7I\Q@W$!)-RU>c/NP"1+C]5)+?M<)
1E^.EC`k)X-Qij*-o<&UDJUFC-Rg/i3Zp7%@W$!)4#)(=+C]5)+=Ach+:SYe$;No?+<Y-2C`k)X
-OgDH0RI8HC`k)X-Qij*1a"q(,@YP,-S?bU$4R>O@:X7uD*9p&-S?bh/0H,t+>GYp.j-#g+=K<+
HX^l/+=Ach.3L2p+=Ach%13OO:-pQUAn?'oBHUo-Df$U>DJsE(G\M5@ASuT4@UWb^F`8HT+D#S6
DfQt3G]75(FCetl$>sEq+C]5)+C\biDKTe*$>sEq+>=pIDJUG)@:X7uD%-hiATAnJ+C]5)+C\bi
DKTe*$>sEq+>P'KDJUG)@:X7uD%-hiATAnL+C]5)+C\biDKTe*$>sEq+>b3MDJUG)@:X7uD%-g]
$;No?+AH9^Gp%$;+ED%1@;0UnDJ()6ATMs7+CfG+FD55nCi"A>A7]^kDIal.DBO%7AKYf-@:Wq[
+E(_(ARfh'/e&._67sBPAfu2/AKYf-@:UL%D/X3$+EV19F<GX7EbTK7F!+n3AKYJr@;]^hA0>;'
Ci=D<De:,6BOu6r+EV19FE7lu:-pQUD09oA+C\n)Eb0E.F(Jl7+:SYe$;No?+<Y-2C`k)Q%14Lo
DJUFC-Rg/i3ZqmLC`k)Q%13OO:-pQU+C]5)+=AdODfor>-OgD2@W$!)-RU>c/NP"`DJUFW0mdAI
C`k)X-OgCl$;No?+<Y-2C`k*C@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V
<$4M':J=_R6;0fq.3L3'+C]5)+=BKO:J<,F$4R>;67sB'@W$!)-Z3@0AM.J2F`):K%14L<4"!Tp
<'aJZ9e[qV-V7'4<'`iE740N,/NP"`DJUFC8PW54/3>V6@W$!0/gh)8%15is/g)hj@W$!)-RT?1
-nlcSDJUFC-Rg/i3ZoP!+C]5)+=ANG$4R>;67sB7+C]5)+=Ach%14LmDJUFC/gi(j/NP".+C]5)
+=Ach%13OO:-pQU0HahBC`k)X@rHL-F=.M)-nlcSDJUFC-Rg/i3Zp+!@W$!)4#)(kDJUFC/gh)8
%15is/g)hj@W$!)-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN
<'`iE740N,/NP".+C]5)+=BKO:J<,F$4R>;67sB7+C]5)+=D&8D.P>0Dfor>-OgD20fpaS:/jMY
:JEMj4"!Tp<)c.M9LU<X+>#Vs0HahBC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>G!JDJUFC-OgD2
0fpb(D/X3$0N;V)F>,((-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k)Q%13OO
:-pQU0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d'qCC`k)X-OgCl$;No?+>G!JDJUFC/n8gBDKI68
$7IVj-Za-CCLo2!ATMrI-Rg/i3Zp."@W$!)4#2.lDJU[Q-OgCl$;No?+>G!JDJUFCDIIBn-OgD2
0fpb(D/X3$0iV_*F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-Za-CCLo4J%13OO:-pQU0d'qC
C`k*C@;TR.@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFCF)>i2AM>J_4#2.lDJU[Q
-OgCl$;No?+>P'KDJUFC-OgD20fpalDf9H5D/X3$0IJq0@W-1$F)>i2AMGPo-Y[I?F)>i2AM>Jn
-Y[I?F)>i2AMGP]+>#Vs1*C%DC`k)Q%13OO:-pQU1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*C%D
C`k)X-OgCl$;No?+>P'KDJUFC/n8gBDKI68$7I;b0e"Y90I1'f.3L3'+>P'KDJUFW1OESKCaUh_
%13OO:-pQU1*C%DC`k*C@;TR'%14L<4""`[FE;;;CLo4J.3L3'+>P'KDJUFCBl8$6D/X3$0ddD;
%15is/g)nl@W$!)-Z3@0AM.J2F`):K%14L<4""KUDesK3Deio<-Rg/i3Zp1#@W$!)-Xq"4CaUbq
14*JJC`k)X-OgCl$;No?+>Y-LDJUFC-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.ECaUS>$4R>;
67sB:+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+C]5)+=Ach%13OO:-pQU1E^.EC`k)X@rHL-F=.M)
-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJUFW0mdAICaUh_%13OO:-pQU1E^.EC`k*C@;TR'%14L<
4"#)lBlmp-D/X3$0deCm/NP"1+C]5)+=D5Q-OgCl$;No?+>Y-LDJUFCDIIBn/n8gBDKI68$7I;b
0e"Y90I1'f.3L3'+>Y-LDJUFCF*/i]4#2.lDJU[Q-OgCl$;No?+>b3MDJUFC-OgD20fpb(D/X3$
0MPtcEc3WZ4"#)dDeio<9jqOPD_WV$-Za-CCLo4p@:O=r0IJq0F)>i2AMHnf@rcKB-Rg/i3Zp7%
@W$!)-RT?1%15is/g)tn@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%@W$!)-S?bU$4R>;67sB;+C]5)
+=AdODfor>-OgDX67sB;+C]5)+=D&8D.P(($;No?+>b3MDJUFCDIIBn/n8gBDKI68$;No?+>=om
+C]5)+=ANG$4R>;67sB7+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+C]5)+=Ach%13OO:-pQU
0H`(m@W$!)-SAnIF`):K%15is/g)hj0d'qCC`k*C@;TR'%15is/g)hj0d'qCC`k*C@;TR.@rHL-
F=.M):-pQU0H`+n@W$!)-RT?1%15is/g)hj1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n@W$!)
-S?bU$4R>;67sB7+>P'KDJUFC/n8gBDKI68$;No?+>=on+C]5)+=D&8D.P(($;No?+>=on+C]5)
+=D&8D.P>0Dfor>-OgDX67sB7+>Y-LDJUFC-OgCl$;No?+>=oo+C]5)+=Ach%14LmDJUFC/gi(j
/NP".+>Y-LDJUFC/gh)8%15is/g)hj1E^.EC`k)X@rHL-F=.M):-pQU0H`.o@W$!)-Z3@0AL@oo
:-pQU0H`.o@W$!)-Z3@0AM.J2F`):K%15is/g)kk0d'qCC`k)Q%13OO:-pQU0d&1n@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp."0d'qCC`k)X-OgCl$;No?+>Fun+C]5)+=AdODfor>-OgDX67sB8+>G!J
DJUFCDIIBn-OgDX67sB8+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Fuo+C]5)+=ANG$4R>;67sB8
+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>Fuo+C]5)+=Ach%13OO:-pQU0d&4o@W$!)-SAnIF`):K
%15is/g)kk1*C%DC`k*C@;TR'%15is/g)kk1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0d&7p@W$!)
-RT?1%15is/g)kk1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0d&7p@W$!)-S?bU$4R>;67sB8+>Y-L
DJUFC/n8gBDKI68$;No?+>Fup+C]5)+=D&8D.P(($;No?+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX
67sB9+>G!JDJUFC-OgCl$;No?+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>G!JDJUFC/gh)8
%15is/g)nl0d'qCC`k)X@rHL-F=.M):-pQU1*A:o@W$!)-Z3@0AL@oo:-pQU1*A:o@W$!)-Z3@0
AM.J2F`):K%15is/g)nl1*C%DC`k)Q%13OO:-pQU1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#
1*C%DC`k)X-OgCl$;No?+>P&p+C]5)+=AdODfor>-OgDX67sB9+>P'KDJUFCDIIBn-OgDX67sB9
+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>P&q+C]5)+=ANG$4R>;67sB9+>Y-LDJUFC/gh)8-t7(1
+=Ach.3L3'+>P&q+C]5)+=Ach%13OO:-pQU1*A@q@W$!)-SAnIF`):K%15is/g)nl1E^.EC`k*C
@;TR'%15is/g)nl1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1E\Cp@W$!)-RT?1%15is/g)qm0d'qC
C`k)X-OgD2@W$!)-S?bq+>#Vs1E\Cp@W$!)-S?bU$4R>;67sB:+>G!JDJUFC/n8gBDKI68$;No?
+>Y,p+C]5)+=D&8D.P(($;No?+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>P'KDJUFC-OgCl
$;No?+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>P'KDJUFC/gh)8%15is/g)qm1*C%DC`k)X
@rHL-F=.M):-pQU1E\Fq@W$!)-Z3@0AL@oo:-pQU1E\Fq@W$!)-Z3@0AM.J2F`):K%15is/g)qm
1E^.EC`k)Q%13OO:-pQU1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1E^.EC`k)X-OgCl$;No?
+>Y,r+C]5)+=AdODfor>-OgDX67sB:+>Y-LDJUFCDIIBn-OgDX67sB:+>Y-LDJUFCDIIBn/n8gB
DKI68$;No?+>b2q+C]5)+=ANG$4R>;67sB;+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+C]5)
+=Ach%13OO:-pQU1a"Lq@W$!)-SAnIF`):K%15is/g)tn0d'qCC`k*C@;TR'%15is/g)tn0d'qC
C`k*C@;TR.@rHL-F=.M):-pQU1a"Or@W$!)-RT?1%15is/g)tn1*C%DC`k)X-OgD2@W$!)-S?bq
+>#Vs1a"Or@W$!)-S?bU$4R>;67sB;+>P'KDJUFC/n8gBDKI68$;No?+>b2r+C]5)+=D&8D.P((
$;No?+>b2r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y-LDJUFC-OgCl$;No?+>b2s+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Y-LDJUFC/gh)8%15is/g)tn1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs
@W$!)-Z3@0AL@oo:-pQU1a"Rs@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&.m@W$!)-RT?1%15is
/g)hj0d&.m@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&.m@W$!)-S?bU$4R>;67sB7+>Fum+C]5)
+=AdODfor>-OgDX67sB7+>Fum+C]5)+=D&8D.P(($;No?+>=om+>=pIDJUFCDIIBn/n8gBDKI68
$;No?+>=om+>G!JDJUFC-OgCl$;No?+>=om+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>G!J
DJUFC/gh)8%15is/g)hj0d&1n@W$!)-SAnIF`):K%15is/g)hj0d&1n@W$!)-Z3@0AL@oo:-pQU
0H`(m0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`(m1*C%DC`k)Q%13OO:-pQU0H`(m1*C%DC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`(m1*C%DC`k)X-OgCl$;No?+>=om+>P'KDJUFC/n8gBDKI68$;No?
+>=om+>P'KDJUFCDIIBn-OgDX67sB7+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fup+C]5)
+=ANG$4R>;67sB7+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fup+C]5)+=Ach%13OO:-pQU
0H`(m1E^.EC`k)X@rHL-F=.M):-pQU0H`(m1E^.EC`k*C@;TR'%15is/g)hj0d&7p@W$!)-Z3@0
AM.J2F`):K%15is/g)hj1*A7n@W$!)-RT?1%15is/g)hj1*A7n@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!1*A7n@W$!)-S?bU$4R>;67sB7+>P&n+C]5)+=AdODfor>-OgDX67sB7+>P&n+C]5)+=D&8
D.P(($;No?+>=on+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=on+>G!JDJUFC-OgCl$;No?+>=on
+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>G!JDJUFC/gh)8%15is/g)hj1*A:o@W$!)-SAnI
F`):K%15is/g)hj1*A:o@W$!)-Z3@0AL@oo:-pQU0H`+n0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
0H`+n1*C%DC`k)Q%13OO:-pQU0H`+n1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1*C%DC`k)X
-OgCl$;No?+>=on+>P'KDJUFC/n8gBDKI68$;No?+>=on+>P'KDJUFCDIIBn-OgDX67sB7+>P&p
+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&q+C]5)+=ANG$4R>;67sB7+>P&q+C]5)+=Ach%14Lm
DJUFC/gi(j/NP".+>P&q+C]5)+=Ach%13OO:-pQU0H`+n1E^.EC`k)X@rHL-F=.M):-pQU0H`+n
1E^.EC`k*C@;TR'%15is/g)hj1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\@o@W$!)-RT?1
%15is/g)hj1E\@o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\@o@W$!)-S?bU$4R>;67sB7+>Y,o
+C]5)+=AdODfor>-OgDX67sB7+>Y,o+C]5)+=D&8D.P(($;No?+>=oo+>=pIDJUFCDIIBn/n8gB
DKI68$;No?+>=oo+>G!JDJUFC-OgCl$;No?+>=oo+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo
+>G!JDJUFC/gh)8%15is/g)hj1E\Cp@W$!)-SAnIF`):K%15is/g)hj1E\Cp@W$!)-Z3@0AL@oo
:-pQU0H`.o0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`.o1*C%DC`k)Q%13OO:-pQU0H`.o1*C%D
C`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o1*C%DC`k)X-OgCl$;No?+>=oo+>P'KDJUFC/n8gBDKI68
$;No?+>=oo+>P'KDJUFCDIIBn-OgDX67sB7+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,r
+C]5)+=ANG$4R>;67sB7+>Y,r+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,r+C]5)+=Ach%13OO
:-pQU0H`.o1E^.EC`k)X@rHL-F=.M):-pQU0H`.o1E^.EC`k*C@;TR'%15is/g)hj1E\Ir@W$!)
-Z3@0AM.J2F`):K%15is/g)tn0d&5++C]5)+=ANG$4R>;67sB;+>Fuo0d'qCC`k)X-OgD2@W$!)
-S?bq+>#Vs1a"Lq1,0n\DJUFC/gh)8%15is/g)tn0d&5++C]5)+=AdODfor>-OgDX67sB;+>Fuo
0d'qCC`k*C@;TR'%15is/g)tn0d&5++C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1*C%DC`k)Q
%13OO:-pQU1a"Lq1,9t]DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P\p@W$!)-S?bU$4R>;67sB;
+>Fuo1*C%DC`k)X@rHL-F=.M):-pQU1a"Lq1,9t]DJUFCDIIBn-OgDX67sB;+>Fuo1*C%DC`k*C
@;TR.@rHL-F=.M):-pQU1a"Lq1,C%^DJUFC-OgCl$;No?+>b2q+>P_q@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp7%0d&5-+C]5)+=Ach%13OO:-pQU1a"Lq1,C%^DJUFC/n8gBDKI68$;No?+>b2q+>P_q
@W$!)-Z3@0AL@oo:-pQU1a"Lq1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-RT?1
%15is/g)tn0d&5.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1a$7FC`k)X-OgCl$;No?+>b2q
+>Pbr@W$!)-SAnIF`):K%15is/g)tn0d&5.+C]5)+=D&8D.P(($;No?+>b2q+>Pbr@W$!)-Z3@0
AM.J2F`):K%15is/g)tn0d&5/+C]5)+=ANG$4R>;67sB;+>Fuo2'?@GC`k)X-OgD2@W$!)-S?bq
+>#Vs1a"Lq1,U1`DJUFC/gh)8%15is/g)tn0d&5/+C]5)+=AdODfor>-OgDX67sB;+>Fuo2'?@G
C`k*C@;TR'%15is/g)tn0d&5/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2BZIHC`k)Q%13OO
:-pQU1a"Lq1,^7aDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pht@W$!)-S?bU$4R>;67sB;+>Fuo
2BZIHC`k)X@rHL-F=.M):-pQU1a"Lq1,^7aDJUFCDIIBn-OgDX67sB;+>Fuo2BZIHC`k*C@;TR.
@rHL-F=.M):-pQU1a"Lq1,g=bDJUFC-OgCl$;No?+>b2q+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp7%0d&51+C]5)+=Ach%13OO:-pQU1a"Lq1,g=bDJUFC/n8gBDKI68$;No?+>b2q+>Pku@W$!)
-Z3@0AL@oo:-pQU1a"Lq1,g=bDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Po!@W$!)-RT?1%15is
/g)tn0d&52+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo3$;[JC`k)X-OgCl$;No?+>b2q+>Po!
@W$!)-SAnIF`):K%15is/g)tn0d&52+C]5)+=D&8D.P(($;No?+>b2q+>Po!@W$!)-Z3@0AM.J2
F`):K%15is/g)tn1*A>,+C]5)+=ANG$4R>;67sB;+>P&p0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Or1,0n\DJUFC/gh)8%15is/g)tn1*A>,+C]5)+=AdODfor>-OgDX67sB;+>P&p0d'qCC`k*C
@;TR'%15is/g)tn1*A>,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1*C%DC`k)Q%13OO:-pQU
1a"Or1,9t]DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>P\p@W$!)-S?bU$4R>;67sB;+>P&p1*C%D
C`k)X@rHL-F=.M):-pQU1a"Or1,9t]DJUFCDIIBn-OgDX67sB;+>P&p1*C%DC`k*C@;TR.@rHL-
F=.M):-pQU1a"Or1,C%^DJUFC-OgCl$;No?+>b2r+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
1*A>.+C]5)+=Ach%13OO:-pQU1a"Or1,C%^DJUFC/n8gBDKI68$;No?+>b2r+>P_q@W$!)-Z3@0
AL@oo:-pQU1a"Or1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-RT?1%15is/g)tn
1*A>/+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p1a$7FC`k)X-OgCl$;No?+>b2r+>Pbr@W$!)
-SAnIF`):K%15is/g)tn1*A>/+C]5)+=D&8D.P(($;No?+>b2r+>Pbr@W$!)-Z3@0AM.J2F`):K
%15is/g)tn1*A>0+C]5)+=ANG$4R>;67sB;+>P&p2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or
1,U1`DJUFC/gh)8%15is/g)tn1*A>0+C]5)+=AdODfor>-OgDX67sB;+>P&p2'?@GC`k*C@;TR'
%15is/g)tn1*A>0+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2BZIHC`k)Q%13OO:-pQU1a"Or
1,^7aDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Pht@W$!)-S?bU$4R>;67sB;+>P&p2BZIHC`k)X
@rHL-F=.M):-pQU1a"Or1,^7aDJUFCDIIBn-OgDX67sB;+>P&p2BZIHC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Or1,g=bDJUFC-OgCl$;No?+>b2r+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>2
+C]5)+=Ach%13OO:-pQU1a"Or1,g=bDJUFC/n8gBDKI68$;No?+>b2r+>Pku@W$!)-Z3@0AL@oo
:-pQU1a"Or1,g=bDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Po!@W$!)-RT?1%15is/g)tn1*A>3
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p3$;[JC`k)X-OgCl$;No?+>b2r+>Po!@W$!)-SAnI
F`):K%15is/g)tn1*A>3+C]5)+=D&8D.P(($;No?+>b2r+>Po!@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1E\G-+C]5)+=ANG$4R>;67sB;+>Y,q0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,0n\
DJUFC/gh)8%15is/g)tn1E\G-+C]5)+=AdODfor>-OgDX67sB;+>Y,q0d'qCC`k*C@;TR'%15is
/g)tn1E\G-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1*C%DC`k)Q%13OO:-pQU1a"Rs1,9t]
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>P\p@W$!)-S?bU$4R>;67sB;+>Y,q1*C%DC`k)X@rHL-
F=.M):-pQU1a"Rs1,9t]DJUFCDIIBn-OgDX67sB;+>Y,q1*C%DC`k*C@;TR.@rHL-F=.M):-pQU
1a"Rs1,C%^DJUFC-OgCl$;No?+>b2s+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G/+C]5)
+=Ach%13OO:-pQU1a"Rs1,C%^DJUFC/n8gBDKI68$;No?+>b2s+>P_q@W$!)-Z3@0AL@oo:-pQU
1a"Rs1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-RT?1%15is/g)tn1E\G0+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q1a$7FC`k)X-OgCl$;No?+>b2s+>Pbr@W$!)-SAnIF`):K
%15is/g)tn1E\G0+C]5)+=D&8D.P(($;No?+>b2s+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1E\G1+C]5)+=ANG$4R>;67sB;+>Y,q2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,U1`DJUFC
/gh)8%15is/g)tn1E\G1+C]5)+=AdODfor>-OgDX67sB;+>Y,q2'?@GC`k*C@;TR'%15is/g)tn
1E\G1+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q2BZIHC`k)Q%13OO:-pQU1a"Rs1,^7aDJUFC
/gh)8-t7(1+=Ach.3L3'+>b2s+>Pht@W$!)-S?bU$4R>;67sB;+>Y,q2BZIHC`k)X@rHL-F=.M)
:-pQU1a"Rs1,^7aDJUFCDIIBn-OgDX67sB;+>Y,q2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs
1,g=bDJUFC-OgCl$;No?+>b2s+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G3+C]5)+=Ach
%13OO:-pQU1a"Rs1,g=bDJUFC/n8gBDKI68$;No?+>b2s+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Rs
1,g=bDJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Po!@W$!)-RT?1%15is/g)tn1E\G4+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Y,q3$;[JC`k)X-OgCl$;No?+>b2s+>Po!@W$!)-SAnIF`):K%15is
/g)tn1E\G4+C]5)+=D&8D.P(($;No?+>b2s+>Po!@W$!)-Z3@0AM.J2F`):K%13OO%15is/g)`m
<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6$$m]CLoLd3F?65Cf>1hCLo1S:-pQ_@W$!\D/X3$0JO\l/M/(n@W$!2+Co2-E,8s.
+E1b!CG0.*@r$4++Cno&ATKI5$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR
<%i?)F*)/8A2#\b%15is/g)8G$;No?+CfG'@<?'k3Zp130fa)ZE\]BZ$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1
Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE
3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm
@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7F`M%9G@_n1
@<Q3)F)Po,+C\bhCNXT;%16Ze+E1b!CLeQ0A8,Oq%16Ze+E1b!CLeQ0A8,Oq%13OO:-pQU;eU)n
+D#D!ARo=_A0>>i@r$4++Cno&ATKIH<+oiaAKYMlFCfM9GA1l0+CT5.ARTTg$;No?+CT=6H=_,8
+Cno&ATJu.DBNk6A7]d(@UWb^F`;CS+B*2qATVX'ATJtd+C]&&@<-'nEt&IO67sBjBOPdkAKZ&4
+Dl72BHVD1@<<W.@<?($+Eh=:F(oQ1F!+t$DJjB7+ED%%A0;<g:-pQUDerrqEZeh*DIIR"ATKIH
8T#YmBOQ!*@psFi+DG_7FCelk+E(j7@3B)hFCbmg:-pQU@;[3!EcQ)=+Dk\2F(&]m+EqO9C`m1u
+Co2-E,8s.ARmD&$>"6#0f1"^DJUFC/gh)8%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&B4Z0Q
Bk)6rG]Zl$Deio<0MXqe.VE=76tp.QAU&;qD/X3$0JFVk/M/)ZCi"68FE1f3AKWC6ATT@DA8,Oq
Bl@ltEd8dLAU&<</e&._67r]S:-pQU<+oue+EV19F<G:6Cisf@Eaa'$F!,OBD.Oh6FD56#AU,k:
Df6gB.!R0`@<-"'D.RU,+Cf>#ATJu4Ado)B67sB/B4Z06+EqL1DBNP&FCSuuDJ()6BOr;/A8,Oq
Bl@ltEd8cMA8bt#D.RU,/g+,,AKYMt@ruF'DIIR2%15is/g+\C@s)X"DKI"8F!+m6F(oN)Ch4`!
C`mY.+C]V<ATKI5$;No?%15is/g+,,ATME*@rGmhF!,")EbT].+D,Y4D'3b=BOu3,-td+5.3NPJ
FD5Z2F"SS,+Cf>4Ch+YsA7QfmDe*Dg$;No?+EVNE,'%7-F_kK,BmO>7+EV:2F!)T7F`\a7F!,R<
ATME*@<,p%@;Ka&BOPpuCh7[/+DGpFF!)TCDfcEq:-pQUGAhMDBHV#2/e&._67r]S:-pQU@<6L4
D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9%15is/g)8Z+<VeIAS5Nr
-Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8C2[W:0II;::-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fa)ZE\TE\$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,
F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe9
5s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)
Bk)6->9G^EDe't<-OgCl$;No?+CT)&+EV:.F(HJ+ATVEqATJu,ATT&:BOr<-@;TQuA8,OqBl@lt
Ed8dLAU&;+$>"6#2'?OCF<DqY%16Ze+>k9#+D58-+=ANG$>"6#2'=h#0d(+?F<DqY%16Ze+>k9#
+>=pNATT%B-OgCl$>sEq+>k9#+>P'PATT%B-QjO,67sC$ATW'8DK?q3EcQ)=%16uaEZd4^?T0)M
B4Z0--RT?1DImi22'=h#1E^=AF<DqY%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*
+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,Ci<`mFCfN8
0eb:lBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>5I'A8,OqBl@ltEd8dL/M/)]Ddd0!0eb;++>RhF+E):2
ATAo3Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-WG%15is/e&._67sC(ATD6gFD5SQ+CT>4F_t]2
+=M>CF*)/8A2,bl.3NGF@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE:2b;eD.7's+>Gl:3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z
/ibO@.h)h\67sB83,`;K0ea_mE+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'
AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq0edi83ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1
-Zip@FD>`)0eb:8-OgCl$;No?+E)41DBL?LA8,Oq0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRX
Eb'56GA2/4Dfp.EA7]@eDJ=!$%16Ze+E(d5FC])qF>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru
0JP7G,CM1TDJU[J.=6IqA8Z32-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<Ve%67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXT
B4hY\ATAnL+E(d5FC])qF>5Io%13OO:-pQUDfB9*+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&
GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,
@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//
F)rI7Bk/?8+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuX
EZf=0@r#TtFC])qF>5I'GRXuh$;No?+EMXCEb-A;DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67F
G^+HB$4R>;67sC$AT23hFCf!!Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s
0f'q5+=ARa/g<"mGpsjf/g_qn+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh
+EM47GApu3F!*.Z0ea_hF`\`S0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/
+>=om0Hb=WF<Dtd+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF
+=JufEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpn
AKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$
@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZ
GRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4K
Dg-//F)rHX+>GPmE-67F-oW8hAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z
0ea_hF`\`S3$<6QDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)%15is/g,4KDg*=7Bk)7!Df0!(Gp%0M
@<?Q"$9ieh+EM47GApu3F!,"-A0?=D0F\?u$;No?+DG_7ATDl8FCfN8+EqaEA0>DoF(96)E-,f4
DK?pKAU&<;ASl!$F`V+:De:,2F`\a9Df'?"DIal'ATD?2%15:G/heD-+E2IF+=MXjA8Z3+-RU>c
/1r&--Zip@F>5I'+Dl%;AKYi$@;]dsB5D.#F!,R9F*&O8ATM@%BlJ0.Df0V=De:,#G%G]&B4W3%
ASu.&BI=5r%15is/g,4KDg*=7Bk)7!Df0!(Gp%0M@<?Q"$>"6#A8,QsINU<R$4R>;67sBjCi=B+
+=M>BBk)6>0JI`#+Co1rFD5Z2@<-W9@;]Tu@r,^bDBO(@%16Ze+>Y-YA0<6I%13OO:-pQU<(0_b
+B)9-6UapP7TE+k$4R>REb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F<4&E-67s@<cZuD.QX_Deio<0MXqe.WBNP9jr9a@;TRSD/X3$0JFVk/M/)e
ATMr99gMlV5tscjCh7KsFD)e,BOt[h/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf
+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9/Kf+GAKZ)+F*&O7Eb/[$ATVL)FC])qFD5Z2@<-'nEt&IO
67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?+<VdL
+<VdL+<VdZ/hSac$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JPS)@<+(^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUFEMVA+F.C4D.R`1Df-[,$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-Ta$l$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8
C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$>"6#A8lU$F<Dr/76s=C;FshV-OgCl$;No?
+DkP&AKYl!D.Oi3Df6b7Df021@;]Tu@<6L(B5Si$DeF36+Eh10F_)!h@VKIkGs+22-Xpe&CjBo,
D.P(G9gMlV5tsdT@;9^k?R$ps-OgD2@VKIkGptm;+DEGN1*A=]$4R>;67sBhFED)2E-*4ED]j"A
F<E.XF(fK7Ch+Z#@;0Ne$>sEq+EVI>Ci<f+E-67F@VKIkGp!P'%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,                                                                ~>
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
0etF*0esk-+>G_r1*AD11cQU50H`+n1c@*I+>PVn1*A;*3&2U20H`+n1,(F?3?U%4+>P&q0f:m4
2]sju2E3T;0f1".+?;;6+>GPm1*AJ71GBq+0d&4o0f1X?+>Gl!1*AG62'=V4+>P&o1H%$32BXat
0eb=;8l%iA<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU1,9tH@<*JG0JPR10fM-K1HI?H$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI3L
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU
1-$IO@<itN0JPR10fD'L0KM$K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp16+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!D$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp17+<X'\FCdKU1,g=AF_;gP0JPR10ek^F0fh*N$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=AF_;gP
0JPR10etdE1cd?L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqh2]tD/B-8r`0f^@21-.0G3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp1<+@1-_+>PW*3?U%43\rZT1H5^K$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pr"6$6f_1,(FC+>GZ51bq*J2@9cu
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP
0JPR10f1pI2EEWO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp='+@KX[ANCqf1E]J'F<E=m0f^@13BB#X3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>GSn:2b:u1,(FC
+>GT30fM-K3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='
+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K1HI?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K3BAiS$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<0JPR1
0f(jJ1HI3G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.4
+<X'\FCdKU0JXb=ARci<0JPR10f1pI0KLpG$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0Jah>ARci<0JPR1
0ebXD2``ZQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.7
+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0Jjn?ARci<0JPR10f1pG2**KK$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR1
0KD0L3'&lN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.:
+<X'\FCdKU0Jst@ARci<0JPR10etdI2``WI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0Jst@ARci<0JPR10f1pF1-.-L$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0K(%AARci<0JPR1
0ebXG3BAiK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14
+<X'\FCdKU0K(%AARci<0JPR10ek^G0KLmI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0K(%AARci<0JPR10f(jF1HI3H$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<0JPR1
0f1pJ0KLpK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17
+<X'\FCdKU0K(%AARci<0JPR10f1pJ0fh$C$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+BARci<0JPR1
0f(jI0fh$I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:
+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"
EZd+k0f^@22``]M3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI6E$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc8
1b^sI3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3]&Mt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU
1,g=AF_;gP0JPR10etdE1cd?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*
3?U%43\rZT1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp1<+@1-_+>PW*3?U%43]&TQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1H,XJ$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4+AZKh
+>PW*3?U"93]/oY2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+?(Dc6t(1K3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS
1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe
6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=
ARci<0JPR10f(jJ1HI3H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%5
3]&iX1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>G\q+@KX[ANCqf1E](s@j!N\0f^@20KLsJ3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lV$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A
+>>Vp6tKjN1,(FC+>G]60f;!I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1boCF$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u@j!N\
0f^@21-.9O3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.;+<X'\FCdKU0Jst@ARci<0JPR10f1pF1-.-M$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo
6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WDu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%A
ARci<0JPR10f1pJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1a!o/@<?'A+>>\r6tKjN1,(FC+>G]61bh$G0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%2
3]/ZR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pht+@KX[ANCqf2]tM"@j!N\0f^@21HI?I3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$=\-l
Ch.:!A7TCqFE2))F`_>9DDEqA67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-
FE2))F`_>9DBND2Bl%<4%13OO:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!a
F`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&
3B9)I+BosuDe3rtF(HIV-UC$aC2[WlF_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'
DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=
A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2
FD5Q*FD5<-+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$
A86$n-OgCl$;No?+EM+9+Co2-FE2))F`_>9DBNJ(Eb/a&DfTQ'Et&IkA7TCp4ZX]58l%iR<'a#C
6qL9!8l%iF8Q8)L;BSS-6rQl];F<lO<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA
;C;n\C1LjhE]lH+C1LjhEZcnU-Ql#W6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$[':IJ,K;Fs\a6qL9!
8l%iD=B&3e8Q$oY%14LuA7TCp.6T^7F(KH&F_PZ&A8-(*+>=63%15is/g+e<DImisFCcS*BleB:
Bju4,Bl@l3F(96)E--.1$?^;u@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2
F(Jl)8l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_
<_Yt)@WcC$A86$nFDl)6F(9-*E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a
6qL8c$;+)^<_Yt)F`:l"FCf3*A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL8c$;+)^
<_Yt)F`:l"FCf3*A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)
A0=K?6rR&N7n#g;;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO
:-pQUA7]h(Ec64G@WcC$A0>],@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eODe*="Bl%<?3B:FU$4R=O$>=-pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#
F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen3+>"^(ARf:g@V'R&
2_6(,0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$8l%htAn>Cm
F`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];
+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!
DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELj.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8
F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7
@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.
+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\Z
ATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+
<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9
BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--
ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%
+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:
+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_
F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9
DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+
F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"
Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"
DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,
ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0
A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9
D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14
DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s
=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo
+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+
C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5
Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+
Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B
+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:D
BOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:Wne
DBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4
G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(
7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*t
F!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4
/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB
=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk
+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*Wp
ARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0D
E`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7
@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst
05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8
Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCi
ARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#
+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL
:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q
@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL
+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<
FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(
G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>
F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(
G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8
Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL
+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8
+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=L
DfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&
@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9
BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)
Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPp
Bln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>
DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6s
BkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,
+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g
.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?
/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB
?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1B
GA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8
/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#
+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^E
A7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5
F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+
BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("
@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7B
FD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In
6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKT
AKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&
De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&
EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us
+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%
0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_
+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIj
A0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J8
3aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6
GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&
ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%
De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-
+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-
+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!
%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWp
ATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs
%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n
-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7
@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_
0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-pp
Df[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.
@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4
F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjb
A8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!
A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>
@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045
EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^
+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7
ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(
ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'
+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu
@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FB
F<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b
+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8
BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>X
H$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7
F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^
?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;
7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu
;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+
@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0
F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o
+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#
+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJF
Bkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_
?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSek
Df-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL
+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL
+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE
:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&
FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4
?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(
F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*
F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>
AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)
@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f
7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/
@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B
-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU
F(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f
7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%
+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO
+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFb
ARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&
A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4
+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlot
DBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm
3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UE
A79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%
+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*
1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*
+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.A
DBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9
/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1
F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^k
DIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa
@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g
$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"
+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)
ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3
AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*
@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^E
E-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\
/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#
BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#
+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i
$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e
,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G
0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:
@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c
+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^
Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO
+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:
Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1
Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@
F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF
%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>
DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMID
EarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL
+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#
+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud
+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[Wn
De!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeK
BOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL
8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1r
FD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2
Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8
@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'
Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAk
E-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e
$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&
.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=
BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"A
A8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'
@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[
+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,
EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs
+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10
DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWC
H#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#
+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"
A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9
FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+
A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#
=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloq
Ec5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/
Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD
2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9
+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i
$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&
Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh
+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF
+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u
+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns
:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:
F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e
,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u
+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F
@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1
ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.
ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT5
6WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=
@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lq
A0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:
Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgF
De*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4
%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e
+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0
$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ
6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(
E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#g
F!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd
+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/
Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgr
Df0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj
/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.
F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc
9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU
@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2
A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.
Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cp
FDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:
AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3Arg
Ble6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9
+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"
@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,Lo
Eb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<
2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^H
Df0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%
+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;
%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTu
FD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-
@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2
ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/
A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopn
AKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a
+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]t
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'
C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9
F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#
+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"
+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2
@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2
@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9
$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-
+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,
@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaE
A9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;
AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a
:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"
DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,
Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6
A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,
AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:
EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7
D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F
0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??
Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-
Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,
ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1
@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0
De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ
0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o
+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1
A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/
+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.
+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-Mm
DK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//Kdbr
Gp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU
/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSH
A8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/
F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3l
AKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=
Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9
FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlot
DBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2
BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rt
DK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.
E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;r
DfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-
+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$
IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbq
Eb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$g
F<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7s
D]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3
A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-
+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;
GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`Amogu
F<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@
@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6
%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!
Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LN
Bl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4
@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=
F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO
,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c
?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-
/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!
Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+G
A8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::
0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-
+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-
D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*
$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)
3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-
FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5
?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@
Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1
DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0A
F'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@
@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(
@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LG
Bl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6
FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'
F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^
?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k
+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL
7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF
$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7
Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs
@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`-$6pc?+>GK&/heD"+@KdNASkmfEZd:l+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/
%13OO+<W-V?t*b[FC65#@:O(qE$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6pc?+>>E./ibpP+>"^%
F_>i<F<E>!/0H]%0f][M%144#.NinGEcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s
$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>
G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@
+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#
C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W
/hf47/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79Rk
A.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9m
F`(i#EbSs"+CT5.ASu$mGV0F4%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;
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
A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[X%Eb02F0ht%f.V`m4E,oN/+EK+d+A,Et+E2@4E,ol,
ATMp2EZfF5EbTK7/e&._67r]S:-pQU;flGiASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/ARfk)
ARlomAS,k$AKXT@6m-2b+Dbt)A7]:(%13OO:-pQUFDl+@Ch7d$C`m;0Ec5t@FE1f/+D,P4+Cf>1
AKXT@6m-\lEb'56%16igA92?iBkhQs?Q_Km+>>!H+?L\n8l%ht;d!$u784mo5tOaM;FNVhCghC,
+A*bfEcQ)=+>#c"-R)n?/0J.X+>GYq3\`B4-RU*F+Boso%13OOC2[X(H#n(=D/`p*BO?'m4ZYAA
3Zp*c$4R>;67sa&De*p7F*(u1E+*j%+Ef=g+E1b2BHV5*+A,Et+EMgLFCf;3/Kc\hFCfK0Bl7@$
ARmD&$;No?%15is/g*o-FCdKUG%#3$A0>K&EZdss2D-[<+CT.u+CS_tG%E98$;No?%15is/g,"L
DII':+<YE;A93$;FCf<.@<?0*@r+tRBl%>i$;No?%15is/g)8ZC2[X(H#n(=D/`p*BHS[;D..L-
ATB.-$4R>;67sBkAS,XoARloU+EMgLFCf;3Ci<flFD5Z2%14LuE+*j%+=DVHA7TUrF"_0;DImis
CbKOAA1o;Z/9r?I$7QDk%16T`@r,RpF!)i=C2[W1%15^%5uU`O;E[&`C2[X(H#n(=D/`p*BHS[;
D..L-ATB.@+<VdL+<VdL:-pQUA7]@]F_l.BD..L-ATAnA.P>FMAgnj7Bl%>i$;+)^:f:(Y4ZX^#
De*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-QjO,67sBkAS,@nCige=Ec5Q(Ch4`1@rc:&F:ARl
De*g-C/o=dEbf63F##UJ67sC'F(KB-AU/>L@qK?_$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`
C3+<*FE_/6AM.J2D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*X
FDs8o05>QHAor6*Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2AM81I
ATDQtH#kTJE,Z6n:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.
IUQbtDf0VLB45XgF"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT
@WHC2F(J]n?RKN/FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7
-OgDX67r]S:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;
:-pQU,"=L8%15is/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA
%15is/e&._67sBU:K0bD+Cf>-G&M2>FCeu*-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-Qli@
DeWa'+E_a:+E(j7-T`[u@q]:k@:OCjEX`?b$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("
@;IT3De(4<>9Is'+=CW@Bl%<pDe*BmF*)G:@Wcd,Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<F
F<EqnEcP`/F?=DO+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i(Q>9G^EDe't<-OgDMFE21J
;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@
B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlW
F=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEDB<Ecl7B-RT?17Q*=_4&fd4
F<FM!DeioGEccCG-Xp_"FAm$pCLo1R-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m
+EV19F=1gAA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5
%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:
D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*
E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)
Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)
+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is
/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et
+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DL
Eb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4F
Eb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86
DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2
@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%
DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\
+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/
F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFq
Bl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4H
F<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IH
BO>L]4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).
@;[3+DIjq_:IH=>DKBo.DI[5e$;No?+Dl7;FD5]1AKXT@6m-2]F*(i.@qB^(@<,p%E+O',BlnH.
A0>?(F<GI>F<GU8@rH4$ASu$iA.8lVE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:Njk
Ci<flCh4_@+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!Tl
F)rHOBkhQs-OgCl$;No?+E)F7EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(t
FDl1B/Kf1WAKYT-Cht55@<?/l$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0
F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-
7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->
3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQU
F`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$;No?
+BM*&;FNlG8Nf*W-YRF8AL@oo%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV
6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O
+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9F=.M):J48O:IHlj4ZX].-Z3iF
D..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7
Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=n
E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA
?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y
:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"
B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3M
AU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+
8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:
Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+
8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2
FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7
Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.
+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT
/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQU
B4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)
+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><
ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!QQF*22=ATJu.
DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A-?<[@D[d$_$;No?
+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1
FE7luEcaH*+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$
+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]
4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6>n%,M$;No?+EM47
Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdL
BQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'0ea_`EZd%Y+AP6U
+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$I
D_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=
G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk%15is/g,4H@<,jk
+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;
-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#
Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL
+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?
@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD
/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCI
FEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O
:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$
Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"
B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#p
GWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>Ble59Gp$X9/g,4O
+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;
67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t
1E\_$0F\A'AhG38@:XCg?X[\fA7$Hs4Y@jtAThu7-RU$ID_</M+ED%8F`M@P+D#G$/e&.9DCdD]
.3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4`+/q#?i%14Nn$4R>;67sBo@;]V$+Cf41A8bs#BOu"!
ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$
6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>c
A8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1
Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=
@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(FCSumEcXB)><3le+Z_P)-S$\t.k<,#.k?!!
-R)n?>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6
%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!
A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3A
GB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk1
4?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p
%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQU
Eb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*
Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY
3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot
+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+
ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.
A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4
.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g
,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;
67sBmATVEq+D#(tF<G[:G]YTU@:O=rF!+n/A0><%F)PQ&@<?''@rGmh%173!4ZZjk4!80X%16ro
4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gk
D.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD/h^">p)3O1GC"[+?L]YF<D\K:-pQU
.P>d^C^g_gGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIa
F<G[:G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAF
FCf<.0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19
Df$V3+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5
BlJ/:Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2.6qWi%13OO:-pQUCi<`m+DN$?@rc:&F<G19
Df$V,Df00$B6A6+A0>V0E+*j%%16ih4ZX]i3Zp+"3\V[\3ZpO-C2dU'BFP:X$;No?+Du==@V'R&
De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6
/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUGA(Q.AKYDu+A!\uF(Jl)@X0);Df'&.
D.-ppDf[%E@;L'tF!)iSDfTV@+E)9C-YRF8AL@oo:-pQU=%GbX76sX>4ZX]5GAhM;-OgCl$;No?
+CoV3E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is
/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-pp
D]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?
+@K4(:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*+
+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K
6W6-/+?MV3-OgCl$;No?+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3l
AKVEh@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^F
F!*%WF(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1
@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'
A7]9oA8-+(CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-I
B4PRs+EMCBB-;>=Bl%i<+BosE+E(d5-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE
+E(d5-RT?1D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP
@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/heD"+Co&,-OgDP:J=/F;E[&gB4YslEa`c;
C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u
$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2
De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2A
DffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKi
AU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B
%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<
@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!
D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2
+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#
A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:Wne
DD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7
$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,
Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,
Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%ht
Cggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq
+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-
F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7
B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ,
%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\
4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Aiq3A*<P3%#.B7Sc]G78c90-YI".ATD3q
05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8X.1HV^78--9
;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5
.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3
AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'
3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t
$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP
:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70J5%%/KeS8Fsd_+
7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#
9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKiA7]p:
Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU383[Z9a
$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(
Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p
/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9
@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u
+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l
+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"
ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5
+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]
EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.
@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#+F[a0
A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.
Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1
F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`
D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIjB5_g9
/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3+E_a:
+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;
C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J
+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7
E+*Bj0+A7;%17&pC2.Zt1,2Nj/h1g\C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JGEp$;No?
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU1,(C@De!lD2]uO>A7]9oH=gl-ATJ:f:-pQU1,(CADe!lD0d'n8
A7]9o5uU-B8N8RMA9Da.Et&IO67sB90JGJ)@rsF^+DG_7ATDm(A0=0:6V0j/2'?sOFED57B-:o+
FDi::De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU1,(FCA7]7)2B[$OGB.D>FCf>4AoD]4
8g$,H0JO[Z$4R>OA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F++=ATh-YdR1
A7]p,C2[W*F`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?+CfP7Eb0-1+EqaE
CM@[!+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%16igA7o7`C2[Wi4Y@j)C2[X(FDl22-OgCl$;No?
+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@Ec>N)
@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-+FPjb
B6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt-Qij*%15is
/g,+UF>%lZAS)AY6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+>=p!+>=63F)>i<FDuAE+E2?D-[U;;
IXNRQ$>"6dF(HIAH[\_=I4#I2-mrFN/8B*6B4#@fDe*3(+D58-+=DMb:4@U=%14Nn$4R>;67sC%
ATT%e:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m+EVNE@:OCnG%#K(%17/nDfp/@F`\`R
F`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=CoBA8lR(<HD_lCLqd4
-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+=BcW6m-GhDe`in
F<GX9FEMOM%13                                                             ~>
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
zz=:zz,'table appwords backupdates badcn bchecknames bgetdicdoc bgetexplain'
zz=:zz,' bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit checkback'
zz=:zz,' checkntstamp checkopen checkpath checkput closedict createst defwo'
zz=:zz,'rds delstuff delwordrefs didstats dnlsearch dupnames freedisk freed'
zz=:zz,'isklinux freediskmac freediskwin fullmonty getdicdoc getdocument ge'
zz=:zz,'texplain getgstext getntstamp getobjects getrefs gslistnl inputdict'
zz=:zz,' invappend invdelete invfetch invreplace islib iswriteable iswritea'
zz=:zz,'blelinux iswriteablewin jdatcreate jwordscreate loadalldirs loadall'
zz=:zz,'refs loadwords mainddir mnlsearch newdparms newregdict nlctn nlpfx '
zz=:zz,'nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc '
zz=:zz,'putexplain putgs putntstamp puttable puttexts putwords putwordxrs r'
zz=:zz,'pdtrim rplctable rplcwords sortdnub splitbname''                    '
zz=:3129{.zz
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
:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)9gMlV5tscj@:FC&@UWb^
DKTe=@UWb^F`:l"FCfM9@Uj(_@r#sjD.Rc2@V97o+C\tpFC])qA8bs#@V97oA8bt#D.RU,+C\tp
FCf]9Cgh$q+C\tpFD#Z:AU&;>@V97oDdmHm@ruc7@V9auBleA=@W$!)@W$"'ARTUhBHUc'@<?1(
Ap>G-FCf]=Ch[u6@WcC$A86$n@rH4'Eb0<5ARlonBOt[h@UWb^+D#(+Eb0&u@<6!pDe'u3E,961
@W#UkAKZ)9FCB$*+EV[H@;Ts=-RgSp4?P\X?SNZN+C\tpFAm$pCLo1R+C]5)6=FqL@k]V[@W$!\
D/X3$0JFVYDJW6gDeio<0d(+?F@9hQFCf]=;f-GgAM>e\Ci<`mFCfN80eb:lBk)7!Df0!(Gp%'K
FA61gDIIBn;f-GgAM>ec.4cl04?G0&0d%hdC2[W*C2[X(FDl22-RgSp4=iTBC2[X(D/X3$FCfN8
F!iCf-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,OF_PZ&C2[Wn
BleB:Bju4,Bl@l3BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*E,oN/+DPh*E,o\nF(KB-AU/>>
C2[X%Ec5Q(Ch4`+@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'
+E2@9C2[W1.4cl01*AA.,Vh&.3AE9C1+kCC2DR$H0KD!51,(FC0JbI>/i5FB1,:jF1cHO40JPRB
1,(I92)@6L2DI3L2'=Y.0f^sD0Jb==2`<ZU2)RB:1,(FC0JbF?/iP^I2)6pE2E;m80JPRA1GL^=
2`EWP1,:^F3?U(20f^pD0f1LA2`<NK1,UsM+>PW*3A<6D1bL^G2Dm6L0eb=)1,(FC0JbF?/iP^I
2)6pI1,g=20JPRA1GLjA2*!TO2)R3K1E\G,0f^sD0K(O@3AE9H1,(C<+>PW*3A<6E0eP:>2D?g>
2`W];1,(FC0JbI>/i5LA0K1mH2)ud70JPRB0etaA2DI3H2DmKL2BXb/0f^pD0f:R@1GUmI3A<6L
+>PW*3A<6D2(gaG1GgdD2_[!01,(FC0JbF@/i>UG3&<9K1,pC30JPRA1GLa>2)mEI2)I'I0d&5*
0f^pD0f:R@3&`cV0JkaH+>PW*3A<6D2(gaG0f:jD3&E?41,(FC0JbF@/i>XC2`*EL0d&5*0f^pD
1,:I=3ArZQ3&!'A+>PW*3A<6D2(gaC3AENO3&io@1,(FC0etF?/i>@@0fV-J0fL410JPRB1,(X>
2)R<K3&ETN2]sk00f^pI1,ggC0KCpH2Dd3I+>PW*3A<6D2(gaC2D?mC3A`H51,(FC0eb:>/i>F=
1cR6F0fL410JPRB0etaA2DmHS1Gh$J2]sk00f^sC1-$sF1c79L1,gpJ+>PW*3A<6E1+kC>1H.9R
0fM*81,(FC0JbI>/i5=D3&NNN1GL"-0JPRB1,(I91cRBK1,gmI2'=Y.0f^pD1,:I=2)I'D3ANEM
+>PW*3AE9C1+kF?3A`WK3AiZ:1,(FC0etF=/i>RG3B/lR3?U(20f^sD0K1UA3&*-I1H79N+>PW*
3AE9C2_HsI0ekXD3&WZ;1,(FC0etFA/i>UC0fUsK2Du[50JPRB1,(X>2)m<F3&r`R1*A>+0f^sD
0K1UA3&*-I1c%-O+>PW*3A<6D3%d*H1GUXD2*!W=1,(FC0etFA/i5CC3&*BM0f^@30JPRA1GU[;
1c.*L2)mNK1*A>+0f^pD1,:I>1H@EO2`NTO+>PW*3AE9C1+kI>1bgsK2`3H81,(FC0etF@/i5FE
0K1dC2`2^50JPRB1,(X>2)[EM3B8lM3$9t10f^sD0JY7<3A`WN3&39E+>PW*3AE9C2_HsG2E*BF
2`<N91,(FC0etF@/i57=2`NZN1c?I30JPRB1,(X>2)[BM0JP@D0d&5*0f^sD0JY7=0JP7;3&ioY
+>PW*3A<6E1+kCD2D[<P0JP:)1,(FC0etF=/i5:B0ekIE2E;m80JPRB1,(R<2).'H1c@'D1E\G,
0f^sD0K1UA2_[0I1cRKP+>PW*3A<EJ2_HsA3AWNN1c%!31,(FC0JbF@/i>O@1,:U>1bg+.0JPRB
0JGC;2)?pC3&33C2]sk00f^sC1-$sF2E!QR3&`QK+>PW*3AE6D3A*3H2*!HJ2_d<81,(FC0etF?
/i>OA1cI*F1bp1/0JPRA1GU^<1bq'N2)I3I0e"Y%4>J$<,Vh&.3AE9C1bLUC1GL^A2`*631,(FC
0JbI>/i>FB1c[6K1a"P-0f^sD0Jb=<1GUdE1c%'I+>PW*3A<6E1+kFA0JPIC2)R971,(FC0JbF@
/iGOB0f(O<1-$I40JPRA3&3KH2)R*B1-%$B1a"P-0f^pD0fUdD2DI*E1,UpL+>PW*3AE9C2D-jD
3&N]O0f_6:1,(FC0JbI>/i>FE1-%<O0fL410JPRB1,(L:1c$mD2)I*J1a"P-0f^pD1,:I>2)6j@
3AN<H+>PW*3A<6D2(gdD2E<NL1H.371,(FC0K:gJ/i>L@0JYXB0Jjn-0JPRA1GLjA2E*<E3B8cO
1FXk'4>J$7,Vh&.3A<EJ2_HpG1,:gK1GU^.1,(FC0JbF@/i>ID1c%-I0JO\*0JPRA3&3EF1cI0F
3&i]L1*A>+0f^sD0K1UA2E3TT0f(XB.4cl01,(FC0JbI>/i>LA2`EQQ3Ai<H3&*$G0f:gJ2D@$H
2)$^E2_&Mo1*A;#/1<V9+>GVs1,(FC0JbF?/iP^I2)7*N0f:(/0JPRA1GL^=2`EWP1,h3J2'=Y.
0f^sC0ek:;2_[$B2DI*L+>PW*3A<6D3%d'K2_[!F0Jt[01,(FC0K:gJ/iGCB0ebUH1c-=10JPRA
3&3EF1c76K0etaG+>PW*3AE9C2D-gG1H%$G1c7371,(FC0JbF@/i,IE3AiZN1,g=20JPRA1GL^=
2`EWP1,:dF1a"P-0f^pD0f1LA2`<NK1,h$H+>PW*3A<6D1bL^G2Dm6F2`*?61,(FC0etF@/i5RJ
3&!<I2DlU40JPRB1,(X>2)m<F3&r]I2]sk00f^sD0K1UA3&*-J0JG4:+>PW*3AE6C0eP:A0JbFA
0fD!61,(FC0etFA/i5IA1,CU@3Ar!80JPRB1,(X>1c70L1Gq*G2]sk00f^pI1,ggC0K(mK1GUgB
+>PW*3AE9C2D-jA2E3KI0K1s61,(FC0JbFD/i5CF2*!WM2E)a60JPRB1,(X>2)m<F3&EBG1E\G,
0f^sD0K1UA3&*-I1bpgB+>PW*3AE9C2_HsI0ekXE1,:X.1,(FC0etF@/i>=C2`WQH2DZd5-p014
/1<V7.4cl00I\P$4>8384>6                                                   ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
