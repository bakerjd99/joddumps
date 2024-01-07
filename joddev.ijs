NB. sha256:85c1253afa6ab0998be05f454559df06d195238db0d10346caa608ddbcb1e751
NB. JOD dictionary dump: 07 Jan 2024 14:34:46
NB. Generated with JOD version; 1.1.0 - dev; 5; 05 Jan 2024 14:12:52
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
1*AD-1H6L40H`+n0ek@;+>GPm1*A>02`NZ;0f'q-+>c)53?U(3+>P&o0JG1:+?1K!+>Pi62]sh/
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
$8F.U?p%e-EFWa*De3?3Bm+f<1M/@W2f(9q12^ND?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9@>%
+<Ve7A8lU$FC650E-,f4DBN=V:JsPK9gM]W78crJ<(LC>FD,*)+EqO9C`mG0C1Ums+EV:.+CfP7
Eb0-1%144#+DkP.FCfJ8Anc'm+E1b2BHV#,FDi:1+Co1rFD5Z2@<-WG+B3#gF!,C?FD5Z2+EqaH
Ch+YsCij6/+D,>(ATJu9BOQ!*@<,og$6UH6F(KG9;FNl>:JOSd+DG^98l%i-+B*2qATVU"DJ()6
BOQ!*8K`(rEbT].+AP^3+B2,Z6r+q7F`\a?DBO%7BlbD,@<6!&Blk_D%144#+D#8/BOu3,GB.D>
AKYD(An?0/@X3',F!,RC+CQC)Bl%?'A7]7e@<,pi+AtWo6r-QO=WhX'+ED%&F_PZ&+EV:.+Co1r
FD5Z2@<-W&$6UH6Ao_g,+CQC'F_u(M+B3#c+DkP$DBO(CAKZ28F_kS2@V$[(D]in*CLnW&F<G.'
F(o3++EVNED/XT/+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$6UH6@<-:/DIb@B6ZmEiASuU+Gp#^T
6m-M]D.RQnATDi7GA(Q.AKZ).Bl7R)+CT;%+CT.u+EqL5DIml3BkAK0BOuH3B5\o0Ble?0DJ(R2
$6UH6IXZ`p%144#+AP6U+ED%4CgggbF!,R<AKYr7F<G+.@ruF'DIIR"ATJu5@<?0*GA2/4+CfP7
Eb0-1Cj@.AE+No0D..L-ATAo4@<?/l$6UH6A8lU$F<Dr#:JsPK9gM]W78crJ<(JAG$6UH6IXZ`p
%13OO1+j\W4C;Q6H>7A92Kh&l1Lam71cB,/GAMSJH8dZf5%#L#Df0W1A7]d(AU&<.DIdI!B-:T&
ATMs(?m'Q0+ED%8DfTD3E+*d/Bk):%@<*K"@:O(qE-!WS%144#+@C9lEb0-1Cj@.;F<GU8F*)>@
ATJu9BOr<.BOr<'Dg#\7Eb/`lDKI"1@:O(qE%W8!CiaMG+Cf>-F(o/rEZek*ARfLiDJ()6BOr<"
@<6*nF!(o!+<Ve;F`M26B-;5+F*)>@AM,)s+EqO9C`m\;Ddm-aCj@.3Ci"$6+D>2)BHUnqBl%p4
AKZ)5+ED%7FDl22+C]J8+E_a:EcW@EBQ&$0A0>Z*Dg*<5$6UH6F)Po,FD5W*+D>2)+C\nnDBO"1
Eb0H/DJ()9Bln#2FD,6"EZeh"@r$4+F"Rn/+<VeUIXZ_T$6UH6:-pQUEb0<6DfTD3@UWb^F`8H[
1(=R5+<Y]9F*(q8-Xpe3@q]RoB.#bt1(=R"$6UH6:-pQUEb0<6DfTD3@UWb^F`8H[1*C:DDJsQ0
DJ()*@<6*)D/"'.@<?!mATJ:f+<VeIATMs(+=CW4FCSuuDJ(=Y1bp1.2[p*:+<Z,^IXV_5%14mD
+CI<=1Lb>aFuahhF>IoZ1NYN1H>-l*BehV[G$dF@+AQKl+Du==ATDKp+Cno&@<?d6ATJu&DIaku
+Cf>-G%G]8Bl@l3F`_>6BlnVC?t1fs+CT;%+C\nrDJ'Cc+<Ve8A7T7^+DG^98g$,H2BXD'0JYJ"
@;[bS.3NhG+Du+A+D>2,AISth+<Y&FBl8$(B4Z*<055<GAS5Rp1,!?ZFCf)rE\oF]Ci<a(Bl7Q=
04o$=@<?4$B/D8RCi<a(Bl7Q<2IIYOBOu'mG%G\:FD,6+AKYE%AISth+<Y0-@;]^hF!,RC+C]&&
@<-W9Bl8$(Ec,<%F!,1=+DG\3@:OD#+A,Et/g)9.-['&D@;Ksq@:XX+BPDQ2@3B&uDK]T3F(oQ1
+E2@4@qg!uDf-\/EcQ)=/e&.1+<XWsAKZ&*EbSru+CoV3E$/b2Ec#6,+E_aJ@;Kb*+EqaECNCV2
DeX*%+D,P4G@>N&+C]J8+A!\aD'3>,DI[6uDIm?$@:F.tF<G(6ART[pDJ'Cc+<Ve;F_u(?F(96)
E--.DFD,*)+EqO9C`mV6F<GC<@:UKpDBNk6A7]d(8g&:gEcYr5DK@EQ=(uJe+D>2,AKZ)5+Co&,
Bldi.F)Po,+EM%+ASkuf$6UH6FDi:3DfB8?%13OO1bKnY4C:*aC,9d?1N@PP2`Yf$ASl3?1hLMW
F_!775%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHVA1A7]7ZEZet.Ch4`2D]iM'DIIR2+C\bhCNXT;
/g(T1+<Ve*Bm:b<F_tT!Eb/c(?n*dCC1^irAnc'mF!+n3AKYK'ART[lA0>?,+CQC%@:O(qE%W84
BOuH3F(fK7Ch+Z+AThX*+C\n)@;L$sEb/c(@X0(g:IH<7$6UH6@:s"_DBNA*A0>>mBl7Q+@UWb^
F`;CEBl8$(B6%^.Gp$gB+CfG+FD55nCb?i0BOr<-Bk1db@<*K&Bl%?'GAhV?A0>>m+EM76E,9).
FCf]=+D,>(AKVEh+<VeNBln#2;b02+1,Us4BOPsqATKCFBeEsL%144#+F\cgILQW,+<WKrC1Cpc
F(f-+/p)>[%144#+AP6U+Cf>#AKW]d+E)-?@W$!)FCfN8F!,R<AKYGj@r$4+F!+n(@;0V#F<G7*
F(f-+%144#+>Get@W$!)-S?bU$6UH6IXZ`p%13OO2(g"Z4C:$nBJVS_3GWGG20WhHE,%3`@X<*8
DJ_@?5%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHV5&C1Ums+D,%lBl%L*Gp%3B@<<W9Bl%T.F*)>@
AKYD(;b02+1,Us4BOPsq+EqL1DBNn@FED57B+51j+<YT3C1UmsF"SS,+CT+0FD,B+CM@[!+CT/+
FD,6++E)4@Bl@l3@rGmh+CHo_?m'Q)@<<W9Dfol,+Dk[uDBO"BDfTD3@3B5lF(c\7D@Hpq+<Y'2
F`_"6DfQtBATMr9@3B5lF(c\7DBN>"ATV;h$6UH6IXZ`p%144#+<XEG/g,@VEb$;,F!,FEF<G"0
A0>;'BOPsq+DGm>F*)>@ARlotDBN@1Eb0<'Ecu#)+EM@;F=n"0+<VdL0H`)/+E2IF+=DAOEb$O,
$6UH6+AP6U+D>2)BHV#1+Cf>,E+*cuA0>u4+Eh10F_)\9ATVs,AThWq+>"^IEcQ)=+DGF1D..Nr
BHUnqBl%iC%144#+<W?\0fL4fATT%BGAhM4-OgD*+<Z,^IXV_5%15!G+CI<=@W-@*1NYBqA9<#S
BlmoECMS3@BeV7uG$dF@+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*
Dg-7FAnc'mF!,C=+CoM,G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6
+DGm>De<T6+B3#cEb-V>+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!
$6UH6A9)C-ATJu'F`\a6An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7
Ch[Zr3XlE=+<Z,^IXV_5+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0
/no'4-OgD*+<Z,^IXV_5+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\A
Bl7I"GB4mJH#n(=D0$hDBOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&
AM7V.BJ4+EDfTB0/no'4?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/
%144#+EqL1DBMtV:*=7l+E(k(/e&-s$9'R[?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?
<+U,m+CJr&A8Gt%ATD4$ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>%
/g)9E4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5
Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdk
ARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO3A)Es+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP
@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+
BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$8F4e+<Ve74C;VRA9;F!A2,odE-?&+FDbT%12pYZBQnB%
5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBe
GT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<
+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*BmF*)G:@Wcd,Df.<b
:-pQ_@WcC$A86$nA8-+,EbT!*FD5Z2+EK+d+D,b4C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&/e&-s
$;No?+CfG'@<?''FCf<.DfT9,Gp%<LEbfB,B-;#/@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGjn
@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\
6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"
ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22
De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]Bl%<&F`_>6Bln'#F!+n/A0?&,EcYr5
DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%15is/g,4HF<G+.
F*)G:@Wcd,Df-\.Bl[cpFDl26ATJ:fC1LjhE]lH+-V@0&6r-0<8Q$[':IJ,\5t=@38Q$[':II]E
<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?6q0R9;BSS-6rR&N7n#gA6UXLD-OgDtA7TCp
4ZX^#A7TCp+=nW_+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-6rQHN8PiAS8Q$[':IIWR<)Z1V
;C<Rr$7KY"A8-'54ZX^,ATVC(Bl%<jBl\8;0F\?u$;No?+D58'ATD4$AKYMtF*)G:@Wcd,Df-\=
@rc:&FE7luF`:l"FCf3*A8PamBkCptF<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\
5t=@38Q%WB:II]E<(';U4%`::5t"+::..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&
C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU
9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2+A,Et;cH%Q779^F4%`::7nHZJ8Q%WB:IITH6UXLD%15^'
6rm#M+E_X6@<?'qDe*p-F`Lu'A9Da.F!+(N6rQl];F<lO<'a#C6qL8c$;+)^<_Yt)Eb0&u@<6!p
De't_:IJ,\5t=@38Q%WB:IJ,\5t=@?6q0R9;EIKH6rR&N7n#gA6UXLD4%`::7nHZJ:I@NA;@NsB
$;No?+Co&)FE2;F+C]J-Ch+Z)De!3lAISuVDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDC2[WlF_PZ&3B9*,%13OO%16c_F*)>@H"q8.1,fXLB4YslEa`c;C2[W*/KeP:@;]^h+D>J1
FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0eP.&/KeS8Fs&2WBlGL1
$4R=b.Ni+m76s[V+CT.u+CJAE7pmHV@:O=r+E)4@Bl@l3@rGmhF!+n%A7]:(%13OO%14=),9S]n
0J5+<+@0seBl"nK/0H]%1,C%$;fHbkDJ((`DIdHkFDYT,FE8QnA8-."Df.!5$4R=b.Ni,:ATqZm
+Du+A+EV%-ATJu%A8lU$F<Dr/78uQE:-hB=-Ta%j+CT.u+CJ`!F(KG9-UCZu8P(m!-Ta%j+CT=6
A7]@]F_l/@%144#+<YlAASrW#Eb/[$Bl7Q+DIn#7A8,OqBl@ltEbT*+/e&-s$6Uf@+@.,fATo89
@<,dnATVL(+CI`+;b0;V9i,4?BOPs)@V'+g+CSekARlp*D]iG&De*fqEc#kMBkh]s/g+,,AKYMp
AmoguF:AR"+<Ve@F!*1g+EVaHDBNk0Afu;3FD)dN/g+5/ASrVF+CQBk83ng_2)ZRj@<6*)BlbD9
Eb/isG\(D.FDi:DBOr<-FCB33+E(j7A9Da.%144#+<Y`8EbTK7F"SS7BOr;uDes6.GA1r-+EV19
FE8R:DfQt2F_u(?F(96)E-*4:DKKH&EbTW@3XlE*$6UH6+<VdL+<Y0-CM7-tBOkt!?X[\fA7$H,
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A-OgCl$6Uf@+@.,fATo86@:O=r+E;O4
Ch[KqATAo$8PiPb6=:pGDe*E%BOPs)@V'+g+CSekARloqDfQsmF`;VJATAo2DffQ"Df9E4/g*o-
FCep"DegJ-Bl%@%%144#+<Y0&DBND"+EMXCEb/c(@<3P`:IH=B@:O=rF!,[@FD*]E$6UH6+<VdL
+:SZ#+<VdL+<VdL:-pQUEb/Zi+Du+>AR]RrCER&'A0>r8DfTCu$6UH6+<VdL+<YB;H#@(S3ZrQe
AiLoRART*l-Z3jEAR]RrCG'=?H#@(=%144#+<VdL+<Vd`+E2IF+=D&FFCep"Dei]oE-Z>1-Tamr
=\_:j@;9^k?TVt@H#@(#$4R=b.Nfj5BOr<*F`\a:Bk)7!Df0!(Gp%'7FD)e2F!,@=G9CU;+EV:.
+D>=pA7]d(@rH4$ASuU2+E(j78l%ha$6UH6+CoV3E-!WS7W3;iAU%X#E,9).FD,5.?tsUjA7]pl
+Co1rFD5Z2@<-W9BOPs)@3BMtFD*]E$6Tcb+<VdL+<VdL+?MV3C2[WnATf22De'u5FD5Q4-OgCl
$6UH6+B3#gF!,F1FD)e@@<3Q/Dfd+@Eb0E.Dfp,;Gp%0ADg-(O+:SYe$6Uf@+@.,ZF_;h2DKKo;
A9DBnA0>T(+Eh=:F(oQ1+=Jrs0J5+:.3N;4F!+q'ASrW#DfTl0@ru9m/g*G&A7]@]F_l./$6UH6
+Dk\2F(&]m+Eq78+DG_'DfTl0@ruO4+EM+9+DbUtA8,po+EVNE?n`]]2Du[sF`\`R-[0KLA1&a4
+D,%rCisc0F!)l08Ol<#/e&.1+<VdL+<V+#%14=),9S]n0J5+;+@]pOEckf2Gp"k%/0H]%1,C%$
;fI")6=F\HDf9M97:^+SBl@l<%13OO+=\L++?;&.1a$gMDIIBnA0>u4+A*b:/i4\ZDIal3BOr<&
@<ld6F<GL6+?:T+0f1"s@<3Q$BOPdkARlp*BPDMs$6UH6Eb065Bl[cq+CQC&BOPdkAKZ)5+CJr-
DI=T2BPCsi+Cf>,E-686F!+m6Ao)BoFD5W*+Eh=:F(oQ1+Du==@V'R4%13OO+=\LA6r6QK9hA;l
+Eq78+C]J1E+NQ&F`8IFD]gqp/g*_t+F.mJ+Dtb%A0>`-Eb-A8BOPd$2DcOeBk)7!Df0!(Bk;>p
$6UH6Df-\CDfp(C8l%htE+*j%+F.mJ+CT;%+CoD)DJ()5Df''-BPD?s+EqjEDJ(+8%13OO+=\LA
E-688F'p,!A867.FCeu*FDi:3BOt[h+C]&&@<-W9@rH4'@<?3mBl%L*Gp"[]D/"'4ARlp*BPDN1
Bl5&4EbTH4+Eh=:F(oQ1/e&-s$4R=e,9n<c/hen51E]:uDKTB.Gp"k#/0H]%1,C%$7qHRKATAn_
CisH&+@TgTFD5Z2.1HUn$6Uf@8g$,H0Jk.u+E_a:+E(j7>=VCa>psB.FDu:^0/$sTE,95t/oPcC
0.A#UDfQt3G][M7A7]9oE,oN"Ble!,DBNY2FCf)rEcW?4$6UH6BOPs)Bl8$5De+!#ARlol+C]&&
@<-W9Bl7F!D/`p*BjtdmBlnVC@V'Y*AS#a%8g$,H0Jjn\DIal/EbTH4+Eh=:F(oQ1F!,C5+A+6q
$6UH68l%htF*)>@ATJu*G][M7A7]9oE,oN"Ble!,DBNY2FCf)rEcW@;DBNJ(@ruF'DIIR2+C]&&
@<-W9?ts:fCh7Zq/g*b/3A*!B%144#+Ceht+ED%%A0>f,A7]d(AU&<.DId<h+DG_8AS5RpF!+q7
F<G:0+A*b:/hf+)GB.D>ATJu*G][M7A7]9oBl8$(B4Z+)+EVNE?ts:fCh7Zq%144#+Cf>,E,TW*
DKKqBDerrqEZdt%F!+t$DBNh8+ED%%A0>],DJ*O$+EV:.D(Zr1BPDN1G%G]8Bl@l3@:Wni+Cf(r
@r$-.FDi:0E-681/.Dq/+<Y')Ci<d(?m&lqA0>8jE-#T4?m'Q0+E2@4G%GQ5+EV:.+Dkh6BOPdh
Ch[d"+E(j7DIn#FDerr,@VK^gEd8d<@<>p#Bl5&(Bk)7!Df0!(Bk;?<%13OO+<Ve.5uLHL:.I>f
FDi:EE+a3"A7Zm*D]j.8BlbD?ATDj+Df-\9Afs]A6m-M]F(KG9H#IhG+A,Et+DkP.FCfJ8Anc'm
+C]UW%13OO+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn%144#+<VdL+<XEG/g+V3@r$4++F.mJ
EZek7EcP`/FDQ4FEb/ltF*(u6ARlooBk)7!Df0!(Bk;?.@;]TuF(f]<+A*beDg-(.$6UH6+<VdL
+=JreE+rft+>k9[A0<6I.3N5HEbTW,+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^u
FCfJFBkh]:%144#+<VdL+<V+#+<VdL+<VdL:-pQUEb0<6@<-H48g%P[A0>H(@<6!&FD,5.Anc'm
Et&I!+<VdL+<Ve=ATD4#AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>?4F*(u6/no'4-OgD*
+<VdL+<Ve=ATD4#AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9/no'<-OgCl$6UH6+<VdL
+AP6U+ED%0Ddd0!FD,5.Eb/ltF*(u6ARlooBk)7!Df0!(Bk;?.E++$+DJ()#FED)3FD5Z2+:SZ#
+<VdL+<Ve%67sC&D]iJ+Gp$R1DIIR2+DG_'Df'H%FD52uCh\!:+Dk\2F(&]mEt&I!+<VdL+<VeC
Ddd0!-YI".ATD3q05>E9-OgD*+<VdL+<Vd\+Z_;20d&SnE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A1q\9A9)6oBleB-E\;'@F!hD(%144#+<VdL+<XEG/g,7S+E_a:+E)(,+=L]1AoD^$+?;&.1asPX
Bk)7!Df0!(Bk;?.H#IgJGA1l0+D>2,AKZ)5+EM+9+EV:.D'08p+<VdL+<VdL:-pQU;FNl>:JOSd
+DG^9@;[3+Ch.*t+Eh=:F(oQ1+E(j78g%P[A0>u-ASrW2AS5^uFCfJ8Bl5%c+?;&.1^sd$$6UH6
+<VdL+AP6U+EM+9+Co1rFD5Z2@<-W9;FNl>:JOSd+DG^9@;[3+Ch.*t+DM>m+<VdL+<VdLDe't<
DerrpBk)64%144#+<VdL+<Y36F(KG9-W3B!6r-QO=XOXc%144#+<VdL+<XEG/g,7LASrW)DBN@1
DIn#7-qYUB/hf+4.3M5*Eb/ltF*(u6+:SZ#+<VdL+<VeIAS5Nr-Z<g3A8,Oq-T`\c3\P\jATD?8
H#IhG04\d,F>%?L-OgCl$6UH6:/=hX3Zr-K+F.mJ+CT;%+E).6Gp$g=FCfK(F*(u(+DG^9Ecl8;
Bl7Q+@s)g4ASuT48i\LX1a$4EA0>c$G@be($6UH6G%G]8Bl@m1+E(j78hM5hDfm14@;[2uF_u(?
H#IhG+Co1rFD5Z2@<-'nF!+n4+CoV3E$043EbTK7F!+n/A0>o(Ci<`m%144#+EV:.D'3P1+Dtb7
Cj@.5Eb/[$ARloU+?;&.1a$=C@ruF'DIIR"ATKIH<+ohc8l%htD..=)@;I&tG]7J-Bl7u7BQ&);
FDi:4D]j.8Bla^j+<Ve@DBO%7AKWI%F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F"/;@E,]B+
A8-9@+:SYe$6Uf@8g$,H0Jk.u+Cf(nDJ*O%+EVNEFD,5.F`V+:De:,6BOr<,AS6.%@<*K%G]7\7
F)u&6DBNb0@WGmtGp$Kk6W-?.?m''"EarZk+EMI<AKVEh+<Ve8A867.FDYT,FE8RHD]iG.G]R7F
+B<;n@rGmh+Cf(nEa`I"ATDi7@<,p%FEMVAARlp%AnE00Bln#2?ugL7FCmKT0OQ#BEbTH4%144#
+EVNE?ugL5?m'N%@<,jkATKIH<+ohcF(KH8Bl7Q+F(fK7Ch+YtAKZ#)F*)>@ARlolAoqU)+CK57
F'p,2F`)7C@Wcc88K`4qF_kRt$6UH6@:XOqF(HJ(BOt[hBl7Q+AoD]4@rc:*Bk(Rf+Cf>#AM,*)
F`MA6DJ()1AnE/cDJ<U!A7Zm#@<iu3Bl.R++A,Et-Z^D=@VKXmFEnu<$6UH6FDi:4ARTBtGA2/4
+EMI<AKYN%@s)X"DKKqB@Wcc88ge[&<GlM\De*E%F*2G@DfTqBBOPs)@;L-rH#k*I@<-I(@;IP*
$6UH6%144-+CI&LDe't<-X\'*A867.FCeu*FDi:CDfTqBEb/ltF*(u6ARlooBk)7!Df0!(Bk;?<
%13OO+=\L3AS5S!+D#S6DfTnA-tRF>DfTnABl5&8BOr<,AS5S!+D#e:Eb0<5Bl@l<+Du+A+:SZ#
+<YcH@;p0sA0>;uA0>Au@<-'oBk:g9+=AX_Ec5i.-QmGSF!,l`+CoA++=ANG$6UH6:i^8gEZdtM
6m-YaEcYr5DK?q:ATT&8AS5S!+D#S6DfTnAB5\o7D]j.8AKZ)5E$/t.G%GJ4FE1f//e&-s$6pc?
+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*-r4\o@rcL*+BDokBjkn$+@TgTFD5Z2.1HUn$6Uf@
+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@+CK>5
ARo7q?m'Z%F!,17@rHC.ARfguGp$[C@r-9uBl7Q+DIIBnF!,[@FD)dE?RHt1DBNt2F*2;@F"SRE
$4R=b.Nfj%Bl[cpF<Ft<HXIsK/hS8SI=5KGA7]@eDJ=3,Df0V=DJs_AF*2G@DfTr2A0<HHF(Jo*
?tsUj/oY?5?m$R$$6Tcb+=\KV7:^+S+Cf>,D..<mF!,"-F)Yr(H"CM/AoD]48k;l'FDi:BASl.!
A0?#9ATDi7FDi:1Ci"$6+C]A0GB7>9+E27<+E_XE/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n
+>PW+0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b.NfjAC2[X!
Blmp,@<?'g+E1b,A8bs29OUn3=<M']F(Jl)A8bt#D.RU,@<?4%DBO%>DepP=E+EC!ARm>7F(JoD
%13OO+<VdL>?,`YDJ(),De*ZuFCfK$FCe`+BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*
CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1.1HUn$6Uf@
+AQKl+@0jQH>d[DE,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums+@KpRFD5Z2@<-WB>A/,#
E-"&n06_Va/n&U*H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#gF!,1<+CQC%Df9D6G%G]8
Bl@l3De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D+EM[EE,Tc=%144#
+<X9P6m-#OG%GK.E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^
Bl7Q+Ch[d&+D,%rCi^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=
2`WHL2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?k!GP$6pc?+>GK&/hnJ#
+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b.Ni,6De*@#@V%0+
@rG`t@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJAS!nF?tsXhFD)dEIP5,?A8c@,
05"j6ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4F(KH8Bl7Q+:K&BM@rH7++EV:*
F<G%5@;]Tu8l%htA8-'q@ruX0Bk;?<%13OO+=\KV.!&sA@WcC$A7TCpF"&5KDe*QoBk:ftFDi:3
Eb/[$AKYDtC`mh5AKYMtEb/a&DfTQ'Et&I!+<VeIAT;j,Eb/c(@X0)<BOr<'@:O=r+=L]ABl%<p
De*BmF*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt%144#+<Y`:FED57B-;>9+Dtb7+DkOsBPD?q
F!,(5EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRE$4R=b.NfjA@:WnbDdd0t@rc:&F>7/GDJs_ABl8!7
Eb0;7F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'oFa+<VdLBOQ'q+CHg9C3*c*
AU&<.DKBN1DK@EQ%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&
FCcRmASbpdF(Hd0$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg+BN9!BHVD1
BlbD*A7TCrBl@l3@;K`h$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8F!+n3AKYK$D/a<&FCd'I7WNEa
+Du+A+E)-?8l%ha$6UH6+Cf(nDJ*O%+EqO9C`m5+DKBN5F<GL6+C]J++D,>4ATJu&DIal.E-,f2
BmO30Bl@m1/e&.1+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/e&-s$6Uf@>@:oQATV<&8p,)u
FCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-
AR]RrCND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?%13OO+=\LTDf'&.D.-ppDf[%0
DIal3ATMs7+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI5$4R=b.NiV?G9C:&B4Z0m
+EV19F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5$4R=e,9n<b/ibOE3B836+@1-_
F`VXI1-$m.1,(FC%13OO+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8FCB33F`8I8@;0P#Eb-A*DfQsm
+?;&.0d'q:FC?b7+CT.u+C\o-Df0)<%13OO+=\LA9gMlV5tsdU+DG_'Eb/[#ARlp*D]gbi3$;gR
Df$UT0J4JIBPDN1E+*cqD.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'F_qQp+<VdLCh7KsFD)e8Afth2
DIIBnF!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['ATT&:D[d$r+<VeM@;L't
F!+q'FE_;-DBLYV@;]Tu1,UpA%13OO+=\KV?ug*l/0J>@FECn5@:X+qF*(u(+EVNEF*2G@DfTqB
@q]:gB4Z-,FDi:00fU=;1ghpF$4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affU
DKKT1ALDOA6t(?i%13OO+=\LAEd2Y5+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\L<
?ugL5?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=
FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL0L^5*Eb0<5Bl@m1/no9MDIP%(
$4R=b.Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a:IH=A@:F:#F(JoD%144#+BqH66m-;S
@N]Q,FCep"DejE"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0G
A8Z=-AR]RrCNCp6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6Uf@?u9dt?m'0#
E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@?tFFf+CSeqF`VY9A0>u4+E_a:+CJbkBlm]s
BQINg+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,
@;]^hF!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha9LW>3F(KG9Bl5&$E,ol/Bl%?5Bkh]s+>"^Y
F(Js+C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1iDKB`4AM.P=ARHWlA8-.(E\7e.%144-+CIf?
:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%ht
D.-ppD[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<ATKIH<+ohc@rGmh+DGm>@3BAp@V'@.+A$Z&
F!,UHAS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:EeaF!+n4+CIf?6W-KP<+$hjAU&;>BlbD.G\(B-
FCeu*GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0%14=),9SZm0J5@G2'=In9jr;i1,pg-1,(FB
+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSekARlok9hAGU6r-iP;ICVbDfoq?FDi:0DIIBn
@psJ#?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B.aW#%144-+D,>.F*&Ns:IH=GASbpd
F(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^EE-"&n05#!@BQ[c:@rH3;C3+<*FE_/6
ALSa1A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB+=M>CF*&OC
Afs]eDe=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ@<Q@'F`JUCAftJlE-#T4+=C&_:K0eZ9LM<I
-T`])6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtBD]j.8BlbD;ASbpdF(HJ7ASbdsBm+&1Ec5l<
+D,P.A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3BOu'(@:Wn[A0>u4+EV:.+CK8#EbTK7F!)iR
-X\'5BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL
+:SZ#+B2oSAo^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iAF(96)E-*a4AQWPb=)`D$
CbBF:Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>
+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9
$6UHjAQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$6UH#$6UH6<+oue+Cf>-AoD^,F!,RC
+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL%144#E,9H7+<VeU@:WneDK@ID
Ea`p#Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16EZdss2D-[<+D#G$ARlolDIaku
Cht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_ADf-\6BkCp!F*2G@DfTqP%13OO
+=\LADIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=
/e&.1%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:@WNZ.Bkq9&FD,B0+:SZ#
+<VdL+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqP+<V+#+<VdL+<VdLD/"6+
A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hW
$6UH6+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,+<V+#+=\L"+Dtb7+DtV)AKYE!
@;L41BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc@<?Qu+EVN2$6UH6Dg#]4
EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!/
$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1+<V+#+<VdL+<VdL:-pQUDg#]4
EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2
AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)?S[$^Bm;'L/1)u5+@K1-8Q\>T
%144#+<VdL+<W(CDCI_0+Cno&%144#%144#+B3#c+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2
F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu+<Ve?@<Q3)@V'+g+CSekARlp*
D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP+<V+#+<VdL+<VdL+<V+#,9nEU0J5@<3B8c9
/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"A867.FCeu*FDi:2ATW$*EZfFGE,]`9F<G.*
Bln',B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$C1D1"F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_
?tsUjF`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]Tu
Ch[cu+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+
B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n+<VdL+<VdL:-pQU;,f2@
85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&EZccF@rH7+Deru9
AU%c8%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3j
DJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@+CJr&A1hh3Amca(E+EC!ARmD&$4R=e,9n<b
/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b.Ni,1FC65"A867.FCeu*FDi:C
F`;;<Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt+<VeFE+Np.+DG^9?u]pqA7]-k
ARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl$6UH6FDi:CF`;;<Ec`FGBPDN1
An>CmF`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i%144#+<VdL+<Y6++=DAOEb'&r
D.P(($6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%$6Uf@?uKR`+ED%%A867.
FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065Bl[cm%144#+<YN0Gp%!C
F<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT?1+<VdL+<VdL:-pQU
8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6+<VdL+AP6U+ED%5F_Pl-
+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE+E(d5-RT?1+<VdL+<VdL
Eb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL+>,9!/e&-s$6pc?+>>E.
/ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IGBl.g*ASl!r
FCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NfjOATo8=ATMr9F(96)E--.D@:Wn[
A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6
@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-
Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<
F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.
?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#
Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)
+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14
DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#
Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1
Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5
+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et
/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!
F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJ
F=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$
DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p
+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:
ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF
0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^
F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)
@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&
FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPm
B4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)
0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%
?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&
FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4
+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi
$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&
$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'
DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL
+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>
+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7
-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)
ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno+
+=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:U
A79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6
+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$
;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK
+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1
Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6
G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]Tu
GA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+
Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAq
D..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7
F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"
DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#
+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"
$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4
+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIa
F<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7
+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@
F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'
ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uu
ATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4Ysl
Eaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1
+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8
%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdL
A8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL
+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$
F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)
E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,
D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UF
DfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloq
Ec5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIakt
D0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3
Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s
$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%ht
Cggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<
@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4
+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7C
ATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<
Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@
@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<
+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'm
F'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@
?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1
F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:
@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlot
DBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5
$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;
DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE
2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:
EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":
DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6
+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq
+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBn
F"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<
Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LA
DI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/
+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs
+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&
0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/
Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#
+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%
D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2
CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cm
De*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL
<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk
+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys
$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[Ws
C3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5
DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^
/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o
+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[
+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;
Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#
+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD9
8TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@lt
EbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'
@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C
;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5
B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ
+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5
+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:
Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..Nr
BHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[
+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.
ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF
;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7
@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4
BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%
+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13
E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.
F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*
9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$
D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2
@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=)
,9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(
+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"m
FCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZ
D.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5
G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4
@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#k
BlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*
+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s
@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(
0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqB
F(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&lu
AKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn
+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&
ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]
F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b
+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@
?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?
F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+
@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//
F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1
@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(
/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(Ds
DfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.
F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,Xf
ATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.
+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7
FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I
;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb
+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E.
/iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A
6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#
+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8
E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr
/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7
AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$
+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4
ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10
Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`
Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-
@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&
,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*
CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(
Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;
3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9
@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4
FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!
?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$i
A0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeK
D]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)
@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht
:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#
.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=
%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=
+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b
.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@J
A8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*
F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'<
/e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*
0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$
De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9
BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,Rp
F(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.
DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu
+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!
+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+
DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio
<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*u
Bl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&Nu
Bl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9
ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9
A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-
+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)
AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.
+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!
AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(
C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<
FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0
%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$
@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8
@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0
+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E.
/hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8
+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E
%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1
%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:
?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%q
Bl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBp
FD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMp
Anc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&
Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%
F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et
+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FB
Afu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-L
Ch[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:Njk
BlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+
@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4
+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)
Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2
EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)
3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3
DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W
+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-
F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.B
D.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(
F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#
+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63(
$6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]Tu
FCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>
A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&
De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?
+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4
D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,
ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e
,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl
%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35
+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7
+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm
1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_A
A8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LA
C2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA
%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e
$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uogu
BlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5
+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$
F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq
$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8
DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6
@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#
+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5
GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:
+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\Li
EcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NT
D]i_-F*)>@H"q8./nf?DC^g_bBleB7Ed;D<A7TUg1,iiWDImisCbKOAA7TUgF_t]-F<E.X@q]:g
B4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.4
1,^7,+Co&,+=MGJE%)5'%14=),9S]n0J5+<+@0seBl"nK/0H]%1,C%$;fHbkDJ((`DIdHkFDYT,
FE8QnA8-."Df.!5$4R=b.Nh](AKYo3A7]d(De:,1E-,f4DBNG-A7Zm*@:F%aF!,17+CT5.ASu$m
GT]F-+D>2)%144#+C\nnDBNG&@;]^hA1f!(BOr<&@<-!lEZfI4@VfTu0eskcF!,@=G9CgA+CQC6
Bl7R"AISth+<YW3B4W3-D]ik-@<Q3)F)YPtAKYT'EZet:FEMV8+Cf>#ATKI5$4R=b.NhZ.D.Oh>
F`(`.@s)X"DKKH#.Ni5>A7]g)BOQ'q+C\nnDBN@uA7]9oFDi:D@:F%a+>GW(%13OO+=\L5BOr;t
DKKoE+D,P4+CJ`!F(KH$+D>2)+C\nnDBN@uC3=T>ARlp*D]j+7Dg*<5$6UH6FD,5.DIn#7?q<R^
846HP:gbDb@<,dnATVL(/e&-s$6pc?+>GK&/i#4*/KdYoDKTB.Gp"k#/0H]%1,C%$7qHRKATAn_
CisH&+@TgTFD5Z2.1HUn$6Uf@6Z6g\Df0-(F<E:n+DG^9?tsn(Eb'6!+Du+A+D>\0A9/l8BOr;Y
+CI2Q3\`I!+EMgLFCf;3F*)G:DJ(RE<+oue%144#+D>>&E-!-o:IH=9ARTBtGA2/4+EV:.+C]&&
@<-W9Bl7F!D/`p*BjtdmBlnVC@V'Y*AS#a%8g$,H0Jk.u+CT.u+D"u%Ch[I$%144#+A+#&+D#e>
ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)/e&-s$6Uf@6Z7!cARfg)?t!Mf?m'<)DII&u@<-"'D.RU,
+>"^SDJXS@FCArrF!+t+@<,ddFCfJ8Ch[s4F"Rn/%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%
1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+
Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-+<X'dEb/a&+Co%qBl7X,Bl@l3@;p0sDIdI+
+CSekARmD&$4R=b.NfjN@:N)302-(tFa,$J@<?1(+CSekARlp*D]iP.DJ!TqF`Lo4Bl@l3F(Jj'
Bl@lA%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'
DIIR2+@:!bCEQ&VBln'-DCH#%%144#.NhJtG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.
-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?
%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQn
AfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:l
Bl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+
@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]
0K;c^90u?J6spH2%144#.NhJtG9BM#E-ZP:EZf1,@N]W#AftMmA7]9o?r_8^DJ)R[A8Gt%ATD4$
AM.q4Amd25F(Jo*FD,5.A8-'q@ruX0Gmt)i$6X)&@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#
D.RU,05tH6A8bs*%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[Bu
B-9WRBln'-DCH#%%144#.Nfj6;G;-SBl5&$C2[W8E+EQg+Dl%-BkD'jA0>u4+E_a:+@oI2:fAKN
DKBo2@:UL!AfsWD<)>1V$4R=b+=\L3AS,LoASu!hF!,RC+A+pn+Cf(nDJ*Nk+EVNEF`V+:E+*6n
@;[3%DKBo2@:Uu"$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-
AKXl^Ch7$rALS&q%144#.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'Bl@l3@:Wn[A1eu6$4R=b+=\KV
E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ8Cggdo+CSekARlo8+EM+*+EV:.+Co2,ARfh#Ed8*$%144#
+<VdL+<VdLC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9SZm
3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b+=\LWATDj+Df-\,F_u(?AoD]48g$,H0JO\ZATV?'
E+*iuBJ'`$%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2
$4R=b+=\LAEd2Y5+EM+(FD5Z2+CSekARmD9%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%
0fTUL%144#.Ni,9DJW]'F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB
+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdss
G%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5C
ATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#
A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr
$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s
$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme
@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4
AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0
+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@
@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo
$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#
E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGC
A7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%
0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSek
ARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/
$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=)
,9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcq
F`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&
+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%
+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'Q
F*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4
+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O
/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!
AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,n
G%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-
GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0
H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E.
/ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinG
EcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL
89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/
Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,
+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#
F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3
ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,u
ATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<
2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8
D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(
Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6
A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(
F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4
+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uo
Eb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^
:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId
5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6
Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKiCh\!&Eaa'$?Z1+%ATqL'AU#sc,p7;C
BlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;i
G%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5BlJ/:FD,*)+D58'
ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%Et
D/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;>\J.hAp\35FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8IY8l%htA8,OqBl@ltEd<'UB6%p5
E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/%16?S
FCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=
De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8Bl7Q+C2[X!Blmp,@<?''DJsW.
@W-1#I4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U
@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XS[m+C&f&
Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/HW>-$DJ(),De*ZuFCfK$
FCcRk6q2SW%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apk*q+C&f&Ec#6$
F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,
F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/HUDprEb0-1+A,Et+DkP)F^]*7/e&.1>]XCq
BlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG
C2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7g6!$6WSkDfT]'Cia<:AISuOASu%*ASuX-ATD4$AUP!p
%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[mDKKH1Amo1\I16Mm$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=%7iE+O'+Bl7^5<(KSZ:dIiE:IBPW>Y]3XD..6[
Dej]!84c`V5u'gD6QdKo+<Z)\>?l,UB4Z*pAp\6(@ldR[8Q/GO:..lFI9dt#6Z6gYASuThDej]3
F_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?12%16?RH#R>8Ch[d&
HY.2:D/!Tj@qBanG^XpD:2b/i@;Jn]CO9Z3Ec#N&@:NkjAU#=?+FSZB>]=+aATD?oHYI)%3bE;N
D/!Tj@qBanG^Wj?>XNFHD.RU,<,ZQ!AoD^,@<?Q5BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*
Bl8$(Eb8`iAKZ28Eb'6>%16?RH#R>8Ch[d&HY7A<Ch\!>HX'<aEc#6$<,ZQ!B6%s-BlkI?+<VdL
+<VeTI9Trq@:s.lAS-:'An*l7Ec>i/FF@F;>XNFHD.RU,<,ZQ!D..3k+DbJ.AU#>0DfQt5Ec6)>
+=MLaI16NgBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[Dej]6Amo1\F(Jj'Bl@l3+<Z)\
>?l,UB4Z*pAp\6(@le=9@:NkiARfgrDf0u/+C%9PD/Ej%FB!0oHYIA>ATDBk@q?d(ARfgrDf-\=
F_tu(Ed8dKFE2)5B713r>\JD%ATDU$DJOT5An-79>Y]3XD..6[Dej]6An)r++<VdL+<VdL+<Z)\
>?l,UB4Z*pAp\6(@le=9@sqW*>XNFHD.RU,<,ZQ!AoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>
FF=T*>\JD%ATDU$DJOT?ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FSZB
>]=+aATD?oHYI)%3cekSC2[X!Blmp,@<?(/>p*B>Df'?&DKJirCO:#@AT2'uAKXZT<+T/SE,ol,
ATMp,DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfV(%16?RH#R>8Ch[d&HZaOK
@<?(*Ao`*6Eb'6>HX'<aEc#6$<,ZQ!Fa%Y1FCf]/Ed)GBA9/lAI9Trq@:s.lAS-:'An*lEGAL]0
AU%g-GAhM4F+%=:>XNFHD.RU,<,ZQ!F`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/
Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@CV%16?RH#R>8Ch[d&HZsCKA8Gt%I=#3oDfT]'CfG=gHZsCK
A8Gt%+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9GAhM4Ch\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*
+D,Y4D'4%@Eb$;/BleA=.![7i%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo%16?]
F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP\0DIak^:IKU?$4R>IFCf]=FEDkEDe*ZuFCfK$
FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bdDe*E%@;]Tb$=n'bF_t]-F<G[:
G]Y'BF<GOCDe!@"F(KDF+A$Yt@<6L4D.RcL%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'
%144#6#:?[F)Q2A@q?cmDe*E%BlbD<FDl22A0>T(+A,Et+Co1rFD5Z2@<-'nF"Rn/>\S:kD%-gp
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=@s)X"DKI"5Ea`TtASuU2+CT;%+D#8/BOu3F%144#>[h8W
Bl893FCf<'H=_L6$6UHrBlmp'+AH9bCLh@-DBNS4Dfp"ACi=3(+CoD#F_t]-FE9Jc>]s\!@XKpR
3?VjHF)W6LB6%p5E,K*$ALDj7$6UHrBlmp'+C%TK<+T0:+EM[;AncL$A0>_t@rcL/3Zq[NATD7-
1a$=CF)W6LB6%p5E,K*$ALB#V?Z1+%ATqL'AU#SM%144#>\.e`HYIS5D/"<-I16Mm$7-g"Blmp'
%14C(+<XEtDCnI'@rGmh+DGm>@rH6sBl7Km+EVNEFD,5.8l%htB6%p5E$/h*@:Wqi>\7nmFDc#=
AU@BiBla^j,p4<Q+<YK7D/"*#FD5Z2+DkP4+C\n)ARTXkA0>Su+DGp?@V'%fD.Rc2@3B5tDIdcr
DI[61I3;s9A0>T-+DkP-CLq#c$7-f;+EqOABHV88AT_O%/T>-9A8bs#A7]RkD/"*'EcWiU7<W6_
H$!_6DJ()+DBNG3Ebp"D>]aP%FEDVO>^K_(I16N0+<Ve9Ea`HnATVu9AoDL%Dg-7FE+*WpDdso2
Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK%14C(+<Xp2AU&<=FF.b@A8Gt%ATD4$
AUPqI+D>=pA7]d(@rH7,@;0V#+C%TK<+T0\@rGmh+EV:*F<G:=+DkP-CLq$!Ch[Zr%14C(+<Yc>
Blbm9$4R=g+C&AeB5)71G%G]'@<?4#I16N0+AP6U4?S(AIXWDd+>.J=FCf\>DKTf*ATCIYDIml3
F*(i2F@L:hD*9't+s;:C$7-fi67tGcIXZ`p+:SZ(+C&JqA:&K2EaiI!Bl/8-$=%.[A:%m*F_t]1
@<?(/%13OO>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/I16Mm$=%[aG]\%L
HYRJ0Ch\!&Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u+AH9S+Eh=:F(oQ1F!,C5%15][
>\7nmFDc#=AU@[(AU&<=FF.b@A8Gt%ATD4$AUP\FBl%T.Ecl7BDf-[i+?1u-0d'nBA0>>mH#IS2
/q"09%16'Q+E_a:+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<fRFWbODF*'GP$4R>I@V'1dDL5r4F_t]1
@<?(/>;7a9%16?SFCf:u$6UH_DKBo.Cht4d:IHfE$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8
@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV.(%I3<6F+CQBb%144#@:WneDD!&'F<G:=
+E_aJ@;Kb*+DG_7FCB!%ARlp-Bln"t$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;
GA1i,02Q(eD..=1HZ3D'D..=1/e&.mBlmp'%144#8T&Tk@;Ka&8l%iR:K::[74o#V+<Xp&Eb/j0
BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De*p-F`Lu'I="R^
6rQl];F<m$%144#BlbD*CiaM;@3A/b@:WneDD!&'DKBo.Cht5.F<GdAFD)e%FCf]=FEDkK@:O._
DLF,[8TZ(bDf0Z*Bl7u7FD,5.8l%ha$6UI%Bk)7!Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?
6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?6o+<Xp2AU&<=FF.b@A8Gt%ATD4$AM/B?$=%:eAShk`
+<X6nF*(i,C`m./@s)g4ASuT4G%G]8Bl@l3De:+sBQ@ZrHY@MCE-"&n05t?;A8bs1DfTJDI=#pA
DIdZqI4bs9+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+AU&<=FF,bq3A*$=0mt0QDIal!AU/33
A0;<g+<Y`JE,]`9FE8Qs+EMgGFCBD:BPD*mCh[NqFD5W*/g*u2BlA#7G%G]8Bl@m1+ED%5F_Pl-
A0>`-A8,Xi@psInDf.0M<+ohP$6UI'Des6.GA1r-+C]/*B-;/3F*)IGE,ol?Bk1ctD/XH++DG_*
DfT]'FD5Z23XlE=+<VdL+C&AeB5)71ASuX-ATD4$AUP!p#p:?qBlmp'+C&T#AS-:&FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4
GV*TCB4u*qB4uC$DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]OkB4stQB4uC$DJ+A,$4.gt>]XCq
BlJ08BmO>"$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\
0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$
F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD
1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.n[[:gn6PDdso!@<6!j
+A*bTH#@_4GT]OkB4u*qB4uC$DJ+A,$4.gt>]XCqBlJ08BmO>"$6UH6+<Ve3F`M;FBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2T
FCBDGBPD*mCh[NqFD5W*07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8
A1r@X;e9f[/PKl#ATD4$AKXT@7"$Zs$4.gt>]XCqBlJ08BmO>"$6UH6+<Ve3F`M;FBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9
I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&JqA:%m*F_t]1@<?(/%16?SFCf:u$6UHXF_PZ&+C'#"
G]\%LHYRJ0Ch\!&Eaa'$/q"jIFCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*+A*bhEc6)>/g*b^6k'JG
+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3Dfp#?/g+,3+DkP&AKY6"AU&<=FF.b@A8Gt%ATD4$AUP\3
D`S=7%14C(>[h8WBl89@ATD6gFD5T?%14C(Eb065Bl[c--YI".ATD3q05>E9-OgD/+E(d54$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1,p7&@F!)iFDe*ZuFCfK$FCcg/$7-g"ASu%*G%G]'
@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO:)5
EHPu9AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAB4YslEa`c;C2[WfFCf]=EHQ2AATMR'
B5D.+I=2P3>Y]3XD..6[Dej]<A0?;*94`BmDfTAfDej\]3dk73FE2)5B2iebHX(Z(G][qJDffQ3
Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iqFCf]=EHQ2AATMR'B5D.+I=35C94`BmDfTAfDej](I3;c_
ARebLCfG=gHS^(T:2b/i@;Jn]CO71BA0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%
FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!D/=89I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*cs
H[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)m
BOPF_A:4mo>\S:kD%-gp+AZrfDBO%7AKXT@6m-#S@ruF'DIIR"ATJu(Df0Z*Bl7X&B-;;0AKYW+
Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g5A0<rp-YdR1
A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo
>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]<A0?;*94`BmDfTAfDej\]3dk73FE2)5
B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iqFCf]=EHQ2AATMR'B5D.+I=35C
94`BmDfTAfDej](I3;c_ARebLCfG=gHS^(T:2b/i@;Jn]CO71BA0?;*;fm%oDJ)peCO9<.AU&<:
F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g
@:Wq[I16NgBlmp'%144#9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%
FEDVOC2[X!Blmp,@<?(/+DGp?@ps6t@V#uU+<YK=@:Wq[+Dbb-AKYE!Gp#^%F(96)E-*]A$4R=g
+C&AeB5)71G%G]'@<?4#I16N0+Dbt)A0<77De*ZuFCfK$FCcg/$7-g"ASu%*G%G]'@<?4#I16Ng
@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO9l9@:UL/>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[
A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#;e:%n@3Bc4EbfB,B-:`!Eb/a&
DfU+U+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<06DImisFCfM&$6UHr9OUn3=FOjrCh7Z?+@0g[+EM[8
BHUo$Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;sBl[cpFDl2F+EML5@qfOhARlomGmt*'+C'#"G]\%L
HZNb?C2[X!Blmp,@<?'5I16Mm$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g9ATV[*A8Gt%ATD4$AKW?J
+<XEG/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$4R=g+EM+9
C2[X!Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"GB43#,p78?FD>`)Ch\!&Eaa'$
+=AgUDf'&=C2[d'06CcBE$lbN:-pQUCh[d0GRY!++C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC
/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.Eb/a&DfU,O%13OO>Y]3XD..6[
Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(o
CghBuH[U!ID/`a%AU&<:F`2A5F(oN)Ch7sAI39XT+<VdL+<Ve36Z6gYASuThDej\p67sC)Bl7I"
GB80A$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+
I4o8PD.PA8DeO#AFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+Dbb0Fa/<D
$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I=?9L
D/`a%AU&<:F`2A5F(oN)Ch7sAI39XT+<VdL+<VdL+C%9PD/Ej%FB!0oHVQm[+A*beAS,XoARloq
DerrqEcZX<$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'+B)in+E)4@Bl@lt
C`m//FD,T5.!$g[GA2/4+Cob+A8,Nr>]aP%FEDVOF(KH.De*ZuFCfK$FCfkQ%16?LAS5^pHW+Td
A7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?=FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAhl
@<??pDHq9pG][qJDffQ3Bl7R"AUAiR>Y]3XD..6[Dej\BF(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I:G<CFCf]=@UWb^F)59+BR>/:@<?!fG%Fp#AU&<:F`2A5F(oN)
Ch7sAI39Y;6Z6gYASuThDej\p67sC%ATT%g@8pf?+CTD7BQ%o>F"&5RAU&;>@;]TuA8-'q@ruX0
H$p,/>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHhF`&=,FCf]=FEDkB
Ec>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/g+D@AU&<=FF.Y@E,961I16N+
+D58'ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/g+,,AKZ#3Dfd+,
9OUn3=FOjrCh4%_+<YB>+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!%14C(>[h8WBl89@ATD6gFD5T?
%14C(B6%s-BlkIFC2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*ZuFCfK$FCd(HAU#=,$7-g"ASu%*
G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]
CO9]7E,961+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5
F(oN)Ch7sAI3;c^Df'?&DKJirCO8fC/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>I16NgASu%*882^M
Ch[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'FD,5.
Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkBEc>i/F=qta%13OO+<WrmF(f-$C`me/EbTK7+=LK:
AU&<=FF.J*FF>9MEZeV/AU&<=FF/(BI46:QF!,[IBlnH.DBO%>+EV:.+C'#"G]\%LHZNb?C2[X!
Blmp,@<?(/%144#A8-'q@ruX0Gp%3B@<<W5BQ&*9+EV:.+EM+6F_,H#AKYo'+C%TK<+T0:+Cf>,
E+s,sFD5Z2+Cf>,D..<mF"Rn/+<V+#+<X-fCh7Ys$6UI.@<iu)AKYr4De!@"F(Jl)GA2/4+C'#"
G]\%LHZ3M-CghEsG^V+c>]aP%FEDVOG\(]"FCf]F+E)90$6UHrFCf]=FEDkGF^])pFCf]F/g+;8
F`JU7BQ%TpAKZ22Cht5'AKYMt@ru.$ARlomGp%3BAKYr4ATMF#@q?d$Ado(i+B<;n@rGmh+Cf(n
Ea`I"ATDiE+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYr4ARTFbCh4`$Bl%>i$6UHrFCf]=FEDk%
:IIljFCfK$FCe9hARTFbCh55@AU&VGBl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/e&.mASu%*ASuX-
ATD4$AUP!p%16'JATD?)@<,p%F)Po,+C%TK<+T0\F(KH8Bl7R)+F.mJ+DkP4+Eq73F<G[D+CSeq
F`VXW%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#7:^+S+C'#"G]\%LHV.(%9PJT[
Eaa'$:i^,UD.7<m/p(ZLI3<WM+Cf(nDJ*N'FD,5.DKTf*ATAo3Aftf*A7]up$6UI$DesQ5DK@EQ
<+ohcA7]@]F_l.BBlbD=BQ@Zq+C]J8+EV:2F!,=.Gp%-=F*2;@+DG^9G%G]>+Dbt6B-;)#D.Rc2
Ecl8;Bl7Pm$6UI5DeEX'BOu3:+B38%A7]7kARTXk+E)9CBl7F$ARTXk+DG_(AU#>-DesQ5DK?q1
BOPdkANC8-%16?LAS5^pHZit@@UX@mD1)j#>[h8WBl897F_l/6@rH1)I=!bu>?l5\@ruF'DCU!<
Bl7HmG]$r,AURhn$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\F
Ea`p.+Dbt6B-;86F`Lu'+Cf>#AKYf'DImlA+BNSlE,]N/B-:o0%144#@rH7,Ec5c1ARlomGp$@6
AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"ATDiE%144#6YKnGB4W3-
BPDN1G%#30AKY]!+F.mJ+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7CAM,*,Ea`p+ARlp"Bl7L'+CT;%
%144#E,oN"AS#C`A0?)1FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e5u:6D5t$,DGA2/4+Co%q@<HC.
%144#>X<1;Ecb9!CO9<.AU&<=FF-2(/j=]3/e&-s$=%:eASiP!$6UHrFCf]=FEDkEDe*ZuFCfK$
FCfkCD..]4Bl7F!EcP`$FDQ4FBPD*mCh[NqF<Fh"D/a08GB.,2E+NR.+C]86ARloU+Du+?DK?qB
BOQ!*@rH7,@;0Tg$6UI.Bm=`BEb0;7De:,5FE2)5B6,2(DIal.FD,6++E)@8ATAo8H#R>9/g+,,
BlbD*CiaM;BQ%]tF!,(5EZfRH@;p0sA0>c.DJjB8DK?qBBOPul$6UI$Df0Z*Bl5&0Df021ASkmf
A7T7^+EMXFBl7R)/g+,,AKZ/-Eag.rFCf]=FEDkPGAL]0AU%g-GAhM4F+#S^F(Jo*E+*BjIU$i#
B4Z*pAp\6(@leaVCghEsG\1u?DfTB0I4Pg7+<Y0&DBND"+E_a:A0>u4+D58'ATD4$AKY5hD/a08
F`)DD@;p0sA:5S*9OUn3=Blt\DfQtAF^o)-GAhM4F!,R<@<<W%@;[2sAKYhuDKTB(Cj@.IEa`p+
ARlolDIal(DKBB0FCetl$6UI*DBO%7AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%LHYRJ0Ch\!&
Eaa'$I4cXAEd8d9F!,[<+Dkh*BQPA<Df'&.D..=)@;I&tA8-."DJ'Cc+<YB>+CT)1@<lo:DIm<h
F)tc1Gp%<FFD)e%9OUn3==t$i%16?ODIe**DKTf-Eaa'$I16NuDe*fqEc#kQ0ht%f.V`m4E+*d(
F!,NU/KeS8AmoguF<G+.@ruF'DIIR2+E1b0@;TRtATDiE%15is/e&._67sB[BPDN1Anc'm+DGm>
F`V,)+EVNEF(KG9+EV:.+<Y3+AmoguF<D]:Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g,7E@VfTu
+DG^9FD,5.D..L-ATAo*Bl%?5+BN5fDBL'1+<YQ5G9CF1@ruF'DIIR2+DGm>@rc-hFCetl$;No?
+EV:.+<YW3Ea`frFCfK6+<YB9+EV:.+<YN0F*(u6+D,>(AKYE%AKZ,:ARlp*D]j+?ARfFdGp"5O
BOqV[:-pQUE+*cqD.Rg#EcW@8DfQt/+E1b0FD56-Cgh?,A8,OqBl@ltEd98[<+ohc+Eh=:@N[(0
E-#T4.3N,/D@HqJ67sBiAKW*<F`V,)+<YcE+<VeDDe*QoGp"5K@<,dnATVL(+<Y`:FED57B6,1<
+DG^9+<YB9A8-4$A9D<s%15is/g+\=@ruF'DIIR"ATKIH+AH9cFCfJ8+D,>(AKYr#Ea`frFCfK6
+Ceht+E).6Gp$R-+Cf(nDJ*Nk+C]U*$;No?+D#(tFD5W*+EV:2F!,(/Ch4_tDIal1ARfal@<?4$
B-;;0AKYhuF*(u6+D,>(AM+E!:-pQB$;No?+B3#c+DkP.FCfJ8Anc'm+Ceht+C\n)Eb/a$ART[l
A0?)1FD)e=BOr;r@;Ka@%15is/e&._67sBjEb/[$ASkjsFC/HkDe*2t8khTM<(0\l@;9^k?O[?;
67r]S:-pQU=$]_Z8PVc:+CT)&+EV:.+<YW3Ea`frFCfK6+CfP7Eb0-1Cj@.>BleB-A0><$AKZ#)
EHPu9ARlomGmt*U67sC&BOr;Y:IH=HH#n(=D(Zr&AfuA;FWb^9D/XT/+CT/5+E(j7FD,6&+A,Et
+EqO9C`m5.@<6*7+B`W*%15is/g+Y4DBL'C@:j(eGp$O+A0>;kA8-."Df0!"+E1b0@;TRtATDi7
@Wcc8+F.mJ+<Y0&DJjB7+ELt'AScW$$;No?+ED%1Dg#\7@s)g4ASuT4E+*cqD.Rg#EcWiB$4R>:
5uU`O;G]YW9iF29+>=p!+>=63%15is/g+,,AKYT'Ec#6,+E(j7FD,B0+E1b0@;TRtATAo*Bl%?'
Blc<E$;No?+<VdL+DPe&D.OhO+=M>WE+LI@A7]glEbTK7Bl@l34!8]TCis:u$;No?+:SZQ67sB'
+<VeADIIBn+DGm>@3B`%Ch[E&8g&"[D.O.`:-pQU+<VdL.!0`RALSa4ATM@%BlJ0.Df-\.De!p,
ASuU2+EV:.+E1b0@;TRtATAnF+EVmJAKY].+ED%5F_Pl-A.8l@67sB'+<VdL+<YT?Cj@-O.qrmC
AS5Rp.3N>G+CfP7Eb0-1Cj@.7G\(B-FCeu*DffZ(EZfILE+O)5GA1l0%15is/g)8Z+<VdL+C\n)
E+*g/ARlolF!+t+@<,ddFCfJ8Ch[s4F!)lPARuupE-,MtCh5%J%15is/g)8Z+<Yi9Cis;3BlbD*
DBNM8ARfk)@:F%a+A*bfG]7\7F)u&6DBO%7@<<W2Ec5K2@qB^(@3B`%Cis:u$4R>.;aX,J3&Mg$
+<W`g-nB"LFCf)rE[`,TBOu'(0d(U[AKYE&@qfX:2'?UN+CoV3E-!-M0Hb:S+>G;f+<VdL+<VdL
+<Vdg+>Fu]%15Hu:g$7R6W?iZ+?L\o.qrmCAS5Rp.3N,=D/aE2ASuU2+Cf>/Bk:ftBl5&3DIjr,
Df9S;E+*g/+=Js,Gs!i=0I\+e+<W`g0eb9j$:IZW<D>nW<(';F<$47F-nB"LFCf)rE[`,TBOu'(
0d("@@ruF'DIIR2+CoD#F_t]-F<G:=+E2IF+=JodDfQsT.3K`U+?L]#%15L!6WHiL:/k:d6rZ]"
4!5q%Bl8$(B4Z*4+EqO1FD)e8Afti2F*),.Bk:ftA8bt#D.RU,+EV1>F<Dte0KaVC1,Up<+<W`g
2DGXJ6rcrX7R9C@:Jr;s+=JaSDKKH&ATB4BDdmHm@ruc7A9Da.ARlotDBNk8AKYf-Df?h<@<6K4
-o!i04>J`I.3K`U+<VdL4!6C7%15To<(9/@<)6C7+?L\o.qrmCAS5Rp.3NhQEb'56Eb0?5Bk;I!
A0>T(+E)./+Dbt7E$0+.F)rHP0eb_84>JTI3%5sm+<W`g1,U`p$;a`%7R9C@:Jr;X4!5q%Bl8$(
B4Z*4+EqaEA9/l7FDl22A0>T(+E)./+Dbt7E$0+.F)rHP0eb_84>JTI3%5sm+<VdL+?L]#0JEqC
;FOPN8PVQA73E^7+=JaSDKKH&ATB4BGA(Q*+>G!\Bl.F&FCB$*F!+n3AKZ&&G%G2,Bl5&(F_u)=
+=JodDfQsT.3K`U4!66e$:mH]846HP:`pl'4!5q%Bl8$(B4Z*4+EqL1DBLYV@3B5lF(c\1F!,FB
AS,Y$ARlp*D]iS5D/aP=-nlc^EZd(c+<VdL+?L]#%13OO:-pQU;GU(f7Sc]G78b7BF!,%2E--@J
@X0),AS,@nCih9P8S0)ZF<G:=+EM+9+EVNE@3?t5E+*j%.3M5*@rH6sBkMR/ARlnm$;No?+D,P.
A7]d(;GU(f7Sc]G78b7HG%G]7Bk1dr+Co1rFD5Z2@<-W9Ci<flFD5Z2F!,(5EZccICi_$JB4Ysl
Eaa'$A0>r'EbTK7F!(o!;GU(f7Sc]G78b6i+=L`5@<,ddFCfJA+ED%(Bl[cpFE8QQD/=8B+EM%5
BlJ08+EVNE8g%_aCh.*t+?L\T$4R>;67sC&H#RJ-@;I'(Df0-'E--@JF(KH8Bl7Pm$;No?+Au!2
<(9YW6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFd
IW]^CE\D0GA9)U,F<D#"%15is/g*GtGp$O+A7]9oE+*cqD.Rg#EcW@3Eb-A7FDl22A0>T(+EV:.
+DkP.FCfJ8Anc'm+EqL1D@HqJ67sBjEb/[$ARlolDIal#BleB:Bju4,ARlp*D]hYJ6m-#SEb/a&
DfU+GDdmHm@rucE+<V+#%15is/g+4];GKeY7lhc:BOu'(A7]@eDJ=!$+A*bfG]7\7F)u&6DK?q0
AKYJkEb/j*C`m.qDfp.EFD,5.4!8$H@<,ddFCfJ8%15is/g,7LAKXT@6m,uXA7Zl3A8lX!@VfU)
+EV:*F<GO2EcYf5+EV:2F!,OGEbTE(+DGm>Ecko,D.RU,@<-WG%13OO:-pQU6VgN];FsAL<$47F
-t?q!Ea`I"ATB4B4!6h*C`mb4B4uC.+ED%7ATDs*A.8l@67sBT=\qC^5tsdI78b6i+=JaSDKKH&
ATB4BFD,5.@;^.1ATAnT+>bh_$7QDk%16igA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d+A,Et
+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7
/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._
67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:
G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[l
A1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;
Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403l
Aftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4
F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$
B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1r
FD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$
+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%cr
F`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._
67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3
Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQU
D/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$
$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8t
DfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ
+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$;No?+Dl7;FD5]1AKXT@6m-2]
F*(i.@qB^(@<,p%E+O',BlnH.A0>?(F<GI>F<GU8@rH4$ASu$iA.8lVE-#T4+=C&U;ajY[74/NO
%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKo
Ddsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7EcPl)AKXE06VgHU:J=2"/Kf+G
F<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l$;No?+APL&:c]_/F`MM6DKK]?
+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A$:R?M:JOha9LW;sC2[X*
FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU
779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%
AT2'g.k<5`G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(+?MV3
BQ%a!+EqaECER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo%15is/g)QVC2[W3+D#S6DfRKR
D.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8
Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9
F=.M):J48O:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;
@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HY
C2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn
$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1
AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t
4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u
.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@
Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaE
A9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.
+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT
/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,
+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)
+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/
$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q
+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5
BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>
ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaE
A90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4
%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+C
FDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBO%0F`_P<DeF><F(oH%
DKK]?+>"^SF`_SFFE8RCDJXS@AU&01Bk(k!Gp$U8A7]9\$?C,L3Zp.(EccC4$4R>;67sC$F`&==
@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`D%-g]$;No?
+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplLI4cXTEc;HpBQH<t
+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6
AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<
+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!
%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7
I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5
+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]Tu
Ch[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaE
A0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47
Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>
F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNS
A8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL
+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6
/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)
A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL
+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]
F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)
+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<Gij
Anc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(
Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2tE]l#t
Eb0E4+=ANZA8a(CEZfC6FEMVA/g+_CA1e;u-upjkF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pm
4YD.8EX`@)%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k
?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6
F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z
/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u
$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+E27>FCAWpAKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6
%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LM`L+Boso%13OO:-pQUGA1r*Dg-7FCis6%
A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&J#Bl7`s@q]:kF$2Qg3ZpF+3]A00@4lnU
0fCOr/ho(0,$uHs+C,E`%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9
E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-
4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\
3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n
+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!
Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)
ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A
4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn
$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*
+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-
0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<
-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT
/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDf[%0
DIakuF)u80Bjl*p+Cf>#AISugF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1/p)>[
%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U+=]!\
@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQB657=+AP6U+=]!bEGQ'kD0S3)>p)3O1,:%\+?L]YF<D\K
:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)E-)Nr
Df\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a-S?bh
/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0Gmt*q
F?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.hCcsg%
-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0F(96)E-*47Ec5e;@rH6sBkMR/ARlou+E1b2BFP;`E'66)
><3l\+Z_;"><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7
F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?
0F\?u$;No?+EqL1Eb-A%D'2CmF`V,)+C]U=F)Po,+DkOsEc6"AG%#30ATJtAGAhM;-Qm>J+=Ci@
D.P(($;No?+BM*&;FNlG8Nf*W-[0KLCF9Pu%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6
F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQU
A9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?
+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4
A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<
Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g,4HF<G!7E,oN%
ATDg&A0>i"DIdZq+E)-?FD,B0+DkOsBPD?q+>"^YF(Jl)@X0(EC2[X!Blmp,@<?'0%15is/g*tg
77K^D;FNuM5u'gD6TmIQ-UTq"<HD_lF'N?hDK9H$/p25HEa1nLE(",V@9cKE@ps1Y:gn6PDe!$k
@;]Uo@j_]m%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&Ci<flCh4^u
$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FHE-!-R
+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)D.-pp
DfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0Bk1dc
+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\ucF_>5r
Fs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-QlV91E^UH
+=ANG$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M
@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZX70eP.&/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9
-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImis
CaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\
DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%
Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.
F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#
@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!
@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30ml
C2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1
-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'
6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($
$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr
+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1
%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d
:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;k
A8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-
FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'
B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T
+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9
F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'
F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-
DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#
+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7c8X.1HW$@;]dk
ATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht
6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen5-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,
ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63
D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;
6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;
A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1
AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j
@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4
Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$
DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,
+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);
BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih
@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'
FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht
:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=
@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OO
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b
5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q
%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5./heD"
+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*
Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gk
C2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9
;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!
%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!
-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh
/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pq
Ci=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3
AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1r
FD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#
E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s
$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'
DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe
$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1
BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-
AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'
6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h
@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!
DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y
:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%14Nn$>k''De*g-De<^"AMPu867sa)H"q8.E,ol/Bl%?'F"JsdD0[6r:IH=9
Bk)7!Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T
;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?
+EqOABHVD1AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/
@s)m)A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8
+A$Yt+Ceht+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,
B-:c'G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1
D/XH++EV:*DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>
@:OCnG%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]m
F!,R<@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!
Df0!(Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*o-FCcS:D]g/p+Co&,ASc:(ATDiE+@.,k
BQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)
ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?
%15is/g+SFFD,T53Zq%5BPnq\/g*JhCLqMq$;No?+D#CuBl#gQ+C\bpATDNr3B9?;D..-p/n8g:
%13OO:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g,"F
DJ<s1D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+A79+^.1HVE
+Z_>4+BosJ%13OO:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+Deru-F(or3+>"^EF`_P=@<?3n+D,P4
+Dbb0Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12
Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et+DG_7FCB&sAISuA67sBtF_l/6E,9).8l%htBl8!6
@;]RdF!+n3AKYr'Ec#N4FCeu*@Wcc8DJsV>Eb/a!D/Ej%A7]9\$=n*sATT%B;FOMQ<)#e/%13OO
:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'
+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)$4R>;67sC!G%G]7Bk1ct779L=:/aq^73F0)F(KG9
-u*71DKB`4AM.P=ALSa5A8-.(EZcqVF`V+:Ap%p++E1b2BFP;D67sBU8PN#B+CfP7Eb0-1Cj@-l
6pjaF;bp(U+DGm>GA1r*Dg-7FDf0B:+>"^WAS!!-ATD6&-tRKL+:SZH6pjaF;bp(U?X[\fA9E!.
CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Zm9ke*XDf]i/F<FU_+@C'XAR&_`A7[B)G\&'H%15is/g*SN
6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0
@:Ul=/nK9=+t!g,%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[
F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/
F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9F=.M):J48O:IHlj4ZX].-Z3iFD..NrBOu64
%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>
FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA
-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$
/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7
F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi
+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]
DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O
3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFVi
ATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_C
A1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5
F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6
A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$
+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\f
A7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,
%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3
Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7
FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*
+>P9aFE@s!%15is/g,1WDBO%4F*&OGBl%?uFDQ4F/KetLCj@.AF`_SFFE8RKBOQ!*F`V,7+EM+9
Et&IsEBQ?*0d^p_F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-
F)>i<FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp#?06;8MFCfM&$>='8
3ZqWf+D>S1DJUG"3Zri'+D5_6%16ci4ZX]?+D>S1DJUG"3Zri'+>Y-QEc<.,%13OO:-pQUF(fK4
F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*Ec5e;@rGmh3XlEk67sB'+<Ve?
EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eIDfp#?%15is/g)8k0Hb%L+>=o\:-pQU
CghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr<
/g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:
D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U/g,Qp+En8%.1HUn$;No?+EM+&Earc*
F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+GAhM4Et&IO67sB'+<Ve?F)rHO
F(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;$;No?+<WE^+D>h;+=D5AAKYf-
DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'1a!oSF)rHOE,Tf>-QjNS+<VdL
:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,1E\_$0F\@C+D>h;+F+D'3XlF1AhG38
@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8Ec*KPASu$2%16W//g,B]BP_X*C`n-Y
+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;D_</NCL:LbDe*2t:J48O:IHlj+ED%8
F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O
6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%
DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)DfT@t$;No?+<WK`F)5E4+=CoBA9)6o
BleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E4
4ZX]A+?CW!%14d3F)5E4+F+D'3XlF1AhG38@:Wka?X[\fA7$I#CcsBnGT^O2F)W7I+CoCC+EM?A
Eb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&DKK5m8l%isDf9H5+EM?.$7QDk%15is
/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIEAS,LoASu!hEt&IsATD?o4ZX]A
+?CW!%16f]/g+V3A9)0e@;9^k?QaAP/g,1GG&JKN-Qlr</g,0WEb0?8Ec*KPASu$2%14M(/1tum
+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+EBUtI4fOL$7QDk%15is/g+h9DIe#8@r*8uDdso'ASc<s
EcVZsA8bt!@ra^n+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^
DdmH(>rsZG0d'.Z/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0K
De!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-E,8s.+Du+?DBNk8+EM%5
AS#a%@;]TuEb0?8Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>;67sC"DfTr.
@VfTu@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsE,Tc=@q]:kF$2Qg3ZpF+3]A0/.k<,#.k<,#.sror
,$uHs+C,E`%15is/g,@PDId[0F!,:A@qfI^+Cf>-F)Pl++C]86+CoM$GA1r-+Cf(nEa`I"ATDi$
$?p3%Ch$sg@<-EP3a4Wf3?^FB+=LYNH[[\-.qpUj0e";R+Boso%13OO:-pQUARoLs+Cf>,D..<m
+:SZG:IA,V78?fL:JFPL:..6++=D5DDg-//F)rICEZc_WH[\_=I4$Bi%13OO:-pQUEb/Zi+=84T
EbTW,+D,>(ATJ:fEb/Zi4ZY;@3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$?pN)FCdTr0d/S5+C/A;
5V=H@1+#1M-o3#-0I\F[$?B]dA8Z=.DEU$:+Z_AD-nul+0d\;S?p$\,-o3V*5!UMP+Z_;+.4H\T
$?pN)FCf?.F`'?'-sJ_T1Eee6+Bp9;-nul+1*Bk14?tMI1GU:@5U\E33\W!3.3Mn*$4R>;67sC$
ART*l<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF!*%WAmob&ATAo8BOPd$-urm-A9;?2+>"^WAS!!#
Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?B]dA9;?;4ZZe.+?V_<?SWrl+=K6s@4iuO/1)u5INViU
+?V_<?SWa.3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3L#n1OEO_.3L2pINU?g
3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$4R>;67sC)EbTW,F!,R5@VfUs+CT=6<'`hnA7]RkD/"*'
A0=Q8+EV18D/!lrFCeu*FCf]=+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?pN)FCfQ)
1-I[(+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4K]g><3lT><3lT>p([@-n$f(HXSNU,$uHU+F?-u
+FPjb-o!E&@4iuQ?R[+%3Zri'5U\0K-o!%s/0Zet5U\3:5U\*703g+R0gI-M-79o`5[>ff.4HAa
+=oc+-o!E&@4iuU-nHPs.6q/f.3MhU+FPjd0d'[]+?Lc%+=K6s@4iuU/3kC?-8%J2+Bo9^%15is
/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/+CT.u+CT>4De!KiFCcS)De*Dg$?UAQ3aEji+D5d*$>jlJ
3aEji+>Peu?Q_EQB657=+AP6U+=]!cG]XB%D/)3p>p)3O1,0t[+?L]YF<D\K:-pQU.P>FMEt&In
A3DtZ+?L]$2^2TO4!80X+<Ve%67sB1/o>$;CLh@-D@HqiEBQ?g+?L]%0HsjH4!80X+<Ve%67sB1
/ou#K%16rs4ZZjk4!6:6,$uHS+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums
+EV1>F<E.XA7]@]F_l.BC*7S-EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGG
ASlB>-Qjr_-mp,b+>#3p+C-E=/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4
D'3R9F`V,7+EV13E$/\*Eb/a&DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)
E-*47Ec5e;C*7Y?ATAo8ASlAq$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBsDdd0!C*7S-EbTK7+D,Y4
D'3>,DJ!TqF`M&(+DN$<@<?/l$>ONC3ZqWf+>=s"0HaR\+?Uc]E+*j%%13OO:-pQUDKTf*ATAo3
Afu#$C1UmsF!*%WF`V,)+C]U=G%#E*Dfp+D.!9WGCi_$JD.-ppDf[$LF(or3E-67R+CSnoE-67R
+>,9!.3N>:+E2@4F(K62%15j+6;p$.+>GPZ$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX
76sX>4ZX]I0Hb]b4$"a&Df'&.GAhM;+EV19F=.M)=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+CoV3
E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^
9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=
F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(
:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^Y
F(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/
+?MV3-OgCl$;No?+EM+9+CQC3Eb/ioEcP`%+E1b,A8bs#Df-\>BPDN1D.-pfBl7K)/Kf1WARlom
Gp"MMDe*ZuFCfK$FCcm1$;No?+Abs)7R^3Q779s<:..lF4ZX]56TSIPF(KB5>\@VcEbT#9F`V,7
>X<=J6t(1G>YK'G@;K1F@;]Uo@pEt]DIdZq-OgCl$;No?+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB
+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#E,9*,+E(j7
8l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.
@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuic
F`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>
>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<+BosE+E(d5-RT?1:-pQU0d(LR+=D,K
C2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1%13                                    ~>
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
0JP7;/i>RG1GLaG0f:s61,(I?0JP7</i>FA2)R<M3&!?81,(I?0JP7?/iGC;3&iZJ3&`];1,(I?
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
