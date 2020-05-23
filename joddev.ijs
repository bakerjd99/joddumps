NB. JOD dictionary dump: 23 May 2020 13:25:41
NB. Generated with JOD version; 1.0.2 - dev; 1; 15 May 2020 16:44:54
NB. J version: j901/j64avx/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:15:50
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|225346394776877887587393570006481670086|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BEGININDEX=:'\KeywordTok{=::=::}'

DEFAULTPANDOC=:'"C:\Program Files\Pandoc\pandoc"'

ENDINDEX=:'\KeywordTok{=..=..}'

FAKETOKENS=:<;._1 '|=::=::|=..=.. '

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC grplit ifacesection ifc setjodliterate'

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JLBUILDTEX=:108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10 109 97 107 101 105 110 100 101 120 32 126 35 126 103 114 111 117 112 126 35 126 10 108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10 108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10{a.

JLINSERTIFACEMD=:'`{~{insert_interface_md_}~}`'

JLOVIEWSUFFIX=:'_oview_tex'

JLOVIEWTEX=:37 32 116 104 105 115 32 106 111 100 108 105 116 101 114 97 116 101 32 111 118 101 114 118 105 101 119 10 92 115 101 99 116 105 111 110 123 92 116 101 120 116 116 116 123 126 35 126 103 114 111 117 112 126 35 126 125 32 79 118 101 114 118 105 101 119 125 10 10{a.

JODTOOLSVMD=:'1.0.2 - dev';01;'15 May 2020 16:44:55'

JODVMD=:'1.0.2 - dev';01;'15 May 2020 16:44:54'

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit sbtokens setjodliterate'

THISPANDOC=:'"C:\Program Files\Pandoc\pandoc"'

WRAPLEAD=:'>..>'

WRAPPREFIX=:')=.)=. '

WRAPPREFIXTEX=:'\RegionMarkerTok{)}\KeywordTok{=.}\RegionMarkerTok{)}\KeywordTok{=.}'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


addloadscript1=:4 : 0

NB.*addloadscript1 v-- appends or replaces a script in the load script section of startup.ijs
NB.
NB. dyad:  clJODLoadScripts addloadscript1 (clGroup ; clPath)

NB. insure we have text
if. 0=#x do. ok x return. end.

NB. cut into lines
ldl=. <;._1 ((LF={.x)}.LF),x -. CR

NB. search for group name - can occur at most once
NB. searches only group names ignoring path file text
msk=. (' '&beforestr &.> ldl) e. 0{y
if. 1 >: +/msk do.

  NB. load script name and path
  scr=. <;(<'  ') (1)} 1 0 1 #^:_1 y

  NB. add extension if missing
  if. -.IJS -: ;(-#IJS) {.&.> scr do. scr=. scr ,&.> <IJS end.

  NB. if name exists replace it else add it at end
  if. +./msk do.
    ldl=. scr (I. msk)} ldl
  else.
    NB. find ) and insert before 
    msk=. 1 ,~ -. (ldl -.&.> ' ') e. <,')'
    ldl=. scr (I. -.msk)} msk #^:_1 ldl
  end.

  NB. return modified 
  ok }. ; LF ,&.> ldl
else.
  NB. errmsg: load script is not unique
  (jderr ERR00400),0{y
end.
)

dbquoteuq=:]`dbquote@.(([: -. '""'&-:@({: , {.)) *. ' ' e. ])

formtexindexes=:3 : 0

NB.*formtexindexes v-- format latex index commands from global marks.
NB.
NB. monad:  blcl =. formtexindexes blclMarked

NB. extract =:=: =.=. marked text 
inames=. ;@('{}'&betweenstrs)&.> (-#ENDINDEX) }.&.> (#BEGININDEX) }.&.> y

NB. find any indirect ()=: and multiple ''=: assignments
'pma pia'=. I.&.> <"1 ''')' =/ {:@(-.&' ')&> inames

NB. form latex index commands
indexes=. (<'\AlertTok{=:}\index{') ,&.> inames ,&.> (<'@\texttt{') ,&.> inames ,&.> <'}}'

NB. replace indirect and multiple assignments with fixed proxies
indexes=. ((#pma) # <'\AlertTok{=:}\index{00multiple@\texttt{''...''=:}}') pma} indexes
indexes=. ((#pia) # <'\AlertTok{=:}\index{01indirect@\texttt{(...)=:}}') pia} indexes
  
NB. adjust j locative chars _ they give latex indexing grief
NB. later versions of pandoc handle this case 
NB. if. #pos=. I. '_'&e.&> indexes do. 
NB.   indexes=. ('#_#\_'&changestr&.> pos{indexes) pos} indexes
NB. end.
  
indexes
)

grouplatex=:3 : 0

NB.*grouplatex v-- group latex with pandoc syntax highlighting.
NB.
NB. monad:  clTex =. grouplatex clGroupname
NB.
NB.   NB. requires open JOD dictionary with a 'jod' group
NB.   gtex=. grouplatex 'jod'
NB.
NB. dyad:  clTex =. paIndex grouplatex clGroupname
NB.
NB.   0 grouplatex 'jod' NB. do not replace marks with index

1 grouplatex y
:
NB. jod refs !(*)=. badrc_ajod_ grp jderr_ajod_
if. badrc_ajod_ gnames=. grp y do. gnames return. end.

ltx=. x indexwraplatex (gheadlatex ; gbodylatex ; gpostlatex) y
'\section{\texttt{',(alltrim y),'} Source Code}',LF,LF,ltx
)

grplit=:3 : 0

NB.*grplit v-- make latex for group (y).
NB.
NB. monad:  (paRc ; blclTeXfiles) =. grplit clGroupname
NB.
NB.   grplit 'jodliterate'  NB. document self
NB.
NB. dyad:  (paRc ; blclTeXfiles) =. paOw grplit glGroupname
NB.
NB.   NB. do not overwrite root tex - allows for latex tweaking
NB.   0 grplit 'jodliterate'

1 grplit y 
:
NB. jod refs !(*)=. badrc_ajod_ get grp jderr_ajod_ ok_ajod_
try.

if. 3~:(4!:0) <'badrc_ajod_' do. 0;'!error: jod is not loaded' return. end.
if. 0=#JLDIRECTORY  do. 0;'!error: working directory is not set' return. end.

NB. group must exist
if. badrc_ajod_ glist=. GROUP_ajod_ grp group=. y -. ' ' do. glist return. end.

NB. default overview
ohd=. ('/~#~group~#~/',alltrim y) changestr JLOVIEWTEX [ gdoc=. ''
iwords=. ifacewords group

NB. overview documents are either markdown/latex group headers or stored LaTeX macros
if. badrc_ajod_ gdoc=. MACRO_ajod_ get group,JLOVIEWSUFFIX do.
  NB. no stored LaTeX generate LaTeX from group document markdown/latex
  if. badrc_ajod_ gdoc=. (GROUP_ajod_,DOCUMENT_ajod_) get group do. gdoc return. end.
  if. #gdoc=. ;{:,>1{gdoc do. 
    NB. insert interface md based on IFACEWORDSgroup
    if. +./JLINSERTIFACEMD E. gdoc do.
      gdoc=. ('/',JLINSERTIFACEMD,'/',ifacemarkd group) changestr gdoc
    end.
    gdoc=. latexfrmarkd gdoc 
    ifstr=. ifacesection group
    if. (+./ifstr E. gdoc) *. (<IFACEWORDSPFX,group) e. glist do. 
      gdoc=. iwords setifacelinks ifstr;gdoc
    end.
  end.
else.
  NB. stored macro LaTeX - no adjustments
  gdoc=. ;{:,>1{gdoc
end.

NB. root .tex file - gets group name
wdir=. JLDIRECTORY
jlroot=. wdir,group,'.tex'
if. chroot=. x -: 1 do.
  root=. ('/~#~group~#~/',group) changestr JLGRPLITTEX
  (toJ root) writeas jlroot
end.

NB. author title .tex file
agstrs=. '/~#~author~#~/',(alltrim JLAUTHOR),'/~#~group~#~/',alltrim y
(toJ agstrs changestr JLTITLETEX) writeas jltitle=. wdir,group,JLTITLEFILE

NB. group overview .tex file 
ohd=. ohd,LF,gdoc
(toJ ohd) writeas jloview=. wdir,group,JLOVIEWFILE

NB. group build batch script - latex utils that compile generated files
jlbuildtex=. ('/~#~group~#~/',alltrim y) changestr JLBUILDTEX
(toJ jlbuildtex) writeas jlbuildbat=. wdir,group,'.bat'

NB. group source code .tex - return file names
gltx=. grouplatex group
gltx=. iwords setifacetargs gltx
(toJ gltx) writeas jlcode=. wdir,group,JLCODEFILE
ok_ajod_ (-.chroot) }. jlroot;jltitle;jloview;jlcode;jlbuildbat

catchd.
  0;'!error: (grplit) failure - last J error ->';13!:12 ''
end.
)

ifacemarkd=:3 : 0

NB.*ifacemarkd v-- generate word interface markdown section.
NB.
NB. monad:  clMd =. ifacemarkd clGroupName
NB.
NB.   ifacemarkd 'jodliterate'

LF,'~~~~{ .j }',LF,(2 ifc y),LF,'~~~~',LF
)

ifc=:3 : 0

NB.*ifc v-- format interface comment text.
NB.
NB. Looks up interface  words  of a  group  and formats  text for
NB. insertion into group headers and postprocessors.
NB.
NB. monad:  ifc clGroupName
NB. dyad:   iaOption ifc clGroupName

1 ifc y
:
NB. require 'jod' !(*)=. badrc_ajod_ get jderr_ajod_ badcl_ajod_ badil_ajod_
if. badcl_ajod_ y do. jderr_ajod_ 'invalid group name' return.
else.
  iface=. 'IFACEWORDS',alltrim y
end.

x=. {. ,x [ msg=. 'invalid ifc options'
if. badil_ajod_ x do. jderr_ajod_ msg return. end.
if. -.x e. i.3    do. jderr_ajod_ msg return. end.

NB. set comment style (header, postprocessor)
cpx=. ; x { (<'NB.  ';' - '),(<'NB. ';'  NB. '),<'';' NB. '

NB. define interface list in jod scratch locale
NB. !(*)=. SO__JODobj erase__SO__JODobj locsfx_ajod_ nl__SO__JODobj
if. badrc_ajod_ rc=. (;SO__JODobj) get iface   do. rc   return.
elseif.  ilist=. ".iface , ;locsfx_ajod_ ;SO__JODobj
         erase__SO__JODobj nl__SO__JODobj i. 4
         badrc_ajod_ rc=. 0 8 get /:~ ~.ilist  do. rc return.
elseif.  0=#txt=. >1{rc do. jderr_ajod_ 'no interface words' return.
elseif.do.
   ctl fuserows >&.> <"1 |: ((#txt)#,:cpx) ,&.> txt
end.
)

indexwraplatex=:4 : 0

NB.*indexwraplatex v-- insert index commands and handle spurious blanks.
NB.
NB. dyad:  clLatex =. paIndex indexwraplatex clLatex

ltx=. ]`indexgrouptex@.(1 -: x) ; tlf&.> y -. a:

NB. wrap prefix final LaTeX 
wpfx=. '\AlertTok{',WRAPLEAD,'}'

NB. convert wrap marks to LaTeX fragments - handle trailing blank first
ltx=. ('#',WRAPPREFIXTEX,' ','#',wpfx) changestr ltx
ltx=. ('#',WRAPPREFIXTEX,'#',wpfx) changestr ltx

NB. remove spurious normal token blanks
sprb=. wpfx,'\NormalTok{'
('#',sprb,' #',sprb) changestr ltx
)

latexfrmarkd=:3 : 0

NB.*latexfrmarkd v-- latex from markdown using pandoc.
NB.
NB. monad:  clTex =. latexfrmarkd clMarkdown

NB. require 'task' !(*)=. shell
if. #y do.
  ferase mrktmp=. JLDIRECTORY,MARKDOWNTMP
  ferase ltxtmp=. JLDIRECTORY,LATEXTMP
  (toJ y) writeas mrktmp
  NB. highlighting style is overridden in latex preamble
  shell THISPANDOC,' --highlight-style=tango ',(dbquoteuq mrktmp),' -o ',dbquoteuq ltxtmp
  assert. 0 < fsize ltxtmp
  tex=. read ltxtmp
  tex [ ferase ltxtmp [ ferase mrktmp
else.
  y
end.
)

markgassign=:3 : 0

NB.*markgassign v-- mark j code for latex indexing.
NB.
NB. This  verb  tokenizes  j   code  and   replaces  all   global
NB. assignments with syntactically incorrect j strings that  will
NB. be transformed by pandoc into  easily located  latex  strings
NB. that will then be  converted by a post pandoc processor  into
NB. valid  latex  index commands. This works  because regex based
NB. pandoc coloring does not "understand" j's parsing rules.
NB.
NB. monad:  cl =. markgassign clJcode
NB.
NB.  jcode=. 'markgassign=:' , 5!:5 <'markgassign'
NB.  markgassign jcode

if. 0=#jcode=. y -. CR do. y return. end.
jcode=. WRAPLIMIT wrapvrblong jcode
jtokens=. jtokenize jcode

NB. only interested in global assignment lines
if. #gix=. I. ; (<'=:') e. L: 1 jtokens do.
  jgl=. gix{jtokens
  jshp=. $jat=. >jgl
  jix=. I. jat = <'=:' [ jat=. ,jat
  NB. extract global assignments 
  NB. ignoring interleaving blanks
  jat2=. (jat -.&.> ' ') -. a:
  anames=. (<:I.(<'=:') -:&> jat2){jat2
  NB. (0{FAKETOKENS) and (1{FAKETOKENS) are invalid in j
  faketoks=. (0{FAKETOKENS) ,&.> anames ,&.> 1{FAKETOKENS
  jat=. <"1 jshp $ faketoks jix} jat
  jat=. (#&> jgl) {.&.> jat
  NB. adjust last LF
  (-LF={:y) }. ;;jat gix} jtokens
else.
  y
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
corebuild=. JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR

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

setifacelinks=:4 : 0

NB.*setifacelinks  v--  set  hyperref   links  in   any  overview
NB. interface words section.
NB.
NB. dyad:  cl =. blclIwords setifacelinks (clIfstr ; clTex)

'ifstr tex'=. y
rmrk=. '\end{Shaded}'
head=. ifstr&beforestr tex
tail=. ifstr&afterstr tex

if. +./rmrk E. tail do.
  ifbk=. formifacetex x
  tail=. rmrk&afterstr tail
  head,ifstr,(2#LF),ifbk,tail
else.
  tex
end.
)

setjodliterate=:3 : 0

NB.*setjodliterate v-- prepare LaTeX processing - sets out directory writes preamble.
NB.
NB. monad:  (paRc ; clDir) =. setjodliterate clWorkingDir | zl
NB.
NB.   setjodliterate 'c:\temp'           NB. windows
NB.   setjodliterate '/home/john/temp'   NB. linux 
NB.
NB.   NB. use the current JOD put dictionary document directory
NB.   setjodliterate ''

try.

if. 3~:(4!:0) <'badrc_ajod_' do. 0;'!error: jod is not loaded' return. end.
if. 0 = #DPATH__ST__JODobj   do. 0;'!error: no open jod dictionaries' return. end.

NB. if the path is empty use the current put dictionary document directory !(*)=. dob
if. 0 e. $y do. y=. DOC__dob [ dob=: {:{.DPATH__ST__JODobj end.

NB. profile (*)=. IFWIN
JLDIRECTORY_ajodliterate_=: jpathsep`winpathsep@.(IFWIN) tslash2 y

NB. write main latex preamble once per directory
preamble=. 'JODLiteratePreamble.tex'
if. -.fexist JLDIRECTORY,preamble do.
  (toJ JODLiteratePreamble) writeas JLDIRECTORY,preamble
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
assert. fexist png=. jpath '~JOD/joddev/document/jodgraphics/jodcube.png'
assert. fexist ico=. jpath '~JOD/joddev/document/jodgraphics/jodcube.ico'
assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'


smoutput 'JOD staging directories updated'
)

wordlatex=:3 : 0

NB.*wordlatex v-- LaTeX from word list.
NB.
NB. monad:  clLatex =. wordlatex blclWords
NB. dyad:  ?? wordlatex ??

if. #mtxt=. markdfrwords y do. latexfrmarkd mtxt else. '' end.
)

wrapvrblong=:3 : 0

NB.*wrapvrblong v-- wraps verbatim text lines with length > (x).
NB.
NB. Wraps lines with length > (x) and  prefixes each wrapped line
NB. with the syntactically invalid j string ')=.)=.' (WRAPPREFIX)
NB. This  string  is transformed  by pandoc into  an easily found
NB. sequence of LaTeX commands.
NB.
NB. monad:  cl =. wrapvrblong clTxt
NB. dyad:   cl =. iaLength wrapvrblong clTxt

WRAPLIMIT wrapvrblong y
:
NB. always trim trailing blanks
ct=. <@rtrim;._2 tlf y -. CR

NB. only wrap lines exceeding limit
if. #pos=. I. x < #&> ct do.
  wlen=. x-#WRAPLEAD
  wt=. (-wlen) (<\)&.> pos{ct
  slen=. 1&,@:<:@#&.> wt
  NB. lead wrapped lines with prefix
  wt=. (slen #&.> <(<''),<LF,WRAPPREFIX) ,.&.> wt
  wt=. a: -.~ L: 1 ,&.> wt
  NB. last wrapped line LF terminated
  wt=. wt , L: 1 <LF
  nwpos=. (i.#ct) -. pos
  ct=. ((nwpos{ct) ,&.> LF) nwpos} ct
  ;;wt pos} <"0 ct
else.
  (-LF~:{:y) }. ; ct ,&.> LF
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f_-71G^./+>GPm2)ud61E\J.+?1K$2]sh/+?)"t1,0n-3?U%5+>u"u0ea_.1E\D1+>P_q0ea_,
0d&2.+?)%u0f'q.2]sh/+>P_q0eje,0d&@s1,9t-0H`/.+>GPm1cQU;+>Gl!0ea_/3$9q3+?)%u
0f1"22BY"&2`Mp71a"V4+>GPm1c$74+>Pbr0ea_,0H`.o1-$I31a"V7+>GVo1GU(-0d&8++>GVo
1bp1.1E\P7+>G\q2DH=/0d&;/6:FC9:.\2K79FVQEbTE(+DkP-CM@[!+EMX5Ec`FBAfscU<+T/S
Bl7HmG\(D.GAhM4+>"^WARuuR5taXG:J4,O;aa&D5ugTX:dIiE:IAZ(AmoguF<GO2DIdZq+DG_7
FCB!%+Dbt+@<?4%DFI;g8PVZB=EAS)Bl7Q+D..I#Bl7Q+ASu$$De:+c@8pf?+DG_(AU%cs+EqaE
A0<HHF(Jo*7R9[9<)6.U:/aVJ91;fU91;TS1*C"CA0<ZNC*4pKAo&n=FDkr+DK?pP+EV:.+EVX4
Bl%L$B-:Z"@;]j'De:+?4#)(O5taXG:J4,O;^ii+@<?U&EcWBq7R9C1=&2^^;eg5]Ch\!&Eaa'$
Bl8$(Eb8`iAKZ28Eb'56AoD]4-u*[2Ch\!&Eaa'$.3N8DDfp"jH:gt$Bl8$(Eb8`iARfY!AKXT@
6m-2]FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)
7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[Ws
DKKH1Amo1\.7nhX:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08k_QO8PDNO79FVB
EHPi1@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G%8Bl%<&:ddcF9M%uX78d)V7R9C19gii,Ebf3(
GA\OFAU&;>F*)G:DJ()6BOQ!*D..I#F!,[?ATD?)B4YslEaa'$A0>N*Dfp"ABl8$(Eb8`iAKY])
F(KB6ARnD,:KC%U=&W*g7S-^"@;TQuF*2),Bm:b=Aftr!Ebf3(GA\OAG%G];Bk;K2FCf]=8k`#]
8OZ][79FJOATDs.ATo85@<?(*+D,Y&B5M3tF@o=s<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<
CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'Y:JXqk:JsSZC2[X!Blmp,@<?($
Df9_?GAhM4F!,(5EZccFDe*ZuFCfK$FCcmDB6%p5E)]A";c#bT6r-0^F_kk:E+*WpDdso/@<?0*
/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?0a;F+,Q76s=cEa`p+ARlp"Bl7K)E,oN%Bm<]W
5u:BU77KjNBl8*&Ch[E&C*7S>EbTE(+EMX5Ecc#5B-;D=@;p0sA0>]&DIjqB+D#e-Cis9"+=B<5
-Qju`FE1f(Ch[d"+C].qDJLA3@<?U&EcY;[5u:BU77KjN<(0n3E+*WpDdsn`@8pf?+D,Y&B5M3t
F<G19Df$UF=&M=\:f9_O8Q[Da/Kf.KATME*F*)G:DJ+#5D09oA+Cf>1Eb0<2Df0)oA7TLp@:XFh
EbTK70k#$?ASu%"+E)9CEb03+@:Nki+CQC6@rc:&F<G:8+EV:.+Dbt)A0>r'EbTK7+EM+(FD5Z2
+E(j7F*(i2FEMP5@W?O/FCfT7EHQ2AAKZ,5EHQ2AARlp)FE2)5B6,2*Df0Z*Bl7X&B-:Z"@;]k%
3ZqsBEHQ2AAT_u8-Y#2B@VfIjCNCV4DHq-hFD,_<@VKpoBI@D1Ec#o0G\M&+AU%d-AoD^,@<<W.
@<?(*+DG_(AU#>-Df'?"DIdf2Ao_g,+D5M/@UX'qD..I#F(]N3F`;/*FCf]0Ec6)>+DbJ.AU#>A
Bln#2E+*WpDdso2H#@_4GT^[6B4u*qB4uC$DJ*U&E,961D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa
BkCd`ASkjrCLh'hDImisFCcS=DfTA2Bl8$(Eb8`iAKYhuEbf3(GA\OEARfgrDf09$@qKY"D..N/
Bl8$(Eb8`iAKYK$D/Ej%F<G[:G][Y;A7^"0Ea`p'@<?(*Bl8!'Ec`F<DId='+Cf>,D..<mF!+n/
A0>PoDIdQp+EMLEEbTH7F!+q.@;]k%CghEsG\1u5@<--oCghEsGT^U=Df$V6@<--oDg-(AF`V87
B-;/%DIdZqD..I#B45k&BkM=#@<--+C*7#)A7ZlqDfQt:@<?(*+DG_(AU%p,B6.X+@WcC$A7TCp
F)to7F"_$DART[lF!,F1FD,_<F`V,)+C]U=8l%ht@WcC$A0?)7Eb'64ATVWu@:NkbBl7^-F(KG9
BR+Q.EcP`'+Dbb0CNCV4DBNA*Gp%$KATDs.ATo82DKKH1Amo1\+EqaEA9/l7ARfgrDf0W-FD>`)
Ch\!&Eaa'$E,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-
+E2@4@;TIiATr0'E-?82Ci=3(GB.,2F!,X;EaiI!Bl+u7AU&;>Ch[cuF!,[@FD)e5ASu.&BHTJ]
.!R0                                                                      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gg42+>P&q2'=V/2_Z@12BX_/0fU:13$:1<2]sk8+>Y].2.LZ<@<?'fC2[X!Blmp,@<?'fFCfN8
A8,OqBl@ltEbT*+:-pQ_@rc-hFCefoDe*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?.F=f'e@rc-h
FCfM9ASlC.Gp$j?A8Gt%ATD4$AKZ)+F*&O8Bk)7!Df0!(Bk;?<%15is/e&._67sC$F`&<MA7]h(
Ec651C2[X!Blmp,@<?'fFCfN8A8,OqBl@ltEbT*+.3N)2AoD^$%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I;D..]F1(=Rc67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K
@UX=h-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*
-[nZ`6rZTR<$r+^%15is/g,7IF*(u6+E_d?Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_Eb065
Bl[c--YdR1FCfN8ATB.-$4R>;67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGjn
@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[X!Blk^3
$4R>;67sBUDffPO+EV:.+FZpY6rZTR<$64"Dfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$B6A6+
+:SZM:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+B;0(+EqO;A8c[5+Dtb4GAhM;
+EDC=F:ARP67sBQ:IJ/N;cHXj:K0J<+=CE!D.R3eDIIT?0O/aAATDisC1Ld^CLqNkC2[X)ATMrJ
-OgCl$8EZ-+DkP&ARoLq?X[\fA7$HA8l%iS78m/`:JXq!$4R>;67sBhA867.F<GX@@<6*)AoD]4
Ch[d0GV<oB@grc;:IJ/N;cHXj:K0J<+EV[@@<6*;?X[\fA7$HO:IJ/N;cHXj:K.c1%15is/g+YE
ART[l+D#D/FEo!NATMr9A8,OqBl@ltEbT*++>"^WATW$.DJ(([:IA,V78?fM8OHGd$;No?+EVNE
0Hb=TATMF'G%G_;FD,5.FD5T'+EMX5D/^V,Ea`ir/e&.uDEU%&E+X>G-SR5%%16Ze+Dtb7A0>E#
4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf
<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%16WWF*)G@H!b<)A8Gt%ATD4$ARBOjF*(r,@ruF'DIIR"ATLU5
/h1CCF*)G@H!b<)A8Gt%ATD4$ARBOjF*(r,@ruF'DIIR"ATJu9/M/)UATMs6Dg?CHC2[X!Blmp,
@<?''FCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+CT>4F_t]23ZohcDe*s$F*(u6.3N>G+CQC/
Ddd0!F(96)E-)Nr:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(I;D..]F1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sBpF!+(N6rZTR<$5[h
DJ!TqF`M&(57IrO/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5%13OO:-pQUFCfN8+E_d?
Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_Eb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUA7]@eDIjr4ATMr9F`_>6Et&IuATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aE+X>X3ZoelATMs.De*ZuF=.M)%15is
/g,:SEb/ltF*(u6+CT/5+EV19FD>`)+Co1rFD5Z2@<-'nEt&I?HS-F/8OHHU4ZX]B+E(d5-RT?1
0d'[C6qKaF;a!/a0d(FL@r!2T8OHHU%14g4>9J!#Dg-//F)rHl8OHHU4ZX]6HS-Ks+@Jdg<)Y4g
,CUac/h\D'+=Jd%FDti:.3M&3+?k-)+u(3.8OHHU%14g4>9G^EEb/lo-9`P?8OHHU%13OO:-pQU
A7]h(Ec64G@;Ka&@s)g4ASuT4C2[X)ATMr9A8,OqBl@ltEbT*+%15is/g*o-FCdKUFD,5.IVNe3
FCfN8+EDC=F<GFCF*&O6AKZ&*F<E.XF`V+:8g%V^DJ!TqF`M%9%15^'6rZTR<)QLf<'<8bC2dU'
BHS[O8l%iS78m/5%13OO:-pQU<DGn(GA1r*Dg-7FDImp6DfTV9Ec5l<%15is/g*b^6rZTR<)QLf
<'<8b-X9nnARf4f@<4+V>]k+!EcYK#A7At_ATD$jDe*s$F*',a%13OO0d'[CEc#i8Dfd*o:IJ/N
;cHXj:K.c1%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&C2[X!Blmp,@<?'ZD/X3$0JH6g/h1US
A8Gt%ATD4$AQ*GaCLo1R+<YbX/KeeHA8Gt%ATD4$AKW+:D/X3$+<Yc;F*&NI0H_Ji+<Y-9Bl%;e
:-pQU.!'NKD/X?1.4ts&67rU?67sBZD/X3$+<YE;A8Gt%ATD4$AM,)J6?R!YA0<!g@8pf?+<YB9
+<Yc>AKW+7F`\`KA8,OqBl@ltEd9$R$;No?+CoD#F_t]-F<G+.Eb/a&DfU+GDe:,6BOr;7F*2A;
Df9MB+<Y<;Dfp"O+<W(RF`)&7Df.!H+DGm>Bl48Q67sB/F`_>6F"&^a.!'NKD/X?1.3N>G+<YfJ
ARlo+@<3Q*F<D]>@<3Q"DBNY2FCfK(F*),6B-8<j@8pf?$;No?+E)F7Ecu/.G:j4t67rU?67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JY>!@<jRc$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6
DKI!K@UX=h-OO[.@:UK.C2[X!Blmp,@<?'.$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:9]@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/D
DeX*1ATDl8-Y[=6A1%^oDeX*1ATDl8-Xgb.A8Gt%ATD4$AL@flFCfN8ASu[*Ec5i4ASuT4-YI@9
A1'Gd8l%i&$;No?+>%q>78m/.;cH%\<.->*$;No?+E)41DBNJ(@ruF'DIIR"ATJ2iEZf:2+?MV3
Bl.F++DPh*A7]p,C2[W*F`_>6F!h;%:-pQUF(KG9Dfp/@F`\a:Bl[cpFDl2F$>"6#F(KH.De*Zu
FCfK$FCcRB-OL2U67sBnASu("@<?''9OW$S=:/V[+D5_6Ch[u6-ZaEJD/X?1-OL2U67sB4HW3F4
<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?
5s]U5@<6*B3B:G_Ddd0`C2[X!Blmp,@<?'f;f-GgATVL)F>,CD67sa(Ddd0`C2[X!Blmp,@<?'f
;f-GgATVL)F>,Bk+ET1e+Dbt)A0>;'F)>?%C`m5+Ci!ZmFD5Z2+E(j7FCfN8+EqaEA9/l-DKKe>
.!0$AFD>`)Ch[uF0I\U`$;No?%15is/g+,,BlbD=ATMr9F(96)E-*4=Ddd0t+CQC6D..6s+DPh*
Ch\!&Eaa'$+EV19F<G+.@ruF'DIIR2%15is/g,@PFD)e@DfTB0+EV:*F<GdACht59ATMr9G%#E*
Dfp+DCh[cu+Eqj7E-!W@$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QRGqq,a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R=O$;No?+CfG'@<?''FCf<.
DfT9,Gp%<LEbfB,B-;#/@ps1b%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2
AN;b2-QlV9@rGq!@<6!&4=<E\F)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172fBk)6J3Zoel
ATMs.De*ZuF>,Br%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7
F!,RME+O)"$:7Na9L2WR9e\^k+>=636;LBN5u^WS0g.Q?0b"IV:JXYX8Q/SO3ZpX>+>GQ(,;K]8
6;LBN<'`iE76N[S5;"'9+>GYp,TniO$4R>6:/jMY:JEN+3Zp-d$;!ul<'`iE76N[S5;"'9+>Y8t
0JEqC%15Qu:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>083p-I8Q/SO3ZoeA+CT+0GA(E,
+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OgCl$<()%<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%
+EMgF@W-((+CT.u+EV:*F<G:=+D,>*AL@oo%15Et=Ar1!7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR
9M&/^.4dS[=\Vj]64F82$;No?+EqaEA9/l*DfQtEEa`p+Bl7Q+FCfN8Et&J#EbTW,FC[-i3aEjV
0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps
0RI4\.3`+J+BplLI4dc5/3kU<-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$8
0RI4\.4-Go+u(N3>q%3F><3mT/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%16TeCcsh-/jLg9
5U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4G]5
%15is/g+YEART[l+CQC+F_>8.E,TH.FDPN0F!,R5@qg%+%16oiDJ+'"@qg$=4ZX]6@ruNp@ruNp
GB.D>ATVH<@!?X*FCfQ)1*Ah7+<r<XAhFN"Ci=3(FCAZnF>5p>+=MGSBlmp.A27P:EbTW,FC[.7
@ruN05V=0*.3N4T%13OO:-pQU2'G"<+Cf>+Cgh:(ATJu8F^o)-Ecl8@+EVN_+Dbt6B4>[cDJO;V
3\r]Q,UX]^%16oiDJ*Ep@;]k%4ZXr5+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdS%16oiDJ*Ep@;]k%4ZX^%Df02sCgh3sF"D-G
DJ*Ep@;]k%%13OOCi=3(@;Kmr@6HY!FD,B0Bld^!Df03/FE2)5B5_BjCiF&rF*D>?BQ&$8@VfIj
CNFQ<F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDD
F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDD
F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uCM%16oiDJ*BoE+iZC3Zr6WDJ*BoE+iZ2
Ci=3(@;Kmr@4Z55DJ*BoE+iYh$4R>YDf02uBkM.%F$2Q30JP==1c70M3&rZH0JG170JG170JG17
0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG17
0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG17
0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG1.%16oiDJ*KoB5)I/
4ZX^%Df02uBkM.%F"D-GDJ*KoB5)I/%13OOCi=3(DIIBnF$2Q,-Xgh-+EqaECER&'A0>c.+E2.*
Gp$s4CLqQ0C11mh+CQC'F_kk:@W-N7-OgE!Df03*@;TRs4ZX]:3$9Fg/34niDf03*@;TRs+:SYe
$>aWuB5D:'F?MZ-4$"KC+<r![3[[KAA8`T7BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT+0
BkAJZ+Eq78+Du+>+EqL-F<F-t@;R,Y+EqaHCh+Z+Dfd+4D]j7;@<<V`+CoC5-OgCl$>aWuB5)7*
F$2Q,5;=iG0I&;+0JG170F\?u$>aWuB4bsu@<?QR3ZpXA0JG1*0F\?u$4R>;67sC%FDl22+Dbt+
@;KKtGAhM4F!,1/+E2@4F(K62%14L>+?CW!.46JP$>F*)+<tc??U6tDF)>i2AN;b2?Qa&81a$=I
/e&.1+?hK+-UC$aF)>i2AN;b2-QmANF<GI;?U6tDF)>i2AN;b2?Qa&81^se'Cia0%AhG2NDJUG0
/i4\]D_;J++<Wj%HZ4+L+Du!<BeD4O$>"$pASGa/+CoCC%144#0H_JI$>"*c/e&.:%13OO:-pQU
@3BZ'F*%iu4tq=<+E2IF+=D5IDeio<<+U,m0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.M)%15is
/g+RFAn?0/B6%p5E,uHq4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN5u^WS0H`\X:J=&R:JEPd
6;LBN<'`iE74/NO4tq=rEc<-KBl8$6D/X3$0IJq)4$"`\:/jMY:JEMc8PW5a5se76-OgDH0RIGQ
E$-NEDf03/FEM2--T`G43[\`^DJ+'"@qg$=+Dbt6B67QlBll'PCi=3(@;Kmr@3BB)DJ*KoB5)I/
+Dbt6B5V-pATJu1Df03(BleA=Ci=3(Bl8$6+Dbt6B4bsu@<?Q<%13OO:-pQUF)Po,+DkOsEc6".
$9g.j1a$a[F<DrPD/X3$0MPtcEc3WZ4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0MPtcEc3Z[
4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO
:-pQUCh7$uAKZ)+F*&O8Bk)7!Df0!(Gp%$EASqqa%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eXD/X3$3B9*,%13OO                                            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&q2'=_3+>Ynu1H6L43$:(;@rc-hFCefoDe*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?q
Eb/[$ATJu*D/aTB+DPh*Ch\!&Eaa'$+EV19F<G+.@ruF'DIIR"ATMBnF*)G@H!b<)A8Gt%ATD4$
ARBOjF*(r,@ruF'DIIR"ATMBnF*)G@H#k*CDe*ZuFCfK$FCcS:ATMr9A8,OqBl@ltEbT*+Ci<`m
?YXLiCh\!&Eaa'$?W1f[CLqU!F*')iCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:,6ATMr9GAhM4
F!,17FDi9MFCfN8C2[X!Bll$_.0                                               ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,:g31,C%/+>G_r1*AJ40Jst-0d&4o2_[!01,'h++>u,32BX_/+>P&t0JPF-0fC.0+?287+>GSn
1*A;+1Gp:03?U("0f:jG+>GSn1*A>01H?R41E\Fq0fV!M+>PYo1*A;-1cQU41*A=p0f_*60ea_*
+>PW11c-=01E\Fq1GgsH+>Gl!1*AS80H`,*+>P&t1,q691,'h++>to-1E\D/+>P&q2)$j00eje+
+>G]20d&22+>P'"3A;R12]sju0f(^D+>t>t+>GQ.0H`),+>P'"2E2g61a"Or0ekOE8l%iA<CokP
84c`Z:Jt=N2$s[c67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU1,9tH@<*JG0JPR10fM-K1HI?H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI3L$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1-$IO@<itN0JPR1
0fD'L0KM$K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16
+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)
6?R!YA0=WiD.7's3Zp17+<X'\FCdKU1,g=AF_;gP0JPR10ek^F0fh*N$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=AF_;gP0JPR10etdE1cd?L
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2]tD/
B-8r`0f^@21-.0G3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp1<+@1-_+>PW*3?U%43\rZT1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pr"6$6f_1,(FC+>GZ51bq*J2@9cu:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR10f1pI2EEWO
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqf
1E]J'F<E=m0f^@13BB#X3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+?(Dc6t(1K3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>GSn:2b:u1,(FC+>GT30fM-K3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IP
Dg!6Y0JPR10f;!K1HI?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.2+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K3BAiS$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<0JPR10f(jJ1HI3G$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0JXb=
ARci<0JPR10f1pI0KLpG$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.5+<X'\FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0Jah>ARci<0JPR10ebXD2``ZQ$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0Jah>
ARci<0JPR10f1pI3'&lU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.8+<X'\FCdKU0Jjn?ARci<0JPR10f1pG2**KK$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L3'&lN$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0Jst@
ARci<0JPR10etdI2``WI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.;+<X'\FCdKU0Jst@ARci<0JPR10f1pF1-.-L$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0K(%AARci<0JPR10ebXG3BAiK$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%A
ARci<0JPR10ek^G0KLmI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp15+<X'\FCdKU0K(%AARci<0JPR10f(jF1HI3H$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<0JPR10f1pJ0KLpK$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0K(%A
ARci<0JPR10f1pJ0fh$C$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp18+<X'\FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+BARci<0JPR10f(jI0fh$I$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K1+B
ARci<0JPR10f(jJ2EE]P$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1;+<X'\FCdKU0K1+BARci<0JPR10fM-L1cd?N$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp+9+@KdN+>PW*3?U"93]&cV1,oUJ$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0K:1CARci<0JPR10ebXC
1-.9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9
+@KdN+>PW*3?U%13\`QS1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's
3Zp46+<X'\FCdKU0KC7DARci<0JPR10KD0L1cd?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp+:+@KdN+>PW*3?U%23\W<M1b]7D$;No?+B*Q,FCf;M
+A,Et+?VbrDf'?&DKKH#5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>GVo6tKjN
1,(FC+>GZ50f1pJ0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0f1"@ARci<0JPR10ek^G2**HI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4
+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]tM"@j!N\0f^@21HI<I3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+A-'[+>PW+
0H`)(3\WNS1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>P\p8muT[1,(I;+>Gf92)73M2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%j
A7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1K@<*JG0JY=)0f1pH1HI?O$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Po!9jr&b1,(I;+>GW41Gq3L
2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1;+AH9b
+>PW+0H`)+3\W9L0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>G_r9jr;i1,(I;+>Gc81c.6N1^ZiN6r%ZBATM3qA26(Q$=HJ%6r%ZBATM6%
Ble?<ATKMHBk(q"04K':F"_!:FCSuqF!,[@FD)e,F`MM6DKI!n:IH=HH#n(=D0'(o$9^O84Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15jK
FCfM9@:F.tF<G(9EcP`/F<F1O6m,oKA8c@,/g+,,BlbD-De!p,ASuT4Bla^j.WBE>@qB1^F"/;?
BPDO0DfU,<De*6.+<Y'*BleB7Ed;D<A7-NtDffQ3+CSc%F^])/@q]:gB4Z-:+:SZLF)uJ8F!,@=
FCeu*BOu3q+DkP4+Dtb6ATAo&AKYDlA9)7&F(Jl7+A$WqF_,V:FD,*)+Dkh*BQO[j@V$ZjA7T^l
F)to'+EqO9C`m1u+Dbt/B4YTrBl5%m:IJ!"3ZrKTANC8-%14gB+CJ/E6r./^:IJQ,A7-NoF!+\#
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX/o>-)-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r,FPA19,?$4R=O$;PM]ATJu&
E,]AsEZet7Df$V;ARf:hF<G[D+E)(,ATMr9@;]TuEb/ioEb0,uAKZ).AKYK*EcP`/F<GLB+Dtb8
F<F1O6m-M]Ch7$rAM+E!%14=),9THe@WHU"Ed8c^0J">%0JY=)+>GK&/hnJ#+=MAMEb0&u@<5s.
+:SYe$6Uf@7VR)i?t*b[FC655H#R[EBl5&.De(J>A7crl6>psZ+EV%-AKYf'F*)IGDe:,0@;TRs
/mo+q+<VdL%144#+:SYe$6UH6+:SYe$6UH6+A,Et<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"
EZd+k0f^@22``]M3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI6E$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc8
1b^sI3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3]&Mt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU
1,g=AF_;gP0JPR10etdE1cd?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*
3?U%43\rZT1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp1<+@1-_+>PW*3?U%43]&TQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1H,XJ$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4+AZKh
+>PW*3?U"93]/oY2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+?(Dc6t(1K3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS
1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe
6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=
ARci<0JPR10f(jJ1HI3H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%5
3]&iX1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>G\q+@KX[ANCqf1E](s@j!N\0f^@20KLsJ3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lV$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A
+>>Vp6tKjN1,(FC+>G]60f;!I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1boCF$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u@j!N\
0f^@21-.9O3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.;+<X'\FCdKU0Jst@ARci<0JPR10f1pF1-.-M$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo
6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WDu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%A
ARci<0JPR10f1pJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1a!o/@<?'A+>>\r6tKjN1,(FC+>G]61bh$G0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%2
3]/ZR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pht+@KX[ANCqf2]tM"@j!N\0f^@21HI?I3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A
+>>_s6tKjN1,(FC+>Gf91Gh-I3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!Y
A0=WiD.7's3Zp1<+<X'\FCdKU0K:1CARci<0JPR10KD0N2``]S$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@20KLpD3]/c%
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9
+@KdN+>PW*3?U%13\`QS1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`
F_tT!E]P=!1*@]-@<?'A+>>eu6tKjN1,(FC+>>f:1,M$I0FA-o:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6H$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0f1"@ARci<0JPR10ek^G2**HI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0fL4CARci<0JPR10f(jH1-.0L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f^@K@;[2C0JY=)
0ebXB3'&lO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,9tE@;[2C0JY=)0fM-N1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1K@<*JG0JY=)0f1pH1HI?P$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1;+AH9b
+>PW+0H`)*3\rWS1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU1,pCN@<*JG0JY=)0f(jE0fh!G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f:(J@<itN0JY=)0fD'L1cdKO$;X>`
8l%iMDffQ31,Vfn.Si`+8l%iMDffQ3+ET1e+AZfa+A,Et+Co&,ASc:(D.RU,+Du+>ATKI5$;No?
%15is/g+YEART[lA3(hg0JG@pARdGL+>"$0:-pQU@q]:gB4YU7+>PW)2e6K00Jst)+EMX5DId0r
A0>Ps@:Wqi+CSekARl5W%16$FAKWBn:IIrrFCfMB+D,P4+Dl%;AKZ#)@qBP"+Du+>ATKIH6#:U\
+EM+*+=Lo;F*)>@H"q8..4u&:<+oiaAKYl/FCfM9@<,p%Derr,@;]TuFD,5.Ble?<ATJu-@<Q3)
@V'+g+DbJ,B4Yn)+CSekEb0<5ARl5WDfQt/@UX.bDf0,s/g*_.Eb0?$Bl5&8BPDN1@V'%XF`V+:
-t-X/@3BE$Ci![#Bjkg#D/!WrF<GX5GpskLBleB7Ed8f;$4R>=Ec5E'ASlK2GA2/4+EV:.+CfP7
Eb0-1+A,Et+EMgLFCf;A%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$8FC\6tKjN1,(C>+>GT30JY[C0b"I!$8EtP8T&$VD/a<&
FCcS6F`]9LATT&9H#7D0FE2XZ+<YWGF<G"0A0>MrF<G"4AKYSnBl\$8+EMgFD.Rg0Bk(Rf%144#
+EqOABHU_+An?0/@;]t$H"h//+D#e-AT2a*Df0VW%13OO+<Vd^+>G!OATT%BFCfN8E,oMuD.7<m
-OgD*+<VdL1*COYF<DrQATMs4Eb/Zr@VfU'4!uX5/hS8gAU&;>/hSb(+:SYe$6UH65p0ZUD/E^!
A0>o(A7]grB5Si5BQ&$0A0>r8EbT].+D,P4+Cf>,E,9*-AKYr7F>%9<F<GXMD/Ej+Ed8cZ+Du*?
AU%]rE-,f4DK@lK$4R=t.3M3(+Eq78+CQC0BleB)CLnW+Dfd+DD]ib3@r-9uAKYr1F*(i-@VfUs
+DG^9FD,5.A7]@eDJ=3,Df-\9Aft`,Dfp#?%144#+CT.u+EM[>FCfMG+<XWsAKY`+A9;a.C`k-C
Ci_$JBlbD+@<6-m@;Kb*+CQC.Cis9$AKZ)5%144#+D58-+CT;/F`(_4FD,B0/g)95Df^#/D.7<m
F!,[FF_kS2Bl7F$ARTXk+EMgFD.Rg0Gp$O5A0;<g+<VeJBl.g*BkDW5D..-rFCAm$Bl7Q+8g&2#
F*(u1F!,17+D5_5F`;CS+:SYe$6UH6/Kf.R+D,>4+EV:2F!,L7EHPu9ATJu(BOPdkATJu.DBNG-
D/E^!A0>f0FD5Z2F!+n/A0>u-AKYGrDIIR2%144#+<VeC@<ld6F<GL6+EV:.+E_R4ATDU4Bl7Q+
@rH4'Df0-(F<G10Ch7Z1%13OO1FXGGBOr<#DId='-Y[I2+EMgLFCf;3F`V,8+C]86ARlp"BleB;
+E(j7GAhM4+DtV)ATJtG+E_a>DJ()5H#7#/Ci^$m+<VeNDfol,+F.[4Ch+YtBkJQ-ATDC$Ec#6&
@q?clDf9]=F!,(5EZf1,EbAr+A8,OqBl@ltEbT*+/e&-s$8a1S7qHRLEa`c,E+*j1ATDZ2D..Nr
BPD?s+EM47F_kS2Eb03+@:NjkFD,5.E,oN%Bm;:PF^fE6EbTE(06;8JAncK4%144#+DkP/@q]Ro
B-;)1G:j=3%14sA+@.,kBl.g*AKYf'DIjr4AU&;>A7]S!@3BW:F*(u1+EM47F_kS2@V$ZjA7T7^
+D,P4+EqaEA90@4$4R>#.3Lo!B5DKq@;I&7D..=-+Co1rFD5Z2@<-'nF"&5UDfTAACi<flFD5Z2
06M>IF!+t5Df]tBEb/ioEb0,uAKVEh+<Ve@F!,@3ARo@_/e&-s$9'CV5p1,hEb-@c+@fF'+D,Y4
DKI"4DIal(F!,@3ARo@_/e&-s$90IW8l%htD09oA+EDUB+E)-?@W-@%+EqO;A8c[5+CT.u+Dbb0
Fa,$MH#n(=D0$-n%15*E+A,Et+Dtb%A9/l%+D>>&E$0=8Eag/5BOQ!*DfB9*F!,UE+Co&*@;0Oh
A0>Q-D/:>9FEq\6+D>>&E$/b2EZbeuGAhM4F"Rn/%144#+<YE;A8#OjE$-NIF`\u?$4R=O$4R>=
Df]u6@VfTu6YKnGB4Z-,FDi9o:IHfE$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=1,0n>ARci<0JG@,0KD0M2``WI%13OO%14g=
+AH9[AKZ&:Eb-@nDJ<U!A7ZltF!,FBDfB9.Cj@.:@;]UlARlotDBNn@F=2,P@;]TuB4Z04F"Rn/
%14j>+@C'bF(o/rEZf%(DIdQtDJ((lDJ<U!A7ZllF!+m6FCf]=+EVmJAKY])+CoD#F_t]-FCB9*
Df.*KAM.UJ%13OO+<Vd`+E2IF+=D;LBk)'lATVL.F=0.M:.[fK6q'0b+>,9!/hS8hDJ<U!A7Zm*
AU&;>/hSb/-OgCl$8X+R6"FLK+CQC6Bl.g*AKYJr@;]^h+Cf>4DKI"5DfQt=@VTIaFE8R=DBO%7
AKYMlFCAWeF(Hs5$6UH6=(l/_+ED%4CgggfDJ()9DfTB005k<7ARfh'+EV:.+EMgLFCf;3@s)g4
ASuU+Gp%-=@:XEg$6UH6FD,5.FCB3&ATVKo+Cf>,E,TW*DKKqB@;]Tu@q]F`CNCV?BOr<#DI[U%
Bl7Q+DIIBnEt&I!+<YlBFD)e=BOr<.@<-!lF<GI0D.Rc@+<XBsF*&OCAfu2/AKYQ/E+Np.AKYo'
+CT.1F`:l"FCbmg+<VeF@q0Y%F!,[@FD)e=BOu6r+ED%%A90@4$6UH#$6UH68S0)R+ED%4Cgggb
+Cf>4DKI"F@<3Q"A7T7^+EVNEFD,5.Eb03+@:NkZ+EMXFF^oN9Eb-A%%144#+Dkh1Bldd,Ch4_t
D/XQ7F<GL6+E)F7EbK#mA0?)7F_kS2@V$ZjA7T7^+EVNE@rHL-F<G78G7=m%+<YN0DL!@HBl.F&
+CT.1DdmHm@rri,@<3Q#AS#a%Eb03+@:NkZ/g)99BPDN1BlbD*+DYP6%144#+EMX5FD5f<Bk&b<
+B3#gDJ+#5FD,*)+D58-+Cf(nDJ*Nk+CQC/Dfd+1Eb-A9F*1o-CjA&N$4R=b+<VdL+<Y)A+C]J+
B6bV.F!,.-ChsOf+<VdL+<Ve9.3NMHF<Gd=Cht5)ATMQuDIm>f$6UH6+<VdL%144#+@g!bFD5W*
+EqaEA0>]"G%GJ4@q]:gB4W2qDfor>F!,CDF<GL6+EVX4A8-."Df0!"+Eh=:F(oQ1%144#+Cf>-
FE2;9+EMgLFCf<1+DGm>@;L"'+CQC3@;0U3+<XWsBlbD@Dfol,+DkP&AKXT@6k'JG+<YN>Eb-A9
F(Js+C`mq9FD,T8F<G!7F(o9)BkD'h@;^00Dg#]4BOtU_+DG_'Eb/[#AM+E!%144#+B3#gF!+t+
@;]^h+EqaHCh+Z/AT;j,Eb-A%+Cf(nDJ*N'FDi:DBOr;qBl7@"Gp$p3H#IhI+E(j$$6UH6A79Rg
@UX=h+D,>(ATJu7ASu$iEbTE(+E2@4G%kl;F!,"%FCAWeF(KD8F`)52@:WeUCh54.$6UH68K`4q
F_kS2BOQ'q+EVNEB5\o7BQA$6B4rDr+CoV3E$/S,A0>o(F*)>@AM,)J%13OO%14p@+@C'bF(o/r
EZee$A8,po+DG^9@;^"*BOu3,E-67FDfBf4Df-\>BOQ!*GAhV?A0>r8DfTD3FCf]=+Co&"FCB5"
$6UH6Bl5&8BOr;sDe!p,ASuTuFD5Z2+Cf>,E,TW*DKI">Afu#$C1UmsF"SRX<+oue+E)4@Bl@l3
GAhV?A.8kg+<YT?Cj@.4AKYQ/ARfk)ARlp-BOu'(Eb065ATMs)A0>?,+EV:.+E_a:E\8IW8TZ)!
Dfol,+DG_'Eb/[#AISth+<Yc>AKZ&>F*(u1F!+t2A7Zm)BmO>5@X0)5@<l<n+>PW&1b^%gBl7L'
+C]J8+EqaHCh*t^+<VeEDfd+1A7QfkDL!@CE+O&uFD5Z2@;I')G%G]-ART*lAoD]4ATMs%@Vfb"
BOt]sDfB9.@<?4%DK@E>$6UH6<+oue+EVmJAKYo'+E)4@Bl@ltC`m8"Cij).Amo1`Ch\!:+DGm>
@;L"'+Dl%;AKY])+EVaDAISth+<YlBFD)e@BOQ!*8K_PTASiQ4F(Js+Cb?hQ9lG)p+Eh=:F(oQ1
+Cf>-FE2;9+EMgLFCf<1+EVX4@r!1r$6UH6@;Ka&@q]:gB4Z-,FDi:3De*E3+<XBsF*&O7BOPdk
ATJu&Eb-A8EbT]2@;I&pDIal(EcP`-AThL"F=n"0+<VdmF!,R=D.Oi&De3u4@X0))Cht59BOu6r
+EVg=@;Bp,A7]Co@:WplFD,5.F`_>6BlnVCDe9Fc+<Ve:De*E%BPDO0DfU+U%13OO+<Ve+BPDN1
@q]:gB4W30Dfol,+ED%5F_Pl-+CQC/@<ld6F<G(,@;]^h+EVNEFD,5.6r-0A:.\D-DJsZ8%144#
+C]J8+EqaHCh+Z+Dfd+9DKKo;A9DBn+CT/5+C]&&@<-W9A79Rg@UX=h+DG_'Df'H%FD53#Bln'#
F"Rn/+<Vd9$6UH66tL1V@3B&uA7Zm-Dfol,+D>2,AKZ)5+D>2$A8Gg"FD,5.DIn#7F*)GF@ruj6
AKYE!A0>H.BleB1DJ'Cc+<Ve;De!p,ASuTuFD5Z2+Cf>#AKZ28F_kS2BOQ'q+EVNE@V$ZlBOt[h
ARlolDIal/Df]u6@Vg<4@:X+qF*(u(/e&-s$4R>?ARf:hF<Eqa@;]^hF!,RC+A,Et/e&.>/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%14jM+AQiu+>PW)2]sh23\rcW1cPpO%13OO9jqpb+Cf(nDJ*O%3Zp!s8K`4cF!,@=F<G^FA79Ro
DJ()6BPDN1A8bt#D.RU,+EMHDD/XK;%17#c+EV:2F!,[FEbceA@<3Q/Dfd+>Dfd+>DffQ$/g)9.
-Z!TACLq'r+C\o(FCfJ8DJsW.Et&IjDBO%7AKYT-FEMV8/g)9-ATD?)@<,p%F)Po,+D>J%BP_Bq
BQS;V%13OO0e"54Df0`0Ecbl'+EVNE8g$#E0JXb&+EV:2F!,[8F!+m6D..0tEZf=0Bl5&%F!+(&
F!+q#F(o+n$=RsfF_t]-F<GXMDKK<3+Eq78+Cf(nDJ*Nk/g)99BOr;rDe*E%G@>P8@rH7.ATDm(
A1e;u%14j>+AZlkBl7K)BOu"!+CSekARlo3C2[WrASc<7%13OO1FXG5F_>b<AncL$A0>T(+=Lc<
CagJT@rH4'C+196DIal.FD,6++EqaEA90@G%13OO1asP8BleB:Bju4,ARlp%DJX$)AKYH-+EV:.
+DN#W/hf%'@:WneDBNn,@r#LcAKYhuDII0hEZee.A.8lSF<FOrAKXT@6m,<7B4Z-:%13OO2(9Y9
De!p,ASuTuFD5Z2+E_R4ATDF%Bl7Q+AU&<.DKBN8AKZ#)/S/I,F<G[D+ED%*Ch7*u+EV:.+DkP)
Gmt*jBOPdkATJu4G%G\:FD,5.H"CE)F"Rn/%15!B+AQj!+EMXCEbTE(+CT)&+A,Et+EMIDEarZ'
Bl5&8BOr;sBk)7!Df0!(Bk;?.@;]TuB4YslEaa'(DJ'Cc@;Ka&A8-+,EbT!*FCeu*Anc'mF"Rn/
%15$C+A,Et+EMIDEarZ'BlbD7Dg*=C@<-I+Gp%6IA7]d(;fuPmATDj+Df-\-Df0Z;Deq$K%13OO
3%5tEDe*QoBk:ft-uEC.ALS`MD/=8B+EVNEE,ol,ATMo8A7]^kDId<rF<G(3A7Zm)ARfgrDf0V*
$>FB#B6%p5E$/S,A0>r9Blmo/BOtU_ATDiE%143e$4R=O$<1\QDJ+#5FDk].3XlEJ/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
0e"54Df'H0ATVK+A8bt#D.RU,@<?4%DBNt2G%l#3Df.0M+A!\aD'3e6@;]ssDJ()6GAeUIATDj+
Df0V*$?'N!8l%htA8bt#D.RU,@<?4%DD!%S<+ohcDf0B*DIjr6ATDj+Df-\>BOQ!*BlbD7Dg*=H
DId=!+Cf>-F*)GF@ruF'D@HqeF!+t8EcP`/FDQ4FBQ%s6ARlomGp#UqDeElt-Z^DKDJX$)AKYN%
@s)X"DKI"CDf9G7-s(G'FCf96.4u_c<+oiaAISuWDe!p,ASuU2+Ceht+C\n)A8c[0Ci<`mARlol
F!+"Q9h[/^+BN5fDBO%7AKXNC9hZ[?De!p,ASuU(Df-\3F!,@3@<-10+:SZfDf'H0ATVK+8K`4k
Cht5<EbTW,+EMI<AKXSf@rGmh+EVNE@rH7.ATDl8BlkJ>D]h_^<+T/eAM,)J<+ohc9OUn3=<Mg%
ChsOf@V$[)F(Jl)FDi:7ASu("@<?''@3BW*DJ*cs+Co%qBl7X,Bm+&1:ddbqA8bt#D.RU,+EV:*
F<GdACht5'AKYMtF*)G:@Wcd(A.8l[DBO%7AKYGjF(o,,8l%htA8-+,EbT!*FD5Z2/g)94DJX$)
AKYN%@s)X"DKKqBGA1l0+Du+>+C\n)A8-+,EbT!*FCeu*@Wcc%$?KouE,9eBEb/ioEb0,uARmD&
$4R=t.3LurDK]T3F<DuHDe*s.DesJD+D#S6DfQt/DIal,ATMp$B4W3!@;]UlBl7Q+FDi:DBOr<-
@q]FjAKZ,:ARlomGp%3BAISubFD,6++A,Et+Cf4rF)to6/e&-s$8X+R6"FLKFD,5.AoDL%Dg,o5
B-;)'G9D*JEb'5P%13OO+<Ve8.3L$`DJUaE/M/)]Bkq9&A8Z3+@Wcc8F(Jd#@q]Fp+CT)&+ED%+
BleB-Eb/c(A8,OqBl@ltEbT*++D,P4+DtV)ATKI5$6UH6@OWEJ@W$!2+>#/fCh[Zr+CoA++C]J8
+EM+&EarcoF!+n-C`m51EcP`/F<GOFF<G+.@ruF'DIIR2+C\bhCNXT;+D,P4+DtV)ATKI5$6UH6
@jrNK@V97o.3K`b/KeVLFE1f"FE8QQDIIBn/9YH<F_*!E@;]Tu-uNI1ALq>-@<6K@G%#30ALSaD
@:F%aF!,(8Df$V+@:O(qE,uHq+<VdL+<VdL+<VdL+<VeKBOu3q+EqO9C`m1u+Du*?-t7.<F=A>R
Bl7El+C\bhCNXT;+AGj7<$4q)<^fn/6:E"_9N4GY778a;$6UH6A18WLA9;lA+>#/fEb/m+Cgh?,
AU&07ATMp,Df-\0F_kk:FCf]=+EM+&EarcoF!+n-C`m/&C`mY*C1UmsF!,C=+E1b2BJ'`$%14p@
+@0OK+Dl%;AKYet@WNYD+Dtb%A0>;'8l%ht6=k4[+Ad)e@ruEpATKCF8l%ht<,Z\k+Ad)sB6%Et
D/!m#/e&-s$8j7T9jqgK+CT/5+Cf(nDJ*O%+ED%5F_Pl-A0>u4+EM[EE,Tc=+B;B13$<<SG]Y&V
@rGmh+>Pi(+DG^9D.-ppDf[N?$4R=O$;aMs<*sBYA8Gt%ATD4$AMPu867u)1;cI+=De*ZuFCfK$
FCcS6Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is/g)QW
De*ZuFCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!FD)dK+E_a:+=M2;
DIdZq.3N>:+E)-?F(f-$C`m\*FD)*j:-pQUB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0
DfQt5Ec6)>+=MLa%15is/g+k?@:NkiARfgrDf-[?+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:
@<-W9F*)G:DJ'Cc:-pQUBkCit+<VdL+<VdL+<VdL:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,
+EV1>F:ARP67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+G
FE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!g
DKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^
@;^7"E]l#t4"u"(4?G0&1*C[TAfrLCBOu!r+B1m';c#bT6r-0$-QjumG%G]8Bl@l:.3L2p+@B$L
A8a(0$6UI4D/XQ=E-67F-VdH:762Q"A867.F<GO2DIdZq+E1b2BHV#$+Eh=:F(oQ1+=JTgE+*X-
ATB=L.3N>G+Du+>+?hq21+kR>0eP1.%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4rE+*WpDdso-
Dfd+CATT%H+CSeqF`VXI<(KSZ:dIiE:I?K=$6UI4D/XQ=E-67F-WEW.;c#bT6r-0W@;9^kCh\!&
Eaa'$?TgFm-RWkADIdZq-RU$367sC'F(HJ<BOu'(E,ol9ATAo4@;]Uo@j#]-+E1b2BI=5rASu$2
%14Nn$<0eh:L?^i6sjeA1,fXL?qO3_?m&EE6r+7!4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#
DKBN&ATD?m+Cf(nDJ*O%+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"Rn/<+ohc@UX=h+>Ynu
7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*B;$:8cOGB7=<FD,5.
Eb0E.F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AKZ)5+ED%:Bk;K2@q]:gB4Z-:%15C;F)NTPEb/Zi
+Br5eBleB7Ed99SA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u6
05>E905,'@FDl2F/o>,J%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4/g*u,
@;^-/A8`T.Dfd+>ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>3DfQtGARTV#+A!\h@<Q3)D..-r
FCAm$ARlol+E2@8G%#K(+E2@>C1Ums+Dbt/+EV:*F<G:8@r-9uATJ:f?qO3_?m'Z3Ebd9M8K_n^
G%G\:,&h[6Ch[s(ARlu-FD,B0+CoD#F_t]-F<G16EZfI;AKZ&.D/a<&+ED%%F)Pq*$?TriF<F-t
A8,Rl-ZgJT@;^00FDi:9D/a<:+EV:*F<F-t@;R,sDf'?*FED57B-;;7+CT/5FD,B+B.b<%Dg*<q
+CT+0@rH4$BlnH2DJ'CcFDi:6Bl7X+BPD?s+EV:.+D,2/+ED%1@;0UnDJ()"8l%i_+D,1nFEMV8
F"Rn/%16KI@V'1dDCosKA8ba]%13OO0eOSV4C9s)B5hBp0lCh`0OltL12LS]0P#*9@:<bT5%#L2
AS,XoAKZ).AKYAqDe*ZuFCfK$FCei&:ddbq8l%htF)Q2A@q?cmDe*E%A8bt#D.RU,/g*o-G9D!@
@<;qc+<Vdu-['&DEb0<7EcP`$FCeu*?tsUjCh\!&Eaa'$?m&lqA0>o(G%l#/A0>T.+D,P4+CfP7
Eb0-1+Eh=:F(oQ1F!,C5+BrenDIdZq>psB.FDu:^0/%9QDIdZq/oPcC0.@>;+<Vdu+Ceht+DG\3
Ec6,4+EV:.+EMIDEarZ'@rGmh+E2@4F(K62@<?4%DBNJ.@s)X"DKIKR;e9M_FD,5.Eb0&qFCeu*
+CJ/E6r.0)De*ZuFCfK$FCefrA7.#!$4R=t/g+Oa?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca
?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($
+A*btH#n(=D0%<P9OVCO%144#+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>M
>@h\_/TboADd?`[$<0eh:L@jTA8Gt%ATD4$ARB:b1,fXL?tsUjCh\!&Eaa'$?m&EE6r+7!4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%
ATD4$ARI,"$4R>MC2[X!Blmp,@<?'g+DGm>@3A/q8l%ht@r,RpF!,+9Dfp"AFD,*)+E2@>G%kJu
Et&I\Ch\!&Eaa'$+E2@>B6%EtD/!m#>psB.FDs8o05P?EATD4$AT2[.B6%EtD/!m#/n8g:055<7
AU#h@FDYhC+EM[EE,Tc=%16]cEZdss@rGmh+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%13OO
<+oue+CoD#F_t]-F<G[G@:O(o+E1n0A8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?tsUj
Ch\!&Eaa'$?nMlq<+ohc@UX=h+>Ynu@psFi+DG_7ASuR'FD5o0+@fF'6m-8VGp$gB+EMX5@VfTu
Dg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+A$YtF`(o5F_,B7%16o[@V'@s+D"tkBHVD*F))n,
DIal,@;BFq+DGp?E,Tf=Bjtmi+Cf>,E+s-"+Co&*@;0OhA0>Aq@;]^h+D>J1FDl26ATJ:f@X0)<
Ec5c1Bl7Q+Dg#]4+EV:.+Eh=:F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AM+E!%16KI@V'1dDCosK
A8ba]%13OO0eOSV4C:'mAS!];AoVKnARTD$0lV+dG\)"T@l?,M5%#L2AS,XoAKZ).AKYYpDIdQt
DJ()1Afu;<@;p0sA0>u*G]YPI$6UH6?tsUjCh\!&Eaa'$?m'Z6@;p91Ci=3(+EV1>F<GC6DIml3
FDi:6BlkJ>BOu$'Df-\++E1b%AM+E!+<Ve!/0K(QCh[Zr+DkP)Gp%$IBOu3,E,ol0Ea`g%Bl7Q+
Cgh3oF^\ooF"AGEDe3u4DJsV>BOQ'q%144#+CQC6FCB&t@<,m$D.R-nF!,C5+Eqj7E,]N/B-;;-
G]YP\<+oue+Co%qBk(jgDI[r7@rH3nBl7Km+EqOABHVD1AKZ)+G]XB%+<VeIAT2[$F(K62@<?4%
DK?q>Ec5K2@qB0n@X0)(2'G"<?m&rfDBNt2F*2;@+DG^9Ch[cuF!,R<@<<W5E+*W,.W&U3Gp%3B
Dfp,0DIdf<%144#+E(j7@q]:k@:OCjEcWiU?tsUjCh\!&Eaa'$?m'Z6@;p91F*1u++Dbb0ATJu&
DIal(DIdHk@<?(%+EV:.+C]A&@;@!0Bln#2FD,4p$6UH6Ch7$cBl7Q+F*)G:DJ()"-U'.84s24\
/g+,,AKYf#@:X(iB-;8;EbTE(+C\npBl7u7ART(^+Eqj7E,]B!+Dbb0AM,*)BOr<-FE2)5B+51j
+<Yl:F!+t+Df]K-+C\nl@<HX&+DGpFF!+t8EcP`/FDQ4FD.R-nBl7R"ATMo8Bl5%c/g+,,ATD?)
@<,p%E,ol+Ch7I)+EqOABFP:k+<Yc>AKYf#@:Wqi/g*_.BOPEoFDi:9DKKo;A9DBn+CQC7Ea`Zu
Bl7Q+@VfIjCER_;+E2@4G%GQ5+CK.sDIdZq?m'N9DKK<3+D>J%BP_BqBQRs+B+51j+<Y9:Df$UH
Ap&0/DJ(FAFD,5.Ch7$cATAo;Bln#28g%V^A7ZltDBO"=D.Oi(DKBo.DI[7!/g+,,BlbD<Df''-
Bl.F&+ED%7F_l/@+DG^&$6UH6F)Z8BBlA-8+C].qDJO;G+=\j=ASl@/AKZ).AKZ&5F`M27F`S[7
Cgh3sF"/Xl%13OO1+j\W4C9sd1LkEC3Gr;=F)u82A8a22A7IVW@l\F65%#L)D/aN6G%De<BOr<#
DKKH&Eaa'(Df-\9Aftr!Ebf3(GA\O3DIa1`+<Ve#@8pf?+CoD#F_t]-FCB9*Df-\0Ea`TtASuU2
+EqOABHU\tDe*ZuFCfK$FCei4%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*QsF##IF67s`sF_PZ&
C2[WsC3(M=/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu%15is
/g+\=Eb/a&DfU+U%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImis
CbKOAA1&KB+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U
+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH
+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!Z
D'138F_PZ&C2[WsC3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9N
D^c,&:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;Isij
Bl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JP:sF`&lg%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555
C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b/no'A%15is/g)l+@;p6@1*CUKD/XT/A0?21
Bl%@%+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu%15is/g)l.DJs\P3?VpJ
DII?(@q]F`CER_4@<<W9EbTW;ASrW&Bl%@%+D#e3F*%iu:-pQU1,*HODDF$kF(fK9+Eqj?FED)3
+D,>(AKYr#FD,_)$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,
4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn
%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#l
D`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,
Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6
+=CW@Bl%<pDe(4)$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU@;KXhDBN\4A8,e"+Co2,
ARfh#Ed8*$8l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y+
+u(3.:dJ&O?XH`2?XHE$6uQOL%15^'6q9gJ8l%iH8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH
8lJPP<(JPfC2[WqBll"CDe*QsF"\mM$4R>;67sBnASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4
F(96)E--.1$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,
De*s.DesJ;C2[X$DC5l#C2[WpBl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G
@:UKjCghC++D,>(ATJu'@:O'^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3T
De*HoCh7Ys$4R>;67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3R
ATT%V3[\Z\A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1
+u(3]EaoOc%15is/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l
+u(3]EapO@/1)u5+?V#(Bkh]:%15Qr9LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO
%14dOC2[Wn@<<V7+<VdLAp890FCcS9BQ&*6@<6K44"u"N8PDQO%14dOC2[X(FDl22A79R&Ap890
FCcS9BQ&*6@<6K44#)(O8PDQO%14dOC2[WnDdm6cF<D\KAp890FCcS9BQ&*6@<6K44#2.P8PDQO
%14dOC2[X"@;BFb@<<V7Ap890FCcS9BQ&*6@<6K44#;4Q8PDQO%14dOC2[X*FD5Q%@<<V7Ap890
FCcS9BQ&*6@<6K44#D:R8PDQO%14dOC2[X)Df9H5A79R&Ap890FCcS9BQ&*6@<6K44#M@S8PDQO
%14dOC2[X$DId0t+<VdLAp890FCcS9BQ&*6@<6K44#VFT8PDQO%14dOC2[X%Ec5Q(Ch4_3Ap890
FCcS9BQ&*6@<6K44#_LU8PDQO%14dOC2[X%@<-4++<VdLAp890FCcS9BQ&*6@<6K44#hRV8PDQO
%14dOC2[X*F(KB%Df00$B4>:b+D,h<Blmo/F(fK9E+*g/+?MT17S-9B;[j'C$;No?+Cf(r@r!3/
BOQ!*Anc'mF!,%=BleA=Bl5&)G]75(FCeu*A8-'q@ruX0Gmt*/1E\_$0I\,68PDQO%16f]/g)Vr
04I's+D,20BleA=Gp$X9/e&.1+EMC<F`_SFF<Dr@Df'?&DKKH#+DPh*Bkh]3F(96)E--.DF`:l"
FCeu1%144#F)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ8.>o;Cia/?%144#F)>i<FDuAE+=BTU;GU15
/KenEF)u&5B-:]&D/Ej%FCeu*C2[WsC3(M=@rc:&FE8QV4sqI7+F,(SINU3p@LWYe+CT>4ATDlF
+>=p567sC)BQ%<%@rHR#Dg<K8$>"*c/e&.:%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'n
Et&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eY
Eaa$&3B9*,%16QeBl%<pDe*ZmFCf\P0ht%f.UmO7Ch.:!A8G[rAU#>=/M/(fB4YslEaa'$F!,OL
DKK<3+D>J%BP_BqBQRfr+A,Et+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;
ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4
F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G)
:-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`
CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU1,*QRGq^urEb0E.F(Jl).!g2cC2[X"@;0UdFCf\G%15is/g)o'D..]E
1*@ukH?s=EA8PahDD#C,F=A>@A7T7^%15is/g)o'D..]E1E\)"@r,^bDKKH7/7N%0.3N&0A7]9\
$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tDC2[X!@<?(*
3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*3B9)I%16T`Bl8!'
Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OOFDYu5Ddso&ATT%V3[\rZ@:UL)
EbTW,+Cf(nDJ*O%FE/Kr:IJ5X6miEN%15is/g+YHEcP`/F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-
F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp">9IHp@QcapHTHL+6r60K87,_&<*s!):IK,1C(1Mk
ATV[*A8Gt%ATD4$AKYN%@grbS$?C''FED)=4ZX]5H?smPDe*]nBl5:-$4R>;67sB.H?slb+DkP&
ATJu9BPDN1Anc:,F<GL>+ED%:ATDj'+Co2,ARfh#Ed8d>Bl%?'DIIBn+EMIAFE7lu-ZW]>FCf\E
4ZX][5snOG?X[\fA7$HlATT&8Df9`>AU#aR?Z]k(-OgE)AU$@!+?Op2/9GHJ%172gGWe)1-mpYm
IXWMbATDj+Df-eKINpKn/3>P48l%iU9ggEQ@q]:gB4Z.+EZfI8GRY!.FDjboFCf\G+Eqj?FCcS*
Ddt>=Df9`>AU#aR/p(ZL-OgCl$;No?+A,Et+Cf4rF)to6%16i[Ccsg%4$"a(De*d(+DPh*+DPh*
F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!hD(Cijnb3Zr'UDfp#8@<?(*-8%J)
C1D&h$4R>;67sC'F(HIAH?pq]E,oN%Bm:bBD]iJ3DeW`)@r,RpBOu6-GA2/4+=CoBA1&KP/h^aR
@s)X"DKI"5Bl%@%%172gG\1Z+ATL!q+=K?_Ddt4=/1)u5+=K?"H?pqf+=nil4s4TMC`k8U/j:C?
-SBLPGUFUC$>ag/+Eqj?FCcdO4s4rYG\1Z+ATJ:f%15is/g+eIDfp"A@WcC$A0>>iFCSu,F(96)
E-*3S+DbJ.AU#>?FD5Q4+EV:*F<G(3D/a3*AKYVsDImisFCeu*Anc'mEt&IkCgqO$Ch.X!GWdZ%
-mpZs,CX9GDfp#J,CV9n/95ZIFED)=.3N,6@;]^hF*)FF8k_QO8PDNO79C!+.!0Au:K(48C2@@%
Bl%=%AU#XHGB.D>AKY`(@WcC$A7Ath4Y@jfDdt>=Df9`>AU#aR/n/72-OgE(D/XQ=E-67F-Z`s4
Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$367sBW6q/;/Df'H-Ch4_u@<;qc%15is
/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]>
DK^+L4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>
AKYN%@k8u]@r,^bDKKH7/n/72-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]7(A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$FCf8sFCf\P0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbds
AU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3
==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,
ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq
+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT
6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bq
Ec5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QR
Gqgu^$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,*QRGqh&sF(fK9+E).6Gp"MMDe*ZuFCfK$FCd(6@<<q-$;No?+>PWf@<jRe+Co2-
E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!
@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!
F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQU@s)g4ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4
A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$?Kd#
C2[X!Blmp,@<?''A8bre$4R>TEc>o)D.Pjk+=CoBA8Gt%ATD4$AL@oo%15is/g+e<DImisFCcS-
Ec6)>+DbJ.AU"XkC2@NoDEU$'B6%s-BlkJ1Ec>o)D.O.`-ZW]N+DP_5Df9_?C2A!+FDPM2C2@g3
Bk;K2C2@BuA7ZluCgqO$Ch.!`F=044+DP_*ASqqa%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*
F<GU8D/XT/F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]O+Du@E-TsL59gM-E:L@OFDe*2tB4Z0-
-Y$t(@;^0uG[FogF=.M).!0Au:K(484*s">DK^+N+Eqj?FCcS*Ddt=G0Onp1@;^0uGV3H6F=.M)
%15is/g,%?D.RNpF)rIIATD5h$7I\Q3Zp+*+ECsG+=\udEapg5$>F*)+>GH/Gp$X9/e&.1+EMC<
F`_SFF<DrPBOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL-RU8h+AP6U+AbHq+Cf>,E+s-"
+C\c$%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4rB4YslEaa'(DJ((c@8pf?+>#c"-Tbs]E,K*$
AISuXDIb@B+:SZ,%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=KCghEs
GW@cE?Xmn`@;^0uG[FogF>>^oASiQ1ASl@/AKYetFCf\MFCf\>FCf<.+D,>(ATJ2hAS`J=/n&mI
$=m^a+=]!Q@VcB^AS`J=/nB->$=m^a+=]!_EscGhC`k2[Bk2GqA7]R".P>X^F:)PiC`k2[Ci<qn
A7]R".P>g]@gZaXC`k2[Ci<nmA7]R".P>OUC^O]aC`k2[Ci=D&A7]R".P>FQA-ujYC`k2[Bl%Dh
A7]R".P>1HB*r0\C`k2[B6jnqAS`J=/n]JY@Wca;.10a&F*)>@H"q8.1,fXL%16`ZDImisCbKOA
A0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.4
1*A.k.!KBE.1HUn$6Uf@?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*
Df-\>Df9G7F`:l"FCeu8%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)
DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e;u
+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&%13OO+<VdL
<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI5$4R=b
.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#EbT*+%144#
+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#
Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(T1
%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE@")U(DJ!Tq
>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c/hen3+>"^(
ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*
ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$
8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0
+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7
Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^
0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB
0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1r
FD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u
@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b
.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9
F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c
:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjA
Ec#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm
3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*
ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$
1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5
DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo
:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO
+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:g
B4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=
:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlok
C1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;
FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6
@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet
@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>
/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@
@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4
EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9
F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?
+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@
6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8g
EZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1
A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#
+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=
DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'
BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7
F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)
D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,
/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-
+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_
Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4
Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78
+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;
ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c
$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`
+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%
@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;u
Des6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A
6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q
%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL
+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6
<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q
+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7
DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&
?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@
DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeK
D]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U
+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"p
DId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#
ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*
FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO
+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/
F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k
+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI
@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9
BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_
F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,
ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL
+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*
2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+
A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM
$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA
@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"
F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*+
+D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lg
C3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImis
CbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j
-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p
+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!
AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psIn
Df.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q
+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)
EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!
ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,
ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloq
Ec5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1
-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;
FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]p
B4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b
+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<
A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdS
Eap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL
+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$
@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2
.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m
+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%ht
B4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%
@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!
+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*
+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[l
A0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJ
Bl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL
-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?
Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL
+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=
Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*
F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL
+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE
@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]Tu
BlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4
+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>
@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2
@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlom
Gp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(i
B-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH+
+Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7
Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)
+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U
+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J
%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F
;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/
ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j
+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-
Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNE
F*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7
E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\no
DfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2
@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b
@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<
-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSf
AoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdh
Ch[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq
%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,
AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"
AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3
Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF-
-q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)
@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<
Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(
@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>
$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb
$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-
BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/
+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_
Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,
Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/
A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m
6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?
7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0
De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>
%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<
3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5
A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`
3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!
+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)
0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E.
/ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#
F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2
+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&
F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(
+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUt
A8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./
+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+
@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3r
Ed8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9
F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9
FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'
+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$
ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%
+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=
Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#
$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`
/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#
+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI
@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE
$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/
2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@
Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M
/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh
+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655
ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0
DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"
ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT
+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&
AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/
?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5
FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuul
A8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9
<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLg
DKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b
.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*
ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F
%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-
%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(
FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V
+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</
Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*Aj
Ecc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>
FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]
%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'
0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`R
A8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W
?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+
/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*
+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9
AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%
F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A
+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%Wn
FDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\G
A93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)
@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%
Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'
DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'n
F!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2
+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO
=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,
G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6
@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^
:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#
D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.
F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9
ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9
A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*
FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-
FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=
+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8
Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#
%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#
.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq
?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<
+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-
+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ
+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0
H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_A
An?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OC
F<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<
2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+
Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&
+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A
@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D
+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*
FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6
B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#
+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.
GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-
$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et
+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%
A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-
?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#
D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&
D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*
@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm
3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.
FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"
DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,
Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5
?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E.
/i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A
6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO
+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*
DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)
@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;r
Df0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY
+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5
?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<t
Bl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7
Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+
@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`
Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7
AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^K
DIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<
AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1
/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss
2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhK
ASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$
C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(
/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54
FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rm
ARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>Ju
Ch4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj
/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc
+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5
C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.
GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9
A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*
DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q
3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4
?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d
/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=D
C3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%
+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:
2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1
@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$j
F`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn
+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5
?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qB
D]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e
$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%
0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8
E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LS
ASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58
@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5
+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-
+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8
/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_
0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='
+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq
/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&
,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&
FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+
Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8
D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i
+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.6
2]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&
F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>
,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4
+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDB
H#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%
DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o
05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6
Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdL
E+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL
+<V+#+:SZ#%16c_F*)>@H"q8.A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@
Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen4+>"^1@<,jk
+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>
A7f3lD/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!
+EVNE8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLd
ATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9
ATT&9ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[
A0<HHF(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinG
EcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e
,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s
$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5
Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&
+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue
%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO
,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8
@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq
$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJ
F`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p
9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp
+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@
ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30
ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+
8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%
+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*
+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-V
D/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f
/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/Kdbr
Earc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W
%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0
C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6
$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2
/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"
DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmf
EZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))
F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o
+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH
@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u
+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(
+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.
F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-
FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%ht
A8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6
Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.
+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6
AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0o
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtE
FDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[Km
Eaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6
D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq
@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6Tcb
C2[X!Blmp,@<?'\F(KB-AU/>P2,6Ij+E_a:Ebf63F"Us7B+52C67r]S:-pQU;e9M_GA1i,+E1b%
AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=
F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)
@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&O
Ci<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*
F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(
Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#
.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/h
AooOm2^/\<:-pQB$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNF
Ci^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4@<,ddFCfJ%$4R>31-73P;Is]RCLnVUF`MM6DKIsVDdd0!
-YdR1Ch\!&Eaa'$-QlV9D/=89-YdR1Ch\!&Eaa'$-QlV9@r,^bEZc_W%15IEEbm6q1-73P;e:%n
6ZmEiASuTODe't=4==i[AU#RO/1<V.C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i(Q>9G^EDe't<
-OgDMFE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9b
AT;j,Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1
+>F<4;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEDB<Ecl7B-RT?1
7Q*=_4&fd4F<FM!DeioGEccCG-YdR1Ch\!&Eaa'$;f-GgAM>ec%16$IBkDH;7Q*=_4&fd4F<EnY
F(o,G-Vd6-:`s4UF(o,,FCfN8-YdR1Ch\!&Eaa'$?Z1+%ATqL'AU#sc,p7;CBlbD3De*ZuFCfK$
FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;iG%kN3I16Mm$=%[a
G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5BlJ/:FD,*)+D58'ATD4$ATJ:f>\J.h
Ap\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%EtD/!m#I=#dEFCfK$
FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;8l%htA8,OqBl@ltEd8d?Ec6)>F"Rn/%16?]F^fE'
@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[mDKKH1Amo1\I16Mm$=%%OB5)71;eTTMARp2u$=%%O
B5)71882^MCh[NqFD5W*I9Ttd$=%7iE+O'+Bl7^5<(KSZ:dIiE:IBP8:2b/i@;Jn]CO9#O8Q/GO
:..lF+<VdL+<Z);6Z6gYASuThDej]3F_kk:E+*WpDdso$G\(B-FCAWpAKYr#FD)eD/U\aaF(HJ5
@;]Uo@j#]-Cj@.;Afu#0+EM4-Cht55@<?12%16?RH#R>8Ch[d&HY7A<Ch\!>>Y]3XD..6[Dej]4
Ec>i/F<D\K+<VdL+<VeT>XNFHD.RU,<,ZQ!D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaI16NgBR+Q.
EboH-CO9c-@:NkiARfgrDf0u.:2b/i@;Jn]CO9c-@:NkiARfgrDf-[?+<Z);6Z6gYASuThDej]6
DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7R3%16?RH#R>8Ch[d&HZNb?C2[X!Blmp,@<?(/
>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKW+D>XNFHD.RU,<,ZQ!E,oN/@<,p%AoD]4E,ol,ATMp,
DJ+A,$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%L
HYRJ0Ch\!&Eaa'$I3;s9A0=K?7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&
F*2>=FD5Z2F!+n#Dfp.EFD,5.8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH
8TZ(`F)uJ@ATKmA$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$
A7ZltF!,OGDfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&.mBlmp'%144#8l%htB6%p5E$/\0@s)X"
DKKqB>]aP%FEDVO1*AS"A8-+(+=CfBDfp#:@;TR'I3;s=AISth+C&T#AS-:&FEDI_0/%'YBPqZq
@qK.iCgh3m/oG6B05t?;A8bs2;FNl>9gp[JFDYi!,B.(/A8bt!/T"p:CLh@-DLHkN@;]Uo@grbf
+Cf>,E+*j&@VfTuD..I#A8c[0I3<WCG]Y'?Ea`TtASuU2/g+D1D/a08<+oue+DGm>FD,5.D/XK;
+EM+7BlA-8%144#Ch[a#FCB9*Df-\9Aft?#AU&<=FF.b@A8Gt%ATD4$AUQ1Z+AHcqF<GL6+DlBH
B6%p5E$/\0@s)X"DKKqB@<,og$6UI/Dfd+=@<--oDg-(O+A!\aD'3n9Dg-#C+Cf>-G%G]9Bl7Q+
FD,6&/g*_t+F.mJ+Cf>,E,Tf/+D5_5F`7cs+<Y35@s)X"DKKqBF`V+:E+*WpDdso,@<--oDg-(A
@;]Tu>]aP%FEDVOC2[X!Blmp,@<?(/+EqO9C`m1u+CQC/DfcEq+<YN>Eb-A9F(Js+Cb?/(>\S:k
D%-gp+@0mj+D5_5F`8I5CghC+>\7nmFDc#=AU?]c>\.bkBR=B4Dfp"A@r,RpF+#0FF!+m68l%ht
B6%p5E$0@=FD)e*%144#+<Y3+@r,RoARlp"BleA=De:,+DKKH1Amo1\+CT.u+EDC=F<GdGEb'5P
%144#+<Xp2AU&<=FF-SK5sn(B:JsSZI9^?#E+jT2Ec6)>DIIBnI3;s9A.8kg+<Ve3FCf]=FEDk-
:JXqk:JsSZI9^?#E+jT2Ec6)>DIIBnI4cX?Df9_?GAhM4F!+n-Ci=M,$6UH6+C'#"G]\%LHXU`,
Eb/j(I3<WM+D,>*A0>;sC`mh5AKZ28Eb'56FD,*)+C\nuDf021FDi:DBOr<!Ec6)>/e&.1+<Vdo
CghC++D5_5F`;CEFEqh>@ps1iGp$pA@:UKpDKKe>Ci<flCh7Z?+C'#"G]\%LHYRJ0Ch\!&Eaa'$
/no'AI16N++<Ve@F!+n/+D#e+D/a<&+E(j7@3B&r@<6K4B6%p5E%ZP]Bl8$(Eb8`iAKY].+CQC6
Bl.g*AKXSfG%G]'@<?4#%144#@VfsmCER_4@<<W+F!,=.Ebf5s+EqOABHU_+>YJR*AQXD&ARfgr
Df-\-Df'?"DIb@B7<i6XBl7K)FD,B0%144#B6%p5E$o]LA8bt#D.RU,+C'#"G]\%LHSQ^(+Co2-
E$-NCDe*ZuFCfK$FCchJ+D,P4+CT.1AU%X#E,9)<%13OO>[h8WBl89@ATD6gFD5T?%14C(CghEs
GT_'=@ruF'DBKAq>]Y$sF(Jj'Bl@m9>]aP%FEDVOB6%p5E,K*$AUP[mDKKH1Amo1\I16Mm$@[GQ
INWt[/o#eD$>4BuCh[u6+<VdL+<VdL+AP6U+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HW*ATV[*
A8Gt%ATD4$AKW*j67sC"Eb02uEb-A*DfQt>Ec5H!F)u&5B+52sIXZ`p+<V+#>\.e`HZit@@UX@m
D1)j#>\S:kD%-gp+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y:IH=<Ec6)>+D>=pA7]dd
AoDU0DJsW.HW4ZmEt&I!+<VeCBl.R+@<?4%DBNe)Gp$R-+D"u&ARlotAftf0+C\nlDf'',+CQC+
Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%144#GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(
G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%144#@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#
F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.1+C'#"G]\%LHYRJ0Ch\!&Eaa'$
I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)+DGm>D..I#ARlp"Bkq8h$6UI5BPDN?
%13OO>[h8WBl89@ATD6gFD5T?%15is/j)7FIXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5Ecack
Df%W]0d7`g%15is/j;IJIXZ_g%16?ODIe*;ATD6gFD5T?%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp
@WQ*jFD5Z2HW#!(DJ=!$+C'#"G]\%LHYRJ0Ch\!&Eaa'$I=2P3%16?^AU&<=FF.b@A8Gt%ATD4$
AUP\AF`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=Ado)>/mN",Dffl8FCff(
FCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+EDUB+E)-?8g$)G0JO\YDIal!AU/33A1i9>$4R>AD]j1D
AKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-G
Blmp'%144#8T&Tk@;Ka&8l%i-%144#>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,
00s,ZDf0VLB4YslEa`c;C2[X2HV.(%I3<6F+CQBb%144#@:WneDD!&'F<G:=+E_aJ@;Kb*+DG_7
FCB!%ARlp-Bln"t$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE98jQ.!HV-Rt
I4bs9>\S:kD%-gp+A$HlFCB!%+A,Et;bpCk6U`U:$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6
AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De*p-F`Lu'I="R^6rQl];F<m$%144#BlbD*CiaM;
@3A/b@:WneDD!&'DKBo.Cht5.F<GdAFD)e%FCf]=FEDkK@:O._DLF,[8TZ(bDf0Z*Bl7u7FD,5.
8l%ha$6UI%Bk)7!Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.
DKK<$DK?6o+<Xp2AU&<=FF.b@A8Gt%ATD4$AM/B?$=%:eAShk`+<X6nF*(i,C`m./@s)g4ASuT4
G%G]8Bl@l3De:+sBQ@ZrHY@MCE-"&n05t?;A8bs1DfTJDI=#pADIdZqI4bs9+<Xp2AU&<=FF.t8
DIdZqI3<]EEcYr5DBN2+AU&<=FF,bq3A*$=0mt0QDIal!AU/33A0;<g+<Y`JE,]`9FE8Qs+EMgG
FCBD:BPD*mCh[NqFD5W*/g*u2BlA#7G%G]8Bl@m1+ED%5F_Pl-A0>`-A8,Xi@psInDf.0M<+ohP
$6UI'Des6.GA1r-+C]/*B-;/3F*)IGE,ol?Bk1ctD/XH++DG_*DfT]'FD5Z23XlE=+<VdL+C&Ae
B5)71ASuX-ATD4$AUP!p#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5r
EbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VNHVJF!
AKXSf:gn6PDdsngH#@_4GT]OkB4stQB4uC$DJ+A,$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDG
BPD*mCh[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r#p:?qBlmp'
+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+706:]A
Be=.8FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca+C&JqA:%m*F_t]1@<?(/%16?S
FCf:u$6UHXF_PZ&+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"jIFCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*
+A*bhEc6)>/g*b^6k'JG+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3Dfp#?/g+,3+DkP&AKY6"AU&<=
FF.b@A8Gt%ATD4$AUP\3D`S=7%16?LAS5^pHZit@@UX@mD1)j#Eb065Bl[c--YI".ATD3q05>E9
-OgE$A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%16rgF!)iFDe*ZuFCfK$FCcg/$=%.[
A:&K2EaiI!Bl/8-$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!Df0!(Bk;?.@rH7,@;0UnDJ()6
BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%16?LAS5^pHZit@@UX@mD1)j#De'tP3[\Z\
A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDfASu%*G%G]'@<?4#I16NgBlmp'%144#9Q+?M+C'#"
G]\%LHYRJ0Ch\!&Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/+DGp?@ps6t
@V#uU+<YK=@:Wq[+Dbb-AKYE!Gp#^%F(96)E-*]A$4R>I@V'1dDL6P<EaiI!Bl/8-$>aWhA0<77
De*ZuFCfK$FCcg/$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<XToF<G!7GAhM;Bl7Q+A8-'q@ruX0
GqL4EFCf]=FEDkEDe*ZuFCfK$FCfkCB4YslEaa'$F!,=.Ebf3(GA\O3DIa1`+<Xo_@8pf?IV*;1
ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+GF)Y]#BkD'jA0>?,
%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO>[h8WBl89@ATD6gFD5T?%17/fFD>`)Ch\!&
Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-73$?Kd#C2[X!Blmp,@<?''-SK.OD.PA8
DeO#AFCf<.-QjO,67sBsBl8'<%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHhF`&=,FCf]=FEDkB
Ec>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/g+D@AU&<=FF.Y@E,961I16N+
+D58'ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/g+,,AKZ#3Dfd+,
9OUn3=FOjrCh4%_+<YB>+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!%16?LAS5^pHZit@@UX@mD1)j#
B6%s-BlkIFC2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*ZuFCfK$FCd(HAU#=,$=%.[A:&K2EaiI!
Bl/8-$=%:eAShk`+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'FD,5.Anc'mF!,+,DImisFCeu*@X0)$
FCf]=FEDkBEc>i/F=qta7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=FEDkKA7fXd
FCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5CghEsG^V1e=`8G'+Cf)'Bk(]s
GA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHkDJ<U!A7ZlnBOPpi@ru:&F"SS)
DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth+C'#"G]\%LHV.(%9PJT[Eaa'$
:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H$=%.[A:%m*F_t]1@<?(/%13OO
<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>@;^00FDi:1A867.F=n"0%16?L
AS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=FEDk%:IIljFCfK$FCe9hARTFb
Ch55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&+Cf>+F_u#;/g+,,AKYMpAmogu
F<G:=+D,P7EZeh6F<G[=BlbD6@<iu9ATN!1F<G:8+Dbt6B-;)#D.Rc2Ecl8;Bl7Pm$6UI5DeEX'
BOu3:+B38%A7]7kARTXk+E)9CBl7F$ARTXk+DG_(AU#>-DesQ5DK?q1BOPdkANC8-%16?LAS5^p
HZit@@UX@mD1)j#>[h8WBl897F_l/6@rH1)I=!f!>?l5\@ruF'DCU!<Bl7HmG]$r,AURhn$=%.[
A:&K2EaiI!Bl/8-$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\FEa`p.+Dbt6B-;86F`Lu'
+Cf>#AKYf'DImlA+BNSlE,]N/B-:o0%144#@rH7,Ec5c1ARlomGp$@6AU&<=FF.(e5u:6H9hA<4
/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"ATDiE%144#6YKnGB4W3-BPDN1G%#30AKY]!+F.mJ
+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7CAM,*,Ea`p+ARlp"Bl7L'+CT;%%144#E,oN"AS#C`A0?)1
FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e5u:6D5t$,DGA2/4+Co%q@<HC.%144#>X<1;Ecb9!CO9<.
AU&<=FF-2(/j=]3/e&.mASu%*ASuX-ATD4$AUP!pC2[X!Blmp,@<?(!G%kN3?Z]k(1,:-uFD,B0
+DPh*Ch\!&Eaa'$+E)F7Ecu/.G7%SrARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;iG%kN3
I0p<dFCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*+A*c!FD5Q*FEo!M@rc:&F<G[=@<<W)ASu("@<?(%
$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,02-)%ATD4$ARBCsDeF*!D/F!)B75,C
Blmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+Co1rFD5Z2@<-W9B6%p5E-!W=$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!FCfK)@:Nks$4:$IAS5^pHW+TdA7];"$=%%O
B5)71882^MCh[NqFD5W*I9Tta>\JD%ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7E,961+<VdL
+<VdL+FSZC6Z6gYASuThDej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i$=%7iE+O'+Bl7^5F(KH.
De*ZuFCfK$FCflI>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZDL>XNFHD.RU,<,ZQ!E,oN/@<,p%
AoD]4E,ol,ATMp,DJ+A)>\JD%ATDU$DJOT5Amo1\F(Jj'Bl@m;HX'<aEc#6$<,ZQ!BkCd`ATMEm
FD5Z2+<VeTI9]-XD/Ej%FB!0oHYIA>ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B71+lASu%*
882^MCh[NqFD5W*I0s4jDIe)mBOPF_A:4dl$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$
I3;s9A0=K?7"#CL>]aP%FEDVOC2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.t
F<G[=AKXSf@rGmh+CT.u$=n'bF_t]-F<G[:G]Y'BF<GOCDe!@"F(KDF+A$Yt@<6L4D.RcL$4:$I
AS5^pHY%);D.R`rFCfl)0eQ`=>\S:kD$hC.6#:?[F)Q2A@q?cmDe*E%BlbD<FDl22A0>T(+A,Et
+Co1rFD5Z2@<-'nF"Rf)Blmp'$6UH`:IH=<Ec6)>+CoD#F_t]-FE8R0FCf]=FEDjb+?:QTBle59
-YII<F`;5,D.P)C+CT;%$6UHrBQ@ZrHY@MCE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kU_K
5t"F9/nf?DCg83(@;]Uo@rj5=@<--oDg-)IHZ3D2A8brb+<Y04D/`p*Bjtmi+DkP-CLh@-DLEXL
AU&;>Ao_<mD.RU,F"SS?ASlC"HW4ZmF!,1<+EV:.+Dl%<F<GX9EbTH7Esa$4Ch[a#FCB9*Df-\9
Aft?#AU&<=FF.b@A8Gt%ATD4$AUQ1Z+AHcqF<GL6+DlBHB6%p5E$/\0@s)X"DKKqB@<,od+<YQ?
F<GF/Ebf3(GA]#U8K_GY+EM@;GAMOI@rH7.ATDm,DJ()6BOu$5+A$/fH#IgJ@rH4'Df]J4B6%p5
E!d^1A8bt#D.RU,F!,UHAKYr#DIdZq+DkP-CLh@-DBNA*A0>-!AU&<=FF.b@A8Gt%ATD4$AUP\F
Bl%T.@V$Zj+Dbt<$6UI.DfTD3F`V,+F_iZ;>\S:kD$hC.6#LrjB6%p5E$/Y,@<6KpAoDU0DJsW.
HU/cZASlC"HY7A;F`8I5CghC+I3<6F+CQBb:IH=<Ec6)>+EqOABHU^j+<VdLA7]7e@<,pi+Dbb5
F<GL6+DG_8ATDBk@q?ckDIal1Df9_?GAhM4F#jXN+<Ve3FCf]=FEDk$7R9C1=&2^^;ghn^D/a08
B6%p5E,K*$AUP\0DIa(s+<Ve3FCf]=FEDk-:JXqk:JsSZI9^?#E+jT2Ec6)>DIIBnI4cX?Df9_?
GAhM4F!+n-Ci=M)+<VdL>]aP%FEDVO@;Kb#AS-"3+EVNEAnc-n+CT)&+EV:.+EqaEA9/l8BOQ!*
@V'@oDJ()6D]j.8AKYW+Dfp"O$6UH6+@BsRF)rI:Ec6)>F!,RME+rfjCi"A>Ci<`m+DG_8D]ik7
@ps1bF"SS?FCf]=FEDkEDe*ZuFCfK$FCd(=C3+e1+<VdLBlbD*DBNM8@;Tt"AKYo'+CQC&CghC+
+D5_5F`8s]+DG_8ATDBk@q?csF!+m6F(oK1Ch4_]+Eh=:@UX@mD$hC.@VfsmCER_4@<<W+F!,=.
Ebf5s+EqOABHU_+>YJR*AQXD&ARfgrDf-\-Df'?"DIb@B7<i6XBl7K)FD,B0$6UI(Ec6)>-Z^D@
De!p,ASuT4>]aP%FEDVO1*AS"A8-+(+=CoBA8Gt%ATD4$ALDmKAoD]4@;[3!G[YH.Ch54+$=%%O
B5)71G%G]'@<?4#I0q8CCghEsGT_'=@ruF'DBK9kF*1r5ARfgrDf0o,FCf]=FEDkBEc6)>DIIBn
I3;+!FCfK)@:Nks$4;62IXWDd+>.DW$>4BuCh[u6+<VdL+<VdL+AP6U+DkP&AKYetFCf\>AoD]4
B6%p5E$-QS.11--FD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'uAKYT'EZf=ADe!@"F(oN)$@[GQIXWC^
$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.:2b#%8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_
Dfp"ABOtU_ATD$fDf9`8DffQ;<+oue$6UH6+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j+DGF1BlkJ,
ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl,j+EqOABHV88AT_O%/T>-9A8bs#A7]Rk
D/"*'EcWiU7<W6_H$!_6DJ()+DBNG3Ebp"D>]aP%FEDVO>^K_(I0q)>@WGmeCLqU/+D,P.Ci=N=
+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-G%GQ5Bl@m1/d`^D>]aP%FEDVOC2[X!
Blmp,@<?(/-Z^DDART+\EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmhq
+EV:2F"Re,>[h8WBl89@ATD6gFD5T?$;No?4?S(AIXWDd+>.J=FCf\>DKTf*ATCIYDIml3F*(i2
F@L:hD*9't+s;:@:-pQs5(7s0INSu&ASu%*G%G]'@<?4#I0s4jDIe**DKTf-Eaa'$I0p<dF*1r5
ARfgrDf0o"F`))2DJ((sFCf]=FEDkEDe*ZuFCfK$FCflK$4:$[AU&<=FF.b@A8Gt%ATD4$AUP\A
F`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=AdV-_>\7nmFDc#=AU@[(AU&<=
FF.b@A8Gt%ATD4$AUP\FBl%T.Ecl7BDf-[i+?1u-0d'nBA0>>mH#IS2/q"'6<,Wn%F(HJ!FCf]=
FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XQ4!@V'1dDL5r4F_t]1@<?(/>;7a9$=%:eAShbs+A$Hl
FCB!%+A,Et/d`^D>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,00s,ZDf0VLB4Ysl
Ea`c;C2[X2HV.(%I3<6F+CQBb$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)"(
+C&T#AS-:&FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeN(E9RV7[5tl\Z$=%:eAShbs+A$Hl
FCB!%+A,Et;bpCk6U`U7+<Xp&Eb/j0BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>FfA7TUr
F"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD1+<YB>+CT)-D]iI28g%PQA8c?<+A$HlFCB!%
+DGp?GA2/4+C'#"G]\%LHZ3D'D..=1/g*`-+Cf>-FCAm$F!,R<AKXT@6jb%ZA8,OqBl@ltEbT*+
+ED%5F_Pl-A0>u4+C]J-Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u!+<Xp2AU&<=FF.b@
A8Gt%ATD4$AM/B<>\S:kD$hC.8T&Tk@;Ka&@3B'&EcP`/F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC
3\N.*@;]Uo@kM\?B.n[[E+*WpDe"2J$6UHrFCf]=FEDkK@;]Uo@soJCATDj+Df-\&FCf]=FEDjb
/ibO=/hqbs@;]Tu@V'h'DIajs+<Y`JE,]`9FE8Qs+EMgGFCBD:BPD*mCh[NqFD5W*/g*u2BlA#7
G%G]8Bl@m1+ED%5F_Pl-A0>`-A8,Xi@psInDf.0M<+ohM+<Y97Ci"$6Bl7Q+@Vfsq+E27?FE8RD
Ec6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM$6UH6+<Ve3@V'1dDL5r4F_t]1@<?(/$4.gt>\S:kD'3(s
Eb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;
/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKaA8bs#;gE8&@<`ncBkM*QBkM+$
Bl7R3$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\
0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*mCh[NqFD5W*07A1D@;]Uo@j#5hF(Jl)
8g%&XDKK<3+@p3ZBP_BqBQRs+B71*n+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1r@X;e9f[/PKl#ATD4$
AKXT@7"$Zp#p:?qASu%*ASuX-ATD4$AUOnjBlmp'$6UHXF_PZ&+C'#"G]\%LHYRJ0Ch\!&Eaa'$
/q"jIFCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*+A*bhEc6)>/g*b^6jb%ZD..3kF!+'tF(96)E--.D
Ao_g,+D5_5F`;CS+B38%D..3k+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XQ4!@V'1dDL6P<EaiI!
Bl/8*Eb065Bl[c--YI".ATD3q05>E9-OOd&+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=AND
D/=89-YdR1Ch\!&Eaa'$-OO*iDIe*;ATD6gFD5T?$=%:eAShbs+AZrfDBO%7AKXT@6m-#S@ruF'
DIIR"ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/d_qj@V'1dDL6P<
EaiI!Bl/8*De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OO*iDIe*;ATD6gFD5T?$=%:e
AShbs+A?]^A0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR6"Y4MEZf4-CM@[!+C'#"G]\%LHYRJ0Ch\!&
Eaa'$I3<6G+Ceht+C\mh+<YK=@:Wq[+Dbb-AKYE!Gp#^%F(96)E-*]>$=%%OB5)71G%G]'@<?4#
I0se/@:UK.C2[X!Blmp,@<?'.$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.;e:%n@3Bc4EbfB,B-:`!
Eb/a&DfU+U+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<06DImisFCfM9D..I#A8c[0+CT.u$6UHr9OUn3
=FOjrCh7Z?+@0g[+EM[8BHUo$Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;sBl[cpFDl2F+EML5@qfOh
ARlomGmYZ:>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q$4:$IAS5^pHZit@@UX@mD1)b4ATV[*A8Gt%
ATD4$AKW@13a?c<D/^jF+<VdL+<VdL+AP6U+EqO;A8c[5$?Kd#C2[X!Blmp,@<?''-SK.OD.PA8
DeO#AFCf<.-QjO,67sBsBl8'<$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.;KZk">]aP%FEDVOB6%s-
BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n\@FCf]=FEDkBEc>i/FF=K=+D58'
ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/g+,,AKZ#3Dfd+,9OUn3
=FOjrCh3qr+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn/d_qj@V'1dDL6P<EaiI!Bl/8*B6%s-BlkIF
C2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*ZuFCfK$FCd(HAU#=)>\.e`HZit@@UX@mD1)arBlmp'
$6UHkF(HJ!9OUn3=FP@1+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-
BlktU+@^']ATJ2$+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=FEDkKA7fXdFCf]F/0J2>AU&<=
FF/7DCghEsG^U]QEXEp3>]aP%FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6n
FCeu*@X0)<BOr<*Eb0<'DI[6#De9>!+B<;n@rGmh+Cf(nEa`I"ATDiE+@^9i+Dl%;AKYMpFCAm"
F!,O8AKZ).AKYr4ARTFbCh4`$Bl%>f+<Xp2AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]K
DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U$=%.[A:%m*F_t]1@<?(/$49aGATD?)@<,p%F)Po,+C%TK
<+T0\F(KH8Bl7R)+F.mJ+DkP4+Eq73F<G[D+CSeqF`VXW$4:$IAS5^pHY%);D.R`rFCfl)0eQ`=
>\S:kD$hC.7:^+S+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<WM+Cf(nDJ*N'FD,5.
DKTf*ATAo3Aftf*A7]um+<Y04CisT4F"SS7BOr;sAS,@nCige6F!,(5F`JU6F`\aJBPDN1D..]4
Eb0<7Cige6DBNb6DJ()0@;TRs+EDUBDJ=!$$6UI5DeEX'BOu3:+B38%A7]7kARTXk+E)9CBl7F$
ARTXk+DG_(AU#>-DesQ5DK?q1BOPdkANC/*>[h8WBl89@ATD6gFD5T?$=%%OB5)71D09Z:Bk)'t
F+&BlI9TrtARfgrDf.%O>\S(dAU&*$D.S-$$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.>]aP%FEDVO
C2[X!Blmp,@<?(/+Eqj7E-!.<Df021F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+BlaV(+Cf>-
FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l0Hak=@<,ddFCfK6
/d`^D6YKnGB4W3-BPDN1G%#30AKY]!+F.mJ+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7CAM,*,Ea`p+
ARlp"Bl7L'+CT;%$6UI1Eb/`lARo@_+EqOABHVD1AKZ&9EbTE(+C'#"G]\%LHWO*2:eX;D7"$2%
Bln#2A7]@]F_l.,+<XoTCh7X/<,ZQ!>]aP%FEDVO4t\H?5(.i3$=%.[A:%m*F_t]1@<?(/$>OKi
F)Q2A@qB^mFEMOX0ht%f.V`m4F)Q2A@qB^mFEMOF+<Y_W/Kc0GEb/[$ATJt:@;]Tu+<YK=@:XF%
+<X9P6m*U_AThX$DfBQ)DKH<p:-pQUA8,OqBl@ltEbT*++D,Y4D'2GH6m-#_D/aPK%15is/e&._
67sB[BPDN1+<Y`8EbTK7+<Ve:Eb/[$ATJt:+CT.u+<YK=@:XF%+<Yc>AKW*f:IH<J+Co&,ASc:(
D.RU,%15is/g+\=@ruF'DIIR"ATJtBC2[WnATfUI+DPh*/0K(WBl%i>/g)99D]j(CDBO%7BlbC>
F(96)E-*3FFD,4p$;No?+D,P.Ci=N3DJ()/F`VXIBQ%]t3XlEk67r]S:-pQUG%G]'@<?4#3XlEk
67r]S:-pQU0I\,:+?1u-GV(p.0R+^PDfQt%Bl7I"GB5;X9jqN_+A?KeFa,$GF`VXI@V$ZrDKBo.
Ci!Zn/e&._67r]S:-pQU0e"5EBOr;Y:IH=6A7TUr+Dl7BF<G%(+DG_7FCB!%ARmD9<HD^oE+*6n
@;[30D]ib3F*(i,C^g_H67sB'+<Y<.DImisCbKOAA.8l@67r]S:-pQU1+=>FBOr;Y:IJ,W<Dl1Q
+CSekDf-\7F`VXI@V$ZrDKBo.Ci!Zn/g+/8AKYr#@r5Xl+EVNEBl8!6@;K`h$;No?+<VdLB4Ysl
Ea`c;C2[X(Dfp)1AISuA67r]S:-pQU1FXGGBOr;Y7S-9B;]oLZA8c?.D09oA+C\n)Bl8!6@;Kak
A1f!)F(HJ5@:O._DBO%>+DG_7FCB!%%15is/g)8Z+Cno&@4uA-Bl%@%%15is/g)8Z+:SZQ67sB;
.3MT'AKYMtEb/a&DfU+G@ldk0De*m,Dff5,.!KBC.3NPL+>7DHD.PAI,Y1^*7=?h(De*m,DfdWT
-u<U8Fa,>E$;No?+<VdLD09oA+C\n)ASlC.GqKO5:-pQB$;No?+>kSj:2_7I:IH=9Bk)7!Df0!(
Bk;?.GA2/4+DtV)ATJtBC2[WnATfUIC2[W6+E_d?Ci_$JAU%p1F=n"0:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emNRGqq2c$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GT]ARdGT
+CSekARlp$DffP5@:F.tF<G"4@kW.BE$/b$Bl%p4AKYo/+>u&!@VKp,F*VhKASlJt$;No?+>Gim
@<+([+ED%1Dg#\7H=gl-ATJu)AT23uA7]XgGp"[]GA1l0+Du+A+EDUB+E)-?@;Ka&8g&2#F*(u1
Et&IO67sB90Pt6D0f:(qATMs)A0?)1FD)dFC2[X!Blmp,@<?'0%13OOEb065Bl[c--Y@(/ATJu9
@<63,Eb/lpGT^O2E[M;'%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A8,q&
FCB!%3B9*,4ZX]55s[eODe*R"F*(i,CcOL9-QlV9@rGq!@<6!&4=<E\6#(=KBl8!6@;Ka?3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0?8Ec,q@Eb0<7Cige<Afto(DKU1WF`(o<+Cf>,D..<m
F!+n4+EV1>F<GXHEbTE(%16ceF*'Q+><3l^+Z_;"-R^>d?Q^mB>p([@-Qmea+EVXHALSuN?O[>O
$;No?+DkP&AKYD(A8-'q@ruX0Gp"Li+EM[8@qB_&/0HVhAmoCiF`M%B%16r\CLq$jE]lH<+Z_J'
3]\rU%13OO:-pQUGB.D>ATJu&+Dbb5F<GL6+C]V<ATJu9D]iY+Ch4%_GB.D>AN`(/+Z_A$?!oc[
/grM2-9a[C1Eee5.4G]5%17/fFEMP;De*p-F`Lu'4ZX]A+?CW!%13OO:-pQ_F(KH9E,'<%F)Q2A
@q?c*FtG9g+CfG'@<?(%+<Y*1A0<!;Ci<`mF!)SJ8l%ht+Co&,ASc:(D.RU,%15is/g+\=@ruF'
DIIR"ATJu+Ec5e;8l%htA9Da.F"Rn/:-pQB$;No?+Dl%7@:VDA+EM+9F`;)6A92[3EarZ'F`g8g
DJsQ,%13OOBkAt?/M:XHG\M5@+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2IC#FCfJFBkh6-
+CoCC%144#F)>i<FDuAE+=BTU;GU1O+A,Et+CSekDf-\3F!,@=F<G:8F*(i,Ch7-)+ED%8F`M@P
%16Z_F(K&t/g)_uAn?4$F*&O>De+0.E'5frC2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9A7]p:Bkh]:+CoCC%144#F)>i<FDuAE+=BTU;GU1O+A,Et;bpCk6U`,+A7TUr+DGm>DJsV>
Bl8!6@;KakA1&L?ATW'8DCuA*AScF!BkAt?/M:XHG\M5@+DPk(FD)dEIUQbtDf0VLA79Rg05>*5
Ch7Z@C1_0rATKJ<C3(aFA8a(0$6UI4D/XQ=E-67F-Ugp2:Js4r8k)BG78k=;A7TUr+DGm>DJsV>
Bl8!6@;KakA1&L?ATW'8DCuA*ASu$2%13OOEb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+A,Et
+EMIDEarZ'A8,OqBl@ltEbT*++DG^9Eb0E*EcYe7E+*j%+E):2ATA4eA8,OqF$2,u4$"a3FD5Q4
+DPh*+DPh*A7]p3%16f]/g)kkAM,*9Bk)7++D!/JDe't<-Qlr</e&.1+EMC<F`_SFF<Dr";Gp:g
3ZrK^D.Oh^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.AU%p1F=/2OATW'8DCuA*ASu$2%13OO
:-pQUBkAJr+A,EtEc5l<+D,P.A7]d(BlbD-AS,XoARlp+F(HJ.F:ARkAhG2RIO@:*/o#<8Ec5l<
4Y@jlE+*j%+=DV1:IK5ADfdW[+CoCC+<V+#+<XEG/g,(SBOu3uF(HJ:F(HJ9BPDN1A7]@]F_l.B
%144#C2[X'Df9_\/g)MpC2[W9-Qij*+<YB1/g*_T=%Q.0A8a(CC2[X'Df9_\/g)NO3[ZInDe*m,
Dfd*2$6UI&Cia/?+:SZ#+<VeADe*m,Dfe,p+=KoQ+>#3p+D>\7F<DrB@q]d',Y1^*740N8C2[X'
Df9_?%144#ASu$2%16ZaA1e;u%16f]/g)hj4Wkt(+Co2,+DPh*Ec5l<+CoCC%144#D..3kA8-',
4DJeFEc5l<%144#F)>i<FDuAE+=BcW6m-MgDfd+4Bl[cpFDl2F+CfG'@<?'k3Zoe$C2[X'Df9_,
$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;E>q<Df0-'E--@J8l%htEc5l<+Co2,ARfh#Ed8cZ4s24(
C2[X'Df9_?Eb0?8Ec*K=$>"*c/e&-s$;No?+CfG'@<?''A8,OqBl@ltEbT*+%17/nDfp/@F`\aD
ATqZ--np!YBk)7+.4dSrDe*m,DfdNl0RI>E@ruc$$?L'&F`_SFF<GI4G@VgE0mdGF@ruc@/3IZc
A9)U,F=]L.HXpi#FE7luF)>i<FDuAE+Dtb7A0<9UHXpi#FE8l^4DJeFEc5l</3>V6A8,OqEt&Hc
$;No?+EDUB+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08%172oE,]6-BK[sjC2dU'BHS[O@:WneDK@ID
ASu("@;IT3De*p-F`Lu'0..29%16]cEaN?k@rs=GA8,OqF!,"3/e&.1+Co1rF?M6!4(N&8F:AR"
+EMC<F`_SFF<Dr)Ddd0jDJ)!Q-S/eB@rr.e+<XEG/g+kGF*2M7+Co1rFD5Z2@<-W9E+*j%+E):2
ATA4e+<YT5+FGdi5!!4g@ru'lDId='.=3[XBk)7++BosE+E(d5-RT?1+<XEG/g+tK@:UKkF_u(?
F(96)E-)Nr+<W?]3\V[=FDYu9@<?06A8,Oq/13&aC3(a3$6UHd67sBpDKBr@AKZ2.+ED%1@;0U%
Bl5&;DfTW-DJ().De!3lAISth+Cf>"F`MM6DKI"CD/a<0@p_Mf6#(=KBl8!6@;Ka?3B:FU$6UHd
67sC$AS5RlATD4$AKYK'Df]tBEb/ioEb0,uATJ:f+<YcCE,oN%F$2,u0Hb"EDdmc74s58++ED%:
D]gDT%144#F)>i<FDuAE+=BNsDf]tBEb/ioEb0,uATJu,ASu("@<?'k3Zoe$A8,Oq%16ZaA1e;u
%17/nDfp/@F`\`R;cQ1P78m,G+ED%+BleB-Eb/c(8l%htA8,OqBl@ltEbT*+-QlV91E^UH+=ANG
$?L'&F`_SFF<EC_De't<-OgD3%13OOF(KH9E,'<%F)Q2A@q?c:%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6#(=KBl8!6@;Ka?3B:FU$>j3hBkCptFD>`)1,2Nj/g,">DJ<]o
F*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZX7
0J5+'/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$
GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gk
C2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi
@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)
Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%
C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k
/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9
Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&Ik
De*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-
Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*
+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARloo
Bk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,
ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5
Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9o
FD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV
+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH+
+DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.
Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKS
DImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7
AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:Wne
DK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>
BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*
FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9+<V+#.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV
%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen3-OgDP:J=/F;E[&g
B4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#
$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)d
A7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi
$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi
$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>
F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%14Nn$;s;d76sj@
4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85
GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$
F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)
EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VL
B4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.
8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>U
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?
+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$
%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_
:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP.41*A.kA7]p3%15R#9LM<I
4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<
77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&Ik
De(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ
6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0
+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DA
FD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD
+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$
@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5
BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1
DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r
:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d+
+EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"
+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@ID
ASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$
ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3
+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cj
BlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)j
DflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[
@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9
A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<
+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*
$7QDkE,o].De(UX:-pQ_E,o].De'u3/M/)[De'u0Ec5](@rri7ATW'6/e&._67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i3AT2a&D.7's+>PW)2[p*h67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)o'0K3o[F>5]s@:Wn[A0?21Bl%@%%15is/g)o'0K<u\F>5Km@:Wn[A0=0:
6V0j/2'?FPD/aP*$;No?+>PW)3,`;K0f1"eDKBB0FCeu*5uU-B8N8RMF(KH8Bl7Q+Bl8$2+DPh*
A7]p,C2[W*F`_>6F!,F1Ea`frFCfK6%15is/g)o'0f`cU@k]e`Eb0H8BlnH.DBNP0EZdss3A*!?
+:SYe$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ci]De*BiFs(O<
A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6DKI"FDfTW-DJ())
Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%JP+=CoBA92j2Eb-U-$4R>;67sBsDdd0!
F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is/g)NUC2[W1+D58-+FPjbB6%r6-YII=@r,RpF*2S=
Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7B+pF=.M):-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=
ATqg%FCf3.@rc:&F=.M):-pQU-Y[=6A1&L4ATVs;+?MV3FE8R:B6#,/An*22%13OO:-pQUE-67U
G]IA-+>"^MDKBB0FE8RADe*QoBk:ft8l%htGAhM4F!,17+E(_(ARfg)Ci<flCh4%_6r-0M9gqfV
6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/nDfp/@F`\aFEZc`VISP??-OgDoEaa$#+=DMb:4@U=
%14L2@4*U@De*KfBkhQs?R[+1ATT%BH[\_=I4#I2.1HUn$;No?+EM+9+A,Et+E_a:EZf./H#k)[
+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)-OgD2
FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%BC2[X%Eb\TqATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJ
Df00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R8l%htE,ol3ARfg)F(KH9E$l)%E,o].De*Zu
FCfK$FCd3^:-pQ_E,o].De*ZuFCfK$FCcS9/M/)[De*ZuFCfK$FCcS6Ec5](@rri7ATW'6/e&._
67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i-@<itN0JY<k$;No?
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%16QTBk)3kBkhQs?TgFm4$"c<-Y[F/GUG((4u%CpBk/>?.3g3SD.Rr7
-RgSoC2[WnATf22De'u5FD5Q4-Qij*De'u"A8,Op?YO7nA7$H`+>Y-YA0<6I%13OO:-pQU@s)g4
ASuT4GAhM;Bl7Q+B6%p5E$-_TFE_;)CER&,+Dtb%A7]9\$>OKiB4#@fDe*3</g)NVDe*ZuFCfK$
FCcg/$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is/g)NUC2[W1+D58-+FPjb
B6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7B+pF=.M):-pQU-Y[=6
A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M)-Y[=6A1&L4ATVs;+?MV3AnQ-,BkCj&+:SYe
$;No?+E2IF06hMKAfrZJBl8!'Ecc@FD/Ws!Anbge+DPh*Ch\!&Eaa'$+EqaEA9/l-DBNk,C1Ums
+Dbt+@;KKa$;No?+@K!m<D>nW<'sGU9gMNB?YO7nA7$HB3Zoh)+?CW!.1HVZ67sC%D/XQ=E-67F
E,m'KH[\_=I4#I2:-pQUATD4#AKW@IISP??-OgDX67sB/-XeARC2[Wq?YO7nA7$c.B4Z0--[U;;
IXNRQ$;No?+=Ra,%15is/g,4HF<G=:A8Gt%ATD4$AKZ,:ATAo/AU/>>/Kf(FEHPu9ATJtd+ED%0
Ddd0!FDi:1@ruF.@<?&i$?L'&F`_SFF<DrRF(KAbAU/>>Eb0<'F=.M).!0Au:K(484!8l2+=nWi
+E2%)CEPGVB4Z0--YdR1Ch\!&Eaa'$<HD_lCLqd4-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7
CLqd4/n8L+-Qij*F)>i<FDuAE+=CoBA8Gt%ATD4$AKYr4De`inF<GX9FEMOF/Kf"TF<G4:Dfp"A
BlbCE/8B*6?YO7nA7#cQH?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XH
CghEsGT^U4Ch54A8l%htF)Q2A@q?csEt&I&+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4rF)to6
/g+,,BlbD/Bl%>i$7-g'F)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..NtEbSru
%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+FD,B0
+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=EA8Pah
D@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeG
A7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*+<YuV
H>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r
%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZL
I16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6IXWLa
8l%j'+B*3$EarZ'6Z6LHI16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.
FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h
ASli)$=%X`FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi%16?W@;BFr
Bln0&%16?^@:F%aDe<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tVH>7A/
Df.1LAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ>\S(pF`_tV
H>7A/F*)>@AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm$=%I[GApu'
AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.DesJIFCf]F
%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO
>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@
AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3            ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o0d&A1+>GSn2DZI10d&>/+>GYp1c6C11*AD3+>t>s2c!+88l%iMDffQ3@rc-hFCeuD
+>PW)2.U9.0eje&+Cf(nDJ*Nk3Zp130K3NR@k]b_/Kf+V@;]UaEb$;+ART+\EZee$A7]:N:IIuc
8l%i^D.I^+F`Lu'+D,P4+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%
E\CBf6r,FPA7B[qCh.:!A8,e"F`:l"FCfM9@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+DG^9C2[Wq
BlkJ.Bl[cpFDl2F@WcC$A86$nCghEsG\:T*ATD4$ATJu8H#@_4GT^[6B4u*qB4uBuA0=K?6m-Ph
F`Lu'+A?3CAQWGYARTIuAU%Qk@<>seFCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>
D/^V0Bl%@%E,o].De*U$A0>i3De`inF<GX9FEMO                                   ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ER'
zz=:zz,'R003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012'
zz=:zz,' ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR'
zz=:zz,'022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GRO'
zz=:zz,'UP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface'
zz=:zz,' JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRI'
zz=:zz,'PT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXE'
zz=:zz,'XPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK'
zz=:zz,'006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDE'
zz=:zz,'L PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEX'
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;'
zz=:zz,'._1 '' jodliterate BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGINNOTJ'
zz=:zz,' CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOK'
zz=:zz,'ENS IFACEWORDSPFX IFACEWORDSjodliterate JLAUTHOR JLBUILDTEX JLCODEF'
zz=:zz,'ILE JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE JLOVIEWSUFF'
zz=:zz,'IX JLOVIEWTEX JLTITLEFILE JLTITLETEX JODLiteratePreamble LATEXTMP L'
zz=:zz,'F MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP ROOTWORDSjodliterate THISPA'
zz=:zz,'NDOC WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAPPREFIXTEX afterst'
zz=:zz,'r alltrim beforestr betweenstrs boxopen changestr ctl cutnestidx db'
zz=:zz,'quote dbquoteuq decomm fboxname ferase fexist firstones formifacete'
zz=:zz,'x formtexindexes fsize fuserows gbodylatex gheadlatex gpostlatex gr'
zz=:zz,'ouplatex grplit ifacemarkd ifacesection ifacewords ifc indexgroupte'
zz=:zz,'x indexwraplatex jpathsep jtokenize latexfrmarkd markdfrghead markd'
zz=:zz,'frgpost markdfrgroup markdfrwords markdj markgassign markgnonj read'
zz=:zz,' rtrim sbtokens setifacelinks setifacetargs setjodliterate tlf toJ '
zz=:zz,'tslash2 utf8 wfl winpathsep wrapvrblong writeas''),(<<;._1 '' jodstor'
zz=:zz,'e CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK'
zz=:zz,' CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR05'
zz=:zz,'2 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ER'
zz=:zz,'R062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071'
zz=:zz,' ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR'
zz=:zz,'082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 '
zz=:zz,'ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR1'
zz=:zz,'01 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS INVMACROS IN'
zz=:zz,'VSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055'
zz=:zz,' OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTI'
zz=:zz,'T READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwor'
zz=:zz,'ds backupdates badcn bchecknames bgetdicdoc bgetexplain bgetgstext '
zz=:zz,'bgetobjects bnlsearch bnums bpathsfx btextlit checkback checkntstam'
zz=:zz,'p checkopen checkpath checkput closedict createst defwords delstuff'
zz=:zz,' delwordrefs didstats dnlsearch dupnames freedisk freedisklinux fre'
zz=:zz,'ediskmac freediskwin fullmonty getdicdoc getdocument getexplain get'
zz=:zz,'gstext getntstamp getobjects getrefs gslistnl inputdict invappend i'
zz=:zz,'nvdelete invfetch invreplace islib iswriteable iswriteablelinux isw'
zz=:zz,'riteablewin jdatcreate jwordscreate loadalldirs loadallrefs loadwor'
zz=:zz,'ds mainddir mnlsearch newdparms newregdict nlctn nlpfx nlsfx nubnlc'
zz=:zz,'tn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc putexplain p'
zz=:zz,'utgs putntstamp puttable puttexts putwords putwordxrs rpdtrim rplct'
zz=:zz,'able rplcwords sortdnub splitbname''),<<;._1 '' sunmoon IFACEWORDSsun'
zz=:zz,'moon NORISESET ROOTWORDSsunmoon arctan calmoons cos fromjulian moon'
zz=:zz,'s round sin sunriseset0 sunriseset1 tabit tan today yeardates''     '
zz=:4283{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GU(0+>P&q+>Y`-3?U%2+>GQ02`W!?+>bc,1*ALu3A<4'De)U0/g)WYDe'u#/M/)^@;0U%8l%ht
A8,OqBl@ltEd8d;CghC+/e&._67r]S:-pQU6#:?[DffZ(EZen,@ruF'DIIR2+Cf4rF)to6+CT;%
+D#e>ASuR'Df0V=De:,6BOr;sBk)7!Df0!(Gp$U5@<6KB%15is/g+,,AU,D,Cht5:F(HJ8FCB&t
@<,m$@rH7+FCB'/F!+n/A0?&,Eaj)4A7]@eDIm?$Bl5&8BPDN1@r,RpF"Rn/:-pQB$;No?+@C0\
@<?4$B-:V*8l%htDdmHm@rri(AS,XoATJu&+=Lr=De(:>Ci<flCh4`'DKKH1Amo1\/e&._67sBK
ATMs6Dg?&7B-:V*8l%htDdmHm@rri)Eaa$#F!,R<AKWC8C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!
:-pQB$;No?+@C'bFCAm$F#kFSBk)7!Df0!(Gp%6OBl%L*Bk;?:+Cf>-F*(i.FE8uUBl8$(Eb8`i
AKZ/-Eaj)!$;No?%15is/g*`'FCfK)@:Nk0+=MDEEaj)4D.-sd+CTG%Bl%3eCh4_uGp$g9De'u,
De!3lALS&q:-pQU+<Y-+ATT%;+<Y<.F<GL2C1UmsF!,(8Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+
F!(o!:-pQU+<Y-2C`jiC+<Y-%@r$4++DtV)AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Co&"
+<VdL+Co&"ATVK+GAhM4F"AGUATMs7/0JSGDfp#?/0Je<@rcL//0JMG+Ceu)ATD2g$;No?+<Ve;
Bk/>/+<Ve;Bk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2%15is/g)8ZA8Z3++<VdLA8,OqBl@ltEd8dF
@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;E-#T4+<VeJATVu9A8,OqBl@ltEd8dH@<,dn
ATVL(Et&IO67sB'+D54rE-!-E+Dbb5F<G4:Dfp"A@;]TuF*22=AKYMpE+NotASuU2%15is/g)8Z
B4Z0-+<VdLB4Z0-GAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Ao_g,+Co1rFD5Z2@<-W&
$;No?+<Ve>Ci<d(+<VeNDfTA2@;]TuFCfN8+D5M/@UX'qDIIBn+ED%*ATD@"@qB]j$;No?+<Ve>
Ec<-D+<Ve:Eb/[$AKYE!A0>l7ATE&=B6%p5E-!.1DIal2F_Pr/Et&IO67sB'+DkP&AKW*<+D58'
ATD4$AKXSfF(96)E--.D@;]TuA79Rg@UX=h+CoV3E,uHq:-pQU+<YN=C`jiC+<YN0DL!@8Bk)7!
Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<YQ5G@Vg=+<Y07ART[l+Dtb7+Co1r
FD5Z2@<-W&$;No?+<VeFA0<!;+<VeFE+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8Z
E+*6lA0<!;E+*6l+Co1rFD5Z2@<-'nEt&IO67sB'+E2IF+<VdL+E2IF+EqaEA90:EFCfN8F"AGN
@:O=rF"AGFF<G()FCfK$+DG_8D]iS)@ruF'DIIR2%15is/g)8ZEb/lo+<VdLEb/ltF*(u606M/Q
AS5^uFCfJ8@3B)p@ruF'DIIR2%15is/g)8ZEb0<6A0<!;Eb0<6DfTD3CghC,+C\bhCNXS=@rc-h
FCeu*@X0(EE+*6lA17rp:-pQU+<Y]LF!)SJ+<Y]9B6A$!EZeq<E,oN2F(oQ1+EM+&Earbl$;No?
+<VeLF(KD8+<VeNDfTB0+E_a:A0>?,+EqaEA9/l%DIal3ATMs7%15is/e&._67sBUDffQ33XlEk
67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'+D#S6DfTnA0JG140Jkd=%13OO@rGjn@<6K4+=CT4De(4)
$=e!gDKBB0F<DrFC2[W1%13OO:-pQUFCB6++CSekDf-\6Ddd0fA0>JuEcZ=FAoD]48g$,H0JO[Z
$?B]tF_Pl-+=Co9Bl%@%+ED%+AU#RF+:SYe$;No?.V*+0ASu$iDKKqBGV(KiGAhM4F!,")Anc-o
A0>T(+EV:2F!,O8@ruF'DBNV$G%De:ASbdsARlooAS,XoBln'-DK?6o%15is/g+hGF*&OGE+NNn
Anb`tH6@$B@ps1b+Du+?DK?qAATT&*F`M26B-9ehE,ol/Bl%?'Ci<`mBl7Pm$;No?+=J]g4ZX]W
7TW/V+B;0&9gp0r7S-BS%13OO:-pQUCh[cu+D,1rA1Sj5@<-C&@:s-oEb0?8Ec*ENFCAW$@;]Tu
Ch[cu+D#G$Et&IM7Qide0RI4\%15I#4ZY;RHXSN9$<0;X4ZYTM@4hur6W-TI4ZYr./5/MB$4R>;
67sBt@:O=r+EM%5BlJ/:DfBf4Df-\-De*F#+>"^XD]iJ!A0>`-Eb-A%A7Qfk+Dtb7+E(_(ARfg)
@rGmh%15is/g+S?A0>`-A8,Y$+EV:.+D,P.Ci=N3DJ()&AS,XoBln'-DBNk0+AG-h;GU7p:dkg#
8lJ)T8PiAL3\iE!$;<`b79D]61,9:G85r;W4ZY>S%16339KbEl1^sdk79EMP3\iQ%$:7lp76N[e
2@U!f5uL?D:KL:S3\iW'$<:%p3'B;X3"63k=]@pf:-CWn3=Q<o;+s,61GB7F8lJM\4ZYAR%13OO
:-pQUD.-ppD]j.5G]Y'MH#R>9%15fq6W-]Z=\qOM3_E=<;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng
/4*K=74_/!;G0DR=&(;H<(8hu:g$ag:JNH>;+rN5;bp-t$4R>;67sC!@VTIaF<G(3A7]fk$<L#$
6p3Rb%16'';cGn@0b"I[;GU:h4ZY>-$<'qr<(/r21CX[c5snOG4ZYD/$4R>;67sBkBk)7!Df0!(
Gp%0>Ch=f1AS,LoASu!h%15Kp6W?WQ:-hc\4ZYG0$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7
E+NotF#kFF:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/:I7ZB6W?fJ4ZZY?;FE'878m/:7oE,_
:b5OF8Q8,09gM-E:CRX?$;No?+C\bi+E(_(ARfg)@rGmh/0JJ7E+NotF#kF>6:s[6<),di$=[FS
DdmHE3a4Wf/M8/M3Zon)0-FI[+=nX@+D!/J:I7ZB6W?fJ,$tcd%15is/g,+AFD)e-ASc'tBlmp,
+Cf(nEa`I"ATAn?+E1b2BHV8:DI[d2@<?4%DBNG&@<,ddFCfK6%15ot<(KDG9KbEZ8OccQ:*=m+
-SJ^P%15ot<(KAI;H#_>-QkH&/LN)G5u^BC78+-t%15is/g,+AFD)e?ATD7$+>"^ID.7'e+>6tB
@q]:kF!,")E+NotBl7Q+Df-\2Df^"C:K%]0BQ%s6F(K;R3ZohB7TW/VHRCIO-RgAj-n%YV=%Q/6
-X8;P.3M275WV%N>q(1N%13OO:-pQUAU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'j
A0>JuCh4`,@;TRs%16imF*)A0FD*fu><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m
+BplL.kWJ[/g*tV<(KDG9I;n3$4R>;67sBkAS,@nCige:@<6O%EZf=ADe<^"AKZ,:ATAo0De!3t
Bl@m1%15is/g+nIA93$;FCf<.@<?0*BlbD5AS-$,B5DKq@;I'"ATD?)@<3Q5BPDMs$;No?+Eh=:
@N]B++Co%qBl7Km+DG^9C2[X$DD#X<Et&IK9gM]W78c90C2[X(H#n(=D/`p*BHS[;D..L-ATB.-
$;+)^:f:(Y4Z[=rA93$;FCf<.@<?0*-YdR1E,ol/Bl%?5Bkh]:%15^'6rd/S;E['UDe*p7F*(u1
E+*j%+=CoBA9Ds)Eas$*Anbm1Bkh]:%13OO:-pQ_ASu$hAT23uA7]Y#Et&IkDe*ZuFCfK$FCe36
/h1USA8Gt%ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&Eaa'$+EMIDEarZ'@rGmh+CoD#F_t]-FE8R8
Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6gFD5SQ+EM+*+EV:.+D,P.Ci=N3
DJ()$Ci<r/E,Tf>F!+n/A0>N!FD,f++D,>(ATJ:f:-pQB$;No?+D>k=E-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370+A7`67sBoFEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?
H#@_4GV*TCB4u*qB4uC$DJ(U3$;No?+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=
@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5%15is/g+hLFDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:
Ch\!&Eaa'$/no9MDIO%^:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)9984c`V5u'gD6QdKo+<W6YAp%p++E1b,A8bs#E+*j%+>"^YF(HJ5@;]Uo
@j#]-Cj@.;Afu#0+EM4-Cht55@<?/l$;No?+<Y<;E,961+<VdL+<VdL+>"^Q@;BEsCghEsGT^U:
EZf"8Dfp"A.![6N$;No?+<YB1@:NkiARfgrDf-[?+>"^MDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1
+EMXFBl7Pm$;No?+<YB1@ium:+<VdL+<VdL+>"^JDfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=
%15is/g)9XATV[*A8Gt%ATD4$AKWQIE,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9A8-'q
@ruX0Gp"[]GB.D>ATJu5Eb/Zr@VfTb$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW*12gZE0JO"D:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f!ZWF>,Kn
.!R0`B6%s-BlkJ+EbBN3ASuT4@:Wn[A0>u4+EM[EE,oN2F!,LADfd+DAU#>9G%G]<EbTW,Et&IO
67sB812gZE0JjnbEc6)>+A#$g6Ub'P;FFGrEc6)>DIIBn+D?%>ATDU$DJNfo%15is/g)l(De!lC
2'?pNE,8rmARloF3ZrBMEcYr4B-;D4FD)dFG@kY?+>"^L@;]UlATJu'@:UKq+Cf>#AISuA67sB8
12gZE0K:1`A7T7^+D#S6DfQt6@;]UlBl7Q+/Kf(FE,8rmARlo3GB.D>ALSaGBln#2.!K]GFCem%
.1HVZ67sB812gZE0ejeZA867.FCeu*9OUn3=<MR'ARTFbCh4_@+Cf(nDJ*[$B-;&0DJs-*DKKq/
$;No?+>GWi@rsF\+CSekARlo3F(060CLqC).3L2bF`V,+F_i14DfQt/DII@,H>.80+Cf>#AKZ)+
G]XB%:-pQU0f!ZWF>5]s@:Wn[A0<:EEa`p1Eaij'DJ(C@/KekJDJ()5Dfp)1AKYf'DIml3DJs_A
GB.,2E+NPh$;No?+>GZ_ARdJU+CSekARlp*D]gHC@:O(o.3M,pF@^O`+ED%4Df]W7DfU+4$;No?
+>PWf@<jOc+CSeqF`VY9A0?)7Eb$;)DfT]'FD5Z2+=MGGCagK=DfQsm+?;&.0b"Ib67sB90Pt6D
0K:1tE+EC!ARloqDfQt1F`MM6DKI!LE+*WpDdt4=G%G]8Bl@m1%13OO@rGjn@<6K4+=CT4De*Zu
FCfK$FCcg/$=e!gDKBB0F<DrFC2[W1%13OO:-pQ_A7]^kDId<rFE7lu:-pQUA7]7e@<,pi+D5M/
@UX'qBOu3q+EVNE@<QR'A0>B#DJ"$4Bl7Q+9OUn3=<MKiD.Rc2GA2/4+A*bo@;TRs%15is/g)Pl
.6T^78k`2U<(o_[79C[)9M\\\79<GW=<L406<-TN6rZTW+A,<t;G^%Y<)c:g+A,Et9PJT[Eaa'$
:i^,UD.7<m%13OO:-pQU;K$2ZEZdnqBd[sEGAhM4+D,P4D..O#Df-\=FCB9&+DkOsBPD?q+>"^W
Bl.R#Bjl$)FDi9`3ZqmSF:ARP67sC"@<-F#F!,R9G]Y'PBln#29La(S+ED%8@;0V#+EqL5FCfN4
@:Njk@;]TuBOPdhCh7Z1DfB9*+E;OBFCfMG%15is/e&._67sC(ATD6gFD5SQ+Du+>AKYMtAnGUp
ASu!h%15is/e&._67sB'+<Yl?CaU_d+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$;No?+<VdL4$"`>
0-Fs]+>P_q2(Tjt-VmQ-:*<D6:K0b1%13OO:-pQUBPD!g+EM%5BlJ/:Ci<flCi^^B-n6Z//g,"C
C`me2C`j/oD.[TI/g)o,2C't!+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sB_+E)@8ATA4eD.[TI
/g)kk+=K6$@4l7H-Qjcc+<VdL+<VdL+FS*=C`jiq67sBZ+EqL5FCfN4@:Njk.!'?9@q?ckDIal'
DfTQ<Df0Z*C`mh.@OV`nD.[TI/g)nl+=Jch@4l7H-UD/g.4[&c/i#=6+FS*=C`jiq67sBH+@.S_
+CQjJ+D#e-Cis9&DJ((e+@6MED.[TI/g)qm+=LYNBeCc.-Rg/\+<VdL+<VdL+FS*=C`jiq67sBU
+EV:.+DbV2FCfJ8:(7PIAo'U_+>b2`-t+`B/git5.3K`U+<VdL+<VdLI;NS4+<XEG/g*J'FD,5.
Ch7^1ATAn[%16raCcsBn2'="i@4l7H-SR811GgsI2`Ng)-Rg0dD.[T,+AP6U+?:QTBkM.%F!+n/
A0>4g$>jBk4Y@j8+<W(@/nlpc/gi(j+<VdL+<VdL+<Z)LAo&S4:-pQU6m+)k$>jBk4Y@j9+<W(@
/nlpc3[Z@!+<VdL+<VdL+<Z)LAo&S4:-pQU6QeE!$>jBk4Y@j:+<W(@/nlpc-RU8j+<VdL+<VdL
+<Z)LAo&S4:-pQU;'9k$DffP"$>jBk4Y@j;+<W'e1FXFh+<VdL+<VdL+<VdL+<Z)LAo&S4:-pQU
6W+@#D.[TI/g)l&+=Jru.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBS7L]\6$?Kfq4Y@ja10n-/
0d(ls+tbr0?SW`P0H`D!0I[G<-QlM6+<VdL;]m2*+@.+m+<XE%+<Vdn+<VdL3?TFe+@I=p+<X#o
+<Ve(+<VdL6W,$L+<Ve#7N`g$>qc]p+>Fun+<WBo+>Fu]1*A:o+>Y,p+<WE^0d%Ss+>Fu]0d&1n
+>Fun+<WTc0d%Sn0H`(m+<WB]0d%S]:-pQU0H_KPDJ=3,@;HA[+>Fuo+<WBo+>P&^1*A=p+>Y,q
+<WE^1*@\t+>P&^0d&.m+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0d%TWFD,6+%1444+>P&^
0esk,+<WE^0H_Jn+>=o\1*A7n+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)nl
+CT)*05boL%1444+>P&^0esk,+<WE^0H_Jn+>=o\1a"Ip+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm
1*@\^0d&4o+<XEG/g)qm+AN@Q+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\2'=Rq+>Fum
+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU1a!o964F8E3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe
0H_Jm+>=o\0d&.m+?:Pu+<WBm+>P&^+>Fuo+<Ve%67sB<+<XEG/e&.10d&:q+>GYp0H_Jr+>=o\
2BX[r+>t>r+<WQb0H_Jr+>=o\0d&.m+?(E"+<WBm+>P&^+>Fuo+<Ve%67sB=+<YQED%-gp2]sds
+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\2]sds+?1Jt+<WBm+>P&^+>Fuo+<Ve%67sB>
+<W$@$6V&G1*@\o0d&4o+>P&p+<WH_1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>=o\0ea_*+<Vd]
+>P&^+AP6U+?1Jd-RT?1+?:Pu+<Vde+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe
0H_Jm0H`+n+<WB]1*@\^:-pQU3?TGSDf'?&DKH<p+>Fuo+<WBn+>P&^1*A=p+>b2r+<WE^1*@\t
+>P&^0d&4o+>Fuo+<WTc1*@\o0H`+n+>GSn0H_J\:-pQU0ea_;;@NsU0d&4o+>GSn1*@\p+>P&^
1a"Or+>P&p+<WQb1*@\o+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB80d&h]9L]Hu+>Fuo
+<WBo+>=o\1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU
0eskmE+*6f%1444+>P&^0f'q++<WE^1*@\q+>P&^1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm
1*@\^0d&4o+<XEG/g)l)+EML1@q?ckAoqU)+Du==%14Nn$4R>;67sC)DfTA2AoD^,@<?4%DBNP0
EZf14DImku$?p)u4ZX]60KX>fCccKGCagJR+?MUn$4R>79LMHM771$M;HZ.D+=ANG$;No?.V3L.
A7]^kDId<rFE7lu%13OO:-pQq4FVa.INWt[/o4s<AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu
@<H[*DfQsP+EMX5DId0rA0>,o@;BFrBln0&%15^$<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;
FD,T5+CT.u+EV=>Ch4%_>[_bsBQ%p<INs;MF`_;8Edf6^I16NgFD5i5AU@[(AU&<=FF/H]IV3\>
F`;dSIXN>/Ec6)>I16N4%13OO:-pQUB6%p5E$0(BATDs.ATo81ART+\EX`@J9M\\\79<GW=?S\f
0H`D!0F\@8+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.ATnRj>]XIdFD5Z2HX(Z(G]\%LH[[2gB6%p5
E.0$\I3;=/ATDs.ATrP3$7QDk%15is/g+t=FCf\>B6%p5E$/V4Bl%<&F(96)E-*33$;*uY<CokP
<(0nP3Zp+!3Zp*c$?B]p+EM+6F_,H#AKYo'+DbJ.AU#>-Df'?"DIdf2FD,*)+D58'ATD4$AKXf;
7L]]FASiPuF)uJ@ATJu1@<?(*+D#e/F!+n3AKYo/+EV:.+EqaECM@[!+E1b2BFP;iATVa,@ps0_
$=dTh04Z1OIUmCO%16oo@;K@oAU#=?INs;SEc6)>INs:N$>j3eASH$mAU#>H,CX9GDfp#J,CU(/
Cis0&@<?(*+<Z+XIV3\>F`;dSILQX#F^])pFCf\>+FYPaB6%p5E.0$\%16ZaA8H0o@;HA[.1HUn
$;No?+D5_5F`8IDDf9_?FCf\>/KePACisT4F!,=.Gp%!9ARlolA867.FD5W*%15^$7oE/W8Q8YX
=?S\f0H`D!0F\@8+AH9YDBN\4A8Gt%ATD4$AKWC6Ec>i/F=A>K@<?(*+D,>(AM,)RB6%s-BlkdH
B4YslEaa'$F!)Z>Ec6)>+q4l*+DtV)ARlp,ATDj+Df0V=De:,6BPDN1Anc'm+D,P4+D"tkBHToC
6m-,_Dfp"ABlkJ:Ec5H!F)to6/e&-s$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO
>\S(pF`_tZ,CX9GDfp#J,CX`KFDPM@FCf]F%16?W@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu
%16?XATr*%B4VMZ,p6]9D/E^!A9/l*DfQt/A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+
F_u#;+CT.u+DG_7ATDm,DJ()#+EDU@AIStm>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$7/qu
ATVa"DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;$7/r!GAgu0CisT4%16?SDK'`?H[[2gB6%p5
E.0$\Dg#i+G:muKG^U#.%16?XATr*%B4VMZ-!YA+ARfXpF_u"*$=%:_E-68LINs;SEc6)>INs;O
De*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;
HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9
$7QDk%15is/g,">Bl5&.De*ZuFCfK$FCcRg@8pf?+E2@4@;TIiAISu=:IIljFCfK$FCe9hARTFb
Ch5aj+>=p!+>=63,p6r@A8Gt%ATD4$AKYetFCf\>E,oMuD.7<m/g(T1,p3X(,p60#BlbD/Bl%?'
BlbD*+D>J%BP_r:@s)j7Df'37ARlp,ATDj+Df-\9Afu2/AKYr4ARTFbCh4%_,p7&5FCfK,@;I'!
ASu("@<?'k+C]U=E+*WpDdt/9+>%XWDfBf4Df-\ABOu'(E,ol-F^o-'B-7Wj,p4g^AU#>9F`_SF
F=n\T@;]Uo@j#H!B4u*qB4uC$DJ()+F!,CEATDg*A7T7h+CT.u%14C(FD,5.F*(i.A79Lh+DG_(
AU#>3F!,L7A7]@eDIm?2+:SYe$=%+[@s)X"DKKB)@<6Ko0f!]i?$g"#FD56$AUP!p%16?_F(K<!
@r#LcAQrtZDIdfu@;od`HY6o.D.Rg0H$p,/>]k+!E+*6l@:s.UBOtU_Bl7R)?$g1+Ci"'!B4ZK#
$=%^pAT2'fCLLjeHYdP;A7]e!I16NgF`V,5@:O(]B4ZEuD0'cDD.5&)D0'Q&FD-(3$=%^pAT2'f
CLLjeHYI):ATVL./88^4F^]B'G^U#.%14C(E,ol?Bk1dr+C'#"G]\"L@WQ%"BlJ/'$=%^pAT2'f
CLLjeHY-u:CijnWAUP[1$4R=g+E_a:+Dkh&Ec6&FE+L/+AftN*@;0Od@VfTb$=$/77VQ[M7<iNf
FE;eGBk)1%FEqh:/ou,[I=#4AF(K<!@r#LcAUA9.@rcL0H#R>CI=$AO$=%:WDKTe=0O/=(G\(u.
GT\_GAnbLaAo)TuFCf\>0jJ=)4YS!)+DGF1E+ER&AU"Xk+<Xp3F(K<!@r#LcAQs;!AiO(CBl7m4
FCf?"I16NgAScF!+=/.EAfto4@<?(*+E)9CG\(]"FCf\+$6UHrF`V,5@:O(]B4ZF%Df0Z<E+NO-
%144#>\RepATVL.%144#+<Xp3F(K<!@r#LcAUAZ<FEhnJ@4ZYGDJ<U!A7^/u$6UHrAn_\]+<Xp"
AS,@nCij9-DKKK%@<?X4ATN2m@;p1"DJ)+SAU#eKAU&;J;e'6PAN`arFCSuXDg,c5@psFiI16N+
+=/.NAT2Ho@q?cO<DlUm6QgSeFD)e>DJ<U!A7ZlpF`MCC@q]:k@:OCjEZbeu+<VsQBkAK5Dfm1?
AS#BpFD,B0+Cf(nEa`I"ATAnF+EV:.+E2@4F(K6!AKYo'%144#,p7;CBlbD<Bl7R"AKYJr@<,dd
FCfJ8Bl5&8BOr<*Eb/Zr@VfTuAoD^"ATJu:F(HJ4Afu>0CghEsGUstRF^])pFCetl$6UH;>]++s
@rH4$@;]V&>\/%uDgct$<DlUm6[^("+:SZ#+=/.?@;[3/ATT&5FD,6++Dl%7Df]l+@q?cpDf0Z<
+DGF1FD,62-ZWc@@<Q'nCggdhAISth+=/.%+ECn4BOu3,Ch[Zr+B*3$EarZ'6Z6LH+Ad)s+EM+*
3XlE=+=/.DFEDI_0/$dNDeF,D@:X:cAM.J2D(g!VE+3X%B6%F"BR)6d0JP=90KCe-Dfp)1AM%D1
A7[?3Ec3RDFDYh'$6UH;>]XIuD/X<1AoDR/HU`$eAPI)\Dg`'%+<Vt8F(KH1Df0K*Df0ZD;f?f!
@q?cMDe*E%:i^K&%16?PBakCY$7-fmARo@aBl7K)CggdaCj0T(FD)e/DfQt:BleB;4!8H`BOu4.
Bldi:+EV:.+D#G5D.R`rFCcS6@:O(]B4W30Bl%T.@psM$AIStm+DkP-CLqO-+EVNEAU&<.DIal!
AU/33A0>u-AKYf#Aoo/4@<-!pDCuA*>]!nbART[sATW$*Ea1nP6=jeDDFADQF_t]-FF,;C$6UHr
Eb0-"G@PQ.D..<mHX&gPBleB1I16N++<VeR>]XIuCh7KsFD-#+CggdaCj0T(FD-)L1hCNPI16O3
>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1@<?(/%13OO,p7;DB4uC'BleA=@rH4$@;]Tu
AoD]4Ch[s4+EML1@qfgn%16?ZEc6,8A7]7hD/E^!A:%R'BkM+$Ch[s4I=!7L$6UHrF(KH0ASu.&
BR<uuFCf<1AT3'E0Q;,^>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\I=2P3%14C(@WcC$A0>E$@s)X"
DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.%14C(@rH1%EcVZs>]k+!E+*6l@:s.u@rH1%
Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#I=!_+3%QgA3%QgA3.25C,p6qF@rH7,Ec5b:
F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:Ci=?BHZEb.I=!Y#0f(@7/i#F<0J54=I16N0
+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'EFq"d`A7]@eDIm<rCi=?@A79Rg@rH1%Ed`:T
B4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$+>"^ECht59H#R>9+EM+*+DNNRD/9Xg>\%DX
Bl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%16?NAS,XoARfXpDfU26@<6!t
@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdMD7Ddd`tDes?4I=$!I@XWSW
/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@@q]:k@rH1%
Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdMkLEbTE(@rH1%Ed`:TB4?:90J5.9
/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%FCT6*DfU8QEbAj0HS@'02CpO71Gp^;/hf#.
%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3@ruF'DK?6o-!XtlAnc-o@rH1%EdM_HBOu3o
Des?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_A7]@eDIm<rCi=?@DffZ(Eas$(DfU8Q;Fa'%
HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM52ATDm&Des?4I=$!I
@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&18g&:gEaj)4@;]TuDJsZ8+DtV)ATJ:f>\%DX
Bl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n10JG%3/heu-+<VdL+:SYe$=%^pAT2'fCLLje
HY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSgD..<m@q]:kF$3c5>^K_(?$fh(I16Ng6tKtE
DIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$DJ+BE<b6;\@<?4#I=#IBD/E^!A7K:]EcXBK
>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-+D,P4+Dl%;AKYJr@<,ddFCfK6+E1n4+Dbb0
AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)Des?4Bl7Q+@rH4$@;]Us+>"^R@;TRs%14C(
@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8A7]@eDJ=3,Df0V=D..]4%14C(@V$['ATT&:
D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$@;]Tb$=%^pAT2'fCLLjeHY.;,D.R7+%16?X
ATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=
@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl%14C(GAhM;F!+q'FED)7+EqOABHU5lF`Lu'
+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4<,ZQ#>;9E1>]aP%FCT6*DfU2?AU/K0Des?4
I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=oDejc*0jT-2FCf]=@rH1%EdM>*FCAZtCi=?B
H[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=gI9SF3HX(Z(G][G6Ci=?@A7]7o@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA?$goC0n"Hm%16?XATqX&D/E^!A:%QJ@<6!T
<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!7Vm!OFB!0o
I9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XN15E`?smI9SF3
HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3>]++s@rH4$@;]V&>Z5`bBl7Q_
Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6Z6gYASuTh
Dejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q>]aP%FD5iDHQt7nI=6MQ$=%I[G@PQ.D..<m
HX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3oDes?4I=$;c0n"Iu+:SZ_DIn$%Df'?"DIe*!
6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*DfU8Q>]aP%FCJj/HQt7nI=6MQ$7/qpATqX&
D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%EdMD@DI[0pCi=?BH[?tlI=6MQ$=%I[G@PQ.
D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'H[B5):%9jr'XATCagCOKDA
?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*0jT-2FCf]=@V0t6,;FUpI16NgDIn$%Df'?"
DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et+E):7ASuU$A0><'G\Lu.@<-W9@rH4$@;]Us
+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4YslEaa'$A0>\sFCf\+$=%I[G@bZ8Bl\-0D.RU,
HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8DJ`s&FF-VU6r7fCFAR!r@qB_&DfU8QI=$AO
$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.mFEq\6HY-](@sNJ3$4R>IBkDU$FCf\+$6UHr
F`V,5@:O(]B4Y:gATVm"B4Z-uH=]6O@;L!r/0H5]E+*Bj+EM7CAKYMpAnc-oA0>?,+F%I>AU"Xk
+<VdL+<VdL+<VdL+<YfEBk)'lANaX6Cia/=+<VdL+=/.QDJ<U!A7ZlmEb/ZpF!,[?ASrW5F(Jl)
GA2/4+F%I>AU"Xk+<VdL+<VdL+<VdL+<Yo?FCf]&HY@\DATDg&Apk*q>\._mAISth+C'&1AT2'f
CLLje>BOgt@rGmh4`k^eAR0XrH#R>8Eb/j2%16?PBakCY$=%7iE+O'2ATW'6HX_#,@;B[nDJO;V
FE2M8/.Dq/+<VdL+<VdL+<Ve9Df9E.@<-.)4`k^eALn8t+<VdL+<VdL+<VdLE+EQhF`_;8E]nbt
/.Dq/+<VdL+<VdL+<VeGA7fptFDPMOH[RFS$6UH6+<VdL+<VdL+Cf>+DfTZ.DJO;VFE2M8/.Dq/
+<VdL+<VdL+<VeLEbo6(Ci=>W@Vg0u/.Dq/+<VdL+<VdL+<VeCBl7]rDes?44`+V?ASuTu/.Dq/
+<VdL+<VdL+<VeGA7f:hEb&a%4aSk*0H`&tI16NgF(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*
>]XIuCh7KsFD-#+E+*d.CM@a9HT#hb+E2.>F!*5WF<GF7DKU"C0lV5_%16?]ATVa"DJ+')HX(-!
ATDEpDI[s5FE1r7@q^:;1M(EO+<VsQE,oN5ASuT4Dg#]4Ap%p++Dbb0ATJ:f>]XIu@rHL-FCfK>
F(Jj!F_tZ#E-,cAHSBjW$4R=g+ED%7ATT&2@<?(*+DG_(AU#>>D]j1DAKYT'F`JU7DesQ5DK?pP
+Co%q@<HC.+DGm>FE_X4$7-g=BPCsi+ED%7F_l/@+DG^9Ci=E:+E(j7G@>Q7ARlp&@:s-oF)YPt
AKY])+DbJ(A926hE+KIc,p5rY<(/hj@:X+qF*&O=Aftf*A7^!.DIIBnF!,LGDBO%>B4Z0uATAn&
$7-g,Ec5eU+D>k=E&oX*GB\6`CghEsGV*EDD/FE5BlnVQDfTJDG%kN3FDl,4@kM_6E'Iqt1a[<-
0fLmG%16?_F(K<!@r#LcAUA9:CijB$Desh2$=%FVCLpprCh7^1ATA4e>]OCnATq^'G%ku8DJ`s&
FF/+CASH$mAU&V4$6UI<>\Re8FE_Y5DesQ5D@Hpq+<VdL+C%0PATMs3DIm<rCh@*lF(Gdf+<Ve3
AScF!%144#+<VdL>X3=@F*)><ARfXpFE2M8%144#+C&Mm%144#+C&u!FDPN+B67g6>[q\gF_u#;
AT2[4Ch8$A0Q;,^%144#+C&u!FDPN+B67g6>[q\gF_u#;AT3'E1Gs,nI16N++<XouAS5^pHYmnA
FD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%,`+<Xp+@<--mDffZ>>YSXBAQ<\gATD9h
F(JTjDId='DIIBnI3f=0+<VdL+<VdL+<VdLHX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6
>]aXnF)YQ#ATMs=Ch7s4Cgh$qI16N++<Xp1ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16N++<Xp1
ATVa"DJ+')HX(MuEcZ#1E.*'eE-*4ACiseA0J5/#FF=T*+<Ve3Eb0&qGRY!&+<Xp*ATV0kFCf;o
5\XbRBlmp'I3f=0+<Z#9ASu%*D09Z:Bk)'tF+%;-AjCBJF*)><ARfXp>]4Lk@rH1+D/NTiCia/m
@r,^bEc>H"AR&h]I16NgD..3k@<?F0BOu2n$4R>ID..3kBl7HmGRXuh$=%%OB5)71A8bt#D.RU,
I16Mm$7QDk:-pQs5(7s0IVNe3F*)>@APPQE.V`m4F*)>@AKYJ7/Kf+VDfT9!AKYo#C1Ums+Cf4r
F)sAbAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g*]!A7]g)FD,5.F`(`$Ebp#8DJ()&@<>pe
@<6!5Anc'm+EMgLFCf;3F`V,)+EVNEF*)>@AISuA67sBkBk)7!Df0!(Gp%$7C1UmsF"SS5AT2Ho
@qfgn+EV:2F!+t/@<6K4BlbD*Cht59BOQ!1Et&IO67sC$AT;j,Eb/c(FDi:3BOPdkAKZ).AKYMt
@ruF'DIIR2+EMXCEa`Tl+EMgLFCf;A%15is/e&._67sB]ATD6&Bl8$(Eb8`iANC8-:-pQU+<Y-'
BOt[hDIIBnF!)T8BOt[hF!+q#@r$4++DtV)AKYr#FED)7DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oA8,OaDdsn4+D58-+C\bhCNXS=
G%G]8Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d<De!p,ASuT4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+<Y-+ATVL.E,8rsDBL'7ATT&(@:O(qE$0=8EcYr5DK?q=Afu/.DfTqBDdmHm
@rri)G]7J-DIIX$Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oB6/0+
G]Y&N+D58-+C\bhCNXS=G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/BOtU_ATDi7+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFDkW'ARfh'+<Y<.F<GL2C1UmsF!,(8Df$V+
@:O(qE-!-E+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
:-pQU+<Y-2Cia/rEarc*+<VeJARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;
+D,P4+EM76E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,q-$;No?+<Ve9DKTf;+<VdL+<VdLEb0?8
Ec,q@F`(o5F_)\)@:O(qE$0(>A7]dmA0>]&F*&OCAftVu@ruF'DIIR2+C\bhCNXS=DKTf*ATDi7
+<VdL+<VdL+<VdL%15is/g)8Z@q]F`CN"0'DBL&E+Cf(r@r$-.BkAJrDL!@8Bk)7!Df0!(Gp$gB
+E)41D@HqJ67sB'+Cf(r@r$$lFD)d>+<Y0-ARfLs+CfP7Eb0-1+E1b2BHU_r@;0V#F<G+.@ruF'
DIIR2+E1b2BFP;D67sB'+Cf(r@r$%+F<D\K+<Y0-ARfLs+DGF1Anc:,F<GO2FD)e-Bk)7!Df0!(
Gp$gB+CQC3F`\a:Bk)7!Df0!(Gmt*U67sB'+Cf5+F(Jlr@rrh9+<Y01Df]K2+Co1rFD5Z2@<-'n
Et&IO67sB'+CfG'@<?(%F<D\K+<YB9Bln&tCh\3,F!,OGDfT9!AKYo#C1UmsEt&IO67sB'+Co%q
GAhM4F!)SJ+<Y3+Anc-o+EqaEA9/1e:-pQU+<Y3+Cia]@AnE/.+<Ve;ASbq"AKYo#C1UmsEt&IO
67sB'+Co1sF*(i4F!)SJ+<Y3/@ruF'DIIR2+EMX5FD5f<Bk)3,@;]TuE+*j%+DG_*DfT]'FD5Z2
%15is/g)8ZA8Z4)ARTUhBHSE?+EM+&Earc*AoD]4DIIBn+E1b2FCfK1Et&IO67sB'+D58-A8bt#
D.RU,+<Y<.F<GL2C1Ums+CoD#F_t]-FCB9*Df-!k:-pQU+<Y<.FCf]9Cgh$q+<Ve>ATT&9BQ%p5
+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZB4Z0tF*(u<F<D\K+D58-+D5_5F`8I3DIal2F_Pr/
+EM%5BlJ/:FCf]=%15is/g)8ZB4Z1&FE;P4D/^U?+D58-+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,
+E2IF+EV=7ATMs%D/aP*$;No?+<Ve>ATVj"C1UmsF!)SJB4Z0-DdmHm@ruc$$;No?+<Ve>ATVs(
Aof(;+<VdLB4Z0-Eb/ioEb0,uATJ:f:-pQU+<Y<<Ch[s4DJUF<+<Ve>Ec6)>+CT.u+EM[>FCcS4
@;TQuCh[s4Et&IO67sB'+DG_4F`_/.@rrh9+<Yc;F*&O:DfQt=@VTIaFE8R=DBNn@F<G+.@ruF'
DIIR2%15is/g)8ZBl8*&E,]B+A0<!;+CT5.ASu$$Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:A7]Rg
FCcR;+<Y3+Ch7^"+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%P<-@qZu-+<Ve=ATVEq+DG_:ATDm(
A0>DkFC>Uc:-pQU+<YB9G&h/5Cgggb+<VeLE+EC!AKY])G%G]9ARloo@<>oe$;No?+<VeEATr0+
B4P^dF<D\K@rc-hFCcS4ATo88EZfC6B5)F/ATAo(Bk)7!Df0!(Gmt*U67sB'+E)41DIdHkF<D\K
+<YTAASrW!+Co1rFD5Z2@<-W&$;No?+<VeG@<?1#C`jiC+<VdLE+*j%+DtV)AKYf'F*)I4$;No?
+<VeGF`_2>E,8rsDBL&EF*)>@AKZ&-DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<VeGF`_8;
+<VdL+<VdLF*)>@AKYW+Dfp#?+CT.u+EM[>FCfM&$;No?+<VeGF`_MCF*(i-E$-8GF*)>@AKYl!
D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1@;Tt)%15is/g)8ZE-68E@:F%a+<VdL+EMXC
Eb-@ADIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Ys$;No?+<VeGF`__:G]\!L
+<VdLF*)>@AKYo#C1Ums+CoD#F_t]-FCB9*Df-\+DIal&Ec6)>06;8MFCcS:AU&<<%15is/g)8Z
E-68HDfTB0+<VdL+EMXCEb-A;DfTB0%15is/g)8ZE-68HDfTB5EcW?G+EMXCEb-A;DfTA2B5DKq
@;I',AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuCA92j2
Eb-A6@;]^h+>>Z,/MT(B.1HUn$=e!aCghC++<W%?C2[X(FDl22-OgDmDeX*1ATDl8-Xgb.A1%fn
%15is/h1CCE+NotASuU2+F#Ii+A,EtF*)>@AKYMpE+NotASuT4A7]@eDKKT2DK?6o%15Ht9gMZM
4ZY8>+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+Cf>4DKI"0DIal3Bl.F&FCB$*+DkP-CCLV<:/"5X
<'<9!+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G:8A7^!.Ch[s4%15Ht6VgEQ
;a!0!+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+Cf>,E,TW*DKI";BleA*$4R>;
67sBt@;0U%A8-'q@ruX0Gp$^5Ch4`!Df'H3DIm^-+Dbb5F:ARE:..ZO4ZYr*9gMZM/430+8Q/S>
6V^!E9i+at$4R>0:.%]@;c>h?2BX+b+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrWbEb$;1@;TQu@r,Rp
F!,CA+DkOsEc3(BH#R=($:@QU;FNlN8P`)E3]J6):-pQUAnc'm+Cf>,E,TW*DKIo^GA(Q*+E(_(
ARfg)G@>P8Anc:,F<G(6ART[lA.8l5:..Z@6r-053\hg#+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI
@ruF'DIIR2+CoD#F_t]-FCB9*Df-[L+=M8AB4NG#$:@QW=AV[W8PVE00ejdn:-pQUAnc'm+Cf>,
E,TW*DKIo^F(fK4F<G.>E,8s#@<?4%DK?6o6V^HD;GC(Q3\qm$+<Ve%67sBmBl%?'@rH4'Df0-(
F?1OTBk)7!Df0!(Gp%'7Ea`frFCfK6%15Ht:fUI_5u^993]A0(+AP6U+D,>(AKYK$D/aE2ASuTN
+DbJ-F<G[>D.Oi.@VTIaF<Gd9F!)lMF`]&A$:@Qd77KF$2(NAn1*A=p:-pQUEb/ioEb0,uAKYK$
D/aE2ASuT4FCAWpAISu6:/XnS<(K/50f^@!+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrHSAn?!oDI[6#
E+*j%+>"]aA8,RlF_rQMCh[s4%15Ht;b:.]4ZYSG+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EM7C
AKYo'+E(_(ARfg)Bl5&&H$!V=%13OO:-pQUBl8**Ecbl'+D5_5F`8I3DIal2F_Pr/+Cno&@3B/r
Ch4`!Df'H3DIm^-Et&IJ:0'k_:K:4i4ZX]Q:/Fqi6pXd@/430";FNlN8P`)46V^'P:eX/H:(7P%
:0(:n8Q8,W4ZX]W:0'k_:K:4i%13OO:-pQUBl8**Ecbl'+DkOsEc3(/DIal6DfTA2A79Rg+D,>(
AKYK$D/aE2ASuU2%15[%<_YkI;GU4S3Zpdb6VKdE;_1:2:fUI_5u^9(6V^!H76smE:JNH.:/a_f
74^f$79EA[5tOf\$;!un=&2^^;a!/a+A#=/9gM-E:K%]0%15is/g+kGG%G]9ARlp*ATMr9A79Rg
%15[%<`DLd<)Yq@+@An#<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%%15is/g,%?
D.P>;+E)9CDIIBn/oG*7AKZ&*E+*cqFDl1B@q]:k@:OCjEX`@N6r-cF3[ZO-+:SYe$;No?+EVX<
D'3k5B4uB0.!0K<Bl%L$B.4sB@<?0*A7]RkD/"*'EcW?H-n6Z//g*tV<(KDG9FV>LE+F'2Bl-!o
>p(A@+BplL/M8/M3Zon)03g+P:dJ&O6q'cn?Q_KS>n%,M$;No?+EML<BlkJ,@:O(qE$0%,D.Oi/
@<?U&Ec*"0C^g_mE,961@W#UkAN`'s-r*0+<$l'cAoD^$F*)FF4!79d:K/ZLAoqU)F*)FO%13OO
:-pQ_ASu$hAT23uA7]Y#F)uJAD/X?1:-pQ_F*2A;Df9M9F"Jsd@rH4'F`_29+EM[C+ED1;AM8+9
F<G[>D.Rc2@;]TuAp%p++Dtb7+Dl%8DBNIuFCfMG%15is/e&._67sC(ATD6gFD5SQ%15is/e&._
67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(f+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y0&Ci+*/DK?pC+<W6Y@ps1bDId0r+Cno&ATJu4Aftu&
G9C=3A0>K,Cht52Df9N7%15is/g)9RDf9N7+<VdL+<VdY+EV=7ATJu4Aftu&G9C=3A0>K,Cht52
Df9N7+D,P4+Dr<3@;KLmA79L$H"CE)Et&IO67sB'F*2A@Bldj,ATTUK/KePAD/aW>ATJu8F`&=B
Bldi.@;]TuF(KG9FD5T'F!*%WF(Jo*B6%p5E$/\0@s)X"DKK</Bl@ku$;No?+<Y`JDK9H4ATMF)
0d&%j@rH4'F`_29+EM[C+ED1;AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+Dfp"AA8bt#D.RU,@<?4%
DBL&E+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp+>#/f@UX%`Eb],F3C%4o@;0O1@rH3,+:SZQ67sBjEb/[$ARmhE1,(F:An>F+1(=Rc67sB4
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/KbK0:-pQU1,(F:An>F+1*CX\DJa<1DBNS4Dfp"A@rH7.ATDm(A0>u4
+Cf4rF)qct:-pQU1,(F<De!lC1E^4H@s)X"DKK</Bl@l3@:X+qF*(u(+D,P4+=LuCA8Gt%ATD4$
ALS&q%16T`@r,RpF!)iOF`)&7Df-pF%13                                         ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+?),92KO"YD/X?1?upI.D/X?1?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
DJsB+@ps0r@;KRpEbTW/D0$-n<+ohcCLqc6G%G]'F!+n3AKYAtDf9N7?n<F.F*2A@Bldj,ATTV6
+CT.u+CK85DK9H4ATMF)0eQiV+:SZDCht54Afu2/ATME*G%G]'F!,[<Eb-A(ATDL.ARloqEc5e;
6:"OA6Qg>gDeF*!D0$h=F^f0$F(f,q%16fe+=^<*Gp"FV<+TlWF(9--AL\g>@:s"pBl7K)Bl5&8
BOr;@3B8c@F"SS7BOr<,ATMr9De9FcFD,5.G%G]'F!,17+CK85DJa<1DI=SqEb-A1Df^#:Gp$X+
FCcS'DIal3EbT0)DJsB'FE2)*%176"Bl%L*Bk;?<%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOF*2A;
Df9NA+A$HmATDBk@qC&t$4R>kIXZ_gHQXqU+FO\++<Y0&Ci+*/DK?pC+<VdL:-pQU@ps1bDId0r
+Cno&ATJu4Aftu&G9C=3A0>K,Cht52Df9N7+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ#+Dl%8DK?pC
+<VdL+<Ve%67sC&Bl.F&+E(j7DIn#7@;]TuAp%p++Dl%8DK?q4DfQt<+CehrASu$eEZfX=@<-E3
+<VdL+<VdL%144#F*2A@Bldj,ATTUK+<XEG/g+YBD/aW>ATJu8F`&=BBldi.@;]TuF(KG9FD5T'
F!*%WF(Jo*B6%p5E$/\0@s)X"DKK</Bl@ku$6UI4F`)56F(KE(F>4m\+AP6U+Cf>,E-686F!,OH
DBNt6F(HJ&DIal2ATT&:Bl.F&+>"^WARuusEc6)>+CoD#F_t]-FCB9*Df-!kIXZ`p%13OO>]Y$s
F(Jj'Bl@m9>]aP%FCJieFCf]=FEDkNF`)56F(KE(F>/+c>]aP%FE;8FFtG:o+EM[CEbTT++CT.u
+EM[CF(KG9FD5T'F+"K)%16'JBlbC>G%G]'+D>2)+C\nnDBN@u@;p="A0>K)Df$V*+@8@m8OFV>
Ec5T2@;R-.F^f3%FED))+C]U*$;teOBl5%97kPo,;fm.jEc`EH.T:,.+=841ASbq!@rH<t-Z^a[
+EM47Ecbl6F<D]IF`)56F(I"GATS@gE,ol0Ea`f-+Cf>-FCfN8/g+50DJj0+B-8=.DKKo5ATJu<
ATD?)Ch[s4ARlo+Bl5&8BOr;/9jr'PBFP;'3B8r>6$%-gDf0K1Bk(Rf+@C'aE-68:DJ()%DesQ5
DCuA*%16'JAKW*f+Eh=:F(oQ1+E(j7FD,B0+CT)!DfTQ6BPel*@<3Q#AS#a%G%G0*DfTQ<ARmD9
+A$Yt@ps6a$=e!kE-686+CT/5+Du==@V'R&De:,5F`)56F(HJ&DIal2F`)83F<G[>D.Rc2Bl5&3
DIjr#@;Ka4%13OO<+ohc?mp:L?m&luB6A'&DKI"8F!+m6?o9EO?m'&tDdda%DJ()2DeX*2+EV%$
Ch4`5BOu3q3XlE*$6UH6+>A-bBlbD5@<?4*F_#&+Bl5&(AS6$pATJu<Bln#2DJsQ;BOu4%+DbJ.
BlnK.ATJu5Df]W7Bm+&?%144#+<WCc+DGm>Ci=3(BlnK.AKY])+Co%rEb/g'+EqOABHVM1F*(u6
DBNb6DJ*[*F_#')+Dtb'@<?4,AM+E!+<VdL14(-XF!,[<F*(u6DBO%8D.Oi9Df0--+D#e:Eb0<5
ARlolF!,F?F(o`1G%De?BQ%]u+D>\9EcWiB$6UH6+>\?eBlbD=BOr<'Df0Z1+Du==@V'R4%144#
+<WLf+DGm>FD,5.A79a+DKTf*ATBC4$4R>ABOr<,ATN!1F<G:=+CQC1F_t]1Bk&9-@:F%a+EqOA
BHUo*F`JUFDg-7T+<XX%+D>2$A8Gg"FD,5.@psFiEt&J#BOu'(FD,5.F*2@CDIn!&EZfC:F(KD8
DfQtAATVu9FD,5.Anc:,F<G[LD]iV-ASl!rFE8RCAfu2/AISuVDfTl0F)Z&8A8,po+ED%7F_l.B
@rH1+D/OD;@<,p?%13OO+<VdL0RFpVF!+4R;FseU;ajY.@;[3%DK]H)Bk/?"Dfp(CBl7Hq@psIn
DJ()0D]j(7F(HJ4EZfF7F:AR"+<Vd]HQ[$D+>=p^BOu'(FD,5.F*2@CDIn!&EZfC:F(KD%$6UH6
+>J3cBlbCO+EqL1DBO%7AKZ&:DBNh.G%G\:F(KH7%13OO=(-,eBl7QE+EV:2F!+n-B5_g)FD,M6
@WH$gCNCV1DfQt:@<?4*F_#')+Cf5+F(GdfFDi:DBOr;bDfp/8+E278AM+E!%16'JAKYo3BkM-t
@;I&Q5uU?B+Cf>#AKYYpF!+q'ASrW3Ch[NqFDQ4FD/Ws!Anbge%172q+E_a:+Cf>-FE2;9+EMXF
F^oN9Eb0;7Bl5&4Cgggb+E(j77o*)[-Z^D=DIal+Bl7K)DKTf*ATDiE%13OO6"FDCFCeu*Ao_g,
3XlE*$@[GQINWt[/oYrRAR](hBk&8<DKTf*ATCIYDIml3F*(i2F@L:hD*9't,(1RC$83kO;futu
Bldi=F(KG9@X0(o/g*Y:+B*B)@<-H@+<XBiG\LZ++@BjbGq:(4AU%p!D]gM_%15p'+?^i'/ho1;
2*!EM2'Y.)6rG-j+AbWP0-Du/0KL=S6m+W80d&+l6rFI$8PW)^<$3AY@<=%C9Q+f]+=Lc3B.5#d
+@7q:+A=X%$;!uh<E((b<,$2\+F7sDAKWC7EcWZR4!7''$:6Tm4Wm-j+=\L#2%9ma:/Fqi+<jNu
DKKPC+Cno+,!-oA/0I=i$;M^,+A#=--o*_=+=\L.+>4it.3L2b1*A%h8PW55-qtg7+?:kn0-Du)
.3L,`6m+'(1GB7F9J@SP+>b]12`EH6.j-Gu0fLj1.Ng-7+=eQe2'=In9JmqG+>Yo0.1HVO+?^i"
0JbLA1*A%h;b9_49J@S>+>GK)1c6]k$:?Qk4WmWj+=\K^5u^T-<'a8-9J@S>+@@S,+>"^%<)+ho
3AEHM+=\L55u&h%0H_kg6RaH,/KdD0%16$%+?^i"1H@BR+=\L48PU[-0H_kg6Rb&=6UW%[+B)-8
-nuhr+B(ZN.NhYX.1HV_6QeN7-rWMV.NhY]:+/Fd.3L,`/hf":2(9Y$+=KTQ;^asi.3L)_6UW@4
$;!]05seKu;aVuV4?XfA+B1m#:(7OQ+@@q-4WmWj+=\L"<)+i?6Qe$);c-F@0d&%j;aVZW+B(WV
.1HV,+Asp:4WlX*/KdS,/KcH82'=Cl6S]c7+@@q6+>4il2%9m8+@oBQ4Wm<k<%(X!.68SG;BS+F
8PW55-rMcB/KdS^.3L)_2D?Qh$6UHf;FsV_+B;?3:.HEN;futuBldi.@<<V:,<@%o,!-o<;EH!q
;@NsU+B(!;4WlI=+>"^,+>"]a9JmqC+@@n,/KdD:.3L8d0f9CI+<X3R+?^i=:/iW?0e#.+9iE/t
+A#=--n&"K+>"^,;^ih=+>to&%144#:f9k[<$51>8PVbu,#`W%F(KG9@<<V:,<@%o,!-o<;`c*r
;[j(&9N+AO7NbVs+?go&+B1m#:(7OQ+Abs-:/i>[;fut#F`8I3Cht5)@<j%+$:RWe77frk;aVZi
+>#;j<(KGQ%144#:f9k[<$3A`F`&=4Dg-(A@;Ka&A79a-%15O!6m,&j%15O!6k'KPIXZ_T$4R>k
IXZ_gHQXqU+FO\+D/X<#A3(iNFAcgoATMF)+?_>"F*2A@Bldj,ATTUKAo'e-852J]$4R=b+AP6U
+ED1;AKYE!A0>r)F<G[>D.Rc2@<<V[DeC1d@;BEsFDk\uGp"MG@<l['B4uB0F('6+DJ+#>%144#
FC[Ne+=K''+=eQh3@-R;.4cl!+?)2$.j-T%,rRG+/0Hbl/0K?n+EVO4@<itL%144#F*2A@Bldj,
ATTUKFCYgf%144#:-pQUEbTT++CT.u+EM+9+EV=7ATJu4DBMPoDIjqH0Hb:O+@gH`ASu^+@q[!%
ATDKqBjklg$6UI50Kh$2+<W?\0H`%l2BXe0+<Ve%67sBlEHP]3DfQ9o+<Yb\4Y@j"1cZ[4+>=or
+>Y\o+<XEG/g,%MEcbt;/Kek<F<GL6+EqC<FCfK1+B;>n6Xak@A76TiDfTB"EX`?u+ETA%/g+LX
2]sds0H`7r1GBpo+AP6U+EMIDFD)dK+EMIDFD,6+DBM;[Bl%?'@;]Tu6#pULDKKT1@1<Pd+ETD&
/g)8q2'=Rq0H`7r1GBpo+AP6U+D,&&+Du+<FD)dFF*2@C@;L-rH#k*NE%)5'+<Yb_4Y@ja2`2^3
+>=or+>Y\o+<XEG/g+b7EZfFAF`_:>.!'NK+CT)1@<lo:A8c[0.1HUn$6UI4F`)56F(KE(F>+hZ
0F\?u$6UI4F`)56F(KE(F>+hZ0H_nhF>4mh+ET@]/0K$j+=oPrF>OF6%144#:-pQUFD5T'F!,C=
+D#P8@<?F.+D,P4+AH9b@qZu?0d((HEZee,C`kGTBQ&$6+EV=7AKZ;;DImku$6UI4F`)56F(KE(
F>+g[0H`%l/0Zek-nHub/g)o+.3L/c0d'aE1E\G-%13OO+<XEG/g,7MD.Rc2AoD]4@ps1bDId0r
+F.O,EZd(s3AhptDBO%7AKXK`AS#b'Bk(g!D.Ra%A8,Ii%144#D.GXa4Y@j"1cHO2+>=oh+u(3g
/g<"mH"CE)A79RkF!*1t3Ah6Q+<Y]G0KD!R/g,4XDK9H4ATMF)0Hb4C3Ah6QIXZ`p%13OO>]Y$s
F(Jj'Bl@m9>]aP%FCJieFCf]=FEDkNF`)56F(KE(F>81d>]aP%FE;8FFtG:o+EM[CEbTT++CT.u
+EM[CF(KG9FD5T'F+"K)%16'JBlbD?ATD6&BOPs)@V'+g+CSehE-,Z%+D,Y4D'3706:"OA6Qg>g
DeF*!D'3nB@Voh$FCeu*+C]U*$;+`DATJt:6?6dWBOP^n+<YcE+=^<*Gp"FV<+TlWF(9--ALDOK
+<kl?DfTr2F*&OGF`)56F(I"GATS@gE,ol0Ea`f/+Cf>-FCfN8/g)9<Bl7g&DJ()'DKKo5ATJu<
ATD?)+Dbb5FCeu*Bl5%9FD,5.+AH9b@qZ;Y0f_6O+@1'jEc5i6D/!KgC`l)`D/aW>Bl7Q+@rH1+
D/Ls8$4R>ABOr;/?mp:L?m&luB6A'&DKI!DDe:,"F*2A@Bldj,ATTY7+<YB>+CQB8?oBKP?m'&t
Ddda%DJ()2DeX*2%172c@VfTuGA(Q.ANC8-%144#+<W@b+DGm>CghF"FEM,*+DG^9A7]CoAS#p*
GA2/4+Du+<FD,6+DBNb(FD5i>A7]g)E,Tf3FD5o0/e&.1+<Vd]HQ[$D+Dbt6B5)I1A7ZltDBNJ$
B6%QpF!,[@FD)e@ATMs)Ec*"9Df03%FEM,*F!,@3B45mrG%E98$6UH6+>S9dBlbD@ATMs)Ec*"A
Bl.E(H>d\4F!,%=E,oN2F(Jl)@<3Q1Df]W7Bm+&1GA(o2AKYZ)F`MOU%144#+<WIe+DGm>FD,5.
D/X<6BHV28D.7's/e&.1+<Vd`HQ[$D+EV:.+Cno++Du==@V'R4%144#+<WOg+DGm>FD,5.H"CE)
/e&-s$<1\M+ED%7F_l.BBlbD*+Du==ATDKp+EV%$Ch4`5Bln#2AoDg4+EDCEF"SRX<,Wmm@;]Ul
AKZ).AKYJkF(KD%$?p/pDBO%7AKZ&:DBNh.G%G\:EbTT+F!,CA+EM+9F!,R<AKYT!EcZ=FFE_XG
ASbppASuU2+E(j7FD,4p$=e!pEb0<2Df0*"DJ()4ATN!1F<G(3CisT4F!,?C@<,p?%13OO+<VdL
0RFpVF!+4R;FseU;ajY.@;[3%DK]H)Bk/?"Dfp(CFD,*)+DG_(Bk(RnATJu3D]j(7F(HJ4EZfF7
F=n"0+<VdL0mb$WF!*.ZGA(Q*+EV:.+EM[C+Dtb6ATAo6Bldj,/e&.1+<Vd]HQ[$D+>G!_BOu'(
FD,5.F*2@CDIn!&EZfF7FE9&D$4R>.A79G!ARloqEc5eU%13OOIXZ`p+F>4`E-624@UX=l@j!CA
F_tT!E_L1bATJu8FCB337WNEa4X)U)I38t+0.J)CF`)56F(I"GATT&(Gp#^fD.Rc26?6dWBOP^n
/0Il5/g*Gr@UX.q/0J"p+=]#R$;a;:4WlO50f1UB3ANN<3Zpgg+?^iD8K]Z/0fUjJ+@JU?4WlO=
0H`"k1H%*C1,UsG2Bt7*6qL)q6msfE.1HVP5u^,m0J#"7/2]F=3A<!=1,(762)-X:3&)s>0et:8
1c$[<2`!!@0Jk=:1GfOJ7Sco)6QeN70d'Fk+>GW4+AtWo6m+lG6Rb&=:.88a+@?SF8PW)^<$3AY
@<=%CCi=3(,!-o@5qF-P:CRY&:/Fqi+<jNuDKKPC+Cno+/0K4L@<*PR+AFC06nBH`%15Zr+B]g?
+>b3(+A#=--s7ZG+>bMi<(KGQ+@].)+@@87+>Y->:EVAI3Zpg=6Ra-@+@IVF.3L,`0fgFP79EM3
6OaAj=WfjM6mtbY+=eR&3Zpgn+?^i8=Wf:=9MZca+>Yo03Zpgn+?^i8=Wf4;/i=(F<(J,p+?;&1
2)d3C0d%th6pr.I+@K?T.j-Q!3AE?5.NhY]:+/M.+=\K^6pr.I+@K?T/Kci%3B&B9%15HY+?^i"
1H@BR+=\L$:K&Z0;BRG3<(JGI$:I6(4Wl=2+>4j*;BRG35u^T-6Sfi<+=L/c;CF7B/KdD:+C60G
.4H\T$;!]09L0d`+>=p;84?8r5qsKF+?;+u.j.MO+>"^(6Qefk;ahfp0d&V%3A;R-+A>'D.j.5I
3Zq6s8PW4o$;!]05qsKE+>#H)+>4iq0Ha=c78=t%;FsV_+<ja,DBNh.G%G\:EbTT+F!<Xf7o*)[
+>PW)%15Zr+A>'D4<Q=#<(KGQ+@.b*4Wl=:0H_qi9L0dQ+@JR>78-WK+@.b*4WmEa+>"]r0H_kg
6phCj8Oagg1*AbD+>#H)+>4iq0Ha=c78=t%;FsV_+<ja,DBNh.G%G\:F(KH7,!$i::K1+41,(Bk
$:?Nj4Wl.O8PUZc6rG-W+>khq0-E/,.3L2b;b9_46rG-W+@JRG+=\L48PU[%;BRG39L1*V+>4ic
6VgW/6rG-W+@JRG+=\L$:K&Z0;BRG39L1*V%16&i+?^hq0d&+l6rGHV.Nh#V:+0%<;CF7B/KdD8
+C60G.3L8d6SU#N+A#$F6ST]I4WlF$<(KGQ+B1'<4WlO=0H_qi<&+mi8Oagi0d&S$0Ha=c78=t)
1*A_&0fUj0.j.eH3ZqBV+?^i'2D?7*+B1**$<0nG4Wm]Y+>4il2'=In0etd4<)Xo&+B1*=0-Du,
%15O'+?^i!/ho+?2BXIl;b9_46rG-W+=KWG+=\L%=Wf:=1G1[H.4HAk+>,B+0eje#+B(j,-q$rU
.Ng,p+=\L%6m*s%6s1W_+>Gf-3&W37%16'4+?^iH;BRP678u;j<)Xo&+B28^/KdJ]%15[%:fUI;
,#i8nAKZ;;DIjq=BIP,e+B2MR$<0A84Wl=U=s,C>9MZca+>G`7+As=F+B25].j.eY3Zq?D4Wm^&
+=eR66OaAi1*A_&-rW]4-q$rU.Nh,H.3L2b;b9_46rG-W+A>'M+=\L48PUZc6rG-W+>khq0-E/,
.4HAm+=KTQ;^b%3+=\L-5q*p.+B(j,-q$rU.NhDN.3L)_;b9_4/OWJZ.NgT&+>4iq0I\F[$<f/,
4Wl.-+>4j*;CN_<+@/t%-rWu@-nuhr+@@n,?6D!P+>4j)1+>7,8Oagi1*AbD+>=p;84?8r=u%3`
+>Yo0+>"^>0b"I]7Nb&R+?Uc#+B1m#:*<^p+?^i%3%uI*+BgK\+BgNC4WlO=0H_qi=tpHn:f9k[
<$3A`F`)56F(HI<4!7*i<%(Wn4!5_\,!-o=:/iW"0JFV!+=L,1/KdV[<%(Wn.4HAm+>GQ3%15p0
8PW5-,&JH2/o<3l+CTS1D09r6+<ili8PW550ea_"+BgKK+>4il0F\@c;FsV_+<ja,DKBB2+<ili
8PW55;^jdN,%r/^+A#=--oNb5+=\K^;]mY78PW55;^j.E+>4il0KT^N:f9k[<$3B%+E/rM/hA,R
H>.5=FD)d@4!7*i<%'IT+=\L;1+=>!+>GPZ$8O:h+@T$n%17Q5IXV_5%17Q5IXWDd+>.COI16O#
Df/uo3ZoP_FAcgoATMF)+?_>"F*2A@Bldj,ATTXLAo'e-852KT%13OO+<XEG/g,1KF(HJ&DIal2
ATT&:Bl.F&+CT@76uQ]\9OV^J+EVO4@<itDA79b"BkM+$+ELt7Bl7R).1HV,+EV-W/g)Q!1a":k
0f^O<0I\P$/Kcu1+=eQi0dS_3.4cSu+=nWi+FGdaFDk\uGp"dM$6UI4F`)56F(KE(F>4n[A.8kT
$6UHd67sC$Bldi.@;]TuF(KG9FD5T'F!,C=+A-coAKWc_+>Gl:2'?gT+@gH`ASu^+@q[!%ATDKq
Bjklg$6UI50Kh$2+<W?\0H`%l2BXe0+>Gl:2'=#:67sBlEHP]3DfQ9o+<Yb\4Y@j"1cZ[4+>=or
+>Y\o0f_6O+<XEG/g,%MEcbt;/Kek<F<GL6+EqC<FCfK1+B;>n6Xak@A76TiDfTB"EX`?u+ETA%
/g+LX2]sds0H`7r1GBq+3B8r>+AP6U+EMIDFD)dK+EMIDFD,6+DBM;[Bl%?'@;]Tu6#pULDKKT1
@1<Pd+ETD&/g)8q2'=Rq0H`7r1GBq+3B8r>+AP6U+D,&&+Du+<FD)dFF*2@C@;L-rH#k*NE%)5'
+<Yb_4Y@ja2`2^3+>=or+>Y\o0f_6O+<XEG/g+b7EZfFAF`_:>.!'NK+CT)1@<lo:A8c[0.1HUn
$6UI4F`)56F(KE(F>4n[0F\?u$6UI4F`)56F(KE(F>4n[0H_nhF>4mh+ET@]/0K$j+=oPrF>OF6
%144#:-pQU@rH4'@<,p%@;KRpEbTW/D0$-n+<Y`JDD=:,+EM[CEbTT+F(KGJ+ET:[/0K$h+=nXW
1*A+jF>G$j3ZrN$%144#F*2@S4Y@juF`)56F(KE(F>+hc3[-:$F>+gg+ET=\/0K$i+=nXW1E\50
+ETFL$6UI4F`&oV/Kf+WDD2M,%144#:-pQUFD5T'F!,C=+D#P8@<?F.+D,P4+AH9b@qZu?0d&22
3AhpkDfQt/Cht4K+D>\9EZfI<D.Oi9Df0--%144#F*2A@Bldj,ATTXL0H`%l/0Zek-nHub/g)o+
.3L/c0d'aE1E\G-+>Gl:2%9m%$6UHd67sC&Bl.F&+D,P4+CehrASu$eEZfX=@<*JF3B8r>Df-\>
BOr;VEb/g"GA1Q#+Dk\1Bk1pdD@Hpq+DkY73AirP+>c#"0H`%l/0Zek>p(jEHnHTt+F.O,Eb&U#
ATJtK3B8r+$6UI3F"o[44Y@juF`)56F(KE(F>4nTA9g0m%17Q5IXV_5%13OO%13OO%13OO    ~>
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
1E\P#-p0UR/mg=U-Qk`E7nHHI:..NQ+@JXf5ugTX:dIiE:I?6n:..ZK6q(3#7R9[9<)6.U:/`9,
7R9C1=&2^^;eg5]Ch\!&Eaa'$+A$lO:IJo7FCfK)@:Njk8U=!)7!*?cCi^^jH:gt$F`_>8FCfK)
@:Njk8k_QO8PDNO79C[)9M%uX78d)V7R9C19gg*r9M\\\79<Df7RfsO+A,='<_5_]<(0n38l%iS
:JXY_<_Yt)8l%iU9gg+%:JXqk:JsSZC2[X!Blmp,@<?''<(KSZ:dIiE:I?7+;F+,Q76s<a=&M=\
:f9_O8Q[*:;F+,U;FO&H=B%^k+CSekCi<`mF(96)E-*fWA7BP$DffQ5E?Jk3Ec#o0G\M&+AU%d-
+D5_5F`;/*FCf\>B6%s-BlkJ3Amo1\D..I#A0>Su@j#K'A7^"0Ea`p'@<?(*+DbJ.AU%g-D..I#
A0>_tEbf;rF)u&.DBO"3FCKB,Ch.'jEcW@EATVWu@:NkbBl7^-+EM+9C2[X!Blmp,@<?''F`:l"
FCf3*A7TCqFE2))F`_>9DBO.AEb&upFCf\>GB.,2G&h&.Df028.4cl04?G0&0d%hd@rc-hFCefo
De*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?.A7]h(Ec651C2[X!Blmp,@<?'fFCfN8A8,OqBl@lt
EbT*++DPh*Ch\!&Eaa'$;f-GgAM>e\Ci<`m?YXLiCh\!&Eaa'$?W1f[CLqU!F*')i-RgSp4?P\X
?SNZN+DPh*+DPh*Ch\!&Eaa'$+DPh*F*)>@AKZ&:DJa<1DC6ka-p01/0I\P$4?P\X?SNZN+A,Et
6<-TN6qBmJ<)6Cp+A,Et:2b5cF'icp+A,Et<)6:`;aOJU9LMEC;cHOj=WgL66qU6C:2b5cF!+:T
;cI+=De*ZuFCfK$FCcRo:IIuc8l%i^D.Fbg:IIucC2[X!Blmp,@<?'fD.FbuF_PZ&C2[WsC3(M,
F_PZ&C2[X!@<?(*+C]J-Ch.:!A8Gt%ATD4$ASbdsAU#>-Ch7$mFCf](@UX@$BPDO0DfU,<De'u(
BleB7Ed;D<A7TUg+DPh*Ch\!&Eaa'$<HD_lCLqd4+DPh*Ch\!&Eaa'$?Z1+%ATqL'AU#>4De*Zu
FCfK$FCfB6Bk;KqFCf\>C2[X(Dfp)1ATMF)F`8I?@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"
DKI"<@;]dkATMs.De*p-F`Lu'+E2@9C2[W*E,o].De*ZuFCfK$FCcS@H?s=EA8PahDI7KsGUFpk
-p07-1GpF50JY=92)%!B2)RBL1,UdH3$9t11,(C>1,(==2E<NH0JtR-1,(I;0JtOD/i>LH1GgjD
0K1+00JY=92)%!B2)m9J2E*EI3$9t11,(C>0fUdE0KCjC2DI$G+>PW*3AE9D1bLUE3B&]L1G^d/
1,(FC0etI?/i5OJ2_m0F1GU(.0JPRB1,1U<1cRKS1,C^B1*A>+1,(C>0ek:<2)I6O3AWKI+>PW+
0JG@=3%d*I2)mEN3&ruA1,(I;0JtR@/i,F?1,:UE1H-F30JY=92)6s?2)R0L3&NQN2]sk00f^sD
0f1L>3&roQ3AE9D+>PW*3AE9D1bLUE3B&]L2E<T:1,(I;0JtUA/i>L?1,L[B2)HF20JY=92).'C
2E3ZR3&riS1*A>+1,(C>1,CO?2)I<R2E<c?1,(I;0JtOE/i>XI2)$a>1,C%.0JY=92)%$C1bq'J
2)-sK2BXb/1,(C>0eb4:1H%6R1,(OF+>PW+0JG@<3%d'E3&3KN0JGC-1,(I;0JtOD/iGOC0K(jK
1GL"-0JY=92)6s?1c[<M3&EWP1E\G,1,(C>0fUdD3&WWO1GggD+>PW+0JG@=3%d*K0KCjG0f1a1
1,(I;0JtRE/iGXB1,^pD1bp1/0JY=92)6s?2)$sJ0fV*M0d&5*1,(C>0K:[B1bpsI1bps31,(I;
0JtOD/i>UB2)@3K0f1".0JY=90etL:2`*?L1Ggg@+>PW+0JG@=0eP=?1,:jL0f_'51,(I;0JtRE
/iG^J0f1[@1cHO40JY=90ek[@1bh!M1GgpB3?U(21,(C>1,CO?0fM'L3&!0F+>PW+0JG@<3A*-C
3&*?N3&<H81,(I;0JtOD/iGL>2DI3I1,L+/0JY=92)6j<2E!QN0JG@=+>PW+0JG@<3%d*F0K(jI
2E<Z<1,(I;0JtOD/iGI@3B9&Z3&)O20JY=92).'C2_[6H1,^jD2'=Y.1,(C>0f:RA3B&oT0fV'I
+>PW+0JG@=2(gdI2`NZL3&WQ81,(I;0JtRB/iG^K3&NEM2DZI20JY=92)-g<2)R3L3&rcO1*A>+
1,(C>0fUdD2DmHN2E3]W+>PW+0JG@=1G1IB0JYC=3&<K91,(I;0JtUA/i>LB3&icQ2)cX50JY=9
2)-s@2E<]U2D?sC2]sk01,(C>0f:RA3B&oT1,:XC+>PW+0JG@>1G1OB0JYI=2)R351,(I;0JtUA
/i>L@1GU^F1H$@20JY=92)6s?2)R3N3ArlX+>PW+0JG@<3A*0L2Dm0C0etO-1,(I;0JtOE/iGLG
0f_$K2DQC10JY=92)-d;1c%$M3AN9F3?U(21,(C>0K:[B1H7-M1b^UA+>PW+0JG@<3%d*G1b^gH
2`!021,(I;0JtUA/i>=B2`EEJ2)QL30JY=92).'C2E3]V1,1XA2BXb/1,(C>0fUdD3&N]O2`NfS
+>PW+0JG@=3%d-D1H%0J0fCd01,(I;0JtUA/i>=A2_d9N2DH=00JY=92)%$C2)d3I2`*HN3$9t1
1,(C>0K:[B3&`ZK1H.!C+>PW+0JG4:1bLaB3&W]R0fUm11,(I;0JtR>/i>I@1-%<K3A_j60JY=9
2)6s?1c$pF2)d?O3$9t11,(C:0f^jC1,:R?2E3KQ+>PW+0JG@>1G1O>2`NZS0JkR.1,(I;0JtOE
/i5:B1GCXC2*!*:-p07-1aFh11,(C>1,:I>2E<TK2E!QM+>PW+0JG@>1+kIE2`EEF1c[B81,(I;
0JtRC/i5@<1bgpI2DH=00JY=92)6p>2)[3J0f:aE2]sk01,(C>1,:I?3A<0J2`WfR+>PW+0JG@>
1+kIE2`EEF1c[B81,(I;0JtRC/i5@D2)7$F+>PW+0JG@>1G1LB1c$j@2E*TE/1<V9+>b?!0JY=9
1,1L93&*-A3&E?E+>PW+0JG@=3%d!H2`<EN2`Wf>1,(FC0etIA/i>IB2`<EH3$9t11,(C>0f1L>
2`3HK1bq'J+>PW+0JG7:0ePF?0ebRD0eje+0JY=92)6s?2)%$G2_d'E3?U(20f^sD0fCXA1c.-L
1,:g31,(I;0JtRA/i5LE2)@'E3A`09-p01/0I\P$4>J$71F+_00f^sD0f1L>3&roQ3AE9D+>PW+
0JG7:0J5.@3ArWN1Gq!31,(FC0etI?/i5OJ2`!-A1,C%.0JY=91,1I81H%-L2)?sC2]sk01,(C>
0fUdB0fD!I2DdEM+>PW+0JG@=0J51B2`<TQ2`WZ:1,(I;0JtR=/i>F=0JGIC2DH=00JY=90etR<
3&30C3&3?H1E\G,1,(C>0fUdB3&**B3&ruT+>PW+0JG@=3%d$H2E*TS2)6p01,(I;0JtR@/i5OB
1cR?M1GL"-0JY=91GUpB1c$mA0JkUE3$9t11,(C<1,pmC1H%-I1cI0G+>PW+0JG@=2D-g?2`!HK
1Gq!31,(I;0JtR@/i,CG1,UmB2`2^50JY=92)%$C2E3BI3&W]U2'=Y.1,(C>0f:R@2Dm?H3B/`L
+>PW*3AE9D1bLUE3B&]L2).'51,(FC0etI?/i5OJ2_m0I3A_j60JPRB1,1U<1cRKS1,CdB3$9t1
1,(C>0fCX?3&`cO3B0#U+>PW+0JG@>1+kFA0f1jJ1cHO40JY=92)%$C2DHpD3B0#Q0d&5*1,(C>
0f:RA3B&oU0JGF.1,(I;0JY@:/i,LG1H.3I3&Vm70JY=92)-s@2E<]U2DI!E1a"P-1,(C;0eb49
2_[!H2DHp@+>PW+0JG@>1G1L?2DHmA3ADX30JY=92)-d;1c[NS0K(pM3$9t11,(C>0eb4;1GpsJ
1GgmH+>PW+0JG4:1bLaC0JYUC2)6s11,(I;0JtRE/i5OD1H7<O3&Vm70JY=92).'C1cR<H3AE9L
2'=Y.1,(C>0f(F=3&*6L2)R0E+>PW+0JG@=2(gdH0fUmA2*!B61,(I;0JbID/i5@B2D[0K1,C%.
0JY=92).!A1bgmF1c.3Q3$9t11,(C>0f:RA3AWHK2D[<O+>PW+0JG@=0J57@2`!BJ2E!941,(I;
0JtRB/i>OE2).*N0f'q-0JY=92)-s@2E<]U2)6jB3?U(21,(C>0f:RA3B&oT1,(OF+>PW+0JG@=
2(gdI2`NZM0Jkd41,(I;0JtRC/i,IG2_mBQ3A_j60JY=92)6p>2)R*F3&WTP+>PW+0JG@<3A*3F
2`NKI1,Ud8/1<V7.4cl00I\P$4>838-p014/3GT                                   ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
