NB. JOD dictionary dump: 26 May 2020 15:32:34
NB. Generated with JOD version; 1.0.2 - dev; 2; 16 May 2020 08:51:47
NB. J version: j901/j64avx2/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:17:19
NB.
NB. Names & DidNums on current path
NB. +----+--------------------------------------+
NB. |imex|83892292337944756305534645723005613893|
NB. +----+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


IFACEWORDSjodliterate=:<;._1 ' THISPANDOC grplit ifacesection ifc setjodliterate wordlit'

JLWORDLITTEX=:37 32 77 97 105 110 32 106 111 100 108 105 116 101 114 97 116 101 32 40 119 111 114 100 108 105 116 41 32 108 97 116 101 120 32 102 105 108 101 46 32 10 10 92 105 110 112 117 116 123 74 79 68 76 105 116 101 114 97 116 101 80 114 101 97 109 98 108 101 46 116 101 120 125 10 10 92 110 101 119 112 97 103 101 10 10 37 32 99 111 109 109 97 110 100 115 32 102 111 114 32 97 100 106 117 115 116 105 110 103 32 100 105 115 116 97 110 99 101 10 37 32 98 101 116 119 101 101 110 32 99 111 108 117 109 110 115 32 97 110 100 32 105 110 115 101 114 116 105 110 103 32 97 32 114 117 108 101 10 37 92 115 101 116 108 101 110 103 116 104 123 92 99 111 108 117 109 110 115 101 112 125 123 51 101 109 125 10 37 92 115 101 116 108 101 110 103 116 104 123 92 99 111 108 117 109 110 115 101 112 114 117 108 101 125 123 48 46 53 112 116 125 10 37 92 116 119 111 99 111 108 117 109 110 10 10 37 92 111 110 101 99 111 108 117 109 110 10 92 105 110 112 117 116 123 126 35 126 116 101 120 110 97 109 101 126 35 126 99 111 100 101 46 116 101 120 125 10 10 92 110 101 119 112 97 103 101 10 92 112 104 97 110 116 111 109 115 101 99 116 105 111 110 10 92 97 100 100 99 111 110 116 101 110 116 115 108 105 110 101 123 116 111 99 125 123 115 101 99 116 105 111 110 125 123 92 116 101 120 116 116 116 123 61 58 125 32 73 110 100 101 120 125 10 92 112 114 105 110 116 105 110 100 101 120 10 10 92 101 110 100 123 100 111 99 117 109 101 110 116 125 10{a.

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit sbtokens setjodliterate wordlit'

THISPANDOC=:'pandoc'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


formifacetex=:3 : 0

NB.*formifacetex v-- formats hyperlinked and highlighted interface words.
NB.
NB. monad:  cl =. formifacetex blclIwords

NB. require 'jod' !(*)=. get
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
NB. require 'jod' !(*)=. badrc_ajod_ grp jderr_ajod_
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
NB. require 'jod' !(*)=. badrc_ajod_ get grp jderr_ajod_ ok_ajod_
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

ifacewords=:3 : 0

NB.*ifacewords v-- return interface word list.
NB.
NB. Assume the interface is out of date fetch current  definition
NB. from  dictionary.  We  need  the  value   not   the   storage
NB. representation so define it in the JOD scratch object.
NB.
NB. monad:  blcl =. ifacewords clGroupname

NB. require 'jod' !(*)=. get
iname=. (IFACEWORDSPFX,y) -. ' '
(;SO__JODobj) get iname
iname=. iname,'__SO__JODobj'
words=. ". iname
words [ (4!:55) <iname
)

markdfrghead=:3 : 0

NB.*markdfrghead v-- markdown text from group header.
NB.
NB. monad:  cl =. markdfrghead clGroupname
NB.
NB.   mtxt=. markdfrghead 'jod'
NB.   (toHOST mtxt) write 'c:/temp/jodhdr.markdown'

NB. require 'jod' !(*)=. badrc_ajod_ get HEADEND_ajodmake_ GROUP_ajod_
if. badrc_ajod_ hdr=. GROUP_ajod_ get y do. hdr return. end.
if. 0=#hdr=. ;1{,>1{hdr       do. ''  return. end.
hdr=. hdr,LF,HEADEND_ajodmake_

NB. handle any non j code regions 
'idx chd'=. (BEGINNOTJ;ENDNOTJ) cutnestidx hdr

if. #idx do.
  psj=. idx -.~ i.#chd
  chd=. (markgnonj&.> idx{chd) idx} chd
  chd=. (markgassign&.> psj{chd) psj} chd
  hdr=. ;chd
else.
  hdr=. markgassign hdr
end.

if. #hdr do. markdj hdr else. '' end.
)

markdfrgpost=:3 : 0

NB.*markdfrgpost v-- markdown from group post processor.
NB.
NB. monad:  clMarkdown =. markdfrgpost clGroupname

NB. require 'jod' !(*)=. get MACRO_ajod_ 
'rc post'=.  2 {. MACRO_ajod_ get 'POST_',y -.' '
if. rc do. markdj markgassign ; {: , post else. '' end.
)

markdfrgroup=:3 : 0

NB.*markdfrgroup v-- markdown text from group.
NB.
NB. monad:  cl =. markdfrgrp clGroupname
NB.
NB.   mtxt=. markdfrgroup 'jod'
NB.   (toHOST mtxt) write 'c:/temp/jcode.markdown'

NB. require 'jod' !(*)=. badrc_ajod_ get gdeps grp
if. badrc_ajod_ gnl=. grp y   do. gnl return. end.
if. badrc_ajod_ gdp=. gdeps y do. gdp return. end.
if. #gnl=. (gnl -. gdp) -. a: do. markdfrwords gnl else. '' end.
)

wordlatex=:3 : 0

NB.*wordlatex v-- LaTeX from word list.
NB.
NB. monad:  clLatex =. wordlatex blclWords

NB. require 'jod' !(*) badcl_ajod_
if. badcl_ajod_ mtxt=. markdfrwords y do. mtxt return.
elseif. #mtxt do. 1 indexwraplatex <latexfrmarkd mtxt
elseif.do. ''
end.
)

wordlit=:3 : 0

NB.*wordlit v-- make latex from word list (y).
NB.
NB. monad:  (paRc ; blclTeXfiles) =. wordlit blclWords
NB.
NB.   wordlit 'jodliterate'  
NB.
NB. dyad:  (paRc ; blclTeXfiles) =. paOw wordlit blclWords
NB.
NB.   NB. do not overwrite root tex - allows for latex tweaking
NB.   0 wordlit 'jodliterate'

1 wordlit y 
:
NB. require 'jod' !(*)=. badrc_ajod_ badcl_ajod_ checknames_ajod_ 
try.

if. 3~:(4!:0) <'badrc_ajod_' do. 0;'!error: jod is not loaded' return. end.
if. 0=#JLDIRECTORY  do. 0;'!error: working directory is not set' return. end.

NB. only valid jod names 
if. badrc_ajod_ wlist=. checknames_ajod_ y do. wlist return. end.

NB. use first name on word list for tex file names
texname=. ;0{wlist=. }.wlist

NB. make latex
if. badcl_ajod_ wltx=. wordlatex wlist do. wltx return. end.
 
NB. root .tex file 
wdir=. JLDIRECTORY
jlroot=. wdir,texname,'.tex'
if. chroot=. x -: 1 do.
  root=. ('/~#~texname~#~/',texname) changestr JLWORDLITTEX
  (toJ root) writeas jlroot
end.

NB. group build batch script - latex utils that compile generated files
jlbuildtex=. ('/~#~group~#~/',texname) changestr JLBUILDTEX
(toJ jlbuildtex) writeas jlbuildbat=. wdir,texname,'.bat'

NB. source code .tex - return file names
NB. gltx=. iwords setifacetargs gltx
(toJ wltx) writeas jlcode=. wdir,texname,JLCODEFILE
ok_ajod_ (-.chroot) }. jlroot;jlcode;jlbuildbat

catchd.
  0;'!error: (wordlit) failure - last J error ->';13!:12 ''
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DH=/0H`+n0esk-2]sh1+>kkr0ea_,1E\Ru1,L+.0H`,/+>GVo1GL",1*AA0+>GVo1,L+6+>PVn
2]sk98k`;^;FF2M<)c:gD..-r+DPh*Ch\!&Eaa'$+=MGPEb'!#F=A>K@<?(*+D,>(AS,k$D/!Tj
@qBanG\1l7D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0B6%p5
E,8s)AU%j.Dfp"ACghEsGT_3EFD)e9@;]Uo@j#i<DKK<3+D>J%BP_BqBQRs+B4l7(Ch\!.@;BEs
CghEsGT^U:EZf"8Dfp"A.![7UAmo1\GAhM4F)ki6F`M@BBl8$(Eb8`iAKZ28Eb$;/BleB5@<--o
Ao_NtART+d@<--oDg-(AFCf]=+D,Y4D'3J3Dfp"ABOtU_ATDWrEbf2tEbB?0F*)8-Ebf3(GA\O8
Ec5e;B6%p5E$0+<F*&ODEc5H!F)u8?D..I#A7fjpEc6)>D..I#A8c[0+EV1>F<G19Df$V0Ec6)>
GAhM4CghEsGYDOFAQU'eEc5e;GAhM4+Dbb5FE_YDA8Gt%D..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5
F<DuW.0                                                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0esk++>Y,p2BXat3A<?f:K(5"C2[X!Blmp,@<?'90ht%f:et"h?YXLiCh\!&Eaa'$+E27?F<GOC
De!@"F)Q(A-nR&#4ZX#Z%17/nDfp/@F`\`t7R9C14ZX]60H`D!0I[G<:-pQU-u*[2Ch\!&Eaa'$
.3N>BFCfK)@:NjkGAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU<(KSZ:dIiE:I?6I+<VdL:-pQUAp%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+
DBO"6ASc0*E+*j%%15is/g+eIE,961+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HO
Gps10:-pQUBkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(
%15is/g+k?@ium:+<VdL+<VdL+<XEG/g+bEEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;+$;No?
+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,
ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQUGAhM4Ch[u6+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0
Ec5e;GAhM4+Dbb5F<DuW.1HV5%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%
ATD4$AL@oo%14L>+?CW!.3Kuc%16f]/g)Ys00gp5E+*WpDdt.A74p#3E+*X-ATBpd+?M9(+?V_<
?SWaGCh=e<F(f-$C`l\J8Q/GO:..lF/12Pl/Tt]GF(oQ1-Rg/i/g*MZ+CoCC%144#F)>i<FDuAE
+=Bo[<(/hj@:X+qF*&OD@;]Uo@j#`!FD)e2Afu8.EcYr5DBL>T/9#$8G%G\F-Rg0PF!,@=F<Eb1
+>PQ0/hnt5-OgDoCia/?%144#F)>i<FDuAE+=BTU;GU1O+E1b,A8bs#DJsV>F(KG9/KeJ4C3=T>
+B1m';c#bT6r-/t%144#F)>i<FDuAE+=C,Z8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+=AOU@;]Uo
@j`WH:-pQUGA(Q*+E1b,A8bs#Df-\:@<?01%16ZaA1e;u.1HU                         ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodliterate BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGIN'
zz=:zz,'NOTJ CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAK'
zz=:zz,'ETOKENS IFACEWORDSPFX IFACEWORDSjodliterate JLAUTHOR JLBUILDTEX JLC'
zz=:zz,'ODEFILE JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE JLOVIEW'
zz=:zz,'SUFFIX JLOVIEWTEX JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLiteratePr'
zz=:zz,'eamble LATEXTMP LF MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP ROOTWORDSj'
zz=:zz,'odliterate THISPANDOC WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAP'
zz=:zz,'PREFIXTEX afterstr alltrim beforestr betweenstrs boxopen changestr '
zz=:zz,'ctl cutnestidx dbquote dbquoteuq decomm fboxname ferase fexist firs'
zz=:zz,'tones formifacetex formtexindexes fsize fuserows gbodylatex gheadla'
zz=:zz,'tex gpostlatex grouplatex grplit ifacemarkd ifacesection ifacewords'
zz=:zz,' ifc indexgrouptex indexwraplatex jpathsep jtokenize latexfrmarkd m'
zz=:zz,'arkdfrghead markdfrgpost markdfrgroup markdfrwords markdj markgassi'
zz=:zz,'gn markgnonj read rtrim sbtokens setifacelinks setifacetargs setjod'
zz=:zz,'literate tlf toJ tslash2 utf8 wfl winpathsep wordlatex wordlit wrap'
zz=:zz,'vrblong writeas''                                                   '
zz=:1021{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0esk++>P&o0d&2*1H@I1De*ZuFCfK$FCe36/h1USA8Gt%ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&
Eaa'$+EMIDEarZ'@rGmh+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+D5_5F`;CS%15is/e&._
67sC(ATD6gFD5SQ+EM+*+EV:.+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!+n/A0>N!FD,f++D,>(ATJ:f
:-pQB$;No?+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%
ASl-5Ch\!&Eaa'$/S]370+A7`67sBoFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(U3$;No?+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)Q
Ch\!&Eaa'$/oY?5%15is/g+hLFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,
F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIO%^:-pQB$;No?+DG_8ATDBk
@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9984c`V5u'gD6QdKo+<W6Y
Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*E+*j%%15is/g)9LEc>i/
F<D\K+<VdL+<W6YD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g)9NAmo1\F(Jj'Bl@l3+<W6Y
Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g)9NAn)r++<VdL+<VdL+<W6YAoD^,
@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sB'F(KH.De*ZuFCfK$FCcRH+E2@4E+*cu+A?3C
AQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQU+EqaE
A8Gt%+<VdL+<VdL/Ken=CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![6N$;No?+<V+#:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*12gZE0JO"D:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0f!ZWF>,Kn.!R0`B6%s-BlkJ+EbBN3ASuT4@:Wn[A0>u4+EM[EE,oN2F!,LA
Dfd+DAU#>9G%G]<EbTW,Et&IO67sB812gZE0JjnbEc6)>+A#$g6Ub'P;FFGrEc6)>DIIBn+D?%>
ATDU$DJNfo%15is/g)l(De!lC2'?pNE,8rmARloF3ZrBMEcYr4B-;D4FD)dFG@kY?+>"^L@;]Ul
ATJu'@:UKq+Cf>#AISuA67sB812gZE0K:1`A7T7^+D#S6DfQt6@;]UlBl7Q+/Kf(FE,8rmARlo3
GB.D>ALSaGBln#2.!K]GFCem%.1HVZ67sB812gZE0ejeZA867.FCeu*9OUn3=<MR'ARTFbCh4_@
+Cf(nDJ*[$B-;&0DJs-*DKKq/$;No?+>GWi@rsF\+CSekARlo3F(060CLqC).3L2bF`V,+F_i14
DfQt/DII@,H>.80+Cf>#AKZ)+G]XB%:-pQU0f!ZWF>5]s@:Wn[A0<:EEa`p1Eaij'DJ(C@/KekJ
DJ()5Dfp)1AKYf'DIml3DJs_AGB.,2E+NPh$;No?+>GZ_ARdJU+CSekARlp*D]gHC@:O(o.3M,p
F@^O`+ED%4Df]W7DfU+4$;No?+>PWf@<jOc+CSeqF`VY9A0?)7Eb$;)DfT]'FD5Z2+=MGGCagK=
DfQsm+?;&.0b"Ib67sB90Pt6D0K:1tE+EC!ARloqDfQt1F`MM6DKI!LE+*WpDdt4=G%G]8Bl@m1
%13OO@rGjn@<6K4+=CT4De*ZuFCfK$FCcg/$=e!gDKBB0F<DrFC2[W1%13OO:-pQ_A7]^kDId<r
FE7lu:-pQUA7]7e@<,pi+D5M/@UX'qBOu3q+EVNE@<QR'A0>B#DJ"$4Bl7Q+9OUn3=<MKiD.Rc2
GA2/4+A*bo@;TRs%15is/g)Pl.6T^78k`2U<(o_[79C[)9M\\\79<GW=<L406<-TN6rZTW+A,<t
;G^%Y<)c:g+A,=/:JsSS8Q8YX=<L436qh<:ATD4$APdDY@;TIiAIStU$;No?+B!,jATAnaF_N4E
+EqaEA0>K&Ec#6,Bl@l3F*(i4AKYhu@q]RoAKWQIF(oK*Ch[<u+EVNE4$"KnF`\'":-pQUE+*d.
ATJu9AU&;>GA2/4+A>7G/0JtEFCAm$F!,[?Blmp-E+*6f+CT.u+D>2$A8Ggu+E)41DBNqADffQ3
/e&._67r]S:-pQUG%G]'@<?4#3Zr<YFCcS*BkCsgEb0,uAISuA67r]S:-pQU+<VeNAo&hF0-Fs]
+>P_q2(Tjt-VmQ-:*<D6:K0b1%15is/g)8Z+?MV3.k`#Z/g)o*+>k\m-RV\d78=t&<DQR_-OgCl
$;No?+D>J"AKZ&(EbTK7+Dbt+@;L!-+Xefh4Y@joAo&T2Ao&S!$>jBk4Y@j42)Z^6+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL:-pQU=<MO(BOu2n$>jBk4Y@j3+<W'm/7C/F/ghbh.3K`U+<VdL+<Z)L
Ao&S4:-pQU;]p9tBlmp-E+*6f+=M;M@:Njk@;]TuBQ%p*H>d\C@;I'.@:CYp$>jBk4Y@j4+<W'`
-t+`B/giqn-RgQ!BeD/!.3O%UAo&S4:-pQU5p/HF=s.6*H6?dD@r-9uBl7Q+:*;k4$>jBk4Y@j5
+<W(@/nlpc:+%J5+<VdL+<VdL+<Z)LAo&S4:-pQU:*=XlAKYf#FED)7+AN@QD.[TI/g)tn+=LYN
BeCc"-Rg/\+<VdL+<VdL+FS*=C`jiq67sBI+EV:.+DbV2FCfJ864F9=Ao'U_+>k8a-t+`B/gi>-
1,CaE2E*TU?RI9FI;NS4+<XEG/g*.sA8,[jFE8R5DIaks%16raCcsBn2BX+j@4l7H-S?bq+<VdL
+<VdL+<VeTD.[T,+AP6U+@I>)%16raCcsBn2]s4k@4l7H-TWV(+<VdL+<VdL+<VeTD.[T,+AP6U
+@@84%16raCcsBn3$9=l@4l7H-RU8h.3K`U+<VdL+<VeTD.[T,+AP6U+Aj8$F`2A5%16raCcsBn
3?TFm0f(7$+<VdL+<VdL+<VdL+<VeTD.[T,+AP6U+@B$9$>jBk4Y@j30H_bu0I\+e+<VdL+<VdL
+<VdL+<Z)LAo&S4:-pQU9L]Hu%17/gCcsBn?SYnl+u(3g/g;o0/mg@V-nlc)+>>5R$7?ru+<VdL
+B'C*+<Wrm+<Ve%+<VdL66IBn+?:Pe+<X&p+<Vdo+<VdL;'6u(+@B$L+<VdL9L^-I-XAD8$6V&G
0d%Sn1*A:o+>P&o+<WH_0d%So+>Fu]2BX^s+>Fun+<WB]0d%St+>Fu]0ea_)+<Vd]+>Fu]+AP6U
+>=o\Bl7X,Bjkfe$6V&G1*@\o1*A=p+>P&p+<WH_1*@\p+>P&^2BXat+>Fum+<WB]0H_Js+>P&^
0ea_*+<Vd]+>P&^+AP6U+>Fu]DffZ(EX`?u0d&4o+>GVo1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jm
+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB9+<Y*/E%c*OD%-gp0d&4o+>GVo1*@\p+>=o\
1*A7n+>b2p+<WE^0H_Jm+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB:+<XDg$6V&G1*@\o
1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>k8q+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>b2`
:-oBs+?:Pu+<Vde+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\0d&.m+>Fum+<WZe0H_Jm0H`+n+<WB]
1*@\^:-pQU2'=#:67r]S+>Fuq+<WBp+>=o\2BX[r+>t>r+<WQb0H_Jr+>=o\2BX[r+>Fum+<WTc
1a!nq0H`+n+<WB]1*@\^:-pQU2BX,[F_qQp+?(Ds+<Vdc+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\
2]sds+?(Ds+<WWd0H_Jm0H`+n+<WB]1*@\^:-pQU2]s4j%1444+>P&^0eje++<WE^1*@\q+>P&^
1*A=p+>t>t+<WB]1*@\o+>P&^2]sds+>GPm1*@\^0d&4o+<XEG/g*+r+=ANG$6V>O0H_J\3?U!u
+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\0ea_*+<Vd]+>P&^+AP6U+?:Pe@rH4$
ASuT!$6V&G1*@\o0d&4o+>P&p+<WK`1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>P&^0ea_*+<WBn
+>=o\+AP6U+>GPm6W+@#+>Fuo+<WBn+>P&^1*A=p+>b2r+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc
1*@\o0H`+n+<WB]1*@\^:-pQU0eje<;G9Oh$6V&G1*@\o1*A7n+>P&p+<WH_1*@\p+>P&^2BX[r
+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GVoF)YPtAISth0d&4o+>GYp0H_Jn+>P&^
1E\Fq+>P&p+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB81E^aX@:Njk@:jUm
EZf7BD%-h$%13OO:-pQUGAhM4+D,P4D..O#Df-\0DfQt:Bl7L'%17;kCcsg%-nm`(Ao'PGAo&n=
-6PB2%13OO8k_WE;FNrP:Jt=Y3Zodt%15is/h1FMA7T7jASu$iDKKq/$4R=O$;No?4?S(AIXWDd
+>.J=FCf\>I16Mm$;No?+D5_5F`8IFBln0&+CT.u+CTD7BQ%o6/Kf+V@;]UaEb$:tD..3kFD5i5
AISu=9N4S_9LVoL=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8EZee.A0>u.FDPLt$=%"^FD,T5H[[2g
@<H[*DfU:OIXMY4>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&.1HUn$;No?+D5_5
F`8IAG%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3De*ZuFCfK$FCcS5
G%G];Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:%14Nn$4R>;67sBs
@<?(*+D5_5F`8I4F_PZ&+EM%5BlJ/:%15^$6<-TN6rZTW4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$
AftnuFCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RBATJu&
Eb-A3DBO%7AKZ28EbfB,B-;/%FD)*jF(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>+FYPa
B6%p5E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&
@<?(*+<Z+XIV3\>F`;dSILQWqDIdR%@ps0_$7QDk%15is/g+eIDfp"AEc5l<+EV1>+>"^GDesQ5
DK?q;@<iu5AS#Bp@:X+qF*),6B+52?9LhuW9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$
FCcRCB6%s-BlkdHCghEsGT^U4Ch54A-tdR>Ch[u?+D58'ATD4$ATJt<B6%p5E$>_u,p7)6D.R6#
G%G]8Bl@m1+E(j7FD,B0+D,>(AKYT'EZeq%@qZuW:IH=<Ec6)>+DGp?E,ol,ATMp(F"Rn/%16?S
DK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%:_E-68LINs;SEc6)>INs;`Bln0&/p(ZL
I16NgD..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$4R>IDIn$2@:s-\$7-g)Df'?"DIdf2AoD]4
@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_
-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#
2/mYc%14CdFE_Y5DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIW'CDATobKAU&V4$4R>IDIn$2@:s-\
$7/qqDIm<rCisT4%16?SDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZt
FDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='
I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%14Nn$4R>;67sC)DfTA2Ch[u6Ec5l<+EV1>
%15^$=&2^^9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRCGAhM4Ch[u?+DbJ.AU#>0
Bl%?5+:SYe$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO>]++sE+*Bj%13OO,p6]9
D/E^!A9/l*DfQt/A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,
DJ()#+EDU@AIStm>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$7/quATVa"DJ+')HX('!CisT4
F(K<2F_kW;HS@'0E--L;$7/r!GAgu0CisT4%13OO-!YA+ARfXpF_u"*$=%:_E-68LINs;`AU&*$
D.S/@IUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.
AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#
D.RU,I16N4%13OO%15is/g,">Bl5&.De*ZuFCfK$FCcRg@8pf?+E2@4@;TIiAISu=:IIljFCfK$
FCe9hARTFbCh5aj+>=p!+>=63,p6r@A8Gt%ATD4$AKYetFCf\>E,oMuD.7<m/g(T1,p3X(,p60#
BlbD/Bl%?'BlbD*+D>J%BP_r:@s)j7Df'37ARlp,ATDj+Df-\9Afu2/AKYr4ARTFbCh4%_,p7&5
FCfK,@;I'!ASu("@<?'k+C]U=E+*WpDdt/9+>%XWDfBf4Df-\ABOu'(E,ol-F^o-'B-7Wj,p4g^
AU#>9F`_SFF=n\T@;]Uo@j#H!B4u*qB4uC$DJ()+F!,CEATDg*A7T7h+CT.u%14C(FD,5.F*(i.
A79Lh+DG_(AU#>3F!,L7A7]@eDIm?2+:SYe$=%+[@s)X"DKKB)@<6Ko0f!]i?$g"#FD56$AUP!p
%16?_F(K<!@r#LcAQrtZDIdfu@;od`HY6o.D.Rg0H$p,/>]k+!E+*6l@:s.UBOtU_Bl7R)?$g1+
Ci"'!B4ZK#$=%^pAT2'fCLLjeHYdP;A7]e!I16NgF`V,5@:O(]B4ZEuD0'cDD.5&)D0'Q&FD-(3
$=%^pAT2'fCLLjeHYI):ATVL./88^4F^]B'G^U#.%14C(E,ol?Bk1dr+C'#"G]\"L@WQ%"BlJ/'
$=%^pAT2'fCLLjeHY-u:CijnWAUP[1$4R=g+E_a:+Dkh&Ec6&FE+L/+AftN*@;0Od@VfTb$=$/7
7VQ[M7<iNfFE;eGBk)1%FEqh:/ou,[I=#4AF(K<!@r#LcAUA9.@rcL0H#R>CI=$AO$=%:WDKTe=
0O/=(G\(u.GT\_GAnbLaAo)TuFCf\>0jJ=)4YS!)+DGF1E+ER&AU"Xk+<Xp3F(K<!@r#LcAQs;!
AiO(CBl7m4FCf?"I16NgAScF!+=/.EAfto4@<?(*+E)9CG\(]"FCf\+$6UHrF`V,5@:O(]B4ZF%
Df0Z<E+NO-%144#>\RepATVL.%144#+<Xp3F(K<!@r#LcAUAZ<FEhnJ@4ZYGDJ<U!A7^/u$6UHr
An_\]+<Xp"AS,@nCij9-DKKK%@<?X4ATN2m@;p1"DJ)+SAU#eKAU&;J;e'6PAN`arFCSuXDg,c5
@psFiI16N++=/.NAT2Ho@q?cO<DlUm6QgSeFD)e>DJ<U!A7ZlpF`MCC@q]:k@:OCjEZbeu+<VsQ
BkAK5Dfm1?AS#BpFD,B0+Cf(nEa`I"ATAnF+EV:.+E2@4F(K6!AKYo'%144#,p7;CBlbD<Bl7R"
AKYJr@<,ddFCfJ8Bl5&8BOr<*Eb/Zr@VfTuAoD^"ATJu:F(HJ4Afu>0CghEsGUstRF^])pFCetl
$6UH;>]++s@rH4$@;]V&>\/%uDgct$<DlUm6[^("+:SZ#+=/.?@;[3/ATT&5FD,6++Dl%7Df]l+
@q?cpDf0Z<+DGF1FD,62-ZWc@@<Q'nCggdhAISth+=/.%+ECn4BOu3,Ch[Zr+B*3$EarZ'6Z6LH
+Ad)s+EM+*3XlE=+=/.DFEDI_0/$dNDeF,D@:X:cAM.J2D(g!VE+3X%B6%F"BR)6d0JP=90KCe-
Dfp)1AM%D1A7[?3Ec3RDFDYh'$6UH;>]XIuD/X<1AoDR/HU`$eAPI)\Dg`'%+<Vt8F(KH1Df0K*
Df0ZD;f?f!@q?cMDe*E%:i^K&%16?PBakCY$7-fmARo@aBl7K)CggdaCj0T(FD)e/DfQt:BleB;
4!8H`BOu4.Bldi:+EV:.+D#G5D.R`rFCcS6@:O(]B4W30Bl%T.@psM$AIStm+DkP-CLqO-+EVNE
AU&<.DIal!AU/33A0>u-AKYf#Aoo/4@<-!pDCuA*>]!nbART[sATW$*Ea1nP6=jeDDFADQF_t]-
FF,;C$6UHrEb0-"G@PQ.D..<mHX&gPBleB1I16N++<VeR>]XIuCh7KsFD-#+CggdaCj0T(FD-)L
1hCNPI16O3>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1@<?(/%13OO,p7;DB4uC'BleA=
@rH4$@;]TuAoD]4Ch[s4+EML1@qfgn%16?ZEc6,8A7]7hD/E^!A:%R'BkM+$Ch[s4I=!7L$6UHr
F(KH0ASu.&BR<uuFCf<1AT3'E0Q;,^>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\I=2P3%14C(@WcC$
A0>E$@s)X"DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.%14C(@rH1%EcVZs>]k+!E+*6l
@:s.u@rH1%Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#I=!_+3%QgA3%QgA3.25C,p6qF
@rH7,Ec5b:F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:Ci=?BHZEb.I=!Y#0f(@7/i#F<
0J54=I16N0+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'EFq"d`A7]@eDIm<rCi=?@A79Rg
@rH1%Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$+>"^ECht59H#R>9+EM+*+DNNR
D/9Xg>\%DXBl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%16?NAS,XoARfXp
DfU26@<6!t@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdMD7Ddd`tDes?4
I=$!I@XWSW/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@
@q]:k@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdMkLEbTE(@rH1%Ed`:T
B4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%FCT6*DfU8QEbAj0HS@'02CpO7
1Gp^;/hf#.%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3@ruF'DK?6o-!XtlAnc-o@rH1%
EdM_HBOu3oDes?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_A7]@eDIm<rCi=?@DffZ(Eas$(
DfU8Q;Fa'%HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM52ATDm&
Des?4I=$!I@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&18g&:gEaj)4@;]TuDJsZ8+DtV)
ATJ:f>\%DXBl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n10JG%3/heu-+<VdL+:SYe$=%^p
AT2'fCLLjeHY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSgD..<m@q]:kF$3c5>^K_(?$fh(
I16Ng6tKtEDIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$DJ+BE<b6;\@<?4#I=#IBD/E^!
A7K:]EcXBK>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-+D,P4+Dl%;AKYJr@<,ddFCfK6
+E1n4+Dbb0AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)Des?4Bl7Q+@rH4$@;]Us+>"^R
@;TRs%14C(@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8A7]@eDJ=3,Df0V=D..]4%14C(
@V$['ATT&:D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$@;]Tb$=%^pAT2'fCLLjeHY.;,
D.R7+%16?XATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%Df'?"DIe*!94`BmDfTAfDejc*
0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl%14C(GAhM;F!+q'FED)7+EqOA
BHU5lF`Lu'+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4<,ZQ#>;9E1>]aP%FCT6*DfU2?
AU/K0Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=oDejc*0jT-2FCf]=@rH1%EdM>*
FCAZtCi=?BH[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=gI9SF3HX(Z(G][G6Ci=?@A7]7o
@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA?$goC0n"Hm%16?XATqX&D/E^!
A:%QJ@<6!T<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!
7Vm!OFB!0oI9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XN15
E`?smI9SF3HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3>]++s@rH4$@;]V&
>Z5`bBl7Q_Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!
6Z6gYASuThDejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q>]aP%FD5iDHQt7nI=6MQ$=%I[
G@PQ.D..<mHX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3oDes?4I=$;c0n"Iu+:SZ_DIn$%
Df'?"DIe*!6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*DfU8Q>]aP%FCJj/HQt7nI=6MQ
$7/qpATqX&D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%EdMD@DI[0pCi=?BH[?tlI=6MQ
$=%I[G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'H[B5):%9jr'X
ATCagCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*0jT-2FCf]=@V0t6,;FUpI16Ng
DIn$%Df'?"DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et+E):7ASuU$A0><'G\Lu.@<-W9
@rH4$@;]Us+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4YslEaa'$A0>\sFCf\+$=%I[G@bZ8
Bl\-0D.RU,HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8DJ`s&FF-VU6r7fCFAR!r@qB_&
DfU8QI=$AO$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.mFEq\6HY-](@sNJ3$4R>IBkDU$
FCf\+$6UHrF`V,5@:O(]B4Y:gATVm"B4Z-uH=]6O@;L!r/0H5]E+*Bj+EM7CAKYMpAnc-oA0>?,
+F%I>AU"Xk+<VdL+<VdL+<VdL+<YfEBk)'lANaX6Cia/=+<VdL+=/.QDJ<U!A7ZlmEb/ZpF!,[?
ASrW5F(Jl)GA2/4+F%I>AU"Xk+<VdL+<VdL+<VdL+<Yo?FCf]&HY@\DATDg&Apk*q>\._mAISth
+C'&1AT2'fCLLje>BOgt@rGmh4`k^eAR0XrH#R>8Eb/j2%16?PBakCY$=%7iE+O'2ATW'6HX_#,
@;B[nDJO;VFE2M8/.Dq/+<VdL+<VdL+<Ve9Df9E.@<-.)4`k^eALn8t+<VdL+<VdL+<VdLE+EQh
F`_;8E]nbt/.Dq/+<VdL+<VdL+<VeGA7fptFDPMOH[RFS$6UH6+<VdL+<VdL+Cf>+DfTZ.DJO;V
FE2M8/.Dq/+<VdL+<VdL+<VeLEbo6(Ci=>W@Vg0u/.Dq/+<VdL+<VdL+<VeCBl7]rDes?44`+V?
ASuTu/.Dq/+<VdL+<VdL+<VeGA7f:hEb&a%4aSk*0H`&tI16NgF(KH0ASu.&BR=!'@<-("A7]Y#
I=!YeFF=T*>]XIuCh7KsFD-#+E+*d.CM@a9HT#hb+E2.>F!*5WF<GF7DKU"C0lV5_%16?]ATVa"
DJ+')HX(-!ATDEpDI[s5FE1r7@q^:;1M(EO+<VsQE,oN5ASuT4Dg#]4Ap%p++Dbb0ATJ:f>]XIu
@rHL-FCfK>F(Jj!F_tZ#E-,cAHSBjW$4R=g+ED%7ATT&2@<?(*+DG_(AU#>>D]j1DAKYT'F`JU7
DesQ5DK?pP+Co%q@<HC.+DGm>FE_X4$7-g=BPCsi+ED%7F_l/@+DG^9Ci=E:+E(j7G@>Q7ARlp&
@:s-oF)YPtAKY])+DbJ(A926hE+KIc,p5rY<(/hj@:X+qF*&O=Aftf*A7^!.DIIBnF!,LGDBO%>
B4Z0uATAn&$7-g,Ec5eU+D>k=E&oX*GB\6`CghEsGV*EDD/FE5BlnVQDfTJDG%kN3FDl,4@kM_6
E'Iqt1a[<-0fLmG%16?_F(K<!@r#LcAUA9:CijB$Desh2$=%FVCLpprCh7^1ATA4e>]OCnATq^'
G%ku8DJ`s&FF/+CASH$mAU&V4$6UI<>\Re8FE_Y5DesQ5D@Hpq+<VdL+C%0PATMs3DIm<rCh@*l
F(Gdf+<Ve3AScF!%144#+<VdL>X3=@F*)><ARfXpFE2M8%144#+C&Mm%144#+C&u!FDPN+B67g6
>[q\gF_u#;AT2[4Ch8$A0Q;,^%144#+C&u!FDPN+B67g6>[q\gF_u#;AT3'E1Gs,nI16N++<Xou
AS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%,`+<Xp+@<--mDffZ>>YSXB
AQ<\gATD9hF(JTjDId='DIIBnI3f=0+<VdL+<VdL+<VdLHX'9RCLpLbE+O'"@<6!bBl7HmG]$r,
AUPj6$6UH6>]aXnF)YQ#ATMs=Ch7s4Cgh$qI16N++<Xp1ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\
I16N++<Xp1ATVa"DJ+')HX(MuEcZ#1E.*'eE-*4ACiseA0J5/#FF=T*+<Ve3Eb0&qGRY!&+<Xp*
ATV0kFCf;o5\XbRBlmp'I3f=0+<Z#9ASu%*D09Z:Bk)'tF+%;-AjCBJF*)><ARfXp>]4Lk@rH1+
D/NTiCia/m@r,^bEc>H"AR&h]I16NgD..3k@<?F0BOu2n$4R>ID..3kBl7HmGRXuh$=%%OB5)71
A8bt#D.RU,I16Mm$7QDk:-pQs5(7s0IK                                          ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkuM5sn(B:JsSZC2[X!Blmp,@<?''8k`;^;FF2M<)c:g+Au!2<*)jn6rRi=
A8Gt%ATD4$AKXrC8Q/GO:..lF+D,P4D/!Tj@qBanGT^X>Dfp#8@<?(*+D5_6Ch[u6BkCd`ATr'5
A9/l1@<--oAo_NtART*lD..I#A7fjpE,Tf>+DkP-CLh$tB6%p5E$0@CEb&upFCf\>GAhM4Ch[u=
.4cl00I/>$/1<V34==l^A8Gt%ATD4$ALAoX-p01/0I\P$4=iTB:et"h?YXLiCh\!&Eaa'$-RgSp
4>J$61F+_01,(C>1,^aA1GUjB1,^gB+>PW+0JG@>2D-g@3&*<K1,h081,(I;0JtUD/i5=D3&*BK
2E;m80JY=92)7'B1H@<I0f_6O1a"P-1,(C>1,^a@3ANEL2Dm0F+>PW+0JG@>2D-dG0f_3M2E*K9
1,(I;0JtUD/i,LB2)?sE2`2^50JY=92)7'B1H@0E2)$sK2]sk01,(C>1,^a@3&EWM0ebLB+>PW+
0JG@>2D-dF2*!WN1,q*51,(I;0JtUD/i,II3&<QQ2DcO30JY=92)7'B1bq!I1cI<N1E\G,1,(C>
1,^aA1,^mH2E<TO+>PW+0JG@>2D-gB1,^gA2D?p01,(I;0JtUD/i5LD0fV*L3&;[40JY=92)7'B
1c$jH1cIES3$9t11,(C>1,^a@3AiNG3B8rR+>PW+0JG@>2D-dG1,LmI2)$j01,(I;0JtUD/i,LB
3B/iR2`2^50JY=92)7'B1H@0I1GLaG2'=Y.1,(C>1,^a@3AE6G0K1sM+>PW+0JG@>2D-dG0K(pK
1Gh'61,(I;0JtUD/i,LA1,^pH2E;m80JY=92)7'B1H7BS1H@?O1a"P-1,(C>1,^aA2Dm9E3&NNK
+>PW+0JG@>2D-gE2`N`N3A`TB/1<V7,VUYu-p07=1,(C>1,^a@3&3HJ3&ifT.kiS01cRHM3&NZR
3AWNQ3B&WG3@\_q1*A;#/1<V7,VUYu-p07=1,(C>1,^a@3&3BL1GC[C.kiS02)6jC0fM!E1,UsF
3A<9G2C`Dn1*A;#/1<V7.4cl00I\P$4>838-p014/3GT                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
