NB. sha256:9562491dc8e0654bfd0c86e33f3cc20f81b3540bf4a4289800af0ca7e30fc83b
NB. JOD dictionary dump: 11 Jan 2024 11:13:16
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
1*AD42E)a60H`+n0ek@;+>GPm1*A>02`NZ;0f'q-+>c)53?U(3+>P&o0JG1:+?1K!+>Pi62]sh/
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
$8F.U?p%dU11W(VF_#_OD),aB3&c";GVF5b3G*&O?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B0#Ec#6,
Bl7Q+DfBf4Df-\>D]iG)@;BF^+EV:*F<G4-DImisFCfM&$6UH6A8-'q@rri(AS,XoBln'-DBNP0
Ec#k?GA(Q*+DkP&Bl7Q+F(96)E--.R+B3#c+Co2,ARfg)A7]@eDJ=3,Df-\0DfT\($6UH6BlbD6
DfTD3ASbpj@;^00@;]TuBOPs)FD,5.DJ<Tl+D,1nFEMV8+E(j7,%P8)F`2A9DJ(.9F(oN)Ch4`*
Bl7K)AU&01Bk(k!F"AGF/nZdG$6UH6IXZ`p%144#+AP6U+E;OBFCeu*F*(i.A79Lh+D#e:Ch[Bn
F:AR"+<Y]GG%>/o4ZX]A+?CVm?!o'U<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=4"akq
-8%J)4?G0&1*Cii%144#+AP6U+Co"*AoD^,%144#+EDOHA7]7]A3DsrH[?l@?mncM9MA/H;G/3@
.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>/mg@\/j:C?4"akq+F,)XI16N++<Z,^IXV_5+<Ve+BOr;r
Df0`0EcYr5DBNP3Df$V<FCB&t@<,m$AU&01Bm=?6+EVNEA7QfsF!,OGEa`ZpBQRj)Ed(r4A0><%
+Dbt6B+51j+<Y*6+EV:.+Co%qBl7X,Bl@l3A8c%#+Du+>+E_a:+CT/5+E(j78ge[&Eb0<'Ecu#)
+CT;'F_t]-F<GI0D.Rc>%144#+CK=7Fs(WEDI>(>+@.,[BOPdkAKYf'CLnW1BPDN1GAhV?A0>;s
F)N18D/`onF<Ft+De*ZuFCfK$FCei&@Wcc%$6UH6Dg#]4@;Ka&GAhV?A0>_tCLnV\+Cf>#AKYl)
@qB['FDi:<Df9D6Blks:$4R=t/g+Oa?Y+4eC34B*@52J>H>><K0l&^a1O1`n@<Q!A?m%gTDKBN&
ATAo%A7TClB-:V*DIn#$$6UH6?t=4tATV<&DfBf4Df-\*7ScoL786'H<(0\]5u^B_+EV:*F<GdA
Cht5.DJE`mF<G[=AKYK*EcP`/F:AR"+<YN0F*(u6+D,>(AKYr#FD)e2DKKe>@3B)p@ruF'DIIR2
/g+,,BlbD8E-,f4DBO.AF_kS2@;L$sEZet.Ch7Z1FD,*)+CT;%%144#+EM+9+AtWo6r-QO=WhEr
+A,Et/g+)2D.Rg&Bl7Q+FD,*)+A!\sFE2)=AKX`D<$5.9+@K!J@Wcc8Bl5&8BPDN1@psFi+DGpF
Et&I!+<Y60FD,6++Eqj?FCcS'+D,2/+C]V<ATJu9D]iI2Anc'm+Co%nCgh?qA0=c=5t"LD9N`KV
EZfC6@WcC$A0>u-AKYMt@ruF'DIIR2%144#+D,Y4D'370A9Da./g+,,AKYhuBl5&9F(HJ<Dfol,
+C\n)FDi:=@;BEsBlkJ/@<6-oEZfIB+Dl%?AKYMt@ruF'DIIR2+Co2,ARfh#EbT*+%144#+CT;/
F`(_B+@C9lEb0-1Cj@-q:IH=GASl!q@V'S$+EqL1Eb-A8BPD?sF!+n3AKYE!A0?)0Bl7L'+DGF1
FD,62+D5U8D/"'4Bl7Q9%144#+F\cgILQW,+<XEG/g,1GE,8rmATJu9BOr<*F`\a:Bk)7!Df0!(
Bk;?.E+*j%+EqOABHUf-EcP`/FDQ4FDfB9*+DkP.FCfJ8E+*j%%144#+CoG4ATT%B7ScoL786'H
<(0\]5u^B&%144#+F\cgILQVn$8X:W?p%e*CjKi7DDlYtAi!n,EATRh3-T1bFa>u'?Tqj?6Z6j`
Bk1dq+D#e>ASu$mDJ()"Eb0<6A7-O%D]j(3FDl22+E1b0FD56-Cgh?,@UWb^F`;CS%144#+@C9l
Eb0-1Cj@.;F<GU8F*)>@ATJu9BOr<'Df^"CEb/`lDKI"1@:O(qE%W8!CiaMG+Cf>-F(o/rEZek*
ARfLiDJ()6BOr<"@<6*nEt&I!+<Y3;EbTE(+ED%7FDl22/g*_.GA1l0+E2@>@UW_^Gp$O3Ci=M?
BOPsq+D,%rCisc0+EVNEEb0<6DfTD3@Wcc8F`V,7F!,O;Dfol,+DYk5G7=m%+<Y`DD.Rg&Bl7Q+
BOPs)@V'+g+EM%5ATqj+B-;D4FD)e=BOtmu+C\bhCNXT;/e&.1+<Z,^IXV_5+<Ve%67sC$ATMs3
Eb-A&@:O(qE$-tm%144#+ED%7FCZLA@VKpoBP([_ALBPr1(=R5+<XEG/g,1GF*)>@AKYGj@r$4+
+>bhrBkM=%EbTE(+D>2)BHV/+F)>?-@q]Fp%144#+ED%7FCZLA@VKpoBP([_ALBPr1*A;1%144#
+F\cgILQVn$8a@X?p%dP@W=DO3I,[f1N@OnF>bn#Bk(sn1,iih?Tqj?:1\VlDKTf-EbT#+A79Rg
FEqh:F!+n/A0>;'@rH7.ATDj+Df-\?FD5Q*FEo!:@kM.3@<,p%@V'7kB+51j+<Y*'A7]9oBl5%c
+?;&4+=K!!1,N`SDD3gp+EqB>DJs_ABOQ'q%144#+CHj:DKKH&ATBLYBl8$(B4Z*=055<GAS5Rp
1bWHWDdda%DJ(^XAo)BoFD5W*1bWHWDdda%DJ([^?m'Z,ASu(&ATAo8BOu3q+CT;%%144#+Cf(n
DJ*O%+EVNE@VK^gEd8dADKKH1DII@&+DGp?Bl.ft@ruc78l%i-+<X6'G%De)CiX)qA9f;2BlkJ+
+Cf>-G%G]8Bl@l3E,oN"Ble!,DBNM2Ec5tN%144#+B3#c+EM+7Bjkg#A9Da.+D,P4D..N/F`V\6
Ci"A>GAhM;F!,+6Bl7Q+AoD^6@<,m$@Wcc88K_GY+Cf>-@qB[uARlol@W-C2+CfG'@<?4$B+51j
+<Y3;D/^V=@rc:&FE8RHBOQ!*GA1l0+Du+>+Dbt)A0>T(+E)(,ATAnc+Eh=:F(oQ1F"SS:Bl%T.
BOQ'q+EVNEA7]puF(HJ8Df'&.F(8lpD.O.`+<VeKD]iP.E+LX2$4R>"/g+Oa?TDn:1N-k]EHQ"T
3H'.RD/2!cAns)CA27LU?m%gTDKBN&ATAo%A7TClB-:V*BOPsq+EM7-ARf.h+D,>(AKZ)5+C]&&
@<-W9@UWb^F`;CS%144#+B*!!+Du==@V'RkA0>80/no'4?m'&qCh7Z1@<,p%@rc-hFCeu*@X0))
+C\bhCNXSK+B3#cGp%0ADfol,+Dtb6ATAo&AKYDtFCfK(A0>?,+A,Et%144#+CSnkBl5&%DIal!
ASH$p+C\bhCNXT;+DG_8AS6$tFEo!CF!+t5Bln'!@;IP=<+ohcF(o/r@psC#Anc'm+EqaHCh+Yt
AKZ&.D/a<&+EV1>F<G10Ch4%_+<VeNBln#2;b02+1,Us4BOPsqATKCFBeEsL%144#+F\cgILQW,
+<WKrC1CpcF(f-+/p)>[%144#+AP6U+Cf>#AKW]d+E)-?@W$!)FCfN8F!,R<AKYGj@r$4+F!+n(
@;0V#F<G7*F(f-+%144#+>Get@W$!)-S?bU$6UH6IXZ`p%13OO2D-+[4C:$nBJVS_3GWGG20WhH
E,%3`@X<*8DJ_@?5%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHV5&C1Ums+D,%lBl%L*Gp%3B@<<W9
Bl%T.F*)>@AKYD(;b02+1,Us4BOPsq+EqL1DBNn@FED57B+51j+<YT3C1UmsF"SS,+CT+0FD,B+
CM@[!+CT/+FD,6++E)4@Bl@l3@rGmh+CHo_?m'Q)@<<W9Dfol,+Dk[uDBO"BDfTD3@3B5lF(c\7
D@Hpq+<Y'2F`_"6DfQtBATMr9@3B5lF(c\7DBN>"ATV;h$6UH6IXZ`p%144#+<XEG/g,@VEb$;,
F!,FEF<G"0A0>;'BOPsq+DGm>F*)>@ARlotDBN@1Eb0<'Ecu#)+EM@;F=n"0+<VdL0H`)/+E2IF
+=DAOEb$O,$6UH6+AP6U+D>2)BHV#1+Cf>,E+*cuA0>u4+Eh10F_)\9ATVs,AThWq+>"^IEcQ)=
+DGF1D..NrBHUnqBl%iC%144#+<W?\0fL4fATT%BGAhM4-OgD*+<Z,^IXV_5%15$H+CI<=@W-@*
1NYBqA9<#SBlmoECMS3@BeV7uG$dF@+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&
Bl7Q+GA1r*Dg-7FAnc'mF!,C=+CoM,G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=
GA(Q*+BD<6+DGm>De<T6+B3#cEb-V>+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:
FCfJ?ARm5!$6UH6A9)C-ATJu'F`\a6An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6
+EM4)Eb0;7Ch[Zr3XlE=+<Z,^IXV_5+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9
A1q\ADfTB0/no'4-OgD*+<Z,^IXV_5+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJr
ARfKuDf-\ABl7I"GB4mJH#n(=D0$hDBOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0S
Df'&=F(f!&AM7V.BJ4+EDfTB0/no'4?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0s
A0>E'Bm+'/%144#+EqL1DBMtV:*=7l+E(k(/e&-s$90X\?p%dP0m#BcDe=61H#RnK@:j=sGAhI[
3&GSn?Tqj?<+U,m+CJr&A8Gt%ATD4$ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBi
ARmD&$4R>&/g)9E4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7
A0>8P:IJS5Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)
G%De+BOPdkARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO0eb4&+<Y&S?T)\3C2[R#G%*@DCNFf7
H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&uk
F(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%14gE/g)8Z?p%e,0k>B<CLf.VH#RqC@<?Bs
BJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2045o2F!+m6E+*j%+E2@4AncK4Df-\7@:N)3
+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,ARfh#Ed8d;Df0`0DKKT2DBNk8+EV:.F(HJ8
H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s$=I(LDIb>@De*cl?k!HPF_PZ&C2[WnBleB:
Bju4,Bl@lE0ht%f.UmO7Ch.:!A7TCqFE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3
@WcC$A1e;u%15is/g+YEART[l+EV13E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!p1Eb0-1+=CW,
F(H^.$=e!aCghC++EVI>Ci<fj5s[eODe*="Bl%<?3B:G03Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$
Eaa$#+?V#;5s]7(A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$
Bk)7!Df0!(Bk;?.@;]TuDfB9*+A,Et+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp
-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBnATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&
DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;
67sC%ATT&*BleB:Bju4,Bl@l3A8-'q@ruX0Bk;>p$>O*^BlZ?t+=BcW6psg<6qL9!8l%iR<'a#C
6qL9!8l%iF8Q8)L;BSS-6rQl];F<lO<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA
;C;n\C1LjhE]lH+C1LjhEZcnU-Ql#W6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$[':IJ,K;Fs\a6qL9!
8l%iD=B&3e8Q$oY%14LuA7TCp.6T^7F(KH&F_PZ&A8-(*+>=63%15is/g+e<DImisFCcS*BleB:
Bju4,Bl@l3F(96)E--.1$?^;u@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2
F(Jl)8l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_
<_Yt)@WcC$A86$nFDl)6F(9-*E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a
6qL8c$;+)^<_Yt)F`:l"FCf3*A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL9<8l%iC
:I@NA;@Nt*:IJ5X6m-VkA79RkC2[X(Dfp)1ARoq#E-!-o:IJ,W<Dl1Q;cH%Q779^F%15^'6rm#M
+ED%0ARTXkC2[W*8l%iR<'a#C6qL9<8l%iR<'a#C:ddc@8Q%WB:IJ,\5t=@3:I@NA;EIKH6q9gJ
6r-0<8Q$!)%15is/g+\9F*)G@Gp$R=Bl%<&Ci<flCh4%_@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1?O[>O$4R>UBleB7Ed;D<A26(Q$>3pfATD3q05>E9+>"^G
BOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hnt4+>"^H
ATf1EGA2"F%13OO+=\LA9LV6B?m&lqA0>8`8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^/e&-s
$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO
+=\LADIn$&?m'?*G9D!9CLqQ0?t=4tATT%B;FOPN8PVQA741/O?m&lqA0>8jE-#T4+=BHR6V0j/
2((I??m&m!+Co%q@<HC.Et&I!+<VeNBOu'(@rc-hFD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/%144-
+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)+C\nnDBN@uA7]9oFDi:0C2[X%@<-4+/no'A
?nNR$BOr;sAS,@nCig*n+<VdLBlbCO/0K%WEc*"<AnE00Bln#20J4JLBOu'(0d'mI;b02+1,Us4
BOPsq+DGm>E,oN%Bm=3"+EVNEFD,5.F*(i2F<GL6+CoV3E"*-s+<VeJ@rc:&FE9&W<+ohcAoDL%
Dg,o5B-;;-F*)IGAoD]4A9Da.+EM%5BlJ/:Bl8$(B6%^.GrcBA%144#+<VdL+<Ve:BPV9iF(f*$
E*m$gDe*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*BiFtRKDF!hD(%144-+<WrmDIn#7
D.-ppD]j%B@;KXiBk;<-?qF0t:-r>2@rGmh+D>2)+C\nnDBN@uA7]9oAoD]48p,)uFCfJ8DJsW.
@W-1#F"SS1DffQ"Df9D6Anc'mEt&I!+<Ve:@;[2sAKZ&9DfTE"+CT=68l%htD.-ppDf[%FBln#L
%144#+<VdL+<V+#+<VdL+<VdL+AP6U+ED%%A0>c.FCep"DegJ(DIal2FDl22%144#+<VdL+<Ve@
E-Z>14ZX^.FCmKTEb/Zi+=D&FFCep"Degt>E-Z>1-OgD*+<VdL+<VdL1a$a[F<DrKDffQ"Df9Du
BlJ?8@OF6/:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV<+ohcE-67FA8,OqBl@ltEd8dH@<?0*BlbD7
Dg*=<DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et%144#+<Y3;D/aPK+@^9i+D#e+D/a<&+EV:.
+CJr&A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D%143e$6UH6+<VdL+<Wa,-YdR1A7]p,C2[W*
F`_>6F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>E,oN5BlA-8Cj@.EBQ&*4/g(T1%144-+<Wrm
@Wc<+Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen51FXG[@<3Q#AS#a%@rHC.ARfgnA1euj+Co%q
@<HC.%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfguGp%0>F<GC2@:X(iB-;;7+CHlG2E!H9E-67F
-RX+VEb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL+<Vd9$4R=e,9n<c/hen51a#8!@WHU"Ed8c_
3%Q1-0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn$6Uf@8g$,H0JjnmAStpnARlp*D]hXp3A*-2
@;]TuFD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:gB4YTrFD,B0%144#+ED%5F_Pl-A0>;'@q]:g
B4W3-D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.@<?4$B-;A/EcYr5DBNh>D.7's/e&-s$6Uf@
?pmgb8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnBAfuA;FWbR5ARlp#DfTD3FD,*#+>u&!A8,Oq
Bl@ltEbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=FWb+5AKYN%Bl7Q+F)Po,FD,B+B-;D=Df022
+:SYe$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`CER)#DIIR2+Cf>,E+*j&@VKXmFEnu\+Dkh6
F(Jl)FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO,9nEU0eP.41,C%F@;^3rEd8c_2Cot+0JYF,
-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:/hf+0F!,UHAKYo'+Bq?1:gGJ_FEDJC3\N.!
D/a<*@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7%144#+D>2)+DG_8Ec5K2
@qB0n@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+)@;]TuE,oZ2EZfO:EcYr5
DK?q=Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7Bl5&(Bk)7!
Df0!(Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7+<Y0&DBNt2@:UL!Ch.*t+D#e>ASu$iA0>T(
FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.DId<h+DG_8AS5RpF!,RC+CJqrBl%@%?k!Gc
+<Y04D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3@:UKsDf03!EZfI;ASj%B<+oue+Eh=:F(oQ1
+CSekF!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKqF'p,!DIaktA8lU$FC655D]j">AThX&F<G[=
AKYi(F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9A79Rg+DG^9A8,OqBl@ltEbT*+/e&-s$6UH6
=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8Bl@l3De:+a:IH=GATMF)+F.mJEZdtM6m->T
F*(u6+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$4R=b+<VdL+<Ve%67sBi
@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++CT.u+EM4=F<F0uA8c[0
%144#+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E9
05>E9Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6+<VdL+AP6U+ED%7FCB33+A*bbDIal$Eaa$#
+EV:.+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\7@<6O%
E\;'@Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A1hS2DC5l#
%144#+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++E1b7Bl7Q+@<?U&
DKKT2DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$s8F)tc&ATJ:f
+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL+<VdL0HiJ20JO\4C2dU'BHS[O@:WneDK@ID
ASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b+<VdL+<Ve%67sC&D]j1DAKYo-A0<:0AS,k$
AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"G%De<D]j+4F<G[=ASiP!$6UH6+<VdL+AP6U
+AtWo6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0+A*bbDIal3BOu'(Eb/ltF*(u6+DG^98g$,H
0Jj4G%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2+AtWo6r-QO=WhEr+CT.1DerrqEZf*+$6UH6
+<VdL+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4+=C&U5t"LD9N`_P$4R=b+<VdL+<Ve%67sC&
BOu'(Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-EZbeu+<VdL+<VdLEb/lo+=D)DA7TCaF=0-t
@lc8eBOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3762Q*AfuA;FWb+5AKYo/Cj@.;DKKH1ATMs)
A0>T(+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-ATq^+%144#+Eh=:F(oQ1F!,C5+A+7/=`8F*
@ps6tA9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9D/^V=@rc:&FE8R5DIal1ASc9nA.8kg+<Yc>
ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!Df0!(Bk;?<+B3#c+A,Et+DkP)F^])/AU&01
@;0V#+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_
CNCsJ@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+@;]^hF!,RC+EV:.+E_a:+E(j7FD,5.Eb/m+
Cgh?,AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:DfT?!A0>r3D.Oh!$6UH6@:X+qF*)81DKKqB
FDi:0Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%+EVaHDIm?$De<T(GA2/4+CK57F`_4T+>@1G
E,oZ2EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c+EM+9FD5W*+EM47F_kS2@V$[&ATMs3Eb/c(
@:jUmEZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#+CSf(Bldi.@q]F`CM@[!+D,P4+CfG+FD55n
C`m5+A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4Ch[a#F<F1O6mm$u@:EqeBlnVC%144#+EVNE
A7]1c+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&+B<;n@rGmh+EM[EE,Tc=+D>2)+CT)1@<lo:
E+*d/Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+qF*(u(+EVNEF)Q)@+ED%+BleB-Eb/c(A8,Oq
Bl@ltEbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfAEc5u>+DG^9FD,5.Eb/lpGT^RBE,oN2F(oQ1
.3NMHG9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge3Zoe"GB.V>B."gBG]P!U/g+\BC`k)Q%144#
+Ad)mDfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<Ec5u>+D5U8FDi:DBOr<.Df?h8AThX$+EVX4
E%VS,%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-
DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T
%144-+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6
ATN!1FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=
ARlo8+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgTF<G(3D/E^!A9/l(Ble60@<lEp+D,P4+A,1'
+EVNEEb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86EZf=>E$0:BF"Rn/%14=),9S]n0J5+'/Kdf,
G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO
+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"
FCeu6+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8
@OV`n%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'
DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6
@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+D
E,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)e
BOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea]
;aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=)
,9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LA
C2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.YA7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*
-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoY
Bk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!
Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-pp
D]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0
G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB
+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,
AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'
Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5
?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0
ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=
@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_
B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-
ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,
+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LO
ATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<
3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCi
F`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)
FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,
B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq
+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4
+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)
0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5
?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
04Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1
F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=
+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8
D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-
+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1D
AKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:C
F`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm
/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>
$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(
+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/
@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=
+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i
+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8
+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F
8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:
05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*
3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/
:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&q
FD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%
@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@
%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I
<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(
F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-
+<VdL+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%144#%144#+B3#gF!+t2
DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SZ#+E2.8F<D\K
IUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%F
A7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[E
E,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#
ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr
+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/g)8G$6UH6
+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&
DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$6UH#$6Uf@5p1&V
G9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0
%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSf
E+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL
+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.
ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil
4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"+:SZ#+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/
E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nn
DBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+<Vd9$6UH6+<VdL+<Vd9$6pc?
+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7
F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,
Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6+
+Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21
ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL
+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsK
C1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']
ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8
%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+q
F*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17
+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@
DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<
A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u
?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc
+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6
+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG
/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG
$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?
%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;
+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5
BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj
/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^u
FE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O
0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0
@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)
ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#
+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"
+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU
+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\t
D/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2
F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,
+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*
A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,
@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5
+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&
0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(q
E$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U
-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBm
ATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp
+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U
+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2
-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l
8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@
Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@
DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08
%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-
F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoE
F<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4
BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC
$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>
+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C
/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF
@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"
Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL
+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67F
GB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'Ds
Ea`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1
D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7
ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q
@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dn
ATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8
BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%
EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3
D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;o
C2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2
/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8
F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL
+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,
@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*
D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G
78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7
EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ
:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t
%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;
Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>
+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe
$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)
%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6
+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("
@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iF
De*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0
@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19
Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl
$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,
@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9
D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%
%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO
+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?
+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31
DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4
E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A
@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)
@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/
A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWp
AM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@lt
Ed98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3
E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A
+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$
F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)
ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe
$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;m
Bl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7
F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO
+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@
Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0
Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-
H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k
+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*
1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(
+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@
AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/Kdbr
Earc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4
-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(
A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031
ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8
@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et
+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:
0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6
+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qB
BOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&
DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?
+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL
+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0
A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3
Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D
8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
F_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$
B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu
+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4
@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4
ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4
ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2
DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60
@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:E
A8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^h
A0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'
+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9
$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#
+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg
+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%
@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#
+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6
@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCj
EZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL
-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=
A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2
Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A
?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5
F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>
+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<
0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!
+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1
+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&
A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%
Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s
@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3
@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<
De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>
ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,
Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B
+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c
%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&o
H=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^S
H=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$
+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9
FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1
A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9
GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2
@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA
+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+
@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1
FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)
E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4
DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#
+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)
E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u
%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8
Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)
ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9
$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''
8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>
A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)
DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#
+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&
F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8
/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,
/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l
/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,
AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[
@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB
2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,Oq
Bl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`R
A8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-
+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L
;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2
@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f
+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_
>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F
/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)
D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])
+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl
1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf
+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$
?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*+
+E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,
Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1
+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4
Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4
DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*
+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO
+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#
F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.
+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)
/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUm
EZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b
.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k
+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'n
CggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.
DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&
AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1
BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoC
F(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,
+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&
+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY
$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$
+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?
ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#
%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&
FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:
3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#g
F!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ
+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P
6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&
A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaE
A9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+
@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*
FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.
+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!l
F*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8
Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8
DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!j
AISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?
E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7Zln
BOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt
+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!
F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!
?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>
DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("
@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.
+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9
AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8
Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP
/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03
@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?
Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+
A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdk
ATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*
Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4Cgggb
A0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.
E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0
C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`
CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8
De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*
/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhm
AT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)
3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm
+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"
EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%
A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<
F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-
+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i
1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:
F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn
+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6
@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-
+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TA
DIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&
DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;
@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"
DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-
$6pc?+>GK&/i#=-/KeS8Fs&2WBlGL1$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+
8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%+E(j7DfBf4Df-\-De*E%FCAWpATJu.
DBNA,E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9<+ohcCgh?sATAo8@:F%a+>GVoBlbD7
Dg*=BDBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1@q?cpDfQt4F`_bHAKYK$A7]g7%13OO
+=\L4Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGnASrW!A7T7^+EVNEFCAWpAKW]_/e&-s
$6Uf@<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!A867.FCeu*FDi:CBQ&);%144#+EV:.
+Dtb7+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n0J5+:+>"^.@;^3rEd8c_2Cot+0JYF,
-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*DKI!U1*C:K+CJr.DfTB0?m'?*G9CR;
Ch.T0FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!+<Y?/CiFG<8l%htA7]1c+EqOA
BHVD1AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+0F!+n/A0>GlEboH$EX`?u
+<X9(F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-+@C'fEb/a&+CJVeG$lG0Df/uo
+CT;'F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D$4R=e,9n<c/hen51*A.k6tKk>
D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bh
CNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nfj%Bl[cpF<G+*Anc-sFD5Z2
+CT5.ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1HE+*j%F!+n%A7]9oFDi:3Df00$B6A6'
FD5Z2+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo:L\'M
@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-
DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P
9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&
A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/r
EZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk
+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D
8PUCDAU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJATAo0@:C?uA7crmA7T7^+CJ2jBl7QU
De*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$%144mE+*j%+=DVHA7TUrF"_0;DImis
CbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#
6tp^a@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj/oY?5?m'<)A8,XiARlp*D]j1D
AKXNC<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHOEb0,uATJu9D]hY<9H[hY@;]^hA0>u4
+E_a:+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4
AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe@r$4++D58-+EM+(FD5Z2+CSekARmD9
%13OO+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%A7]9o/Kf+GAKZ).AKYMtEb/a&
DfU+4$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.(
$4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8Bl@l3@WcO,+D,P4+A*b:
/hf"&@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1
ALDOA6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe$6pc?+>>E./ibpM+>"^3@ruWu
ATAnJ1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSekARmD&$4R=e,9n<b/ibOE3Ahp2+AH9i
+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,
Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;DerrqEcW@3DIak^:IH=A@:F:#F(96%
ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,8l8P?%13OO+<W-VDIn#7@!-@$@rGmh
1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@%13OO%14=),9SZm3A*<P1E\7l9jr;i
1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#78ono_FE_/6AKXKWF@^O`+ED%4Df]W7
DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6UH@+D#(tF<Ft+De+!3
ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>
DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@%13OO
+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i
+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;
+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V
?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg
+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.
F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'
Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*
+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>
A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[E
E,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4
Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#
.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]4
8g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W
%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU
<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9
C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$
$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3
AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-V
F*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1
%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&
$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5
%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"
E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSB
DJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-
+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h
/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-
+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe
$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0
F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>
Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;r
DfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k
+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et
+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&
A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"
Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3+
+EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n
+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16igA8Gt%ATD4$ARBA!Bk;Kq
FCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,
@<?(/+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7
+EV:*F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,02-)%ATD4$
ARBCsDeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+C&T#AS-:&FEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHV.(%+Co1rFD5Z2
@<-XA+D5_5F`;CS%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8WBl89/DKTf-
Eaa'$I16NgBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl
05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XWT'F(oN)+DPh*Ch\!&
Eaa'$+Du+>AR]RrCOIfX%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9M
DIS#'$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I="t8Bl7Q+
C2[X!Blmp,@<?'':ddd$/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g6!
$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5I=">(EcP`/F<F1O6m->TDKTB(
I4bs9+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9
@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/%144_DJsQ4@;L"!H=[Nm>\.e`HY%);
D.R`rFCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC8T&W]Eb8`iAUP!p%16?L
AS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?RH#R>8Ch[d&HW3O-;c#bT6r-0u
HX'<aEc#6$<,ZQ!<(KSZ:dIiE:I?6I+<VeTI9Trq@:s.lAS-:'An*l$84c`V5u'gD6[`5_>XNFH
D.RU,<,ZQ!Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%I16Ng
BR+Q.EboH-CO9Z3Ec#N&@:NkjAU&WM>Y]3XD..6[Dej]3DfT]/Amo1\FCf\>+<Z)\>?l,UB4Z*p
Ap\6(@le4?Ec#N&@:NkjAU&W/+C%9PD/Ej%FB!0oHY.2:D..O-+D?%>ATDU$DJNfo+CT.u+D>J%
BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0I16NgBR+Q.EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<
Ch[u6+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9B6%s-Blnc/+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>
AoD]4B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'Bl@m;HX'<aEc#6$<,ZQ!BkCd`ATMEm
FD5Z2+<VeTI9Trq@:s.lAS-:'An*l9Amo1\F(Jj'Bl@m;>p*B>Df'?&DKJirCO9c5FCfK)@:Njk
F(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5BkCk'HX'<aEc#6$<,ZQ!BkCit+<VdL
+<VdL+<VeTI9Trq@:s.lAS-:'An*l9An-6p+C%9PD/Ej%FB!0oHY.2:D..N/Bl8$(Eb8`iAKYK$
D/Ej%F<G[:G]\?C$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$FCflI>Y]3XD..6[Dej]@ATV[*A8Gt%
ATD4$AKZDL>?l,UB4Z*pAp\6(@le[BFD>`)Ch\!&Eaa'$I9dt#6Z6gYASuThDej]=Eb02uEb-@e
@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<mI16NgBR+Q.
EboH-CO:2JCghEsG\1u?DfTB0I=#3oDfT]'CfG=gHZaOK@<?(*Ao`*6Eb'56I=5=)E+*BjEb/j0
BkCj9Fa%Y1FCf]/Ed)GBA930)+C%9PD/Ej%FB!0oHZa4MEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P
+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@I16NgBR+Q.EboH-CO:8DEb'!#FFAL@:2b/i
@;Jn]CO:8DEb'!#F<D\K+<VdL+FSZB>]=+aATD?oHYI)%3d5L_A8Gt%I9dt#6Z6gYASuThDej]:
@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLaI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTM
ARp2u$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC@;]Tu8l%j'%13OO>]aP%FEDVO
C2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.tF<G[=AKXSf@rGmh+CT.u%16Wa
@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XlE*$=%%OB5)71ASuX-ATD4$AURc;
/mSnn>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI6m-#S@ruF'DIIR"ATKI5
$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,ASuT4Ao_<mD.RU,F!+n3AKYPuFD,6+
3XlE=+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(GA\O9Ec6)>+Dbt6B-:`'@s)X"DKKq\
+C')$EajDO+?:QTBle59-YII<F`;5,D.P)B%144#>\S:kD'3(W@8pf?>Te*1AnGb%ARlp#@:O=r
F#kFKG%G]'Ho)sVBle59-YII<F`;5,D.P(G-XUe8Bk;KqFCf\EHjpE*+C&JqA:&$4ASl.-AUP!p
%14C(>\S:kD%-gu+<Ve%Df..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5F`8I:ART+\
Ea33pDffl8FCfeuBPDMs$7-f;+<VeCBl.R+@<?4%DBNe)Gp$R-+D"u&ARlotAftf0+C\nlDf'',
+CQC+Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%14C(+<YlBFD)e9F(KK)D_5p:DIdZq+Co&"Bl.R+
ATDiE+@UHbEd;b?Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&I=2P3,p4<Q@WGmeCLqU/+D,P.Ci=N=
+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.6+<Ve3FCf]=FEDkE
De*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.Ebf5s+Dbb-
AIStm+<VeKBPDN?%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p5rL/j)7FIXZ_gHQXqW@<?(*+Du==
@V'RRBl7L'+EMX5EcackDf%W]0d7`g%14C(:-pQs5(7s0INT(,,p6H(DIe*;ATD6gFD5T?%16?O
DIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$+C'#"G]\%LHYRJ0Ch\!&Eaa'$I=2P3
%16?^AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5
DK?q=Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+EDUB+E)-?8g$)G0JO\Y
DIal!AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc%13OO>[h8W
Bl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&8l%i-%144#>\J.hAp\35FDu:^0/$gR
A7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R^7"$1lF!+m68du+M+CSek
Df.0M8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4
G@>N'/n8g:06_,GBeN:k@r5XlI=#pA@r5XlI4bs9>\S:kD%-gp+A$HlFCB!%+A,Et;bpCk6U`U:
$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X(
Dfp)1AUSnt:IJ,W<Dl1QI16N++DGm>@;L"'+CQBb+CSekDf.0M8T&Tk@;Ka&BlkJABln#2>]aP%
FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et%144#A8,OqBl@ltEbT*++ED%5F_Pl-A0>u4
+C]J-Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u$$6UHrFCf]=FEDkEDe*ZuFCfK$FCd(Q
%16?SFCf:u$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.hAp\35FDu:^0/%9QDIdZq
/oPcC07A1d@;]Uo@sos=$6UHrFCf]=FEDkK@;]Uo@soJCATDj+Df-\&FCf]=FEDjb/ibO=/hqbs
@;]Tu@V'h'DIak!$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+B.b<'EbTH4+Eh=:F(oQ1
F!,L7EHPu9ARlp#De*QoBk(RnBl@lA+B3#c%144#AoDL%Dg,o5B-:Z"DeC23Df^#A+E2@>G%kJu
+Dl%;AKY])AoD^,@<?4%DE846+<VdL+<XouAS5^pHY%);D.R`rFCfk0$4.gt>\S:kD'3(sEb/j0
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9
A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKaA8bs#;gE8&@<`ncBkM*QBkM+$Bl7R3
%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07=9:+<VdL
+<Xp,DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VNHVe-g
A8bs#@UX=hA0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('
HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo@kD.u
F(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#
AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8
FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('
HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&
Eaa'$/S]3707=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp#DIe**DKTf-Eaa'$I16NgBlmp'%144#
6?R!YA0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bB6%p5
E%W8*:IGX!+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>F"SS7D]in*CLnVnFCf]=FEDkEDe*Zu
FCfK$FCfkCA8aL<$4R=g+C&AeB5)71G%G]'@<?4#I16N0+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn
,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g3Ci^^HC2[X!Blmp,@<?'.%14C(
>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3X
D..6[Dej]?AT;j,Eb-AA>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:m,/ATD3q05>E9>]aP%
FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.
AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4
<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'
B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHYmS?+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*
I16NgASu%*;eTTMARp2u$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!Df0!(Bk;?.@rH7,@;0Un
DJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71
;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!
4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-
DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3
%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+A?]^A0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR6"Y4MEZf4-
CM@[!+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk$6UI-Ddd0fA0>]&CLnVsDL!?s+EM%5
BlJ/H%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7#B@:UK.C2[X!Blmp,@<?'.%14C(>\.e`HZit@
@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]9
Ddd0!I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"
AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B)in+CQC:DfTW-
DJ()&Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%%144#>YJR*AQXCnBl%@%
/g*GrC`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.A8-'q@ruX0Gp%0IARfFdBk:ft@X/Ci
+<Xp2AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%14C(>[h8WBl89@ATD6gFD5T?%14C(F(KH.De*Zu
FCfK$FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F
%13OO,p78?FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-73$7-g9ATV[*
A8Gt%ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0Fa+?&,p6H(DIe*;ATD6gFD5T?%16?L
AS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZNb?C2[X!Blmp,
@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gY
ASuThDej\p67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2FI16Mm
$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:G<C
FCf]=@UWb^F)59+BR>/LASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL>XNFHD.RU,<,ZQ!
:-pQUGA1r*Dg-8N%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GA
FCfN-DJ*csH[RP\Df'&=C2[d'06CcBE*RKrG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC
/g+tEDKU2P%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-
DJ*csH[U?bASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL+<XoVDf'?&DKJirCO8fC/g*b/
A7]@eDIm?$AoDKrATDj?%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD'2bg
F<GL@FD5Z2@;I&pF`_;8E[YuX+EqOABHUi2@:X(^+C'#"G]\%LHZNb?C2[X!Blmp,@<?(//e&.m
@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G;fm%oDJ)peCO9<.AU&<:F`2A5
F(oN)Ch7sA6=FtQ@;]=lAU&<:F`2A5F(oN)Ch7sAI9]NcEc#6$<,ZQ!+EM+9C2[X!Blmp,@<?''
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foK@UX@g@<Q3eFCf]=
EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUF(KG99OUn3=<M$pFD,T5.!$g[FCf]=+CT.u
+Co2,ARfh#Ed<'B$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#;KZk"
>]aP%FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n\@FCf]=FEDkB
Ec>i/FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqL4=
BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.B6%p5E$0%,D.P=/$4R=g+C&AeB5)71
G%G]'@<?4#I16N0+D5_6Ch[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>
%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F
>Y]3XD..6[Dej]4Ec>i/F<H!:;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'c
FCf]=EHQ2AATMR'B5D.+I=35C6Z6gYASuThDej\p67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+FO\+
>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHkF(HJ!9OUn3=FP@1+Cf>,
E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU+:SYe$6UHW+EM4-Cht58
@rc:&F<Du:FCf]=FEDk=@<?o?DfQt*FCf]=FEDkNBRM<PBlbD@EbTW;ASrW4D]j.8AKY6"AU&<=
FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1@q?d$Aft>P
@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$Ec5H!F)to'
+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&
@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%
Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#
>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5
>\.e`HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>
DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=
FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='%144#
@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)F<G[=BlbD6@<iu9ATN!1F<G:8+Eh=:Gp$pA
DJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.
@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%OB5)71D09Z:Bk)'tF+&BkI9Trt
ARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHrFCf]=FEDkEDe*Zu
FCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Et&I!+Cf>-FE2;9
Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l0Hak=@<,ddFCfK6/e&.1
+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O=)q_gE+NQ&
Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((sFCf]=FEDk2;F+,Q76s=i+EqOA
BHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9%16?SFCf;3%144#>]aP%FEDVO
C2[X!Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%BP_BqBQPA%ASlC"HZsL=E,]B!I3<!;G\(D.
8g&"iF`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7+E(j7F*)G:DJ+#5@;]TuDffZ(EZf:BBOu3,
FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+ARlp$Df0H2F`)7CFD,*)%144#@rH7,@;0U%
Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&>]aP%FEDVOFa%Y1FCf]/Ed)GBA93/M+EM+*
+E1b%AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+#SK$6UI$@;[2sAKZ,:ARlp*D]i\(DImis
FCcS"ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4F*1u++EqaEA9/l8BOQ!*@ps6t@V$[!@;^3r
Ci"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=
FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0F)Po,+DkP)F^])/ARoLsBl7Pm$6UI*F!+n-
G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>IASu%*ASuX-ATD4$AUP!pC2[X%@<-4+1,2Nj
/h1USA8kstD0$h@/M/)UAS,@nCige1Bk)7!Df0!(Gp%'7Ea`frFCfK6/e&._67r]S:-pQU<+oue
+D,>(AKY].+E_a:A0>u4+EM+9+<Yc>AKW++AS,@nCigdBA8,OqBl@ltEd8dH@<,dnATVL(Et&IO
67sC&@:F%a+<YB9+EV:.+DkP.FCfJ8Anc'm/g+5/ASrV5@3?\1ATo8-Bk)7!Df0!(Gp$gB+CfG'
@<?'k%15is/g,7LAKW+7@<,dnATVL(F!)T>DBO%7AKW+4@<6O%EZet.Ch4_tEb-A9F(Jl)FDi:C
E+NNnApGLAFD,4p$;No?+E1b0@;TRtATDi7AoD]4@3BMtEcc#*F_kK,+Co1rFD5Z2@<-WG+B3#c
+<Yi=Eag.>A8lU$F=A>B@;ZM]:-pQU@V$Z)+E_a:A0<":D]g/FD/Ws!ApGLAE+*cqD.Rg#EZcKG
ATW$.DJ+#5+<YB9+<Ve@DIdI)Bk2?pC^g_H67sBkBk)7!Df0!(Bk;?<+<XBeF*(u6+<Y91Ch4`.
@<,dnATVL(F!+t$DBNk8Cj@.4AKYJr@;]^hA0>?,%15is/g+_9Bln',B-;;0BlbD/Bl%?'@;]Tu
Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch54.$;No?%15is/g+,,AKYhuF*(u6+D,>(AKYJkDBND"
+ED%'Eb/[$ARlp-Bln#2FD,5.@ps1i3XlEk67r]S:-pQU@rc-hFCf;tF*(btC2[Wi+A,?o;cH1`
?X[\fA7#cQ:-pQB$;No?+BLj,:.\2N3ZqjIC`mh5AKW+7@<,dnATVL(F!+t8EcP`/FDQ4FCh[s4
ARlolEb-A6AT;j,Eb/c(@X/Ci:-pQUFD,5.8l%htF*VhKASj%B8S0)jDfm1CASl@/AKYE!Gp%$;
+EV:.D'2GH6m-\fCht5(Eaa$&/g+;8FU\[Q67sBj@;[21F(&ZlCj@.3A7QfkA7TCrBl@ltC`m\*
Ea`frFCfK6+C]J8+<YrJFW_f:@;]t$F<GX5An>e(%15is/g,1GD/XT/+CfP7Eb0-1+E1b0@;TRt
ATDiE%13OO9gM]W78crJ;GC(Q3Zp+!3Zp*c$4R>;67sB[BOr;uDfT]'F<GL6+EV:2F!,F1Ea`fr
FCfJ8Anc'm+DGmX%15is/g)8Z+<YE:@;TQu4!5qnH#R=D+Co&)@rc:&FD5Z2+?L]h@;L't%15is
/g(T1:-pQU+<VdLC2RHsAKY].+CQC9@;KXg+A*bo@;TQb$;No?+<VdL+=M>WE+LI@A7]glEbTK7
Bl@l3A8bt#D.RU,F!,R<AKYr#Ea`frFCfJ8/Kf.\E+L/+F!,L7EHPu9ARl5W:-pQU+<VdL+<VeF
DJXS@-nB"LFCf)rE[`,FF!+t8EcP`/FDQ4FAU%crF`_2*+E)@8ATAo8H#R>9+EqO9C^g_H67sB'
+<VdL+<Y-)+E1b1F(Jl)@<3Q$BOPpi@ru:&+Dbb5FE8QQF(Jo*A8lX!@VfU)/e&._67sB'+<VeM
@;L't+DGm>@;[3!G\(B-FCAWpAKXSfAU&07ATMp,Df-\>BOQ!*E,ol-F^o!(+CQC9@;L't%13OO
5uU-B8N8RM+<Vdg+=JaSDKKH&ATB4BGA(Q*+>G!]F(HJ&F(8ou3&MgmDBNJ4D/aP=-nlc^EZd(c
+<VdL+<VdL+<VdL4!67#+:SZF:Jb1`5snUI;BS%D-nB"LFCf)rE[`,@Df'H3DIm^-F!+t2E+rlo
+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<Vdg+>GQ(%15L!6WHiL:/jVQ6W>0i+=JaSDKKH&
ATB4BGA(Q*+>G!LBk)7!Df0!(Gp$X9@s)X"DKI"8F!,FEF<Dtc+E)9C0e"4f+<W`g0b"IX:IA,V
78?f`8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#F_t]-F<G[:G]Y&V1,(h9
4>JcO.3K`p+>tq`$:Ilg:e!`<<)6C74!5q%Bl8$(B4Z*4+E(_(ARfh'+CoV3E+NQ&Bl5&3DIjr,
Df9S;E+*g/+=Js,Gs!i=0I\+e+<VdL+?L]'0F\@Z78u`B6W?iZ+<W`g-nB"LFCf)rE[`,TDfTB0
+ED%8EbT*.ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg+>Pf.%15p3<(9/@<)6C7
+?L\o.qrmCAS5Rp.3NhQEb'56F*)>@ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<VdL
+<W`g0eb9j$;s;l5tOg;7n"OC4!5q%Bl8$(B4Z*4+EqL1DBLYVFD5T'F*(i-E-!.1Eb-A7@<Q3m
+DG^9A9Da.F!)kb+E)9C0e"4f+?L]#%15Wl;b0;V9i)rT+?L\o.qrmCAS5Rp.3NhJASrVF+CQC+
@<6*)BlbD9Eb/isG\(D.FDi:4F_u)=+=JodDfQsT.3K`U+<W`g0b"I!$;No?+Au!2<(9YW6q'ur
BlbD.D/aTB+C]U=A7]@]F_l.P+A$/fBlkJ3F!,O8F<G[D+CQB@C2dU'BIP&r+Cf>-Anbn#Eb/c(
%15is/g+bECh.*t+Au!2<(9YW6q'urDg#]4EbT&qF!,"-@ruF'DIIR2+Dbt+@<?4%DK?q4DfQsK
D/=8B+D58'ATD4$ARlp)@rc:&FE8Q6$;sYq<(9YW6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7
-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFd%13OO:-pQUFEqh>@ps0rDJsE(D/aTB+EM+9FD5W*
%15is/g+%f:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)CF"&5Q@rc:&FE8RHD]hXp
AoDKrATAnT+F\HSATBG=De*m,Dfd*2$4R>;67sBHDL!@5A7T7^+E1b0@;TRtATDi7@<,p%F*)>@
ARlotDBO%7AKYhuF*(u6+D,>(AKZ21ASqqa:-pQU@rc-hFCeu*@;]TuA8-+,EbT!*FCeu*FDi9o
:IH=9Bl[cpFDl2F+E(_(ARfh'/g)8G$4R>;67sB^5uLHL:.I>fGA(Q*+Co%qBl7X&B-9ehAU&07
ATMp,Df0V=@V$Zl@<,pkF_i1/@W-C2+EV:.+?L]UBOPpi@ru:&+:SZQ67sC&BOr;Y:IH=8De*E%
-tI:=@:F%a.3N_G@<<W2@<-F#F!,R<BlbD<FE2)5B-:o0+EDU8Bl.F!FCB38/e&-s$;No?+@Aq$
=].g]85p]n+=L`5@<,ddFCfJA+?L]3Cht57BkM+$F!,L7F(KB8ARl5W:-pQU9j(:Y;F+#G<(0\-
4!5q%Bl8$(B4Z*4+EV:.+CT//G@be;4!6@8%14Nn$4R>WDe*g-De<^"AMPu867sa&De*g-De<^"
AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(
Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E9
0+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)
E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7
ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha
$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/
78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.A
DIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$E
ASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE
@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pq
Ci=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1
FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'
F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F
3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C
0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2
+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJE
FDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7
ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1
Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/
78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb
+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF
;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn
@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU
:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=
AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.
E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/
+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is/g+4d78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs
.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq
?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs
?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm
@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA
?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj
+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSek
B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3M
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH
0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGW
ASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,Lo
ASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e
@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p
+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A
+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8
Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/
$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'
+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq
+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'
DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i
4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^H
De3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&=D@<H[1
Ci<s3+EM75ASuU+Gp"[]Dfp/@F`_[IDf0B:+D#e:Ch[BnFEo!=De*Ei%17,q4ZX]?-?=3M%13OO
:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(
Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjb
B6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(
ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K
67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&Ii
E]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/
$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA
/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFF
EbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%
ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*
B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1
F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]
A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk
5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2
,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/
$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=F
GAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r
%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6
Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M
3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67F
A8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHb
C2[Wi+EBUt+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]4YAE2
B5DKqF!a'nE]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$
-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9
;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL
+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8
F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%
BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;
A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)><3le
+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK
6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+4
3\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5
Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_
+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos
+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%A
F`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h
0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP
+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*
AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI
1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU
+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet
5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=
05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K
:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=
+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji+>P\r
?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7
+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp
>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,
ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8
D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(
FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)
@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!
$;OA`;a!/a0ea%D%15is/g,@OATD?)@;R,Y+E_a:A0>?,+EMI<AKYhu@rcL/+Eh10F_,V:-[0KL
CF:6CEZc`CDf'&5%15is/g+4d78cQ?9h@K/+=DAOEbd$3$4R>;67sBkF_u(?A9)C-AKWQIF`V,)
+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`
-OgCl$;No?+CoV3E$0+.FD,_</Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4
F(K62%15is/g*P^9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[<(K/5+=AgW
De(M9De*g-G%>`4E-!Z[%13OO:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,+=MASBl%i>
+DkOsEc3'K@r,^bEc?/C.3N>:+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a$4R>;67sC%
ATT&'+E2@4An?"'ARlp&@;]Uo@j#]-+EV:2F!,=.@q]RoAKWQIF`V,)+C]U=-u*[2Ch\!&Eaa'$
.1HVZ67sBW;FO&D;GoqO:dIiE:I@9++=BN;>ZGiVEcYJuASuO&@kMnFATD$AE,\3RFCAEJDe!3l
>YnjHA8bs_E+*WpDdt.($4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h
+Dbt+@;KKt%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B
@<-H4F`;CE/Kf+JDg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>
C1Ums+DkOsEc6".$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVh
DfQt3Ch[EkA0>DsF)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d5
4$"a1D09K%ATf2;D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;
E$lc4+>Y-YA0<6I%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_
:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hnt4+>"^HATfF1$:[fb6q(!:3[\QO
DImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c
4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"
AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16ig
A7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2
Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKi
A8bs2C2[WmF^eo7E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJI
Bkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[Wl
ATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk
;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\
0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik
@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u
+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#
F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJ
Bl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,
ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:
7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@
6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1
F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/f
H#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q
+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e
$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa
@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=
@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EPi
$7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP
:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP.41+*M<7Sc]G78c90-YI".ATD3q
05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFe
F_PZ&Bl7QU:IIKZA8c@,/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi
01o#.8T&WjDe+!#FD5Z29OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi
01o#.;f?f!@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPD
A7c8XE+EQkDdtG#F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo)dA7f@j@kUi'Bl7QUDe*Zu
FCfK$FCd(DA7c8X.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"
DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^
+@L-XF_t]-F<G".F)N12Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?
BOQ!*F(fK9+D>\;+EVNEF`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#
Ed9\T$4R>WE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;
AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1
+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD
FD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg
@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e
@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]4
8l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E
3[ZX70eP.&/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B
+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dk
ATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u
$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^
:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=
@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&
FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)
%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=
@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8
D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%
B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#
F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A
@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt
@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc
$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#
+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq+<jER
6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("
@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>
BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6
IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a
+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%16rtC2[X%Ec5Q(Ch5@V:-pQ_D0]l7A8lR-Anc'm+EK+d
+DlBH8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm
+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1
$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7
+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g
+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju
67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B3
78uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./
+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*
+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+
Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.
E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2
EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:
Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8
B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0
$4R>;67sBtBl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!
De*9hALS&q3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1
D..O#@j#B%EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)
+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)V:-pQUD09Z:BlIm"
+A,Et+DG_7FCB&sATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&DId<h%16WbF(KG9-W3B3
78uuM-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cp
DfQt/A0>Q(@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4EbT&q+@S[c:JOha
9LU'U+EM+9+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j:-pQU:.\/V3ZqpT
EcP`/FDQ4F779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC.3K',779L=:/aq^
7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGGA7]"UDe*E3AU%c1
-OgDX67sBL6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"
A1K08DJsW.E+*9-.kYCXAKiK2$4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y
:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y
3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F
+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7
EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]
Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@L
G[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T
8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_r
ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?
G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6
Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8
;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4
ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3
EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq
-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!
4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?
+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]
/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk
+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9
Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is
/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7
Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&=DATMr9F(oH%DKK]?+>"^SDJXS@Dfp/@F`_[IGA(E,
+E_a:EZfF7FE7luEcF6'+>G3`FE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9
+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>F"_TW
Blmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6>n%,M
$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-
:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'0ea_`
EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$+F,)M
AThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZDe*2t
G<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk%15is
/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU
+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=
F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!F
F=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%MF!,`;
$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%
+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%
8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:Lb
De*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%
G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1
GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&
ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>Ble59
Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,O?
%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:f
Eb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$I"4Y@jtAThu7-RU$ID_</Q+ED%8F`M@P+D#G$
/e&.9E\&ha.3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4l//q#?m%14Nn$4R>;67sBo@;]V$+Cf41
A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9
?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N
0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!C
F`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO
:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(FCSumEcXB)><3le+Z_P)-S$\t
.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'B-:\t
@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?+D#(t
F<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?
+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL
3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C
1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF
%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj
.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU
+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b
/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn
+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>
%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\
.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!
-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC
.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=rF!+n/A0><%F)PQ&@<?''@rGmh%173!4ZZjk
4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U
+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD/h^">p)3O1GC"[+?L]Y
F<D\K:-pQU.P>d^C^g_gGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNG
D/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%
+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi
+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=
@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2.6qWi%13OO:-pQUCi<`m+DN$?
@rc:&F<G19Df$V,Df00$B6A6+A0>V0E+*j%%16ih4ZX]i3Zp+"3\V[\3ZpO-C2dU'BFP:X$;No?
+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6
/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUF`V,)+C]U=F)Po,+DkOs
Ec6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$<Kbe;FNlG8Nf*W-YRF8AL@oo
%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#
F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>
+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[
%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2
@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk
5uL<C8OHE>3ZpLF-RT?1%15is/g,4HF<G!7E,oN%ATDg&A0>i"DIdZq+E)-?FD,B0+DkOsBPD?q
+>"^YF(Jl)@X0(EC2[X!Blmp,@<?'0%15is/g*tg77K^D;FNuM5u'gD6TmIQ-UTq"<HD_lF'N?h
DK9H$/p25HEa1nLE(",V@9cKE@ps1Y:gn6PDe!$k@;]Uo@j_]m%15is/g*b^6m-YaEaj)4FEqh>
@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+
D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,Oq
Bl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>
C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4
BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?
+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-QlV91E^UH+=ANG$4R=                         ~>
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
0JP7;/i>RG1GLaG0f:s61,(I?0JP7</i>FA2)R<M3&!?81,(I?0JP::/i5=D1cI?P1,1X/1,(I?
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
