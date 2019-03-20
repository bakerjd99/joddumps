NB. JOD dictionary dump: 20 Mar 2019 14:26:38
NB. Generated with JOD version; 1.0.0 - dev; 12; 19 Mar 2019 10:47:38
NB. J version: j807/j64/windows/release-d/commercial/www.jsoftware.com/2019-03-18T13:21:35
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


CHECKVMD=:'0.9.0';2;'20 Mar 2019 14:24:49'

IFACEWORDSMirrorXref=:<;._1 ' BuildMirror LocalFromDir'

MIRRORVMD=:'0.9.0';13;'20 Mar 2019 13:55:20'

ONLINEUPLOADPATH=:'c:/pictures/00 online upload'

ROOTWORDSMirrorXref=:<;._1 ' BuildMirror CreateMirror_sql IFACEWORDSMirrorXref LocalFile_sql LocalFromDir LocalOnlineFile_sql MACROSMirrorXref MIRRORVMD MissingLocalFiles_sql ROOTWORDSMirrorXref UpdateLocalPresent_sql'

ROOTWORDSOnlineUploadCheck=:<;._1 ' CHECKVMD IFACEWORDSOnlineUploadCheck MIRRORPATH OnlineUploadCheck ROOTWORDSOnlineUploadCheck'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


BuildMirror=:3 : 0

NB.*BuildMirror v-- backup/create/load mirror.db
NB.
NB. monad:  BuildMirror iaBackup
NB.
NB.   BuildMirror 0   NB. skip backup and build
NB.   BuildMirror 1   NB. backup and build

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

LocalFromDir=:3 : 0

NB.*LocalFromDir  v--  local  files with directory match (y)  and
NB. file match (x).
NB.
NB. A  utility  for browsing  local  files.  Used  from resolving
NB. mismatches.
NB.
NB. monad:  btcl =. LocalFromDir clPathPat
NB.
NB.   LocalFromDir 'Petroglyph'
NB.
NB. dyad:  btcl =. clFilePat LocalFromDir clPathPat
NB.
NB.   'hand' LocalFromDir 'Petroglyph'

'' LocalFromDir y
:
if. #x do. d=. ' and a.name like ''%',x,'%''' else. d=. '' end.
sql=. 'select * from Thumbnail a inner join Path b on a.idPath=b.idPath where b.name like ''%', y ,'%''',d
db=. sqlopen_psqlite_ PRIMARYTEST
r=. sqldict__db sql
sqlclose__db ''
'path name'=. (1 {"1 r) #~ (0 {"1 r) = <'name'
name ,. path
)

OnlineUploadCheck=:3 : 0

NB.*OnlineUploadCheck v-- checks files in upload directory for duplicates,
NB.
NB. monad:  OnlineUploadCheck uuIgnore

smoutput 'Checking image files in (',ONLINEUPLOADPATH,') for duplicates.'
if. #dups=. uploaddupcheck ONLINEUPLOADPATH do.
  msg=. '*  WARNING duplicate file names - rename following!  *'
  smoutput '*' ,~ '*' ,: msg
  smoutput 80 list dups
else.
  smoutput '**** No duplicate upload file names detected. ***'
end.
)

uploaddupcheck=:3 : 0

NB.*uploaddupcheck v-- check online upload files for duplicates.
NB.
NB. monad:  blcl =. uploaddupcheck clPath
NB.
NB.   uploaddupcheck ONLINEUPLOADPATH

uf=. 0 {"1 ] 1!:0 <(tslash2 y),'*.*'

NB. load 'data/sqlite' !(*)=. sqlclose__db sqldict__db sqlopen_psqlite_
db=. sqlopen_psqlite_ MIRRORDBPATH,MIRRORDB
d=. sqldict__db 'select OnlineImageFile from OnlineImage'

NB. !(*)=. OnlineImageFile
(0 {"1 d)=. 1 {"1 d
sqlclose__db ''

NB. unique common file names
/:~ uf intersect OnlineImageFile
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1cZ[<+>P&o0d&5/+?1K#0d&5*+>bnt0esk/2'=n%1G^..2]sq:+>Gl!1H6L31a"V/6?R!YA5-cY
Ec5u-@:O(qE%b^AART[l05PQ8A0>`'EcQ)=6V'X593+bT:Msu_DIlgeCi<`m6YL%@CERe3EcYr5
DCco>F_PZ&+CT.u+Cno&AP#?W6Ub'P;FFGXBl\64E`d?nAnc.)ATDBk@q?d,DfTB0+=KfN5sn(B
:JsSZ9keWgDfSs#AS*A6B6%p5E(k1[@;JDRDf%mVEboZ(@;I&uBl%@%+EqOABHUi"Eb/a&DfU+G
D..NrBHS^K.3N&:A0>JuCh4`+@<?!m+=MI`9hA5\:Jt4f6qqB9Ec5u#Eb/i*G%G]8Bl@l?+DkP&
AKYE!A0>DkFCe6cCh[cu<H)bm@:V`=ARfLcBOt[hF!,(/Ch7Z1Bl5&9E,9H$A0>DsEb/a&DfU+G
AoD]4A9Dj-Bk(RnATKD#:JXqk:JsSZ9keWgDfSs#AS,t$Dfd+GDfTB0+=L,`:K1Ck;FFGXBl\64
E`d?nAgnj8Ec6)>F`;/8@:WnkE+<Qm@r#RfARfKuDf0B*DIjr5E,9H$A0>JuCh7Z1AoD]4A9Dj-
Bk(RnATI                                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0H`>22.C]BCh.$hARfLN67s`sF_PZ&@q]F`CER^N/KeMFBl%<&-r"DrEc5u#Eb/i3
+CT.u+Co2-FE2))F`_1I%15is/e&._67sBjEb/[$ARmhE1,(FCD..H=2%9mf67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
3Gi2F1,'hZA867.FCeu*FDi:EF(HIBBl.F+.3N>:+E)-?E+*j%%13OO%16T`@r,RpF!,RAE,9H&
?U6tD@WcC$A2uY1?TgFm-UC$a@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\6"4tNCh,Od3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>+0RHSl78?6B6TmIQA8,Qs0H_JI$4R>;67sBpAfrL9D.Rr@+DGm>Anc:,
F<G+.@ruF'DIIR2+E)-?E+*j%+DG_'Cis9"+DGp,$>=!ZA7TCa4ZX]6-Y[F/GUG((4u%C[:dn,I
8OFpO-Y[F/GT\@C$9g.jDe'tP3Zr*I@:Wn_@k9!KD09K1H$!V<+E_d?Ci^sH>9G^EDe't<-OgCl
$;No?+D58-+BD3)+CT.u+E_X6@<?&i$9g.jFDYu5Ddso&ATT%V3[[9c770^K9gg*u8Q&G^;FEiJ
5u^B&%15Hn770^K9gh-*+=Jpj6V'X593+bT.4cl00e5FBHUC=m6VCHS6n'ZLFD5T'F*(i-E$-MU
%159QHZX+DCi<f+E-67F-UUEn6VCHS6mj)d$4R>+0RIYNEcQ)=3B9*3Bl%?D3Zr9UF!)i+DJX$)
AQ<\cDdd0DBOt[h-OgD;+Bos:Eb/Zi+?Op2D/"$2DfRiu3G)uAALSaGEbTW,+AGF*;GU1Y6;TsI
81Z,aDJX$)AQ<\cDdd0DBOt[h/no'A-OgCl$=e!aF`MM6DKI"CD/a<0@p_Mf6"4tNCh,Od3F<4&
4tq>%A0?:Q+AYg&:..Z@+BosE+E(d5-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eGF_PZ&3B9*,%13                                                   ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H?R7+>Y,p2'=Xs1,V$60f'q-+?2>>+>G_r1*AA21,0n2+>P'!0JZI#;cI*uBl\64E`d?nAhl)9
67u)1;cI*uBl\64E`d?nAfu&2F*&ODEc5H!F)u8?/g(T1%17/nDfp/@F`\`[+?CW!%15is/g+kG
FCfK)@:NjkGAhM4.!$gu%15is/g)8Z6?R!YA5-cYEc5t@+<XEG/g+V3@r$4+04T$6@<?'6Ci<`m
+Dkh5Ec5t-$;No?+<Ve#De!3l7WNEa6tpZa+AP6U+Dbt+@;I&uBl%@%+EqOABHUi"Eb/a&DfU+G
D..NrBHS^K.3N&:A0>JuCh4`+@<?!m+=MI`%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0
F<D\R9keWgDfSs#AS*;!$=da\@r#(cATCFTH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZ
AS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAb
AU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:
@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fk
Bl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(
FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*
@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"
$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>
+q4lS67sB);eTlWF=Tg>+q4kg$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<6qDJX$)AQ<\cDdd0D
BOt[h-QlV9+>G!ZFEAWQ@WcC$A7K:a@r!G7>9J!,CiX*.ATV9uF)c#1FCef%-RU$@+Cf5!@<*J<
-OgDMFE21J7P[%[4&]^4+@C9lEb0-14*#Bb-ZF*@@q]F`CF:6/+E(d5-Za-IB5i-<ATB.@>9G^E
De't<-OgDMFE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c
:II9bAT;j,Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*
De<T1+>F<4;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEDB<Ecl7B
-RT?17Q*=_4&fd4F<FM!DeioG>piB=9i)sRD/X3$+EV19F=.M);eTlWF=Tg=4#&frATMr96=FqL
@ll&58PN#(@UX=l@j#l)F*&dH@;]n"@rHU4AS,:kG]Y\u9Q+ELCf"P^BF.@N@ps1FD..'g7VQ[M
#u>GTBl7KRD..'g7VQ[M%17&g@ruj6ATKL[0N:S178?f^;HYYOH#d>'F`V+#D.Oi2H#d>'F`V+:
@;oXqFDYT,F<E:u3AN4/Bk@ZgAKZ&>Ea`I#F(HJ&E+*d/D.RU,+>Gl:1+bC:C2dep$?0]hFEMV8
F"]:&0fLaWA79.i$#j]l@<6R3AKZ)5+Dk[uF<GjIFW`FlFD5=nE,9)oF*2M7+EVNED.R-t+F.mJ
/o#?<%17&g@ruj6ATKL[0N:S178?f^;HYYLAT)O(AI3$]Ch7K,@Wc^%Bk(p$B6%EuA8Q7,BOu3,
@UW_k+>Gl11*A>)FD5=nBOu!kDBND2Eb&loCER81@;]UmDffZ(EZeh"@X0(N3A<3@C2dep$?0]h
FEMV8F"]:&0fLaWA79.i$#jHoE,9).ARfOjE-#S5E,ol/Bl%@%+DkOsCLMK21+mZ_AdNEfDfBN(
+D#&!BlJ-)+E2@>Anc'mF!,=.@r#Lu/o#?<%17&g@ruj6ATKL[0JPF<9keZiDfp)7$"RIbCER26
AKYW"@;^00F*(i4F_*1IBk@ZbDes6.G9CO:Ch.*p+D5CsDKI"BFCB96AM._:B+52eBk)7-Eb0;F
1,(F@026A&FCB&q#tA`RDfTE1@qfgn+CfG;F*(i,F!,=<DKK<)@3BZ'@q[!%Bl7L&@;I''F`V,:
D(]pEAdN'cF`2;3F(8p%B-:])H#n(9Ci^_9Df0Z*DIFZ0ARfBrD/!m!Ea`c,D09o2F_raGE+]Ue
E+rg(F`M&70/>492D7dCDKK<)@0pm]Bl8#8E,Th@E+s3$/MSl"Bk@Zj@;0V$+E27@+E2%4AM._:
B+52eBk)7-Eb0;F1,(F?03;_+FCfK1+B3AqE!^&dG%kc6+EVOGATAo&ARlomEb/ZpAmob&/p(f>
$"RUjBl%i5FDlA7EZeh&A0>?%ART@d@<6NB0eR3[B+52eBk)7-Eb0;F1,(F?03;_+FCfK1+B3Aq
E%`n)?X\(i0546rDf0,a@<W#SBQ&!2+@1-_+>Gc*+?:Q%1E\D.+@/^E-o!/'C2delD.Oi/BQ&!2
B6%F"BPD?s+DkP(D/XN0+EM7=AM._:B+52eBk)7-Eb0;F1,(CB01g2-Bl7K)FDi9gCis?%FDl%'
@<-I$F(o&*DeX#1GAhM;ATDi7F*(i4F_)\"F#>X10fUjI2`=qoFD5=n@<?(%Bji-&Bl"o9DfTW)
EcW@EFCB96AM._:B+52eBk)7-Eb0;F1,(F?02?)&+AHElBk)'70ecsQ@rr#a6rQH10f(^?:.7VY
D..-r+EV%1F!,FEAR]Io/o#?<%14[=E+rg(F`M&70/>492(q^9G9BUkG\LZ+0/5.fDe!kq?URg[
2)-mE/l"i)$#O*bDBO%0Df[%?F_,#uD_>dDB+52eBk)7-Eb0;F1,(F@02?)&+AHElBk)'70K!3S
@<i/d6rQH13&i]H:.7VYF)Q2CBHVJ4ATo8<CM=o#@<6.#+EDC/A0>],Dej96F=q<IB+52eBk)7-
Eb0;F1,(CB02l_+CLqc69lG/lFCAm$F!+G&BlG^[0jeg:FpVMD;aW>q3&WBa77IT#@;KX#@<<W$
Bl%m.DfTDAC2dep$?0]hFEMV8F"]:&<(KAF:/k4k=YET_DfBN($"7OaAS#a%@V'RtBk(]s@UX%`
EZek4H"h//+C\bgGp"h%2)[(/Bk@Z[Bl%?lDBND"Ec,T$AKYK'H"h//+C\bgGp"h%2)[(%E+]Ue
E+rg(F`M&70/>483A3sAA8,Ii@4s;i?Y3kY$"$)!6SL>O3A+&q7L=$PEbf/uDf@=DE+]UeE+rg(
F`M&704]!FDJX6"A7]9XD/!m*Bk8DrEc6&5ATAo8G@bZ6GqF)KG%GPG3AEE7@V'.iEb-A%AoqU)
/o#?<$#OBoDJ<Z)@WHC/BOu3,FE_;6FEqq=G%GP60f^sH+C\noDfTD3@:jUmE\;*GB+52eBk)7-
Eb0;F1,(F?026/%F)Q2ABaJ6kD.7<m+C\nn+Dl73+D>n>+EM4)G9Cp;F(KB8AM/(=AdMphD.7<m
+C\nn+Dl73+D>n>+EM4)G9Cp;F(KB8AM#Vg0eR3[B+52eBk)7-Eb0;F1,(F?026/%F)Q2ABeM.u
?YX_$$"$)!6SgVW1+l<j7L<p?ChY#/Ble?6F`M1=@ps=jFDkt<B6%p5DIdf@C2dep$?0]hFEMV8
F"]:&0f:UYBle?6F`M1L0K!3S@<i/d6rQH/2)7'B:.7VYD09A3BQ\D>A8cC,+EqO;A8cZEC2dep
$?0]hFEMV8F"]:&0f:UYBle?6F`M1L0K*9QF`%Lm6rQH/2`!0@:.7VYF)5E!E-WR=DfTQ.CgeGq
ART_'GqNiNB+52eA1qD.DeC_IE&)6<FCf\MBl7EsF`V88DK?+oBOu7,ATDBsASbm/B6e>G;_Dg(
B*i']ATMs)Eb9#sCh+Z$H#50KE+]UeE+rg(F`M&70/>4\84,g@<)lh!01]MtASaYK@WcMo@;KCa
Ecb_4Ec#;/EHPi(DBN/)1cI6J1c[9H3F+7ZBk@Z[CgpsrFC?;4D.=].F_,-%/o#?<%17&g@ruj6
ATKL[0N:S178?f^;HYYD@<uL$6#:"QD$acsAScX0+CT(qATDm$+E2%4AKYK'AS#X"0f_'EF!+\.
0fV0P1c@9J1,<,fFD5=nAThX$H#=a5CgpsrFC?;2Bl7K)@rc-lCEP>l1b`u'C2dep$?0]hFEMV8
F"]:&<(KAF:/k4k=YE<SH=^nYCgqO($"e3dDJLA9FCfW,+D#_-CjBn@0f_-P+BrnB2)dHN0fV*J
2dJ%XBk@Z`Ea`j$+EMX9G%De-G%GK8DBLYo2E<C)E+]UeE+rg(F`M&70/>4\84,g@<)lh!01]Mt
ASaYK@WcMoB6%QlF<G4:@;]Um@3BT!G%G\:GA2/4+EM7<FCfJ8D..QtAKW]f2)'(o>B;V[2)7$E
1,^po/p(f>$"n9i@<<W)Ea`irD.+Q-@<Q4&+EqOABHVA1F*(u6+DkP0A7Zl<3AiL3/o#?<%17&g
@ruj6ATKL[0N:S178?f^;HYYD@<uL$6#:"QD$b&j+CSu#AS#a%@rHL"BHT#i2)l^_F#>a41c@6M
2`G"pFD5=nD.OhuBl%?lDBNG-F^o)-0f_*N/o#?<%17&g@ruj6ATKL[0N:S178?f^;HYYD@<uL$
6#:"QD$b-$@3AurA0>;s@V'S%@3Acq1,^jD2*!BJ3&Y%pFD5=nDfT8/@;]Tu@;KCaEcb_BC2dep
$?0]hFEMV8F"]:&0JY:XATVs2B5Dj4BHU8pBlFAl@;]Tu>;n>r1,_*J>qU55AdN-ZDIako2`!?I
2E3Ku/o#?<%17&g@ruj6ATKL[0N:S178?f^;HYYGBl7R)FDl%M0f_3L+@L-lDKBu8ATodqEcl54
ASc0oEZe>%BlFAn@:O4b+EDUHBHUu"Ch7K,A9)g0BOu!rATAo:@;KakGp"h%3AiF2Bk@Zd@:O4b
+EDUHBHUu"Ch7K,A9)g0BOu!rATAo:@;KakGp"h%3AiF(E+]UeE+rg(F`M&70/>4\84,g@<)lh!
02$"sB6/05DD*_)3&;[FDg-)?G%kN3019i'D.mKsCh7W0<,u\l$$(01BHUu"Ch7K,C11Uj@N]3%
F_tf'Ci!['+D>J*C`kGm3Ahp`F#5j80JPFF0fNAjFD5=nEclJ;+D>>&ASrW*@:O4b+CoM8D.mKs
Ch7W0BPD:!+>Gl:2(iW_B+52eBk)7-Eb0;F1,(C?01]MtAS`JYF`(c2@;I&cEbTJ!@;0OhASrW-
Df$V6AKYH-+F.O7Ci=N=FDl&.+BrnA2`*BP2)I-M1L2VTBk@Z[Bl%?lDBNe7D'3\,+C]U=H"Cf.
Dg-8EDf0,=C2dep$?0]hFEMV8F"]:&0JkFUBl7R)FDl%'C11Uj@N],gF(K3"DKI"2Df'H9FCfJ8
Ec5l5+BrnA2`3BH1cI3J0jQDRBk@Zd@:O4b+C\c#ASl!rF<G(3D/aW>ATAo6Df9JFC2dep$?0]h
FEMV8F"]:&0JY:A3AEB66?6dKEZe7u@:T[]@;KX#Bl5&8ARTD!Df9//>;J#g1,h'F10lMSBk@Zg
@;KX#Bl5&8ARTD!Df9//>;J#g1,h'F10lMIE+]Ue/M1pU@ruj6ATKL[0N:S178?f^;HYYAA8Q7&
FDl%M7;c[\ATV?r+B3AqE,u=q@<?!m+E(j7FD,5.A79a+>;eDo1H.6H>qU55AdMsUFCSu,De:,6
BOr;s@<jJ?E+]UeE+rg(F`M&70/>4\84,g@<)lh!02Q4uE,9(lD.Oi(DBNn:Ch[Bj+D>2*+CT.u
+E_R4ATD`uDKKqB>B;PW3&*?K1c-pD>qU55AdN<c+DG^9E,TQ,@q?cr@<<W#DIal4DId=!E+*X+
F"V3HB+52eBk)7-Eb0;F1,(F:01g%lBjkmf$#X['Eb-A(@;TQuF*(i)DIm?$B5D!tF!,"-E--A8
BHUN#3AiTI2)$g?3*e.YBk@ZhDfg#2+CnntAKZ&9@;0UjA0>N$@<6K4A8-")H"1M?C2dep$?1$#
@q]F`CGIV>67sa,Eb])tARfKuF"JsdF(KH9E$.qoCh[cu<H)bm@:V`=ARfKuE,ol3ARfg7%13OO
@rGk"EcP`/F<Dr?@<6!-%13OOCi<`m+=C].FC?hDEGT?2AL@oo%16QTBk)3kBkhQs?TgFm4$"c<
-Y[F/GUG((4u%CpBk/>?.3g3SD.Rr7-RgSoF)?&4E-ZP:EZfLHBl%i<+:SZrA0>>lBk)3kBkhQs
?Q`Pq1E^UH+=ANG$>OKiB4#@fDe*3<3ZoeGDJX$)AQ<\cDdd0DBOt[h-OgCl$?K`u?YO7nA7%J\
+=CY[06:uQB5M@'Ec5tOD/"$2DfR3J+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+Dkh5Ec5t@A8-'q
@ruX0Gmt+%EarHjC2[Wi4ZX]5@lc8bBQ\0$F(Aa$05trGD..I1FCfN8/p)&C@Q8EV+<VdL+<VdL
+<Ve%67sC&BQ\0$F)Yr<F!,"&%172tB4#@fDe*3<3Zoe[3\PPkF_>Q*EcQ)=04]!2F_t]-FE9*[
Eb/in@P;S4EcQ)=/nAE=+<XEG/g,"FEcQ)=+Cnpj$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8
D]gHBC2[W3%15is/g)NUC2[W1+D58-+FPjbB6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<
B4Z0-I4cXTEc<-KA7B+pF=.M):-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M)
-Y[=6A1&L4ATVs;+?MV3FE8R:B6#,/An*22%15is/g,4HF<GXAF`;VJATAo9F(KA7CLqd4%17/n
Dfp/@F`\`RF`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=CZ4ARfLU
F(KAbAU/>E.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-VnVr
Bl7K^E,9H$A4($A@r!3+Ec5](@rri7ATW'6-N                                     ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' MirrorXref BADGALCNTS BackUpMirrorXrefDb BracketOverlaps '
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
zz=:zz,' tolower tslash2 write writetd2 yyyymondd''),<<;._1 '' OnlineUploadCh'
zz=:zz,'eck CHECKVMD IFACEWORDSOnlineUploadCheck MIRRORDB MIRRORDBPATH MIRR'
zz=:zz,'ORPATH ONLINEUPLOADPATH OnlineUploadCheck ROOTWORDSOnlineUploadChec'
zz=:zz,'k intersect list smoutput tslash2 uploaddupcheck''                  '
zz=:1188{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fU:2+>P&o0H`2/1,9t,2]sq91/2J'Ec5u#Eb/hl$;No?.SXVtEc5u#Eb/i*F"Jsd@rc-hFCcS'
DIal+Ddd0!F)c#1FCcS3Bl\64EZek4Df]tBEb/ioEb0,uAKYMlFCAWeF(Hs5$;No?%15is/g,=K
EaiI!Bl,m?$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Kc/Y+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+@:3bCh-7SEcQ)=+<W6Y@UWb^
F`9!DEb/[$AM7k<@:UKtBl\64EX`@N67sB'9Q+ELCdrG`D+&)Y+>"^PDe!3l+D,>(ATJu<Bln#2
A8-'q@ruX0Gp$s4FCSu,.![6a@;]TuAnc'm+DkP/@qZu5GUX(/:-pQB$;No?+CfG'@<?'k3Zp13
0fWojDD3sX$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os%15is/g)l.C3=DJ2BZXQDfp"A@r,RpF!+t5
ART[lA.8l@67sB83,3SR1,C%i@;0U%-pi&jCh-7SEcQ)=.3N&0A7]9\$;No?+>GijF`&rm+EM%+
ASkiuAnc-kCh\3,A0>;uA0<9gF_u(kDe!3l8SqmKAPQZUF`Lo,.3N&0A7]9\$;No?+>GijF_icd
+=KruF)u&5B2!5R@;JDICh7ZpF)c"F+CSekARl5W:-pQU0fWojCb[[f-r",l@q\YUCh[cu:2`I>
@:O(aFE8lR@:Wn[A.8l@67sB83,3SP0fL4'9keZiBl7QTD..'gF&HRgDfTqK+CSekARl5W:-pQU
0fW]T@k]V[-r=>mASuTZDerrqEcWcS8SqmKATLORF*(E$A79RkA1Sj!DJX$)AP$`IB4XGKF`):P
+BN,`<H;e&+CSekARlp*D]gGoCgqO(.3N_@@VfTb$;No?+>GidARdDN+=L$'Ch[cu6ZQaHFCdjK
FCcmD@:Wn[A0>u4+=KNl@WcN:+EV%$Ch4%_:-pQU0f`iW@PKkc-rY80E+rfrDfp+t@;0a[AT2R.
F=A>@A7T7^%15is/g)l/D..H?0H_c;De!3l7WNEa6tpZj+E_d?Ch\!:+CSekARl5W%17,eEHPu9
AKW@2@<>p2F)c#1FCcg/$4R>PDe!TlF)rHO9keWgDfSs#AS*;4%13OO:-pQ_A7]^kDId<rFE7lu
:-pQU-n6Z/3Zpe1ART[l9keWgDfT3+EGQakDe!3l7VQ[M?ZU4'+B<Ak@<?'SDe!3l:i^,gASuTs
F)c"=9Q+ELCenqbBl7KOBl%?fF)c"*$;No?+=J]g4ZX][Ble?0DJ)X]@ps1CBl%@%?ZU4'%15is
/h1FMA7T7jASu$iDKKq/$4R>;67sC%@q]Fj@3BK#+Dkh5Ec5tNA7?Zl@<>pe@<6!&/Kf"@EcYf&
+E)-?-T`[u@q]:k@:OCjEX`@CEb/[$APHlZEc5u*F)c"Z3Zoh)+?CW!.1HVoEb/[$AKZ)'@VfTu
9Q+ELCf"P^BFP:k+=Kp%@ps1M@<?0S6m-2]FCf)rEZf7<F<GIDCht55EbTB!Ed8dCAU,g9$6UH6
9Q+ELCf"P^BHVD.G]Y'GDfd+>F_kkC3t2N+$=e*f@<?''FCAWpAKXcdCh[cu94`BmDfT@t$6UH>
94`BmDfTA2FCf]=+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve"AU-acAT;j(DI[r7Bl8$(B4Z*+
DJsV>DKTc3.6@tG+<Vd9$=e*f@<?''FCAWpAKX9T@WcMs$6UH>6#:"QD+eGc+EV1>F<GI>F<GID
Cht55EbTB!Ed8dCAU,g9$6UH69Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1M
Eb0<'DKI"8DKKH&ATAo'BOt[h-qnPh@;Jb\ATMF#F?Mc@+E)9C9Q+ELCf#.`F(K624ZtMK/.Dq/
+<XHtCh[cu8SqmKAOCBYDKI"8DKKH&ATB=2$6UH6:Msu_DIl1UART[l6t(1K+Cno&ALn8t+<Ve#
@<6NjE+EC!ARloo@<?'3%144#+A$EYB4Z-X@<6NjE+EC!ARloo@<?'3%144#+@0gQF_sl^D.Oi3
AU&;J%144#+AcKeASuTZDerrqEcW@FAU&;J%144#+BN,`<H;drFCf]=/.Dq/+<Wsd@WcNUATM@%
BlJ0.Df-\>AU&;J%144#+D,P4ASGdp+DYP6-qnPh@;JbKFD+66.3NYBAn?!oDI[7!+A?]`@;KLO
@<?029Q+ELCf"P^BLtT@.6@tG%16TcART[l+EV%$Ch4_bDJX$)AP$`IB4VMZ+<W((D..'g94`Ak
FCf]=+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve&DJX$)AP$`IB4XPHCh4`2AU&;J%144#+@1$X
BPDX$A5,HL+EV1>F=[k.+<VdmEarcsG%G2_BmO>5Bl8$(B4Z*7%144#+A?3cBlnK.AKYT$Ddd`=
%144#+A?]kB5)I1A7ZlqCi<a(/.Dq/+<WsdFD5i>A7ZltDKKH&ATB=2$6UH6:NC/^Bl7?q87cLJ
BQPA2DKKH&ATB=2$6UH6:NC/^Bl7?q=(u2eBHV#,FCf)rE\%Y,+<Ve)ARTCC@<?''A79Rk/.Dq/
+<X['Ci<`m6t(1K+Cno&ALn8t+<Ve#@<6NjE+EC!ARloo@<?'3%144#+B<Gr+EV1>F=[k.+<Ve+
BQ\0$DII6q<H;muFCf]=/.Dq/+<X<gH$=1IA9/l8AU&;J%144#+@BRVFD5Z2+EV1>F=B9\$4R>P
Eb/[$AKZ)'@VfTu8SqmKAO1-AF_t6$%144#-qS8aB4X_IGp%3?G]Y'GDfd+>F_kkF%144#+@0gQ
F_sc_Gp%3?G]Y'GDfd+>F_kkF+:SZ#+<YWDBl.:!Gp$m6Gpl7$@:s.EAU,gL6#:"QD+eGc.4bo8
+<Ve=DfTE'B5Si-AU,[iCgqO(94`At+ED%*ATD@"@qB^(6#:"QD(%\d@WcN\AU,^U%144#+D,P4
ASGdp+DYP6-qS8aB4X_IGpskVAS,LoASu!hF!+7rCh[cu8SqmKALL,e@:s.EAU,^R3t2N+$=e*f
@<?''FCAWpAKXQ]@:s.EAU/K<Eb&9m%144#-qS8aB4X_IGp%3?G]Y'GDfd+>F_kkF%144#+A69k
GAhM4+EV1>F<GI>F<GIDChtX3$6UH6E,oZ0@<-W9CLqc>8SqmKAP6T[/0ISsH$=1IA19&=$6UH6
AoD^$BkM<+CLqc>94`BmDfTA;+ED%*ATD@"@qB^(:Msu_DIlIPH$=1IA11)^H$=1IA19&=$6UH6
AoD^$BkM<+CLqc>8SqmKAP6T[.3NYBAn?!oDI[7!+AZlkBl7KRD..'g-qS8aB4X_IGpt1(%13OO
@rc-hFCcS:@:F%a+A?]`@;JMP@:s-\$6UH>9Q+ELCe8JPB4XY&+DG_8AS5Rp+Du+>+Du=<C`m\;
Bl.:!Gp$m6Gp$O<FDkl2@rc-tASuT@%144#+A?]`@;JnVF_tSZ6m-2]FCf)rEZf7<F<GIDChtX3
$6UH69Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1FD..'g7VQ[M+EV1>F<GI>
F<GIDChtX3$6UH68SqmKAP6T[+EV1>F<GI>F<GIDChtX3$6UH6AoD^$BkM<+CLqc>9Q+ELCf"P^
BLtT@+ED%*ATD@"@qB^(9Q+ELCh6FOFD*'rDe!3l:gnHZ8OP!Y%144#+D,P4ASGdp+DYP6-qS8a
B4X_IGpskVAS,LoASu!hF!+7rCh[cu8SqmKALL,e@:s.EAU,^R3t2NG%13OO:-pQU:/=hX3ZrNX
AKY_1F)c#1FCcS'A7TUr+DGm>Ap&09Gp$O)Dfp.EBQ&);F)c"=BlbD/DfT]'FED))/e&._67sBY
F`))2DJ()5FCB&t@<,m$F)c"=E,oN3FEo!JEbTE5ATDi7DfQt7DId<rFD5W*+EMO=+DG^9H#IhG
%15is/g+b7G&MD8FCcS9FEq\6+DGm>Ch[ZrCj@.FD]j">De+!#AKYK$A7Zm*BOQ!*A8c%#DC9NK
GAhM;/e&._67sB[ATMr9H#IhG+EMO=+D,Y&B5M3tFE8RHD]iJ3DeW`)FD,B0+<koA@r#Y$@W-0.
+q4lQDe!3l7VQ[M?ZU4'4ZX]60H`D!0I[G<F(K0!@rrh9@4k,g@:s.EAU,gL:Msu_DIlCV@:s.@
Bl%?3+A?]`@;JbKFD)e/Ec5e;:Msu_DIlCV@:s-o@1<QXDJj$++DPh/DBMMf@:s.;CgqO(=E5Nn
+E)-?@4k,g@:s.EAU,C]+CZrpD..'g94`AX$>FBqATAo.DeX)36#:"QD'3=2Df-\-/jX;_F_sc_
Gp#6m@P0r_@WcN\AU+^lBl7g"EZf+8Bl5%eDe!3l:gnHZ+ClU5DBNIB9Q+ELCf"P^BLtT74Wn5e
9Q+ELCf"P^BLtT7%17;mATD?)@kL&`@WcN\AU,C]+?p;BDfTB"EZeh:+AZlkBl7KRD..'g7VQ[M
%14Nn$4R>BE+EC!AP@#P@;Jb\ATMF#FC0*/Ccsg%-ZsB=@<?''6#:"QD'3n2F<F7q@ps1MEb0<'
DKI!a+>G!_BOu3q+@0gQF_sc_Gp$g=+=@U*%15dI@ps1LDJX$)AO^BMARBLuCcsg%-nlc)+>>5R
$?KcpARfg);Is9Q6t(1K/0JFT8SqmKAP6T[/0IW)@ps1QBQ\0$8OP*P@P1>m@ps1M@<?0S6nBHS
De!3l:gnHZ/0IW)@ps1FD..'g7VQ[M/0I`+Ch[cu8SqmKAO^BMAKYT*Df$UjDe!3l8SqmKAKYD(
%16feDImi2C2[g(+A?]`@;JbKFD)e++E)-?@P1>m@ps1M@<?0S6m+W8@4k5l@ps1M@<?0S6m)pG
Bl7g"EZf+8Bl5%hDJX$)AP$`IB4W2q+E)-?@kL>i@:s.EAU,C]+CQloD..'g94`Ak%17#oA7]d(
@X0(oARTCC@<?&i$7QDk%15gDF)u&5B2!5R@;JDICh7ZpF)c"Z3Zoh)+?CW!.1HW*ASbpfF<G(3
F`):L0e"5RF!+1kF)u&5B1$QY/0JFT6#:"QD,+MVALns:Ec6)>?Xn"l@psI-:Msu_DIlCV@:s.@
Bl%?3+=DOa.3N&?+AQiKDe!3l7VQ[M+D,Y4D'2VlCh[cu8SqmKAKYCj$>FBqATAo.DeX)38SqmK
AO1-AF_t6$+CZI3DBNC@8SqmKAP6T[+?^iU/kKngB4X_IGmt*pDJj$++DPh/DBM5]@WcN1@j#]-
+Cd#iCgqO(94`Ak4Wn2d6#:"QD+eGc%17;mATD?)@4k,g@:s.EAU,D9Dfd+9DBL?KASbpfF<F.l
@:s.EAU,D1Ec5e;9Q+ELCe8JPB4WM$$>4BtF`8I4Gp$TL6#:"QD,+MVAISubEb&a%+C]U=9keZi
Bl7QNDKI"0F(5Xd.8OhtBl7K^E,9H$A4($A@r"h+/h0Y7Ch[cu<H)bm@:V`=ARfKuF"Jsd@q]F`
CERb=Ci<`m+D,>(ATJu+DfQt2F`;/2@psIjF"Rn/:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?
+DG_8ATDBk@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sBVDJX$)AQ<\cDdd0DBOt[h+>"^GBOt[hF!,(/Ch7Z1Bl5&9
E,9H$A0>DsEb/a&DfU+GAoD]4A9Dj-Bk(RnATKI5$;No?%15is/g+YEART[lA3(hg0JPR^@<+%Z
%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++:SYe$?B]tF_Pl-+=C].FC?hDEGT?2AL@oo%16T`@r,Rp
F!)i+DJX$)AQ<\cDdd0DBOt[h-Qi                                              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`uBl%<SBl\64EZd_?770^K9gg*q7R9C1=&2^^;b^tHEc5u#Eb/i*9Q+EL
CdrG`D+&)Y+AGF*;GU1k9gg+":/"5S79*/X:I.BF5u^At:Msu_DIlgeCi<`m6YL%@CEQMN:K1Ck
;FFGXBl\64E`d?nAfsuI:K1Ck;FFGZDJX$)AQ<\cDdd0DBOt[h+E_X>Ddd0eF`:i(ARfL'.4cl0
/3G:hF_PZ&@q]F`CF:P^-p0UR/mg=U-Ql,tEcQ)==E7tb+AZlkBl7K^E,9H$A4($A@r!G@/1<V7
,VUYu-p0UR/mg=U-Ql5];cI*uBl\64E`d?nAftSsARfLUF(KAbAU/>>D..<uDe!^1Eb/iiFEhmM
E,o]'BOt[h-RgSp4>J$60I/D-0f^pD1,(=<2`<HM3ANQL+>PW*3A<6E0J54C1,(XB1GLd11,(FC
0JbI</i5LI3&rcO1,g=20JPRA1GUX:1cR3M3B9&W1E\G,0f^pD1,(=;3A<-B1b^^F+>PW*3A<6E
0J57;0JkaD2)mH91,(FC0JbI</i>XH0fLgG2DH=00JPRA1GUX:1cIBO2`<BH2'=Y.0f^pD1,(=<
3AiWP1c@<O+>PW*3A<6E0J54B2)70H3Ai];1,(FC0JbI</i>RI2).$E2)HF20JPRA1GUX:2D?gB
2`!6L+>PW*3A<6E0J51@3B0#T1bq!41,(FC0JbI</i5OC0K(jM2'=Y.0f^pD1,(=<3&!'@0ebRH
+>PW*3A<6E0J57;0JkaD2)mH91,(FC0JbI</i>XH0fLgG2DH=00JPRA1GUX:1cIBO2`<BH2'=Y.
0f^pD1,(=<3AiWP1c@<O+>PW*3A<6E0J54B2)70H3Ai]D/1<V90JPRA1GUX:2*!TP1c.'F2_/5j
0JPRA1GLjA2*!TP1c.'F2_&Mo0d&5#/1<V9+>P2t0JPRA1GUX:1cR<H2)mNQ1*A>+0f^pD1,(=<
3AWKN0fCpI+>PW*3A<6E0J54A3&rrQ3&3H91,(FC0JbI</i>XF1cI-I2Dlp7-p01/0I\P$4>J$9
,Vh&.3A<6E0J51A0KCmC2)$g/1,(FC0JbI</i>UK1,(F@1,9t-0JPRA1GUX:2)m?G2E<cR0d&5*
0f^pD1,(=<3&W]R0K:dB+>PW*3A<6E0J51A0KCmC2)$g/1,(FC0JbI</i>UK1,(F@1,9t-0JPRA
1GUX:2)m?G2E<cR0d&5*0f^pD1,(=<3AWEK3ArQK.4cl00I\P$4>A99-p014/1<V7.4dS8    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
