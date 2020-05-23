NB. JOD dictionary dump: 23 May 2020 13:19:33
NB. Generated with JOD version; 1.0.2 - dev; 1; 15 May 2020 16:44:54
NB. J version: j901/j64avx/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:15:50
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|271689481030790805811266787428045802682|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DEFAULTPANDOC=:'"C:\Program Files\Pandoc\pandoc"'

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC grplit ifacesection ifc setjodliterate'

JLINSERTIFACEMD=:'`{~{insert_interface_md_}~}`'

JLOVIEWTEX=:37 32 116 104 105 115 32 106 111 100 108 105 116 101 114 97 116 101 32 111 118 101 114 118 105 101 119 10 92 115 101 99 116 105 111 110 123 92 116 101 120 116 116 116 123 126 35 126 103 114 111 117 112 126 35 126 125 32 79 118 101 114 118 105 101 119 125 10 10{a.

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit sbtokens setjodliterate'

THISPANDOC=:'"C:\Program Files\Pandoc\pandoc"'

WRAPLEAD=:'>..>'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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

wordlatex=:3 : 0

NB.*wordlatex v-- LaTeX from word list.
NB.
NB. monad:  clLatex =. wordlatex blclWords
NB. dyad:  ?? wordlatex ??

if. #mtxt=. markdfrwords y do. latexfrmarkd mtxt else. '' end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`W!81E\Fq0f'q.0d&5++>Z##0f:(41*A;*+>P_q1,'h,1a"M,+>c&#3$9q9+>GPm1c$74+>Pbr
0ea_,0H`.o1-$I31a"V7+>G\q2DITg7R:$J<)>kU6r-0\AS,@nCige=@;]Uo@j#K'F*(i,C`mP4
@psInDf/-95sn(B:JsSZC2[X!Blmp,@<?'pDKKH1Amo1\+EqaEA9/l*DfQsKC2[X!Blmp,@<?'0
+D5_5F`9rH8PW2Q;H-4W5sn(86u?@QCLh@-DBO%4G]Y'LFE2)5B-;;0@<<W/@<-.)+EqL1Eb-A+
ASu("@<?'k+D5_5F`8I;DKKH1Amo1\+DG_7ATDm(A4fNk<_5_]<(0o-G%G];Bk;K2CghEsGT^U=
@:sFgDKJcP:K1Ck;FFGuDe*ZuFCfK$FCfK2Dfd+GDfTB0+D,P4+=LuCA8Gt%ATD4$ALSa7Ec6)>
<(KSZ:dIiE:IA`:Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?F(f-$C`m\*FD+`R
5u:6D5t#p;@;p0sA0>]&DIjr0Eb/isG\;&8F`;/*FCf]0Ec6)>+DbJ.AU#>ABln#2E+*WpDdso2
H#@_4GT^[6B4u*qB4uC$DJ*U&E,961D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaBkCd`ASkjrCLh'h
DImisFCcS=DfTA2Bl8$(Eb8`iAKYhuEbf3(GA\OEARfgrDf09$@qKY"D..N/Bl8$(Eb8`iAKYK$
D/Ej%F<G[:G][Y;A7^"0Ea`p'@<?(*Bl8!'Ec`F<DId='+Cf>,D..<mF!+n/A0>PoDIdQp+EMLE
EbTH7F!+q.@;]k%F(KH.De*ZuFCfK$FCfE3AT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CD
F<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfT                                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=3+>P&q2'=V/2_Z@12BX_/0fU:23$:"21c8c`ART[l?YXLiCh\!&Eaa'$?Z]k#FC])qFD5Z2
@<-'nF&#%S.V!L1@<?'fC2[X!Blmp,@<?'fFCfN8A8,OqBl@ltEbT*++ET1e+CfG'@<?(%+D#D/
FEo!DDe*ZuFCfK$FCcS:ATMr9A8,OqBl@ltEbT*+/e&._67r]S:-pQUEcl7B-tHn1FE2;F?YXLi
Ch\!&Eaa'$?Z]k#FC])qFD5Z2@<-'nF"&5@AS,k$AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+>PW+0Pt6D1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo
%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N
;cG+R$4R>;67sC&ATMs)EZfLHBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aCghC++EVI>
Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDm
DeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?U6!GWe)1-Zip@FD>`)Ch[u=%13OO:-pQU
:2b5c3ZrNXAKZFo:IJ/N;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh8l%iS
78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9DfcEq
:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;%14g4
>9IckCLq$jEaN6iDe*2t4A&C;<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4+Dbb0Fa,QV
@:K`R8l%iS78m/`:JXqQ3ZrNcCghBu11+I)De*2t8l%iS78m/`:JXq!$4R>;67sBjEb/[$AKYQ$
E--@JFCfN8+Co1rFD5Z2@<-'nF!*%WF(KH8Bl7Q+6r-0M9gqfV6qKaF%15is/g,7S+>=pWEb0<'
Ecu#8+EV:.+EV=7AKZ&9@;Ts+@WGmpA1e;uA8XOkFDti:/13,*-OgDoEZf72G@Vh,DECHd6rZTR
<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+
De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R=O$;No?+>%q>78m/.
;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDFE1f2BK8(5?O[?QATMs6Dg>])De*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?\67s`uATMs6
Dg>])De*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?.F=f'eA7]h(Ec65E+DPh*Ch\!&Eaa'$+EV19
F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+SDF*2>2F#kElC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5
BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+0Pt6D
1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%13OO@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+
A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+EV19F<G^JBl%i5Ci<`m
+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFDti:4ZX]5FCfN8C2[X!Blk^3$4R>;67sC'DK9<$
BleB-EZee.Gp%3?F*)/8A0>Ds@ruF'DIIR"ATJ:f5'nn)6qKaF;a!/a1a$^I+=ANG$8EZ-+@Jdg
<)Yq@+>G!XBk(p$6qKaF;[j'g+Bot0BQ&*6@<6K46qKaF;a!/a.!mQj0d&kU6W?u5+<u=X.kWJ!
0d%kq3co=QGUXb(/g*?)/g<"m6qKaF;[j'g+BosE+ED%+A0sJ_6qKaF;[j'C$;No?+Co&)FE2;F
+CT)&+CfP7Eb0-1+DPh*FCfN8+Co1rFD5Z2@<-'nEt&IO67sBUDffPO+EV:.+F\'DA9;C(F<GUB
Dfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$B6A6++:SZM:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(
<(0_b-OgCl$;No?+B;0(+EqO;A8c[5+Dtb4GAhM;+EDC=F:ARP67sBQ:IJ/N;cHXj:K0J<+=CE!
D.R3eDIIT?0O/aAATDisC1Ld^CLqNkC2[X)ATMrJ-OgCl$8EZ-+ED=>Df9_?8l%iS78m/`:JXq!
$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>aWhA7'(iA8Gt%ATD4$ARAAQDeip+ATMrI0MXqe
.Vs$3A7'(iA8Gt%ATD4$ARAAQDeip+ATMrI0H_K[/M/)]Ddd0!@3BW.@;Ka&@rH1"ARfgrDf-\9
Afu2,F*&OKDfTB0+DG_8D]gHMATMs.De*ZuF>,Bt/e&._67r]S:-pQU<+oue+EV19F<GX7EbTK7
+Dbt)A9/l%+EMC.Cht5/De*ZuFCfK$FCcS:ATMr9A8,OqBl@ltEd8*$:-pQUGA2/4+EqaEA9/l8
BOQ!*GA1l0+EV19F<Ga8EbTH7F!,:5DIjr7Ea`p./e&._67r]S:-pQU@<6L4D.RcL%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I;D..]F1(=Rc67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$4R>;67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGjn@<6K4FDYu5De!-?5s]R/
DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFC])qF?MZ--Zip@FD>`)Ch[uF0II;:%159QHZ*F;FC])qF<Fd11E^UH+=ANG$4R>;
67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IC:JXYM<)64B4ZX]>%15Et:J=&R:JEQ,3Zp-d$:7Na
9MA#V<'<8b5;"'50JF_,%15Et:J=_R6;0g23ZpX>+>k8r1E[qc1(=R"$;!ul5u^WS0KhH>0b"I]
:/k1Y6;0g23ZpX>+>k8t,V^u,%13OO7SHTD<(ok^<'<8b2`E?L3?TUj5;"'70JF_,1CX[#$:@?M
;G9Y\<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h)$4R>@=\Vj]69R@P
1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0%13OO6;L]^<)lCW4ZX]6
4@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;67sC)DfTB0+D,P4+Eqj7E,]N/B-;;-
F*)I4$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4K]g><3lT><3lT>p([@-n$f(
HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'5U\0K-o!%s/0Zet5U\3:5U\*703g+R0gI-M
-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f.3MhU+FPjd0d'[]+?Lc%+=K6s@4iuU/3kC?
-8%J2+Bo9^@ruNM3diVG-nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU3
0edr_/h&+q/0Zet5[>ff%13OO:-pQU@rc-hFCcS'+D>n1AKYr1Bl8$/ATMo8FCAZnFE7luCi=3(
FCAZnF>,j=+=L`ACg^apCg_I-Blmp.A27P:EbTW,FC[-L5V=0(.3N4T%16oiDJ+'"@qg$>4ZX]6
GB.D>ATVH<@!?X*FCfQ)114U6C`ktq+=/HZAhFN"%15is/g*"p3]/$iDes5uE-#T3+EM[8BHV><
DK?qBD`T"WDf02sCgh3sF$2Q?2`;p/+=@U*Ci=3(@VfIjCNDX"-QjNS+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+=@U*Ci=3(@VfIj
CNDX"+Dbt6B4>[cDJO;ECi=3(@VfIjCNBpl%16oiDJ*BoE+iZC3[]#_Ble!0@;Kk"B6/08Bl7R%
AmoLpBOPt+Bln$,F`_)/@;]k%F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDD
F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDD
F)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF)uDDF!hD(Ci=3(
@;Kmr@6HXoCi=3(@;Kmr@4Z55DJ*BoE+iZ2Ci=3(@;Kmr@1<PQ$>aWuB4P^hBlnDZ3[ZU91,CaE
2E*TU0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG17
0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG17
0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG17
0JG170II;:Ci=3(A8,[jFE9T++Dbt6B4P^hBlnDICi=3(A8,[jFE7lu%16oiDJ*iqD.RcO3ZoeY
Cht5<DfTV9@;]TuDJpY:CghT3D..3kF!,4+CLnVs+CoV2C`m2*Gp"ID$>aWuB5V-pATL!q+=oJp
,9SNu+Dbt6B5V-pATJt'$4R>YDf03(BleAZ3ZpLF+?(Df+=oQ$8K_P^+EqL-F<F-tA8`T"ARf.k
F(HIc+CT+0GA(E,+A!\aD'3P)+A!]"@<3Q/Dfd+GBOQ!*8K_GY+A!]"Dfol,+Du+>+CoC5GA(E,
+A!\dD]gD:$4R>YDf03%DKKq_3ZpXA0JG1*0eb:80JG0i$4R>YDf03"Ci<a(F$2Q,5;=iG0I&7\
$4R=O$;No?+EMXCEb-A0De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgDsAhG2NDJWZG
5s]R/DeioE3B:FhBeD4bA8a(0$6UHT0RG055s]R/DeioE3B8H0E-67FDJWZG5s]R/DeioE3B:Fh
BeD4O$>"$pASGa/+<tc?+DEGb+CoCC%144#4tq>&F`\aDC`mFE1^se'Cia0%AhG3:D_;J++<W?\
+:SZhDIb@/$7QDk%15is/g+RFFCfN8%159QHSHX^F`\`RF)>i2AM@(pF*')`4!ua*4WlI%:-pQU
FCfN8+EM%5BlJ/A%13OO:-pQU@3B/nG9CO=Dfp#?%159QHY7A<+=CW:DesK3Deio<-T`G43[[6i
:J=&R:JEMc6;LBN5u^WS0d&eY:J=_R6;0fq%159QHY7A<+=Cl@FE;;;CLo1I4!6UG-V7'45u^WS
0H`q^<)c.M9LU<<$9g.jB6%r6-Z!^=B6/0;AnEDP+?MV3Ci=3(FCAZnF>+hRDf030@:O"n0d(:N
DJ*BoE+iZ&Ci=3(A8,[jFE8R@Df03*@;TRs+Dbt6B5D:'F<GC<DJ*[$FE8R@Df03"Ci<a(F!hD(
%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o@:O=r0IJq;0fpas/g)o*-OgDH0RGW!
E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1Bl7Q+@Wcc8De!:"E-WRIE+*6f/g*_.
@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)FCfN8+Co1rFD5Z2@<-W9DfB9*%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&%13                     ~>
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
1bg+0+>Y,p2BXat3&WN70f'q-+>Gi43?U(3+>P&o1Gh'60f1".+?;>>:et"h?YXLiCh\!&Eaa'$
1,2Nj/l5>B<*sBYA8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?+=Jfo.6T^$$4R>`D/XQ=E-67F8Oc!5
76N[S-nlc)+>>5R$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT6r-/m+<VdL+AP6U+D,b4C`m\*
DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sBnEc>i/F<D\K+<VdL
+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$;No?+DGFr@qB^m@ruF'DBL&E+AP6U+DG_8
ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B+52C67sBpAn)r++<VdL+<VdL+<Ve%67sBmDfT]'
F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=%15is/g,4HFD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'uAKXZT
<+T/SE,ol,ATMp,DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfTb$7QDk%16T`
@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO-o2u,+>>5e-RT?1BkAt?
.kWJ?-mrtBDIdZq-RM87.3NS<DK]T34Y@j=0RFp)4"akq+EVF3+=M;EASc0*<(KSZ:dIiE:I?Z\
+>#0gATDj+Df-pO+>#2g6W,%;D_;J++<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,A8bs#E+*j%
+DGF1G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^_$>"$pAM+E!+<Y`BDfp/@
F`\`R78d#Z;E>q>@;]Uo@j#Z-F<GX9F<E.X@:X+qF*&O(84c`V5u'gD6RN<M+<Y`BDfp/@F`\`R
<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f4ZX]5-ZEL3A8bs*-Ql/N/g,:XAKZ21ASrW0Ec5o.EZf=0
DIdZq+E)-?E+*j%-OgDoDIb@/$7QDk@WcC$A86$nCghEsGVV!K67s`sF_PZ&C2[X!@<?(*+EK+d
+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T/a%15is/e&._67sBM
Bl%@%+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+CoD#F_t]-F<G+.Eb/a&DfU+U
%15is/e&._67sBhF)uJ@ATKmT@s)g4ASuT4G%G]8Bl@m1+E(j7E+*WpDdsn<E+*WpDdsnF/ibO=
/hnJeEZf1,FCfJA%15is/g)8Z+<VdL+<Ve:BOt[h+Du+?DBL?,84c`V5u'gD6R`HO:-pQB$;No?
+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'D..]D1*CUKG%l#/A0<:HH?s=EA8PahDI7Ks
GUX(/:-pQU1,*QRGqh&s.!g2cC2[X"@;0U3@UX@-+CSekARl5W:-pQU1,*QRGqh)t-no.IARTIu
AU#b8@<<q@@:Wn[A.8l@67sB90Pt6D0fU:dBle60@<iu)F_PZ&+C\c$+D,P4D..O.ARlp*D]j(C
D@Hp^$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4FDYu5
De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(A8G[r
AU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%172oE,9H&
+D58-+?MV3Eb/Zi+Eqj?FCcS)BOPdkATMs6+A,Et<_Yt0%13OO:-pQU@s)g4ASuT4E-67FA8,Oq
Bl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?3Zrc1HS.]_5u^B^
?W0p2?V4*^DdmGj$?Kd#C2[X!Blmp,@<?''A8bre$4R>_Df9`>AU$@!+=DJ]H>7A/D..-r-OgCl
$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/EcZ=FDf-\<AThX*F(HJ)Bl[cpFDl2F+D,>(AKYl!D.Oi2
DfTr@%14J'@j#l)GUGX8+AG-h;GUY.C2[Wi+D58-+EDC=FED)=/14eHAU#R3$?Tj(4ZX]IHTE^"
AU"XkFCf\[3Zogu0-bpp,BdX=F(oQ1,CY(d0./;40RHDf6rm#M.3N,6@;]^hF*)FFFCf\+$7L"7
8g&4eGUXbZEbTW,+CoD#/95ZIFED)=/13&lAU#R3$4R>;67sBQ:IH=8CghC+ATJ:fC1D'C3ZpLF
-YdR1Df-\4De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJB%16onGWe)1
B6%p5E,8s)AU#OS4s4TMC^g^\$;No?+E_a:+=DJ]-QmAKAS,Y$+EVNE@<QR'A0>Au@<6*nF!,[@
FD)dEC2[W1+>,9"A8bt#D.RU,+D,>(ATJ:fFCf]/Bl%@%4ZX]64CiA?.3L/g/j:C+4=>H$-Rg/h
-8%J)C1D'&/1)u5+?V#(FCf\E+:SZoFEepPEbTW,-8%J)FCf]/Bl%@%%13OO:-pQUB6%p5E$/V4
Bl%<&@UX@gBHVA+EbTK7+>"^P@<?(*+E_d?Ci^_@BOQ!*@rH4'Bl%?'B4YslEaa'$A0>JuCh7Ys
$>OBdF_PZ&FCf\[/g)Pi07G-pB6%p5E.0$\0./;kDf9`>AU#XH@q]:gB4Z.+EZdtJ6<-TN6rZTW
%14M*Db*Z&<$5pl@WcC$A9;C-.3NhTBlmo/C2@@%Bl%<h@<=Xb+CoD#/95ZIFED)=/13&Z@<<k+
$?L'&F`_SFF<DrPBOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL-RU8h+AP6U+AbHq+Cf>,
E+s-"+C\c$%13OO:-pQUBOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>
D/^V0Bl%@%%14J'@j#Z4F=044+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+$7L"785E/`
+?Op2/8fWQ.3NhTBlmo/A8bs/-ST%HARTIuAU#h:@<<k+$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!c
Eaa$#+?Xa_E,9H&?U6tDC2[X!@<?(*3B9*,@WcC$A86$nCh\!&Eaa'$CghEsGVV!K67s`sF_PZ&
C2[X!Blmp,@<?'s@<?(*+EK+d+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARlouDe*ZuFCfK$
FCcS9Dfp)1AKXZT<+T/a%15is/e&._67sBMBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,Oq
Bl@ltEd9$R+CoD#F_t]-F<G+.Eb/a&DfU+U%15is/e&._67sBhF)uJ@ATKmT@s)g4ASuT4G%G]8
Bl@m1+E(j7E+*WpDdsn<E+*WpDdsnF/ibO=/hnJeEZf1,FCfJA%15is/g)8Z+<VdL+<Ve:BOt[h
+Du+?DBL?,84c`V5u'gD6R`HO:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-
F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(I;D..]E0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)o'D..]E1*CXODg*=BDJXS@-u*[2Ch\!&Eaa'$/n/72.1HVZ
67sB90Pt6D0fU:dBle60@<iu)F_PZ&+C\c$+D,P4D..O.ARlp*D]j(CD@Hp^$=e!aF`MM6DKI!K
@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A8G[rAU$3q
3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(A8G[rAU$3q3@>7C@rH(!F(KB6
+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%15is/g+YHEcP`/F<GOFF<G+.@ruF'
DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp">9IHp@QcapHTHL+6r60K87,_&
<*s!):IK,1C(1MkATV[*A8Gt%ATD4$AKYN%@grbS$>4BuDIIBn4ZX]5C2[X!Blmp,@<?'.%13OO
:-pQUB4YslEaa'$+D5_5F`8I>@<?(*%16idB4YsD3Zr'UE,961+D5_6DIIBn%14J'@k]$?CiXH4
F<G=7FD5i5AKY`(Dg#i+G9CX:@rGmh+DP_%F_PZ&@UX@+4ZX^#ChI<s%13OO:-pQUBOPdhGp$R)
FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>D/^V0Bl%@%%14J'@kf*DG'#)p3Zq-_
6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](@UX@+%14M*Db*Z&<$48L3\5/lF=A>VEbTW,+CoD#/13,]
Ch7$mFCf\L@UX@+%13OO:-pQUDIIBnCh7[/+Eh=:@LWYm1E\_$0I\,b@k]#T/g,1E0b"J(AhG2\
/NS/"A8a(0$6UI4D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$3
67sBW6q/;/Df'H-Ch4_u@<;qcAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr'HDImisFD5W*+A?3C
AQU',4s247B6%s/@;TQb$>"*c/g)8G$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eODe*ZmFCf\W3B:GcEb]?-A8Gt%ATD4$AMPu867sa,Eb]?-A8Gt%ATD4$AKZ%G/KeeH
A8Gt%ATD4$AKYr4De`inF<GX9FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6
$;No?+CfG'@<?'k3Zq.*Gp"jr1,'.E:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=[O[@rl!kC2[Wi4ZX]I
3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3k
BkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBi
ARl5WC2[Wq?YO7nA7%JP+=CoBA8Gt%ATD4$AL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2
+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4
ATT&C/g+eIE$-N=@V'e+-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgD1
BkhQs-Qm&5FE2UK4$"a$B6#,/An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ft
C2[X!Blmp,@<?''GAhM4F!,17+E(_(ARfg)Ci<flCh4%_:-pQU6r-0M9gqfV6VgEN5u'gTBkhQs
?Q_Km+=Jod3Zp+*%15is/g,4PDfp/@F`\aFEZc`VISP??-OgDX67sBlEaa$#+=DMb:4@U=%15is
/g)Pi@4*U@De*KfBkhQs?R[+1ATT%BH[\_=I4#I2:-pQU.1HUn$;No?+EM+9+DPh*Ch\!&Eaa'$
+E_a:EZf./H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE+=D;QATCFT
H#k*KATMF)-OgD2FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%BC2[X!Blmp,@<?'\F(KB-AU/>E
.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-YdR1Ch\!&Eaa'$
+E2@>C1Ums+EM+9F`8HT+E2IF+D5_5F`8I;F!)h]C2[WiBkhQs?O[>                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodliterate BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGIN'
zz=:zz,'NOTJ CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAK'
zz=:zz,'ETOKENS IFACEWORDSPFX IFACEWORDSjodliterate JLAUTHOR JLBUILDTEX JLC'
zz=:zz,'ODEFILE JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE JLOVIEW'
zz=:zz,'SUFFIX JLOVIEWTEX JLTITLEFILE JLTITLETEX JODLiteratePreamble LATEXT'
zz=:zz,'MP LF MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP ROOTWORDSjodliterate TH'
zz=:zz,'ISPANDOC WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAPPREFIXTEX aft'
zz=:zz,'erstr alltrim beforestr betweenstrs boxopen changestr ctl cutnestid'
zz=:zz,'x dbquote dbquoteuq decomm fboxname ferase fexist firstones formifa'
zz=:zz,'cetex formtexindexes fsize fuserows gbodylatex gheadlatex gpostlate'
zz=:zz,'x grouplatex grplit ifacemarkd ifacesection ifacewords ifc indexgro'
zz=:zz,'uptex indexwraplatex jpathsep jtokenize latexfrmarkd markdfrghead m'
zz=:zz,'arkdfrgpost markdfrgroup markdfrwords markdj markgassign markgnonj '
zz=:zz,'read rtrim sbtokens setifacelinks setifacetargs setjodliterate tlf '
zz=:zz,'toJ tslash2 utf8 wfl winpathsep wrapvrblong writeas''               '
zz=:990{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0esk++>P&o0d&2)3&`j4De*ZuFCfK$FCe36/h1USA8Gt%ATD4$AKZ%G/Ke\;DImisFCfM9Ch\!&
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
Ap%p++E1b,A8bs#E+*j%+>"^YF(HJ5@;]Uo@j#]-Cj@.;Afu#0+EM4-Cht55@<?/l$;No?+<Y<;
E,961+<VdL+<VdL+>"^Q@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$;No?+<YB1@:NkiARfgrDf-[?
+>"^MDKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+<YB1@ium:+<VdL+<VdL+>"^J
DfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=%15is/g)9XATV[*A8Gt%ATD4$AKWQIE,oN/@<,p%
9OUn3=<MR'De!@"F(oN)+>"^WATVu9A8-'q@ruX0Gp"[]GB.D>ATJu5Eb/Zr@VfTb$;No?+<V+#
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
AU#>-Df'?"DIdf2FD,*)+D58'ATD4$AKXf;7L]]FASiPuF)uJ@ATJu1@<?(*+D#e/F!+n3AKYo/
+EV:.+EqaECM@[!+E1b2BFP;iATVa,@ps0_$=dTh04Z1OIUmCO%16oo@;K@oAU#=?INs;SEc6)>
INs:N$>j3eASH$mAU#>H,CX9GDfp#J,CU(/Cis0&@<?(*+<Z+XIV3\>F`;dSILQX#F^])pFCf\>
+FYPaB6%p5E.0$\%16ZaA8H0o@;HA[.1HUn$;No?+D5_5F`8IDDf9_?FCf\>/KePACisT4F!,=.
Gp%!9ARlolA867.FD5W*%15^$7oE/W8Q8YX=?S\f0H`D!0F\@8+AH9YDBN\4A8Gt%ATD4$AKWC6
Ec>i/F=A>K@<?(*+D,>(AM,)RB6%s-BlkdHB4YslEaa'$F!)Z>Ec6)>+q4l*+DtV)ARlp,ATDj+
Df0V=De:,6BPDN1Anc'm+D,P4+D"tkBHToC6m-,_Dfp"ABlkJ:Ec5H!F)to6/e&-s$=%:_E-68L
8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO>\S(pF`_tZ,CX9GDfp#J,CX`KFDPM@FCf]F%16?W
@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu%16?XATr*%B4VMZ,p6]9D/E^!A9/l*DfQt/A867.
FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,DJ()#+EDU@AIStm>]XIu
Ch7KsFD-#+@rH1+D/OE+E.*'hASli)$7/quATVa"DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;
$7/r!GAgu0CisT4%16?SDK'`?H[[2gB6%p5E.0$\Dg#i+G:muKG^U#.%16?XATr*%B4VMZ-!YA+
ARfXpF_u"*$=%:_E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,
@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?Z
EbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$7QDk%15is/g,">Bl5&.De*ZuFCfK$FCcRg@8pf?
+E2@4@;TIiAISu=:IIljFCfK$FCe9hARTFbCh5aj+>=p!+>=63,p6r@A8Gt%ATD4$AKYetFCf\>
E,oMuD.7<m/g(T1,p3X(,p60#BlbD/Bl%?'BlbD*+D>J%BP_r:@s)j7Df'37ARlp,ATDj+Df-\9
Afu2/AKYr4ARTFbCh4%_,p7&5FCfK,@;I'!ASu("@<?'k+C]U=E+*WpDdt/9+>%XWDfBf4Df-\A
BOu'(E,ol-F^o-'B-7Wj,p4g^AU#>9F`_SFF=n\T@;]Uo@j#H!B4u*qB4uC$DJ()+F!,CEATDg*
A7T7h+CT.u%14C(FD,5.F*(i.A79Lh+DG_(AU#>3F!,L7A7]@eDIm?2+:SYe$=%+[@s)X"DKKB)
@<6Ko0f!]i?$g"#FD56$AUP!p%16?_F(K<!@r#LcAQrtZDIdfu@;od`HY6o.D.Rg0H$p,/>]k+!
E+*6l@:s.UBOtU_Bl7R)?$g1+Ci"'!B4ZK#$=%^pAT2'fCLLjeHYdP;A7]e!I16NgF`V,5@:O(]
B4ZEuD0'cDD.5&)D0'Q&FD-(3$=%^pAT2'fCLLjeHYI):ATVL./88^4F^]B'G^U#.%14C(E,ol?
Bk1dr+C'#"G]\"L@WQ%"BlJ/'$=%^pAT2'fCLLjeHY-u:CijnWAUP[1$4R=g+E_a:+Dkh&Ec6&F
E+L/+AftN*@;0Od@VfTb$=$/77VQ[M7<iNfFE;eGBk)1%FEqh:/ou,[I=#4AF(K<!@r#LcAUA9.
@rcL0H#R>CI=$AO$=%:WDKTe=0O/=(G\(u.GT\_GAnbLaAo)TuFCf\>0jJ=)4YS!)+DGF1E+ER&
AU"Xk+<Xp3F(K<!@r#LcAQs;!AiO(CBl7m4FCf?"I16NgAScF!+=/.EAfto4@<?(*+E)9CG\(]"
FCf\+$6UHrF`V,5@:O(]B4ZF%Df0Z<E+NO-%144#>\RepATVL.%144#+<Xp3F(K<!@r#LcAUAZ<
FEhnJ@4ZYGDJ<U!A7^/u$6UHrAn_\]+<Xp"AS,@nCij9-DKKK%@<?X4ATN2m@;p1"DJ)+SAU#eK
AU&;J;e'6PAN`arFCSuXDg,c5@psFiI16N++=/.NAT2Ho@q?cO<DlUm6QgSeFD)e>DJ<U!A7Zlp
F`MCC@q]:k@:OCjEZbeu+<VsQBkAK5Dfm1?AS#BpFD,B0+Cf(nEa`I"ATAnF+EV:.+E2@4F(K6!
AKYo'%144#,p7;CBlbD<Bl7R"AKYJr@<,ddFCfJ8Bl5&8BOr<*Eb/Zr@VfTuAoD^"ATJu:F(HJ4
Afu>0CghEsGUstRF^])pFCetl$6UH;>]++s@rH4$@;]V&>\/%uDgct$<DlUm6[^("+:SZ#+=/.?
@;[3/ATT&5FD,6++Dl%7Df]l+@q?cpDf0Z<+DGF1FD,62-ZWc@@<Q'nCggdhAISth+=/.%+ECn4
BOu3,Ch[Zr+B*3$EarZ'6Z6LH+Ad)s+EM+*3XlE=+=/.DFEDI_0/$dNDeF,D@:X:cAM.J2D(g!V
E+3X%B6%F"BR)6d0JP=90KCe-Dfp)1AM%D1A7[?3Ec3RDFDYh'$6UH;>]XIuD/X<1AoDR/HU`$e
API)\Dg`'%+<Vt8F(KH1Df0K*Df0ZD;f?f!@q?cMDe*E%:i^K&%16?PBakCY$7-fmARo@aBl7K)
CggdaCj0T(FD)e/DfQt:BleB;4!8H`BOu4.Bldi:+EV:.+D#G5D.R`rFCcS6@:O(]B4W30Bl%T.
@psM$AIStm+DkP-CLqO-+EVNEAU&<.DIal!AU/33A0>u-AKYf#Aoo/4@<-!pDCuA*>]!nbART[s
ATW$*Ea1nP6=jeDDFADQF_t]-FF,;C$6UHrEb0-"G@PQ.D..<mHX&gPBleB1I16N++<VeR>]XIu
Ch7KsFD-#+CggdaCj0T(FD-)L1hCNPI16O3>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1
@<?(/%13OO,p7;DB4uC'BleA=@rH4$@;]TuAoD]4Ch[s4+EML1@qfgn%16?ZEc6,8A7]7hD/E^!
A:%R'BkM+$Ch[s4I=!7L$6UHrF(KH0ASu.&BR<uuFCf<1AT3'E0Q;,^>]XIuCh7KsFD-#+E+*d.
CM@a9HSBD\I=2P3%14C(@WcC$A0>E$@s)X"DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.
%14C(@rH1%EcVZs>]k+!E+*6l@:s.u@rH1%Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#
I=!_+3%QgA3%QgA3.25C,p6qF@rH7,Ec5b:F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:
Ci=?BHZEb.I=!Y#0f(@7/i#F<0J54=I16N0+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'E
Fq"d`A7]@eDIm<rCi=?@A79Rg@rH1%Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$
+>"^ECht59H#R>9+EM+*+DNNRD/9Xg>\%DXBl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n1
0JG%3/iYS6%16?NAS,XoARfXpDfU26@<6!t@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+Q
Anc-o@rH1%EdMD7Ddd`tDes?4I=$!I@XWSW/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)
D.RU,Et&I]A7]@eDIm<rCi=?@@q]:k@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o
@rH1%EdMkLEbTE(@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%
FCT6*DfU8QEbAj0HS@'02CpO71Gp^;/hf#.%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3
@ruF'DK?6o-!XtlAnc-o@rH1%EdM_HBOu3oDes?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_
A7]@eDIm<rCi=?@DffZ(Eas$(DfU8Q;Fa'%HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/
$=%+QAnc-o@rH1%EdM52ATDm&Des?4I=$!I@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&1
8g&:gEaj)4@;]TuDJsZ8+DtV)ATJ:f>\%DXBl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n1
0JG%3/heu-+<VdL+:SYe$=%^pAT2'fCLLjeHY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSg
D..<m@q]:kF$3c5>^K_(?$fh(I16Ng6tKtEDIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$
DJ+BE<b6;\@<?4#I=#IBD/E^!A7K:]EcXBK>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-
+D,P4+Dl%;AKYJr@<,ddFCfK6+E1n4+Dbb0AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)
Des?4Bl7Q+@rH4$@;]Us+>"^R@;TRs%14C(@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8
A7]@eDJ=3,Df0V=D..]4%14C(@V$['ATT&:D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$
@;]Tb$=%^pAT2'fCLLjeHY.;,D.R7+%16?XATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%
Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl
%14C(GAhM;F!+q'FED)7+EqOABHU5lF`Lu'+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4
<,ZQ#>;9E1>]aP%FCT6*DfU2?AU/K0Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=o
Dejc*0jT-2FCf]=@rH1%EdM>*FCAZtCi=?BH[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=g
I9SF3HX(Z(G][G6Ci=?@A7]7o@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA
?$goC0n"Hm%16?XATqX&D/E^!A:%QJ@<6!T<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!7Vm!OFB!0oI9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7n
I=2P3>]++s@rH4$@;]V&>XN15E`?smI9SF3HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6
,;FUpI=2P3>]++s@rH4$@;]V&>Z5`bBl7Q_Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!6Z6gYASuThDejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q
>]aP%FD5iDHQt7nI=6MQ$=%I[G@PQ.D..<mHX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3o
Des?4I=$;c0n"Iu+:SZ_DIn$%Df'?"DIe*!6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*
DfU8Q>]aP%FCJj/HQt7nI=6MQ$7/qpATqX&D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%
EdMD@DI[0pCi=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[
G@PQ.D..<mHX'H[B5):%9jr'XATCagCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*
0jT-2FCf]=@V0t6,;FUpI16NgDIn$%Df'?"DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et
+E):7ASuU$A0><'G\Lu.@<-W9@rH4$@;]Us+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4Ysl
Eaa'$A0>\sFCf\+$=%I[G@bZ8Bl\-0D.RU,HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8
DJ`s&FF-VU6r7fCFAR!r@qB_&DfU8QI=$AO$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.m
FEq\6HY-](@sNJ3$4R>IBkDU$FCf\+$6UHrF`V,5@:O(]B4Y:gATVm"B4Z-uH=]6O@;L!r/0H5]
E+*Bj+EM7CAKYMpAnc-oA0>?,+F%I>AU"Xk+<VdL+<VdL+<VdL+<YfEBk)'lANaX6Cia/=+<VdL
+=/.QDJ<U!A7ZlmEb/ZpF!,[?ASrW5F(Jl)GA2/4+F%I>AU"Xk+<VdL+<VdL+<VdL+<Yo?FCf]&
HY@\DATDg&Apk*q>\._mAISth+C'&1AT2'fCLLje>BOgt@rGmh4`k^eAR0XrH#R>8Eb/j2%16?P
BakCY$=%7iE+O'2ATW'6HX_#,@;B[nDJO;VFE2M8/.Dq/+<VdL+<VdL+<Ve9Df9E.@<-.)4`k^e
ALn8t+<VdL+<VdL+<VdLE+EQhF`_;8E]nbt/.Dq/+<VdL+<VdL+<VeGA7fptFDPMOH[RFS$6UH6
+<VdL+<VdL+Cf>+DfTZ.DJO;VFE2M8/.Dq/+<VdL+<VdL+<VeLEbo6(Ci=>W@Vg0u/.Dq/+<VdL
+<VdL+<VeCBl7]rDes?44`+V?ASuTu/.Dq/+<VdL+<VdL+<VeGA7f:hEb&a%4aSk*0H`&tI16Ng
F(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*>]XIuCh7KsFD-#+E+*d.CM@a9HT#hb+E2.>F!*5W
F<GF7DKU"C0lV5_%16?]ATVa"DJ+')HX(-!ATDEpDI[s5FE1r7@q^:;1M(EO+<VsQE,oN5ASuT4
Dg#]4Ap%p++Dbb0ATJ:f>]XIu@rHL-FCfK>F(Jj!F_tZ#E-,cAHSBjW$4R=g+ED%7ATT&2@<?(*
+DG_(AU#>>D]j1DAKYT'F`JU7DesQ5DK?pP+Co%q@<HC.+DGm>FE_X4$7-g=BPCsi+ED%7F_l/@
+DG^9Ci=E:+E(j7G@>Q7ARlp&@:s-oF)YPtAKY])+DbJ(A926hE+KIc,p5rY<(/hj@:X+qF*&O=
Aftf*A7^!.DIIBnF!,LGDBO%>B4Z0uATAn&$7-g,Ec5eU+D>k=E&oX*GB\6`CghEsGV*EDD/FE5
BlnVQDfTJDG%kN3FDl,4@kM_6E'Iqt1a[<-0fLmG%16?_F(K<!@r#LcAUA9:CijB$Desh2$=%FV
CLpprCh7^1ATA4e>]OCnATq^'G%ku8DJ`s&FF/+CASH$mAU&V4$6UI<>\Re8FE_Y5DesQ5D@Hpq
+<VdL+C%0PATMs3DIm<rCh@*lF(Gdf+<Ve3AScF!%144#+<VdL>X3=@F*)><ARfXpFE2M8%144#
+C&Mm%144#+C&u!FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0Q;,^%144#+C&u!FDPN+B67g6>[q\g
F_u#;AT3'E1Gs,nI16N++<XouAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'@;TS(
>n%,`+<Xp+@<--mDffZ>>YSXBAQ<\gATD9hF(JTjDId='DIIBnI3f=0+<VdL+<VdL+<VdLHX'9R
CLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6>]aXnF)YQ#ATMs=Ch7s4Cgh$qI16N++<Xp1ATVa"
DJ+')HX(MuEbTE%ASuU<HSBD\I16N++<Xp1ATVa"DJ+')HX(MuEcZ#1E.*'eE-*4ACiseA0J5/#
FF=T*+<Ve3Eb0&qGRY!&+<Xp*ATV0kFCf;o5\XbRBlmp'I3f=0+<Z#9ASu%*D09Z:Bk)'tF+%;-
AjCBJF*)><ARfXp>]4Lk@rH1+D/NTiCia/m@r,^bEc>H"AR&h]I16NgD..3k@<?F0BOu2n$4R>I
D..3kBl7HmGRXuh$=%%OB5)71A8bt#D.RU,I16Mm$7QDk:-pQs5(7s0IK                 ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkfG7R:$J<)>kU6r-/m8Oc!579<8_6rRi=A8Gt%ATD4$AKXT=8PW2Q;H-4W
5sn(86m,)q:KC%U=&_Uj+Au!2<*)jn6rRi=A8Gt%ATD4$AKXrC8Q/GO:..lF+BMH,:eX;D6m-,_
Dfp#8@<?(*+D5_6Ch[u6BkCd`ASkjrCLeQ%An)rtDId='GB.,2CghEsGT_'=FD>`)Ch\!&Eaa'$
+EqaEA8G[rAU#RO/1<VC4"akp+=A:AEb/[$ARB1jA8Gt%ATD4$ARBOjF*(r,@ruF'DIIR"ATJu)
ATMs6Dg>])De*ZuFCfK$FCeg$ATMs(Bk)7!Df0!(Bk;?.Ci<`m?YXLiCh\!&Eaa'$?W1f[CLqU!
F*')i-RgSp4=iTBC2[X!Blmp,@<?'..4cl00I/>$/1<VC4"akp+=A:.:K(5"C2[X!Blmp,@<?''
@WcC$A86$nCghEsGT^I<Bl%<pDe*ZuFCfK$FCf8sFCf\>E,o].De*ZuFCfK$FCcgK/1<V9+>G\u
1,(I;0JtU>/iGUJ1,(C>0d&5*1,(C>0fUdE0KCjC2DI$G+>PW+0JG@=3%d*I2)mEN3&ruA1,(I;
0JtUA/i>LB3&icQ2)cX50JY=92)6s?2)R'C1b^dE1a"P-1,(C>0fUdD3&icT3Ai]M+>PW+0JG@>
1G1OB1c[QS3B83;0JY=92)6s?1c[<M3&EWP1E\G,1,(C>0fUdD3&WWO1GggD+>PW+0JG@=3%d*K
0KCjG0f1a11,(I;0JtRE/iGXB1,^pD1bp1/0JY=92)6s?2)$sJ0fV*M0d&5*1,(C>0fUdD3ArTK
1GL^F+>PW+0JG@>1G1O>2`NZS0JkR.1,(I;0JtU>/iGUJ1,(C>0d&5*1,(C>0fUdE0KCjC2DI$G
+>PW+0JG@=3%d*I2)mEN3&ruA1,(I;0JtUA/i>LB3&icQ2)cX50JY=92)6s?2)R'C1b^dE1a"P-
1,(C>1,CO?2)-mB1,q'J+>PW+0JG@>1G1OB1c[QS3B83;0JY=92)6s?2)%!K2_[*H2'=Y.1,(C>
0fUdD3&rrR0f:^E+>PW+0JG@=3%d*K2*!EN3&rf<1,(I;0JtRE/iPI?2E*EH2DQC10JY=92)6s?
2)$sJ0fV*M0d&5*1,(C>1,CO>1G^mG2`*KR+>PW+0JG@>1G1O>2`NZS0JkR7/1<V9+>Y8u0JY=9
2)6p>2)[HO0fCpM0d&5*1,(C>1,:I?3&`cM0f1mI+>PW+0JG@>1+kFB1,^jE1Gq*61,(I;0JtU@
/iG^D0f_0Q2`)X40JY=92)6p>2E3WS0JPCE1a"P-1,(C>1,CO>2Dd3E0fCsM.4cl01,(I;0JtRE
/i,IG2DR6N3B&HG/ho+92Dd0G2).$G1G^mB3%AVp1*A;#/1<V7,VUYu-p07-1aFh11,(C>0fUdB
0fD!I2DdEM+>PW+0JG@=3%d$I0eb@B3B8l<1,(I;0JtRE/i5LF2`N`R1,9t-0JY=92)6p>2)R*F
3&WTP+>PW+0JG@>1G1L?2DHmA3ADX30JY=92).'C1cR9I3&``T2BXb/1,(C>0fUdB3&E?M0etaH
+>PW+0JG@>1+kFA0f1jJ1cHj7-p014/1<V7.4cl00I\P$4>8384>6                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
