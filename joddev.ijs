NB. sha256:39cbcce6aef764c7d8917b175c323bb1d9d110801eebdebf97debabcb22fa15d
NB. JOD dictionary dump: 25 Apr 2023 16:48:10
NB. Generated with JOD version; 1.0.26 - dev; 2; 25 Apr 2023 13:02:57
NB. J version: j9.5.0-beta1/j64avx2/windows/commercial/www.jsoftware.com/2023-04-22T15:17:12/clang-15-0-7/SLEEF=1
NB. JOD put dictionary path: /joddev/jod/utils
NB.
NB. Names & DidNums on current path
NB. +------+--------------------------------------+
NB. |joddev|48566381629343508776651114992653957343|
NB. +------+--------------------------------------+

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

JODTOOLSVMD=:'1.0.25 - dev';17;'25 Apr 2023 13:02:58'

JODVMD=:'1.0.26 - dev';2;'25 Apr 2023 13:02:57'

LASTPUT=:14

NAMECLASS=:12

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(U.1,L+/+?1K!1E\Y"1,g=7+>Y\o3$:+5+>k8s3$9q4+>u"u0ea_.1E\D1+>P_q0eje,0d&@s
1,9t2+>Pku3?U(6+>Ghu1c?I31E\P4+>GPm1b^%0+>Pes0ea_-0H`4q1H6L5+>Gbs3$:%4+>P&p
3?U%5+>Pr"1E\M1+>k8t2*tGF78lc]7;lXMARfg)F(or3+E)4@Bl@l3@rGmh6W-?=<(Tk\DdmHm
@rri'Eb/[$Bl@l3DfBf4Df-\-De*EI:eXGT8Q9P8G\M#;D'3A'@ruF'DIIR2+E1b2BHV,&DJ+')
6rcrX9iFP>DJsW.F!,FEF<G+.@ruF'DIIR2+E1b2BHSlLF`V,+F_i1EBOu'(Ci<`mBl7Q+A9Da.
+EM%5BlJ088PiPb6:uB>H$!V<+Du+>AR]RrCERP7FD5Z2+Cf>#AP%2?:IJo7FCfK)@:NkYDfTD3
8l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s
8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*
A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td
6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk
9L2TV:fUJ2@<6N5DdmHm@rri4F`\aEE-,f4DBNG-A7\M%9gqEC5uU]S+DtV)AKYK!@<6K4DfBf4
Df-\-De*EgF_PZ&C2[WmDf'H6ATMp(A7B[qCh.T0@3B0)Ci"A>@rH4'Eb0<5ARloU:IH=ADdd0!
FCfN8+EM%5BlJ0'F_PZ&C2[X)Df9H5@rH4'Eb0<5ARo7mBl%=$+Cf>,E,oN2F(Jl)G%G]8Bl@l3
De:,6BOr;Y:IH=IDf9H5+Cf4rF)rIF@rc:&FCT!"BOPsqA8Q9qBOt[hF!,"9D/^V=@rc:&F<G7*
F(c\)B45LlF*&O7Df0Z.DKKr1E-#T4F(KG9A8,OqBl@ltEd8dH@<,dnATVL(F(BE1E+ifkA7]dk
Eb/[$ATJu9BOr;sF_u)0Bl%?'@;]TuGB.D>ATJu-ART+\EZf(6AoD^,@<?4%DJ*d(@WPsq@;L48
ALnsEAT2R.F<G"0A0>r8DfTD3B5DKq@;I'(@;TRsC3FJe+Eh=:F(oQ1+Du==@V'Rs@;BFbF_u).
F_u)=+EV:.+CfP7Eb0-1+E1b2BHU`)+CQBb+EM%5BlJ/:Anc'mDe*d*ASuQ3@;]Tu@r-()ATJu)
Bk)7!Df0!(Bk;@)Eb/isG[tr6E+i[$BQ/!'AncL$F!,.)F(c\<D]iS5D/^V=@rc:&FE;DDFE;PB
Eb0;7DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%E-688F)uGAEb0;7A8,OqBl@lt
Ed8d?Ec6)>F!+n/A0>r9Blmp-                                                 ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@3+>P&o2]sk03&;[31E\D,2DS`aBl%<eC2[X!Blmp,@<?'U67s`sF_PZ&?YXLiCh\!&Eaa'$
+EK+d+C]J-Ch+YsDIal#BleB:Bju4,AKY`+A8Gt%ATD4$AM.\3Et&IO67sAi$;No?+CfG'@<?'k
3Zp131,*WVF>,Q]$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is/g)o'De!lC2'?@NBl%<&-u*[2
Ch\!&Eaa'$.3N&:A0>DsF*)G:@Wcd(%15is/g)o'De!lC3?T_bDe*ZuFCfK$FCefm@<6*m@<?('
Ebm0I@:Wn[A.8l@67sB90Q(fP0K1+&C2[X!Blmp,@<?'fEc5l<.3N&0A7]9\$;No?+>PW]ARdDK
+=LuCA8Gt%ATD4$AQDMn.3N&0A7]9\$;No?+>PZ^ARdJM+C]J-Ch+Z1Bl.E(D..I#ARlp%DBNn:
F*&ODEc5H!F)u8?%15is/g)o*@;p6B2'?=<C3=T>+EVNEBOPdhCh4`0ART+&Df0B:+E2IF+Co1r
FD5Z2@<-W&$4R>PDe!TlF)rIGD/a<0@p_Mf6#(=KCh[uF3B:G03[[3Z6#(=KCh[uF3B8H0>9IEo
ATD4#AKX)_5s[eODe*ZuF>,^8-OgDmDeX*1ATDl8-Y[=6A1%fn%17#lD`p-(I4f&EA0<Q8$4R>`
@rcHM3ZoebDe*ZuFCfK$FCcg/$4R>+0RI_K+?MV4-mr_GAU#RF/NP"90RI_VD^cnYBl.F+-RgSo
+DPh*A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%159QHZX+DCi<f+B4Z0-4$"a0ART*lGB.D>AKZ&-
@59\u+EM47GApu3F!,RGFCB$*+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Ch\!&Eaa'$?ZL('
F<G=:A8Gt%ATD4$AQDMn+CSl(ATDj6EZeh&AoD^$F*)FFC2Rs6+DPe4GAqJAF=.M)%15is/g+kG
F(KB6061WCCgggb+C]J-Ch+Z1Bl.E(F*(i-E$0(:+E27?F<GOCDe!@"F)Q(.$9g.j-ZW]>DI[i;
4ZX][5snOG?X[\fA7$HlATT%B:et"h?RICG@rcGr$4R=j1E\_$0I\+l-Qij*BkAt?0H`M$4tq=X
5snOG?X[\fA7$HuF`\`S4DJbPGAqJAF<EY#+F>5K@s0:D14:9_@s1!r+=qD?Fs(=6/e&.1+>G!C
+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+E27?F<GOCDdso3Bl.F&FCB$*
+Du+>+E_X6@<?'k-OgDoCia/?+>F<4ASu$2%14Nn$4R>;67sC'E+EC!AKZ/5A0<$D.OdM5+DPh*
Ch\!&Eaa'$<_Ysk$=[OSFCdTr+=M>QFCB$*+=ANc/12Q7<$re`67sC&G@b2u+D,P4+EV=7AU894
AISu]De*ZuFCfK$FCeKI6p3RR+=JX%3ZpU@HYRJ0Ch\!&Eaa'$<_Yt24(;`/FCcmD-nui".=E=R
De*ZuFCfK$FCeKI6k'J4$7I\Q3Zp+*+=ANG$>F*)+>=p$+?hK+FDYu5Ddso/F`\`RC2[X!Blmp,
@<?']9gg?OA8a(0$6UHG+Bot0BQ&*6@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^Z
ATDj+Df.1E@;BF,A79Rk+Du+>+E_X6@<?'k-QjN@$>"$pAM,)[%16ZaA1e;u.1HUn$?BW!>9G;6
@j#W0B-:f#Ch4tW3c/\S+EM%5D@Hqn@j"tu-ZW]>DI[c94ZZ;'6W-]e@;9^k?Q`umF<Dr1:IIuc
C2[X!Blmp,@<?'fD.G"'$4R=j1E\_$0I\+l-OgDX67sC'E+EC!AKXoB5r(;U+D>2)BHU`$A0>Dk
FCcRCD/XQ7FCAm$+EV=7ALS`F-n6Z//g+nIA8Gt%ATD4$ARB+ZF(f)mFCfT8C^g_b@<6*F3ZrKW
@59\u+ED%%A0>JuCh4%_C2[X!Blmp,@<?'fBOPsqA79RkF`M:]3Zoha@<6*D@UrnhALS`M0H`)!
I3<9CA8Gt%ATD4$ARB+ZF(f)mFCfT8C^g_cAhG2[+?^i20RInYE,9H&+E2IF+=CoBA8Gt%ATD4$
ARB+ZF(f)mFCfT8CaU?9D_;J++<WB]>9J!#Dg-//F)rHOE-67FA8,OqBl@ltEd8dAF!,L7@:V$0
DJXS@/Ke_8F(c\6Dfd+EE+EC!ARm/2+:SZhCia/?+>F<4ASu$2%14Nn$4R=j1E\_$0I\,VBl%>i
$>F*)+D,20BleB'C0r*%F`]c!+=Lu5@r$-K3biSDCh\!&Eaa'$?ZL('F=\eS@:O(o05>E9Ch\!&
Eaa'$0./2"-YdR1Ch\!&Eaa'$/no'A-Qlr</g(T1+<W(QART*lGpsk[EbTW,+EM47GApu3F!,CD
F:AR"+=K<,HSBea@rs.BGB.D>AKZ&-Dg-//F)rI=@:O(o/14Cm6r.0)De*ZuFCfK$FCd(AA1%fn
ASu$2+:SZ,%13OO4tq>%A0>f/D]i7,1E^UH-RU#G$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]7(A8Gt%0KD.#%16QeBl%<eE-68EATDie67s`sF_PZ&?Z:.0FCfK6+EK+d+C]J-
Ch+Z-F`__:EcW@GE+EC!AKYYpF(c\,@<?'5%15is/g(T1:-pQU@rc-hFCeuD+>PW+11><<0K9LK
:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,E?XE\]Kp@:X+qF*&OHD]i_%DIdQp+ED%%A1qk=
Cj@.BF`\a:Bk)7!Df0!(Gmt*'%16T`@r,RpF!,RAE,9H&?U6tDE-68CF"fU7?TgFt5s[eUF`_YF
0KD-@+BosuDe3rtF(HIV-UC$aE-68CF"fU7-OgDmDeX*1ATDl8-Y[=6A1%fn%17#lD`p-(I4f&E
A0<Q8$4R>`@rcHM3ZoehF`__:EcWT;$4R>+0RI_K+=D;RBl%i<+BosE+E(d5-RT?14tq>*D/a<0
@j#DqF<EY+-ZWd,A0?):Blmo/F(fK9E+*g/+EM4)1,Us4@:jUmEcZ>C+C\noDfTE1FE/L=DJs_A
C2Rs6E,Tf>+EV=7ATMs%D/^UF/9><ADCd/BBOPsqA79RkF`M:G%13OO:-pQUBl8!'Ec`sTAT2Ho
@q?clF_PZ&+EV=7AKZ&9@;Ts+Df-\:Df^"CE,ol,ATMp2EX`@>0RG0f@j#Z!FsfF6+AG-h;GUY.
C2[Wi+D58-+=Bu];cI*O/9><AD@Hp^$7I\Q3Zp+*+=ANZ%16f]/g)hj4WlpBHVHdn;GUY.C2[Wi
+E2IF+=K?eDJs`<Df^"C4#.q*+Dt\4.3LBo+Dt\44ZX]:DI[i4A8a(0$6UHG+Bot0BQ&*6@<6K4
-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^TDf^"CE,ol,+EV=7ATMs%D/^V8Dfd+EE+EC!
ARm.t$>"$pAM,)[%16ZaA1e;u.1HUn$?BW!>9G;6@j#W0B-:f#Ch4tW3c/\S+EM%5D@Hp^$7I\Q
3Zp+*+=ANG$;No?+E_X6@<?'';b0202)ZRj@<6*)@;]TuA79Rk+<V+#BOPsq4Y@juBONYR2B[$O
@:UKmBl%>i$7Kt*Ec*EU?YEkhBOkOnAT`$0-Rh2>+=Lo3F(dXWBl.F&FCB$*+=ANc+=Jod0e%Mn
+tdqHEc*EU?YEkhBOkOnAT`$0-OgDsAhG2[+?^i20RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79Rk
F`M:G+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]G%G]8
Bl@lAA79Rk/ne[7BHV22F<G^FA79RkA1%fnAScF!/g)kX$>"*c/e&.:%13OO4tq>%A0>f/D]i7,
1E^UH-RU#G$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]I4FE2FV3B:FU$3  ~>
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
0ekR/0eje,+>G_r1*A;,2_[051,'h++>GZ,0K1+01E\Fq3&``N+>G\q1*A;-2)QL20d&4o1GCU>
+>GPm1*A>02_m960f'q-+>c)53?U:(1*A>12`Dj60d&4o0f:aH+>Gl!1*A;*0f^@22]sju0f(^E
8l%iA<CokP84c`Z:Jt=N2%9mf67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*@]+F_PZ&+AR&r@V'R@
+?:Pe6t(1K3Zp+:+AQiu+>PW+0H`&/3\iBM0Js:H%13OO:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>GK&
/i"Ol6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0eskHDg!6Y0JY=)0ek^E1-.3M%13OO%15is/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
%15is/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Ghu:2b:u
1,(I;+>GW40f(jG2[p*$$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp18+AQiu+>PW+0H`)*3]&WR1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp18+AQiu+>PW+0H`)*3]/`T1G]@F$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp18+AQiu
+>PW+0H`)-3]&cV1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>b2`6t(1K3Zp19+AQiu+>PW+0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1:+AQiu+>PW+0H`)(3\iNQ0f]RJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AQiu
+>PW+0H`))3\rNP2)kpM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp1:+AQiu+>PW+0H`))3\rTR1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW+0H`))3]&QP0fKFH$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:+AQiu
+>PW+0H`)*3\W9L0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqf1*Atr@j!N\1,'h*0KLpE3]&Pu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f1"@ARci<0JY=)0K;*N1-.0N$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Gl!
6tKjN1,(I;+>Gc80JPUB1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&
:3CD_ATBgS0f'pp6t(1K3Zp.3+B)ij+>PW+0d&2+3]/iW2)GXI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh0d'8%F<E=m1,0n+2**KN3\rT"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU
1,0nI@rrhK0JY@*0f;!J2EEZP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t2BX,1@<?'A+>PYo:LeJh1,(I<+>G`71bq*G3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp14+AZKh+>PW+0d&2.3]&ZS
0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[
ANCqh0d'8%F<E=m1,0n+2**QR3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,0nI@rrhK0JY@*0f;!L0fh$C$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo:LeJh1,(I<+>G`7
2)73J2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo
6t(1K3Zp+3+@KdN+>PW+0d&2+3\WQT0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf1*Atr@j!N\1,0n+1HI<M3]/i'$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JXb=ARci<0JY@*
0f1pI3'&lQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
1a!o/@<?'A+>GPm6tKjN1,(I<+>>f:1GCjH1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.2+@KdN+>PW+0d&2)3\`BN2)#@E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg0d&kq@j!N\
1,0n*3BB#T3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp1:+<X'\FCdKU0eje=ARci<0JY@*0ek^E2EENG$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>GSn6tKjN1,(I<+>GT31H@KO1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.3+@KdN
+>PW+0d&2.3\W6K1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Y\o+@KX[ANCqg0d&kq@j!N\1,0n+2**KP3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0eje=ARci<0JY@*0f;!J1HI<K$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51*@]+F_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqg0d&kq@j!N\
1,0n+2**QR3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+<X!nBl%<&:3CD_ATBgS1G^-r
6t(1K3Zp15+@KdN+>PW+0d&2.3\i]V1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/S&F9
+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P\p6tKjN1,(I<+>G`71Gh-K1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>P\p6tKjN1,(I<+>G`7
1H.?L1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.
@<?'A+>Po!6tKjN1,(I<+>>c92)dQR3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GSn8muT[1,(I=+>>f:2*!]Q2@9cu:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GYp8muT[1,(I=+>G]6
0JkgE0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>P_q8p+qm1,(I=+>>f:0KD0L3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>So:LeJh1,(I=+>GW40JPUC1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>Vp:LeJh1,(I=+>GT3
0f(jG1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4
@<?'A+>G\q6tKjN1,(I=+>>f:0ebXC2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+9+A-'[+>PW+1E\D-3\`NR1bf=E$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg3$:h%DBL\g1,C%-
0fh$G3]&Pu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.4
+<X'\FCdKU0fU:J@;[2C0JYF,0etdG0KM$K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7l
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>P\p8muT[1,(I>+>GQ20f1pF2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp15+A-'[+>PW+
1E\D+3]/iW0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@
+>G_r+@KX[ANCqh1*B1tDBL\g1,C%-2EETQ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:
+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,C%F@;[2C0JYF,0ebXB3'&cP$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>P_q8muT[
1,(I>+>GQ21c@BL2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_
ATBgS0fU9u6t(1K3Zp16+A-'[+>PW+1E\D+3]&fW1c,OH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh1E]:uDBL\g1,C%-0fh!C3\rW#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,C%F
@;[2C0JYF,0f;!K1cd<K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+>P_q8muT[1,(I>+>G`71c@BL2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp16+A-'[+>PW+1E\D13]/lX1G]@F
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh
1E]:uDBL\g1,C%-2``WQ3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!Y
A0=WiD.7's3Zp18+<X'\FCdKU1,U1H@;[2C0JYF,0etdI1HI9O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E[f,F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2BYV#DBL\g1,C%-0KLsH3]/`$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp19+A-'[+>PW+
1E\D.3\WKR1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*+@:3bCh+Y`F_tT!E]P<u3$9>3
@<?'A+>Pht8muT[1,(I>+>GZ50fM-I1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C$q6?R!Y
A0=WiD.7's3Zp1<+<X'\FCdKU1,^7I@;[2C0JYF,0f1pG2**TK$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E[f,F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh2BYV#DBL\g1,C%-2**HL3\`K!$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+;+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>>Mm7V-$O
1,(I>+>GQ20fD'K0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,L+aATf1=6?R!YA0=WiD.7's
3Zp1#+@KX[ANCqf0d&qs@N[E[1,C%-0KLpK3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+;
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>>Yq7V-$O1,(I>+>GQ22)%'I0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,L+aATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]tS$@N[E[1,C%-
1-.0K3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+;+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>Pku7V-$O1,(I>+>G`71cRNO1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,L+aATf1=
6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]tS$@N[E[1,C%-2EENI3\`T$$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+;+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!7V-$O1,(I>+>GQ20K2$I
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,L*r6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh3$:\%
@N[E[1,C%-0KLsC3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+;+<X!nBl%<&:3CD_ATBgS
3?TG4@<?'A+>Po!7V-$O1,(I>+>GQ22)REN0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>>Vp9jr&b1,(I>+>G`72)73J2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>_s9jr&b1,(I>
+>G`70f1pH3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>Gl!9jr&b1,(I>+>GQ22)[KQ0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Gl!9jr&b1,(I>+>GT30K2$J1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Gl!9jr&b1,(I>
+>GT30f;!L3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>Pbr9jr&b1,(I>+>GQ20ebXD2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!9jr&b1,(I>+>P`62)REN1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y\o9jr&b1,(I>
+>GQ22*!]Q2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS
3?TG4@<?'A+>>So6#^ie1,(I>+>>f:0f;!H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+4+@0se+>PW+1E\D+3\`<L1GoLH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqf1E\u&EZd+k
1,C%-0KLsD3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's
3Zp.4+<X'\FCdKU0Jah;E,m'V0JYF,0ek^G2**EK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
2'=InA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>>So6#^ie1,(I>+>GZ51bq*I1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,U0s6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0Jjn<E,m'V0JYF,
0KD0L1cd?F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[
ANCqh2'>2(EZd+k1,C%-1-.9M3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+=+>"^HATf1=
6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>2(EZd+k1,C%-1-.9P3]/Su$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+=+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2'>2(EZd+k1,C%-1HI3F
3]/i'8l%iS:JXY_6<-TN6qBmJ<)6Cp1,TLJ:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+:+AQiu+>PW+0H`&/3\iBM0Js:H%13OO:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.4
+AQiu+>PW+0H`))3\iHO1H,aM%13OO:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp18+AQiu
+>PW+0H`)*3]&WR1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,U1LDg!6Y0JY=)0f;!K
2```K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1:+AQiu+>PW+0H`)(3\iNQ0f]RJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh
2]tk6Fs&Oo1,'h*0fh*G3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1cdHR$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pku:2b:u1,(I;
+>GT31bh$G3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+?:Pe6t(1K3Zp1:+AQiu+>PW+0H`)*3\W9L0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=ARci<0JY=)0ebXC1HI?J
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp.6+@KdN+>PW+0H`&/3]/ZR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f^@EARci<0JY=)0fD'H0fh!F$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.3
+B)ij+>PW+0d&2+3]/lX0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,0nI@rrhK0JY@*0f;!J2EEZP$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14+AZKh+>PW+
0d&2.3]&TQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.9+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+AZKh+>PW+0d&2.3]&fW
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.;
+<X'\FCdKU1,0nI@rrhK0JY@*0f;!L0fh$C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AZKh+>PW+0d&2.3]/ZR1,]IH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU
0JXb=ARci<0JY@*0etdD3BAiK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,
+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+3+@KdN+>PW+0d&2,3\rZT2)kpM$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JXb=ARci<
0JY@*0f1pI3'&lQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp.2+@KdN+>PW+0d&/13\rHN1boCF$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0ea_<ARci<0JY@*0ebXC
1-.9H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1,^6t6t(1K3Zp.3+@KdN+>PW+0d&/13]/cU1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0eje=ARci<0JY@*0ek^E2EENG$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K
3Zp.3+@KdN+>PW+0d&2*3\rcW1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0eje=ARci<0JY@*0f;!G0KM!K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp.3+@KdN
+>PW+0d&2.3\iZU1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp45+<X'\FCdKU0eje=ARci<0JY@*0f;!J1HI<K$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9sp6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0eje=ARci<0JY@*0f;!K3'&iQ
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9sp6?R!YA0=WiD.7's3Zp47+<X'\FCdKU
1,9t?ARci<0JY@*0f;!I3BArQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,
+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P\p6tKjN1,(I<+>G`71Gh-K2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp15+@KdN+>PW+
0d&2.3\r]U0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp4$+@KX[ANCqh3$:V#@j!N\1,0n*3'&oU3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0ejeC@;[2C0JYC+0KD0O3BAoR
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>GYp8muT[1,(I=+>G]60JkgE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp16+A-cm+>PW+1*A823\WQT1-#[K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf1E]J'
F<E=m1,9t,1-.*D3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P=&+<X'\FCdKU0JjnJ@rrhK0JYC+0ek^D1HI9J$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>G\q6tKjN1,(I=+>>f:
0ebXC2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GPm+@KX[ANCqf3$:h%DBL\g1,C%-1-.-J3]&Pu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Ghu8muT[1,(I>+>GT30f1pJ0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[
ANCqg3$:h%DBL\g1,C%-1-.3F3]&`%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7l
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>P\p8muT[1,(I>+>GQ20f1pF2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B1t
DBL\g1,C%-0KM'M3\`T$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>P\p8muT[1,(I>+>Gc81,q<L0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1E]:uDBL\g1,C%-
0KLmI3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t2]s52@<?'A+>P_q8muT[1,(I>+>GQ21c@BL2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh1E]:uDBL\g1,C%-0KM$M3]&Z#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4
@<?'A+>P_q8muT[1,(I>+>GT30JPUE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1E]:uDBL\g1,C%-2**QN3\WH!$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>P_q
8muT[1,(I>+>G`71c@BL2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%no
F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh1E]:uDBL\g1,C%-2EE]T3\rQ!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>P_q8muT[1,(I>
+>Gf90KD0K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pbr+@KX[ANCqh2'>M"DBL\g1,C%-1-.9K3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>Pht8muT[1,(I>+>GQ21,V*M
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht
+@KX[ANCqh2BYV#DBL\g1,C%-1HI3K3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>Pht8muT[1,(I>+>GZ50fM-I1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqh
2BYV#DBL\g1,C%-1cd?K3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Pht8muT[1,(I>+>G`70f;!H2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf0d&qs@N[E[
1,C%-0KLpH3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`
F_tT!E]P=!0d%T,@<?'A+>>Mm7V-$O1,(I>+>GQ20f_9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf2'>A"@N[E[1,C%-0KM'F
3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!
1E[f.@<?'A+>Pku7V-$O1,(I>+>GW41,_0M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqh2]tS$@N[E[1,C%-2**QR3\iN!$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A
+>Pku7V-$O1,(I>+>Gc80JY[D3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqh3$:\%@N[E[1,C%-0KLmH3\`As$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A+>Po!7V-$O
1,(I>+>GQ21,(aG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Yu"+@KX[ANCqh3$:\%@N[E[1,C%-0KM'K3\rJt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0JjnH@<*JG0JYF,0f;!L
1-.0L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>>_s9jr&b1,(I>+>G`70f1pH3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+AH9b+>PW+1E\D+3]/fV2),FF$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg
3?V%)EZd+k1,C%-0fh!I3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0f^@N@<*JG0JYF,0ek^D2**TT$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr&b1,(I>
+>GQ20ebXD2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp1;+AH9b+>PW+1E\G/3]/cU1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi0Ha(uEZd+k1,C%-0KM'O3\iT#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU0Jah;E,m'V0JYF,0KD0K2**HP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+4+@0se+>PW+1E\D+3\`<L1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0Jah;
E,m'V0JYF,0ebXD0fh$C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!n
Bl%<&:3CD_ATBgS0esjo6t(1K3Zp+4+@0se+>PW+1E\D,3]&]T0Js1E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0Jah;E,m'V0JYF,
0f(jI1-.0I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_
ATBgS0f1!q6t(1K3Zp+5+@0se+>PW+1E\A33\iNQ0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,U1?E,m'V0JYF,0etdI2**EJ
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS0fC-s
6t(1K3Zp18+@0se+>PW+1E\D-3]/lX2)#@E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<
+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,U1?E,m'V0JYF,0f(jE1-.9P$;+)^?Z0Cp
ATDs*A7&ngEc5u>?Z^O71,Vfn/h0Ih6sjkAF(KB8ARo.ZEcQ)=F!,NU/KeMFB-;#/B-:W#A0>o(
F)Z&8F(KDF%13OO:-pQUHZO:;Ec`mOAh@q1F(KB8ARmB(EcQ)=F+"K)%15is/j)9F0e"5TEaa$&
3Zr?Y+DbV%Bln'+@<?''-tI43.3N&>B6A'&DKI!LC2[W9C,I\%.1HVZ67sB93?V%)EZd+k0Jst-
1HIBI3\`H#$4R=b+<VdL1a"OrA8Z3+-Y.?I%19tYEa`j$+D#S6DfRl]DJWg)D@HriZQLA5DegJ-
+<VdL+Du=2DJWg)DBO3W%13OO:-pQr4t&-7+D,>43Zr9XA8,XiARlp*BOr<0ATD6&-tI43F(Jd#
@q[;6FDi:9DKBr@AISuA67sC&BOQ!*@;^?5DKTc3+EM+&Earc*Ch[s4F!,FBDfB9.Cj@.AE+No0
FDi:>F_kk'$;No?+EV%$Ch7Z?+B3#gF!,(/G\(q=FD,5.Ea`j$+D#S6DfQsP+EV:.+Cf>#AISuA
67sC)Dfol,+D>2,AKYSnBl%?k+E)-?DffZ(EZee2B6A'&DKI"?@<?U&Ec,qL+D!0</g)qm1*C+F
C`k*7Df7!G%15is/g,@PFD)e7D]j+DBlmp-+EqaHCh+Z%@<Q3)AmoCiARlnm$;No?+<WTc6#^ie
1,(C>+>G]60JkgG0b"I!$4R>;67tA`-o*4o@rc"!BK@8[BOu'(@<?U&D/aT2DJ()6D]j(3B5)F/
ATAo%+E2@4+A*b6/hf*k$;No?+Co1rFD5Z2@<-WG+<XWsATD?)BlbD*+EMI<AKYGrDIIR2+DG_'
Df'H%FD52uCh\!:%15is/g+h=Eb-@F+Co1rFD5Z2@<-'nF!+t5ART[lA0>?,+A*b6/hf+)A8`T.
Dfd+CBQ&)($;No?+EV:2F!,%7Ec5t@/KebFA8,O^FCfM9DImBi+D,P4+Dl%;AKZ#3@Wca6+D#S6
DfQ9o:-pQUFE1f/E+s3&+DG^9@3B/nG9CpEF`_>8ATKI5$;No?+>Pr"9jr&b1,(C>+>G]60K(sJ
1(=R"$6UH6Eb/lo+=CoHDJLU]-Y#2BC12-nBk)7!Df0!(Bk;?jDImp,@;0UaC12.#ATVctBl5:-
$Gs,[Df&osDBNM2Ec5tZ+DP8(ART*Y$Gs+l+<Y9:AS""W+<VdLC0u!m@:UKo4(\p/%15is/j2BH
1+=>XBm;Z]FD,5.C1_0rATJu;ATD7$+CT;%+Du+A+CehrCh7-"FD,]5F_>A1@;ZM]:-pQU@:XOm
EcYe73]\C*Ea`p+ARlotDKKH1Amo1\+CT.u+CT)&+EVO@+DbV4AS`K!DfTCu$;No?+A,Et+EqaE
A9/l%Eb-A%CiaM;FE1f/E+NQ4+<XWsBlbD.EcQ)=+EqO9C`me@Bl%T.De!:"EX`@N67sBmDfQt7
DI[U%E+*j&@VfTu@VK^gEd8d>Bl%@%+C]J8+DGm>DJs_AE,ol9ATDU4+EVX4E,]B!/e&-s$4R>;
67tA`-o3:pGB.V>B0%.`A8-+(.3N/>ATJu3Dfd+@Ec5o.Ebp"DA8-+(CghT3F`(o'De*E%A79Rg
FEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%144#+<Yf;4ZX^.3ZoelBPDN1BlbD>DJ<U!
A7[+t$6UH6%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth+<V+#+<VeGF`\`RF^uj/$H&=MKYrDZ
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrDZKYrJ\KYrJ[^C:OeZSB>'0d([Y
Eb$S>.3NSPF<G:8+>#doZYFW#CVmCe$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrAYKYrJ\KYrJ\R10KG+<Y69@<6!&-ZrrI%14g!$6UH6B4Z0--ZrrI%1:"A_h>pZ
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0uC7O+EqaEA12LJ+Co%qBl7Km
_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_jLr@+<VeLA.8lfBPDN1
BlbD>DJ<U!A7Z2W+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg$6UH6%144#+Co2-E$-NNA1&Kp67sC%
BQ&$0A0>DsF)Yr(Gp%3BAKX9;6V0ilG%G]8Bl@l3AoDL%Dg,o5B-9eh@rH7.ASuU(Df0V*$H&=M
KYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ[^C:OeZS98&+\GNu+D#S6DfRl]A7]@eDJ=3,Df-\0@;0P#Eb3+o%1:"'_h>pY_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_jLr@%15is
/j2BH1FXGYBm;Z]GAhM;F!,17+DbJ.ATAo:ATDj+Df0V=De:+a+>"^XATMr9@psFi+Co2-E)gdi
@rGmh0JG3j$4R=O$4R>;67tA`-o<@qATDg0E]P=bBOu3q+DGm>@3BB)DJ()5FCB&tBl7Q+E,ol+
Ch7H+GA2/4+=M,9D.R3cFE8lRBl5&8BOPul$;No?+<Y3+@r,RoARlp)@rH<tF!+n3AKYl/F<G".
G@>c<+ED%8F`MA2A0>B#EcP`$FDQ4F%13OO:-pQr4t&6:+D,>43Znk=%13OO%15is/j)9F2(9YZ
EcQ)=3Zohf@;BF'+Eq78+D,%rCh[d"+EVNEB4YslEaa'$+D5_5F`;CEGA(Q*+EV:.+Co&&ASu$i
DKH<p:-pQUCh[s4+D#D/FD5;s+EV:.+D5_5F`8I>BleAK+<V+#%144#De't<F`_>6F!i)7+>Y-Y
A0<6I%13OO+<WE^?SWa@@;BEs-[0KLA7fb#D..O#Df-p3$4R>;67tDb-oEFrAncKN+Cf(nDJ*Nk
+=M)8CLq.".3N_N+D>2$A8Gg"FD,B0+Cei$AM+E!%13OO:-pQq4X`3;+D#D/FEo!AEc6)>F!+n3
AKYl/F<G(6ART[lA0>?,+EDUBDJ=!$+CoV3E-#N0BlJ08+C\nl@<HX&+D5_6+=D&8D.P(V-RT?1
:-pQUAmoCiF!,C=+CT.1Bl8*&Ch[E&DIIBn/g(T1%15is/j2BH2CTb\Bm;Z]-tdU<@;BFo.3NJG
A8,XiARlp*D]j(3D/XT/+CT/5+D#D/FD5<-+D,Y4D'3_)D.RNtF*&O6AS,k$AISuA67sBjEb/[$
Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&Hc$4R>;67tA`-oWRtATDg0E]P<kC2[WkB4WM7Bl.g0DfB9.
Cj@.6Ble60@<lo:F(oN)Ch4`,@;TQu@q]:k@:OCjEZf14F*&O5EbBN3ASuU2%15is/g)o0+AQiu
+>PW)2]sh/3\`WU1c5^L%13OO+<VeADe*9hAKW@2F*(i4-QjO,67sBjF`_[IDIIBn%1;*ZN8g(P
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufT%1;*ZJhc8LK&W#R
ifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>Oifo$;ifo&SP_)Y=D.V^k
Jja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K+A?3bF<GOFFQ/O:6t(@^
+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*Eg+<][.Jhf#62_[6H0eP:*+<VfdP_(hS+<VdL+<VdL
+<VdL+<VdL+QAW;1,(C@0KCjB/i4[n+QAW;2`W!'+<VdL+<VdL+<VdL+<][.K&W#H%1;*ZJfs';
K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohiP_'>Oifo\eP^qbX[,R=#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme+<Vd9$4R=b1*@]SDe*9h
AKW@0F*(i4F!hD(ifoD]P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXOQ)LV
%1;*ZJfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4D'2;^EcZ=FE-69^P_);3
FCcRg@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;ifo&SPap`tJDufDifnuQ
P^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*ZJfs';K&W#H@NZd9ifo$M0JGF>3AE6@
1bg*q+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G0ek:;0d%UuP_(hS+<VdL+<VdL+<VdL
+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
R,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\
%13OOC2[WkB4W2I3[\HZFCB86Eb/]-+<XEG/g,(J+D,P4+Dbb5FE7lu%14m6C2[WkB4W36/g)qm
A8Z3+-RT?1%13OO:-pQq4X`9=+D#S6DfRl]Ci<`mBl7Q+8l%htA9Da.+EM%5BlJ08+D,%rCi^_C
BOu'(Eb0<6DfTQ0B-:`-D/^V=@rc:&FE7lu:-pQUGA2/4+Dtb7+EV=7ATMs%D/aP=/KeqLF<G(,
ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++CT@7F)Po,+E275DKH<p:-pQU0JstK@rrhK0JPF-
0KD0K0fh'E%13OO0HiJ2+?V#]3\P5dA1q\9A8lR4A9Da.F"_BAE%Yj>F!hD(%1441/hSb!Df'31
FCeu*FCf]=+>,9!/e&-s$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i50RP$9
:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+.h)h9/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@FOT+\GNu+D#S6
DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/I^$@HZ$DJ+')+D#S6DfRl]A8_naHlsOSB0@k88Q&;X;dWmBDd-X5/g)8Z+@Jsj9grDrA8_na
%15is/j2BH3%5t^Bm;Z]DJs_A@q]F`CM@[!+D,P4+E)41DBNJ(@ruF'DIIR"ATJu.DBNn@FCB!%
FE7lu:-pQU0JstK@rrhK0JPF-0f1pG3'&fT%13OO:-pQq4X`<>+D#S6DfRl]-td@7@WNt@Bl7F!
EcP`$FDQ4FAo(mgF!,OBD.Oi+De!3l+CT>4BkM=#ASuU2+EVNEF`)2ADffQ$%15is/g+kGA8-'q
@rri+Ci<ckCi^_-F!+m6D/"6+A0><%F(o9)D.RU,/g)9+DfQt3G[YH.Ch5XM%15is/g)i.+AZKh
+>PW*2'=V/3]/`T1bfFH%15is/g,7LATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2+:SZpBm=3"
8T&'QEb/a&6$%*]B5U.YEc5t]3]%s?+>=63-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@;Ap&!$.6T^7
>9GF=0H_hf>n%,i%13OO:-pQUBl.g0DfB9.Cj@.DATW'8DK?q;Bm=3"+CT>4BkM=#ASuU2%16`a
Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M;'%15is/j2BH3@Q(_Bm;Z]D/"6+A0>T(A8-'q
@rri%F)u&.DJ`s&F<G.8Ec5t@AncL$A0;<g:-pQU0eskG@<itN0JPL/0f(jI1HIBP%13OO%15is
/j)9F0eb%!ATDg0E]P=ZBl7K)Ch[a#F<G.>@qB4^ARlp"Ddd0jDJ()1Ch+Y\:IH=9F_u(?-t6\#
.1HVZ67sB71a#M$EZd+k1,C%-0KM'J3\rc*$;No?%15is/g*T#B5)6p3Zr/t/i51805<C%@<QlN
04\L3GA1q($;No?+@:3bCh,RL@rH4$ATD9p@;ISP0JYF90JY482cMLh3\iTS0K1XpCgh3o/MT(6
0J+t3;bTVK7QiI8$;No?+A?KYEaa!63ZpF81bLO;%15is/g+#5+A"si3Zp110J5.72D-a;1ak77
1+kC4%15is/g*u,@<?+"Ec!i[6t(+[Bl5%O1^sde67sBPDKBo.Ci!['3Zr/t/i4\bDKBo.ChsOf
:-pQU8T&Tk@;KaV@<?0D+>7kYATDiFC2[d'@UX%`E\D/c1bWT(/i4"E:-pQU6Z6ja@:OC?+Er$R
/o#HGAor6*Eb-k5Df#pj%144#+@T%46rn,4H#IhI?SOMo2_m9S3\`QO1a"P-,UZ;T9grD[8OH6#
4"!rn;aOh_6mk&D9gqcF?UII64"!rn;aOhb5uU`i:-hTC-T`\S6;p3X7S-KV<*rBd9gpEk-V%')
;I<!`-T`\CDf0Z;@:OC,4"!rn;aOhc6W?rj<_6+84"!rn;aOhh770IM6rYNq-Uh-)6siMR-T`\E
=@5J`;b0\^<*rTn=B$Y0-V[#u9OC4X7UJP_-T`\M77BmW78-9C?W:0)741/E9gqKE?VNme;I<=#
:+&+N9g_lX?UR=]6ROrC5u^cc?V*X54"!<n;d!Hq78lQ$4"!p;E,Tc=6Z6LH6ZQaHFCdjKFCcg]
-W4MpDfTqeDe*EQ@<6NjE+EC!ALBPf0I/>$4!ua_7lX!r1.+Mg2^^[70JG170JkaF1FG730f:^F
2`39D-T`\FBl7Eo-T`\M@<-'uH#=uk-SR8/0JG170df%1822nX0IJq1/14@D.6An30eY7?0/>49
2]sh13\W6K0JG+50JFV89d`"M-T`\NDfd*fF)u&.DIm?+4!ua90eY:90fU:11-.*C3\W6?0JG1'
5tr^g-W3M`4"!Hl2)$C>-Ugcf0Ha7^8PUCP010o'B-9N]CF;1k-T`\'4!uC;-RUu(0I/>$4!uj^
1cJ&s3($h,1+,.20JG170JbRD1+,.20f:dA2D@!C-T`\AA9fOa-U_B`Depd_-SR8/0JG170df%1
822nX0IJq1/14@D.6An50/>I>1,(FB+>GW40JGOA0J5%50H`YU-T`\E2)lsF-W<H1+ED$S+@0g[
+A[)mATAnl78P*qG%GQ5F!)l*5p1)`Cj@HW4!uj<0eY:90fU:11-.*C3\W6?0JG1'5tr^g-UUEP
4"!Hr0JFk9-Ugug0H_qi7WNEa+B3B(AKX<UF_)p^-RUu'-T`\'4!uC;-nlo#.6An8<(&Q5;E%!D
0K(:?-SR5.0JP:=0fCC@-S[J82)I*H0df%16"G6g4"!R-FED5.-T`\00eb:80JG4/4"!QR1Gpj6
4")X-;^X"U-SmD22_Qp?0fU:11-.*C3\W6?0JG1'5tr^g-UfmP-T`\S78P+IANCr"Cht4iFD,6+
+B(^*+@UHbDKKqB-quuMDf0B:.472)1bUR:1,(FB+>GW40JGOA0J5%50H`YU-T`\C81-JH78trp
-T`\E<%p!K/KdN'Df$UrEckq96>UdU-T`\'4!uC;-RUu'-T`_1,VUZ/-S\U[2F0eh<_,/)-T`\0
0JG181c73G-T`\12)[-B1bLC5%17K!Bl.R++D#S6DfRBOAU%crF`_>8B-;&0DII&u0HiJ20b"J;
@3BW:F*(u1+Dbb/BlkJA@<3Q&G[k;rA7]9\$@Es=+<VdL+>=s"0JP\)E+*j%-[nZ`6r6c^6rcrX
;_MTiBeF+7F!hD(Hs80\2-h=XF`V,7F"_9HBPq9fCLqN>C2[W9C2[X%Ectu9D/aPL@Uj+)Bkh\u
$4R>;67tA`-o!G*+D#S6DfRl]@;TIfB5_p6+E)CEE-67FAoD]4D..3k+=D8EBle0#D.P(($;No?
+>Pes6#^ie1,(I>+>G`71c[TN2[p*h67r]S:-pQU7;caPDIkjOC,mn(/hekdATV?805<C%@<QlN
06_,JA8c[5%15is/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MK"51,;f`2**HN3\`BC@r,RkB.Yhq
/MJb802kP577KEp%15is/g*i%@WGmtGrd'./i>79%15is/g+#5+A"si3Zp110J5.72D-a;1ak77
1+kC4%15is/g*u,@<?+"Ec!i[=(uOp2DbjM:-pQU8T&Tk@;KakE]P=X3A*03Bl8!6@;K`h$;No?
+A$HlFCB!%:gnHZ3Zqon05<C%00(XB%15is/g*N"DKK;sF?1OgGBYZSF)PZ4G@>N'/n8g:%13OO
D..3k+=D8EBle0#D.P(;:-pQUA8c%#DC9NK@;p0s@<*K4D]iS/+CT/5FD,B+B-7Wj:-pQUBlk_D
+Du+>+Cf5!@<*K7BOu3q+EV:.+E)CEE-67R+DGF1@;^?A+D5V(F"Rn/%13OO%15is/g,LPDIb>;
Ah@q1F(KB8ARmB(EcQ)=F+"K)<)5nX?V4*^6r-0WD.GC\%147_C2[WnDdso3De*c/Ch[s4>psH+
A7opkE+irqF"_WRA8bgiDe(J>DJ(C@?qO3_6r-0X+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/r
Eb/c(@q]:gB4Z-,AoD]4?qO3_6r-0X/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7
ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CCLVZDIal,@<iu(E,]AsEZf(6+E)@8ATAnm:IIu$Ch[s4
F"Rn/%16KI@V'1dDCosKA8ba]%13OO0eOSV4C:'\GrKk^AiY!PG;=,]F`2).0kYKI@;p-l5%#L-
Dg#\7DfBf4Df-\-De*E%FCAWpATJu&Ec6)<A1f!(GAeUFD..6s+EV%$Ch7Z1Df-\0Bl\9:+E1b%
AKZ22FD)e5@<-!lEX`?u+<Yc7@VfTuDf-\=ARfXrA1f!(BPDN1GA1l0+DbUtG%De8Ch7L+Gp%$;
+EML1@q?d)D]iJ!A0>c$G9CC6A7]g)Bl5&8BOqV[+<VeC@<-!lEZfI4@VfTu-q$j+74Bhu$4R=t
/g+Oa?SHO\GBdP3@:smrA8c-r3+HV]D`MEIFZ<_l?m&6aFD5Z2+>G\q.!00?AKZ&9@;Tt).3N/>
ATJu3Dfd+1E,]AsEZf(6+EV:.+DkP$DBL?D@<-!lE[`,@De*E%FCAWpAKYH)F<Dtd0e!P=+<VeI
AS,LoASu!hF!,"3ATKIH6"FLKBlkJ3DD!%[6r-QH.1HUn$8X:W?p%e-C3j]8B/44F@V0%m@rlNs
FYR_e1cRF;?Tqj?6Z6j`Bk1dq+DG\3Ec6,8DJ()(Df0Y>G@bK$BQS;<Bl5&4EbTE5ARlooDe!p,
ASuU2/g+,,AKYT'DKI"DF(Jkk$6UH6AoD]4F)Q2A@q?cmDe*E%@rHL+A0>>m+CQC/BlnH5AKYH#
Ch.*t+>"^IF)Y]#BjkgoGp%3BAKYK$Ci=?*A0>u*G]\!Z%13OO1bKnY4C;WEBQA-62fW;?1bs,e
Cc?EVGWBJYB4<i-5%#L(@<-4'DJ=E.+Cf>#AKYK$Ci=?8+CT.u+D,P0FE8R5@rcL/F!+k,F*)54
F*),6B6.H'@;]Tu?uTOlA8bsc+EMgGFCBD:@rH1%EbTE(/e&.1+<X$oEcP`/FDQ4FFD,6,AKYr#
@r#LcATJu:F(HJ)BkCsgEb0-1+D,P0FE8R5DIal"Des?4F"Rn/%14sF+CI<=2KCK3D)lKRBR2FN
@5g&cFEi%DEc#9!EF1n;+AucoBk;K2BQ&);FDi:6F_kl>+D#D!ARlolCht57AS,LoASu!hA0>K&
DKKqBBl5&4EbTE5+AbHqF"Rn/%15!G+CI<=@qB4/H8%0lFD!OPD)cAl@q]g?0Qh,R2.&OT+@C'b
F(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^F`8IHATDj+Df0VF+EVNE8l%iC:I?6Q6r-QH.4u&:
%15$H+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*
E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$=I(L
DIb>@De*cl?k!HB:IIuc8l%i^D.GC\%147_C2[W*FDk].+Dbb5FBp;:De*cnC2[W8E,K;;+CIf;
6sq-::IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!
B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"Rn/<+ohc
@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*B;$:8cO
GB7=<FD,5.Eb0E.F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AKZ)5+ED%:Bk;K2@q]:gB4Z-:%15C;
F)NTPEb/Zi+Br5eBleB7Ed99SA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9
@P;S,F*(u605>E905,'@FDl2F/o>,J%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!r
FCeu4/g*u,@;^-/A8`T.Dfd+>ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>M>@M/VBl5MEDe*cl
?k!GP$8F.U?p%dTH>#)nCH60HC,L3NA8l9?0Of?LEGfVQ?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B5l
F(c\7@VTIaF<G1(@qfanFEo!NBOQ!*GA1l0+EMXCEb-A%+B(fs/M]1A+D>2)BHVM4ASrW0F`__>
DJ'Cc+<VeF@VTIaFE9&W8K_GY+EV:2DJNs(B-:W#DffZ(EZf:>FD5Z2+Cf>#AKYA82ddbMBOQ!*
GAhV?A0>`#@;[3/FDl22+CQC+@<6*)Df-!k+<Ve7E-681+E)9CFCfN8+CQC+@<6*)Df-\*B4Z0m
%144#+F\cgILQW,+<Ve%67sC)DfTA2BlbD9F`\a7DIaku+D>2)BHV#1+EMXCEb/c(Bl5&%+ED%7
ATDs*A0>r0DfdT@$6UH6+>=om2^!'^F<DrTDfTA9+<V+#+<VdL:-pQUBOPsq+DGm>@rH4'@<,pi
+EVNEG%#30AKZ#)FE2),G%G2,/KeVFEc5t@BkAK)@<?!m+D,%rCi_3<$6UH6+>=om2]uaEF<DrT
DfTA9+:SZ#+<Z,^IXV_5%14jC+CI<=@;Be"3&,2o0l(WE3&>c)A3"^OFtd]QCgTA6+@C'bF(o/r
EZee$A8,po+CQC1ATo89@<,dnATVL(+EVNEA8,OqBl@ltEbT*++EV:*F<GdACht55Eb/isGT^O>
D/aP*$6UH6GA2/4+CQBk83ng_2)ZRj@<6*)@rH4$ASuTB+@0gbD]j">AS,Y$+D>2)BHUf'D/Ej%
F<G[D+A,Et+Cf>,E,oN2F(Jl)A8-+,EbT!*FD5Z2+EM%5BlJ08+=KWR:.6Ta%13OO1G0eX4C;PV
AoM98D/M.H2D\caCO0nS2JG*n2.8LP5%#L)DI[L*A7Zm*BOr;Y:IH=6DIak^+EMgLFCf;3G%G]8
Bl@m1+DG^9FD,5.Eb0<7Cige<AftJ=+E(d5-RW:EBlkJ2ASc=,%144#+EVNECMn'7+EqL-F<G(6
ART[lA0>u-AKZ#)B5)F/Eaa'(Df-[G6r-QH+D,P4+A*b:/i5:3/e&-s$8a@X?p%dO0PbS\B50GF
@Uj(/DJ_7DEb7+<A8u0>?Tqj?<+ohcAoD^,@<<W"3?^F<1ghG9BOPdkARloqDfQsm+?;&2/g+P:
G&C\1@rH4'F`_29%144#+CT.1Bl7F!EcP`$F<Ga<EcYr5DBNh>D.7's/g*Z&Bl7Q+AoD^6@<,m$
8g%hh+E_a>DJ()6BOr;oG%G]8Bl@lAD..0tE\;3CDJsQ'+DbJ3Dfp.S%144#+@C'bG%G]9+Eh=:
F(oQ1+Cf(r@r#drB-:o++A,Et+Cf>#AKZ)5+E_a:+EMXFBl7Q+-[%+Z/oE$ZFDi:4ATVKnF<G(,
@;]^hF"SS+Derr,De<Sj$6UH6F`);8C`mh5BlbD/DfT]'F<GXH@:EqeBmO?3/g)Q1:JO>$AoD]4
8g$,H1ark@%14sF+CI<=@W-@*1NYBqA9<#SBlmoECMS3@BeV7uG$dF@+A+#&+D,>(AKZ/-Eaj)4
D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*Dg-7FAnc'mF!,C=+CoM,G%G_;@:NeYF)to'+C]U*
$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6+DGm>De<T6+B3#cEb-V>+Du+>+Dl72BHToC6m,uJ
DBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!$6UH6A9)C-ATJu'F`\a6An?4$F*(e4AThX&FEM#.
Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7Ch[Zr3XlE=+<Z,^IXV_5+<VdLAn?4$F*&NP0/%'P
F(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0/no'4-OgD*+<Z,^IXV_5+<Ve!:IH=8Dfol,+CoC5
@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\ABl7I"GB4mJH#n(=D0$hDBOu'(BlkJ=AS#p*F`)&)
E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&AM7V.BJ4+EDfTB0/no'4?nNQE<+oue+EqO9C`mV6
F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/%144#+EqL1DBMtV:*=7l+E(k(/e&-s$8sLZ?p%dM
Bk:k$CjKYNA9KdgG%kf5H8oq`CGfU9?Tqj?9jqgK+EM[GAKYAqDe*ZuFCfK$FCei&GAhM;F!,(5
EZen,Eb/a&Bl@l3A7]@eDJ=3,Df0VI+EM+*3ZoPL?rToi:L@jTA8Gt%ATD4$AM.h1?sP0oFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7"Y6r.0)
De*ZuFCfK$FCd(AA19,R-rWQ'9iE019->f/G@>T'BIOAt%15$H+CI<=1GNu2A8c()CjBuBF^\lu
F*DPB2`NX5E*ke:+B2onF<Ft+De*ZuFCfK$FCei&Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'
+Dtb%A7]:(%13OO3%c=]4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$
G][M7A0>8P:IJS5Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3Q
F!,.)G%De+BOPdkARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO3A)F^4C:!^Anl6nE->\KBkqd9
B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CT5.ASu$mGT_*H+CJr&A1hh3Amc`l
ATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D$4R=s0J4Ij?p%dQ@U`noG&V.SGW0_%1c'24
H>GB\DD5cb?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3AreA8-+(?m'W(Eag/5BOQ!*GAhV?A0?)7Ebce6
Bkq9&?t<tmE*setF`\aIBQ&);DdmHm@ruc7Bl5&&@:O(qE-!W@$4R=s0eORk?p%e,0k>B<CLf.V
H#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2045o2F!+m6E+*j%+E2@4AncK4
Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,ARfh#Ed8d;Df0`0DKKT2DBNk8
+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s$=I(LDIb>@De*cl?k!HVBleB7
Ed;D<A26(Q$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$4R=e,9n<c/hen52BXRoA7]p,.!KBE.1HUn$4R=e,9n<c/hen52'>2(EbT>41b9b)
0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\LADIn$&?m'?*G9D!9CLqQ0?t=4t
ATT%B;FOPN8PVQA741/O?m&lqA0>8jE-#T4+=BHR6V0j/2((I??m&m!+Co%q@<HC.Et&I!+<VeN
BOu'(@rc-hFD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/%144-+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B
<D?:t+D>2)+C\nnDBN@uA7]9oFDi:0C2[X%@<-4+/no'A?nNR$BOr;sAS,@nCig*n+<VdLBlbCO
/0K%WEc*"<AnE00Bln#20J4JLBOu'(0d'mI;b02+1,Us4BOPsq+DGm>E,oN%Bm=3"+EVNEFD,5.
F*(i2F<GL6+CoV3E"*-s+<VeJ@rc:&FE9&W<+ohcAoDL%Dg,o5B-;;-F*)IGAoD]4A9Da.+EM%5
BlJ/:Bl8$(B6%^.GrcBA%144#+<VdL+<Ve:BPV9iF(f*$E*m$gDe*2t-[oK7A8c@,05"j6ATD3q
05>E9F)Q2A@q@<.De*BiFtRKDF!hD(%144-+<WrmDIn#7D.-ppD]j%B@;KXiBk;<-?qF0t:-r>2
@rGmh+D>2)+C\nnDBN@uA7]9oAoD]48p,)uFCfJ8DJsW.@W-1#F"SS1DffQ"Df9D6Anc'mEt&I!
+<Ve:@;[2sAKZ&9DfTE"+CT=68l%htD.-ppDf[%FBln#L%144#+<VdL+<V+#+<VdL+<VdL+AP6U
+ED%%A0>c.FCep"DegJ(DIal2FDl22%144#+<VdL+<Ve@E-Z>14ZX^+ART*l-Z3jEAR]RrCG'=?
H#@(=%144#+<VdL+<Vd`+E2IF+=D&FFCep"Deg^^8PiPb6=4/9De*3:BlJ?8@LWYR$6Uf@+B3#c
+E2IF+Co1rFD5Z2@<-W9E+*j%+DGm>DJs_ABl5&8BOr<"ART+\EZek1D/Ej%FE8RCAfs]A6k'JG
+<Ve;F_u)=/g*W%EZeq<@;Tt"AKZ).AKYAqDe*BiG$lG'Bk)7!Df0!(Gp$d/F!+m6E+*j%3XlE=
%144#+<VdL+<Vdg3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R=b+<Ve+BPDN1E+*j%+Eq78+Du+>+E2@4
G%kl;F)6+EF(fK9DD!%@$4R=b.Nfj"+C]J++DG_8Ec5K2@qB0nBl5&:ATDj+Df-[G0eP.41,C@%
BOPs)@V'+g+Cf>1Eb/a&ARmD95p0]LAmoguF:AR"+<VeDATMp$B4W30@<3Q*DI[U*Eb/a&Cj@.E
ATT&2ART+`DJ()6D]iFA+>u,9+E2IF+=AO\DfTA9-X\'/@;0P#Eb0;7-rW]-81?/#$6UH6+<VdL
%13OO,9nEU0eP.41,L+CAR]\&@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.DBMAYBln'-DCH#%%144-
+A*b:/hf+)Eb0,sD.R6#FDi9o+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P+Z_>7+Eq78+Cf(nDJ*Nk
+EV:2Et&I!+<Y]9EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZupDf'H9FCfM9@3B/uDdda%
DJ()8ATDj+Df-\8F_tT!E\7e.%144-+CIT69M%rM<+$hm@<3Q#F_u)/A0?#6+EVNE2Dd$/8S0)j
Dfm1?AS#BpD/XH++EV:*DBLho+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJEZdtM6m-GWFD)eBDfm12
Eb-A(DeX*%+EMI<ATVU"DJ()9Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeqF`VY9A0>u4+Cf(r@r!2r
Bl7@"Gp$U8D/`p*BjtdmBlnVC/KenEF)to'+EV:2F!,17+E2@8DfQtDATDj+Df.0:$4R=O$6pc?
+>GK&/i#4*8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh>+3A*!B
-Z^DQF(HJ4Aft;J9i,+DBQS?8F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>ASu$iA0>i3ARfFqBl@l3
Bl8$(B4Z+)+:SZ#+<Y?+F!,17FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-FE_;-
DBMOo3A*!B+CT.u+E2@8DfQtDATDj+Df0V=De:+a/e&.1+<X9P6m-PmDfTE1+D#e>ASu$iA0>i3
ARfFqBl@l3Bl8$(B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC8g$,H0Jj4G+<Ve:
@;[3.ART*lDerrqEZeq<FCf?#ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.1a%!_Blmp-+D#e>ASu$i
A0>T(FCf)rEcW@FD]iG&Anc'mF'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(8ge[&@ps6tDJpY<ART*l
Ci=3(ATAo8BOu$5+B3#gF!,X;EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2FC6X/$6UH6?tX:o@WPp"
@;]Tu?t=4tATV<&FDi:@Eb0E*DKI"CBOr<'BldrrDIdQtDJ()1Aftu&G;!lNA0>>qDIIR2+Cno&
@3B9%+Co1rFD5Z2@<-'nF"Rn/%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki+EVNEFD,B0+Eh=:F(oQ1
+E(j78l%htEb0<'F<GjIF`JTs:IH=B@<6O%EZet.Ch4_uGrcBA%144#+<VdL+<YK=@:UK.B4Ysl
Ea`c;C2[W1%13OO+<VdL+<VdL:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+Gp%-=B5)F/ATD?m+Co1r
FD5Z2@<-'nF!+n/A0>r,F`\`u+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E+E(d5-RU>cAp890FCcS0
E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(+<VdL+<VdL%144#+<VdL
+<XEG/g,1GF*(i2F<F0u@;]TuATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O
@:WneDK@IDASu("@;IT3De(M9D..L-ATBD;C1\h&$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:Wne
DK@IDASu("@;IT3De(M9De(J7C2PC.$4R=b+<VdL+<Ve%67sC$ASc9nA0>u-AKZ#)B5)F/ATD?m
+Co1rFD5Z2@<-'nF!,F1H"h//+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U+EVNE@;^?5@VK^gEd8dA
DI[U%E+*j&@VKXmFEo!GATMp$B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$6UH6+<VdL
+>=s"0JG4(4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJFBkh]:%13OO+<VdL
+<VdL:-pQUFDi:EF(HJ4Ch+Y:@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'nF!,aHFWbmBCht5-@<Q3)
FDi:CATT&:BOu$'%144#+<VdL+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,ATAo:ATDj+Df-\9Afs\g
@;]TuFD,6'+ED%+BleB-EZf(6+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%ATT&*Bk)7!Df0!(Gp$!R
5t"LD9N`KPDBNA*+E)(,ATAo.%144#+<VdL+<YT5+=D)DA7TCaF=.M)+<VdL+<VdLA8lU$F<Dr/
76s=;:/"e<%13OO+<VdL+<VdL:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t8g&.cB5)F/ATAn&
$6UH6+<VdL+ED%+A0<7<Ch.'j@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<BlbX2$4R=b+<XET<(/hj
BkAK5Dfm12Eb-A3DJXS@Bl8$(Eb0<6ARlotDBNtBDJj0+B-:],EcP`/F<F19/hf+)@;]TuDIn$'
EX`?u+<Yi=EcYr5DK?q=Afs\u+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(Bk;?.@<3Q%F_u(?
F(96)E--.D@;]TuEb0'*@:TfS+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k+A*b:/hf+)A8,OqBl@lt
EbT*+/g+,,AKXT@6m->TDKTB(+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0%144#+DG^9FD,5..TCP2
DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b.Nh>+3A*!B-Z^D?BOPdk
ATJu9D]j.8AKZ,:AKYo'+EV:.+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!@<-W9?r03g75A6nAoD^"
ARlp)Df'&.%144#+CSeqF`VYAASuU2+EVNE?ugL5?nNR%DJ<U!A7ZlnBOPpi@ru:&F!+n3AKZ);
Ec,H!+E(k(+EqOABHU]'G]e+?3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78F(Jd#@q]Fp/g+,,AKZ&*
FED57B-;8/Dfol,+C\n)Eb0<6DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7F<F-tGAhV?A.8kg+<Y*'
G%l#/+Cf(r@r#drB-:f)EZek4Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(+B<;n@rGmh+DkP4+Dbb/
BlkIi:IHRO+CS_nCh\!:+:SZ#+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#D.RU,F!+q7F<F1'F!+J#
Bk)'lAKZ&:E,]`9F<G7*F!+n-G@>c<+E1b0FD50"/e&.1+<V+#+=\LA2'?gJ+=AOE+CSeqF`VY9
A0>u4+EMIAF<GU8B5)F/ATD?m+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`AU#>/EcQ)=F!)lBEcQ)=
F!,17+EV:.+ED%+AU#>/G]7\7F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&@;]Tu@r,RoBkD'jA3(h\
.X,oODJ(=>Ed2XJI4cXQDJUFC-OgD*+<XL$BlA#78l%htG%G]8Bl@m1+DbV2+ED%+AU#>/EcQ)=
F!,+6+EVNEFD,5.FDl+@Ch7d$C`mh?@;mh.$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+
0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1
.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8Bl7F!EcP`$FDQ4FAU%^$
F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@+@KpaARfg)@!d6.+>,9!+CKVG
?m&ukAnc-sFD5Z2F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l+:SZ#%144-+<X*`BlkJ-
Df'?"DIdf2A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&Dg*=5Ec6/CATAo4
Df?hAE-!W@$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D8g$o=C1Ums+@KpR
FD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa<+T/S@UX=h
A0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)+DPh*Ch\!&Eaa'$
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$
03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-
DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P
9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&
A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/r
EZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk
+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D
8PUCDAU,D+681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[
F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^
/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b
+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/
%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p
$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1
Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK
+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6
Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n0J5%%
/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*
D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!
ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<
Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!C
F!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(q
E$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<
Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'
A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*
ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u
%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,
Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlot
DBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-
+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?
+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)
D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H
:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:
F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM
+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y
$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjD
BOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f
6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&
A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r
+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(
@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.
+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%
DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO
+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">
G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`
Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO
,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO
+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'
EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#
+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&
$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$C`jif3\OKSATDiF
C2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.
E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#
+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>+FZXN:Id';AQWPb
=)`D$CbBF:Et&I!+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSek
Df0VK%144#+<VdL+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#
$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-
2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6
Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@
G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?
D/"6+A0><%F(o9)D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%
+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf
>n%,`+<VdL+<VdU%144#%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'
ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,
AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4
+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5
.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o
+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc+<V+#
+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7
Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2
FCfK1/g)8Z%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@
?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#
+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#
+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL
:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH
+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>
DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<
De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2
$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDh
Des-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImis
FCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</
F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U
+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo
6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$
ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL
+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_
1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_
Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q4
0..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b
.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*
@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(
Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`
+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".
ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9
B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#
F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%
A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)
@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4Ysl
Ea`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#
+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@
A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu
@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/
A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]Ul
ATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U
+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]
3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e
%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdS
Eap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL
+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL
+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL
+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+
@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<
A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+S
Bl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#
ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_
:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9u
AKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1
DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:G
BOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'
@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)AD
F<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL
+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G
.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg
+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-
E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1
@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL
+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9o
FDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5
DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h
+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.
BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,Oq
Bl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^h
A0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9n
A8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;
DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.
@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);
E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%
D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL
:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k
+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ
9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$
B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXh
FD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8
@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4
FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1
ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*
@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,Oq
Bl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1
+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'
Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.
+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6
@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s
/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o
?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-
Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:
Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%
0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p
/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+D
E,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"
A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>
D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&
DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0
D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h
+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.
Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/
ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8
D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&k
ATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTu
Df-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE
7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23
Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b
/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8
DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8
CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1
FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a
/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU
0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*
Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,
Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,dd
FCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSek
ARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;
Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNE
Df0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`
DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYo
DKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.R
Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*
Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh
5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5
Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D
@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@
DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5
?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-
B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f
89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%
$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YND
F*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6
/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu
8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4
DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-
E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr
+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/
?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He
/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2
@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qC
I:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBO
A79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@
?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OC
Afu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"F
AKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(
A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rm
ASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)
%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#c
F(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@ID
ASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*
1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$
ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*
ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4
+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-
+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-
FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@
;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;
G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[0
0.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs
/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\
F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7
F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fq
Ec#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`R
A8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22
F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#
F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%
DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*
G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1
+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)
@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4
Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1r
FD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@lt
EbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2
@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>
:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6
A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"
+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oU
A0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[Wn
De!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@
Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5
F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9
C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:
Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#
D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#
+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6
ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ
%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I
%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM
@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:
E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!
$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdk
AISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*
D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/
Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda
+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b
/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-
EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+
G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(
Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%ht
F*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5S
A8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+
ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,
+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3
$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=t
F_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&
AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH6
8l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$
+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@
FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.
@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.
+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>
AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?
+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u
+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-X
F_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16
Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8
E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU
0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0
+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC
$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LP
DJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?
@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWs
AKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu
+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8
E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47
G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%
BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%
DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o+
+EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+
GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1
DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhK
ASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!
+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]
H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$
+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&
A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<Wsd
C`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9
CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u
+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LA
C2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg
%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje
/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht
+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E9
05>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LP
DJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA
<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCg
DfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't
+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(
F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,
Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$
Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(
ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1
ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(
F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8
E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31
F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*
$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*
+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8p
De(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b
.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7
DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5
?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63(
$6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1
GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%
F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$
A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*
Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc
%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,
E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./
+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/io
EZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq
9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b
/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2s
AKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4
Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o
+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT2
9H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,
+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^E
E&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.
Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL
+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$>=-pFDl2F
C2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5+=+>"^HATf1EGA2"F%13OO,9nEU0eP.4
1,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@<+ohcDfTB"
EZf:4+E)4@Bl@l3@rGmh+EV%$Ch7Z1Bl5&%E,]B+A8-9274o]r@<2kb+<Ve9AS#a%@q]:gB4YU+
+B3#c+DbJ,B4Z*+FCAWpAKW]_+DGm>DJs_ADf-\++EM77B5D,g$6UH6E+*Bj+EVNECh7$uAKZ&5
@:NjkAoD]4Ap&3<Eb-A'De*F#/e&-s$6Uf@;f?Ma+=_MOA8bt#D.RU,ARm85@rGmhF!,.)G%De*
AS#a%@:Wn[A0>u4+EV%$Ch4_D1+j"C%144-+B3#c+D#G4Ed8d>DfQt.A8lU$FC65)@<3Q#AS#a%
@:X+qF*(u(+EVNEF(fK9+:SZ#+<Yc>AKYl%G9C9a5uU<B<D?:t+E1b0@;TRtATBC4$4R=e,9n<c
/hen51E\7l8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh)sD/aE2
ASuT40eskcDBN>%GAhM4F'p,.Dg*=;Ders*+EV:.+A*ba3?^F<1ghGIH#n(=D'3nAEbTE(/g+,,
Bla^j+<Ve?ASc=,+A,Et+Co%lC`mq9FD)e=BOr;qBl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-FE_;-
DBMOo3A*!B-Z^D=DIal$@<-0uATA4e+<Ve!-Z^DAG][M7A7]9oE,oN"Ble!,DBNY2FCf)rEcWiB
$4R=b.Nh)sEcP`$F<Ft"@Wl-%D/X<#A0><$B6A'&DKI!Q+E).6Gp%3;CLqQ0@q]:k@:OCjEZf14
F*)IU%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<<ag#_@;^007:^+S
Bl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuulC2[W8E+EQg
%13OO+=\KV6tp[Q@rri(AS,XoBln'-DBNA,E+NotBm:b/A7T7^/e&-s$6Uf@+DkOs:K&o?Bl8'<
+E1b2BQG;)A7T7^+EVNE@rH6sBkMR/@<?4%DBO"3@ruF'DCuA*%14=),9S]n0J5+'/Kdf,G%GN"
ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+<W-V
:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8
F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=ATDj+
Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/$6UH6
+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4@qB1b
DJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA
3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO+<W-V:1\Vl8p,)u
FCfJ8CggcqE+EQ'@:Wn[A0>8[F(oN)8oJ6VBlmp,@<?'5E+EQg/Kf+GAKZ).AKYMtEb/a&DfU+4
$4R=bC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9S]n0J5(&
/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+<W-V+B;<5F!,17
+CJr&A1hh3Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j785rPb/e&-s$6UH@+Auc_
ATD@"@qB^(FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk/e&-s$6pc?+>GK&/heD"
+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+<W-V?t*b[FC65#
@:O(qE$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5DK?q=Afs]gE-ZP:EZf1,
@WNZ#A7T7^+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<@<?0*-[oK7A8c@,05"j6
ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)
$6UH@+Eh=:F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO,9nEU0J5@<3B9&A/KdMo
@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57F'p,3ARfgrDf-\+A7T7^
/g(T1%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V?u9dt?m'N%@ruF'DBN@u
A7]:(%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO
+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V8l%ht
AoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss3%cmD
+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0sDIdI+
/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D+Dtb7
+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$
/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#FED)7
%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?+>>E.
/ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=/Kd?%
B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9
+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN
3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,Rp
F'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0
+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20
F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6
@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4
D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo
$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1
@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<
3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,
ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdk
ATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq
+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU
0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&
A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l
:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2
A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO
+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:
Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In
:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu
?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(
GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E.
/iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUj
A8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L1
6q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhu
Bl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8
D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,
Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8
E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)
@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#
+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6
E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57
B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm
+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'
F"Rn/+:SZmDe*fqEc#kQ0ht%f.V`m4E+*d(F!,NU/KeS8AmoguF<G+.@ruF'DIIR2+E1b0@;TRt
ATDiE%15is/e&._67sB[BPDN1Anc'm+DGm>F`V,)+EVNEF(KG9+EV:.+<Y3+AmoguF<D]:Bk)7!
Df0!(Gp%'7Ea`frFCfK6%15is/g,7E@VfTu+DG^9FD,5.D..L-ATAo*Bl%?5+BN5fDBL'1+<YQ5
G9CF1@ruF'DIIR2+DGm>@rc-hFCetl$;No?+EV:.+<YW3Ea`frFCfK6+<YB9+EV:.+<YN0F*(u6
+D,>(AKYE%AKZ,:ARlp*D]j+?ARfFdGp"5OBOqV[:-pQUE+*cqD.Rg#EcW@8DfQt/+E1b0FD56-
Cgh?,A8,OqBl@ltEd98[<+ohc+Eh=:@N[(0E-#T4.3N,/D@HqJ67sBiAKW*<F`V,)+<YcE+<VeD
De*QoGp"5K@<,dnATVL(+<Y`:FED57B6,1<+DG^9+<YB9A8-4$A9D<s%15is/g+\=@ruF'DIIR"
ATKIH+AH9cFCfJ8+D,>(AKYr#Ea`frFCfK6+Ceht+E).6Gp$R-+Cf(nDJ*Nk+C]U*$;No?+D#(t
FD5W*+EV:2F!,(/Ch4_tDIal1ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AM+E!:-pQB$;No?+B3#c
+DkP.FCfJ8Anc'm+Ceht+C\n)Eb/a$ART[lA0?)1FD)e=BOr;r@;Ka@%15is/e&._67sBjEb/[$
ASkjsFC/HkDe*2t8khTM<(0\l@;9^k?O[?;67r]S:-pQU=$]_Z8PVc:+CT)&+EV:.+<YW3Ea`fr
FCfK6+CfP7Eb0-1Cj@.>BleB-A0><$AKZ#)EHPu9ARlomGmt*U67sC&BOr;Y:IH=HH#n(=D(Zr&
AfuA;FWb^9D/XT/+CT/5+E(j7FD,6&+A,Et+EqO9C`m5.@<6*7+B`W*%15is/g+Y4DBL'C@:j(e
Gp$O+A0>;kA8-."Df0!"+E1b0@;TRtATDi7@Wcc8+F.mJ+<Y0&DJjB7+ELt'AScW$$;No?+ED%1
Dg#\7@s)g4ASuT4E+*cqD.Rg#EcWiB$4R>:5uU`O;G]YW9iF29+>=p!+>=63%15is/g+,,AKYT'
Ec#6,+E(j7FD,B0+E1b0@;TRtATAo*Bl%?'Blc<E$;No?+<VdL+DPe&D.OhO+=M>WE+LI@A7]gl
EbTK7Bl@l34!8]TCis:u$;No?+:SZQ67sB'+<VeADIIBn+DGm>@3B`%Ch[E&8g&"[D.O.`:-pQU
+<VdL.!0`RALSa4ATM@%BlJ0.Df-\.De!p,ASuU2+EV:.+E1b0@;TRtATAnF+EVmJAKY].+ED%5
F_Pl-A.8l@67sB'+<VdL+<YT?Cj@-O.qrmCAS5Rp.3N>G+CfP7Eb0-1Cj@.7G\(B-FCeu*DffZ(
EZfILE+O)5GA1l0%15is/g)8Z+<VdL+C\n)E+*g/ARlolF!+t+@<,ddFCfJ8Ch[s4F!)lPARuup
E-,MtCh5%J%15is/g)8Z+<Yi9Cis;3BlbD*DBNM8ARfk)@:F%a+A*bfG]7\7F)u&6DBO%7@<<W2
Ec5K2@qB^(@3B`%Cis:u$4R>.;aX,J3&Mg$+<W`g-nB"LFCf)rE[`,TBOu'(0d(U[AKYE&@qfX:
2'?UN+CoV3E-!-M0Hb:S+>G;f+<VdL+<VdL+<Vdg+>Fu]%15Hu:g$7R6W?iZ+?L\o.qrmCAS5Rp
.3N,=D/aE2ASuU2+Cf>/Bk:ftBl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e+<W`g0eb9j$:IZW
<D>nW<(';F<$47F-nB"LFCf)rE[`,TBOu'(0d("@@ruF'DIIR2+CoD#F_t]-F<G:=+E2IF+=Jod
DfQsT.3K`U+?L]#%15L!6WHiL:/k:d6rZ]"4!5q%Bl8$(B4Z*4+EqO1FD)e8Afti2F*),.Bk:ft
A8bt#D.RU,+EV1>F<Dte0KaVC1,Up<+<W`g2DGXJ6rcrX7R9C@:Jr;s+=JaSDKKH&ATB4BDdmHm
@ruc7A9Da.ARlotDBNk8AKYf-Df?h<@<6K4-o!i04>J`I.3K`U+<VdL4!6C7%15To<(9/@<)6C7
+?L\o.qrmCAS5Rp.3NhQEb'56Eb0?5Bk;I!A0>T(+E)./+Dbt7E$0+.F)rHP0eb_84>JTI3%5sm
+<W`g1,U`p$;a`%7R9C@:Jr;X4!5q%Bl8$(B4Z*4+EqaEA9/l7FDl22A0>T(+E)./+Dbt7E$0+.
F)rHP0eb_84>JTI3%5sm+<VdL+?L]#0JEqC;FOPN8PVQA73E^7+=JaSDKKH&ATB4BGA(Q*+>G!\
Bl.F&FCB$*F!+n3AKZ&&G%G2,Bl5&(F_u)=+=JodDfQsT.3K`U4!66e$:mH]846HP:`pl'4!5q%
Bl8$(B4Z*4+EqL1DBLYV@3B5lF(c\1F!,FBAS,Y$ARlp*D]iS5D/aP=-nlc^EZd(c+<VdL+?L]#
%13OO:-pQU;GU(f7Sc]G78b7BF!,%2E--@J@X0),AS,@nCih9P8S0)ZF<G:=+EM+9+EVNE@3?t5
E+*j%.3M5*@rH6sBkMR/ARlnm$;No?+D,P.A7]d(;GU(f7Sc]G78b7HG%G]7Bk1dr+Co1rFD5Z2
@<-W9Ci<flFD5Z2F!,(5EZccICi_$JB4YslEaa'$A0>r'EbTK7F!(o!;GU(f7Sc]G78b6i+=L`5
@<,ddFCfJA+ED%(Bl[cpFE8QQD/=8B+EM%5BlJ08+EVNE8g%_aCh.*t+?L\T$4R>;67sC&H#RJ-
@;I'(Df0-'E--@JF(KH8Bl7Pm$;No?+Au!2<(9YW6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7
-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFdIW]^CE\D0GA9)U,F<D#"%15is/g*GtGp$O+A7]9o
E+*cqD.Rg#EcW@3Eb-A7FDl22A0>T(+EV:.+DkP.FCfJ8Anc'm+EqL1D@HqJ67sBjEb/[$ARlol
DIal#BleB:Bju4,ARlp*D]hYJ6m-#SEb/a&DfU+GDdmHm@rucE+<V+#%15is/g+4];GKeY7lhc:
BOu'(A7]@eDJ=!$+A*bfG]7\7F)u&6DK?q0AKYJkEb/j*C`m.qDfp.EFD,5.4!8$H@<,ddFCfJ8
%15is/g,7LAKXT@6m,uXA7Zl3A8lX!@VfU)+EV:*F<GO2EcYf5+EV:2F!,OGEbTE(+DGm>Ecko,
D.RU,@<-WG%13OO:-pQU6VgN];FsAL<$47F-t?q!Ea`I"ATB4B4!6h*C`mb4B4uC.+ED%7ATDs*
A.8l@67sBT=\qC^5tsdI78b6i+=JaSDKKH&ATB4BFD,5.@;^.1ATAnT+>bh_$7QDk%16r\DJ<]o
F*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@lt
Ed9#A$<BSn;b9b[4ZXrF/hen52BXRoA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]
9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A
%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)
Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKi
A8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16ig
A7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"
E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<
@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I
;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIa
F<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et
+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2
DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065
Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1
BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<
<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4
+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f0
6?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#
@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%ht
Cggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1
@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2
+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De't5%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5%14Nn$>j3hBkCptFD>`)A8bt#
D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</
Bl@l:%16-);H$._:-CW\-S[5-/i"d`$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S
7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$K
C3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEB
Ado)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ
/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r
@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf
;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQkDdtG#F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J
5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3
AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;@rH7,
@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16ukFCep"DejD:FD,*)+EM47G9CR;G9D!G+E_a:
+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).AKYMtEb/a&DfU+a%13OOC2dU'BHS[O@:Wne
DK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+
BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<
%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;
<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:
%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E
3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hen52BXRoA7]p3%15R#
9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp
6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKD
Et&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN
78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3
EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>
De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%
F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,
@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X
+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*+
+EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*
Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065
Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$
DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:Wne
DK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)
@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8
AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c
+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[
8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9
BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOA
A1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2o
F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/
B4W_*$7QDk                                                                ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2E;m70d&4o0f:(/3$9t1+>Yer1,C%.0d&2-+?),"0eje/3$9q0+>Po!0f'q.2BXt%1-$I30d&53
+>Gl!1H-F22]sn68l%iA<CokP84c`Z:Jt>9ARf:hF<F1O6m,r]Bl%<&BPDO0DfU+GCi<rY:IJ/X
:J=\R<CokP84c`Z:Jt>9ARf:hF<F1O6rZrX9N*'CF_PZ&+D>J1FDl2F+Dbt/8l%i^Ddmd!Ecu#)
?Y+7uDfTo+FEhn:F_;h5DeC2$DIal1ATMg/DKBB1<)5nX?V4*^6r-0WD.I^+F`Lu'+D,P43Zr*X
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\CBf6r./^:IITH6S<4d
<)5nX?V4*^?Ys=pDfp)1AKYT'E]P=VFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl
05Y-=FCfJG<)5nX?V4*^/o>-4BleB7Ed;D<A7oIkATD3q05>E9+>"^GBOPdkAKYZ#F*)>@H"^o5
FDl2FC2[WnDe!EkDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed;D<A8kstD0'6!Amogu
F<G+.@ruF'DIIR2+E1b0@;TRtATDj/@;]dkATMs.De*fq@r5Xl+DkP)BkCptF<G16EZdtM6m,oK
A8c@&@;]dkATMs.De*Bs@s)X"DKKi+@r5Xl+DkP)BkCptF<G16EZdtM6psg<<D>nW<$5U[A8c@&
@;]dkATMs.De*p-F`Lu'E+*6n@;[3)@;]dkATMr9AoD]48l%iR:K::[73H#LA8c>          ~>
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
zz=:zz,'amp uses valdate wex wrep write writenoun''),<<;._1 '' jodmake DDEFES'
zz=:zz,'CS DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 DUMPTAG ER'
zz=:zz,'R0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR01'
zz=:zz,'58 ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEAD'
zz=:zz,'END JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SO'
zz=:zz,'PUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createm'
zz=:zz,'k ddefescmask dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntsta'
zz=:zz,'mps dumptext dumptm dumptrailer dumpwords extscopes fap fmtdumptext'
zz=:zz,' fromascii85 getallts getascii85 halfbits htclip jnb jscript jscrip'
zz=:zz,'tdefs makedump makegs masknb namecats nlfrrle nounlrep opaqnames pa'
zz=:zz,'rsecode prefixdumphash putallts rlefrnl sexpin sonl tabit toascii85'
zz=:zz,' uqtsingle wraplinear wrdglobals writeijs wttext''                  '
zz=:3131{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`32]t%%0fC^@C2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve8
@Wik:+<Ve8Cht5'@:O(qE$0=8EcYr5DBNh*D.Rc2%15is/g)8Z@V97o+<VdLB4Z0-DdmHm@ruc7
Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;CE%15is/g)8Z@W$!)+<VdL@UWb^F`8I@@;TQuCh[s4
F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;AS`J3+<Ve;ASbq"AKZ28Eb'5B+EV19FE8uUB6%p5E-!QQ
D.-ppDf[HPATT&)ATVL(@1<Q=67sB'+Co1s+<VdL+Co1rFD5Z2@<-W9Bk1dmFD5?$@psInDf-!k
:-pQU+<Y34C`jiC+<Y3/@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+CoG4
ATT%;+EM+9F!,"-@ruF'DIIR2+E1b0@;TRtATDi$$;No?+<Ve>A7]_$+<VeCBleA=B6%p5E$/S,
A0>r9Blmo/A7]^kDId<rFE7lu:-pQU+<Y<.F<D\K+<Y<.F<GdGEb'5B+EV19FE8uUD.-ppDf[HP
ATT&)ATVL(@3B0&Df$V-Bk)7!Df0!(Gmt*U67sB'+D5M/@WNY7+EqaEA0>;uA0>u*F*&O;Ci<ck
C`mV(D.Oi1AS,LoASu!hEt&IO67sB'+D5_6+<VdL+CfG'@<?''@;]TuEHPi5Gp$a?Dfp#?+CT.u
+EM[>FCfM&$;No?+<VeD@;BEs+<Ve>ASu("@<?''8g&1bEbTK7F!+n/A0>DkFCAWeF(HJ)F_u)=
%15is/g)8ZD/O/4+<VdLD..=-+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is
/g)8ZDIn$&+<VdL@rc-hFCcS4ATo8-Bk)7!Df0!(Gmt*U67sB'+E(d5+<VdL+E)41DK?q/DIal"
Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<YW3@r#Tt+<YW3@r!2tBk)7!Df0!(Bk;>p$;No?+<VeG
F`\`K+<VeGF`\aMDfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^))DKKe>A8,OqBl@ltEd8*$
:-pQU+<Y]9B4N,-+<Y]9B5)F/ATBGHDK9<$BleB-EZed5A8,OqBl@ltEd8*$:-pQU+<Y]9F*(q8
+<Y]9F*)>@AKYetF*&O6@:O(qE$/Y2ART[lA0>?,+=M2;@r#U(%15is/g)8ZEd2XJ+<VdLEb/m+
Cgh?,AU&07ATMp,Df-\=ARTUhBFP;D67sB'+E_a:F!)SJ+EqaEA9/l9F(Jl)@X0)?DfTB0+CT.u
+EV19FE7lu:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IH=:EcQ)=F!*.j
0J+t83@PCE%16T`@r,RpF!)SQ@;9^k-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,7EF))n,A7TUr
+Dbt)A7]9oAnc:,F<G16EZdss3A*!?+:SZuAT;j,Eb-@@C1_0rATJu7AS5S!-QjN@$4R>;67s`u
AT23uA7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$Bl5&8BPDN1F(Jj'Bl@l3BOQ'q+ED%0@<?'k+Co%q
Bl7X,Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh@j$(?Ci<flCh4`,Dfor=+EM+9+CoV8Bl7Q+8g&(n
De<^"AKYf-@:X(iB+52C67sB/.OdMA+A#%(8PUC.:-hTC+A#$o:K%]0%15is/g+tEDIjr&AS#C'
+Cei#EbSrpAKZ#)FEMVA/0K%C@N])sA0>]&DIjr%DIdet$;<oP3\`=8@4hur6W-'.0f+/b/e&.e
5sd^q3I>0e%15I#9L_0+6W,I/7L]\6$;No?+DkOsEc3(A@rc:&F<GL@FD5Z2+Cf>#ATJtG+EVNE
@:WmkD/XH++CSek+CQC1ATo88@VTIaF<G(3A7Z2W:-pQU@;]TuD/Ws!ApGM@BOr;uDes6.GA1r-
+Co%qBl7X,Bl@l3De:+d5snOG<*<$d%15^+6W-KP<'<8t0b"I`5u^9T4ZY>R%15X*9h[]21,B@H
=A;IP3\iN$$<0Gr<'<8t2%9mZ=]@gQ3\iT&$;Efa912QW:-CWn2[p*o<(8i13\iZ($;al)85DuD
3\i])$<'eq4ZYAQ%15^+:JO&61GK=G8PiPb69R@c1(=R"$;No?+DkOsEc3(BAU&;>FEqh:Et&IN
5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B<E)FI/5TJK
85Du3;c-4>8lJM\/4iZ@:-oBs%15is/g,(AC1Ums+Cf>#ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U'
:K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=@ruF'DIIR2+EM+1Afu,*An?!oDI[5e
$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!@<6K@+Co&&ASu%"3ZqL";FE'878m/:
7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO
:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H:.#Ht@UWec@VS%e><3lY/g+@Z+=\us
+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhsCh[a#FCfJ8@q]:k@:OCjEZc\OE+*j%
+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W7TW/V+F>4Y03fk6$;a#f84,pG;a!/h
+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA@V''m03fW0BOPq&+Co&&ASu$mDJ()1
DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS
$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)
FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&-RLu*+=\ud><3lW/h^H^+Ab@'845m?
-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:EZf1:@psInDf0V*$;No?+DPh*F*VhK
ASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.
De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@@<6O%E[M;'8l%iO;GTbF3biSDF*VhK
ASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=rA93$;FCf<.@<?0*-YdR1F`V,7@rH6s
BkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA8PajAPPQE+=_,EA8PajAKYJ7/Kf+EEbTK7
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
ATMp(A0>AqCM7-tBOkt!+CoG4ATT&*F_u)2ART+\EZf"2Ddmc1C3FJ;D..3kA9Da.+E(d5E,oN%
Bm=02D/a/sF(c\8F`\aFF`_8;-RgSp4?P\X?SNZN+C]J-Ch-mfDe*ZuFCfK$FCcS(F_PZ&?Z:.0
FCfK6-RgSp4?P\X?SNZN+C]J-Ch.:!A0>W*A0>W*A8PajALAoX-p01/0I\P$4?P\X?SNZN+A,Et
6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=Wg=46sjkAF(KB8ARo.ZEcQ)=F'j$6F<FOY
6r./^:IITH6XO\@+B2-):L?^i6sjeA+D>J1FDl2FC2[W*BPDO0DfU,<De*Bs@j#N)A8kstD0$h:
@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$72'aq2
1,CU@0Jb=<3&WHI3A<EM3?U(21,CU@0Jb=<3&<?K0JbOD1a"P-1,CU>1,ggD1c@<N3AEEL1E\G,
1,CU?1GCF<1c[6L0KD'J3?U(21,CU@0Jb=;2D[-H1c.*K3?U(21,CU?1,pmH3AEHP1,:^E2'=Y.
1,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t11,CU>0JtI>2).$H2`<ZS3$9t1
1,CU>0JtI>2).$I0ek[C1*A>+1,CU>0JtI>2).$H3&<<F2]sk01,CU@0Jb=<3&EQR0fUmG2BXb/
1,CU@0Jb=<3&*EQ1b^gE+>PW+1GCU>3A*-G2)-pI1c[EP+>PW+1GCU>3A*-H3&NKO1cR?M+>PW+
1GCX>1G1L=2`NKG1GUXB+>PW+1GCX>1G1I>1cI9G2`!-F+>PW+1GCU@0J51>1H$sJ1,q$J+>PW+
1GCX>1G1I>2).$E2)[0J+>PW+1GCR>2_HsB2`WfP1,V!51,(I>0JkI>/i,CE3AWTK3B9&A1,(I>
0JbCA/iGLB1,:^I1,h!31,(I>0JkI>/i,F@0JkL>0Jka31,(I>0JkI>/i,:@3AEHK3A`W:1,(I>
0JYCC/i5:A1,UmK1GU^.1,(I>0JkI>/i5OG0JkdD3&N]=1,(I>0JkI>/i5OD1H$pC1c@051,(I>
0JYCB/iGOE3&N]N2Dm951,(I>0JbL=/i5CF0K:aH2`!H:1,(I>0JkI>/i,CB2)mBI0Jt[01,(I>
0JbID/ibpH2`NQJ2)R661,(I>0JkOB/i>IA2_m9K1,^m11,(I>0JkOB/i>IA2_m9K1,^m11,(I>
0JkOB/i>IA2_m9K1,^m11,(I>0JkOB/i>IA2_m?J1H@E;1,(I>0JkOB/i>IA2_m9K1,^m11,(I>
0JkI>/i5OE2`NNO0fCp41,(I>0JkI>/i5OB3B/iL2DcO30JYF<1GLmB1c@-D3B9&X0K:110JYF<
1GLmB1c@<N1H73N2)QL30JYF<1b^^<1bpdD0JGF>2E;m80JYF<1b^^<1G^jH2)$sF0Jst.0JYF<
1G^^;1c7'I0f_!K1,g=20JYF<1b^^<1G^mC2_d0J0fL410JYF<1,:d@2).$M2_m-G2]sk01,CU@
0Jb=;2`*3B1GL^H2BXb/1,CU?0K1UB1GgjB2*!EN1E\G,1,CU@0Jb=<1GLUE2`EKH2'=Y.1,CU@
0Jb=;1Gq0I2`!HN2BXb/1,CU@0Jb=;1H%0H3&3EN0e"Y%4>J$7,Vh&/1GCX@2(g^@3AWHL1c@?P
+>PW+1GCX@2(g^@2Dd-E0f1jJ+>PW+1GCX@2(g^B0fM*I2D['D+>PW+1GCX@2(g^C0Jb^D3&E<E
.4cl01*A@u1,(I>0JbFD/i5CB3&<9K1H?R50JYF<1GUd>1bgsM2)@6L2`Dj70JYF<1G^^;1c7*F
0fLmK2E)a60JYF<1GLmB1c.'L1GLjF3?U(21,CU@0Jb=<3&`TJ3AEEO1a"P-1,CU@1,U[A0K1aA
1H$[5-p01/0I\P$4>J$60dJM.1,CU>0JtI>2).$I0ebRF3?U(21,CU>0JtI>2).$I0fM'J2'=Y.
1,CU?0JkC?1GpsB2)$gD3?U(21,CU@0JY7=1bggG2).'J3$9t11,CU>1,CO?1GUjF2)R'I2BXb/
1,CU>1,ggD2)I'E0JYRH+>PW+1GCX>1G1OC3&riN2`!BI+>PW+1GCU=1bL[C1,CdG0KD'N+>PW+
1GCR<2(g^C0fLpJ3&i]K+>PW+1GCR<2(g^C0fLpK0f(^E+>PW+1GCR<2(g^C0fLpK0K(dI+>PW+
1GCX@2(gaC1H.'K1,CpM+>PW+1GCX@2(gaC1H.'K2)I$G+>PW+1GCX@2(gdF0K1aD3A`HK+>PW+
1GCX>1bLRE0K1jK1-%<M+>PW+1GCX>1bLRD3&NBD2`3BN+>PW+1GCX@2(gaD1,CpG2D[?K+>PW+
1GCX@2(gaD1Gh$F1,V'O+>PW+1GCX>1G1I@1H.$E0KCjF+>PW+1GCX@2(gaC1H.'I2)7'F+>PW+
1GCX@2(gaC1H.'I2)7'F+>PW+1GCX@2(gaC1H.'I2)7'F.4cl00I\P$4>838-p014/1<V7.4dS8~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
