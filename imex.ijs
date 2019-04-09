NB. JOD dictionary dump: 09 Apr 2019 16:47:41
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


CHECKVMD=:'0.8.0';6;'09 Apr 2019 16:35:04'

MIRRORVMD=:'0.8.5';16;'08 Apr 2019 10:41:43'

THUMBSVMD=:'0.8.0';6;'09 Apr 2019 16:35:04'

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

BuildThumbs=:3 : 0

NB.*BuildThumbs v-- insert online albums as thumbs galleries in primary database.
NB.
NB. monad:  BuildThumbs uu

smoutput 9!:14 '' NB. display J version

sdr=. MIRRORPATH                NB. mirror directory
trg=. MIRRORDBPATH,MIRRORDB     NB. mirror db
bcf=. MIRRORDBPATH,BADCOUNTS    NB. bad counts report 

NB. only this verb modifies the primary database
NB. if the a test database file exists use it
if. fexist PRIMARYTEST do.
  smoutput 'Using primary test database ...'
  src=. PRIMARYTEST            
else.
  src=. PRIMARYTHUMBS
end.

LoadThumbsMirrorGalleries sdr;src;trg;bcf
)

OnlineUploadCheck=:3 : 0

NB.*OnlineUploadCheck v-- checks files in upload directory for duplicates,
NB.
NB. monad:  OnlineUploadCheck uuIgnore

smoutput 9!:14 '' NB. display J version
smoutput 'Checking image files in (',ONLINEUPLOADPATH,') for duplicates.'
if. #dups=. uploaddupcheck ONLINEUPLOADPATH do.
  msg=. '*  WARNING duplicate file names - rename following!  *'
  smoutput '*' ,~ '*' ,: msg
  smoutput 80 list dups
else.
  smoutput 'No duplicate upload file names detected.'
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
1GU(1+>P&o0d&5/+>GSn2D?76+>Po!0fL433$9q4+>bc=F_PZ&9keWgDfT;q@r$4+04T$6@<?'6
Ci<`m+Dkh5Ec5tbF_PZ&<+pDk@WQ7$F(KB6+E).6Bl7K)@;KCqD0$h.F!,R<F_tT/+D5,!Ch7X$
ATJu.DBNn=Bl.:!Gp$X+FCAWeF(J';;Gp:g<_Yu*ATDj+Df.*KD..3k+Cf>4DKI"0DIal#@<?'V
DJX$)AQ<\cDdd0DBOt[h@q]F`CNCV1Bl%@%+DG^9F`;/8@:UKkBl[cpFDl2F+D,P4+CoV6Ch[Bf
FCfMEF`;/8@:WnkE+<Qm@r#RfARfKuDf0B*DIjr5E,9H$A0>JuCh7Z1AoD]4A9Dj-Bk(RnATI ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0H`>13F[,FCh.$hARfLN67s`sF_PZ&@q]F`CER^N/KeMFBl%<&-r"DrEc5u#Eb/i3
+CT.u+Co2-FE2))F`_1I%15is/e&._67sBjEb/[$ARmhE1,(FCD..H=2%9mf67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
3FQlI0KC7aA7T7^+=KTJ770^K9ggEQFDi:7Ec6)>+:SYe$4R>PDe!TlF)rIGD/a<0@p_Mf6"4tN
Ch,Od3F=p1+=BH@6"4tNCh,Od3@>qR+Cf>$Eaa$#+?V#;5s\t&Bl%<?3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO4tq=Z:dn,I8OGX%+Co1s+>=o\%13OO:-pQUBkAJ9Bl.F+.3N>G+D,>.F*&O8Bk)7!
Df0!(Gp%$C+E1b2BHV#,@r-9uAKY]/%16c[@:Wn_@m)jq-mr_GAU#RS3^,9F:JaJT6qK`p,:@2B
AU#=F%159QHZ*F;4$"KtART+[Bk&\AF)?&4E-ZP:EZfLHBl%i<+BosE+E(d5-RT?1%15is/g+e<
F<FUY6m,oUA0?#6A79Rk%159QHZX+DCi<f+B4Z0-4$"`V84>m=<_Yt)9hA5\:JsSI:dJ&O-OgD^
86&AN;cZU\4ZX]60RH/X770^K9ggE]-p0474u%CO84>m=<_Yt2/3J#gD.Rd1@;Ts+-RT?14tq>*
D/a<0@j#`5F<Dqu84>m=<_Yt0+:SYe$9g.jD/"$2DfRiu3G)uAAN`'sD/=89-VnVrBl7K^E,9H$
A4($A@r!G$$8EZ-+=M8A@:UKBHTH"XEcQ)=3B9*3Bl%?0+Eqj?FCcRh8Q&G^;FEiJ5u^B+-VnVr
Bl7K^E,9H$A4($A@r!]2C3(a3$4R>PDe!p1Eb0-1+EVI>Ci<fj5s[eGF_PZ&3B9*,%159QHZ*F;
I4cX<:dn,I8OFV)+>Y-YA0<6I%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6"4tNCh,Od3F<4&                                                           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
0fU:2+>P&o0H`2.2`;d52]sq91/2J'Ec5u#Eb/hl$;No?.SXVtEc5u#Eb/i*F"Jsd@rc-hFCcS'
DIal+Ddd0!F)c#1FCcS3Bl\64EZek4Df]tBEb/ioEb0,uAKYMlFCAWeF(Hs5$;No?%15is/g,=K
EaiI!Bl,m?$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Kc/Y+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+@:3bCh-7SEcQ)=+>"^F@:O(q
E%b^AART[l05PQ8A0>`'EcQ)=%15is/e&._67sBjEb/[$ARmhE1,(FBC3=DJ2@U!g67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/KbK0:-pQU0fWojDD3skB6%p5E$/Y,@<6K4@rc-hFCetl$;No?+>GijF`&rj
+DkP$DBL>oF_PZ&9keWgDfR9L@:Wn[A.8l@67sB83,3SR1,^7r@q]Fj@3B/rDII?qH=^V0@;]Tu
-q&2pE(k1[@;JMP@:s.H@<?X4@;IA8@:Wn[A.8l@67sB83,3SP0ea^u9keZiBl7QWDe!3l7VQ[M
F'j!.CagK8A7T7^%15is/g)l.C3=>I1*@u>@<?!m:Msu_DIlR]6?6LECLqU/.3N&0A7]9\$;No?
+>GijF_ick+=KruF)u&5B1ZrKB4Z-^AT2R.F=A>@A7T7^%15is/g)l.A7]7)0d%l@@<,psF@L1b
A7]e&/0IN$@:s.m9OW!a<H)JWFCeu6+AZlkBl7KRD..'g6Z7*bF=\P9AR\Y[Bdk05A7T7^+EVNE
-p_ZYF_rQMFCAWpAISuA67sB83+QT10Jjn#:Msu_DIl1UART[l6t(1K.3N&0A7]9oFDi9M6#:"Q
D(-TL@:F%a%15is/g)l/An>F+3?T_KF`VM9@qfk(F&6:ZE`-IfDfTqK+CSekARl5W:-pQU0f`Z]
E\KHqA8-+(CghT38g&:gEcYr5DBLMR8g$,H0JO\`@<3Q*DI[U%E+*j&@VfTuCgh3oF^\oo+Cf(n
DJ*O%%13OOEb065Bl[c--Y-Y-@4u\ACh\!&-OgCl$=e!aCghC++=BltEcQ)==E7tb-Qij*%15is
/h1CCE+NotASuU2%15is/g)Pl.6T^76ZQaHFCe0\EcQ)=?ZU4'+A?]`@;JDICh6spEGQatE+EC!
AP@#P@;Jb\ATMF#FC0*/C`lDi@ps1LDJX$)AO^BMARBLuC^g_H67sB/.OdMA+AHQkF(oN)9Q+EL
Cdr,TATM4"EGQ'k:-pQ_ASu$hAT23uA7]Y#Et&Hc$;No?+EM%+ASkiuDe:,/Bl\64E\:m3+Cno&
@:EYdAKWQIE+*d.ARlp%DBL;g-Qlo4@<,ddFCfJ%$:AiF@<?'TBl\64EaNm-Ccsg%-nlc)+>>5R
$=e*f@<?''FCAWpAKXZb@ps1M@<?/l$6UH>9Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3+E2@8
D..I1+DYP6/.Dq/+<X?r@ps1M@<?0*FCf]=+Du+>+Du=<CahFT$4R>PEb/[$AKZ)'@VfTu:Msu_
DIlIPH$=1IA.8kg+=KloH$=1IA0>u*G]Y'GDfd+>F_kk:E,oZ0@<-W9CLqcB%144#+A69k7WN'[
F_,H#Gp$g=FCf)rEZf7<F<GIDChtO^%144#+:SZfEb/[$AKZ)'@VfTu6#:"QD%-gp+=KNl@WcN\
AU,D?AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<X?r@ps1M@<?0S6m-2]FCf)rEZf7<F<GID
ChtX3$6UH69Q+ELCf#.`F(K62+DG_8AS5Rp+Cf(r@r!JdDe!3l:i^,gASuTQ4YS!sEZe%o@ps1M
Eb0<'DKJ$)0e"X_$6UH6:Msu_DIlCV@:s.=Dfor>+DG_8AS5Rp/.Dq/+<XHtCh[cu6ZQaHFCdjK
FCcS*@<?'3%144#+A?3bFB*9j@<?'k+Cno&ALn8t+<VduD..'gF%g"`FB*9j@<?'k+Cno&ALn8t
+<VdmCgqO(:18!N+EV1>F=[k.+<Ve'@<,psF@L1bA7]e&+EV1>F=[k.+<Ve.AR\Y[BcqM/G]YJG
$6UH66#:"QD+%rV@rc:&FD5Z2+EV1>F=[k.+<Ve=DfTE'B5Si-AU,[tDe!3l:gnHZ8OP!MEb/io
Eb0,uATJtfDe!3lAPcfWBIHPm@ps1M@<?0S6n'QH%13OO@rc-hFCcS:@:F%a+AZlkBl7KRD..'g
%144#-qS8aB4X_IGp%3?G]Y'GDfd+>F_kk:E,oZ0@<-W9CLqcB%144#+AZlkBl7KRD..'g7VQ[M
+EV1>F=[k.+<VdmEarcsG%G2Y6o?*/AU&;J%144#+@1$XBPDX$A5d2gAKY])FCf)rE\%Y,+<Ve#
@<?4*F_#&+Ao)BoF=[k.+<Ve#Df03%FEM,*+D,G.@<=%0$6UH66#:XWFEM,*+DG_8AS5Rp/.Dq/
+<XI#BkM-t@;JJGBkM+$+DG_8AS5Rp/.Dq/+<XI#BkM-t@;K"ZA9;K-Bl8$(B4Z*7%144#+AucZ
Cd_]RAKYMlFCd!4$6UH6<H)bm@:Vc7FCcS*@<?'3%144#+A?3bFB*9j@<?'k+Cno&ALn8t+<Ve,
EbQY<AU&;J%144#+B3#sD.7BkBl$diC`mh2G]YJG$6UH694`BmDfTB0+EV1>F=[k.+<Vdo@;p=&
Df-\>AU&;G3t2N+$=e*f@<?''FCAWpAKXQ]@:s.;CgqO(=E4iX+<W((D..'g94`AkFCf]=+Du+>
+Du=<Cb-#&+<VdmCgqO(94`AkFCf]=+Du+>+Du=<Cb-\<$6UH6E,oZ0@<-W9CLqc>8SqmKAP6T[
/0I5p@WcN\AU,^U%144#+D,P4ASGdp+DYP6-p_ZYF_sc_GpskVAS,LoASu!hF!*bb@WcN96#:"Q
D+eGc.4bo8+<Ve=DfTE'B5Si-AU,[qD..'g94`At+ED%*ATD@"@qB^(:Msu_DIlCV@:s."8SqmK
AP6T[.4I=f$4R>PEb/[$AKZ)'@VfTu8SqmKAP6T[GAhM4=E4iX+<W((D..'g94`AkFCf]=+Du+>
+Du=<Cb-#&+<Ve"AU/K<Eb$;7AU&;>DJsV>DKTc3/.Dq/+<YWDBl.:!Gp$m6Gpl7$@:s.EAU,gL
94`BmDfTA;/.Dq/+<Y97Eb/rtDBN_+Gpl<sH$=1IA18XAAS,LoASu!hF!+7rCh[cu94`BmDfTA:
94`BmDfTA;/.Dq/+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`IB4WJ_
D..'g94`At.6@tG%16TcART[l+EV%$Ch4__De!3l8SqmKAISth+=Kp%@ps1FD..'g8OO\8DKKH&
ATAo2Dfd+>F_kk:E,oZ0@<-W9CLqc6@<H[1Bl7F$ASl!rF=[k.+<Ve#De!3l<+pDk@S&s1Bl8$(
B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1M@<?0S6m-2]FCf)rEZf7<F<GIDChtX3$6UH69Q+ELCe8JP
B4XPHCh4`2AU&;>DJsV>DKTc3/.Dq/+<X6m@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<Y97Eb/rt
DBN_+Gpl@)@ps1M@<?0S6n'7!AS,LoASu!hF!+.p@ps1b:gnHZ-qnPh@;JbKFD+66.4bo8+<Ve=
DfTE'B5Si-AU,[qD..'g94`At+ED%*ATD@"@qB^(:Msu_DIlCV@:s."8SqmKAP6T[.4I=f$7QDk
%15is/g*nb<(/hjFD,5.C*7S;Ch\!&+CSekDf-\3F!,(;F)uUL@:F.tF<G78G9CsHC`mG5+D,P4
D..O.ARmD&$;No?+B!?"DJ=!$+EMX5DId0rA0>r5C`m\;ATW$>+E2@8DKKH1F!,CA+DG_(ASuU(
DJ()5EGQb3DBO4CF`Iou:-pQUAmok$EbTW,+EMXMCh4`'F!,:5CLq=-+EVNEE,ol-F^nu*@rGmh
+EV:*F<G+4ATM`:F<GdGEbd9:$;No?+B2onF<GjIF`JUGEGQb0Ea`TtASuU2+EVNE@<QR'A0>u-
BlbC@FD56#AU.a'D]p;6$;>AJ@;JDICh6spEGRd!+=Jod3Zp+*%17/fCh7*u+<Y)F8SqmKAP6T[
/0I`+Ch[cu8SqmKAO^BMALnrtDe!3l:gnHZ+D,Y4D'2VlCh[cu8SqmKAKYCj$>FBqATAo.DeX)3
8SqmKAO1-AF_t6$+CZI3DBN@?8SqmKAP6T[+?^iV/kKngB4X_IGmt*pDJj$++DPh/DBM5]@WcN1
@j#]-+Cd#iCgqO(94`Ak4Wn2d6#:"QD+eGc%16feDImi2C2[g(+A?]`@;JbKFD)e-+E)-?A1gPo
@ps1M@<?0S6m+W8@kLGn@ps1M@<?0S6m)pGGA(Q.AKYJ86#:"QD+eGc+?^i3%17#oA7]d(@X0(l
DJX$)AP$`IB4XPHCh4%_.1HUn$<;%U@<?'SDe!3l:i^,gASuTsF)c"Z3ZoemE+EC!AKX9T@WcN1
F(KG99Q+ELCf#.`F(K62+?^i%+EqL1Eb-@ZCgqO(94`AkBl5%@%13OO9Q+ELCenqbBl7KOBl%?f
F)c"Z3Zoh)+?CW!.1HW*ASbpfF<FIm@;J>?FCd!G@kL>i@:s.EAU,gL9Q+ELCfG(jD.6()/0JCS
9Q+ELCf"P^BLtTC+A?]`@;JbKFD*3J9Q+ELCe8JPB4XPHCh5.?:Msu_DIlCV@:s.@Bl%?'Ao_g,
+A?]`@;JMP@:s-o@3?!dBl7g"EZf+8Bl5%eDe!3l:gnHZ+CZI3DBNC@9Q+ELCf"P^BLtT74Wn/c
9Q+ELCf"P^BLtT7%16feDImi2C2[g(+AZlkBl7KRD..'g+CcO4DBNFA8SqmKAP6T[+?^iU/kKng
B4X_IGp!P'DfTB"EZeh:+AucZCd_]RAIStq%13OO9keZiBl7QWDe!3l7VQ[MF'j!.Ccsg%-nlc)
+>>5R$?KcpARfg)@rHL-F=8jm+CT=69keZiBl7QNDKIEP@kL&`@WcN_@;TR,+D5_5F`:\tDf0&n
F=9q&Ch[cu8SqmKAO^BMALnrOHm^?c@<3PdDbP(Z@;JDICh4`$Ec5e;:Msu_DIlCV@:s-o@1<QX
DJj$++DPh/DBMMf@:s.;CgqO(=E5Nn+E)-?@P15h@:s.EAU,C]+CQloD..'g94`AX$>FBqATAo.
DeX)36#:"QD'3=2Df-\-/jX;_F_sc_Gp#6m@P0r_@WcN\AU+^lGA(Q.AKYD68SqmKAP6T[+Du+>
+DG^9.!&s9ARfg)8SqmKAP6T[+D,Y4D'2Mj@ps1FD..'g.1HVsEc6)>+C]U=@kL&`@WcN_@;TQb
$?'rqATAo&Gp#gqF)u&5B1$QY+CT>$%14O[DJX$)AQ<\cDdd0DBOt[h:-pQ_:Msu_DIlgeCi<`m
6YL%@CER[M/KeP:ARfKuF`;/8@:UKmBl%@%+D,P4+CoV6Ch[BfFCfMG%15is/e&._67sC(ATD6g
FD5SQ%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(f
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+AZlkBl7K^E,9H$A4($A@r!2=+Cf(r
@r$-.Anc'mF!,17+E_X>Ddd0!A8-'q@ruX0Gp$^;EZen8E,95u@<?(%/e&._67r]S:-pQU@rc-h
FCeuD+>PW*3DEq&0Js:H:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$4R>_AT;j,Eb-@@A79Rg06;,L
Blmo6%13OO@rGjn@<6K4-VnVrBl7K^E,9H$A4($A@r!G7                             ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`uBl%<SBl\64EZd\kBl%<ZBQ\0$F!*h@770^K9gg*u8Q&G^;H?L[+AZlk
Bl7K^E,9H$A4($A@r!2d86&AN;cZU\+E_X>Ddd0eF`:i(ARfL'.4cl0/3G:hF_PZ&@q]F`CF:P^
-p0UR/mg=U-Ql,tEcQ)==E7tb+AZlkBl7K^E,9H$A4($A@r!G@/1<V7,VUYu-p0%C-Z*R<Ec5u*
BPDO0DfU,1D.G"C/1<V9+?(Q$0JPRA1b^mA1c$gC3ANKO2'=Y.0f^pE0KCaD3A<6F0JYRH+>PW*
3A<9D3A*3M2`NcR0KD*81,(FC0JbIC/iGL@2_d-C3Ar!80JPRA1b^pB2E<TS2Dm6K2]sk00f^pE
0KCaD3AE3C2D[-31,(FC0JkID/iG^G1H%$C2)ZR40JPRA1b^mA1c%'E0JP:A+>PW*3A<9D3A*3M
0JbL=1,h081,(FC0JkID/iG^M2_m<I0eje+0JPRA1b^mA1c.'J1b^aG2BXb/0f^pE0KCaD3B8uS
2)-gE+>PW*3A<9D3A*3M0eb@@1G^./0JPRA1b^pB2E<QL2D[$E2CU1*4>JTF3A<9D3A*3M3AEBO
0JPF8?SX;i3A<9D2_I!K3AEBO0JPF7BeD+_1+=b&4>J$7,Vh&.3A<9D3%d$D0f(XD2_[*31,(FC
0JkID/iG^L0fLgF0f^@30JPRA1b^mA1c$jB1c73G2'=Y.0f^pE0KCaD3B/`P0fCaH.4cl00I/>$
/1<V90JPRA1b^mA1c-sC0fM'I1Flff0JPRA1b^g?1c-sC0fM'I1Fd)k0d&5#/1<V7.4cl00e"Y%
4>838-p014/3GW                                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
