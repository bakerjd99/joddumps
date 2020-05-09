NB. JOD dictionary dump: 09 May 2020 16:22:04
NB. Generated with JOD version; 1.0.1; 7; 28 Mar 2020 13:01:05
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

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.1';7;'28 Mar 2020 13:01:05'

JODVMD=:'1.0.1';7;'28 Mar 2020 13:01:05'

ROOTWORDSjodliterate=:<;._1 ' IFACEWORDSjodliterate ROOTWORDSjodliterate grplit sbtokens setjodliterate'

THISPANDOC=:'"C:\Program Files\Pandoc\pandoc"'

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

puttex=:3 : 0

NB.*puttex v-- store tex/latex as JOD text macros.
NB.
NB. monad:  puttex clFile
NB. dyad: clPath puttex clFile

NB. !(*)=. jpath
(jpath '~temp/') puttex y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'tex file does not exist' assert fexist file
'file is not tex' assert (<tolower justext file) e. ;:'tex'
texname=. (justfile winpathsep file),'_tex'
tex=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod__ajod_ LATEX_ajod_
MACRO_ajod_ put texname;LATEX_ajod_;tex
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
0ebU10fU:2+>GPm2)ud=+>l)#0ea_/0d&2-+>u"u0ea_.1E\D1+>P_q0eje,0d&@s1,9t-0H`/3
+>GPm1,g=10H`;6+>GYp2_lL9+?)8&0f1"02'=V/+>Ybq0eje,0H`)*+>bhr0eje-1I=N#8PViP
6q(4!FE2)5B-;&"EbfB,B-;8;@<-H4De:+c@8pf?+DG_(AU%cs+EqaEA0<HHF(Jo*7R9[9<)6.U
:/aSV6qL-A79FVQEbTE(+DkP-CM@[!+D#G$+E(j79OUn3=<M<qA7^!sA0?)7Eb$:E+EM+*+@\Xi
79!&U78?cN5taXG:J4,O;_fJ(DIakG+DN#IG@kY?+EVO;ASuQ3/Kf.KAKZ)8@;0OlDJ()$Cgh3s
+E(j7-p'/17R9[9<)6.U:/`SaD..O.ATDi88U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\
+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;CDesJe:IJ/X
:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s
8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:
F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'Y:JXqk:JsSZC2[X!
Blmp,@<?($Df9_?GAhM4F!)l/:JXqk:JsSZC2[X!Blmp,@<?'0+D5_5F`:;N8Q/GO:..lFAp%p+
+E1b,A8bs#AU%crF`_&$Ch4`.@<?0a;F+,U;FO&H=D;Yr@;KXg+DN$?FE2)5B-;8;@<-I(DJ()9
Ea`p+ARlp"Bl7K)/KeVL@r-9uAKW?`3[Z%%+EVX4Bl%L$B-:Z"@;]j'D..O.ATDin;F+,U;FO&H
=B%^k+E1b,A8bs#9OUn3=<M3r@:sFgDKI"5Ec5e;-s';4:f(%Y7S-]2+>"^XBOu6r+EMXFBl7R)
+Dl7BF<G(3EcP`4E,TW)A7BP$DffQ5EH-,>FCcS;DK0f;FCeu*F*)G:DJ+#5@rH7,@;0UnDJ()$
Cgh3sF#kFS@W?O/FCfT7+=CY[>[hMXDJO;9Bl70p@<?1(+C]&,@q[6%DfT]:AU%p,A7^!sF(T?2
D..N/CghEsGT^^<A7^!.@rH4$@;]Us+D,Y4D'3J-Ddm-k+DkP-CNF<#FCf]/Ec#6*CLh6iFCf\>
Ao_g,+DkP-CLh@-DBO(CBl7Q+E+*WpDe!WmEbf;rF)u&.DJ`g&CER@7@rGmh+D,P4+DbJ.AU#>3
DId='Bl7R)ATVC(Bl%<jBl\99ATVuH@rc-hFCfM9E+*j%F!,UHARlomGp#^T6m,r]Bl%<&GAhM4
F*DY5E-?82Ci=3(GB.,2F!,X;EaiI!Bl+u7AU&;>Ch[cuF!,[@FD)e5ASu.&BHTJ].!R0     ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:^/0f:(0+>G_r1*AJ22Du[40d&4o2_[!01,'h++>u&71*A;++>P&t0JPF-0fC.0+>Yl/+>GSn
1*A;+0ea_)0d&4o1,UjJ+>GYp1*A;-0fL400H`+n1,(XE2BX_1+>P&q1c7-51,'h++>to01*A;+
+>P&o1c7-50f^@3+?;G9+>Get1*A;-2)cX41a"Or0ekOE8l%iA<CokP84c`Z:Jt=N2$s[c67sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,9tH@<*JG
0JPR10fM-K1HI?H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI3L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1-$IO@<itN0JPR10fD'L0KM$K$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,g=AF_;gP
0JPR10ek^C0KM!D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp17
+<X'\FCdKU1,g=AF_;gP0JPR10ek^F0fh*N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)
6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=AF_;gP0JPR10etdE1cd?L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2]tD/B-8r`0f^@21-.0G3\WDu
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp1<+@1-_
+>PW*3?U%43\rZT1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Pr"6$6f_1,(FC+>GZ51bq*J2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR10f1pI2EEWO$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqf1E]J'F<E=m0f^@13BB#X
3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K
3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS3$9>3@<?'A+>GSn:2b:u1,(FC+>GT30fM-K3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IPDg!6Y0JPR10f;!K1HI?O
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU
1-$IPDg!6Y0JPR10f;!K3BAiS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<0JPR10f(jJ1HI3G$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0JXb=ARci<0JPR10f1pI0KLpG
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU
0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.6+<X'\FCdKU0Jah>ARci<0JPR10ebXD2``ZQ$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lU
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU
0Jjn?ARci<0JPR10f1pG2**KK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L3'&lN$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0Jst@ARci<0JPR10etdI2``WI
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU
0Jst@ARci<0JPR10f1pF1-.-L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU0K(%AARci<0JPR10ebXG3BAiK$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%AARci<0JPR10ek^G0KLmI
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU
0K(%AARci<0JPR10f(jF1HI3H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<0JPR10f1pJ0KLpK$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0K(%AARci<0JPR10f1pJ0fh$C
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU
0K1+BARci<0JPR10ek^H1-.6N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp19+<X'\FCdKU0K1+BARci<0JPR10f(jI0fh$I$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU
0K1+BARci<0JPR10fM-L1cd?N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_
ATBgS1-$I"6t(1K3Zp+9+@KdN+>PW*3?U"93]&cV1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heCj6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0K:1CARci<0JPR10ebXC1-.9M$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9+@KdN+>PW*3?U%13\`QS
1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0KC7D
ARci<0JPR10KD0L1cd?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS
1G^-r6t(1K3Zp+:+@KdN+>PW*3?U%23\W<M1b]7D$;No?+B*Q,FCf;M+A,Et+?VbrDf'?&DKKH#
5!C)TF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>GVo6tKjN1,(FC+>GZ50f1pJ0FA-o
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f1"@
ARci<0JPR10ek^G2**HI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1#+@KX[ANCqg2]tM"@j!N\0f^@21HI<I3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+A-'[+>PW+0H`)(3\WNS1b]7D$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P\p8muT[
1,(I;+>Gf92)73M2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!
E]P=#+<X'\FCdKU1,U1K@<*JG0JY=)0f1pH1HI?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4
+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Po!9jr&b1,(I;+>GW41Gq3L2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1;+AH9b+>PW+0H`)+3\W9L0Js20
:IIrrFCfN#D.GC\%16K8:IIrrFCfN$+DGn<F_,VIFD56#F"_!FB6,_8BlmiuATJu<Bln#2@s)g4
ASuT48l%htF*VhKASlKr%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>;DffQ3+CS_tF`\a9F`MM6DKI!n:IH=6A7TUrF"SS7BPDN1
A8bt#D.RU,+DGm+$7^"8ARf:^ATK=D?ta7qFDl2FC2[Wj/g)9EBPDO0DfU,<De*5uDJsW.F!+n$
FEM#.+Cf(nDJ*O%/g(T18TSrqATJu3DffQ$+D>>,AKYhuGp%!9G%G\:@V$ZjA7T^lF)to'/g*`,
F*2&8+EV:*F<GF7B4uAr$=[Qh@:WnhATMp(A0?)1Cht5'AKYf-B4kdd+DG^9<)5nXF#kFbAS!n3
$4R=s/g+P$:IIuc8l%i^D.I#sBlbD$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9
@P;S,F*(u602t_8:G-Kp>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-
ATBG':IIu2D.G(J%13OO%15jKFCfM9@;p0s@<*K&Ec5e;Eb/`lDKI"CD]it7A7]h(+CT.u+ED%*
ATD@"@q?d)BOr;rF`MM6DKI">EZf72G]Y'#:IH=GASbpdF(Hs5$4R=e,9n=#AR]\&@<-W90eb.$
1,(I;+<WBk0J5(&/KcHaDK9<)ARTXj.3K',%144-+@^'i+CJYkATV<&FEqhD+DG^9C2[W8E+EQ'
?p\dRBHVD*CLnW)BleB;+E(j7DIIBnF"Ui0$6UH6+:SZ#+<V+#%144#+<V+#%144#+<X9P6rZrX
9N+8X8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU1,9tH@<*JG0JPR10fM-K1HI?H$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Vp6#^ie1,(FC+>Gl;
0JbaE0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqh2]tD/B-8r`0f^@20fh!B3\rMu$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU
1,g=AF_;gP0JPR10ek^F0fh-F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>Pku6$6f_1,(FC+>GW40f1pG2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp1:+@1-_+>PW*
3?U%33\iHO0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pku+@KX[ANCqh3?UV1B-8r`0f^@21HI<M3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@21HI?J3\r]%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh3?UV1
B-8r`0f^@21cdEN3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqf1E]J'F<E=m0f^@13BB#X3]/]#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0d'50Fs&Oo0f^@20KLpF
3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpC)
+@KX[ANCqg0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh3?V(8Fs&Oo0f^@22**QM3]&c&$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1-$IP
Dg!6Y0JPR10f;!K3BAiS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>>Pn6tKjN1,(FC+>GZ52)@9I1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*3?U%5
3\rHN0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GYp+@KX[ANCqf1*Atr@j!N\0f^@21cdHR3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0Jah>ARci<0JPR10ebXD2``ZR$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A
+>>So6tKjN1,(FC+>G]61H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,K=F$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf2'>:u@j!N\
0f^@13BAoT3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.:+<X'\FCdKU0Jst@ARci<0JPR10etdI2``WJ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>>Yq6tKjN1,(FC+>G]60JY[D
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn
6t(1K3Zp+7+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2BYD!@j!N\0f^@20fh-F3\WQ$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0K(%A
ARci<0JPR10f(jF1HI3I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1E[f.@<?'A+>>\r6tKjN1,(FC+>G]61b^sG0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN+>PW*3?U%5
3]&QP0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pes+@KX[ANCqf2]tM"@j!N\0f^@20fh0I3]&c&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+BARci<0JPR10f(jI0fh$I$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A
+>>_s6tKjN1,(FC+>GZ52)[KQ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0f]RJ$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>bt6tKjN1,(FC+>>f:
1cIHN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp44+<X'\
FCdKU0K:1CARci<0JPR10ebXC1-.9M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)
F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqf3$:V#@j!N\0f^@20KLpI3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*3?U"93\iNQ
1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A
+>>eu6tKjN1,(FC+>GT30JY[G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q6tKjN1,(FC+>GT31c7<K1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get6tKjN1,(FC
+>GZ51GV!H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Gl!8muT[1,(I;+>GQ20K;*M1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P\p8muT[1,(I;+>Gf92)73M3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pes9jr&b1,(I;+>G]61,CsJ3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnIk6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqh3$:q(EZd+k1,'h*1-.3K3\rW#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!9jr&b1,(I;+>GZ50JPUB2%!,Q
6qU6C:2b5cF##UJ67Pc)6qU6C:2b5cF!,QV/Kdi*A0=K?6m-#OG%GK.E,B0(F<GI>FCfMG%15is
/e&._67sBjEb/[$ARmhE1,(C>A7]7*0d&%W$;No?+Cf(nDJ*Nk3Zp130K3NR@k]b_/Kf+V@;]Ua
Eb$;+ART+\EZee$A7]9\$4R>@ARuu48l%iMDffQ3.3N5@EZf4;Eb-A6ARf:hF<GI>FCfMG+@0gb
D]j+4AKWC7BleB7Ed;D<A19,?$<1\MF(HJ3DffQ3+CT;%+E)(,+CT.u+EV:.+DGn<F_,V:BOQ'q
+C\nnDBNb(EbAs"Gp$O+A9)7&F(Jkk$?'r-@:EY_A8c?sA1eur+ED%8@;0U%FD,B0+C\nl@<HX&
+=LZ/+CQC0Bl%TsDJ<Nq+Dkh*BQPA<@<j:EBPDO0DfU+H%13OO:i^J`Ch7I)+EqOABHVD1AKYK*
EcP`/F<F1O6m-PrF*(u1/e&.>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%14gI+@KdN+>PW)2'=V.3\W<M0JO"D%14g=+A$H\Df'H0
ATVK+E-67UB4Z0-F*VV>ATVs</g)9UF`\a7DIal&ATT&'Eb-A*@;0auGp%0RD/Ej+EbT#lC^g^o
+<YlBFD)e*+D,2/+CT/*Dg?&7B-:c1@qBV$Bl@m13XlE*$6UH61*A:oB4Z0--Zip@FDu83@;TIi
AL@oo+<VdL+>P'YF`\`RFCfN8E,oMuD.7<m-T`\./hSb!FCf]=+>,9!-Qij*%144#+@.,[Df'?"
DIal1ARo@nBkM<+F(fK7Ch+Z0FE2)=AKYT'EZek1D/a<&FCcS6F`]9LATT&9H#7D0FE2XL/KeqL
+D#e-AT2a*Df0VX%13OO1+=>;F<Gd9F!+m6D/"'5@;BEsDJsV>FDi:9DI[L*A7Zm&Df^#/D.7<m
F!,17+EV:.+Co%qBl7X,Bl@l3De:,)Ec6)>Et&I!+<Y*1A0>r9Blmp-/g)99BOr<$De*s.DepOE
D/=8B+DGm>@UX=l@ps1iGp$N<CM\-(B4W3-D[d$r+<Y<.F<G"4Dfor.+EV:2F"SRX:iCDs@;TIi
ATJu<Dfol,+DG_'Eb/[#AKZ&>D/Ej+Ed8d9DIak!$6UH6F(oK1Ch[L,+DkP$DKK<$DJ=!$+A*bt
H#n(=D0$h6DBNS4Dfp#?/g(T1%144#+>"^XD]iY+GT_*ABlbD;AT;j,Eb0;7@q]:gB4Z-,Bl5&'
Df'?"DIal.E-,f4DK?q/DIal3BOr;qBl7@"Gmt*'+<VdLCghU-F`\aEAfu2/AKZ,5A7]dtH"h//
+Cf>,E,TW*DKI"5Bl%@%+:SYe$8X+R<+ohcBl7HmGUI3CB-;8@F*(u1+E_a:F!+q1G\(D.Ch[s4
F!,C5+EqaEA0>buD.Rc2/Kf1WBl7Q+F*VV3DesJ($6UH6GAhV?A0?/3ASbm"@VKHtE+O'%DfT]'
DI[6#@W-1+FE8R:DfQt:@<-!l+Co1rFD5Z2@<-'nF"Rn/%14p@+@g!\ATD3q+E1b2FCfK1+DkP/
@q]RoB-;8/Dfol,+ED%4Cgggb+EV:.+E2@4AncKCF*1r5FE2)5B.n=KAnGb%+:SZ#+<YN0FCSuu
DJ()0Dg*fC$4R>".3Lo!F(oK1Ch4`*Bl7K)FCf]=+Co&"FC?;5H#n(=D'3n5Dfol,+C\n)@:Wn[
A0>K&EZfREEb'5D%13OO2CTb7+D5M/@UX'q-uEC1Gp$X3@ruF'DIIR"ATK:CGAhM405PQ:@<?4%
DD--RATJu(Ec6#?+ED%*ATD@"@q?bl$6UH6BlbD7AS#C`A1e;u%15$C+@.,hF`M%98g$W(8K_Vc
Df0Y>ASu$$BlbD7AS#C`A1e;u%15'D+A,Et+Dl7BF<GUHDBNk8+C]82BHVM5DId[0F!+n/A0>]&
DKU1HF*VhKASlJt$4R>&.3M5Y6m-AYARoj)@3B5pCiCM?ATD6&FD,*)+E)41DK?qCE$/\&FCAm"
ARlosFDYh:F*)\DAKYYtCiCM/DfQs0$?pE/A90@4$4R=b+<VeADe*NmCiCLEE-67M%13OO%13OO
:iCDrBjtmi+@BgNDJ*O%+EVNE8l%i-%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$8O=Y6tKjN1,(C>+>>f:1H.?K0b"I!$4R=s
.3M>nCLnW0F`M%9<GlM\De*E%BlbD9Ec5o.Ebp"DBOPdhCh7-"Bl5&4F`]!P+CT.u+D58--Z^mL
$4R=t.3LurDKBN&ATAo,@;]UlBl7Q+<GlM\De*E%@<3Q"+EV1>F<G[NE+L/+DBNJ.@s)X"DKK</
Bl@l?+D!0</e&-s$6UH61a$a[F<DrRDJ<U!A7]joG]Y;p<DH+Q:IIW5-Qk#o/hSb!F`(o'De*E%
FCf]=+>,9!/gh)8%14m?+@0OK+<Y)8F(oK1Ch4`!BOPdkAKYK$F`):DAoD]4DdmHm@ruc7Bl5&8
BOr;s@<>pe@<6!4%144#+BN5fDBNt2E,8rmBl7Q+GAhM4F"_H@C1UmsF!,R<AKZ&>F*(u1+CfP7
Eb0-1Cj@.DART+j%144#+EV:.+EV%4B4Z0rA0>B#D/aE2ASuU2+CT.u+Cf(r@r$-.FD,5.Bl7F!
D/!m#+DtV)ATJ:f+<VeNBln#2FD,5.FCB3&ATT&4@;TRs/g)92Df^"CDe:,6BOr;tG]753F(HJ4
AftN"+E_X6@<?&i$6UH6De!:"EcW@IBln#2FD,6,AKZ#)@:XF3%144#%144#+A$/f@3BT%E,8rm
AKYK$F`):DG@>P8@:Wn[A0>u4+EV:.+ED%4CgggbA0>r8Eckl6F`M%9@1<Pd+<YN8DJ=0%F_kV3
@;Tq*DKI">Afu#8ATDHq@:UL)Dfol,+C\n)@:Wn[A0>u4+Cf>4DKI"7Dg)Wt+<VeD@;^?5FD5T'
F!+n/+E(_(ARfg)BOPs)@V'+g+ED%4CgggbA1euI<+oue+DGm>@3B>sGmt*'+<Y`I@<?4)FD55;
+<XWsBl7R)+EV:*F<G4-F<G(,@;]^hA0>;'Ci=D<@<,p%F`V\6Ci"AX%13OO+<VdL+<Ve8.3N)B
B4lK4@<3Q)ASc/l$6UH6+<VdL@OWF;Dfd+GASc0*A7]grB5V9k%144#+<VdL+:SZ#+<X0cFED57
B-;D:Eb$;/AThX$+Cf(nDJ*N'@rHL-FE8RCF`\aEAfu29@:X(oBl@ltC`mn4EcYr5D@Hpq+<Y04
DKKo;C`meEF*(u1F!,1<+CT)-D]iI2E+*Hu/g)99BPDN1GAhV?A0>_tCLnV\:IGX!+<VeDDfTD3
F`V,+F_i1EBln$,F`\a7+EM70DJ<]s@ps7s+E)F7EbK#mA0>T(@rc-hF(Hs5$4R=b+<XWsBlbD,
BOPdkAKZ28F_kS2Eb065Bl[c-@3B&n@;]^h+EVNEFD,5.@VK^gEd8dD@<ld6F<GL6%144#+Cno&
@:EYdAKYT!Ch7Z1Eb0-!ATDL&B-;/6AThd+F`S[9@<>pe@<6"$+E_RBART+X@VfU.%144#+A!]"
Dfol,+D>2,AKZ)5+D5U8FD,]5F_>A1@3B*'D/^V+DIal1ATMs3Eb-jG+:SYe$4R>!.3LurDKBN&
ATAo%A7TClB-:o++CT/+FD,6++E2IF+E)4@Bl@l3FD,*)+EqaHCh+Z0FDl22+EV1>F<G+*Cij*,
%144#+DG^9FD,5.A8bt#D.RU,@<?4%DBNG-D/aE2ASuT4De:,1@VTIaFE9&W+B3#gF!,C?FD5Z2
+EqaHCh*t^+<VeFDJXS@@V$ZnG\(B-FCeu*GA(Q*+ED%5F_,W9ARlomGp%3BAKZ,:ATBCG+A$Yt
GAhV?A0>T(@rc-hF(Gdf+<VeKBOr<-H#n(=D0$h0De*E%F(or3+C]U=D..^!AKW`^/Mo.(Ch[cu
F!+q7F<GdGF_kRt$6UH6DJsV>@:Wmk@;^?5DfB9.@<?4%DII?(Dg#]4BOtU_+D,P4+D#V9@:F%e
F(f,q+E)41Eaa'(Df0VK%144#+B3#gF!,RME+L/1Afu#2FD5Z2@;I&sAScHs+D,%lBl%L*Gp$gB
+CT)-D]in8Eb-A-DBO%DDIj7a+<VeNBln#2GA(E,+A!\dAS#^$F`V,+F_iZQ+AHcqF<Ga<EcYr5
DBNG-DKKo;C`meEF*(u1F!,RF@:O'q%144#+CT)&+Cf(nDJ*O%+EVNE@rGmh/g)92Df^"C@q]:g
B4Z-,@<,p%FE2)=Bjkg#@;]TuBl\6*Ch7cuDKIK?$6UH66$"/jBl.E(B5_@&+C]U=@;Ka&FD,6,
AKZ)=ART@q+Co%rEa`Ki+EV:.+E_d?Ch\!:+E(j$$6UH6@rGmh+D>J1FDl2F/e&-s$6UH6<+oue
+Cf(nDJ*N'GAhV?A0>o(EHPu9AKYD(CghU-F`\a9BOPdkAKZ)5+EV:.+@K!m8PViV+Du+?D@Hpq
+<Y-9F<GdGF_kS2DJsV>Bl8$5De+!#AKYE!Gp$R1DIIR2+Cno&@:EYdAKY])@rH4'@<?3mCh\!*
ATKI5$6UH6%144#+@KdWFC?;%De*E%GAhV?A0>PoG%De<D]i_%DIdQp+EV:.+Dtb7+EMXFF^oN9
Eb-A%DIal$G\M5@Bl7Pm$6UH6A8bt#D.RU,@<?4%DBNG-A7Zm-Dfol,+D>2,AKZ)5+C\n)@q]F`
CLq$!@;]TuE,Tf=Bjtn(+CSeqF`VY9A1e;u%13OO;Is?LDKI!gBOPdkATJu9D]hYJ6nSoU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%B3$:t7Fs&Oo0K1+/1HI<P3]&f*$4R=O$;FrHGp$U1@;]^hF#kEq+A!]"@<3Q/Dfd+EE+EC!
Bl7Q+FD,B0+CoD#F_t]-F<GXC+Dl%<F:ARqAfu2/BlbD@DfTV9G@>P8DJsV>DJsV>DJsW.A1euI
8LJ=j+DYP"E$/V$FED)7+Du+>ATJ:fBl5&8BOr;uF`_bHAM,)J87cgQ+CT;%+EMI<AKYZ#B4u*q
B4uC.3XlE*$8EtP6Z6jcATDm(A0>u4+A*b7/hf%'/Kf.KBlbD@@<3Q"+DkP%DfQt>@;0U%@<3P`
-Z^D>@<6-m%16NaB6A'&DKI"BH#@_4GT_3=F!+t+@;]^hA1euI<+ohc@rGmh+Eq78+Cf>-G%G]9
ARmD&$4R=t.3ME(Ch[cu+D>>&E$/S"A7]9o-u*[2BOu"!.1HUn$8X+R6?Qp^+D,>4ARlotDBL?<
DJUaE-t@14E,$gE@;]TuDffZ(EZfREEb'5D+:SYe$8a1S6tp^aEbT!*FCeu*Df0B*DIjr"Gp%3B
AKY_12D-[=+CSekDf-\:@:O(]B4W3&@;]LdATAo%DIa1`@<<VkBOr;Y:IH=%@:s.m/e&-s$8j7T
6uQRXD.RU,@<?4%DBO(>A7]doDeX*%+D#e>ASuR'G%De:AM%J(BlkJ>D]j(3Ao)$gF<G[=AKYhu
DKuZu@q]:gB4Z-,Dg#]4+EV:.+F.O,EcWiB$4R>#.3MB(G9CsKDfTQ0B-:W!C`l>G6m-PhF`Lu'
+DG^9FD,5.A8,OqBl@ltEbT*++CT.u+D58'ATD4$Bl7Pm$=Rae+Co2-FE2))F`_2*+D,>(ATKI5
$4R>$.3M5Y6m-PhF`Lu'+DGm>DJs_AE+*d/Cj@.GDId=!+B*DlG%G]8Bl@l3@rH7,Ec5bH+:SYe
$90IW9lFQVAnbge+=M)8CLnq;-uEdA.3N_N+E2@>@qB_&+Co&&ASu$iDKI"2De*E%F(Jj'Bl@m1
%16fe+D5_5F`8I3DIal2F_Pr/+D>=pA7]e&/e&.1%13OO%16'JBl7R)+EVO4D`S=7/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$8EtP6Z6g\Ch7^"+CoD#F_t]-FCB9*Df-\<AThd/Bl@lA+<X5u@;R-+Cgh4!Bl7Q+FE_XGG%G]8
Bl@m1%17#c+A,Et+CoD#F_t]-FCB9*Df.0M+B3#c+E).6Bl7K)G%G]8Bl@l3FD,*)+DGm>DJs_A
F`(`$EZek1DKBo?F^oN-Df-!kBlbD,F`MM6DKK]?+D>\7FCeu*@X0(dDf99)ALDOADf0B*DIjr$
De!p,ASuT4FDl)6+=L<3Blmp&Gpt?g+B3#cF(GdfA8bt#D.RU,F!+t$DBND"+CoD7DJX6"A7]9o
@<3P^<)$%=+<Xa!ASrW4BOr;W<)$%/A8bt#D.RU,Bl@l3BlbD7ARTUqGp!P'@rH4'Ch7^"+A!]"
Bl%T.GB.D>AKZ&4D.Oh^+Cf>#AKZ)5+Cf>-G%G]9+DGp?FDi9q@8pf?11`'\+B3#c+A?3CAQU(!
Bl%Sp$=[QhF`V,)+EVNEB4YslEaa'$+CQC6Bl7R"AKYMpAnc-sFD5o0+AbHq+CoD#F_t]-F<G[=
@<<W9Bl%T.@V$ZmBleB:Bju4,ARl5WBl5&8BOr;q@<6-m+A,Et+Co2-FE2))F`_>9DD!%S:Msu_
DIjr$De!p,ASuU2+EqO9C`mV6F<G%(+Co2-FE2))F`_2*+C]J8%17/jD/a<:+ED%*ATD@"@qB1'
%13OO1+=>5Df0`0Ec`EPC2[X)Df9H5.3N2BEc5t@@;]TuD.Rd0@:s-oBOPdhCh[d"+EVNEFD,5.
F(8lpD.Oi4F(Jl)@X0)<BOqV[DffZ(EZdtM6m,uU@<6L$F"Rn/%14m?+@0OK+EV:.+D,P.Ci=N3
DJ()0ATo8@DfTB03XlE*$6UH6@4<<IG]%=H+>#/fCh[Zr+CoA++C]J8+EM+&EarcoF!+n-C`mb0
B5)F/ATD?m+Co1rFD5Z2@<-'nF!,(5EZf7.D.Rc@%144#+CZcB-t7(1.3L2o+Dbb-AKYN$C`m20
F<GX9@<,jkATJu&Cht5(F`MM6DKI"?F`\a:Bk)7!Df0!(Gp$R)@r$4+F!,(5EZf7.D.Rc@%144#
+CciC-t6h#F=A=T/M/)VG][t7@ruc7-uNI1ALr"5Cis;<+CT.u+=M,9D.P8.CghC+/9YH<F_*!E
FCAWpATJu+Ec5e;@UWb^F`;C2$6UH6+<VdL+<VdL+<VdLFD,6+AKZ22Cht5'AKYl/+=L]<F`]&T
F(oN%AKYGj@r$4+F!+1W;cFl7792iT+@8L>5tk6H;FNu+%144#+CloD-tIF@.3L2o+ED%+F_kK,
+D#e:Eb0<5Bl@l3Ap%p++EV1>F<GX9@<,jkATJu&Cht5&Cht54@VTIaFE8RCDBNn,FD*99$4R>!
.3LoeA0>`-Eb-A0@:F:#/KeqBARlol+A,Et+@9X\F<FD#@:OCn@qB^4+A,Et+B38tC`lPpDeF*!
D/F!)B.aW#%14sA+AH9[AKYE!Gp$U1@;]^hF!,L7EHPu9ARlp*D]j+DE,]`9F<FR_7Q;N4AU&;>
-t@1+AKW`d.3N>B+DkOsEc6"O%13OO%15p-;cI+=De*ZuFCfK$FCd3^:-pR0:K(5"C2[X!Blmp,
@<?''E,Tf>+E2@>@qB_&DfQsK/M8J83XlE*$?L'&F`_SFF<F.E5sn((3Zoh)+?CW!.1HVZ67sB/
C2[X!Blmp,@<?'0+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`%^67sBnEc>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6N
$;No?+DGFr@qB^m@ruF'DBL&E+AP6U+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B+52C
67sC%ATV[*A8Gt%ATD4$AKW*j67sC"Eb02uEb-A*DfQt>Ec5H!F)u&5B+51s%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$ALCGQ6r./^:IJQ,A26(Q$4R>M8l%i_+B2-)
:CRXo4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lq
A0>T.F!,OH@Uj4_F)to6/g(T1<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.
Ch[KmFD5T'+E(j7@3BZ#F)*BN%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/
Ch4`2D]j(3G%kN3+Cf(nDJ*O%/g(T16#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA18W1$?U2/F(Jo*
GA(E,+=^f0FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C+Acl_DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4
FCfK,@;KY(AM+E!%15RCEZfX=@<-E38K_\TG%De5@;0V$@;0UjA0>;'E,oZ9@<?''E,ol3ARfg)
Ci<r/FD,*)+DG_'Cis9"Et&Ia8l%i_+EqaECG$`$+Dtb6ATAn;E-5W+Blds!A0N.<BPDN1A8bt#
D.RU,+D,P4+EV:.+EM76E,9).Eb/[#Df-!kFD,*)+A!\dBk2*/F<Gd9DKI"CD]ib2E,9eBFD,*)
+A!\aD'3>,D/F!/FD5W*+EVNE@;^@4BPD?s/g*o-G9BI"@;R,sDf'?*FED57B+52iD]iY+DJ=0*
Bl7Q+FD,5.An?0/Eb0)rBl7X&B-:SS:IJS5An>CmF`M&7/g(T1%16KI@V'1dDCosKA8ba]%13OO
0eOSV4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5
Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QEt&I!+<Y?+G%De+
BOPdkARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO1+j\W4C;ZBBfLEX2/[AYG\Uc5FCT&o2/dAE
DD6?C5%#L)DK]T4FD5ArFCcS,@<HC.Gp#^T6m-;a@:UL%@rc:&F<GF/CM@[!+EqL1DBO%7ATD?)
@<,p%E+O'(De*o3?nPh0@;]Tu@VfIjCNCU@?m&i"+DG^9E+*j%F"Rn/+<Ve'Ec5E'ASiQ.@WQ+$
G%G2,Ecl8;Bl7Q+FD,5.?u9=fARB7l@:W_d@rc:&FE:h4FCfN8%144#+EqOABHVD1BlbCh:IH=E
@<?0D+CIPt>ZGiVEcYJXDeO#@6=FY@Ea2CXAOLQQG%DdJ+A-'PCNFE3+@C'aE+*WuATM*kDe*5b
$4R>M>@h\_/TboADd?`[$=\-lCh.:!A8,e"1,2Nj/h1=QBl%<pDe*QsF!,NU/Kf1TA79RkF!)T8
Df'?&DKKH#+DPh*Bkh]3F(96)E--.D+DG^9+DPh*B5)Gs$;No?+Co2,ARfh#Ed98H$;No?%15is
/g,=KEaiI!Bl,m?$;No?%15is/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2@;0U%
8l%ha$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!
Df0!(Bk;>p$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'n
F!,RC+CSbiATMo8FD,B0+EM%5BlJ/'$;No?%15is/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQU
Ecl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67r]S:-pQU@<6L4D.RcL
%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emEcDD3gT
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTcF`&ll+CSekARlouDe*g-De<^"AM.\3F!,49A8kstD0%=DC3(M4De+!3
ATD:!DJ!Tq@UX%)Bkh\u$;No?+>G`^E,mWf+ED%1Dg#]&+F7X6Ch7Z1/KetSFDuAE+Co2,ARfgn
A0>u4+DPh*B5)H1F`(`$EZee,Bk;/k$;No?+>GinDg!fp+D,>*@;I&rBOt[h+EV:*F<GdJBlnH.
DBNP*Ch7Z1AU%p1F:ARP67sB90PY$61,L+pBQ&);GB.D>FCf>4Anc'm+E1b2BQFUi%16T`@s)g4
ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEo
ATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1r
FD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,
EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fnC2[X+ATDj+
Df.^!+=o]1HV.(%<_Ysk$4R>;67sBhCh[Hu+DPh*Bkh]3A8-'q@ruX0Gmt*Q:II]E<(]qS8P2oX
5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGj
$;+)^7nHZP:IIcH;c#bZ83K!VC2dU'BQIa(+A,Et7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"
0..29%15is/g+e<DImisFCcS)Df'?&DKKH#+A,Et+Cf4rF)rIF@rc:&FE7luC1D'gF)to64ZX]I
3[\Z\A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^_6De*d(-OgDtDe*Ho
Ch7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$Et&Hc$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quM\
-u*7.@<6L$F!*"\/j:C?-Y-Y--Rh2>+ED%%A0rom+F?-n0d(4LA7fOlATJ:f%15is/g+YBCi!Zm
F<Ga8EbTH7F!,=.@rcK1F(96)E--.1$7Bk(+EMR5-TsL51a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%
@<-4++DPh*F`V,7@rH6sBkLm`CF9Pu.!mQj0d(OX@jsQ%+F?-n0d(OX@grbS$;No?+E_X6@<?''
A8-'q@ruX0Gp$^5Ch7Ys$:[T\78l?1+=Lu7CghC+ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a3
$:[T\78l?1+=K?E:II]E<(]qS8P2oX5u^B(+=nil4s3<d9LVkh$8=SWDe*BeF<D\K+<Ve=GB.D>
AKZ&-Dg-//F)rHc0RH8\9LVkh$8=SWDe*p2DfTE"@<<W(GB.D>AKZ&-Dg-//F)rHc0mcA]9LVkh
$8=SWDe*Bs@Urnh+<Ve=GB.D>AKZ&-Dg-//F)rHc14)J^9LVkh$8=SWDe*]nCLq$bF<D]<GB.D>
AKZ&-Dg-//F)rHc1ODS_9LVkh$8=SWDe+!4Bl%<gF<D]<GB.D>AKZ&-Dg-//F)rHc1j_\`9LVkh
$8=SWDe*s.DesK*@<<W(GB.D>AKZ&-Dg-//F)rHc21%ea9LVkh$8=SWDe*d(A79R&+<Ve=GB.D>
AKZ&-Dg-//F)rHc2L@nb9LVkh$8=SWDe*g-De<^"AKW+-GB.D>AKZ&-Dg-//F)rHc2g\"c9LVkh
$8=SWDe*fqEc#k?+<Ve=GB.D>AKZ&-Dg-//F)rHc3."+d9LVkh$8=SWDe+!3ATD:!DJ!Tq@UX$p
Ap890FCcS9BQ&*6@<6K44#qXW8PDQO%13OO:-pQU@q]F`CER_4@<<W(Bl%@%+D#e3F*&O=DBNM8
E+NO$ARlooBl[cpFDl2F%14L>+?CW!.3M)O9LVkh$>F*)+=\us@Qc=dAn?4$F*&OM+CoCC%144#
F)>i<FDuAE+=CZ;D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RIE+EC!ARm.t$6UI4D/XQ=E-67F8l%iF
8Q8;X6qL!L:dJ&O%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Jr;e+Dkh6F(oN)+Cf>,D.RU,ARlou
De*QsF!,O6EbTK7F!*%u-QkJnGp">\+>#3T%144#@<6L$Ec`oV0Ha+W/g,@ODdabuDg,Z/Gp*V(
ASu$2%14Nn$4R>;67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=\-lCh.:!A8G[r
AU#sb:-pQ_@WcC$A86$nCghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[NqFCeu*8l%ht
F)Q2A@q?cV@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF+Co1rFD5Z2
@<-W@F!,"3@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1+Eh=:F(oQ1
F!,C5+E1b,A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL@q]F`CERM5
F`&<M<(KSZ:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8
FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB90Pt6D
0JXbkAThd/ARlo3H?smPDe*]nBl7:"AU#X5$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdS
C2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*
3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6
+<W%?C2[X!Blmp,@<?'.%13OOFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+Cf(nDJ*O%FE/Kr:IJ5X
6miEN%15is/g+YHEcP`/F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R
:IAJrA8bp">9IHp@QcapHTHL+6r60K87,_&<*s!):IK,1C(1MkATV[*A8Gt%ATD4$AKYN%@grbS
$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/EcZ=FDf-\<AThX*F(HJ)Bl[cpFDl2F+D,>(AKYl!D.Oi2
DfTr@%14J'@j#l)GUGX8+AG-h;GUY.C2[Wi+D58-+=DJ]H>7A/D..-r?Z]k(-OgE)AU$@!+?Op2
/9GHJ%172gGWe)1-mpYmIXWMbATDj+Df-eKINpKn/3>P48l%iU9ggEQ@q]:gB4Z.+EZfI8GRY!.
FDjboFCf\G+Eqj?FCcS*Ddt=GH?smPDe*]nBl5PFAU#R3$4R>;67sBQ:IH=8CghC+ATJ:fC1D'C
3ZpLF-YdR1Df-\4De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJB%16on
GWe)1B6%p5E,8s)AU#OS4s4TMC^g^\$;No?+E_a:+=DJ]-QmAKAS,Y$+EVNE@<QR'A0>Au@<6*n
F!,[@FD)dEC2[W1+>,9"A8bt#D.RU,+D,>(ATJ:fFCf]/Bl%@%4ZX]64CiA?.3L/g/j:C+4=>H$
-Rg/h-8%J)C1D'&/1)u5+?V#(FCf\E+:S[!D/XQ=E-67FFCf]/Bl%@%+Bot)FEepPEbTW,-8%J)
FCf]/Bl%@%%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=KCghEsGW@cE
?YF.pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.
@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/e&.1
+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,
F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/%144-
+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6
+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[Kq
ATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:SYe
$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_
F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n0J5%%/KdGm
@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&
D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!ARloU
:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.
@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=
G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(qE$[7n
7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY
3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'A8,Oq
Bl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpd
F(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-
+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8
+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI
6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4
D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E.
/ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&
D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa
0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1
F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3
@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b
.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdk
ARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF
;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p
@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@
Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#
H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIq
AScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL
%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LB
A7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7
Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg
@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU
0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#
AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4
+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u
+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6
?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKSATDiFC2[d'
1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%
?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5
@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb=)`D$
CbBF:Et&H_#n74a+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK
%144#+<VdL+<V+##mkQeDfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@
;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOL
AISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7
DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8
AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+
A0><%F(o9)D.RU,F"Rb*%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63
+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`
+<VdL+<VdU%13CJ%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!
A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'
Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et
+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$
$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL
+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc#mh%J+<Ve+
BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct
@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1
/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf
+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9
+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE
+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU
<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8p
A8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<h
F)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4
Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b
.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/
FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*
FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6
AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(t
F<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_
F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$
A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL
+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?
+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo
-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29
+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.
DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!
/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.
AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeq
F`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q
05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1
001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"
+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&
+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%
DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,
F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&
+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79Rk
A0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"
DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)
Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtB
DIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,
@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmE
ATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#
+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50
@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6+
+Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P
@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdL
ARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]Tu
ARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"
F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<
%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&
@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<
ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#
C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1
A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(
.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k
+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>
D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdS
Eap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>
AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL
+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9
DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)
+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL
%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3
Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(
F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNE
A9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*
+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@lt
EbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,
+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po
+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3
A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4
ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67F
A8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=
FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQU
A9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG
$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I
?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+
A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)
AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6s
BkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:C
FCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89
@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.i
Eb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@lt
Ed8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bd
Df00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F
%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bg
DerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]Ul
Bl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s
$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-q
G[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm
/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,
DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%
7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq
@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9
F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-Ni
BOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J+
+<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`
+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!
Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?
@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"
GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloq
Ec5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s
+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]
Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[f
Bllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[
@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0
$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE
2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$
+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8+
+=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*
Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%
0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<
3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R+
+D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3
FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6
/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9
?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$c
Bl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/
@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%
De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.
Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg
@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8
GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR
<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&
DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%
,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6
DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq
+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo
+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6
@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6
AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1
+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!
-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4
Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]
B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#
+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&
D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>
B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'n
F#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK
@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk
+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o
+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:
EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAk
Ble59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(
BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!r
F<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-
+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*
A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("
@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"
$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp
$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*
@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&L
A8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*
Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGg
FD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'M
D]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q
$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%
0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrA
DdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC
2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kM
Bkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#
/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9
G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3
Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_A
ATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(
Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*
F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#
AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/is
G\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2
@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*+
+EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9
A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd
?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-
ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8
@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?
6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,
ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,
F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-
F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,
ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,
?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=
?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+
Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e
$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-
+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?e
C2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM4
2_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@
?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth
+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6
?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9
ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-
+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB
+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5
DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,
Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1
AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FD
Eb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*
D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)
+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6
%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)A
DfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!
+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht
?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSek
ARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%
+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp
@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.
AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#
FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E.
/i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>
ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-
FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3
+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg
+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<
1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et
/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b
+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)
AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#
AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$
DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0
F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg
>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRn
DKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.
Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@s
Dfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.
+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4
A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4
Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@
%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8
/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=
D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnu
De*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:
+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<
BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9Cgggb
A0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(
AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8
E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#
+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:
De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7
DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9
A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)
AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI
?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.
<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-
+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0A
F'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1
F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa
+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'
F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'
F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*
FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg
%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC
+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb
+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)
3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>
A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibC
D/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"
A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$D
Eb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@
Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`
CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO
3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.
Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1
Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=)
,9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-
AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5
F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB
+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i
1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=
+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9
D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I
@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE
@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%
F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht
+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*
C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3
DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG
@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL
+:SZ#%143e$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5(&/KdbrEarc*
1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+<W-V+B;<5F!,17+CJr&A1hh3
Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j785rPb/e&-s$6UH@+Auc_ATD@"@qB^(
FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk/e&-s$6pc?+>GK&/heD"+@KdNASkmf
EZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+<W-V?t*b[FC65#@:O(qE$/e)
F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5DK?q=Afs]gE-ZP:EZf1,@WNZ#A7T7^
+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<@<?0*-[oK7A8c@,05"j6ATD3q05>E9
A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6UH@+Eh=:
F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^
1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57F'p,3ARfgrDf-\+A7T7^/g(T1%14=)
,9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V?u9dt?m'N%@ruF'DBN@uA7]:(%13OO
,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+<W-VF*(i2
F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V8l%htAoDKrATDi7
@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss3%cmD+A,L1/e&-s
$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0sDIdI+/e&-s$4R=e
,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D+Dtb7+A-]nAor6*
Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK
%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#FED)7%144#+<Y`J
E,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1
@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq
1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9+:SYe$6pc?
+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&uk
F(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,RpF'U>?@;L't
.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu
%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a
:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,
AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+
FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LN
Bl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*
+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b
@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$A.8kT
$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdkATJu9D]iG&
De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"
+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU0J5@<3A_j1
+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&A7TUgF_t]-
FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l:2b;eD.7's
+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2A8-+,EbT!*
FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO+=\LADKK8/
A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:Bldir+>"^E
A7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&
0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu?o9';Ble59
-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(GA^\7BQS?8
3\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E./iYO-/KdZ.
Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,
?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L16q/:k:IH=9
De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=
Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8D.Rc2FD,5.
F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.
+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.
FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%
Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJ
D]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6E,ol5BkCps
@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57B-7Wj+<VeD
ATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(n
DJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZm
De*ZuFCfK$FCfB6Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%16?]ARfgrDf0o,
FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;iG%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb
+E_d?Ch\!:+EM%5BlJ/:FD,*)+D58'ATD4$ATJ:f>\.bkBR=Q0FCfK$FCfkCA8bt#D.RU,F!,"-
Eb/a&Cj@.8Ec5e;8l%htA8,OqBl@ltEd8d?Ec6)>F"Rn/%16?]F^fE'@ruF'DL5W1AU&<=FF.b@
A8Gt%ATD4$AUP[mDKKH1Amo1\I16Mm$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*
I9Ttd$=%7iE+O'+Bl7^5B6%s-BlncM>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>XNFHD.RU,
<,ZQ!D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaI16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3o
DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I=5?fDf'?&DKJirCO:#@AT2'uAKYT'EZf=ADe!@"F(oN)
I16NgBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[Dej]6Amo1\F(Jj'Bl@l3+<Z)\>XNFH
D.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgASu%*882^MCh[NqFD5W*
I16NgASu%*;eTTMARp2u$4R=O$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?
7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.EFD,5.
8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I@V'1d
DL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&.mBlmp'%144#8l%htB6%p5E$/\0@s)X"DKKqB>]aP%FEDVO1*AS"A8-+(
+=CfBDfp#:@;TR'I3;s=AISth+C&T#AS-:&FEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2
;FNl>9gp[JFDYi!,B.(/A8bt!/T"p:CLh@-DLHkN@;]Uo@grbf+Cf>,E+*j&@VfTuD..I#A8c[0
I3<WCG]Y'?Ea`TtASuU2/g+D1D/a08<+oue+DGm>FD,5.D/XK;+EM+7BlA-8%144#Ch[a#FCB9*
Df-\9Aft?#AU&<=FF.b@A8Gt%ATD4$AUQ1Z+AHcqF<GL6+DlBHB6%p5E$/\0@s)X"DKKqB@<,og
$6UI/Dfd+=@<--oDg-(O+A!\aD'3n9Dg-#C+Cf>-G%G]9Bl7Q+FD,6&/g*_t+F.mJ+Cf>,E,Tf/
+D5_5F`7cs+<Y35@s)X"DKKqBF`V+:E+*WpDdso,@<--oDg-(A@;]Tu>]aP%FEDVOC2[X!Blmp,
@<?(/+EqO9C`m1u+CQC/DfcEq+<YN>Eb-A9F(Js+Cb?/(>\S:kD%-gp+@0mj+D5_5F`8I5CghC+
>\7nmFDc#=AU?]c>\.bkBR=B4Dfp"A@r,RpF+#0FF!+m68l%htB6%p5E$0@=FD)e*%144#+<Y3+
@r,RoARlp"BleA=De:,+DKKH1Amo1\+CT.u+EDC=F<GdGEb'5P%144#+<Xp2AU&<=FF-SK5sn(B
:JsSZI9^?#E+jT2Ec6)>DIIBnI3;s9A.8kg+<Ve3FCf]=FEDk-:JXqk:JsSZI9^?#E+jT2Ec6)>
DIIBnI4cX?Df9_?GAhM4F!+n-Ci=M,$6UH6+C'#"G]\%LHXU`,Eb/j(I3<WM+D,>*A0>;sC`mh5
AKZ28Eb'56FD,*)+C\nuDf021FDi:DBOr<!Ec6)>/e&.1+<VdoCghC++D5_5F`;CEFEqh>@ps1i
Gp$pA@:UKpDKKe>Ci<flCh7Z?+C'#"G]\%LHYRJ0Ch\!&Eaa'$/no'AI16N++<Ve@F!+n/+D#e+
D/a<&+E(j7@3B&r@<6K4B6%p5E%ZP]Bl8$(Eb8`iAKY].+CQC6Bl.g*AKXSfG%G]'@<?4#%144#
@VfsmCER_4@<<W+F!,=.Ebf5s+EqOABHU_+>YJR*AQXD&ARfgrDf-\-Df'?"DIb@B7<i6XBl7K)
FD,B0%144#B6%p5E$o]LA8bt#D.RU,+C'#"G]\%LHSQ^(+Co2-E$-NCDe*ZuFCfK$FCchJ+D,P4
+CT.1AU%X#E,9)<%13OO>[h8WBl89@ATD6gFD5T?%14C(CghEsGT_'=@ruF'DBKAq>]Y$sF(Jj'
Bl@m9>]aP%FEDVOB6%p5E,K*$AUP[mDKKH1Amo1\I16Mm$@[GQINWt[/o#eD$>4BuCh[u6+<VdL
+<VdL+AP6U+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HW*ATV[*A8Gt%ATD4$AKW*j67sC"Eb02u
Eb-A*DfQt>Ec5H!F)u&5B+52sIXZ`p+<V+#>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+AQim/P7-q
De*E%BlbD,Df00$DIm?$FDi:DBOr;Y:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I!+<VeC
Bl.R+@<?4%DBNe)Gp$R-+D"u&ARlotAftf0+C\nlDf'',+CQC+Bl7I%@;]Rd/q"jNDIal(F!,=.
Ebf5s%144#GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..
FCf]=FEDk7HX(uI%144#@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[Nq
FD5W*+Cf>-G%GQ5Bl@m1/e&.1+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7
>YJR*AQXCkDe*E%FD,*)+DGm>D..I#ARlp"Bkq8h$6UI5BPDN?%13OO>[h8WBl89@ATD6gFD5T?
%15is/j)7FIXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%15is/j;IJIXZ_g
%16?ODIe*;ATD6gFD5T?%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$+C'#"
G]\%LHYRJ0Ch\!&Eaa'$I=2P3%16?^AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"GB5;X
9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$FCfkC
GA1l0+EDUB+E)-?=(uP_Dg-7FG%G]8Bl@m1+E(j78g$#E0JX(E+<Y*1A0>>mH#IS2/g+,,AKXZ\
DKU1H@;]Tu9jqNSG%G]8Bl@m1+E(j7>]aP%FEDVOC2[X!Blmp,@<?(/+ED%5F_Pl-%144#8g$&F
0JO\YDIal!AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc%13OO
>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&8l%i-%144#>\J.hAp\35FDs8o
06_Va/o#HGAor6*Eb-k5Df%.BGA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV.(%I3<6F+CQBb%144#
@:WneDD!&'F<G:=+E_aJ@;Kb*+DG_7FCB!%ARlp-Bln"t$6UHrBQ@ZrHY@MCE&oX*GB\6`C3+<*
FE_/6AM.J2D(fXJBkqE98jQ.!HV-RtI4bs9>\S:kD%-gp+A$HlFCB!%+A,Et;bpCk6U`U:$6UHr
BQ@ZrHY@MCE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De*p-F`Lu'
I="R^6rQl];F<m$%144#BlbD*CiaM;@3A/b@:WneDD!&'DKBo.Cht5.F<GdAFD)e%FCf]=FEDkK
@:O._DLF-BAoDU0DJsW.HV\N%2DcOcBlkJ@ATDj+Df0V=De9Fc+<VdL8g&4hAKZ&9@;]UaEb$:t
FCf]=FEDkK@:O._DLEXADKBo.Cht54Afs]A6rQl];F<kqD..]4AmoCi/g+)(AISth+<Ve3BQ@Zr
HY@MCE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj03f`3Df'?&DKIHc0ee$&
<+ohP$6UH6+A-Q_+AcKZAUP\5DfQt/DBNA(FCfK1@<?''Bl8!6@;Ka&D.Rg&De(JK+A$Yt@rH7,
@;0V#+EV:.+A,Et%144#A8,OqBl@ltEbT*++ED%5F_Pl-A0>u4+C]J-Ch+Y\:IHfX8l%iR:K::[
73H#TF)N12Df0Z*Bl7u$$6UHrFCf]=FEDkEDe*ZuFCfK$FCd(Q%16?SFCf:u$6UHiATW'6+CQC9
ATDj+Df-\9Aft>lEb/j0BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq07A1d@;]Uo@sndn
+<Yc>@<<W5F`;;<Ecc@F8g&2#DKK<3+D>J%BP_BqBQRs+B.b<*AS!!+BOr;qCi<r/E,Tf>%144#
>\J.hAp\35FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t=A0/>47E+*WpDdtA.@<6!j
/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VNHVe-gA8bre$6UI#@<6!j+A*bTH#@_4GT]OkB4u*qB4uC$
DJ+A?AoD]4A7]jkBl%iC%16?SFCf:u$6UHXF_PZ&+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"jIFCf]=
FEDkEDe*ZuFCfK$FCfkCBlbD*+A*bhEc6)>/g*b^6k'JG+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3
Dfp#?/g+,3+DkP&AKY6"AU&<=FF.b@A8Gt%ATD4$AUP\3D`S=7%16?LAS5^pHZit@@UX@mD1)j#
Eb065Bl[c--YI".ATD3q05>E9-OgE$A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%16rg
F!)iFDe*ZuFCfK$FCcg/$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<XI!ASrW4BOr;Y:IH=9Bk)7!
Df0!(Bk;?.@rH7,@;0UnDJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0%16?LAS5^p
HZit@@UX@mD1)j#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDfASu%*G%G]'@<?4#
I16NgBlmp'%144#9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVO
C2[X!Blmp,@<?(/+DGp?@ps6t@V#uU+<YK=@:Wq[+Dbb-AKYE!Gp#^%F(96)E-*]A$4R>I@V'1d
DL6P<EaiI!Bl/8-$>aWhA0<77De*ZuFCfK$FCcg/$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<XTo
F<G!7GAhM;Bl7Q+A8-'q@ruX0GqL4EFCf]=FEDkEDe*ZuFCfK$FCfkCB4YslEaa'$F!,=.Ebf3(
GA\O3DIa1`+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMt
Eb/a&DfU+GF)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO>[h8WBl89@
ATD6gFD5T?%17/fFD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL:-pQUGA1r*Dg-73$?Kd#
C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBsBl8'<%16?ODIe*;ATD6gFD5T?%16?S
FCf:u$6UHhF`&=,FCf]=FEDkBEc>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,
/g+D@AU&<=FF.Y@E,961I16N++D58'ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&
Bl[cpFDl2F/g+,,AKZ#3Dfd+,9OUn3=FOjrCh4%_+<YB>+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!
%16?LAS5^pHZit@@UX@mD1)j#B6%s-BlkIFC2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*ZuFCfK$
FCd(HAU#=,$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'FD,5.
Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkBEc>i/F=qta7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(
A0?)1FD)e%FCf]=FEDkKA7fXdFCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5
CghEsG^V1e=`8G'+Cf)'Bk(]sGA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHk
DJ<U!A7ZlnBOPpi@ru:&F"SS)DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth
+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H
$=%.[A:%m*F_t]1@<?(/%13OO<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>
@;^00FDi:1A867.F=n"0%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=
FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&
+Cf>+F_u#;/g+,,AKYMpAmoguF<G:=+D,P7EZeh6F<G[=BlbD6@<iu9ATN!1F<G:8+Dbt6B-;)#
D.Rc2Ecl8;Bl7Pm$6UI5DeEX'BOu3:+B38%A7]7kARTXk+E)9CBl7F$ARTXk+DG_(AU#>-DesQ5
DK?q1BOPdkANC8-%16?LAS5^pHZit@@UX@mD1)j#>[h8WBl897F_l/6@rH1)I=!f!>?l5\@ruF'
DCU!<Bl7HmG]$r,AURhn$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$
AUP\FEa`p.+Dbt6B-;86F`Lu'+Cf>#AKYf'DImlA+BNSlE,]N/B-:o0%144#@rH7,Ec5c1ARlom
Gp$@6AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"ATDiE%144#6YKnG
B4W3-BPDN1G%#30AKY]!+F.mJ+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7CAM,*,Ea`p+ARlp"Bl7L'
+CT;%%144#E,oN"AS#C`A0?)1FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e5u:6D5t$,DGA2/4+Co%q
@<HC.%144#>X<1;Ecb9!CO9<.AU&<=FF-2(/hT>9I4bs9>\.e`HY%);D.R`rFCfk0$>j3hBkCpt
FD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(
Gpa%.<^fnb8P`)E3[ZX70J5(-%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B
+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c
$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@
GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi
@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-pl
DffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6
A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARl
De*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&
0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!
0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'
DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=
F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&
Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.
+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=
@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c
:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1
%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T
%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$
EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5
FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;
%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'n
CggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm
:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/heX^
$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D
-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2
C2[W8E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEp
ATLOR@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6Oc
E-ZP:E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'
Bl7QU:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8X
.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7
-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".
F)N12Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;
+EVNEF`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%
+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%
DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZ
AKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj
0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o
@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk
5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70J5(-%15R#
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
B4W_*$7QDkH?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XHCghEsGT^U4
Ch54A8l%htF)Q2A@q?csEt&I&+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4rF)to6/g+,,BlbD/
Bl%>i$7-g'F)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..NtEbSru%14C(Bl8$2
+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+FD,B0+D,>(AKZ#)
EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeD
@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>
+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*+<YuVH>7A/D..-r
%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YKC
@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%"^
FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6IXWLa8l%j'+B*3$
EarZ'6Z6LHI16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-
CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$=%X`
FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi%16?W@;BFrBln0&%16?^
@:F%aDe<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Df.1LAU&V4
$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F*)>@
AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm$=%I[GApu'AISuOBl7m4
FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.DesJIFCf]F%13OO-!Y>!
GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO>]++sE+*Bj
%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3
I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3                      ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&o0d&A1+>GSn2DZI10d&>/+>GYp1c8'&6qU6C:2b5cF(96%@<?'k3Zp130K!BP@kf\\
/KeP:@;]^hA3(hg0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^<)5nX?V4*^?Ys=pDfp)1
AKYT'EZf%;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG':IIu2D.I*u
Bl%<pDe*QsF*2G4@<?(%+Cf>,D.RU,ARlouDe*QsF!,O6EbTK7F!,17+DPh*B5)H1A8-'q@ruX0
H"(o1Ch.:!A8G[rAU%j!DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T/~>
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
zz=:zz,'PFX IFACEWORDSjodliterate JLAUTHOR JLCODEFILE JLDIRECTORY JLGRPLITT'
zz=:zz,'EX JLOVIEWFILE JLOVIEWTEX JLTITLEFILE JLTITLETEX JODLiteratePreambl'
zz=:zz,'e LATEXTMP LF MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP ROOTWORDSjodlit'
zz=:zz,'erate THISPANDOC WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAPPREFI'
zz=:zz,'XTEX afterstr alltrim beforestr betweenstrs boxopen changestr ctl c'
zz=:zz,'utnestidx dbquote dbquoteuq decomm fboxname ferase fexist firstones'
zz=:zz,' formifacetex formtexindexes fsize gbodylatex gheadlatex gpostlatex'
zz=:zz,' grouplatex grplit ifacesection ifacewords indexgrouptex jpathsep j'
zz=:zz,'tokenize latexfrmarkd markdfrghead markdfrgpost markdfrgroup markdf'
zz=:zz,'rwords markdj markgassign markgnonj read rtrim sbtokens setifacelin'
zz=:zz,'ks setifacetargs setjodliterate tlf toJ tslash2 utf8 wfl winpathsep'
zz=:zz,' wrapvrblong writeas''),<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION'
zz=:zz,' CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNR'
zz=:zz,'PATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR05'
zz=:zz,'6 ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ER'
zz=:zz,'R066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075'
zz=:zz,' ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR'
zz=:zz,'086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 '
zz=:zz,'ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR103 ERR104 ERR1'
zz=:zz,'05 ERR106 ERR107 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS ND'
zz=:zz,'OT OFFSET OK050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK0'
zz=:zz,'60 OK061 OK062 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr all'
zz=:zz,'nlctn allnlpfx allnlsfx apptable appwords backupdates badcn bcheckn'
zz=:zz,'ames bgetdicdoc bgetexplain bgetgstext bgetobjects bnlsearch bnums '
zz=:zz,'bpathsfx btextlit checkback checkntstamp checkopen checkpath checkp'
zz=:zz,'ut closedict createst defwords delstuff delwordrefs didstats dnlsea'
zz=:zz,'rch dupnames freedisk freedisklinux freediskmac freediskwin fullmon'
zz=:zz,'ty getdicdoc getdocument getexplain getgstext getntstamp getobjects'
zz=:zz,' getrefs gslistnl inputdict invappend invdelete invfetch invreplace'
zz=:zz,' islib iswriteable iswriteablelinux iswriteablewin jdatcreate jword'
zz=:zz,'screate loadalldirs loadallrefs loadwords mainddir mnlsearch newdpa'
zz=:zz,'rms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendic'
zz=:zz,'t pathnl pathref putdicdoc putexplain putgs putntstamp puttable put'
zz=:zz,'texts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub spli'
zz=:zz,'tbname''                                                            '
zz=:4027{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,U11+>P&q+>Y`-3?U%2+?;GA0H`=t1b^X>C2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2
@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2
Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-
F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#
+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;
DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is
/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$
%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)
$;No?+<Ve9B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2$;No?
+<Ve9DJUF<+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+
Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdL
A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5
FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs
:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL
+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8Z
B5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL
@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe
+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@ltEd8dF
@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'DIIR2
%15is/g)8ZDe't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!CLeP1
+E1b!CER/%@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-ppDf[HP
ATT&)ATVL(@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/ltF*(u6
+CQC'Bk)7!Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k+C]U=
-u`U)CLek'$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8
+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*n
Ec5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'
Ec`EOBkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,eEHPu9
AKW@8Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlotDBO%7
BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h+F5/H
De!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ:*<P3
5tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0AKYQ%
A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQUD.-pp
D]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#AISuA
67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a;Fs\a
4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK9gMZM
6r-lZ4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?+DkOs
Ec3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?4
5uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/0F\@g
78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dKASbs$
Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23uA90dS
=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F<Cp.Y
/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl4ZZe.
+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*@<,dd
FCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI-OgDZ
5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(nEcW@6
AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O-Rg00
/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloqBl%?'
DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z+=f&t
>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2Et&IO
67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*F!,")
Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'6r6cW
7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*BHS[;
De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X!Blmp,@<?'U67sa&De*Zu
FCfK$FCcS9/M/)XASu("@<?(%+Dbb6ATD4$AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q@ruO4
+D,Y4D'2GH6m-,_Dfp#?/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQUBQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9%15is/e&._67sBp
DKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU+D5_6Ch[u6+<VdL
+<VdL/Ken=CLnW)@<?(*+D,P4+D5_5F`8HOGps10:-pQU+DGFr@qB^m@ruF'DBL&E/KebFFCfK)
@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQU+EM+9C2[X!Blmp,@<?''/Kf"QAT2'uAKYT'
EZf=ADe!@"F(oN)%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp130f!ZWF>,EY$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GWi@rsC\+=MI`+D5_6Ch[u6
@<-"'D.RU,+CSekARlp*D]j+DE,]i/F)rIEDf9_?FCf\>Dg#]4GB.D>ATJ:f:-pQU0f!ZWF>,No
B6%p5E$._A5sn(B:JsSZB6%p5E,K*$AKYZ3E+O'+Bl7]tA.8l@67sB812gZE0JstnAT2Ho@qB0n
4$"L'@<-F'DJ()9Bln#2.!K9>.3L2bBOPdhCh7Z1@UWdiC*7#)A7Z2W:-pQU0f!ZWF>,Zs@:Wn[
A0>H(Ec5t@BOPdhCh[d"+>"^VAT2Ho@qB0n.!K]GFCcmDGA2/4+=MGSBlmopF"%P*:-pQU0f!ZW
F>5Km@:X+qF*(u(+A?3CAQU'oEb/Zr@VfTu/KeP:@;]^lDJ()/Df0K*Df0Z<%15is/g)l(De!lD
1*C"9A7]9o.!&j>Deip%F"&4`+E_a:Ap%o4AoD]4@;]LiH$X1BB-:]&A7Zm*AU&;+$;No?+>GWi
@rsFa+CSekARlo3GB.,2G&h&.Df02:+>"^PDf021F)Q2A@q?d!Bl7L'+Du+A+Eqj7E,]B!%15is
/g)l)A7]7+3?Va@A7]9oFDi9MC11UfF"&5%Bllmg@N]]&E,Tf3FDl2F%15is/g)o'D..]D2]uO>
C3=T>ARlp-DfTA2AoD^,@<?4%DBL?OAo&n=AoD]48g$,H0JO"D:-pQU1,*QRGq_3#F`:l"FCeu*
AoD]4@s)g4ASuT4-u`U4A8bs,+Eh=:F(oQ1F!(o!%16T`@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDm
DeX*1ATDl8-Y[=6A1%fn%15is/h1CCE+NotASuU2%15is/g+\9@r,RoARlorCi<ckC`mD&Eb-A8
D]iJ3DeW`)@rH6sF`V87B-9lV<+T/SDIIBnF!,[@FD)dh+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_
78u]X+A,='<_5_]<(0n38k_`Q:eXG[<(0n38l%iKBlmp,@<?'WEb/Zr@VfTb$4R>;67sBYDeEX%
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
4)JSG.3Kr[4$!fX%15^$6qL9F6W?iZ=Zneg-RT?1:-pQ_ASu$hAT23uA7]Y#Et&Hc$4R>;67tA_
IXZ`p+F>4`CghEsGT_DD$4R>;67sBnEc6)>+EV=>Ch4_tDIakuF`_;8EZcqVF*(i.A79Lh+C&bl
CLqU%FDPLt$;*uk8Q8AP<(0nP3Zp+!3Zp*c$7-g2@<?(*+CTD7BQ%o6@;]TuFD5i5AISuO@<H[*
DfU2R,CX'DFD,T5INs;i%16?^Bln0&HX(Z(G]\%LH[[2gB6%p5E.0$\I3;%#Dfp#I%14Nn$4R>;
67sBnEc6)>+E)F7Ecu/.G9CR1@:Wqi%15^$:KC%U=&_Uj4ZX]>+?CW!%14C(FD,B0+DPh*Ch\!&
Eaa'$+E)F7Ecu/.G7=maF(Jj'Bl@m9>]aP%FEDVOINs;SEc6)>INs;i+A[/lEcu/.GC9o-.1HUn
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
>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1@<?(/%13OO,p6Z>Bl%<&A8bt#D.RU,+DG_(
AU"Xk>]k+!E+*6l@:s.uD..3kBk2I:%13OO,p6]9Ci=?8%16?_F(K<!@r#LcAU@p*Ci=?B%16?N
AS,XoARfXpDfU2GBOPF_@rH1%Ed`:47m_WN1,LsA1,LsA1,Lt=%14C(C*7#)DKKo;C`me@Eckl6
F`M&7+:SZ_A7]@eDIm<rCi=?@CLqd8@rH1%Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+D#e:
Ch[BnF<G"4B6A'&DKKqBGT_8SD'3^=FWbi:$=%+QAnc-o@rH1%EdM>*FCAZtCi=?BHZEb.I=!Y#
0f(@7/i#F<0J54=I16N0+DN$:F_tT!EcW?T+CT)&+EVmJATJu8AS!!!/pM5L%16?NAS,XoARfXp
DfU28ARfmnDes?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HX^E)ASu!rCi=?B
HZEb.I=!Y#0JG%3/het10J5=>I16NgA7]@eDIm<rCi=?@Ao)BoFCT6*DfU8QEbAj0HS@'+0J"n1
0JG%3/iYS6%14C(C*7>2@ps0r@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM;0@<,jrCi=?BHZEb.
I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@F*)G:DJ*HtCi=?BHZEb.I=!Y#1GLF7/iGC7
0J5%7I16NgA7]@eDIm<rCi=?@@rH4$ASuU"Des?4I=$!I@XWSW/i>O<0J5.=/2/\10msK<,p7/I
Bl.R+Bm+&1@:XOmEaj)4@;]Tu@rH7"F`(]2Bl@m1%14CdA7]@eDIm<rCi=?@DffZ(Eas$(DfU8Q
EbAj0HS@'02CpO71Gp^;/hf#.+<Vd9$=%+QAnc-o@rH1%EdM_HBOu3oDes?4I="j^6@F27/2/V1
2)Tdk$7-g-Ci<ckC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@@;KLqFCT6*DfU8QEbAj0HS@'4
1b:=50fCR:/ho84%14C(E,oZ0Bln'4AKXSfG%G]'F!+n/A0>c.F`&=>@;TRs%16?NAS,XoARfXp
DfU2:F`(]!Des?4I=$!I@XWSW/het10J5%5/2/\10RY&d+<Vd9$4R>IF`V,5@:O(]B4ZF%@;]S#
G&h&?%16?.AS,XoAQ*8\Ecb>nEai6_Df'?"DId6j@<-EP>[1N\>^]n)>^Ur/$=#u1Anc-o<b6;\
@<?4#7;d9_Ec5i4ASuU:882^MCh[NqFD5W*I=#"+EaiI!Bl/9F@rH4$@;]UcBOPq&4^;5sHX(uI
%14C(6"FLK-S/kJDKKr6H=]6EF)>?%CaU?;DfQt;DfTD3@q]:k@:OCjEcW@BATAo0Bl7Jk$4R=g
+E1b,A8bs#B4YslEaa'$A0>r=DKK<3+Cf>+DfTQ0B-:]&D/E^!A9/kF+DtV)ATJ:f,p6W:AKYT!
G\(D.Bl5&+ASu("@<?'k+Cf>#AKYH)F<G+*Anc-sFD5Z2F!,=.Gp!P',p6Z.+EM+9+EVNE@;^?5
G%#3$A0>u*G]Y'?DfT]'FED57B-:]&D/E^!A.8lNF`V,5@:O(]B4ZF%Ea`frA:4mo>]++sASu[*
Ec5i4ASuU:;eTTMARp49I=$AO$=%I[G@PQ.D..<mHX'3TH$=1IA5mJ_I9SF3HX(Z(G][G6Ci=?@
CLqd8@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3,p7DMEbf_=@V'Y'ATAo;Bln#2;f?f!@q?cMDe*E%
:i^I`$7/qpATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,Des?4HY[2<G@PQ-DfU8QHQt7n
I=2P3>]++s@rH4$@;]V&>XW"B@8qMkAQ3S`I9SF3HX(Z(G][G6Ci=?@A79Rg@rH1%Ed`:],;FUp
I16N0>]++s@rH4$@;]V&>XW.5<affDDejc*0jT-2FCf]=@rH1%EdM>.@s2@#Ci=?BH[?tlI=6MQ
$=%I[G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1HQt7nI38t+>]++s@rH4$@;]V&>XDk?APQ3CCOKDA
?$fguAU&<,Des?4HX^E)ASu!rCi=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX'$VDdd`eDejc*0jT-2
FCf]=@rH1%EdMD7Ddd`tDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QKBOPp\Dejc*0jT-2FCf]=
@rH1%EdM;0@<,jrCi=?BHX(Z(G][D,H[?tlI=6Nl%16?XATqX&D/E^!A:%Q[FE2)5B2iebI9SF3
HX(Z(G][G6Ci=?@F*)G:DJ*HtCi=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&pVD/Ej%FB!0oI9SF3
HX(Z(G][G6Ci=?@@rH4$ASuU"Des?4I=#4@AU&<2FF/?Z0n"IuI16NgDIn$%Df'?"DIe*!:NU8]
E`?smI9SF3HX(Z(G][G6Ci=?@DffZ(Eas$(DfU8QHQt7nI=34I$=%I[G@PQ.D..<mHX&jQATDll
Dejc*0jT-2FCf]=@rH1%EdM52ATDm&Des?4I=#4@AU&<+Ap\kL0n"IuI16N0>]++s@rH4$@;]V&
>XijR@ruF'DH(OiI9SF3HX(Z(G][G6Ci=?@Ap&!$@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!
7WiTYFD5Z2<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!;IsKTDf/9XEbf6,<,ZQ#>;9E1HQt7n
I16NgDIn$%Df'?"DIe*!7<3EeE`?smI9SF3HX(Z(G][D,H[?tlI=6MQ$=%I[G@PQ.D..<mHX'<a
Ec#6$<,ZQ#>;9E1HQt7nI16Mm$7-fe:IH=DEbT*&FCeu*@<Hg/Ch[<uGp$U8D/E^!A9/l*DfQt>
Df^"CE,ol,ATMp,DJ()2@;]Uo@j#DqDImisFCeu*CghEsGRY!bDIn$'DK]`7Df0E'DKL4t:II]n
Dfp"iART+\Ed`:_H[Q>1>]++sASu[*Ec5i4ASuU:8l%iODf^"sEc5H!F)u8?I=$BhI16Mm$=%^p
AT2'fCLLjeHY-](@sM`uEd\B(>]=+aATMs=Ch7s*@;]S#I16Mm$=%:WG\(u.GRY!&+C'&1AT2'f
CLLje>B=@tE+*BjF(or34_A,=F(HmF,p7/8B4W3,BmO>5A7]@eDIm?$@X0)@ATVL.%144#+<VdL
+<VdL+<VdLF`(o'De*EBAmoLsALnrH+<VdQ+E_R9@rGmh+C]A&@;Bp,GA(Q*+E_a:A0?)1FD)eA
ATVL.%144#+<VdL+<VdL+<VdLG\(u.G[5Z0H#R>8Eb/j2%16?OCia.s$6UHrF`V,5@:O(]B4Y:i
DJ<U!A7[oGEckr!HY@\DATDg&Apk*q>\7[Z$4R>IBR+Q.EcYf6F`;\:Eb/ZpCh[d&F$4VcF_**5
$6UH6+<VdL+<VdL+C]8-CMdL#CNDX\EckqE%144#+<VdL+<VdL+<YW6Amoh(BQ%oSH[RFS$6UH6
+<VdL+<VdL+E1k'FD5i5ANbBg/.Dq/+<VdL+<VdL+<Ve:Des?4Ch[d&F$4VcF_**5$6UH6+<VdL
+<VdL+E_^@@rH1%E]mlJF_**5$6UH6+<VdL+<VdL+Dbb0CL_:!DfS!X@:s.hFC?^0$6UH6+<VdL
+<VdL+E1k'@W-9tATBq\0H`%l0R\?Y$=%X`FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%16?]ATVa"
DJ+')HX(MuEcZ#1E.*'kE-*4ACiseA12q=XD/!m1F!*2VFF=T*>]XIuCh7KsFD-#+ASl"!B4Ysj
H#n(JATVEqI=!b]D1*NL,p7/IAThX&F<GLFATDC*Cht51Bl7L'%16?]ATVF#F`);4EdMk=@r?F+
A7]_%BRP4]I16Mm$7-g8ATMF)+DbJ.AU#>3DId='+EVNEF`V+:AoDg4+Cf>+F_u#;+>"^HAS,@n
Cige6F!,RKD[d%"+EqL5@q[!*ATN!1FE8R=DBNb6FE8RCAfu;+F*(u(+E1b%AKZ&5@:NjkBl5&0
@;]Us@ps=f%14C(:/=hX3ZqjAC3=T>+DGF1Bl7HmGT^m4D.Rc2Ecl7BFDkf'FD,6++:SZ(+D,Y4
D)reQFEDI_0/%NnG:m]?FCf\K@rH4$F`(o8GqO#UB.nFBATr67E+rf7E+j2TAj%stF?M?;1GoUK
>]k+!E+*6l@:s.uD09Z:Bk)'tI16NgD..3k@<?<sFED)7%16?\ASu('ASu[*Ec5i4ASuU:FD,6"
DId='I16N++F@@-AjCH^De!^%F_u"*$6UH6+<Ve35]UFWFDl&.@rH0q@;L!r%144#+C&JoF(Gdf
+<VdL+<XoSEb0<6Df0,rDesN9F_)!h+<Ve3An_\]+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.Ecl20
I=!YeFF=T*+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.I=!b-E--L;$6UH6>[h8WBl897F_l/6@rH1)
I=!f!>?l5\@ruF'DCU!<Bl7HmG]$r,AURhn$6UH6>]!niCLV4(BR<uY@;BFSE,]B/@psFi>\S(d
AU&*$D.S,A%144#+<VdL+<VdL+<Z#99jqgK<H)ngEarO!AR&qeA7^"'@;TS(,n12(+<Xp2BPDO,
@:s.mFEq\6HZ3e0Bl8>.$6UH6>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$6UH6>]XIuCh7Ks
FD-#+E+*d.CM@a9HSBD\+E2.>F!*.h1N7Ga%144#+C&quCghPt$6UH6>\mtn>\S:kD-T>?A9_g1
ASliA%144#HX(-"A:&09CijB$DesKC>\Re8Eb0<6Df0,rDerZsDIm<rCisT4>\._mAR&_]ARTUu
@:s.VAncZ&$=%FVCLpprDffZ(EX`?b$=%FVCLq3tA7]up$4R>I@V'1dDL5o4@s)X"DKL:9$4R=k
%15is/j;IJIXZ`\De*p2DfTDa67sa&De*p2DfTD3@kB8TF*)>@@:s-oDdmHm@rri'CghC+3Zr!Y
FCf?2Bl@l3De:+?C2[W3/e&._67r]S:-pQU882UGF!,R<AKZ,5A7]dtH"h//+Cno&@:EYdAM7Y0
Ch4`1H#n(=D'3tBARlp*D]j+CDfTCu$;No?+Co1rFD5Z2@<-W9DdmHm@rucE+AuciCgggfDJ()6
BPDN1@r,RpF!,1<+CT)&+EV:*F=2,=$;No?+ED%5F_Pl-A0>u4+Cf(nDJ*N'FD,5.A8,OqBl@lt
Ed8dKFDl2.B4W3,H#n(=D(Z8):-pQB$;No?+BE&o@N]B&FCfK)@:Nk0%15is/g)8Z@Uj(_@r#sj
D.Rc2+Cf(r@r$-.@UWb^F`8I@@;TQuE+*j1ATD[0+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<Y-+ATVHs@q9Lf+<Ve>ATT&(@:O(qE$0=8EcYr5
DK?q=Afu2/AKYMt@ruF'DIIR2+CoD#F_t]-F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
%15is/g)8Z@V97oAU&01@;0U%+D58-+C\bhCNXS=G%G]8Bl@m1+E(j7F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<Y-+ATVR+FCf]=+<Ve>
ATT&(@:O(qE$0=8EcYr5DK?q=Aft`,Dfp"PF*22=AKYYt@:WqiF!)SJ+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z1'@VTIaFE8QIB4Z0-DdmHm@ruc7Ao_g,+C\bhCNXT;
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z
@W$"'ARTUhBHSE?+EM+&EarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtA
Bl.g*AKYJr@<,ddFCfJ8Ch[s4+E1b2FCfK1Et&IO67sB'+C]52D0$gB+<VdL+<Y]9FEMVAF!,UC
BlS9,+C\bhCNXS=DfTB"Eb/c(Ch[s4+E(j7A8,OqBl@ltEd8d:@:O(qE$0%@D.7'sF!)SJ+<VdL
+<VdL+<V+#:-pQU+<Y0-ARfLoE+No0+<Ve:BOt[hF!,1/+CT/5+Co1rFD5Z2@<-W9BlbD8E+Nnr
$;No?+<Ve:BOt[hE+*j%+<VdL@q]F`CNCV.F`MM6DKI"?@<?0*@:s"_DKBnBA8,OqBl@ltEd8dH
@<?/l$;No?+<Ve:BOt[hE-67F+<VdL@q]F`CNCV4Aft]"EcZ=FE+*j%+Co1rFD5Z2@<-W9BlbD*
+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve:Ci=B+A8,Oq+<VdL@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?
+<Ve:Eb/[$ATMr9+<VdLBl7X,BjkglH=_.?F*)>@@:s-oDdmHm@ruc$$;No?+<Ve;AS-.)Eb'56
+<VdLA7]@eDIjr7DfTB0%15is/g)8ZA7]RuFEM2-+<VdL+Co&"ATVK+DdmHm@ruc$$;No?+<Ve;
Bk2:,@<?Q5+<VdLA8,OqBl@ltEd8dKFCB9*F*),+F!+n/A0>i"FD)e2DJ!g-D..O#Df-!k:-pQU
+<Y34Cia/rEarc*+<VeJARTUhBHUo*EZf7.D.Oi/@<?U&Ec,q-$;No?+<Ve>ATVI$@s)X"DKI!D
B4Z0-DdmHm@rri(De!p,ASuTuFD5Z2%15is/g)8ZB4Z0rG]7J-Bl5%9+D58-+EM47Ec`FB@VTIa
F<G.>E,8s#@<?4%DK?6o:-pQU+<Y<.FD#Z:AU&;>+<Ve>ATT&-Ec6)>+CT.u+EM[>FCcS9@rc:&
F<G[:G]XB%:-pQU+<Y<.FDc2AFCB$*+<Ve>ATT&4@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJ
Bl.F&FCB$*Et&IO67sB'+D58-DdmHm@ruc7+<Y<.F<GL2C1UmsEt&IO67sB'+D58-Eb/j(+<VdL
+<Y<.F<GU8An?!oDI[7!%15is/g)8ZB6.m'F*);9+<VdL+D5_5F`8I3DIal2F_Pr/+DtV)AKYf'
F*)I4$;No?+<Ve@DK'`?A8,Oq+<VdLFCfN8+D,P4+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8*$
:-pQU+<YB9G%#?/ASu$$+<Ve8E,]B+A0>T(G%G]9ARloo@<>oe$;No?+<Ve@DK]Q%Ch7^"+<VdL
A7]RgFCcS/DK]T3FCeu*A79Rg%15is/g)8ZBl8*+ATVEq+<VdL+D,2,@q[!!DK]T3FCeu*A79Rg
%15is/g)8ZBl8*7AT2Ho@q?c*+E_X6@<?''Bl8**Ecbl'+Cno&@1<Q=67sB'+Dtb7Eb/loBk)6-
+<Y07ART[l+Dtb7+E)9CEb/ltF*(u6+Co1rFD5Z2@<-W&$;No?+<VeFE+NotBk)6-+<VdLDfB9*
+CQC'Bk)7!Df0!(Gmt*U67sB'+E1b2BPqW/+<VdL+<YW3FD)e7@;TQuCh[s4Et&IO67sB'+E2IF
AU&01@;0U%+<Y`IDfTD3F(fK4F<GL2C1Ums+D#e:Cgh3iFD5Z2Et&IO67sB'+E2IFB6,1<+<VdL
+<Y`IDfTD3B6%p5E-!.1DIal2F_Pr/Et&IO67sB'+E2IFDKKrA@;Ts++<Y`IDfTD3DIIBn/0JGC
ART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<YWGFECr#Ch4_3+<VeJFDl22+=M,9
D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aEt&IO67sB'+E2IFFCf]=F!)SJ+<Y`I
DfTD3DdmHm@rri(De!p,ASuTuFD5Z2+CT.u+D5_5F`9!TF_Pr/+EV1>FE7lu:-pQU+<YWGFE_YD
A9/k9+<VeJFDl22+EqaEA9/1e:-pQU+<YWGFE_YDA9`-9+<VeJFDl22+EqaEA0>N$Ddm-k+ED%*
ATD@"@qB]j$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X(FDl22+ECn.
B4W2>2)$U:1cZuo$4R>PDe!TlF)rHH-Xgb.A92j2Eb-U-$=e!gDKBB0F<Dr>C2[W1%13OO:-pQ_
A7]^kDId<rFE8RL/M/);:IK8GDfTD3A7]^kDId<rF<G+*Anc.)Bl@m1%13OO6V^?A;G0/60H_J\
+<Ve%67sBmBl%?'@rH4'Df0-(F?1OSDfor>+CT.u+EV=7ATMs%D/^V7@<-,m$:@Q^8Q/SO3]%s%
+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)Bl7HmGT^g:F*%iu6V^!E9i+bO3]/$&
+<Ve%67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri'Df'H3DIm^-+Dbb5F:AQd$;No?+DkP$
DBNJ(Eb/a&DfU+GAnc'm+Cf>,E,TW*DKI";BleA*$:@QV8Q%]46V^?A;G/Q.:/"5X<%LC36VgEQ
;[j'C$:@QU9L2TU4ZYJD+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^GAhM4+DtV)AKYK!@<6K4DfQt;
@:O=r+EVmJAISu6:.%oJ5u^EO:-CWt+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrW[ASrW/@VTIaF<Gd9
F!,(/EcZ=F@rc-hFCetl$:@QV8OGmA6TmIc+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8d<De!p,ASuTuFD5Z2+>"]aEb/lo.1HVO:.88]9L26F4ZY;P+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZrKWDfTqBAU&01@;]LqBl@m1%15Ht:dIuR;a!/t+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+Co1r
FD5Z2@<-W9E+*cqD.Rg#EcVZs6V^HX<('#O76N[j+<Ve%67sBmBl%?'@rH4'Df0-(F?1O\@<6N5
FD5T'+E(_(ARfg)G@>P8-ua<N.1HVO:/XMM4ZYGNBeD.`1*B=Y/g,1GAn?!oDI[6#@rH4'Df0-(
F<G[6@VfTb$:@Qd:dJ&O4ZY;X+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^Eb/ioEb0,uAKYr#FD)dK
+=Lc7A8ZO,.3NG@F*%iu6V^QO>"(S83?TFe+<Ve%67sBmBl%?'@rH4'Df0-(F?1OcBmO>5De:,1
@VTIaF<G:8+C]V<ATJ:f%15is/g+kGG%G]9ARlorEc6)>+CT.u+EM[>FCcS*@<>p#Anc'm+Cf>,
E,TW*DKKq/$;!un7oE,_:fBM<+@An#<E)@P<(/?*:.%oJ5u^EO:+Sb-79EA[5tOf\$;!un;cQCg
78l?1+A#=/7oE,_:f@f1%15is/g+kGG%G]9ARlp#@:O=r+CT.u+EqaEA0>DkFC?;(Bl%?'@rH4'
Df0-(FE7lu8PW;\5snOG;a!/a6V^!B5uU]56V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P
:eX/H:(7P%:0(Fl;FFGH3ZoP::0((T6W-]Y%13OO:-pQUBl8**Ecbl'+EV19F<G+&FC>Uc8PW;c
78m/a4ZX]Q:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F%13OO:-pQUDIIBn/oDeM
EZf7.D.P>;@;TQuF(K<!Eaa'.EZek*@<,ddFCfJ%$;Nub<'<8i/ghbN$4R>;67sC&EbTA5EbT0"
F<DuREa`ZuBl7Q4+E1b2BHUhsCh[a#FCfK6+<`-_.6T:+:dJ&O6q'cY$?C)rFE2)44ZZjk,CUb>
3Zp",+BplL.P<AZ/g*tV<(KDG9Hmgd4Wn#>$4R>;67sC%E,961+C\bhCNXS=DIIBn+E1b2FCfK1
+Cf3s$?L0&Blmg%@;TR=3ZohG6r-c/@V'.iEb0<6EZdFd:..lW-=LM.ATDj6E[_G)%15is/h1FM
A7T7jASu$iDKKq                                                            ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
1E\P#-p0UR/mg=U-Qk`E7nHHI:..NQ+@T$n8PVZB=<L(!91;fU91;TS+A$lO:IJo7FCfK)@:Njk
8U=!)7!*?cCi^^jH:gt$F`_>8FCfK)@:Njk8l%iS:JXY_<_Yt)8l%iU9gg+%:JXqk:JsSZC2[X!
Blmp,@<?''<(KSZ:dIiE:I?7+;F+,U;FO&H=<L[C5u:BU77KjN<(0n3@:WnbDdd0t@rc:&F>4nK
@W?O/FCfT7+D,P4D00?6Bl7HmG\(q=B6%p5E,8s)AU#>6@<?(*Ao_`sEbf2.D..I#B45k&BkM<+
E-68EAU#>=ATVC(Bl%<jBl\8;F`:l"FCf3*A7TCqFE2))F`_>9DBO.D@;pC1@Vft#B.#,Z-p01/
0I\P$4?P\X?SNZN+DPh*+DPh*Ch\!&Eaa'$+DPh*F*)>@ALAoX-p01/0I\P$4?P\X?SNZN+A,Et
6<-TN6qBmJ<)6Cp+A,Et:2b5cF'icp+A,Et<)6:`;aOJU9LMEC;cHOj=WgL66qU6C:2b5cF!+:T
;cI+=De*ZuFCfK$FCcRo:IIuc8l%i^D.FbuF_PZ&C2[WsC3(M,F_PZ&C2[X!@<?(*+D>J1FDl2F
C2[W*BPDO0DfU,<De*Bs@j#N)A8Gt%ATD4$AT)a+ATqL'AU#>7@;]dkATMs.De'u-@;]dkATMs.
De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'+F8?[C2[X"@;0UdFCf\E.4cl01*A>-,Vh&/0JG@<
3%d'G3AN?I0f_391,(I;0JtOD/i>LH1GgjD0K1+00JY=92)%!B2)m9J2E*EI3$9t10f^sD0f1L>
3&roQ1G^gB+>PW*3AE9D1bLUE3B&]L1G^d/1,(FC0etI?/i5OJ2_m0F1GU(.0JPRB1,1U<1cRKS
1-%'E0d&5*0f^sD0f1L>3&roQ1H%6M+>PW+0JG@<3%d*J0etXH2)ud70JY=92)%$C2)d3D0JYL@
1a"P-1,(C>0KCaC3Ar`K0ekF>+>PW+0JG@<3A*-D3A`TJ2*!Q;1,(I;0JbIA/i>XK3&N]T3ADX3
0JY=92)%!B2)@3I3A`ED2BXb/1,(C>0K:[C1c-mE2`ENI+>PW+0JG@<3A*0K2`<NR0f:d11,(I;
0JtOD/i>I@2E!BI2BXb/1,(C>0K:[B3&!3G3&E?H+>PW+0JG@<3A*3E0JtgG1,CX-1,(I;0JP=<
/iPUD2D[0E0d&5*1,(C:0f^jC0f_3L1c-mH+>PW+0JG@<3A*-C3&*?N3&<H81,(I;0JtOD/iGL>
2DI3I1,L+/0JY=92)%!B2D[$F2`3KR2BXb/1,(C>0K:[C1,CpN3&rrQ+>PW+0JG:<3%d'F1,L^G
1c7061,(I;0JbID/i>I@1bh!I2)ZR40JY=91GUpB2)I'F0f_'J2BXb/1,(C<1,pmD1bpmC1c$s2
1,(I;0JbID/i>I@1bp1/0JY=92)%!B2E*?G2E3QS+>PW+0JG@<3A*0J0JP7:2)7!21,(I;0JtOE
/i>XI2)$a>1,C%.0JY=92)%$C2D[?J3AWTP1*A>+1,(C<1,U[A3B/uU3B&rQ+>PW+0JG@<3%d'E
3&3KN0JGC-1,(I;0JtOD/iGOC0K(jK1GL"-0JY=92)%$C2Dm9M1c.!G1E\G,1,(C>0KCaC2_[-K
1cI9O+>PW+0JG@<3%d'J2`*6F2_[!01,(I;0JtOE/iGF<2)mBI1GL"-0JY=90etR<3&*BN2`<BM
0d&5*1,(C:0f^jC1,:R?2E3KQ+>PW+0JG@<3A*-C3&<6F2)RBC/1<V7,VUYu-p07-1F+_01,(C;
0ek:?0ek@A1bg^-1,(I;0JtOC/i>UC2`E`S1,U100JPRB1,1[>2)I-K2DR$I+>PW+0JG7:0ePF?
0ebRD0eje+0JY=92)%$C2)d3J3&EQM1E\G,0f^sD0fCXA1c.-L1,:g</1<V7,VUYu-p07-0f:43
0JPRB1,1U<1cRKS1-%'E0d&5*1,(C;0eb493&rlP2D[3I+>PW*3AE9D1bLUE3B&`J0JYF,1,(I;
0JY@:/i,CD2Dm9F1H-F30JY=92)%!B2E*KJ1,UsM2BXb/1,(C;0eb493AN<J2)dHO+>PW+0JG4:
1bLaC0JYUC2)6s11,(I;0JtOE/iGFC2`3QQ3$9t11,(C<1,pmC1GU[=1c.*M+>PW+0JG:<3%d$D
2E!?J2_m031,(I;0JtOE/iG[C1cRBP3Ahp70JPRB1,1U<1cRKS1,CdB3$9t10f^sD0f1L>3&roQ
1H%6M+>PW*3AE9D1bLUE3B&]L2).'51,(I;0JtOE/iGF=2*!WV0JO\*0JY=91GUpB2)I'F1,LdD
+>PW+0JG7:0J5.A2D[9M1,q071,(I;0JbID/i>I@1bppB2)ud70JY=91,1I81H.!C3&WKG0d&5*
1,(C>0K:[C2`3<F2)[HQ+>PW+0JG:<2(gaH3AWHN0KCm21,(I;0JP=>/iYU?1,q$H1,C%.0JY=9
2)%$C2DI-L2)mKR+>PW+0JG:<3%d$D1,1I>1c@<91,(I;0JbID/i5@B2D[0K1,C%.0JY=92)%$C
2E3BI3&W]U2'=Y.1,(C<1,pmD1bpmB3Ar]L+>PW+0JG:<3%d'F1,L^G3&*641,(I;0JbID/i>I@
1bh!M0f1".0JY=92)%$C2DR3N0JbIA0e"Y%4>838-p014/1<V7.4cl00I\P80E            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
