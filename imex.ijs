NB. JOD dictionary dump: 07 Feb 2023 10:45:57
NB. Generated with JOD version; 1.0.24 dev; 3; 05 Feb 2023 10:50:31
NB. J version: j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1
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


StdDocFiles_hashdateurl=:<;._1 '|b98c63395e14cd9c71ae6858c6b83652f084602b088df7c3b9883499e5712289|05 Feb 2023 16:48:11|'

VMDStdDocFiles=:'0.3.0';13;'05 Feb 2023 16:48:11'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


ScrapeMaaHist=:3 : 0

NB.*ScrapeMaaHist v-- histogram of MAA mathematical treasures over time.
NB.
NB. monad:  it =. ScrapeMaaHist clFileText
NB.
NB.   maa=. jpath '~LEAN/misc/index_to_mathematical_treasures_maa-feb-2023.txt'
NB.   ScrapeMaaHist maa

NB. read and parse maa text
t=. parsetd 'UsedDateBegin','UsedDateBegin' afterstr read y

NB. 500 year intervals from 5000 BCE to 2500 AD
r=. 16 {. i: 5000j20
c=. 0 ".&> }. 0 {"1 t
r=. r ,: r histogram c

NB. count, cumulative, start, end years table
r=. ((] ,. +/\) 1{r) ,. }: ((<./c),0{r) ,. (0{r),0

NB. remove 0 count intervals
r #~ 0 < 0 {"1 r
)

ScrapeMaaTreasures=:3 : 0

NB.*ScrapeMaaTreasures  v-- extract  MAA  mathematical  treasures
NB. table from webpage.
NB.
NB. This verbs  extracts  the  <tbody>  from an  MAA webpage  and
NB. reformats it as TAB delimited text.
NB.
NB. verbatim:
NB.
NB.   https://www.maa.org/press/periodicals/convergence/index-to-mathematical-treasures
NB.
NB. monad:  clTxt =. ScrapeMaaTreasures clHtml
NB.
NB.   html=. read jpath '~/downloads/mathematical_treasures_maa-2023.html'
NB.   txt=. ScrapeMaaTreasures html

NB. blank the usual suspects
htm=. (TAB,' ',CR,' ',LF,' ') charsub y

NB. extract first table
htm=. '</tbody>' beforestr '<tbody>' afterstr htm

NB. cut into rows
tr=. ix{tr [ 'ix tr'=. tg cutnestidx htm [ tg=. tags 'tr'
tr=. allwhitetrim@((1{tg)&}.@((0{tg)&}.))&.>tr [ tg=. 1 _1 * #&> tg

NB. cut each row and table
tr=. allwhitetrim&.> ('<td'&E.&.>tr) <;.1&> tr
tr=. allwhitetrim@((1{tg)&}.@((0{tg)&}.))&.>tr [ tg=. 1 _1 * #&> tags 'td'

NB. permute rows and string
ctl;"1 TAB,&.> 2 0 1 {"1 tr
)

stddocnames=:3 : 0

NB.*stddocnames v-- generate a rename script for files in directory (y).
NB.
NB. monad:  cl =. stddocnames clDir
NB.
NB.   pb=. 'c:\lean\books\' 
NB.   pa=. 'c:\lean\articles\' 
NB.   stddocnames pb
NB.   stddocnames pa
NB. 
NB.   NB. linux macos win
NB.   stddocnames '~/Downloads/'

NB. j profile !(*)=. dir IFWIN IFUNIX jpath
pt=. winpathsep@tslash2 jpath y
on=. justfileext@winpathsep&.> 1 dir pt

NB. remove files that do not follow conventions
sname=. ;IFWIN{sb=. '00srn.sh';'00srn.bat'
on=. on -. '.DS_Store';'.localized';'desktop.ini';sb

NB. check lengths
if. +./b=. 128 < #&> on do.
  smoutput 'file name(s) too long'
  smoutput >b#on 
  return.
end.

NB. check characters 
if. 0 e. b=. on *./@e.&> <STDDOCALPHA do.
  smoutput 'nonstandard chars in file name(s)'
  smoutput >on #~ -.b
  return.
elseif. 1 e. b=. ' '&e.&> on do.
  smoutput 'remove blanks from file name(s)'
  smoutput >b#on
  return.
elseif. dp=. on -.&.> <a. -. '_-.' 
        dp=. '.'&rebu@('-'&rebu@('_'&rebu))&.> dp
        0 e. b=. dp e. DOCDASHPATS do.
  smoutput 'nonstandard dashes in file name(s)'
  smoutput >on #~ -.b
  return.
end.

nn=. tolower&.> on

NB. only rename changed files
b=. nn ~: on
if. #nn=. b#nn [ on=. b#on do.
  smoutput (":#nn),' name change(s)'
  if. IFWIN      do.
    bat=. 'rem ',(timestamp ''),LF
    bat=. toHOST bat,ctl >(<'rename ') ,&.> on ,&.> ' ' ,&.> nn
    bat write scn=. pt,sname
  elseif. IFUNIX do.
    sh=. toHOST ctl >(<'mv ') ,&.> on ,&.> ' ' ,&.> nn
    (sh-.CR) write scn=. jpathsep pt,sname
  else.
    smoutput 'os not supported' return.
  end.
  smoutput jpathsep scn
else.
  smoutput 'no name changes: ',jpathsep pt
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o1E\M7+>Ghu2)?@00d&>.;e'iVE+MaP@7Y*RFD,B0FDkf4@;R-*Afsf65p1#QFD,6&
@<?3n@;I'.Eb/[#F`M&7+E)F7EZfI<D.QXUEa`ou9jqI0Eb/[#F`M&7AU&<;@:OC%9gM&fD..O"
ASkjtBk(Rf+EVX8@<6R3ATJu9@:F%a+D,Y4D'4%6@W5agATMs(A8bsq@;TRsB4YslEaa'$+CQC5
AStpnAKZ&(EbTK7+D,P4+D,>(ATJu.DBNJ(Eb/a&DfU+G.![6                         ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n,+>Y,p2BXat1b^X,2]sju1,:jL:et"h?W2&W6uQR)Bl%@%1,2Nj/l5>B<*rRGA41?G7VQ[M
F!,F?F*&ODEc5H!F)u8?/g(T1%17/nDfp/@F`\`t7R9C14ZX]60H`D!0I[G<:-pQU-rY4u6uQR)
Bl%@%.3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GCR<2/4j(1cR3E$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^67sBsARTItFC\p#@rib8:-pQUF(8Wr+DbUtDBNJ.@s)X"DKI"3
Bl[cpFDl26ATJu+DfQt@DeF3(+DtV)ATJ:f:-pQUF*(r'De!ZnD.Rc2+AP6U+D58'ATD4$AKYD(
Eb0,sD.Oi2@rc:&F<G16EZet.Ch7Z1Bl5&(Bl[cpFDl2F+=MLa%13OO+<VdLF*(r'De!ZnD.Rc2
-[m^:Dg-)8Ddd0t0..kb:-pQUFEqh>@ps0rF`V+'$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rH(!
F(KB6+<W%1FC[dX@n(0KATK4.$4R>QF_u):F`]An:-pQ_A9Da.E-67TBkh]3+EK+d+CoV3E$/Y5
EcP`/F<GOFF<F1O6m-#S@ruF'DIIR2/db??/db??/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTf@<jUb+Dl%-BkD'jA0>u4
+EDUB+E)-?@W-@%+EqO;+CT.u+Dbb0Fa+6g67sB80lLQD1GL"rEbTW,+EVNE6um3b@W-K6AoDKr
ATAn#:-pQU0emQaFtu$"FEMVA+E)-?F*VY5BHVM>Blmo/AoD]4Ch[d0GT[>g67sB811><<0fC.a
BOt[h+D#e3F*(u2@q?d$Aftu0DIm[(FEo!>Ec5o+Dg3C8Bl[cpFDl2F$;No?+>GZe@;[eY+CSek
+E2@8G%#K(+CoV3E$/\*Eb/a&DfU+1:-pQU0f3cdFtbcrEb0*+G%Ddg+Eh=:F(oQ1+D,Y4D'3e+
FD,_&:-pQU0f=#`E%s<p-uEO7.3N&0A7]9oFDi:@EbT]*FCcS*F_u)=$;No?+>Gc_E,m]n+=Li3
F=A>@A7T7^+EVNEE,oZ9@<?''A9Da.EsbZ//g)l-An>F,2'=;V@qdA7@:Wn[A0>u4+E2@8G%#K(
+CoV3E,u@]67sB82f2uD0f1"]A7T7^+Du+?DBNP0EZfR?DId[0F!,"6Bm+'/$;No?+>GfrAT0@Y
+ED%*ATD@"@q?cnEbT].+EM+9+C]U=-u*[2E,ol/Bl%?5Bkh]<$;No?+>Gij@;[h\+CSekARlo3
@Uj+_ATfLFFDi:@EbT]*FCcS*F_u)=$;No?+>GifAR[>Q+DG\3Ec6,4+=M/=@jrO2De!p,ASuSs
:-pQU0fWcV@PKkc@:Wmk-t[!=+EVNEE,oZ9@<?''A9Da.EsbZ//g)l.An>F,3$<?bAKWC8C2[W3
+Eh10F_,V:AoD]4A9Da.+E1b2BQG;1Afu&5ATMF#F:(c0/g)l.DJs\Q3$;X?A0<:@A8,RcFt=bV
A8*S;F(oK1Ci=E+ATfUIF(oK1Ci=DE+EVNEE,oZ9@<?''A9Da.EsbZ//g)o'C12!62BZF=A0<:8
@:O(oDf0VF+EVNEE,oZ9@<?''A9Da.EsbZ//g)o'C3=>J2B[3aBlmo/FDi:3Df00$B6A6+A0>K&
Ch.*tEsbZ//g)o*C12!83?WNdBlmo/-u!O0GUXbWD]it9Ch[cu+CoM,G%Dd'$=e!aCghC++<YcC
E,9H&?U6tDA9Da.E-67_3B:Fh4ZXrV5s]%(D/aH:F?)?A-QlV9@rGq!@<6!&4=<E\6"G+TE,]rA
3B9)I$=e!gDKBB0F<DrFC2[W1$49Np/g,+RBm*p,AKYN+D/^V0Bl%@%+>"^GF`VYCD/"<-+Dbb5
F:(iB<^]q^:fBM<+?MV3@Uj*p@Uj+_ATf2+@V?lr@rri*A0>K)@;]jsBl5&.@:O(oDf0V=D.RZ/
D0KQ$@j#Z#FDZ55@q-X!ATW':Bl%i5Eb&l,Eb&lpATf2;Bl.g*DffN$Fs(j?D/a<0F=.D&:-pQU
Ch[s4+CT.u+Cf5+F(G\sDf7d"+FPjbA8,Qs0FBTYDe't<-OL3%BQ&*6@<6KQ3aEk4+>G$#1+"a`
$;No?+DGm>@rH6sBkMR/ARloqDerrqEZcbb+D,P.A7]d(F(KGE+>=pVFD,6+GA2,0.10d!Aj&0t
><3lY/g+nJ@<?0iC0r)83Zq]8$?'Hb4ZX]A+?CW!$49Np/h1dM@j#qH/KetNASrW!DIal#F_u()
:-pQ?:-pQUD/X<#A3(hUDe*?#@r+PI@ruF'DIIR2$49?s;`uaY/13&aC3(aF>9Iip+F+;$Ble66
G!.H#-p2c(+D!/J:f:=^<D?:g+:8HN67sBkF_u(?Bl5&(Bk)7!Df0!(Gp$X?D/^V.Bl[cpFDl2F
$>F*)+C\biEarHbC2[Wi+EM47GApu3F!,Kd/g,">CLnV9-Qlr</heD%,VU?]ATW'8DD!&CDIb@,
$;No?+ED%%A0>f5FDuAE+CT.u+CoV3E$0(:+CT/5+Cf>-Anbn#Eb/c(AoDKrATDi!FE2XZ$6UI%
F_u(\/g)Ps+Z_>,+F?.i$6UI*AhG2S/M:aYE,p+N+=\udBk(`t-[nZ`6pt$L:fA_a+CoCC+CoV3
E$-P`+Z_A-+EM47GApu3F!*S[E+*j%?YWpj-[nZ`6pt$L:fB"p/4iH4+D#G$/d`^DBkAt?Ble66
Fs&7e+DG=t+=DV1:IJ#W<^]q^:fA_a+<Y35/g+\ID/^UG0d/S5.3N\FDg-//F)rHdC2dU'BO>L]
+=DV1:IJ#W<^]q^:fB"p/4iH4+D#G$/d`^DBkAt?Bk(`t-[nH`9i+Yd<)Z4Q:JO;D;HY@i+<VdL
+<Y35/g+\ID/^UG0d/S5.3N\FDg-//F)rHdC2dU'BO>L]+=DV+<D?:d<E)mc6VgHF5uLi=-S.h]
;]oXhA1e33+DGF?+=JUOD.Rr>/NS/++=\udBk(`t-[nZ`6qL*A==55%D_</CF_u(?-nul+1+=>e
BQ&*6@<6K44DJhDFD,#r?Q^_F8l%iH9gr/;-S.h];]oXhA1euI+<Vd6@psIhBOi_&+<Y`=Dg-//
F)rHOF`(VsCh4`2D]j7EBlmo/A9Da.F!*%W@q]F`CER,*DJ!TqF`M&(+D,P.A7]d0F"&Iu-[nZ`
6pt$L:fA`'-[nZ`6r6c^6rcrX;^XXSIRI11:f(.k;aj&L:..BG=XQ9YIS*C(8PMWU-OOF&A1e2r
EZeR/1E^UH+F+;J+>>&p$7Q;h:-pQUA9Da.+ED%3E+No0@r,^bDKTn*De*?#4tq>%Df5u$A0>f/
D[Hh]De!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eIF_u):F`]W(3F;           ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' ScreenScrapers CR LF ScrapeMaaHist ScrapeMaaTreasures TAB'
zz=:zz,' afterstr allwhitetrim beforestr charsub ctl cutnestidx firstones h'
zz=:zz,'istogram parsetd read tags''),<<;._1 '' StdDocFiles CR DOCDASHPATS IF'
zz=:zz,'ACEWORDSStdDocFiles LF ROOTWORDSStdDocFiles STDDOCALPHA VMDStdDocFi'
zz=:zz,'les ctl jpathsep justfileext leanstddocs rebu showpass smoutput std'
zz=:zz,'docnames timestamp toCRLF toHOST toJ tolower tslash2 winpathsep wri'
zz=:zz,'te''                                                                '
zz=:405{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0d&G42cFg/6uQR)Bl%@%:-pQ_;flP<Ddu7NCh7Z1F"JsdB4YslEaa'$+EM%5BlJ08
+EVNEF*(i.A79LhBmO>5A8bt#D.RU,+D,>(AI;1!/g,%?D.Rc@$;No?$;No?+@g!\ATD4$ATJt:
F(f-$C`jjA@rc:&FE8QIFD,*)+ED%2@;TQu+CoD#F_t]-F<D]<Bl%@%+EVNE+CPUP67sC%FCB&t
@<,m$+E_R9@rGmh/0H'ECgh3s+<Y9:AS!D8+CT.u+<YWAEcb`!Ch4_3CghU-F`]5Y+B3#c$;No?
+CoD#F_t]-F<G10Ch7Z1@<,p%+Dl%<FDQ4F+AbHqF!+n/A0<"'Eb-A8H#RJ-@;Kb*+<Y*&@:Wqd
Bk%KF67sC"@;oduF"AGCDf9E4/0Je<DKTB(F!+n/A0<"9D]iY1EcbtI+<XWsAKW+*Df0`0DKKT2
DK?pCBOQ'q$;No?+C\nnDBNG&Df]K-+EVNE@<QR'A0>u-AKYYpF)u//F!,aHFW_f<DI[U-DKKH1
+<YlAASrW#DfBu9DJ';O67sBhDIal4F(oN)+D,>(ATJu4DBO+2EbTH7F!+7WATKI2:-pQ?:-pQU
G%G]'@<?4#3XSVK/db??/g+kGFCfK)@:NjkGAhM4.!$gu$;No?+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]
:-pQU+DbUtDKBo1A8bt!+>"^W@ps6tCh7$m+CoD#F_t]-F<G+.Eb/a&DfTQ'F!,(5EZfC@B6@c.
DIIBnEsbZ//g)9XFC\p#@r>^lATJtG+D58'ATD4$AKYD(Eb0,sD.Oi2@rc:&F<G16EZet.Ch7Z1
Bl5&(Bl[cpFDl2F+=MLa$;No?$;No?+CfG'@<?'k3Zp131,EZRDD<pS:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.;:$=e!aCghC++=C*0A41?G7VQ[MF!h:                                   ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql>tEa`ou9jqI$BleA=;e'iVE+MaP@8q8Y@<6R3ATJtmFC[dX@n(0KATM3l
@<6*m@<?('Eblk!9ghp%A41?G7VQ[MF!,OGA7TUgDIIBnF!iCf-p01/0I\P$4?P\X?SNZN+B)cj
AS#aX@rc!sATDi7;flP<Ddu7NCh7Z8.4cl00I/>$/1<VC4"akp+=A:.:K(5";flP<Ddu7NCh7Z1
A9Da.E-67M.4cl01*AG"1,(I>0JY=?/i>LA3A<<F1H7981,(I>0JY=?/i,LB1c7'D0JYC+1,(I>
0JY=>/iPI<0f(gG3B8u?1,(I>0JY=>/iPI<0f(dK2)R<81,(I>0JP=C/i5CC1,LdG0f1a11,(I>
0JY=@/i5CE2).$E0fM!51,(I>0JY=?/i>CB1,UdG2D[971,(I>0JY=>/iPI<0f(gG3B8u?1,(I>
0JY=>/iPI<0f(dK2)R<81,(I>0JY==/i5RK2E!NR2DR!9/1<V7,VUYu-p07-1*eV/1,CU>0K(O@
1,1I>1GCO;0d&5*1,CU=1-$sD3&EBI0ek[J2]sk01,CU>0K(O@2)[-K0JbOE2'=Y.1,CU>0JkC=
3B8uU3&rfT1ast(4>8$7.4cl01*A=t1,(I>0JY=>/iG^M3&NKL0Jtj51,(I>0JP=C/i5FF1H%-O
1,_*71,(I>0JY=>/iPI<0f(dK2)R<81,(I>0JY==/i5RK2E!NT1cR<@/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
