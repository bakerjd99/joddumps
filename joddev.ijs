NB. JOD dictionary dump: 29 Nov 2019 16:12:01
NB. Generated with JOD version; 1.0.0 - dev; 10; 29 Nov 2019 15:49:09
NB. J version: j901/j64avx/windows/beta-q/commercial/www.jsoftware.com/2019-11-17T14:06:15
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


ERR105=:'unreadable or missing backup timestamp'

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.0 - dev';10;'29 Nov 2019 15:49:09'

JODVMD=:'1.0.0 - dev';10;'29 Nov 2019 15:49:09'

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

bchecknames=:3 : 0

NB.*bchecknames v-- checks backup name patterns.
NB.
NB. monad:  bchecknames blclBnames
NB.
NB.   bchecknames <;._1' booo hhh re.12 bx.14 er.99'

msg=. ERR010  NB. errmsg: invalid name pattern
if. +./ badcl&> y do. jderr msg return. end.
ok 'NIMP: bchecknames'
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
NB.
NB.   NB. get a suite header from particular backup
NB.   3 bget 'sweet.04'
NB.
NB.   NB. three versions of a group's header - similar to (get) where
NB.   NB. (2 get 'group') returns the group header
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's word list

WORD bget y
:
msg=. ERR001

if. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. are backups present?
if. badrc uv=. checkback__ST {:0{DPATH__ST do. uv return. else. bn=. rv uv end.

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

bgetdicdoc=:3 : 0

NB.*bgetdicdoc v-- get backup versions of the dictionary document.
NB.
NB. monad:  bgetdicdoc ??
NB. dyad:  ?? bgetdicdoc ??

ok 'NIMP bgetdicdoc'
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok 'NIMP bgetdocument'
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get backup versions of short object explanations.
NB.
NB. monad:  bgetexplain ??
NB. dyad:  ?? bgetexplain ??

ok 'NIMP bgetexplain'
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. monad:  bgetgstext ??
NB. dyad:  ?? bgetgstext ??

ok 'NIMP bgetgstext'
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. monad:  bgetobjects ??
NB. dyad:  ?? bgetobjects ??

ok 'NIMP bgetobjects'
)

bgslist=:4 : 0

NB.*bgslist v-- get backup versions of group/suite lists.
NB.
NB. monad:  bgslist ??
NB. dyad:  ?? bgslist ??

ok 'NIMP bgslist'
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
0ebR00f^@3+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1Gg45+>tqs0eje.3$9q1+>Pku
1a"V4+>Y,t1*AS"2`;d53$:%9+?:Q%1*A=p1,C%-0H`,,+>GPm1,pC7+>GVo2]st<8U=!)6tpO\
ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[Ws
DKKH1Amo1\.7nhX:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ
+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4
F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<
CLnVsDIal#@<?'T6!-lJ9gro-G\M#;D'3Y+DJ+')+E(j7A8,OqBl@ltEd8dF@;TRs@UWb^DKTf1
DI[]uD.RU,F!+q#@r$4++E1b!CER,*F`):D@;]Tu@UWb^F`9!SATMs3Eaa'(Df-\>Bl.F&FCB$*
@UWb^F`:l"FCfN7@ps7r+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I8Bl%@%+CT.u+ED%8F`MA@+C\bh
CNXS=A79RkF(/WmARfLn@;TRs@q]F`CNCV-@:O(qE$0%,D.Oi/@<?U&Ec,r-B4Z1*ATVs,AThX+
+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;@W$!uBleA=DdmHm@ruc7Bl5&4F`\a:
Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(qE$/b,Ch7ZsDJXB*@<,jkF(Jd#@q]Fp+E2IF+Co1rFD5Z2
@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0@WcC$
A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7
@q]F`CLU^^CNO-/F<G16EZfI;AKYr4ATMF#@q?d$Afu&8F<G+.@ruF'DIIR2+C\bhCNXS=Anc'm
F(JlnA8--.A8,OqBl@ltEd8dG@VTIaFE;J6Ch7$rASQ-oAnc-kC`l>G6m-M]Ch7$rAKZ&9AT2^3
E,961@W#UkATMg,BlkJ,@:O(qE$0%,D.Oi/@<?U&Ec*"0Cij`?@;Tt)FCB&t@<,m$C*5KXF*(i-
E&)NLD.Oi2FCB$*+E)(,ATAo8Bl.F&FCB$*+>"^VAT2Ho@qB0nGA2/4+Dtb7+A*beAS,XoBln'-
D?                                                                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1bg+1+>P&o0H`,+3B/-90H`A23$9q7+>GT*3?U(3+>PW-1E\D2+?2;;@W$!K@<6-m0JQ<h/h1=J
CdMQOBk&hO+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5F<G[:F*)IU%15is/e&._67sBh
F)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1
BHVM;Eb'56FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(SATMs.De(OV.3N>G+Dbt)A7]9o@X0)<
BOr<.ATMrS+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!
ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?+>Gim@<++Y
+CSekARlo3E+*6lA18XCD]ib3F*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI8F*%iu%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6"48D
Bk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FC])qF?MZ--Zip@FD>`)0JOpa$4R>;67sC&BOu3q+Dl7BF<G%(+CT.1DfB9*+Co1rFD5Z2@<-W&
$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k*GAR[8H1a`_>%16Ze+E(d5FC])qF:ARP
67sC)DfTB0+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZeh/C`k)Q%13OO:-pQUFCfN8F!,(8
Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAnJ+C]5)+=ANG$4R>;67sBlF<G()FCfK$%16Ze+>P'K
DJUFC-OgDoEZd.\@W$!)-RT?1ATAnM+C]5)+=ANG$4R>;67sBiDJUFi:K(4d=WhQqEcQ)=F!,"2
C`m>.EZfI;AKYi.F*&O7F`MM6DKI"1@:O(qE$-_TAU%]rE-)Nr:-pQU@W$!)Df0B:+EM+&Earco
F!+m6F(oN)Ch4`.F`\a:Bk)7!Df0!(Gp$R)@r$4++EV:.Eb-A-F!,@=+E1b2BFP;D67sBoASu!h
+EV:.Eb-A%Eb-A2D]j"-FD)e8Eb&a%+ED%7F_l/@+Dbb-ANCqV0Ha^W+CoA++=ANG$>"6#1a"Rs
@W$!)-XT8;<$re2:-pQUD.-ppDf[%4DIdI!B-;D4FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bhCNXS*
$>"6#1*A=p@W$!)-Z<NC+<VdL:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC+DG^9
@s)g4ASuT4@UWb^F`7cs%16Ze+>=om+>=pIDJUFC-QjNS+AP6U+CT)&+Du+?DK?q7DBNG3EcP`/
F<G%$@r$4+%16Ze+>=om+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^
F`7cs%15is/g+kGF*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI;BlbD=ATMr&$>"6#E+*6l
A0>u)Bk)5o$>"6#E+*6lA0>u)Bk)5o$4R>;67sC)DfTB0+D,Y4D'3e+Ecc#*F_kK,+C\bhCNXT;
%15is/g+V>@r*9+AftPk@r$4++Du==@V'R&A8cR2/0JM:3ZpOH/hnIr/i#480fL^>2D-^A/ho18
0f(F:1+k7;-OgDX67sBmDfT]'FED))+EMHD@;Kmr@3BW0Ecc@FD..NrBHV28D.Ra%@j#i2Ecc@3
$>"6#@W$=*F$2Q,@W$!)-S?bU$=[d63ZpU@HX^l8D0%j$+FPjb@W$=*Et&Hc$>"6#@W$!)@V[)/
+<VdL+<VdL+<VdL:-pQU+C]5)+=Acr2^]^j+<Ve%67sBt@<?!mATJu&Cht5<DfTB0+DG^9B5)O#
DBNCs@r$4+%16Ze+C]5)+=D2@@OE^9CEO`B+<VdL+AP6U+<Y-2C`k*GAR[8H2^]^j:-pQUD..Nr
BOu6-@;Ka&GAhM4F!,OG@<-I(DJ()9Bln#2-ZWd--Qm,@+D5D3ASrW"@:O(qE"*.cEZd%Y1E^.E
C`k*:GUG%OCEO`B+<XEG/g)8j+>Y-LDJUFCAU#g^2^]^j:-pQUGAhM4F!,%3A8,po+EqOABHS[6
GUFVJDBNS+G%GP6@UWb^F`7csATAnJ+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0d&7p@W$!)-Y7NT
0fLI&+AP6U+EV19FE8R9DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#1*A=p@W$!)
-Z<NC/7NB;+<VdL:-pQU+>P&p+C]5)+=D)</ho:4+<XEG/g+eIDfp#?+Cf>-FCAm$Bl7Q+F*1r5
FE2)5B-8R?A1&L6DBNS+G%GP6@UWb^F`7cs%16Ze+>=om+>G!JDJUFC674<nCEO`B+AP6U+CT)&
+CSf(ATD7$+EMX5Ecc#5B-;D4FD)dE673miDBNS+G%GP6@UWb^F`7cs%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eG@<6-m3B9*,@W$!\D/X3$0JQ<h/h1=JCf>1hCLo1S+ET1e+=L]:CagK;Ble60@<iu7@:O(+
@UWb^F`8I6@<?(%/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d
+Co1rFD5Z2@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8
C2[W:0II;::-pQU+:SZQ67sBjEb/[$ARmhE1,(FCD..H?1(=Rc67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm
-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5
FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBpDKBr@AKZ2.+D>2,AKZ&4
D.Oi!@:O(qE,uHqATAo4@:O(`+EV..@rr.eATAo4@:O(`+EV..@rr.e%15is/g+)+Dg*=8D.7'e
A7]9o@UWb^F`8I6@<?(%/g+,,ATME*A79RkF!,[@Cht5&E,]AsEX`@N67sBhF!,d?Ec3(2@<?(%
+DG^9DerrqEZeh"@r$4+F"SS6Df''-Bl.F&+A*bcBl7@"Bk;>p$;No?+Cf(nDJ*N'F)N1<F^o)-
FD,*)+DbJ.ATAo:ATDj+Df0V=@ps7mDfd+BART*l%15is/g,(KA7]d(@VK^gEbT*+/g*`'+EV:*
F<G(%F(HJ.DKBo2@:UL!AftM)A79Rk%15is/g+S?+D#S6DfQt;ATMp$B4W30Bl%T.@V$ZmBle60
@<lEp/e&/!EZd(n+C]5)+=Ach%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,%16`ZF@9hQFCf]=
;f-GgAM>f567sa#ATU=S@ru:,FAm$pCLo1R+ET1e+DGY.F`VYF@<?''-td+5.3N/8@ruF'DIIR2
+EV1>FE9&D$;No?%15is/g+,,BlbD=ATMr9Bl%U.F*)G2FCfM9F)Po,+<koA@r#Y$/RiX:+s8:Y
.3N&>B6A'&DKI"2De*F#+E(j$$;No?+=Ll6F=A>VBOu'(An?'oBPD?s+EV:.+<Y3/@ruF'DIIR2
+<Y35@s)X"DKIKR<+ohcA8,OqBl@ltEd8*$:-pQUA8bt#D.RU,+DGm>@3BW*DJ*cs+Cf41De:,$
H$!V=/e&._67r]S:-pQU<+oiaAKYK$A7]g)A7]dqG%De.Ec5e;DffZ(EZccCATT@DDfBf4Df0VK
+A!\cDfol,+CSek+Cf>#AISuA67sC&D]g6EAS6.%@<-(.AKi7=BPDN1+C]J8+CT=6FD,6,AKYE%
AKYDtC`mD"Ec#W(F)rI<F=2,P+Du+>%15is/g,@VEcbt;Blks:$;No?%15is/g+SDF*2>2F#ja;
:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.
De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjEb/[$ARmhE1,(FCD..H>2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'
AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2
AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd1
1E^UH+=ANG$4R>;67sBhCht59BOu6r+D,2,@q]Fp+D58-+EV:.+ELt.AKYMt@ruF'DIIR2+EV1>
F:ARgEZd4^B4Z0--RT?1ATAnN+?(EUATT%B-OgDoEZd4^2]sgtB4Z0--RT?1ATAnN+?(Ds+D58-
+=ANG$4R>[ATAnN+?(Du+D58-+=ANZ+AP6U+ED%8F`MA@+D#S6DfQ9oDImi22'?6b+<Y<.F<DqY
%16uaEZd4^2]sn!B4Z0--RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?T@@:XIkF*',j0P"m-
FD5Z2@<-Wg67sa(Ddd0uATMrJ0JI$O@ruF'DIIR2+ET1e+Dbt)A0<T\0R+]qDIal.Eb&a%+E(j7
D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8
C2[W;0JFpuCi<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f
$;No?+>Gio@rsFZ+E_X6@<?'k+D,P4+A*b9/hf3n$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0
>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFZGWe)1-Zip@FD>`)0eb:/%172fBk)6>0JI`73ZoelATMs.
De(RV0JFj`$4R>;67sC!E+No0.!0!6@rsFZGUXbDDIal&ATT&'Ec6)<A0<T\0JG1'GAhM4F!,[@
FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>0R+$65'nn)G^+Hr3Zp+!0ea__ATT%C0eb:90L$e1
/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)B4kj?3Zr'UE$-MU+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+AP6U+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGT[G&B4kj?3Zri'+D5>"%16Ze
+>Y-YA0>u)Bk)6>0R+$6%15is/g,(OASrV=FC])qF>5I'GUXbDDIal#ASbq"AKYDtC`mq?Eb'5B
+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?pATAo3A0>u)Bk)6>0JI_\$8EZ-+E(_1+Co&"
-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s
+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6l
A0>u)Bk)6>0JI_\$4R>;67sC%FDl22+EqaEA9/1e5'nn)F(fK9E+*g/+>=om0Hb=WF<GgQGRXuh
$;No?+ED%4ART[lA8HN6@q]:gB4W30DfTA2DIIBnF!+n/A0>r8DfTCu$?B]q@;TR=3Zp.5+?CVm
.!mQj0d(`j+>#2m-RU#a-U940/j:C?+u(2a3Zot++=MIa+<u.\+=eRK/g)Ba-OgDHHS-F^BQ&*6
@<6K40H`)(+E2IF+=JodEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPm
E-67F-nuibAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1*CUK
DIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtf+ED%2@;TQuG^+H^
+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K&hEb0,sD.Oi7G^(Y[-p1p!4"r+3
+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oE,fAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh
+EM47GApu3F!*.Z0ea_hF`\`S2B[$ODIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/
+>=om0Hb=WF<Dtj+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF
+=K2lEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&I?
HS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sBpDKBB0F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1+=LfG
FE1r0AKZ,:AKYo'+E2IF+Cf>,D..<m+D>>,ALS&q5'nn9+?1K_F`\`SI4f&JC`k)Q.3L/o+?V#n
ATMrJ0JFVdDfTD3D.R-nBl7R"ATMo8FCfN8+Co&)@rc:&FD5Z2F!,C5+CTG)Ea`Tl+DbV,B67f7
%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZen,A0?=D0F\?u$;No?+Cf5+F(HIBFC])q
F>5I'GUXbGBk)7!Df0!(Gp$O5A0>AuARTI!F`7csATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B
;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,%17&sFA61gDIIBn;f-GgAM>f567sa,F`^>dG]$r,AQ*GaCLo1R+ET1e+EV19F<F:D
=AD.V73HDXDJ+')+Cf(r@r!\+$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gp"[]F(Jo*FCfN8+CfG'@<?(&ATMs(Bk)7!Df0!(Bk;>p$;No?+<VdL
+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67sB'+<VdL+<VdL
+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3Gi2F
0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R=O$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,7YEc*"F@;TjmEZf:<+:S["ATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b
%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgDoEZen3F(KG9-W3B!6s!8X<(//D$4R>;67sBt@;BEs
DIIBn+EVO?+Dbt6B-:W#A0><%F(o9)+C]8%F`S[K@;L't%16QYB5DiV3ZoeZBkM7-DIIBn-S.tX
=AD.V7:0J<De*3"-W;B%$7K@tB5DiB4ZX^"/g)nl1(=R"$;No?+CTA6ASlC.+EVNEE-67F/Kf+J
Dfol,+D,%rC^g_hATAo8D/a<0@j#`5F<G%,B5Di9%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F;                                                                       ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A>,+>c&oDdd0uATMrJ0JI$O@ruF'DIIR2Ci<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIl
FEM,*+EV19F<G+.@ruF'DIIR2                                                 ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*A>+2E2g70H`+n1,1[A+>PVn1*A;*3&2U20H`+n1,(C:3$9q3+>P&q0Jtd3
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
0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBJ4:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZ
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
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC+>G`71c[TN3=95<Bl%<p
De*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$nA8-+,EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:
@Wcd,Df-\,F_PZ&/e&-s$;No?+CfG'@<?''FCf<.DfT9,Gp%<LEbfB,B-;#/@ps1b%16T`@s)g4
ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K@WcC$A2uY1
-QlV9@rGq!@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu
+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?
%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]Bl%<&F`_>6
Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!
A1%fn%15is/g,4HF<G+.F*)G:@Wcd,Df-\.Bl[cpFDl26ATJ:fC1LjhE]lH+-V@0&;cH%Q779^F
+A,Et7nHZJ8Q$[':IJ,W<Dl1Q;cH%Q779^F+A,Et;cH%Q78QBA6qL9!8l%iR<'a#C6r-0<8Q$oF
$>O*^BlZ?t+DPFtBlY=I+=A:(:II]E<('ML6qL9!8l%i@6psgG6qL9!8l%iR6W-KP<(';U+A,Et
79EMf6qL9(+:SZ+C1LjhE[a.4+EM+9@WcC$A7TCpF!*.G$4R>;67sBnASu("@<?''A8-+,EbT!*
FD5Z2+EM%5BlJ08%175sA79RkC2[X"@;]dkATMr90F\@]:IJ5X6m,r]Bl%<pDe*?rD/aN,F)to'
+A,Et;cH%Q779^F4%`::7nHZJ8Q%WB:IIK:6r-QG8Q%WB:IJ,K;Fs\a6qL8c$;+)^<)6:`;cZU\
+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'+A,Et;cH%Q779^F4%`::79EMf6qL9<8l%iR6W-KP<(';U
%15^'6rm#M+E_X6@<?'qDe*BmF*)G:@Wcd,Df-[i:IJ,\5t=@38Q%WB:II]E<(';U%15^'6rm#M
+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C6qL8c$;+)^<_Yt)Eb0&u@<6!pDe't_
:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA6UXLD4%`::7nHZJ:I@NA;@NsB$;No?
+Co&)FE2;F+C]J-Ch+Z)De!3lAISuVDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
C2[WlF_PZ&3B9*,%13OO%16c_F*)>@H"q8.1,fXL%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7
Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.40Han;Fs&@Z-q7cVFEMV8
+@C'aE,9*-AKXl^Ch7$rAKWQIDJsV>Eb0&u@<6!j+F.O?.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,
ARlo8+EM+*+CJr&A1hh3Amc&T%144-+<Y`EARfF_C`m+pDJW]'@psFi+CSekARlp*D]iS)F)Yr(
Gp$R)@r$4++D,>(AKYMlFCfM9/Kf+GAKYAqDe(J>A7f3Y$6Tcb+=\L<?t*b[FC64`F`;VJATAne
@:ELj.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&
@q]:gB4Z-:%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$r
AKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@
?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;
FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et
/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,
?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<
3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&
ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB
;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1
+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!
FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-
+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^h
A0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU
:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqo
Df0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4
Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;
FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.Cggda
Ci^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@
$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1
A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*
A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`
>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b
/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&h
BOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7
FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]Tu
FD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7
F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmKDeO#D
0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j
+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#
EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59
/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>
$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4
F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%
%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<
A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'
@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"
+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3
+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#
+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@u
A7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.
Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%ht
GAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z
+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL
+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWs
AKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7Zln
Df'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@
+:/>`$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&
@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9
?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNE
F(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[
AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_
Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:m
F('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.
CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-
+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4
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
%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+
DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+q
F*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;
C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN
3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#
+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7
@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2
/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-
@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&
Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k
+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-
F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4
D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK
@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'o
BHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tp
F<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6
+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+
DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>
+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<
A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$
A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2
%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5
$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"
DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,R
DImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(
ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'
F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?
BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*
DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7
ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P
@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%
+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL
+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17
+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=
%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9
$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.
DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-
+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4
F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6
DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(
Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=
Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+
A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(
ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6
DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.D
D]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBk
F_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1
%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]
/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(
+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrp
DerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$
B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C
@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5
Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$
AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(
Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^
DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9
$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_a
Ch.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQt
DJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO
+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4
?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5
Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1
F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9
@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S
/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=
+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm
@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1
+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg
+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*Qo
Bk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*
H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0
F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)
Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&
F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa
@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`
F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#
F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu
+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L
+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*
B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5
.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlot
DBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*
1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE
1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7
ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>
BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE
+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!4
0d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`
DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"
Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&
A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9
+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`
>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%F
D]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.Ge
BOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%
FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;
@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5
B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1
+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG
%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:
BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(
+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#
+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT
4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4
DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkT
Ec<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#
+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13
E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"
@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+
3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.
H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''
-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/
A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXF
Bl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_o
F)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,
AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,
+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@
?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPp
BlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImis
CbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO
+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj
+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jk
Bl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';
Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33
Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D
+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',
+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*
1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<
@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ
+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=D
C3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB
/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>
F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/
DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8
Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCq
Gp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(
H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'
ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$
ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@lt
EbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.
FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<
Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu
+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].
F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&
@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et
;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"
DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:
+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d+
+A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs
@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(
A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt
%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(
C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5
DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb
+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@
Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&n
De*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P
/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LA
C2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#
+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'
+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/
FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0-
-RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34
/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1
+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloq
Ec5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'
/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFC
AT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4
+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)
?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9
$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];
Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1
+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5
F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[
A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&
FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%p
CLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os
+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2
BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<
1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.
DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,
F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?
De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3l
GA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>
+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-
+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#
+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu
+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'
ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-
G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.
Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T
-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?Ke
Fa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4
DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_t
F`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.
GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u
+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.
GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=
$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F
0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1
F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@o
A7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*K
C2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8
ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ
+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm
+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>
A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6
G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&
A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0
Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu
+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT
+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai
<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-
+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A
?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:
F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsm
Eb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7
F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5
ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)
BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNE
Ci=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#
.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA
%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3
Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1
Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m
+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^V
ARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LS
AS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZU
F_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og
/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3
D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4
C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?
+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"
%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5
E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE
?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO
0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U/
/KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB
%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>
A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2
AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgL
FCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t
@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$
DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5
B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3
DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL
%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibpP+>"^%F_>i<
F<E>!/0H]%0f][M%144#.NinGEcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?
+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78
F(Jj'Bl@l3@:Wn[A1eu6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(
Cg\B,ARfgrDf-\+A7T7^/e&-s$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,S
Gp%6KA79Rk.1HUn$6UH@+EMX5Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47
/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg
+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#
EbSs"+CT5.ASu$mGV0F4%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F
@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9
/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+
A8-92FDi:2ATW$*EX`?u+<VeJF`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1
F"Rn/%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?
+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8
@ruF'DBN@uA7]:(+<V+#%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'
Df'H.?m'Q"B-:S1001OF3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',
B-8U?@;TR,>@VJXF)tV<G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%
DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?
G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhn
FC65"DIaktE-681+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?
ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%
E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=)
,9SZm3A*<N0d&%j9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0
CCLU[$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n
+EMgGFCBD:A8bt#D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1
%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!
+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:
/NGaC.1HUn$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]u
D.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO
,9nEU0J5@<3AVd0+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3l
G%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9
+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9
+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#
,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!
+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9
ARlp*D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[0
0.@>;%14=),9SZm3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:
F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%
+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''
@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu
@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)
@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!
FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/
B4W_F%144#+D>2)+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7
DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aM
Bln#2FD,5.%144#+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qB
BPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))
F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr
-Z^D@Bl[cpFDl26ATKI5$6TcbC2[X%Eb02F0ht%f.V`m4E,oN/+EK+d+A,Et+E2@4E,ol,ATMp2
EZfF5EbTK7/e&._67r]S:-pQU;flGiASl!rFE8R=DBO%7BlbD<@rc:&F<G"4AKYQ/ARfk)ARlom
AS,k$AKXT@6m-2b+Dbt)A7]:(%13OO:-pQUFDl+@Ch7d$C`m;0Ec5t@FE1f/+D,P4+Cf>1AKXT@
6m-\lEb'56%16igA92?iBkhQs?Q_Km+>>!H+?L\n8l%ht;d!$u784mo5tOaM;FNVhCghC,+A*bf
EcQ)=+>#c"-R)n?/0J.X+>GYq3\`B4-RU*F+Boso%13OOC2[X(H#n(=D/`p*BO?'m4ZYAA3Zp*c
$4R>;67sa&De*p7F*(u1E+*j%+Ef=g+E1b2BHV5*+A,Et+EMgLFCf;3/Kc\hFCfK0Bl7@$ARmD&
$;No?%15is/g*o-FCdKUG%#3$A0>K&EZdss2D-[<+CT.u+CS_tG%E98$;No?%15is/g,"LDII':
+<YE;A93$;FCf<.@<?0*@r+tRBl%>i$;No?%15is/g)8ZC2[X(H#n(=D/`p*BHS[;D..L-ATB.-
$4R>;67sBkAS,XoARloU+EMgLFCf;3Ci<flFD5Z2%14LuE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A1o;Z/9r?I$7QDk%16T`@r,RpF!)i=C2[W1%15^%5uU`O;E[&`C2[X(H#n(=D/`p*BHS[;D..L-
ATB.@+<VdL+<VdL:-pQUA7]@]F_l.BD..L-ATAnA.P>FMAgnj7Bl%>i$;+)^:f:(Y4ZX^#De*p7
F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-QjO,67sBkAS,@nCige=Ec5Q(Ch4`1@rc:&F:ARlDe*g-
De<^"AMPu867sa&De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU
6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?
+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A
%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cM
DdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F
+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z
8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO
67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$
H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,
+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB
$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j7
8g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlH
F_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e
:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'
Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9
+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"
GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.
1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%ht
Bl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+B
ARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHU
C2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn
%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+
F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+G
AKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%
F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^Je
Ea`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<
AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is/g+4d78cQ?9h@K/
+=Ci@D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4
ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"B
F_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl
$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq
$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?
A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^
A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u
.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?
+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HY
C2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2
+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A
+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8
Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/
$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"A
F`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu
@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'
A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*
EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t
4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn
$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3
DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<
DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)
EccC4$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"
EcXB)+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.
+BplLI4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?
E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt
@:O=r%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7
DfTB0%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA
/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V
+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!
+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>
+<XEG/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQU
F(Jd#@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk
+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi
+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2
,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/
$>F*)+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA
/g+_CA1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z
+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG
/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=63
0HbFQAU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_C
A1e;u.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImis
FCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?
@UWef@p`YZDe*2tDETTpEb0E4+=ANZA8a(CDBNt2FEMVA/g+_CA1e;u-uLRgF"&4VINU3p4"u"*
0d(O#/heD\Ci<d(-9`Pi4YD.8D@Hq%%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#
4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U
9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4
?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(
FEMVA+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+E27>FCAWpAKYH#GT^O;
@<ZF'B-:\t@<,ddFCfK6%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LM`L+Boso%13OO
:-pQUGA1r*Dg-7FCis6%A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&J#Bl7`s@q]:k
F$2Qg3ZpF+3]A00@4lnU0fCOr/ho(0,$uHs+C,E`%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW
<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%
%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP
+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ8
4ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfM
Ch[a#FCeu*FCAWpAKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"
DKI"8DBL?MFD5Q4.1HW)ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL
-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI
1GU:@5U\E33\W!3.1HUn$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%
DIIWuA0>u*G]Y&[+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5
+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\
.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\
.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUks
BlkJ>AU&;MD.-ppDf[%0DIakuF)u80Bjl*p+Cf>#AISugF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM
4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"
?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQB657=+AP6U+=]!bEGQ'kD0S3)
>p)3O1,:%\+?L]YF<D\K:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8
AmoguF<G<@F(96)E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g
+=A9`/q+pK.3L/a-S?bh/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8
ASlB/A8-'q@ruX0Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9
F`V,7+EV13E"*.hCcsg%-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0F(96)E-*47Ec5e;@rH6sBkMR/
ARlou+E1b2BFP;`E'66)><3l\+Z_;"><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm@ruc7
/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,
Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+EqL1Eb-A%D'2CmF`V,)+C]U=F)Po,+DkOsEc6"AG%#30
ATJtAGAhM;-Qm>J+=Ci@D.P(($;No?+BM*&;FNlG8Nf*W-[0KLCF9Pu%15is/g+\ID/^V.EbT].
+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k8PVZO
<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O
+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]
83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=
.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1
%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6
DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#
:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)D.-ppDfZ?p%15is
/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s.
.1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\ucF_>5rFs(jCF_;h>
FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-QlV91E^UH+=ANG$>j3h
BkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!
Df0!(Gpa%.<^fnb8P`)E3[ZX70J5%%/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI
:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B
;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$K
C3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'a
CG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARl
De*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.
Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;
De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk
.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\
4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1
AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8
@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a
+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)j
Dfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5
AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k
+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.
+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$Hm
Ec5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[
8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.
9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm
@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9
F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8
A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#.1HW$@;]dkATMs.
De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRX
D.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE3B/Aq$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-
F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\
DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$7QDk;FO8J5uU383Zodt%15Kl
;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#
F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=L
BkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#
D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3h
BkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97
C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hen3+>"^HATfF1$:[fb6q(!:3[\QO
DImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c
4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2
Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a
0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,
@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>
/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$
A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c
:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.D
FD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB
/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG
@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.
-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9
F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImis
CbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h
+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1C
D]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R
+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#
+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe
+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo
%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#
+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HU~>
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
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 INVGROUPS INVMACROS INVS'
zz=:zz,'UITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 O'
zz=:zz,'K056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT '
zz=:zz,'READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwords'
zz=:zz,' backupdates badcn bchecknames bgetdicdoc bgetdocument bgetexplain '
zz=:zz,'bgetgstext bgetobjects bgslist bnlsearch bnums checkback checkntsta'
zz=:zz,'mp checkopen checkpath checkput closedict createst defwords delstuf'
zz=:zz,'f delwordrefs didstats dnlsearch dupnames freedisk freedisklinux fr'
zz=:zz,'eediskmac freediskwin fullmonty getdicdoc getdocument getexplain ge'
zz=:zz,'tgstext getntstamp getobjects getrefs gslistnl inputdict invappend '
zz=:zz,'invdelete invfetch invreplace islib iswriteable iswriteablelinux is'
zz=:zz,'writeablewin jdatcreate jwordscreate loadalldirs loadallrefs loadwo'
zz=:zz,'rds mainddir mnlsearch newdparms newregdict nlctn nlpfx nlsfx nubnl'
zz=:zz,'ctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc putexplain '
zz=:zz,'putgs putntstamp puttable puttexts putwords putwordxrs rpdtrim rplc'
zz=:zz,'table rplcwords sortdnub splitbname''                               '
zz=:3118{.zz
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
zz=:zz,',<<;._1 '' jodsmoketests bnlSmoke00 bnlSmoke01 compjSmoke00 compjSmo'
zz=:zz,'ke01 didSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeMacroTexts ed'
zz=:zz,'Smoke00 globsSmokeAssign000 globsSmokeDoc00 grpSmoke00 jodageSmokeD'
zz=:zz,'ays00 mnlSmokeArgs00 newdSmokeBadArguments00 odSmokeArgFail00 rxsBa'
zz=:zz,'dSmoke00 rxsSmoke00 rxsgetSmoke00''                                 '
zz=:302{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkiU;DBj_+A$lO:IJo7FCfK)@:Njk8U=!)7!*?cCi^^jH:gt$F`_>8FCfK)
@:Njk8l%iS:JXY_<_Yt)8l%iU9gg*u6!-lJ9gp16@:O(jF_r71@:O(qE+EC!ATJu'@q]F`CMmQt
ATJu'B4Z0-@V97oA8,OaDdso!B4Z0qDe!p,ASuT4@V97oAU&01@;0U%@V97oB6/0+G]Y';B4Z1'
@VTIaFE8R6B6.m'F*&O6DJUG)DJXB*@<,jk+C]J-Ch.:!A7KOpE,oN2F(Jl)@q]F`CLU^^CER2!
+ED%0ARTXkC2[W*F)Yr0FCK,rD.Oi3F*(i-E$07DFCB$*1++M%-p0UR/mg=U-Qll9CdMQOBk&hO
+C]5);f-GgAM>h]B4Z0QBk)6rG]Zl$Deio<0Hb1M@:XIkF*',j0P"m-FD5Z2@<-W9E-67s@<cZu
D.QX_Deio<0IJ;#-p0UR/mg=U-Qm/BA0>W*A92j2Eb-UI/1<V34==l^A92U+CLqU!F*)IN.4cl0
4?G0&0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+C]J-Ch.:!A7TCqFE2))
F`_>9DBNV,F*)>@H"q8.+D>J1FDl2FC2[WnDdso)De*g-AT/c,De*g-De<^"AKYhuDJ<]oF*)/8
A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*A>1,Vh&.3A<6E1+kC@
1bpgH1,Lp41,(FC0JbF?/iP^I2)6pE2E;m80JPRA1GL^=2`EWP1,:^F3?U(20f^pD0f1LA2`<NK
1,UsM+>PW*3A<6D1bL^G2Dm6L0eb=)1,(FC0JbF?/iP^I2)6pI1,g=20JPRA1GLjA2*!TO2)R3K
1E\G,0f^pD1,1C<1c@$A0fM*L+>PW*3A<6E1+kCB0ebOE1c7991,(FC0ekFD/iGFE0fCmL0fC.0
0JPRA1GLa>2)@!H2E<HI3?U(20f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG2)mBH3&3H91,(FC
0JbF@/i>UF0f:dC2_cF10JPRA1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&*9K0fV!E+>PW*3A<6D
2(gaH0K1gH1bg+.0JPRA1GU^<1c[HM3&iTH0d&5*0f^pD0f:R@1c[9N2)mQU+>PW*3A<EJ2_HsA
3AWNN1c%!31,(FC0JbF@/i>ID0JYIF1bg+.0JPRB0JGC;2)?pC3&33C2]sk00f^sC1-$sF2)mTP
1cI9N+>PW*3AE6D3A*3H2*!HJ2_d<81,(FC0JbI>/i5@?2`NfP2`W!90JPRA1GU^<1bq'N2)I3I
0d&5*0f^pD1,:I=2)I'D3ANEM+>PW*3AE6D3A*3I3AE<K1H.'31,(FC0ekFD/iGRI0f(aE2_lL2
0JPRB0etaA2DmKL1H.*K1*A>+0f^sC1-$sF2*!BJ1,:[D+>PW*3AE6D3A*3I3AE<K2`!641,(FC
0JbFC/iGRC1,([F3B/-:0JPRA1GU[;1c.*L2)mNK1*A>+0f^pD1,:I>1H@EO2`NTO+>PW*3AE6D
3A*3I1H%*M0fL410JPRB0JGC;2*!?K1GUgG3?U(20f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG
2)mBH3&3H91,(FC0JbF@/i>UH0JG=C2_lL20JPRA1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&<?I
1,:aJ+>PW*3A<6D2(gaH3&`NH1cI971,(FC0JbI>/i5RH1H7?J0eje+0JPRB0etaA2Dm3K1GgmH
2BXb/0f^pI1,ggC0KCpH2Dd3I+>PW*3A<6D2(gaE0JYC=0f1U-1,(FC0eb:>/i>F=1cR6F0fL41
0JPRB0etaA2E!HR2E3WM1a"P-0f^sC1-$sF1c79L1,gpJ+>PW*3A<6E1+kC>2)I3M2D[<81,(FC
0JbI>/i5=D3&NNN1GL=0-p07-2'aq20f^pD1,:I>1Gq!L0K1g21,(FC0JbI>/i>L?0fCmH2)ZR4
0JPRA1GLa>2Dd3E1GLR=3?U(20f^pI1-$sE2)-d?3A<-D+>PW*3A<6D3%d*I0fCaA2)RB:1,(FC
0JbI>/i>FE1-%<O0fL410JPRA1GU^<2)R-C1-%*E2'=Y.0f^pD0f:RA1c@?L1c%'K+>PW*3A<EJ
3A*0H0eb@C0JG=+1,(FC0JbFC/iGXB0f_6J2DZd5-p07-1*eV/0f^pI1,ggB2_m-J3&<<F+>PW*
3A<6D2(gaC2Dd3M1,(F*1,(FC0K:gH/i5LB1,q6L1,9t-0JPRB0etaA2Dm9M2)m<F1ast(4>JTF
3A<6E1+kFA1,h-K3&riH0J5%50JYOA3&<KQ2)d3C2`WiO1GpXr/i"P(.4cl01*A;*,Vh&.3A<6D
1bL^G2Dm6K3AEB61,(FC0JbF?/iP^I2)7*N0f:(/0JPRB0ekC81cI*E0fCaE3$9t10f^pD0fUdC
3B&WI2D@!F+>PW*3A<EJ3A*3D2_d!H2`*?61,(FC0K:gH/i5FF1GLXF1a"P-0f^pD0f:R>3&N]R
2)I'I+>PW*3A<6D1bL^G2Dm6F2`*?61,(FC0JbF?/iP^I2)6pG1c-=10JPRA1GL^=2`EWP1,:dF
1a"P-0f^sC1-$sF2*!BJ1,:[D+>PW*3AE6D3A*3I3AE?G2`Nc>1,(FC0ekC;/i5L@1GLdB2E2g7
0JPRA3&3KH2D?sD2_m*A2BXb/0f^pI1-$sF0K1^?3B&cO+>PW*3A<EJ2_HsA2E3TN1,Ud/1,(FC
0JbFD/i5CF2*!WM2E)a60JPRB0etaA2DmKL1H.0J2]sk00f^sC1-$sF2*!BI2`ENK+>PW*3AE6D
3A*3I3AE<K2)I6@/1<V7.4cl00I\P$4>838-p014/3GT                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
