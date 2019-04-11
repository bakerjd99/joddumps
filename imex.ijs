NB. JOD dictionary dump: 11 Apr 2019 10:15:18
NB. Generated with JOD version; 1.0.0 - dev; 21; 25 Mar 2019 09:41:15
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


CHECKVMD=:'0.8.0';6;'09 Apr 2019 16:35:04'

IFACEWORDSOnlineUploadCheck=:<'OnlineUploadCheck'

MIRRORVMD=:'0.8.5';19;'11 Apr 2019 09:38:50'

ONLINEUPLOADPATH=:'C:/pictures/00 online upload'

ROOTWORDSOnlineUploadCheck=:<;._1 ' CHECKVMD IFACEWORDSOnlineUploadCheck MIRRORPATH OnlineUploadCheck ROOTWORDSOnlineUploadCheck'

THUMBSVMD=:'0.8.0';8;'11 Apr 2019 09:29:24'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


LoadAlbum=:3 : 0

NB.*LoadAlbum v-- load (Album) table.
NB.
NB. (Album) references (LocalPath) execute (LoadLocalPath) before
NB. this verb.
NB.
NB. monad:  iaRc =. LoadAlbum (clMirrorDir ; clMirrorDb)
NB.
NB.   sdr=. 'c:/smugmirror/mirror'  NB. smugmug mirror directory
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   LoadAlbum sdr;trg

'sdr trg'=. y

NB. j profile !(*)=. dirtree
NB. all mirror directory albums contain an (ainfo-*.txt) file
ai=. 0 {"1 dirtree (tslash2 sdr),'ainfo-*.txt'

NB. standarize path format
pf=. tolower@('/'&beforelaststr)@('/'&afterstr)&.> ai

NB. fetch local path table
dt=.sqlopen_psqlite_ trg
dat=. sqldict__dt 'LocalPath'

NB. match ainfo paths with local path table
(0 {"1 dat)=. 1 {"1 dat

NB. table columns !(*)=. LocalPath LocalPathID
LocalPath=. tolower&.> LocalPath
'LocalPath(s) not found - probably new album added' assert (#LocalPath) > >./px=. LocalPath i. pf
LocalPathID=. px { LocalPathID

NB. read all TAB delimited ainfo files
hd=. 0{readtd2 0{ai
dat=. ,@}.@readtd2&> ai
'path id directory ainfo file mismatch' assert (#dat) = #LocalPathID

NB. renamed columns - ImageCount, Date, Name, Description -->> OnlineImageCount, OnlineCreateDate, AlbumName, AlbumDescription
cx=. hd i. ;:'AlbumKey ImageCount Date LastUpdated ImagesLastUpdated Name ParentFolders WebUri Description'
'missing (AlbumKey, Name, LastUpdated, ImagesLastUpdated ParentFolders, WebUri, Description) column(s)' assert (#hd) > >./cx

NB. match local path thumbsplus ids to albums
dat=. <"1 |: 1 0 0 1 1 1 1 1 1 1 1 (#^:_1)"1 cx {"1 dat
dat=. (<LocalPathID) (1)} dat

NB. set all local sample images flag present to 0 - assume they are missing
dat=. (<0 #~ #LocalPathID) (2)} dat

NB. convert online image counts
dat=. (<_1&".&> ;3{dat) (3)} dat

NB. insert in Album table
cln=. ;:'AlbumKey LocalPathID LocalPresent OnlineImageCount OnlineCreateDate LastUpdated ImagesLastUpdated AlbumName ParentFolders WebUri AlbumDescription'
rc=. sqlinsert__dt 'Album';cln;<dat
rc [ sqlclose__dt ''
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1bg+3+>P'!+>Po!1,g=40d&J!0fU:9+>Po!0fC.50d&50+>Ykt3?U(:6V'X593+bTG%G]8Bl@l?
+DkP&AKYK$F`):D@;]TuA79Rk8Oc!579<8_6rQm!Ch[cu<H)bm@:V`=ARfLiDKKH1Amo1\+EqaE
A9/kA:Msu_DIlgeCi<`m6YL%@CFLB=Ec6)>9Q+?M6#:"QD/=-!A0<9dCgqO(.3N_@@VfUM8Q&G^
;H?L[G%G]8Bl@l?+DkP&AKYK$F`):D@;]TuA79Rk:JOST:.8/Z9M[rB:dJ&ODf0B*DIjr5E,9H$
A0>r8@:s:lB-:`!Eb/a&DfU+G/Kf1WF^]*&Grd'X3\PGd@ruj6ATKLY0Hb:OCh[cu+E_X>Ddd0S
:JXqk:JsSZ:Msu_DIlgeCi<`m6YL%@CN=?3F<GdGEb$:@:Msu_DIlgeCi<`m6YL%@CFLB=Ec6)>
<(L"`6;poZ7!<-^F(oQ1/0Je<CLnVuDfor>+CT.u+Cno&AH                           ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
zz=:zz,' tolower tslash2 write writetd2 yyyymondd''),(<<;._1 '' OnlineUploadC'
zz=:zz,'heck CHECKVMD IFACEWORDSOnlineUploadCheck MIRRORDB MIRRORDBPATH MIR'
zz=:zz,'RORPATH ONLINEUPLOADPATH OnlineUploadCheck ROOTWORDSOnlineUploadChe'
zz=:zz,'ck intersect list smoutput tslash2 uploaddupcheck''),<<;._1 '' Thumbs'
zz=:zz,'Mirror BADCOUNTS BuildThumbs CompareLocalOnlineCounts CreateThumbsM'
zz=:zz,'irrorGalleries IFACEWORDSThumbsMirror LF LoadThumbsMirrorGalleries '
zz=:zz,'LoadedGalleryCount_sql LocalThumbId_sql MIRRORDB MIRRORDBPATH MIRRO'
zz=:zz,'RPATH MirrorGalleries PRIMARYTEST PRIMARYTHUMBS ROOTWORDSThumbsMirr'
zz=:zz,'or StdAlbumNames THUMBSVMD afterlaststr afterstr alltrim assert bef'
zz=:zz,'orelaststr boxopen charsub ctl fboxname fexist jpathsep portchars s'
zz=:zz,'moutput toCRLF toHOST toJ tolower tslash2 write''                   '
zz=:1656{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=3+>P&o0H`202Du[42]sh/2DH=/1*A;/3B'ZHEcQ)==E7tb$;No?.SXVtEc5u#Eb/i*F"Jsd
@rc-hFCcS'DIal+Ddd0!F)c#1FCcS3Bl\64EZek4Df]tBEb/ioEb0,uAKYMlFCAWeF(Hs2:-pQ?
:-pQU<+oue+EM%5BlJ/:F(8WrF!,R<AKYT!Ch7Z1Bl5&8BOr;7;f-Yi9keWgDfR9LA8-'q@ruX0
Bk;?.FD,*)$;No?+EqC;AKZ2;BlnH.DBND6+EV:.+Ad?*BQ%c2.!'6JB5i-<ATB4BF(96)E--.D
@;]Tu@WcC$A9/l%+EM77B5D,d:-pQU@rH4'@:OC%;c-5&FCcS/D..'g+CT.u+CT(qF_r7<ATV?k
@<>p#A79Rg@UX=h+=M)@EcQ)=/nAE?/db??/db??/g)QZBl\64E\:m3.3N,@Df]tBEb/ioEb0,u
ATJu1De!3l+DG\$B4W2tBl%@%+EqOABHV52Ch[cu+Eh=:F(oQ1EsbZ//g,(M+DlBH;f-Yi9m((k
Bl.9kAKZ&.FCd'3:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g+hLFDu:^0/$gRDI[6sFCT6,FE2;9
/otlPB5Md(/n8g:0+(H@/db??/g+kGFCfK)@:NjkGAhM4.!$gu$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O]:-pQU+@:3bCh-7SEcQ)=+>"^F@:O(qE%b^AART[l05PQ8A0>`'EcQ)=$;No?$;No?+CfG'
@<?'k3Zp130fWojDD3sU:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB83,3SR0K(%dEc6)>+Cf4r
F)rI6Eb/[$ARl-C67sB83,3SR1,C%i@;0U%-pi&jCh-7SEcQ)=.3N&0A7]9Y:-pQU0fWojDDF*m
F(8lpD.+Q!Bl7?qBmO?$+CT.u+=KX#D/`0e@ps1FD..'g:186eEa`c5+CSekARl-C67sB83,3SP
0ea^u9keZiBl7QWDe!3l7VQ[MF'j!.CagK8A7T7^$;No?+>GijF_icf+=KrmFCSu[DJX$)APR/1
Ea`HnATVuB+CSekARl-C67sB83,3SP0fL4'9keZiBl7QTD..'gF&HRgDfTqK+CSekARl-C67sB8
3+QT10JO[u:gnBUDKJ?dCh.*tF"AG*D..'gF%g"`FB*9j@<?'k/0I`+Ch[cu8SqmKAOCBYDKIEP
=(Pi@EbQsF@:Wn[A0>u4+=KNl@WcN:+EV%$Ch3rK67sB83+QT10Jjn#:Msu_DIl1UART[l6t(1K
.3N&0A7]9oFDi9M6#:"QD(-TL@:F%a$;No?+>GlgAR[AS+=L02F)Yi'BlA-8:gn'Y;IsfcEc``Q
@:Wn[A-u'u/g)l/@;p6@3$;aGF)Yr(Gp#^%G%G]8Bl@l3/KdY.3A*!?+D>2)+DG_'Df'H%FD53#
AKYetDJ+*#B4W2qBOPdkATJ1cEb065Bl[c--Y-Y-@4u\ACh\!&-OL2jDe!TlF)rHO9keWgDfSs#
AS*:s$;No?.V*+0ASu$iDKKq,:-pQU-n6Z/3Zpe1ART[l9keWgDfT3+EGQakDe!3l7VQ[M?ZU4'
+B<Ak@<?'SDe!3l:i^,gASuTsF)c"=9Q+ELCenqbBl7KOBl%?fF)c"':-pQU-n6Z/3Zq.2F)u&5
B2!5R@;JDICh7ZpF)c"':-pQ_ASu$hAT23uA7]Y#Es`7L67sC%@q]Fj@3BK#+Dkh5Ec5tNA7?Zl
@<>pe@<6!&/Kf"@EcYf&+E)-?-T`[u@q]:k@:OCjEXG0SART[l9keWgDfT3+EGRd!+=Jod3Zp+*
$=e*f@<?''FCAWpAKXZb@ps1M@<?/i+<W(+De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kk:E,oZ0
@<-W9CLqcB$6UH69Q+ELCf"P^BHVD.G]Y'GDfd+>F_kkC3sl=)Eb/[$AKZ)'@VfTu:Msu_DIlIP
H$=1IA-sG%-qe,sGAhM4+EV1>F<GI>F<GIDCht55EbTB!Ed8dCAU,g6+<Ve"AU-acAT;j(DI[r7
Bl8$(B4Z*+DJsV>DKTc3.6@kD@rc-hFCcS:@:F%a+@0gQF_qI.+=KNl@WcN\AU,D?AU&;>DJsV>
DKTc3+E2@8D..I1+DYP6/.*LB+A?]`@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb,o9+<X?r@ps1M
Eb0<'DKI"8DKKH&ATAo'BOt[h-qnPh@;Jb\ATMF#F?Mc@+E)9C9Q+ELCf#.`F(K624ZtMK/.*LB
+AZlkBl7KRD..'g6Z7*bF<G:8FCf)rE\%P?+<XHtCh[cu6ZQaHFCdjKFCcS*@<?'3$6UH69OW!a
<H)JWFCeu*A79Rk/.*LB+A$EYB4Z-X@<6NjE+EC!ARloo@<?'3$6UH66#:"QD,+MVAKZ)+G]YJD
+<Ve'@<,psF@L1bA7]e&+EV1>F=[bA+<X`s@T@G_+EV1>F=[bA+<Wsd@WcNUATM@%BlJ0.Df-\>
AU&;J$6UH6AoD^$BkM<+CLqc>9Q+ELCf"P^BLtT@+ED%*ATD@"@qB^(9Q+ELCh6FOFD*'rDe!3l
:gnHZ8OP!V3sl=)Eb/[$AKZ)'@VfTu:Msu_DIlCV@:s-Y+<W((D..'g94`AkFCf]=+Du+>+Du=<
C`m\;Bl.:!Gp$m6Gq9:F+<XHtCh[cu8SqmKAO^BMAKZ)+G]YJD+<VdmEarcsG%G2Y6o?*/AU&;J
$6UH66#pIKBm+&u;e^Ph+DG_8AS5Rp/.*LB+A?3cBlnK.AKYT$Ddd`=$6UH69Q+f]BlnK.AKYT$
Ddd`=$6UH66#:XWFEM,*+DG_8AS5Rp/.*LB+A[#lB5)6lCe/,OB4uB0Bl8$(B4Z*7$6UH6:NC/^
Bl7?q=(u2eBHV#,FCf)rE\%P?+<XQn@;J>?FCcS*@<?'3$6UH6<H)bm@:Vc7FCcS*@<?'3$6UH6
9OW!a<H)JWFCeu*A79Rk/.*LB+B<Gr+EV1>F=[bA+<XWsF_tT*@;0OXEblk?AU&;J$6UH694`Bm
DfTB0+EV1>F=[bA+<X$[E-,f4DBO%4G]YAr$4:9`ART[l+EV%$Ch4_\D..'g6#:"QD-1fc+<W((
D..'g94`AkFCf]=+Du+>+Du=<Cb,o9+<Wsd@WcN\AU,D?AU&;>DJsV>DKTc3/.*LB+E2@8D..I1
+DYP6-qS8aB4X_IGq:((CgqO(94`At/.*LB+D,P4ASGdp+DYP6-p_ZYF_sc_GpskVAS,LoASu!h
F!*bb@WcN96#:"QD+eGc.4bfK+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)
AP$`IB4WJ_D..'g94`At.6@kD@rc-hFCcS:@:F%a+A$EYB4X_IH$=1IA6<jZ+<W((D..'g94`Ak
FCf]=+Du+>+Du=<Cb,o9+<X<gH$=1IA0>u*G]Y'GDfd+>F_kkF$6UH6E,oZ0@<-W9CLqc>8SqmK
AP6T[/0ISsH$=1IA19&:+<Ve=DfTE'B5Si-AU,[sAU/K<Eb$UAEb/ioEb0,uATJtiDJX$)AP6T[
GAhM4-qe,sGAhM4.4bfK+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`I
B4WJ_D..'g94`At.6@kD@rc-hFCcS:@:F%a+A?]`@;JMP@:s-Y+<W(+De!3l8SqmKAP#94Bl8$(
B4Z*+DJsV>DKTc3+E2@8D..I1+DYP6+CTD7DeX*!Eb0*!DKIE:+<Ve#De!3l<+pDk@S&s1Bl8$(
B4Z*+DJsV>DKTc3/.*LB+A?]`@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb,o9+<X?r@ps1FD..'g
7VQ[M+EV1>F<GI>F<GIDChtX0+<VduD..'g94`AkFCf]=+Du+>+Du=<Cb,o9+<Y97Eb/rtDBN_+
Gpl@)@ps1M@<?0S6n'7!AS,LoASu!hF!+.p@ps1b:gnHZ-qnPh@;JbKFD+66.4bfK+<Y97Eb/rt
DBN_+Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`IB4WJ_D..'g94`At.6@kc$49Np/g*nb
<(/hjFD,5.C*7S;Ch\!&+CSekDf-\3F!,(;F)uUL@:F.tF<G78G9CsHC`mG5+D,P4D..O.ARmD#
:-pQU;KZkpBl7Q+F*(i.A79Lh+EMO=+E2@4FEDdNE,oZ1FCfK6+E)9CBl7HmDKKT1B-;88C`mG0
+F.mJEXGQ./g+b7G&MD8FCcS9FEq\6+DGm>Ch[ZrCj@.FD]j">De+!#AKYK$A7Zm*BOQ!*A8c%#
DC9NKGAhM;/db??/g+,)F*&OMDfp(CF)c"=Ao_<mD.RU,F!,RC+CTG3Bk/?.BPDN1,'7O/CLqd#
Df6dC$;>AJ@;JDICh6spEGRd!+=Jod3Zp+*$?KcpARfg)+CQloD..'g94`B"+AZlkBl7KRD..'g
7VQ[M/0IW)@ps1M@<?0*Ao_g,+AZlkBl7KRD..'g+CPUkDJj$++DPh/DBMMf@:s.;CgqO(=E5Nn
+E)-?@4k,g@:s.EAU,C]+CZrpD..'g94`AUBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA6#:"QD+eGc
+?^iV/jX;_F_sc_Gm\8'DImi2C2[g(+A?]`@;JbKFD)e-+E)-?A1gPo@ps1M@<?0S6m+W8@kLGn
@ps1M@<?0S6je-OATD?)@kL&`@WcN\AU,C]+?p3OEb&a%+C]U=:Msu_DIlCV@:s.@Bl%>f.1-D^
E+EC!AP@#P@;Jb\ATMF#FC0*/Ccsg%-ZsB=@<?''6#:"QD'3n2F<F7q@ps1MEb0<'DKI!a+>G!_
BOu3q+@0gQF_sc_Gp$g=+=@L'9Q+ELCenqbBl7KOBl%?fF)c"Z3Zoh)+?CW!.11--Ch7*u+AucZ
Cd_]RALns6/kKngB4X_IGq:(3De!3l<+pDk@S&s=+CZrsDe!3l:gnHZ8OP*P9Q+ELCf"P^BIk9"
De!3l8SqmKAO^BMALns"DJX$)AP$`IB4XPHCh4`$Ec5e;9Q+ELCe8JPB4W2o$>FBqATAo.DeX)3
9Q+ELCf"P^BHUb,Df-\,/kg1n@;JbKFD+66+?^iU/kg1n@;JbKFD+66$>FBqATAo.DeX)3:Msu_
DIlCV@:s-o@j#]-+Cd#qD..'g94`Ak4Wn/c8SqmKAP6T[$?'rqATAo&Gp$!r@;J>?FCbe.$49LA
F)u&5B2!5R@;JDICh7ZpF)c"Z3Zoh)+?CW!.11--Ch7*u+Cf>4DKI9].3N&?+AHQkF(oN)6Z-us
+Cd#iCgqO(:18!N/0JSGDfp#+@rH6p@<<nnDJX$)AP$`IB4XPHCh5.?-[[9j+CT=6:2`gE@ps1C
Bl%?'Ao_g,+AZlkBl7KRD..'g+CPUkDJj$++DPh/DBMMf@:s.;CgqO(=E5Nn+E)-?@P15h@:s.E
AU,C]+CQloD..'g94`AUBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA6#:"QD+eGc+?^iV/jX;_F_sc_
Gm\b/ATD?)@4k,g@:s.EAU,D9Dfd+9DBL?KASbpfF<F.l@:s.EAU,D1Ec5e;9Q+ELCe8JPB4WM!
B6%p5E$/V8+Cd#iCgqO(:18!N$?'rqATAo&Gp#gqF)u&5B1$QY+CT>$$7SbgCh[cu<H)bm@:V`=
ARfLN67s``DJX$)AQ<\cDdd0DBOt[h+EK+d+Cf(r@r!30E,9H$A0>JuCh7Z1AoD]4A9Dj-Bk(Rn
ATKI2:-pQ?:-pQU<+oue+EM%5BlJ/:F`V,8+EV:.+B)-2Blmo/A79Rg@UX=h+=M)@EcQ)=/nAE?
+EVNE@q]F`CER5-EXGQ./g+\IE,95u@<?''Anc'm+<YQ1D.Rc2+DG^9+CQB8;f-Yi9m((k+DG\$
B4W2.F`;/8@:UK'F*(i'Bl7Pj:-pQUA8-'q@ruX0GqKG!67rU?67sBP+EVmJBk(RfCj@.5DfBtE
@;Ka&Bl.9kATJt:8K`.pCi<`m+EVNE;f-Yi9m((kFDi:1DBO(@Ci<`m$;No?+Co2,ARfh#Ed98[
<+oue+EM76E,96#Bk;?.@UX@gBHVG:Ci<`mBl7Q++CT.u+DkP&ATJu.F<G.'F*S*f67sC&D]j(C
DBO">Dfd+3BOt[hF!+q'AoD^$+E_X>Ddd0jDJ(R/:-pQ?:-pQU;f-Yi9m((kF`V,8+<Y91Ch4_3
DIIBn+CT=6E,oZ0@<-W9CLqc6FDi9EE,oN5ASuT4F`;/8@:X(iB*qC#/g+\IE,95u@<?(%/g)99
BPDN1+EM%5BlJ/:+Cf(r@r$-.+EV:*F<D]7Cht50DJs`:+<Y91Ch7Z1+E)-):-pQU;f-Yi9m((k
F*)>@ARlotDBL?EBl\64E\:m3.3N/>+Du+>+Cf4rF(c\?Bln#2F*(i'ARloqBl%@%/db??/g*Q)
E,95u@<?(%+Cf>,E,95u@<?''D..NrBPD?s+E).6Bl7K)@;]TuDe<TtBl7K)Anc'mF"SS,F=2,:
:-pQUARTXoATAo8D]j+8D/a<:+DYP"E-!.DBPD?sF!,UCBlS9,/db??/db??/g,=KEaiI!Bl,m<
:-pQ?:-pQUBl8$(Eb8`iAKZ28Eb$S>.67f267sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g*r-Ch[cu
<H)bm@:V`=ARfKu/KeP:ARfLs+D,>(ATJu.DBO(@Ci<`m+Co2,ARfh#Ed8d>DfQt2F`;/2@psIj
F"Rep67rU?67sBjEb/[$ARmhE1,(FC9jr&r2%!)F/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:fbEHPu9
AKW@2@<>p2F)c#1FCcg,$=e!aCghC++=Bs&Ch[cu<H)bm@:V`=ARfL'<+pDk@WP7XEcQ)=:-pQ_
<+pDk@WP7XEcQ)=+<Y_W/Kc0PDdd0!+E2@8D..I1+<Yc>F_tT/E,9Z<+<Y<*Ci!['Bk;?.+D,Y4
D$j$)/g+)0F_=E_EcQ)=/db??/db??/g+,,BlbC>F(96)E-*3F+E_a:F!)TIBOr;/A79Rg@UX=h
+<VdTD/"$2DfRI@@OWEB+C]J-CigdB+C]U':-pQU-r"DrEc5u#Eb/i3+<Y9:Df$U>Anc'mF!)T>
DBL'DBOr;/-rXu*B2*)\Ec5tI+<Y3/Eb/a&DfTQ'EsbZ//g+YBCi!ZmFCeu*@X0(mH$!_<DBL?K
D09K1H$!V<.3N\AEbTK7F!)TID]g0CATMF)+B3#sD.7Q_Cise+:-pQUB45UmATDKrF!,17+<Yc>
AKW+7EbTB!Ed8cMA79Rg@UX=h/g+,,BlbD<@rc:&F<D]:AT23uA9/l3D@0-*/g+VAFD)d>FD,5.
+E2@8D..I1+<Yc>F_tT/+<Y3'FCAWeF(HI:@;]Tu+=M)@EcQ)=/nAE?+<Y-)Bl7Pj:-pQU@s)g4
ASuTB+<VduDBL'@@<-I(@s)TrEZcJI@;Ka&+D,>(ATJt:Bl5%9FD,5.+=L0*F_=E_EcQ)=.1/g:
/g+\=Eb/a&DfTQ'F!+n/A0<"'Cht5+Bl%@%+DG^9FD,5.+=M2C@ruj6ATK:C+Co2,ARfh#EbT*+
+E)-):-pQUFD,5.De<TtBl7K)E,oZ0@<-W9+CoM,G%Dd=D09oA+C\n)+EM%$DJj#r+DG^9<+pDk
@WP@^F`S[ID[K6+/g+kGF*2M7+CT)&+ED%*ATD@"@qB0nE+*j%F!+n/A0>T'@:s.m+CT;%+E2@4
F(K62/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQUBl8$(Eb8`iAKZ28Eb$S>.67f267sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/IG6>/g*i+@:W>NF_tT/9keWgDfS?VCi!['Bk;?./KekJ@:XF%E,oZ0@<-W9
FD,f6@WNZ+D..'g+Cno&@:EYdAKYi(EcQ)=+D5,!Ch7X$ATJ2R67rU?67sBjEb/[$ARmhE1,(FC
7V-$`3!rDI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$47,\AT;j,Eb-@@A79Rg06;,LBlmo6$4:9]@r,Rp
F!)i0BQ\0$F%p@hEc5tG$49Np/h1CCE+NotASuU2$;No?+=J]g4ZX]ZDdd0fA4L'ECh7X46Z7*b
FC0*/C`lDi@ps1QBQ\0$8Ru1LEGPtW67sa!DId9hE+NotASuU2$49IF@:Wq[7q$4MATE&`Dfor>
?ZU4'4ZX]60H`D!0I[?MASbpfF<G(3F`):L0e"5RF!+%k@:s.=DKIEP@P2P,D.OhuF!*t]Ci!['
Gp$^>Df$UrBQ\0$DII6q7q$4MATE&=@1$^dDImi2C2[g(+@fjVCh7X4+CZI3DBN@?Bk0_BCi!['
Gp#6m@P15_7q$4MATE&'B6%p5E$/V8+CQm:A4L'ECh7X4$7Q;h$;>AJ@;JnVF_tSZA7'CtCcsg%
-nlc)+>>5OF(K0!@rrhkARTCC@<?'3+CQloD..'g94`B"+Cd#iCgqO(94`B"+CQlrDe!3l<+pDk
@S&s=+Cm)jCgqO(:18!N+D,Y4D'2Mj@ps1FD..'g+CPUkDJj$++DPh/DBM_mCh[cu8SqmKAKYG)
Df-\,/kKngB4X_IGp#6m@4k,g@:s.EAU+VsDJj$++DPh/DBMMf@:s.;CgqO(=E5No+E)-?@kL>i
@:s.EAU,C]+CQloD..'g94`AUBl7g"EZf+8Bl5%ZCgqO(+ClU5DBNIB6#:"QD+eGc+?^iW/jX;_
F_sc_Gm\J1A7]d(@X0)+/jX;_F_sc_Gp$X/F(5P+$3                                ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkcI770^K9gg*q7R9C1=&2^^;bq:IBl7K^E,9H$A4($A@r!2\Ddd0BCgqO(
+AGF*;GU1k9gg+":/"5S79*/X:I.BF5u^At;GU(f=&2^^;bq:IBl7K^E,9H$A4($A@r!2d86&AN
;cZU\-RgSp4>8$7.4cl04?G0&0d%hd9keWgDfSs#AS*&\DJX$)AQ<\cDdd0DBOt[h+B3#sD.7Q\
Bl\64E[N:e-p01/0I\P$4>8$7.4cl01*AM$1,(FC0JkL=/i57A3AN?J2_lL20JPRA1bg^;1bggC
1Ggd@3?U(20f^pE0ek:;0JtRA1,([E+>PW*3A<9E0eP::0fV0P1cI971,(FC0JkL=/i5:<1,1IC
0f:(/0JPRA1bg^;1b^pI1GLjC2BXb/0f^pE0ek::3A`QQ2Dd3G+>PW*3A<9E0eP:<2D[<M2E3H7
1,(FC0JkL=/i5:>1G^jA1-$I40JPRA1bg^;1b^dA1bpaE1a"P-0f^pE0ek:;0JPRH0JPRH+>PW*
3A<9E0eP:;1,:R<3AEB61,(FC0JkL=/i57B2)?sH0K(%/0JPRA1bg^;1H@<L1,UdB2^p:+4>8$7
.4cl01*A@u1,(FC0JkL=/i5791bgpC1,^710JPRA1bg^;1b^mG2)R-F+>PW*3A<9E0eP7B0f1gE
1,9t-0JPRA1bg^;1b^U?0fLdA2BXb/0f^pE0ek:;0K:mH2)6s11,(FC0JkL=/i,LB1cI0F1+=b&
4>8$7.4cl00I/>$/1<V7.4cl00I\P$4>838-p014/3GT                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
