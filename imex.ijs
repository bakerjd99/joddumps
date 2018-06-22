NB. JOD dictionary dump: 22 Jun 2018 14:34:29
NB. Generated with JOD version; 0.9.996 - dev; 20; 19 Jun 2018 10:38:50
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|235160827908276492214978469319720955563|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


LocalFile_sql=:115 101 108 101 99 116 32 32 97 46 73 109 97 103 101 75 101 121 44 32 79 110 108 105 110 101 73 109 97 103 101 70 105 108 101 44 32 76 111 99 97 108 80 97 116 104 32 102 114 111 109 32 79 110 108 105 110 101 73 109 97 103 101 32 97 10 105 110 110 101 114 32 106 111 105 110 32 73 109 97 103 101 65 108 98 117 109 88 114 32 98 32 111 110 32 97 46 73 109 97 103 101 75 101 121 32 61 32 98 46 73 109 97 103 101 75 101 121 10 105 110 110 101 114 32 106 111 105 110 32 65 108 98 117 109 32 99 32 111 110 32 99 46 65 108 98 117 109 75 101 121 32 61 32 98 46 65 108 98 117 109 75 101 121 10 105 110 110 101 114 32 106 111 105 110 32 76 111 99 97 108 80 97 116 104 32 100 32 111 110 32 100 46 76 111 99 97 108 80 97 116 104 73 68 32 61 32 99 46 76 111 99 97 108 80 97 116 104 73 68 32 10 119 104 101 114 101 32 99 46 65 108 98 117 109 75 101 121 32 61 32 63 10 111 114 100 101 114 32 98 121 32 79 110 108 105 110 101 73 109 97 103 101 70 105 108 101 10{a.

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


LocalFileFrOnlineFile=:3 : 0

NB.*LocalFileFrOnlineFile v-- wordtext
NB.
NB. monad:  LocalFileFrOnlineFile ??
NB. dyad:  ?? LocalFileFrOnlineFile ??

'NIMP LocalFileFrOnlineFile'
)

LocalFilesFrOnlineFiles=:4 : 0

NB.*LocalFilesFrOnlineFiles v-- local file names from online keys
NB. and filenames.
NB.
NB. Local file names are derived from online  names  by prefixing
NB. the name with the image key, followed by a lower case base 36
NB. case mask, followed by the online file name.  All  blanks are
NB. replaced with hyphen '-' characters.
NB.
NB. dyad:  bclObj LocalFilesFrOnlineFiles clAlbumKey
NB.
NB.   db=. sqlopen_psqlite_ jpath '~/temp/mirror.db'
NB.   db LocalFilesFrOnlineFiles 'BFs8q4'

'invalid AlbumKey' assert 0 < #y
dat=. sqlparm__db LocalFile_sql;SQLITE_TEXT_psqlite_;y

NB. table columns !(*)=. ImageKey OnlineImageFile LocalPath
(;0{dat)=. ;1{dat

if. #ImageKey do.
  pfx=. '-' ,&.>~ ImageKey ,&.> <"1 '-' ,. b36fd #. (>ImageKey) e. 'abcdefghijklmnopqrstuvwxyz'
  LocalPath ,&.> '/' ,&.> pfx ,&.> ' -'&charsub&.> OnlineImageFile
else.
  0$<''
end.
)

LocalFrOnline=:4 : 0

NB.*LocalFrOnline v-- local file names from online keys
NB. and filenames.
NB.
NB. Local file names are derived from online  names  by prefixing
NB. the name with the image key, followed by a lower case base 36
NB. case mask, followed by the online file name.  All  blanks are
NB. replaced with hyphen '-' characters.
NB.
NB. dyad:  bclObj LocalFrOnline clAlbumKey
NB.
NB.   db=. sqlopen_psqlite_ jpath '~/temp/mirror.db'
NB.   db LocalFrOnline 'BFs8q4'

'invalid (AlbumKey)' assert 0 < #y
dat=. sqlparm__db LocalFile_sql;SQLITE_TEXT_psqlite_;y

NB. table columns !(*)=. ImageKey OnlineImageFile LocalPath
(;0{dat)=. ;1{dat

if. #ImageKey do.
  pfx=. '-' ,&.>~ ImageKey ,&.> <"1 '-' ,. b36fd #. (>ImageKey) e. 'abcdefghijklmnopqrstuvwxyz'
  LocalPath ,&.> '/' ,&.> pfx ,&.> ' -'&charsub&.> OnlineImageFile
else.
  0$<''
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o1E\S3+>P_q1cHO31E\M59Q+ELCdr,TARBLuCf3\k78cQL6Ua$YF)c"=@rGmh+E2.*
@qB=lCh.*t+>"^WARuu49keWgDfSs#AS*A6B6%p5E$/h*@:Wqi9Q+ELCdr,TATL=]:Msu_DIl:O
Ch7[(De!3l+D,>(AKYl!D.Rc2Ao_g,+E).6Bl7K)CLqd4+CT.u+D,>(AStpnATLO`@ps1CE_gRh
Bl7KuDe!3l+D,>(AKYl!D.Rc2Ao_g,+E).6Bl7K)CLqd4+CT.u+D,>(AStpnATI           ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' MirrorXref CR CreateMirrorXrefDb CreateMirror_sql IFACEWO'
zz=:zz,'RDSMirrorXref LF LoadAlbum LoadImageAlbumXr LoadImageKeywordXr Load'
zz=:zz,'LocalPath LoadMirrorXrefDb LoadOnlineImage LoadOnlineKeyword LocalF'
zz=:zz,'ile_sql LocalFrOnline MirrorImageXrTables ROOTWORDSMirrorXref RealD'
zz=:zz,'ateFrManifest afterlaststr afterstr allwhitetrim assert b36fd befor'
zz=:zz,'elaststr boxopen charsub fboxname fexist insqltd ofreq readtd2 reb '
zz=:zz,'tolower tslash2''),<(<''smugpyter''),<0$a:                            '
zz=:441{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`,20K;d@EcQ)==E7tb:-pQ_9keWgDfSs#AS*'+/M/)TEb/[$AKYE!A0>],@:UL%
EGT?2AKYi(EcQ)=+CfG1F)rIEAS,LoASu!h+Cno&@:EYdAM+E!:-pQB$;No?+Eh=:@UX@mD)r+5
:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sBSDdd0NBl\64E`d?nAjg)N/KekJ@:XF%DIn#7
D/"$2DfQt1Ec6#?+ED%*ATD@"@q?cn@<>pe@<5uh$;No?%15is/g+YEART[lA3(hg0JPP%F`&lk
%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++:SZQ67sB90JPP%F`&lk+D5_5F`8I5CghC++CfG'@<?'k
%13OOEb065Bl[c--Y-Y-@4u\ACh\!&-OgCl$;No?+Cf>"CghC++=BltEcQ)==E7tb-Qij*%15is
/h1CCE+NotASuU2%15is/g)Pl.6T^76ZQaHFCe0\EcQ)=?ZU4'%15is/h1FMA7T7jASu$iDKKq/
$4R>;67sC%@q]Fj@3BK#+Dkh5Ec5tNA7?Zl@<>pe@<6!&/Kf"@EcYf&+E)-?-T`[u@q]:k@:OCj
EX`@CEb/[$APHlZEc5u*F)c"Z3Zoh)+?CW!.1HVoEb/[$AKZ)'@VfTu9Q+ELCf"P^BFP:k+=Kp%
@ps1M@<?0S6m-2]FCf)rEZf7<F<GIDCht55EbTB!Ed8dCAU,g9$6UH69Q+ELCf"P^BHVD.G]Y'G
Dfd+>F_kkC3t2N+$=e*f@<?''FCAWpAKXcdCh[cu94`BmDfT@t$6UH>94`BmDfTA2FCf]=+Du+>
+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve"AU-acAT;j(DI[r7Bl8$(B4Z*+DJsV>DKTc3.6@tG+<Vd9
$=e*f@<?''FCAWpAKX9T@WcMs$6UH>6#:"QD+eGc+EV1>F<GI>F<GIDCht55EbTB!Ed8dCAU,g9
$6UH69Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1MEb0<'DKI"8DKKH&ATAo(
AS,@nCih'Z.4bo8+<Ve#@<6NjE+EC!ARloo@<?'3%144#+@0gQF_sl^D.Oi3AU&;J%144#+@0gQ
F_sNXF(96)E-,f4DBO%4G]YJG$6UH6AoD^$BkM<+CLqc>9Q+ELCf"P^BLtT@+ED%*ATD@"@qB^(
9Q+ELCh6FOFD*'rDe!3l:gnHZ8OP!V3t2N+$=e*f@<?''FCAWpAKXcdCh[cu8SqmKAISth+=Kfu
@:s.EAU,D?AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<XHtCh[cu8SqmKAO^BMAKZ)+G]YJG
$6UH69keWgDfSEd@:s.@Bl%?'FCf]=/.Dq/+<Wsj@q]S"ARnM'2'@!PG]YJG$6UH66#pIKBm+&u
;e^Ph+DG_8AS5Rp/.Dq/+<X?dFD5i>A7ZlqCi<a(/.Dq/+<X?rDJ*[*F_#&+Ao)BoF=[k.+<Vdm
CijB5F_#&+Bl8$(B4Z*7%144#+A[#lB5)6lCe/,OB4uB0Bl8$(B4Z*7%144#+A[#lB5)6lCfb=]
FD)e2DKKH&ATB=2$6UH6;Is9Q6t(1K+Cno&ALn8t+<Ve,E,9H$A40jJAKYMlFCd!4$6UH69OW!a
<H)JWFCeu*A79Rk/.Dq/+<X[)BcqM/G]YJG$6UH6<+pDk@W#UgCfPLl+EV1>F=[k.+<Ve"AU/K<
Eb'56FCf]=/.Dq/+<X$[E-,f4DBO%4G]YJG$6UH6AoD^$BkM<+CLqc>6#:"QD+eGc.3NYBAn?!o
DI[7!+@0gQF_rNmCgqO(94`At.6@tG%16TcART[l+EV%$Ch4_\D..'g6#:"QD-1ff$6UH>8SqmK
AP6T[+EV1>F<GI>F<GIDChtX3$6UH66#:"QD+eGc+EV1>F<GI>F<GIDChtXF%144#+E2@8D..I1
+DYP6-qS8aB4X_IGq:((CgqO(94`At/.Dq/+<Y97Eb/rtDBN_+Gpksp@WcN\AU,^IEb/ioEb0,u
ATJt[CgqO(-p_ZYF_sc_Gpt9R$6UH6AoD^$BkM<+CLqc>8SqmKAP6T[.3NYBAn?!oDI[7!+AZlk
Bl7KRD..'g-qS8aB4X_IGpt1(%13OO@rc-hFCcS:@:F%a+A$EYB4X_IH$=1IA6<j]$6UH>8SqmK
AP6T[+EV1>F<GI>F<GIDChtX3$6UH694`BmDfTA2FCf]=+Du+>+Du=<Cb-#&+<VeGEbTB!Ed8dC
AU,[qD..'g94`B"+A69kGAhM4.4bo8+<Ve=DfTE'B5Si-AU,[sAU/K<Eb$UAEb/ioEb0,uATJti
DJX$)AP6T[GAhM4-qe,sGAhM4.4bo8+<Ve=DfTE'B5Si-AU,[qD..'g94`At+ED%*ATD@"@qB^(
:Msu_DIlCV@:s."8SqmKAP6T[.4I=f$4R>PEb/[$AKZ)'@VfTu9Q+ELCe8JPB4VMZ+<W(+De!3l
8SqmKAP#94Bl8$(B4Z*+DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<X?r@ps1M@<?0S6m-2]FCf)r
EZf7<F<GIDChtX3$6UH69Q+ELCe8JPB4XPHCh4`2AU&;>DJsV>DKTc3/.Dq/+<X6m@:s.EAU,D?
AU&;J%144#+B3#sD.7Q\6o?*/AU&;J%144#+D,P4ASGdp+DYP6-qnPh@;JbKFD+66.3NYBAn?!o
DI[7!+A?]`@;KLO@<?029Q+ELCf"P^BLtT@.6@tG.1HUn$;No?+AP^3762Q5BOr<$+EMO=Blmo/
@:WneDBNY7+D,b;F*Sm:@W-C2+D>\;+EMO=+DGm>AoD^,@<?U&A1e;u:-pQU;KZkpBl7Q+F*(i.
A79Lh+EMO=+E2@4FEDdNE,oZ1FCfK6+E)9CBl7HmDKKT1B-;88C`mG0+F.mJEX`@N67sBm@<QR0
Blmo/F*)\DAKY].+Dbb-AScW7FDi:@Ec5K2@q?cmDe*E%FD,*)+CoD%F)E@I+EqaECG$&':-pQU
<+U,m+F.mJEZfFCC`m>1@:sFgDKKqBFDi:1G&M)*+EV:2F!)ZKBk(piH"(]1+X.@&9Q+ELCdr,T
ARBLuCcsg%-nlc)+>>5R$?KcpARfg)+CQloD..'g94`B"+AZlkBl7KRD..'g7VQ[M/0IW)@ps1M
@<?0*Ao_g,+AZlkBl7KRD..'g+CP]dBl7g"EZf+8Bl5%bD..'g6#:"QD-1g$@N]T,+CQloD..'g
94`Ak4Wn2d8SqmKAP6T[%16feDImi2C2[g(+@0gQF_r72+E)-?@kL&`@WcN\AU,C]+CZrhCgqO(
94`AX$>FBqATAo.DeX)39Q+ELCf"P^BHUh.Df-\./kg1n@;JbKFD+66+?^iW/kg1n@;JbKFD+66
+:S[%BOu3q+Cd#iCgqO(94`Ak4Wlru$?'rqATAo&Gp#n#Ch[cu8SqmKAO^BMAIStq         ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql*$@ps1CBl%?ME_gRhBl7KOBl%?'9Q+ELCdr,TARBLuC`lDi@ps1CBl%@%
7WM:BCh[cu7VQ[MF!+.p@ps1CE_gRhBl7K0.4cl00I/>$/1<VC4"akp+=A:+Bl\64E`d?nAfu/3
F_>Z=FCfJ?.4cl00I/>$/1<V7,VUYu-p07-1aFh10fUjF1,:I>2`!?G2Dm?H+>PW*3&!6G1+kFD
3&N]Q0fU:20JPO@2DR$?2)mNS2_m-E1E\G,0fUjF1,:I?0JGCA2E3QM+>PW*3&!6G1+kFD2E<`R
2`WT81,(FB0K([A/i>UJ2*!KJ3$9t10fUjF1,:I>3AWQP1c[BK+>PW*3&!6G1+kI=0K(aG3&NK@
/1<V7,VUYu-p07-1*eV/0fUjF1,:I>1bpjD1c%'K+>PW*3&!6G1+kF@1,1[F1Ggg/1,(FB0K([A
/iGC<2`WTH0fL410JPO@2DR$?2)I'C2E!?J0e"Y%4>8$7.4cl00I/>$/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
