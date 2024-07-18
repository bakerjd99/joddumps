NB. sha256:dc5a7a8d3cb6af38946f9f325096f2650d33486892c3c128cdecaf6e9293746b
NB. JOD dictionary dump: 18 Jul 2024 14:32:20
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
1,^72+>P&p0d&5-1,9t,3$9q03&Vm63?U4:1i.)=A9;C(F>5I'A8,OqBl@ltEd:DH/h1[U@:XIk
F*',j0P"m-FD5Z2@<-W9F=f'eCi<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIlFEM,*+EV19F<G+.
@ruF'DIIR2/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lQATMs.De(RV0I\,\Ddd0fA.8l@
67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AQiuASkmfEZd(s3B7NU
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0emQaFttfqF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0fX)]F>5HlF`:l"
FCeu*AoD]48g$)G0K0FJ:-pQU1,N`gDDNshEb0E.F(HJ+DfQsm+?;&4+=L`<@rc-hFCd+8De3rt
F(HdC@q]:gB4Z,n$;No?+>PcgF_icl+Dk\1B4W3"DBL?BDe*s$F*&rUC2[W6+E_d?Ci_$JA8,Oq
Bl@ltEbT*++:SYe$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g)QW
De*s$F*)5:@ps1b.3N/4Anc-oA0>T(+DPh*E,ol/Bl%?5Bkh\u$=e!aF`MM6DKI"9De*s$F*)5:
@ps1b+=BH@6#:IJA9;C(F>5I'A8,OqBl@ltEd9#A$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$4R>aA8,Oq0edi83ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1-Zip@FD>`)0eb:8-OgCl
$;No?+E)41DBL?LA8,Oq0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRXEb'56GA2/4Dfp.EA7]@e
DJ=!$%16Ze+E(d5FC])qF>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1TDJU[J.=6Iq
A8Z32-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Ve%67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL+E(d5FC])q
F>5Io%13OO:-pQUDfB9*+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGU
ATMs7/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,@WNZ&AS`\W+>G!e/g`27
+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is
/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#TtFC])qF>5I'
GRXuh$;No?+EMXCEb-A;DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67FG^+HB$4R>;67sC$AT23h
FCf!!Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa/g<"mGpsjf
/g_qn+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3F!*.Z0ea_h
F`\`S0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd+ED%2
@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,sD.Oi7G^(Y[
-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`4CL940I_Dm
G^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)
F(fK9E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K4
0H`)(+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F
-oW8hAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S3$<6QDIIBn
+F&-U.3L$$@6-J(.=E=`G^'Z)%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=-tRXF
Eb0*!+E_a:+E(j7E-67F@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f4=>5^
F*',j0Hb4NEb-A1ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7KsFD*$2
$4R>;67sBtATDEp+DG^9G%#E*Dfp+DA8,OqBl@ltEbT*++EMHD.!0$AFE8uUB6%p5E-!QQD.-pp
Df[?MAU%p1F:ARgEZf:2+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$>"6#
A7dtc+DkP&AKW?J%16Ze+E(d5FC])qF>5I'GT^351E^UH+=ANG$8EZ-+=Joe3\W!*HTG\L%16Ze
+E1b!CLeQ0A8,Oq0eb;+%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZfF:Dg-//F)rI7
Bk/?8+>=63%15is/g+Y?Df]J4.!0!6@rsFZ0R,#hA8,OqBl@ltEd8d9DIal"Ch7$m+E_W4$>"6#
1E^UH+=ANG$4R>;67sB[78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#cQD..3k87?RQ@q]XVD/X3$0JH6g/h1^HCLp%F
F(f&sCK#(gCLo1R+ET1e+=M)8CLnq;BOPsq+Cf(r@r!3.D/X3$+EV19FE9&D$;No?%15is/g+SD
F*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.De(OV.3N/8@ruF'DIIR2+D#e3F*)IG@;]TuBlbD5
Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+1hq/L
0fKOK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R=o/g)Nj
8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$a
D..3k87?RQ@q]XVD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0ddD;%14gK+?^i<5uU<]@;9^k?O[>O$;No?
+DG_:@;KXg+CT;'F_t]-FE7luDImi20fL4l@;BEs-RT?1DImi20fL4l@;BEs0F\A,ATAnJ2]usG
CLnV9D..3k+DlBHA79a2%16uaEZd(q+DkP&AKYDB%16uaEZd(q+DkP&AKW@13\PSgBlbq>Bl%?6
BlbqEBle?0DJ(V?@:We!Bkh]:%16uaEZd(q+DkP&AKY>7+EKRd-QmMEBlbD2F!,OLD.7F"Bk&M"
$>sEq+>u,9+DkP&AKW?R@W-0<BQ%fB@VKpoBJ+"6F!hD(%16Ze+E(d54$%IoBk)5o$4R>;67sBk
F_u(?A8,OqBl@ltEd8*$A7dtc+DkP&AKW?J%13OO:-pQU@q]F`CER;!F(c!iATAna5uU<]@;9^k
?Qa2oCLnVMHTG\L%13OO:-pQU@;L$sEZen8D/^V0Bl%?'/Kf7OCht5(BOPdkAKYYpF(c!i@X3',
F$2Q,Eb/Zi+?Op2A7c8X%15is/g+Y;@;]^h+EMI<AKYH-FCfM&$=\:&ATL!q+=AWd+=KH/0H_S_
,@Yq?ATK;K+C]V<ATJ:f0d'[C@X3',F!,[IBlmo/4*s#!Ado(V$;No?+D>2)BHVM5Cht53D]ik7
DJ*O$+DkP/@qZ;YDImi20fL4l@;BEs4*s#!Ado(V$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8
ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFCfN8Ci<flCh6sfC2[WiD..3k
87?RQ@q]XVFE1r6F"f:C67sa)@;BFF@<6*lBPUOgEb0<50JFVk/M/(nD..3k.3NG8EbAr+A9Da.
+D>2)BHVD.F*'#D$;No?%15is/g)8Z0I\+mFCfN8C2[W;0JG10+Co1rFD5Z2@<-W9AU%p1FE8R5
DIal(F!,:;@:Wq[%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(I?C3=>I3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]?rCLp%FF(f&sCK#=qATMoH0II;:%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.
De(RV0JFj`$4R>;67sC!E+No0Cgh?sAKYMt@ruF'DIIR2%16Ze+E(d5FC])qF:AR30JG170H`J#
,@k\.+=ANG$4R>;67sBt@;BEsCgh?sAKYN+D/^V=@rc:&F:ARfAj&0tD..3k+=ANG$4R>;67sBo
@<6*)F(fK7Ch+Z*@<?!m%16Ze+>GetD..3k+?Op2A7c8X%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3lARB.dDe*2~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&p0d&;4+>Ghu1-$I33?U(9Ci<`mFCfN80eb:lBk)7!Df0!(H#.D-A0<T\0R+]qDIal.
Eb&a%+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(H#6u*AOp6NBOb^k;f-GgAM>edD..3k.3N;4
F(c\+BOt[h+EMC<CLnW1ATMs7D..3k87?RQ@q]XVFE1r6F"f9rD..3k.3NG8EbAr+A9Da.+D>2)
BHVD.F*%                                                                  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&Vm=+>Y,p2'=Xs0ekIE2BXb/+>P&o1,(FC+>GSn1*AA/1c?I20H`+n1-%3J0d&2,+>P&s2_[-4
0eje++>G`02]sh8+>P&o0JYL.0fL41+>GZ11J1G26<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG
1-.9J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[
ANCqg1a#D!DBL\g1,L+.1cdBJ3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.;+A-'[+>PW+1a"M/3]&WR0e`qA$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU
0f^@K@;[2C0JYI-0f;!L3'&oN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.2+<X'\FCdKU1,'hC@;[2C0JYI-0etdE3'&oU$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,'hC@;[2C0JYI-0etdH0fh!H
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU
1,'hC@;[2C0JYI-0f(jI0fh'I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.5+<X'\FCdKU1,0nD@;[2C0JYI-0KD0K1cdHL$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,0nD@;[2C0JYI-0KD0L1cd<N
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU
1,0nD@;[2C0JYI-0KD0N0KLmI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.8+<X'\FCdKU1,0nD@;[2C0JYI-0ebXB0KM!K$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fT
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU
1,0nD@;[2C0JYI-0ek^G3'&cJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.;+<X'\FCdKU1,0nD@;[2C0JYI-0f(jI0fh-J$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU
1,0nD@;[2C0JYI-0f1pI0KM$F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp15+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI3'&cM$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JO\>ARZc;0JYI-0f;!K1HI9G
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU
0JXb?ARZc;0JYI-0ek^E0fh-H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp18+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E2``WN$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0JXb?ARZc;0JYI-0f1pH0KLsL
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU
0JXb?ARZc;0JYI-0f1pI2**NR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1;+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI3'&fS$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU
0Jah@ARZc;0JYI-0ebXF2EE]T$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3Zp45+<X'\FCdKU0Jah@ARZc;0JYI-0ek^D0KLmD$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU
0Jah@ARZc;0JYI-0f1pI1-.3M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_
ATBgS1Gg3s6t(1K3Zp+6+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/heCj6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0JstBARZc;0JYI-0ebXC1-.6O$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp+6+@]pO+>PW+1a"M,3\`QS
0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>>bt7V-$O1,(I?+>PZ40KD0N1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P="+<X'\FCdKU0K:1EARZc;0JYI-1,1gG1HI3E$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf3$:\%@N[E[1,L+/0fh0N3\WQ$
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+9
+@]pO+>PW+1a"P/3\iQR1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&
:3CD_ATBgS2]s52@<?'A+>>eu7V-$O1,(I?+>>f:2*!]T3=6*#:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0KC7FARZc;0JYI-0ek^H3BAuP$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqf3?Ue&
@N[E[1,L+.1-.*E3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`F_tT!E]P<t
0H_K+@<?'A+>GPm7V-$O1,(I?+>GT31c%0J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*
F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg0H`hr@N[E[1,L+.1-.*D3]/]#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@]pO+>PW+1a"M,3\`KQ
0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+>G\q7V-$O1,(I?+>GQ21,q<M3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P=!+<X'\FCdKU0f1"BARZc;0JYI-0ebXE1-.3N$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*Al%EZd+k1,L+-3BAlO3]/Z"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5
+AH9i+>PW+1a"M-3\`TT0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS2BX,1@<?'A+>Pku9jr;i1,(I?+>GT31Gq3L0a\6p:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0JahDF`&<W0JYI-0f(jJ1-.0F$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh0H`u1
DBL\g1,L+.2**NK3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+?:Pe6t(1K3Zp14+A-co+>PW+1a"J33]/TP2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp14+A-co+>PW+1a"J33]/fV1H,XJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp14+A-co
+>PW+1a"J43\`HP1H#RI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS0esjo6t(1K3Zp14+A-co+>PW+1a"J43\`HP1H#RI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp14+A-co+>PW+1a"J43\iKP2)u!N$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp15+A-co
+>PW+1a"M,3\WQT1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS0f:'r6t(1K3Zp15+A-co+>PW+1a"M,3\iBM1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+7+A-cm+>PW+1a"M13]/WQ1GB.C$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+7+A-cm
+>PW+1a"M23\W<M1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS0fU9u6t(1K3Zp+7+A-cm+>PW+1a"M23\`NR0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+7+A-cm+>PW+1a"M23\iQR1H5^K$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp+7+A-cm
+>PW+1a"M23\rNP1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS1,0mo6t(1K3Zp+8+A-cm+>PW+1a"M,3]&fW0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+8+A-cm+>PW+1a"M,3]/oY0Ja%C$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+8+A-cm
+>PW+1a"M-3\W<M2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS1,L*r6t(1K3Zp+8+A-cm+>PW+1a"M-3]/TP1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+A-cm+>PW+1a"M-3]/`T0K9CH$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8+A-cm
+>PW+1a"M23\iHO1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS1,g<u6t(1K3Zp+9+A-cm+>PW+1a"M,3\`NR1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+9+A-cm+>PW+1a"M/3\iKP1cYmM$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.2+A-cm
+>PW+1a"M,3\`WU1c,OH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_
ATBgS1GBpo6t(1K3Zp.4+A-cm+>PW+1a"M,3]/fV1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp.5+A-cm+>PW+1a"M23\iHO1c#IG$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#D5C`kJe1,L+-
3BB#U3\`;q$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+<X!nBl%<&:3CD_
ATBgS1*@]-@<?'A+>G\q8p+qm1,(I?+>GQ20fD'I3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.6+A-cm+>PW+1a"M-3\W9L0fTLI$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1a#D5C`kJe1,L+.0fh$E3\rT"
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0f1"FF_i0U
0JYI-0ek^D2EETR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>G\q8p+qm1,(I?+>GT31,CsH0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fC.HF_i0U0JYI-0f(jI0KLsL$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]t_8C`kJe1,L+-3BAlN
3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K
3Zp.9+A-cm+>PW+1a"J43]/ZR1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!n
Bl%<&:3CD_ATBgS1a!o/@<?'A+>Get8p+qm1,(I?+>GQ21H%9J2@<&P6rZrX9N+8X8PDNC8Q/Sa
;HYb4$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp:&
+@KX[ANCqf2'>M"DBL\g1,L+.1cd?H3]/Z"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1a#D!DBL\g1,L+.1cdBJ3\iDs$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&
DBL\g1,L+.1HI?K3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!Y
A0=WiD.7's3ZpC)+@KX[ANCqg3?Uq&DBL\g1,L+.1HIBO3]/f&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg3?Uq&DBL\g1,L+.2**TS
3]/Su$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,'hC@;[2C0JYI-0etdE3'&oV$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PVn8muT[1,(I?+>GW41bh$F2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp13
+A-'[+>PW+1a"M/3]&QP1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh0d'(sDBL\g1,L+-3BAlO3]&W"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,0nD@;[2C0JYI-
0KD0L1cd<N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t2'=#0@<?'A+>PYo8muT[1,(I?+>>f:1b^sE3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14+A-'[+>PW+1a"M,3\W6K1H,XJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[
ANCqh0d'(sDBL\g1,L+.0fh*L3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nD@;[2C0JYI-0ek^G3'&cJ$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo8muT[
1,(I?+>GZ51bh$J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,'gn6t(1K3Zp14+A-'[+>PW+1a"M/3]/`T1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh0d'(sDBL\g1,L+.1cdEH
3]&Pu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Mm7V-$O1,(I?+>G`71c%0J0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+3
+@]pO+>PW+1a"M-3\iEN1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqf1*B%t@N[E[1,L+.0fh'K3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0JXb?ARZc;0JYI-
0f1pH0KLsL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u2]s52@<?'A+>>Pn7V-$O1,(I?+>G]61Gq3M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+3+@]pO+>PW+1a"M03\r`V1,oUJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[
ANCqf1*B%t@N[E[1,L+.1cdHO3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0Jah@ARZc;0JYI-0ebXF2EE]U$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>So7V-$O
1,(I?+>GT30ebXB1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1GU'q6t(1K3Zp+4+@]pO+>PW+1a"M03\iZU0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqf1E].u@N[E[1,L+.1cdEJ
3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp48
+<X'\FCdKU0JstBARZc;0JYI-0KD0O1HI6L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>>Yq7V-$O1,(I?+>GQ20etdH3!p!":-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heCj6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU0JstBARZc;
0JYI-0ebXC2``WK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`
F_tT!E]P<u+<X'\FCdKU0K:1EARZc;0JYI-1,1gD3BAuP$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0K:1EARZc;0JYI-1,1gG1HI3E
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\
FCdKU0K:1EARZc;0JYI-1,1gI2``WQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%j
A7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0K:1EARZc;0JYI-1,:mG2**KH$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0KC7FARZc;
0JYI-0KD0O3BB#X$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`
F_tT!E]P=%+<X'\FCdKU0KC7FARZc;0JYI-0ek^H3BAuP$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0KC7FARZc;0JYI-0etdD1-.6G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.2
+@]pO+>PW+1a"M-3]&WR1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>GPm7V-$O1,(I?+>GW40JPUG1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q7V-$O1,(I?+>GQ20f;!H
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>G\q7V-$O1,(I?+>GQ21,q<M3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G\q7V-$O1,(I?+>GQ21GV!I3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GVo6#^ie
1,(I?+>>f:0f1pK1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+>GYp9jr;i1,(I?+>GT30fV3J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pku9jr;i1,(I?+>GT31Gq3L
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>>So8p,"o1,(I?+>GZ52)73J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>PVn8p,"o1,(I?+>G`71GV!J1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>PYo8p,"o
1,(I?+>>c92)%'K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS0ea^m6t(1K3Zp14+A-co+>PW+1a"J33]/fV1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0d')2DBL\g1,L+-3BAlO
3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.4
+<X'\FCdKU1,0nDF`&<W0JYI-0KD0K1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>PYo8p,"o1,(I?+>>f:1,CsK3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp15
+A-co+>PW+1a"M,3\WQT1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1*B23DBL\g1,L+.0KLsC3]&f'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0K(%GF_i0U0JYI-
0f;!L0fh*E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t2]s52@<?'A+>>\r8p+qm1,(I?+>Gc80JY[G1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp+7+A-cm+>PW+1a"M23\`NR0fB@G
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[
ANCqf2BYV7C`kJe1,L+.2EETN3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^H
ATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0K(%GF_i0U0JYI-0fD'K1-.3G$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>_s8p+qm
1,(I?+>GQ21cRNM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS1,9sp6t(1K3Zp+8+A-cm+>PW+1a"M,3]/oY0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf2]t_8C`kJe1,L+.0fh!D
3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp17
+<X'\FCdKU0K1+HF_i0U0JYI-0ek^H0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>>_s8p+qm1,(I?+>GT32)I?J3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8
+A-cm+>PW+1a"M23\iHO1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf3$:h9C`kJe1,L+.0KLpH3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0K:1IF_i0U0JYI-
0f(jG1HI?Q$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u3?TG4@<?'A+>GPm8p+qm1,(I?+>GQ20f_9O2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp.4+A-cm+>PW+1a"M,3]/fV1,K=F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[
ANCqg1E];4C`kJe1,L+.2EETK3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^H
ATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0f1"FF_i0U0JYI-0KD0O2EEQI$47,867sBZH#n(=
D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer
+@KX[ANCqg1a#D5C`kJe1,L+.0KM$H3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU0f1"FF_i0U0JYI-0ek^C0fh$K$47,867sBZ
H#n(=D)re3:IJ/X:J=\04?R+lD/Ej%FCeuH4s1t6F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Ykt+@KX[ANCqg1a#D5C`kJe1,L+.0fh!D3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU0f1"FF_i0U0JYI-0ek^D1-.3J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A
+>G\q8p+qm1,(I?+>GT30fD'J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,
+<X!nBl%<&:3CD_ATBgS1H6L"6t(1K3Zp.6+A-cm+>PW+1a"M-3\iKP1,0+C$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.8+A-cm+>PW+
1a"M/3]&NO1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.9+A-cm+>PW+1a"J43\`EO1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.9+A-cm+>PW+1a"J43]/ZR1GB.C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp.9+A-cm+>PW+1a"M,3\rZT0K0><:IIuc8l%i^D.GC\%147_C2[W*FDk].+Dbb5FBp;:De*cn
C2[W8E,K;;+CIf;6sq-::IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CIf;6sq-GDIal(FE8RGF^eis
@<6L$F"Rn/<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7
@3BZ#F)*B;$:8cOGB7=<FD,5.Eb0E.F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AKZ)5+ED%:Bk;K2
@q]:gB4Z-:%15C;F)NTPEb/Zi+Br5eBleB7Ed99SA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E904Ja9@P;S,F*(u605>E905,'@FDl2F/o>,J%172q+EM+*+EqL-F<E&A@ruj%Ci"A>
B5_l7Bl.g*ASl!rFCeu4/g*u,@;^-/A8`T.Dfd+>ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>M
>@M/VBl5MEDe*cl?k!GP$8F.U?p%e>GA1W22)dL.3B)1;GB7bJCN",N@Pi165%#L#Df0W1A7]d(
AU&04F(oN)+CoV3E$043EbTK7+D>2)BHUeuARfLs/0JLVB.b_E$6UH6IXZ`p%144#+AP6U+Cf(r
@r!2tF_u(?F(96)E-*44Df0Z.DKKqB@:s"_DKBnBBOPsq%144#+>Get@W$!)C2dU'BHS[O8l%iC
<D?:g06MANCi_4CC3(a3$6UH6IXZ`p%13OO1+j\W4C:''A2%nDA9]hG11tMb2g.$&0Q_S#AnuWu
5%#L#Df0W1A7]d(@:Wn_DJ()#+D,P4D..O#DJ()1E-,f4DBO%>+CK%pCLplrFD,*)+D58'ATD4$
ATJ:f+<Ve;Bl[cpF<G+*Anc-sFD5Z2+D,P4D0$hDBOu'(D..3oDJ()5@rc:&FE9&W<+ohcA8-'q
@rri(AS,XoBln'-DBNP0Ebu6m+<Ve@F!,=<Eb-A)Ch76fDKI"0DIal'@<3Q5BOr<(Bk(]sAn>Cm
F`M%9De:+9A7]b'Dff]2B-JI>Bl7R"AKYf'DIjr%G]7J5@qg%+/0JLVB.aW#+<VeUIXZ_T$6UH6
:-pQUEHQ2AARlp)FCB&t@<,m$AU&01Bk(k!%144#+EDOHA7]763Zp4$3ZoeU?mncM9MA/H;G/3@
.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>/mg@\/j:C?4"akq+F,=D$6UH6:-pQUA7QfpDfT\($6UH6
EcZD7ARf7]4ZX^4HQZU%-r*c99MIfN9-R^l5V=H5/5fDI:/st].4-W-.82cV+?V_<?SWr\4s2sL
/mg@VGp%N`%144#+F\cgILQW,+<XWsAKYK$DK]T3F(oQ1+D,Y4D'3nA@;]UaEb$;(G]7J5G\M7B
FDi:4A0>T-+EMXF@;0@fFCoH3G@>N&+CT=6Ci=3(%144#+CT=6FD,5.A7]@eDJ=3,Df-\.De3u4
DJsV>F`V+:@;^?5De:+a-Z^DNATMF'G%G2,@<-"'D.RU,+DtV)ATKC3$6UH6@!*T8+Di6=?nNQE
5p0ZN@;]^h+Dbb-AKZ).BlbD@Dfol,+CT)-D]ib2E+*6u+CJr&A8Gt%ATD4$ARHWiF`\'"+<VeF
G%G]&Cht5<Dfol,+DkP&AKXSf@rGmh+Dtn'ATAo8D]ik7DegJ0F=n"0%14mD+CI<=1Lb>aFuahh
F>IoZ1NYN1H>-l*BehV[G$dF@+AQKl+Du==ATDKp+Cno&@<?d6ATJu&DIaku+Cf>-G%G]8Bl@l3
F`_>6BlnVC?t1fs+CT;%+C\nrDJ'Cc+<Ve8A7T7^+DG^98g$,H2BXD'0JYJ"@;[bS.3NhG+Du+A
+D>2,AISth+<Y&FBl8$(B4Z*<055<GAS5Rp1,!?ZFCf)rE\oF]Ci<a(Bl7Q=04o$=@<?4$B/D8R
Ci<a(Bl7Q<2IIYOBOu'mG%G\:FD,6+AKYE%AISth+<Y0-@;]^hF!,RC+C]&&@<-W9Bl8$(Ec,<%
F!,1=+DG\3@:OD#+A,Et/g)9.-['&D@;Ksq@:XX+BPDQ2@3B&uDK]T3F(oQ1+E2@4@qg!uDf-\/
EcQ)=/e&.1+<XWsAKZ&*EbSru+CoV3E$/b2Ec#6,+E_aJ@;Kb*+EqaECNCV2DeX*%+D,P4G@>N&
+C]J8+A!\aD'3>,DI[6uDIm?$@:F.tF<G(6ART[pDJ'Cc+<Ve;F_u(?F(96)E--.DFD,*)+EqO9
C`mV6F<GC<@:UKpDBNk6A7]d(8g&:gEcYr5DK@EQ=(uJe+D>2,AKZ)5+Co&,Bldi.F)Po,+EM%+
ASkuf$6UH6FDi:3DfB8?+AP^3762Q4AS#_"+EVNEBOQ'q+C\nnDBNP*G\(D.Bl5&0@<?($+A*b:
/iFh]ATV@%/e&-s$8a@X?p%dTH>#)nCH60HC,L3NA8l9?0Of?LEGfVQ?Tqj?6Z6j`Bk1dq+CSek
Bl7Q+@3B5lF(c\7@VTIaF<G1(@qfanFEo!NBOQ!*GA1l0+EMXCEb-A%+B(fs/M]1A+D>2)BHVM4
ASrW0F`__>DJ'Cc+<VeF@VTIaFE9&W8K_GY+EV:2DJNs(B-:W#DffZ(EZf:>FD5Z2+Cf>#AKYA8
2ddbMBOQ!*GAhV?A0>`#@;[3/FDl22+CQC+@<6*)Df-!k+<Ve7E-681+E)9CFCfN8+CQC+@<6*)
Df-\*B4Z0m%144#+F\cgILQW,+<Ve%67sC)DfTA2BlbD9F`\a7DIaku+D>2)BHV#1+EMXCEb/c(
Bl5&%+ED%7ATDs*A0>r0DfdT@$6UH6+>=om2^!'^F<DrTDfTA9%144#+<XEG/g+h9F(c\1F!+t2
D/`p(ARlp*D]j43Cis;3Eb0?5Bk;I!A0<HHATDg0EZf(.+DkP/@qZus@;0P!/e&.1+<Vd\+>Get
B4Z0--[0KLA1%fn+<VeUIXZ_T$4R>"/g+Oa?XdqqD)68hG%>]=2edAF2J[)RH"ere1j34i?m&&h
F!,(/Ch4`4ATD7$+DkP4+D>2$B-;D3ASrW!@q0(kF(oN)+EqO;A8c[5+D,>(ATJu4DBNJ1Bm+'/
+CSbiATMp(A0>?,%144#+BD<6+Cf>-DIm="Bl@m1+EqL1DBMtV:*=7l+E(k(/g+,,ATD?0F!,@=
F<GFC@qZuW:IH=8@;[2uD]iY1EZf4-E,]B!+=M&;FED)7-Y6g;%144#+CoM,G%G_;@Wcc8?tNtp
BleB(+D#_-DKL#0Ci"A>Eb0?8Ec,q@0HatGEZeCZ:*=Uk@<,q#+Dbb-ANC8-+<VeUIXZ_T$6UH6
+D,20BleA=-SI,fAohKoFtba+F(f!&ATKM>De(M9De(M9GAhM4F"V0AAg\#p+<VeUIXZ_T$6UH6
8l%ht@rHL+A0>E$+CQC4F_P?$+D#e3F*(u2@q?cmBOt[h+E)-?GA1r*Dg-7FF*VhKASlK2GA(Q*
+DGp?F(Jp(+E_R=@;p0sA.8kg+<Y`=@<,q#+CHiUF)Po,06:f8Eb-n8BP9&6GAhM4F"V0AAmd56
+B3#gF!,[@Cht53Dfd+8ASc<.AoD]4<_uO6D..C&ARlooEbT].Et&I!+<YlAASrVk:ei-IF!,C5
AhFN"%15!G+CI<=1GNu2A8c()CjBuBF^\luF*DPB2`NX5E*ke:+B2onF<Ft+De*ZuFCfK$FCei&
Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO2_H3q?p%dT2fF"RG&_27H?Ek?
F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.
Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr@WNZ*@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8
Bl@m1/e&-s$90X\+<Ve74C;VRA9;F!A2,odE-?&+FDbT%12pYZBQnB%5%#L#Df0W1A7]d(@;Kau
GA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBeGT_'QF*(u1F"SS7BOr<"
Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<+ED%7E+NO$ARlomGp$L*
Bl[T6%13OO?s@2[A1_nAA8ba]%16c_F*)>@H"q8.1,iiWDImisCbKOAA0<HH@q]:gB4W3!BleB7
Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/i+V%+=MGJE%)oPDK9<)
ARTXkA.8kT$6Uf@+CK%pCLplrDJs_A@q]F`CNCV/F_u(?F(96)E-*44Df0Z.DKKqB@:s"_DKBnB
BlnD=BOPsq/e&-s$6UH6+<VdL+<Y3,4ZX^&@;BEs-RU#Z+AP6U+CoV3E$/S*C`mq?Eb'56Df-\:
@<?/l$6UH6+<VdL+<WBt+DkP&AKX']3b2hF+AP6U+Cf(r@r!2tF_u(?@:s"_DKBnBCh7$cBl7Q+
BOPsq+:SYe$6pc?+>GK'/i"P$+A-cmGp"gu/0H]%1,L+%:h=Za@;]XoF<F7q@ps1b+@TgTFD5Z2
.1HUn$6Uf@+A,Et+Du+A+ED%5F_Pl-F!+(&F!+n'FCfJ8G%G]8Bl@l33A*!@/g*/,0JXbbDKKo;
A9DBnA.8kg+<Ve;Bl[cpF<G+*Anc-sFD5Z2F"SS6Df'&.8l%htGAhM4F!,@=G9D$LAKYMtEb/a&
+Co%qBl7X,Bl@m1/e&-s$6Uf@+CJr&A8c?n+CT.u+CJr&A8c'f+D>2,AKYGnASrW#BOPdkARlp*
D]i_%DIdQp+E1n4D..<nDKH<p+<VdLCi<flCh7Z1Bl8$5De+!#ARlotDBMOo3A*3B+CJr&A8c'l
?m'?*+Dbt6B4Z*+A7]h(Ec65E+A,Et%144#+<Y01@<6K4Ci<flCh7Z?+A$YtDJs_AF(oK1Cj@.5
Ci=B+F!,C?ASrW$Bk)7!Df0!(Bk;?.@;]TuEb0*+G%G_($6UH6+CJnuDe*6,+EV:.+A,Et+DG_8
ATDBk@q?d!De!3lAKYT*Df$V=BOr;q@<6!&E+*j%/g+P:De*d(?k!Gc+<VeIATMs3Eb0;7?tj@o
A7-O%D]j.8AKYGjF(HJ5@<?08+B3#c+Du+A+E1n4D..<nDKI!n:IH=8CghC+%144#+<YK=@ps1b
F!)l=@;9^k/7E:3A7TUf/7E:3A8PajALq8)De*p2DfTD?@;9^kFDl)6F"Ca7De+!4Bl%0+%144#
+<Y*5AKYl/F<G(,@;]^hA0>?,+CJr&A8c?n+CT.u+CJr&A8c'l?nNQ2$6Tcb+<VdL<,WmhEb/[$
AKYo3+ED%*Eb0<*+A,Et+Cf4rF)rI?De!3lATJu>Dfm1>F`VXc%13OO+<VdL+<VdL+Dbt)A0<74
ASu("@;IT3De(4)$4."]%144#+<XWsBlbD,BOPdkAKY].+C\bhCNj3-A0>B#D/`p*Bjtmi+CT.u
+EDUBF!,17+A+#&+C\noDfTD33A*3B%13CN$6Uf@+AH9^Gp#^T6m-S_F*&OG@rc:&FE8RIF(HJ3
@;TRd+Dbt+@;KLr/g+,,AU,DBATD?)@rc-hFCeu6%144#+<YcOE+rfjCi"A>Ci<`mARlp-Bln#2
8l%ht-td+5.490f+D#e/@s)m)A1Sj3DIal3BOu'(A7]RgFCetl$6UH6+EVNE@r,^bDBO(@+EV19
F<G"4FD5>q@rucE+B3#gF!,F1FED)7DBO.;Cht53Dfd+GDfTV9Bl5%c+?;&4%144#+<Y*6+Dbt+
@;KLr+CT;%+E1n4D..<nDKI"DDJWm*F!,%=E,95uBln0:+CfG'@<?'k+CT=6FCf<.DfT9,GqKO5
+<VdL<+ohc@UWb^G@>N&+Cf>,E+*j&@VfTu-u*[2E,ol/Bl%?5Bkh]<+Eh=:@N[(6De*s$F*)5:
@ps1b.3K',+<VdLD..-rFCAm$F!,R<BlbD9@<?U&Ec*".DIal,@;^?5FCfN8+EM%5BlJ08+CT@Q
%13OO+<VdL+<VdL+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0G
A9Dd(F:AQ`%144#+<YB7Cisf@Eaa'$+DGq=+E_a:/g*GrC`l>G6m-S_F*&OG@rc:&FE8R5Eb-A(
BleB:Bju4,ARlotD@Hpq+<Ve@DBO%7AKYB0@:WneDK@IDASu("@;IT3De*p-F`Lu'?m&lgA8c?<
%13OO+=\KV?pdUV5uL`Z6;q6*C2[Wi?m&rfDBND"+E_a:A0>u4+Cf>-FE2;9+Eh=;FD5ArC`l>G
6m-DWC1Ums%144#+<Y]9D/XT+C`m82EbTE(+Dbt)A90@G8T#Yk@<,p%@psFiF!,R<AKZ/-Eag/!
@r,^bEcuA1F'p,-BkM+$%144#+<Y`:Ch7*u+Du==@V'RkA0?#9ATAo0De!3lATKIH<+oue+DGm>
E+*d/Bk):%@<-'uGp$p;CLq=-+DGEs$6UH6+EV:.+E_a:EZf1:@ps1b+DGm>ASlC.GqL4+Gp%0>
FED57B-:SL9LV6F<_l%\?m'Q0+>=pPDBKAq+<VdL-u*[2E,ol/Bl%?5Bkh]<+A,Et+EqO9C`mV6
F<GU8D/XT/+Eh=;FD5ArC`mP4@ps1bF"SS:Bln#2%144#+<Y&Z9LV6F<_l%\?m'N%F<G[D+>=pY
AT23hFCeu*-u<g1A0<74ASu("@;IT3De(4E+Dbt)A9/l;Bl%T.%144#+<YTCE+iZt+A,Et+E(_(
ARfh'/g*H$+Cf>+Ch[s)Df0V=GA2/4+E_a:EZf1:@ps1bF!+n3AKZ,5Ch[ZrCj?Hs+<VdLFD,5.
A7]@]F_l.BBlbCO/e&-o#p9Za#mh^`$6pc?+>GK'/hnL.J<M*FAR]\&@<-W90eb.$1,(I?+=L!'
/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Nfj"+Dtb7+CK+u?m'B,FD5Z2+E)41DK?qB
BOr;tDKKT5AKYr7F<G+.@ruF'DIIR2+E1b2BJ(E,BPDMs$6UH6+DGm>F*1u++CQC7Bl.F&@<Q@&
B-;)1/Ria/Bl7L&+A!qt+D#D!@<-BsF)to'+D,P4+Du+>+EV:2DJNs(B+51j+<VeFAftf0+F.O,
EcW@3B5]C3$4R=b+<VdL+<VdL2BZpK+=CT.DIb+;:-pQUDfB9*F!+n-C`mY6+=LZ/DIb1=E+*j%
+>"^Q@;BFq+=LZ/DIb1=E-673$6UH6+<VdL+<WQbDe'tP3[\QZF!,O@F_;h>FD5Q4-Ql/N/g,(O
ASuQ3@;Ka&Df-[GB5ho@+E1b2BHSlLD..3kF!)lDE-!HNE-67F+<Vd9$6UH6+<VdL+<YT6E*m<o
De*3<3Zp=-De't5:-pQUA7]@eDIjr(@;]V$+EM47Ecbf6F<G:8+A,Et+DG_8ATDBk@q?d!De!3l
AKW*)$4R=b.Nfj/ATo8=ATMr9@psFiF!+n/A0>Aq@;]^hF!,RC+CJr&A9;C(FCfK#+EVNED..3k
+EV19FE8RADfTD3E,Tc=@:F%a/e&-s$6pc?+>GK'/heD"+@]pOEckf2Gp"sq+>PW+1a"2;@<6+-
+AH?:@<6*o@:Njk7:^+SBl@l<%13OO+=\LA83p0F?n<F.9LV6B?m&lqA0>8`8Om/2D.-ppD]it;
FD5Z2+Cf>#ATJu&A7T7^/e&-s$6Uf@?t=4tATV<&FCArrF!+m6DIn#7DfBf4Df-\*7ScoL786'H
<(0\]5u^B_+EV:*F<G16Ear[%+EV:.+:SZ#+<VeG@<?0*Bl5&8BOr<'@<6O%EZet.Ch4`'DKKe>
FD,5.E-67FA8,OqBl@ltEd8d=G%GP#$6UH6+DGF1FD,5.E-67FA8,OqBl@ltEd8dAF!+jg76s=;
:/"eu/g+,,AKYhuBl5&9F(HJ4Ado(i+<Ve77ScoL786'H<(0\]5u^B_+DGm>FDi:BATMF)+EV:.
+DG_8ATDZsC`m\*FD,_<Bl5&$;FNl>:JOSd?k!Gc+<Ve;Bk)7!Df0!(Bk;?.FD,*)+D>2,AKYGn
ASrW-Dg#]&/g*GlFCfJ8AoD^"Bl7Q+E+*j%F!(o!+<VdLFD,5.A8,OqBl@ltEd8dEF`VXI@V$Zl
Ci=B+A0>;uA0>o(DfB9*ARmD&$6Tcb+=\KV;e]cR@psC#Anc'mF!,C5+B(fs/M]1A+D>2)BOu6-
@<,p%DJs_AGB.D>FCf>4A9Dp,DJ(($$6UH6+C\bhCNXS=?uTOaCLgfqDfB9.@<?4%DK@EQ+@^9i
+C\bhCNXS=1bp1qBOr;uBl%?'BlbD)1brfZ@<6*nF"VQZFC5Ob%144-+<WrmDIn#7?t+"i?m'B,
FD5Z2+D>2)+C\nnDBNY1E,9*&ASuU$A0>u4+Cf(r@r!2r@:O(qE$/b,Ch7Ys$6UH6+CSnkBl8!6
+EV:.+D>2)BOu6-F*)>@ARlotDBO%7AKZ&.A7]7ZEZet.Ch54.$4R=b+<VdL+<VdL0fL4aDJUFC
/ghba:-pQU0fL4<+@nds8.>n8$6Uf@+CK5$F*(r#+Du+A+ED%7FDl22F!,F1Ecc#*F_kK,+C\bh
CNXT;+DG_7FCelk+E(j7C3=T>+:SZ#+<VeKBOr<&@<6N5@UWb^F`8rU6#:U\/0JD1@r$4++D,>(
ATJu&Eb-A'BOt[hARlolB45LlF*%iu+<VdLFD,5.BOPsqATJu.DBO%7AKYK$EcP`4E,TW)Bl7Q+
F(o/r@psC#Anc'm+CT.u+EV:.+:SZ#+<VeIATMs3Eb-A-F!+n#DfTr2A0>Su+CT/5+D>2)BOu6-
A8`T.Dfd+=@<?!m/e&.1+<V+#+<VdL+<VdL+ED%7FCZLAA8YgmALATC+<Ve%67sC$ATMs3Eb-A0
@<6N5@UWb^F`7cs+<VdL+<VdL+ED%7FCZLAA8YgmALBPo0d%T667sC$ATMs3Eb-A&@:O(qE$-ki
%144#+<VdL+<VeIATMs(+=C];@;TR'4#&H40fL3t:-pQUEb0<6DfTD3BkM=%EbTE(+C\bhCNXS=
BOPsqATJ:f+<VdL+<VdL%13OO,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%
ASuU2+@TgTFD5Z2.1HUn$6Uf@?uBP"A7-NtDg*=G@;BFq+CJ`!F(KG9-W3B45tOg;7n"de0jl,4
DIaktA8lU$F<Dqs;aX,J3&N'F0jl,4F!,")AmoguFE7lu+<VdLGA(Q*+CfG'@<?4$B-;)'G9CF1
@ruF'DIIR"ATKI5$4R=b.Nfj"+Dtb7+E1b0@;TRtATAo$83p0F6rcrX?m',kF!+q'ASrW!A7T7^
+EVNE?tsUjE+*d(F"V0AF'pUC<+ohcA7]@]F_l./$6UH6+DGm>0e=GhF`M@BDe<T(GA2/4+>>Dj
=(l/_+>G!I+B(fs/M]1A+D>2)BHV#1+E2@4AncL$A0>u4+EV:.+EMX5Ec`FBAftW,D/]pk+<VdL
F(96)E--.R+B3#c+D,P.Ci=N3DJ()6ATMs7+D,P4+CoV3E$043EbTK7+DG_8AS6$tFEonV$4R=b
+<VdL+<VdL@q]Xk@<6*mD/`ijC2[Wi+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[WnATf\?
C3(a3$4R=b.Nfj"+Dtb7+DkOsEc3(?F^]*#Anbgs+CIc;=\_:k+Cf>#AKYYpF!+q'ASrW!A7T7^
+D,P4+A-cqH$!V<+Du+>AR]RrCND*N:2b5c@W-1#+D,>(ATJ:f+<VdL@ps6t@V$['FDl22A0><%
+A,Et+DkOsEc6"AGA2/43XlE=+<VdL+<Vd9$6UH6+<VdL+<XEG/g,1G@:UKuDffQ"Df9D6@;]Tu
F*)>@AISth+<VdL+<VdLBlJ?8@QcapF`_4T+ED%%A0<7;DffQ"Df9DDBlJ?8@ODTl+<VdL+<VdL
+>b3[F`\`RDJsW.@W-1#?YOJ)DIOtT8PiPb6=4/9De*3:BlJ?8@LWYR$6Uf@+B3#c+E2IF+Co1r
FD5Z2@<-W9E+*j%+DGm>DJs_ABl5&8BOr<"ART+\EZek1D/Ej%FE8RCAfs]A6k'JG+<Ve;F_u)=
/g*W%EZeq<@;Tt"AKZ).AKYAqDe*BiG$lG'Bk)7!Df0!(Gp$d/F!+m6E+*j%3XlE=%144#+<VdL
+<Vdg3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R=b+<Ve+BPDN1E+*j%+Eq78+Du+>+E2@4G%kl;F)6+E
F(fK9DD!%@$4R=b.Nfj"+C]J++DG_8Ec5K2@qB0nBl5&:ATDj+Df-[G0eP.41,C@%BOPs)@V'+g
+Cf>1Eb/a&ARmD95p0]LAmoguF:AR"+<VeDATMp$B4W30@<3Q*DI[U*Eb/a&Cj@.EATT&2ART+`
DJ()6D]iFA+>u,9+E2IF+=AO\DfTA9-X\'/@;0P#Eb0;7-rW]-81?/#$6UH6+<VdL%13OO,9nEU
0eP.41,L+CAR]\&@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.DBMAYBln'-DCH#%%144-+A*b:/hf+)
Eb0,sD.R6#FDi9o+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P+Z_>7+Eq78+Cf(nDJ*Nk+EV:2Et&I!
+<Y]9EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZupDf'H9FCfM9@3B/uDdda%DJ()8ATDj+
Df-\8F_tT!E\7e.%144-+CIT69M%rM<+$hm@<3Q#F_u)/A0?#6+EVNE2Dd$/8S0)jDfm1?AS#Bp
D/XH++EV:*DBLho+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJEZdtM6m-GWFD)eBDfm12Eb-A(DeX*%
+EMI<ATVU"DJ()9Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeqF`VY9A0>u4+Cf(r@r!2rBl7@"Gp$U8
D/`p*BjtdmBlnVC/KenEF)to'+EV:2F!,17+E2@8DfQtDATDj+Df.0:$4R=O$6pc?+>GK&/i#4*
8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh>+3A*!B-Z^DQF(HJ4
Aft;J9i,+DBQS?8F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)
+:SZ#+<Y?+F!,17FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-FE_;-DBMOo3A*!B
+CT.u+E2@8DfQtDATDj+Df0V=De:+a/e&.1+<X9P6m-PmDfTE1+D#e>ASu$iA0>i3ARfFqBl@l3
Bl8$(B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC8g$,H0Jj4G+<Ve:@;[3.ART*l
DerrqEZeq<FCf?#ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.1a%!_Blmp-+D#e>ASu$iA0>T(FCf)r
EcW@FD]iG&Anc'mF'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(8ge[&@ps6tDJpY<ART*lCi=3(ATAo8
BOu$5+B3#gF!,X;EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2FC6X/$6UH6?tX:o@WPp"@;]Tu?t=4t
ATV<&FDi:@Eb0E*DKI"CBOr<'BldrrDIdQtDJ()1Aftu&G;!lNA0>>qDIIR2+Cno&@3B9%+Co1r
FD5Z2@<-'nF"Rn/%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki+EVNEFD,B0+Eh=:F(oQ1+E(j78l%ht
Eb0<'F<GjIF`JTs:IH=B@<6O%EZet.Ch4_uGrcBA%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1
%13OO+<VdL+<VdL:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+Gp%-=B5)F/ATD?m+Co1rFD5Z2@<-'n
F!+n/A0>r,F`\`u+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E+E(d5-RU>cAp890FCcS0E+*j%+=DVH
A7TUrF"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(+<VdL+<VdL%144#+<VdL+<XEG/g,1G
F*(i2F<F0u@;]TuATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@ID
ASu("@;IT3De(M9D..L-ATBD;C1\h&$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("
@;IT3De(M9De(J7C2PC.$4R=b+<VdL+<Ve%67sC$ASc9nA0>u-AKZ#)B5)F/ATD?m+Co1rFD5Z2
@<-'nF!,F1H"h//+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U+EVNE@;^?5@VK^gEd8dADI[U%E+*j&
@VKXmFEo!GATMp$B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$6UH6+<VdL+>=s"0JG4(
4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJFBkh]:%13OO+<VdL+<VdL:-pQU
FDi:EF(HJ4Ch+Y:@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'nF!,aHFWbmBCht5-@<Q3)FDi:CATT&:
BOu$'%144#+<VdL+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,ATAo:ATDj+Df-\9Afs\g@;]TuFD,6'
+ED%+BleB-EZf(6+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%ATT&*Bk)7!Df0!(Gp$!R5t"LD9N`KP
DBNA*+E)(,ATAo.%144#+<VdL+<YT5+=D)DA7TCaF=.M)+<VdL+<VdLA8lU$F<Dr/76s=;:/"e<
%13OO+<VdL+<VdL:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t8g&.cB5)F/ATAn&$6UH6+<VdL
+ED%+A0<7<Ch.'j@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<BlbX2$4R=b+<XET<(/hjBkAK5Dfm12
Eb-A3DJXS@Bl8$(Eb0<6ARlotDBNtBDJj0+B-:],EcP`/F<F19/hf+)@;]TuDIn$'EX`?u+<Yi=
EcYr5DK?q=Afs\u+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.D
@;]TuEb0'*@:TfS+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k+A*b:/hf+)A8,OqBl@ltEbT*+/g+,,
AKXT@6m->TDKTB(+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0%144#+DG^9FD,5..TCP2DJ=!$+A,Et
+@L?hE$/(hEbTK7+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b.Nh>+3A*!B-Z^D?BOPdkATJu9D]j.8
AKZ,:AKYo'+EV:.+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!@<-W9?r03g75A6nAoD^"ARlp)Df'&.
%144#+CSeqF`VYAASuU2+EVNE?ugL5?nNR%DJ<U!A7ZlnBOPpi@ru:&F!+n3AKZ);Ec,H!+E(k(
+EqOABHU]'G]e+?3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78F(Jd#@q]Fp/g+,,AKZ&*FED57B-;8/
Dfol,+C\n)Eb0<6DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7F<F-tGAhV?A.8kg+<Y*'G%l#/+Cf(r
@r#drB-:f)EZek4Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(+B<;n@rGmh+DkP4+Dbb/BlkIi:IHRO
+CS_nCh\!:+:SZ#+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#D.RU,F!+q7F<F1'F!+J#Bk)'lAKZ&:
E,]`9F<G7*F!+n-G@>c<+E1b0FD50"/e&.1+<V+#+=\LA2'?gJ+=AOE+CSeqF`VY9A0>u4+EMIA
F<GU8B5)F/ATD?m+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`AU#>/EcQ)=F!)lBEcQ)=F!,17+EV:.
+ED%+AU#>/G]7\7F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&@;]Tu@r,RoBkD'jA3(h\.X,oODJ(=>
Ed2XJI4cXQDJUFC-OgD*+<XL$BlA#78l%htG%G]8Bl@m1+DbV2+ED%+AU#>/EcQ)=F!,+6+EVNE
FD,5.FDl+@Ch7d$C`mh?@;mh.$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#
Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o
/Kf+GAKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#
D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@+@KpaARfg)@!d6.+>,9!+CKVG?m&ukAnc-s
FD5Z2F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l+:SZ#%144-+<X*`BlkJ-Df'?"DIdf2
A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&Dg*=5Ec6/CATAo4Df?hAE-!W@
$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W9
6>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa<+T/S@UX=hA0>E$@s)X"
DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)+DPh*Ch\!&Eaa'$>psB.FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N
0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.
+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^
/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd56
8S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarck
F(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:
@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+
681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn
+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/e&.1+<Vd9
$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,F(Js+
C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/%144-+<W(R
ATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6+ED%5
F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[KqATJ:f
+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:SYe$6Uf@
+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2
FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n0J5%%/KdGm@qBLd
ATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,
ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!ARloU:IH=;
ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.@rH7+
BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@
AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(qE$[7n7qHcp
BlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>
+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'A8,OqBl@lt
EbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpdF(HJ+
Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-+CIo0
=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.
+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTR
F<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4D."n;
?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO
+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,
ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0N)Ip
F_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5
+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3@ruWu
ATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1
FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlok
ChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U
?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+
Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3
FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=
/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1
@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO
,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^
+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ct
FCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1Bq
FEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<
3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>Lq
BlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNE
FD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.
DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uogu
BlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C9
05>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/
Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&
FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:
Et&I!+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#
+<VdL+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%u
DfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth
+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%
ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCi
Bl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%
F(o9)D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL
+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL
+<VdU%144#%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^
+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6
Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaE
A90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6
+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;
DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc+<V+#+<Ve+BOr<*
Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$
ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g)8Z
%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeq
F`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqo
Df0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*
+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r
+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5
+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1
Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->
3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjA
C2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r
.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=
+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7
A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8
+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ
0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5
F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]
E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW4
0JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#
/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL
+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'
@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s
$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4
?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9
A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9
-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF
3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9
+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nr
DJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-
@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)
E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1
F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4
%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8
DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)
F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn
/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo
@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W
4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL
+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]
3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2
%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$
@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs
%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO
+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu
?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("
@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums
+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.
+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS
+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9C
CghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1
@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)
FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#
G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%
67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7
AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#
+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-
+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;
Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8
F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.
+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*+
+CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'
Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1r
FD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jk
Bl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4
?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,Oq
Bl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4
F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.
+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b
.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq
+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g
+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKr
ATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/
ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t
@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dn
ATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8
BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH
@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$
B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO
+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrq
EX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+
AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@
?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.
DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A
?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;
@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7Z
ATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`r
Bl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.
@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdk
ARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-
DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=
@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge
+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!
Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8
DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;
D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WG
FD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!
Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg
@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"
E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"
DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6
>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In
8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+
F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO
?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$
B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H
%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0
+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6
DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5
GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1
%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6
Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+
GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIj
CERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%
@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%
/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1Bq
FEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUE
AT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc
@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#
+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.
E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(
Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL
+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#
+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:g
B4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])
+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL
+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l
$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\A
BOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=
-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I
+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"
FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<l
BlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFb
ARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>g
IXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWC
H$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+
A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(
+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59
-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[
+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2
Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!
?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.
BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3
De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@
?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6
@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!
%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(
+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:
$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*
+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$
@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6
Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F
%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB
/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\
F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s
+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ
+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI
$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0Au
H=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#
ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8
Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhK
ASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%
D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=
De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'n
F!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.
+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q
@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo
@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&
DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(k
F!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl]
;F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4
@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d
@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t
2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;
@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlol
F!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc
+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUj
BOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9
AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@
Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIq
F!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%
Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=
.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUj
AoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9
+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(
@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq
+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ
%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(
ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0
+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,
+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:C
E*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.
F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9
Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL
/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=)
,9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0
?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9
$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEu
EccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&
$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNE
Eb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^
+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!
D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99
$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%
+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$i
A1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5
DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7
AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9
C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k
9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,
AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%
@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%
@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3
F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=
Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.
FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1H
F)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9
Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E
8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9
A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je
2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=
AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO
,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&
8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=
$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5u
Bl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*
De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,
Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.
+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMt
F)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg
+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78
+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>
A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"
A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2
E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@
6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p
@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI
?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#
+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0
@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:
@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4
Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?
F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8
@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.
F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO
,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?
ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LG
Bm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63(
$6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3l
FDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/
A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-
H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(
@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/io
Eb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:
/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-
0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0
Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s
+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm
2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth
%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;
DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84
@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'
1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1
@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^
$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:Wne
DCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!
@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1
+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)
@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'
D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%
Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo
@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$>=-pFDl2FC2[WnDdtO]
B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0eP7)/KcHcBlGLDF`)52Ch7$rARl5W%144-+@L?hE$043
EbTK7+D>2)CER,#ARfKuDJsW.A0>T(+CK%pCLplrF(Jj'Bl@lA%13OO,9nEU0eP151*A.k8p+rq
+>G](+>PW+1a"2CATDWrDIm^-+Dbt+@;KKtARoLsBl@l<%13OO+=\L.Bl7j0+D#(tFE8R5DIaku
A7TCrBl@m1/g+,,AKYf-@psInDf-\9AftJrDe(J>A7f3l9OUn3=:GT[+<YB>+Du+A+CehrCh7-"
Dfp.S+Auc_ATD@"@qB^(FDi9o-Z^D>AS,k$AKWuc0JXba@<Q3)@V'+g%144#+ED%1Dg#]&/g*b^
6m-AcG9Cp;EHPu9ATJtd+?;&.1*CLU+DbJ.ATBC4$4R=e,9n<c/hnt5+>"^*AR]\&@<-W90eb.$
1,(I?+=L!'/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Ni,;A7-O$ARfgrDf-\/A8--s
A0>K&EZf72G9C9O+E(du+E)4@Bl@lA%13OO,9nEU0eP150H_qi7V-%LF^]<9+>k\m1,(I?+=Kch
F(fhA9k-_&F(f/o@q?cOA8-."Df.!5$4R=b.NhJtG9C=5E+NotBm:b=DBNtBDJj0+B-9fB6m-S_
F*)IG@:Wn[A1e;u%144-+AZHfDes!,AKXT'+D5_'E+irq+ED%1Dg#]&/e&-s$6Uf@6YKnGB4Z-,
FDi:0@W$!i/0J>@ATMs(?n<F.E+*6lA7-O%D]iq9FCcS:BOr;pA7TCrBl@ku$6UH6@;]TuF`V+:
De:+j83ng_2)ZRd@:O(qE$049A7]7ZEZet.Ch7Z?%13OO+=\LA83p0F?n<F.9LV6B?m&lqA0>8`
8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^+EVNEFCAWpAM+E!%144-+AHQfDfQt7D/aN6G%GN%
DKKqBFDi:@F`);D@psInDf-[L+EV:.+EVmJD]ie/BOPEoBlbD8DJ*m%DJ(R2$4R=e,9n<c/hen5
2'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%
+E(j7DfBf4Df-\-De*E%FCAWpATJu.DBNA,E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9
<+ohcCgh?sATAo8@:F%a+>GVoBlbD7Dg*=BDBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1
@q?cpDfQt4F`_bHAKYK$A7]g7%13OO+=\L4Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGn
ASrW!A7T7^+EVNEFCAWpAKW]_/e&-s$6Uf@<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!
A867.FCeu*FDi:CBQ&);%144#+EV:.+Dtb7+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n
0J5+:+>"^.@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*
DKI!U1*C:K+CJr.DfTB0?m'?*G9CR;Ch.T0FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#g
Et&I!+<Y?/CiFG<8l%htA7]1c+EqOABHVD1AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'
+A*b:/hf+0F!+n/A0>GlEboH$EX`?u+<X9(F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/
%144-+@C'fEb/a&+CJVeG$lG0Df/uo+CT;'F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5
FE9&D$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."
Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y
$4R=b.Nfj%Bl[cpF<G+*Anc-sFD5Z2+CT5.ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1H
E+*j%F!+n%A7]9oFDi:3Df00$B6A6'FD5Z2+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmf
EZd@n+>PW+0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/
ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC
3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5
DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL
8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLm
B-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@
/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJ
ATAo0@:C?uA7crmA7T7^+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$
%144mE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#
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
/e&.1%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]
ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hnt7+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOA
A1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("
@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In
@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9
E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GA
ATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[Wm
F^eo7E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKi
Cggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!
$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU38
3[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]
:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+
%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJu
F!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE
$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&
8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlol
A7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"
DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1
@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA
/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.
Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<
@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3
Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#
$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#
+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EPi$7QDkD..<r
An?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&
+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP151E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3
De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a
0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eq
Ch.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm
:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm
:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5
%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&
Eaa'$/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,
+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<n
De!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*
F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F
3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3
Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIs
BOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?
AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa
@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQ
CLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM
6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc
0eP151E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0
Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCpt
F=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*
%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E
3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5
BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5
AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5W
FDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5
BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>
8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(
De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhK
ASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'
+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5
BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b
+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6
@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht
;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q
.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.
+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,A
A7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-
DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk                                            ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)-45+>P&o2'=Y6+>PVn1G^..0d&2,+>GPm1,pC21E\J3+>GSn1-$I33?U(6+>Get1Gqd#6pamF
9LMEC;cHOj=`S(`ASuT48l%ht@WcC$A0>Q"F*)>@Gp$pAB1brf<)6:`;aOJU9LMEC;cHOj=`S(`
ASuT48l%iS:JXY_+C]J-Ch+Z%BleB7Ed8dDDeE$F6r./^:IJQ,A4fWc+EVO4D]ik1F*))0F*)>@
H"q8.B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2FBPDO0DfU,<De*Bs@qT@jATD3q05>E9A8bt#
D.RU,+>"^GBOPdkAKYZ#F*)>@H#6u-BkCptFD>`)E+*6n@;[3)@;]dkATMr9AoD]48l%ht@:Wne
DJ`g"BkCptFD>`)A8bt#D.RU,D..<rAn?%*+D,P4+A,Et6r-0M9gqfVD..<rAn?%*C2[X(Dfp)1
AT2'fD..<)D..<rAn?%*+D,P4+A,Et;bpCk6U`,+A7TUr                             ~>
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
zz=:zz,'adArguments00 odSmoke00 odSmokeArgFail00 putMaxnameSmoke00 restdSmo'
zz=:zz,'ke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''),<<;._1 '' jodstresstes'
zz=:zz,'ts getStress00 macroloadStress00 makeHashchkStress00 makeStress00 p'
zz=:zz,'ackdStress00''                                                      '
zz=:817{.zz
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
F>5I'A8,OqBl@ltEd8dE@;BFF@<6*lBPUO`Deio<0Hb4@CLp%FF(f&sCK#=qATMoH0IJ;#-p0UR
/mg=U-Qm/BA0>W*A8c?5.4cl04?G0&0d%hdC2[X%Eb02uEb0?(F*)IGC2[X(D/X3$FCfN8F!,49
A92j5ATMp7ATMs7-RgSp4?P\X?SNZN+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj
=Wg[>6r./^:IJQ,A0>Q"F*)>@H"q8.+D>J1FDl2FC2[WnDdso,@;]dkATMs.De'u-@;]dkATMs.
De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$>,Vh&/1b^jC2_HpC2).*N1bpsE+>PW+
1b^jC2_HpC2E3BI1bg[=+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+
1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-p@2DR'G+>PW+1b^jC2_HmG1c-mF1,:U@+>PW+
1b^jC2_HpC3&ruS2)@$J+>PW+1b^jC2_Hp@2)@3H3AWEN+>PW+1b^jC2_HpC2).*N1bpsE+>PW+
1b^jC2_HpC2E3BI1bg[=+>PW+1b^jC2_HpD0fLpH1c7$H+>PW+1b^jC2_HpD0fLpH1c7$H+>PW+
1b^jC2_HpD0fLpH1c7$H+>PW+1b^jC2_HpD0fLpK1H@0L+>PW+1b^jC2_HpD0fLpH2_[*L+>PW+
1b^jC2_HpC3&ruS2)@$J+>PW+1b^jC2_HpC3B&`N0f(O=.4cl01*A@u1,(I?0K1^G/i>OC1GLmH
2E)a60JYI=2_d6D2Dd3L0K:jE2)-4/0JYI=2_d9E2)mTV1GCgH3?U(21,L[D0fUdC2E<]V3AWWQ
+>PW+1b^jC2_I!H1H$pF2D[*G+>PW+1b^jC3%d'K1cR3J0JkI=.4cl01*A=t1,(I?0K1^F/i57B
1GUmJ1bgp31,(I?0K1^F/i,IE2)@'L2)@$21,(I?0K1^F/i5@E0etIB3&3H91,(I?0K1^F/i,IE
2)@'L2)@$;/1<V9+>Y8u0JYI=2_d9E2*!QO3B/iS0K:110JYI=2_d6D2Dd6G1,q3Q2`)X40JYI=
2_d9E2)mTV3AWBJ0JXb+0JYI=2_d9E2*!QQ0JG793&Da50JYI=2_d6D2Dd6G1,q3Q2`)X40JYI=
2_d9E2)mTV3AWBJ0JY(.-p07-3$^751,L[D0fL^@3&EHH0K([B2'=Y.1,L[D0fL^@3&EHH0KD-O
+>PW+1b^jC2_Hp@0fLgH2`!HN+>PW+1b^jC2_I!H3&NHN3&ilS+>PW+1b^jC3%d'K3AWQP2*!EL
+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-mF1,:U@+>PW+1b^jC2_HmG1c-mF0Jk^D
+>PW+1b^jC2_HpD0fLpK1H@0L+>PW+1b^jC2_HpD0fLpK2`*NP+>PW+1b^jC2_Hp@0fLgH2`!HN
+>PW+1b^jC2_I!H3&NHN3&ilS+>PW+1b^jC3%d'K3AWQP2*!EL+>PW+1b^jC2_HpD0fLpH2).*L
+>PW+1b^jC2_HpD0fLpH2_[*L+>PW+1b^jC2_HpD0fLpH2).*L.4cl00I\P$4>838-p014/1<V7
.4dS8                                                                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
