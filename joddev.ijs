NB. JOD dictionary dump: 25 May 2020 12:11:25
NB. Generated with JOD version; 1.0.2 - dev; 2; 24 May 2020 13:08:49
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

JODTOOLSVMD=:'1.0.2 - dev';2;'24 May 2020 13:08:49'

JODVMD=:'1.0.2 - dev';2;'24 May 2020 13:08:49'

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

formifacetex=:3 : 0

NB.*formifacetex v-- formats hyperlinked and highlighted interface words.
NB.
NB. monad:  cl =. formifacetex blclIwords

NB. jod refs !(*)=. get
head=. '\begin{Shaded}',LF,'\begin{Highlighting}[]',LF
tail=. '\end{Highlighting}',LF,'\end{Shaded}',LF
ctok=. '\CommentTok{'
ntok=. '\NormalTok{'
href=. '\hyperlink{'

NB. fetch current short descriptions !(*)=. WORD_ajod_ EXPLAIN_ajod_
'rc tab'=. (WORD_ajod_,EXPLAIN_ajod_) get y
words=. 0 {"1 tab
desc=.  1 {"1 tab

NB. set hyperlinks on words - colors on comments
words=. (<href) ,&.> words ,&.> (<'}{',ntok) ,&.> (<"1 (>words),"1 ' ') ,&.> <'}}'
desc=. (<ctok) ,&.> (alltrim&.> desc) ,&.> '}'
tex=. ;words ,&.> desc ,&.> LF
head,tex,tail
)

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

markdfrwords=:3 : 0

NB.*markdfrwords v-- markdown text from word list.
NB.
NB. This verb takes a  blcl of JOD word names and returns a UTF-8
NB. encoded cl of  word source  code in markdown format. Markdown
NB. is  a simple but versatile  text markup format that is almost
NB. ideal for documenting program source code, see:
NB.
NB. http://daringfireball.net/projects/markdown/
NB.
NB. monad:  clMarkdown =. markdfrwords blclWords
NB.
NB.   markdfrwords ;:'go ahead mark us up'
NB.
NB.   NB. markdown text from JOD group words
NB.   mtxt=. markdfrwords }. grp 'jod'

NB. require 'jod' !(*)=. WORD_ajod_ NVTABLE_ajod_ badrc_ajod_ get wttext__MK__JODobj
if. badrc_ajod_ src=. (WORD_ajod_,NVTABLE_ajod_) get y do. src return. end.

NB. commented source code (name,source) table.
if. badrc_ajod_ src=. 0 0 1 wttext__MK__JODobj >1{src do. src
else.
  src=. markgassign&.> {:"1 >1{src
  NB. similar to (markdj) but faster here
  utf8 ; (<LF,MARKDOWNHEAD,LF) ,&.> src ,&.> <LF,MARKDOWNTAIL,LF
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
1,([11Gp:1+>GPm2)ud61E\J.+?1K$2]sh/+?)"t1,0n-3?U%5+>u"u0ea_.1E\D1+>P_q0ea_,
0d&2.+?)%u0f'q.2]sh/+>P_q0eje,0d&@s1,9t-0H`/.+>GPm1cQU;+>Gl!0ea_/3$9q3+?)%u
0f1"22BY"&2`Mp71*AG/+>G\q1c6C10H`2.+>t>t1a"M,+>bbp1E\G5+>G\q1cQU41*AA.+>GVo
1,pC20d&8++>GVo1bp1.1E\P7+>G\q2DH=/0d&;/6:FC9:.\2K79FVQEbTE(+DkP-CM@[!+EMX5
Ec`FBAfscU<+T/SBl7HmG\(D.GAhM4+>"^WARuuR5taXG:J4,O;aa&D5ugTX:dIiE:IAZ(Amogu
F<GO2DIdZq+DG_7FCB!%+Dbt+@<?4%DFI;g8PVZB=EAS)Bl7Q+D..I#Bl7Q+ASu$$De:+c@8pf?
+DG_(AU%cs+EqaEA0<HHF(Jo*7R9[9<)6.U:/aVJ91;fU91;TS1*C"CA0<ZNC*4pKAo&n=FDkr+
DK?pP+EV:.+EVX4Bl%L$B-:Z"@;]j'De:+?4#)(O5taXG:J4,O;^ii+@<?U&EcWBq7R9C1=&2^^
;eg5]Ch\!&Eaa'$Bl8$(Eb8`iAKZ28Eb'56AoD]4-u*[2Ch\!&Eaa'$.3N8DDfp"jH:gt$Bl8$(
Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"
FCfK)@:Njt8U=!)7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2b
F(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB0
8k_QO8PDNO79FVBEHPi1@q?d$AftnuFCf\>@rH4$@;]Us+EV:*F<G%8Bl%<&:ddcF9M%uX78d)V
7R9C19gii,Ebf3(GA\OFAU&;>F*)G:DJ()6BOQ!*D..I#F!,[?ATD?)B4YslEaa'$A0>N*Dfp"A
Bl8$(Eb8`iAKY])F(KB6ARnD,:KC%U=&W*g7S-^"@;TQuF*2),Bm:b=Aftr!Ebf3(GA\OAG%G];
Bk;K2FCf]=8k`#]8OZ][79FJOATDs.ATo85@<?(*+D,Y&B5M3tF@o=s<)6:`;cZU\8l%iS:JXY_
+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'Y:JXqk:JsSZ
C2[X!Blmp,@<?($Df9_?GAhM4F!,(5EZccFDe*ZuFCfK$FCcmDB6%p5E)]A";c#bT6r-0^F_kk:
E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?0a;F+,Q76s=cEa`p+ARlp"
Bl7K)E,oN%Bm<]W5u:BU77KjNBl8*&Ch[E&C*7S>EbTE(+EMX5Ecc#5B-;D=@;p0sA0>]&DIjqB
+D#e-Cis9"+=B<5-Qju`FE1f(Ch[d"+C].qDJLA3@<?U&EcY;[5u:BU77KjN<(0n3E+*WpDdsn`
@8pf?+D,Y&B5M3tF<G19Df$UF=&M=\:f9_O8Q[Da/Kf.KATME*F*)G:DJ+#5D09oA+Cf>1Eb0<2
Df0)oA7TLp@:XFhEbTK70k#$?ASu%"+E)9CEb03+@:Nki+CQC6@rc:&F<G:8+EV:.+Dbt)A0>r'
EbTK7+EM+(FD5Z2+E(j7F*(i2FEMP5@W?O/FCfT7EHQ2AAKZ,5EHQ2AARlp)FE2)5B6,2*Df0Z*
Bl7X&B-:Z"@;]k%3ZqsBEHQ2AAT_u8-Y#2B@VfIjCNCV4DHq-hFD,_<@VKpoBI@D1Ec#N&@:Nkj
AU%g*Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4F(T?2D00?6
Bl7HmG\(r.DfT]'F<GC.FCf\>Bl7HmGT^L7D/E^!A9/l*Ec5e;B5DKq@;I''@<-.)B6%p5E,8s)
AU%j.Dfp"ACghEsGT_3EFD)e9@;]Uo@j#i<DKK<3+D>J%BP_BqBQRs+B4l7(Ch\!.@;BEsCghEs
GT^U:EZf"8Dfp"A.![7UAmo1\D..I#A7oIkATD4$AKZ28Eb$;,DKKH1Amo1\+DkP-CLh@-DBO"3
@ruF'DJ<]mAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>FD5W'AU&E>@;p$kFCf]2DKBB0F<G:8
A7^!.@rH4$@;]Us+CT.u+D>2$A8Gg"F)Z8BBlA-8+C].qDJO<0@<?(*Ao_`sEbf3%@<?(*+D,Y4
D'3\(Ebf3(GA\OGF(oN)+E1b,A8bsp@<--oAo`*6Eb'6.@<--oDg-(AFCf]=+D,Y4D'4%@Eb$;/
BleB5@<--r@<6L(B5VQpEbce4+Cf>#AKYT'EZf1,FCf\>Bl7HmG\M&.F(KH&F_PZ&A8-(*F(KH7
04T$6@<?(%+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaEA92g'FD5>q@qBIjDJO<7ATT&.H#R>8
Eb/i*Ch[d&F!,17+CT/5+E)F7Ecu/.G9CU;FCfK)@:NjkGAhM4F!,O8@ruF'DKBB2C2[X!Blmp,
@<?("Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMu
D.7<mGB.,2G&h&.Df033Ea`p.+Eh=:@UX@mD'3q3G]Y'EBl7L'+EqOABHV,&DJ+')+?gnrGUW ~>
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
1,:d21,C%/+>G_r1*AJ51c-=00d&4o2_[!01,'h++>u/90H`))+>P&t0JPF-0fC.0+?287+>GSn
1*A;+1Gp:03?U("2`EE50eje++>Pf13?U%4+>P&o3&EW<1,0n,+>GZ/3$9q2+>P&o3Ahp60H`+n
1,(^H0d&2,+>P&q1c7-50f^@3+?;>6+>PYo1*AG62)$..0H`+n2D?g@+>G\q1*AA10Jjn,0d&4o
0f1dC+>Gl!1*AS;0H`)/+>P&o1H%$32BXat0ebL>+>G\q1*AS83?U%5+>P&o0f:m^:IINL8PDNC
8Q/Sa;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn
+@KX[ANCqh1*B;"EZd+k0f^@22``]M3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1a#)'EZd+k0f^@23BAiM3\WN#$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@2
2EEZK3]&`%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q
+@KX[ANCqh2]tD/B-8r`0f^@20fh!B3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2
F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3\rc'$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqh2]tD/B-8r`0f^@21-.-H3\`N"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp1:+@1-_
+>PW*3?U%33\iHO0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>Pr"6$6f_1,(FC+>GZ51H%9M3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B
+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1-$ICF_;gP0JPR10f(jI1-.3L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh3?UV1B-8r`0f^@21cdEN3\rW#
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4
+AZKh+>PW*3?U"93]/oY2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS2]s52@<?'A+>GSn:2b:u1,(FC+>GQ20f1pH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D2``]R$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh3?V(8
Fs&Oo0f^@22**QM3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqf1*Atr@j!N\0f^@21HIBL3\W>s$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf1*Atr
@j!N\0f^@21cdEH3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqf1*Atr@j!N\0f^@21cdHR3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqf1E](s@j!N\0f^@20KLsJ3\`T$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqf1E](s
@j!N\0f^@21cdEP3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\0f^@21cd?K3\iJu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf2'>:u@j!N\0f^@13BAoT3]&Pu$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u
@j!N\0f^@21-.9O3\W8q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Gl!+@KX[ANCqf2'>:u@j!N\0f^@21cd<G3\`T$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf2BYD!@j!N\0f^@20KM'O3\W8q$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2BYD!
@j!N\0f^@20fh-F3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf2BYD!@j!N\0f^@21cdHI3\`W%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2BYD!
@j!N\0f^@21cdHJ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pes+@KX[ANCqf2]tM"@j!N\0f^@20fh0I3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqf2]tM"@j!N\0f^@21HI?I3\`N"$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf2]tM"
@j!N\0f^@21HIBO3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\0f^@22```O3\`T$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>bt6tKjN1,(FC+>>f:1cIHN3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@20KLpD
3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>bt
6tKjN1,(FC+>GQ20fM-K2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@
+>Ybq+@KX[ANCqf3?U_$@j!N\0f^@13BAoP3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>eu6tKjN1,(FC+>GT30JY[G0FA-o:-pQU;gEG+ASjIN
8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp48+<X'\FCdKU0esk>ARci<
0JPR10f(jF1cdHI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's
3Zp."+@KX[ANCqg1a#1t@j!N\0f^@20fh-K3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.9+@KdN+>PW*3?U%43\rNP1,TCG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Gl!8muT[1,(I;
+>GQ20K;*M0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,9tE@;[2C0JY=)0fM-N1-.9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2'>V%EZd+k1,'h*1cdBJ3]&c&$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,pCN@<*JG0JY=)0etdG2**NN
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!9jr&b
1,(I;+>GZ50JPUB2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0f:(J@<itN0JY=)0fD'L1cdKN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh1a#M$Gp"jr1,'h*1HI3L3]&i(8l%iMDffQ3
?Ys=/2[p+%8l%iMDffQ3?m'0)F*2&806Co<CND.<F_>bK@VKpoBOu6-GA2/4+CfP7Eb0-1+A,Et
+EMgLFCf<1?k!H+4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%13OO:2b5cF!+n#Dfp.E@s)g4ASuT48l%ht@:WneDK@EQ<+oue+CoD#F_t]-
F<G:=%14S(Eb/`lA7]g3+CJksF*)>@H"q8.?nNQE?ta7qFDl2FC2[Wj+Du+>ATJu&@ruj%C`m5$
@;]^hF"SRE$;#;[F_,V:DJsW.A0>PsEb-A1@<iu5AThX*+C\n)@:WnhATMp(A1eurF)uJ8F!,R<
@<<W/BkM+$%16QU+CSekEb0<5ARlp-Bl%T.@V$ZuDeE]oA0>T(+B2-):NJQ>F(JoD%13OO0eOSV
<)5nX?V4*^?Ys=]+DGm>>A/,#E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%
E\CBf6r,FPA6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX
/o>,J/e&-s$4R>;DffQ3+CT5.ARTU%Ao_g,+ED%'ASuT4FDi:?Ch.*uF<G"0A0>o(An?!oDI[6#
FD,5.@s)g4ASuT4DfQt<AU&;>8l%htEb0&u@<6!4%13OO,9nEU7V-%LF^]<9+>GQ$+>PW+0H_Jm
/hen4+>"]aF`)52Ch7$rA18W1$4R=b.Nh2pGT^C'B4Z0m+EVmJD]ib3+DPh*/oY?5+CINSFD)e=
@;BEsCh[s4F!,C5+DtV)ATKJ3%144#+<V+#+<Vd9$4R=b+<Vd9$4R=b+<Ve!:IJ/X:J=\R<CokP
84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[
ANCqh3?V%)Gp"jr0f^@22EEZK3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!F$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_
1,(FC+>GT31GLpI0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]tD/B-8r`0f^@21-.0G
3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:
+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9)B+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1-$ICF_;gP0JPR10f(jI1-.3M$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR1
0f1pI2EEWQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU0JahI@rrhK0JPR10KD0O3BB#R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU
0ejeGDg!6Y0JPR10ek^D2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K1HI?O$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC
+>G`71c[TN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf1*Atr@j!N\0f^@21cdEH3\`K!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>So6tKjN1,(FC+>GQ21,h6K3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN
+>PW*3?U%53\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\0f^@21cd?K3\iN!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L
3'&lO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
3$9>3@<?'A+>>Yq6tKjN1,(FC+>GW42)dQM1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0f]RJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf
2BYD!@j!N\0f^@20KM'O3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=
6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%AARci<0JPR10ek^G0KLmJ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>>\r6tKjN1,(FC
+>GZ50f(jE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%53]&NO1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2BYD!@j!N\0f^@21cdHJ3\`>r
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\
FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>_s6tKjN1,(FC+>GZ51bh$G2@9cu:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN
+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\0f^@22```O3\`W%$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp+9+@KdN+>PW*3?U"93]&cV1-#[K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>bt
6tKjN1,(FC+>GQ20etdI2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=Wi
D.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]P$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf3?U_$@j!N\0f^@13BAoP3\iAr$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp+:+@KdN
+>PW*3?U%23\W<M1bf=E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp.6+@KdN+>PW*3?U%23]&]T0es(C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.9+@KdN+>PW*3?U%43\rNP
1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_
6t(1K3Zp.;+A-'[+>PW+0H`)(3\WNS1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&
/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp15+A-'[+>PW+0H`)/3]/ZR2)kpM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+AH9b
+>PW+0H`),3\iKP1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU1,pCN@<*JG0JY=)0etdG2**NN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40d%T*F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1;+AH9b+>PW+0H`)+3\W9L0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.7+AH9i
+>PW+0H`).3]&ZS2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp17+AH9i+>PW+0H`)+3\WNS1cYn=9LMKK6r%ZBATKUa:-pF+9LMKK
6r%ZBATJu9/M/)@Ch+Y\:IH=9AThX$DfBQ)DKI"=DffQ3/e&._67r]S:-pQU@rc-hFCeuD+>PW)
2.U9.0eje&%15is/g+Y;@;]^hA3(hg0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^%13OO
;e9M_-q[9':2b5cF"&5DDfQt;DfTD3Eb/`lDKI"=DffQ3/g*GrF)N1BARuu4BPDO0DfU,<De(:L
%16'JATME*DJsW.F!+n3AKYo-A0>;uA0>u-AKY].F*2&8+D>2,AKYGnASrW,@<-!lCj@.3A7T^l
F)to'%17#o+CS_fDId['ARmD98K`%bFCAm$+EV:2F!+q'@psM$AKWC0A0>;'D/!g&ASu3jC`mS/
B4uB0F('>C+D>J1FDl2F+Unbf$;bb]@VfUmF!,[@FD)e=BOr;rF`MM6DKI!n:IH=HH#n(=D(Z8)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%A2'>:u@j!N\0Jst-0fh!D3\W8t$4R=s.3M3"@rH4'Ch7^"+E2IF05"j<+EMgFD.Rg0
GqL3^E-67F@;]TuB4Z0-@<,p%AmoCoCj@.EH#7D0FE2)*@;HA[+<VeNBln#2@3B/nG9C=3DJsf7
DJ()'G[k<(FD5Z2F#ja;%144#+>P&o+D58-+=D8BF*)AAARTFbCh4t'$6UH6+<WE^E-67F-Zip@
FDu83@;TIiALBPe/hSb/+EV1>F<E1g/ghbN$4R=b+<Wrm@rH4$@;]TuEb/cmF(o9)+EM47F_kS2
F*)G:G%De.DfQt1Df'H0ATVK+E-67UB4Z0-F*VV>ATVs<+>"^RD]iV9@qBV$Bl@m13t2N+$8O%Q
8TZ)!@<3Q"+Dkh6FCArr+Du+>+EVNEBl7EsF_#&+E,Tf>@;TIiATJu.DBO%7AKYMpAnc-sFD5Z2
+E(j7B6%p5E,uHq+<Ve8DIal2F_Pr/F"SRX<+ohcC2[X)Df9G7-uEdA.3N>G+C\c#Bk(RfCj@.3
+DYe9A7oHrFDhTq+<Ve>ATT&'Ec6)<A0>u-BlbmL+AcutFCB#qCh7Z1GAhV?A0>T(@rc-hF(HJ8
H#7D0FE2XL@;]Tu%144#+EM76E,96#Gp$s4Bl8$$Bl7X&B-9ehF*VhKASlK2Bl5&+Ec6)>F"SRE
$4R=b+<W6YFDi:6Bm:bBBPDN1Eb065Bl[d++Cf(nDJ*O%+DG^9@rH4$@;]TuDfBf4Df0V=@;]Tu
FD,5.@VK^gEd8*$+<VdL+DbJ3Dfp.EDe:,6BOr</DId=!CjB`4B-:]&D/aE2ASuT4Anc'mF!(o!
%14m?+B3#c+DG_(AU#S:DJ()5H#n(=D'3tBATJu'Dg5i(+Dbb5FE8RCAfu;9Eb$;1@;TRs+>"^Y
F(oN)+EMgF@W-((%144#+EqaHCh+Z6Bk;*k+C]%t+E1n4AoD^,@;]Rd+C]8-F*)IGAoD]4Cgh?s
AKYMt@ruF'DIIR"ATKI5$4R>!.3M,lDImisC`m\*FED)7DBNe)FCSuuDJ()5BQ&$0A0>o(E,8rm
AKZ).AKYr4AS,Y$06;8FF*)G:DJ(VDF_56"GT[G&+<VeD@<?!mBl7Q+DJs_O%13OO2(9Y6+EM76
E,9).Ch[cu+EV1>F<G+*Cij).F*VhKASiQ2BQ&$0A0>>m+CSekARloqDfQtEDfTB0/e&-s$8s=U
5p0fVDdm-k+=M)8DL!@8Bk)7!Df0!(Bk;?7+EqaEA1qb;@psInDf.4NF(KD8@rcL/F!,L7An?!o
DI[6#%144#+DGm>DImBiARmD&$4R>$.3Lo!E-624+A*bH<Cn<FEc5i;+D#G$+DGm>DImBiARmD&
$4R>%.3M5Y6m->hF*&OFF`&=?DBND,FD)e@Bl7I"GB4m8DIal+Bl8'<+EMgLFCf<1%13OO3@Q(C
:IH=CAS#Cn+CQC+ASc<.G%G]'+EV:*F<GL@ASuQ3F`8I6ATV?pCh7-"BQS*-+EMXMCh4`&ASc<.
AoD]4%17;tEb'5D%13OO+<VdLC2[WrASc<.-ZF3M-OgCl$4R=O$;bY^F(o*"AKX?R@;]^hF!,RC
+A,Et/e&.>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%14jF+@KdN+>PW)2'=S53\r]U0JO"D%13OO0e"5>@;BEsF*2M7+B<;n@rGmh
+DGm>E,ol9ATDU4+D>2$A8Ggf+DG^9E-67MF!+n/A0>MrF=2,^%13OO1+=>5Df0W1A7]d(BOPdh
Ch[d"+B<;n@rGmh+CT=6@3BZ'G]Y'MH#R=;Bl5&(De!p,ASuTuFD5Z2/0JLVB.aW#%144#+>b3[
F`\`RF`(o'De*F$AU&;E4&o$I6Vg*=4!u.'/hSb/+E_R9@rGmh+EV1>F<E1g/hSL\$4R=u.3Loe
A0<"'+EM76E,9).@q]:gB4W2qDfor>+D,P4+E(_(ARfh'+DG^9FD,5.A79Rg@UX=h/e&.1+<Xa!
ASrW2AT2Ho@qfgn+EqaEA90DB@VTIaFE8RHBOr<-H#n(=D'3>2EcP`/FDQ4FEb/ZiEt&I!+<Yc>
AKZ)'EbAs*ARlonDf'H3DIm^-F!+n/A0>AqARfLs+EV:.+DG_'Df'3+B-;)#D.Rbt$6UH6GA2/4
+EV:.+EV%4B4Z0-DIIBnF"SRX9lG)p+E(j7FD,5.AU&0*DKBA3De:,#DBO(@A79Rk%144#+E(b"
F`MOGGA2/4+EV:.F(HJ7ART+j/e&.1+:SZ#+<X6f+CQC5AT2Ho@q?cmDfor>+Eq78+CSekARlp*
D]j.8AKZ#)E,8rmARlp)FE2M6FEMV8+CP]d+<VeDBl7X+@s)U!+CT,*F`):DDe:,1G%G]-ART*l
GAhV?A0>>m+CSekARlp*D]iP.F`):DBQ&)($6UH6D..=-+EV=7ATJu&DBNk,C1Ums+D>2)+C\nn
DBNt2E,8rmARmD9+B3#gF!,1<+CQC.AU+^l+<VeJFCB9*F*),+/g)99BPD?sF!,R<@<<W)ATT&)
BOPdkARlol+Dbt<+CT;%+E_aJ@;Kb*3XlE*$6UH6+<VdL@4<=.F_>?4+CT=6BOu!r%144#+<VdL
+CZcBDJsV>G@bT,+Co&)BkM<pA.8kg+<VdL+<V+#+<VdsATW$.DJ()9DfTA2Ch7d$C`m5$@;]^h
+Cf>4DKKqBDfp.EDe:,6Ea`KmFD5Z2@;I'0ATDj+Df-!k+<Ve:Df0Z;DepP;H#n(=D0$h6F!+n-
F)N10+E1b'DD!%S<+oue+EqaHCh+Z*@;BEs8l%ha$6UH6D/XH++E_a:Ap%o4GA2/4Dfp.E@3BW*
B5VEqBk(RhF<GLFATDHq@:UKpDI[]u@<6!4%13OO+<Ve+BPDN1@q]:gB4W30Dfol,+ED%5F_Pl-
+CQC&BOPdkAKZ)5+EV:.+C]&&@<-W9CghU-F`\aEAdo(i+<Y3'FCAWeF(HJ+Bl%@%+ED%2A7]dq
DJ()2Eb0E.Dfp+DA79Rg@UX=hF!,UCEb/Zi@:F%a/e&.1+<X5uGAhV?A0>PoG%De<D]i\2+EV:;
Dfo]++CQC'F_u(?@;]TuEb0<6DfTDA+<V+#%13OO1asP7Df0W1A7]d(@:Wn_DJ()+DBNA*DffZ(
EZf=DF<GL@FD5Z2+EV:*F<GdGF_kS2F*)>@AKZ)+G]Y'=AScHsEt&I!+<YB9+EV:.+CoD#F_t]-
FCB9*Df-\-Df'H3DIm^-+E(j7DdmHm@rucE+<XWsBlbD8E-,f4DBO.AF_kRt$6UH6Df0B:+C\n)
AU%crF`_2*+EqL1DBNt2EHPi6FCeu*@X0)<BOr</F(KAE+<X6t+EqaHCh+Z&DI[]u@<5uh$6UH6
FD,5.F*VhKASlK2@rGmh+EM7CAKYH-+DkP4@V$Z;0J,+8+Dbb0ATJu'F`\aMDfol,%144#+Du+>
+CSek+CT/5+E)41Eaa'(Df0!"+E)F7EbK#mA0>K&EZeq7FCAWpBlds!A0>f0ATD4$Bl@m1/e&.1
+<XWsBlbD=H#R=;De:,1E-,f4DII?(A7]S!@3B/j@qfanFEo!CF!+n-F)N1<DfTD3Bl5&8F`(b"
$6UH6GA2/4+EqL-F<F-tA7]=h+E_a:Ap%oB+<XBsF*&OJATDj+Df-\-Df0Z;DepP;H#n(=D0$hA
Ea`Hn+:SZ#+<Y*/C`m5$@;]^hF!,RC+Cf>#AM,)J9lG)p+Cf(nDJ*O%+CT;%+EVX<G%kB$+CT.u
+DGk:ASbq$@;^0>%144#+@1&kFD5T'+D5V(F!+q;+CT)&+EV:.F(HJ9G@b2uF!,")B6%EkAKZ).
AKZ,;Bl%L*Gp%$;%144#+Cf>#AKYZ#F*)>@GqKO5%144#+B3#gF!+t+@;]^h+EqaHCh+Z/AT;j,
Eb-A%+DbJ3Dfp.E@q]:gB4W3-D]j.8AKXB:6V1$E<$6'sF`%Wq+<Ve9F`\aMDfol,+Du+>+DG_8
Ec5K2@q?ckDL!@6Bl7@"Gp$X+FCAWeF(HJ.DI[U%E+*j&@Vfb#Bk;?<%144#+:SZ#+<X'`Cij).
@rGmh+EqaHCh+Z%@<Q3)FDi:8@;]UlAKZ).AKYl%G9CsKEckl6F`M%9@;]TuAU%p1FD5W*%144#
+CoD#F_t]-FCB9*Df-\-De*E%GAhV?A0>PoG%De<D]iM#+Cf(r@r#Xd+CT.u+E27?F(o*"Gp$O+
C3=T>ARmD&$4R=O$;tGFASuT46YKnGB4Z-,FDi9o:IHfE$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=1,pCODg!6Y0JGF.0f(jH
3BAuV%13OO%15g<DL!@7BOPdkATKmT/KdV-G@>P8DJsV>F`:l"FD5W*+EV:2F!,"3@s)X"DKI"B
D]in8F*%iuDe:,6BPDN1GAhM;+Eq78+Du+>+Du+>+Du+>ARmD9+A!qsC`mM)AT/c$ATW$*EZf7<
FCfM&$>FB#FD,5.Ap&3<Eb-jG+@p'aAKYE%AKZ&4D.Oi'BkM*qBkM+$F#ja;%14g=+@C'bG%G]9
ARlp*D]hXp2D-[=+>"^XBPDN1G@>P8@3BDqC2\,8E+*Hu+CT=68ge[&@UX=l@grcREbBN3ASuT4
F*VYF@<`o=@<3Q$BOPdkARmD9+B3#c+Cf>#AKZ2*F!+t2DK]T3FCeu8%13OO1+=>ADJX$)AKYYt
CiCM*A7T7^+=LuCA8#OjE%)5'%14m?+@:3`F!,(/G\(D.Bl5%AA8Z34+=L`<D/a5=+CT.u+E)@8
ATAo;DfTB0/g(T1%14p@+@KpbFE2))F`_2*+E).6Bl7K)@X0)<BOr<$+>ti+1*C"9A8c?.E+*6l
@:s-oD..<jB4Z*+@;]Tb$=S$!<+ohc8l%ht:gn!JF"Rn/%14sA+@L-XF_t]-FCB9*Df-\?DId=!
B5_L%B-:c1FCf?2Bm+&1Eb-h6A8--.FDi:BAS,ai@rri8BOr<'@;^?"$=daXDJ*O%+E)F7EZfI;
AKZ80@<-EA%13OO2CTbDDg*=FFDl26DJ()#Cht4d:IH=HDfp)1AKY])+EV:.+Co1rFD5Z2@<-'n
F!+n/A0>MrDImisFD5W*%16N[C`m8&F*)G:@Wcd(A0>JuCh7Z?%13OO2^okA:IH=HDfp)1AKY].
+Du+A+E1b0FDQ4FF`(`$EZe;'@Wl='F(oQ1+Cf>-FE2;9/g(T1%15'D+AHcbBkD'jA0<:;@;BF'
+=M)CF"&5RD]j">De!@"F!,")E+NotASuT4@rGmh+EM+(FD5Z2Et&IjDBNS4Dfp"A@;]TuF*22=
AKYYt@:WqiF"Rn/+:SYe$4R>ABPD?sF!,RCA8aL<$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%14g=+@C'aE,9*-AKYN%@s)X"
DKK</Bl@l3Eb0E.F(oQ1/g)9.+CT+0E,8s#DJ=!$+EVgG+Eh=:F(oQ1Et&IpAfs]A6m-#Y@s)X"
DKK</Bl@lA+<XWsAKYo/Ch[cu+Eh=:F(oQ1+EV:*F<G:=+Du+A+E_R4ATAo'Df0W<Eckl6Bl@ku
$>FQ(@s)g4ASuU+Gp$d=F*(u(+C]U=7rN<YCh4u8+E).6Bl7K)A8bt#D.RU,+EVO?C`k--EbTW,
Cj@H^+<XWsATMDl$=n'bF_t]-FE8R7@;[2sAKYN%GA_58@:Wq[+CT=685r;W/g)9<BOu'(FD,5.
85r;W+CoD#F_t]-FD5Z2+DGm>DIm6sCj@-4$=e!kE,9*-AKXPeGA1l0+Eqj?FCcS9Df'&.8g%V^
A7Zm*D]iP.DK]T3F<G:>+EVNE9OUn3=>FG?+<XWsAKXZT<+T/SGA1l0%16QU+E_a:A0>u4+D58'
ATD4$AKYD(F(oN)Ch4`"AS,XoBln'4AKXf;7Nc5[@s)X"DKI"CBOQ!*GA1l0+C\n)A8-+,EbT!*
FCetl$>FB#FD,5.@UX=l@j"B>6m-#SF*)G:@Wcd,Df.0M+AZlkBl7K)A8bt#D.RU,F!,[@Cht53
Dfd+2AKYMtF*)G:@Wcd(A0>?(F:ARuBl.g*Gp%-=An?!oDI[6g/e&-s$8O%Q6Z6jcATDl8-u*[2
FDl)6F"&5CEcQ)=+CT.u+Dk\2F(&]m+D>2$A8GstB-;;7+EV:.+EM%+ASl!$F`V,)+C]U=FD,4p
$?($"ATAnc:IH=8CghC+ATKI5$4R=u.3LoeA0>u-AKYT'Ci"$6Bl7Q+DIn#7GAhM4F#ja;%144#
+CQ]A.!TWG.3L2o+Dbb-AKYN$C`m20F<GX9@<,jkATJu&Cht57AS5^uFCfK(A0>Ds@ruF'DIIR"
ATJu+DfQt<@;TRs/e&.1+<Y,B+=L]:CagJY/KekDCLnW!DJUG)F`\aIARTUhBOu6-@;Ka&@s)g4
ASuT4E-67FA8,OqBl@ltEd8d:@:O(qE-!.6DfQt<@;TRs/e&.1+<Y/C+=L]3ATT@D+>#/fAU&<;
@:OD#+=M,9D.P8A@;L't.3N&:A0<:<@;TR,@r,RpF"DKCCis;<+EV%$Ch7Z1Ao_g,+C\bhCNXT;
%144#+<VdL+<VdL+<VdL+EV:.Eb-A;Bl%T.@V$["D]gH;E-67O+EM77@q?cl@:O(qE-!-r<Duj>
:.82P;BS:p+@/\#78cQB/e&.1+<Y2D+=LcBF"&4`/Kf(FB6A$!EZeq<E,oN2F(oQ1+D,b4C`mh2
G]Y'LARTUhBOu6-@;Ka&@;Ka&DdmHm@ruc7Df-\:@<?08%13OO1asP5A7Qg"DfTD3Cggdo+>"^R
AS#Bp@3A0<6m+g-F*&O$Ea`I"Bk(^q/0IP\6m,HIDepOmEc5T2@;TjqDJ(R2$4R>".3M>nCLnVs
DL!@7BOPdkATJu7AT;j,Eb/c(FDi:CF`;;<Ec`F(<(8hiFCf]=+=L`<A7Zl=2CTb_DBNe)@rcL/
/e&-s$4R>=:K(5"C2[X!Blmp,@<?'90ht%f:et"h?YXLiCh\!&Eaa'$+E27?F<GOCDe!@"F)Q(A
-nR&#4ZX#Z%17/nDfp/@F`\`t7R9C14ZX]60H`D!0I[G<:-pQU-u*[2Ch\!&Eaa'$.3N>BFCfK)
@:NjkGAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU<(KSZ
:dIiE:I?6I+<VdL:-pQUAp%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*
E+*j%%15is/g+eIE,961+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps10:-pQU
BkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g+k?
@ium:+<VdL+<VdL+<XEG/g+bEEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;+$;No?+EM+9C2[X!
Blmp,@<?''+AP6U+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dO
EbTW,F!,FBARTFbCh4%_.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$
FCcg/$4R=j1E\_$0I\+l-OgDsAhG2V/h]I<-ZEL3A8bs*-:KO9+E1b,G%G\W/g*50HQYF4/mg@V
FDPP3.!''5Cht4n84c`V5u'gD6S'T-/M2-WEcYr5DC6kU/M8/5;BTLg/e&.1+EMC<F`_SFF<Dr+
:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAK2ATDj+Df-[G-S04FDK]T3/12khBlbD7Dfd*c4WlL4
3A*$=0ddD;AScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3ZrBMDIdZq+Du+>+EM+9+>"^EA867.F<FOR
8Q/GO:..lF-OgD*+EMC<F`_SFF<Dr184c`V5u'gD6XO8:De*ZuFCfK$FCefB3ZodtE+*WpDdt.B
+AP6U+E_a:+EqL1DBNn=DfB9.+E1b,A8bs#Df-\:@<?01%16ZaA1e;u.1HV`:IIuc8l%i^D.GC\
%16K8:IJS5<)5nX%156]4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+
DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a
+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dG
Afu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rp
FDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$
EbT?8+DkP/ATDKnCh\3,/e&-s$:\rS+F.O,EcW?p+D>2,AKYhuBl8$$Bl7Km+CQC3EbT]*FCcS6
Ec5](@rri0DeC27BOQ!*Bl7EsF_#')%16K8:IJS5GAhM;/g*_.DIn!&EZcQFF^f0$F(f,q+s:u@
BlbD-De!p,ASuT4AoD]4FD,5.F(oK1Ch4`0ARTXuD@HqpBOQ!*8K_PXA8Wc:+Eq73F<G[D+DG\3
Cj@.FBOQ!*8K_GY+Cf>,D/"*6Bl7Q+FDi:1DL$>;Bl7Q9+AQj!+A!\aD'3>,D/F!/FD5W*%172q
+D,>*Blds%DJ()6BOr;uATo8;ASkjiDJ=!$+CIf;6sq-LART\'Eb0;E%13OO?s@)OB5)68FDk].
?!n*K%14gB+CI<=2)f/eA8!]8D)*eT2.A=WB/VGSDeWWgAm[`0+Auc_Bl7K)FD,5.?tsUjCh\!&
Eaa'$?m&967Nb<!6m-PhF`Lu'+Cf>#AKYN%@s)X"DKIKR:2b>!FD,*)%144#+A!r(AKZ#)F*2MD
ARfgnA0>8pDe*ZuFCfK$FCei&@;]TuEb0E.F(Jl)BlkJ0DfQt1F`MM6DKI"EATDj+Df0V=De:+r
E+*WpDe!'$BQS?8F#ks-E+*WpDdtD<Eb@$S%144#+A!\c@;[3%D/aN6G%De<BOr<-Dfp)1AKYK$
A7Zm&Eb0<'DKK</Bl@l3A8bt#D.RU,/g+)(AKZ).AKZ#)CghEsA0<"&<)5nX?YXLiCh\!&Eaa'$
?Ys=]/e&-s$8O4V?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]TuAU&<.
DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr@WMtc
+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$=I(LDIb>@De*cl?k!HB:IIuc
C2[X!Blmp,@<?'fD.GC\%16KXDe*ZuFCfK$FCei&<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk%13OO
:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.C2[X!Blmp,@<?'g/e&-s$=IUeA8Gt%
ATD4$ARHWpF!+m68hWe46m,uU@<6K4B6%p5E$079@<<W2Ec6,8A7]fk$<q=\FCfK$FCcS6Ec5T2
@;TjqDJ*6'BQS?83\N.&Blmp,@<?("Ec5T2@;TjqDJ(S3Df%.ADId='/nf?DCagKJF`;;<Ec_`t
AoD]48g%V^A7Zm)FDl22A0>T(+A,Et+Co1rFD5Z2@<-'nF"Rn/%16'JBlbD-De!p,ASuT4FE1f"
CNCV;ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$FCei4%16'JAKYGj
F(HIM2BZL<F(HJ.DKBB,F(o`1G%Ddd<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(
De:,#+EV%5CG$`$F<G^DBlS9,Cj?HsCggdaCi^_1@:NsnFCB6++CT.u+DkP&ATJu.F<GO@F)u&)
Ch4`!Df'H-Ch4`"ATV?pCh7-"@q]:gB4W3!BleB7EbT*+%16Qi+EVXBCi!g'B-;,9ATAo8BOr<0
ATDj+Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?5%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=0lgoA
D_lQX@U`tn121E@FYdtr2)o\i?Tqj?8T&T\Ec`FC@:s-oDKTf*ATAo6AS,LoASu!hF!,17+A$Hm
ATDBk@q?c]ARfgrDf0VK+@C0fF)rIEAS,LoASu!lDJ()+D@Hpq+<Y',De*ZuFCfK$FCei&A8bt#
D.RU,F!,O;Dfol,+EqaECER))FD)e8DJX$)AKYE!A0>T(+E1b.ATAo*DfT\<%13OO?s@2[A1_nA
A8ba]%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*
A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu%15is/g+\=Eb/a&DfU+U%15is/e&._67sC(ATD6gFD5SQ
%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$+A,Et%15is/g)8Z
1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%15is
/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&
+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!ZD'138F_PZ&C2[WsC3(aF+AP6U+EDUB+DPh*+DkOs
Ec3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU
:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:sF`&lg%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b
/no'A%15is/g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu
+E_R4ATAo%Ch[Hu%15is/g)l.DJs\P3?VpJDII?(@q]F`CER_4@<<W9EbTW;ASrW&Bl%@%+D#e3
F*%iu:-pQU1,*HODDF$kF(fK9+Eqj?FED)3+D,>(AKYr#FD,_)$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&
DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5
FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`Hn
Bl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$>OKiG%G]8Bl@lP3Zot;0RHDf
6rm#M%13OO:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#Ed8*$8l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY
8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL%15^'6q9gJ8l%iH
8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPfC2[WqBll"CDe*QsF"\mM$4R>;67sBn
ASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--.1$>O'e@<6L$F$2Q,4$"a(De'u*De*p2
DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5l#C2[WpBl%@%4ZX]64>J$d
0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G@:UKjCghC++D,>(ATJu'@:O'^$7KY!CghC+ATJtF
-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Ys$4R>;67sBjDes6$@rri:@<-(#F`S[B
@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3RATT%V3[\Z\A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)
Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1+u(3]EaoOc%15is/g,:UA79Rk+Co2,ARfh#Ed8d>
Bl%@%%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5+?V#(Bkh]:%15Qr9LVlC3Zoh5
8l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO%14dOC2[Wn@<<V7+<VdLAp890FCcS9BQ&*6@<6K4
4"u"N8PDQO%14dOC2[X(FDl22A79R&Ap890FCcS9BQ&*6@<6K44#)(O8PDQO%14dOC2[WnDdm6c
F<D\KAp890FCcS9BQ&*6@<6K44#2.P8PDQO%14dOC2[X"@;BFb@<<V7Ap890FCcS9BQ&*6@<6K4
4#;4Q8PDQO%14dOC2[X*FD5Q%@<<V7Ap890FCcS9BQ&*6@<6K44#D:R8PDQO%14dOC2[X)Df9H5
A79R&Ap890FCcS9BQ&*6@<6K44#M@S8PDQO%14dOC2[X$DId0t+<VdLAp890FCcS9BQ&*6@<6K4
4#VFT8PDQO%14dOC2[X%Ec5Q(Ch4_3Ap890FCcS9BQ&*6@<6K44#_LU8PDQO%14dOC2[X%@<-4+
+<VdLAp890FCcS9BQ&*6@<6K44#hRV8PDQO%14dOC2[X*F(KB%Df00$B4>:b+D,h<Blmo/F(fK9
E+*g/+?MT17S-9B;[j'C$;No?+Cf(r@r!3/BOQ!*Anc'mF!,%=BleA=Bl5&)G]75(FCeu*A8-'q
@ruX0Gmt*/1E\_$0I\,68PDQO%16f]/g)Vr04I's+D,20BleA=Gp$X9/e&.1+EMC<F`_SFF<Dr@
Df'?&DKKH#+DPh*Bkh]3F(96)E--.DF`:l"FCeu1%144#F)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ
8.>o;Cia/?%144#F)>i<FDuAE+=BTU;GU15/KenEF)u&5B-:]&D/Ej%FCeu*C2[WsC3(M=@rc:&
FE8QV4sqI7+F,(SINU3p@LWYe+CT>4ATDlF+>=p567sC)BQ%<%@rHR#Dg<K8$>"*c/e&.:%13OO
:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16QeBl%<pDe*ZmFCf\P0ht%f.UmO7
Ch.:!A8G[rAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+A,Et+EMIDEarZ'9OUn3
==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,
ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq
+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT
6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bq
Ec5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGq^urEb0E.F(Jl)
.!g2cC2[X"@;0UdFCf\G%15is/g)o'D..]E1*@ukH?s=EA8PahDD#C,F=A>@A7T7^%15is/g)o'
D..]E1E\)"@r,^bDKKH7/7N%0.3N&0A7]9\$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(
DfT]'FED))+EVNEEcl7/$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.
%16T`@r,RpF!,RAE,9H&?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rt
F(HIV-UC$aC2[X!@<?(*3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,
@<?'.%13OOFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+Cf(nDJ*O%FE/Kr:IJ5X6miEN%15is/g+YH
EcP`/F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp">9IHp
@QcapHTHL+6r60K87,_&<*s!):IK,1C(1MkATV[*A8Gt%ATD4$AKYN%@grbS$?C''FED)=4ZX]5
H?smPDe*]nBl5:-$4R>;67sB.H?slb+DkP&ATJu9BPDN1Anc:,F<GL>+ED%:ATDj'+Co2,ARfh#
Ed8d>Bl%?'DIIBn+EMIAFE7lu-ZW]>FCf\E4ZX][5snOG?X[\fA7$HlATT&8Df9`>AU#aR?Z]k(
-OgE)AU$@!+?Op2/9GHJ%172gGWe)1-mpYmIXWMbATDj+Df-eKINpKn/3>P48l%iU9ggEQ@q]:g
B4Z.+EZfI8GRY!.FDjboFCf\G+Eqj?FCcS*Ddt>=Df9`>AU#aR/p(ZL-OgCl$;No?+A,Et+Cf4r
F)to6%16i[Ccsg%4$"a(De*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*
FDl)6F!hD(Cijnb3Zr'UDfp#8@<?(*-8%J)C1D&h$4R>;67sC'F(HIAH?pq]E,oN%Bm:bBD]iJ3
DeW`)@r,RpBOu6-GA2/4+=CoBA1&KP/h^aR@s)X"DKI"5Bl%@%%172gG\1Z+ATL!q+=K?_Ddt4=
/1)u5+=K?"H?pqf+=nil4s4TMC`k8U/j:C?-SBLPGUFUC$>ag/+Eqj?FCcdO4s4rYG\1Z+ATJ:f
%15is/g+eIDfp"A@WcC$A0>>iFCSu,F(96)E-*3S+DbJ.AU#>?FD5Q4+EV:*F<G(3D/a3*AKYVs
DImisFCeu*Anc'mEt&IkCgqO$Ch.X!GWdZ%-mpZs,CX9GDfp#J,CV9n/95ZIFED)=.3N,6@;]^h
F*)FF8k_QO8PDNO79C!+.!0Au:K(48C2@@%Bl%=%AU#XHGB.D>AKY`(@WcC$A7Ath4Y@jfDdt>=
Df9`>AU#aR/n/72-OgE(D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho
-RU$367sBW6q/;/Df'H-Ch4_u@<;qc%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/
F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]>DK^+L4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7
?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>AKYN%@k8u]@r,^bDKKH7/n/72-OgCl$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$FCf8s
FCf\P0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbdsAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_Bq
BQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4
D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]2
3ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU
+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!
/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QRGqgu^$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGqh&sF(fK9+E).6Gp"MMDe*Zu
FCfK$FCd(6@<<q-$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&
?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*
3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQU@s)g4
ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?
3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$?Kd#C2[X!Blmp,@<?''A8bre$4R>TEc>o)D.Pjk+=CoB
A8Gt%ATD4$AL@oo%15is/g+e<DImisFCcS-Ec6)>+DbJ.AU"XkC2@NoDEU$'B6%s-BlkJ1Ec>o)
D.O.`-ZW]N+DP_5Df9_?C2A!+FDPM2C2@g3Bk;K2C2@BuA7ZluCgqO$Ch.!`F=044+DP_*ASqqa
%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f
-ZW]O+Du@E-TsL59gM-E:L@OFDe*2tB4Z0--Y$t(@;^0uG[FogF=.M).!0Au:K(484*s">DK^+N
+Eqj?FCcS*Ddt=G0Onp1@;^0uGV3H6F=.M)%15is/g,%?D.RNpF)rIIATD5h$7I\Q3Zp+*+ECsG
+=\udEapg5$>F*)+>GH/Gp$X9/e&.1+EMC<F`_SFF<DrPBOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%
Bl%<h@<<qL-RU8h+AP6U+AbHq+Cf>,E+s-"+C\c$%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4r
B4YslEaa'(DJ((c@8pf?+>#c"-Tbs]E,K*$AISuXDIb@B+:SZ,%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6#(=KCghEsGW@cE?Xmn`@;^0uG[FogF>>^oASiQ1ASl@/AKYet
FCf\MFCf\>FCf<.+D,>(ATJ2hAS`J=/n&mI$=m^a+=]!Q@VcB^AS`J=/nB->$=m^a+=]!_EscGh
C`k2[Bk2GqA7]R".P>X^F:)PiC`k2[Ci<qnA7]R".P>g]@gZaXC`k2[Ci<nmA7]R".P>OUC^O]a
C`k2[Ci=D&A7]R".P>FQA-ujYC`k2[Bl%DhA7]R".P>1HB*r0\C`k2[B6jnqAS`J=/n]JY@Wca;
.10a&F*)>@H"q8.1,fXL%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.41*A.k.!KBE.1HUn$6Uf@?tsUjCh\!&Eaa'$?m'Ds
DIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu8%13OO+<VeJAS!nF>?,`Y
DJ(),De*ZuFCfK$FCe`+BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-
ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1.1HUn$6pc?+>GK&/hnJ#+AH9b
@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b.Ni,6De*@#@V%0+@rG`t
@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJAS!nF?tsXhFD)dEIP5,?A8c@,05"j6
ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4F(KH8Bl7Q+:K&BM@rH7++EV:*F<G%5
@;]Tu8l%htA8-'q@ruX0Bk;?<%13OO+=\KV.!&sA@WcC$A7TCpF"&5KDe*QoBk:ftFDi:3Eb/[$
AKYDtC`mh5AKYMtEb/a&DfTQ'Et&I!+<VeIAT;j,Eb/c(@X0)<BOr<'@:O=r+=L]ABl%<pDe*Bm
F*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt%144#+<Y`:FED57B-;>9+Dtb7+DkOsBPD?qF!,(5
EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRE$4R=b.NfjA@:WnbDdd0t@rc:&F>7/GDJs_ABl8!7Eb0;7
F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'oFa+<VdLBOQ'q+CHg9C3*c*AU&<.
DKBN1DK@EQ%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRm
ASbpdF(Hd0$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg+BN9!BHVD1BlbD*
A7TCrBl@l3@;K`h$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8F!+n3AKYK$D/a<&FCd'I7WNEa+Du+A
+E)-?8l%ha$6UH6+Cf(nDJ*O%+EqO9C`m5+DKBN5F<GL6+C]J++D,>4ATJu&DIal.E-,f2BmO30
Bl@m1/e&.1+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/e&-s$6Uf@>@:oQATV<&8p,)uFCfJ8
9OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]Rr
CND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?%13OO+=\LTDf'&.D.-ppDf[%0DIal3
ATMs7+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI5$4R=b.NiV?G9C:&B4Z0m+EV19
F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5$4R=e,9n<b/ibOE3B836+@1-_F`VXI
1-$m.1,(FC%13OO+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8FCB33F`8I8@;0P#Eb-A*DfQsm+?;&.
0d'q:FC?b7+CT.u+C\o-Df0)<%13OO+=\LA9gMlV5tsdU+DG_'Eb/[#ARlp*D]gbi3$;gRDf$UT
0J4JIBPDN1E+*cqD.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'F_qQp+<VdLCh7KsFD)e8Afth2DIIBn
F!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['ATT&:D[d$r+<VeM@;L'tF!+q'
FE_;-DBLYV@;]Tu1,UpA%13OO+=\KV?ug*l/0J>@FECn5@:X+qF*(u(+EVNEF*2G@DfTqB@q]:g
B4Z-,FDi:00fU=;1ghpF$4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1
ALDOA6t(?i%13OO+=\LAEd2Y5+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\L<?ugL5
?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG
C2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL0L^5*Eb0<5Bl@m1/no9MDIP%($4R=b
.Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a:IH=A@:F:#F(JoD%144#+BqH66m-;S@N]Q,
FCep"DejE"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8Z=-
AR]RrCNCp6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6Uf@?u9dt?m'0#E,9*&
ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@?tFFf+CSeqF`VY9A0>u4+E_a:+CJbkBlm]sBQINg
+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,@;]^h
F!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha9LW>3F(KG9Bl5&$E,ol/Bl%?5Bkh]s+>"^YF(Js+
C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1iDKB`4AM.P=ARHWlA8-.(E\7e.%144-+CIf?:JP:K
+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%htD.-pp
D[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<ATKIH<+ohc@rGmh+DGm>@3BAp@V'@.+A$Z&F!,UH
AS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:EeaF!+n4+CIf?6W-KP<+$hjAU&;>BlbD.G\(B-FCeu*
GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0%14=),9SZm0J5@G2'=In9jr;i1,pg-1,(FB+=Krq
D/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSekARlok9hAGU6r-iP;ICVbDfoq?FDi:0DIIBn@psJ#
?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B.aW#%144-+D,>.F*&Ns:IH=GASbpdF(HJ9
D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^EE-"&n05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1
A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB+=M>CF*&OCAfs]e
De=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ@<Q@'F`JUCAftJlE-#T4+=C&_:K0eZ9LM<I-T`])
6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtBD]j.8BlbD;ASbpdF(HJ7ASbdsBm+&1Ec5l<+D,P.
A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3BOu'(@:Wn[A0>u4+EV:.+CK8#EbTK7F!)iR-X\'5
BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa
#ukJ<Ao^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iAF(96)E-*a4AQWPb=)`D$CbBF:
Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>+D#e:
@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<
AQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$4."J$6UH6<+oue+Cf>-AoD^,F!,RC+D>\;
+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL%13CJE,9H7+<VeU@:WneDK@IDEa`p#
Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16EZdss2D-[<+D#G$ARlolDIakuCht5;
ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_ADf-\6BkCp!F*2G@DfTqP%13OO+=\LA
DIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=/e&.1
%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:@WNZ.Bkq9&FD,B0+:SZ#+<VdL
+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqP#mh%J+<VdL+<VdLD/"6+A4^ZL
Bl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hW$6UH6
+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,#mh%J+=\L"+Dtb7+DtV)AKYE!@;L41
BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc@<?Qu+EVN2$6UH6Dg#]4EbT&q
+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!/$6UH6
BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1+<V+#+<VdL+<VdL:-pQUDg#]4EbT&q
+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#
FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)?S[$^Bm;'L/1)u5+@K1-8Q\>T%144#
+<VdL+<W(CDCI_0+Cno&%13CJ%144#+B3#c+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<
F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu+<Ve?@<Q3)@V'+g+CSekARlp*D]hYJ
6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP#mh%J+<VdL+<VdL+<V+#,9nEU0J5@<3B8c9/KdMo
@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"A867.FCeu*FDi:2ATW$*EZfFGE,]`9F<G.*Bln',
B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$C1D1"F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUj
F`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu
+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB
6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n+<VdL+<VdL:-pQU;,f2@85gX@
Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&EZccF@rH7+Deru9AU%c8
%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.
E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@+CJr&A1hh3Amca(E+EC!ARmD&$4R=e,9n<b/ibOE
3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b.Ni,1FC65"A867.FCeu*FDi:CF`;;<
Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt+<VeFE+Np.+DG^9?u]pqA7]-kARoLs
DfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl$6UH6FDi:CF`;;<Ec`FGBPDN1An>Cm
F`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i%144#+<VdL+<Y6++=DAOEb'&rD.P((
$6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%$6Uf@?uKR`+ED%%A867.FCeu*
/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065Bl[cm%144#+<YN0Gp%!CF<G".
G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT?1+<VdL+<VdL:-pQU8l%ht
Eb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6+<VdL+AP6U+ED%5F_Pl-+=Cf5
DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE+E(d5-RT?1+<VdL+<VdLEb/lo
+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL+>,9!/e&-s$6pc?+>>E./ibmK
+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IGBl.g*ASl!rFCeuD
+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NfjOATo8=ATMr9F(96)E--.D@:Wn[A0>u4
+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k
+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"
DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'
BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)
@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL
/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o
+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3
D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=
+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe
$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s
$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3
/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S
@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$
A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&
/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\
EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qD
D_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?
@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p3
0KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@
DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-
I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF-
-qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF
?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*
+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%p
CLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6
FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6
DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2
%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG
/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[
+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1
%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.
DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD
.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk
+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL
+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN
8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5f
DBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7
ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30
AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0
%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:
$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-
ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6
ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/
@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL
+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b
+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U
<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>
D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!
F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/
A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$
ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3
Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$
A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i
:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#
+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$
F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%
67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/
:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D
@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P((
$4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB0
3ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;
?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2
AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4
A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?
+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo
+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:g
B4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b
@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<
BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4
Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"
Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgL
FCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$
AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]Y
F@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)
Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).
Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%
De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b
.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3
A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]
BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5
DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/
?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL
+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>
%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/
%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er
+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&s
G%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL
<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-
AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m
$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!
+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;
FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq
+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiA
ATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%
BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohc
F)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!
A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6
+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*
%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0r
A.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5
De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL
+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL
+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+
A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5
AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!
@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+
/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h
+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV
-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1
GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!
BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5
F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(
+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1
AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;
BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&
@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_
?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''
-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+
$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.
Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)
AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:
DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8
DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/
A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*
+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm
3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_
+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$
FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<
Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<
De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&
E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=
@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<
F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h
/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q
%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9
@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/
G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=
@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(
D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B
?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3
E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e
+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)
E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9
+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7
?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%
EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%
EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.
;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@
ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG
<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+
CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)
+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m
@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LA
C2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1
/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]
BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL
+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg
+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'
F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMt
Eb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7
CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol
+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1
F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<
025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&
An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b
/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl
/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4
@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.
0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0
+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,
Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB
9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3
A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od
@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/
Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#
+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$
$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;
G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,Oq
Bl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOC
De+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1
+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!
$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,
ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(
GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8
G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!
B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#
F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5
AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o
+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=
+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+
F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<
+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd
+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2
Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.
+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ
@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8
ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;
7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG
0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-
%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-
+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a
+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/
F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et
+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#
+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82
BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-
+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#
+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(
@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'
+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)
Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-o
A0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*
E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u
+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSek
Df-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/
AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu
+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3
DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_
6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*
Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP
2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7
+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63(
$6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;
Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ
@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(
+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&
De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.
@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#
.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@
AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8
+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"
A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,
/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'
@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#
Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b
/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e
$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(t
FD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(t
FE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&
1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#
D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8
E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO
+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@
D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08
/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-
F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17
+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b
.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o
+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'
Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#
%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4
+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL
+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5
DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-
F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9$6Tcb+:SZkBleB7Ed;D<A7TUg1,iiWDImisCbKOA
A7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[BuB-9WRBln'-
DCH#%%144#.Nfj6;G;-SBl5&$C2[W8E+EQg+Dl%-BkD'jA0>u4+E_a:+@oI2:fAKNDKBo2@:UL!
AfsWD<)>1V$4R=b+=\L3AS,LoASu!hF!,RC+A+pn+Cf(nDJ*Nk+EVNEF`V+:E+*6n@;[3%DKBo2
@:Uu"$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$r
ALS&q%144#.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'Bl@l3@:Wn[A1eu6$4R=b+=\KVE+EQ'G%G]8
Bl@m1+E(j78p,)uFCfJ8Cggdo+CSekARlo8+EM+*+EV:.+Co2,ARfh#Ed8*$%144#+<VdL+<VdL
C2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9SZm3A*<P3?Tmr
6$6g_F*&N[3@l:.0JPQs$4R=b+=\LWATDj+Df-\,F_u(?AoD]48g$,H0JO\ZATV?'E+*iuBJ'`$
%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b+=\LA
Ed2Y5+EM+(FD5Z2+CSekARmD9%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144#
.Ni,9DJW]'F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/
@;I&S@<iu<E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l3
3%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!
ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE
89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LG
Bl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E.
/ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*
@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*
F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu
%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5
FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LO
ATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'
A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0
Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#
+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#
.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJ
D/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N
1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&
$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=
AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUj
BOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/
A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMp
FCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]
BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5
DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3
Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1
Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8
E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYo
DKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-
DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5
+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM
6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3
DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<
CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_
@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-co
AKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!
Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a
+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-
+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0
Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1
De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@F
D]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G
@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+
Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)
F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1
@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKiCh\!&Eaa'$<HD_lCLqd41,Vfn/g,:XATDQtH#kTJ
AnMP[:-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!
DJ!Tq01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WU
Bk1d-B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,
3XlEk67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQ
A1hS2F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6
AM.J2D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*
FE21J;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU
,"$HmCb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$;No?%15is/g*nb<(/hj@rH7.DesQ<ARlo3
4==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<+CTG3Bk29-F`V+:De:+>4!u.\BOPpi@ru:&%13OO
7P[%[4&TX,@;BEs6ZmEiASuTOCi<`m+=CoBA8Gt%ATD4$ALAU)+Dkq9+=CoBA8Gt%ATD4$ALAU)
+Cf5!@<*J<-OgDMFE21J7P[%[4&]^4+@C9lEb0-14)\XP-p/kkD.Rr>.4cl0-YdR1A7]p3.4cl0
-YdR1-RgT/-ZsNFCi^sH+BosE+E(d5-RT?16Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:
E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"
H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=63
7Pm1\4%*XhF_;gpF`'9O@WHU/+=ANG$:Zp80fr?GF*&O'D/X3$4*#Fb+=CoBA8Gt%ATD4$AQ*Ga
CLo1R-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1gAA8Gt%ATD4$ARBA!
Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9>]aP%FEDVOC2[X!
Blmp,@<?(/+A[/lEcu/.GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<
EbTK7+EV:*F<G4-DImisFCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,02-)%
ATD4$ARBCsDeF*!D/F!)B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+Co1r
FD5Z2@<-W9B6%p5E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4
F_t]1@<?(/%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8Bl7Q+C2[X!
Blmp,@<?''DJsW.@W-1#I4bs9>\S:kD%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apo#+F(oN)
+DPh*Ch\!&Eaa'$+AbHqI4bs9>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkE
De*ZuFCfK$FCfkC8T&W]Eb8`iAUP!p%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?RH#R>8Ch[d&HW3O-;c#bT6r-0uHX'<aEc#6$<,ZQ!<(KSZ:dIiE:I?6I+<VdLI=5?f
Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)eD/U\aaF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%
I16NgBR+Q.EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<Ch[u6+<VdL+<VdL+FSZC6Z6gYASuTh
Dej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk::2b/i
@;Jn]CO9c-@:NkiARfgrDf-[?+<Z)\>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%
Gp%0MEbTE(I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3oDfT]'CfG=gHZNb?C2[X!Blmp,
@<?''+FSZC6Z6gYASuThDej]=Eb02uEb-A*DfQt>Ec5H!F)u&5B713r>\.e`HUqj`BP_BqBQRs+
B713r>\.e`HW+TdA7];"%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+CT.u+A,Et
I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y
+Cf>#AKYE!A.8lVDe!p,ASuT4FCf]=+DGp?E,ol,ATMp(F"SS,F<G"5F*2>2F#ja;%16?LAS5^p
HY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<WsdC`me;F`Lu'+Cf>#AKY].+EMXCEb/c(Bl5%c:IH=9
Bk)7!Df0!(Bk;?<%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCA8bt#D.RU,+D,Y&B5M3t
FE8R5Eb-A)Bln$"E]OX:+<XouAS5^pHYIS5D/"<-I16N++C&W&ASiPa@<--oDg-(AB6%p5E$/h*
@:WqiF#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*AQW1[F*2),Bm=3"
+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ$6UHrASu%*Blmp'
BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y:IH=<Ec6)>
+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j+DGF1BlkJ,
ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5F_#DBE+*WpDdso#
ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(+<Y-6@:O(aFE8R:
Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2DK@E>$7-f;+C'#"
G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)+DGm>D..I#
ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq4FVa.INWt[/o4s<
AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(>\.e`HZit@@UX@m
D1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=FEDkEDe*ZuFCfK$
FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#DKU1H@;]Tu9jqNS
G%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57F`&=?DBMOo
3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/+F.mJ+Dl7BF?0j<
%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU+<Xp&Eb/j0BQS?8
F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'+DGm>@3A/O
$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?8F#ks-@rGmh
/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_DKBo.Cht4d:IJ,W
<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImis
CbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,C`mG6+EqOA
BHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'DIIR"ATJu7AT;j,
Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"G]\%LHYRJ0Ch\!&
Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0BQS?8F#ks-
E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1+C'#"G]\%LHSR36
/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9+Ad)mDfQtD
ATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+@Vfsq+E27?FE8RD
Ec6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$I16Mi+<Xp'FCf;3
>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+80/5I?D/XH+
/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]qDKK<3+@p3ZBM<,Q
BQRs+B713r#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#
ARloU+B*Q'FCBD:882^MCh[NqFD5W*I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTs
A79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1r@X;e9f[/PKl#
ATD4$AKXT@7"$Zs$4.gt>\.e`HY%);D.R`rFCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!
Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'t
F(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$=%%O
B5)71G%G]'@<?4#I16O(AT;j,Eb-@@B4YslEa`c;C2[W1%17#a+?MV3C2[WnATf22De'u5FD5Q4
-QlV91E^UH+=ANG$>jU#+=CoBA8Gt%ATD4$AL@oo>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+AZrf
DBO%7AKXT@6m-#S@ruF'DIIR"ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#
D.RU,/e&-s$=%%OB5)71G%G]'@<?4#I16O%A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!Blmp,@<?'5I3:gfFCfJ8
D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)A7]9oCh[Zr+CT/5+A*bt
@rc:&F=n"0%16?LAS5^pHZit@@UX@mD1)j#Ci<`m+=CoBA8Gt%ATD4$AL@oo>\.e`HZit@@UX@m
D1)j#>\S:kD%-gp+B)in+CQC:DfTW-DJ()&Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6
ASu("@<?(%%144#>YJR*AQXCnBl%@%/g*GrC`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.
A8-'q@ruX0Gp%0IARfFdBk:ft@X/Ci+<Xp2AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%16?LAS5^p
HZit@@UX@mD1)j#F(KH.De*ZuFCfK$FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(
Gp$X9@s)X"DKI"3Bl[cpFDl2F%13OOF(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG
/g,@PDId[0Et&ItATV[*A8Gt%ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0Fa+?&>\.e`
HZit@@UX@mD1)j#>\S:kD%-gp+B!?"+C'#"G]\%LHY7A<Ch\!>+E)-?FD,5.B6%p5E$0FEFWbm:
DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4$6UI(ASu("@<?(%+C%TK<+T0\Anc'mF!,17
+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<+C%TK<+T0\Anc'm%144#BlbD0Bm+'*+EV:.
+D5_5F`8I@@;TR.%13OO>[h8WBl89@ATD6gFD5T?%16`gE,961+=CoBA8Gt%ATD4$ALATq67sBt
@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ_ASu%*G%G]'@<?4#I16NgBlmp'%144#<HD^o>YJR*AQXD'
D]iP.D/a3*AKZ).AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%LHY7A<Ch[uDI38t+%144#5p0WF
FCSu,>]aP%FEDVO@UXA,+EM%5BlJ/:BlbD@EbTW;ASrW4D]j.8AKY6"AU&<=FF/(?FD>`)Ch\!&
Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1@q?d$Aft>P@8pf?>TdNpD/a3*
@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=
FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&@<?(*I4cXFDfp(C
@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%Bk)'lAKYJr@<,dd
FCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#>]aP%FEDVO8l%iK
Blmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5>\.e`HY%);D.R`r
FCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>DKI"CD]iJ!C3=T>
/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=FF-VU6qh<:ATD4$
APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='%144#@rH1+D/ODI+B3#c
+Co%q@<HC.+DGm>AoDg4+C]J8+EV:2F!,=.Gp%-=F*2;@+DG^9Ci=3(+DtV)ATJu7F`))2DJ'Cc
+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XlE*
$=%%OB5)71G%G]'@<?4#I16Ng@V'1dDL65CCijB$DesKCHSg.T>]XIdFD5Z2.XPE7DId='DIIBn
I9d9h>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91Ci=3(
+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%LHWO*2
:eXGT8Q:*j+B3#c+Co%q@<HC.+DGm>0ek@)@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?@;L't
+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1Eb/`l
ARo@_+EqOABHVD1AKZ&9EbTE(+C'#"G]\%LHWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr6#:+Q
FB!0oHX(Z(G]\%LHTj&75(.i3%16?ODIe**DKTf-Eaa'$I16NuDe*ZuFCfK$FCfB6Bk;KqFCf\P
1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3$=%X`@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[s
G%G];Bk;L:$4:$[AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-
DImisFCfM#>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%Et
D/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;8l%htA8,OqBl@ltEd8d?Ec6)>
F"Re,>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&q$=%%OB5)71;eTTM
ARp2r>[h8WBl88gBkM*qBkM+$Bl7R3>?qS@BR+Q.EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<
Ch[u6+<VdL+<VdLI=5?fDf'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".K>\JD%ATDU$
DJOT?ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FSZC6Z6gYASuThDej]=
Eb02uEb-A*DfQt>Ec5H!F)u&5B71+lBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[Dej]6
Amo1\F(Jj'Bl@l3+<Z)\>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(
I0s4jDIe)bBkM*qBkM+$Bl7R3$=%.[A:%6g@:Wq[I0p;g>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!
Blmp,@<?(/+CT.u+A,EtI0p<dFCf]=FEDkEDe*ZuFCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4
DK?q/@W-C2+EV:.+A*bdDe*E%@;]T_A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@
ATKm>$=%%OB5)71ASuX-ATD4$AURc;/mSfhBlmp'$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"
+DG^98l%htA8,OqBl@ltEbT*+/dbitFCf:r+<X9P6m-,_Dfp"AA8bt#D.RU,F!+_0AU&<=FF,bc
3?VjHF)W6LB6%p5E,K*$ALDmK@<,od+<Xp&Eb/j0BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TA
DIdZq02b5)6qp*&BQS*->U+2rDIdZqF"M6;Ebf3(GA_hUE+*WpDds+s+Cf>,E+*j&@VfTuD..I#
A8c[0I3<WCG]Y'?Ea`TtASuU2/g+D1D/a08<+oue+DGm>FD,5.D/XK;+EM+7BlA-8$6UI-Bl.R+
@<?4%DBNk0+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4fpj9lG)p+E(j7D0[7:Ec6)>+CoD#F_t]-FE8R5
Eb,S#+Du+>+DkP-CLh@-DD!&'+CT+0F)5c=Cj@.5Df0`0Ecc#5B-;;0ASj%B8S0)jDfm14Df'H3
F(HJ,Ec6)>$6UI%De!p,ASuU2+E_a:+E1b,A8bs#D..I#A8c[0+CT.u+C'#"G]\%LHYRJ0Ch\!&
Eaa'$I3<`JCht5'AKYD(Ci=D&+<YN>Eb-A9F(Js+Cb?'"Blmp'$6UHWDL!@;Ec6)>+Cf4rF)tSu
Df9`8DffQ;5p0EDD/a08B6%p5E$/Y,@<6L<+DGm>@3A0<6m-,_Dfp"AGA2/4+CPU"+<Ve;ARfOb
Eb/c(Ch[s4+E(j7Bl8$(Eb8`iAKYE!A0>o2Dfd+GDfTB03XQuP+<Xp2AU&<=FF-SK5sn(B:JsSZ
I9^?#E+jT2Ec6)>DIIBnI3;s9A-sG%+<Xp2AU&<=FF-n]:K1Ck;FFH3>\.bkBR=B4Dfp#:@;TS(
/g+&1Dfd+GDfTB0+CT)&Dg)O2+<Ve3FCf]=FEDk<Ci"-'AoiACFDi:6Bl7H(@;Ka&FD,5.GAhM4
F!,R<@<<W$ASc:&B-;;7+EV:.+D5_5F`8r?+<VdL6Yp1PF!,+9Dfp#?+EVmJBk(RfCj@.>Ddd0!
Bl8$2+Dbt+@;KLr/g+D@AU&<=FF.b@A8Gt%ATD4$AM.\3F+"B<+<Ve@F!+n/+D#e+D/a<&+E(j7
@3B&r@<6K4B6%p5E%ZP]Bl8$(Eb8`iAKY].+CQC6Bl.g*AKXSfG%G]'@<?4#$6UI#Ci<g!+EV:*
F<G:=+DkP-CLq$!GA2/4+CQBt9OUn3=FP=&@ruF'DBNG-D/E^!A1eunG[YH'DIjr4BPDMp+<Y<;
Dfp"HF!,"3@s)X"DKI"+FCf]=FEDjb+?:QTBle59-YdR1Ch\!&Eaa'$-[d+LDfQt/DBNM8@;Tt"
AM+;s>[h8WBl89@ATD6gFD5T?$7-g2@<?(*+EM+(FD5Z2+:;@pF^fE'@ruF'DL5W1AU&<=FF.Y@
Dfp#:@;TS(+A$HmATDBk@qC&q$@[GQINWt[/o#eAB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.
AU#>0DfQt5Ec6)>+=MLa$?Kd#C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pj
IXZ`pINTa?>\.e`HZit@@UX@mD1)arBlmp'$6UHdDf..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.
+A,Et+D5_5F`8I:ART+\Ea33pDffl8FCfeuBPDMp+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)
BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--pA-sG%GA2/4+E2C5F_#DBE+*Wp
Ddso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI$6UI#Ea`HnATVu9
AoDL%Dg-7FE+*WpDdso2Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK$6UHrFCf]=
FEDkEDe*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.Ebf5s
+Dbb-AI9P&FD,B0/d_qj@V'1dDL6P<EaiI!Bl/8*:-pQq4FVa.INWt[/o4s<AU#>8F_tT!E_L1b
ATJu8FCB337WNEa4X)U)+FOSl67tGcIXZ`p+:;@bDIe*;ATD6gFD5T?$=%.[A:%m*F_t]1@<?(/
$4:$ZF^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt6$=%[aG]\%LHYRJ0Ch\!&
Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u+AH9S+Eh=:F(oQ1F!,C5$;)pUAoDU0DJsW.
HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I0p<\D]j1D
AKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc$4:$IAS5^pHY%);D.R`rFCfl)0eQ`=>\S:k
D$hC.8T&Tk@;Ka&8l%i-$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FME
DK@IDASu("@;IT3De+9C8l%j'+DGm>@3A/L+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn
+EqOABF5k)>\J.hAp\35FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,01nN(I="RP9RSN#>\S:k
D$hC.8T&Tk@;Ka&8l%iR:K::[74noi+C&T#AS-:&FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-
BeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR:K::[7=>Lc+DGm>@;L"'+CQBb+CSekDf.0M
8T&Tk@;Ka&BlkJABln#2>]aP%FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et$6UI%Bk)7!
Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?.-+C'#"
G]\%LHYRJ0Ch\!&Eaa'$/q"(3Blmp'$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.h
Ap\35FDu:^0/%9QDIdZq/oPcC07A1d@;]Uo@sos:+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+
AU&<=FF,bq3A*$=0mt0QDIal!AU/33A0;4%+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9
+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqMn+D,P.Ci=N3DJ()$Ci<r/
E,Tf>F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TC+<VdL+<XouAS5^pHY%);D.R`rFCfk-#p:?q
Blmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B
05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]Ok
B4stQB4uC$DJ+A)#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq
+C\c#ARloU+B*Q'FCBD:882^MCh[NqFD5W*I0p9'+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-5
9PJT[Eaa'$+A,EtI4bj5+<Xp#DIe**DKTf-Eaa'$I0s4nFCf:r+<X!nBl%<&>]aP%FEDVOC2[X!
Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g%beDfp"O+A,Et$6UI.@;BFq+A*bt
@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO$4:$IAS5^p
HZit@@UX@mD1)b3AT;j,Eb-@@B4YslEa`c;C2[W1$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE
+E(d5-RT7<Ci^^HC2[X!Blmp,@<?'.$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.:N0l_+EV:.+A,Et
+Co1rFD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB$4:$I
AS5^pHZit@@UX@mD1)b0A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I$=%.[A:&K2EaiI!
Bl/8*>\S:kD$hC.9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVO
C2[X!Blmp,@<?(/+DGp?@ps6t@V#lh+Dbt)A7]9oCh[Zr+CT/5+A*bt@rc:&F=mn->[h8WBl89@
ATD6gFD5T?$>aWhA0<77De*ZuFCfK$FCcg,>\.e`HZit@@UX@mD1)arBlmp'$6UHiATT&'+EqaE
CM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJu2@<--oDg-(A@;]T_
+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+G
F)Y]#BkD'jA0>?,$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B<$=%%OB5)71G%G]'@<?4#I0t%,
FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-70F(KH.De*ZuFCfK$FCcRB
05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU12>\.e`HZit@@UX@mD1)arBlmp'$6UHhF`&=,FCf]=
FEDkBEc>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/g+D@AU&<=FF.Y@E,961
I0q)>B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=
F<Fg^@8pf?IV*;1AI9P&BlbD0Bm+'*+EV:.+D5_5F`8I@@;TR.$4:$IAS5^pHZit@@UX@mD1)b(
Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT[>uASu%*G%G]'@<?4#
I0s4nFCf:r+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=
FEDkBEc>i/F=qta7VQ[MEsa$4D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS
+C'#"G]\%LH['+<@<?(*I3<HK$6UHrFCf]=FEDkGF^])pFCf]F/g+;8F`JU7BQ%TpAKZ22Cht5'
AKYMt@ru.$ARlomGp%3BAKYr4ATMF#@q?d$AdTY'<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH+
+Co&*@;0P!+EM+*+EV:.+E2@4@;TIiAKYT!Ch3qr+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m
/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98E>\.e`HY%);D.R`rFCfk-$<1\MEb-A%Eb-A7
Df'&.>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#A$=%%OB5)71ASuX-ATD4$
AURc;/mSfhBlmp'$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:g
B4W3-BOr<(F_tT!EZf:4+DG_(AU"P)+Cf>+F_u#;/g+,,AKYMpAmoguF<G:=+D,P7EZeh6F<G[=
BlbD6@<iu9ATN!1F<G:8+Dbt6B-;)#D.Rc2Ecl8;Bl7Pj+<YcEB4Z0uATBCG<,WmiARfal@<6!&
DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XQ4!@V'1dDL6P<EaiI!Bl/8*>[h8WBl897
F_l/6@rH1)I=!f!>?l5\@ruF'DCU!<Bl7HmG]$r,AURhk>\.e`HZit@@UX@mD1)arBlmp'$6UHr
FCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+
Esa$4@rH7,Ec5c1ARlomGp$@6AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(n
Ea`I"ATDiE$6UHYBOPdkAKZ).BlbD?@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3
/g+59@;p0sA0>]&DIml3@<,od+<YWDARf:_A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\
9LV68I3<`JFD)e-AS,@nCig",+C%3KATDllDej])FCf]=FEDjn/hSb?I=3^T>\.e`HY%);D.R`r
FCfk-C2[X(Dfp)1ATMF)F`9)j:-pQ_C2[X(Dfp)1ATMF)F`8HG+EK+d+<Y07ART[lF!)T6DIak4
+Dbt)A9/k9+A,Et+<Y3+G%GK.E,B0(F:ARP67sBkBk)7!Df0!(Bk;?.Ao_g,+A,Et+CoV3E-!W@
$;No?%15is/g+,,BlbC>+EM%5BlJ/:+<Y07ART[lF!)SJ@;]Tu+Dbt)A9/k9+EV:.+<X9P6m*Tp
A7]pqCi=90ASuT!$;No?+Co1rFD5Z2@<-'nF!)lGDe*BiFt=aYC2[W6+E_d?Ci_$X+<XX%+EDUB
+EV:2F!)TH@rc:&F<D]JBOqV[:-pQUAoDL%Dg,o5B-;&6F*&O<DerrF%15is/e&._67sC(ATD6g
FD5SQ%15is/e&._67sB7.3M5*3%cn0/NGF;GT^U:EZeFtDId[0F"AG.@:Li29PJBeGT^jGF*&O6
AKY])F*(i,Ch7-0%15is/e&._67sB8.3MT'AKXT@6m,oKA8c?.D09oA+C\n)Bl8!6@;KakA1f!)
F(HJ5@:O._DBO%>+DG_7FCB!%%15is/g)8Z+D58'ATD3q05>E9%15is/e&._67sB9.3MT'AKXT@
6rQl];F<kq@:WneDBNe=F*&O6AKY])F*(i,Ch7-0+B<Jo+E1b!D..<)FDi:9DKBo.ChsOf:-pQU
+<Ve>ASu("@;IT3De*p-F`Lu'%15is/e&._67sB:.3MT'AKXT78PDQO+CSekDf-\7F`VXI@V$Zr
DKBo.Ci!Zn/g+/8AKYr#@r5Xl+EVNEBl8!6@;K`h$;No?+<VdLA79Rg05>*5Ch7Ys$;No?+<VdL
%15is/g)u"+B3#c+Co2,ARfh#Ed8d;3a?E<A9)U,FBfq:GA1qD+E)9C05,9@AM8BU85DrKI4o>R
A9)U,F>"abCh[d0GUX(/:-pQU+<VeDF`VXI@V$ZnD/aTB/e&._67r]S:-pQU2(9YCD]hYJ6m-#S
@ruF'DIIR"ATJu<Bln#2DIIBnF!)lGDe*BiFt=bNDe(CAF`_>6F"&5CG\M5@/e&._67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0l:?E1,KFI:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0em3M@kftd@:Wn[A0>c.FCcS'@W-C2+CT;#07%>O+D,%rCisc0+E)-?2DcOcBlkJ=H#n(=D0$-n
:-pQU0fX#YE\TEoEb0*+G%DeBAnc'mF!,")E+NotASu"'+>"^[Bl%T.DJs_AEcl7BDf-\+Cht4d
+EMgLFCf<1%15is/g)o'D..]E2'@!PF*(u(+EqOABHS^<De*ZuFCfK$FCcm1$4R>_AT;j,Eb-@@
Anc'mF!,R5F))n=AS5S!+Co2,-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf
6#(=KBl8!6@;Ka?3B:G03Zoe95s]7(A8,q&FCB!%3B9)I+BosuDe3rtF(HIV-UC$aC2[WsDKBo.
Chu*l3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ATW'8DK?q@ATN!1F<GL6+Dbb0Fa,Q^DJ=><
@rH4$@;]Us+CT=6FCf]=+EMXFBl7Pm$>=@!F?MZh3Zp1$3\V[(-mp3G+=nX@+=nW_+FJPZFE2M8
.46<H%13OO:-pQUD..3k+CQC'Bl[cpFDl2F+=JreF*1u&ATMoD+>=pM@;0P#Eb-[/$>j3eARoLq
4ZY;@3]/$@3\WT($4R>;67sC)EbTW,F!+m6Ch[s4+E(j7@X3',F!,RC+D,>(AISujEbTW,4ZY;@
3\hg`?p$\,-o3V*5!UMP+Z_;+.1HUn$?Kd#F`;)6A92[3EarZD3Zp4$3Zp*c$4R>;67sa/ATW'6
C2[X(Dfp)1AKW+=/M/(f@rc-hFCfM9+CT.u+<VeCDdd0t+<Ve!:IH<JA7]pqCi=90ASuT!$;No?
+Co1rFD5Z2@<-'nF!,(8Df$Uh:IH=9F_u)=/e&._67r]S:-pQUD/X<#A3(hUF(KH9E,'<%F)Q2A
@q?d*F\-4`DfTCu$4R>VAhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9D..L-
ATBD;C1\h9A8a(0$6UI4D/XQ=E-67F-Ugp2:Js4r8l%ht@:WneDBNY7+Du+>+DG_7FCB!%ARm/2
Eb0?8Ec*K=$>"$pASGa/+>#3XAU%p1F<G=:A9qs/4Y@jlE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A92[3EarZ6C2[WnATf\?C3(aFA8a(0$6UI4D/XQ=E-67F-Ugp2:Js4r8l%iR:K::[73H#LA8c?.
BlbD7Dfd+9DKBo.Ci!Zn-QmG@FEMVA/e&/!Cia0%AhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IA
@<>p2C1_0rATKM>Anc'mF"V0AF!i)@D_;J++<Y`BDfp/@F`\`R78d#Z;E>pm7S-9B;]oLZA8c?.
BlbD7Dfd+9DKBo.Ci!Zn-QmG@FEMVA/e&/!DIb@/$4R>_AT;j,Eb-@@B4YslEa`c;C2[W1%13OO
:-pQU8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.Bl5&6AThX*F(HJ5@<?0*DfTB"EX`@dBk)7+4Y@j=
3[]&lBl%i5C2[W*C2[WnATfF1$>F*)+>G!M/g+\=@ruc7AM,*DA0<6I+CoCC%144#F)>i<FDuAE
+=BTU;GU1O+EMI<AKXT@6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu*G\M5@-QmG@FEMVA/e&/!
DIb@/$4R>;67sBpAftM)8l%iqDf9_?AoDKrATAo-F!,")Anc-oA0?#9AKY]/%16f]/g)Nj-Tuf/
C2[X'Df9_\/g+nJ@<?0*-[nZ`6um3aF>#!aA8a(C+:SZ#+AP6U+E)@8ATDL+AKZ,:AKZ).BlbD-
AS,@nCigd/$6UI+De*m,Dfe,p+=AgWDe(LK+:SZ#+DGF?+A#%(8PUC=D_</IDe*m,Dfe,p+=CY[
-S0"NA9)U,F<D#"+<Y63F(HsH%144#+<YE;A9)U,F?M6!-qm)Q/M;JpBQ%s6+=C`1BQ#"=85DrK
-RgT]De*m,Dfd*2$6UI&DIb@/$>"*c/e&-s$>F*)+>=p$+<rT`A8-',C2[X'Df9_?A8a(0$6UI.
@;BFbBlY=YC2[X'Df9_,$6UI4D/XQ=E-67F-V@0&+EDC=F<G+.Eb/a&DfU+G@rc-hFCeuD+=A^T
De*m,DfcEqAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr<YDIm[(FEo!$:IH=GDf9_?A8-'q@ruX0
Gp"\&+=A^TDe*m,Dfd+BATW'8DCuA*ASu$2%13OO:-pQU@rc-hFCcS*Bk)7!Df0!(Bk;>p$?L'&
F`_SFF<GI4G@VgE0RI>E@ruc@/3IZcA9)U,F=]L-HXpi#FE7luF)>i<FDuAE+Dtb7A0<9THXpi#
FE8l^4DJeFEc5l</3>S5A8,OqEt&ItD/XQ=E-67FDIn$&+=K!lA8,OqF"&Y&C2[X'Df9_K4#2.n
Bk)7+%13OO:-pQUEcl7BA8,OqBl@ltEd8d<F_u(?F(96)E--.1$?U-(E+*j%4Y@jlE+*j%+=DVH
A7TUrF"_0;DImisCbKOAA92[3EarZ6-OgCl$>+3s?Y!k\F=n\HBk)7++CoCC%144#A8,Oq4Y@j=
A8,Oq%144#F)>i<FDuAE+=Bj$@:X(iB0%._/7`I)F:AR"+AP6U+DG_7F`M%9A8,OqBl@ltEd8dH
@<?0*DfTB"EX`?u+E(d5HnHg23b2r7FC/a"A7^!7HS/iC@ruc7>9G^EDe't<-OgD*+AP6U+Dbt)
A0>E*D/^V=@rc:&F:AR"+>=s"0H`K"D/aH&FD*49Bk)69-SB+JF!hD(+<XEG/g+kGF*2M7+EqB>
Eb0)rBl5&-DBO.AEbfB,B-;#/@ps1b%144#@rGk"EcP`/F<G[BE,9H&?U6tDC2[WsDKBo.Chu*l
3F<4&+<XEG/g,1GB4YslEaa'$+CfG1F)rIEAS,LoASu!hEt&I!+EVI>Eb/j(4Y@j2+D5M/@WNk[
+FPjbEb0E4+=ANG$6UI4D/XQ=E-67F-UVomF)rIEAS,LoASu!hF!,+,DImisFCeuD+=A^NBk)5o
$>"*c/e&-s$?L'&F`_SFF<Dr0<C9,B;c>_"Eb/ltF*(u6ARloU:IH=9Bk)7!Df0!(Bk;?5+BosE
+E(d5-RT?1F)>i<FDuAE+>b3ZA0<6I%14Nn$4R>`ATW'6C2[X(Dfp)1AKWZ9$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDC2[WsDKBo.Chu*l3F<4&D..<rAn?%*C2[W<0ht%f
+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U
:JO&6-S[5-/i"P$+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0
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
CLqO$A2uY'C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC
:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5%,%15R#
9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/
DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9
/oY?5%17&bAn5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T
@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJ
ATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)
8l%iA@:O(qE(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$7QDk
;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuC
A1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;
@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16ukFCep"DejD:FD,*)+EM47G9CR;G9D!G
+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).AKYMtEb/a&DfU+a%13OOC2dU'BHS[O
@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=
AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2o
F?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"
%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p
/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ
8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hen5+>"^HATfF1
$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p
/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<
%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2
F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*Bi
Ft@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8
+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,
A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?s
AKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(
Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4
Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*+
+Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,A
A7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.
+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$
DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlO
F_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%
GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UH
AKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q
05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZ
AKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37
/T>-2AM4K".1HW'Eb]?-A25l767sa,Eb]?-A0>qF/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is
/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>PW)2fE2J0fL4`A7T7^+F7X6Ch7Ys$;No?+>PW)3,`;K0ejeZ
A7T7^+@/pn8P(m!+CoV3E,uHq:-pQU1,(CADe!lD1a$LMF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+
DKKe>C2[WnATf22De'u5FD5Q4+E1b0@;TRtATDi$$;No?+>PW*3Fl]20K(%oATr0/FED)3+D,P4
+A*b:/hf"&%13OO@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151N
A7T7p+DPh*+E_d?Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdG
EbfB,B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l\De*KfBkhQs?Tg"a-YdR1F*)>@AL@oo%15is
/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KB6%s$
CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX67sB.BkhQs-Qm&5F<Gua
+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.BkhQs-Qm&5FE2UK4$"a2F!,(-EZf(.@j`B.$4R>;
67sC"F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARloU:IH=LDfTB0+DG^9DdmHm@rri0De!3lAISu7
:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb:4@U=%16Ze@<6!&
-[U;;IXNRQ$7I91-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgD3%13OO:-pQUF(KG98l%htF`V,7
+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKAE_BthF!,L7
F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrGDe*g-C/o=dEbf63F!iCZGB.D>AKY`,
@<?0*-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<Dr':IH=EEc5](@rri7ATW'6-OgE%
Eb]?-A8Gt%ATD4$AMPu867sa,Eb]?-A8Gt%ATD4$AKZ%G/KeeHA8Gt%ATD4$AKYr4De`inF<GX9
FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq.*Gp"jr
1,'.E:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT
,:@2BAU#=F.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;
67sBjF`MM6DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%JP+=CoB
A8Gt%ATD4$AL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<
B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX
67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgD1BkhQs-Qm&5FE2UK4$"a$B6#,/
An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ftC2[X!Blmp,@<?''GAhM4F!,17
+E(_(ARfg)Ci<flCh4%_:-pQU6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%15is/g,4P
Dfp/@F`\aFEZc`VISP??-OgDX67sBlEaa$#+=DMb:4@U=%15is/g)Pi@4*U@De*KfBkhQs?R[+1
ATT%BH[\_=I4#I2:-pQU.1HUn$;No?+EM+9+DPh*Ch\!&Eaa'$+E_a:EZf./H#k)[+ED%5F_Pl-
F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)-OgD2FDj]G;cFl$
+F?-l/0HYiE+rft+>b3RATT%BC2[X!Blmp,@<?'\F(KB-AU/>E.3NhTBlmo/C2dU'BHS[O@rH6s
BkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-YdR1Ch\!&Eaa'$+E2@>C1Ums+EM+9F`8HT+E2IF
+D5_5F`8I;F!)h]C2[Wq?YO7nA7#cQH?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]n
Bl5PFAU#XHCghEsGT^U4Ch54A8l%htF)Q2A@q?csEt&I&+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4
+Cf4rF)to6/g+,,BlbD/Bl%>i$7-g'F)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+G
D..NtEbSru%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*
Bl7Q+FD,B0+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,T
H?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8Pah
D@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&
@<?(*+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuV
H>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,U
D.7<m/p(ZLI16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8
Bl@l6IXWLa8l%j'+B*3$EarZ'6Z6LHI16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.
@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+
D/OE+E.*'hASli)$=%X`FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi
%16?W@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(p
F`_tVH>7A/Df.1LAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ
>\S(pF`_tVH>7A/F*)>@AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm
$=%I[GApu'AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.
DesJIFCf]F%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3
FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.
FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3  ~>
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
:f9_O8Q[*:;F+,U;FO&H=B%^k+CSekCi<`mF(96)E-*fWA7BP$DffQ5E?Jk3Ec#N&@:NkjAU#>0
DfT]:AU%p,A7^!sF!,+9Dfp#8@<?(*+D5_6Ch[u6BkCd`ASkjrCLeQ%An)rtDId='GB.,2CghEs
GT^g2FCf]/Ec#6*CLeQ)@<--oAo`*6Eb'56D..I#B45k&BkM<+F(KH&F_PZ&A8-(*+EM+9BkCd`
ASc'uCNCV>ATV[*A8Gt%ATD4$AKZ,7A79RkC2[WnBleB:Bju4,Bl@l3GAhM4CghEsGT_3N@;pC1
@Vft#B.#,Z-p0UR/mg=U-Qlo>ART[l?YXLiCh\!&Eaa'$?Z]k#FC])qFD5Z2@<-'nF!,")F*)G@
H!b<)A8Gt%ATD4$ARBOjF*(r,@ruF'DIIR"ATJu/De*ZuFCfK$FCeBfDeio<0Hb1M@:W_[De*Zu
FCfK$FCefXD/X3$FCfN80JFk'/1<VC4"akp+=A:HDe'u*De*ZuFCfK$FCcS0De*p2DfTD3F*2A;
Df9M@.4cl00I/>$/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IIrrFCfN#D.Fb]:IJ/X:J=\R
<CokP84c`Z:Jt=<:J=/K:IIrrFCfM9:et"h?YXLiCh\!&Eaa'$+B2-):L?^i6sjeA+B2-):L@jT
A8Gt%ATD4$ARB:b+C]J-Ch.:!A8,e"+C]J-Ch.:!A8G[rAU#>,F_PZ&C2[X!Blmp,@<?'s@<?(*
+Cf5!@;^0uG[FogF<G72F*)>@H"q8.+D>J1FDl2FC2[WnDdso)De*ZuFCfK$FCeHnATDQtH#k*C
De*ZuFCfK$FCeftG%kN3?Z]k(+DPh*Ch\!&Eaa'$Dg#i+G@,H'GT^a>A92[3Ear[%ATW'6+DkP)
BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A@q?d%Eb]?-A0>i3C2.Zt
Ch\!&Eaa'$+F8?[C2[X"@;0UdFCf\E.4cl01*AA3,Vh&/0JG@<3%d'G3AN?I0f_391,(I;0JtU>
/iGUJ1,(C>0d&5*1,(C>0K:[B2*!HL1,L[D+>PW+0JG@<3%d'J0K(gJ1GUp41,(I;0JtRE/iPIE
0etXA1c6C20JPRB1,1U<1cRKS1,C^B1*A>+0f^sD0f1L>3&roQ1G^gB+>PW*3AE9D1bLUE3B&]L
1G^d/1,(I;0JtR>/i>LC2`NfR1bp1/0JY=92).'C2E!EP1c@<R3?U(21,(C>0f(F<2_[!B1,q'K
+>PW+0JG@>1G1OB1H7?O2)R<81,(FC0etI?/i5OJ2_mBJ1,0n,0JPRB1,1U<1cRKS1,CgK1a"P-
1,(C>1,CO?2)$dB0Jt^E+>PW+0JG@>1bLRB2`3NO3B/i<1,(I;0JtUA/i>LC3B8uX3?U(21,(C>
0KCaC3Ar`K0ekF>+>PW+0JG@<3A*-D3A`TJ2*!Q;1,(I;0JtR=/i5@B3B8iK1cZ[60JY=92)%!B
2)@3I3A`ED2BXb/1,(C>1,LU?3&ilU1GCaH+>PW+0JG@<3%d*G1b^gH2`!021,(I;0JtUA/i5RD
2`NWS1c$700JY=92).'C2E3TP2)@'D2'=Y.1,(C>0fUdD3&!?I2DI$G+>PW+0JG@=3%d*J0JYOB
1,La/1,(I;0JtUA/i>=A2_d9N2DH=00JY=92)%!B2)I'H2Dd0I+>PW+0JG@>1bLRC0f_*K2E<Q9
1,(I;0JtOD/i>UB2)@3K0f1".0JY=90etL:2`*?L1Ggg@+>PW+0JG@=0eP=?1,:jL0f_'51,(I;
0JtRE/iG^J0f1[@1cHO40JY=90ek[@1bh!M1GgpB3?U(21,(C>1,CO?0fM'L3&!0F+>PW+0JG@<
3A*-C3&*?N3&<H81,(I;0JtOD/iGL>2DI3I1,L+/0JY=92)6j<2E!QN0JG@=+>PW+0JG@<3%d*F
0K(jI2E<Z<1,(I;0JtOD/iGI@3B9&Z3&)O20JY=92).'C2_[6H1,^jD2'=Y.1,(C>1,LU@1cI?Q
3&ruT+>PW+0JG@>1bLXB2`E]U3B8l<1,(I;0JtUB/i>IE2`NcW3AVd50JY=92)-g<2)R3L3&rcO
1*A>+1,(C>0fUdD2DmHN2E3]W+>PW+0JG@=1G1IB0JYC=3&<K91,(I;0JtUA/i>LB3&icQ2)cX5
0JY=92)7!@2)I6N3Ai`S2BXb/1,(C>1,LU@1cI?Q3AWZU+>PW+0JG@>1G1OB0JYI=2)R351,(I;
0JtUB/i>I@0f_3N3&_s80JY=92)6s?2)R3N3ArlX+>PW+0JG@<3A*0L2Dm0C0etO-1,(I;0JtOE
/iGLG0f_$K2DQC10JY=92)-d;1c%$M3AN9F3?U(21,(C>0K:[B1H7-M1b^UA+>PW+0JG@>1bLUE
3&ifP0K1p51,(I;0JtOD/iGOC0K(jK1GL"-0JY=92)6s?2)%!K2_[*H2'=Y.1,(C>0fUdD3&rrR
0f:^E+>PW+0JG@=3%d*K2*!EN3&rf<1,(I;0JtRE/iPI?2E*EH2DQC10JY=92)6s?2)$sJ0fV*M
0d&5*1,(C>0KCaC2_[-K1cI9O+>PW+0JG@>1bLRC0f_*K2E<Q91,(I;0JtOD/i>UI1bgdF0JXb+
0JY=90etR<3&*BN2`<BM0d&5*1,(C>0ek:<1bpgH3&*EM+>PW+0JG@>1G1L?1Gq$K1cRH;1,(I;
0JP:B/i5==0f(^I1H?R50JY=92)6s?2).$L2)m9H1E\G,1,(C>0KCaB0fUsC1c7-N.4cl01*AD!
1,(I;0JtU@/i>OI1bgmH3ADX30JY=92)6p>2E3WS0JPCE1a"P-1,(C>0fCX@1GCX?2`<QK+>PW+
0JG@>1+kFB1,^jE1Gq*61,(I;0JtU@/iG^D0f_0Q2`)X40JY=92)6p>2E3WS0JPCE1a"P-1,(C>
0fCX@1H76I2)?@10JY=92)6s?1c@0H0ekRF3%6C,4>J$9,Vh&/0JG7:0ePF?0ebRD0eje+0JY=9
2)6s?2E!6D3B8iO2]sk00f^sD0fCXA1c.-L1,:g31,(I;0JtRA/i5LE2)@'E3A_j60JY=91,1L9
3&*-A3&E?E+>PW+0JG@>1G1RD0JPRJ1,Lp41,(FC0etIA/i>IB2`<EH3$9t11,(C>0f1L>2`3HK
1bq'J.4cl00I/>$/1<V9+>P_u1,(FC0etI?/i5OJ2_mBJ1,0n,0JY=91,1I81H7BQ1,^pG1a"P-
0f^sD0f1L>3&roR0JG7<+>PW+0JG7:0J5.>2E!EK0f(a21,(I;0JtRE/i5:@3&<HL3AVd50JY=9
2)-d;1c[KQ2`<TT1E\G,1,(C>1,LU@0JtXE2)7*N+>PW+0JG4:1bLaC0JYUC2)6s11,(I;0JtRE
/i5OB0JYUJ3AVd50JY=92).'C1cI<O3&`]M1*A>+1,(C>0f(F=3&*6L2)R0E+>PW+0JG:<3%d$D
1,1I>1c@<91,(I;0JbID/i5@B2D[0K1,C%.0JY=92).!A1b^jE3AE<I1a"P-1,(C>1,LU?1,1XG
1H%6L+>PW+0JG@<3A*3L0JkaI2`W`<1,(I;0JtRB/i>OE2).*N0f'q-0JPRB1,1U<1cRKS1,CdB
3$9t10f^sD0f1L>3&roQ1H%6M+>PW*3AE9D1bLUE3B&]L2).'51,(I;0JtRC/i,IG2_mBQ3A_j6
0JY=92)7!@2)-sK1,h'N1a"P-1,(C>0KCaD0ekOG3&rZI+>PW+0JG@>1bLXB2`E`S2DlU40JY=9
1,1I81H@?L2`<EN2BXb/1,(C>1,LU@1cI?R2`ENJ+>PW+0JG7:0J5.?0JYUG0ekC*1,(I;0JtUA
/i5@B0ebCD0d&5*1,(C>0eb4:3B/rO2E<]U+>PW+0JG@>1bLX>2DR-K2`3E71,(I;0JP=>/iYU?
1,q$H1,C%.0JY=92).'C1cR9I3&``T2BXb/1,(C>0fUdB3&E?M0etaH+>PW+0JG@=1G1LD0f1jI
2)?s01,(I;0JtUB/i>IE2)dNQ3A_j60JY=91GUpB1c%$J1Gh$G1E\G,1,(C>0fCX@0fCjF1c[QU
+>PW+0JG@>1bLX@1b^dF0f_!31,(I;0JtR=/iGRG1H.'I2DH=00JY=92)-s@2)[<L0f_3J1E\G,
1,(C>1,LU@1cI?Q3AEBL+>PW+0JG@>1bLXB2`E]V1GC[/1,(I;0JtUB/i>IE2`NfQ1Gp:10JY=9
2).!A1H7<P1-%<S1a"P-1,(C>1,LU@0f:sH2`3TP+>PW+0JG@<3A*3F2`NKI1,Ud8/1<V7.4cl0
0I\P$4>838-p014/3GT                                                       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
