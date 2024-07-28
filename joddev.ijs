NB. sha256:30c45c92fb73c078a9c2f9b3edde5d9fd5365864654c432bbba62e6f97d51fc5
NB. JOD dictionary dump: 28 Jul 2024 13:02:06
NB. Generated with JOD version; 1.1.3 - dev; 6; 20 Jul 2024 12:14:32
NB. J version: j9.6.0-beta14/j64avx2/windows/commercial/www.jsoftware.com/2024-07-19T02:38:13/clang-18-1-6/SLEEF=1
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


CSRC=:36

ERR032=:'hash does not match ->'

ERR033=:'invalid dump file ->'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.3 - dev';6;'20 Jul 2024 12:14:32'

JODVMD=:'1.1.3 - dev';7;'28 Jul 2024 12:56:54'

OK011=:'hash matches ->'

RUST=:35

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
NB.   NB. check dump script hash
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
1cHO:+>P&r+>PVn0f1"21E\D++>u"u0fC.01E\D,+>Y_p2BXb1+>b2r1E\Ls0f;<s;F=q:F)Q2A
@q?d$E-,f4DBNG-A7\>Y8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2
+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$FDl)6F%T4r<)6:`;]odlFCfK)@:Njk
/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!3TcDKKH1Amo1\
C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u
+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APuN,<-!,&F<GXCF`Lu'+E)4@Bl@l3@rGmh
D..3kD..3kF!+'tF(96)E--.                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1X.0fU:2+>GYp0f(^H+?:Q'1,^701a"\93?U%5+>G`62'=V1+>Gf23$9t2+>P`.1*A;-+>GZ3
3?U%9+>GQ02BX_7+>u&5+>G\q0ebUB+>G\q0f1R=+>GVo1,:X>+>GYp0et[C+?:Q!1,h*60eje*
2_d<83?U%41c?I20H`))2E;m70d&2*1cAlUChId-;f-GgAM>f567s`uASc""E)UUlCLo1R+ET1e
+=Lc3ChId-.3N\KDeio,FCfN8F"Rn/:-pQB$;No?+<Vd\.3L$\ATMs.De(OZ.3N2HBleB;+>"^V
F`&<M@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:0$;No?+<Vd].3M5Y6m-#OFs(=0@ruF'DIIR"ATJtB
C2[WnATfUIC2[W6+E_d?Ci_$J@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW+1hq/L1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065
Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eIASc""E)UUlCLo1R
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm
@rsjp+=D8BF*)/8A2#kg%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%16Ze+E(d5
4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1Eap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-
4$"a*Ddd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3V
Ddd0TD/X3$%14L?+Z_J<.3L]5-ZW]>Ci<`m;f-GgAL@oo%159QHZ*F;FC])qF<Fd11E^UH+=ANG
$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[C
Ddmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+Dbt)
A0>f"C1UmsF!,17FDi:DATMr9A8,OqBl@ltEd8*$0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;R
Deip+ATMrI%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>443%15is/g,4RD.Oi&
Ec6)>F"_TWBlmp-+EqC;AKYf-@:Wq[%16Ze+D5_6+=ANG$>"6#1E^=NE$-MU%13OO:-pQUB6%p5
E$-JMF*22=AKYK$DKKH-FE7luB6%s8Eb'5S3Zr'UE$-kXE+rft+D5_6-RT?1F*22=ATMs74ZX]A
+D5_6+>G!XBk(p$1E^=NE$-MU%13OO:-pQUA7]RgFCcS5@VTIaFE8QV+EV19F<G16EZf=AATMF#
@q?)VATAnA4#%jsBk(p$B6%r6-RU>cA7]RiEc<-_0d(FL@r!3"Ec?5CA9/1e/M8.o4>@stBk(p$
B6%s8Eb'5?+D!/J0d(FL@r!3"Ec?5CA9/1e%16Ze+=JX"0d(FL@r!2C+D5_6+=ANc4#8<.A7]Ri
Ec<-_0d(FL@r!3.F_Pr/F*)I4$8!kQ-p04,E+rft+EM[>FCfN8F"&5C/g)kkE+rft+EM[>FCfN8
Et&Hc$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7&tk;f-GgAM>f567sa#FAm$pCLo1R+ET1e+=LlE.3N\K
Deio,FCfN8/e&._67r]S:-pQU-tdWN+D,2,@q]Fp+=Lr=F"&5RAU&;>Ao_g,+A,LQ+E)9C8k;l'
ARoLs+EqO;A8c[5/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e8l%htBlbD;F`))2
DJ'Cc:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`gCbdsZ
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g,4WF_55.F)Po,
+EV1>F<G:8FDi:DBOr<-FCB&t@<,m$8g%\UBlkJ.Bl[cpFDl2F%16Q_Dfg5G4ZX]:0ea^p+=oQ$
8K_P^+EqL-F<F-tA8`T"ARf.kF(HIc+CT+0GA(E,+A!\aD'pl.7L]\Z+BostDf9`BF<GdJBlmo/
C2dU'BHS[OFCf<.04Jj<Anc'm/no'A-OgCl$;No?+D,2,@q[!,AU&;>F(fK7Ch+Z*@<?!m+CSl(
ATAo0Bl7K)ASu$$DJsQ4@;KY(@<?4%D@Hq^Df9)n@r"4g+D5d=-Xq"4Anc'm-OgDlDf9`BF<E.r
+C]8-@UWb^+>#2g6W+@#%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?YXLiBOu"!;f-GgAM>f567sa&
De*NmCiE<iDeio<0HbHh/KcHVDe*NmCiCgGF)>i2AKZ)+F*'#D$;No?%15is/g)8Z0I\,::IH=>
F!,:;@:Wq[+>"^WFCB&t@<,m$8g&7uBl%i5-t[%8BleAF+Dbt)A7]9\$;No?%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JYJ"F_ifl%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/
F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@
6#(=KBOu"!;f-GgAM>ec%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b
+B)6*;H/&r%13OO:-pQU-u*[2BOu"!.3N\R@<-I2+CQC3A7cs)ART+\EZfIB+Co2-E,8s.+=LuC
A1hh3AgnjHBPCsi+DGm>%15is/g,7]E+rfjCi"A>Bl8!6@;KakA0>?,+EV:.+=LuCA7TUgF_t]-
F=A>@A7TUr+DG^9FD,B0+Dbt+@<?4%D@HqbAU%p1F<Dr[@:WneDK@IDASu("@;IT3De*Bs@s)X"
DKIONA7f@j@kVS8A1hh3Ag\#p%15is/g+\=F)Yr(Gp"MMDe(J>A7d8"$>"6#C2[WrASc<.0F\?u
$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFCfN8Ci<flCh6sfC2[WiCi<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX
/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>BBk)66/e&._
67r]S:-pQU<+oue+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8
+EM%5BlJ08/e&._67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(
@q?csF<D]B@:O(o+EV:.%15is/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S
:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e-u*[2FCfN8Ci<flCh5%<F`V,)+EVNE@rc-hFCcS:
ATMr9Ci<flCh4%_:-pQB$;No?+<Vd].3L$\A8,Oq.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?@<H3:2@U!g67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L
1,L+rE+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?
+>PcgF`&rp+ED%:Bldi.AoD]48g$,H2BXDXDe!g!@<?'6@rGq!@<6!/+Cf(nDJ*O%%15is/g)o+
C3=>J2^!-PG%l#/A0>u4+Dbt)A0<:BA8,Oq.3L2bF(KG9Bl5&'@;KaoDJ()5@rc:&FE7lu%159Q
HZ*F;FC])qF<Fd11E^UH+=ANG$4R>;67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IC:JXYM<)64B
4ZX]>%15Et:J=&R:JEQ,3Zp-d$:7Na9MA#V<'<8b5;"'50JF_,%15Et:J=_R6;0g23ZpX>+>k8r
1E[qc1(=R"$;!ul5u^WS0KhH>0b"I]:/k1Y6;0g23ZpX>+>k8t,V^u,%13OO7SHTD<(ok^<'<8b
2`E?L3?TUj5;"'70JF_,1CX[#$:@?M;G9Y\<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^
+EqL-F<F-tA8`h)$4R>@=\Vj]69R@P1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*
BlbD/Bl7K0%13OO6;L]^<)lCW4ZX]64@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;
67sC%FDl22+Dbt+@;KKtGAhM4F!,1/+E2@4F(K62%14L>+?CW!.46JP$>sZi4Y@j)DJWZ-/9GHE
FDPl*@;KL^BkhQs?S!R3-OgDsAhG2N+E).=4Y@j$/oGK8/12QS/i4puA8a(0$6UHT0RInQF*)5:
@ps1b?YO7nA7$HuF`\aEDK?6oAScF!BkAt?,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_
F(K&t/g+\C/e&.1+>=o\%16ZaA1e;u.1HUn$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)
F>,((-SZ`,+>G!667sC&ATMr9F(96)E-*H:$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4
CiaH3CLo1I4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2
AM>Jn+?MV38PW5N<)64B+A#=-<'`iE74/NO%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-C
CLo1o@:O=r0IJq;0fpas/g)o*-OgDH0RGW!E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5
DJsW1Bl7Q+@Wcc8De!:"E-WRIE+*6f/g*_.@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,Oq
Bl@ltEd8dGE+Nnr$>aWhA5d>`CLqU!F*'-367sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.
@;Ka&@rH1"ARfgrDf-\9Afr47@VTIaFE8QIBl8$2%15is/g)QaA8,Oq.4u&::-pQB$;No?+B3#g
F!)TIATMr9+EM%5BlJ/:+Dbb-AKWC;Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq
:-pQUBl8!+A7Zm%FD,6++EV19F<D]I@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]I
DJj0+B+52C67sBsDe!3lAKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*
@<*K$Dg-(O%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\+mC2[X)ATMs0De!3lALSaE
F(Jl)FDi:3Eb/[$AKZ)+F*&O@De!3lAISuA67r]S:-pQU+<WBf+=M>BBk)66+Co1rFD5Z2@<-W&
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPFnF_<Bd%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l.D..]F1a$p[A79Rk+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,Oq
Bl@ltEbT*+-OgDX67sB91hq/N1-$ItAThd/AKYT'EZdss3A*34-t@1*Eb/[$AM7P3ATD4#ALSa3
BOPdkATJ:f:-pQU1,N`gCbdplEb0E.F(Jl)FDi:<Ddd0!.!0!6@rs.B/Kf+GF<G:8+CehrCh[d"
+EM%5BlJ08%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7F!,RM
E+O)"$=[plCdD#r9e\^k+>=63@W-1$5u^WS0g.Q?0b"J!Df9Gc8Q/SO3ZpX>+>GQ(,;K]8@W-1$
<'`iE76N[S5;"'9+>GYp,TniO$4R>VDKJ0D:JEN+3Zp-d$>FC"<'`iE76N[S5;"'9+>Y8t0JEqC
%16]`Ddd`]8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>PBOPpT8Q/SO3ZoeA+CT+0GA(E,+A!\a
D'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OgCl$?LK0<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF
@W-((+CT.u+EV:*F<G:=+D,>*AL@oo%16Q_GZ.RA7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^
.4dS[=\Vj]64F82$;No?+EMXCEb-A0De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgE#
Ch#U\+=D&C?RICHATMs0De!3lARB.dDe*3+-XS51$>F*)+<r"IDK@rn+<iFUCh#"D+DEGb-Qlr<
/e&.1+?hK+FCfN8Ci<flCh6sfC2[Wi+E2IF+E).=%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+
E-67FDJUG0/i4"EAScF!BkAt?A8a(0$6UHF+<V+#ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?
0RGMsE-67F-Za-CCLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-C
CLo5"ATMrJ-T`\2+?^i&+AP6U+EV19F<GX7EbTK7-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQ
E$-N;Df9H5D/X3$0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NB
DKKr:Deio=-T`G43[\WZF?rl%9e[](DKJiD6;0fq%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NL
F_Pr/F)>i2AMGPo+?MV3F)>i2AMI.qF*')YF)>i2AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".
$9g.j1a$a[F<DrPD/X3$0hl(dEc3WZ4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[
4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO
:-pQUCh7$uAKYMt@ruF'DIIR2+E)41DJX6"A9;C(F>5I'A8,OqBl@ltEd:DH/h1[U@:XIkF*',j
0P"m-FD5Z2@<-W9F=f'eCi<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIlFEM,*+EV19F<G+.@ruF'
DIIR2/e&._67r]S:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lQATMs.De(RV0I\,\Ddd0fA.8l@67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AQiuASkmfEZd(s3B7NU:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU0emQaFttfqF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0fX)]F>5HlF`:l"FCeu*
AoD]48g$)G0K0FJ:-pQU1,N`gDDNshEb0E.F(HJ+DfQsm+?;&4+=L`<@rc-hFCd+8De3rtF(HdC
@q]:gB4Z,n$;No?+>PcgF_icl+Dk\1B4W3"DBL?BDe*s$F*&rUC2[W6+E_d?Ci_$JA8,OqBl@lt
EbT*++:SYe$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g)QWDe*s$
F*)5:@ps1b.3N/4Anc-oA0>T(+DPh*E,ol/Bl%?5Bkh\u$=e!aF`MM6DKI"9De*s$F*)5:@ps1b
+=BH@6#:IJA9;C(F>5I'A8,OqBl@ltEd9#A$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$4R>aA8,Oq0edi83ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1-Zip@FD>`)0eb:8-OgCl$;No?
+E)41DBL?LA8,Oq0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRXEb'56GA2/4Dfp.EA7]@eDJ=!$
%16Ze+E(d5FC])qF>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1TDJU[J.=6IqA8Z32
-QjO,67sC)DfTB0%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%
67sBnEc6)>Et&J$G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL+E(d5FC])qF>5Io
%13OO:-pQUDfB9*+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7
/0K"VBlmp-/0Je<@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1
+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is/g,+A
@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#TtFC])qF>5I'GRXuh
$;No?+EMXCEb-A;DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67FG^+HB$4R>;67sC$AT23hFCf!!
Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa/g<"mGpsjf/g_qn
+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd+ED%2@;TQu
G^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oW8h
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S3$<6QDIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=-tRXFEb0*!
+E_a:+E(j7E-67F@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f4=>5^F*',j
0Hb4NEb-A1ARTIjDJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7KsFD*$2$4R>;
67sBtATDEp+DG^9G%#E*Dfp+DA8,OqBl@ltEbT*++EMHD.!0$AFE8uUB6%p5E-!QQD.-ppDf[?M
AU%p1F:ARgEZf:2+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$>"6#A7dtc
+DkP&AKW?J%16Ze+E(d5FC])qF>5I'GT^351E^UH+=ANG$8EZ-+=Joe3\W!*HTG\L%16Ze+E1b!
CLeQ0A8,Oq0eb;+%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZfF:Dg-//F)rI7Bk/?8
+>=63%15is/g+Y?Df]J4.!0!6@rsFZ0R,#hA8,OqBl@ltEd8d9DIal"Ch7$m+E_W4$>"6#1E^UH
+=ANG$4R>;67sB[78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#cQCi<frEc=roDeio<0MXqe.Vs$5B6%riD/X3$0JFVk
/M/(nCi<frEc<HMF)>i2AKZ)+F*)IU%15is/e&._67sB'+>>5e.!0$AFD>`)0Jt:%AU%p1FE8QV
+EDUB+=L`?ART[lFCfN8A8,OqBl@ltEbT*+.1HVZ67sB'+>G;f8l%htA7]p,A8,OqBl@ltEbT*+
+=LuCA7T7p/0J\GA1SjGFD5Q4.3N&B@;0Od@VfTb$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JYJ"F_ifl%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@6#:ILB6%riD/X3$
0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>a
A8,Oq4ZX]5FCfN8C2[W:2(&h?%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luATAo3
A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%17,c+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?
F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*
+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OO4tq>%A0>u)Bk)6->9G^EDe't<
-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4
>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBs
Ddd0!DdmHm@ruc7Bl8$2+EV19F<G+.@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m
;f-GgATVL)F>+.20d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUF)Po,
+D5_5F`;CTF*22=ATJu<ATD?)Ci<`mARl5WATAo+Ec<-K-OgDoEZd.\B6%r6-RT?1%15is/g+eI
Dfp"A-6RAPBlmo/@rH7,ASuU2%16`gE-H>5F$2Q,B6%r60d(FL@r!3"Ec<BR%170!Blmp-FE9T+
+>Y-QEc<-U+E2%)CEPDUB6%r6-RT?1%15is/g+Y;ARfKuB6%p5E$0@CEb$;$E,]AsEcW@;DBL?D
De!F#E%)5'Eap4r+=D2>+Dbt+FCAW+4ZX^%De!F#E$-kXE+rft+D5_6GB.58%14LG0d(FL@r!3"
Ec<-K-Rg0L/g*4u0mbU$Ci<g*@:BZQ%15is/g+Y;ARfKuF*22=AKZ)+F*&O5E,]AsEcW@;DBL?D
De!F#E%)5'Eap4r+=D2>+Dbt+FCAW+4ZX^%De!F#E$-kXE+rft+EM[>FCfN8Et&I)4>@stBk(p$
1E^=NE$-MU.3N1S+?L]#HSKk`De!lt@LWYR$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7'1^CLp%FF(f&s
CK#(gCLo1R:-pQ_D..3k87?RQ@q]XVD/X3$0JFVk/M/(nD..3k.3N;4F(c\+BOt[h+EMC<CLnW1
ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e.!0$AFD>`)0JP"!A8,OqBl@lt
Ed8d=G\M5@F!+n/A0>T-+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JYJ"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@s)g4ASuT4
C2[X)ATMs0De!3lAKW?d5s]?rCLp%FF(f&sCK#(gCLo1R-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO0fL4<
+@nds87,e?De*2a$4R>;67sBpDK]H)Bk/>pEbBN3ASuU2%16uaEZd(q+DkP&AKW?J%16uaEZd(q
+DkP&AKWZ9$>sEq+>GetD..3k+=D#7CLnW*Gp$X+Gpa%.DImi20fL4l@;BEs@6+i)DImi20fL4l
@;BEs-Y#1jFD,B004np7AM7b=05YEEF(oN)05b3/@4l8/F!hD(DImi20fL4l@;BEs?SN[E3Zodm
FD,B0+DGm>F*VV3Des,t-OgE#ATAnO2Du[p@;BEs-SJqID_GdBD_GR6FCSu:Bkh]:%13OOATAo3
A0<rpFC])qF:AQd$;No?+CoV3E$/\*@ruF'DIIR2%16WX4ZX^&@;BEs-RT?1%15is/g+Y;ARfKu
BOPsq%16Ze+@nds87,e?De*2tD..3k+?Op2A7c8X%15is/g+S=FCfJ8A9Da.+D,>(AKWQIGA1l0
+Cf(nDJ*N'BOPsq%16QiFCfMV3ZrHS@:UKBHTG\L%13OO:-pQU@q]:gB4W3,Df'&.@X3',Et&Ic
H$!V=4ZX]5.OQ>e5;=i7,9S4?H$!V=.=E=JH$!V=%14g4>9IC#FCfM9GB.D>AKX']3b2h3$4R>;
67sBo@<6*)GA1l0+Du*?Ci=3(ATAo1@<?!m%16uaEZd(q+DkP&AKX']3b2h3$4R=O$;No?+>%q>
78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaW
F*)5:@ps1b?YO7nA7'1^CLp%FF(f&sCK#=qATMoH0MXqe.W&U0AOp6NBOb^k;fm%kF)s#h+ET1e
+=M)8CLnq;Cgh?sAKYN+D/^V2@<6*)FCfN8/e&._67r]S:-pQU+<W?e+=M>CF*)/8A2,bl0I\,T
Bk)7!Df0!(Gp$[CBleB;+CT.u+DGm>Ci<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp131,N`gCb[mY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]t
F_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aD..3k87?RQ@q]XV
FE1r6F"f9q%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r
%13OOFC])qF?MZ--Zip@FD>`)0eb:8-OgCl$;No?+E)41DBNb(EbAr+A8,OqBl@ltEd8*$ATAo3
A0>u)Bk)5o$8F4g0JG1'4<PkZDJUFC-OgCl$;No?+DkP&AKYetEbAr+A9Da.+EM%5BlJ/'$=ma3
3Zr9JCLnV9-OgCl$;No?+D>2)BHVA0Dfol,+DkP/@qZ;YATAnJ2]usGCLnVMHTG\L%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EP.UFDPl*@;KL^BkhQs?Ys4eAPcfWBQRg,F>,FE67sa)@;BFN@<?1)ATMrI0d(Qi/Kf+GFE8RI
E$076F*&O8Bk)7!Df0!(Bk;?.AoD]4E+*j%+DtV)AKYK!@<6K4FCfN8F"Rn/:-pQB$;No?+Eh=:
@UX@mD)reJF)uJ@ATJtBFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8A2#bf+CfG'@<?'k%15is
/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emQaFttl`$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>GTgDg!lp+EML<BlkJ3DKKe>FE_XGFCfN8F!)lJ@;BFN@<?1)ATMrI0e@0MFD+KZ
FD,c-F*')k.1HVZ67sB91hq/L1,'hkAThd/ARloqDfQt8+?;&4+=L`<@rc-hFCd+8De3rtF(HdC
@q]:gB4Z,n$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/
F<G=:A9;C(FDPl*@;KKt-UC$aD..3k:gnHZFCfN80JOpa$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$4R>;67sC&ATMr9A8,OqBl@ltEbT*+%16W[@rucT3ZpLF-Zip@FD>`)0JFVkATMs.
De(OV+EV19FD>`)0JY!b$?pT;E+O)R3ZpLF-Z3jFDBN@uG%G]'+Eh=:@ODTl%16ukF`(f*GWe)1
0ea^r+?q_+2'an1%178iEaiWpGWe)11E\_$-[6a`+F,=D$=RIgATD6lBm;d%+>G!"+=D;:/gh)8
@rH7"AncKQ3Zp1#3Zoen+E^pA-OgCl$;No?+Du+?DBN@uG%G]'+Eh=:@LWZdATMrV3Zp.2+?qJ$
0ea%DATAo3A0<QKE+rft+Co1rFE7luATAo8D/a<0@j#`5F<EY+-Zip@F<GI>F`(f*GUEq-ATAnL
+E(d5-RT?1ATAo3A0<TLE+rft+Co1rFE7luFCfN84ZX]?+?CVmF^-:'$>"6#FDYu5Ddso/F`\`f
3[]#\F*&OJATD6lBm;!7$>"6#1E^UH+=ANG$>"6#De'tG+E2%)CER/%@ruc$$?Tj#F?MZ-1E\_$
-[6aa+F,=D$>"6#FDYu5Ddso/F`\`f3[]#\F*&O5A9MO)@V0>!+Cf>-C1_1)-OgDoEZd%Y?SN[6
DJUFC-OgDoEZd.\De't<-OgCl$;No?+B1d.<$5+>6UO:@;asb\%13OOATD@#E+No00F\?u$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFCfN8Ci<flCh6sfC2[Wi%16r\CLp=NFD,c-F*')k:-pQ_
D..3k:gnHZFCfN80JXbm/M/(nD..3k.3NS<FD)e9ATDX1FCB9*Df0V=De:+?D..3k:gnHZFCfN8
0JP"/%15is/e&._67sC(ATD6gFD5SQ+:SZQ67r]S:-pQU+<W?e+CT>4F_t]2+=M>CF*)/8A2#\g
+EV19FD>`)0JP+$FCfN8C2[W:1+=>UEb/[$ARl5W:-pQU+<WBf+EV19F<DuK@;BFN@<?1)ATMrI
0e"5cF`%Wq:-pQU%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;"
Dg!lp%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g)o+C3=>J0HbCIG%l#/A0>K&EZf*>3A*34-t@1*Eb/[$AM7P3ATD4#
ALSa3BOPdkATJ:f%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1
Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eR@;BFN@<?1)ATMrI1+*M<%172gF*(u2G%ku8DJ`s&F<DrD
Df9/64"!Wr6miEN%15is/g,7IF*&O8Bk)7!Df0!(Bk;>p$=mj\FE9T++?MV3FCfN8C2[W:0HbIK
F*)/8A2#_\FCfN8C2[W:1+*M<GBA+LATL!q+?MV3DJsZ8+CSf(ATD6&G%G]'-OgCl$>+!gAT2("
BK\C!C2dU'BHS[OFCf<.0..29%15is/g+S=C`m\*FD)e9ATDX1FCB9*Df0V=F(fK7Ch+Z*@;BE`
$?1)M3Zohb/g3#"+@.V(0H`(mBeCMa%13OOATAo3A0<9SHZ4'UHXpi#FE7luFD,B04ZX]60RIb\
.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/13,(Bkh]:%16Ze
+>Y-YA0<6I%13OOATAo3A0<9THZ4'UHXpi#FE7luFD,B04ZX]60mdk].=68\H#R>9%16Ze+EVI>
Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/13/)Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3
A0<9UHZ4'UHXpi#FE7luFD,B04ZX]614*t^.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(
ATAo1@;BEsAnc'mE+*j%/132*Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3A0<9VHZ4'UHXpi#FE7lu
FD,B04ZX]61OF(_.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%
/135+Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3A0<9WHZ4'UHXpi#FE7luFD,B04ZX]61ja1`.=68\
H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/138,Bkh]:%16Ze+>Y-Y
A0<6I%13OOATAo3A0<9XHZ4'UHXpi#FE7luFD,B04ZX]621':a.=68\H#R>9%16Ze+EVI>Ci<f+
E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/13;-Bkh]:%16Ze+>Y-YA0<6I%13OO%15is/g++^
;cFl<<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EP.U
FDPl*@;KL^BkhQs?O[>O$>scnG]6SuDeio<0MXqe.W009G]6SuDeio<0HbHh/KcHZDe404.3N\K
Deio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e.!0$AFD>`)0Jk4$AU%p1
FE7lu:-pQU+<WBf+=MASBl%i>+Co1rFD5Z2@<-W9BlbD*G%#*$@:F%a%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?C3=>I3=Q<j67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d
5s]C,AU&/mD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.
;cH%\<.->-$4R>;67sBsDdd0!F)Po,+E_d?Ci^_5DKKe>FCfN8+Dbt+@;KKa$>"6#De't<F`_>6
F!i)7+>Y-YA0<6I%16Ze+EVI>Ci<f+B4Z0-4$"a1BQ&*6@<6K4@rH3n-OgCl$?Tfm@rsjp+=D8B
F*)/8A2#hf%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBjEb/[$AKYl%G9D*JEb'56FD,*)
+CoC5DJsV>AU%p1F<G:8+EV:.+Co1rFD5Z2@<-W&$>sF!GAhM4F$2Q,-o2u,+>>5R$>s^%4Y@j2
,[i_C$>+3s?[$O$/g+j\+>GPmA8a(0$6UI/ATr?=A3DOf-ms4ZA1&oV,!'pgA19&WDJ^aM/0[,c
Bk2+(D-p^dDe*2t0F\@3+=M,=GB\(<.6T^7>p*>o0d/S5-8H#;+<YQ=F$2,uDJaGG4Dn_SGB.4'
$>"*c/e&/*D0$-n.1HUn$;No?+EMXCEb-A2ATo8@DfTB0%17<"A8Gt$F?MZ-DIn$9DfTB0+>=63
ATAo8D/a<0@j#`5F<GdJA8Gt$F:AQd$;No?+EV:.F(HJ3ATo8@DfTB0+CoC5DJsV>BOQ'q+D#e:
Cgh3iFD5Z2Et&IfEZf7DAU$@!+Du+/G]4cQ-OgE,Eb'!#F*&O9/g,%UAU"Xk%15is/g+_ME,8rs
DBO"=D.Oi.Afu2/AShk`ATAnI+?1K_F`\`S2'@5u+Eqj:Ch[s4.3L/o+?V#oDIdZqF_t]-FCeu*
@rGmh+DGm>@:EngEb0-1-OgDoEZen1GBc83+Du+/G]4cQ-OgCl$;No?+Du+8AKYo'+EV:.+CoD#
F_t]-FCeu*GAhM4F!,O;Dfol,+C\n)Df-\>BOr<&BleA*$8!kY2'@5u+Eqj:Ch[s4.3N1S+CoA6
GRXuh$;No?+CfG'@<?''DIn#7FCfN8F!,R<@<<W&D]iq9F<G.>BleA=Bl5&8BOr;sBk)7!Df0!(
Gmt*uATr6-F*)Id3Zoh,+?CW!.1HW%D0%im+>=ol,[i_C$>+3s?Z^@2/g+j\+>GPmA8a(0$6UI/
ATr6-F*'Pt+=D8PF=/Uf,!'geF=AagDJ^aP,!'7KA8ZO,?X[\fA7$H5%144#DJaGX/g,%KF"D3?
GB@D;F?:jlBPDN1BlbD*+EV19F=.M)ASu$2%16uiEt&I*%13OO:-pQUF*)>@AKZ)+F*)I4$?U?2
FCAWpAN`'sDIn$6ATMs7+>=63ATAnJ+E2IF+EV[HFCAWpAIStU$;No?+Du+8AKYo'+EV:.F(HJ9
ATMs7+D>2,AKYQ/E,8s#@<?4%DK?6o-nlcj+u(3^F*)M4@VfU)+D!/J0d(@PAU&/:-RT?1%15is
/g+YEART[l+Dtb7+D5_5F`;CEAo_g,+Dtb7+EqaEA9/1eB6%s5@:DA\+Eqj:Ch[s4+FAP[-o!D?
0etF3HSZdSDf&r+,Bn0=Ch[s4%16`gE-,Mt4ZX]6-YII=-RLAk/j:C3+F>:e+D5_6FCAW-+=o,f
B6%s5@:BZQ4"qe(+u(3QEc<3W+D5_6FCAVf$4R>;67sBuDf0,/De:,6BOu6r+D5_5F`;CEBOQ'q
+D#e:Cgh3iFD5Z2Et&I)0Hb]d0d(+LE-,Mt.3N1S+>P'WDe404+=ANG$4R>;67sBjEb/[$AKYl%
G9CsLBlmp-+D,Y4D'3_-G9D!=F*)I4$?L?(FCAWA3Zoh)+F>:e+EV[HFCAWpALSaKINU$n0L%9I
0I_?)+Cf>,@NZn;F*)M4@VfTb$?L?(FCAWA3ZoguF*21E-7gJr4s2O%HQk0eF*22=@:CZ./1r&d
F_Pr+@LWZ+0Hb]d0d'aE1E^=NE$@"ZF*22=@:BZQ%15is/g,%MDIjr/Afu2/ATME*F*22=ATJu-
@<Q3)AU&01@;]LqBl@m1%14L;+F>:e+EM[>FCAW-+D!/J1E^RRAU&/:-RT?1%15is/g+YEART[l
+Dtb7+B1d3<*s'KDe*2tD.-ppDf[%5Ec5e;FCfN8Et&IfEZd1]E-67FD.-pr@:DA\+=JUS@:LZ3
/1)u5+>=pb+u(3^F*)M4@VfU)+=o,f-p1Ht=B&X9C2[Wi.3L/o+>G!c+u(3^F*)M4@VfTb$4R>;
67sBuDf0,/De:,6BOu6r+DkOsEc6"ABOQ'q+D#e:Cgh3iFD5Z2Et&I)0Hb]d0d(=A@ru-g.3N1S
+>b3YDe404+=ANG$6Tcb%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3lARB.dDe*3mDffW4E)UUlCLo1R:-pQ_DJsW0
Ec=roDeio<0HbHh/KcHZDffW4E%)oND/X3$+EV19FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:
2(9YZG\M5@F!*%WEcl7B-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7%15is/g)8Z0e"5;:IH=9ATf2,
Bk)7!Df0!(Bk;?.-u*[2A7]p8+DPh*/0K(WBl%i>+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`gCbdsZ$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$a
DJsW0Ec=roDeio<0II;:%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<
<'aD]I4Ym8%17/iDg-//F)sK*>p*>o0d/S5-8H#;%172fBk)6J3ZoelATMs.De(OZ-OgCl$;No?
+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&IfEZf:2+?MV3C2[WnATf22De'u5FD5Q4-QlV9
1E^UH+=ANG$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0T
D/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX
+Dbt)A5d>`CLnk&$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<DfTB0
/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&
DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1r
FD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1
+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sC%Df'&.B6%p5E-![RF_Pr/F!,[<Eb-A0Ddd0f
A.8lWEZf"8E$-MU%16Ze+>Y-QEc<-K-OgCl$;No?+EM47G9C=3Gp%6IB6%p5E+NQ&GAhM4Et&If
EZfF:Dg-//F)rIAB6SB,F$2Q,DJsW0Ec<.L/g+\BC`k)Q%13OO:-pQUB6%p5E$/_8ATE'<BPD?s
+CT.u+ED%'BOt[h+>"^VATN!1F<GX<Dfol,+C\n)DKTc3%16Ze+D5_6+=CT6Cj0f<A92C(Dfp"H
4+/`!B6SB,Et&IfEZfF:Dg-//F)rIADffW4E$0Q]+CoA++=ANG$4R>;67sB4HW3F4<$5+>6UO:@
;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFCfN8Ci<flCh6sf
C2[WiDKf#rDeio<0MXqe.W0H/D/X3$0JFVk/M/(nDKdNPF)>i2AKZ)+F*'#D$;No?%15is/g)Q[
G:=X_DIn#7GAhM4.3NSG@:Nki+EqaEA0>u*G]Y'BDBN@1+A*b)8l9[QDfQsC8k;l0+EqO;A8cZ$
$;No?+D,P4+<Y6+Bln',B.b<+BOr<.AU&;>BlbC>A7]dqG%G2,Ao_g,+EV13E,8s)ATJt:F*)>@
ARlo+Bl4@e:-pQUE+*j%+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU
+<W?e+=M>CF*)/8A2#eg+D#e3F*)IG/Kf(VDBL?;Eb/[$ATVL)FC])qFD5Z2@<-'nF"%P*:-pQU
+<VdL+<VdL+<W9h/hRS?:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp131,N`gCbdsZ$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aDKf#rDeio<0II;:%172gF*(u2G%ku8DJ`s&
F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OX-OgDo
EZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUARoLs+EV1>F<G[:D/a<"FCcRH+FAQ>IXN>IEb-@A
DKdNPE,8rmAKYZ)Ch.*tEt&IO67sC&BPDN1@ps6t@V$[)F(KA7D/Ws!An>KqBl5%AC2[X%Ec5Q(
Ch555C3(gHFDhTq:-pQU@psIjEZfIB+F.mJEZen(E,oB1ARlp$AS#Cn/g+,,AKYK*EcP`/F<G[:
D/a<"FCbmg:-pQUBlbD8EbT*&FCeu*FDi:DEa`KmFD5Z2@;I&tG]7J5@rri'De*E%@rH7.ASuU(
Df0V*$;No?+DGp?BlbD.@<6.!Gp$O+@;p="A0>u4+Co2,ARfg)A7]@eDKKT2DK@E>$8EZ-+EMC<
F`_SFF<EtI6WHiL:/jqR;G1A*C2[X)Df9H5?O[>O$;No?+<W(#:IA,V78?fL:JFPL:./H'C2[Wi
.3N>G+E2.*@qB0n@<<W6BOr;tDIal.Ado)B67sC&BOr<(ATo8=AU&;>@;]Tu@ps6tA7]@eDIjr!
@ruF'DK?qB@;BFl+EqL1D@HqJ67sC&BOr;tA8--.F(96)E-*4:F!,LGDCuA*6r-0M9gqfV6VgEN
5u'gTBkhQs?TgFm-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$8EZ-+EMC<F`_SFF<EtI6WHiL:/jSV
9hdoK6sjYCDe*2a$4R=O$;No?+E)41DK?q/DBNM$BlkJABl7I"G7=m6+Bot+G9A8)@;SbNG?8^'
A1%fn%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?ZK_$Dc:LkCLo1R:-pQ_Eb0E4;f-GgAM>e\F=f'e
-urmBD^cfMD/X3$+EV19FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:2CTb[G\M5@F!*%WF(Jo*
-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(I?C3=>J2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]O&G&L;rDeio<0II;:%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3Zoel
ATMs.De(O[-OgDoEZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FJDfTB0+EVNED..3k
+EV:.D'3k1@qBP"%160J6#pO"3Zr,h+>P_^$;,G^F?MZ--Xq"4+D>\3-OgDZF`^2m6tp-o3Zrcr
GT\LZH$t)M$>"6#FDYu5Ddso/F`\aMEb'5S3ZpLF-WakFEb-@cF`VXI:j$kODFA2K-OgCl$;No?
+ED%:D]j+>Ecc@F@UX=hA0>f.+DG_8ATDZsC`mh6D.Rd1@;Tt)%16Ze+=D2N+EqpAD.Rc94ZX]>
+>GYpB4Z0-GB.58%13OO:-pQUFD,62+EM47F_kS2@V$ZoBl\9:+EqaEA9/l3DBL?JAThu@+ED%7
F_l./$>"6#EcuYIA90mp+ED%:D]gDT%14L:3dr2-+F>^`I4cX_G'@t;F"&4`3Zp(:INWiTA9/1e
%15is/g+YEART[l+EMI<AKZ#)@qBP"+EV19FE7luATAnJ+E2IF+=DAE@<,p,4"#/g@Wc^%ASu'i
+C]UD%16Ze+>G!XF`\`RF`(Z2Eb&a!ARm/M-Xq?DGA(E,+=@U*ATAnJ+E2IF+=Ci2F!j$sB5_[!
+C\noDfTD:%172gF*)Id3ZpLF-[0-1Eb-A9DIRa/A7]XiA0>PoF!hD(ATAo6G'%;:FE9T++>G!Z
AThu7-RT?1-ndW1+>Y-e/g,Qp+EDXIATMs7.3L3'+>5d)+EV19FE7lu%15is/g+YEART[l+EMI<
AKZ#)@qBP"+D5_5F`;C2$>"6#1*C4ME$-N;Df9<-D^RVjEb'5#$>"6#1*C4ME$-NMDf7!b14(Wt
Eb'5#$>"6#1*C4ME$-NRDfmEh?SZs\GB.58%172iEc?(_3ZpLF-Xq"4BQ%f3FDl(?H#IgQ%16Ze
+EDX<Ec?(_3Zp1#Eb0E4+=ANG$7IPgINUEhHS-Fh/g,1XB6%s4.3L3'+>5d)+EV7:E,uHq%15is
/g+YEART[l+EMI<AKZ#)@qBP"+EM[>FCfM&$?C<3ATMs74ZX^6/g,1XFCfN8Et&IfEZd.\B6%r6
-Xh(=Blmo64*#LdATMs7%16Ze+>Y-QEc<-KDe<g"FED>1-Ta)1/ol,WATMs7%16Ze+>Y-QEc<-K
A9D`uFCfN8F!j%V14(WoG'%;:FE7luF*22=ATL!q+?MV3@<6R*FCcS5Ao)1'FDPM2A9D`uFCfN8
F!hD(ATAo6G&qe?FE9T++>Y-\AThu7-RT?1-ndW1+>Y-e/g,Qp+EDXHF_Pr=.3L3'+>5d)+EM[>
FCfM&$4R>;67sBjEb/[$AKZ&4D.Oi1ARf:hF<GF/@rcJs$>"6#1a$a[F<DrTARTUj-Ta(@4"#/g
@Wc^%ASu'i+C]UD%16Ze+>b3[F`\`RF`(Z2Eb&a!ARm/M1,V-@@X0)?BOQ!*-OgDoEZd1]E-67F
-YQq0-Ta(@4""ZZDIjr"AS,k$AL@ooD.-pq4ZX]I3[],_@<,p%F`(Z2Eb&a!ARlos@<3e*$>"6#
Ecu;.@rjdo+>b3]AThu7-RT?1-ndW1+>Y-e/g,Qp+EDXB@:O@-+>#Vs004P)D.-pq%13OO%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WATMs0De!3lARB.dDe*3qD,Y:iCLo1R:-pQ_Ec"`lDeio<0HbHh/KcH^D(-TKD/X3$+EV19
F=n"0:-pQB$;No?+=M8I.3NYRDK?pm:IH<JD.-ppDf[NR+A,Et+<YN0@rcL/+<Y*5AKW+:Bl.g*
Gp$O9@VKq)@<-W9+A*(M:-pQUF(96)E--.R+<XWsAU,C@@ps6tA8`T!DKKQ+DJ()+DI[L*A8,po
+CT).ATDL&B-8<h:IH<JGA(],AISuA67sC$F`))2DJ(RE+<X9!+<Y`8EbTK7F!)SJ@<,p%+<YB9
A8,O^FCeu*+<VeNBln#2+<Y04A7Zl++<WEo%15is/g)Q7;aXGS:fLe1C2[Wi.4u`=FD,6++EM%5
BlJ08+>"^EEaia)Eaa!6+C]V<ATJtG+D>2,AKYK$A7]fk$;No?+=KrM6W-]Z=\qOo@;9^k?R[TM
:Msuo+A*bt@rc:&FE8QI-t@1+AKW`_.3N,/DBNtBDD!%S:Ms_dDe9Fc:-pQUFD,5.D..-r+E_a:
F!,C5+Du+8+A*bn@:O=r+EM%5BlJ08+DGm>F*)>@Bl7Q+E,ol0Ea`f-@rGmh/.Dq]67sBZ;+rM`
:jI.rDf-\+DIal3AU&;>9gMZM6r-lZ/0IVP<(0n3Bl5%c:IH=9Bk)7!Df0!(Bk;?<%15is/e&._
67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\+mFCfN8C2[W:1FXGXG\M5@F!*%WEcl7B-t@:/@<?(&
ATMs(Bk)7!Df0!(Bk;?7%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(I?C3=>J3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)
E[M;'%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]O.;f-GgAM>ec%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0Jb'c
$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g,4WDfTD3@3A/bF(96)E-*3S+Cf>#AKW`_%16Ze
+>b3[F`\`R6#:@=DfTV@4%`F=;Fs\a?X[\fA7%DGF)>i<FDuAE+=o6$+<r![3[Z:`Cht5<DfTV9
@;]TuDJpY:CghT3D..3k+DP=pCER%.A9D^)+C]87+=ANf9L^B=$4R>;67sC$F`&=DBOr<-@rc:&
F:AR3+Bot/D'12lCi!0kEbd$3$4R>;67sC%FDl22+EMI<AKX]5;G0DR=&'l[AU&;>/KePAA7Zl=
2[p+*EZd1]E-67F-V\#iCIE;^@OF635uL?D:KL:u@;9^k?TTW7BPDN1BlbCb770a7;FNtr9jr'X
A8c[0/g*`-+DGm>DJsV>G%#3$A79RkA0><%+EM[8BJ(YA$4R>;67sBuDf-[i+EM%5BlJ08+CoC5
DJsV>Ecl7B%16uaEZfC>+=BllEbe'cD.4k%$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16Ze
AT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7'A!FAm$p
CLo1R:-pQ_EccD%D/X3$0JFVk/M/(nEccCP+EMC<CLnW1ATMrG%15is/e&._67sB/EccCP+EDUB
+EV%7FDku6B6bVAATMr9BlbD8DIjr/Afr4<BOr<'Df^"CBOtUqBl&&;F`V,)+A,Et%15is/g+kG
FCfK)@:NjkGAhM4F"SS,F<G:=+E_a:A0<":D]j(CDBMOo+EV19F<GX7EbTK7F!,OGDfTE"+DG^&
$;No?+A,Et+Co1rFD5Z2@<-'nF"SS$+A*buATMr9+EM%5BlJ/:@rH7+BleB;+<YT7+CQC6AT;j(
DI[6#De9Fc:-pQU@<6L(B5VQtDKKqB@;]TuF*(i4ASl!rFE8RHBOQ!*Eb0?8Ec*".Cht4KF"Rn/
:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<W?e+=M>CF*)/8A2#eg+D#e3F*)IG/Kf(VDBL?;
Eb/[$ATVL)FC])qFD5Z2@<-'nF"%P*:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zp131,N`gCbdsZ$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aEccD%D/X3$0JFj`$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8
C2[W:1FEV=ATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7ATDl8@3BZ'F*&OG@rc:&F<E.X
Eb0?8Ec,q@@;Ka&0lmd2FE:r40KhH>4")4!:-pQUF(KB+ATJu4AftMuC`kHR-T`\1-T`\10I/A#
4!umJ0ea_)1*A;--Rg/h-8%J)9L]HuATAnJ+E2IF+=BHkCenq[F!j%kF(95E%13OO:-pQUF(oH%
DKK]?+EDUB+EM%5BlJ/:/Kf+JDfol,+E1b1Et&I2+EDRG+=BHkCenq[F!hD(%15is/g+kGF(KB6
+CQC6@rc:&F<GdAFD)e*F<GC2@<6N5Df0,/0F\A2F(95F4ZX]I-m0m467sBhF<GC2@<6N5Df0,/
H=_,8-T`\1-T`\10I/A#4!umL0ea_)1*A;--Rg/h-8%J)9L]HuATAnJ+E2IF+=Bp&F?s_Z:Ms`b
-TcEk@ra:5$4R>;67sC%Bl%?uFDQ4FEcl7B+>"^WBQ&$0A0>JmBl"4cDImi20d(LYF<Dr+Dfe9]
Cenq[F!hD(%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?ZgF$F&QpoCLo1R:-pQ_F`V,8;f-GgAM>e\
F=f'e.!9TBF"&5QD/X3$+EV19FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:2^ok\G\M5@F!*%W
Ecl7B-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7%15is/g)8Z0e"5;:IH=9ATf2,Bk)7!Df0!(Bk;?.
@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+
1hq/L1,]RK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!p1Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eZF(KDkD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>`BQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>a
A8,Oq4ZX]5FCfN8C2[W:2^]%A%15is/g+tK@:UL%Df'&.8l%htA8,OqBl@ltEd8dODfTB0+EV:*
F<G7*G%De5@;^?5Eb/ioEb0,uATJ:fATAo3A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%13OOEb/j(4ZX^.F(KD>4s58++CoA++=ANG$?B]iF$2Q,/2&,00d(fe0d(LJAoeCg%15is/g+kG
@r-9uAKW1;AS,P"+s;)JEb'56GA2/4Dfp.ECi<flCh4`1F_56"G\(q*$?B]iF$2Q,Eb/j(+<u=X
0H`M$HTE?*+<r3s+ED%*Et&IsAS-!H3Zp:&HS-F]AS-!+H[[)B3Zp."HQk0e,:5SsEb/j(%17<"
A90mp+=M>ME&Bd>+>=pb+u(3\AS-!4/0I"s0d(fe0d(LJAoeCgATAo8D/a<0@j#DqF<GdJA9/1e
ATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+ELt7AKYDtC`mb0An?!oDI[6g+EqaEA9/l*Ec5e;
FDl+@2%9n(EZfI@E,9H&+E2IF+Eqj:F!*%e+EVO@2%9m%$;No?+ELt7AKZ)5E$."\@;]TuEb/io
Eb0,uAISuXEZfI@E,9H&+E2IF+?M9(FDl+U%16Ze+>=pNCi<d(+?M9(FDl+U%16Ze+ET:p4ZX^.
F(KD84"u#'Df@QC$?B`42*EuC4!67#HRp:'0me!r2%9m%$;No?+ED%*F!,O;Dfol,+DkP/@qZ;Y
-uroR2(9Y"3ZpU?+F>4c+F>:e+ED%*Et&Hc$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebU10fU:2+>GYp1,'h2+>G_r0f1".0H`),+>c#"0f1"02]sk1+>c&#0f'q-0H`)0+>Pr"0f^@3
2]sh3+>kkr0f1"01a"M.+>Ghu0f'q-0H`@u0f:(.0d&21+?:Q!2'=V-+>Gbs0eje*3+QT:B6%ri
D/X3$0JFncASc""E%)oND/X3$+EV19FE;):;f-GgAM>edB65RFF)>i2AKZ)+F*)/8A8#OjE)UUl
CLo1R-u*[2BOu"!.3N\KDeio,FCfN8Ci<`m;f-GgATVL)F>.NL@:UKh+EMC.Cht5(Des6$@ruF'
DBNk0+E(_(ARfh'+DG_8D]gHMA8,Oq.;Wp2A5d>`CLqU!F*'-QDdd0!@3BW.@;Ka&@rH1"ARfgr
Df-\9Afu#$C1UmsF!,17FDi9MFC])qF=D$E@:XIkF*',j0P"m-FD5Z2@<-X0Ddd0!0eb;++>RhF
+E):2ATAo3Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-X0De!F#E)UUlCLo1R-u<g3B6%r?+EMC<
CLnW1ATMs7D..3k87?RQ@q]XVD/X3$0JFnl@;BF'+D>2)BHUeuARfKuF)>i2AKZ)+F*)J?@;BFF
@<6*lBPUOgEb0<50JFnl@;BF'+DbJ,B4W2rF_u(?BOPsq+EV19FDYH%APcfWBQRg,F>,FjATVu9
F`8IFATMr9A8,OqBl@ltEbT*++D,P4+E1b2BHV2$D.Oi"CghC++EV19FE;;-CLp=NFD,c-F*')k
-uEC.ALSa@@<?0*E+O',F`_&6Bl@m1+E(j7-uEC.APcfWBQRg,F>,EuDJs*2E)UUlCLo1R-uNs7
G]5)SF)>i2AKZ)+F*);<FD#W5;f-GgAM>edDJsW0Ec<HMF)>i2AKZ)+F*)J@G>i?sCLo1R-uO5X
+EMC<CLnW1ATMs6AThujD/X3$0JFnqAThu@+EMC<CLnW1ATMs7Ec"`lDeio<0IUsY.3N\KDeio,
FCfN8EccD%D/X3$0JFnqFEArSF)>i2AKZ)+F*)PGATLdeDeio<0IV'bATK:CF)>i2AKZ)+F*)I~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3Ahp>+>Y,p2'=Xs0ekXC2BXb/+>P&o1,CUC+>GSn1*AA00eje*0H`+n1-%3P3?U%4+>P&s2_[-4
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
/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.9+A-cm+>PW+1a"M,3\rZT0K'7F$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Gl!8p+qm1,(I?
+>G`71bq*G1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$
+<X'\FCdKU1,'hCF_i0U0JYI-0etdE1cdEJ$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,pCKF_i0U0JYI-0etdI2EE]P
$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp+6+A-'[+>PW+1a"M03\`BN2)5LG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.6+A-'[+>PW+
1a"M03\iKP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.;+A-'[+>PW+1a"M/3]&WR0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.;+A-'[+>PW+1a"M/3]/fV2)YdK
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp.;+A-'[+>PW+1a"M13]/lX2)#@E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0H`trDBL\g1,L+.1-.-L3]/l($49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,'hC@;[2C
0JYI-0etdH0fh!H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>PVn8muT[1,(I?+>GZ51bh$H2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp14+A-'[+>PW+1a"J43\`HP
1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q
+@KX[ANCqh0d'(sDBL\g1,L+-3BAoP3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,0nD@;[2C0JYI-0KD0N0KLmI$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>PYo
8muT[1,(I?+>GQ20JGOD2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp14+A-'[+>PW+1a"M-3\r]U2)kpM$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'(sDBL\g1,L+.
0fh-N3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp.;+<X'\FCdKU1,0nD@;[2C0JYI-0f(jI0fh-J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo8muT[1,(I?+>GZ52)I?L2$sZt
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp14+A-'[+>PW+1a"M03\rHN1bf=E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh0d'(sDBL\g1,L+.1cdEP3\`Dt$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JO\>ARZc;
0JYI-0f;!K1HI9G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>>Pn7V-$O1,(I?+>GT31,1gH1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+3+@]pO+>PW+1a"M-3\iWT
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht
+@KX[ANCqf1*B%t@N[E[1,L+.1cdBG3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI2**QJ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>Pn
7V-$O1,(I?+>G]61H7EN3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1-$I"6t(1K3Zp+3+@]pO+>PW+1a"M03]&`U0ej"B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf1E].u@N[E[1,L+.
0KM$K3]/o)$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp45+<X'\FCdKU0Jah@ARZc;0JYI-0ek^D0KLmD$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>>So7V-$O1,(I?+>G]61,q<L3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K
3Zp+4+@]pO+>PW+1a"M03\rNP1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqf2'>A"@N[E[1,L+-3BB#R3\`Q#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0JstBARZc;
0JYI-0ebXC1-.6O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_K)F_PZ&+AR&r@V'R@
+>Ynu+@KX[ANCqf2'>A"@N[E[1,L+.0KLpI3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqf3$:\%@N[E[1,L+/0fh!K3]&T!$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqf
3$:\%@N[E[1,L+/0fh*H3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=
6?R!YA0=WiD.7's3Zp7%+@KX[ANCqf3$:\%@N[E[1,L+/0fh0N3\WQ$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf3$:\%@N[E[1,L+/
1-.0J3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's
3Zp='+@KX[ANCqf3?Ue&@N[E[1,L+-3BB#X3]/o)$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf3?Ue&@N[E[1,L+.0fh0P3]&T!$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqf
3?Ue&@N[E[1,L+.1-.*E3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>GPm7V-$O1,(I?+>GT31c%0J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/hnIk6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0ea_>ARZc;0JYI-0etdD0fh0J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0f1"BARZc;0JYI-0ebXC2**HL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f1"BARZc;0JYI-0ebXD3'&fS$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f1"BARZc;0JYI-
0ebXE1-.3N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU0esk;E,m'V0JYI-0KD0K1cdKM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0f'qH@<itN0JYI-0ek^D3'&`J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU
1,g=M@<itN0JYI-0ek^F2**NJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0JahDF`&<W0JYI-0f(jJ1-.0F$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,'hCF`&<W0JYI-
0f;!J1-.6K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P='+<X'\FCdKU1,0nDF`&<W0JYI-0K;*N0KM'I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PYo8p,"o1,(I?+>>c92)[KO2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K
3Zp14+A-co+>PW+1a"J43\`HP1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh0d')2DBL\g1,L+-3BAlO3\rZ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nDF`&<W
0JYI-0KD0L1HIBR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>P\p8p,"o1,(I?+>GQ20KD0N2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp15+A-co+>PW+1a"M,3\iBM
1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqf2BYV7C`kJe1,L+.2**TL3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0K(%GF_i0U0JYI-0fD'H1-.6J$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>\r
8p+qm1,(I?+>Gc80fD'I2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp+7+A-cm+>PW+1a"M23\iQR1H5^K$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf2BYV7C`kJe1,L+.
2EEWL3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU0K1+HF_i0U0JYI-0ebXF3'&`M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>>_s8p+qm1,(I?+>GQ22*!]O1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3Zp+8+A-cm+>PW+1a"M-3\W<M2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2]t_8C`kJe1,L+.0fh0G3\r]%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0K1+HF_i0U
0JYI-0ek^H1cd<N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u2BX,1@<?'A+>>_s8p+qm1,(I?+>Gc81,:mG1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+9+A-cm+>PW+1a"M,3\`NR
1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!
+@KX[ANCqf3$:h9C`kJe1,L+.1HI9I3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0ea_BF_i0U0JYI-0ebXC3BAuS$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>GVo
8p+qm1,(I?+>GQ22)[KN1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS1GL!p6t(1K3Zp.5+A-cm+>PW+1a"M23\iHO1c#IG$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqg1a#D5C`kJe1,L+-
3BB#U3\`>r$49Np/g+)<F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,
+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp.6+A-cm+>PW+1a"M,3]&WR0ej"B$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqg1a#D5C`kJe
1,L+.0fh!C3\`T$$49Np/g+)<F*(u13Zq$j6rZrX9N*&r4C`;HD.RU,ARmtg+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS1Gp9t6t(1K3Zp.6+A-cm+>PW+1a"M-3\W<M0Jj+D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqg1a#D5
C`kJe1,L+.0fh$E3\rT"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3Zp4;+<X'\FCdKU0f1"FF_i0U0JYI-0ek^D2EETR$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!3$9>3@<?'A+>G\q8p+qm1,(I?+>GT3
1,CsH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>Gbs8p+qm1,(I?+>GZ51b^sH0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get8p+qm1,(I?+>>f:0f(jH1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Get
8p+qm1,(I?+>>f:2)73K0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!n
Bl%<&:3CD_ATBgS1a!o/@<?'A+>Get8p+qm1,(I?+>GQ21H%9J2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Gl!8p+qm1,(I?+>G`7
1bq*G1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>PVn8p+qm1,(I?+>GW40f1pI1($uV6r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4
>psf5A8bgiDe(J>DJ(C@?qO3_?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.
F!,OH@Uj4_F)to6/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpu
Bl.E(De:,#+EV%5CG$&'6?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNE
Eb0E.ATo8,BOPdkATKI5$:/KLD_*#OART*l>@;,YF*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0
FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C+Acl_DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(
AM+E!%16KI@V'1dDCosKA8ba]%13OO0eOSV4C<8UBk;EE2`PJ22g@'$F)cD>Df7UE1j!(g?m%gT
DKBN&ATAo)G]7SBBl7Q+A9Da.+EM%5BlJ/:BOPsq+Cf(r@r$-:+D!0</h@G=+<VeUIXZ_T$6UH6
:-pQU@q]F`CER/1D/^V=@rc:&F<G(3DKKH-FE8R5B45LlF*&O<@<6)k$6UH60fL4aDJUG1E+*j%
+=DV1:IITN9i+bAF`_>6F"V0AF!hD(+<VeUIXZ_T$6UH66r-QH+X%sV0eP151FWb?%14jC+CI<=
3&5"uDKTK70l8[YD`B\!1jC]rGr]JPG[EXB+@C'bF(o/rEZee$A8,po+CQC)DfT]'FD5W*+E)4@
Bl@l3FDi:0D..3k?m'Q)@<<W)ASu("@<?(%%144#+Co2,ARfg)A7]@eDJ=3,Df-\0DfT]9+EqL1
DBNe)CM@[!+EM%5BlJ08/g+,,AKYMtEb/a&+Co%qBl7X,Bl@l3AoD^,%144#+DGm>D/XH++D#A#
B45\"+CT.u+D>2)+EV:.+Dtn'AKYSr@<?X4AKYo'+<k?-EHQ2ABl7Q-+EM77B5D-%Ch[cu+D#e:
Ch[BnFE8uUAM.UJ%144#+F\cgILQW,+<XEG/g,.VDffQ$+EMX5DId0rA0>H.E,95uBljdk+<VeI
F*;)*@m)jq1E\_$-XC+.:/st]9gMZM,$uca/gr,!;H$Uk<D6(8-7q8-9KFjM4?G0&1+"V;+?V_<
?SWaL-OgD*+<XEG/g+\8+D,P4D%-gp+<Y]GG%>/oA7Rha+FAGX?!o'U<D6(\5uL?"?R\5m-n$WE
;cZXn9M?l^/NP=S3\V[=4"akq-8%J)4?G0&1*CibI=2P3+<VeUIXZ_T$6UH6<+ohc@rH7.ATDj+
Df-\0Ec5e;F*(i.A79Lh+D#e:Ch\-.F<G[D+Co"*BlbD<FE1f(B4uC!DfU&1Eb$;$F!,:;DJ'Cc
+<Ve8F!,R<AKYMpAnc-sFD5Z2+CoD%F!,@=F<G^IAKYE!Gp%$;+A+#&+ED%7ATDs*A0><$B6A'&
DKI"=@;TRs/.Dq/+<Y'7+EelE+DtR>+<Wrm@q]:gB4W3%Bkq9&FD,B0+EqaHCh+YsCiaM;Bl.ft
@rri$C2[X!Blmp,@<?'g+C]J8%144#+E)F7Ea`d#+EqaHCh+Z*@;BEs8g%V^A7Zm$Bk(^p+EVNE
Ci=6-+DGpM%13OO1G0eX4C9mREB/2&H#n'`EHO'Z2DTSm@r,j72eR;@5%#L.ATo87F_t]1Bk&8r
@<>q"H#R>9+CT.u+CQC&Df0`0EcYr5DBO(DBl%L*Gp$L)/mof1Eb-A&ASH$p%144#+CSekARlot
DBMOo3A*34-o*J31hpH:0JY("G@_n7Dg*=;@<Q2k$6UH6?nZ53FCf)rE\T4]DKKH&ATBOZBl8$(
B4Z*?04o$=@<?4$B/2,PCi<a(Bl7Q?04o$=@<?4$B/);P+EqL1DIn!&EZfI;ATD?)@<,og$6UH6
@q]:gB4Z-,FDi:2Bl7@"Gp$g=FCfK1@;L!-BlkJ3D/`onFE8Qs:IHfX+A!r(AKYDtEb/ZiGp$d7
F<G!7@rH7.ATDj+Df-\:Eb/`pF(oQ1+D#S6DfRH>$6UH6<+ohcF(KB+@;I&sF_u(?AoD^,@<<W7
F*1o-Cj@.IDfTW7+D5V,DJ()(DfU&1Eb$;%F`\`t+CT+0@rH6pATD["A0>;iDfp.E@rc-hFD5W*
%144#+CoV3E$043EbTK7F!,R<@<<W9Bl%T.DJsV>Ci<`m+DG^9DerrqEZdssG%G]8Bl@m1/g+50
Cht5-@<Q3)FDi:4AThd/AKZ&4D.Oi2@q]FjAISth+<YcE+Cf>/AM,*#:K0bD+EM+*D0$hAD]i_%
G%De*AS#a%AncL$A0>T(+DbJ.ATAnc+?;&4+C\o(@<4%1$6UH679N&X:JaJT+X%:%%14pE+CI<=
2gT-n2etEhChbhOCLhC!1b`BbF)c)73+"jW+@C'bF(o/rEZee$A8,po+CQC+@<6*)DdmHm@rri*
@:O"fBlnVCFD,*)+EqO9C`me@DfTD3@3AK>5qOiL2BZ[AF(c\?BOu'(E-68EBl7Pm$6UH6DdmHm
@rucE+A!\aD'3q6Bl7^#DJ()#DJsW1ATAo3E-,f4DBNG-A7Zlk0fNJ_FD,*)+EqaHCh+Z*ARTI!
F*)>@AKYD(BOPsq+E)-,$6UH6?uU71?m'B.+EV19F<G!7BOPsq+E)-??tX%m?k!Gc+<Z,^IXV_5
+<VdL:-pQUGAhM4+DGm>E-67F@;]Tu@3B5lF(c\1F!,OGDfTE"+DG^9@3BT%F(KB8ARlp)Ci=DJ
%144#+<W?\0fL4oF`\`RGAhM4-OgD*+<Ve%67sBo@<6*)BlbD,Df'H%Eb/c(FDi:F@;L't+ED%8
EbT*.ARlo8+D#S6DfQt7Aftr!FCSu,AmoCiF"Rn/+<VdL0H`)/+D58-+=DAOEb$O,$6UH6IXZ`p
%144#+@/=[:..lQ778:B%13OO2(g"Z4C;Q9FDWgU13R2MG;j5XAN"=>H$O*X0f4&\5%#L*-Z^DB
Bl%?'G%G]'F!,=.Gp$d/DJ()9BOu'(@:NeYF)u&5B-;D4DId[0F!,(/Ch7Z1Df-\.EbT].F!+n$
@qB_&ARlomGmt*'+<X]]:*=%bDJj#qFD5Z2F!,[?ASrVk:ei-IF!,C5AhG3*BOu3q-Z^DJDfd+=
F^o)-8l%ht@ps6tA8`T&DfQt;@;p0sA0<::ATW$*E[PF/.1HV,+<Y38Bm+'/+C]J8+CJemG\M5@
?m'$(ASuU4@;Kb*+ED%8F`MA@+>=pMDfQt$:ei-SBOPpmF!,:5CLoO9$6UH6IXZ`p%144#+<Y9-
G\M5@+=AfqC1_NtATfaa06:f8Eb0;FC2[W9C2[W9C3OT:A90A;C1\h&$6UH6IXZ`p%144#+A,Et
+Cf>4Ch+Z!D]iI2EHPu*CER25BleB-DI[6#@q]F`CERP5+EqO;A8c[5+EMgLFCf<1+EqL1DBNY8
+EM+*F!,UCD..C&ARl5W+<VeJBOPpmF!+jD06;&KAM8+<@<,p4AS>a1C3OT:A90A;C1^j++<XWs
BlbD@Bl%T.DJsV>BOu"!+D,P4+BD<6+DkP+E+NQ&A9)C-ATJ:f+<VeNBOu'(<_uO6BlbD8AnEY)
$6UH679N&X:JaJT+X%:%%15!G+CI<=1GNu2A8c()CjBuBF^\luF*DPB2`NX5E*ke:+B2onF<Ft+
De*ZuFCfK$FCei&Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO2_H3q?p%dT
2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/
A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr@WNZ*@<Q3)@q]:gB4YTrBl5&6
ARf:hF<F0uG%G]8Bl@m1/e&-s$90X\+<Ve74C;VRA9;F!A2,odE-?&+FDbT%12pYZBQnB%5%#L#
Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBeGT_'Q
F*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<+ED%7
E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16c_F*)>@H"q8.1,iiWDImisCbKOAA0<HH
@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/i+V%
+=MGJE%)oPDK9<)ARTXkA.8kT$6Uf@+CK%pCLplrDJs_A@q]F`CNCV/F_u(?F(96)E-*44Df0Z.
DKKqB@:s"_DKBnBBlnD=BOPsq/e&-s$6UH6+<VdL+<Y3,4ZX^&@;BEs-RU#Z+AP6U+CoV3E$/S*
C`mq?Eb'56Df-\:@<?/l$6UH6+<VdL+<WBt+DkP&AKX']3b2hF+AP6U+Cf(r@r!2tF_u(?@:s"_
DKBnBCh7$cBl7Q+BOPsq%13OO+=\KV?rC!'<+$hWDIakt6W6lM?m';p@rcK1FCf]=+EVmJATJu&
A7T7^+D,P4+EDUGF<G"0A0=5^@rGmh/e&-s$6pc?+>GK'/i"P$+A-cmGp"gu/0H]%1,L+%:h=Za
@;]XoF<F7q@ps1b+@TgTFD5Z2.1HUn$6Uf@+A,Et+Du+A+ED%5F_Pl-F!+(&F!+n'FCfJ8G%G]8
Bl@l33A*!@/g*/,0JXbbDKKo;A9DBnA.8kg+<Ve;Bl[cpF<G+*Anc-sFD5Z2F"SS6Df'&.8l%ht
GAhM4F!,@=G9D$LAKYMtEb/a&+Co%qBl7X,Bl@m1/e&-s$6Uf@+CJr&A8c?n+CT.u+CJr&A8c'f
+D>2,AKYGnASrW#BOPdkARlp*D]i_%DIdQp+E1n4D..<nDKH<p+<VdLCi<flCh7Z1Bl8$5De+!#
ARlotDBMOo3A*3B+CJr&A8c'l?m'?*+Dbt6B4Z*+A7]h(Ec65E+A,Et%144#+<Y01@<6K4Ci<fl
Ch7Z?+A$YtDJs_AF(oK1Cj@.5Ci=B+F!,C?ASrW$Bk)7!Df0!(Bk;?.@;]TuEb0*+G%G_($6UH6
+CJnuDe*6,+EV:.+A,Et+DG_8ATDBk@q?d!De!3lAKYT*Df$V=BOr;q@<6!&E+*j%/g+P:De*d(
?k!Gc+<VeIATMs3Eb0;7?tj@oA7-O%D]j.8AKYGjF(HJ5@<?08+B3#c+Du+A+E1n4D..<nDKI!n
:IH=8CghC+%144#+<YK=@ps1bF!)l=@;9^k/7E:3A7TUf/7E:3A8PajALq8)De*p2DfTD?@;9^k
FDl)6F"Ca7De+!4Bl%0+%144#+<Y*5AKYl/F<G(,@;]^hA0>?,+CJr&A8c?n+CT.u+CJr&A8c'l
?nNQ2$6Tcb+<VdL<,WmhEb/[$AKYo3+ED%*Eb0<*+A,Et+Cf4rF)rI?De!3lATJu>Dfm1>F`VXc
%13OO+<VdL+<VdL+Dbt)A0<74ASu("@;IT3De(4)$4."]%144#+<XWsBlbD,BOPdkAKY].+C\bh
CNj3-A0>B#D/`p*Bjtmi+CT.u+EDUBF!,17+A+#&+C\noDfTD33A*3B%13CN$6Uf@+AH9^Gp#^T
6m-S_F*&OG@rc:&FE8RIF(HJ3@;TRd+Dbt+@;KLr/g+,,AU,DBATD?)@rc-hFCeu6%144#+<YcO
E+rfjCi"A>Ci<`mARlp-Bln#28l%ht-td+5.490f+D#e/@s)m)A1Sj3DIal3BOu'(A7]RgFCetl
$6UH6+EVNE@r,^bDBO(@+EV19F<G"4FD5>q@rucE+B3#gF!,F1FED)7DBO.;Cht53Dfd+GDfTV9
Bl5%c+?;&4%144#+<Y*6+Dbt+@;KLr+CT;%+E1n4D..<nDKI"DDJWm*F!,%=E,95uBln0:+CfG'
@<?'k+CT=6FCf<.DfT9,GqKO5+<VdL<+ohc@UWb^G@>N&+Cf>,E+*j&@VfTu-u*[2E,ol/Bl%?5
Bkh]<+Eh=:@N[(6De*s$F*)5:@ps1b.3K',+<VdLD..-rFCAm$F!,R<BlbD9@<?U&Ec*".DIal,
@;^?5FCfN8+EM%5BlJ08+CT@Q%13OO+<VdL+<VdL+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1r%FAS!N3@<6O%E\D0GA9Dd(F:AQ`%144#+<YB7Cisf@Eaa'$+DGq=+E_a:/g*GrC`l>G
6m-S_F*&OG@rc:&FE8R5Eb-A(BleB:Bju4,ARlotD@Hpq+<Ve@DBO%7AKYB0@:WneDK@IDASu("
@;IT3De*p-F`Lu'?m&lgA8c?<%13OO+=\KV?pdUV5uL`Z6;q6*C2[Wi?m&rfDBND"+E_a:A0>u4
+Cf>-FE2;9+Eh=;FD5ArC`l>G6m-DWC1Ums%144#+<Y]9D/XT+C`m82EbTE(+Dbt)A90@G8T#Yk
@<,p%@psFiF!,R<AKZ/-Eag/!@r,^bEcuA1F'p,-BkM+$%144#+<Y`:Ch7*u+Du==@V'RkA0?#9
ATAo0De!3lATKIH<+oue+DGm>E+*d/Bk):%@<-'uGp$p;CLq=-+DGEs$6UH6+EV:.+E_a:EZf1:
@ps1b+DGm>ASlC.GqL4+Gp%0>FED57B-:SL9LV6F<_l%\?m'Q0+>=pPDBKAq+<VdL-u*[2E,ol/
Bl%?5Bkh]<+A,Et+EqO9C`mV6F<GU8D/XT/+Eh=;FD5ArC`mP4@ps1bF"SS:Bln#2%144#+<Y&Z
9LV6F<_l%\?m'N%F<G[D+>=pYAT23hFCeu*-u<g1A0<74ASu("@;IT3De(4E+Dbt)A9/l;Bl%T.
%144#+<YTCE+iZt+A,Et+E(_(ARfh'/g*H$+Cf>+Ch[s)Df0V=GA2/4+E_a:EZf1:@ps1bF!+n3
AKZ,5Ch[ZrCj?Hs+<VdLFD,5.A7]@]F_l.BBlbCO/e&-o#p9Za#mh^`$6pc?+>GK'/hnL.J<M*F
AR]\&@<-W90eb.$1,(I?+=L!'/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Nfj"+Dtb7
+CK+u?m'B,FD5Z2+E)41DK?qBBOr;tDKKT5AKYr7F<G+.@ruF'DIIR2+E1b2BJ(E,BPDMs$6UH6
+DGm>F*1u++CQC7Bl.F&@<Q@&B-;)1/Ria/Bl7L&+A!qt+D#D!@<-BsF)to'+D,P4+Du+>+EV:2
DJNs(B+51j+<VeFAftf0+F.O,EcW@3B5]C3$4R=b+<VdL+<VdL2BZpK+=CT.DIb+;:-pQUDfB9*
F!+n-C`mY6+=LZ/DIb1=E+*j%+>"^Q@;BFq+=LZ/DIb1=E-673$6UH6+<VdL+<WQbDe'tP3[\QZ
F!,O@F_;h>FD5Q4-Ql/N/g,(OASuQ3@;Ka&Df-[GB5ho@+E1b2BHSlLD..3kF!)lDE-!HNE-67F
+<Vd9$6UH6+<VdL+<YT6E*m<oDe*3<3Zp=-De't5:-pQUA7]@eDIjr(@;]V$+EM47Ecbf6F<G:8
+A,Et+DG_8ATDBk@q?d!De!3lAKW*)$4R=b.Nfj/ATo8=ATMr9@psFiF!+n/A0>Aq@;]^hF!,RC
+CJr&A9;C(FCfK#+EVNED..3k+EV19FE8RADfTD3E,Tc=@:F%a/e&-s$6pc?+>GK'/heD"+@]pO
Eckf2Gp"sq+>PW+1a"2;@<6+-+AH?:@<6*o@:Njk7:^+SBl@l<%13OO+=\LA83p0F?n<F.9LV6B
?m&lqA0>8`8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^/e&-s$6Uf@?t=4tATV<&FCArrF!+m6
DIn#7DfBf4Df-\*7ScoL786'H<(0\]5u^B_+EV:*F<G16Ear[%+EV:.+:SZ#+<VeG@<?0*Bl5&8
BOr<'@<6O%EZet.Ch4`'DKKe>FD,5.E-67FA8,OqBl@ltEd8d=G%GP#$6UH6+DGF1FD,5.E-67F
A8,OqBl@ltEd8dAF!+jg76s=;:/"eu/g+,,AKYhuBl5&9F(HJ4Ado(i+<Ve77ScoL786'H<(0\]
5u^B_+DGm>FDi:BATMF)+EV:.+DG_8ATDZsC`m\*FD,_<Bl5&$;FNl>:JOSd?k!Gc+<Ve;Bk)7!
Df0!(Bk;?.FD,*)+D>2,AKYGnASrW-Dg#]&/g*GlFCfJ8AoD^"Bl7Q+E+*j%F!(o!+<VdLFD,5.
A8,OqBl@ltEd8dEF`VXI@V$ZlCi=B+A0>;uA0>o(DfB9*ARmD&$6Tcb+=\KV;e]cR@psC#Anc'm
F!,C5+B(fs/M]1A+D>2)BOu6-@<,p%DJs_AGB.D>FCf>4A9Dp,DJ(($$6UH6+C\bhCNXS=?uTOa
CLgfqDfB9.@<?4%DK@EQ+@^9i+C\bhCNXS=1bp1qBOr;uBl%?'BlbD)1brfZ@<6*nF"VQZFC5Ob
%144-+<WrmDIn#7?t+"i?m'B,FD5Z2+D>2)+C\nnDBNY1E,9*&ASuU$A0>u4+Cf(r@r!2r@:O(q
E$/b,Ch7Ys$6UH6+CSnkBl8!6+EV:.+D>2)BOu6-F*)>@ARlotDBO%7AKZ&.A7]7ZEZet.Ch54.
$4R=b+<VdL+<VdL0fL4aDJUFC/ghba:-pQU0fL4<+@nds8.>n8$6Uf@+CK5$F*(r#+Du+A+ED%7
FDl22F!,F1Ecc#*F_kK,+C\bhCNXT;+DG_7FCelk+E(j7C3=T>+:SZ#+<VeKBOr<&@<6N5@UWb^
F`8rU6#:U\/0JD1@r$4++D,>(ATJu&Eb-A'BOt[hARlolB45LlF*%iu+<VdLFD,5.BOPsqATJu.
DBO%7AKYK$EcP`4E,TW)Bl7Q+F(o/r@psC#Anc'm+CT.u+EV:.+:SZ#+<VeIATMs3Eb-A-F!+n#
DfTr2A0>Su+CT/5+D>2)BOu6-A8`T.Dfd+=@<?!m/e&.1+<V+#+<VdL+<VdL+ED%7FCZLAA8Ygm
ALATC+<Ve%67sC$ATMs3Eb-A0@<6N5@UWb^F`7cs+<VdL+<VdL+ED%7FCZLAA8YgmALBPo0d%T6
67sC$ATMs3Eb-A&@:O(qE$-ki%144#+<VdL+<VeIATMs(+=C];@;TR'4#&H40fL3t:-pQUEb0<6
DfTD3BkM=%EbTE(+C\bhCNXS=BOPsqATJ:f+<VdL+<VdL%13OO,9nEU0eP.41,U1?E,oZ/+>bVl
1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2+@TgTFD5Z2.1HUn$6Uf@?uBP"A7-NtDg*=G@;BFq+CJ`!
F(KG9-W3B45tOg;7n"de0jl,4DIaktA8lU$F<Dqs;aX,J3&N'F0jl,4F!,")AmoguFE7lu+<VdL
GA(Q*+CfG'@<?4$B-;)'G9CF1@ruF'DIIR"ATKI5$4R=b.Nfj"+Dtb7+E1b0@;TRtATAo$83p0F
6rcrX?m',kF!+q'ASrW!A7T7^+EVNE?tsUjE+*d(F"V0AF'pUC<+ohcA7]@]F_l./$6UH6+DGm>
0e=GhF`M@BDe<T(GA2/4+>>Dj=(l/_+>G!I+B(fs/M]1A+D>2)BHV#1+E2@4AncL$A0>u4+EV:.
+EMX5Ec`FBAftW,D/]pk+<VdLF(96)E--.R+B3#c+D,P.Ci=N3DJ()6ATMs7+D,P4+CoV3E$043
EbTK7+DG_8AS6$tFEonV$4R=b+<VdL+<VdL@q]Xk@<6*mD/`ijC2[Wi+=DVHA7TUrF"_0;DImis
CbKOAA92[3EarZ6C2[WnATf\?C3(a3$4R=b.Nfj"+Dtb7+DkOsEc3(?F^]*#Anbgs+CIc;=\_:k
+Cf>#AKYYpF!+q'ASrW!A7T7^+D,P4+A-cqH$!V<+Du+>AR]RrCND*N:2b5c@W-1#+D,>(ATJ:f
+<VdL@ps6t@V$['FDl22A0><%+A,Et+DkOsEc6"AGA2/43XlE=+<VdL+<Vd9$6UH6+<VdL+<XEG
/g,1G@:UKuDffQ"Df9D6@;]TuF*)>@AISth+<VdL+<VdLBlJ?8@QcapF`_4T+ED%%A0<7;DffQ"
Df9DDBlJ?8@ODTl+<VdL+<VdL+>b3[F`\`RDJsW.@W-1#?YOJ)DIOtT8PiPb6=4/9De*3:BlJ?8
@LWYR$6Uf@+B3#c+E2IF+Co1rFD5Z2@<-W9E+*j%+DGm>DJs_ABl5&8BOr<"ART+\EZek1D/Ej%
FE8RCAfs]A6k'JG+<Ve;F_u)=/g*W%EZeq<@;Tt"AKZ).AKYAqDe*BiG$lG'Bk)7!Df0!(Gp$d/
F!+m6E+*j%3XlE=%144#+<VdL+<Vdg3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R=b+<Ve+BPDN1E+*j%
+Eq78+Du+>+E2@4G%kl;F)6+EF(fK9DD!%@$4R=b.Nfj"+C]J++DG_8Ec5K2@qB0nBl5&:ATDj+
Df-[G0eP.41,C@%BOPs)@V'+g+Cf>1Eb/a&ARmD95p0]LAmoguF:AR"+<VeDATMp$B4W30@<3Q*
DI[U*Eb/a&Cj@.EATT&2ART+`DJ()6D]iFA+>u,9+E2IF+=AO\DfTA9-X\'/@;0P#Eb0;7-rW]-
81?/#$6UH6+<VdL%13OO,9nEU0eP.41,L+CAR]\&@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.DBMAY
Bln'-DCH#%%144-+A*b:/hf+)Eb0,sD.R6#FDi9o+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P+Z_>7
+Eq78+Cf(nDJ*Nk+EV:2Et&I!+<Y]9EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZupDf'H9
FCfM9@3B/uDdda%DJ()8ATDj+Df-\8F_tT!E\7e.%144-+CIT69M%rM<+$hm@<3Q#F_u)/A0?#6
+EVNE2Dd$/8S0)jDfm1?AS#BpD/XH++EV:*DBLho+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJEZdtM
6m-GWFD)eBDfm12Eb-A(DeX*%+EMI<ATVU"DJ()9Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeqF`VY9
A0>u4+Cf(r@r!2rBl7@"Gp$U8D/`p*BjtdmBlnVC/KenEF)to'+EV:2F!,17+E2@8DfQtDATDj+
Df.0:$4R=O$6pc?+>GK&/i#4*8muU[@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5
$4R=b.Nh>+3A*!B-Z^DQF(HJ4Aft;J9i,+DBQS?8F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>ASu$i
A0>i3ARfFqBl@l3Bl8$(B4Z+)+:SZ#+<Y?+F!,17FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'@<?3m
Bl%L*Gp$R-FE_;-DBMOo3A*!B+CT.u+E2@8DfQtDATDj+Df0V=De:+a/e&.1+<X9P6m-PmDfTE1
+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC
8g$,H0Jj4G+<Ve:@;[3.ART*lDerrqEZeq<FCf?#ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.1a%!_
Blmp-+D#e>ASu$iA0>T(FCf)rEcW@FD]iG&Anc'mF'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(8ge[&
@ps6tDJpY<ART*lCi=3(ATAo8BOu$5+B3#gF!,X;EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2FC6X/
$6UH6?tX:o@WPp"@;]Tu?t=4tATV<&FDi:@Eb0E*DKI"CBOr<'BldrrDIdQtDJ()1Aftu&G;!lN
A0>>qDIIR2+Cno&@3B9%+Co1rFD5Z2@<-'nF"Rn/%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki+EVNE
FD,B0+Eh=:F(oQ1+E(j78l%htEb0<'F<GjIF`JTs:IH=B@<6O%EZet.Ch4_uGrcBA%144#+<VdL
+<YK=@:UK.B4YslEa`c;C2[W1%13OO+<VdL+<VdL:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+Gp%-=
B5)F/ATD?m+Co1rFD5Z2@<-'nF!+n/A0>r,F`\`u+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E+E(d5
-RU>cAp890FCcS0E+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(+<VdL
+<VdL%144#+<VdL+<XEG/g,1GF*(i2F<F0u@;]TuATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL+D,2*
@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9D..L-ATBD;C1\h&$6UH6+<VdL+D,2*@<6!&
C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De(J7C2PC.$4R=b+<VdL+<Ve%67sC$ASc9nA0>u-
AKZ#)B5)F/ATD?m+Co1rFD5Z2@<-'nF!,F1H"h//+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U+EVNE
@;^?5@VK^gEd8dADI[U%E+*j&@VKXmFEo!GATMp$B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("@;IT3
De(4)$6UH6+<VdL+>=s"0JG4(4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJF
Bkh]:%13OO+<VdL+<VdL:-pQUFDi:EF(HJ4Ch+Y:@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'nF!,aH
FWbmBCht5-@<Q3)FDi:CATT&:BOu$'%144#+<VdL+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,ATAo:
ATDj+Df-\9Afs\g@;]TuFD,6'+ED%+BleB-EZf(6+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%ATT&*
Bk)7!Df0!(Gp$!R5t"LD9N`KPDBNA*+E)(,ATAo.%144#+<VdL+<YT5+=D)DA7TCaF=.M)+<VdL
+<VdLA8lU$F<Dr/76s=;:/"e<%13OO+<VdL+<VdL:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t
8g&.cB5)F/ATAn&$6UH6+<VdL+ED%+A0<7<Ch.'j@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<BlbX2
$4R=b+<XET<(/hjBkAK5Dfm12Eb-A3DJXS@Bl8$(Eb0<6ARlotDBNtBDJj0+B-:],EcP`/F<F19
/hf+)@;]TuDIn$'EX`?u+<Yi=EcYr5DK?q=Afs\u+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(
Bk;?.@<3Q%F_u(?F(96)E--.D@;]TuEb0'*@:TfS+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k+A*b:
/hf+)A8,OqBl@ltEbT*+/g+,,AKXT@6m->TDKTB(+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0%144#
+DG^9FD,5..TCP2DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b.Nh>+
3A*!B-Z^D?BOPdkATJu9D]j.8AKZ,:AKYo'+EV:.+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!@<-W9
?r03g75A6nAoD^"ARlp)Df'&.%144#+CSeqF`VYAASuU2+EVNE?ugL5?nNR%DJ<U!A7ZlnBOPpi
@ru:&F!+n3AKZ);Ec,H!+E(k(+EqOABHU]'G]e+?3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78F(Jd#
@q]Fp/g+,,AKZ&*FED57B-;8/Dfol,+C\n)Eb0<6DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7F<F-t
GAhV?A.8kg+<Y*'G%l#/+Cf(r@r#drB-:f)EZek4Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(+B<;n
@rGmh+DkP4+Dbb/BlkIi:IHRO+CS_nCh\!:+:SZ#+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#D.RU,
F!+q7F<F1'F!+J#Bk)'lAKZ&:E,]`9F<G7*F!+n-G@>c<+E1b0FD50"/e&.1+<V+#+=\LA2'?gJ
+=AOE+CSeqF`VY9A0>u4+EMIAF<GU8B5)F/ATD?m+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`AU#>/
EcQ)=F!)lBEcQ)=F!,17+EV:.+ED%+AU#>/G]7\7F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&@;]Tu
@r,RoBkD'jA3(h\.X,oODJ(=>Ed2XJI4cXQDJUFC-OgD*+<XL$BlA#78l%htG%G]8Bl@m1+DbV2
+ED%+AU#>/EcQ)=F!,+6+EVNEFD,5.FDl+@Ch7d$C`mh?@;mh.$4R=e,9n<c/hen51*A.k6tKk>
D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bh
CNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8Bl7F!
EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@+@KpaARfg)
@!d6.+>,9!+CKVG?m&ukAnc-sFD5Z2F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l+:SZ#
%144-+<X*`BlkJ-Df'?"DIdf2A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&
Dg*=5Ec6/CATAo4Df?hAE-!W@$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D
8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo
@kUMa<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)
+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u6
05>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=
Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/
DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-
FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90
ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!
%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUp
DfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+
0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#
@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9
De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#S
Eb/a&DfTQ'F"Rn/%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.
A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2
.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po
+A,Et+CSekDf0VK+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%
A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1
%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn
$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(
C^g^o+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG
+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6
+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N
0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.
FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M
%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88
DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1
Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht
+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nB
A0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`
+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10
%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ8
9OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]Rr
CND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8
DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn
$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+G
AKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4
;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;
1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8
Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K
+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>
F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-
E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(
EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`
+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.
@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7
>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/
Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7
<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(n
DJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)
AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1
Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$
C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL
+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7
CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>
+FZXN:Id';AQWPb=)`D$CbBF:Et&I!+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//
+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXO
Ci=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FB
BlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4
@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL
:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^X
BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.
DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$
.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%144#%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[
3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4
BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(
+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4
BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&p
DIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E
4ZX]r@<;qc+<V+#+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et
+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UH
Bl7Q+FD,B0+E1b2FCfK1/g)8Z%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,
+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUB
DJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq
@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU
%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"
F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(
Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL
779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.
E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk
+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_
/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5
/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9
$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=)
,9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#
AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-
FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(
Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1
%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s
@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI
3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8
E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1
ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i
/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)
Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#
$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=
@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)
Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4
EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8
BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn
+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg
+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+
FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+
DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1
A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe
$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL
+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL
+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(t
F:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_
/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]Tu
ARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/
0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,
F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@
-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$i
DI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g
+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(
FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%
F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)
/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7
ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIa
FE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6
@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1G
G&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL
:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,
F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo
/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!
Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF
+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)
+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;
7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0
@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU
?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5
G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,
@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc
+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3
Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7
ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9
-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U
+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O
%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq
+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dn
ATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'
@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08
+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OC
EZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D
@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]
+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(
Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%
BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2
<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$
4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*M
BlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEe
Dg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUj
E,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&
+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G
+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8
E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-
+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*
D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&
A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*
2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q
:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7
Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-
+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b
.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?
1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(
GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,
B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457p
FCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A
?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1
F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8
AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dC
CLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?
%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTr
FDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL
+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>
BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<
3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLs
DfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdk
ARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]Ua
Eb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#
+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+l
E,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2
/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIj
CNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+
C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?
+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%
Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>
A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:
@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?
Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL
8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.
AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)
F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"
ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'n
CggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5
B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@lt
EbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY
?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL
+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59
H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(n
DJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-
FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2
/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:
DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*
+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(
F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>
Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c
.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k
@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0
ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5
@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+
Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K
+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&
A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlot
DBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKh
Ddm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(
+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8
A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSek
ARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'
DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."
Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#
D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](
@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<
3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuq
A0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(
+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cq
D.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0
BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM
8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=
Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)
ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-
:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr
?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@
?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm
+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)9
5t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4
$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,
%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6
F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@
ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)
A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSek
ARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0
B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi+
+>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:
F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VL
B4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlol
DIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%g
ATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.
F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s
$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8s
DJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0
AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+
Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#
+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[
+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNE
BOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6
B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@
?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*
+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(
Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>
ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-
F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-
BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.
+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6t
DJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*
+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:
Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=f
ARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+
@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'
DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;
AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk
+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k
+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4
+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'
DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8
F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2
+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlom
Gp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"
A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeF
AnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]
@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#
AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0
AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3
/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUj
BOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4
D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.
EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,
+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6
A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t
@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@lt
C`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4
DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(
@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\A
Bl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%
0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u
+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ft
FDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@
+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1
Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+
AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'
+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs
?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9
$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2
DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje
/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7
FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*Nm
CiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,
05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po
/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdk
ATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9Vi
ASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[
A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9o
DIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+
%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h
%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&
$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#
+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*+
+EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.
G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2
BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&
De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,
/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#
.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI
1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dL
D]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et
+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij
+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=
A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&
,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@
?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-
+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9
?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,
ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9
@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<Cggcq
ARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb
,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'
Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<
C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8
Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0
+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08
/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPE
BPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL
>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+
D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL
+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6
FDYh'$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0eP7)/KcHcBlGLDF`)52
Ch7$rARl5W%144-+@L?hE$043EbTK7+D>2)CER,#ARfKuDJsW.A0>T(+CK%pCLplrF(Jj'Bl@lA
%13OO,9nEU0eP151*A.k8p+rq+>G](+>PW+1a"2CATDWrDIm^-+Dbt+@;KKtARoLsBl@l<%13OO
+=\L.Bl7j0+D#(tFE8R5DIakuA7TCrBl@m1/g+,,AKYf-@psInDf-\9AftJrDe(J>A7f3l9OUn3
=:GT[+<YB>+Du+A+CehrCh7-"Dfp.S+Auc_ATD@"@qB^(FDi9o-Z^D>AS,k$AKWuc0JXba@<Q3)
@V'+g%144#+ED%1Dg#]&/g*b^6m-AcG9Cp;EHPu9ATJtd+?;&.1*CLU+DbJ.ATBC4$4R=e,9n<c
/hnt5+>"^*AR]\&@<-W90eb.$1,(I?+=L!'/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b
.Ni,;A7-O$ARfgrDf-\/A8--sA0>K&EZf72G9C9O+E(du+E)4@Bl@lA%13OO,9nEU0eP150H_qi
7V-%LF^]<9+>k\m1,(I?+=KchF(fhA9k-_&F(f/o@q?cOA8-."Df.!5$4R=b.NhJtG9C=5E+Not
Bm:b=DBNtBDJj0+B-9fB6m-S_F*)IG@:Wn[A1e;u%144-+AZHfDes!,AKXT'+D5_'E+irq+ED%1
Dg#]&/e&-s$6Uf@6YKnGB4Z-,FDi:0@W$!i/0J>@ATMs(?n<F.E+*6lA7-O%D]iq9FCcS:BOr;p
A7TCrBl@ku$6UH6@;]TuF`V+:De:+j83ng_2)ZRd@:O(qE$049A7]7ZEZet.Ch7Z?%13OO+=\LA
83p0F?n<F.9LV6B?m&lqA0>8`8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^+EVNEFCAWpAM+E!
%144-+AHQfDfQt7D/aN6G%GN%DKKqBFDi:@F`);D@psInDf-[L+EV:.+EVmJD]ie/BOPEoBlbD8
DJ*m%DJ(R2$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+S
Bl@l<%13OO+=\L5BOr<)Eb&a%+E(j7DfBf4Df-\-De*E%FCAWpATJu.DBNA,E+NotBm:ah/g+h9
Et&I!+<Y-)ASrW#BOPdkARmD9<+ohcCgh?sATAo8@:F%a+>GVoBlbD7Dg*=BDBN@1F(oN)Ch4%_
+<VeG@:s-oFDi:<ARTan+EML1@q?cpDfQt4F`_bHAKYK$A7]g7%13OO+=\L4Df'&..WoW>De!p,
ASuU$A1A^3De*F#+D>2,AKYGnASrW!A7T7^+EVNEFCAWpAKW]_/e&-s$6Uf@<+ohcASuU1Gp$^;
EZeb#E-#T4?m',kF!+q'ASrW!A867.FCeu*FDi:CBQ&);%144#+EV:.+Dtb7+CI`+;b0;V9i,4?
E+*cqD.Rg#E\7e.%14=),9S]n0J5+:+>"^.@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<O
Bln'-DCH#%%144-+@C'aE,TW*DKI!U1*C:K+CJr.DfTB0?m'?*G9CR;Ch.T0FD,5.8g%M%+Z_>7
?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!+<Y?/CiFG<8l%htA7]1c+EqOABHVD1AKYGrDIIR2+DG_'
Df'H%FD52uCh\!:+C\o(G@b?'+A*b:/hf+0F!+n/A0>GlEboH$EX`?u+<X9(F!,%=FCf?#ARlp&
Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-+@C'fEb/a&+CJVeG$lG0Df/uo+CT;'F_t]-F<E.XDf0B:
+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?
D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0
A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nfj%Bl[cpF<G+*Anc-sFD5Z2+CT5.ASu$mGT^F*A7]:(
%13OO+=\KVD.-pM;_LgYDKU1HE+*j%F!+n%A7]9oFDi:3Df00$B6A6'FD5Z2+EM+(FD5Z2/e&-s
$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#Fl
DegIaA8-."Df.!5$4R=b+=\L/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M
@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+
BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H
@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&
DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%V
Df-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.
:./J!$4R=b+=\L/ATo7hF`;VJATAo0@:C?uA7crmA7T7^+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$
+EM+*+EV:.+Co2,ARfh#Ed8*$%144mE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TD
An5gi-OgCl$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."
Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj/oY?5?m'<)A8,XiARlp*D]j1DAKXNC<)?L9Bl8!6ART*l
De:+_<)c[H%13OO+<W-V;IsHOEb0,uATJu9D]hY<9H[hY@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6
ART+%%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRmASbpd
F(Hd0$4R=b+=\LA@V97o?m&oe@r$4++D58-+EM+(FD5Z2+CSekARmD9%13OO+<W-V+E1k'+Eh=:
F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%A7]9o/Kf+GAKZ).AKYMtEb/a&DfU+4$4R=b+<VdL+<VdL
+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<b/ibOE3B836
+@1-_F`VXI1-$m.1,(FC%13OO+<W-VG%G]8Bl@l3@WcO,+D,P4+A*b:/hf"&@V'Xi+E1b2@q[J(
$4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+<W-V
?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b
+=\LAD/O/t+EM+(FD5Z2+CSekARmD&$4R=e,9n<b/ibOE3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+
Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1
+?1u-2_-Ki$4R=b+=\L+:IH=;DerrqEcW@3DIak^:IH=A@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"
FCetl$6UH6+D,P4+A*b9/hf4,8l8P?%13OO+<W-VDIn#7@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4
+@pWmB45gp@;[2rE,]B+A8-9@%13OO%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB%13OO+<W-V
Anc:,F<G(3D/F!/+EVNEDIn#78ono_FE_/6AKXKWF@^O`+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm
3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s
+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7Ch551G\&"=
ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@%13OO+<W-VD/!m+EZeq(BlnD*
$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5
F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-V
DIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7
ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3
Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb
+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b
+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-V
Bl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE
2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%
%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8
FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&
A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.
DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(
ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En
-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+
Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1
+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=
D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj
/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.
@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-
Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H
$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb
912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2
Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=
Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r
@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.
DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5
@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWp
AKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'
F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7
DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;
C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7
FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F
+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8
Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4
BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0
+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha
$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hnt7+>"^HATfF1
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
Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6
A8bs2C2[W8E+EPi$7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<
<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP151E\7lA7]p3
%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y
3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi
05>E9/oY?5%17&bAn5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn
@qB^T@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMa
F`;VJATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#
F(oN)8l%iA@:O(qE(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi
$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6
+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.
8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]g
E-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-
/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTC
E+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;g
D]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>
@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
Dds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ9
0ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2
+B*3$EarZ.%16-);H$._:-CWc0eP151E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'
-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr
9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&Ik
De*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;
C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$
+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043
EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]Tu
A8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*
F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!
Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1
+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE
@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?
A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT
%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9
F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-
F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>D
F`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo
+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@
6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=
+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,
@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDkF`)52B5)F/ATDm(F*)IY
0ht%f.WoWLAS5^uFCfK7ATMs7+EK+d+E_RBAS5^uFCfJ8FCfN8+Co1rFD5Z2@<-'nF"Rn/%14m6
Eb/lo-9`P#>p(A@+=f&t5U\"%ATMs.De(4B74p#94t.V&/g,(C+=AN                    ~>
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
zz=:zz,'MFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF CSRC DEFAULT DEPENDENTS'
zz=:zz,'END DEPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH D'
zz=:zz,'PLIMIT ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR0'
zz=:zz,'09 ERR010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 E'
zz=:zz,'RR019 ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR02'
zz=:zz,'8 ERR029 ERR030 ERR031 ERR032 ERR033 EXPLAIN FREESPACE GROUP HASH H'
zz=:zz,'ASHFSX HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IP'
zz=:zz,'YNB IzJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME '
zz=:zz,'JODPROF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF '
zz=:zz,'MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS N'
zz=:zz,'VTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 '
zz=:zz,'OK009 OK010 OK011 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PA'
zz=:zz,'TOPS PUTBLACK PYTHON REFERENCE RUST SQL SUITE SYMBOLLIM TAB TEST TE'
zz=:zz,'XT UNION UTF8 WORD XML ZIG abv afterstr alltrim badappend badblia b'
zz=:zz,'adbu badcl badfl badil badjr badlocn badobj badrc badreps badsts ba'
zz=:zz,'dunique beforestr bget binverchk bnl boxopen catrefs cd changestr c'
zz=:zz,'hecknames checknttab checknttab2 checknttab3 chkhashdmp clearvobs c'
zz=:zz,'reatejod createmast ctl datefrnum dblquote decomm defzface del did '
zz=:zz,'didnum dnl dpset dptable empdnl fex firstone fod fopix gdeps get gl'
zz=:zz,'obals globs grp gsmakeq guids guidsx host hostsep isempty islocref '
zz=:zz,'jappend jcr jcreate jderr jdmasterr jnfrblcl jodinit jodsystempath '
zz=:zz,'jpathsep jread jreplace justdrv justpath jvn lfcrtrim locsfx make m'
zz=:zz,'akedir markmast mnl mubmark nc newd nextbaknum nlargs now nowfd obi'
zz=:zz,'dfile od ok packd plt put quote read readnoun readobid regd remast '
zz=:zz,'restd rv rxs rxsget rxssearch saveobid second sha256 tc trimnl tsla'
zz=:zz,'sh2 tstamp uses valdate wex wrep write writenoun''),<<;._1 '' jodon j'
zz=:zz,'odoff jodon''                                                       '
zz=:1821{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&q+>Yc02'=b!2`#2eA55HD+=_,EA0>A6/Ken=Bl5%c:IH=9Bk)7!Df0!(Gp$U5@<6KB
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
3=Q<o;+s,61GB7F8lJM\4ZYAR%15['=\_:H3\rN#$;<lS:-CWo1CX[p8Okp)1GfOJ;H6Xp4ZYAV
%15I$;F<T.1H#[L%15is/g,">@rcK1FCf]=+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T
/4``79Is:?9Is.3=B$h<=]@g@9gMZM6r-lZ/6,Y=3%Rm/<(Ke[/5oD>/4ri::+St5=\_:79LV6B
/6YV8/5fJH<%LC8;F:m#%15is/g,(AC1Ums+Cf>#ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S
3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ
<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_
:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU
@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL
/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhsCh[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@
@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,
-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2
F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;
67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1
BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF
%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBp
FD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(
/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBp
FD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=rA93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4
C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA8c?\67sa&De*d(+EK+d+E2.*@qB^(-u*[2Df.!H
@;]Tu-u*[2De<T1+DG^9H6@$B@ps1b/e&-s$=e!aF`MM6DKI!KH7'./                   ~>
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
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 globsBasicDDef00 makePathtest02 mnlBasic00 putNameTimestamps'
zz=:zz,'Basic00 restdBasic01''),(<<;._1 '' jodpreparetests createtestdictiona'
zz=:zz,'ries loadSmoketest0 loadSmoketest1 loaddumpSmoke00 loadtest001dicti'
zz=:zz,'onary loadtest002dictionary loadtest003dictionary loadtest004dictio'
zz=:zz,'nary loadtest010dictionary loadtest100dictionary makePathtest01''),('
zz=:zz,'<<;._1 '' jodsmoketests abvSmoke00 addgrpSmoke00 bgetSmoke00 bnlSmok'
zz=:zz,'e00 bnlSmoke01 bnlSmoke02 compjSmoke00 compjSmoke01 delgrpSmoke00 d'
zz=:zz,'idSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeMacroTexts docSmoke'
zz=:zz,'00 dpsetSmoke00 edSmoke00 etSmoke00 gdepsSmoke00 globsSmokeAssign00'
zz=:zz,'0 globsSmokeDD00 globsSmokeDoc00 grpSmoke00 gtSmoke00 jodageSmokeDa'
zz=:zz,'ys00 jodhelpSmoke00 jodonSmoke00 locgrpSmoke00 makeHashchkSmoke00 m'
zz=:zz,'nlSmokeArgs00 newdSmokeBadArguments00 noexpSmoke00 notgrpSmoke00 nw'
zz=:zz,'Smoke00 odSmoke00 odSmokeArgFail00 putMaxnameSmoke00 restdSmoke00 r'
zz=:zz,'evoSmoke00 rmSmoke00 rttSmoke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmok'
zz=:zz,'e00 usesSmoke00''),<<;._1 '' jodstresstests getStress00 macroloadStre'
zz=:zz,'ss00 makeHashchkStress00 makeStress00 packdStress00''               '
zz=:1124{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>PcgDe*<cF(o-+ATMs7F*22=AKYo'+C\c#Bk&8X:IH=IATMs7~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&o1E\G0+>G_r1H$@11E\M0+>G\q2)AucA7AtgBk)6rF*)JEF_Pr/+E(j7@UX=l@j"B>
6m-S_F*)J<De*g-AT2'uATVL)FE:r4ART[lF!+n/A0>],@:XF%FCfN8F!,"-@ruF'DIIR"ATMU)
A92U+CLqU!F*)JH@<-(#F`S[HD/X3$+EV19FE8QV+Eh=:Gp$R)F(o,,Ap&!$FD5Z2F)#W(F*)G6
F)uG7F*)JH@<-(#F`S[HFE1r6F!,R9F*)IG/Kek<EbAr+@Wcc8DJsV>@rc^5BPD?s+Eh[>F_t]2~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkcT;F;Qq;Go2)1*B"`;D9m_+A$lO:IJo7FCfK)@:Njk8U=!)7!*?cCi^^j
H:gt$F`_>8FCfK)@:Njk8l%iS:JXY_<_Yt)8l%iU9gg+"9/&(T+Au3<<$6$dCLnkB/1<VC4"akp
+=A:BASc""E)UUlCLo1R+D5dpD/X3$0JFVaDe*NmCiE<iDeio<0Hb1M@:W;RDeip+ATMrI+Dbt)
A5d>`CLqU!F*',ZCi<`mFCfN80eb:lBk)7!Df0!(Gp$pA@qTh$;f-GgAM>e\D..3k87?RQ@q]XV
D/X3$0JFVd@;BFF@<6*lBPUOgEb0<50JFVd@;BFN@<?1)ATMrI0d(=ACLp=NFD,c-F*')k+Du+/
G]6SuDeio<0Hb7OFD#W5;f-GgAM>e\DKf#rDeio<0HbCIG&L;rDeio<0HbCQ;f-GgAM>e\EccD%
D/X3$0JFVlF(KDkD/X3$0JFk'/1<VC4"akp+=A:HDe'u*De*d(-RgSp4?P\X?SNZN+DPh*@UX=l
@ru:'FE8R>De*g-AT2'uATVL)FE8R>De*p+Deip+ATMs7+DPh*F*)G6F)uG7F*)IN.4cl04?G0&
0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+B2-):L?^i6sjeA+D>J1FDl2F
C2[W*BPDO0DfU,<De*Bs@j#VsDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8
A92[3EarZ'F`)52B5)F/ATDm(F*)IN.4cl01*A;+,Vh&/1b^jD0J54:1c@'G3ArWM+>PW+1b^jC
2_HpC2).*N1bpsE+>PW+1b^jC2_HpC2E3BI1bg[=+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC
2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-p@2DR'G+>PW+1b^jC
2_HmG1c-mF1,:U@+>PW+1b^jC2_HpC3&ruS2)@$J+>PW+1b^jD0J54:1,(R?1c73O+>PW+1b^jC
2_Hp@2)@3H3AWEN+>PW+1b^jD0J54:2)$sD2)[0K+>PW+1b^jC2_HpC2).*N1bpsE+>PW+1b^jC
2_HpC2E3BI1bg[=+>PW+1b^jD0J54;0JP780JbL>+>PW+1b^jD0J54;0JP780JbL>+>PW+1b^jD
0J54;0JP780JbL>+>PW+1b^jD0J54;0JP7;3A`]P+>PW+1b^jD3%d'E3AiQK3&WHL+>PW+1b^jC
2_HpC3&ruS2)@$J+>PW+1b^jD0J54:1,(R?1c73O+>PW+1b^jC3A*0F2_m9L0etR7/1<V9+>Gi$
1,(I?0K1aG/i,LD1c$sI1G^d/1,(I?0K1aH/i>FA1H.0L1cRK<1,(I?0K1aG/i,FE3&rrP1,(R.
1,(I?0K1aG/i,LC1,UmK1bga.1,(I?0K1aG/i57?3B/uY0JG7)1,(I?0K1^G/i>OC1GLmH2E)a6
0JYI=2_m<E1bpmG0fCjD1,U100JYI=2_d6D2Dd3L0K:jE2)-4/0JYI=2_d9E2)mTV1GCgH3?U(2
1,L[D1,(=:2E3NQ0K:sM2BXb/1,L[D1,(=:2`3HH3ArcP1a"P-1,L[D0f^jC2)mBH0JPOF3?U(2
1,L[D1,pmD0f:[C3&3HQ1*A>+1,L[D1,pmD0JbLF2_m6K0d&5*1,L[D1,U[@1GUpD2E<ZT2]sk0
1,L[D1,pmC2`WTK1H%-O1E\G,1,L[D1,pmC2)dKN2)mKR+>PW+1b^jD2D-gB2)mTM3B&]O+>PW+
1b^jD2_HpA3AiTO1GUpF+>PW+1b^jD3%d'E1c%'J2DdBR+>PW+1b^jD2_HmF3&<<J1,^pE+>PW+
1b^jD2_Hp@3A<?O0etFC+>PW+1b^jD2_Hp@3&<<J1GgjG+>PW+1b^jC3%d'H3B&rY1H7981,(I?
0K1aG/i5@<0f_$D1G^a.1,(I?0K1^F/iGUD2D@$I1GUg11,(I?0K1^G/i>XG3&*<F1b^[-1,(I?
0K1a@/i,CF1cR0K2E3T;1,(I?0K1a@/i,FD2)%$K2Dd651,(I?0K1^H/i>@D0f_*O1,Um21,(I?
0K1aH/i>C>1H.3M2E*Q;1,(I?0K1aH/i>=@0JbUC2E*E71,(I?0K1aE/i5LF1G_$F0Jkd41,(I?
0K1aH/i5OG2`EWS1,q691,(I?0K1aH/i5IH1b^jC2D[661,(I?0K1aF/i5LE2`!EO3AW*8-p07-
1*eV/1,L[D0fL^A0KCpE2`EQJ2]sk01,L[D0fL^@3&NQL1c[EL1E\G,1,L[D1,(=<0K:pD2`NTO
2BXb/1,L[D0fL^@3&NQL1c[EL1FXk'4>J$9,Vh&/1b^jD0J5.?2)R?L3&EBI+>PW+1b^jC3%d'K
2DdER1cI*J+>PW+1b^jC2_I!F1bpgG2`WfR+>PW+1b^jC3%d'J3B9)U0fC^@+>PW+1b^jD0J5.?
2)R?L3&EBI+>PW+1b^jD0J5.>3&NQQ3&<9H+>PW+1b^jD3%d'E2)@'E3&!'D+>PW+1b^jC3%d'J
3B9)U0fC^@.4cl01*AS&1,(I?0K1^F/i,ID1bg[B1,Cd11,(I?0K1^F/i,ID1bg[E3Ar!80JYI=
2_d6D1b^XC0fV*J3A_j60JYI=2_d6D2E!NP1,q6Q3&Da50JYI=2_d9E2*!ZQ2E*KR1,U100JYI=
2_d6D1H73J0K(mK1c?I30JYI=2_d6D1H73J0K1aB1,C%.0JYI=2_d6D1H73J0K1[B2_lL20JYI=
2_d<F2)70H2)@$D0KC720JYI=2_m?F2)@6M1,V!G3&_s80JYI=2_m'>2)-d>0JkUH1,C%.0JYI=
2_m'>1cIBQ2)I!A2`2^50JYI=2_m'>2)%!G1,q*K0JXb+0JYI=2_d9E2*!ZQ2E*KR1,U100JYI=
2_m'>2)-d>0JG1:1GL"-0JYI=2_m'>2)-d>0JG:C1c6C20JYI=2_m'>2)-d>0JG793&2U30JYI=
2_d<F2)70H2)@$D0KCR5-p014/1<V7.4cl00I\P$4>8384>6                          ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
