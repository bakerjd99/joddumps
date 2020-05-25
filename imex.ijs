NB. JOD dictionary dump: 24 May 2020 12:39:19
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


THISPANDOC=:'pandoc'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


formifacetex=:3 : 0

NB.*formifacetex v-- formats hyperlinked and highlighted interface words.
NB.
NB. monad:  cl =. formifacetex blclIwords

NB. jod refs !(*)=. get
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

markdfrwords=:3 : 0

NB.*markdfrwords v-- markdown text from word list.
NB.
NB. This verb takes a  blcl of JOD word names and returns a UTF-8
NB. encoded cl of  word source  code in markdown format. Markdown
NB. is  a simple but versatile  text markup format that is almost
NB. ideal for documenting program source code, see:
NB.
NB. http://daringfireball.net/projects/markdown/
NB.
NB. monad:  clMarkdown =. markdfrwords blclWords
NB.
NB.   markdfrwords ;:'go ahead mark us up'
NB.
NB.   NB. markdown text from JOD group words
NB.   mtxt=. markdfrwords }. grp 'jod'

NB. require 'jod' !(*)=. WORD_ajod_ NVTABLE_ajod_ badrc_ajod_ get wttext__MK__JODobj
if. badrc_ajod_ src=. (WORD_ajod_,NVTABLE_ajod_) get y do. src return. end.

NB. commented source code (name,source) table.
if. badrc_ajod_ src=. 0 0 1 wttext__MK__JODobj >1{src do. src
else.
  src=. markgassign&.> {:"1 >1{src
  NB. similar to (markdj) but faster here
  utf8 ; (<LF,MARKDOWNHEAD,LF) ,&.> src ,&.> <LF,MARKDOWNTAIL,LF
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GL".+>Y,p3?U("2`EE51,0n,+>l,90H`),+>P'"2E=`46r.0)De*ZuFCfK$FCefrA26(Q$=IUe
A8Gt%ATD4$ARHW[:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dm
A0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$FCei4%13OO?tsUjCh\!&Eaa'$?m'0)+CQBb01o#.+Cf4r
F)rI:Ec6)>+EV:*F<GOCDg#i*ATJ:f>AS"qATD4$AKYr4DeF*!D/F!)B3cp!FEDI_0/%-UFCfK$
FCfE3DeF*!D/F!)B.d\4D(fU@A7^!<BQS*-.3N\SE,]`9F:ARhDfQsm+Cf>#AKZ&9DfTE"+DG^9
8l%htA8,OqBl@ltEbT*+/e&-s$<1\QF!,"3@s)X"DKI"CEa`HnF!,F5DIdI!B-:W#A0>B#DKBN&
ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$<1\M+C\c#AKWce+Cei$AKY])F(K61Bln'4
AKXKC8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/g*`-+E_R9EHPi/
Gmt*s@:EeaF!,%&@q[!,@<63,@;]TuD..3kF!,1=+E27?F(o*"AKYK$D/a3*AKYMpFCAm"ARlon
BOPdkAKYZ#F*)>@Bk;>p$=\9'FE2;9Ch[d"+E)F7EZfI;AKZ/-EcYr5DBNV,F*)>@Gp%$;+EV:2
F!,(/Ch54.$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dNEbB-*1NmhK@V9j>BkVI.1N5<23-8b>
5%#L)DKBB0F<GO2B4W3'F_tT!EZfC6An?!oDI[7!+DG^98T&W]Eb8`iAKXo_@ruF'DK@EQ6ZR*d
F!,L7An?!oDI[BuB-:o+%144#+CJr&A8Gt%ATD4$ARHWkDe!p,ASuU2+EM47F_kS2GAhM;+C]82
BHV52Ch[cu+CT.u+DG^9E+*]sEZet4Ebus/$4R>M>@h\_/TboADd?`[$>OKiCh\!&Eaa'$?Z1+%
ATqL'AU#sc,p7;CBlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*Zu
FCfK$FCfkC:Ng;iG%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5
BlJ/:FD,*)+D58'ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[
Eaa'$?Z:%(B6%EtD/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;8l%htA8,Oq
Bl@ltEd8d?Ec6)>F"Rn/%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);
D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=
DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>HW>-$DJ(),De*Zu
FCfK$FCcS4DffQ"Df9E>/e&.mBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I="t8Bl7Q+
C2[X!Blmp,@<?'':ddd$/e&.mASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL5W1AU&<=FF.b@
A8Gt%ATD4$AUP[mDKKH1Amo1\I16Mm$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*
I9Ttd$=%7iE+O'+Bl7^5<(KSZ:dIiE:IBPW>Y]3XD..6[Dej]!84c`V5u'gD6QdKo+<VeTI9]-X
D/Ej%FB!0oHY.D:C`m\*DIdZq+E1b2BHVXRI3<ZRAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?12
%16?RH#R>8Ch[d&HY7A<Ch\!>HX'<aEc#6$<,ZQ!B6%s-BlkI?+<VdL+<VdLI=5?fDf'?&DKJir
CO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".N$=%7iE+O'+Bl7^5BkCd`ATMEmFD5Z2I=#3oDfT]'
CfG=gHYI)#@qB^m@ruF'DBL&E+FSZC6Z6gYASuThDej]6DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1
+EMXFBl7R3%16?RH#R>8Ch[d&HZNb?C2[X!Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*ZuFCfK$
FCcR;I=5?fDf'?&DKJirCO:#@AT2'uAKYT'EZf=ADe!@"F(oN)I16NgASu%*882^MCh[NqFD5W*
I16NgASu%*;eTTMARp2u$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC@;]Tu8l%j'
%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=@:F.tF<G[=AKXSf
@rGmh+CT.u%16Wa@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]23XlE*$=%%OB5)71
ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@ARlotDBMPI6m-#S
@ruF'DIIR"ATKI5$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,ASuT4Ao_<mD.RU,
F!+n3AKYPuFD,6+3XlE=+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(GA\O9Ec6)>+D>=p
A7]e&3Zq[NATD7-1*AS"A8-+(+=CfBDfp#:@;TR'HjpE*+C&W&ASiPp9OUn3=BltiF_56"G\(D.
D.-ppDf[r^>]s\!@XL!TA8-+(+=CfBDfp#:@;TR'/14eCG%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'
H=_L6$4R=g+C&W&AShk`,p4<Q:2b#%8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"A
BOtU_ATD$fDf9`8DffQ;<+oue%14C(+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(
@rH3qF!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--pA.8kl+<VeNBln#2E-#T5A8a&=@;]Uo@j#;n
Ch[a#FCfK6/g*T+ATE'<BPD?s+DG^9@s)g.Gp$@6AU&<=FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5
Ci"$6F!,F1DIdZq+EMIDEarZ'@rGmh+D>J%BP_BqBQRs+B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%
FEDVOC2[X!Blmp,@<?(/-Z^DDART+\EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--p
A0>]&CLmq^,p4<QFD,B0/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-fi67tA_IXZ`p+F>4`CghEs
GT^mHD.7's9PJBUF!,OG@<-HZEc5eX+u(8aI16N0+AP6U5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#
I16NgASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$
AUSt9$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'
ATDj+Df0V=De9Fc8hO@\Df9`8DffQ;>]aP%FEDVOC2[X!Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9
/hf"&@;]Tu@V'h'DIbAJ%13OO<,Wn%F(HJ!FCf]=FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XlE*
$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+A$HlFCB!%+A,Et/e&.1+C&T#AS-:&FEDJC
3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA:8es:IKURBlbD*+A*(M
+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABFP:k+C&T#AS-:&FEDJC3\N-rDe*E3
C3+<*FE_/6AM.J2D(g*ICM>Fu@:O._DLHkN@:O._DLF,H$=%:eAShk`+<X6nF*(i,C`l>G6rQl]
;F<l*%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q
05>E9F)Q2A@qC(88l%iR:K::[7=>UP+<YB>+CT)-D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4
+C'#"G]\%LHZ3D'D..=1/g*`-+Cf>-FCAm$F!,R<AKXT@6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9
ARlp*D]iM3Bl%<&8l%i-+A,Et;bpCk6U`,+CiaM;@rH7,@;0V#%144#>]aP%FEDVOC2[X!Blmp,
@<?'5I16NgBlmp'%144#8T&Tk@;Ka&@3B'&EcP`/F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*
@;]Uo@kM\?B.n[[E+*WpDe"2J%144#>]aP%FEDVOE+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>
0eP2/+CT.u+C\o-Df0).%144#F*2G@DfTr@+A*btH#@_4GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:
EcYr5DK?q@AT;j,Eb/c(D/Ws!Anba`FD5Z2/g+,,AISth+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FB
Dg#i*AKYi.Eb-A-DJ!g-D..O#Df.TF$6UH6+<Ve3@V'1dDL5r4F_t]1@<?(/%13Ca+C&W&ASiPp
BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@
C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07A1ADfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-Q
FD5W*I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC
0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VNHVe-gA8bs#@UX=h
A0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[
Eaa'$+A,EtI4bs9#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp+@:3bCh+YnFCf]=FEDkEDe*Zu
FCfK$FCd(Q+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5F`8rU8l%ha$6UI.@;BFq+A*bt
@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO%13OO>[h8W
Bl89@ATD6gFD5T?%17,eEHPu9AKW@5ASu("@;IT3De(4)$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<
+BosE+E(d5-RT?1D/=89-YdR1Ch\!&Eaa'$-OgDfASu%*G%G]'@<?4#I16NgBlmp'%144#:N0l_
+EV:.+A,Et+Co1rFD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,
ASuTB%13OO>[h8WBl89@ATD6gFD5T?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<X?r@:UKcFCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1
@;BRpB-:H$AU&<=FF.b@A8Gt%ATD4$AUP\8F<G(%DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1b
EbTK7/e&-s$=%%OB5)71G%G]'@<?4#I16O"Ddd0!-YdR1Ch\!&Eaa'$-OgDfASu%*G%G]'@<?4#
I16NgBlmp'%144#;e:%n@3Bc4EbfB,B-:`!Eb/a&DfU+U+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<06
DImisFCfM&$6UHr9OUn3=FOjrCh7Z?+@0g[+EM[8BHUo$Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;s
Bl[cpFDl2F+EML5@qfOhARlomGmt*'+C'#"G]\%LHZNb?C2[X!Blmp,@<?'5I16Mm$=%%OB5)71
G%G]'@<?4#I16O)ATV[*A8Gt%ATD4$AKW?J+<XEG/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2
+CoD#F_t]-F<G+.Eb/a&DfU+4$4R>`ATV[*A8Gt%ATD4$AKW@13a?c<D/^jF+<VdL+<VdL+AP6U
+EqO;A8c[5%17/fFD>`)Ch\!&Eaa'$+=AgUDf'&=C2[d'06CcBE$lbN:-pQUCh[d0GRY!bASu%*
G%G]'@<?4#I16NgBlmp'%144#;KZk">]aP%FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73
F<G[D+CoD#F_t]-F=n\@FCf]=FEDkBEc>i/FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9
FD,5.GAhM;Bl7Q+A8-'q@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.
B6%p5E$0%,D.P=/$4R>I@V'1dDL6P<EaiI!Bl/8-$>4BuCh[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">
CLqQ0C2[X!Blmp,@<?'5FCf\>%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHkF(HJ!9OUn3=FP@1
+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU+:SYe$6UHW+C\c$
@qZuiFCf]=FEDk=@<?o?F(96)E-*4:F!,[IBlnH.DBO%>+EV:.+C'#"G]\%LHZNb?C2[X!Blmp,
@<?(/%144#A8-'q@ruX0Gp%3B@<<W5BQ&*9+EV:.+EM+6F_,H#AKYo'+C%TK<+T0:+Cf>,E+s,s
FD5Z2+Cf>,D..<mF"Rn/+<V+#+<X-fCh7Ys$6UI.@<iu)AKYr4De!@"F(Jl)GA2/4+C'#"G]\%L
HZ3M-CghEsG^V+c>]aP%FEDVOG\(]"FCf]F+E)90$6UHrFCf]=FEDkGF^])pFCf]F/g+;8F`JU7
BQ%TpAKZ22Cht5'AKYMt@ru.$ARlomGp%3BAKYr4ATMF#@q?d$Ado(i+B<;n@rGmh+Cf(nEa`I"
ATDiE+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYr4ARTFbCh4`$Bl%>i$6UHrFCf]=FEDk%:IIlj
FCfK$FCe9hARTFbCh55@AU&VGBl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/e&.mASu%*ASuX-ATD4$
AUP!p%16'JATD?)@<,p%F)Po,+C%TK<+T0\F(KH8Bl7R)+F.mJ+DkP4+Eq73F<G[D+CSeqF`VXW
%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#7:^+S+C'#"G]\%LHV.(%9PJT[Eaa'$
:i^,UD.7<m/p(ZLI3<WM+Cf(nDJ*N'FD,5.DKTf*ATAo3Aftf*A7]up$6UI$DesQ5DK@EQ<+ohc
A7]@]F_l.BBlbD/Dfp(C@Wcc8FD,B0+DkP4+ED%7F_l.BBl5&0Df021DIIBnF!,LGDJj0+B+51j
+EVO7ATVTsE\8J6D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='+Cf>+F_u#;+Cf(nDJ*NA%13OO
>[h8WBl89@ATD6gFD5T?%16?LAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'@;TS(
>n%-GASu%*G%G]'@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+Eqj7E-!.<Df021
F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;Ci!Zn+C]U=>]aP%FEDVO=&M=\
9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/+<X$b@;]^h+EV:2F!,X7Cis;3
BkAK5Dfm14BOPdkAKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!+Dbb0ATJu&Eb,[e+<YWDARf:_
A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig*n+<XoTCh7X/
<,ZQ!>]aP%FEDVO4t\HOI=3^W$=%.[A:%m*F_t]1@<?(/%17&pC2.ZtCh\!&Eaa'$1,2Nj/h1g\
C2.ZtCh\!&Eaa'$+EK+d+DPh*Ch\!&Eaa'$+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+AH9i+>PW+0F\@a67sB4/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p+DPh*
+E_d?Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-
Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l\De*KfBkhQs?Tg"a-YdR1Ch\!&Eaa'$-OgCl$;No?+Dbt)
A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@Ec>N)@<6L4
FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-+FPjbB6%r6
-Y-e4BPDR"C3*m*BlJ/A%14IsC2[W1+D58-Ed/]g3[\NPEZf(.@j`B.$4R>;67sC"F`]9]Eb/i*
/KebFF(KB6F!,=<A8,XiARlouDe*ZuFCfK$FCcS=DfTB0+DG^9DdmHm@rri0De!3lAISuA67sBK
:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$;No?+EMC<F`_SFF<GOC+=DMb:4@U=%15is
/g+_G@<6!&-[U;;IXNRQ$;No?+=JUG-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgDX67sB0%13OO
:-pQUF(KG9C2[X!Blmp,@<?''F`V,7+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,
AISufD/XQ=E-67F-ZsKAE_BthF!,L7F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrG
De*ZuFCfK$FCeHnATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/n
Dfp/@F`\`RC2[X!Blmp,@<?''E,ol3ARfg)F(KH9E$-_TE-67FB6%p5E$/k9+=A^TDe*KfBkhQs
?O[>                                                                      ~>
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
1E\P#-p0UR/mg=U-QlAZ8Q/GO:..lF+D,P4D/!Tj@qBanGT^j3Ebf2tEd)GBA90+I/1<V7,VUYu
-p0%C-YdR1Ch\!&Eaa'$-RgSp4>8$7.4cl04?G0&0d%hd<)5nX?YXLiCh\!&Eaa'$?Ys<rC2[X!
Blmp,@<?'fDg#i+G@,H'GT^sGC2.ZtCh\!&Eaa'$-RgSp4>J$8,Vh&/0JG@>1bLRB2`3NO3B/i<
1,(I;0JtUB/i5OI3&WQH2`Dj70JY=92)7!@1H.$K2)R9P1E\G,1,(C>1,LU>2E*KP2*!WQ+>PW+
0JG@>1bLUE3&ifP0K1p51,(I;0JtUB/i,F@3AiZP3AW*8-p01/0I\P$4>JTG0JG@>1G1RD0JPRJ
1,Lp??SX;j0JG@>0eP@B0JPRJ1,Lp>BeD+_1+=b&4>8$7.4cl01*A@u1,(I;0JtUB/i>=?1H%*G
2`W!90JY=92)7!@1bpdC3&<HQ1E\G,1,(C>1,LU@0f:sH2`3TP+>PW+0JG@>1bLX>2DR-K2`3E7
1,(I;0JtUB/i>C@0JtaC3AM^40JY=92)7!@2)-sK1,h'N1ast(4>838-p014/1<V8.4cl00I\P8
0E                                                                        ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
