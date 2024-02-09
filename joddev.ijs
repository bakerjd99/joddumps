NB. sha256:b2f70e87c1e486474dbfa056733a632d2ddb31dfabe406ecb6bd766f04a7c9f4
NB. JOD dictionary dump: 09 Feb 2024 11:28:05
NB. Generated with JOD version; 1.1.1 - dev; 7; 09 Feb 2024 09:59:59
NB. J version: j9.5.2/j64avx2/windows/commercial/www.jsoftware.com/2024-02-02T18:42:49/clang-16-0-6/SLEEF=1
NB. JOD put dictionary path: /joddev/jod/utils
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|335777767984232392329146217471784198516|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BYTESIZE=:15

CNMFDLOG=:10

CNMFPARMS=:7

CNMFTAB=:2

CREATION=:13

DPATH=:0 4$00

DPLIMIT=:64

DUMPMSG5=:'NB. JOD put dictionary path: '

ERR0161=:'cannot prefix hash ->'

ERR031=:'backup hash failure ->'

ERR213=:'cannot write backup hash file ->'

HASH=:17

HASHFSX=:'jhashes.txt'

HASHHDR=:'--sha256--'

IPYNB=:32

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.1 - dev';6;'09 Feb 2024 09:59:59'

JODVMD=:'1.1.1 - dev';7;'09 Feb 2024 09:59:59'

LASTPUT=:14

LEAN=:33

NAMECLASS=:12

OK010=:'close and reopen to activate - paths forced to ->'

ZIG=:34

jodliterateVMD=:'1.0.1';12;'17 Jan 2024 11:26:34 MT'

jodliterate_hashdateurl=:<;._1 '|68a0738c766e2b831526e807a4b956c1741724c7727f1e609daf797c8f0c5e75|17 Jan 2024 11:26:34 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


backnum=:3 : 0

NB.*backnum v-- updates backup pack count and backup/restoration timestamp.
NB.
NB. monad:  backnum iaNxtBack
NB.
NB.   backnum 11 NB. typical call

NB. HARDCODE: pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (y) 0}nums else. nums=. 0 , 6!:0'' end.
((0{nums) , 6!:0'') jreplace WF;1
<.y NB. integer result
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
NB.   17 bnl '.'  NB. check backup files against hashes

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT

NB. backup dates and hash checks first
if. spc=.(0{x) e. INPUT,HASH
    spc *. (,NDOT__ST)-:alltrim y do. x bnlsearch__ST y return. end.

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

elseif. bdot *. HASH={.x do.

  NB. check all backup file hashes
  hashbchk ''

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

NB. prefix built script with SHA256 hash comment
s=. toJ s 
s=. ('NB. sha256:',sha256 s),LF,s

NB. test hash match
assert. (':' afterstr LF beforestr s) -: sha256 LF afterstr s

NB. save compressed load scripts
smoutput 'output file locations:'
s write showpass JODADDONFILE
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
NB. 23mar19 add SHA256 hash to generated script

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

NB. prefix built script with SHA256 hash comment
s=. toJ s 
s=. ('NB. sha256:',sha256 s),LF,s

NB. test hash match
assert. (':' afterstr LF beforestr s) -: sha256 LF afterstr s

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

chkhashdmp=:3 : 0

NB.*chkhashdmp v-- checks dump script hash against contents.
NB.
NB. monad:  pa =. chkhashdmp clFile
NB.
NB.   chkhashdmp_ajod_ '~addons/general/jodsource/joddev.ijs'

NB. j profile !(*)=. jpath
ijs=. (read jpath y)-.CR
(':'&afterstr LF&beforestr ijs)-:sha256 LF&afterstr ijs
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

    NB. cannot change dictionary parameters for older dictionaries
    NB. that are not fully binary compatible with J 9.04+
    if. badrc msgbin=. binverchk DL do. msgbin return. end.

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

    NB. Modify path settings in dictionary files ignoring any
    NB. READONLY settings. The primary use is resetting paths
    NB. in READONLY dictionaries that have been moved. NOTE: this
    NB. is the only option that does not respect read/write settings
    NB. it may also fail if the target files are locked down by the OS
    if. 'FORCEMASTERPATH'-:y do.
      if. badjr dat=. jread JMASTER;CNMFTAB    do. jderr ERR088 return. end.
      if. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088 return. end.
      NB. master file dictionary path HARDCODE 2
      NB. search must succeed as this dictionary is open
      mastpath=. ;2 { (>dat) {"1~ (0{>dat) i. <DNAME__DL
      NB. replace dictionary path prefixes with master path
      NB. HARDCODE _2 exploits syntax of JOD paths 
      dicpaths=. (<mastpath) ,&.> }.@;@(_2&{.)&.> <;.1&.> (>dpt) {~ PARMDIRS
      dpt=. <dicpaths (PARMDIRS)} >dpt
      if. badreps dpt jreplace WF__DL;CNPARMS__ST  do. jderr ERR017 return.
      else.
        ok DNAME__DL;OK010;mastpath return.
      end.
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

NB. note path of first (put) dictionary
head=. head,LF,DUMPMSG5 , ;{: 1 { >1{did~ 0

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

fopix=:1: i.~ [ +/@:e.&> [: < [: < ]

fullmonty=:[: ".&.> ([: < [) ,&.> [: locsfx ]

globs=:3 : 0

NB.*globs v-- analyze, report and store global names
NB.
NB. monad:  globs clName
NB.
NB.   globs 'word'    NB. list globals in locale word
NB.
NB. dyad:   iaCode globs clName
NB.
NB.   NB. stores global references of word in dictionary
NB.   0 globs 'word'
NB.
NB.   1 globs 'test'  NB. list globals in test

0 globals y
:
if. (,x)-:,REFERENCE do. 1 globals y
elseif. badcl y do. jderr ERR002 NB. errmsg: invalid name(s)
elseif.do.
  select. x
  case. WORD do.
    if. badrc uv=. checkput__ST 0  do. uv return. else. DL=. 1 { uv end.
    if. badrc uvbin=. binverchk DL do. uvbin return. end.
    if. badrc y=. checknames__ST y do. y return. else. y=. ,>}.y end.
    if. badrc uv=. (WORD;<DL) inputdict__ST <y  do. uv return. end.
    if. badrc uv=. WORD getobjects__ST y do. uv return. else. uv=. ,1 {:: uv end.
    if. 0=>1{uv do. ok '<',y,'>',OK002 return. end.
    if. badrc uv=. 0 namecats__MK ];._2 (>2{uv),LF do. uv return. end.
    (y;<DL) putwordxrs__ST }.uv
  case. TEST do.
    if. badrc uv=. TEST get y do. uv return. else. uv=. ,1 {:: uv end.
    NB. return references in stored test text
    0 namecats__MK ];._2 (>1{uv),LF
  case.do. jderr ERR001  NB. errmsg: invalid option(s)
  end.
end.
)

hashback=:4 : 0

NB.*hashback v-- writes a text sidecar file of backup hashes.
NB.
NB. dyad:  blclDcfiles hashback blcl

bckfiles=. x [ target=. 2 }. y [ bckpath=. ;1{y [ pfn=. ;0{y

NB. backup hashes NIMP: check for sha256 '' null hash - indicates failure
hashes=. ctl ;"1 (' ' ,&.> bckfiles) ,.~ sha256@(read :: ''"_)&.> target

NB. time and j version - object nouns !(*)=. DNAME DIDNUM
head=. HASHHDR,' ' [ dictid=. ' ',DNAME,' ',":DIDNUM 
hashes=. (ctl (head,(tstamp''),dictid) ,: head , 9!:14''),LF,hashes

NB. write hashes file 
sidecar=. bckpath,(":pfn),HASHFSX 
if. _1 -: hashes (write :: _1:) sidecar do. (jderr ERR213),<sidecar else. OK end.
)

hashbchk=:3 : 0

NB.*hashbchk v-- checks hashes of backup files.
NB.
NB. monad:  hashbchk iaBacknum|zl
NB.
NB.   hashbchk ''  NB. check all backups
NB.   hashbchk 42  NB. check backup 42

NB. put dictionary object
DL=. {:0{DPATH

NB. ordered list of backup numbers
if. badrc bnums=. checkback DL do. bnums return. 
else. 
  bnums=. >1{bnums [ bpath=. BAK__DL
end.

if. badil ,y do.
  NB. checks all backup files in backup directory 
  chktab=. (<bpath) hashrep&> <"0 bnums
  ok <chktab ,~ (<''),(<'(n)') ,&.> JDFILES
else.
  NB. tests a single dictionary backup
  if. bnums e.~ pfn=. 0{,y do. ok <bpath hashrep pfn
  else. (jderr ERR106),<":pfn
  end.
end.
)

hashrep=:4 : 0

NB.*hashrep v-- backup hash report.
NB.
NB. dyad:  bl =. clPath hashrep iaPfn

if. fex <jhashes=. x,(":y),HASHFSX do.
  NB. (n)jhashes.txt file exists - check hashes
  txt=. (read jhashes)-.CR
  txt=. <;._2 txt,(LF={:txt)}.LF
  NB. drop header lines
  txt=. txt #~ -. +./@(HASHHDR&E.)&> txt
  NB. split out hashes and files
  txt=. <;._1&> ' ' ,&.> txt
  NB. to pass the backup files must exist and the hashes must match
  filesok=. fex (<x) ,&.> 1 {"1 txt
  NB. compare hashes
  hashcmp=.(0 {"1 txt) -:&> sha256@(read :: ''"_)&.> (<x) ,&.> 1 {"1 txt
  NB. if any backup file is missing all fail
  y;<"0 filesok *. hashcmp
else.
  NB. (n)jhashes.txt missing - null result
  y;(#JDFILES)#<''
end.
)

htclip=:[ (] }.~ [: >: ] i. [) ] }.~ [: - [: >: [ i.~ [: |. ]

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

NB. allow older system to run but nag the user to upgrade
if. jvn < 801 do.
  0 0 $ (1!:2&2) 'WARNING: JOD works best with current J 8.x-9.x systems - upgrade!'
end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  NB. J's before 6.02 are beyond the pale
  msg=. 'JOD requires J 8.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 8.x-9.x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN IFUNIX' do.
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

jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. NOTE: the format of  the string returned  by 9!14 has changed
NB. without warning over  the years. The latest change (feb 2023)
NB. has  been   to  a  (version.major.minor)  layout.  This  verb
NB. computes a floating version number.
NB.
NB. monad:  fa =. jvn uuIgnore
NB. dyad: fa =. cl jvn uuIgnore
NB.
NB.   v0=. 'j9.4.0-beta13/j64avx512/windows/commercial/www.jsoftware.com/2023-02-23T08:08:24/clang-15-0-7/SLEEF=1'
NB.   v1=. 'j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1'
NB.   v2=. 'j10.12.53/jwhatever'
NB.   v3=. 'j8.05/oldsys'
NB.
NB.   v0 jvn_ajod_ 0
NB.   v1 jvn_ajod_ 0
NB.   v2 jvn_ajod_ 0
NB.   v3 jvn_ajod_ 0

(9!:14 '') jvn y
:
NB. for empty version strings return
NB. 0 we don't know the version
if. 0=#x do. 0
else.
  NB. extract J version from (9!;14) string
  ver=. (x i. '/') {. x ,'0/'
  if. '.' e. ver=. (ver e. '0123456789.-/')#ver do.
    NB. version.major.minor layouts
    ver=. ver {."0 1~ ({. , <./@}.) ver i. '.-/'
    (0 ". 0{ver) + 0 ". '0.',((] }.~ (i.&'.')) 1{ver)-.'.'
  else.
    NB. version layouts before j9.4
    100 %~ , 0 ". (ver i. '/') {. ver
  end.
end.
)

makedump=:3 : 0

NB.*makedump  v-- dumps the current path as a J  script file. The
NB. dump script can be run back  into  JOD  to rebuild  a  single
NB. dictionary that contains all objects on the current path. The
NB. dump script is a simple ASCII file  that is intended for long
NB. term storage of J  words in a form that is immune to  changes
NB. in binary storage formats.
NB.
NB. monad:  makedump uuIgnore

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. create dump file in put dump directory !(*)=. DL
DL=.{:{.DPATH__ST

NB. dumpfactor is set from the put dictionary
df=. DUMPFACTOR__DL

NB. default dump file name is the put dictionary name
if. isempty y   do. dumpfile=. DMP__DL,DNAME__DL,IJS
elseif. badcl y do. jderr ERR0158 return. NB. error msg: invalid dump file
elseif.do. dumpfile=. y
end.

NB. HARDCODE: are we retaining object age?
if. 0=nc<'RETAINAGE__DL' do. rag=. 1 -: RETAINAGE__DL  else. rag=. 0 end. 

NB. HARDCODE: are we prefixing dump hashes?
if. 0=nc<'HASHDUMP__DL' do. hdm=. 1 -: HASHDUMP__DL  else. hdm=. 0 end.

NB. standardize path character
dumpfile=. jpathsep dumpfile

if.     badrc uv=. dumpheader dumpfile        do. uv
elseif. badrc uv=. df dumpwords dumpfile      do. uv
elseif. badrc uv=. (df,TEST) dumptm dumpfile  do. uv
elseif. badrc uv=. (df,MACRO) dumptm dumpfile do. uv
elseif. badrc uv=. (df,GROUP) dumpgs dumpfile do. uv
elseif. badrc uv=. (df,SUITE) dumpgs dumpfile do. uv
elseif. badrc uv=. dumpdictdoc dumpfile       do. uv
elseif. badrc uv=. rag dumpntstamps dumpfile  do. uv
elseif. badrc uv=. dumptrailer dumpfile       do. uv
elseif.do.
  if. hdm do. prefixdumphash dumpfile else. (ok OK0151),<dumpfile end.
end.
)

nextbaknum=:4 : 0

NB.*nextbaknum v-- next backup number with ordered list of backup numbers.
NB.
NB. monad:  il =. baObj nextbaknum uuIgnore
NB.
NB.   DL nextbaknum 0

DL=. x NB. put dictionary directory object

NB. next backup number HARDCODE: pack counter is in component 1 errmsg: jfile read failure
if. badjr nums=.>jread WF__DL;1 do. jderr ERR088__ST  
else. 
  NB. new dicts without backups do not have counts and date
  if. #nums do. pckcnt=. >:0{nums else. pckcnt=. 0 end.
  ok <.pckcnt,bnums__ST BAK__DL 
end.
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

  NB. return the currently registered dictionaries as a sorted (regd) script
  if. 0 e. $mdt=. >mdt do. 
    ok 'NB. No current JOD registrations: ',tstamp ''
  else.
    mdt=. quote&.> 0 2{mdt {"1~ /: 0{mdt
    mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt

    NB. prefix command to close and unregister all current dictionaries
    mdt=. 'NB. require ''general/jod''',LF,'0 0$3 regd&> }. od'''' [ 3 od ''''',LF,mdt

    NB. add JOD/j versions - useful when dealing with binary incompatibilities
    head=. 'NB. JOD registrations: ',tstamp ''
    head=. head,LF,DUMPMSG3__MK , ;(<'; ') ,&.> ":&.>JODVMD 
    head=. head,LF,DUMPMSG4__MK , ": , 9!:14 '' 
    ok head,LF,jpathsep mdt
  end.

case. 6 do.

  NB. open entire put dictionary path - shallow recursive
  NB. closes current dictionaries and makes first (y) put
  if. isempty y do. jderr msg return. end.
  uv=. 3 od '' [ opd=. }. did 0
  uv=. <;._1 ; {: 1 { rv did ~ mdt=. od ;0{boxopen y
  if. uv -: ,a: do. mdt NB. empty path
  NB. attempt to reopen original dicts on error
  elseif. badrc uv=. od uv [ 3 od '' do. uv [ od opd 
  elseif.do. uv end. 
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

packd=:3 : 0

NB.*packd  v-- backs up and recovers wasted  space in  dictionary
NB. files.   Backups  are  stored  in  the   dictionary's  backup
NB. directory. Sets  of backup  files are prefixed  with an  ever
NB. increasing backup number, e.g: 13jwords.ijf. Dictionary files
NB. are NEVER deleted by JOD commands.
NB.
NB. monad:  packd clName
NB.
NB.   packd 'dictionary'

NB. only put dictionaries can be packed
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. is there enough space on the backup volume?
if. badrc uv=. packspace__DL 0 do. uv return. end.

NB. get next backup number 
if. badrc uv=. DL nextbaknum 0 do. uv return. else. pfn=. {. ,rv uv end.

NB. backup files
pfn packdict__DL y
)

packdict=:4 : 0

NB.*packdict v-- pack the current dictionary.
NB.
NB. At  the  end  of  a  successful pack  operation  the  current
NB. directory object is refreshed and subsequent  operations  are
NB. performed on the packed files.
NB.
NB. dyad:  iaNxtBak packdict clName

NB. object nouns !(*)=. DNAME UF WF

if. (,DNAME) -: ,y do.
  NB. clear current object
  dropall 0
  path=. SYS   NB. object noun !(*)=. SYS

  NB. store backup number
  pfn=.backnum x

  NB. copy object files to tmp files
  for_obj. OBJECTNC do.
    NB. code relies on the fact that (OBJECTNC),
    NB. (JDFILES) and (DFILES) have corresponding items
    tfile=. path,TEMPFX,>obj_index{JDFILES
    datfile=. ".>obj_index{DFILES
    if. badrc msg=. obj tmpdatfile tfile;datfile do. msg return. end.
  end.

  NB. copy reference file to tmp file HARDCODE file name index
  tfile=. path,TEMPFX,>5{JDFILES
  if. badrc msg=. tmpusesfile tfile;UF do. msg return. end.

  NB. move old data files to backup directory and rename
  NB. backup prefix number HARDCODE backup directory index
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS
  dcfiles=. JDFILES ,&.> <IJF
  source=.  (<path) ,&.> dcfiles
  bckfiles=. (<":pfn) ,&.> dcfiles
  target=.  (<bckpath) ,&.> bckfiles
  if. badrc msg=.source renamefiles target do. msg return. end.

  NB. hash backup files and write sidecar (n)jhashes.txt file
  if. badrc msg=. bckfiles hashback pfn;bckpath;target do. msg return. end.

  NB. rename tmp files to standard file names
  target=. source
  source=. (<path) ,&.> (<TEMPFX) ,&.> dcfiles
  if. badrc msg=.source renamefiles target do. msg return. end.

  NB. insure new directory is reloaded when needed
  dropall 0

  ok OK200;DNAME;pfn  NB. return dictionary & pack count
else.
  jderr ERR202
end.
)

prefixdumphash=:3 : 0

NB.*prefixdumphash v-- prefixes hash to dump scripts.
NB.
NB. monad:  prefixdumphash clDumpfile

if. _1 -: dumpscript=. (read :: _1:) y do. 
  NB. errmsg: cannot prefix hash
  (jderr ERR0161),<y return.
else.
  NB. standard LF line ends for hash
  NB. matches (chkhashdmp) verb
  hash=. sha256 dumpscript -. CR
  dumpscript=. (toHOST 'NB. sha256:',hash,LF),dumpscript
  if. _1 -: dumpscript (write :: _1:) y do.
    (jderr ERR0161),<y return.
  else.
    (ok OK0151),<y  
  end. 
end.
)

put=:3 : 0

NB.*put v-- stores objects in dictionary database files.
NB.
NB. monad:  put blclWords
NB.
NB.   put ;: 'it where the sun dont shine'
NB.
NB. dyad:  ilCodes put bluu
NB.
NB.   2 7 put 'GroupName';'Group documentation text ....'

WORD put y
:
msg=. ERR001 [ loc=. <'base'  NB. errmsg: invalid option(s)

NB. do not save decommented words - set PUTBLACK to 1 to override
if. -. PUTBLACK +. 9!:40'' do.
  NB. errmsg: white space preservation is off - turn on to put
  jderr ERR023 return.
end.

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _1&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc =. <x-.' ' end.
end.

NB. do we have a put dictionary open?
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. NOTE: j 9.04 introduced a new binary format for extended precision
NB. integers that is not backward compatible with prior versions of j.
NB. While it's ok to read jod binary files created in older versions it's
NB. not ok to write to them. JOD uses extended precision integers to encode
NB. GUIDs. In retrospect it would have been a better choice to encode
NB. GUIDS as plain old character data. HARDCODE:
if. badrc msgbin=. binverchk DL do. msgbin return. end.

NB. format standard (x) options
x=. 2 {. x , DEFAULT

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (loc;<DL) putwords__ST y
    case. EXPLAIN  do. (WORD;<DL) putexplain__ST y
    case. DOCUMENT do. (WORD;1;<DL) puttexts__ST y
    case. NVTABLE  do.
      if. badrc y=. (i. 4) checknttab2 y do. y else. (WORD;<DL) puttable__ST y end.
    case. -INPUT   do. (WORD;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. checknttab y do. y else. (TEST;<DL) puttable__ST y end.
    case. EXPLAIN  do. (TEST;<DL) putexplain__ST y
    case. DOCUMENT do. (TEST;1;<DL) puttexts__ST y
    case. -INPUT   do. (TEST;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. (GROUP;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (GROUP;<DL) putexplain__ST y
    case. DOCUMENT do. (GROUP;1;<DL) puttexts__ST y
    NB. HARDCODE - lines inserted to maintain put/get symmetry for
    NB. the frequent argument cases 2 1 and 3 1 
    case. 1 do. (GROUP;0;<DL) puttexts__ST y
    case. -INPUT   do. (GROUP;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. (SUITE;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (SUITE;<DL) putexplain__ST y
    case. DOCUMENT do. (SUITE;1;<DL) puttexts__ST y
    case. 1 do. (SUITE;0;<DL) puttexts__ST y  NB. HARDCODE
    case. -INPUT   do. (SUITE;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. MACROTYPE checknttab2 y do. y else. (MACRO;<DL) puttable__ST y end.
    case. EXPLAIN  do. (MACRO;<DL) putexplain__ST y
    case. DOCUMENT do. (MACRO;1;<DL) puttexts__ST y
    case. -INPUT   do. (MACRO;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. putdicdoc__ST y
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

putgs=:4 : 0

NB.*putgs  v--  stores  dictionary groups  and  suites.  Prior to
NB. calling this verb  names, path and put dictionary status have
NB. been validated.
NB.
NB. dyad:  (bacl ; ia ; ia) putgs blcl
NB.
NB.   ((<'6');WORD;GROUP) putgs ;: 'group and members'

'DL code gtype'=. x  NB. directory object !(*)=. DL

NB. check binary compatibility of target dictionary
if. badrc msgbin=. binverchk DL do. msgbin return. end.

if. badrc msg=. pathnl code do. msg return. end.
y=. /:~ ~. }. y [ gn=. {. y
if. *./b=. y e. ; }. msg do.

  NB. change/create group -- insure group directory is ready
  if. loaddir__DL gtype do.
    jderr ERR054  NB. errmsg: unable to load directory
  elseif. do.

    NB. depends on first char of index list matching (cP_DL) nouns
    fc=. {. ix=. (>dnix__DL gtype),'__DL'
    cn=. (>dncn__DL gtype),'__DL'

    NB. groups/suites are either new or replacements
    uv=. (".ix) i. gn
    dfopen__DL fc
    gp=. ".fc,'P__DL'

    if. uv=#".ix do.

      NB. group is new - create

      NB. EDGE CONDITION?? if another group with the same
      NB. name exists on the path copy the group/suite text
      NB. of that group to this new group.  Use of this system has shown
      NB. that this is desirable behaviour because of the common
      NB. practice of "regrouping" in the put dictionary new versions
      NB. of the same group that are deeper on the path.
      if. +./uv=. (<gn) e.&> }. pathnl gtype do.
        if. badrc uv2=. gtype getgstext gn do. uv2 return. else. uv=. (1;0 1){::uv2 end.
      else.
        uv=. '' NB. default script is empty
      end.

      gdat=. <gn , uv ; < y       NB. (cn)   name, script, contents
      gdat=. gdat , <gn , 3$<''   NB. (cn+1) name, latex, html, text, et cetera

      NB. append group
      if. badappend apcn =. gdat jappend gp do.
        jderr ERR058 [ dfclose__DL fc return.  NB. errmsg: append failure
      end.

      stamp=. nowfd now ''
      uv=.  stamp;stamp;<a:
      uv2=. CNPUTDATE,CNCREATION,CNEXPLAIN NB. NIMP group append
      if. badrc msg=.uv invappend gp;uv2 do. msg
      else.
        NB. update directory
        uv=.  (".ix) , gn
        uv2=. (".cn) , {. apcn
        if. badrc (gtype,gp) savedir__DL uv;uv2 do.
          jderr msg [ dfclose__DL fc return.
        else.

          NB. stamp good directory change
          (<(#".ix);now '') jreplace gp;CNMARK
        end.
      end.

    else.

      NB. group exists - update
      apcn=. uv { ".cn
      if. badjr uv2=. jread gp;apcn do.
        jderr ERR088 [ dfclose__DL fc return.  NB. errmsg: read failure
      elseif. gn -: 0 {>uv2 do.

        NB. update group list - group script is not changed
        if. badreps (<(}:>uv2),<y) jreplace gp;apcn do.
          jderr ERR056 [ dfclose__DL fc return.  NB. errmsg: replace failure
        end.

        uv2=. uv;nowfd now ''
        if. badrc msg=.uv2 invreplace gp;CNPUTDATE do. msg return. end.

      elseif.do.
        jderr ERR055 return. NB. errmsg: directory-data inconsistency
      end.
    end.

    dfclose__DL fc
    uv=. ,>dnnm__DL gtype
    ok(uv,' <',(>gn),'> ',OK059);DNAME__DL
  end.

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)

restd=:3 : 0

NB.*restd v-- restores backups created by (packd).
NB.
NB. monad:  restd clName | blNameBnum
NB.
NB.   restd 'backup'
NB.   restd 'backup';13     NB. restore backup 13
NB.   restd 'backup';13 17  NB. restore backup 13 ignoring hash failures

NB. only put dictionaries can be restored
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. next backnum with ordered list of extant backup numbers
if. badrc uv=. DL nextbaknum 0 do. uv return. else. uv=. rv uv end.

NB. next backup number
bklist=. }.uv [ nxtbak=. {.uv 

NB. if a particular backup is being requested check its number
achk=. (2 = #) * (1 = [: $ $) * 1 = L.
if. achk y do.
  'bkname bknum'=. y
  if. badcl bkname do. jderr ERR002 return. end.
  NB. HARDCODE: 2 forcing bknum to pair
  if. badil ,bknum do. (jderr ERR106__ST),<bknum return. else. bknum=. 2 {. bknum end.
  if. -.({.bknum) e. bklist do. (jderr ERR106__ST),<{.bknum return. end.
elseif. -.badcl y do.
  bkname=. y
  bknum=. 2 {. {. bklist NB. most recent backup
elseif.do. jderr ERR002 return. 
end.

if. HASH ~: {:bknum do.
  NB. check backup hashes
  if. badrc uv=. hashbchk__ST {.bknum do. uv return. 
  NB. errmsg: backup hash failure ->
  elseif. 0 e. }.;rv uv do. (jderr ERR031),<{.bknum return. 
  end.
end.

NB. is there enough space on the dictionary volume?
if. badrc uv=. restspace__DL {.bknum do. uv else. (}. uv) restdict__DL bkname;nxtbak end.
)

restdict=:4 : 0

NB.*restdict v-- restore backups created by (packd).
NB.
NB. dyad:  blclFiles restdict blNameNxtnum

NB. object nouns !(*)=. DIDNUM DNAME SYS

'bkname nxtbak'=. y

if. (,DNAME) -: ,bkname do.

  NB. clear current object directory - frees space
  dropall 0

  NB. NIMP: restore comes from the same volume as the
  NB. dictionary.  This code depends on the fact we
  NB. are dealing with a standard dictionary directory
  NB. that is contained on ONE volume.
  path=. ((justpath`justdrvpath@.IFWIN) SYS),PATHDEL

  dcfiles=. JDFILES ,&.> <IJF            NB. dictionary file names with extension
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS   NB. HARDCODE: 5 backup directory index
  target=. (<path) ,&.> dcfiles          NB. current dictionary files
  source=. (<bckpath) ,&.> (<":>x) ,&.> dcfiles  NB. lastest backup files

  NB. test backup files errmsg: missing backup files - restore aborted
  if. -.fex source do. jderr ERR207 return. end.

  NB. Check DIDNUM of backup dictionary against current object
  NB. they must match to maintain master/dictionary relationships.
  NB. WARNING: uses fact that the WORD file is first ON (source) list
  if. badjr dat=. jread (>{.source);CNPARMS do.
      jderr ERR088 return. NB. errmsg: jfile read failure
  end.

  NB. read alleged backup DIDNUM
  dn=. ((1&{::@>) :: 0:) dat
  if. -. dn -: DIDNUM do. jderr ERR209 return. end.

  NB. erase current dictionary files and copy last backup
  (1!:55) target
  if. badrc msg=.source copyfiles target do. msg return. end.

  NB. update restored pack count to prevent clashes with backups
  pfn=.backnum <:nxtbak

  NB. insure new directory is reloaded when needed
  dropall 0

  NB. name, restore number, new pack count
  ok OK201;DNAME;(>x),pfn  
else.
  jderr ERR202
end.
)

restspace=:3 : 0

NB.*restspace v-- checks space for dictionary restores.
NB.
NB. monad:  restspace bkNum

NB. object nouns !(*)=. BAK SYS

NB. all dictionary backup files
if. #back=. 1!:0 <BAK,'*',IJF do.

  maxb=. {. y NB. valid backup number


  NB. select files in backup
  back=. back #~ maxb nummask {."1 back

  NB. bytes required to store lastest backup
  bytes=. +/ ; 2 {"1 back

  if. bytes<volfree SYS do.
    ok maxb       NB. return backup number
  else.
    jderr ERR204  NB. errmsg: not enough free disk space for operation
  end.
else.
  jderr ERR206    NB. errmsg: no backups to restore
end.
)

setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets/creates paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore
NB.
NB.   NB. the monad returns the locations of JOD directories.
NB.   setbuilddirs 0
NB.   
NB. dyad: blcl = uuIgnore setbuilddirs uuIgnore
NB.
NB.   NB. the dyad creates all the directories
NB.   NB. required to build the JOD addons.
NB.
NB.   'test' getrx 'setbuilddirs'
NB.   1 setbuilddirs_test_ 0

NB. mask locale references to enable:  getrx 'setbuilddirs'
NB. !(*)=. jpath_j_ JODobj_ijod_ DPATH__ST__obj locsfx__JOD__obj

NB. assumes JOD is loaded with (JODobj) visisble to (ijod)
0 setbuilddirs y
:
obj=. JODobj_ijod_
locx=. locsfx__JOD__obj {.{:"1 DPATH__ST__obj
aliendir=. ".'ALI',;locx

NB. this directory typically holds LaTeX jod.pdf files
NB. https://github.com/bakerjd99/joddoc
JODDOCDIR=. jpathsep (".'DOC',;locx),'joddoc/'

JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath_j_ '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath_j_ '~addons/general/jod/jodexts/'

NB. main build directories required by (buildjoddistribution)
corebuild=. JODDOCDIR;JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR

if. x -: 1 do.

  NB. create build directories under (alien) - some dictionary directories exist
  stagedirs=. corebuild -. JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
  stagedirs=. stagedirs,<jpathsep aliendir,'stage/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/'

  NB. core addon directories
  stagedirs=. stagedirs,<JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodbak/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodlabs/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/pdfdoc/'

  NB. class source 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodijs/'
  
  NB. unit tests 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/smoke/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/basic/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/large/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/stress/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/crush/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/prepare/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/purge/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/extend/'
  
  NB. creation order matters
  showpass 'created directories'
  showpass >stagedirs=. /:~ stagedirs
  makedir"0 stagedirs 
end.

corebuild
)

setjodliterate=:3 : 0

NB.*setjodliterate v-- prepare LaTeX processing - sets out directory writes preamble.
NB.
NB. monad:  (paRc ; clDir) =. setjodliterate clWorkingDir | zl
NB.
NB.   NB. use the current JOD put dictionary document directory
NB.   setjodliterate ''
NB.
NB.   setjodliterate 'c:\temp'           NB. windows
NB.   setjodliterate '/home/john/temp'   NB. linux 
NB.
NB.   setjodliterate '~temp'  NB. use J defined folders
NB.
NB. dyad: (paRc ; clDir) =. clAuthor setjodliterate clWorkingDir | zl
NB.
NB.   NB. set LaTeX \author{...} text
NB.   'Bob Squarepants (\texttt{pinapple@undersea.org})' setjodliterate ''
NB.   'Batman (\texttt{dn@jl.com}), Dr. Who (\texttt{who@univ.edu})' setjodliterate ''
NB.   'First Author \\ Lowly Minion' setjodliterate ''

JLDEFAULTAUTHORS setjodliterate y
:
try.

if. 3~:(4!:0) <'badrc_ajod_' do. 0;'!error: jod is not loaded' return. end.
if. 0 = #DPATH__ST__JODobj   do. 0;'!error: no open jod dictionaries' return. end.

NB. if the path is empty use the current put dictionary document directory !(*)=. dob
if. 0 e. $y do. y=. DOC__dob [ dob=. {:{.DPATH__ST__JODobj end.

JLAUTHOR_ajodliterate_=: x

NB. profile (*)=. IFWIN jpath
JLDIRECTORY_ajodliterate_=: jpathsep`winpathsep@.(IFWIN) jpath tslash2 y

NB. write main latex preamble and cleaner iff missing
preamble=. 'JODLiteratePreamble.tex'  
cleaner=.  '00cleantex.',JLSHELLEXT
if. -.fexist JLDIRECTORY,preamble do.
  (toJ JODLiteratePreamble) writeas JLDIRECTORY,preamble
end.
if. -.fexist JLDIRECTORY,cleaner do.
  (toJ JLCLEANTEX) writeas JLDIRECTORY,cleaner
end.
1;JLDIRECTORY

catchd.
  0;'!error: (setjodliterate) failure - last J error ->';13!:12 ''
end.
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

NB. test existence of test dictionary or create it on a unique path
settdict_ijod_=: {{ if. (<y) e. od '' do. OK_ajod_ else. newd y;(jpath '~JODTEST/'), 'prune' , (;{.yyyymondd 0),'/',(":didnum_ajod_''),'/',y  end. }}

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
NB. 20jan19 added code to add icon files: jodcube.ico, jodcube.png
NB. 24jan02 paths changed to user config path (JODDOCTEX)
NB. 24jan05 removed config path - passing (JODDOCDIR)

'JODSTAGEDIR JODGITDIR JODDOCDIR'=. y
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

NB. copy jod icons from *.tex document directories - these binaries are not stored in JOD.
png=. JODDOCDIR,'jodgraphics/jodcube.png'
ico=. JODDOCDIR,'jodgraphics/jodcube.ico'
if. (fexist png) *. fexist ico do.
  assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
  assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'
else.
  showpass 'jod.pdf latex files missing'
  showpass png
  showpass ico
end.


smoutput 'JOD staging directories updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1-%372)QL3+?1K!1E\Y"1H-F:+>Yr!2]sn8+?1K!2]st#1,0n1+>Y\o3$:+5+>b2r1E\V!1,U15
+>Z##2'=Y6+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1,g=4+>P_q3?U(6+>Y,q1*ALu
2)l^7+>kns3?U7=+>Ghu1c?I31E\P4+>GPm1b^%0+>Pes0ea_-0H`4q1GBq3+>bqu2'=\7+?1K#
1E\Y"1-$I9+>Ghu2BXe5+>G\q1G^./1E\M6+>k9!1E\Ir0fC.6+>beq0ea_-1a"Or1-$I7+>ktu
3$9t8+>G\q1-$I5+>bks2'=\4+>k8t2'=k$1Gg47+>Ynu0esk.1*A;.+>tqs0f:(13$9t2+>Yf?
=]@gg8QnQ$@VTIaF<GX=H=\4;E-,f4DBNG-A7\,'9h%NE:If81F*(u6+D,>(AKYK#3ZqsI@ruF'
DIIR2+Du==@V'R&Ci<rR:/+2S5uLEUD..L-ATAo*Bl%?'@r==MA8,OqBl@ltEd8dH@<,dnATVL(
F$i\s7T;Z?D..L-ATAo*Bl%?'@r==MD..-r+Co1rFD5Z2@<-W9FCAWpAOB?a5u^EO:2aTVARfg)
@rc-hFD5Z2+E)4@Bl@l3@rGmh6r60K87ZFEFD5Z2@<-W9E+*j%+EV%$Ch6"29M%rM<,H&gBl/!0
+Co1rFD5Z2@<-W9E+*j%+DbV,B67fT<D?:a;b&]_DffQ3+E2IF+Co1rFD5Z2@<-W9E+*j%+>"^Y
F(Js+C`mq8ASrW,Ddd0jDJ()&F_u(?F(96)E--.l5uU<`@:O(qE$/h&F(c\7E-,f4DBNG-A7\:t
;b0AV=CP]KCNXS=BOPsqATJu+Bl%?'F*2),Bm<07;b0GI;Jfi_CNCV3ART+\EZf14DIml3Bl5&&
@:O(qE$/h&F(c\.Bl%@%8PiPb6:uB>H$!V<+Du+>AR]RrCERP7FD5Z2+Cf>#AP%2?:IJo7FCfK)
@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(
Eb8`iALU2s8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+G
AKWCBATV[*A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=
6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs
@;]TuA79Rk9L2TV:fUJ2@<6N5DdmHm@rri4F`\aEE-,f4DBNG-A7\G'5u)6-@;[3/Dfp)1AKYo1
FD5Z2+Cf>#APPNc770a7;c?:2DIIBn+Cf4rF)rIBE-,f4DBNG-A7\q97s\l^+EMIDEarZ'DfBf4
Df-\-De*Eg@:O(jF_u8?A79RkF!+q#@r$4++E1b!CER,*F`):D@;]Tu@UWb^F`9!SATMs3Eaa'(
Df-\>Bl.F&FCB$*@W$!uBleA=DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(q
E$/b,Ch7ZsDJXB*@<,jkF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5
EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)
F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(Jlk
F_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'CM7-t
BOkt!@q]F`CNCV/F_u(?F(96)E-*49@<6*)@:s"_DKBnB@rH7,ASuU2A8lU$FE;#8+Co1rFD5Z2
@<-W9E+*cqD.Rg#EcYc6D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u+Eqj?FCfM9BOtU_
ATAo-DJ!g-D..O#Df00*E+sQ/Bl\9:+E)-?E+*j%+E):2ATAo0BleA=Bl7HmG\2)7Ci+*.FEqn<
FEMVAF!,:5F*)IGDe:,&Bl[cpFDl2F+E(_(ARfg)DJsZ8+Eh10F_,W,Ci<d(@;]LiH$X$Q+ED%4
DfTqB@;]TuF*)>@AKYW%Ddm-k+DtV)ATMNnF(f#k@r$:/Blmp-+CQC7AU&;>F(o/r@psC#Anc'm
+E(j7@UWb^F`8I:@<6*nF(f!'BOYIbCL_$h@r$-.BOPsqATJu4AftPk@r$4++D,>(ATMNnF(fT*
E+36cCNXS=BOPsq+ED%4DfTr5FCT-$E+<]uE-!.8ART*l@;]TuFCAm"+Co&"Bl.R+ARlp"BleB;
C2[X!Blmp,@<?']9gi`7A8Gt%ATD4$AKZ/-EcYr5DBNe)CLnVsDIal#@<?'qDe*ZuFCfK$FCefm
@<6*m@<?('Ebof1@4a5l2BZ[AF(c\7Afti,A8Gt%ATD4$AKZ&(EbTK7+C]J-Cige<DBNIuFCf3*
A8c@-F`M@B8l%htDf-\<ATN!1F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0C3FJe
+Eh=:F(oQ1+Du==@V'Rs@;BFbF_u).F_u)=+EV:.+CfP7Eb0-1+E1b2BHU`)+CQBb+EM%5BlJ/:
Anc'mDIn'7@UX%iF_u#-G]Y';@:O(qE$0%@D.7's+EqOABHV56A7]dmA0>]&F*&OCAftPk@r$4+
+Du==@V'S$De*d*ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;@)@:O(`@UWb^F!,UE+CT.u+ED%'
Dg#]4F!,[8F*(u(+EML1@q?csDBNJ(@ruF'DIIR2+D,>(ATMg!@r#Uh@ruZu@r!3/BOr;rF`MM6
DKI"3Bk)7!Df0!(H#Re8AncL#F_u)2@<6+$Eb/isG\(q=BOPsq+EVNEA9Da.+EM%5BlJ08E-68D
FDl22F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATMg5FD#Z9FDl22F!,"-@ruF'
DIIR2+D5_5F`;CE@;]TuF*22=ATMm'F*(r5ATMs3Eb0;7@UWb^F`;CE@rc-hFCeu*@X0(EE+*6l
A1;P1F*(r,@rua&F*)>@AKYGj@r$4+F!+t5ART[lA0>?,+=M2;@r#U(Eb0<6F)YPtARfCb@r$-.
F)YPtAKYT'EZen,@ruF'DIIR2+ED%7FDl22F)to7@WcC$A7TCpF)to7F"_$DART[lF!,F1FD,_<
F`V,)+C]U=8l%ht@WcC$A0?)7Eb'64ATV[*A8Gt%ATD4$AT2[$E+*cu+A?3CAQU'oEc5H!F)u&5
B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh7^"F*(u2G%ku8DJ`s&FE;#8F!,UE
+EV:.+=Lr=De(:>Ci<flCh4`$DfQt@F`))2DJ()6ATMr9@psFiF*2G4@<?'qDe*BmF*)G:@Wcd,
Df0]:A79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:Bju4,Bl@k                              ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)$.2+>P&o0H`)10Jst-2]sk32)ZR31E\D,2DQC01*A;12DZI9+>PZ-3$9q2+>Pi52e$Z@;f-Gg
AM>l767s`sDJW6gDeio<1*CZj/KcHNDJUaEFCfN8+D>2)BHUnqBl%p4AKYMpFCes(Bl@lA%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\,SDf00$B6A6+A0=JeFCfN8+D,P.A7]d(8l%iS
78m/:+EMX5DId0rA0=JeF`_>6F!)lABlYaIA8-(+Eb/f2%15is/e&._67sB'+>G;f.!0$AFD>`)
0JFpuA8,OqBl@ltEd8*$:-pQU+<VdL+Dtb7A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)
F*)/8A2#\b+AP6U+CfG'@<?&i$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N
;cGDlATMs.De(OU-Ql/N/g,1GB5)F/ATAo)G][A3F:ARP67r]S:-pQU@rc-hFCeuD+>PW+1hL<.
0Ja.F:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OO:-pQUBlbD/DerrqEZek1DJ!TqF`M&(%16fj@qHi2IS*C(<(0_b-OgCl
$;No?+EM+9+EV19F<G+.@ruF'DIIR2%16Ze+EM+9FC])qF<G[9Bk)6J3ZoelATMs.De(OU-OgCl
$;No?+ED%%A0>;uA0?):Blmo/@X3',Et&IsART+43Zp.#3\_s0?!oc[/grM2-9a[C1Eee5.4H\T
$?pN)FCdTr+>G$#1*Bk14?tMI1GU:@5U\E33\W!3%13OO:-pQU@r-()AKYE!Gp%$EASrW!DIal.
E+No0FCfN8+Co1rFD5Z2@<-W&$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+_G@<6!&@;^?5
@s)g4ASuT4FCfN8+Co1rFD5Z2@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL
%14d30I17AEaa$#+>G!LBlY=_5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*
@ru9m%16uaEZd(n+C]5)+=Ach%13OO:-pQUBl8!'Ec`FE@;]UoD'38-Eaa67+<Y-)FE_;-DBNCs
@r$4+F!,RC+DG_7F`M%&$;No?+D>2)BOu6-Bl5&8BOr<(C1q$sBOu6;FEhmMF(o/r@psC#Anc'm
F!,"-AnGUp%16cWF(f5q@r"4g+?q_+2'=b%0eb:80JG0i$><jhBPhg'4ZX]5Anc:,F<G%$@r$4+
-OgDoEZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze+E1b!
CLeQ0A8,Oq%13OOBOPsqBOPCd4ZX]M2'=b!2'an10JG170F\A&@<6+!F([Ws+=D5A@rH6q+C\bh
CNXSD%16Ze+EVI>Ci<f+E-67F-YQq0BP:gaCF9PuATAo8D/a<0@j#`5F<DrE@<6+!F(Zj0$>"6#
E+*6lA0>u)Bk)5o$4R>;67sBhCht5-@<6*nF!,O;Dfol,+E1b1Et&IfEZfF:Dg-//F)rI;@<6*n
F$2Q,0fL4aDJUFC/gh)8.P<@s4!67#0d(ls+EDX4@;9^k?Qa#jF(f-+%13OO:-pQU@rH=3+CT.u
+ED%2@;TQuDerrqEZeh"@r$4++EqaEA0>JuCh7Z1Dg#]4%15is/g,%CG@be;@UWb^F`;CE/Kf.K
BlbD@Bl%T.Bl8$5De+!#AKYD(BOPsq+D,%rCisc0%16ioDfTB04ZX]rBl\<9ARuuN5tbQl6qf-Z
.Va0GEb'5DBkh6-%16ioDfTB04ZX]6>WNu^+F>:e+DQ+=Eb'5?HYRbCEb'5#$7Kq+@:UKB0RJ.-
C3OT:A901BGB.D>AKX&gH[@A[GAhM4Et&IfEZfF:Dg-//F)rI;@r#adF(f-+4ZX]?2]uRIC`k)X
-OgCl$;No?+EMI<AKYYpF(f-++D,%rC`k;P0QS@NDBLYm+C]5)+=Ach%14d3AM,)e+>Fun+FPjb
EcteuC2[Wi+D>8#BOPsqATJ:f%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&@WcC$A7'(iA8Gt%
ATD4$APPQE.UmO7Ch-mfDe*ZuFCfK$FCcS9/M/)SF_PZ&+CT.u+Co2-FE2))F`_1;C2[X!Blmp,
@<?'5Bkh\u$;No?+:SZQ67sBjEb/[$ARmhE1,(I;De!lC2%9mf67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/KbK0:-pQU1,*WVF>,Qp@WcC$A0<:8De*ZuFCfK$FCcmD@;]TuA8-+,EbT!*FCbmg:-pQU1,*WV
F>,]t-u*[2Ch\!&Eaa'$?YEkhBOkOnAT`$0.3N&0A7]9\$;No?+>PWgDg!fn+=LuCA8Gt%ATD4$
ARBIrDfdEN@:Wn[A.8l@67sB90P"a)0JO[uC2[X!Blmp,@<?']9ggEQ@:Wn[A.8l@67sB90k=j*
1,0n\F_PZ&+EV=7AKYhuEbf5s+E)-?E,Tf>+E2@>@qB_&DfQ9o:-pQU1,E?XE\]Kp@:X+qF*&OH
D]i_%DIdQp+ED%%A1qk=Cj@.BF`\a:Bk)7!Df0!(Gmt*U67sB91Lt',1,9t#F(KH.De*ZuFCfK$
FCcmDDJs_AF`V,8+Co%qBl7Km+A*bgDerrqEcVZs:-pQU1,N`SDD=$lF`V+:@rH6sBkMR/ARloq
DerrqEcW@FD]in*CLnW*DfTD3E,Tc=@:F%a%13OO@rGjn@<6K4FDYu5De!-?5s]7(A8Gt%0KD.#
4ZXrV5s]7(A8Gt%0KD-@+BosuDe3rtF(HIV-UC$aC2[X!Bll$h3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>\Df7d"+FPkQBk/>?%13OOF(96.4ZX]5C2[X!Blmp,@<?'.%13OO4tq>%A0<rp-n$HWD.Rr>
+>#Vs4"u#"Df7'L-Y[F/GUFpk-Qm/BA7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDH0RInYE,9H&
+D58-+?MV3Bldcr+ED%%A0?):Blmo/F(eu;2)ZRuBQ&*6@<6K4FE;P4D/^V4De*ZuFCfK$FCefm
@<6*m@<?('Eblk5De*ZuFCfK$FCeKI6m,oMFCfK6FE/L5AS,k$ATMs6+DPe4G9CX<Dg-/=F*&c=
$4R>;67sBpDKBB0F>%ZGE,8rmAKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159Q
HREiD+Dt\4-TsL59gM-E:L@OFDe*2tB4Z0--W!T;<*q"(F(96.%14L>+?CW!.3Kuc+:SZlAhG2[
+?^i20RHM[6W-]e@;9^k?Qa<1F<DtoC2Rs6E,Tf>+?M>$HQ[39Ft"OhI3<E;G!.l//8es@+CoCC
%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]E,Tf>+E2@>@j#l-
D.Rd1@;Ts+DJsV>F`:l"FCeu1%16Z_F(HsH0b"J$DIb@/$7QDk%15is/g,:UA79Rk+EhU4+<`-_
.6T:+C2[X!Blmp,@<?']9gfEt@UrnhAN`'s.!0NP@;Ts+-RU>o-Ql,_-Ql/N/g,7[ART?sAoD]4
FD5T'H>d\4%16igA8Gt%ATD4$AQDMn4ZX].-n%8?+?hN,C2[X!Blmp,@<?']9ggEl@UrnhALS`M
0d&5#I3<9CA8Gt%ATD4$AQDMn%14L>+?CW!.3Kuc%16f]/g)hj4WlpBHZX+DCi<f+E-67F-YdR1
Ch\!&Eaa'$<_Yt0+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`E
Gp"[]G%G]8Bl@lAD..3k/nAC4AKYl/F<G^FA79RkA1&KB%16Z_F(HsH0b"J$DIb@/$7QDk%17/n
Dfp/@F`\`R@WcC$A8,po+Eh=:F(oQ1+>#c"-Tc']A8Gt%ATD4$AQDMn%13OOEap4r+=D2>+Dl14
+D,>(ALBW%D/=89F(96.%17,c+Bos9Eap50@rs(]3__n-;GUY.C2[Wi+D58-+=C,a6r.0)De*Zu
FCfK$FCefrA1%fn%14L>+?CW!.3Kuc%15is/g,:UA79Rk+B(fs1,Us4BOPsq+CT.u+Cno&AKWC<
Dfor>@;0U%FD5T'.3Kc^.OdM5+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0%16cWF(d]t+EM4)1,Us4
Eb/Zi+D,>(AISu]De*ZuFCfK$FCefm@<6*m@<?('Ebmm"+=Lo3F(dXEA79Rk.3L#m+>G<n+DPh*
Ch\!&Eaa'$?YEkhBOkOnAT`$0%16f]/g)hj4WlpBHZX+DCi<f+E-67F-YdR1Ch\!&Eaa'$?YEkh
BOkOnAT`$0-Qlr</e&.1+>G!C+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T
+D>2)BHV22F<G^FA79RkA1&KB%16Z_F(HsH0b"J$DIb@/$7QDk%14L>+?CW!.3N5:Ch5\L@rcGr
$7BG"Ch4`1@rcH74Y@k&%16f]/g)hjAM,*>F(8f/4s2sL/mg=U@qK@c4Y@j)+FZpY6m-qN5sn:D
-Qlr</e&.1+>=pB+EM47GApu3F!)iBDerrqE[YuX+Du+>+Cf>-Anbn#Eb/cB+=A^MAnP]uEb0?8
Ec*KP%16ZaA1e;uBkAt?An?4$F*(c(?Qa90F?M6!-u*1#CNDX"+DPk(FD,#r?Q^_F8jPg;;_KLL
F(96./13(u.4fOMEc*EU/no'A-Qlr</g(T1+<W(QART*lAnc'm.3NhTBlmo/F(fK9E+*g/+E)CE
%144#-p'220RI\IF=A>VEbTW,+EM47GApu3F!,4+@r$-:-WEl0:L@jTA8Gt%ATD4$AM.h1-OgDo
DIb@B%14Nn$4R>+0RI_K+E)1:+BosE+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6#(=KCh[uF3B:FU$=\-lCh-mlF`__:EcXuB/h1=QBl%<eE-68EATDi7F"Jsd@WcC$
A0>i6FED)7F!,UEA79Rk+D>2)BHUhoFCd'6$;No?+:SZQ67sBjEb/[$ARmhE1,(I=@<H3:3"63i
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91LY6C1,U1_A867.F<G[D+D>2$A8Gg"Eb/Zi05k`E
Gp%'KF<G+.@ruF'DIIR2%143e$=e!aCghC++EVI>Ci<fj5s[eUF`_YF0KD.#4ZXrV5s]I4FE2FV
3B8H0>9IEoATD4#AKX)_5s[eUF`_YF0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$4ZX^6/nA[,
+>=63%17/dEc+$$+=D,NFED)7F!hD(%159QHZ*F;-ZsNFCi^sH>9G^EDe't<-OgDH0RInYE,9H&
+D58-+?MV3Eb/Zi+Eqj?FCcS9BQ&*6@<6K4F(eu;2)ZRcAoqU)F*)FF@V'.iEb0<6EZf+7Dg*==
DJs`<Df^"CFD5T'F*(i-E$-MZF(96./14e<@<6*m@<?('Ebm*4$4R>;67sBpDKBB0F>%ZGE,8rm
AKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159QHREiD+Dt\4-TsL59gM-E:L@OF
De*2tB4Z0--W!T;<*q"(F(96.%13OO-o2u,+>>5e-RU#G$>F*)+>=p$+?hK+9gM-E:L@OFDe*2t
E-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?fDI[iQ3Zotk@s/u*D_;J++<WB]>9J!#Dg-//F)rHO
E-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf"NF*&ODEc5G1FD5T'F*(i-E$0%:F<G^FA79Rk
A1%fnAScF!/g)kX$>"*c/e&.:%13OOEap4r+=D2>+Dl14+D,>(ALBW%D/=89F(96.%13OO-o2u,
+>>5e-RT?1:-pQUF`:l"FCcRn83o!g2BZ[AF(c\)DIal#@<?''+:SZk@<6*F/g,4K@59\u+ED%%
A0>JuCh4%_.!&m=DCd/BBOPsqA79RkF`M:G.6T^7-tm%1BKL<MD.Rd1@;Ts+-RU>c-nlbu.=E<_
/otNCDCd/BBOPsqA79RkF`M:G%16f]/g)hj4WlpBHZX+DCi<f+E-67FF(96./14e<@<6*m@<?('
Ebm*GA8a(0$6UHG+Bot0BQ&*6@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^ZATDj+
Df.1<@<?'5BOPsq+Du+>+E_X6@<?'k-OgDoCia/?+>F<4ASu$2%14Nn$4R>+0RI_K+E)1:+BosE
+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#^sgEcWop3F<4&A8lU$
FAm$pCLo1R:-pQ_A8lU$FAm$pCLo1R+ET1e+=Lc>F(KGB+@].)6Ua^8;cH1`:dJ&O+Co1rFD5Z2
@<-W9D/XT/+EV19F=n"0:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<W?e+EMX5DId0rA0=Je
F(KE6Bl@l3G%G]'F!)lPBOu!r.3N&B@;0Od@VfTb$;No?+<Vd].3L$RDe*s$F*(u6.3N>G+CQC/
Ddd0!F(96)E-)Nr:-pQU+<WEg+FZpY6rZTR<$5mr+CQC&Df00$B6A6+A0>K&Ch.*t%15is/g)8G
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`SDD=-\$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sBt@;BEsC2[X)ATMs)EZet7Df$Uh:IH=9BleB:Bju4,
Bl@l3A8,OqBl@ltEbT*+%15is/e&._67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5
-RT?1:-pQU+<YN;F!)iFDe*s$F*(u6-OgE!Ddd0!-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&+AP6U+?M;#+AP6U+F.C4
D.R`1Df-[,$4R>;67sB4HW3F4<$5+=5uL[1/I`$r$;No?+CfG'@<?''@3BH!G9D$GBlS9,+Co1r
FD5Z2@<-W9%16Qb@;]UnATp9u+=D#EG%Gc,F*&c\,!'7KA8ZO,?X[\fA7$H,-OgDoEZf72G@Vh*
Ea`irDIn#RDers#Ddtpk+DPk(FD)dEIS*C(<(0_b0./;[Ea`irDIn#$$4R>;67sC!E+No0@;]Tu
F(KG9;FNl>:JOSd%16Ze+E(d5@WGmpA8Yt&+BosE+E(d5-RT?1ATAo(E-#T4+=C&U5t"LD9N`_P
$>"6#1E^UH+C]A"DIdWrG7=lg$;No?+E_RBAS5^uFCfJ8FD,5.A8,OqBl@ltEd8d9DIal,Dg#\7
FD,5.Anc'mF!,RC+CT/+FD,6++D,P.A7]cj$>"6#1E^^LB4N,oEa`irDIn#7%13OODIn$.Ddtpk
+DPk(FD)dEIS*C(<(0_b05b?FCi<f2/0[,cBk2+(D-p^dDe*2t-RT?1D..3kA8-'k@;9^k?Q_IK
ATqs/@grbS$7I\Q3Zp+*+=ANG$>F*)+A#%&:.\P1+<VdLA8a(C0d'[CF(f-$C`me4Dg-//F)rHO
D0@$L/8o?8Ci<f7-SHSi/8f$CCi<em$>"$pASGa/+A#%(8PUBNA8a(C0d'[CF(f-$C`me4Dg-//
F)rHOD/XT/+=A^YCh.@#@k8uM-S0.HGAM2-%16Z_F(HsHF(fK9E+*g/+=D;LF*2G@DfTr2A0=ZH
-QlV90H^f3ASu$2%14Nn$4R>;67sC$AS5^uFCfJ8A8,OqBl@ltEd8dADBNh.G9C^?@psInDf-!k
ATAo6AS5Nr@WGmpA8Yt&4)SVRCi<f7-SHhu@WGmpA8Yt&%13OO:-pQUDfB9*+DG^9DIn#7Ci<fl
FD5Z2%16Ze+E(d5@WGmpA8Yt&%13OO:-pQU@<?U&D/aS>FDi:CATT&8ART+&GB.D>AKWQIF(fK7
Ch+Z/ATW'8DBNe)F*(u604\d,FD5Z2@<-W9D/"'.@<?!m%16uaEZfF:Dg-//F)rI7E-#T4+=C&U
5t"dP8Q8,+%13OO:-pQUAoD^"AKYhuF*(u6+E1b2BHV#,FDi:4Bk)7!Df0!(Gp$O5A0>AuDf]J!
$>"6#A8lU$F<Dr#:JsPK9gM]W78crJ<(JAG$>"6#1E^UH+=ANG$4R>;67sC$AT)O!DBLMRF(fK7
Ch+YsCi"$6+ED%%A1r.IBlmo/F(KG&$>"6#De'u"Ea`irDIn#$$>"6#A8lU$F<Dr/76s=C;FshV
-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GbA5d>`CLo1R:-pQ_De)d`Deio<0HbHh/KcH[
A18XCATMr9DfB9*Bl7Q+De:,'DKKT5AKYr#FD)dF2BZpK.3NPJFD5Z2/e&._67r]S:-pQU@<6L4
D.RcL%15is/e&._67sB'+>>5e@rH6sBkMR/ARloU+EV19F<G16Ch.*t+A,Et<(0_b/0K"U@;]Ua
Eb$:b+E_d?Ci^^IA8-'8+Co2,FE1r(.1HVZ67r]S:-pQU@rc-hFCeuD+>PW+1hL<.0KBRL:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*
;H/&r%13OO:-pQUBlbD/DerrqEZek1DJ!TqF`M&(%16fj@qHi2IS*C(<(0_b-OgCl$;No?+E)41
DBNA(C`m8&@ruF'DIIR"ATJu4DBL?9A8Yp,+E1b2BHSlLG%G]>+Dbt6B-:r-A0>i"FD)*jATAo7
ATW$)Bk)6--XgP'A1&K/$>"6#F(fK9E+*g/+>t?\A0<7.A8Yp*%13OO:-pQU@UX=l@j#5hA0><$
B6A'&DKI"CATMs7%16Ze+>Y-YA0<6I%16uaEZd7_De't<-OgE#ATAnO+E(d5-Y..,F)Go<AU%p1
F=.M)DImi22BZpK+>bks+AP6U+DG_:@;KXg+DtV)ATJ:fDImi22BZpK+>Fut,U[kGA76hp$4R>;
67sBmBl\9:+Co1rF<GL;+>"^SFD,6+F!,10DJsQ,A0>H,ASrW)AftPkA.8lWEZd7_De't<@:X7d
-T`\72`NcV3B9)[3B9)[3B8Gr$4R>;67sBmBl\9:+Co1rF<G%$A.8l`ATAnO+E(d5-[0TLDJ*Em
FCSu34""HIDIb+($>sEq+>t?\A0<6Y2`NcV3B9)[3B9)[3B9)[0IJq0@:X7d-OgCl$;No?+EM+9
+EV19F<G+.@ruF'DIIR"ATJ:fATAo7ATW$)Bk)6-FC])qF>,j=+=D8BF*)/8A2#\b%16Ze+EM+9
FC])qF<G[9Bk)6>4ZX]5FCfN8C2[W:0ddD;ATAo7ATW$)Bk)6-FC])qF>?!?+=D8BF*)/8A2#bd
%13OO@r-1-@UWb^4ZX]A+?CW!%15is/g+Y?Df]J4@;^?5DfB9*+CT.u+E)41DBO%4F*&O8Bk)7!
Df0!(Gmt*/-Y?e$C`mY8ASu4"B-8ci+=A^c.3N&?F(KB6+D#R9De'u9+BosE+E(d5-RT?1%15is
/g+Y?ARTU%@;^?5@s)g4ASuT4E+*j%%14L2AmoCi+E1b2BHUf$ARTUnDJ((D4s24(GpskEF)to5
F<G.8+CoG4ATT%B6VKp7;G]YY81+iR%15is/g+_G@<6!&@;^?5@s)g4ASuT4FCfN8+Co1rFD5Z2
@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%14d30I17AEaa$#+>G!LBlY=_
5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*@ru9m%14Ip@;0O#@UWb^F`;CE
AoDg0A1&L.F)to5F<GI4EZd(n+C]5)+=Ach%13OO:-pQUG@`.BAKYW(De':a0b"I=%13OO@r-1-
@UWb^+EV..@rsC6$=dmmFCJZgCER_0Bk)6>%16T]Ecbc!@r!3/A8,Oq1(=R"$;No?+E)41DBNA(
C`mh2F*&O8Bk)7++CT.u+CfG'@<?''@3B3'Dfp"A/Kf.KBlbD0Bm+'/+EV:.+E2IF+Co1rFD5Z2
@<-W9@3BMtFD)*jATAnL+E(d5-RT?1ATAo3A0>u)Bk)6=4*5"I@rsFeFC])qF>=sJ$4R>ODf7d"
88iE03bD/`4ZX^"/g*"\$>"6#FDYu5Ddso/F`\`f3[\BTD]hShD]iXf:F?SYATAo+Ec<-_3[[I:
Db"hdF`8I4Df6ahDf6b1:JW>\%13OO:-pQUE-67FA8,OqBl@ltEd8dH@<?/l$?0Np@<?0G3ZpM2
3\bu%G$eZmDe*2tA8,QsINU<R$4R>REZd.\De't<-OgDoEZd7_De'u4A8,Oq0F\A-A2\C8FD*fu
+?Op20mdqa?X[\fA7$HiBk/?8+>=63%15is/g,+AFD,_<F(fK7Ch+Z*@<?!m%17&bE+*j%+>#Vs
De(bF@<?/l$4R>;67sC&BOu6r+Co1rFE8RGBQ&$0A0>PoG%De-D/aTB+E1b2BQFUiATAnL+E(d5
-RT?1ATAnO+E(d5FC])qF>443-SHhi4Wlh53\bu%G$eZmDe*2tA8,QsINU<R$4R>REZd.\De't<
-OgDoEZd7_De'u4A8,Oq1(=R<0..l*+?Op20mdqa?X[\fA7$HiBk/?8+>=63%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,%17,eF*(qkD/X3$0JH6g/h1mQF*(qkD/X3$0JFVk/M/(nEb0<6A18XC
ATMr9@UWb^F`8IDATMs3Eb0;E%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\,SDf00$
B6A6+A0=JeFCfN8+D,P.A7]d(8l%iS78m/:+EMX5DId0rA0=JeF`_>6F!)lABlYaIATD4#ALns9
ATD4#ALS&q:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+Dtb7
A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b+AP6U+CfG'@<?&i$;No?+<VdL
+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-Ql/N/g,1GB5)F/ATAo)
G][A3F:ARP67sB'%15is/g+YEART[lA3(hg0JYIsAR[>L%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?
@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]5
5s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3Zoel
ATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+_G@<6!&@;^?5@s)g4ASuT4
FCfN8+Co1rFD5Z2@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%14d30I17A
Eaa$#+>G!LBlY=_5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*@ru9m%16ua
EZd(n+C]5)+=Ach%13OO:-pQU@<?U&D/aS>FDi:BATMs3Eb-A;Bln#2DJpY,@:O(qE,uHqDImi2
Eb0<6A0>u)Bk)5o$4R>;67sBpDKBB0F<GU4DId[&+CT;2@<lo:+C\o(G@b?'+C\bhCNXT;+EVNE
Bl8!7Eb,[e:-pQUBOPsqATJu.DBO%7AKYl*BOPsqATKJGG]Y'LBk1db@<*K&Bl%@%+Co1uAn>ul
$>;.W3Zr*EF(f5q@r"4g+?q_+2'=b%0eb:80JG0i$><jhBPhg'4ZX]5Anc:,F<G%$@r$4+-OgDo
EZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze+E1b!CLeQ0
A8,Oq%13OOBJM_3+D>2)BP:gaCHX^$5;aQ@+>kE!0JG170JEqCBOPsqD0'>Q3ZoekARfXrA0>>i
@r$4+-OgDoEZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze
+E1b!CLeQ0A8,Oq%13OOBJVe4+D>2)BP:gaCHX^$5;aQ@+>kE!0JG170JEqCBOPsqD0'>Q3Zoel
BPDKt+C\bhCNXSD%16Ze+EVI>Ci<f+E-67F-YQq0BP:gaCF9PuATAo8D/a<0@j#`5F<DrE@<6+!
F(Zj0$>"6#E+*6lA0>u)Bk)5o$4R>;67sBhCht5-@<6*nF!,O;Dfol,+E1b1Et&IfEZf%(F(f-+
4ZY;V+C]5)+=Ach%14R;0-E>!0d&1nI4cX_G$eZmDe*2tBOPsqATJ:f%15is/g+Y?ARTU%F*)>@
ARlp$Dfor=%16Ze@<6!&4$"a&@<6*q@:O'qBOPsqD0'>;%13OO:-pQU@UWb^F`8I@F_tT!EcW@8
Ec5e;Eb/`lDKI"CD]it7A7]h(%16Ze+C]52D0%j$+C]5)+=Ach%16Q^F_u1_3ZoV!-9`P#I4cXO
DKTf;.3L2p-8%J)-S?bU$4R>;67sC$ATMs3Eb-A8BOr;uBl\9:+C\bhCNXS*$>"6#Eb0<6A0>u)
Bk)6HHTGVRF_u1/$4R>;67sC$AT)O!DBNt2F*)>@ARlom@:O(qE"*.cEZf:2+EV..@rrht+>Y-Y
A0<6I%13OO:-pQUD.Rd0@:s-oF(fK7Ch+YtAKW@4Bl\9:+C\bhCNXSD%16Ze+EVI>Ci<f+B4Z0-
-YQq0BPhg'-OgD1Anc:,F<G%$@r$4+-Qk!%+D>2)BPhg'+:SYe$;No?+CT;2@<iu:BQ&$0A0>_t
FCSu,Anc:,F<D#"ATAo8D/a<0@j#DqF<DrE@<6*q@:O(#%16c'+>#VsBOPsqBOPCd%13OO:-pQU
Eb/Zi+CT.u+Eqj?FCcS(H$!V=%17,e@:VM^+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>
AN`'s0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$4R>;67sBjDfBtE@;]TuEb0,sD.Oi.Ch.*t+C\bh
CNXS=GAhM4+D,>(ATJu4G%G\'$;No?+Dtb7ATAo&@:O(qE-!-R+EV:2F!,[@Cht5.DKKo;A9DBn
+CQC+@<6*)AmoCiF`M%&$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%16ioDfTB04ZX]rBl\<9
ARuuN5tbQl6qf-Z.Va0GEb'5DBkh6-%16ioDfTB04ZX]6>WNu^+F>:e+DQ+=Eb'5?HYRbCEb'5#
$7Kq+@:UKB0RJ.-C3OT:A901BGB.D>AKX&gH[@A[GAhM4Et&IfEZf%*CM7-tBOu6J3Zp.9+C]5)
+=Ach%13OO:-pQUBl7HmGT^p:+C\bhCNXS=GA2/4+D>2)BHUnqBl%p4AISuU@:WhU@r"4g+>=pP
/q+om/h\D'+<W`i0d'aE0d&1nI4cX_G$eZmDe*2tBObgk@<6*nEt&Ic@:X7uD*9p&+tb9*@UWeV
@:O'qHQ[_h+C]5)+=Ach.3L2p+=Ach+:SYe$;No?+CTA6ASlC.+EVNEEb0?2Eb-A&@:UKi@:O(q
E$-_TBOPsq+D,%rCisc0+D#e:ARfgnA.8l`ATAo6ATMs(+EV..@rseA@:X7uD%-g]$;No?+DGJ+
DfTD3BOPsq+D,%rCisc0+>"^RDfd+BARfXqD.RTqARlo8+@nds80C&<0fL4bDe*Dg$>"6#Eb0<6
A0>u)Bk)6H@UWebF_r[#5uU<]@;9^k?O[>O$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:FU$3  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o0H`/-+>Get1GU(-1E\J-+>GVo1c-=8+>bu!0esk,3+?cA;f-GgAM>kf@W$!2+EV19
F<G7*F(c\.@;0P#Eb-A(ATVKnFD5Z2@WcC$A7'(iA8Gt%ATD4$AR]drCh+YsDIal#BleB:Bju4,
AKY`+A8Gt%ATD4$AR]drCh-mlF`__:EcY]4Bl%<&E-68EATDi7F`:l"FCcS.@<6*)A79RkA8lU$
FAm$pCLo1R-tI:<ATT@D7ScoL786'H<(0\]5u^AtA8,OqBl@ltEd8dEDg#\7FCfN8De)d`Deio<
0IUjM.3N_DF*&OCE+Np$DJ()1AftZ&FD5c,+E1b2BHS]]+E(d>+E)4@Bl@m0ATMs(;f-GgAM>ed
Eb0<6A18XCATMr9@UWb^F`8IDATMs3Eb0:                                        ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f_$40f^@4+>G_r1*AG/2)6:00H`+n2)@'L+>P_q1*AP82DQC02BXat0f([H+>G\q1*AS;0H`))
+>P&q1,q381,'h++>GT)1*A;*+>P&p2D[?Q+>GYp1*AG02`;d60d&4o0eb:81E\Y"1*A>12`Dj6
1a"Or0ebIA+>GPm1*AM90fC./0d&4o0f:aG+>Gl!1*A;*0f^@22]sju0f(^D+>GVo1*AJ82)ud;
+>P&o1,Up30f1".+>GZ.2bHk66<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1a#D!DBL\g
1,L+.1cdBJ3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp.;+A-'[+>PW+1a"M/3]&WR0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@K@;[2C0JYI-
0f;!L3'&oN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,'hC@;[2C0JYI-0etdE3'&oU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,'hC@;[2C0JYI-0etdH0fh!H$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,'hC@;[2C0JYI-
0f(jI0fh'I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU1,0nD@;[2C0JYI-0KD0K1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,0nD@;[2C0JYI-0KD0L1cd<N$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,0nD@;[2C0JYI-
0KD0N0KLmI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.8
+<X'\FCdKU1,0nD@;[2C0JYI-0ebXB0KM!K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fT$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nD@;[2C0JYI-
0ek^G3'&cJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.;
+<X'\FCdKU1,0nD@;[2C0JYI-0f(jI0fh-J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,0nD@;[2C0JYI-
0f1pI0KM$F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI3'&cM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JO\>ARZc;0JYI-0f;!K1HI9G$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0JXb?ARZc;0JYI-
0ek^E0fh-H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp18
+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E2``WN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0JXb?ARZc;0JYI-0f1pH0KLsL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0JXb?ARZc;0JYI-
0f1pI2**NR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1;
+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI3'&fS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0Jah@ARZc;0JYI-
0ebXF2EE]T$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp45
+<X'\FCdKU0Jah@ARZc;0JYI-0ek^D0KLmD$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0Jah@ARZc;0JYI-
0f1pI1-.3M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K
3Zp+6+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heCj6?R!YA0=Wi
D.7's3Zp49+<X'\FCdKU0JstBARZc;0JYI-0ebXC1-.6O$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp+6+@]pO+>PW+1a"M,3\`QS0Ja%C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>>bt7V-$O1,(I?
+>PZ40KD0N1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU0K:1EARZc;0JYI-1,1gG1HI3E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^H
ATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf3$:\%@N[E[1,L+/0fh0N3\WQ$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+9+@]pO+>PW+1a"P/
3\iQR1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>>eu7V-$O1,(I?+>>f:2*!]T3=8AS6rZrX9N+8X8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf2'>M"DBL\g
1,L+.1cd?H3]/Z"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=Wi
D.7's3Zp='+@KX[ANCqg1a#D!DBL\g1,L+.1cdBJ3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&DBL\g1,L+.1HI?K3\`>r
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[
ANCqg3?Uq&DBL\g1,L+.1HIBO3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg3?Uq&DBL\g1,L+.2**TS3]/Su$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,'hC@;[2C
0JYI-0etdE3'&oV$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t0d%T,@<?'A+>PVn8muT[1,(I?+>GW41bh$F2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp13+A-'[+>PW+1a"M/3]&QP
1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp
+@KX[ANCqh0d'(sDBL\g1,L+-3BAlO3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,0nD@;[2C0JYI-0KD0L1cd<N$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo
8muT[1,(I?+>>f:1b^sE3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0fC-s6t(1K3Zp14+A-'[+>PW+1a"M,3\W6K1H,XJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh0d'(sDBL\g1,L+.
0fh*L3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp.:+<X'\FCdKU1,0nD@;[2C0JYI-0ek^G3'&cJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo8muT[1,(I?+>GZ51bh$J1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K
3Zp14+A-'[+>PW+1a"M/3]/`T1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh0d'(sDBL\g1,L+.1cdEH3]&Pu$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1,0nD@;[2C
0JYI-0f1pI3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1E[f.@<?'A+>>Mm7V-$O1,(I?+>G`71c%0J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+3+@]pO+>PW+1a"M-3\iEN
1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes
+@KX[ANCqf1*B%t@N[E[1,L+.0fh'K3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0JXb?ARZc;0JYI-0f1pH0KLsL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>>Pn
7V-$O1,(I?+>G]61Gq3M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,pC!6t(1K3Zp+3+@]pO+>PW+1a"M03\r`V1,oUJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqf1*B%t@N[E[1,L+.
1cdHO3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU0Jah@ARZc;0JYI-0ebXF2EE]U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>So7V-$O1,(I?+>GT30ebXB1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K
3Zp+4+@]pO+>PW+1a"M03\iZU0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqf1E].u@N[E[1,L+.1cdEJ3\r]%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU0JstBARZc;
0JYI-0KD0O1HI6L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=!2'=#0@<?'A+>>Yq7V-$O1,(I?+>GQ20etdH3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heCj6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU0JstBARZc;0JYI-0ebXC2``WK$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
0K:1EARZc;0JYI-1,1gD3BAuP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0K:1EARZc;0JYI-1,1gG1HI3E$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0K:1EARZc;0JYI-
1,1gI2``WQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!
E]P=#+<X'\FCdKU0K:1EARZc;0JYI-1,:mG2**KH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0KC7FARZc;0JYI-0KD0O3BB#X$;+)^
?Z0CpATDs*A7&ngEc5u>?Z^O71,Vfn/h0Ih6sjkAF(KB8ARo.ZEcQ)=F!,NU/KeMFB-;#/B-:W#
A0>o(F)Z&8F(KDF%13OO:-pQUHZO:;Ec`mOAh@q1F(KB8ARmB(EcQ)=F+"K)%15is/j)9F0e"5T
Eaa$&3Zr?Y+DbV%Bln'+@<?''-tI43.3N&>B6A'&DKI!LC2[W9C,I\%.1HVZ67sB93?V%)EZd+k
0Jst-1HIBI3\`H#$4R=b+<VdL1a"OrA8Z3+-Y.?I%19tYEa`j$+D#S6DfRl]DJWg)D@HriZQLA5
DegJ-+<VdL+Du=2DJWg)DBO3W%13OO:-pQr4t&-7+D,>43Zr9XA8,XiARlp*BOr<0ATD6&-tI43
F(Jd#@q[;6FDi:9DKBr@AISuA67sC&BOQ!*@;^?5DKTc3+EM+&Earc*Ch[s4F!,FBDfB9.Cj@.A
E+No0FDi:>F_kk'$;No?+EV%$Ch7Z?+B3#gF!,(/G\(q=FD,5.Ea`j$+D#S6DfQsP+EV:.+Cf>#
AISuA67sC)Dfol,+D>2,AKYSnBl%?k+E)-?DffZ(EZee2B6A'&DKI"?@<?U&Ec,qL+D!0</g)qm
1*C+FC`k*7Df7!G%15is/g,@PFD)e7D]j+DBlmp-+EqaHCh+Z%@<Q3)AmoCiARlnm$;No?+<WTc
6#^ie1,(C>+>G]60JkgG0b"I!$4R>;67tA`-o*4o@rc"!BK@8[BOu'(@<?U&D/aT2DJ()6D]j(3
B5)F/ATAo%+E2@4+A*b6/hf*k$;No?+Co1rFD5Z2@<-WG+<XWsATD?)BlbD*+EMI<AKYGrDIIR2
+DG_'Df'H%FD52uCh\!:%15is/g+h=Eb-@F+Co1rFD5Z2@<-'nF!+t5ART[lA0>?,+A*b6/hf+)
A8`T.Dfd+CBQ&)($;No?+EV:2F!,%7Ec5t@/KebFA8,O^FCfM9DImBi+D,P4+Dl%;AKZ#3@Wca6
+D#S6DfQ9o:-pQUFE1f/E+s3&+DG^9@3B/nG9CpEF`_>8ATKI5$;No?+>Pr"9jr&b1,(C>+>G]6
0K(sJ1(=R"$6UH6Eb/lo+=CoHDJLU]-Y#2BC12-nBk)7!Df0!(Bk;?jDImp,@;0UaC12.#ATVct
Bl5:-$Gs,[Df&osDBNM2Ec5tZ+DP8(ART*Y$Gs+l+<Y9:AS""W+<VdLC0u!m@:UKo4(\p/%15is
/j2BH1+=>XBm;Z]FD,5.C1_0rATJu;ATD7$+CT;%+Du+A+CehrCh7-"FD,]5F_>A1@;ZM]:-pQU
@:XOmEcYe73]\C*Ea`p+ARlotDKKH1Amo1\+CT.u+CT)&+EVO@+DbV4AS`K!DfTCu$;No?+A,Et
+EqaEA9/l%Eb-A%CiaM;FE1f/E+NQ4+<XWsBlbD.EcQ)=+EqO9C`me@Bl%T.De!:"EX`@N67sBm
DfQt7DI[U%E+*j&@VfTu@VK^gEd8d>Bl%@%+C]J8+DGm>DJs_AE,ol9ATDU4+EVX4E,]B!/e&-s
$4R>;67tA`-o3:pGB.V>B0%.`A8-+(.3N/>ATJu3Dfd+@Ec5o.Ebp"DA8-+(CghT3F`(o'De*E%
A79RgFEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%144#+<Yf;4ZX^.3ZoelBPDN1BlbD>
DJ<U!A7[+t$6UH6%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth+<V+#+<VeGF`\`RF^uj/$H&=M
KYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrDZKYrJ\KYrJ[^C:OeZSB>'
0d([YEb$S>.3NSPF<G:8+>#doZYFW#CVmCe$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrAYKYrJ\KYrJ\R10KG+<Y69@<6!&-ZrrI%14g!$6UH6B4Z0--ZrrI%1:"A
_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0uC7O+EqaEA12LJ+Co%q
Bl7Km_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_jLr@+<VeLA.8lf
BPDN1BlbD>DJ<U!A7Z2W+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg$6UH6%144#+Co2-E$-NNA1&Kp
67sC%BQ&$0A0>DsF)Yr(Gp%3BAKX9;6V0ilG%G]8Bl@l3AoDL%Dg,o5B-9eh@rH7.ASuU(Df0V*
$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ[^C:OeZS98&+\GNu+D#S6DfRl]A7]@eDJ=3,Df-\0@;0P#Eb3+o%1:"'_h>pY_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_jLr@
%15is/j2BH1FXGYBm;Z]GAhM;F!,17+DbJ.ATAo:ATDj+Df0V=De:+a+>"^XATMr9@psFi+Co2-
E)gdi@rGmh0JG3j$4R=O$4R>;67tA`-o<@qATDg0E]P=bBOu3q+DGm>@3BB)DJ()5FCB&tBl7Q+
E,ol+Ch7H+GA2/4+=M,9D.R3cFE8lRBl5&8BOPul$;No?+<Y3+@r,RoARlp)@rH<tF!+n3AKYl/
F<G".G@>c<+ED%8F`MA2A0>B#EcP`$FDQ4F%13OO:-pQr4t&6:+D,>43Znk=%13OO%15is/j)9F
2(9YZEcQ)=3Zohf@;BF'+Eq78+D,%rCh[d"+EVNEB4YslEaa'$+D5_5F`;CEGA(Q*+EV:.+Co&&
ASu$iDKH<p:-pQUCh[s4+D#D/FD5;s+EV:.+D5_5F`8I>BleAK+<V+#%144#De't<F`_>6F!i)7
+>Y-YA0<6I%13OO+<WE^?SWa@@;BEs-[0KLA7fb#D..O#Df-p3$4R>;67tDb-oEFrAncKN+Cf(n
DJ*Nk+=M)8CLq.".3N_N+D>2$A8Gg"FD,B0+Cei$AM+E!%13OO:-pQq4X`3;+D#D/FEo!AEc6)>
F!+n3AKYl/F<G(6ART[lA0>?,+EDUBDJ=!$+CoV3E-#N0BlJ08+C\nl@<HX&+D5_6+=D&8D.P(V
-RT?1:-pQUAmoCiF!,C=+CT.1Bl8*&Ch[E&DIIBn/g(T1%15is/j2BH2CTb\Bm;Z]-tdU<@;BFo
.3NJGA8,XiARlp*D]j(3D/XT/+CT/5+D#D/FD5<-+D,Y4D'3_)D.RNtF*&O6AS,k$AISuA67sBj
Eb/[$Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&Hc$4R>;67tA`-oWRtATDg0E]P<kC2[WkB4WM7Bl.g0
DfB9.Cj@.6Ble60@<lo:F(oN)Ch4`,@;TQu@q]:k@:OCjEZf14F*&O5EbBN3ASuU2%15is/g)o0
+AQiu+>PW)2]sh/3\`WU1c5^L%13OO+<VeADe*9hAKW@2F*(i4-QjO,67sBjF`_[IDIIBn%1;*Z
N8g(PifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufT%1;*ZJhc8L
K&W#RifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>Oifo$;ifo&SP_)Y=
D.V^kJja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K+A?3bF<GOFFQ/O:
6t(@^+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufDifq+8P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*Eg+<][.Jhf#62_[6H0eP:*+<VfdP_(hS+<VdL
+<VdL+<VdL+<VdL+QAW;1,(C@0KCjB/i4[n+QAW;2`W!'+<VdL+<VdL+<VdL+<][.K&W#H%1;*Z
Jfs';K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohiP_'>Oifo\eP^qbX
[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme+<Vd9$4R=b1*@]S
De*9hAKW@0F*(i4F!hD(ifoD]P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
OQ)LV%1;*ZJfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4D'2;^EcZ=FE-69^
P_);3FCcRg@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;ifo&SPap`tJDufD
ifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*ZJfs';K&W#H@NZd9ifo$M0JGF>
3AE6@1bg*q+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G0ek:;0d%UuP_(hS+<VdL+<VdL
+<VdL+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXR,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDuf\%13OOC2[WkB4W2I3[\HZFCB86Eb/]-+<XEG/g,(J+D,P4+Dbb5FE7lu%14m6C2[WkB4W36
/g)qmA8Z3+-RT?1%13OO:-pQq4X`9=+D#S6DfRl]Ci<`mBl7Q+8l%htA9Da.+EM%5BlJ08+D,%r
Ci^_CBOu'(Eb0<6DfTQ0B-:`-D/^V=@rc:&FE7lu:-pQUGA2/4+Dtb7+EV=7ATMs%D/aP=/KeqL
F<G(,ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++CT@7F)Po,+E275DKH<p:-pQU0JstK@rrhK
0JPF-0KD0K0fh'E%13OO0HiJ2+?V#]3\P5dA1q\9A8lR4A9Da.F"_BAE%Yj>F!hD(%1441/hSb!
Df'31FCeu*FCf]=+>,9!/e&-s$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5
0RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.h)h9/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@FOT+\GNu
+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/I^$@HZ$DJ+')+D#S6DfRl]A8_naHlsOSB0@k88Q&;X;dWmBDd-X5/g)8Z+@Jsj9grDr
A8_na%15is/j2BH3%5t^Bm;Z]DJs_A@q]F`CM@[!+D,P4+E)41DBNJ(@ruF'DIIR"ATJu.DBNn@
FCB!%FE7lu:-pQU0JstK@rrhK0JPF-0f1pG3'&fT%13OO:-pQq4X`<>+D#S6DfRl]-td@7@WNt@
Bl7F!EcP`$FDQ4FAo(mgF!,OBD.Oi+De!3l+CT>4BkM=#ASuU2+EVNEF`)2ADffQ$%15is/g+kG
A8-'q@rri+Ci<ckCi^_-F!+m6D/"6+A0><%F(o9)D.RU,/g)9+DfQt3G[YH.Ch5XM%15is/g)i.
+AZKh+>PW*2'=V/3]/`T1bfFH%15is/g,7LATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2+:SZp
Bm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@;Ap&!$
.6T^7>9GF=0H_hf>n%,i%13OO:-pQUBl.g0DfB9.Cj@.DATW'8DK?q;Bm=3"+CT>4BkM=#ASuU2
%16`aDdmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M;'%15is/j2BH3@Q(_Bm;Z]D/"6+A0>T(
A8-'q@rri%F)u&.DJ`s&F<G.8Ec5t@AncL$A0;<g:-pQU0eskG@<itN0JPL/0f(jI1HIBP%13OO
%15is/j)9F0eb%!ATDg0E]P=ZBl7K)Ch[a#F<G.>@qB4^ARlp"Ddd0jDJ()1Ch+Y\:IH=9F_u(?
-t6\#.1HVZ67sB71a#M$EZd+k1,C%-0KM'J3\rc*$;No?%15is/g*T#B5)6p3Zr/t/i51805<C%
@<QlN04\L3GA1q($;No?+@:3bCh,RL@rH4$ATD9p@;ISP0JYF90JY482cMLh3\iTS0K1XpCgh3o
/MT(60J+t3;bTVK7QiI8$;No?+A?KYEaa!63ZpF81bLO;%15is/g+#5+A"si3Zp110J5.72D-a;
1ak771+kC4%15is/g*u,@<?+"Ec!i[6t(+[Bl5%O1^sde67sBPDKBo.Ci!['3Zr/t/i4\bDKBo.
ChsOf:-pQU8T&Tk@;KaV@<?0D+>7kYATDiFC2[d'@UX%`E\D/c1bWT(/i4"E:-pQU6Z6ja@:OC?
+Er$R/o#HGAor6*Eb-k5Df#pj%144#+@T%46rn,4H#IhI?SOMo2_m9S3\`QO1a"P-,UZ;T9grD[
8OH6#4"!rn;aOh_6mk&D9gqcF?UII64"!rn;aOhb5uU`i:-hTC-T`\S6;p3X7S-KV<*rBd9gpEk
-V%');I<!`-T`\CDf0Z;@:OC,4"!rn;aOhc6W?rj<_6+84"!rn;aOhh770IM6rYNq-Uh-)6siMR
-T`\E=@5J`;b0\^<*rTn=B$Y0-V[#u9OC4X7UJP_-T`\M77BmW78-9C?W:0)741/E9gqKE?VNme
;I<=#:+&+N9g_lX?UR=]6ROrC5u^cc?V*X54"!<n;d!Hq78lQ$4"!p;E,Tc=6Z6LH6ZQaHFCdjK
FCcg]-W4MpDfTqeDe*EQ@<6NjE+EC!ALBPf0I/>$4!ua_7lX!r1.+Mg2^^[70JG170JkaF1FG73
0f:^F2`39D-T`\FBl7Eo-T`\M@<-'uH#=uk-SR8/0JG170df%1822nX0IJq1/14@D.6An30eY7?
0/>492]sh13\W6K0JG+50JFV89d`"M-T`\NDfd*fF)u&.DIm?+4!ua90eY:90fU:11-.*C3\W6?
0JG1'5tr^g-W3M`4"!Hl2)$C>-Ugcf0Ha7^8PUCP010o'B-9N]CF;1k-T`\'4!uC;-RUu(0I/>$
4!uj^1cJ&s3($h,1+,.20JG170JbRD1+,.20f:dA2D@!C-T`\AA9fOa-U_B`Depd_-SR8/0JG17
0df%1822nX0IJq1/14@D.6An50/>I>1,(FB+>GW40JGOA0J5%50H`YU-T`\E2)lsF-W<H1+ED$S
+@0g[+A[)mATAnl78P*qG%GQ5F!)l*5p1)`Cj@HW4!uj<0eY:90fU:11-.*C3\W6?0JG1'5tr^g
-UUEP4"!Hr0JFk9-Ugug0H_qi7WNEa+B3B(AKX<UF_)p^-RUu'-T`\'4!uC;-nlo#.6An8<(&Q5
;E%!D0K(:?-SR5.0JP:=0fCC@-S[J82)I*H0df%16"G6g4"!R-FED5.-T`\00eb:80JG4/4"!QR
1Gpj64")X-;^X"U-SmD22_Qp?0fU:11-.*C3\W6?0JG1'5tr^g-UfmP-T`\S78P+IANCr"Cht4i
FD,6++B(^*+@UHbDKKqB-quuMDf0B:.472)1bUR:1,(FB+>GW40JGOA0J5%50H`YU-T`\C81-JH
78trp-T`\E<%p!K/KdN'Df$UrEckq96>UdU-T`\'4!uC;-RUu'-T`_1,VUZ/-S\U[2F0eh<_,/)
-T`\00JG181c73G-T`\12)[-B1bLC5%17K!Bl.R++D#S6DfRBOAU%crF`_>8B-;&0DII&u0HiJ2
0b"J;@3BW:F*(u1+Dbb/BlkJA@<3Q&G[k;rA7]9\$@Es=+<VdL+>=s"0JP\)E+*j%-[nZ`6r6c^
6rcrX;_MTiBeF+7F!hD(Hs80\2-h=XF`V,7F"_9HBPq9fCLqN>C2[W9C2[X%Ectu9D/aPL@Uj+)
Bkh\u$4R>;67tA`-o!G*+D#S6DfRl]@;TIfB5_p6+E)CEE-67FAoD]4D..3k+=D8EBle0#D.P((
$;No?+>Pes6#^ie1,(I>+>G`71c[TN2[p*h67r]S:-pQU7;caPDIkjOC,mn(/hekdATV?805<C%
@<QlN06_,JA8c[5%15is/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MK"51,;f`2**HN3\`BC@r,Rk
B.Yhq/MJb802kP577KEp%15is/g*i%@WGmtGrd'./i>79%15is/g+#5+A"si3Zp110J5.72D-a;
1ak771+kC4%15is/g*u,@<?+"Ec!i[=(uOp2DbjM:-pQU8T&Tk@;KakE]P=X3A*03Bl8!6@;K`h
$;No?+A$HlFCB!%:gnHZ3Zqon05<C%00(XB%15is/g*N"DKK;sF?1OgGBYZSF)PZ4G@>N'/n8g:
%13OOD..3k+=D8EBle0#D.P(;:-pQUA8c%#DC9NK@;p0s@<*K4D]iS/+CT/5FD,B+B-7Wj:-pQU
Blk_D+Du+>+Cf5!@<*K7BOu3q+EV:.+E)CEE-67R+DGF1@;^?A+D5V(F"Rn/%13OO%15is/g,LP
DIb>;Ah@q1F(KB8ARmB(EcQ)=F+"K):et"h?YXLiCh\!&Eaa'$1,0,267u)1;cI+=De*ZuFCfK$
FCcS6Df^"CE,ol,ATMp2EZcb^/h&qE$4:ikDfp/@F`\`t7R9C14ZX]60H`D!0I[?(67sB/C2[X!
Blmp,@<?'0+DG_8ATDBk@q?d,DfTA:F"'-m1,(I?0JP:@C,%Fu2D[/s:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+B1m';c#bT6r-/m+<VdL+AP6U+D,b4C`m\*DIdZq+E1b2
BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BF7L$/g+bEEc#N&@:NkjAU#=?+<XEG/g+bE
Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4EsbZ//g+eIE,961
+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps(q67sBpAmo1\F(Jj'Bl@l3+<Ve%
67sBpDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pj:-pQUBkCit+<VdL+<VdL+<VdL:-pQU
AoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:(c0/g,4HFD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'u
AKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfT_:-pQU
Fa%Y1FCf]/Ed)GBA9/k9:-pQUF`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GB
A9/kT3[],_+Eqj7E$0:9Cj@B8:-pQUGAhM4Ch[u6+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0Ec5e;
GAhM4+Dbb5F<DuW.1.L2$=e!aF`MM6DKI!K@UX=h-OO@%Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@fl
-o2u,+>>5e-RT7CEd98E:-pQUF`V+:@;^?5E+*WpDdso2ATT&/DBO%7AKXT@6m-GhDe<^"AKYT'
EZfI;BlbD6@:NtbDIj/hAhG3MAU%QjC2[Wi+?V#J;FO&D;GoqO:dIiE:IAK'C2[Wi-Qlr</g(KD
+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?TgFm:f9_O78d#P6r60E6r-0WBkhQs?OC@\F(Hs2+<Y`B
Dfp/@F`\`R:f9_O78d#P6r60E6r-0WBkhQs?Qa6)F<GX9F=.E,DIb@,BkAt?.kWJ?-mrtBDIdZq
-RM87.3NS<DK]T34Y@j=0RFp)4"akq+EVF3+=M;EASc0*<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f
/12Pl/Tt]GF(oQ1-Rg/i/g*MZ+CoCC$6UI4D/XQ=E-67F-ZsKEDJ()6BPDN1E+*WpDdtgN-S/4f
8Q/GO:..lF?X[\fA8Gt%ATD4$AR>ce+EMC<F`_SFF<Dr+:K0bD+CSeqF`VXIE+*WpDdso/@<?0*
BkAJtF`MM6DKI"EATDj+Df-[G-S04FDK]T3/12khBlbD7Dfd*c4WlL43A*$=0dd;N+EMC<F`_SF
F<DrFDBO(>Bm:bABOu!rF!,RFGp%0>@<,jkBl7Q+GA2/43ZrW[ATD?)E+*WpDdt.%ASu$2$=dLd
@q[J%+<Y`BDfp/@F`\`R78d#Z;E>q>@;]Uo@j#Z-F<GX9F<E.X@:X+qF*&O(84c`V5u'gD6XO8:
De*ZuFCfK$FCef,$>"*c/da$7<)5nX?V4*^6r-0WD.GC\%147_C2[WnDdso3De*c/Ch[s4>psH+
A7opkE+irqF"_WRA8bgiDe(J>DJ(C@?qO3_6r-0X+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/r
Eb/c(@q]:gB4Z-,AoD]4?qO3_6r-0X/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7
ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CCLVZDIal,@<iu(E,]AsEZf(6+E)@8ATAnm:IIu$Ch[s4
F"Rn/%16KI@V'1dDCosKA8ba]%13OO0eOSV4C;Q62IpYZD`)KN2JurK@Vd_YAn!WDFaA7=5%#L#
Df0W1A7]d(Eb0E.ATqj+B-;&"DKTB(+EV1>F<GdAFD)e?@<-(#F`S[IDf9H5+Dbb-AKXK`@;Tji
Ebp"_+DGpFF!,@=F:AR"+<YTAFD5T#C`m>.EZe%a<+T/S@rGmh+C]J8+A!r(AKYT'F`(_4@psFi
F!,[?ATD?)BlkJ3D/aN6G%G_;E-6&.FEM#6Bl@lA%144#+B3#c+EVmJD]ie/BOPEoDIn!&EZeq2
A90@4$4R=t/g+Oa?Y*tuCiF#BC3F&u@<Z4&DIR`CD(me+2g/Ol?m%gTDKBN&ATAo-D/aN6G%ki,
+D,P0F<Gd=BkM+$F!,17+E2@8DKKH#+CoD#F_t]-FE9&W<+ohcAoDR/+E_a:A.8kg+<Y97EZfFA
F`Lu'+Cf>#AKYK$F_kS2@V$Zj+Dbb6FDPM2@W-'nATAnF+D#V5ARfF_Ci"A>FD,5.@rH1%Eb/c(
FCf]=F"Rn/%14mD+CI<=A9hj/EcO*Y@V@SRF)#MMF)uRdBl[iq3+"jW+@op]D/X<+H=\4/De*E%
@rH1%EcW@3DIal%Df0Z<+CSc#Df]tB?u0n+Ch[s4Bl7R)?m&lqA0>9!@;]Uo@pgF#H#@_4GT^L7
Ci=?.DJ(R2$6UH66ZmEiASuU+Gp%3BATME*E+*6l@:s.m+E_a:+Co1uAn?!oDKI"5Df0Z<+CT.u
+Cf>+DfTnO%13OO1bKnY4C:!e0KEu1DK0?912UGY20<qbG\D,7@VBag5%#L2AThd!G9CR;G9D!G
+D,b4Cj@.7D.7'e+CT)&+ED%*ATD@"@qB0nAoDR/F!,17+E2@8DKI!t6q25M%13OO?s@2[A1_nA
A8ba]%16'16r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgiDe(J>DJ(C@?qO3_?m&EE
6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u
+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_F)to6/e&.eBOr;q@<6!&
1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$&'6?7!gF(HJ9
BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKI5$:/KLD_*#O
ART*l>@;,YF*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=
FCfJGC2[W9BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C
+Acl_DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI@V'1dDCosKA8ba]%13OO
0eOSV4C:*[2e?f82)T>rAhZ&ZD_c0FG;1pnEcPl$5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CK+u
?m'B,FD5Z2+EV:*F<GL@ASuQ3FD,5.ASuU(Eb-A4@<?0*De:,2F`\a:Bk)7!Df0!(Bk;?:+D!0<
/h@G=+<VeUIXZ_T$6UH6:-pQUDfB9*+D#G4Bl[c-E+*j%%144#+>t?\A0<7.A8Yp*%144#+F\cg
ILQVn$8O4V?p%dU11W(VF_#_OD),aB3&c";GVF5b3G*&O?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B0#
Ec#6,Bl7Q+DfBf4Df-\>D]iG)@;BF^+EV:*F<G4-DImisFCfM&$6UH6A8-'q@rri(AS,XoBln'-
DBNP0Ec#k?GA(Q*+DkP&Bl7Q+F(96)E--.R+B3#c+Co2,ARfg)A7]@eDJ=3,Df-\0DfT\($6UH6
BlbD6DfTD3ASbpj@;^00@;]TuBOPs)FD,5.DJ<Tl+D,1nFEMV8+E(j7,%P8)F`2A9DJ(.9F(oN)
Ch4`*Bl7K)AU&01Bk(k!F"AGF/nZdG$6UH6IXZ`p%144#+AP6U+E;OBFCeu*F*(i.A79Lh+D#e:
Ch[BnF:AR"+<Y]GG%>/o4ZX]A+?CVm?!o'U<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=
4"akq-8%J)4?G0&1*Cii%144#+AP6U+Co"*AoD^,%144#+EDOHA7]7]A3DsrH[?l@?mncM9MA/H
;G/3@.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>/mg@\/j:C?4"akq+F,)XI16N++<Z,^IXV_5+<Ve+
BOr;rDf0`0EcYr5DBNP3Df$V<FCB&t@<,m$AU&01Bm=?6+EVNEA7QfsF!,OGEa`ZpBQRj)Ed(r4
A0><%+Dbt6B+51j+<Y*6+EV:.+Co%qBl7X,Bl@l3A8c%#+Du+>+E_a:+CT/5+E(j78ge[&Eb0<'
Ecu#)+CT;'F_t]-F<GI0D.Rc>%144#+CK=7Fs(WEDI>(>+@.,[BOPdkAKYf'CLnW1BPDN1GAhV?
A0>;sF)N18D/`onF<Ft+De*ZuFCfK$FCei&@Wcc%$6UH6Dg#]4@;Ka&GAhV?A0>_tCLnV\+Cf>#
AKYl)@qB['FDi:<Df9D6Blks:$4R=u/g+Oa?Sc/23HdE.F*'3XFYe+t14!YEChYX`B6IWG?m&3U
G9CdGD.Ra%@j#;jFCB9:E+O)5@;]Tu@3B&uDK]T3F(oQ1+E_d?Ch\!:+CJ\3?m&luAKYGnBl7Pm
$6UH6@:Wn[A0>T(+A*b:/iFh#1,(I?C12!61+=>iAKYl/G9CR-G%D*i+<Ve7055<GAS5Rp0e[6Y
FCf)rE\]:^DKKH&ATBU\Ao)BoFD5W*1,!6UDdda%DJ(dZAo)BoFD5W*0fED^GA(Q*AThX*+EV:.
Eb-A%Eb,[e+<Ve:BOPdkATJu9D]iM'DIIR2+DG_8ATDZsCi^_5F<G:7E+*6uF!+(N6nTT)8LJ[m
+CT),ART+p+D>J2+CQC&Df0`0EcYr5DBNn=ARfFqBl@l3ATDg0E\7e.+<Ve+BOr<-ATDKnC`m82
D/^V0DfT]'F<G^IF^]*&Gp%<LEbf_=B5_L%B-:f)Ed(r4A0>?(F<F-t@;R,sDf0&rEc,H!+CS_t
F`\a9Eb/[$Bl7Pm$6UH6A9Da.+EM%5BlJ08+EV:*F<GdACht53Dfd+<Ddd0!Bl5&3Ch.*t+A*c"
ATDj+Df0VK+BN8nC`mD"G%De<D]iS%G%l#/+EMI<AKZ&(BOu$l%144#+EVNE@rH<t/e&-s$8a@X
?p%dTH>#)nCH60HC,L3NA8l9?0Of?LEGfVQ?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B5lF(c\7@VTIa
F<G1(@qfanFEo!NBOQ!*GA1l0+EMXCEb-A%+B(fs/M]1A+D>2)BHVM4ASrW0F`__>DJ'Cc+<VeF
@VTIaFE9&W8K_GY+EV:2DJNs(B-:W#DffZ(EZf:>FD5Z2+Cf>#AKYA82ddbMBOQ!*GAhV?A0>`#
@;[3/FDl22+CQC+@<6*)Df-!k+<Ve7E-681+E)9CFCfN8+CQC+@<6*)Df-\*B4Z0m%144#+F\cg
ILQW,+<Ve%67sC)DfTA2BlbD9F`\a7DIaku+D>2)BHV#1+EMXCEb/c(Bl5&%+ED%7ATDs*A0>r0
DfdT@$6UH6+>=om2^!'^F<DrTDfTA9%144#+<XEG/g+h9F(c\1F!+t2D/`p(ARlp*D]j43Cis;3
Eb0?5Bk;I!A0<HHATDg0EZf(.+DkP/@qZus@;0P!/e&.1+<Vd\+>GetB4Z0--[0KLA1%fn+<VeU
IXZ_T$4R>"/g+Oa?XdqqD)68hG%>]=2edAF2J[)RH"ere1j34i?m&&hF!,(/Ch4`4ATD7$+DkP4
+D>2$B-;D3ASrW!@q0(kF(oN)+EqO;A8c[5+D,>(ATJu4DBNJ1Bm+'/+CSbiATMp(A0>?,%144#
+BD<6+Cf>-DIm="Bl@m1+EqL1DBMtV:*=7l+E(k(/g+,,ATD?0F!,@=F<GFC@qZuW:IH=8@;[2u
D]iY1EZf4-E,]B!+=M&;FED)7-Y6g;%144#+CoM,G%G_;@Wcc8?tNtpBleB(+D#_-DKL#0Ci"A>
Eb0?8Ec,q@0HatGEZeCZ:*=Uk@<,q#+Dbb-ANC8-+<VeUIXZ_T$6UH6+D,20BleA=-SI,fAohKo
Ftba+F(f!&ATKM>De(M9De(M9GAhM4F"V0AAg\#p+<VeUIXZ_T$6UH68l%ht@rHL+A0>E$+CQC4
F_P?$+D#e3F*(u2@q?cmBOt[h+E)-?GA1r*Dg-7FF*VhKASlK2GA(Q*+DGp?F(Jp(+E_R=@;p0s
A.8kg+<Y`=@<,q#+CHiUF)Po,06:f8Eb-n8BP9&6GAhM4F"V0AAmd56+B3#gF!,[@Cht53Dfd+8
ASc<.AoD]4<_uO6D..C&ARlooEbT].Et&I!+<YlAASrVk:ei-IF!,C5AhFN"%15!G+CI<=1GNu2
A8c()CjBuBF^\luF*DPB2`NX5E*ke:+B2onF<Ft+De*ZuFCfK$FCei&Df-\7@:N)3+CT.u+Dbb0
Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO2_H3q?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?
8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc
+EMgLFCf<1/g*hr@WNZ*@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$90X\+<Ve7
4C;VRA9;F!A2,odE-?&+FDbT%12pYZBQnB%5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3
@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBeGT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8
DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nA
A8ba]%16QeBl%<pDe*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$nA8-+,EbT!*FD5Z2+EK+d+D,b4
C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&/e&-s$;No?+CfG'@<?''FCf<.DfT9,Gp%<LEbfB,B-;#/
@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@
6#(=K@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#l
D`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O
6m,r]Bl%<&F`_>6Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjb
B6%r6-Xq44Ch.:!A1%fn%15is/g,4HF<G+.F*)G:@Wcd,Df-\.Bl[cpFDl26ATJ:fC1LjhE]lH+
-V@0&6r-0<8Q$[':IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?
6q0R9;BSS-6rR&N7n#gA6UXLD-OgDtA7TCp4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA;BSS-6pX4/
:JO;L;BSS-6rQHN8PiAS8Q$[':IIWR<)Z1V;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<jBl\8;0F\?u
$;No?+D58'ATD4$AKYMtF*)G:@Wcd,Df-\=@rc:&FE7luF`:l"FCf3*A8PamBkCptF<E7H$;+)^
<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::
;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB
:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q
779^F4%`::7nHZJ8Q%WB:IITH6UXLD%15^'6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl]
;F<lO<'a#C6qL8c$;+)^<_Yt)Eb0&u@<6!pDe't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH
6rR&N7n#gA6UXLD4%`::7nHZJ:I@NA;@NsB$;No?+Co&)FE2;F+C]J-Ch+Z)De!3lAISuVDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16c_F*)>@H"q8.
1,fPQASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+14Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
$48"&,9S]n0eP1'.!KBE.1-D).Nfj"+Dtb7+CK+u?m'B,FD5Z2+E)41DK?qBBOr;tDKKT5AKYr7
F<G+.@ruF'DIIR2+E1b2BJ'W!+<VdL+<VdL+>t?\A0<7.A8Yp*+AP6U+E)41DK?q/Cht54DBL?9
A8Yp,+E1b2BHSlLD..3kF!)l>A8Yp,+E2IF$6UH6+<VdL+<WQbDe'tP3[\QZF!,O@F_;h>FD5Q4
-Ql/N/g,(OASuQ3@;Ka&Df-[GB5ho@+E1b2BHSlLD..3kF!)lDE-!HNE-67F+<VdL+:8H#,9n<c
/hnt4+>"^*AR]\&@<-W92(Tk*0JYI--qIcfBR(^p@n:$LBP([_AKXEPBln'-DCGo"+=\LA83p0F
?n<F.9LV6B?m&lqA0>8`8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^/d_q..Ni,0E-#T4?m'Q"
CLqQ0@3BH!G9CgCFD5Z2+CIZ7;F<lI5uU`O;G]YY873Q^BOQ!*AoD^"ATJu9BOr:n+<VdLE+*j%
+DG^9FD,5.D..L-ATAo*Bl%?'Bl8$2+EV:.+E2IF+Co1rFD5Z2@<-W9AThX&$6UH6+DGF1FD,5.
E-67FA8,OqBl@ltEd8dAF!+jg76s=;:/"eu/g+,,AKYhuBl5&9F(HJ4AdTY'+<Y&]:JsPK9gM]W
78crJ<(LC>BlbD=D]j(3F(KG9FD,5.Bl8$(Ec,<%+E1b2BQG;1DBN=b76s=;:/"eu$6UH6+Co1r
FD5Z2@<-'nF!,R<@<<W*@<Q3)@V'+g+Dl%?ARmD96"Y4MEZet4Earg$B-;/%FD,_<$6UH6+EV:.
+Co1rFD5Z2@<-W9D09oA+C\n)@r-()ARlolDIal1AT)O!DIm?2$6TZu.Nfj4Bk1db@<*K&Bl%@%
+E(j7;b02+1,Us4BOPsqATJu&Eb-A2Dg*=JEbTW;ASrW$F`M26B-7O(+<Ve9@:O(qE$/P-@:O(`
?m'B,ATD4$Bl@m1/g)9+DfQt0@:O(qE$-tm+EV:.+D,>(AKY].+CI#]C1q$sBOu6;FEhn8$47n*
+<WrmDIn#7?t+"i?m'B,FD5Z2+D>2)+C\nnDBNY1E,9*&ASuU$A0>u4+Cf(r@r!2r@:O(qE$/b,
Ch7Yp+<VdL@:s"_DKBnBFD,5.BOPsqATJu8FDl22A0>T(+EV:.+EM7-ARf.h+D,>(AM+;s+<VdL
+<VdL+>Get@W$!)-S?bh+AP6U+>Get4Wm9];b.6&+=\KV?ufh"FC\c%DJs_AEb0<6DfTE1+E1b0
FD56-Cgh?,@UWb^F`;CEBl8!6ART*lDe:,,F`VXI$6UH6+EV:.+DbJ-F<G%$@r$4+/g*GrF)NTP
@UWb^F`8I8Bl%@%+CT;%+Cf(r@r#Xd+CSnkBl8!6$6UH6+EV:.+D>2)BOu6-Bl5&8BOr;rDfTl0
F)Z&8A8,po+EM7-ARf.h+D,>(AKYE!A0>u-AKV=&+<Ve9@:O(qE$/k9+CS_tEcbl'+DGF1@;^?5
BOPsqATJu)D]iq9F<GF/FCSu:$6UH6$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(;+<VdL:-pQUEb0<6
DfTD3CghC,+C\bhCNXS'+<VdL+<VdL+ED%7FCZLAA8YgmALBPo0d%T667sC$ATMs3Eb-A&@:O(q
E$-ki$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(V0eje*2]s5<67sC$ATMs3Eb-A-B5VX.Bl7Q+@UWb^
F`8I:@<6*nEsa$4+<VdL+<V!u,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%
ASuU2+@TgTFD5Z2.1-D).Ni,:ATqZm+Du+A+EV%-ATJu%A8lU$F<Dr/78uQE:-hB=-Ta%j+CT.u
+CJ`!F(KG9-UCZu8P(m!-Ta%j+CT=6A7]@]F_l/@$6UH6+EqL1DBNG0ART[pDJ()0ATo8-Bk)7!
Df0!(Bk;?<$47n*+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)+C\nnDBN@uA7]9oFDi:0
C2[X%@<-4+/no'A?nNR$BOr;sAS,@nCig",+<Ve@F!*1g+EVaHDBNk0Afu;3FD)dN/g+5/ASrVF
+CQBk83ng_2)ZRj@<6*)BlbD9Eb/isG\(D.FDi:DBOr<-FCB33+E(j7A9Da.$6UH6+EM%5BlJ08
/g+,,AKYT'Ci"$6Bl7Q+FCfN8F!,(5EZen8D/^V=@rc:&F<G:8FCf**BlnV]$47mu+<VdL+<Ve:
BPV9iF(f*$E*m$gDe*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKDF!h;%+=\KV
5p1&VG9Ca2@rcK1EHP]+BkD'jEZea]:g$O[?m&rtA7Zls@<3Q#AS#a%@:Wn[A0>K&EZdtsE-ZP:
EZf7<FCep"DejDH+AQisAR]RrCER5'Ch7Yp+<VdL@ps6t@V$['FDl22A0><%+A,Et+DkOsEc6"A
GA2/43XQuP+<VdL+<V"6+<VdL+<VdL:-pQUEb/Zi+Du+>AR]RrCER&'A0>r8DfTCr+<VdL+<VdL
+DGe?DIPai+E_d<3$<6Q@:UK.DJsW.@W-1#/no9MDIOt#+<VdL+<VdL+>b3[F`\`RDJsW.@W-1#
?YOJ)DIOtT8PiPb6=4/9De*3:BlJ?8@L<Gb.Nfj5BOr<*F`\a:Bk)7!Df0!(Gp%'7FD)e2F!,@=
G9CU;+EV:.+D>=pA7]d(@rH4$ASuU2+E(j78l%h^+<VdLA9Da.F"SS)DfQt3G[YH.Ch4`2BOr;o
C2[WnAThH(A8,OqBl@ltEd8d@@<3Q"+E1b2BK?JC$6UH6+<VdL+<Wa,-YdR1A7]p,C2[W*F`_>6
F!h;%+<VdL<+oue+E1b2BHVM-F!,@=F<GOCAThd+F`VAE+EM47GA]#U$47n*+<Wrm@Wc<+Bl8$5
De+!#ARlotDBO+6EcYr5DBL>^/hen51FXG[@<3Q#AS#a%@rHC.ARfgnA1euj+Co%q@<HC.$6UH6
+Dk\2F(&]m+Eq78+DG_'DfTl0@ruO4+EM+9+DbUtA8,po+EVNE?n`]]2Du[sF`\`R-[0KLA1&a4
+D,%rCisc0F!)l08Ol<#/d`^D+<VdL+:8H#,9n<c/hen51a#8!@WHU"Ed8c_3%Q1-0JYF,-rY)1
+@9LQCi=60+@TgTFD5Z2.1-D).Nh>+3A*!B+ED%2@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI
+E(j73?^F<1a%!NF!+t+@;]^hA0>u-BlaV(+<Y]9EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5
@qZupDf'H9FCfM9@3B/uDdda%DJ()8ATDj+Df-\8F_tT!E\7\++=\LA6r6QK9hA;l+Eq78+C]J1
E+NQ&F`8IFD]gqp/g*_t+F.mJ+Dtb%A0>`-Eb-A8BOPd$2DcOeBk)7!Df0!(Bk;>m+<VeFDBO4C
F`JTs:IH=E@<?0*H#IgJ@<,p%A8c1"B-;86D.Rg&Bl7Q+GB.V>B-AB)$6Uf@?uU71B6.H'@:X+q
F*(u(+EVNE@q]F`CER)#DIIR2+Cf>,E+*j&@VKXmFEnu\+Dkh6F(Jl)FD,B0+DG^9E,oZ2EZfO:
EcYr5DCu8'$6pc?+>GK&/i#4*8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!2
$6Uf@8g$,H0Jk.u+E_a:+E(j7>=VCa>psB.FDu:^0/$sTE,95t/oPcC0.A#UDfQt3G][M7A7]9o
E,oN"Ble!,DBNY2FCf)rEcW?1+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dADI[U%E+*j&@VKXm
FEo!<ATW--ASrV_+?;&.1a$4EA0>i3BlA#7G%G]8Bl@m1+E(j78hLGn+<X9P6m-PmDfTE1+D#e>
ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC8g$,H
0Jj+Z+<Y0&DBNt2@:UL!Ch.*t+D#e>ASu$iA0>T(FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9
AU&<.DId<h+DG_8AS5RpF!,RC+CJqrBl%@%?j\#!+Cf>,E,TW*DKKqBDerrqEZdt%F!+t$DBNh8
+ED%%A0>],DJ*O$+EV:.D(Zr1BPDN1G%G]8Bl@l3@:Wni+Cf(r@r$-.FDi:0E-681/.*LB+CJhu
Ddmcq+CT.u+CJ`!F(KH$+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+De:,0AToeGCh+YtBl7@"
Gp$X+FC?;+DBNJ(@ruF'DIIR"ATKI2$6UH6=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8
Bl@l3De:+a:IH=GATMF)+F.mJEZdtM6m->TF*(u6+D,>(AKYH-3XQ3:+<VdL+<VeCDdd0!-YI".
ATD3q05>E9-OL2'+<VdL+<Ve%67sBi@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(A8,Oq
Bl@ltEbT*++CT.u+EM4=F<F0uA8c[0$6UH6+<VdL+=JreE+rft+>k9[A0<6I.3N5HEbTW,+DPk(
FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJFBkh]:$6UH6+<VdL+:956+<VdL+<XEG
/g,1GF*(i2F<F0u@;]TuATD4#AKZ).AKYT!Ch7Yp+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUr
F"_0;DImisCbKOAA1q\7@<6O%E\;'@Ag[p.+<VdL+<Ve=ATD4#AKY`,@<?0*-[oK7A8c@,05"j6
ATD3q05>E905>E9/no'<-OL2'+<VdL+<Ve%67sC$ASc9nA0>u-AKZ#)B5)F/ATD?m+Co1rFD5Z2
@<-'nF!,F1H"h//+CTA6ASuU(Df-[)+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"Gp$g=@rH4'@<?3m
Bl%L*Gp$s8F)tc&ATJ2$+<VdL+<VeCDdd0!-YI".ATD3q05>E9-OLt=+<VdL+<W?]3\W6B+?XCX
@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OL2'+<VdL+<Ve%67sC&D]j1D
AKYo-A0<:0AS,k$AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"G%De<D]j+4F<G[=ASiOs
+<VdL+<VdL:-pQU;FNl>:JOSd+DG^9@;[3+Ch.*t+Eh=:F(oQ1+E(j78g%P[A0>u-ASrW2AS5^u
FCfJ8Bl5%c+?;&.1^XR4+<VdL+<Ve%67sC%ATT&*Bk)7!Df0!(Gp$!R5t"LD9N`KPDBNA*+E)(,
ATAo.$6UH6+<VdL+E(d5-Z<g3A8,Oq-OLt=+<VdL+<Y36F(KG9-W3B!6r-QO=XOO`+<VdL+<VdL
:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t8g&.cB5)F/ATAn#+<VdL+<VdLEb/lo+=D)DA7TCa
F=0-t@lc8eBOu3q06qJYE\Cs;@rsA<F!h;%+<Ve%:K0bD+DGF1H#IgJ@<,p%Df0B:+DG_8ATD@'
FCeu*Bl5&6F`))2DJ()%F`MM6DKI!n3A*!B+CT.u+Dtb7ATA,#+<Yi=EcYr5DK?q=Afs\u+B`W*
+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.D@;]TuEb0'*@:T]f+<Yc>
ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!Df0!(Bk;?<+B3#c+A,Et+DkP)F^])/AU&01
@;0V#+D>\;+EVNEA8`T4BPDMp+<Ve@DBO%7AKWI%F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!
F"/;@E,]B+A8-9@+:8Gu.Nh>+3A*!B-Z^D?BOPdkATJu9D]j.8AKZ,:AKYo'+EV:.+ED%+F_kK,
+D#e:Eb0<5Bl@l3Ch[@!@<-W9?r03g75A6nAoD^"ARlp)Df'&.$6UH6@:X+qF*)81DKKqBFDi:0
Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%+EVaHDIm?$De<T(GA2/4+CK57F`_4T+>@1GE,oZ2
EXEp3+EVNE?ugL5?m'N%@<,jkATKIH<+ohcF(KH8Bl7Q+F(fK7Ch+YtAKZ#)F*)>@ARlolAoqU)
+CK57F'p,2F`)7C@Wcc88K`4qF_kRq+<Ve8A9M[.AKYJrARfLiDJ()(DfQt1EbTW0@ps0r@rGmh
/g+,9Ec,T/B-;,)Aft)kBk)'lAKYhuGp$p;D/")78l%i&F!+n#Bl%L*Gp!G:+<YcE+Co%lC`mq9
FD)e<Df'&.A8bt#D.RU,F!+q7F<F1'F!+J#Bk)'lAKZ&:E,]`9F<G7*F!+n-G@>c<+E1b0FD50"
/d`^D+:95@+CI&LDe't<-X\'*A867.FCeu*FDi:CDfTqBEb/ltF*(u6ARlooBk)7!Df0!(Bk;?<
$47n*+Auc`AU#>/EcQ)=F!)lBEcQ)=F!,17+EV:.+ED%+AU#>/G]7\7F)u&6DCH]GDg*<2+<VeK
Ea`p+ARlolDIal"Cgh?uAnbge3Zoe"GB.V>B."gBG]P!U/g+\BC`k)Q$6UH6:i^8gEZdtM6m-Ya
EcYr5DK?q:ATT&8AS5S!+D#S6DfTnAB5\o7D]j.8AKZ)5E$/t.G%GJ4FE1f//d_q1,9n<c/hen5
1*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!2$6Uf@+CJVeG$l_,
Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?j[5`.NfjAF`V,)@X2?(G@>P8
Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:8Gu.Nfj%Bl[cp
F<Ft<HXIsK/hS8SI=5KGA7]@eDJ=3,Df0V=DJs_AF*2G@DfTr2A0<HHF(Jo*?tsUj/oY?5?m$R!
+:95@+<X*`BlkJ-Df'?"DIdf2A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&
Dg*=5Ec6/CATAo4Df?hAE-!W=$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo
:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!2$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa
<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC/*+<VdL>?,`YDJ(),De*Zu
FCfK$FCe`+BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*Zu
FCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1.1-D).Nfj/ATo7_D..a/DBNn=Bl8$(A0>Go
Bln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=
01%?P9eo@.9hn)^/d`^D+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*
?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:'-5+<X9P6m-#OG%GK.E,B0(F=\PEDf0W1
A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%rCi]q++<VeJARTUh
BHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`
;b9_,CLqc6?pZP,9eo@.9hn)a$48"&,9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@Kpb
FCB&sBl7Q+7:^+SBl@l<$47n*+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e33
+<Vd6+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[8g+<VdL<HD_`
F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI2$6Uf@+=M;B
FCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ2$+<VeIAT;j,
Eb/c(@X0)<BOr<'@:O=r+=L]ABl%<pDe*BmF*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt$6UH6
+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(K.+=\KV?t!SV
Ci<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sI
C3*bi+<VdLBOQ'q+CHg9C3*c*AU&<.DKBN1DK@EQ$48"&,9S]n0J5%%/KdGm@qBLdATAnR/0H]%
0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1-D).Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuul
C2[W8E+EQg+BN9!BHVD1BlbD*A7TCrBl@l3@;K`e+<VdLE,8s#DIm?$8l%htAn>CmF`M&7+CT;%
+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGO4+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/
Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E;+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?&%+=\L<
?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,
F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9MDIP%%$6Uf@F)Po,
+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:$47n*+Dtb7
+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Re,,9nEU0J5@<3B9)B
/Kd?%B6A9;+>Pr.+>PW*3=6*9.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'
EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@,$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCg
Ec5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\&+<VdLCh7KsFD)e8Afth2
DIIBnF!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['ATT&:D[IU0+<Yi9Cis<1
+C\o(G@b?'+>G!IDIakF2)Qun$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(n
DJ*O%+EVNE?njVa3](4s$48"&,9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(
-Z^Cu@<j:/$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?j[5`.Nhr'Ed2Y5+A-cq
H$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(
FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OVWk+=\L+F`;VJ
ATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XQuP+BqH66m-;S@N]Q,FCep"DejE"
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8Z=-AR]RrCNCp3
$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNo$6Uf@?u9dt?m'0#E,9*&ASuU$A0<HHF(Jo*
?tsUj/oY?5?j[5`.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3b
$6Uf@+Cf(nDJ*Nk+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/d_q.
.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%
ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P$47n*+CIf?:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOs
Ec3(=E-,f4DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%htD.-ppD[IU0+<Yc;G]Y'BF!,OGDfTE"
+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=$6UH6+EV:.
+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%
DJsVL$48"&,9SZm0J5@G2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALRrn+=\LB
A7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7
Bk1ctFCAf7$47n*+D,>.F*&Ns:IH=GASbpdF(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI
-tm^EE-"&n05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1A7TUr+ED%4Df]W7DfTQ'F"Re,,9nEU0J5@<
3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH$47n*+@9XQ@<Q@'
F`JUCAftJlE-#T4+=C&_:K0eZ9LM<I-T`])6;10F-X\',BOPdkARmD9$6UH6:i^8gEZfIB+EV:2
F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA-sG%+CT.u+EV:.DBN@u
A7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^#+<Ve7F(96)E--//
+Dbb0ATJu1Bkq9@$6UH6+<VdL+:956<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3
@rj;E@rc:&F>$U)=CuSTE-Q59/no'A$6UH6+<VdL+:956+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(
.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9$6UH6?uoguBlJ08?m'9"DIml3
Ch[Zr3XQuP+<VdL+<V"6+B2oSAo^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Esa$4$6UH6<+oue
+Cf>-AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"ReB+<VdL+<Vd6+<YW>Dfd*E
+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\r+<V"6.NhZ4E,]`9F<G16EZdss2D-[<+D#G$
ARlolDIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,od+<VeEDg*=BDBNb0An<*+F`;;<
Ec`o@$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4
ATDg0E\7\A$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1
$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"SRX$6UH6+<VdL+Dkh;
ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0FApF+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hT
+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,<s+<VdL+<VdU$6UGu+=\L"+Dtb7+DtV)AKYE!@;L41
BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc@<?Qu+EVN/+<VeFG%G]7Bk1ct
D/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBK9/+<YB>
+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@1+<Vd6+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;
ARlolF)u&.DJ`s&FE8QQ4?=oS3XQuP+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0
@ps0r@;]TuB5DKq@;H8n+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V[t2+<VdL+<VdT
A8WhZ3ZqsAF:'-5$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI
6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Esa$4+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UH
Bl7Q+FD,B0+E1b2FCfK1/g)8Z$6UH6+<VdL+<Vd6,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,
0JPKn$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$
+A,Et$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0
C3*bi+<VdLFDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(K.+<VdL
+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=
.3NPH+BN8pA8c[5+EMgLFCf<1$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2
Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1.1?+<VdL+<X*@6VgHU:J=2a
@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1
-OL2'.NfjAC2[W8E+EQg+E_X6@<?'k/d_q1,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<C
BleB1@q@(r$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*
FCf]=+Du+A$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(
+E_X6@<?'k$6UH6FDi:CF`;;<Ec`FGBPDN1An>CmF`M%G$6UH6$6UH6+<VdL+AP6U+D#(tF<G:8
+E;.1A7Z)j+<VdL+<Ve<A0<7DDfTB+@;TR'$6UH6$48"&,9T!!3A*<O2BXRo6$6g_F*&NZ0J">%
0JPEl$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!
Eb065Bl[cm$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I$47mu+<VdL+<VdL+>G!XBk(p$2'?gJ
+=AND+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z#+<VdL
+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OLt=+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-Y
A0<6I$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OLt=+<VdL+<VdL+<VdL+>,9!
/d_q1,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEl$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IG
Bl.g*ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_39$6Uf@+Dtb7+EV19F<GX7EbTK7
F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMcn+=\LAC2[W8E+EQg
+E_X6@<?'k+D,P4+CJYrCg\k&$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2
+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P6$6pc?+>>E./ibmF+>"^%F_>i<
F<E:h+>PW*2$tHK$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5
+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:'-5+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(
@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:956+B3#c+EV%)+CHTL
/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ1-
+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7
@;BFq+DtV)AKYK!@<6*nEsa$4+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$
C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(K.+=\LP
@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-$47n*+DbJ,
B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+;s+=\LA
ARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(K.
+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs$6UH6+<VdL
+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43$6UH6+<VdL
+D#(+DI[bq$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs$6UH6
+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>.V
+<VdL+<Ve<A0>c"F:&?t+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,m+<VdL
+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN$6UH6
+<VdL+D#(+DI[bq$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#
DIal$A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U*+<VdL+<VdLARlp$
@rr%b$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCGo"
+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu
?uU71?m'Q0$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImis
FCfM9A9Da.+EM%5BlJ08$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'
Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mf+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043
EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7d3+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUB
F!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8!7+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5
@q]:gB4YU+.Nfi@$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Esa$4
+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OLt=+<VdL+<W%P@j#E+F!j+3+>P'H
0f1"cATT&C/g)nlEb0E4+=AND$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1
GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa(s+<VdL+<Ve%67sBmCi<a(Bl7Q+
Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q$47mu
+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-/+<VdL+<VdL0Ha^W1a$a[
F<GdLF!(f4+<VdL+<Vd^+C?i[+E2IF+D5e;+<V"6+<VdL+<Vd6+=\L"+Dtb7+CJ`!F(KH$+E1b0
@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9$6UH6A9Da.Bl7Q+FD5T'
F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#e!+<Yc?D.Rd1
@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmogu
F:'-5+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(
+CT.u+EqO9C^M:-+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?
ATDj+Df.07+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm
+CJr$@<6O%E\;'@Amc_g+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)
E--.R+B)i_+CJr&A1hh3Ambrg+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,
ASuTt+CSekDf-\>D]i\(F<Co5+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:956+:956
+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Es`6s
+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Esa$4+<VdL+<Y36F(KG9-W3B4
5tOg;7n"de0a\71+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&
FCB$*Esa$4+<VdL+<YN0CLnV9-OL2'.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651
@<,dnATVL(+CJ)C:K0eZ9LM<I?nMd/+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6
?tsXhFD,&)8g%V^DJ!TqF`M&(+:956+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&
FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/d`^D+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=
DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA,#+<Y<.DImisFCeu*F(96)E--.D
@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWi?+<Ve7;GU(f7Sc]G78dM9
BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@.L/+Co1rFD5Z2@<-'n
F!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S$47mu+<VdL+<Y36F(KG9-RU$367sC%BQ&);
E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Es`6s+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F
;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA,#+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,7
05>E9Ec5l<-OL2'+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNE
FD,5.8g%_aCh.*t$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(%$6Uf@8SrEeDg#]&+D#S6DfQt6
@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s
/d_q..Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%
Ch7j!+DG_7FCelk+E(j7?upO'G[Lk$+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"
AM.\3F'o=^+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1
F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSfR,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.Qc
FCfJ87;$6U7:^+SBl@l<$47n*+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#
DKU1HF*VhKASlK@$47n*+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?h
BOPdkATKI2$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?$47n*+CK(uG@Y)(@q]:gB4YTrFDi:>
Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q;+<Ve-DesQ5AKZ&.
H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa(s+<Y9)Bl"o'DKKT5
AScW7Df-[A@r-(+A0N.8CghEtDfT]9/d_q..Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?
=(uP'+AH9S/0IW#DKU1HF*VhKASlK@$47n*+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2
D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:'-5+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=
@:F%a/d_q..Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2
@<-WG+B3#gF!,O<DJ*cs$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3
E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_A
F*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD$6UH6>AA(eFCfN8
/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(
F=q9BF"%G'+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:8Gu.Nh3!
EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E.
/ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4
G%G]8Bl@l@0J,::3B&T?$6UH6$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBk$6Uf@?tFS)F(9--
ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XQuP+<VdL
+<V"6+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:956+<VdL+<W%>D/XH++D#5"-Ts(),@Dc(
$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI2$6pc?
+>>E./iba2/KdZ.DIjqF1b9b)0JPBk$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^
A8-.(EcWi?$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?j$6Uf@?uBI^+Eh=:@N]/o@;]^h
A0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI2+<VdL<+ohcF*(i.A79Lh
+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ';!+<Vd^
2)QLdBOPpi@ru:&F"SRB$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=$47n*+CJ\tD/a5t+Cob+
A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5$6UH6@rH4$ASuU2/0JnPATMF'
G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ2$+<YNDCijB1Ch4_uCgh3sF!,:5DIml3
FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df,n)+<YB>+E_a:Ap%o4GA(Q*+ED%%
A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC1$6pc?+>>E./ibU./KdYo
DKTB.Gp"h%/0H]%0f'.D+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL
89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4trM+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9
FE_XGEb03.F(o`7EbT*+3XQuP+<V"6+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,
AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$
A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.
E,oN2F(Jl7+poG8+<VdL+<V"6+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnDdt4=BQ%]tF!+n-C^M:-+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'm
F!,@3ARo@_+EVNE@WcC$A0>u-AI9P&+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMd/+<VdL+<V"6
.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPF+:956+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(KD+<V"6.Ni,0
E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA,#+<Y0-@;]^hF!,C=+CJ)9
5t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt$+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X
<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRB+<VdL+<VdL$6UH6+<VdL
+CoG4ATT%B;FNl>=&MUh7402b+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0a]$G+<VdL+<V"6.Ni>;
G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q$6UH6@!H'%BlbD2
DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#e!+<YQ?G9CF1F)Yr(
H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUq+<Ve71*AS"A8-+(+FPkTEc<BR?m&uo
F)Yr(H#k*EDf021A8bt#D.RU,F"SRB$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4
+DkP/@q[!,BOqMn+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8
BOqMn+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/d`^D+B3#c
+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0G9B+<Y*1A0>9,
IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A-sG%+EM47Ec`F7
@<?''-t%=GD/X<&A7-i=$6UH6$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=
+:956+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2$6UH6FD,*)+CT;%+CT5.
Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;X-+<Y*)FCfJ8FCf<.CghEs
+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohM+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(
+Co&"Bl.R+Esa$4+ED%4CgggbD.RU,+E1b'EcWi?+:956+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q
<@8o,F<DrKATr6-F*&c:$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;
?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVR1+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km
+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(K.,9nEU0J5@<3&Mg1+AZKh
Ddm9u+>GZ'+>PW*1("@2.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6L
C2[X!Blmp,@<?'.?j\#!+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AI9P&+A,Et>psB.
FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS
$6UH6AoD]4A7]jkBl%ht$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:($6UH6
$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DCu8=$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/d`^.+=\L4
FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4$6UH6FCf]=
+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_
+:956+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>m^o`,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*
1("@2.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#
/hSb(?j\#!+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\
F<Dq`/gk$L$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*
?pmdX<D>nW<(';F<+$%U+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<
FDl22F!,R9G]YP\<+ohM+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L$47n*
+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuO,
+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7
FD,4m+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaE
A9/)#+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-
?XO3`+<Y*1A0>9$BQ&*6@<6KsH=(&4$47n*+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4
+EV19F<Gd@ATVTsEZf4-F*(u6$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds
@ruF'DIIR2+E1b2BQGdK7W3;i$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4
D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^VRZ+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;
AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl48#+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=
Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l6+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#
+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd)+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4
DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:956+CSbiATMo8E+*j%F"SRX$6UH6$6Uf@
6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08
/d`^.+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/d_q1,9n<b
/ibOC2'=In8p,#_+>Pi++>PW*1("@2.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A
6nTT]BOr;\@:LF'ATDj+Df,n)+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:8Gu+<VdL
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]X98+<V"6.Ni,6De(J>A7f3l
F`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk
@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?j\#!+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cp
FDl26ATJu8ARTUhBOt]]+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1
DfQt/D@.L/+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(KD+<V"6.Ni>;G\(D.@3ArgBle6$
+DbV,B67f0ATDg0E\8IA+:95@+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1
DIjr&AS#Bp9L]@3$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5
DK?.-$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A-sG%+EVNE
@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8IA+<V"9,9n<b/ibOC+>"^.@;[2B2Cot+
0JP9h$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!
BOPdkAI9P&+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0f
A0>u4+CKM'+Dbt+@;KK^$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej"B+=\LAB4Z09+E2IF?m'?*
G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/d`^.+<VdL+<VdL2'?OC
F<DqY+:956+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^A$6pc?+>>E./iFh(
+@KdN+>GW&+>PW*0a\71.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0
+CJr&A1hh3Ambrg+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;
D..-r+DPh*+Co1rFD5Z2@<-W#+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+
/g+,,ATME*Anc'mEsa$4+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7
DfU+U+:956+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.L
BOrc1De(G=@:s.).4trM+<V"6.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5
FCcS9E+*6f+ED%1Dg#Q*+C]U=$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=
DL$G>ATD?)Bl5&8BOr<.AU&;>De9>!+<Y*1+D#e:Ch[BnF<GdGEb$d0+<Vd6,9nEU0J5@<2'=In
6tKjN1b9b)0JP9h$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7
@;K`e+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/d`^D+:95@+D,>4ARlolDBN>(
Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),
F!,C=+A?KeFa,MG+<Vd6+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/d_q1,9n<b/ibO@+>"^2Dg!6Y
2(Tk*0JP9h$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*
DIjr$De!p,ASuTuFD5Z2$6TZu.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi
+EqL1DBO.AEb'56GA2/4+EV:.$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4r
F)to6+EqC;AKYr4ATMF#F<GL>$6UH6FD,5.E+*j%/d`^D+:95@+E_X6@<?4$B-:W#A0>H.FCf?#
Bl7Q+8l%htFCfN8F"ReB+<V"9,9n<b/ibO?+>"^.F`&<V0e=G&0JP9h$6Uf@Df0B*DIjr$De!p,
ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq,+<Ve8Eb-A,
Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)9-+<Ve;
Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c
$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7
An>Oa@UWb^/d_q1,9n<b/ibO>+>"^1@<itN3@l:.0JP9h$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3m
Ch4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1$6UH6Eb065Bl[d++A*b8/hf"&DfQt0
AU/33A0>r)ANCq@$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJG
G]X9"+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!
?n;X-+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E
$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-
$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<Co5+<Xlr
C2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>=+<Ve;De3u4DJsV>
F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^M:-+CT.1@:NeiEaa'$+Co&)
@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=mn-+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%
DBN@sDfp.E8l%htGA1l0+C\n)D.-sd$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dC
CLqO$A2uY&GAhM4E,oN2F"Us@D(,f7+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8
BOr<1Bl%<4+<V!u+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4
A0=Je2_He/+EMgLFCf<1/d`^D$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;$47n*+Dkh1DfQt4Bm:b=
AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@$48"&
,9SZm3A*!./KdMo@N[Bb/0H]%0ej"B+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'
@;]Tu8k2iR/g+,,BlbD?ATDj+Df,n)+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"ReB+<V"6
.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk
@q@8"+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u
+:956+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\
$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqMn+<Y-%
F(HJ1De!3lALDOAF(Jd#@q[!(@<?/i+<Vd6+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3
FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"ReB$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=
BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?j\#!+Eq78+C]U=Amo^&FD,5.Cgh?s
ATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3V+<Ve@F!,@=G9C@8
Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Ambrg+<Y*1
A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a
$6UH6Ci<flC`lPB7Nc__@:X(iB.aN6+<V"6.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!
ARlp*D]j(3Ao)$gF<G(,@;]^hF"ReB$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk
+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f$6TZu.Ni+c=]@gt+DkOsEc3(A
@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:94u,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA
$47n*+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;
DesJ;GA(Q0BOu2k+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ
@<HC.+DGm>0J3\T+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(
F)>?%Ch7W0$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'
/d`^D+:95@+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'
DIIR"ATJu9D]fB0+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@1+<Vd6+=\LNBl7j0
+D,>4ATJu.DBN>%De(J>A7f3V$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA$47n*+D,P4@qB0nE+*j%
+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?u
A8lR-C1Ums-X[9($6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3AmbrQ,9nEU0J5::1*A.k
;e9nj1,UU*1,(CA$47n*+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/^+:95@+E_X6@<?'k
+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ1c,9nEU0J5::0d&%j;e9nj1,LO)1,(CA$47n*
+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0
Ci<`m+EM7CAI9Oe+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5
+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3AmbrQ,9nEU0J5::0H_qi;e9nj1,LO)1,(CA$47n*+ED%*
ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIg+:95@+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q
@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@.Kn,9nEU0J5790H_qi6$6f_0fU^,1,(CA
$47n*+Dkh1DfQt8De'u3@rc:&F<G.*BlnD'+:95@+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;4%
$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3!p!8.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9Y+:95@
+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg$6T[#,9n<b/i>78+>"^.F_i0T3%Q1-
0JGHn$6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"$6T[#,9n<b/i517+>"^.F_i0T
0J">%0JGHn$6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,
@L=4b+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"
F(96)E--.RBkh]s$6T[#,9n<b/i,+>+>"^1@<itO0e=G&0JGHn$6Uf@D/!m+EZfLDA79Rk+EVNE
CghC,+DbIq+EM+(FD5Z2$48"&,9SZm1G1U//KdbrGp"mt/0H]%0K9CH+=\LCF_;h/Bm=31+DG^9
Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Nn,9nEU0J5.62BXRo9jr;i1-$m.1,(CA$47n*+D,>.
F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EXEp3+EVNE
FD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:956+CSe4BQ%B'F(96)
E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/d`^D+:94u>@'$i3ZoPE
BPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d(+<VdL+<Ve2
E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL\+<VdL+<VdrDfQt3G[YH.
Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE8+I+<VdL+<V"6
+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh$
BPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/heD"+@]pOEckf2Gp"sq+>PW+
1a"2;@<6+-+AH?:@<6*o@:Njk7:^+SBl@l<%13OO+=\L/ATo8*E,]B+A8-92Df-\<F`))2DJ((a
:IH=IATMs7+CSekARmD&$4R=b.NhMrF)Pl+FCcRe2BZXQ@;omo@j#f'D/XT/A1e;u%144-+@BgN
DJ*O%+EVNE?t+"i?n<F.Eb0<6A7-r2?uTOaCLgfqFDi:>DffP5FD,5.@:Wn_FD5Z2%144#+CT.u
+E_a:+E(j7;b02+1,Us4@UWb^F`8IEBk1db@<*K&Bl%@%/e&-s$6Uf@?q<R^873tk?qa!T:1,2Q
DIakt>"M4l+DkOsEc3(=E-,f4DBNG-A7]g)@:Wn[A0>u4+EV%$Ch54.$4R=b.NhH"DJsP<Bl.g0
Dg#]/ASuU2+EVNEE-6&?F^nj%Bl@l3/Kf.KAKZ)?E,Qk6BkUpc+DGm>Df03+Bl7Q9%13OO,9nEU
0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@<+ohc
DfTB"EZf:4+E)4@Bl@l3@rGmh+EV%$Ch7Z1Bl5&%E,]B+A8-9274o]r@<2kb+<Ve9AS#a%@q]:g
B4YU++B3#c+DbJ,B4Z*+FCAWpAKW]_+DGm>DJs_ADf-\++EM77B5D,g$6UH6E+*Bj+EVNECh7$u
AKZ&5@:NjkAoD]4Ap&3<Eb-A'De*F#/e&-s$6Uf@;f?Ma+=_MOA8bt#D.RU,ARm85@rGmhF!,.)
G%De*AS#a%@:Wn[A0>u4+EV%$Ch4_D1+j"C%144-+B3#c+D#G4Ed8d>DfQt.A8lU$FC65)@<3Q#
AS#a%@:X+qF*(u(+EVNEF(fK9+:SZ#+<Yc>AKYl%G9C9a5uU<B<D?:t+E1b0@;TRtATBC4$4R=e
,9n<c/hen51E\7l8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh)s
D/aE2ASuT40eskcDBN>%GAhM4F'p,.Dg*=;Ders*+EV:.+A*ba3?^F<1ghGIH#n(=D'3nAEbTE(
/g+,,Bla^j+<Ve?ASc=,+A,Et+Co%lC`mq9FD)e=BOr;qBl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-
FE_;-DBMOo3A*!B-Z^D=DIal$@<-0uATA4e+<Ve!-Z^DAG][M7A7]9oE,oN"Ble!,DBNY2FCf)r
EcWiB$4R=b.Nh)sEcP`$F<Ft"@Wl-%D/X<#A0><$B6A'&DKI!Q+E).6Gp%3;CLqQ0@q]:k@:OCj
EZf14F*)IU%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<<ag#_@;^00
7:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuulC2[W8
E+EQg%13OO+=\KV6tp[Q@rri(AS,XoBln'-DBNA,E+NotBm:b/A7T7^/e&-s$6Uf@+DkOs:K&o?
Bl8'<+E1b2BQG;)A7T7^+EVNE@rH6sBkMR/@<?4%DBO"3@ruF'DCuA*%14=),9S]n0J5+'/Kdf,
G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO
+<W-V:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<
BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=
ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/
$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4
@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V
3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO+<W-V:1\Vl
8p,)uFCfJ8CggcqE+EQ'@:Wn[A0>8[F(oN)8oJ6VBlmp,@<?'5E+EQg/Kf+GAKZ).AKYMtEb/a&
DfU+4$4R=bC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9S]n
0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+<W-V+B;<5
F!,17+CJr&A1hh3Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j785rPb/e&-s$6UH@
+Auc_ATD@"@qB^(FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk/e&-s$6pc?+>GK&
/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+<W-V?t*b[
FC65#@:O(qE$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5DK?q=Afs]gE-ZP:
EZf1,@WNZ#A7T7^+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<@<?0*-[oK7A8c@,
05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*
3=Q<)$6UH@+Eh=:F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO,9nEU0J5@<3B9&A
/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57F'p,3ARfgrDf-\+
A7T7^/g(T1%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V?u9dt?m'N%@ruF'
DBN@uA7]:(%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0
%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V
8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss
3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0s
DIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D
+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2
Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#
FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?
+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=
/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSek
ARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)
+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&
@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,
Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$m
GT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!
F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh
+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*
0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF
+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU
0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*
De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LD
BOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.
@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO
,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3
+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE
1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\A
Bln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<
%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI+
+ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD
2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku
@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\k
Ebf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?
+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu
?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO
+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,
AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:
DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+
G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+
C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6
BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u
+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q
$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,
FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1
Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&
DfTQ'F"Rn/+:SZmDe*ZuFCfK$FCeftG%kN3?Z]k(1,:-uFD,B0+DPh*Ch\!&Eaa'$+E)F7Ecu/.
G7=m*>]XIdFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;=/ATDs.ATrP3$4R>IFCf]=FEDkEDe*Zu
FCfK$FCfkCBlbD*+A*c!FD5Q*FEo!M@rc:&F<G[=@<<W)ASu("@<?(%%16?REb/j0BQS?8F#ks-
ASs,EBkqF%ARoL`/oPcC06_,GBeN.oFCfK$FCefuEc5T2@;TjqDJ+BECh\!&Eaa'$I3<'=@s)X"
DKKqBA8-'q@ruO4+D,Y4D'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)I="R^6m-#S@ruF'DIIR2I3<0CDfp#?/e&-s$<(MI+EV:.+D,P.Ci=N3
DJ()(DfQt2ATV?pCi_WH$=%%OB5)71ASuX-ATD4$AUP!p>\S:kD%-gp>\J.hAp\35FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:
Ch\!&Eaa'$/no9MDIS$@<HDklB-:r-A8Gt%ATD4$AKYl/FCep"DejbR+:SZ#>]XCqBlJ08BmO>"
$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%
ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>%144_DJsQ4@;L"!H=[Nm>\S:kD%-gp>\J.h
Ap\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$
03*(-DJ)R[A8Gt%ATD4$AM.q4Apo#+F(oN)+DPh*Ch\!&Eaa'$+AbHqI4bs9+C&ttEbTK7F(or3
%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*Zu
FCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/%144_DJsQ4@;L"!H=[Nm>\S:kD%-gp>\J.hAp\35
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs@s)X"DKIONA7f@j
@kVS8A1hh3Apo"nF`MM6DKI!n:IH=B@;^3rCjdoF$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9
/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVO
C2[X!Blmp,@<?(/+A$HmATDBk@qC&t$4R>I@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$
DJ+B%>n%-GBR+Q.EboH-CO9#O8Q/GO:..lFI=#3oDfT]'CfG=gHW3O-;c#bT6r-/m+<VdLI=5=)
E+*BjEb/j0BkCj9<(KSZ:dIiE:IBP9+C%9PD/Ej%FB!0oHY.D:C`m\*DIdZq+E1b2BHSlLF`V+:
-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BRL<s>\JD%ATDU$DJOT2DfT]/Amo1\FCf]FHX'<aEc#6$
<,ZQ!AoD^,BkCd`ATVL.+<VeTI9Trq@:s.lAS-:'An*l6DfT]/Amo1\FCf]F>p*B>Df'?&DKJir
CO9Z3Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4F+"K)>\JD%
ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7E,961+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3bNJP
Ch\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".N$=%7iE+O'+Bl7^5BkCd`
ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m@ruF'DBL&EI=5=)E+*BjEb/j0BkCj9BkCd`ATMEm
FD5Z2I9dt#6Z6gYASuThDej]6DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7R3%16?RH#R>8
Ch[d&HYI)%I=#3oDfT]'CfG=gHYI)%+<VdL+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9BkCk'>p*B>
Df'?&DKJirCO9Z3Ec#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&<F%16?RH#R>8Ch[d&HZNb?C2[X!
Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSCI9Trq@:s.lAS-:'An*lCATV[*A8Gt%
ATD4$AURi,>XNFHD.RU,<,ZQ!E,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q
@ruX0Gp%<OBlmp-+E2@4@;TIiAUP!p>\JD%ATDU$DJOTAGAL]0AU%g-GAhM4F+&C?:2b/i@;Jn]
CO:2JCghEsG\1u?DfTB0+FSZB>]=+aATD?oHYI)%3d#X_@<?(*Ao`*6Eb'6>>p*B>Df'?&DKJir
CO:2AGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9
-[cF2>\JD%ATDU$DJOTCDfTB)BlncM>Y]3XD..6[Dej]DDfTB)BlkI?+<VdL+<Z)\>?l,UB4Z*p
Ap\6(@legPEb'!#FF@F;>XNFHD.RU,<,ZQ!D..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW.=DX4
>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!
Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,+CT>4F_u)>
Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lVDe!p,ASuT4FCf]=+DGp?E,ol,ATMp(F"SS,F<G"5
F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<WsdC`me;F`Lu'+Cf>#AKY].
+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkC
A8bt#D.RU,+D,Y&B5M3tFE8R5Eb-A)Bln$"E]OX:+<XouAS5^pHYIS5D/"<-I16N++C&W&ASiPa
@<--oDg-(AB6%p5E$/t8DJ()&De!p,ASuU23Zq[NATD7-1*AS"A8-+(+=CfBDfp#:@;TR'HjpE*
+C&W&ASiPp9OUn3=BltiF_56"G\(D.D.-ppDf[r^>]s\!@XL!TA8-+(+=CfBDfp#:@;TR'/14eC
G%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'H=_L6$4R=g+C&W&AShk`,p4<Q:2b#%8g%V^A7ZltF!+t2
DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_ATD$fDf9`8DffQ;<+oue%14C(+<VdLCh[a#FCB9*
Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--pA.8kl
+<VeNBln#2E-#T5A8a&=@;]Uo@j#;nCh[a#FCfK6/g*T+ATE'<BPD?s+DG^9@s)g.Gp$@6AU&<=
FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq+EMIDEarZ'@rGmh+D>J%BP_BqBQRs+
B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%FEDVOC2[X!Blmp,@<?(/-Z^DDART+\EZek1DKK<$DK?q*
9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmq^,p4<QFD,B0/e&-s$7-g"@V'1dDL6P<EaiI!
Bl/8-$7-fi67tA_IXZ`p+F>4`CghEsGT^mHD.7's9PJBUF!,OG@<-HZEc5eX+u(8aI16N0+AP6U
5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#I16NgASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL59(
DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?
=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9Fc8hO@\Df9`8DffQ;>]aP%FEDVOC2[X!
Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&@;]Tu@V'h'DIbAJ%13OO<,Wn%F(HJ!FCf]=FEDkE
De*ZuFCfK$FCfkCH#IgJD09oA3XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+A$Hl
FCB!%+A,Et/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;
DImisCbKOAA:8es:IKURBlbD*+A*(M+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOA
BFP:k+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>Fu@:O._DLHkN@:O._DLF,H
$=%:eAShk`+<X6nF*(i,C`l>G6rQl];F<l*%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'
/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR:K::[7=>UP+<YB>+CT)-D]iI2
8g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+C'#"G]\%LHZ3D'D..=1/g*`-+Cf>-FCAm$F!,R<AKXT@
6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*D]iM3Bl%<&8l%i-+A,Et;bpCk6U`,+CiaM;@rH7,
@;0V#%144#>]aP%FEDVOC2[X!Blmp,@<?'5I16NgBlmp'%144#8T&Tk@;Ka&@3B'&EcP`/F<Ga<
EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*@;]Uo@kM\?B.n[[E+*WpDe"2J%144#>]aP%FEDVOE+*Wp
De"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/+CT.u+C\o-Df0).%144#F*2G@DfTr@+A*btH#@_4
GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:EcYr5DK?q@AT;j,Eb/c(D/Ws!Anba`FD5Z2/g+,,AISth
+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TF$6UH6+<Ve3@V'1d
DL5r4F_t]1@<?(/%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07A1ADfTD3
8g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;
FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo
@kDbIDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#AS-:&
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=h
A1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#ARloU+B*Q'FCBD:882^MCh[NqFD5W*
I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VN%144#
+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-
A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9I="n(D.tRqBlmp,@<?''8l%j'
/e&-o+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1r??$6UH6+<Ve3DJsQ4@;L"!H=[Nm
#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp+@:3bCh+YnFCf]=FEDkEDe*ZuFCfK$FCd(Q+C'#"
G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5F`8rU8l%ha$6UI.@;BFq+A*bt@rc:&FE8R:Ec5e;
B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO%13OO,p6H%AS5^pHZit@@UX@m
D1)j#,p75>EHPu9AKW@5ASu("@;IT3De(4)$7-g5A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-Y
A0<6I%14C(D/=89-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u
$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Eb065Bl[c-I9]]mEbTE(<,ZQ!>]aP%
FE)GAFCfN-DJ*csH[TO<DImisCbKOAA6a4fG][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHZ*F;
I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*F`_>6
F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5<affDDej\UI9]NcEc#6$<,ZQ!
+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i
@;Jn]CO9o7F!,m9;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2A
ATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHeE+No0
FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$Bl7Q+FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"
DKIK?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5
-RT?1,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+
I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5<affD
Dej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5
F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<X?r@:UKc
FCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1@;BRpB-:H$AU&<=FF.b@A8Gt%ATD4$AUP\8F<G(%
DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1bEbTK7/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g2
Ddd0!-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71
882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Ci<`m+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"
AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*
;eTTMARp2u$=%:eAShk`+<XToF<G!7GAhM;Bl7Q+A8-'q@ruX0GqL4EFCf]=FEDkEDe*ZuFCfK$
FCfkCB4YslEaa'$Et&I!+C%TK<+T0\Anc'mF"SS$Cht58F^o)-Anc'mF!+n3AKZ2;BlnH.DBO%>
+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge+C]U*$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B?$4R=g
+C&AeB5)71G%G]'@<?4#I16N0+EM+9C2[X!Blmp,@<?''-RU#Z:-pQU@s)g4ASuT48l%htE-67F
A8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt)i$7-g9ATV[*A8Gt%ATD4$AKW@13a?c<D/^jF
+<VdL+<VdL+AP6U+EqO;A8c[5%14C(F(KH.De*ZuFCfK$FCcRB05,9@AM7e:BPoJFASlB6+<XEG
/g+tEDKU15$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$
DJ+B%>n%-G:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"
AUAi1FCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQU@s)g4ASuT48l%htE-67FA8,Oq
Bl@ltEd8d<De!p,ASuT4A8-'q@ruX0H$p,/%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]m
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foKFCf<.>]aP%FE)GAFCfN-
DJ*csH[U;b+<VdL+<VdL+C%9PD/Ej%FB!0oHVQm[+EqO;A8c[5I16Ng:2b/i@;Jn]CO:,6FD>`)
Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAhYBQ%a!05>E=DD-*CD/`a%AU&<:
F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBsBl8'<I16Ng:2b/i@;Jn]CO:,6FD>`)Ch\!&
Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAiSFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b
+<VdL+<VdL+<Ve36Z6gYASuThDej\p67sBQ+Co%qBl7Km+D,P.A7]e&I16NgASu%*882^MCh[Nq
FD5W*I16NgASu%*;eTTMARp2u$=%:eASiPgATT&5E-,f4DII?(@<H[*DfR7I.3NhKFD)e-H!t5t
@j##uAU&<=FF/(?FD>`)Ch\!&Eaa'$I4bs9>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$
Bl7R3>?q[F>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I6q@aD..<eFCf]=EHQ2AATMR'B5D.+
I=5?qDfT]'CfG=gHQ[B@FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi8
3a?c<G][D'@r$.%@<6+/I:?W,@psOl>]aP%FE)GAFCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[
+EM+9+A?3CAQU'`F`_;8E[YuX+EV1>F<G"0A0>DsEb/a&DfU,O%16?ODIe)bBkM*qBkM+$Bl7R3
%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B!?"+C'#"G]\%LHY7A<Ch\!>+E)-?FD,5.B6%p5E$0FE
FWbm:DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4$6UI(ASu("@<?(%+C%TK<+T0\Anc'm
F!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<+C%TK<+T0\Anc'm%144#BlbD0Bm+'*
+EV:.+D5_5F`8I@@;TR.%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p6i@E,961+=CoBA8Gt%ATD4$
ALATq67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ(+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!B6%s-BlkJG>Z5`bBl7Q_Dej])
FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;b>XNFHD.RU,<,ZQ!
:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT_DD$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[
I16NgBlmp'%144#<HD^o>YJR*AQXD'D]iP.D/a3*AKZ).AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"
G]\%LHY7A<Ch[uDI38t+%144#5p15^ASc0*F(96)E-*3N>]aP%FEDVO@UXA,+E)9C>]aP%FEDVO
F(ftN+DGm>GB.D>FCf>4FDi:DBOr;kFCf]=FEDkNATV[*A8Gt%ATD4$AUP!p+<Y3/Eb/a&DfU+G
FD,*)+EM47GB4mKBOr<-AT;j(DI[6#De:+s9OUn3=BltYDf'H-CghF"Df-\-Df'?"DIdf@%144#
%144#7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=FEDkKA7fXdFCf]F/0J2>AU&<=
FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5CghEsG^V1e=`8G'+Cf)'Bk(]sGA1l0+C\n)A8,Oq
@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHkDJ<U!A7ZlnBOPpi@ru:&F"SS)DfQt;DfTD3A7]jk
Bl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZL
I3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H$=%.[A:%m*F_t]1@<?(/%13OO<+oi`AKYE%AKZ&4
D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>@;^00FDi:1A867.F=n"0%16?LAS5^pHY%);D.R`r
FCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGFDi:3
BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&+Cf>+F_u#;/g+,,AKYMpAmoguF<G:=+EV:;ARuun
F`\aJBPDN1D..]4Eb0<7Cige6DBO+6Ed8dDDf021DIIBnF!,LGDJj0+B+51j+EVO7ATVTsE\8J6
D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='+Cf>+F_u#;+Cf(nDJ*NA%13OO>[h8WBl89@ATD6g
FD5T?%16?LAS5^pHYmnAFD56'Cib#O1OWJ4F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%-GASu%*G%G]'
@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+Eqj7E-!.<Df021F)Q2A@q?cmDe*E%
Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;Ci!Zn+C]U=>]aP%FEDVO=&M=\9M%rM<.-AA<+ohc
A7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/+<X$b@;]^h+EV:2F!,X7Cis;3BkAK5Dfm14BOPdk
AKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!+Dbb0ATJu&Eb,[e+<YWDARf:_A7]9oGA2/4+EV:.
+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig*n+<XoTCh7X/<,ZQ!>]aP%FEDVO
4t\HOI=3^W$4R>IBlmp'+:SZ#+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<B8Gp$g=@rHC.ARfguGp$d7
B4u*qB4uB0>\.bkBR=rD@;p0sA:5S0Dg5i(+A*boDfor=+EV:*F<G(3DKK<$D@Hpq+Dkh;FEMV8
F!,C5+EMXFBl7R)+CT.u+E)@8ATAo3FD,6++EVmJATKIH<+oue+CT)-D]i_3Ch.T0AoD]4GB.,2
E+NQ&DJsE1Dfor=+EV:*F:AR"+Cf>-FCAm$+Dbt6B-:c&@V'(\ARlp)FE2)5B6,[J<+ohcG%G]'
+C'#"G]\%LHZaOK@<?(*Ao`*6Eb'6>/0K"FAKYr#B4ZNsE+*BjEb/j0BkCj9Fa%Y1FCf]/Ed)GB
A93/M%144#@ps6t@V$[)F(Jl)FDi:7ASu("@<?''>\.bkBR=l>GB.,2E+NR.+C%TK<+T0:+D,P4
+EM[8BHVM;Eb'56FD,*)+Ceht+C\n)D..=)@;Kb*+Eqj7E,]B!+CT.u+DG_7ATDm(A.8kg+DG^9
FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkEDe*ZuFCfK$FCfkQ+B3B,+CT=6G@_n6BkM+$
+EMI<AKYhuDKTB(+D#(tFD5W*%144#BlbD*Cj0<5F!,@3@qB_&@<-W9GA2/4+C%TK<+T/a%13OO
>\.e`HY%);D.R`rFCfk0$>OKiE+*d(F##IF67sa&De*fqEc#k?F"JsdA7]@]F_l.BA8,OqBl@lt
Ed8dH@<,dnATVL(F"Rn/:-pQB$;No?+B3#gF!,(/Ch4`'F!,UHARlp*D]j+4F<D]JBOr;/A7]@]
F_l.B+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQUFCAWpAKW+0DBO%7AKYhuF*(u6+D,>(AM,*,
BOu'(+CQB8DIn#7A8,OqBl@ltEd8dAF!+t5ART[lA.8l@67sC&BOr;/E+*cqD.Rg#EcW?GBl5&8
BOr;/D..L-ATAo*Bl%?'@<,p%F`V,)+EVNEF)Y]#BkDW5+EV:.%15is/g,+AEa`frFCfK6+D,P4
+CQC3@<-I(@s)TrEZen,@ruF'DIIR2/g+,,AKW+=ATD6&-tI:<ATT@D@ps6a$;No?+C\n)+<YfJ
ARlo+FDi9E+Dl%-BkDW5+E1b0@;TRtATAn9F(KH8Bl7R)+<Ve@DBL&EBl7HqG%kK0@;HA[:-pQU
A8,OqBl@ltEbT*+/g)92@<6O%EZcK:Bl%?'E+*cqD.Rg#EcW@5@;[3+DJXS@@V$ZlBOPdkARlom
Gmt*U67sBlA8-."DJ()6BPDN1Anc'm+CT.u+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?5%15is
/e&._67sB[BOr<'@<6O%EZet.Ch4`!@;[2sAKZ#)@rc-hFCeu*GA2/4+EV:.+CehrCcW"4:-pQB
$;No?+CfG'@<?'t@<6Nt@;9^k?Q_s85uU`O;I<jIDe*2a$;No?%15is/g+4];GKeY7lhc$Cht59
BOr;/E+*cqD.Rg#EcW@5F`MM6DKK]?+Dbb5FCeu*@<,p%Eb065Bl[cq+C]U*$;No?+EV:.+A,Et
+EMgLFCf;A+A$/fH#IgJEb0*+G%De)DL!@CAfu2/ASiP^:IH=LBl%T.@rc"!BJ(E1DflKr:-pQU
@ps6t+ELt'AScW7@:Wmk@:Wn_FD5Z2@;I'*@<,dnATVL(F!+q7F<D]ODfm0F@ps7mDfd+C@:j(e
Gmt*U67sC$ASl@/AKYK*EcP`/F<GO2Ea`frFCfK6/e&-s$;Efb<(0\]5uLEU4ZX]>+?CW!%13OO
:-pQU<+ohcAoD^,@<<W1Afu2/BlbD9@<,dnATVL(+D,>(AKY].3XlEk67sB'+<VeADIIBn+?L\o
FEqh:.3N/4F(96)E-,f4DBM"`G%#30AISuA67sAi$;No?+<VdL+DPe&D.Oi(F!+m6G%#3$A0=Je
DIIBn%15is/g)8Z+<W(SH#R=D+Co&)@rc:&FD5Z2+CoD#F_t]-FE8RHBOr<*@<,dnATVL(+>"^X
H#R=;BlbD;AT;j,Eb/bj$;No?+<VdL+<VdLDf0B:+=JaSDKKH&ATB4BBlbD,F`MM6DKK]?+D#e/
@s)m)A0>f4BOu3,FEqh:F!,[@ChsOf:-pQU+<VdL+<Ve9AKYr#F)to'+CT=6@q]:k@:OCjEZf14
F*)IG.!&s2+CoG5@:F%a.4u&::-pQU+<VdLG%#30AKY].+CT.1AU%crF`_&$Ch4_]+D#e:Eb0<5
Bl@l3FD,*)+E2@>A9DBnF!+m6G%#30AIStU$:.TX8P(m!+<VdL4!5q%Bl8$(B4Z*4+EqL1DBLYV
F`V+:@<5pmBfIsmBl5&(F_u)=+=JodDfQsT.3K`U+<VdL+<VdL+?L]#+<V+#6VgN]7R9C@:Jr;s
+=JaSDKKH&ATB4B@rH4'Df0-(FE8R7DfBE%A0>T(+E)./+Dbt7E$0+.F)rHP0g'_D1,L[6+<VdL
4!6730F\@W:IA,V78?fM8OHH"4!5q%Bl8$(B4Z*4+EqL1DBLYVA8,OqBl@ltEd8d<De!p,ASuT4
BlbD9F`\`S0Hb:S+>G;f+<Vdg+>F<46r-0M9gqfV=%PeZ80Bu:-nB"LFCf)rE[`,TBk2=!+E(j7
C3=T>BkD'jA0>E$@s)X"DKI"CAU&;>-o*J=Gs!i>2(9Xj4!6F9%15L'9i+;F6W?iZ+?L\o.qrmC
AS5Rp.3NP<C1UmsF!,"9D/a&s+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<VdL+<W`g2)#IH
7n$BH5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,L7FE2),G%G2,Bl5&3DIjr,Df9S;E+*g/+=Jru
4F'%E0Jka<+<VdL4!6:90F\@c<E)FR6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0+EMXCEb/c(Bl5&3
DIjr,Df9S;E+*g/+=Jru4F'%E0Jka<+<VdL+<Vdg+>GQ(%16!%<'a)N5t=?d+?L\o.qrmCAS5Rp
.3NhJASrVF+EV=7ATMs%D/aP=@<,p%F('6'A0>T(+CoV3E-!-M0Hb:S+>G;f+<W`g0b"I\5uU<B
<D?:4+<W`g-nB"LFCf)rE[`,TBOu'(0d'mIBOPsq+DGm>E,oN%Bm=3"+EVNEA9Da.F!)kb+E)9C
0e"4f+<Vdg+>F<4%15is/g+%f:K0eZ9LM<I+DGm>ASlC.Gp$RA+Co%q@<HC./g*_t+DGp?BlbD<
ATT&:D]iI2-u*^0FD**G8g%V^DJ!TqF`M&(+:SZQ67sBmDerrqEZe7U:K0eZ9LM<I+E)F7EcPl)
ATJu)Bk)7!Df0!(Gp$pA@psInDf0V=AoD]4-uEdA.3N87DImisFCeu*F(96)E--.D%16!/:K0eZ
9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)CF"&5Q@rc:&FE8RHD]hXpAoDKrATAnT+:SYe
$;No?+EVmJBk(Rf+Du+8ASlC.Gp%0>FED57B+52C67sBY:JXqZ:J=/F;BS%D-t?q!Ea`I"ATB4B
Eb/cqEb/a&F!)lJCi_$JF(96)E--.DFDi9o+D,P.A7]d(4!8upF(KAFC2[X'Df9_?%13OO:-pQU
6#Lrj@:Wn[A0>i"Ea`frFCfK6+CT;%+EMXCEb/c(Bl5&8BOr<'@<6O%EZet.Ch4`5BOu&j$;No?
+CfG'@<?'k+CT.u+Co2-FE2))F`_2*+EVNE8l%htA8-'q@ruX0Gp%$7C1UmsF"SRX%13OO:-pQU
=$]_Z8PVc:+EqL1DBNJ$Anc-sDJ((a+D#e:Eb0<5Bl@m1+C\n)@psChAp%o4@:F.tF<G[=AKX&W
@q]:k@:OCjEZbeu:-pQUFD,5.8l%ht@rGmh+=Lc>FCAWpALSaDBOQ!*E+*d.ATJu9BPDN1F*)G:
DJ()+F!,LGA8,mlDKK<-GqKO5%15is/g*MW:g$[f7n?T%4!5q]BOPpi@ru:&.3L\p6#:?[EbT0"
FE8RFATMF'G%G1n$;No?+AH!85uL!C78u]R+?L\o.qrmCAS5Rp.3N_GAKYE!F*D29+?L]&1(=R>
%13OOC2[X%Eb\TqATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].
De(:L%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g8
6Z6jSBkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleAL
EHGo*AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"
ATKmA$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGH
Bm4)?Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8
@<,p3@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU
,"$HmCb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is
/g)?*FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*
+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e
:-pQU7Pm1\4%*XhF_;gpF`'9O@WHU/+=ANZEb03+@:NkZ+EqOABHT;f0JXbpDfTW%Ec6)<A.8kT
$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<>9Is'+=CW@Bl%<pDe*BmF*)G:
@Wcd,Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=Ma+=D,KC2.Zt-QlV9De't<
C2[WnATfFD>9G^EDe't<-QlV9Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J;eTlWF=Tg94#&fb
F_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1
%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<r
ASc<IC2[WrASc<.0F\@Y1cmER6tKhMB-:)pDEDB<Ecl7B-RT?17Q*=_4&fd4F<FM!DeioG-Vd6-
:`sgrDeio,FCfN8-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1gAA8lR-
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
:-pQU:/=hX3ZrN_+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j7
8g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlH
F_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,
Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\
D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2
DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$
$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.
DI[5e$;No?+Dl7;FD5]1AKXT@6m-2]F*(i.@qB^(@<,p%E+O',BlnH.A0>?(F<GI>F<GU8@rH4$
ASu$iA.8lVE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>
BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?
+E)F7EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55
@<?/l$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:
@N[(1F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6
<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,V
Bl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOs
Ec6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$<Kbe;FNlG8Nf*W-YRF8AL@oo
%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>
+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn
+=LuCA92*lC2[Wi.3NMHF<GX9F=.M)78d#T8l%i/1-IZ@-Y[IA@;KXg+=MI`+EM+&Earc*F*)G:
DJ(=+$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgDY91_`O6ng>Y3ZoOmDJpY9@VTIaFE8f=$4R>;
67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuT
B0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(
-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn
$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?
A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^
A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6
$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$
+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA
/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9
@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:E
Bl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6i
De*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'
/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4
ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HY
C2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;
67sC!E+No0ASuU(Eb-@AGpskT@<?/l$?'Kp4ZX]D-?!E($4R>;67sC&Df?gIE-67FA8,OqBl@lt
Ed9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t
+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%
F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+EV%7FDku6
B6bV@Bl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,q4ZY;EEccC4$4R>;67sC$
F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`D%-g]
$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplLI4cXTEc;Hp
BQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7
Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z
+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A
+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:
E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$
/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC$ASl@/AKZ)8@;0OlDJ()$Cgh3s+EDCEEt&Is
AR]ajEc6.b3Zq]N,CUb>3Zp",+BplL.P<@u0d'[]+=\us>V7-H+=AL!%13OO:-pQU@;p0sDIdf2
FE1f(Ch[d"+Dbb0AKYSrARlonBOPpi@ru:&+DGF1DIm<hF)tc1Gmt+&Ch>gk>p([@-n$f(HXSNU
,$uHU+F?-u+FPjb-o!E&@4iuQ?O[>O$;No?+EM47G9C^?DJ()&De!p,ASuU2%15is/g)8Z+<Ve?
Ch+YB+<VdL+AP6U+EqaEA9/1e:-pQU+<VdL+D>S%+>P&^+<Ve%67sBnEc6)>Et&IO67sB'0H`(m
0Hb%FA0<QK+<XEG/g+\C@s)X"DKKH#+Du+?DK?6o:-pQU-Vd6-:c]sHBP_3%0H_K567sC)DfTA2
A8bt!+EqOABHVA<EbTE(+=BoU9i*ku%15is/g)8b>p([Z+<s-bCh+_D.3N=W+>k9:67sBjDfor>
+CoD#F!,C=+E1b2BFP;^Ch,[i+=AN`,W[&/-o<&-+>>5R$>F*)+C\bi@r,L\C2[Wi+F##>D_</I
A7]e%?X[\fA7$HJ;Gp(Y:IHll+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$I'4Y@k&+CoA+
+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uBkAt?0KgX-4s5&4/g,Qp+Enr=D_</NCL:LbDe*2t:J48O
:IHlk+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$Hi4Y@j*.!mRl.4dJ.+D58-+Enr=D_</C
+ED%8F`M@P+D#G$/e&.u4Y@jf+<u=X0H`J#,:5Ss0d(fe0d(!i/g*>4HXmQmBkAt?0K^S)+CoCC
+CmVf+ClT>INU-n00gq1-:KO9-9`P,+F>:e+ClU+DIb@/$7ISNHQk0eA18WP/g,1G@WZ("Dg+Gp
>rsZG1+>J1Ch>p\/M8A;;CNqF4s2R&HQk0eA.8kp%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2
EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%
67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&
Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#
@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]>-6tVp3[cg-3Zp+*%16f]/g+V3A9)0e@;9^k?QaPU/g,B]
A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk
5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2
,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/
$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=F
GAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r
%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp+',W[&/-o<&-+>>5R
$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSP
F<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!
Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2t
E]l#tEb0E4+=ANZA8a(CEZfC6FEMVA/g+_CA1e;u-upjkF"&4VINU3p4"u"*0d(O#/heD\Ci<d(
-9`Pm4YD.8EX`@)%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo
@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDn
De!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG
0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2
Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+E27>FCAWpAKYH#GT^O;@<ZF'B-:\t@<,dd
FCfK6%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LM`L+Boso%13OO:-pQUGA1r*Dg-7F
Cis6%A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&J#Bl7`s@q]:kF$2Qg3ZpF+3]A00
@4lnU0fCOr/ho(0,$uHs+C,E`%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5
F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4
-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+e
Dfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a]
.3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWp
AKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4
.1HW)ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\
.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3
.1HUn$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[
+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M
-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5
/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F
><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-pp
Df[%0DIakuF)u80Bjl*p+Cf>#AISugF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1
/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U
+=]!\@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQB657=+AP6U+=]!bEGQ'kD0S3)>p)3O1,:%\+?L]Y
F<D\K:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)
E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a
-S?bh/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0
Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.h
Ccsg%-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0F(96)E-*47Ec5e;@rH6sBkMR/ARlou+E1b2BFP;`
E'66)><3l\+Z_;"><3lh+DPk(FD)*j%15is/g+tK@:UKhDIal2BQ&);C*7S-EbTK7+D,Y4D'3>,
DJ!TqF`M&(+E1b2BFP;`E-"0'+BplL0HiJ20JO\S3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1
@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt
/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>
+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is/g+\I
D/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK
<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9
D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-t@()
@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQUF(KG9@3BN0AS,Lo
Eb/c(Ci<flC`m\*DIdZq+<W6YF`V,)+C]U=-u*[2Ch\!&Eaa'$.3L2bFE2XL.!K?9Eb-A4@;]Uo
@jqio:-pQU:f9_O78d#P6r60E6r-053Zoe;3a>[+ATDisB4Yt$Bk&c<F(KAs6#^d2@<>p_9Q+EL
Cg9eFDIdZq>]=+hA8bs*%15is/g*tg77K^D;FNuM5u'gD6TmIQ-SKU`E\D6I@ps1,@VK^5E+*Wp
Ddt.($4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`
@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+J
Dg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".
$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>Ds
F)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;
D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I
%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)
6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hnt5+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA1%fn
:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#
$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dk
ATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/
Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJG
G]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7
E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
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
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EPi$7QDkD..<rAn?%*
C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-X
F_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP.41+*M<7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,
-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3h
BkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU:IIKZ
A8c@,/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.8T&WjDe+!#
FD5Z29OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.;f?f!@qA#G
A7\/OD/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8XE+EQkDdtG#
F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo)dA7f@j@kUi'Bl7QUDe*ZuFCfK$FCd(DA7c8X
.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7
-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".
F)N12Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;
+EVNEF`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%
+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%
DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZ
AKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj
0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o
@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk
5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70eP1'/KeS8
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
C2[W7E+*Bj0+A7;%16rtC2[X%Ec5Q(Ch5@V:-pQ_D0]l7A8lR-Anc'm+EK+d+DlBH8l%htA8,Oq
Bl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]l
AKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$;No?%15is/g,@P
FD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)
ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-
+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'
DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;
AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%
Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9
BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+Df]J4A8,OqBl@lt
EbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<
A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9
+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._
67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]
$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%
F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<
0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14
DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%
Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)V:-pQUD09Z:BlIm"+A,Et+DG_7FCB&s
ATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&DId<h%16WbF(KG9-W3B378uuM-OgCl$;No?
+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>
6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4EbT&q+@S[c:JOha9LU'U+EM+9+=Lu7
Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j:-pQU:.\/V3ZqpTEcP`/FDQ4F779L=
:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC.3K',779L=:/aq^7:0J<De+!4Bl%->
3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGGA7]"UDe*E3AU%c1-OgDX67sBL6pjaF
;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-
.kYCXAKiK2$4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4
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
EccC4$4R>;67sC$F`&=DATMr9F(oH%DKK]?+>"^SDJXS@Dfp/@F`_[IGA(E,+E_a:EZfF7FE7lu
EcF6'+>G3`FE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<
F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i
3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;
ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P
+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-
F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V
+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN
-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47
Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1
+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028
+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U
+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef
@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I
$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA
/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj
+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,
$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/
ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)1
1E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8
F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$
AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$
0F\A'AhG38@:XCg?X[\fA7$I"4Y@jtAThu7-RU$ID_</Q+ED%8F`M@P+D#G$/e&.9E\&ha.3Kja
+>#3-0RFuu+EK[u0Hb"EDdmc74s4l//q#?m%14Nn$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$
$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL
+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsf
F>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"
+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=@:F%a
+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(FCSumEcXB)><3le+Z_P)-S$\t.k<,#.k?!!-R)n?
>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17;n
DJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!A0;<g
6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>
AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI
1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"
Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi
+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(
+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH
/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)
-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW
7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/
>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k
+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&
-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBm
ATVEq+D#(tF<G[:G]YTU@:O=rF!+n/A0><%F)PQ&@<?''@rGmh%173!4ZZjk4!80X%16ro4ZZjk
4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gkD.Gdj
>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD/h^">p)3O1GC"[+?L]YF<D\K:-pQU.P>d^
C^g_gGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:
G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.
0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3
+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:
Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2.6qWi%13OO:-pQUCi<`m+DN$?@rc:&F<G19Df$V,
Df00$B6A6+A0>V0E+*j%%16ih4ZX]i3Zp+"3\V[\3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1
@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt
/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG
8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$<Kbe;FNlG8Nf*W-YRF8AL@oo%15is/g+\ID/^V.
EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k
8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.
E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya
<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)
+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF
-RT?1%15is/g,4HF<G!7E,oN%ATDg&A0>i"DIdZq+E)-?FD,B0+DkOsBPD?q+>"^YF(Jl)@X0(E
C2[X!Blmp,@<?'0%15is/g*tg77K^D;FNuM5u'gD6TmIQ-UTq"<HD_lF'N?hDK9H$/p25HEa1nL
E(",V@9cKE@ps1Y:gn6PDe!$k@;]Uo@j_]m%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3
Df$V=BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et
+EM+8F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u
+DG_:Deio,E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@
Eb0<5+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0
D/XQ=E-67FDe'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&
E$lc4+E(d5-Z*F6-QlV91E^UH+=ANG$4R>]Eb]?-A25l767sa,Eb]?-A0>qF/KeeHA0>i3De`in
F<GX9FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq@4
E-,Z.@V'R&1,(C@%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`m@rsFa+CSekARlp0Anc'mEt&IO
67sB73,`;K0ejeZA7T7^+@/pn8P(m!+CoV3E,uHq:-pQU0K<u\F>5TpBl8!'Ecbl'+@/pn8P(m!
+EM+9FD5W*+DG_8D]ie5A7T7p+DPh*+E_d?Ci^_<@<,dnATVL(Et&IO67sB83Fl]20K(%oATr0/
FED)3+D,P4+A*b:/hf"&%15is/g)o'DJs\R2BZF=C3=T>ARloqDfQsm+?;&.1*@#5:-pQU1,NTS
@PBMZ@:X+qF*(u(+D,P4+A*b:/i>?m$;No?+>PccAR[>Q+=LuCA7T7p.3NPH+B(R,77g3B=C5cW
De*2a$4R>OA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F++=ATh-YdR1A7]p,
C2[W*F`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?+CfP7Eb0-1+EqaECM@[!
+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%16igA7o7`C2[Wi4ZX]5C2[W1%13OO:-pQU@s)g4ASuT4
GAhM;Bl7Q+F*22=AKWQIFE_;)CER&,+Dtb%A7]9\$>OKiF'iWrDe*3<3ZoebDe*p+Deip+ATMs7
-OgCl$<'5k77g3B=C5cWDe*3<3ZpLF-YdR1A7]p3%13OO:-pQUCi<`m+E_a:Ap%o4F`_>6F!,17
FDi9MBkhQs.1HVZ67sB.BkhQs-Qm&5F<Gua+D5_6+=CfBE+<]mF)uJGBl%i<%15is/g)NUC2[W1
+D58-+FPjbB6%r6-Y-[tG]Y;B$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7]suBlmp$F(96)E-*H:
$7BP&De(4<B4Z1*GT](/-Y@"3+DGFt-Qij*%15is/g,+UF>%lZAS*&:+DG_7ATDm6+Dl%-BkD'j
A0=K?6m-\lEb'56Bl5&3@VTIaF<GC<@ps1b%15L!6WHiL:/jSV9hdoK6sjYCDe*2t4ZX]60H`D!
0I[G<F)>i<FDuAE+E2?D-[U;;IXNRQ$>"6dF(HIAH[\_=I4#I2-mrFN/8B*6B4#@fDe*3(+D58-
+=DMb:4@U=%14Nn$4R>;67sC%ATT%e:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m+EVNE
@:OCnG%#K(%17/nDfp/@F`\`RF`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D
+D58-+=CoBA8lR(<HD_lCLqd4-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7CLqd4/n8L+-Qij*
F)>i<FDuAE+=BcW6m-GhDe`inF<GX9FEMOM%17E-H>7A/D..-r?Z]k(1,:-u9jqaR+A,Et+=MP^
H>7A/D..-r/p(ZL.3NG8FCf\>Anc'm/g(T1,n12-+A,Et+EMIDEarZ'BlbD,Df'H3F(Jl)De:,#
+Du==@V'R&De:,%CghC+ATKIH<+oue%14C(Anc'm+CT>4ASkmmATJtd:IH=8CghC+ATJu&DIal$
G]7SBBln96Gp$s4FCfK,@;HA[,p6o>FDi:1+EM77B5D-%F)Q2A@q?cmDe*E%A8bt#D.RU,/e&.6
%14C(@rH4'Bl%L$B-;;0BlbD/Bl%?'Eb065Bl[d++E1k'CghEsGUst^ASbdsAU"Xk,n12-+<VeG
A7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+DkP&ASH$mAU#>DH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>
+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!%14C(@;L$sEc,<-Bm+'(Gmt*,
%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<QD..3kBl7HmGT_<YH>7A/D..-r%14C(+<YKC
@;K@oAU#=?H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%13OO>\S(pF`_t&:IIlj
FCfK$FCe9hARTFbCh55@AU&V4$4R>I@<H[*DfU1sDeO#26nTTK@;BFpI16NgFD5i5AU@[(AU&<=
FF,6]INs#IEcYr5DBjUZ,9TTS7"$1VDfp)1AKX?YA7Zlg>Td9`Df9`8DffQ3BmO>5>]k('HY@MC
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8,e"I9^Z.Ec#6$F(or3
I16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/
A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$=%X`FDPN+B67g6
>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi%16?LAS5^pHXq&)F_t]-FF=T*%16?W
@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tV
H>7A/Dg#i+G:muKG^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Df.1LAU&V4$4R>IDIn$2@:s-\
$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F*)>@AM/(9G^U#.%16?X
ATr*%B4VMZ>\S(pF`_tVH>7A/A8bp0FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*]nCLo,?
AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA9E!.CbBg@G^U#.%16?XATr*%B4VMZ>\S(pF`_tV
H>7A/FDl)6F"VQGG^U#.%14CdDIn$2@:s-\$7/qqDIm<rCisT4%14CdBl7m4FF/H]IV3\>F`;dS
IUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;
@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,
I16M                                                                      ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekR/0f^@3+>G_r1,pC30H`/-+>P_q1,0n+2BXb5+>G\q2`)X30d&A6+>PVn1,g=10H`,1+>GYp
1H$@20d&50+?1K!3?U%5+>Z##0ea_*1*A;++>Pr"0f^@42]sh6+>Ykt0esk,2'=e"0fL401a"Y6
8l%iA<CokP84c`Z:Jt>9ARf:hF<F1O6m,r]Bl%<&BPDO0DfU+GCi<rY:IJ/X:J=\R<CokP84c`Z
:Jt>9ARf:hF<F1O6rZrX9N*'CF_PZ&+D>J1FDl2F+Dbt/8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhn:
F_;h5DeC2$DIal1ATMg/DKBB1:et"h?YXLiCh\!&Eaa'$C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&
DfSfQ6r./^:IITH6XO\@F)Q2A@q?cpDfRl]BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bs2@Vfsl05Y-=FCfJG<)5nX?V4*^6r-0&D.HUA6r./^:IJQ,A92[3EarZ'AoD]N+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r./^:IHgPA7B[qCh.:!A7TCq
FE2))F`_>9DJ"$-C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&BPDO0DfU,<De*KlDImisCbKOAA0<HH
@q]:gB4W3!BleB7Ed;>4F*)>@H"q8.A8bsjASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0
DfU,<De*ZuFCfK$FCeftG%kN3?Z]k(C2[X!Blmp,@<?''Dg#]4G%kN3+A?3CAQW\cA8kstD0'6!
AmoguF<G+.@ruF'DIIR2+E1b0@;TRtATDj,De*g-C/o=dEbf63F)c:EF`V,7CLqd4+Cf>-Anbm#
AoD]4E,ol3ARfg)-ua3AC2[W3C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>Anc'mD..<rAn?%*
C2[X%@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU/@:O._DBNe)
DJ<]oF*&O:DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AT2'fD..<)D..<rAn?%*
+D,P4+A,Et;bpCk6U`,+A7TUrD0]l7A8lR-Anc'm9mIjR:IH=9Bk)7!Df0!(Gp%'HDe<^"AT2[)
C2[WtDe'u0Ec5](@rri7ATW'6H?smPDe*]nBl7:"AU&66Dfd+<@<?(*+D,>(AKYT'EZek1D/a<&
FCcS0De'u3Dfp)1AKYf'F*),6B-:`'@s)X"DKG                                    ~>
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
zz=:zz,'dirs setjaddoncopy setjaddonpaths setjodinterface sha256 showpass s'
zz=:zz,'moutput timestamp toCRLF toHOST toJ tstamp updateJODTOOLSfiles upda'
zz=:zz,'teJODfiles updatejoddistribution updatejodmanifest updatejodsourced'
zz=:zz,'umps wie write''),(<<;._1 '' jod ALPHA BYTE BYTESIZE CNMFDLOG CNMFMAR'
zz=:zz,'K CNMFPARMDEFS CNMFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF DEFAUL'
zz=:zz,'T DEPENDENTSEND DEPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPEND'
zz=:zz,'ENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007'
zz=:zz,' ERR008 ERR009 ERR010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR'
zz=:zz,'017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 '
zz=:zz,'ERR027 ERR028 ERR029 ERR030 ERR031 EXPLAIN FREESPACE GROUP HASH HAS'
zz=:zz,'HFSX HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IPYN'
zz=:zz,'B IzJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME JO'
zz=:zz,'DPROF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF MA'
zz=:zz,'CRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS NVT'
zz=:zz,'ABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK'
zz=:zz,'009 OK010 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUT'
zz=:zz,'BLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8'
zz=:zz,' WORD XML ZIG abv afterstr alltrim badappend badblia badbu badcl ba'
zz=:zz,'dfl badil badjr badlocn badobj badrc badreps badsts badunique befor'
zz=:zz,'estr bget binverchk bnl boxopen catrefs cd changestr checknames che'
zz=:zz,'cknttab checknttab2 checknttab3 chkhashdmp createjod createmast ctl'
zz=:zz,' datefrnum dblquote decomm defzface del destroyjod did didnum dnl d'
zz=:zz,'pset dptable empdnl fex firstone fod fopix gdeps get globals globs '
zz=:zz,'grp gsmakeq guids guidsx host hostsep isempty islocref jappend jcr '
zz=:zz,'jcreate jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jrepl'
zz=:zz,'ace justdrv justpath jvn lfcrtrim locsfx make makedir markmast mnl '
zz=:zz,'mubmark nc newd nextbaknum nlargs now nowfd obidfile od ok packd pl'
zz=:zz,'t put quote read readnoun readobid regd remast restd rv rxs rxsget '
zz=:zz,'rxssearch saveobid second sha256 tc trimnl tslash2 tstamp uses vald'
zz=:zz,'ate wex wrep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTR'
zz=:zz,'S DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR'
zz=:zz,'200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 '
zz=:zz,'ERR210 ERR211 ERR212 ERR213 HEADNMS OK200 OK201 REFCN REFIX REFTS T'
zz=:zz,'EMPFX backnum copydirinv copyfile copyfiles createdl dbakf dfclose '
zz=:zz,'dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropbakdir dropdir drop'
zz=:zz,'inv dropnc dropref gettstamps hashback justdrvpath libstatus loadba'
zz=:zz,'kdir loaddir loadnc loadref loadstamps movefile nummask packdict pa'
zz=:zz,'ckspace puttstamps renamefiles restdict restspace savedir saveref t'
zz=:zz,'mpdatfile tmpusesfile volfree''),(<<;._1 '' jodliterate ALERTTOKPFX A'
zz=:zz,'LERTTOKWRAP BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGINNOTJ COMME'
zz=:zz,'NTTOKPFX CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ'
zz=:zz,' FAKETOKENS HINTPFX HINTWORDSPFX HYPERLINKPFX IFACEWORDSPFX IFACEWO'
zz=:zz,'RDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLBUILDTEXunix JLBUILDTEX'
zz=:zz,'win JLCLEANTEX JLCLEANTEXunix JLCLEANTEXwin JLCODEFILE JLDEFAULTAUT'
zz=:zz,'HORS JLDIRECTORY JLGRPLITTEX JLHINTWORDTEXBEG JLHINTWORDTEXEND JLIN'
zz=:zz,'SERTIFACEMD JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWTEX JLSHELLEXT JLTITLE'
zz=:zz,'FILE JLTITLETEX JLWORDLITTEX JODLiteratePreamble LATEXTMP LF LONGCH'
zz=:zz,'RBEGPAT LONGCHRENDPAT MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP NORMALT'
zz=:zz,'OKPFX PANDOCTOKPAT ROOTWORDSjodliterate STRINGTTOKPFX TEXTQUOTESING'
zz=:zz,'LE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAP'
zz=:zz,'PREFIXTEX afterstr alltrim beforestr betweenstrs boxopen changestr '
zz=:zz,'charsub ctl cutnestidx cutpatidx dbquote dbquoteuq fboxname ferase '
zz=:zz,'fexist firstones formifacetex formtexindexes fsize fuserows gbodyla'
zz=:zz,'tex gheadlatex gpostlatex grouplatex grplit ifacemarkd ifacesection'
zz=:zz,' ifacewords ifc indexgrouptex indexwraplatex jodliterateVMD jpathse'
zz=:zz,'p jtokenize latexfrmarkd long0d0latex markdfrghead markdfrgpost mar'
zz=:zz,'kdfrgroup markdfrwords markdj markgassign markgnonj patpartstr ppco'
zz=:zz,'delatex read replacetoks rtrim sethintblock setifacelinks setifaces'
zz=:zz,'ummary setifacetargs setjodliterate seturlsha256 srxm tlf toJ tslas'
zz=:zz,'h2 utf8 uwlatexfrwords wfl winpathsep wordlatex wordlit wrapQtlatex'
zz=:zz,' wraplix wraprgidx wrapvrblong writeas''),(<<;._1 '' jodmake DDEFESCS'
zz=:zz,' DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 DUMPTAG ERR0'
zz=:zz,'150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158'
zz=:zz,' ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEN'
zz=:zz,'D JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPU'
zz=:zz,'T SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk '
zz=:zz,'ddefescmask dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamp'
zz=:zz,'s dumptext dumptm dumptrailer dumpwords extscopes fap fmtdumptext f'
zz=:zz,'romascii85 getallts getascii85 halfbits htclip jnb jscript jscriptd'
zz=:zz,'efs makedump makegs masknb namecats nlfrrle nounlrep opaqnames pars'
zz=:zz,'ecode prefixdumphash putallts rlefrnl sexpin sonl tabit toascii85 u'
zz=:zz,'qtsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore'
zz=:zz,' CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNJVERSION CNL'
zz=:zz,'IST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ER'
zz=:zz,'R051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060'
zz=:zz,' ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR'
zz=:zz,'070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 '
zz=:zz,'ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR0'
zz=:zz,'90 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 E'
zz=:zz,'RR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 ERR108 INVGR'
zz=:zz,'OUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 '
zz=:zz,'OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 O'
zz=:zz,'K064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsf'
zz=:zz,'x apptable appwords backupdates badcn bchecknames bgetdicdoc bgetex'
zz=:zz,'plain bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit chec'
zz=:zz,'kback checkntstamp checkopen checkpath checkput closedict createst '
zz=:zz,'defwords delstuff delwordrefs didstats dnlsearch dupnames freedisk '
zz=:zz,'freedisklinux freediskmac freediskwin fullmonty getdicdoc getdocume'
zz=:zz,'nt getexplain getgstext getntstamp getobjects getrefs gslistnl hash'
zz=:zz,'bchk hashrep inputdict invappend invdelete invfetch invreplace isli'
zz=:zz,'b iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscrea'
zz=:zz,'te loadalldirs loadallrefs loadwords mainddir mnlsearch newdparms n'
zz=:zz,'ewregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pat'
zz=:zz,'hnl pathref putdicdoc putexplain putgs putntstamp puttable puttexts'
zz=:zz,' putwords putwordxrs rpdtrim rplctable rplcwords sortdnub splitbnam'
zz=:zz,'e''),<<;._1 '' jodtester TESTYAMMER assert ereopen hfd hostsep iscf r'
zz=:zz,'mroot showpass testenvironment yyyymondd''                          '
zz=:6942{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c?I7+>P&q+>Yc-2'=e"1,(XI+>GSn0f(^D1*ALu0fC^@+?1K#0JP=*3?U+51MUi=:-pQU.V`m4
+CcuT+DkP$DBMPI6m-#S@ruF'DIIR2+Cf4rF)rrC$;No?%15is/g*GrC`mY<BOu3,A8,OqBl@lt
Ed8d;CghC+ATJu&Eb-A)G][M7F(oQ1F!,C5+EV:.+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig
+CT)&+E_a:+EMX5DId0rA0>B#DKBo.DKKqB@;]TuG%G]'F!,")Anc-oA0>T(+EV:2F!+t/@<6KB
%15is/e&._67sBJEb/[$Bl7Q+@3A0<6m-DWC1Ums+Co%qBl7L'+CQB@BkhQs.3NGF@ps1b+DG_8
ATDBk@q@8%$;No?+@Kd^FE2;FBl7Q+@3A0<6m-DWC1Ums+D#S%F(KD8FD,5.-u!F7A18X;De!3l
AKY])FCfK)@:Nk$%15is/e&._67sBJDf0Z*Bl7uQ+Co1rFD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<
@;^1./0JYEFCfK)@:NjkG%G]'Et&IO67r]S:-pQU8T&W]Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$
@:F%a+C]U=BkhQs+Dbt+@;KL(%15is/g)8Z@:FC&+<VdL@;Ka&@UWb^F`8IHATDj+Df-\8@;TRs
+:SZQ67sB'+C\tpF<D\K+D58-+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ
67sB'+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdL
A7]RgFCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;
+<Y3/@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+
BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6
%15is/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;
+<Ve>ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU
+<Y<5Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G
+<Y07ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$
+A*bt@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2
+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@lt
Ed8*$:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`
+<VeG@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL/
/0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/
ATAo%+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlom
Gp"MS@:O(`.1HVZ67sB'+ED^J+<VdL+ED%+F_kK,+D#e:Eb0<5Bl@l3F(Jd#@qZ;Y:-pQU+<YfJ
ATJt:+<YlHEb'56F`V,)+C]U=GAhM4F!+n/A0>u*F*)I4$;No?%15is/g*o-FCfMS%15is/g)8Z
7<3EeEZf41F)tc&ATJtB8l%htATDg0EcW?W0JG(41cZuo$4R>PDe!TlF)rHH-Xgb.A1%fn@rH(!
F(KB6+=Cl<De(4)$4R>;67sC&@<63,@:WneDBNb6@:Wq[+D,>.F*&O:DfQsm+?;&.0d$o4Eb065
Bl[c--Yd7-Ch7Z1Eb/lpGUFUV%13OO:-pQ_A7]^kDId<rFE8RL/M/)hDfTB0+Co%qBl7Km+DG^9
FD,B0+EM+(FD5Z2+D>2,AKZ#)CghEsA0>DoAnc-sFD5Z2Et&Hc$;No?+D>\7F<GXDARfFdBk&93
+Dbt+@;KKtDJsZ8F!,O8F<G+:EbTE(+A*bqEc5Q(Ch4`*Ddd0jDJ'Cc:-pQU-n6Z/3Zq!`=%Q.0
<DGhS73G/k8P`7o$4R>;67sBsBl7K)An>Oa/0JG2EcPl&B4W3+ATW'8DCcoP@:C?fDIal+Bl7K)
ASu%"%15cu4ZY;OHXSN9$:@]S3\`F;@4hur<'`i63]VOq/e&.T;G9PC3^Zdr9L]Hu%15is/g,">
@rcK1F(96)E-*4@E-,f4DBNG-A7]g)/Kf.R+CSek+Dl%;AKYDlA0>;'DIn#7DdmHm@rri'De*Dg
$;No?+CT.u+Dl%-BkDW5FD,5.AoDL%Dg,o5B-:_rAnc-sFD5Z2+E(j79gM-E:K1In71BSr;aXGS
:fKS=1,04F9L2WH=?S]#1(=R]<)$%L3\iK#$<U"r4ZY>T%16''=B%FE1,TLJ6<R8V4ZY>V%15fq
;G0DR=&(n>1,fXL<E)FI4ZY>X%15p7<(Ke[4ZY>Y%16$29KbEm0F\@];bp.O3\rK"$;"&s:-q*)
1GTCH9LV6B4ZYAT%16917m/mh1^sd$$;No?+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ26
6W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\
/4iZ@:-pL*76s[">"M3n$4R>;67sC!@VTIaF<G(3A7]fk$<L#$6p3Rb%16'';cGn@0b"I[;GU:h
4ZY>-$<'qr<(/r21CX[c5snOG4ZYD/$4R>;67sBkBk)7!Df0!(Gp%0>Ch=f1AS,LoASu!h%15Kp
6W?WQ:-hc\4ZYG0$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF#kFF:JsS3<(0_b/4WT6
<DY5F<Cp.Y/58Dt;GR`/:I7ZB6W?fJ4ZZY?;FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRX?$;No?
+C\bi+E(_(ARfg)@rGmh/0JJ7E+NotF#kF>6:s[6<),di$=[FSDdmHE3a4Wf/M8/M3Zon)0-FI[
+=nX@+D!/J:I7ZB6W?fJ,$tcd%15is/g,+AFD)e-ASc'tBlmp,+Cf(nEa`I"ATAn?+E1b2BHV8:
DI[d2@<?4%DBNG&@<,ddFCfK6%15ot<(KDG9KbEZ8OccQ:*=m+-SJ^P%15ot<(KAI;H#_>-QkH&
/LN)G5u^BC78+-t%15is/g,+AFD)e?ATD7$+>"^ID.7'e+>6tB@q]:kF!,")E+NotBl7Q+Df-\2
Df^"C:K%]0BQ%s6F(K;R3ZohB7TW/VHRCIO-RgAj-n%YV=%Q/6-X8;P.3M275WV%N>q(1N%13OO
:-pQUAU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRs%16imF*)A0
FD*fu><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[/g*tV<(KDG9I;n3
$4R>;67sBkAS,@nCige:@<6O%EZf=ADe<^"AKZ,:ATAo0De!3tBl@m1%15is/g+nIA93$;FCf<.
@<?0*BlbD5AS-$,B5DKq@;I'"ATD?)@<3Q5BPDMs$;No?+Eh=:@N]B++Co%qBl7Km+DG^9C2[X$
DD#X<Et&IK9gM]W78c90C2[X(H#n(=D/`p*BHS[;D..L-ATB.-$;+)^:f:(Y4Z[=rA93$;FCf<.
@<?0*-YdR1E,ol/Bl%?5Bkh]:%15^'6rd/S;E['UDe*p7F*(u1E+*j%+=CoBA9Ds)Eas$*Anbm1
Bkh]:%13OO:-pQ_ASu$hAT23uA7]Y#Et&IkDe*Bs@ST6B+=_,EA7TUf+CcuT+Co2,ARfh#Ed8dG
@VTIaF<G(0@<6KN+D#e>ASuR'Df-\9AfrL:De*p2DfTD</e&._67r]S:-pQU6tp[Q@ruX0Gp%$7
C1UmsF!+n3AKYK'ART[lA0?)0ASrW$Bk)7!Df0!(Bk;?.@<,p%DfB9*ARl5W:-pQU@;]TuA7]h(
Ec657A0?)0ASrW4BOuH3@<,p%@r-()ARmD9+@KpaARfh#Ed8dG@VTIaFE8R7Df0Z*Bl4@e:-pQU
@3BW&F<GL6+Du+?DK?q/DIal5ATD7$+EV:*F<GF/DII0h+=]!XC1\T#Bl%?'A8-'q@ruX0Bk;?<
%15is/e&._67sBPDKKH1Amo1\+Du+?DK?pI+Eh=:@WOR>$;No?+<VdTD..=-+Du+?DK?q/Eb-A-
DIdI%ARfguGp$I$+ED%*ATD@"@qB1"%15is/g)8ZA7f=fDf]J4+<VdL@r-()AKYMt@ruF'DIIR2
+D,>(AISuA67sB'+Co)&E+No0+<VdL+E)41DBNJ(@ruF'DIIR2+D,>(AISuA67sB'+Co)'+<VdL
+<VdL+Co2,ARfh#Ed8d>Bl%?'E+*j%Et&IO67sB'+CoA"DBL&E+<VdL+DtV)AKYo'+DkP$DBNJ(
Eb/a&DfU+G@rH4'Df0-(F<GI>F`%Wq:-pQU+<Y34Bm:aC+<VdL+<YQ1D.Oi.Aftr!Bl5&(Bl[cp
FDl2F+DG_(AU#>8Dfoq,$;No?+<Ve;DJir,+<VdL+<VeE@;TQuDe:,%CghC++Du+?D@HqJ67sB'
+CoA-D'0rD+<VdL+EhI?Bjtmi+E(_(ARfg)DIIBnEt&IO67sB'+CoM2E+E['+<VdL+D#S%F(HJ)
Bl[cpFDl2F+Du+?DK?6o:-pQU+<Y38DfBT(+<VdL+<Y69@<6!&@r,RpF"_W\E+L/0Dfor=%15is
/g)8ZA9)U-Eb/i*+<VdLATD4#AKZ#)An?!oDI[6#DJsZ8Et&IO67sB'+D58-FE;P4D/aP=+ED%%
A9/l'Eb/[$Bl@l3@;]TuCghC,E-67FA79Rk+EV=7ATMs%D/aP*$;No?+<VeCDdd0eBlY==+<VeC
Ddd0!A8-'q@ruX0Gmt*U67sB'+Dbt)A8Ym"+<VdL+Dbt)A0?)7Eb$;$DIal,@:O=r+Cf4rF)s!V
H#R>9%15is/g)8ZCi<`mEb/i*+<VdLCi<`m+ED%*ATD@"@qB]j$;No?+<VeCDdd0tFCB$*F!)TA
Ddd0!FD5T'+EMX5D/aP*$;No?+<VeG@:O(`Bk)6-+<VeG@:O(o+Co1rFD5Z2@<-W9@;]TuF('6'
F!,C;A0>JuCh7Z1@<3Q"+C\bhCNXS*$;No?+<VeG@:O(oE+*6f+<VeKATMs7+D,P4+EM[;Anbah
ASuT4@UWb^F`8IEE+*6f%15is/g)8ZE-68EF*(i-E-!-EF`:l"FCcS/DK]T3FCeu*@rc-hFD5Z2
+CT.u+DbJ-FDuAE+EV=7ATMs%D/aP*$;No?+<VeIATMs(Bk)6-+<VeIATMs3Eb0;7D/XK;+ED%'
ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`Bk)66%15is/g)8ZEb0<6F)YPtAKW*<FCfN8F!,(5
EZfFGAnGaeBk;1(+ED%7FDl22+EML1@q?)V:-pQU+<Y`6G%G2uEZcJI+<Y`6G%De,Bl[cpFDl2F
%15is/g)8ZF('6'Eb/i*+<VdLF('6'+ED%*ATD@"@qB]j$;No?%15is/g*o-FCfMS%15is/g)8Z
7<3EeEZf41F)tc&ATJtB8l%icDdji0@;]^h+>PW)/M].C.1HUn$=e!aCghC++=CT4De*Bs@ODTl
@rH(!F(KB6+=CT4De*p2DfTD:%13OO:-pQ_A7]^kDId<rFE8RL/M/);:IJ`3@N]2mE+NotASuT4
A7]@eDJ=3,Df0V*$4R>;67sBkBl[cpFDl2F+Du+?DBNh*D.Oi/Eb/isG\(q*$:IH`:/+YM3]oJV
?SNZN+BM?:6m,Gt;cFl0;GU:h+B)93<(.p(5snOG-OgCl$;No?+Co2,ARfh#Ed8dFDfoq?F*2),
Bm=31+>"^SEb&a%+DkP/FCfK6%15L&;b:(Y:-CX#4"akp+=A:2;]nY6+@AmO%13OO:-pQUFD5T'
F*(i-E%E,GDId='+Dbb5F<G"0A0>B#D/aE2ASuT4DJsZ8+DtV)ATJ:f-p'I;6qL9U;]nJ";Fst5
6qL9D:+%JR3ZpO/0d(j)+@Je!:/+Y0/1)u50-EY^;b:(Y:(7O>$;No?+DtV)AKYK!@<6K4@;]Tu
D.-ppD]j.IE+L/0Dfoq?DIIBnEt&IE8Q&;N4ZY\e/mg=U-QlJd;FF8I+AG-h;GU%T-OgCl$;No?
+ED%*ATD@"@q?d$@VTIaFE7lu6qL9S7SZ*-4?G0&0d%hd=&2^^;FO%t<(0_b;FO&&%13OO:-pQU
Eb/ioEb0,uAKZ)/D.Rd1@;Ts7+DG_(AU#>6BleA=@;]Tu@rH4'Df0-(F<GI>F`&=>@;TRs%14LF
3[[fo7T<;/;FO&H=<LL17RKou.6T^74<cL&Ho`B<8Q&GU:*;)7/j:p26r[)V=@5gm$4R>;67sa!
DId9hE+NotASuU2C2[X!Blmp,@<?'U67sa&De*ZuFCfK$FCcS9/M/)XASu("@<?(%+Dbb6ATD4$
AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q@ruO4+D,Y4D'2GH6m-,_Dfp#?/e&._67r]S:-pQU
G%G]'@<?4#3ZrKTAKZ).AKYT'Ci"$6Bl7Q+@Vfsq+E27?FE8R5DIal&Bln$2@N]8sCh7Ys$;No?
%15is/g+hLFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&
/So-CATD4$AM%Y8A1nB!:-pQUBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\
0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:%15is/g+hLFDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%
ATD4$AM.q4Ado)B67sBoFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(#$;No?%15is/g+kGFCfK)@:Njk
GAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'<(KSZ:dIiE:I?6I+<VdY+D,b4
C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sB'AoD^,BkCd`
ATVL.+<VdY+D,P4D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0
%15is/g)9LEc>i/F<D\K+<VdL+<W6YD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g)9NAmo1\
F(Jj'Bl@l3+<W6YBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g)9NAn)r++<VdL
+<VdL+<W6YAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sB'F(KH.De*ZuFCfK$FCcRH
+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFb
Ch4%_:-pQU+E_mE@<?(*Ao`*6Eb'56/Kf1RGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEs
G\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sB'GAhM4Ch[u6+<VdL+<VdY+DkP&AKYetFCf\>
Ao_g,+EqaEA0>]&F*&NQGps10:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F<De!lC0b"Ib67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB812gZE0Jah"GUXbJ
Ec>i/F<G"4B6A'&DKI"0A7T7^+EVNEF*2G@Eb0<5+EDC=F<G[:GT^pJATE!8Blmp-%15is/g)l(
De!lC1a$FODfp"A8Oc!579<8_6rR`=Dfp#:@;TQuBR+Q.EboH-CLq#c$;No?+>GWi@rsC^+ED%4
CgggbA0<rp+E1b0F(oN)+EqOABHS^IAo&n=/Ke_8DIdQpF!+q#A0>V0@rGmh%15is/g)l(De!lC
3$;X?A7]9oATDg0EZf%(DIdQtDJ((D+ED%4CgggbA0<:EEbTW,.3NhKFD)dFGB.D>ARTX/%15is
/g)l(De!lD0d'n8C3=T>ARloW@8pf?+E2@4@;TIiAKWQI@q]:gB5)6r+Dl%7De<p*FE7lu:-pQU
0f!ZWF>5Nn@:Wn[A0<:A@WZO(ASuQ<+>"^YF(Js+C`m>.EZee.@;L48Bl7Q+@rGmh+EV1>F:ARP
67sB812gZE0fL4`A7T7^+=MGS@;pC1@Vft#B.4rT+Dbt6B-;86F`Lu'+Dbb0ATJu3Dg*=JEa`p+
ARl5W:-pQU0f*?O@kp%e@:Wn[A0>u4+=Lu5@r$-7+@g-f89JAaEb03.F(o`7Ed8*$:-pQU1,*QR
Gq_0"@:X+qF*(u(+EqaEA0>K&Ec#6,Bl@l3.!K9>.3N5@EZdss3A*!?%15is/g)o'D..]D3$<?_
A79RkA0>K&EZek7EcP`/F<DuN@;]Uo@jrODATDj+Df0V*$;No?+>PWcF`&ll+CSekARlo3AoD^,
BkCd`ATVL..3N_N+DG_8ATDBk@q?d,DfTB0%15is/g)o'DJs\P0d'n8A7]9oB6%F"BPCst+CT.u
+DG_'Cisf5Df0V=F*1r&Bl[cpFDl2F+EVNEE,oMuD.7<m%15is/g)o'DJs\P0d'_1AS5^pHXq&)
F_t]-FF>9KDg#]&+EVNEEc5l<+D,>(AKYT'EZe/$ATCIU@:h-%Df#pj:-pQU1,*TaFtb`q.!&sA
C2[X!Blmp,@<?'0+Cf5!@;]Xs+EM%5BlJ/F+CTD7BQ%o>F"&X_ASkjiC`m.sA7]9\$;No?+>PWg
Dg!ij+=M2J@rGmhCghEsGUXbDA7T7^+EVNE@:X+qF*&O7Des?4Bl7Q+De:,9Ea`p+ARlp"Bl7L'
%15is/g)o'A7]7)0d%leGAL]0AU%g-GAhM4F"&5?A7T7^+:SZQ67sB90k=j*1,0n"8k_TG76s[J
79F\MBm;0O8k_QO8PDNO79F\MBm;0O8k`/S78-BD=B$^l@:Wn[A.8l@67sB911><<0K:1'F(KH,
Bl8$%Ci<g!.3N&0A7]9oFDi9MB6%s-Blkd5$4R>PDe!TlF)rHH-Xgb.A8Gt%ATD4$AL@oo@rH(!
F(KB6+=Cl<De(4)$4R>;67s`uAT23uA7]Y#Et&IO67sBkARfObEb/c(B5DKq@;I'"ATD?)FDi:1
G&M)*+Cf>-Ap&0/DJ((c@8pf?+DtV)ATJu<Bln#28g&"[D.Rbt$;No?+=J]g4ZX]X9N4S_9LVoL
=<L40:KC%U=&_Uj+A,<o<CokP<(0n38k_`Q:eXG[<(0n38k`;^;FF2M<)c:g+:SZQ67sB/.OdMA
+A,Et9PJT[Eaa'$:i^,UD.7<m+A,<p9LV6B<(0n38k`/S78-BD=B$D89L;`N9LMiK=ESLqGRY!T
67sB/.OdMA+A,<p9LV6B<(0o3DJ=><8k_QO8PDNO79FbJDBMPF6VKp7:/jYaGA1q;%13OO:-pQU
;K$2ZEZdnqBd[sEGAhM4+D,P4D..O#Df-\=FCB9&+DkOsBPD?q+>"^WBl.R#Bjl$)FDi9`3ZqmS
F:ARP67sC"@<-F#F!,R9G]Y'PBln#29La(S+ED%8@;0V#+EqL5FCfN4@:Njk@;]TuBOPdhCh7Z1
DfB9*+E;OBFCfMG%15is/e&._67sC(ATD6gFD5SQ+Du+>AKYMtAnGUpASu!h%15is/e&._67sB'
+<Yl?CaU_d+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$;No?+<VdL4$"`>0-Fs]+>P_q2(Tjt-VmQ-
:*<D6:K0b1%13OO:-pQUBPD!g+EM%5BlJ/:Ci<flCi^^B-n6Z//g,"CC`me2C`j/oD.[TI/g)o,
2C't!+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sB_+E)@8ATA4eD.[TI/g)kk+=K6$@4l7H-Qjcc
+<VdL+<VdL+FS*=C`jiq67sBZ+EqL5FCfN4@:Njk.!'?9@q?ckDIal'DfTQ<Df0Z*C`mh.@OV`n
D.[TI/g)nl+=Jch@4l7H-UD/g.4[&c/i#=6+FS*=C`jiq67sBH+@.S_+CQjJ+D#e-Cis9&DJ((e
+@6MED.[TI/g)qm+=LYNBeCc.-Rg/\+<VdL+<VdL+FS*=C`jiq67sBU+EV:.+DbV2FCfJ8:(7PI
Ao'U_+>b2`-t+`B/git5.3K`U+<VdL+<VdLI;NS4+<XEG/g*J'FD,5.Ch7^1ATAn[%16raCcsBn
2'="i@4l7H-SR811GgsI2`Ng)-Rg0dD.[T,+AP6U+?:QTBkM.%F!+n/A0>4g$>jBk4Y@j8+<W(@
/nlpc/gi(j+<VdL+<VdL+<Z)LAo&S4:-pQU6m+)k$>jBk4Y@j9+<W(@/nlpc3[Z@!+<VdL+<VdL
+<Z)LAo&S4:-pQU6QeE!$>jBk4Y@j:+<W(@/nlpc-RU8j+<VdL+<VdL+<Z)LAo&S4:-pQU;'9k$
DffP"$>jBk4Y@j;+<W'e1FXFh+<VdL+<VdL+<VdL+<Z)LAo&S4:-pQU6W+@#D.[TI/g)l&+=Jru
.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBS7L]\6$?Kfq4Y@ja10n-/0d(ls+tbr0?SW`P0H`D!
0I[G<-QlM6+<VdL;]m2*+@.+m+<XE%+<Vdn+<VdL3?TFe+@I=p+<X#o+<Ve(+<VdL6W,$L+<Ve#
7N`g$>qc]p+>Fun+<WBo+>Fu]1*A:o+>Y,p+<WE^0d%Ss+>Fu]0d&1n+>Fun+<WTc0d%Sn0H`(m
+<WB]0d%S]:-pQU0H_KPDJ=3,@;HA[+>Fuo+<WBo+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&.m
+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0d%TWFD,6+%1444+>P&^0esk,+<WE^0H_Jn+>=o\
1*A7n+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)nl+CT)*05boL%1444+>P&^
0esk,+<WE^0H_Jn+>=o\1a"Ip+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)qm
+AN@Q+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\2'=Rq+>Fum+<WTc1*@\o0H`+n+<WB]
1*@\^:-pQU1a!o964F8E3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm+>=o\0d&.m+?:Pu
+<WBm+>P&^+>Fuo+<Ve%67sB<+<XEG/e&.10d&:q+>GYp0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jr
+>=o\0d&.m+?(E"+<WBm+>P&^+>Fuo+<Ve%67sB=+<YQED%-gp2]sds+<WTc0H_Js+>=o\2]sds
+?(Ds+<WTc0H_Js+>=o\2]sds+?1Jt+<WBm+>P&^+>Fuo+<Ve%67sB>+<W$@$6V&G1*@\o0d&4o
+>P&p+<WH_1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>=o\0ea_*+<Vd]+>P&^+AP6U+?1Jd-RT?1
+?:Pu+<Vde+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm0H`+n+<WB]1*@\^
:-pQU3?TGSDf'?&DKH<p+>Fuo+<WBn+>P&^1*A=p+>b2r+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc
1*@\o0H`+n+>GSn0H_J\:-pQU0ea_;;@NsU0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb1*@\o
+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB80d&h]9L]Hu+>Fuo+<WBo+>=o\1*A=p+>Y,q
+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0eskmE+*6f%1444+>P&^
0f'q++<WE^1*@\q+>P&^1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l)
+EML1@q?ckAoqU)+Du==%14Nn$4R>;67sC)DfTA2AoD^,@<?4%DBNP0EZf14DImku$?p)u4ZX]6
0KX>fCccKGCagJR+?MUn$4R>79LMHM771$M;HZ.D+=ANG$4R>79N+JN9M@lW<'<8b4%VnC8PXUo
3[\u^+C\c$-OgCl$;No?+Eqj7E,]B!+Dbb0AKYr4AS,Y$%16075u:6D5t!js-U'.84spdH%15is
/g,+ADIdZq+EVX4DKBE.Ec#Au+Eqj7E,]B!+Dbb0AKYf#@:UL&Deip%%15Bp78d)a:J4be5u9^*
+=CD[Ch7X/<,ZQ!-S/=s5u:6D5t!7OI4#I2:-pQ_ASu$hAT23uA7]Y#Et&Hc$;No?+EM4-Cht58
@rc:&FE8RHBOQ!*ATD4#AM7M8Bl%<&9OUn3=<M3iCh7Ys$4R>;67tA_IXZ`p+F>4`F(c\E%15^$
6<-TN6rZTWF`(o<4ZX]>+?CW!%14=&F(K?6ASu!h+E(j7CghEsGT^L7D/E^!A9/l8BOQ!*B4Ysl
Eaa'$+AbHq%14=&@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3DBO%7AKZ28EbfB,B-;/%FD)*jCis0&
@<?(*+<Z+XIV3\>F`;dSILQX$@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>
INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/.1HUn$;*uZ9LV6B<(0o3DJ=>Y3Zp+!3Zp*c$6p[6
ASl@/AKYetFCf\MFCf\>FCf<.+D,>(ATJ:fEbupK/n&mI%17,m+=]!Q@VcJ\EbupK/nB->%17,m
+=]!_Et&IsD'1;\Bk2Gt$?Bu+.P>X^F:ARtD'1;\Ci<qq$?Bu+.P>g]@grccD'1;\Ci<np$?Bu+
.P>OUC^g_lD'1;\Ci=D)$?Bu+.P>FQA.8ldD'1;\Bl%Dk$?Bu+.P>1HB+52gD'1;\B6k!o.1HVZ
67tGcIXZ`p%13OO:-pQq4FVa.INWt[/n/72+FO\+8k_QO8PDNO79FbJDEU$'0H`D!0F\A0ASiQ2
AT;j(DI[6#De:,.@<?(*+Cf>,D..<mF!,R<@<<W)ASu("@<?'':ddb^$?B]p+CT>4F_t]2+DbJ.
AU#>/G\(q=@<,p%Df-\>BOr<1DfTW-DJ()2@<?/l$?Kd#Ci<flC^g_]A0<O9+=2JIE%h_.Cis0&
@<?(*+<Z+XIV3\>F`;dSILQX$@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>
INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/ASu$pDe!3l%14Nn$4R>79LDKB5u(BJ=EeIs4ZX]>
+?CW!%17,eD'3k1D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IeAS`J=/n&mI%16WWC`k2[@Ua-_
$=m^a+=]!SG%hBmA7]R".P>[]%16WWC`k2[Bk2Gt$=m^a+=]!^F`\'"A7]R".P>OUB+52YAS`J=
/p)#A%16WWC`k2[Ci<np$=m^a+=]![DeojiA7]R".P>OUF:ARfAS`J=/no36%16WWC`k2[Bl%Dk
$=m^a+=]!QChF1aA7]R".P>@[%16WWC`k2[B6kt8F`VgW%14Nn$;No?5!FFEIXV_5%14L>+?CW!
.46JP$>F*)+<VdL+A#%(8PUBNA8a(0$6UH`9LDKB5u(BJ=?S\f8k_TG76s[J79FbJD@Hpq+A,<o
<CokP<(0nP3Zq$g6<-TN6rZTWGA1q;+:SZhCia0%AhG2t7TE2T=<M-m/e&.1+A,<p9LV6B<(0nP
3Zq$g6VKp7:/jYaF`(o<%144#8k_QO8PDNO79D]6+A,<o<CokP<(0o3DJ=><%16Z_F(K&t/nAlQ
%144#F)>i<FDuAE+=BcT6VKp7:/jYa01no)<CokP<(0n3F(96)E--.DDJsV>F(KG@%16ZaA1e;u
.1HUn$;No?4?S(AIXWDd+>.J=FCf\>I16Mm$;No?+D5_5F`8IFBln0&+CT.u+CTD7BQ%o6/Kf+V
@;]UaEb$:tD..3kFD5i5AISu=9N4S_9LVoL=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8E\&>TBln0&
/0JkMFD5Z2@;I'/Eblk,DIal'@<6)k$=%"^FD,T5H[[2g@<H[*DfU:OINTqA>R_#d>[.^F-!YM.
@;Ka&>]k('H[[2gBkh^3Ebp1LIXN>D>R_#d>\7nmFDc#=ATMR3AKY6"AU&<=FF-qW5qOiL2EDt0
,CX]I@59\uINs;i+C&f&Ec#6$F(or3%17Lm$=%[eFDPN8>]aP%FEDVOINs;SEc6)>INs;i+@gHj
F`;a<$7QDk%15is/g+eIDfp"ADg#]4G%kN3+D>=pA7]cj$;*uf<_5_]<(0nP3Zp+!3Zp*c$7-g:
BPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%16?]ARfgrDf0o,FCf]=FEDkY,CX9GDfp#J,CY%`:Ng;i
G%kN3I16N4%13OO:-pQUB6%p5E$01>Dfd+DAU#=L+Cf>+F_u#;+DkP4+Dtb%A0>;kC3=T>Bl7Pm
$;*u^;G^%Y<)c:g4ZX]>+?CW!%14C(9jqaR+DPh*Ch\!&Eaa'$+=LlCE,961.3NG8FCf\>Anc'm
/g)QTEc>i/F=A>FASu("@<?(%+<kH=Dfp"C%14C(DIIBnA0?&,EcYr5DK?q=Afu2/BlbD/Bl%?'
AoD]4ART(^+A,Et+D5_5F`8I;F<GOCDe!@"F(KDF%13OO>\S(pF`_t&:IIljFCfK$FCe9hARTFb
Ch55@AU&V4$4R>I@V'1dDL5o4@s)X"DKL:9$4R>IBl7m4FF/H]IV3\>F`;dSIWT:GCh55@AU&V4
$=%FVCLqU%FDPLt$=%[]@VfUoAn,asFCf?3Et&Hc$=%I[GApu'AIStm+Cf>,D..<mF!,(5EZee$
C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'Ecc#5B-:V*Ecl20%14Cd
F(KH0ASu.&BR<uoDesQ5DKBB.I=!b]D1)j#-!YM&FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%
FF=T*-!YP9De!^%F_u"*$=%:_E-68LINs;SEc6)>INs;[G%kN3/p(ZLI16Mm$=%I[GApu'AIStm
>]4Lk@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*
D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4
$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$;No?+EqaEA0>]&F<GUBDfd+DAU"Xk
8k`;^;FF2M<)c:g4ZX]>+?CW!%14C(9jqaR+DPh*Ch\!&Eaa'$+=MGPEb'!#F=A>K@<?(*+D,>(
AM,)7$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?LAS5^pHXq&)F_t]-FF=T*
%16?XATr*%B4VMZ%14C(@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#
DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"DJ+')HX('!CisT4F(K<=HS]5MI16N0
>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0>]b1.@rH1+D/Kdi%14CdDf0,rDesQ5
D@HqXBl7m4FF/H]IWT.GDIIBnINs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'
D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5
Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$7QDk%13OO:-pQUD..-r+DPh*Ch\!&Eaa'$+A?3CAQU'o
Eb/Zr@VfTb$;+)^9PJT[Eaa'$:i^,UD.7<m4ZX]>+?CW!%14C(C2[X!Blmp,@<?''CghEsGT^sG
ARTFbCh54A%14C(%14C(<+oue+D,>(AKY].+CQC+BkM*qGp$U>F*)>;BmO?$+Eh=:F(oQ1+E(j7
FD,5.E,oMuD.7<m%14C(D..NtEbSru+D58'ATD4$ARlomGp%'7DIdZq-Z^C^F!,C?FD5Z2+EqL1
DBNn=De+!#Bl7Q+%14C(/p(ZL+E)CEE-67T+E1b,A8bs#BPD*mCh[NqFD5W*+DGm>Dg#]4EbT&p
ASrW!DIa1`,p7;CAKZ&9@;]UaEb$;,DId='+DGm>Eb/cmAnc-oA1eu6$4R>IA8bt#D.RU,@r,Rp
F'C@SE-,B4@<-I(@r,_)%13OO>]k+!E+*6l@:s.UCgh3lF(8WtAR0XqAT)EsFE2YT%16?_F(K<!
@r#LcAQrhZ@:X(iB6.@*Ap%p+E+*BjI16NgF`V,5@:O(]B4ZF+D/WrrEc-:7$=%^pAT2'fCLLje
HXUc4F*VV3/7EC:D..O"I16NgF`V,5@:O(]B4ZF(Ap@m/AU#b?Ao)TuFCf]F%13OO,p7/IDg#i*
ATJu!FCf]=F*1r5@rc:&F:AR^F`V,5@:O(]B4ZF%Bm=H9GVWiY+:SYe$7-g-Ea`p#Bk)3,Bl7Es
F`V88DK?6o>]k+!E+*6l@:s.uB6%F"BPCt$/9>rCAnbn#Eb-eCBk1db@;pW($=%4a@;omo@rlTt
FD-#J/h^pV@r-:/Bl@m107A6X$4R=g+E_a:+Dkh&Ec6&FE+L/+AftN*@;0Od@VfTb$=$/77VQ[M
7<iNfFE;eGBk)1%FEqh:/ou,[I=#4AF(K<!@r#LcAUA9.@rcL0H#R>CI=$AO$=%:WDKTe=0O/=(
G\(u.GT\_GAnbLaAo)TuFCf\>0jJ=)4YS!)+DGF1E+ER&AU"Xk+<Xp3F(K<!@r#LcAQs;!AiO(C
Bl7m4FCf?"I16NgAScF!+=/.EAfto4@<?(*+E)9CG\(]"FCf\+$6UHrF`V,5@:O(]B4ZF%Df0Z<
E+NO-%144#>\RepATVL.%144#+<Xp3F(K<!@r#LcAUAZ<FEhnJ@4ZYGDJ<U!A7^/u$6UHrAn_\]
+<Xp"AS,@nCij9-DKKK%@<?X4ATN2m@;p1"DJ)+SAU#eKAU&;J;e'6PAN`arFCSuXDg,c5@psFi
I16N++=/.NAT2Ho@q?cO<DlUm6QgSeFD)e>DJ<U!A7ZlpF`MCC@q]:k@:OCjEZbeu+<VsQBkAK5
Dfm1?AS#BpFD,B0+Cf(nEa`I"ATAnF+EV:.+E2@4F(K6!AKYo'%144#,p7;CBlbD<Bl7R"AKYJr
@<,ddFCfJ8Bl5&8BOr<*Eb/Zr@VfTuAoD^"ATJu:F(HJ4Afu>0CghEsGUstRF^])pFCetl$6UH;
>]++s@rH4$@;]V&>\/%uDgct$<DlUm6[^("+:SZ#+=/.?@;[3/ATT&5FD,6++Dl%7Df]l+@q?cp
Df0Z<+DGF1FD,62-ZWc@@<Q'nCggdhAISth+=/.%+ECn4BOu3,Ch[Zr+B*3$EarZ'6Z6LH+Ad)s
+EM+*3XlE=+=/.DFEDI_0/$dNDeF,D@:X:cAM.J2D(g!VE+3X%B6%F"BR)6d0JP=90KCe-Dfp)1
AM%D1A7[?3Ec3RDFDYh'$6UH;>]XIuD/X<1AoDR/HU`$eAPI)\Dg`'%+<Vt8F(KH1Df0K*Df0ZD
;f?f!@q?cMDe*E%:i^K&%16?PBakCY$7-fmARo@aBl7K)CggdaCj0T(FD)e/DfQt:BleB;4!8H`
BOu4.Bldi:+EV:.+D#G5D.R`rFCcS6@:O(]B4W30Bl%T.@psM$AIStm+DkP-CLqO-+EVNEAU&<.
DIal!AU/33A0>u-AKYf#Aoo/4@<-!pDCuA*>]!nbART[sATW$*Ea1nP6=jeDDFADQF_t]-FF,;C
$6UHrEb0-"G@PQ.D..<mHX&gPBleB1I16N++<VeR>]XIuCh7KsFD-#+CggdaCj0T(FD-)L1hCNP
I16O3>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1@<?(/%13OO,p7;DB4uC'BleA=@rH4$
@;]TuAoD]4Ch[s4+EML1@qfgn%16?ZEc6,8A7]7hD/E^!A:%R'BkM+$Ch[s4I=!7L$6UHrF(KH0
ASu.&BR<uuFCf<1AT3'E0Q;,^>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\I=2P3%14C(@WcC$A0>E$
@s)X"DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.%14C(@rH1%EcVZs>]k+!E+*6l@:s.u
@rH1%Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#I=!_+3%QgA3%QgA3.25C,p6qF@rH7,
Ec5b:F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:Ci=?BHZEb.I=!Y#0f(@7/i#F<0J54=
I16N0+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'EFq"d`A7]@eDIm<rCi=?@A79Rg@rH1%
Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$+>"^ECht59H#R>9+EM+*+DNNRD/9Xg
>\%DXBl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%16?NAS,XoARfXpDfU26
@<6!t@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdMD7Ddd`tDes?4I=$!I
@XWSW/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@@q]:k
@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdMkLEbTE(@rH1%Ed`:TB4?:9
0J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%FCT6*DfU8QEbAj0HS@'02CpO71Gp^;
/hf#.%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3@ruF'DK?6o-!XtlAnc-o@rH1%EdM_H
BOu3oDes?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_A7]@eDIm<rCi=?@DffZ(Eas$(DfU8Q
;Fa'%HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM52ATDm&Des?4
I=$!I@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&18g&:gEaj)4@;]TuDJsZ8+DtV)ATJ:f
>\%DXBl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n10JG%3/heu-+<VdL+:SYe$=%^pAT2'f
CLLjeHY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSgD..<m@q]:kF$3c5>^K_(?$fh(I16Ng
6tKtEDIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$DJ+BE<b6;\@<?4#I=#IBD/E^!A7K:]
EcXBK>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-+D,P4+Dl%;AKYJr@<,ddFCfK6+E1n4
+Dbb0AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)Des?4Bl7Q+@rH4$@;]Us+>"^R@;TRs
%14C(@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8A7]@eDJ=3,Df0V=D..]4%14C(@V$['
ATT&:D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$@;]Tb$=%^pAT2'fCLLjeHY.;,D.R7+
%16?XATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2
FCf]=@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl%14C(GAhM;F!+q'FED)7+EqOABHU5l
F`Lu'+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4<,ZQ#>;9E1>]aP%FCT6*DfU2?AU/K0
Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=oDejc*0jT-2FCf]=@rH1%EdM>*FCAZt
Ci=?BH[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=gI9SF3HX(Z(G][G6Ci=?@A7]7o@rH1%
Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA?$goC0n"Hm%16?XATqX&D/E^!A:%QJ
@<6!T<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!7Vm!O
FB!0oI9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XN15E`?sm
I9SF3HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3>]++s@rH4$@;]V&>Z5`b
Bl7Q_Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6Z6gY
ASuThDejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q>]aP%FD5iDHQt7nI=6MQ$=%I[G@PQ.
D..<mHX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3oDes?4I=$;c0n"Iu+:SZ_DIn$%Df'?"
DIe*!6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*DfU8Q>]aP%FCJj/HQt7nI=6MQ$7/qp
ATqX&D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%EdMD@DI[0pCi=?BH[?tlI=6MQ$=%I[
G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'H[B5):%9jr'XATCag
COKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*0jT-2FCf]=@V0t6,;FUpI16NgDIn$%
Df'?"DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et+E):7ASuU$A0><'G\Lu.@<-W9@rH4$
@;]Us+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4YslEaa'$A0>\sFCf\+$=%I[G@bZ8Bl\-0
D.RU,HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8DJ`s&FF-VU6r7fCFAR!r@qB_&DfU8Q
I=$AO$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.mFEq\6HY-](@sNJ3$4R=g+Cno&AKYPm
@q[!(@:s-\$=%U`Df9`E>\.bkBR=!+De*:%I=2P3%16?SAp@m/AU"Xk+<Xp3F(K<!@r#LcAQs4e
FDtZ$ATMR3ANaX6Cia/=+=/.L@:s-oF(or3+Co%qBl7Km+C]U=G\(u.GRY!&+<VdL+<VdL+<VdL
+E_R9@rGmh4_A,=F(HmF+<VdL,p7>JBk)'lAKYH&ART@q+EqL1DBO(CARlp-Bln#2G\(u.GRY!&
+<VdL+<VdL+<VdL+F%I>AU%L-BR+Q.EcP`'I16NgAScF!%144#>]k+!E+*6l@:s.UF`(o'De*EB
FE2M8?$g71E+O'1AS-?"$=%1W%13OO>\JD%ATDj'FEMPL@WH$gCM[^&CNDX\EckqE%144#+<VdL
+<VdL+<Y-3Dej2uEbf_ZFE2M8/.Dq/+<VdL+<VdL+<VeGA7f7mFD,T54aVT.%144#+<VdL+<VdL
+<YW6Aoqa/Ch5bVI4Pg7+<VdL+<VdL+<VdL@rH1%EboH-CNDX\EckqE%144#+<VdL+<VdL+<YfI
Ch%C"DfS!MCis;?%144#+<VdL+<VdL+<YK7DJNa#Ci=>WD..'gDKK;<%144#+<VdL+<VdL+<YW6
An#\!A7]dEHS?Qr+>A4l%16?]ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16NgF(KH0ASu.&BR=!'
@<-F)BlJKI2K3a\E,9Z<+>RnX+Dkh1F`SZ[E--L;$=%X`FDPN+B67g6>\.b`EbAs$@sN-;Eb0?&
BRP4`ASli<+=/.LEb0E*DKI">G%G]+F_kk:Ch[cuEt&I]F(KH'Dfor>ATE-=ARfV#D.I3sFD-)L
0RXB;%14C(Eb0<'F<GC.FCf\>Bl7HmGT_*H+E_a:+EV:;ARuuoDesQ5DK?pP+Co%q@<HC.+DGm>
FE_X4$7-g=BPCsi+ED%7F_l/@+DG^9Ci=E:+E(j7G@>Q7ARlp&@:s-oF)YPtAKY])+DbJ(A926h
E+KIc,p5rY<(/hj@:X+qF*&O=Aftf*A7^!.DIIBnF!,LGDBO%>B4Z0uATAn&$7-g,Ec5eU+D>k=
E&oX*GB\6`CghEsGV*EDD/FE5BlnVQDfTJDG%kN3FDl,4@kM_6E'Iqt1a[<-0fLmG%16?_F(K<!
@r#LcAUA9:CijB$Desh2$=%FVCLpprCh7^1ATA4e>]OCnATq^'G%ku8DJ`s&FF/+CASH$mAU&V4
$6UI<>\Re8FE_Y5DesQ5D@Hpq+<VdL+C%0PATMs3DIm<rCh@*lF(Gdf+<Ve3AScF!%144#+<VdL
>X3=@F*)><ARfXpFE2M8%144#+C&Mm%144#+C&u!FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0Q;,^
%144#+C&u!FDPN+B67g6>[q\gF_u#;AT3'E1Gs,nI16N++<VsQ@q]:gB4W2A+EVNEA7]grEb/c(
DKTf*ATAo3Aftf*A7^!.@rH1+D/OD($6UH6>[h8WBl897F_l/6@rH1)I=!bu>?l5\@ruF'DCU!<
Bl7HmG]$r,AURhn$6UH6>]!niCLV4(BR<uY@;BFSE,]B/@psFi>\S(dAU&*$D.S,A%144#+<VdL
+<VdL+<Z#99jqgK<H)ngEarO!AR&qeA7^"'@;TS(,n12(+<Xp2BPDO,@:s.mFEq\6HZ3e0Bl8>.
$6UH6>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$6UH6>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\
+E2.>F!*.h1N7Ga%144#+C&quCghPt$6UH6>\mtn>\S:kD-T>?A9_g1ASliA%144#HX(-"A:&09
CijB$DesKC>\Re8Eb0<6Df0,rDerZsDIm<rCisT4>\._mAR&_]ARTUu@:s.VAncZ&$=%FVCLppr
DffZ(EX`?b$=%FVCLq3tA7]up$4R=k%15is/j;IJIXZ`\De*]nCLp7-/g)WYDe*]nCLnVu/M/)d
@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._67r]S
:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:Ec5e;
%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]LiH$X1B
B-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\+Du+?
DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is/g)8Z
D..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0Gmt*U
67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE@;TRc
@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL+E2IF
F!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeNDfTA2
@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs+D,Y4
D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k+ECn.
B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is/g,7E
B6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K).X`ZR
$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0BFP;M
;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m+E(_(
ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+ED%&
F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;-Qm&B
E$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"EcP`/
F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56Bl5&8
BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A9LUK[
-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*
F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng4ZXr5
E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1Eb0-1
+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?D.7's
ARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX<'a"`
$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl+E(_(
ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!CjB`4
B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(ARfh'
/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'@;]^h
+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\3XlEk
67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2FCfK1F!)SJ+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0qBk([l@ium:B4Z0-
@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9@s)X"DKI!D+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFCf]9Cgh$q+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+EM47
Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9
B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcW?G+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oDdmHm@ruc7+D58-+E(_(ARfh'
+D,Y4D'3:r@r$4+F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'+C]5)F(Jd#@qZu-+<Y`:@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)@r$4++DtV)
AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DK?6o:-pQU+<Y-2F_u1B+<VdL
+<VeIATW'8DK?qCDJ=*5AKYGj@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9@UWb^F`8I@
F_tT!EcW?G+<VdL+<VdL+<Vd9$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'
DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6
+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"
@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,Oq
Bl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is
/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(
ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$
Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8Z
B4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.
F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,
A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+
DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU
+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]Tu
F*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF
+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8Z
Bl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,
Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU
+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*
A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5
FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU
+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJ
FDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu
+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWG
FED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9
$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28
Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,
-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO
@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc
$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#
%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*
$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6
F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,
6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>bu
D.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1Og
BOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2
ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBm
Bl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!
Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,
E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,Lo
ASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*
ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*
DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/
A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]
9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'
@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO
:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*
F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7O>
$;No?+DtV)AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<-S?bh%13OO
:-pQUFE2)4+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,p
A9;j+D*9pc+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0F<G%$@r$4+
+DtV)AKYr#FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#<$l$cFCfK6
FE/f>$4R>;67sa!DId9hE+NotASuU2C2[X)ATMs)E_\qR.V`m4FCfN8ATAo+/M/)[De'u4ATMr9
F(96)E-*4FFD5Q*FD5<-/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0em9O@PK\^-u*[2FCfN8ATB4BDJs_ACi<`mARlot
DKKe>-u!F7A18X;De!3lAISuA67sB80lCoQ0fU:(FCfN8ASu[*Ec5i4ASuT=+Cf(nDJ*Nk+EVNE
@rc-hFCcRCATB=EDImi>+EV19FDtZ0F"&5GDBL?AC2[W3%13OO@rGjn@<6K4-Y[=6A1%fn    ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H?R:+>P'!+>Yu"1E\G1+>t?!2]sh0+>u)"2]st6+?1K#0H`@u1,WN`Bl%<pDe+!4Bl%i5F`V,)
+EVNE@WcC$A0>;uA0>DsF*)G:@Wcd(+A,EtC2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[Wn
Ddm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3Ch\!&Eaa'$
B4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfguGp$^>Df$Uh:IH=<
Ec6)>F)#W(D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7
-u*[2.;Ed3F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FCfN8
ATDO(A0>u*F*&OG@rc:&F<G^JBl%L*Bk;>                                        ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0d&>/3&>;fA8Gt%ATD4$ARK7kA8Gt%ATD4$ARHWpF!+m68g&7uBl%L*Gp%0<EbTK7
+EV:*F<G4-DImisFCfM9.Vrg@ATD4$AL\f3$=n'bF_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+Co1r
FD5Z2@<-W9B6%p5E-!W@$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC8T&W]Eb8`i
AUP!p%17Q5IXWDd+>.COI16NrEc>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A
.![6N$?Kd#C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$@[GQILQVn$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?7"#LO%16KXDe*ZuFCfK$FCei&D..3k
F!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bdDe*E%@;]TuA8bt#D.RU,%172gG]Y'BF<GOC
De!@"F(KDF+A$Yt@<6L4D.RcL%13OO0eOS7Cht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&-s$8O4V8l%htB6%p5E$/\0@s)X"DKKqB?nrib+Co2-E$-N@Ec6)>DIIBn
-X\'*Eb-@tE+*WpDds4`+<Ve:Df'H%FD53#AKYhuEbf3(GA^\7BQS?83\N.$DeO$*@:NnXEbo0%
AM.k3F>%TADIdZq02b5)6qp*&BQS*-,B.(/A8bt!/T"p:CLh@-DCH\;$6UH6FCf]=+D,Y&B5M3t
FE9&W.TC(qF!,1<+EV:.+Dl%<F<GX9EbTH7F!,:5D/"*#FD5Z2+E(j7?tsUjCh\!&Eaa'$?nNo<
$6UH69lG)p+E(j7D0[7:Ec6)>+CoD#F_t]-FE8R5Eb-A2Dfd+=@<--oDg-(O+A!\aD'3n9Dg-#C
%144#+Cf>-G%G]9Bl7Q+FD,6&/g*_t+F.mJ+Cf>,E,Tf/+D5_5F`8I6De!p,ASuU2+E_a:+:SZ#
+<YW3DIdZq+DkP-CLh@-DBNA*A0>8pDe*ZuFCfK$FCei&GA1l0+C\n)@3BB)F<GF=Eb-A9F(Js+
Cb?/(%14mD+@0mj+D5_5F`8I5CghC+>@'-l+DG_8ATDBk@q?csF!+m6F(oK1Ch4_]+Eh=:@UX@m
D'3;(De!Q*FD,*)%144#+DGm>D..I#ARlp-Bln#2@3AfK@8pf?>Te*!@ruF'DBNG-D/E^!A1eun
G[YH'DIj7a+<VeKBPDN1B6%p5E$o]LA8bt#D.RU,+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?m''"
EZee.%144#+D#e+D/a<&/e&.1+<V+#+<VdL+<VdL,p7#4FCf\>F(Jj'Bl@l3%144#+<VdL+<Xp1
F^fE'@ruF'DL5W1AU&<=FF.Y@Dfp#:@;TS(+A$HmATDBk@qC&t$4R=b+<VdL+<VeUIXZ_gHQXqU
I16N++<VdL+<Ve>Ec>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$6UH6
+<VdL+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$6UH6+<VdL+F\cg
IXWC^%13OO2(g"HDf..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5F`8I:ART+\Ea)j+
>p*QnA0>T-%144#+DkP-CLq$!GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+
B-:o++CfP7Cj@.2H[T92$6UH6@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*m
Ch[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.1+<Y',De*ZuFCfK$FCei-F!,.-@:Wqi+Cf>-FCAm$F!+^]
@8pf?>TdNpA7Zm*BOQ!*BlbD6@<--pA0;<g+<VeCBkq9&FD,B0/g(T1%144#+<VdL+<XEG/j)7F
IXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%144#+<VdL+<XEG/j;IJIXZ_g
%13OO>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/I16Mm$=IUeA8Gt%ATD4$
ARHX$F`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=Afs\u>@'$i%13OO<,Wn%
F(HJ%C2[X!Blmp,@<?'g+F.mJ+Dl7BF?0j<%14gB+A$HlFCB!%+A,Et/g+@j:IJJ:BQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>FfA7TUrF"_0;DImisCbKOAA18X8F!+m68g%PQA8c?<%144#
+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABHUMO5tkQ4BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:
05>]FCM>Fo5ti^[%144#+:SZ5/g*`'F*(i,C`l>G6rQl];F<l*+BqH66rQl];F<lY-tm^EE&oX*
GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De*p-F`Lu'.1HV,+<YB>+CT)-
D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+A+pn/mDX;>p)^\+Cf>-FCAm$F!,R<AKVEh+<Ve!
:IH=9Bk)7!Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$
DK?6o+<Ve7C2[X!Blmp,@<?'5?k!Gc+<V+#1G0eKATW'6+CQC9ATDj+Df-\9Aft;s@;]Uo@pLKr
FEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.1HV,+<Yc>@<<W5F`;;<Ecc@F8g&2#DKK<3
+D>J%BP_BqBQRs+B.b<*AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Xlb@;]Uo@j#5hF(Jl)8g%&XDKK<3
+@p3ZBP_BqBQRs+B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC93A3-A05t?;
A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:.3K',+<Ve=DfQt2ATV?pCi_3<$6UH6%14pE
+@:3bCh+YrC2[X!Blmp,@<?'5?m$S"C2[X!Blmp,@<?'g+DGm>@3A/bB6%p5E%W8*:IH=B@;BFq
%144#+A*bt@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs?tsUjCh\!&Eaa'$?m&uu3XlE=+<VdL
+<Vd9$6UH6+<VdL+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdLDe'tP3[\Z\A7T7p+DPh*
+E_d?Ci^sH>9G^EDe't<-OgD*+<VdL+<VeDCi^^HC2[X!Blmp,@<?'.%144#%14sF+AZrfDBO%7
AKXT@6m-#S@ruF'DIIR"ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,
/e&-s$6UH6+<VdL+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1+<V+#2D-+GDdd0!
?tsUjCh\!&Eaa'$/moefAoqU)+DkP&Bl7Q+?tsUjCh\!&Eaa'$?m'0*+Ceht+C\n)Ci<`mARlp"
Bkq8h$6UH6@;^?58g&1bEbTK7/e&.1+<V+#+<VdL+<VdLCi<`m+=CoBA8Gt%ATD4$AL@oo+<V+#
2_H4OATT&'+EqaECM@[!+Co2,ARfh#Ed98[?tsUjCh\!&Eaa'$?m')nDImisFCfM9D..I#A8c[0
+CT.u+C%TK<+T0:+D,>(ATKI5$6UH66#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMt
Eb/a&DfU+GF)Y]#BkD'jA0>?,+CK8%FD>`)Ch\!&Eaa'$/mo+q+<Vd9$6UH6+<VdL+EM+9C2[X!
Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"GB43#+<VdL+<VdLF(KH.De*ZuFCfK$
FCcRB05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU15$6UH6+<VdL+EM+9C2[X!Blmp,@<?''-[p/K
D/^jF+<VdL+<VdL+<Ve%67sBQ+Co%qBl7Km+D,P.A7]e&%144#%15'I+B!?"+CJi&E,961?m'B*
+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%144#+CJi&E,961?m')nDImisFCfM9>YJR*
AQW1[Anc'mF!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<%144#+C%TK<+T0:+D,>(
AKY].+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!+<Vd9$6UH6+<VdL+D5_6Ch[u6-YdR1Ch\!&Eaa'$
-Ql/N/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>%144#%15*J+B<Jo+C%TK<+T0:+EVNE@rH4'Bl%?'
FD,5.Anc'mF!,+,DImisFCeu*@X0)(B6%s-Blkt8+:SZ#+<X-fCh7Z1D..]4@V$[$Ec5H!F)to'
+EqOABHU]%A7fXdFCf])/0J>FASbdsAU%T*DfQt.Cis0&@<?(*?nMlq+<Ve0Dfp(C@q]dp@q?d,
Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De:+lDJ<U!A7ZlnBOPpi@ru:&F"Rn/+<Vdr
DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AKYAQ:IIljFCfK$FCe9hARTFbCh55@
AU%Sl$6UH6Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/e&.1+<V+#<+oi`AKYE%AKZ&4D.Ohp9OUn3
=BltiATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D$4R=s/g*SnBlkJ*8l%iKBlmp,@<?'W
Eb/Zr@VfU.FCf])+EVN2$6UH6@q]:gB4W3-BOr<(F_tT!EZf:4+DG_(AU#>-DesQ5DK@E>$6UH6
<+ohcA7]@]F_l.BBlbD/Dfp(C@Wcc8FD,B0+DkP4+ED%7F_l.B%144#+DG^9Ci=3(+DtV)ATJu7
F`))2DJ()6DeEX'BOu3:+:SZ#+<XX%+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;
@q]:gB4X+5$6UH6%144#+<VdL+<XouAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'
@;TS(>n%,`+<VdL+<Vd9$8O4V?tsUjCh\!&Eaa'$?m'Z6@;p91Ci=3(+EMIDEarZ'@rGmh+Dbb0
ATKIH=)q_gE+s3&+DGm>@rH7,Ec5c1ARl5W+<Ve9Gp$Kr;F+,Q8PMcU?nNR$BOr;sAS,@nCige6
F!*1l0Hak=@<,ddFCfK6/g*Mp@;]^h+EV:2F!,X7Cis;3%144#+DGF1H#IgJ@q]:gB4W2tDf0Y>
DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,p%E,oN"AS#C`A.8kg+<YlBFD)e=BOr<-FE2)5
B-:S`;F+,Q76s=L+EqOABHUhsAmoguF<FgSCh7X/<,ZQ!>]aP%FEDVO4t\H?5(.i3%144#+<V+#
%16<G0jQg_?tsUjCh\!&Eaa'$?m'Z-Cht57F`&=?DBN"pDId[0F!,X;EcYr5DK?q=Afs\g2D-[=
+CT.u+C\o-Df0)<%144#+<VdL<+ohc9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=AftJrDe*ZuFCfK$
FCei&Eb065Bl[c-8g$&F0JO\YDIal!AU/33A1euI%144#+:SZ^?8>eI+AZkt2DcOcBlkJ@ATDj+
Df0V=De:+a+EV:.+EMX5DId0rA0=K19H\%eF*(i,C`mY.+A,Et;bpCk6U`,7@<iu-@;0O1%144#
+<VdL;e9M_>?#9I+A-Q_+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8
A1_b/B4W_@@rH4$ASuTA1,1I3%144#+<VdLAoD]4@;[2rCij6/DIIWu+DG_7FCB!%+Dk\3BQ%E6
+<V+#%16<G1L3$a<+oue+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j+DGF1BlkJ,ARfXqATJu&+D>J,
A9)*r@q@88%13OO>@'-l3Zp^2.VEd?F`8I5CghC+.NiGH+CQBb:IH=<Ec6)>+EqOABHU_+A7]7e
@<,pi+Dbb5F<GL6+DG_8ATDBk@q?)V+<VdL+<Y*1A0>o2Dfd+GDfTB03Zqg%7R9C1=&2^^;d_(f
Ec6)>DIIBn.Ni/;A0>8X:JXqk:JsSZ?n,f0Dfp#:@;TR*/e&.1+<VdL+B!,rF<GdGEb'56@;Kau
G9C:%Ci"-'Aoh?&FDi:6Bl7H(@;Ka&FD,5.GAhM4F!,R<@<<W$ASc:&B-;;7%144#+<VdLFD,5.
B6%p5E%W8#CghC++D5_5F`;CEFEqh>@ps1iGp$pA@:UKpDKKe>Ci<flCh7Z?+CJr&A8Gt%ATD4$
AM.\3F'oFa+<VdL+<YB>+CT.1AU%X#E,9).De:,#+Cf4rF)rI:Ec6)>/e&.1%13OO%13OO%13OO
%13OO%13OO%13OO%13OO%13OO%13OO%13OO                                       ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bnlSmoke0'
zz=:zz,'1 bnlSmoke02 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode0'
zz=:zz,'0 dnlSmoke00 dnlSmokeMacroTexts dpsetSmoke00 edSmoke00 globsSmokeAs'
zz=:zz,'sign000 globsSmokeDD00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00'
zz=:zz,' mnlSmokeArgs00 newdSmokeBadArguments00 odSmoke00 odSmokeArgFail00 '
zz=:zz,'restdSmoke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''               '
zz=:387{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>Y]dDe*p+Deip+ATMs7F)>i2AKZ)+F*)IG/Kf4JEd8d:@<6-m+EV19FE7~>
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
1E\P#-p0UR/mg=U-Qk`Y<(0_W>"'Q$:/+2G9M\/$6V^?F:dIuR;]nG&9h&)J66JWn76smE:JN$#
:dJ&O+@K%"8PMcU+@K4(:eakY2'>=c;D9g`0d&n_;D9m]+@T1+1,1R-83p0F+@nds84HN[+@nds
84Z-H+A#C4:-p'pH:gt$Bl8$(Eb8`iAKXQj8l%isDf9H5+A$lO:IK>IBl8$(Eb8`iAKXT@6rZrX
9N+td6m,)t6rm#M+A>("<)?Ro+A>3i:*<:t9gqEC5uU]):J3Ar0HaOj7j)8L@r#t)D'3;*C`m2)
Cia/rEarc*@WcC$A86$n@rH4'Eb0<5ARlomF_PZ&C2[X)Df9H5@rH4'Eb0<5ARlonBPV9iF(f*$
E$/\1F(KG9A9Da.BOtU_ATAo*DfBE8+D,b4Ci+*.FEo!ACi<d(+D>2)BOYC[CER;!F(f#mBPS`(
@<6+&AT/c*FCT-$E$/n6A8Gt%ATD4$AQDMn+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Df-\4
G&AF>@;BFbF_u(?DIn'7@UX%iF_r7>A0>i"@r#TtE+*6lA8,Oq+E2@4AncL#F_u)2@<6*)E-67F
E-688F!,L7F*(q8Eb0<6A8,Oq+ED%7FE;D0@q?d(ATVC(Bl%<jBl\8;F(KH.De*ZuFCfK$FCcS:
ATMs)DK]`7Df0E'DKI"DE+EC!ASQ-oA8-+,EbT!*FD5Z2-RgSp4?P\X?SNZN+C]5);f-GgAM>k^
@WcC$A7'(iA8Gt%ATD4$AKYH)Bl%<eE-68EATDi7A8lU$FAm$pCLo1R+E(dhD/X3$0JFViATMs(
;f-GgAM>ec.4cl04?G0&0d%hd@WcC$A86$n+DPh*+DPh*A8bp"C2[X!Blmp,@<?''C2[X"@;BEs
C2[X(FDl22+DPh*FCfN8ATB.I/1<V34==l^A92U+CLqU!F*)IN.4cl04?G0&0d%hd8l%iA<CokP
84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+A,Et?Z0CpATDs*A7&ngEc5u>?Z^O7+Abj4<*sBY
A8Gt%ATD4$AKXrJ6r./^:IITH6XO\@+B2-):L?^i6sjeA+C]J-Ch.:!A7TCqFE2))F`_>9DBNV,
F*)>@H"q8.+D>J1FDl2FC2[WnDdso)De*ZuFCfK$FCeftG%kN3?Z]k(+DPh*E+*d(F!,49A8lR(
<HD_lCLqd4+DPh*E,ol/Bl%?'D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*
C2[X(Dfp)1AKYi8C2[X%Ec5Q(Ch4`.Eb]?-A0?2EH>7A/D..-r?Z]k(-RgSp4>J$:3@$@61,CU@
0Jb=<3&WHI3A<EM3?U(21,L[>1,(=;1GLaF1c7!D2BXb/1,L[>1,(=;1GU^@3&iiV0d&5*1,L[>
1,(=;1GCaA3AiTO0d&5*1,CU@0Jb=<3&<?K0JbOD1a"P-1,L[>1,(=;1,q'E2E3]V2BXb/1,CU>
1,ggD1c@<N3AEEL1E\G,1,CU?1GCF<1c[6L0KD'J3?U(21,CU@0Jb=;2D[-H1c.*K3?U(21,L[?
0JP1<1,UjA1-%'K1E\G,1,L[>1,(=<0JG490K1[B2'=Y.1,L[>1,1C>0K:aB2Dm3G1a"P-1,L[>
1,1C;2`WlY2DmKR3$9t11,L[>1,1C;3&<<D1,:dI0d&5*1,CU?1,pmH3AEHP1,:^E2'=Y.1,CU>
0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t11,CU>
0JtI>2).$I0ek[C1*A>+1,CU>0JtI>2).$H3&<<F2]sk01,CU@0Jb=<3&EQR0fUmG2BXb/1,L[>
0JtI?2`NKO0ebI>1a"P-1,CU@0Jb=<3&*EQ1b^gE+>PW+1b^X=3A*0I3&r`O2`<WM+>PW+1b^X<
2(gaF3&`WM1GCXF+>PW+1b^[=0eP@A1Gh*O1,q6K+>PW+1b^X>0eP=D3B&oQ1H%!H+>PW+1b^X>
0eP@<0JPFD1,Lm31,(I>0JbFD/i5FC0f1jH3Ai`<1,(I>0JbFD/i5IG2)@3K3&NQ91,(I>0JkI>
/i5:A3&!'C1,(U/1,(I>0JkI>/i,:?2`39J1GC[/1,(I>0JbL=/i5FA2DI3I3&3E81,(I?0JP=:
/i5@<0JY=@3B/-:0JYI=0etF81bq$M2*!WM1H6L40JYF<1b^^<1G^mC2_d0J0fL410JYI=0etF8
1cR6I0f:^B1,pC30JYI=0etI91c@*C3AEHM0f1".0JYI=0etI92)@3I3ANQR3&Vm70JYI=0etF8
1bq'J2_d'H1E\G,1,CX?1,:I>0fCdH2`<HP2]sk01,CX?1,:I>0fCdH3&*-C3$9t11,CUB1,(=:
3ANHJ3&rZI1a"P-1,CU>1,ggC0fM*O1,:^G+>PW+1GCX>1G1IA2`WZQ0f_6R+>PW+1b^[=1+kCA
1,q6L3B8o=1,(I>0JbCA/iGLB1,:^I1,h!31,(I?0JY=;/i5LC0KD*J0fV!41,(I?0JP=:/i>=<
2_d<L1,(^21,(I>0JkI>/i,F@0JkL>0Jka31,(I>0JkI>/i,:@3AEHK3A`W:1,(I>0JYCC/i5:A
1,UmK1GU^.1,(I?0JY=:/i>IB3&3?M3&if=1,(I?0JY=:/iGRD3&NBE2`!B81,(I?0JY=:/i>OD
3B/iT3&E?41,(I?0JP7=/i>@?2`<?D1cI041,(I>0etL>/i>@=0ebF<3&WZ;1,(I?0JY==/iGL@
0JYL?0f:^/1,(I?0JP7:/iGUF1Gq$M2)$p21,(I>0JkI>/i5OG0JkdD3&N]=1,(I?0JP=:/i5@=
2)[9K0f(^11,(I?0JP=:/i5@>1,:gK2`NN71,(I?0JP=:/i5@<2_[6L1H.$21,(I>0JkI>/i5OD
1H$pC1c@051,(I?0JP=:/i5=C1GLdI3B/o>1,(I>0JYCB/iGOE3&N]N2Dm951,(I>0JbL=/i5CF
0K:aH2`!H:1,(I>0JkI>/i,CB2)mBI0Jt[01,(I?0JY=:/iGIB1GCRE0fUs31,(I?0JP=:/i>=:
0ek@@0JkX01,(I?0JP=;/iGCC0JbUE0f1^01,(I?0JP=;/i,FH3B8uT3B&o?1,(I?0JP=;/i,IC
1,(I=2`EH61,(I>0JbID/ibpH2`NQJ2)R661,(I?0JY=B/i5:@2E!6D2D[661,(I?0JY=B/i5:@
2E!6D2D[661,(I?0JY=B/i5:@2E!6D2D[661,(I?0JY=B/i5:@2E!BI1,L^.1,(I?0JY=B/i5:@
2E!6J1bg+.0JYF<1b^^<1cR<N3&*BI2Du[50JYI=0ebI;2)dKP2`!<L2)ud70JYF<1b^^<1cR3M
3&E<I1a"P-1,L[>0f^jD3&!-E1,^jD2'=Y.1,L[>0JtI?2`N`P1c$gB3$9t11,L[?0JY7<1GCXB
1,_$G2'=Y.1,L[>1,1C>0K;!G0JtU.1,(I?0JP=;/iGCD0JkI=2E*T<1,(I>0JbFD/i5IB0KD-Q
2_[361,(I>0JbFD/i5IG2)@3K3&NQ91,(I>0JkI>/i5=<2D?gD0K(p61,(I?0JP:B/i>OI2`!-J
1,:a11,(I>0JbL=/i5FA2DI3I3&3E81,(I?0JP=:/i5@<0JY=@3B/-:0JYI=0etF81bq$M2*!WM
1H6L40JYF<1b^^<1G^mC2_d0J0fL410JYI=0etI91bgmK1c$g>1,U100JYI=0etI92D?mF1Gq'N
1c6C20JYI=0etI92D?g@1bpdE2E;m80JYI=0etF81bq'J2_d'H1E\G,1,L[>0fL^A2`<TT0etR>
1E\G,1,L[>0fL^A2`<TT0f(R?1*A>+1,CUB1,(=:3ANHJ3&rZI1a"P-1,CU>1,ggC0fM*O1,:^G
+>PW+1GCX>1G1IB1b^U>0f1mK+>PW+1b^[=1G1LB1cR0K1b^aC+>PW+1b^[=3%d3I1GUsI2D@!G
+>PW+1b^[=1G1L=1b^pE2`W`S+>PW+1b^[=1+kFB2DR0G1,_'K+>PW+1GCX>1G1L?0ek[I2_m*F
+>PW+1GCX>1G1I>2*!BM1H@9M+>PW+1GCX>1G1I>2E*?M1,h*G+>PW+1b^[=1G1L=1,1[F0JkI?
+>PW+1b^[=1+kI=2`NZM1b^gI+>PW+1b^[=0eP@?1c[<I2`EQP+>PW+1b^X<2(ga@2`NZT0f^pH
+>PW+1GLX?1+kF=1,1I>0K:sK+>PW+1b^[=1bL[B1,(I@0ekO@+>PW+1b^X<2(gaB3AW?F1,(RG
.4cl01*AJ#1,(I?0JY=</i5=D1c.3I2)RB:1,(I>0JkOB/i5=D1G^pG2E<Z<1,(I>0JkOB/i5=A
1bgd@1cRB91,(I?0JP:B/i>XI1,1I>2`;d60JYI=1,(^@1c-pB2)6sF0K:110JYI=1,(L:2)$dF
1c[EO0JXb+0JYI=1,(O;2Dd6H0f1RA0K1+00JYI=0ekR=1cR6N2E3ZN3&Da50JYF<1bpp@1c6sC
3AEKM0JXb+0JYI=0ek[@2E3ZQ2`WZJ1c$700JYI=1,(^@1cI9J1H%0N0f:(/0JYI=1,(L:2)I0L
1,L^@.4cl01*AM$1,(I>0JbFD/i5CB3&<9K1H?R50JYF<1GUd>1bgsM2)@6L2`Dj70JYI=0etF8
1cR9F1H7-I1bg+.0JYF=1,:U;2)?sG1c%-L3&Vm70JYF<1G^^;1c7*F0fLmK2E)a60JYI=0etI9
1cRBI1H@9P1GU(.0JYI=1,(O;2DI-M2)R'G3&;[40JYF<1GLmB1c.'L1GLjF3?U(21,L[?0JY7;
3AEBN1cR3I0d&5*1,L[?0JY7<3Ar]S1,C[E2]sk01,CX?1,:I>1GLgF1H@<P2BXb/1,CU@1,U[A
0K1aA1H$@20JYI=0etI92)[BL2).*G1cZ[60JYI=1,(^@1c.'M2D[9H1c$R3-p07=1,L[>0f^jD
3ArZP0JYOG2CgaI/iY[E3Ar`T1,CdH2`3EN0e-li1*A;#/1<V9+>Gl%1,(I>0JY=>/i5F?2`3<D
3&Wc>1,(I>0JY=>/i5F?2`3<K3&<E71,(I>0JbC>/iGLC1GC[?1Gq081,(I>0etL>/i>@A1,q3N
0fLp31,(I>0JkI=/iGO@1cI9H3&NZ<1,(I>0JYC>/i>F?2Dd9K0K:s51,(I?0JP7=/i>I>0Jt[H
1H@041,(I>0JYCB/iGRD1,CU>2`Mp80JYF<1b^^<2)[ES2).$G2_cF10JYF=1,:U;2)I0E0f1gH
2`Dj70JYF<1GCX<2Dd0F2)[-K2`Dj70JYI=1,(F82)$^B1,1L=0f1".0JYF=1,:a?1cR?I1c7-J
1H?R50JYF<1,(R<1c7!H1cIBR1GL"-0JYF<1,(R<1c7!H1cR3G2DcO30JYF<1,(R<1c7!H1cR0I
2)cX50JYF=1,:a?1c[9F1c[EN3Ar!80JYI=1,(F82)$dC3&<?N1*A>+1,L[>1,(=<2)$sK1H7?Q
2'=Y.1,L[?0KCaB0fCpJ1bpgC0d&5*1,L[?0KCaB0fCpJ1c[KQ2BXb/1,CU@1,U[B2D@'F1c[BI
2BXb/1,L[>0fL^A2`<TT0etLE0d&5*1,L[?0K1UA0f:aB2)mNR3$9t11,L[?0K:[B2`!BJ1bga>
3?U(21,L[>0JtI?1b^U@1cR9O0d&5*1,L[?0K:[F1,CmG2`!EK1E\G,1,L[?0JtI>0f_!H3AWQJ
3?U(21,CX?1,:I>1cI?I1,([B2'=Y.1,CU@0Jb=;2)@0G1GCgD2'=Y.1,L[?0JY7;2).$K3AE6K
2]sk01,L[?0KCaB2)$gD3A<<E1*A>+1,L[?0KCaB0fCpJ0JPIA2BXb/1,L[?0KCaB0fCpJ0K1gC
+>PW+1b^[=3A*-C2E!HI1Gq*I+>PW+1GLX?2D-gH0ekLF2)RBP+>PW+1b^[=3%d'I2_d9P3A`H5
1,(I?0JP=:/i>L?2`NTQ3&`]D/1<V7.4cl00I\P$4>838-p014/3GT                    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
