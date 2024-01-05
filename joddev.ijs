NB. sha256:3ee5de743ecb2470e3cb79a4b4d3481dc732c7911d4454ac9c27f3a4422ce39f
NB. JOD dictionary dump: 05 Jan 2024 14:13:20
NB. Generated with JOD version; 1.1.0 - dev; 3; 05 Jan 2024 13:57:28
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

CREATION=:13

DPLIMIT=:64

DUMPMSG5=:'NB. JOD put dictionary path: '

ERR0161=:'cannot prefix hash ->'

IPYNB=:32

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.0 - dev';5;'05 Jan 2024 14:12:52'

JODVMD=:'1.1.0 - dev';5;'05 Jan 2024 14:12:52'

LASTPUT=:14

LEAN=:33

NAMECLASS=:12

ZIG=:34

jodliterateVMD=:'1.0.1';6;'03 Jan 2024 13:49:53 MT'

jodliterate_hashdateurl=:<;._1 '|a243664e13b3e3b79a395ffbb6929ca7a64989bc51e722b74041ca1213e9476f|03 Jan 2024 13:49:53 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

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
0fC^.1-$I4+?1K!1E\Y"1,g=7+>Y\o3$:+5+>k8s3$9q4+>u"u0ea_.1E\D1+>P_q0eje,0d&@s
1,9t2+>Pku1a"P0+?:Q"1a"Rs1,9t,3$:%9+>P_q2)QL20H`2++>k8s2'=V-+>khq2'=\7+>G\q
1G^.2+>kqt1E\D1+?1K#0d&4o1-$I31a"P6+>Y,s1E\Ot1Gp:01a"\26<R8V;b:.]DdmHm@rri7
BmO>5DfBf4Df-\-De*EH;FNlN8P`*"@VTIaF<G(6ART[pDf-\9E-,f4DBNG-A7\/*9M%rM<,H&g
Bl/!0+Co1rFD5Z2@<-W9E+*j%+DbV,B67fT<D?:a;b&]_DffQ3+E2IF+Co1rFD5Z2@<-W9E+*j%
+>"^YF(Js+C`mq8ASrW,Ddd0jDJ()&F_u(?F(96)E--.m:g$O[8p,)uFCfJ8DJsW.@W-1#+E)4@
Bl@l3@rGmh8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs
.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`m
ARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCnA9E!.
C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q
:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'S5uU`Z<E*dCF*&OC@VTIaF<GOFF<GL@FD5Z2+Cf>#
AP>NY:2FKMDBO"=F`Lu'+E)4@Bl@l3@rGmh:-hTC6VKdE;bA0M@;TQu@r,RpF!,C?FD5Z2+Cf>#
AQhYqH>."7F)Q2A@q?d$E-,f4DBNG-A7]4mBl%<pDe*?rD/aN,F)to'@WcC$A9/l%+D,b4Cj@.5
Df'H6ATMp(A0=K?6m-;a@:UL&ATMr9F(96)E-,Q3Bl%<pDe*s.DesK)Df'H6ATMp(A7B[qCh.T0
@rH4'Eb0<5ARlp,ATDj+Df-\9Afu2/AKXT@6m-SiDesJ;@r,RpF!,O6EbTK7@q]Xk@<6*mD/`uu
ARfLs+CoV3E$043EbTK7+D>2)BHU_r@;0V#F<G(3DKKH-FE:u3F(KH7ATT&*Bk)7!Df0!(Gp%'7
Ea`frFCfK6A9Da.BOtU_ATD:$ART[lF!,R<AKYN+D/a*$Ch4_tDIal6EbTW,F!,.-@:Wqi+DG_*
DfT]'FD5Z2B5DKqF(&rpCjC></0JtEE,Tc=+CT.u+EMXCEb-A+Ci<ckC`mV(D.Rd'De*ZuFCfK$
FCeKI6u$XNCh\!&Eaa'$+Eh=:F(oQ1+DkP&AKYE!A0>DkFCf3*A8c@-F`M@B8l%htDf-\<ATN!1
F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0C3FJe+Eh=:F(oQ1+Du==@V'Rs@;BFb
F_u).F_u)=+EV:.+CfP7Eb0-1+E1b2BHU`)+CQBb+EM%5BlJ/:Anc'mDe*d*ASuQ3@;]Tu@r-()
ATJu)Bk)7!Df0!(Bk;@)Eb/isG[tr6E+i[$BQ/!'AncL$F!,.)F(c\<D]iS5D/^V=@rc:&FE;DD
FE;PBEb0;7DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%E-688F)uGAEb0;7A8,Oq
Bl@ltEd8d?Ec6)>F!+n/A0>r9Blmp-F(KH.De*ZuFCfK$FCfE3AT2'uAKXZT<+T/SE,ol,ATMp,
DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfT                         ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@3+>P&o2]sk11b^%,1E\D,2DS`aBl%<eC2[X!Blmp,@<?'U67s`sF_PZ&?YXLiCh\!&Eaa'$
+EK+d+C]J-Ch+YsDIal#BleB:Bju4,AKY`+A8Gt%ATD4$AM.\3Et&IO67sAi$;No?+CfG'@<?'k
3Zp131,*WVF>,Q]$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is/g)o'De!lC2'?@NBl%<&-u*[2
Ch\!&Eaa'$.3N&:A0>DsF*)G:@Wcd(%15is/g)o'De!lC3?T_bDe*ZuFCfK$FCefm@<6*m@<?('
Ebm0I@:Wn[A.8l@67sB90Q(fP0K1+&C2[X!Blmp,@<?'fEc5l<.3N&0A7]9\$;No?+>PW]ARdDK
+=LuCA8Gt%ATD4$AQDMn.3N&0A7]9\$;No?+>PZ^ARdJM+C]J-Ch+Z1Bl.E(D..I#ARlp%DBNn:
F*&ODEc5H!F)u8?%15is/g)o*@;p6B2'?=<C3=T>+EVNEBOPdhCh4`0ART+&Df0B:+E2IF+Co1r
FD5Z2@<-W&$;No?+>P``ARdJN+=M;BFD>`)Ch\!&Eaa'$.3NMHG9D$LATJu)AS,XoARloU+D,P.
A7]e&%13OO@rGjn@<6K4FDYu5De!-?5s]7(A8Gt%0KD.#4ZXrV5s]7(A8Gt%0KD-@+BosuDe3rt
F(HIV-UC$aC2[X!Bll$h3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\Df7d"+FPkQBk/>?%13OOF(96.
4ZX]5C2[X!Blmp,@<?'.%13OO4tq>%A0<rp-n$HWD.Rr>+>#Vs4"u#"Df7'L-Y[F/GUFpk-Qm/B
A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDH0RInYE,9H&+D58-+?MV3Eb/Zi+Eqj?FCcS9BONYR
2B['SDg-//F)rIGF*(i-E$/n6A8Gt%ATD4$ARB+ZF(f)mFCfT8C`mJ2A8Gt%ATD4$ARBIrDfd+:
De*ZuFCfK$FCeKI6m,oMFCfK6FE/L5AS,k$ATMs6+DPe4G9CX<Dg-/=F*&c=$4R>;67sBpDKBB0
F>%ZGE,8rmAKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159QHREiD+Dt\4-TsL5
9gM-E:L@OFDe*2tB4Z0--W!T;<*q"(F(96.%13OO-o2u,+>>5e-RU#G$>F*)+>=p$+?hK+9gM-E
:L@OFDe*2tE-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?fDI[iQ3Zotk@s/u*D_;J++<WB]>9J!#
Dg-//F)rHOE-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf"NF*&ODEc5G1FD5T'F*(i-E$0%:
F<G^FA79RkA1%fnAScF!/g)kX$>"*c/e&.:%13OO:-pQUF`:l"FCcS<D.Fb4-n6Z//g+nIA8Gt%
ATD4$AQDMn%16QT@<?'D3ZohmF*(i-E$-MU.4chh9iNJ_:-pQUFE_;)CER5-EZfI<D.S$3DIj7a
C2[X!Blmp,@<?']9gh-*+<W'\4usfM0mdYRA8Gt%ATD4$AQDMn.6D!L@<?'0+=Jre1+@VoC2[X!
Blmp,@<?']9gfEt%14L>+?CW!.3Kuc%16f]/g)hj4WlpBHZX+DCi<f+E-67F-YdR1Ch\!&Eaa'$
<_Yt0+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]G%G]8
Bl@lAD..3k/nAC4AKYl/F<G^FA79RkA1&KB%16Z_F(HsH0b"J$DIb@/$7QDk%17,c+Bos9Eap5/
F(ZV-Bl%?.4Z[FrF!,O6Ec)<nEap4r+=D2>+Dt\2-TsLb5snOG?X[\fA7$HlATT%B<)5nX?YXLi
Ch\!&Eaa'$?Ys=$%13OO-o2u,+>>5e-RT?1:-pQUF`:l"FCcRn83o!g2BZ[AF(c\)DIal#@<?''
-uEmFDKK<$DBO%8D.P.=+Xefh4Y@jlDe*ZuFCfK$FCefm@<6*m@<?('Ebl0lBOPsq4ZX^,BONYR
2B[$O@:UKmBl%>i$>OKiCh\!&Eaa'$?YEkhBOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=R
De*ZuFCfK$FCefm@<6*m@<?('Ebl0lBkAt?0H`M$4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm
@<6*m@<?('Ebm*GA8a(0$6UHG+Bot0BQ&*6@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:
+>"^L@<6*)DJsV>F`:l"FCeu1+<V+#AScF!/g)kX$>"*c/e&.:%13OO-o2u,+>>5eAnc'm%16f]
/g+b;G\M5@?YWpjDfp.b/g)QW@:O(o4Z[=rA8Gt%ATD4$ARBIrDfdNXC11UfF"_9HA8Gt%ATD4$
AM5D[/151NA8Gt%ATD4$AM.\3F!i)@D_<.A$6UH>Eb/Zi+F,CYGB.D>AKZ&-Dg-//F)rIBF`\'"
+<W'o14(^%DI[c;+Eqj?FCcS9BQ&*6@<6K4C11UfF"A\<:IIucC2[X!Blmp,@<?'5D.G"'$>"*c
/g(T1.1HUn$9g.jDe'u/Df6b&+>Y-YA1&`I%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eODe*ZuF>,^8?O[?OF_PZ&?Z:.0FCfK6:-pQ_@WcC$A7':uFED)7F!,NU/KeMFBl%<&
E-68EATDi7F`:l"FCcS.@<6*)A79Rk/e&._67sAi$;No?+CfG'@<?'k3Zp131,<9\B.u:S$;No?
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`]E,m]k+CSeqF`VXIFDi:8@;]UlAKZ#)@:V$0DJXS@
E-67FA8,OqBl@ltEd8*$+:SZfDe!TlF)rIGD/a<0@p_Mf6#^sgEcWop3F=p1-UC$aE-68CF"fU7
-QlV9@rGq!@<6!&4=<E\6#^sgEcWop3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\Df7d"+FPkQBk/>?
%13OOF(96.4ZX]5E-68EATDi>%13OO4tq>%A0<7BFD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&
ATT%V3[\rZ@:UL)EbTW,+EM47GApu3F!,O;@59\u+CSl(ATDj6EZeh&AoD^$F*)FFC2Rs6+DPe4
GAqJAF<G[>D.Rd1@;Ts+-S0=KEc*EU?YEkhBOkOnAT`$0-OgCl$;No?+DG_7ATDlGEb03+@:Njk
@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e@;9^k
?Q`umF<Dr-:K(5"-S0=KEc)<n%14L>+?CW!.3Kuc+:SZlAhG2[+?^i20RHM[6W-]e@;9^k?Qa<1
F<DtoC2Rs6E,Tf>+?M>$HQ[39Ft"OhI3<E;G!.l//8es@+CoCC%144#0d'[CF(fK9E+*g/+=D,N
F<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]E,Tf>+E2@>@j#l-D.Rd1@;Ts+DJsV>F`:l"FCeu1
%16Z_F(HsH0b"J$DIb@/$7QDk%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!,O6Ec)<n%14L>+?CW!
.3Kuc%15is/g,:UA79Rk+B(fs1,Us4BOPsq+CT.u+Cno&AKW*)$><jhBK[sjF(eu;2)ZRtART*l
Anc'm%14M)@rcH<-XUOqF(f)mFCfT8CaUYp3Zoha@<6*DFD5T'F*(i-E$-MU.3L#m+>G<n+<iFZ
@rcH<-XUOqF(f)mFCfT8CaTZ!BkAt?0H`M$4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0
-Qlr</e&.1+>G!C+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+Eh=:F(oQ1
/nAC4AM.Y)F(c\6Dfd+EE+EC!ARm.t$>"$pAM,)[%16ZaA1e;u.1HUn$9g.jDe'u/Df6b&+>Y-Y
A1&`I%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eUF`_YF0KD.#%13      ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&o2]sn3+>GYp1GE9\Bl%<eC2[X!Blmp,@<?'iF_PZ&+CT.u+Co2-FE2))F`_1;C2[X!
Blmp,@<?'iF_PZ&?Z:.0FCfK6@WcC$A0>i6FED)7F!,UEA79Rk+D>2)BHUhoFCb           ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fCg10fC.1+>G_r1*A;-3?U(2+>P&o1c-=11E\Fq3&``N+>Gbs1*A;,0fC./1a"Or0f1jE+>GSn
1*A>33AVd50H`+n0ek@;+>GPm1*A>02`NZ;0f'q-+>c)53?U(3+>P&o0JG1:+?1K!+>Pi62]sh/
+>P&u0Jk^20eje++>G`02]sh8+>P&o0JPR10fL41+>GZ11E\D-+>P&t3Aifh:IINL8PDNC8Q/Sa
;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp+6+A-'[+>PW+1a"M03\`BN2)5M2:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-
0f1pG1-.9J$;+)^?Z0CpATDs*A7&ngEc5u>?Z^O71,Vfn/h0Ih6sjkAF(KB8ARo.ZEcQ)=F!,NU
/KeMFB-;#/B-:W#A0>o(F)Z&8F(KDF%13OO:-pQUHZO:;Ec`mOAh@q1F(KB8ARmB(EcQ)=F+"K)
%15is/j)9F0e"5TEaa$&3Zr?Y+DbV%Bln'+@<?''-tI43.3N&>B6A'&DKI!LC2[W9C,I\%.1HVZ
67sB93?V%)EZd+k0Jst-1HIBI3\`H#$4R=b+<VdL1a"OrA8Z3+-Y.?I%19tYEa`j$+D#S6DfRl]
DJWg)D@HriZQLA5DegJ-+<VdL+Du=2DJWg)DBO3W%13OO:-pQr4t&-7+D,>43Zr9XA8,XiARlp*
BOr<0ATD6&-tI43F(Jd#@q[;6FDi:9DKBr@AISuA67sC&BOQ!*@;^?5DKTc3+EM+&Earc*Ch[s4
F!,FBDfB9.Cj@.AE+No0FDi:>F_kk'$;No?+EV%$Ch7Z?+B3#gF!,(/G\(q=FD,5.Ea`j$+D#S6
DfQsP+EV:.+Cf>#AISuA67sC)Dfol,+D>2,AKYSnBl%?k+E)-?DffZ(EZee2B6A'&DKI"?@<?U&
Ec,qL+D!0</g)qm1*C+FC`k*7Df7!G%15is/g,@PFD)e7D]j+DBlmp-+EqaHCh+Z%@<Q3)AmoCi
ARlnm$;No?+<WTc6#^ie1,(C>+>G]60JkgG0b"I!$4R>;67tA`-o*4o@rc"!BK@8[BOu'(@<?U&
D/aT2DJ()6D]j(3B5)F/ATAo%+E2@4+A*b6/hf*k$;No?+Co1rFD5Z2@<-WG+<XWsATD?)BlbD*
+EMI<AKYGrDIIR2+DG_'Df'H%FD52uCh\!:%15is/g+h=Eb-@F+Co1rFD5Z2@<-'nF!+t5ART[l
A0>?,+A*b6/hf+)A8`T.Dfd+CBQ&)($;No?+EV:2F!,%7Ec5t@/KebFA8,O^FCfM9DImBi+D,P4
+Dl%;AKZ#3@Wca6+D#S6DfQ9o:-pQUFE1f/E+s3&+DG^9@3B/nG9CpEF`_>8ATKI5$;No?+>Pr"
9jr&b1,(C>+>G]60K(sJ1(=R"$6UH6Eb/lo+=CoHDJLU]-Y#2BC12-nBk)7!Df0!(Bk;?jDImp,
@;0UaC12.#ATVctBl5:-$Gs,[Df&osDBNM2Ec5tZ+DP8(ART*Y$Gs+l+<Y9:AS""W+<VdLC0u!m
@:UKo4(\p/%15is/j2BH1+=>XBm;Z]FD,5.C1_0rATJu;ATD7$+CT;%+Du+A+CehrCh7-"FD,]5
F_>A1@;ZM]:-pQU@:XOmEcYe73]\C*Ea`p+ARlotDKKH1Amo1\+CT.u+CT)&+EVO@+DbV4AS`K!
DfTCu$;No?+A,Et+EqaEA9/l%Eb-A%CiaM;FE1f/E+NQ4+<XWsBlbD.EcQ)=+EqO9C`me@Bl%T.
De!:"EX`@N67sBmDfQt7DI[U%E+*j&@VfTu@VK^gEd8d>Bl%@%+C]J8+DGm>DJs_AE,ol9ATDU4
+EVX4E,]B!/e&-s$4R>;67tA`-o3:pGB.V>B0%.`A8-+(.3N/>ATJu3Dfd+@Ec5o.Ebp"DA8-+(
CghT3F`(o'De*E%A79RgFEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%144#+<Yf;4ZX^.
3ZoelBPDN1BlbD>DJ<U!A7[+t$6UH6%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth+<V+#+<VeG
F`\`RF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrDZKYrJ\
KYrJ[^C:OeZSB>'0d([YEb$S>.3NSPF<G:8+>#doZYFW#CVmCe$H%D3KYrAYKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrAYKYrJ\KYrJ\R10KG+<Y69@<6!&-ZrrI%14g!$6UH6
B4Z0--ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0uC7O
+EqaEA12LJ+Co%qBl7Km_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_jLr@+<VeLA.8lfBPDN1BlbD>DJ<U!A7Z2W+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg$6UH6%144#
+Co2-E$-NNA1&Kp67sC%BQ&$0A0>DsF)Yr(Gp%3BAKX9;6V0ilG%G]8Bl@l3AoDL%Dg,o5B-9eh
@rH7.ASuU(Df0V*$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZS98&+\GNu+D#S6DfRl]A7]@eDJ=3,Df-\0@;0P#Eb3+o
%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_jLr@%15is/j2BH1FXGYBm;Z]GAhM;F!,17+DbJ.ATAo:ATDj+Df0V=De:+a+>"^X
ATMr9@psFi+Co2-E)gdi@rGmh0JG3j$4R=O$4R>;67tA`-o<@qATDg0E]P=bBOu3q+DGm>@3BB)
DJ()5FCB&tBl7Q+E,ol+Ch7H+GA2/4+=M,9D.R3cFE8lRBl5&8BOPul$;No?+<Y3+@r,RoARlp)
@rH<tF!+n3AKYl/F<G".G@>c<+ED%8F`MA2A0>B#EcP`$FDQ4F%13OO:-pQr4t&6:+D,>43Znk=
%13OO%15is/j)9F2(9YZEcQ)=3Zohf@;BF'+Eq78+D,%rCh[d"+EVNEB4YslEaa'$+D5_5F`;CE
GA(Q*+EV:.+Co&&ASu$iDKH<p:-pQUCh[s4+D#D/FD5;s+EV:.+D5_5F`8I>BleAK+<V+#%144#
De't<F`_>6F!i)7+>Y-YA0<6I%13OO+<WE^?SWa@@;BEs-[0KLA7fb#D..O#Df-p3$4R>;67tDb
-oEFrAncKN+Cf(nDJ*Nk+=M)8CLq.".3N_N+D>2$A8Gg"FD,B0+Cei$AM+E!%13OO:-pQq4X`3;
+D#D/FEo!AEc6)>F!+n3AKYl/F<G(6ART[lA0>?,+EDUBDJ=!$+CoV3E-#N0BlJ08+C\nl@<HX&
+D5_6+=D&8D.P(V-RT?1:-pQUAmoCiF!,C=+CT.1Bl8*&Ch[E&DIIBn/g(T1%15is/j2BH2CTb\
Bm;Z]-tdU<@;BFo.3NJGA8,XiARlp*D]j(3D/XT/+CT/5+D#D/FD5<-+D,Y4D'3_)D.RNtF*&O6
AS,k$AISuA67sBjEb/[$Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&Hc$4R>;67tA`-oWRtATDg0E]P<k
C2[WkB4WM7Bl.g0DfB9.Cj@.6Ble60@<lo:F(oN)Ch4`,@;TQu@q]:k@:OCjEZf14F*&O5EbBN3
ASuU2%15is/g)o0+AQiu+>PW)2]sh/3\`WU1c5^L%13OO+<VeADe*9hAKW@2F*(i4-QjO,67sBj
F`_[IDIIBn%1;*ZN8g(PifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufT%1;*ZJhc8LK&W#RifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>O
ifo$;ifo&SP_)Y=D.V^kJja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K
+A?3bF<GOFFQ/O:6t(@^+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufD
ifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*Eg+<][.Jhf#62_[6H0eP:*
+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL+QAW;1,(C@0KCjB/i4[n+QAW;2`W!'+<VdL+<VdL+<VdL
+<][.K&W#H%1;*ZJfs';K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohi
P_'>Oifo\eP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme
+<Vd9$4R=b1*@]SDe*9hAKW@0F*(i4F!hD(ifoD]P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#IpifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXOQ)LV%1;*ZJfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4
D'2;^EcZ=FE-69^P_);3FCcRg@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;
ifo&SPap`tJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*ZJfs';K&W#H
@NZd9ifo$M0JGF>3AE6@1bg*q+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G0ek:;0d%Uu
P_(hS+<VdL+<VdL+<VdL+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX[,R=#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXR,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDuf\%13OOC2[WkB4W2I3[\HZFCB86Eb/]-+<XEG/g,(J+D,P4+Dbb5FE7lu
%14m6C2[WkB4W36/g)qmA8Z3+-RT?1%13OO:-pQq4X`9=+D#S6DfRl]Ci<`mBl7Q+8l%htA9Da.
+EM%5BlJ08+D,%rCi^_CBOu'(Eb0<6DfTQ0B-:`-D/^V=@rc:&FE7lu:-pQUGA2/4+Dtb7+EV=7
ATMs%D/aP=/KeqLF<G(,ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++CT@7F)Po,+E275DKH<p
:-pQU0JstK@rrhK0JPF-0KD0K0fh'E%13OO0HiJ2+?V#]3\P5dA1q\9A8lR4A9Da.F"_BAE%Yj>
F!hD(%1441/hSb!Df'31FCeu*FCf]=+>,9!/e&-s$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+.h)i50RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)h9/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/I^$@FOT+\GNu+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/I^$@HZ$DJ+')+D#S6DfRl]A8_naHlsOSB0@k88Q&;X;dWmBDd-X5
/g)8Z+@Jsj9grDrA8_na%15is/j2BH3%5t^Bm;Z]DJs_A@q]F`CM@[!+D,P4+E)41DBNJ(@ruF'
DIIR"ATJu.DBNn@FCB!%FE7lu:-pQU0JstK@rrhK0JPF-0f1pG3'&fT%13OO:-pQq4X`<>+D#S6
DfRl]-td@7@WNt@Bl7F!EcP`$FDQ4FAo(mgF!,OBD.Oi+De!3l+CT>4BkM=#ASuU2+EVNEF`)2A
DffQ$%15is/g+kGA8-'q@rri+Ci<ckCi^_-F!+m6D/"6+A0><%F(o9)D.RU,/g)9+DfQt3G[YH.
Ch5XM%15is/g)i.+AZKh+>PW*2'=V/3]/`T1bfFH%15is/g,7LATD?)@<,p%DJpY7Bm=3"+CT>4
BkM=#ASuU2+:SZpBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2
.6T:+0F\@;Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUBl.g0DfB9.Cj@.DATW'8DK?q;Bm=3"
+CT>4BkM=#ASuU2%16`aDdmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M;'%15is/j2BH3@Q(_
Bm;Z]D/"6+A0>T(A8-'q@rri%F)u&.DJ`s&F<G.8Ec5t@AncL$A0;<g:-pQU0eskG@<itN0JPL/
0f(jI1HIBP%13OO%15is/j)9F0eb%!ATDg0E]P=ZBl7K)Ch[a#F<G.>@qB4^ARlp"Ddd0jDJ()1
Ch+Y\:IH=9F_u(?-t6\#.1HVZ67sB71a#M$EZd+k1,C%-0KM'J3\rc*$;No?%15is/g*T#B5)6p
3Zr/t/i51805<C%@<QlN04\L3GA1q($;No?+@:3bCh,RL@rH4$ATD9p@;ISP0JYF90JY482cMLh
3\iTS0K1XpCgh3o/MT(60J+t3;bTVK7QiI8$;No?+A?KYEaa!63ZpF81bLO;%15is/g+#5+A"si
3Zp110J5.72D-a;1ak771+kC4%15is/g*u,@<?+"Ec!i[6t(+[Bl5%O1^sde67sBPDKBo.Ci!['
3Zr/t/i4\bDKBo.ChsOf:-pQU8T&Tk@;KaV@<?0D+>7kYATDiFC2[d'@UX%`E\D/c1bWT(/i4"E
:-pQU6Z6ja@:OC?+Er$R/o#HGAor6*Eb-k5Df#pj%144#+@T%46rn,4H#IhI?SOMo2_m9S3\`QO
1a"P-,UZ;T9grD[8OH6#4"!rn;aOh_6mk&D9gqcF?UII64"!rn;aOhb5uU`i:-hTC-T`\S6;p3X
7S-KV<*rBd9gpEk-V%');I<!`-T`\CDf0Z;@:OC,4"!rn;aOhc6W?rj<_6+84"!rn;aOhh770IM
6rYNq-Uh-)6siMR-T`\E=@5J`;b0\^<*rTn=B$Y0-V[#u9OC4X7UJP_-T`\M77BmW78-9C?W:0)
741/E9gqKE?VNme;I<=#:+&+N9g_lX?UR=]6ROrC5u^cc?V*X54"!<n;d!Hq78lQ$4"!p;E,Tc=
6Z6LH6ZQaHFCdjKFCcg]-W4MpDfTqeDe*EQ@<6NjE+EC!ALBPf0I/>$4!ua_7lX!r1.+Mg2^^[7
0JG170JkaF1FG730f:^F2`39D-T`\FBl7Eo-T`\M@<-'uH#=uk-SR8/0JG170df%1822nX0IJq1
/14@D.6An30eY7?0/>492]sh13\W6K0JG+50JFV89d`"M-T`\NDfd*fF)u&.DIm?+4!ua90eY:9
0fU:11-.*C3\W6?0JG1'5tr^g-W3M`4"!Hl2)$C>-Ugcf0Ha7^8PUCP010o'B-9N]CF;1k-T`\'
4!uC;-RUu(0I/>$4!uj^1cJ&s3($h,1+,.20JG170JbRD1+,.20f:dA2D@!C-T`\AA9fOa-U_B`
Depd_-SR8/0JG170df%1822nX0IJq1/14@D.6An50/>I>1,(FB+>GW40JGOA0J5%50H`YU-T`\E
2)lsF-W<H1+ED$S+@0g[+A[)mATAnl78P*qG%GQ5F!)l*5p1)`Cj@HW4!uj<0eY:90fU:11-.*C
3\W6?0JG1'5tr^g-UUEP4"!Hr0JFk9-Ugug0H_qi7WNEa+B3B(AKX<UF_)p^-RUu'-T`\'4!uC;
-nlo#.6An8<(&Q5;E%!D0K(:?-SR5.0JP:=0fCC@-S[J82)I*H0df%16"G6g4"!R-FED5.-T`\0
0eb:80JG4/4"!QR1Gpj64")X-;^X"U-SmD22_Qp?0fU:11-.*C3\W6?0JG1'5tr^g-UfmP-T`\S
78P+IANCr"Cht4iFD,6++B(^*+@UHbDKKqB-quuMDf0B:.472)1bUR:1,(FB+>GW40JGOA0J5%5
0H`YU-T`\C81-JH78trp-T`\E<%p!K/KdN'Df$UrEckq96>UdU-T`\'4!uC;-RUu'-T`_1,VUZ/
-S\U[2F0eh<_,/)-T`\00JG181c73G-T`\12)[-B1bLC5%17K!Bl.R++D#S6DfRBOAU%crF`_>8
B-;&0DII&u0HiJ20b"J;@3BW:F*(u1+Dbb/BlkJA@<3Q&G[k;rA7]9\$@Es=+<VdL+>=s"0JP\)
E+*j%-[nZ`6r6c^6rcrX;_MTiBeF+7F!hD(Hs80\2-h=XF`V,7F"_9HBPq9fCLqN>C2[W9C2[X%
Ectu9D/aPL@Uj+)Bkh\u$4R>;67tA`-o!G*+D#S6DfRl]@;TIfB5_p6+E)CEE-67FAoD]4D..3k
+=D8EBle0#D.P(($;No?+>Pes6#^ie1,(I>+>G`71c[TN2[p*h67r]S:-pQU7;caPDIkjOC,mn(
/hekdATV?805<C%@<QlN06_,JA8c[5%15is/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MK"51,;f`
2**HN3\`BC@r,RkB.Yhq/MJb802kP577KEp%15is/g*i%@WGmtGrd'./i>79%15is/g+#5+A"si
3Zp110J5.72D-a;1ak771+kC4%15is/g*u,@<?+"Ec!i[=(uOp2DbjM:-pQU8T&Tk@;KakE]P=X
3A*03Bl8!6@;K`h$;No?+A$HlFCB!%:gnHZ3Zqon05<C%00(XB%15is/g*N"DKK;sF?1OgGBYZS
F)PZ4G@>N'/n8g:%13OOD..3k+=D8EBle0#D.P(;:-pQUA8c%#DC9NK@;p0s@<*K4D]iS/+CT/5
FD,B+B-7Wj:-pQUBlk_D+Du+>+Cf5!@<*K7BOu3q+EV:.+E)CEE-67R+DGF1@;^?A+D5V(F"Rn/
%13OO%15is/g,LPDIb>;Ah@q1F(KB8ARmB(EcQ)=F+"K):et"h?YXLiCh\!&Eaa'$1,04F:-pR0
:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfQsK/M8J83XlE*$?L'&F`_SFF<F.E5sn((3Zoh)
+?CW!.1HVZ67sB/C2[X!Blmp,@<?'0+DG_8ATDBk@q?d,DfTA:F"'-m1,(I?0JP7;C,%M$3AiT"
:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g++a8Q/GO:..lF+<VdL+<XEG
/g+bKCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?F(f-$C`m\*FD)*j:-pQUAoD^,
BkCd`ATVL.+<VdL:-pQUAoD^,@<?Q5BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`i
AKZ28Eb'5#$;No?+D5_6Ch[u6+<VdL+<VdL+AP6U+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HVZ
67sBpAmo1\F(Jj'Bl@l3+<Ve%67sBpDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?
+DGFt+<VdL+<VdL+<VdL+AP6U+D,P4D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G]XB%:-pQUF(KH.
De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0
Gp%<OBlmp-+E2@4@;TIiAISuA67sC'GAL]0AU%g-GAhM4F!)T#67sC'DKg,0E,]B!+DbJ.AU#>0
Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpa%.:-pQUGAhM4Ch[u6+<VdL
+<VdL:-pQUD..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW.1HV5%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%14L>+?CW!.3Kuc%172tGqKO5:-pQUF`V+:@;^?5
E+*WpDdso2ATT&/DBO%7AKXT@6m-GhDe<^"AKYT'EZfI;BlbD6@:NtbDIj7aBkAt?G@c#+@;9^k
?Q_HY:f9_O78d#P6r60E6r-0WBkhQs?RHt,D_</384c`V5u'gD6XO8:De*ZuFCfK$FCefB3Zq6s
77K^D;FNuM5u'gD6XOPBDe*2tASu$2%16f]/g)Ys00gp5E+*WpDdt.A74p#3E+*X-ATBpd+?M9(
+?V_<?SWaGCh=e<F(f-$C`l\J8Q/GO:..lF?X[\fA8Gt%ATD4$AR?u9+>#0gATDj+Df-pO+>#2g
6W,%;D_;J++<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,A8bs#E+*j%+DGF1@s)g4ASuT4G%G]8
Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^_$>"*c/e&.t@<?!m/e&.1+EMC<F`_SF
F<Dr";Gp:g3ZrBMDIdZq+Du+>+EM+9+>"^EA867.F<FOR8Q/GO:..lF?X[\fA8Gt%ATD4$AR?eo
$>"*c/e&.:%16'16r./^:IITH6XO\@1,fXL+^8]"A7TUg+EVO4D]ik1F*(\9C2[WqEa`p#Bk)3;
FDk].?YXLi/oY]@.3N"j:IITH6XV$9:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^h
F!,(5EZea^:IITH6XVMU$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(
ATVX'AKYo'+CQC7@<62n$=Rg_+DkP4+CT5.ARTU%Bl5&3FD,6++B2-):EXIfF*)IU%13OO?s@)O
B5)68FDk].?!n*K%14gB+CI<=3+[)CDJ*co3H[&uAp/300kb5TG;M3qG$dF@+A$GnFD,5.@WcC$
A8,po+A,Et+CT5.ASu$mGT^L4ARTUqGp$[CE,8rsDBNV2G9D!G+EDUB+CK8%FCKB,Ch.'jEcYV@
+A!\jF`VXIF)Y].F<G!7An?/q$6UH6BQ&$6F!,")@Wc<rBl7Q+@3B0)Cht5'F_PZ&+DG^9@3BH!
G9CI7G%ku8DJ`s&F<GL>Cj@.FD]iS)F(9-3ATAnb+EMI;G%G2,FD,B0+E2@>@VfUm%144#+F.O,
EcW@3B5\o:Bln#2FD,B0+Eh=:@P/)s%14jC+CI<=0Q(KE@;fh"0K",jH8RT?E&;Yr3-]*mG$dF@
+B<Ak@<?''FD,5.?t<\f@<?d6ARHX(ATD6&FDi:9DI[L*A7Zm*BOr<(ATo87F_t]1Bk&9-H#R>9
+DG_8Ec5K2@qB0nGA2/4+A*b:/iF.G%14mD+CI<=@5i"D13dkYG^)2kE&]k'2/d;J13G9a2.&OT
+AucoBldi.FD,5.A8-'q@ruX0Gp$O5A0>>qDIIR2+D,>(ATJu8ARfgrDf0V=GA(Q*+EV:.+D>2)
BHVA1A7]7ZEZet.Ch4`'F!+n%A7]:(%13OO1bKnY4C;SUG%+ujASGj4F_5E3F_5c6AoKYH@Vdi-
5%#L2AThd/AKYAiDJW]3+CK5$F*(r#+EM+(FD5Z2F!,RC+DGY.F`VYF@<?''F`V+:De:,*@<6*)
F(o/r@psC1%13OO2(g"Z4C;Z7H>IP512:uAAmomnF)GH00l8U$3&c"f5%#L#Df0W1A7]d(Bl.g0
Dg#i4B-:f)DKI"FASGdjFE8R=DBNn=Bl8$(A0>E$@s)X"DKKqP+B3#c+D,P0F<G^IARl5W+<Ve=
DfQtADfp)1AKYK$A7ZlnDfol,+C\n)@3BB#FED>1+C]8*A7]d(/KeVGE+NNn@;Kb*+EV:.+Cf>+
DfTE"+EV1>FE9&D$4R>#/g+Oa?Y"FqEcQ1ZEFNT<1372H2fj%b3GEMH@Q7^Y?m&!KEc#`4BmO>5
@rGmh+Cf>+DfTnA@;]TuAoDR/F!+n$Ec6#?+CK#,FDPZ4FD5W*F'p,!DIaktE+*WpDe!/tF*VYF
@<`o)Des?4Bl7Q9%144#+@C9lEb0-1Cj@.FBOu6r+E1b!CLLjeF!,UHAKYMtAnGUpASuT4AoDR/
F!+n/A0>B#Ci=?8/e&-s$9'R[?p%dSE\KLj3GrhMH89>G2`5]!G^*nBD.70u?Tqj?;It#cATo81
Dg*=GD]iY7Ci"A>ASkmfA0>;sC`mb0An?!oDI[6g+D,P0FE8R=DBNn=Bl8#8:ddco/e&-s$90X\
+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+
A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$=I(LDIb>@
De*cl?k!HB:IIuc8l%i^D.GC\%147_C2[W*FDk].+Dbb5FBp;:De*cnC2[W8E,K;;+CIf;6sq-:
:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#
A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"Rn/<+ohc@UX=h
+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*B;$:8cOGB7=<
FD,5.Eb0E.F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AKZ)5+ED%:Bk;K2@q]:gB4Z-:%15C;F)NTP
Eb/Zi+Br5eBleB7Ed99SA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,
F*(u605>E905,'@FDl2F/o>,J%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4
/g*u,@;^-/A8`T.Dfd+>ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>M>@M/VBl5MEDe*cl?k!GP
$8F.U?p%dP@W=DO3I,[f1N@OnF>bn#Bk(sn1,iih?Tqj?:1\VlDKTf-EbT#+A79RgFEqh:F!+n/
A0>;'@rH7.ATDj+Df-\?FD5Q*FEo!:@kM.3@<,p%@V'7kB-7Wj+<Ve8A7T7^+DG^98g$,H2BXD'
0JYJ"@;[bS.3NhG+Du+A+D>2,AISth+<Y&FBl8$(B4Z*<055<GAS5Rp1,!?ZFCf)rE\oF]Ci<a(
Bl7Q=04o$=@<?4$B/D8RCi<a(Bl7Q<2IIYOBOu'mG%G\:FD,6+AKYE%AISth+<Y0-@;]^hF!,RC
+C]&&@<-W9Bl8$(Ec,<%F!,1=+DG\3@:OD#+A,Et/g)9.-['&D@;Ksq@:XX+BPDQ2@3B&uDK]T3
F(oQ1+E2@4@qg!uDf-\/EcQ)=/e&.1+<XWsAKZ&*EbSru+CoV3E$/b2Ec#6,+E_aJ@;Kb*+EqaE
CNCV2DeX*%+D,P4G@>N&+C]J8+A!\aD'3>,DI[6uDIm?$@:F.tF<G(6ART[pDJ'Cc+<Ve;F_u(?
F(96)E--.DFD,*)+EqO9C`mV6F<GC<@:UKpDBNk6A7]d(8g&:gEcYr5DK@EQ=(uJe+D>2,AKZ)5
+Co&,Bldi.F)Po,+EM%+ASkuf$6UH6FDi:3DfB8?%13OO1+j\W4C:*aC,9d?1N@PP2`Yf$ASl3?
1hLMWF_!775%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHVA1A7]7ZEZet.Ch4`2D]iM'DIIR2+C\bh
CNXT;/g+),GT^mHD.7'sARlok.P>FMAmc`nBl%@%+CT;%+CfG'@<?'k%144#+C]U=@3B#f@r$4+
/g+,,AU,D>BQ&$0A0>c$G%G\:@V$ZjCij6/ARlomGp#^T6m,oN@;0U%@;]Tu@V'7kB-:Yl@r$4+
F!,17FCf**BlnVCBlbD,EbTW0@ps1+%144#+B3#c+EM7-ARf.h+D,>(AKZ28F_kS2@V$['Bl.g*
AKZ)+G]Y'?Bl%?'GA2/4+B(fs/M]1A+D>2)BOu69+DEH>/e&.1+<Z,^IXV_5+<Vd`12:<4@<6*n
F"VQZF:AR"+<XEG/g+YBA7Zl<2^!$V+C]5)+EV19FE8RHBOr;q@:O(qE-!.1B45LlF*&O<@<6*n
Et&I!+<WBt+C]5)+=Ach%144#+F\cgILQVn$8X:W?p%dTH>#)nCH60HC,L3NA8l9?0Of?LEGfVQ
?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B5lF(c\7@VTIaF<G1(@qfanFEo!NBOQ!*GA1l0+EMXCEb-A%
+B(fs/M]1A+D>2)BHVM4ASrW0F`__>DJ'Cc+<VeF@VTIaFE9&W8K_GY+EV:2DJNs(B-:W#DffZ(
EZf:>FD5Z2+Cf>#AKYA82ddbMBOQ!*GAhV?A0>`#@;[3/FDl22+CQC+@<6*)Df-!k+<Ve7E-681
+E)9CFCfN8+CQC+@<6*)Df-\*B4Z0m%144#+F\cgILQW,+<Ve%67sC)DfTA2BlbD9F`\a7DIaku
+D>2)BHV#1+EMXCEb/c(Bl5&%+ED%7ATDs*A0>r0DfdT@$6UH6+>=om2^!'^F<DrTDfTA9%144#
+<XEG/g+h9F(c\1F!+t2D/`p(ARlp*D]j43Cis;3Eb0?5Bk;I!A0<HHATDg0EZf(.+DkP/@qZus
@;0P!/e&.1+<Vd\+>GetB4Z0--[0KLA1%fn+<VeUIXZ_T$4R>!/g+Oa?XdqqD)68hG%>]=2edAF
2J[)RH"ere1j34i?m&&hF!,(/Ch4`4ATD7$+DkP4+D>2$B-;D3ASrW!@q0(kF(oN)+EqO;A8c[5
+D,>(ATJu4DBNJ1Bm+'/+CSbiATMp(A0>?,%144#+BD<6+Cf>-DIm="Bl@m1+EqL1DBMtV:*=7l
+E(k(/g+,,ATD?0F!,@=F<GFC@qZuW:IH=8@;[2uD]iY1EZf4-E,]B!+=M&;FED)7-Y6g;%144#
+CoM,G%G_;@Wcc8?tNtpBleB(+D#_-DKL#0Ci"A>Eb0?8Ec,q@0HatGEZeCZ:*=Uk@<,q#+Dbb-
ANC8-+<VeUIXZ_T$6UH6+D,20BleA=-SI,fAohKoFtba+F(f!&ATKM>De(M9De(M9GAhM4F"V0A
Ag\#p+<VeUIXZ_T$6UH68l%ht@rHL+A0>E$+CQC4F_P?$+D#e3F*(u2@q?cmBOt[h+E)-?GA1r*
Dg-7FF*VhKASlK2GA(Q*+DGp?F(Jp(+E_R=@;p0sA.8kg+<Y`=@<,q#+CHiUF)Po,06:f8Eb-n8
BP9&6GAhM4F"V0AAmd56+B3#gF!,[@Cht53Dfd+8ASc<.AoD]4<_uO6D..C&ARlooEbT].Et&I!
+<YlAASrVk:ei-IF!,C5AhFN"%14sF+CI<=1GNu2A8c()CjBuBF^\luF*DPB2`NX5E*ke:+B2on
F<Ft+De*ZuFCfK$FCei&Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO2D-+[
4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5Cggdo
+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdkARlot
DBNt2@qBP"+A*c"ATDj+Df0VK%13OO2_H3q+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP@UD<,
+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);
FDi:BF`&<o:IH=IATMs7/e&-s$90X\+<Y&S?Xtm%FCo<!0f4/pG&1T/DI[?8E+(V;GAghP?m%gT
DKBN&ATAo%Ci"$6Bl7Q+@"'b:+CT=6@3BMtFD)e9Eb/isGT^pB+DkOs:K&BEDIak`Bl8'<+EMgL
FCf<1/g+,,AKYZ)D.Oi#Bl[cpFDl2F+Cf>-G%GQ5Bl@l3Df-\>BOu6r+EMgLFCf<1+DGm>Eb0<2
ARfgnA0>?,+CJ_oEaUL/$4R>M>@h\_/TboADd?`[$=\-lCh.:!A7TCqFE2))F`_>9DDEqA67s`s
F_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO:-pQU
@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIG
D/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&3B9)I+BosuDe3rtF(HIV-UC$aC2[Wl
F_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/
A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:
Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2FD5Q*FD5<-+CT.u+Eh=:F(oQ1+EVX4
@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$;No?+EM+9+Co2-FE2))
F`_>9DBNJ(Eb/a&DfTQ'Et&IkA7TCp4ZX]58l%iC:I@NA;BSS-6rR&N7n#g;;BSS-6q9gJ6qL9!
8l%iR:K::[78m/O7n#g;;BSS-6rR&N7n$6B7RTgG+A,Et;cH%Q779p=6qL9(%16i\A8-'I3Zr0J
A8-',/0H;_8l%iF8Q8)R6UXLD+A,Et5t"+::..ZO+A,Et;aXGS:fKhS;BSS-6q(3W;aa2T-Qij*
-u*:'BlYXc3ZrKTFCKB,Ch.'jEcW?W%13OO:-pQUB4YslEaa'$+Co2-FE2))F`_>9DBO"1EbTK7
Et&J!E+EC!ASQ-oD..<rAn?%*+>=638l%iU9gg+5F_PZ&C2[WmDf'H6ATMp(A0=K?6rR&N7n#g;
;EIKH6q9gJ6qL9<8l%i@6psgG6qL9<8l%iR6W-KP<(';U%15^'6rZrX9N+td6m,r]Bl%<pDe*s.
DesK)Df'H6ATMp(A0=K?6rR&N7n#g;;EIKH6q(3W;aa2T4%`::;aXGS:fKhS;@Nt*:IJ5X6m-Vk
A79RkC2[WnBleB:Bju4,Bl@l38l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6psg<6qL8c$;+)^<_Yt)
F`:l"FCf3*A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)A0=K?
6rR&N7n#g;;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO:-pQU
A7]h(Ec64G@WcC$A0>],@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eO
De*="Bl%<?3B:FU$4R=O$>=-pFDl2FC2[W<2[p+,ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/heD"+Co&,+=MGJE%)5'%144-
+CIl35u(f1@;]Tu?s6,l?m';p@rcK1DfBf4Df-\-De*F#+CSekARmD&$4R=O$6pc?+>GK&/i#:,
6#^jYC`kPc+>PW+1E\)EE,oZ1B-9c`A8,OqD.RU,F!*n^Bln'-DCH#%%144-+CK(uG@Y)(DJs_A
FCArrF!+k$E-#T4+=C&U<'a)N5t=?k4#(+c@;]Tu?t=4tATT%B5uU-B8N8RT4#(+c@<3Q%AS,@n
Cij_-$6UH6+EqL1DBNG0ART[pDJ()0ATo8-Bk)7!Df0!(Bk;?<%13OO+=\KV5p1&VG9Cj5Ea`fr
FCfJ8?q<R^846HP:gbDZ@<3Q#AS#a%@:Wn[A0>u4+CJr&A8kstD0%=DC3*c8+B3#c+Co%q@<HC.
%144#+<YB>+>GDiFEMVA+E(k(+EqOABHSu]+BN5fDBLYV@3AK>5qOiL2BZ[AF(c\1F!,FBAS,Y$
ARlp*D]j.8AKZ&9@<-H4De:,&F_u(,$6UH6+EM%5BlJ08/g+,,AKYT'Ci"$6Bl7Q+FCfN8F!,(5
EZen8D/^V=@rc:&F<G:8FCf**BlnV]%13OO+<VdL+<VdL+Cf)#BOPsqA8Q9m@;9^k?Q^_F@:Wne
DK@IDASu("@;IT3De*p-F`Lu'05>E9A7]p:Bkh]:%13OO+=\KV5p1&VG9Ca2@rcK1EHP]+BkD'j
EZea]:g$O[?m&rtA7Zls@<3Q#AS#a%@:Wn[A0>K&EZdtsE-ZP:EZf7<FCep"DejDH+AQisAR]Rr
CER5'Ch7Ys$6UH6+Ceht+C\n)F*)>@ARlolF!+(N6m->T@rcL/+EqOABK?S0+<VdL+<VdL%144#
+<VdL+<Ve%67sC$ART*lDJsW.@W-1#+CT.u+EMXCEb,[e+<VdL+<VdL+DGe?DIPai+E_d<3$<6Q
@:UK.DJsW.@W-1#/no9MDIOt&$6UH6+<VdL+<WK`E-67F-Z3jEAR]RrCL:dpH#@(=4%W7O:-r;r
C2[Wi4)&YZDIO%^%144-+<XWsAKYr7F<G+.@ruF'DIIR2+E1b2BHV#1+Du+A+DG^9FD,5.BOtU_
ATAo'Df'?&DKKqBDe:+a:IGX!+<VdLA9Da.F"SS)DfQt3G[YH.Ch4`2BOr;oC2[WnAThH(A8,Oq
Bl@ltEd8d@@<3Q"+E1b2BK?S0+:SZ#+<VdL+<VdL4$"a(De*BiFs(O<A0?#:Bl%i<%13OO+<VdL
<+oue+E1b2BHVM-F!,@=F<GOCAThd+F`VAE+EM47GA]#U%13OO+=\KV5p0WZB-:o+FE2;1F^nun
+DG^9G%G]8Bl@l3-o!>./i#43+D>2)+C\nnDBNG-EcP`$FCeu8+@.,\AS,@nCig*n+<VdLD.Rd0
@:s-oG@>P8Bl7F!EcP`$FDQ4FF(KG9Ch7$cBl7Q+FDi:00H`832BZs]F<DqYGAhM4-RW:EAmoCi
F`M&7+=L/[7n>']%144#+<VdL+:SYe$6pc?+>GK&/i#7+7V-%LF^]<9+>Po-+>PW+1E\)EE-WQm
@;KauDf-[dA8-."Df.!5$4R=b.Nh>+3A*!B+ED%2@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI
+E(j73?^F<1a%!NF!+t+@;]^hA0>u-Bla^j+<VeIAT;j,Eb/c(@3B&n@;]^h+EVNE?tsk&?m'Z,
Bk(g!@rH4'F`_29+CQC)Ci<a(Bl7Q+G%G]8Bl@l3DKTf*ATBC4$4R=b.Ni+e:eXGT8Q9(?G@>P8
@WcO,ARlp+E$07@+>u&/+A$/fH#IgJDImBi+Dl%;AKZ).@;[2G1a$=C@ruF'DIIR"ATJ:f+<VeF
DBO4CF`JTs:IH=E@<?0*H#IgJ@<,p%A8c1"B-;86D.Rg&Bl7Q+GB.V>B-AB,$4R=b.Ni,<F`_8;
?m&lgC3=T>ARlp*D]iP'ARfKu@VK^gEd8d;Df'H%FD52uCh\!:+>"^QBle?,A0>u-BlbD2DBNn=
BlA#7G%G]8Bl@lA%13OO%14=),9S]n0J5+:+A-'[F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/
7:^+SBl@l<%13OO+=\L++?;&.1ad>eF`V+:De:+r7nlfc-tm^EE-"&n05#-@Ch[?2DfTJD.3N5@
EZeq<FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF!(o!+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dA
DI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.1a$4EA0>i3BlA#7G%G]8Bl@m1+E(j78hLP[+<Ve!
:IH=HFDl22F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF!,17+Co1rFD5Z2@<-W9@VK^gEd8d8
C1_0rATM63+A*b:/hf*k$6UH6@ps6tEb/Zi+E)(,ATAo)G][M7A7]9oBl8$(B4Z+)+C]J8+DGF1
8g$,H0JjnrEbTW,F!,%=FCf?#ARlotDKKH&ATDi7FDi:0C1_0rATM5g$6UH6@rH4'Df0-(FE8RC
Ch.*t+A+#&+Ceht+Du*?Eb/Zi+Dbt6B4Z*+FD,6&/g+,,BlbD?ATDj+Df-\+A7Ta(@q]F`CNCV?
D]iG,F`_"B%144#+CJhuDdmcq+CT.u+CJ`!F(KH$+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+
De:,0AToeGCh+YtBl7@"Gp$X+FC?;+DBNJ(@ruF'DIIR"ATKI5$4R=b+<X`O;GKeY7lhc7D]j1A
B6%EkAKZ)5+EV:2F!,X;EcYr5DBNk0+A,Et+ED%7ATT&?Dfp(C8l%htD..L-ATAo*Bl%?'@X1!D
$4R=b+<VdL+<VeCDdd0!-YI".ATD3q05>E9-OgCl$6UH6+<VdL+AP6U+C\bhCNXS=H#IhG+CfP7
Eb0-1Cj@.DAS5^uFCfK(A0>Ds@ruF'DIIR"ATJu&DIal2BQ\D>8g%Y_GA[is+<VdL+<VdL-nui`
Bk(p$2'?gJ+=ANc+D,h<Blmo/C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;
C3(a3$6UH6+<VdL+:SZ#+<VdL+<Ve%67sC$ATMs%Ec`Er+CT.u+D#S%F(HJ9BOr;uBl%@%%144#
+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2IC#FCfJFBkh6-%144#+<VdL
+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[W8BkhN5%13OO+<VdL+<VdL:-pQU
Eb0'*@:UL&BOr<,AS5^uFCfK(A0>Ds@ruF'DIIR"ATJu5@<lR)B-:W)FCf?3Bl@l3%144#+<VdL
+<XEG/g,7S+CT/5+C]&&@<-W9Bl7F!D/`p*BjtdmBlnVCD.Rd0@:s.m%144#+<VdL+<YK=@:UK.
B4YslEa`c;C2[W1%144#+<VdL+<W?]3\W6B+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9
Eb/ltF*(u6/no'A-OgCl$6UH6+<VdL+AP6U+EVNEF`V+:Derr,-t6b"DfTD33A*!B.3N/8@ruF'
DIIR"ATJu>Dfm1HBl%T.BOQ'q+EVNEF(KG9FD,6&+:SZ#+<VdL+<Ve%67sBY76s=;:/"e5Bl5&%
DBNk6A7]d(G%G]8Bl@l3De:+a+CT.u+EV:.DBNt2B5)F/ATAo-DBMOo3A*!B%13OO+<VdL+<VdL
:-pQUF(KG9A8,OqBl@ltEd8d*76s=;:/"e5Bl5&%DBNk6A7]d(C(1Lm+<VdL+<VeFA0<7<Ch.'j
@rs(-$6UH6+<VdL+CoG4ATT%B;FNl>:JOSd-OgCl$6UH6+<VdL+AP6U+EV:.DBNY2+CQC1ATo7F
8g$,H0Jk:/+A*bsAS5^uFCfJ8%144#+<VdL+<Y]9B4N,4DerrpBk)644""N!06_)@Eb-nLDfp(R
A8,Oq055JT%13OO+<Ve%:K0bD+DGF1H#IgJ@<,p%Df0B:+DG_8ATD@'FCeu*Bl5&6F`))2DJ()%
F`MM6DKI!n3A*!B+CT.u+Dtb7ATA4e+<VeMATDj+Df0V=De:+a/g+;8FWb1&DBNJ4D/^VCDfp(C
A8,OqBl@ltEbT*++CT=6A9Da.+EM%5BlJ08+CT.u+ED%0Ddd/c$6UH6FD,6&+DG^9DIn$.Gp$U;
ART[lA0=Je3A*!B+Co1rFD5Z2@<-'nF"SS7BOr;Y:IH=B@;^3rC`m;6E,8rsDK?q6Dg*=GD]iS/
+EV:2Et&I!+<YB9+EV:.+=^?5Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q".Ni/=E+NotBm;6Q
%13OO+=\L++?;&.1ad>e@q]:gB4Z-,FDi:DBOr</F(HJ4Afu2/AKZ#)B6A$!EZeq<E,oN2F(oQ1
+Dbb$Eaa!6+CJ#5;FN?K+D,P4@qB0nF)Po,+:SZ#+<Y*'C3=T>D.RU,F!,RC+CK57F'pUC<GlM\
De*E%@q]:k@:OCjEcW@3Eb-A8F`MA2A0>f&Afu;3FD)e)Ed2_KAiLne?m'E/BlA#$$6UH6FDi:0
Ed2Y5+EM+&EarcoF"SS7BOr<-ATW$.DJ()5BQ&$0A0>>m+ED%7FDl22A0>;mFCfJ8?ugL5?m'K4
DK?q0F`\`t+EqaHCh*t^+<Ve8A9M[.AKYJrARfLiDJ()(DfQt1EbTW0@ps0r@rGmh/g+,9Ec,T/
B-;,)Aft)kBk)'lAKYhuGp$p;D/")78l%i&F!+n#Bl%L*Gp!P'+<VeKD]iS%@;I'1Bln#2F)Po,
+CoD#F_t]-FE8R6F`\`u-Z^D1DJ<U!A7Zm)F`;;<Ec`F;@<3Q"Cj0<5F!,F1Ecc#(Cb?/(+<Vd9
$6Uf@?o9'FA0<6I?m&lgC3=T>ARlp*D]j+>Ec`FEAS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=b
.NhW#B4Z<1ATDg0EcW?OATDg0EcW@;DBO%7AKZ#)B4Z<1AU&07ATMp,Df.!HDJs_A%144#+EVX4
E,]B!+CT.u+Cf4rEbT-"ARmhE-Rs=\Df028+ED^J+FPjbA8Z3+-RT?1+<Ve'EbTH4+A,Et+Eh=:
F(oQ1F!,:1F<GU8B4Z<1ATDg0EcW@9D]j.?+EV:.+EVO@+DbV4AS`K2Ea`o>%13OO,9nEU0eP.4
1,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf
?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuulC2[W8E+EQg%13OO+=\KV@!-O%A7Bgl
+Eq78+DG_'DfTl0@ruO4+D#e-Cis9&DJ()0@;TRs+EqOABHS[0-Qm,@+ED%7F_l/@/g(T1%144-
+<X'dEb/a&+CKPC?m%'S/g+PMI:+1.AS,XoBln'-DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8
E+EQg+<V+#+:SZ#.Nfj&A8--.@rH4$@;]Us+Co2-E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:
EcW@FD]iJ)Ci=M?@WHC2F(KA7E,T\<F`;CS%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;
+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$
FCei&E+*WpDdtFo@8pf?+C\c#ARlooDe!p,ASuTuFD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b
+<Ve2<HDklB-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=
DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl
6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-
GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9
Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et
+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().
Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J
2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'P
BHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\r
DIaktC2[WmF^eo7E,K;r@:Wn[A1e;u+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4Ysl
Ea`c;C2[W9C2[WnDdt/&%13OO+<VdL<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"
DIak^:IH=9Bl[cpFDl26ATKI5$4R=b.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l
+CT)&+EV:.+Co2,ARfh#EbT*+%144#+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCq
FE2))F`_>9DCI1\<+oue+EM76E,96#Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4
+C]J-Ch.6tB-9fB6m,oKA8c@,/g(T1%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8
@rc:&FE8R5A7T7^+EVNE@")U(DJ!Tq>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7
F(oQ1F"SRE$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^
Ch7$rALS&q%144-+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%
A8-."Df-\+ChsOf+<VdLE,8s#DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_A
Df-[i:IGX!+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0
Df0VK%144#+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne
@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#
F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*
F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8
+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[
3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?
+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j
/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs
+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(
G@b?'+>G!IDIakF2)Quq$4R=b.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdk
ATJu9D]iFB3$C=>?nMlq%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(
-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5
+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=
De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-
+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>
AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.
@W-1#F"%P*%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7Hp
DKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;t
F`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%
+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($
+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq
?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r
%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:
Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-
BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8i
DfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu
+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5
+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0
A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]n
Aor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD
9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKr
ATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"
F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#
<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A
%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&
DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp
=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk+<V+#+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);
?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$6UI1Ci=D<+<Z,AA7TUrF"_0H@;omo
@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4
EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:
@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e
$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL
+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&W+:SZ#+<VdL+<VeDBm=3"8T&'Q
Eb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL
+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HV,+:SZ#.Nh#"DIn#7DIIBn+CT.rCjC)9
F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ct
D/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@
F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ct
D/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82
BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6
+<VdL+=Lc<.6T^7A79Qh$6UH#$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<
F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et
+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%S+:SZ#+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pO
Eckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*
+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*
F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)
ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et
+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRg
DJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5
$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0
@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O
2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9
F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(
EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'
Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo
+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8
+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1
@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=G
AS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".
ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr
-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=
/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhE
F(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE
?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*
AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!
A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi
1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/
ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$
FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ
.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u
+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7
@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9
?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO
+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO
+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C
%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@
@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>Go
Bljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]4
0K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:Wqi
F!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-
/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+
@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW
3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;
Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C
/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%
8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF
+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+
F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=f
ARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeK
Bl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF
@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&
$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U
+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[
B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl
$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17
+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM
+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''
E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL
1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE
:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_
+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*
EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't
+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp
$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*
+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%
E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(
AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"
A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL
+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#
+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B4
5tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7
ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4t
ATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u
+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$
A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=
F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k
+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C
:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6
A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4
+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG
/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_
:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5
Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo
%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P
+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)
C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+
DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&
+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU
0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#
F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdk
ATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'P
BHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?
ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>
+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3
D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhK
ASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&uk
E+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m
6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"
AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5
G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&
A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-
+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(
ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9
FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1
/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u
+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL
%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+
$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s
$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u
3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&
ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+
BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]r
ARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G
%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#
+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:
BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#
+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:
E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7Zlt
F!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-
Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL
+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"
$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh
%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!
A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL
+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL
+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&
Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%
+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9
F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<
+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'
?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,+
+:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB
/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi
+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5
E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021
A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.
%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/
F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"
FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl
+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC
@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!
+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%
Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs
+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5
B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5Y
A0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&
+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>
A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E.
/iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_
?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$
AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8
FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3
A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55
F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5
DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;
+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4
DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M
$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'
DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A
+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))
+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0
Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-
6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.
+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&
@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&
F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM
?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#
?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6
%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i
+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf
76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22
A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6
BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!
ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*
D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(
FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6
De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0
+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,
AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL
+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3l
F`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$Hl
FCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,
ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-
F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'
?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8
ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W
9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*
ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm
3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.
+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#
Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%
0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-
FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1
A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275
DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+
9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(
F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3e
Ch4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W
-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\t
D/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6
Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc
+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4
ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!
Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>
A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#
+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO
+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"
DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7
DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<
ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po
+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#
D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%
+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u
+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^
<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7
F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H
@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t
2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:
Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.
G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-X
F_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(
Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq
+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sb
B4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp
$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@
@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTu
Df-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCC
DIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%ht
Ecl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j
9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%
+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@
D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6
@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+
@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3
Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrs
DBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km
+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(
@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"
@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:Wne
DBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.
+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)
@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8
+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB
7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!
ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl
+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:
@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO
+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9
F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=
F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(
F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(
A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1r
FD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-
+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LG
DfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9
?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T
%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJl
De!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::
0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1r
FD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0
Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm
2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb
+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLs
Bl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLs
Et&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&
0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,
ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>
A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b
.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LN
Bl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.R
Bkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,
+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9
Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-
+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u
+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5
@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e
$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2
%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL
+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ1
3XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1
FDl2FC2[W8BQS*-%16c_F*)>@H"q8.A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#
F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen52BXRo
A7]p,.!KBE.1HUn$6pc?+>GK&/i#:,6#^jYC`kPc+>PW+1E\)EE,oZ1B-9c`A8,OqD.RU,F!*n^
Bln'-DCH#%%144-+B3#c+E):2ATAo3Afu#2FD5Z2+Cf>#AKZ)'@VfUs+DG^9@;p0sDIdI++@Rn*
BOPrk$6UH6@V'+g+Cf(nDJ*Nk/g+,,AKYetEbAs(+EV%$Ch4_D1*C:P+Du+A+E)-?@3BW*DJ*cs
%144#+E1b%AKZ)5+DbUtG%De;E+*6f+D,P4+D,b<F`M%9@rGmhF"Rn/%144-+B*2qAKWIFDIdZq
F_t]-FCeu4+Cf>#ATJu-@<Q3)@V'+g+CSekARlp*D]j.1@VfTu0et?j$4R=b.Nh](AKYQ%FE2XL
AoD]4?t=4tATV<&BOPs)@V'+g+CSeqF`VY9A0>u4+EM47G9@>%+<VeKBOr<(ATo8)83p0F6rcrX
?m'DsEa`frFCfJF%13OO,9nEU0eP.41,C%)+A-'[F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/
7:^+SBl@l<%13OO+=\L$Df'H3DIm^-+>GVoBl5&$C3OT:A92-$DJs_ABQ%]tF!,R<AKXSf?o]Ak
0f38\F*VhKASiQ2FE2)5B.b<+BPDMs$6UH6BOu"!F!+(N6m-#O@;I'1Bln#2FD,5.@VK^gEd8dA
DI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.1ad>e@;]TuARTUqBk;;o$6UH68ge[&AU&<.DId<h
+E2@4@qg!uDf-\3DKKH&ATDiE%13OO+=\L$DfTl0@rri$@:FCf+Dl%7@:UKhEbBN3ASuT4/KetL
Cj@.F@;BFq+Cf(nEa`I"ATAo0BleB;/e&-s$6pc?+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*
-r4\o@rcL*+BDokBjkn$+@TgTFD5Z2.1HUn$6Uf@+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L
@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@+@KpaARfg)A7]@eDJ=3,Df-\+E,]B+A8-92@:Wn[
A1e;u%144-+<YN0@o$#V9PJBeGT^s6FD,_<@:Wn[A0>u4+Cf>-Anbn#Eaa'(Df-\=ARfgrDf.0:
$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W9
6>pdX+@TgTFD5Z2.1HUn$6UH@+AQKl+@0jQH>d[DE,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=
C1Ums+@KpRFD5Z2@<-WB>A/,#E-"&n06_Va/n&U*H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6
+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ
+Eq73F<G[D+EM[EE,Tc=%144#+<X9P6m-#OG%GK.E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#
+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%rCi^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\
@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$
6;:3C?k!GP$6UH@+AQKl+A-cqH$!V<+DbIq+E1k'+CSekARlok<HDklB1d)QCh\!&Eaa'$/oY?5
?nELBAS!!+BOr;sBl[cpFDl2F%13OO+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTC
E+EQkDdt.($4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgT
FD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>A7f3lD/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%
A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!+EVNE8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2
F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+Auce
ARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9ATT&9ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-
ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[A0<HHF(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL
+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP
+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinGEcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m
/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#
.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63(
$6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8i
DfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+
Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UE
A79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9o
FDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#
.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU
0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9
F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJF`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=
+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLs
Et&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2
Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#
.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-
AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3
D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8
%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT
$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#
.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E.
/ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!
ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0
DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0
C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1
+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH+
+Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N
.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]G
F(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+
Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgL
FCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAq
De(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-
+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1
+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F
/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq
5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,
+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucF
D..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC
+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo
8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6
AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5
@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<
+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cn
Dg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!E
AM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7
F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#
Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-Ya
EcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq
+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7
BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[X!Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49
A8Gt%ATD4$AKYo7ATDs.ATnRj-!YM&@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:
%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$
Et&I]BQ@ZrHY@MCE-"&n04f#RGA1i,E+NQo@4lJ=B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3
HYdD<ATD4$AUP\3De!p,ASuU2+Co2,ARfguGp$^>Df$V%BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj07A1>:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/
%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`
+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%
ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>HW>-$DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>
/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I16N+>]+J#D..7%
BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:
@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g7:<HDklB-:r-A8Gt%ATD4$AKXf;
7XZlu$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=
@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I16N+>]+J#D..7%BmO>"
$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG
C2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7g7:6ZmEiASuT48l%htD..=)@;L?E%144_F(96)E--/8
H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs
@s)X"DKIONA7f@j@kVS8A1hh3Apk*q+C&f&Ec#6$F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo
>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O
8Q/GO:..lF+<VdL+FSZB>]=+aATD?oHYI)%3`JXA;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55
@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,
BkCd`ATVL.I=#3oDfT]'CfG=gHY.2:D/!Tj@qBanGT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`
ATVL.I9dt#6Z6gYASuThDej]3DfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1
Amo1\+EqaEA93/.$=%7iE+O'+Bl7^5B6%s-BlncM>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\
>?l,UB4Z*pAp\6(@le7CE,961I9dt#6Z6gYASuThDej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i
%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk::2b/i@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+a
ATD?oHYI)%3b`27@qB^m@ruF'DLGe5>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%
Gp%0MEbTE(I16NgBR+Q.EboH-CO9c-@sr]/:2b/i@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+a
ATD?oHYI)%3b`29I9dt#6Z6gYASuThDej]3DfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16Ng
BR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3oDfT]'CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*Bj
Eb/j0BkCj9F(KH.De*ZuFCfK$FCfl++C%9PD/Ej%FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5
B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/
Ed)GBA930G>Y]3XD..6[Dej]BGAL]0AU%g-GAhM4F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?
DfTB0I9dt#6Z6gYASuThDej]BDKg,0E,]B!+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4
F!*P*-[0,EGB.,2+E_=5Gpe"L$=%7iE+O'+Bl7^5GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6
+<VdL+<VeTI9Trq@:s.lAS-:'An*lGDfTB)Blnc/+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,
+EqaEA0>]&F*&NQGq".N$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*j
FD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<
@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.EFD,5.8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>
+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHW
Cht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%
FEDVOC2[X!Blmp,@<?(/+CoD#F_t]-F<G19@:sFgDKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>
ASl.-AUP!p+<Xp'FCf;39jr'XA8c[0+D5_5F`8I>Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-
E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*AQW1[F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-
E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ$6UHrASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;
+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4Zm
Et&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@
+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+
B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(+<Y-6@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'
+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2DK@E>$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(Y
BOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/
%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq4FVa.INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB33
7WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(>\.e`HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0
$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=FEDkEDe*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!
Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#DKU1H@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0
DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm
$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/+F.mJ+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)
0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5
Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6
Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9
:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_DKBo.Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC
3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk
6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6
F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'DIIR"ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^
6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$Hl
FCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+
/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1+C'#"G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#
+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-
BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+@Vfsq+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,
Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2
BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]qDKK<3+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@8
1+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"
$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=9
0KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*mCh[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&X
DKK<3+@p3ZBP_BqBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;
BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,
CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1G
ASl-59PJT[Eaa'$+A,EtI4bs9#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#
+<VdL>]+J#D..7%BmO>"$4.gt>\.e`HY%);D.R`rFCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVO
C2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g%beDfp"O+A,Et%144#D..3k
F!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*
$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g8AT;j,Eb-@@B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p
+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+Dkq9+=CoBA8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?
%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-
+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi<ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sA
I16Ng:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*cs
H[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S
<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2A
ATMR'B5D.+I=2P3>Y]3XD..6[Dej]:Ci^_I>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2
Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[
I16NgBlmp'%144#:N0l_+EV:.+A,Et+Co1rFD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IK
Dfm1H@;^00FDi:4De!p,ASuTB%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1d
DL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!
>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<
Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3
Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"
%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!Blmp,@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkE
De*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)A7]9oCh[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8W
Bl89@ATD6gFD5T?%14C(Ci<`m+=CoBA8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^p
HW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)pe
CO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`
BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[
>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJ:f+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(
ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+GF)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.
De*ZuFCfK$FCd(Q%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U
+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*Zu
FCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG/g,@PDId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.O
D.PA8DeO#AFCf<.-QjO,67sBsBl8'<%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo
>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)pe
CO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7
Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6
FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/
I<9%;E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)
>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@
AM7e:BPoJFASlBkFCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>Y]3X
D..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAIWT.<E*RKr
G][qJDffQ3Bl7R"AUAiR+<VdL+<VdL+<VdL>XNFHD.RU,<,ZQ!:-pQU8g%YUAnc-oA0>K&Ch.*t
F+"K)>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf;3;e:%nDfBf4Df0!"+CTD7
BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkNATV[*A8Gt%ATD4$AUQ0?$=%%OB5)71;eTTMARp2u
$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MOEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[S4hFDYH(
>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]CO71FATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.
AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(oCghBuH[T@3FCSa&AR'=gG][qJDffQ3Bl7R"AUAiR
+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S@<H[*DfR7I.3N_DG]Y':DIal#Bl[cpFDl2FI16Ng
ASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XR)DBN2+AU&<=FF.Y@E,961
I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB+C'#"G]\%LHY7A<Ch\!>%144#B4Ysl
Eaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^@8pf?
IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g-
Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT[G&,p6H(DIe*;ATD6g
FD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHY7A<
Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"
AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/De*ZuFCfK$FCd(HAU#>G%16?ODIe)bBkM*qBkM+$
Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B<Jo+C%TK<+T0\FDi:3Df'H-Ch4`2BOr;uBl%@%
+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961/q"iO$4R=b+@.,kBOu!r+EM%5BlJ/:-sUk*G]\%L
HX^E*I3<HK+C'#"G]\%LHZNkK.3N>G+Eqj?FED)3+EVNEFD,5.>]aP%FEDVOF(KH.De*ZuFCfK$
FCfk0$6UI%Bl[cpFDl2F+EV:*F<GX<Dg-7FFD,5.F(K?6ASu!h+E(j7>YJR*AQW1[@rH4'Bl%4"
Bl@l3@rH4$@;]Us/e&.1+:SZ#+@^']ATJ:f+<YN0Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVO
E+EQs@<?(*I4QLGFCf]=FEDkSASbdsAU&VGDfQ9o+<Xp2AU&<=FF.hH@;K@oAU&VU+B`W*EZek*
DeW]m+EqO9C`m1u+Co1rFCB9&A0>?,+EV:.+E2@4F(K6!AKYo'%144#<GlM\De*E%@q]:k@:OCj
EcWiU7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+E2@4@;TIiAKYT!Ch4%_+<Xp2AU&<=FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U]KDBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U%16?ODIe**DKTf-Eaa'$
I16Mm$<1\MEb-A%Eb-A7Df'&.>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D
$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'W
Eb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-BOr<(F_tT!EZf:4+DG_(AU"Xk+<Y04CisT4F"SS7BOr;s
AS,@nCige6F!,R<Eb/f)@Wcc8FD,B0+DkP4+ED%7F_l.BBl5&:ATE&=Ci=3(+DtV)ATJu7F`))2
DJ'Cc+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h
3XlE*$=%%OB5)71G%G]'@<?4#I16Ng@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='
DIIBnI9d9h>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91
Ci=3(+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%L
HWO*2:eXGT8Q:*j+B3#c+Co%q@<HC.+DGm>0ek@)@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?
@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1
Eb/`lARo@_+EqOABHVD1AKZ&9EbTE(+C'#"G]\%LHWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr
6#:+QFB!0oHX(Z(G]\%LHTj&75(.i3%13OO>\S:kD'08p+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\<
@<iu0DI[U*Eb/a&Cj@.:BkM*qBkM+$+C&JpE+jTBEa`p+ARp33@W-L&A0=JeDJsZ8F!,R<@<<W%
Df0Z*Bl4@e+<YN8G]\(KATJu4Afu/:EbTE(F!+n/A0>f4BOu3,DffZ(EZfILE+O)C+B3#gF!+n-
F)N17Ders*+D,P4+Eqj7E,]B!+Du+8DJsZ8F!,R<@<;qc+<Y04DKK<$DBNb6DJ()'D.7'eA7]9o
F*)G:DJ+#C+B3#c+Eh=:@N\otAU&<=FF/.SCghEsG\1u?DfTB0I4QL^AS!!'@:s/#>]=+aATD?o
HYI)%3d#X_@<?(*Ao`*6Eb'6>/.Dq/+Ceht+C\n)F`V,)+EVNEB4YslEaa'$+C&JpE+jT@DKg,0
E,]B!I3;cg@8pf?>TdWsEZfFG@q[!/DfTB0+EV:*F<G(%DBND"+DkP)F^]*&Gp%<O@;p0sA0>;u
A0>T(F(KB6ARl5W+<YB9+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOC2[X!Blmp,@<?(/
/g+,6Gp$O:+EqB>D/!WrF<GXCD.Oi,@;^3rC`m;"Bln',B+51j+DGm>@;L-rH#k*GARf:mF('*7
+EqOABHUPR@8pf?/e&-s$=%.[A:%m*F_t]1@<?(/%16igA8kstD0%He:-pQ_C2[X%@<-4++EK+d
+Co%q@<HC.+Co1rFD5Z2@<-W9E+*cqD.Rg#EcWiB$;No?%15is/g+,,BlbD/Bl%?'BlbD>F(Jl)
FDi:CATT%;FD,5.+Co%q@<HC.+<Y3/@ruF'DIIR2+E1b0@;TRtATDi$$;No?+EV%$Ch4_3Bl5&8
BOr<'@<6O%EZet.Ch54A=(l/_+<Y)8+Dtb7+Co1rFD5Z2@<-W9BlbD,Eb/[$ARl5W:-pQUFD,5.
+E1b0@;TRtATDi7+DG^9FD,5.+DkP.FCfJ8Anc'm+CT;%+E_a:A0>u4+EML5@qfP#+<Yc>AISuA
67sC"@<,dnATVL(F!,(5EZed5E+*d/Bk):%@<*K$Bk)7!Df0!(GqL4=BOr;/G%G]'+=Lc>F(KGB
+Ceht%15is/g+V7+<VeLF(Jl)+EVNE+<YN>A8,Y$+<YW3Ea`frFCfJ8+EM+9FD5W*F!)SJBl5%9
+DG_(Bm+3$F^](q$;No?+Co1rFD5Z2@<-'nF"SRX9jr*bATAn9Anc'm+E1b0@;TRtATDi7@ps6t
Df0B:+C\n)@q]:gB4YTr@X/Ci:-pQUARoLsBl7Q+FD,B0+D,>(AKYE!A0>o(@rc-hFD5W*+EV:.
+DkP.FCfJ8Anc'm/e&._67r]S:-pQU<+ohcD..L-ATAo*Bl%?'@ps6t@V$[&ARfal@<?'k+EqOA
BHVD1AKYJkChu-A$;No?%15is/g+YEART[lD..L-?X[\fA7$HO9gM]W78dK$C2[Wi%15is/e&._
67sB^5uLHL:.I>f@;Ka&FD,5.+E1b0@;TRtATDi7@s)g4ASuU+Gp$p;F*(u(+CT;%+ED%5F_Pl-
A0>?,%15is/g,7LAKXT@6m-PrF*(u1/g*_t+F.mJ+ED%1Dg#\7@;^?5De:,6BOu$'8l%htGA1l0
+CfG#F(d0K=`8El$;No?+Ceht+<Y`6An>e(+CSek+CSekBln'-DII?(E+*cqD.Rg#EcW@4F`\`K
H#IgJ+CehtDJsV>F(&ZlCj?Hs:-pQUEb0*+G%De+F`MM6DKI"?@<,dnATVL(F"Rn/%15fq;cH1`
:dIuR;a!/a0H`D!0F\?u$;No?+B3#c+D,P4D..N/De:,6BPDN1E+*cqD.Rg#EZet.Ch4`'F#ja;
:-pQU+<VdLC2RHsAKX&W.!0`RALSa4ATM@%BlJ0.Df-[Z+Eh10F_)!h:-pQU%15is/g)8Z+<YE:
@;TQuBlbD*+Eh10Bk/>Y+DtV)AISuA67sB'+<VdTFEqh:.3N/4F(96)E-,f4DBNJ.@s)X"DKKqB
FD,5.E+*cqD.Rg#EZcqVFEqh:+DGm>Eb065Bl[cq%15is/g)8Z+<VdL+E).6Gp"LcBl8$(B4Z*4
+DGm>@s)g4ASuU+Gp$[CARfk)ARlp%FD,6++EVmJATJu<Bl%Sp$;No?+<VdL+<VdL@V$[$@<6L$
A0><%+Cf(nEa`I"ATAo0BleB;+=M;BAKYN&FCAWpALT5@$;No?+<VdL+Eh10F_)\0F!+n/+D#e/
@s)m%@VfTu8g%\iE,oN2F(oQ1+EV:*F<GOCDe+!#ATJu&+Eh10F_)!h%15C"6V0j/2'="a+?L\o
.qrmCAS5Rp.3NhJASrVF+E_a:+CT>$Bk]Oa+DG^9A9Da.F!)kb+E)9C0e"4f+<VdL+<VdL+<W`g
0d%SJ$:@Tc=[k\E<)6C74!5q%Bl8$(B4Z*4+Cf>,E,TW*DKKqB@rH=#ARlotDBNk8AKYf-Df?h<
@<6K4-o!i04>J`I.3K`U+?L]#0JEqC6r-0M9gqfV6qKaF+?L\o.qrmCAS5Rp.3NhJASrVF+Co1r
FD5Z2@<-W9A8bt#D.RU,+DGm>E-67F-nlc^EZd(c+<VdL4!66e$:IZW<D>nW<*)XZ<(J,n+=JaS
DKKH&ATB4BGA1T0BHV5*+DQ%?FD5?$ARlooDe!p,ASuT4FCf]=+=K!!4F'%E2)Qg*+?L](0b"IX
<D?:Z5snUI;BS%D-nB"LFCf)rE[`,L@VTIaFE8R8F_u)/A0>T(+E)./+Dbt7E$0+.F)rHP0g'_D
1,L[6+<VdL+<Vdg+>kh^$:dNa7R9C@:Jr;X4!5q%Bl8$(B4Z*4+EqaEA9/l6ATVs,AThWq+DG^9
Df0,/Ci=62+E1b1F!)kc0KaVC1,(OE.3K`U+?L]$2)#IH:fUIa5snUI;BR)D+=JaSDKKH&ATB4B
GAhM4F!,OGDfTE"+DG^9Df0,/Ci=62+E1b1F!)kc0KaVC1,(OE.3K`U+<VdL4!6730F\@e78uQE
:-hB=+<W`g-nB"LFCf)rE[`,TBOu'(0d(RPD.Rd1@;Tt)+CT;%+ELt7ARlotDBNJ4D/aP=-nlc^
EZd(c+<Vdg+>F<483p0F6rcrX+<Vdg+=JaSDKKH&ATB4BGA(Q*+>G!I+D>2)BHV#1+E2@4AncL$
A0>u4+CoV3E-!-M0Hb:S+>G;f+<VdL4!66e$4R>;67sBY:JXqZ:J=/F;BT[p+D#D/FEo!<Gp$X/
AmoguF=n\-Aftf0+DGm>F(KG9FDi:1+=LuD@<?03+A*bdDf00$B6A6+A0;<g:-pQUAoDKrATAnk
:JXqZ:J=/F;BTn$ATDg*A7]g)A8,OqBl@ltEd8dDDe!3tBl@m1+D,P4+=M)CF"&5EASu("@<?'k
+EM%5BlJ08+:SZU:JXqZ:J=/F;BS%D-t?q!Ea`I"ATB4BEb/cqEb/a&F!)lJCi_$JF(96)E--.D
FDi9o+D,P.A7]d(4!4t>%15is/g,7]E+rfjC`mV6DIm[(FEo!MATW$.DJ'Cc:-pQU;GU(f7Sc]G
78b6i+=L`5@<,ddFCfJA+ED%(Bl[cpFE8QQD/=8B+EM%5BlJ08+EVNE8g%_aCh.*t+?L]pF`V,7
05>E9Ec5l<+:SYe$;No?+@0mj+CSekARlp&@<,dnATVL(F!+n3AKZ&9DfTE"+DG^9FD,5.D..L-
ATAo*Bl%?'GA(Q*%15is/g+YEART[lA0>;uA0>DsF*)G:@Wcd(A0>u4+A,Et+Co2,ARfh#Ed8dG
@VTIaFE9&W+:SYe$;No?+BLj,:.\2N3ZrW[ASrW$AS,XoBl7Q+8g%\iE,oN2F(oQ1F!+q'+Cei#
AS-($+CS_tF`\aJBOr;J+Cf(nEa`I"ATAn&$;No?+EV:.+A,Et+Cf>#AKWC3E-,MtCh5%<FD,*)
+E1b0F(KD8FD,B0+EMXFBl7Q+BlbD;F_#3'ASuTuEd98H$4R>;67sBJ:Jb1l8Ol<N+?L\o@q]:k
@:OCjE[`+m+@0g[+ED1/BQS;<Eb0<'Ecu#)%15is/g*kk:dIuF9gr#M;BS%D-nB"LFCf)rE[`,Q
BOr;pDKC#5EZdFd1boLI.1HUn$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%htA8,Oq
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
.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX76sX>4ZX]I0Hb]b4$"a&Df'&.
GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+=Lr=De(:>ATDg0E\APPATMp$
B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9
F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY
91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,F`MM6
DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.
+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm
+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!/g+n>
ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1
B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsH
C1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4F!,@=
F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(C
C1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6
+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#+:SZQ
67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6Y
G[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?
@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXT
D@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)E-)Nr
F([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFuEcPMq
C2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGH
Ec6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P
3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;
DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+EV%7FDku6B6bV@Bl%?uFDQ4F
/KetSFDuAEF!,C=Cj@.7G]7J5@qg%1+Cf>#ARl5WEcF6'+>G3`FE@s!%15is/g,1WDBNe)@rcK1
F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4
F<G7.CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.G
E,KJ7><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/
A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]7
67sBnEc6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)
+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I
$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*
C`msFHS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=
D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47
Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:
G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZk
F)sK*+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V
+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL
+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s
.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn
$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL
:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6
-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeW
CgUUcDe*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:
@rH4$ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaE
A0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$I"4Y@jtAThu7
-RU$ID_</Q+ED%8F`M@P+D#G$/e&.9E\&ha.3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4l//q#?m
%14Nn$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&
4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A
+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9
;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9
E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(
FCSumEcXB)><3le+Z_P)-S$\t.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&u
DKB`4AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo
0ek+$?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4
E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@
1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee7
5U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`
?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG
+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj
1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u
+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQU
GB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(
+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p
+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs
.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E
3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=rF!+n/A0><%
F)PQ&@<?''@rGmh%173!4ZZjk4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@
3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(
GA[isD/h^">p)3O1GC"[+?L]YF<D\K:-pQU.P>d^C^g_gGWe)n+?L]$1*U'J4!80X+<Ve%67sB1
/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,
-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z
+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.
+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2
.6qWi%13OO:-pQUCi<`m+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>V0E+*j%%16ih4ZX]i3Zp+"
3\V[\3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MAS
Bl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO
:-pQUGA(Q.AKYDu+A!\uF(Jl)@X0);Df'&.D.-ppDf[%E@;L'tF!)iSDfTV@+E)9C-YRF8AL@oo
:-pQU=%GbX76sX>4ZX]5GAhM;-OgCl$;No?+CoV3E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9
@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?
E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX
:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=
0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUu
F`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+EM+9+CQC3Eb/ioEcP`%
+E1b,A8bs#Df-\>BPDN1D.-pfBl7K)/Kf1WARlomGp"MMDe*ZuFCfK$FCcm1$;No?+Abs)7R^3Q
779s<:..lF4ZX]56TSIPF(KB5>\@VcEbT#9F`V,7>X<=J6t(1G>YK'G@;K1F@;]Uo@pEt]DIdZq
-OgCl$;No?+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"
EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9
Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc
$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(
CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCB
B-;>=Bl%i<+BosE+E(d5-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1
D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc
@ruF'DIIR2-OgD`78d&U:JO&6-S[5./heD"+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*
5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP
8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCpt
F=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"
AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[
%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8A7KakAM.q>
B+52_De*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;
De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm
@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN
78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki)
:L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6
/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172q
DesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^
+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c
+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i
:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%
DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB
8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%ht
Cggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*
+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=
+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,
@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>
FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ#+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De(M1Ci<c9D..L-ATBG=De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Ado(r%16r\DJ<]oF*)/8
A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,
ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68
$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dk
ATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eqCh.6tB1brf6"FME
DK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1F^oN-
Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH
7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5%17&bAn5gi03*(-
DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$/oY?5%14Nn
$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lG
De(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'
+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=G
D]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dE
IUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3
F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o
@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*
$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'k
CbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U
<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP150H_qiA7]p3
%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB
%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*Bi
FtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z
-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-
A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[Wn
ATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19
F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-
DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,
B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@lt
EbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1
De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%ht
Eb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'n
F!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU
@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<
AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0
Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%
7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'
Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[J
F(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7
B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8
A1_b/B4W_*$7QDkD0]l7A8lR-Anc'm1,2Nj/h1^`C2[X%Ec5Q(Ch4`1/M/)^Gp#^T6m-#S@ruF'
DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)
FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4
+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*
+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't
@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6
Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3
FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.
AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*
F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"
ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4
GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7
AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?
+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;
67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0
+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3
>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0
GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9
DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!
+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ
:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht
@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"
F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU
:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm
-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha
9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_
AU%c1-OgCl$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/
F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>
FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;
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
67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<
A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)
Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`
F:AQd$;No?+EDUB+EV19F<GX=Ch7L+Cj@-T+E).6Gp%$JFDuAEF!,[?@<<W7F(KA7F(KH7%17,q
4ZX]?-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=
E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplL
BP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&
E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`
:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5
FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrK
ATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZ
A8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5
+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#
Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE
+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%
ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e
@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mn
AhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KP
ASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFVi
ATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ
67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6
-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$
3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8
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
Anbn#Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(
ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*
+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp6
3ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDa84?EF5tsp63Zoe`Df'&5%13OO:-pQUA9Da.+CoM,
G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`
6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:
F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j
5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlom
Gp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:
%13OO:-pQUF(KG9@3BN0AS,LoEb/c(E+*WpDdso.DBO%7BlbD6@:NtbDIjqB+E_a:A0>?,+=LuC
A8Gt%ATD4$ALS&q:-pQU:f9_O78d#P6r60E6r-053Zoe;3a>[+ATDisB4Yt$Bk&c<F(KAs6#^d2
@<>p_9Q+ELCg9eFDIdZq>]=+hA8bs*%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,
+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=H
ATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(
DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/
F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<
F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6
+Bot,A0<7:AT0">>9G^EDe't<-OgCl$3                                          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3AVd42'=Xs0f:(/3$9t1+>Yer1,C%.0d&2/+>Pht0f1"31a"M-+>u2%0ea_*3$9q3+>Ynu1,0n,
2BXt%1-$I30H`,++>GSn1-$I33?U+:+>Get1Gp:01*A>08l%iA<CokP84c`Z:Jt>9ARf:hF<F1O
6m,r]Bl%<&BPDO0DfU+GCi<rY:IJ/X:J=\R<CokP84c`Z:Jt>9ARf:hF<F1O6rZrX9N*'CF_PZ&
+D>J1FDl2F+Dbt/8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhn:F_;h5DeC2$DIal1ATMg/DKBB1:et"h
?YXLiCh\!&Eaa'$C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfSfQ6r./^:IITH6XO\@F)Q2A@q?cp
DfRl]BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs2@Vfsl05Y-=FCfJG<)5nX?V4*^
6r-0&D.HUA6r./^:IJQ,A92[3EarZ'AoD]N+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1qD.DdkA:@<6O%E\CBf6r./^:IHgPA8#[uFDl2FC2[WqASu("@;IT3De'tB+Cf(nDJ*N'BPDO0
DfU,:BleB7Ed;D<A7TUgB4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2FC2[X!Blmp,
@<?'fDg#i+G@,H'G\V/-Ch\!&Eaa'$+E)F7Ecu/.G9BRf<+T0HDe*fqEc#l.AS,@nCige1Bk)7!
Df0!(Gp%'7Ea`frFCfK6C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>Anc'mD..<rAn?%*C2[X%
@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU/@:O._DBNe)DJ<]o
F*&O:DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AT2'fD..<)D..<rAn?%*+D,P4
+A,Et;bpCk6U`,+A7TUrD0]l7A8lR-Anc'm9mIjR:IH=9Bk)7!Df0!(Gp%'HDe<^"AH       ~>
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
zz=:zz,' OK003 OK004 OK005 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCH'
zz=:zz,'RS PATHDEL PATHSHOWDEL PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE S'
zz=:zz,'YMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML ZIG abv afterstr alltrim'
zz=:zz,' badappend badblia badbu badcl badfl badil badjr badlocn badobj bad'
zz=:zz,'rc badreps badsts badunique beforestr bget binverchk bnl boxopen ca'
zz=:zz,'trefs cd changestr checknames checknttab checknttab2 checknttab3 ch'
zz=:zz,'khashdmp createjod createmast ctl datefrnum dblquote decomm defzfac'
zz=:zz,'e del destroyjod did didnum dnl dpset dptable empdnl fex firstone f'
zz=:zz,'od fopix gdeps get globals globs grp gsmakeq guids guidsx host host'
zz=:zz,'sep isempty islocref jappend jcr jcreate jderr jdmasterr jnfrblcl j'
zz=:zz,'odsystempath jpathsep jread jreplace justdrv justpath jvn lfcrtrim '
zz=:zz,'locsfx make makedir markmast mnl mubmark nc newd nlargs now nowfd o'
zz=:zz,'bidfile od ok packd plt put quote read readnoun readobid regd remas'
zz=:zz,'t restd rv rxs rxsget rxssearch saveobid second sha256 tc trimnl ts'
zz=:zz,'lash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '' jodl'
zz=:zz,'iterate ALERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJODHEADER BEGINJOD'
zz=:zz,'POSTP BEGINNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDINDEX ENDJODHEADE'
zz=:zz,'R ENDJODPOSTP ENDNOTJ FAKETOKENS HINTPFX HINTWORDSPFX HYPERLINKPFX '
zz=:zz,'IFACEWORDSPFX IFACEWORDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLBU'
zz=:zz,'ILDTEXunix JLBUILDTEXwin JLCLEANTEX JLCLEANTEXunix JLCLEANTEXwin JL'
zz=:zz,'CODEFILE JLDEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JLHINTWORDTEXBEG '
zz=:zz,'JLHINTWORDTEXEND JLINSERTIFACEMD JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWT'
zz=:zz,'EX JLSHELLEXT JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLiteratePreamb'
zz=:zz,'le LATEXTMP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNHEAD MARKDOWNTAI'
zz=:zz,'L MARKDOWNTMP NORMALTOKPFX PANDOCTOKPAT ROOTWORDSjodliterate STRING'
zz=:zz,'TTOKPFX TEXTQUOTESINGLE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAP'
zz=:zz,'LIMIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenst'
zz=:zz,'rs boxopen changestr charsub ctl cutnestidx cutpatidx dbquote dbquo'
zz=:zz,'teuq fboxname ferase fexist firstones formifacetex formtexindexes f'
zz=:zz,'size fuserows gbodylatex gheadlatex gpostlatex grouplatex grplit if'
zz=:zz,'acemarkd ifacesection ifacewords ifc indexgrouptex indexwraplatex j'
zz=:zz,'odliterateVMD jpathsep jtokenize latexfrmarkd long0d0latex markdfrg'
zz=:zz,'head markdfrgpost markdfrgroup markdfrwords markdj markgassign mark'
zz=:zz,'gnonj patpartstr ppcodelatex read replacetoks rtrim sethintblock se'
zz=:zz,'tifacelinks setifacesummary setifacetargs setjodliterate seturlsha2'
zz=:zz,'56 srxm tlf toJ tslash2 utf8 uwlatexfrwords wfl winpathsep wordlate'
zz=:zz,'x wordlit wrapQtlatex wraplix wraprgidx wrapvrblong writeas''),<<;._'
zz=:zz,'1 '' jodmake DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 D'
zz=:zz,'UMPMSG5 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR'
zz=:zz,'0156 ERR0157 ERR0158 ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXP'
zz=:zz,'PFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLE'
zz=:zz,'AR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clears'
zz=:zz,'o clfrbtcl createmk ddefescmask dec85 dumpdictdoc dumpdoc dumpgs du'
zz=:zz,'mpheader dumpntstamps dumptext dumptm dumptrailer dumpwords extscop'
zz=:zz,'es fap fmtdumptext fromascii85 getallts getascii85 halfbits htclip '
zz=:zz,'jnb jscript jscriptdefs makedump makegs masknb namecats nlfrrle nou'
zz=:zz,'nlrep opaqnames parsecode prefixdumphash putallts rlefrnl sexpin so'
zz=:zz,'nl tabit toascii85 uqtsingle wraplinear wrdglobals writeijs wttext'''
zz=:4623{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^72+>P&q+>Yc-2'=V.+>GZ11GU(3+>Gc.12:`<:-pQU.V`m4+CcuT+DkP$DBMPI6m-#S@ruF'
DIIR2+Cf4rF)rrC$;No?%15is/g*GrC`mY<BOu3,A8,OqBl@ltEd8d;CghC+ATJu&Eb-A)G][M7
F(oQ1F!,C5+EV:.+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig+CT)&+E_a:+EMX5DId0rA0>B#
DKBo.DKKqB@;]TuG%G]'F!,")Anc-oA0>T(+EV:2F!+t/@<6KB%15is/e&._67sBJEb/[$Bl7Q+
@3A0<6m-DWC1Ums+Co%qBl7L'+CQB@BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?+@Kd^FE2;F
Bl7Q+@3A0<6m-DWC1Ums+D#S%F(KD8FD,5.-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is/e&._
67sBJDf0Z*Bl7uQ+Co1rFD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<@;^1./0JYEFCfK)@:NjkG%G]'
Et&IO67r]S:-pQU8T&W]Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$@:F%a+C]U=BkhQs+Dbt+@;KL(
%15is/g)8Z@:FC&+<VdL@;Ka&@UWb^F`8IHATDj+Df-\8@;TRs+:SZQ67sB'+C\tpF<D\K+D58-
+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+C\bhCNXS=
DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]RgFCcS=DfTB0/0K%GF*)IS
+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/@ruF'DIIR2+DG@tDKKT)
Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o
:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g)8ZB4PRmF!)SJCh[s4
+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>ATT&=DfTB0/0K%GF*)IS
+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5Ddmc1+<YlHEb$;$DIal3
ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07ART[l+CT.u+E;O8Ed8d?
Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt@rc:&FE8R5DIal#@<>pe
@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2
FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTA
ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+
%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1r
FD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?
+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J
+<VdL+ED%+F_kK,+D#e:Eb0<5Bl@l3F(Jd#@qZ;Y:-pQU+<YfJATJt:+<YlHEb'56F`V,)+C]U=
GAhM4F!+n/A0>u*F*)I4$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtB8l%ht
ATDg0EcW?W0JG(41cZuo$4R>PDe!TlF)rHH-Xgb.A1%fn@rH(!F(KB6+=Cl<De(4)$4R>;67sC&
@<63,@:WneDBNb6@:Wq[+D,>.F*&O:DfQsm+?;&.0d$o4Eb065Bl[c--Yd7-Ch7Z1Eb/lpGUFUV
%13OO:-pQ_A7]^kDId<rFE8RL/M/)hDfTB0+Co%qBl7Km+DG^9FD,B0+EM+(FD5Z2+D>2,AKZ#)
CghEsA0>DoAnc-sFD5Z2Et&Hc$;No?+D>\7F<GXDARfFdBk&93+Dbt+@;KKtDJsZ8F!,O8F<G+:
EbTE(+A*bqEc5Q(Ch4`*Ddd0jDJ'Cc:-pQU-n6Z/3Zq!`=%Q.0<DGhS73G/k8P`7o$4R>;67sBs
Bl7K)An>Oa/0JG2EcPl&B4W3+ATW'8DCcoP@:C?fDIal+Bl7K)ASu%"%15cu4ZY;OHXSN9$:@]S
3\`F;@4hur<'`i63]VOq/e&.T;G9PC3^Zdr9L]Hu%15is/g,">@rcK1F(96)E-*4@E-,f4DBNG-
A7]g)/Kf.R+CSek+Dl%;AKYDlA0>;'DIn#7DdmHm@rri'De*Dg$;No?+CT.u+Dl%-BkDW5FD,5.
AoDL%Dg,o5B-:_rAnc-sFD5Z2+E(j79gM-E:K1In71BSr;aXGS:fKS=1,04F9L2WH=?S]#1(=R]
<)$%L3\iK#$<U"r4ZY>T%16''=B%FE1,TLJ6<R8V4ZY>V%15fq;G0DR=&(n>1,fXL<E)FI4ZY>X
%15p7<(Ke[4ZY>Y%16$29KbEm0F\@];bp.O3\rK"$;"&s:-q*)1GTCH9LV6B4ZYAT%16917m/mh
1^sd$$;No?+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?
/6#&?<%L@=<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\/4iZ@:-pL*76s[">"M3n$4R>;
67sC!@VTIaF<G(3A7]fk$<L#$6p3Rb%16'';cGn@0b"I[;GU:h4ZY>-$<'qr<(/r21CX[c5snOG
4ZYD/$4R>;67sBkBk)7!Df0!(Gp%0>Ch=f1AS,LoASu!h%15Kp6W?WQ:-hc\4ZYG0$4R>;67sC!
@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF#kFF:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/:I7ZB
6W?fJ4ZZY?;FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRX?$;No?+C\bi+E(_(ARfg)@rGmh/0JJ7
E+NotF#kF>6:s[6<),di$=[FSDdmHE3a4Wf/M8/M3Zon)0-FI[+=nX@+D!/J:I7ZB6W?fJ,$tcd
%15is/g,+AFD)e-ASc'tBlmp,+Cf(nEa`I"ATAn?+E1b2BHV8:DI[d2@<?4%DBNG&@<,ddFCfK6
%15ot<(KDG9KbEZ8OccQ:*=m+-SJ^P%15ot<(KAI;H#_>-QkH&/LN)G5u^BC78+-t%15is/g,+A
FD)e?ATD7$+>"^ID.7'e+>6tB@q]:kF!,")E+NotBl7Q+Df-\2Df^"C:K%]0BQ%s6F(K;R3ZohB
7TW/VHRCIO-RgAj-n%YV=%Q/6-X8;P.3M275WV%N>q(1N%13OO:-pQUAU&<;@:OD#+E).6Gp%3B
AKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRs%16imF*)A0FD*fu><3mT3Zq]N,CUa`><3lY
/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[/g*tV<(KDG9I;n3$4R>;67sBkAS,@nCige:@<6O%
EZf=ADe<^"AKZ,:ATAo0De!3tBl@m1%15is/g+nIA93$;FCf<.@<?0*BlbD5AS-$,B5DKq@;I'"
ATD?)@<3Q5BPDMs$;No?+Eh=:@N]B++Co%qBl7Km+DG^9C2[X$DD#X<Et&IK9gM]W78c90C2[X(
H#n(=D/`p*BHS[;D..L-ATB.-$;+)^:f:(Y4Z[=rA93$;FCf<.@<?0*-YdR1E,ol/Bl%?5Bkh]:
%15^'6rd/S;E['UDe*p7F*(u1E+*j%+=CoBA9Ds)Eas$*Anbm1Bkh]:%13OO:-pQ_ASu$hAT23u
A7]Y#Et&IkDe*ZuFCfK$FCe36/h1USA8Gt%ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&Eaa'$+EMID
EarZ'@rGmh+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6g
FD5SQ+EM+*+EV:.+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!+n/A0>N!FD,f++D,>(ATJ:f:-pQB$;No?
+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&
Eaa'$/S]370+A7`67sBoFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@8
1+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(U3$;No?+D>k=E-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$
/oY?5%15is/g+hLFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9
Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIO%^:-pQB$;No?+DG_8ATDBk@q?d,DfTA:
F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9984c`V5u'gD6QdKo+<W6YAp%p++E1b,
A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%%15is/g)9KDfT]/Amo1\FCf\>
+<W6YAoD^,@<?Q5BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?
+<Y<;E,961+<VdL+<VdL+>"^Q@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$;No?+<YB1@:NkiARfgr
Df-[?+>"^MDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+<YB1@ium:+<VdL+<VdL
+>"^JDfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=%15is/g)9XATV[*A8Gt%ATD4$AKWQIE,oN/
@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA
67sB'Fa%Y1FCf]/Ed)GBA9/kF+E_RGEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6
Eb'564$"a5AKZ2;@;m?3B5Di@%15is/g)9\DfTB)BlkI?+<VdL+<W6YD..3k+DbJ.AU#>0Ec5e;
GAhM4+Dbb5F<DuW.1HVZ67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JP>$@rsCZ%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l(De!lC1E\)j.3N8DE,961
+CT;'F_t]-F<G"&A7]9oFDi:CF`;;?ATMo8Ec5l<+EV1>+E)F7Ed)P<FCfM&$;No?+>GWi@rsC]
+D5_5F`8Hp7R9C1=&2^^;eL,hF`;5,D.Oi'H#R>8Ch[d&ARl5W:-pQU0f!ZWF>,QpEb03+@:NkZ
+?MV,E+*d.Bl7Q+GA2/4+=MGGCagJY+D>2$A8Ggu+C\bi+DN$/De*Dg$;No?+>GWi@rsCa+CSek
ARlopEcQ)=+D>2$A8GstB-8cKEb03+@:NkZ+=MGSBlmo8+EqOABHS^IEbTW,@<3k,$;No?+>GWi
@rsF[+CSeqF`VY9A0=QS<+T/SE,oMuD.7<m+>"^GBOPdkBl7Q+D/X<1AoDR/Et&IO67sB812gZE
0esk[A7T7^+=M;?FDkr+DK@6L/Kf1WAS-($+D,P4+CT.rCjC>@DJ()%De*E%FCf]=%15is/g)l(
De!lD2]uO>A7]9o.!K]?E-?82Ci=3(.3L2bCi=3(+EMIDEarZ'Ch[cuF!,@=G9D*M@;p0sA.8l@
67sB81Lt',1-$IcA7T7^+EVNE-u*1#CNCpI7qm'9F^cJ6AT2R/Bln96Gmt*U67sB90Pt6D0K1+_
A867.FCeu*GAhM4+D,P4D..O#Df-[GG@kY?+D,P4+A*b:/hf!h$;No?+>PWf@<jOd+E_X6@<?'k
+D,P4+CfP7Eb0-1+=M2;DIdZq.3NeFEcYr5DK?6o:-pQU1,*HcDD4!l@:Wn[A0<:4DfT]/Amo1\
FCf\G+EVNEBl8$(Eb8`iAKZ28Eb'5#$;No?+>PWgDg!fh+CSekARlorEa`p#Bk)3,@;]TuBl7Es
F`V88DK?qAF^elqEb/a&DfU+GFDi:@Eb/Zr@VfTb$;No?+>PWgDg!fh+C&AeB5)71A8bt#D.RU,
I3<BFG%G2,FDi:BDf9_?Anc'm+D,P4+A[/lE_L%QAhIS3D%-hI67sB90Q(fP0Jjn#F(KH.De*Zu
FCfK$FCcmD@r,^bDImi2F(96)E-*WR@<H[*DfR7I.4cTQD..-p+CSekARl5W:-pQU1,*TaFtk`p
-ua-8De*Eq@<?(*.3N&0A7]9oFDi:1A867.F<G(3Ci=?.DJ()1Afu;<@;p0sA0>]&DImku$;No?
+>PW]ARdDK+=MAVCghEsG\1u?DfTB0.3N&0A7]9o%15is/g)o(A7]7+0d%l:9LDKB5u(BJ=ESLq
GUst09L;`N9LMiK=ESLqGUst09N+JN9M@lW<%/quA7T7^%15is/g)o)@<H3:3$9VjATVU"DKK?(
De!Q3+CSekARlp*D]gH@Ec>i/F=@Y+%16T`@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDmDeX*1ATDl8
-Y[=6A1%fn%15is/h1CCE+NotASuU2%15is/g+\9@r,RoARlorCi<ckC`mD&Eb-A8D]iJ3DeW`)
@rH6sF`V87B-9lV<+T/SDIIBnF!,[@FD)dh+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_78u]X+A,='
<_5_]<(0n38k_QO8PDNO79C[)9LhuW9M&2_79C[)9NP"f6qg0O<(0n3%15is/g)Pl.6T^78l%iK
Blmp,@<?'WEb/Zr@VfTu8k_TG76s[J79C[)9N+JN9M@lW<$4e,6<-TN6rZTWF`(o<%15is/g)Pl
.6T^78k_TG76s[J79F\MBm:am9L;`N9LMiK=EeIs+A,<p9LV6B<(0o5Bl5%&$4R>;67sBYDeEX%
+@pWh-Z^DSDfTA2AoD^,@<?4%DBO"B@<?''D.-pfBl7K)/Kf+KD/!g#@<*K4D]h,&+C]J8%15is
/g,+AEcYf5+EV1>F<GdAFD)dj7WU+'Eb0?$Bl7u7GA(]4ATMg!@q?ckDIal'@;]UlATJu4E+No0
EHQ2AATKI5$;No?%15is/g,=KEaiI!Bl,mRDJsW.+Co1uAn?!oDI[5e$;No?%15is/g)8Z+EqF6
-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO:-pQU+<Vdg3[ZF2+DEGN1,C%1/0H;f:JaJT+Al-7
<(//D$4R>;67sBoBk1ctF(96)E-*4=De!3lF!)VS.OdM5+Dk_,+EM.2+:SZpAo'U_+>Pf4,VU>`
+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g+7=DffZ(EX`@mAo'U_+>Fu]-oihe/nlpc+=AT\+<VdL
+<VdLI;NS4+<XEG/g+(8GA(]4ATMg!@q?c2F)YPtAKYE!A0>Q(EbTi<DKK<'+EV%$.1HW$Ao'U_
+>P&^-nHcT/nlpc6"),i.kbTh1,^R(I;NS4+<XEG/g*G&5qQ7_@4cdJAU%^$F_#3(B-9ql64F9=
Ao'U_+>Y,_-t+`B/gjCA.3K`U+<VdL+<VdLI;NS4+<XEG/g*n3FD,5.Ch7^1ATAng%16raCcsBn
1a!nh@4l7H-UK10+<VdL+<VdL+<VeTD.[T,+AP6U+@72mBOr<&ATW$*EZd[X$>jBk4Y@j7+<W(@
/nlpc0JP==1c70M3&t=n.3O%UAo&S4:-pQU3?VjHB5)I/+CT.u+C>QbD.[TI/g*%p+=LYNBeCbc
-Rg/\+<VdL+<VdL+FS*=C`jiq67sBK+>+*1D.[TI/g*(q+=LYNBeCbo-Rg/\+<VdL+<VdL+FS*=
C`jiq67sBJ+?Br=D.[TI/g*+r+=LYNBeCb\-RU>c+<VdL+<VdL+FS*=C`jiq67sBX+E;OBFCbmg
D.[TI/g*.s+=Js#.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBJ;@NtMAo'U_+>GPm-o!D)+<VdL
+<VdL+<VdL+<VdLI;NS4+<XEG/g*hW%13OOF(T5O/g+LV?!JR.+FPjd/it[m1*@u!+?CW!.1HV3
+BTa/+<Ve*+<VdL5p.9m+AO%%+<Wun+<Vde+<VdL6m*Tp+@@7o+<XN(+<Vdo;BR))+<X?I+<W%;
0F\@30d&1n+>GVo0d%So+>Fu]1E\Cp+>P&o+<WQb0d%Sn+>Fu]0d&1n+?(Dt+<WBm+>Fu]+>Fun
+<Ve%67sB7+<YB9Bln&tC^g^o0d&4o+>GVo1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>=o\0d&.m
+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8+<YTEBOu2n$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jn+>=o\
1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>P&^@;Km9DKTe*$6V&G1*@\o1*A=p
+>P&n+<WE^0H_Jp+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>Y,_:(7OQ
0d&4o+>GVo1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jq+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%
67sB;+<XEG%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WB]0H_Jm+>=o\3?U!u+>GPm
1*@\^0d&4o+<XEG/g*"o+AP6U%1444+>b2`0f'q++<WQb0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jm
+>=o\2]sq"+>GPm1*@\^0d&4o+<XEG/g*%p+Du==%144:+>=o\+?(Ds+<WTc0H_Js+>=o\2]sds
+?(Ds+<WTc0H_Js+>=o\3$9mt+>GPm1*@\^0d&4o+<XEG/g*(q+=@U*+>Fuo+<WBn+>P&^1*A=p
+>Y,q+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc0H_Jm0H`+n+<WB]1*@\^:-pQU3$9=k-OgD*3?U!u
+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WBm+>P&^+>Fuo+<Ve%67sB@
+<Y04D/Ej%F:AR"0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb1*@\o+>P&^0d&4o+?(Du+<WBm
+>P&^0eje)+<Ve%67sB80H`_\%1444+>P&^0eje++<WE^1*@\r+>P&^1*A=p+>t>t+<WB]1*@\o
+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l'+@B%#7L]\I0d&4o+>GVo0H_Jn+>P&^1E\Fq+>P&p
+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB81*CXW@:NjX$6V&G1*@\o1E\@o
+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GYpF)YPt
AKYDnFCfJ8DKTe*$7QDk%15is/g,@VEb$;)DfT]'FD5Z2+D,P4+Dbb0ATJ:fG@kYS3Zoh)4*,"M
4)JSG.3Kr[4$!fX%15^$6qL9F6W?iZ=Zneg-RT?1%15^$;b0>N9LW&_4ZX]I8OccQ:4#&`-Z`rD
@UX@+%13OO:-pQUGB.,2E+NQ&Ch[cu+E2@4AncK!$<L+k:eX;D6p3RY4t\HO-OgCl$;No?+E1b,
A8bs#FE1f-F(T?2D.R6#GB.,2E+NQ&Ch[cu+DbUtA0>u4CLqAm$:.?S;H-Uk935"W:d$i^-X8rR
ATDllDej\I/6>_8:eX;D6nB^6-OgDX67sa!DId9hE+NotASuU2%13OO:-pQUF(f-$C`me/EbTK7
F!,R<@<<W'Eaa$#04K'<Ch+Y^@8pf?+D,>(ATJ:f%15is/j)7FIXZ_gHQXq^BHV^4$;*uY<CokP
<(0o3DJ=>Y3Zp+!3Zp*c$6p[7AT;j(DI[6#De:,.@<?(*+Cf>,D..<mF!,R<@<<W)ASu("@<?''
:ddb^$6p[%F)uJ@ATJu1@<?(*+D#e/F!+n3AKYo/+EV:.+EqaECM@[!+E1b2BFP;bF^])pFCf\>
+FYPaB6%p5E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/
Cis0&@<?(*+<Z+XIV3\>F`;dSILQW5%13OO8k_TG76s[J79F\MBm;d%+>=p!+>=63,9V#<D/XT/
+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IsD'1;\@<Hf($?Bu+.P>1>C^g_lD'1;\A9MYr$?Bu+.P>[]
%17,m+=]!XA9\OjEbupK/oPlS%17,m+=]![DeBLdEbupK/p)#A%17,m+=]![De9FcEbupK/o5HB
%17,m+=]![DfcEqEbupK/no36%17,m+=]!XChF1aEbupK/n/X0%17,m+=]!VH4:31%15is/j;IJ
IXZ_T$4R>;67tA_IXZ`p+F>4`@UX@$I16NU9L;`N9LMiK=EeIs4ZX]>+?CW!%17,eD'3n2EHPi1
@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RB
ATJu&Eb-A3DBO%7AKZ28EbfB,B-;/%FD)*jF(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>
+FYPaB6%p5E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/
Cis0&@<?(*+<Z+XIV3\>F`;dSILQWqDIdR%@ps0_$7QDk%15^$6VKp7:/jYaGA1qX3Zp+!3Zp*c
$?B]p+ED%1Dg#\7CghEsGV=/MGT_*>D/^V0Bl%@%%16WWC`k2[@<Hf($=m^a+=]!Q@VcJ\A7]R"
.P>7TBakD[AS`J=/oYk@$=m^a+=]!XA9\OjA7]R".P>X^F:ARfAS`J=/o5H=%16WWC`k2[FDkXu
$=m^a+=]![De9FcA7]R".P>OUC^g_^AS`J=/o5HJ%16WWC`k2[Bl7Gj$=m^a+=]!XChF1aA7]R"
.P>1HB+52YAS`J=/n]J>$=m^a+=]!VH736FF*T2D$7QDk:-pQs5(7s0ILQVn$7I\Q3Zp+*-RT?1
BkAt?+<VdL8OccQ:*:ZiD_;J++<X9M6VKp7:/jYa4ZX]X9LDKB5u(BJ=EeIs%144#8k_QO8PDNO
79D]6+A,<o<CokP<(0o5Bl5%9%16Z_F(K&t/g*_T<DH+f+CoCC%144#8k_TG76s[J79D]6+A,<p
9LV6B<(0o3DJ=>)$6UH`9L;`N9LMiK=?S\f8k_QO8PDNO79F\MBm:a0$>"$pASGa/A8a(0$6UI4
D/XQ=E-67F-V@'"9LV6B<(0nB8k_QO8PDNO79C[R@rc:&FE8RBDfd+CATT:/$>"*c/e&.:%13OO
:-pQq4FVa.INWt[/o4s<AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0r
A0>,o@;BFrBln0&%15^$<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;FD,T5/0K%KFDPM>+E)4@
Bl@ltC`mk@C`m/(A0>PoF(c!i>[_bsBQ%p<INs;MF`_;8Edf6^+=18t%14Cd>R_#d>]XajCht5!
F`M;FINs;UC3+N<CjmUXI3;d"%14CdAoDU0DJsW.F(or3+C'#"G]\%LHW*I$/M]1A3ZrkrIWK12
1,Ut=,CY%`>]+J#D..7%BmO>"$@N?j>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&
.1HUn$;No?+D5_5F`8IAG%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3
De*ZuFCfK$FCcS5G%G];Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:
%14Nn$4R>;67sBnEc6)>+EDC=F<G[:GT\R\@rH1+D/OD;D..]4DImBi+CSeqF`VY=DJ'Cc8k_`Q
:eXG[<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''-tdR>Ch[u?+DbJ.AU#>0Bl%?5+=LlC
E,961.3N87DImisFCfM9,%kq7F`8N6$7-g4@;TRd+Eh=:F(oQ1F!,C5+EV:2F!,(/Ch4`$DfQt3
@:Nsn8l%htB6%p5E$/k:+E2@>@qB_&ATKI5$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9
G^U#.%16?LAS5^pHXq&)F_t]-FF=T*%16?SDK'`?H[[2gB6%p5E.0$\FD5i5AM/(9G^U#.>]!nb
ATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%13OO>]++sE+*Bj%14C(@rH4$@;]Us+D,P4+CSeqF`VY=
DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"
DJ+')HX('!CisT4F(K<=HS]5MI16N0>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0
>]b1.@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CXQSBk;K@FCf]F%13OO>]++sE+*Bj%14CdDf0,r
DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'
Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^t
DKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO:-pQUGAhM4+Dbb6+EDC=F<G[:GRY!P9NP"f
6qg0O<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''.!KTMA8Gt%.3NG8FCf\>Anc'm/g(T1
%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%I[
GApu'AIStU$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4
F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0
ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@Hp^$7/qqDIm<rCisT4%16?S
DK'`?H[[2gFCf]7@;TS),CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*D0'8uFD5Z2%16?K
A7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4$=%OjBl8$,DId='
%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$4R>;67sBt@;0U%C2[X!Blmp,@<?''9OUn3=<MR'ARTFb
Ch4%_8l%iKBlmp,@<?'WEb/Zr@VfU=3Zp+!3Zp*c$7-g0De*ZuFCfK$FCcS2@<?(*+E2@4@;TIi
AM,)7$7-f($7-foBPDN1Anc'm+DGm>@3B5tB4u+,+CfP8FDl#1H=^V0G%G]8Bl@l3De:,6BOr<*
Eb/Zr@VfTb$7-g3@<?($Bjkg#B4YslEaa'$A0>?,+E1b,A8bs*F!*&U+E)4@Bl@l3GA(Q*+E2@>
A9DBrDJ(($$7-fIFCf\>Dfp/@F`]5YE+*WpDdso'BkM*qBkM+$Bl7Q+BlbD8G%G]7Bk1acDBNA*
A.8kl+EV:.+EMX5DId0rA0>T(A7^!.BlbD;ARo@aBl7Km/g(T1%16?NDe!p,ASuU"CghC+>;7mP
FBs6%Ecc#*Ch8#($4R>IF`V,5@:O(]B4Y:`@;]Us@ps=f?$g3qDf''-Ed<'B$=%^pAT2'fCLLje
>A.SVA8,poF'X-)F_kl5@:s/"%16?_F(K<!@r#LcAUA61De*F"DLDs$>]k+!E+*6l@:s.u@;U(,
H#7"A@;U(&@<?12%16?_F(K<!@r#LcAUA-'G\(u.GV!Q@Cis0.AU&V4$4R=g+E2@>G%kJuF!+_0
AU&<<F^fE%EbTK7%16?_F(K<!@r#LcAUA$'G\hJH11bkV%13OO,p6i@@;omo@ric,DI[L*F(oQ1
Et&I]F`V,5@:O(]B4ZF&Ea`p#Bk)B=F*1r(BkMR/ALqn:A7]7ZE.&0&>\A(cE+irqF)YQ0BR>(Y
055<6Cisf5Df0VLI=2P3%14C(F`V+:D/!L#Dfg8DAKY]!+CTG%Bl%3eCh4%_>Y/NsBl%?LG\M5@
F*hb<@rcL0H#R=IF*)\UHX(]7AT2'fCLLjeHYmJ,Ec6&FE+OHGH[Q>1>\RefF_r6T>\RepATVL.
+>I,5Bj>@aCis0.AU#=P>\7\50H_YaBkAK,A7fppGRY!&+C'&1AT2'fCLLje>BP%"3*glFDK'`?
ASu"+%16?OCia/1,p6o6+Dc1/FCf\>DfQtFASbdsAU"Xk+<Xp3F(K<!@r#LcAUA$-DKKr=ARg,t
$6UHrBkDU$FCf\+$6UH6+C'&1AT2'fCLLjeH['@KG][t7/9l;TBk)'lAUP!p+<Xp$BakCl+C&Gg
AmoguFCoH/FCo)mFEMV8F*gViE,]N/B0C?JGV+#KG]YK8@ps1b4\]@,@q\PSG@bf)@<6".%144#
,p75>E,8rmAKXEA;GU:[+EqOABHVG8Bk)'lAKYQ,Ec3(1BOPpi@ru:&+:SZ#+=/.EAfuA;FWbR5
ARlp*BPDN1@q]:k@:OCjEZcqVFD,5.E,oN2ASu!h+E(j$$6UH;+EV:2F!,O<DJ*cs+Cf(nEa`I"
ATAo-DBO%7AKYr4ARTFbCh4`$DfT?!F!,UHAKYo'+F%I6@<?(*/0JbO@;K@oARl5W+<Vt8DIn$%
Df'?"DIe*!AT`$3I="C_;GU:[I39XT%144#,p6]+DBO"3F<GLDBOu3,D/X<1F)YPtAKYT'DKKqB
BkAK0BOuH:Eb-A%G%#*$@:F%a%144#,p5c%Eaa''ATAo0Bkq9&;f?f!@q?cMDe*E%:i^IsF(JoD
%144#,p6lCFDs8o04Ja9B6,\6A8bpg/n8g:06DJY@VfsqEa`p#GqUp,0etC93A5GlF`Lu'/Rr^0
AM%kAD_>^FD/9Xg+<Vt8F(KH1Df0K*Df0ZD7WN'O9lFofI16N++=196ATVd-DJs-*DKL5(Dfp)1
AKX?YA7Zl[Ec6@8$=%1W%13OO,p6)sA7]@eDIjr,@:EeaGA1T0BHUo*EZf14F*)Ib+E)@8ATE!/
F(HmFFD,5.ASuX-ATD4$AKYr#@r#LcAKZ22Cht5(@<HX&%14C(D..I#ATDi7FDi:5G][M7A0>>m
H#IS2+EV:.+DbV$F<GF/EbB*(/e&.mD..3k@<?<sFED)7>X<HuAS5^p6uQRXD.RU,HR0+.+<Xp0
ASu('@rH4$@;]V&>X3+>F*),E%144#+<Z#9F(KH0ASu.&BR=!#@:EeaGA1T0BRP4aASljD%17Mg
D..3k@<?F0BOu2n$=%^pAT2'fCLLjeHY%);D.R`rFCfk0$4R=g+EV=1BQS')F*&O7Df'?"DIal%
DfQt:BleA=F)YPtBl7Pm$=%OjDg#i*ARfXqD..<mHX(Z,B4uC'BleBEHR0+.+<Xp1ATVa"DJ+')
HX(9,ASlL"E.*'eE--M5F(KH0ASu.&BR=!'@<-F)BlJKI0Q;,^I16Mm$7-g(F_PZ&+CoD#F_t]-
F<G:8A7]up$=%^pAT2'fCLLjeHYm2,ASG\"I16Mm$7-g)Des?4Et&I]F`V,5@:O(]B4ZF"Des?4
I16NgA7]@eDIm<rCi=?@F(eumARfXpDfU8Q;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/Df0Z;DepP;
FE2M6FEMV8F!(o!>\%DXBl7KlDes?4HY[2<G@PQ-DfU8QEbAj0HS@',1Ft441-$m>/i>G5%14C(
C*7)4E,95uBlkJ+EbBN3ASuU2+F##S+Di6=+E\fM%16?NAS,XoARfXpDfU28@<>pfDes?4I=$!I
@XWSW/ho.50J5+@/2/\61OT]>,p6qFDKTf*ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJC^g_VA7]@e
DIm<rCi=?@A7]7o@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdM8(F(K6!
Des?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HY.)4@<?!tCi=?BHZEb.I=!Y#
0JG%3/het10J5=>I16N0+DN$8De!3l+CT>4BkM=#ASuU2%16?NAS,XoARfXpDfU27BOPpkDes?4
I=$!I@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HZO:LBl7QnDes?4I=$!I@XWSW/i,45
0J57;/2/\1149T=>\%DXBl7KlDes?4HXgu2D.RU,@rH1%Ed`:TB4?:90J54@/2/\42(UF60JRtb
$7-g6EbTB)FD5o0+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4HZ+">ATD:!
Ci=?BHZEb.I=!Y#2)[!>/i,@90J5%6I39XT%16?NAS,XoARfXpDfU2CFD,6+@rH1%Ed`:47m_WN
0J"n/1,Uq;%14C(B5DKq@;I&pF)u&.DJ`s&FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0Ci=?BHZEb.
I=!Y#3A`9@/ho780J5(<I16N0+E2@8D/"*+G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBnEt&I]A7]@e
DIm<rCi=?@Ap&!$@rH1%Ed`:TB4?:90J5%5/2/\10J"n10JInt+<VdL%13OO>]k+!E+*6l@:s.u
AmoReH$44;I16Ng6tKtEDIla[DfTr#ATD6a@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH%16?.AS,Xo
AQEA_@UX@mD+/>cBl\-0D.RU,HUqj`BP_BqBQRs+B75,-ATD6gFD5T?HXgu2D..<m@q]:kF$3c5
>^K_(I16N0+@0OK+=A^PDf0Z<BmO>R>]XajChtIAAoD]4D/XH++Cf(nEa`I"ATDi7E+O&4Ch[cu
%13OO,p7/8DIdZq+D58'ATD4$ARlp)H#@_4GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>D.Rbt$7-g'
Eb-A*Bm=3"+DG^9B4YslEaa'$A0>B#A7ZlmF`\a:AS,XoBln'-DK?q;@<it)$7-g(AKZ&*F<G[D
+CT/5+Eh10Bk/?.AU&;>AoD^,@<?U*DJ()%Df'?"DIa1`>]k+!E+*6l@:s.uAo_<sARp2u$=%I[
G@bZ8Bl\-0D.RU,HW+TdA7];"H[U6h%16?XATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,
Des?4HY[2<G@PQ-DfU8Q>]aP%FCJj/HQt7nI=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4+B*3$EarZ'
6Z6LH+Ad)s%14CdDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?B
H[?tlI=6MQ$=%I[G@PQ.D..<mHX&sIFCA-oE+N!eCOKDA?$fguAU&<,Des?4HXpQ,@:O4lDfU8Q
HQt7nI=2P3-!Y>!G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmnDes?4I=$;c
0n"Iu%16?XATqX&D/E^!A:%QLARebLCfG=gI9SF3H[?tlI=34I$=%I[G@PQ.D..<mHX&mGF(J*G
Dejc*0jT-2FCf]=@rH1%EdM8(F(K6!Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QNCi<a(<,ZQ#
>;9E1>]aP%FCT6*DfU2:Ci<a(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6YKnK<,ZQ#>;9E1
>]aP%FCT6*DfU27BOPpkDes?4I=#4@AU&<+Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!;fm%oDJ)pe
COKDA?$fguAU&<,Des?4HZO:LBl7QnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QKDf'?&DKJir
COKDA?$fguAU&<,Des?4HXgu2D.RU,@rH1%Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s@rH4$@;]V&
>YfHTATCagCOKDA?$fguAU&<,Des?4HZ+">ATD:!Ci=?BH[?tlI=6Md%16?XATqX&D/E^!A:%QI
Ch7X/<,ZQ#>;9E1>]aP%FCT6*DfU25Ch7X/@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3-!Y>!G@PQ.
D..<mHX'$_DI[d&Df/NmCOKDA?$fguAU&<,Des?4HY.D<@q0FnDfU8QHQt7nI=2P3>]++s@rH4$
@;]V&>XijR@ruF'DH(OiI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>Z,-GBl@l`@<--pE`?smI9SF3
H[?tlI=2P3>]++s@rH4$@;]V&>X`[RDfSfqCOKDA?$fguAU&<+Ap\kL0n"Iu%16?XATqX&D/E^!
A:%QVDfT]'CfG=gI9SF3H[?tlI=2P3%14C(8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;Df'?"DIdf2
AoD]4E,Tf>+E2@>@qB_&Bl7Q+E+*WpDdso&ASu("@<?'k+DbJ.AU"Xk>]++sASu[*Ec5i4ASuU:
8l%iFEc6)>87c4?ATE3GI=$AO$=%I[G@bZ8Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2Ed`:_H[Q>1
%16?_F(K<!@r#LcAUA#tDI[s*A9*)-$=%OYB4Z.+H#.&=AmoReH$p,/%14C(A79Rk+D"tkBHV8&
B4VMZ>]OFpDfg>2ASlC"HX(Z2A79b3I16Mm$=%:WG\(u.GRY!&+C'&1AT2'fCLLje>B=@tE+*Bj
F(or34_A,=F(HmF,p7/8B4W3,BmO>5A7]@eDIm?$@X0)@ATVL.%144#+<VdL+<VdL+<VdLF`(o'
De*EBAmoLsALnrH+<VdQ+E_R9@rGmh+C]A&@;Bp,GA(Q*+E_a:A0?)1FD)eAATVL.%144#+<VdL
+<VdL+<VdLG\(u.G[5Z0H#R>8Eb/j2%16?OCia.s$6UHrF`V,5@:O(]B4Y:iDJ<U!A7[oGEckr!
HY@\DATDg&Apk*q>\7[Z$4R>IBR+Q.EcYf6F`;\:Eb/ZpCh[d&F$4VcF_**5$6UH6+<VdL+<VdL
+C]8-CMdL#CNDX\EckqE%144#+<VdL+<VdL+<YW6Amoh(BQ%oSH[RFS$6UH6+<VdL+<VdL+E1k'
FD5i5ANbBg/.Dq/+<VdL+<VdL+<Ve:Des?4Ch[d&F$4VcF_**5$6UH6+<VdL+<VdL+E_^@@rH1%
E]mlJF_**5$6UH6+<VdL+<VdL+Dbb0CL_:!DfS!X@:s.hFC?^0$6UH6+<VdL+<VdL+E1k'@W-9t
ATBq\0H`%l0R\?Y$=%X`FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%16?]ATVa"DJ+')HX(MuEcZ#1
E.*'kE-*4ACiseA12q=XD/!m1F!*2VFF=T*>]XIuCh7KsFD-#+ASl"!B4YsjH#n(JATVEqI=!b]
D1*NL,p7/IAThX&F<GLFATDC*Cht51Bl7L'%16?]ATVF#F`);4EdMk=@r?F+A7]_%BRP4]I16Mm
$7-g8ATMF)+DbJ.AU#>3DId='+EVNEF`V+:FD,]+AKYK$CisT4F!*%WA7]@]F_l.BBlbD=GAdot
,p7DFBk(g!Eb0<7Cij_@Bl5&0Dfg%CDe:,9@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3lF(8WtAIStm
+AP^3762Q"A867.F<G:0+DG_(AU#>8@;TRs+EDUB+EVO7ATVTsEZbeu,p6f?Df%NXBQS?83\N.1
GBYZU@<?(*/Rr^9D09`1FEoKWEb@%KBk;L1DfBE#/oYKC5A!&8-?MC*2`!<#$=%^pAT2'fCLLje
HYmnAFD56'Cjca">]!nbART[sATW$*EX`@\Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7HmG^U#.+<Z#9
BkBVPGAgu0CisT4%144#+<VdL>X3=@F*)><ARfXpAmoLsAISth+<Xp#Cia.s$6UH6+<Ve35]UFW
FDl&.@rH1*Eckq&$6UH6>\7[Z$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZE--L;$6UH6
>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h2/mYc%144#+=/.?BOPdkAKWcOFDi:4ATMR+ARlp$F_tT!
EZf:4+DG_(AU#>-DesQ5DK?6o+<Ve3@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='
DIIBnI9d9h+<Ve3D..I#@W-@%HX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6+<VdL+<VdL
+F@?f@;BFSE,]B/@psFi>\S(dAU&*$D.S,A%144#+C'#%Ble6%B4Z.+H#.&=E,8rsDLDs$+<Ve3
F(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*+<Ve3F(KH0ASu.&BR=!'@<-F)BlJKI0Q;+VE,9Z<
+>>E(E--L;$6UH6>]OCl@<`4g+<Ve3Ch7]nBlmp'>X3"6G\M82D1*]>$6UI<>\.e`HYmnAFD56'
Cib#0BkBVNATMs3DIm<rCg:mrARfXpF_u#$AScF!>[qS]@<-<qB4Y=[BmgEt>]!nbART\!FD,6+
%13OO>]!nbASH$mAU"Xk%14Nn$;No?5!FFEIXZ$MA8PajAPPQE+=_,EA8PajAKYJ7/Kf+EEbTK7
+DkP&Bl7Q+-6Qf:A7Zm#@;]duF_kK.Bl@lM+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sB[
BPDN1F*1r%CghC++Co%qBl7L'+E_d?Ch\!*ATJu+DfQt;@;BRpB-;8*EbTK7F!,(8Df$U+$;No?
+D5_5F`;CE@;]TuF*22=ATKIH+A$Yt@;L"'+Cf>-FCAm$F!+t2A7ZlqDfQt/DII@,H>.80+:SZQ
67sBu@;TQuEb/ioEb0,uATJu.DBMOoGAhM4F"SRE$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)eP
G%G]'F#ja;:-pQU+<Y<.FCB!%FE8QI+<VdLB4Z1++CT)&+EV=7ATMs%D/aP*$;No?+<VeD@;BFb
F_u(?+<VdL+CoV3E-!.?@VTIaFE8RCDBNn,FD)e=D]j"AF<G+:D/^V.Bl[cpFDl2F%15is/g)8Z
D..3kB6,1<+<VdL+<YN0CLnW$Ec6)>+CT.u+EM[>FCcS9@rc:&FE7lu:-pQU+<YQ1D.R3cFE8QI
+<VdL@r,RpF(o6#ATJu3@;TRs+DG^98g%V^A7Z2W:-pQU+<YWGFCB!%FE8QI+<VdLE-68D+CT)&
+EV=7ATMs%D/aP=/Kf+GAKWC6ATV?sCij_I%15is/g)8ZGB@q<G]Y&N+<VdL+<YlHEb$;$DIal3
ATMr9FCf]=%15is/g)8ZGB.5,Ci<ckCi^^A+<Y6?FE1f"FE8R;Ci<ckC`mV(D.Rc2Ao_g,+A*bd
De*Dg$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X"@;BEsEa`iuAKW]b
0J,">3@PCE%16T`@r,RpF!)i=C2[X"@;BF%%16T`Bl8!'Ec`EH-Xgb.A1%fn%15is/h1CCE+Not
ASuU2+F#Ii+E(_(ARfh'+EqOABHUhsAnc-sFD5Z2+Co&&ASu$iDI[BlEt&Hc$;No?+EV%)F!+(N
6m-#_D/^V=@rc:&F<GU8@WcC$A0>B#D/E^!A9/1e6rcrX<'a#;3[Z%F68!U78l%i)I4#I2%15is
/g+t=EbAr+FCf]=+Eqj7E$076D/aE6@<-W9DJsZ8+DtV)AKYE!A0>]&DIjr7Bk2=!%16075u:NT
:fg4V4ZXs:H7(d42[p*'$;No?+D#e:Eb0<5Bl@l3FD,*)+Cf5!@<-E3F(96!FCSu,DdmHm@rr.e
;bobS76sg73[Z+(F)PQ)ARTU,/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*Eb/^&Bl%=$
+D5_5F`;CE@;]TuF*22=ATJu+Ec5e;F(8X#@q[!'@VTIaF<G+&FC>Uc;bon]:d$ie+D5_6-9`Or
/g)>j+=ANa/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1Eb0-1+=AOG
@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXHDfTE1+EqaEA9/l-DBO%7AKZ&(
Eaa'"BHV5&C1Ums+DG^98l%ha$<'_s<E)+B-Za3FF`\`M/gi#aCgSP;/5o><:I@EA74]f6?Qa&8
1aaXn>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXC
Eb0;7-uNI1ALqq7G]YAWFCAWpATJu.DBO"1Eaa'"BHV5&C1Ums%16$0:fUIo79EMP3[Z%hF`\`M
/g)>j-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3
F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMa@FCSuqF!,RC+Du==@V'RkA0>r'
Eaa'"BHV,0@ps1b%16$0;ccOi6V'@$-Y%()F`MM6DKI"":L@I$:IK,1C*tQ#<D?:h5t;@k%15is
/h1FMA7T7jASu$iDKKq/$4R=                                                  ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fU:3+>P'!+>Yu"1E\G1+?(E#1LbK@Ch.:!A9E!.Ci^_AF(Jl)FDi:2F_PZ&+CT.u+Co2-FE2))
F`_1;8l%iiDe*]nBl5%c:IH=9Bk)7!Df0!(Gp$U5@<6L)De*]nCLqQsEbTK7+DkP&Bl7Q+-6Qf:
A7Zm#@;]duF_kK.Bl@lM+D#e>ASuR'Df-\9AfrL:De(9                              ~>
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
1E\P#-p0UR/mg=U-Qk`Y<(0_W>"'Q$;FNlN8P`)(6r6QK9hA;,6rcrX9iFP>+@T1+0JPI?+A#C4
:-p'pH:gt$Bl8$(Eb8`iAKXQj8l%isDf9H5+A$lO:IK>IBl8$(Eb8`iAKXT@6rZrX9N+td6m,)t
6rm#M+A>("<)?Ro+A>3i:*<:t9gqEC5uU])>"M4,@WcC$A86$n@rH4'Eb0<5ARlomF_PZ&C2[X)
Df9H5@rH4'Eb0<5ARlonBPV9iF(f*$E$/\1F(KG9A9Da.BOtU_ATAo+Ci<d(+DPh*Ch\!&Eaa'$
<_Yt)C2[X!Blmp,@<?'fBOPsqA79RkF`M:@C2[X$DBN\;DBNe)CLq%!D/^V9A0>i3AS,Y$A9Da.
BOPsq+E2IF+E2IFB6,2:ATVC(Bl%<jBl\8;F(KH.De*ZuFCfK$FCcS;E+EC!ASQ-oA8-+,EbT!*
FD5Z2-RgSp4?P\X?SNZN+C]J-Ch-mfDe*ZuFCfK$FCcS(F_PZ&?Z:.0FCfK6-RgSp4?P\X?SNZN
+C]J-Ch.:!A0>W*A0>W*A8Gt%ATD4$AKY`+A8PajALAoX-p01/0I\P$4?P\X?SNZN+A,Et6<-TN
6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=Wg=46sjkAF(KB8ARo.ZEcQ)=F'j$6F<FCU;cI+=
De*ZuFCfK$FCcRo:IIuc8l%iC:IAK+A0=iI6r./^:IJQ,A0>?(Bl%<pDe*BmF*)G:@Wcd,Df-\2
BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#C2[X!Blmp,@<?'fDg#i+G@,H'GT^a>A8kstD0$h7De*g-
De<^"AKYhuDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ'D0]l7
A8lR-Anc'm-RgSp4>J$81F+_01,CU@0Jb=<3&WHI3A<EM3?U(21,CU@0Jb=<3&<?K0JbOD1a"P-
1,CU>1,ggD1c@<N3AEEL1E\G,1,CU?1GCF<1c[6L0KD'J3?U(21,CU@0Jb=;2D[-H1c.*K3?U(2
1,CU?1,pmH3AEHP1,:^E2'=Y.1,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t1
1,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$I0ek[C1*A>+1,CU>0JtI>2).$H3&<<F2]sk0
1,CU@0Jb=<3&EQR0fUmG2BXb/1,L[>0JtI?2`NKO0ebI>1a"P-1,CU@0Jb=<3&*EQ1b^gE+>PW+
1b^X<2(gaF3&`WM1GCXF+>PW+1GCU>3A*-G2)-pI1c[EP+>PW+1GCU>3A*-H3&NKO1cR?M+>PW+
1GCX>1G1L=2`NKG1GUXB+>PW+1GCX>1G1I>1cI9G2`!-F+>PW+1GCU@0J51>1H$sJ1,q$J+>PW+
1GCX>1G1I>2).$E2)[0J+>PW+1GLX?1+kF=2DR6N2D[?P+>PW+1GLX?1+kF=2DR6O0ekFC+>PW+
1GC^B0J5.A1,UjI3A<0E+>PW+1GCR>2_HsB2`WfP1,V!51,(I>0JkI>/i,CE3AWTK3B9&A1,(I>
0JbCA/iGLB1,:^I1,h!31,(I>0JkI>/i,F@0JkL>0Jka31,(I>0JkI>/i,:@3AEHK3A`W:1,(I>
0JYCC/i5:A1,UmK1GU^.1,(I?0JP7=/i>@?2`<?D1cI041,(I>0etL>/i>@=0ebF<3&WZ;1,(I?
0JP7:/iGUF1Gq$M2)$p21,(I>0JkI>/i5OG0JkdD3&N]=1,(I>0JkI>/i5OD1H$pC1c@051,(I>
0JYCB/iGOE3&N]N2Dm951,(I>0JbL=/i5CF0K:aH2`!H:1,(I>0JkI>/i,CB2)mBI0Jt[01,(I>
0JbID/ibpH2`NQJ2)R661,(I?0JP7=/i>XE1,h-K1bga.1,(I?0JP7=/i>XE1,h-K1bga.1,(I?
0JP7=/i>XE1,h-K1bga.1,(I?0JP7=/i>XE1,h3M0K:d01,(I?0JP7=/i>XE1,h-M3B/c:1,(I>
0JkI>/i5OE2`NNO0fCp41,(I?0JP7=/i>RI2)d<K2DmK;1,(I>0JkI>/i5OB3B/iL2DcO30JYI=
0ebI;2)dKR1GgmA1cQU50JYF<1GLmB1c@-D3B9&X0K:110JYF<1GLmB1c@<N1H73N2)QL30JYF<
1b^^<1bpdD0JGF>2E;m80JYF<1b^^<1G^jH2)$sF0Jst.0JYF<1G^^;1c7'I0f_!K1,g=20JYF<
1b^^<1G^mC2_d0J0fL410JYI=0ebC92)dEL0f:mE2)ud70JYI=0ebC92)dEL0fC^E2_uR30JYF<
2DQs=1H@3J1H7BK0f1".0JYF<1,:d@2).$M2_m-G2]sk01,CU@0Jb=;2`*3B1GL^H2BXb/1,CU?
0K1UB1GgjB2*!EN1E\G,1,CU@0Jb=<1GLUE2`EKH2'=Y.1,CU@0Jb=;1Gq0I2`!HN2BXb/1,CU@
0Jb=;1H%0H3&3EN0d&5*1,L[>0JtI?0fM'L3AENJ2]sk01,CX?1,:I>0etI;1b^mI2BXb/1,L[>
0JtI?1H@6F1GUXA3@QL-4>J$7,Vh&/1GCX@2(g^@3AWHL1c@?P+>PW+1GCX@2(g^@2Dd-E0f1jJ
+>PW+1GLX?1+kF=1H.*F2)I0F+>PW+1GCX@2(g^C0Jb^D3&E<E.4cl01*AD!1,(I>0JbFD/i5CB
3&<9K1H?R50JYF<1GUd>1bgsM2)@6L2`Dj70JYF=1,:U;2)?sG1c%-L3&Vm70JYF<1G^^;1c7*F
0fLmK2E)a60JYF<1GLmB1c.'L1GLjF3?U(21,L[>0JtI?2`W`P2).*L0d&5*1,CX?1,:I>1GLgF
1H@<P2BXb/1,CU@1,U[A0K1aA1H$[5-p01/0I\P$4>J$62C(%31,CU>0JtI>2).$I0ebRF3?U(2
1,CU>0JtI>2).$I0fM'J2'=Y.1,CU?0JkC?1GpsB2)$gD3?U(21,CX?1,:I>0fCdH2`<BL1a"P-
1,CU@0JY7=1bggG2).'J3$9t11,CU>1,CO?1GUjF2)R'I2BXb/1,L[>0JtI?1b^U@1cR9O0d&5*
1,CU>1,ggD2)I'E0JYRH+>PW+1GCX>1G1OC3&riN2`!BI+>PW+1GLX?1+kF@2)$aA2`3NQ+>PW+
1GCU=1bL[C1,CdG0KD'N+>PW+1GLX?2D-gG2)-pF2)R0M+>PW+1GCR<2(g^C0fLpJ3&i]K+>PW+
1GCR<2(g^C0fLpK0f(^E+>PW+1GCR<2(g^C0fLpK0K(dI+>PW+1GLX?2D-gH0ekLF2)RBP+>PW+
1b^X<2(gaH1,:dK1H@B:1,(I?0JP7=/i>XE1,h3N3A`Q81,(I>0JkOB/iGUA2_m3M1bgm21,(I?
0JP7;/i>RG1GLaG0f:s61,(I?0JP7</i>FA2)R<M3&!?81,(I?0JP7:/i5RJ3&!*A1cI041,(I?
0JP7=/i>I>0Jt[H1H@041,(I?0JP7=/i>UG2)dEP1,Ld01,(I>0JkOB/i>LB1cI-E2*!W=1,(I>
0etL>/i>IE2_[!@3&*951,(I>0JkI>/i,@@2_d*B3AEB61,(I>0etLB/i5OF0f1aF2)@681,(I?
0JP7=/i>XE1,h-M1,h$41,(I?0JP7=/i>XE1,h-M3B/c:1,(I?0JP7=/i>XE1,h-M1,h$41,(I>
0etLB/i5RC0f1mJ2*!QD/1<V7.4cl00I\P$4>838-p014/3GT                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
