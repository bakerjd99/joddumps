NB. JOD dictionary dump: 04 Dec 2019 14:16:22
NB. Generated with JOD version; 1.0.0 - dev; 16; 04 Dec 2019 14:15:23
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

JODTOOLSVMD=:'1.0.0 - dev';16;'04 Dec 2019 14:15:24'

JODVMD=:'1.0.0 - dev';16;'04 Dec 2019 14:15:23'

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
    case. DOCUMENT do. WORD bgetdocument__ST bnm
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST bnm
    case. EXPLAIN  do. TEST bgetexplain__ST bnm
    case. DOCUMENT do. TEST bgetdocument__ST bnm
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. GROUP bgslist__ST bnm  
    case. DEFAULT  do. GROUP bgetgstext__ST bnm
    case. EXPLAIN  do. GROUP bgetexplain__ST bnm
    case. DOCUMENT do. GROUP bgetdocument__ST bnm
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST bnm
    case. DEFAULT  do. SUITE bgetgstext__ST bnm
    case. EXPLAIN  do. SUITE bgetexplain__ST bnm
    case. DOCUMENT do. SUITE bgetdocument__ST bnm
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST bnm
    case. EXPLAIN  do. MACRO bgetexplain__ST bnm
    case. DOCUMENT do. MACRO bgetdocument__ST bnm
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
NB. monad:  bgetdicdoc ??
NB. dyad:  ?? bgetdicdoc ??

ok (<'NIMP bgetdicdoc'),<y
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok (<'NIMP bgetdocument'),<y
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get backup versions of short object explanations.
NB.
NB. monad:  bgetexplain ??
NB. dyad:  ?? bgetexplain ??

ok (<'NIMP bgetexplain'),<y
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

NB. object names and code
nnm=. 0 {"1 y [ obj=. 0{x 

NB. results are boxed name value tables
NB. words & macro have three columns
ro=. nnm ,"0 1 (1+obj e. WORD,MACRO)$a:

doj=. {:{.DPATH           NB. put dictionary object 
fsx=. (;obj{JDFILES),IJF  NB. backup file name suffix

NB. backup file path !(*)=: doj
pth=. ". ({.;dncn__doj obj),'P__doj'
pth=. (>:pth i: PATHDEL) {. pth

NB. name of backup subdirectory in JDSDIRS
pth=. pth , (;{:JDSDIRS) , PATHDEL

NB. fetch backup objects by backup number - optimizes file reads
ubn=. ~.bn=. ; 1 {"1 y
for_bob. ubn do.

  fn=. pth,(":bob),fsx NB. backup file

  NB. read backup directory index  errmsg: read failure
  if. badjr 'ixn ixc'=. jread fn;}.CNDIR do. jderr ERR088 return. end.

  NB. objects must exist in backup(s) errmsg: not in backups ->
  sn=. nnm {~ rx=. I. bob=bn
  if. 0 e. uv=. sn e. ixn do. (jderr ERR107),(sn #~ -.uv) ,&.> <NDOT,":bob return. end.

  NB. read object components
  if. badjr dat=. jread fn;(ixn i. sn){ixc do. jderr ERR088 return. end.

  NB. update results
  ro=. (>dat) rx} ro

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

NB.*tstamp v-- standard j 8.07 library timestamp.
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
0f1[/1,U10+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1Gg45+>tqs0eje.3$9q1+>Pku
1a"V4+>GPm1c?I21*AA5+>GSn1cQU40H`2-+>GSn1,L+4+>bbp1E\P1+?:Q'2BX_6+>bu!3?U17
+>P&p1E\D++>P_q0ea_*3$:+%0esk1+>l/NH:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk
/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!*?cCi`3E6rZrX
9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX
:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_<_YtS:IJ/X:J=\0G%G]8
Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCe04=AD.V7;ZIXBl/!0
+DbV,B67f0De:,&Bk)7!Df0!(Gp%!5D.Rct@:O(jF_ti1@rc-tASuU2+C\bhCNXS=E+*6l+Cf>4
DKI"0DIal!@:O(qE%c6CF*)>@@<?4%DBO%8D.Rd1@;Tsm@:O(qE+EC!ATMp&@;^-/E-67FA8,Oq
Bl@ltEd8d:@:O(qE$/b,Ch7Z1@;]TuEb0?8Ec,q@@UWb^F`8I6@<?(%@Uj(_@r#sjD.RcuBOt[h
F!+q#@r$4++DtV)AKYr#FED)7DKB9"ATVs(FE2),G%G_;DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2
@<-W9@UWb^F`;D2B4Z0qBk([l@qT@p+C\bhCNXS=G%G]8Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d<
De!p,ASuU!B4Z0qDe!p,ASuU&ATT&(@:O(qE$0=8EcYr5DK?q=Afu#$C1Ums+CoD#F_t]-FE:o(
ATVL.E,8rsDJ*O&+C\bhCNXS=G%G]8Bl@m1+E(j7F(fK4F<GL2C1Ums+D#e:Cgh3iFD5Z2F(/cn
FD#Z:AU&<0ATT&(@:O(qE$0=8EcYr5DK?q=Aft`,Dfp"PF*22=AKYYt@:WqiF(/cnFDkW'ARfh'
B4Z0-DdmHm@ruc7Ao_g,+C\bhCNXT;@V9auBleB/ATT&(@:O(qE$0=8EcYr5DK?q=Aft`,Dfp"P
F*22=AKYf'F*)J4DJX-'F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj@r$4+
+D,>(ATM<uCia/rEard(ARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;+D,P4
+EM76E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,r-F_PZ&C2[WmDf'H6ATMp(A7B[qCh.T0@3B0)
Ci"A>@rH4'Eb0<5ARloU:IH=ADdd0!FCfN8+EM%5BlJ0(BOt[h@UWb^FCfN8+D,P4+EV:.+E2@4
F(K6!AKYo'+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I8Bl%@%ARo@_BlkJ.Bk)7!Df0!(Gp%$7C1Ums
F)ki.ARTXkC2[WpBl7?q+A,Et+ED%0ARTXk+EMX9E-$)>Ch\!#DIIBnF)Yr0F<G%$@r$4++DtV)
AKYr#FED)7DBNG*FE;P4D/aQ<@;]UaEb$;-+?4IaFCB$*13@5IAKZ&9@;Ts+DerrqEZfI<D.Rd1
@;Ts+/Kf(FE,8rmARlp-Bln#2DIn#78g%YUAnc-sFD5Z2                             ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)l^;+>P&o0d&;51H$@10H`,+3B/-90H`)*1,C[.0ea_11,pC22]sh00f^@30d&5*1c$7/2]t(=
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
@<,p%Bl5&0@<6N5@UWb^F`7cs8p,2s:h='FBOuHP3Zr,h+>XH689JfcAU-[^Ed9f/+=B`'A8`T7
BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT+7%15UDA5mbeCh[NqF?MZ--8%Ik$>"6#FDYu5
Ddso/F`\`f3[[OBF*(5i@:Nt^Gp#Y#DJNg/6uR*k+@g?\<-N%mBkM+$-Qij*%15is/g+e<DImis
FCfM9CghC,+C\bhCNXS*$9g.jE+*6lA0>u)Bk)6-%15cp;cH(Y<D>V;+?M;#HQZd8C`k)X-Qij*
%15is/g+V3F(o,,G%#3$A0><$B6A'&DKKq/$>"6#@V97o+=Bd(F*(5i@:Nt^Gpa^W+<VdL+:SZh
EZeh(ATT%B8p,2s:h='FBOuH:/5/?.<'j>[9aqG@EZeh(ATT%V3[[OBF*(5i@:Nt^Gp#Y#DJNg/
6uR*k+@g?\<-N%mBkM+$-Qij*ATAo&B4Z0--p'I;8p,2s:h='FBOuH37rMp;GA1l-B4uB7.3L/g
/j:C?9L2TV6;CNT%144#+<Vd9$;No?+>=pIB4Z0--Z3@0ALATC+<VdL+<V+#:-pQU0Hah;ATT%B
DIIBn/n8gBDKI6K+:SZQ67sB7+C\tpF<G%/@r+J,@;TRs+<VdL%15is/g)kk@V97o+=D&8D.P(;
+<VdL+<Vd9$;No?+>G!JB4Z0--Z3@0AM.J2F`):K+<V+#:-pQU0d'q<ATT&(Ch%9J:18!NF!)SJ
+:SZQ67sB9+C\tpF<DrK@;TR'+<VdL+<VdL%15is/g)nl@V97o+=D&8D.P>0Dfor>-QjN@$;No?
+>P'KB4Z0-@VfOj6;Cs+ATJt:+<V+#:-pQU1E^.>ATT%BDIIBn-QjNS+<VdL+:SZQ67sB:+C\tp
F<DrK@;TR.@rHL-F=/1R%15is/g)qm@V97o+C].sCdLm*D.Rc2+<Vd9$;No?+>b3MB4Z0--Z3@0
ALATC+<VdL+<V+#:-pQU1a$7?ATT%BDIIBn/n8gBDKI6K+:SZQ67sB;+C\tpF<G%/@r+J,@;TRs
+<VdL%15is/g*"o@V97o+=D&8D.P(;+<VdL+<Vd9$;No?+>k9NB4Z0--Z3@0AM.J2F`):K+<V+#
:-pQU2'?@@ATT&(Ch%9J:18!NF!)SJ+:SZQ67sB7+?1KQB4Z0--Z3@0ALATC+<VdL%15is/g)hj
3$;[CATT%BDIIBn/n8gBDKI68$;No?+>=ot+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU0H`@u@V97o
+=D&8D.P(;+<VdL+:SZQ67sB7+?:QRB4Z0--Z3@0AM.J2F`):K%15is/g)hj3?VdDATT&(Ch%9J
:18!NF!)S7$;No?+>Fuu+C\tpF<DrK@;TR'+<VdL+<V+#:-pQU0d&Fu@V97o+=D&8D.P>0Dfor>
-OgDX67sB8+?1KQB4Z0-@VfOj6;Cs+ATJt:%15is/g)kk3?VdDATT%BDIIBn-QjNS+<Vd9$;No?
+>G!!+C\tpF<DrK@;TR.@rHL-F=.M):-pQU0d&J!@V97o+C].sCdLm*D.Rc2+:SZQ67sB9+?1KQ
B4Z0--Z3@0ALATC+<VdL%15is/g)nl3$;[CATT%BDIIBn/n8gBDKI68$;No?+>P'!+C\tpF<G%/
@r+J,@;TRs+<V+#:-pQU1*AS"@V97o+=D&8D.P(;+<VdL+:SZQ67sB9+?:QRB4Z0--Z3@0AM.J2
F`):K%15is/g)nl3?VdDATT&(Ch%9J:18!NF!)S7$;No?+>Y-"+C\tpF<DrK@;TR'+<VdL+<V+#
:-pQU1E\Y"@V97o+=D&8D.P>0Dfor>-OgDX67sB:+?1KQB4Z0-@VfOj6;Cs+ATJt:%15is/g)qm
3?VdDATT%BDIIBn-QjNS+<Vd9$;No?+>Y-#+C\tpF<DrK@;TR.@rHL-F=.M):-pQU1E\\#@V97o
+C].sCdLm*D.Rc2+:SZQ67sB;+?1KQB4Z0--Z3@0ALATC+<VdL%15is/g)tn3$;[CATT%BDIIBn
/n8gBDKI68$;No?+>b3#+C\tpF<G%/@r+J,@;TRs+<V+#:-pQU1a"e$@V97o+=D&8D.P(;+<VdL
+:SZQ67sB;+?:QRB4Z0--Z3@0AM.J2F`):K%15is/g)tn3?VdDATT&(Ch%9J:18!NF!)S7$;No?
+>k9NB4Z0--RU#Z+<VdL+<VdL+<V+#:-pQU2'?@@ATT%B/n8gBDKI6K+<VdL+:SZQ67sB<+C\tp
F<G%/@r+MNF`);B+<VdL%15is/g)nl0d'q<ATT%BDIIBn-QjNS+<Vd9$;No?+>P&o+C\tpF<DrK
@;TR.@rHL-F=.M):-pQU1*A:o@V97o+C].sCdLm*D.Rc2+:SZQ67sB:+>G!JB4Z0--Z3@0ALATC
+<VdL%15is/g)qm0d'q<ATT%BDIIBn/n8gBDKI68$;No?+>Y,p+C\tpF<G%/@r+J,@;TRs+<V+#
%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO+ET1e+C\c#
Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is
/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56FDi:=@<?!m
+DtV)ATKI5$;No?+<VdL+<W(SATMs.De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS+EDRG+=CuD
@:XIkF*')i0k>!.FD5Z2@<-W@%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F;A7]7+0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2^!0Q
ANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?+>Gim@<++Y+CSekARlo3E+*6lA18XC
D]ib3F*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI8F*%iu%16T`@s)g4ASuT4-XpM*AL@oo
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
+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^F`7cs%15is/g+kGF*2M7
+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI;BlbD=ATMr&$>"6#E+*6lA0>u)Bk)5o$>"6#E+*6l
A0>u)Bk)5o$4R>;67sC)DfTB0+D,Y4D'3e+Ecc#*F_kK,+C\bhCNXT;%15is/g+V>@r*9+AftPk
@r$4++Du==@V'R&A8cR2/0JM:3ZpOH/hnIr/i#480fL^>2D-^A/ho180f(F:1+k7;-OgDX67sBm
DfT]'FED))+EMHD@;Kmr@3BW0Ecc@FD..NrBHV28D.Ra%@j#i2Ecc@3$>"6#@W$=*F$2Q,@W$!)
-S?bU$=[d63ZpU@HX^l8D0%j$+FPjb@W$=*Et&Hc$>"6#@W$!)@V[)/+<VdL+<VdL+<VdL:-pQU
+C]5)+=Acr2^]^j+<Ve%67sBt@<?!mATJu&Cht5<DfTB0+DG^9B5)O#DBNCs@r$4+%16Ze+C]5)
+=D2@@OE^9CEO`B+<VdL+AP6U+<Y-2C`k*GAR[8H2^]^j:-pQUD..NrBOu6-@;Ka&GAhM4F!,OG
@<-I(DJ()9Bln#2-ZWd--Qm,@+D5D3ASrW"@:O(qE"*.cEZd%Y1E^.EC`k*:GUG%OCEO`B+<XEG
/g)8j+>Y-LDJUFCAU#g^2^]^j:-pQUGAhM4F!,%3A8,po+EqOABHS[6GUFVJDBNS+G%GP6@UWb^
F`7csATAnJ+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0d&7p@W$!)-Y7NT0fLI&+AP6U+EV19FE8R9
DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#1*A=p@W$!)-Z<NC/7NB;+<VdL:-pQU
+>P&p+C]5)+=D)</ho:4+<XEG/g+eIDfp#?+Cf>-FCAm$Bl7Q+F*1r5FE2)5B-8R?A1&L6DBNS+
G%GP6@UWb^F`7cs%16Ze+>=om+>G!JDJUFC674<nCEO`B+AP6U+CT)&+CSf(ATD7$+EMX5Ecc#5
B-;D4FD)dE673miDBNS+G%GP6@UWb^F`7cs%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,@W$!\
D/X3$0JH6g/h1=JCf>1hCLo1R+ET1e+=L]:CagK8EbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._
67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8c:$;No?+<VdL
+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67sB'%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_iig%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.
De!lD1*C"9C3=T>ARloqDfQsT3$C=>+Cf(nDJ*Mi$;No?+>GleARdDM+EV19F<G16EZf(6G%#3$
A0=JeDIIBnF!+n/A0>H#@V'(\ARlp"De!3lATJu&A7T7^%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$
3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;
D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0T
D/X3$FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$
%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
%172fBk)6J3ZoelATMs.De(OU-OgCl$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC#F`2A54ZXr<
-RU5l5U\01-RU8h.6o:+INUg85U\cB-RU8h.4G]5%15is/g+e<DImisFCcS'Cht55Df]u6@VfTu
G%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&Hc$;No?+EM%+EBQ?*5!!C1+>Y,_:-pQUF(Jd#
@q[!)F^]*#AnbgsEt&IO67sBqDIYgj+<VdLBeCMb+<XEG/g*b/GAhM4+DtV)AKYK!@<6K!$4R>;
67sC(@;KXg+DbV$F<DuV.3N&>B6A'&DKKq/$;No?+<VdL7;Q[KARlo++@KpRFD5Z2@<-W\De*F#
+<VdL+<VdL6tp.QBl@ltEd:#jA7]g\ARTUhBHSE?+<VdL=)W+i;e9BX@q\J0@;TRCCghC++<VdL
+<VdL+<XBe@rcKdARTUhBMDoFEc6&FE+KIc:-pQUCgh?s4ZX]64D?E%.3L/a-p/\-+AY<r771$L
6XO8:De*3(+=nW`/:/d@6:s[6<),ef@;9^k?R\'X@q]j2+=nW`/:/cr=&2^^?X[\fA7$cIF(8m'
4)$;i1asOu+=Jdf-nJ(Y6W-]e@;9^k?R\'X@q]jD9gM-E:K1In7:0J<De*3(%13OO:-pQUG%#3$
A0>o,B4uB0.![6a@<-"'D.RU,+E1b2FCfK1Et&IO67sB'+<Y64E--@J+C\bhCNXT+DKI!D+CT)&
Bl7Bg@r$4++<YN0FCT!)ARf:hF<D\KD..NrBPD?n@:O(qE"*.L67sC$@<-!D3Zodt+<W`g+=Ach
+<VdL+<Vdg+=AdODfor>-QkJn+<W%L@;TR'+<VdL+<W`g-Z3@0AM.J2F`):K%13OO:-pQUAoD^,
@<?Q5@;Ka&G%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&IO67sB.:-pQU-Qjra0d%T#+u(2a
3[QIC+>Fum+>P'd+u(2_4s279-Qll9C`k)S+=nX/3Zp."/0K9^-p2<SEb?gD/0I&pF`2A5-8%J)
Eaa!$%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>
F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+
,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBlEaa$#+CT/5+C\bhCNXT;+:SZG9KbEZHTHL++@K$l
<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD+>G!LBlY=_5tbQl6qf-Z.P>FMAg\#p%15is/g,7V
Gp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2D]iLt@r$4+F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2
@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)+=Act-OgCl$;No?+CfG'@<?''FD,]+AKYGj@r$4+
Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!ZmFD5Z2+>"^ID/aTB%159QHZ3D'CLeQ0A8,Oq%13OO
:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-Gg
ATVL)F>+.24tq>&@:O(`+EV..@rr.e+:SZQ67sC&BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C
-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%159QHZ3D'CLeQ0A8,Oq%13OO:-pQUF)Po,
+C\c#Bk&9"DK]H)Bk/>pEbBN3ASuU2+>"^IG]75(FCeu*ATDg0EX`@nATAo&DJUFC/n$+:$>sEq
+>b3MDJUFC/hJe*%16uaEZd+[@W$!)-S@#!%16uaEZeh/C`kD@$>sEq+C]5)+?V#!%13OO:-pQU
8g&"[D.Rc2GA2/4+D#D!ARo=_A0>],@ps1bF!+n3AKYl/F<G:8+A,Et+Co1rFD5Z2@<-'nEt&Io
ATAo&DJUFCBldWgGB.V>B.",qDImi2@W$!)-Y[X/?Y+ClDI6apEc5i.ATB.-$>sEq+C]5)+=D5P
Bl%TmGB.V>B4!"q$>sEq+C]5)+=CSE-QjNS+<Ve%67sBuDfd+1+A*bo@;TQb$4R>;67sBhE,]B+
A9/l'F`MM6DKI"5Bl\9:+C\bhCNXS=DKTf*ATAn&$;<`a<'j>[9g(N[-S?bt+?M;#HQZd8C`k)X
-Qij*DImi2@W$!)-Z+-9@UWeS-S.qW;cH(Y<D<o0DImi2@W$!)-Z+-9?XdGS-S.qW;cH(Y<D<o0
DImi2@W$!)-YddFF=(=#@<Z=+CaUc-5uU`L:/t!t$4R>;67sC%Df'&.@UX=l@j#JrASuU(FD5<-
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
Eb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?65
Cf>1hCLo1S:-pQ_@W$!\D/X3$0JO\l/M/(n@W$!2+Co2-E,8s.+E1b!CG0.*@r$4++Cno&ATKI5
$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P'
:-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/g)8G
$;No?+CfG'@<?'k3Zp130fa)ZE\]BZ$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0
>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO
ATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7F`M%9G@_n1@<Q3)F)Po,+C\bhCNXT;%16Ze
+E1b!CLeQ0A8,Oq%16Ze+E1b!CLeQ0A8,Oq%13OO:-pQU;eU)n+D#D!ARo=_A0>>i@r$4++Cno&
ATKIH<+oiaAKYMlFCfM9GA1l0+CT5.ARTTg$;No?+CT=6H=_,8+Cno&ATJu.DBNk6A7]d(@UWb^
F`;CS+B*2qATVX'ATJtd+C]&&@<-'nEt&IO67sBjBOPdkAKZ&4+Dl72BHVD1@<<W.@<?($+Eh=:
F(oQ1F!+t$DJjB7+ED%%A0;<g:-pQUDerrqEZeh*DIIR"ATKIH8T#YmBOQ!*@psFi+DG_7FCelk
+E(j7@3B)hFCbmg:-pQU@;[3!EcQ)=+Dk\2F(&]m+EqO9C`m1u+Co2-E,8s.ARmD&$>"6#0f1"^
DJUFC/gh)8%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&B4Z0QBk)6rG]Zl$Deio<0MXqe.VE=7
6tp.QAU&;qD/X3$0JFVk/M/)ZCi"68FE1f3AKWC6ATT@DA8,OqBl@ltEd8dLAU&<</e&._67r]S
:-pQU<+oue+EV19F<G:6Cisf@Eaa'$F!,OBD.Oh6FD56#AU,k:Df6gB.!R0`@<-"'D.RU,+Cf>#
ATJu4Ado)B67sB/B4Z06+EqL1DBNP&FCSuuDJ()6BOr;/A8,OqBl@ltEd8cMA8bt#D.RU,/g+,,
AKYMt@ruF'DIIR2%15is/g+\C@s)X"DKI"8F!+m6F(oN)Ch4`!C`mY.+C]V<ATKI5$;No?%15is
/g+,,ATME*@rGmhF!,")EbT].+D,Y4D'3b=BOu3,-td+5.3NPJFD5Z2F"SS,+Cf>4Ch+YsA7Qfm
De*Dg$;No?+EVNE,'%7-F_kK,BmO>7+EV:2F!)T7F`\a7F!,R<ATME*@<,p%@;Ka&BOPpuCh7[/
+DGpFF!)TCDfcEq:-pQUGAhMDBHV#2/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf
+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0JFk9C2dU'BHS[O
8l%iS78m/=FCfN8C2[W:0II;::-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp130fa)ZE\TE\$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#
AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgCl$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?
+CT)&+EV:.F(HJ+ATVEqATJu,ATT&:BOr<-@;TQuA8,OqBl@ltEd8dLAU&;+$>"6#2'?OCF<DqY
%16Ze+>k9#+D58-+=ANG$>"6#2'=h#0d(+?F<DqY%16Ze+>k9#+>=pNATT%B-OgCl$>sEq+>k9#
+>P'PATT%B-QjO,67sC$ATW'8DK?q3EcQ)=%16uaEZd4^?T0)MB4Z0--RT?1DImi22'=h#1E^=A
F<DqY%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,Ci<`mFCfN80eb:lBk)7!Df0!(Gtp[Y.Vs$3
A9;C(F>5I'A8,OqBl@ltEd8dL/M/)]Ddd0!0eb;++>RhF+E):2ATAo3Aftr!B5VF*F_#&+FCfN8
+Co1rFD5Z2@<-WG%15is/e&._67sC(ATD6gFD5SQ+CT>4F_t]2+=M>CF*)/8A2,bl.3NGF@:Wq[
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE:2b;eD.7's+>Gl:
3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`%^67sB80lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z/ibO@.h)h\67sB83,`;K0ea_m
E+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>aA8,Oq0edi83ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1-Zip@FD>`)0eb:8-OgCl$;No?
+E)41DBL?LA8,Oq0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRXEb'56GA2/4Dfp.EA7]@eDJ=!$
%16Ze+E(d5FC])qF>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1TDJU[J.=6IqA8Z32
-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%
67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL+E(d5FC])qF>5Io
%13OO:-pQUDfB9*+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7
/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1
+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is/g,+A
@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#TtFC])qF>5I'GRXuh
$;No?+EMXCEb-A;DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67FG^+HB$4R>;67sC$AT23hFCf!!
Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa/g<"mGpsjf/g_qn
+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd+ED%2@;TQu
G^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oW8h
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S3$<6QDIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)%15is/g,4KDg*=7Bk)7!Df0!(Gp%0M@<?Q"$9ieh+EM47GApu3F!,"-
A0?=D0F\?u$;No?+DG_7ATDl8FCfN8+EqaEA0>DoF(96)E-,f4DK?pKAU&<;ASl!$F`V+:De:,2
F`\a9Df'?"DIal'ATD?2%15:G/heD-+E2IF+=MXjA8Z3+-RU>c/1r&--Zip@F>5I'+Dl%;AKYi$
@;]dsB5D.#F!,R9F*&O8ATM@%BlJ0.Df0V=De:,#G%G]&B4W3%ASu.&BI=5r%15is/g,4KDg*=7
Bk)7!Df0!(Gp%0M@<?Q"$>"6#A8,QsINU<R$4R>;67sBjCi=B++=M>BBk)6>0JI`#+Co1rFD5Z2
@<-W9@;]Tu@r,^bDBO(@%16Ze+>Y-YA0<6I%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>REb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&E-67s
@<cZuD.QX_Deio<0MXqe.WBNP9jr9a@;TRSD/X3$0JFVk/M/)eATMr99gMlV5tscjCh7KsFD)e,
BOt[h/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2
@<-W9/Kf+GAKZ)+F*&O7Eb/[$ATVL)FC])qFD5Z2@<-'nEt&IO67sB'+<VdLEb/lo+=D8BF*)/8
A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?+<VdL+<VdL+<VdZ/hSac$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPS)@<+(^%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$4R>PDe!TlF)rIGD/a<0@p_Mf
6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OO:-pQUFEMVA+F.C4D.R`1Df-[,$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&
-Ta$l$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])q
F<Fd11E^UH+=ANG$>"6#A8lU$F<Dr/76s=C;FshV-OgCl$;No?+DkP&AKYl!D.Oi3Df6b7Df021
@;]Tu@<6L(B5Si$DeF36+Eh10F_)!h@VKIkGs+22-Xpe&CjBo,D.P(G9gMlV5tsdT@;9^k?R$ps
-OgD2@VKIkGptm;+DEGN1*A=]$4R>;67sBhFED)2E-*4ED]j"AF<E.XF(fK7Ch+Z#@;0Ne$>sEq
+EVI>Ci<f+E-67F@VKIkGp!P'%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,              ~>
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
0eb@*0ea_++>G_r1*A>40K:110H`+n1GCU>+>PVn1*A;*3&2U20H`+n1,(C:3$9q3+>P&q0Jtd3
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
0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B80:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZ
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
ANCqf1a#1t@j!N\0f^@21cd?K3\iN!@WcC$A86$nA8-+,EbT!*FD5Z21,2Nj/h1=QBl%<pDe*Bm
F*)G:@Wcd,Df-\=/M/)WF_kk:8l%htA8-+,EbT!*FD5Z2+C]J-Ch,.-$4R>;67sBjEb/[$AKZ)+
D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tD
C2[WlF_PZ&3B9*,4ZX]55s[eODe*="Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBMPI
6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^E
De(4C%13OO:-pQUB4Z0-8l%ht@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?
DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO:-pQUF(KG9A8-+,EbT!*FD5Z2+Co2,
ARfh#EbT*+%16i\A8-'I3ZoeB:IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$['
:IJ,\5t=@?6q0R9;BSS-6rR&N7n#gA6UXLD-OgDtA7TCp4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA
;BSS-6pX4/:JO;L;BSS-6rQHN8PiAS8Q$[':IIWR<)Z1V;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<j
Bl\8;0F\?u$;No?+D58'ATD4$AKYMtF*)G:@Wcd,Df-\=@rc:&FE7luF`:l"FCf3*A8PamBkCpt
F<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+:
:..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\
5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2
+A,Et;cH%Q779^F4%`::7nHZJ8Q$!)8l%iU9gg+HE+EC!ASQ-oF)Q2A@qB1nD/aP=8l%iR:K::[
78m/O7n#g;;@Nt*:IJ5X6m-M]Ch7$rASQ-o+A,Et;cH%Q779^F4%`::;cH%Q78QBA6qL9<8l%iR
<'a#C6r-0<8Q%WB:II]E<('ML6qL8c$4R>;67sBkATMs6Dg<I7F_PZ&+Dbt+@;KKa$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A7B[qCh,Od3F<4&%13OOBPDO0DfU,<De(U^
%13OOB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]%14=),9S]n0J5%%A7]p,/KcH2ART\'Eb-@\Df'H0ATVK+;IsZU@<6!&/KeqLF<GU8Ch7$r
ARlp/ATT@1$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\KVF)Y]#
Bjkg#?t+"i?m&rfF(HJ&A7T7^+EVNEA8-+(CghT3@UWb^F`8I8Bl%?'A79RkF!*%WF(Jo*?tsUj
/oY?5?k!Gc%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>pq-2$4R=b.NieND.Oi,@:O=rF!+n/A0>u*
F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_
F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss
3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4
D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:
@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1
+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6
BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLm
FD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'
Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-
ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n
%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq
+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9
DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3
Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/cr
F'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(n
DJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1W
AS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n
:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B
@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$
+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)
ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0
-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc
@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$r
AKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'
.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6
+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$
4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?
AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[
?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL
%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59
/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>
AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#
#mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNE
BQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H
@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;s
C`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b
.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN
%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#
+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"
8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63
+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.r
CjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7
Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq
+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7
Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#
+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm
$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0
+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4
+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-
+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(t
FD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuul
C2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+
Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$
+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7
;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//
G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmK
DffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm
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
ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^
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
4Ztqk4Ztq;$4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8Bl@l3@WcO,
+D,P4+A*b:/hf"&@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)
<affUDKKT1ALDOA6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe$6pc?+>>E./ibpM
+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSekARmD&$4R=e,9n<b/ibOE
3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LTFCB33+E(j7Eb0E.
F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;DerrqEcW@3DIak^:IH=A
@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,8l8P?%13OO+<W-VDIn#7
@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@%13OO%14=),9SZm3A*<P
1E\7l9jr;i1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#78ono_FE_/6AKXKWF@^O`
+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6UH@+D#(t
F<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[EE,Tc=+E_a>
DJ((a:IH=>DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%
1,(F@%13OO+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b
+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU0J5@<3B/]8
/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)@rc9mARl5W
+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<+EV%$Ch7Z1
@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc$6pc?+>>E.
/ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur
@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=
Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+
F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLs
F!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO
+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%
0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:g
B4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg
+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht
<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>49
2(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](
+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.
@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=
%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6
A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#
D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/io
Eb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF
+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l
$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$
/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(
Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%
0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+
A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</
Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8
E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6
De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et
+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`
Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/
+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1
Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j7
8g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&
F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7
C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16igA8lR#E&'.C
67sa&De*g-AT/c5/M/);:IH=EEb031De!@"F)Q(AF(96)E-*]A$;No?%15is/g+)7@<?'tASuU2
+DG^9FD,B0+EM%5BlJ/:@<,p%AU%crF`_2*+C\noDfTD38l%htBlbD5Ddd0fA1e;u%15is/g,7S
E$/t.G%GJ4ATDg0EZfIE@;m?$DfQt1DfTD38l%htGAhM4F!(o!C2[X(Am]7eDe*2t4ZX]>,$uHS
+=BcW6m,E2;cH1[+@\Xg9N=tZ3Zr6IF*&Ns+D#S6DfQsP4s23s?Q^mB><3l]1Eee61*@ql,$uHs
+C,E`%16igA93$;FCf<.@<?0iH=&fr1E\_$0F\?u$;No?.V`m4F*VhKASlBpFD)e?/M/)a@<?0*
De:+a:IH=HH#n(=D'1DQ0-G@JEc#N.@<?'k/e&._67r]S:-pQU:2b5c3ZrTSCh[E&AoD]48g$#E
0JO\YDIaku@W-F$/e&._67r]S:-pQUD/X<#A3(hUC2[X(H#n(=D/`p*BHUf$:hFEXAISuA67r]S
:-pQU+<YE;A93$;FCf<.@<?0*-YdL,F*(u6-OgCl$;No?+Co%qBl7Km+A*btH#n(=D'3Y5@psIn
Df-!k-u*^0FD)dEIUQbtDf0VLB4YslEa`c;C2[W9-RgTl+:SZ,%13OO@rGjn@<6K4-Xgb.A1%fn
8khTM<(0\J3Zr0UA93$;FCf<.@<?0*-YdL,F*(u6-QjNS+<VdL+<XEG/g+\9AmoguF<GF/F*(u6
+=J]lBkh6/+D,>(AISu=:IJ#W:I[K.+DPh*F*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(aF+AP6U
+Co%q@<HC.+E2@>Anc'm+EM%5BlJ/'$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%ht
A8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H
+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$;No?%15is
/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?
ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k
/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-
DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8
+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4
+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&
ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+Df]J4A8,Oq
Bl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&
F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-
FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is
/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49
D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBt
Bl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q
3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%
EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ
@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)V:-pQUD09Z:BlIm"+A,Et+DG_7
FCB&sATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&DId<h%16WbF(KG9-W3B378uuM-OgCl
$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(
@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4EbT&q+@S[c:JOha9LU'U+EM+9
+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j:-pQU:.\/V3ZqpTEcP`/FDQ4F
779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC.3K',779L=:/aq^7:0J<De+!4
Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGGA7]"UDe*E3AU%c1-OgDX67sBL
6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.
E+*9-.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX76sX>4ZX]I0Hb]b4$"a&
Df'&.GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+=Lr=De(:>ATDg0E\APP
ATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMH
F<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9
-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,
F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk
@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA
-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:
%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7
F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4
F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84
A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb
+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#
+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?
/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;u
BkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,
I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)
E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4
F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$
$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXH
Df?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F
/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2
EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6%16ci4ZX]?+D>S1DJUG"3Zri'
+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*
Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eIDfp#?
%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef@p`YZ
De*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1AhG38
@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U/g,Qp
+En8%.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+
GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;
$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'
1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,1E\_$
0F\@C+D>h;+F+D'3XlF1AhG38@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8Ec*KP
ASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;D_</N
CL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'5Xd:J
G9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is/g,4L
DJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)DfT@t
$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0FCfN8
-QjNS+<XEG/g,7IF*%iuF)5E44ZX]A+?CW!%14d3F)5E4+F+D'3XlF1AhG38@:Wka?X[\fA7$I#
CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&DKK5m
8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIE
AS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?Qa5L/g,1GG&JKN-Qlr</g,$S
Eb0?8Ec*KPASu$2%14M$/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+Ds=pI4fCH$7QDk%15is
/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RVYU
/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[FDP;m
C2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl$;No?
+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ3aEk4
+>G$#1+"ac$4R>;67sC"DfTr.@VfTu@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsE,Tc=@q]:kF$2Qg
3ZpF+3]A0/.k<,#.k<,#.sror,$uHs+C,E`%15is/g,@PDId[0F!,:A@qfI^+Cf>-F)Pl++C]86
+CoM$GA1r-+Cf(nEa`I"ATDi$$?p3%Ch$sg@<-EP3a4Wf3?^FB+=LYNH[[\-.qpUj0e";R+Boso
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
@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/+CT.u+CT>4De!KiFCcS)
De*Dg$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U+=]!cG]XB%D/)3p>p)3O1,0t[
+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%67sB1/o>$;CLh@-D@HqiEBQ?g
+?L]%0HsjH4!80X+<Ve%67sB1/ou#K%16rs4ZZjk4!6:6,$uHS+D5d=+<XEG/g)VrFCf\+$4R>;
67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-EbTK7%17#p4ZX]5Bkh]:-6tVp
3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=/0H;m-Qjr_-QjcZ/M;Jp>:C!g
+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&DfU+4$>OZG3a4WfEb/Zi+E)<1
$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq$>OB?3Zoh)+Z_;+5\bBM$4R>;
67sBsDdd0!C*7S-EbTK7+D,Y4D'3>,DJ!TqF`M&(+DN$<@<?/l$>ONC3ZqWf+>=s"0HaR\+?Uc]
E+*j%%13OO:-pQUDKTf*ATAo3Afu#$C1UmsF!*%WF`V,)+C]U=G%#E*Dfp+D.!9WGCi_$JD.-pp
Df[$LF(or3E-67R+CSnoE-67R+>,9!.3N>:+E2@4F(K62%15j+6;p$.+>GPZ$4R>;67sC)BOu3q
+CT+08K`.sARlomGp%0HD.Oi,@:O=rF!,X7Cis<1+=DAOEbd$FDfQsJBQ%a!-OgDX67sB^84?EF
5tsp63ZoeoDfTV@%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.
E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^Y
F(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'
C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?
+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5
ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7B
Ao_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a
:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&
DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[
E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g+
+EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@
D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgE"@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et
%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP.40H_qiA7]p3
%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL
%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=D
C3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kst
D0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b
/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6
A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARl
De*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&
0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!
0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'
DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=
F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&
Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.
+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=
@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c
:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1
%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T
%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$
EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5
FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;
%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'n
CggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm
:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-SR/5/ibpO
-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c
4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j
@kVS8A1hh3Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-
F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;i
D/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>
F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`
F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@
EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:
DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U
:JO&6-S[5-/heD"+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/h
GA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\
DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sI
C3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP
<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3
E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%
Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?
F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#R
E$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7
Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&
Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i
+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=H
Dfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.
8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A
%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH
%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq
,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`k
DImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%
DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od
@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-
A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$3                                     ~>
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
zz=:zz,'t bgetexplain bgetgstext bgetobjects bgslist bnlsearch bnums checkb'
zz=:zz,'ack checkntstamp checkopen checkpath checkput closedict createst de'
zz=:zz,'fwords delstuff delwordrefs didstats dnlsearch dupnames freedisk fr'
zz=:zz,'eedisklinux freediskmac freediskwin fullmonty getdicdoc getdocument'
zz=:zz,' getexplain getgstext getntstamp getobjects getrefs gslistnl inputd'
zz=:zz,'ict invappend invdelete invfetch invreplace islib iswriteable iswri'
zz=:zz,'teablelinux iswriteablewin jdatcreate jwordscreate loadalldirs load'
zz=:zz,'allrefs loadwords mainddir mnlsearch newdparms newregdict nlctn nlp'
zz=:zz,'fx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicd'
zz=:zz,'oc putexplain putgs putntstamp puttable puttexts putwords putwordxr'
zz=:zz,'s rpdtrim rplctable rplcwords sortdnub splitbname''                 '
zz=:3132{.zz
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
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkiU;D9gZ+@T1+0ebI-78d#<0K(%B;Go5'2]t\<8l%ihDKKH1Amo1\+A$lO
:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)9gMlV5tscj@UWb^DKTe=
@UWb^F`:l"FCfM9@Uj(_@r#sjD.Rc2@V97o+C\tpFC])qA8bs#@V97oA8bt#D.RU,+C\tpFCf]9
Cgh$q+C\tpFD#Z:AU&;>@V97oDdmHm@ruc7@V9auBleA=@W$!)@W$"'ARTUhBHUc,Bl%<pDe*?r
D/aN,F)to'+Cf(r@r#O^@r!2uA0>o(Ch7$rASQ-o+EML<Blmg%@;TQuFE;P4D/^V>F*(i-E&&di
/1<VC4"akp+=A:@B4Z0`D/X3$0JFVYDJVXJF(o,<0d'qCCf>1hCLo1R+C]5);f-GgAM>h]B4Z0Q
Bk)6rG]Zl$Deio<0Hb1M@:XIkF*',j0P"m-FD5Z2@<-W9E-67s@<cZuD.QX_Deio<0IJ;#-p0UR
/mg=U-Qm/BA0>W*A92j2Eb-UI/1<V34==l^A92U+CLqU!F*)IN.4cl04?G0&0d%hd8l%iA<CokP
84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+C]J-Ch.:!A7TCqFE2))F`_>9DBNV,F*)>@H"q8.
+D>J1FDl2FC2[WnDdso)De*g-AT/c,De*g-De<^"AKYhuDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUg
F_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*A>4,Vh&.3AE9C1+kCC2DR$H0KD!51,(FC0JbI>
/i5FB1,:jF1cHO40JPRB1,(I92)@6L2DI3L2'=Y.0f^sD0Jb==2`<ZU2)RB:1,(FC0JbF?/iP^I
2)6pE2E;m80JPRA1GL^=2`EWP1,:^F3?U(20f^pD0f1LA2`<NK1,UsM+>PW*3A<6D1bL^G2Dm6L
0eb=)1,(FC0JbF?/iP^I2)6pI1,g=20JPRA1GLjA2*!TO2)R3K1E\G,0f^pD1,1C<1c@$A0fM*L
+>PW*3A<6E1+kCB0ebOE1c7991,(FC0ekFD/iGFE0fCmL0fC.00JPRA1GLa>2)@!H2E<HI3?U(2
0f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG2)mBH3&3H91,(FC0JbF@/i>UF0f:dC2_cF10JPRA
1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&*9K0fV!E+>PW*3A<6D2(gaH0K1gH1bg+.0JPRA1GU^<
1c[HM3&iTH0d&5*0f^pD0f:R@1c[9N2)mQU+>PW*3A<EJ2_HsA3AWNN1c%!31,(FC0JbF@/i>ID
0JYIF1bg+.0JPRB0JGC;2)?pC3&33C2]sk00f^sC1-$sF2)mTP1cI9N+>PW*3AE6D3A*3H2*!HJ
2_d<81,(FC0JbI>/i5@?2`NfP2`W!90JPRA1GU^<1bq'N2)I3I0d&5*0f^sD0JY7;3&WNI2_[6L
+>PW*3A<6E1+kC@1bpgH1,Lp41,(FC0etF</i>FF1c@'K2)QL30JPRB1,(L:2)dER3&NQR+>PW*
3AE9C1bLXG1b^X?0fV!41,(FC0etF>/i>XG0JP@<3&Da50JPRB1,(O;2*!KI0f(OD1a"P-0f^sD
0JkC>3A`EG2DI$I+>PW*3AE9C1bLXG1b^XD1,Ud/1,(FC0JbFC/iGRC1,([F3B/-:0JPRA1GU[;
1c.*L2)mNK1*A>+0f^pD1,:I>1H@EO2`NTO+>PW*3AE9C1+kI>1bgsK2`3H81,(FC0etF>/i>LG
1,CmD1G^./0JPRB1,(I92)mEO1c%-M3?U(20f^sD0JY7<3A`WN3&39E+>PW*3AE9C1+kFE1,UaB
2*!K91,(FC0etF</i>XK2_m6F3&Mg60JPRB1,(L:2D@-M0JGC?1a"P-0f^sD0JY7=0JP7;3&ioY
+>PW*3A<6E1+kCD2D[<P0JP:)1,(FC0etF=/i5:B0ekIE2E;m80JPRA3&3EF2)%$H2)[9I2'=Y.
0f^pD0f:R@2D?mA1,1U?+>PW*3AE3A2D-jC0JkaE0ekU01,(FC0ekFD/iGUG3AriU0f1".0JPRB
0etaA2Dd9O1GUmD3?U(20f^pD1,:I=1Gq!I2`<HO+>PW*3A<6E1+kC=3B/lQ2D[':/1<V9+?(Q$
0JPRB1,(O;1c@-E1bq!H0d&5*0f^pD1,:I>1Gq!L0K1g21,(FC0etF=/i5@>1c7*G2`)X40JPRA
1GU^<2)R'B2Dm?L2BXb/0f^pD0f:RA1c$jB0eb@C+>PW*3A<EJ3A*0H0eb@C0JG=+1,(FC0JbFC
/iGUB2DHsE2)ud70JPRB1,(O;2*!EN1,LjJ1a"P-0f^pD1,:I>1H7-M3&NEL+>PW*3AE9C1G1L?
1,LjF1H.-51,(FC0JbI>/i>LA0JYXD0f:(/0JPRA1GLa>2Dd<P1,LdG2BXb/0f^pI1-$sE2)-d?
3A<-D+>PW*3A<6D3%d*J0JPRJ0K(^9/1<V9+>P2t0JPRA3&3EF1cI0F3&i]L1*A>+0f^pD0f:R@
1c@0H3AN9C+>PW*3A<EJ2_HpG1,:gK1GU^.1,(FC0etF=/i>RH1H@?O0KCR5-p07=0f^pD1,:I>
2)7*L1cRKQ.l]LC/ibXD2)mKJ2Dm?G0KD'ABeD.`0e"Y%4>J$60I/D-0f^pD0f1LA2`<NK2`WTM
+>PW*3A<6D1bL^G2Dm6K3AEB61,(FC0ekC;/i5L@1GLdB2E2g70JPRA1GLjA2*!TL1,^gD1a"P-
0f^pI1-$sF0K1^?3B&cO+>PW*3A<EJ2_HpE3&<9E3A_j60JPRA1GLa>1H76P2)R3G2]sk00f^pD
0f1LA2`<NK1,h$H+>PW*3A<6D1bL^G2Dm6F2`*?61,(FC0JbF?/iP^I2)6pG1c-=10JPRB1,(O;
2*!KI1Gq0O1*A>+0f^sD0JkC>3A`EG3AN?H+>PW*3AE6C0eP:A0JbFA0fD!61,(FC0K:gJ/iGC?
1H.'D0K(%/0JPRA3&3KH2D@'E0KD'K1a"P-0f^pI1,ggC0K(mK1GUgB+>PW*3A<6D3A*-F3AifV
0K(j41,(FC0etF>/i>XG0JPC>2_lL20JPRB1,(O;2*!KI0fUjF3$9t10f^sD0JkC>3A`EE2`3?I
.4cl00I\P$4>838-p014/1<V7.4dS8                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
