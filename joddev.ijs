NB. JOD dictionary dump: 11 May 2020 08:42:36
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
0ekO.0f^@3+>GPm2)ud=+>l)#0ea_/0d&2-+>u"u0ea_.1E\D1+>P_q0eje,0d&@s1,9t-0H`/3
+>GPm2DQC00H`;6+>GYp2_lL11a"\7+?:Q'3$9q4+>bqu0esk-1*A;++>Y\o0esk.1*A;++>bl@
77TpE8PVZB=EAS)Bl7Q+D..I#Bl7Q+F*(i2F<GL6+A?3CAQU'hDId='ARlp-DfTA2/Kf+GAKXH.
91;fU91;TS78?6B:..NQF*)G:DJ()/@<--tDJ()'DIal.AfscU<+T/SBl7HmG\(D.GAhM4+>"^W
ARuuR5taXG:J4,O;as&G79!&U78?c:+CT.u+>Y-T+=MGGCagKKDeip%F!*%WFD,5.FE1f(Ch[d"
+C].qDJLA5AfrK`0mcAU91;fU91;TS.3NJ9FED)7F!4,$8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8
ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$FDl)6
F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)
@:Njt8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX
9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APu<"<*)jn
6rRi=A8Gt%ATD4$ATD^-F<GdGEb'56-rNi:<*)jn6rRi=A8Gt%ATD4$ALSa7Ec6)><(KSZ:dIiE
:IA`:Cht55@;]Uo@j#?-ARfk)@:F%a+E1b2BHSlLF`V+:E+*WpDdso.DJXS@BkAK+DBO"6ASc0*
E+*j%=&M=\:f9_O8Q]\EG%#3$A0>V0F*)G:DJ()5FCB33Bl7Q+GB.,2E+NQ&Ch[cu+>"^IG[kQ4
A7Zl24ZXr5/Kf.U@;0OlDJ()$Cgh3s+DkP/FCfK6=&M=\:f9_O8Q\q\=<MQkDIdZq+A?3CAQU'e
Ea`TtASuT4Ao_g,+=L;h5u:BU77KjN.3L2bFD,6,AKZ&9EbTE(F!,=BF*&O7DfTl0F)Z&8A79"Z
Ci<`mF(96)E-*gCE,]B+A9/l3EZfC6E,8rmATJu&+EM%5BlJ/:Bl5&8BOr<&Ddd0!F(96)E-*4D
ARfgrDf-\9Afu/:@<-I4E+EEtF`2A5F`DDDDffP5F`)2ADffQ$+EMXFBl7R)+Cf>-FCAm$Bl7Q+
@VfIjCNDNZA7BP$DffQ5E?HW=3a?-1@;]k%+DG^uE+*j%F!+q+FCSu3AoD^,FCf]2DId='ATMI%
Ec#6,+DbJ.AU#>3DId='+Cf>,D..<mF!,(8Df$V0Ci<ckC`mS'Ebf`4@<?(*Ao_`sEbf3%@<?(*
+D,Y4D'3\(Ebf3(GA\OGF(oN)+E1b,A8bsp@<--r@<6L(B5VQpEbce4+Cf>#AKYT'EZf1,FCf\>
Bl7HmG\M&.F(KH&F_PZ&A8-(*F(KH704T$6@<?(%+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaE
A92s8@;pC1@Vft#B6SB)E-!.FATD6gFD5S7FCf]=+Dbb0ATJu<Bln#2Ch7KsFD)d\+=MI`    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fLg00fL42+>G_r1*AJ22Du[40d&4o2_[!01,'h++>u&71*A;++>P&t0JPF-0fC.0+>Yl/+>GSn
1*A;+1Gp:03?U("0f:jG+>GSn1*A>01H?R41E\Fq0f(OC+>PYo1*AS;2BX_.+>P&p0K1jI+>GYp
1*AA02)QL30H`+n2D?g@+>GSn1*A;.2)QL23?U("3B8c90fL41+>GZ02]sh3+>P&o0f:m^:IINL
8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>PVn+@KX[ANCqh1*B;"EZd+k0f^@22``]M3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1a#)'EZd+k0f^@23BAiM3\WN#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr
0f^@22EEZK3]&`%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P_q+@KX[ANCqh2]tD/B-8r`0f^@20fh!B3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
3?TG2F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3\rc'$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqh2]tD/B-8r`0f^@21-.-H
3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp1:
+@1-_+>PW*3?U%33\iHO0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Pr"6$6f_1,(FC+>GZ51H%9M3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9)B+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1-$ICF_;gP0JPR10f(jI1-.3L$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh3?UV1B-8r`0f^@21cdEN
3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp+4+AZKh+>PW*3?U"93]/oY2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2]s52@<?'A+>GSn:2b:u1,(FC+>GQ20f1pH0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D2``]R
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh
3?V(8Fs&Oo0f^@22**QM3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqf1*Atr@j!N\0f^@21HIBL3\W>s
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqf
1*Atr@j!N\0f^@21cdEH3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>GYp+@KX[ANCqf1*Atr@j!N\0f^@21cdHR3\rJt$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqf1E](s@j!N\0f^@20KLsJ3\`T$
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqf
1E](s@j!N\0f^@21cdEP3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\0f^@21cd?K3\iJu$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf2'>:u@j!N\0f^@13BAoT3]&Pu
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf
2'>:u@j!N\0f^@21-.9O3\W8q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gl!+@KX[ANCqf2'>:u@j!N\0f^@21cd<G3\`T$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf2BYD!@j!N\0f^@20KM'O3\W8q
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf
2BYD!@j!N\0f^@20fh-F3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WAt$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf2BYD!@j!N\0f^@21cdHI3\`W%
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf
2BYD!@j!N\0f^@21cdHJ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Pes+@KX[ANCqf2]tM"@j!N\0f^@20fh0I3]&c&$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqf2]tM"@j!N\0f^@21HI?I3\`N"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf
2]tM"@j!N\0f^@21HIBO3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\0f^@22```O3\`T$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>bt6tKjN1,(FC+>>f:1cIHN3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@2
0KLpD3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A
+>>bt6tKjN1,(FC+>GQ20fM-K2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r
@V'R@+>Ybq+@KX[ANCqf3?U_$@j!N\0f^@13BAoP3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>eu6tKjN1,(FC+>GT30JY[G0FA-o:-pQU;gEG+
ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp48+<X'\FCdKU0esk>
ARci<0JPR10f(jF1cdHI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=Wi
D.7's3Zp."+@KX[ANCqg1a#1t@j!N\0f^@20fh-K3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.9+@KdN+>PW*3?U%43\rNP1,TCG$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Gl!8muT[
1,(I;+>GQ20K;*M0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,9tE@;[2C0JY=)0fM-N1-.9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4
+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2'>V%EZd+k1,'h*1cdBJ3]&c&$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,pCN@<*JG0JY=)0etdG
2**NN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Po!
9jr&b1,(I;+>GZ50JPUB2$urO6r%ZBATM3qA26(Q$=HJ%6r%ZBATM6%Ble?<ATKMHBk(q"04K':
F"_!:FCSuqF!,[@FD)e,F`MM6DKI!n:IH=HH#n(=D0'(o$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15jKFCfM9@:F.tF<G(9EcP`/
F<F1O6m,oKA8c@,/g+,,BlbD-De!p,ASuT4Bla^j.WBE>@qB1^F"/;?BPDO0DfU,<De*6.+<Y'*
BleB7Ed;D<A7-NtDffQ3+CSc%F^])/@q]:gB4Z-:+:SZLF)uJ8F!,@=FCeu*BOu3q+DkP4+Dtb6
ATAo&AKYDlA9)7&F(Jl7+A$WqF_,V:FD,*)+Dkh*BQO[j@V$ZjA7T^lF)to'+EqO9C`m1u+Dbt/
B4YTrBl5%m:IJ!"3ZrKTANC8-%14gB+CJ/E6r./^:IJQ,A7-NoF!+\#FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX/o>-)-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r,FPA19,?$4R=O$;PM]ATJu&E,]AsEZet7Df$V;ARf:h
F<G[D+E)(,ATMr9@;]TuEb/ioEb0,uAKZ).AKYK*EcP`/F<GLB+Dtb8F<F1O6m-M]Ch7$rAM+E!
%14=),9THe@WHU"Ed8c^0J">%0JY=)+>GK&/hnJ#+=MAMEb0&u@<5s.+:SYe$6Uf@7VR)i?t*b[
FC655H#R[EBl5&.De(J>A7crl6>psZ+EV%-AKYf'F*)IGDe:,0@;TRs/mo+q+<VdL%144#+:SYe
$6UH6+:SYe$6UH6+A,Et<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"EZd+k0f^@22``]M3]&Mt
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU0Jjn<E,m'V0JPR10f_9K1HI6E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc81b^sI3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_
+>PW*3?U%23\W6K1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=AF_;gP0JPR10etdE
1cd?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
2BX,1@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*3?U%43\rZT1H>dL$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1<+@1-_
+>PW*3?U%43]&TQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4+AZKh+>PW*3?U"93]/oY2)>RH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K
3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS1,oUJ$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*
3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<0JPR10f(jJ1HI3H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-
@<?'A+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqf1E](s
@j!N\0f^@20KLsJ3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lV$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>Vp6tKjN1,(FC+>G]6
0f;!I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u@j!N\0f^@21-.9O3\W;r$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU
0Jst@ARci<0JPR10f1pF1-.-M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*
3?U%23]&NO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<0JPR10f1pJ0KLsC
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/
@<?'A+>>\r6tKjN1,(FC+>G]61bh$G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqf2]tM"
@j!N\0f^@21HI?I3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>_s6tKjN1,(FC+>Gf9
1Gh-I3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\
FCdKU0K:1CARci<0JPR10KD0N2``]S$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@20KLpD3]/c%$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9+@KdN+>PW*3?U%13\`QS
1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A
+>>eu6tKjN1,(FC+>>f:1,M$I0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!Y
A0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6H$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f1"@ARci<0JPR10ek^G
2**HI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU0fL4CARci<0JPR10f(jH1-.0L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f^@K@;[2C0JY=)0ebXB3'&lO$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,9tE
@;[2C0JY=)0fM-N1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P=#+<X'\FCdKU1,U1K@<*JG0JY=)0f1pH1HI?P$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1;+AH9b+>PW+0H`)*3\rWS1GoLH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,pCN
@<*JG0JY=)0f(jE0fh!G$;X>`8l%iMDffQ31,Vfn.Si`+8l%iMDffQ3+ET1e+AZfa+A,Et+Co&,
ASc:(D.RU,+Du+>ATKI5$;No?%15is/g+YEART[lA3(hg0JG@pARdGL+>"$0:-pQU@q]:gB4YU7
+>PW)2e6K00Jst)+EMX5DId0rA0>Ps@:Wqi+CSekARl5W%16$FAKWBn:IIrrFCfMB+D,P4+Dl%;
AKZ#)@qBP"+Du+>ATKIH6#:U\+EM+*+=Lo;F*)>@H"q8..4u&:<+oiaAKYl/FCfM9@<,p%Derr,
@;]TuFD,5.Ble?<ATJu-@<Q3)@V'+g+DbJ,B4Yn)+CSekEb0<5ARl5WDfQt/@UX.bDf0,s/g*_.
Eb0?$Bl5&8BPDN1@V'%XF`V+:-t-X/@3BE$Ci![#Bjkg#D/!WrF<GX5GpskLBleB7Ed8f;$4R>=
Ec5E'ASlK2GA2/4+EV:.+CfP7Eb0-1+A,Et+EMgLFCf;A%14[=/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$8FC\6tKjN1,(C>+>GT3
0JY[C0b"I!$8EtP8T&$VD/a<&FCcS6F`]9LATT&9H#7D0FE2XZ+<YWGF<G"0A0>MrF<G"4AKYSn
Bl\$8+EMgFD.Rg0Bk(Rf%144#+EqOABHU_+An?0/@;]t$H"h//+D#e-AT2a*Df0VW%13OO+<Vd^
+>G!OATT%BFCfN8E,oMuD.7<m-OgD*+<VdL1*COYF<DrQATMs4Eb/Zr@VfU'4!uX5/hS8gAU&;>
/hSb(+:SYe$6UH65p0ZUD/E^!A0>o(A7]grB5Si5BQ&$0A0>r8EbT].+D,P4+Cf>,E,9*-AKYr7
F>%9<F<GXMD/Ej+Ed8cZ+Du*?AU%]rE-,f4DK@lK$4R=t.3M3(+Eq78+CQC0BleB)CLnW+Dfd+D
D]ib3@r-9uAKYr1F*(i-@VfUs+DG^9FD,5.A7]@eDJ=3,Df-\9Aft`,Dfp#?%144#+CT.u+EM[>
FCfMG+<XWsAKY`+A9;a.C`k-CCi_$JBlbD+@<6-m@;Kb*+CQC.Cis9$AKZ)5%144#+D58-+CT;/
F`(_4FD,B0/g)95Df^#/D.7<mF!,[FF_kS2Bl7F$ARTXk+EMgFD.Rg0Gp$O5A0;<g+<VeJBl.g*
BkDW5D..-rFCAm$Bl7Q+8g&2#F*(u1F!,17+D5_5F`;CS+:SYe$6UH6/Kf.R+D,>4+EV:2F!,L7
EHPu9ATJu(BOPdkATJu.DBNG-D/E^!A0>f0FD5Z2F!+n/A0>u-AKYGrDIIR2%144#+<VeC@<ld6
F<GL6+EV:.+E_R4ATDU4Bl7Q+@rH4'Df0-(F<G10Ch7Z1%13OO1FXGGBOr<#DId='-Y[I2+EMgL
FCf;3F`V,8+C]86ARlp"BleB;+E(j7GAhM4+DtV)ATJtG+E_a>DJ()5H#7#/Ci^$m+<VeNDfol,
+F.[4Ch+YtBkJQ-ATDC$Ec#6&@q?clDf9]=F!,(5EZf1,EbAr+A8,OqBl@ltEbT*+/e&-s$8a1S
7qHRLEa`c,E+*j1ATDZ2D..NrBPD?s+EM47F_kS2Eb03+@:NjkFD,5.E,oN%Bm;:PF^fE6EbTE(
06;8JAncK4%144#+DkP/@q]RoB-;)1G:j=3%14sA+@.,kBl.g*AKYf'DIjr4AU&;>A7]S!@3BW:
F*(u1+EM47F_kS2@V$ZjA7T7^+D,P4+EqaEA90@4$4R>#.3Lo!B5DKq@;I&7D..=-+Co1rFD5Z2
@<-'nF"&5UDfTAACi<flFD5Z206M>IF!+t5Df]tBEb/ioEb0,uAKVEh+<Ve@F!,@3ARo@_/e&-s
$9'CV5p1,hEb-@c+@fF'+D,Y4DKI"4DIal(F!,@3ARo@_/e&-s$90IW8l%htD09oA+EDUB+E)-?
@W-@%+EqO;A8c[5+CT.u+Dbb0Fa,$MH#n(=D0$-n%15*E+A,Et+Dtb%A9/l%+D>>&E$0=8Eag/5
BOQ!*DfB9*F!,UE+Co&*@;0OhA0>Q-D/:>9FEq\6+D>>&E$/b2EZbeuGAhM4F"Rn/%144#+<YE;
A8#OjE$-NIF`\u?$4R=O$4R>=Df]u6@VfTu6YKnGB4Z-,FDi9o:IHfE$8!h]/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=1,0n>ARci<
0JG@,0KD0M2``WI%13OO%14g=+AH9[AKZ&:Eb-@nDJ<U!A7ZltF!,FBDfB9.Cj@.:@;]UlARlot
DBNn@F=2,P@;]TuB4Z04F"Rn/%14j>+@C'bF(o/rEZf%(DIdQtDJ((lDJ<U!A7ZllF!+m6FCf]=
+EVmJAKY])+CoD#F_t]-FCB9*Df.*KAM.UJ%13OO+<Vd`+E2IF+=D;LBk)'lATVL.F=0.M:.[fK
6q'0b+>,9!/hS8hDJ<U!A7Zm*AU&;>/hSb/-OgCl$8X+R6"FLK+CQC6Bl.g*AKYJr@;]^h+Cf>4
DKI"5DfQt=@VTIaFE8R=DBO%7AKYMlFCAWeF(Hs5$6UH6=(l/_+ED%4CgggfDJ()9DfTB005k<7
ARfh'+EV:.+EMgLFCf;3@s)g4ASuU+Gp%-=@:XEg$6UH6FD,5.FCB3&ATVKo+Cf>,E,TW*DKKqB
@;]Tu@q]F`CNCV?BOr<#DI[U%Bl7Q+DIIBnEt&I!+<YlBFD)e=BOr<.@<-!lF<GI0D.Rc@+<XBs
F*&OCAfu2/AKYQ/E+Np.AKYo'+CT.1F`:l"FCbmg+<VeF@q0Y%F!,[@FD)e=BOu6r+ED%%A90@4
$6UH#$6UH68S0)R+ED%4Cgggb+Cf>4DKI"F@<3Q"A7T7^+EVNEFD,5.Eb03+@:NkZ+EMXFF^oN9
Eb-A%%144#+Dkh1Bldd,Ch4_tD/XQ7F<GL6+E)F7EbK#mA0?)7F_kS2@V$ZjA7T7^+EVNE@rHL-
F<G78G7=m%+<YN0DL!@HBl.F&+CT.1DdmHm@rri,@<3Q#AS#a%Eb03+@:NkZ/g)99BPDN1BlbD*
+DYP6%144#+EMX5FD5f<Bk&b<+B3#gDJ+#5FD,*)+D58-+Cf(nDJ*Nk+CQC/Dfd+1Eb-A9F*1o-
CjA&N$4R=b+<VdL+<Y)A+C]J+B6bV.F!,.-ChsOf+<VdL+<Ve9.3NMHF<Gd=Cht5)ATMQuDIm>f
$6UH6+<VdL%144#+@g!bFD5W*+EqaEA0>]"G%GJ4@q]:gB4W2qDfor>F!,CDF<GL6+EVX4A8-."
Df0!"+Eh=:F(oQ1%144#+Cf>-FE2;9+EMgLFCf<1+DGm>@;L"'+CQC3@;0U3+<XWsBlbD@Dfol,
+DkP&AKXT@6k'JG+<YN>Eb-A9F(Js+C`mq9FD,T8F<G!7F(o9)BkD'h@;^00Dg#]4BOtU_+DG_'
Eb/[#AM+E!%144#+B3#gF!+t+@;]^h+EqaHCh+Z/AT;j,Eb-A%+Cf(nDJ*N'FDi:DBOr;qBl7@"
Gp$p3H#IhI+E(j$$6UH6A79Rg@UX=h+D,>(ATJu7ASu$iEbTE(+E2@4G%kl;F!,"%FCAWeF(KD8
F`)52@:WeUCh54.$6UH68K`4qF_kS2BOQ'q+EVNEB5\o7BQA$6B4rDr+CoV3E$/S,A0>o(F*)>@
AM,)J%13OO%14p@+@C'bF(o/rEZee$A8,po+DG^9@;^"*BOu3,E-67FDfBf4Df-\>BOQ!*GAhV?
A0>r8DfTD3FCf]=+Co&"FCB5"$6UH6Bl5&8BOr;sDe!p,ASuTuFD5Z2+Cf>,E,TW*DKI">Afu#$
C1UmsF"SRX<+oue+E)4@Bl@l3GAhV?A.8kg+<YT?Cj@.4AKYQ/ARfk)ARlp-BOu'(Eb065ATMs)
A0>?,+EV:.+E_a:E\8IW8TZ)!Dfol,+DG_'Eb/[#AISth+<Yc>AKZ&>F*(u1F!+t2A7Zm)BmO>5
@X0)5@<l<n+>PW&1b^%gBl7L'+C]J8+EqaHCh*t^+<VeEDfd+1A7QfkDL!@CE+O&uFD5Z2@;I')
G%G]-ART*lAoD]4ATMs%@Vfb"BOt]sDfB9.@<?4%DK@E>$6UH6<+oue+EVmJAKYo'+E)4@Bl@lt
C`m8"Cij).Amo1`Ch\!:+DGm>@;L"'+Dl%;AKY])+EVaDAISth+<YlBFD)e@BOQ!*8K_PTASiQ4
F(Js+Cb?hQ9lG)p+Eh=:F(oQ1+Cf>-FE2;9+EMgLFCf<1+EVX4@r!1r$6UH6@;Ka&@q]:gB4Z-,
FDi:3De*E3+<XBsF*&O7BOPdkATJu&Eb-A8EbT]2@;I&pDIal(EcP`-AThL"F=n"0+<VdmF!,R=
D.Oi&De3u4@X0))Cht59BOu6r+EVg=@;Bp,A7]Co@:WplFD,5.F`_>6BlnVCDe9Fc+<Ve:De*E%
BPDO0DfU+U%13OO+<Ve+BPDN1@q]:gB4W30Dfol,+ED%5F_Pl-+CQC/@<ld6F<G(,@;]^h+EVNE
FD,5.6r-0A:.\D-DJsZ8%144#+C]J8+EqaHCh+Z+Dfd+9DKKo;A9DBn+CT/5+C]&&@<-W9A79Rg
@UX=h+DG_'Df'H%FD53#Bln'#F"Rn/+<Vd9$6UH66tL1V@3B&uA7Zm-Dfol,+D>2,AKZ)5+D>2$
A8Gg"FD,5.DIn#7F*)GF@ruj6AKYE!A0>H.BleB1DJ'Cc+<Ve;De!p,ASuTuFD5Z2+Cf>#AKZ28
F_kS2BOQ'q+EVNE@V$ZlBOt[hARlolDIal/Df]u6@Vg<4@:X+qF*(u(/e&-s$4R>?ARf:hF<Eqa
@;]^hF!,RC+A,Et/e&.>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%14jM+AQiu+>PW)2]sh23\rcW1cPpO%13OO9jqpb+Cf(nDJ*O%
3Zp!s8K`4cF!,@=F<G^FA79RoDJ()6BPDN1A8bt#D.RU,+EMHDD/XK;%17#c+EV:2F!,[FEbceA
@<3Q/Dfd+>Dfd+>DffQ$/g)9.-Z!TACLq'r+C\o(FCfJ8DJsW.Et&IjDBO%7AKYT-FEMV8/g)9-
ATD?)@<,p%F)Po,+D>J%BP_BqBQS;V%13OO0e"54Df0`0Ecbl'+EVNE8g$#E0JXb&+EV:2F!,[8
F!+m6D..0tEZf=0Bl5&%F!+(&F!+q#F(o+n$=RsfF_t]-F<GXMDKK<3+Eq78+Cf(nDJ*Nk/g)99
BOr;rDe*E%G@>P8@rH7.ATDm(A1e;u%14j>+AZlkBl7K)BOu"!+CSekARlo3C2[WrASc<7%13OO
1FXG5F_>b<AncL$A0>T(+=Lc<CagJT@rH4'C+196DIal.FD,6++EqaEA90@G%13OO1asP8BleB:
Bju4,ARlp%DJX$)AKYH-+EV:.+DN#W/hf%'@:WneDBNn,@r#LcAKYhuDII0hEZee.A.8lSF<FOr
AKXT@6m,<7B4Z-:%13OO2(9Y9De!p,ASuTuFD5Z2+E_R4ATDF%Bl7Q+AU&<.DKBN8AKZ#)/S/I,
F<G[D+ED%*Ch7*u+EV:.+DkP)Gmt*jBOPdkATJu4G%G\:FD,5.H"CE)F"Rn/%15!B+AQj!+EMXC
EbTE(+CT)&+A,Et+EMIDEarZ'Bl5&8BOr;sBk)7!Df0!(Bk;?.@;]TuB4YslEaa'(DJ'Cc@;Ka&
A8-+,EbT!*FCeu*Anc'mF"Rn/%15$C+A,Et+EMIDEarZ'BlbD7Dg*=C@<-I+Gp%6IA7]d(;fuPm
ATDj+Df-\-Df0Z;Deq$K%13OO3%5tEDe*QoBk:ft-uEC.ALS`MD/=8B+EVNEE,ol,ATMo8A7]^k
DId<rF<G(3A7Zm)ARfgrDf0V*$>FB#B6%p5E$/S,A0>r9Blmo/BOtU_ATDiE%143e$4R=O$<1\Q
DJ+#5FDk].3XlEJ/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO0e"54Df'H0ATVK+A8bt#D.RU,@<?4%DBNt2G%l#3Df.0M+A!\a
D'3e6@;]ssDJ()6GAeUIATDj+Df0V*$?'N!8l%htA8bt#D.RU,@<?4%DD!%S<+ohcDf0B*DIjr6
ATDj+Df-\>BOQ!*BlbD7Dg*=HDId=!+Cf>-F*)GF@ruF'D@HqeF!+t8EcP`/FDQ4FBQ%s6ARlom
Gp#UqDeElt-Z^DKDJX$)AKYN%@s)X"DKI"CDf9G7-s(G'FCf96.4u_c<+oiaAISuWDe!p,ASuU2
+Ceht+C\n)A8c[0Ci<`mARlolF!+"Q9h[/^+BN5fDBO%7AKXNC9hZ[?De!p,ASuU(Df-\3F!,@3
@<-10+:SZfDf'H0ATVK+8K`4kCht5<EbTW,+EMI<AKXSf@rGmh+EVNE@rH7.ATDl8BlkJ>D]h_^
<+T/eAM,)J<+ohc9OUn3=<Mg%ChsOf@V$[)F(Jl)FDi:7ASu("@<?''@3BW*DJ*cs+Co%qBl7X,
Bm+&1:ddbqA8bt#D.RU,+EV:*F<GdACht5'AKYMtF*)G:@Wcd(A.8l[DBO%7AKYGjF(o,,8l%ht
A8-+,EbT!*FD5Z2/g)94DJX$)AKYN%@s)X"DKKqBGA1l0+Du+>+C\n)A8-+,EbT!*FCeu*@Wcc%
$?KouE,9eBEb/ioEb0,uARmD&$4R=t.3LurDK]T3F<DuHDe*s.DesJD+D#S6DfQt/DIal,ATMp$
B4W3!@;]UlBl7Q+FDi:DBOr<-@q]FjAKZ,:ARlomGp%3BAISubFD,6++A,Et+Cf4rF)to6/e&-s
$8X+R6"FLKFD,5.AoDL%Dg,o5B-;)'G9D*JEb'5P%13OO+<Ve8.3L$`DJUaE/M/)]Bkq9&A8Z3+
@Wcc8F(Jd#@q]Fp+CT)&+ED%+BleB-Eb/c(A8,OqBl@ltEbT*++D,P4+DtV)ATKI5$6UH6@OWEJ
@W$!2+>#/fCh[Zr+CoA++C]J8+EM+&EarcoF!+n-C`m51EcP`/F<GOFF<G+.@ruF'DIIR2+C\bh
CNXT;+D,P4+DtV)ATKI5$6UH6@jrNK@V97o.3K`b/KeVLFE1f"FE8QQDIIBn/9YH<F_*!E@;]Tu
-uNI1ALq>-@<6K@G%#30ALSaD@:F%aF!,(8Df$V+@:O(qE,uHq+<VdL+<VdL+<VdL+<VeKBOu3q
+EqO9C`m1u+Du*?-t7.<F=A>RBl7El+C\bhCNXT;+AGj7<$4q)<^fn/6:E"_9N4GY778a;$6UH6
A18WLA9;lA+>#/fEb/m+Cgh?,AU&07ATMp,Df-\0F_kk:FCf]=+EM+&EarcoF!+n-C`m/&C`mY*
C1UmsF!,C=+E1b2BJ'`$%14p@+@0OK+Dl%;AKYet@WNYD+Dtb%A0>;'8l%ht6=k4[+Ad)e@ruEp
ATKCF8l%ht<,Z\k+Ad)sB6%EtD/!m#/e&-s$8j7T9jqgK+CT/5+Cf(nDJ*O%+ED%5F_Pl-A0>u4
+EM[EE,Tc=+B;B13$<<SG]Y&V@rGmh+>Pi(+DG^9D.-ppDf[N?$4R=O$;aMs<*sBYA8Gt%ATD4$
AMPu867u)1;cI+=De*ZuFCfK$FCcS6Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g
6Ua.!+=Jod3Zp+*%15is/g)QWDe*ZuFCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+eIE,961+<VdL+<VdL+<XEG/g,">CLnW)
@<?(*+D,P4+D5_5F`8HOGps10:-pQUBkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`iAKZ&*@ruF'
DBO"CD/E^%Gp%0MEbTE(%15is/g,4HFD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'uAKYT'EZf=ADe!@"
F(oN)%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-WEl0:L?^i
6sjeA1,fXL?qO3_?m&EE6r+7!4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(n
DJ*O%+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"Rn/<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>
F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*B;$:8cOGB7=<FD,5.Eb0E.F(oQ1+D>J1
FDl2F+E(j7FD,B0+D,>(AKZ)5+ED%:Bk;K2@q]:gB4Z-:%15C;F)NTPEb/Zi+Br5eBleB7Ed99S
A7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E905,'@FDl2F
/o>,J%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4/g*u,@;^-/A8`T.Dfd+>
ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>3DfQtGARTV#+A!\h@<Q3)D..-rFCAm$ARlol+E2@8
G%#K(+E2@>C1Ums+Dbt/+EV:*F<G:8@r-9uATJ:f?qO3_?m'Z3Ebd9M8K_n^G%G\:,&h[6Ch[s(
ARlu-FD,B0+CoD#F_t]-F<G16EZfI;AKZ&.D/a<&+ED%%F)Pq*$?TriF<F-tA8,Rl-ZgJT@;^00
FDi:9D/a<:+EV:*F<F-t@;R,sDf'?*FED57B-;;7+CT/5FD,B+B.b<%Dg*<q+CT+0@rH4$BlnH2
DJ'CcFDi:6Bl7X+BPD?s+EV:.+D,2/+ED%1@;0UnDJ()"8l%i_+D,1nFEMV8F"Rn/%16KI@V'1d
DCosKA8ba]%13OO0eOSV4C9s)B5hBp0lCh`0OltL12LS]0P#*9@:<bT5%#L2AS,XoAKZ).AKYAq
De*ZuFCfK$FCei&:ddbq8l%htF)Q2A@q?cmDe*E%A8bt#D.RU,/g*o-G9D!@@<;qc+<Vdu-['&D
Eb0<7EcP`$FCeu*?tsUjCh\!&Eaa'$?m&lqA0>o(G%l#/A0>T.+D,P4+CfP7Eb0-1+Eh=:F(oQ1
F!,C5+BrenDIdZq>psB.FDu:^0/%9QDIdZq/oPcC0.@>;+<Vdu+Ceht+DG\3Ec6,4+EV:.+EMID
EarZ'@rGmh+E2@4F(K62@<?4%DBNJ.@s)X"DKIKR;e9M_FD,5.Eb0&qFCeu*+CJ/E6r.0)De*Zu
FCfK$FCefrA7.#!$4R=t/g+Oa?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!
A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P
9OVCO%144#+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>M>@h\_/TboADd?`[
$<0eh:L@jTA8Gt%ATD4$ARB:b1,fXL?tsUjCh\!&Eaa'$?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$4R>M
C2[X!Blmp,@<?'g+DGm>@3A/q8l%ht@r,RpF!,+9Dfp"AFD,*)+E2@>G%kJuEt&I\Ch\!&Eaa'$
+E2@>B6%EtD/!m#>psB.FDs8o05P?EATD4$AT2[.B6%EtD/!m#/n8g:055<7AU#h@FDYhC+EM[E
E,Tc=%16]cEZdss@rGmh+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%13OO<+oue+CoD#F_t]-
F<G[G@:O(o+E1n0A8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?tsUjCh\!&Eaa'$?nMlq
<+ohc@UX=h+>Ynu@psFi+DG_7ASuR'FD5o0+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(
ATVX'AKYo'+CQC7@<63:+A$YtF`(o5F_,B7%16o[@V'@s+D"tkBHVD*F))n,DIal,@;BFq+DGp?
E,Tf=Bjtmi+Cf>,E+s-"+Co&*@;0OhA0>Aq@;]^h+D>J1FDl26ATJ:f@X0)<Ec5c1Bl7Q+Dg#]4
+EV:.+Eh=:F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AM+E!%16KI@V'1dDCosKA8ba]%13OO0eOSV
4C:'mAS!];AoVKnARTD$0lV+dG\)"T@l?,M5%#L2AS,XoAKZ).AKYYpDIdQtDJ()1Afu;<@;p0s
A0>u*G]YPI$6UH6?tsUjCh\!&Eaa'$?m'Z6@;p91Ci=3(+EV1>F<GC6DIml3FDi:6BlkJ>BOu$'
Df-\++E1b%AM+E!+<Ve!/0K(QCh[Zr+DkP)Gp%$IBOu3,E,ol0Ea`g%Bl7Q+Cgh3oF^\ooF"AGE
De3u4DJsV>BOQ'q%144#+CQC6FCB&t@<,m$D.R-nF!,C5+Eqj7E,]N/B-;;-G]YP\<+oue+Co%q
Bk(jgDI[r7@rH3nBl7Km+EqOABHVD1AKZ)+G]XB%+<VeIAT2[$F(K62@<?4%DK?q>Ec5K2@qB0n
@X0)(2'G"<?m&rfDBNt2F*2;@+DG^9Ch[cuF!,R<@<<W5E+*W,.W&U3Gp%3BDfp,0DIdf<%144#
+E(j7@q]:k@:OCjEcWiU?tsUjCh\!&Eaa'$?m'Z6@;p91F*1u++Dbb0ATJu&DIal(DIdHk@<?(%
+EV:.+C]A&@;@!0Bln#2FD,4p$6UH6Ch7$cBl7Q+F*)G:DJ()"-U'.84s24\/g+,,AKYf#@:X(i
B-;8;EbTE(+C\npBl7u7ART(^+Eqj7E,]B!+Dbb0AM,*)BOr<-FE2)5B+51j+<Yl:F!+t+Df]K-
+C\nl@<HX&+DGpFF!+t8EcP`/FDQ4FD.R-nBl7R"ATMo8Bl5%c/g+,,ATD?)@<,p%E,ol+Ch7I)
+EqOABFP:k+<Yc>AKYf#@:Wqi/g*_.BOPEoFDi:9DKKo;A9DBn+CQC7Ea`ZuBl7Q+@VfIjCER_;
+E2@4G%GQ5+CK.sDIdZq?m'N9DKK<3+D>J%BP_BqBQRs+B+51j+<Y9:Df$UHAp&0/DJ(FAFD,5.
Ch7$cATAo;Bln#28g%V^A7ZltDBO"=D.Oi(DKBo.DI[7!/g+,,BlbD<Df''-Bl.F&+ED%7F_l/@
+DG^&$6UH6F)Z8BBlA-8+C].qDJO;G+=\j=ASl@/AKZ).AKZ&5F`M27F`S[7Cgh3sF"/Xl%13OO
1+j\W4C9sd1LkEC3Gr;=F)u82A8a22A7IVW@l\F65%#L)D/aN6G%De<BOr<#DKKH&Eaa'(Df-\9
Aftr!Ebf3(GA\O3DIa1`+<Ve#@8pf?+CoD#F_t]-FCB9*Df-\0Ea`TtASuU2+EqOABHU\tDe*Zu
FCfK$FCei4%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)f
E+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu%15is/g+\=Eb/a&DfU+U
%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG
/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@C
E+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(
@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!ZD'138F_PZ&C2[Ws
C3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQB$;No?
+CT>4F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0r
A0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JP:sF`&lg%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kM
Bkh]3C2[X*F(KB%Df00$B4>:b/no'A%15is/g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SF
F<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu%15is/g)l.DJs\P3?VpJDII?(@q]F`CER_4
@<<W9EbTW;ASrW&Bl%@%+D#e3F*%iu:-pQU1,*HODDF$kF(fK9+Eqj?FED)3+D,>(AKYr#FD,_)
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&
3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu
+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?
%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?
Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)
$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#Ed8*$8l%iF
8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2
?XHE$6uQOL%15^'6q9gJ8l%iH8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPfC2[Wq
Bll"CDe*QsF"\mM$4R>;67sBnASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--.1$>O'e
@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;C2[X$
DC5l#C2[WpBl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G@:UKjCghC++D,>(
ATJu'@:O'^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Ys$4R>;
67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3RATT%V3[\Z\A8lR-
Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1+u(3]EaoOc%15is
/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5
+?V#(Bkh]:%15Qr9LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO%14dOC2[Wn@<<V7
+<VdLAp890FCcS9BQ&*6@<6K44"u"N8PDQO%14dOC2[X(FDl22A79R&Ap890FCcS9BQ&*6@<6K4
4#)(O8PDQO%14dOC2[WnDdm6cF<D\KAp890FCcS9BQ&*6@<6K44#2.P8PDQO%14dOC2[X"@;BFb
@<<V7Ap890FCcS9BQ&*6@<6K44#;4Q8PDQO%14dOC2[X*FD5Q%@<<V7Ap890FCcS9BQ&*6@<6K4
4#D:R8PDQO%14dOC2[X)Df9H5A79R&Ap890FCcS9BQ&*6@<6K44#M@S8PDQO%14dOC2[X$DId0t
+<VdLAp890FCcS9BQ&*6@<6K44#VFT8PDQO%14dOC2[X%Ec5Q(Ch4_3Ap890FCcS9BQ&*6@<6K4
4#_LU8PDQO%14dOC2[X%@<-4++<VdLAp890FCcS9BQ&*6@<6K44#hRV8PDQO%14dOC2[X*F(KB%
Df00$B4>:b+D,h<Blmo/F(fK9E+*g/+?MT17S-9B;[j'C$;No?+Cf(r@r!3/BOQ!*Anc'mF!,%=
BleA=Bl5&)G]75(FCeu*A8-'q@ruX0Gmt*/1E\_$0I\,68PDQO%16f]/g)Vr04I's+D,20BleA=
Gp$X9/e&.1+EMC<F`_SFF<Dr@Df'?&DKKH#+DPh*Bkh]3F(96)E--.DF`:l"FCeu1%144#F)>i<
FDuAE+A,Et7nHZP:IIcH;c#bZ8.>o;Cia/?%144#F)>i<FDuAE+=BTU;GU15/KenEF)u&5B-:]&
D/Ej%FCeu*C2[WsC3(M=@rc:&FE8QV4sqI7+F,(SINU3p@LWYe+CT>4ATDlF+>=p567sC)BQ%<%
@rHR#Dg<K8$>"*c/e&.:%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/D]i7,
1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16Qe
Bl%<pDe*ZmFCf\P0ht%f.UmO7Ch.:!A8G[rAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_Bq
BQRfr+A,Et+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7
F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/
F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL
+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBY
AT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU1,*QRGq^urEb0E.F(Jl).!g2cC2[X"@;0UdFCf\G%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=KCghEsGW@cE?Q_Km+=BH@
6#(=KCghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEsGW@cE-OgDmDeX*1ATDl8+=Cl<De(4)
$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$?U-(Ci<f+B4Z0-4$"a0ART*lGB.D>AKYJr@;]^h
F*)FF8l%iU9gg?<$4R>;67sBjF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F
%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj+F?.r/jrN%<(LA';cI+28l%in@VQ>ZF(KH.De*ZuFCfK$
FCcS*Dds4`%15is/g)NfH?pq]D..3kF!,R<BlbD/Bl\9:+E)-?Eb0E*EcYe7A8-'q@ruX0Gp$^5
Ch4`,@;TQuF)Q)@Et&I(Eap56AU#Rc3Zq-_6W-]e@;9^k?Q`umF<DrWH?s=EA8PahDI7KsGUEq-
FCf\[3ZpM23\5AaGRY"%AU$@!+=JTj,CY(dG%G]8Bl@l6IXWLp-S.>5HV.(%<_Yt2+Cf(nDJ*O%
FE/LGAU"Xk.!0B"+EV1>.3NhTBlmo/A8bs/-[L)bC2[X"@;0U3FCf\E%13OO:-pQU8l%ht@r,Rp
F(KD%$>O'e4ZX]I3[\Z\A8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)
Df9H5-OgE!FEfr0+D5_5F`;/*FCf\D/j:Cm@r)S]%15is/g,:XAKW@HH7'hSEb/isGT_*H+CTG3
Bk/>rCghBuATJu<Bln#2-YdR1-Qk#o04]!2F_t]-F<G10Ch7Ys$?Tj(Anc'mF$2Q,-p2$Y@jrNO
-8%J)-p/l'H7(-a/1)u5+DPD&+=nil4s2s8/p(ZL-Qij*F)>i<FDuAE+EV1>Anc'mF!+[0CijnE
GB.D>AL9#n+EV1>Anc'mEt&Hc$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(
A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$FCf8sFCf\P0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbdsAU#>=
/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3==t$i
:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4
A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;
DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!
%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QRGqgu^
$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-+<W%HDe*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj
5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eODe*ZmFCf\W3B8H0>9IEoATD4#AKX)_5s[eODe*ZmFCf\W
3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;67sBjF`MM6
DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj
+F?.r/jrN%<(LA';cI+28l%in@VQ>ZF(KH.De*ZuFCfK$FCcS*Dds4`%15is/g+b;FCSu,Dg#]4
G%kN3+DbJ.AU"Xk-ZW]>Dg$56GUGX8+AG-h;GUY.C2[Wi+D58-+=CoBA8Gt%ATD4$AT)a+ATqL'
AU#R3$4R>;67sBnASu("@<?''B6%p5E$/t*FCf\+$?L'&F`_SFF<G4:E,961+=CoBA8Gt%ATD4$
AL@oo%15is/g,@YBlmo/Dg#]4G%kN3%14M*Db;-6HTE9'HZ+(LAU#XHGB.D>AKYN%@k9!BDe*Zu
FCfK$FCfB6Bk;K@FCf\E%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K
CghEsGW@cE?YF.pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!Ki
C`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?c
A7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn
$4R=b+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'
F"Rn/%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0
Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1
F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSek
Df0VK+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0
IUd;6Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n
0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[
FC65*D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeG
Cgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdk
ATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXm
FEo!CF!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@
@:O(qE$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:C
F`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMID
EarZ'A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2
@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33
A1e;u%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8
@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@
ARlotDBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F
%144-+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s
$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57
F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN)
,r./H:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#
+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E.
/ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>
A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b
.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b
.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%
ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[
@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXC
Eb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6
+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5
@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0
%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQt
DKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*
Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<
%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH
%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1
+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h
%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!
+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jif3\OKS
ATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEt
G9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o+
+:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+FZXN:Id';
AQWPb=)`D$CbBF:Et&H_#n74a+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu
+CSekDf0VK%144#+<VdL+<V+##mkQeDfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u
$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o
+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTr
FDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7
@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%
+Du*?D/"6+A0><%F(o9)D.RU,F"Rb*%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%
+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=
0H_hf>n%,`+<VdL+<VdU%13CJ%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',k
F!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2
/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!
EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2
+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ck
C^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc
#mh%J+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$
G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0
+E1b2FCfK1/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'
$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et
%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s
%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL
+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=
.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%
DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^
7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCX
AKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*
2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,R
DImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i
?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL
+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O
2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$
@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b
+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm
6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL
+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MD
FD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo
$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4
+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!
Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@
?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c-
-YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&V
G9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FB
ATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$
F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1
Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7B
B4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+
%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nn
DBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W
?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7
D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;
@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL
+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50
@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$
@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL
+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#
+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#
+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%
+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,Xo
Bl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL
+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`
7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*
D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/
ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8
@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/
+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=
FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q
+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7
F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*
+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS
/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3
A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'
F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3C
D.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#
+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@u
A7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1
FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0s
DId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;
7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9
A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr
@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1
ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=
DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6
FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%
BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7
ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL
+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdL
D..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C
:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bd
Df00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.
?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>
+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>
FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'
+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-h
FCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67F
A8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'ur
FDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAF
C2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>
+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6
DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5
Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV
<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&
A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u
+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL
/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8
+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'
D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@
?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)
+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5
ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-
Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+Not
ASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk
+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/
ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIa
F<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#
+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od
@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*
D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGu
DeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&
,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]Ul
AKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1
BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;
ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-co
AKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO
,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B
@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%q
Bl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB
@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo
+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'
G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'
+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2
ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU.
/KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-
DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*
FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1
FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4
Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)
E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]Tu
F*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj
/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/
+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`fr
FCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#
+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`fr
FCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9
-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3
ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria
+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXI
Ch[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-
+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"
DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1r
FD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrA
H[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*
DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9
$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14
F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#
/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,
ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9
E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;
F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:
+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:Wne
DK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'
+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%
ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o
04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#
+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6
%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#
F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e
$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#
+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#
A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cm
Gp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)
2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043
EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)
De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'G
F`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,F
FDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6
Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&
@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,Xo
ATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(
?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHk
FC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)
Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d
+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,Oq
Bl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1r
FD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7
;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,
$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"
F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ
6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;
C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"
$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#
+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;
C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7
BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9
A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa
%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*
DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6
DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW
7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb
+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+
Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*
0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!
BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`m
ARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnS
FC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL
+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e
,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)
AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1
Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"
C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)
8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$Zu
Bl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,
D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdG
Eb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2
DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4
+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&
$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7
@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,pl
AU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;
G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#
+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq
+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9
$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir
+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt
+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%
+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjqu
C2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO
,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5
DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)
ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO
+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o
+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#
+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl
+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<Xlr
C2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>
+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*
ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,
@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?8
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6
B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!
+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-
+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$
F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=E
DId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E
0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOA
BHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P
+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-
+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!
BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%
+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb
+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8
E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!
CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*
+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q
05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#
+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb
+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&
1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?
@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUj
E+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3
E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c
+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.
+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(
Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#
+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$
C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(
Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`in
F=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij
+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79Rk
A0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq
$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn
+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj
/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)
3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&Zu
E-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9
+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5
?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)
Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5
?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2
+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%
+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%W
Eb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.6
3$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e
,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%
@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'
+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk
+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@
AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#
D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`
-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.
+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL
+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6
+<VdL+<VdL+:SZ#%143e$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h
+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5(&
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
F"Rn/+:SZmDe*ZuFCfK$FCfB6Bk;KqFCf\P1*n&bBPDN1C2[X!Blmp,@<?''Dg#]4G%kN3$=%X`
@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:$4:$[AU&<=FF.b@A8Gt%ATD4$AUP\8
F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-DImisFCfM#>\J.hAp\35FDu:^0/$mS/pD#FBlIWo
BjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%EtD/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&
Cj@.8Ec5e;8l%htA8,OqBl@ltEd8d?Ec6)>F"Re,>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,
@<?(/+A$HmATDBk@qC&q$=%%OB5)71;eTTMARp2r>[h8WBl88gBkM*qBkM+$Bl7R3>?qS@BR+Q.
EboH-CO9]7E,961I=#3oDfT]'CfG=gHY7A<Ch[u6+<VdL+<VdLI=5?fDf'?&DKJirCO9o,CLnW)
@<?(*+D,P4+D5_5F`8HOGq".K>\JD%ATDU$DJOT?ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]CO:,6
FD>`)Ch\!&Eaa'$+FSZC6Z6gYASuThDej]=Eb02uEb-A*DfQt>Ec5H!F)u&5B71+lBR+Q.EboH-
CO9c-@:NkiARfgrDf0uM>Y]3XD..6[Dej]6Amo1\F(Jj'Bl@l3+<Z)\>XNFHD.RU,<,ZQ!Bl8$(
Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I0s4jDIe)bBkM*qBkM+$Bl7R3$=%.[A:%6g@:Wq[
I0p;g>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+CT.u+A,EtI0p<dFCf]=FEDkEDe*Zu
FCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bdDe*E%@;]T_A8bt#D.RU,
+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKm>$=%%OB5)71ASuX-ATD4$AURc;/mSfhBlmp'
$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%htA8,OqBl@ltEbT*+/dbitFCf:r+<X9P
6m-,_Dfp"AA8bt#D.RU,F!+_0AU&<=FF,bc3?VjHF)W6LB6%p5E,K*$ALDmK@<,od+<Xp&Eb/j0
BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq02b5)6qp*&BQS*->U+2rDIdZqF"M6;Ebf3(
GA_hUE+*WpDds+s+Cf>,E+*j&@VfTuD..I#A8c[0I3<WCG]Y'?Ea`TtASuU2/g+D1D/a08<+oue
+DGm>FD,5.D/XK;+EM+7BlA-8$6UI-Bl.R+@<?4%DBNk0+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4fpj
9lG)p+E(j7D0[7:Ec6)>+CoD#F_t]-FE8R5Eb,S#+Du+>+DkP-CLh@-DD!&'+CT+0F)5c=Cj@.5
Df0`0Ecc#5B-;;0ASj%B8S0)jDfm14Df'H3F(HJ,Ec6)>$6UI%De!p,ASuU2+E_a:+E1b,A8bs#
D..I#A8c[0+CT.u+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht5'AKYD(Ci=D&+<YN>Eb-A9F(Js+
Cb?'"Blmp'$6UHWDL!@;Ec6)>+Cf4rF)tSuDf9`8DffQ;5p0EDD/a08B6%p5E$/Y,@<6L<+DGm>
@3A0<6m-,_Dfp"AGA2/4+CPU"+<Ve;ARfObEb/c(Ch[s4+E(j7Bl8$(Eb8`iAKYE!A0>o2Dfd+G
DfTB03XQuP+<Xp2AU&<=FF-SK5sn(B:JsSZI9^?#E+jT2Ec6)>DIIBnI3;s9A-sG%+<Xp2AU&<=
FF-n]:K1Ck;FFH3>\.bkBR=B4Dfp#:@;TS(/g+&1Dfd+GDfTB0+CT)&Dg)O2+<Ve3FCf]=FEDk<
Ci"-'AoiACFDi:6Bl7H(@;Ka&FD,5.GAhM4F!,R<@<<W$ASc:&B-;;7+EV:.+D5_5F`8r?+<VdL
6Yp1PF!,+9Dfp#?+EVmJBk(RfCj@.>Ddd0!Bl8$2+Dbt+@;KLr/g+D@AU&<=FF.b@A8Gt%ATD4$
AM.\3F+"B<+<Ve@F!+n/+D#e+D/a<&+E(j7@3B&r@<6K4B6%p5E%ZP]Bl8$(Eb8`iAKY].+CQC6
Bl.g*AKXSfG%G]'@<?4#$6UI#Ci<g!+EV:*F<G:=+DkP-CLq$!GA2/4+CQBt9OUn3=FP=&@ruF'
DBNG-D/E^!A1eunG[YH'DIjr4BPDMp+<Y<;Dfp"HF!,"3@s)X"DKI"+FCf]=FEDjb+?:QTBle59
-YdR1Ch\!&Eaa'$-[d+LDfQt/DBNM8@;Tt"AM+;s>[h8WBl89@ATD6gFD5T?$7-g2@<?(*+EM+(
FD5Z2+:;@pF^fE'@ruF'DL5W1AU&<=FF.Y@Dfp#:@;TS(+A$HmATDBk@qC&q$@[GQINWt[/o#eA
B6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa$?Kd#C2[X!Blmp,@<?''
+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7PjIXZ`pINTa?>\.e`HZit@@UX@mD1)arBlmp'$6UHd
Df..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5F`8I:ART+\Ea33pDffl8FCfeuBPDMp
+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]Tu
BlbD6@<--pA-sG%GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7
Cj@..FCf]=FEDk7HX(uI$6UI#Ea`HnATVu9AoDL%Dg-7FE+*WpDdso2Dfp)1AKYK$A7ZlsBkM*q
BkM+$Bl7Q+@rH7.ASuU(Df0VK$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$
F!+^]@8pf?IUd;,AKZ).@<<W+F!,=.Ebf5s+Dbb-AI9P&FD,B0/d_qj@V'1dDL6P<EaiI!Bl/8*
:-pQq4FVa.INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FOSl67tGcIXZ`p+:;@b
DIe*;ATD6gFD5T?$=%.[A:%m*F_t]1@<?(/$4:$ZF^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@
A8Gt%ATD4$AUSt6$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u
+AH9S+Eh=:F(oQ1F!,C5$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57F`&=?
DBMOo3%cm>+CT.u+C\o-Df0)<I0p<\D]j1DAKY6"AU&<=FF.b@A8Gt%ATD4$AUP\HDfm1>F`VXc
$4:$IAS5^pHY%);D.R`rFCfl)0eQ`=>\S:kD$hC.8T&Tk@;Ka&8l%i-$6UHrBQ@ZrHY@MCE&oX*
GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'+DGm>@3A/L+<Y*'
A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABF5k)>\J.hAp\35FDs8o06_Va/o#HGAor6*
Eb-k5Df%.BGA1i,01nN(I="RP9RSN#>\S:kD$hC.8T&Tk@;Ka&8l%iR:K::[74noi+C&T#AS-:&
FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR
:K::[7=>Lc+DGm>@;L"'+CQBb+CSekDf.0M8T&Tk@;Ka&BlkJABln#2>]aP%FEDVOE+*6n@;^KG
+A$Yt@rH7,@;0V#+EV:.+A,Et$6UI%Bk)7!Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS
:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?.-+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"(3Blmp'$6UH_DKBo.
Cht5&+CfP7Eb0-1+Eh=:F(oQ1+E(j7>\J.hAp\35FDu:^0/%9QDIdZq/oPcC07A1d@;]Uo@sos:
+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+AU&<=FF,bq3A*$=0mt0QDIal!AU/33A0;4%+EM[E
E,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h
@<?4%DD!&2BOqMn+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TC
+<VdL+<XouAS5^pHY%);D.R`rFCfk-#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$
DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]OkB4stQB4uC$DJ+A)#p:?qBlmp'+C&T#AS-:&FEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJ
F*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#ARloU+B*Q'FCBD:882^MCh[NqFD5W*I0p9'
+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.6
0JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bj5+<Xp#DIe**DKTf-Eaa'$
I0s4nFCf:r+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$AUP\8
F!+m68g%beDfp"O+A,Et$6UI.@;BFq+A*bt@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%
FEDVOC2[X!Blmp,@<?(/+CoCO$4:$IAS5^pHZit@@UX@mD1)b3AT;j,Eb-@@B4YslEa`c;C2[W1
$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT7<Ci^^HC2[X!Blmp,@<?'.$=%.[A:&K2
EaiI!Bl/8*>\S:kD$hC.:N0l_+EV:.+A,Et+Co1rFD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5
F`8IKDfm1H@;^00FDi:4De!p,ASuTB$4:$IAS5^pHZit@@UX@mD1)b0A0<rp-YdR1A7]p,C2[W*
F`_>6F!i)7+>Y-YA0<6I$=%.[A:&K2EaiI!Bl/8*>\S:kD$hC.9Q+?M+C'#"G]\%LHYRJ0Ch\!&
Eaa'$/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/+DGp?@ps6t@V#lh+Dbt)A7]9o
Ch[Zr+CT/5+A*bt@rc:&F=mn->[h8WBl89@ATD6gFD5T?$>aWhA0<77De*ZuFCfK$FCcg,>\.e`
HZit@@UX@mD1)arBlmp'$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,
@<?(/+D58'ATD4$ATJu2@<--oDg-(A@;]T_+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&
Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+GF)Y]#BkD'jA0>?,$6UHrFCf]=FEDkNATV[*A8Gt%
ATD4$AM/B<$=%%OB5)71G%G]'@<?4#I0t%,FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL+<VdL
:-pQUGA1r*Dg-70F(KH.De*ZuFCfK$FCcRB05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU12>\.e`
HZit@@UX@mD1)arBlmp'$6UHhF`&=,FCf]=FEDkBEc>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2
+EVNEA8bt#D.RU,/g+D@AU&<=FF.Y@E,961I0q)>B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7
AKZ28EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AI9P&BlbD0Bm+'*+EV:.+D5_5
F`8I@@;TR.$4:$IAS5^pHZit@@UX@mD1)b(Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49
A8Gt%ATD4$AM/(9GT[>uASu%*G%G]'@<?4#I0s4nFCf:r+<X[*AKY5O@8pf?IWTKN@rH4'Bl%?'
FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkBEc>i/F=qta7VQ[MEsa$4D..]4@V$[$Ec5H!
F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK$6UHrFCf]=FEDkG
F^])pFCf]F/g+;8F`JU7BQ%TpAKZ22Cht5'AKYMt@ru.$ARlomGp%3BAKYr4ATMF#@q?d$AdTY'
<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+E2@4@;TIiAKYT!Ch3qr
+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98E
>\.e`HY%);D.R`rFCfk-$<1\MEb-A%Eb-A7Df'&.>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2
+EVNE@:X+qF*'#A$=%%OB5)71ASuX-ATD4$AURc;/mSfhBlmp'$6UH[A8--.>]aP%FEDVO8l%iK
Blmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-BOr<(F_tT!EZf:4+DG_(AU"P)+Cf>+F_u#;
/g+,,AKYMpAmoguF<G:=+D,P7EZeh6F<G[=BlbD6@<iu9ATN!1F<G:8+Dbt6B-;)#D.Rc2Ecl8;
Bl7Pj+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h
3XQ4!@V'1dDL6P<EaiI!Bl/8*>[h8WBl897F_l/6@rH1)I=!f!>?l5\@ruF'DCU!<Bl7HmG]$r,
AURhk>\.e`HZit@@UX@mD1)arBlmp'$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5
Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Esa$4@rH7,Ec5c1ARlomGp$@6AU&<=FF.(e5u:6H
9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"ATDiE$6UHYBOPdkAKZ).BlbD?@;L't+DGF1
H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,od+<YWDARf:_A7]9o
GA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig",+C%3KATDllDej])
FCf]=FEDjn/hSb?I=3^T>\.e`HY%);D.R`rFCfk-D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16
EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/hn^_
$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0A
Et&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(
F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)
Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[Wm
F^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(
FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30ml
C2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`
F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl
;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%
Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<
@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]Tu
FCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<
+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[l
DKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$
+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%
DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S
@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h
@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3
+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;
C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J
+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDk
D..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6
-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP.40II;:7Sc]G78c90-YI".ATD3q05>E9
A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!
3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&
Bl7QU:IIKZA8c@,/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.
8T&WjDe+!#FD5Z29OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.
;f?f!@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8X
E+EQkDdtG#F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo(r%16!%9LV6G76N[S-RT?16q($A
;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,
ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+
Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;
@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9
A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'
B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"B
Dfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.
De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]
Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-/hn^_$:[fb6q(!:3[\QODImisCbKOAA92[3
EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#
$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A
%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("
@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7Bjkgl
H=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.
+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGB
DIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbds
ARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds
@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgL
FCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)
FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%
.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74
H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6
C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuC
A92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5
.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A
@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*
+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8
FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*
DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO
@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HW1H?s=EA8PahDI7Ks
GVV$#+AH9YDBMPI6m*n(H?s=EA8PahDD$$BGUXbO@<?(*+D,>(AM,)t:IH=HDfp)1AKY].%14C(
@rH4'Df]K#+E(j7@3BH1D.7's+E(j7@r,RpF(KDF+B3#gF!,(/Ch4%_,p6W;F(K2tCh7Z18l%ht
@r,RpF(KD8@;]TuAU&04F(o`7Ed8dE@<?($Bjkfe$7-g/DKKe>@3BW*DJ*cs+EMIDEarZ'@rGmh
+CoD#F_t]-F=n"0,n12-+Cf>,E+s-&DJ()6BPDN1Anc'm+ED%5F_Pl-F!,F4Ao(mtAU#aKG\(]"
FCf\+$7-,g,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e
,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,n12-+CT).
ATDZsFD5o0Cj?Hs,n12-+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg$7-f;+DkP&ASH$mAU#>DH?s=E
A8PahD@Hq!+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hp^
$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO>[_bsBQ%p<8oJB\+@Ih)6=FY@Ed\B(
>]a\%Ch7ruFCf]=FEDjSIXWMbATDj+Df-eKINot-:IKUR;f?f!@q?cMDe*F-%13OO,p6]9D/E^!
A9/l*DfQt/A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,DJ()#
+EDU@AISuOF(KH0ASu.&BR<uoDesQ5DKBB.I=!b]D1)j#>]XIuCh7KsFD-#+@rH1+D/OE+E,p);
AUSnZ/i@TiI16NgFE_Y5DesQ5D@Hp^$=%FVCLqU%FDPLt$=%[]@VfUoAn,asFCf?3Et&I]Df0,r
DesQ5D@Hp^$=%I[GApu'AISuOBl7m4FF/=[C2[X$DD$$BG^U#.%16?XATr*%B4VMZ>\S(pF`_tV
H>7A//p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X(FDl22/p(ZLI16Mm$=%I[GApu'AISuO
Bl7m4FF/=[C2[X"@;BF,FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe+!4Bl#DDAU&V4$4R>I
DIn$2@:s-\$=%:_E-68LH?s=EA9;a.Ci_4NAU&V4$4R=g>]++sE+*Bj%14CdDf0,rDesQ5D@Hq!
>\S(pF`_tZ,CX9GDfp#J,CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*D0'8uFD5Z2%16?K
A7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4$=%OjBl8$,DId='
%13OO>\.e`HXq&)F_t]-FF=T*                                                 ~>
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
F(KH&F_PZ&A8-(*+E_X6@<?'qDe*BmF*)G:@Wcd,Df-\AEa`p1Eaij'DJ(=G/1<V7,VUYu-p0UR
/mg=U-Qm/BA0>W*A8Gt%ATD4$AKY`+A92j2Eb-UI/1<V7,VUYu-p0UR/mg=U-Ql#W6pamF9LMEC
;cHOj=Wg=46r%ZBATM3qA0=K?6rZrX9N+8X8PDNC8Q/Sa;HY,<9LMKK6r%ZBATJtj:K(5"C2[X!
Blmp,@<?''<)5nX?V4*^?Ys<r<)5nX?YXLiCh\!&Eaa'$?Ys<r@WcC$A86$nBkh]3@WcC$A86$n
CghEsGT^I<Bl%<pDe*ZuFCfK$FCf8sFCf\>BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DPh*Ch\!&
Eaa'$Dg#i+G@,H'GT^j3DJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3
EarZ'H?smPDe*]nBl7:"AU#RO/1<V9+>PYs1,(I;0JtOD/i>LH1,:^A3B/-:0JY=92)%!B2)RBM
1bpmA2]sk01,(C>0K:[B3&!6K2`!3K+>PW*3AE9D1bLUE3B&]L1G^d/1,(FC0etI?/i5OJ2_m0F
1GU(.0JPRB1,1U<1cRKS1,C^B1*A>+0f^sD0f1L>3&roQ3AE9D+>PW*3AE9D1bLUE3B&]L2E<T:
1,(I;0JtOD/iGXC1,_*L3?U(21,(C>0KCaC2_Zs?1,UgD+>PW+0JG@<3A*0L2Dm0C0etO-1,(I;
0JtOE/i5=D1c7!F3Ar!80JY=92)-d;1c%$M3AN9F3?U(21,(C>0K:[B1H7-M1b^UA+>PW+0JG@<
3%d*G1b^gH2`!021,(I;0JtOE/i>UI2DmKL2)HF20JY=92)%!B2)I'H2Dd0I+>PW+0JG@<3%d'J
0JtXG1bgg01,(I;0JP=</iPUD2D[0E0d&5*1,(C:0f^jC0f_3L1c-mH+>PW+0JG@<3A*-C3&*?N
3&<H81,(I;0JtOD/iGL>2DI3I1,L+/0JY=92)%!B2D[$F2`3KR2BXb/1,(C>0K:[C1,CpN3&rrQ
+>PW+0JG:<3%d'F1,L^G1c7061,(I;0JbID/i>I@1bh!I2)ZR40JY=91GUpB2)I'F0f_'J2BXb/
1,(C<1,pmD1bpmC1c$s21,(I;0JbID/i>I@1bp1/0JY=92)%!B2E*?G2E3QS+>PW+0JG@<3A*0J
0JP7:2)7!21,(I;0JtOE/i>XI2)$a>1,C%.0JY=92)%$C2D[?J3AWTP1*A>+1,(C>0eb4:1H%6R
1,(OF+>PW+0JG@<3%d'E3&3KN0JGC-1,(I;0JtOD/iGOC0K(jK1GL"-0JY=92)%$C2Dm9M1c.!G
1E\G,1,(C>0KCaC2_[-K1cI9O+>PW+0JG@<3%d'J2`*6F2_[!01,(I;0JP=>/iYRF2E*NK3&)O2
0JY=90ek[@1bpg@1H%3K3?U(21,(C>0KCaB0fUsC1c7-N.4cl00I/>$/1<V9+>Y8u0JY=91,1L9
3&*-A3&E?E+>PW+0JG@<2_HsI0fM$O2)7$31,(FC0etIA/i>IB2`<EH3$9t11,(C;0ek:?0ek@A
1bg^-1,(I;0JtOE/i>RA2`NWQ1G^./0JPRB1,1[>2)I-K2DR$I.4cl00I/>$/1<V9+>Gf#1,(FC
0etI?/i5OJ2_mBJ1,0n,0JY=91,1I81H7BQ1,^pG1a"P-0f^sD0f1L>3&roR0JG7<+>PW+0JG7:
0J5.>2E!EK0f(a21,(I;0JtOD/iGXG0etUE3Ar!80JY=92)-d;1c[KQ2`<TT1E\G,1,(C>0eb4;
1GCL:3&ENJ+>PW+0JG4:1bLaC0JYUC2)6s11,(I;0JtOE/iGFC2`3QQ3$9t11,(C>0eb4;3&3?N
3A<<H+>PW+0JG:<3%d$D1,1I>1c@<91,(I;0JbID/i5@B2D[0K1,C%.0JY=92)%$C2E3BI3&W]U
2'=Y.0f^sD0f1L>3&roQ1GpmH+>PW*3AE9D1bLUE3B&]L2E<T:1,(FC0etI?/i5OJ2_m0H0fU:2
0JY=92)%$C2DHpD3B0#Q0d&5*1,(C<1,pmD1bpmC1c$s21,(I;0JY@:/i,LG1H.3I3&Vm70JY=9
1GUpB2)I'F1,UaC3?U(21,(C;0eb492_[!H2DHp@+>PW+0JG@<3%d*J2)-jD2E<Z<1,(I;0JtR=
/i5RJ2_[-M2`Mp80JY=92)-d;2)@*G3&<BI2]sk01,(C:1,LUC1,(IC1,UgC+>PW+0JG@<3A*3E
2`ETR2E2g70JY=92)-d;2)m?K3&rZM1E\G,1,(C<1,pmC1GU[=1c.*M+>PW+0JG:<3%d$D2E!?J
2_m031,(I;0JtR=/iGRG1H.'I2DH=00JY=91GUpB2)I'F0f_-K1*A>+1,(C<1,pmD1bpmB3B/`M
+>PW+0JG:<3%d'F1,L^G3&*641,(I;0JtOE/iGID3&!-D2)-O2-p014/1<V7.4cl00I\P$4>838
4>6                                                                       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
