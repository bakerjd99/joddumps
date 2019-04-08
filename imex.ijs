NB. JOD dictionary dump: 08 Apr 2019 10:41:55
NB. Generated with JOD version; 1.0.0 - dev; 24; 05 Apr 2019 11:10:35
NB. J version: j901/j64/windows/beta-c/commercial/www.jsoftware.com/2019-04-03T11:03:34
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|331658214217135004629326115107284549897|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


MIRRORVMD=:'0.8.5';16;'08 Apr 2019 10:41:43'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


BuildMirror=:3 : 0

NB.*BuildMirror v-- backup/create/load mirror.db
NB.
NB. This verb builds a new version of  the mirror.db SQLite local
NB. and online cross  reference database.  It is  designed to run
NB. from  jconsole.exe.  If  run  from other  J  front  ends  the
NB. smoutput messages may not show until the process completes.
NB.
NB. monad:  BuildMirror iaBackup
NB.
NB.   BuildMirror 0   NB. skip backup and build
NB.   BuildMirror 1   NB. backup and build

smoutput 9!:14 '' NB. display J version

sdr=. MIRRORPATH        NB. mirror directory
mrd=. MIRRORDBPATH      NB. mirror database directory
trg=. mrd,MIRRORDB      NB. mirror db
bak=. mrd,'backup'      NB. mirror backup directory
dmp=. mrd,LOCOXREF      NB. online local pairs
mcf=. mrd,MANLOCOXREF   NB. manual online local corrections
mli=. mrd,LOCOMISS      NB. missing local images report
ssp=. mrd,SUSPECTPAIRS  NB. suspect image pairs report
src=. PRIMARYTHUMBS     NB. thumbsplus db

if. y BackUpMirrorXrefDb mrd;bak do.
  smoutput LoadMirrorXrefDb sdr;src;trg;dmp;mcf;mli;ssp
else.
  smoutput 'no ',MIRRORDB,' build - backup issue(s)!'
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1".+>P&o0d&5/+?:Q"3'qb%Ch-7SEcQ)=@UWb^F`9!DEb/[$AM7k<@:UKtBl\64E_T,';GU1k
9gj/9EcYr5DCcoI@;BEs@rHL-F<G"0A0>DkFCb                                    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q,+>Y,p2]sju1,CdED/"$2DfT2uBleB7Ed;#/A26(Q$>jKtEc5t@/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9T9kEbT>43%Q1-0JPQs$4R=b.NhH"
EcQ)=+E1b2BHV22F`)7C@:Wn[A0>8HF_PZ&9keWgDfT5.FDi:2AKYK$DKBN5FCf?3%144#+EqOA
BHVD1AKYA[BQ\0$F%p@hEc5u++CT.u+CIu_Ch[cu<H)bm@:V`=ARfL`+EM%5BlJ08/e&-s$6pc?
+AH9b@qZu>1FsY(0JPQs$4R=b.Nh&dF(o,,G%G]8Bl@l?+DkP&AKYE!A0>DkFCcS4Dfoq?@:Wn[
A0>u4+CIoXEcQ)==E7tb?nMlq%14=),9T]hEarc*2(Tk*0JPQs$4R=b.Ni,9Bl\64E\:m3?m'K$
CghEsA0>i3DeF*!D0$h.Eb-A2Dg*=6Df'H0AU#>/DJsZ1BFP:k+<Y*1A0>T'E,Tc=@;^00ASuF/
B4rE0D]in.EbTV<@V'Y'ATAo,BleB7Ed8dLEa`HnBl7Q9%144#+:SZ#+<XWsAKYT'Ci"$6Bl7Q+
@q]:gB4Z-,BOQ'q+C\nnDBND"ASrW-@:Wq%%144#+:SZ#+<WBk+@0lfDf0B*DIjr5E,9H$A0>Aq
ARfKuAoD]4A9Dj-Bk(RnAKYT!Ch4`,@;TRs+D>2)+C\nnDBN@uA7]:(%144#+<VdL.TC(m+D,>(
AKYl!D.Oi(F!+m6DIIX0Ea`c,CLqc6AoD]4;f-Yi9m((k@:NecF`);B/h.uCBOr</E,9H$A.8kP
+<VeLFD5Q*FEo!MCM@a/+CoV6Ch[BfFCfM9GA(Q*+Dbt)A8,po+DG_8D]iI2B5)O#DBNS#Ci!['
Gp$R=F:AQ`+<Vdu+D>2,AKZ&*ASrW$F`;/2@psIjF!,[?ASrW3@ps7mBl7Q+Anc'mF!+n$Ec6#?
+CT)&+D5,!Ch7X$ATKI5$4.gt+A$YtF(oK1Ch[KqATJu%D/"$2DfRI@@UL<tEc5H!F)u&5B-:o#
+E).6Bl7K)Anc'm+DtV)ATJu&Eb-A9DJ=*5AM+E!#p:?5@!-F)Ddd0dBOt[h/n/72?m&rmARfLs
+E_X>Ddd0t+D,P4+CoV6Ch[BfFCfMG%13Ca+:SZ#+<WEl+A!\h@<Q3)D/Ws!Anbge+CJ/^F_tT/
9keWgDfRIEC3*c*FDi:3BOt[h+D,P4+EV:.+E2@4F(K6!AKYo'%144#+<VdL@3BZ'F*&OJATDj+
Df-\9Afu2/AKXoK9PJT[+B3#sD.7R*CiseAE,oZ0@<-W9A79Rg@UX=h+CT.u+E_a:+DGp,$4.gt
+DGF1E,oN2ASuTB+CJ/^F_tT/9keWgDfRIEC3*c*BlbD=BOr<)DJXS@F(96)E-*4EBOQ!*D/Ws!
Anbgt%144#+<VdL@3AN_F_tT/+Cno&@:EYdAM,*)BOr<*EbTB!Ed8d<@<>pe@<6!&BlbD8DIjr/
Aftr9+Dl%<F<G[GARTY&Eb/bj$6UH6+<Ve=Bl%@%/g*i!F=2,PDJsV>F(96%G9CUA+E_WH%13OO
+<Vd_/g*_.BOQ'q+CSekARlol+EM76E,9).D.R-nF!,RC+Cf>,D.RU,+E)CE+Dbb0ATJu.DBN>(
@;]n"@rHU4AS*Q:G][=&$6UH6+<Ve+BOr<)FD,6++Dtn+BQPA<Df'&.D..=)@;I&rDfTl0@ruF'
DK?pl+D#G4ATD?m+DG_8D]j.8BlbD/Bl%>i$6UH6+<Ve9Ec5`)+E)./+E(j7D0[7:@;KakEbT*+
/g*r-AKYo3+Dl%;AKYo'+EV:.+Cf>1Eb/a&Bl@m1+CT;%+EqjEDJ(R2$4.gt+AQj!+EV:*F<F-t
@ps6tARTXoCj@.EGA2//BHVD8+CQC3EbTB!Ed8dLATMr9A79Rg@UX=h+CT.u%13Ca+<Y04D/Ej%
F<GLEF<G+&FC?;.Bl7L'+DGp?F(fK7Ch+YtAKYPmF*SmMD]iY+DIal3BOr<)AnGUlA8,po+ED%'
DfTB0/e&-s$6UH61bKnB+CT+0B5_L%B-;;7+EMX5Ec`F@@;BRpB-;8<Eb-A3EbT0#DII?(Anc'm
F!,.)G%De,BkCsgEb0-1+DtV)ATJ:f+<VdL+<Yc>@;[23A7]pqCi=9(A0>JuCh7Z?+s:91Bl\64
E\:m3?m&rtA7Zm&@;0anA0>r3D.Oi.EbT0#DII>j$6UH6+<Ve7C2bq9+CT.u+E)@8ATAo*Bl%@%
+EqOABHV52Ch[cu+DtV)ATKIH<+oiaAKYr#Bl\8;@<,p%GB.V>B+51j+<VdL+CT.u+ED%7F_l.B
Ao_g,+EV:.+E):7B5)6lC`m/(A0>DoG%GK.E+NQ&Anc'mF!,.)G%ki,+EV:.+:SZ#+<VdL+ELt.
AKYl!D.Oi!F`\a:BkCsgEb0-1+D#e>ASuR'Df0VK+A$GnFD,5.Ap&3<Eb-@b+EqO9C^g^o+<VdL
+CT5.ASu$$FD,5.AoDL%Dg,o5B-;8<AnGb%ATJu9D]iJ)C`me/@;[3"Bl%@%/e&.1+<VdL+<V+#
+<VdL+<WBk+CK8#@UL<jCghEpARlp)@ps7r+CK&3+D,FuF<G%(A0>r'@;[3*@;TQuF(8Z3C2bq9
%144#+<VdL1+j\WF(8fi+D,>(D'3n0@;^-/?u:03Anc'u+EM%$DBNh*D.Oi2@qI?.E&(f1$6UH6
+<Vd_/g+PC@q/mh@ps4cEa^)3@ps7r+CK&3+CehsATD3%F(8Wr+DtV)AKZ&(@kMk;Amc&T%144#
+<VdL6tp:JFCAu.Bl.9kAKYT!Ch7Z1@<,p%B4YslEa`d#Gp%!CF<G!7E,ol+Ch7H+@<3Q5BOr:q
$6UH6+<VeE@;TRs+CehsATD4#+CT>4BkM<+FDi:9D..'gF!+n3AKZ&4+D>J"AT)^4+EV:*F<F-a
$6UH6+<Ve8D'3G/EarZk+EVNE@q]:gB4W3-BOtmu+DtV)ATKI5$4R=b%143e$3            ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' MirrorXref BADGALCNTS BackUpMirrorXrefDb BracketOverlaps '
zz=:zz,'BuildMirror CR CreateMirrorXrefDb CreateMirror_sql DumpLocalImageNa'
zz=:zz,'tural IFACEWORDSMirrorXref LF LOCOMISS LOCOXREF LoadAlbum LoadImage'
zz=:zz,'AlbumXr LoadImageKeywordXr LoadLocalPath LoadMirrorXrefDb LoadOnlin'
zz=:zz,'eImage LoadOnlineKeyword LocalFile_sql LocalFrOnline LocalFromDir L'
zz=:zz,'ocalOnlineFile_sql MACROSMirrorXref MANLOCOXREF MIRRORDB MIRRORDBPA'
zz=:zz,'TH MIRRORHEAD MIRRORPATH MIRRORVMD MatchManual MatchOnlineLocal Mat'
zz=:zz,'chOnlineNoBrackets MirrorImageXrTables MissingImagesReport MissingL'
zz=:zz,'ocalFiles_sql PRIMARYTEST PRIMARYTHUMBS ROOTWORDSMirrorXref RealDat'
zz=:zz,'eFrManifest SUSPECTPAIRS SuspiciousPairReport UpdateLocalPresent Up'
zz=:zz,'dateLocalPresent_sql afterlaststr afterstr alltrim allwhitetrim ass'
zz=:zz,'ert b36casemask b36fd beforelaststr beforestr boxopen changestr cha'
zz=:zz,'rsub ctl fboxname ferase fexist insqltd justext justfile ofreq pars'
zz=:zz,'etd portchars quote read readtd2 reb smoutput tlf toCRLF toHOST toJ'
zz=:zz,' tolower tslash2 write writetd2 yyyymondd''                         '
zz=:980{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`2.2`=BEEcQ)==E7tb%15is/h0S0EcQ)==E7tb+EK+d+CfG'@<?''@;]TuCi<`m
+EMO=Blmo/D/"$2DfQt1Ec6#?+ED%*ATD@"@q?cn@<>pe@<6!4%15is/e&._67sC(ATD6gFD5SQ
%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(f+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<X!nBl%<SBl\64EZcqV@UWb^F`9!DEb/[$
AM7k<@:UKtBl\64EX`@N67r]S:-pQU@rc-hFCeuD+>PW*3,3SR0K'@I:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/(S$;No?+>GijF`&lk+D5_5F`8I5CghC++CfG'@<?'k%15is/g)l.C3=DL1E^OCBl5%A
6?R!YA5-cYEc5tI+CSekARl5W:-pQU0fWojDDF*mF(8lpD.+Q!Bl7?qBmO?$+CT.u+=KX#D/`0e
@ps1FD..'g:186eEa`c5+CSekARl5W:-pQU0fWojCb[Ud-r"DsF(oN)9Q+ELCdr,TATM4"EGR'H
@:Wn[A.8l@67sB83,3SP0esk"9jr-RBMWM^Bl7KWDaJJQ@r#XtF"&5?A7T7^%15is/g)l.C3=>I
2]sMCBle?0DJ)OX@:s.m;IsfcEc``Q@:Wn[A.8l@67sB83+QT10JO[u:gnBUDKJ?dCh.*tF"AG*
D..'gF%g"`FB*9j@<?'k/0I`+Ch[cu8SqmKAOCBYDKIEP=(Pi@EbQsF@:Wn[A0>u4+=KNl@WcN:
+EV%$Ch4%_:-pQU0fW]T@k]_^-r4_sBl7KLEb/[$AOKsKALSa1A7T7^+EVNE-p_ZYF_rQMFCAWp
AISuA67sB83G)i30f^@);g!/#Bk(jqF`UAfBl[*_E,Tc=.3N&0A7]9\$;No?+>GlbE,mWl+Co2-
E,8s.+A*c"ATDj+Df-[L+A*b:/hf"&BOPs)Bl7F!D/`p*Bjtmi+DbJ(B6@WqAKYJr@;]^hEt&Hc
$?B]tF_Pl-+=C].FC?hDEGT?2AL@oo%16T`@r,RpF!)i)Bl\64E`d?nAg\]1$4R>;67s`uAT23u
A7]Y#Et&IO67sB/.OdMA+@C0\@<?'TBl\64EaNm-C`lDi@ps1CBl%?fF)c"=<H)JWFCe-a@ps1M
Eb0<'DKK6,EGQakDe!3l:Msu_DIl:OCh6spEGQ'k:-pQU-n6Z/3Zq.2F)u&5B2!5R@;JDICh7Zp
F)c"*$;No?.V3L.A7]^kDId<rFE7lu%15is/g,4FBOu$h+E(j7D/"$2DfRI@@N]2iFCAWeF(HIG
+E1b0F(Jl)Df-[F4!u.\BOPpi@ru:&%15ICART[l9keWgDfT3+EGRd!+=Jod3Zp+*%16TcART[l
+EV%$Ch4__De!3l:gnHZ%144#-qnPh@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<C`m\;Bl.:!Gp$m6
Gq9C3+<Ve#De!3l:gnHZ+EV1>F<GI>F<GIDChtO^%13OO@rc-hFCcS:@:F%a+AZlkBl7KTAU/K<
Eb#Ud+<W(*AU/K<Eb$;7AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<X<gGt)gcEHPi1@sK22
DKKH&ATAo2Dfd+>F_kkC3t2N>+<V+#@rc-hFCcS:@:F%a+@0gQF_qQp+<W'uCgqO(94`AkFCf]=
+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve#De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kkF%144#
+A?]`@;Jb\ATMF#F<G:8FCf)rEZek*ARfL(9Q+ELCf#.`F(K624ZtJADfQsoDe!3l:i^,gASuTQ
4Y\B:%144#+AZlkBl7KRD..'g6Z7*bF<G:8FCf)rE\%Y,+<Ve&DJX$)AOCKL@<?'K@<?''A79Rk
/.Dq/+<X?dF*(E$A79RkA0>DkFCd!4$6UH68SqmKATLORF*(E$A79RkA0>DkFCd!4$6UH66#:"Q
D,+MVAKZ)+G]YJG$6UH6:gnBUDKJ?dCh.*tF!,R9G]YJG$6UH6=(Pi@EbQY<AU&;J%144#+@0gQ
F_sNXF(96)E-,f4DBO%4G]YJG$6UH6AoD^$BkM<+CLqc>9Q+ELCf"P^BLtT@+ED%*ATD@"@qB^(
9Q+ELCh6FOFD*'rDe!3l:gnHZ8OP!V3t2N+$=e*f@<?''FCAWpAKXcdCh[cu8SqmKAISth+=Kfu
@:s.EAU,D?AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<XHtCh[cu8SqmKAO^BMAKZ)+G]YJG
$6UH66#pIKBm+&u9ggi]FCf]=/.Dq/+<Wsj@q]S"ARn_RH=\45DKKH&ATB=2$6UH69OW$WFEM,*
+D,G.@<=%0$6UH69Q+f]BlnK.AKYT$Ddd`=%144#+@0gcBlnK.AKY])FCf)rE\%Y,+<Ve&EbT0#
DII?PASGdjF<G:8FCf)rE\%Y,+<Ve&EbT0#DII?_Bk2=!+DG_8AS5Rp/.Dq/+<XQn@;J>?FCcS*
@<?'3%144#+B<AsDdd0E@<?''A79Rk/.Dq/+<X?dF*(E$A79RkA0>DkFCd!4$6UH6<H;drFCf]=
/.Dq/+<XWsF_tT*@;0OXEblk?AU&;J%144#+A69kGAhM4F!,R9G]YJG$6UH66XaqUBl@l3FCf]=
.6@tG%16TcART[l+EV%$Ch4_\D..'g6#:"QD-1ff$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDChtX3
$6UH66#:"QD+eGc+EV1>F<GI>F<GIDChtXF%144#+E2@8D..I1+DYP6-qS8aB4X_IGq:((CgqO(
94`At/.Dq/+<Y97Eb/rtDBN_+Gpksp@WcN\AU,^IEb/ioEb0,uATJt[CgqO(-p_ZYF_sc_Gpt9R
$6UH6AoD^$BkM<+CLqc>8SqmKAP6T[.3NYBAn?!oDI[7!+AZlkBl7KRD..'g-qS8aB4X_IGpt1(
%13OO@rc-hFCcS:@:F%a+A$EYB4X_IH$=1IA6<j]$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDChtX3
$6UH694`BmDfTA2FCf]=+Du+>+Du=<Cb-#&+<VeGEbTB!Ed8dCAU,[qD..'g94`B"+A69kGAhM4
.4bo8+<Ve=DfTE'B5Si-AU,[sAU/K<Eb$UAEb/ioEb0,uATJtiDJX$)AP6T[GAhM4-qe,sGAhM4
.4bo8+<Ve=DfTE'B5Si-AU,[qD..'g94`At+ED%*ATD@"@qB^(:Msu_DIlCV@:s."8SqmKAP6T[
.4I=f$4R>PEb/[$AKZ)'@VfTu9Q+ELCe8JPB4VMZ+<W(+De!3l8SqmKAP#94Bl8$(B4Z*+DJsV>
DKTc3+E2@8D..I1+DYP6+CTD7DeX*!Eb0*!DKIE=$6UH69Q+ELCfG(jD.6()+DG_8AS5Rp+Du+>
+Du=<Cb-#&+<Ve#De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`@;JMP@:s.@Bl%?'
FCf]=+Du+>+Du=<Cb-#&+<VduD..'g94`AkFCf]=+Du+>+Du=<Cb-#&+<Ve=DfTE'B5Si-AU,[t
De!3l:gnHZ8OP!MEb/ioEb0,uATJtfDe!3lAPcfWBIHPm@ps1M@<?0S6n'Yr$6UH6AoD^$BkM<+
CLqc>8SqmKAP6T[.3NYBAn?!oDI[7!+AZlkBl7KRD..'g-qS8aB4X_IGpt1(%14Nn$4R>;67sBU
:K0bD+EV:.+DN$?EGT?2AKYDlA8c?.BlbD/F`VVL+CS_tF`\a>Dg*=FEGQb3F!,(5Ec#6,FCeu8
%15is/g+&7DJj0+B-;8;@;]UaEb$;6EGQb:Eb0?7Gp%'HBl8$(EcW@AEZf(6A7]Y#Bl7Q+F)c"=
Bl5&=Dfp(0$;No?+D,&*DfTQ6AKZ&9H#.%7BlbD5Bkq9rGp%3I+E2@>A9DBn+Cf>#AKZ).@<<W&
De4!--ZgJTDfTVG%15is/g+,)F*&OMDfp(CF)c"=Ao_<mD.RU,F!,RC+CTG3Bk/?.BPDN1,'7O/
CLqd#Df6dC%15dI@ps1CBl%?fF)c"Z3Zoh)+?CW!.1HW*ASbpfF<D]7/kKngB4X_IGq:(6DJX$)
AP$`IB4XPHCh5.?9Q+ELCf"P^BHUo-Df$UmDJX$)AP$`IB4W2o%16feDImi2C2[g(+A$EYB4XAF
@WcNiEZeg6Df-\+/kKngB4X_IGp#6m@P15h@:s.EAU+^lBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA
6#:"QD+eGc+?^iV/jX;_F_sc_Gmt*pDJj$++DPh/DBMVk@ps1M@<?0*A0>f.+Cm)uDe!3l:gnHZ
8OO[a+Cd#tDe!3l:gnHZ8OO[1$?p/pEb-A'/jX;_F_sc_Gp#6m57Is<Eb&a%+C]U=:Msu_DIlCV
@:s.@Bl%>i$7QDk%16*SA79Rk9Q+ELCf#.`F(K62?ZU4'4ZX]5F`:l"FCcR\CgqO(+EM+9+A?]`
@;Jb\ATMF#F<E^h0d([RATD?)6#:"QD+eGc+DG^9-OgCl$;>AJ@;J_WCh[cu7VQ[M?ZU4'4ZX]6
0H`D!0I[G<F(K0!@rrhkARTCC@<?'3+Cd#qD..'g94`B"+A?]`@;JnVF_tSZ6nBHi/kg1n@;JbK
FD+66/0IW)@ps1M@<?06+A?]`@;JMP@:s.@Bl%?3+AZlkBl7KRD..'g7VQ[M+D,Y4D'2Mj@ps1F
D..'g+CQB%$>FBqATAo.DeX)39Q+ELCf"P^BHUb,Df-\,/kg1n@;JbKFD+66+?^iU/kg1n@;JbK
FD+66+:SZlDJj$++DPh/DBM_mCh[cu8SqmKAKYJ*Df-\-/kKngB4X_IGp#6m@4k,g@:s.EAU,C-
$?'rqATAo&Gp$!r@;J>?FCbmg.1HUn$;G5UF(oN)9Q+ELCdr,TATM4"EGRd!+=Jod3Zp+*%17/f
Ch7*u+Cf>4DKI9].3N&?+AHQkF(oN)6Z-us+Cd#iCgqO(:18!N/0JSGDfp#+@rH6p@<<nnDJX$)
AP$`IB4XPHCh5.?-[[9j+CT=6:2`gE@ps1CBl%?'Ao_g,+AZlkBl7KRD..'g+CP]dBl7g"EZf+8
Bl5%bD..'g6#:"QD-1g$@N]T,+CZrpD..'g94`Ak4Wn/c8SqmKAP6T[%16feDImi2C2[g(+@0gQ
F_r72+E)-?@kL&`@WcN\AU,C]+CZrhCgqO(94`AX$?p/pEb-A%/kKngB4X_IGp%!CF<G:8+=M;B
Ch7*u+A$EYB4X_IGp$^>Df$UjDe!3l8SqmKALS&qB6%p5E$/V8+Cd#iCgqO(:18!N%17#oA7]d(
@X0(jBle?0DJ)=SF<G"5@grbo                                                 ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`uBl%<SBl\64EZe(J;Gp:g<_Yt0.4cl00I/>$/1<V34=<j;EcQ)==E7tb
-RgSp4>8$7.4cl0/3G:sBl\64EaNKoF*)>@H!bE!-RgSp4>J$7,Vh&.3A<9D3%d$D0JtjG2E*K9
1,(FC0JbIC/iGL@2_d-C3Ar!80JPRA1b^mA1c%'E0JP:A+>PW*3A<9D3%d$E2)[9F1cRBB/1<V7
,VUYu-p07=0f^pE0K:[A1GL[B2)d3H.pk%c0f^pE0K(O?1GL[B2)d3H.VULi+>PAs-p01/0I\P$
4>JTF3A<9D3%d$E1,:RC3&39??SX;i3A<9D2D-gC1,:RC3&39>BeD+_1+=b&4>838-p014/1<V8
.4cl00I\P80`                                                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
