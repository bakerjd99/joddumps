NB. JOD dictionary dump: 15 Jul 2015 10:12:43
NB. Generated with JOD version; 0.9.980; 1; 6 Jul 2015 11:24:25
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|232590103446231617475144735166094174823|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


IzJODinterface=:<;._1 ' bnl del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.980';61;'15 Jul 2015 10:04:36'

JODVMD=:'0.9.980';4;'15 Jul 2015 10:04:34'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$75+>P&o1a"Y2+>GPm1G^..2BXb2+>GSn1GL"1+>P\p0ea_,1*AP!1H%gN8l%ihDKKH1Amo1\
@rHC!+A,Et+DG_8ATDBk@q?d,DfTB0+>"^PDdd0fA0>T(FDi9MBkhQs.3NGF@ps1b8U=!)7!*?c
Ci`3E6rZrX9N*&^BkhQs.3N>BFCfK)@:NjkGAhM4F!)SsH:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+
DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU
9gj/9EcYr5DCcoI@;BEs@;]TuA79RkB4Z1&FE;P4D/a-!F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-
F<GOFF<G[>D.Rd1@;Tt)E-682Ci"37E-68D+CT)&+EV=7ATMs%D/aP=/Kf+GAKWC6ATV?sCij_I~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@3+>P&o0H`))1,9t-0d&8,3AG&YA5d>`CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<
CLnW1ATMrG%15is/e&._67sBhF)uJ@ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV
+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z+<VdTFCfN8C2[W:/0K%GF*)/8A2,VXFCfN8C2[W;
0J">gATMs.De(RV0I\+R$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,A7]7*3?VgMDK]T3FCeu*FDi::2D-[=+A,Et%15is
/g)l'DJs\Q3$<?_A79RkA0>K&EZdt502-(tFa+?&:-pQU0f<]gCbRjlEb0,sD.R6#-tI%&;f-Gg
AM>ee+D,Y4D'16;Bk0P=F(o,<0JP"!%15is/g)8Z+<VdL+<Y]IDBNY2+DQ%:CERG3@ps1b%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eX
D/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8
-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8
%15is/g,7LAKYMt@ruF'DIIR2+DG@tDKKT)Bk(RnBl@l3G%G]'+=Lc7A18X8B5VX.ATJu.F=2,P
@<-"'D.RU,F"Rn/ATAo3A0<7AATMs.De(OL%16Ze+Co1s+>=63%15is/g,%SD.7's+E(j7A8,Oq
Bl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn$8EYd+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3FCfN8
C2[W;+EV19FD>`)0ea_lATMs.De(RV0II;:%14p74WkslI4cXQBk/>?%13OOATAo94ZX]>+Co1s
+>=632'>%),9S]`E+rft+E\eL:-pQUBl7EsF_#')+D>=pA7]cj$4R>REZd.\De'tP3[]#\F*)/8
A2#-JATMs.De(RV0II;:ATAo94ZX]rBk/?8+>=631E\h',9S]`E+rft+E\,#%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$$m]CLoLd3F?oJA79RkC2[WnBleB:Bju4,Bl@la67sa1E+EC!ASQ-oA8-+,EbT!*FD5Z2
+EK+d+E_X6@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df.0:$;No?+:SZQ67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq4.FDkW"EZd+k0Js:H:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+>>cl@<jUf+ED%1Dg#]&+DG_7FCB!%+C\c$F!+n/A0>r'EbTK7F!*%WF(oK1Ch[KqATJtd
5tiD<@;0V$AStpo@q?)V:-pQU0K=,bE&'6m@:Wn[A0>Q"F*)>@GqO2`F<G[D+Co2-FE2))F`_2*
+D,>(ATJ:f:-pQU0em9O@PK\^@rH(!F(KB6+=Cl<De(4<@:Wn[A1VJ6A1hh3Afu,*D/XT/A0>K)
Df$VCBlFLg:-pQU+<VdL+<VdLB5_^$Ch580De*EuCh7i6A8-'q@ruX0Gp%6KA79Rk+ED%1Dg#]&
%15is/g)l'An>F+2]ujRA8l'k/p)>[+Co2,ARfh#Ed8dHCgggbBQ%]tATAo%A7T7^%15is/g)l'
D..]E3$;sSA7TUg05P??Fa.eBFCfMGFEhmM@:Wn[A.8l@67sB812:rL1,'h!F(KH.@:WneDK'$+
BQGUF@:Wn[A0>K&EZfR?DCcoHBl8'</0Je<@j#`!FD)*j:-pQU0f!KdDDEsi@:Wn[A0<:;@:O1n
FCfN#<*3*K+:SZQ67sB812:rL1,U1dDfT?%DJ().Bl7K)ASu%"+=M>M8gt2V:-pQU0f!KdCbRdj
@rH=3+Co2-F<GmDE$07@+CoM2E+3a1+D,P.A7]cj$;No?+>G]fF`&rl+ED%1Dg#\7A9)U-@W-K6
AoDKrATAo'DfBt2$;No?+>G`j@<+(\+ED%1Dg#\7H=gl-ATJtG+D,>(ATJu9D]gYb/h^sXA7T7p
04A[2ASs/BFCB9&0.nk0+Co2,ARfh#EbT*+%15is/g)l+C3=>I2'?pND/XT/+=LuCA8,plAU%QQ
<)$%8+DbJ,B4W3(@WQI(ATVK+DdmHm@rr.e%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5
De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%0ARTXk+Co1rFD5Z2@<-'nEt&IdF`MLc3ZqsIA0<Q8$9g.j
1E^UH+=ANG$9g.jDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R>;67sBmATVEq+ED%5F_Pl-A0?#:
Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o4tq>*D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<p
De(4)$4R>WDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt%15is/g*b^6m-Pm@:s:lB-:`!Eb/a&DfU+G
F`(`$EZf=DF<G+.@ruF'DIIR"ATJu&Ch[Hu+Co2,ARfh#Ed8*$8l%iR<'a#C6qL9>3Zr0V@<?1(
AT/b?+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C+1\]
F*(i'AM7e:A1o;>$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%-YR48FDl2FC2[W*
Bl8!6@;KapDe'u2ATMF)C2[W*C2[X%@<-4++DPh*E,ol/Bl%?'D..<rAn?%*C2[W*CggdaG[YH.
Ch5:S0d(4LA8,q'Ec3(8De*C$D/^j3$?L#H3ZrK[/12Q6@:DWID/^V4De*<gF*&O=DKBo.Ci!j)
A7Ath+ED%7ATV[*A7Ath+DPh*E,o]1+DPh*F`V,7@rH6sBkLm`CF9PuF)4!#+?MV,F)3BT+DPh*
E+EQf<*3*BCh[d0G]%GAATM3X=B$D[@:O1nFCfN#<*3*I%13OOEap4r+=D2>+DPh*F(95<4ZX]B
+D58-+EM?.$4R>;67sC%ATT&9@rc:&FE7lu.!mQj0d(4LA927$.6T^7HTE?*+DPh*F(95"$4R>;
67sC$F`&<o5tiD<@;]dkATMr&$7I;V+Z_>40I\,*3Zp+;.3NJ9DJ<]oF*)/8A.8kT$;No?+E_X6
@<?''Anc'mEt&I14=G;i8g%keA8kstD0%-K+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1E+*d(
F"V0AF!hD(0K^b*Db;-eDe*g-De<^"ALS`E+<Y9?EbTW,+A,Et;cH%Q779^F/151NA8lR-Anc'm
/no'A-OgD:4=G;i8g%e]F*)>@H"q8..3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YR48FDl2F/p)>[
-OgD:4=G;i8g%keA8lR-Anc'm.3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YdR1@UX%*C2[X%Ec5Q(
Ch7'aCG'=9F!hD(0K^b*Db;-eDe*fqEc#kH+<VdL+<Y9?EbTW,+A,Et;cH%Q779^F/151NA7At_
05>E9E+*d(F(/Qn/no'A-OgD:4=G;i8g%keA9Ds)Eas$*Anbme@;@;7+D,h<Blmo/8l%iR<'a#C
6qL9--YdR1@UX%*C2[X*F(KB%Df00$B4>:b/no'A-OgD:4=G;i8g%tZDJ<]oF*)/8A18WD+D,h<
Blmo/8l%iR<'a#C6qL9--Z*:0BkCptF=q9BF!hD(0K^b*Db;-g@:Eem@;Tt"AM>em.3N5HEbTW,
+A,Et;cH%Q779^F/151NA8G[`F"_?<@V'dmD/a<&0JG46Bkh]:%14dO.!0B"+A?3Q7!3?c.3K`U
+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2Cggd`F_u(MBkh]:%14dO.!0B"+DPh*Bl8$5
D^ceO+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WsDKKo;/no'B-OgD:4=G;i8g%ke
A7Th"E%)nP+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo05>E9A9Da./no'B-OgD:4=G;i
8g%keA7B+kF=A=T+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo05>E9@V'V&/no'B-OgCl
$;No?+D#_-DKL#0Ci"A>@;^"*BOu3,E,ol3ARfg)D..<jB4Z*+CggcqGA1l0+C\n)@:Wn[A0;<g
%15is/g,4WDfTD3BQS*-+DG_(AU#=L+E)@8ATAo3DJX$)AKYT!Ch7Z1@:NeYF)to'+EhI-+DG_8
ATD["F<GC6DJO;&$;No?+>>o+FDjboC2[WsDId='?V"-j9IV)rGB.D>AKXT@6rR&N7n#g;;Cj21
De*Bs@kVM;D/<a$@kVS8A8,plAU#h@FDYhA%13OO:-pQUF*)>@AKY`+A8l'k/p)>[+E2.*@q?cr
DerrqEZet4EZf+8A1hh3AfrZJ@<Q'nCggdhAKYo/Ch[cu%14dO.!0B"+DPh*E+EQf<*3*K+D,h<
Blmo/8l%iR<'a#C6qL9--YdR1A8bs2E+EQkDdtG8De*ftAhJ1MF=.M)%15is/g,4WDfTD3Ch[d0
GV<oB@j#i3ARfFdBk&9'DffQ3%14dO.!0B"+Dbb0Fa.eBFCfN#<*3*K+D,h<Blmo/8l%iR<'a#C
6qL9--YdR1A8bs2Ch[d0G]%GAATKJGG]Y;B$8=RjFDjboD.-plDffQ3?W:-,.3K`UAp890FCcRe
:IJ,\5t=@38Q%)eC2[WnDdtG;@:O1nFCfMGFEhmT%13OO:-pQUEb00.ASqqa4tq=>+E(d5-RT?1
4tq>%A0?:Q@s)g4%13OOF)>i<FDuAE+=CoBA0>r8@:s-oA8-'q@ruX0Gp%6KA79RkA1%fn%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%13                ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&r*A+>Y,p2'=Xs2E*H81,'h++?(u1+>GPm1*A;.1c[?70f'q-+>PW.2'=V4+>P'!3&Da42]sju
2DR*30eje++>G]40H`)1+>P&s2_lL12]sju0f1[C8l%iA<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?
+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO
0f][M$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp='
8p+qm1,(F?+>GT31,M$I2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2'>M6C`kJe0f:(-3BB#U3\iT#$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO
1GfG2:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo/ibOE2_uR!
6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U0JPF-0ek^E
1cdBM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3?TG4
@<?'A+>G_r8p+qm1,(F?+>>f:2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2D?6r6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6C`kJe0f:(.
0KLmE3\rZ$BPDO0DfU,<De(U^%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B/]8/Ke.t=:GTH$6Uf@Ddmd+Ch7^"+CI`>
9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7C
Eb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$4R=e,9n<b/ibOE
2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,
AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#
+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043
EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*
A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;
F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+G
BOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk
/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL
+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[
B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<
Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+
Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO
+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[
+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$
FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3
DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#
+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,
AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9
E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\no
DfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.
D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8
Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''
FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#k
Bln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dn
ATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1
$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A
+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:g
B4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr
<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,
Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q
;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrp
DerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@lt
Ed8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9
C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA
+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9
FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t
%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQU
B4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeD
Ci^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnu
De*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIakt
Cijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&
G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH
+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:g
B4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."
Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1
/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/
%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,
ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80
+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4
+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!
Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<
ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@
Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1r
FD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A
?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&
F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2
C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR
05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg
/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A
+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=
05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*
1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQt
DKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL
+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#
@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2
A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m
/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>
+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/
EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I
+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4
+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ck
DIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue
+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/
F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-
+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H
%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*
Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&s
Bl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9
Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%
+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg
.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9o
FDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDb
Ec6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$
FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>
:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh
7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL
+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#
.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%
+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_A
A8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/Q
E$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*
BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:
+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>
@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl
/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,
DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf
+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,
Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7
%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(n
Ea`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6
+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$
?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6
@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"
AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$
?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq
+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM
6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-
E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+
EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&
+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0
BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2
@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u
+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#
+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ
6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=
/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/
Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_
6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth
+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!
+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M
+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNE
FCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds
@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$
+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%
+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1Ums
F!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9
D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)
@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#
+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*
+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!
ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi
+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'
DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:
$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!
Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cj
C2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[Wr
ASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%
+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17
+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&
EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1
Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/
DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(
Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!
@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU
0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF
+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNa
E-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k
$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T
+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds
@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!
Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#
+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=
@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1
@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5
Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm
@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7
@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u
+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#u
FE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@
+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*
EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k
?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsg
Eb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6
@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*
0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)
AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)
@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq
/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir
+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;
%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8
Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?
+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4
+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&
+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0
ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD
/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+
D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>
F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)
D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LU
BPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1
/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&
?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi
7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR
/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4
CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!
+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#
+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth
+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#
AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0
Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4
D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.
Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7
Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y
$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNE
AStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</
Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44
De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA
6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;
+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK6
6V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4
FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3
B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*
DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]4
8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.
A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l
:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c
:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=
H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"
A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr
@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l
+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibC
E,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7
C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^
+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o
06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSB
DJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=)
,9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#
.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl
/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)
/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*
A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)
DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LN
Bl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq
$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(
+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht
/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6
@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et
+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4
+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<
ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2
@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2F
C2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>=-pFDl2F
C2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@
+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V
?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3
Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9
/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc
$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5
Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*Nm
CiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu
8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jk
Bl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.
FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@
0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2
@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt
$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3
Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[
@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,
Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#
+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR
=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.
ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNS
G%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b5
1,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cq
FCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_t
DIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g
@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58
@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNE
A8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=
F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1
F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,
EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%
A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZp@;BF@@<6-m8l%iSATMs71,2Nj/h1^HCLoh@F(o,V:IJ/n
F*)IGF"JsdD..3k+A,Et+C\c#Bk&9-ATMr9F(96)E-*]A$;No?%15is/g+,,BlbD<@rc:&F<G4-
DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m,rIF(o+n$;No?+EV19FE9&W
<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqV[:-pQU
-t6V+ALSa<De!3lAKZ22FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC%15is/e&._
67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>+<Y04DKKo;Ci!Zn
+<Y-=%15is/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYb
AU%]rARoj)FD,4p$;No?+Du==@V'R&De:,6ATMs7+DG^9FD,5.-u*[2@UX=l@ru:'FE8lRF*22=
AM+E!:-pQB$;No?+CT>4F_t]23XlEk67sB'+:SZQ67sB'+>G;f5p0ZUDJ!TqF`M&(+A*beBl[cp
FDl2F+FZpY6rZTR<"01067r]S:-pQUG%G]'@<?4#3ZrN_+E_a:+CoCO%15is/e&._67sB'+AP6U
+D58'ATD4$AKZ&(EbTK7%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX
67sB'+ED<A-Z*:-AO9gHBk'b26r[`=FE8f=$;No?+:SZQ67sB'+AP6U+EDUB+DGp,$;No?+<VdT
0HiJ4.3L`fE+*j%+=DV1:IJ/N;cGD:@<6-m8l%iSATMs7/no'A-OgDX67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4
-XpM*AL@ooCi<`m+=CoBA9;C(FCfJ?%16r\CLpF]DeioV:IJ/nF*)IY0ht%f.W&U0AQ*GaCLp+6
6r[`=FE8RG/M/)^@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&F=mnq67rU?67sB[BPDN1F(96)E-*48
ASu("@<?(%+CQC6@rc:&F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=HD/X3$$;No?+EV19FE9&W
<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqNG67sB/
@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16Eb/rtDK@E;:-pQ?:-pQU
<+ohc+EM7CAKW*<De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(
Gm[;5/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYbAU%]r
ARoj)FD,4m:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[X(D/X3$FCfN8F"&5QF_Pr//db??
/db??/g+SDF*2>2F#jY'67rU?67sC(ATD6gFD5SQ$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMn:-pQU@rc-hFCeuD+>PW*2/78M0KBJ867sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhpDe!p1Eb0-1+=CW,F(H^+Ci<`m+=CoB
A9;C(FCfJ?$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E
:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*<O0II;::eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8
Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[
%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2
De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMG
FEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKi
Cggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[\Z#
0JO\b2D?m/C,[h$+DNki0d(3j0JXbc3&!-2C,dn(-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5
Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m6
8g&(nDeF*!D/F!)B-;;7Deq$K8l%htBlbC+$=P'$DfTA2DfTQ'DKKH#+Cno&@:EYdAKYT'EZee,
C`mhFE+O)5De:+a+E(_(ARfh'/g*b^6m)pGF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe
@<6"$+CT.u+E2@>G%kJuF!,RCDesJ;AoD]4%16Wa@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh
/g(T1%15]M2_He/0/tR<GT]US6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0:$;bbW
DfQtDATDj+Df0V=De:+a+DkP&AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08
/e&-s$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[l
DKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$
+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%
DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S
@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h
@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3
+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;
C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J
+CT@Q%144#%144#+D>k=E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A7;
%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<n
De!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Aiq3A*<N1FEV=:eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q
;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0Nf
A8bs2C2[W8E+EPi$7QDk;FO8J5uU383Zoeb2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki
1a`_>6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5
@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.
+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OO
BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"
DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dk
ATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M
@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibmF-OgDZ9L2WI:Jsnc4ZXs7Bl5&0
Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCpt
F=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*
%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jk-d$:I<Z78?6L4ZX]>
+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*
Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X
+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&
+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI
6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RH
BOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P
%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf
@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15]M2_He/0/tR<GT]US6m-M]
EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M:i^8gEZbeuG%G]8Bl@m1+E(j78g%tZCLnV:
C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/%15^'6m-PhF`Lu'+Co1rFD5Z2
@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO
+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2
F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr
+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cM
De*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/h
FCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-
F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;
DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@
6m,<7B4W2oF?0j<+<V+#+<Ve?FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/
B4W_*$7QDk                                                                ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&o2]sk6+>Get1,`uXCLoh@F(o,V:IJ/nF*)J?@;BEs8l%ht@UX=l@j#l)F*&OG@rc:&
FDYH%AQ*GaCLp+66r[`=FE;;-CLnV\:IH=HD/X3$+EV19F<GX7EbTK7                   ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ER'
zz=:zz,'R004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR013'
zz=:zz,' ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR'
zz=:zz,'023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GROUP HTML'
zz=:zz,' IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILES JDSDI'
zz=:zz,'RS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVERSION LA'
zz=:zz,'TEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NVTA'
zz=:zz,'BLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK0'
zz=:zz,'09 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK R'
zz=:zz,'EFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML afterstr'
zz=:zz,' alltrim badappend badblia badbu badcl badfl badil badjr badlocn ba'
zz=:zz,'dobj badrc badreps badsts badunique beforestr bnl boxopen catrefs c'
zz=:zz,'d changestr checknames checknttab checknttab2 createjod createmast '
zz=:zz,'ctl datefrnum dblquote decomm defzface del destroyjod did didnum dn'
zz=:zz,'l dpset dptable empdnl fex firstone fod fopix gdeps get globals glo'
zz=:zz,'bs grp gsmakeq guids guidsx host hostsep isempty islocref jappend j'
zz=:zz,'cr jcreate jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jr'
zz=:zz,'eplace justdrv justpath jvn lfcrtrim locsfx make makedir markmast m'
zz=:zz,'ubmark nc newd nlargs now nowfd obidfile od ok packd plt put quote '
zz=:zz,'read readnoun readobid regd remast restd rv saveobid second tc trim'
zz=:zz,'nl tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '''
zz=:zz,' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS '
zz=:zz,'DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 E'
zz=:zz,'RR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 OK201'
zz=:zz,' REFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyfiles cre'
zz=:zz,'atedl dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropbakdi'
zz=:zz,'r dropdir dropinv dropnc dropref gettstamps justdrvpath libstatus l'
zz=:zz,'oadbakdir loaddir loadnc loadref loadstamps maxback movefile nummas'
zz=:zz,'k packdict packspace puttstamps renamefiles restdict restspace save'
zz=:zz,'dir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake DUMP'
zz=:zz,'MSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPTAG ERR0150 ERR0151 ERR0152 ERR'
zz=:zz,'0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAI'
zz=:zz,'NFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCHARS'
zz=:zz,' SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl '
zz=:zz,'clearso clfrbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumphead'
zz=:zz,'er dumpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap'
zz=:zz,' fmtdumptext fromascii85 getallts getascii85 halfbits htclip jnb js'
zz=:zz,'cript jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep '
zz=:zz,'opaqnames parsecode putallts rlefrnl sexpin sonl tabit toascii85 uq'
zz=:zz,'tsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore '
zz=:zz,'CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK C'
zz=:zz,'NPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 '
zz=:zz,'ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR0'
zz=:zz,'62 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 E'
zz=:zz,'RR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR08'
zz=:zz,'2 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ER'
zz=:zz,'R092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101'
zz=:zz,' INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 '
zz=:zz,'OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 O'
zz=:zz,'K063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx a'
zz=:zz,'llnlsfx apptable appwords badcn bnlsearch bnums checkntstamp checko'
zz=:zz,'pen checkpath checkput closedict createst defwords delstuff delword'
zz=:zz,'refs didstats dnlsearch freedisk freedisklinux freediskmac freedisk'
zz=:zz,'win fullmonty getdicdoc getdocument getexplain getgstext getntstamp'
zz=:zz,' getobjects getrefs gslistnl inputdict invappend invdelete invfetch'
zz=:zz,' invreplace islib iswriteable iswriteablelinux iswriteablewin jdatc'
zz=:zz,'reate jwordscreate loadalldirs loadallrefs loadwords mainddir newdp'
zz=:zz,'arms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendi'
zz=:zz,'ct pathnl pathref putdicdoc putexplain putgs putntstamp puttable pu'
zz=:zz,'ttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub''),('
zz=:zz,'<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00'
zz=:zz,'402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUIT'
zz=:zz,'ES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK0040'
zz=:zz,'1 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WAR'
zz=:zz,'NING00400 WORDTESTS addgrp addloadscript addloadscript1 allnames al'
zz=:zz,'lrefs betweenidx createjodtools dayage delgrp firstcomment firstper'
zz=:zz,'iod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obname'
zz=:zz,'s onlycomments pr refnames revonex today todayno updatepublic usedb'
zz=:zz,'y yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK C'
zz=:zz,'WSONLY DOCUMENTMARKS DYADMARK EDTEMP ERR0250 ERR0251 ERR0252 ERR025'
zz=:zz,'3 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterface '
zz=:zz,'MONADMARK NAMEALPHA OK0250 OK0251 OK0252 OK0255 OK0256 PDF PDFREADE'
zz=:zz,'R PDFREADERMAC ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaft chan'
zz=:zz,'getok compclut compj compressj createut ctit de dewhitejcr dewhitej'
zz=:zz,'script disp doc docct2 docfmt2 doctext docword ed et exobrefs gt jo'
zz=:zz,'dfork jodhelp ljust obtext pdfreader qt reb revo rm rtt textform2'' '
zz=:5225{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`-1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+APL&:c]_.@:O(qE$0%,D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN
@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ
67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$
F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u
+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGF
F<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k
+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]Tu
F*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*
$;No?+<VeDDJUF<+<Ve%8PN#B+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlom
Gp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX
6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,
Eb-@@C1_0rATJu7AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R"
;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hV$;EfR;GU7p:dmN.8lJ)T
8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q:ha%15is/g,(AC1Ums+Cf>#
ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=
@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!
@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H
:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhs
Ch[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W
7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA
@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk
-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&
-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:
EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j
:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@
@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=r
A93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA7TUf
:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA92j2
Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"
ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q
@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)
@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'
F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;
An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8Z
A8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(
GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL
+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs
%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL
+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#
Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+DIal+@<6O0F`\a:@<?''FD5T'
F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F%15is/g)8ZCi<`mDIXe3+<VdL
Ci<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeCDdd0sAS*&-+<VeCDdd0!Eb/io
Eb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-E,uHq:-pQU+<YW3@r#Uh@rrh9
+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&F!+m6@UWb^F`7cs:-pQU+<YW3
@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@@:NjX$;No?+<VeGF`__HFCB$*
F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67FFD5T'F*(i-E,uHq:-pQU+<Y]9
F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#Uh@rs./
$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4Eb0<6DfTD3F)YPtAISuA67sB'
+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&AS*&-+<VeJ@<Q3)Eb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IJ`3@N]]"DJ*N'1,(C6
1,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.A92j2Eb-U-$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o%15is/g+\=Eb/a&DfU+GDJsZ8
+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]-
%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(D..O.ATDi$$:Iil8Q\>T4ZY\e
/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=
Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&+FH3m6qL9O9iE/c-8%J8+@K1-
8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/F`&=>@;TRs%15Kp;GKSB3]oJV
?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#C1UmsEt&IE8Q&GU:-CX#4"akp
+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5
DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN+AtWt6V]!X4ZX]J+u(3f3Zpg^
;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7De*]nCLp7-/g)WYDe*]nCLnVu
/M/)d@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._
67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:
Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]Li
H$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\
+Du+?DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is
/g)8ZD..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0
Gmt*U67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE
@;TRc@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL
+E2IFF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeN
DfTA2@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs
+D,Y4D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k
+ECn.B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;
67s`uAT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is
/g,7EB6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K)
.X`ZR$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0
BFP;M;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m
+E(_(ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)
+ED%&F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;
-Qm&BE$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"
EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56
Bl5&8BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A
9LUK[-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1
+EV:*F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng
4ZXr5E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1
Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?
D.7'sARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX
<'a"`$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl
+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!
CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(
ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'
@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\
3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dAF!,C?ASqqa:-pQU
+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!Df0!(Gp%'7FD)*j
:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!+m6E-67F
A8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<Y07
ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+Ap806A9/k9+<Ve;
AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu:-pQU+<Y3/A92j$
FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%D@HqJ67sB'+CoA+
F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"F_t]-F<D]=ATT&5
@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=AKZ&(EbTK7+EV1>
F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1
@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*AS-!++<VdL+D58-
+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/DIIBn+Dbb5FE7lu
:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gmt*U67sB'
+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#ATVK++<Ve;ASbq"
AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9ARloo@<>oe$;No?
+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4AS5Of@rrh9+CfG'
@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9+<VeFE+No0@3B)p
@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is/g)8ZE-686G]7J-
Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688F!)SJ+<VdL+EMXC
Eb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2@;TR,+CfG'@<?4%
DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`IDfTD3-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<+<VdL+EMXCEb-A3
@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'+E2IFGAhM4F!)SJ
+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/@UX'qEb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2DfTD3Ea`iuAKWZa
0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P90G<i+<VdL+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H;cGn@1a!n`+<Ve%
67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO:fBM<2'="a+<XEG
/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO:-pQUD..-r+Co2,
ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^/430":JFYa%13OO
6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4rF)rIBEZf4-@rcK1
FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,C1Ums+Eq78+D,>.
F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$D/aE2ASuTN+EM47
Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr6IF*&OHBl.E(
DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cmDf'H3DIm^-+EV%$
Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h+E1b2BHSlL-tI%&
DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKXH=\4;Afu#$C1Ums
+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(Bl%?'@rH4'Df0-(
FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%8PW;b<Cp.Y;a!/a
8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/rCh4`!Df'H3DIm^-
Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F
%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&@1<Q8:0(=_;cH[Y
3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO:-pQUFE2)4+ED1/BQP@F
FE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY
/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(FDl)6F&#%S.V`m4
FDl)6F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB
$;No?+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5
E%c9TBlmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat
@;TRs+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(
ARfh'+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D
+ED%1Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-
E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Ve;Ble60@<iu6DJX$)AKXT@6m-/SCiCL>+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD
@;BEsCi<`m+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/
G]4cJ+<Y]9FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL
+D58-F!,@/D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+
8l%ht@rH7.ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9
EHPh8F)Q)@ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL
+<VdL+<VdL+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4J
Ed8d@@;]V$+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8
F)Q)@ARlp(AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1Ums
F!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJ
DfTA2AU&01@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE
<(pF;@ps1i+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41
F)tc&ATJtBC2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcm
Eb$;:BPDR"F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!
C2[X*FD5Pd67sB1C2[X*FD5P6@kB8T@3B&uCi!ZmFD5Z2+E(j78l%htF`_>6BlnVCGAhM4F#kFT
G][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu&+EM+9+E(j7
BOPdhGp%6OBl%L*ATJu9BOQ!*F`V+:FD,5.@rHC!%15is/g+b7@qfanFD5<-+E(j78l%htFDi:@
ATDC$Ebuq@@<64*+E(j7B4YslEa`c,F`V+:FDi9o+E2@>B6%EtD.Ra//e&._67r]S:-pQU8T&W]
Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z@rH4'C*4WA+D#e>Eb0*!+Cf>,E,oN2F(oQ1+E(j7
A8,OqBl@ltEd8dODfTB0%15is/g)8ZA7Zl++<VdL+CoM2E$/_4Ec5t@@rGmh+D,Y4D'2GH6m-M]
F*2;@Et&IO67sB'+Co2-E$-8G+<Y3/F)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'%15is/g)8ZA8bs#
+<VdL+D,P4D..N/@rH4$ASuU2+DG^9GAhM4F!+n/A0>E$@s)X"DKKq/$;No?+<Ve<A0<!;+<VdL
ARoLs+E(_(ARfh'+D,Y4D'2GH6k'Ju67sB'+D#X;+<VdL+<Y6+BlkJ>AU&;+$;No?+<Ve>F<D\K
+<VdLB4Z0-FCf]=+E)CE+E(j7ARoLs+EqO;A8c[5%15is/g)8ZEb0E4+<VdL+Dbb5F<GU8@qBP"
Cj@.DAThd/ARlp%@VTIaFE7lu:-pQU+<Y]A+<VdL+<VeIF`&==@:O=rEt&IO67sB'+EDRG+<VdL
+<Y]IDBO%0F`_P<DeF><FCfN8Et&IO67sB'+DPh*BOu"!+<Y-6Dg-86+AbHq+E).6Bl7K)BOu"!
%15is/e&._67sBUDffQ33XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'
0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,!F/KeS8E+NotASuT4GAhM4F!(o!%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4
+CT>4F_t]2%15C";cQO\;b]PU90G<`@<6L4D.RcL-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@<H[*DfQ9o5uglT:JsnQ;G0/6-Xh.>BQ%oP-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@rc-hFCetl$:@][5u^9@9gMZM4ZXs#Eb/[$ARmhL%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt2H!t5+BQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f6s2fD9gMZM4ZXs$H!t5E-OgCl$;No?
+CoD#F_t]-FCB9*Df-\7@<--+AoD]4D/X<#A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15g*:-h9B
5uL?=3[\c_DII':-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4G%G]'@<?4#%16-);F3ZK
8PMoF;G0/6-[''A@UX@mD)s$R$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfC@Dfd+GDfTB0
%16!/:K1Ck;FFGX5uL?=3[\rdDfg2AEb'5P-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<-.)+>"^H
AT23uA9/l3DBNk>BOu3,D..I#Et&IE:IA,V78?fV5uL?S4ZX]O;c?[j78loH;G0);<E)Lb;GBGT
905L=76smA6qosF905OE5t"F5;G0)G:JO2D9gMZM4'"dJ6:"RB9hdoO906$I:K1Ck;FFGX5uL>b
$4R>;67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuTN+DPh*+<`-_.6T:+A7B@pF`2A5
+:SZtF?MZ-?!q2PCiOT9FCd]i8OccQ:(7O>$;No?.V3L.A7]^kDId<rFE7lu              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.3+>P&q+>Pes2BXh8+?(E#1E\Y"1b^%3+>bks2]st6C2[X"@;0U%8l%htA8,OqBl@ltEd8d;
CghC+C2[WnDdm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3
F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u
+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a
:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2Bl@l3De:+?C2[W3                             ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 compjBasic delBasic001 dpsetBasi'
zz=:zz,'c01 globsBasic001 grplitBasic01 putNameTimestampsBasic00 restdBasic'
zz=:zz,'01''),(<(<''jodcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._'
zz=:zz,'1 '' jodsmoketests didSmoke00''),<(<''jodstresstests''),<0$a:          '
zz=:258{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o1E\D-1c9#dA7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPk
F(o,,8l%htFCfN8F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MW
ATMs.De(ON+CT.u+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/
:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z
1+==oC2[X)ATMs)E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@lt
EbT*+3ZrKTAKZ)+F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sC$F`&=GBln#L
%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn:-pQU+<YT5+?MV3C2[WnATf22De'u5
FD5Q4-QjNS%15is/g)8Z1E^^[F<DrGDe*<cF(o-+ATMs7-OgDX67r]S:-pQU@rc-hFCeuD+>PW)
2f<PW1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@:Wn[A0<:<Dffo:AStIYF*)IW0JP"!FDi:CF_Pr/
%15is/g)i,A7]7*1*C"9A7]9o-tI439jqOPDcC:mFE8lRFDi:CF_Pr/+>"^878m/g5tt'B;E[&p
%15is/g)i,A7]7*3?T_\Bk0P=F(o,<0JP"!@:Wn[A.8l@67sB73,`;K0K1+rF`MA6DJ()1DBO.:
Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FGATMs7%15is/g)l'DJs\Q3$<?_A79RkA0>K&
EZdtM6m+093A*-=+EV19FD5W*%15is/g)l(C3=>H2'?UME,ol?AKZ#9DBNY2F*)GF@ruF'DK?6o
%15is/h1CCE+NotASuU2+>"^XATMr9De:+?B4PRmF"&5DDfQtAF_Pr/+D>=pA7]cj$<0Gm<)>kY
9e\:b3\V!M<(0_b=[>bV78c90<(0_b:dIuR0JO[m+<Ve%67sC%ATT&:D]gbWAoD]4@;Ka&D.Rd0
@:s.m%15is/h1FMA7T7jASu$iDKKq/$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''-u*[2FCfN8
ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>+0RGSuDe't<-QjNS+<VdL+<XEG/g+Y?Df]J4@;^?5
DfB9*+Co1rFD5Z2@<-'nEt&I?0RI_K+=D8BF*)/8A2#AR+<XEG/g,(OASrW3FCB&t@<,m$;FNl>
=&MUh73F"#ATMs.De(ON%13OO-oiG31bgF%0d%T667sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5
Bl@l3Df-!k%13OO                                                           ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1E\M4+>GYp1c?I21E\P6+>GYp2)$.-1a"Y0C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7
+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7@rc^5BHVD.F*)IG
/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A8G[pB4Z0rF*)J>@<-!l+D,1nF(o*"
AKZ)+F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W2pF`\a<ARTXo@VfTuA79RgC2[X(D/X3$FCfN8F)u2:
CLnW1ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'6+De*p2Eb0<5FCfN8
F)uGDATMo8FCfN8F!*%WFCfN8F!,[@FD)e5@<-!l+EVNEG%G]>+DbJ,B4W2r@<>o          ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
1E\P#-p0UR/mg=U-Ql!,8l%ihDKKH1Amo1\+A$lO:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et
<)6:`;cZU\+A,Et<_Yt)B4Z1&FE;P4D/^V:F`_&.Cij_G.4cl04?G0&0d%hdA8,RQD/X3$0JFVl
E+EC!ASQ-oA8-+,EbT!*FD5Z2-RgSp4?P\X?SNZN+DPh*+DPh*A8bp"C2[X"@;BEsC2[X(FDl22
+DPh*FDl)6F!,49A9E!.CaUY_-p0UR/mg=U-Qm/BA7AtgBk)6rF*)IGC2[WmEclG:FCfN8F!,49
A8G[pB4Z0rF*)IGC2[X(D/X3$FCfN8F!,49A92j5ATMp7ATMs7-RgSp4?P\X?SNZN+A,Et6<-TN
6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=WhBlF*)>@H"q8.+D>J1FDl2FC2[WnDdso,@;BF@
@<6-m8l%iSATMs7+DkP&AQ*GaCLp+66r[`=FE8RA@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"
DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$<,Vh&.2)$sC1+kI@2_m*E3&WN71,(F?0K1[@/iGLE
1,1UF2DQC10JPF=2_[!>2D[9I0f1jJ1*A>+0f:XD0JY7=1H.'E1GgdB+>PW*2)$sC1+kI@2_m*F
1Gq*61,(F?0K1[D/i5CB1H@3N2)-4/0JPF=2_[!>2Dd3H1G^^C3$9t10f:XD0f:R?0f_3M0ebIB
+>PW*2)$sD2(g^?3B/iM0Jt^11,(F?0K1^D/i5:C3&E?D2)QL30JPF=2_d0B1bh!M2D[*I2BXb/
0f:XD0f:R?0f_3M3&3EL+>PW*2)$sC2D-gC2)@6J3AiN61,(F?0K1[@/iGOB1c$pA2E3-:-p07-
1*eV/0f:XD0KCaC1GCdG1GUsM+>PW*2)$sD2(g^?3A<<N3&*331,(F?0K1[G/i>FA0f1mE0K(%/
0JPF=2_d0B1bh!E2*!WN1FXk'4>J$;,Vh&.2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA1-%*M
2)-4/0JPF=2_[-B1c@0E0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K1Gq*6
1,(F?0K1[D/i5IF0f^sB2`Mp80JPF=2_[-B1c73M3&WNJ3$9t10f:XD0K(O?2)@!J1-%3H+>PW*
2)$sC2D-gE1b^X@0JYR01,(F?0K1[D/i5CC2D[$G1,g=20JPF=2_[-B1c@6G2E3KM2]sk00f:XD
0K(O?2E*?N0ebOG.4cl01*AG"1,(F?0K1[G/i5FE0fUsF2)cX50JPF=2_[6E1c7*H0JYXE3$9t1
0f:XD0KCaB2)I!I1c[QV+>PW*2)$sC3A*-G1H@6K2`3E71,(F?0K1[G/i5FB1,(^B2DZI20JPF=
2_[6E2)@$D2`E]R3$9t10f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH3B9)B1,(F?0K1[G
/i>FC2)7*G2E;m80JPF=2_[6E1c7*F0KCgF1FXk'4>J$>,Vh&.2)$sC1+kI@2_m-E0KCj11,(F?
0K1[@/iGLE1,:[B3B83;0JPF=2_[$?3B/uU3&E?I1E\G,0f:XD0Jb=A3B&iO0ebI?+>PW*2)$sD
0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g70JPF=2_[!>2D[9I0f1mM3$9t10f:XD0JY7=
1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPF=2_d0B1bh!M2DR0G3$9t10f:XD0f:R?0f_3O
1bp1/0JPF=2_d0B1bppC0KD$O3?U(20f:XD0Jb=A3B&iO0ebI?+>PW*2)$sD0J51<0JY==2Dd-2
1,(F?0K1^?/i5:@2)$gC3&Mg60JPF=2_d0B1bh!M1bg^A1a"P-0f:XD0f:R?0f_3M0etF>+>PW*
2)$sD2(g^?3B/iM0fUm:/1<V7.4cl00I\P$4>838-p014/3GT                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
