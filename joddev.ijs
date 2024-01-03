NB. sha256:d96d33f1e2da0151ccb4a3c0576ea34f3ccb3ea36cd2cbf84e591aea5362d748
NB. JOD dictionary dump: 03 Jan 2024 15:01:49
NB. Generated with JOD version; 1.0.26 - dev; 24; 03 Jan 2024 12:24:27
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

JODTOOLSVMD=:'1.0.25 - dev';36;'03 Jan 2024 12:24:27'

JODVMD=:'1.0.26 - dev';24;'03 Jan 2024 12:24:27'

LASTPUT=:14

NAMECLASS=:12

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

'JODSTAGEDIR JODGITDIR'=. y
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
assert. fexist png=. jpath '~JODDOCTEX/jodgraphics/jodcube.png'
assert. fexist ico=. jpath '~JODDOCTEX/jodgraphics/jodcube.ico'
assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'


smoutput 'JOD staging directories updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:X-1,g=2+?1K!1E\Y"1,g=7+>Y\o3$:+5+>k8s3$9q4+>u"u0ea_.1E\D1+>P_q0eje,0d&@s
1,9t2+>Pku3?U(6+>Ghu1c?I31E\P4+>GPm1b^%0+>Pes0ea_-0H`4q1H6L31a"S1+>k9!1E\Ir
0fC.6+>beq1*A>4+>G\q1-$I5+>bks2'=\4+>G\q2DIO$<(0_W>"*@=C1Ums+EM7CAKYo1FD5Z2
+Cf>#AOB?a5u^EO:2aTVARfg)@rc-hFD5Z2+E)4@Bl@l3@rGmh6r6QK9hA<$@<cL'F_r73Bk)7!
Df0!(Gp%'7FD)e5ASu.&BLGip:eakY2/[>SATJu5F`\a:Bk)7!Df0!(Gp%'7FD)dK+E_a:Ap%o4
GA(Q*+Dbt)A8,po+CoV3E$043EbTK7F%K22:-qQqE-ZP:EZf7<FCep"DegJ6E-,f4DBNG-A7\>Y
8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCB
ATV[*A8,q'ATDBk@q@)\H:gt$FDl)6F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHB
C2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`i
AKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+
Df.*KD..3k+CT.u+Cno&AP>Bg<)?RoCghC,+E(_(ARfg)E-67FDfBf4Df-\-De*ES5tsd89L2TU
8g&"[D.Oi"CghC++E)4@Bl@l3@rGmh@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)F_kl>+Cf>,
E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(JlkF_PZ&F!+t2
D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'CM7-tBOkt!@q]F`
CNCV/F_u(?F(96)E-*49@<6*)@:s"_DKBnB@rH7,ASuU2A8lU$FE;#8+Co1rFD5Z2@<-W9E+*cq
D.Rg#EcYc6D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u+Eqj?FCfM9BOtU_ATAo-DJ!g-
D..O#Df03(DdmcrDII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF)#W(Ch\!&Eaa'$
<_YtsDe*ZuFCfK$FCcS<ATDj+Df-\7@;BEs@;]TuA79RkC2[X$DKL#ADBMPI6m-Dc+ED%7F_l.B
BlbCO+DGF1F*1u&ATMp)F_i1/DIakD+E)@8ATE!/F(K*0DFu$pATDj+Df-\8F_tT!Ec#6#ARoq#
E+F*.E-!.DBOr;rF`MM6DKI"?@<?0*@<3Q"+A*bt@rc:&F<G10Ch7NqDfB9*F!+n/A0>AuDf]K2
+Co1rFD5Z2@<-'nF)Z/2AncL#F_u)2@<6+$Eb/isG\(q=BOPsq+EVNEA9Da.+EM%5BlJ08E-68D
FDl22F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATMg5FD#Z9FDl22F!,"-@ruF'
DIIR2+D5_5F`;CE@;]TuF*22=ATMp(FD>`)Ch\!&Eaa'$E,oN/@<,p%9OUn3=<MR'De!@"F(oN)
+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAH                           ~>
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
0f:m40f:(0+>G_r1*A;/1H.<:1,'h++>G`53&)O21E\Fq3&``N+>Gbs1*A;,0fC./1a"Or0f([E
+>GSn1*A>33AVd40H`+n1,V!G2BX_1+>P&r3AEN:1,0n,+>GQ(0Jah2+>P&p2E*Q;0ea_*+?(u2
2]sh0+>P&o2)@370f^@3+>GQ)3?U%8+>P&o1H%'40esk,+>u5;3D*(86<-TN6qBmJ<)6Cp1,TLJ
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i"Ol6?R!YA0=WiD.7's3ZpF*+@KX[ANCqf3?V(8Fs&Oo
1,'h)3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'+@:3bCh+Y`F_tT!E]P<t
0H_K+@<?'A+>GVo:2b:u1,(I;+>GT31,:mH2[p*'$4R>;67sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.4
1,U1++Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO1,fXL$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4
Fs&Oo1,'h*1-.6J3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1#+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2'>Y4Fs&Oo1,'h*2**QQ3\rGs$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2BYb5
Fs&Oo1,'h*1-.0I3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh*G3]/l($49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2]tk6
Fs&Oo1,'h*0fh*I3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=
ARci<0JY=)0ebXC1HI?I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t0d%T,@<?'A+>G\q6tKjN1,(I;+>>c92)73J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+@KdN+>PW+0H`).3\W9L0JWtB
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg
0d'D+E$-ni1,0n+1-.9O3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.6+<X'\FCdKU1,0nI@rrhK0JY@*0f;!I2EEWN$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N
2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K
3Zp14+AZKh+>PW+0d&2.3]&TQ0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh0d'8%F<E=m1,0n+2**QN3\`W%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K
3'&`Q$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4
@<?'A+>PYo:LeJh1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,
+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AZKh+>PW+0d&2.3]/ZR1,]IH$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1*Atr@j!N\1,0n+
1-.*L3\W5p$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU0JXb=ARci<0JY@*0f(jH2EE]S$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp.2+@KdN+>PW+
0d&/13\rHN1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pes+@KX[ANCqg0H`bp@j!N\1,0n+0KLpD3]/Su$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0eje=ARci<0JY@*0KD0O2**KN$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN
1,(I<+>GT31,_0I0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS1,pC!6t(1K3Zp.3+@KdN+>PW+0d&2*3\rcW1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqg0d&kq@j!N\1,0n+2**EF3\rW#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0eje=
ARci<0JY@*0f;!I3'&fS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!0d%T,@<?'A+>GSn6tKjN1,(I<+>G`71G_'J1^XQs:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9sp6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0eje=ARci<0JY@*0f;!K3'&fR$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*@]+F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqh1*Atr@j!N\1,0n+
2**KQ3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>%,8Fs%noF_PZ&+AR&r@V'R@+>Fu]
6t(1K3Zp15+@KdN+>PW+0d&2.3\rTR1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp15+@KdN+>PW+0d&2.3\r]U0f'.D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp1;+@KdN+>PW+0d&/0
3]/iW2)kpM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp.3+A-'[+>PW+1*A823]/oY1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5+A-'[+>PW+1*A;.3\WBO0JNnA$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp16+A-cm+>PW+1*A82
3\WQT1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp+4+AZKh+>PW+1*A;,3\W9L0f04E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+5+AZKh+>PW+1*A;+3\`EO1,K=F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.6+@KdN+>PW+1*A82
3\`<L0fKFH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqf3$:h%DBL\g1,C%-1-.-J3]&Pu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0fU:J@;[2C0JYF,0ek^D1cdHJ$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Ghu8muT[1,(I>
+>GW41GCjH2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS
0f'pp6t(1K3Zp15+A-'[+>PW+1E\D+3\`HP0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B1tDBL\g1,C%-0KM'M3\`T$$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,9tE@;[2C
0JYF,0fD'J3'&cJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t2BX,1@<?'A+>P_q8muT[1,(I>+>GQ20K;*J2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+A-'[+>PW+1E\D+3]&`U0fB@G$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh1E]:u
DBL\g1,C%-0KM$M3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.;+<X'\FCdKU1,C%F@;[2C0JYF,0ek^C0fh*J$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>P_q8muT[1,(I>+>G`71c.6I2@9cu
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp16
+A-'[+>PW+1E\D03]&`U0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P_q+@KX[ANCqh1E]:uDBL\g1,C%-2EE]T3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU1,C%F@;[2C0JYF,0fM-I3BAlQ
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A
+>Pes8muT[1,(I>+>GW42)@9K3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C$q6?R!YA0=Wi
D.7's3Zp19+<X'\FCdKU1,^7I@;[2C0JYF,0ebXD2**TO$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51E[f,F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqh2BYV#DBL\g1,C%-1HI3K3]&i($49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+:+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp19+A-'[+>PW+1E\D.
3\`QS0Jj+D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A
+>Pht8muT[1,(I>+>G]60f;!L0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C$q6?R!YA0=Wi
D.7's3Zp44+<X'\FCdKU1,^7I@;[2C0JYF,0f;!H2**HL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51a$=?Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp+2+@]pO+>PW+1E\D+3\`NR1GK4D$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0JO\>ARZc;
0JYF,0ebXC3BArR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51a$=?Fs%noF_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp+6+@]pO+>PW+1E\D+3]/TP1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+
A7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,g=FARZc;0JYF,0etdF2EEZK$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51a$=?Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1:+@]pO+>PW+1E\D0
3]&fW1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#7+A7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU1,g=FARZc;0JYF,0fD'H1-.-L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51a$=?Fs%no
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1;+@]pO+>PW+1E\D+3\WKR0es(C$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#7++@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,pCGARZc;0JYF,0ebXD0KM$H$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51a!o-F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1;+@]pO+>PW+
1E\D+3]/cU1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp+5+AH9b+>PW+1E\D03]/ZR1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp+8+AH9b+>PW+1E\D03\`HP1,oUJ$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+AH9b+>PW+
1E\D+3]/fV2)#@E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp.;+AH9b+>PW+1E\D,3\WKR1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,
/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.;+AH9b+>PW+1E\D,3\`KQ2)u!N$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp17+AH9b+>PW+
1E\D+3\`<L1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp1;+AH9b+>PW+1E\G/3]/cU1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp44+AH9b+>PW+1E\D+3]/oY1,]IH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp+4+@0se+>PW+
1E\A33\`KQ0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GPm+@KX[ANCqf1E\u&EZd+k1,C%-0KLpB3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<
+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0Jah;E,m'V0JYF,0ebXD0fh!K$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>>So6#^ie
1,(I>+>GT31c7<J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_
ATBgS0f'pp6t(1K3Zp+4+@0se+>PW+1E\D.3]&TQ1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#:,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>Vp6#^ie1,(I>+>>f:1,M$H0FA-o:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,U0s6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,U1?E,m'V0JYF,0etdI
2**EJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\
FCdKU1,U1?E,m'V0JYF,0etdI3'&oN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,U1?E,m'V0JYF,0f(jE1-.9O$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0JahG@<itN0JYF,0KD0N
1-.6L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\
FCdKU0JstFF`&<W0JYF,0KD0J1HI9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,'hCF`&<W0JYF,0KD0L3'&oN$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0JO\9F_;gP0JYF,0KD0J
0KLpK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU1,U1?F_;gP0JYF,0f(jG1-.-D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,
+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fC.QAT/bI0JYF,0ebXC3BAlP$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IPDg!6Y0JYF,0fD'I
3BB#R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>>_s6tKjN1,(I>+>GT31c7<M3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,^7,+Co&,
+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp19+@KdN+>PW+1E\D,3]/iW2)kpM$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#=-/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqi0d&kq@j!N\1,C%-
1cdHN3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+=+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU0JXbC@;[2C0JYI-0ek^D0KM$I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52BXRo
A7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>Pn8muT[1,(I?+>GZ52)@9J2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,^7,+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+3+A-'[+>PW+
1a"M13]&QP0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#=-/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Gbs+@KX[ANCqf1*B1tDBL\g1,L+.2**TT3]/f&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+=
+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0JXbC@;[2C0JYI-0fD'H2**EH$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen52BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>Pn8muT[
1,(I?+>Gc80KD0J2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,^7,+Co&,+<X!nBl%<&:3CD_
ATBgS0f^@!6t(1K3Zp+3+A-'[+>PW+1a"M23\iZU0ej"B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#=-/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf1*B1tDBL\g1,L+.2EEZR3\rGs$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+=+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0JahD
@;[2C0JYI-0etdF1cdBN$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iD$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqf3?V(8Fs&Oo1,'h)3'&fK
3\WE#$4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg1*B>1Fs&Oo1,'h*0fh'F3\r]($4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5
DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Ghu:2b:u1,(I;+>GW40f(jG
2[p*$$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."
+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.6J3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pes
:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%no
F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp19+AQiu+>PW+0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*
0KLsG3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K
3Zp1:+AQiu+>PW+0H`))3]&QP0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN
1,(I;+>GQ20f(jI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t@j!N\1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN1,(I;+>Gc8
0JPUB1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GYp+@KX[ANCqg0d'D+E$-ni1,0n+1-.9P3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCqh0d'8%F<E=m1,0n+2**QL3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'8%
F<E=m1,0n+2**QR3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t3?TG4@<?'A+>PYo:LeJh1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'8%F<E=m1,0n+
2**TM3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW40KD0J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf1*Atr@j!N\1,0n+1HI<M3]/l(
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.
@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg0H`bp@j!N\1,0n*3BArM3]&T!$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GPm
6tKjN1,(I<+>GQ20etdI0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg0d&kq@j!N\1,0n*3BB#T3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN1,(I<
+>GT31,_0I0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Po!+@KX[ANCqg0d&kq@j!N\1,0n+0fh*N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>GSn6tKjN1,(I<+>G`70JGOD
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o
+@KX[ANCqg0d&kq@j!N\1,0n+2**KP3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>GSn6tKjN1,(I<+>G`71G_'J1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>GSn6tKjN
1,(I<+>G`71cRNP2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)+@:3bCh+Y`F_tT!
E]P=!1E[f.@<?'A+>P\p6tKjN1,(I<+>G`71-%BO1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp15+@KdN+>PW+0d&2.3\rTR1GoLH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqh1*Atr@j!N\1,0n+2**NP3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7l
A7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,pCEARci<0JY@*0K;*N2``fU$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GSn8muT[
1,(I=+>>f:2*!]Q2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp.5+A-'[+>PW+1*A;.3\WBO0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh1E];4C`kJe1,9t+3BAiS
3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU0JahI@rrhK0JYC+0etdD0fh$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C%)+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>Vp:LeJh1,(I=+>GT30f(jG1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.6
+@KdN+>PW+1*A823\`<L0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0K:1I@;[2C0JYF,0etdE2EEZL$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.:+A-'[+>PW+
1E\D,3\`HP1bf=E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU0fU:J@;[2C0JYF,0etdG0KM$K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp15+A-'[+>PW+1E\D+3\`HP
0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.6
+<X'\FCdKU1,9tE@;[2C0JYF,0ebXG2``ZQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp15+A-'[+>PW+1E\D13\iZU0e`qA$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU
1,C%F@;[2C0JYF,0ebXB3'&cP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+A-'[+>PW+1E\D+3]&`U0fB@G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,C%F@;[2C
0JYF,0ebXF3'&lQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&
:3CD_ATBgS0f^@!6t(1K3Zp16+A-'[+>PW+1E\D,3\W9L1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,C%F@;[2C0JYF,0f;!K
1cd<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS
1,0mo6t(1K3Zp16+A-'[+>PW+1E\D03]&`U0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1,C%F@;[2C0JYF,0fD'M3'&iO$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3Zp16+A-'[+>PW+1E\D23\WQT0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^H
ATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU1,U1H@;[2C0JYF,0etdI1HI9O$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp19+A-'[
+>PW+1E\D+3\iQR2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!Y
A0=WiD.7's3Zp19+<X'\FCdKU1,^7I@;[2C0JYF,0f(jE2``cU$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp19+A-'[+>PW+1E\D.
3\`QS0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's
3Zp1;+<X'\FCdKU1,^7I@;[2C0JYF,0f1pG2**TL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp19+A-'[+>PW+1E\D03\`KQ0fB@G
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\
FCdKU0JO\>ARZc;0JYF,0ebXC2EEWK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)
+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+2+@]pO+>PW+1E\D+3\`WU1GoLH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0JstB
ARZc;0JYF,0ebXG0KM!E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!n
Bl%<&:3CD_ATBgS1G^-r6t(1K3Zp1:+@]pO+>PW+1E\D-3\iTS1b]7D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU1,g=FARZc;0JYF,
0f;!K3'&fO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_
ATBgS1Gp9t6t(1K3Zp1:+@]pO+>PW+1E\D13\W<M0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU1,pCGARZc;0JYF,0ebXB2``ZK
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!
6t(1K3Zp1;+@]pO+>PW+1E\D+3\iBM1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:
+>"^HATf1=6?R!YA0=WiD.7's3Zp4<+<X'\FCdKU1,pCGARZc;0JYF,0ebXG2**NJ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>>Vp
9jr&b1,(I>+>G`72)73J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%no
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp+8+AH9b+>PW+1E\D03\`HP1-#[K$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg3?V%)EZd+k1,C%-
0KM'L3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU0f^@N@<*JG0JYF,0ek^C2``]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Gl!9jr&b1,(I>+>GT30f;!L3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp17+AH9b+>PW+1E\D+3\`<L1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^H
ATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh3$:q(EZd+k1,C%.1HIBN3\rT"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1GBqG@<*JG
0JYF,0ebXG3BAoR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>>So6#^ie1,(I>+>>f:0f;!H3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqf1E\u&EZd+k1,C%-0KLpB
3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t
0d%T,@<?'A+>>So6#^ie1,(I>+>GQ21,1gE0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf1E\u&EZd+k1,C%-0fh-K3\WDu$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A
+>>So6#^ie1,(I>+>GZ51bq*I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8
Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqf1a#)'EZd+k1,C%,3BAoP3\`;q$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Pes6#^ie
1,(I>+>GW42)REK1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqh2'>2(EZd+k1,C%-1-.9P3]/Su$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>Pes6#^ie1,(I>+>GZ5
0JY[H3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Ghu+@KX[ANCqf1E]D#Gp"jr1,C%,3BAuP3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>>Yq8p,"o1,(I>+>>f:0JbaF2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[
ANCqh0H`u1DBL\g1,C%,3BAoT3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=In
A7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Mm6$6f_1,(I>+>>f:0JGOB3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh2'>2-
B-8r`1,C%-1HI9H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3b
Ch+Y`F_tT!E]P<u1E[f.@<?'A+>Gbs;e9nj1,(I>+>GQ20f_9L2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh3?V(8Fs&Oo1,C%-
2EEQQ3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!
E]P<u2'=#0@<?'A+>>_s6tKjN1,(I>+>GT31c7<M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2BYD!@j!N\1,C%-0fh0N3]/l(
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52
@<?'A+>Y_p6tKjN1,(I>+>G]61c7<L1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf1*B1tDBL\g1,L+.0fh$C3]&Z#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>Pn
8muT[1,(I?+>GZ52)@9J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf1*B1tDBL\g1,L+.2**QK3\WN#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>Pn8muT[1,(I?
+>G`72*!]T2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Ybq+@KX[ANCqf1*B1tDBL\g1,L+.2EENL3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>Pn8muT[1,(I?+>Gc80KD0J
2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yhs
+@KX[ANCqf1*B1tDBL\g1,L+.2EETQ3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
2'=InA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>>Pn8muT[1,(I?+>Gc81cIHO0FA-o:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqf
1E]:uDBL\g1,L+.1-.0I3\iW$8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhm_2,6Ij.S<K)?Z0CpATDs*
A7&ngEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R>;67sC-F*(i2F=hEC/T5*>ATDs*
A1_A5Ec5u>I16Mm$;No?4?Y)I.3N,@@<6*C+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuH
De(M92)$j9%15is/g)o0+AH9b+>PW)2'=V03]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i
@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN
+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUhBIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:
F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9
BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'
F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA++=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?
A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&
3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[
+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@lt
EbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(Rn
ATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(
F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'
DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*
AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A
@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&
FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@
GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7
Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOC
DfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!
$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh
%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaEA12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIA
F^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@qZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!
A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4KDfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0
Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-
DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5
DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNX
ATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU
+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb
-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2BEc5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("
@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<rF:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2
F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%
DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s
$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)
E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe
$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,
+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[pDJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F
2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&
+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@
FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:
+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotm
P^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;
1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe
+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IF
ifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^
P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$(
$K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#6
2_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<
AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-NDJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0j
DJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)
Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5
Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4
F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#
.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o
;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4
DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;
67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQt
DKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cpF<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB
+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2
D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[
De).SB6A'&DKKqK4Y@j2%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=
FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl
$;No?4[(8S.3N5:GWHsaBm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB8
1*B;"Gp"jr0fL401HI?K3]/i*$4R=O$;No?4?Y)I0I\,UEcQ)=3Zr6QDIjr,Bl.R++D#e-AS#C`
A0>],@:X(iB-;,/A0=K?6m-#_D/^UG@Uj+$%15is/g)i)+AH9b+>PW+1E\D+3]/`T1H>mO:-pQB
$;No?+@U0\Bl7KC+DNnh1bLL9C,RnWG'GbqA79M&Bl4@e:-pQU6?R!YA3(iCDf'?&EarflCbIOt
1,CL91+b7?<&$6k1,_0I2_SZW@;]^00f1I9/MJhV9LVB>4Y[BQ:-pQU9PIsV@<-WS+?;&2/i#*i
$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5/i5!d$;No?+Acl_FCoH3D)re-@<-R+DBLho%15is
/g*`'F*(i,Ch7WJ+DNnh1a$LMF*(i,C^g_H67sBPDKBo.ChupVFD*]X06M>IEcWmKDeO#t@;BFp
05<C%05<L"1^sde67sBJDf0Z*@rsaSGB\6`C3+<*FE_/6AM.J2D%-g]$6UH678@2X<bu2iDfp//
0fUjG1,_9V0fM!I+>PVr-V[$(7:/SW6V]!j-W<?16=3;P-T`\M7863X6VAdg-W<?16=3DP;cI+!
5tscq4"!rn;aOh\8Q&Jd?VWm]741/E7oDiT?V*X54"!C6DKKo-@rs([-W<?16=3GS<)R((8Pgcr
-W<?16=3VZ6UY9L<$saT79DoF?V*X54"!I!6UY9[85E,_?W9Hr<$saT9gqKE?U[FR?URj@4"!`k
78.&W9M%`]<*<$d-T`\M77BmW9g_lX?W'ft-T`\M6W?rj6q($A-T`\A<)Zq,8OOpf-UC^1=^OQc
;aVoo-W4MpDfTqeDe*EHEb/[$AOKsKALBPe;IsfcEcaZeA7\GCF*(E$A79Rk-T`_1,VUZ/-S\Uk
3(Gh]6Uipl-T`\00JG171cR9I-T`\12)7*L2)$a44"!L3DI[?-4"!a2EbT?8DC7Ln0JP780JG18
-T`\H0f([@-T`_--W;BA4!ua;0/5C=1,(FA+>GW40JGOA0J5%50H`YU-T`\'4"!dAF<EkjF(o9)
ARm/M-S[8/0/>493$9q23\W6K0JG+50JFV89d`"M;Fr5t-Ugcf0IJq078>]o+AtX":*=a66[!K_
+@:*a-T`\'4!uC;-RUu'-T`_1,VUZ/-T"[W2bQV"6Wl<&-T`\00JG171Gq$F-T`\12)I!F0JtR4
4"!=)Gpb[$6t(+SCaV:l0JP780JG18-T`\H0f([@-T`_--W;BA4!ug;1,gjA0JPO00etdD0KLmA
/het5+@/^L4"!HS3%$d8;ajM*Eb.9S6#:?[:NU8]EZe:L:`r2MASuU2+=KrM+E).6Gpt+&-T!J2
0/>493$9q23\W6K0JG+50JFV89d`"M6V&Rd-Ugug0IJq078trp+>"^*Ec5e;<-!+m+@9meALBPe
-T`\'4!uC;-RUu(0I/>$4!upc6o7D32agY"2CCR60JG170ekL>2CCR60f:dF1c%!D-T`\AA9fOa
-V.ZfFD5;64!u^:0JG170JOq:-V,sJ2)$C>-nH`E-Rh,)1G:LB0/>493$9q23\W6K0JG+50JFV8
9d`"M75[%P4"!rq:`sdi3Zp_)C`lMqBOu3,;ajM*7<W6[FE8QQ9gKn?DJXSI-T`\40/5+80JPO0
0etdD0KLmA/het5+@/^L4"!Bd-T`\E<%p!R4"!Hr0JFV$+@^BiD'2euF_)[^Cis;:4!uC;-RUu'
-T`\'4")d.0I](20i^.j5t3\382i:O4!u^90JG4<2)d3:4!ua?2D?gA/hSac$@HZ(D/")7ATDg0
E\&>EG\(B-FD5W*+Dl%7@:UK7+Z_;3%17Jk+EMgLFCf;3Ch[a#F<Gd9F!,%=@qB4^ARl5WHlsOS
+<VdL0HiJ20g'2i@<?01IS*C(:f:=^<D?:g04JF*/no'A-OgE1>:h`j>p(eCF(KB505>E=DIR$i
ATBG=De(M9De*g-G%>`4E-![A@qdQ0C3'gk%15is/j)9F0ek+"ATDg0E]P=OD.73lDfp+DDfp/@
F`\a<DfQt;@;BEs-Zj$9F)GE'AL@oo:-pQU1,U1?E,m'V0JYF,0f;!K3BAiQ%15is/e&._67sBL
DJ*[$ANCrK3A*0A0J-aFFC?mWC,RnWG'GbqGA1r*Dg-73$;No?+@:3bCh,RL@rH4$ATD9p@;ISP
0JYF90Jk@:1/otc3\`QS0etClCgh3o/MT+70J,4:;bTVK7QiI8$;No?+A?KYEaa!63ZpF82(gTm
$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5/i5!d$;No?+Acl_FCoH3D)re@Bl5%O1^sde67sBP
DKBo.Ci!['3Zr/t/i=bcDKBo.ChsOf:-pQU8T&Tk@;KaV@<?0D+CdGcC,Rn%3A*/u$;No?+@C'b
FCA[$3ZrWjG:mWODe=*8@<,p3@rH2n$4R>Z@;BEs-Zj$9F)GE'ALATq67sBkDe4!--ZgJ>E,]As
EZfIB+CoC5@;^@4BPD?s+:SZQ67sBpF=2,PDJsV>@r,^bEZfR>ATD?)FD,5.Dfp/@F`]/WBkAJr
DL!cUB5_@&/e&-s$4R=O$;No?+F@[;A1__3/T5*>ATDs*A1_A5Ec5u>I16N[:K(5"C2[X!Blmp,
@<?'90b"Ib67u)1;cI+=De*ZuFCfK$FCcS6Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE
+A#$g6Ua.!+=Jod3Zp+*%15is/g)QWDe*ZuFCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.68S,0JYI=
0ebCu0f(XH2)>S767sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT
6r-/m+<VdL+AP6U+D,b4C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2
BFP;D67sBmDfT]/Amo1\FCf\>+<Ve%67sBmDfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$
ARlotDKKH1Amo1\+EqaEA9/1e:-pQUB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5
Ec6)>+=MLa%15is/g+k?@:NkiARfgrDf-[?+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9
F*)G:DJ'Cc:-pQUBkCit+<VdL+<VdL+<VdL:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>
F:ARP67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RC
F`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m%15is/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2
E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sC)
DfTB)BlkI?+<VdL+<Ve%67sBt@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLa%14Nn$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$?U<6/e&._
67sC'F(HJ&DL!@D@;]Uo@j#i(F<G:8+EV:.+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAISu\
AhG3MAU%QjC2[Wi+?V#J;FO&D;GoqO:dIiE:IAK'C2[Wi-Qlr</g++a8Q/GO:..lF?X[\fA8Gt%
ATD4$AR@S]+Abs)7R^3Q779s<:..lF?YO7nA7$HjDIb@/$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^
@;^7"E]l#t4"u"(4?G0&1*C[TAfrLCBOu!r+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-W
EcYr5DC6kU/M8/5;BTLg/e&.1+EMC<F`_SFF<Dr+:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAJt
F`MM6DKI"EATDj+Df-[G-S04FDK]T3/12khBlbD7Dfd*c4WlL43A*$=0ddD;ASu$2%16TRFCSu:
%144#F)>i<FDuAE+=BTU;GU1O+E1b,A8bs#DJsV>F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^k
Ch\!&Eaa'$?RH9iASu$2%14Nn$<0eh:L?^i6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0
De*L$@;omo@rj;FDe*cnC2[W8E,K;;+CIf;6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&
ATD?m+Cf(nDJ*O%+D,P4+CIf;6psg<?nMlq<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-
G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F))3l@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5
FE9&D$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dUB6cFYCh>\MDg*sUGBIh?Ahdq<F('$+?Tqj?
9lG2d+E)4@Bl@l3@rGmh+EV%$Ch7Z1@<-:/DIb@B<-N7'F)>?%C`mh.@VfUs+E)-?Anc:,F<GO2
B4W30Bln#2Cgh?sATA4e+<VeK@:F%a+E)-?F(Jj"DIb@B<+oue+EqO9C`mP*@<Q3)E,9*'FEo!I
Afu/6@:NjkFDi:1A7Qg#ATo8,De*F#+DG^9FD,4p$6UH6Cgh?sATAo8@:F%a+=KWR:.6Ta%13OO
1+j\W4C9d`3-TUUCLLk%@q9LkC,f^:3,^fhDKRpG5%#L/E-,f4DBLYj+=M>GD.Oi2FCB$*F"&5B
De3u4DJsV>@;p0s@<*K)DBO%7AKYhuBl5%ACgh?sATB4B@rGmh+EV%$Ch4_uF`\`S0ek*d$6UH6
Eb/ioEb0,uATJu)De3uB+@0OK+DGp?Bl5OG-q$j+74AZQ%14mD+CI<=ASQO-E+^q@G%,&lG@P]3
@WaDB0JkaJG$dF@+@C'bF(o/rEZf(5E,ol?Bl7Q+AoDR/+EqC2B4uC.+DG^9E,oZ1FCeu*A8bt#
D.RU,F"SS7BOr;uDf0Y>F`V,)%144#+D,P4+EMIDEarZ'@rGmh+Cf>4Ch+YtAKYD(Ch\!5Ch4_u
DerrqEZcqVATMg%@qf@fCj@.FBOr;rDes?4ARlp*AU&<</e&-s$8a@X?p%e,H"_5=E]7uIBJ_Jc
C2>hMF*K]ZEbAi@?Tqj?87?OUDf098AKYK$A7ZlnDes?4F!+n/A0>K&DKKqB@:O=rF)rI3Cia]7
BleB1DJ+#u+CT.u+CK.sDIdZq?m'N9DKK<3+Cf>+DfTQ0B.aW#+<VdoF`MM6DKK]?+EV:.F(HJ5
@:O(]B4Z-,F`V+:A8,XfATD@"F<G16DKKqB@;]Tu@rH1%EcWiB$4R>"/g+Oa?T)pY3GgcoEG0YR
D.,@\FEDbPBQ@s!BQ7BC?m&?YG%kN3+D>\;+EVNEAp%p+Gp$[8@V''m@;Ka&Eb/ioEb0,uARloq
Df0Z<+DG^9E,oZ1F<FCJ7WU0k$4R>#/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@2_]AhFu<Vj?m%gT
DKBN&ATAo%A7TClB-:Sj@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+A,Et6r-/m-q$j+74Bhu
$4R>$/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7
@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%16KI
ASu$1FDk].?!n*K<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4D]ik1F*(\9FDk].?YXLi/oY]@.3N"j
:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$m
DJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]TuBlnD=F*1r%CghC+ATKI5$<1\M
+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:%15FB
Dg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.R
CiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.
DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7Hp
DKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSruBmO>C%13OO?s@)OB5)68FDk].
?!n*K%14gB+CI<=1Lb>aFuahhF>IoZ1NYN1H>-l*BehV[G$dF@+AQKl+Du==ATDKp+Cno&@<?d6
ATJu&DIaku+Cf>-G%G]8Bl@l3F`_>6BlnVC?t1fs+CT;%+C\nrDJ(($$6UH6@:Wn[A0>T(+A*b:
/iFh#1,(I?C12!61+=>iAKYl/G9CR-G%D*i+<Ve7055<GAS5Rp0e[6YFCf)rE\]:^DKKH&ATBU\
Ao)BoFD5W*1,!6UDdda%DJ(dZAo)BoFD5W*0fED^GA(Q*AThX*+EV:.Eb-A%Eb,[e+<Ve:BOPdk
ATJu9D]iM'DIIR2+DG_8ATDZsCi^_5F<G:7E+*6uF!+(N6nTT)8LJ[m+CT),ART+p+D>J2+CQC&
Df0`0EcYr5DBNn=ARfFqBl@l3ATDg0E\7e.+<Ve+BOr<-ATDKnC`m82D/^V0DfT]'F<G^IF^]*&
Gp%<LEbf_=B5_L%B-:f)Ed(r4A0>?(F<F-t@;R,sDf0&rEc,H!+CS_tF`\a9Eb/[$Bl7Pm$6UH6
A9Da.+EM%5BlJ08+EV:*F<GdACht53Dfd+<Ddd0!Bl5&3Ch.*t+A*c"ATDj+Df0VK+BN8nC`mD"
G%De<D]iS%G%l#/+EMI<AKZ&(BOu$l%144#+EVNE@rH<t/e&-s$8O4V?p%dVCMGYDAi"FLC,\.k
G\(`-2)Jo\0Qgn]?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B5lF(c\;Bk1db@<*K&Bl%?'FDi:2Bl7@"
Gp$R)@r$4+F"SS6Bm:b<F_tT!Eb/c(?n*dCC1^irAnc'mF!+n3AKYK'ART[lA.8kg+<Y-=+CQC%
@:O(qE%W84BOuH3F(fK7Ch+Z+AThX*+C\n)@;L$sEb/c(@X0(g:IH=6B45Ll+CT.u+C\nrDJ()$
@:O(qE-!.9DKKH&EbTW@+DGm>@rc:*Bk(Rf/e&.1+<XWsAKZ&.A7]7ZEZet.Ch4`5Dfol,+C\n)
F(oK1Ch4`2AU&;>Anc'm+EqOABHU5E5qOiL2BZ[AF(f-+/0JXZAM+E!+<VeUIXZ_T$6UH61brfU
BOPsqATKJGG]XB%+<Ve%67sBjDe*E%0fL4nDBND+C`mh2F*)IGFD,5.@UWb^F`;CE@:s"_DKBnB
BOPsqATJ:f+<Vd]2]uRIC`k)X-OgD*+<Z,^IXV_5%14mD+CI<=2gT-n2etEhChbhOCLhC!1b`Bb
F)c)73+"jW+@C'bF(o/rEZee$A8,po+CQC+@<6*)DdmHm@rri*@:O"fBlnVCFD,*)+EqO9C`me@
DfTD3@3AK>5qOiL2BZ[AF(c\?BOu'(E-68EBl7Pm$6UH6DdmHm@rucE+A!\aD'3q6Bl7^#DJ()#
DJsW1ATAo3E-,f4DBNG-A7Zlk0fNJ_FD,*)+EqaHCh+Z*ARTI!F*)>@AKYD(BOPsq+E)-,$6UH6
?uU71?m'B.+EV19F<G!7BOPsq+E)-??tX%m?k!Gc+<Z,^IXV_5+<VdL:-pQUGAhM4+DGm>E-67F
@;]Tu@3B5lF(c\1F!,OGDfTE"+DG^9@3BT%F(KB8ARlp)Ci=DJ%144#+<W?\0fL4oF`\`RGAhM4
-OgD*+<Ve%67sBo@<6*)BlbD,Df'H%Eb/c(FDi:F@;L't+ED%8EbT*.ARlo8+D#S6DfQt7Aftr!
FCSu,AmoCiF"Rn/+<VdL0H`)/+D58-+=DAOEb$O,$6UH6IXZ`p%13OO1bKnY4C;Q9FDWgU13R2M
G;j5XAN"=>H$O*X0f4&\5%#L*-Z^DBBl%?'G%G]'F!,=.Gp$d/DJ()9BOu'(@:NeYF)u&5B-;D4
DId[0F!,(/Ch7Z1Df-\.EbT].F!+n$@qB_&ARlomGmt*'+<X]]:*=%bDJj#qFD5Z2F!,[?ASrVk
:ei-IF!,C5AhG3*BOu3q-Z^DJDfd+=F^o)-8l%ht@ps6tA8`T&DfQt;@;p0sA0<::ATW$*E[PF/
.1HV,+<Y38Bm+'/+C]J8+CJemG\M5@?m'$(ASuU4@;Kb*+ED%8F`MA@+>=pMDfQt$:ei-SBOPpm
F!,:5CLoO9$6UH6IXZ`p%144#+<Y9-G\M5@+=AfqC1_NtATfaa06:f8Eb0;FC2[W9C2[W9C3OT:
A90A;C1\h&$6UH6IXZ`p%144#+A,Et+Cf>4Ch+Z!D]iI2EHPu*CER25BleB-DI[6#@q]F`CERP5
+EqO;A8c[5+EMgLFCf<1+EqL1DBNY8+EM+*F!,UCD..C&ARl5W+<VeJBOPpmF!+jD06;&KAM8+<
@<,p4AS>a1C3OT:A90A;C1^j++<XWsBlbD@Bl%T.DJsV>BOu"!+D,P4+BD<6+DkP+E+NQ&A9)C-
ATJ:f+<VeNBOu'(<_uO6BlbD8AnEY)$4R>"/g+Oa?SaEY3+Qr>G\hYEF`h,)Ciaf=EAoj6E,]/J
?m&E[F*&O4C2[X!Blmp,@<?'g+E)-?D.-pM;]oLdA0>]&DKU1V+B3Pr@;@!"Aftu&ARo@_/e&-s
$8sLZ?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]TuAU&<.DIakt8l%i_
+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr@WNZ*@<Q3)@q]:g
B4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$9'R[+<Y&S?T)\3C2[R#G%*@DCNFf7H>tZV3HR8i
F^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m
+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%15'I+<Ve74C;VRA9;F!A2,odE-?&+FDbT%12pYZBQnB%
5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBe
GT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<
+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16c_F*)>@H"q8.1,fXLB4YslEa`c;
C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n
0J5+=+>"^HATf1EGA2"F%13OO%14=),9S]n0J5+<+@0seBl"nK/0H]%1,C%$;fHbkDJ((`DIdHk
FDYT,FE8QnA8-."Df.!5$4R=b.Ni,:ATqZm+Du+A+EV%-ATJu%A8lU$F<Dr/78uQE:-hB=-Ta%j
+CT.u+CJ`!F(KG9-UCZu8P(m!-Ta%j+CT=6A7]@]F_l/@%144#+<YlAASrW#Eb/[$Bl7Q+DIn#7
A8,OqBl@ltEbT*+/e&-s$6Uf@+@.,fATo89@<,dnATVL(+CI`+;b0;V9i,4?BOPs)@V'+g+CSek
ARlp*D]iG&De*fqEc#kMBkh]s/g+,,AKYMpAmoguF:AR"+<Ve@F!*1g+EVaHDBNk0Afu;3FD)dN
/g+5/ASrVF+CQBk83ng_2)ZRj@<6*)BlbD9Eb/isG\(D.FDi:DBOr<-FCB33+E(j7A9Da.%144#
+<Y`8EbTK7F"SS7BOr;uDes6.GA1r-+EV19FE8R:DfQt2F_u(?F(96)E-*4:DKKH&EbTW@3XlE*
$6UH6+<VdL+<Y0-CM7-tBOkt!?X[\fA7$H,IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p
/no'A-OgCl$6Uf@+@.,fATo86@:O=r+E;O4Ch[KqATAo$8PiPb6=:pGDe*E%BOPs)@V'+g+CSek
ARloqDfQsmF`;VJATAo2DffQ"Df9E4/g*o-FCep"DegJ-Bl%@%%144#+<Y0&DBND"+EMXCEb/c(
@<3P`:IH=B@:O=rF!,[@FD*]E$6UH6+<VdL+:SZ#+<VdL+<VdL:-pQUEb/Zi+Du+>AR]RrCER&'
A0>r8DfTCu$6UH6+<VdL+<YB;H#@(S3ZrHS@:UK.DJsW.@W-1#/no9MDIOt&$6UH6+<VdL+<WK`
E-67F-Z3jEAR]RrCF;28:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV<+ohcE-67FA8,OqBl@ltEd8dH
@<?0*BlbD7Dg*=<DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et%144#+<Y3;D/aPK+@^9i+D#e+
D/a<&+EV:.+CJr&A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D%143e$6UH6+<VdL+<Wa,-YdR1
A7]p,C2[W*F`_>6F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>E,oN5BlA-8Cj@.EBQ&*4/g(T1
%144-+<Wrm@Wc<+Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen51FXG[@<3Q#AS#a%@rHC.ARfgn
A1euj+Co%q@<HC.%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfguGp%0>F<GC2@:X(iB-;;7+CHlG
2E!H9E-67F-RX+VEb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL+<Vd9$4R=e,9n<c/hen51a#8!
@WHU"Ed8c_3%Q1-0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn$6Uf@8g$,H0JjnmAStpnARlp*
D]hXp3A*-2@;]TuFD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:gB4YTrFD,B0%144#+ED%5F_Pl-
A0>;'@q]:gB4W3-D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.@<?4$B-;A/EcYr5DBNh>D.7's
/e&-s$6Uf@?pmgb8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnBAfuA;FWbR5ARlp#DfTD3FD,*#
+>u&!A8,OqBl@ltEbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=FWb+5AKYN%Bl7Q+F)Po,FD,B+
B-;D=Df022+:SYe$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`CER)#DIIR2+Cf>,E+*j&@VKXm
FEnu\+Dkh6F(Jl)FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO,9nEU0eP.41,C%F@;^3rEd8c_
2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:/hf+0F!,UHAKYo'+Bq?1:gGJ_
FEDJC3\N.!D/a<*@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7%144#+D>2)
+DG_8Ec5K2@qB0n@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+)@;]TuE,oZ2
EZfO:EcYr5DK?q=Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDi7
Bl5&(Bk)7!Df0!(Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7+<Y0&DBNt2@:UL!Ch.*t+D#e>
ASu$iA0>T(FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.DId<h+DG_8AS5RpF!,RC+CJqr
Bl%@%?k!Gc+<Y04D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3@:UKsDf03!EZfI;ASj%B<+oue
+Eh=:F(oQ1+CSekF!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKqF'p,!DIaktA8lU$FC655D]j">
AThX&F<G[=AKYi(F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9A79Rg+DG^9A8,OqBl@ltEbT*+
/e&-s$6UH6=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8Bl@l3De:+a:IH=GATMF)+F.mJ
EZdtM6m->TF*(u6+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$4R=b+<VdL
+<Ve%67sBi@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++CT.u+EM4=
F<F0uA8c[0%144#+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>AKY`,@<?0*-[oK7A8c@,05"j6
ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6+<VdL+AP6U+ED%7FCB33+A*bb
DIal$Eaa$#+EV:.+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOA
A1q\7@<6O%E\;'@Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9
A1hS2DC5l#%144#+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++E1b7
Bl7Q+@<?U&DKKT2DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$s8
F)tc&ATJ:f+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL+<VdL0HiJ20JO\4C2dU'BHS[O
@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b+<VdL+<Ve%67sC&D]j1DAKYo-
A0<:0AS,k$AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"G%De<D]j+4F<G[=ASiP!$6UH6
+<VdL+AP6U+AtWo6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0+A*bbDIal3BOu'(Eb/ltF*(u6
+DG^98g$,H0Jj4G%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2+AtWo6r-QO=WhEr+CT.1Derrq
EZf*+$6UH6+<VdL+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4+=C&U5t"LD9N`_P$4R=b+<VdL
+<Ve%67sC&BOu'(Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-EZbeu+<VdL+<VdLEb/lo+=D)D
A7TCaF=0-t@lc8eBOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3762Q*AfuA;FWb+5AKYo/Cj@.;
DKKH1ATMs)A0>T(+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-ATq^+%144#+Eh=:F(oQ1F!,C5
+A+7/=`8F*@ps6tA9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9D/^V=@rc:&FE8R5DIal1ASc9n
A.8kg+<Yc>ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!Df0!(Bk;?<+B3#c+A,Et+DkP)
F^])/AU&01@;0V#+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9<-<5!Bl7Q+8l%ht7!3?c+B)cj
BlJ/:<,u\_CNCsJ@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+@;]^hF!,RC+EV:.+E_a:+E(j7
FD,5.Eb/m+Cgh?,AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:DfT?!A0>r3D.Oh!$6UH6@:X+q
F*)81DKKqBFDi:0Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%+EVaHDIm?$De<T(GA2/4+CK57
F`_4T+>@1GE,oZ2EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c+EM+9FD5W*+EM47F_kS2@V$[&
ATMs3Eb/c(@:jUmEZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#+CSf(Bldi.@q]F`CM@[!+D,P4
+CfG+FD55nC`m5+A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4Ch[a#F<F1O6mm$u@:EqeBlnVC
%144#+EVNEA7]1c+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&+B<;n@rGmh+EM[EE,Tc=+D>2)
+CT)1@<lo:E+*d/Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+qF*(u(+EVNEF)Q)@+ED%+BleB-
Eb/c(A8,OqBl@ltEbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfAEc5u>+DG^9FD,5.Eb/lpGT^RB
E,oN2F(oQ1.3NMHG9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge3Zoe"GB.V>B."gBG]P!U/g+\B
C`k)Q%144#+Ad)mDfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<Ec5u>+D5U8FDi:DBOr<.Df?h8
AThX$+EVX4E%VS,%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtgEbSs"
F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&
A1hh3Amc&T%144-+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2
-XS5DBl5&6ATN!1FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!@"!H2+Co%qBl7X,Bl@m1+Du+A
+EM[EE,Tc=ARlo8+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgTF<G(3D/E^!A9/l(Ble60@<lEp
+D,P4+A,1'+EVNEEb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86EZf=>E$0:BF"Rn/%14=),9S]n
0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+S
Bl@l<%13OO+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>
Df9G7F`:l"FCeu6+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,
@<?'5BlJ?8@OV`n%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIa
F<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWs
BlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:
DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&u
E-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/
DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J
6spH2%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<
%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.YA7]:(%144#+<V+#+<VdLF(JoD
+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj%144#+<X[*AS-($+D,P4+EM+9
FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;BFCKB,Ch.'j
EcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ:f+<VdLEb065Bl[cq+C]U=
FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!+<VeJATW$.
DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV?t!SVCi<`m
F(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bl
$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*
3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*
?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>@;]soA0=K?6m-)Q@<?X4ATJu&
Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*
B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?/(
%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1
Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'@r$4+,r./EATTP=E-Z>1.1HUn
$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:
%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO
,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2
FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$
@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)
$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)
F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeq
F`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"
Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*
?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).A
E,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo
+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%
0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>
ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUj
Df/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9
?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*
ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmh
F!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#
AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS
:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<
3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP
78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b
.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sP
FD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i
+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"
A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u
@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*
D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0
ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!
06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(
.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'
+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%144#%144#
+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SZ#
+E2.8F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm
+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?
Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"
+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6
Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2
/g)8G$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[
De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$6UH#
$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn
@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!
Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9
$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU
-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl
/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"+:SZ#+<XWsAKYr4AThd+F`S[8
BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6
BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+<Vd9$6UH6+<VdL
+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE
@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=
ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3
Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtB
D]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt
$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-
ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZ
B6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3l
F`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LA
ATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6
DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#
+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth
+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI
%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufgu
F_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ
+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#
+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV9
1E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL
+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,
D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7
FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s
$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%
Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'
DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/
De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2
DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%
DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2
?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE
+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]gl
EbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+
G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0
+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:
A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:
F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@
@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,
@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tp
F<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL
+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?
ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6
+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL
+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm
3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHh
FD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2
$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.
+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2
+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:
F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8I
F<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:g
B4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6
+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H
0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%a
F!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%
DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p
$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\
?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(
E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;
D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3
%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R
+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@lt
Ed8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*
@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6
BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*+
+D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JW
FCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg
+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7
Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&
FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.D
DJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#
BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu
;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t
+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<Vdu
AftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%
?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!
Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]Tu
GA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+
Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8
F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.
A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%
67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL
+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5
?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lq
A0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&
+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$
De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1
BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WR
Bln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhK
ASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%
/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>
+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7C
Bl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5
AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?
DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:Wne
DBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>
+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%ht
A8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8
Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c
?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=
+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkAD
Bl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>
A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JW
FCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>
0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*
1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.
DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL
+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#
F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf
+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's
+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtD
ATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#
F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E.
/ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5
DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPt
AKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)
BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[E
E,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#
$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sP
FD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26
ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=
DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@lt
C`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,Rp
F!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;
%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBi
ARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/
F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0
E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b
76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C
;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6
+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL
%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6
@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeE
Dg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M
/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(
F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6
BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59
-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>j
IXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c
.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9
+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:Nkc
ASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6
-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F
@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb
+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB
?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs
+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-
Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,
@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;q
Ci<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n
5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_A
A8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjN
Bl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,
ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7
BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po
+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,Oq
Bl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6
@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+
$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW
<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9
AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;
FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*
:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.
%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0
%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m
?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ft
FDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"
+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4
AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4
@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(
ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'n
F!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&
ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK
+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dk
ATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbP
A79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&
@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0
AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJG
G]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJ
AT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rm
AKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:
De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3
Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"
+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k
+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+
Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums
+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A
+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bm
Bju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e
,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9
E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL
+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%
0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5
?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*
+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r
+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K
$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8
A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/
F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5
GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'
+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*
De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"
+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s
+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm
3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h
+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<
@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>Ds
AnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@
F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%
1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/
Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"
+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc
:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.
F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.
0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$P
ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUr
F"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*
Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'
+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,
ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.
+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`
@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`t
AU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O
6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.
@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b
.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhK
ASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<
Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<
+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^
7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@
Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\
/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu
%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\
%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6
@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2
DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,
Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4
BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@
F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3
Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44
FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-
FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&
F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#
.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm
3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8
?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&Mgj
DfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*
Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;
FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&Mgj
DfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6
BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=
+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.
DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/n
G9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0
ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)
@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYet
EbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-
+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5
De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%
A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^E
E&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-
+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e
$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg
%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm
+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)
/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7p
Ci<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A
?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b
.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%
0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.6
2BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g
:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;
DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z1
8l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'
+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%
AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3
De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0
DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0DfU,<De*Bs@kouUASu("@;IT3
De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`-$6pc?+>GK&/i#=-/KeS8Fs&2WBlGL1$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,
-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%+E(j7DfBf4Df-\-De*E%
FCAWpATJu.DBNA,E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9<+ohcCgh?sATAo8@:F%a
+>GVoBlbD7Dg*=BDBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1@q?cpDfQt4F`_bHAKYK$
A7]g7%13OO+=\L4Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGnASrW!A7T7^+EVNEFCAWp
AKW]_/e&-s$6Uf@<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!A867.FCeu*FDi:CBQ&);
%144#+EV:.+Dtb7+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n0J5+:+>"^.@;^3rEd8c_
2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*DKI!U1*C:K+CJr.DfTB0
?m'?*G9CR;Ch.T0FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!+<Y?/CiFG<8l%ht
A7]1c+EqOABHVD1AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+0F!+n/A0>Gl
EboH$EX`?u+<X9(F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-+@C'fEb/a&+CJVe
G$lG0Df/uo+CT;'F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D$4R=e,9n<c/hen5
1*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf
-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nfj%Bl[cpF<G+*
Anc-sFD5Z2+CT5.ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1HE+*j%F!+n%A7]9oFDi:3
Df00$B6A6'FD5Z2+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/
DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/ATo7_D..a/DBNn=Bl8$(
A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;
D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))
F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@
+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#
+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsd
D..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJATAo0@:C?uA7crmA7T7^
+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$%144mE+*j%+=DVHA7TUr
F"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)
-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj/oY?5?m'<)A8,Xi
ARlp*D]j1DAKXNC<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHOEb0,uATJu9D]hY<9H[hY
@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC
+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe@r$4++D58-+EM+(FD5Z2
+CSekARmD9%13OO+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%A7]9o/Kf+GAKZ).
AKYMtEb/a&DfU+4$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTC
E+EQkDdt.($4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8Bl@l3@WcO,
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
C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16igA8Gt%ATD4$
ARBA!Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9>]aP%FEDVO
C2[X!Blmp,@<?(/+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*
Gp%0<EbTK7+EV:*F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,
02-)%ATD4$ARBCsDeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+C&T#
AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHV.(%
+Co1rFD5Z2@<-XA+D5_5F`;CS%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8W
Bl89/DKTf-Eaa'$I16NgBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U
@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XWT'F(oN)
+DPh*Ch\!&Eaa'$+Du+>AR]RrCOIfX%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&
Eaa'$/no9MDIS#'$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5
I="t8Bl7Q+C2[X!Blmp,@<?'':ddd$/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$
FCd(DA7g6!$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5I=">(EcP`/F<F1O
6m->TDKTB(I4bs9+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/%144_DJsQ4@;L"!H=[Nm
>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC8T&W]Eb8`i
AUP!p%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?RH#R>8Ch[d&HW3O-
;c#bT6r-0uHX'<aEc#6$<,ZQ!<(KSZ:dIiE:I?6I+<VeTI9Trq@:s.lAS-:'An*l$84c`V5u'gD
6[`5_>XNFHD.RU,<,ZQ!Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*
E+*j%I16NgBR+Q.EboH-CO9Z3Ec#N&@:NkjAU&WM>Y]3XD..6[Dej]3DfT]/Amo1\FCf\>+<Z)\
>?l,UB4Z*pAp\6(@le4?Ec#N&@:NkjAU&W/+C%9PD/Ej%FB!0oHY.2:D..O-+D?%>ATDU$DJNfo
+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0I16NgBR+Q.EboH-CO9]7E,961I=#3oDfT]'
CfG=gHY7A<Ch[u6+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9B6%s-Blnc/+C%9PD/Ej%FB!0oHYm2,
AKYetFCf\>AoD]4B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'Bl@m;HX'<aEc#6$<,ZQ!
BkCd`ATMEmFD5Z2+<VeTI9Trq@:s.lAS-:'An*l9Amo1\F(Jj'Bl@m;>p*B>Df'?&DKJirCO9c5
FCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5BkCk'HX'<aEc#6$<,ZQ!
BkCit+<VdL+<VdL+<VeTI9Trq@:s.lAS-:'An*l9An-6p+C%9PD/Ej%FB!0oHY.2:D..N/Bl8$(
Eb8`iAKYK$D/Ej%F<G[:G]\?C$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$FCflI>Y]3XD..6[Dej]@
ATV[*A8Gt%ATD4$AKZDL>?l,UB4Z*pAp\6(@le[BFD>`)Ch\!&Eaa'$I9dt#6Z6gYASuThDej]=
Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m
I16NgBR+Q.EboH-CO:2JCghEsG\1u?DfTB0I=#3oDfT]'CfG=gHZaOK@<?(*Ao`*6Eb'56I=5=)
E+*BjEb/j0BkCj9Fa%Y1FCf]/Ed)GBA930)+C%9PD/Ej%FB!0oHZa4MEa`p+ARlp"@<?(*+D,Y4
D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@I16NgBR+Q.EboH-CO:8DEb'!#
FFAL@:2b/i@;Jn]CO:8DEb'!#F<D\K+<VdL+FSZB>]=+aATD?oHYI)%3d5L_A8Gt%I9dt#6Z6gY
ASuThDej]:@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLaI16NgASu%*882^MCh[NqFD5W*I16Ng
ASu%*;eTTMARp2u$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC@;]Tu8l%j'%13OO
>]aP%FEDVOC2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.tF<G[=AKXSf@rGmh
+CT.u%16Wa@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XlE*$=%%OB5)71ASuX-
ATD4$AURc;/mSnn>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI6m-#S@ruF'
DIIR"ATKI5$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,ASuT4Ao_<mD.RU,F!+n3
AKYPuFD,6+3XlE=+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(GA\O9Ec6)>+Dbt6B-:`'
@s)X"DKKq\+C')$EajDO+?:QTBle59-YII<F`;5,D.P)B%144#>\S:kD'3(W@8pf?>Te*1AnGb%
ARlp#@:O=rF#kFKG%G]'Ho)sVBle59-YII<F`;5,D.P(G-XUe8Bk;KqFCf\EHjpE*+C&JqA:&$4
ASl.-AUP!p%14C(>\S:kD%-gu+<Ve%Df..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5
F`8I:ART+\Ea33pDffl8FCfeuBPDMs$7-f;+<VeCBl.R+@<?4%DBNe)Gp$R-+D"u&ARlotAftf0
+C\nlDf'',+CQC+Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%14C(+<YlBFD)e9F(KK)D_5p:DIdZq
+Co&"Bl.R+ATDiE+@UHbEd;b?Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&I=2P3,p4<Q@WGmeCLqU/
+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.6+<Ve3
FCf]=FEDkEDe*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.
Ebf5s+Dbb-AIStm+<VeKBPDN?%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p5rL/j)7FIXZ_gHQXqW
@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%14C(:-pQs5(7s0INT(,,p6H(DIe*;ATD6g
FD5T?%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$+C'#"G]\%LHYRJ0Ch\!&
Eaa'$I=2P3%16?^AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT
@j#r+EcYr5DK?q=Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+EDUB+E)-?
8g$)G0JO\YDIal!AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc
%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&8l%i-%144#>\J.hAp\35
FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R^7"$1lF!+m6
8du+M+CSekDf.0M8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#>\J.hAp\35FDu:^0/$gR
A7[B.F)PZ4G@>N'/n8g:06_,GBeN:k@r5XlI=#pA@r5XlI4bs9>\S:kD%-gp+A$HlFCB!%+A,Et
;bpCk6U`U:$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4Ysl
Ea`c;C2[X(Dfp)1AUSnt:IJ,W<Dl1QI16N++DGm>@;L"'+CQBb+CSekDf.0M8T&Tk@;Ka&BlkJA
Bln#2>]aP%FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et%144#A8,OqBl@ltEbT*++ED%5
F_Pl-A0>u4+C]J-Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u$$6UHrFCf]=FEDkEDe*Zu
FCfK$FCd(Q%16?SFCf:u$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.hAp\35FDu:^
0/%9QDIdZq/oPcC07A1d@;]Uo@sos=$6UHrFCf]=FEDkK@;]Uo@soJCATDj+Df-\&FCf]=FEDjb
/ibO=/hqbs@;]Tu@V'h'DIak!$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+B.b<'EbTH4
+Eh=:F(oQ1F!,L7EHPu9ARlp#De*QoBk(RnBl@lA+B3#c%144#AoDL%Dg,o5B-:Z"DeC23Df^#A
+E2@>G%kJu+Dl%;AKY])AoD^,@<?4%DE846+<VdL+<XouAS5^pHY%);D.R`rFCfk0$4.gt>\S:k
D'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55f
Eb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKaA8bs#;gE8&@<`ncBkM*Q
BkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pq
Dfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*
07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$
DJ(VNHVe-gA8bs#@UX=hA0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#
+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#
@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?q
Blmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+7
06:]ABe=.8FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca+C&ttEbTK7F(or3%144#
+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%
ASl-5Ch\!&Eaa'$/S]3707=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp#DIe**DKTf-Eaa'$I16Ng
Blmp'%144#6?R!YA0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>
@3A/bB6%p5E%W8*:IGX!+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>F"SS7D]in*CLnVnFCf]=
FEDkEDe*ZuFCfK$FCfkCA8aL<$4R=g+C&AeB5)71G%G]'@<?4#I16N0+ED%5F_Pl-+=Cf5DImis
CbKOAA1%fn,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g3Ci^^HC2[X!Blmp,
@<?'.%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3
>?q[F>Y]3XD..6[Dej]?AT;j,Eb-AA>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:m,/ATD3q
05>E9>]aP%FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!4$%dp;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%FE)GAFCfN-DJ*csH[U;b
>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_Dej])FCf]=
EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHYmS?+FRKnFE2)5B2ieb
HX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^M
Ch[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!Df0!(Bk;?.
@rH7,@;0UnDJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%14C(>[h8WBl89@ATD6g
FD5T?%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+C&JqA:&K2EaiI!Bl/8-
$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!De'u=>YAXR
GAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%
FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=
>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*q
BkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+A?]^A0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR
6"Y4MEZf4-CM@[!+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk$6UI-Ddd0fA0>]&CLnVs
DL!?s+EM%5BlJ/H%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7#B@:UK.C2[X!Blmp,@<?'.%14C(
>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3X
D..6[Dej]9Ddd0!I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJ
DffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B)in
+CQC:DfTW-DJ()&Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%%144#>YJR*
AQXCnBl%@%/g*GrC`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.A8-'q@ruX0Gp%0IARfFd
Bk:ft@X/Ci+<Xp2AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%14C(>[h8WBl89@ATD6gFD5T?%14C(
F(KH.De*ZuFCfK$FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3
Bl[cpFDl2F%13OO,p78?FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-73
$7-g9ATV[*A8Gt%ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0Fa+?&,p6H(DIe*;ATD6g
FD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZNb?
C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sA
I39Y;6Z6gYASuThDej\p67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cp
FDl2FI16Mm$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'
B5D.+I:G<CFCf]=@UWb^F)59+BR>/LASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL>XNFH
D.RU,<,ZQ!:-pQUGA1r*Dg-8N%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!
>]aP%FE)GAFCfN-DJ*csH[RP\Df'&=C2[d'06CcBE*RKrG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&
DKJirCO8fC/g+tEDKU2P%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%
FE)GAFCfN-DJ*csH[U?bASlBkFCf]=EHQ2AATMR'B5D.+I=34\+<VdL+<VdL+<XoVDf'?&DKJir
CO8fC/g*b/A7]@eDIm?$AoDKrATDj?%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo
>\S:kD'2bgF<GL@FD5Z2@;I&pF`_;8E[YuX+EqOABHUi2@:X(^+C'#"G]\%LHZNb?C2[X!Blmp,
@<?(//e&.m@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G;fm%oDJ)peCO9<.
AU&<:F`2A5F(oN)Ch7sA6=FtQ@;]=lAU&<:F`2A5F(oN)Ch7sAI9]NcEc#6$<,ZQ!+EM+9C2[X!
Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foK@UX@g
@<Q3eFCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUF(KG99OUn3=<M$pFD,T5.!$g[
FCf]=+CT.u+Co2,ARfh#Ed<'B$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'
%144#;KZk">]aP%FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n\@
FCf]=FEDkBEc>i/FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9FD,5.GAhM;Bl7Q+A8-'q
@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.B6%p5E$0%,D.P=/$4R=g
+C&AeB5)71G%G]'@<?4#I16N0+D5_6Ch[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">CLqQ0C2[X!Blmp,
@<?'5FCf\>%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$
Bl7R3>?q[F>Y]3XD..6[Dej]4Ec>i/F<H!:;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!
Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=35C6Z6gYASuThDej\p67sBt@;BFq+DPh*Ch\!&Eaa'$
/p(ZL+FO\+>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHkF(HJ!9OUn3
=FP@1+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU+:SYe$6UHW
+EM4-Cht58@rc:&F<Du:FCf]=FEDk=@<?o?DfQt*FCf]=FEDkNBRM<PBlbD@EbTW;ASrW4D]j.8
AKY6"AU&<=FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1
@q?d$Aft>P@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$
Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%
FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#
De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTu
Anc'm%144#>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q
@ruX0GqKO5>\.e`HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aH
FWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgT
F<Fh1AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+
DId='%144#@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)F<G[=BlbD6@<iu9ATN!1F<G:8
+Eh=:Gp$pADJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#
AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%OB5)71D09Z:Bk)'t
F+&BkI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHrFCf]=
FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Et&I!
+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l0Hak=@<,dd
FCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O
=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((sFCf]=FEDk2;F+,Q
76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9%16?SFCf;3%144#
>]aP%FEDVOC2[X!Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%BP_BqBQPA%ASlC"HZsL=E,]B!
I3<!;G\(D.8g&"iF`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7+E(j7F*)G:DJ+#5@;]TuDffZ(
EZf:BBOu3,FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+ARlp$Df0H2F`)7CFD,*)%144#
@rH7,@;0U%Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&>]aP%FEDVOFa%Y1FCf]/Ed)GB
A93/M+EM+*+E1b%AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+#SK$6UI$@;[2sAKZ,:ARlp*
D]i\(DImisFCcS"ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4F*1u++EqaEA9/l8BOQ!*@ps6t
@V$[!@;^3rCi"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8BOr;uBl%@%+D58'ATD4$ARlom
Gp$@6AU&<=FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0F)Po,+DkP)F^])/ARoLsBl7Pm
$6UI*F!+n-G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>IASu%*ASuX-ATD4$AUP!pC2[X%
@<-4+1,2Nj/h1USA8kstD0$h@/M/)UAS,@nCige1Bk)7!Df0!(Gp%'7Ea`frFCfK6/e&._67r]S
:-pQU<+oue+D,>(AKY].+E_a:A0>u4+EM+9+<Yc>AKW++AS,@nCigdBA8,OqBl@ltEd8dH@<,dn
ATVL(Et&IO67sC&@:F%a+<YB9+EV:.+DkP.FCfJ8Anc'm/g+5/ASrV5@3?\1ATo8-Bk)7!Df0!(
Gp$gB+CfG'@<?'k%15is/g,7LAKW+7@<,dnATVL(F!)T>DBO%7AKW+4@<6O%EZet.Ch4_tEb-A9
F(Jl)FDi:CE+NNnApGLAFD,4p$;No?+E1b0@;TRtATDi7AoD]4@3BMtEcc#*F_kK,+Co1rFD5Z2
@<-WG+B3#c+<Yi=Eag.>A8lU$F=A>B@;ZM]:-pQU@V$Z)+E_a:A0<":D]g/FD/Ws!ApGLAE+*cq
D.Rg#EZcKGATW$.DJ+#5+<YB9+<Ve@DIdI)Bk2?pC^g_H67sBkBk)7!Df0!(Bk;?<+<XBeF*(u6
+<Y91Ch4`.@<,dnATVL(F!+t$DBNk8Cj@.4AKYJr@;]^hA0>?,%15is/g+_9Bln',B-;;0BlbD/
Bl%?'@;]TuEb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch54.$;No?%15is/g+,,AKYhuF*(u6+D,>(
AKYJkDBND"+ED%'Eb/[$ARlp-Bln#2FD,5.@ps1i3XlEk67r]S:-pQU@rc-hFCf;tF*(btC2[Wi
+A,?o;cH1`?X[\fA7#cQ:-pQB$;No?+BLj,:.\2N3ZqjIC`mh5AKW+7@<,dnATVL(F!+t8EcP`/
FDQ4FCh[s4ARlolEb-A6AT;j,Eb/c(@X/Ci:-pQUFD,5.8l%htF*VhKASj%B8S0)jDfm1CASl@/
AKYE!Gp%$;+EV:.D'2GH6m-\fCht5(Eaa$&/g+;8FU\[Q67sBj@;[21F(&ZlCj@.3A7QfkA7TCr
Bl@ltC`m\*Ea`frFCfK6+C]J8+<YrJFW_f:@;]t$F<GX5An>e(%15is/g,1GD/XT/+CfP7Eb0-1
+E1b0@;TRtATDiE%13OO9gM]W78crJ;GC(Q3Zp+!3Zp*c$4R>;67sB[BOr;uDfT]'F<GL6+EV:2
F!,F1Ea`frFCfJ8Anc'm+DGmX%15is/g)8Z+<YE:@;TQu4!5qnH#R=D+Co&)@rc:&FD5Z2+?L]h
@;L't%15is/g(T1:-pQU+<VdLC2RHsAKY].+CQC9@;KXg+A*bo@;TQb$;No?+<VdL+=M>WE+LI@
A7]glEbTK7Bl@l3A8bt#D.RU,F!,R<AKYr#Ea`frFCfJ8/Kf.\E+L/+F!,L7EHPu9ARl5W:-pQU
+<VdL+<VeFDJXS@-nB"LFCf)rE[`,FF!+t8EcP`/FDQ4FAU%crF`_2*+E)@8ATAo8H#R>9+EqO9
C^g_H67sB'+<VdL+<Y-)+E1b1F(Jl)@<3Q$BOPpi@ru:&+Dbb5FE8QQF(Jo*A8lX!@VfU)/e&._
67sB'+<VeM@;L't+DGm>@;[3!G\(B-FCAWpAKXSfAU&07ATMp,Df-\>BOQ!*E,ol-F^o!(+CQC9
@;L't%13OO5uU-B8N8RM+<Vdg+=JaSDKKH&ATB4BGA(Q*+>G!]F(HJ&F(8ou3&MgmDBNJ4D/aP=
-nlc^EZd(c+<VdL+<VdL+<VdL4!67#+:SZF:Jb1`5snUI;BS%D-nB"LFCf)rE[`,@Df'H3DIm^-
F!+t2E+rlo+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E1b^@$+<Vdg+>GQ(%15L!6WHiL:/jVQ6W>0i
+=JaSDKKH&ATB4BGA(Q*+>G!LBk)7!Df0!(Gp$X9@s)X"DKI"8F!,FEF<Dtc+E)9C0e"4f+<W`g
0b"IX:IA,V78?f`8OQNK+?L\o.qrmCAS5Rp.3NhKA9;K-De:,,F`VY=Anbge+CoD#F_t]-F<G[:
G]Y&V1,(h94>JcO.3K`p+>tq`$:Ilg:e!`<<)6C74!5q%Bl8$(B4Z*4+E(_(ARfh'+CoV3E+NQ&
Bl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e+<VdL+?L]'0F\@Z78u`B6W?iZ+<W`g-nB"LFCf)r
E[`,TDfTB0+ED%8EbT*.ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i91cQp,+<Vdg+>Pf.%15p3
<(9/@<)6C7+?L\o.qrmCAS5Rp.3NhQEb'56F*)>@ARlotDBNk8AKYf-Df?h<@<6K4-o!D<Gs!i9
1cQp,+<VdL+<W`g0eb9j$;s;l5tOg;7n"OC4!5q%Bl8$(B4Z*4+EqL1DBLYVFD5T'F*(i-E-!.1
Eb-A7@<Q3m+DG^9A9Da.F!)kb+E)9C0e"4f+?L]#%15Wl;b0;V9i)rT+?L\o.qrmCAS5Rp.3NhJ
ASrVF+CQC+@<6*)BlbD9Eb/isG\(D.FDi:4F_u)=+=JodDfQsT.3K`U+<W`g0b"I!$;No?+Au!2
<(9YW6q'urBlbD.D/aTB+C]U=A7]@]F_l.P+A$/fBlkJ3F!,O8F<G[D+CQB@C2dU'BIP&r+Cf>-
Anbn#Eb/c(%15is/g+bECh.*t+Au!2<(9YW6q'urDg#]4EbT&qF!,"-@ruF'DIIR2+Dbt+@<?4%
DK?q4DfQsKD/=8B+D58'ATD4$ARlp)@rc:&FE8Q6$;sYq<(9YW6q'ur4!5q]BOPpi@ru:&.3NYB
A8-'q@ruc7-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFd%13OO:-pQUFEqh>@ps0rDJsE(D/aTB
+EM+9FD5W*%15is/g+%f:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,OARoLqARfh'+=M)CF"&5Q@rc:&
FE8RHD]hXpAoDKrATAnT+F\HSATBG=De*m,Dfd*2$4R>;67sBHDL!@5A7T7^+E1b0@;TRtATDi7
@<,p%F*)>@ARlotDBO%7AKYhuF*(u6+D,>(AKZ21ASqqa:-pQU@rc-hFCeu*@;]TuA8-+,EbT!*
FCeu*FDi9o:IH=9Bl[cpFDl2F+E(_(ARfh'/g)8G$4R>;67sB^5uLHL:.I>fGA(Q*+Co%qBl7X&
B-9ehAU&07ATMp,Df0V=@V$Zl@<,pkF_i1/@W-C2+EV:.+?L]UBOPpi@ru:&+:SZQ67sC&BOr;Y
:IH=8De*E%-tI:=@:F%a.3N_G@<<W2@<-F#F!,R<BlbD<FE2)5B-:o0+EDU8Bl.F!FCB38/e&-s
$;No?+@Aq$=].g]85p]n+=L`5@<,ddFCfJA+?L]3Cht57BkM+$F!,L7F(KB8ARl5W:-pQU9j(:Y
;F+#G<(0\-4!5q%Bl8$(B4Z*4+EV:.+CT//G@be;4!6@8%14Nn$4R>WDe*g-De<^"AMPu867sa&
De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]
:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6
ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[
BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q
%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@n
CigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>
A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)s
Afu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=
Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm
$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5
+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQU
Bl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:
Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]
@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k
3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>Dk
FCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1
BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C
+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is
/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5W
A8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$
De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*
A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is
/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D
%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH
>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU
3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp
78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is/g+4d78cQ?9h@K/+=Ci@D.P(($4R>;
67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,
D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9
De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"
ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c
$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ
;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2
F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$
0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QW
De*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ
67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_u
G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]
/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR
/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4
%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV
6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8
DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A
@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(C
D/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2O
F<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0
Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$q
FCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$
F`&=D@<H[1Ci<s3+EM75ASuU+Gp"[]Dfp/@F`_[IDf0B:+D#e:Ch[BnFEo!=De*Ei%17,q4ZX]?
-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673
$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*
C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:
+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQU
D.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4
GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8
DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(C
G9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&
E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028
+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U
+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUh
BHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k
?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[
4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2
%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8
DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'
+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,
67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c
$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&C
DIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("
@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)
+C\biEarHbC2[Wi+EBUt+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6
+u(3]4YAE2B5DKqF!a'nE]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iu
E]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp
+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4
?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1
ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8
Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M
$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\
EcXB)><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL
:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'm
Et&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C
1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/
DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])
ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,
ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^
+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,
-o3V*5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0
Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+
1*Bk14?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_
/h%uO.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_
/h&+q/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZur
A8--.FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_
+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;
,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N
3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^H
AS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`
-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7
FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3
+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#
Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'
+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1
E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g,@OATD?)@;R,Y+E_a:A0>?,+EMI<AKYhu@rcL/+Eh10
F_,V:-[0KLCF:6CEZc`CDf'&5%15is/g+4d78cQ?9h@K/+=DAOEbd$3$4R>;67sBkF_u(?A9)C-
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
>9Iip+=D#;E$lc4+>Y-YA0<6I%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U
<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hen52BXRoA7]p3%15R#
9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp
6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gk
C2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/p
CG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A
%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l
/nng6%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![
C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKi
Cggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da.
/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO
8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#
+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg
@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19
FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1
%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6
@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")
FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=
AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O
:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIj
B5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UH
AKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E9
05>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!
A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD
FD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%144#+D>k=
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi
05>E9/oY?5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL
:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/i"d`$:[fb6q(!:
3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi
$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1
Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<A
Ado)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX
@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQkDdtG#
F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]
:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=
D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16uk
FCep"DejD:FD,*)+EM47G9CR;G9D!G+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).
AKYMtEb/a&DfU+a%13OOC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m
%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G
+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a
+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5M
DBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<r
An?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s
$<BSn;b9b[4ZXrF/hen52BXRoA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI
:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!
3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'
F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk
6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2
@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2
DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,
@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@
%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!
@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2
@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#
D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1
%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5C
F`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^m
FEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9
E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y
:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9
FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.
BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeY
F)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7
+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDkD0]l7A8lR-Anc'm1,2Nj/h1^`C2[X%
Ec5Q(Ch4`1/M/)^Gp#^T6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]
:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6
ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[
BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q
%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@n
CigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>
A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)s
Afu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=
Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm
$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5
+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQU
Bl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:
Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]
@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k
3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>Dk
FCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1
BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C
+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is
/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5W
A8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$
De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*
A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is
/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D
%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH
>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU
3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-
AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)
78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O
6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6
Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC
+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$
+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu
@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4
D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A
+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1Lmr
EaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8
+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1Lmr
EaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*
B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)
DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[Flo
De*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef
@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%
%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws
+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>
F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P3Zp4*
Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8
DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+EV19F<GX=Ch7L+Cj@-T+E).6Gp%$J
FDuAEF!,[?@<<W7F(KA7F(KH7%17,q4ZX]?-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T
+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4
+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb
1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7
Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2
$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\f
A7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3
A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjb
G7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9
DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#"
:-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n
+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!
%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&C
DIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J
?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,
+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77
B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud
:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@
+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+
4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI
:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7
An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+EBUt+ED%:D]gDT+CoCC+EATF
ATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'nE]l%'/ohC..1HUn$;No?
+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\
-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUc
De*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQU
A8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o
0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.
+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6
A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\
$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??
-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+
.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-
4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M
-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;
@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&
1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\
.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$
Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4
Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV
+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&
>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_
/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$
A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI
4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk
4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is
/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/
+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,
%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p
+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is
/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX
@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=r
F!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g,:XARlom
Gp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDa84?EF5tsp6
3Zoe`Df'&5%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O
+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^YF(Jl)
@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9
C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!
@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5ATMF#
F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQUF(KG9@3BN0AS,LoEb/c(E+*WpDdso.DBO%7
BlbD6@:NtbDIjqB+E_a:A0>?,+=LuCA8Gt%ATD4$ALS&q:-pQU:f9_O78d#P6r60E6r-053Zoe;
3a>[+ATDisB4Yt$Bk&c<F(KAs6#^d2@<>p_9Q+ELCg9eFDIdZq>]=+hA8bs*%13OO:-pQU8l%ht
G%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.
$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G
+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5
F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!Z
D'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^E
De't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgCl$3            ~>
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
zz=:zz,' JSON JVERSION LASTPUT LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARM'
zz=:zz,'S MAXEXPLAIN MAXNAME NAMECLASS NVTABLE OBJECTNC OK OK001 OK002 OK00'
zz=:zz,'3 OK004 OK005 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PA'
zz=:zz,'THDEL PATHSHOWDEL PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOL'
zz=:zz,'LIM TAB TEST TEXT UNION UTF8 WORD XML abv afterstr alltrim badappen'
zz=:zz,'d badblia badbu badcl badfl badil badjr badlocn badobj badrc badrep'
zz=:zz,'s badsts badunique beforestr bget binverchk bnl boxopen catrefs cd '
zz=:zz,'changestr checknames checknttab checknttab2 checknttab3 chkhashdmp '
zz=:zz,'createjod createmast ctl datefrnum dblquote decomm defzface del des'
zz=:zz,'troyjod did didnum dnl dpset dptable empdnl fex firstone fod fopix '
zz=:zz,'gdeps get globals globs grp gsmakeq guids guidsx host hostsep isemp'
zz=:zz,'ty islocref jappend jcr jcreate jderr jdmasterr jnfrblcl jodsystemp'
zz=:zz,'ath jpathsep jread jreplace justdrv justpath jvn lfcrtrim locsfx ma'
zz=:zz,'ke makedir markmast mnl mubmark nc newd nlargs now nowfd obidfile o'
zz=:zz,'d ok packd plt put quote read readnoun readobid regd remast restd r'
zz=:zz,'v rxs rxsget rxssearch saveobid second sha256 tc trimnl tslash2 tst'
zz=:zz,'amp uses valdate wex wrep write writenoun''),(<<;._1 '' jodliterate A'
zz=:zz,'LERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEG'
zz=:zz,'INNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODP'
zz=:zz,'OSTP ENDNOTJ FAKETOKENS HINTPFX HINTWORDSPFX HYPERLINKPFX IFACEWORD'
zz=:zz,'SPFX IFACEWORDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLBUILDTEXuni'
zz=:zz,'x JLBUILDTEXwin JLCLEANTEX JLCLEANTEXunix JLCLEANTEXwin JLCODEFILE '
zz=:zz,'JLDEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JLHINTWORDTEXBEG JLHINTWOR'
zz=:zz,'DTEXEND JLINSERTIFACEMD JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWTEX JLSHEL'
zz=:zz,'LEXT JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLiteratePreamble LATEXT'
zz=:zz,'MP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNHEAD MARKDOWNTAIL MARKDOW'
zz=:zz,'NTMP NORMALTOKPFX PANDOCTOKPAT ROOTWORDSjodliterate STRINGTTOKPFX T'
zz=:zz,'EXTQUOTESINGLE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLIMIT WRA'
zz=:zz,'PPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenstrs boxope'
zz=:zz,'n changestr charsub ctl cutnestidx cutpatidx dbquote dbquoteuq fbox'
zz=:zz,'name ferase fexist firstones formifacetex formtexindexes fsize fuse'
zz=:zz,'rows gbodylatex gheadlatex gpostlatex grouplatex grplit ifacemarkd '
zz=:zz,'ifacesection ifacewords ifc indexgrouptex indexwraplatex jodliterat'
zz=:zz,'eVMD jpathsep jtokenize latexfrmarkd long0d0latex markdfrghead mark'
zz=:zz,'dfrgpost markdfrgroup markdfrwords markdj markgassign markgnonj pat'
zz=:zz,'partstr ppcodelatex read replacetoks rtrim sethintblock setifacelin'
zz=:zz,'ks setifacesummary setifacetargs setjodliterate seturlsha256 srxm t'
zz=:zz,'lf toJ tslash2 utf8 uwlatexfrwords wfl winpathsep wordlatex wordlit'
zz=:zz,' wrapQtlatex wraplix wraprgidx wrapvrblong writeas''),<<;._1 '' jodma'
zz=:zz,'ke DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 D'
zz=:zz,'UMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0'
zz=:zz,'157 ERR0158 ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOB'
zz=:zz,'CATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP '
zz=:zz,'SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtc'
zz=:zz,'l createmk ddefescmask dec85 dumpdictdoc dumpdoc dumpgs dumpheader '
zz=:zz,'dumpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap fm'
zz=:zz,'tdumptext fromascii85 getallts getascii85 halfbits htclip jnb jscri'
zz=:zz,'pt jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep opa'
zz=:zz,'qnames parsecode prefixdumphash putallts rlefrnl sexpin sonl tabit '
zz=:zz,'toascii85 uqtsingle wraplinear wrdglobals writeijs wttext''         '
zz=:4614{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^72+>P&q+>Y`32]sh0+>GZ11GU(3+>Gc.12:`<:-pQU.V`m4+CcuT+DkP$DBMPI6m-#S@ruF'
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
%15p7<(Ke[4ZY>Y%16$29KbEm0F\@];bp.O3\rK"$;"&s:-q*)1GTCH%15is/g,">@rcK1FCf]=
+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM6r-lZ
/6,Y=3%Rm/<(Ke[/5oD>/4ri::+St5=\_9m$4R>;67sC!@VTIaF<G(3A7]fk$<L#$6p3Rb%16''
;cGn@0b"I[;GU:h4ZY>-$<'qr<(/r21CX[c5snOG4ZYD/$4R>;67sBkBk)7!Df0!(Gp%0>Ch=f1
AS,LoASu!h%15Kp6W?WQ:-hc\4ZYG0$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF#kFF
:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/:I7ZB6W?fJ4ZZY?;FE'878m/:7oE,_:b5OF8Q8,0
9gM-E:CRX?$;No?+C\bi+E(_(ARfg)@rGmh/0JJ7E+NotF#kF>6:s[6<),di$=[FSDdmHE3a4Wf
/M8/M3Zon)0-FI[+=nX@+D!/J:I7ZB6W?fJ,$tcd%15is/g,+AFD)e-ASc'tBlmp,+Cf(nEa`I"
ATAn?+E1b2BHV8:DI[d2@<?4%DBNG&@<,ddFCfK6%15ot<(KDG9KbEZ8OccQ:*=m+-SJ^P%15ot
<(KAI;H#_>-QkH&/LN)G5u^BC78+-t%15is/g,+AFD)e?ATD7$+>"^ID.7'e+>6tB@q]:kF!,")
E+NotBl7Q+Df-\2Df^"C:K%]0BQ%s6F(K;R3ZohB7TW/VHRCIO-RgAj-n%YV=%Q/6-X8;P.3M27
5WV%N>q(1N%13OO:-pQUAU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,
@;TRs%16imF*)A0FD*fu><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[
/g*tV<(KDG9I;n3$4R>;67sBkAS,@nCige:@<6O%EZf=ADe<^"AKZ,:ATAo0De!3tBl@m1%15is
/g+nIA93$;FCf<.@<?0*BlbD5AS-$,B5DKq@;I'"ATD?)@<3Q5BPDMs$;No?+Eh=:@N]B++Co%q
Bl7Km+DG^9C2[X$DD#X<Et&IK9gM]W78c90C2[X(H#n(=D/`p*BHS[;D..L-ATB.-$;+)^:f:(Y
4Z[=rA93$;FCf<.@<?0*-YdR1E,ol/Bl%?5Bkh]:%15^'6rd/S;E['UDe*p7F*(u1E+*j%+=CoB
A9Ds)Eas$*Anbm1Bkh]:%13OO:-pQ_ASu$hAT23uA7]Y#Et&IkDe*ZuFCfK$FCe36/h1USA8Gt%
ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&Eaa'$+EMIDEarZ'@rGmh+CoD#F_t]-FE8R8Bl[cpFDQ4F
Ao_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6gFD5SQ+EM+*+EV:.+D,P.Ci=N3DJ()$Ci<r/
E,Tf>F!+n/A0>N!FD,f++D,>(ATJ:f:-pQB$;No?+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370+A7`67sBoFEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TC
B4u*qB4uC$DJ(U3$;No?+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=
FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5%15is/g+hLFDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$
/no9MDIO%^:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)9984c`V5u'gD6QdKo+<W6YAp%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+
DBO"6ASc0*E+*j%%15is/g)9KDfT]/Amo1\FCf\>+<W6YAoD^,@<?Q5BR+Q.EboH-CLq$!@;]Tu
BPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?+<Y<;E,961+<VdL+<VdL+>"^Q@;BEsCghEs
GT^U:EZf"8Dfp"A.![6N$;No?+<YB1@:NkiARfgrDf-[?+>"^MDKKH1Amo1\+EM+(FD5Z2+EM[B
D..I1+EMXFBl7Pm$;No?+<YB1@ium:+<VdL+<VdL+>"^JDfT]'F<G:8FCfK)@:Njk@rH4$ASuT4
FCf]=%15is/g)9XATV[*A8Gt%ATD4$AKWQIE,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9
Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA67sB'Fa%Y1FCf]/Ed)GBA9/kF+E_RGEa`p+
ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@%15is/g)9\
DfTB)BlkI?+<VdL+<W6YD..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW.1HVZ67sB'%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP>$@rsCZ%15is/g)_t/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l(De!lC1E\)j.3N8DE,961+CT;'F_t]-F<G"&A7]9oFDi:CF`;;?ATMo8
Ec5l<+EV1>+E)F7Ed)P<FCfM&$;No?+>GWi@rsC]+D5_5F`8Hp7R9C1=&2^^;eL,hF`;5,D.Oi'
H#R>8Ch[d&ARl5W:-pQU0f!ZWF>,QpEb03+@:NkZ+?MV,E+*d.Bl7Q+GA2/4+=MGGCagJY+D>2$
A8Ggu+C\bi+DN$/De*Dg$;No?+>GWi@rsCa+CSekARlopEcQ)=+D>2$A8GstB-8cKEb03+@:NkZ
+=MGSBlmo8+EqOABHS^IEbTW,@<3k,$;No?+>GWi@rsF[+CSeqF`VY9A0=QS<+T/SE,oMuD.7<m
+>"^GBOPdkBl7Q+D/X<1AoDR/Et&IO67sB812gZE0esk[A7T7^+=M;?FDkr+DK@6L/Kf1WAS-($
+D,P4+CT.rCjC>@DJ()%De*E%FCf]=%15is/g)l(De!lD2]uO>A7]9o.!K]?E-?82Ci=3(.3L2b
Ci=3(+EMIDEarZ'Ch[cuF!,@=G9D*M@;p0sA.8l@67sB81Lt',1-$IcA7T7^+EVNE-u*1#CNCpI
7qm'9F^cJ6AT2R/Bln96Gmt*U67sB90Pt6D0K1+_A867.FCeu*GAhM4+D,P4D..O#Df-[GG@kY?
+D,P4+A*b:/hf!h$;No?+>PWf@<jOd+E_X6@<?'k+D,P4+CfP7Eb0-1+=M2;DIdZq.3NeFEcYr5
DK?6o:-pQU1,*HcDD4!l@:Wn[A0<:4DfT]/Amo1\FCf\G+EVNEBl8$(Eb8`iAKZ28Eb'5#$;No?
+>PWgDg!fh+CSekARlorEa`p#Bk)3,@;]TuBl7EsF`V88DK?qAF^elqEb/a&DfU+GFDi:@Eb/Zr
@VfTb$;No?+>PWgDg!fh+C&AeB5)71A8bt#D.RU,I3<BFG%G2,FDi:BDf9_?Anc'm+D,P4+A[/l
E_L%QAhIS3D%-hI67sB90Q(fP0Jjn#F(KH.De*ZuFCfK$FCcmD@r,^bDImi2F(96)E-*WR@<H[*
DfR7I.4cTQD..-p+CSekARl5W:-pQU1,*TaFtk`p-ua-8De*Eq@<?(*.3N&0A7]9oFDi:1A867.
F<G(3Ci=?.DJ()1Afu;<@;p0sA0>]&DImku$;No?+>PW]ARdDK+=MAVCghEsG\1u?DfTB0.3N&0
A7]9o%15is/g)o(A7]7+0d%l:9LDKB5u(BJ=ESLqGUst09L;`N9LMiK=ESLqGUst09N+JN9M@lW
<%/quA7T7^%15is/g)o)@<H3:3$9VjATVU"DKK?(De!Q3+CSekARlp*D]gH@Ec>i/F=@Y+%16T`
@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/h1CCE+NotASuU2%15is
/g+\9@r,RoARlorCi<ckC`mD&Eb-A8D]iJ3DeW`)@rH6sF`V87B-9lV<+T/SDIIBnF!,[@FD)dh
+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_78u]X+A,='<_5_]<(0n38k_QO8PDNO79C[)9LhuW9M&2_
79C[)9NP"f6qg0O<(0n3%15is/g)Pl.6T^78l%iKBlmp,@<?'WEb/Zr@VfTu8k_TG76s[J79C[)
9N+JN9M@lW<$4e,6<-TN6rZTWF`(o<%15is/g)Pl.6T^78k_TG76s[J79F\MBm:am9L;`N9LMiK
=EeIs+A,<p9LV6B<(0o5Bl5%&$4R>;67sBYDeEX%+@pWh-Z^DSDfTA2AoD^,@<?4%DBO"B@<?''
D.-pfBl7K)/Kf+KD/!g#@<*K4D]h,&+C]J8%15is/g,+AEcYf5+EV1>F<GdAFD)dj7WU+'Eb0?$
Bl7u7GA(]4ATMg!@q?ckDIal'@;]UlATJu4E+No0EHQ2AATKI5$;No?%15is/g,=KEaiI!Bl,mR
DJsW.+Co1uAn?!oDI[5e$;No?%15is/g)8Z+EqF6-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO
:-pQU+<Vdg3[ZF2+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$4R>;67sBoBk1ctF(96)E-*4=De!3l
F!)VS.OdM5+Dk_,+EM.2+:SZpAo'U_+>Pf4,VU>`+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g+7=
DffZ(EX`@mAo'U_+>Fu]-oihe/nlpc+=AT\+<VdL+<VdLI;NS4+<XEG/g+(8GA(]4ATMg!@q?c2
F)YPtAKYE!A0>Q(EbTi<DKK<'+EV%$.1HW$Ao'U_+>P&^-nHcT/nlpc6"),i.kbTh1,^R(I;NS4
+<XEG/g*G&5qQ7_@4cdJAU%^$F_#3(B-9ql64F9=Ao'U_+>Y,_-t+`B/gjCA.3K`U+<VdL+<VdL
I;NS4+<XEG/g*n3FD,5.Ch7^1ATAng%16raCcsBn1a!nh@4l7H-UK10+<VdL+<VdL+<VeTD.[T,
+AP6U+@72mBOr<&ATW$*EZd[X$>jBk4Y@j7+<W(@/nlpc0JP==1c70M3&t=n.3O%UAo&S4:-pQU
3?VjHB5)I/+CT.u+C>QbD.[TI/g*%p+=LYNBeCbc-Rg/\+<VdL+<VdL+FS*=C`jiq67sBK+>+*1
D.[TI/g*(q+=LYNBeCbo-Rg/\+<VdL+<VdL+FS*=C`jiq67sBJ+?Br=D.[TI/g*+r+=LYNBeCb\
-RU>c+<VdL+<VdL+FS*=C`jiq67sBX+E;OBFCbmgD.[TI/g*.s+=Js#.3K`U+<VdL+<VdL+<VdL
+FS*=C`jiq67sBJ;@NtMAo'U_+>GPm-o!D)+<VdL+<VdL+<VdL+<VdLI;NS4+<XEG/g*hW%13OO
F(T5O/g+LV?!JR.+FPjd/it[m1*@u!+?CW!.1HV3+BTa/+<Ve*+<VdL5p.9m+AO%%+<Wun+<Vde
+<VdL6m*Tp+@@7o+<XN(+<Vdo;BR))+<X?I+<W%;0F\@30d&1n+>GVo0d%So+>Fu]1E\Cp+>P&o
+<WQb0d%Sn+>Fu]0d&1n+?(Dt+<WBm+>Fu]+>Fun+<Ve%67sB7+<YB9Bln&tC^g^o0d&4o+>GVo
1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8+<YTE
BOu2n$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]
+>P&^+AP6U+>P&^@;Km9DKTe*$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jp+>=o\1*A7n+>Fum+<WB]
0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>Y,_:(7OQ0d&4o+>GVo1*@\p+>=o\1*A7n+>P&n+<WE^
0H_Jq+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB;+<XEG%144<+>=o\+?:Pu+<WZe0H_Ju
+>=o\3?U!u+?:Pu+<WB]0H_Jm+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*"o+AP6U%1444+>b2`
0f'q++<WQb0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jm+>=o\2]sq"+>GPm1*@\^0d&4o+<XEG/g*%p
+Du==%144:+>=o\+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\3$9mt+>GPm1*@\^
0d&4o+<XEG/g*(q+=@U*+>Fuo+<WBn+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc
0H_Jm0H`+n+<WB]1*@\^:-pQU3$9=k-OgD*3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+?:Pu+<WBm+>P&^+>Fuo+<Ve%67sB@+<Y04D/Ej%F:AR"0d&4o+>GSn1*@\p+>P&^
1a"Or+>P&p+<WQb1*@\o+>P&^0d&4o+?(Du+<WBm+>P&^0eje)+<Ve%67sB80H`_\%1444+>P&^
0eje++<WE^1*@\r+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l'
+@B%#7L]\I0d&4o+>GVo0H_Jn+>P&^1E\Fq+>P&p+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^
+>Fuo+<Ve%67sB81*CXW@:NjX$6V&G1*@\o1E\@o+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]
1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GYpF)YPtAKYDnFCfJ8DKTe*$7QDk%15is/g,@VEb$;)
DfT]'FD5Z2+D,P4+Dbb0ATJ:fG@kYS3Zoh)4*,"M4)JSG.3Kr[4$!fX%15^$6qL9F6W?iZ=Zneg
-RT?1%15^$;b0>N9LW&_4ZX]I8OccQ:4#&`-Z`rD@UX@+%13OO:-pQUGB.,2E+NQ&Ch[cu+E2@4
AncK!$<L+k:eX;D6p3RY4t\HO-OgCl$;No?+E1b,A8bs#FE1f-F(T?2D.R6#GB.,2E+NQ&Ch[cu
+DbUtA0>u4CLqAm$:.?S;H-Uk935"W:d$i^-X8rRATDllDej\I/6>_8:eX;D6nB^6-OgDX67sa!
DId9hE+NotASuU2%13OO:-pQUF(f-$C`me/EbTK7F!,R<@<<W'Eaa$#04K'<Ch+Y^@8pf?+D,>(
ATJ:f%15is/j)7FIXZ_gHQXq^BHV^4$;*uY<CokP<(0o3DJ=>Y3Zp+!3Zp*c$6p[7AT;j(DI[6#
De:,.@<?(*+Cf>,D..<mF!,R<@<<W)ASu("@<?'':ddb^$6p[%F)uJ@ATJu1@<?(*+D#e/F!+n3
AKYo/+EV:.+EqaECM@[!+E1b2BFP;bF^])pFCf\>+FYPaB6%p5E.0$\%16r\CLq3tA7^!.INs;S
Ec6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQW5%13OO
8k_TG76s[J79F\MBm;d%+>=p!+>=63,9V#<D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IsD'1;\
@<Hf($?Bu+.P>1>C^g_lD'1;\A9MYr$?Bu+.P>[]%17,m+=]!XA9\OjEbupK/oPlS%17,m+=]![
DeBLdEbupK/p)#A%17,m+=]![De9FcEbupK/o5HB%17,m+=]![DfcEqEbupK/no36%17,m+=]!X
ChF1aEbupK/n/X0%17,m+=]!VH4:31%15is/j;IJIXZ_T$4R>;67tA_IXZ`p+F>4`@UX@$I16NU
9L;`N9LMiK=EeIs4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G4-
DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3DBO%7AKZ28EbfB,B-;/%FD)*j
F(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>+FYPaB6%p5E.0$\%16r\CLq3tA7^!.INs;S
Ec6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQWqDIdR%
@ps0_$7QDk%15^$6VKp7:/jYaGA1qX3Zp+!3Zp*c$?B]p+ED%1Dg#\7CghEsGV=/MGT_*>D/^V0
Bl%@%%16WWC`k2[@<Hf($=m^a+=]!Q@VcJ\A7]R".P>7TBakD[AS`J=/oYk@$=m^a+=]!XA9\Oj
A7]R".P>X^F:ARfAS`J=/o5H=%16WWC`k2[FDkXu$=m^a+=]![De9FcA7]R".P>OUC^g_^AS`J=
/o5HJ%16WWC`k2[Bl7Gj$=m^a+=]!XChF1aA7]R".P>1HB+52YAS`J=/n]J>$=m^a+=]!VH736F
F*T2D$7QDk:-pQs5(7s0ILQVn$7I\Q3Zp+*-RT?1BkAt?+<VdL8OccQ:*:ZiD_;J++<X9M6VKp7
:/jYa4ZX]X9LDKB5u(BJ=EeIs%144#8k_QO8PDNO79D]6+A,<o<CokP<(0o5Bl5%9%16Z_F(K&t
/g*_T<DH+f+CoCC%144#8k_TG76s[J79D]6+A,<p9LV6B<(0o3DJ=>)$6UH`9L;`N9LMiK=?S\f
8k_QO8PDNO79F\MBm:a0$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-V@'"9LV6B<(0nB8k_QO8PDNO
79C[R@rc:&FE8RBDfd+CATT:/$>"*c/e&.:%13OO:-pQq4FVa.INWt[/o4s<AU#>G%13OO:-pQU
B6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0rA0>,o@;BFrBln0&%15^$<(U%_78u]X4ZX]>
+?CW!%14C(CghEsGT^F;FD,T5/0K%KFDPM>+E)4@Bl@ltC`mk@C`m/(A0>PoF(c!i>[_bsBQ%p<
INs;MF`_;8Edf6^+=18t%14Cd>R_#d>]XajCht5!F`M;FINs;UC3+N<CjmUXI3;d"%14CdAoDU0
DJsW.F(or3+C'#"G]\%LHW*I$/M]1A3ZrkrIWK121,Ut=,CY%`>]+J#D..7%BmO>"$@N?j>]a\%
Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&.1HUn$;No?+D5_5F`8IAG%G];Bk;K2BOtU_
ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$=%X`@ruF'
DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:%14Nn$4R>;67sBnEc6)>+EDC=F<G[:GT\R\
@rH1+D/OD;D..]4DImBi+CSeqF`VY=DJ'Cc8k_`Q:eXG[<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!
Blmp,@<?''-tdR>Ch[u?+DbJ.AU#>0Bl%?5+=LlCE,961.3N87DImisFCfM9,%kq7F`8N6$7-g4
@;TRd+Eh=:F(oQ1F!,C5+EV:2F!,(/Ch4`$DfQt3@:Nsn8l%htB6%p5E$/k:+E2@>@qB_&ATKI5
$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?LAS5^pHXq&)F_t]-FF=T*%16?S
DK'`?H[[2gB6%p5E.0$\FD5i5AM/(9G^U#.>]!nbATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%13OO
>]++sE+*Bj%14C(@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5
DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"DJ+')HX('!CisT4F(K<=HS]5MI16N0>]XIu
Ch7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0>]b1.@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J
,CXQSBk;K@FCf]F%13OO>]++sE+*Bj%14CdDf0,rDesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIUd;,
AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]F
ARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4
%13OO:-pQUGAhM4+Dbb6+EDC=F<G[:GRY!P9NP"f6qg0O<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!
Blmp,@<?''.!KTMA8Gt%.3NG8FCf\>Anc'm/g(T1%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m
/p(ZLI16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%I[GApu'AIStU$7-g)Df'?"DIdf2AoD]4@:X+q
F*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&
FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc
%14CdFE_Y5DesQ5D@Hp^$7/qqDIm<rCisT4%16?SDK'`?H[[2gFCf]7@;TS),CX-@A7[B8AU&V4
$4R>IDIn$2@:s-\$=%O`@;^1*D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;
HX(Z(G]\%LHTaE<+A$H]AU&V4$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$4R>;
67sBt@;0U%C2[X!Blmp,@<?''9OUn3=<MR'ARTFbCh4%_8l%iKBlmp,@<?'WEb/Zr@VfU=3Zp+!
3Zp*c$7-g0De*ZuFCfK$FCcS2@<?(*+E2@4@;TIiAM,)7$7-f($7-foBPDN1Anc'm+DGm>@3B5t
B4u+,+CfP8FDl#1H=^V0G%G]8Bl@l3De:,6BOr<*Eb/Zr@VfTb$7-g3@<?($Bjkg#B4YslEaa'$
A0>?,+E1b,A8bs*F!*&U+E)4@Bl@l3GA(Q*+E2@>A9DBrDJ(($$7-fIFCf\>Dfp/@F`]5YE+*Wp
Ddso'BkM*qBkM+$Bl7Q+BlbD8G%G]7Bk1acDBNA*A.8kl+EV:.+EMX5DId0rA0>T(A7^!.BlbD;
ARo@aBl7Km/g(T1%16?NDe!p,ASuU"CghC+>;7mPFBs6%Ecc#*Ch8#($4R>IF`V,5@:O(]B4Y:`
@;]Us@ps=f?$g3qDf''-Ed<'B$=%^pAT2'fCLLje>A.SVA8,poF'X-)F_kl5@:s/"%16?_F(K<!
@r#LcAUA61De*F"DLDs$>]k+!E+*6l@:s.u@;U(,H#7"A@;U(&@<?12%16?_F(K<!@r#LcAUA-'
G\(u.GV!Q@Cis0.AU&V4$4R=g+E2@>G%kJuF!+_0AU&<<F^fE%EbTK7%16?_F(K<!@r#LcAUA$'
G\hJH11bkV%13OO,p6i@@;omo@ric,DI[L*F(oQ1Et&I]F`V,5@:O(]B4ZF&Ea`p#Bk)B=F*1r(
BkMR/ALqn:A7]7ZE.&0&>\A(cE+irqF)YQ0BR>(Y055<6Cisf5Df0VLI=2P3%14C(F`V+:D/!L#
Dfg8DAKY]!+CTG%Bl%3eCh4%_>Y/NsBl%?LG\M5@F*hb<@rcL0H#R=IF*)\UHX(]7AT2'fCLLje
HYmJ,Ec6&FE+OHGH[Q>1>\RefF_r6T>\RepATVL.+>I,5Bj>@aCis0.AU#=P>\7\50H_YaBkAK,
A7fppGRY!&+C'&1AT2'fCLLje>BP%"3*glFDK'`?ASu"+%16?OCia/1,p6o6+Dc1/FCf\>DfQtF
ASbdsAU"Xk+<Xp3F(K<!@r#LcAUA$-DKKr=ARg,t$6UHrBkDU$FCf\+$6UH6+C'&1AT2'fCLLje
H['@KG][t7/9l;TBk)'lAUP!p+<Xp$BakCl+C&GgAmoguFCoH/FCo)mFEMV8F*gViE,]N/B0C?J
GV+#KG]YK8@ps1b4\]@,@q\PSG@bf)@<6".%144#,p75>E,8rmAKXEA;GU:[+EqOABHVG8Bk)'l
AKYQ,Ec3(1BOPpi@ru:&+:SZ#+=/.EAfuA;FWbR5ARlp*BPDN1@q]:k@:OCjEZcqVFD,5.E,oN2
ASu!h+E(j$$6UH;+EV:2F!,O<DJ*cs+Cf(nEa`I"ATAo-DBO%7AKYr4ARTFbCh4`$DfT?!F!,UH
AKYo'+F%I6@<?(*/0JbO@;K@oARl5W+<Vt8DIn$%Df'?"DIe*!AT`$3I="C_;GU:[I39XT%144#
,p6]+DBO"3F<GLDBOu3,D/X<1F)YPtAKYT'DKKqBBkAK0BOuH:Eb-A%G%#*$@:F%a%144#,p5c%
Eaa''ATAo0Bkq9&;f?f!@q?cMDe*E%:i^IsF(JoD%144#,p6lCFDs8o04Ja9B6,\6A8bpg/n8g:
06DJY@VfsqEa`p#GqUp,0etC93A5GlF`Lu'/Rr^0AM%kAD_>^FD/9Xg+<Vt8F(KH1Df0K*Df0ZD
7WN'O9lFofI16N++=196ATVd-DJs-*DKL5(Dfp)1AKX?YA7Zl[Ec6@8$=%1W%13OO,p6)sA7]@e
DIjr,@:EeaGA1T0BHUo*EZf14F*)Ib+E)@8ATE!/F(HmFFD,5.ASuX-ATD4$AKYr#@r#LcAKZ22
Cht5(@<HX&%14C(D..I#ATDi7FDi:5G][M7A0>>mH#IS2+EV:.+DbV$F<GF/EbB*(/e&.mD..3k
@<?<sFED)7>X<HuAS5^p6uQRXD.RU,HR0+.+<Xp0ASu('@rH4$@;]V&>X3+>F*),E%144#+<Z#9
F(KH0ASu.&BR=!#@:EeaGA1T0BRP4aASljD%17MgD..3k@<?F0BOu2n$=%^pAT2'fCLLjeHY%);
D.R`rFCfk0$4R=g+EV=1BQS')F*&O7Df'?"DIal%DfQt:BleA=F)YPtBl7Pm$=%OjDg#i*ARfXq
D..<mHX(Z,B4uC'BleBEHR0+.+<Xp1ATVa"DJ+')HX(9,ASlL"E.*'eE--M5F(KH0ASu.&BR=!'
@<-F)BlJKI0Q;,^I16Mm$7-g(F_PZ&+CoD#F_t]-F<G:8A7]up$=%^pAT2'fCLLjeHYm2,ASG\"
I16Mm$7-g)Des?4Et&I]F`V,5@:O(]B4ZF"Des?4I16NgA7]@eDIm<rCi=?@F(eumARfXpDfU8Q
;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/Df0Z;DepP;FE2M6FEMV8F!(o!>\%DXBl7KlDes?4HY[2<
G@PQ-DfU8QEbAj0HS@',1Ft441-$m>/i>G5%14C(C*7)4E,95uBlkJ+EbBN3ASuU2+F##S+Di6=
+E\fM%16?NAS,XoARfXpDfU28@<>pfDes?4I=$!I@XWSW/ho.50J5+@/2/\61OT]>,p6qFDKTf*
ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJC^g_VA7]@eDIm<rCi=?@A7]7o@rH1%Ed`:TB4?:90J5%5
/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdM8(F(K6!Des?4I=$!I@XWSW/het10J5%5/2/\90msK<
>\%DXBl7KlDes?4HY.)4@<?!tCi=?BHZEb.I=!Y#0JG%3/het10J5=>I16N0+DN$8De!3l+CT>4
BkM=#ASuU2%16?NAS,XoARfXpDfU27BOPpkDes?4I=$!I@XWSW/i,450J57;/2/\1149T=>\%DX
Bl7KlDes?4HZO:LBl7QnDes?4I=$!I@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HXgu2
D.RU,@rH1%Ed`:TB4?:90J54@/2/\42(UF60JRtb$7-g6EbTB)FD5o0+CSf(ATD7$+CT.u+Cf>-
C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4HZ+">ATD:!Ci=?BHZEb.I=!Y#2)[!>/i,@90J5%6I39XT
%16?NAS,XoARfXpDfU2CFD,6+@rH1%Ed`:47m_WN0J"n/1,Uq;%14C(B5DKq@;I&pF)u&.DJ`s&
FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0Ci=?BHZEb.I=!Y#3A`9@/ho780J5(<I16N0+E2@8D/"*+
G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBnEt&I]A7]@eDIm<rCi=?@Ap&!$@rH1%Ed`:TB4?:90J5%5
/2/\10J"n10JInt+<VdL%13OO>]k+!E+*6l@:s.uAmoReH$44;I16Ng6tKtEDIla[DfTr#ATD6a
@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH%16?.AS,XoAQEA_@UX@mD+/>cBl\-0D.RU,HUqj`BP_Bq
BQRs+B75,-ATD6gFD5T?HXgu2D..<m@q]:kF$3c5>^K_(I16N0+@0OK+=A^PDf0Z<BmO>R>]Xaj
ChtIAAoD]4D/XH++Cf(nEa`I"ATDi7E+O&4Ch[cu%13OO,p7/8DIdZq+D58'ATD4$ARlp)H#@_4
GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>D.Rbt$7-g'Eb-A*Bm=3"+DG^9B4YslEaa'$A0>B#A7Zlm
F`\a:AS,XoBln'-DK?q;@<it)$7-g(AKZ&*F<G[D+CT/5+Eh10Bk/?.AU&;>AoD^,@<?U*DJ()%
Df'?"DIa1`>]k+!E+*6l@:s.uAo_<sARp2u$=%I[G@bZ8Bl\-0D.RU,HW+TdA7];"H[U6h%16?X
ATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,Des?4HY[2<G@PQ-DfU8Q>]aP%FCJj/HQt7n
I=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4+B*3$EarZ'6Z6LH+Ad)s%14CdDIn$%Df'?"DIe*!94`Bm
DfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&sIFCA-o
E+N!eCOKDA?$fguAU&<,Des?4HXpQ,@:O4lDfU8QHQt7nI=2P3-!Y>!G@PQ.D..<mHX&sM@od#S
<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QLARebLCfG=g
I9SF3H[?tlI=34I$=%I[G@PQ.D..<mHX&mGF(J*GDejc*0jT-2FCf]=@rH1%EdM8(F(K6!Des?4
I=$;c0n"Iu%16?XATqX&D/E^!A:%QNCi<a(<,ZQ#>;9E1>]aP%FCT6*DfU2:Ci<a(@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!6YKnK<,ZQ#>;9E1>]aP%FCT6*DfU27BOPpkDes?4I=#4@AU&<+
Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!;fm%oDJ)peCOKDA?$fguAU&<,Des?4HZO:LBl7QnDes?4
I=$;c0n"Iu%16?XATqX&D/E^!A:%QKDf'?&DKJirCOKDA?$fguAU&<,Des?4HXgu2D.RU,@rH1%
Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s@rH4$@;]V&>YfHTATCagCOKDA?$fguAU&<,Des?4HZ+">
ATD:!Ci=?BH[?tlI=6Md%16?XATqX&D/E^!A:%QICh7X/<,ZQ#>;9E1>]aP%FCT6*DfU25Ch7X/
@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3-!Y>!G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$fguAU&<,
Des?4HY.D<@q0FnDfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XijR@ruF'DH(OiI9SF3H[?tlI=2P3
>]++s@rH4$@;]V&>Z,-GBl@l`@<--pE`?smI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>X`[RDfSfq
COKDA?$fguAU&<+Ap\kL0n"Iu%16?XATqX&D/E^!A:%QVDfT]'CfG=gI9SF3H[?tlI=2P3%14C(
8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;Df'?"DIdf2AoD]4E,Tf>+E2@>@qB_&Bl7Q+E+*WpDdso&
ASu("@<?'k+DbJ.AU"Xk>]++sASu[*Ec5i4ASuU:8l%iFEc6)>87c4?ATE3GI=$AO$=%I[G@bZ8
Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2Ed`:_H[Q>1%16?_F(K<!@r#LcAUA#tDI[s*A9*)-$=%OY
B4Z.+H#.&=AmoReH$p,/%14C(A79Rk+D"tkBHV8&B4VMZ>]OFpDfg>2ASlC"HX(Z2A79b3I16Mm
$=%:WG\(u.GRY!&+C'&1AT2'fCLLje>B=@tE+*BjF(or34_A,=F(HmF,p7/8B4W3,BmO>5A7]@e
DIm?$@X0)@ATVL.%144#+<VdL+<VdL+<VdLF`(o'De*EBAmoLsALnrH+<VdQ+E_R9@rGmh+C]A&
@;Bp,GA(Q*+E_a:A0?)1FD)eAATVL.%144#+<VdL+<VdL+<VdLG\(u.G[5Z0H#R>8Eb/j2%16?O
Cia.s$6UHrF`V,5@:O(]B4Y:iDJ<U!A7[oGEckr!HY@\DATDg&Apk*q>\7[Z$4R>IBR+Q.EcYf6
F`;\:Eb/ZpCh[d&F$4VcF_**5$6UH6+<VdL+<VdL+C]8-CMdL#CNDX\EckqE%144#+<VdL+<VdL
+<YW6Amoh(BQ%oSH[RFS$6UH6+<VdL+<VdL+E1k'FD5i5ANbBg/.Dq/+<VdL+<VdL+<Ve:Des?4
Ch[d&F$4VcF_**5$6UH6+<VdL+<VdL+E_^@@rH1%E]mlJF_**5$6UH6+<VdL+<VdL+Dbb0CL_:!
DfS!X@:s.hFC?^0$6UH6+<VdL+<VdL+E1k'@W-9tATBq\0H`%l0R\?Y$=%X`FDPN+B67g6>]=+l
Bl7HmDKL;R0Q;,^%16?]ATVa"DJ+')HX(MuEcZ#1E.*'kE-*4ACiseA12q=XD/!m1F!*2VFF=T*
>]XIuCh7KsFD-#+ASl"!B4YsjH#n(JATVEqI=!b]D1*NL,p7/IAThX&F<GLFATDC*Cht51Bl7L'
%16?]ATVF#F`);4EdMk=@r?F+A7]_%BRP4]I16Mm$7-g8ATMF)+DbJ.AU#>3DId='+EVNEF`V+:
FD,]+AKYK$CisT4F!*%WA7]@]F_l.BBlbD=GAdot,p7DFBk(g!Eb0<7Cij_@Bl5&0Dfg%CDe:,9
@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3lF(8WtAIStm+AP^3762Q"A867.F<G:0+DG_(AU#>8@;TRs
+EDUB+EVO7ATVTsEZbeu,p6f?Df%NXBQS?83\N.1GBYZU@<?(*/Rr^9D09`1FEoKWEb@%KBk;L1
DfBE#/oYKC5A!&8-?MC*2`!<#$=%^pAT2'fCLLjeHYmnAFD56'Cjca">]!nbART[sATW$*EX`@\
Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7HmG^U#.+<Z#9BkBVPGAgu0CisT4%144#+<VdL>X3=@F*)><
ARfXpAmoLsAISth+<Xp#Cia.s$6UH6+<Ve35]UFWFDl&.@rH1*Eckq&$6UH6>\7[Z$6UH6>]XIu
Ch7KsFD-#+@rH1+D/OE+E,p);AUSnZE--L;$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h2/mYc
%144#+=/.?BOPdkAKWcOFDi:4ATMR+ARlp$F_tT!EZf:4+DG_(AU#>-DesQ5DK?6o+<Ve3@V'1d
DL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='DIIBnI9d9h+<Ve3D..I#@W-@%HX'9RCLpLb
E+O'"@<6!bBl7HmG]$r,AUPj6$6UH6+<VdL+<VdL+F@?f@;BFSE,]B/@psFi>\S(dAU&*$D.S,A
%144#+C'#%Ble6%B4Z.+H#.&=E,8rsDLDs$+<Ve3F(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*
+<Ve3F(KH0ASu.&BR=!'@<-F)BlJKI0Q;+VE,9Z<+>>E(E--L;$6UH6>]OCl@<`4g+<Ve3Ch7]n
Blmp'>X3"6G\M82D1*]>$6UI<>\.e`HYmnAFD56'Cib#0BkBVNATMs3DIm<rCg:mrARfXpF_u#$
AScF!>[qS]@<-<qB4Y=[BmgEt>]!nbART\!FD,6+%13OO>]!nbASH$mAU"Xk%14Nn$;No?5!FFE
IXZ$MA8PajAPPQE+=_,EA8PajAKYJ7/Kf+EEbTK7+DkP&Bl7Q+-6Qf:A7Zm#@;]duF_kK.Bl@lM
+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+E_d?Ch\!*
ATJu+DfQt;@;BRpB-;8*EbTK7F!,(8Df$U+$;No?+D5_5F`;CE@;]TuF*22=ATKIH+A$Yt@;L"'
+Cf>-FCAm$F!+t2A7ZlqDfQt/DII@,H>.80+:SZQ67sBu@;TQuEb/ioEb0,uATJu.DBMOoGAhM4
F"SRE$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;:-pQU+<Y<.FCB!%FE8QI+<VdL
B4Z1++CT)&+EV=7ATMs%D/aP*$;No?+<VeD@;BFbF_u(?+<VdL+CoV3E-!.?@VTIaFE8RCDBNn,
FD)e=D]j"AF<G+:D/^V.Bl[cpFDl2F%15is/g)8ZD..3kB6,1<+<VdL+<YN0CLnW$Ec6)>+CT.u
+EM[>FCcS9@rc:&FE7lu:-pQU+<YQ1D.R3cFE8QI+<VdL@r,RpF(o6#ATJu3@;TRs+DG^98g%V^
A7Z2W:-pQU+<YWGFCB!%FE8QI+<VdLE-68D+CT)&+EV=7ATMs%D/aP=/Kf+GAKWC6ATV?sCij_I
%15is/g)8ZGB@q<G]Y&N+<VdL+<YlHEb$;$DIal3ATMr9FCf]=%15is/g)8ZGB.5,Ci<ckCi^^A
+<Y6?FE1f"FE8R;Ci<ckC`mV(D.Rc2Ao_g,+A*bdDe*Dg$;No?%15is/g*o-FCfMS%15is/g)8Z
7<3EeEZf41F)tc&ATJtBC2[X"@;BEsEa`iuAKW]b0J,">3@PCE%16T`@r,RpF!)i=C2[X"@;BF%
%16T`Bl8!'Ec`EH-Xgb.A1%fn%15is/h1CCE+NotASuU2+F#Ii+E(_(ARfh'+EqOABHUhsAnc-s
FD5Z2+Co&&ASu$iDI[BlEt&Hc$;No?+EV%)F!+(N6m-#_D/^V=@rc:&F<GU8@WcC$A0>B#D/E^!
A9/1e6rcrX<'a#;3[Z%F68!U78l%i)I4#I2%15is/g+t=EbAr+FCf]=+Eqj7E$076D/aE6@<-W9
DJsZ8+DtV)AKYE!A0>]&DIjr7Bk2=!%16075u:NT:fg4V4ZXs:H7(d42[p*'$;No?+D#e:Eb0<5
Bl@l3FD,*)+Cf5!@<-E3F(96!FCSu,DdmHm@rr.e;bobS76sg73[Z+(F)PQ)ARTU,/4<K4:fK_N
%13OO:-pQUAU&07ATMp,Df-\>BOQ!*Eb/^&Bl%=$+D5_5F`;CE@;]TuF*22=ATJu+Ec5e;F(8X#
@q[!'@VTIaF<G+&FC>Uc;bon]:d$ie+D5_6-9`Or/g)>j+=ANa/1<]//ltq::fL.c=%Pe//14dP
-S/1l9M\#A9LUK[-XS5K+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2
F(oQ1+EV:*F<GXHDfTE1+EqaEA9/l-DBO%7AKZ&(Eaa'"BHV5&C1Ums+DG^98l%ha$<'_s<E)+B
-Za3FF`\`M/gi#aCgSP;/5o><:I@EA74]f6?Qa&81aaXn>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc
9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7-uNI1ALqq7G]YAWFCAWpATJu.DBO"1
Eaa'"BHV5&C1Ums%16$0:fUIo79EMP3[Z%hF`\`M/g)>j-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K
/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5
Bl@l3FD,*)+EMa@FCSuqF!,RC+Du==@V'RkA0>r'Eaa'"BHV,0@ps1b%16$0;ccOi6V'@$-Y%()
F`MM6DKI"":L@I$:IK,1C*tQ#<D?:h5t;@k%15is/h1FMA7T7jASu$iDKKq/$4R=          ~>
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
6rm#M+A>("<)?Ro+AP3s770a7;c=fJF_PZ&C2[WmDf'H6ATMp(A0>?(Bl%<pDe*s.DesK)Df'H6
ATMp(A0>AqCM7-tBOkt!+CoG4ATT&*F_u)2ART+\EZf"2Ddmc1C2[X!Blmp,@<?']9gg+=De*Zu
FCfK$FCefm@<6*m@<?('Eblk5De*d(+DQ(;+DkP&ARoq#E$0(0+E2@4AncL#F_u)2@<6*)E-67F
E-688F!,O8FD>`)Ch\!&Eaa'$+E_X6@<?'qDe*BmF*)G:@Wcd,Df-pO/1<VC4"akp+=A:@F_PZ&
?YXLiCh\!&Eaa'$+C]J-Ch-mlF`__:EcWTW/1<VC4"akp+=A:@F_PZ&C2[W*C2[W*C2[X!Blmp,
@<?''C2[X"@;BF%.4cl00I/>$/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP
84c`Z:Jt=<8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhmM:et"h?YXLiCh\!&Eaa'$+B2-):L?^i6psg<
?Ys<r<)5nX?V4*^?Ys<rBPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*Ch\!&Eaa'$?Z1+%ATqL'
AU#>4De*fqEc#k?C2[X%Ec5Q(Ch4`+@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dk
ATMs.De*p-F`Lu'+DlC=De*g-De<^"ALAoX-p07-1GC(00JYF<1b^^<1cRBI1c[6L2)ud70JYF<
1b^^<1cR9I2D?pD2DcO30JYF<1,:d@2Dd<O2*!BL2)?@10JYF<1G^^;1c.3H3&!?O1H?R50JYF<
1b^^<1H%$F2)I-J2E;m80JYF<1GUpB3B8fQ3&36H2)QL30JYF<1,(R<1c7!H1cI<Q2E2g70JYF<
1,(R<1c7!H1cI<Q2E2g70JYF<1,(R<1c7!H1cI<Q2E2g70JYF<1,(R<1c7!H2)-gG0esk,0JYF<
1,(R<1c7!H1cR9H1,g=20JYF<1b^^<1cR<N3&*BI2Du[50JYF<1b^^<1cR3M3&E<I1a"P-1,CU?
0f^jC2)R*F3&EWQ2]sk01,CU?0f^jC2E3QM3&ETP2'=Y.1,CU@0Jb=<0fM'G0f(R=2BXb/1,CU@
0Jb=;1Gh$J0K1dA2'=Y.1,CU?1GCF<2)@-F3ANQL2]sk01,CU@0Jb=;1GpmG0f:jD2]sk01,CX?
1,:I>0fCdH2`<HP2]sk01,CX?1,:I>0fCdH3&*-C3$9t11,CUB1,(=:3ANHJ3&rZI1a"P-1,CU>
1,ggC0fM*O1,:^G+>PW+1GCX>1G1IA2`WZQ0f_6R+>PW+1GCU=2_I!E1bpgD3ANNL+>PW+1GCX>
1G1IB0ebF=1,(OE+>PW+1GCX>1G1I>2*!BM1H@9M+>PW+1GCR>3%d$B2_m6I3AWEG+>PW+1GLX?
1+kF=1,1I>0K:sK+>PW+1b^X<1+kIC2)@*I3AiKK+>PW+1GCX>1G1LD2D?sJ0K:pM+>PW+1GCX>
1G1LD1G^pC1Gh!H+>PW+1GCR>2_I!F2E3QS0fCmF+>PW+1GCU@0J51=3A<EH3B&`S+>PW+1GCX>
1G1IA1c76K1,(RB+>PW+1GCU?3%d3O0fM'I1,UpH+>PW+1b^X<1G1O>2E<`N2DI$G+>PW+1b^X<
1G1O>2E<`N2DI$G+>PW+1b^X<1G1O>2E<`N2DI$G+>PW+1b^X<1G1O>2E<`P2`<TR+>PW+1b^X<
1G1O>2E<`N2`WfO+>PW+1GCX>1G1LD1cIBK3&*<L+>PW+1GCX>1G1LD0f_3M0K(a11,(I>0JbFD
/i5IB0KD-Q2_[361,(I>0JbFD/i5IG2)@3K3&NQ91,(I>0JkI>/i5=<2D?gD0K(p61,(I>0JkI>
/i,:?2`39J1GC[/1,(I>0JbL=/i5FA2DI3I3&3E81,(I>0JkI>/i,:@0fLgE2DI-51,(I?0JP7;
/i>RG1GLaG0f:s61,(I?0JP7;/i>RG1GLdA2`EN81,(I>0K([?/i,LC2)@3P0JPC,1,(I>0JYCB
/i>@B3B&]K2)cX50JYF<1b^^<1H.-E0JbF?3Ar!80JYF<1GCa?2D[0F1,V'I2_uR30JYF<1b^^<
1c$j@3B&lP0f:(/0JYF<1b^^<1G^mK0fLmK1c?I30JYF<1b^^<1G^pJ0fUpI2DH=00JYF=1,:U;
2)-j@0JkIC2Du[50JYI=0eb@82E!QS1H%6O2Dlp7-p07-1*eV/1,CU@1,U[@1-%-H2Dd<P2BXb/
1,CU@1,U[@1,^sD1GL^G2BXb/1,CX?1,:I>0f(aE1,UmG0d&5*1,CU@1,U[@2)$gH0fV!D1+=b&
4>J$9,Vh&/1GCU>3A*-F2)mBH3&<Q;1,(I>0JbI@/i5:B3AiTQ1cI?91,(I>0etL>/i>F>2`*<N
2)mK:1,(I>0JbL=/i5FB1,1^D3Arf=1,(I>0JbFD/i5CB3&<9K1H?R50JYF<1b^^<1cREL1-%'I
3&Da50JYF=1,:U;2)?sG1c%-L3&Vm70JYF<1bpp@2)$sE0f(^:/1<V7,VUYu-p07-0f:430JYF<
1,(R<1c7!H2)-dE2E;m80JYF<1,(R<1c7!H2).$L1Gp:10JYF<1GCX<2D[3H0JtO?2)ud70JYF=
1,:U;2).!E3&``M2`)X40JYF<1b^[;2Dd-F2`3<L2)l^60JYF<1,:X<2)@!G1c7-E3&Vm70JYF<
1,:d@2Dm<H1GCRC3$9t11,CU@0Jb==2E3]S0fLmI0d&5*1,CX?1,:I>1c6sA1cI9N2]sk01,CU?
0JkC?1bpjE2D@-M2]sk01,CX?1,^aA3&NEI2)R6I3?U(21,CU>0JtI>2).$H2`NcQ0d&5*1,CU>
0JtI>2).$H3&*3I1a"P-1,CU>0JtI>2).$H3&!6J2]sk01,CX?1,^aA3AE6F3AiZS2BXb/1,L[>
0Jb==0fD$O1,V$G2'=Y.1,L[>0Jb==0fD$O1-%-N0d&5*1,CU@1,U[B2D@'F1c[BI2BXb/1,L[>
0Jb==2`<HH2)d6I3?U(21,CU@0JkC<3A<BL3&3KR1E\G,1,L[>0JY7;3B/uP1,(OD1*A>+1,CU@
1,U[A2)6sJ1,^pK1*A>+1,CU@1,U[A2)@'J0etUH3$9t11,CX?1,:I>1cI?I1,([B2'=Y.1,CU@
0Jb=;2)@0G1GCgD2'=Y.1,CX?1,^aA3&NEI2)R6I3?U(21,L[>0Jb==0fD$O0K2!N0d&5*1,L[>
0Jb==0fD$O0K2!N0d&5*1,L[>0Jb==0fD$O0K2!N0d&5*1,CX?1,^aA3AE6F3AiZS2CU1*4>838
-p014/1<V7.4cl00I\P80E                                                    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
