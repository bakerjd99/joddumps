NB. JOD dictionary dump: 09 Dec 2019 11:02:22
NB. Generated with JOD version; 1.0.0; 32; 09 Dec 2019 09:24:19
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

JODTOOLSVMD=:'1.0.0';32;'09 Dec 2019 09:24:20'

JODVMD=:'1.0.0';32;'09 Dec 2019 09:24:19'

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
2DlU:+>P&o0d&D62`;d50H`,+3B/-90H`)*1,C[.0ea_11,pC:+>Pi32BX_5+>GT*3?U(3+>PW-
1E\D2+?2;;@V97o;f-GgAM>f567s`sB4Z0`D/X3$0JFVk/M/(n@V97o.3N&>B6A'&DKI"BD/X3$
+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!
Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b
%15is/e&._67sB'+>PAg-u*[2FCfN8ATB4BBlbD*+Dbt)A0>r'EbTK7%15is/g)8G$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f`cU@k]_K$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1
Eb0-1+=CW,F(H^.$4R>;67sBt@;BEsC2[X)ATMs)EZet7Df$Uh:IH=9BleB:Bju4,Bl@l3A8,Oq
Bl@ltEbT*+%15is/e&._67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU
+<YN;F!)iFDe*s$F*(u6-OgE!Ddd0!-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.Ddd0TD/X3$
-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$
.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&+AP6U+?M;#+AP6U+F.C4D.R`1Df-[,$4R>aA8,Oq4ZX]5FCfN8C2[W:
0II;:%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!
3^>)V-7:/g-RgJR$;No?%15is/g*nU/g+e<DImisFCcS'Cht55Df]u6@VfTuG%#3$A0<:0B4Z06
+CT;'F_t]-F<GO2FED)7DK?6o:-pQB$;No?+DPe(4ZX]]6:s[6<),ef@;9^k?S"T:6W?WQ:-hc\
?X[\fA7$H%%15is/e&._67sBU67sC(@;KXg+DbV$F<DuV.3N&>B6A'&DKKqB/KebF@r-9uBl7Q+
ASc'kARlo3GUX(/:-pQUCgh?s4ZX]64D?E%.3L/a-p/\-+DPe(.3L/a-nK]n:I7ZB6W?fJ?X[\f
A7$cI3$:41+:SZQ67r]S:-pQU:-pQUG%#3$A0>o,B4uB0.![6a@<-"'D.RU,+E1b2FCfK1Et&IO
67sBU67sB'+<VeE@;TQu+<W`g+DtV)AM.J2F`):D+?L\gCh[s4+E(j7@UWb^F`8I@@;TRs%15is
/g,1CEb@Nr+=D&8D.P(;+?L\nDIIBn/n8gBDKI6K4!5Xn@VfOj6;Cs+ATK4.$;No?%15is/g*nU
/g,=GCh[E&-t6h#F=A>@EbBN3ASuT4E+*j1ATD[0%15is/g+n;Eb@Nr+?Ui&+?Lc%+<iin/j:C4
+>=on+F>:e+<Wij-p/k"@V97o+=AT\/0IVI+>Fui+F>4Z4D\GHB.4rS+?V&lF`2A5-8%J)I6)CW
Eb?gD/0K:#Eaa!$%15is/e&._67sBU67sC)BOu'(.!R0`BlbCS+?^i88OHHK:JO2R=Wh-jGp%!5
D.Oi/@<-H4De:,0@;TR.@rHL-F<GO2FED)7DK?q/Eb-A-B5VX.ARl5W:-pQUC12-q4ZX^#@<-!'
/0H;t+C\tpF<DqY-RU8a4!5n.+C\tpF<DqY/n8gBDKI6R-QkJn-T*#UB4Z0-@VfOj6Z7*bFE8f=
$;No?%15is/g*nU/g+eIDfp#?+CT.u+EM[>FCfM9BOQ'q+CT.1@:Wn_FD5Z2@;I&r@<6!&FDi:6
ATVEq+C\bhCNXS=DIIBn+Dbb5FE7lu:-pQUC12-q4ZX^#@<-!'/0H;q+>G!JB4Z0--RWe?D.P(B
-QkJn-Scf!+C\tpF<DqYDIIBn/n8gBDKI6R-QkJn-Scf!+C\tpF<G%/@r+J,@;TRs-OgDX67sBq
@<-!D3Zr0GEb?LG+=Arf0d'q<ATT%B-Z3@0ALAiQ+?L\n1E\Cp@V97o+=AOS@;TR.@rHL-F=/F`
+?L\n1E\Cp@V97o+C].sCdLm*D.Rc9%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"
ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g
0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBlEaa$#+CT/5+C\bh
CNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD+>G!LBlY=_5tbQl
6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2D]iLt@r$4+F!*%W
AU&0*@ru9m+D#S6DfQ9oDImi2@V97o+=D&FFD,B+B.",qDImi2@V97o+?MV3FDi:CAS!4u$>sEq
+C\tpF<DrEATD?0%13OO:-pQU@rc-hFCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums
+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+
Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])q
F:AR"%15is/g,7LBl[`,DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)
A5d>`CLqU!F*',G$9g.jE+*6lA0>u)Bk)5o$4R>;67sBU67sC%Df'&.@UX=l@j#K'G%#3$A0><$
B6A'&DKKqB/KeVLE+NO$ARlopEcQ)=%16uaEZd%Y3$9mt@V97o+=DDBEbAa'Ec5i.-QjO,67sBs
BleB;+E(j7@<<W/Df^"C1*@#5DImi2@V97o+=AdM-OgE#ATAnM+C\tpF<Dq`/MSU^$>sEq+>P'K
B4Z0--S@#!%16uaEZeh(ATT%K%16uaEZeh(ATT%W-RT?1%15is/g*nU/g*b/DIIBnF!,[@FD)e.
D.7'eA7]9oCi<flCh7Z1@<,p%DJsV>Bl5%c:IH=9Bk)7!Df0!(Bk;>p$>sEq+C\tpF<DrFF'i9u
Ec5i.-OgE#ATAo&B4Z0--Y[X/?Y+ClDI6apEc5i.ATB.-$>sEq+C\tpF<DrPFD5Q-?[$O/DJ*<(
%16uaEZeh(ATT%B@4!?E+<VdL+AP6U+Du+>+CQBb+DtV)AIStU$;No?+AP6U+CT5.ASu%"+CfP7
Eb0-1+D,>.F*&O6@:O(qE$0%@D.7's+:SZO5uU`L:/t"O3ZpL=+F>5?DJUFC/ghbN$>sEq+C\tp
F<DrJH!b#hA7$]89L2TV6;CNT%16uaEZeh(ATT%BD0]Jq@UWdp/5/?.<'j>[9aqGIATAo&B4Z0-
-YddFF=(=#@<Z=+CaUc-5uU`L:/t!t$4R>;67sBpDKBr@AKZ/)EbTH7F!,C1C1UmsF!+n3AKY])
+DbJ-F<G%$@r$4+%159QHZ*F;FC])qF<Fd11E^UH+=ANG$;,G^FAQOW@q]G!4ZX^"/g)qZ$:o;W
CLqcZDfU+d3ZoeA+CoC5GA(E,+A!\dD]iM#@psM$AKXPe@;R-2BOQ!*8K_GY-OgDQDe)gkBl%Kr
BQQBu+=8^)%15gT<+09NFB2sn@Qcap.k_>=9mK0PE,95uBlmBeEah0m+>Y-$+>=63GT\LZGmt*0
%16Ze+EVI>Ci<f+E-67F4$"`]F`VY$ART(^AU,ChF`(u+GslRkGp#UqA5mbeCh[NqF<F;'<+09N
FB2sn@N\Bj7<icfBk(k!<b6;\-Qij*%15is/g,4RD.Oi2BQ%p5+EqaEA0>H.E,8s#@<?4%DK?6o
ATAnI+?1K_F`\`R8p,2s:h='FBOuH:4""HWAKZ).Bl7R)+ED%%Ci"A>C3=T>+E1n#@q^-8%16Ze
+>=ot+E2IF+=Bm/7<icfBk(k!<b6;\-T`\eG]7J5@qg$-G%G]'F!,+,F<GI>+ED%7E+NO$+D,Y4
D'3R9B6A6;F!hD(%15is/g,4RD.Oi+Df021GAhM4+D#e:Cgh3iFD5Z2Et&IBCi!0kEbeEg:i'Qc
4ZX]>+?CW!%144#@;Ka&GAhM;+CT.u+Du*?E,8s.+DkP&ATJu/@:O'q@3B*'Cht5'Dg;d!+<Y*/
C`mq?Ebce+DIal-D]j"8@<iu4@;BFq+DP=pCER%.A9D^)+C]87%144#@;Ka&GAhM;+CT.u+Du*?
E,8s.+DkP&ATJu/@:O'q@3B*'Cht5'Dg;d!+<Y*/C`mq?Ebce+DIal-D]j"8@<iu4@;BFq+DP=p
CER%.A9D^)+C]87%144#De:,%Dfp)AAKY_r@r!32@<3Q"+CoV2C`m2*Gp$O5H$<\B+EMHD@UWb^
+EVNEGAhM;+DP=pCCLV"%13OOATAnI+?:Q`F`\`R7rMp;GA1l-B4uB74$d\!=)W+p:2`sF@<i:h
ATAnI+?:Q`F`\`R9mK]H@qg$cATD6-4$d\!=)W+p:2`sF@<i:h%16'GF*(AmG]YW&3ZoelATMr9
FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&-OgD^ATMrmAU&;O
4ZX]5D/XH++EV19F<G[:G]Y'F@:WplF`(o5F_)\;D]j.8BlbD=ATMrS+=A]a3b2r8DKTf'@;9^k
?RI31$<1SXFAugrF>?!?+=C`DASrW-DfTD3FCfN8+EV1>F<GF/A7Zm+DJ=*5AKZ)5+EV:2F!,R9
F*'Gc-S-H&A8,RlF_tJoC2[Wi-RT?1ATAnJ+E2IF+=C-"F*(AmG]YVe4&fd4FAugrF>+.2ATAnJ
+E2IF+=C-"F*(AmG]YYf4&fd4FAugrF>443ATAnJ+E2IF+=C-"F*(AmG]Y\g4&fd4FAugrF>=:4
%15is/g,4RD.Oi2BQ%p5+CT.u+Dbt6B-;;-F*&O9G]7J-DIIX$Df0V*$>"6#0d&FuE-67F-WFYu
FAugrF>>4*-Z<s8DBO%4F*)IG@<,p%D/XH++ED%:ARTChDJ()6BOPd$DfB9*+Cf>#AL@ooATAnJ
+?:Q`F`\`R<+U,m<+U;r0IJqJCi!0kEbeEg:i'Qc%13OO9jqOPDcC:mF>,j=+=D#7@rcK1FCf]=
+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&-OgDW@:O=r<+U;r0g.Q?
-Z*dBAKYhu@rcK1FCf]=+DkOtAKZ,5BlS9,+EVNEFD,B0+EV19F?1Nl/0[,cBk2+(D-p^dDe*3&
-OgDoEZd1]E-67F-V\#ZEc4ogG]YVe4&eXN<*s'KDe*3:9jqOPDcC:mF>+.2ATAnM+E2IF+=Bll
@rcKeAU&;O-Tb9r=B&X9C2[Wi4&'-nEc4ogG]YYL$4R>;67sC%Df'&.F(fK4F<G"0A0>],DJ()6
ATMr9AU&01@;]LqBl@m1%16Ze+>b3#+E2IF+=Bll@rcKeAU&;N-T`\mBl7W-D.-ppD]iV9E,8s#
@<?4%DC5l#ATAnM+?:Q`F`\`R9jqOPDcC:mF>,((6#:@=DfTVgDbt7YGmt)i$;No?+EMI<AKYW+
Dfp#?+CT.u+EM[>FCfM&$>"6#B6%r69mKZZF_55UEc6)>4ZX]I3[[XI;fm.oAk-l[F`8HtGuS3^
BlmBeEag.cGsussCh[BnFB2sn@ODTlATAo+Ec<-nF`VXpEc6)>4ZX]I3[[OBF*'omDfp"A8p,2s
:h='FBOuH389JfcAU-[^Ed8ctDe)gkBl%KrBQPU2$>"6#1E^=NE$/+kF*(>tDeio_F_Pr/4ZX]I
3[[m<F*(>tDeio_F_Pr/+B2onFAugrF>+h:ATMrmAU&;P-OgCl$;No?+DG_7ATDl8A8,OqBl@lt
Ed8d<De!p,ASuT4/KebFF*2M7+EV19F<G+.@ruF'DIIR2+CoD#F_t]-F<G:=+Eqj?FCeliCh6QT
$?Tfm@rrhF3ZpL=HXpi$+>=oI$>"6#A8lU$F<Dr!:IA,V78?fM8OHH)4#%0OATAnN+E2IF+@KpR
6uQR7AU&;[3Zoe\Bk)7!Df0!(Gp$X9@s)X"DKI"CAU&;>D.-sd+E_R9EHPh8FDi:DBPDN1FCfN8
3Zoe$,!'7KA8ZO,?X[\fA7$]3%13OO:-pQUB4YslEaa'$F!,:-F*&O6@:O(qE"*.<0RIbI@r#Tt
FC])qF<D#"9L2TV6;CNT4ZX]I0d(fc@W$!)-S?bh%13OO:-pQU@UX=l@j#r'Ch[E&@<-"'D.RU,
Et&IfEZeh(ATT%B8p,2s:h='FBOuH:+<VdL+<Vd9$>"6#@V97o+=Bd(F*(5i@:Nt^Gpb.:5uU`L
:/t!t$>"6#@V97o+?MV38p,2s:h='FBOuH389JfcAU-[^Ed8ctDe)gkBl%KrBQPUE%16Ze+C\tp
F<Dtn3[[OBF*(5i@:Nt^Gp#UqA5mbeCh[NqF=/L[/1)u5+?W=`;cH(Y<D=SY+<V+#ATAnI+C\tp
F<Dr'F`VY$ART(^AU,XG+<VdL+<V+#ATAnI+C\tpF<Dr'F`VY$ART(^AU,XS9L2TV6;CNT+<V+#
ATAnI+C\tpF<Dtn3[[I@DJNg/6uR*k+@g?\<-N%mBkM+$-Rg/h-8%J)4A8%><'j>[9aqG@EZd(Z
@V97o+=C-"F*(AmG]YVe+<VdL+<VdL%16Ze+>G!JB4Z0--WFYuFAugrF>5-o9L2TV6;CNT+<V+#
ATAnJ+C\tpF<EY+-WFYuFAugrF>+h:ATMrmAU&;P-QjNS%16Ze+>P'KB4Z0--VAN&F@U@iF`8]N
+<VdL+<Vd9$>"6#1*C%=ATT%B8p,2s7riNjE$m215uU`L:/t!t$>"6#1*C%=ATT%V3[[OBF*'om
Dfp"A9mKZZF_55UEc6)>-OgD*+:SZQ67sB:+C\tpF<DrK@;TR'+<VdL+<VdL%15is/g)qm@V97o
+=D&8D.P>0Dfor>-QjN@$;No?+>Y-LB4Z0-@VfOj6;Cs+ATJt:%144#%16Ze+>b3MB4Z0--V\#Z
Ec4ogG]YVe+<VdL+<V+#ATAnM+C\tpF<Dr*@:O=r<+U;r0IJDF5uU`L:/t!t$>"6#1a$7?ATT%V
3[[X1@rcKeAU&;N+AH9SEc4ogG]YVe+<V+#+<V+#:-pQUF)Po,+CoD.-ZgJ@@<,p%@psFiF!(o!
ATAnN+C\tpF<Dr3@;KXg:18!NF$X;GAT2a&A1&KB+<Ve%67sC"F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKI"AATW'8DIm?$+<V+#ATAnN+C\tpF<Dr&@;Sq]8S;pZEb/c//5/?.<'j>[9ctQR67sBpAftPk
@r$4++Du==@V'R&BlbD9Eb0<'DKI"8F<GFCF*&O6AKYo,+<V+#ATAnN+C\tpF<EY+-[&p7Bk/?(
@;TRs+DGJ+DfTE"-QjO,67sC"F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"AATW'8DIm?$%13OO:-pQU
Dfp.EDe:,4@;]^h+C\bhCNXS=DKTf*ATDi7ATDg0EZf:CF:ARpATAnN+C\tpF<Dtn3[\WZG%#3$
A0>>i@r$4++Du==@V'R-.3L/g/j:C?-S?bt,!%G4+=eQY/q#?G5uU`L:/t"2+:SZ#+:SZhEZd%Y
3$;[CATT%B9mK0PE,95uBlmBeEagC=+<VdL%16Ze+>=ot+C\tpF<Dr*GsussCh[BnFB2sn@OE^#
5uU`L:/t!t$>"6#0H`=t@V97o+?MV39mK0PE,95uBlmBeEag.]De)gkBl%KrBQPU2$>"6#0H`@u
@V97o+=BZtA5mbeCh[NqF=/1R+:SZhEZd%Y3?VdDATT%B7rMp;GA1l-B4uB7/5/?.<'j>[9aqF=
$;No?+>=ou+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU0d&Fu@V97o+=D&8D.P(;+<VdL+:SZQ67sB8
+?1KQB4Z0--Z3@0AM.J2F`):K%15is/g)kk3$;[CATT&(Ch%9J:18!NF!)S7$;No?+>G!!+C\tp
F<DrK@;TR'+<VdL+<V+#:-pQU0d&J!@V97o+=D&8D.P>0Dfor>-OgDX67sB8+?:QRB4Z0-@VfOj
6;Cs+ATJt:%15is/g)nl3$;[CATT%BDIIBn-QjNS+<Vd9$;No?+>P'!+C\tpF<DrK@;TR.@rHL-
F=.M):-pQU1*AP!@V97o+C].sCdLm*D.Rc2+:SZQ67sB9+?:QRB4Z0--Z3@0ALATC+<VdL%15is
/g)nl3?VdDATT%BDIIBn/n8gBDKI68$;No?+>P'"+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1E\Y"
@V97o+=D&8D.P(;+<VdL+:SZQ67sB:+?1KQB4Z0--Z3@0AM.J2F`):K%15is/g)qm3$;[CATT&(
Ch%9J:18!NF!)S7$;No?+>Y-#+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU1E\\#@V97o+=D&8D.P>0
Dfor>-OgDX67sB:+?:QRB4Z0-@VfOj6;Cs+ATJt:%15is/g)tn3$;[CATT%BDIIBn-QjNS+<Vd9
$;No?+>b3#+C\tpF<DrK@;TR.@rHL-F=.M):-pQU1a"b#@V97o+C].sCdLm*D.Rc2+:SZQ67sB;
+?:QRB4Z0--Z3@0ALATC+<VdL%15is/g)tn3?VdDATT%BDIIBn/n8gBDKI68$;No?+>b3$+C\tp
F<G%/@r+J,@;TRs+<V+#%16Ze+@KpR6uQR%@:O(93Zp:&@V97o+=ANG$4R>;67sBkDe!p,ASuT4
FCf]=F!,=BF*&OA@<?!m%14LF+F?.#+?gor/g*Pr@mk6F6=FA>.3L3'+@KpR6uQR7AU&;+$6UH6
+<VdL+<Vd9$>"6#2'?@@ATT%g5uU`L:/t"2+<VdL+:SZhEZd4^@V97o+FPjb@W$!)-S?bh+AP6U
+CoD#F_t]-FE8R:Ec5e;@;Ka&@UWb^F`;C2$6UH#$>"6#7riNjE(",V4ZX]@+>G!JB4Z0--V\kb
FEM2-7riNjE$lbN%13OO:-pQUB6%p5E$/t2F*)IGD09oA+DkP/@qZu:+E):2ATAo-F!,1;Eb0&u
G%#91%14L:3dr25HTE]#4s58++@gHjF`9`WF=A=a3Zp(:INX%k9mKZZF_55UEc6)>%144#+<V+#
ATAnK+>G!JB4Z0--V\kbFEM2-7riNjE$m215uU`L:/t!t$4R>;67sB9+>G!JB4Z0-@VfOj6;Cs+
ATJt:%15is/g)qm0d'q<ATT%BDIIBn-QjNS+<Vd9$;No?+>Y,p+C\tpF<DrK@;TR.@rHL-F=.M)
:-pQU1E\Cp@V97o+C].sCdLm*D.Rc2+:SYe$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GUDJVXJ
F(o,<0ht%f.Um:36=FqL@k]V[F=f'e@UX=l@j!1/DJUaE@UWb^F`8I@@;TQuCh[s4+EV19FE9&D
$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(OV.3N).@r$4+F!,:;@:Wq[
+EqOABHUl(Dfo]++EqaEA9/l8D]in*FCSu,DIIBnF"Rn/:-pQU+<VdL+=M>CF*)/8A2#_e+DGm>
Ci<`mARlomGp%3BAKZ)+F*'GcEccCG-Z!^0A9;C(F>,C'A8,OqBl@ltEd9#A$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:mARdJL%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.
D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(
:-pQU0fX#YE\]Bm@:Wn[A0<:>@:O(`.3N_N+DG_7F`M%9ASuF/B4rDs@:O(qE-!.5G\M5@+D,P4
+EV19F:AQd$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.
;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%15is/g,7LATD?)D09oA+C\n)@;[3+E+No0
A8,OqBl@ltEd8*$DImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)+=D2@@P0Al-OgCl$>"6#
De'u4A8,Oq%15is/g,@VEb'56Ao_g,+Dl%<F<G(9EcP`/F<G%$@r$4+%16Ze+C]5)+=ANG$4R>;
67sC&ATMs7+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZd(Z@W$!)-RT?1%15is/g+_I+Ceu)
ATD2g$>"6#1*C%DC`k)Q%16Ze+>Y-LDJUFC-OgDoEZd1]@W$!)-RT?1%15is/g+V@C`lGJ;cHFn
+Dkh5Ec5u>+CoA++D,P4+EV:.+Dl%<F<G(9EcP`/F<G%$@r$4++>"^IG[k<(F:ARP67sBiDJUG6
DJXS@F(Jd#@q]Fp+CQC6Bl7R"AKYr7F<G+.@ruF'DIIR2+C\bhCNXS=FD,6+AKY].+Du*?E+*j%
%15is/g+h=DI[6#FD,6+AKYE%AKYl/+E1b2BHV56A7]d(Eb0<7Cij_@Ch[Zr3ZoP!+C?iGA8Z3+
-RT?1ATAnM+>Y-LDJUFC?UR[h-QjO,67sBt@:O=rF!,%3A8,po+EqOABHS[06r-c0+DG^9@s)g4
ASuT4@UWb^F`7csATAnK+>P'KDJUFCDe(4<+<Ve%67sBnEc6)>F!+t2DKK<$DJ=!$+EM[7F*)G:
DJ((>De(4<Bl5&'F`MM6DKI"1@:O(qE"*-`$>"6#0H`(m0HahBC`k)Q+<VdL:-pQU@;Ka&DJsZ8
F!,17+CfP7Eb0-1+C\bhCNXS*$>"6#0H`(m0d'qCC`k)Q+<VdL:-pQU@;Ka&@:XOmEaj)4Bl5&'
F`MM6DKI"1@:O(qE"*-`$;No?+DG_7F`M%9ASuF/B4rDs@:O(qE-!.5G\M5@+D,P4+EV:2F!,R9
F*%iuATAo4@:O(`+EV..@rr.eATAo4@:O(`+EV..@rr.e%15is/g,@VEb'56Ao_g,+E1b0FD56-
Cgh?,@UWb^F`;C2$;No?+C].sC`mY.+C\bhCNXS=DKTf*ATAo(Dfg%O+D#1H+?V_<0d%hr1,CO;
2_HgC/ho490f1L;1G1C;/hf+0%15is/g+bEEc#6,FCeu*F)N10CiF&r+EMIAFE8RA@<?!m+Du==
ATDKp+EMIAFE7luATAo&DKTf;4ZX]pDJUFC/gh)8@V\+f+?hN,@W$=*F$2Q,I4cXODKTf;%13OO
ATAo&DJUG)CEO`B+<VdL+<VdL+<Ve%67sB'@W$!)-S@,4-QjNS+<XEG/g,">FCSuqF!+n-C`mq?
Eb'56Bl5&+Bm+'*+C\bhCNXS*$>"6#@W$!)-ZWd--S/_B+<VdL+<VdL:-pQU+C]5)+=D2@@P0Ao
-QjO,67sBt@<?!mATJu&Cht5<DfTB0+EMX5Ecc#5B-;D4FD)dEEb/]-+DG^9B5)O#DBNCs@r$4+
%16Ze+>=oo+C]5)+=C`F-S/_B+<VdL+AP6U+<W?\1E^.EC`k*:GV1^0-QjO,67sC)DfTB0+D#G$
Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"@:O(qE"*.cEZd(Z1E^.EC`k*:GUG%OCEO`B+<XEG/g)8k
+>Y-LDJUFCAU#g^2^]^j:-pQUFCfN8F!,%3A8,po+EqOABHS[6GUFVJDBNS+G%GP6@UWb^F`7cs
ATAnK+>P'KDJUFCDe(4H@V[)/+<Ve%67sB'1*A=p@W$!)-Z<NJ0fLI&+AP6U+D5_5F`;CE@rH7,
@;0UnDJ()5F^fE6EbTE(+=D)<-Qm,@+D5D3ASrW"@:O(qE"*-`$>"6#0H`(m0d'qCC`k)l-S/_B
+<VdL:-pQU@;Ka&@:XOmEaj)4F*(i2FD5W*+EqOABHSZh-Qm,@+D5D3ASrW"@:O(qE"*-`$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s\sgF(o,E3B:GUDJW6gDeio<0MXqe.Um:3;f-GgAM>e\F=f'e-t7(1.3N&>
B6A'&DKI"BD/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR
<%i?)F*)/8A2#\b%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp130f<]gCbmdT$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gio@rsF\+CSeqF`VY9A0>K&EZd(r+Z_G&@q]:gB4VMZ
:-pQU0f`cU@k]\]FCfN8+D,P4+DG_:@;KXg+A*bo@;TRs+CT.u+D#D!ARo=_A0>],@ps1bF!+n%
A7]9\$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>
Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"m
Ci<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO:-pQU/ULGc
;cFl<<'aD]I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j5U[k++?hhO-p8n)-RU8j.1HUn
$;No?+D58'ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%13OO
:-pQUF(8m'4ZX]L3b^2h1E[f867sC%ARTUhBHV;;@;KXiBk;=+%15is/g+nH@m)jq+<Ve@/g)tn
+AP6U+A*c#DfTA2DIIBn+Cf4rF)qct%15is/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE7lu:-pQU
+<VdqCh[EkA0<!;6tp.QBl@ltEd:#jA7]g)+<VdL+<VdpBk)7!Df0!(GscL\ATLd]@<,jk+<VdL
+<Ve.DfTAeARTUhBM)$.D.Q(N@<6K4+<VdL+<VdL+AH9SEc4lf@<,jk9jqOPDfg8DAISuA67sBs
@<-!D3Zoh5BeD(g+=nW`4<cI%:I7ZB6W?fJ?X[\fA7$c./0H>lHRMZV8ju*H:.&AsC2[Wi.6DT\
BQ5ID/0H>lHRLFH:JsSf@;9^k?R\'X@q]jDBeCMb.3L/a-nK]n/58Dt;GUY.C2[Wi.6DT\BQ6+.
5snOG<*<$d?X[\fA7$bp$4R>;67sC(@;KXg+ED1/BQP@FGpskEEbBN3ASuT4E+*j1ATD[0%15is
/g)8Z+D#D/FEnuO@UWb^F`:i.F<D\K@;KaoDIR$aCNXS=+DkP/@q]mo@qBP"+<VeD@<?!mBl7Bg
@r$4+%15is/g,1CEb@Nr+=ANZ+?L\g-S?bh+<VdL+<W`g-SAnIF`):K+?L\g+=D&8D.P(;+<VdL
+?L\nDIIBn/n8gBDKI68$4R>;67sBmDfT]'FE8R5Cht5;@;KXg+=L]:CagK8EbBN3ASuT4E+*j1
ATD[0%15is/g)N:67sB.+=n]k+<W`i0d%Z$-8%J)0d&.m1*Cof0d%T&+=K?"+C]5)+=AT\/0IVI
+>Fui+F>4Z4D\GHB.4rS+?XXdDffP;/j:Cu@<,ui$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO
:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&
@;^?5@UWb^F`;CE%15Ks4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@
EZd\794)$o9IqP@/no'4-OgCl$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bh
CNXT;+>"^IG]75(FCeu*ATDg0EX`@nATAo&DJUFC-OgE#ATAo&DJUFC/gh)8DImi2@W$!)-S@2&
%13OO:-pQU@rc-hFCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3
/KeVAE--@7$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-
+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])qF:AR"%15is/g,7L
Bl[`,DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G
$9g.jE+*6lA0>u)Bk)5o$4R>;67sC%Df'&.@UX=l@j#K'G%#3$A0><$B6A'&DKKqB/KeVLE+NO$
ARlopEcQ)=%16uaEZeh/C`k)X@4)KkDImi21a$7FC`k)X/MSU^$>sEq+>P'KDJUFC/hSL\$>sEq
+C]5)+>=63DImi2@W$!)4=;Kc$4R>;67sBQ+DtV)ATJu<Bln#2ASkmfA7T7^+Dbt+@;KLr+CT;%
+Du+>+DG^98l%htA8,OqBl@ltEbT*+%16uaEZeh/C`k*>F'i9uEc5i.-OgE#ATAo&DJUFCBldWg
AThX&?XJ"tDf03!E[M;'DImi2@W$!)-ZaBDCi!I&Ec5i.?RH9iDImi2@W$!)-Xe>L+<VdL+<XEG
/g,%MF<G!78g&"[D.O.`%15is/g+SAE+NotF!+t8EcP`/F<G10EcZ=F@UWb^F`8I@F_tT!EZbeu
9L2TV6;CNT4ZX]5/gi1m4#%k)+C]5)+=Ach+:SZqATAo&DJUFCD0]Jt@:W^m/5/?.<'j>[9aqGI
ATAo&DJUFCD0]Jq@UWdp/5/?.<'j>[9aqGIATAo&DJUFCC3=T>-=1"eG@ku6-S.qW;cH(Y<D<o0
%15is/g,4RD.Oi!@<6-m+DG@tDKKT7Bk;?.%14LmDJUFC-Rg/i3ZqmLC`keoHX^l/+=Ach+:SZ+
0HahBC`k)Q.3L3'+>=pIDJUFW0mbSs@W$!)-S?bh%14L<+C]5)+=ANc+>#Vs0d'qCC`keoHSHXP
DJUFC/ghbN$7IYP@W$!)-RU>c/NP"0+C]5)+?M<)1*C%DC`k)X-Qij*-o2uTDJUFC-Rg/i3Zp4$
@W$!)4#)(<+C]5)+=Ach+:SZ+1a$7FC`k)Q.3L3'+>b3MDJUFW0mb`"@W$!)-S?bh%13OO:-pQU
+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8%16QQA8ZO,4ZX]5/ghbm+<iih0f'q&
+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq+D,Y4D'0s=Df0-2BleB-DKI"1@:O(q
E$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQpDImi20HahBC`m1qA8ZO,%16uaEZd(Z
@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\@W$!)@UWebF_qQpDImi21a$7FC`m1q
A8ZO,%13OO:-pQU9jqpb+E(j7Eb0)rBl7X&B-;;-F*)IG@rc:*Bk(RfCj@.6AT23uA0>f.+EV:.
+Dbt)A7]9oDdmHm@rucE%15is/g*_t+EV:.+Dbt)A0>r1Deio,FCfN8+EM%5BlJ08+CT;%+Cf(n
DJ*Nk+CQC/Dfd+?Afu2/ATME*FCfN8Et&IO67sBtF`VXI@V$[&AThd/ARmD9%13OO:-pQU+C]5)
+=ANG$7KG&C`k)Q.3L3'+C]5)+=ANG$4R>;67sB'@W$!)-SAnIF`):K%14LmDJUFC-Rg/i3ZqmL
C`keoHX^l/+=Ach%13OO:-pQU+C]5)+=D&8D.P(($7IVj+?MV36;LBN5u^WS0H`\X:J=&R:JEPd
6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs@W$!)-ULU)9IC8V%15is/g)9GDJUFCDIIBn/n8gBDKI68
$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3ZqmLC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>=pI
DJUFC-OgD20HanDC`k)Q.3L3'+<W?\@W$!)-RT?1%15is/g)hj@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!@W$!)-S?bU$4R>;67sB7+C]5)+=AdODfor>-OgD20HanDC`k)Q.3L3'+>=pIDJUFW0mdAI
C`k)X-OgCl$;No?+>=pIDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc6;LBN5u^WS0d&eY:J=GR
;cFl+:JXY`5se76-Rg/i3Zp+!@W$!)-ULU)9IC8V%15is/g)hj@W$!)-Z3@0AM.J2F`):K%14L<
4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,/NP".+C]5)+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0d'qC
C`k)Q%14L<4"#)dDeio<<+U,m0IJq0F)>i2AMI.qF*')`4"#)dDeio=<+U,m0deCm/NP"/+C]5)
+=ANG$4R>;67sB8+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+C]5)+=Ach%13OO:-pQU0d'qCC`k)X
@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFW14*JJCaUh_%13OO:-pQU0d'qCC`k*C
@;TR'%14L<4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'+>G!JDJUFCF)>i2AMGPA$4R>;
67sB8+C]5)+=D&8D.P>0Dfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qCC`k*HD/X3$0IJD5
14*JJCaUh_%13OO:-pQU1*C%DC`k)Q%14L<4""KUDesK3Deio<-T`\bDf9H5D/X3$0df%1Bl8$6
D/X3$0IJq0Bl8$6D/X3$0deCm/NP"0+C]5)+=ANG$4R>;67sB9+C]5)+=Ach%14LmDJUFC/gi(j
/NP"0+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M)-n%24.4dS8,[i__+>#Vs1*C%DC`keq
HX^l/-S?bU$4R>;67sB9+C]5)+=D&8D.P(($7IVj-Y[I?F)>i2AMGP]+>#Vs1*C%DC`k*>DKKr:
Deio=-OgCl$;No?+>P'KDJUFCDIIBn/n8gBDKI68$7IVj-Xq"4CiaH3CLo1I.3L3'+>P'KDJUFC
@W-1$-S.>7HX^l/+=Ach%13OO:-pQU1E^.EC`k)Q%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)
-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$@W$!)-S?bU$4R>;67sB:+C]5)+=AdO
Dfor>-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`keoHX^l/-S?bU$4R>;67sB:+C]5)+=D&8
D.P(($7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)-ZaDX%13OO:-pQU1E^.EC`k*C@;TR.@rHL-
F=.M)-n%24.4dS8,[i__+>#Vs1E^.EC`k*HFXJ_%14*JJCaUh_%13OO:-pQU1a$7FC`k)Q%14L<
4"#)dDeio<9jqOPD_NP#-Za-CCLo1o@:O=r0df%1F)>i2AMHnf@rcKA-T`\sD/X3$0hl(dEc3Z[
.3L3'+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1+=Ach.3L3'+>b3MDJUFC/gh)8%15is
/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo:-pQU1a$7FC`k*C@;TR.@rHL-F=.M)
:-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m@W$!)-S?bU
$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)+=D&8D.P(($;No?+>=om+C]5)+=D&8
D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M):-pQU0H`+n@W$!)-Z3@0AL@oo:-pQU
0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q%13OO:-pQU0H`.o@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)+=AdODfor>-OgDX67sB7+>Y-LDJUFC
DIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Fun+C]5)+=ANG$4R>;67sB8+>G!J
DJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO:-pQU0d&1n@W$!)-SAnIF`):K%15is
/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0d&4o@W$!)-RT?1
%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o@W$!)-S?bU$4R>;67sB8+>P'KDJUFC
/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB8
+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>Y-LDJUFC/gh)8%15is
/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0AL@oo:-pQU0d&7p@W$!)-Z3@0AM.J2
F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#0d'qC
C`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9+>G!JDJUFCDIIBn-OgDX67sB9+>G!J
DJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;67sB9+>P'KDJUFC/gh)8-t7(1+=Ach
.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnIF`):K%15is/g)nl1*C%DC`k*C@;TR'
%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q@W$!)-RT?1%15is/g)nl1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9+>Y-LDJUFC/n8gBDKI68$;No?+>P&q
+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>G!JDJUFC-OgCl$;No?
+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC/gh)8%15is/g)qm0d'qCC`k)X@rHL-
F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)-Z3@0AM.J2F`):K%15is/g)qm1*C%D
C`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1*C%DC`k)X-OgCl$;No?+>Y,q
+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX67sB:+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,r+C]5)+=Ach
%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.EC`k*C@;TR'%15is/g)qm1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68$;No?+>b2q+C]5)+=D&8D.P(($;No?
+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC-OgCl$;No?+>b2r+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%DC`k)X@rHL-F=.M):-pQU1a"Or@W$!)
-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E^.EC`k)Q%13OO:-pQU1a"Rs
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl$;No?+>b2s+C]5)+=AdODfor>-OgDX
67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=om+>=pIDJUFC
-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>=pIDJUFC/gh)8%15is/g)hj
0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0AL@oo:-pQU0H`(m0HahBC`k*C@;TR.
@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gBDKI68$;No?+>=om+>G!JDJUFCDIIBn
-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fuo+C]5)+=ANG$4R>;67sB7+>Fuo
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach%13OO:-pQU0H`(m1*C%DC`k)X@rHL-
F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)hj
0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&7p@W$!)-S?bU
$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup+C]5)+=D&8D.P(($;No?+>=om+>Y-L
DJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl$;No?+>=on+>=pIDJUFC/gh)8-t7(1
+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n@W$!)-SAnIF`):K%15is/g)hj1*A7n
@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0d'qCC`k)Q%13OO
:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0d'qCC`k)X-OgCl$;No?+>=on+>G!J
DJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX67sB7+>P&o+C]5)+=D&8D.P>0Dfor>
-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&p
+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M):-pQU0H`+n1*C%DC`k*C@;TR'%15is
/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q@W$!)-RT?1%15is/g)hj1*A@q@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;67sB7+>P&q+C]5)+=AdODfor>-OgDX
67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>=pI
DJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>=pIDJUFC/gh)8%15is
/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)-Z3@0AL@oo:-pQU0H`.o0HahBC`k*C
@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU0H`.o0d'qCC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC/n8gBDKI68$;No?+>=oo+>G!JDJUFC
DIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,q+C]5)+=ANG$4R>;67sB7
+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)+=Ach%13OO:-pQU0H`.o1*C%DC`k)X
@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj1E\Fq@W$!)-Z3@0AM.J2F`):K%15is
/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Ir@W$!)
-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7+>Y,r+C]5)+=D&8D.P(($;No?+>=oo
+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)-RT?1%15is/g)tn0d&5++C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?+>b2q+>PYo@W$!)-SAnIF`):K%15is
/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5,
+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,9t]DJUFC/gh)8
%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo1*C%DC`k*C@;TR'%15is/g)tn0d&5,
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q%13OO:-pQU1a"Lq1,C%^DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;+>Fuo1E^.EC`k)X@rHL-F=.M):-pQU
1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,L+_
DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5.+C]5)+=Ach%13OO
:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Lq1,L+_
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1%15is/g)tn0d&5/+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q+>Pes@W$!)-SAnIF`):K%15is/g)tn
0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&50+C]5)
+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,^7aDJUFC/gh)8%15is
/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIHC`k*C@;TR'%15is/g)tn0d&50+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO:-pQU1a"Lq1,g=bDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo2]uRIC`k)X@rHL-F=.M):-pQU1a"Lq
1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,pCcDJUFC
-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&52+C]5)+=Ach%13OO:-pQU
1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Lq1,pCcDJUFC
DIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is/g)tn1*A>,+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo@W$!)-SAnIF`):K%15is/g)tn1*A>,
+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>-+C]5)+=ANG
$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,9t]DJUFC/gh)8%15is/g)tn
1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C@;TR'%15is/g)tn1*A>-+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU1a"Or1,C%^DJUFC/gh)8-t7(1+=Ach
.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.EC`k)X@rHL-F=.M):-pQU1a"Or1,C%^
DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,L+_DJUFC-OgCl
$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>/+C]5)+=Ach%13OO:-pQU1a"Or
1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Or1,L+_DJUFCDIIBn
/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn1*A>0+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)-SAnIF`):K%15is/g)tn1*A>0+C]5)
+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>1+C]5)+=ANG$4R>;
67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,^7aDJUFC/gh)8%15is/g)tn1*A>1
+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'%15is/g)tn1*A>1+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'
+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X@rHL-F=.M):-pQU1a"Or1,g=bDJUFC
DIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,pCcDJUFC-OgCl$;No?
+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3+C]5)+=Ach%13OO:-pQU1a"Or1,pCc
DJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Or1,pCcDJUFCDIIBn/n8gB
DKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnIF`):K%15is/g)tn1E\G-+C]5)+=D&8
D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G.+C]5)+=ANG$4R>;67sB;
+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]DJUFC/gh)8%15is/g)tn1E\G.+C]5)
+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is/g)tn1E\G.+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s
+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs1,C%^DJUFCDIIBn
-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,L+_DJUFC-OgCl$;No?+>b2s
+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)+=Ach%13OO:-pQU1a"Rs1,L+_DJUFC
/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Rs1,L+_DJUFCDIIBn/n8gBDKI68
$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q
2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K%15is/g)tn1E\G1+C]5)+=D&8D.P((
$;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G2+C]5)+=ANG$4R>;67sB;+>Y,q
2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC/gh)8%15is/g)tn1E\G2+C]5)+=AdO
Dfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn1E\G2+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pku
@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs1,g=bDJUFCDIIBn-OgDX
67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC-OgCl$;No?+>b2s+>Po!
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach%13OO:-pQU1a"Rs1,pCcDJUFC/n8gB
DKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs1,pCcDJUFCDIIBn/n8gBDKI68$4R=O
$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!c
Eaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xdnh;f-GgAM>i667s`sDJW6gDeio<0d(Qi/KcHNDJUaE
A8-+(CghT3E+*6l04J@"CNXS=A79RkF"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dE
IS*C(<(0_b06CcHFD>`)0JFj`$;No?+<V+#:-pQU@rc-hFCeuD+>PW*3Gi2F1,9:G:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf
6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r
%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!7
Eb-A;AKYYpG%De;Df'&.@UWb^F`;C2$>"6#E+*6lA0>u)Bk)5o$>"6#E+*6lA0>u)Bk)5o$4R>;
67sBZBQ&);ASkmfA7T7^+C\bhCNXS=A79RkF"SS7BOu6r+Cno&ATJu<Bl%T.@;p0s@<)ea:-pQU
@<3Q;ATD]3A79RkF!,17+E)(,ATAo&@:O(qE-!WS;f?MaFD5T'F!+'t@VK^gEbT*+%15is/g+Y;
@;]^h+EMHDD09?%+EV:*F<GC.FCfJ8G%G]8Bl@m1+CehtDJsV>Eb/Zi+:SZQ67sC!Ch.*t+C]&&
@<-'nF"SS,DBO%7@<<W%@<6!&Bl8!6ART*lDe:,#+Cno&AISuA67sBhDBNM2Ec5t@D.Rd0@:s-o
GA1l0+C\n)A8-+(CghU#A1e;uATAnJ1a$7FC`k)X-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2
?O[?RA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WLDIIBn/6cV#
@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7+ED%5F_Pl-
+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19FE9&W+@1&k
+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o:-pQUBR+Q.
EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is/e&._67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1-#dN:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#Y
Gqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(
:-pQU0f`cU@k]haARmH'B4Z0-FCfN8F!+n%A7]9o%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I
+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$
+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$
FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?
+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU
/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5
-RT?1%15is/g+kGF(KB6+=M/OATE!8Blmo8+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$=[plCgq=.
4ZX]>%16]`Ddda)AN`'s0f_08,p5Dp1E\Fq1*@hb2`D0Q8SDOUAOC->Ea`I"ATBpp+=Ci@G9CaF
@q[!/Df9//GAhV?A0>;'GAhD1+Cf)-@r!2sBQ[g#-OgDnDfoN*AT2I.F*2A5Df9/L3Zoq6+@%&"
3XlF)D/a',A8cQQ3Zob%%17;s@;TRs4ZX]I3[\BTDerm$Gp$^8Ddda)AKXQX@<Q3LBOPpi@ru:&
+CoD5@VfUpCisfADJ*m+A0>;tE+O'#Dfd?9$9g.jFDYu5Ddso/F`\aMDIIBnEt&I?0RImq4ZX]>
+>GPmB4Z0-GA^i+ATJ:f%15is/g,7LBlbD=ATMr9Eb065Bl[c-D..=)@;I'#DKBc.@ruF'DBNk0
+A*bfA8-.(EZfR?DId[0Et&Hc$;No?+D#(tF<GdGEb$:@DIIBn/7WL)F)rmSAU&;G+EV%$Ch4%_
0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4GA^i+ATJtu+D#(+4#))(0F\?u$;No?
+DG_7ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^F`\`RFCfN8@;Kmr@5'A_4"!ci/g+kG
DJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`4"!ci/g+kGDJs$'F`S[IAU&;E%159Q
HSHX^F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[IAU&;E%159QHScjaF`\`RD.-ppDddI$
BONSK-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$BONSL-Ta(<4!ua*.j-Po%13OO4tq>*
0g.Q?0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)BONSB%13OO:-pQUARoLs+EV19F=;$8
D.P8?AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsU+>"]`/3>P4FDbN(ATJtu
+D#(+4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,I4cX!+CoA++=D#7@rcKrCiF&r0II;:
%15is/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h
+D#(tFDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4%15is/g+YEART[l+EV:;ARuun@:O(q
E,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#TtFC])qF:AQd
$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`
CLqU!F*')F$9g.jE+*6lA0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-
+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])qF:AQd$;No?+E)41
DK?q/+EM77B5D-%ARoLs+EqO;A8cZ7GA2/4+EV1>F<GU8E,oN2ASuTuFD5Z2F!,C5+CT)&+EqaE
A9/l-DBNb(F*&O6@:O(qE"*.cEZfLJ4ZX]pB4Z0-I4cXODJUFC-OgD;+Bot0BQ&*6@<6K4-Y$h$
@r!2uA8-.(EZd1]/LN(l4"u"40RGu<HZaKS>9IKf+?hN,F`n3$%15is/g,(OASuQ3@3BW*DJ*cs
+D#(tF<GdADId[0+EqOABHVD.G]Y'KAT2[$F(K62@<?4%DK?q=AftMuC`mh2F*)IGBl5&0@<6N5
@UWb^F`7csATAo9G!.l/0d'q<ATT&C/g)kk@W$!)-RT?10d'[CF(fK9E+*g/+=CZ4ARfKuARoLs
DfQsX+>"rl+?M9(/22E70me%d+Bot"A0=&jHZaK@$4R=O$>"6#1E^UH+EV..@rr.e%15is/g)`m
<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6$$m]CLoLd3F?E1F@9hQFCf]=;f-GgAM>f567sa#ATU=S@ru:,FAm$pCLo1R+ET1e
+DGY.F`VYF@<?''-td+5.3N/8@ruF'DIIR2+EV1>FE9&D$;No?%15is/g+,,BlbD=ATMr9Bl%U.
F*)G2FCfM9F)Po,+<koA@r#Y$/RiX:+s8:Y.3N&>B6A'&DKI"2De*F#+E(j$$;No?+=Ll6F=A>V
BOu'(An?'oBPD?s+EV:.+<Y3/@ruF'DIIR2+<Y35@s)X"DKIKR<+ohcA8,OqBl@ltEd8*$:-pQU
A8bt#D.RU,+DGm>@3BW*DJ*cs+Cf41De:,$H$!V=/e&._67r]S:-pQU<+oiaAKYK$A7]g)A7]dq
G%De.Ec5e;DffZ(EZccCATT@DDfBf4Df0VK+A!\cDfol,+CSek+Cf>#AISuA67sC&D]g6EAS6.%
@<-(.AKi7=BPDN1+C]J8+CT=6FD,6,AKYE%AKYDtC`mD"Ec#W(F)rI<F=2,P+Du+>%15is/g,@V
Ecbt;Blks:$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!
Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FCD..H>2%9mf
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5
FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBhCht59BOu6r+D,2,@q]Fp
+D58-+EV:.+ELt.AKYMt@ruF'DIIR2+EV1>F:ARgEZd4^B4Z0--RT?1ATAnN+?(EUATT%B-OgDo
EZd4^2]sgtB4Z0--RT?1ATAnN+?(Ds+D58-+=ANG$4R>[ATAnN+?(Du+D58-+=ANZ+AP6U+ED%8
F`MA@+D#S6DfQ9oDImi22'?6b+<Y<.F<DqY%16uaEZd4^2]sn!B4Z0--RT?1%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F?T@@:XIkF*',j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrJ0JI$O@ruF'DIIR2
+ET1e+Dbt)A0<T\0R+]qDIal.Eb&a%+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(GqKO5:-pQB
$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8C2[W;0JFpuCi<`mARl5W:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTg
Dg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>Gio@rsFZ+E_X6@<?'k+D,P4+A*b9/hf3n
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFZGWe)1-Zip@
FD>`)0eb:/%172fBk)6>0JI`73ZoelATMs.De(RV0JFj`$4R>;67sC!E+No0.!0!6@rsFZGUXbD
DIal&ATT&'Ec6)<A0<T\0JG1'GAhM4F!,[@FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>0R+$6
5'nn)G^+Hr3Zp+!0ea__ATT%C0eb:90L$e1/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)
B4kj?3Zr'UE$-MU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+D5_5F`;C2$@$f?4ZX]?
+E2%)CERkHGT[G&B4kj?3Zri'+D5>"%16Ze+>Y-YA0>u)Bk)6>0R+$6%15is/g,(OASrV=FC])q
F>5I'GUXbDDIal#ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p
ATAo3A0>u)Bk)6>0JI_\$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:B
ARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6lA0>u)Bk)6>0JI_\$4R>;67sC%FDl22+EqaEA9/1e
5'nn)F(fK9E+*g/+>=om0Hb=WF<GgQGRXuh$;No?+ED%4ART[lA8HN6@q]:gB4W30DfTA2DIIBn
F!+n/A0>r8DfTCu$?B]q@;TR=3Zp.5+?CVm.!mQj0d(`j+>#2m-RU#a-U940/j:C?+u(2a3Zot+
+=MIa+<u.\+=eRK/g)Ba-OgDHHS-F^BQ&*6@<6K40H`)(+E2IF+=JodEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-nuibAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1*CUKDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtf+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K&hEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oE,f
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2B[$ODIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtj+ED%2@;TQuG^+H^+=K?\3]f#E
I3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K2lEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%13OO
:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&I?HS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sBpDKBB0
F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1+=LfGFE1r0AKZ,:AKYo'+E2IF+Cf>,D..<m+D>>,ALS&q
5'nn9+?1K_F`\`SI4f&JC`k)Q.3L/o+?V#nATMrJ0JFVdDfTD3D.R-nBl7R"ATMo8FCfN8+Co&)
@rc:&FD5Z2F!,C5+CTG)Ea`Tl+DbV,B67f7%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&If
EZen,A0?=D0F\?u$;No?+Cf5+F(HIBFC])qF>5I'GUXbGBk)7!Df0!(Gp$O5A0>AuARTI!F`7cs
ATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%17&sFA61gDIIBn;f-GgAM>f567sa,
F`^>dG]$r,AQ*GaCLo1R+ET1e+EV19F<F:D=AD.V73HDXDJ+')+Cf(r@r!\+$;No?%15is/g+SD
F*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp"[]F(Jo*FCfN8+CfG'
@<?(&ATMs(Bk)7!Df0!(Bk;>p$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N
;cGDlATMs.De(OU-OgDX67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3Gi2F0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R=O$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eY
Eaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,7Y
Ec*"F@;TjmEZf:<+:S["ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=
5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgDoEZen3
F(KG9-W3B!6s!8X<(//D$4R>;67sBt@;BEsDIIBn+EVO?+Dbt6B-:W#A0><%F(o9)+C]8%F`S[K
@;L't%16QYB5DiV3ZoeZBkM7-DIIBn-S.tX=AD.V7:0J<De*3"-W;B%$7K@tB5DiB4ZX^"/g)nl
1(=R"$;No?+CTA6ASlC.+EVNEE-67F/Kf+JDfol,+D,%rC^g_hATAo8D/a<0@j#`5F<G%,B5Di9
%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;                                    ~>
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
0f(L+0f'q.+>G_r1*AG/1,L+/0H`+n2)@!H+>PVn1*A;*3&2U20H`+n1,(I?3?U%4+>P&q1,h*6
2]sju2E3T;0f1".+?;;6+>GPm1*AJ71GBq+0d&4o0f1UB+>Gl!1*AS;0H`)/+>P&o1Gq*60esk,
+?(u.0d&@s1*A;*0eu?s6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*
3?U%:3\W?N0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GB.C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*3?U%2
3\rKO1H>dL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp1:+@1-_+>PW*3?U%33\`HP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&
:3CD_ATBgS1*@]-@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWR$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@2
1HI?J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp1<+@1-_+>PW*3?U%53\rZT1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>>So:LeJh1,(FC+>>f:2*!]T1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg
0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBII
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3
+@KdN+>PW*3?U%43]/]S0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4
+@KdN+>PW*3?U%13\iWT0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cPgL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B7E
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6
+@KdN+>PW*3?U"93\iZU1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0fU9u6t(1K3Zp+6+@KdN+>PW*3?U%33]/iW0JNnA$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0fTLI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp+7
+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0K9CH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+7+@KdN+>PW*3?U%43\`EO0Jj+D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7
+@KdN+>PW*3?U%53]&NO0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN+>PW*3?U%53]&QP0e`qA$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8
+@KdN+>PW*3?U%43]&QP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0fTLI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0K:1CARci<
0JPR10KD0N2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GBpo
6t(1K3Zp+9+@KdN+>PW*3?U%13\`BN2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!Y
A0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*3?U"93\iNQ0f]S5:IJ/X
:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:
3\W?N0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@22EEZK3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!F$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A
+>Pku6$6f_1,(FC+>GT31GLpI0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fKFH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]tD/B-8r`
0f^@21-.0G3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWS$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1-$ICF_;gP0JPR10f(jI1-.3M$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$IC
F_;gP0JPR10f1pI2EEWQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU0JahI@rrhK0JPR10KD0O3BB#R$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC
1cdBH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K1HI?O$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pr"
:2b:u1,(FC+>G`71c[TN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S0Jj+D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf1*Atr@j!N\0f^@2
1cdEH3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp.5+<X'\FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>So6tKjN1,(FC+>GQ21,h6K3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp+4+@KdN+>PW*3?U%53\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\0f^@21cd?K3\iN!$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<
0JPR10KD0L3'&lO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t3$9>3@<?'A+>>Yq6tKjN1,(FC+>GW42)dQM1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M
0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn
+@KX[ANCqf2BYD!@j!N\0f^@20KM'O3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%AARci<0JPR10ek^G0KLmJ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>>\r
6tKjN1,(FC+>GZ50f(jE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%53]&NO1,'%B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2BYD!@j!N\0f^@2
1cdHJ3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp18+<X'\FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>_s6tKjN1,(FC+>GZ51bh$G2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K
3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\0f^@22```O3\`W%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp+9+@KdN+>PW*3?U"9
3]&cV1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!0H_K+
@<?'A+>>bt6tKjN1,(FC+>GQ20etdI2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj
6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]P$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf3?U_$@j!N\0f^@13BAoP
3\iAr@WcC$A86$nA8-+,EbT!*FD5Z21,2Nj/h1=QBl%<pDe*BmF*)G:@Wcd,Df-\=/M/)WF_kk:
8l%htA8-+,EbT!*FD5Z2+C]J-Ch,.-$4R>;67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<fl
Ch4%_@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDC2[WlF_PZ&3B9*,4ZX]55s[eO
De*="Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBMPI6m-#S@ruF'DIIR"ATJ:fDf9PW
3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUB4Z0-8l%ht
@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eI
E$-N;F_PZ&C2[W1%13OO:-pQUF(KG9A8-+,EbT!*FD5Z2+Co2,ARfh#EbT*+%16i\A8-'I3ZoeB
:IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?6q0R9;BSS-6rR&N
7n#gA6UXLD-OgDtA7TCp4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-6rQHN
8PiAS8Q$[':IIWR<)Z1V;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<jBl\8;0F\?u$;No?+D58'ATD4$
AKYMtF*)G:@Wcd,Df-\=@rc:&FE7luF`:l"FCf3*A8PamBkCptF<E7H$;+)^<_Yt)@WcC$A86$n
@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::;aXGS:fKhS;@Nt*
:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:IIWR<)Z1V;EIKH
6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q779^F4%`::7nHZJ
8Q$!)8l%iU9gg+HE+EC!ASQ-oF)Q2A@qB1nD/aP=8l%iR:K::[78m/O7n#g;;@Nt*:IJ5X6m-M]
Ch7$rASQ-o+A,Et;cH%Q779^F4%`::;cH%Q78QBA6qL9<8l%iR<'a#C6r-0<8Q%WB:II]E<('ML
6qL8c$4R>;67sBkATMs6Dg<I7F_PZ&+Dbt+@;KKa$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]7(A7B[qCh,Od3F<4&%13OOBPDO0DfU,<De(U^%13OOB4YslEa`c;C2[W*/KeP:
@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5%%/KdGm
@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&
D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!ARloU
:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.
@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=
G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(qE$[7n
7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY
3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'A8,Oq
Bl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpd
F(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-
+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8
+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI
6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4
D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E.
/ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&
D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa
0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1
F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3
@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b
.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdk
ARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF
;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p
@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@
Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#
H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIq
AScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL
%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LB
A7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7
Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg
@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU
0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#
AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4
+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u
+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6
?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKSATDiFC2[d'
1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%
?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5
@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb=)`D$
CbBF:Et&H_#n74a+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK
%144#+<VdL+<V+##mkQeDfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@
;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOL
AISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7
DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8
AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+
A0><%F(o9)D.RU,F"Rb*%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63
+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`
+<VdL+<VdU%13CJ%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!
A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'
Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et
+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$
$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL
+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J+<Ve+
BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct
@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1
/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf
+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9
+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE
+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU
<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8p
A8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<h
F)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4
Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b
.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/
FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*
FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6
AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(t
F<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_
F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$
A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL
+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?
+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo
-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29
+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.
DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!
/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.
AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeq
F`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q
05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1
001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"
+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&
+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%
DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,
F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&
+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79Rk
A0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"
DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)
Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtB
DIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,
@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmE
ATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#
+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50
@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6+
+Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P
@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdL
ARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]Tu
ARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"
F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<
%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&
@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<
ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#
C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1
A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(
.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k
+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>
D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdS
Eap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>
AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL
+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9
DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)
+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL
%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3
Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(
F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNE
A9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*
+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@lt
EbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,
+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po
+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3
A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4
ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67F
A8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=
FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQU
A9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG
$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I
?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+
A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)
AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6s
BkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:C
FCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89
@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.i
Eb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@lt
Ed8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bd
Df00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F
%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bg
DerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]Ul
Bl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s
$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-q
G[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm
/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,
DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%
7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq
@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9
F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-Ni
BOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J+
+<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`
+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!
Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?
@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"
GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloq
Ec5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s
+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]
Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[f
Bllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[
@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0
$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE
2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$
+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8+
+=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*
Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%
0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<
3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R+
+D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3
FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6
/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9
?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$c
Bl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/
@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%
De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.
Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg
@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8
GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR
<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&
DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%
,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6
DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq
+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo
+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6
@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6
AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1
+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!
-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4
Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]
B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#
+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&
D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>
B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'n
F#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK
@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk
+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o
+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:
EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAk
Ble59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(
BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!r
F<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-
+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*
A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("
@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"
$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp
$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*
@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&L
A8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*
Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGg
FD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'M
D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q
$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%
0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrA
DdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC
2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kM
Bkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#
/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9
G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3
Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_A
ATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(
Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*
F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#
AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/is
G\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2
@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*+
+EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9
A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd
?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-
ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8
@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?
6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,
ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,
F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-
F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,
ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,
?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=
?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+
Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e
$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-
+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?e
C2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM4
2_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@
?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth
+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6
?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9
ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-
+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB
+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5
DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,
Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1
AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FD
Eb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*
D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)
+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6
%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)A
DfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!
+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht
?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSek
ARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%
+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp
@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.
AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#
FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E.
/i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>
ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-
FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3
+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg
+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<
1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et
/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b
+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)
AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#
AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$
DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0
F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg
>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRn
DKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.
Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@s
Dfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.
+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4
A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4
Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@
%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8
/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=
D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnu
De*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:
+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<
BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9Cgggb
A0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(
AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8
E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#
+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:
De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7
DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9
A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)
AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI
?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.
<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-
+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0A
F'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1
F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa
+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'
F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'
F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*
FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg
%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC
+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb
+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)
3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>
A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibC
D/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"
A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$D
Eb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@
Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`
CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO
3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.
Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1
Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=)
,9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-
AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5
F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB
+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i
1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=
+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9
D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I
@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE
@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%
F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht
+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*
C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3
DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG
@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL
+:SZ#%143e$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5%%/KdGm@qBLd
ATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9
ATT&9ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[
A0<HHF(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinG
EcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e
,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s
$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5
Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&
+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue
%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO
,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8
@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq
$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJ
F`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p
9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp
+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@
ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30
ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+
8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%
+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*
+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-V
D/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f
/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/Kdbr
Earc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W
%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0
C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6
$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2
/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"
DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmf
EZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))
F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o
+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH
@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u
+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(
+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.
F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-
FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%ht
A8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6
Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.
+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6
AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0o
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtE
FDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[Km
Eaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6
D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq
@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6Tcb
C2[X%Eb02F0ht%f.V`m4E,oN/+EK+d+A,Et+E2@4E,ol,ATMp2EZfF5EbTK7/e&._67r]S:-pQU
;flGiASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/ARfk)ARlomAS,k$AKXT@6m-2b+Dbt)A7]:(
%13OO:-pQUFDl+@Ch7d$C`m;0Ec5t@FE1f/+D,P4+Cf>1AKXT@6m-\lEb'56%16igA92?iBkhQs
?Q_Km+>>!H+?L\n8l%ht;d!$u784mo5tOaM;FNVhCghC,+A*bfEcQ)=+>#c"-R)n?/0J.X+>GYq
3\`B4-RU*F+Boso%13OOC2[X(H#n(=D/`p*BO?'m4ZYAA3Zp*c$4R>;67sa&De*p7F*(u1E+*j%
+Ef=g+E1b2BHV5*+A,Et+EMgLFCf;3/Kc\hFCfK0Bl7@$ARmD&$;No?%15is/g*o-FCdKUG%#3$
A0>K&EZdss2D-[<+CT.u+CS_tG%E98$;No?%15is/g,"LDII':+<YE;A93$;FCf<.@<?0*@r+tR
Bl%>i$;No?%15is/g)8ZC2[X(H#n(=D/`p*BHS[;D..L-ATB.-$4R>;67sBkAS,XoARloU+EMgL
FCf;3Ci<flFD5Z2%14LuE+*j%+=DVHA7TUrF"_0;DImisCbKOAA1o;Z/9r?I$7QDk%16T`@r,Rp
F!)i=C2[W1%15^%5uU`O;E[&`C2[X(H#n(=D/`p*BHS[;D..L-ATB.@+<VdL+<VdL:-pQUA7]@]
F_l.BD..L-ATAnA.P>FMAgnj7Bl%>i$;+)^:f:(Y4ZX^#De*p7F*(u1E+*j%+=CoBA8lR-Anc'm
/no'A-QjO,67sBkAS,@nCige=Ec5Q(Ch4`1@rc:&F:ARlDe*g-C/o=dEbf63F##UJ67sC'F(KB-
AU/>L@qK?_$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`C3+<*FE_/6AM.J2D(fXJBkqE97s/NV
ATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*XFDs8o05>QHAor6*Eb-k5Df%.?Bln0*
F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2AM81IATDQtH#kTJE,Z6n:-pQB$;No?+@UN`
D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.IUQbtDf0VLB45XgF"_BEDImm5AS#gl
E\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT@WHC2F(J]n?RKN/FDs8o06_Va/o#HG
Aor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7-OgDX67r]S:-pQU,"$HmCb%t5+q4lS
67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;:-pQU,"=L8%15is/g)?*FE21J7Q2M#
$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA%15is/e&._67sBU:K0bD+Cf>-G&M2>
FCeu*-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-Qli@DeWa'+E_a:+E(j7-T`[u@q]:k@:OCj
EX`?b$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<>9Is'+=CW@Bl%<pDe*Bm
F*)G:@Wcd,Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=DO+=K?"C2[WnATfFM
/1<V.C2[W1.4dS/F`_>6F!i(Q>9G^EDe't<-OgDMFE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?N
A9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q
;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.
0F\@Y1cmBQ6tKhMB-:)pDEDB<Ecl7B-RT?17Q*=_4&fd4F<FM!DeioGEccCG-Xp_"FAm$pCLo1R
-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1gAA8lR-Anc'm1,2Nj/h1US
A8lR-Anc'm+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@
6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4Ysl
Ea`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,
BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k
$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(Amogu
F<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4
E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t
+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),
ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc
:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE
+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBp
DKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>
%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS
@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5
+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&
ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.
H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$$;No?+CoC5
DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$;No?
+Dl7;FD5]1AKXT@6m-2]F*(i.@qB^(@<,p%E+O',BlnH.A0>?(F<GI>F<GU8@rH4$ASu$iA.8lV
E-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*+D5V2
A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7EcPl)
AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l$;No?
+APL&:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A
$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea
@rGmh/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo
2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&
;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo%15is
/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)
AKWC9De*KfBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuC
A92*lC2[Wi.3NMHF<GX9F=.M):J48O:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]Rg
FCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63
BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(
4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!
%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t
78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuC
A90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is
/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3i
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)
+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b
+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t
$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH
0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA
/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3
DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</L
Ci^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N
+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+
AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$
ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1W
DBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO
:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.f
F$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=
DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL
+D>d<1*@]767sBnEc6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$
3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1
DJUGD/g,?I$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2
%17A'BP_X*C`msFHS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#
DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*
GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"A
F(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqB
FCf]=+:SZkF)sK*+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q
+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA
+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK
/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^
/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?
+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU
+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'
BkAt?@UWeWCgUUcDe*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF
+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'
DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$Hs
4Y@jtAThu7-RU$ID_</M+ED%8F`M@P+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc7
4s4`+/q#?i%14Nn$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;m
C2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa
@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp
+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10
F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"
ATDi$$?0p(FCSumEcXB)><3le+Z_P)-S$\t.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"GB4mC
F^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW
/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23Zoek
BQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)
-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7o
F`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L
+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a
+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>
%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU
,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"
%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.X
F(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C
1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg9
5U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD
3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=r
F!+n/A0><%F)PQ&@<?''@rGmh%173!4ZZjk4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG/g)Vr
FEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU
.P>RHEbf3(GA[isD/h^">p)3O1GC"[+?L]YF<D\K:-pQU.P>d^C^g_gGWe)n+?L]$1*U'J4!80X
+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?@rc:&
F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF+=nW_
/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cpFDl2F
%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.%16id
4ZX]60HiJ2.6qWi%13OO:-pQUCi<`m+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>V0E+*j%%16ih
4ZX]i3Zp+"3\V[\3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16
BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC
3Zp.2%13OO:-pQUGA(Q.AKYDu+A!\uF(Jl)@X0);Df'&.D.-ppDf[%E@;L'tF!)iSDfTV@+E)9C
-YRF8AL@oo:-pQU=%GbX76sX>4ZX]5GAhM;-OgCl$;No?+CoV3E$/\3Bm+&1/Kf1WARlomGp"MX
FD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;
67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p
:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E905>E9
E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r
+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+A,Et+Eh=:
@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?@<6!-%13OO
:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=GD]it;
ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4
ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kkEbupH
E,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<+BosE+E(d5
-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1D..<rAn?%*C2[W<0ht%f
+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U
:JO&6-S[5-/heX^$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*
Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u
$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16ig
A7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3
ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:
$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9
A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo
05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z
78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=
C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K
8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6
F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3
F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et
6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3
AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!
AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S
@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV
:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>
D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,
Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF2bl[l+DkP)
BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[
4ZX]50eP.40II;:7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp
6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99Z
G]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU:IIKZA8c@,/oY?5%17&bAn5gi01o#.
6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.8T&WjDe+!#FD5Z29OVB_E+EPi$?0NfA8bs2
8l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.;f?f!@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5
%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8XE+EQkDdtG#F(oN)8l%iQAS6.%@<+e]E,oN2
F(oQ1F"VEBAdo(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-
F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht
6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<
@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0
GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH+
+DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=
<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`
+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b
@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm
:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6
-S[5-/heX^$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1H
A79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A
%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d
76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!
+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D
%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`
A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%
G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D
@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9
Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.
@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=
$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,Oq
Bl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33
$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#g
F!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30
@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1
AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq
+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQ
D.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,
05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.
+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC
06Cl=/S]37/T>-2AM4K".1HW$H"q8.E,ol/Bl%?90ht%f.W'HGDe*g-De<^"AKZ%G/Kdc5+A,Et
+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBH+CfP8FDl#1H=^V08l%htE,ol/Bl%?'F(96)
E-*]T;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!%15is
/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<
E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT
+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<
05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUB
DJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$;No?+Dl7;FD5]1AKXT@6m-2]F*(i.@qB^(
@<,p%E+O',BlnH.A0>?(F<GI>F<GU8@rH4$ASu$iA.8lVE-#T4+=C&U;ajY[74/NO%15is/g*b^
6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6
A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+
Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha
9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5
,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^
7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`
G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaE
CER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-o
FCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/
$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9F=.M):J48O
:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4
B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$
3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84
A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,
1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9
DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6
A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQU
GAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%Qj
C2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\bi
EarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c
.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k
?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5
E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A
-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8
Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.
F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>
F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6
>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#
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
+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4`+/q#?i%14Nn$4R=O$;No?.Uce0
+Ef=g+CT)&+C\bhCNXS=G%G]8Bl@l3DIIBnF"Rn/:-pQB$;No?+AucmF`MA@+CT)&+Eh10Bk/>q
@:O(qE$0%,D.Rc2D..NrBPD?s+DtV)AKYr4AS,Y$+=MLa/g(T1:-pQB$;No?+Dl%7@:VDA+C].s
CdLm*D.Rc24Y@jc@Wil?Cj]`/:hFq]$;No?%15is/g)8Z@:FC&-Y$g;+<XEG/g+S=C`mq?Eb'56
Bl5&%Cht5'@:O(qE-!.CFCB33Bl7Q+GA2/4+=CZ4-OgDX67sB'+CS`&+=ANZ+<Ve%67sBhCht5<
DfTB0+DG^9@;Ka&@UWb^F`;C2$;No?%15is/g+\M@:VDA+<Y-0@r+J,@;TRs+?_>"Bl"o#@Wil?
Cj]`/:hFq]$;No?%15is/g)8Z1*C"7Fs&/IDe(4<+AP6U+CT)&+D5_5F`8I@@;TRs+DG^9@;Ka&
@UWb^F`;CEF*(i2FD5W*+EqOABHS[;De(4)$;No?+<Vd`+CS`&+=ANZ+<VdL:-pQU@;Ka&D.-pp
Df[%8DBNA(C`m1q@r$4+Et&Ib@Wjmq1E\_$0F\@C+CS`&+F+D'3XlF1AhG38@:Wka?X[\fA7$I)
+CoCC+DPFuEcPMqC2[Wi+@T1+0JG7h@;9^k?QaB#FEMVA/g+_CA1e;uBkAt?/M:aYASlC.H!aup
De*2tGp$X9/g+k?/g+V3A9)0e@;9^k?QaK74Y@j"@q]F`CMmQtATM3eC2[Wi+F,)?D_</TFs(g:
FEMVA/g+_AF(HsHGs*c&EcteuC2[Wi+E_iMASu$2+D#G$/g(T1BkAt?@UWef@p`YZDe*2tF`oo#
+F##<DJUFC/ghcPD_</TFs(g:FEMVA/g+_AF(HsH@W"=]+FPkbFs(@6A1e;uE+X>X/g)Q)@6,h[
/M8A&5(4W&/jLh0-=Uk/.4-Z2+=K?t.3L/g/j:CeD@Hq^4Y@j2+?Ubk-9`PkAp>F-$=#W@+?M\0
0gIfE0d\M:+=L\A,9Ur;GUXad+tt>r4s2s30HagI,9UH5%14Nn$4R=O$;No?+D>2$A9f;-C`m8,
@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31
<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM
-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8
+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is
/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#
.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k
@:OCjEcVZsGA1r2@q01\EcXB)><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.
@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$
ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/
+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E3
3\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`
%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC
/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no
-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU
+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])
ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*
GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ
?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%
>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,
>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3O
B64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1
/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=
+<XEG/g)VrF)c"*$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.
+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dE
IW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&
AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m
+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5
BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBu
F_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W
@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g,@OATD?)@;R,Y+E_a:A0>?,
+EMI<AKYhu@rcL/+Eh10F_,V:-[0KLCF:6CEZc`CDf'&5%15is/g+4d78cQ?9h@K/+=DAOEbd$3
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
E$lc4+>Y-YA0<6I%17&pC2.Zt1,2Nj/h1g\C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JGEp
$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,(C@De!lD2]uO>A7]9oH=gl-ATJ:f:-pQU1,(CADe!lD
0d'n8A7]9o5uU-B8N8RMA9Da.Et&IO67sB90JGJ)@rsF^+DG_7ATDm(A0=0:6V0j/2'?sOFED57
B-:o+FDi::De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU1,(FCA7]7)2B[$OGB.D>FCf>4
AoD]48g$,H0JO[Z$4R>OA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F++=ATh
-YdR1A7]p,C2[W*F`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?+CfP7Eb0-1
+EqaECM@[!+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%16igA7o7`C2[Wi4Y@j)C2[X(FDl22-OgCl
$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@
Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-
+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt-Qij*
%15is/g,+UF>%lZAS)AY6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+>=p!+>=63F)>i<FDuAE+E2?D
-[U;;IXNRQ$>"6dF(HIAH[\_=I4#I2-mrFN/8B*6B4#@fDe*3(+D58-+=DMb:4@U=%14Nn$4R>;
67sC%ATT%e:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m+EVNE@:OCnG%#K(%17/nDfp/@
F`\`RF`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=CoBA8lR(<HD_l
CLqd4-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+=BcW6m-Gh
De`inF<GX9FEMOM%13                                                        ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;,+>PfkH"q8.E,ol/Bl%?TGp#^T6m-#S@ruF'DIIR2+E2@>Anc'm~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
0fL41+>P&q+>Y`/0d&Fu1b^aCC2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
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
/g+2+Eag/*DKKH1Amo1\3XlEk67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2
FCfK1F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLifo$(
$;No?+<Ve9B4Z0qBk([l@ium:B4Z0-@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9
@s)X"DKI!D+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<][.Jdi&^67sB'+C\tpFCf]9Cgh$q
+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdLifo$($;No?+<Ve9B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+
Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcW?G+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<][.Jdi&^67sB'+C\tpFDkW'ARfh'+<Y<.F<GL2C1UmsF!,(8Df$V+@:O(qE-!-E+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLifo$($;No?+<Ve9DJXB*
@<,jk+<VdLF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&
+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0+<][.Jdi&^67sB'+C]52D0$gB+<VdL+<Y]9FEMVAF!,UC
BlS9,+C\bhCNXS=DfTB"Eb/c(Ch[s4+E(j7A8,OqBl@ltEd8d:@:O(qE$0%@D.7'sF!)SJ+<VdL
+<VdL+<VdLifo$($;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>
DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2
@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2
+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+
%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@s
DfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is
/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku
$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,
ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqB
DdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/
F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5
E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)
F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!
D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2
@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"
AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'
+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-
A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL
+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU
+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;
+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)
ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@
AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI
+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeG
F`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ck
C`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@
AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl
$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=
3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^
4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa
4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is
/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8
:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC+
+E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm
@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1r
FD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'
Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^
CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,
E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%
@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3
+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(
AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%
<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm
+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]
/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe
$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7O>$;No?+DtV)
AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<-S?bh%13OO:-pQUFE2)4
+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc
+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0F<G%$@r$4++DtV)AKYr#
FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#<$l$cFCfK6FE/f>$4R>;
67sa!DId9hE+NotASuU2                                                      ~>
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
D/X3$0JFVYDJW6gDeio<0d(%<;f-GgAM>e\B4Z0QBk)6rG]Zl$Deio<0Hb1M@:XIkF*',j0P"m-
FD5Z2@<-W9E-67s@<cZuD.QX_Deio<0IJ;#-p0UR/mg=U-Qm/BA0>W*A92j2Eb-UI/1<V34==l^
A92U+CLqU!F*)IN.4cl04?G0&0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp
+C]J-Ch.:!A7TCqFE2))F`_>9DBNV,F*)>@H"q8.+D>J1FDl2FC2[WnDdso)De*g-AT/c,De*g-
C/o=dEbf63F!,49A8lR-Anc'm+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCpt
FD>`)F)Q2A@q?d"H"q8.E,ol/Bl%?'E,o].De(4E/1<V9+>Ybu1,(FC0etF</i5OG1,:dB3Ahp7
0JPRA1GU^<1c7*F1-%*H2]sk00f^sD0JY7<1H@9M0f_*K+>PW*3AE9C1G1OD2E<`S2)ud70JPRA
1GL^=2`EWP1,:^F3?U(20f^pD0f1LA2`<NK1,UsM+>PW*3A<6D1bL^G2Dm6F2)[H;1,(FC0JbF?
/iP^I2)7-G0JO\*0JPRA1GL^=2`EWP1,:jF2]sk00f^pD0fUdC3B&`O2)I3I+>PW*3AE9C2D-jI
0etUA0JG:*1,(FC0JbI=/i5CC0JG4?3A_j60JPRA1GU^<1cI-C2`<KM3?U(20f^sC1-$sF0f^sH
2*!BL+>PW*3A<6D2(gaB1,h*O0Jb^31,(FC0JbF@/i>UE1b^gH0JXb+0JPRA1GLa>2)mHQ1GLjE
3$9t10f^pD0f:R@3&E?I1bq!E+>PW*3A<6D2(gaG2`E`N1cR?81,(FC0JbF@/i>UC2)[0K1bg+.
0JPRA1GLa>2*!?L1c@0F+>PW*3A<6E1+kCD2D[<P0JP:)1,(FC0JbF@/i>IG0f_*N3&r*:0JPRB
1,(R<2)-sC3&iZJ2]sk00f^sD0K1UA2)d<N1cR9M+>PW*3A<EJ2_HsA3AWNN1c%!31,(FC0JbF@
/i>ID0JYIF1bg+.0JPRB0JGC;2)?pC3&33C2]sk00f^sC1-$sF2)mTP1cI9N+>PW*3AE6D3A*3H
2*!HJ2_d<81,(FC0JbI>/i5@?2`NfP2`W!90JPRA1GU^<1bq'N2)I3I0d&5*0f^sD0JY7;3&WNI
2_[6L+>PW*3A<6E1+kC@1bpgH1,Lp41,(FC0etF</i>FF1c@'K2)QL30JPRB1,(L:2)dER3&NQR
+>PW*3AE9C3A**J0fV0N2)[?81,(FC0etFC/i,LB3&riR2Du[50JPRB1,(^@1H@0L3AiZP2BXb/
0f^sD0KCaA3AENJ0K(U@+>PW*3AE9C3A**J0fV0N3&*021,(FC0JbFC/iGRC1,([F3B/-:0JPRB
1,(X>1c.*M0fV$F3?U(20f^pD1,1C<1c@9M3&`NH+>PW*3A<6E1+kF?3B/iS3&<H81,(FC0etF<
/iGF@0fV*N2)QL30JPRB1,(U=1c73G2`!3J2'=Y.0f^sD0K1UA2E3KQ3AWBL+>PW*3AE9C1+kFE
1c@0M1,CX-1,(FC0etFA/i>OF2_m'G2DlU40JPRB1,(U=1b^aF3&NKK2BXb/0f^sD0K1UA2E*HH
0f(gE+>PW*3AE9C1+kI=0ebCC3&ruA1,(FC0JbI>/i5RH1H7?J0eje+0JPRB1,(L:1bgsE0f(gJ
3?U(20f^sD0JtI?0fUsG2DHsC+>PW*3AE9C2_HsH0K1gF3&rf<1,(FC0K:gH/i>=C1Gq'I1Gp:1
0JPRA1GLa>2)[-D1,:R@0d&5*0f^sB0K(O@1GCXF1,1LB+>PW*3AE6D3A*3J2E<ZT2_d-31,(FC
0ekFD/iGOD3AWEL0f^@30JPRB1,(R<2)[0G2_['F1*A>+0f^pD1,:I=1-%<O1c@-E.4cl01*AP%
1,(FC0etF>/i5IB0f1XE1bg+.0JPRA1GU^<2)@*H3A<BK+>PW*3AE9C1G1L?1,LjF1H.-51,(FC
0JbI>/i>L?0fCmH2)ZR40JPRB1,(X>2E<`P2_m6H1a"P-0f^pD0f:RA1c$jB0eb@C+>PW*3A<EJ
3A*0H0eb@C0JG=+1,(FC0JbFC/iGUB2DHsE2)ud70JPRB1,(X>2E<TP1c[<I1a"P-0f^pD1,:I>
1H7-M3&NEL+>PW*3AE9C1G1L?1,LjF1H.-51,(FC0JbI>/i>LA0JYXD0f:(/0JPRB1,(X>2_m0D
3A`NG2'=Y.0f^pD0f:RA1c@?L1c%'K+>PW*3A<EJ3A*0H0eb@C0JG=+1,(FC0JbFC/iGXB0f_6J
2DZd5-p07-1*eV/0f^pI1,ggB2_m-J3&<<F+>PW*3A<6D2(gaC2Dd3M1,(F*1,(FC0K:gH/i5LB
1,q6L1,9t-0JPRB1,(X>2)[EP3AE<H1FXk'4>JTF3A<6E1+kFA1,h-K3&riH3&iWF3AEBK3&WHK
2)R'A3B&F%/i"P(.4cl01*A;-,Vh&.3A<6D1bL^G2Dm6K3AEB61,(FC0JbF?/iP^I2)7*N0f:(/
0JPRB0ekC81cI*E0fCaE3$9t10f^pD0fUdC3B&WI2D@!F+>PW*3A<EJ3A*3D2_d!H2`*?61,(FC
0K:gH/i5FF1GLXF1a"P-0f^sD0K(O?3&<HK1c.'K+>PW*3A<6D2(g[E2*!NO1bq!41,(FC0JbF?
/iP^I2)6pG1c-=10JPRA1GL^=2`EWP1,:dF1a"P-0f^pD0f1LA2`<NK1,h$H+>PW*3AE9C3A*-G
2)R-I2*!W=1,(FC0etF@/i5RJ3&!<I2DlU40JPRB1,(^@1H@0M0JG@D+>PW*3AE9C3A**J0f^pB
0etR.1,(FC0ekC;/i5L@1GLdB2E2g70JPRB1,(^@1c.!B3AN?M+>PW*3AE9C3A*-E0f_*J1Gp:1
0JPRA3&3EF2)$pJ2D[*G0d&5*0f^sD0K(O@0fD!I0ebOG+>PW*3A<6D3A*-F3AifV0K(j41,(FC
0etFC/i,LB3&riS0f:(/0JPRB1,(^@1c%-N1,^sH2]sk00f^sD0KCaA3AEKR2)[EL+>PW*3AE9C
3A*-G2_[3J2)mH91,(FC0etF@/i>=C2`WQH2DZd5-p014/1<V7.4cl00I\P$4>8384>6      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
