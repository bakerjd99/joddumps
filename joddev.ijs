NB. JOD dictionary dump: 09 May 2020 15:43:54
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
0f1X.0f1"/+>G_r1*AJ22Du[40d&4o2_[!01,'h++>u&71*A;++>P&t0JPF-0fC.0+>Yl/+>GSn
1*A;+0ea_)0d&4o1,UjJ+>GYp1*A;-0fL400H`+n1,(XE2BX_1+>P&q1c7-50eje++>G]12'=V6
+>P'"3A;R12]sju0f([G+>G\q1*A;+2)e-'6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp15+AH9b+>PW*3?U%83\iKP
1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp+5+@0se+>PW*3?U%:3\W?N0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO1c>[J$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K
1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp1:
+@1-_+>PW*3?U%23\rKO1H>dL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_
ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpP+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1-$ICF_;gP0JPR10f(jH
2EEWR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh
3?UV1B-8r`0f^@21HI?J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>>So:LeJh1,(FC+>>f:2*!]T1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y
0JPR10ebXC1cdBH$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqg0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1<+AQiu+>PW*
3?U%63]&iX0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*3?U%53\rHN0f9:F$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*
3?U%53]&iX1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f1!q6t(1K3Zp+4+@KdN+>PW*3?U%13\iWT0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cPgL$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*
3?U%53\`KQ1,B7E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp+6+@KdN+>PW*3?U%33]/iW0JNnA$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*
3?U%53\W<M0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,'gn6t(1K3Zp+7+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0K9CH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+7+@KdN+>PW*
3?U%43\`EO0Jj+D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%53]&NO0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN+>PW*3?U%53]&QP0e`qA$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*
3?U%23]/ZR1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,^6t6t(1K3Zp+8+@KdN+>PW*3?U%43]&QP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*
3?U%83\rTR0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\
FCdKU0K:1CARci<0JPR10KD0N2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&
:3CD_ATBgS1GBpo6t(1K3Zp+9+@KdN+>PW*3?U%13\`BN2)P^J$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heCj6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]O$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*3?U"9
3\iNQ0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp47+<X'\FCdKU
0KC7DARci<0JPR10ek^C1-.6G$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_K)F_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqg1*Atr@j!N\0f^@21HI6I3]&Mt$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@KdN+>PW*3?U%2
3]&]T0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>Get6tKjN1,(FC+>GZ51GV!H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f^@K@;[2C0JY=)0ebXB3'&lM$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh1*B1tDBL\g1,'h*2``fO
3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp18+AH9b+>PW+0H`),3\iKP1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnIk6?R!YA0=Wi
D.7's3Zp='+@KX[ANCqh3$:q(EZd+k1,'h*1-.3K3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5(&+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,pCN@<*JG0JY=)0f(jE0fh!G$;+)^:2b5cF'icp
1,fXL?qO3_:2b5cF'p,)F)uJ8F"_WL@r$-=@Wc=)04JX;@q]Fp+EqOABHUf-EcP`/F<F1O6m-Pr
F*(u1F'oFa4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`-$;PM]ATJu&@W-C2+CfP7Eb0-1+A,Et+CSekDf0VK+B3#gF!,"3@s)X"DKI"8
Et&I+E,oN"ARo@n.Ni,4BleB7Ed;D<A7.#4+CJksF*)>@H"q8.?m'?*FCfM9@:OD%@;I&rBOPdk
ATKIH%15[JF*2&8+Du+>ARlosATD?)D..]4DIn!&EZeh&+CSekEb0<5ARmD98TSrqATJu9BOQ!*
D/!WrF:ARdAKYDlA9)7&F(Jl)GA1l0+C\n)Ci<s!ARlotDBMnS6r.kb+EM+*3XlE*$8F.U?rToi
:L?^i6sjeA?m'0)+BrN$FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG'
:IIu2D.Hp#BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u602t_8:G-Kp
.4u&:%13OO:2b5cF!+n1E+NHu+D,Y4D'3k1@qBP"+EVNEDerrqF*&O5DIal1AS,LoASu!h+EV:.
+CfP7Eb0-1+E)9CDIn'7+A,Et+ED%0ARTXk/e&-s$6pc?+@]pOEckf2Gp"gq/0H]%1,'gn0eP.4
0d&%j.!9EJASbpdF(?^B%13OO+=\L'Bm:b.@V97o?m'Q:E,Qk5DBN\4A1hh3AftJJDffY8FCArr
+Dbb5FE8RCAftu"D.Rc@?k!Gc+<Vd9$6UH6%13OO+<VdL%13OO+<VdL8l%iS:JXY_6<-TN6qBmJ
<)6Cp1,TCG:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,'gn6t(1K3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1a#)'EZd+k0f^@23BAiM3\`;q$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU
1-$IO@<itN0JPR10fD'L0KM$M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>Pku6$6f_1,(FC+>GT30JGOD1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*
3?U%23\rKO1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pes+@KX[ANCqh2]tD/B-8r`0f^@21-.-H3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU1,g=AF_;gP0JPR10etdF1-.*I
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52
@<?'A+>Pr"6$6f_1,(FC+>GZ51H%9M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pr"6$6f_1,(FC+>GZ51bq*J2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pr"6$6f_1,(FC+>G]6
1H%9M2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>>So:LeJh1,(FC+>>f:2*!]T1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>GSn:2b:u1,(FC+>GQ20f1pH0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>GSn
:2b:u1,(FC+>GT30fM-K3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Pr":2b:u1,(FC+>G`71c%0L2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%6
3]&iX0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GSn+@KX[ANCqf1*Atr@j!N\0f^@21HIBL3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0JXb=ARci<0JPR10f1pI0KLpG$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A
+>>Pn6tKjN1,(FC+>G]61c[TQ0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4+@KdN+>PW*3?U%13\iWT0f]RJ$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqf1E](s@j!N\
0f^@21cdEP3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.8+<X'\FCdKU0Jjn?ARci<0JPR10f1pG2**KL$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>>Yq6tKjN1,(FC+>>f:1,q<O
1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u
6t(1K3Zp+6+@KdN+>PW*3?U%33]/iW0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqf2'>:u@j!N\0f^@21cd<G3\`W%$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0K(%A
ARci<0JPR10ebXG3BAiK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u0d%T,@<?'A+>>\r6tKjN1,(FC+>GT31b^sE3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+7+@KdN+>PW*3?U%4
3\`EO0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P_q+@KX[ANCqf2BYD!@j!N\0f^@21cdHI3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0K(%AARci<0JPR10f1pJ0fh$D$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A
+>>_s6tKjN1,(FC+>GT32)73L2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8+@KdN+>PW*3?U%43]&QP0fB@G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf2]tM"@j!N\
0f^@21HIBO3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1;+<X'\FCdKU0K1+BARci<0JPR10fM-L1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqf3$:V#@j!N\0f^@13BAuU3\i]&$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp+9+@KdN
+>PW*3?U%13\`BN2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!
E]P=!0d%T,@<?'A+>>bt6tKjN1,(FC+>GQ20fM-K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heCj6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0KC7DARci<0JPR10KD0L1cdBG$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqf3?U_$@j!N\
0f^@20fh!D3]&Pu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=Wi
D.7's3Zp."+@KX[ANCqg1a#1t@j!N\0f^@20fh-K3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]tM"@j!N\0f^@21HI<I3\iW$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqg3?Uq&DBL\g1,'h*0KLmI3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh1*B1tDBL\g1,'h*2``fO3]/l($49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2'>V%EZd+k
1,'h*1cdBJ3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>Po!9jr&b1,(I;+>GW41Gq3L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/hnIk6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh3$:q(EZd+k1,'h*1HI3E3\WDu:J=/K:IIrrFCfMK
2,6If:J=/K:IIrrFCfM9F=f'e:MaPa8l%htA7]pqCi=90ASuT4DJsW.F"Rn/:-pQB$;No?+CfG'
@<?'k3Zp130K!BP@kf\\/I`%^67sBjBOPdkARmhE1,(C@A7]7)2'=InF*(i.A79Lh+D>=pA7]d(
@:Wn[A.8kT$<(MI+=KiX6r%ZBATK:CAoD]4D/XH++ED%'ASuT4DJsW.F"SS$CiaM;F(Jo*-tm=9
FDl2FC2[W3/e&.eBOu6r+Du+>ATJu&Eb-A3Ch+YsDIal3BOr<#F)uJ8F!,.)G%De*AS#a%Cgh?s
AScW7@:WnhATMp(A.8laEZee"@;]UoDIm?2+A!\rATV?pDBO%7BlbD+ARf.kF(HIB@:UKh+Dkh/
Ch7Ku@;I''BkM+$+ELt:.3N;<F*)>@Gp*V(%15pPDdmNoD0$hDBln#2FD,5.@s)g4ASuT48l%ht
F*VhKASj%/$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=0f:(AARci<0JG@,0ek^C1-.*D%13OO0e"5:DI[U%E,9*-AKYr7F>%9<
F<GXMD/Ej+Ed98[+E2IF+CT.u+D58-+CT;%+D,%rEbp"DF*VV>ATVs,@ps0_$6UH6GA2/4+CQC)
ATo8*DJjB<Bl7Q+AU%]rE-,f4DK@iJ$4R=b+<WE^0d(+?F<DrQATMs4Eb/Zr@VfU'%144#+<Vd^
+E2IF+=D8BF*)AAARTFbCh4tU-S@#(/g,7IG]Y&\/hSLo%13OO+<Vdm+Cf>,D..<m+ED%(ATMQu
DBO"6Dfol,+EMXFBm+&1AoD]4@rH4'Ch7^"+E2IF05"j<+EMgFD.Rg0Gp"[]DJpY/G[k<(FD5Z2
F#sg<%14j>+A$YtG@>P8@3BE$F*(i+AKYl/F<G[D+DG_'Cis9"+E27?FCB#qCh7Z1Bl5&8BOr;s
AS,XoBln'-DBNk0+D5_5F`;C2$6UH6@;]TuF*22=ATKIH+B3#c+DPh*FDl)6+=M)CF"&5GF!+q#
F(o,mCi"A>@3B?%F_#,r+EVN2$6UH6B4Z0-@<-:/DIal3BPDN?+<XL!F*(i-@VfUs+EqaHCh+Z&
DI[]u@<6!&F*VV>ATVs<+CT.u+:SZ#+<Y`>D/a<*ApGM9@;0V$@;0UnDJ((a+EMgLFCf<1+DG^9
B6%p5E-!WS%13OO+<VdY+EVNEAncK4FD,B0+ED%5F_Pl-F!+t+@;]^hF!,17+Cf>,D..<m+E)4@
Bl@m1+CT.u+EV:.+C]&&@<-W&$6UH6+<YK/H#IhI+E(j7FD,5.F`(`$Ebp#8DJ()%Df'H3DIm^-
+D,>(ATJt'$4R=u.3MT'AKY])A7^!5Bl7Q+F*VhKASiQ4F(KD8@W-L&A0>]&F*)IGDe:,9DfTA2
DIIBnF!*%WF`V87B-;8@D.7F"Et&I!+<YlHF_kS2H"gi+A0>>qB-;/)Eb961D..<lAKYH#Df^#A
+D,P4+DbJ,B4W2rBk)7!Df0!(Bk;?<%13OO1asP;ASu("@;I'*@<?U&Ec*":@<?!mBl7Q+F(fK7
Ch+Z/AT2Ho@q?d)BOr<*Eb/isGV=,\@WQX3Bl7Q:F*2),Bm:a0$6UH6D..NrBPD?s+Du+A/e&-s
$8j7T5p15_D/a<&+Dbb0AKZ)+G]Y'=AScHs+EMgLFCf;3F(fK7Ch+YtAKYDlA7]9oAoD]4GAhM4
F"Rn/%15!B+@.,_Ci<ckC`k-C@;^?5A8,OqBl@ltEbT*+.3NhQEb$h>De!3tBl@lBF`V,8+CfG1
F)rIEAS,LoASu!h+:SZ#+<YB>+Dtb%A7]:(%13OO2^ok8+E2IDAKXSf7o`,'Ao_g-F<G.4A0>T-
+Dtb%A7]:(%13OO3%5tB:IH=BF`VXIEcl7BDf-\,DffY8GA1r*Dg-7F@;]TuCh[d0GT_'QF*(u1
Et&Hc$99OX8l%htDImBiF!+m6BOu"!+Eh=:@N]c+@<<W1E+Np.+E_WGA7]jkBl%?k+D>k6C`me@
H#.%7BOu"!+D,P4+:S[%DfTB0/e&-s$6UH6+DPh*BOu"!+=D,NF=.M)%13OO%15pMF)u&)Ch4_V
BOPdkATJu9D]hYJ6nSoU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%B0d&kq@j!N\0Jst,3BArT3\W8t$4R=O$8EtP9jqgK+EM[G
AKXujBk)'lAKY].+E2@>E+O'+Gp$d/DIdQpA0>T(+E2IF-Z^D=DIal&ATT;@/e&-s$8O%Q6Z6j`
Bk1dq+D>2$A8GstB-:2lBk)'lAKYE&+CQC7AU&;>FEqh:+DG^9A8bt#D.RU,@<?4%DCcoA/nZdG
$4R=b+<WK`E-67F-Zs<@@rGmhFCf]=-Tb='8OH9A76;k>/hSb//g,:SBk)'lAKZ)+G]Y&\/hSb(
%13OO1FXG4A7Qf*@3BW*D/a<&+Cf(nDJ*N'@rHL-F<G16EZf:0C1UmsF!,17+EV:.+Cno&@:EYd
AM+E!+<Ve.BOu'(Eb03+@:O"hB-;D:Eb'5EDdmHm@ruc7FD,5.F*VhKASiQ"F`MM6DKK]?+ED%%
A9/1e+<VeKBOr<.@<-!lFCeu*@rH4'Df0-(FE8R5DIal"BOt[hF!,R<AKY])@rH3uDJ()0@;TRs
%144#+EqOABHVD1AKZ)'EbAs*+DtV)ATKIH+AHcqF<GL6+EV:.+D#e:ASuR#+E(j7@;[31E+EC!
AISth+<YT4@s)g5+EqOABHVD1ATME*Eb/ZiF"Rn/+<V+#+<VduAftM)Eb03+@:Njk@rHL-F<Gd9
F!+n%A7]9oFDi:DBOr<,AT2Ho@qB0nF*)GF@ruj6AKYCj$6UH6D/!m%F(9?/AKYDuDfor>+E(j7
Dg#]4BOtU_+EqaHCh+YtAKYDlA7]9oFDi:3Dfor>+D>\;%144#+DkP)Gp%3CD.Rc2@;[3+@VTIa
F<G7*F!+q'ASrW2AT2Ho@qB1'+<XWsBlbD2F!+m6CLqc#$6UH6F*(i4BleB1@kJlH<+ou`B6,2;
BOQ!*B4Z0-@q]:gB4YTr@3BB)F<G"4AKZ,:F^]*&GrcBA%144#+<VdL+CQ]A@Wc<rGp$O:+D>>&
C^g^o+<VdL+<Y,B+Du+>+EqC5C`m8"F(o9)ARl5W+<VdL+<Vd9$6UH67qHdaBl7Q+GAhM4+DbV4
AS`K!BOPdkAKYK$F`);B+E)CE+E(j7FE1f#Bln'-DII?(G%G]8Bl@ku$6UH6@rH7,Ec5b:F*VhK
ASlK2BlbD*CiaM;@3BMtBl5OG+B3#gF!,[FF_kS2D..3k+A,Et%144#+Dl%;AKZ,:AS-($+EqOA
BQ&$8+CQC6BkM<tAnba`DKI">G%G]-ART*lBl7F$ARTXk/e&-s$6UH6<+oue+Cf(nDJ*N'GAhV?
A0>o(EHPu9AKYD(@q]:gB4W3-D]j.8AKYGrDIIR2+DbJ3Dfp.EDe9Fc+<Ve;@<>pe@<6!&Anc'm
F!,L7DId=!Bl7Q+E,oN5BlA-8+Cno&@:EYdATJu:DK9;sA78q`AM+E!+<Vdu+EqaHCh+Z%@<Q3)
FDi:7D]j.8Ec6)5BHU_+A9Da.+CT.u+ED%7FDl22/g)8G$4R=O$8a1S6Z6j`Bk1dq+CSekBl7Q+
Bl5&%DJsW1ATAo4F`\aEE-,f4DBO%7@<<W9Dfol,+EMXCEb-A8AU&;>A7]S!@<2kb+<Ve@DBO%7
AKYN%@s)X"DKK</Bl@l3@rH4'Df0-(F<GL6+E(_(ARfh'/g)99BPDN1DfBf4Df-\ADfol,%144#
+E).6Gp$R-+D#e/@s)m)A0?)0ASrW2AT;j(F*(u(+C]U=FD,5.F`V,7/g)9.F<GdGF_kS2Bl7F$
ARTXk%144#+EV:.+EMgLFCf<1+Cf>#AKZ&.H=\4.Gp$s4H"(>-1,(::0Hb1GDIml3@Wcc8GAhV?
A.8kg+<YQ?F<G"&A0>;uGp%$EATD4$Bl@ltC`mY>ATDHq@:UKmDfQt3F*(i"Ch[s(ARlp%E+O&u
FD5Z2F"Rn/+<Ve+BPDN1FEqh:+E(j7DfBf4Df0!"+Co&"FC?;(@:O"fBlnVCBlbD*CiaM;D/XH+
+DG^9FEMJ4%144#+EqOABHVM4@<<V`+Co%pD'3tBAS-($/g)92Df^"CG%G]8Bl@l3@rH7,Ec5b:
F*VhKASlK2FE1f"CEO&n+<Ve8Cht5(BOPdkATJu9D]iP.A7[A9+AHcqF<G(,@;]^hF!+n3AKZ)8
Bm+3!C`m/(A0>T,Eb0&uG%#91/e&.1+<Wsk+EV=7AKYW(ATJu'Gp$O3C`mh5ATME*FE_;)CNCV/
AS6$lA7Zm*BOr</FD5Q*FEo!IAdo(i+<Y04A7ZlsBleB7Ed98H$4R=b+<XWsBlbD,BOPdkAKZ28
F_kS2Eb065Bl[c-@3BApH#IhI+Cf(nDJ*N'FDi:DBOr;S:I@]K8Q6gMDfoq,$6UH6@Wcc8GAhV?
A0>c.F<G:8FE2;1F^nu*@;^?5@VK^gEd8d<@<>pe@<6!&Bl7F!D/`p*BjtmmFD5<-/e&.1+<V+#
+<VdpAScHs+Cf>#AKZ28F_kS2BOQ'q+EVNEBOPdhCh4`2BOr<(ATo8<FE2M6FEMV8+CT.u+D#e3
F*),6B+51j+<Y35@s)X"DKK</Bl@l3@rGmh+EqaHCh+Z%@<Q3)FDi:2AKYJrARfLeA0>;uA0>i0
F)u&)Cj@.3A867.FCeu8%13OO%16!E@qBP"+@BgNDJ*O%+EVNE8l%i-%14[=/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$8OR`:2b:u
1,(C@+>GZ51H@KQ3"63($4R>:@;^?5@q]:gB4Z-F+>"^-+Eq78+Du+>+E_X6@<?4$B-;;0BlbD-
De!p,ASuT4F)N1<Df^"0$?'N!FD,B0+EqaECERh0F!,@=F<GI>F<GI>FCeu8+<X6'Cht50AS#g'
@V'Y'ATAo2DffQ3%16fe+EV:.+D,b<F`M%G+<X3dEb-A%Eb-A7Df'&.BPD*mCh[NqFE9JP$4R=s
.3LurDK]T3FCeu*FDi9o+>ti+1*A.kFD,B0+Eq78+CQC0@;9_$+E1b'DBNA/+A+#&+C\c#Bk%SZ
@<-"'D.RU,+EMgGFCBD:G@>P8@q]:gB4YU++<XWsAKYK$A7Zm-@<3Q$Df0`0Ecbl'/e&-s$8O%Q
:Msu_DIjr(ASc<.@:Wn[A0<:8De*NmCiCg4$4R=u.3Ls"B6,2-Bm=3"+DG^9-tI43.3L$KDf'H.
.3N&:A0>f4BOu3,GAhM4F"SRE$4R>!.3M#mF*)G:@Wcd(A0>f.Ch[cu+C]U=FD,5.C*5De0JXbZ
A7TUr+E1b!CLLje+DkP)@:s.l+CT.u%16Nc+B3#c+A,Et+AcKZATKI5$4R>".3M#s@s)X"DKK</
Bl@l3F`(`$EbB<)DJ()'G][M7F(of/+ED$FARoLs+EVNEEb/j!ARfg)FD,5.D..=-%16TY@;]^h
F!,CEATAo8BOr<3ARTV#/e&-s$8s=U:2b>!F*)>@Bl7Q+@;Ka&8l%htF)Q2A@q?csDBO%7AKYMt
@ruF'DIIR"ATJu&DIal&ASu("@<?4$B+52VCht5)BleB:Bju4,ARloqBl%@%/e&-s$9'CV8l%ht
F)Q2A@q?csF!,@=G9Cj5Ecc,C+E_R4ATAnlF^fN*EcYr5DBNG-DKKo;Cb?h>$4R>%.3M?'A8,Xi
ARlo3D..3k.3L$UCi_$JFDi:@Ec5H!F)rI7AT23uA7]Y#+Cf>#AKZ&*@ruF'DK?6oBl5&+Ec6)>
+CT.u+EM[>FCcS.ART+\EcWiB$6Tcb%13OO<+ou`B6,2;De*cI%14[=/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R=s.3LurD/a<&
FCcS*De!p,ASuTuFD5Z2+ED%:Ble!,DD!%S8K_GY+E2.*DJj0+B-;;?D]j47EcYr5DK?6oDe:+a
:IH=9De!p,ASuTuFD5Z2/g)99BOr<)DJX$)AKZ/-EcYr5DBO%7@<<W+F!,@=G9D$GA7]d(@rH7+
FE2M6FD5Z2%16fj+CfP7Eb0-1Cj@.:Df^#3A0>?,+@g?gB5D-,F!,C=Ch[cu+CoD#F_t]-F<G[D
DepOE=)r"sAScW@/g)99BOu6r%16Wa@s)X"DKKqB@ps6t@V$ZmDg-)8Ddd0fA0><%+@oI+9J.G1
=(l/_+EV:.+@oI+9H[ka@s)X"DKKT2DBNY7+Dtb!Ebp"D%16T`D/a<&FCcRd+EqO9C`mqBBlmo/
F)Po,+A*bdDe*E%FDi:3Df0`0Ec`F<F<G[D+A?3CAQU^!/g)99BOr;[@8pf?+EqO9C^g_\AKZ,:
ARlp*D]i\(DImisFCcS'+EM77B5D-%A7]@eDJ=3,G%Ddm6q/;0De!p,ASuT4FD,*)+EqO9C`m1u
+Co2-FE2))F`_2*%16fe+EV:.+C\c#Bk&8X:IH=9BleB:Bju4,Bl@lA+<XHtCh[cu+CoD#F_t]-
FE8RKBl%T.DJsV>@V$ZmBleB:Bju4,ARlomF`\'"F(oK1Cj@.DAS,LoASu!hA1e;u%14j>+@C'b
G%G]9+=LuCA9;a.Ci_$JATDg0EZee.A0>`#F)tc&AKYYpDIdQtDJ()6D]j.8AKZ&(BOu$l+E_a:
A0>?,+EV:.%17#qBOu3,8l%ht@r,RpF(KDF%13OO1FXG4A7Qg)BOr;uDes6.GA1r-+Dtb7+EqaE
A90d@$4R=b+<Y)A+=MJPCagJY/KekDCLnW!DJUG)F`\aIARTUhBOu6-@;Ka&Eb/ltF*(u6ARloo
Bk)7!Df0!(Bk;?.AoD]4DIIBnF"Rn/+<Ve9.3L$JDJUaE/M/)]Bkq9&A8Z3+@Wcc8F(Jd#@q]Fp
+CT)&+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9@UWb^F`;CEAoD]4DIIBnF"Rn/+<Ve:.3L$JB4Z06
+<W6f+D#e>Ea`I"F!)lK@;TR,G%#30ALSa1DIak<DIIBn/7WL)F)rmU@;L't.3N_@@VfUs+D,Y4
D'3:r@r$4+Et&I!+<VdL+<VdL+<VdL+<Yc>ATD?)GA1l0+C\n)DJpXG@W6I3.3N\GDI[6#@UWb^
F`;CE9iY+k+AP@+78b6p73Fli<(0\R6nSoU+<Ve;.3L$LFE8lR/M/)cAS6.%@<*K%G]7\7F)u&6
DBNP6Cht59AU&;>F(Jd#@q]Fp+CT)&+CT)&+E(_(ARfh'+E)-?E+*j%/e&-s$8a1S6"FLKD/XH+
+DbIqF!*%WDImBi+CQBb:IH<lATMr9:i]uSFD55rF"AG+:IH=)Df9G7:i^JeEa`g%Bl7Q9%13OO
2(9YB@;BEs@;^?5@q]:gB4Z-,Eb065Bl[cq+EVNEF*2G@DfTqB<E)FI+EV1>F<DuADe*E%1,^R(
Bl5&1@:O=rF"Rn/%13OO:et"h?YXLiCh\!&Eaa'$1,2Nj/l5>B<*sBYA8Gt%ATD4$AKYr1F*&OD
Ec5H!F)u8?+=Jfo.6T^$$4R>`D/XQ=E-67F8Oc!576N[S-nlc)+>>5R$;No?+=LuCA8Gt%ATD4$
ALSa9DKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+D5_6Ch[u6+<VdL+<VdL+AP6U+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HVZ67sBpAmo1\
F(Jj'Bl@l3+<Ve%67sBpDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+EM+9C2[X!
Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$7QDk%16T`@s)g4ASuT4-XpM*AL@oo
@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.<)5nX?V4*^?Ys=/2[p*'$=HJ%6sq-::IItf$9^O84Ztqk
4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]TuBlnD=F*1r%
CghC+ATKIH%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.
AftM)FCB6+/g(T16?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.
ATo8,BOPdkATKIH%15C;F)NTPEb/Zi+Br5eBleB7Ed99SA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E905,'@FDl2F/o>,J+:S["D]j+4AKZ21@<<VA@:OD%
@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSruBmO>C
%13OO7W3;iH"CE)F!+$sBOQ'q+DkP$DKK<$DIm?$@3BN0Bm*p,AKYr4De`inF<GC<B-;;0@<<W+
DI[L*A7]fk$=HJ%6sq-]DfTVG+A!\nAThX*+<kcI@Vfb"BOt]u+EV:2F!,"3@s)X"DKI"5DfQtB
BOr<-Bl.g*AKZ#)@<6@)%172j@<<V`+Co1sDC9NKG@>B2+EVNEBl.g*Gp%3B@<<V`+CT+0@rH4$
BlnH2DJ()6D]iJ+H$!_6DJ(RE:2b>!8K_GY+Cf>,D/"*6Bl7Pm$?U2/Anc-sF(f9*B-;;0AKYSr
G9Cp;D..-rBl7Q+?qO3_?m'&m@<?X4ATKIH%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=2`GZ$
ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4+CT.u+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(
DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1F"SS/@:F9e$6UH6BOQ'q+Cf(nDJ*Nk+DG^9
Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%14jC+CI<=AT_]HH>k`ZE-Z\CA9W-*C1/u<DJ!c?H!`aC+A$Ho
ATMs-B45mn+D,&)CijqF8l%htCi<`m+EM%5BlJ/:D..3oDJ()9BOu'(FD,6+AKYE%AKYr'EbTH&
F!+jC?m&lqA0>>t@;]k%+<Y&7?m$S+DBNn,FD,_J%144#+Ad)s@VfUm+E(_1ATDs*A0>o8DJj0+
B-;;0AKYAt@;BF]Ci<`m?ZT^tBlJ08?m'Q&F*%iu+<VeNBln#2FD,B0+A,Et+E1b2BK@8D6TSIP
F(KB5>Y8pJDD"7aCLqNk:Ms`3EbT].+>"^.@:O(oDf-[bDf'H%DJ<['>\\1f?k!GP$=I(LDIb>@
De*cl?k!HPF_PZ&C2[WsC3)-b:-pQ_@WcC$A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlou
De*QsF!,O6EbTK7F!)T>DBL':De*KpF:ARP67sBkBl[cpFDl2F/e&._67r]S:-pQUG%G]'@<?4#
3XlEk67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'
+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO
67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(k
F!,R<BlbD<@rc:&F:ARP67r]S:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t
@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ305i9K$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?
+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;C3=DJ1(=Rc67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB80ktiK0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`
CG'=9Et&IO67sB82.:HE0JXbkASl@/ARlp0Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*FDi::De*Kp
F<G^DA7]d(@;KXhD@HqJ67sB83,WYX0KC7fBl7?q+Cf(r@r!3/BOQ!*GB.D>FCf>4Anc'mF!,%=
BleA*$;No?+>PWc@;[hW+EM47G9D*MBlnH.DBNP*Ch4`.@<?1(%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.
@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"
CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%16igA9MO)F(oQ14ZX]:4tq=U
:IJ5X6k'J4$;No?+CT)#ASrW*De*QsF!,"-Eb/a&DfU+4$;+)^7nHZP:IIcH;c#bZ83K!V+tb6/
9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:II]E<(]qS
8P2oX5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U%13OO:-pQU
B4YslEaa'$+Cf>,D.RU,ARloU:IH=8CghC++EM%5BlJ08%16i[CghC+ATL!q+?MV3C2[W*C2[X(
FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5+DPh*Df-p3$>OKiAnc'mF$2Q,-p07-
?SNuPD..3k-9`Pe@r,RpF(KD%$4R>;67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^%14Lu@r,RpF(KD8
/1)u5+?V#^@<<kG4ZX^+ART*r/j:D)3[-:$C2[WpBl%@%%13OO:-pQU@rH1"ARfg)G%#E*Dfp+D
D.-ppD]j+2EbTK7Et&I(Eap55EapI[3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3
ATD:!DJ!Tq@UX%"%14M1/g<"mF)kb>4ZX^43[-:$F)kb"$4R>;67sC'E+EC!AKYMtEb/a&DfU+G
Anc'mEt&IG8PDQO4ZX]6C1D'gF)to6+=nX^/g<"mF)kb>+=nil4s2s8/no'A-OgDP8PDQO4ZX]6
4A&C;7nHZP:IIcH;c#bZ81>Z4-8%J)7S-9B;[j'f4DJeFA79R&+<VdL+D,h<Blmo/F(fK9E+*g/
+?M9(7S-9B;[j'f4DJeFF*)>@ARo4k+D,h<Blmo/F(fK9E+*g/+?M<)7S-9B;[j'f4DJeFA8bpf
@<<V7+D,h<Blmo/F(fK9E+*g/+?M?*7S-9B;[j'f4DJeFD..3kA79R&+D,h<Blmo/F(fK9E+*g/
+?MB+7S-9B;[j'f4DJeFF`_>6A79R&+D,h<Blmo/F(fK9E+*g/+?ME,7S-9B;[j'f4DJeFFDl)6
F(A^$+D,h<Blmo/F(fK9E+*g/+?MH-7S-9B;[j'f4DJeFDf0)oF<D\K+D,h<Blmo/F(fK9E+*g/
+?MK.7S-9B;[j'f4DJeFE,ol/Bl%?'+D,h<Blmo/F(fK9E+*g/+?MN/7S-9B;[j'f4DJeFE+*d(
F!)SJ+D,h<Blmo/F(fK9E+*g/+?MQ07S-9B;[j'f4DJeFF`V,7@rH6sBkLm`CER55EbTW,+EM47
GApu3F!*P)HU^S#78jX&%15is/g+Y;ARfKuFD,*)+D,>(ATJu*G\M5@+DG^9AU&0*@ru9m+Co2,
ARfh#Ed8*$-o2u,+>>5e7S-9B;[j(JAhG2U/h^Zs/g+b;G\M5@+F,)?D_;J++<Y`BDfp/@F`\`R
@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+E_X6@<?'k-OgD*+EMC<F`_SFF<F1O6q9gJ8l%iH8lJPP
<(IH*AScF!/e&.1+EMC<F`_SFF<Dr";Gp:g+>"^QBle?0DJ()%Df'?&DKKH#+DPh*Bkh]3F(96)
E--.D/NtO)4!8ek,CUae/n,7s+<Y*6F(KB6/g)hj:-pQUGA(o'+Cf>6@W-N8%16ZaA1e;u.1HUn
$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?OF_PZ&C2[X!@<?(*1,2Nj/h1=Q
Bl%<pDe*ZmFCf\>F"Jsd+D58'ATD4$ATJu8H#@_4GT^[6B4u*qB4uBuA0=K?6m-PhF`Lu'+A?3C
AQUPo$;No?%15is/g*VtCh7Z1@<,p%GB.D>FCf>4FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#
D.RU,+Co2,ARfh#Ed98H$;No?%15is/g+SDF*2>2F#kFRF`MM6DKI"EATDj+Df0V=De:,2@;]Uo
@j!1=@;]Uo@j!NZ3A*$=0d(CT+DbJ.ATB4/$;No?+<VdL+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO
:..lF.1HVZ67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=Je
E,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PWf@<jO^+ED%:Bldir
+=MP^H>7A/D..-r?Z]k(.1HUn$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$
AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$
Eaa$#+?V#;5s]7(A8G[rAU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%
ATD4$AL@oo%172oE,9H&+D58-+?MV3Eb/Zi+Eqj?FCcS)BOPdkATMs6+A,Et<_Yt0%13OO:-pQU
@s)g4ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\kt
A8bp?3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$?Kd#C2[X!Blmp,@<?''A8bre$4R>;67sB.H?slb
+DkP&ATJu9BPDN1Anc:,F<GL>+ED%:ATDj'+Co2,ARfh#Ed8d>Bl%?'DIIBn+EMIAFE7lu-ZW]>
FCf\E4ZX][5snOG?X[\fA7$HlATT%BH?smPDe*]nBl7:"AU#R3$?Tj(4ZX]IHTE^"AU"XkFCf\[
3Zogu0-bpp,BdX=F(oQ1,CY(d0./;40RHDf6rm#M.3N,6@;]^hF*)FFFCf\+$7L"78g&4eGUXbZ
EbTW,+CoD#/15aiH>7A/D..-r/p(ZL-OgCl$;No?+A,Et+Cf4rF)to6%16i[Ccsg%4$"a(De*d(
+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!hD(Cijnb3Zr'UDfp#8
@<?(*-8%J)C1D&h$4R>;67sC'F(HIAH?pq]E,oN%Bm:bBD]iJ3DeW`)@r,RpBOu6-GA2/4+=CoB
A1&KP/h^aR@s)X"DKI"5Bl%@%%172gG\1Z+ATL!q+=K?_Ddt4=/1)u5+=K?"H?pqf+=nil4s4TM
C`k8U/j:C?-SBLPGUFUC$?L'&F`_SFF<G[:G\1Z+ATJtu+Dc.E+Eqj?FCcdO4s4rYG\1Z+ATJ:f
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZmFCf\W3B:G[BleB7Ed;D<
A26(Q$4R>TASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`-$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."
Df.!5$4R=b.Ni,6De*@#@V%0+@rG`t@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJ
AS!nF?tsXhFD)dEIP5,?A8c@,05"j6ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4
F(KH8Bl7Q+:K&BM@rH7++EV:*F<G%5@;]Tu8l%htA8-'q@ruX0Bk;?<%13OO+=\KV.!&sA@WcC$
A7TCpF"&5KDe*QoBk:ftFDi:3Eb/[$AKYDtC`mh5AKYMtEb/a&DfTQ'Et&I!+<VeIAT;j,Eb/c(
@X0)<BOr<'@:O=r+=L]ABl%<pDe*BmF*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt%144#+<Y`:
FED57B-;>9+Dtb7+DkOsBPD?qF!,(5EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRE$4R=b.NfjA@:Wnb
Ddd0t@rc:&F>7/GDJs_ABl8!7Eb0;7F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>
F'oFa+<VdLBOQ'q+CHg9C3*c*AU&<.DKBN1DK@EQ%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq
1,(FC+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^W
ARuulC2[W8E+EQg+BN9!BHVD1BlbD*A7TCrBl@l3@;K`h$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8
F!+n3AKYK$D/a<&FCd'I7WNEa+Du+A+E)-?8l%ha$6UH6+Cf(nDJ*O%+EqO9C`m5+DKBN5F<GL6
+C]J++D,>4ATJu&DIal.E-,f2BmO30Bl@m1/e&.1+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p
/e&-s$6Uf@>@:oQATV<&8p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?
%13OO+=\LTDf'&.D.-ppDf[%0DIal3ATMs7+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdk
ATKI5$4R=b.NiV?G9C:&B4Z0m+EV19F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5
$4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8
FCB33F`8I8@;0P#Eb-A*DfQsm+?;&.0d'q:FC?b7+CT.u+C\o-Df0)<%13OO+=\LA9gMlV5tsdU
+DG_'Eb/[#ARlp*D]gbi3$;gRDf$UT0J4JIBPDN1E+*cqD.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'
F_qQp+<VdLCh7KsFD)e8Afth2DIIBnF!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t
@V$['ATT&:D[d$r+<VeM@;L'tF!+q'FE_;-DBLYV@;]Tu1,UpA%13OO+=\KV?ug*l/0J>@FECn5
@:X+qF*(u(+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=e,9n<b/ibOE3B/-5+@]pO
Eckf2Gp"gu/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+=\LAEd2Y5+DG\3Ch7HpDKKH#+>"^W
ARuulC2[W8E+EQg%13OO+=\L<?ugL5?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL
0L^5*Eb0<5Bl@m1/no9MDIP%($4R=b.Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a:IH=A
@:F:#F(JoD%144#+BqH66m-;S@N]Q,FCep"DejE"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1r%FAS!N3@<6O%E\D0GA8Z=-AR]RrCNCp6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](
+>PW*3"63($6Uf@?u9dt?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@?tFFf+CSeq
F`VY9A0>u4+E_a:+CJbkBlm]sBQINg+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk+CK"u?n<F.
C2[X$DI=T/D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha9LW>3F(KG9
Bl5&$E,ol/Bl%?5Bkh]s+>"^YF(Js+C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1iDKB`4AM.P=
ARHWlA8-.(E\7e.%144-+CIf?:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4DBO%4G]Y'<
De*F#+CSekARmD96#:?[8l%htD.-ppD[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<ATKIH<+ohc
@rGmh+DGm>@3BAp@V'@.+A$Z&F!,UHAS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:EeaF!+n4+CIf?
6W-KP<+$hjAU&;>BlbD.G\(B-FCeu*GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0%14=),9SZm
0J5@G2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSekARlok9hAGU
6r-iP;ICVbDfoq?FDi:0DIIBn@psJ#?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B.aW#
%144-+D,>.F*&Ns:IH=GASbpdF(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^EE-"&n
05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P1E\7l
9jr;i1,1=&1,(FB+=M>CF*&OCAfs]eDe=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ@<Q@'F`JUC
AftJlE-#T4+=C&_:K0eZ9LM<I-T`])6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtBD]j.8BlbD;
ASbpdF(HJ7ASbdsBm+&1Ec5l<+D,P.A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3BOu'(@:Wn[
A0>u4+EV:.+CK8#EbTK7F!)iR-X\'5BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5@rc:&FE:h4
Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3
De!iAF(96)E-*a4AQWPb=)`D$CbBF:Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#
Eb/c2+EMXFBl7R)+CT;%+Du+>+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"
DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$4."J
$6UH6<+oue+Cf>-AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL
%13CJE,9H7+<VeU@:WneDK@IDEa`p#Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16
EZdss2D-[<+D#G$ARlolDIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_A
Df-\6BkCp!F*2G@DfTqP%13OO+=\LADIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7
G\(D.@<6L(B5VQtDKI"4EcQ)=/e&.1%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1
+Eh=:@WNZ.Bkq9&FD,B0+:SZ#+<VdL+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQt
DKKqP#mh%J+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,
ATVU(A3k6KF_t]-FE8lo/g)hW$6UH6+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,
#mh%J+=\L"+Dtb7+DtV)AKYE!@;L41BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*
@;TRc@<?Qu+EVN2$6UH6Dg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%
B5)I%D..Nt+A*bq@<?U&Ec*!/$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1
+<V+#+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%
67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)
?S[$^Bm;'L/1)u5+@K1-8Q\>T%144#+<VdL+<W(CDCI_0+Cno&%13CJ%144#+B3#c+E2@4G%kl;
F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu
+<Ve?@<Q3)@V'+g+CSekARlp*D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP#mh%J+<VdL
+<VdL+<V+#,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"A867.FCeu*
FDi:2ATW$*EZfFGE,]`9F<G.*Bln',B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$C1D1"F)Pl+
/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:CARuutDg*=G
D]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)G]Y'>A8-.(
EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=
D0$-n+<VdL+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7
E,96"A0>K&EZccF@rH7+Deru9AU%c8%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr
:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@+CJr&A1hh3
Amca(E+EC!ARmD&$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b
.Ni,1FC65"A867.FCeu*FDi:CF`;;<Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt
+<VeFE+Np.+DG^9?u]pqA7]-kARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl
$6UH6FDi:CF`;;<Ec`FGBPDN1An>CmF`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i
%144#+<VdL+<Y6++=DAOEb'&rD.P(($6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*
2%9m%$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!
Eb065Bl[cm%144#+<YN0Gp%!CF<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E
+E(d5-RT?1+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&
$6UH6+<VdL+AP6U+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C
+BosE+E(d5-RT?1+<VdL+<VdLEb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL
+<VdL+>,9!/e&-s$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4+
+DtV)AKYf'F*)IGBl.g*ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NfjO
ATo8=ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5
%13OO+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@
Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s
$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>
Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaE
A0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47
Ecbl1ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$
FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@
FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[Zr
Cj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;
ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><
ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu
+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G
+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=
G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN
+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQU
An?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o
@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#
+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B
+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO
+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL
+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?
+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,f
AS5FnBm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6
FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)
F_u(?F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$
Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&
F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C
.W00H+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7
BOPdkARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq
+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL5
1*BpY1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&
@VfUs+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.
@<?4$B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"
DIa1`%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL
+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7
+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#
+CoV3E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:0
0jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&
FE9&W<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!
Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$
ARlomAS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$
B-;;0AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(
Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8
E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>
A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2
+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043
EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&
FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$
?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5f
DBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.
A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1
+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'
@<?0j+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds
@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%
DIal6Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;
EcYr5DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRt
ATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(
AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL
+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6
+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-
DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,
+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk
+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b
.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'
EZek*@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU
+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$M
H#n(=D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:g
B4Z-:%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNE
DJsV>@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4
F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,
FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(C
DBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!
A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>
DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c
:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAq
De(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]
F_u)*+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD
%144#+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9
@P;q>DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&
A1hh3Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*
E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?
0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG
2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%
F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#
+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq
+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LA
ATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/
@V'R&1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5
EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/
Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU
0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW
3[],iEb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-
E+*6f+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu
/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?
F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=
%13OO+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n
05#!@BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7
DfTQ'F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3
+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."
Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8
CghC++D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(
A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3
AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#
.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-
+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=
+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)9
5t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#
+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL
+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e
+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#
+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-
E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXF
Bl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8
FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_o
F)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.
H[\A3I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;
A7T's+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[
A1euI6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho
@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7
FEM%??n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.
F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/
+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.
?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+
Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9
E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*Zu
FCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-
AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-
+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7
Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-
+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*
Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-
DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9u
Bl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LE
Bk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj
+<Ve8DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!
?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M
9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22
F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@
G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/
+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7
FD,4p$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfRE
Eb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%
?[?'e%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,Xi
ARlp*D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXC
Eb/c(A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.
E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%
EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+G
DdmHm@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@lt
EbT*++EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbi
ATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%
F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGU
DJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7
+E_X6@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'
@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\g
EZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.
F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd
+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@
Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7
+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj
/oY?5?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%
DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"
FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;
FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3
ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*
DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%
8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_
%14=),9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2
ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL
+<VdL2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&
+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8
E+EQg%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%
C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,
ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F
/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=
/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5
FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn
@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<
2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMt
FD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;
G\(D.@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sI
C3*c*ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?
+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!o
DI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK
+CK%pCLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u
+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#
+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V
0e=G&0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c
+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht
+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,
F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&
AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&
/0H]%0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBe
GT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0
A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,
@<?4%DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3
FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:
Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4
Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1
GBYZKDg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFd
Bk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,
+A,Et+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\f
Cht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-
Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#
%144-+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]
H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs
+Eh=:@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm
3A*!./KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLd
A0=K7<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#
+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)
@:Nk$%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`i
DIak!$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)
@:NjX$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[
+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1
+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/
ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-
EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc
+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj
/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi
045oED]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#
D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2
EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1
%144-+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?
+>>E-/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRt
ATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:
2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62
@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=
ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:
2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;
Afu2/AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm
2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$
AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol
+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>
D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)
@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,
+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e
$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<
H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!
+CSekARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.
BQS?83\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63(
$6Uf@D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm
$6Tcb,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^
%143e$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi
8p+qm0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU
0J5170H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUj
A7]q#Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOT
Bkh]s+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK
%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'
+>PW)3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b
/i,+<+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$
+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&
Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]Ul
ATJtd:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3
FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.i
Cgh3m/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m
+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%J
BleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9$6Tcb+:SZk
BleB7Ed;D<A7TUg1,iiWDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!
;f?/[@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144#.Nfj6;G;-SBl5&$C2[W8E+EQg+Dl%-BkD'j
A0>u4+E_a:+@oI2:fAKNDKBo2@:UL!AfsWD<)>1V$4R=b+=\L3AS,LoASu!hF!,RC+A+pn+Cf(n
DJ*Nk+EVNEF`V+:E+*6n@;[3%DKBo2@:Uu"$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1
-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144#.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'Bl@l3
@:Wn[A1eu6$4R=b+=\KVE+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ8Cggdo+CSekARlo8+EM+*+EV:.
+Co2,ARfh#Ed8*$%144#+<VdL+<VdLC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKION
A7f@j@j_]m%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b+=\LWATDj+Df-\,F_u(?
AoD]48g$,H0JO\ZATV?'E+*iuBJ'`$%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N
@;KLmFD5W(-Z^Cu@<j:2$4R=b+=\LAEd2Y5+EM+(FD5Z2+CSekARmD9%13OO,9nEU0J5@<3B8u?
/Kdi!FDkW"EZd(n/0H]%0fTUL%144#.Ni,9DJW]'F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm3A*<P
2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/
Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S
@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)
F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ
+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAa
Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs
+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87
B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%
0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#
.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,
+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg
+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&
A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<
3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(h
EbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!A
D.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8
+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,
+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b
+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*
2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdk
ATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$j
DJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*
E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?
0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(
1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+
E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m
$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oK
A8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,
ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,Lo
ASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN
?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F
%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8
%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7Qq
Bl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*
1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@u
A7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*
Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>
A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeF
Afu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht
@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?
FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.
ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a
+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$
+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',
De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>j3hBkCptFD>`)
1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.
<^fnb8P`)E3[ZX70J5(-%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0
Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi
/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`
F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*
C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3
/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2
C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm
@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46
Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"
@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2
.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5
DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7
+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/
FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$
ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH
6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RC
EZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,u
DBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeu
FD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl
$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#
+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdh
AKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH
6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/heX^$:[fb
6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8
E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR
@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:
E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU
:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8X.1HV^
78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2
/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".F)N12
Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;+EVNE
F`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%+=DVH
A7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3
AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'
3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t
$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP
:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70J5(-%15R#9LM<I
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
$7QDkH?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XHCghEsGT^U4Ch54A
8l%htF)Q2A@q?csEt&I&+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4rF)to6/g+,,BlbD/Bl%>i
$7-g'F)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..NtEbSru%14C(Bl8$2+CQC6
Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+FD,B0+D,>(AKZ#)EHPu9
ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFg
DId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>+F8?[
C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(
+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YKC@;K@o
AU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%"^FD,T5
HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6IXWLa8l%j'+B*3$EarZ'
6Z6LHI16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4
F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$=%X`FDPN+
B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi%16?W@;BFrBln0&%16?^@:F%a
De<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Df.1LAU&V4$4R>I
DIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F*)>@AM/(9
G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[
C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.DesJIFCf]F%13OO-!Y>!GApu'
AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?Z
BOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!
A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3                           ~>
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
C2[W*BPDO0DfU,<De*Bs@j#VsDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8
A92[3EarZ'H?smPDe*]nBl7:"AU#RO/1<V9+>P\t1,(I;0JtOD/i>LH1,:^A3B/-:0JY=92)%!B
2)RBM1bpmA2]sk01,(C>0K:[B3&!6K2`!3K+>PW*3AE9D1bLUE3B&]L1G^d/1,(FC0etI?/i5OJ
2_m0F1GU(.0JPRB1,1U<1cRKS1,C^B1*A>+0f^sD0f1L>3&roQ3AE9D+>PW*3AE9D1bLUE3B&]L
2E<T:1,(I;0JtOD/iGXC1,_*L3?U(21,(C>0KCaC2_Zs?1,UgD+>PW+0JG@<3A*0L2Dm0C0etO-
1,(I;0JtOE/i5=D1c7!F3Ar!80JY=91GUg?2*!WU2*!TU0d&5*1,(C>0K:[B1H7-M1b^UA+>PW+
0JG@<3%d*G1b^gH2`!021,(I;0JtOE/i>UI2DmKL2)HF20JY=92)%!B2)I'H2Dd0I+>PW+0JG@<
3%d'J0JtXG1bgg01,(I;0JtOE/iGF<2)mBI1GL"-0JY=90etL:2`*?L1Ggg@+>PW+0JG493A*-C
3B/fO1b^p41,(I;0JtOE/i5:B0fM$N1H$@20JY=92)%!B2D[$F0f_!E1a"P-1,(C>0K:[C1GC^G
2)[HQ+>PW+0JG@<3%d*E1H@HT3B/`91,(I;0JbID/i>I@1bh!I2)ZR40JY=91GUpB2)I'F0f_'J
2BXb/1,(C<1,pmD1bpmB3A`TO+>PW+0JG:<3%d'F1,LaC1Gg400JY=91GUpB2)I'F1*A>+1,(C>
0K:[C2_d'G3&N]=1,(I;0JtOE/i>RA0eb@?1,L+/0JY=92)%$C2*!QP0JP:;1E\G,1,(C>0KCaD
1H@0M1H.3I+>PW+0JG:<2(gaH3&icU2`WT81,(I;0JtOD/i>FE1-%0F0K(%/0JY=92)%!B2Dd6E
2E*QN0d&5*1,(C>0KCaD2)@3K1c%!F+>PW+0JG@<3A*0J0K(jH2`3Q;1,(I;0JtOD/i>UI1bgdF
0JXb+0JY=92)%$C2DHmC3&<<G0d&5*1,(C:1,LUC0fV'M2DI0G+>PW+0JG493A*-D1,1RC3&<Q;
1,(I;0JtOE/i5:B1GCXC2*!*:-p01/0I\P$4>J$8,Vh&/0JG7:0ePF?0ebRD0eje+0JY=92)$sA
2)m<L2`W`N2'=Y.0f^sD0fCXA1c.-L1,:g31,(I;0JY@;/iYR?0K:mD0d&5*1,(C>0KCaC2_[0M
1cI3H+>PW*3AE9D2D-jD1cI<J1,p^6-p01/0I\P$4>J$61aFh10f^sD0f1L>3&roQ3AE9D+>PW+
0JG7:0J5.@3ArWN1Gq!31,(FC0etI?/i5OJ2`!-A1,C%.0JY=91,1I81H%-L2)?sC2]sk01,(C>
0K:[C2`3<F2)[HQ+>PW+0JG7:0J5.A1,1^F2`ET:1,(I;0JP=>/iYU?1,q$H1,C%.0JY=92)%$C
2DI-L2)mKR+>PW+0JG:<3%d$D1,1I>1c@<91,(I;0JbID/i5@B2D[0K1,C%.0JPRB1,1U<1cRKS
1,CdB3$9t10f^sD0f1L>3&roQ1H%6M+>PW*3AE9D1bLUE3B&]L2).'51,(I;0JtOE/iGF=2*!WV
0JO\*0JY=91GUpB2)I'F1,LdD+>PW+0JG7:0J5.A2D[9M1,q071,(I;0JbID/i>I@1bppB2)ud7
0JY=91,1I81H.!C3&WKG0d&5*1,(C>0K:[C2`3<F2)[HQ+>PW+0JG:<2(gaH3AWHN0KCm21,(I;
0JP=>/iYU?1,q$H1,C%.0JY=92)%$C2DI-L2)mKR+>PW+0JG:<3%d$D1,1I>1c@<91,(I;0JbID
/i5@B2D[0K1,C%.0JY=91GUpB2)I'F0f_-K1*A>+1,(C<1,pmD1bpmB3B/`M+>PW+0JG:<3%d'F
1,L^G3&*641,(I;0JtOE/iGID3&!-D2)-O2-p014/1<V7.4cl00I\P$4>8384>6           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
