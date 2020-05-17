NB. JOD dictionary dump: 17 May 2020 14:34:47
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

ENDINDEX=:'\KeywordTok{=..=..}'

FAKETOKENS=:<;._1 '|=::=::|=..=.. '

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC grplit ifacesection setjodliterate'

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JLBUILDTEX=:108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10 109 97 107 101 105 110 100 101 120 32 126 35 126 103 114 111 117 112 126 35 126 10 108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10 108 117 97 108 97 116 101 120 32 32 126 35 126 103 114 111 117 112 126 35 126 10{a.

JLOVIEWSUFFIX=:'_oview_tex'

JLOVIEWTEX=:37 32 116 104 105 115 32 106 111 100 108 105 116 101 114 97 116 101 32 111 118 101 114 118 105 101 119 10 92 115 101 99 116 105 111 110 123 92 116 101 120 116 116 116 123 126 35 126 103 114 111 117 112 126 35 126 125 32 79 118 101 114 118 105 101 119 125 10 10{a.

JODTOOLSVMD=:'1.0.2 - dev';01;'15 May 2020 16:44:55'

JODVMD=:'1.0.2 - dev';01;'15 May 2020 16:44:54'

ROOTWORDSjodliterate=:<;._1 ' IFACEWORDSjodliterate ROOTWORDSjodliterate grplit sbtokens setjodliterate'

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

ltx=. (gheadlatex ; gbodylatex ; gpostlatex) y
ltx=. ]`indexgrouptex@.(1 -: x) ; tlf&.> ltx -. a:

NB. convert wrap marks to LaTeX fragments - handle trailing blank first
ltx=. ('#',WRAPPREFIXTEX,' ','#\AlertTok{',WRAPLEAD,'}') changestr ltx
ltx=. ('#',WRAPPREFIXTEX,'#\AlertTok{',WRAPLEAD,'}') changestr ltx

NB. NIMP: the next blank after \AlertTok should be removed
NB. if it's the first blank in a \NormalTok otherwise the
NB. wrap introduces spurious blanks.

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

NB.*setjodliterate v-- prepare for processing.
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
0f:X-1,U10+>GPm2)ud=+>l)#0ea_/0d&2-+>u"u0ea_.1E\D1+>P_q0ea_,0d&2,+>Yr!0eje,
0d&@s1,9t-0H`/3+>GPm2DQC00H`;6+>GYp2_lL11a"\7+?:Q'3$9q4+>bqu0ea_,1E\Ru1,L+.
1*AA.+>GSn1GBq+1*AD/+>GYp2)l^51a"P/+>GSn1c%He7nHHI:..NQF*)G:DJ()/@<--tDJ()5
FCB33+E(j79OUn3=<M<qA7^!sA0?)7Eb$:E+EM+*+@\Xi79!&U78?cM:..ZK6q(4!FE2)5B-;&"
EbfB,B-:c'A0>f&+A?3CAQU'hDId='ARlp-DfTA2/Kf+GAKXH.91;fU91;TS7R9[9<)6.U:/`nj
@;]Tu1E^ET.!K9>.3N_NCLqC)+>"^XBOr<.Ea`ZuBl7Q+@VfIjCERP-+=K<+HU^:o79!&U78?c1
+DkP/FCfK6+\?uP:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7
A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)
A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4
Bl"o+DKKH1Amo1\+EqaEA91@:6<-TN6rZTWF(K?6ASu!h+E(j7CghEsGT^L7D/E^!A9/l8BOQ!*
@WcC$A0=]:7S6?M<_5_];cQ:V8Q]k=D.Oi2F_56"GT^p:+DkP-CLh@-DBNk@ATDs.ATo8=AU&;h
:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k
+CT.u+Cno&APu<"<*)jn6rRi=A8Gt%ATD4$ATD^-F<GdGEb'56-rNi:<*)jn6rRi=A8Gt%ATD4$
ALSa7Ec6)><(KSZ:dIiE:IA`:Cht55@;]Uo@j#?-ARfk)@:F%a+E1b2BHSlLF`V+:E+*WpDdso.
DJXS@BkAK+DBO"6ASc0*E+*j%=&M=\:f9_O8Q]\EG%#3$A0>V0F*)G:DJ()5FCB33Bl7Q+GB.,2
E+NQ&Ch[cu+>"^IG[kQ4A7Zl24ZXr5/Kf.U@;0OlDJ()$Cgh3s+DkP/FCfK6=&M=\:f9_O8Q\q\
=<MQkDIdZq+A?3CAQU'eEa`TtASuT4Ao_g,+=L;h5u:BU77KjN.3L2bFD,6,AKZ&9EbTE(F!,=B
F*&O7DfTl0F)Z&8A79"ZCi<`mF(96)E-*gCE,]B+A9/l3EZfC6E,8rmATJu&+EM%5BlJ/:Bl5&8
BOr<&Ddd0!F(96)E-*4DARfgrDf-\9Afu/:@<-I4E+EEtF`2A5F`DDDDffP5F`)2ADffQ$+EMXF
Bl7R)+Cf>-FCAm$Bl7Q+@VfIjCNDNZA7BP$DffQ5E?HW=3a?-1@;]k%+DG^uE+*j%F!+q+FCSu3
AoD^,FCf]2DId='ATMI%Ec#6,+DbJ.AU#>3DId='+Cf>,D..<mF!,(8Df$V0Ci<ckC`mS'Ebf`/
Ec6)>CghEsG\;&8F`8I>@<?(*+EqOABHV8&DIdZq+EMgGFCBD:BPD*mCh[NqFD5W*B6%s-Bln3#
CLnW)@<?(*+D,P4+D5_5F`8HOGq!Q<FCf]/Ec#6*CLh6iFCf\>Ao_g,+DkP-CLh@-DBO(CBl7Q+
E+*WpDe!WmEbf;rF)u&.DJ`g&CER@7@rGmh+D,P4+DbJ.AU#>3DId='Bl7R)ATVC(Bl%<jBl\99
ATVuH@rc-hFCfM9E+*j%F!,UHARlomGp#^T6m,r]Bl%<&GAhM4F)to7BkCd`ASc'uCNFQ.F<G7B
E+O'1AS*'$Bl7^-+DG^9@;^?5Dg#]4G%kN3+DG_8ATDBk@q?d,DfTB0+EM+(FD5Z2F(KH.De*Zu
FCfK$FCfE3AT2'uAKYT'EZf=ADe!@"F(oN)GB.,2G&h&.Df033Ea`p.+Eh=:@UX@mD'3q3G]Y'E
Bl7L'+EqOABHV,&DJ+')+?gnrGUW                                              ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o3$:1<2em8ACh\!&Eaa'$;f-GgAM>f567sa&De*ZuFCfK$FCeBfDeio<0H_K[/M/)[
De*ZuFCfK$FCcR;F)>i2AKW+;ATMr9+>=o\/Kc0FF_PZ&$;No?+=M;RDJa<1DCI1F:-pQ?:-pQU
;f-GgAKW+1De*ZuFCfK$FCd'I+@:3bCh+Y29OUn3=<J`#DBL'DBOr;/E-67F+Co1rFD5Z2@<-W@
EsbZ//g+\C@s)X"DKI"3Bl[cpFDl2F+E(j7FD,5..!'NKD/X?1.3KaGEc6)>/g)8bF*2A;Df9MB
+<YB>+DG^#:-pQU.!9WGCi_$X+=M;RDJa<1DCH]BF!)TJF(Jl)+CT=6BlkI?BOPs)@;[3%DKKH1
ATMs-DJ((79OUn3=:.ei/g,(UATDs.AToa6:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q
67sBjEb/[$ARmhE1,(I;D..]E2@<2G/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4-XpM*AL@h$Ddd0!-YdR1Ch\!&
Eaa'$-OOm*EHPu9AKW@8De*s$F*(u6-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&@rH(!F(KB6
+=CT4De*ZuFCfK$FCcg,$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-ONU8/g)`m<(0_b+B)6*
;H/&r$49Np/g,(OASrW$Bk)7!Df0!(Bk;>mATAo3A0<rp-Y[F/GT^a>A7T7p+DPh*+E_d?Ci^s2
$;No?+EM+9+E)CEE-67FA8-'q@ruX0Gm\,'+EM+9C2[X!Blmp,@<?''-RT6.:-pQUB4YslEaa'$
+A?3cAQT:NEZf"8E,961+=D5QDJa<1DC5bu:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No0
0FA.sDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,              ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,:g31,C%/+>G_r1*AJ40Jst-0d&4o2_[!01,'h++>u,32BX_/+>P&t0JPF-0fC.0+>bo/+>GSn
1*A;+1Gp:03?U("0f:jG+>GSn1*A>01H?R41E\Fq0fLsD+>PYo1*A;,2_lL11*A=p0f_*60ea_*
+>PW11c-=01E\Fq1GgsH+>Gl!1*AS80H`,*+>P&t1,q691,'h++>to-1E\D/+>P&q2)$j00eje+
+>G]20d&22+>P'"3A;R12]sju0f(^D+>t>t+>GQ.0H`),+>P'"1bp1.1a"Or0ekOE8l%iA<CokP
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
/M/P+/M/P+%15is/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#?-ARfk)@:F%a+E1b2
BHSlLF`V+:-ZEL3A8bs*+E).6Gp$g5+E)-?F(f-$C`m\*FD)*j:-pQUB6%s-BlkI?+<VdL+<VdL
:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g+k?@:NkiARfgrDf-[?+<XEG/g+kGFCfK)
@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQUF(KH.De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%
AoD]4E,ol,ATMp,DJ'Cc.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$
FCch!:IIuc8l%i^D.GC\%16K8:IJS5<)5nX%156]4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+
Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'JAKYGjF(HIM2BYLi
8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.SEc6/CAKZ).AKZ#)
G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/6#:U\/0JtE@:UKb
?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=
De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&ASuU$A1B2S:i'QX
F!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$:\rS+F.O,EcW?p+D>2,AKYhuBl8$$
Bl7Km+CQC3EbT]*FCcS6Ec5](@rri0DeC27BOQ!*Bl7EsF_#')%16K8:IJS5GAhM;/g*_.DIn!&
EZcQFF^f0$F(f,q+s:u@BlbD-De!p,ASuT4AoD]4FD,5.F(oK1Ch4`0ARTXuD@HqpBOQ!*8K_PX
A8Wc:+Eq73F<G[D+DG\3Cj@.FBOQ!*8K_GY+Cf>,D/"*6Bl7Q+FDi:1DL$>;Bl7Q9+AQj!+A!\a
D'3>,D/F!/FD5W*%172q+D,>*Blds%DJ()6BOr;uATo8;ASkjiDJ=!$+CIf;6sq-LART\'Eb0;E
%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=2)f/eA8!]8D)*eT2.A=WB/VGSDeWWgAm[`0+Auc_
Bl7K)FD,5.?tsUjCh\!&Eaa'$?m&967Nb<!6m-PhF`Lu'+Cf>#AKYN%@s)X"DKIKR:2b>!FD,*)
%144#+A!r(AKZ#)F*2MDARfgnA0>8pDe*ZuFCfK$FCei&@;]TuEb0E.F(Jl)BlkJ0DfQt1F`MM6
DKI"EATDj+Df0V=De:+rE+*WpDe!'$BQS?8F#ks-E+*WpDdtD<Eb@$S%144#+A!\c@;[3%D/aN6
G%De<BOr<-Dfp)1AKYK$A7Zm&Eb0<'DKK</Bl@l3A8bt#D.RU,/g+)(AKZ).AKZ#)CghEsA0<"&
<)5nX?YXLiCh\!&Eaa'$?Ys=]/e&-s$8O4V?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?
8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc
+EMgLFCf<1/g*hr@WMtc+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$=I(L
DIb>@De*cl?k!HB:IIucC2[X!Blmp,@<?'fD.GC\%16KXDe*ZuFCfK$FCei&<)5nX%156]4Ztqk
4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.C2[X!Blmp,
@<?'g/e&-s$=IUeA8Gt%ATD4$ARHWpF!+m68hWe46m,uU@<6K4B6%p5E$079@<<W2Ec6,8A7]fk
$<q=\FCfK$FCcS6Ec5T2@;TjqDJ*6'BQS?83\N.&Blmp,@<?("Ec5T2@;TjqDJ(S3Df%.ADId='
/nf?DCagKJF`;;<Ec_`tAoD]48g%V^A7Zm)FDl22A0>T(+A,Et+Co1rFD5Z2@<-'nF"Rn/%16'J
BlbD-De!p,ASuT4FE1f"CNCV;ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*Zu
FCfK$FCei4%16'JAKYGjF(HIM2BZL<F(HJ.DKBB,F(o`1G%Ddd<CoS$CLqc6BlbD<FCAWpAKYo7
ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$`$F<G^DBlS9,Cj?HsCggdaCi^_1@:NsnFCB6++CT.u
+DkP&ATJu.F<GO@F)u&)Ch4`!Df'H-Ch4`"ATV?pCh7-"@q]:gB4W3!BleB7EbT*+%16Qi+EVXB
Ci!g'B-;,9ATAo8BOr<0ATDj+Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?5%13OO?s@)OB5)68FDk].
?!n*K%14gB+CI<=3-]"G1iR&HBOYO]CjIgTEA2WKFZ!Ye1LE=R+Auc_Bl7K)FD,5.BOPdhCh[d"
+E(j7GB.,2E+NQ&FCf]=/e&.1+<Y',De*ZuFCfK$FCei&GB.,2F!,:;DJ()6AU&;>Ch[cuF!,RC
+D,>0+EV:.D'3b7+CQC3@:s.(%144#+A+1-F`)#0CLnW*@;^?5DffZ(EZf=ADeF*!D/F!)B-;#!
DJ+*#B4Z-8+CoD%F!,@=F<G7*G%D*i+<Ve8+EMX5DId0rA0>`#@;^-/De:,9Ea`p+Bl7Q+FCf]=
/g+,,BlbD-AS,XdBk;0lGp$U8D.73sARlp-Bln#2FD,5.FCf]=%144#+ED%4Eb0<'DKK</Bl@m1
+E2@>A9DBnA0>?,+CI&M3]1:f@ps6tEb0<7Cige6DBNb0DIml3FD,*)+EML1DBLEG@;^?5FD,T8
F(&rsF".V++<VeFAftSs@<,ddFCfK6/g+P:De*ZuFCfK$FCei&GB.,2F!,OH@q[!$Bl7L'+CT.u
+DG_(Bk(RnATJu9BOr;qEb/Zp+EqOABHVD1AISth+<YK3@:X(iB-;8;EbTE(+CHQ\/hT=1-X\PL
<+ohcCh7$cBl7Q+F*)G:DJ()$AS5^pF!,%&@q[!/Ea`p+ARlp"Bl7K7+B3#c+EMXFBl7Pm$6UH6
G@>P8@q]e%ASrW"ARf.kF(HJ.F=2,P@s)g4ASuU+Gp$s8@;]dsB5D.#F!,17+A+7/<+oi`AKYE%
AKYr4DdmNoD0$hDBln"t$6UH6FD,5.Ch7$cATBCG8K_\TA0>u4+DG_8Ec5K2@q?ck+EVX4Bl%L$
B-:Z"@;]j'FDi:@Eb0E*DKI"/E+*WpDe!/tF*VYF@<`o.BkM*qBkM+$Bl7Pm$6UH6Ao_g,+=^uG
F(oN).NihHAKYf#@:Wqi+EqOABHTni@rGmh+DG^9F)Po,+DG_7FCB&sATKIH<+oue+EMI<ATVX'
ATJu7ATN!1FE8R=D@Hpq+<Y`EF`M27F`S[7Cgh3sF"SRb.T0hpDg#\7FD,5.F)Z8BBlA-8+C].q
DJO;C.P;/;%14jC+CI<=20(K_EGmjT@V9b'De3Ht0k"U&3Ak;,DI5S8+A$EhEc6,4+EV:.+DG_8
AS6$lFD5Z2+E(j7D..I#A8c[0+CT.u%144#+A?3CAQU'cDe!p,ASuTuFD5Z2+D,Y&B5M3tFE8RK
Bln#2?tsUjCh\!&Eaa'$?nMlq%16KIASu$1FDk].?!n*K@WcC$A86$nBkh]E0ht%f.UmO7Ch.:!
A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%FCeu*C2[WsC3(M=@rc:&FE8QIBl5%9C2[WqBljdk:-pQU
A8-'q@ruX0GqKO5:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+<VeIAT;j,Eb-@@B4YslEa`c;
C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBj
Ci=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,
67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr:-pQB$;No?+<Vd]+ED<A
-Xq44Ch.:!A8,e"-QjO,67sC$F`&=:De'u-@:O=r+=JreF*2G@Eb0<5ATJu.D/a<*@qg$-BeOBR
%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9
ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*0ktiK0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emEcDD4!l@:Wn[A0>W*A8lR-Anc'm/no'A
+DPh*E+*d(F"V0AF!,49A9Ds)Eas$*Anbme@;@K0C3'gk:-pQU0f<BYE\K6kEb0*+G%G2,H=gl-
ATJtG+E)CEE-67FA8-'q@ru9m+EVNEC2[WqBlkJ?DId=!+CT)#ASqqa:-pQU0fX&hFtbp!Anc-k
C`m5$ARfKuFD,*)+Eqj?FED)3+D,>(ATJu*G\M5@%15is/g)o'C12!81a$jQDg*=JEbTW;ASrW&
Bl%?'E+*j%Et&Hc$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1
+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW
3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUAn?'oBHV>,
EHPu9ARlp+FD5Q4+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K
@WcC$A86$n-OgDtDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt%15is/g+S=Bk;0)C2[WsC3(M.Bl[cp
FDl2F%15^'6q9gJ8l%iH8lJPP<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*
+@K$l<(LA';cI+28l%in@VQ>Z8l%iF8Q8;X6qL!L:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6qL!L
:dJ&O/151NA7oUu05>E9Bkh]B-OgCl$;No?+D58'ATD4$AKYK$D/Ej%FCeu*8l%ht@r,RpF!,O6
EbTK7Et&Ik@r,RpF(KDU3ZpLF-YdR1+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*
FDl)6F!,49A8c?5%16igA7fOlATL!q+=K?-+C?iP+DkP&AL9S`C1D'gF)to6%13OO:-pQUEb/Zi
+Cf4rF)rI9Bl%@%+C\bhCCLV!C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)HTE?*+DPh*
Anc'mEt&Hc$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7lu-ZW]>F)kb<4ZX]B+D58-
+?MV3C2[X%Ec5Q(Ch4`(De*fqEc#k?C2[X*F(KB%Df00$B4>:b-OgD2HS-Ks+EMR5.6T^7HTE?*
+EMR5%13OO:-pQUF`:l"FCcS*Bl[cpFDl2F+D,>(ATJ:f7S-9B;a!/a-u*7.@<6L$F!*"VHS-Ks
+EMR5.3L/g/j:C?-SB+JF!hD(7S-9B;a!/a-p1*t6q9gJ8l%iH8lJPP<(JG\/1)u5+@\pr78jX&
0Ka)gA7T+j+<VdL+<Y9?EbTW,+EM47GApu3F!*OuHU^S#78jX&0Ka)gA92j2Eb/ciF<G1>EbTW,
+EM47GApu3F!*P!HU^S#78jX&0Ka)gA7TUfA79R&+<Y9?EbTW,+EM47GApu3F!*P"HU^S#78jX&
0Ka)gA8PajARo4k+<Y9?EbTW,+EM47GApu3F!*P#HU^S#78jX&0Ka)gA9E!.Ch-sr+<Y9?EbTW,
+EM47GApu3F!*P$HU^S#78jX&0Ka)gA9;a.Cia,qF<G1>EbTW,+EM47GApu3F!*P%HU^S#78jX&
0Ka)gA8c?r@<<V7+<Y9?EbTW,+EM47GApu3F!*P&HU^S#78jX&0Ka)gA8lR-Anc'm+<Y9?EbTW,
+EM47GApu3F!*P'HU^S#78jX&0Ka)gA8kstD0$gB+<Y9?EbTW,+EM47GApu3F!*P(HU^S#78jX&
0Ka)gA9Ds)Eas$*Anbme@;?utGB.D>AKZ&-Dg-//F)rHc3I=4e9LVkh$4R>;67sBjBOt[h+EV:*
F<G10Ch7Z1AU%p1F<G:8+D#e:ARfgnA0>DsEb/a&DfU+4$7I\Q3Zp+*+@\pr78jX&BkAt?.P<A`
4Y@jhAU%p1F<GiOA8a(0$6UI4D/XQ=E-67F-Y%(3D.RU,ARlouDe*QsF!,O6EbTK7F!,UEA79Rk
A1%fn+<Y`BDfp/@F`\`u:II]E<(]qS8P2oX5u^Aa$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;BRP6
D/"'4Bl7Q+@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+>#c)+?L]k+<u=X/M:KA$6UI"F)to5F=n[i
+AP6U+EqL;@3B&uG@GK9+UnciDIb@/$7QDk%15is/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>p
$?'GtDf9P:>9G^EDe(4C%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F<4&@WcC$A86$nCghEsGVV!K67s`sF_PZ&C2[X!@<?(*+EK+d+<Y<.DImisFCfM9F*VYF
@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T/a%15is/e&._67sBMBl%@%+CT;%+Eqj?FED)3
+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+CoD#F_t]-F<G+.Eb/a&DfU+U%15is/e&._67sBhF)uJ@
ATKmT@s)g4ASuT4G%G]8Bl@m1+E(j7E+*WpDdsn<E+*WpDdsnF/ibO=/hnJeEZf1,FCfJA%15is
/g)8Z+<VdL+<Ve:BOt[h+Du+?DBL?,84c`V5u'gD6R`HO:-pQB$;No?+AQhtATDg0EZek*ARfLi
DJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)o'D..]D1*CUKG%l#/A0<:HH?s=EA8PahDI7KsGUX(/:-pQU1,*QRGqh&s
.!g2cC2[X"@;0U3@UX@-+CSekARl5W:-pQU1,*QRGqh)t-no.IARTIuAU#b8@<<q@@:Wn[A.8kT
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4FDYu5De!-?
5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(A8G[rAU$3q
3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%172oE,9H&+D58-
+?MV3F(fK9E+*g/+ED%%A0?):Blmo/@q]:gB4Z.+EZdtM6rm#M-OgCl$;No?+CfP7Eb0-1+E2IF
+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$A8bs@3Zpgd6XO22Ddjhn+CoD"4ZX^43dWJI
:dJ&O?XH`2?XHE$6uQOL%17/fFD>`)Ch\!&Eaa'$+CoD#%13OOEc5l<FCf\[3ZoerH?s=EA8Pah
DC5l#%15is/g)NfH?pq]D..3kF!,R<BlbD/Bl\9:+E)-?Eb0E*EcYe7A8-'q@ruX0Gp$^5Ch4`,
@;TQuF)Q)@Et&I(Eap56AU#Rc3Zq-_6W-]e@;9^k?Q`umF<GUBDfg)4GUt4LFCf\E%172gGWe)1
4*s">FCf\+$?Tj(4ZX]6-SH]nINs#IEcYr5DBjUZ,;1Dq4"u"R:IJ5X6n'6gBOPdkATMs6+EV1>
%14M*Db;-oAU#XHGB.D>AKYN%@k;Y=Dfg)4GUt3pFCf\E%13OO:-pQU8l%ht@r,RpF(KD%$>O'e
4ZX]I3[\Z\A8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5-OgE!
FEfr0+D5_5F`;/*FCf\D/j:Cm@r)S]%15is/g,:XAKW@HH7'hSEb/isGT_*H+CTG3Bk/>rCghBu
ATJu<Bln#2-YdR1-Qk#o04]!2F_t]-F<G10Ch7Ys$?Tj(Anc'mF$2Q,-p2$Y@jrNO-8%J)-p/l'
H7(-a/1)u5+DPD&+=nil4s2s8/p(ZL-Qij*CijnEGB.D>AL9#n+EV1>Anc'mEt&Hc$;No?+D5_5
F`8I4F_PZ&+C\c$@q[!+@rc:&F<E.XCghEsGT_-NBl%i5FD,*)+Cf>,E+s-"+D58'ATD4$ARloq
Bl%@%%16id@WcC$A9;C-4Y@j*-SKonIV3\>F`;dSIP3'"Ec5l<FCf\G+Cf(nDJ*O%FE/Kr9L;`N
9LMiK=:GTcFDj]G;cFlSCgqO$Ch.X!GUXbZEbTW,+DP_%F_PZ&@UX@A/g,4KDg-//F)rI7Ddt>=
Df9`>AU#aR/n/72-OgCl$;No?+D>2$A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5+EV1>05P'=
AU#>>ASlB/Anc'mEt&I(Eap50G'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](@UX@+%14M*
Db*Z&<$48L3\5/lF=A>VEbTW,+CoD#/13,]Ch7$mFCf\L@UX@+%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6#(=KCghEsGW@cE?Xe.lCh.:!A8Gt%ATD4$ASbdsAU#sb:-pQ_
@WcC$A86$nCh\!&Eaa'$CghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[NqFCeu*C2[X!
Blmp,@<?''F)Q2A@q?cV@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF
+Co1rFD5Z2@<-W@F!,"3@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1
+Eh=:F(oQ1F!,C5+E1b,A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL
@q]F`CERM5F`&<M<(KSZ:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'
EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW+0Pt6D0ea%D:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90Pt6D0eskmBQ&);Df0B:+=LuCA8Gt%ATD4$AM.G#
F=@Y+%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-+<W%HDe*ZuFCfK$FCcg/$=e!aCghC++EVI>
Ci<fj5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eODe*ZmFCf\W3B8H0>9IEoATD4#AKX)_5s[eODe*Zm
FCf\W3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;67sBj
F`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!
Ddkjj+F?.r/jrN%<(LA';cI+28l%in@VQ>ZF(KH.De*ZuFCfK$FCcS*Dds4`%16`gE,K*$AN`'s
-YdR1Ch\!&Eaa'$-OgCl$;No?+D58'ATD4$AKYW+Dfp"ACghEsGRY!pChI<s4ZX]uEc>i/F<G4:
E,K*$AIStoEapdGC2@p/Dfd+:CijB5Ch4`(Ci=K2ATo83Ch%BoAKY`(@WcC$A7Ath-TsL5C2@No
D@Hp^$;No?+D>2$A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5+EV1>05P'=AU#>>ASlB/Anc'm
Et&I(EapgHDK^+L4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]q
G'#/UGB.D>AKYN%@k8u]@r,^bDKKH7/n/72-OgCl$;No?+DtV)ASbq!F!,X;EafIb-o2u,+>>5e
EapdG.P;ia@keE"BkAt?0eGG3+CoCC%144#F)>i<FDuAE+DP_%F_PZ&@UX@$:-pQU:ddbq@rH4'
Bl%?'@UX?f$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;E>q5ASu("@<?4$B-9lV<+T/S/Nt:)4(iSQ
DIIBn%16ZaA1euI%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[X!
@<?(*3B9*,@r,^bDKKH7?XdGc1,X)`D'3k1D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEscGhC`k2[
@<Hf%A7]R".P>1>C^O]aC`k2[A9MYoA7]R".P>[]$=m^a+=]!XA9\GlAS`J=/oPlS$=m^a+=]![
DeBDfAS`J=/p)#A$=m^a+=]![De9>eAS`J=/o5HB$=m^a+=]![Dfc=sAS`J=/no36$=m^a+=]!X
ChF)cAS`J=/n/X0$=m^a+=]!VH4"1oC`k2[B6kt8F`VgW$>=-pFDl2FC2[W<2[p*'$>3pfATD3q
05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c
/hen5+>"]aGA2"F%13OO+=\LAC2[X!Blmp,@<?'g+E1b,A8bs29OUn3=<M']F(Jl)A8bt#D.RU,
@<?4%DBO%>DepP=E+EC!ARmD&$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[
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
$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKSATDiF
C2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.
E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#
+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb
=)`D$CbBF:Et&H_#n74a+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSek
Df0VK%144#+<VdL+<V+##mkQeDfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#
$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-
2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6
Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@
G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?
D/"6+A0><%F(o9)D.RU,F"Rb*%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%
+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf
>n%,`+<VdL+<VdU%13CJ%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'
ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,
AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4
+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5
.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o
+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J
+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7
Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2
FCfK1/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@
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
+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL
+<VdL+:SZ#%143e$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1
FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5(&/Kdbr
Earc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+<W-V+B;<5F!,17+CJr&
A1hh3Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j785rPb/e&-s$6UH@+Auc_ATD@"
@qB^(FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk/e&-s$6pc?+>GK&/heD"+@KdN
ASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+<W-V?t*b[FC65#@:O(q
E$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5DK?q=Afs]gE-ZP:EZf1,@WNZ#
A7T7^+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<@<?0*-[oK7A8c@,05"j6ATD3q
05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6UH@
+Eh=:F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO,9nEU0J5@<3B9&A/KdMo@WHU"
Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57F'p,3ARfgrDf-\+A7T7^/g(T1
%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V?u9dt?m'N%@ruF'DBN@uA7]:(
%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+<W-V
F*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V8l%htAoDKr
ATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss3%cmD+A,L1
/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0sDIdI+/e&-s
$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D+Dtb7+A-]n
Aor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%
0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#FED)7%144#
+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?+>>E./ibmM
+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;
+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9+:SYe
$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q
?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,RpF'U>?
@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(t
FE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6
DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6@q]:g
B4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.
Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo$4R=b
+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1@<,jk
+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<3B&'4
+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$
A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdkATJu9
D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?
F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU0J5@<
3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&A7TUg
F_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l:2b;e
D.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2A8-+,
EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO+=\LA
DKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:Bldir
+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In:LeKb
@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu?o9';
Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(GA^\7
BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E./iYO-
/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUjA8bt#
D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L16q/:k
:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl4@e
+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8D.Rc2
FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,Ao_g,
+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8E+EQg
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)@V'+g
+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#+<Y04
E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6E,ol5
BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57B-7Wj
+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm+CT.u
+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"Rn/
+:SZmDe*ZuFCfK$FCeHnATDQtH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZAS!!.BkqE*
E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?
+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C
@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)
ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le
7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@0
01ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`t
BkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB)
;eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM/1<V.C2[W1.4dS/
F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e%15Q[4#&fpASkjkAKX?_EcP`/F?=;W
@:UK.C2[X!Blmp,@<?'.+Bot*Ci^^HC2[X!Blmp,@<?'.+BosuCh7$q+=ANG$:AoUCb%t14#&fq
ATT%^F`MM6DKIsYA0<9_-Y[F/GUFpk-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-QjO9+>Y-Y
A0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@
6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$
AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp+B!?"4(Mf@F`&<L
-OgDP2ENWT<+U,m+B*,qCLoSJFEAWQC2[X!Blmp,@<?'ZD/X3$0JFj`$<(VPAooOm2ENWT<+U,m
+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@C2[X!Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%
ATD4$AKYo7ATDs.ATnRj-!YM&@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO
>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]
BQ@ZrHY@MCE-"&n04f#RGA1i,E+NQo@4lJ=B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<
ATD4$AUP\3De!p,ASuU2+Co2,ARfguGp$^>Df$Uh:IH=9Bk)7!Df0!(Gp$a?Dfp#?/e&-s$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo
>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$DJOSu84c`V5u'gD6[`37DfT]'CfG=gHW3O-
;c#bT6r-/m+<VdL+FRK^Df'?&DKJirCO9Z9Cht55@;]Uo@j#?-ARfk)@:F%a+E1b2BHVXRI3<ZR
AKYr#DIdZq+E).6Gp$g5+E)-?F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5B6%s-Blnc.:2b/i@;Jn]
CO9]7E,961+<VdL+<VdL+<Z);6Z6gYASuThDej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?R
H#R>8Ch[d&HYI)#@qB^m@ruF'DLGbbDfT]'CfG=gHYI)#@qB^m@ruF'DBL&E+FRK^Df'?&DKJir
CO9c5FCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$
FCfl*:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+<Z);6Z6gYASuThDej]=Eb02uEb-A*DfQt>Ec5H!
F)u&5B713r>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%13OO>]Y$sF(Jj'Bl@m9>]aP%
FEDVOC2[X!Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,
+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lVDe!p,ASuT4FCf]=+DGp?E,ol,ATMp(
F"SS,F<G"5F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<WsdC`me;F`Lu'
+Cf>#AKY].+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%16?SFCf:u$6UH`:IH=<Ec6)>+CoD#
F_t]-FE8R0FCf]=FEDjb+?:QTBle59-YII<F`;5,D.P)C+CT;%%144#>\J.hAp\35FDs8o05>E=
DJ`flAmo^r@;]X/DImoCE+*WpDdtFu76s=974r7qD/<H%E+*WpDe!i?D..I#A8c[0I=#pADIdZq
%144#@rH4'@<?3mCh4`+@<--oDg-)I+EV1>F<G19@:sFgDKKqP+C&JpE+jStBPDN1BlbD=BOr<'
Df^"CF(KB+Dfp+1$6UI-Bl.R+@<?4%DBNk0+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4fpj9lG)p+E(j7
D0[7:Ec6)>+CoD#F_t]-FE8R5Eb,[e+<YQ?F<GF/Ebf3(GA]#U8K_GY+EM@;GAMOI@rH7.ATDm,
DJ()6BOu$5+A$/fH#IgJ@rH4'Df]J4B6%p5E"*-s+CoD#F_t]-FE8RIF(HJ5@;]Uo@j#VsEbf3(
GA\O3DIakpFCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+C\n)@3BB)F:AR"+Dl%;AKZ,:AS-($/e&.m
Blmp'%144#6#LrjB6%p5E$/Y,@<6KpAoDU0DJsW.HU/cZASlC"HY7A;F`8I5CghC+I3<6F+CQBb
:IH=<Ec6)>+EqOABHU^m$6UH6+Co%nCgh?qA0>]&F*&OCAftf*FCfK)@:Njk@;]TuEc5l<+EqaE
A90d@$6UH6+C'#"G]\%LHV$[m6Ub'P;FFH3>\.bkBR=B4Dfp#:@;TS(+CT.u%144#+<Xp2AU&<=
FF-n]:K1Ck;FFH3>\.bkBR=B4Dfp#:@;TS(/g+&1Dfd+GDfTB0+CT)&Dg)Wt+<VdL>]aP%FEDVO
@;Kb#AS-"3+EVNEAnc-n+CT)&+EV:.+EqaEA9/l8BOQ!*@V'@oDJ()6D]j.8AKYW+Dfp"O%144#
+<X$f@<6K4B6%p5E-!.DH#RJ-@;Kb*+Dbt)A0>T(FDi:<De!3lATKIH>]aP%FEDVOC2[X!Blmp,
@<?'5Bkh^;%144#+<YB>+CT.1AU%X#E,9).De:,#+Cf4rF)rI:Ec6)>/q"jVDKKH1Amo1\+DGm>
@3BW*D/a<&+A*c"ATD6gFD5S$$6UI#Ci<g!+EV:*F<G:=+DkP-CLq$!GA2/4+CQBt9OUn3=FP=&
@ruF'DBNG-D/E^!A1eunG[YH'DIjr4BPDMs$6UI(Ec6)>-Z^D@De!p,ASuT4>]aP%FEDVO1*AS"
A8-+(+=CoBA8Gt%ATD4$ALDmKAoD]4@;[3!G[YH.Ch54.$4R>I@V'1dDL6P<EaiI!Bl/8-$7-g2
@<?(*+EM+(FD5Z2+:SZ_F*1r5ARfgrDf0o,FCf]=FEDkBEc6)>DIIBnI3;+!FCfK)@:Nks%13OO
IXZ`p+F>4`C4-NuB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%17/f
FD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'uAKYT'EZf=ADe!@"F(oN)%17Q5IXZ_g+:SZ_ASu%*G%G]'
@<?4#I16NgBlmp'%144#:2b#%8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_
ATD$fDf9`8DffQ;<+oue%144#+<YK7D/"*#FD5Z2+DkP4+C\n)ARTXkA0>Su+DGp?@V'%fD.Rc2
@3B5tDIdcrDI[61I3;s9A0>T-+DkP-CLq#c$6UI8Bln#2E-#T5A8a&=@;]Uo@j#;nCh[a#FCfK6
/g*T+ATE'<BPD?s+DG^9@s)g.Gp$@6AU&<=FF.8>>^_#0$6UI#Ea`HnATVu9AoDL%Dg-7FE+*Wp
Ddso2Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK%144#>]aP%FEDVOC2[X!Blmp,
@<?(/-Z^DDART+\EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmq^+<Yc>
Blbm9$4R>I@V'1dDL6P<EaiI!Bl/8-$;No?4?S(AIXWDd+>.J=FCf\>DKTf*ATCIYDIml3F*(i2
F@L:hD*9't+s;:C$;No?5!FFEIXWCK$=%.[A:&K2EaiI!Bl/8-$=%.[A:%m*F_t]1@<?(/%13OO
>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/I16Mm$=%[aG]\%LHYRJ0Ch\!&
Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u+AH9S+Eh=:F(oQ1F!,C5%15][>\7nmFDc#=
AU@[(AU&<=FF.b@A8Gt%ATD4$AUP\FBl%T.Ecl7BDf-[i+?1u-0d'nBA0>>mH#IS2/q"09%16'Q
+E_a:+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<fRFWbODF*'GP$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9
%16?SFCf:u$6UH_DKBo.Cht4d:IHfE$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJ
BkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>
Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>Fo5tl]R
8jQ.!/e&.mBlmp'%144#8T&Tk@;Ka&8l%iR:K::[74o#V+<Xp&Eb/j0BQS?83\N.1GBYZSF)PZ4
G@>N'/n8g:05>]FCM>FfA7TUrF"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-
F)N10+A*bbA7TUr/g*`'F*(i,C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qB
BOr;Y:IGX!+<Y3/@ruF'DIIR"ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'
+Cf>-FCAm$Et&I!+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6
DKI"EATDj+Df-\9Aft>lEb/j0BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%L
HZ3D2A8bt++Eh=:F(oQ1+C'#"G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'t
F*VYF@<`o.BkM*qBkM+$Bl7Q9+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2
BOqV[+<Y97Ci"$6Bl7Q+@Vfsq+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL
>[h8WBl89/DKTf-Eaa'$I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[
9lG&`+A*bQ@;]Uo@j"]qDKK<3+@p3ZBM<,QBQRs+B713r#p:?qBlmp'+C&T#AS-:&FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF
@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#ARloU+B*Q'FCBD:882^MCh[NqFD5W*I16Mi+<Xp'
FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6
F(K3&/So-CATD4$AM%Y8A1r@X;e9f[/PKl#ATD4$AKXT@7"$Zs$4.gt>\.e`HY%);D.R`rFCfk0
$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8
F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k+C'#"
G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$=%%OB5)71G%G]'@<?4#I16O(AT;j,Eb-@@B4YslEa`c;
C2[W1%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$>jU#+=CoBA8Gt%ATD4$AL@oo
>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+AZrfDBO%7AKXT@6m-#S@ruF'DIIR"ATJu(Df0Z*Bl7X&
B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/e&-s$=%%OB5)71G%G]'@<?4#I16O%A0<rp
-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHbDdd0!
>]aP%FEDVOC2[X!Blmp,@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-
@;[2sAISth+Dbt)A7]9oCh[Zr+CT/5+A*bt@rc:&F=n"0%16?LAS5^pHZit@@UX@mD1)j#Ci<`m
+=CoBA8Gt%ATD4$AL@oo>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+B)in+CQC:DfTW-DJ()&Bl[cp
FDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%+DkP-CLh@-DBNA*A.8kg+C%TK<+T0\
Anc'mF"SS$Cht58F^o)-Anc'mF!+n3AKZ2;BlnH.DBO%>+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge
+C]U*$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B?$4R>I@V'1dDL6P<EaiI!Bl/8-$?Kd#C2[X!
Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"GB43#F(KH.De*ZuFCfK$FCcRB05,9@
AM7e:BPoJFASlB6+<XEG/g+tEDKU15$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<XR)DBN2+AU&<=
FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB+C'#"G]\%LHY7A<Ch\!>
%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=
F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn/e&-s$=%%OB5)71G%G]'@<?4#
I16NrEc>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT[G&>\.e`HZit@
@UX@mD1)j#>\S:kD%-gp+B<Jo+C%TK<+T0\FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlom
Gp$@6AU&<=FF.Y@E,961/q"j3Bl%@%%144#D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;
Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&@<?(*I4cXFDfp(C@q]dp
@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6
/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#>]aP%FEDVO8l%iKBlmp,
@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5>\.e`HY%);D.R`rFCfk0
$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s
$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=FF-VU6qh<:ATD4$APdDY
@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='%144#@rH1+D/ODI+B3#c+Co%q
@<HC.+DGm>AoDg4+C]J8+EV:2F!,=.Gp%-=F*2;@+DG^9Ci=3(+DtV)ATJu7F`))2DJ'Cc+<YcE
B4Z0uATBCG<,WmiARfal@<6!&DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XlE*$=%%O
B5)71G%G]'@<?4#I16Ng@V'1dDL65CCijB$DesKCHSg.T>]XIdFD5Z2.XPE7DId='DIIBnI9d9h
>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91Ci=3(+EMID
EarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%LHWO*2:eXGT
8Q:*j+B3#c+Co%q@<HC.+DGm>0ek@)@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?@;L't+DGF1
H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1Eb/`lARo@_
+EqOABHVD1AKZ&9EbTE(+C'#"G]\%LHWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr6#:+QFB!0o
HX(Z(G]\%LHTj&75(.i3%16?ODIe**DKTf-Eaa'$I16NuDe*ZuFCfK$FCfB6Bk;KqFCf\P1*n&b
BPDN1C2[X!Blmp,@<?''Dg#]4G%kN3$=%X`@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];
Bk;L:$4:$[AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-DImis
FCfM#>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%EtD/!m#
I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;8l%htA8,OqBl@ltEd8d?Ec6)>F"Re,
>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&q$=%%OB5)71;eTTMARp2r
>[h8WBl88gBkM*qBkM+$Bl7R3>?qS@BR+Q.EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<Ch[u6
+<VdL+<VdLI=5?fDf'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".K>\JD%ATDU$DJOT?
ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FSZC6Z6gYASuThDej]=Eb02u
Eb-A*DfQt>Ec5H!F)u&5B71+lBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[Dej]6Amo1\
F(Jj'Bl@l3+<Z)\>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I0s4j
DIe)bBkM*qBkM+$Bl7R3$=%.[A:%6g@:Wq[I0p;g>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,
@<?(/+CT.u+A,EtI0p<dFCf]=FEDkEDe*ZuFCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/
@W-C2+EV:.+A*bdDe*E%@;]T_A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKm>
$=%%OB5)71ASuX-ATD4$AURc;/mSfhBlmp'$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^9
8l%htA8,OqBl@ltEbT*+/dbitFCf:r+<X9P6m-,_Dfp"AA8bt#D.RU,F!+_0AU&<=FF,bc3?VjH
F)W6LB6%p5E,K*$ALDmK@<,od+<Xp&Eb/j0BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq
02b5)6qp*&BQS*->U+2rDIdZqF"M6;Ebf3(GA_hUE+*WpDds+s+Cf>,E+*j&@VfTuD..I#A8c[0
I3<WCG]Y'?Ea`TtASuU2/g+D1D/a08<+oue+DGm>FD,5.D/XK;+EM+7BlA-8$6UI-Bl.R+@<?4%
DBNk0+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4fpj9lG)p+E(j7D0[7:Ec6)>+CoD#F_t]-FE8R5Eb,S#
+Du+>+DkP-CLh@-DD!&'+CT+0F)5c=Cj@.5Df0`0Ecc#5B-;;0ASj%B8S0)jDfm14Df'H3F(HJ,
Ec6)>$6UI%De!p,ASuU2+E_a:+E1b,A8bs#D..I#A8c[0+CT.u+C'#"G]\%LHYRJ0Ch\!&Eaa'$
I3<`JCht5'AKYD(Ci=D&+<YN>Eb-A9F(Js+Cb?'"Blmp'$6UHWDL!@;Ec6)>+Cf4rF)tSuDf9`8
DffQ;5p0EDD/a08B6%p5E$/Y,@<6L<+DGm>@3A0<6m-,_Dfp"AGA2/4+CPU"+<Ve;ARfObEb/c(
Ch[s4+E(j7Bl8$(Eb8`iAKYE!A0>o2Dfd+GDfTB03XQuP+<Xp2AU&<=FF-SK5sn(B:JsSZI9^?#
E+jT2Ec6)>DIIBnI3;s9A-sG%+<Xp2AU&<=FF-n]:K1Ck;FFH3>\.bkBR=B4Dfp#:@;TS(/g+&1
Dfd+GDfTB0+CT)&Dg)O2+<Ve3FCf]=FEDk<Ci"-'AoiACFDi:6Bl7H(@;Ka&FD,5.GAhM4F!,R<
@<<W$ASc:&B-;;7+EV:.+D5_5F`8r?+<VdL6Yp1PF!,+9Dfp#?+EVmJBk(RfCj@.>Ddd0!Bl8$2
+Dbt+@;KLr/g+D@AU&<=FF.b@A8Gt%ATD4$AM.\3F+"B<+<Ve@F!+n/+D#e+D/a<&+E(j7@3B&r
@<6K4B6%p5E%ZP]Bl8$(Eb8`iAKY].+CQC6Bl.g*AKXSfG%G]'@<?4#$6UI#Ci<g!+EV:*F<G:=
+DkP-CLq$!GA2/4+CQBt9OUn3=FP=&@ruF'DBNG-D/E^!A1eunG[YH'DIjr4BPDMp+<Y<;Dfp"H
F!,"3@s)X"DKI"+FCf]=FEDjb+?:QTBle59-YdR1Ch\!&Eaa'$-[d+LDfQt/DBNM8@;Tt"AM+;s
>[h8WBl89@ATD6gFD5T?$7-g2@<?(*+EM+(FD5Z2+:;@pF^fE'@ruF'DL5W1AU&<=FF.Y@Dfp#:
@;TS(+A$HmATDBk@qC&q$@[GQINWt[/o#eAB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0
DfQt5Ec6)>+=MLa$?Kd#C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7PjIXZ`p
INTa?>\.e`HZit@@UX@mD1)arBlmp'$6UHdDf..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et
+D5_5F`8I:ART+\Ea33pDffl8FCfeuBPDMp+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%
F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--pA-sG%GA2/4+E2C5F_#DBE+*WpDdso#
ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI$6UI#Ea`HnATVu9AoDL%
Dg-7FE+*WpDdso2Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK$6UHrFCf]=FEDkE
De*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.Ebf5s+Dbb-
AI9P&FD,B0/d_qj@V'1dDL6P<EaiI!Bl/8*:-pQq4FVa.INWt[/o4s<AU#>8F_tT!E_L1bATJu8
FCB337WNEa4X)U)+FOSl67tGcIXZ`p+:;@bDIe*;ATD6gFD5T?$=%.[A:%m*F_t]1@<?(/$4:$Z
F^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt6$=%[aG]\%LHYRJ0Ch\!&Eaa'$
I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u+AH9S+Eh=:F(oQ1F!,C5$;)pUAoDU0DJsW.HX(Z(
G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I0p<\D]j1DAKY6"
AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc$4:$IAS5^pHY%);D.R`rFCfl)0eQ`=>\S:kD$hC.
8T&Tk@;Ka&8l%i-$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@ID
ASu("@;IT3De+9C8l%j'+DGm>@3A/L+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOA
BF5k)>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,01nN(I="RP9RSN#>\S:kD$hC.
8T&Tk@;Ka&8l%iR:K::[74noi+C&T#AS-:&FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeMb_
A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR:K::[7=>Lc+DGm>@;L"'+CQBb+CSekDf.0M8T&Tk
@;Ka&BlkJABln#2>]aP%FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et$6UI%Bk)7!Df0!(
Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?.-+C'#"G]\%L
HYRJ0Ch\!&Eaa'$/q"(3Blmp'$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.hAp\35
FDu:^0/%9QDIdZq/oPcC07A1d@;]Uo@sos:+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+AU&<=
FF,bq3A*$=0mt0QDIal!AU/33A0;4%+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9+Ad)m
DfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqMn+D,P.Ci=N3DJ()$Ci<r/E,Tf>
F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TC+<VdL+<XouAS5^pHY%);D.R`rFCfk-#p:?qBlmp'
+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJ
AM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]OkB4stQ
B4uC$DJ+A)#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#
ARloU+B*Q'FCBD:882^MCh[NqFD5W*I0p9'+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[
Eaa'$+A,EtI4bj5+<Xp#DIe**DKTf-Eaa'$I0s4nFCf:r+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,
@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g%beDfp"O+A,Et$6UI.@;BFq+A*bt@rc:&
FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO$4:$IAS5^pHZit@
@UX@mD1)b3AT;j,Eb-@@B4YslEa`c;C2[W1$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5
-RT7<Ci^^HC2[X!Blmp,@<?'.$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.:N0l_+EV:.+A,Et+Co1r
FD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB$4:$IAS5^p
HZit@@UX@mD1)b0A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I$=%.[A:&K2EaiI!Bl/8*
>\S:kD$hC.9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVOC2[X!
Blmp,@<?(/+DGp?@ps6t@V#lh+Dbt)A7]9oCh[Zr+CT/5+A*bt@rc:&F=mn->[h8WBl89@ATD6g
FD5T?$>aWhA0<77De*ZuFCfK$FCcg,>\.e`HZit@@UX@mD1)arBlmp'$6UHiATT&'+EqaECM@[!
+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJu2@<--oDg-(A@;]T_+<Xo_
@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+GF)Y]#
BkD'jA0>?,$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B<$=%%OB5)71G%G]'@<?4#I0t%,FD>`)
Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-70F(KH.De*ZuFCfK$FCcRB05,9@
AM7e:BPoJFASlB6+<XEG/g+tEDKU12>\.e`HZit@@UX@mD1)arBlmp'$6UHhF`&=,FCf]=FEDkB
Ec>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/g+D@AU&<=FF.Y@E,961I0q)>
B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^
@8pf?IV*;1AI9P&BlbD0Bm+'*+EV:.+D5_5F`8I@@;TR.$4:$IAS5^pHZit@@UX@mD1)b(Ec>i/
F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT[>uASu%*G%G]'@<?4#I0s4n
FCf:r+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkB
Ec>i/F=qta7VQ[MEsa$4D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"
G]\%LH['+<@<?(*I3<HK$6UHrFCf]=FEDkGF^])pFCf]F/g+;8F`JU7BQ%TpAKZ22Cht5'AKYMt
@ru.$ARlomGp%3BAKYr4ATMF#@q?d$AdTY'<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH++Co&*
@;0P!+EM+*+EV:.+E2@4@;TIiAKYT!Ch3qr+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZL
I3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98E>\.e`HY%);D.R`rFCfk-$<1\MEb-A%Eb-A7Df'&.
>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#A$=%%OB5)71ASuX-ATD4$AURc;
/mSfhBlmp'$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-
BOr<(F_tT!EZf:4+DG_(AU"P)+Cf>+F_u#;/g+,,AKYMpAmoguF<G:=+D,P7EZeh6F<G[=BlbD6
@<iu9ATN!1F<G:8+Dbt6B-;)#D.Rc2Ecl8;Bl7Pj+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7
DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XQ4!@V'1dDL6P<EaiI!Bl/8*>[h8WBl897F_l/6
@rH1)I=!f!>?l5\@ruF'DCU!<Bl7HmG]$r,AURhk>\.e`HZit@@UX@mD1)arBlmp'$6UHrFCf]=
FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Esa$4
@rH7,Ec5c1ARlomGp$@6AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"
ATDiE$6UHYBOPdkAKZ).BlbD?@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59
@;p0sA0>]&DIml3@<,od+<YWDARf:_A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68
I3<`JFD)e-AS,@nCig",+C%3KATDllDej])FCf]=FEDjn/hSb?I=3^T>\.e`HY%);D.R`rFCfk-
C2[X(Dfp)1ATMF)F`9)j:-pQ_C2[X(Dfp)1ATMF)F`8HG+EK+d+<Y07ART[lF!)T6DIak4+Dbt)
A9/k9+A,Et+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.Ao_g,+A,Et+CoV3E-!W@$;No?
%15is/g+,,BlbC>+EM%5BlJ/:+<Y07ART[lF!)SJ@;]Tu+Dbt)A9/k9+EV:.+<X9P6m*TpA7]pq
Ci=90ASuT!$;No?+Co1rFD5Z2@<-'nF!)lGDe*BiFt=aYC2[W6+E_d?Ci_$X+<XX%+EDUB+EV:2
F!)TH@rc:&F<D]JBOqV[:-pQUAoDL%Dg,o5B-;&6F*&O<DerrF%15is/e&._67sC(ATD6gFD5SQ
%15is/e&._67sB7.3M5*3%cn0/NGF;GT^U:EZeFtDId[0F"AG.@:Li29PJBeGT^jGF*&O6AKY])
F*(i,Ch7-0%15is/e&._67sB8.3MT'AKXT@6m,oKA8c?.D09oA+C\n)Bl8!6@;KakA1f!)F(HJ5
@:O._DBO%>+DG_7FCB!%%15is/g)8Z+D58'ATD3q05>E9%15is/e&._67sB9.3MT'AKXT@6rQl]
;F<kq@:WneDBNe=F*&O6AKY])F*(i,Ch7-0+B<Jo+E1b!D..<)FDi:9DKBo.ChsOf:-pQU+<Ve>
ASu("@;IT3De*p-F`Lu'%15is/e&._67sB:.3MT'AKXT78PDQO+CSekDf-\7F`VXI@V$ZrDKBo.
Ci!Zn/g+/8AKYr#@r5Xl+EVNEBl8!6@;K`h$;No?+<VdLA79Rg05>*5Ch7Ys$;No?+<VdL%15is
/g)u"+B3#c+Co2,ARfh#Ed8d;3a?E<A9)U,FBfq:GA1qD+E)9C05,9@AM8BU85DrKI4o>RA9)U,
F>"abCh[d0GUX(/:-pQU+<VeDF`VXI@V$ZnD/aTB/e&._67r]S:-pQU2(9YCD]hYJ6m-#S@ruF'
DIIR"ATJu<Bln#2DIIBnF!)lGDe*BiFt=bNDe(CAF`_>6F"&5CG\M5@/e&._67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0l:?E1,KFI:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0em3M
@kftd@:Wn[A0>c.FCcS'@W-C2+CT;#07%>O+D,%rCisc0+E)-?2DcOcBlkJ=H#n(=D0$-n:-pQU
0fX#YE\TEoEb0*+G%DeBAnc'mF!,")E+NotASu"'+>"^[Bl%T.DJs_AEcl7BDf-\+Cht4d+EMgL
FCf<1%15is/g)o'D..]E2'@!PF*(u(+EqOABHS^<De*ZuFCfK$FCcm1$4R>_AT;j,Eb-@@Anc'm
F!,R5F))n=AS5S!+Co2,-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=K
Bl8!6@;Ka?3B:G03Zoe95s]7(A8,q&FCB!%3B9)I+BosuDe3rtF(HIV-UC$aC2[WsDKBo.Chu*l
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ATW'8DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><@rH4$
@;]Us+CT=6FCf]=+EMXFBl7Pm$>=@!F?MZh3Zp1$3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8.46<H
%13OO:-pQUD..3k+CQC'Bl[cpFDl2F+=JreF*1u&ATMoD+>=pM@;0P#Eb-[/$>j3eARoLq4ZY;@
3]/$@3\WT($4R>;67sC)EbTW,F!+m6Ch[s4+E(j7@X3',F!,RC+D,>(AISujEbTW,4ZY;@3\hg`
?p$\,-o3V*5!UMP+Z_;+.1HUn$?Kd#F`;)6A92[3EarZD3Zp4$3Zp*c$4R>;67sa/ATW'6C2[X(
Dfp)1AKW+=/M/(f@rc-hFCfM9+CT.u+<VeCDdd0t+<Ve!:IH<JA7]pqCi=90ASuT!$;No?+Co1r
FD5Z2@<-'nF!,(8Df$Uh:IH=9F_u)=/e&._67r]S:-pQUD/X<#A3(hUF(KH9E,'<%F)Q2A@q?d*
F\-4`DfTCu$4R>VAhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9D..L-ATBD;
C1\h9A8a(0$6UI4D/XQ=E-67F-Ugp2:Js4r8l%ht@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8
Ec*K=$>"$pASGa/+>#3XAU%p1F<G=:A9qs/4Y@jlE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3
EarZ6C2[WnATf\?C3(aFA8a(0$6UI4D/XQ=E-67F-Ugp2:Js4r8l%iR:K::[73H#LA8c?.BlbD7
Dfd+9DKBo.Ci!Zn-QmG@FEMVA/e&/!Cia0%AhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IA@<>p2
C1_0rATKM>Anc'mF"V0AF!i)@D_;J++<Y`BDfp/@F`\`R78d#Z;E>pm7S-9B;]oLZA8c?.BlbD7
Dfd+9DKBo.Ci!Zn-QmG@FEMVA/e&/!DIb@/$4R>_AT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQU
8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.Bl5&6AThX*F(HJ5@<?0*DfTB"EX`@dBk)7+4Y@j=3[]&l
Bl%i5C2[W*C2[WnATfF1$>F*)+>G!M/g+\=@ruc7AM,*DA0<6I+CoCC%144#F)>i<FDuAE+=BTU
;GU1O+EMI<AKXT@6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu*G\M5@-QmG@FEMVA/e&/!DIb@/
$4R>;67sBpAftM)8l%iqDf9_?AoDKrATAo-F!,")Anc-oA0?#9AKY]/%16f]/g)Nj-Tuf/C2[X'
Df9_\/g+nJ@<?0*-[nZ`6um3aF>#!aA8a(C+:SZ#+AP6U+E)@8ATDL+AKZ,:AKZ).BlbD-AS,@n
Cigd/$6UI+De*m,Dfe,p+=AgWDe(LK+:SZ#+DGF?+A#%(8PUC=D_</IDe*m,Dfe,p+=CY[-S0"N
A9)U,F<D#"+<Y63F(HsH%144#+<YE;A9)U,F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK-RgT]
De*m,Dfd*2$6UI&DIb@/$>"*c/e&-s$>F*)+>=p$+<rT`A8-',C2[X'Df9_?A8a(0$6UI.@;BFb
BlY=YC2[X'Df9_,$6UI4D/XQ=E-67F-V@0&+EDC=F<G+.Eb/a&DfU+G@rc-hFCeuD+=A^TDe*m,
DfcEqAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr<YDIm[(FEo!$:IH=GDf9_?A8-'q@ruX0Gp"\&
+=A^TDe*m,Dfd+BATW'8DCuA*ASu$2%13OO:-pQU@rc-hFCcS*Bk)7!Df0!(Bk;>p$?L'&F`_SF
F<GI4G@VgE0RI>E@ruc@/3IZcA9)U,F=]L-HXpi#FE7luF)>i<FDuAE+Dtb7A0<9THXpi#FE8l^
4DJeFEc5l</3>S5A8,OqEt&ItD/XQ=E-67FDIn$&+=K!lA8,OqF"&Y&C2[X'Df9_K4#2.nBk)7+
%13OO:-pQUEcl7BA8,OqBl@ltEd8d<F_u(?F(96)E--.1$?U-(E+*j%4Y@jlE+*j%+=DVHA7TUr
F"_0;DImisCbKOAA92[3EarZ6-OgCl$>+3s?Y!k\F=n\HBk)7++CoCC%144#A8,Oq4Y@j=A8,Oq
%144#F)>i<FDuAE+=Bj$@:X(iB0%._/7`I)F:AR"+AP6U+DG_7F`M%9A8,OqBl@ltEd8dH@<?0*
DfTB"EX`?u+E(d5HnHg23b2r7FC/a"A7^!7HS/iC@ruc7>9G^EDe't<-OgD*+AP6U+Dbt)A0>E*
D/^V=@rc:&F:AR"+>=s"0H`K"D/aH&FD*49Bk)69-SB+JF!hD(+<XEG/g+kGF*2M7+EqB>Eb0)r
Bl5&-DBO.AEbfB,B-;#/@ps1b%144#@rGk"EcP`/F<G[BE,9H&?U6tDC2[WsDKBo.Chu*l3F<4&
+<XEG/g,1GB4YslEaa'$+CfG1F)rIEAS,LoASu!hEt&I!+EVI>Eb/j(4Y@j2+D5M/@WNk[+FPjb
Eb0E4+=ANG$6UI4D/XQ=E-67F-UVomF)rIEAS,LoASu!hF!,+,DImisFCeuD+=A^NBk)5o$>"*c
/e&-s$?L'&F`_SFF<Dr0<C9,B;c>_"Eb/ltF*(u6ARloU:IH=9Bk)7!Df0!(Bk;?5+BosE+E(d5
-RT?1F)>i<FDuAE+>b3ZA0<6I%14Nn$4R>`ATW'6C2[X(Dfp)1AKWZ9$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WsDKBo.Chu*l3F<4&D..<rAn?%*C2[W<0ht%f+DkP)
BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6
-S[5-/i"P$+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1H
A79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2
Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%
C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16igA7At_05>E9
F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZ
F:ARlDe*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8A7KakAM.q>B+52_De*Bs@kVe3An5gi05>E9
E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2
C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A
%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg
05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskM
F!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]t
A0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA
@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2
C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTq
ARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V
78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;
DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=D
BOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm
+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k
+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,A
A7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-
DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V
78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5%,%15R#9LM<I
4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImis
CaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5
%17&bAn5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.
A7c8XE+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDB
A7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA
@:O(qE(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$7QDk;FO8J
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
3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hen5+>"^HATfF1$:[fb
6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P
6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A
%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl
:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A
@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BH
A1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$
ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_t
Bl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSf
F(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.
GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*
G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,
Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht
+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUr
F"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'
Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4
+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?
;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42
AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).
AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E9
05>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'
3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2
AM4K".1HW'Eb]?-A25l767sa,Eb]?-A0>qF/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is/g)_t
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>PW)2fE2J0fL4`A7T7^+F7X6Ch7Ys$;No?+>PW)3,`;K0ejeZA7T7^
+@/pn8P(m!+CoV3E,uHq:-pQU1,(CADe!lD1a$LMF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+DKKe>
C2[WnATf22De'u5FD5Q4+E1b0@;TRtATDi$$;No?+>PW*3Fl]20K(%oATr0/FED)3+D,P4+A*b:
/hf"&%13OO@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p
+DPh*+E_d?Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,
B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l\De*KfBkhQs?Tg"a-YdR1F*)>@AL@oo%15is/g+tK
@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KB6%s$CghC+
F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6
+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.BkhQs-Qm&5FE2UK4$"a2F!,(-EZf(.@j`B.$4R>;67sC"
F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARloU:IH=LDfTB0+DG^9DdmHm@rri0De!3lAISu7:IA,V
78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb:4@U=%16Ze@<6!&-[U;;
IXNRQ$7I91-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgD3%13OO:-pQUF(KG98l%htF`V,7+DYP6
F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKAE_BthF!,L7F(KG@
%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrGDe*g-C/o=dEbf63F!iCZGB.D>AKY`,@<?0*
-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<Dr':IH=EEc5](@rri7ATW'6-OgE%Eb]?-
A8Gt%ATD4$AMPu867sa,Eb]?-A8Gt%ATD4$AKZ%G/KeeHA8Gt%ATD4$AKYr4De`inF<GX9FEMOT
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq.*Gp"jr1,'.E
:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2B
AU#=F.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBj
F`MM6DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%JP+=CoBA8Gt%
ATD4$AL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-
I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX67sB.
BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgD1BkhQs-Qm&5FE2UK4$"a$B6#,/An*22
%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ftC2[X!Blmp,@<?''GAhM4F!,17+E(_(
ARfg)Ci<flCh4%_:-pQU6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%15is/g,4PDfp/@
F`\aFEZc`VISP??-OgDX67sBlEaa$#+=DMb:4@U=%15is/g)Pi@4*U@De*KfBkhQs?R[+1ATT%B
H[\_=I4#I2:-pQU.1HUn$;No?+EM+9+DPh*Ch\!&Eaa'$+E_a:EZf./H#k)[+ED%5F_Pl-F!+'t
Eb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)-OgD2FDj]G;cFl$+F?-l
/0HYiE+rft+>b3RATT%BC2[X!Blmp,@<?'\F(KB-AU/>E.3NhTBlmo/C2dU'BHS[O@rH6sBkK)A
F(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-YdR1Ch\!&Eaa'$+E2@>C1Ums+EM+9F`8];$@7#EC2[X"
@;0UdFCf\P1*n&;@;0U%8l%ht.!g2cC2[X"@;0U3FCf\G+DbJ.AU#>0Bl%?5+A,Et+EMIDEarZ'
Bla^j,p6]9D/aE7ARlp%AftM)DKTf*ATAo3AftT"@<6L$F"SS7BPDN1Anc'm%14C(@<6L$D.7<m
F!+(N6m,uU@<6L$F!+n/A0>H.E,Tf3FDl2F+DkP/ATDKnC^g^t+DG_8D]iI2F(oN)Ch4`1Dfp)1
AKYK$A7ZloDe!p,ASuTB%14Bj$7-g)Df'H-Ch[d"+EV:2F!,(/Ch4`0AT;j,Eb0;7E+EQs@<?(*
/0K1KCghEsGRY!+%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QD..3kBl7HmGT_<YH>7A/
D..-r%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14Bj
$7-g'Cij6/DIIX$G%GK8%14Bj$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='
+F8?[C2[X"@;0Tg$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!+<VeCF^])pFCf\>+F8?[C2[X"
@;0Tg$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?KF`_;8EdLDsBPnq\/g*Jh
CLqO7%16?^Bln0&HX(Z(G]\%LHR!ug,BdX=F(oQ1,CY(d+A,EtI3;I,F`Lu'+@C'XAUP!p%14C(
@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0
FD5W*+CQC5F_kUu$=%X`FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%16?]ATVa"DJ+')HX('!CisT4
F(K<2F_kW;HS@'0E--L;$=%[sDe!^%F_u"*$4R>ID..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/
$=%LeARfXpF_u"*$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8c?<FCf]F%13OO>]++sE+*Bj%16?S
DK'`?H[:!QDe(JBAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA92j2Eb-kFAU&V4$4R>IDIn$2
@:s-\$=%:_E-68LH?s=EA8PajAM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F`_>6/p(ZL
I16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X)Df9H5/p(ZLI16Mm$7/qpATr*%B4VMZ-!YA+ARfXp
F_u"*$7/qkDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgr
Df-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1
FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%13                                         ~>
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
zz=:zz,' CR ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKENS IFACEWORDS'
zz=:zz,'PFX IFACEWORDSjodliterate JLAUTHOR JLBUILDTEX JLCODEFILE JLDIRECTOR'
zz=:zz,'Y JLGRPLITTEX JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWTEX JLTITLEFILE JLTI'
zz=:zz,'TLETEX JODLiteratePreamble LATEXTMP LF MARKDOWNHEAD MARKDOWNTAIL MA'
zz=:zz,'RKDOWNTMP ROOTWORDSjodliterate THISPANDOC WHITESPACE WRAPLEAD WRAPL'
zz=:zz,'IMIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenstr'
zz=:zz,'s boxopen changestr ctl cutnestidx dbquote dbquoteuq decomm fboxnam'
zz=:zz,'e ferase fexist firstones formifacetex formtexindexes fsize gbodyla'
zz=:zz,'tex gheadlatex gpostlatex grouplatex grplit ifacesection ifacewords'
zz=:zz,' indexgrouptex jpathsep jtokenize latexfrmarkd markdfrghead markdfr'
zz=:zz,'gpost markdfrgroup markdfrwords markdj markgassign markgnonj read r'
zz=:zz,'trim sbtokens setifacelinks setifacetargs setjodliterate tlf toJ ts'
zz=:zz,'lash2 utf8 wfl winpathsep wrapvrblong writeas''),(<<;._1 '' jodstore '
zz=:zz,'CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK C'
zz=:zz,'NPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 '
zz=:zz,'ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR0'
zz=:zz,'62 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 E'
zz=:zz,'RR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR08'
zz=:zz,'2 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ER'
zz=:zz,'R092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101'
zz=:zz,' ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS INVMACROS INVS'
zz=:zz,'UITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 O'
zz=:zz,'K056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT '
zz=:zz,'READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwords'
zz=:zz,' backupdates badcn bchecknames bgetdicdoc bgetexplain bgetgstext bg'
zz=:zz,'etobjects bnlsearch bnums bpathsfx btextlit checkback checkntstamp '
zz=:zz,'checkopen checkpath checkput closedict createst defwords delstuff d'
zz=:zz,'elwordrefs didstats dnlsearch dupnames freedisk freedisklinux freed'
zz=:zz,'iskmac freediskwin fullmonty getdicdoc getdocument getexplain getgs'
zz=:zz,'text getntstamp getobjects getrefs gslistnl inputdict invappend inv'
zz=:zz,'delete invfetch invreplace islib iswriteable iswriteablelinux iswri'
zz=:zz,'teablewin jdatcreate jwordscreate loadalldirs loadallrefs loadwords'
zz=:zz,' mainddir mnlsearch newdparms newregdict nlctn nlpfx nlsfx nubnlctn'
zz=:zz,' nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc putexplain put'
zz=:zz,'gs putntstamp puttable puttexts putwords putwordxrs rpdtrim rplctab'
zz=:zz,'le rplcwords sortdnub splitbname''),<<;._1 '' sunmoon IFACEWORDSsunmo'
zz=:zz,'on NORISESET ROOTWORDSsunmoon arctan calmoons cos fromjulian moons '
zz=:zz,'round sin sunriseset0 sunriseset1 tabit tan today yeardates''       '
zz=:4214{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GU(0+>P&q+>Y`-3?U%2+>GQ+1,^77+>bc,1*ALu3A<4'De)U0/g)WYDe'u#/M/)^@;0U%8l%ht
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
Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sBoFEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=
De(L1$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB[84c`V5u'gD6QdKo+<W6YAp%p++E1b,A8bs#AU%crF`_&$Ch4`.@<?0*/Kf1WAKW@>@;]Uo
@j`C;DJXS@BkAK+DBO"6ASc0*E+*j%%15is/g+eIE,961+<VdL+<VdL+>"^Q@;BEsCghEsGT^U:
EZf"8Dfp"A.![6N$;No?+DGFr@qB^m@ruF'DBL&E/KebFFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9
F*)G:DJ'Cc:-pQUF(KH.De*ZuFCfK$FCcRH+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$;No?+<V+#
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*12gZE0JO"D:-pQU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0f!ZWF>,Kn.!R0`B6%s-BlkJ+EbBN3ASuT4@:Wn[A0>u4+EM[E
E,oN2F!,LADfd+DAU#>9G%G]<EbTW,Et&IO67sB812gZE0JjnbEc6)>+A#$g6Ub'P;FFGrEc6)>
DIIBn+D?%>ATDU$DJNfo%15is/g)l(De!lC2'?pNE,8rmARloF3ZrBMEcYr4B-;D4FD)dFG@kY?
+>"^L@;]UlATJu'@:UKq+Cf>#AISuA67sB812gZE0K:1`A7T7^+D#S6DfQt6@;]UlBl7Q+/Kf(F
E,8rmARlo3GB.D>ALSaGBln#2.!K]GFCem%.1HVZ67sB812gZE0ejeZA867.FCeu*9OUn3=<MR'
ARTFbCh4_@+Cf(nDJ*[$B-;&0DJs-*DKKq/$;No?+>GWi@rsF\+CSekARlo3F(060CLqC).3L2b
F`V,+F_i14DfQt/DII@,H>.80+Cf>#AKZ)+G]XB%:-pQU0f!ZWF>5]s@:Wn[A0<:EEa`p1Eaij'
DJ(C@/KekJDJ()5Dfp)1AKYf'DIml3DJs_AGB.,2E+NPh$;No?+>GZ_ARdJU+CSekARlp*D]gHC
@:O(o.3M,pF@^O`+ED%4Df]W7DfU+4$;No?+>PWf@<jOc+CSeqF`VY9A0?)7Eb$;)DfT]'FD5Z2
+=MGGCagK=DfQsm+?;&.0b"Ib67sB90Pt6D0K:1tE+EC!ARloqDfQt1F`MM6DKI!LE+*WpDdt4=
G%G]8Bl@m1%13OO@rGjn@<6K4+=CT4De*ZuFCfK$FCcg/$=e!gDKBB0F<DrFC2[W1%13OO:-pQ_
A7]^kDId<rFE7lu:-pQUA7]7e@<,pi+D5M/@UX'qBOu3q+EVNE@<QR'A0>B#DJ"$4Bl7Q+9OUn3
=<MKiD.Rc2GA2/4+A*bo@;TRs%15is/g)Pl.6T^78k`2U<(o_[79C[)9M\\\79<GW=<L406<-TN
6rZTW+A,<t;G^%Y<)c:g+A,Et9PJT[Eaa'$:i^,UD.7<m%13OO:-pQU;K$2ZEZdnqBd[sEGAhM4
+D,P4D..O#Df-\=FCB9&+DkOsBPD?q+>"^WBl.R#Bjl$)FDi9`3ZqmSF:ARP67sC"@<-F#F!,R9
G]Y'PBln#29La(S+ED%8@;0V#+EqL5FCfN4@:Njk@;]TuBOPdhCh7Z1DfB9*+E;OBFCfMG%15is
/e&._67sC(ATD6gFD5SQ+Du+>AKYMtAnGUpASu!h%15is/e&._67sB'+<Yl?CaU_d+DEGN1,C%1
/0H;f:JaJT+Al-7<(//D$;No?+<VdL4$"`>0-Fs]+>P_q2(Tjt-VmQ-:*<D6:K0b1%13OO:-pQU
BPD!g+EM%5BlJ/:Ci<flCi^^B-n6Z//g,"CC`me2C`j/oD.[TI/g)o,2C't!+<VdL+<VdL+<VdL
+<VdL+<VdL+<Ve%67sB_+E)@8ATA4eD.[TI/g)kk+=K6$@4l7H-Qjcc+<VdL+<VdL+FS*=C`jiq
67sBZ+EqL5FCfN4@:Njk.!'?9@q?ckDIal'DfTQ<Df0Z*C`mh.@OV`nD.[TI/g)nl+=Jch@4l7H
-UD/g.4[&c/i#=6+FS*=C`jiq67sBH+@.S_+CQjJ+D#e-Cis9&DJ((e+@6MED.[TI/g)qm+=LYN
BeCc.-Rg/\+<VdL+<VdL+FS*=C`jiq67sBU+EV:.+DbV2FCfJ8:(7PIAo'U_+>b2`-t+`B/git5
.3K`U+<VdL+<VdLI;NS4+<XEG/g*J'FD,5.Ch7^1ATAn[%16raCcsBn2'="i@4l7H-SR811GgsI
2`Ng)-Rg0dD.[T,+AP6U+?:QTBkM.%F!+n/A0>4g$>jBk4Y@j8+<W(@/nlpc/gi(j+<VdL+<VdL
+<Z)LAo&S4:-pQU6m+)k$>jBk4Y@j9+<W(@/nlpc3[Z@!+<VdL+<VdL+<Z)LAo&S4:-pQU6QeE!
$>jBk4Y@j:+<W(@/nlpc-RU8j+<VdL+<VdL+<Z)LAo&S4:-pQU;'9k$DffP"$>jBk4Y@j;+<W'e
1FXFh+<VdL+<VdL+<VdL+<Z)LAo&S4:-pQU6W+@#D.[TI/g)l&+=Jru.3K`U+<VdL+<VdL+<VdL
+FS*=C`jiq67sBS7L]\6$?Kfq4Y@ja10n-/0d(ls+tbr0?SW`P0H`D!0I[G<-QlM6+<VdL;]m2*
+@.+m+<XE%+<Vdn+<VdL3?TFe+@I=p+<X#o+<Ve(+<VdL6W,$L+<Ve#7N`g$>qc]p+>Fun+<WBo
+>Fu]1*A:o+>Y,p+<WE^0d%Ss+>Fu]0d&1n+>Fun+<WTc0d%Sn0H`(m+<WB]0d%S]:-pQU0H_KP
DJ=3,@;HA[+>Fuo+<WBo+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&.m+>Fum+<WTc1*@\o0H`+n
+<WB]1*@\^:-pQU0d%TWFD,6+%1444+>P&^0esk,+<WE^0H_Jn+>=o\1*A7n+>P&n+<WB]0H_Jm
+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)nl+CT)*05boL%1444+>P&^0esk,+<WE^0H_Jn+>=o\
1a"Ip+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)qm+AN@Q+>Fuo+<WBo+>P&^
1*A7n+>P&n+<WE^0H_Jn+>=o\2'=Rq+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU1a!o964F8E
3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm+>=o\0d&.m+?:Pu+<WBm+>P&^+>Fuo+<Ve%
67sB<+<XEG/e&.10d&:q+>GYp0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jr+>=o\0d&.m+?(E"+<WBm
+>P&^+>Fuo+<Ve%67sB=+<YQED%-gp2]sds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\
2]sds+?1Jt+<WBm+>P&^+>Fuo+<Ve%67sB>+<W$@$6V&G1*@\o0d&4o+>P&p+<WH_1*@\p+>P&^
2BXat+>Fuo+<WB]1*@\u+>=o\0ea_*+<Vd]+>P&^+AP6U+?1Jd-RT?1+?:Pu+<Vde+>=o\3?U!u
+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm0H`+n+<WB]1*@\^:-pQU3?TGSDf'?&DKH<p
+>Fuo+<WBn+>P&^1*A=p+>b2r+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc1*@\o0H`+n+>GSn0H_J\
:-pQU0ea_;;@NsU0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb1*@\o+>P&^0d&4o+?(Du+<WBm
+>P&^+>Fuo+<Ve%67sB80d&h]9L]Hu+>Fuo+<WBo+>=o\1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o
+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0eskmE+*6f%1444+>P&^0f'q++<WE^1*@\q+>P&^
1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l)+EML1@q?ckAoqU)+Du==
%14Nn$4R>;67sC)DfTA2AoD^,@<?4%DBNP0EZf14DImku$?p)u4ZX]60KX>fCccKGCagJR+?MUn
$4R>79LMHM771$M;HZ.D+=ANG$;No?.V3L.A7]^kDId<rFE7lu%13OO:-pQq4FVa.INWt[/o4s<
AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0rA0>,o@;BFrBln0&%15^$
<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;FD,T5+CT.u+EV=>Ch4%_>[_bsBQ%p<INs;MF`_;8
Edf6^I16NgFD5i5AU@[(AU&<=FF/H]IV3\>F`;dSIXN>/Ec6)>I16N4%13OO:-pQUB6%p5E$0(B
ATDs.ATo81ART+\EX`@J9M\\\79<GW=?S\f0H`D!0F\@8+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.
ATnRj>]XIdFD5Z2HX(Z(G]\%LH[[2gB6%p5E.0$\I3;=/ATDs.ATrP3$7QDk%15is/g+t=FCf\>
B6%p5E$/V4Bl%<&F(96)E-*33$;*uY<CokP<(0nP3Zp+!3Zp*c$?B]p+EM+6F_,H#AKYo'+DbJ.
AU#>-Df'?"DIdf2FD,*)+D58'ATD4$AKXf;7L]]FASiPuF)uJ@ATJu(Df'?"DIdf2@<,p%Df-\>
BOr<1DfTW-DJ()2@<?/l$>ainCghEsGT\,X,CX9GDfp#J,CU(/D..3kBl7HmGT_G[IV3\>F`;dS
ILQX#F^])pFCf\>+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>INs:N$7QDk%15is/g+eI
Dfp"AEc5l<+EV1>+>"^GDesQ5DK?q;@<iu5AS#Bp@:X+qF*),6B+52?9LhuW9M&2_79D]6+>=p!
+>=63,p5ojBl5&.De*ZuFCfK$FCcRCB6%s-BlkdHCghEsGT^U4Ch54A-tdR>Ch[u?+D58'ATD4$
ATJt<B6%p5E$>_u,p7)6D.R6#G%G]8Bl@m1+E(j7FD,B0+D,>(AKYT'EZeq%@qZuW:IH=<Ec6)>
+DGp?E,ol,ATMp(F"Rn/%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%:_E-68L
INs;SEc6)>INs;`Bln0&/p(ZLI16NgD..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$4R>IDIn$2
@:s-\$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/
A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&
BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIW'CD
ATobKAU&V4$4R>IDIn$2@:s-\$7/qqDIm<rCisT4%16?SDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZL
I16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'
DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%14Nn$4R>;
67sBt@;0U%C2[X!Blmp,@<?''9OUn3=<MR'ARTFbCh4%_8l%iKBlmp,@<?'WEb/Zr@VfU=3Zp+!
3Zp*c$7-g0De*ZuFCfK$FCcS2@<?(*+E2@4@;TIiAM,)7$7-f($7-foBPDN1Anc'm+DGm>@3B5t
B4u+,+CfP8FDl#1H=^V0G%G]8Bl@l3De:,6BOr<*Eb/Zr@VfTb$7-g3@<?($Bjkg#B4YslEaa'$
A0>?,+E1b,A8bs*F!*&U+E)4@Bl@l3GA(Q*+E2@>A9DBrDJ(($$7-fIFCf\>Dfp/@F`]5YE+*Wp
Ddso'BkM*qBkM+$Bl7Q+BlbD8G%G]7Bk1acDBNA*A.8kl+EV:.+EMX5DId0rA0>T(A7^!.BlbD;
ARo@aBl7Km/g(T1%16?NDe!p,ASuU"CghC+>;7mPFBs6%Ecc#*Ch8#($4R>IF`V,5@:O(]B4Y:`
@;]Us@ps=f?$g3qDf''-Ed<'B$=%^pAT2'fCLLje>A.SVA8,poF'X-)F_kl5@:s/"%16?_F(K<!
@r#LcAUA61De*F"DLDs$>]k+!E+*6l@:s.u@;U(,H#7"A@;U(&@<?12%16?_F(K<!@r#LcAUA-'
G\(u.GV!Q@Cis0.AU&V4$4R=g+E2@>G%kJuF!+_0AU&<<F^fE%EbTK7%16?_F(K<!@r#LcAUA$'
G\hJH11bkV%13OO,p7>OAKYi(@rcL0H#R=;BkAJrG%#*$@:F%a%16?3Ak$KNAOUiXF*)JMD/!L#
Dfg8DAM/%GH$t$EF`V,5@:O(]B4ZF,Bk)1%FEqh:I=6Hj%16?SAo;a.+>@&7Ap@m/AU#=P>\7\T
BkD1(@<?(*+>I,5Bg"-m,p6o6+E1k'FCf\+$6UHrF`V,5@:O(]B4Y:iFCmL<HYIA:F`_24@sndn
>\._mAKW9ABkAK(F^]B'GT^pF+F%I6@<?(*%144#>]k+!E+*6l@:s.uAoDR/F)Y]#I16N++C&Vm
G\(u.GRY!&+<Ve3F`V,5@:O(]B4ZF7CijoDEa^MDF`(o'De*F-%144#>\7[Z$6UHrA7]@]F_l/3
Df0Z/ART\'Eb0<=9jr![Bl7QHFCf\KFCf]=/5p%eCh5b(@<?!m9Q,,dEarO!AUP!p+<VsQEb03+
@:Njk79*5]<C7mQBln#2F`(o'De*E%AT`$3+Cf(nEa`I"ATAn&$6UH;+DGF1H#IgJDImBi+EV:2
F!+t+@<,ddFCfJ8/Kf.KAKYr4ATMF#@q?d$Ado(i+=/.PBPDN1F(oN)Ch4`!BOPpi@ru:&+DG^9
FD,5.E,oMuD.7<m+D,P4@qB^(F`V+:De:,:ASbdsAU#aKCis0&@<?'k%144#-!Y>!G@PQ.D..<m
HX(-)Ec6AQ79*5]<C;0W+<V+#+<VsQ@ps6tF(KG9DffZ(EZf4;DJsT8@:NjkAoDR/F!,1/+EV:.
GpdWD+CTG%Bl%3eCh4%_+<VsQ8K`%^FD,6++Dbb-AKXoiF`Lu'+@C'XAKXfiD]j+4ANC8-+<VsQ
BQS?83\N-qCi<s-/n&:/@V%0%Df%.LH#R5/DeF*!E+jMM1,(F<0/,C>F)Q2A@q@6%De*E2E,okL
BQS*-%144#-!YM&FDYr6De<p*FF-JtAS"SSDJsq4$6UH;>]XIuD/X<1AoDR/HW+j*EarZ'6Z6LH
+Ad)sI16NgAn_\]%14C(;IsBMAnc-o+DbIqAScR)A9;K-AoD]4Ch[s4F#tL_FD,6+GA2,0/0K%J
AKYQ%F_t]1@<?''E+*6l@:s-oGA1l0+Cei&F(Gdf,p7&5Ebf6,F!,RC+D#e>ASu$$@V'h'DIal3
BOr<&AS-$,D..HtBl5O4$=%FVCLpprCh7^1ATD$AF@'POBl6=W@s)X"DKL4O%144#>]OCnATqX&
D/E^!A:%QHCh[s4BmgEt+<VdLHX(W'FDPN+B67g6>\mhXAScR)A9;L5HSf;NI=2P3I9^VtCLppr
DffZ(EX`@\F`V,5@:O(]B4ZF$DKTf-Eaa'$I16Mm$7-g(F_PZ&+CoD#F_t]-F<G:8A7]up$=%^p
AT2'fCLLjeHYm2,ASG\"I16Mm$7-g)Des?4Et&I]F`V,5@:O(]B4ZF"Des?4I16NgA7]@eDIm<r
Ci=?@F(eumARfXpDfU8Q;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/Df0Z;DepP;FE2M6FEMV8F!(o!
>\%DXBl7KlDes?4HY[2<G@PQ-DfU8QEbAj0HS@',1Ft441-$m>/i>G5%14C(C*7)4E,95uBlkJ+
EbBN3ASuU2+F##S+Di6=+E\fM%16?NAS,XoARfXpDfU28@<>pfDes?4I=$!I@XWSW/ho.50J5+@
/2/\61OT]>,p6qFDKTf*ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJC^g_VA7]@eDIm<rCi=?@A7]7o
@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdM8(F(K6!Des?4I=$!I@XWSW
/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HY.)4@<?!tCi=?BHZEb.I=!Y#0JG%3/het10J5=>
I16N0+DN$8De!3l+CT>4BkM=#ASuU2%16?NAS,XoARfXpDfU27BOPpkDes?4I=$!I@XWSW/i,45
0J57;/2/\1149T=>\%DXBl7KlDes?4HZO:LBl7QnDes?4I=$!I@XWSW/i,450J57;/2/\1149T=
>\%DXBl7KlDes?4HXgu2D.RU,@rH1%Ed`:TB4?:90J54@/2/\42(UF60JRtb$7-g6EbTB)FD5o0
+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4HZ+">ATD:!Ci=?BHZEb.I=!Y#
2)[!>/i,@90J5%6I39XT%16?NAS,XoARfXpDfU2CFD,6+@rH1%Ed`:47m_WN0J"n/1,Uq;%14C(
B5DKq@;I&pF)u&.DJ`s&FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0Ci=?BHZEb.I=!Y#3A`9@/ho78
0J5(<I16N0+E2@8D/"*+G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBnEt&I]A7]@eDIm<rCi=?@Ap&!$
@rH1%Ed`:TB4?:90J5%5/2/\10J"n10JInt+<VdL%13OO>]k+!E+*6l@:s.uAmoReH$44;I16Ng
6tKtEDIla[DfTr#ATD6a@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH%16?.AS,XoAQEA_@UX@mD+/>c
Bl\-0D.RU,HUqj`BP_BqBQRs+B75,-ATD6gFD5T?HXgu2D..<m@q]:kF$3c5>^K_(I16N0+@0OK
+=A^PDf0Z<BmO>R>]XajChtIAAoD]4D/XH++Cf(nEa`I"ATDi7E+O&4Ch[cu%13OO,p7/8DIdZq
+D58'ATD4$ARlp)H#@_4GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>D.Rbt$7-g'Eb-A*Bm=3"+DG^9
B4YslEaa'$A0>B#A7ZlmF`\a:AS,XoBln'-DK?q;@<it)$7-g(AKZ&*F<G[D+CT/5+Eh10Bk/?.
AU&;>AoD^,@<?U*DJ()%Df'?"DIa1`>]k+!E+*6l@:s.uAo_<sARp2u$=%I[G@bZ8Bl\-0D.RU,
HW+TdA7];"H[U6h%16?XATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,Des?4HY[2<G@PQ-
DfU8Q>]aP%FCJj/HQt7nI=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4+B*3$EarZ'6Z6LH+Ad)s%14Cd
DIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BH[?tlI=6MQ$=%I[
G@PQ.D..<mHX&sIFCA-oE+N!eCOKDA?$fguAU&<,Des?4HXpQ,@:O4lDfU8QHQt7nI=2P3-!Y>!
G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmnDes?4I=$;c0n"Iu%16?XATqX&
D/E^!A:%QLARebLCfG=gI9SF3H[?tlI=34I$=%I[G@PQ.D..<mHX&mGF(J*GDejc*0jT-2FCf]=
@rH1%EdM8(F(K6!Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QNCi<a(<,ZQ#>;9E1>]aP%FCT6*
DfU2:Ci<a(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6YKnK<,ZQ#>;9E1>]aP%FCT6*DfU27
BOPpkDes?4I=#4@AU&<+Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!;fm%oDJ)peCOKDA?$fguAU&<,
Des?4HZO:LBl7QnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QKDf'?&DKJirCOKDA?$fguAU&<,
Des?4HXgu2D.RU,@rH1%Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s@rH4$@;]V&>YfHTATCagCOKDA
?$fguAU&<,Des?4HZ+">ATD:!Ci=?BH[?tlI=6Md%16?XATqX&D/E^!A:%QICh7X/<,ZQ#>;9E1
>]aP%FCT6*DfU25Ch7X/@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3-!Y>!G@PQ.D..<mHX'$_DI[d&
Df/NmCOKDA?$fguAU&<,Des?4HY.D<@q0FnDfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XijR@ruF'
DH(OiI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>Z,-GBl@l`@<--pE`?smI9SF3H[?tlI=2P3>]++s
@rH4$@;]V&>X`[RDfSfqCOKDA?$fguAU&<+Ap\kL0n"Iu%16?XATqX&D/E^!A:%QVDfT]'CfG=g
I9SF3H[?tlI=2P3%14C(8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;Df'?"DIdf2AoD]4E,Tf>+E2@>
@qB_&Bl7Q+E+*WpDdso&ASu("@<?'k+DbJ.AU"Xk>]++sASu[*Ec5i4ASuU:8l%iFEc6)>87c4?
ATE3GI=$AO$=%I[G@bZ8Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2Ed`:_H[Q>1%16?_F(K<!@r#Lc
AUA#tDI[s*A9*)-$=%OYB4Z.+H#.&=AmoReH$p,/%16?SAp@m/AU"Xk+<Xp3F(K<!@r#LcAQs4e
FDtZ$ATMR3ANaX6Cia/=+=/.L@:s-oF(or3+Co%qBl7Km+C]U=G\(u.GRY!&+<VdL+<VdL+<VdL
+E_R9@rGmh4_A,=F(HmF+<VdL,p7>JBk)'lAKYH&ART@q+EqL1DBO(CARlp-Bln#2G\(u.GRY!&
+<VdL+<VdL+<VdL+F%I>AU%L-BR+Q.EcP`'I16NgAScF!%144#>]k+!E+*6l@:s.UF`(o'De*EB
FE2M8?$g71E+O'1AS-?"$=%1W%13OO>\JD%ATDj'FEMPL@WH$gCM[^&CNDX\EckqE%144#+<VdL
+<VdL+<Y-3Dej2uEbf_ZFE2M8/.Dq/+<VdL+<VdL+<VeGA7f7mFD,T54aVT.%144#+<VdL+<VdL
+<YW6Aoqa/Ch5bVI4Pg7+<VdL+<VdL+<VdL@rH1%EboH-CNDX\EckqE%144#+<VdL+<VdL+<YfI
Ch%C"DfS!MCis;?%144#+<VdL+<VdL+<YK7DJNa#Ci=>WD..'gDKK;<%144#+<VdL+<VdL+<YW6
An#\!A7]dEHS?Qr+>A4l%16?]ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16NgF(KH0ASu.&BR=!'
@<-F)BlJKI2K3a\E,9Z<+>RnX+Dkh1F`SZ[E--L;$=%X`FDPN+B67g6>\.b`EbAs$@sN-;Eb0?&
BRP4`ASli<+=/.LEb0E*DKI">G%G]+F_kk:Ch[cuEt&I]F(KH'Dfor>ATE-=ARfV#D.I3sFD-)L
0RXB;%14C(Eb0<'F<GC.FCf\>Bl7HmGT_*H+E_a:+D,P7EZek1CisT4F!*%WA7]@]F_l.BBlbD=
GAdot,p7DFBk(g!Eb0<7Cij_@Bl5&0Dfg%CDe:,9@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3lF(8Wt
AIStm+AP^3762Q"A867.F<G:0+DG_(AU#>8@;TRs+EDUB+EVO7ATVTsEZbeu,p6f?Df%NXBQS?8
3\N.1GBYZU@<?(*/Rr^9D09`1FEoKWEb@%KBk;L1DfBE#/oYKC5A!&8-?MC*2`!<#$=%^pAT2'f
CLLjeHYmnAFD56'Cjca">]!nbART[sATW$*EX`@\Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7HmG^U#.
+<Z#9BkBVPGAgu0CisT4%144#+<VdL>X3=@F*)><ARfXpAmoLsAISth+<Xp#Cia.s$6UH6+<Ve3
5]UFWFDl&.@rH1*Eckq&$6UH6>\7[Z$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZE--L;
$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h2/mYc%144#+C&AeB5)71D09Z:Bk)'tF+&BlI9Trt
ARfgrDf.%O>\S(dAU&*$D.S-$%144#+C&blEbf-&FD-#+9jqgK<H)ngEarO!AR&qeA7^"'@;TS(
,n12(+<VdL+<VdL+<VeR>YSXBAQ<\gATD9hF(JTjDId='DIIBnI3f=0+<Ve3FD,B0E+*BjF*)\D
AUAB4@;0V-%144#+C&u!FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%144#+C&u!FDPN+B67g6>]=+l
F),K/I=!YeF<GO=F`SZZ/i.HgI16N++<Xp0ASbe"%144#+C&_oFBiO%ASk[;Bk2I&FCf<;,n12(
+F@@)DIe*2F_l/6@rH1)I9^Ju5]UFWFDl&.@rH0gDf0,rDesQ5DHpahF(JTdCh7$qE+*Bj>\7\u
%16?W@;BF_FDl87ATA4e%16?W@;BFgDId='%13OO>[h8WBl89.De!p,ASuU<%13OO.1HVZ67tGc
IXZ`pC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1
+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhK
ASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4r
F)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@
@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\3XlEk67sB'+C\hoARfLn@;TRs+<Y0-
ARfLs+C\bhCNXS=DIIBn+E1b2FCfK1F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0qBk([l@ium:B4Z0-@UWb^F`8IHATDj+Df0V=De:,6
BOr;sBk)7!Df0!(Gp$X9@s)X"DKI!D+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
+C\tpFCf]9Cgh$q+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%
DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0tF*(u<F<D\KB4Z0-@UWb^
F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcW?G+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)8Z@V97oDdmHm@ruc7+D58-+E(_(ARfh'+D,Y4D'3:r@r$4+F!)SJ+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C]5)F(Jd#
@qZu-+<Y`:@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)@r$4++DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!
BOPpi@ru:&+Dbb5F<GO2FED)7DK?6o:-pQU+<Y-2F_u1B+<VdL+<VeIATW'8DK?qCDJ=*5AKYGj
@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9@UWb^F`8I@F_tT!EcW?G+<VdL+<VdL+<Vd9
$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z
@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is
/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.
@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-h
FCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%q
Bl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94
+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*
@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(
ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-
DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+
$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-
E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8
AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is
/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@
DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+
Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'
+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$
AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,Oq
Bl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q
+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22
+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3
@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=
.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(
ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdL
F*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!
%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO9
0f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$i
DKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQU
Anc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U
+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQU
Anc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cp
FDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht
6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.I
E+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:
+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5
+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2
+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#
C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a
%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(
D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-
DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2
%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h
<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/
$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%
8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a
6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7O>$;No?+DtV)AM.jCDfQt<@;TR.
DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<-S?bh%13OO:-pQUFE2)4+ED1/BQP@FFE1f(
Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY/g+@Z
+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0F<G%$@r$4++DtV)AKYr#FED)7DBNG*%17/q
Ch\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#<$l$cFCfK6FE/f>$4R>;67sa!DId9hE+Not
ASuU2F*2A;Df9Mg67sa/F`)&7Df-\=/M/)TDf'H9FCfM9F*2@CEbTT+06:]H+EV=7ATJu&DIal%
F_kk:DIn#7D/X?1+Cno&ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g+kGFCfK)@:Njk
GAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Kc/Y+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+CehrD/X?1F!)SJ+>"^G@;KLmA79L$A79RkF!,C5+Dtb7+CT.u+D,b4C`mS5
Df0V*$;No?+<YN>Df0V=+<VdL+<W6YFD5T'F!,C5+Dtb7+CT.u+D,b4C`mS5Df0V=AoD]4DBNFt
Ch7Kp@<*K9ARTV#%15is/g)9XF`)56F(KE(F>+gh+Cf>,E-686F!,OHDBNt6F(HJ&DIal2ATT&:
Bl.F&+>"^WARuusEc6)>+CoD#F_t]-FCB9*Df-!k:-pQU+EM[CEbTT+F(KGJ+>"^GDf'H9FCfM9
F*2@CEbTT++CT.u+EM+9+EV=7ATJtG+EM+*+D5_5F`8I6De!p,ASuTuFD5Z2+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN//M/)S@;BFp
C1K=b5\FqBBl#D3Df$U>%15is/g+YEART[lA3(hg0JP7nAR[AL%15is/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P++:SZQ67sB90JP7nAR[AL+EM[CD/X?1+D5_5F`8I5Df0`0Ecbl'+EVNE@r,RpEt&IO67sB9
0JP>$@rsC\+CoD#F_t]-FCB9*Df-\+A867.FCeu*AoD]4-u*[2Ch\!&Eaa'$.1HUn$=e!aCghC+
+=D5QDJa<1DC6P9$3                                                         ~>
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
1E\P#-p0UR/mg=U-Qk`E7nHHI:..NQ+@T$n8PVZB=<L(!91;fU91;TS+A#$g6Ub'P;FFGuDe*Zu
FCfK$FCcRdH:gt$Bl8$(Eb8`iAKXQj8l%isDf9H5+A$lO:IK>IBl8$(Eb8`iAKXT=6<-TN6rZTW
+A,='<_5_];cQ:V8Q[*-9M\\\79<GW=<L436rZrX9N+td6m,)t6rm#M+Au!2<*)jn6rRi=A8Gt%
ATD4$AKXrC8Q/GO:..lF+BMH,:eX;D6m,Q/5u:BU77KjN+BMH,:f(%Y7S-]]79C[@A7TLp@:XFh
EbTK70d("9EHQ2AAT_u8AoD^,FCf]2DId='ATJu,Ec6)>CghEsGT^X>E,961+DbJ.AU%g-D..I#
A0>_tEbf;rF)u&.DBO"3FCKB,Ch.'jEcW@EATVWu@:NkbBl7^-+EM+9C2[X!Blmp,@<?''F`:l"
FCf3*A7TCqFE2))F`_>9DBO.D@;pC1@Vft#B.#,Z-p0%C-YdR1Ch\!&Eaa'$;f-GgAM>ec.4cl0
4?G0&0d%hdC2[W*C2[X!Blmp,@<?''C2[X(FDl22+EM[CD/X?1-RgSp4>8$7.4cl04?G0&0d%hd
8l%iA<CokP84c`Z:Jt=<8l%iMDffQ3?Ys<r8l%iS:JXY_6<-TN6qBmJ<)6Cp+AY[!8l%iMDffQ3
+Abj4<*sBYA8Gt%ATD4$AKXrJ6r./^:IJQ,A0=iI6r.0)De*ZuFCfK$FCefrA0>?(Bl%<pDe*Qs
F!+q7Bl%<pDe*ZmFCf\>@WcC$A86$nCh\!&Eaa'$CghEsGT^L4ARTIuAU%Qk@<<W*BleB7Ed;D<
A0>Q"F*)>@H"q8.A8bs#C2[X!Blmp,@<?'\F(KB-AU/>>C2[X!Blmp,@<?'fDg#i+G@,H'GT^a>
A8Gt%ATD4$AT)a+ATqL'AU#>4De*p-F`Lu'F(KH9E$0"+DJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUg
F_t]-F<GF/DJ<]oF*)/8A92[3EarZ'E,o].De'u0Eb]?-A8Gt%ATD4$AKZ;FH>7A/D..-r?Z]k(
-RgSp4>J$73@$@61,(C>0K:[B2*!EI2).*N+>PW+0JG@<3%d'G3AWKI1b^j21,(I;0JtOD/i>UB
2E!KM1,pC30JY=92)-s@2E3TR3&ioU3$9t10f^sD0f1L>3&roQ1G^gB+>PW*3AE9D1bLUE3B&]L
1G^d/1,(FC0etI?/i5OJ2_m0F1GU(.0JY=92)-g<2)R3L3&rcO1*A>+1,(C>0f(F<2_[!B1,q'K
+>PW+0JG@=1G1L<0fC^A0ebC+1,(FC0etI?/i5OJ2_mBJ1,0n,0JPRB1,1U<1cRKS1,CgK1a"P-
1,(C>0K:[C2_d'G3&N]=1,(I;0JtOE/i>RA0eb@?1,L+/0JY=92)-j=1Gq0M1Gh!E3$9t11,(C>
0KCaC3Ar`K0ekF>+>PW+0JG@<3A*-D3A`TJ2*!Q;1,(I;0JtR=/i5@B3B8iK1cZ[60JY=92)%!B
2)@3I3A`ED2BXb/1,(C>0K:[C1c-mE2`ENI+>PW+0JG@=1+k@@2)mBM2`!?71,(I;0JtR>/i>I?
3&`TQ0Jjn-0JY=92)%!B2)I'H2Dd0I+>PW+0JG@<3%d'J0JtXG1bgg01,(I;0JP=</iPUD2D[0E
0d&5*1,(C>0ek:<1bpgH3&*EM+>PW+0JG@=1bLX>0K(mM0f1g31,(I;0JP:B/i5:C3&<BJ0KC72
0JY=92)%$C1bgsE2`E]P2BXb/1,(C>0K:[C1GC^A3AN?H+>PW+0JG@<3%d*F0K(jI2E<Z<1,(I;
0JtOD/iGI@3B9&Z3&)O20JY=92)-s@2E3TR3&ioU3$9t11,(C>0f:RA3B&oT0fV'I+>PW+0JG@=
2(gdI2`NZL3&WQ81,(I;0JtRB/iG^K3&NEM2DZI20JY=92)-g<2)R3L3&rcO1*A>+1,(C>0f(F<
2_[!B1,q'K+>PW+0JG@=1G1L<0fC^A0ebC+1,(I;0JtRB/iG^K3&WHI1,g=20JY=92)-s@2E<]U
2)6pC2'=Y.1,(C>0K:[C2_d'G3&N]=1,(I;0JtOE/i>RA0eb@?1,L+/0JY=92)-j=1H76H2_m0D
2'=Y.1,(C>0KCaC3Ar`K0ekF>+>PW+0JG@<3A*3G3AENM2`<E61,(I;0JtR=/i5@B3B8iK1cZ[6
0JY=92)%!B2)@3I3A`ED2BXb/1,(C>0K:[C1c-mE2`ENI+>PW+0JG@=1+k@B0f1mI2)-s21,(I;
0JtRA/i5RD3B/oU0f'q-0JY=92)%$C2)d3I2`*HN3$9t11,(C>0K:[B3&`ZK1H.!C+>PW+0JG4:
1bLaB3&W]R0fUm11,(I;0JtR>/i>I@1-%<K3A_j60JY=92)-p?2)$jD1H7?N1a"P-1,(C:0f^jC
1,:R?2E3KQ+>PW+0JG@<3A*-C3&<6F2)RBC/1<V90JY=92).!A1c$gB0fM!K0e4q10JGI@0K1mG
3B/iU0fV$N1c%$>BeD.`0e"Y%4>J$9,Vh&/0JG7:0ePF?0ebRD0eje+0JY=92).!A1c7!C2)7$I
3?U(20f^sD0fCXA1c.-L1,:g31,(I;0JtRA/i5LE2)@'E3A_j60JY=91,1L93&*-A3&E?E+>PW+
0JG@=2D-gD0etUA2)[H;1,(FC0etIA/i>IB2`<EH3$9t11,(C>0f1L>2`3HK1bq'J.4cl00I/>$
/1<V9+>P_u1,(FC0etI?/i5OJ2_mBJ1,0n,0JY=91,1I81H7BQ1,^pG1a"P-0f^sD0f1L>3&roR
0JG7<+>PW+0JG7:0J5.>2E!EK0f(a21,(I;0JtRC/i5I?3AN9K1H-F30JY=92)-d;1c[KQ2`<TT
1E\G,1,(C>0eb4;1GCL:3&ENJ+>PW+0JG4:1bLaC0JYUC2)6s11,(I;0JtR?/i,LE2)$mF2E2g7
0JY=92)-g<2DHm@1c.$G2BXb/1,(C>0f(F=3&*6L2)R0E+>PW+0JG:<3%d$D1,1I>1c@<91,(I;
0JbID/i5@B2D[0K1,C%.0JY=92).!A1b^jE3AE<I1a"P-1,(C>0f(F<2E<NM1b^jG+>PW+0JG@<
3A*3L0JkaI2`W`<1,(I;0JtRB/i>OE2).*N0f'q-0JPRB1,1U<1cRKS1,CdB3$9t10f^sD0f1L>
3&roQ1H%6M+>PW*3AE9D1bLUE3B&]L2).'51,(I;0JtRC/i,IG2_mBQ3A_j60JY=92).!A1H@-G
2_d-G2]sk01,(C>0KCaD0ekOG3&rZI+>PW+0JG@=2(gdI2`N]L0K1+00JY=91,1I81H@?L2`<EN
2BXb/1,(C>0f:RA3B&oU0f(XC+>PW+0JG7:0J5.?0JYUG0ekC*1,(I;0JtRC/i5I?3AN9K1H-F3
0JY=92)-d;1c[NS0K(pM3$9t11,(C>0eb4;1GpsJ1GgmH+>PW+0JG4:1bLaC0JYUC2)6s11,(I;
0JtR@/i5RE3AEHQ1,g=20JY=92)-m>1cRKT2`!0K1E\G,1,(C>0f(F=3&*6L2)R0E+>PW+0JG@=
2(gdH0fUmA2*!B61,(I;0JbID/i5@B2D[0K1,C%.0JY=92).!A1bgmF1c.3Q3$9t11,(C>0f:RA
3AWHK2D[<O+>PW+0JG@=0J57@2`!BJ2E!941,(I;0JtRB/i>OE2).*N0f'q-0JY=92)-s@2E<]U
2)6jB3?U(21,(C>0f:RA3B&oT1,(OF+>PW+0JG@=2(gdI2`NZM0Jkd41,(I;0JtRC/i,IG2_mBQ
3A_j60JY=92).!A1bg[>0fCpJ2]sk01,(C>0KCaD1,h0H1GUgB.4cl00I\P$4>838-p014/1<V7
.4dS8                                                                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
