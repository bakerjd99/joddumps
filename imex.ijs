NB. JOD dictionary dump: 23 Jul 2018 16:18:47
NB. Generated with JOD version; 0.9.996 - dev-f; 25; 10 Jul 2018 08:40:28
NB. J version: j807/j64/windows/beta-g/commercial/www.jsoftware.com/2018-07-02T18:14:50
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


LOCOMISS=:'locomiss.txt'

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

root=. 'c:/smugmirror/'

sdr=. root,'mirror'             NB. mirror directory
mrd=. root,'documents/xrefdb/'  NB. mirror database directory
trg=. mrd,MIRRORDB              NB. mirror db
bak=. mrd,'backup'              NB. mirror backup directory
dmp=. mrd,LOCOXREF              NB. online local pairs 
mcf=. mrd,MANLOCOXREF           NB. manual online local corrections
mli=. mrd,LOCOMISS              NB. missing local images report
src=. 'c:/thumbsdbs/primary2018.tpdb8s'  NB. thumbsplus db

if. y BackUpMirrorXrefDb mrd;bak do.
  smoutput LoadMirrorXrefDb sdr;src;trg;dmp;mcf;mli
else.
  smoutput 'no ',MIRRORDB,' build - backup issue(s)!'
end. 
)

DumpLocalImageNatural=:3 : 0

NB.*DumpLocalImageNatural v--  dump (LocalImage) as TAB delimited
NB. text.
NB.
NB. (LocalImage) is the only table  in (mirror.db) that  contains
NB. information  that  cannot  be  recreated  from  TAB delimited
NB. SmugMirror text files  and ThumbsPlus databases. (LocalImage)
NB. matches online images to local images. Many can be matched by
NB. file name  but many  require  tedious  human  inspection. The
NB. mapping is not one-to-one some online images, like panoramas,
NB. are  derived   from  many  local  images.  This  verb   dumps
NB. (LocalImage) in the  form or TAB delimited  natural keys that
NB. preserves the online local pairing in durable version control
NB. friendly form.
NB.
NB. monad:  bl =. DumpLocalImageNatural (clDumpFile ; clMirrorDb)
NB. 
NB.   dmp=. 'c:/smugmirror/documents/xrefdb/locoxref.txt'
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   DumpLocalImageNatural dmp;trg

'dmp trg'=. y
dt=. sqlopen_psqlite_ trg
oc=. sqlsize__dt 'OnlineImage'
ld=. sqldict__dt LocalOnlineFile_sql
rc=. sqlclose__dt ''

NB. box unboxed columns and format as char
hd=. 0 {"1 ld [ td=. 1 {"1 ld
pos=. I. 0 = L.&> td
td=. (":L:0(<"0)&.>pos{td) pos} td
td=. |: >td

NB. write as TAB delimited file
(hd,td) writetd2 dmp

NB. number of distinct local images
utd=. # ~. (hd i. <'ImageKey') {"1 td

NB. unique match percentage below should equal this result
NB. %/;(#&> > 1{sqlread__dt 'select distinct ImageKey from LocalImage');sqlsize__dt 'OnlineImage'

NB. record count; unique match percentage; file
(#td);(100 * utd%oc);dmp
)

sizekey=:3 : 0

NB.*sizekey v-- size key from image dimensions.
NB.
NB. monad:  st =. sizekey ilWidthHeight | itWidthHeight
NB.
NB.   sizekey 1544 2501
NB.   sizekey 5 #"1 ,. 1544 2501
NB.   sizekey 2000 2000 ,: 3000 3000
NB.
NB. dyad:  st =. iaDpi printsizekey btclManifest
NB.
NB.   720 sizekey 4000 6000
NB.   720 sizekey |: 2000 # ,: 4000 6000

SMUGPRINTDPI sizekey y
:
'invalid image dimensions' assert (2 = #y) , 0 < ,y

NB. default print size keys
'area ratio'=. (SMUGASPECTROUND,SMUGAREAROUND,x) dpiarearatio y 
keys=. (#ratio) # s: <NORATIOKEY

NB. print sizes for image ratios
pst=.  SMUGASPECTROUND printsizestable SMUGPYTERSIZES
ast=.  ;0{"1 pst
m0=.   ratio e. ast
idx=.  (ast i. ratio) -. #ast
pst=.  idx { pst

NB. images without enough pixels
area=. <"0 m0 # area
m1=.   (1 {"1 pst) <&.> area
m2=.   +./&> m1
keys=. (s: <NOPIXELSKEY) (I. m0 #^:_1 -. m2)} keys

NB. largest print sizes for enough pixels
sizes=. ,(I.@lastones&.> m2#m1) {&> 2 {"1 m2#pst
sizes(I. m0 #^:_1 m2)} keys
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1".+>P&o0d&5/+?1K"2*uG"Ch-7SEcQ)=@UWb^F`9!DEb/[$AM7k<@:UKtBl\64E_K7r:JFDZ
;f6#\AKYo'+Dkh6F(oN)+Dbt+@;I'#D..'gF!,L7E,Tc=                             ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' MirrorXref BackUpMirrorXrefDb BuildMirror CR CreateMirror'
zz=:zz,'XrefDb CreateMirror_sql DumpLocalImageNatural IFACEWORDSMirrorXref '
zz=:zz,'LF LOCOMISS LOCOXREF LoadAlbum LoadImageAlbumXr LoadImageKeywordXr '
zz=:zz,'LoadLocalPath LoadMirrorXrefDb LoadOnlineImage LoadOnlineKeyword Lo'
zz=:zz,'calFile_sql LocalFrOnline LocalOnlineFile_sql MACROSMirrorXref MANL'
zz=:zz,'OCOXREF MIRRORDB MIRRORHEAD MatchManual MatchOnlineLocal MatchOnlin'
zz=:zz,'eNoBrackets MirrorImageXrTables MissingImagesReport MissingLocalFil'
zz=:zz,'es_sql ROOTWORDSMirrorXref RealDateFrManifest UpdateLocalPresent Up'
zz=:zz,'dateLocalPresent_sql afterlaststr afterstr alltrim allwhitetrim ass'
zz=:zz,'ert b36casemask b36fd beforelaststr beforestr boxopen changestr cha'
zz=:zz,'rsub ctl fboxname ferase fexist insqltd justfile ofreq portchars qu'
zz=:zz,'ote read readtd2 reb smoutput toCRLF toHOST toJ tolower tslash2 wri'
zz=:zz,'te writetd2 yyyymondd''                                             '
zz=:826{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`/33&43BEcQ)==E7tb%15is/h0S0EcQ)==E7tb+EK+d+CfG'@<?''@;]TuCi<`m
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
2]sMCBle?0DJ)OX@:s.m;IsfcEc``Q@:Wn[A.8kT$?B]tF_Pl-+=C].FC?hDEGT?2AL@oo%16T`
@r,RpF!)i)Bl\64E`d?nAg\]1$4R>;67s`uAT23uA7]Y#Et&IO67sB/.OdMA+@C0\@<?'TBl\64
EaNm-C`lDi@ps1CBl%?fF)c"=<H)JWFCe-a@ps1MEb0<'DKK6,EGQakDe!3l:Msu_DIl:OCh6sp
EGQ'k:-pQU-n6Z/3Zq.2F)u&5B2!5R@;JDICh7ZpF)c"*$;No?.V3L.A7]^kDId<rFE7lu%15is
/g,4FBOu$h+E(j7D/"$2DfRI@@N]2iFCAWeF(HIG+E1b0F(Jl)Df-[F4!u.\BOPpi@ru:&%15IC
ART[l9keWgDfT3+EGRd!+=Jod3Zp+*%16TcART[l+EV%$Ch4__De!3l:gnHZ%144#-qnPh@;JbK
FD+66+DG_8AS5Rp+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve#De!3l:gnHZ+EV1>F<GI>F<GID
ChtO^%13OO@rc-hFCcS:@:F%a+AZlkBl7KTAU/K<Eb#Ud+<W(*AU/K<Eb$;7AU&;>DJsV>DKTc3
+E2@8D..I1+DYP6/.Dq/+<X<gGt)gcEHPi1@sK22DKKH&ATAo2Dfd+>F_kkC3t2N>+<V+#@rc-h
FCcS:@:F%a+@0gQF_qQp+<W'uCgqO(94`AkFCf]=+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve#
De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`@;Jb\ATMF#F<G:8FCf)rEZek*ARfL(
9Q+ELCf#.`F(K624ZtJADfQsoDe!3l:i^,gASuTQ4Y\B:%144#+A?3bFB*9j@<?'k+Cno&ALn8t
+<VdmCgqO(:18!N+EV1>F=[k.+<VdmCgqO(6tLFLEbTK7Bl@l3FCf]=/.Dq/+<Y97Eb/rtDBN_+
Gpl@)@ps1M@<?0S6n'7!AS,LoASu!hF!+.p@ps1b:gnHZ-qnPh@;JbKFD+66.4I=f$4R>PEb/[$
AKZ)'@VfTu:Msu_DIlCV@:s-\$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDCht55EbTB!Ed8dCAU,g9
$6UH6:Msu_DIlCV@:s.@Bl%?'FCf]=/.Dq/+<Wsj@q]S"ARnM'2'@!PG]YJG$6UH66#pIKBm+&u
;e^Ph+DG_8AS5Rp/.Dq/+<X?dFD5i>A7ZlqCi<a(/.Dq/+<X?rDJ*[*F_#&+Ao)BoF=[k.+<Vdm
CijB5F_#&+Bl8$(B4Z*7%144#+A[#lB5)6lCe/,OB4uB0Bl8$(B4Z*7%144#+A[#lB5)6lCfb=]
FD)e2DKKH&ATB=2$6UH6;Is9Q6t(1K+Cno&ALn8t+<Ve,E,9H$A40jJAKYMlFCd!4$6UH69OW!a
<H)JWFCeu*A79Rk/.Dq/+<X[)BcqM/G]YJG$6UH6<+pDk@W#UgCfPLl+EV1>F=[k.+<Ve"AU/K<
Eb'56FCf]=/.Dq/+<X$[E-,f4DBO%4G]YAr%13OO@rc-hFCcS:@:F%a+A$EYB4XAF@WcNiEX`?u
+=Kfu@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<Wsd@WcN\AU,D?AU&;>DJsV>DKTc3/0GB/+<VeG
EbTB!Ed8dCAU,[qD..'g94`B"+@0gQF_sc_Gpt9R$6UH6AoD^$BkM<+CLqc>6#:"QD+eGc.3NYB
An?!oDI[7!+@0gQF_rNmCgqO(94`At/.Dq/+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^IEb/ioEb0,u
ATJtiDJX$)AP$`IB4WJ_D..'g94`At.6@tG%16TcART[l+EV%$Ch4_\D..'g94`BmDfTAjEX`?u
+=Kfu@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<X<gH$=1IA0>u*G]Y'GDfd+>F_kkF%144#+E2@8
D..I1+DYP6-qS8aB4X_IGq:(2AU/K<Eb$UM%144#+D,P4ASGdp+DYP6-qe,sGAhM4.3NYBAn?!o
DI[7!+AZlkBl7KTAU/K<Eb$RkAU/K<Eb$UM%144#+D,P4ASGdp+DYP6-qS8aB4X_IGpskVAS,Lo
ASu!hF!+7rCh[cu8SqmKALL,e@:s.EAU,^R3t2N+$=e*f@<?''FCAWpAKXZb@ps1FD..'g%144#
-qnPh@;JMP@:s.C6m-2]FCf)rEZf7<F<GIDCht55EbTB!Ed8dCAU,D,F`_P9DI[]uD.RU,/.Dq/
+<X?r@ps1QBQ\0$8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`@;JbKFD+66+DG_8AS5Rp+Du+>
+Du=<Cb-#&+<Ve#De!3l8SqmKAO^BMAKZ)+G]Y'GDfd+>F_kkF%144#+A$EYB4X_IGp%3?G]Y'G
Dfd+>F_kkF%144#+D,P4ASGdp+DYP6-qnPh@;JbKFD+66.3NYBAn?!oDI[7!+A?]`@;KLO@<?02
9Q+ELCf"P^BLtT@/.Dq/+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`I
B4WJ_D..'g94`At.6@tG.1HUn$;No?+AP^3762Q5BOr<$+EMO=Blmo/@:WneDBNY7+D,b;F*Sm:
@W-C2+D>\;+EMO=+DGm>AoD^,@<?U&A1e;u:-pQU;KZkpBl7Q+F*(i.A79Lh+EMO=+E2@4FEDdN
E,oZ1FCfK6+E)9CBl7HmDKKT1B-;88C`mG0+F.mJEX`@N67sBm@<QR0Blmo/F*)\DAKY].+Dbb-
AScW7FDi:@Ec5K2@q?cmDe*E%FD,*)+CoD%F)E@I+EqaECG$&':-pQU<+U,m+F.mJEZfFCC`m>1
@:sFgDKKqBFDi:1G&M)*+EV:2F!)ZKBk(piH"(]1+X.@&9Q+ELCdr,TARBLuCcsg%-nlc)+>>5R
$?KcpARfg)+CQloD..'g94`B"+AZlkBl7KRD..'g7VQ[M/0IW)@ps1M@<?0*Ao_g,+AZlkBl7KR
D..'g+CP]dBl7g"EZf+8Bl5%bD..'g6#:"QD-1g$@N]T,+CQloD..'g94`Ak4Wn2d8SqmKAP6T[
%16feDImi2C2[g(+@0gQF_r72+E)-?@kL&`@WcN\AU,C]+CZrhCgqO(94`AX$>FBqATAo.DeX)3
9Q+ELCf"P^BHUh.Df-\./kg1n@;JbKFD+66+?^iW/kg1n@;JbKFD+66+:S[%BOu3q+Cd#iCgqO(
94`Ak4Wlru$?'rqATAo&Gp#n#Ch[cu8SqmKAO^BMAIStq%13OO<H)JWFCe-a@ps1MEb0<'DKK6,
EGRd!+=D;NA79Rk+@0gQF_r7BATT%gDe!3l:i^,gASuT44WlI%GA(Q.AKX9T@WcN\AU,D4DBL;9
$4R>9De!3l:Msu_DIl:OCh6spEGRd!+=Jod3Zp+*%17/fCh7*u+AucZCd_]RALns6/kKngB4X_I
Gq:(3De!3l<+pDk@S&s=+CZrsDe!3l:gnHZ8OP*P9Q+ELCf"P^BIk9"De!3l8SqmKAO^BMALns"
DJX$)AP$`IB4XPHCh4`$Ec5e;9Q+ELCe8JPB4W2o+:SZlDJj$++DPh/DBMVk@ps1M@<?0*@N]T,
+CZrsDe!3l:gnHZ8OO[a+CQlrDe!3l:gnHZ8OO[1$>FBqATAo.DeX)3:Msu_DIlCV@:s-o@j#]-
+Cd#qD..'g94`Ak4Wn/c8SqmKAP6T[+:SZrEb&a%+C]U=;Is9Q6t(1K%14Nn$4R>:Ble?0DJ)X]
@ps1CBl%@%?ZU4'4ZX]60H`D!0I[G<F(K0!@rri'Dfor>-o!.n@<3PcBle?0DJ)=SF=\PE/jX;_
F_sl^D.P7@B6%p5E*m*nDI[*s-r4_sBl7KRD..'g7VQ[M/0H<f-Rg0HF!+4r9Q+ELCdr,TAKYT*
Df$UmDJX$)AP$`IB4W2o%16feDImi2C2[g(+A$EYB4XAF@WcNiEZeg6Df-\,/kKngB4X_IGp#6m
@4k,g@:s.EAU+^lBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA6#:"QD+eGc+?^iV/jX;_F_sc_Gmt+)
BOu3q+CQloD..'g94`AkDJsV>Bl5%AF(K0!@rrhbD..'g94`AkAo_g,+A?]`@;JMP@:s.#%16`g
Dfp"A@X0)+/jX;_F_sl^D.O.`DfTB"EZeh:+AHQkF(oN)6Z-ug@<5of$7P                ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`uBl%<SBl\64EZdbmD/`0e@ps1FD..'g:186eEa`c,9M\#O9hA8^+EM7C
ASYk&-RgSp4>8$7.4cl0/3G:SBl\64E`d?nAg]#Y-p01/0I\P$4>8$7.4cl01*AD!1,(FB0K1a@
/i,CB0ebUD3B&'90JPO@2_m0A1c@-H1cI0G2BXb/0fUjG1,(=:2Dm6E3&<Q;1,(FB0K1aC/iGXK
2D?jE2)ud70JPO@2_m'>1H%-J2_m-E1E\G,0fUjG1,CO>2`3<K0JG18+>PW*3&!9H0J5.>2)6mG
1H?R50JPO@2_m0A2E*WS0JPLD3@QL-4>8$7.4cl01,(FB0K1a@/i,CF1GUpJ1c?jk1,(FB0K1^G
/i,CF1GUpJ1c?gt/hnJ(.4cl00I/>$/1<V7,VUYu-p014/1<V7.4cl00e"Y%4>8384>6      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
