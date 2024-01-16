NB. sha256:fe784f446dfd029fe9bac8939763e67df366c1cae8320ad265c426480b7e4260
NB. JOD dictionary dump: 16 Jan 2024 11:37:08
NB. Generated with JOD version; 1.1.0 - dev; 6; 14 Jan 2024 14:23:20
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

JODTOOLSVMD=:'1.1.0 - dev';6;'14 Jan 2024 14:23:21'

JODVMD=:'1.1.0 - dev';6;'14 Jan 2024 14:23:20'

LASTPUT=:14

LEAN=:33

NAMECLASS=:12

ZIG=:34

jodliterateVMD=:'1.0.1';10;'16 Jan 2024 11:35:37 MT'

jodliterate_hashdateurl=:<;._1 '|f64d601005a1e29b5a34c58af334056dc558235fc39d6b39ddaa4087f4e7da5c|16 Jan 2024 11:35:37 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

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
0fM'71GU(.+?1K!1E\Y"1,g=7+>Y\o3$:+5+>k8s3$9q4+>u"u0ea_.1E\D1+>P_q0eje,0d&@s
1,9t2+>Pku1a"P0+?:Q"1a"Rs1,9t,3$:%9+>P_q2)QL20H`2++>k8s2'=V-+>khq2'=\7+>G\q
1G^./1E\M6+>k9!1E\Ir0fC.6+>beq1*A>4+>G\q1-$I5+>bks2'=\4+>GVo1bp1.1a"\2+>PYo
1G_@#<(0_W>"*@=C1Ums+EM7CAKYo1FD5Z2+Cf>#AOB?a5u^EO:2aTVARfg)@rc-hFD5Z2+E)4@
Bl@l3@rGmh6r6QK9hA<$@<cL'F_r73Bk)7!Df0!(Gp%'7FD)e5ASu.&BLGip:eakY2/[>SATJu5
F`\a:Bk)7!Df0!(Gp%'7FD)dK+E_a:Ap%o4GA(Q*+Dbt)A8,po+CoV3E$043EbTK7F%K22:-qQq
E-ZP:EZf7<FCep"DegJ6E-,f4DBNG-A7\>Y8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7
+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$FDl)6F%T4r<)6:`
;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)
7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+
Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&AP>Bg<)?RoCghC,+E(_(
ARfg)E-67FDfBf4Df-\-De*EQ76s[bARTI!F)Q2A@q?d$E-,f4DBNG-A7\M%9gqEC5uU]S+DtV)
AKYK!@<6K4DfBf4Df-\-De*E_8On)@B-;86F`Lu'+E)4@Bl@l3@rGmh@WcC$A86$n@rH4'Eb0<5
ARo7mBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6
F(9-*E,oN2F(JlkF_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4
F(96)E-,T'CM7-tBOkt!@q]F`CNCV/F_u(?F(96)E-*49@<6*)@:s"_DKBnB@rH7,ASuU2A8lU$
FE;#8+Co1rFD5Z2@<-W9E+*cqD.Rg#EcYc6D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u
+Eqj?FCfM9BOtU_ATAo-DJ!g-D..O#Df03(DdmcrDII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/
@UX'qDIIBnF)#W(Ch\!&Eaa'$<_YtsDe*ZuFCfK$FCcS<ATDj+Df-\7@;BEs@;]TuA79RkC2[X!
Blmp,@<?'fBOPsqA79RkF`M;>BONJJ2)ZRj@<6*)De:,,De*ZuFCfK$FCcS9@rc:&F<G%8Bl%l6
Df-\.@<?'qDe*d(FEMVA+A,Et+E)-?Eb0<7Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QKDffZ(
Ed)5=ASQC+8g&:gEcYr5DBNh>D.7'sD..3kA9Da.A9Da.F!,R<AKYK*EcP`/F<GO2FD)e*F!+m6
8g&1bEbTK7+D,>(AT)*tE+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+E,oN%Bm=02D/a/sF(fN5
AS,Y$ATJu-@<6*)FDi:4F_u(?F(96)E--/?F`_\HDfTE1+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<
@<>pe@<6!&Anc'mF)Z8DB6/-9DfTE1+Co1rFD5Z2@<-W9B6%p5E-!.1DIal2F_Pr/F)to7@WcC$
A7TCpF)to7F"_$DART[lF!,F1FD,_<F`V,)+C]U=8l%ht@WcC$A0?)7Eb'64ATV[*A8Gt%ATD4$
AT2[$E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFb
Ch7a.A79RkC2[WnBleB:Bju4,Bl@m3E+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@3+>P&o2]sk32)ZR31E\D,2DS`aBl%<eC2[X!Blmp,@<?'U67s`sF_PZ&?YXLiCh\!&Eaa'$
+EK+d+C]J-Ch+YsDIal#BleB:Bju4,AKY`+A8Gt%ATD4$AM.\3Et&IO67sAi$;No?+CfG'@<?'k
3Zp131,*WVF>,Q]$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is/g)o'De!lC2'?@NBl%<&-u*[2
Ch\!&Eaa'$.3N&:A0>DsF*)G:@Wcd(%15is/g)o'De!lC3?T_bDe*ZuFCfK$FCefm@<6*m@<?('
Ebm0I@:Wn[A.8l@67sB90Q(fP0K1+&C2[X!Blmp,@<?'fEc5l<.3N&0A7]9\$;No?+>PW]ARdDK
+=LuCA8Gt%ATD4$AQDMn.3N&0A7]9\$;No?+>PZ^ARdJM+C]J-Ch+Z1Bl.E(D..I#ARlp%DBNn:
F*&ODEc5H!F)u8?%15is/g)o*@;p6B2'?=<C3=T>+EVNEBOPdhCh4`0ART+&Df0B:+E2IF+Co1r
FD5Z2@<-W&$;No?+>P``ARdJN+=M;BFD>`)Ch\!&Eaa'$.3NMHG9D$LATJu)AS,XoARloU+D,P.
A7]e&%15is/g)o+C12!72B[-`AKYK$DJ!TqF`M&(+D,P.A7]e&+EVNED..3k+Dl%;AKYr1Ecb`!
Ch4%_%16T`@r,RpF!,RAE,9H&?U6tDC2[X!Bll$h3F=p1-UC$aC2[X!Bll$h3@>qR+Cf>$Eaa$#
+?V#;5s]7(A8Gt%0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$4ZX^6/nA[,+>=63%17/dEc+$$
+=CoBA8Gt%ATD4$AL@oo%159QHZ*F;4$"c<-Y[F/GUFUc3ZpL<HZ*h@.3g3SD.Rr>.4chhC2[Wn
ATf22De'u5FD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\W_@qHj(ART*lGB.D>AKZ&-
@59\u+EM47GApu3F!,RGFCB$*+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Ch\!&Eaa'$<_Yt)
@:jUmEcZ>C+C\noDfTE1FE/L=DJs_AC2Rs6E,Tf>-OgCl$;No?+DG_7ATDlGEb03+@:Njk@WcC$
A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e@;9^k?Q`um
F<Dr-:K(5"-S0=KEc)<n-o2u,+>>5e-RU#G$>F*)+>=p$+?hK+9gM-E:L@OFDe*2tE-67F-p26^
Dg-/=F*&Nd1*CodDI[i=+>S?fDI[iQ3Zotk@s/u*D_;J++<WB]>9J!#Dg-//F)rHOE-67FA8,Oq
Bl@ltEd8dAF!,L7@:V$0DJXS@/Kf"NF*&ODEc5G1FD5T'F*(i-E$0%:F<G^FA79RkA1%fnAScF!
/g)kX$>"*c/e&.:%13OO:-pQUF`:l"FCcS<D.Fb4-n6Z//g+nIA8Gt%ATD4$AQDMn%16QT@<?'D
3ZohmF*(i-E$-MU.4chh9iNJ_:-pQUFE_;)CER5-EZfI<D.S$3DIj7aC2[X!Blmp,@<?']9gh-*
+<W'\4usfM0mdYRA8Gt%ATD4$AQDMn.6D!L@<?'0+=Jre1+@VoC2[X!Blmp,@<?']9gfEt-o2u,
+>>5e-RT?1BkAt?0H`M$4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCeKI6mj*fD_;J++<WB]>9J!#
Dg-//F)rHOE-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf4JEcYr5DD#d7CLo,/@<?''DJsV>
F`:l"FCeu1+<V+#AScF!/g)kX$>"*c/e&.:%13OOF)>i<FDuAE+=CW@Bl%<oDJ()8ATDj+Df-[L
4s247C2[X!Blmp,@<?']9gfEt%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!,O6Ec)<nEap4r+=D2>
+Dt\2-TsLb5snOG?X[\fA7$HlATT%B<)5nX?YXLiCh\!&Eaa'$?Ys=$%13OO-o2u,+>>5e-RT?1
:-pQUF`:l"FCcRn83o!g2BZ[AF(c\)DIal#@<?''-uEmFDKK<$DBO%8D.P.=+Xefh4Y@jlDe*Zu
FCfK$FCefm@<6*m@<?('Ebl0lBOPsq4ZX^,BONYR2B[$O@:UKmBl%>i$>OKiCh\!&Eaa'$?YEkh
BOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=RDe*ZuFCfK$FCefm@<6*m@<?('Ebl0lBkAt?
0H`M$4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm@<6*m@<?('Ebm*GA8a(0$6UHG+Bot0BQ&*6
@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^L@<6*)DJsV>F`:l"FCeu1+<V+#AScF!
/g)kX$>"*c/e&.:%13OO-o2u,+>>5eAnc'm4*+nPD@Hq#Anc'm+EM%5DC7S"+F+D'BkAt?0HapZ
+DGn,AgT\a4?G0&0d't<B4a:Z+=A:\8l%htIS)mn92d2\A8a(0$6UHF+Bot0BQ&*6@<6K4-Y@:5
A7]d0F"&5LDfd+3Df00$B6A6+A3(h\/7W:)Afu,*FEMVA/g(T1ASu$2%16f]/g+b;G\M5@?YWpj
Dfp.b/g)QW@:O(o4ZX^#E+*j%?YWpj-[nZR6VC?2-S0=KEc*EU0./2"F(96./13&aC3(aFA8a(C
%144#-urm-A0>JuCh5%<GB.D>AKZ&-Dg-//F)rIBF`\'"+<W'o14(^%DI[c;+Eqj?FCcS9BQ&*6
@<6K4C11UfF"A\<:IIucC2[X!Blmp,@<?'5D.G"'$>"*c/g(T1.1HUn$9g.jDe'u/Df6b&+>Y-Y
A1&`I%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZuF>,^8?O[?OF_PZ&
?Z:.0FCfK6:-pQ_@WcC$A7':uFED)7F!,NU/KeMFBl%<&E-68EATDi7F`:l"FCcS.@<6*)A79Rk
/e&._67sAi$;No?+CfG'@<?'k3Zp131,<9\B.u:S$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>P`]E,m]k+CSeqF`VXIFDi:8@;]UlAKZ#)@:V$0DJXS@E-67FA8,OqBl@ltEd8*$+:SZfDe!Tl
F)rIGD/a<0@p_Mf6#^sgEcWop3F=p1-UC$aE-68CF"fU7-QlV9@rGq!@<6!&4=<E\6#^sgEcWop
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>\Df7d"+FPkQBk/>?%13OOF(96.4ZX]5E-68EATDi>%13OO
4tq>%A0<7BFD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+EM47GApu3
F!,O;@59\u+CSl(ATDj6EZeh&AoD^$F*)FFC2Rs6+DPe4GAqJAF<G[>D.Rd1@;Ts+-S0=KEc*EU
?YEkhBOkOnAT`$0-OgCl$;No?+DG_7ATDlGEb03+@:Njk@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>
+E2@>@qB_&DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e@;9^k?Q`umF<Dr-:K(5"-S0=KEc)<n%14L>
+?CW!.3Kuc+:SZlAhG2[+?^i20RHM[6W-]e@;9^k?Qa<1F<DtoC2Rs6E,Tf>+?M>$HQ[39Ft"Oh
I3<E;G!.l//8es@+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`E
Gp"[]E,Tf>+E2@>@j#l-D.Rd1@;Ts+DJsV>F`:l"FCeu1%16Z_F(HsH0b"J$DIb@/$7QDk%17,c
+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!,O6Ec)<n%14L>+?CW!.3Kuc%15is/g,:UA79Rk+B(fs1,Us4
BOPsq+CT.u+Cno&AKW*)$><jhBK[sjF(eu;2)ZRtART*lAnc'm%14M)@rcH<-XUOqF(f)mFCfT8
CaUYp3Zoha@<6*DFD5T'F*(i-E$-MU.3L#m+>G<n+<iFZ@rcH<-XUOqF(f)mFCfT8CaTZ!BkAt?
0H`M$4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0-Qlr</e&.1+>G!C+EM47GApu3F!)iL
F`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+Eh=:F(oQ1/nAC4AM.Y)F(c\6Dfd+EE+EC!ARm.t
$>"$pAM,)[%16ZaA1e;u.1HUn$9g.jDe'u/Df6b&+>Y-YA1&`I%16T`@s)g4ASuT4-XpM*AL@oo
@rGq!@<6!&4EPFZCi<fj5s[eUF`_YF0KD.#%13                                    ~>
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
0fCg10fC.1+>G_r1*A>23$9t1+>P&p3&i$91E\Fq3&``N+>Gbs1*A;-1Gg4/1a"Or0f1jE+>GSn
1*AD42E)a60H`+n0ek@;+>GPm1*A>02`NZ;0f'q-+>c)53?U(3+>P&o0JG1:+?1K!+>Pi62]sh/
+>P&u3&``<0eje++>G`02]sh8+>P&o0JPR10fL41+>GZ11E\D-+>P&t3Aifh:IINL8PDNC8Q/Sa
;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp+6+A-'[+>PW+1a"M03\`BN2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[1,(I?+>G]61,CsH0FCEJ6rZrX9N+8X8PDNC8Q/Sa
;HYb4$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp:&
+@KX[ANCqf2'>M"DBL\g1,L+.1cd?H3]/Z"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1a#D!DBL\g1,L+.1cdBJ3\iDs8l%i^Ddmd!
Ecu#)?Y+7uDfTo+FEhm_2,6Ij.S<K)?Z0CpATDs*A7&ngEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7
E,TW8ATKI5$4R>;67sC-F*(i2F=hEC/T5*>ATDs*A1_A5Ec5u>I16Mm$;No?4?Y)I.3N,@@<6*C
+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuHDe(M92)$j9%15is/g)o0+AH9b+>PW)2'=V0
3]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43
+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUh
BIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4
D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is
/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA+
+=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V
0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-
EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!
D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@ltEbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9
F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(RnATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0
EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL
%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#
_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L
.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)
F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4
F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6
@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is
/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"
H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'l
AL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaE
A12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIAF^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZ
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@q
ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2
F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4K
Dfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr
_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?
4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\
De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNXATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'
ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1
@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2B
Ec5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<r
F:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH
+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr
-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%
+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX
67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-
BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[p
DJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+
Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u
1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQ
PcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+
6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:
Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL
+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;
ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^
+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$(
$K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$h
AKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbX
JDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;
0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL
+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\
ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>
$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-N
DJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0jDJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?
ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r
@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-
3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6
ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X
6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0
E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_
$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%
Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*
Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQtDKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cp
F<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh
1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n
@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8S.3N5:GWHsaBm=3"+DG_(Bl[cp
F<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB81*B;"Gp"jr0fL401HI?K3]/i*$4R=O$;No?
4?Y)I0I\,UEcQ)=3Zr6QDIjr,Bl.R++D#e-AS#C`A0>],@:X(iB-;,/A0=K?6m-#_D/^UG@Uj+$
%15is/g)i)+AH9b+>PW+1E\D+3]/`T1H>mO:-pQB$;No?+@U0\Bl7KC+DNnh1bLL9C,RnWG'Gbq
A79M&Bl4@e:-pQU6?R!YA3(iCDf'?&EarflCbIOt1,CL91+b7?<&$6k1,_0I2_SZW@;]^00f1I9
/MJhV9LVB>4Y[BQ:-pQU9PIsV@<-WS+?;&2/i#*i$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5
/i5!d$;No?+Acl_FCoH3D)re-@<-R+DBLho%15is/g*`'F*(i,Ch7WJ+DNnh1a$LMF*(i,C^g_H
67sBPDKBo.ChupVFD*]X06M>IEcWmKDeO#t@;BFp05<C%05<L"1^sde67sBJDf0Z*@rsaSGB\6`
C3+<*FE_/6AM.J2D%-g]$6UH678@2X<bu2iDfp//0fUjG1,_9V0fM!I+>PVr-V[$(7:/SW6V]!j
-W<?16=3;P-T`\M7863X6VAdg-W<?16=3DP;cI+!5tscq4"!rn;aOh\8Q&Jd?VWm]741/E7oDiT
?V*X54"!C6DKKo-@rs([-W<?16=3GS<)R((8Pgcr-W<?16=3VZ6UY9L<$saT79DoF?V*X54"!I!
6UY9[85E,_?W9Hr<$saT9gqKE?U[FR?URj@4"!`k78.&W9M%`]<*<$d-T`\M77BmW9g_lX?W'ft
-T`\M6W?rj6q($A-T`\A<)Zq,8OOpf-UC^1=^OQc;aVoo-W4MpDfTqeDe*EHEb/[$AOKsKALBPe
;IsfcEcaZeA7\GCF*(E$A79Rk-T`_1,VUZ/-S\Uk3(Gh]6Uipl-T`\00JG171cR9I-T`\12)7*L
2)$a44"!L3DI[?-4"!a2EbT?8DC7Ln0JP780JG18-T`\H0f([@-T`_--W;BA4!ua;0/5C=1,(FA
+>GW40JGOA0J5%50H`YU-T`\'4"!dAF<EkjF(o9)ARm/M-S[8/0/>493$9q23\W6K0JG+50JFV8
9d`"M;Fr5t-Ugcf0IJq078>]o+AtX":*=a66[!K_+@:*a-T`\'4!uC;-RUu'-T`_1,VUZ/-T"[W
2bQV"6Wl<&-T`\00JG171Gq$F-T`\12)I!F0JtR44"!=)Gpb[$6t(+SCaV:l0JP780JG18-T`\H
0f([@-T`_--W;BA4!ug;1,gjA0JPO00etdD0KLmA/het5+@/^L4"!HS3%$d8;ajM*Eb.9S6#:?[
:NU8]EZe:L:`r2MASuU2+=KrM+E).6Gpt+&-T!J20/>493$9q23\W6K0JG+50JFV89d`"M6V&Rd
-Ugug0IJq078trp+>"^*Ec5e;<-!+m+@9meALBPe-T`\'4!uC;-RUu(0I/>$4!upc6o7D32agY"
2CCR60JG170ekL>2CCR60f:dF1c%!D-T`\AA9fOa-V.ZfFD5;64!u^:0JG170JOq:-V,sJ2)$C>
-nH`E-Rh,)1G:LB0/>493$9q23\W6K0JG+50JFV89d`"M75[%P4"!rq:`sdi3Zp_)C`lMqBOu3,
;ajM*7<W6[FE8QQ9gKn?DJXSI-T`\40/5+80JPO00etdD0KLmA/het5+@/^L4"!Bd-T`\E<%p!R
4"!Hr0JFV$+@^BiD'2euF_)[^Cis;:4!uC;-RUu'-T`\'4")d.0I](20i^.j5t3\382i:O4!u^9
0JG4<2)d3:4!ua?2D?gA/hSac$@HZ(D/")7ATDg0E\&>EG\(B-FD5W*+Dl%7@:UK7+Z_;3%17Jk
+EMgLFCf;3Ch[a#F<Gd9F!,%=@qB4^ARl5WHlsOS+<VdL0HiJ20g'2i@<?01IS*C(:f:=^<D?:g
04JF*/no'A-OgE1>:h`j>p(eCF(KB505>E=DIR$iATBG=De(M9De*g-G%>`4E-![A@qdQ0C3'gk
%15is/j)9F0ek+"ATDg0E]P=OD.73lDfp+DDfp/@F`\a<DfQt;@;BEs-Zj$9F)GE'AL@oo:-pQU
1,U1?E,m'V0JYF,0f;!K3BAiQ%15is/e&._67sBLDJ*[$ANCrK3A*0A0J-aFFC?mWC,RnWG'Gbq
GA1r*Dg-73$;No?+@:3bCh,RL@rH4$ATD9p@;ISP0JYF90Jk@:1/otc3\`QS0etClCgh3o/MT+7
0J,4:;bTVK7QiI8$;No?+A?KYEaa!63ZpF82(gTm$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5
/i5!d$;No?+Acl_FCoH3D)re@Bl5%O1^sde67sBPDKBo.Ci!['3Zr/t/i=bcDKBo.ChsOf:-pQU
8T&Tk@;KaV@<?0D+CdGcC,Rn%3A*/u$;No?+@C'bFCA[$3ZrWjG:mWODe=*8@<,p3@rH2n$4R>Z
@;BEs-Zj$9F)GE'ALATq67sBkDe4!--ZgJ>E,]AsEZfIB+CoC5@;^@4BPD?s+:SZQ67sBpF=2,P
DJsV>@r,^bEZfR>ATD?)FD,5.Dfp/@F`]/WBkAJrDL!cUB5_@&/e&-s$4R=O$;No?+F@[;A1__3
/T5*>ATDs*A1_A5Ec5u>I16N[:K(5"C2[X!Blmp,@<?'90b"Ib67u)1;cI+=De*ZuFCfK$FCcS6
Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is/g)QWDe*Zu
FCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.68S,0JYI=0ekS$0ekIA1H,Y967sB4/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT6r-/m+<VdL+AP6U+D,b4C`m\*DIdZq+E1b2
BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sBmDfT]/Amo1\FCf\>+<Ve%67sBm
DfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA9/1e:-pQUB6%s-
BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g+k?@:NkiARfgrDf-[?
+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQUBkCit+<VdL+<VdL+<VdL
:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sC%ATV[*A8Gt%ATD4$AKW*j67sC"
Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m
%15is/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEs
G\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sC)DfTB)BlkI?+<VdL+<Ve%67sBt@;BEsCghEs
GT^U=Df$V@DfTA2Ch[s4+=MLa%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R@;9^k
Ch\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$?U<6/e&._67sC'F(HJ&DL!@D@;]Uo@j#i(F<G:8+EV:.
+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAISu\AhG3MAU%QjC2[Wi+?V#J;FO&D;GoqO:dIiE
:IAK'C2[Wi-Qlr</g(T1+<XWS8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+Abs)7R^3Q779s<:..lF
?YO7nA7#cQAScF!/e&.1+EMC<F`_SFF<Dr-;FO&D;GoqO:dIiE:IAK'C2[Wi+Du+>+EM+9-OgDo
DIb@/$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^@;^7"E]l#t4"u"(4?G0&1*C[TAfrLCBOu!r+B1m'
;c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-WEcYr5DC6kU/M8/5;BTLg/e&.1+EMC<F`_SFF<Dr+
:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAJtF`MM6DKI"EATDj+Df-[G-S04FDK]T3/12khBlbD7
Dfd*c4WlL43A*$=0ddD;+<Y`BDfp/@F`\`RBl5&9DJ=><F(f-$Ci^_@Ed8dKARTUhBPD?s+EqOA
BK@8[BOu3q+E1b,A8bs*%16ZaA1e;u@psIhBJ'`$+<Y`BDfp/@F`\`R78d#Z;E>q>@;]Uo@j#Z-
F<GX9F<E.X@:X+qF*&O(84c`V5u'gD6XO8:De*ZuFCfK$FCef,%16ZaA1e;u.1HV`:IIuc8l%iC
:IAK+A26(Q$6`VgDe*Bs@j#l3A8`T,BleB%-u*[2B6%F"BPCst06D,CDdR6tA1hh=B.4s28l%iC
:IAM4<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%iC:IAMB%16'J
AKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+%16N]
A0>_tGp$O7E+NHu+DG^9DffZ(EZe=W6r+qABleB;/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa
?T;V:BPqI!@6&HbFCo]:C,'C80m>H4DK]AN?m&$Y+EV:.+C]J-Ch.6tB-9fB6m,oWE+NotBm:b1
Ch7$qCj@.7G]7J-Bl5&,Dg*=GD]j(CDBN>.ATVC(Bl%<jBl\9&/g*_.C3=T>+EML5DKI"0+D,2/
%144#+D>\9EcW@6AR]dpB5)6r+CQC)F_kk:@WcC$A0>T(+CQC1ATo8.DK]`7Df0E'DKI">DJXS@
FDi:4Bldd&G%G\:8K`(mCj'B#+EV:2F!,FBDdmNoD%-gp+<Yr@@<-E3@:sL$GA2/4+EV:2F!,X;
EagX1$4R=t/g+Oa?SHA0FCB*$E\K@rC3h`q3,g]r3&l.r1Nm+h?m&HgA79Rk+EV:.+CJ_gFCB9:
E+NE"G%G]'+EVNEBl7EsF_#&+FD,5.DIn#7DKTf-EbT#+FEqh:F!,17FE2;1F^nun+EqOABHTni
3A*3!$4R=u/g+Oa?XYm0F#%u]Dg6LdG&TE$Gr9MVD)-5fBJj-\?m&?YG%l#/+EV:.+Co2,ARfh#
Ed8d9DIal!Bl7@"Gp$^5Ch7Z1F(Jj'Bl@m1+EqL1DBO%7AKYYpF(c\;Bk1db@<*K&Bl%?'BlbD*
A7T7^/e&-s$8a@X?p%e+20NG>@:a.e0QguCF`h;=DJ!iGDdmN=?Tqj?;It#cF(HJ%@W$!i/0J>@
ATMs(?m'N%@ruF'DK?qBD]ib1Cisf@Eaa'$+E_a:+E(j7BOPsq+EM7-ARf.h/e&-s$8jFY?p%e-
C3j]8B/44F@V0%m@rlNsFYR_e1cRF;?Tqj?6Z6j`Bk1dq+DG\3Ec6,8DJ()(Df0Y>G@bK$BQS;<
Bl5&4EbTE5ARlooDe!p,ASuU2/g+,,AKYT'DKI"DF(Jkk$6UH6AoD]4F)Q2A@q?cmDe*E%@rHL+
A0>>m+CQC/BlnH5AKYH#Ch.*t+>"^IF)Y]#BjkgoGp%3BAKYK$Ci=?*A0>u*G]\!Z%13OO2D-+[
4C;WEBQA-62fW;?1bs,eCc?EVGWBJYB4<i-5%#L(@<-4'DJ=E.+Cf>#AKYK$Ci=?8+CT.u+D,P0
FE8R5@rcL/F!+k,F*)54F*),6B6.H'@;]Tu?uTOlA8bsc+EMgGFCBD:@rH1%EbTE(/e&.1+<X$o
EcP`/FDQ4FFD,6,AKYr#@r#LcATJu:F(HJ)BkCsgEb0-1+D,P0FE8R5DIal"Des?4F"Rn/%15$H
+CI<=2KCK3D)lKRBR2FN@5g&cFEi%DEc#9!EF1n;+AucoBk;K2BQ&);FDi:6F_kl>+D#D!ARlol
Cht57AS,LoASu!hA0>K&DKKqBBl5&4EbTE5+AbHqF"Rn/%15'I+<Y&S?T)\3C2[R#G%*@DCNFf7
H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&uk
F(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%16KIASu$1FDk].?!n*K<)5nX?V4*^?Ys=/
2[p*;>AA(e+EVO4D]ik1F*(\9FDk].?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^h
F!,(5EZea^:IJS5@;]TuBlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5
@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@
Gp%$;+EV:2F!,(/Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE
.1HW+D]j+4AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<h
F)tc1Bl&&;D..NtEbSruBmO>C%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=3&5"uDKTK70l8[Y
D`B\!1jC]rGr]JPG[EXB+@C'bF(o/rEZee$A8,po+CQC)DfT]'FD5W*+E)4@Bl@l3FDi:0D..3k
?m'Q)@<<W)ASu("@<?(%%144#+Co2,ARfg)A7]@eDJ=3,Df-\0DfT]9+EqL1DBNe)CM@[!+EM%5
BlJ08/g+,,AKYMtEb/a&+Co%qBl7X,Bl@l3AoD^,%144#+DGm>D/XH++D#A#B45\"+CT.u+D>2)
+EV:.+Dtn'AKYSr@<?X4AKYo'+<k?-EHQ2ABl7Q-+EM77B5D-%Ch[cu+D#e:Ch[BnFE8uUAM.UJ
%144#+F\cgILQW,+<XEG/g,.VDffQ$+EMX5DId0rA0>H.E,95uBljdk+<VeIF*;)*@m)jq1E\_$
-XC+.:/st]9gMZM,$uca/gr,!;H$Uk<D6(8-7q8-9KFjM4?G0&1+"V;+?V_<?SWaL-OgD*+<XEG
/g+\8+D,P4D%-gp+<Y]GG%>/oA7Rha+FAGX?!o'U<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S
3\V[=4"akq-8%J)4?G0&1*CibI=2P3+<VeUIXZ_T$6UH6<+ohc@rH7.ATDj+Df-\0Ec5e;F*(i.
A79Lh+D#e:Ch\-.F<G[D+Co"*BlbD<FE1f(B4uC!DfU&1Eb$;$F!,:;DJ'Cc+<Ve8F!,R<AKYMp
Anc-sFD5Z2+CoD%F!,@=F<G^IAKYE!Gp%$;+A+#&+ED%7ATDs*A0><$B6A'&DKI"=@;TRs/.Dq/
+<Y'7+EelE+DtR>+<Wrm@q]:gB4W3%Bkq9&FD,B0+EqaHCh+YsCiaM;Bl.ft@rri$C2[X!Blmp,
@<?'g+C]J8%144#+E)F7Ea`d#+EqaHCh+Z*@;BEs8g%V^A7Zm$Bk(^p+EVNECi=6-+DGpM%13OO
1+j\W4C;Z>@qp+(ARR<-G'[p[Ahe'[Cbp>lDII]q5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7%144#
+CJ`!F(KH$+E)4@Bl@l3?q*pi6Ua^8;cH1`:dJ&O?m'Q)@<<W9Bl%T.Bl7Zs@rri8BOr;rF`MM6
DKH<p+<VeD@<6O%EZet.Ch4`.@<?0*Bl8$2+CQC'Bk)7!Df0!(GqL4=BPDN1DfBf4Df-\ADfol,
+CT).ATAo*Bl%@%+EV:*F<G"4AISth+<Y`:F<FIM5t"LD9N`KPDBMPI6nTT\Df''-BPD?s+EV:*
F<F-tF*)G:G%Ddk:K/H9:EW&$+C]J8+DG^9FD,B0+Cei$AKY]/-Z]_(+<Ve<Bln$"EZfRHBlmo/
@3B/nG9C@?FCfM9FDi:1+D,>(AKYMp@r,RoARlo]76s=;:/"e5DfQt@AR]drCh+Z1BOr;sBk)7!
Df0!(Gmt*'+<Y9:Df$V*+CoV3E%W84BOr<'@;0U%F`V+:GAhV?A0>>m+EVNED..3k+DGp?ARTXo
ATAo8D]in8G%De,Bk)7!Df0!(Gp$X3Eb/a&DfTQ'Et&I!+<Y*5Dfor./g*N(EcP`/FDQ4F8l%ht
Eb0*!D.7'sF!,[?ATD?)FD,B+B6,2(Eb-A%DIal6BPD?qF!,1/+EV:.Gp$a<+Dkh6F(oN)/e&.1
+<Z,^IXV_5+<Ve%67sC$AT2Ho@qB^(FD,5.E-67FA8,OqBl@ltEbT*++E1b2BHVM5FD)e,F`MM6
DKK]?+E)41DBNe)F*(u6+E1b2BFP:k+<Y36F(KG9-Upm06Ua^8;cH1`:dJ&O-OgD*+<Z,^IXV_5
%14mD+CI<=@Vg@*Df.IV3+asUA8sFaCH-NSH?FNm1g`FS+@C'bF(o/rEZeq<FCf?#Bl7Q+?ufh"
FC\c%FDi:BATVj2AKYr#Ecc#*F_kK,+C\bhCNXT;/e&.1+<X$oEcP`/FDQ4FBlkJ<ATMs3Eb0;7
FD,5.D/XK;+ED%'ASuT4@UWb^F`8rU6#:U\/0JG@DKBN&ATAo'BOt[hBl7Q+FD,5.BOPsqATJ:f
+<Ve;F`M26B-;5+F*)>@AM,)s+EqO9C`m\;Ddm-aCj@.3Ci"$6+D>2)BHUnqBl%p4AKZ)5+ED%7
FDl22+C]J8+E_a:EcW@EBQ&$0A0>Z*Dg)Wt+<VeJDf''-BPD?s+D>2)+C\nnDBO"1Eb0H/DJ()9
Bln#2FD,6"EZeh"@r$4+F"Rn/+<VeUIXZ_T$6UH6:-pQUEb0<6DfTD3@UWb^F`8H[1(=R5+<Y]9
F*(q8-Xpe3@q]I_@q@#L1boLI+<Ve%67sC$ATMs3Eb-A&@:O(qE$-tm+DGJ+DfTQ0B-:krF(c\5
Ble-"FCSuqEt&I!+<Y]9F*(q8-Xpe3@q]I_@q@#L1bp1.2[p*:+<Z,^IXV_5%14pE+CI<=1Lb>a
FuahhF>IoZ1NYN1H>-l*BehV[G$dF@+AQKl+Du==ATDKp+Cno&@<?d6ATJu&DIaku+Cf>-G%G]8
Bl@l3F`_>6BlnVC?t1fs+CT;%+C\nrDJ'Cc+<Ve8A7T7^+DG^98g$,H2BXD'0JYJ"@;[bS.3NhG
+Du+A+D>2,AISth+<Y&FBl8$(B4Z*<055<GAS5Rp1,!?ZFCf)rE\oF]Ci<a(Bl7Q=04o$=@<?4$
B/D8RCi<a(Bl7Q<2IIYOBOu'mG%G\:FD,6+AKYE%AISth+<Y0-@;]^hF!,RC+C]&&@<-W9Bl8$(
Ec,<%F!,1=+DG\3@:OD#+A,Et/g)9.-['&D@;Ksq@:XX+BPDQ2@3B&uDK]T3F(oQ1+E2@4@qg!u
Df-\/EcQ)=/e&.1+<XWsAKZ&*EbSru+CoV3E$/b2Ec#6,+E_aJ@;Kb*+EqaECNCV2DeX*%+D,P4
G@>N&+C]J8+A!\aD'3>,DI[6uDIm?$@:F.tF<G(6ART[pDJ'Cc+<Ve;F_u(?F(96)E--.DFD,*)
+EqO9C`mV6F<GC<@:UKpDBNk6A7]d(8g&:gEcYr5DK@EQ=(uJe+D>2,AKZ)5+Co&,Bldi.F)Po,
+EM%+ASkuf$6UH6FDi:3DfB8?%13OO2(g"Z4C:*aC,9d?1N@PP2`Yf$ASl3?1hLMWF_!775%#L#
Df0W1A7]d(@:Wn_DJ()#+D>2)BHVA1A7]7ZEZet.Ch4`2D]iM'DIIR2+C\bhCNXT;/e&.1+<XTs
GT^mHD.7'sARlok.P>FMAmc`nBl%@%+CT;%+CfG'@<?'k+C]U=@3B#f@r$4+/g+,,AU,D>BQ&$0
A0>c$G%G\:@V$ZjCij6/ARlomGp#^T6k'JG+<Y**@;0U%@;]Tu@V'7kB-:Yl@r$4+F!,17FCf**
BlnVCBlbD,EbTW0@ps1++B3#c+EM7-ARf.h+D,>(AKZ28F_kS2@V$['Bl.g*AKZ)+G]Y'?Bl%>i
$6UH6GA2/4+B(fs/M]1A+D>2)BOu69+DEH>/e&.1+<Z,^IXV_5+<Vd`12:<4@<6*nF"VQZF:AR"
+<XEG/g+YBA7Zl<2^!$V+C]5)+EV19FE8RHBOr;q@:O(qE-!.1B45LlF*&O<@<6*nEt&I!+<WBt
+C]5)+=Ach%144#+F\cgILQVn$8sLZ?p%dTH>#)nCH60HC,L3NA8l9?0Of?LEGfVQ?Tqj?6Z6j`
Bk1dq+CSekBl7Q+@3B5lF(c\7@VTIaF<G1(@qfanFEo!NBOQ!*GA1l0+EMXCEb-A%+B(fs/M]1A
+D>2)BHVM4ASrW0F`__>DJ'Cc+<VeF@VTIaFE9&W8K_GY+EV:2DJNs(B-:W#DffZ(EZf:>FD5Z2
+Cf>#AKYA82ddbMBOQ!*GAhV?A0>`#@;[3/FDl22+CQC+@<6*)Df-!k+<Ve7E-681+E)9CFCfN8
+CQC+@<6*)Df-\*B4Z0m%144#+F\cgILQW,+<Ve%67sC)DfTA2BlbD9F`\a7DIaku+D>2)BHV#1
+EMXCEb/c(Bl5&%+ED%7ATDs*A0>r0DfdT@$6UH6+>=om2^!'^F<DrTDfTA9%144#+<XEG/g+h9
F(c\1F!+t2D/`p(ARlp*D]j43Cis;3Eb0?5Bk;I!A0<HHATDg0EZf(.+DkP/@qZus@;0P!/e&.1
+<Vd\+>GetB4Z0--[0KLA1%fn+<VeUIXZ_T$4R>$/g+Oa?XdqqD)68hG%>]=2edAF2J[)RH"ere
1j34i?m&&hF!,(/Ch4`4ATD7$+DkP4+D>2$B-;D3ASrW!@q0(kF(oN)+EqO;A8c[5+D,>(ATJu4
DBNJ1Bm+'/+CSbiATMp(A0>?,%144#+BD<6+Cf>-DIm="Bl@m1+EqL1DBMtV:*=7l+E(k(/g+,,
ATD?0F!,@=F<GFC@qZuW:IH=8@;[2uD]iY1EZf4-E,]B!+=M&;FED)7-Y6g;%144#+CoM,G%G_;
@Wcc8?tNtpBleB(+D#_-DKL#0Ci"A>Eb0?8Ec,q@0HatGEZeCZ:*=Uk@<,q#+Dbb-ANC8-+<VeU
IXZ_T$6UH6+D,20BleA=-SI,fAohKoFtba+F(f!&ATKM>De(M9De(M9GAhM4F"V0AAg\#p+<VeU
IXZ_T$6UH68l%ht@rHL+A0>E$+CQC4F_P?$+D#e3F*(u2@q?cmBOt[h+E)-?GA1r*Dg-7FF*VhK
ASlK2GA(Q*+DGp?F(Jp(+E_R=@;p0sA.8kg+<Y`=@<,q#+CHiUF)Po,06:f8Eb-n8BP9&6GAhM4
F"V0AAmd56+B3#gF!,[@Cht53Dfd+8ASc<.AoD]4<_uO6D..C&ARlooEbT].Et&I!+<YlAASrVk
:ei-IF!,C5AhFN"%15'I+CI<=1GNu2A8c()CjBuBF^\luF*DPB2`NX5E*ke:+B2onF<Ft+De*Zu
FCfK$FCei&Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO3A)Es?p%dT2fF"R
G&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(
F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr@WNZ*@<Q3)@q]:gB4YTrBl5&6ARf:h
F<F0uG%G]8Bl@m1/e&-s$8F4e+<Ve74C:!^Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1
A7]d(@:Wn_DJ()#+Dtb7+CT5.ASu$mGT_*H+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB
+A,Et+EV19FE9&D$4R=s0eORk+CI<=A2.V:Antp31jO%`CghF'@q[W:@5V_BDdP\9+@C'bF(o/r
EZee,Ci=N3DJ()"IP5(O@<3Q"+E1b2BHV87AS,Y$+E)-?D.-pM;]oLdA0=Q[DKU1HF*VhKASlK@
+B3#c+D>\1AKYMtEb/a&DfU+G@rH7.ASuU(Df-\9DBO%7ATME*F*VhKASlK2BlbD;ATMg%@ru9m
+C]U=?t<tl?nMlq%16KIASu$1FDk].?!n*K@WcC$A86$nA8-+,EbT!*FD5Z21,2Nj/h1=QBl%<p
De*BmF*)G:@Wcd,Df-\=/M/)WF_kk:8l%htA8-+,EbT!*FD5Z2+C]J-Ch,.-$4R>;67sBjEb/[$
AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&
?U6tDC2[WlF_PZ&3B9*,4ZX]55s[eODe*="Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="Bl%<?
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41
DBMPI6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH
>9G^EDe(4C%13OO:-pQUB4Z0-8l%ht@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!
+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO:-pQUF(KG9A8-+,EbT!*FD5Z2
+Co2,ARfh#EbT*+%16i\A8-'I3ZoeB:IITH6UXLD+A,Et;cH%Q779^F+A,Et7nHZJ8Q$[':IJ,W
<Dl1Q;cH%Q779^F+A,Et;cH%Q78QBA6qL9!8l%iR<'a#C6r-0<8Q$oF$>O*^BlZ?t+DPFtBlY=I
+=A:(:II]E<('ML6qL9!8l%i@6psgG6qL9!8l%iR6W-KP<(';U+A,Et79EMf6qL9(+:SZ+C1Ljh
E[a.4+EM+9@WcC$A7TCpF!*.G$4R>;67sBnASu("@<?''A8-+,EbT!*FD5Z2+EM%5BlJ08%175s
A79RkC2[X"@;]dkATMr90F\@]:IJ5X6m,r]Bl%<pDe*?rD/aN,F)to'+A,Et;cH%Q779^F4%`::
7nHZJ8Q%WB:IIK:6r-QG8Q%WB:IJ,K;Fs\a6qL8c$;+)^<)6:`;cZU\+C]J-Ch.:!A9;a.Cia*)
D/aN,F)to'+A,Et;cH%Q779^F4%`::79EMf6qL9<8l%iR6W-KP<(';U%15^'6rm#M+E_X6@<?'q
De*BmF*)G:@Wcd,Df-[i:IJ,\5t=@38Q%WB:II]E<(';U4%`::6r-0<8Q$!)8l%iU9gg+HE+EC!
ASQ-oF)Q2A@qB1nD/aP=8l%iR:K::[78m/O7n#g;;@Nt*:IJ5X6m-M]Ch7$rASQ-o+A,Et;cH%Q
779^F4%`::;cH%Q78QBA6qL9<8l%iR<'a#C6r-0<8Q%WB:II]E<('ML6qL8c$4R>;67sBkATMs6
Dg<I7F_PZ&+Dbt+@;KKa$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A7B[q
Ch,Od3F<4&%13OOBPDO0DfU,<De(U^%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP150H_qiA7]p,.!KBE.1HUn$6Uf@?qa!T
:1,2QDIakt>"M4l+DkOsEc3(=E-,f4DBNG-A7]g)@:Wn[A1e;u%13OO,9nEU0eP.41,U1?E,oZ/
+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@?uBP"A7-NtDg*=G@;BFq
+CJ`!F(KG9-W3B45tOg;7n"de0jl,4DIaktA8lU$F<Dqs;aX,J3&N'F0jl,4F!,")AmoguFE7lu
+<VdLGA(Q*+CfG'@<?4$B-;)'G9CF1@ruF'DIIR"ATKI5$4R=b.Nfj"+Dtb7+E1b0@;TRtATAo$
83p0F6rcrX?m',kF!+q'ASrW!A7T7^+EVNE?tsUjE+*d(F"V0AF'pUC<+ohcA7]@]F_l./$6UH6
+DGm>0e=GhF`M@BDe<T(GA2/4+>>Dj=(l/_+>G!I+B(fs/M]1A+D>2)BHV#1+E2@4AncL$A0>u4
+EV:.+EMX5Ec`FBAftW,D/]pk+<VdLF(96)E--.R+B3#c+D,P.Ci=N3DJ()6ATMs7+D,P4+CoV3
E$043EbTK7+DG_8AS6$tFEonV$4R=b+<VdL+<VdL@q]Xk@<6*mD/`ijC2[Wi+=DVHA7TUrF"_0;
DImisCbKOAA92[3EarZ6C2[WnATf\?C3(a3$4R=b.Nfj"+Dtb7+DkOsEc3(?F^]*#Anbgs+CIc;
=\_:k+Cf>#AKYYpF!+q'ASrW!A7T7^+D,P4+A-cqH$!V<+Du+>AR]RrCND*N:2b5c@W-1#+D,>(
ATJ:f+<VdL@ps6t@V$['FDl22A0><%+A,Et+DkOsEc6"AGA2/43XlE=+<VdL+<Vd9$6UH6+<VdL
+<XEG/g,1G@:UKuDffQ"Df9D6@;]TuF*)>@AISth+<VdL+<VdLBlJ?8@QcapF`_4T+ED%%A0<7;
DffQ"Df9DDBlJ?8@ODTl+<VdL+<VdL+>b3[F`\`RDJsW.@W-1#?YOJ)DIOtT8PiPb6=4/9De*3:
BlJ?8@LWYR$6Uf@+B3#c+E2IF+Co1rFD5Z2@<-W9E+*j%+DGm>DJs_ABl5&8BOr<"ART+\EZek1
D/Ej%FE8RCAfs]A6k'JG+<Ve;F_u)=/g*W%EZeq<@;Tt"AKZ).AKYAqDe*BiG$lG'Bk)7!Df0!(
Gp$d/F!+m6E+*j%3XlE=%144#+<VdL+<Vdg3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R=b+<Ve+BPDN1
E+*j%+Eq78+Du+>+E2@4G%kl;F)6+EF(fK9DD!%@$4R=b.Nfj"+C]J++DG_8Ec5K2@qB0nBl5&:
ATDj+Df-[G0eP.41,C@%BOPs)@V'+g+Cf>1Eb/a&ARmD95p0]LAmoguF:AR"+<VeDATMp$B4W30
@<3Q*DI[U*Eb/a&Cj@.EATT&2ART+`DJ()6D]iFA+>u,9+E2IF+=AO\DfTA9-X\'/@;0P#Eb0;7
-rW]-81?/#$6UH6+<VdL%13OO,9nEU0eP.41,L+CAR]\&@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.
DBMAYBln'-DCH#%%144-+A*b:/hf+)Eb0,sD.R6#FDi9o+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P
+Z_>7+Eq78+Cf(nDJ*Nk+EV:2Et&I!+<Y]9EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZup
Df'H9FCfM9@3B/uDdda%DJ()8ATDj+Df-\8F_tT!E\7e.%144-+CIT69M%rM<+$hm@<3Q#F_u)/
A0?#6+EVNE2Dd$/8S0)jDfm1?AS#BpD/XH++EV:*DBLho+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJ
EZdtM6m-GWFD)eBDfm12Eb-A(DeX*%+EMI<ATVU"DJ()9Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeq
F`VY9A0>u4+Cf(r@r!2rBl7@"Gp$U8D/`p*BjtdmBlnVC/KenEF)to'+EV:2F!,17+E2@8DfQtD
ATDj+Df.0:$4R=O$6pc?+>GK&/i#4*8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."
Df.!5$4R=b.Nh>+3A*!B-Z^DQF(HJ4Aft;J9i,+DBQS?8F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>
ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+:SZ#+<Y?+F!,17FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'
@<?3mBl%L*Gp$R-FE_;-DBMOo3A*!B+CT.u+E2@8DfQtDATDj+Df0V=De:+a/e&.1+<X9P6m-Pm
DfTE1+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'm
F'pUC8g$,H0Jj4G+<Ve:@;[3.ART*lDerrqEZeq<FCf?#ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.
1a%!_Blmp-+D#e>ASu$iA0>T(FCf)rEcW@FD]iG&Anc'mF'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(
8ge[&@ps6tDJpY<ART*lCi=3(ATAo8BOu$5+B3#gF!,X;EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2
FC6X/$6UH6?tX:o@WPp"@;]Tu?t=4tATV<&FDi:@Eb0E*DKI"CBOr<'BldrrDIdQtDJ()1Aftu&
G;!lNA0>>qDIIR2+Cno&@3B9%+Co1rFD5Z2@<-'nF"Rn/%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki
+EVNEFD,B0+Eh=:F(oQ1+E(j78l%htEb0<'F<GjIF`JTs:IH=B@<6O%EZet.Ch4_uGrcBA%144#
+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%13OO+<VdL+<VdL:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+
Gp%-=B5)F/ATD?m+Co1rFD5Z2@<-'nF!+n/A0>r,F`\`u+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E
+E(d5-RU>cAp890FCcS0E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(
+<VdL+<VdL%144#+<VdL+<XEG/g,1GF*(i2F<F0u@;]TuATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL
+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9D..L-ATBD;C1\h&$6UH6+<VdL+D,2*
@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De(J7C2PC.$4R=b+<VdL+<Ve%67sC$ASc9n
A0>u-AKZ#)B5)F/ATD?m+Co1rFD5Z2@<-'nF!,F1H"h//+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U
+EVNE@;^?5@VK^gEd8dADI[U%E+*j&@VKXmFEo!GATMp$B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("
@;IT3De(4)$6UH6+<VdL+>=s"0JG4(4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^u
FCfJFBkh]:%13OO+<VdL+<VdL:-pQUFDi:EF(HJ4Ch+Y:@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'n
F!,aHFWbmBCht5-@<Q3)FDi:CATT&:BOu$'%144#+<VdL+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,
ATAo:ATDj+Df-\9Afs\g@;]TuFD,6'+ED%+BleB-EZf(6+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%
ATT&*Bk)7!Df0!(Gp$!R5t"LD9N`KPDBNA*+E)(,ATAo.%144#+<VdL+<YT5+=D)DA7TCaF=.M)
+<VdL+<VdLA8lU$F<Dr/76s=;:/"e<%13OO+<VdL+<VdL:-pQUFD,6'+DG^9@3BH!G9A;++?;&.
1b1!t8g&.cB5)F/ATAn&$6UH6+<VdL+ED%+A0<7<Ch.'j@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<
BlbX2$4R=b+<XET<(/hjBkAK5Dfm12Eb-A3DJXS@Bl8$(Eb0<6ARlotDBNtBDJj0+B-:],EcP`/
F<F19/hf+)@;]TuDIn$'EX`?u+<Yi=EcYr5DK?q=Afs\u+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!
Df0!(Bk;?.@<3Q%F_u(?F(96)E--.D@;]TuEb0'*@:TfS+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k
+A*b:/hf+)A8,OqBl@ltEbT*+/g+,,AKXT@6m->TDKTB(+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0
%144#+DG^9FD,5..TCP2DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b
.Nh>+3A*!B-Z^D?BOPdkATJu9D]j.8AKZ,:AKYo'+EV:.+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!
@<-W9?r03g75A6nAoD^"ARlp)Df'&.%144#+CSeqF`VYAASuU2+EVNE?ugL5?nNR%DJ<U!A7Zln
BOPpi@ru:&F!+n3AKZ);Ec,H!+E(k(+EqOABHU]'G]e+?3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78
F(Jd#@q]Fp/g+,,AKZ&*FED57B-;8/Dfol,+C\n)Eb0<6DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7
F<F-tGAhV?A.8kg+<Y*'G%l#/+Cf(r@r#drB-:f)EZek4Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(
+B<;n@rGmh+DkP4+Dbb/BlkIi:IHRO+CS_nCh\!:+:SZ#+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#
D.RU,F!+q7F<F1'F!+J#Bk)'lAKZ&:E,]`9F<G7*F!+n-G@>c<+E1b0FD50"/e&.1+<V+#+=\LA
2'?gJ+=AOE+CSeqF`VY9A0>u4+EMIAF<GU8B5)F/ATD?m+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`
AU#>/EcQ)=F!)lBEcQ)=F!,17+EV:.+ED%+AU#>/G]7\7F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&
@;]Tu@r,RoBkD'jA3(h\.X,oODJ(=>Ed2XJI4cXQDJUFC-OgD*+<XL$BlA#78l%htG%G]8Bl@m1
+DbV2+ED%+AU#>/EcQ)=F!,+6+EVNEFD,5.FDl+@Ch7d$C`mh?@;mh.$4R=e,9n<c/hen51*A.k
6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.
+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8
Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@+@Kpa
ARfg)@!d6.+>,9!+CKVG?m&ukAnc-sFD5Z2F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l
+:SZ#%144-+<X*`BlkJ-Df'?"DIdf2A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC
+CT)&Dg*=5Ec6/CATAo4Df?hAE-!W@$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]Y
H>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"
@;]Uo@kUMa<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<Xlg
F(oN)+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,
F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/
DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJ
D..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.
+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pq
Ci=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,
@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G
0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-
+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8p
De*@#@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3
De(M9De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?
6m-#SEb/a&DfTQ'F"Rn/%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&
FD,5.A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*
FD5Z2.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$
A8,po+A,Et+CSekDf0VK+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7
F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1
/g(T1%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk
.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-
DBNA(C^g^o+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI
6k'JG+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>
$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1Bq
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-
DJ(7N0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5
A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFi
F!,17+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%
0f][M%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi
/SH88DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#g
F!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)
+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%
0d'nBA0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC
+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZ
Gps10%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)u
FCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-
AR]RrCND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)u
FCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#
F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4
.1HUn$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!
+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:0
0fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4
F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag
:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6
+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1B
D]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'
DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru
+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenE
G\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.
DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<
AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6
AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?
+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@I
ATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8
BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb
=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6
+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9o
Eb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^sl
G\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&I!+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)
E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irqF"_KK
DfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1
F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3c
FE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL
+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U
+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%ARfgJ
F)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdT
Ap&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%144#%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)
+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"
+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:
A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"
+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+
@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL
-tI3E4ZX]r@<;qc+<V+#+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])
+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4
F!,UHBl7Q+FD,B0+E1b2FCfK1/g)8Z%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9
+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*
+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!
DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(
EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%A
C1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#
Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL
+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08
DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1
@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(
Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;
A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!
+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#
%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[
A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>
G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/
Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;
C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6
F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_
F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuul
C2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(
Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.
@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@
FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo
$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7
BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlom
Gp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsn
Dg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaE
A9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0
DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8
E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=
F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9
EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b
.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?
+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"
+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A
+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`
BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A
@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bh
CLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;
Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA+
+=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<t
ASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)
@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKn
Ch\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*
+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1
@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums
+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF
@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn
04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C
/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL
+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.
Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\
D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:
Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[
+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O
+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm
5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7Bjkgl
H=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)
0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeE
Dfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWs
BlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4
?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&
A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.
FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36
F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL
+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA
741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-
E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651
@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*
+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5
BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3
F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)
E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW
6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!
Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$3
67sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9
+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW
6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/
G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@
8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*
?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.
DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+
FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$
C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE
2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!
ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC
+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'
+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V
;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8
ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/
%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=
$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"
+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!
Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#
+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$
B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8
/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#c
F(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"
F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::
3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:g
B4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6
+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#
+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU
0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'
ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$
BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9
@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po
%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@
?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$
ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).
@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>
F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s
$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A
+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'
+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/
F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL
+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6
+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.
?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et
+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'
DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A
@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&
Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.Q
Bl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$
F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#
+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\
Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0
+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#
F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,
ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6
F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))
F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9
EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4
+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7F
DId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8
@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*
D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:
DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"
Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB
-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,
+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,Xo
ARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1
+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"
A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#
+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$
AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e
+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.
@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;k
A8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%ht
A8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSE
Ec5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU
0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>Jq
FCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'
A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7
E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3
GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V
78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)
E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIakt
F)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUB
F"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$
AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s
$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6
Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#
+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD
9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2
BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*
Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$
GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/
@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1
+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3
Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_
+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S
+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbt
Df0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!
ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&
?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0
Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4
+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(
?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D
+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'
ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%
%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)
+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s
+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/
+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!
$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!
Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*
FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#
F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)
BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])
+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?8
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'
@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0
FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1
+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'
?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"
ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun
+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-
+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQ
A79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*
Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56
GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4
Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%ht
FCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTu
FD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6
ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7
DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[
+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*
AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%
FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&
DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2A
DffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&
?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,
+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(
BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#
D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@
$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8
DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCr
Bl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#
Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&
+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7C
Df-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS
/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/
+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*Qo
Bk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;
Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'
DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@
FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.
+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$
BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j
+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0
DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!
CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!
+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0
De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")Np
A8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%
A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'
BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W
3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%
@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1
A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1
FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6
F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6s
ATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1
+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@lt
EbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+
EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk
+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@
F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?
+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q
+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7
AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@lt
Ed8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1p
B6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"
+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?
G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k
+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e
$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK
%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#
+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`l
De!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7
F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<
CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl
$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5Cggcq
F(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#
/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,
F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNE
FD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5
BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i
3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6
+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i
+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#
+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<
De(J6FDYh'$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5+=+>"^HATf1E
GA2"F%13OO,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2
.1HUn$6Uf@<+ohcDfTB"EZf:4+E)4@Bl@l3@rGmh+EV%$Ch7Z1Bl5&%E,]B+A8-9274o]r@<2kb
+<Ve9AS#a%@q]:gB4YU++B3#c+DbJ,B4Z*+FCAWpAKW]_+DGm>DJs_ADf-\++EM77B5D,g$6UH6
E+*Bj+EVNECh7$uAKZ&5@:NjkAoD]4Ap&3<Eb-A'De*F#/e&-s$6Uf@;f?Ma+=_MOA8bt#D.RU,
ARm85@rGmhF!,.)G%De*AS#a%@:Wn[A0>u4+EV%$Ch4_D1+j"C%144-+B3#c+D#G4Ed8d>DfQt.
A8lU$FC65)@<3Q#AS#a%@:X+qF*(u(+EVNEF(fK9+:SZ#+<Yc>AKYl%G9C9a5uU<B<D?:t+E1b0
@;TRtATBC4$4R=e,9n<c/hen51E\7l8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."
Df.!5$4R=b.Nh)sD/aE2ASuT40eskcDBN>%GAhM4F'p,.Dg*=;Ders*+EV:.+A*ba3?^F<1ghGI
H#n(=D'3nAEbTE(/g+,,Bla^j+<Ve?ASc=,+A,Et+Co%lC`mq9FD)e=BOr;qBl7@"Gp$g=@rH4'
@<?3mBl%L*Gp$R-FE_;-DBMOo3A*!B-Z^D=DIal$@<-0uATA4e+<Ve!-Z^DAG][M7A7]9oE,oN"
Ble!,DBNY2FCf)rEcWiB$4R=b.Nh)sEcP`$F<Ft"@Wl-%D/X<#A0><$B6A'&DKI!Q+E).6Gp%3;
CLqQ0@q]:k@:OCjEZf14F*)IU%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfU
Ec5h<<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^
+>"^WARuulC2[W8E+EQg%13OO+=\KV6tp[Q@rri(AS,XoBln'-DBNA,E+NotBm:b/A7T7^/e&-s
$6Uf@+DkOs:K&o?Bl8'<+E1b2BQG;)A7T7^+EVNE@rH6sBkMR/@<?4%DBO"3@ruF'DCuA*%14=)
,9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D6
7:^+SBl@l<%13OO+<W-V:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)
6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue
+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2
+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3
/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[D
AoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a
%13OO+<W-V:1\Vl8p,)uFCfJ8CggcqE+EQ'@:Wn[A0>8[F(oN)8oJ6VBlmp,@<?'5E+EQg/Kf+G
AKZ).AKYMtEb/a&DfU+4$4R=bC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j
@j_]m%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<
%13OO+<W-V+B;<5F!,17+CJr&A1hh3Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j7
85rPb/e&-s$6UH@+Auc_ATD@"@qB^(FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk
/e&-s$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/
%13OO+<W-V?t*b[FC65#@:O(qE$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5
DK?q=Afs]gE-ZP:EZf1,@WNZ#A7T7^+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<
@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%
B6A9;+>Pr.+>PW*3=Q<)$6UH@+Eh=:F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO
,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57
F'p,3ARfgrDf-\+A7T7^/g(T1%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V
?u9dt?m'N%@ruF'DBN@uA7]:(%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru
+@KX`+E_X6@<?'0%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk
0K1L7%13OO+<W-V8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k
%144#+<Y97EZdss3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSn
DJ*BuBjkm%@;p0sDIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.
F*&O7Df'?*F<G[D+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE
3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&ls
E+NotBm:bBD]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6
Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO
,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;
+EM+(FD5Z2+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7
+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(t
FD5W*+=M,9D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?
ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@
+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V
?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3
Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9
/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc
$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5
Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*Nm
CiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu
8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jk
Bl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.
FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@
0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2
@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt
$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3
Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[
@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,
Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#
+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR
=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.
ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNS
G%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b5
1,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cq
FCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_t
DIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g
@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58
@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNE
A8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=
F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1
F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,
EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%
A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZmDe*ZuFCfK$FCeftG%kN3?Z]k(1,:-uFD,B0+DPh*Ch\!&
Eaa'$+E)F7Ecu/.G7=m*>]XIdFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;=/ATDs.ATrP3$4R>I
FCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*+A*c!FD5Q*FEo!M@rc:&F<G[=@<<W)ASu("@<?(%%16?R
Eb/j0BQS?8F#ks-ASs,EBkqF%ARoL`/oPcC06_,GBeN.oFCfK$FCefuEc5T2@;TjqDJ+BECh\!&
Eaa'$I3<'=@s)X"DKKqBA8-'q@ruO4+D,Y4D'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I="R^6m-#S@ruF'DIIR2I3<0CDfp#?/e&-s$<(MI
+EV:.+D,P.Ci=N3DJ()(DfQt2ATV?pCi_WH$=%%OB5)71ASuX-ATD4$AUP!p>\S:kD%-gp>\J.h
Ap\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$
03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIS$@<HDklB-:r-A8Gt%ATD4$AKYl/FCep"DejbR+:SZ#
>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:
@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>%144_DJsQ4@;L"!H=[Nm
>\S:kD%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u6
05>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apo#+F(oN)+DPh*Ch\!&Eaa'$+AbHqI4bs9
+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9
D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/%144_DJsQ4@;L"!H=[Nm>\S:k
D%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs
@s)X"DKIONA7f@j@kVS8A1hh3Apo"nF`MM6DKI!n:IH=B@;^3rCjdoF$6WSp@rc:&FE;/BAISth
>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-
F>%TDAn5gi05>E9/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'
Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&t$4R>I@V'1dDL5;q@:Wq[I16Ng@V'1d
DL4ogB4u*qB4uC$DJ+B%>n%-GBR+Q.EboH-CO9#O8Q/GO:..lFI=#3oDfT]'CfG=gHW3O-;c#bT
6r-/m+<VdLI=5=)E+*BjEb/j0BkCj9<(KSZ:dIiE:IBP9+C%9PD/Ej%FB!0oHY.D:C`m\*DIdZq
+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BRL<s>\JD%ATDU$DJOT2DfT]/Amo1\
FCf]FHX'<aEc#6$<,ZQ!AoD^,BkCd`ATVL.+<VeTI9Trq@:s.lAS-:'An*l6DfT]/Amo1\FCf]F
>p*B>Df'?&DKJirCO9Z3Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBuA0>T(FCfK)@:Njk
GAhM4F+"K)>\JD%ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7E,961+<VdL+<VdL+FSZB>]=+a
ATD?oHYI)%3bNJPCh\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".N$=%7i
E+O'+Bl7^5BkCd`ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m@ruF'DBL&EI=5=)E+*BjEb/j0
BkCj9BkCd`ATMEmFD5Z2I9dt#6Z6gYASuThDej]6DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXF
Bl7R3%16?RH#R>8Ch[d&HYI)%I=#3oDfT]'CfG=gHYI)%+<VdL+<VdL+<VdLI=5=)E+*BjEb/j0
BkCj9BkCk'>p*B>Df'?&DKJirCO9Z3Ec#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&<F%16?RH#R>8
Ch[d&HZNb?C2[X!Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSCI9Trq@:s.lAS-:'
An*lCATV[*A8Gt%ATD4$AURi,>XNFHD.RU,<,ZQ!E,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^W
ATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAUP!p>\JD%ATDU$DJOTAGAL]0AU%g-GAhM4
F+&C?:2b/i@;Jn]CO:2JCghEsG\1u?DfTB0+FSZB>]=+aATD?oHYI)%3d#X_@<?(*Ao`*6Eb'6>
>p*B>Df'?&DKJirCO:2AGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3
G@_n@Ea`o0F_>N9-[cF2>\JD%ATDU$DJOTCDfTB)BlncM>Y]3XD..6[Dej]DDfTB)BlkI?+<VdL
+<Z)\>?l,UB4Z*pAp\6(@legPEb'!#FF@F;>XNFHD.RU,<,ZQ!D..3k+DbJ.AU#>0Ec5e;GAhM4
+Dbb5F<DuW.=DX4>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%13OO>]Y$sF(Jj'Bl@m9
>]aP%FEDVOC2[X!Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0
F)Po,+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lVDe!p,ASuT4FCf]=+DGp?E,ol,
ATMp(F"SS,F<G"5F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<WsdC`me;
F`Lu'+Cf>#AKY].+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%16?SFCf:u$6UHrFCf]=FEDkE
De*ZuFCfK$FCfkCA8bt#D.RU,+D,Y&B5M3tFE8R5Eb-A)Bln$"E]OX:+<XouAS5^pHYIS5D/"<-
I16N++C&W&ASiPa@<--oDg-(AB6%p5E$/t8DJ()&De!p,ASuU23Zq[NATD7-1*AS"A8-+(+=CfB
Dfp#:@;TR'HjpE*+C&W&ASiPp9OUn3=BltiF_56"G\(D.D.-ppDf[r^>]s\!@XL!TA8-+(+=CfB
Dfp#:@;TR'/14eCG%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'H=_L6$4R=g+C&W&AShk`,p4<Q:2b#%
8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_ATD$fDf9`8DffQ;<+oue%14C(
+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]Tu
BlbD6@<--pA.8kl+<VeNBln#2E-#T5A8a&=@;]Uo@j#;nCh[a#FCfK6/g*T+ATE'<BPD?s+DG^9
@s)g.Gp$@6AU&<=FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq+EMIDEarZ'@rGmh
+D>J%BP_BqBQRs+B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%FEDVOC2[X!Blmp,@<?(/-Z^DDART+\
EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmq^,p4<QFD,B0/e&-s$7-g"
@V'1dDL6P<EaiI!Bl/8-$7-fi67tA_IXZ`p+F>4`CghEsGT^mHD.7's9PJBUF!,OG@<-HZEc5eX
+u(8aI16N0+AP6U5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#I16NgASu%*ASuX-ATD4$AUP!p%16?]
F^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9$4R>IFCf]=FEDkEDe*ZuFCfK$
FCfkCEcl8@+E)-?=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9Fc8hO@\Df9`8DffQ;
>]aP%FEDVOC2[X!Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&@;]Tu@V'h'DIbAJ%13OO<,Wn%
F(HJ!FCf]=FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn
>\S:kD%-gp+A$HlFCB!%+A,Et/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*I
CM>FfA7TUrF"_0;DImisCbKOAA:8es:IKURBlbD*+A*(M+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;
DKBo.Ci!Zn+EqOABFP:k+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>Fu@:O._
DLHkN@:O._DLF,H$=%:eAShk`+<X6nF*(i,C`l>G6rQl];F<l*%144#>\J.hAp\35FDu:^0/$gR
A7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR:K::[7=>UP
+<YB>+CT)-D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+C'#"G]\%LHZ3D'D..=1/g*`-+Cf>-
FCAm$F!,R<AKXT@6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*D]iM3Bl%<&8l%i-+A,Et;bpCk
6U`,+CiaM;@rH7,@;0V#%144#>]aP%FEDVOC2[X!Blmp,@<?'5I16NgBlmp'%144#8T&Tk@;Ka&
@3B'&EcP`/F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*@;]Uo@kM\?B.n[[E+*WpDe"2J%144#
>]aP%FEDVOE+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/+CT.u+C\o-Df0).%144#F*2G@
DfTr@+A*btH#@_4GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:EcYr5DK?q@AT;j,Eb/c(D/Ws!Anba`
FD5Z2/g+,,AISth+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TF
$6UH6+<Ve3@V'1dDL5r4F_t]1@<?(/%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[Nq
FD5W*07A1ADfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*I16Mi+<Xp1@rc:&FE;/BAISth
+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+80/5I?
D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?q
Blmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A
05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#ARloU+B*Q'FCBD:
882^MCh[NqFD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTs
A79RgDJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*q
B4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9I="n(D.tRq
Blmp,@<?''8l%j'/e&-o+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTs
A79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1r??$6UH6+<Ve3
DJsQ4@;L"!H=[Nm#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp+@:3bCh+YnFCf]=FEDkEDe*Zu
FCfK$FCd(Q+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5F`8rU8l%ha$6UI.@;BFq+A*bt
@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO%13OO,p6H%
AS5^pHZit@@UX@mD1)j#,p75>EHPu9AKW@5ASu("@;IT3De(4)$7-g5A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA0<6I%14C(D/=89-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%O
B5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Eb065Bl[c-I9]]m
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TO<DImisCbKOAA6a4fG][qJDffQ3Bl7R"AUAiR%16?8
DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2
A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5<affDDej\U
I9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)
Ch7sAI16Ng:2b/i@;Jn]CO9o7F!,m9;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,
@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?S
FCf:u$6UHeE+No0FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$Bl7Q+FD,5.B6%p5E$0FEFWbm:
DKI"CD]iS/@s)X"DKIK?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+E(d54$"a(De*BiFs(O<A0?#:
Bl%i<+BosE+E(d5-RT?1,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`
BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=
EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_
HWtn@>XW.5<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*cs
H[T.@AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:e
AShk`+<X?r@:UKcFCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1@;BRpB-:H$AU&<=FF.b@A8Gt%
ATD4$AUP\8F<G(%DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1bEbTK7/e&-s$7-g"@V'1dDL6P<
EaiI!Bl/8-$7-g2Ddd0!-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Ci<`m+FRKnFE2)5B2iebHX(Z(
G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[Nq
FD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XToF<G!7GAhM;Bl7Q+A8-'q@ruX0GqL4EFCf]=
FEDkEDe*ZuFCfK$FCfkCB4YslEaa'$Et&I!+C%TK<+T0\Anc'mF"SS$Cht58F^o)-Anc'mF!+n3
AKZ2;BlnH.DBO%>+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge+C]U*$6UHrFCf]=FEDkNATV[*A8Gt%
ATD4$AM/B?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+EM+9C2[X!Blmp,@<?''-RU#Z:-pQU@s)g4
ASuT48l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt)i$7-g9ATV[*A8Gt%ATD4$
AKW@13a?c<D/^jF+<VdL+<VdL+AP6U+EqO;A8c[5%14C(F(KH.De*ZuFCfK$FCcRB05,9@AM7e:
BPoJFASlB6+<XEG/g+tEDKU15$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1d
DL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(
G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQU@s)g4ASuT4
8l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0H$p,/%16?8DfT]'CfG=gHZNb?C2[X!
Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foKFCf<.
>]aP%FE)GAFCfN-DJ*csH[U;b+<VdL+<VdL+C%9PD/Ej%FB!0oHVQm[+EqO;A8c[5I16Ng:2b/i
@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAhYBQ%a!05>E=
DD-*CD/`a%AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBsBl8'<I16Ng:2b/i@;Jn]
CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAiSFCf<.>]aP%FE)GA
FCfN-DJ*csH[U;b+<VdL+<VdL+<Ve36Z6gYASuThDej\p67sBQ+Co%qBl7Km+D,P.A7]e&I16Ng
ASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eASiPgATT&5E-,f4DII?(@<H[*DfR7I
.3NhKFD)e-H!t5t@j##uAU&<=FF/(?FD>`)Ch\!&Eaa'$I4bs9>[h8WBl88rBOPF_A:4mo>[h8W
Bl88gBkM*qBkM+$Bl7R3>?q[F>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I6q@aD..<eFCf]=
EHQ2AATMR'B5D.+I=5?qDfT]'CfG=gHQ[B@FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I:?W,@psOl>]aP%FE)GAFCfN-DJ*csH[U;b+C%9P
D/Ej%FB!0oHVQm[+EM+9+A?3CAQU'`F`_;8E[YuX+EV1>F<G"0A0>DsEb/a&DfU,O%16?ODIe)b
BkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B!?"+C'#"G]\%LHY7A<Ch\!>+E)-?
FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4$6UI(ASu("@<?(%
+C%TK<+T0\Anc'mF!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<+C%TK<+T0\Anc'm
%144#BlbD0Bm+'*+EV:.+D5_5F`8I@@;TR.%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p6i@E,961
+=CoBA8Gt%ATD4$ALATq67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ(+C&JqA:&K2EaiI!Bl/8-
$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!B6%s-BlkJG
>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;b
>XNFHD.RU,<,ZQ!:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT_DD$=%.[A:$j]B4u*qB4uC$DJ+A,
$=%.[A:%6g@:Wq[I16NgBlmp'%144#<HD^o>YJR*AQXD'D]iP.D/a3*AKZ).AKYT!Ch7Z1B4Ysl
Eaa'$A0>?,+C'#"G]\%LHY7A<Ch[uDI38t+%144#5p15^ASc0*F(96)E-*3N>]aP%FEDVO@UXA,
+E)9C>]aP%FEDVOF(ftN+DGm>GB.D>FCf>4FDi:DBOr;kFCf]=FEDkNATV[*A8Gt%ATD4$AUP!p
+<Y3/Eb/a&DfU+GFD,*)+EM47GB4mKBOr<-AT;j(DI[6#De:+s9OUn3=BltYDf'H-CghF"Df-\-
Df'?"DIdf@%144#%144#7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=FEDkKA7fXd
FCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5CghEsG^V1e=`8G'+Cf)'Bk(]s
GA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHkDJ<U!A7ZlnBOPpi@ru:&F"SS)
DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth+C'#"G]\%LHV.(%9PJT[Eaa'$
:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H$=%.[A:%m*F_t]1@<?(/%13OO
<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>@;^00FDi:1A867.F=n"0%16?L
AS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=FEDk%:IIljFCfK$FCe9hARTFb
Ch55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&+Cf>+F_u#;/g+,,AKYMpAmogu
F<G:=+EV:;ARuunF`\aJBPDN1D..]4Eb0<7Cige6DBO+6Ed8dDDf021DIIBnF!,LGDJj0+B+51j
+EVO7ATVTsE\8J6D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='+Cf>+F_u#;+Cf(nDJ*NA%13OO
>[h8WBl89@ATD6gFD5T?%16?LAS5^pHYmnAFD56'Cib#O1OWJ4F(Jj'Bl@l=HX(9&A7^"'@;TS(
>n%-GASu%*G%G]'@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+Eqj7E-!.<Df021
F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;Ci!Zn+C]U=>]aP%FEDVO=&M=\
9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/+<X$b@;]^h+EV:2F!,X7Cis;3
BkAK5Dfm14BOPdkAKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!+Dbb0ATJu&Eb,[e+<YWDARf:_
A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig*n+<XoTCh7X/
<,ZQ!>]aP%FEDVO4t\HOI=3^W$4R>IBlmp'+:SZ#+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<B8Gp$g=
@rHC.ARfguGp$d7B4u*qB4uB0>\.bkBR=rD@;p0sA:5S0Dg5i(+A*boDfor=+EV:*F<G(3DKK<$
D@Hpq+Dkh;FEMV8F!,C5+EMXFBl7R)+CT.u+E)@8ATAo3FD,6++EVmJATKIH<+oue+CT)-D]i_3
Ch.T0AoD]4GB.,2E+NQ&DJsE1Dfor=+EV:*F:AR"+Cf>-FCAm$+Dbt6B-:c&@V'(\ARlp)FE2)5
B6,[J<+ohcG%G]'+C'#"G]\%LHZaOK@<?(*Ao`*6Eb'6>/0K"FAKYr#B4ZNsE+*BjEb/j0BkCj9
Fa%Y1FCf]/Ed)GBA93/M%144#@ps6t@V$[)F(Jl)FDi:7ASu("@<?''>\.bkBR=l>GB.,2E+NR.
+C%TK<+T0:+D,P4+EM[8BHVM;Eb'56FD,*)+Ceht+C\n)D..=)@;Kb*+Eqj7E,]B!+CT.u+DG_7
ATDm(A.8kg+DG^9FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkEDe*ZuFCfK$FCfkQ+B3B,
+CT=6G@_n6BkM+$+EMI<AKYhuDKTB(+D#(tFD5W*%144#BlbD*Cj0<5F!,@3@qB_&@<-W9GA2/4
+C%TK<+T/a%13OO>\.e`HY%);D.R`rFCfk0$>OKiE+*d(F##IF67sa&De*fqEc#k?F"JsdA7]@]
F_l.BA8,OqBl@ltEd8dH@<,dnATVL(F"Rn/:-pQB$;No?+B3#gF!,(/Ch4`'F!,UHARlp*D]j+4
F<D]JBOr;/A7]@]F_l.B+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQUFCAWpAKW+0DBO%7AKYhu
F*(u6+D,>(AM,*,BOu'(+CQB8DIn#7A8,OqBl@ltEd8dAF!+t5ART[lA.8l@67sC&BOr;/E+*cq
D.Rg#EcW?GBl5&8BOr;/D..L-ATAo*Bl%?'@<,p%F`V,)+EVNEF)Y]#BkDW5+EV:.%15is/g,+A
Ea`frFCfK6+D,P4+CQC3@<-I(@s)TrEZen,@ruF'DIIR2/g+,,AKW+=ATD6&-tI:<ATT@D@ps6a
$;No?+C\n)+<YfJARlo+FDi9E+Dl%-BkDW5+E1b0@;TRtATAn9F(KH8Bl7R)+<Ve@DBL&EBl7Hq
G%kK0@;HA[:-pQUA8,OqBl@ltEbT*+/g)92@<6O%EZcK:Bl%?'E+*cqD.Rg#EcW@5@;[3+DJXS@
@V$ZlBOPdkARlomGmt*U67sBlA8-."DJ()6BPDN1Anc'm+CT.u+ED%'Eb/[$Bl7Q+FD,5.D..L-
ATAo*Bl%?5%15is/e&._67sB[BOr<'@<6O%EZet.Ch4`!@;[2sAKZ#)@rc-hFCeu*GA2/4+EV:.
+CehrCcW"4:-pQB$;No?+CfG'@<?'t@<6Nt@;9^k?Q_s85uU`O;I<jIDe*2a$;No?%15is/g+4]
;GKeY7lhc$Cht59BOr;/E+*cqD.Rg#EcW@5F`MM6DKK]?+Dbb5FCeu*@<,p%Eb065Bl[cq+C]U*
$;No?+EV:.+A,Et+EMgLFCf;A+A$/fH#IgJEb0*+G%De)DL!@CAfu2/ASiP^:IH=LBl%T.@rc"!
BJ(E1DflKr:-pQU@ps6t+ELt'AScW7@:Wmk@:Wn_FD5Z2@;I'*@<,dnATVL(F!+q7F<D]ODfm0F
@ps7mDfd+C@:j(eGmt*U67sC$ASl@/AKYK*EcP`/F<GO2Ea`frFCfK6/e&-s$;Efb<(0\]5uLEU
4ZX]>+?CW!%13OO:-pQU<+ohcAoD^,@<<W1Afu2/BlbD9@<,dnATVL(+D,>(AKY].3XlEk67sB'
+<VeADIIBn+?L\oFEqh:.3N/4F(96)E-,f4DBM"`G%#30AISuA67sAi$;No?+<VdL+DPe&D.Oi(
F!+m6G%#3$A0=JeDIIBn%15is/g)8Z+<W(SH#R=D+Co&)@rc:&FD5Z2+CoD#F_t]-FE8RHBOr<*
@<,dnATVL(+>"^XH#R=;BlbD;AT;j,Eb/bj$;No?+<VdL+<VdLDf0B:+=JaSDKKH&ATB4BBlbD,
F`MM6DKK]?+D#e/@s)m)A0>f4BOu3,FEqh:F!,[@ChsOf:-pQU+<VdL+<Ve9AKYr#F)to'+CT=6
@q]:k@:OCjEZf14F*)IG.!&s2+CoG5@:F%a.4u&::-pQU+<VdLG%#30AKY].+CT.1AU%crF`_&$
Ch4_]+D#e:Eb0<5Bl@l3FD,*)+E2@>A9DBnF!+m6G%#30AIStU$:.TX8P(m!+<VdL4!5q%Bl8$(
B4Z*4+EqL1DBLYVF`V+:@<5pmBfIsmBl5&(F_u)=+=JodDfQsT.3K`U+<VdL+<VdL+?L]#+<V+#
6VgN]7R9C@:Jr;s+=JaSDKKH&ATB4B@rH4'Df0-(FE8R7DfBE%A0>T(+E)./+Dbt7E$0+.F)rHP
0g'_D1,L[6+<VdL4!6730F\@W:IA,V78?fM8OHH"4!5q%Bl8$(B4Z*4+EqL1DBLYVA8,OqBl@lt
Ed8d<De!p,ASuT4BlbD9F`\`S0Hb:S+>G;f+<Vdg+>F<46r-0M9gqfV=%PeZ80Bu:-nB"LFCf)r
E[`,TBk2=!+E(j7C3=T>BkD'jA0>E$@s)X"DKI"CAU&;>-o*J=Gs!i>2(9Xj4!6F9%15L'9i+;F
6W?iZ+?L\o.qrmCAS5Rp.3NP<C1UmsF!,"9D/a&s+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$
+<VdL+<W`g2)#IH7n$BH5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,L7FE2),G%G2,Bl5&3DIjr,
Df9S;E+*g/+=Jru4F'%E0Jka<+<VdL4!6:90F\@c<E)FR6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0
+EMXCEb/c(Bl5&3DIjr,Df9S;E+*g/+=Jru4F'%E0Jka<+<VdL+<Vdg+>GQ(%16!%<'a)N5t=?d
+?L\o.qrmCAS5Rp.3NhJASrVF+EV=7ATMs%D/aP=@<,p%F('6'A0>T(+CoV3E-!-M0Hb:S+>G;f
+<W`g0b"I\5uU<B<D?:4+<W`g-nB"LFCf)rE[`,TBOu'(0d'mIBOPsq+DGm>E,oN%Bm=3"+EVNE
A9Da.F!)kb+E)9C0e"4f+<Vdg+>F<4%15is/g+%f:K0eZ9LM<I+DGm>ASlC.Gp$RA+Co%q@<HC.
/g*_t+DGp?BlbD<ATT&:D]iI2-u*^0FD**G8g%V^DJ!TqF`M&(+:SZQ67sBmDerrqEZe7U:K0eZ
9LM<I+E)F7EcPl)ATJu)Bk)7!Df0!(Gp$pA@psInDf0V=AoD]4-uEdA.3N87DImisFCeu*F(96)
E--.D%16!/:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)CF"&5Q@rc:&FE8RHD]hXp
AoDKrATAnT+:SYe$;No?+EVmJBk(Rf+Du+8ASlC.Gp%0>FED57B+52C67sBY:JXqZ:J=/F;BS%D
-t?q!Ea`I"ATB4BEb/cqEb/a&F!)lJCi_$JF(96)E--.DFDi9o+D,P.A7]d(4!8upF(KAFC2[X'
Df9_?%13OO:-pQU6#Lrj@:Wn[A0>i"Ea`frFCfK6+CT;%+EMXCEb/c(Bl5&8BOr<'@<6O%EZet.
Ch4`5BOu&j$;No?+CfG'@<?'k+CT.u+Co2-FE2))F`_2*+EVNE8l%htA8-'q@ruX0Gp%$7C1Ums
F"SRX%13OO:-pQU=$]_Z8PVc:+EqL1DBNJ$Anc-sDJ((a+D#e:Eb0<5Bl@m1+C\n)@psChAp%o4
@:F.tF<G[=AKX&W@q]:k@:OCjEZbeu:-pQUFD,5.8l%ht@rGmh+=Lc>FCAWpALSaDBOQ!*E+*d.
ATJu9BPDN1F*)G:DJ()+F!,LGA8,mlDKK<-GqKO5%15is/g*MW:g$[f7n?T%4!5q]BOPpi@ru:&
.3L\p6#:?[EbT0"FE8RFATMF'G%G1n$;No?+AH!85uL!C78u]R+?L\o.qrmCAS5Rp.3N_GAKYE!
F*D29+?L]&1(=R>%13OOC2[X%Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(
Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\+EV:2
F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOABHVD1
AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'
AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht
+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'G%ku8
DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*
DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo
78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<@<<W(
Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.
F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*nb<(/hjFDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0
+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\no
DfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%13OO:-pQUF(KG9
GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g,"FDJ<s1D'3e<Bl8#8
E,oN"Ble!,DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+A79+^.1HVE+Z_>4+BosJ%13OO
:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+Deru-F(or3+>"^EF`_P=@<?3n+D,P4+Dbb0Fa,QV@:Ls)
DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/
DfTD3FD,*#+E)./+A,Et+DG_7FCB&sAISuA67sBtF_l/6E,9).8l%htBl8!6@;]RdF!+n3AKYr'
Ec#N4FCeu*@Wcc8DJsV>Eb/a!D/Ej%A7]9\$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(
Eb8`iAKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*
$=e!aCghC++=Cl<De(4)$4R>;67sC!G%G]7Bk1ct779L=:/aq^73F0)F(KG9-u*71DKB`4AM.P=
ALSa5A8-.(EZcqVF`V+:Ap%p++E1b2BFP;D67sBU8PN#B+CfP7Eb0-1Cj@-l6pjaF;bp(U+DGm>
GA1r*Dg-7FDf0B:+>"^WAS!!-ATD6&-tRKL+:SZH6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%
DeF*!D'2;^Ch7Zm9ke*XDf]i/F<FU_+@C'XAR&_`A7[B)G\&'H%15is/g*SN6VgHU:J=2a@;9^k
F`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,
%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8
-OgDa84?EF5tsp63Zoe`Df'&5%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T
8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk
4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ngAZ3Zoea
DK]H)Bk/>7GUXbVARTUhBHVA<EbTE(-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$;X;d8l%i/
0g.Q?+=D&F+E(_(ARfh'-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5
F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</I
De*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!
%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6i
De*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC
+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$
+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu
@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'
F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu
@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'
A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaE
A9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e
@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk
+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A
+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ
;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ
+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-R
G&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=
ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&=D@<H[1Ci<s3+EM75ASuU+Gp"[]GA1l0
+EM47G9CIAE,95uF<GXADfp/@F`\'"EcF6'0d^p_F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F
/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2
EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6%16ci4ZX]?+D>S1DJUG"3Zri'
+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*
Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eIDfp#?
%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef@p`YZ
De*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1AhG38
@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U/g,Qp
+En8%.1HUn$;No?+ED%1Dg#\7FE1f(Ch[d"+C].qDJLA8Dg-73$?B]eFCK9/G<Iu0>p(A@+BplL
/M8/M3Zon)0-W+n><3lV/h^H^+=A9Z-9VeF%15is/g+SAE+NotF!,RF@;0OlDJ().Bl7K)An>Oa
+Cf(nEa`I"ATAo-Aftu&@qB_&@<-W&$?U)r4ZZjk/0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\
.3`+.$4R>;67sC%BQ&);Ci=3(+CoD#F_t]-FE7lu:-pQU+<VdL+D>S%+>=o\+<Ve%67sC)DfTB0
%15is/g)8Z+<Ve?Ch+YD+<VdL+AP6U+D5_5F`;C2$;No?+<W?\0d&.mBP_3%0H_J\:-pQUA8bt#
D.RU,ARlp$Dfor=%15is/g)N:8PN#B-Qm)=A0<QK+AP6U+EqaEA0>E$@ric:Bln#2F*)G:DJ((>
:.\/V3[Y@D:-pQU+=LM</34mu5\OtE+ttGgBeCMc+AP6U+Cf>4DKI"3De!i2Df-\:@<?/l$>=6d
4ZX]5-RL*"+?Co-+?CW!.1HVuAhG38@:Wka?X[\fA7$I(+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH
0JXbkATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+Eot$+F,)?DJUFC-Qlr</g,?\Eb0?8Ec*KP
ASu$2%16f]/g)i2,:5SsG<IQ$I4cXd+CoCC+E)%&@;9^k?Q`-;8P2cH0JO\jATW'8DD!&CDIb@/
$>F*)+C\biEarHbC2[Wi+CmVf+=JXb/pSls3@Q(`ATT&=+CoCC+ClU8ATW'8DD!&CDIb@/$=l:P
+ClT>INU<e4<Pjq4s2R&HQk0eA3DOf4u%Cp%16f]/g)i1,Bt>AD_</C4Y@jf+<u=X.kWJ?.!R(-
/h&,2+>G!c+u(3N+D#G$/e&.90Hb]d0d(!U+=o,fEb/^%@WHC25U]o"/mg@_5]ggS5U\3:-::Z[
-8%J)0d(fe0d(!9$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=
D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47
Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:
G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZk
F)sK*+>>,f3ZpI31a"h%0I[G<BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8
F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdL
A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!
0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;
67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQU
GAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9
F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)10IA&++?Co-+?CW!.1HVuAhG38@:Wka?X[\fA7$I#
CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&DKK5m
8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIE
AS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaAP/g,1GG&JKN-Qlr</g,0W
Eb0?8Ec*KPASu$2%14M(/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+EBUtI4fOL$7QDk%15is
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
E+*j%%13OO:-pQUCi<`m+CT.u+EM47G9CWCF(96)E-*47Ec5e;@rH6sBkMR/ARlp&@<?/l$>OO$
4ZX]i3Zp+"3\W6B+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>
@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`
;a!/a0ea%D%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>H
Afu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,
+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9
A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q
+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!
$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g,4HF<G!7E,oN%ATDg&A0>],@ps0rE+*WpDdsn4
/Kf1WARlomGp"MMDe*ZuFCfK$FCcmD/Kf.UGp"MZBOu3q+E1b,A8bs,%15is/g*tg77K^D;FNuM
5u'gD6TmIQ-UTq"<HD_lF'N?hDK9H$/p25HEa1nLE(",V@9cKE@ps1Y:gn6PDe!$k@;]Uo@j_]m
:-pQU:f9_O78d#P6r60E6r-053Zoe'F`VRVCi<flCbK73DD,s;DIdZq-OgCl$;No?+A,Et+Eh=:
@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?@<6!-%13OO
:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=GD]it;
ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4
ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kkEbupH
E,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<+BosE+E(d5
-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1D..<rAn?%*C2[W<0ht%f
+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U
:JO&6-S[5./heD"+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0
DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16ig
A1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99Z
G]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16igA7At_
05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.
F"VQZF:ARlDe*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8A7KakAM.q>B+52_De*Bs@kVe3An5gi
05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!
@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em
/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63
A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(
GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@
Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4@WcC$A8,po
/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3
@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*mCj@.DARfXq
D.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL:/ihg8l%iC
:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3
DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,
F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&
$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(
%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b
+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3e
Ch4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTs
A79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W*+:SZ#+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-
ATBG=De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Ado(r%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt
@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U
:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?1
9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F
/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm
:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j
@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.
A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<icl
ATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN
78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(
@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.
EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N
6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;
C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,
+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-
F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]o
F*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIa
F<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP150H_qiA7]p3%15R#9LM<I4ZXs'ASu("
@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen
7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gk
F`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!
+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$
F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`B
BOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0
@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht
@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*
F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*
%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^
+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/
FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WG
Bl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3
De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#
FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:B
F`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI
$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;
D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9
Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc
$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDkD0]l7
A8lR-Anc'm1,2Nj/h1^`C2[X%Ec5Q(Ch4`1/M/)^Gp#^T6m-#S@ruF'DIIR2+E2@>Anc'm/e&._
67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e
:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-
Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,Oq
Bl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE
+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S
:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[
F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5
ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7
F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+
8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67
Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$
Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"
+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1
@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1
+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0
EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u
?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$
Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlom
F`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+
@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4
-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96
+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mF
DJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']
ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5
,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+=Lr=
De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuC
A7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWr
De*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#
C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3M
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH
0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGT
A7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)
+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y
:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,
+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*
ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[Flo
De*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef
@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@
/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu
+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCI
FEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$
/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%
G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49
A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,Oq
Bl@ltEd9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&Ifs
FD!`t+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV
+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+EV19
F<GX=Ch7L+Cj@-T+E).6Gp%$JFDuAEF!,[?@<<W7F(KA7F(KH7%17,q4ZX]?-?=3M%13OO:-pQU
Ecl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m
%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#
$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'
+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'
+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+
1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-
CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_C
A1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(
+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUh
BHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*B6%p5
E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4
F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+
-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;
A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#
+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$?IP@
+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4
-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is
/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A
%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5th
F`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,Oq
Bl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi
+EBUt+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]4YAE2B5DKq
F!a'nE]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77
?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\
A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]
?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F
@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi
@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;A8c[5
+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)><3le+Z_P)
-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR
-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=
0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/Zi
DJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#
>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$
Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6
F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_
/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+
.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>
/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@
5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk-
-nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff
+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--
Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU
.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG
/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji+>P\r?Q_EQ
B657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5
BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI
+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#
Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pk
C2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(FD)*j
C2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>
@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`
;a!/a0ea%D%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m3[\TZD.Oi6
DfTV9FCfN8-OgDa84?EF5tsp63Zoe`Df'&5%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MAS
Bl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is
/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP
67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%
Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1
-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQUF(KG9@3BN0
AS,LoEb/c(E+*WpDdso.DBO%7BlbD6@:NtbDIjqB+E_a:A0>?,+=LuCA8Gt%ATD4$ALS&q:-pQU
:f9_O78d#P6r60E6r-053Zoe;3a>[+ATDisB4Yt$Bk&c<F(KAs6#^d2@<>p_9Q+ELCg9eFDIdZq
>]=+hA8bs*%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b
+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE
+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/
@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'k
ARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4
A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^E
De't<-OgCl$3                                                              ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3B83:2BXat0f:(/3$9t1+>Yer1,C%.0d&2/+>Pht0f1"31a"M-+>u2%1,'h+2]sh/+>Po!0f'q.
2BXb0+>Pht3$9t:+>GPm1,9t,0d&53+>Gl!1H-F22]sn6+>GVo1,V["6pamF9LMEC;cHOj=`S(`
ASuT48l%ht@WcC$A0>Q"F*)>@Gp$pAB1brf<)6:`;aOJU9LMEC;cHOj=`S(`ASuT48l%iS:JXY_
+C]J-Ch+Z%BleB7Ed8dDDeD[<6sjkAF(KB8ARo.ZEcQ)=F'j$6FCKB*+Dbt/+CT.u+ED%7E,TW8
ATL[D;cI+=De*ZuFCfK$FCf3*A8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?<)5nX?V4*^6r-0WD.I^+
F`Lu'+D,P43Zr*XFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\CBf
6r./^:IITH6S<4d<)5nX?V4*^?Ys=pDfp)1AKYT'E]P=VFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX?V4*^/o>-.F_PZ&C2[WnBleB:Bju4,Bl@m$F_kk:8l%ht
A8-+,EbT!*FD5Z2+C]J-Ch.3nF*)>@H"q8.B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2FBPDO0
DfU,<De*Bs@qT@jATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@H"q8.Ch\!&Eaa'$?Z1+%
ATqL'AU%s.A8Gt%ATD4$AKYo7ATDs.ATo7j@8pf?C2[X%@<-4+A7]@]F_l.BA8,OqBl@ltEd8dH
@<,dnATVL(F)#W(E,ol/Bl%?Q:IH=9Bk)7!Df0!(Gp%'HDe<^"ASkjnBkCptFD>`)E+*6n@;[3)
@;]dkATMr9AoD]48l%ht@:WneDJ`g"BkCptFD>`)A8bt#D.RU,E+*6n@;[3)@;]dkATMr9AoD]4
8l%iC:IA,V78?f)@:WneDJ`g"BkCptFD>`)F)Q2A@qBUf@r5Xl+DkP)BkCptF<G16EZdtM6rQl]
;F<kq@:WneDJaZ6De*g-De<^"APIFm8l%htA8,OqBl@ltEd8dHEc5Q(Ch3                ~>
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
0JbID/ibpH2`NQJ2)R661,(I?0JP:=/i>XL2)I0H1H.*41,(I?0JP:=/i>XL2)I0H1H.*41,(I?
0JP:=/i>XL2)I0H1H.*41,(I?0JP:=/i>XL2)I9Q3&!651,(I?0JP:=/i>XL2)I0N2*!K91,(I>
0JkI>/i5OE2`NNO0fCp41,(I?0JP7=/i>RI2)d<K2DmK;1,(I>0JkI>/i5OB3B/iL2DcO30JYI=
0ebI;2)dKR1GgmA1cQU50JYF<1GLmB1c@-D3B9&X0K:110JYF<1GLmB1c@<N1H73N2)QL30JYF<
1b^^<1bpdD0JGF>2E;m80JYF<1b^^<1G^jH2)$sF0Jst.0JYF<1G^^;1c7'I0f_!K1,g=20JYF<
1b^^<1G^mC2_d0J0fL410JYI=0ekR=1cR9F2_[-G3$9t11,L[>0fCX@3&<6I0fLmI+>PW+1GC^B
0J5.A1,UjI3A<0E+>PW+1GCR>2_HsB2`WfP1,V!51,(I>0JkI>/i,FC0JG:;1c[H:1,(I>0JbCA
/iGLB1,:^I1,h!31,(I>0JkI>/i5@=0f_0O1,1X/1,(I>0JkI>/i,:@3AEHK3A`W:1,(I>0JkI>
/i,:A2_d9I2`<B51,(I?0JP7=/i>@B3&N]N3A<B71,(I>0etL>/i>@=0ebF<3&WZ;1,(I?0JP7=
/i>FF1GCU?0Jtj>/1<V9+>P2t0JYF<1bpp@1bq'I1H%'J3Ar!80JYF<1bpp@1bpsG0f(O@3&Vm7
0JYI=0ekR=1cR6N2E3ZN3&Da50JYF<1bpp@1c6sC3AEKM0JY(.-p07-1aFh11,CU?0f^jC1c76K
0fUsL+>PW+1GCU?1bLU>3&riP3A`ZR+>PW+1GLX?1+kF?0fLpF3AicS+>PW+1GCU@0J51>1bpdE
1H@?P+>PW+1GCU>3A*-F2)mBH3&<Q;1,(I?0JP7=/i>RJ2)I0F3ArT71,(I>0etL>/i>F>2`*<N
2)mK:1,(I>0JkOB/i>=A1,1RC.4cl00I/>$/1<V9+>Gc"1,(I>0JY=>/i5F?2`3<D3&Wc>1,(I>
0JY=>/i5F?2`3<K3&<E71,(I>0JbC>/iGLC1GC[?1Gq081,(I>0etL>/i>@A1,q3N0fLp31,(I>
0JkI=/iGO@1cI9H3&NZ<1,(I>0JYC>/i>F?2Dd9K0K:s51,(I?0JP7=/i>I>0Jt[H1H@041,(I>
0JYCB/iGRD1,CU>2`Mp80JYF<1b^^<2)[ES2).$G2_cF10JYF=1,:U;2)I0E0f1gH2`Dj70JYF<
1GCX<2Dd0F2)[-K2`Dj70JYF=1,:a?1cR?I1c7-J1H?R50JYF<1,(R<1c7!H1cIBR1GL"-0JYF<
1,(R<1c7!H1cR3G2DcO30JYF<1,(R<1c7!H1cR0I2)cX50JYF=1,:a?1c[9F1c[EN3Ar!80JYI=
0ekL;2*!ZS1cRKT0K(%/0JYI=0ekL;2*!ZS1c[HK2`;d60JYF<1bpp@2E!6J1,M!J0fC.00JYI=
0ekR=1cR9F2_[-G3$9t11,L[>0JkC>1GgsH2`3QK3?U(21,L[>0ek:;1-%0M2`EKH2'=Y.1,L[>
0JtI?1b^U@1cR9O0d&5*1,L[>0JtI?3&NQP2E*BJ1E\G,1,CU@1,U[A2)@'J0etUH3$9t11,CX?
1,:I>1cI?I1,([B2'=Y.1,CU@0Jb=;2)@0G1GCgD2'=Y.1,L[>0f:R?1cR0E3&rrQ2]sk01,L[>
0f1L?3B8rR2)R*K3$9t11,L[>0f1L?3B8rR2*!NS1a"P-1,L[>0f1L?3B8rR2)dHP3$9t11,CX?
1,^aA3AE6F3AiZS2CU1*4>838-p014/1<V7.4cl00I\P80E                           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
