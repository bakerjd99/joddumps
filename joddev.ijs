NB. JOD dictionary dump: 15 May 2020 16:45:37
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
1,(F*1,'h,+>G_r1*AJ40Jst-0d&4o2_[!01,'h++>u,32BX_/+>P&t0JPF-0fC.0+>Yl/+>GSn
1*A;+1Gp:03?U("0f:jG+>GSn1*A>01H?R41E\Fq0fLsD+>PYo1*A;,2_lL11*A=p0f_*60ea_*
+>PW11c-=01E\Fq1GgsH+>PYo1*AJ13&i$90H`+n2D?g@+>G\q1*AA10Jjn,0d&4o0f1dC+>Gl!
1*AS;0H`)/+>P&o1H%$30f1".+>GT.2bHk66<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ
0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A
+>>Vp6#^ie1,(FC+>Gl;0JbaD3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc81b^sI2@9cu:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>Pku6$6f_1,(FC+>GT30JGOD
0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku
6$6f_1,(FC+>GT31GLpH3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!
E]P<u2'=#0@<?'A+>Pku6$6f_1,(FC+>GW40f1pG2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9)B+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,g=AF_;gP0JPR10etdF1-.*H$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh3?UV1B-8r`0f^@21HI<M
3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1<
+@1-_+>PW*3?U%43]&TQ1H#RI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>Pr"6$6f_1,(FC+>G]61H%9M2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0JahI@rrhK0JPR10KD0O3BB#Q$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0d'50Fs&Oo
0f^@20KLpF3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pr":2b:u1,(FC+>G`71c%0L2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC
+>G`71c[TN3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
0d%T,@<?'A+>>Pn6tKjN1,(FC+>GZ52)@9I1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>>Pn6tKjN1,(FC
+>G]61c[TQ0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
1a!o/@<?'A+>>So6tKjN1,(FC+>GQ21,h6K3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>>So6tKjN1,(FC+>G]61H7EP3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>Vp6tKjN1,(FC
+>G]60f;!I1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>>Yq6tKjN1,(FC+>>f:1,q<O0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>Yq6tKjN1,(FC+>GW42)dQM0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>>Yq6tKjN1,(FC
+>G]60JY[D3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>\r6tKjN1,(FC+>GT31b^sE3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>>\r6tKjN1,(FC
+>GZ50f(jE1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
1E[f.@<?'A+>>\r6tKjN1,(FC+>G]61b^sF3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>>\r6tKjN1,(FC+>G]61bh$G0FA-o:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>>_s6tKjN1,(FC
+>GT32)73L2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
2BX,1@<?'A+>>_s6tKjN1,(FC+>GZ51bh$G2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>>_s6tKjN1,(FC+>GZ52)[KQ1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>_s6tKjN1,(FC
+>Gf91Gh-I3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Pr"+@KX[
ANCqf3$:V#@j!N\0f^@13BAuU3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`
F_tT!E]P=!0H_K+@<?'A+>>bt6tKjN1,(FC+>GQ20etdI2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_K)F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqf3$:V#@j!N\0f^@20KLpI3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>>eu6tKjN1,(FC+>>f:
1,M$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqf
3?U_$@j!N\0f^@20fh!D3]&Mt$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.4+@KdN+>PW*3?U%43\`HP1b]7D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q6tKjN1,(FC+>GT3
1c7<K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0fL4CARci<0JPR10f(jH1-.0J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=
6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg3?Uq&DBL\g1,'h*0KLmI3]&Mt$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp15+A-'[+>PW+0H`)/3]/ZR
2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pes9jr&b1,(I;+>G]61,CsJ2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r
@V'R@+>t>b6t(1K3Zp1;+AH9b+>PW+0H`)*3\rWS1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/hnIk6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh3$:q(EZd+k1,'h*1HI3E3\WDu$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.7+AH9i+>PW+0H`).
3]&ZS2)GY4:IIrrFCfN#D.GC\%16K8:IIrrFCfN$+DGn<F_,VIFD56#F"_!FB6,_8BlmiuATJu<
Bln#2@s)g4ASuT48l%htF*VhKASlKr%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>;DffQ3+CS_tF`\a9F`MM6DKI!n:IH=6A7TUr
F"SS7BPDN1A8bt#D.RU,+DGm+$7^"8ARf:^ATK=D?ta7qFDl2FC2[Wj/g)9EBPDO0DfU,<De*5u
DJsW.F!+n$FEM#.+Cf(nDJ*O%/g(T18TSrqATJu3DffQ$+D>>,AKYhuGp%!9G%G\:@V$ZjA7T^l
F)to'/g*`,F*2&8+EV:*F<GF7B4uAr$=[Qh@:WnhATMp(A0?)1Cht5'AKYf-B4kdd+DG^9<)5nX
F#kFbAS!n3$4R=s/g+P$:IIuc8l%i^D.I#sBlbD$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E904Ja9@P;S,F*(u602t_8:G-Kp>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1
Ci<c9D..L-ATBG':IIu2D.G(J%13OO%15jKFCfM9@;p0s@<*K&Ec5e;Eb/`lDKI"CD]it7A7]h(
+CT.u+ED%*ATD@"@q?d)BOr;rF`MM6DKI">EZf72G]Y'#:IH=GASbpdF(Hs5$4R=e,9n=#AR]\&
@<-W90eb.$1,(I;+<WBk0J5(&/KcHaDK9<)ARTXj.3K',%144-+@^'i+CJYkATV<&FEqhD+DG^9
C2[W8E+EQ'?p\dRBHVD*CLnW)BleB;+E(j7DIIBnF"Ui0$6UH6+:SZ#+<V+#%144#+<V+#%144#
+<X9P6rZrX9N+8X8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,9tH@<*JG0JPR10fM-K1HI?H$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Vp6#^ie
1,(FC+>Gl;0JbaE0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqh2]tD/B-8r`0f^@20fh!B
3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17
+<X'\FCdKU1,g=AF_;gP0JPR10ek^F0fh-F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>Pku6$6f_1,(FC+>GW40f1pG2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp1:
+@1-_+>PW*3?U%33\iHO0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqh3?UV1B-8r`0f^@21HI<M3\rc'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@21HI?J
3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp:&+@KX[
ANCqh3?UV1B-8r`0f^@21cdEN3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqf1E]J'F<E=m0f^@13BB#X3]/]#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0d'50Fs&Oo
0f^@20KLpF3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqg0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh3?V(8Fs&Oo0f^@22**QM3]&c&
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU1-$IPDg!6Y0JPR10f;!K3BAiS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>>Pn6tKjN1,(FC+>GZ52)@9I1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN
+>PW*3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>GYp+@KX[ANCqf1*Atr@j!N\0f^@21cdHR3\rJt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0Jah>ARci<0JPR10ebXD
2``ZR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>>So6tKjN1,(FC+>G]61H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,K=F$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf
2'>:u@j!N\0f^@13BAoT3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=
6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0Jst@ARci<0JPR10etdI2``WJ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>>Yq6tKjN1,(FC
+>G]60JY[D3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS1,'gn6t(1K3Zp+7+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2BYD!@j!N\0f^@20fh-F3\WQ$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\
FCdKU0K(%AARci<0JPR10f(jF1HI3I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>\r6tKjN1,(FC+>G]61b^sG0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN
+>PW*3?U%53]&QP0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Pes+@KX[ANCqf2]tM"@j!N\0f^@20fh0I3]&c&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+BARci<0JPR10f(jI
0fh$I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
2]s52@<?'A+>>_s6tKjN1,(FC+>GZ52)[KQ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0f]RJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>bt6tKjN
1,(FC+>>f:1cIHN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU0K:1CARci<0JPR10ebXC1-.9M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_K)F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqf3$:V#@j!N\0f^@20KLpI3\iT#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*
3?U"93\iNQ1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!
1E[f.@<?'A+>>eu6tKjN1,(FC+>GT30JY[G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q6tKjN1,(FC+>GT31c7<K1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get
6tKjN1,(FC+>GZ51GV!H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Gl!8muT[1,(I;+>GQ20K;*M1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P\p8muT[1,(I;+>Gf9
2)73M3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS
2'=#0@<?'A+>Pes9jr&b1,(I;+>G]61,CsJ3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/hnIk6?R!YA0=WiD.7's3Zp='+@KX[ANCqh3$:q(EZd+k1,'h*1-.3K3\rW#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!9jr&b1,(I;+>GZ5
0JPUB2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>G_r9jr;i1,(I;+>Gc81c.6N2%!,Q6qU6C:2b5cF##UJ67Pc)6qU6C:2b5cF!,QV
/Kdi*A0=K?6m-#OG%GK.E,B0(F<GI>FCfMG%15is/e&._67sBjEb/[$ARmhE1,(C>A7]7*0d&%W
$;No?+Cf(nDJ*Nk3Zp130K3NR@k]b_/Kf+V@;]UaEb$;+ART+\EZee$A7]9\$4R>@ARuu48l%iM
DffQ3.3N5@EZf4;Eb-A6ARf:hF<GI>FCfMG+@0gbD]j+4AKWC7BleB7Ed;D<A19,?$<1\MF(HJ3
DffQ3+CT;%+E)(,+CT.u+EV:.+DGn<F_,V:BOQ'q+C\nnDBNb(EbAs"Gp$O+A9)7&F(Jkk$?'r-
@:EY_A8c?sA1eur+ED%8@;0U%FD,B0+C\nl@<HX&+=LZ/+CQC0Bl%TsDJ<Nq+Dkh*BQPA<@<j:E
BPDO0DfU+H%13OO:i^J`Ch7I)+EqOABHVD1AKYK*EcP`/F<F1O6m-PrF*(u1/e&.>/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%14gI
+@KdN+>PW)2'=V.3\W<M0JO"D%14g=+A$H\Df'H0ATVK+E-67UB4Z0-F*VV>ATVs</g)9UF`\a7
DIal&ATT&'Eb-A*@;0auGp%0RD/Ej+EbT#lC^g^o+<YlBFD)e*+D,2/+CT/*Dg?&7B-:c1@qBV$
Bl@m13XlE*$6UH61*A:oB4Z0--Zip@FDu83@;TIiAL@oo+<VdL+>P'YF`\`RFCfN8E,oMuD.7<m
-T`\./hSb!FCf]=+>,9!-Qij*%144#+@.,[Df'?"DIal1ARo@nBkM<+F(fK7Ch+Z0FE2)=AKYT'
EZek1D/a<&FCcS6F`]9LATT&9H#7D0FE2XL/KeqL+D#e-AT2a*Df0VX%13OO1+=>;F<Gd9F!+m6
D/"'5@;BEsDJsV>FDi:9DI[L*A7Zm&Df^#/D.7<mF!,17+EV:.+Co%qBl7X,Bl@l3De:,)Ec6)>
Et&I!+<Y*1A0>r9Blmp-/g)99BOr<$De*s.DepOED/=8B+DGm>@UX=l@ps1iGp$N<CM\-(B4W3-
D[d$r+<Y<.F<G"4Dfor.+EV:2F"SRX:iCDs@;TIiATJu<Dfol,+DG_'Eb/[#AKZ&>D/Ej+Ed8d9
DIak!$6UH6F(oK1Ch[L,+DkP$DKK<$DJ=!$+A*btH#n(=D0$h6DBNS4Dfp#?/g(T1%144#+>"^X
D]iY+GT_*ABlbD;AT;j,Eb0;7@q]:gB4Z-,Bl5&'Df'?"DIal.E-,f4DK?q/DIal3BOr;qBl7@"
Gmt*'+<VdLCghU-F`\aEAfu2/AKZ,5A7]dtH"h//+Cf>,E,TW*DKI"5Bl%@%+:SYe$8X+R<+ohc
Bl7HmGUI3CB-;8@F*(u1+E_a:F!+q1G\(D.Ch[s4F!,C5+EqaEA0>buD.Rc2/Kf1WBl7Q+F*VV3
DesJ($6UH6GAhV?A0?/3ASbm"@VKHtE+O'%DfT]'DI[6#@W-1+FE8R:DfQt:@<-!l+Co1rFD5Z2
@<-'nF"Rn/%14p@+@g!\ATD3q+E1b2FCfK1+DkP/@q]RoB-;8/Dfol,+ED%4Cgggb+EV:.+E2@4
AncKCF*1r5FE2)5B.n=KAnGb%+:SZ#+<YN0FCSuuDJ()0Dg*fC$4R>".3Lo!F(oK1Ch4`*Bl7K)
FCf]=+Co&"FC?;5H#n(=D'3n5Dfol,+C\n)@:Wn[A0>K&EZfREEb'5D%13OO2CTb7+D5M/@UX'q
-uEC1Gp$X3@ruF'DIIR"ATK:CGAhM405PQ:@<?4%DD--RATJu(Ec6#?+ED%*ATD@"@q?bl$6UH6
BlbD7AS#C`A1e;u%15$C+@.,hF`M%98g$W(8K_VcDf0Y>ASu$$BlbD7AS#C`A1e;u%15'D+A,Et
+Dl7BF<GUHDBNk8+C]82BHVM5DId[0F!+n/A0>]&DKU1HF*VhKASlJt$4R>&.3M5Y6m-AYARoj)
@3B5pCiCM?ATD6&FD,*)+E)41DK?qCE$/\&FCAm"ARlosFDYh:F*)\DAKYYtCiCM/DfQs0$?pE/
A90@4$4R=b+<VeADe*NmCiCLEE-67M%13OO%13OO:iCDrBjtmi+@BgNDJ*O%+EVNE8l%i-%14[=
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$8O=Y6tKjN1,(C>+>>f:1H.?K0b"I!$4R=s.3M>nCLnW0F`M%9<GlM\De*E%BlbD9Ec5o.
Ebp"DBOPdhCh7-"Bl5&4F`]!P+CT.u+D58--Z^mL$4R=t.3LurDKBN&ATAo,@;]UlBl7Q+<GlM\
De*E%@<3Q"+EV1>F<G[NE+L/+DBNJ.@s)X"DKK</Bl@l?+D!0</e&-s$6UH61a$a[F<DrRDJ<U!
A7]joG]Y;p<DH+Q:IIW5-Qk#o/hSb!F`(o'De*E%FCf]=+>,9!/gh)8%14m?+@0OK+<Y)8F(oK1
Ch4`!BOPdkAKYK$F`):DAoD]4DdmHm@ruc7Bl5&8BOr;s@<>pe@<6!4%144#+BN5fDBNt2E,8rm
Bl7Q+GAhM4F"_H@C1UmsF!,R<AKZ&>F*(u1+CfP7Eb0-1Cj@.DART+j%144#+EV:.+EV%4B4Z0r
A0>B#D/aE2ASuU2+CT.u+Cf(r@r$-.FD,5.Bl7F!D/!m#+DtV)ATJ:f+<VeNBln#2FD,5.FCB3&
ATT&4@;TRs/g)92Df^"CDe:,6BOr;tG]753F(HJ4AftN"+E_X6@<?&i$6UH6De!:"EcW@IBln#2
FD,6,AKZ#)@:XF3%144#%144#+A$/f@3BT%E,8rmAKYK$F`):DG@>P8@:Wn[A0>u4+EV:.+ED%4
CgggbA0>r8Eckl6F`M%9@1<Pd+<YN8DJ=0%F_kV3@;Tq*DKI">Afu#8ATDHq@:UL)Dfol,+C\n)
@:Wn[A0>u4+Cf>4DKI"7Dg)Wt+<VeD@;^?5FD5T'F!+n/+E(_(ARfg)BOPs)@V'+g+ED%4Cgggb
A1euI<+oue+DGm>@3B>sGmt*'+<Y`I@<?4)FD55;+<XWsBl7R)+EV:*F<G4-F<G(,@;]^hA0>;'
Ci=D<@<,p%F`V\6Ci"AX%13OO+<VdL+<Ve8.3N)BB4lK4@<3Q)ASc/l$6UH6+<VdL@OWF;Dfd+G
ASc0*A7]grB5V9k%144#+<VdL+:SZ#+<X0cFED57B-;D:Eb$;/AThX$+Cf(nDJ*N'@rHL-FE8RC
F`\aEAfu29@:X(oBl@ltC`mn4EcYr5D@Hpq+<Y04DKKo;C`meEF*(u1F!,1<+CT)-D]iI2E+*Hu
/g)99BPDN1GAhV?A0>_tCLnV\:IGX!+<VeDDfTD3F`V,+F_i1EBln$,F`\a7+EM70DJ<]s@ps7s
+E)F7EbK#mA0>T(@rc-hF(Hs5$4R=b+<XWsBlbD,BOPdkAKZ28F_kS2Eb065Bl[c-@3B&n@;]^h
+EVNEFD,5.@VK^gEd8dD@<ld6F<GL6%144#+Cno&@:EYdAKYT!Ch7Z1Eb0-!ATDL&B-;/6AThd+
F`S[9@<>pe@<6"$+E_RBART+X@VfU.%144#+A!]"Dfol,+D>2,AKZ)5+D5U8FD,]5F_>A1@3B*'
D/^V+DIal1ATMs3Eb-jG+:SYe$4R>!.3LurDKBN&ATAo%A7TClB-:o++CT/+FD,6++E2IF+E)4@
Bl@l3FD,*)+EqaHCh+Z0FDl22+EV1>F<G+*Cij*,%144#+DG^9FD,5.A8bt#D.RU,@<?4%DBNG-
D/aE2ASuT4De:,1@VTIaFE9&W+B3#gF!,C?FD5Z2+EqaHCh*t^+<VeFDJXS@@V$ZnG\(B-FCeu*
GA(Q*+ED%5F_,W9ARlomGp%3BAKZ,:ATBCG+A$YtGAhV?A0>T(@rc-hF(Gdf+<VeKBOr<-H#n(=
D0$h0De*E%F(or3+C]U=D..^!AKW`^/Mo.(Ch[cuF!+q7F<GdGF_kRt$6UH6DJsV>@:Wmk@;^?5
DfB9.@<?4%DII?(Dg#]4BOtU_+D,P4+D#V9@:F%eF(f,q+E)41Eaa'(Df0VK%144#+B3#gF!,RM
E+L/1Afu#2FD5Z2@;I&sAScHs+D,%lBl%L*Gp$gB+CT)-D]in8Eb-A-DBO%DDIj7a+<VeNBln#2
GA(E,+A!\dAS#^$F`V,+F_iZQ+AHcqF<Ga<EcYr5DBNG-DKKo;C`meEF*(u1F!,RF@:O'q%144#
+CT)&+Cf(nDJ*O%+EVNE@rGmh/g)92Df^"C@q]:gB4Z-,@<,p%FE2)=Bjkg#@;]TuBl\6*Ch7cu
DKIK?$6UH66$"/jBl.E(B5_@&+C]U=@;Ka&FD,6,AKZ)=ART@q+Co%rEa`Ki+EV:.+E_d?Ch\!:
+E(j$$6UH6@rGmh+D>J1FDl2F/e&-s$6UH6<+oue+Cf(nDJ*N'GAhV?A0>o(EHPu9AKYD(CghU-
F`\a9BOPdkAKZ)5+EV:.+@K!m8PViV+Du+?D@Hpq+<Y-9F<GdGF_kS2DJsV>Bl8$5De+!#AKYE!
Gp$R1DIIR2+Cno&@:EYdAKY])@rH4'@<?3mCh\!*ATKI5$6UH6%144#+@KdWFC?;%De*E%GAhV?
A0>PoG%De<D]i_%DIdQp+EV:.+Dtb7+EMXFF^oN9Eb-A%DIal$G\M5@Bl7Pm$6UH6A8bt#D.RU,
@<?4%DBNG-A7Zm-Dfol,+D>2,AKZ)5+C\n)@q]F`CLq$!@;]TuE,Tf=Bjtn(+CSeqF`VY9A1e;u
%13OO;Is?LDKI!gBOPdkATJu9D]hYJ6nSoU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%B3$:t7Fs&Oo0K1+/1HI<P3]&f*$4R=O
$;FrHGp$U1@;]^hF#kEq+A!]"@<3Q/Dfd+EE+EC!Bl7Q+FD,B0+CoD#F_t]-F<GXC+Dl%<F:ARq
Afu2/BlbD@DfTV9G@>P8DJsV>DJsV>DJsW.A1euI8LJ=j+DYP"E$/V$FED)7+Du+>ATJ:fBl5&8
BOr;uF`_bHAM,)J87cgQ+CT;%+EMI<AKYZ#B4u*qB4uC.3XlE*$8EtP6Z6jcATDm(A0>u4+A*b7
/hf%'/Kf.KBlbD@@<3Q"+DkP%DfQt>@;0U%@<3P`-Z^D>@<6-m%16NaB6A'&DKI"BH#@_4GT_3=
F!+t+@;]^hA1euI<+ohc@rGmh+Eq78+Cf>-G%G]9ARmD&$4R=t.3ME(Ch[cu+D>>&E$/S"A7]9o
-u*[2BOu"!.1HUn$8X+R6?Qp^+D,>4ARlotDBL?<DJUaE-t@14E,$gE@;]TuDffZ(EZfREEb'5D
+:SYe$8a1S6tp^aEbT!*FCeu*Df0B*DIjr"Gp%3BAKY_12D-[=+CSekDf-\:@:O(]B4W3&@;]Ld
ATAo%DIa1`@<<VkBOr;Y:IH=%@:s.m/e&-s$8j7T6uQRXD.RU,@<?4%DBO(>A7]doDeX*%+D#e>
ASuR'G%De:AM%J(BlkJ>D]j(3Ao)$gF<G[=AKYhuDKuZu@q]:gB4Z-,Dg#]4+EV:.+F.O,EcWiB
$4R>#.3MB(G9CsKDfTQ0B-:W!C`l>G6m-PhF`Lu'+DG^9FD,5.A8,OqBl@ltEbT*++CT.u+D58'
ATD4$Bl7Pm$=Rae+Co2-FE2))F`_2*+D,>(ATKI5$4R>$.3M5Y6m-PhF`Lu'+DGm>DJs_AE+*d/
Cj@.GDId=!+B*DlG%G]8Bl@l3@rH7,Ec5bH+:SYe$90IW9lFQVAnbge+=M)8CLnq;-uEdA.3N_N
+E2@>@qB_&+Co&&ASu$iDKI"2De*E%F(Jj'Bl@m1%16fe+D5_5F`8I3DIal2F_Pr/+D>=pA7]e&
/e&.1%13OO%16'JBl7R)+EVO4D`S=7/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$8EtP6Z6g\Ch7^"+CoD#F_t]-FCB9*Df-\<
AThd/Bl@lA+<X5u@;R-+Cgh4!Bl7Q+FE_XGG%G]8Bl@m1%17#c+A,Et+CoD#F_t]-FCB9*Df.0M
+B3#c+E).6Bl7K)G%G]8Bl@l3FD,*)+DGm>DJs_AF`(`$EZek1DKBo?F^oN-Df-!kBlbD,F`MM6
DKK]?+D>\7FCeu*@X0(dDf99)ALDOADf0B*DIjr$De!p,ASuT4FDl)6+=L<3Blmp&Gpt?g+B3#c
F(GdfA8bt#D.RU,F!+t$DBND"+CoD7DJX6"A7]9o@<3P^<)$%=+<Xa!ASrW4BOr;W<)$%/A8bt#
D.RU,Bl@l3BlbD7ARTUqGp!P'@rH4'Ch7^"+A!]"Bl%T.GB.D>AKZ&4D.Oh^+Cf>#AKZ)5+Cf>-
G%G]9+DGp?FDi9q@8pf?11`'\+B3#c+A?3CAQU(!Bl%Sp$=[QhF`V,)+EVNEB4YslEaa'$+CQC6
Bl7R"AKYMpAnc-sFD5o0+AbHq+CoD#F_t]-F<G[=@<<W9Bl%T.@V$ZmBleB:Bju4,ARl5WBl5&8
BOr;q@<6-m+A,Et+Co2-FE2))F`_>9DD!%S:Msu_DIjr$De!p,ASuU2+EqO9C`mV6F<G%(+Co2-
FE2))F`_2*+C]J8%17/jD/a<:+ED%*ATD@"@qB1'%13OO1+=>5Df0`0Ec`EPC2[X)Df9H5.3N2B
Ec5t@@;]TuD.Rd0@:s-oBOPdhCh[d"+EVNEFD,5.F(8lpD.Oi4F(Jl)@X0)<BOqV[DffZ(EZdtM
6m,uU@<6L$F"Rn/%14m?+@0OK+EV:.+D,P.Ci=N3DJ()0ATo8@DfTB03XlE*$6UH6@4<<IG]%=H
+>#/fCh[Zr+CoA++C]J8+EM+&EarcoF!+n-C`mb0B5)F/ATD?m+Co1rFD5Z2@<-'nF!,(5EZf7.
D.Rc@%144#+CZcB-t7(1.3L2o+Dbb-AKYN$C`m20F<GX9@<,jkATJu&Cht5(F`MM6DKI"?F`\a:
Bk)7!Df0!(Gp$R)@r$4+F!,(5EZf7.D.Rc@%144#+CciC-t6h#F=A=T/M/)VG][t7@ruc7-uNI1
ALr"5Cis;<+CT.u+=M,9D.P8.CghC+/9YH<F_*!EFCAWpATJu+Ec5e;@UWb^F`;C2$6UH6+<VdL
+<VdL+<VdLFD,6+AKZ22Cht5'AKYl/+=L]<F`]&TF(oN%AKYGj@r$4+F!+1W;cFl7792iT+@8L>
5tk6H;FNu+%144#+CloD-tIF@.3L2o+ED%+F_kK,+D#e:Eb0<5Bl@l3Ap%p++EV1>F<GX9@<,jk
ATJu&Cht5&Cht54@VTIaFE8RCDBNn,FD*99$4R>!.3LoeA0>`-Eb-A0@:F:#/KeqBARlol+A,Et
+@9X\F<FD#@:OCn@qB^4+A,Et+B38tC`lPpDeF*!D/F!)B.aW#%14sA+AH9[AKYE!Gp$U1@;]^h
F!,L7EHPu9ARlp*D]j+DE,]`9F<FR_7Q;N4AU&;>-t@1+AKW`d.3N>B+DkOsEc6"O%13OO%15p-
;cI+=De*ZuFCfK$FCd3^:-pR0:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfQsK/M8J83XlE*
$?L'&F`_SFF<F.E5sn((3Zoh)+?CW!.1HVZ67sB/C2[X!Blmp,@<?'0+DG_8ATDBk@q?d,DfTA:
F"'-Z$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sBnEc>i/F<D\K+<VdL
+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$;No?+DGFr@qB^m@ruF'DBL&E+AP6U+DG_8
ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B+52C67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02u
Eb-A*DfQt>Ec5H!F)u&5B+51s%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%
ATD4$ALCGQ6r./^:IJQ,A26(Q$=HJ%6sq-::IItf$9^O84Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"
Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]TuBlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce
+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.
+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%
A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%
E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?
Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSruBmO>C%13OO7W3;iH"CE)F!+$sBOQ'q+DkP$
DKK<$DIm?$@3BN0Bm*p,AKYr4De`inF<GC<B-;;0@<<W+DI[L*A7]fk$=HJ%6sq-]DfTVG+A!\n
AThX*+<kcI@Vfb"BOt]u+EV:2F!,"3@s)X"DKI"5DfQtBBOr<-Bl.g*AKZ#)@<6@)%172j@<<V`
+Co1sDC9NKG@>B2+EVNEBl.g*Gp%3B@<<V`+CT+0@rH4$BlnH2DJ()6D]iJ+H$!_6DJ(RE:2b>!
8K_GY+Cf>,D/"*6Bl7Pm$?U2/Anc-sF(f9*B-;;0AKYSrG9Cp;D..-rBl7Q+?qO3_?m'&m@<?X4
ATKI5$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dR2eR)?BJFCA1,*2q@PVb42DAZ[BjkF^?Tqj?
;IsHSDIjr4BOr;oC2[X!Blmp,@<?'g+AbHq+A,Et+EMIDEarZ'@rGmh+CoD#F_t]-F=n\2Dg*=G
BOPul$6UH68LJ[m+ED%7F`MM6@ru9m+CJr&A8Gt%ATD4$ARHWhDIal1AThd/ARlotF<G16EZek7
EcP`/F<Ga<EcYr5DK?q=Aft;s@;]Uo@pLKrFEDJC3\N.*@;]Uo@kM\?B.k\C$6UH68K_MODBNY1
E,ol?AKZ).AKZ&4F`Lu'+Cf>#AKYr4ATMF#FCB9*Df-\.De!p,ASuTB+B)i_+EV:.+ED%0@<?'k
+<Y&k:IIucC2[X!Blmp,@<?'fD.I$,%13OO1+j\W4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?
5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEs
EZdssF*VhKASlK@+A?3QEt&I!+<Y?+G%De+BOPdkARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO
?s@2[A1_nAA8ba]%16'16r.0)De*ZuFCfK$FCefrA26(Q$=IUeA8Gt%ATD4$ARHW[:IItf$9^O8
4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*Zu
FCfK$FCei4%13OO?tsUjCh\!&Eaa'$?m'0)+CQBb01o#.+Cf4rF)rI:Ec6)>+EV:*F<GOCDg#i*
ATJ:f>AS"qATD4$AKYr4DeF*!D/F!)B3cp!FEDI_0/%-UFCfK$FCfE3DeF*!D/F!)B.d\4D(fU@
A7^!<BQS*-.3N\SE,]`9F:ARhDfQsm+Cf>#AKZ&9DfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&-s
$<1\QF!,"3@s)X"DKI"CEa`HnF!,F5DIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&
A8Gt%ATD4$ARI,"$<1\M+C\c#AKWce+Cei$AKY])F(K61Bln'4AKXKC8OO\:AU,D4F!,OG@:F%a
+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/g*`-+E_R9EHPi/Gmt*s@:EeaF!,%&@q[!,@<63,
@;]TuD..3kF!,1=+E27?F(o*"AKYK$D/a3*AKYMpFCAm"ARlonBOPdkAKYZ#F*)>@Bk;>p$=\9'
FE2;9Ch[d"+E)F7EZfI;AKZ/-EcYr5DBNV,F*)>@Gp%$;+EV:2F!,(/Ch54.$4R>M>@M/VBl5ME
De*cl?k!GP$8F.U?p%dUG\(GCE+X*'@V&taH80AY0R./O2.JO#?Tqj?;IsHSDIjr4BOr<"@;]Ul
Bl7Q+De:,9Ea`p+ARlp*AU&;L%144#+CJr&A8Gt%ATD4$ARHX)Ea`p.+Dbt6B-;;-G]Y'EBl7L'
+EVNEAnc?0FD,6&+E)-?@3BMtB4W\)$6UH68h;*-DJX$&AKYhuDL!@CFD,6++E2@>B6%EtD/!m#
+DbJ(B6@WqATKCFA8c%#+Du+>+D>2,AISth+<Y)8F*(i.A79Lh+Dk[uDK?q=Afu;<@;p1"DJ()6
AU&;L+B3#gF!,")AnbahASu"'+Cf>,@VK^kA0?)1FD)e=BOr<.AU&;+$6UH6Eb031ATMF#FCB9*
Df0V=E,ol-F^nun+C]U=?o9)g2..P:@;[3.ATN!1F<G:8+Dbb0ATJu9BOQ!*F)YQ*+=_5:DL!@H
BQ&$7@;]Us.Lc_-+<YT7+Cf(nEa`I"ATDiE+CJr&A8Gt%ATD4$ARHX)Ea`p.+EM[8BHV,*DIml3
@;]TuBl7Hq@psIjF!,R<AKYH&ART?sGA2/4+EV:.%144#+DbUtA8,po+EMXFBl7Q+?me,j/j:C*
?nNR$BOr<&ART+`DJ()5FE2)5B-:YpB5)7)+D"tkBHVM>@;p0sA0>]&DIkFC<+ohcF*)G:DJ'Cc
+<VeN@<3Q$BQ%s'DBND"@psM$AKY]/-Z^D?F`MM6DKK]?+Dk[uDJ=!$Ch7[/+DG^98hM5cBOu3q
+CT;%+E2@>@VfUmF!,[@FD)*j+<VeKBOr<&ART+\E\8J++D>1o+EVNEBl8$5De+!#AKYD(FE1f(
Ch[d"+C].qDJLA:D]j">AThX&F<Ft1@;]Uo@pgF#H#@_4GT^[6B4u*qB4uC$DJ'Cc+<Ve=Ec5e;
.V<gEBl7Q5+EV:.+DbUtA7]d(GA2/4+A*bdDe*E%Bl5&7Df'&.Bl8!6@;]RdF"SS7BPDN1F)Po,
FD5T'F!,L7F*2;@F!,17%144#+EMLEEbTH7F!+q.@;]k%/g)Vn;Is]`G%De<BOr<-E-628Dfp+D
@VfIjCNCsT/e&-s$8O4V?p%dRE\h3FD`M]EB6/-4ARo^6@:Wk.2.JXa?Tqj?8SrEeDg#\7FD,5.
Bl8$(B6%F&Bl@l3De:,/@<--oDg-(A@;]Tb$6UH69OUn3=<M-m@s)X"DKK</Bl@l3Ao_<mD.RU,
F!,[@FD)e)C2[X!Blmp,@<?'g/e&-s$=I(LDIb>@De*cl?k!HPF_PZ&C2[WsC3)-b:-pQ_@WcC$
A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlouDe*QsF!,O6EbTK7F!)T>DBL':De*KpF:ARP
67sBkBl[cpFDl2F/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU+<Y]9EHPu9AKW@5ASu("
@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG
/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<
+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:ARP67r]S:-pQU+<WB]
EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ3
05i9K$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+Aucj
F_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(F;C3=DJ1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80ktiK0K1+_A7T7^+DPh*E,ol/Bl%?5
Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`CG'=9Et&IO67sB82.:HE0JXbkASl@/ARlp0
Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*FDi::De*KpF<G^DA7]d(@;KXhD@HqJ67sB83,WYX0KC7f
Bl7?q+Cf(r@r!3/BOQ!*GB.D>FCf>4Anc'mF!,%=BleA*$;No?+>PWc@;[hW+EM47G9D*MBlnH.
DBNP*Ch4`.@<?1(%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5
?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&Ip
Df7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBmATVEq
+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eI
E$-N;F_PZ&C2[W1%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+CT)#ASrW*De*QsF!,"-
Eb/a&DfU+4$;+)^7nHZP:IIcH;c#bZ83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f
3[-:$6r60K87,_&<*s!):IK,1C(1MB:II]E<(]qS8P2oX5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS
8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U%13OO:-pQUB4YslEaa'$+Cf>,D.RU,ARloU:IH=8CghC+
+EM%5BlJ08%16i[CghC+ATL!q+?MV3C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6
C2[X)Df9H5+DPh*Df-p3$>OKiAnc'mF$2Q,-p07-?SNuPD..3k-9`Pe@r,RpF(KD%$4R>;67sC$
ART*l@r,RpF!,(/Ch7Z1@UWb^%14Lu@r,RpF(KD8/1)u5+?V#^@<<kG4ZX^+ART*r/j:D)3[-:$
C2[WpBl%@%%13OO:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2EbTK7Et&I(Eap55EapI[3Zp7%
B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"%14M1/g<"mF)kb>4ZX^4
3[-:$F)kb"$4R>;67sC'E+EC!AKYMtEb/a&DfU+GAnc'mEt&IG8PDQO4ZX]6C1D'gF)to6+=nX^
/g<"mF)kb>+=nil4s2s8/no'A-OgDP8PDQO4ZX]64A&C;7nHZP:IIcH;c#bZ81>Z4-8%J)7S-9B
;[j'f4DJeFA79R&+<VdL+D,h<Blmo/F(fK9E+*g/+?M9(7S-9B;[j'f4DJeFF*)>@ARo4k+D,h<
Blmo/F(fK9E+*g/+?M<)7S-9B;[j'f4DJeFA8bpf@<<V7+D,h<Blmo/F(fK9E+*g/+?M?*7S-9B
;[j'f4DJeFD..3kA79R&+D,h<Blmo/F(fK9E+*g/+?MB+7S-9B;[j'f4DJeFF`_>6A79R&+D,h<
Blmo/F(fK9E+*g/+?ME,7S-9B;[j'f4DJeFFDl)6F(A^$+D,h<Blmo/F(fK9E+*g/+?MH-7S-9B
;[j'f4DJeFDf0)oF<D\K+D,h<Blmo/F(fK9E+*g/+?MK.7S-9B;[j'f4DJeFE,ol/Bl%?'+D,h<
Blmo/F(fK9E+*g/+?MN/7S-9B;[j'f4DJeFE+*d(F!)SJ+D,h<Blmo/F(fK9E+*g/+?MQ07S-9B
;[j'f4DJeFF`V,7@rH6sBkLm`CER55EbTW,+EM47GApu3F!*P)HU^S#78jX&%15is/g+Y;ARfKu
FD,*)+D,>(ATJu*G\M5@+DG^9AU&0*@ru9m+Co2,ARfh#Ed8*$-o2u,+>>5e7S-9B;[j(JAhG2U
/h^Zs/g+b;G\M5@+F,)?D_;J++<Y`BDfp/@F`\`R@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+E_X6
@<?'k-OgD*+EMC<F`_SFF<F1O6q9gJ8l%iH8lJPP<(IH*AScF!/e&.1+EMC<F`_SFF<Dr";Gp:g
+>"^QBle?0DJ()%Df'?&DKKH#+DPh*Bkh]3F(96)E--.D/NtO)4!8ek,CUae/n,7s+<Y*6F(KB6
/g)hj:-pQUGA(o'+Cf>6@W-N8%16ZaA1e;u.1HUn$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"
ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
FE1f2BK8(5?O[?OF_PZ&C2[X!@<?(*1,2Nj/h1=QBl%<pDe*ZmFCf\>F"Jsd+D58'ATD4$ATJu8
H#@_4GT^[6B4u*qB4uBuA0=K?6m-PhF`Lu'+A?3CAQUPo$;No?%15is/g*VtCh7Z1@<,p%GB.D>
FCf>4FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#D.RU,+Co2,ARfh#Ed98H$;No?%15is/g+SD
F*2>2F#kFRF`MM6DKI"EATDj+Df0V=De:,2@;]Uo@j!1=@;]Uo@j!NZ3A*$=0d(CT+DbJ.ATB4/
$;No?+<VdL+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO:..lF.1HVZ67r]S:-pQU:2_7dEcQ)=+Cf(r
@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>PWf@<jO^+ED%:Bldir+=MP^H>7A/D..-r?Z]k(.1HVZ67sB90Pt6D
0esk"H?smPDe*]nBl5P4@<<q@@:Wn[A.8l@67sB90Pt6D0f'q#0Onp1@;^0uGV!<4F=A>@A7T7^
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0
@p_Mf6#(=KCghEsGW@cE?Q_Km+=BH@6#(=KCghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEs
GW@cE-OgDmDeX*1ATDl8+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$?U-(Ci<f+
B4Z0-4$"a1BQ&*6@<6K4Eb/Zi+Eqj?FCcS)BOPdkATMs6+A,Et<_Yt0%13OO:-pQU@s)g4ASuT4
E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?3Zrc1
HS.]_5u^B^?W0p2?V4*^DdmGj$?Kd#C2[X!Blmp,@<?''A8bre$4R>_Df9`>AU$@!+=DJ]H>7A/
D..-r-OgCl$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/EcZ=FDf-\<AThX*F(HJ)Bl[cpFDl2F+D,>(
AKYl!D.Oi2DfTr@%14J'@j#l)GUGX8+AG-h;GUY.C2[Wi+D58-+EDC=FED)=/14eHAU#R3$?Tj(
4ZX]IHTE^"AU"XkFCf\[3Zogu0-bpp,BdX=F(oQ1,CY(d0./;40RHDf6rm#M.3N,6@;]^hF*)FF
FCf\+$7L"78g&4eGUXbZEbTW,+CoD#/95ZIFED)=/13&lAU#R3$4R>;67sBQ:IH=8CghC+ATJ:f
C1D'C3ZpLF-YdR1Df-\4De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJB
%16onGWe)1B6%p5E,8s)AU#OS4s4TMC^g^\$;No?+E_a:+=DJ]-QmAKAS,Y$+EVNE@<QR'A0>Au
@<6*nF!,[@FD)dEC2[W1+>,9"A8bt#D.RU,+D,>(ATJ:fFCf]/Bl%@%4ZX]64CiA?.3L/g/j:C+
4=>H$-Rg/h-8%J)C1D'&/1)u5+?V#(FCf\E+:SZoFEepPEbTW,-8%J)FCf]/Bl%@%%13OO:-pQU
B6%p5E$/V4Bl%<&@UX@gBHVA+EbTK7+>"^P@<?(*+E_d?Ci^_@BOQ!*@rH4'Bl%?'B4YslEaa'$
A0>JuCh7Ys$>OBdF_PZ&FCf\[/g)Pi07G-pB6%p5E.0$\0./;kDf9`>AU#XH@q]:gB4Z.+EZdtJ
6<-TN6rZTW%14M*Db*Z&<$5pl@WcC$A9;C-.3NhTBlmo/C2@@%Bl%<h@<=Xb+EM47GApu3F!,"3
@k;Y=Dfg)4GUt3p@UX@+%13OO:-pQUBOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\M
CghEsGT_*>D/^V0Bl%@%%14J'@j#Z4F=044+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+
$7L"785E/`+?Op2/8fWQ.3NhTBlmo/A8bs/-ST%HARTIuAU#h:@<<k+$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[X!@<?(*3B9*,@WcC$A86$nCh\!&Eaa'$CghEsGVV!K
67s`sF_PZ&C2[X!Blmp,@<?'s@<?(*+EK+d+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARlou
De*ZuFCfK$FCcS9Dfp)1AKXZT<+T/a%15is/e&._67sBMBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.
E-67FA8,OqBl@ltEd9$R+CoD#F_t]-F<G+.Eb/a&DfU+U%15is/e&._67sBhF)uJ@ATKmT@s)g4
ASuT4G%G]8Bl@m1+E(j7E+*WpDdsn<E+*WpDdsnF/ibO=/hnJeEZf1,FCfJA%15is/g)8Z+<VdL
+<Ve:BOt[h+Du+?DBL?,84c`V5u'gD6R`HO:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?
+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(I;D..]E0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'D..]E1*CXODg*=BDJXS@-u*[2Ch\!&Eaa'$
/n/72.1HUn$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4
FDYu5De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(
A8G[rAU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%15is
/g+YHEcP`/F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp"
>9IHp@QcapHTHL+6r60K87,_&<*s!):IK,1C(1MkATV[*A8Gt%ATD4$AKYN%@grbS$>4BuDIIBn
4ZX]5C2[X!Blmp,@<?'.%13OO:-pQUB4YslEaa'$+D5_5F`8I>@<?(*%16idB4YsD3Zr'UE,961
+D5_6DIIBn%14J'@k]$?CiXH4F<G=7FD5i5AKY`(Dg#i+G9CX:@rGmh+DP_%F_PZ&@UX@+4ZX^#
ChI<s%13OO:-pQUBOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>D/^V0
Bl%@%%14J'@kf*DG'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](@UX@+%14M*Db*Z&<$48L
3\5/lF=A>VEbTW,+CoD#/13,]Ch7$mFCf\L@UX@+%13OO:-pQUDIIBnCh7[/+Eh=:@LWYm1E\_$
0I\,b@k]#T/g,1E0b"J(AhG2\/NS/"A8a(0$6UI4D/XQ=E-67FC2@@%Bl%<h@<<Ve67sBW6q/;/
Df'H-Ch4_u@<;qcAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr'HDImisFD5W*+A?3CAQU',4s247
B6%s/@;TQb$>"*c/g)8G$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eO
De*ZmFCf\W3B:GVCh7$mFCf](@UX@620*8F+ED%1Dg#\7CghEsGV=/MGT_*>D/^V0Bl%@%$=m^a
+=]!PFa+7(AS`J=/n/:+$=m^a+=]!SG%h:oAS`J=/oYk=A7]R".P>FGGR@tmC`k2[Dfp./A7]R"
.P>OUB*r0\C`k2[FDkXrA7]R".P>OUAdW'[C`k2[Ci=+sA7]R".P>OUF:)PiC`k2[Bl7GgA7]R"
.P>FOB*r0\C`k2[@VfZaA7]R".P>@[$=m^a+=]!VH736FF*T2ABPDO0DfU,<De(U^%13OOB4Ysl
Ea`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=)
,9S]n0J5+'/KcHcBlGL1$4R=b.Ni,6De*ZuFCfK$FCei&E+*WpDdtFo@8pf?+C\c#ARlooDe!p,
ASuTuFD5Z2+EVO?C`mk>A79RkA1e;u%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f
+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.Y
A7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj
%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+
/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26
ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<
Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:Wne
DK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:
@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&
/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>
@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^h
F!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*
Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'
@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+D
E,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A
@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iu
BHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2
/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'
Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22
A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s
$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO
,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q0
1,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6
G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<
3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3
Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-
+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-
+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/io
EcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p
@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@
ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdL
FD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&
Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1
$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&
F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6
AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5
$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:
$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#
+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\
$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*
Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()
EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!
+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9
%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ
=CuSTE-Q59/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1
@:WneDK@E>$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk
+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp
3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*
D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKq
F"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%
DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+
1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg
+=\L>%144#+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)
+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP
+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's
+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB
-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k
%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`
#n74a+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5
ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1
E+*j1ATDZ@+:/>`$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO
+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha
$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl
$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL
+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8
+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2
Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U
?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=
+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@
+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'
ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_
+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL
:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL
+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWj
Df'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#
+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9
F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL
+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(I
Bl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI
%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4
A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'
DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LA
De*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@
B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7
+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4
F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7
FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$
F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7
ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o
$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g
+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o
+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1
Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-
DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"
F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL
+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6
+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6
+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*
+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-s
DJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL
+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<ita
A8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4
+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5f
DBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'
Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26
GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.D
D]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)
@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<
FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#
+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mW
B682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u
%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&
FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7
ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#
+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSek
ARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@
F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+
A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA
7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(
Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(n
DJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(
Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97
EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeK
BOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4K
Dg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'
F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL
+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD
@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr
<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^
DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;o
C2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>
@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;
ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;
@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$
ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7M
D]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=
De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNE
FD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0
EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555
C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8
F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUj
E,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]Tu
Eb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd
+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?
=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0
+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LA
DIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>
H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+
F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$
A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$i
DI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"
+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$
D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums
+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#
+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3e
Ch4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5
+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*
B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=)
,9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp
+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2
F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+
F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_
+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e
,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4
E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@e
DJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(n
Ea`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+
@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8
ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3
FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2
@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-
+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,
ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOA
BHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+
Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&
FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2
F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8
E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?
7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRt
ATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#
+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRt
ATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B
5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&
DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!
A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@
Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@
?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!
B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,Oq
Bl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgW
IT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8
E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#
+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5
F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0
+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!
F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4
CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8
-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC
<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUr
F"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'
1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&
Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6
AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9
$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb
+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#
+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq
+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?
+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5
BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&
A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\
F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4
DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*
FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!b
Eb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-o
F!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?m
H=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq
?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3
AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;
A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!
Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,Oq
Bl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i
76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n
+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1
+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et
+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3
De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO
+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6
Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1
F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[Wn
De!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`
$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)
AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0
E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8
%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#
.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6
A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;
%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr
@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0f
A0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF
?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL
+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=)
,9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu
+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7
ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJr
De*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_
:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'
D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$
ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaE
A1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o+
+CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNE
D..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"
+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%
F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7Hm
GV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4
ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6
FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#
+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#
,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)
@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%
6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1
G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAq
De(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e
,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1
+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*
3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b
.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/
+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#
+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!
+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5g
De(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>
F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMp
F(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'
FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*
+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t
2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@
D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*bt
H#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>
A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+
GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4
+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS
?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A
+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!
F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*
@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#
.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>
A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l
@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*
@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;
C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#
.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#
.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK
3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,
Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%
@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.
+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc
@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?
Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-
F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6
Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%
De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$
F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums
-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj
1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k
+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK
%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*
A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8
E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA
%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOs
Gp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+
/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg
+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7
@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg
%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3
@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5
Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^V
AS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>
+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=)
,9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$
DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7
Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&
BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.
+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,
ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$
BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.
AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL
+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL
+<VdL+<VdL%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'
BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK&/hnJ#
+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9
?tsUj/oY?5?m'<)A8,XiARlp*D]j1DAKXNC<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHO
Eb0,uATJu9D]hY<9H[hY@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi
6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe
@r$4++D58-+EM+(FD5Z2+CSekARmD9%13OO+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIq
F!+n%A7]9o/Kf+GAKZ).AKYMtEb/a&DfU+4$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4Ysl
Ea`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO
+<W-VG%G]8Bl@l3@WcO,+D,P4+A*b:/hf"&@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pO
Eckf2Gp"gu/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(
+:SYe$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSek
ARmD&$4R=e,9n<b/ibOE3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b
+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;
DerrqEcW@3DIak^:IH=A@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,
8l8P?%13OO+<W-VDIn#7@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@
%13OO%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#7
8ono_FE_/6AKXKWF@^O`+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,
+>PW*2[p*'$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%
$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<
3B/r?/KdbrEarc*1,(7%1,(F@%13OO+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_
F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI
%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh
.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+
>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<
ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-
Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$
BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,
@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI
%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/Kdbr
Earc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE
2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"
DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^h
F!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/
E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b
/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUj
A8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2
Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-
BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b
.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.
F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3
@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt
2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-
DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<
3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[Wn
De!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU
7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$
D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7
ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloq
Ec5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>
A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#
AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#
+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeG
Ec5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*
+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'
@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+
/e&.1%16igA8Gt%ATD4$ARBA!Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14Cd
F(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$
AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-I
CM@a!A8,I)DfTJDGA1i,02-)%ATD4$ARBCsDeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8
Bl[cpFDQ4FAo_g,+A,Et+Co1rFD5Z2@<-W9B6%p5E-!W@$4R>IF*1r5ARfgrDf0o,FCf]=FEDkE
De*ZuFCfK$FCfkC8T&W]Eb8`iAUP!p%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?RH#R>8Ch[d&HW3O-;c#bT6r-0u>Y]3XD..6[Dej]!84c`V5u'gD6QdKo+<VeT>XNFH
D.RU,<,ZQ!Ap%p++E1b,A8bs#AU%crF`_&$Ch4`.@<?0*HS'XgF`V+:E+*WpDdso.DJXS@BkAK+
DBO"6ASc0*E+*j%I16NgBR+Q.EboH-CO9]7E,961I9]NcEc#6$<,ZQ!B6%s-BlkI?+<VdL+<VdL
I9]-XD/Ej%FB!0oHYm2,AKYetFCf\>AoD]4B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'
Bl@m;>Y]3XD..6[Dej]6Amo1\F(Jj'Bl@l3+<VeT>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'
DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I9]NcEc#6$<,ZQ!F(KH.
De*ZuFCfK$FCcR;I9]-XD/Ej%FB!0oHZ4":E+*cu+D,P4+E2@>@qB_&Bl7R3%16?ODIe)bBkM*q
BkM+$Bl7R3%16?ODIe)mBOPF_A:4mo%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP\0
DIak^:IKU?$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2
+EV:.+A*bdDe*E%@;]Tb$=n'bF_t]-F<G[:G]Y'BF<GOCDe!@"F(KDF+A$Yt@<6L4D.RcL%13OO
>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#6#:?[F)Q2A@q?cmDe*E%BlbD<FDl22A0>T(
+A,Et+Co1rFD5Z2@<-'nF"Rn/>\S:kD%-gp+A,Et+D5_5F`8I6De!p,ASuU2+C'#"G]\%LHSQ^(
+Co2-E$-N@Ec6)>DIIBn-[d+GEb,[e+<Xp&Eb/j0BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TA
DIdZq02b5)6qp*&BQS*->U+2rDIdZqF"M6;Ebf3(GA_hUE+*WpDds4`+<Y04D/`p*Bjtmi+DkP-
CLh@-DLEXLAU&;>Ao_<mD.RU,F"SS?ASlC"HW4ZmF!,1<+EV:.+Dl%<F<GX9EbTH7Et&I!+Dbb/
Blmd*Bl@l3De:+sFCf]=FEDkEDe*ZuFCfK$FCfkQI3;7&F*&OCAftr9+D5_5F`8I6De!p,ASuU2
+CT;%%144#DJsV>D..I#A8c[0/g*_.@;R-.Ci=N6Gp$U8DK]T3FD5W*+EV:.D(Zr&AfuA;FWb14
D/aE7AKYW+Dfp".$6UI%De!p,ASuU2+E_a:+E1b,A8bs#D..I#A8c[0+CT.u+C'#"G]\%LHYRJ0
Ch\!&Eaa'$I3<`JCht5'AKYD(Ci=D)$6UI.DfTD3F`V,+F_iZ>$=%:eAShk`+<WsfGp$a?Dfp"A
@r,RpF'N<qDffl8FCfeb+C&JpE+jT2Ec6)>+Cf4rF)uaPBlbD*+A,Et+D5_5F`8IIBln#2@1<Pd
+<Ve;ARfObEb/c(Ch[s4+E(j7Bl8$(Eb8`iAKYE!A0>o2Dfd+GDfTB03XlE=+<Ve3FCf]=FEDk$
7R9C1=&2^^;ghn^D/a08B6%p5E,K*$AUP\0DIa1`+<VdL>]aP%FEDVO;GU(f=&2^^;ghn^D/a08
B6%p5E,K*$AUQ0R;K$Jq+EqaEA9/l%Ci"$6%144#+<Xp2AU&<=FF.G4CiX*!F+#0QD]iY+DIaku
Cht59BOr<1DfTB0+EV:*F<G%(Ci=3(+EVNEFD,5.B6%p5E%VS,+<VdL6Yp1PF!,+9Dfp#?+EVmJ
Bk(RfCj@.>Ddd0!Bl8$2+Dbt+@;KLr/g+D@AU&<=FF.b@A8Gt%ATD4$AM.\3F+"K)+<VdLBlbD*
DBNM8@;Tt"AKYo'+CQC&CghC++D5_5F`8s]+DG_8ATDBk@q?csF!+m6F(oK1Ch4_]+Eh=:@UX@m
D%-gp+C]/*@r!3/BOQ!*BlbD6@<--pA0?)1FD)e*+C%TK<+T0\F(Jj'Bl@l3@rH4$@;]U.+@UN`
D/!m!+EV:2Et&I!+D5_5F`8^L+CoD#F_t]-F<Fh1AU&<=FF,bc3?VjHF)W6LC2[X!Blmp,@<?'.
I3<-?EZee.+D#e+D/a<&/e&-s$=%%OB5)71G%G]'@<?4#I16N0+DbJ.AU#>=ARfgrDf-[,$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHY7A;F`;5,D.S,<8T&W]Eb8`iAUP!p%17Q5IXWDd+>.DW%16`gE,961
+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps10F(KH.De*ZuFCfK$FCcR;:-pQU
E,oN/@<,p%AoD]4E,ol,ATMp,DJ'CcIXZ`pINTaB$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<XEt
DCnI'@rGmh+DGm>@rH6sBl7Km+EVNEFD,5.8l%htB6%p5E$/h*@:Wqi>\7nmFDc#=AU@BiBla^j
+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]Tu
BlbD6@<--pA.8kg+EqOABHV88AT_O%/T>-9A8bs#A7]RkD/"*'EcWiU7<W6_H$!_6DJ()+DBNG3
Ebp"D>]aP%FEDVO>^K_(I16N++C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq+EMIDEarZ'@rGmh+D>J%
BP_BqBQRs+B-:]&DK]T/FD5Z2F"Rn/+<Xp2AU&<=FF.b@A8Gt%ATD4$AUPqI+D>=pA7]d(@rH7,
@;0V#+C%TK<+T0\@rGmh+EV:*F<G:=+DkP-CLq$!Ch[Zr%144#FD,B0/e&-s$=%%OB5)71G%G]'
@<?4#I16NY67tA_IXZ`p+F>4`CghEsGT^mHD.7's9PJBUF!,OG@<-HZEc5eX+u(8aI16NY67tGc
IXZ`p+:SZ_ASu%*G%G]'@<?4#I16NgASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL59(DJj0+
B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?=(uP_
Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9Fc8hO@\Df9`8DffQ;>]aP%FEDVOC2[X!Blmp,
@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&@;]Tu@V'h'DIbAJ%13OO<,Wn%F(HJ!FCf]=FEDkEDe*Zu
FCfK$FCfkCH#IgJD09oA3XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+A$HlFCB!%
+A,Et/e&.1+C&T#AS-:&FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeMb_A8c@,05"j6ATD3q
05>E9I="R^7"$1lF!+m68du+M+CSekDf.0M8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#
>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,01nN(I="RP9RSN&$=%:eAShk`+<X6n
F*(i,C`l>G6rQl];F<l*%144#>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,00s,Z
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
@<`ncBkM*QBkM+$Bl7R3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.n[[
:gn6PDdso!@<6!j+A*bTH#@_4GT]OkB4u*qB4uC$DJ+A,$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9
I="n(D.tRqBlmp,@<?''8l%j'/e&-o+<Xp#DIe**DKTf-Eaa'$I16NgBlmp'%144#6?R!YA0>-!
AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bB6%p5E%W8*:IGX!
+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>F"SS7D]in*CLnVnFCf]=FEDkEDe*ZuFCfK$FCfkC
A8aL<$4R>I@V'1dDL6P<EaiI!Bl/8-$?B]tF_Pl-+=Cf5DImisCbKOAA1%fnDe'tP3[\Z\A7T7p
+DPh*+E_d?Ci^sH>9G^EDe't<-OgE"Ci^^HC2[X!Blmp,@<?'.%16?ODIe*;ATD6gFD5T?%16?S
FCf:u$6UHeE+No0FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$Bl7Q+FD,5.B6%p5E$0FEFWbm:
DKI"CD]iS/@s)X"DKIK?$4R>I@V'1dDL6P<EaiI!Bl/8-$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<
+BosE+E(d5-RT?1>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+A?]^A0>-!AU&<=FF.b@A8Gt%ATD4$
AM/BR6"Y4MEZf4-CM@[!+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk$6UI-Ddd0fA0>]&
CLnVsDL!?s+EM%5BlJ/H%13OO>[h8WBl89@ATD6gFD5T?%16oi@:UK.C2[X!Blmp,@<?'.%16?O
DIe*;ATD6gFD5T?%16?SFCf:u$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!
Blmp,@<?(/+D58'ATD4$ATJu2@<--oDg-(A@;]Tb$6UHr9OUn3=FOjrCh7Z?+@0g[+EM[8BHUo$
Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;sBl[cpFDl2F+EML5@qfOhARlomGmt*'+C'#"G]\%LHZNb?
C2[X!Blmp,@<?'5I16Mm$=%%OB5)71G%G]'@<?4#I16O)ATV[*A8Gt%ATD4$AKW@13a?c<D/^jF
+<VdL+<VdL+AP6U+EqO;A8c[5%17/fFD>`)Ch\!&Eaa'$+=AgUDf'&=C2[d'06CcBE$lbN:-pQU
Ch[d0GRY!bASu%*G%G]'@<?4#I16NgBlmp'%144#;KZk">]aP%FEDVOB6%s-BlnbGDf-\>BOr<!
Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n\@FCf]=FEDkBEc>i/FF=T*+<Y<.DImisFCfM9>YJR*
AQXCnBl%@%+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*
F!,+0G%GP6FD,5.B6%p5E$0%,D.P=/$4R>I@V'1dDL6P<EaiI!Bl/8-$>4BuCh[u6-YdR1Ch\!&
Eaa'$-Ql/N/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHk
F(HJ!9OUn3=FP@1+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU
+@^']ATJ:f+<YN0Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVOE+EQs@<?(*I4QLGFCf]=FEDkS
ASbdsAU&VGDfQ9o+<Xp2AU&<=FF.hH@;K@oAU&VU+B`W*EZek*DeW]m+EqO9C`m1u+Co1rFCB9&
A0>?,+EV:.+E2@4F(K6!AKYo'%144#<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH++Co&*@;0P!
+EM+*+EV:.+E2@4@;TIiAKYT!Ch4%_+<Xp2AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]K
DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U%16?ODIe**DKTf-Eaa'$I16Mm$<1\MEb-A%Eb-A7Df'&.
>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D$4R>I@V'1dDL5r4F_t]1@<?(/
>;7a9%16?SFCf:u$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:g
B4W3-BOr<(F_tT!EZf:4+DG_(AU"Xk+<Y04CisT4F"SS7BOr;sAS,@nCige6F!,(5F`JU6F`\aJ
BPDN1D..]4Eb0<7Cige6DBNb6DJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#
AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%O
B5)71D09Z:Bk)'tF+&BlI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?S
FCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59
@;p1"DJ()+Et&I!+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6
F!*1l0Hak=@<,ddFCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB
+E1b%AKZ&.H=\]O=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((s
FCf]=FEDk2;F+,Q76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9
>\.e`HY%);D.R`rFCfk0$>OKiCh\!&Eaa'$Dg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$AKYo7
ATDs.ATnJdF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A[/lEcu/.GC9f*>]aP%FEDVOC2[X!
Blmp,@<?(/+DGm>@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Esc/cEb/j0BQS?8F#ks-
ASs,EBkqF%ARoL`/oPcC06_,GBeN.oFCfK$FCefuEc5T2@;TjqDJ+BECh\!&Eaa'$I3<'=@s)X"
DKKqBA8-'q@ruO4+D,Y4D'2GH6m-#S@ruF'DIIR2+D5_5F`;CS$4:$ZF^fE'@ruF'DL5W1AU&<=
FF.b@A8Gt%ATD4$AUP[mDKKH1Amo1\I0p<d@V'1dDL5;q@:Wq[I0s4gAS5^pHUqj`BP_BqBQRs+
B73ui$=%7iE+O'+Bl7^5B6%s-BlncM>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>XNFHD.RU,
<,ZQ!D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaI0s4mH#R>8Ch[d&HZNb?C2[X!Blmp,@<?(/HX'<a
Ec#6$<,ZQ!F(KH.De*ZuFCfK$FCcSCI9]-XD/Ej%FB!0oHZ4":E+*cu+D,P4+E2@>@qB_&Bl7R3
$=%7iE+O'+Bl7^5BkCd`ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m@ruF'DBL&EI=5?fDf'?&
DKJirCO9c5FCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A)>\.e`HUqj`BP_BqBQRs+B71+l
ASu%*;eTTMARp2r$4:$ZF^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP\0DIak^:IKU<$=%[a
G]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!
A-ujc@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XQ4!@V'1dDL5r4F_t]1@<?(/
>;7a9$=%:eAShbs+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI6m-#S@ruF'DIIR"ATKI2
>\S:kD$hC.8l%htB6%p5E$/\0@s)X"DKKqB>]aP%FEDVO1*AS"A8-+(+=CfBDfp#:@;TR'I3;s=
AI9P&>\J.hAp\35FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFu76s=974r7qD/<H%E+*Wp
De!i?D..I#A8c[0I=#pADIdZq$6UI$Df'H%FD53#AKYhuEbf3(GA_gOFCf]=+D,Y&B5M3tFE9&W
>\.bkBR<]lBlbD2F!,R<AKYi.F*&OGATDL'F`Rm4+Dbb/Blmd*Bl@l3De:+sFCf]=FEDkEDe*Zu
FCfK$FCfkQI3;7&F*&OCAftr9+D5_5F`8I6De!p,ASuU2+CT;%$6UI/Dfd+=@<--oDg-(O+A!\a
D'3n9Dg-#C+Cf>-G%G]9Bl7Q+FD,6&/g*_t+F.mJ+Cf>,E,Tf/+D5_5F`7[1+CoD#F_t]-FE8RI
F(HJ5@;]Uo@j#VsEbf3(GA\O3DIakpFCf]=FEDkEDe*ZuFCfK$FCfkCGA1l0+C\n)@3BB)F:'-5
D/XH++E_a:Ap%oB$=%:eAShbs+@0mj+D5_5F`8I5CghC+>\7nmFDc#=AU?]c>\.bkBR=B4Dfp"A
@r,RpF+#0FF!+m68l%htB6%p5E$0@=FD)e*$6UH6+Co%nCgh?qA0>]&F*&OCAftf*FCfK)@:Njk
@;]TuEc5l<+EqaEA90d=+<VdL>]aP%FEDVO8Oc!579<8_6rSM=ASlC"HY7A;F`;5,D.S,<@;]T_
+<VdL>]aP%FEDVO;GU(f=&2^^;ghn^D/a08B6%p5E,K*$AUQ0R;K$Jq+EqaEA9/l%Ci"$6$6UH6
+C'#"G]\%LHXU`,Eb/j(I3<WM+D,>*A0>;sC`mh5AKZ28Eb'56FD,*)+C\nuDf021FDi:DBOr<!
Ec6)>/d`^D+<X$f@<6K4B6%p5E-!.DH#RJ-@;Kb*+Dbt)A0>T(FDi:<De!3lATKIH>]aP%FEDVO
C2[X!Blmp,@<?'5Bkh^;$6UH6+DGm>@;[3!G[YH.Ch4`-AftM)@r,RpF!,+9Dfp"OI3<6AFCfK)
@:NjkBlbD*+EM76E,9).8g&:gEaiI!Bl+2"+C]/*@r!3/BOQ!*BlbD6@<--pA0?)1FD)e*+C%TK
<+T0\F(Jj'Bl@l3@rH4$@;]U.+@UN`D/!m!+EV:2Esa$4B6%p5E$o]LA8bt#D.RU,+C'#"G]\%L
HSQ^(+Co2-E$-NCDe*ZuFCfK$FCchJ+D,P4+CT.1AU%X#E,9)<$4:$IAS5^pHZit@@UX@mD1)a;
+DbJ.AU#>=ARfgrDf-[)>]Y$sF(Jj'Bl@m9>]aP%FEDVOB6%p5E,K*$AUP[mDKKH1Amo1\I0p=1
IXZ_gHQXqUI0sV-E,961+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps)AATV[*
A8Gt%ATD4$AKW*j67sC"Eb02uEb-A*DfQt>Ec5H!F)u&5B*s*:IXZ_g+:;@bDIe*;ATD6gFD5T?
$=%:eAShbs+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y:IH=<Ec6)>+D>=pA7]ddAoDU0
DJsW.HW4ZmEsa$4+<YK7D/"*#FD5Z2+DkP4+C\n)ARTXkA0>Su+DGp?@V'%fD.Rc2@3B5tDIdcr
DI[61I3;s9A0>T-+DkP-CLq#`+<YlBFD)e9F(KK)D_5p:DIdZq+Co&"Bl.R+ATDiE+@UHbEd;b?
Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&I=2GF+C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq+EMIDEarZ'
@rGmh+D>J%BP_BqBQRs+B-:]&DK]T/FD5Z2F"ReB+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_
ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)+DGm>D..I#ARlp"Bkq8e+<Yc>Blbm6$=%%OB5)71
G%G]'@<?4#I0r_9/j)7FIXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g$;No?
5!FFEIXWCH>\.e`HZit@@UX@mD1)arASu%*ASuX-ATD4$AUOmm>]Y$sF(Jj'Bl@m9;KZkpBl7Q+
>]aP%FEDVOC2[X!Blmp,@<?(/I0p<dFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?=(uP_Dg-7R
+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9>K/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkC
GA1l0+EDUB+E)-?8g$)G0JO\YDIal!AU/33A1i9;$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/
+F.mJ+Dl7BF?0a9>[h8WBl89/DKTf-Eaa'$I9SEY>mahNFCf:r+<X6nF*(i,C`l>G6nSfh+C&T#
AS-:&FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeMb_A8c@,05"j6ATD3q05>E9I="R^7"$1l
F!+m68dZ[`@:WneDD!&'F<G:=+E_aJ@;Kb*+DG_7FCB!%ARlp-Bln"q+<Xp&Eb/j0BQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>Fo5tl]R8jQ.!/dbitFCf:r+<X6nF*(i,C`l>G6rQl];F<l*
$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De*p-
F`Lu'I="R^6rQl];F<m$$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,C`mG6+EqOABHUQ%AU&<=
FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGO4+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*D]iM3
Bl%<&8l%i-+A,Et;bpCk6U`,+CiaM;@rH7,@;0V#$6UHrFCf]=FEDkEDe*ZuFCfK$FCd(Q$=%:e
AShbs+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0BQS?8F#ks-E+*WpDdtD<Eb@%R
HZ3D2A8bt+/d`^D>]aP%FEDVOE+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/+CT.u+C\o-
Df0).$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+B.b<'EbTH4+Eh=:F(oQ1F!,L7EHPu9
ARlp#De*QoBk(RnBl@lA+B3#c$6UI'Des6.GA1r-+C]/*B-;/3F*)IGE,ol?Bk1ctD/XH++DG_*
DfT]'FD5Z23XQuP+<VdL>[h8WBl89/DKTf-Eaa'$I0p9'+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,
CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDG
BPD*mCh[NqFD5W*07A1ADfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*I0p9'+C&W&ASiPp
BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo
@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.n[[:gn6PDdso!@<6!j+A*bTH#@_4GT]OkB4u*q
B4uC$DJ+A)#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`$4.gt>\.e`
HY%);D.R`rFCfk->\S:kD$hC.6?R!YA0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVOC2[X!
Blmp,@<?(/+DGm>@3A/bB6%p5E%W8*:IGO4+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3Dfp#?/g+,3
+DkP&AKY6"AU&<=FF.b@A8Gt%ATD4$AUP\3D`S44>[h8WBl89@ATD6gFD5T?$?B]tF_Pl-+=Cf5
DImisCbKOAA1%_&A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I$>jU#+=CoBA8Gt%ATD4$
AL@giASu%*G%G]'@<?4#I0s4nFCf:r+<XI!ASrW4BOr;Y:IH=9Bk)7!Df0!(Bk;?.@rH7,@;0Un
DJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=mn->[h8WBl89@ATD6gFD5T?$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT7+ASu%*G%G]'@<?4#I0s4nFCf:r+<X?r@:UKcFCf]=
FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1@;BRpB-:H$AU&<=FF.b@A8Gt%ATD4$AUP\8F<G(%DBND"
$6UI-Ddd0fA0>]&CLnVsDL!?s+EM%5BlJ/H$4:$IAS5^pHZit@@UX@mD1)b-Ddd0!-YdR1Ch\!&
Eaa'$-OO*iDIe*;ATD6gFD5T?$=%:eAShbs+B)in+CQC:DfTW-DJ()&Bl[cpFDl2F/g+D@AU&<=
FF.b@A8Gt%ATD4$AUP\6ASu("@<?(%+DkP-CLh@-DBNA*A-sG%>YJR*AQXCnBl%@%/g*GrC`meA
@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.A8-'q@ruX0Gp%0IARfFdBk:ft@X/;'+C'#"G]\%L
HZNb?C2[X!Blmp,@<?'5I0p<d@V'1dDL6P<EaiI!Bl/8*F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6
+<VdL+<VdL+<XEG/g,@PDId[0Escu"FD>`)Ch\!&Eaa'$+=AgUDf'&=C2[d'06CcBE$lbN:-pQU
Ch[d0GR@\eDIe*;ATD6gFD5T?$=%:eAShbs+B!?"+C'#"G]\%LHY7A<Ch\!>+E)-?FD,5.B6%p5
E$0FEFWbm:DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb1+<Y<.DImisFCfM9>YJR*AQXCn
Bl%@%+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>f+<YB>+D5D3
ASrW4BOr<!Ec6)>+DtV)AM+;s>[h8WBl89@ATD6gFD5T?$>4BuCh[u6-YdR1Ch\!&Eaa'$-Ql/N
/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.<HD^o>YJR*AQXD'
D]iP.D/a3*AKZ).AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%LHY7A<Ch[uDI3;!nCh7Yp+<YN0
Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVOE+EQs@<?(*I4QLGFCf]=FEDkSASbdsAU&VGDfQ1-
+C'#"G]\%LHYdh5CghEsG^V1e=`8G'+Cf)'Bk(]sGA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2
ASu!h+E(j!+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr
@VfTuAnc'm$6UHrFCf]=FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGBl5&8BOr<1DfTW-DJ()&
Bl[cpFDl2F/dbipDIe**DKTf-Eaa'$I0p<\BOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aH
FWbO0Gp%<>DKI"CD]iJ!C3=T>/d_qj@V'1dDL5r4F_t]1@<?(/>;7a9$=%:eAShbs+@TgTF<Fh1
AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='
$6UI$DesQ5DK@EQ<+ohcA7]@]F_l.BBlbD/Dfp(C@Wcc8FD,B0+DkP4+ED%7F_l.BBl5&0Df021
DIIBnF!,LGDJj0+B*ob(FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+
D/OD;@q]:gB4X+2$=%%OB5)71G%G]'@<?4#I0s4gAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=
HX(9&A7^"'@;TS(>mahJDIe*;ATD6gFD5T?$=%:eAShbs+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S
@;p91Ci=3(+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&+DGm(+<Y04DKKo;Ci!Zn+C]U=>]aP%
FEDVO=&M=\9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"ReB+@BgNDJ*N'FD,B0
+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O=)q_gE+NQ&Ch[cuF!+n3AI9P&
E,oN"AS#C`A0?)1FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e5u:6D5t$,DGA2/4+Co%q@<HC.$6UHr
6#:+QFB!0oHX(Z(G]\%LHTj&7/j=]3/dbipDIe**DKTf-Eaa'$I0s_-A92[3Ear[%ATW'61,2Nj
/h1USA92[3Ear[%ATW'6+<VeJ/M/(f@rc-hFCfM9+CT.u+<VeCDdd0t+<Ve!:IH<JA7]pqCi=90
ASuT!$;No?+Co1rFD5Z2@<-'nF!,(8Df$Uh:IH=9F_u)=/e&._67r]S:-pQU<+oue+<VeJ@rc:&
F<D\K@rc-hFCfM9+<Y*1A0<"2Ddd0t+<VeKBOr;/8l%ht+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!
Df0!(Bk;?.-u*[2A7]p8+<YE;A1SjGFD5Q4.4u_c<,Wn"F`&=DBPDN1+EM%5BlJ/:+EV:.%15is
/g+bECi"$6Bl7Q+D09oA+D>\0A3(/,:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+>>5e8g$)G
0R,00/hhMmAoD]4=(uP_Dg-7R+AH9S/0IW#DKU1HD09oA+C\n)Bl8!6@;KakA1e;u:-pQB$;No?
+>G;f<+ohc8l%ht@:WneDBNe=F*&O6AKY])F*(i,Ch7-0+B<Jo+E1b!D..<)FDi:9DKBo.ChsOf
:-pQU+<Ve>ASu("@;IT3De':a:-pQB$;No?+>PAg<+ohc8l%iR:K::[73H#LA8c?.D09oA+C\n)
Bl8!6@;KakA1f!)F(HJ5@:O._DBO%>+DG_7FCB!%%15is/g)8Z+D58'ATD3q05>E9F)Q2A@q?)V
:-pQB$;No?+>YGh<+ohc8k)BG78k=;A7TUr+Dl7BF<G%(+DG_7FCB!%ARmD9<HD^oE+*6n@;[30
D]ib3F*(i,C^g_H67sB'+<Y3'FC?h;Anc'mEt&IO67sB'+<V+#:-pQU1asPHBOr;sBl[cpFDl2F
+CdH;C2[X'Df9`&+=MGJDCH]HEZd#KDf'&=HR)-X9gsI`C2[X'Df9_N+=M&?DKU1Q%15is/g)8Z
+Dl7BF<G%(+D#D/FEoJJ$;No?%15is/g*##+AQht8l%htA8,OqBl@ltEbT*++EqOABHV2$D.Rc2
-u*[2A7]p8+DPh*/0K(WBl%i>+D#e3F*'#D$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JP;!@<jUb%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'A7]7*3?Va@A7]9oDJsW.+CS_t
F`\a7EapbKBlG2,@;0P#Eb-A3DBLho+C]&,+EMgLFCf<1%15is/g)l.D..H>2'?pND/XT/+F7X6
Ch7Z1A7]^kDId<r@sK1K+EqO9C`mV6G9CpKDBNk8+CT)&+A*btH#n(=D0$-n:-pQU1,*QRGqh0!
FCfN8ARlp-Bln#2-u*[2Ch\!&Eaa'$.1HUn$?B]tF_Pl-+=Cc8Ch7Z1FCB6++ED%+AU#>.BlYR1
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eODe*R"F*(i,CcOL9?TgFm-UC$a
C2[WsDKBo.Chu*l3@>qR+Cf>$Eaa$#+?V#;5s]7(A8,q&FCB!%3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+ED%8F`MA@+ED%7F_l.BDe:,.Bl8'<06M/HGT^L7D/E^!A9/l%F!,R9G]Y'LFE2)5
B+52]Df^"`3a4Wf1*J\4+=AQb,$uHD+C-*@+=A:ZHm!NOF_*!L,$tcd%15is/g,">CLnVs+Co2,
ARfh#Ed8cU0d(O[@q0(kF"AFf+D,%rCisc0.1HW$@;BFbBlZ?t0d/S8+?DP;3XlE*$;No?+Eqj?
FCfM9@3BB#F*&OCAftQ.FCfM9FDi:6Bl%>i$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[
$4R>`ATW'6C2[X(Dfp)1AN`'s1E\_$0F\?u$;No?.W]0CF`;)6A92[3EarZ'+Ef=g+<Y07ART[l
F!)T6DIak4+Dbt)A9/k9+A,Et+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.Ao_g,+A,Et
+CoV3E-!W@$;No?%15is/g,"LDII':+<Y`:FEMP;De*p-F`Lu'+E_fuB5VX.AIStU$>F*)+>#3X
AU%p1F<G=;@<?0*-[oK7A8c@,05"j6ATD3q05>E905>?4F*(u6/no'4-Qlr</e&.1+EMC<F`_SF
F<Dr";Gp:g3Zq$j6m,oKA8c?.BlbD7Dfd+9DKBo.Ci!Zn-QmG@FEMVA/e&/!Cia0%AhG2X/nS[>
BleA=C2[X/BlH3f+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A-Qlr<
/e&.1+EMC<F`_SFF<Dr";Gp:g3Zq$j6rQl];F<kq@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8
Ec*K=$>"$pASGa/+>#3XAU%p1F<G=;@<?0*-[oK7A8c@,04\L5@4uA-Bl%@%05>*5Ch7Z?Bkh]:
+CoCC%144#F)>i<FDuAE+=BTU;GU1O+A,*p9LVl&@:WneDBNY7+Du+>+DG_7FCB!%ARm/2Eb0?8
Ec*K=$>"*c/e&-s$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*b^6m-PhF`Lu'+Co1rFD5Z2
@<-'nF!,17+ED%:ATDj'+E1b2BHV56A7]cj$=mj\FE9St+?MV3F`_>6F!,49A0>W*A7T7p-OgDs
AhG2\+D!/JA8,OqF!,$H+E(d5-RU$ID_;J++<Y`BDfp/@F`\`R78d#Z;E>qADf'&.8l%htA7]pq
Ci=90ASuT4A8,OqBl@ltEbT*++D#e3F*&cPEb0?8Ec*K=$>"*c/e&-s$;No?+DGF1@3A0<6um3a
F<G16Ch.*t+DGm>A7]@eDIm?$F`V+:BljdkBkAt?-[mF+HS0&OA9)U,F?M6!C2dU'BHS[O8l%iq
Df9_N-Qlr</g)8G$6UHd67sC!FD,6+Bldi.F`V+:FD,B0+Co%q@<HC.+:SZ#+DPh*Ec5l<4Y@j)
05>E90..kO$6UI*AhG2t7TW/V+CoCC+DPh*Ec5l<4Y@j)@lbtgC2[X'Df9_?%144#AScF!/g(T1
+<VdLC2[X'Df9_\/g)Q97Na98INW<BF*&NPARfCl+='KR9gpEY/8B*6Ec5l<+:SZ#+D#G$/e&/!
DIb@/$4R>VAhG2[+?^hl0d("@EZf+8A9)U,F<G+4/e&.1+DkP&ARoLq+?XCWA9)U,F:AR"+EMC<
F`_SFF<Dr':IH=GDf9_?A8-'q@ruX0Gp$U;ART[lA3(h\/8B*6Ec5l<%16Z_F(Hs5$6UI4D/XQ=
E-67F-Ugp2:Js4rDJsE(D/aTB+A,Et+EDC=F<G+.Eb/a&DfU+G/Nt:)/8B*6Ec5l<+ED%8F`M@P
%16ZaA1e;u%15is/g+YEART[l+Co1rFD5Z2@<-'nEt&ItD/XQ=E-67FDIn$&+=JpjA8,OqF"&Y&
C2[X'Df9_K4"u"lBk)7+%17/nDfp/@F`\aDATqZ--o$'ZBk)7+.4dSrDe*m,DfdNl0mdGF@ruc$
$?L'&F`_SFF<GI4G@VgE14*PG@ruc@/3IZcA9)U,F=]L/HXpi#FE7lu%15is/g,1WDBNJ(@ruF'
DIIR2+CoV3E$043EbTK7Et&IuD/aH&FD*fi+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1
AM5D?$4R>SDfT2qBk)6;+Co1rFE8R8D_;J++<Y3/@rsjd+?O+J@rr.e+<Y`BDfp/@F`\`R9Q+?M
Bl7QE+=A^NBk)5o$6UHd67sBpDKBr@AKYMt@ruF'DIIR2+E1b2BHV56A7]cj$6UI0A0?7P-pB\&
Bk)6lBl7HmGU[tlA8,OqF!+[01E^UH+=ANG$6UHd67sBsDdd0!A9Da.+EM%5BlJ/'$6UHF+Z_;"
4EPFZE+*j%/7`I)F=\dlBkh]:%144#:-pQUBl8!7Eb-A;AKZ#)D..-r+DG^9GAhM;Bl7Q+Ci<fl
Ch4%_+<Y04@s)g4ASuT4FDYu5De!-?5s]7(A8,q&FCB!%3B9*,%144#:-pQUEb/lpDImisFCcS)
Ec6#?+ED%*ATD@"@qB]j$6UI5D/aN,Aog*f+>=pNCi<d(-9`Q#/g,1GG&JKN-OgD*+EMC<F`_SF
F<DquEc6#?+ED%*ATD@"@qB^(B4YslEaa'$A3(h\/7`I)F:ARgDIb@/$4R>`D/XQ=E-67F-W=#4
6UapP3ZrHSB5)F/ATD?m+A,Et+Co1rFD5Z2@<-'nF!i)7+>Y-YA0<6I%17/nDfp/@F`\`_+E(d5
-RT?1.1HUn$?Kd#F`;)6A92[3EarZ'0F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s]7(A8,q&FCB!%3B9*,%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U
<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hen5+>"^HATfF1$:[fb
6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P
6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&Ik
De*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn
/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u
$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7
Bk)&j$>OKiA8bs2C2[WmF^eo7E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*M
De*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!
@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(M
Bkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS
:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+
@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe
@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8
Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe
$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.
Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*
@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3
AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=
6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'n
DfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:
+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9
C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u
+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<r
An?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&
+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP.40II;:7Sc]G78c90-YI".ATD3q05>E9A8bt#
D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c
$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU
:IIKZA8c@,/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.8T&Wj
De+!#FD5Z29OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.;f?f!
@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8XE+EQk
DdtG#F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo(r%16!%9LV6G76N[S-RT?16q($A;Fs\a
8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2
+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=
De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"f
Bln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#
D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n
$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1
AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-
F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!
Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-/i"P$+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(
Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4C
C3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pf
ATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKn
Ch\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+
D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P
+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0
@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!
A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=H
H#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:
A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0r
ATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XG
G@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1
AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQ
C2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e
$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et
+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+C
ARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'
F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-
DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$@7#EC2[X"@;0Ud
FCf\P1*n&;@;0U%8l%ht.!g2cC2[X"@;0U3FCf\G+DbJ.AU#>0Bl%?5+A,Et+EMIDEarZ'Bla^j
,p6]9D/aE7ARlp%AftM)DKTf*ATAo3AftT"@<6L$F"SS7BPDN1Anc'm%14C(@<6L$D.7<mF!+(N
6m,uU@<6L$F!+n/A0>H.E,Tf3FDl2F+DkP/ATDKnC^g^t+DG_8D]iI2F(oN)Ch4`1Dfp)1AKYK$
A7ZloDe!p,ASuTB%14Bj$7-g)Df'H-Ch[d"+EV:2F!,(/Ch4`0AT;j,Eb0;7E+EQs@<?(*/0K1K
CghEsGRY!+%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QD..3kBl7HmGT_<YH>7A/D..-r
%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14Bj$7-g'
Cij6/DIIX$G%GK8%14Bj$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[
C2[X"@;0Tg$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg
$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?KF`_;8EdLDsBPnq\/g*JhCLqO7
%16?^Bln0&HX(Z(G]\%LHR!ug,BdX=F(oQ1,CY(d+A,EtI3;I,F`Lu'+@C'XAUP!p%14C(@rH4$
@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*
+CQC5F_kUu$=%X`FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%16?]ATVa"DJ+')HX('!CisT4F(K<2
F_kW;HS@'0E--L;$=%[sDe!^%F_u"*$4R>ID..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$=%Le
ARfXpF_u"*$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8c?<FCf]F%13OO>]++sE+*Bj%16?SDK'`?
H[:!QDe(JBAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA92j2Eb-kFAU&V4$4R>IDIn$2@:s-\
$=%:_E-68LH?s=EA8PajAM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F`_>6/p(ZLI16Mm
$=%I[GApu'AISuOBl7m4FF/=[C2[X)Df9H5/p(ZLI16Mm$7/qpATr*%B4VMZ-!YA+ARfXpF_u"*
$7/qkDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k
>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'
AU"Xk%16?ODIe*)De!p,ASuU<%13                                              ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o0d&A1+>GSn2DZI10d&>/+>GYp1c6C11*AD3:J=/K:IIrrFCfN'Eb/[$ARmhE1,(C>
A7]7*0d&%j@q]:gB4YU7+>PW)2e6K00Jst)+EMX5DId0rA0>Ps@:Wqi+CSekARnb96r./^:IJQ,
A92[3EarZ'AoD]4BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u602t_8
:G-Kp@WcC$A86$nBkh^3E+EC!ATJu(Df'?&DKKH#+DPh*Bkh]3F(96)E--.DBl5&.De*KpF<G+.
Eb/a&DfU,4F_PZ&C2[X!@<?(*B4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+A,Et+EMIDEarZ'
9OUn3=CZ/Y@;^0uG[FogFCJ[#@q[!+@rc:&F<G[=@<<W4ASl@/ATJu9AU#kE@<?(*+EV13E$/b,
Ch7Y                                                                      ~>
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
1GU(0+>P&q+>Y`-3?U%2+>GQ*1Gp:7+>bc,1*ALu3A<4'De)U0/g)WYDe'u#/M/)^@;0U%8l%ht
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
Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sBoFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(L1$;No?
%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'B6%s-
BlkI?+<VdL+<VdY+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HVZ67sB'BkCd`ATMEmFD5Z2+<VdY
+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B+52C67sB'F(KH.De*ZuFCfK$FCcRH+E2@4
E+*cu+D,P4+E2@>@qB_&Bl7Pm$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*12gZE0JO"D:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f!ZWF>,Kn.!R0`
B6%s-BlkJ+EbBN3ASuT4@:Wn[A0>u4+EM[EE,oN2F!,LADfd+DAU#>9G%G]<EbTW,Et&IO67sB8
12gZE0JjnbEc6)>+A#$g6Ub'P;FFGrEc6)>DIIBn+D?%>ATDU$DJNfo%15is/g)l(De!lC2'?pN
E,8rmARloF3ZrBMEcYr4B-;D4FD)dFG@kY?+>"^L@;]UlATJu'@:UKq+Cf>#AISuA67sB812gZE
0K:1`A7T7^+D#S6DfQt6@;]UlBl7Q+/Kf(FE,8rmARlo3GB.D>ALSaGBln#2.!K]GFCem%.1HVZ
67sB812gZE0ejeZA867.FCeu*9OUn3=<MR'ARTFbCh4_@+Cf(nDJ*[$B-;&0DJs-*DKKq/$;No?
+>GWi@rsF\+CSekARlo3F(060CLqC).3L2bF`V,+F_i14DfQt/DII@,H>.80+Cf>#AKZ)+G]XB%
:-pQU0f!ZWF>5]s@:Wn[A0<:EEa`p1Eaij'DJ(C@/KekJDJ()5Dfp)1AKYf'DIml3DJs_AGB.,2
E+NPh$;No?+>GZ_ARdJU+CSekARlp*D]gHC@:O(o.3M,pF@^O`+ED%4Df]W7DfU+4$;No?+>PWf
@<jOc+CSeqF`VY9A0?)7Eb$;)DfT]'FD5Z2+=MGGCagK=DfQsm+?;&.0b"Ib67sB90Pt6D0K:1t
E+EC!ARloqDfQt1F`MM6DKI!LE+*WpDdt4=G%G]8Bl@m1+:SYe$=e!aCghC++<W%?C2[X!Blmp,
@<?'.%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?.V*+0ASu$iDKKq/$;No?+Co%nCgh?qA0>N$Ddm-k
+D>>,AKZ)5+CTG3Bk/>rDf000F(oN)+A?3CAQU'm@;TRs+EqOABHTniDIIBnEt&IO67sB/.OdMA
+A,=,8Q8AP<(0n38k`#]8OZ][79C[)9L;`N9LMiK=<L407oE/W8Q8YX=<L436qh<:ATD4$APdDY
@;TIiAIStU$;No?+B!,jATAnaF_N4E+EqaEA0>K&Ec#6,Bl@l3F*(i4AKYhu@q]RoAKWQIF(oK*
Ch[<u+EVNE4$"KnF`\'":-pQUE+*d.ATJu9AU&;>GA2/4+A>7G/0JtEFCAm$F!,[?Blmp-E+*6f
+CT.u+D>2$A8Ggu+E)41DBNqADffQ3/e&._67r]S:-pQUG%G]'@<?4#3Zr<YFCcS*BkCsgEb0,u
AISuA67r]S:-pQU+<VeNAo&hF0-Fs]+>P_q2(Tjt-VmQ-:*<D6:K0b1%15is/g)8Z+?MV3.k`#Z
/g)o*+>k\m-RV\d78=t&<DQR_-OgCl$;No?+D>J"AKZ&(EbTK7+Dbt+@;L!-+Xefh4Y@joAo&T2
Ao&S!$>jBk4Y@j42)Z^6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL:-pQU=<MO(BOu2n$>jBk4Y@j3
+<W'm/7C/F/ghbh.3K`U+<VdL+<Z)LAo&S4:-pQU;]p9tBlmp-E+*6f+=M;M@:Njk@;]TuBQ%p*
H>d\C@;I'.@:CYp$>jBk4Y@j4+<W'`-t+`B/giqn-RgQ!BeD/!.3O%UAo&S4:-pQU5p/HF=s.6*
H6?dD@r-9uBl7Q+:*;k4$>jBk4Y@j5+<W(@/nlpc:+%J5+<VdL+<VdL+<Z)LAo&S4:-pQU:*=Xl
AKYf#FED)7+AN@QD.[TI/g)tn+=LYNBeCc"-Rg/\+<VdL+<VdL+FS*=C`jiq67sBI+EV:.+DbV2
FCfJ864F9=Ao'U_+>k8a-t+`B/gi>-1,CaE2E*TU?RI9FI;NS4+<XEG/g*.sA8,[jFE8R5DIaks
%16raCcsBn2BX+j@4l7H-S?bq+<VdL+<VdL+<VeTD.[T,+AP6U+@I>)%16raCcsBn2]s4k@4l7H
-TWV(+<VdL+<VdL+<VeTD.[T,+AP6U+@@84%16raCcsBn3$9=l@4l7H-RU8h.3K`U+<VdL+<VeT
D.[T,+AP6U+Aj8$F`2A5%16raCcsBn3?TFm0f(7$+<VdL+<VdL+<VdL+<VeTD.[T,+AP6U+@B$9
$>jBk4Y@j30H_bu0I\+e+<VdL+<VdL+<VdL+<Z)LAo&S4:-pQU9L]Hu%17/gCcsBn?SYnl+u(3g
/g;o0/mg@V-nlc)+>>5R$7?ru+<VdL+B'C*+<Wrm+<Ve%+<VdL66IBn+?:Pe+<X&p+<Vdo+<VdL
;'6u(+@B$L+<VdL9L^-I-XAD8$6V&G0d%Sn1*A:o+>P&o+<WH_0d%So+>Fu]2BX^s+>Fun+<WB]
0d%St+>Fu]0ea_)+<Vd]+>Fu]+AP6U+>=o\Bl7X,Bjkfe$6V&G1*@\o1*A=p+>P&p+<WH_1*@\p
+>P&^2BXat+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>Fu]DffZ(EX`?u0d&4o+>GVo
1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jm+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB9+<Y*/
E%c*OD%-gp0d&4o+>GVo1*@\p+>=o\1*A7n+>b2p+<WE^0H_Jm+>=o\0d&.m+?(Du+<WBm+>P&^
+>Fuo+<Ve%67sB:+<XDg$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>k8q+<WB]0H_Js
+>P&^0ea_*+<Vd]+>P&^+AP6U+>b2`:-oBs+?:Pu+<Vde+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\
0d&.m+>Fum+<WZe0H_Jm0H`+n+<WB]1*@\^:-pQU2'=#:67r]S+>Fuq+<WBp+>=o\2BX[r+>t>r
+<WQb0H_Jr+>=o\2BX[r+>Fum+<WTc1a!nq0H`+n+<WB]1*@\^:-pQU2BX,[F_qQp+?(Ds+<Vdc
+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WWd0H_Jm0H`+n+<WB]1*@\^:-pQU2]s4j
%1444+>P&^0eje++<WE^1*@\q+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sds+>GPm1*@\^0d&4o
+<XEG/g*+r+=ANG$6V>O0H_J\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\
0ea_*+<Vd]+>P&^+AP6U+?:Pe@rH4$ASuT!$6V&G1*@\o0d&4o+>P&p+<WK`1*@\p+>P&^2BXat
+>Fuo+<WB]1*@\u+>P&^0ea_*+<WBn+>=o\+AP6U+>GPm6W+@#+>Fuo+<WBn+>P&^1*A=p+>b2r
+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0eje<;G9Oh$6V&G1*@\o
1*A7n+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GVo
F)YPtAISth0d&4o+>GYp0H_Jn+>P&^1E\Fq+>P&p+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^
+>Fuo+<Ve%67sB81E^aX@:Njk@:jUmEZf7BD%-h$%13OO:-pQUGAhM4+D,P4D..O#Df-\0DfQt:
Bl7L'%17;kCcsg%-nm`(Ao'PGAo&n=-6PB2%13OO8k_WE;FNrP:Jt=Y3Zodt%15is/h1FMA7T7j
ASu$iDKKq/$4R=O$;No?4?S(AIXWDd+>.J=FCf\>I16Mm$;No?+D5_5F`8IFBln0&+CT.u+CTD7
BQ%o6/Kf+V@;]UaEb$:tD..3kFD5i5AISu=9N4S_9LVoL=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8
EZee.A0>u.FDPLt$=%"^FD,T5H[[2g@<H[*DfU:OIXMY4>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J
,CY%`7riNjE.&0&.1HUn$;No?+D5_5F`8IAG%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!
+>=63,p7;CBlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dS
IXN>7G%G];Bk;L:%14Nn$4R>;67sBs@<?(*+D5_5F`8I4F_PZ&+EM%5BlJ/:%15^$6<-TN6rZTW
4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.Um
Eb0)1@<6L4D.Rc2@rH4$@;]Us+CT;%+E)-?FD,5.GAhM;Bl7Q+E+*j%%16oo@;K@oAU#=?INs;S
Ec6)>INs:N$>j3eASH$mAU#>H,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQX#F^])p
FCf\>+FYPaB6%p5E.0$\%14Nn$4R>;67sBnEc6)>+EDC=F<G[:GT\R\@rH1+D/OD;D..]4DImBi
+CSeqF`VY=DJ'Cc8k_`Q:eXG[<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''-tdR>Ch[u?
+DbJ.AU#>0Bl%?5+=LlCE,961.3N87DImisFCfM9,%kq7F`8N6$7-g4@;TRd+Eh=:F(oQ1F!,C5
+EV:2F!,(/Ch4`$DfQt3@:Nsn8l%htB6%p5E$/k:+E2@>@qB_&ATKI5$4R>IBl7m4FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U#.%16?SDK'`?H[[2gB6%p5E.0$\FD5i5AM/(9G^U#.>]!nbATVX.
Ch4%_>]aC`Ch7Ns@rH7,ASuU2%13OO>]++sE+*Bj%14C(@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&
BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"DJ+')
HX('!CisT4F(K<=HS]5MI16N0>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0>]b1.
@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CXQSBk;K@FCf]F%13OO>]++sE+*Bj%14CdDf0,rDesQ5
D@HqXBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku
$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1
A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO:-pQUD..-r+DPh*Ch\!&Eaa'$+A?3CAQU'oEb/Zr
@VfTb$;+)^9PJT[Eaa'$:i^,UD.7<m4ZX]>+?CW!%14C(C2[X!Blmp,@<?''CghEsGT^sGARTFb
Ch54A%14C(%14C(<+oue+D,>(AKY].+CQC+BkM*qGp$U>F*)>;BmO?$+Eh=:F(oQ1+E(j7FD,5.
E,oMuD.7<m%14C(D..NtEbSru+D58'ATD4$ARlomGp%'7DIdZq-Z^C^F!,C?FD5Z2+EqL1DBNn=
De+!#Bl7Q+%14C(/p(ZL+E)CEE-67T+E1b,A8bs#BPD*mCh[NqFD5W*+DGm>Dg#]4EbT&pASrW!
DIa1`,p7;CAKZ&9@;]UaEb$;,DId='+DGm>Eb/cmAnc-oA1eu6$4R>IA8bt#D.RU,@r,RpF'C@S
E-,B4@<-I(@r,_)%13OO>]k+!E+*6l@:s.UCgh3lF(8WtAR0XqAT)EsFE2YT%16?_F(K<!@r#Lc
AQrhZ@:X(iB6.@*Ap%p+E+*BjI16NgF`V,5@:O(]B4ZF+D/WrrEc-:7$=%^pAT2'fCLLjeHXUc4
F*VV3/7EC:D..O"I16NgF`V,5@:O(]B4ZF(Ap@m/AU#b?Ao)TuFCf]F%13OO,p7/IDg#i*ATJu!
FCf]=F*1r5@rc:&F:AR^F`V,5@:O(]B4ZF%Bm=H9GVWiY+:SYe$7-g;F(HJ2Bk)1%FEqh:+DGF1
@<Q'nCggdhAISuO8S1G+Ch6%[BleB;HYmJ,Ec6&FE+LYCFEr:]>]k+!E+*6l@:s.uD/!L#Dfg8D
AUSuRI16NgBkD7*D'1N;BkDU$FCf\>0jJ=)>\RedF^]B'GT\_GAnaC^+=/.EAfu&'AoqU/%144#
>]k+!E+*6l@:s.UF`_4T?$g:'E-686DI\)($=%.YF(HI?+DGF1Cis0.AU#>9EZfU<CghEsGRY!&
+C'&1AT2'fCLLjeHY.26FE;D4@sndn+<Xp'Ap@m/AU"Xk+<VdL>]k+!E+*6l@:s.uG\hJHFE1e@
G]dn<@rGmhI16N++C&Mm%144#>\%DX@<HC.AoDR/An>CmF`M&7HVIpfE+s3&4`k7[/TbQKF=^@#
@;KL<9jr-RBM<>gATD9hF(Kb/$6UH;+ED%4Cgggb+@T:.:K9b)GA2/4+E_R9@rGmh+D#\9D]iP'
@<,ddFCfJ8%144#,p6o6+F.mJ+Dtb%A0>u-BlbD,BOPpi@ru:&+>"^XBOr<*Eb0<'DI[6#De9Fc
+<VsQFD,B0+EM77B5D-%@q]:k@:OCjEZf(6+EV:.+E2@4@;TIiAKYT'Ear[%+E_a:+E(j7G\(]"
FCf\J+Dc1/CghEsA.8kg+=191ATqX&D/E^!A:%QmF`MDKHUUq4:K9c1+<Vd9$6UH;+Ceht+EM+9
+E)@8ATAo1Df0K7E+*6f+D,P0FE8R=Afu2/AU,YDAKYE)@;0Od@VfTb$6UH;+A!\r@<?0oEZf14
CLnVeDfp)1AKX?YA7Zl[Ec3(AAS!n3$6UH;+D>k=E&oX*@VfsqF"Um3Ddm91@rH3;FEqh7Ci<s,
@;on*0/>491+t=A06;&SEarZ4@rGmh/T>`K/nf?DC^g^o+=196ATVd-DJs-*DKL4pEb/fVDf0KA
%144#-!YM&FDYr6De<p*FF-r)F`Lu'+@C'XAKXfiDg`'%>\7[Z$4R=g+Auc]AS,XoAKYet@V'A"
Bk2=!+D,P4+Dbb5FE9MdDffZ(Ed)5=ALnsGBOr;tDKTf-Eaa'$+E1b!CLLje+EqO9C`m4rF`V+'
$7-g3@<--pEcW@FD]iV9FCf?#+C\o-Df0).FD,5.Ch74#+DkP-B5)69%16?W@;BF_FDPN1FCfJt
6$,G)B5)6ODe!p,ASuU:,n12(+C&quDIn$%Df'?"DIe*!5\t.UFD6.4$6UH6+F@@7ATVa"DJ+')
HX(Aq@V'A"Bk2=!I=!e^D1-gA$@Q/r@;BF_FDl87ATA4e>]k+!E+*6l@:s.uASuX-ATD4$AUP!p
%14C(@WcC$A0>E$@s)X"DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.%14C(@rH1%EcVZs
>]k+!E+*6l@:s.u@rH1%Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#I=!_+3%QgA3%QgA
3.25C,p6qF@rH7,Ec5b:F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:Ci=?BHZEb.I=!Y#
0f(@7/i#F<0J54=I16N0+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'EFq"d`A7]@eDIm<r
Ci=?@A79Rg@rH1%Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$+>"^ECht59H#R>9
+EM+*+DNNRD/9Xg>\%DXBl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%16?N
AS,XoARfXpDfU26@<6!t@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdMD7
Ddd`tDes?4I=$!I@XWSW/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)D.RU,Et&I]A7]@e
DIm<rCi=?@@q]:k@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdMkLEbTE(
@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%FCT6*DfU8QEbAj0
HS@'02CpO71Gp^;/hf#.%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3@ruF'DK?6o-!Xtl
Anc-o@rH1%EdM_HBOu3oDes?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_A7]@eDIm<rCi=?@
DffZ(Eas$(DfU8Q;Fa'%HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%
EdM52ATDm&Des?4I=$!I@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&18g&:gEaj)4@;]Tu
DJsZ8+DtV)ATJ:f>\%DXBl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n10JG%3/heu-+<VdL
+:SYe$=%^pAT2'fCLLjeHY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSgD..<m@q]:kF$3c5
>^K_(?$fh(I16Ng6tKtEDIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$DJ+BE<b6;\@<?4#
I=#IBD/E^!A7K:]EcXBK>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-+D,P4+Dl%;AKYJr
@<,ddFCfK6+E1n4+Dbb0AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)Des?4Bl7Q+@rH4$
@;]Us+>"^R@;TRs%14C(@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8A7]@eDJ=3,Df0V=
D..]4%14C(@V$['ATT&:D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$@;]Tb$=%^pAT2'f
CLLjeHY.;,D.R7+%16?XATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%Df'?"DIe*!94`Bm
DfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl%14C(GAhM;F!+q'
FED)7+EqOABHU5lF`Lu'+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4<,ZQ#>;9E1>]aP%
FCT6*DfU2?AU/K0Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=oDejc*0jT-2FCf]=
@rH1%EdM>*FCAZtCi=?BH[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=gI9SF3HX(Z(G][G6
Ci=?@A7]7o@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA?$goC0n"Hm%16?X
ATqX&D/E^!A:%QJ@<6!T<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:],;FUpI16NgDIn$%
Df'?"DIe*!7Vm!OFB!0oI9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7nI=2P3>]++s@rH4$
@;]V&>XN15E`?smI9SF3HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3>]++s
@rH4$@;]V&>Z5`bBl7Q_Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:],;FUpI16NgDIn$%
Df'?"DIe*!6Z6gYASuThDejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q>]aP%FD5iDHQt7n
I=6MQ$=%I[G@PQ.D..<mHX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3oDes?4I=$;c0n"Iu
+:SZ_DIn$%Df'?"DIe*!6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*DfU8Q>]aP%FCJj/
HQt7nI=6MQ$7/qpATqX&D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%EdMD@DI[0pCi=?B
H[?tlI=6MQ$=%I[G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'H[
B5):%9jr'XATCagCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*0jT-2FCf]=@V0t6
,;FUpI16NgDIn$%Df'?"DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et+E):7ASuU$A0><'
G\Lu.@<-W9@rH4$@;]Us+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4YslEaa'$A0>\sFCf\+
$=%I[G@bZ8Bl\-0D.RU,HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8DJ`s&FF-VU6r7fC
FAR!r@qB_&DfU8QI=$AO$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.mFEq\6HY-](@sNJ3
$4R>IBkDU$FCf\+$6UHrF`V,5@:O(]B4Y:gATVm"B4Z-uH=]6O@;L!r/0H5]E+*Bj+EM7CAKYMp
Anc-oA0>?,+F%I>AU"Xk+<VdL+<VdL+<VdL+<YfEBk)'lANaX6Cia/=+<VdL+=/.QDJ<U!A7Zlm
Eb/ZpF!,[?ASrW5F(Jl)GA2/4+F%I>AU"Xk+<VdL+<VdL+<VdL+<Yo?FCf]&HY@\DATDg&Apk*q
>\._mAISth+C'&1AT2'fCLLje>BOgt@rGmh4`k^eAR0XrH#R>8Eb/j2%16?PBakCY$=%7iE+O'2
ATW'6HX_#,@;B[nDJO;VFE2M8/.Dq/+<VdL+<VdL+<Ve9Df9E.@<-.)4`k^eALn8t+<VdL+<VdL
+<VdLE+EQhF`_;8E]nbt/.Dq/+<VdL+<VdL+<VeGA7fptFDPMOH[RFS$6UH6+<VdL+<VdL+Cf>+
DfTZ.DJO;VFE2M8/.Dq/+<VdL+<VdL+<VeLEbo6(Ci=>W@Vg0u/.Dq/+<VdL+<VdL+<VeCBl7]r
Des?44`+V?ASuTu/.Dq/+<VdL+<VdL+<VeGA7f:hEb&a%4aSk*0H`&tI16NgF(KH0ASu.&BR=!'
@<-("A7]Y#I=!YeFF=T*>]XIuCh7KsFD-#+E+*d.CM@a9HT#hb+E2.>F!*5WF<GF7DKU"C0lV5_
%16?]ATVa"DJ+')HX(-!ATDEpDI[s5FE1r7@q^:;1M(EO+<VsQE,oN5ASuT4Dg#]4Ap%p++Dbb0
ATJ:f>]XIu@rHL-FCfK>F(Jj!F_tZ#E-,cAHSBjW$4R=g+ED%7ATT&2@<?(*+DG_(AU#>>D]j1D
AKYT'F`JU7DesQ5DK?pP+Co%q@<HC.+DGm>FE_X4$7-g=BPCsi+ED%7F_l/@+DG^9Ci=E:+E(j7
G@>Q7ARlp&@:s-oF)YPtAKY])+DbJ(A926hE+KIc,p5rY<(/hj@:X+qF*&O=Aftf*A7^!.DIIBn
F!,LGDBO%>B4Z0uATAn&$7-g,Ec5eU+D>k=E&oX*GB\6`CghEsGV*EDD/FE5BlnVQDfTJDG%kN3
FDl,4@kM_6E'Iqt1a[<-0fLmG%16?_F(K<!@r#LcAUA9:CijB$Desh2$=%FVCLpprCh7^1ATA4e
>]OCnATq^'G%ku8DJ`s&FF/+CASH$mAU&V4$6UI<>\Re8FE_Y5DesQ5D@Hpq+<VdL+C%0PATMs3
DIm<rCh@*lF(Gdf+<Ve3AScF!%144#+<VdL>X3=@F*)><ARfXpFE2M8%144#+C&Mm%144#+C&u!
FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0Q;,^%144#+C&u!FDPN+B67g6>[q\gF_u#;AT3'E1Gs,n
I16N++<XouAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%,`+<Xp+@<--m
DffZ>>YSXBAQ<\gATD9hF(JTjDId='DIIBnI3f=0+<VdL+<VdL+<VdLHX'9RCLpLbE+O'"@<6!b
Bl7HmG]$r,AUPj6$6UH6>]aXnF)YQ#ATMs=Ch7s4Cgh$qI16N++<Xp1ATVa"DJ+')HX(MuEbTE%
ASuU<HSBD\I16N++<Xp1ATVa"DJ+')HX(MuEcZ#1E.*'eE-*4ACiseA0J5/#FF=T*+<Ve3Eb0&q
GRY!&+<Xp*ATV0kFCf;o5\XbRBlmp'I3f=0+<Z#9ASu%*D09Z:Bk)'tF+%;-AjCBJF*)><ARfXp
>]4Lk@rH1+D/NTiCia/m@r,^bEc>H"AR&h]I16NgD..3k@<?F0BOu2n$4R>ID..3kBl7HmGRXuh
$=%%OB5)71A8bt#D.RU,I16Mm$7QDk:-pQs5(7s0IVNe3F*)>@APPQE.V`m4F*)>@AKYJ7/Kf+V
DfT9!AKYo#C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g*]!A7]g)FD,5.
F`(`$Ebp#8DJ()&@<>pe@<6!5Anc'm+EMgLFCf;3F`V,)+EVNEF*)>@AISuA67sBkBk)7!Df0!(
Gp%$7C1UmsF"SS5AT2Ho@qfgn+EV:2F!+t/@<6K4BlbD*Cht59BOQ!1Et&IO67sC$AT;j,Eb/c(
FDi:3BOPdkAKZ).AKYMt@ruF'DIIR2+EMXCEa`Tl+EMgLFCf;A%15is/e&._67sB]ATD6&Bl8$(
Eb8`iANC8-:-pQU+<Y-'BOt[hDIIBnF!)T8BOt[hF!+q#@r$4++DtV)AKYr#FED)7DK?pC+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oA8,Oa
Ddsn4+D58-+C\bhCNXS=G%G]8Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d<De!p,ASuT4+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<Y-+ATVL.E,8rsDBL'7ATT&(@:O(qE$0=8EcYr5
DK?q=Afu/.DfTqBDdmHm@rri)G]7J-DIIX$Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
%15is/g)8Z@V97oB6/0+G]Y&N+D58-+C\bhCNXS=G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/BOtU_
ATDi7+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFDkW'ARfh'+<Y<.
F<GL2C1UmsF!,(8Df$V+@:O(qE-!-E+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<V+#:-pQU+<Y-2Cia/rEarc*+<VeJARTUhBOu6-E-67FA8,OqBl@ltEd8d:
@:O(qE$0%,D.Oi+BleB;+D,P4+EM76E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,q-$;No?+<Ve9
DKTf;+<VdL+<VdLEb0?8Ec,q@F`(o5F_)\)@:O(qE$0(>A7]dmA0>]&F*&OCAftVu@ruF'DIIR2
+C\bhCNXS=DKTf*ATDi7+<VdL+<VdL+<VdL%15is/g)8Z@q]F`CN"0'DBL&E+Cf(r@r$-.BkAJr
DL!@8Bk)7!Df0!(Gp$gB+E)41D@HqJ67sB'+Cf(r@r$$lFD)d>+<Y0-ARfLs+CfP7Eb0-1+E1b2
BHU_r@;0V#F<G+.@ruF'DIIR2+E1b2BFP;D67sB'+Cf(r@r$%+F<D\K+<Y0-ARfLs+DGF1Anc:,
F<GO2FD)e-Bk)7!Df0!(Gp$gB+CQC3F`\a:Bk)7!Df0!(Gmt*U67sB'+Cf5+F(Jlr@rrh9+<Y01
Df]K2+Co1rFD5Z2@<-'nEt&IO67sB'+CfG'@<?(%F<D\K+<YB9Bln&tCh\3,F!,OGDfT9!AKYo#
C1UmsEt&IO67sB'+Co%qGAhM4F!)SJ+<Y3+Anc-o+EqaEA9/1e:-pQU+<Y3+Cia]@AnE/.+<Ve;
ASbq"AKYo#C1UmsEt&IO67sB'+Co1sF*(i4F!)SJ+<Y3/@ruF'DIIR2+EMX5FD5f<Bk)3,@;]Tu
E+*j%+DG_*DfT]'FD5Z2%15is/g)8ZA8Z4)ARTUhBHSE?+EM+&Earc*AoD]4DIIBn+E1b2FCfK1
Et&IO67sB'+D58-A8bt#D.RU,+<Y<.F<GL2C1Ums+CoD#F_t]-FCB9*Df-!k:-pQU+<Y<.FCf]9
Cgh$q+<Ve>ATT&9BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZB4Z0tF*(u<F<D\K+D58-
+D5_5F`8I3DIal2F_Pr/+EM%5BlJ/:FCf]=%15is/g)8ZB4Z1&FE;P4D/^U?+D58-+DtV)ALns6
Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<Ve>ATVj"C1UmsF!)SJB4Z0-DdmHm
@ruc$$;No?+<Ve>ATVs(Aof(;+<VdLB4Z0-Eb/ioEb0,uATJ:f:-pQU+<Y<<Ch[s4DJUF<+<Ve>
Ec6)>+CT.u+EM[>FCcS4@;TQuCh[s4Et&IO67sB'+DG_4F`_/.@rrh9+<Yc;F*&O:DfQt=@VTIa
FE8R=DBNn@F<G+.@ruF'DIIR2%15is/g)8ZBl8*&E,]B+A0<!;+CT5.ASu$$Bl8**Ecbl'+Cno&
@1<Q=67sB'+DG_:A7]RgFCcR;+<Y3+Ch7^"+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%P<-@qZu-
+<Ve=ATVEq+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G&h/5Cgggb+<VeLE+EC!AKY])G%G]9ARloo
@<>oe$;No?+<VeEATr0+B4P^dF<D\K@rc-hFCcS4ATo88EZfC6B5)F/ATAo(Bk)7!Df0!(Gmt*U
67sB'+E)41DIdHkF<D\K+<YTAASrW!+Co1rFD5Z2@<-W&$;No?+<VeG@<?1#C`jiC+<VdLE+*j%
+DtV)AKYf'F*)I4$;No?+<VeGF`_2>E,8rsDBL&EF*)>@AKZ&-DfTqBDdmHm@rri)G]7J-DIIX$
Df0V*$;No?+<VeGF`_8;+<VdL+<VdLF*)>@AKYW+Dfp#?+CT.u+EM[>FCfM&$;No?+<VeGF`_MC
F*(i-E$-8GF*)>@AKYl!D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1@;Tt)%15is/g)8Z
E-68E@:F%a+<VdL+EMXCEb-@ADIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Ys
$;No?+<VeGF`__:G]\!L+<VdLF*)>@AKYo#C1Ums+CoD#F_t]-FCB9*Df-\+DIal&Ec6)>06;8M
FCcS:AU&<<%15is/g)8ZE-68HDfTB0+<VdL+EMXCEb-A;DfTB0%15is/g)8ZE-68HDfTB5EcW?G
+EMXCEb-A;DfTA2B5DKq@;I',AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@
D.Rd0@:s.m+=LuCA92j2Eb-A6@;]^h+>>Z,/MT(B.1HUn$=e!aCghC++<W%?C2[X(FDl22-OgDm
DeX*1ATDl8-Xgb.A1%fn%15is/h1CCE+NotASuU2+F#Ii+A,EtF*)>@AKYMpE+NotASuT4A7]@e
DKKT2DK?6o%15Ht9gMZM4ZY8>+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+Cf>4DKI"0DIal3Bl.F&
FCB$*+DkP-CCLV<:/"5X<'<9!+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G:8
A7^!.Ch[s4%15Ht6VgEQ;a!0!+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+Cf>,
E,TW*DKI";BleA*$4R>;67sBt@;0U%A8-'q@ruX0Gp$^5Ch4`!Df'H3DIm^-+Dbb5F:ARE:..ZO
4ZYr*9gMZM/430+8Q/S>6V^!E9i+at$4R>0:.%]@;c>h?2BX+b+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZrWbEb$;1@;TQu@r,RpF!,CA+DkOsEc3(BH#R=($:@QU;FNlN8P`)E3]J6):-pQUAnc'm+Cf>,
E,TW*DKIo^GA(Q*+E(_(ARfg)G@>P8Anc:,F<G(6ART[lA.8l5:..Z@6r-053\hg#+<XEG/g+b?
Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+CoD#F_t]-FCB9*Df-[L+=M8AB4NG#$:@QW=AV[W8PVE0
0ejdn:-pQUAnc'm+Cf>,E,TW*DKIo^F(fK4F<G.>E,8s#@<?4%DK?6o6V^HD;GC(Q3\qm$+<Ve%
67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp%'7Ea`frFCfK6%15Ht:fUI_5u^993]A0(+AP6U
+D,>(AKYK$D/aE2ASuTN+DbJ-F<G[>D.Oi.@VTIaF<Gd9F!)lMF`]&A$:@Qd77KF$2(NAn1*A=p
:-pQUEb/ioEb0,uAKYK$D/aE2ASuT4FCAWpAISu6:/XnS<(K/50f^@!+<XEG/g+b?Ch4`!Df'H3
DIm^-3ZrHSAn?!oDI[6#E+*j%+>"]aA8,RlF_rQMCh[s4%15Ht;b:.]4ZYSG+<VdL+AP6U+D,>(
AKYK$D/aE2ASuTN+EM7CAKYo'+E(_(ARfg)Bl5&&H$!V=%13OO:-pQUBl8**Ecbl'+D5_5F`8I3
DIal2F_Pr/+Cno&@3B/rCh4`!Df'H3DIm^-Et&IJ:0'k_:K:4i4ZX]Q:/Fqi6pXd@/430";FNlN
8P`)46V^'P:eX/H:(7P%:0(:n8Q8,W4ZX]W:0'k_:K:4i%13OO:-pQUBl8**Ecbl'+DkOsEc3(/
DIal6DfTA2A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_YkI;GU4S3Zpdb6VKdE;_1:2:fUI_5u^9(
6V^!H76smE:JNH.:/a_f74^f$79EA[5tOf\$;!un=&2^^;a!/a+A#=/9gM-E:K%]0%15is/g+kG
G%G]9ARlp*ATMr9A79Rg%15[%<`DLd<)Yq@+@An#<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$
=AV[W8PT^%%15is/g,%?D.P>;+E)9CDIIBn/oG*7AKZ&*E+*cqFDl1B@q]:k@:OCjEX`@N6r-cF
3[ZO-+:SYe$;No?+EVX<D'3k5B4uB0.!0K<Bl%L$B.4sB@<?0*A7]RkD/"*'EcW?H-n6Z//g*tV
<(KDG9FV>LE+F'2Bl-!o>p(A@+BplL/M8/M3Zon)03g+P:dJ&O6q'cn?Q_KS>n%,M$;No?+EML<
BlkJ,@:O(qE$0%,D.Oi/@<?U&Ec*"0C^g_mE,961@W#UkAN`'s-r*0+<$l'cAoD^$F*)FF4!79d
:K/ZLAoqU)F*)FO%13OO:-pQ_ASu$hAT23uA7]Y#F)uJAD/X?1:-pQ_F*2A;Df9M9F"Jsd@rH4'
F`_29+EM[C+ED1;AM8+9F<G[>D.Rc2@;]TuAp%p++Dtb7+Dl%8DBNIuFCfMG%15is/e&._67sC(
ATD6gFD5SQ%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/(f+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y0&Ci+*/DK?pC+<W6Y@ps1b
DId0r+Cno&ATJu4Aftu&G9C=3A0>K,Cht52Df9N7%15is/g)9RDf9N7+<VdL+<VdY+EV=7ATJu4
Aftu&G9C=3A0>K,Cht52Df9N7+D,P4+Dr<3@;KLmA79L$H"CE)Et&IO67sB'F*2A@Bldj,ATTUK
/KePAD/aW>ATJu8F`&=BBldi.@;]TuF(KG9FD5T'F!*%WF(Jo*B6%p5E$/\0@s)X"DKK</Bl@ku
$;No?+<Y`JDK9H4ATMF)0d&%j@rH4'F`_29+EM[C+ED1;AKYE!A0>r)F<G[>D.Rc2/Kf+GAKYW+
Dfp"AA8bt#D.RU,@<?4%DBL&E+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp+>#/f@UX%`Eb],F3C%4o@;0O1@rH3,+:SZQ67sBjEb/[$ARmhE
1,(F:An>F+1(=Rc67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/KbK0:-pQU1,(F:An>F+1*CX\DJa<1DBNS4
Dfp"A@rH7.ATDm(A0>u4+Cf4rF)qct:-pQU1,(F<De!lC1E^4H@s)X"DKK</Bl@l3@:X+qF*(u(
+D,P4+=LuCA8Gt%ATD4$ALS&q%16T`@r,RpF!)iOF`)&7Df-pF%13                     ~>
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
FCf3*A7TCqFE2))F`_>9DBO.D@;pC1@Vft#B.#,Z-p01/0I\P$4?P\X?SNZN+DPh*+DPh*Ch\!&
Eaa'$+DPh*F*)>@AKZ&:DJa<1DC6ka-p01/0I\P$4?P\X?SNZN+A,Et6<-TN6qBmJ<)6Cp+A,Et
:2b5cF'icp+A,Et<)6:`;aOJU9LMEC;cHOj=WgL66qU6C:2b5cF!+:T;cI+=De*ZuFCfK$FCcRo
:IIuc8l%i^D.Fbg:IIucC2[X!Blmp,@<?'fD.FbuF_PZ&C2[WsC3(M,F_PZ&C2[X!@<?(*+C]J-
Ch.:!A8Gt%ATD4$ASbdsAU#>-Ch7$mFCf](@UX@$BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*
Ch\!&Eaa'$?Z1+%ATqL'AU#>4De*ZuFCfK$FCfB6Bk;KqFCf\>C2[X(Dfp)1ATMF)F`8I?@;]dk
ATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'+F8?[C2[X"@;0UdFCf\E
.4cl01*A>4,Vh&/0JG@<3%d'G3AN?I0f_391,(I;0JtOD/i>LH1GgjD0K1+00JY=92)%!B2)m9J
2E*EI3$9t11,(C>0f:RA3&W]T3&riU+>PW*3AE9D1bLUE3B&]L1G^d/1,(FC0etI?/i5OJ2_m0F
1GU(.0JPRB1,1U<1cRKS1,C^B1*A>+1,(C>0ek:<2)I6O3AWKI+>PW+0JG@=1G1IB0JYC=3&<K9
1,(I;0JtR@/i57:2D?pA0Jah,0JPRB1,1U<1cRKS1-%'E0d&5*0f^sD0f1L>3&roQ1H%6M+>PW+
0JG@<3%d*J0etXH2)ud70JY=92)%$C2)d3D0JYL@1a"P-1,(C>0et@;2*!NM1c@'J+>PW+0JG@<
3A*0L2Dm0C0etO-1,(I;0JtOE/i5=D1c7!F3Ar!80JY=92)-d;1c%$M3AN9F3?U(21,(C>0K:[B
1H7-M1b^UA+>PW+0JG@<3%d*G1b^gH2`!021,(I;0JtR?/i,CC3&<HO1H$@20JY=92)-g<2)I$I
2_mBI1a"P-1,(C>0K:[B1bpsI1bps31,(I;0JtOD/i>UB2)@3K0f1".0JY=90etL:2`*?L1Ggg@
+>PW+0JG@=0eP=?1,:jL0f_'51,(I;0JtRA/i>=:2E3ZN1cHO40JY=90ek[@1bh!M1GgpB3?U(2
1,(C>0KCaB0fUmH2`NTO+>PW+0JG@<3%d*F0K(XG1,:[/1,(I;0JtOD/iGL>2E*KO3Ar!80JY=9
2)%!B2DR'K3B0#Y0d&5*1,(C>0f:RA3&W]T3&riU+>PW+0JG@=2(gdI2`NZL3&WQ81,(I;0JtRB
/iG^K3&NEM2DZI20JY=92)-s@2E<]U2).'K1E\G,1,(C>0ek:<2)I6O3AWKI+>PW+0JG@=1G1IB
0JYC=3&<K91,(I;0JtR@/i57:2D?pA0Jah,0JY=92)-s@2E<]U2D?sC2]sk01,(C>0f:RA3B&oT
1,:XC+>PW+0JG@<3%d*J0etXH2)ud70JY=92)%$C2)d3D0JYL@1a"P-1,(C>0et@;3&NEL1,CXB
+>PW+0JG@<3A*0L2Dm0C0etO-1,(I;0JtOE/iGLG0f_$K2DQC10JY=92)-d;1c%$M3AN9F3?U(2
1,(C>0K:[B1H7-M1b^UA+>PW+0JG@<3%d*G1b^gH2`!021,(I;0JtR?/i,IA1c[BM0f:(/0JY=9
2)-p?1c[<O3&W]M1E\G,1,(C>0KCaC2_[-K1cI9O+>PW+0JG@<3%d'J2`*6F2_[!01,(I;0JP=>
/iYRF2E*NK3&)O20JY=92)-g<2)I'D3B/`R1a"P-1,(C>0f1L?0JkUB3&i`O+>PW+0JG493A*-D
1,1RC3&<Q;1,(I;0JtOE/i5:B1GCXC2*!*:-p01/0I\P$4>J$9,Vh&/0JG7:0ePF?0ebRD0eje+
0JY=92)-g<2)R<H1GLX>1a"P-0f^sD0fCXA1c.-L1,:g31,(I;0JtRA/i5LE2)@'E3A_j60JY=9
1,1L93&*-A3&E?E+>PW+0JG@=1G1L<2)R9N1G^s41,(FC0etIA/i>IB2`<EH3$9t11,(C>0f1L>
2`3HK1bq'J.4cl00I/>$/1<V9+>PVr1,(FC0etI?/i5OJ2_mBJ1,0n,0JY=91,1I81H7BQ1,^pG
1a"P-0f^sD0f1L>3&roR0JG7<+>PW+0JG7:0J5.>2E!EK0f(a21,(I;0JtOD/iGXG0etUE3Ar!8
0JY=92)-d;1c[KQ2`<TT1E\G,1,(C>0eb4;1GCL:3&ENJ+>PW+0JG4:1bLaC0JYUC2)6s11,(I;
0JtR?/i,LE2)$mF2E2g70JY=92)-g<2DHm@1c.$G2BXb/1,(C>0f(F=3&*6L2)R0E+>PW+0JG:<
3%d$D1,1I>1c@<91,(I;0JbID/i5@B2D[0K1,C%.0JY=92)-m>1H%6K2)I!G2'=Y.1,(C>0KCaD
3&!0K2E*WR+>PW+0JG@=2(gaE2)R*K3&*331,(FC0etI?/i5OJ2_m0H0fU:20JPRB1,1U<1cRKS
1,CgK1a"P-0f^sD0f1L>3&roQ1GpmH+>PW+0JG@<3A*3E0f:sN3A<011,(I;0JtRB/iG^K3&WHE
2]sk01,(C;0eb493ArZP2DR6M+>PW+0JG@=2(gdI2`N]M1Ggp21,(I;0JY@:/i,F?1,q0H0eje+
0JY=92)%!B2E*KJ1,UsM2BXb/1,(C>0eb4:3B/rO2E<]U+>PW+0JG@=0J54=2)@3J1c%'51,(I;
0JP=>/iYU?1,q$H1,C%.0JY=92)-m>1c[?P0fM*J2]sk01,(C>0f(F=3&rrW1GLmG+>PW+0JG@=
1G1LD0f1jI2)?s01,(I;0JtRB/iG[D3&**E3ADX30JY=91GUpB1c%$J1Gh$G1E\G,1,(C>0f:RA
3AWHK2D[<O+>PW+0JG@=0J57@2`!BJ2E!941,(I;0JtRB/i>OE2).*N0f'q-0JY=92)-s@2E<]U
2)6jB3?U(21,(C>0f:RA3B&oT1,(OF+>PW+0JG@=2(gdI2`NZM0Jkd41,(I;0JtOE/iGID3&!-D
2)-O2-p014/1<V7.4cl00I\P$4>8384>6                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
