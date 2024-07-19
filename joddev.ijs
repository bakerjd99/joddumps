NB. sha256:2dfdb9f09c2a4165a809ce9af150b5fa1e6334683e325de5dd76d8b3b2faafd2
NB. JOD dictionary dump: 19 Jul 2024 12:42:39
NB. Generated with JOD version; 1.1.3 - dev; 4; 17 Jul 2024 10:36:06
NB. J version: j9.6.0-beta13/j64avx2/windows/commercial/www.jsoftware.com/2024-07-02T10:16:57/clang-18-1-6/SLEEF=1
NB. JOD put dictionary path: /joddev/jod/utils
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|335777767984232392329146217471784198516|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


ERR032=:'hash does not match ->'

ERR033=:'invalid dump file ->'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.3 - dev';4;'17 Jul 2024 10:36:07'

JODVMD=:'1.1.3 - dev';4;'17 Jul 2024 10:36:06'

OK011=:'hash matches ->'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


make=:3 : 0

NB.*make v-- makes J scripts.
NB.
NB. monad:  make zl|cl
NB.
NB.   make ''  NB. basic put dump
NB.
NB. dyad:  ilObjOpt make cl|blcl
NB.
NB.   0 make ;:'an arbitrary list of words into a script and file it'
NB.   0 2 make ;: 'a list of words returned as a character list'
NB.
NB.   3 make 'suite'    NB. make suite write to script subdirectory
NB.   2 2 make 'group'  NB. make group return character list
NB.
NB.   NB. make groups that are not in put dictionary
NB.   NB. file is written to put dictionary script directory
NB.   2 _1 make 'deepgroup'
NB.
NB.   NB. NIMP: check dump script hash
NB.   17 make '~JODDUMPS/joddev.ijs'

makedump__MK y
:
msg=. ERR001  NB. errmsg: invalid option(s)
if. badil x do. jderr msg return. end.

NB. j profile !(*)=. jpath
if. HASH={.x do.
  if. badcl y do. jderr msg return. end.
  if. -.fex <file=. jpath y do. (jderr ERR033),<file return. end.
  if. chkhashdmp y do. (ok OK011),<file else. (jderr ERR032),<file end.
  return. 
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options HARDCODE
x=. 2 {. x , 1 2
if. -.({: x) e. _2 _1 1 2 do. jderr msg return. end.

if. ({. x) e. GROUP,SUITE do. x makegs__MK y
elseif.  ({. x)=WORD do.
  if. badrc uv=.WORD obtext__UT y do. uv
  elseif. 1={: x do. (WORD;1{uv) writeijs__MK >{:uv
  elseif.do. ok >{: uv
  end.
elseif.do. jderr msg
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H-F7+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P\p1a"M18U=!)6tpO\ATDBk@qB.gEb-@c
:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX
:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)
Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\
8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'t
@;BFk@;BFq+A*bt@rc:&FE7                                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gg42+>P&p0d&5-1,9t,3$9q03&Vm63?U4:1a"M.+>P].0PkZ9A9;C(F>5I'A8,OqBl@ltEd:DH
/h1[U@:XIkF*',j0P"m-FD5Z2@<-W9F=f'eCi<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIlFEM,*
+EV19F<G+.@ruF'DIIR2/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lQATMs.De(RV0I\,\
Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AQiuASkmf
EZd(s3B7NU:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttfqF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0fX)]
F>5HlF`:l"FCeu*AoD]48g$)G0K0FJ:-pQU1,N`gDDNshEb0E.F(HJ+DfQsm+?;&4+=L`<@rc-h
FCd+8De3rtF(HdC@q]:gB4Z,n$;No?+>PcgF_icl+Dk\1B4W3"DBL?BDe*s$F*&rUC2[W6+E_d?
Ci_$JA8,OqBl@ltEbT*++:SYe$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%15is/g)QWDe*s$F*)5:@ps1b.3N/4Anc-oA0>T(+DPh*E,ol/Bl%?5Bkh\u$=e!aF`MM6DKI"9
De*s$F*)5:@ps1b+=BH@6#:IJA9;C(F>5I'A8,OqBl@ltEd9#A$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$4R>aA8,Oq0edi83ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1-Zip@FD>`)
0eb:8-OgCl$;No?+E)41DBL?LA8,Oq0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRXEb'56GA2/4
Dfp.EA7]@eDJ=!$%16Ze+E(d5FC])qF>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1T
DJU[J.=6IqA8Z32-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<Ve%67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL
+E(d5FC])qF>5Io%13OO:-pQUDfB9*+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGH
Ec6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//F)rI7Bk/?8
+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#Tt
FC])qF>5I'GRXuh$;No?+EMXCEb-A;DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67FG^+HB$4R>;
67sC$AT23hFCf!!Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa
/g<"mGpsjf/g_qn+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3
F!*.Z0ea_hF`\`S0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=W
F<Dtd+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,s
D.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`
4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`
G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^
BQ&*6@<6K40H`)(+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX
+>GPmE-67F-oW8hAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
3$<6QDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.
Df0V=-tRXFEb0*!+E_a:+E(j7E-67F@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc
+=o,f4=>5^F*',j0Hb4NEb-A1ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-o
Ch7KsFD*$2$4R>;67sBtATDEp+DG^9G%#E*Dfp+DA8,OqBl@ltEbT*++EMHD.!0$AFE8uUB6%p5
E-!QQD.-ppDf[?MAU%p1F:ARgEZf:2+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH
+=ANG$>"6#A7dtc+DkP&AKW?J%16Ze+E(d5FC])qF>5I'GT^351E^UH+=ANG$8EZ-+=Joe3\W!*
HTG\L%16Ze+E1b!CLeQ0A8,Oq0eb;+%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZfF:
Dg-//F)rI7Bk/?8+>=63%15is/g+Y?Df]J4.!0!6@rsFZ0R,#hA8,OqBl@ltEd8d9DIal"Ch7$m
+E_W4$>"6#1E^UH+=ANG$4R>;67sB[78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#cQD..3k87?RQ@q]XVD/X3$0JH6g
/h1^HCLp%FF(f&sCK#(gCLo1R+ET1e+=M)8CLnq;BOPsq+Cf(r@r!3.D/X3$+EV19FE9&D$;No?
%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.De(OV.3N/8@ruF'DIIR2+D#e3F*)IG
@;]TuBlbD5Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW+1hq/L0fKOK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-
$4R=o/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5%13OO@rGk"EcP`/F<G=:A9;C(FDPl*
@;KKt-UC$aD..3k87?RQ@q]XVD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%14gK+?^i<5uU<]@;9^k
?O[>O$;No?+DG_:@;KXg+CT;'F_t]-FE7luDImi20fL4l@;BEs-RT?1DImi20fL4l@;BEs0F\A,
ATAnJ2]usGCLnV9D..3k+DlBHA79a2%16uaEZd(q+DkP&AKYDB%16uaEZd(q+DkP&AKW@13\PSg
Blbq>Bl%?6BlbqEBle?0DJ(V?@:We!Bkh]:%16uaEZd(q+DkP&AKY>7+EKRd-QmMEBlbD2F!,OL
D.7F"Bk&M"$>sEq+>u,9+DkP&AKW?R@W-0<BQ%fB@VKpoBJ+"6F!hD(%16Ze+E(d54$%IoBk)5o
$4R>;67sBkF_u(?A8,OqBl@ltEd8*$A7dtc+DkP&AKW?J%13OO:-pQU@q]F`CER;!F(c!iATAna
5uU<]@;9^k?Qa2oCLnVMHTG\L%13OO:-pQU@;L$sEZen8D/^V0Bl%?'/Kf7OCht5(BOPdkAKYYp
F(c!i@X3',F$2Q,Eb/Zi+?Op2A7c8X%15is/g+Y;@;]^h+EMI<AKYH-FCfM&$=\:&ATL!q+=AWd
+=KH/0H_S_,@Yq?ATK;K+C]V<ATJ:f0d'[C@X3',F!,[IBlmo/4*s#!Ado(V$;No?+D>2)BHVM5
Cht53D]ik7DJ*O$+DkP/@qZ;YDImi20fL4l@;BEs4*s#!Ado(V$4R>;67sB4HW3F4<$5+>6UO:@
;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFCfN8Ci<flCh6sf
C2[WiD..3k87?RQ@q]XVFE1r6F"f:C67sa)@;BFF@<6*lBPUOgEb0<50JFVk/M/(nD..3k.3NG8
EbAr+A9Da.+D>2)BHVD.F*'#D$;No?%15is/g)8Z0I\+mFCfN8C2[W;0JG10+Co1rFD5Z2@<-W9
AU%p1FE8R5DIal(F!,:;@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(I?C3=>I3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)
ATMs)E[M;'%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]?rCLp%FF(f&sCK#=qATMoH0II;:
%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J
3ZoelATMs.De(RV0JFj`$4R>;67sC!E+No0Cgh?sAKYMt@ruF'DIIR2%16Ze+E(d5FC])qF:AR3
0JG170H`J#,@k\.+=ANG$4R>;67sBt@;BEsCgh?sAKYN+D/^V=@rc:&F:ARfAj&0tD..3k+=ANG
$4R>;67sBo@<6*)F(fK7Ch+Z*@<?!m%16Ze+>GetD..3k+?Op2A7c8X%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3l
ARB.dDe*3mDe404;f-GgAM>f567sa*De404;f-GgAM>e\F=f'e-uNs7G]5)SF)>i2AKZ)+F*'#D
$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.De(OY.3N2HBleB;%15is/g)8Z
0e"4nF`_>6F"&5BBk)7!Df0!(Gp$gB+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`gCb[pZ$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.
$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aDJs*2E)UUl
CLo1R-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$;No?+Dbt)A0>r3D.Oi4FD5Q4+DG_8D]j.5F*&O@De!3lAISuXEZf:2+=D;RBl%i<+BosE+E(d5
-RT?1ATAo8D/a<0@j#DqF<EY+-Z`s>GApu3F!+t2D.4k%$4R>aA8,Oq4ZX]5FCfN8C2[W:1a`_>
ATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+CfG'@<?''DIn#7GAhM4F!,R<@<<W&D]iq9F<G.>
BleA=Bl5&8BOr;sBk)7!Df0!(Gmt*uATr?:Eb'5S3Zoh,+?CW!.1HW%D0%im+>>'L3XlF.DfT3/
Eb$dFBeCM_0HanE/e&.1+Dtb7GB.4W/g)PiGB.4A/1;]'GB.4C/15=P-RgSj3b2r8DKTf'@;9^k
?Q_$3$6UH>DIn$9Eb$U^3Zq]N>9GXD3\i$;%144#DJaGX/g,%KF"BFkATr?=A.8lWDIb@/$>s^%
%14Nn$4R>;67sC%FDl22+Dtb7+EqaEA9/1eGB.51BleAZ3Zr<OGB[tGA9/kI%16Ze+EVI>Ci<f+
E-67FGB.51BleA*$4R>;67sC&BOu6r+Dtb7+EqaEA9/l(D]iq9F<G7*G%De-G]7J-DIIX$Df0V*
$>"6#DKfZ:4ZX^'De404+=ANG$?pN$Ch[s4+D!/JDKfZ:%13OO:-pQUAU&01@;0U%F)Po,+E(j7
FD,6&%16Ze+>=ot+E2IF+=K)iHS-FbEb'!#F*&iR/1r&--Zs<;De!p,ASuU$A0>B#A7ZltF!+n#
BQ%p&DKI68$>"6#A8ZU94ZX^'De404+=ANG$4R>;67sBuDf0,/De:,6BOr;sDe!p,ASuU$A0?)7
Eb'56F(fK7Ch+YtAKYo/+EV:.+Dbb5F:AR//grS"HS-FbEb'!#F*&iRAM,*9DKg=7$4R>;67sBj
Eb/[$AKYl%G9D!=F*)IGFD,*)+CoC5DJsV>AU%p1F<G:8+EV:.+Co1rFD5Z2@<-W&$>sF!FCfN8
F$2Q,-o2u,+>>5R$>s^%4Y@j2+>>'L3XlF.DfT3,F*'#WBeCM_0HanE/e&.1+Dtb7FCfN84Y@j)
FE;OO/1;]'FE;OQ/15=P-S-H&A8,RlF_tJoC2[Wi+>=63+<YQ=F$2,uDJaGGDIn$6ATMrT-Zj$9
F!,1<+CQC7ATMr@%16ZaA1e;uDJaG($7QDk%15is/g,4WDfTD3FCfN8Et&IuF*)M4@VfU=3Zr<O
GB@D;FE8QY%16Ze+>G!XF`\aJF*)M4@VfTb$4R>;67sBuDf0,/De:,6BOu6r+EV19FE8R<@<Q3)
AU&01@;]LqBl@m1%14L;+F>:e+EV[HFCAWpALSa5/g)kkDJs*2E$-MU%13OO:-pQU@rc-hFCcS4
ATo80Ec6)>F!,(8Df$V7ATo8@DfTB0%16`gE-,Mt4ZX^0Eb'!#F*&OOINU$n0L%9I0I_?)+Cf>,
@NZn>Eb'!#F*%iuB6%s5@:DA\+=JUMEc<BQ/1)u5+>=pb+u(3QEc?,/@OWEN/g+eIE-,Mt%150N
+F>:e+D5_6+u(3QEc?,/@LWYR$;No?+Du+8AKYo'+EV:.F(HJ,Ec6)>F!,.)G%De-G]7J-DIIX$
Df0V*$7ISNHQk0eB6%s5@:CZ.AM,)\+Du+/G]4cQ-OgCl$;No?+CfG'@<?''DIn#7F*22=ATJu+
Ec5e;DIn#7FCfN8Et&ItF_Pr+@Qcap-nlcj+u(3^F*)M4@VfU)+FAP[-o!D?0etF3HSZdSDf&r+
,BS!KFCAWpAISufF_Pr+@Qcap-ms(YBdY5Y-8%J)0Hb]d0d(O[Blmcm.3L/o+EM[>FCAVf$9Kpa
HQk0e>p(pGB6%r80d(O[Blmcm%13OO:-pQUDJsE(+E(j7FD,6,AKZ&:Blmp-+D>2,AKYQ/E,8s#
@<?4%DK?6o-nlcj+u(3]F_Pr+@OWF2/g)qmDJs*2E$-MU%13OO:-pQU@rc-hFCcS4ATo7r79EMr
@;9^k?Qa2o@rcL/+D,Y4D'3q3F*)I4$>"6#1a$a[F<GF/@ru-g4ZX]6-Z*:%-RLAk/j:C3+F>:e
+EV[HFCAWpALS`Q/g)Q)<(0ng?X[\fA7$c./1r&"+F>:e+EV[HFCAWpAIStU$;No?+Du+8AKYo'
+EV:.F(HJ2@:O=rF!,.)G%De-G]7J-DIIX$Df0V*$7ISNHQk0eD.-pr@:CZ.AM,)^+Du+/G]4cQ
-OgD*%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?N                                     ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&p0d&;4+>Ghu1-$I33?U(9+>GVo0fWuf@:XIkF*',j0P"m-FD5Z2@<-X0Ddd0!0eb;+
+>RhF+E):2ATAo3Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-X1@;BFF@<6*lBPUO`Deio<0IUdH
CLnq;BOPsq+Cf(r@r!3.D/X3$+EV19FE;;-CLp%FF(f&sCK#=qATMoH0IUdHCLnq;Cgh?sAKYN+
D/^V2@<6*)FCfN8DJs*2E)UUlCLo1R-uNs7G]5)SF)>i2AKZ)+F*%                     ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3Ahp>+>Y,p2'=Xs0ekIE2BXb/+>P&o1,(FC+>GSn1*AA/1c?I20H`+n1-%3J0d&2,+>P&s2_[-4
0eje++>G`02]sh8+>P&o0JYL.0fL41+>GZ11E\D0+>P&o0JZ6r6pamF9LMEC;cHOj=Y_iA$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>Yq8muT[
1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU0f1"F@;[2C0JYI-0f1pH1HI9F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&DBL\g1,L+.1HI?K3\`;q$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.;+A-'[+>PW+
1a"M/3]/fV2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
3?TG4@<?'A+>Gl!8muT[1,(I?+>G`72)mWS0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PVn8muT[1,(I?
+>GW41bh$F2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
1*@]-@<?'A+>PVn8muT[1,(I?+>GZ51bh$H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ1C=Hr:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>PYo8muT[1,(I?
+>>f:1,M$G3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>PYo8muT[1,(I?+>>f:1b^sE3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>PYo8muT[1,(I?+>GQ20JGOD2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>PYo8muT[1,(I?
+>GT31H.?P2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
3$9>3@<?'A+>PYo8muT[1,(I?+>GT31cRNN0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo8muT[1,(I?+>GZ51bh$J1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo8muT[1,(I?
+>GZ52)I?L2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
0d%T,@<?'A+>PYo8muT[1,(I?+>G]61GCjH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C=Hr:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Mm7V-$O1,(I?
+>G`71c%0J0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
1a!o/@<?'A+>>Pn7V-$O1,(I?+>GT31,1gH1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>Pn7V-$O1,(I?
+>G]61,(aE3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
2]s52@<?'A+>>Pn7V-$O1,(I?+>G]61Gq3L3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>Pn7V-$O1,(I?+>G]61H7EN3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>Pn7V-$O1,(I?
+>G]61c@BL0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!
0H_K+@<?'A+>>So7V-$O1,(I?+>GQ21c@BP3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>So7V-$O1,(I?+>GT30ebXB1C=Hr:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>>So7V-$O1,(I?
+>G]61,q<L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!
1E[f.@<?'A+>>So7V-$O1,(I?+>G]61GV!I2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_K)
F_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqf2'>A"@N[E[1,L+-3BB#R3\`Q#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>>Yq7V-$O1,(I?+>GQ20etdH3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_K)F_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqf2'>A"@N[E[
1,L+.0KLpI3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp+9+@]pO+>PW+1a"P.3\WQT1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#
+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>>bt7V-$O1,(I?+>PZ41G_'G0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0K:1EARZc;0JYI-
1,1gI2``WQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp='
+@KX[ANCqf3$:\%@N[E[1,L+/1-.0J3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8
Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp+:+@]pO+>PW+1a"J43]/oY2)u!N$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu7V-$O1,(I?+>GT3
2*!]S1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU0KC7FARZc;0JYI-0etdD1-.6G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+<X!nBl%<&
:3CD_ATBgS0ea^m6t(1K3Zp.2+@]pO+>PW+1a"M-3]&WR1,fOI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/hnIk6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0ea_>ARZc;0JYI-0etdD0fh0J$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#8!@N[E[
1,L+.0KLpG3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P&^6t(1K3Zp.6+@]pO+>PW+1a"M,3\iZU1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G\q7V-$O1,(I?+>GQ21GV!I3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0esk;E,m'V0JYI-
0KD0K1cdKL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp:&
+@KX[ANCqg1E]D#Gp"jr1,L+.0fh$K3\W8q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AH9i+>PW+1a"M-3\rWS1GK4D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>So8p,"o1,(I?+>GZ5
2)73J0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\
FCdKU1,'hCF`&<W0JYI-0f;!J1-.6J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh0d')2DBL\g1,L+-3'&oN3]/]#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2DBL\g1,L+-3'&oT
3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh0d')2DBL\g1,L+-3BAlO3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh0d')2DBL\g1,L+-3BAlO3\rZ$$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh0d')2DBL\g1,L+-3BAoO
3]/o)$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[
ANCqh1*B23DBL\g1,L+.0KLmJ3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1*B23DBL\g1,L+.0KLsC3]&c&$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqf2BYV7C`kJe1,L+.2**TL
3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[
ANCqf2BYV7C`kJe1,L+.2EENI3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2BYV7C`kJe1,L+.2EEQN3\`N"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqf2BYV7C`kJe1,L+.2EETN
3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[
ANCqf2BYV7C`kJe1,L+.2EEWL3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2]t_8C`kJe1,L+.0KM$M3\W>s$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2]t_8C`kJe1,L+.0KM'O
3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[
ANCqf2]t_8C`kJe1,L+.0fh!D3]/i'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2]t_8C`kJe1,L+.0fh0G3\r]%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqf2]t_8C`kJe1,L+.0fh0K
3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[
ANCqf2]t_8C`kJe1,L+.2EETK3\iGt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf3$:h9C`kJe1,L+.0KLpH3\iT#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf3$:h9C`kJe1,L+.1HI9I
3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[
ANCqg0H`u1C`kJe1,L+.0KLpK3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg1*B23C`kJe1,L+.0KM'L3\iN!$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqg1E];4C`kJe1,L+.2EETK
3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f1"F
F_i0U0JYI-0KD0O2EEQH$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*@]+
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+A-cm+>PW+1a"M,3\`NR0fTLI$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1a#D5C`kJe1,L+.0fh!C3\`T$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f1"FF_i0U0JYI-
0ek^D1-.3J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>G\q8p+qm1,(I?+>GT30fD'J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*@]+F_PZ&+AR&r
@V'R@+>t>b6t(1K3Zp.6+A-cm+>PW+1a"M-3\iKP1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Gbs8p+qm1,(I?+>GZ51b^sG3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0fL4IF_i0U
0JYI-0KD0K1HI<I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqg2]t_8C`kJe1,L+-3BB#Q3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.9+A-cm+>PW+1a"M,3\rZT0K'81:IJ/X:J=\R
<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f1"F@;[2C0JYI-0f1pH1HI9G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0f^@K@;[2C0JYI-0f(jI1HI6F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f^@K@;[2C0JYI-0f(jJ2EE]R$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@K@;[2C
0JYI-0f;!L3'&oN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp13+A-'[+>PW+1a"M.3]&QP
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo
+@KX[ANCqh0H`trDBL\g1,L+.1HI?I3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nD@;[2C0JYI-0KD0K1cdHL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>PYo
8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+1a"J43]&NO0K9CH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh0d'(sDBL\g1,L+.
0KLmA3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fU$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo8muT[1,(I?+>GT31cRNN0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K
3Zp14+A-'[+>PW+1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'(sDBL\g1,L+.1HIBM3\iQ"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,0nD@;[2C
0JYI-0f1pI0KM$F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+2+@]pO+>PW+1a"M13]&WR
1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr
+@KX[ANCqf1*B%t@N[E[1,L+.0fh'E3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E2``WN$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>Pn
7V-$O1,(I?+>G]61,(aE3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,g<u6t(1K3Zp+3+@]pO+>PW+1a"M03\rWS1b]7D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf1*B%t@N[E[1,L+.
1cdEP3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>So7V-$O1,(I?+>GQ21c@BP3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K
3Zp+4+@]pO+>PW+1a"M-3\`<L0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf1E].u@N[E[1,L+.1cdBO3\`T$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0Jah@ARZc;
0JYI-0f1pI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=!1a!o/@<?'A+>>Yq7V-$O1,(I?+>>f:2)@9J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1Gp9t6t(1K3Zp+6+@]pO+>PW+1a"M,3\`BN
1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&+@:3bCh+Y`F_tT!E]P=!2BX,1@<?'A
+>>Yq7V-$O1,(I?+>GQ20fM-I1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>bt7V-$O1,(I?+>PZ40KD0N1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>>bt7V-$O1,(I?
+>PZ41G_'G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_
ATBgS1a!o/@<?'A+>>bt7V-$O1,(I?+>PZ42)dQM3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>bt7V-$O1,(I?+>P]51,V*J0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>>eu7V-$O1,(I?+>>f:2*!]T3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>eu7V-$O1,(I?+>GT32*!]S1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu7V-$O1,(I?
+>GW40JY[G0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnIk6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqg0H`hr@N[E[1,L+.0fh-I3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5
+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.2+@]pO+>PW+1a"M.3\W9L2)>RH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@]pO+>PW+
1a"M,3\`KQ0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.6+@]pO+>PW+1a"M,3\iZU1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.6+@]pO+>PW+1a"M,3\rNP1H5^K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp.4+@0se+>PW+1a"J43\`HP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5+AH9i+>PW+1a"M-3\`TT0JNnA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AH9i+>PW+
1a"M-3\rWS1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp+4+A-co+>PW+1a"M/3]/ZR1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp13+A-co+>PW+1a"M13\rNP1c,OH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp14+A-co+>PW+1a"J33]/TP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2DBL\g1,L+-3'&oT3\r]%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,0nDF`&<W
0JYI-0KD0K1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>PYo8p,"o1,(I?+>>f:0f1pI2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp14+A-co+>PW+1a"J43\iKP
2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q
+@KX[ANCqh1*B23DBL\g1,L+.0KLmJ3]&c&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,9tEF`&<W0JYI-0ebXD0KM$M$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>\r
8p+qm1,(I?+>G`72).-J0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp+7+A-cm+>PW+1a"M23\W<M1c#IG$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2BYV7C`kJe1,L+.
2EEQN3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp.;+<X'\FCdKU0K(%GF_i0U0JYI-0fD'J2**NQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r8p+qm1,(I?+>Gc81GV!I0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp+8+A-cm+>PW+1a"M,3]&fW0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2]t_8C`kJe1,L+.0KM'O3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K1+HF_i0U
0JYI-0ek^C1-.9O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>>_s8p+qm1,(I?+>GT32)%'I2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+A-cm+>PW+1a"M-3]/`T
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht
+@KX[ANCqf2]t_8C`kJe1,L+.2EETK3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K:1IF_i0U0JYI-0ebXC2EETO$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>bt
8p+qm1,(I?+>GZ51,CsJ3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS1-$I"6t(1K3Zp.2+A-cm+>PW+1a"M,3\`WU1c5UI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg1*B23C`kJe1,L+.
0KM'L3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp45+<X'\FCdKU0f'qEF_i0U0JYI-0fD'J1-.6J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>G\q8p+qm1,(I?+>>f:2)[KM0a\6p
:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=Wi
D.7's3Zp47+<X'\FCdKU0f1"FF_i0U0JYI-0ebXF1HI6F$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>G\q8p+qm1,(I?+>GT30JPUC
3!p!":-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3Zp49+<X'\FCdKU0f1"FF_i0U0JYI-0ek^C1-.*G$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!2BX,1@<?'A+>G\q8p+qm1,(I?+>GT3
0etdG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS
1H-F!6t(1K3Zp.6+A-cm+>PW+1a"M-3\`NR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yu"+@KX[ANCqg1a#D5C`kJe1,L+.0fh'G3\iDs$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
2BYV7C`kJe1,L+.1HI?H3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=
6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]t_8C`kJe1,L+-3BAlN3\rQ!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2]t_8C`kJe1,L+-
3BB#Q3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqg2]t_8C`kJe1,L+.0KM!J3\WK"<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4D]ik1
F*(\9FDk].?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]Tu
BlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(
ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/Ch4`2
D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21@<<VA
@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSru
BmO>C%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=G'@Y3FYu*;BK8"r0m@\YGAD,83+=^d?Tqj?
6Z6j`Bk1dq+D#e:Df]W1B-:`-D/^V=@rc:&F<G7*F(c\+BOt[hF"AGF/nZdf%144#+F\cgILQW,
+<XEG/g+Y;ARfKuA9Da.+EM%5BlJ/:@rH7,ASuU2+CSnkBl8!6+D>2)BFP:k+<WBt+C]5)+DPk(
FD)dEIS*C(6rcrX;_N98Bl%iCBkh]:%144#+F\cgILQVn$8O4V?p%dU11W(VF_#_OD),aB3&c";
GVF5b3G*&O?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B0#Ec#6,Bl7Q+DfBf4Df-\>D]iG)@;BF^+EV:*
F<G4-DImisFCfM&$6UH6A8-'q@rri(AS,XoBln'-DBNP0Ec#k?GA(Q*+DkP&Bl7Q+F(96)E--.R
+B3#c+Co2,ARfg)A7]@eDJ=3,Df-\0DfT\($6UH6BlbD6DfTD3ASbpj@;^00@;]TuBOPs)FD,5.
DJ<Tl+D,1nFEMV8+E(j7,%P8)F`2A9DJ(.9F(oN)Ch4`*Bl7K)AU&01Bk(k!F"AGF/nZdG$6UH6
IXZ`p%144#+AP6U+E;OBFCeu*F*(i.A79Lh+D#e:Ch[BnF:AR"+<Y]GG%>/o4ZX]A+?CVm?!o'U
<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=4"akq-8%J)4?G0&1*Cii%144#+AP6U+Co"*
AoD^,%144#+EDOHA7]7]A3DsrH[?l@?mncM9MA/H;G/3@.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>
/mg@\/j:C?4"akq+F,)XI16N++<Z,^IXV_5+<Ve+BOr;rDf0`0EcYr5DBNP3Df$V<FCB&t@<,m$
AU&01Bm=?6+EVNEA7QfsF!,OGEa`ZpBQRj)Ed(r4A0><%+Dbt6B+51j+<Y*6+EV:.+Co%qBl7X,
Bl@l3A8c%#+Du+>+E_a:+CT/5+E(j78ge[&Eb0<'Ecu#)+CT;'F_t]-F<GI0D.Rc>%144#+CK=7
Fs(WEDI>(>+@.,[BOPdkAKYf'CLnW1BPDN1GAhV?A0>;sF)N18D/`onF<Ft+De*ZuFCfK$FCei&
@Wcc%$6UH6Dg#]4@;Ka&GAhV?A0>_tCLnV\+Cf>#AKYl)@qB['FDi:<Df9D6Blks:$4R=u/g+Oa
?Sc/23HdE.F*'3XFYe+t14!YEChYX`B6IWG?m&3UG9CdGD.Ra%@j#;jFCB9:E+O)5@;]Tu@3B&u
DK]T3F(oQ1+E_d?Ch\!:+CJ\3?m&luAKYGnBl7Pm$6UH6@:Wn[A0>T(+A*b:/iFh#1,(I?C12!6
1+=>iAKYl/G9CR-G%D*i+<Ve7055<GAS5Rp0e[6YFCf)rE\]:^DKKH&ATBU\Ao)BoFD5W*1,!6U
Ddda%DJ(dZAo)BoFD5W*0fED^GA(Q*AThX*+EV:.Eb-A%Eb,[e+<Ve:BOPdkATJu9D]iM'DIIR2
+DG_8ATDZsCi^_5F<G:7E+*6uF!+(N6nTT)8LJ[m+CT),ART+p+D>J2+CQC&Df0`0EcYr5DBNn=
ARfFqBl@l3ATDg0E\7e.+<Ve+BOr<-ATDKnC`m82D/^V0DfT]'F<G^IF^]*&Gp%<LEbf_=B5_L%
B-:f)Ed(r4A0>?(F<F-t@;R,sDf0&rEc,H!+CS_tF`\a9Eb/[$Bl7Pm$6UH6A9Da.+EM%5BlJ08
+EV:*F<GdACht53Dfd+<Ddd0!Bl5&3Ch.*t+A*c"ATDj+Df0VK+BN8nC`mD"G%De<D]iS%G%l#/
+EMI<AKZ&(BOu$l%144#+EVNE@rH<t/g*nb<(/hjF(Jp"F!,RC+D>2,AKYGnASrW&Bm=3"+DG^9
CghEsEZdss3A*34@V'XiF"Rn/%14pE+CI<=2gT-n2etEhChbhOCLhC!1b`BbF)c)73+"jW+@C'b
F(o/rEZee$A8,po+CQC+@<6*)DdmHm@rri*@:O"fBlnVCFD,*)+EqO9C`me@DfTD3@3AK>5qOiL
2BZ[AF(c\?BOu'(E-68EBl7Pm$6UH6DdmHm@rucE+A!\aD'3q6Bl7^#DJ()#DJsW1ATAo3E-,f4
DBNG-A7Zlk0fNJ_FD,*)+EqaHCh+Z*ARTI!F*)>@AKYD(BOPsq+E)-,$6UH6?uU71?m'B.+EV19
F<G!7BOPsq+E)-??tX%m?k!Gc+<Z,^IXV_5+<VdL:-pQUGAhM4+DGm>E-67F@;]Tu@3B5lF(c\1
F!,OGDfTE"+DG^9@3BT%F(KB8ARlp)Ci=DJ%144#+<W?\0fL4oF`\`RGAhM4-OgD*+<Ve%67sBo
@<6*)BlbD,Df'H%Eb/c(FDi:F@;L't+ED%8EbT*.ARlo8+D#S6DfQt7Aftr!FCSu,AmoCiF"Rn/
+<VdL0H`)/+D58-+=DAOEb$O,$6UH6IXZ`p%13OO2(g"Z4C;Q9FDWgU13R2MG;j5XAN"=>H$O*X
0f4&\5%#L*-Z^DBBl%?'G%G]'F!,=.Gp$d/DJ()9BOu'(@:NeYF)u&5B-;D4DId[0F!,(/Ch7Z1
Df-\.EbT].F!+n$@qB_&ARlomGmt*'+<X]]:*=%bDJj#qFD5Z2F!,[?ASrVk:ei-IF!,C5AhG3*
BOu3q-Z^DJDfd+=F^o)-8l%ht@ps6tA8`T&DfQt;@;p0sA0<::ATW$*E[PF/.1HV,+<Y38Bm+'/
+C]J8+CJemG\M5@?m'$(ASuU4@;Kb*+ED%8F`MA@+>=pMDfQt$:ei-SBOPpmF!,:5CLoO9$6UH6
IXZ`p%144#+<Y9-G\M5@+=AfqC1_NtATfaa06:f8Eb0;FC2[W9C2[W9C3OT:A90A;C1\h&$6UH6
IXZ`p%144#+A,Et+Cf>4Ch+Z!D]iI2EHPu*CER25BleB-DI[6#@q]F`CERP5+EqO;A8c[5+EMgL
FCf<1+EqL1DBNY8+EM+*F!,UCD..C&ARl5W+<VeJBOPpmF!+jD06;&KAM8+<@<,p4AS>a1C3OT:
A90A;C1^j++<XWsBlbD@Bl%T.DJsV>BOu"!+D,P4+BD<6+DkP+E+NQ&A9)C-ATJ:f+<VeNBOu'(
<_uO6BlbD8AnEY)$4R>#/g+Oa?SaEY3+Qr>G\hYEF`h,)Ciaf=EAoj6E,]/J?m&E[F*&O4C2[X!
Blmp,@<?'g+E)-?D.-pM;]oLdA0>]&DKU1V+B3Pr@;@!"Aftu&ARo@_/e&-s$9'R[+CI<=2`GZ$
ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4+CT.u+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(
DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1F"SS/@:F:#BOQ'q+Cf(nDJ*Nk+DG^9Eb/`l
DKI!n+Eh=:F(oQ1F"Rn/%15'I+<VdL?p%e,0k>B<CLf.VH#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`
Bk1dq+CT)&Dg,o5B-:T2045o2F!+m6E+*j%+E2@4AncK4Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=
D0%<P<+ohcBQ%a!+Co2,ARfh#Ed8d;Df0`0DKKT2DBNk8+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#
FCeu*@X0)(A8-'l/e&-s$=I(LDIb>@De*cl?k!HVBleB7Ed;D<A26)VASu("@;IT3De'tB+Cf(n
DJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0eP7)/KcHc
BlGLDF`)52Ch7$rARl5W%144-+<Y'/@;BF^+Du+A+Cf(r@r$-.A9Da.+EM%5BlJ/:@rH7,ASuU2
+CSnkBl8!6+DGq=+D>2)BJ'`$%144#+<VdL+<Ve;Aj&0tD..3k+=ANZ+<XEG/g+\ID/^V+Cht5<
DfTB0+E)-?E+*j%%144#+<VdL+<Vd]2]usGCLnVMHTG\L+<XEG/g+Y;ARfKuA9Da.+CSnkBl8!6
+DbUtA8,po+D>2)BHR`k%14=),9S]n0eP4(/KdZ.Cj@-X1b9b)0JYI--r=JqD..<nDKI!pDe!3l
AKXEPBln'-DCH#%%144-+<X9P6m-AcG9Cp;EHPu9ATJtd-Z^D=AoqU)+Eh=:F(oQ1+?;&.1+j\0
/hf%'Bl8$5De+!#ARl5W+<VdLA8-'q@rri(AS,XoBln'-DK@EQ;f?Ma+A,Et+EqaEA9/l2Dg*=H
F(HJ)Bl[cpF<G+*Anc-sFD5Z2F"Rn/%144-+<Y',De*d(?m&lqA0>8pDe*cu?m',kG%De*AS#a%
@q]:gB4YTrFDi:8@;]UlAKYr'Ec#6&ASuT!$6UH6+Dbt+@;KLr+DG_8Ec5K2@qB0nBl5%c+?;&4
/g+P:De*cuAmca!D]ik7DJ*O$+Co&)FE2;FF!+(N6k'JG+<Ve:CghC++Dbt+@;KLr/g*`-+Du+A
+EM76E,9eB@r-()ATJu4E+No0A8,OqBl@ltEbT*++CT.u+ED%1Dg#]5%144#+<Y'+C2[Wj/0K%J
AKXT@6m-2]FCfK)@:NjkCi<flCh4`$Ec5e;FD,5.@UX=h+E1b2BJ(E8C2[X$DI<n\+<VdLEb0<6
DfTE1+CJnuDe*5uFDi:DBOr;q@<6!&E+*j%/g+,,AKYl/G9Cj9Ec#6&ASuT48l%ht@r,RpEt&I!
+<VeCDe!3lATJtB?t!egA1V/(De*Bs@Otr&De*]nCLo&*C2[X(FDl22/7E:3A9;a.Ci_.9C2[X*
FD5Q!.1HV,+<Ve8Eb-A2Dfd+3BOPdkARlomGp$L0De*d(?m&lqA0>8pDe*cuAmd56%143e$6UH6
+B38%@rc-hFCcS5EZfC6Ao_I(BHToC6m,uU@<6K4Ci<flCh7Z1H#IgJD09oA3XlE*$6UH6+<VdL
+<YK=@:UK.B4YslEa`c;C2[W1%13CJ+:SZ#+<Ve+BPDN1@q]:gB4W3"F!+q#@r$9sEb$;&Df'H%
FD53#AKYE!A0>o8DK?q7DBMP!F!+q'AoD^$+?;&4/e&-o%144-+<XBeDL!?s:IH=IATMr9F(96)
E--.DF`V+:DIIBnA0>],@ps1bF"SS7BOuH3G@bf++CfG'@<?'k/.Dq/+<VeKH#RJ-@;Kb*+Dbt)
A7]9oGA2/4+A,Et+=Ll6F=ASY/0JMKARfk)ARm>7@;]TuFD,6'+Co&"ATVKo%144#+<YcE+Cf5!
@;[31E$076F*&O5Ecc#-@:OD#/g+,,BlbD9@<?U&Ec*"DBl%T.DJsV>GAhM;+DG^98g$,H2@U!9
+<Ve8F!,:;@ps1bF!+n3AKYr'Ec#6&ASuT4F`)#,F)rI8G]7J5@qg%$Gp$U;ART[lA0><%+EV13
E,Tc*Ed98H$6UH6+B3#c+C\bhCNj3-A0>B#D/`p*Bjtmi+=LuCA8lR-Anc'm/no'A.3NeFEag.>
C2[X)ATMs0De!3lALS`2$6UH6+DkP$DKK<$DK?qBBPDN1E+*j1ATDZ2@;]TuD..=-+EV19F<GX7
EbTK7F!+n53XlE*$6UH6+<VdL+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8
D..L-ATBG=De+!.Bljdk#n74a+<Ve@Ci"68FE1f3AKY]/F!,UHAM,)kCht4d:IH=IATMr9F(96)
E--.D@<,p%A8-+,EbT!*FCeu*Bl4@e+<VdLBl5&8BOr;oIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1
ARHWhA7TUr/e&-s$6Uf@+CIQ176sgP:I7ueBkhQs?XP!d@;[2sAKZ,:ARlp*D]iP.DKKo;C`mn4
F*),/@;I&Y:IH=D@VTIaF:AR"+<VeIASl@/@;I&sF`M26B-;#/@:XF3+A$GnEaa!"+Cei$ATJu9
BOr<0ATD6&?t4"a@<-O0@WPp"D/!WrF:AR"+<VeJASbpfF<GIDD.7'sARlp+F(KA7Ci<flCh7Z?
+B3#gF!,1<+E1b0FD56-Cgh?uCj@.>Bkq9rGp$g5%144#+<Yc>AKZ,:ATAo0De!3lAKY].+D#D/
FEoJ]6?s\pATW$.DJ()"6VKp7;H?R[;d^_iD]g_VBl5%&$6UH6+=LuCA8lR-Anc'm/no'A.3M5Y
6m-\fCht53Dfd+BASl@/AKZ/-F*),/@;I'&De!3lATKIH=(ubi+:SZ#+<Ve76VKp7;H?R[;d^_h
ATT&:D]g_VEb03$@<?'k+=M&E@:UK.B4YslEa`c;C2[W1.3NGF@:XF%GA1l0+:SZ#+<VeFEc>]#
DBMPI6m-DWC1UmsF"SS$F!+t2Ci!g,Bl@m1+EqOABHVG=ATAo0De!3lATJu&Eb-A9DJX$&AScW$
$6UH6+EV:.+Co%q@<HC.+DGm>0eNnB#mh^`$4."]%14=),9S]n0eP1'idd487V-%LF^]<9+>GQ$
+>PW+1a"2AD_5F=@;0UjEZe(f@3B'&CiEf*7:^+SBl@l<%13OO+=\KV5p1&VG9C:3A7-NuE-,f4
DBNk:ASuQ3FD,5.ASuU(Eb-A4F`\a:Bk)7!Df0!(Gp%'7FD*9L<+oue%144#+<YB>+EM[8BHU_+
FD5T'F('6+DJ()0D_5F=@;0UjEZdq$D'3D,@UX:t@<6L$A0>K&EZf7<F<G[=Bl7^#DJ'Cc+<VdL
De:,+F<Gj?@<-E3@:sL2%13OO+<VdL+<VdL+>t?\A0<7.A8Yp*+AP6U+E)41DK?q/Cht54DBL?9
A8Yp,+E1b2BHSlLD..3kF!)l>A8Yp,+E2IF%144#+<VdL+<Vdb+E(d54$"a%E-!.CD09J6F`_>6
F!i)*67sC!E+Np.+CT)&+E)-?-tdL?.3NS<FD)dK+DkP&ATJtBB5ho@+E2IF+<VdL%144#+<VdL
+<VeFAT2!jC2[Wi4ZX]D-?!E;+AP6U+Co%qBl7K)BOPdhGp%0ADfTr0F`\a?DBMPI6m-2]FCfK)
@:NjkCi<flCh4_3%13OO+=\KV:1\VlFCfN8+Cei$ATJu&DIal"BOPdkATJu9D]iG&De*s$F*(u6
?m'Q0+DkP&AKZ)+F*)IGD/XH++E27>FCAWpAM+E!%14=),9S]n0eP.&/KdMo@WHU"Ed8cb/0H]%
1,L+%87?RQGp#gk87?RQAmo1\+@TgTFD5Z2.1HUn$6Uf@?q<R^873tk?qa!T:1,2QDIakt>"M4l
+DkOsEc3(=E-,f4DBNG-A7]g)@:Wn[A1e;u%144-+CJ`!F(KH$+EV%-ATJu&+Dtb7+E)4@Bl@l3
?q*pi6Ua^8;cH1`:dJ&O?m'Q)@<<W(DfT?!F!,R<AKVEh+<VdLE+*j%+DG^9FD,5.D..L-ATAo*
Bl%?'Bl8$2+EV:.+E2IF+Co1rFD5Z2@<-W9AThX&%144#+<YB1+EV:.+E2IF+Co1rFD5Z2@<-W9
BlbD);FNl>:JOSd?nNR$BOr<'@;0U%F`V+:De9Fc+<VdL?q*pi6Ua^8;cH1`:dJ&O?m'0)+EVNE
Eb0<'F<G[=AKY])FCfK1@;I'*@<?1(+DG^9?rBEZ6r-QO=^V[G+<VdLA8,OqBl@ltEbT*++EV:*
F<G7*G%De*AS#a%D/XT/A1eujAoqU)+D,P4@qfgn+E1b2BQG:*$6UH6+EV:.+Co1rFD5Z2@<-W9
D09oA+C\n)@r-()ARlolDIal1AT)O!DIm?2%143e$6Uf@+B)ubARf.h+D,>(ATJu4Aft#C5qOiL
2BZ[AF(f-++CT;%+Du+A+Eqj?FED)3+CoV8Bl7Q+%144#+<Y-%@r$4++CK.s@r#U_+E)41Eaa'(
Df0VK+<X-lEZeh"@r$4++>bhrFD,5.Anc'm+DGm>?o0WRBOPsqATKJGG][=&$4R=b.Nfj"+Dtb7
+CJYrCg\B(E-,f4DBNV$F!+q'ASrW)D/a<&D.RU,ARlp*D]iP'ARfKu@UWb^F`8I8Bl%@%%144#
+<Y**@;0V#F<G[=AKYYpF(f-++EMXCEb/c(Bl5&8BOr<-Bk1db@<*K&Bl%?5%13OO+<VdL+<VdL
+>Get@W$!)-S?bh+AP6U+>Get4Wm9];b.?)%144-+<Y'4ATMs(?m'?*G9Cp;F*)>@ATJu5@<-I(
@s)TrEZeh"@r$4+F!,17F*(u%A0>f&+DQ%?F<D#"+<VdLFD,5.CghC,+C\bhCNXSK+@0gbD_*#?
@:O(qE$/b,Ch7Z1@<,p%@q]F`CLq$!@:s"_DKBn/$6UH6+EV:.+D>2)BOu6-Bl5&8BOr;rDfTl0
F)Z&8A8,po+EM7-ARf.h+D,>(AKYE!A0>u-AKVEh+<VdLEb0<6DfTD3BlbD*@W-:/ARlotAftN"
Gp$d/F(f-++CoC5DJsV>D..NrBJ'`$+<Vd9$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(;+<VdL:-pQU
Eb0<6DfTD3CghC,+C\bhCNXS*$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(V0ejdn:-pQUEb0<6DfTD3
@UWb^F`8HX0b"I4+<VdL+<VdLEb0<6A0<71DIIBn-Ta%;+>Get+AP6U+ED%7FDl22+DGJ+DfTQ0
B-:Yl@r$4++D>2)BOu5o$6UH6+<VdL+:SYe$6pc?+>GK&/i#:,6#^jYC`kPc+>PW+1E\)EE,oZ1
B-9c`A8,OqD.RU,F!*n^Bln'-DCH#%%144-+CK(uG@Y)(DJs_AFCArrF!+k$E-#T4+=C&U<'a)N
5t=?k4#(+c@;]Tu?t=4tATT%B5uU-B8N8RT4#(+c@<3Q%AS,@nCij_-$6UH6+EqL1DBNG0ART[p
DJ()0ATo8-Bk)7!Df0!(Bk;?<%13OO+=\KV5p1&VG9Cj5Ea`frFCfJ8?q<R^846HP:gbDZ@<3Q#
AS#a%@:Wn[A0>u4+CJr&A8kstD0%=DC3*c8+B3#c+Co%q@<HC.%144#+<YB>+>GDiFEMVA+E(k(
+EqOABHSu]+BN5fDBLYV@3AK>5qOiL2BZ[AF(c\1F!,FBAS,Y$ARlp*D]j.8AKZ&9@<-H4De:,&
F_u(,$6UH6+EM%5BlJ08/g+,,AKYT'Ci"$6Bl7Q+FCfN8F!,(5EZen8D/^V=@rc:&F<G:8FCf**
BlnV]%13OO+<VdL+<VdL+Cf)#BOPsqA8Q9m@;9^k?Q^_F@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9A7]p:Bkh]:%13OO+=\KV5p1&VG9Ca2@rcK1EHP]+BkD'jEZea]:g$O[?m&rtA7Zls@<3Q#
AS#a%@:Wn[A0>K&EZdtsE-ZP:EZf7<FCep"DejDH+AQisAR]RrCER5'Ch7Ys$6UH6+Ceht+C\n)
F*)>@ARlolF!+(N6m->T@rcL/+EqOABK?S0+<VdL+<VdL%144#+<VdL+<Ve%67sC$ART*lDJsW.
@W-1#+CT.u+EMXCEb,[e+<VdL+<VdL+DGe?DIPai+E_d<3$<6Q@:UK.DJsW.@W-1#/no9MDIOt&
$6UH6+<VdL+<WK`E-67F-Z3jEAR]RrCL:dpH#@(=4%W7O:-r;rC2[Wi4)&YZDIO%^%144-+<XWs
AKYr7F<G+.@ruF'DIIR2+E1b2BHV#1+Du+A+DG^9FD,5.BOtU_ATAo'Df'?&DKKqBDe:+a:IGX!
+<VdLA9Da.F"SS)DfQt3G[YH.Ch4`2BOr;oC2[WnAThH(A8,OqBl@ltEd8d@@<3Q"+E1b2BK?S0
+:SZ#+<VdL+<VdL4$"a(De*BiFs(O<A0?#:Bl%i<%13OO+<VdL<+oue+E1b2BHVM-F!,@=F<GOC
AThd+F`VAE+EM47GA]#U%13OO+=\KV5p0WZB-:o+FE2;1F^nun+DG^9G%G]8Bl@l3-o!>./i#43
+D>2)+C\nnDBNG-EcP`$FCeu8+@.,\AS,@nCig*n+<VdLD.Rd0@:s-oG@>P8Bl7F!EcP`$FDQ4F
F(KG9Ch7$cBl7Q+FDi:00H`832BZs]F<DqYGAhM4-RW:EAmoCiF`M&7+=L/[7n>']%144#+<VdL
+:SYe$6pc?+>GK&/i#7+7V-%LF^]<9+>Po-+>PW+1E\)EE-WQm@;KauDf-[dA8-."Df.!5$4R=b
.Nh>+3A*!B+ED%2@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI+E(j73?^F<1a%!NF!+t+@;]^h
A0>u-Bla^j+<VeIAT;j,Eb/c(@3B&n@;]^h+EVNE?tsk&?m'Z,Bk(g!@rH4'F`_29+CQC)Ci<a(
Bl7Q+G%G]8Bl@l3DKTf*ATBC4$4R=b.Ni+e:eXGT8Q9(?G@>P8@WcO,ARlp+E$07@+>u&/+A$/f
H#IgJDImBi+Dl%;AKZ).@;[2G1a$=C@ruF'DIIR"ATJ:f+<VeFDBO4CF`JTs:IH=E@<?0*H#IgJ
@<,p%A8c1"B-;86D.Rg&Bl7Q+GB.V>B-AB,$4R=b.Ni,<F`_8;?m&lgC3=T>ARlp*D]iP'ARfKu
@VK^gEd8d;Df'H%FD52uCh\!:+>"^QBle?,A0>u-BlbD2DBNn=BlA#7G%G]8Bl@lA%13OO%14=)
,9S]n0J5+:+A-'[F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L++?;&.
1ad>eF`V+:De:+r7nlfc-tm^EE-"&n05#-@Ch[?2DfTJD.3N5@EZeq<FCf?#ARlp&Eb/`pF(oQ1
+DG_8AS5RpF!(o!+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dADI[U%E+*j&@VKXmFEo!<ATW--
ASrV_+?;&.1a$4EA0>i3BlA#7G%G]8Bl@m1+E(j78hLP[+<Ve!:IH=HFDl22F!,%=FCf?#ARlp&
Eb/`pF(oQ1+DG_8AS5RpF!,17+Co1rFD5Z2@<-W9@VK^gEd8d8C1_0rATM63+A*b:/hf*k$6UH6
@ps6tEb/Zi+E)(,ATAo)G][M7A7]9oBl8$(B4Z+)+C]J8+DGF18g$,H0JjnrEbTW,F!,%=FCf?#
ARlotDKKH&ATDi7FDi:0C1_0rATM5g$6UH6@rH4'Df0-(FE8RCCh.*t+A+#&+Ceht+Du*?Eb/Zi
+Dbt6B4Z*+FD,6&/g+,,BlbD?ATDj+Df-\+A7Ta(@q]F`CNCV?D]iG,F`_"B%144#+CJhuDdmcq
+CT.u+CJ`!F(KH$+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+De:,0AToeGCh+YtBl7@"Gp$X+
FC?;+DBNJ(@ruF'DIIR"ATKI5$4R=b+<X`O;GKeY7lhc7D]j1AB6%EkAKZ)5+EV:2F!,X;EcYr5
DBNk0+A,Et+ED%7ATT&?Dfp(C8l%htD..L-ATAo*Bl%?'@X1!D$4R=b+<VdL+<VeCDdd0!-YI".
ATD3q05>E9-OgCl$6UH6+<VdL+AP6U+C\bhCNXS=H#IhG+CfP7Eb0-1Cj@.DAS5^uFCfK(A0>Ds
@ruF'DIIR"ATJu&DIal2BQ\D>8g%Y_GA[is+<VdL+<VdL-nui`Bk(p$2'?gJ+=ANc+D,h<Blmo/
C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$6UH6+<VdL+:SZ#+<VdL
+<Ve%67sC$ATMs%Ec`Er+CT.u+D#S%F(HJ9BOr;uBl%@%%144#+<VdL+<Y9-Eaa$#+DPk(FD)dE
IUQbtDf0VLB4YslEa`c;C2[W9C2IC#FCfJFBkh6-%144#+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbt
Df0VLB4YslEa`c;C2[W9C2[W8BkhN5%13OO+<VdL+<VdL:-pQUEb0'*@:UL&BOr<,AS5^uFCfK(
A0>Ds@ruF'DIIR"ATJu5@<lR)B-:W)FCf?3Bl@l3%144#+<VdL+<XEG/g,7S+CT/5+C]&&@<-W9
Bl7F!D/`p*BjtdmBlnVCD.Rd0@:s.m%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%144#+<VdL
+<W?]3\W6B+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgCl$6UH6
+<VdL+AP6U+EVNEF`V+:Derr,-t6b"DfTD33A*!B.3N/8@ruF'DIIR"ATJu>Dfm1HBl%T.BOQ'q
+EVNEF(KG9FD,6&+:SZ#+<VdL+<Ve%67sBY76s=;:/"e5Bl5&%DBNk6A7]d(G%G]8Bl@l3De:+a
+CT.u+EV:.DBNt2B5)F/ATAo-DBMOo3A*!B%13OO+<VdL+<VdL:-pQUF(KG9A8,OqBl@ltEd8d*
76s=;:/"e5Bl5&%DBNk6A7]d(C(1Lm+<VdL+<VeFA0<7<Ch.'j@rs(-$6UH6+<VdL+CoG4ATT%B
;FNl>:JOSd-OgCl$6UH6+<VdL+AP6U+EV:.DBNY2+CQC1ATo7F8g$,H0Jk:/+A*bsAS5^uFCfJ8
%144#+<VdL+<Y]9B4N,4DerrpBk)644""N!06_)@Eb-nLDfp(RA8,Oq055JT%13OO+<Ve%:K0bD
+DGF1H#IgJ@<,p%Df0B:+DG_8ATD@'FCeu*Bl5&6F`))2DJ()%F`MM6DKI!n3A*!B+CT.u+Dtb7
ATA4e+<VeMATDj+Df0V=De:+a/g+;8FWb1&DBNJ4D/^VCDfp(CA8,OqBl@ltEbT*++CT=6A9Da.
+EM%5BlJ08+CT.u+ED%0Ddd/c$6UH6FD,6&+DG^9DIn$.Gp$U;ART[lA0=Je3A*!B+Co1rFD5Z2
@<-'nF"SS7BOr;Y:IH=B@;^3rC`m;6E,8rsDK?q6Dg*=GD]iS/+EV:2Et&I!+<YB9+EV:.+=^?5
Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q".Ni/=E+NotBm;6Q%13OO+=\L++?;&.1ad>e@q]:g
B4Z-,FDi:DBOr</F(HJ4Afu2/AKZ#)B6A$!EZeq<E,oN2F(oQ1+Dbb$Eaa!6+CJ#5;FN?K+D,P4
@qB0nF)Po,+:SZ#+<Y*'C3=T>D.RU,F!,RC+CK57F'pUC<GlM\De*E%@q]:k@:OCjEcW@3Eb-A8
F`MA2A0>f&Afu;3FD)e)Ed2_KAiLne?m'E/BlA#$$6UH6FDi:0Ed2Y5+EM+&EarcoF"SS7BOr<-
ATW$.DJ()5BQ&$0A0>>m+ED%7FDl22A0>;mFCfJ8?ugL5?m'K4DK?q0F`\`t+EqaHCh*t^+<Ve8
A9M[.AKYJrARfLiDJ()(DfQt1EbTW0@ps0r@rGmh/g+,9Ec,T/B-;,)Aft)kBk)'lAKYhuGp$p;
D/")78l%i&F!+n#Bl%L*Gp!P'+<VeKD]iS%@;I'1Bln#2F)Po,+CoD#F_t]-FE8R6F`\`u-Z^D1
DJ<U!A7Zm)F`;;<Ec`F;@<3Q"Cj0<5F!,F1Ecc#(Cb?/(+<Vd9$6Uf@?o9'FA0<6I?m&lgC3=T>
ARlp*D]j+>Ec`FEAS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=b.NhW#B4Z<1ATDg0EcW?OATDg0
EcW@;DBO%7AKZ#)B4Z<1AU&07ATMp,Df.!HDJs_A%144#+EVX4E,]B!+CT.u+Cf4rEbT-"ARmhE
-Rs=\Df028+ED^J+FPjbA8Z3+-RT?1+<Ve'EbTH4+A,Et+Eh=:F(oQ1F!,:1F<GU8B4Z<1ATDg0
EcW@9D]j.?+EV:.+EVO@+DbV4AS`K2Ea`o>%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%
1,0n":MjfUEc5h<<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1
F"&5?A7T7^+>"^WARuulC2[W8E+EQg%13OO+=\KV@!-O%A7Bgl+Eq78+DG_'DfTl0@ruO4+D#e-
Cis9&DJ()0@;TRs+EqOABHS[0-Qm,@+ED%7F_l/@/g(T1%144-+<X'dEb/a&+CKPC?m%'S/g+PM
I:+1.AS,XoBln'-DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg+<V+#+:SZ#.Nfj&A8--.
@rH4$@;]Us+Co2-E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:EcW@FD]iJ)Ci=M?@WHC2F(KA7
E,T\<F`;CS%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc
@ruF'DIIR2+@:!bCEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$FCei&E+*WpDdtFo@8pf?+C\c#
ARlooDe!p,ASuTuFD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b+<Ve2<HDklB-:r-A8Gt%ATD4$
AR-]tFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$
AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl6#C%VDf-\:EbTE5ARlopA8-."
Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO3
3))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8p
De(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&
ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUh
BHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`
;b9_,CLqc6?pZP,9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&S
BleB)DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[
A1e;u+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&%13OO
+<VdL<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI5
$4R=b.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#EbT*+
%144#+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76
E,96#Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,
/g(T1%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE@")U(
DJ!Tq>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c/hen3
+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&
Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#
DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,
GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVC
BlbD7Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>
F`8W^0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@
DfTqB0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'
+Co1rFD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,
Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/
$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-
FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(
Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b
.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=)
,9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78
Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e
8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3
EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P
2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg
%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV
@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA
779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'
ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-pp
D]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"
+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>
AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%
+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn
$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4
Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%
7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s
$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn
$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6
:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg
+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(
%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;6TQl#F(KB5
05>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3
C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq
+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<Z,"9M\/3<+T0D
E`[4)D/:h=C3'gk+<V+#+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%
A8c@,/e&.1+<VdL+<Vd9$6UI1Ci=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#
%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G
0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNE
AncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:
+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/
+Dkh;ARlolF)u&.DJ`s&FE9&W+:SZ#+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%
3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of
+C,E`+<VdL+<VdL.1HV,+:SZ#.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#
AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7
BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3
Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn
3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[
+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$6UH#
$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;i
EbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1
FED)7DD!%S+:SZ#+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-
+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG
+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc
+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL
+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?
DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>
+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;s
C2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H
%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&
F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("
@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWt
F`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG
/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2
+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,
D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL
+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_
+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_
+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6
F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO
+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(
FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@lt
EbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u
?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5
DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=
@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'
DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2
@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(
@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'
ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!
+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5
E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuR
De!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/
ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdh
Ch7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG
/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c9
4ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt
$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL
-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL
+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL
+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6
+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$
+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdL
ARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgT
FD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0
B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(
8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*
A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.M
ASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNE
GA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'
ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0
F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL
+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsG
F"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`
+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%
D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&
FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6
+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^
+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG
@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$i
A0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O
+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1r
FD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdk
ARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*
@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4
D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.
+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9
+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1
@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL
+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&
AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ
:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6s
BkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'
@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7
+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3
+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2
DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k
+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1r
FD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE
@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9
Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8
AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@
BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A
?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo
+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-
De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(
G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*
0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"p
DCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:C
F`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(u
G@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?
Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2
@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$
+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]Xg
AKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6
=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+
G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&
F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7
<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a
+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u
6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/
E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5S
A8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU
0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/
F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>
Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7
Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF
1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?
+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0
Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-s
FD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi
@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;k
A7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8
+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC
+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/Zi
Bl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.
@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%
7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*
+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#2
8jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>
@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08
+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[E
E,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3
Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`
F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(
%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeD
F`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(
F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR
6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,
+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aG
F)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-
AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:
FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe
?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'
DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%
IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB
+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-
+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=
De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FA
ARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&
ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho
@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=
$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,
ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VL
B4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%
0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$
FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dC
CLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97
EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#
.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-
+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeK
AU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-
DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X
1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'G
F`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&
FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%
@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F
-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@
ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*
ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%
+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3
AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s
/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$
BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%
E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo
@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2
@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'
DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ
6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#
+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1
$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6
DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9
A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-
+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9
EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E9
05>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,
EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUg
F_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg
+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)
G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN
+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu
+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@
Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,
-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E
%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:g
B4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9o
FDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6
DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL
2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU
0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6
ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1
Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUj
F)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et
+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#
FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%
F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@
%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$
A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*
CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#
+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFi
F!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<
BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"
+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>
AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeK
BOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=)
,9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;u
A0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ
@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%
EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj
/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?
+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9
Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF
%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@
Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6
BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+
BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH6
8K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj
/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<
Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]gl
EbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#
Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+
DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E
0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSB
DJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgL
FCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$
EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMm
F*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*
DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgF
De*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&
Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>
E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$
A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@
?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5
?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#Lc
AM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&
DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOA
A1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@
Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@
?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!
AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30
AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kst
D0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0
Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&
@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,
Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A
@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9
A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj
/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5
DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+
%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn
/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlok
C2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO
+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%
GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3
Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK
%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE
>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi
6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`q
DId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!
DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T
+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-
D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>
AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*
ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*
+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU
0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t
@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].
Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYp
A0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y
5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-
F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.
FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'
Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL
+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%16c_F*)>@
H"q8.A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hnt7+>"]aGA2"F+E_RBASbpdF(Jkk$4R=b
.Nh-%D/^V=@rc:&F<G7*F))n.BOt[h+Du+>ARlotDBN>(@;BF^+EM+(FD5Z2/e&-s$6pc?+>GK'
/i"P$+A-cmGp"gu/0H]%1,L+%:h=Za@;]XoF<GC<@ps1b+D#(tFD5Z2.1HUn$6Uf@9keK`EZeq(
BlnD=@;]Tu@:Wn_FD5Z2F"SS7BOr<&De!3tBl@l3De:,"C2[W8E+EQg+A?3CAQTBK+<Ve@F!,@=
G9CC(Ci!Zn+E)CE/g+&'An?!oDI[7!+EVNE8ge[&@V'.iEb-@R/hf%'BOQ'q+C\nnD@Hpq+<Y]9
D/XT/A1eus:IH=CDg*=EAT;j,Eb0;78g$,H0JXbhEZf1,FCfJF%13OO,9nEU0eP150d&%j7V-%L
F^]<9+>GQ$+>PW+1a"2AD_5F=@;0UjEZe(f@3B'&CiEf*7:^+SBl@l<%13OO+=\LADe*5uF(Jj'
Bl@l3ARoLsARloqDfQt<ATo8)2BZpK?m'B,FD5Z2/e&-s$6pc?+>GK'/heD"+@]pOEckf2Gp"sq
+>PW+1a"2;@<6+-+AH?:@<6*o@:Njk7:^+SBl@l<%13OO+=\L/ATo8*E,]B+A8-92Df-\<F`))2
DJ((a:IH=IATMs7+CSekARmD&$4R=b.NhMrF)Pl+FCcRe2BZXQ@;omo@j#f'D/XT/A1e;u%144-
+@BgNDJ*O%+EVNE?t+"i?n<F.Eb0<6A7-r2?uTOaCLgfqFDi:>DffP5FD,5.@:Wn_FD5Z2%144#
+CT.u+E_a:+E(j7;b02+1,Us4@UWb^F`8IEBk1db@<*K&Bl%@%/e&-s$6Uf@?q<R^873tk?qa!T
:1,2QDIakt>"M4l+DkOsEc3(=E-,f4DBNG-A7]g)@:Wn[A0>u4+EV%$Ch54.$4R=b.NhH"DJsP<
Bl.g0Dg#]/ASuU2+EVNEE-6&?F^nj%Bl@l3/Kf.KAKZ)?E,Qk6BkUpc+DGm>Df03+Bl7Q9%13OO
,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@
<+ohcDfTB"EZf:4+E)4@Bl@l3@rGmh+EV%$Ch7Z1Bl5&%E,]B+A8-9274o]r@<2kb+<Ve9AS#a%
@q]:gB4YU++B3#c+DbJ,B4Z*+FCAWpAKW]_+DGm>DJs_ADf-\++EM77B5D,g$6UH6E+*Bj+EVNE
Ch7$uAKZ&5@:NjkAoD]4Ap&3<Eb-A'De*F#/e&-s$6Uf@;f?Ma+=_MOA8bt#D.RU,ARm85@rGmh
F!,.)G%De*AS#a%@:Wn[A0>u4+EV%$Ch4_D1+j"C%144-+B3#c+D#G4Ed8d>DfQt.A8lU$FC65)
@<3Q#AS#a%@:X+qF*(u(+EVNEF(fK9+:SZ#+<Yc>AKYl%G9C9a5uU<B<D?:t+E1b0@;TRtATBC4
$4R=e,9n<c/hen51E\7l8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b
.Nh)sD/aE2ASuT40eskcDBN>%GAhM4F'p,.Dg*=;Ders*+EV:.+A*ba3?^F<1ghGIH#n(=D'3nA
EbTE(/g+,,Bla^j+<Ve?ASc=,+A,Et+Co%lC`mq9FD)e=BOr;qBl7@"Gp$g=@rH4'@<?3mBl%L*
Gp$R-FE_;-DBMOo3A*!B-Z^D=DIal$@<-0uATA4e+<Ve!-Z^DAG][M7A7]9oE,oN"Ble!,DBNY2
FCf)rEcWiB$4R=b.Nh)sEcP`$F<Ft"@Wl-%D/X<#A0><$B6A'&DKI!Q+E).6Gp%3;CLqQ0@q]:k
@:OCjEZf14F*)IU%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<<ag#_
@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuul
C2[W8E+EQg%13OO+=\KV6tp[Q@rri(AS,XoBln'-DBNA,E+NotBm:b/A7T7^/e&-s$6Uf@+DkOs
:K&o?Bl8'<+E1b2BQG;)A7T7^+EVNE@rH6sBkMR/@<?4%DBO"3@ruF'DCuA*%14=),9S]n0J5+'
/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<
%13OO+<W-V:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@lt
Ed9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#t
DegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@
DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.
+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`
:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO+<W-V
:1\Vl8p,)uFCfJ8CggcqE+EQ'@:Wn[A0>8[F(oN)8oJ6VBlmp,@<?'5E+EQg/Kf+GAKZ).AKYMt
Eb/a&DfU+4$4R=bC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=)
,9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+<W-V
+B;<5F!,17+CJr&A1hh3Amc`uDe*QoBk:ftFDi:EF(HIb<)c[m+DG_7FCelk+E(j785rPb/e&-s
$6UH@+Auc_ATD@"@qB^(FDi9o5tiD2BOPdkARlp*D]j1DAKYr#@r5Xl+DG_7FCelk/e&-s$6pc?
+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+<W-V
?t*b[FC65#@:O(qE$/e)F<GX9@ruF'DBN@uA7]:(+:SYe$6UH@+<YW6Afu8.EcYr5DK?q=Afs]g
E-ZP:EZf1,@WNZ#A7T7^+>"^WAS!!+BOr;sBl[cpFDl2F%13OO+<VdL+<VdL+<YE<@<?0*-[oK7
A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.
+>PW*3=Q<)$6UH@+Eh=:F(oQ1+C]J1E$/b2EZdss3A*!?+C\o(@3BMtFCSu:%13OO,9nEU0J5@<
3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6UH@+CK57F'p,3ARfgr
Df-\+A7T7^/g(T1%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+<W-V?u9dt?m'N%
@ruF'DBN@uA7]:(%13OO,9nEU0J5@<3B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6
@<?'0%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO
+<W-V8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97
EZdss3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%
@;p0sDIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*
F<G[D+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pO
Eckf2Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bB
D]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s
$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<
3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2
+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t
+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9
D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5
DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.
ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lq
A0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je
@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>4
2(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E.
/ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO
,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF
@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b
+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*
FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dC
CLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?
%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$
A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b
/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+
Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+
1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0s
DIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b
/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh
+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4
+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn
$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3
@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<
%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr
/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3
F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%
Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&
/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA
$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m
+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=
BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2
F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:
BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-
Eb/a&DfTQ'F"Rn/+:SZp@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc
8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP151E\7lA7]p3%15R#9LM<I4ZXs'
ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O
=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(
Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&Ik
De*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg
05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16ig
A7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5
/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9
@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn
$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6
+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*
@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/
A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*bt
H#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ
+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.
Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[
6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y
:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;
A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t
+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT
@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo
%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`
+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7
E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%144#+D>k=E-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUgF_t]-F>%TDAn5gi05>E9/oY?5
%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ
8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5./i+V%+Co&,-OgDP:J=/F;E[&g
B4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#
$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)d
A7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi
$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi
$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>
F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%17&bAn5gi03*(-
DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^
+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A
%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.
@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.
A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO
7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]H
EZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-
AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-
DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#2
6=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]o
F*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`
78d&U:JO&6-S[5./i+V%+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV
;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!
%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)
F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]
6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2
+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*
Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*
Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s
$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm
@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"
ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0
AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7
:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"
FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6
/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sI
C3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%ht
Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.
+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4
ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR
%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$?^6,AS5^uFCfK7ATMs71,2Nj/h2!]Eb/lt
F*(u6FCfN8F!,NU/Kf1REb/ltF*(u6+EV19F<G+.@ruF'DIIR"ATKI5$4R=u+ED%+A0sJ_-s[r?
INU-n00gp5FCfN8C2[W1-:KO9-9`k$I4cX\A0<6I                                  ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)cX<+>P&o2'=Y6+>PVn1G^..0d&2,+>GPm1,pC21E\J3+>GSn1-$I33?U(6+>Get1Gp:02'=Y6
8l%iA<CokP84c`Z:Jt>9ARf:hF<F1O6m,r]Bl%<&BPDO0DfU+GCi<rY:IJ/X:J=\R<CokP84c`Z
:Jt>9ARf:hF<F1O6rZrX9N*'CF_PZ&+D>J1FDl2F+Dbt/<)5nX?V4*^?Ys=G:IH=IDe*c/Ch[s4
BPDO0DfU,<De*KlDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed;>4F*)>@H"q8.A8bsjASu("@;IT3
De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU,?@;]dkATMs.De*fq@r5Xl+DkP)BkCptF<G16EZdtM
6m,oKA8c@&@;]dkATMs.De*Bs@s)X"DKK`(DJ<]oF*&O:DfQsm:IITH6WHiL:/l(=DJ<]oF*)/8
A92[3Ear["@:O._DBNe)DJ<]oF*&O:DfQsm:IJ,W<Dl1Q+CSekDf0]8Eb/ltF*(u6FCfN8F*2A@
AS5^uFCfJ8FCfN8+Co1rFD5Z2@<-'nEr                                          ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE BYTESIZE CNMFDLOG CNMFMARK CNMFPARMDEFS CN'
zz=:zz,'MFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF DEFAULT DEPENDENTSEND D'
zz=:zz,'EPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMI'
zz=:zz,'T ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ER'
zz=:zz,'R010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019'
zz=:zz,' ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 ERR'
zz=:zz,'029 ERR030 ERR031 ERR032 ERR033 EXPLAIN FREESPACE GROUP HASH HASHFS'
zz=:zz,'X HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IPYNB I'
zz=:zz,'zJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME JODPR'
zz=:zz,'OF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF MACRO'
zz=:zz,' MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS NVTABL'
zz=:zz,'E OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK009'
zz=:zz,' OK010 OK011 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS '
zz=:zz,'PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEXT UNION U'
zz=:zz,'TF8 WORD XML ZIG abv afterstr alltrim badappend badblia badbu badcl'
zz=:zz,' badfl badil badjr badlocn badobj badrc badreps badsts badunique be'
zz=:zz,'forestr bget binverchk bnl boxopen catrefs cd changestr checknames '
zz=:zz,'checknttab checknttab2 checknttab3 chkhashdmp clearvobs createjod c'
zz=:zz,'reatemast ctl datefrnum dblquote decomm defzface del did didnum dnl'
zz=:zz,' dpset dptable empdnl fex firstone fod fopix gdeps get globals glob'
zz=:zz,'s grp gsmakeq guids guidsx host hostsep isempty islocref jappend jc'
zz=:zz,'r jcreate jderr jdmasterr jnfrblcl jodinit jodsystempath jpathsep j'
zz=:zz,'read jreplace justdrv justpath jvn lfcrtrim locsfx make makedir mar'
zz=:zz,'kmast mnl mubmark nc newd nextbaknum nlargs now nowfd obidfile od o'
zz=:zz,'k packd plt put quote read readnoun readobid regd remast restd rv r'
zz=:zz,'xs rxsget rxssearch saveobid second sha256 tc trimnl tslash2 tstamp'
zz=:zz,' uses valdate wex wrep write writenoun''),<<;._1 '' jodon jodoff jodo'
zz=:zz,'n''                                                                 '
zz=:1811{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&q+>Yc-2'=b!2`#2eA55HD+=_,EA0>A6/Ken=Bl5%c:IH=9Bk)7!Df0!(Gp$U5@<6KB
%15is/e&._67sBHCht54FD,6++Co1rFD5Z2@<-W9@r,RpF(KD8@<,p%AU&<.DKBN1DK?q=Afu2/
AKYMt@ruF'DIIR2+Cf4rF)rrC$;No?+B3#cGp$O3C`mkAAKZ&9@;]UaEb$;&Df0W<@;^1.+CT.u
+Eh=:@WNZ&AS,XoARlotDBO%7BlbD,CghC+/e&._67r]S:-pQU6ZQaHFD5W*+CQBb:IH=D@VTIa
F<G+*Anc-oF!+m6-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is/g*PnF*)G@H"h//+CQBb:IH=D
@VTIaF<G.8@<6"$+EV:.+=Lr=De(:>Ci<flCh4`'DKKH1Amo1\/e&._67r]S:-pQU6Z6ja@;0V#
3ZqsI@ruF'DIIR2+E_d?Ch\!*ATKCF@rH7+FCB'/F"AGJDKKH1Amo1\+Eh=:@WMtc:-pQB$;No?
+A$HmATDBk@q@\D.!B0B@WNZ/@:Wpl@<Q'nCggdhAKYH-+DGS/A0>],@ps1b.1HVZ67sB'+CS`&
+<VdL+CT)&+C\bhCNXS=G%G]8Bl@l3DIIBnF!(o!:-pQU+<Y-+ATT%;+<Y<.F<GL2C1UmsF!,(8
Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+F!(o!:-pQU+<Y-2C`jiC+<Y-%@r$4++DtV)AKYf'F*)IG
Ao_g,+E1b2FCfK1Et&IO67sB'+Co&"+<VdL+Co&"ATVK+GAhM4F"AGUATMs7/0JSGDfp#?/0Je<
@rcL//0JMG+Ceu)ATD2g$;No?+<Ve;Bk/>/+<Ve;Bk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2%15is
/g)8ZA8Z3++<VdLA8,OqBl@ltEd8dF@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;E-#T4
+<VeJATVu9A8,OqBl@ltEd8dH@<,dnATVL(Et&IO67sB'+D54rE-!-E+Dbb5F<G4:Dfp"A@;]Tu
F*22=AKYMpE+NotASuU2%15is/g)8ZB4Z0-+<VdLB4Z0-GAhM4F"AGUATMs7/0Je<@rcL//0JMG
+Ceu)ATD3%Ao_g,+Co1rFD5Z2@<-W&$;No?+<Ve>Ci<d(+<VeNDfTA2@;]TuFCfN8+D5M/@UX'q
DIIBn+ED%*ATD@"@qB]j$;No?+<Ve>Ec<-D+<Ve:Eb/[$AKYE!A0>l7ATE&=B6%p5E-!.1DIal2
F_Pr/Et&IO67sB'+DkP&AKW*<+D58'ATD4$AKXSfF(96)E--.D@;]TuA79Rg@UX=h+CoV3E,uHq
:-pQU+<YN=C`jiC+<YN0DL!@8Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU
+<YQ5G@Vg=+<Y07ART[l+Dtb7+Co1rFD5Z2@<-W&$;No?+<VeFA0<!;+<VeFE+Np.+CT.u+Cf5+
F(KD8A8,OqBl@ltEbT*+%15is/g)8ZE+*6lA0<!;E+*6l+Co1rFD5Z2@<-'nEt&IO67sB'+E2IF
+<VdL+E2IF+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+DG_8D]iS)@ruF'DIIR2%15is
/g)8ZEb/lo+<VdLEb/ltF*(u606M/QAS5^uFCfJ8@3B)p@ruF'DIIR2%15is/g)8ZEb0<6A0<!;
Eb0<6DfTD3CghC,+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA17rp:-pQU+<Y]LF!)SJ+<Y]9B6A$!
EZeq<E,oN2F(oQ1+EM+&Earbl$;No?+<VeLF(KD8+<VeNDfTB0+E_a:A0>?,+EqaEA9/l%DIal3
ATMs7%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'+D#S6DfTnA0JG14
0Jkd=%13OO@rGjn@<6K4+=CT4De(4)$=e!gDKBB0F<DrFC2[W1%13OO:-pQUFCB6++CSekDf-\6
Ddd0fA0>JuEcZ=FAoD]48g$,H0JO[Z$?B]tF_Pl-+=Co9Bl%@%+ED%+AU#RF+:SYe$;No?.V*+0
ASu$iDKKqBGV(KiGAhM4F!,")Anc-oA0>T(+EV:2F!,O8@ruF'DBNV$G%De:ASbdsARlooAS,Xo
Bln'-DK?6o%15is/g+hGF*&OGE+NNnAnb`tH6@$B@ps1b+Du+?DK?qAATT&*F`M26B-9ehE,ol/
Bl%?'Ci<`mBl7Pm$;No?+=J]g4ZX]W7TW/V+B;0&9gp0r7S-BS%13OO:-pQUCh[cu+D,1rA1Sj5
@<-C&@:s-oEb0?8Ec*ENFCAW$@;]TuCh[cu+D#G$Et&IM7Qide0RI4\%15I#4ZY;RHXSN9$<0;X
4ZYTM@4hur6W-TI4ZYr./5/MB$4R>;67sBt@:O=r+EM%5BlJ/:DfBf4Df-\-De*F#+>"^XD]iJ!
A0>`-Eb-A%A7Qfk+Dtb7+E(_(ARfg)@rGmh%15is/g+S?A0>`-A8,Y$+EV:.+D,P.Ci=N3DJ()&
AS,XoBln'-DBNk0+AG-h;GU7p:dkg#8lJ)T8PiAL3\iE!$;<`b79D]61,9:G85r;W4ZY>S%1633
9KbEl1^sdk79EMP3\iQ%$:7lp76N[e2@U!f5uL?D:KL:S3\iW'$<:%p3'B;X3"63k=]@pf:-CWn
3=Q<o;+s,61GB7F8lJM\4ZYAR%15['=\_:H3\rN#$;<lS:-CWo1CX[p8Okp)1GfOJ%15is/g,">
@rcK1FCf]=+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@
9gMZM6r-lZ/6,Y=3%Rm/<(Ke[/5oD>/4ri::+St5=\_:79LV6B/6YV8%13OO:-pQUDdmHm@rri'
De*F#%1604;FEZ/0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQU
A8,OqBl@ltEd8dKASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu
@r,RpF"AGEAT23uA90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3
<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB
6W?fJ%16QQA8bpl4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*
A7]RkD/"*'EZek*@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*
+A#%(8PUCT+=AgI-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%W
ASkmfA0<O1+Cf(nEcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI
-n$K87TW/VHRE&O-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,
+E;O4Ch[KqARloqBl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P
-TWV%4XhL'/g+@Z+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3
F(KA7Ci<flFD5Z2Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0
%15is/g,=KEag/*F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dE
C2IC#FCfJ?%15^'6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90
C2[X(H#n(=D/`p*BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X$
DGEMN.V`m4Df-\=/M/)aCgggbF!)lGDe*d(.3N&:A0<:8De*cuAgnj:DBO6JCi<flCh54.$4R>P
De!p1Eb0-1+=DI_%13                                                        ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P&q+>Pes2'=\8C2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[X$DK'E#@qB^(-u*[2
Df.!H@;]Tu-u*[2De<T1+DG^9H6@$B@ps1b                                       ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodpreparetests createtestdictionaries loadSmoketest0 loa'
zz=:zz,'dSmoketest1 loaddumpSmoke00 loadtest001dictionary loadtest002dictio'
zz=:zz,'nary loadtest003dictionary loadtest004dictionary loadtest010diction'
zz=:zz,'ary loadtest100dictionary''),(<<;._1 '' jodsmoketests abvSmoke00 addg'
zz=:zz,'rpSmoke00 bgetSmoke00 bnlSmoke00 bnlSmoke01 bnlSmoke02 compjSmoke00'
zz=:zz,' compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeMacr'
zz=:zz,'oTexts docSmoke00 dpsetSmoke00 edSmoke00 etSmoke00 gdepsSmoke00 glo'
zz=:zz,'bsSmokeAssign000 globsSmokeDD00 globsSmokeDoc00 grpSmoke00 jodageSm'
zz=:zz,'okeDays00 jodonSmoke00 makeHashchkSmoke00 mnlSmokeArgs00 newdSmokeB'
zz=:zz,'adArguments00 noexpSmoke00 odSmoke00 odSmokeArgFail00 putMaxnameSmo'
zz=:zz,'ke00 restdSmoke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''),<<;._1 '''
zz=:zz,' jodstresstests getStress00 macroloadStress00 makeHashchkStress00 m'
zz=:zz,'akeStress00 packdStress00''                                         '
zz=:830{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o2'=\5+>GYp1bp1.1a"Y3C2[X%Eb02uEb0?(F*)J5Eb/[$ATJu&DIal+Ddd0t+EV19
FE8R8Bk)7!Df0!(Bk;@#De*p+Deip+ATMs7G%#E*Dfp+DF)>i2AKZ)+F*)IG/Kf4JEd8d:@<6-m
+D,b6@ruF'DKBQ2A92j5ATMp7ATMs7G%#E*Dfp+DF*)G6F)rIGATMs7+>"^P@<-!l+C]J8+Du+>
+CfG7F(f9*B-;A9CisT+Er                                                    ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkiU;D9m^+@T1+0JbL-8U=!)6tpO\ATDBk@q?cSH:gt$FDl)6F!+&#8l%it
FD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r:IJ5X6m,8u0JP:)D..3k-RgSp4?P\X?SNZN+Dbt)A9;C(
F>5I'A8,OqBl@ltEd8dE@;BFF@<6*lBPUO`Deio<0Hb4@CLp%FF(f&sCK#=qATMoH0Hb7OAU&/m
D/X3$0JFk'/1<VC4"akp+=A:HDe'u*De*d(-RgSp4?P\X?SNZN+DPh*E,oN/@<,q$ATMs7+DPh*
F)>i2ATVL)FE8R>De*p2Eb0<5FCfN8F!iCf-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX
9N+8X8PDNC8Q/Sa;HY,A:IIuc8l%i^D.Fc&BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#D..<rAn?%*
C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*C2[X(Dfp)1AKZ,5Eb/ltF*(u6FCfN8F!iCf
-p07-3@$@61,L[D0fL^A1GpmI3&EBK1*A>+1,L[D0fL^A1H%3H1c-p@0d&5*1,L[D0fL^@3&EHG
2E3TO2BXb/1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D0fL^@3&EHH
0K([B2'=Y.1,L[D0fL^@3&EHG2_m-D1E\G,1,L[D0fL^A1H7BT1,UjD3$9t11,L[D0fL^A0JtXG
0f_$F3?U(21,L[D0fL^A1GpmI3&EBK1*A>+1,L[D0fL^A1H%3H1c-p@0d&5*1,L[D0fL^A1bgpG
2)I0G2BXb/1,L[D0fL^A1bgpG2)I0G2BXb/1,L[D0fL^A1bgpG2)I0G2BXb/1,L[D0fL^A1bgpG
3&<QL3$9t11,L[D0fL^A1bgpG2)d3H3?U(21,L[D0fL^A1H7BT1,UjD3$9t11,L[D0fL^A1H@BM
1bgd@0e"Y%4>J$9,Vh&/1b^jC3%d'H1G^aG1c@981,(I?0K1^F/iGOB3&!<J1Gpm01,(I?0K1^G
/i>UK3AW?L2)ud70JYI=2_d<F1c76K0eb=A2E;m80JYI=2_d9E2)[HR3B8lT2BXb/1,L[D0fL^C
2D[6F2E!?H2'=Y.1,L[D0fUdC3A`]M2D?sA1*A>+1,L[D0f^jD0f^sK2*!EL1ast(4>J$7,Vh&/
1b^jC2_Hp@3AWEL2`*6J+>PW+1b^jC2_HmG2)R0H3AiTK+>PW+1b^jC2_HpC3AE9D2`NQP+>PW+
1b^jC2_HmG2)R0H3AiTK.4cl01*A@u1,(I?0K1^G/i>XI1c[NP2_[361,(I?0K1^F/iGOC1,:gJ
3B&c;1,(I?0K1^G/i>UK3B8lM2D?m/1,(I?0K1^G/i>XI2D?g?0K:m31,(I?0K1^H/i>@=3B/oR
3&*021,(I?0K1^G/i>UK3B8lM2D?m8/1<V9+?:]&0JYI=2_d6D1H73J0ebL@1Gp:10JYI=2_d6D
1H73J0ebUJ2BXb/1,L[D0fL^A0JPL@3&`WR1a"P-1,L[D0fL^C2E3QL3&ilW1a"P-1,L[D0fUdC
3B8lR2`3TN2'=Y.1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D0fL^@3&EHG2_m-D1E\G,1,L[D0fL^@
3&EHG2_['I1*A>+1,L[D0f^jD1-%'H1G^d?3?U(21,L[D0fL^A1bgpG3&<QL3$9t11,L[D0fL^A
1bgpG3&`ZS2'=Y.1,L[D0fL^A0JPL@3&`WR1a"P-1,L[D0fL^C2E3QL3&ilW1a"P-1,L[D0fUdC
3B8lR2`3TN2'=Y.1,L[D0fL^A1bgpG2)R*K2BXb/1,L[D0fL^A1bgpG2)d3H3?U(21,L[D0fL^A
1bgpG2)R*K2BXb/1,L[D0f^jD1-%'H1G^d?3@QL-4>838-p014/1<V7.4cl00I\P80E       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
