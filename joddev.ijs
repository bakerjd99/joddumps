NB. sha256:3150520ff962a4b60eac4ef476b42205169e2eea00da208b654589c325e59b86
NB. JOD dictionary dump: 20 Jan 2024 13:24:21
NB. Generated with JOD version; 1.1.0 - dev; 11; 20 Jan 2024 12:41:06
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

IPYNB=:32

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.0 - dev';11;'20 Jan 2024 12:41:06'

JODVMD=:'1.1.0 - dev';11;'20 Jan 2024 12:41:06'

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

NB. time and j version
hashes=. (ctl '--sha256-- ' ,"1 (tstamp,: (9!:14))''),LF,hashes

NB. write hashes file 
sidecar=. bckpath,(":pfn),'jhashes.txt' 
if. _1 -: hashes (write :: _1:) sidecar do. (jderr ERR213),<sidecar else. OK end.
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

  NB. hash backup files and write sidecar njhash.txt file
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
1,:X.1bg+.+?1K!1E\Y"1H-F:+>Yr!2]sn8+?1K!2]st#1,0n1+>Y\o3$:+5+>k8s3$9q4+>u"u
0ea_.1E\D1+>P_q0eje,0d&@s1,9t2+>Pku1a"P0+?:Q"1a"Rs1,9t,3$:%9+>P_q2)QL20H`2+
+>k8s2'=V-+>khq2'=\/+?:Q$2'=b!1H6L:+>bks2BXe5+>G\q1G^./1E\M6+>k9!1E\Ir0fC.6
+>beq1*A>4+?1K!2]sh3+>Pr"1E\M1+>k8t2'=V/+>bhr0f1"20d&5++>Yf?=]@gg8QnQ$@VTIa
F<GX=H=\4;E-,f4DBNG-A7\,'9h%NE:If81F*(u6+D,>(AKYK#3ZqsI@ruF'DIIR2+Du==@V'R&
Ci<rR:/+2S5uLEUD..L-ATAo*Bl%?'@r==MA8,OqBl@ltEd8dH@<,dnATVL(F$i\s7T;Z?D..L-
ATAo*Bl%?'@r==MD..-r+Co1rFD5Z2@<-W9FCAWpAOB?a5u^EO:2aTVARfg)@rc-hFD5Z2+E)4@
Bl@l3@rGmh6r60K87ZFEFD5Z2@<-W9E+*j%+EV%$Ch6"29M%rM<,H&gBl/!0+Co1rFD5Z2@<-W9
E+*j%+DbV,B67fT<D?:a;b&]_DffQ3+E2IF+Co1rFD5Z2@<-W9E+*j%+>"^YF(Js+C`mq8ASrW,
Ddd0jDJ()&F_u(?F(96)E--.m:g$O[8p,)uFCfJ8DJsW.@W-1#+E)4@Bl@l3@rGmh8U=!)6tpO\
ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[Ws
DKKH1Amo1\.7nhX:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ
+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4
F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<
CLnVsDIal#@<?'S5uU`Z<E*dCF*&OC@VTIaF<GOFF<GL@FD5Z2+Cf>#AP>NY:2FKMDBO"=F`Lu'
+E)4@Bl@l3@rGmh:-hTC6VKdE;bA0M@;TQu@r,RpF!,C?FD5Z2+Cf>#AQhYqH>."7F)Q2A@q?d$
E-,f4DBNG-A7]4mBl%<pDe*?rD/aN,F)to'@WcC$A9/l%+D,b4Cj@.5Df'H6ATMp(A0=K?6m-;a
@:UL&ATMr9F(96)E-,Q3Bl%<pDe*s.DesK)Df'H6ATMp(A7B[qCh.T0@rH4'Eb0<5ARlp,ATDj+
Df-\9Afu2/AKXT@6m-SiDesJ;@r,RpF!,O6EbTK7@q]Xk@<6*mD/`uuARfLs+CoV3E$043EbTK7
+D>2)BHU_r@;0V#F<G(3DKKH-FE:u3F(KH7ATT&*Bk)7!Df0!(Gp%'7Ea`frFCfK6A9Da.BOtU_
ATD:$ART[lF!,R<AKYN+D/a*$Ch4_tDIal6EbTW,F!,.-@:Wqi+DG_*DfT]'FD5Z2AoDX&G\1Z1
F*&OCDBNn,FD)e8Eb&a%+Dbb5F<G:8A7^!tF_kl2Df0ZBEb0?8Ec,q@Ch[s4F!,C5+Co2,ARfh#
Ed8dG@VTIaF<GI>F`&=F@;L'tF(]<-@WPsq@;L48ALnsEAT2R.F<G"0A0>r8DfTD3B5DKq@;I'(
@;TRsBOPsq@UWb^GB.D>ATJu&+EV1>F<GX=A7]7ZEZet.Ch4`-AftPk@r$4++D>2)BOu6uFCT-$
E+<]uE-!.8ART*l@;]TuFCAm"+Co&"Bl.R+ARlp"BleB;C2[X!Blmp,@<?']9gi`7A8Gt%ATD4$
AKZ/-EcYr5DBNe)CLnVsDIal#@<?'qDe*ZuFCfK$FCefm@<6*m@<?('Ebof1@4a5l2BZ[AF(c\7
Afti,A8Gt%ATD4$AKZ&(EbTK7+C]J-Cige<DBNIuFCf3*A8c@-F`M@B8l%htDf-\<ATN!1F<G:=
+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0C3FJe+Eh=:F(oQ1+Du==@V'Rs@;BFbF_u).
F_u)=+EV:.+CfP7Eb0-1+E1b2BHU`)+CQBb+EM%5BlJ/:Anc'mDe*d*ASuQ3@;]Tu@r-()ATJu)
Bk)7!Df0!(Bk;@)@:O(`Bk)7(@:O'qFD,5.@s)g4ASuT4A8,OqBl@ltEd;VEAS,Y$A9Da.BOPsq
E,oN%Bm=31+D>2)BHVD8+CoV3E$043EbTK7F)Z8DF*)>@ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2
+Cno&@:EYdAKYT!Ch7[,F`_8;F*)>@ATJu)Bk)7!Df0!(Gp$a?Dfp#?+CT.u+EM[>FCfN7ATVC(
Bl%<jBl\99ATVuH@rc-hFCfM9E+*j%F!,UHARlomGp#^T6m,r]Bl%<&GAhM4F)to7C2[X!Blmp,
@<?("Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMu
D.7<mF`:l"FCf3*A7TCqFE2))F`_>9DKTo/@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df, ~>
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
0fLp30fL42+>G_r1*AS92'=Y.+>P&o0JP7(1,C%.+?2;<1*A;0+>P&o1Gq-70f1".+>G]40d&2*
+>P&r2`<T;1,'h++>GT)1*A;*+>P&p2DR6M+>GYp1*AD60f^@30d&4o0eb:81E\Y"1*A>12`Dj6
0H`+n2`N`S+>GSn1*A;/1H-F23?U("0eb=B+>Get1*A;-2DZI11*A=p2E<WT+>G\q1*A;-1H.p%
6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>>Yq8muT[1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f1"F@;[2C0JYI-0f1pH1HI9F$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&DBL\g
1,L+.1HI?K3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@
+?1Jd6t(1K3Zp.;+A-'[+>PW+1a"M/3]/fV2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[1,(I?+>G`72)mWS0FA-o:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?
+>GW40fV3O2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
0d%T,@<?'A+>PVn8muT[1,(I?+>GW41bh$F2@<&P6rZrX9N+8X8PDNC8Q/Sa;HYb4$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf2'>M"
DBL\g1,L+.1cd?H3]/Z"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqg1a#D!DBL\g1,L+.1cdBJ3\iDs$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&DBL\g1,L+.1HI?K
3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3ZpC)
+@KX[ANCqg3?Uq&DBL\g1,L+.1HIBO3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg3?Uq&DBL\g1,L+.2**TS3]/Su$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,'hC
@;[2C0JYI-0etdE3'&oV$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>PVn8muT[1,(I?+>GW41bh$F2@<&P6sjkAF(KB8ARo.ZEcQ)=
F'j$6F>>^K67s`[:IJQ.@WQ+$G%G2kATDg0EcW@E/M/)SF_;h5DeC2$DIal1ATMg/DKBB1/e&-s
$;No?+FA0O@<-HADe:S>@WQ+$G%G29ATDg0EcZX<$4R>;67tA`-o!.n@rc"!BK@8SDBNb,B5)I%
D..Nt+=Lc<CagK8EbBN3ASuT4-u*[205<?u1ark@:-pQU1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO
+<VdL+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!l
FD`4H/e&-s$;No?4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7
Eb,[e:-pQUFD,*)+CT/5+Du=<C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"DDfB9*+EVNEDKTc3%15is
/g,7E@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>Po
G%De.@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ
67sC)Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"%15is/g)8q+@0se+>PW)2'=V13\WBO
1,04F%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf
2(gR>%15is/g+\=@ruF'DIIR2/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*
Gmt*U67sBoATD?)/KeS<@ruF'DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>+CoC5DJsV>F(fK9%15is
/g,7LBlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4
E,]N/B-:o++CQC)ATo8;Dfp/9DImlA%15is/g)o0+AH9b+>PW)2'=V13\WHQ1GTCH%144#+ED%+
A0<77F`(tB4""N!>\[\fA8,OqBl@ltEbT*+>]++pD..-r>\[\fDImp,@;0U,%19tYA8c<nBl5&)
EcQ)=3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;67tDb-o*4oAncKN+EV:.
+DPM&Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?+CSf(ATDj'+?DP+FE1f/
E+NQ&Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!%15is/g*b^6m-\lEb'56@<,p%@;L"'
+EVX4E,]B!/g)99BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi
+C]&&@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u%13OO:-pQq4X`*8+EqjE
DJ)!Q-tI%5E%)o?De3u4DJsV>E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU
1a#)'EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ#
+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?
DBLMp_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY
_h>p\_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;%144#+D58-+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4Anc-oAAYY^$H%D3KYrAY
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg
$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60
@<iu;BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5
ZQVq:6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$4R>;67tDb-o3:pAncKN
+EqaECNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8+Cei$AKYMtF)Y,sBk)'lAM>em%13OO
%13OO:-pQq4X`-9+D#S6DfRl]FD,6+AKY].+CQC/Df021F*(i.A8,po+E2@>@VfUm+EqOABHS^@
@;TRc@<?Q>+DG^9FD,*)%15is/g)9IARfObEb/c(F(9--ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVA
ARlonDfTl0@ruO4+:SYe$;No?4[(8N.3N5:GWHrV$4R=O$4R>;67tA`-oEFrATDg0E]P<kD..3k
.3NhCF!,('Bl%L$B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMpE+NotASuT!$;No?+Dbb5
F<G.3E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH
+C?lHD..3k+=DAOEb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG@;]^hA0<:;@;BFeF"&5R
D]i_%DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$
ARlomGp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+E$-NG@;TR'4!uBb$;No?+D,%rCi^_;
DBNA*+DG_:@;KXg+DtV)AM,)7$4R>;67tDb-oNLsAncKN+=LlDD..3kE@E#IDe*QoBk:ftFDi:B
ASl@/AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRlBleA=@V'.iEb,[e:-pQU@rc-hFD5W*+D5_5F`;CE
@;]TuF*22=ATJ:f%13OO:-pQq4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1
+EM77B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK
3]&]'$4R=O$6UH6C2[WkB4W25A92j$F=/1R:-pQU@s)m7+DtV)AIT"+P`4UdJDufpifnuQP^qbX
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
ifo$($K@;%+QAW;ifo%*+<VfdP_(YE0K1[G0ek:;+<VdLifo$R3?TFe+<VdL+<VdL+<VdL+<][.
Jhf#62_[6H0eP:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQ
P^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$6UH6%13OO+>P&^C2[WkB4W25@WQX"FE8f=
$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%
1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZ
Jkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IF
ifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4
+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1bg*qifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$(
$K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0l
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjB3$>OKi@:s-o
4$"a"F*(i4+ED%&-QjO,67sC!CER5-EZf14F*)I4$4R=u+DPh*@:s-oI4cWu+CoA++=ANG$4R=O
$;No?4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et+CoV3E$043EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26
DJ()&F_u(?F(96)E--.1$;No?+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4
DfB9*+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!
$8<Va0H`J*@lc8XDe(M9De*g-G%>`4E-![LAT089C3(a3$4R=b/hSb/+E)+2FED))+EV1>F<E1g
/hRS?%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\
D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;
.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,Oq
Bl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17K!ASu.&
BHUl,Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT?Y"'a$4R>;67tDb-o`Xu
AncKN+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq
:LeJh1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,Fu
B6,2:Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC+E_RAF`2A5A.8l@67sBpDIdI%ARfg)B5DKq@;L!-
@<3Q"+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB73?V+-F<E=m0f:(.1-.9L
3]&Q#$4R>;67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F!(o!D/"6+A4^ZLBl[cpF?sth
BkM<PEcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63-t[U>@jsQ%+Bos=+>=of+C,E`
.1HUn$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%F(o9)D.RU,Et&IhCi<d(+=D#?G\(DW
DIdI%ARfgJF)u&.DFJSdDfR37$4R>;67tDb-oi_!AncKN+Dkh;ARlotDIdI%ARfg)@<6L(B5VQt
DKI"4EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'$4R>;67tA`-o!D)+D#S6
DfRl]Ch[cu+Dbb/BlkJ/G[k;rA7]9oCi<`mBl7Q+Derr,8l%htA9Da.+=L]/BdjJu:-pQU0JjnH
@<*JG0JYF,0ebXG1cdEQ%15is/e&._67sBLDJ*[$ANCrK3A*-@0e[9"1gtQP1,!0HEd)58%15is
/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MJq31,i/e2**KN3\WKG@r,RkB.Yhp/MJb102kP577KEp
%15is/g*i%@WGmtGrd'./i5190F\@a67sBXF<F.C762PH/hen60/bF</i4t7/i#%9.1HVZ67sBW
CghEtDfT\U+@KXYGA1q;2DbjM:-pQU8T&Tk@;KakE]P=X3A*-2Bl8!6@;K`h$;No?+A$HlFCB!%
:gnHZ3Zp(uF(KB505>E=DIR$iATBG=2Dd(%3A*,t$;No?+@C'bFCA[$3ZrWjG:mWODe=*8@<,p3
@rH2n$4R=b+<X*J?URq2@<ld6FC-a^0K1aF4ZY;V2DcO30I/#?7863X84c0D-T`\S6;p3X8OOpf
-V[$(7:/DT-T`\S6;p3X9L2TV?VWm]741/E;aODL?UdUb;cI+!5tscq4"!Nr7oE\c6mk&D6Z6ja
Ea`I"-T`\S6;p3X9g_lX?WK`p-T`\S6;p3X;FNr@?URj@4"!I!6UY9Q6mk&D79DoF?W0Kk;H."&
79EM:4"!`k78.&W7Rg`Q<$saT9gqKE?U[X[7pf4u:dl`n-V[#u9OCL]<)R($;be]%-VZs-;I;g\
;aVoo-UC^1=^O`g-T`\A<)Zq,6q($A-T`\RAT2R.F@0tWAOCKL@<?'K@<?'.4"!p;E,Tc=6Z6LH
9OW!a<H)JWFCcg]-nlo#.6An3<C]#=2)7Ng2)cmE-SR5.0JG=C1G^C?-S[J62`ETJ0df%17VQaM
BI>kh9jr'VCjBnG4!u^:0JG170JOq:-V,sJ2)$C>-nH`E-Rh,)0ek=92_Qp?0fL401-.*C3\W6?
0JG1'5tr^g-RUu':2b4s6$%*]B5V9k-T`\10/5+80JPO00etdD0KLmA/het5+@/^L4"!ot-T`\E
:,O^Q4"!Hl2)$.N77g5sG:u=,Eb?L]Ebd$a-RUu'-T`\'4!uC;-nlo#.6An6;)C4)7Q<b<2DQXA
-SR5.0JG:?2)6O@-S[J80K(UB0df%16"G6g4"!F)Ec5bA4!u^:0JG170JOq:-V,sJ2)$C>-nH`E
-Rh,)1G:LB0/>493$9q23\W6K0JG+50JFV89d`"M75[%P4"!rq:`sdi3Zp_)C`lMqBOu3,;ajM*
7<W6[FE8QQ9gKn?DJXSI-T`\40/5+80JPO00etdD0KLmA/het5+@/^L4"!Bd-T`\E<%p!R4"!Hr
0JFV$+@^BiD'2euF_)[^Cis;:4!uC;-RUu'-T`\'4")d.0I](22H3($7oD96<A6<Y4!u^90JG49
1bgm94!ua?1c7*G2)-I?-UD9g-T`\H@<?U*ALBPe0JP780JG18-T`\H0f([@-T`_--W;BA4!ug;
1,gjA0JPO00etdD0KLmA/het5+@/^L4"!HS3%$d8;ajM*Eb.9S6#:?[:NU8]EZe:L:`r2MASuU2
+=KrM+E).6Gpt+&-T!J20/>493$9q23\W6K0JG+50JFV89d`"M6V&Rd-Ugug0IJq078trp+>"^*
Ec5e;<-!+m+@9meALBPe-T`\'4!uC;-RUu(0I/>$4!ua_2`<rk1fd.+1+,.20JG170f1aH0IJq0
0f:jC0JkC7/e&/8Ch[a#F<G.8Ec5tL+D#e/@s)m-DJ()/Df/uo+>=s"0JO"DHsn.=H#n(=D'3Y/
D/")7G@>P8AU%]rARo@_%17J*+<VdL+<W?]3\W9NC2dU'BIA7$:IJ#W<^]q^:fB#V@qdQ0C3(a3
$@H&02Dnb_06M>IEcWmKDeO#t@;BFp05>E905>E9E,p,4F_u)=04JF*/no'A%13OO:-pQq4X`$>
.3N2BEc5tZ+CT+rBkM@,F!,CDFDuAE+D,P4+DkP&AKW@BBPDO*@;TR'%15is/g)o,+@0se+>PW+
1E\D03]&iX0K0FJ:-pQB$;No?+@U0\Bl7KC+DNnh2(gR7@V'Xi0e[9"1gtQP1,!icDId[0Et&IO
67sBIF_PZ&3ZqpND/Ej)@qf@f0/>4:1G(:;/M](\0f;!H2``ZK04Sg,DJ(OU2(^L62_S*'77B[/
0b"Ib67sBSBju*kEd9\g3A*0A0b"Ib67sBXF<F.C762PH/hen60/bF</i4t7/i#%9.1HVZ67sBW
CghEtDfT\U+BN8p+>u%c$;No?+A$HlFCB!%ATBgSC,mn(+DG_7FCB!%%15is/g*`'F*(i,Cf"P^
BK@8G3\P5+1bUjA2%9mf67sBJDf0Z*@rsaSGB\6`C3+<*FE_/6AM.J2D%-g]$>j3eAKW@BBPDO*
@;TR'+AP6U+CoD%F)E@I+CT5.ARTU%FDi:4D]iJ+H$!_6DJ(($$;No?+DGpFF!,@=F<G(0ARTU%
GA(Q.AKZ).AKYo6FDuAE/0JY=+CT/5/0JSDATKI5$4R=O$4R>;67sC-ASu$1De:S>@WQ+$G%G29
ATDg0EcZX<$;aMs<*sBYA8Gt%ATD4$AMPtI:-pR0:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&
DfQsK/M8J83XQ48D/XQ=E-67F8Oc!576N[S-nlc)+>>5O:-pQU-u*[2Ch\!&Eaa'$.3N>BFCfK)
@:NjkGAhM4.!$gu+>PW+1b^X=2ek'%1,^pF$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/IG6>/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq
.3N>:+E)-?F(f-$C`m\*FD)"V67sBmDfT]/Amo1\FCf\>+<Ve%67sBmDfT]'FE8R<H#R>8Ch[d&
ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA9/)Q67sBnEc>i/F<D\K+<VdL+<Ve%67sBt
@;BEsCghEsGT^U:EZf"8Dfp"A.![6K:-pQUBkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`iAKZ&*
@ruF'DBO"CD/E^%Gp%0MEbTE($;No?+DGFt+<VdL+<VdL+<VdL+AP6U+D,P4D..N/Bl8$(Eb8`i
AKYK$D/Ej%F<G[:G]X9f67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02uEb-@e@8pf?+E2@>@qB_&
Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m$;No?+E_mE@<?(*Ao`*6Eb'56
+AP6U+E_RGEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3
B5Di@$;No?+EqaEA8Gt%+<VdL+<VdL+AP6U+DkP&AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGps(L
$4:9]@s)g4ASuT4-XpM*AL@gpDeX*1ATDl8+=CT4De*ZuFCfK$FCcg,$7I\Q3Zp+*+=ANDFE2XZ
$;No?+E_a:+CT/5+E1b,A8bs#F(KG9Bl5&8BOr;Y:IH=EEc5Q(Ch4`$DfQtBBPDN1D.-pfBl7Jh
BkAt?G@c#+@;9^k?Q_HY:f9_O78d#P6r60E6r-0WBkhQs?RHt,D_<.>+<XWS8Q/GO:..lF?X[\f
A8Gt%ATD4$AR@S]+Abs)7R^3Q779s<:..lF?YO7nA7#[TCia/?$6UI4D/XQ=E-67F-W!]07R^3Q
779s<:..lF?YO7nA7$HsDfd+CATT:,ASu$2$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^@;^7"E]l#t
4"u"(4?G0&1*C[TAfrLCBOu!r+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-WEcYr5DC6kU
/M8/5;BTLg/d`^DF)>i<FDuAE+=D;QBl7Q+FD,B0+E1b,A8bs=+=A^>84c`V5u'gD6XO8:De*Zu
FCfK$FCeed+<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,A8bs#E+*j%+DGF1@s)g4ASuT4G%G]8
Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^\+<Y`BDfp/@F`\`RBl5&9DJ=><F(f-$
Ci^_@Ed8dKARTUhBPD?s+EqOABK@8[BOu3q+E1b,A8bs*$>"*c/dc)sFCSu:$6UI4D/XQ=E-67F
-Ugp2:Js4rE+*WpDdso-Dfd+CATT%H+CSeqF`VXI<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f-OOF&
A1e3<$<0eh:L?^i6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0De*L$@;omo@rj;FDe*cn
C2[W8E,K;;+CIf;6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4
+CIf;6psg<?nMlq<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'
+E(j7@3BZ#F))3l@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5FE9&D$4R>M>@M/VBl5ME
De*cl?k!GP$8F.U?p%dUAT;C$B5D!:FYRuMG&h=PBP9,E1cB5p?Tqj?8T#YmBOr;qF_PZ&Bl7Q+
8l%ht@;p0sDIdI++Cf5!@<-10+D#e:Cgh$q+D>\;+EVNEEcl7B?uon$@WcC$A7TCpF'pUC8K_bj
F*&OGE+Np/+CQC)ATnRj+<Ve?Dfp)A+Co%mF_>?$DJ()#+D,b4C`m20Bl%<&Bl5&%+Dtb7+D#G6
Bl\-0D.RU,+E).6Gp%3I+Co2-@rHO%EZdprF)Pl<ARlp*BPDN1E,ol+Ch7Gm$6UH6H"CE)F!+n(
D]j7<FD)e=BPDN1G%G]'/e&-s$8O4V?p%dMDJ"!!DeO/F20iq_2)[F51it]:G\AmV?Tqj?<H)JW
FCcS:BOr;oA79RgFEqh:?m'W(Eag/5D]ib3@r-9uAKZ).AKYl%G9CdGD.Ra%@j#l=E+O)5Bl8$5
De+!#ARlp-Bln#28g$,H2@U!&$8X:W?p%e)2f*OjG]ReJGW9kc3&u7ADes8GFYIJd?Tqj?;It#c
F(HJ9BOr;sBl[cpFDl2F+CT.u+C]&&@<-W9Anc'mF!,O8@ruF'DK?qEBOu'(FD,5.BOPsq+EM7-
ARf.h+D,>(AKY].+CSekARmD&$4R>!/g+Oa?Xks:@UrnYBk]8DAnuO3Ap&!'E&MWDCboE^?m&?Y
G%l#/+CJYrCg\e:?ufh"FC\c%F(Jj'Bl@m1+EVNEBl%U.F*)G2FCcS;F(HJ4AftbqF(c\;Bk1db
@<*t0$4R>"/g+Oa?Y*tuCiF#BC3F&u@<Z4&DIR`CD(me+2g/Ol?m%gTDKBN&ATAo-D/aN6G%ki,
+D,P0F<Gd=BkM+$F!,17+E2@8DKKH#+CoD#F_t]-FE9&W<+ohcAoDR/+E_a:A.8kg+<Y97EZfFA
F`Lu'+Cf>#AKYK$F_kS2@V$Zj+Dbb6FDPM2@W-'nATAnF+D#V5ARfF_Ci"A>FD,5.@rH1%Eb/c(
FCf]=F"Rn/%15!G+CI<=A9hj/EcO*Y@V@SRF)#MMF)uRdBl[iq3+"jW+@op]D/X<+H=\4/De*E%
@rH1%EcW@3DIal%Df0Z<+CSc#Df]tB?u0n+Ch[s4Bl7R)?m&lqA0>9!@;]Uo@pgF#H#@_4GT^L7
Ci=?.DJ(R2$6UH66ZmEiASuU+Gp%3BATME*E+*6l@:s.m+E_a:+Co1uAn?!oDKI"5Df0Z<+CT.u
+Cf>+DfTnO%13OO2_H4\4C:!e0KEu1DK0?912UGY20<qbG\D,7@VBag5%#L2AThd!G9CR;G9D!G
+D,b4Cj@.7D.7'e+CT)&+ED%*ATD@"@qB0nAoDR/F!,17+E2@8DKI!t6q25M%13OO3%c<r?p%dS
CM%="@W6L"2JHrJH=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bB
D]iG&De(J>A7f3lA7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO?s@2[A1_nAA8ba]
%16'16r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgiDe(J>DJ(C@?qO3_?m&EE6r+7!
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-
F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_F)to6/e&.eBOr;q@<6!&1H$@G
<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$&'6?7!gF(HJ9BOr<,
AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKI5$:/KLD_*#OART*l
>@;,YF*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG
C2[W9BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C+Acl_
DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI@V'1dDCosKA8ba]%13OO0eOSV
4C:''A2%nDA9]hG11tMb2g.$&0Q_S#AnuWu5%#L#Df0W1A7]d(@:Wn_DJ()#+D,P4D..O#DJ()1
E-,f4DBO%>+CK%pCLplrFD,*)+D58'ATD4$ATJ:f+<Ve;Bl[cpF<G+*Anc-sFD5Z2+D,P4D0$hD
BOu'(D..3oDJ()5@rc:&FE9&W<+ohcA8-'q@rri(AS,XoBln'-DBNP0Ebu6m+<Ve@F!,=<Eb-A)
Ch76fDKI"0DIal'@<3Q5BOr<(Bk(]sAn>CmF`M%9De:+9A7]b'Dff]2B-JI>Bl7R"AKYf'DIjr%
G]7J5@qg%+/0JLVB.aW#+<VeUIXZ_T$6UH6:-pQUEHQ2AARlp)FCB&t@<,m$AU&01Bk(k!%144#
+EDOHA7]763Zp4$3ZoeU?mncM9MA/H;G/3@.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>/mg@\/j:C?
4"akq+F,=D$6UH6:-pQUA7QfpDfT\($6UH6EcZD7ARf7]4ZX^4HQZU%-r*c99MIfN9-R^l5V=H5
/5fDI:/st].4-W-.82cV+?V_<?SWr\4s2sL/mg@VGp%N`%144#+F\cgILQW,+<XWsAKYK$DK]T3
F(oQ1+D,Y4D'3nA@;]UaEb$;(G]7J5G\M7BFDi:4A0>T-+EMXF@;0@fFCoH3G@>N&+CT=6Ci=3(
%144#+CT=6FD,5.A7]@eDJ=3,Df-\.De3u4DJsV>F`V+:@;^?5De:+a-Z^DNATMF'G%G2,@<-"'
D.RU,+DtV)ATKC3$6UH6@!*T8+Di6=?nNQE5p0ZN@;]^h+Dbb-AKZ).BlbD@Dfol,+CT)-D]ib2
E+*6u+CJr&A8Gt%ATD4$ARHWiF`\'"+<VeFG%G]&Cht5<Dfol,+DkP&AKXSf@rGmh+Dtn'ATAo8
D]ik7DegJ0F=n"0%14jC+CI<=AT;3pFDk`!0kkfWCGTQWCH$&cGqs8GG$dF@+@C'bF(o/rEZee$
A8,po+CQC1ATnRj+<Ve7A8lU$FC650E-,f4DBN=V:JsPK9gM]W78crJ<(LC>FD,*)+EqO9C`mG0
C1Ums+EV:.+CfP7Eb0-1%144#+DkP.FCfJ8Anc'm+E1b2BHV#,FDi:1+Co1rFD5Z2@<-WG+B3#g
F!,C?FD5Z2+EqaHCh+YsCij6/+D,>(ATJu9BOQ!*@<,og$6UH6F(KG9;FNl>:JOSd+DG^98l%i-
+B*2qATVU"DJ()6BOQ!*8K`(rEbT].+AP^3+B2,Z6r+q7F`\a?DBO%7BlbD,@<6!&Blk_D%144#
+D#8/BOu3,GB.D>AKYD(An?0/@X3',F!,RC+CQC)Bl%?'A7]7e@<,pi+AtWo6r-QO=WhX'+ED%&
F_PZ&+EV:.+Co1rFD5Z2@<-W&$6UH6Ao_g,+CQC'F_u(M+B3#c+DkP$DBO(CAKZ28F_kS2@V$[(
D]in*CLnW&F<G.'F(o3++EVNED/XT/+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$6UH6@<-:/DIb@B
6ZmEiASuU+Gp#^T6m-M]D.RQnATDi7GA(Q.AKZ).Bl7R)+CT;%+CT.u+EqL5DIml3BkAK0BOuH3
B5\o0Ble?0DJ(R2$6UH6IXZ`p%144#+AP6U+ED%4CgggbF!,R<AKYr7F<G+.@ruF'DIIR"ATJu5
@<?0*GA2/4+CfP7Eb0-1Cj@.AE+No0D..L-ATAo4@<?/l$6UH6A8lU$F<Dr#:JsPK9gM]W78crJ
<(JAG$6UH6IXZ`p%13OO1G0eX4C;Q6H>7A92Kh&l1Lam71cB,/GAMSJH8dZf5%#L#Df0W1A7]d(
AU&<.DIdI!B-:T&ATMs(?m'Q0+ED%8DfTD3E+*d/Bk):%@<*K"@:O(qE-!W@$6UH66ZmEiASuU+
Gp$gC+ED%7FDl22F!,R<AKYi.F*&OFARf:hF<G%$@r$4+/g*GrF)NTP@rH7+Bk1dq+Cf(r@r#dr
B-;;0AKYYpF(f-+%144#+CoV8Bl7Q+Eb0<6DfTDA+A!]"Bl%T.E,ol+@:F%u+CT)&Dg*=;@<6*)
AmoCiF`M%9FDi:BATMs3Eb-A&F`\aKF(KB5+EM47F_kS2CMn'7%144#+EMI<ATVU"DJ()*@<3Q#
AS#a%F(96%GA1r-+EqOABHVD1ASH0-@UWb^F`;CS%144#+F\cgILQW,+<XEG/g,1GF*)>@AKYGj
@r$4++>bh_$6UH6Eb0<6A0<7/BlmiuAmo1\-Ta.?%144#+AP6U+ED%7FDl22+C\bhCNXS=1bp1f
B5VX.Bl7Q+BOPsq+Dkh6D..NrBOu5o$6UH6Eb0<6A0<7/BlmiuAmo1\-Ta.?+>Gea$6UH6IXZ`p
%13OO1bKnY4C9mREB/2&H#n'`EHO'Z2DTSm@r,j72eR;@5%#L.ATo87F_t]1Bk&8r@<>q"H#R>9
+CT.u+CQC&Df0`0EcYr5DBO(DBl%L*Gp$L)/mof1Eb-A&ASH$p%144#+CSekARlotDBMOo3A*34
-o*J31hpH:0JY("G@_n7Dg*=;@<Q2k$6UH6?nZ53FCf)rE\T4]DKKH&ATBOZBl8$(B4Z*?04o$=
@<?4$B/2,PCi<a(Bl7Q?04o$=@<?4$B/);P+EqL1DIn!&EZfI;ATD?)@<,og$6UH6@q]:gB4Z-,
FDi:2Bl7@"Gp$g=FCfK1@;L!-BlkJ3D/`onFE8Qs:IHfX+A!r(AKYDtEb/ZiGp$d7F<G!7@rH7.
ATDj+Df-\:Eb/`pF(oQ1+D#S6DfRH>$6UH6<+ohcF(KB+@;I&sF_u(?AoD^,@<<W7F*1o-Cj@.I
DfTW7+D5V,DJ()(DfU&1Eb$;%F`\`t+CT+0@rH6pATD["A0>;iDfp.E@rc-hFD5W*%144#+CoV3
E$043EbTK7F!,R<@<<W9Bl%T.DJsV>Ci<`m+DG^9DerrqEZdssG%G]8Bl@m1/g+50Cht5-@<Q3)
FDi:4AThd/AKZ&4D.Oi2@q]FjAISth+<YcE+Cf>/AM+E!%14sF+CI<=3GW@cDe:eFF_WiqDg5i1
CGdq\CG9mA11*4Q+@C'bF(o/rEZee$A8,po+CQC+@<6*)F(o/r@psC#Anc'm+EVNE@VK^gEd8d:
@:O(qE-!W@$6UH6;e^J!DKTf*ATD?m+CHZOBkh6f+D,>(ATJu&Eb-A'Eb/[$ARlomGp$N<@UWb^
F`8rU<+oig+EM47F_kS2DIn!&EZeh&+CT).ATD?m+C]U=8l%ha$6UH6@:s"_DBNA*A0>>mBl7Q+
@UWb^F`;CEBl8$(B6%^.Gp$gB+CfG+FD55nCb?i0BOr<-Bk1db@<*K&Bl%?'GAhV?A0>>m+EM76
E,9).FCf]=+D,>(AISth+<YlBFD)dq83ng_2)ZRj@<6*nF"AGJ/nHXE$6UH6IXZ`p%144#+>big
@q]:lBOu6;FEhm:$6UH6:-pQU@rGmh+>GetDf-\,DJUG;ATMs7+EV:.+C\bhCNXT;+CSnkBl8!6
+D>2)BOu5o$6UH60fL4aDJUFC/gh)8+<VeUIXZ_T$4R>#/g+Oa?T3:E1H0)0CM[`CGAC`.C,@VR
H?4(DD)bld?m%gTDKBN&ATAo%A7TClB-:V*BOPsq+E(_(ARfg)Amo1`Ch\!:+EV:*F<GdACht58
FDl22+CQBk83ng_2)ZRj@<6*)GA(Q*+E2IFFD5W*%144#+E(_(ARfh'/g*_.@;R-/BPD@"Bl7Q+
@;^"*BOu3,DfBf4Df-\-De*E%?njTJ+EV:*F<GdGF_kS2D.R-n+EMXCEb-A%+D>2)BHV52%144#
+CK/2FC650EZfI8F*&O5+D>2)BHV52+CJhnFC5Ob+<VeUIXZ_T$6UH6+AP6U+EqaEA0>T-+E2IF
+CT.u+CQC+@<6*)BlbD<FDl22A0>T(+CQC5ATMF'G%G2,F)5c:/e&.1+<Vd\+>GetE-67F-[0KL
A1%fn+<VdL:-pQUBOPsq+DGm>@rH4'@<,pi+EVNEG%#30AKZ#)FE2),G%G2,/KeVFEc5t@BkAK)
@<?!m+D,%rCi_3<$6UH6+>=om2]uaEF<DrTDfTA9%144#+F\cgILQVn$9'R[?p%e*DffhPF>A#M
FE]ZXFCd@GCO(2>0JPD-?Tqj?8ge[&Anc'm+Eh=:@WNZ/@<iu/@;]^#GA(Q*+CSbiATMp,DJ()9
Bl7I"GB4m=Bl%@%+E)-?A9)C-ATJu&@q0(kF(Jl)@X/Ci+<Ve-:ei-CDf0H(@ruF'DK?qEBOu'(
<_uO6BlbD8AnEY<<+oi`ALDOADJsV>D09?%+A,Et+Ceht+CoC5AoD]4D..C&ARlo3Ch7^1ATB/0
A17rp+<Ve;EbT].F!+q7F<Ft'AU%p1FC65&G%GQ5F^]*&Gp%-=FEMVAF!*.ZAoD]4<_uO6F(f!&
ATJu1Bkq9@%144#+F\cgILQW,+<Ve=AU%p1F<Dqa05>*?A7]p<1bWo`@<,q#05>E905>E905>]L
Eb'5DBkh6-%144#+F\cgILQW,+<X9P6m,uXF_kS2A8`T!+E;O<@r!2uG\M5@ASu!h+Cf(r@r!3*
DBO.;DId[0F!,OLF*(u1F!,[?ASrW)F<GX9ATJu:DJ`g$E+NPh$6UH6F(f!&ATJu%0/%BbD.PAA
BOPpm04eg105>]LEb'5DBkh6f/g)99BPDN1GA1l0+Du+>+D>>&E$/b2EZeCZ:*=C^E,]B!+CoM,
G%G_($6UH6GA(Q*+BD<6+DGm>De<T6%13OO3%c=]4C9m!F?!fLApA-;E-6;3Ao)O4DfI]q1iRD@
5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BEDIal+Bl8'</g+,;ART?sBkAK*AS#C`A1e;u
%15*J+<Y&S?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;
6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr
@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R=s0J4Ij+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;j
F?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9m
Bl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$8F7f+<Ve74C;VRA9;F!A2,odE-?&+FDbT%12pYZ
BQnB%5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu
9PJBeGT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1
F!,1<+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*BmF*)G:@Wcd,
Df.<b:-pQ_@WcC$A86$nA8-+,EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&
/e&-s$;No?+CfG'@<?''FCf<.DfT9,Gp%<LEbfB,B-;#/@ps1b%16T`@s)g4ASuT4-XpM*AL@oo
@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K@WcC$A2uY1-QlV9@rGq!@<6!&
4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'
DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[Wn
ATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]Bl%<&F`_>6Bln'#F!+n/A0?&,
EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%15is/g,4H
F<G+.F*)G:@Wcd,Df-\.Bl[cpFDl26ATJ:fC1LjhE]lH+-V@0&6r-0<8Q$[':IJ,\5t=@38Q$['
:II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?6q0R9;BSS-6rR&N7n#gA6UXLD-OgDt
A7TCp4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-6rQHN8PiAS8Q$[':IIWR
<)Z1V;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<jBl\8;0F\?u$;No?+D58'ATD4$AKYMtF*)G:@Wcd,
Df-\=@rc:&FE7luF`:l"FCf3*A8PamBkCptF<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU
:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5
F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)
8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q779^F4%`::7nHZJ8Q%WB:IITH6UXLD
%15^'6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C6qL8c$;+)^<_Yt)Eb0&u
@<6!pDe't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA6UXLD4%`::7nHZJ:I@NA
;@NsB$;No?+Co&)FE2;F+C]J-Ch+Z)De!3lAISuVDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16c_F*)>@H"q8.1,fXLB4YslEa`c;C2[W*/KeP:@;]^h
+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0eP.&/KeS8Fs&2W
BlGL1$4R=b.Ni+m76s[V+CT.u+CJAE7pmHV@:O=r+E)4@Bl@l3@rGmhF!+n%A7]:(%13OO+=\LA
A8lU$FC655@;BFq+CQC1ATo88E-,f4DBN=V:JsPK9gM]W78crJ<(LC>FD,*)+D,P4@qB^(FD,5.
%144#+<YW3FD)e2DBO%7AKYhuF*(u6+D,>(AKY])FDi:DBOr<*F`\a:Bk)7!Df0!(Gp$[AASqqa
+<VdLBkAK0BOr<*F`\a:Bk)7!Df0!(Gp$gB+CJ)95t"LD9NbaU+B3#c+DkP$DBO(CAKYo'%144#
+<Y&]:JsPK9gM]W78crJ<(LC>BlbD=D]j(3F(KG9FD,5.Bl8$(Ec,<%+E1b2BQG;1DBN=b76s=;
:/"eu%144#+<Y3/@ruF'DIIR"ATJu9BOQ!*BOQ'q+C\nnDBNe7G%G2:+@0U]ATAo*DfT?%DJ()2
@<?1(+:SZ#+<VeKBOr;sBk)7!Df0!(Gp$sHF*&O6AKYK!Df]K#+CT.u+ED%3E+NouA1e;u+:SZ#
.Nfj4Bk1db@<*K&Bl%@%+E(j7;b02+1,Us4BOPsqATJu&Eb-A2Dg*=JEbTW;ASrW$F`M26B-7Wj
+<VdL@UWb^F`8I2E+*6lA7-NuE+O&uFD5Z2F"SRX7W3;i@UWb^F`8H[1*C[PAKYT!Ch4`'F!+jI
12:K2F(f-+/p)>[?k!GP$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!
DKKqB7:^+SBl@l<%13OO+=\LADIn$&?m'?*G9D!9CLqQ0?t=4tATT%B;FOPN8PVQA741/O?m&lq
A0>8jE-#T4+=BHR6V0j/2((I??m&m!+Co%q@<HC.Et&I!+<VeNBOu'(@rc-hFD5W*+Dtb7+Co1r
FD5Z2@<-'nF"Rn/%144-+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)+C\nnDBN@uA7]9o
FDi:0C2[X%@<-4+/no'A?nNR$BOr;sAS,@nCig*n+<VdLBlbCO/0K%WEc*"<AnE00Bln#20J4JL
BOu'(0d'mI;b02+1,Us4BOPsq+DGm>E,oN%Bm=3"+EVNEFD,5.F*(i2F<GL6+CoV3E"*-s+<VeJ
@rc:&FE9&W<+ohcAoDL%Dg,o5B-;;-F*)IGAoD]4A9Da.+EM%5BlJ/:Bl8$(B6%^.GrcBA%144#
+<VdL+<Ve:BPV9iF(f*$E*m$gDe*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKD
F!hD(%144-+<WrmDIn#7D.-ppD]j%B@;KXiBk;<-?qF0t:-r>2@rGmh+D>2)+C\nnDBN@uA7]9o
AoD]48p,)uFCfJ8DJsW.@W-1#F"SS1DffQ"Df9D6Anc'mEt&I!+<Ve:@;[2sAKZ&9DfTE"+CT=6
8l%htD.-ppDf[%FBln#L%144#+<VdL+<V+#+<VdL+<VdL+AP6U+ED%%A0>c.FCep"DegJ(DIal2
FDl22%144#+<VdL+<Ve@E-Z>14ZX^.FCmKTEb/Zi+=D&FFCep"Degt>E-Z>1-OgD*+<VdL+<VdL
1a$a[F<DrKDffQ"Df9DuBlJ?8@OF6/:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV<+ohcE-67FA8,Oq
Bl@ltEd8dH@<?0*BlbD7Dg*=<DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et%144#+<Y3;D/aPK
+@^9i+D#e+D/a<&+EV:.+CJr&A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D%143e$6UH6+<VdL
+<Wa,-YdR1A7]p,C2[W*F`_>6F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>E,oN5BlA-8Cj@.E
BQ&*4/g(T1%144-+<Wrm@Wc<+Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen51FXG[@<3Q#AS#a%
@rHC.ARfgnA1euj+Co%q@<HC.%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfguGp%0>F<GC2@:X(i
B-;;7+CHlG2E!H9E-67F-RX+VEb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL+<Vd9$4R=e,9n<c
/hen51a#8!@WHU"Ed8c_3%Q1-0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn$6Uf@8g$,H0Jjnm
AStpnARlp*D]hXp3A*-2@;]TuFD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:gB4YTrFD,B0%144#
+ED%5F_Pl-A0>;'@q]:gB4W3-D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.@<?4$B-;A/EcYr5
DBNh>D.7's/e&-s$6Uf@?pmgb8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnBAfuA;FWbR5ARlp#
DfTD3FD,*#+>u&!A8,OqBl@ltEbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=FWb+5AKYN%Bl7Q+
F)Po,FD,B+B-;D=Df022+:SYe$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`CER)#DIIR2+Cf>,
E+*j&@VKXmFEnu\+Dkh6F(Jl)FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO,9nEU0eP.41,C%F
@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:/hf+0F!,UHAKYo'
+Bq?1:gGJ_FEDJC3\N.!D/a<*@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7
%144#+D>2)+DG_8Ec5K2@qB0n@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+)
@;]TuE,oZ2EZfO:EcYr5DK?q=Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h+E2@4@qg!uDf-\3
DKKH&ATDi7Bl5&(Bk)7!Df0!(Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7+<Y0&DBNt2@:UL!
Ch.*t+D#e>ASu$iA0>T(FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.DId<h+DG_8AS5Rp
F!,RC+CJqrBl%@%?k!Gc+<Y04D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3@:UKsDf03!EZfI;
ASj%B<+oue+Eh=:F(oQ1+CSekF!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKqF'p,!DIaktA8lU$
FC655D]j">AThX&F<G[=AKYi(F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9A79Rg+DG^9A8,Oq
Bl@ltEbT*+/e&-s$6UH6=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8Bl@l3De:+a:IH=G
ATMF)+F.mJEZdtM6m->TF*(u6+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)
$4R=b+<VdL+<Ve%67sBi@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+
+CT.u+EM4=F<F0uA8c[0%144#+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>AKY`,@<?0*-[oK7
A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6+<VdL+AP6U+ED%7
FCB33+A*bbDIal$Eaa$#+EV:.+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;
DImisCbKOAA1q\7@<6O%E\;'@Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImis
CbKOAA1q\9A1hS2DC5l#%144#+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-Eb/c(A8,OqBl@lt
EbT*++E1b7Bl7Q+@<?U&DKKT2DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"Gp$g=@rH4'@<?3m
Bl%L*Gp$s8F)tc&ATJ:f+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL+<VdL0HiJ20JO\4
C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b+<VdL+<Ve%67sC&
D]j1DAKYo-A0<:0AS,k$AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"G%De<D]j+4F<G[=
ASiP!$6UH6+<VdL+AP6U+AtWo6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0+A*bbDIal3BOu'(
Eb/ltF*(u6+DG^98g$,H0Jj4G%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2+AtWo6r-QO=WhEr
+CT.1DerrqEZf*+$6UH6+<VdL+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4+=C&U5t"LD9N`_P
$4R=b+<VdL+<Ve%67sC&BOu'(Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-EZbeu+<VdL+<VdL
Eb/lo+=D)DA7TCaF=0-t@lc8eBOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3762Q*AfuA;FWb+5
AKYo/Cj@.;DKKH1ATMs)A0>T(+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-ATq^+%144#+Eh=:
F(oQ1F!,C5+A+7/=`8F*@ps6tA9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9D/^V=@rc:&FE8R5
DIal1ASc9nA.8kg+<Yc>ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!Df0!(Bk;?<+B3#c
+A,Et+DkP)F^])/AU&01@;0V#+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9<-<5!Bl7Q+8l%ht
7!3?c+B)cjBlJ/:<,u\_CNCsJ@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+@;]^hF!,RC+EV:.
+E_a:+E(j7FD,5.Eb/m+Cgh?,AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:DfT?!A0>r3D.Oh!
$6UH6@:X+qF*)81DKKqBFDi:0Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%+EVaHDIm?$De<T(
GA2/4+CK57F`_4T+>@1GE,oZ2EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c+EM+9FD5W*+EM47
F_kS2@V$[&ATMs3Eb/c(@:jUmEZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#+CSf(Bldi.@q]F`
CM@[!+D,P4+CfG+FD55nC`m5+A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4Ch[a#F<F1O6mm$u
@:EqeBlnVC%144#+EVNEA7]1c+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&+B<;n@rGmh+EM[E
E,Tc=+D>2)+CT)1@<lo:E+*d/Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+qF*(u(+EVNEF)Q)@
+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfAEc5u>+DG^9FD,5.
Eb/lpGT^RBE,oN2F(oQ1.3NMHG9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge3Zoe"GB.V>B."gB
G]P!U/g+\BC`k)Q%144#+Ad)mDfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<Ec5u>+D5U8FDi:D
BOr<.Df?h8AThX$+EVX4E%VS,%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%
DBMtgEbSs"F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8
+EM+*+CJr&A1hh3Amc&T%144-+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)
ATJu<Bln#2-XS5DBl5&6ATN!1FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!@"!H2+Co%qBl7X,
Bl@m1+Du+A+EM[EE,Tc=ARlo8+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgTF<G(3D/E^!A9/l(
Ble60@<lEp+D,P4+A,1'+EVNEEb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86EZf=>E$0:BF"Rn/
%14=),9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8co
Df9D67:^+SBl@l<%13OO+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-
FCB9*Df-\>Df9G7F`:l"FCeu6+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;e
C2[X!Blmp,@<?'5BlJ?8@OV`n%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.
-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?
%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQn
AfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:l
Bl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+
@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]
0K;c^90u?J6spH2%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+
7:^+SBl@l<%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.YA7]:(%144#+<V+#
+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj%144#+<X[*AS-($
+D,P4+EM+9FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;B
FCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ:f+<VdLEb065
Bl[cq+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!
+<VeJATW$.DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV
?t!SVCi<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33
F`8sIC3*bl$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&/heD"+@KdNASkmf
EZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$
A0<HHF(Jo*?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>@;]soA0=K?6m-)Q
@<?X4ATJu&Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^hF!,[@Cht5(Df0W1
F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.
+D5V$Cb?/(%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'@r$4+,r./EATTP=
E-Z>1.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&
@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(
Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!
G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph
:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.
D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-
+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.
EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A
/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$
A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`
Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j7
8l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"
EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&
?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8r
B4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b
+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7
Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>
AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG
+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-
F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e
,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o
?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*
@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.
FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE
3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'u
Dfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:D
BPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'
+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)
E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16
C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>
DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7
F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A
%144#%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6
+<VdL+:SZ#+E2.8F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<
Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#
+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q
@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0Ol
DJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4
BkM=#ASuU2/g)8G$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL
+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL
+<W*B$6UH#$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9o
FDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3
DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4
F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL
+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y34
4Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"+:SZ#+<XWsAKYr4
AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&
DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+<Vd9
$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+q
F*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1i
DKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*
BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>
ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7F
F*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'
Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d
-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',
De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'
%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>
DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6
@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9
EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l
/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE
+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!X
Bk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD
1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58+
+E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL
+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap
@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO
+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.
@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(
+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1
?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q
?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9
@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7k
B-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!
Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&
FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/
+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2
$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8
A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/
FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,
FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm
@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-
/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL
+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044
+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt
$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2
-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"
F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p
$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO
%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b
.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIakt
E-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImis
FCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)
@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?
F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgI
Ecl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:
@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%
D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+
F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86
ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG
/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.
+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#
+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@
5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;
C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9
+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?
F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7
A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.
@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$
ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,Oq
Bl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?p
Ci_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/
C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!
Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5
D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?
F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-
+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1
+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#
+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrq
E\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+
A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]Ua
Eb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`fr
FCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).
BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7
Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!Tq
F`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b
+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t
%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(
DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LA
F*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$
F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s
%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.
A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%
EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#
DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq
+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^h
A0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'
CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)
Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ft
FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-
ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/
A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6
@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IF
BOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'
DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`
+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.
F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-
F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve2
8l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.
F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++
DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:
.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"
Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$
$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l
:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0
EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8
F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe
$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tE
D/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9
BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s
+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7Zll
F!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-
+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.
FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3
E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;p
A7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*
8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'
Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#
Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL
+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#
+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdk
ATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9
@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL
+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O
+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:
ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR
?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI
3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)
AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEn
F!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKT
AKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80
I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=G
H$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo
+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+
Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6L
FCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth
+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'
EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa
/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2
ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOA
A1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LA
C2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8
DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"
$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59
-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*
+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+
FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\k
Ebf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@
DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"
$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV
/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF
+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*
?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$L
F*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0
%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+
?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#
A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;
F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=
D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-
De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4
Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*+
+EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.
D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cp
FDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1r
FD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/
A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&
+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk
6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0
A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S
+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8
/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-
@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%
+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#
+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[Wr
ASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0
+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LM
Bl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo
+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-
C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/
+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[Wp
DfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9
D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+
@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,
@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G
$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm
@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7
?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;
D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N
?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/
Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6
Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ
.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?
+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!
+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#
+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2
FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u
%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:B
AS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr
@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)
AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$
+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l
8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h
/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/
A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(
DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0
+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1
@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c
+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL
+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#
F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#
Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8
Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6
Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^E
E&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$M
E+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0
+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u
:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(
/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8
/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:
+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e
,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B
85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/
+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-No
DKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$
AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-
DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?
FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-
E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3l
Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8
@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3
Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m
+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>
A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et
+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOs
Ec3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT
.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#
%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'Ds
Ea`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&
F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031
ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=
+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&
F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-
BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e
,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/
EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;
G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO
+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'
D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&
+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7C
AISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopn
ATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,Lo
ASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q
@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%
0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6
G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*
@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*
/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e
$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4
+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEu
EccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&
0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//Kdbr
Gp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO
,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr
/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhu
DKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3
BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$Zl
Df0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*
@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&
D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq
+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0DfU,<De*Bs@kouU
ASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK&/i#=-/KeS8Fs&2WBlGL1$4R=e,9n<c/hen52'>2(EbT>4
1b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%+E(j7DfBf4
Df-\-De*E%FCAWpATJu.DBNA,E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9<+ohcCgh?s
ATAo8@:F%a+>GVoBlbD7Dg*=BDBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1@q?cpDfQt4
F`_bHAKYK$A7]g7%13OO+=\L4Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGnASrW!A7T7^
+EVNEFCAWpAKW]_/e&-s$6Uf@<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!A867.FCeu*
FDi:CBQ&);%144#+EV:.+Dtb7+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n0J5+:+>"^.
@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*DKI!U1*C:K
+CJr.DfTB0?m'?*G9CR;Ch.T0FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!+<Y?/
CiFG<8l%htA7]1c+EqOABHVD1AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+0
F!+n/A0>GlEboH$EX`?u+<X9(F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-+@C'f
Eb/a&+CJVeG$lG0Df/uo+CT;'F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D$4R=e
,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b
.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nfj%
Bl[cpF<G+*Anc-sFD5Z2+CT5.ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1HE+*j%F!+n%
A7]9oFDi:3Df00$B6A6'FD5Z2+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+
0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/ATo7_D..a/
DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJ
D..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.
+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pq
Ci=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,
@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G
0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJATAo0@:C?u
A7crmA7T7^+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$%144mE+*j%
+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#+AH9b@qZu?
3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj/oY?5
?m'<)A8,XiARlp*D]j1DAKXNC<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHOEb0,uATJu9
D]hY<9H[hY@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi6tKk>D.7's
+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe@r$4++D58-
+EM+(FD5Z2+CSekARmD9%13OO+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%A7]9o
/Kf+GAKZ).AKYMtEb/a&DfU+4$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[Wn
De!p,ASuTCE+EQkDdt.($4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8
Bl@l3@WcO,+D,P4+A*b:/hf"&@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu
/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe$6pc?
+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSekARmD&$4R=e
,9n<b/ibOE3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LTFCB33
+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;DerrqEcW@3
DIak^:IH=A@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,8l8P?%13OO
+<W-VDIn#7@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@%13OO%14=)
,9SZm3A*<P1E\7l9jr;i1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#78ono_FE_/6
AKXKWF@^O`+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'
$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[E
E,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/Kdbr
Earc*1,(7%1,(F@%13OO+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.
0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU
0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)
@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<
+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc
$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB
6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+
DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6
BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSB
DJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*
1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'P
BHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO
+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&
A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#
+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m
8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,
?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&
1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,
ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%
H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4
A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ
1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L
-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_
0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cm
Gp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt
+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y
@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91
Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-
BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.
@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^E
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'n
CggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I
+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!k
FD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4
F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:g
B4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16ig
A8Gt%ATD4$ARBA!Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9
>]aP%FEDVOC2[X!Blmp,@<?(/+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m6
8g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)
DfTJDGA1i,02-)%ATD4$ARBCsDeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4F
Ao_g,+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/
B4W`EHV.(%+Co1rFD5Z2@<-XA+D5_5F`;CS%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"
F#ja;>[h8WBl89/DKTf-Eaa'$I16NgBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8
@XWT'F(oN)+DPh*Ch\!&Eaa'$+Du+>AR]RrCOIfX%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N
0PYN:Ch\!&Eaa'$/no9MDIS#'$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&
Eaa'$/oY?5I="t8Bl7Q+C2[X!Blmp,@<?'':ddd$/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QU
De*ZuFCfK$FCd(DA7g6!$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5I=">(
EcP`/F<F1O6m->TDKTB(I4bs9+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/%144_DJsQ4
@;L"!H=[Nm>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC
8T&W]Eb8`iAUP!p%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?RH#R>8
Ch[d&HW3O-;c#bT6r-0uHX'<aEc#6$<,ZQ!<(KSZ:dIiE:I?6I+<VeTI9Trq@:s.lAS-:'An*l$
84c`V5u'gD6[`5_>XNFHD.RU,<,ZQ!Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+
DBO"6ASc0*E+*j%I16NgBR+Q.EboH-CO9Z3Ec#N&@:NkjAU&WM>Y]3XD..6[Dej]3DfT]/Amo1\
FCf\>+<Z)\>?l,UB4Z*pAp\6(@le4?Ec#N&@:NkjAU&W/+C%9PD/Ej%FB!0oHY.2:D..O-+D?%>
ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0I16NgBR+Q.EboH-CO9]7E,961
I=#3oDfT]'CfG=gHY7A<Ch[u6+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9B6%s-Blnc/+C%9PD/Ej%
FB!0oHYm2,AKYetFCf\>AoD]4B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'Bl@m;HX'<a
Ec#6$<,ZQ!BkCd`ATMEmFD5Z2+<VeTI9Trq@:s.lAS-:'An*l9Amo1\F(Jj'Bl@m;>p*B>Df'?&
DKJirCO9c5FCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5BkCk'HX'<a
Ec#6$<,ZQ!BkCit+<VdL+<VdL+<VeTI9Trq@:s.lAS-:'An*l9An-6p+C%9PD/Ej%FB!0oHY.2:
D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G]\?C$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$FCflI>Y]3X
D..6[Dej]@ATV[*A8Gt%ATD4$AKZDL>?l,UB4Z*pAp\6(@le[BFD>`)Ch\!&Eaa'$I9dt#6Z6gY
ASuThDej]=Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9
E,oMuD.7<mI16NgBR+Q.EboH-CO:2JCghEsG\1u?DfTB0I=#3oDfT]'CfG=gHZaOK@<?(*Ao`*6
Eb'56I=5=)E+*BjEb/j0BkCj9Fa%Y1FCf]/Ed)GBA930)+C%9PD/Ej%FB!0oHZa4MEa`p+ARlp"
@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@I16NgBR+Q.EboH-
CO:8DEb'!#FFAL@:2b/i@;Jn]CO:8DEb'!#F<D\K+<VdL+FSZB>]=+aATD?oHYI)%3d5L_A8Gt%
I9dt#6Z6gYASuThDej]:@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLaI16NgASu%*882^MCh[Nq
FD5W*I16NgASu%*;eTTMARp2u$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC@;]Tu
8l%j'%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.tF<G[=
AKXSf@rGmh+CT.u%16Wa@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XlE*$=%%O
B5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI
6m-#S@ruF'DIIR"ATKI5$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,ASuT4Ao_<m
D.RU,F!+n3AKYPuFD,6+3XlE=+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(GA\O9Ec6)>
+Dbt6B-:`'@s)X"DKKq\+C')$EajDO+?:QTBle59-YII<F`;5,D.P)B%144#>\S:kD'3(W@8pf?
>Te*1AnGb%ARlp#@:O=rF#kFKG%G]'Ho)sVBle59-YII<F`;5,D.P(G-XUe8Bk;KqFCf\EHjpE*
+C&JqA:&$4ASl.-AUP!p%14C(>\S:kD%-gu+<Ve%Df..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.
+A,Et+D5_5F`8I:ART+\Ea33pDffl8FCfeuBPDMs$7-f;+<VeCBl.R+@<?4%DBNe)Gp$R-+D"u&
ARlotAftf0+C\nlDf'',+CQC+Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%14C(+<YlBFD)e9F(KK)
D_5p:DIdZq+Co&"Bl.R+ATDiE+@UHbEd;b?Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&I=2P3,p4<Q
@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1
/e&.6+<Ve3FCf]=FEDkEDe*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).
@<<W+F!,=.Ebf5s+Dbb-AIStm+<VeKBPDN?%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p5rL/j)7F
IXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%14C(:-pQs5(7s0INT(,,p6H(
DIe*;ATD6gFD5T?%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$+C'#"G]\%L
HYRJ0Ch\!&Eaa'$I=2P3%16?^AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"GB5;X9PJBe
GT^F4A0=TT@j#r+EcYr5DK?q=Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0
+EDUB+E)-?8g$)G0JO\YDIal!AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\H
Dfm1>F`VXc%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&8l%i-%144#
>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R^
7"$1lF!+m68du+M+CSekDf.0M8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#>\J.hAp\35
FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeN:k@r5XlI=#pA@r5XlI4bs9>\S:kD%-gp+A$Hl
FCB!%+A,Et;bpCk6U`U:$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,Z
Df0VLB4YslEa`c;C2[X(Dfp)1AUSnt:IJ,W<Dl1QI16N++DGm>@;L"'+CQBb+CSekDf.0M8T&Tk
@;Ka&BlkJABln#2>]aP%FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et%144#A8,OqBl@lt
EbT*++ED%5F_Pl-A0>u4+C]J-Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u$$6UHrFCf]=
FEDkEDe*ZuFCfK$FCd(Q%16?SFCf:u$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.h
Ap\35FDu:^0/%9QDIdZq/oPcC07A1d@;]Uo@sos=$6UHrFCf]=FEDkK@;]Uo@soJCATDj+Df-\&
FCf]=FEDjb/ibO=/hqbs@;]Tu@V'h'DIak!$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+
B.b<'EbTH4+Eh=:F(oQ1F!,L7EHPu9ARlp#De*QoBk(RnBl@lA+B3#c%144#AoDL%Dg,o5B-:Z"
DeC23Df^#A+E2@>G%kJu+Dl%;AKY])AoD^,@<?4%DE846+<VdL+<XouAS5^pHY%);D.R`rFCfk0
$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=8
0JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKaA8bs#;gE8&
@<`ncBkM*QBkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*m
Ch[NqFD5W*07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TC
B4u*qB4uC$DJ(VNHVe-gA8bs#@UX=hA0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca+C&ttEbTK7
F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<
0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!
H=[Nm#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o
0etC:0J>+706:]ABe=.8FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca+C&ttEbTK7
F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<
0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp#DIe**DKTf-
Eaa'$I16NgBlmp'%144#6?R!YA0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!Blmp,
@<?(/+DGm>@3A/bB6%p5E%W8*:IGX!+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>F"SS7D]in*
CLnVnFCf]=FEDkEDe*ZuFCfK$FCfkCA8aL<$4R=g+C&AeB5)71G%G]'@<?4#I16N0+ED%5F_Pl-
+=Cf5DImisCbKOAA1%fn,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g3Ci^^H
C2[X!Blmp,@<?'.%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*q
BkM+$Bl7R3>?q[F>Y]3XD..6[Dej]?AT;j,Eb-AA>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+
I:m,/ATD3q05>E9>]aP%FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!
4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-
DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHYmS?+FRKn
FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16Ng
ASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!
Df0!(Bk;?.@rH7,@;0UnDJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%14C(>[h8W
Bl89@ATD6gFD5T?%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+C&JqA:&K2
EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!
De'u=>YAXRGAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5
FD5Q4>]aP%FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[
Dej\BDe'u=>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?O
DIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+A?]^A0>-!AU&<=FF.b@A8Gt%
ATD4$AM/BR6"Y4MEZf4-CM@[!+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk$6UI-Ddd0f
A0>]&CLnVsDL!?s+EM%5BlJ/H%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7#B@:UK.C2[X!Blmp,
@<?'.%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3
>?q[F>Y]3XD..6[Dej]9Ddd0!I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$
AR'=gG][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:k
D%-gp+B)in+CQC:DfTW-DJ()&Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%
%144#>YJR*AQXCnBl%@%/g*GrC`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.A8-'q@ruX0
Gp%0IARfFdBk:ft@X/Ci+<Xp2AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%14C(>[h8WBl89@ATD6g
FD5T?%14C(F(KH.De*ZuFCfK$FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9
@s)X"DKI"3Bl[cpFDl2F%13OO,p78?FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQU
GA1r*Dg-73$7-g9ATV[*A8Gt%ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0Fa+?&,p6H(
DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'
CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5
F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"
DKI"3Bl[cpFDl2FI16Mm$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=
EHQ2AATMR'B5D.+I:G<CFCf]=@UWb^F)59+BR>/LASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL
+<VdL>XNFHD.RU,<,ZQ!:-pQUGA1r*Dg-8N%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]m
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[RP\Df'&=C2[d'06CcBE*RKrG][qJDffQ3Bl7R"AUAiR
+<XoVDf'?&DKJirCO8fC/g+tEDKU2P%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(
<,ZQ!>]aP%FE)GAFCfN-DJ*csH[U?bASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL+<XoV
Df'?&DKJirCO8fC/g*b/A7]@eDIm?$AoDKrATDj?%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)m
BOPF_A:4mo>\S:kD'2bgF<GL@FD5Z2@;I&pF`_;8E[YuX+EqOABHUi2@:X(^+C'#"G]\%LHZNb?
C2[X!Blmp,@<?(//e&.m@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA6=FtQ@;]=lAU&<:F`2A5F(oN)Ch7sAI9]NcEc#6$<,ZQ!
+EM+9C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#
F(foK@UX@g@<Q3eFCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUF(KG99OUn3=<M$p
FD,T5.!$g[FCf]=+CT.u+Co2,ARfh#Ed<'B$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[
I16NgBlmp'%144#;KZk">]aP%FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#
F_t]-F=n\@FCf]=FEDkBEc>i/FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9FD,5.GAhM;
Bl7Q+A8-'q@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.B6%p5E$0%,
D.P=/$4R=g+C&AeB5)71G%G]'@<?4#I16N0+D5_6Ch[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">CLqQ0
C2[X!Blmp,@<?'5FCf\>%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88g
BkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]4Ec>i/F<H!:;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)
Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=35C6Z6gYASuThDej\p67sBt@;BFq+DPh*
Ch\!&Eaa'$/p(ZL+FO\+>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHk
F(HJ!9OUn3=FP@1+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU
+:SYe$6UHW+EM4-Cht58@rc:&F<Du:FCf]=FEDk=@<?o?DfQt*FCf]=FEDkNBRM<PBlbD@EbTW;
ASrW4D]j.8AKY6"AU&<=FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<
AKZ&*EHPi1@q?d$Aft>P@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#
D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK
%144#>]aP%FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*
Eb0<'DI[6#De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*
Eb/Zr@VfTuAnc'm%144#>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;
Bl7Q+A8-'q@ruX0GqKO5>\.e`HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(B
FD5W*F!,aHFWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:k
D%-gp+@TgTF<Fh1AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==
@V'R&De:,+DId='%144#@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)F<G[=BlbD6@<iu9
ATN!1F<G:8+Eh=:Gp$pADJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3
+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%OB5)71
D09Z:Bk)'tF+&BkI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?SFCf:u
$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"
DJ()+Et&I!+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l
0Hak=@<,ddFCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%
AKZ&.H=\]O=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((sFCf]=
FEDk2;F+,Q76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9%16?S
FCf;3%144#>]aP%FEDVOC2[X!Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%BP_BqBQPA%ASlC"
HZsL=E,]B!I3<!;G\(D.8g&"iF`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7+E(j7F*)G:DJ+#5
@;]TuDffZ(EZf:BBOu3,FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+ARlp$Df0H2F`)7C
FD,*)%144#@rH7,@;0U%Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&>]aP%FEDVOFa%Y1
FCf]/Ed)GBA93/M+EM+*+E1b%AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+#SK$6UI$@;[2s
AKZ,:ARlp*D]i\(DImisFCcS"ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4F*1u++EqaEA9/l8
BOQ!*@ps6t@V$[!@;^3rCi"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8BOr;uBl%@%+D58'
ATD4$ARlomGp$@6AU&<=FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0F)Po,+DkP)F^])/
ARoLsBl7Pm$6UI*F!+n-G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>IASu%*ASuX-ATD4$
AUP!pC2[X%@<-4+1,2Nj/h1USA8kstD0$h@/M/)UAS,@nCige1Bk)7!Df0!(Gp%'7Ea`frFCfK6
/e&._67r]S:-pQU<+oue+D,>(AKY].+E_a:A0>u4+EM+9+<Yc>AKW++AS,@nCigdBA8,OqBl@lt
Ed8dH@<,dnATVL(Et&IO67sC&@:F%a+<YB9+EV:.+DkP.FCfJ8Anc'm/g+5/ASrV5@3?\1ATo8-
Bk)7!Df0!(Gp$gB+CfG'@<?'k%15is/g,7LAKW+7@<,dnATVL(F!)T>DBO%7AKW+4@<6O%EZet.
Ch4_tEb-A9F(Jl)FDi:CE+NNnApGLAFD,4p$;No?+E1b0@;TRtATDi7AoD]4@3BMtEcc#*F_kK,
+Co1rFD5Z2@<-WG+B3#c+<Yi=Eag.>A8lU$F=A>B@;ZM]:-pQU@V$Z)+E_a:A0<":D]g/FD/Ws!
ApGLAE+*cqD.Rg#EZcKGATW$.DJ+#5+<YB9+<Ve@DIdI)Bk2?pC^g_H67sBkBk)7!Df0!(Bk;?<
+<XBeF*(u6+<Y91Ch4`.@<,dnATVL(F!+t$DBNk8Cj@.4AKYJr@;]^hA0>?,%15is/g+_9Bln',
B-;;0BlbD/Bl%?'@;]TuEb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch54.$;No?%15is/g+,,AKYhu
F*(u6+D,>(AKYJkDBND"+ED%'Eb/[$ARlp-Bln#2FD,5.@ps1i3XlEk67r]S:-pQU@rc-hFCf;t
F*(btC2[Wi+A,?o;cH1`?X[\fA7#cQ:-pQB$;No?+BLj,:.\2N3ZqjIC`mh5AKW+7@<,dnATVL(
F!+t8EcP`/FDQ4FCh[s4ARlolEb-A6AT;j,Eb/c(@X/Ci:-pQUFD,5.8l%htF*VhKASj%B8S0)j
Dfm1CASl@/AKYE!Gp%$;+EV:.D'2GH6m-\fCht5(Eaa$&/g+;8FU\[Q67sBj@;[21F(&ZlCj@.3
A7QfkA7TCrBl@ltC`m\*Ea`frFCfK6+C]J8+<YrJFW_f:@;]t$F<GX5An>e(%15is/g,1GD/XT/
+CfP7Eb0-1+E1b0@;TRtATDiE%13OO9gM]W78crJ;GC(Q3Zp+!3Zp*c$4R>;67sB[BOr;uDfT]'
F<GL6+EV:2F!,F1Ea`frFCfJ8Anc'm+DGmX%15is/g)8Z+<YE:@;TQu4!5qnH#R=D+Co&)@rc:&
FD5Z2+?L]h@;L't%15is/g(T1:-pQU+<VdLC2RHsAKY].+CQC9@;KXg+A*bo@;TQb$;No?+<VdL
+=M>WE+LI@A7]glEbTK7Bl@l3A8bt#D.RU,F!,R<AKYr#Ea`frFCfJ8/Kf.\E+L/+F!,L7EHPu9
ARl5W:-pQU+<VdL+<VeFDJXS@-nB"LFCf)rE[`,FF!+t8EcP`/FDQ4FAU%crF`_2*+E)@8ATAo8
H#R>9+EqO9C^g_H67sB'+<VdL+<Y-)+E1b1F(Jl)@<3Q$BOPpi@ru:&+Dbb5FE8QQF(Jo*A8lX!
@VfU)/e&._67sB'+<VeM@;L't+DGm>@;[3!G\(B-FCAWpAKXSfAU&07ATMp,Df-\>BOQ!*E,ol-
F^o!(+CQC9@;L't%13OO5uU-B8N8RM+<Vdg+=JaSDKKH&ATB4BGA(Q*+>G!]F(HJ&F(8ou3&Mgm
DBNJ4D/aP=-nlc^EZd(c+<VdL+<VdL+<VdL4!67#+:SZF:Jb1`5snUI;BS%D-nB"LFCf)rE[`,@
Df'H3DIm^-F!+t2E+rlo+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<Vdg+>GQ(%15L!6WHiL
:/jVQ6W>0i+=JaSDKKH&ATB4BGA(Q*+>G!LBk)7!Df0!(Gp$X9@s)X"DKI"8F!,FEF<Dtc+E)9C
0e"4f+<W`g0b"IX:IA,V78?f`8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#
F_t]-F<G[:G]Y&V1,(h94>JcO.3K`p+>tq`$:Ilg:e!`<<)6C74!5q%Bl8$(B4Z*4+E(_(ARfh'
+CoV3E+NQ&Bl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e+<VdL+?L]'0F\@Z78u`B6W?iZ+<W`g
-nB"LFCf)rE[`,TDfTB0+ED%8EbT*.ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg
+>Pf.%15p3<(9/@<)6C7+?L\o.qrmCAS5Rp.3NhQEb'56F*)>@ARlotDBNk8AKYf-Df?h<@<6K4
-o!D<Gs!i91cQp,+<VdL+<W`g0eb9j$;s;l5tOg;7n"OC4!5q%Bl8$(B4Z*4+EqL1DBLYVFD5T'
F*(i-E-!.1Eb-A7@<Q3m+DG^9A9Da.F!)kb+E)9C0e"4f+?L]#%15Wl;b0;V9i)rT+?L\o.qrmC
AS5Rp.3NhJASrVF+CQC+@<6*)BlbD9Eb/isG\(D.FDi:4F_u)=+=JodDfQsT.3K`U+<W`g0b"I!
$;No?+Au!2<(9YW6q'urBlbD.D/aTB+C]U=A7]@]F_l.P+A$/fBlkJ3F!,O8F<G[D+CQB@C2dU'
BIP&r+Cf>-Anbn#Eb/c(%15is/g+bECh.*t+Au!2<(9YW6q'urDg#]4EbT&qF!,"-@ruF'DIIR2
+Dbt+@<?4%DK?q4DfQsKD/=8B+D58'ATD4$ARlp)@rc:&FE8Q6$;sYq<(9YW6q'ur4!5q]BOPpi
@ru:&.3NYBA8-'q@ruc7-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFd%13OO:-pQUFEqh>@ps0r
DJsE(D/aTB+EM+9FD5W*%15is/g+%f:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)C
F"&5Q@rc:&FE8RHD]hXpAoDKrATAnT+F\HSATBG=De*m,Dfd*2$4R>;67sBHDL!@5A7T7^+E1b0
@;TRtATDi7@<,p%F*)>@ARlotDBO%7AKYhuF*(u6+D,>(AKZ21ASqqa:-pQU@rc-hFCeu*@;]Tu
A8-+,EbT!*FCeu*FDi9o:IH=9Bl[cpFDl2F+E(_(ARfh'/g)8G$4R>;67sB^5uLHL:.I>fGA(Q*
+Co%qBl7X&B-9ehAU&07ATMp,Df0V=@V$Zl@<,pkF_i1/@W-C2+EV:.+?L]UBOPpi@ru:&+:SZQ
67sC&BOr;Y:IH=8De*E%-tI:=@:F%a.3N_G@<<W2@<-F#F!,R<BlbD<FE2)5B-:o0+EDU8Bl.F!
FCB38/e&-s$;No?+@Aq$=].g]85p]n+=L`5@<,ddFCfJA+?L]3Cht57BkM+$F!,L7F(KB8ARl5W
:-pQU9j(:Y;F+#G<(0\-4!5q%Bl8$(B4Z*4+EV:.+CT//G@be;4!6@8%14Nn$4R>WDe*g-De<^"
AMPu867sa&De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfV
G[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0
A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is
/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm
@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJ
F`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:
+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh
@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//
%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4
B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?
+AP^3762Q5D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!
FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,
+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3
Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/
A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7
Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is
/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd
%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTq
ARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>
@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(U
ATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%
%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>
ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`
6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[M
F!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/
3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%160-78cQ?9h@K/+=Ci@D.P(($4R>;
67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,
D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9
De*orBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JYdP+=Cl@G%#3$A0<:F.3N\C@<,jk+EMXFBl7Q2
%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(:J48O:IHlk4ZX].-Z3iFDdmHm@ruc>%13OO:-pQU
@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a
+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu
@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@
D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1Lmr
EaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:
+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn
$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c
$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&C
DIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.
Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)
+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi
+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</F
DBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1
+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1
B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQU
FDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%
%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.
F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!
%15is/g,1WDBO%0F`_P<DeF><F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARt
EBQ?;-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=
E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplL
BP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&
E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`
:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5
FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrK
ATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZ
A8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUEb0*+G%De<Ea`Zu
Bl7Q+@VfIjCERY9GB43#Eb/^%@WHC24ZX]k+<u=X><3lY/g+@Z+=\us+u(3E3Zon)03g+P-Qjc`
4Uh`-$;No?+CT5.ASu%"+EVX4Bl%L$B-;#)DIjr&AS#Bp@q]:k@:OCjEZf(.+Dtb#ATMp$Ed8*$
FDPPP3aEjZ+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$tcd%15is/g,4KDg*=?Df021A8bt#
D.RU,Et&IO67sB'+<VdLBP_3%0H_J\+<XEG/g,@VEb'5#$;No?+<VdL+<Y?6A0<WM+<VdL:-pQU
B6%p5E,uHq:-pQU+>=om+>=pOCh+YB+<Ve%67sBkDe!p,ASuU$A0>c.F`)70$;No?+=BoU9i*ku
+D>S%+>=o\:-pQUGAhM4+CoD#F!,[@FD)e<FE2)5B-8Qs8PN#B-OgDX67sB'-s[rH3ZoY4BP_3'
0I\,Y/g*"o:-pQU@rHL-F<G+4@ric2DBNn,FD)*jBP_3B3Zodt-6tVp3[cg-3Zp+*%16f]/g+V3
A7KF_@;9^k?QaS9A8a(CC1LmrEaN6iDe*2t78d#T8l%i/1*CUKFEMVA/g+_CA1e;uBkAt?@UWef
@p`YZDe*2tG<IQ$Gp$X8C`k)Q+CoCC+EnrKATW'8DD!&CDIb@/$>F*)+>>r'-9`Pr4Y@k*/g,?\
A8a(CDei]gC2[Wi+AYX%8l%i/0d(LJFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tA3DOf-n'Ep
Gpt:).3N87F<GcMA8a(CA0>o(FEMVA/g+_CA1e;uA3DOfA0<+G+>=p#+<r3s+>G!c+u(3N4Y@j@
0mdF?$>F*)+>>o&GT^O8/g+[f/g+[I,CUac/h]I<GU>j3.4.5$0d(fe0d(!LASu$2%14L;+F>:e
+CloD/1r&cAR]ajEc6.e-s\ne?SX&qFDPPS-nR%u6W,?[/j:C4+F>:e+Ckog.1HUn$;No?+EM+&
Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+GAhM4Et&IO67sB'+<Ve?
F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;$;No?+<WE^+D>h;+=D5A
AKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'1a!oSF)rHOE,Tf>-QjNS
+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,0IA&++?Co-+?CW!.1HVuAhG38
@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8Ec*KPASu$2%16W//g,B]BP_X*C`n-Y
+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;D_</NCL:LbDe*2t:J48O:IHlj+ED%8
F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O
6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%
DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)DfT@t$;No?+<WK`F)5E4+=CoBA9)6o
BleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E4
4ZX]>-6tVp3[cg-3Zp+*%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8
DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+
ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c
$>F*)+C\biEarHbC2[Wi+EBUt+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae
/itb6+u(3]4YAE2B5DKqF!a'nE]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&Ie
De!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k
4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9
?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!
DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_u
Dg3C8Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq
>n%,M$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2
@q01\EcXB)><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!
6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/
Anc'mEt&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2
-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>
ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[
5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&
De!p,ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&
1*Bd^+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S
?p$\,-o3V*5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6I
FCfK0Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk
-nul+1*Bk14?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj
0edr_/h%uO.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU3
0edr_/h&+q/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,
@qZurA8--.FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O
1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk
4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*
$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=
+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U
+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$A
F(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19
Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-
Anbn#Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBsDdd0!@;]TuF(fK9
+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>i"FD)*jC2e5W3ZqWf+>=s"0JG4(><3lh+DPk(FD)*j
%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;F
H=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+CoV3E$/\3Bm+&1
/Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\
4ZX]5BK@LM$4R>;67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&T
BkAK,Eb0<'DKH<p:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O
4ZX]505>E905>E9E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(E
F`_>6F"&5K@:O=r+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl
$;No?+EM+9+CQC3Eb/ioEcP`%+Dbt+@;I'*@;]Uo@iumG+E_a:A0>?,+=LuCA8Gt%ATD4$ALS`R
+EVXL+=MGIATD?)E+*WpDdt4*$;No?+Abs)7R^3Q779s<:..lF4ZX]56TSIPF(KB5>\@VcEbT#9
F`V,7>X<=J6t(1G>YK'G@;K1F@;]Uo@pEt]DIdZq-OgDX67sBW;FO&D;GoqO:dIiE:I@9++=Agb
F)ipMDe!3l04JX505t?;A8bs*%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.
+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,
Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6
AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq
:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SF
F<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,
A0<7:AT0">>9G^EDe't<-OgE"@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^
:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP150H_qiA7]p3%15R#9LM<I
4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<
77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%
Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9
Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16ig
A7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6
%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)
Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo
05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A
%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX
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
C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%144#+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9
/oY?5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ0
6U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/i"d`$:[fb6q(!:3[\QO
DImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP
8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$?0Nf
A8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1Ado)d
A7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<AAdo)d
A7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX@r$4+
7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQkDdtG#F(oN)
8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<n
De!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)
%15^'6m+m9@s)X"DKI"0CiaM;@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16ukFCep"
DejD:FD,*)+EM47G9CR;G9D!G+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).AKYMt
Eb/a&DfU+a%13OOC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%15RC
EZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9C
G%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?
7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8S
CLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*
+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn
;b9b[4ZXrF/hnt4+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q
3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63
D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6
/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO
8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<
F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$
+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2
+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1
F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1Ums
F!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*+
+CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1
+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^
+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7
AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sI
C3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A
.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S
@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;7
7qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(
+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;
%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'n
CggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HW$H"q8.E,ol/Bl%?90ht%f.W'HGDe*g-De<^"
AKZ%G/KenU+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-Gh
De<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;
C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<
@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?
+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u
:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4
+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6
Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p
+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQU
FDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*be
AThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1
E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is
/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFp
C1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7
+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtB
F(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N
+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>
Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$;No?+Dl7;
FD5]1AKXT@6m-2]F*(i.@qB^(@<,p%E+O',BlnH.A0>?(F<GI>F<GU8@rH4$ASu$iA.8lVE-#T4
+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*+D5V2A0>i-
@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7EcPl)AKXE0
6VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l$;No?+APL&
:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A$:R?M
:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea@rGmh
/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo2CVmK
DffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%
78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y
:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN
+<W%LD]in*FCSuqF!hD(%15is/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"A
DfQt1F`MM6DKI"BF_Pr/%16NV4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq
+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'
AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JO\]DIb@/$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nI
A7m#qASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c
$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\f
A7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HV,+<V+#:-pQUEb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4
ASuT4B6%p5E"*.lGWe)11E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\f
A7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC
+D5R7Eb0?8Ec*KPASu$2%14LlCi"-'Aof(;I4cXTDCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56
Bl5&'F`MM6DKI"6Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA
-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\f
A7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6
%15is/g+e<DImisFCcS)F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$
0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T
8l%i/0d(%FA1eu6$7QDk%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?/0K"V
Blmp-+DG^9Eb0E.F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&IfsFE9T++>Y?bAThu$
$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8
+ED%7F_l/@%17,t4ZX]@-?=3M%13OO:-pQUEcl7BFCfN8+EM75ASuU+Gp"[]Df0B:+E)CEE-68D
+EqL-F<G^IATAo7ATVu&$?C,L3Zp.(EccC4$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0
+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5
E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplLI4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6
+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,
A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU
+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU
/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHb
C2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn
$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#
$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'
1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;
+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9
F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;u
A3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k
?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(C
Dei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*
Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'
1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL
:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]
A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?c
Ci^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"
@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2tE]l#tEb0E4+=ANZA8a(CEZfC6FEMVA
/g+_CA1e;u-upjkF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pm4YD.8EX`@)%13OO:-pQUBOPdh
Gp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0K
De!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-
2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60
@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*
1(=R"$;No?+E27>FCAWpAKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17&mEcbf)@<-EP3a4Wf3?^FB
+=AZi.k<,#.k<,t/LM`L+Boso%13OO:-pQUGA1r*Dg-7FCis6%A76TjDf0W7Ch4_uDg3C8Eaa0+
DJ()%BOPpi@ru:&Et&J#Bl7`s@q]:kF$2Qg3ZpF+3]A00@4lnU0fCOr/ho(0,$uHs+C,E`%15is
/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1
%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.
EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@
1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5
.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1/KeY6F*(u6+EV:*DBL?J
ART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)ART+kA26;/><3lh4"akq-9`P#
3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA
-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn$;No?+Eqj?FCfM9FCAWpATJu&
F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?M
FD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h
0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8
-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2
,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDf[%0DIakuF)u80Bjl*p+Cf>#AISug
F?MZj+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=
+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>jcG3aEji+>Y\q
?Q_EQB657=+AP6U+=]!bEGQ'kD0S3)>p)3O1,:%\+?L]YF<D\K:-pQU.P>gSGRXuh$;No?+F\HS
ATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_T
C2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a-S?bh/0H;_-QjunINViD%143e$;No?
+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is
/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.hCcsg%-nlf*0I]8%F:AQd$;No?+Dbt)
A0>V0F(96)E-*47Ec5e;@rH6sBkMR/ARlou+E1b2BFP;`E'66)><3l\+Z_;"><3lh+DPk(FD)*j
%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;F
H=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+E_a:A0>?,+EMI<
AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%160-78cQ?9h@K/+=Ci@
D.P(($4R>;67sBkF_u(?A9)C-AKWQIF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,
Eb0<'DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`-OgCl$;No?+CoV3E$0+.FD,_</Kf1WARlomGp"MX
FD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+YP<(K/5+=AgWDe(M9De*C$
D/aPL-OgDX67sBK<D?:d;H?U[<(K/5+=AgWDe(M9De*g-G%>`4E-!Z[%13OO:-pQU@r,^bEZen,
@ruF'DIIR"ATJtG+E_a:A0>?,+=MASBl%i>+DkOsEc3'K@r,^bEc?/C.3N>:+E2@4F(K62%15is
/g*MT76sgD6qKaE4ZX]I3[Z9a$4R>;67sC%ATT&'+E2@4An?"'ARlp&@;]Uo@j#]-+EV:2F!,=.
@q]RoAKWQIF`V,)+C]U=-u*[2Ch\!&Eaa'$.1HVZ67sBW;FO&D;GoqO:dIiE:I@9++=BN;>ZGiV
EcYJuASuO&@kMnFATD$AE,\3RFCAEJDe!3l>YnjHA8bs_E+*WpDdt.($4R>;67sBQ:IH=KATD7$
+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is
/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*
+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/
F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,K
C3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I
%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I%13OOH?smPDe*]nBl7:"AU#sc
,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XHCghEsGT^U4Ch54A%14Bj$7-fe:IH=HDfp)1AKY].
+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4rF)to6/g+,,Bla^j,p6f6Ch4_tF)to0@VfUs+A,Et
+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..NtEbSru%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#
AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+FD,B0+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6
@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg
$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4
FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smP
De*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e
%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.
$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6IXWLa8l%j'+B*3$EarZ'6Z6LH+C&.o>\7nmFDc#=
ATMR3AKY6#Ebp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[Ws
C3+f.DJsQ4@;L"!H=_L6$4R=g+Cf>,D..<mF!,(5EZee$C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*
AS#a%@rH1+D/OD;@;]TuBl8!'Ecc#5B-:V*Ecl20%16?]ATVa"DJ+')HX('!CisT4F(K<=HS]5M
I16NgF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%16?^GAgu0CisT4%13OO>[h8WBl89.
De!p,ASuU<%13OO>]!nbATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%16?YDIm<rCisT4%13OO>]++s
E+*Bj%16?SDK'`?H[:!QDe*d0Bk;K@FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d(/p(ZL
I16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[W8FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*p2
DfTDAFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*Bs@P2b6G^U#.%16?XATr*%B4VMZ>\S(p
F`_tVH>7A/D..3k/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++s
E+*Bj%16?SDK'`?H[:!QDe*s.DesJIFCf]F%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%
E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnY
Df0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh
$=%.[A:%j*@s)X"DKL:9$3                                                    ~>
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
zz=:zz,'ERR027 ERR028 ERR029 ERR030 EXPLAIN FREESPACE GROUP HEADER HTML IJF'
zz=:zz,' IJS INCLASS INCREATE INPUT INSIZE IPYNB IzJODinterface JDFILES JDS'
zz=:zz,'DIRS JEPOCHVER JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT'
zz=:zz,' JSON JVERSION LASTPUT LATEX LEAN LF MACRO MACROTYPE MARKDOWN MASTE'
zz=:zz,'RPARMS MAXEXPLAIN MAXNAME NAMECLASS NVTABLE OBJECTNC OK OK001 OK002'
zz=:zz,' OK003 OK004 OK005 OK006 OK007 OK008 OK009 OK010 PARMDIRS PARMFILE '
zz=:zz,'PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK PYTHON REFERENCE SQL S'
zz=:zz,'UITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML ZIG abv afterstr a'
zz=:zz,'lltrim badappend badblia badbu badcl badfl badil badjr badlocn bado'
zz=:zz,'bj badrc badreps badsts badunique beforestr bget binverchk bnl boxo'
zz=:zz,'pen catrefs cd changestr checknames checknttab checknttab2 checkntt'
zz=:zz,'ab3 chkhashdmp createjod createmast ctl datefrnum dblquote decomm d'
zz=:zz,'efzface del destroyjod did didnum dnl dpset dptable empdnl fex firs'
zz=:zz,'tone fod fopix gdeps get globals globs grp gsmakeq guids guidsx hos'
zz=:zz,'t hostsep isempty islocref jappend jcr jcreate jderr jdmasterr jnfr'
zz=:zz,'blcl jodsystempath jpathsep jread jreplace justdrv justpath jvn lfc'
zz=:zz,'rtrim locsfx make makedir markmast mnl mubmark nc newd nlargs now n'
zz=:zz,'owfd obidfile od ok packd plt put quote read readnoun readobid regd'
zz=:zz,' remast restd rv rxs rxsget rxssearch saveobid second sha256 tc tri'
zz=:zz,'mnl tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '
zz=:zz,''' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS'
zz=:zz,' DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 '
zz=:zz,'ERR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 ERR213 HEADNMS OK2'
zz=:zz,'00 OK201 REFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyf'
zz=:zz,'iles createdl dbakf dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dro'
zz=:zz,'pall dropbakdir dropdir dropinv dropnc dropref gettstamps hashback '
zz=:zz,'justdrvpath libstatus loadbakdir loaddir loadnc loadref loadstamps '
zz=:zz,'maxback movefile nummask packdict packspace puttstamps renamefiles '
zz=:zz,'restdict restspace savedir saveref tmpdatfile tmpusesfile volfree'')'
zz=:zz,',(<<;._1 '' jodliterate ALERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJOD'
zz=:zz,'HEADER BEGINJODPOSTP BEGINNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDIN'
zz=:zz,'DEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKENS HINTPFX HINTWORDSPF'
zz=:zz,'X HYPERLINKPFX IFACEWORDSPFX IFACEWORDSjodliterate IFCPFX JLAUTHOR '
zz=:zz,'JLBUILDTEX JLBUILDTEXunix JLBUILDTEXwin JLCLEANTEX JLCLEANTEXunix J'
zz=:zz,'LCLEANTEXwin JLCODEFILE JLDEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JL'
zz=:zz,'HINTWORDTEXBEG JLHINTWORDTEXEND JLINSERTIFACEMD JLOVIEWFILE JLOVIEW'
zz=:zz,'SUFFIX JLOVIEWTEX JLSHELLEXT JLTITLEFILE JLTITLETEX JLWORDLITTEX JO'
zz=:zz,'DLiteratePreamble LATEXTMP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNH'
zz=:zz,'EAD MARKDOWNTAIL MARKDOWNTMP NORMALTOKPFX PANDOCTOKPAT ROOTWORDSjod'
zz=:zz,'literate STRINGTTOKPFX TEXTQUOTESINGLE THISPANDOC UBARSUB WHITESPAC'
zz=:zz,'E WRAPLEAD WRAPLIMIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim befo'
zz=:zz,'restr betweenstrs boxopen changestr charsub ctl cutnestidx cutpatid'
zz=:zz,'x dbquote dbquoteuq fboxname ferase fexist firstones formifacetex f'
zz=:zz,'ormtexindexes fsize fuserows gbodylatex gheadlatex gpostlatex group'
zz=:zz,'latex grplit ifacemarkd ifacesection ifacewords ifc indexgrouptex i'
zz=:zz,'ndexwraplatex jodliterateVMD jpathsep jtokenize latexfrmarkd long0d'
zz=:zz,'0latex markdfrghead markdfrgpost markdfrgroup markdfrwords markdj m'
zz=:zz,'arkgassign markgnonj patpartstr ppcodelatex read replacetoks rtrim '
zz=:zz,'sethintblock setifacelinks setifacesummary setifacetargs setjodlite'
zz=:zz,'rate seturlsha256 srxm tlf toJ tslash2 utf8 uwlatexfrwords wfl winp'
zz=:zz,'athsep wordlatex wordlit wrapQtlatex wraplix wraprgidx wrapvrblong '
zz=:zz,'writeas''),<<;._1 '' jodmake DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMP'
zz=:zz,'MSG3 DUMPMSG4 DUMPMSG5 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0'
zz=:zz,'154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 ERR0161 EXPLAIN'
zz=:zz,'FAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 '
zz=:zz,'PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID '
zz=:zz,'btclfrcl clearso clfrbtcl createmk ddefescmask dec85 dumpdictdoc du'
zz=:zz,'mpdoc dumpgs dumpheader dumpntstamps dumptext dumptm dumptrailer du'
zz=:zz,'mpwords extscopes fap fmtdumptext fromascii85 getallts getascii85 h'
zz=:zz,'alfbits htclip jnb jscript jscriptdefs makedump makegs masknb namec'
zz=:zz,'ats nlfrrle nounlrep opaqnames parsecode prefixdumphash putallts rl'
zz=:zz,'efrnl sexpin sonl tabit toascii85 uqtsingle wraplinear wrdglobals w'
zz=:zz,'riteijs wttext''                                                    '
zz=:5241{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.1+>P&q+>Yc-2'=e"1,(XI+>GSn0f(^D1*ALu0fC^@C2[WX67sB1C2[W*@kB8TD..-r+A,Et
+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3
AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.
A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%
ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU
6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%
$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk
@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*
Ci<flCh5%)$;No?+<Ve8@Wik:+<Ve8Cht5'@:O(qE$0=8EcYr5DBNh*D.Rc2%15is/g)8Z@V97o
+<VdLB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;CE%15is/g)8Z@W$!)+<VdL
@UWb^F`8I@@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;AS`J3+<Ve;ASbq"AKZ28Eb'5B
+EV19FE8uUB6%p5E-!QQD.-ppDf[HPATT&)ATVL(@1<Q=67sB'+Co1s+<VdL+Co1rFD5Z2@<-W9
Bk1dmFD5?$@psInDf-!k:-pQU+<Y34C`jiC+<Y3/@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2
FCfK1Et&IO67sB'+CoG4ATT%;+EM+9F!,"-@ruF'DIIR2+E1b0@;TRtATDi$$;No?+<Ve>A7]_$
+<VeCBleA=B6%p5E$/S,A0>r9Blmo/A7]^kDId<rFE7lu:-pQU+<Y<.F<D\K+<Y<.F<GdGEb'5B
+EV19FE8uUD.-ppDf[HPATT&)ATVL(@3B0&Df$V-Bk)7!Df0!(Gmt*U67sB'+D5M/@WNY7+EqaE
A0>;uA0>u*F*&O;Ci<ckC`mV(D.Oi1AS,LoASu!hEt&IO67sB'+D5_6+<VdL+CfG'@<?''@;]Tu
EHPi5Gp$a?Dfp#?+CT.u+EM[>FCfM&$;No?+<VeD@;BEs+<Ve>ASu("@<?''8g&1bEbTK7F!+n/
A0>DkFCAWeF(HJ)F_u)=%15is/g)8ZD/O/4+<VdLD..=-+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:
Ec5e;E+*j1ATD[0%15is/g)8ZDIn$&+<VdL@rc-hFCcS4ATo8-Bk)7!Df0!(Gmt*U67sB'+E(d5
+<VdL+E)41DK?q/DIal"Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<YW3@r#Tt+<YW3@r!2tBk)7!
Df0!(Bk;>p$;No?+<VeGF`\`K+<VeGF`\aMDfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^))
DKKe>A8,OqBl@ltEd8*$:-pQU+<Y]9B4N,-+<Y]9B5)F/ATBGHDK9<$BleB-EZed5A8,OqBl@lt
Ed8*$:-pQU+<Y]9F*(q8+<Y]9F*)>@AKYetF*&O6@:O(qE$/Y2ART[lA0>?,+=M2;@r#U(%15is
/g)8ZEd2XJ+<VdLEb/m+Cgh?,AU&07ATMp,Df-\=ARTUhBFP;D67sB'+E_a:F!)SJ+EqaEA9/l9
F(Jl)@X0)?DfTB0+CT.u+EV19FE7lu:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]m
F!)l':IH=:EcQ)=F!*.j0J+t83@PCE%16T`@r,RpF!)SQ@;9^k-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/g,7EF))n,A7TUr+Dbt)A7]9oAnc:,F<G16EZdss3A*!?+:SZuAT;j,Eb-@@C1_0rATJu7
AS5S!-QjN@$4R>;67s`uAT23uA7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$Bl5&8BPDN1F(Jj'Bl@l3
BOQ'q+ED%0@<?'k+Co%qBl7X,Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh@j$(?Ci<flCh4`,Dfor=
+EM+9+CoV8Bl7Q+8g&(nDe<^"AKYf-@:X(iB+52C67sB/.OdMA+A#%(8PUC.:-hTC+A#$o:K%]0
%15is/g+tEDIjr&AS#C'+Cei#EbSrpAKZ#)FEMVA/0K%C@N])sA0>]&DIjr%DIdet$;<oP3\`=8
@4hur6W-'.0f+/b/e&.e5sd^q3I>0e%15I#9L_0+6W,I/7L]\6$;No?+DkOsEc3(A@rc:&F<GL@
FD5Z2+Cf>#ATJtG+EVNE@:WmkD/XH++CSek+CQC1ATo88@VTIaF<G(3A7Z2W:-pQU@;]TuD/Ws!
ApGM@BOr;uDes6.GA1r-+Co%qBl7X,Bl@l3De:+d5snOG<*<$d%15^+6W-KP<'<8t0b"I`5u^9T
4ZY>R%15X*9h[]21,B@H=A;IP3\iN$$<0Gr<'<8t2%9mZ=]@gQ3\iT&$;Efa912QW:-CWn2[p*o
<(8i13\iZ($;al)85DuD3\i])$<'eq4ZYAQ%15^+:JO&61GK=G8PiPb69R@c1(=Ra76s[33\rQ$
$<g"k4ZYAU%13OO:-pQUD.-ppD]j.5G]Y'MH#R>9%15fq6W-]Z=\qOM3_E=<;Fs\a/5/?/79D*3
<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hu:g$ag:JNH>;+rN5;bp.>8PiPb67bf!5u&t7
8Oj3s%15is/g,(AC1Ums+Cf>#ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f
%15fq6W-]C3]%9Q%15is/g+\=@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R
%15is/g,(AC1Ums+DtV)AKYK!@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E
:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'
De*E1+Co&&ASu%"3Zq3b8ju*H:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6
<),e)?O[>O$;No?+E1b2BHUhsCh[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(n
Ea`I"ATDi$$;a#f845m?4ZX]W7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<
$;No?+E1b2BHVJ0Eaj)4/KeVA@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#A
AT0dn+=KfN=%Q/6-SJ^P.4-Gk-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7
Df0B:+EV:.+E1b2BHUo-Df$V:F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7
INU%C3Zp",+BplL.kWJ[/g)N&-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9Amogu
F<GF/F*(u6+E2@>Anc'm+E_a:EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.
Ci<ckC`mD&Eb-A%F!,R<Bla^j:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O
;E['UDe*p7F*(u1E+*j%+=Co@@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(
Ch555C3(a3$;+)^<Du=a4Z[=rA93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!
DId9hE+NotASuU2%16igA7TUf:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAb
AU&<.DKBN1DBNk0+=LuCA92j2Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'
@<?'k+EqL1DBNJ(@ruF'DIIR"ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7
AU,D,Eb-A'Ci=B+A1euI6tp[Q@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8
F!+n/A0?&,Eaj)4FD,*)+DkP)@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'
FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIu
Eb/ioEb0,uARm5!$;No?+<Ve;An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8Z
A7fb!ASrV5+<VdLDfB9*+Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0
Gp$^5Ch4`.@<?1(%15is/g)8ZA8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3
DIm^-+Du+?D@HqJ67sB'+CoA(GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mB
F`%Wq:-pQU+<Y34DIXe3+<VdL+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdL
G%l#3@VfTuDdmHm@rri2@;TRs%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8
Et&IO67sB'+CoM2E,K/.+<VdL+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-
+<Ve<Eaa$#+ED%*ATD@"@q?d#Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+
DIal+@<6O0F`\a:@<?''FD5T'F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F
%15is/g)8ZCi<`mDIXe3+<VdLCi<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeC
Ddd0sAS*&-+<VeCDdd0!Eb/ioEb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-
E,uHq:-pQU+<YW3@r#Uh@rrh9+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&
F!+m6@UWb^F`7cs:-pQU+<YW3@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@
@:NjX$;No?+<VeGF`__HFCB$*F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67F
FD5T'F*(i-E,uHq:-pQU+<Y]9F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2
ART[lA0>?,+=M2;@r#Uh@rs./$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4
Eb0<6DfTD3F)YPtAISuA67sB'+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&
AS*&-+<VeJ@<Q3)Eb/ioEb0,uATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]m
F!)l':IJ`3@N]]"DJ*N'1,(C61,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.
A92j2Eb-U-$4R>;67s`uAT23uA7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o
%15is/g+\=Eb/a&DfU+GDJsZ8+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.
<$4\/:K:46;cQCg73G;j6W-]-%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(
D..O.ATDi$$:Iil8Q\>T4ZY\e/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.
Ch[s4+CT.u+Cf>,E,TW*DKI"=Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&
+FH3m6qL9O9iE/c-8%J8+@K1-8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/
F`&=>@;TRs%15Kp;GKSB3]oJV?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#
C1UmsEt&IE8Q&GU:-CX#4"akp+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7
ATMs%D/_$KBl7HmGT^g:F*&O5DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN
+AtWt6V]!X4ZX]J+u(3f3Zpg^;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7
De*ZuFCfK$FCe36/h1USA8Gt%ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&Eaa'$+EMIDEarZ'@rGmh
+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6gFD5SQ+EM+*
+EV:.+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!+n/A0>N!FD,f++D,>(ATJ:f:-pQB$;No?+D>k=E-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]37
0+A7`67sBoFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJ
AM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(U3$;No?+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5%15is
/g+hLFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$
03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIO%^:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"'-m%15is
/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9984c`V5u'gD6QdKo+<W6YAp%p++E1b,A8bs#E+*j%
+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%%15is/g)9KDfT]/Amo1\FCf\>+<W6YAoD^,
@<?Q5BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?+<Y<;E,961
+<VdL+<VdL+>"^Q@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$;No?+<YB1@:NkiARfgrDf-[?+>"^M
DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+<YB1@ium:+<VdL+<VdL+>"^JDfT]'
F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=%15is/g)9XATV[*A8Gt%ATD4$AKWQIE,oN/@<,p%9OUn3
=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA67sB'Fa%Y1
FCf]/Ed)GBA9/kF+E_RGEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5
AKZ2;@;m?3B5Di@%15is/g)9\DfTB)BlkI?+<VdL+<W6YD..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5
F<DuW.1HVZ67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP>$
@rsCZ%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l(De!lC1E\)j.3N8DE,961+CT;'F_t]-
F<G"&A7]9oFDi:CF`;;?ATMo8Ec5l<+EV1>+E)F7Ed)P<FCfM&$;No?+>GWi@rsC]+D5_5F`8Hp
7R9C1=&2^^;eL,hF`;5,D.Oi'H#R>8Ch[d&ARl5W:-pQU0f!ZWF>,QpEb03+@:NkZ+?MV,E+*d.
Bl7Q+GA2/4+=MGGCagJY+D>2$A8Ggu+C\bi+DN$/De*Dg$;No?+>GWi@rsCa+CSekARlopEcQ)=
+D>2$A8GstB-8cKEb03+@:NkZ+=MGSBlmo8+EqOABHS^IEbTW,@<3k,$;No?+>GWi@rsF[+CSeq
F`VY9A0=QS<+T/SE,oMuD.7<m+>"^GBOPdkBl7Q+D/X<1AoDR/Et&IO67sB812gZE0esk[A7T7^
+=M;?FDkr+DK@6L/Kf1WAS-($+D,P4+CT.rCjC>@DJ()%De*E%FCf]=%15is/g)l(De!lD2]uO>
A7]9o.!K]?E-?82Ci=3(.3L2bCi=3(+EMIDEarZ'Ch[cuF!,@=G9D*M@;p0sA.8l@67sB81Lt',
1-$IcA7T7^+EVNE-u*1#CNCpI7qm'9F^cJ6AT2R/Bln96Gmt*U67sB90Pt6D0K1+_A867.FCeu*
GAhM4+D,P4D..O#Df-[GG@kY?+D,P4+A*b:/hf!h$;No?+>PWf@<jOd+E_X6@<?'k+D,P4+CfP7
Eb0-1+=M2;DIdZq.3NeFEcYr5DK?6o:-pQU1,*HcDD4!l@:Wn[A0<:4DfT]/Amo1\FCf\G+EVNE
Bl8$(Eb8`iAKZ28Eb'5#$;No?+>PWgDg!fh+CSekARlorEa`p#Bk)3,@;]TuBl7EsF`V88DK?qA
F^elqEb/a&DfU+GFDi:@Eb/Zr@VfTb$;No?+>PWgDg!fh+C&AeB5)71A8bt#D.RU,I3<BFG%G2,
FDi:BDf9_?Anc'm+D,P4+A[/lE_L%QAhIS3D%-hI67sB90Q(fP0Jjn#F(KH.De*ZuFCfK$FCcmD
@r,^bDImi2F(96)E-*WR@<H[*DfR7I.4cTQD..-p+CSekARl5W:-pQU1,*TaFtk`p-ua-8De*Eq
@<?(*.3N&0A7]9oFDi:1A867.F<G(3Ci=?.DJ()1Afu;<@;p0sA0>]&DImku$;No?+>PW]ARdDK
+=MAVCghEsG\1u?DfTB0.3N&0A7]9o%15is/g)o(A7]7+0d%l:9LDKB5u(BJ=ESLqGUst09L;`N
9LMiK=ESLqGUst09N+JN9M@lW<%/quA7T7^%15is/g)o)@<H3:3$9VjATVU"DKK?(De!Q3+CSek
ARlp*D]gH@Ec>i/F=@Y+%16T`@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/h1CCE+NotASuU2%15is/g+\9@r,RoARlorCi<ckC`mD&Eb-A8D]iJ3DeW`)@rH6sF`V87
B-9lV<+T/SDIIBnF!,[@FD)dh+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_78u]X+A,='<_5_]<(0n3
8k_QO8PDNO79C[)9LhuW9M&2_79C[)9NP"f6qg0O<(0n3%15is/g)Pl.6T^78l%iKBlmp,@<?'W
Eb/Zr@VfTu8k_TG76s[J79C[)9N+JN9M@lW<$4e,6<-TN6rZTWF`(o<%15is/g)Pl.6T^78k_TG
76s[J79F\MBm:am9L;`N9LMiK=EeIs+A,<p9LV6B<(0o5Bl5%&$4R>;67sBYDeEX%+@pWh-Z^DS
DfTA2AoD^,@<?4%DBO"B@<?''D.-pfBl7K)/Kf+KD/!g#@<*K4D]h,&+C]J8%15is/g,+AEcYf5
+EV1>F<GdAFD)dj7WU+'Eb0?$Bl7u7GA(]4ATMg!@q?ckDIal'@;]UlATJu4E+No0EHQ2AATKI5
$;No?%15is/g,=KEaiI!Bl,mRDJsW.+Co1uAn?!oDI[5e$;No?%15is/g)8Z+EqF6-S$hmBeCM`
1E\P++=AO4:dn,%;,pCk74/NO:-pQU+<Vdg3[ZF2+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$4R>;
67sBoBk1ctF(96)E-*4=De!3lF!)VS.OdM5+Dk_,+EM.2+:SZpAo'U_+>Pf4,VU>`+<VdL+<VdL
+<VdL+<VdL+<VdL+<XEG/g+7=DffZ(EX`@mAo'U_+>Fu]-oihe/nlpc+=AT\+<VdL+<VdLI;NS4
+<XEG/g+(8GA(]4ATMg!@q?c2F)YPtAKYE!A0>Q(EbTi<DKK<'+EV%$.1HW$Ao'U_+>P&^-nHcT
/nlpc6"),i.kbTh1,^R(I;NS4+<XEG/g*G&5qQ7_@4cdJAU%^$F_#3(B-9ql64F9=Ao'U_+>Y,_
-t+`B/gjCA.3K`U+<VdL+<VdLI;NS4+<XEG/g*n3FD,5.Ch7^1ATAng%16raCcsBn1a!nh@4l7H
-UK10+<VdL+<VdL+<VeTD.[T,+AP6U+@72mBOr<&ATW$*EZd[X$>jBk4Y@j7+<W(@/nlpc0JP==
1c70M3&t=n.3O%UAo&S4:-pQU3?VjHB5)I/+CT.u+C>QbD.[TI/g*%p+=LYNBeCbc-Rg/\+<VdL
+<VdL+FS*=C`jiq67sBK+>+*1D.[TI/g*(q+=LYNBeCbo-Rg/\+<VdL+<VdL+FS*=C`jiq67sBJ
+?Br=D.[TI/g*+r+=LYNBeCb\-RU>c+<VdL+<VdL+FS*=C`jiq67sBX+E;OBFCbmgD.[TI/g*.s
+=Js#.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBJ;@NtMAo'U_+>GPm-o!D)+<VdL+<VdL+<VdL
+<VdLI;NS4+<XEG/g*hW%13OOF(T5O/g+LV?!JR.+FPjd/it[m1*@u!+?CW!.1HV3+BTa/+<Ve*
+<VdL5p.9m+AO%%+<Wun+<Vde+<VdL6m*Tp+@@7o+<XN(+<Vdo;BR))+<X?I+<W%;0F\@30d&1n
+>GVo0d%So+>Fu]1E\Cp+>P&o+<WQb0d%Sn+>Fu]0d&1n+?(Dt+<WBm+>Fu]+>Fun+<Ve%67sB7
+<YB9Bln&tC^g^o0d&4o+>GVo1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>=o\0d&.m+?(Du+<WBm
+>P&^+>Fuo+<Ve%67sB8+<YTEBOu2n$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>Fum
+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>P&^@;Km9DKTe*$6V&G1*@\o1*A=p+>P&n+<WE^
0H_Jp+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>Y,_:(7OQ0d&4o+>GVo
1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jq+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB;+<XEG
%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WB]0H_Jm+>=o\3?U!u+>GPm1*@\^0d&4o
+<XEG/g*"o+AP6U%1444+>b2`0f'q++<WQb0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jm+>=o\2]sq"
+>GPm1*@\^0d&4o+<XEG/g*%p+Du==%144:+>=o\+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc
0H_Js+>=o\3$9mt+>GPm1*@\^0d&4o+<XEG/g*(q+=@U*+>Fuo+<WBn+>P&^1*A=p+>Y,q+<WE^
1*@\t+>P&^0d&4o+>Fuo+<WTc0H_Jm0H`+n+<WB]1*@\^:-pQU3$9=k-OgD*3?U!u+<WZe0H_Ju
+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WBm+>P&^+>Fuo+<Ve%67sB@+<Y04D/Ej%
F:AR"0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb1*@\o+>P&^0d&4o+?(Du+<WBm+>P&^0eje)
+<Ve%67sB80H`_\%1444+>P&^0eje++<WE^1*@\r+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju
+>GPm1*@\^0d&4o+<XEG/g)l'+@B%#7L]\I0d&4o+>GVo0H_Jn+>P&^1E\Fq+>P&p+<WQb0H_Jm
+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB81*CXW@:NjX$6V&G1*@\o1E\@o+>P&p+<WH_
1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GYpF)YPtAKYDnFCfJ8
DKTe*$7QDk%15is/g,@VEb$;)DfT]'FD5Z2+D,P4+Dbb0ATJ:fG@kYS3Zoh)4*,"M4)JSG.3Kr[
4$!fX%15^$6qL9F6W?iZ=Zneg-RT?1%15^$;b0>N9LW&_4ZX]I8OccQ:4#&`-Z`rD@UX@+%13OO
:-pQUGB.,2E+NQ&Ch[cu+E2@4AncK!$<L+k:eX;D6p3RY4t\HO-OgCl$;No?+E1b,A8bs#FE1f-
F(T?2D.R6#GB.,2E+NQ&Ch[cu+DbUtA0>u4CLqAm$:.?S;H-Uk935"W:d$i^-X8rRATDllDej\I
/6>_8:eX;D6nB^6-OgDX67sa!DId9hE+NotASuU2%13OO:-pQUF(f-$C`me/EbTK7F!,R<@<<W'
Eaa$#04K'<Ch+Y^@8pf?+D,>(ATJ:f%15is/j)7FIXZ_gHQXq^BHV^4$;*uY<CokP<(0o3DJ=>Y
3Zp+!3Zp*c$6p[7AT;j(DI[6#De:,.@<?(*+Cf>,D..<mF!,R<@<<W)ASu("@<?'':ddb^$6p[%
F)uJ@ATJu1@<?(*+D#e/F!+n3AKYo/+EV:.+EqaECM@[!+E1b2BFP;bF^])pFCf\>+FYPaB6%p5
E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*
+<Z+XIV3\>F`;dSILQW5%13OO8k_TG76s[J79F\MBm;d%+>=p!+>=63,9V#<D/XT/+DbJ.AU#kM
AU#>>ASlB/Anc'mEt&IsD'1;\@<Hf($?Bu+.P>1>C^g_lD'1;\A9MYr$?Bu+.P>[]%17,m+=]!X
A9\OjEbupK/oPlS%17,m+=]![DeBLdEbupK/p)#A%17,m+=]![De9FcEbupK/o5HB%17,m+=]![
DfcEqEbupK/no36%17,m+=]!XChF1aEbupK/n/X0%17,m+=]!VH4:31%15is/j;IJIXZ_T$4R>;
67tA_IXZ`p+F>4`@UX@$I16NU9L;`N9LMiK=EeIs4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$Aftnu
FCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3
DBO%7AKZ28EbfB,B-;/%FD)*jF(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>+FYPaB6%p5
E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*
+<Z+XIV3\>F`;dSILQWqDIdR%@ps0_$7QDk%15^$6VKp7:/jYaGA1qX3Zp+!3Zp*c$?B]p+ED%1
Dg#\7CghEsGV=/MGT_*>D/^V0Bl%@%%16WWC`k2[@<Hf($=m^a+=]!Q@VcJ\A7]R".P>7TBakD[
AS`J=/oYk@$=m^a+=]!XA9\OjA7]R".P>X^F:ARfAS`J=/o5H=%16WWC`k2[FDkXu$=m^a+=]![
De9FcA7]R".P>OUC^g_^AS`J=/o5HJ%16WWC`k2[Bl7Gj$=m^a+=]!XChF1aA7]R".P>1HB+52Y
AS`J=/n]J>$=m^a+=]!VH736FF*T2D$7QDk:-pQs5(7s0ILQVn$7I\Q3Zp+*-RT?1BkAt?+<VdL
8OccQ:*:ZiD_;J++<X9M6VKp7:/jYa4ZX]X9LDKB5u(BJ=EeIs%144#8k_QO8PDNO79D]6+A,<o
<CokP<(0o5Bl5%9%16Z_F(K&t/g*_T<DH+f+CoCC%144#8k_TG76s[J79D]6+A,<p9LV6B<(0o3
DJ=>)$6UH`9L;`N9LMiK=?S\f8k_QO8PDNO79F\MBm:a0$>"$pASGa/A8a(0$6UI4D/XQ=E-67F
-V@'"9LV6B<(0nB8k_QO8PDNO79C[R@rc:&FE8RBDfd+CATT:/$>"*c/e&.:%13OO:-pQq4FVa.
INWt[/o4s<AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0rA0>,o@;BFr
Bln0&%15^$<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;FD,T5/0K%KFDPM>+E)4@Bl@ltC`mk@
C`m/(A0>PoF(c!i>[_bsBQ%p<INs;MF`_;8Edf6^+=18t%14Cd>R_#d>]XajCht5!F`M;FINs;U
C3+N<CjmUXI3;d"%14CdAoDU0DJsW.F(or3+C'#"G]\%LHW*I$/M]1A3ZrkrIWK121,Ut=,CY%`
>]+J#D..7%BmO>"$@N?j>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&.1HUn$;No?
+D5_5F`8IAG%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3De*ZuFCfK$
FCcS5G%G];Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:%14Nn$4R>;
67sBnEc6)>+EDC=F<G[:GT\R\@rH1+D/OD;D..]4DImBi+CSeqF`VY=DJ'Cc8k_`Q:eXG[<(0nP
3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''-tdR>Ch[u?+DbJ.AU#>0Bl%?5+=LlCE,961.3N87
DImisFCfM9,%kq7F`8N6$7-g4@;TRd+Eh=:F(oQ1F!,C5+EV:2F!,(/Ch4`$DfQt3@:Nsn8l%ht
B6%p5E$/k:+E2@>@qB_&ATKI5$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?L
AS5^pHXq&)F_t]-FF=T*%16?SDK'`?H[[2gB6%p5E.0$\FD5i5AM/(9G^U#.>]!nbATVX.Ch4%_
>]aC`Ch7Ns@rH7,ASuU2%13OO>]++sE+*Bj%14C(@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&BleB)
DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"DJ+')HX('!
CisT4F(K<=HS]5MI16N0>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0>]b1.@rH1+
D/Kdi>\S(pF`_tZ,CX9GDfp#J,CXQSBk;K@FCf]F%13OO>]++sE+*Bj%14CdDf0,rDesQ5D@HqX
Bl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"M
A7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up
$4R>IASu%*A8bt#D.RU,I16N4%13OO:-pQUGAhM4+Dbb6+EDC=F<G[:GRY!P9NP"f6qg0O<(0nP
3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''.!KTMA8Gt%.3NG8FCf\>Anc'm/g(T1%16?SDK'`?
HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%I[GApu'AIStU
$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(
F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uo
DesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@Hp^$7/qqDIm<rCisT4%16?SDK'`?H[[2g
FCf]7@;TS),CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*D0'8uFD5Z2%16?KA7T1gDKKH-
FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4$=%OjBl8$,DId='%13OO>\.e`
HXq&)F_t]-FF=T*.1HUn$4R>;67sBt@;0U%C2[X!Blmp,@<?''9OUn3=<MR'ARTFbCh4%_8l%iK
Blmp,@<?'WEb/Zr@VfU=3Zp+!3Zp*c$7-g0De*ZuFCfK$FCcS2@<?(*+E2@4@;TIiAM,)7$7-f(
$7-foBPDN1Anc'm+DGm>@3B5tB4u+,+CfP8FDl#1H=^V0G%G]8Bl@l3De:,6BOr<*Eb/Zr@VfTb
$7-g3@<?($Bjkg#B4YslEaa'$A0>?,+E1b,A8bs*F!*&U+E)4@Bl@l3GA(Q*+E2@>A9DBrDJ(($
$7-fIFCf\>Dfp/@F`]5YE+*WpDdso'BkM*qBkM+$Bl7Q+BlbD8G%G]7Bk1acDBNA*A.8kl+EV:.
+EMX5DId0rA0>T(A7^!.BlbD;ARo@aBl7Km/g(T1%16?NDe!p,ASuU"CghC+>;7mPFBs6%Ecc#*
Ch8#($4R>IF`V,5@:O(]B4Y:`@;]Us@ps=f?$g3qDf''-Ed<'B$=%^pAT2'fCLLje>A.SVA8,po
F'X-)F_kl5@:s/"%16?_F(K<!@r#LcAUA61De*F"DLDs$>]k+!E+*6l@:s.u@;U(,H#7"A@;U(&
@<?12%16?_F(K<!@r#LcAUA-'G\(u.GV!Q@Cis0.AU&V4$4R=g+E2@>G%kJuF!+_0AU&<<F^fE%
EbTK7%16?_F(K<!@r#LcAUA$'G\hJH11bkV%13OO,p6i@@;omo@ric,DI[L*F(oQ1Et&I]F`V,5
@:O(]B4ZF&Ea`p#Bk)B=F*1r(BkMR/ALqn:A7]7ZE.&0&>\A(cE+irqF)YQ0BR>(Y055<6Cisf5
Df0VLI=2P3%14C(F`V+:D/!L#Dfg8DAKY]!+CTG%Bl%3eCh4%_>Y/NsBl%?LG\M5@F*hb<@rcL0
H#R=IF*)\UHX(]7AT2'fCLLjeHYmJ,Ec6&FE+OHGH[Q>1>\RefF_r6T>\RepATVL.+>I,5Bj>@a
Cis0.AU#=P>\7\50H_YaBkAK,A7fppGRY!&+C'&1AT2'fCLLje>BP%"3*glFDK'`?ASu"+%16?O
Cia/1,p6o6+Dc1/FCf\>DfQtFASbdsAU"Xk+<Xp3F(K<!@r#LcAUA$-DKKr=ARg,t$6UHrBkDU$
FCf\+$6UH6+C'&1AT2'fCLLjeH['@KG][t7/9l;TBk)'lAUP!p+<Xp$BakCl+C&GgAmoguFCoH/
FCo)mFEMV8F*gViE,]N/B0C?JGV+#KG]YK8@ps1b4\]@,@q\PSG@bf)@<6".%144#,p75>E,8rm
AKXEA;GU:[+EqOABHVG8Bk)'lAKYQ,Ec3(1BOPpi@ru:&+:SZ#+=/.EAfuA;FWbR5ARlp*BPDN1
@q]:k@:OCjEZcqVFD,5.E,oN2ASu!h+E(j$$6UH;+EV:2F!,O<DJ*cs+Cf(nEa`I"ATAo-DBO%7
AKYr4ARTFbCh4`$DfT?!F!,UHAKYo'+F%I6@<?(*/0JbO@;K@oARl5W+<Vt8DIn$%Df'?"DIe*!
AT`$3I="C_;GU:[I39XT%144#,p6]+DBO"3F<GLDBOu3,D/X<1F)YPtAKYT'DKKqBBkAK0BOuH:
Eb-A%G%#*$@:F%a%144#,p5c%Eaa''ATAo0Bkq9&;f?f!@q?cMDe*E%:i^IsF(JoD%144#,p6lC
FDs8o04Ja9B6,\6A8bpg/n8g:06DJY@VfsqEa`p#GqUp,0etC93A5GlF`Lu'/Rr^0AM%kAD_>^F
D/9Xg+<Vt8F(KH1Df0K*Df0ZD7WN'O9lFofI16N++=196ATVd-DJs-*DKL5(Dfp)1AKX?YA7Zl[
Ec6@8$=%1W%13OO,p6)sA7]@eDIjr,@:EeaGA1T0BHUo*EZf14F*)Ib+E)@8ATE!/F(HmFFD,5.
ASuX-ATD4$AKYr#@r#LcAKZ22Cht5(@<HX&%14C(D..I#ATDi7FDi:5G][M7A0>>mH#IS2+EV:.
+DbV$F<GF/EbB*(/e&.mD..3k@<?<sFED)7>X<HuAS5^p6uQRXD.RU,HR0+.+<Xp0ASu('@rH4$
@;]V&>X3+>F*),E%144#+<Z#9F(KH0ASu.&BR=!#@:EeaGA1T0BRP4aASljD%17MgD..3k@<?F0
BOu2n$=%^pAT2'fCLLjeHY%);D.R`rFCfk0$4R=g+EV=1BQS')F*&O7Df'?"DIal%DfQt:BleA=
F)YPtBl7Pm$=%OjDg#i*ARfXqD..<mHX(Z,B4uC'BleBEHR0+.+<Xp1ATVa"DJ+')HX(9,ASlL"
E.*'eE--M5F(KH0ASu.&BR=!'@<-F)BlJKI0Q;,^I16Mm$7-g(F_PZ&+CoD#F_t]-F<G:8A7]up
$=%^pAT2'fCLLjeHYm2,ASG\"I16Mm$7-g)Des?4Et&I]F`V,5@:O(]B4ZF"Des?4I16NgA7]@e
DIm<rCi=?@F(eumARfXpDfU8Q;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/Df0Z;DepP;FE2M6FEMV8
F!(o!>\%DXBl7KlDes?4HY[2<G@PQ-DfU8QEbAj0HS@',1Ft441-$m>/i>G5%14C(C*7)4E,95u
BlkJ+EbBN3ASuU2+F##S+Di6=+E\fM%16?NAS,XoARfXpDfU28@<>pfDes?4I=$!I@XWSW/ho.5
0J5+@/2/\61OT]>,p6qFDKTf*ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJC^g_VA7]@eDIm<rCi=?@
A7]7o@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdM8(F(K6!Des?4I=$!I
@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HY.)4@<?!tCi=?BHZEb.I=!Y#0JG%3/het1
0J5=>I16N0+DN$8De!3l+CT>4BkM=#ASuU2%16?NAS,XoARfXpDfU27BOPpkDes?4I=$!I@XWSW
/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HZO:LBl7QnDes?4I=$!I@XWSW/i,450J57;/2/\1
149T=>\%DXBl7KlDes?4HXgu2D.RU,@rH1%Ed`:TB4?:90J54@/2/\42(UF60JRtb$7-g6EbTB)
FD5o0+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4HZ+">ATD:!Ci=?BHZEb.
I=!Y#2)[!>/i,@90J5%6I39XT%16?NAS,XoARfXpDfU2CFD,6+@rH1%Ed`:47m_WN0J"n/1,Uq;
%14C(B5DKq@;I&pF)u&.DJ`s&FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0Ci=?BHZEb.I=!Y#3A`9@
/ho780J5(<I16N0+E2@8D/"*+G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBnEt&I]A7]@eDIm<rCi=?@
Ap&!$@rH1%Ed`:TB4?:90J5%5/2/\10J"n10JInt+<VdL%13OO>]k+!E+*6l@:s.uAmoReH$44;
I16Ng6tKtEDIla[DfTr#ATD6a@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH%16?.AS,XoAQEA_@UX@m
D+/>cBl\-0D.RU,HUqj`BP_BqBQRs+B75,-ATD6gFD5T?HXgu2D..<m@q]:kF$3c5>^K_(I16N0
+@0OK+=A^PDf0Z<BmO>R>]XajChtIAAoD]4D/XH++Cf(nEa`I"ATDi7E+O&4Ch[cu%13OO,p7/8
DIdZq+D58'ATD4$ARlp)H#@_4GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>D.Rbt$7-g'Eb-A*Bm=3"
+DG^9B4YslEaa'$A0>B#A7ZlmF`\a:AS,XoBln'-DK?q;@<it)$7-g(AKZ&*F<G[D+CT/5+Eh10
Bk/?.AU&;>AoD^,@<?U*DJ()%Df'?"DIa1`>]k+!E+*6l@:s.uAo_<sARp2u$=%I[G@bZ8Bl\-0
D.RU,HW+TdA7];"H[U6h%16?XATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,Des?4HY[2<
G@PQ-DfU8Q>]aP%FCJj/HQt7nI=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4+B*3$EarZ'6Z6LH+Ad)s
%14CdDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BH[?tlI=6MQ
$=%I[G@PQ.D..<mHX&sIFCA-oE+N!eCOKDA?$fguAU&<,Des?4HXpQ,@:O4lDfU8QHQt7nI=2P3
-!Y>!G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmnDes?4I=$;c0n"Iu%16?X
ATqX&D/E^!A:%QLARebLCfG=gI9SF3H[?tlI=34I$=%I[G@PQ.D..<mHX&mGF(J*GDejc*0jT-2
FCf]=@rH1%EdM8(F(K6!Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QNCi<a(<,ZQ#>;9E1>]aP%
FCT6*DfU2:Ci<a(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6YKnK<,ZQ#>;9E1>]aP%FCT6*
DfU27BOPpkDes?4I=#4@AU&<+Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!;fm%oDJ)peCOKDA?$fgu
AU&<,Des?4HZO:LBl7QnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QKDf'?&DKJirCOKDA?$fgu
AU&<,Des?4HXgu2D.RU,@rH1%Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s@rH4$@;]V&>YfHTATCag
COKDA?$fguAU&<,Des?4HZ+">ATD:!Ci=?BH[?tlI=6Md%16?XATqX&D/E^!A:%QICh7X/<,ZQ#
>;9E1>]aP%FCT6*DfU25Ch7X/@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3-!Y>!G@PQ.D..<mHX'$_
DI[d&Df/NmCOKDA?$fguAU&<,Des?4HY.D<@q0FnDfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XijR
@ruF'DH(OiI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>Z,-GBl@l`@<--pE`?smI9SF3H[?tlI=2P3
>]++s@rH4$@;]V&>X`[RDfSfqCOKDA?$fguAU&<+Ap\kL0n"Iu%16?XATqX&D/E^!A:%QVDfT]'
CfG=gI9SF3H[?tlI=2P3%14C(8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;Df'?"DIdf2AoD]4E,Tf>
+E2@>@qB_&Bl7Q+E+*WpDdso&ASu("@<?'k+DbJ.AU"Xk>]++sASu[*Ec5i4ASuU:8l%iFEc6)>
87c4?ATE3GI=$AO$=%I[G@bZ8Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2Ed`:_H[Q>1%16?_F(K<!
@r#LcAUA#tDI[s*A9*)-$=%OYB4Z.+H#.&=AmoReH$p,/%14C(A79Rk+D"tkBHV8&B4VMZ>]OFp
Dfg>2ASlC"HX(Z2A79b3I16Mm$=%:WG\(u.GRY!&+C'&1AT2'fCLLje>B=@tE+*BjF(or34_A,=
F(HmF,p7/8B4W3,BmO>5A7]@eDIm?$@X0)@ATVL.%144#+<VdL+<VdL+<VdLF`(o'De*EBAmoLs
ALnrH+<VdQ+E_R9@rGmh+C]A&@;Bp,GA(Q*+E_a:A0?)1FD)eAATVL.%144#+<VdL+<VdL+<VdL
G\(u.G[5Z0H#R>8Eb/j2%16?OCia.s$6UHrF`V,5@:O(]B4Y:iDJ<U!A7[oGEckr!HY@\DATDg&
Apk*q>\7[Z$4R>IBR+Q.EcYf6F`;\:Eb/ZpCh[d&F$4VcF_**5$6UH6+<VdL+<VdL+C]8-CMdL#
CNDX\EckqE%144#+<VdL+<VdL+<YW6Amoh(BQ%oSH[RFS$6UH6+<VdL+<VdL+E1k'FD5i5ANbBg
/.Dq/+<VdL+<VdL+<Ve:Des?4Ch[d&F$4VcF_**5$6UH6+<VdL+<VdL+E_^@@rH1%E]mlJF_**5
$6UH6+<VdL+<VdL+Dbb0CL_:!DfS!X@:s.hFC?^0$6UH6+<VdL+<VdL+E1k'@W-9tATBq\0H`%l
0R\?Y$=%X`FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%16?]ATVa"DJ+')HX(MuEcZ#1E.*'kE-*4A
CiseA12q=XD/!m1F!*2VFF=T*>]XIuCh7KsFD-#+ASl"!B4YsjH#n(JATVEqI=!b]D1*NL,p7/I
AThX&F<GLFATDC*Cht51Bl7L'%16?]ATVF#F`);4EdMk=@r?F+A7]_%BRP4]I16Mm$7-g8ATMF)
+DbJ.AU#>3DId='+EVNEF`V+:FD,]+AKYK$CisT4F!*%WA7]@]F_l.BBlbD=GAdot,p7DFBk(g!
Eb0<7Cij_@Bl5&0Dfg%CDe:,9@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3lF(8WtAIStm+AP^3762Q"
A867.F<G:0+DG_(AU#>8@;TRs+EDUB+EVO7ATVTsEZbeu,p6f?Df%NXBQS?83\N.1GBYZU@<?(*
/Rr^9D09`1FEoKWEb@%KBk;L1DfBE#/oYKC5A!&8-?MC*2`!<#$=%^pAT2'fCLLjeHYmnAFD56'
Cjca">]!nbART[sATW$*EX`@\Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7HmG^U#.+<Z#9BkBVPGAgu0
CisT4%144#+<VdL>X3=@F*)><ARfXpAmoLsAISth+<Xp#Cia.s$6UH6+<Ve35]UFWFDl&.@rH1*
Eckq&$6UH6>\7[Z$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZE--L;$6UH6>]XIuCh7Ks
FD-#+@rH1+D/OE+E.*'h2/mYc%144#+=/.?BOPdkAKWcOFDi:4ATMR+ARlp$F_tT!EZf:4+DG_(
AU#>-DesQ5DK?6o+<Ve3@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='DIIBnI9d9h
+<Ve3D..I#@W-@%HX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6+<VdL+<VdL+F@?f@;BFS
E,]B/@psFi>\S(dAU&*$D.S,A%144#+C'#%Ble6%B4Z.+H#.&=E,8rsDLDs$+<Ve3F(KH0ASu.&
BR=!'@<-("A7]Y#I=!YeFF=T*+<Ve3F(KH0ASu.&BR=!'@<-F)BlJKI0Q;+VE,9Z<+>>E(E--L;
$6UH6>]OCl@<`4g+<Ve3Ch7]nBlmp'>X3"6G\M82D1*]>$6UI<>\.e`HYmnAFD56'Cib#0BkBVN
ATMs3DIm<rCg:mrARfXpF_u#$AScF!>[qS]@<-<qB4Y=[BmgEt>]!nbART\!FD,6+%13OO>]!nb
ASH$mAU"Xk%14Nn$;No?5!FFEIXZ$MA8PajAPPQE+=_,EA8PajAKYJ7/Kf+EEbTK7+DkP&Bl7Q+
-6Qf:A7Zm#@;]duF_kK.Bl@lM+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%
CghC++Co%qBl7L'+E_d?Ch\!*ATJu+DfQt;@;BRpB-;8*EbTK7F!,(8Df$U+$;No?+D5_5F`;CE
@;]TuF*22=ATKIH+A$Yt@;L"'+Cf>-FCAm$F!+t2A7ZlqDfQt/DII@,H>.80+:SZQ67sBu@;TQu
Eb/ioEb0,uATJu.DBMOoGAhM4F"SRE$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;
:-pQU+<Y<.FCB!%FE8QI+<VdLB4Z1++CT)&+EV=7ATMs%D/aP*$;No?+<VeD@;BFbF_u(?+<VdL
+CoV3E-!.?@VTIaFE8RCDBNn,FD)e=D]j"AF<G+:D/^V.Bl[cpFDl2F%15is/g)8ZD..3kB6,1<
+<VdL+<YN0CLnW$Ec6)>+CT.u+EM[>FCcS9@rc:&FE7lu:-pQU+<YQ1D.R3cFE8QI+<VdL@r,Rp
F(o6#ATJu3@;TRs+DG^98g%V^A7Z2W:-pQU+<YWGFCB!%FE8QI+<VdLE-68D+CT)&+EV=7ATMs%
D/aP=/Kf+GAKWC6ATV?sCij_I%15is/g)8ZGB@q<G]Y&N+<VdL+<YlHEb$;$DIal3ATMr9FCf]=
%15is/g)8ZGB.5,Ci<ckCi^^A+<Y6?FE1f"FE8R;Ci<ckC`mV(D.Rc2Ao_g,+A*bdDe*Dg$;No?
%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X"@;BEsEa`iuAKW]b0J,">3@PCE
%16T`@r,RpF!)i=C2[X"@;BF%%16T`Bl8!'Ec`EH-Xgb.A1%fn%15is/h1CCE+NotASuU2+F#Ii
+E(_(ARfh'+EqOABHUhsAnc-sFD5Z2+Co&&ASu$iDI[BlEt&Hc$;No?+EV%)F!+(N6m-#_D/^V=
@rc:&F<GU8@WcC$A0>B#D/E^!A9/1e6rcrX<'a#;3[Z%F68!U78l%i)I4#I2%15is/g+t=EbAr+
FCf]=+Eqj7E$076D/aE6@<-W9DJsZ8+DtV)AKYE!A0>]&DIjr7Bk2=!%16075u:NT:fg4V4ZXs:
H7(d42[p*'$;No?+D#e:Eb0<5Bl@l3FD,*)+Cf5!@<-E3F(96!FCSu,DdmHm@rr.e;bobS76sg7
3[Z+(F)PQ)ARTU,/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*Eb/^&Bl%=$+D5_5F`;CE
@;]TuF*22=ATJu+Ec5e;F(8X#@q[!'@VTIaF<G+&FC>Uc;bon]:d$ie+D5_6-9`Or/g)>j+=ANa
/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1Eb0-1+=AOG@<6!--RUH5
<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXHDfTE1+EqaEA9/l-DBO%7AKZ&(Eaa'"BHV5&
C1Ums+DG^98l%ha$<'_s<E)+B-Za3FF`\`M/gi#aCgSP;/5o><:I@EA74]f6?Qa&81aaXn>9IEo
@s)g4ASuT4-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7-uNI1
ALqq7G]YAWFCAWpATJu.DBO"1Eaa'"BHV5&C1Ums%16$0:fUIo79EMP3[Z%hF`\`M/g)>j-RU8m
-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc
9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMa@FCSuqF!,RC+Du==@V'RkA0>r'Eaa'"BHV,0
@ps1b%16$0;ccOi6V'@$-Y%()F`MM6DKI"":L@I$:IK,1C*tQ#<D?:h5t;@k%15is/h1FMA7T7j
ASu$iDKKq/$4R=                                                            ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,L+1+>P'!+>Yu"1E\G1+>GSn2DlU9+>kraF_PZ&C2[X*FD5Q4+E_a:A0>u4+C]J-Ch+YsDIal#
BleB:Bju4,AKXT@6u$XND..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF)#W(Ch\!&Eaa'$B4YslEaa'$
F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfguGp$^>Df$Uh:IH=<Ec6)>F)#W(
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.0  ~>
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
:dJ&O+@K%"8PMcU+@K4(:eakY2'>=c;D9g`0d&n_;DKs_+A#C4:-p'pH:gt$Bl8$(Eb8`iAKXQj
8l%isDf9H5+A$lO:IK>IBl8$(Eb8`iAKXT@6rZrX9N+td6m,)t6rm#M+A>("<)?Ro+A>3i:*<:t
9gqEC5uU]):J3Ar0HaOj7j)8`Bl%<pDe*?rD/aN,F)to'+C]J-Ch.:!A9;a.Cia*)D/aN,F)to'
+Cf)#BOPsqA8Q9.A8lU$F<G+:D/a0"@:Wqi+D,P2Bm:b4F_kl2Df0ZB+D5M/@WNZ*@<6*k@:O'q
BQRa#BlG20De*ZuFCfK$FCeKI6m-5_A8Gt%ATD4$ARB+ZF(f)mFCfT8C`mJ2A8c?.C3FJ;D..3k
A9Da.+E(d5E+*6lA8,Oq+E2@4AncL#F_u)2@<6*)E-67FE-688F!,O8FCKB,Ch.'jEcW@EATV[*
A8Gt%ATD4$AKZ,7A79RkC2[WnBleB:Bju4,Bl@l:.4cl04?G0&0d%hd@WcC$A7'(iA8Gt%ATD4$
AKYH)Bl%<eE-68EATDi7A8lU$FAm$pCLo1R-RgSp4?P\X?SNZN+C]J-Ch.:!A0>W*A0>W*A7TUf
+DPh*Ch\!&Eaa'$+DPh*D..3k-RgSp4=iTBC2[X(D/X3$FCfN8F!iCf-p0UR/mg=U-Ql#W6pamF
9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,7:IJQ.@WQ+$G%G2kATDg0EcYT0G]Y'):K(5"
C2[X!Blmp,@<?''<)5nX?V4*^6r-0WD.Fbg:IIuc8l%i^D.FbuF_PZ&C2[WnBleB:Bju4,Bl@l3
BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*Ch\!&Eaa'$?Z1+%ATqL'AU#>4De*fqEc#k?C2[X%
Ec5Q(Ch4`+@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'+DlC=
De*g-De<^"AKZ;FH>7A/D..-r?Z]k(-RgSp4>J$91aFh11,CU@0Jb=<3&WHI3A<EM3?U(21,L[>
1,(=;1GLaF1c7!D2BXb/1,L[>1,(=;1GU^@3&iiV0d&5*1,L[>1,(=;1GCaA3AiTO0d&5*1,CU@
0Jb=<3&<?K0JbOD1a"P-1,L[>1,(=;1,q'E2E3]V2BXb/1,CU>1,ggD1c@<N3AEEL1E\G,1,CU?
1GCF<1c[6L0KD'J3?U(21,CU@0Jb=;2D[-H1c.*K3?U(21,L[>1,(=<0JG490K1[B2'=Y.1,CU?
1,pmH3AEHP1,:^E2'=Y.1,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t11,CU>
0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$I0ek[C1*A>+1,CU>0JtI>2).$H3&<<F2]sk01,CU@
0Jb=<3&EQR0fUmG2BXb/1,L[>0JtI?2`NKO0ebI>1a"P-1,CU@0Jb=<3&*EQ1b^gE+>PW+1b^X=
3A*0I3&r`O2`<WM+>PW+1b^X<2(gaF3&`WM1GCXF+>PW+1GCU>3A*-G2)-pI1c[EP+>PW+1GCU>
3A*-H3&NKO1cR?M+>PW+1GCX>1G1L=2`NKG1GUXB+>PW+1GCX>1G1I>1cI9G2`!-F+>PW+1GCU@
0J51>1H$sJ1,q$J+>PW+1b^X>0J51<0JG792`Wi?1,(I?0JP=:/i5=C3&N]U0Jb[21,(I>0JkI>
/i,:@0fLgE2DI-51,(I?0JP=:/i5OC1bgjC1GUp41,(I?0JP=:/i5=D1cI-E2_uR30JYF=1,:U;
2).!E3&``O3B&'90JYF=1,:U;2).!E3&iWI1,pC30JYF<2DQs=1H@3J1H7BK0f1".0JYF<1,:d@
2).$M2_m-G2]sk01,CU@0Jb=;2E*WP2_d<Q3$9t11,CU?0K1UB1GgjB2*!EN1E\G,1,L[>1,(=<
0JYRA3A`KF3?U(21,CU@0Jb=;2_d!C0etF>3$9t11,CU@0Jb=;1Gq0I2`!HN2BXb/1,CU>1,pmC
0fLjF1c[?I1*A>+1,L[>0JtI?0f1gI0JG=B1*A>+1,CX?1,:I>0etI;1b^mI2BXb/1,L[>0JY7=
2Dm9J2*!NJ2BXb/1,CU@0Jb=<3&WHI3A<EM3?U(21,L[>1,(=;1GLaF1c7!D2BXb/1,L[>1,(=;
1GU^@3&iiV0d&5*1,L[>1,(=;1GCaA3AiTO0d&5*1,CU@0Jb=<3&<?K0JbOD1a"P-1,L[>1,(=;
1,q'E2E3]V2BXb/1,CU>1,ggD1c@<N3AEEL1E\G,1,CU?1GCF<1c[6L0KD'J3?U(21,CU@0Jb=;
2Dd9N1GUXA1a"P-1,L[>1,(=<0JG490K1[B2'=Y.1,CU?1,pmH3AEHP1,:^E2'=Y.1,L[>1,(=<
1,q-J0f:XB1E\G,1,L[>1,(=<1,q-J0f:XB1E\G,1,L[>1,(=<1,q-J0f:XB1E\G,1,L[>1,(=<
1,q-J1Gq*L2BXb/1,L[>1,(=<1,q-J0fV'I+>PW+1GCX>1G1LD1cIBK3&*<L+>PW+1b^X<2(gaF
3&NWN2)[<P+>PW+1GCX>1G1LD0f_3M0K(a11,(I?0JP:B/i>UB1G^dE0f1a11,(I?0JP7=/i>RI
2`!9H0Jka31,(I>0JbFD/i5IB0KD-Q2_[361,(I>0JbFD/i5IG2)@3K3&NQ91,(I>0JkI>/i5=<
2D?gD0K(p61,(I?0JP:B/i>OI2`!-J1,:a11,(I>0JbL=/i5FA2DI3I3&3E81,(I?0JP=:/i5@<
0JY=@3B/-:0JYI=0etF81bq$M2*!WM1H6L40JYF<1b^^<1G^mC2_d0J0fL410JYI=0etF82)7*K
3B/cR2)ud70JYI=0etF81bq'J2_d'H1E\G,1,L[>0fL^A2`<TT0etR>1E\G,1,L[>0fL^A2`<TT
0f(R?1*A>+1,CUB1,(=:3ANHJ3&rZI1a"P-1,CU>1,ggC0fM*O1,:^G+>PW+1GCX>1G1IB1b^U>
0f1mK+>PW+1GCU=2_I!E1bpgD3ANNL+>PW+1b^X>0J54:1,gpJ1bpaF+>PW+1GCX>1G1L?0ek[I
2_m*F+>PW+1GCX>1G1I>2*!BM1H@9M+>PW+1GCX>1G1I>2E*?M1,h*G+>PW+1b^X<2(ga@2`NZT
0f^pH+>PW+1GLX?1+kF=1,1I>0K:sK+>PW+1b^X<2(gaB3AW?F1,(RG.4cl01*A@u1,(I>0JkOB
/i5=D1G^pG2E<Z<1,(I>0JkOB/i5=A1bgd@1cRB91,(I?0JP:B/i>XI1,1I>2`;d60JYI=0ekR=
1cR6N2E3ZN3&Da50JYF<1bpp@1c6sC3AEKM0JXb+0JYI=0ek[@2E3ZQ2`WZJ1c$R3-p07-2'aq2
1,CU?0f^jC1c76K0fUsL+>PW+1GCU?1bLU>3&riP3A`ZR+>PW+1b^X>0J51A1GCUE1,UmC+>PW+
1GLX?1+kF?0fLpF3AicS+>PW+1GCU@0J51>1bpdE1H@?P+>PW+1GCU>3A*-F2)mBH3&<Q;1,(I?
0JP:B/i>OI0fV*G1bgg01,(I?0JP=:/i>=:1c$mG1c.*51,(I>0etL>/i>F>2`*<N2)mK:1,(I>
0JkOB/i>=A1,1RC.4cl01,(I?0JP:B/i>XI1H.!C2E3TF?SX;j1b^X=2_HsJ2D[9G1,_*M.VULi
+>PAs-p07-0fL@50JYF<1,(R<1c7!H2)-dE2E;m80JYF<1,(R<1c7!H2).$L1Gp:10JYF<1GCX<
2D[3H0JtO?2)ud70JYF=1,:U;2).!E3&``M2`)X40JYF<1b^[;2Dd-F2`3<L2)l^60JYF<1,:X<
2)@!G1c7-E3&Vm70JYI=0ebI;2)I!@2)I9K3ADX30JYF<1,:d@2Dm<H1GCRC3$9t11,CU@0Jb==
2E3]S0fLmI0d&5*1,CX?1,:I>1c6sA1cI9N2]sk01,CU?0JkC?1bpjE2D@-M2]sk01,CX?1,^aA
3&NEI2)R6I3?U(21,CU>0JtI>2).$H2`NcQ0d&5*1,CU>0JtI>2).$H3&*3I1a"P-1,CU>0JtI>
2).$H3&!6J2]sk01,CX?1,^aA3AE6F3AiZS2BXb/1,L[>1,(=<2)$sK1H7?Q2'=Y.1,L[>1,(=<
1,q-J1Gq*L2BXb/1,L[>1,(=<1,q-J1H7-M3?U(21,CU@1,U[B2D@'F1c[BI2BXb/1,L[>0fL^A
2`<TT0etLE0d&5*1,L[>0JkC>1GgsH2`3QK3?U(21,L[>0ek:;1-%0M2`EKH2'=Y.1,L[>0JtI?
1b^U@1cR9O0d&5*1,L[>1,(=<1GggB3&*6J3$9t11,CU@1,U[A2)@'J0etUH3$9t11,CX?1,:I>
1cI?I1,([B2'=Y.1,CU@0Jb=;2)@0G1GCgD2'=Y.1,L[>0f:R?1cR0E3&rrQ2]sk01,L[>1,(=<
1,q-J0fD$H2BXb/1,L[>1,(=<1,q-J0fD$H2BXb/1,L[>1,(=<1,q-J0fD$H2BXb/1,CX?1,^aA
3AE6F3AiZS2BXb/1,L[>1,(=<2)$sK1H7?Q2(:()4>838-p014/1<V7.4cl00e"Y90E       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
