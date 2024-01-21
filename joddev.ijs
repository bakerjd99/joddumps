NB. sha256:e9e1a789a25bb01c51342714fedcb64ae44cc25d6db1fa464f3f9f62afa667fa
NB. JOD dictionary dump: 21 Jan 2024 14:53:14
NB. Generated with JOD version; 1.1.0 - dev; 22; 21 Jan 2024 14:38:13
NB. J version: j9.5.1/j64avx2/windows/commercial/www.jsoftware.com/2023-12-20T04:09:52/clang-16-0-6/SLEEF=1
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

ERR213=:'cannot write backup hash file ->'

HASH=:17

HASHFSX=:'jhashes.txt'

HASHHDR=:'--sha256--'

IPYNB=:32

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.0 - dev';22;'21 Jan 2024 14:38:13'

JODVMD=:'1.1.0 - dev';22;'21 Jan 2024 14:38:13'

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
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

packdict=:3 : 0

NB.*packdict v-- pack the current dictionary.
NB.
NB. At  the  end  of  a  successful pack  operation  the  current
NB. directory object is refreshed and subsequent  operations  are
NB. performed on the packed files.
NB.
NB. monad:  packdict clName

NB. object nouns !(*)=. DNAME UF WF

if. (,DNAME) -: ,y do.
  NB. clear current object
  dropall 0
  path=. SYS   NB. object noun !(*)=. SYS

  NB. backup number
  pfn=.backnum 0

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
1,V$61cQU5+?1K!1E\Y"1H-F:+>Yr!2]sn8+?1K!2]st#1,0n1+>Y\o3$:+5+>b2r1E\V!1,U15
+>Z##2'=Y6+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1,g=4+>P_q3?U(6+>Y,q1*A@q
2)6:7+?)2$0fU:42BXb2+>l#!0ea_,0H`4q1,U1/0H`5,+>k8t0H`@u1c6C5+>Yu"3$:%6+?1K!
3?U7'0fU:6+>Ykt0f1"/1E\G/+>c&#2'=b4+>Y,p2BXt%1bg+.+>Pr"3$9t8+>G\q1-$I5+>bks
2'=\4+>GVo1bp1.1a"\2+>PYo1G_@#<(0_W>"*@=C1Ums+EM7CAKYo1FD5Z2+Cf>#AOB3e7RTpG
7r;[UFCfJ8Anc'm+Cf:M+Co1rFD5Z2@<-W9DKTf*ATAo0DeDF49h%rF;GC),@<6O%EZet.Ch4`!
DE8nNBk)7!Df0!(Gp%'7Ea`frFCfK66V^?F<'`if@<6O%EZet.Ch4`!DE8nW@;0U%A8,OqBl@lt
Ed8dL@:F%a6W-?=<(Tk\DdmHm@rri'Eb/[$Bl@l3DfBf4Df-\-De*EI:dJ&OA8,OqBl@ltEd8dH
@<?0*FCAWpAOK?g8PMcUD..['D09\<A8,OqBl@ltEd8dH@<?0*Ch7KsFD+'B9i+P_7l>1&FCfM9
E-67FA8,OqBl@ltEd8dH@<?0*/Kf1WAS-($+EqL1DBNb6@:X(iB-:`-D/^V=@rc:&FE9u=;b1A+
@r$4++D>2)BHV54FD5Z2+Cf>#AOo*c84HN[@UWb^F`8I:@<6*nF!,(/Ch4`1F_56"GXt,!84Z-H
D..I#F!,.-@:Wqi+Dbb0ATJu.DBNCs@r$4++D>2)BHUo$Ch7ZZ:g$O[8p,)uFCfJ8DJsW.@W-1#
+E)4@Bl@l3@rGmh8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9M
BkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQI
Ci<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCn
A9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#
@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'S5uU`Z<E*dCF*&OC@VTIaF<GOFF<GL@FD5Z2
+Cf>#AP>NY:2FKMDBO"=F`Lu'+E)4@Bl@l3@rGmh:-hTC6VKdE;bA0M@;TQu@r,RpF!,C?FD5Z2
+Cf>#AQhYqH>."7F)Q2A@q?d$E-,f4DBNG-A7]4fCi!g,F<GL2C1UmsF!,17+E2IF+Co1rFD5Z2
@<-W9A79Rg@UX=h+C\bhCNXS=Anc'mF(0$'F(Jd#@q]pp@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)
@r$4++DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DKB90Bl%<pDe*?r
D/aN,F)to'@WcC$A9/l%+D,b4Cj@.5Df'H6ATMp(A0=K?6m-;a@:UL&ATMr9F(96)E-,Q3Bl%<p
De*s.DesK)Df'H6ATMp(A7B[qCh.T0@rH4'Eb0<5ARlp,ATDj+Df-\9Afu2/AKXT@6m-SiDesJ;
@r,RpF!,O6EbTK7@q]Xk@<6*mD/`uuARfLs+CoV3E$043EbTK7+D>2)BHU_r@;0V#F<G(3DKKH-
FE:u3F(KH7ATT&*Bk)7!Df0!(Gp%'7Ea`frFCfK6A9Da.BOtU_ATD:$ART[lF!,R<AKYN+D/a*$
Ch4_tDIal6EbTW,F!,.-@:Wqi+DG_*DfT]'FD5Z2AoDX&G\1Z1F*&OCDBNn,FD)e8Eb&a%+Dbb5
F<G:8A7^!tF_kl2Df0ZBEb0?8Ec,q@Ch[s4F!,C5+Co2,ARfh#Ed8dG@VTIaF<GI>F`&=F@;L't
F(]<-@WPsq@;L48ALnsEAT2R.F<G"0A0>r8DfTD3B5DKq@;I'(@;TRsBOPsq@UWb^GB.D>ATJu&
+EV1>F<GX=A7]7ZEZet.Ch4`-AftPk@r$4++D>2)BOu6u@<6*k@q]XfBOt[hF!,.)F(f-++E(j7
@UWb^F`8I8Bl%@%BOPsqEb03!@:O(qE$/h&F(c\:AT2R.FD,c+Ch[iuCh[j0+D>=pA0>;uA0>u&
Bl"o&ASc'tBlmos+Dbb5FE;28A8Gt%ATD4$AQDMnC2[X!Blmp,@<?''G%G]8Bl@l3D..3k+CT.u
+Cno&ASQ-oCh\!&Eaa'$?YEkhBOkOnAT`$0F(eu61,Us4BOPsq+E(j7C2[X!Blmp,@<?''F(96)
E-*43F_PZ6+E)-?A79RkC2[X$DKL#ADBMPI6m-Dc+ED%7F_l.BBlbCO+DGF1F*1u&ATMp)F_i1/
DIakD+E)@8ATE!/F(K*0DFu$pATDj+Df-\8F_tT!Ec#6#ARoq#E+F*.E-!.DBOr;rF`MM6DKI"?
@<?0*@<3Q"+A*bt@rc:&F<G10Ch7NqDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nF)YPtCLh-h
FDtYuCER_4AKYK*EcP`/F<G+.@ruF'DIIR2E,oN%Bm=02D/a/sF(fN5AS,Y$ATJu-@<6*)FDi:4
F_u(?F(96)E--/?F`_\HDfTE1+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF)Z8D
B6/-9DfTE1+Co1rFD5Z2@<-W9B6%p5E-!.1DIal2F_Pr/F)to7@WcC$A7TCpF)to7F"_$DART[l
F!,F1FD,_<F`V,)+C]U=8l%ht@WcC$A0?)7Eb'64ATV[*A8Gt%ATD4$AT2[$E+*cu+A?3CAQU'o
Ec5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh7a.A79RkC2[WnBleB:
Bju4,Bl@m3E+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=3+>P&o2]sk32)ZR31E\D,2DQC01*A;12D\fbBl%<eC2[X!Blmp,@<?'U67s`sF_PZ&?YXLi
Ch\!&Eaa'$+EK+d+C]J-Ch+YsDIal#BleB:Bju4,AKY`+A8Gt%ATD4$AM.\3Et&IO67sAi$;No?
+CfG'@<?'k3Zp131,*WVF>,Q]$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is/g)o'De!lC2'?@N
Bl%<&-u*[2Ch\!&Eaa'$.3N&:A0>DsF*)G:@Wcd(%15is/g)o'De!lC3?T_bDe*ZuFCfK$FCefm
@<6*m@<?('Ebm0I@:Wn[A.8l@67sB90Q(fP0K1+&C2[X!Blmp,@<?'fEc5l<.3N&0A7]9\$;No?
+>PW]ARdDK+=LuCA8Gt%ATD4$AQDMn.3N&0A7]9\$;No?+>PZ^ARdJM+C]J-Ch+Z1Bl.E(D..I#
ARlp%DBNn:F*&ODEc5H!F)u8?%15is/g)o*@;p6B2'?=<C3=T>+EVNEBOPdhCh4`0ART+&Df0B:
+E2IF+Co1rFD5Z2@<-W&$;No?+>P``ARdJN+=M;BFD>`)Ch\!&Eaa'$.3NMHG9D$LATJu)AS,Xo
ARloU+D,P.A7]e&%15is/g)o+C12!72B[-`AKYK$DJ!TqF`M&(+D,P.A7]e&+EVNED..3k+Dl%;
AKYr1Ecb`!Ch4%_%16T`@r,RpF!,RAE,9H&?U6tDC2[X!Bll$h3F=p1-UC$aC2[X!Bll$h3@>qR
+Cf>$Eaa$#+?V#;5s]7(A8Gt%0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$4ZX^6/nA[,+>=63
%17/dEc+$$+=CoBA8Gt%ATD4$AL@oo%159QHZ*F;4$"c<-Y[F/GUFUc3ZpL<HZ*h@.3g3SD.Rr>
.4chhC2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\W_@qHj(ART*l
GB.D>AKZ&-@59\u+EM47GApu3F!,RGFCB$*+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Ch\!&
Eaa'$<_Yt)@:jUmEcZ>C+C\noDfTE1FE/L=DJs_AC2Rs6E,Tf>-OgCl$;No?+DG_7ATDlGEb03+
@:Njk@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e
@;9^k?Q`umF<Dr-:K(5"-S0=KEc)<n-o2u,+>>5e-RU#G$>F*)+>=p$+?hK+9gM-E:L@OFDe*2t
E-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?fDI[iQ3Zotk@s/u*D_;J++<WB]>9J!#Dg-//F)rHO
E-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf"NF*&ODEc5G1FD5T'F*(i-E$0%:F<G^FA79Rk
A1%fnAScF!/g)kX$>"*c/e&.:%13OO:-pQUF`:l"FCcS<D.Fb4-n6Z//g+nIA8Gt%ATD4$AQDMn
%16QT@<?'D3ZohmF*(i-E$-MU.4chh9iNJ_:-pQUFE_;)CER5-EZfI<D.S$3DIj7aC2[X!Blmp,
@<?']9gh-*+<W'\4usfM0mdYRA8Gt%ATD4$AQDMn.6D!L@<?'0+=Jre1+@VoC2[X!Blmp,@<?']
9gfEt-o2u,+>>5e-RT?1BkAt?0H`M$4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCeKI6mj*fD_;J+
+<WB]>9J!#Dg-//F)rHOE-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf4JEcYr5DD#d7CLo,/
@<?''DJsV>F`:l"FCeu1+<V+#AScF!/g)kX$>"*c/e&.:%13OOF)>i<FDuAE+=CW@Bl%<oDJ()8
ATDj+Df-[L4s247C2[X!Blmp,@<?']9gfEt%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!,O6Ec)<n
Eap4r+=D2>+Dt\2-TsLb5snOG?X[\fA7$HlATT%B<)5nX?YXLiCh\!&Eaa'$?Ys=$%13OO-o2u,
+>>5e-RT?1:-pQUF`:l"FCcRn83o!g2BZ[AF(c\)DIal#@<?''-uEmFDKK<$DBO%8D.P.=+Xefh
4Y@jlDe*ZuFCfK$FCefm@<6*m@<?('Ebl0lBOPsq4ZX^,BONYR2B[$O@:UKmBl%>i$>OKiCh\!&
Eaa'$?YEkhBOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=RDe*ZuFCfK$FCefm@<6*m@<?('
Ebl0lBkAt?0H`M$4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm@<6*m@<?('Ebm*GA8a(0$6UHG
+Bot0BQ&*6@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^L@<6*)DJsV>F`:l"FCeu1
+<V+#AScF!/g)kX$>"*c/e&.:%13OO-o2u,+>>5eAnc'm4*+nPD@Hq#Anc'm+EM%5DC7S"+F+D'
BkAt?0HapZ+DGn,AgT\a4?G0&0d't<B4a:Z+=A:\8l%htIS)mn92d2\A8a(0$6UHF+Bot0BQ&*6
@<6K4-Y@:5A7]d0F"&5LDfd+3Df00$B6A6+A3(h\/7W:)Afu,*FEMVA/g(T1ASu$2%16f]/g+b;
G\M5@?YWpjDfp.b/g)QW@:O(o4ZX^#E+*j%?YWpj-[nZR6VC?2-S0=KEc*EU0./2"F(96./13&a
C3(aFA8a(C%144#-urm-A0>JuCh5%<GB.D>AKZ&-Dg-//F)rIBF`\'"+<W'o14(^%DI[c;+Eqj?
FCcS9BQ&*6@<6K4C11UfF"A\<:IIucC2[X!Blmp,@<?'5D.G"'$>"*c/g(T1.1HUn$9g.jDe'u/
Df6b&+>Y-YA1&`I%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZuF>,^8
?O[?OF_PZ&?Z:.0FCfK6:-pQ_@WcC$A7':uFED)7F!,NU/KeMFBl%<&E-68EATDi7F`:l"FCcS.
@<6*)A79Rk/e&._67sAi$;No?+CfG'@<?'k3Zp131,<9\B.u:S$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>P`]E,m]k+CSeqF`VXIFDi:8@;]UlAKZ#)@:V$0DJXS@E-67FA8,OqBl@ltEd8*$
+:SZfDe!TlF)rIGD/a<0@p_Mf6#^sgEcWop3F=p1-UC$aE-68CF"fU7-QlV9@rGq!@<6!&4=<E\
6#^sgEcWop3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\Df7d"+FPkQBk/>?%13OOF(96.4ZX]5E-68E
ATDi>%13OO4tq>%A0<7BFD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,
+EM47GApu3F!,O;@59\u+CSl(ATDj6EZeh&AoD^$F*)FFC2Rs6+DPe4GAqJAF<G[>D.Rd1@;Ts+
-S0=KEc*EU?YEkhBOkOnAT`$0-OgCl$;No?+DG_7ATDlGEb03+@:Njk@WcC$A0>u.D.Oi2FCB$*
+E)-?E,Tf>+E2@>@qB_&DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e@;9^k?Q`umF<Dr-:K(5"-S0=K
Ec)<n%14L>+?CW!.3Kuc+:SZlAhG2[+?^i20RHM[6W-]e@;9^k?Qa<1F<DtoC2Rs6E,Tf>+?M>$
HQ[39Ft"OhI3<E;G!.l//8es@+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>
Eb/Zi05k`EGp"[]E,Tf>+E2@>@j#l-D.Rd1@;Ts+DJsV>F`:l"FCeu1%16Z_F(HsH0b"J$DIb@/
$7QDk%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!,O6Ec)<n%14L>+?CW!.3Kuc%15is/g,:UA79Rk
+B(fs1,Us4BOPsq+CT.u+Cno&AKW*)$><jhBK[sjF(eu;2)ZRtART*lAnc'm%14M)@rcH<-XUOq
F(f)mFCfT8CaUYp3Zoha@<6*DFD5T'F*(i-E$-MU.3L#m+>G<n+<iFZ@rcH<-XUOqF(f)mFCfT8
CaTZ!BkAt?0H`M$4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0-Qlr</e&.1+>G!C+EM47
GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+Eh=:F(oQ1/nAC4AM.Y)F(c\6Dfd+E
E+EC!ARm.t$>"$pAM,)[%16ZaA1e;u.1HUn$9g.jDe'u/Df6b&+>Y-YA1&`I%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eUF`_YF0KD.#%16WbF(KGlD/X3$0JH6g/h1CNF(KGl
D/X3$0JFVk/M/(nA8lU$F=A>%:JsPK9gM]W78crJ<(J-BBk)7!Df0!(Gp$sBG%De<ATMrG%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\,cFCB&t@<,m$8g&1dF)u&6DBO+6Eaj)4.!''5
ChtOC@<Q'nCggdhAISuA67sB'+>G;f-u*[2FCfN8ATB4BBlbD*+Dbt)A0>r'EbTK7%15is/g)8Z
1+=>p8l%iS78m/.BlbD*+Cf>-Anbn#Eb/c(AoDKrATA4e:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?C12!73=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h
-OgCl$;No?+DkP&AKY`+A9;C(FCfJ8Ao_g,+A,Et+Co2-FE2))F`_>9DBNJ(@ruF'DIIR"ATJ:f
:-pQB$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZD/=89-YdR1
FCfN8ATB.-$>aWhA0<77De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]5
5s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mj*P67sBB0d%T667sC+@;TjmEZf:<+:SYe$;No?+>%q>
78m/.;cH%\<.->-$4R>;67sBjEb/[$AKYD(DIn#7F`(o5F_)\+Bk)7!Df0!(Gp!P'@WGmpA8Yt&
4ZX]5D/XT/FCfN8-S-H&A8,RlF_tJoC2[Wi+=ANG$>"6#DIn$&+C]A"DIdWrG<9_ZA8H0o4ZX^#
E+*j%+=DV1:IJ/N;cGCt/7NX.DIdWrG7=lg$;No?+E)41DBNA*A0>r)F<FIM5t"LD9N_f3ATAo3
A0>?%@;]UnATo8$+>Y-YA0<6I%16Ze+CoG4ATT%B;FNl>:JOSd-OgDoEZd.\De'u"Ea`irDIn#$
$4R>;67sC'DK9<$BleB-EZfI;AKYMt@ruF'DIIR2+CT.u+Dl%?AKZ).AKYT!Ch7Z1FDi:1DJsW1
ATAo*DerrqEX`@eEZd.\Eb/lo+C]A"DIdWrG9@>%%16uaGAM2-4ZX^#E+*j%+=DV1:IJ/N;cGDf
ATqs/@j`fO3b2r8DKTf'@;9^k?Q^^D%16r\CLq$jEaN6iDe*2t4Dn_SCi<em$4R=j1E\_$0I\+l
-OgDsAhG2t7TE2T=<J_/+<Y35/g)kk>9J!#ASc0*F(fK9E+*g/+=D#L+=A^YCh.@#@k8u\+=A^X
ATqs/@grcVCia0%AhG2t7TW/V+<Y35/g)kk>9J!#ASc0*F(fK9E+*g/+=D#EG%DdD/8o?8Ci<f7
-QjcfDIn$.Dds4`AScF!/g,4KDg-//F)rHOF`)8CE,]`9FCeu*:K&V`>9GUB%16ZaA1e;u.1HUn
$;No?+ED%+BleB-EZen,@ruF'DIIR2+DG^9DIn#7Ci<flFD5Z2%16Ze+ED%+A0>?%@;]UnATp4R
ATqs/@k8u\-S/_I@;]UnATnRj%15is/g,(OASrW)DBNh.G9C^?@psInDf-!kATAo3A0>?%@;]Un
ATnRj%15is/g+SEFCf<.F<G[D+EM+9+ED%%A1r.IBlmo//Kf+JDfol,+ED%8F`M@BD..L-ATBG7
Bk)7!Df0!(Gp$s<F)>?-@qZ;YDImi2F(fK9E+*g/+CoG4ATT%B;FNl>=&MUh74/NO%15is/g+bE
EarZ'D..L-ATAo4@<?0*Bl8$2+Co1rFD5Z2@<-W9@;]Tu@r-()AISuXEZen3F(KG9-Upm06Ua^8
;cH1`:dJ&O-OgDoEZd.\De't<-OgCl$;No?+ED%3E+No0/Kf+JDfol,+CT)&Dg*=EART+&GB.D>
AKZ&*F:ARgEZf:2+C]A"DIdWrG7=mjEZen3F(KG9-W3B!6s!8X<(//D$4R=O$;No?+>%q>78m/.
;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDF)>i2AN;b2?N                                                         ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o2]sn3+>GYp1GBq+1*AD1@WcC$A7'(iA8Gt%ATD4$AR]drCh+YsDIal#BleB:Bju4,
AKY`+A8Gt%ATD4$AR]drCh-mlF`__:EcY]4Bl%<&E-68EATDi7F`:l"FCcS.@<6*)A79RkA8lU$
FAm$pCLo1R-tI:<ATT@D7ScoL786'H<(0\]5u^AtA8,OqBl@ltEd8dEDg#\7FCfN8         ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fLs40fL42+>G_r1*A>00f:(/0H`+n1,^gD+>P_q1*AP82DQC02BXat0f([H+>G\q1*A;.3&)O1
0d&4o1cI<O+>PVn1*A;+0JXb*0H`+n1,^sF0H`)++>P&r3AEN:1,0n,+>GQ(0Jah2+>P&p2E*Q;
0ea_*+?)8=2BX_/+>P&o2)@060f^@3+>GQ)3?U%8+>P&o1H%$30esk,+>u5;3?U%5+>P&o1G^s^
:IINL8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp+6+A-'[+>PW+1a"M03\`BN2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[1,(I?+>G]61,CsH0FA-o:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f^@K@;[2C
0JYI-0f(jI1HI6E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqg3?Uq&DBL\g1,L+.1HIBO3]/f&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.;+A-'[+>PW+1a"M13]/lX2)#@E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp13+A-'[+>PW+
1a"M.3\`TT2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0ejdn6t(1K3Zp13+A-'[+>PW+1a"M.3]&QP0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp13+A-'[+>PW+1a"M/3]&QP1,TCG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp14+A-'[+>PW+
1a"J43\`HP1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f1!q6t(1K3Zp14+A-'[+>PW+1a"J43\iNQ0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+1a"J43]&NO0K9CH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14+A-'[+>PW+
1a"M,3\W6K1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fL3t6t(1K3Zp14+A-'[+>PW+1a"M-3\r]U2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+A-'[+>PW+1a"M-3]&fW0e`qA$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp14+A-'[+>PW+
1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,'gn6t(1K3Zp14+A-'[+>PW+1a"M/3]/`T1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp14+A-'[+>PW+1a"M03\rHN1bf=E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp14+A-'[+>PW+
1a"M03\r`V0f'//:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU
0f1"F@;[2C0JYI-0f1pH1HI9G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f^@K@;[2C0JYI-0f(jI1HI6F$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f^@K@;[2C0JYI-
0f(jJ2EE]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P='+<X'\FCdKU0f^@K@;[2C0JYI-0f;!L3'&oN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K
3Zp13+A-'[+>PW+1a"M.3]&QP0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh0H`trDBL\g1,L+.1HI?I3\iQ"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nD@;[2C
0JYI-0KD0K1cdHL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>PYo8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+1a"J43]&NO
0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqh0d'(sDBL\g1,L+.0KLmA3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fU$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo
8muT[1,(I?+>GT31cRNN0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp14+A-'[+>PW+1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'(sDBL\g1,L+.
1HIBM3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI0KM$F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C?`M
6sjkAF(KB8ARo.ZEcQ)=F'j$6F>>^K67s`[:IJQ.@WQ+$G%G2kATDg0EcW@E/M/)SF_;h5DeC2$
DIal1ATMg/DKBB1/e&-s$;No?+FA0O@<-HADe:S>@WQ+$G%G29ATDg0EcZX<$4R>;67tA`-o!.n
@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8EbBN3ASuT4-u*[205<?u1ark@:-pQU1-$IO@<*JG
0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-
+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<
Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)+CT/5+Du=<C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"D
DfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$
A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_
+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"%15is/g)8q
+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:B
AS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=@ruF'DIIR2/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"
Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)/KeS<@ruF'DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>
+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1
F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)ATo8;Dfp/9DImlA%15is/g)o0+AH9b+>PW)2'=V1
3\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!>\[\fA8,OqBl@ltEbT*+>]++pD..-r>\[\fDImp,
@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;
67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?
+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!%15is/g*b^
6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"F`Iou:-pQU
AoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u
%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?De3u4DJsV>E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh
+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>
F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A
_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6
ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;%144#+D58-+=D;B-OgF#
R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4
Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpg
FD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB
:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1
%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/Y
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e
$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8+Cei$AKYMt
F)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9+D#S6DfRl]FD,6+AKY].+CQC/Df021F*(i.A8,po
+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9FD,*)%15is/g)9IARfObEb/c(F(9--ATJu&Eb-A2
Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4+:SYe$;No?4[(8N.3N5:GWHrV$4R=O$4R>;67tA`
-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMp
E+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5-ZsNFCi^sH
>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAOEb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG
@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=E--@JB6%p5
E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+E$-NG@;TR'
4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg+DtV)AM,)7$4R>;67tDb-oNLsAncKN+=LlDD..3k
E@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRlBleA=@V'.iEb,[e:-pQU
@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f%13OO:-pQq4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3
Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,Et&IO67sB9
3?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6C2[WkB4W25A92j$F=/1R:-pQU@s)m7+DtV)AIT"+
P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XL
P_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i
@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-
Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%*+<VfdP_(YE0K1[G0ek:;+<VdLifo$R3?TFe
+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(H
P_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$6UH6%13OO+>P&^
C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IF
ifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbX
JDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@
0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1bg*qifo$R3?TFe+<VdL
+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&-QjO,67sC!CER5-EZf14F*)I4$4R=u+DPh*@:s-o
I4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et+CoV3E$043EbTK7F!,('
Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)E--.1$;No?+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^R
Dfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh
1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8XDe(M9De*g-G%>`4E-![LAT089C3(a3$4R=b/hSb/
+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;
Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X
6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT
?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4
F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:
+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC+E_RAF`2A5A.8l@67sBp
DIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB7
3?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F!(o!
D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63-t[U>
@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%F(o9)D.RU,
Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfR37$4R>;67tDb-oi_!AncKN+Dkh;ARlot
DIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'
$4R>;67tA`-o!D)+D#S6DfRl]Ch[cu+Dbb/BlkJ/G[k;rA7]9oCi<`mBl7Q+Derr,8l%htA9Da.
+=L]/BdjJu:-pQU0JjnH@<*JG0JYF,0ebXG1cdEQ%15is/e&._67sBLDJ*[$ANCrK3A*-@0e[9"
1gtQP1,!0HEd)58%15is/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MJq31,i/e2**KN3\WKG@r,Rk
B.Yhp/MJb102kP577KEp%15is/g*i%@WGmtGrd'./i5190F\@a67sBXF<F.C762PH/hen60/bF<
/i4t7/i#%9.1HVZ67sBWCghEtDfT\U+@KXYGA1q;2DbjM:-pQU8T&Tk@;KakE]P=X3A*-2Bl8!6
@;K`h$;No?+A$HlFCB!%:gnHZ3Zp(uF(KB505>E=DIR$iATBG=2Dd(%3A*,t$;No?+@C'bFCA[$
3ZrWjG:mWODe=*8@<,p3@rH2n$4R=b+<X*J?URq2@<ld6FC-a^0K1aF4ZY;V2DcO30I/#?7863X
84c0D-T`\S6;p3X8OOpf-V[$(7:/DT-T`\S6;p3X9L2TV?VWm]741/E;aODL?UdUb;cI+!5tscq
4"!Nr7oE\c6mk&D6Z6jaEa`I"-T`\S6;p3X9g_lX?WK`p-T`\S6;p3X;FNr@?URj@4"!I!6UY9Q
6mk&D79DoF?W0Kk;H."&79EM:4"!`k78.&W7Rg`Q<$saT9gqKE?U[X[7pf4u:dl`n-V[#u9OCL]
<)R($;be]%-VZs-;I;g\;aVoo-UC^1=^O`g-T`\A<)Zq,6q($A-T`\RAT2R.F@0tWAOCKL@<?'K
@<?'.4"!p;E,Tc=6Z6LH9OW!a<H)JWFCcg]-nlo#.6An3<C]#=2)7Ng2)cmE-SR5.0JG=C1G^C?
-S[J62`ETJ0df%17VQaMBI>kh9jr'VCjBnG4!u^:0JG170JOq:-V,sJ2)$C>-nH`E-Rh,)0ek=9
2_Qp?0fL401-.*C3\W6?0JG1'5tr^g-RUu':2b4s6$%*]B5V9k-T`\10/5+80JPO00etdD0KLmA
/het5+@/^L4"!ot-T`\E:,O^Q4"!Hl2)$.N77g5sG:u=,Eb?L]Ebd$a-RUu'-T`\'4!uC;-nlo#
.6An6;)C4)7Q<b<2DQXA-SR5.0JG:?2)6O@-S[J80K(UB0df%16"G6g4"!F)Ec5bA4!u^:0JG17
0JOq:-V,sJ2)$C>-nH`E-Rh,)1G:LB0/>493$9q23\W6K0JG+50JFV89d`"M75[%P4"!rq:`sdi
3Zp_)C`lMqBOu3,;ajM*7<W6[FE8QQ9gKn?DJXSI-T`\40/5+80JPO00etdD0KLmA/het5+@/^L
4"!Bd-T`\E<%p!R4"!Hr0JFV$+@^BiD'2euF_)[^Cis;:4!uC;-RUu'-T`\'4")d.0I](22H3($
7oD96<A6<Y4!u^90JG491bgm94!ua?1c7*G2)-I?-UD9g-T`\H@<?U*ALBPe0JP780JG18-T`\H
0f([@-T`_--W;BA4!ug;1,gjA0JPO00etdD0KLmA/het5+@/^L4"!HS3%$d8;ajM*Eb.9S6#:?[
:NU8]EZe:L:`r2MASuU2+=KrM+E).6Gpt+&-T!J20/>493$9q23\W6K0JG+50JFV89d`"M6V&Rd
-Ugug0IJq078trp+>"^*Ec5e;<-!+m+@9meALBPe-T`\'4!uC;-RUu(0I/>$4!ua_2`<rk1fd.+
1+,.20JG170f1aH0IJq00f:jC0JkC7/e&/8Ch[a#F<G.8Ec5tL+D#e/@s)m-DJ()/Df/uo+>=s"
0JO"DHsn.=H#n(=D'3Y/D/")7G@>P8AU%]rARo@_%17J*+<VdL+<W?]3\W9NC2dU'BIA7$:IJ#W
<^]q^:fB#V@qdQ0C3(a3$@H&02Dnb_06M>IEcWmKDeO#t@;BFp05>E905>E9E,p,4F_u)=04JF*
/no'A%13OO:-pQq4X`$>.3N2BEc5tZ+CT+rBkM@,F!,CDFDuAE+D,P4+DkP&AKW@BBPDO*@;TR'
%15is/g)o,+@0se+>PW+1E\D03]&iX0K0FJ:-pQB$;No?+@U0\Bl7KC+DNnh2(gR7@V'Xi0e[9"
1gtQP1,!icDId[0Et&IO67sBIF_PZ&3ZqpND/Ej)@qf@f0/>4:1G(:;/M](\0f;!H2``ZK04Sg,
DJ(OU2(^L62_S*'77B[/0b"Ib67sBSBju*kEd9\g3A*0A0b"Ib67sBXF<F.C762PH/hen60/bF<
/i4t7/i#%9.1HVZ67sBWCghEtDfT\U+BN8p+>u%c$;No?+A$HlFCB!%ATBgSC,mn(+DG_7FCB!%
%15is/g*`'F*(i,Cf"P^BK@8G3\P5+1bUjA2%9mf67sBJDf0Z*@rsaSGB\6`C3+<*FE_/6AM.J2
D%-g]$>j3eAKW@BBPDO*@;TR'+AP6U+CoD%F)E@I+CT5.ARTU%FDi:4D]iJ+H$!_6DJ(($$;No?
+DGpFF!,@=F<G(0ARTU%GA(Q.AKZ).AKYo6FDuAE/0JY=+CT/5/0JSDATKI5$4R=O$4R>;67sC-
ASu$1De:S>@WQ+$G%G29ATDg0EcZX<$;aMs<*sBYA8Gt%ATD4$AMPtI:-pR0:K(5"C2[X!Blmp,
@<?''E,Tf>+E2@>@qB_&DfQsK/M8J83XQ48D/XQ=E-67F8Oc!576N[S-nlc)+>>5O:-pQU-u*[2
Ch\!&Eaa'$.3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1b^X=2ek'%1,^pF$;No?+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!
FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?F(f-$C`m\*FD)"V67sBmDfT]/Amo1\FCf\>+<Ve%67sBm
DfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA9/)Q67sBnEc>i/
F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6K:-pQUBkCd`ATMEmFD5Z2+<VdL
:-pQUBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE($;No?+DGFt+<VdL+<VdL+<VdL+AP6U
+D,P4D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G]X9f67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02u
Eb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m$;No?
+E_mE@<?(*Ao`*6Eb'56+AP6U+E_RGEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6
Eb'564$"a5AKZ2;@;m?3B5Di@$;No?+EqaEA8Gt%+<VdL+<VdL+AP6U+DkP&AKYetFCf\>Ao_g,
+EqaEA0>]&F*&NQGps(L$4:9]@s)g4ASuT4-XpM*AL@gpDeX*1ATDl8+=CT4De*ZuFCfK$FCcg,
$7I\Q3Zp+*+=ANDFE2XZ$;No?+E_a:+CT/5+E1b,A8bs#F(KG9Bl5&8BOr;Y:IH=EEc5Q(Ch4`$
DfQtBBPDN1D.-pfBl7JhBkAt?G@c#+@;9^k?Q_HY:f9_O78d#P6r60E6r-0WBkhQs?RHt,D_<.>
+<XWS8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+Abs)7R^3Q779s<:..lF?YO7nA7#[TCia/?$6UI4
D/XQ=E-67F-W!]07R^3Q779s<:..lF?YO7nA7$HsDfd+CATT:,ASu$2$>F*)+=f&t5U\"!@;]Uo
@j`Tl/h%o^@;^7"E]l#t4"u"(4?G0&1*C[TAfrLCBOu!r+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$
?S!QI/M2-WEcYr5DC6kU/M8/5;BTLg/d`^DF)>i<FDuAE+=D;QBl7Q+FD,B0+E1b,A8bs=+=A^>
84c`V5u'gD6XO8:De*ZuFCfK$FCeed+<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,A8bs#E+*j%
+DGF1@s)g4ASuT4G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^\+<Y`BDfp/@
F`\`RBl5&9DJ=><F(f-$Ci^_@Ed8dKARTUhBPD?s+EqOABK@8[BOu3q+E1b,A8bs*$>"*c/dc)s
FCSu:$6UI4D/XQ=E-67F-Ugp2:Js4rE+*WpDdso-Dfd+CATT%H+CSeqF`VXI<(KSZ:dIiE:IAJt
C2[X!Blmp,@<?'f-OOF&A1e3<$<0eh:L?^i6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0
De*L$@;omo@rj;FDe*cnC2[W8E,K;;+CIf;6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&
ATD?m+Cf(nDJ*O%+D,P4+CIf;6psg<?nMlq<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-
G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F))3l@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5
FE9&D$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dUAT;C$B5D!:FYRuMG&h=PBP9,E1cB5p?Tqj?
8T#YmBOr;qF_PZ&Bl7Q+8l%ht@;p0sDIdI++Cf5!@<-10+D#e:Cgh$q+D>\;+EVNEEcl7B?uon$
@WcC$A7TCpF'pUC8K_bjF*&OGE+Np/+CQC)ATnRj+<Ve?Dfp)A+Co%mF_>?$DJ()#+D,b4C`m20
Bl%<&Bl5&%+Dtb7+D#G6Bl\-0D.RU,+E).6Gp%3I+Co2-@rHO%EZdprF)Pl<ARlp*BPDN1E,ol+
Ch7Gm$6UH6H"CE)F!+n(D]j7<FD)e=BPDN1G%G]'/e&-s$8O4V?p%dMDJ"!!DeO/F20iq_2)[F5
1it]:G\AmV?Tqj?<H)JWFCcS:BOr;oA79RgFEqh:?m'W(Eag/5D]ib3@r-9uAKZ).AKYl%G9CdG
D.Ra%@j#l=E+O)5Bl8$5De+!#ARlp-Bln#28g$,H2@U!&$8X:W?p%e)2f*OjG]ReJGW9kc3&u7A
Des8GFYIJd?Tqj?;It#cF(HJ9BOr;sBl[cpFDl2F+CT.u+C]&&@<-W9Anc'mF!,O8@ruF'DK?qE
BOu'(FD,5.BOPsq+EM7-ARf.h+D,>(AKY].+CSekARmD&$4R>!/g+Oa?Xks:@UrnYBk]8DAnuO3
Ap&!'E&MWDCboE^?m&?YG%l#/+CJYrCg\e:?ufh"FC\c%F(Jj'Bl@m1+EVNEBl%U.F*)G2FCcS;
F(HJ4AftbqF(c\;Bk1db@<*t0$4R>"/g+Oa?Y*tuCiF#BC3F&u@<Z4&DIR`CD(me+2g/Ol?m%gT
DKBN&ATAo-D/aN6G%ki,+D,P0F<Gd=BkM+$F!,17+E2@8DKKH#+CoD#F_t]-FE9&W<+ohcAoDR/
+E_a:A.8kg+<Y97EZfFAF`Lu'+Cf>#AKYK$F_kS2@V$Zj+Dbb6FDPM2@W-'nATAnF+D#V5ARfF_
Ci"A>FD,5.@rH1%Eb/c(FCf]=F"Rn/%15!G+CI<=A9hj/EcO*Y@V@SRF)#MMF)uRdBl[iq3+"jW
+@op]D/X<+H=\4/De*E%@rH1%EcW@3DIal%Df0Z<+CSc#Df]tB?u0n+Ch[s4Bl7R)?m&lqA0>9!
@;]Uo@pgF#H#@_4GT^L7Ci=?.DJ(R2$6UH66ZmEiASuU+Gp%3BATME*E+*6l@:s.m+E_a:+Co1u
An?!oDKI"5Df0Z<+CT.u+Cf>+DfTnO%13OO2_H4\4C:!e0KEu1DK0?912UGY20<qbG\D,7@VBag
5%#L2AThd!G9CR;G9D!G+D,b4Cj@.7D.7'e+CT)&+ED%*ATD@"@qB0nAoDR/F!,17+E2@8DKI!t
6q25M%13OO3%c<r?p%dSCM%="@W6L"2JHrJH=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+
@3BH!G9C=5E+NotBm:bBD]iG&De(J>A7f3lA7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU
%13OO?s@2[A1_nAA8ba]%16'16r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgiDe(J>
DJ(C@?qO3_?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-
$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_F)to6
/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5
CG$&'6?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdk
ATKI5$:/KLD_*#OART*l>@;,YF*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9Dfd+9
D/a<&D.RU,ARm8C+Acl_DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI@V'1d
DCosKA8ba]%13OO0eOSV4C:''A2%nDA9]hG11tMb2g.$&0Q_S#AnuWu5%#L#Df0W1A7]d(@:Wn_
DJ()#+D,P4D..O#DJ()1E-,f4DBO%>+CK%pCLplrFD,*)+D58'ATD4$ATJ:f+<Ve;Bl[cpF<G+*
Anc-sFD5Z2+D,P4D0$hDBOu'(D..3oDJ()5@rc:&FE9&W<+ohcA8-'q@rri(AS,XoBln'-DBNP0
Ebu6m+<Ve@F!,=<Eb-A)Ch76fDKI"0DIal'@<3Q5BOr<(Bk(]sAn>CmF`M%9De:+9A7]b'Dff]2
B-JI>Bl7R"AKYf'DIjr%G]7J5@qg%+/0JLVB.aW#+<VeUIXZ_T$6UH6:-pQUEHQ2AARlp)FCB&t
@<,m$AU&01Bk(k!%144#+EDOHA7]763Zp4$3ZoeU?mncM9MA/H;G/3@.6oL6-nJ7p<_cXg9IV;?
3[m``0H`J>/mg@\/j:C?4"akq+F,=D$6UH6:-pQUA7QfpDfT\($6UH6EcZD7ARf7]4ZX^4HQZU%
-r*c99MIfN9-R^l5V=H5/5fDI:/st].4-W-.82cV+?V_<?SWr\4s2sL/mg@VGp%N`%144#+F\cg
ILQW,+<XWsAKYK$DK]T3F(oQ1+D,Y4D'3nA@;]UaEb$;(G]7J5G\M7BFDi:4A0>T-+EMXF@;0@f
FCoH3G@>N&+CT=6Ci=3(%144#+CT=6FD,5.A7]@eDJ=3,Df-\.De3u4DJsV>F`V+:@;^?5De:+a
-Z^DNATMF'G%G2,@<-"'D.RU,+DtV)ATKC3$6UH6@!*T8+Di6=?nNQE5p0ZN@;]^h+Dbb-AKZ).
BlbD@Dfol,+CT)-D]ib2E+*6u+CJr&A8Gt%ATD4$ARHWiF`\'"+<VeFG%G]&Cht5<Dfol,+DkP&
AKXSf@rGmh+Dtn'ATAo8D]ik7DegJ0F=n"0%14jC+CI<=AT;3pFDk`!0kkfWCGTQWCH$&cGqs8G
G$dF@+@C'bF(o/rEZee$A8,po+CQC1ATnRj+<Ve7A8lU$FC650E-,f4DBN=V:JsPK9gM]W78crJ
<(LC>FD,*)+EqO9C`mG0C1Ums+EV:.+CfP7Eb0-1%144#+DkP.FCfJ8Anc'm+E1b2BHV#,FDi:1
+Co1rFD5Z2@<-WG+B3#gF!,C?FD5Z2+EqaHCh+YsCij6/+D,>(ATJu9BOQ!*@<,og$6UH6F(KG9
;FNl>:JOSd+DG^98l%i-+B*2qATVU"DJ()6BOQ!*8K`(rEbT].+AP^3+B2,Z6r+q7F`\a?DBO%7
BlbD,@<6!&Blk_D%144#+D#8/BOu3,GB.D>AKYD(An?0/@X3',F!,RC+CQC)Bl%?'A7]7e@<,pi
+AtWo6r-QO=WhX'+ED%&F_PZ&+EV:.+Co1rFD5Z2@<-W&$6UH6Ao_g,+CQC'F_u(M+B3#c+DkP$
DBO(CAKZ28F_kS2@V$[(D]in*CLnW&F<G.'F(o3++EVNED/XT/+Co1rFD5Z2@<-W9A8-'q@ruX0
Bk;>p$6UH6@<-:/DIb@B6ZmEiASuU+Gp#^T6m-M]D.RQnATDi7GA(Q.AKZ).Bl7R)+CT;%+CT.u
+EqL5DIml3BkAK0BOuH3B5\o0Ble?0DJ(R2$6UH6IXZ`p%144#+AP6U+ED%4CgggbF!,R<AKYr7
F<G+.@ruF'DIIR"ATJu5@<?0*GA2/4+CfP7Eb0-1Cj@.AE+No0D..L-ATAo4@<?/l$6UH6A8lU$
F<Dr#:JsPK9gM]W78crJ<(JAG$6UH6IXZ`p%13OO1G0eX4C;Q6H>7A92Kh&l1Lam71cB,/GAMSJ
H8dZf5%#L#Df0W1A7]d(AU&<.DIdI!B-:T&ATMs(?m'Q0+ED%8DfTD3E+*d/Bk):%@<*K"@:O(q
E-!W@$6UH66ZmEiASuU+Gp$gC+ED%7FDl22F!,R<AKYi.F*&OFARf:hF<G%$@r$4+/g*GrF)NTP
@rH7+Bk1dq+Cf(r@r#drB-;;0AKYYpF(f-+%144#+CoV8Bl7Q+Eb0<6DfTDA+A!]"Bl%T.E,ol+
@:F%u+CT)&Dg*=;@<6*)AmoCiF`M%9FDi:BATMs3Eb-A&F`\aKF(KB5+EM47F_kS2CMn'7%144#
+EMI<ATVU"DJ()*@<3Q#AS#a%F(96%GA1r-+EqOABHVD1ASH0-@UWb^F`;CS%144#+F\cgILQW,
+<XEG/g,1GF*)>@AKYGj@r$4++>bh_$6UH6Eb0<6A0<7/BlmiuAmo1\-Ta.?%144#+AP6U+ED%7
FDl22+C\bhCNXS=1bp1fB5VX.Bl7Q+BOPsq+Dkh6D..NrBOu5o$6UH6Eb0<6A0<7/BlmiuAmo1\
-Ta.?+>Gea$6UH6IXZ`p%13OO1bKnY4C9mREB/2&H#n'`EHO'Z2DTSm@r,j72eR;@5%#L.ATo87
F_t]1Bk&8r@<>q"H#R>9+CT.u+CQC&Df0`0EcYr5DBO(DBl%L*Gp$L)/mof1Eb-A&ASH$p%144#
+CSekARlotDBMOo3A*34-o*J31hpH:0JY("G@_n7Dg*=;@<Q2k$6UH6?nZ53FCf)rE\T4]DKKH&
ATBOZBl8$(B4Z*?04o$=@<?4$B/2,PCi<a(Bl7Q?04o$=@<?4$B/);P+EqL1DIn!&EZfI;ATD?)
@<,og$6UH6@q]:gB4Z-,FDi:2Bl7@"Gp$g=FCfK1@;L!-BlkJ3D/`onFE8Qs:IHfX+A!r(AKYDt
Eb/ZiGp$d7F<G!7@rH7.ATDj+Df-\:Eb/`pF(oQ1+D#S6DfRH>$6UH6<+ohcF(KB+@;I&sF_u(?
AoD^,@<<W7F*1o-Cj@.IDfTW7+D5V,DJ()(DfU&1Eb$;%F`\`t+CT+0@rH6pATD["A0>;iDfp.E
@rc-hFD5W*%144#+CoV3E$043EbTK7F!,R<@<<W9Bl%T.DJsV>Ci<`m+DG^9DerrqEZdssG%G]8
Bl@m1/g+50Cht5-@<Q3)FDi:4AThd/AKZ&4D.Oi2@q]FjAISth+<YcE+Cf>/AM+E!%14sF+CI<=
3GW@cDe:eFF_WiqDg5i1CGdq\CG9mA11*4Q+@C'bF(o/rEZee$A8,po+CQC+@<6*)F(o/r@psC#
Anc'm+EVNE@VK^gEd8d:@:O(qE-!W@$6UH6;e^J!DKTf*ATD?m+CHZOBkh6f+D,>(ATJu&Eb-A'
Eb/[$ARlomGp$N<@UWb^F`8rU<+oig+EM47F_kS2DIn!&EZeh&+CT).ATD?m+C]U=8l%ha$6UH6
@:s"_DBNA*A0>>mBl7Q+@UWb^F`;CEBl8$(B6%^.Gp$gB+CfG+FD55nCb?i0BOr<-Bk1db@<*K&
Bl%?'GAhV?A0>>m+EM76E,9).FCf]=+D,>(AISth+<YlBFD)dq83ng_2)ZRj@<6*nF"AGJ/nHXE
$6UH6IXZ`p%144#+>big@q]:lBOu6;FEhm:$6UH6:-pQU@rGmh+>GetDf-\,DJUG;ATMs7+EV:.
+C\bhCNXT;+CSnkBl8!6+D>2)BOu5o$6UH60fL4aDJUFC/gh)8+<VeUIXZ_T$4R>#/g+Oa?T3:E
1H0)0CM[`CGAC`.C,@VRH?4(DD)bld?m%gTDKBN&ATAo%A7TClB-:V*BOPsq+E(_(ARfg)Amo1`
Ch\!:+EV:*F<GdACht58FDl22+CQBk83ng_2)ZRj@<6*)GA(Q*+E2IFFD5W*%144#+E(_(ARfh'
/g*_.@;R-/BPD@"Bl7Q+@;^"*BOu3,DfBf4Df-\-De*E%?njTJ+EV:*F<GdGF_kS2D.R-n+EMXC
Eb-A%+D>2)BHV52%144#+CK/2FC650EZfI8F*&O5+D>2)BHV52+CJhnFC5Ob+<VeUIXZ_T$6UH6
+AP6U+EqaEA0>T-+E2IF+CT.u+CQC+@<6*)BlbD<FDl22A0>T(+CQC5ATMF'G%G2,F)5c:/e&.1
+<Vd\+>GetE-67F-[0KLA1%fn+<VdL:-pQUBOPsq+DGm>@rH4'@<,pi+EVNEG%#30AKZ#)FE2),
G%G2,/KeVFEc5t@BkAK)@<?!m+D,%rCi_3<$6UH6+>=om2]uaEF<DrTDfTA9%144#+F\cgILQVn
$9'R[?p%e*DffhPF>A#MFE]ZXFCd@GCO(2>0JPD-?Tqj?8ge[&Anc'm+Eh=:@WNZ/@<iu/@;]^#
GA(Q*+CSbiATMp,DJ()9Bl7I"GB4m=Bl%@%+E)-?A9)C-ATJu&@q0(kF(Jl)@X/Ci+<Ve-:ei-C
Df0H(@ruF'DK?qEBOu'(<_uO6BlbD8AnEY<<+oi`ALDOADJsV>D09?%+A,Et+Ceht+CoC5AoD]4
D..C&ARlo3Ch7^1ATB/0A17rp+<Ve;EbT].F!+q7F<Ft'AU%p1FC65&G%GQ5F^]*&Gp%-=FEMVA
F!*.ZAoD]4<_uO6F(f!&ATJu1Bkq9@%144#+F\cgILQW,+<Ve=AU%p1F<Dqa05>*?A7]p<1bWo`
@<,q#05>E905>E905>]LEb'5DBkh6-%144#+F\cgILQW,+<X9P6m,uXF_kS2A8`T!+E;O<@r!2u
G\M5@ASu!h+Cf(r@r!3*DBO.;DId[0F!,OLF*(u1F!,[?ASrW)F<GX9ATJu:DJ`g$E+NPh$6UH6
F(f!&ATJu%0/%BbD.PAABOPpm04eg105>]LEb'5DBkh6f/g)99BPDN1GA1l0+Du+>+D>>&E$/b2
EZeCZ:*=C^E,]B!+CoM,G%G_($6UH6GA(Q*+BD<6+DGm>De<T6%13OO3%c=]4C9m!F?!fLApA-;
E-6;3Ao)O4DfI]q1iRD@5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BEDIal+Bl8'</g+,;
ART?sBkAK*AS#C`A1e;u%15*J+<Y&S?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?
AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=
D0%<P9OVCO+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R=s0J4Ij+CI<=2JZo>
Ddm[/@Q%q9F*_JFEA;;jF?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0
C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$8F7f+<Ve74C;VRA9;F!
A2,odE-?&+FDbT%12pYZBQnB%5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%
Bm:b=DBNe)@o$#G@;]Tu9PJBeGT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2
+E)-?FD,6,AKZ&>F*(u1F!,1<+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16Qe
Bl%<pDe*BmF*)G:@Wcd,Df.<b:-pQ_@WcC$A86$nA8-+,EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#S
F*)G:@Wcd,Df-\,F_PZ&/e&-s$;No?+CfG'@<?''FCf<.DfT9,Gp%<LEbfB,B-;#/@ps1b%16T`
@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K@WcC$
A2uY1-QlV9@rGq!@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G
@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(I4cXQ
Bk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]Bl%<&
F`_>6Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44
Ch.:!A1%fn%15is/g,4HF<G+.F*)G:@Wcd,Df-\.Bl[cpFDl26ATJ:fC1LjhE]lH+-V@0&6r-0<
8Q$[':IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?6q0R9;BSS-
6rR&N7n#gA6UXLD-OgDtA7TCp4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-
6rQHN8PiAS8Q$[':IIWR<)Z1V;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<jBl\8;0F\?u$;No?+D58'
ATD4$AKYMtF*)G:@Wcd,Df-\=@rc:&FE7luF`:l"FCf3*A8PamBkCptF<E7H$;+)^<_Yt)@WcC$
A86$n@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::;aXGS:fKhS
;@Nt*:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:IIWR<)Z1V
;EIKH6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q779^F4%`::
7nHZJ8Q%WB:IITH6UXLD%15^'6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C
6qL8c$;+)^<_Yt)Eb0&u@<6!pDe't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA
6UXLD4%`::7nHZJ:I@NA;@NsB$;No?+Co&)FE2;F+C]J-Ch+Z)De!3lAISuVDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16c_F*)>@H"q8.1,fXLB4Ysl
Ea`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=)
,9S]n0eP.&/KeS8Fs&2WBlGL1$4R=b.Ni+m76s[V+CT.u+CJAE7pmHV@:O=r+E)4@Bl@l3@rGmh
F!+n%A7]:(%13OO+=\LAA8lU$FC655@;BFq+CQC1ATo88E-,f4DBN=V:JsPK9gM]W78crJ<(LC>
FD,*)+D,P4@qB^(FD,5.%144#+<YW3FD)e2DBO%7AKYhuF*(u6+D,>(AKY])FDi:DBOr<*F`\a:
Bk)7!Df0!(Gp$[AASqqa+<VdLBkAK0BOr<*F`\a:Bk)7!Df0!(Gp$gB+CJ)95t"LD9NbaU+B3#c
+DkP$DBO(CAKYo'%144#+<Y&]:JsPK9gM]W78crJ<(LC>BlbD=D]j(3F(KG9FD,5.Bl8$(Ec,<%
+E1b2BQG;1DBN=b76s=;:/"eu%144#+<Y3/@ruF'DIIR"ATJu9BOQ!*BOQ'q+C\nnDBNe7G%G2:
+@0U]ATAo*DfT?%DJ()2@<?1(+:SZ#+<VeKBOr;sBk)7!Df0!(Gp$sHF*&O6AKYK!Df]K#+CT.u
+ED%3E+NouA1e;u+:SZ#.Nfj4Bk1db@<*K&Bl%@%+E(j7;b02+1,Us4BOPsqATJu&Eb-A2Dg*=J
EbTW;ASrW$F`M26B-7Wj+<VdL@UWb^F`8I2E+*6lA7-NuE+O&uFD5Z2F"SRX7W3;i@UWb^F`8H[
1*C[PAKYT!Ch4`'F!+jI12:K2F(f-+/p)>[?k!GP$6Uf@+@.,fATo8)@W$!i+E)4@Bl@l3BOPs)
@V'+g+DG\3Ch7HpDKKH#+EVNE@q]F`CER(p@r$4++D,>(ATJ:f+<VdL@:s"_DKBnBFD,5.BOPsq
ATJu8FDl22A0>T(+EV:.+EM7-ARf.h+D,>(AM+E!%144#+<VdL+<Vd]2]uRIC`k)X-OgCl$4R=e
,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\LA
DIn$&?m'?*G9D!9CLqQ0?t=4tATT%B;FOPN8PVQA741/O?m&lqA0>8jE-#T4+=BHR6V0j/2((I?
?m&m!+Co%q@<HC.Et&I!+<VeNBOu'(@rc-hFD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/%144-+<Wrm
DIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)+C\nnDBN@uA7]9oFDi:0C2[X%@<-4+/no'A?nNR$
BOr;sAS,@nCig*n+<VdLBlbCO/0K%WEc*"<AnE00Bln#20J4JLBOu'(0d'mI;b02+1,Us4BOPsq
+DGm>E,oN%Bm=3"+EVNEFD,5.F*(i2F<GL6+CoV3E"*-s+<VeJ@rc:&FE9&W<+ohcAoDL%Dg,o5
B-;;-F*)IGAoD]4A9Da.+EM%5BlJ/:Bl8$(B6%^.GrcBA%144#+<VdL+<Ve:BPV9iF(f*$E*m$g
De*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKDF!hD(%144-+<WrmDIn#7D.-pp
D]j%B@;KXiBk;<-?qF0t:-r>2@rGmh+D>2)+C\nnDBN@uA7]9oAoD]48p,)uFCfJ8DJsW.@W-1#
F"SS1DffQ"Df9D6Anc'mEt&I!+<Ve:@;[2sAKZ&9DfTE"+CT=68l%htD.-ppDf[%FBln#L%144#
+<VdL+<V+#+<VdL+<VdL+AP6U+ED%%A0>c.FCep"DegJ(DIal2FDl22%144#+<VdL+<Ve@E-Z>1
4ZX^.FCmKTEb/Zi+=D&FFCep"Degt>E-Z>1-OgD*+<VdL+<VdL1a$a[F<DrKDffQ"Df9DuBlJ?8
@OF6/:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV<+ohcE-67FA8,OqBl@ltEd8dH@<?0*BlbD7Dg*=<
DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et%144#+<Y3;D/aPK+@^9i+D#e+D/a<&+EV:.+CJr&
A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D%143e$6UH6+<VdL+<Wa,-YdR1A7]p,C2[W*F`_>6
F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>E,oN5BlA-8Cj@.EBQ&*4/g(T1%144-+<Wrm@Wc<+
Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen51FXG[@<3Q#AS#a%@rHC.ARfgnA1euj+Co%q@<HC.
%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfguGp%0>F<GC2@:X(iB-;;7+CHlG2E!H9E-67F-RX+V
Eb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL+<Vd9$4R=e,9n<c/hen51a#8!@WHU"Ed8c_3%Q1-
0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn$6Uf@8g$,H0JjnmAStpnARlp*D]hXp3A*-2@;]Tu
FD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:gB4YTrFD,B0%144#+ED%5F_Pl-A0>;'@q]:gB4W3-
D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.@<?4$B-;A/EcYr5DBNh>D.7's/e&-s$6Uf@?pmgb
8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnBAfuA;FWbR5ARlp#DfTD3FD,*#+>u&!A8,OqBl@lt
EbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=FWb+5AKYN%Bl7Q+F)Po,FD,B+B-;D=Df022+:SYe
$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`CER)#DIIR2+Cf>,E+*j&@VKXmFEnu\+Dkh6F(Jl)
FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO,9nEU0eP.41,C%F@;^3rEd8c_2Cot+0JYF,-q@id
A7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:/hf+0F!,UHAKYo'+Bq?1:gGJ_FEDJC3\N.!D/a<*
@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7%144#+D>2)+DG_8Ec5K2@qB0n
@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+)@;]TuE,oZ2EZfO:EcYr5DK?q=
Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7Bl5&(Bk)7!Df0!(
Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7+<Y0&DBNt2@:UL!Ch.*t+D#e>ASu$iA0>T(FCf)r
EcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.DId<h+DG_8AS5RpF!,RC+CJqrBl%@%?k!Gc+<Y04
D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3@:UKsDf03!EZfI;ASj%B<+oue+Eh=:F(oQ1+CSek
F!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKqF'p,!DIaktA8lU$FC655D]j">AThX&F<G[=AKYi(
F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9A79Rg+DG^9A8,OqBl@ltEbT*+/e&-s$6UH6=$]_Z
8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8Bl@l3De:+a:IH=GATMF)+F.mJEZdtM6m->TF*(u6
+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$4R=b+<VdL+<Ve%67sBi@:O(q
E$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++CT.u+EM4=F<F0uA8c[0%144#
+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9
Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6+<VdL+AP6U+ED%7FCB33+A*bbDIal$Eaa$#+EV:.
+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\7@<6O%E\;'@
Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A1hS2DC5l#%144#
+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++E1b7Bl7Q+@<?U&DKKT2
DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$s8F)tc&ATJ:f+<VdL
+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL+<VdL0HiJ20JO\4C2dU'BHS[O@:WneDK@IDASu("
@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b+<VdL+<Ve%67sC&D]j1DAKYo-A0<:0AS,k$AKWuc
0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"G%De<D]j+4F<G[=ASiP!$6UH6+<VdL+AP6U+AtWo
6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0+A*bbDIal3BOu'(Eb/ltF*(u6+DG^98g$,H0Jj4G
%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2+AtWo6r-QO=WhEr+CT.1DerrqEZf*+$6UH6+<VdL
+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4+=C&U5t"LD9N`_P$4R=b+<VdL+<Ve%67sC&BOu'(
Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-EZbeu+<VdL+<VdLEb/lo+=D)DA7TCaF=0-t@lc8e
BOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3762Q*AfuA;FWb+5AKYo/Cj@.;DKKH1ATMs)A0>T(
+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-ATq^+%144#+Eh=:F(oQ1F!,C5+A+7/=`8F*@ps6t
A9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9D/^V=@rc:&FE8R5DIal1ASc9nA.8kg+<Yc>ASiQ(
DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!Df0!(Bk;?<+B3#c+A,Et+DkP)F^])/AU&01@;0V#
+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNCsJ
@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+@;]^hF!,RC+EV:.+E_a:+E(j7FD,5.Eb/m+Cgh?,
AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:DfT?!A0>r3D.Oh!$6UH6@:X+qF*)81DKKqBFDi:0
Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%+EVaHDIm?$De<T(GA2/4+CK57F`_4T+>@1GE,oZ2
EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c+EM+9FD5W*+EM47F_kS2@V$[&ATMs3Eb/c(@:jUm
EZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#+CSf(Bldi.@q]F`CM@[!+D,P4+CfG+FD55nC`m5+
A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4Ch[a#F<F1O6mm$u@:EqeBlnVC%144#+EVNEA7]1c
+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&+B<;n@rGmh+EM[EE,Tc=+D>2)+CT)1@<lo:E+*d/
Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+qF*(u(+EVNEF)Q)@+ED%+BleB-Eb/c(A8,OqBl@lt
EbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfAEc5u>+DG^9FD,5.Eb/lpGT^RBE,oN2F(oQ1.3NMH
G9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge3Zoe"GB.V>B."gBG]P!U/g+\BC`k)Q%144#+Ad)m
DfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<Ec5u>+D5U8FDi:DBOr<.Df?h8AThX$+EVX4E%VS,
%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%
%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-
+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1
FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=ARlo8
+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgTF<G(3D/E^!A9/l(Ble60@<lEp+D,P4+A,1'+EVNE
Eb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86EZf=>E$0:BF"Rn/%14=),9S]n0J5+'/Kdf,G%GN"
ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+=\KV
?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu6
+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OV`n
%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2
.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#
+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9
F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*
Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO52
0f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=),9S]n
0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[Wm
F^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.YA7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^W
A7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!
F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge
+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;
F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2
@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A
+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5
Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\
Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&Nb
FD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9
+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]Tu
DfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m
+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=
De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOs
Ec6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)
@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B
/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9
AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V
1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0
De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdL
G%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[E
E,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1
-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP
$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9
@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0G
H#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\
:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-
ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(
Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAl
A8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<
Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A
?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b
.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[
+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea
/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>
AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-
+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE
?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%ht
Eb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QH
Aor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9Vk
ATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ
:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0
+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&
FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#
+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0D
E`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3
AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL
+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%144#%144#+B3#gF!+t2DJ!g-
D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SZ#+E2.8F<D\KIUQbt
Df0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o
@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=
/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4
ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2
F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/g)8G$6UH6+<VdL
+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK
4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$6UH#$6Uf@5p1&VG9Cd3
D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#
+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1
ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U
+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#
+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m
;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"+:SZ#+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/
A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@u
A7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+<Vd9$6UH6+<VdL+<Vd9$6pc?+>>E.
/ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<
Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK
+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,
D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2
F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U
+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"
F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtB
GW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO
,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(
+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(
Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqB
FD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7D
DfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$
@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD
@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL
+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1G
EHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6
+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=)
,9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3
Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08
+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5
?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3
Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi
6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(
@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&
Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWs
AKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:
Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHY
F`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t
+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+
@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1
AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0
Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,Rp
F"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:
DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@s
AR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6
Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8
ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:U
AM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,
@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5
0H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq
+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3
@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqB
FD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#
+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,
@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8
F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;s
Bk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b
+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK
-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nl
Eb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj
.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@lt
C`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%
67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK
%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`fr
FCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1
@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%
D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.
%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(
+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1
G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.
Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=
@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[Wn
De!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1
+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8
Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdL
A8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%
DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1D
AKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9
AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,
F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F
;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#
+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*t
F"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3
F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6
+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO
+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL
+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k
+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$
Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKo
Ddt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+
G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6
@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$
B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ
6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-
+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.
Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E.
/ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5
AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%
DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+
A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li2
9PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4
H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!
%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[
<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043
EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXC
Eb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$K
C3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrG
Bkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@
7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l3
0J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"
FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LA
AU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@
%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)
BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//
+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNE
F*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#
$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)
ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4
DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*
0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';
ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBn
Et&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#
FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$
ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMID
EarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_
$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#
+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;u
Bl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G
?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWs
AKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#
+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%
ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&
FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht
>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=
.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#
G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1r
FD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''
FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B
;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#
Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$
/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:
F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(
CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4
+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9
FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6
<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1
A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=
DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'
D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*
F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUm
EZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6
+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7
@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%
FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=B
E-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2
$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3
A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcU
D.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.6
0JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOs
Ec3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5
+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3
Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0
Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("
B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"
DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,
ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B
-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;
Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeK
BOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#
+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3
De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3G
F)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7
A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.
H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$
BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0
BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9
E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/
@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki
+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62
+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rm
ARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@I
F(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%
78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R
%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=)
,9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3
De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC
$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@
?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n
@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3l
Bl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6
Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#
.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)
E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&
@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.K
BlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1
+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*
?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#gu
CLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In
6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@lt
Ed8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#
D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&
A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j
79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&
$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8
Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I
+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1
+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+
C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.
+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;
%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<
D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$
B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?
9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot
/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6
Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#
@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn
+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u
+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LP
DJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-
FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.
+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4
Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1
Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;
EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeI
AT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOA
A1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdh
AKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#7
7rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDt
C`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)
AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&
ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8
+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_t
F`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6
@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8
AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+
Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=)
,9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:B
F`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-
0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;
EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et
-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-Ac
G9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;
FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%
Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&
F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0
C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1
AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD
@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86
A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/
Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth
+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!
ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdk
ARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOs
Ec3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o
/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)
@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm
@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*
+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q
@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$
DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t
/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%
0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP
+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$
C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr
@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f
%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'm
F!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?
6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg
%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8
E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:
/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3
@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#
+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u
+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63(
$6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$
+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,
@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&
+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"
FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J+
+D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.
1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1
F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=
%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$
/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4
D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq
0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL
9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--o
Dg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q
+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?
+>GK&/i#=-/KeS8Fs&2WBlGL1$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q
@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%+E(j7DfBf4Df-\-De*E%FCAWpATJu.DBNA,
E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9<+ohcCgh?sATAo8@:F%a+>GVoBlbD7Dg*=B
DBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1@q?cpDfQt4F`_bHAKYK$A7]g7%13OO+=\L4
Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGnASrW!A7T7^+EVNEFCAWpAKW]_/e&-s$6Uf@
<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!A867.FCeu*FDi:CBQ&);%144#+EV:.+Dtb7
+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n0J5+:+>"^.@;^3rEd8c_2Cot+0JYF,-q@id
A7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*DKI!U1*C:K+CJr.DfTB0?m'?*G9CR;Ch.T0
FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!+<Y?/CiFG<8l%htA7]1c+EqOABHVD1
AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+0F!+n/A0>GlEboH$EX`?u+<X9(
F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-+@C'fEb/a&+CJVeG$lG0Df/uo+CT;'
F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D$4R=e,9n<c/hen51*A.k6tKk>D.7's
+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=
G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nfj%Bl[cpF<G+*Anc-sFD5Z2+CT5.
ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1HE+*j%F!+n%A7]9oFDi:3Df00$B6A6'FD5Z2
+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo:L\'M@rrh]
Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0
+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.
9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3
Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=D
EarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJ
EZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCD
AU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJATAo0@:C?uA7crmA7T7^+CJ2jBl7QUDe*Zu
FCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$%144mE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a
@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj/oY?5?m'<)A8,XiARlp*D]j1DAKXNC
<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHOEb0,uATJu9D]hY<9H[hY@;]^hA0>u4+E_a:
+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?Y
D/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe@r$4++D58-+EM+(FD5Z2+CSekARmD9%13OO
+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%A7]9o/Kf+GAKZ).AKYMtEb/a&DfU+4
$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e
,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8Bl@l3@WcO,+D,P4+A*b:/hf"&
@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1ALDOA
6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe$6pc?+>>E./ibpM+>"^3@ruWuATAnJ
1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSekARmD&$4R=e,9n<b/ibOE3Ahp2+AH9i+>Po-
+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$
DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;DerrqEcW@3DIak^:IH=A@:F:#F(96%ASrW#
@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,8l8P?%13OO+<W-VDIn#7@!-@$@rGmh1ghGJ
H#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@%13OO%14=),9SZm3A*<P1E\7l9jr;i1,1=&
1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#78ono_FE_/6AKXKWF@^O`+ED%4Df]W7DfTQ'
F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6UH@+D#(tF<Ft+De+!3ATD:!
DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(
Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@%13OO+<W-V
D/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bh
CNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi
1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV
+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#
+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G
1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"
+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[E
E,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y
$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=
+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!
EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57
@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G
0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#
.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;m
Bl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7
F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@
+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]4
8g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5
BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=)
,9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb
+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0
Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<
ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2
F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B
05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*
ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?
+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6
Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&q
FD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD3
8l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeK
D]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZ
AKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#Oj
E*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?
@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNE
F`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNE
Ci=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16igA8Gt%ATD4$ARBA!Bk;KqFCf\P
1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/
+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*
F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,02-)%ATD4$ARBCs
DeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+C&T#AS-:&FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHV.(%+Co1rFD5Z2@<-XA
+D5_5F`;CS%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8WBl89/DKTf-Eaa'$
I16NgBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=
FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XWT'F(oN)+DPh*Ch\!&Eaa'$
+Du+>AR]RrCOIfX%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIS#'
$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U
@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I="t8Bl7Q+C2[X!
Blmp,@<?'':ddd$/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g6!$6WSk
DfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.
DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5I=">(EcP`/F<F1O6m->TDKTB(I4bs9
+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,
F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/%144_DJsQ4@;L"!H=[Nm>\.e`HY%);D.R`r
FCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC8T&W]Eb8`iAUP!p%16?LAS5^p
HW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?RH#R>8Ch[d&HW3O-;c#bT6r-0uHX'<a
Ec#6$<,ZQ!<(KSZ:dIiE:I?6I+<VeTI9Trq@:s.lAS-:'An*l$84c`V5u'gD6[`5_>XNFHD.RU,
<,ZQ!Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%I16NgBR+Q.
EboH-CO9Z3Ec#N&@:NkjAU&WM>Y]3XD..6[Dej]3DfT]/Amo1\FCf\>+<Z)\>?l,UB4Z*pAp\6(
@le4?Ec#N&@:NkjAU&W/+C%9PD/Ej%FB!0oHY.2:D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_Bq
BQRfr+DG_8ATDBk@q?d,DfTB0I16NgBR+Q.EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<Ch[u6
+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9B6%s-Blnc/+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>AoD]4
B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'Bl@m;HX'<aEc#6$<,ZQ!BkCd`ATMEmFD5Z2
+<VeTI9Trq@:s.lAS-:'An*l9Amo1\F(Jj'Bl@m;>p*B>Df'?&DKJirCO9c5FCfK)@:NjkF(Jj'
Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5BkCk'HX'<aEc#6$<,ZQ!BkCit+<VdL+<VdL
+<VeTI9Trq@:s.lAS-:'An*l9An-6p+C%9PD/Ej%FB!0oHY.2:D..N/Bl8$(Eb8`iAKYK$D/Ej%
F<G[:G]\?C$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$FCflI>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$
AKZDL>?l,UB4Z*pAp\6(@le[BFD>`)Ch\!&Eaa'$I9dt#6Z6gYASuThDej]=Eb02uEb-@e@8pf?
+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<mI16NgBR+Q.EboH-
CO:2JCghEsG\1u?DfTB0I=#3oDfT]'CfG=gHZaOK@<?(*Ao`*6Eb'56I=5=)E+*BjEb/j0BkCj9
Fa%Y1FCf]/Ed)GBA930)+C%9PD/Ej%FB!0oHZa4MEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE
@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@I16NgBR+Q.EboH-CO:8DEb'!#FFAL@:2b/i@;Jn]
CO:8DEb'!#F<D\K+<VdL+FSZB>]=+aATD?oHYI)%3d5L_A8Gt%I9dt#6Z6gYASuThDej]:@;BEs
CghEsGT^U=Df$V@DfTA2Ch[s4+=MLaI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u
$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC@;]Tu8l%j'%13OO>]aP%FEDVOC2[X!
Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.tF<G[=AKXSf@rGmh+CT.u%16Wa@s)X"
DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn
>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI6m-#S@ruF'DIIR"ATKI5$=%:e
AShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,ASuT4Ao_<mD.RU,F!+n3AKYPuFD,6+3XlE=
+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(GA\O9Ec6)>+Dbt6B-:`'@s)X"DKKq\+C')$
EajDO+?:QTBle59-YII<F`;5,D.P)B%144#>\S:kD'3(W@8pf?>Te*1AnGb%ARlp#@:O=rF#kFK
G%G]'Ho)sVBle59-YII<F`;5,D.P(G-XUe8Bk;KqFCf\EHjpE*+C&JqA:&$4ASl.-AUP!p%14C(
>\S:kD%-gu+<Ve%Df..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5F`8I:ART+\Ea33p
Dffl8FCfeuBPDMs$7-f;+<VeCBl.R+@<?4%DBNe)Gp$R-+D"u&ARlotAftf0+C\nlDf'',+CQC+
Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%14C(+<YlBFD)e9F(KK)D_5p:DIdZq+Co&"Bl.R+ATDiE
+@UHbEd;b?Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&I=2P3,p4<Q@WGmeCLqU/+D,P.Ci=N=+E1b,
A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.6+<Ve3FCf]=FEDkEDe*Zu
FCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.Ebf5s+Dbb-AIStm
+<VeKBPDN?%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p5rL/j)7FIXZ_gHQXqW@<?(*+Du==@V'RR
Bl7L'+EMX5EcackDf%W]0d7`g%14C(:-pQs5(7s0INT(,,p6H(DIe*;ATD6gFD5T?%16?ODIe**
DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$+C'#"G]\%LHYRJ0Ch\!&Eaa'$I=2P3%16?^
AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=
Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+EDUB+E)-?8g$)G0JO\YDIal!
AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc%13OO>[h8WBl89/
DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&8l%i-%144#>\J.hAp\35FDu:^0/$gRA7[B.
F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R^7"$1lF!+m68du+M+CSekDf.0M
8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'
/n8g:06_,GBeN:k@r5XlI=#pA@r5XlI4bs9>\S:kD%-gp+A$HlFCB!%+A,Et;bpCk6U`U:$6UHr
BQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X(Dfp)1
AUSnt:IJ,W<Dl1QI16N++DGm>@;L"'+CQBb+CSekDf.0M8T&Tk@;Ka&BlkJABln#2>]aP%FEDVO
E+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et%144#A8,OqBl@ltEbT*++ED%5F_Pl-A0>u4+C]J-
Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u$$6UHrFCf]=FEDkEDe*ZuFCfK$FCd(Q%16?S
FCf:u$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.hAp\35FDu:^0/%9QDIdZq/oPcC
07A1d@;]Uo@sos=$6UHrFCf]=FEDkK@;]Uo@soJCATDj+Df-\&FCf]=FEDjb/ibO=/hqbs@;]Tu
@V'h'DIak!$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+B.b<'EbTH4+Eh=:F(oQ1F!,L7
EHPu9ARlp#De*QoBk(RnBl@lA+B3#c%144#AoDL%Dg,o5B-:Z"DeC23Df^#A+E2@>G%kJu+Dl%;
AKY])AoD^,@<?4%DE846+<VdL+<XouAS5^pHY%);D.R`rFCfk0$4.gt>\S:kD'3(sEb/j0BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0
F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKaA8bs#;gE8&@<`ncBkM*QBkM+$Bl7R3%13Ca
+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJB
DfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07=9:+<VdL+<Xp,
DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VNHVe-gA8bs#
@UX=hA0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MC
E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6
C+XLPDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#AS-:&
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$
FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MC
E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$
/S]3707=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp#DIe**DKTf-Eaa'$I16NgBlmp'%144#6?R!Y
A0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bB6%p5E%W8*
:IGX!+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>F"SS7D]in*CLnVnFCf]=FEDkEDe*ZuFCfK$
FCfkCA8aL<$4R=g+C&AeB5)71G%G]'@<?4#I16N0+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn,p7,:
+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g3Ci^^HC2[X!Blmp,@<?'.%14C(>\.e`
HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[
Dej]?AT;j,Eb-AA>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:m,/ATD3q05>E9>]aP%FE)GA
FCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.AU&<:
F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4<,ZQ!
>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+
I9^l*G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHYmS?+FRKnFE2)5B2iebHX(Z(G][qJDffQ3
Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16Ng
ASu%*;eTTMARp2u$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!Df0!(Bk;?.@rH7,@;0UnDJ()6
BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(De'tP
3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!4$%dp
;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-DJ*cs
H[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_Dej])
FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?O
DIe)mBOPF_A:4mo>\S:kD%-gp+A?]^A0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR6"Y4MEZf4-CM@[!
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk$6UI-Ddd0fA0>]&CLnVsDL!?s+EM%5BlJ/H
%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7#B@:UK.C2[X!Blmp,@<?'.%14C(>\.e`HZit@@UX@m
D1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]9Ddd0!
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR
%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B)in+CQC:DfTW-DJ()&
Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%%144#>YJR*AQXCnBl%@%/g*Gr
C`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.A8-'q@ruX0Gp%0IARfFdBk:ft@X/Ci+<Xp2
AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%14C(>[h8WBl89@ATD6gFD5T?%14C(F(KH.De*ZuFCfK$
FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F%13OO
,p78?FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-73$7-g9ATV[*A8Gt%
ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0Fa+?&,p6H(DIe*;ATD6gFD5T?%16?LAS5^p
HW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuTh
Dej\p67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2FI16Mm$=$>E
Ec#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:G<CFCf]=
@UWb^F)59+BR>/LASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL>XNFHD.RU,<,ZQ!:-pQU
GA1r*Dg-8N%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-
DJ*csH[RP\Df'&=C2[d'06CcBE*RKrG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g+tE
DKU2P%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*cs
H[U?bASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL+<XoVDf'?&DKJirCO8fC/g*b/A7]@e
DIm?$AoDKrATDj?%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD'2bgF<GL@
FD5Z2@;I&pF`_;8E[YuX+EqOABHUi2@:X(^+C'#"G]\%LHZNb?C2[X!Blmp,@<?(//e&.m@V'1d
DL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)
Ch7sA6=FtQ@;]=lAU&<:F`2A5F(oN)Ch7sAI9]NcEc#6$<,ZQ!+EM+9C2[X!Blmp,@<?''I9]]m
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foK@UX@g@<Q3eFCf]=EHQ2A
ATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUF(KG99OUn3=<M$pFD,T5.!$g[FCf]=+CT.u+Co2,
ARfh#Ed<'B$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#;KZk">]aP%
FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n\@FCf]=FEDkBEc>i/
FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqL4=BOr<,
Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.B6%p5E$0%,D.P=/$4R=g+C&AeB5)71G%G]'
@<?4#I16N0+D5_6Ch[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>%14C(
>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3X
D..6[Dej]4Ec>i/F<H!:;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'cFCf]=
EHQ2AATMR'B5D.+I=35C6Z6gYASuThDej\p67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+FO\+>\.e`
HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHkF(HJ!9OUn3=FP@1+Cf>,E+s-"
+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU+:SYe$6UHW+EM4-Cht58@rc:&
F<Du:FCf]=FEDk=@<?o?DfQt*FCf]=FEDkNBRM<PBlbD@EbTW;ASrW4D]j.8AKY6"AU&<=FF/(?
FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1@q?d$Aft>P@8pf?
>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$Ec5H!F)to'+EqOA
BHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&@<?(*
I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%Bk)'l
AKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#>]aP%
FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5>\.e`
HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>DKI"C
D]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=FF-VU
6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='%144#@rH1+
D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)F<G[=BlbD6@<iu9ATN!1F<G:8+Eh=:Gp$pADJ()0
@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+
D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%OB5)71D09Z:Bk)'tF+&BkI9TrtARfgr
Df.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$
FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Et&I!+Cf>-FE2;9Ch7-"
@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l0Hak=@<,ddFCfK6/e&.1+@BgN
DJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O=)q_gE+NQ&Ch[cu
F!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((sFCf]=FEDk2;F+,Q76s=i+EqOABHUhs
AmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9%16?SFCf;3%144#>]aP%FEDVOC2[X!
Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%BP_BqBQPA%ASlC"HZsL=E,]B!I3<!;G\(D.8g&"i
F`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7+E(j7F*)G:DJ+#5@;]TuDffZ(EZf:BBOu3,FEqh:
F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+ARlp$Df0H2F`)7CFD,*)%144#@rH7,@;0U%Ci=3(
+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&>]aP%FEDVOFa%Y1FCf]/Ed)GBA93/M+EM+*+E1b%
AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+#SK$6UI$@;[2sAKZ,:ARlp*D]i\(DImisFCcS"
ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4F*1u++EqaEA9/l8BOQ!*@ps6t@V$[!@;^3rCi"A>
GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.b@
A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0F)Po,+DkP)F^])/ARoLsBl7Pm$6UI*F!+n-G@>c<
+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>IASu%*ASuX-ATD4$AUP!pC2[X%@<-4+1,2Nj/h1US
A8kstD0$h@/M/)UAS,@nCige1Bk)7!Df0!(Gp%'7Ea`frFCfK6/e&._67r]S:-pQU<+oue+D,>(
AKY].+E_a:A0>u4+EM+9+<Yc>AKW++AS,@nCigdBA8,OqBl@ltEd8dH@<,dnATVL(Et&IO67sC&
@:F%a+<YB9+EV:.+DkP.FCfJ8Anc'm/g+5/ASrV5@3?\1ATo8-Bk)7!Df0!(Gp$gB+CfG'@<?'k
%15is/g,7LAKW+7@<,dnATVL(F!)T>DBO%7AKW+4@<6O%EZet.Ch4_tEb-A9F(Jl)FDi:CE+NNn
ApGLAFD,4p$;No?+E1b0@;TRtATDi7AoD]4@3BMtEcc#*F_kK,+Co1rFD5Z2@<-WG+B3#c+<Yi=
Eag.>A8lU$F=A>B@;ZM]:-pQU@V$Z)+E_a:A0<":D]g/FD/Ws!ApGLAE+*cqD.Rg#EZcKGATW$.
DJ+#5+<YB9+<Ve@DIdI)Bk2?pC^g_H67sBkBk)7!Df0!(Bk;?<+<XBeF*(u6+<Y91Ch4`.@<,dn
ATVL(F!+t$DBNk8Cj@.4AKYJr@;]^hA0>?,%15is/g+_9Bln',B-;;0BlbD/Bl%?'@;]TuEb/a$
ART[pDJ()6BOr<'@<6O%EZet.Ch54.$;No?%15is/g+,,AKYhuF*(u6+D,>(AKYJkDBND"+ED%'
Eb/[$ARlp-Bln#2FD,5.@ps1i3XlEk67r]S:-pQU@rc-hFCf;tF*(btC2[Wi+A,?o;cH1`?X[\f
A7#cQ:-pQB$;No?+BLj,:.\2N3ZqjIC`mh5AKW+7@<,dnATVL(F!+t8EcP`/FDQ4FCh[s4ARlol
Eb-A6AT;j,Eb/c(@X/Ci:-pQUFD,5.8l%htF*VhKASj%B8S0)jDfm1CASl@/AKYE!Gp%$;+EV:.
D'2GH6m-\fCht5(Eaa$&/g+;8FU\[Q67sBj@;[21F(&ZlCj@.3A7QfkA7TCrBl@ltC`m\*Ea`fr
FCfK6+C]J8+<YrJFW_f:@;]t$F<GX5An>e(%15is/g,1GD/XT/+CfP7Eb0-1+E1b0@;TRtATDiE
%13OO9gM]W78crJ;GC(Q3Zp+!3Zp*c$4R>;67sB[BOr;uDfT]'F<GL6+EV:2F!,F1Ea`frFCfJ8
Anc'm+DGmX%15is/g)8Z+<YE:@;TQu4!5qnH#R=D+Co&)@rc:&FD5Z2+?L]h@;L't%15is/g(T1
:-pQU+<VdLC2RHsAKY].+CQC9@;KXg+A*bo@;TQb$;No?+<VdL+=M>WE+LI@A7]glEbTK7Bl@l3
A8bt#D.RU,F!,R<AKYr#Ea`frFCfJ8/Kf.\E+L/+F!,L7EHPu9ARl5W:-pQU+<VdL+<VeFDJXS@
-nB"LFCf)rE[`,FF!+t8EcP`/FDQ4FAU%crF`_2*+E)@8ATAo8H#R>9+EqO9C^g_H67sB'+<VdL
+<Y-)+E1b1F(Jl)@<3Q$BOPpi@ru:&+Dbb5FE8QQF(Jo*A8lX!@VfU)/e&._67sB'+<VeM@;L't
+DGm>@;[3!G\(B-FCAWpAKXSfAU&07ATMp,Df-\>BOQ!*E,ol-F^o!(+CQC9@;L't%13OO5uU-B
8N8RM+<Vdg+=JaSDKKH&ATB4BGA(Q*+>G!]F(HJ&F(8ou3&MgmDBNJ4D/aP=-nlc^EZd(c+<VdL
+<VdL+<VdL4!67#+:SZF:Jb1`5snUI;BS%D-nB"LFCf)rE[`,@Df'H3DIm^-F!+t2E+rlo+DG^9
Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<Vdg+>GQ(%15L!6WHiL:/jVQ6W>0i+=JaSDKKH&ATB4B
GA(Q*+>G!LBk)7!Df0!(Gp$X9@s)X"DKI"8F!,FEF<Dtc+E)9C0e"4f+<W`g0b"IX:IA,V78?f`
8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#F_t]-F<G[:G]Y&V1,(h94>JcO
.3K`p+>tq`$:Ilg:e!`<<)6C74!5q%Bl8$(B4Z*4+E(_(ARfh'+CoV3E+NQ&Bl5&3DIjr,Df9S;
E+*g/+=Js,Gs!i=0I\+e+<VdL+?L]'0F\@Z78u`B6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0+ED%8
EbT*.ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg+>Pf.%15p3<(9/@<)6C7+?L\o
.qrmCAS5Rp.3NhQEb'56F*)>@ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<VdL+<W`g
0eb9j$;s;l5tOg;7n"OC4!5q%Bl8$(B4Z*4+EqL1DBLYVFD5T'F*(i-E-!.1Eb-A7@<Q3m+DG^9
A9Da.F!)kb+E)9C0e"4f+?L]#%15Wl;b0;V9i)rT+?L\o.qrmCAS5Rp.3NhJASrVF+CQC+@<6*)
BlbD9Eb/isG\(D.FDi:4F_u)=+=JodDfQsT.3K`U+<W`g0b"I!$;No?+Au!2<(9YW6q'urBlbD.
D/aTB+C]U=A7]@]F_l.P+A$/fBlkJ3F!,O8F<G[D+CQB@C2dU'BIP&r+Cf>-Anbn#Eb/c(%15is
/g+bECh.*t+Au!2<(9YW6q'urDg#]4EbT&qF!,"-@ruF'DIIR2+Dbt+@<?4%DK?q4DfQsKD/=8B
+D58'ATD4$ARlp)@rc:&FE8Q6$;sYq<(9YW6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7-uEdA
.3N\AEbTK7F!,RC+A*bgDerrqEZdFd%13OO:-pQUFEqh>@ps0rDJsE(D/aTB+EM+9FD5W*%15is
/g+%f:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)CF"&5Q@rc:&FE8RHD]hXpAoDKr
ATAnT+F\HSATBG=De*m,Dfd*2$4R>;67sBHDL!@5A7T7^+E1b0@;TRtATDi7@<,p%F*)>@ARlot
DBO%7AKYhuF*(u6+D,>(AKZ21ASqqa:-pQU@rc-hFCeu*@;]TuA8-+,EbT!*FCeu*FDi9o:IH=9
Bl[cpFDl2F+E(_(ARfh'/g)8G$4R>;67sB^5uLHL:.I>fGA(Q*+Co%qBl7X&B-9ehAU&07ATMp,
Df0V=@V$Zl@<,pkF_i1/@W-C2+EV:.+?L]UBOPpi@ru:&+:SZQ67sC&BOr;Y:IH=8De*E%-tI:=
@:F%a.3N_G@<<W2@<-F#F!,R<BlbD<FE2)5B-:o0+EDU8Bl.F!FCB38/e&-s$;No?+@Aq$=].g]
85p]n+=L`5@<,ddFCfJA+?L]3Cht57BkM+$F!,L7F(KB8ARl5W:-pQU9j(:Y;F+#G<(0\-4!5q%
Bl8$(B4Z*4+EV:.+CT//G@be;4!6@8%14Nn$4R>WDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G
/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1
@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`
67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3F
BlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#
Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?
+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS
9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4
@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5
D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()
AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AP^3762Q5D]g/p+Co&,ASc:(
ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8ATDa1ATVj2
+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+
F_iZ>$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?
+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#
%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-
AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;
FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>
DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=
$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'
BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^W
ATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+
Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^k
F`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?
+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1
FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2
-YRF8AKZ28Ebce>ATMr@%160-78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2
F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>
F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/
$:Rij8P2cH0JYdP+=Cl@G%#3$A0<:F.3N\C@<,jk+EMXFBl7Q2%15m(8P2cH0JGXN+<W%LD]in*
FCSuqF!hD(:J48O:IHlk4ZX].-Z3iFDdmHm@ruc>%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:
Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2
%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H
+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[Flo
De*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqE
A1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-
+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g
+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#d
De*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi
+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c
.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c
$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&C
DIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6N
ARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m
+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB
+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)
Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3
Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBO%0F`_P<DeF><
F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtEBQ?;-?=3M%13OO:-pQUEcl7B
D.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is
/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$>=KD
3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9
Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?
EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$
0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.
+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;u
Gp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUEb0*+G%De<Ea`ZuBl7Q+@VfIjCERY9GB43#Eb/^%
@WHC24ZX]k+<u=X><3lY/g+@Z+=\us+u(3E3Zon)03g+P-Qjc`4Uh`-$;No?+CT5.ASu%"+EVX4
Bl%L$B-;#)DIjr&AS#Bp@q]:k@:OCjEZf(.+Dtb#ATMp$Ed8*$FDPPP3aEjZ+=JWm0RI4\.3`+A
4Wo)4.3O$k+=JruHXSNU,$tcd%15is/g,4KDg*=?Df021A8bt#D.RU,Et&IO67sB'+<VdLBP_3%
0H_J\+<XEG/g,@VEb'5#$;No?+<VdL+<Y?6A0<WM+<VdL:-pQUB6%p5E,uHq:-pQU+>=om+>=pO
Ch+YB+<Ve%67sBkDe!p,ASuU$A0>c.F`)70$;No?+=BoU9i*ku+D>S%+>=o\:-pQUGAhM4+CoD#
F!,[@FD)e<FE2)5B-8Qs8PN#B-OgDX67sB'-s[rH3ZoY4BP_3'0I\,Y/g*"o:-pQU@rHL-F<G+4
@ric2DBNn,FD)*jBP_3B3Zodt-6tVp3[cg-3Zp+*%16f]/g+V3A7KF_@;9^k?QaS9A8a(CC1Lmr
EaN6iDe*2t78d#T8l%i/1*CUKFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tG<IQ$Gp$X8C`k)Q
+CoCC+EnrKATW'8DD!&CDIb@/$>F*)+>>r'-9`Pr4Y@k*/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/
0d(LJFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tA3DOf-n'EpGpt:).3N87F<GcMA8a(CA0>o(
FEMVA/g+_CA1e;uA3DOfA0<+G+>=p#+<r3s+>G!c+u(3N4Y@j@0mdF?$>F*)+>>o&GT^O8/g+[f
/g+[I,CUac/h]I<GU>j3.4.5$0d(fe0d(!LASu$2%14L;+F>:e+CloD/1r&cAR]ajEc6.e-s\ne
?SX&qFDPPS-nR%u6W,?[/j:C4+F>:e+Ckog.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtA
FE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQU
F(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk
+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r
+EM47Ec`FGAU&;>%16ciF$2Q,0IA&++?Co-+?CW!.1HVuAhG38@:XCg?X[\fA7$I'4Y@k%+CoA+
+=ANZ+<Y35/g,?\Eb0?8Ec*KPASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;
+ClT;+<VdL+<VdL+<Ve;D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2
/g*_<+=Jd%Gpsjd/h\D'5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'
HQXXf4s4AF$7QDk%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KL
A1&KB+<VdL+<Ve%67sC)DfT@t$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K
67sB'0d(ORAU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E44ZX]>-6tVp3[cg-3Zp+*%16f]
/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO
4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@lt
Ed8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+EBUt
+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'n
E]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\f
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
+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBsDdd0!@;]TuF(fK9+DN$?@rc:&F<G19Df$V,Df00$
B6A6+A0>i"FD)*jC2e5W3ZqWf+>=s"0JG4(><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm
@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRq
BkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+CoV3E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9
@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?
E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX
:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=
0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUu
F`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+EM+9+CQC3Eb/ioEcP`%
+Dbt+@;I'*@;]Uo@iumG+E_a:A0>?,+=LuCA8Gt%ATD4$ALS`R+EVXL+=MGIATD?)E+*WpDdt4*
$;No?+Abs)7R^3Q779s<:..lF4ZX]56TSIPF(KB5>\@VcEbT#9F`V,7>X<=J6t(1G>YK'G@;K1F
@;]Uo@pEt]DIdZq-OgDX67sBW;FO&D;GoqO:dIiE:I@9++=AgbF)ipMDe!3l04JX505t?;A8bs*
%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1
Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9
%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO
:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60
@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4
+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgE"
@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpR
FD5Z2@<-W@%16-);H$._:-CWc0eP150H_qiA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^
<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr
9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*
/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm
@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:
$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@
%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9H
A7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`
F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl
:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX
@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE
+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)
Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%ht
Eb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?
BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI
6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2
+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&
DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A
@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*
8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>
FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'
FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=
E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5%14Nn$>j3hBkCptFD>`)
A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"
DKK</Bl@l:%16-);H$._:-CW\-S[5-/i"d`$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M)
:eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]o
F*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUr
F"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'
DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EI
F_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDkl
B1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQkDdtG#F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk
;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuC
A1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;
@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16ukFCep"DejD:FD,*)+EM47G9CR;G9D!G
+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).AKYMtEb/a&DfU+a%13OOC2dU'BHS[O
@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=
AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2o
F?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"
%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p
/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ
8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hnt4+>"^HATfF1
$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p
/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<
%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2
F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*Bi
Ft@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8
+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,
A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?s
AKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(
Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4
Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*+
+Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,A
A7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.
+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$
DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlO
F_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%
GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UH
AKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q
05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZ
AKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37
/T>-2AM4K".1HW$H"q8.E,ol/Bl%?90ht%f.W'HGDe*g-De<^"AKZ%G/KenU+A,Et+Co1rFD5Z2
@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<
BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2
FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*
+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9
@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*
Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8
BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0
+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)
+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'n
F!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6
DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)
AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU
@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is
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
G\&'H%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>Eb0-1
+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4F*22=
AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(%15is
/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"BF_Pr/%16NV
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7F(HsHC1Lmr
EaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:
+CoCC+=LuCA90gg.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@/$7QDk
A7n%d+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EKAScF!/g+n>
ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1
F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1
.1HV,+<V+#:-pQUEb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.lGWe)11E\_$
0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P
+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%14Ll
Ci"-'Aof(;I4cXTDCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6Ec6)>+E_a>
DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\f
A7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC
+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImisFCcS)F`MM6
DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*K.+CoCC+Dkq9+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk%15is
/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.F(oQ1+E):2
ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D@<H[1Ci<s3
+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M
%13OO:-pQUEcl7BFCfN8+EM75ASuU+Gp"[]Df0B:+E)CEE-68D+EqL-F<G^IATAo7ATVu&$?C,L
3Zp.(EccC4$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@
F`\'"EcXB)+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?
CiF9.+BplLI4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!
+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o9
67sBt@:O=r%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OH
ASrW7DfTB0%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;
FEMVA/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$I
D_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqB
BOu"!+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-
DJ(=>+<XEG/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS
:-pQUF(Jd#@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H
@<,jk+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHb
C2[Wi+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]
/g)i2,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&C
DIb@/$>F*)+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCI
FEMVA/g+_CA1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is
/g)8Z+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?
+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$
+>=630HbFQAU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA
/g+_CA1e;u.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lp
DImisFCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63
BkAt?@UWef@p`YZDe*2tE]l#tEb0E4+=ANZA8a(CEZfC6FEMVA/g+_CA1e;u-upjkF"&4VINU3p
4"u"*0d(O#/heD\Ci<d(-9`Pm4YD.8EX`@)%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa
@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD
/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5
?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*
A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+E27>FCAWpAKYH#
GT^O;@<ZF'B-:\t@<,ddFCfK6%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LM`L+Boso
%13OO:-pQUGA1r*Dg-7FCis6%A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&J#Bl7`s
@q]:kF$2Qg3ZpF+3]A00@4lnU0fCOr/ho(0,$uHs+C,E`%15is/g+_9BlkJ-Df'?"DIak!$:IZW
<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,
Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*
5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,
DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;
66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'
@s)X"DKI"8DBL?MFD5Q4.1HW)ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq
+BplL-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-
4?tMI1GU:@5U\E33\W!3.1HUn$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.H
ATDX%DIIWuA0>u*G]Y&[+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV
0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps
0RI4\.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$8
0RI4\.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'o
BHUksBlkJ>AU&;MD.-ppDf[%0DIakuF)u80Bjl*p+Cf>#AISugF?MZj+?L]YF:ARoF?MZj+?L]$
2'QBM4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji
+>Pl"?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQB657=+AP6U+=]!bEGQ'k
D0S3)>p)3O1,:%\+?L]YF<D\K:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>
/KeS8AmoguF<G<@F(96)E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]
/0H>g+=A9`/q+pK.3L/a-S?bh/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?
ATAo8ASlB/A8-'q@ruX0Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4
D'3R9F`V,7+EV13E"*.hCcsg%-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0F(96)E-*47Ec5e;@rH6s
BkMR/ARlou+E1b2BFP;`E'66)><3l\+Z_;"><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm
@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRq
BkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/
+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%160-78cQ?9h@K/+=Ci@D.P(($4R>;67sBkF_u(?A9)C-
AKWQIF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T
;H>qA+=Ch`-OgCl$;No?+CoV3E$0+.FD,_</Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA
.3N>:+E2@4F(K62%15is/g*P^9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[
<(K/5+=AgWDe(M9De*g-G%>`4E-!Z[%13OO:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,
+=MASBl%i>+DkOsEc3'K@r,^bEc?/C.3N>:+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a
$4R>;67sC%ATT&'+E2@4An?"'ARlp&@;]Uo@j#]-+EV:2F!,=.@q]RoAKWQIF`V,)+C]U=-u*[2
Ch\!&Eaa'$.1HVZ67sBW;FO&D;GoqO:dIiE:I@9++=BN;>ZGiVEcYJuASuO&@kMnFATD$AE,\3R
FCAEJDe!3l>YnjHA8bs_E+*WpDdt.($4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;
FD,5.@UX=h+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^
F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(
G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2
F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<
FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">
>9Iip+=D#;E$lc4+>Y-YA0<6I%13OOH?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]n
Bl5PFAU#XHCghEsGT^U4Ch54A%14Bj$7-fe:IH=HDfp)1AKY].+Cf>,E,Tf/A0>f&+CQC1F_tT!
EZf:4+Cf4rF)to6/g+,,Bla^j,p6f6Ch4_tF)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7
DfU+GD..NtEbSru%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9
D/a3*Bl7Q+FD,B0+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEs
GT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=E
A8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<Q
Cis0&@<?(*+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*
+<YuVH>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$
:i^,UD.7<m/p(ZLI16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(d
G%G]8Bl@l6IXWLa8l%j'+B*3$EarZ'6Z6LH+C&.o>\7nmFDc#=ATMR3AKY6#Ebp)9FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[WsC3+f.DJsQ4@;L"!H=_L6$4R=g
+Cf>,D..<mF!,(5EZee$C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'
Ecc#5B-:V*Ecl20%16?]ATVa"DJ+')HX('!CisT4F(K<=HS]5MI16NgF(KH0ASu.&BR<uoDesQ5
DKBB.Ecl20I=!Y#2/mYc%16?^GAgu0CisT4%13OO>[h8WBl89.De!p,ASuU<%13OO>]!nbATVX.
Ch4%_>]aC`Ch7Ns@rH7,ASuU2%16?YDIm<rCisT4%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d0
Bk;K@FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d(/p(ZLI16Mm$=%I[GApu'AISuOBl7m4
FF/=[C2[W8FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*p2DfTDAFCf]F%13OO>]++sE+*Bj
%16?SDK'`?H[:!QDe*Bs@P2b6G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm
$=%I[GApu'AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.
DesJIFCf]F%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3
FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.
FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3  ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebI-0fL41+>G_r1,pC30H`/-+>P_q1,0n+2BXb5+>G\q2`)X30d&A6+>PVn1,g=10H`,1+>GYp
1H$@20d&50+?1K!3?U%1+>P\p0eje+3?U%:+>Yr!0fL422'=V/+>Pes0f1"12G-b56<-TN6qBmJ
<)6CpEb/`lDKI!n:IH=7F_PZ&+D>J1FDl2F+Dbt/8l%iS:JXY_6<-TN6qBmJ<)6CpEb/`lDKI!n
:IJ/X:J=\0@WcC$A0>Q"F*)>@Gp$pAB1brf?Z0CpATDs*A7&ngEc5u>?Z^O7@Wc<+Ci<r/@;]Tu
Eb0<2Df0W-F&5Y2<*sBYA8Gt%ATD4$ASQ-oCh\!&Eaa'$+E27?F<GOCDe!@"F)Q(u:IIuc8l%iC
:IAK+A92[3EarZ'AoD]N+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,
F*(u602t_8:L?^i6psg</o>,u:IIuc8l%i^D.I^+F`Lu'+D,P43Zr*XFDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG':IIuc8l%i-D.I*uBl%<pDe*BmF*)G:@Wcd,Df000
Cht4d:IH=9BleB:Bju4,Bl@l3@WcC$A8#[uFDl2FC2[WqASu("@;IT3De'tB+Cf(nDJ*N'BPDO0
DfU,:BleB7Ed;D<A7TUgB4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2FC2[X!Blmp,
@<?'fDg#i+G@,H'G\V/-Ch\!&Eaa'$+E)F7Ecu/.G9BRf<+T0HDe*fqEc#l.AS,@nCige1Bk)7!
Df0!(Gp%'7Ea`frFCfK6C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>Anc'mD..<rAn?%*C2[X%
@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU/@:O._DBNe)DJ<]o
F*&O:DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AT2'fD..<)D..<rAn?%*+D,P4
+A,Et;bpCk6U`,+A7TUrD0]l7A8lR-Anc'm9mIjR:IH=9Bk)7!Df0!(Gp%'HDe<^"AU8ZKC2[X"
@;0UdFCf];Df9_?CghEsGT^U4Ch4`$DfQt1Df'H0ATVK+C2[W*F)Q2A@q?d!BleB1DJ()&De!p,
ASuS                                                                      ~>
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
zz=:zz,'ERR027 ERR028 ERR029 ERR030 EXPLAIN FREESPACE GROUP HASH HASHFSX HA'
zz=:zz,'SHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IPYNB IzJOD'
zz=:zz,'interface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME JODPROF J'
zz=:zz,'ODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF MACRO MAC'
zz=:zz,'ROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS NVTABLE OB'
zz=:zz,'JECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK009 OK0'
zz=:zz,'10 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK P'
zz=:zz,'YTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD X'
zz=:zz,'ML ZIG abv afterstr alltrim badappend badblia badbu badcl badfl bad'
zz=:zz,'il badjr badlocn badobj badrc badreps badsts badunique beforestr bg'
zz=:zz,'et binverchk bnl boxopen catrefs cd changestr checknames checknttab'
zz=:zz,' checknttab2 checknttab3 chkhashdmp createjod createmast ctl datefr'
zz=:zz,'num dblquote decomm defzface del destroyjod did didnum dnl dpset dp'
zz=:zz,'table empdnl fex firstone fod fopix gdeps get globals globs grp gsm'
zz=:zz,'akeq guids guidsx host hostsep isempty islocref jappend jcr jcreate'
zz=:zz,' jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace jus'
zz=:zz,'tdrv justpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark'
zz=:zz,' nc newd nlargs now nowfd obidfile od ok packd plt put quote read r'
zz=:zz,'eadnoun readobid regd remast restd rv rxs rxsget rxssearch saveobid'
zz=:zz,' second sha256 tc trimnl tslash2 tstamp uses valdate wex wrep write'
zz=:zz,' writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRN'
zz=:zz,'C DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 '
zz=:zz,'ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR2'
zz=:zz,'12 ERR213 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum copy'
zz=:zz,'dirinv copyfile copyfiles createdl dbakf dfclose dfopen dfp dncn dn'
zz=:zz,'ix dnnc dnnm dnrn dropall dropbakdir dropdir dropinv dropnc dropref'
zz=:zz,' gettstamps hashback justdrvpath libstatus loadbakdir loaddir loadn'
zz=:zz,'c loadref loadstamps maxback movefile nummask packdict packspace pu'
zz=:zz,'ttstamps renamefiles restdict restspace savedir saveref tmpdatfile '
zz=:zz,'tmpusesfile volfree''),(<<;._1 '' jodliterate ALERTTOKPFX ALERTTOKWRA'
zz=:zz,'P BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGINNOTJ COMMENTTOKPFX C'
zz=:zz,'R DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKEN'
zz=:zz,'S HINTPFX HINTWORDSPFX HYPERLINKPFX IFACEWORDSPFX IFACEWORDSjodlite'
zz=:zz,'rate IFCPFX JLAUTHOR JLBUILDTEX JLBUILDTEXunix JLBUILDTEXwin JLCLEA'
zz=:zz,'NTEX JLCLEANTEXunix JLCLEANTEXwin JLCODEFILE JLDEFAULTAUTHORS JLDIR'
zz=:zz,'ECTORY JLGRPLITTEX JLHINTWORDTEXBEG JLHINTWORDTEXEND JLINSERTIFACEM'
zz=:zz,'D JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWTEX JLSHELLEXT JLTITLEFILE JLTIT'
zz=:zz,'LETEX JLWORDLITTEX JODLiteratePreamble LATEXTMP LF LONGCHRBEGPAT LO'
zz=:zz,'NGCHRENDPAT MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP NORMALTOKPFX PAND'
zz=:zz,'OCTOKPAT ROOTWORDSjodliterate STRINGTTOKPFX TEXTQUOTESINGLE THISPAN'
zz=:zz,'DOC UBARSUB WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAPPREFIXTEX '
zz=:zz,'afterstr alltrim beforestr betweenstrs boxopen changestr charsub ct'
zz=:zz,'l cutnestidx cutpatidx dbquote dbquoteuq fboxname ferase fexist fir'
zz=:zz,'stones formifacetex formtexindexes fsize fuserows gbodylatex gheadl'
zz=:zz,'atex gpostlatex grouplatex grplit ifacemarkd ifacesection ifaceword'
zz=:zz,'s ifc indexgrouptex indexwraplatex jodliterateVMD jpathsep jtokeniz'
zz=:zz,'e latexfrmarkd long0d0latex markdfrghead markdfrgpost markdfrgroup '
zz=:zz,'markdfrwords markdj markgassign markgnonj patpartstr ppcodelatex re'
zz=:zz,'ad replacetoks rtrim sethintblock setifacelinks setifacesummary set'
zz=:zz,'ifacetargs setjodliterate seturlsha256 srxm tlf toJ tslash2 utf8 uw'
zz=:zz,'latexfrwords wfl winpathsep wordlatex wordlit wrapQtlatex wraplix w'
zz=:zz,'raprgidx wrapvrblong writeas''),(<<;._1 '' jodmake DDEFESCS DUMPMSG0 '
zz=:zz,'DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 DUMPTAG ERR0150 ERR015'
zz=:zz,'1 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 E'
zz=:zz,'RR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS MI'
zz=:zz,'XEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEX'
zz=:zz,'T SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk ddefescmas'
zz=:zz,'k dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamps dumptext'
zz=:zz,' dumptm dumptrailer dumpwords extscopes fap fmtdumptext fromascii85'
zz=:zz,' getallts getascii85 halfbits htclip jnb jscript jscriptdefs makedu'
zz=:zz,'mp makegs masknb namecats nlfrrle nounlrep opaqnames parsecode pref'
zz=:zz,'ixdumphash putallts rlefrnl sexpin sonl tabit toascii85 uqtsingle w'
zz=:zz,'raplinear wrdglobals writeijs wttext''),<<;._1 '' jodstore CNCLASS CN'
zz=:zz,'COMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNJVERSION CNLIST CNMARK '
zz=:zz,'CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052'
zz=:zz,' ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR'
zz=:zz,'062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 '
zz=:zz,'ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR0'
zz=:zz,'82 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 E'
zz=:zz,'RR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR10'
zz=:zz,'1 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 ERR108 INVGROUPS INVMAC'
zz=:zz,'ROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054'
zz=:zz,' OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 '
zz=:zz,'PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable '
zz=:zz,'appwords backupdates badcn bchecknames bgetdicdoc bgetexplain bgetg'
zz=:zz,'stext bgetobjects bnlsearch bnums bpathsfx btextlit checkback check'
zz=:zz,'ntstamp checkopen checkpath checkput closedict createst defwords de'
zz=:zz,'lstuff delwordrefs didstats dnlsearch dupnames freedisk freedisklin'
zz=:zz,'ux freediskmac freediskwin fullmonty getdicdoc getdocument getexpla'
zz=:zz,'in getgstext getntstamp getobjects getrefs gslistnl hashbchk hashre'
zz=:zz,'p inputdict invappend invdelete invfetch invreplace islib iswriteab'
zz=:zz,'le iswriteablelinux iswriteablewin jdatcreate jwordscreate loadalld'
zz=:zz,'irs loadallrefs loadwords mainddir mnlsearch newdparms newregdict n'
zz=:zz,'lctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref'
zz=:zz,' putdicdoc putexplain putgs putntstamp puttable puttexts putwords p'
zz=:zz,'utwordxrs rpdtrim rplctable rplcwords sortdnub splitbname''         '
zz=:6825{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1b^%0+>P&q+>Yc-2'=e"1,(XI+>GSn0f(^D1*ALu0fC^@+?1K#0JP=tDe)U0/g)WYDe'u#/M/)^
@;0U%8l%htA8,OqBl@ltEd8d;CghC+/e&._67r]S:-pQU6#:?[DffZ(EZen,@ruF'DIIR2+Cf4r
F)to6+CT;%+D#e>ASuR'Df0V=De:,6BOr;sBk)7!Df0!(Gp$U5@<6KB%15is/g+,,AU,D,Cht5:
F(HJ8FCB&t@<,m$@rH7+FCB'/F!+n/A0?&,Eaj)4A7]@eDIm?$Bl5&8BPDN1@r,RpF"Rn/:-pQB
$;No?+@C0\@<?4$B-:V*8l%htDdmHm@rri(AS,XoATJu&+=Lr=De(:>Ci<flCh4`'DKKH1Amo1\
/e&._67sBKATMs6Dg?&7B-:V*8l%htDdmHm@rri)Eaa$#F!,R<AKWC8C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQB$;No?+@C'bFCAm$F#kFSBk)7!Df0!(Gp%6OBl%L*Bk;?:+Cf>-F*(i.FE8uU
Bl8$(Eb8`iAKZ/-Eaj)!$;No?%15is/g*`'FCfK)@:Nk0+=MDEEaj)4D.-sd+CTG%Bl%3eCh4_u
Gp$g9De'u,De!3lALS&q:-pQU+<Y*%Fs%nM+<Y*/C`m1q@r$4++Eh=:F(oQ1+DtV)ATJt'$;No?
+<Ve9B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2$;No?+<Ve9
DJUF<+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"
+EqaEA90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,Oq
Bl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:
Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU
+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-
+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKq
F!)SJGAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-h
FCcS'DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5
BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@ltEd8dF@;TQu
Ch[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'DIIR2%15is
/g)8ZDe't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!CLeP1+E1b!
CER/%@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)
ATVL(@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/ltF*(u6+CQC'
Bk)7!Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k+C]U=-u`U)
CLek'$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdL
GAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@
D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EO
BkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,eEHPu9AKW@8
Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlotDBO%7BlbD<
ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h+F5/HDe!3l
AKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ:*<P35tscj
8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0AKYQ%A9/1e
9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQUD.-ppD]j+2
EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#AISuA67sBh
DIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a;Fs\a4ZY>Q
%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK9gMZM6r-lZ
4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I]:g$O[4ZYAS%15ct
5u'R(1G]II>"M4I3\rT%$4R>;67sBt@:O=r+EV1>F<G[NE+O)"$;EfR;GU7p:dmN.8lJ)T8PiA;
9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q;qq=]@pf:+T=@9Ire7:JNH4:g$O[
/5/Ju:+TR?7h#e7$;No?+E(_(ARfg)@rGmhEt&IX:JsSD3\V!M<(0_b4ZY;,$:dui<DYh>1(=Rh
<Cp.Y4ZYA.$;EfR;GTG:1^sd$$;No?+Co1rFD5Z2@<-W9F(K0"+ED%*ATD@"@q?)V6qKaF8P`)I
;HZ.D2%9m%$;No?+E(_(ARfg)DIIBn+Cf4rF)rlTA7]^kDIdfL+BM?:6nD;+;cG;<;GU:h/5oP?
<(/?45snOG%15lt8ju*H:.%0*=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$4R>;67sBi@:UL!
@VTIaF<G(3A7[;7A7]^kDIdfL+AY<r771$L6OaB3@:X:cC-=U^3Zp",+BplL.P<@s><3lX+C-+$
/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&+=84M@<?0*E-6&.FEM#6
Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O6V(*R4ZXr53\E!3/5SW3
845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^kDIdI!B-;,1+D>\7F<F@X
%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h4Wn#ZI45U4%15is/g+_M
FE1f"FE8RCDJXS@FD,5.E+*j%+D,Y4D'3h@@;KXiBk:ftAnc'm+DtV)ATJ:fC3=T>E+*j%4ZZe.
+FQ9n>p(A@+=LGT+>#2g><3lW/h^H^+=B2t-9We#.P;iJ3Zoq*03g+P:dJ&O6q'cr4Uh`-$;No?
+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQUC2[X(H#n(=D/`p*BHV#1
+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,XoARlotDBN\4A8c?<Bkh\u
$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.C2[X(H#n(=D/`p*BHS[;
De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*F(KB%Df00$B.dn5F!hD(
%15is/h1FMA7T7jASu$iDKKq/$>OKiA8bpP67sB1C2[WnDdji!/M/)UBl[cpFDl2F+E(_(ARfg)
@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F*)>@ALT5@$;No?%15is/g*PrEb/a&DfU+GDdmHm@ruc7
@<,p%@rc-hFCeu*GA(Q*+Co1rFD5Z2@<-'nF!+n3AKYo1ASu'i%15is/g+S?A0>DoF*)G@H"CM/
GA(Q*+EV:.Gp$O9AKYK!Df]K#/g)9)Bl[cpFDl2F+E(_(ARfh'+Cf>-FCAm$%15is/g+RFF(KG9
De:,0Dfor=+CT.u+Eh=:@WNZ6BOQ!*D..<jB4W28/no'4+D,>(AKYMtEb/a&DfTQ'F"Rn/:-pQB
$;No?+A$HmATDBk@q?d#Dfor=+=84SATD7$3XlEk67sB'+=M)8DL!@BDfor=+CT;%+DG_(Bl[cp
FDQ4F?XFprAS,LoASu!hA17rp:-pQU+<Y3,@r-()AKW*<+<Y01Df]J4A8,OqBl@ltEd8d>Bl%>i
$;No?+<Ve;AoDX"DBL&E+<VeFE+No0A8,OqBl@ltEd8d>Bl%>i$;No?+<Ve;AoJk8+<VdL+<Ve;
Bl[cpFDl2F+D,>(AKYr#FD,_)$;No?+<Ve;DI[Q,+<VdL+<VeE@;TQuDe:,/@;0U%A8-'q@ruX0
Gp$U8D/aE2ASuT4DJsZ8%15is/g)8ZA8Z+++<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8dA
DId='+Du+?D@HqJ67sB'+CoA-@ium:+<VdL+DtV)AKYo'+Cf4rF)rIADfoq,$;No?+<Ve;DJj;6
+<VdL+<VeMBldutCh4`-@VTIaF<GI0D.Rbt$;No?+<Ve;Ec5o-BlY==+<Ve<Eaa$#+Co2,ARfh#
Ed8dFDfor=%15is/g)8ZA9)U-DIXe3+<VdLATD4#AKYK!@<6KCFEqh:+Du+?DK?6o:-pQU+<Y38
DfB`.Afr3=+<Y69@<6!&Eb/ioEb0,uAKYl/F`)70$;No?+<Ve>ATW$8FCB$*F!)TGART+j+CfG'
@<?4%DBNA*A0>\sF*)ADF<G+&FCcS:Bl.F&FCB$*Et&IO67sB'+Dbt)A7TCp+<VdL+Dbt)A0>Ds
Eb/a&DfU+4$;No?+<VeCDdd0o@ium:+<VeCDdd0!GAhM4+CT.u+DkOsEc3(1CghC+06DJYATJ:f
:-pQU+<YK=@:XCiAfr3=+<YK=@:UL$AS,LoASu!hEt&IO67sB'+Dbt)A92j$D/aP=+Dbt)A0>u.
D.Oi2FCB$*Et&IO67sB'+E1b!CLh-hF<D\K+E1b!CNCV/Bk)7!Df0!(Gp$O5A0>r%G%G_;Derr,
Anc'mF!+n4+CQC%@:O(qE"*.L67sB'+E1b!CNFH'@q?c*+EV19FE8R:DfQtAF_56"@qfLlF<G%$
@r$4++EML1@q?)V:-pQU+<YWGFEDSG@;Tt)+<YfGA79Rk+DG_:ATDm(A0>B&ART[pDf-\+DIal+
@<6O0F`\aJBl.F&FCB$*Et&IO67sB'+ED%7FC])qF<D\K+ED%7FDl22F!,=<F*&OFARf:hF<G%$
@r$4++CfG'@<?'k+C]U=-u`U)CLh-hF=@Y+:-pQU+<Y]9F*)JB@:Njk+<Yc;F*)IGAoD]4F*2),
Bk(jgDKI"AATMs3Eb-A7E+*6f%15is/g)8ZF('6'A8-',+<VdLF('6'+Co2,ARfh#Ed8*$:-pQU
+<Y`6G%G]*Afr3=+<Y`6G%De:AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@
D.Rd0@:s.m+=KiX6tC4F+ECn.B4W2@0JG(61cZuo$4R>PDe!TlF)rHO@;9^kA8bp)%16T`Bl8!'
Ec`EO@;9^kF*)>@AL@oo%15is/h1CCE+NotASuU2+F#Ii+A,EtA8bp"A7]^kDId<rF<G+*Anc-s
FD5Z2Et&Hc$;No?+Co2,ARfh#Ed8dFDfoq?DIIBn+E2@4AncL$Et&IE8Q&;X;a!0(4"akp+=A:5
:JsS'<(0_b+@f=*<DXf:<Cp.Y+AG-h;GSYL$4R>;67sBkBl[cpFDl2F+Du+?DBO"CAnGb%ATJtG
+E):2ATAo1@<?U&EcVZs6r[)V=@5hH3]oJV?SNZN+B28^8Q[*&:+$JX%15is/g,7MD.Rd1@;Ts7
+DG_(AU#>6BleA=@;]Tu@rH4'Df0-(F<GI>F`&=>@;TRs%14LF3[[<e;H-R;6qL9J=<L"';F=2,
.6T^74<cL&Ho`B<8Q&;X;]mV</j:p26r[)V=@5gm$4R>;67sBu@;TQu@r,RpF!+n/A0>_t@rcK1
FEqh:+Du+?DBNh*D.Rbt$:IH`:.%0*4?G0&0d%hd=&2^^:.$-u5snOG:.$B<$4R>;67sC$AS,Lo
ASu!h+E(_(ARfh'%15Kp;GotZ4ZY\e/mg=U-QlJd;FFDO7NbZ!;cHX`7OJWP%15is/g,1GAn?!o
DI[6#FD5T'F*(i-E%E,GDId='+Dbb5F<G"0A0>B#D/aE2ASuT4DJsZ8+DtV)ATJ:f-p'I;;FO&S
;]nt,7S-]);FO&B:+%JR3ZpO/0d(j)+@Je!;FXD(/1)u50-EY^;b:(Y:(7O>$;No?.V3L.A7]^k
DId<rFE;28A8Gt%ATD4$APPQE.V`m4Ch\!&Eaa'$+EK+d+D58'ATD4$ATJu1Blmp,@<?''F)Q2A
@q?cmDe*E%A8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;8l%htB6%p5E-!W@$;No?%15is/g,=KEaiI!
Bl,mRF(Jo*FD,5.AoDL%Dg,o5B-:Z"DeC23Df^#A+CT.u+D5D1BQ[c,Anc'mEt&IO67r]S:-pQU
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,
@<?'4C2[W9%15is/g+hLFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+8
0/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.j]$:-pQUBQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5
E+EPi$;No?+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!
Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@LWZ>67r]S:-pQUBl8$(Eb8`iAKZ28Eb$S>
.68R\$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+<XWS8Q/GO:..lF+<VdL+>"^JF_kk:E+*Wp
Ddso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?/l$;No?+<Y97Ec#N&@:NkjAU#=?
+>"^JDfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA9/1e:-pQU
+D5_6Ch[u6+<VdL+<VdL/Ken=CLnW)@<?(*+D,P4+D5_5F`8HOGps10:-pQU+DGFr@qB^m@ruF'
DBL&E/KebFFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQU+DGFt+<VdL+<VdL+<VdL
/KeYDEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;+$;No?+<Y`:FD>`)Ch\!&Eaa'$+>"^TEb02u
Eb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m%15is
/g)9ZGAL]0AU%g-GAhM4F!*%WF`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GB
A9/kT3[],_+Eqj7E$0:9Cj@B;$;No?+<YlHEb'!#F<D\K+<VdL+>"^Q@;BEsCghEsGT^U=Df$V@
DfTA2Ch[s4+=MLa%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp130f!ZWF>,EY$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GWi@rsC\+=MI`+D5_6Ch[u6
@<-"'D.RU,+CSekARlp*D]j+DE,]i/F)rIEDf9_?FCf\>Dg#]4GB.D>ATJ:f:-pQU0f!ZWF>,No
B6%p5E$._A5sn(B:JsSZB6%p5E,K*$AKYZ3E+O'+Bl7]tA.8l@67sB812gZE0JstnAT2Ho@qB0n
4$"L'@<-F'DJ()9Bln#2.!K9>.3L2bBOPdhCh7Z1@UWdiC*7#)A7Z2W:-pQU0f!ZWF>,Zs@:Wn[
A0>H(Ec5t@BOPdhCh[d"+>"^VAT2Ho@qB0n.!K]GFCcmDGA2/4+=MGSBlmopF"%P*:-pQU0f!ZW
F>5Km@:X+qF*(u(+A?3CAQU'oEb/Zr@VfTu/KeP:@;]^lDJ()/Df0K*Df0Z<%15is/g)l(De!lD
1*C"9A7]9o.!&j>Deip%F"&4`+E_a:Ap%o4AoD]4@;]LiH$X1BB-:]&A7Zm*AU&;+$;No?+>GWi
@rsFa+CSekARlo3GB.,2G&h&.Df02:+>"^PDf021F)Q2A@q?d!Bl7L'+Du+A+Eqj7E,]B!%15is
/g)l)A7]7+3?Va@A7]9oFDi9MC11UfF"&5%Bllmg@N]]&E,Tf3FDl2F%15is/g)o'D..]D2]uO>
C3=T>ARlp-DfTA2AoD^,@<?4%DBL?OAo&n=AoD]48g$,H0JO"D:-pQU1,*QRGq_3#F`:l"FCeu*
AoD]4@s)g4ASuT4-u`U4A8bs,+Eh=:F(oQ1Et&IO67sB90PY`J0K1+_A7T7^+=Li?Ec#N&@:Nkj
AU#XHFDi:9DKKH1Amo1\+EqaEA9/1e:-pQU1,*TaFtbWn@:Wn[A0>N*@;omo@ric$DIal(DI[L*
F(oQ1F!,OH@Us1nARfh#Ed8dLD]j">ARTFbCh4%_:-pQU1,*TaFtbWn>[h8WBl89.De!p,ASuU<
+Dl%?ARlp*D]j(=Dfd+6Bl%?'AoD]4:Ng;i9P%XE/n8g:%15is/g)o'DJs\P1a"2fATV[*A8Gt%
ATD4$ALSa3Ch7$mATAo7@rc:&F=\PCF`_;8E[YuX/0JM@@;0O#@:Wn[A.8l@67sB90Q(fP0esk"
E,]<*A7]RcFCf\G+CSekARlp*D]iJ!C3=T>+Cf>+DfTQ0B-;,)+Eqj7E,]B!+Dbb0ATJ:f:-pQU
1,*6M@k]V[.!9`M@<?(*Ao`*6Eb'5?+CSekARlnm$;No?+>PZ^ARdJM+=KiU6VKp7:/jYaF`(o<
/0IPY6<-TN6rZTWF`(o</0IPY;b0>N9LW&_.3N&0A7]9\$;No?+>P]\F_<Bf+=M;BFD,B+FCK')
@r!M9@:Wn[A0>u4+=LlCE,961.1HUn$=e!aCghC++<W%?C2[X!Blmp,@<?'.%16T`Bl8!'Ec`EO
BkhQs-OgCl$;No?.V*+0ASu$iDKKq/$;No?+Co%nCgh?qA0>N$Ddm-k+D>>,AKZ)5+CTG3Bk/>r
Df000F(oN)+A?3CAQU'm@;TRs+EqOABHTniDIIBnEt&IO67sB/.OdMA+A,=,8Q8AP<(0n38k`#]
8OZ][79C[)9L;`N9LMiK=<L407oE/W8Q8YX=<L40=&2^^9M&2_79CZA$;No?+=J]g4ZX]X:IIlj
FCfK$FCe9hARTFbCh4_]9LDKB5u(BJ=<L40;b0>N9LW&_+A,<o<CokP<(0o3DJ=>)$;No?+=J]g
4ZX]X9LDKB5u(BJ=ESLqGT]UP6<-TN6rZTWGA1q;8k_TG76s[J79FbJDBKAq%15is/g+&1B4Z*+
89JVoF!,[FEb$;)DfT]'FD5Z2+EMX5FCcS3@:NtbDIjqB+EM76Bl%KlEZfIB+?MV,@Wcc%$;No?
+E1b0F(KD8FCf]=+EqOABHTu<F"AGSATV?pDK?qEBPDR"F)YPtAKYE!A0>PoDIdQpF!,C?ASrW1
F`2A5F"Rn/:-pQB$;No?+Eh=:@UX@mD)reWDffP5A8,XfATD@"@q?)V:-pQB$;No?+<VdLG@kY=
.k`#Z/g)o*+>k\m-RV\d78=t&<DQR_-OgDX67sB'+<Wa,-S$hmBeCM`1E\P++=AO4:dn,%;,pCk
74/NO%15is/g+hAA7Zm)@rc:&F<GC<@ps1p+<`-_.6T:+D.[T,F(T52%16raCcsBn1,Us80H_J\
+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+BTb)FD,6+%16raCcsBn0d%Se3@nSkBeCbU-Rg/\+<VdL
+<VeTD.[T,+AP6U+B'D,BPDR"F)YPtAKWCBE+*6f+CT.u+D>\6BmO]8FCAu.FCAW-%16raCcsBn
1*@\f/1=pZBeCc!@4*KS053$o2CTbsD.[T,+AP6U+@.,9/Qs9*/UAONG[kQ4A8,po+AO%G%16ra
CcsBn1E[eg@4l7H-Vc$<+<VdL+<VdL+<VeTD.[T,+AP6U+AO&$BOr<&ATW$*EZe*d$>jBk4Y@j6
+<W(@/nlpc6743)+<VdL+<VdL+<Z)LAo&S4:-pQU66LA`AKYf#FED)7+@6MED.[TI/g*"o+=LYN
BeCbe0etOA2)[BQ3F=-_+FS*=C`jiq67sB@+Co2!BlnD=@;]Tu?O[?ZAo'U_+>t>b-t+`B/gi8!
.3K`U+<VdL+<VdLI;NS4+<XEG/g*P)/e&/)Ao'U_+?(Dc-t+`B/gi\-.3K`U+<VdL+<VdLI;NS4
+<XEG/g*M(3XlF5Ao'U_+?1Jd-t+`B/gi"o-Rg/\+<VdL+<VdLI;NS4+<XEG/g+"6EHQ2AAISu`
Ao'U_+?:Pe-o!M,+<VdL+<VdL+<VdL+<VdLI;NS4+<XEG/g*MZ%16raCcsBn0ea^u0eb%!+<VdL
+<VdL+<VdL+<VeTD.[T,+AP6U+A>66$4R>`Ao'U_+C?m0>TtmFI4c]r4"akq+=Jod3Zp+*%14I*
=<J_/+<XT*+<Vdm+<VdL:*:Z%+@71n+<WZe+<Vdp+<VdL6QdKo+Aj7(+<X$L+<VdL+A>6I+=CGK
%1444+>Fu]0esk++<WE^0d%Sp+>Fu]1*A:o+>t>s+<WB]0d%Sn+>Fu]2]sgt+>GPm0d%S]0d&1n
+<XEG/g)hj+DG_-FD50"%1444+>P&^0esk,+<WE^1*@\q+>P&^1*A=p+>t>t+<WB]0H_Jm+>=o\
2]sju+>GPm1*@\^0d&4o+<XEG/g)kk+E)@8ATA4e+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn
+>=o\0d&.m+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU1*@]JCiD%FF_qQp+>Fuo+<WBo+>P&^
1*A7n+>P&n+<WK`0H_Jn+>=o\0d&.m+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU1E[f8%1444
+>P&^0esk,+<WE^0H_Jn+>=o\1*A7n+>P&n+<WNa0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG
/g)tn+AP64$6V>O0H_J\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+>Fum+<WB]0H_Ju+>=o\0ea_*
+<Vd]+>P&^+AP6U+>k8a:-pQB$6V&G1a!nq1E\@o+>t>r+<WQb0H_Jr+>=o\2BX[r+>t>r+<WB]
0H_Js+>b2`0ea_*+<Vd]+>P&^+AP6U+>t>bDKTe*$6V8M0H_J\2]sds+?(Ds+<WTc0H_Js+>=o\
2]sds+?(Ds+<WTc0H_Jt+>=o\0ea_*+<Vd]+>P&^+AP6U+?(Dc-OgD*0d&4o+>GSn1*@\p+>P&^
1E\Fq+>P&p+<WQb1*@\o+>P&^0d&4o+?(Ds+<WBm+>P&^+>Fuo+<Ve%67sB?+<W$Z%144<+>=o\
+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*.s
+Cf>,D.RU,%1444+>P&^0eje++<WE^1*@\r+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm
1*@\o0d&.m+<XEG/g)l&+@B$9$6V&G1*@\o0d&4o+>P&p+<WK`1*@\p+>P&^2BXat+>Fuo+<WB]
1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GSn6W-TI%1444+>P&^0esk*+<WE^1*@\q+>P&^1*A=p
+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l(+EML1@q?)V+>Fuo+<WBp+>=o\
1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0f'qnE+*6f
+CSl(ATAo2F_qQp.1HUn$;No?+EqaEA0>K&Ec#6,Bl@l3AoD]4Ch[cuEt&J#Ao'Uk+=Jp*F(T5M
D.[T5+=83m3XlE*$;*u[8Q%uE<)6Cp4ZX]5-OgCl$;*uj84?3G79EMP3ZpLU7TW/VHTO89F(c\*
@<<k+$4R>;67sC)Ea`p+ARlp"Bl7K)E,oN%Bm:'o=&M=\9LV684ZXrS/hT=8%13OO:-pQUE+*Wp
Ddso3Ea`j,AoD^,ARlp-Ea`p+ARlp"Bl7K)Ch7$c+EVO;ASqqa5tj^F<)cXd=&M=\4ZX]5>X<1;
Ecb9!CO7E[=&M=\9LV68/15in%15is/h1FMA7T7jASu$iDKKq/$4R>;67sC%BOu!r+EM%5BlJ08
+EV:*F<G.8@<6!5@WcC$A0=QS<+T/SAnc'mEt&Hc$;No?4?S(AIXWDd+>._K+FO\+8k_QO8PDNO
79F\MBm;d%+>=p!+>=63,9V&=EHPi1@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk
6q.Um,9UE9F*2>2F!,:-FCf\>AU%d-+CT;%+E)-?FD,5.GAhM;Bl7Q+E+*j%%16oo@;K@oAU#=?
INs;SEc6)>INs:N$>j3eASH$mAU#>H,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQX#
F^])pFCf\>+FYPaB6%p5E.0$\%14Nn$4R>79LDKB5u(BJ=ESLqGWe)10H`D!0F\@6+ED%1Dg#\7
CghEsGV=/MGT_*>D/^V0Bl%@%%17,m+=]!PFa+?&EbupK/n/:+%17,m+=]!SG%hBmEbupK/oYk@
$?Bu+.P>FGGRY"#D'1;\Dfp.2$?Bu+.P>OUB+52gD'1;\FDkXu$?Bu+.P>OUAdo)fD'1;\Ci=,!
$?Bu+.P>OUF:ARtD'1;\Bl7Gj$?Bu+.P>FOB+52gD'1;\@VfZd$?Bu+.P>@[%14Nn$;No?5!FFE
IXV_5%15is/j)7FIXZ_gHQXqM@<<W?%15^$6<-TN6rZTWGA1qX3Zp+!3Zp*c$?B]p+EM+6F_,H#
AKYo'+DbJ.AU#>-Df'?"DIdf2FD,*)+D58'ATD4$AKXf;7L]]FASiPuF)uJ@ATJu1@<?(*+D#e/
F!+n3AKYo/+EV:.+EqaECM@[!+E1b2BFP;iATVa,@ps0_$=dTh04Z1OIUmCO%16oo@;K@oAU#=?
INs;SEc6)>INs:N$>j3eASH$mAU#>H,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQX#
F^])pFCf\>+FYPaB6%p5E.0$\%16ZaA8H0o@;HA[.1HUn$;*uZ9LV6B<(0o5Bl6'p+>=p!+>=63
Eb0)1Eb0*+G%De4@<?(*06CcM+EV13E$/b,Ch7Ys$=m^a+=]!PFa+?&A7]R".P>1>C^g_^AS`J=
/nB->%16WWC`k2[E,uHqA7]R".P>FGGRY!jAS`J=/oPlS%16WWC`k2[Ci<qq$=m^a+=]!cDds4`
A7]R".P>OUAdo)XAS`J=/o5HB%16WWC`k2[Ci=D)$=m^a+=]!XDIa1`A7]R".P>FOB+52YAS`J=
/n/X0%16WWC`k2[B6k!oA7]R".P>@[-t7=?Gps10.1HVZ67tGcIXZ`p%13OO-o2u,+>>5l-OgDs
AhG2K+<Vdu7TW/V+<Y35/e&.1+A,<p9LV6B<(0nP3Zq$g6VKp7:/jYaGA1q($6UH`9L;`N9LMiK
=?S\f8k_QO8PDNO79FbJDBL&2$>"$pASGa/+A#%&:.\P1A8a(0$6UH`9LDKB5u(BJ=?S\f8k_TG
76s[J79F\MBm:'o+<X9M6<-TN6rZTW4ZX]X9L;`N9LMiK=ESLqGT[G&AScF!BkAu.D_;J++<Y`B
Dfp/@F`\`R8k_TG76s[J79D389L;`N9LMiK=<MZpEbTK7F!,@=F<GX9F=.M)ASu$2%14Nn$4R>;
67tA_IXZ`p+F>4`CghEsGT_DD$4R>;67sBnEc6)>+EV=>Ch4_tDIakuF`_;8EZcqVF*(i.A79Lh
+C&blCLqU%FDPLt$;*uk8Q8AP<(0nP3Zp+!3Zp*c$7-g2@<?(*+CTD7BQ%oB+EV=>Ch5.?DfBf4
Df0!"+E_^@+CT.u+D>2)BFP;R@<H[*DfU2R,CX'DFD,T5INs:a-!X[a$7/q^%14CdF)>?%C`lu*
Ebp)O,CX?AF*2M>INs;i+C&.\$7/qhDf9`8DffQ3BmO>5>]aP%FEDVO;b02+1,UsN+FYPaF(eu;
2)]n.IXN>DDJsQ4@;L"!H=[NmI16NgFD5i5AU@[(AU&<=FF/H]IV3\>F`;dSIXN>/Ec6)>I16N4
%13OO:-pQUB6%p5E$0(BATDs.ATo81ART+\EX`@J9M\\\79<GW=?S\f0H`D!0F\@8+EV:2F!,49
A8Gt%ATD4$AKYo7ATDs.ATnRj>]XIdFD5Z2HX(Z(G]\%LH[[2gB6%p5E.0$\I3;=/ATDs.ATrP3
$7QDk%15is/g+eIDfp"AEc5l<+EV1>+>"^GDesQ5DK?q;@<iu5AS#Bp@:X+qF*),6B+52?9LhuW
9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRCB6%s-BlkdHCghEsGT^U4Ch54A-tdR>
Ch[u?+D58'ATD4$ATJt<B6%p5E$>_u,p7)6D.R6#G%G]8Bl@m1+E(j7FD,B0+D,>(AKYT'EZeq%
@qZuW:IH=<Ec6)>+DGp?E,ol,ATMp(F"Rn/%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZL
I16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%:_E-68LINs;SEc6)>INs;`Bln0&/p(ZLI16NgD..3k
FD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$4R>IDIn$2@:s-\$7-g)Df'?"DIdf2AoD]4@:X+qF*),6
B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+
B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%14Cd
FE_Y5DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIW'CDATobKAU&V4$4R>IDIn$2@:s-\$7/qqDIm<r
CisT4%16?SDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgr
Df-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1
FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%14Nn$4R>;67sC)DfTA2Ch[u6Ec5l<+EV1>%15^$=&2^^
9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRCGAhM4Ch[u?+DbJ.AU#>0Bl%?5+:SYe
$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO>[h8WBl89.De!p,ASuU<%13OO>]++s
E+*Bj%13OO,p6]9D/E^!A9/l*DfQt/A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;
+CT.u+DG_7ATDm,DJ()#+EDU@AIStm>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$7/quATVa"
DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;$7/r!GAgu0CisT4%13OO-!YA+ARfXpF_u"*$=%:_
E-68LINs;`AU&*$D.S/@IUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"M
A7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up
$4R>IASu%*A8bt#D.RU,I16N4%13OO%15is/g,">Bl5&.De*ZuFCfK$FCcRg@8pf?+E2@4@;TIi
AISu=:IIljFCfK$FCe9hARTFbCh5aj+>=p!+>=63,p6r@A8Gt%ATD4$AKYetFCf\>E,oMuD.7<m
/g(T1,p3X(,p60#BlbD/Bl%?'BlbD*+D>J%BP_r:@s)j7Df'37ARlp,ATDj+Df-\9Afu2/AKYr4
ARTFbCh4%_,p7&5FCfK,@;I'!ASu("@<?'k+C]U=E+*WpDdt/9+>%XWDfBf4Df-\ABOu'(E,ol-
F^o-'B-7Wj,p4g^AU#>9F`_SFF=n\T@;]Uo@j#H!B4u*qB4uC$DJ()+F!,CEATDg*A7T7h+CT.u
%14C(FD,5.F*(i.A79Lh+DG_(AU#>3F!,L7A7]@eDIm?2+:SYe$=%+[@s)X"DKKB)@<6Ko0f!]i
?$g"#FD56$AUP!p%16?_F(K<!@r#LcAQrtZDIdfu@;od`HY6o.D.Rg0H$p,/>]k+!E+*6l@:s.U
BOtU_Bl7R)?$g1+Ci"'!B4ZK#$=%^pAT2'fCLLjeHYdP;A7]e!I16NgF`V,5@:O(]B4ZEuD0'cD
D.5&)D0'Q&FD-(3$=%^pAT2'fCLLjeHYI):ATVL./88^4F^]B'G^U#.%14C(E,ol?Bk1dr+C'#"
G]\"L@WQ%"BlJ/'$=%^pAT2'fCLLjeHY-u:CijnWAUP[1$4R=g+D5_'E+irqF!,17@r-:/Bl@m1
%16?_F(K<!@r#LcAUA'1@;omo@sBPGF^ersB6A6+/9>N9ARf.fI16NgB6%F"BPCstE+*j%H[@@u
Bl7EsF`V88DK@IZI16Mm$7-g;F(HJ2Bk)1%FEqh:+DGF1@<Q'nCggdhAISuO8S1G+Ch6%[BleB;
HYmJ,Ec6&FE+LYCFEr:]>]k+!E+*6l@:s.uD/!L#Dfg8DAUSuRI16NgBkD7*D'1N;BkDU$FCf\>
0jJ=)>\RedF^]B'GT\_GAnaC^+=/.EAfu&'AoqU/%144#>]k+!E+*6l@:s.UF`_4T?$g:'E-686
DI\)($=%.YF(HI?+DGF1Cis0.AU#>9EZfU<CghEsGRY!&+C'&1AT2'fCLLjeHY.26FE;D4@sndn
+<Xp'Ap@m/AU"Xk+<VdL>]k+!E+*6l@:s.uG\hJHFE1e@G]dn<@rGmhI16N++C&Mm%144#>\%DX
@<HC.AoDR/An>CmF`M&7HVIpfE+s3&4`k7[/TbQKF=^@#@;KL<9jr-RBM<>gATD9hF(Kb/$6UH;
+ED%4Cgggb+@T:.:K9b)GA2/4+E_R9@rGmh+D#\9D]iP'@<,ddFCfJ8%144#,p6o6+F.mJ+Dtb%
A0>u-BlbD,BOPpi@ru:&+>"^XBOr<*Eb0<'DI[6#De9Fc+<VsQFD,B0+EM77B5D-%@q]:k@:OCj
EZf(6+EV:.+E2@4@;TIiAKYT'Ear[%+E_a:+E(j7G\(]"FCf\J+Dc1/CghEsA.8kg+=191ATqX&
D/E^!A:%QmF`MDKHUUq4:K9c1+<Vd9$6UH;+Ceht+EM+9+E)@8ATAo1Df0K7E+*6f+D,P0FE8R=
Afu2/AU,YDAKYE)@;0Od@VfTb$6UH;+A!\r@<?0oEZf14CLnVeDfp)1AKX?YA7Zl[Ec3(AAS!n3
$6UH;+D>k=E&oX*@VfsqF"Um3Ddm91@rH3;FEqh7Ci<s,@;on*0/>491+t=A06;&SEarZ4@rGmh
/T>`K/nf?DC^g^o+=196ATVd-DJs-*DKL4pEb/fVDf0KA%144#-!YM&FDYr6De<p*FF-r)F`Lu'
+@C'XAKXfiDg`'%>\7[Z$4R=g+Auc]AS,XoAKYet@V'A"Bk2=!+D,P4+Dbb5FE9MdDffZ(Ed)5=
ALnsGBOr;tDKTf-Eaa'$+E1b!CLLje+EqO9C`m4rF`V+'$7-g3@<--pEcW@FD]iV9FCf?#+C\o-
Df0).FD,5.Ch74#+DkP-B5)69%16?W@;BF_FDPN1FCfJt6$,G)B5)6ODe!p,ASuU:,n12(+C&qu
DIn$%Df'?"DIe*!5\t.UFD6.4$6UH6+F@@7ATVa"DJ+')HX(Aq@V'A"Bk2=!I=!e^D1-gA$@Q/r
@;BF_FDl87ATA4e>]k+!E+*6l@:s.uASuX-ATD4$AUP!p%14C(FD5B$FDPZ4F<G(3D/E^!A0>K&
EZf14F*&OGE+*6jDJ'Cc>]=_%G%kJu@rH4$@;]V&>]a[mBQS')F*)hW,n12(+C&u!FDPN+B67g6
>\S:kD0'9-I=!YeFF@D8ATVa"DJ+')HX(MuEcZ#1E.*'eE--MV%13OO,p6Z>Bl%<&A8bt#D.RU,
+DG_(AU"Xk>]k+!E+*6l@:s.uD..3kBk2I:%13OO,p6]9Ci=?8%16?_F(K<!@r#LcAU@p*Ci=?B
%16?NAS,XoARfXpDfU2GBOPF_@rH1%Ed`:47m_WN1,LsA1,LsA1,Lt=%14C(C*7#)DKKo;C`me@
Eckl6F`M&7+:SZ_A7]@eDIm<rCi=?@CLqd8@rH1%Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0
+D#e:Ch[BnF<G"4B6A'&DKKqBGT_8SD'3^=FWbi:$=%+QAnc-o@rH1%EdM>*FCAZtCi=?BHZEb.
I=!Y#0f(@7/i#F<0J54=I16N0+DN$:F_tT!EcW?T+CT)&+EVmJATJu8AS!!!/pM5L%16?NAS,Xo
ARfXpDfU28ARfmnDes?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HX^E)ASu!r
Ci=?BHZEb.I=!Y#0JG%3/het10J5=>I16NgA7]@eDIm<rCi=?@Ao)BoFCT6*DfU8QEbAj0HS@'+
0J"n10JG%3/iYS6%14C(C*7>2@ps0r@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM;0@<,jrCi=?B
HZEb.I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@F*)G:DJ*HtCi=?BHZEb.I=!Y#1GLF7
/iGC70J5%7I16NgA7]@eDIm<rCi=?@@rH4$ASuU"Des?4I=$!I@XWSW/i>O<0J5.=/2/\10msK<
,p7/IBl.R+Bm+&1@:XOmEaj)4@;]Tu@rH7"F`(]2Bl@m1%14CdA7]@eDIm<rCi=?@DffZ(Eas$(
DfU8QEbAj0HS@'02CpO71Gp^;/hf#.+<Vd9$=%+QAnc-o@rH1%EdM_HBOu3oDes?4I="j^6@F27
/2/V12)Tdk$7-g-Ci<ckC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@@;KLqFCT6*DfU8QEbAj0
HS@'41b:=50fCR:/ho84%14C(E,oZ0Bln'4AKXSfG%G]'F!+n/A0>c.F`&=>@;TRs%16?NAS,Xo
ARfXpDfU2:F`(]!Des?4I=$!I@XWSW/het10J5%5/2/\10RY&d+<Vd9$4R>IF`V,5@:O(]B4ZF%
@;]S#G&h&?%16?.AS,XoAQ*8\Ecb>nEai6_Df'?"DId6j@<-EP>[1N\>^]n)>^Ur/$=#u1Anc-o
<b6;\@<?4#7;d9_Ec5i4ASuU:882^MCh[NqFD5W*I=#"+EaiI!Bl/9F@rH4$@;]UcBOPq&4^;5s
HX(uI%14C(6"FLK-S/kJDKKr6H=]6EF)>?%CaU?;DfQt;DfTD3@q]:k@:OCjEcW@BATAo0Bl7Jk
$4R=g+E1b,A8bs#B4YslEaa'$A0>r=DKK<3+Cf>+DfTQ0B-:]&D/E^!A9/kF+DtV)ATJ:f,p6W:
AKYT!G\(D.Bl5&+ASu("@<?'k+Cf>#AKYH)F<G+*Anc-sFD5Z2F!,=.Gp!P',p6Z.+EM+9+EVNE
@;^?5G%#3$A0>u*G]Y'?DfT]'FED57B-:]&D/E^!A.8lNF`V,5@:O(]B4ZF%Ea`frA:4mo>]++s
ASu[*Ec5i4ASuU:;eTTMARp49I=$AO$=%I[G@PQ.D..<mHX'3TH$=1IA5mJ_I9SF3HX(Z(G][G6
Ci=?@CLqd8@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3,p7DMEbf_=@V'Y'ATAo;Bln#2;f?f!@q?cM
De*E%:i^I`$7/qpATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,Des?4HY[2<G@PQ-DfU8Q
HQt7nI=2P3>]++s@rH4$@;]V&>XW"B@8qMkAQ3S`I9SF3HX(Z(G][G6Ci=?@A79Rg@rH1%Ed`:]
,;FUpI16N0>]++s@rH4$@;]V&>XW.5<affDDejc*0jT-2FCf]=@rH1%EdM>.@s2@#Ci=?BH[?tl
I=6MQ$=%I[G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1HQt7nI38t+>]++s@rH4$@;]V&>XDk?APQ3C
COKDA?$fguAU&<,Des?4HX^E)ASu!rCi=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX'$VDdd`eDejc*
0jT-2FCf]=@rH1%EdMD7Ddd`tDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QKBOPp\Dejc*0jT-2
FCf]=@rH1%EdM;0@<,jrCi=?BHX(Z(G][D,H[?tlI=6Nl%16?XATqX&D/E^!A:%Q[FE2)5B2ieb
I9SF3HX(Z(G][G6Ci=?@F*)G:DJ*HtCi=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&pVD/Ej%FB!0o
I9SF3HX(Z(G][G6Ci=?@@rH4$ASuU"Des?4I=#4@AU&<2FF/?Z0n"IuI16NgDIn$%Df'?"DIe*!
:NU8]E`?smI9SF3HX(Z(G][G6Ci=?@DffZ(Eas$(DfU8QHQt7nI=34I$=%I[G@PQ.D..<mHX&jQ
ATDllDejc*0jT-2FCf]=@rH1%EdM52ATDm&Des?4I=#4@AU&<+Ap\kL0n"IuI16N0>]++s@rH4$
@;]V&>XijR@ruF'DH(OiI9SF3HX(Z(G][G6Ci=?@Ap&!$@rH1%Ed`:],;FUpI16NgDIn$%Df'?"
DIe*!7WiTYFD5Z2<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!;IsKTDf/9XEbf6,<,ZQ#>;9E1
HQt7nI16NgDIn$%Df'?"DIe*!7<3EeE`?smI9SF3HX(Z(G][D,H[?tlI=6MQ$=%I[G@PQ.D..<m
HX'<aEc#6$<,ZQ#>;9E1HQt7nI16Mm$7-fe:IH=DEbT*&FCeu*@<Hg/Ch[<uGp$U8D/E^!A9/l*
DfQt>Df^"CE,ol,ATMp,DJ()2@;]Uo@j#DqDImisFCeu*CghEsGRY!bDIn$'DK]`7Df0E'DKL4t
:II]nDfp"iART+\Ed`:_H[Q>1>]++sASu[*Ec5i4ASuU:8l%iODf^"sEc5H!F)u8?I=$BhI16Mm
$=%^pAT2'fCLLjeHY-](@sM`uEd\B(>]=+aATMs=Ch7s*@;]S#I16Mm$7-g*@<?''ART(^+E1b%
AISuOEb96.FF.8(D/a08>]amp@<m9L%13OO>\RepATVL.%144#>]k+!E+*6l@:s.UF(KH4@:s.m
BmO>RAmoLsALnrM+E1b%AKZ&.H=\40AS,XoARlomGp%?CFCf\+$6UH6+<VdL+<VdL+<VeLDJ<U!
A7[o9@;L!r/0H&X+<VsQF`(o'De*E%@WH$gCNCVBBOu'(F`V,)+EqOABHVP2FCf\+$6UH6+<VdL
+<VdL+<VeOATVL.?$g71E+O'1AS-?"$=%.YF(Gdf+<Xp3F(K<!@r#LcAQs:pBk)'lANb-UF_+j*
BR+Q.EcP`'I16NgAn_\]%16?RH#R>8F(KH9E-l&7ART@jBl7^-4`k^eALn8t+<VdL+<VdL+<VdL
@W-1#D..I#F$4VcF_**5$6UH6+<VdL+<VdL+E1k'@<H[*DfS!fI4Pg7+<VdL+<VdL+<VdLE+ER&
Bln0&4aVT.%144#+<VdL+<VdL+<Y04Ci=?1Bl7^-4`k^eALn8t+<VdL+<VdL+<VdLF`M;.Des?4
4^r5MALn8t+<VdL+<VdL+<VdLCh[d&@rH1%E]n8JB4Yt&@4Vip+<VdL+<VdL+<VdLE+EQiDfTB"
E]nb'+>=olI=2P3>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$=%X`FDPN+B67g6>]=+lF),K/
I=!kkF<GO=F`SZ\E-*4>Bl8'7+>IhWI16NgF(KH0ASu.&BR<uqD.Ra#ASu"'F*)G6FCT!4HS]5M
I39XY+E2@4G%GQ5+E)F7Eb9H1C`mP.DImku$=%X`FCT63DKKH1HZNb.DKTf,AT2a)I=!Yr%13OO
,p75>F(KG9CghEsGT^^<A7^!.FDi:EF(HJ9BQ@Zq+Cf>+F_u#;+>"^HAS,@nCige6F!,RKD[d%"
+EqL5@q[!*ATN!1FE8R=DBNb6FE8RCAfu;+F*(u(+E1b%AKZ&5@:NjkBl5&0@;]Us@ps=f%14C(
:/=hX3ZqjAC3=T>+DGF1Bl7HmGT^m4D.Rc2Ecl7BFDkf'FD,6++:SZ(+D,Y4D)reQFEDI_0/%Nn
G:m]?FCf\K@rH4$F`(o8GqO#UB.nFBATr67E+rf7E+j2TAj%stF?M?;1GoUK>]k+!E+*6l@:s.u
D09Z:Bk)'tI16NgD..3k@<?<sFED)7%16?\ASu('ASu[*Ec5i4ASuU:FD,6"DId='I16N++F@@-
AjCH^De!^%F_u"*$6UH6+<Ve35]UFWFDl&.@rH0q@;L!r%144#+C&JoF(Gdf+<VdL+<XoSEb0<6
Df0,rDesN9F_)!h+<Ve3An_\]+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!YeFF=T*+<Ve3
F(KH0ASu.&BR<uoDesQ5DKBB.I=!b-E--L;$6UH6,p6]2@;]^h+>Y-^D]iS%F(oZ+A0>c4D.7's
+E(j7Bl7HmGT^L7CisT4Et&I!+<XouAS5^pHYmnAFD56'Cib#O1OWJ4F(Jj'Bl@l=HX(9&A7^"'
@;TS(>n%,`+<Xp+@<--mDffZ>>YSXBAQ<\gATD9hF(JTjDId='DIIBnI3f=0+<VdL+<VdL+<VdL
HX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6>]aXnF)YQ#ATMs=Ch7s4Cgh$qI16N++<Xp1
ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16N++<Xp1ATVa"DJ+')HX(MuEcZ#1E.*'eE-*4ACiseA
0J5/#FF=T*+<Ve3Eb0&qGRY!&+<Xp*ATV0kFCf;o5\XbRBlmp'I3f=0+<Z#9ASu%*D09Z:Bk)'t
F+%;-AjCBJF*)><ARfXp>]4Lk@rH1+D/NTiCia/m@r,^bEc>H"AR&h]I16NgD..3k@<?F0BOu2n
$4R>ID..3kBl7HmGRXuh$7QDk:-pQs5(7s0IVNe3D..3k:-pQU.V`m4D..3k+CcuT+EM%5BlJ/:
D..3oDJ((=+Cf>#AKYhuDJ='4CghF"Df.TYAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g+,,
BlbD<F^eis@<6K4A7]@eDIml3F`_>6Bln'#F!,(5EZf4-CM@[!+EM%5BlJ08+D,Y4D'08p:-pQU
B6%p5E-!.1DIal2F_Pr/F"SRX8TZ(`CiaM;@rH7,@;0V#+Cf>#AKYT'EZee.@;L48Bl7Q+%15is
/g,%?D.Oi1AS,LoASu!hF!,17+A*c#DfTB0/g(T1:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84S
ATD7$3XlEk67sB'+D58-@;Kb%F!)SJ+<Ve>ATVu9@;Ka&FD5T'F*(i-E,uHq:-pQU+<YN0CLq%!
D/^U?+<VdLA9Da.F!,C1C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD
@;BFeF!)SJ+<VdL+DkP&AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+DtV)ARf.jF!)SJ
+<Ve:CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#AISuA67sB'+E2IF@;Kb%F!)SJ+<VeGF`_[I@;Ka&
FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8l?$;No?+<VeNFED)=F<D\K+<VdL+EqaEA0>;uA0>u*
F*&OHAU&;+$;No?+<VeNEb&g!Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^
A7Z2W:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*]nCLnW/@;]^h+>G`-
/MT7G.1HUn$=e!aCghC++=CT4De*]nCLnk&$=e!gDKBB0F<D\R@;9^k-OgCl$;No?.V*+0ASu$i
DKKqBGV(KiDdmHm@ruc7GA2/4+Co%qBl7X,Bl@l3A7]^kDId<r@qfLq%13OO:-pQUFCAg'+A,Et
+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\-OgCl$;No?
+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo$<L+k:fL.c
=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'@VTIaF:ARU
:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4AR]drCh.T0
B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5B6%r<4s2%%
+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3
F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17+EV:.+EM%5
@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7/12fP+DEGb
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@
ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE-QmANF<Db[
+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6DKI!K-XpM*
ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*ATD?m+EM%5
@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT7h#e7$;No?
.V3L.A7]^kDId<rFE7lu%16igA92j2Eb/!4/h1USA92j2Eb-A'/M/)dFDl2.B4W3(@VTIaF<G(0
@<6KN+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sBOBk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg
@UX=h04np7AKZ&>F*(u1+E_a:A0>u4+EMXCEb,[e:-pQUA8,OqBl@ltEd8dG@VTIaFE9&W;Isf`
@:O"hB-;;0BlbD,CghC++DGm>@;Ka&FD,*)-Z]_(:-pQUEb065Bl[cq+EVNE@q]:gB4W3-BOr;s
Bk)7!Df0!(Gp%0MDfT9!AKZ&>F*(u1/e&._67r]S:-pQU<b6;\+DG_8ATDBk@q@\1$;No?+<Ve9
@q]F`CMmQtATJt:@q]F`CNCV-@:O(qE$0%,D.Oi/@<?U&Ec,q@+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFC])qA8bs#+<Y<.F<G%$@r$4+
+Eh=:F(oQ1F!,C5+EV:.+Co1rFD5Z2@<-W9A8bt#D.RU,+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<Ve9B4Z0rG]7J-Bl5%9B4Z0-@UWb^F`8IHATDj+Df0V=De:,5BQ%p5+E(_(
ARfg)AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFD#Z:
AU&;>+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+D5_5F`9!TF_Pr/+D>=pA7]e&+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<Y-+ATVj"C1UmsF!)T<ATT&5@VTIaFE8R:Ec5e;
@UWb^F`;CE+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9
$;No?+<Ve9DJXB*@<,jk+<VdLF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4
F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0%15is/g)8Z@W$=*F!)SJ+<VdL+ED%8
F`MA@+E_R9EHPh8@UWb^F`8IAEb&a%ARlp"BleA=De:,&Bk)7!Df0!(Gp$R)@r$4++Du==@V'S$
+<VdL+<VdL+<VdL+:SZQ67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dA
F!,C?ASqqa:-pQU+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!
Df0!(Gp%'7FD)*j:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@lt
Ed8dAF!+m6E-67FA8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"
ATJ:f:-pQU+<Y07ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+
Ap806A9/k9+<Ve;AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu
:-pQU+<Y3/A92j$FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%
D@HqJ67sB'+CoA+F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"
F_t]-F<D]=ATT&5@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4
F<GL2C1Ums+D#e:Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=
AKZ&(EbTK7+EV1>F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-
F<GOFF<G[>D.Rd1@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*
AS-!++<VdL+D58-+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/
DIIBn+Dbb5FE7lu:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!
Df0!(Gmt*U67sB'+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#
ATVK++<Ve;ASbq"AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9
ARloo@<>oe$;No?+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4
AS5Of@rrh9+CfG'@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9
+<VeFE+No0@3B)p@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is
/g)8ZE-686G]7J-Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688
F!)SJ+<VdL+EMXCEb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2
@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`I
DfTD3-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<
+<VdL+EMXCEb-A3@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'
+E2IFGAhM4F!)SJ+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/
@UX'qEb/ioEb0,uATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2
DfTD3Ea`iuAKWZa0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)
$4R>;67s`uAT23uA7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P
90G<i+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H
;cGn@1a!n`+<Ve%67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO
:fBM<2'="a+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO
:-pQUD..-r+Co2,ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^
/430":JFYa%13OO6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4r
F)rIBEZf4-@rcK1FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,
C1Ums+Eq78+D,>.F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OT
Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$
D/aE2ASuTN+EM47Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*
DKIo^A8,OqBl@ltEd8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-
3Zr6IF*&OHBl.E(DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cm
Df'H3DIm^-+EV%$Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h
+E1b2BHSlL-tI%&DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKX
H=\4;Afu#$C1Ums+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(
Bl%?'@rH4'Df0-(FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%
8PW;b<Cp.Y;a!/a8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/r
Ch4`!Df'H3DIm^-Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO
>"'u0:.88]9L26F%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&
@1<Q8:0(=_;cH[Y3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOf\$4R>;67sBu
@;TR.DBNk<+DtV)AM.k/D.Oi2AT2'u@<?F.+Cf(nEa`I"ATA4e:..lW4ZXrC-Qij*%15is/g,7V
Bl+u5BkM+$+=M>P@;0OlDJ(C@E+*j%+Co&"Bl.R+ATDi7+Xefh4Y@jR5u^BC78+-tEc>Q2EbTAR
3aEjQINViU+>#2g><3lV/h^H^+Ab@'845m?,$uHU+C,E`%15is/g,4SCh[u6@UWb^F`8I@@;TQu
E+*j1ATDZ2@r)S]F)Yr0FCK,rD.Pjk+=KuQ:K/ZMAS,k$ATMs6+?L]@6r-c/@:jUmEcZ>C.1HUn
$;No?.V3L.A7]^kDId<rFE7                                                   ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gg44+>P'!+>Yu"1E\G1+>t?!2]sh0+>u)"2]st6+?1K#0Of0=Ch.:!A9E!.Ci^_AF(Jl)FDi:2
F_PZ&+CT.u+Co2-FE2))F`_1;8l%iiDe*]nBl5%c:IH=9Bk)7!Df0!(Gp$U5@<6L)De*Bs@Us1n
ARfh#Ed8dG@VTIaF<G(0@<6KN+D#e>ASuR'Df-\9AfrL:De*p2DfTD<C2[X!Blmp,@<?'nASu("
@<?(%+Dbb6ATD4$AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q@ruO4+D,Y4D'2GH6m-,_Dfp#?
C2[X"@;BFq@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3
C2[X(FDl22F*)>@@:s-oDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[W3              ~>
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
zz=:zz,'1 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke0'
zz=:zz,'0 dnlSmokeMacroTexts dpsetSmoke00 edSmoke00 globsSmokeAssign000 glo'
zz=:zz,'bsSmokeDD00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00 mnlSmokeAr'
zz=:zz,'gs00 newdSmokeBadArguments00 odSmokeArgFail00 rxsBadSmoke00 rxsSmok'
zz=:zz,'e00 rxsgetSmoke00''                                                 '
zz=:353{.zz
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
:dJ&O+@K%"8PMcU+@K4(:eakY2'>=c;D9g`0d&n_;DKs_+@nds80CGh;b0AV=<L.#;b0GI;BSP-
=\_:+8U=!)6tpO\ATDBk@q?cSH:gt$FDl)6F!+&#8l%itFD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r
:IJ5X6m,/h;cHRn<$4k'5u&Ot5tsd89L2TU+AYWa0ea_R8Ojn4DJUG)DJXB*@<,jk+C]J-Ch.:!
A7KOpE,oN2F(Jl)@WcC$A86$nFDl)6F(9-*E,oN2F(Jl)@q]Xk@<6*mD/^V.E-#T4+CoV3E+ifk
A7]d(AoDX&GT^U@Ci!s,DKL.HB5DKqF!,.)F(f#k@r!3#@<6*k@q]X#BOPsqEb024BQRa#BlG20
De*ZuFCfK$FCeKI6m-5_A8Gt%ATD4$ARB+ZF(f)mFCfT8C`mJ2A8c?.C3FJ;D..3kA9Da.+E(d5
E+*6lA8,Oq+E2@4AncL#F_u)2@<6*)E-67FE-688F!,O8FCKB,Ch.'jEcW@EATV[*A8Gt%ATD4$
AKZ,7A79RkC2[WnBleB:Bju4,Bl@l:.4cl04?G0&0d%hd@WcC$A7'(iA8Gt%ATD4$AKYH)Bl%<e
E-68EATDi7A8lU$FAm$pCLo1R-RgSp4?P\X?SNZN+C]J-Ch.:!A0>W*A0>W*A7TUf+DPh*Ch\!&
Eaa'$+DPh*D..3k+DPh*F*)>@ALAoX-p0%C-YdR1F)>i2ATVL)FE8fY/1<VC4"akp+=A:(:IINL
8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhmM:et"h
?YXLiCh\!&Eaa'$+B2-):L?^i6psg<?Ys<r<)5nX?V4*^?Ys<r@WcC$A86$nA8-+,EbT!*FD5Z2
+D>J1FDl2FC2[W*BPDO0DfU,<De*Bs@j#N)A8Gt%ATD4$ARBA!Bk;KqFCf\>C2[X%@<-4++DPh*
E,ol/Bl%?'D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*C2[X(Dfp)1AKYi8
C2[X%Ec5Q(Ch4`8H?s=EA8PahDI7KsGUFpk-p07-2)-@30JYF<1b^^<1cRBI1c[6L2)ud70JYI=
0etF81c$jD2Dd9G1H$@20JYI=0etF81c$mB1,q6P3&)O20JYI=0etF81c$gE0KD!H2_cF10JYF<
1b^^<1cR9I2D?pD2DcO30JYI=0etF81bq$H0fD!O3&Vm70JYF<1,:d@2Dd<O2*!BL2)?@10JYF<
1G^^;1c.3H3&!?O1H?R50JYF<1b^^<1H%$F2)I-J2E;m80JYI=0etF82)$^=0ebO?1c6C20JYI=
0etI92D@*E1H%*F1c-=10JYI=0etI91H.<S3Ar`T2`Mp80JYI=0etI91H70G0JYCB2_cF10JYF<
1GUpB3B8fQ3&36H2)QL30JYF<1,(R<1c7!H1cI<Q2E2g70JYF<1,(R<1c7!H1cI<Q2E2g70JYF<
1,(R<1c7!H1cI<Q2E2g70JYF<1,(R<1c7!H2)-gG0esk,0JYF<1,(R<1c7!H1cR9H1,g=20JYF<
1b^^<1cR<N3&*BI2Du[50JYI=0ebI;2)dKK3AE3F0f1".0JYF<1b^^<1cR3M3&E<I1a"P-1,L[>
0f^jD2E3]P2)dEQ0d&5*1,L[>0JtI?2`N`P1c$gB3$9t11,L[>1,1C=3B9#X1,CgD2BXb/1,L[>
1,1C>0JG4=2_m3J+>PW+1GCU>3A*-G2)-pI1c[EP+>PW+1GCU>3A*-H3&NKO1cR?M+>PW+1GCX>
1G1L=2`NKG1GUXB+>PW+1GCX>1G1I>1cI9G2`!-F+>PW+1GCU@0J51>1H$sJ1,q$J+>PW+1b^X>
0J51<0JG792`Wi?1,(I?0JP=:/i5=C3&N]U0Jb[21,(I>0JkI>/i,:@0fLgE2DI-51,(I?0JP=:
/i5OC1bgjC1GUp41,(I?0JP=;/i5IA0KCjH2)-p11,(I?0JP=;/i>FE1-%*L3&if=1,(I?0JP=:
/i5=D1cI-E2_uR30JYF=1,:U;2).!E3&``O3B&'90JYF=1,:U;2).!E3&iWI1,pC30JYF<2DQs=
1H@3J1H7BK0f1".0JYF<1,:d@2).$M2_m-G2]sk01,CU@0Jb=;2E*WP2_d<Q3$9t11,CU?0K1UB
1GgjB2*!EN1E\G,1,L[>1,(=<0JYRA3A`KF3?U(21,CU@0Jb=;2_d!C0etF>3$9t11,CU@0Jb=;
1Gq0I2`!HN2BXb/1,CU>1,pmC0fLjF1c[?I1*A>+1,L[>0JtI?0f1gI0JG=B1*A>+1,CX?1,:I>
0etI;1b^mI2BXb/1,L[>0JY7=2Dm9J2*!NJ2BXb/1,CU@0Jb=<3&WHI3A<EM3?U(21,L[>1,(=;
1GLaF1c7!D2BXb/1,L[>1,(=;1GU^@3&iiV0d&5*1,L[>1,(=;1GCaA3AiTO0d&5*1,CU@0Jb=<
3&<?K0JbOD1a"P-1,L[>1,(=;1,q'E2E3]V2BXb/1,CU>1,ggD1c@<N3AEEL1E\G,1,CU?1GCF<
1c[6L0KD'J3?U(21,CU@0Jb=;2Dd9N1GUXA1a"P-1,L[>1,(=<0JG490K1[B2'=Y.1,L[>1,1C>
0K:aB2Dm3G1a"P-1,L[>1,1C;2`WlY2DmKR3$9t11,L[>1,1C;3&<<D1,:dI0d&5*1,CU?1,pmH
3AEHP1,:^E2'=Y.1,L[>1,1C>0KD*O2`3EL1a"P-1,L[>1,1C>0KD*O2`3EL1a"P-1,L[>1,1C>
0KD*O2`3EL1a"P-1,L[>1,1C>0KD*P0K1dA2'=Y.1,L[>1,1C>0KD*O2`W]K1E\G,1,CU@0Jb=<
3&EQR0fUmG2BXb/1,L[>0JtI?2`NZR1Gq'J3?U(21,CU@0Jb=<3&*EQ1b^gE+>PW+1b^X=3A*0K
0JbL?2DI$G+>PW+1b^X<2(gaF3&`WM1GCXF+>PW+1b^X>0eP@<3&`QG2)6:00JYI=0etI92D@-F
1b^[C2`Mp80JYF<1GLmB1c@-D3B9&X0K:110JYF<1GLmB1c@<N1H73N2)QL30JYF<1b^^<1bpdD
0JGF>2E;m80JYI=0ek[@2)[HR1GCgE1,^710JYF<1G^^;1c7'I0f_!K1,g=20JYI=0etF81c$g>
1,(XI3$9t11,L[>1,(=;1,q6N3B/]K3$9t11,CU@0Jb=;1GpmG0f:jD2]sk01,L[>1,1C<0fD$K
1GCL<2'=Y.1,L[>1,1C>0JYRC2)[HO2'=Y.1,L[>1,1C>0JG:>1,1^G3?U(21,L[>1,(=;1-%0M
0et[D+>PW+1b^X=2_HpG2E*WN1,L[@+>PW+1b^X=2_HpG2E*WN1GU^@+>PW+1GC^B0J5.A1,UjI
3A<0E+>PW+1GCR>2_HsB2`WfP1,V!51,(I>0JkI>/i,FC0JG:;1c[H:1,(I>0JbCA/iGLB1,:^I
1,h!31,(I?0JP=;/i5FD2)I6H0JG4(1,(I>0JkI>/i5@=0f_0O1,1X/1,(I>0JkI>/i,:@3AEHK
3A`W:1,(I>0JkI>/i,:A2_d9I2`<B51,(I?0JP7=/i>@B3&N]N3A<B71,(I>0etL>/i>@=0ebF<
3&WZ;1,(I?0JP7=/i>FF1GCU?0Jtj>/1<V9+>Y8u0JYF<1bpp@1bq'I1H%'J3Ar!80JYF<1bpp@
1bpsG0f(O@3&Vm70JYI=0ek[@2*!QM0ebFC2BXb/1,L[>0fCX@3&3KP3&iWP1a"P-1,CU@1,U[@
2)$gH0fV!D1*A>+1,L[>0f^jE3&i`R3AW?G1FXk'4>J$;,Vh&/1GCU>3A*-F2)mBH3&<Q;1,(I>
0JbI@/i5:B3AiTQ1cI?91,(I?0JP=:/i5OD0Jb[D2)I$11,(I>0etL>/i>F>2`*<N2)mK:1,(I>
0JbL=/i5FB1,1^D3Arf=1,(I?0JP=;/i5OG0Jb^G3AWE51,(I>0JbFD/i5CB3&<9K1H?R50JYI=
0etI92D@*I3&riQ2E;m80JYI=0etI91c[9H1GL^?3B&'90JYF=1,:U;2)?sG1c%-L3&Vm70JYF<
1bpp@2)$sE0f(^11,(I?0JP=;/i>OG1GpmI0f1m>/1<V90JYI=0ek[@2*!QN2_[!F3&W9o1,(I?
0JP:@/i>XI1H.!C2E3TEBeD+_1+=b&4>J$62^C.41,CU>0JtI>2).$I0ebRF3?U(21,CU>0JtI>
2).$I0fM'J2'=Y.1,CU?0JkC?1GpsB2)$gD3?U(21,CX?1,:I>0fCdH2`<BL1a"P-1,CU@0JY7=
1bggG2).'J3$9t11,CU>1,CO?1GUjF2)R'I2BXb/1,L[>0JtI?1b^U@1cR9O0d&5*1,CU>1,ggD
2)I'E0JYRH+>PW+1GCX>1G1OC3&riN2`!BI+>PW+1GLX?1+kF@2)$aA2`3NQ+>PW+1GCU=1bL[C
1,CdG0KD'N+>PW+1GLX?2D-gG2)-pF2)R0M+>PW+1GCR<2(g^C0fLpJ3&i]K+>PW+1GCR<2(g^C
0fLpK0f(^E+>PW+1GCR<2(g^C0fLpK0K(dI+>PW+1GLX?2D-gH0ekLF2)RBP+>PW+1b^X>0J54?
0K1sI3&iiS+>PW+1b^X>0eP@<3B/uP2_d<K+>PW+1b^X>0eP@<3B/uQ1GLmE+>PW+1GCX@2(gdF
0K1aD3A`HK+>PW+1b^X=2_HpG2E*WN1,:jE+>PW+1b^X<1bLXA1c7-L2)m9M+>PW+1b^X=0eP:<
3A`ZR2_m*F+>PW+1b^X<2(gaC0JG@@3&<QL+>PW+1b^X>0eP@>0JYLF0etXD+>PW+1GCX@2(gaD
1Gh$F1,V'O+>PW+1GLX?1+kF@2`EEG0K:dE+>PW+1GCX>1G1I@1H.$E0KCjF+>PW+1b^X=2(g^B
3&!*I3B/`P+>PW+1b^X>0eP@<3B/rV2)I0I+>PW+1b^X>0eP@<3B/rV3A`EG+>PW+1b^X>0eP@<
3B/rV2`3E71,(I>0etLB/i5RC0f1mJ2*!Q;1,(I?0JP=:/i>L?2`NTQ3&`]D/1<V7.4cl00I\P$
4>838-p045/3GT                                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
