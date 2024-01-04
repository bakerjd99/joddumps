NB. sha256:c54780e1dad8c7d80f7a6fe2af1961a8e012ae33c8c169f493fd07cd10145e31
NB. JOD dictionary dump: 04 Jan 2024 12:50:11
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
0f:m40f:(0+>G_r1*A;/1H.<:1,'h++>G`53&)O21E\Fq3&``N+>Gbs1*A;,0fC./1a"Or0f1jE
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
DCosKA8ba]%13OO0eOSV4C9mREB/2&H#n'`EHO'Z2DTSm@r,j72eR;@5%#L.ATo87F_t]1Bk&8r
@<>q"H#R>9+CT.u+CQC&Df0`0EcYr5DBO(DBl%L*Gp$L)/mof1Eb-A&ASH$p+:SZ#+<Y*'A7]9o
Bl5%c+?;&4+=K!!1,N`SDD3gp+EqB>DJs_ABOQ'q%144#+CHj:DKKH&ATBLYBl8$(B4Z*=055<G
AS5Rp1bWHWDdda%DJ(^XAo)BoFD5W*1bWHWDdda%DJ([^?m'Z,ASu(&ATAo8BOu3q+CT;%%144#
+Cf(nDJ*O%+EVNE@VK^gEd8dADKKH1DII@&+DGp?Bl.ft@ruc78l%i-+<X6'G%De)CiX)qA9f;2
BlkJ++Cf>-G%G]8Bl@l3E,oN"Ble!,DBNM2Ec5tN%144#+B3#c+EM+7Bjkg#A9Da.+D,P4D..N/
F`V\6Ci"A>GAhM;F!,+6Bl7Q+AoD^6@<,m$@Wcc88K_GY+Cf>-@qB[uARlol@W-C2+CfG'@<?4$
B+51j+<Y3;D/^V=@rc:&FE8RHBOQ!*GA1l0+Du+>+Dbt)A0>T(+E)(,ATAnc+Eh=:F(oQ1F"SS:
Bl%T.BOQ'q+EVNEA7]puF(HJ8Df'&.F(8lpD.O.`+<VeKD]iP.E+LX2$4R=t/g+Oa?TDn:1N-k]
EHQ"T3H'.RD/2!cAns)CA27LU?m%gTDKBN&ATAo%A7TClB-:V*BOPsq+EM7-ARf.h+D,>(AKZ)5
+C]&&@<-W9@UWb^F`;CS+B*!!+Du==@V'RkA0>80/no'4?m'&qCh7Z1@<,p%@rc-hFCetl$6UH6
@X0))+C\bhCNXSK+B3#cGp%0ADfol,+Dtb6ATAo&AKYDtFCfK(A0>?,+A,Et+CSnkBl5&%DIal!
ASH$p+C\bhCNXT;+DG_8AS6$tFEo!CF!+t5Bln'!@;IP*$6UH6<+ohcF(o/r@psC#Anc'm+EqaH
Ch+YtAKZ&.D/a<&+EV1>F<G10Ch4`5Bln#2;b02+1,Us4BOPsqATKCFBeEsL%144#+F\cgILQW,
+<WKrC1CpcF(f-+/p)>[%144#+AP6U+Cf>#AKW]d+E)-?@W$!)FCfN8F!,R<AKYGj@r$4+F!+n(
@;0V#F<G7*F(f-+%144#+>Get@W$!)-S?bU$6UH6IXZ`p%13OO1G0eX4C:$nBJVS_3GWGG20WhH
E,%3`@X<*8DJ_@?5%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHV5&C1Ums+D,%lBl%L*Gp%3B@<<W9
Bl%T.F*)>@AKYD(;b02+1,Us4BOPsq+EqL1DBNn@FED57B+51j+<YT3C1UmsF"SS,+CT+0FD,B+
CM@[!+CT/+FD,6++E)4@Bl@l3@rGmh+CHo_?m'Q)@<<W9Dfol,+Dk[uDBO"BDfTD3@3B5lF(c\7
D@Hpq+<Y'2F`_"6DfQtBATMr9@3B5lF(c\7DBN>"ATV;h$6UH6IXZ`p%144#+<XEG/g,@VEb$;,
F!,FEF<G"0A0>;'BOPsq+DGm>F*)>@ARlotDBN@1Eb0<'Ecu#)+EM@;F=n"0+<VdL0H`)/+E2IF
+=DAOEb$O,$6UH6+AP6U+D>2)BHV#1+Cf>,E+*cuA0>u4+Eh10F_)\9ATVs,AThWq+>"^IEcQ)=
+DGF1D..NrBHUnqBl%iC%144#+<W?\0fL4fATT%BGAhM4-OgD*+<Z,^IXV_5%14pE+CI<=@W-@*
1NYBqA9<#SBlmoECMS3@BeV7uG$dF@+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&
Bl7Q+GA1r*Dg-7FAnc'mF!,C=+CoM,G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=
GA(Q*+BD<6+DGm>De<T6+B3#cEb-V>+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:
FCfJ?ARm5!$6UH6A9)C-ATJu'F`\a6An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6
+EM4)Eb0;7Ch[Zr3XlE=+<Z,^IXV_5+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9
A1q\ADfTB0/no'4-OgD*+<Z,^IXV_5+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJr
ARfKuDf-\ABl7I"GB4mJH#n(=D0$hDBOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0S
Df'&=F(f!&AM7V.BJ4+EDfTB0/no'4?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0s
A0>E'Bm+'/%144#+EqL1DBMtV:*=7l+E(k(/e&-s$8jFY?p%dP0m#BcDe=61H#RnK@:j=sGAhI[
3&GSn?Tqj?<+U,m+CJr&A8Gt%ATD4$ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBi
ARmD&$4R>#/g+Oa?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#
+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,
AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>$/g)8Z?p%dSCM%="@W6L"2JHrJH=qPD
0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bBD]iG&De(J>A7f3lA7]gl
EbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO3%c<r+CI<=A2.V:Antp31jO%`CghF'@q[W:
@5V_BDdP\9+@C'bF(o/rEZee,Ci=N3DJ()"IP5(O@<3Q"+E1b2BHV87AS,Y$+E)-?D.-pM;]oLd
A0=Q[DKU1HF*VhKASlK@+B3#c+D>\1AKYMtEb/a&DfU+G@rH7.ASuU(Df-\9DBO%7ATME*F*VhK
ASlK2BlbD;ATMg%@ru9m+C]U=?t<tl?nMlq%16KIASu$1FDk].?!n*KBPDO0DfU,<De(U^%16`Z
DImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO
,9nEU0eP.41,^7,+Co&,+=MGJE%)5'%13OO,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(
+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@?uBP"A7-NtDg*=G@;BFq+CJ`!F(KG9-W3B45tOg;
7n"de0jl,4DIaktA8lU$F<Dqs;aX,J3&N'F0jl,4F!,")AmoguFE7lu+<VdLGA(Q*+CfG'@<?4$
B-;)'G9CF1@ruF'DIIR"ATKI5$4R=b.Nfj"+Dtb7+E1b0@;TRtATAo$83p0F6rcrX?m',kF!+q'
ASrW!A7T7^+EVNE?tsUjE+*d(F"V0AF'pUC<+ohcA7]@]F_l./$6UH6+DGm>0e=GhF`M@BDe<T(
GA2/4+>>Dj=(l/_+>G!I+B(fs/M]1A+D>2)BHV#1+E2@4AncL$A0>u4+EV:.+EMX5Ec`FBAftW,
D/]pk+<VdLF(96)E--.R+B3#c+D,P.Ci=N3DJ()6ATMs7+D,P4+CoV3E$043EbTK7+DG_8AS6$t
FEonV$4R=b+<VdL+<VdL@q]Xk@<6*mD/`ijC2[Wi+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6
C2[WnATf\?C3(a3$4R=b.Nfj"+Dtb7+DkOsEc3(?F^]*#Anbgs+CIc;=\_:k+Cf>#AKYYpF!+q'
ASrW!A7T7^+D,P4+A-cqH$!V<+Du+>AR]RrCND*N:2b5c@W-1#+D,>(ATJ:f+<VdL@ps6t@V$['
FDl22A0><%+A,Et+DkOsEc6"AGA2/43XlE=+<VdL+<Vd9$6UH6+<VdL+<XEG/g,1G@:UKuDffQ"
Df9D6@;]TuF*)>@AISth+<VdL+<VdLBlJ?8@QcapEb/Zi+=D&FFCep"Degt>E-Z>1-OgD*+<VdL
+<VdL1a$a[F<DrKDffQ"Df9D=4%W7O:-r;rC2[Wi4)&YZDIO%^%144-+<XWsAKYr7F<G+.@ruF'
DIIR2+E1b2BHV#1+Du+A+DG^9FD,5.BOtU_ATAo'Df'?&DKKqBDe:+a:IGX!+<VdLA9Da.F"SS)
DfQt3G[YH.Ch4`2BOr;oC2[WnAThH(A8,OqBl@ltEd8d@@<3Q"+E1b2BK?S0+:SZ#+<VdL+<VdL
4$"a(De*BiFs(O<A0?#:Bl%i<%13OO+<VdL<+oue+E1b2BHVM-F!,@=F<GOCAThd+F`VAE+EM47
GA]#U%13OO+=\KV5p0WZB-:o+FE2;1F^nun+DG^9G%G]8Bl@l3-o!>./i#43+D>2)+C\nnDBNG-
EcP`$FCeu8+@.,\AS,@nCig*n+<VdLD.Rd0@:s-oG@>P8Bl7F!EcP`$FDQ4FF(KG9Ch7$cBl7Q+
FDi:00H`832BZs]F<DqYGAhM4-RW:EAmoCiF`M&7+=L/[7n>']%144#+<VdL+:SYe$6pc?+>GK&
/i#7+7V-%LF^]<9+>Po-+>PW+1E\)EE-WQm@;KauDf-[dA8-."Df.!5$4R=b.Nh>+3A*!B+ED%2
@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI+E(j73?^F<1a%!NF!+t+@;]^hA0>u-Bla^j+<VeI
AT;j,Eb/c(@3B&n@;]^h+EVNE?tsk&?m'Z,Bk(g!@rH4'F`_29+CQC)Ci<a(Bl7Q+G%G]8Bl@l3
DKTf*ATBC4$4R=b.Ni+e:eXGT8Q9(?G@>P8@WcO,ARlp+E$07@+>u&/+A$/fH#IgJDImBi+Dl%;
AKZ).@;[2G1a$=C@ruF'DIIR"ATJ:f+<VeFDBO4CF`JTs:IH=E@<?0*H#IgJ@<,p%A8c1"B-;86
D.Rg&Bl7Q+GB.V>B-AB,$4R=b.Ni,<F`_8;?m&lgC3=T>ARlp*D]iP'ARfKu@VK^gEd8d;Df'H%
FD52uCh\!:+>"^QBle?,A0>u-BlbD2DBNn=BlA#7G%G]8Bl@lA%13OO%14=),9S]n0J5+:+A-'[
F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L++?;&.1ad>eF`V+:De:+r
7nlfc-tm^EE-"&n05#-@Ch[?2DfTJD.3N5@EZeq<FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF!(o!
+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dADI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.1a$4E
A0>i3BlA#7G%G]8Bl@m1+E(j78hLP[+<Ve!:IH=HFDl22F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8
AS5RpF!,17+Co1rFD5Z2@<-W9@VK^gEd8d8C1_0rATM63+A*b:/hf*k$6UH6@ps6tEb/Zi+E)(,
ATAo)G][M7A7]9oBl8$(B4Z+)+C]J8+DGF18g$,H0JjnrEbTW,F!,%=FCf?#ARlotDKKH&ATDi7
FDi:0C1_0rATM5g$6UH6@rH4'Df0-(FE8RCCh.*t+A+#&+Ceht+Du*?Eb/Zi+Dbt6B4Z*+FD,6&
/g+,,BlbD?ATDj+Df-\+A7Ta(@q]F`CNCV?D]iG,F`_"B%144#+CJhuDdmcq+CT.u+CJ`!F(KH$
+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+De:,0AToeGCh+YtBl7@"Gp$X+FC?;+DBNJ(@ruF'
DIIR"ATKI5$4R=b+<X`O;GKeY7lhc7D]j1AB6%EkAKZ)5+EV:2F!,X;EcYr5DBNk0+A,Et+ED%7
ATT&?Dfp(C8l%htD..L-ATAo*Bl%?'@X1!D$4R=b+<VdL+<VeCDdd0!-YI".ATD3q05>E9-OgCl
$6UH6+<VdL+AP6U+C\bhCNXS=H#IhG+CfP7Eb0-1Cj@.DAS5^uFCfK(A0>Ds@ruF'DIIR"ATJu&
DIal2BQ\D>8g%Y_GA[is+<VdL+<VdL-nui`Bk(p$2'?gJ+=ANc+D,h<Blmo/C2dU'BHS[O@:Wne
DK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$6UH6+<VdL+:SZ#+<VdL+<Ve%67sC$ATMs%
Ec`Er+CT.u+D#S%F(HJ9BOr;uBl%@%%144#+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4Ysl
Ea`c;C2[W9C2IC#FCfJFBkh6-%144#+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4YslEa`c;
C2[W9C2[W8BkhN5%13OO+<VdL+<VdL:-pQUEb0'*@:UL&BOr<,AS5^uFCfK(A0>Ds@ruF'DIIR"
ATJu5@<lR)B-:W)FCf?3Bl@l3%144#+<VdL+<XEG/g,7S+CT/5+C]&&@<-W9Bl7F!D/`p*Bjtdm
BlnVCD.Rd0@:s.m%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%144#+<VdL+<W?]3\W6B+?XCX
@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgCl$6UH6+<VdL+AP6U+EVNE
F`V+:Derr,-t6b"DfTD33A*!B.3N/8@ruF'DIIR"ATJu>Dfm1HBl%T.BOQ'q+EVNEF(KG9FD,6&
+:SZ#+<VdL+<Ve%67sBY76s=;:/"e5Bl5&%DBNk6A7]d(G%G]8Bl@l3De:+a+CT.u+EV:.DBNt2
B5)F/ATAo-DBMOo3A*!B%13OO+<VdL+<VdL:-pQUF(KG9A8,OqBl@ltEd8d*76s=;:/"e5Bl5&%
DBNk6A7]d(C(1Lm+<VdL+<VeFA0<7<Ch.'j@rs(-$6UH6+<VdL+CoG4ATT%B;FNl>:JOSd-OgCl
$6UH6+<VdL+AP6U+EV:.DBNY2+CQC1ATo7F8g$,H0Jk:/+A*bsAS5^uFCfJ8%144#+<VdL+<Y]9
B4N,4DerrpBk)644""N!06_)@Eb-nLDfp(RA8,Oq055JT%13OO+<Ve%:K0bD+DGF1H#IgJ@<,p%
Df0B:+DG_8ATD@'FCeu*Bl5&6F`))2DJ()%F`MM6DKI!n3A*!B+CT.u+Dtb7ATA4e+<VeMATDj+
Df0V=De:+a/g+;8FWb1&DBNJ4D/^VCDfp(CA8,OqBl@ltEbT*++CT=6A9Da.+EM%5BlJ08+CT.u
+ED%0Ddd/c$6UH6FD,6&+DG^9DIn$.Gp$U;ART[lA0=Je3A*!B+Co1rFD5Z2@<-'nF"SS7BOr;Y
:IH=B@;^3rC`m;6E,8rsDK?q6Dg*=GD]iS/+EV:2Et&I!+<YB9+EV:.+=^?5Ec,T/B-9fB6m+m?
D/^Ur@rc:&F<FP'Bk(q".Ni/=E+NotBm;6Q%13OO+=\L++?;&.1ad>e@q]:gB4Z-,FDi:DBOr</
F(HJ4Afu2/AKZ#)B6A$!EZeq<E,oN2F(oQ1+Dbb$Eaa!6+CJ#5;FN?K+D,P4@qB0nF)Po,+:SZ#
+<Y*'C3=T>D.RU,F!,RC+CK57F'pUC<GlM\De*E%@q]:k@:OCjEcW@3Eb-A8F`MA2A0>f&Afu;3
FD)e)Ed2_KAiLne?m'E/BlA#$$6UH6FDi:0Ed2Y5+EM+&EarcoF"SS7BOr<-ATW$.DJ()5BQ&$0
A0>>m+ED%7FDl22A0>;mFCfJ8?ugL5?m'K4DK?q0F`\`t+EqaHCh*t^+<Ve8A9M[.AKYJrARfLi
DJ()(DfQt1EbTW0@ps0r@rGmh/g+,9Ec,T/B-;,)Aft)kBk)'lAKYhuGp$p;D/")78l%i&F!+n#
Bl%L*Gp!P'+<VeKD]iS%@;I'1Bln#2F)Po,+CoD#F_t]-FE8R6F`\`u-Z^D1DJ<U!A7Zm)F`;;<
Ec`F;@<3Q"Cj0<5F!,F1Ecc#(Cb?/(+<Vd9$6Uf@?o9'FA0<6I?m&lgC3=T>ARlp*D]j+>Ec`FE
AS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=b.NhW#B4Z<1ATDg0EcW?OATDg0EcW@;DBO%7AKZ#)
B4Z<1AU&07ATMp,Df.!HDJs_A%144#+EVX4E,]B!+CT.u+Cf4rEbT-"ARmhE-Rs=\Df028+ED^J
+FPjbA8Z3+-RT?1+<Ve'EbTH4+A,Et+Eh=:F(oQ1F!,:1F<GU8B4Z<1ATDg0EcW@9D]j.?+EV:.
+EVO@+DbV4AS`K2Ea`o>%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<
<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^W
ARuulC2[W8E+EQg%13OO+=\KV@!-O%A7Bgl+Eq78+DG_'DfTl0@ruO4+D#e-Cis9&DJ()0@;TRs
+EqOABHS[0-Qm,@+ED%7F_l/@/g(T1%144-+<X'dEb/a&+CKPC?m%'S/g+PMI:+1.AS,XoBln'-
DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg+<V+#+:SZ#.Nfj&A8--.@rH4$@;]Us+Co2-
E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:EcW@FD]iJ)Ci=M?@WHC2F(KA7E,T\<F`;CS%13OO
,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!b
CEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$FCei&E+*WpDdtFo@8pf?+C\c#ARlooDe!p,ASuTu
FD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b+<Ve2<HDklB-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]
A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn
+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn
+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/f
H#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#
B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l
+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,
9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[BuB-9WR
Bln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e;u+<VdL%144#
+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&%13OO+<VdL<HD_`F_i14
DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI5$4R=b.Nfi^F(KH&
F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#EbT*+%144#+<Y]9EHPu9
ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#Bk;>p$6UH6
+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(T1%144-+<Y'#
A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE@")U(DJ!Tq>]Y!qEccGC
/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c/hen3+>"^(ARf:g@V'R&
3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$8l%htAn>Cm
F`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];
+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!
DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9M
DIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB0fU=;1a$:A
@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'n
F"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$
F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ
9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhu
G\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b
@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjAEc#28+CK53
FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm3A*<P3$9dq
7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!
E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A
6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo:LeKb@V'R&
0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&
@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`
/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76Z
ATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+
/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>
F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7
BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6
?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?
+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S
8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)
/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8
F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ
+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;
EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2
F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!
A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7
F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0Z
A1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6s
BkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//
+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk
+<V+#+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL
+<Vd9$6UI1Ci=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=
+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeE
Dg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&
+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"
+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.
DJ`s&FE9&W+:SZ#+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL
+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL
.1HV,+:SZ#.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4
+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-
+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D
%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL
+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_
+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$6UH#$6UH6<+ohcE,oN5
BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,
Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%S+:SZ#
+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>
ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+
Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)
G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*
Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OL
F*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8
+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr7
6TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj
/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q
%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>
G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!
ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6
Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$
1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7
F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)
CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO
1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\
A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL
+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bh
CNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-
+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYr
Cg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*
D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;
%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsn
BlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1
GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+
F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pY
F(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08
+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?
Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r
+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7Hm
GT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*
Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^
F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&
0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%
67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@
+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd
$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]
3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt
$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"
+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO
,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@
5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2
FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$
F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6
ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043
EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibS
DK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-
F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*
Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B
4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(
+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQU
Ao)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-
ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL
+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"
DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'
$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:
D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043
EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1
@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5
ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-h
FD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'
DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!
/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&
A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2
@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.
+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043
EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LA
D/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6
=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6
AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6
%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(
?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh
+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#
EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0
+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cq
D.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/
ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6
+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e
+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4
+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87
AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6
ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa
%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd
+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ8
7;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBe
GT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?h
BOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTr
FDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;es
D.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi
+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4
+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%
?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]Tu
BlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$
DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.
+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@lt
Ed:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7
AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL
@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4
?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH6
6m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_
0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-co
AKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81
+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N
%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o
@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b
.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,
G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>
+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F
@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e
,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'
C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5
FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2
Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6
BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.
0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8
F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.
F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSek
Bln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?
6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,
F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'm
F!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL
%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9
$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%
+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1
?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL
+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#
+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.
AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E
%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"
A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''
F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>
@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*
?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i
/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\
D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKh
A7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+
E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8B
F*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6
Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'
/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85
?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&
E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9
C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&
A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u
+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc
$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU
?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e
$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0
AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#
A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'
Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b
.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(
?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R
/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF
:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4
DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO
+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1
%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)
@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4
+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.
@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-
BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7
F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9
BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhu
F*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#
Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!
Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu
@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC
@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q
+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSek
Df.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEi
Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,
0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-pl
DffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"
%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeK
D]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#Oj
E*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"
C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0
AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7
E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1
/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5a
Ec5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#
CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)
Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3l
AIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$
A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#
+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN
0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJr
De(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(
Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4
+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7
DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;
FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@
GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J8
3aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b
/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!
+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-
+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4
E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO
,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*
ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$
B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu
@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#
+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.
DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9
<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu
@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4
D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'
AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i
+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[
Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdL
IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,
ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-
G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5
DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOI
AncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_
0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5
@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9
BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et
+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@
+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,
GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'
A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?
+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'
+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#
+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8
ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l
?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8
ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7
AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60
@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$
D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;
+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg
%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKg
C2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6
A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9
De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r
+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f
%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb
,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cq
D.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$
Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2
ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<
Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$
Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7C
AKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?
+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;
@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$
A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-
+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNE
A7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)
Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"
$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(
+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"
@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70B
D-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA
%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4
A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lg
A7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78
+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&
,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$
C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33
F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)
3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i
1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=)
,9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@
H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)
@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#
DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-
G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`fl
Amo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$
@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnA
F!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%16c_F*)>@H"q8.A8bs52eQ]>
ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen52BXRoA7]p,.!KBE.1HUn$6pc?+>GK&/i#:,6#^jYC`kPc
+>PW+1E\)EE,oZ1B-9c`A8,OqD.RU,F!*n^Bln'-DCH#%%144-+B3#c+E):2ATAo3Afu#2FD5Z2
+Cf>#AKZ)'@VfUs+DG^9@;p0sDIdI++@Rn*BOPrk$6UH6@V'+g+Cf(nDJ*Nk/g+,,AKYetEbAs(
+EV%$Ch4_D1*C:P+Du+A+E)-?@3BW*DJ*cs%144#+E1b%AKZ)5+DbUtG%De;E+*6f+D,P4+D,b<
F`M%9@rGmhF"Rn/%144-+B*2qAKWIFDIdZqF_t]-FCeu4+Cf>#ATJu-@<Q3)@V'+g+CSekARlp*
D]j.1@VfTu0et?j$4R=b.Nh](AKYQ%FE2XLAoD]4?t=4tATV<&BOPs)@V'+g+CSeqF`VY9A0>u4
+EM47G9@>%+<VeKBOr<(ATo8)83p0F6rcrX?m'DsEa`frFCfJF%13OO,9nEU0eP.41,C%)+A-'[
F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L$Df'H3DIm^-+>GVoBl5&$
C3OT:A92-$DJs_ABQ%]tF!,R<AKXSf?o]Ak0f38\F*VhKASiQ2FE2)5B.b<+BPDMs$6UH6BOu"!
F!+(N6m-#O@;I'1Bln#2FD,5.@VK^gEd8dADI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.1ad>e
@;]TuARTUqBk;;o$6UH68ge[&AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDiE%13OO+=\L$DfTl0
@rri$@:FCf+Dl%7@:UKhEbBN3ASuT4/KetLCj@.F@;BFq+Cf(nEa`I"ATAo0BleB;/e&-s$6pc?
+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*-r4\o@rcL*+BDokBjkn$+@TgTFD5Z2.1HUn$6Uf@
+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@+@Kpa
ARfg)A7]@eDJ=3,Df-\+E,]B+A8-92@:Wn[A1e;u%144-+<YN0@o$#V9PJBeGT^s6FD,_<@:Wn[
A0>u4+Cf>-Anbn#Eaa'(Df-\=ARfgrDf.0:$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)
-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6UH@+AQKl+@0jQH>d[D
E,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums+@KpRFD5Z2@<-WB>A/,#E-"&n06_Va/n&U*
H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3De:,6BOr;s
BleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D+EM[EE,Tc=%144#+<X9P6m-#OG%GK.
E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%r
Ci^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N1,1L<
2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?k!GP$6UH@+AQKl+A-cqH$!V<+DbIq+E1k'
+CSekARlok<HDklB1d)QCh\!&Eaa'$/oY?5?nELBAS!!+BOr;sBl[cpFDl2F%13OO+DPk(FD)dE
IUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<c/hen4+>"^1@<,jk+>Po-
+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>A7f3l
D/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!+EVNE
8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLdATAnR
/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9ATT&9
ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[A0<HH
F(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUg
F_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinGEcYr5
DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(
1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e,9n<b
/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s$6pc?
+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5Ec`FB
Afu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u
+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#
.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO,9nEU
0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%
7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b
+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJF`;;<
Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p9jr'P
BHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*
2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=),9SZm
3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@ATM@%
BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30ALSaD
@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e
,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht
7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%+D,P4
+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;
Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+
EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f/0H]%
0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/KdbrEarc*
1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W%144#
.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(
Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6
+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2/KdZ.
DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/
@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+n
/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*
+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+
A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[
A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'
+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE
+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^EE&oX*
A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.F_l=G
0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"
A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#
D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm
+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7C
AISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$
Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2@;0Od
@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:D
BOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[KmEaa'(
Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0
GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h
%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[X!
Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.ATnRj-!YM&@ruF'DL5W1
AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/b
F`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]BQ@ZrHY@MCE-"&n04f#RGA1i,E+NQo@4lJ=
B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<ATD4$AUP\3De!p,ASuU2+Co2,ARfguGp$^>
Df$V%BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj
07A1>:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO
%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>
HW>-$DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./h
De*ZuFCfK$FCd(=E-Z>1I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$
FCd(DA7g7:<HDklB-:r-A8Gt%ATD4$AKXf;7XZlu$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)Q
Ch\!&Eaa'$/oY?5I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7g7:6ZmEi
ASuT48l%htD..=)@;L?E%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Apk*q+C&f&Ec#6$
F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!
FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$
DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O8Q/GO:..lF+<VdL+FSZB>]=+aATD?oHYI)%3`JXA
;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,BkCd`ATVL.I=#3oDfT]'CfG=gHY.2:D/!Tj@qBan
GT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`ATVL.I9dt#6Z6gYASuThDej]3DfT]'FE8R<H#R>8
Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA93/.$=%7iE+O'+Bl7^5B6%s-BlncM
>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE,961I9dt#6Z6gYASuTh
Dej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk::2b/i
@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+aATD?oHYI)%3b`27@qB^m@ruF'DLGe5>XNFHD.RU,
<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-CO9c-@sr]/:2b/i
@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3b`29I9dt#6Z6gYASuThDej]3DfT]'
F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3oDfT]'
CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*BjEb/j0BkCj9F(KH.De*ZuFCfK$FCfl++C%9PD/Ej%
FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FB
ARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/Ed)GBA930G>Y]3XD..6[Dej]BGAL]0AU%g-GAhM4
F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?DfTB0I9dt#6Z6gYASuThDej]BDKg,0E,]B!+DbJ.
AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpe"L$=%7iE+O'+Bl7^5
GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6+<VdL+<VeTI9Trq@:s.lAS-:'An*lGDfTB)Blnc/
+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGq".N$=%.[A:$j]B4u*qB4uC$
DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?
7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.EFD,5.
8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I@V'1d
DL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+CoD#F_t]-F<G19@:sFg
DKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>ASl.-AUP!p+<Xp'FCf;39jr'XA8c[0+D5_5F`8I>
Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*AQW1[
F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ$6UHr
ASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y
:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j
+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5F_#DB
E+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(+<Y-6
@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2DK@E>
$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)
+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq4FVa.
INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(>\.e`
HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=FEDkE
De*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#DKU1H
@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57
F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/+F.mJ
+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU+<Xp&
Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'
+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?8
F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_DKBo.
Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUr
F"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,
C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'DIIR"
ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"G]\%L
HYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0
BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1+C'#"
G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9
+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+@Vfsq
+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$I16Mi
+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+8
0/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]qDKK<3
+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*q
B4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*m
Ch[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC9
3A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3
%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<
0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bs9#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:
0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#+<VdL>]+J#D..7%BmO>"$4.gt>\.e`HY%);D.R`r
FCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$
AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g8AT;j,Eb-@@
B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+Dkq9+=CoB
A8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_Bq
BQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi<
ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)
Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2ieb
HX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]:Ci^_I>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[
A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#:N0l_+EV:.+A,Et+Co1rFD5Z2
@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%13OO,p6H%AS5^p
HZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g"ASu%*G%G]'
@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO9u1
+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?
Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=g
HQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`
HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!Blmp,
@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)A7]9o
Ch[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(Ci<`m+=CoBA8Gt%ATD4$
AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'c
FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u
$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJ:f
+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+G
F)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO,p6H%AS5^pHZit@@UX@m
D1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG/g,@P
DId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBsBl8'<%14C(>\.e`
HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[
Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-
DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I<9%;E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL
+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@AM7e:BPoJFASlBkFCf]=EHQ2AATMR'B5D.+I=34\
>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)pe
CO9<.AU&<:F`2A5F(oN)Ch7sAIWT.<E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL+<VdL>XNFH
D.RU,<,ZQ!:-pQU8g%YUAnc-oA0>K&Ch.*tF+"K)>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+Td
A7];"%16?SFCf;3;e:%nDfBf4Df0!"+CTD7BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkNATV[*
A8Gt%ATD4$AUQ0?$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MOEbTE(
<,ZQ!>]aP%FE)GAFCfN-DJ*csH[S4hFDYH(>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]CO71F
ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(oCghBu
H[T@3FCSa&AR'=gG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S@<H[*
DfR7I.3N_DG]Y':DIal#Bl[cpFDl2FI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u
$=%:eAShk`+<XR)DBN2+AU&<=FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,
ASuTB+C'#"G]\%LHY7A<Ch\!>%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,
B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn
/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g-Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49
A8Gt%ATD4$AM/(9GT[G&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`
BP_BqBQRs+B73ui%16?8DfT]'CfG=gHY7A<Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*cs
H[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/De*Zu
FCfK$FCd(HAU#>G%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B<Jo
+C%TK<+T0\FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961/q"iO
$4R=b+@.,kBOu!r+EM%5BlJ/:-sUk*G]\%LHX^E*I3<HK+C'#"G]\%LHZNkK.3N>G+Eqj?FED)3
+EVNEFD,5.>]aP%FEDVOF(KH.De*ZuFCfK$FCfk0$6UI%Bl[cpFDl2F+EV:*F<GX<Dg-7FFD,5.
F(K?6ASu!h+E(j7>YJR*AQW1[@rH4'Bl%4"Bl@l3@rH4$@;]Us/e&.1+:SZ#+@^']ATJ:f+<YN0
Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVOE+EQs@<?(*I4QLGFCf]=FEDkSASbdsAU&VGDfQ9o
+<Xp2AU&<=FF.hH@;K@oAU&VU+B`W*EZek*DeW]m+EqO9C`m1u+Co1rFCB9&A0>?,+EV:.+E2@4
F(K6!AKYo'%144#<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+E2@4
@;TIiAKYT!Ch4%_+<Xp2AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]KDBO%7AKZ28EbfB,
B-:`!Eb/a&DfU+U%16?ODIe**DKTf-Eaa'$I16Mm$<1\MEb-A%Eb-A7Df'&.>YJR*AQXD&ATW$.
DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u
$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-BOr<(F_tT!
EZf:4+DG_(AU"Xk+<Y04CisT4F"SS7BOr;sAS,@nCige6F!,R<Eb/f)@Wcc8FD,B0+DkP4+ED%7
F_l.BBl5&:ATE&=Ci=3(+DtV)ATJu7F`))2DJ'Cc+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7
DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XlE*$=%%OB5)71G%G]'@<?4#I16Ng@V'1dDL65C
CijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='DIIBnI9d9h>\.e`HZit@@UX@mD1)j#>\S:kD%-gp
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91Ci=3(+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&
+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%LHWO*2:eXGT8Q:*j+B3#c+Co%q@<HC.+DGm>0ek@)
@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-o
F(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1Eb/`lARo@_+EqOABHVD1AKZ&9EbTE(+C'#"G]\%L
HWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr6#:+QFB!0oHX(Z(G]\%LHTj&75(.i3%13OO>\S:k
D'08p+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\<@<iu0DI[U*Eb/a&Cj@.:BkM*qBkM+$+C&JpE+jTB
Ea`p+ARp33@W-L&A0=JeDJsZ8F!,R<@<<W%Df0Z*Bl4@e+<YN8G]\(KATJu4Afu/:EbTE(F!+n/
A0>f4BOu3,DffZ(EZfILE+O)C+B3#gF!+n-F)N17Ders*+D,P4+Eqj7E,]B!+Du+8DJsZ8F!,R<
@<;qc+<Y04DKK<$DBNb6DJ()'D.7'eA7]9oF*)G:DJ+#C+B3#c+Eh=:@N\otAU&<=FF/.SCghEs
G\1u?DfTB0I4QL^AS!!'@:s/#>]=+aATD?oHYI)%3d#X_@<?(*Ao`*6Eb'6>/.Dq/+Ceht+C\n)
F`V,)+EVNEB4YslEaa'$+C&JpE+jT@DKg,0E,]B!I3;cg@8pf?>TdWsEZfFG@q[!/DfTB0+EV:*
F<G(%DBND"+DkP)F^]*&Gp%<O@;p0sA0>;uA0>T(F(KB6ARl5W+<YB9+EV:.+D,>(ATJu,ASu("
@<?'k+C]U=>]aP%FEDVOC2[X!Blmp,@<?(//g+,6Gp$O:+EqB>D/!WrF<GXCD.Oi,@;^3rC`m;"
Bln',B+51j+DGm>@;L-rH#k*GARf:mF('*7+EqOABHUPR@8pf?/e&-s$=%.[A:%m*F_t]1@<?(/
%16igA8kstD0%He:-pQ_C2[X%@<-4++EK+d+Co%q@<HC.+Co1rFD5Z2@<-W9E+*cqD.Rg#EcWiB
$;No?%15is/g+,,BlbD/Bl%?'BlbD>F(Jl)FDi:CATT%;FD,5.+Co%q@<HC.+<Y3/@ruF'DIIR2
+E1b0@;TRtATDi$$;No?+EV%$Ch4_3Bl5&8BOr<'@<6O%EZet.Ch54A=(l/_+<Y)8+Dtb7+Co1r
FD5Z2@<-W9BlbD,Eb/[$ARl5W:-pQUFD,5.+E1b0@;TRtATDi7+DG^9FD,5.+DkP.FCfJ8Anc'm
+CT;%+E_a:A0>u4+EML5@qfP#+<Yc>AISuA67sC"@<,dnATVL(F!,(5EZed5E+*d/Bk):%@<*K$
Bk)7!Df0!(GqL4=BOr;/G%G]'+=Lc>F(KGB+Ceht%15is/g+V7+<VeLF(Jl)+EVNE+<YN>A8,Y$
+<YW3Ea`frFCfJ8+EM+9FD5W*F!)SJBl5%9+DG_(Bm+3$F^](q$;No?+Co1rFD5Z2@<-'nF"SRX
9jr*bATAn9Anc'm+E1b0@;TRtATDi7@ps6tDf0B:+C\n)@q]:gB4YTr@X/Ci:-pQUARoLsBl7Q+
FD,B0+D,>(AKYE!A0>o(@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm/e&._67r]S:-pQU<+ohcD..L-
ATAo*Bl%?'@ps6t@V$[&ARfal@<?'k+EqOABHVD1AKYJkChu-A$;No?%15is/g+YEART[lD..L-
?X[\fA7$HO9gM]W78dK$C2[Wi%15is/e&._67sB^5uLHL:.I>f@;Ka&FD,5.+E1b0@;TRtATDi7
@s)g4ASuU+Gp$p;F*(u(+CT;%+ED%5F_Pl-A0>?,%15is/g,7LAKXT@6m-PrF*(u1/g*_t+F.mJ
+ED%1Dg#\7@;^?5De:,6BOu$'8l%htGA1l0+CfG#F(d0K=`8El$;No?+Ceht+<Y`6An>e(+CSek
+CSekBln'-DII?(E+*cqD.Rg#EcW@4F`\`KH#IgJ+CehtDJsV>F(&ZlCj?Hs:-pQUEb0*+G%De+
F`MM6DKI"?@<,dnATVL(F"Rn/%15fq;cH1`:dIuR;a!/a0H`D!0F\?u$;No?+B3#c+D,P4D..N/
De:,6BPDN1E+*cqD.Rg#EZet.Ch4`'F#ja;:-pQU+<VdLC2RHsAKX&W.!0`RALSa4ATM@%BlJ0.
Df-[Z+Eh10F_)!h:-pQU%15is/g)8Z+<YE:@;TQuBlbD*+Eh10Bk/>Y+DtV)AISuA67sB'+<VdT
FEqh:.3N/4F(96)E-,f4DBNJ.@s)X"DKKqBFD,5.E+*cqD.Rg#EZcqVFEqh:+DGm>Eb065Bl[cq
%15is/g)8Z+<VdL+E).6Gp"LcBl8$(B4Z*4+DGm>@s)g4ASuU+Gp$[CARfk)ARlp%FD,6++EVmJ
ATJu<Bl%Sp$;No?+<VdL+<VdL@V$[$@<6L$A0><%+Cf(nEa`I"ATAo0BleB;+=M;BAKYN&FCAWp
ALT5@$;No?+<VdL+Eh10F_)\0F!+n/+D#e/@s)m%@VfTu8g%\iE,oN2F(oQ1+EV:*F<GOCDe+!#
ATJu&+Eh10F_)!h%15C"6V0j/2'="a+?L\o.qrmCAS5Rp.3NhJASrVF+E_a:+CT>$Bk]Oa+DG^9
A9Da.F!)kb+E)9C0e"4f+<VdL+<VdL+<W`g0d%SJ$:@Tc=[k\E<)6C74!5q%Bl8$(B4Z*4+Cf>,
E,TW*DKKqB@rH=#ARlotDBNk8AKYf-Df?h<@<6K4-o!i04>J`I.3K`U+?L]#0JEqC6r-0M9gqfV
6qKaF+?L\o.qrmCAS5Rp.3NhJASrVF+Co1rFD5Z2@<-W9A8bt#D.RU,+DGm>E-67F-nlc^EZd(c
+<VdL4!66e$:IZW<D>nW<*)XZ<(J,n+=JaSDKKH&ATB4BGA1T0BHV5*+DQ%?FD5?$ARlooDe!p,
ASuT4FCf]=+=K!!4F'%E2)Qg*+?L](0b"IX<D?:Z5snUI;BS%D-nB"LFCf)rE[`,L@VTIaFE8R8
F_u)/A0>T(+E)./+Dbt7E$0+.F)rHP0g'_D1,L[6+<VdL+<Vdg+>kh^$:dNa7R9C@:Jr;X4!5q%
Bl8$(B4Z*4+EqaEA9/l6ATVs,AThWq+DG^9Df0,/Ci=62+E1b1F!)kc0KaVC1,(OE.3K`U+?L]$
2)#IH:fUIa5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,OGDfTE"+DG^9Df0,/Ci=62+E1b1F!)kc
0KaVC1,(OE.3K`U+<VdL4!6730F\@e78uQE:-hB=+<W`g-nB"LFCf)rE[`,TBOu'(0d(RPD.Rd1
@;Tt)+CT;%+ELt7ARlotDBNJ4D/aP=-nlc^EZd(c+<Vdg+>F<483p0F6rcrX+<Vdg+=JaSDKKH&
ATB4BGA(Q*+>G!I+D>2)BHV#1+E2@4AncL$A0>u4+CoV3E-!-M0Hb:S+>G;f+<VdL4!66e$4R>;
67sBY:JXqZ:J=/F;BT[p+D#D/FEo!<Gp$X/AmoguF=n\-Aftf0+DGm>F(KG9FDi:1+=LuD@<?03
+A*bdDf00$B6A6+A0;<g:-pQUAoDKrATAnk:JXqZ:J=/F;BTn$ATDg*A7]g)A8,OqBl@ltEd8dD
De!3tBl@m1+D,P4+=M)CF"&5EASu("@<?'k+EM%5BlJ08+:SZU:JXqZ:J=/F;BS%D-t?q!Ea`I"
ATB4BEb/cqEb/a&F!)lJCi_$JF(96)E--.DFDi9o+D,P.A7]d(4!4t>%15is/g,7]E+rfjC`mV6
DIm[(FEo!MATW$.DJ'Cc:-pQU;GU(f7Sc]G78b6i+=L`5@<,ddFCfJA+ED%(Bl[cpFE8QQD/=8B
+EM%5BlJ08+EVNE8g%_aCh.*t+?L]pF`V,705>E9Ec5l<+:SYe$;No?+@0mj+CSekARlp&@<,dn
ATVL(F!+n3AKZ&9DfTE"+DG^9FD,5.D..L-ATAo*Bl%?'GA(Q*%15is/g+YEART[lA0>;uA0>Ds
F*)G:@Wcd(A0>u4+A,Et+Co2,ARfh#Ed8dG@VTIaFE9&W+:SYe$;No?+BLj,:.\2N3ZrW[ASrW$
AS,XoBl7Q+8g%\iE,oN2F(oQ1F!+q'+Cei#AS-($+CS_tF`\aJBOr;J+Cf(nEa`I"ATAn&$;No?
+EV:.+A,Et+Cf>#AKWC3E-,MtCh5%<FD,*)+E1b0F(KD8FD,B0+EMXFBl7Q+BlbD;F_#3'ASuTu
Ed98H$4R>;67sBJ:Jb1l8Ol<N+?L\o@q]:k@:OCjE[`+m+@0g[+ED1/BQS;<Eb0<'Ecu#)%15is
/g*kk:dIuF9gr#M;BS%D-nB"LFCf)rE[`,QBOr;pDKC#5EZdFd1boLI.1HUn$>OKiE,ol/Bl%?9
0ht%f.V`m4E,ol/Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+
D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:Wne
DK@IDASu("@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB
$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1Ums
F!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG
+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\
D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%
Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc
:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%
FED57B+52C67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBU
DffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.
%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(
AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B
@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%
DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[P
D.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-
F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO
:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.
@q?)V:-pQUD09Z:BlIm"+A,Et+DG_7FCB&sATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&
DId<h%16WbF(KG9-W3B378uuM-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8
F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQU
Dg#]4EbT&q+@S[c:JOha9LU'U+EM+9+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*
FD)*j:-pQU:.\/V3ZqpTEcP`/FDQ4F779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'
+=LfC.3K',779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r
;]nGGA7]"UDe*E3AU%c1-OgDX67sBL6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^
Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-pp
Df[r^=%GbX76sX>4ZX]I0Hb]b4$"a&Df'&.GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!
-OgCl$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:
Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4
@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBh
A7QfnASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u
1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMq
C2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr<
/g)QWDe*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md4
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@
A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk
+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63
BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_C
A1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#
AS-!++FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+
@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t
78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE
+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4
B6%p5E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq
-Qlr</g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&
Df?gIE-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj
$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:
+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd
$;No?+EDUB+EV%7FDku6B6bV@Bl%?uFDQ4F/KetSFDuAEF!,C=Cj@.7G]7J5@qg%1+Cf>#ARl5W
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
/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQUGA(Q.AKYDu+A!\uF(Jl)@X0);Df'&.D.-pp
Df[%E@;L'tF!)iSDfTV@+E)9C-YRF8AL@oo:-pQU=%GbX76sX>4ZX]5GAhM;-OgCl$;No?+CoV3
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
C2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM
6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/i#=-/KeS8
Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL
+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+
/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%
@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme
@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8
De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16ig
A7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=
F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=
@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn
$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2
@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(
Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#
DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSek
Df.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ
%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.
Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'
FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!
+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&
@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!
DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("
@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%
@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#
+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTC
E+EQkDdtG8De(J>A7c8X.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et
6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen5-OgDP
:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\
ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8
A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q
9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)u
FCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDkl
B1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%17&b
An5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!
3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et
+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJ
ATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/
;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6
A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeY
F`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%
Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre
$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj
/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(
F`Lu'-OgD`78d&U:JO&6-S[5-/i#=-/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s
$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B
;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKi
F)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOA
A.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARloo
Bk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)
E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$
@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=
F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2
@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#
Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3
Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSek
Df.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;
%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-
F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A
@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"
+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#
Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%ht
Cggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>
D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,
Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%16rtC2[X%Ec5Q(Ch5@V:-pQ_
D0]l7A8lR-Anc'm+EK+d+DlBH8l%htA8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+
D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:Wne
DK@IDASu("@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB
$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1Ums
F!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG
+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\
D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%
Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc
:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%
FED57B+52C67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBU
DffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.
%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(
AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B
@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%
DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[P
D.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-
F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO
:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.
@q?)V:-pQUD09Z:BlIm"+A,Et+DG_7FCB&sATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&
DId<h%16WbF(KG9-W3B378uuM-OgCl$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8
F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQU
Dg#]4EbT&q+@S[c:JOha9LU'U+EM+9+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*
FD)*j:-pQU:.\/V3ZqpTEcP`/FDQ4F779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'
+=LfC.3K',779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r
;]nGGA7]"UDe*E3AU%c1-OgDX67sBL6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^
Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R>;67sB/BkhQs.3N2BEc5tO+Dk\2
F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>
F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/
$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7
Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1
B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsH
C1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk
A90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56
DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@ji
Ec<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9
$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_u
G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]
/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf
+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7
%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B
+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%q
F$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>
+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&=DATMr9F(oH%DKK]?+>"^S
DJXS@Dfp/@F`_[IGA(E,+E_a:EZfF7FE7luEcF6'+>G3`FE@s!%15is/g,1WDBNe)@rcK1F(oH%
DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.
CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7
><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2
A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBn
Ec6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\bi
EarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'
BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msF
HS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..Nr
BPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FG
AU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%
:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*
+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8
F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdL
A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!
0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;
67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQU
GAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9
F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUc
De*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$
ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&
Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$I"4Y@jtAThu7-RU$I
D_</Q+ED%8F`M@P+D#G$/e&.9E\&ha.3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4l//q#?m%14Nn
$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M
4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm
@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\
%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/
4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(FCSum
EcXB)><3le+Z_P)-S$\t.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&uDKB`4
AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo0ek+$
?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K
-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M
-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?1
3\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,
-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'
FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&
3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb
-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>
ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#
F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL
-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5
/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.
0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=rF!+n/A0><%F)PQ&
@<?''@rGmh%173!4ZZjk4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji
+>PYq?Q_EQB657=+AP6U+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[is
D/h^">p)3O1GC"[+?L]YF<D\K:-pQU.P>d^C^g_gGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL
%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?@rc:&F:ARqF$2Q,-Y[=:
-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF+=nW_/ghbm+=A9Z+>#3p
+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cpFDl2F%16il4ZZe.+ED%%
A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.%16id4ZX]60HiJ2.6qWi
%13OO:-pQUCi<`m+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>V0E+*j%%16ih4ZX]i3Zp+"3\V[\
3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8+=MASBl%i>
+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2%13OO:-pQU
F`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$<Kbe
;FNlG8Nf*W-YRF8AL@oo%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcC
D/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J
+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V
-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;
67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1
E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g,4HF<G!7E,oN%ATDg&A0>i"DIdZq
+E)-?FD,B0+DkOsBPD?q+>"^YF(Jl)@X0(EC2[X!Blmp,@<?'0%15is/g*tg77K^D;FNuM5u'gD
6TmIQ-UTq"<HD_lF'N?hDK9H$/p25HEa1nLE(",V@9cKE@ps1Y:gn6PDe!$k@;]Uo@j_]m%15is
/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K
@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#:-pQU
BQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3ARfg)D.-ppDfZ?p%15is/g,4H
F<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ
67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP3[\ucF_>5rFs(jCF_;h>FD5Q4
-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-QlV91E^UH+=ANG$4R=     ~>
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
0Jb==2`<HH2)d6I3?U(21,L[>0JkC>1GgsH2`3QK3?U(21,L[>0JY7;3B/uP1,(OD1*A>+1,CU@
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
