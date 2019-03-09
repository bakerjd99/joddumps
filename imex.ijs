NB. JOD dictionary dump:  9 Mar 2019 12:57:04
NB. Generated with JOD version; 0.9.998; 22; 14 Feb 2019 22:32:19
NB. J version: j807/j64/windows/release-c/commercial/www.jsoftware.com/2019-02-24T11:18:30
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|271689481030790805811266787428045802682|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


ONLINEUPLOADPATH=:'c:/pictures/00 online upload'

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

NB.*LocalFromDir v-- local files with directory match (y) and file match (x).
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

putbat=:3 : 0

NB.*putbat v-- store bat scripts as JOD text macros.
NB.
NB. monad:  putbat clFile
NB. dyad: clPath putbat clFile

NB. !(*)=. jpath
(jpath '~temp/') putbat y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'bat file does not exist' assert fexist file
'file is not bat' assert 'bat' -: tolower justext file
batname=. (justfile winpathsep file),'_bat'
bat=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod__ajod_ TEXT_ajod_
MACRO_ajod_ put batname;TEXT_ajod_;bat
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;++>Pf@F_PZ&9keWgDfT;q@r$4+04T$6@<?'6Ci<`m+Dkh5Ec5s~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,L+0+>P&o0H`512BX_/+>l):+>GSn2)I7$F_PZ&@q]F`CJI2K.UmO7Ch.$hARfKuF=f'e@WcC$
A0<9pBl\64E`d?nAgnj2DIal#BleB:Bju4,AM+E!:-pQB$;No?+CfG'@<?'k3Zp130fa)ZE\K?[
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$4R=O$=e!aCghC++EVI>Ci<fj5s[eGF_PZ&3B9*,4ZX]55s[eGF_PZ&3B9)I+Bosu
De3rtF(HIV-UC$a@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%159QHV[I,:..Z@4ZX]rBk/>?
+<V+#%159QHZ*F;4$"a'D.Rr7F)?&4E-ZP:EZfLHBl%i<+BosE+E(d5-RT?14tq>#Bl\64E]H-?
Anc'm4ZX^&Ci^^H:Msu_DIlgeCi<`m6YL%@CF9Pu0d'[C-urm-A0<s\3c/SOEc5tY3B:\cCh5%<
GB.D>AKW@13\PPkF_>Q*EcQ)=04]!2F_t]-FE9*[Eb/in@P:MpCh[cu<H)bm@:V`=ARfL.Bkh]:
%13OO@rGk"EcP`/F<G[BE,9H&?U6tD@WcC$A2uY1?O[?+0RI_K+FPjb:JaJT6qK`g>9G^EDe't<
-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\t&Bl%<?3B:FU$=\-lCh.Bs
EcQ)=:-pQ_@WcC$A8Q%$Ec5t@F=f'e@WcC$A0<9pBl\64E`d?nAgnj2DIal#BleB:Bju4,AM+E!
:-pQB$;No?+CfG'@<?'k3Zp130fWojCb[[S$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PW*3G)i31,g=rF`&=9DBN\:
DJLA2De!3lAIStU$4R>PDe!TlF)rIGD/a<0@p_Mf6"4tNCh,Od3F=p1+=BH@6"4tNCh,Od3@>qR
+Cf>$Eaa$#+?V#;5s\t&Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO4tq=Z:dn,I8OGX%+Co1s
+>=o\%13OO4tq>%A0<rp-Y[F/GT_'EF_>Z=FCfJ8F`_>6F!i)7+>Y-YA0<6I%159QHYmJ;Ec5tY
3B:\cCh5aj+Dkq9+=BltEcQ)==E7tb-OgD;+Bos:Eb/Zi+?Op2D/"$2DfRiu3G)uAALSaGEbTW,
+=CY[06:uQB5M@'Ec5tOA8bt#D.RU,F"_cYAS,I^026/$Ec5u#Eb/i8Bkh]:%13OO@rGk"EcP`/
F<G[BE,9H&?U6tD@WcC$A2uY1?O[?+0RI_K+FPjb:JaJT6qK`g>9G^EDe't<-OgCl$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\t&Bl%<?3B:FU$=\-lCh.X$F_tT/:-pQ_@WcC$
A9;L-D.7Q/F=f'e@WcC$A0<:"BQ\0$F%p@hEc5tI+CT.u+Co2-FE2))F`_1I%15is/e&._67sBj
Eb/[$ARmhE1,(FCAn>F,2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aCghC++EVI>Ci<fj5s[eGF_PZ&3B9*,4ZX]5
5s[eGF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%159Q
HV[I,:..Z@4ZX]rBk/>?+<V+#%159QHZ*F;4$"a'D.Rr7F)?&4E-ZP:EZfLHBl%i<+BosE+E(d5
-RT?14tq>*BQ\0$F#c6@Anc'm4ZX^&Ci^^H<+pDk@WP7XEcQ)=-OgD;+Bos:Eb/Zi+?Op2FD,f6
@WOOi3G)uAALSaGEbTW,+=CY[06:uQB5M@'Ec5tOA8bt#D.RU,F"_cYAS,I^02uV-D.7Q\Bl\64
E\;'@F!hD(%16T`@s)g4ASuT4FDYu5De!-?5s\t&Bl%<?3B:FU$9g.jDe'u=/g*qd78?6B6QfSU
1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@WcC$A2uY1?O[>~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ud;+>Y,p2'=Xs3&*950f:(/+>Pi/1E\D2+>P&p0f(^10eje++?),8+>Gl!1*AP72BX_3+>P'!
2)o&fBl%<sBl\64EaN9aF>>^b@q]d'De<Sj$?U!(Ch4_eF`))2DJ()/Bl\64E\:m3+C]J-Ch+Y@
/hRS?E-658A.8leATVa,@ps0_$4R>_ASiQ3ATMr9E,oN2ASu!h+E(j7;c-5&FCcS'A7TUr+C]&&
@<-W&$>F)pDJsV>AU%p1F<Eq3>\Z/R>\Z/R/N>FC>[_/RDf0W$A79Rg>]Xn$BlmokCh[?`Ch[?n
F)c#1FCd6\A8H')B5_m1+@UNbAT2a*Df.6_%13OOEb0)1F(KG9F(96)E-*46G\(B-FCAWpAKYT*
Df$V<FCB&t@<,m$Ci<flFD5Z2Et&IjAftZ0BleA=@ldk02DeZR2Dd!F0K36GBl70j@rH7+Deru;
AU%c/F(KG9C1VX$4_$NXC,RnRC,Rn#3&!9r@VK^bC1D1"F)Pl++>%>L+:SZlAfr9DC1VX$,pFHp
4Wkpm+D5V7D]hJn@qBV$Bl@lC0b"I!$?B]p+EM+9+AHQjEc5u#Eb/i*8g&1bEbTK7%17/fF<G=>
@ra^V0HiJ24==W"02l_1B2*)\Ec5tO6uQRXD.RU,F"^X9AS+>>026/$Ec5u#Eb/i8Bkh]:+q4kg
$?B]p+C\bhCNXS=@;]Tu@WcC$A0>`'EcQ)=/nAE#$70FuG\&0D-#.L2E[;hP6?R!YA5-cYEc5t@
0d7_aAU%p2+>=uK$?U!(Ch4`+Bl\64E\:m3+C]J-Ch+YuDf'H0ATVK,%16`dFDi:$BOsVMA.8kT
$9CV#@qBV$Bl@lC0F\A#@q]d'78d#Z;E>q!;+t\GAKXSf@:WneDBND&DIIR2+Du+>+D,P7DIa1`
FD5i5AKYi(EcQ)=/nAE6@WcC$A0>;iASu$iA0DBhB5_m1+B3#c7;cWF$4R>'7<i<RE-,f4DD3dS
$>!^\D]hJH;GU1O+DPD)DKB`4AM.P=AKYl/F<G16F`(_!$?U!(Ch4`+Bl\64E\:m3+C]J-Ch+Ys
@V'FfARlqn$>4:!D]i"mAOUKI%13OO3`Kd(7;cWF$>"*cCi<flC^g_jDfB4r$?0ErF(K2sDJX6$
Dg6;6Am]Y)F>>^IDe!3l:gnHZ#u#8I@;JMP@:s.@Bl%>e:Msu_DIlCV@:s.@Bl%>i$?0]hFEMV8
F"]:&<(KAF:/k4k=YE^!Ea`I#F(GYpAKZ&>Ea`I#F(HJ&E+*d/D.RU,+>Gl:1+mZ_AdN<c+EMgK
@:OG$AKYE#@<-I,ASuT40f_6L/N,4rE+]UeE+rg(F`M&70/>492_Ra5@;'QcE,9)oF*2M7+EVNE
D.R-t+F.mJ+>PQkBk@ZjCh7$rF`M%9FDi:=ART['H#IgXC2dep$?0]hFEMV8F"]:&<(KAF:/k4k
=YET_DfBN($#!mdASrW"F`M#,@r!3"Ea`irD/XN0ATAo&@:FL)0f^pC+>PQkBk@ZbASbpq+C]J6
A8,Oh+D5_'DIdU&FD,6++C\bgGp"h%0JY7qE+]UeE+rg(F`M&70/>492_Ra5@;'QcE+Ns,Ch4`#
@r,juF(HJ5Ec5Q(Ch7Z1D.-pi@<itN/p(f>$#jHoE,9).ARfOjE-#S5E,ol/Bl%@%+DkOsCLMK@
C2dep$?0]hFEMV8F"]:&0f:UYBle?6F`M1&A79Lo+D#h0+D5CsDKI"BFCB96AM/(=AdN-hCi"$6
+D5V/A7]X$B5(dlF<GXH@<?X'/o#?<%17&g@ruj6ATKL[0JPI=9lFok@;]K[7Vm3cEb0<%Bl7Q+
@rcj9FCB!,+Dl%7FCB&q+EV1)BHV/+DImisC`mS;F(KK2/p(f>$"e!rDfTE1@qfgn+CfG;F*(i,
F!,=<DKK<)@3BZ'@q[!%Bl7L&@;I''F`V,:D(]RBB+52eBk)7-Eb0;F1,(F@026A&FCB&q$#j<e
DKI"?Dfd+@Bl7K60eRQ^AdNEbBl8#8E,Th@E+s3$/o#?<%17&g@ruj6ATKL[0JPF<=(QGpATDZ2
<,u\l$"RUjBl%i5FDlA7EZeh&A0>?%ART@d@<6NCFD5=nA7]puCi^_@Dg,c5+C\nm+C]A&@;BI`
F*&ug/o#?<%17&g@ruj6ATKL[0JPF<=(QGpATDZ2<,u\l0/,@m@<H39Bi&J]DIl^SG6q)ZDffn?
6$6f_0fCR*3?U18+>GYp5trIM0e"_iE+]JoAKYr*Dffo1Ea`p#Bl7Q+D..9uDffY8F(o`-/o#?<
%17&g@ruj6ATKL[0JGL?8TJugDIjr4D]hA_F_56-Df,kiEcbl6Bji-&Bl"o9DfTW)EcW@EFCB96
AKY2u2)$sD3&!?O2I.qWBk@Z[FCfN-@3BK&C`mq?Ebf6,F!,OG@<?X'/o#?<%17&g@ruj6ATKL[
0JPF<:1\Vl9kAQ`@rF"T0OJa.F9u;B;aWDs1H$j\77IT#@;0U%FCB*/+E2I7@Vfs8C2dep$?0]h
FEMV8F"]:&0f:UZATo7kAU%p!D_Eh!?Z0Fr$"$)!6T$SS2(hWm7L<p?Bl5&8@;g30E-5`$Ci:q@
E+]UeE+rg(F`M&70/>492D7g:G9BUkG\LZ+0/,7jD..\r?URg[2)mQO/l"i)$$1$-FD)e?Bk;K2
F),J4@UX=lDBNt<@:UKsDf9E0F`]6NE+]UeE+rg(F`M&70/>483A4<JDeip0+AHcsDKK<$DK?q"
EbTJG0em$QDfuFo6rQH/0fV'D:.7VYD..6p+CT@7@VKY#D/XH+/o#?<%17&g@ruj6ATKL[0N:S1
78?f^;HYYLAT)O(AI2dZCh70q+C\o&DJ<Tl+C\bpATAo'Ed;A:B-:Yl@X0(N3Ai]IFD5=n@;0Oh
ASrW"ATD[&@q?cmEd;A:B-:Yl@X0(N3Ai]IC2dep$?0]hFEMV8F"]:&0KCdXDIdHiDIG1P11+X)
@L6C0;aW5q0f^j]77IT&DfTW'BQ%iBC2dep$?0]hFEMV8F"_'BGA_58@:Wq[$#OBoDJ<Z)@WHC/
BOu3,FE_;6FEoHZAThX&0f^sH+C\noDfTD3@:jUmE\;*GB*iEhDJj0"+C]A0FD,6++EVg=DKL/F
AThX&+>Gl22BZI?AoD^$+CSl(ATBD<E+]UeE+rg(F`M&70/>492(q[<F)u8BEbPhhF_tT(AKYGn
AKYi4A0>Q.F<GX<@<Wi7ATMF'G%E:JBk@Z\F_tT(AKYGnAKYi4A0>Q.F<GX<@<Wi7ATMF'G%E6[
/MSkmE+]UeE+rg(F`M&70/>492(q[<F)u8BEbR0\2IC3AD@'Z<;aW?!1bp[Y77IT#@;KX#D/"'4
Dfp)7+Cei!Bln90+D5_5F`(`2/o#?<%17&g@ruj6ATKL[0JPF<9keZiDfp)70/,7jD..\r?URg[
1GppG/l"i)$#Ofq+D>n>+CoD/EZfR?DId[0/o#?<%17&g@ruj6ATKL[0JPF<9keZiDfp)70/,:k
C3=D#?URg[1H.*E/l"i)$$0ooAT2o;B5_g)Ci!N&@V&tjFEoKRE+]UeE+CV2Ci<r>GAo<R@<?(*
055<6Cisf5Df0V&@q]FpFCfK)Bk;*k/SB?G/Q49:E+]JeBOu7,ATDBsASbm"B6e>HC2dep$?0]h
FEMV8F"]:&<(KAF:/k4k=YE<SH=^nYCgqO($"7XZATDm$+ED=/+E;O8ASrVpF#5g41c.3I1HA_n
FD5=n@;KCaEcb_4Ec#;/EHPi(DD#[CB+52eBk)7-Eb0;F1,)Zu6UaaL<DlsQ87?gUCdDlHF_qFr
G%GK8DBNA(@V'S%@3BN'DIjr#Eb/ft+>Gl50QS@@F"oX72`*EO1,:Uj/p(f>$"\9kCjBn@@;KCa
Ecb_4E+s3$+CfG'ASWDC3A`F2/o#?<%17&g@ruj6ATKL[0N:S178?f^;HYYD@<uL$6#:"QD$afp
@;]j'F*(u:AKYQ-AScX0+>Gl73?VOI1,V!L1bgsK1H/SlFD5=nAo_<tCER\?AThW-AThX$H#=`Z
3ArlMC2dep$?0]hFEMV8F"]:&<(KAF:/k4k=YE<SH=^nYCgqO($"n9i@<<W)Ea`irD.+Q-@<Q4&
+EqOABHVA1F*(u6+DkP0A7Zl<3AiL3+BrnD2`3?J1,:aD>qU55AdN*jART['B6%EuA8P`tEaa-&
EZfR?FD)e<BleB-EZf4-F_#&+0f_*FF"V3HB+52eBk)7-Eb0;F1,)Zu6UaaL<DlsQ87?gUCdDlH
F_qG%AKYDqCh70q+Cf>4@qZu>3Aic=>B;YX2`*EN2E*R#/p(f>$#O5r@;0OhASrW#DfoQ'+>Gl6
3%erbB+52eBk)7-Eb0;F1,)Zu6UaaL<DlsQ87?gUCdDlHF_qG'Ea^)!DIakuCgpsrFC?:rF##X.
1c79J1cRC!/p(f>$#aim+CT.u+CT(qATDm$/o#?<%16rdEcQ)=?YF.pFDl2F?Ys=/2[p+2Bl\64
EZcqV@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5%3
3B9&A/KdbrEarc*2(Tk*0JPQs$4R=b.Ni,9Bl\64E\:m3?m'K$CghEsA0>i3DeF*!D0$h.Eb-A2
Dg*=6Df'H0AU#>/DJsZ1BFP:k+<Y*1A0>T'E,Tc=@;^00ASuF/B4rE0D]in.EbTV<@V'Y'ATAo,
BleB7Ed8dLEa`HnBl7Q9%144#+:SZ#+<XWsAKYT'Ci"$6Bl7Q+@q]:gB4Z-,BOQ'q+C\nnDBND"
ASrW-@:Wq%%144#+:SZ#+<WBk+@0lfDf0B*DIjr5E,9H$A0>AqARfKuAoD]4A9Dj-Bk(RnAKYT!
Ch4`,@;TRs+D>2)+C\nnDBN@uA7]:(%144#+<VdL.TC(m+D,>(AKYl!D.Oi(F!+m6DIIX0Ea`c,
CLqc6AoD]4;f-Yi9m((k@:NecF`);B/h.uCBOr</E,9H$A.8kP+<VeLFD5Q*FEo!MCM@a/+CoV6
Ch[BfFCfM9GA(Q*+Dbt)A8,po+DG_8D]iI2B5)O#DBNS#Ci!['Gp$R=F:AQ`+<Vdu+D>2,AKZ&*
ASrW$F`;/2@psIjF!,[?ASrW3@ps7mBl7Q+Anc'mF!+n$Ec6#?+CT)&+D5,!Ch7X$ATKI5$4.gt
+A$YtF(oK1Ch[KqATJu%D/"$2DfRI@@UL<tEc5H!F)u&5B-:o#+E).6Bl7K)Anc'm+DtV)ATJu&
Eb-A9DJ=*5AM+E!#p:?5@!-F)Ddd0dBOt[h/n/72?m&rmARfLs+E_X>Ddd0t+D,P4+CoV6Ch[Bf
FCfMG%13Ca+:SZ#+<WEl+A!\h@<Q3)D/Ws!Anbge+CJ/^F_tT/9keWgDfRIEC3*c*FDi:3BOt[h
+D,P4+EV:.+E2@4F(K6!AKYo'%144#+<VdL@3BZ'F*&OJATDj+Df-\9Afu2/AKXoK9PJT[+B3#s
D.7R*CiseAE,oZ0@<-W9A79Rg@UX=h+CT.u+E_a:+DGp,$4.gt+DGF1E,oN2ASuTB+CJ/^F_tT/
9keWgDfRIEC3*c*BlbD=BOr<)DJXS@F(96)E-*4EBOQ!*D/Ws!Anbgt%144#+<VdL@3AN_F_tT/
+Cno&@:EYdAM,*)BOr<*EbTB!Ed8d<@<>pe@<6!&BlbD8DIjr/Aftr9+Dl%<F<G[GARTY&Eb/bj
$6UH6+<Ve=Bl%@%/g*i!F=2,PDJsV>F(96%G9CUA+E_WH%13OO+<Vd_/g*_.BOQ'q+CSekARlol
+EM76E,9).D.R-nF!,RC+Cf>,D.RU,+E)CE+Dbb0ATJu.DBN>(@;]n"@rHU4AS*Q:G][=&$6UH6
+<Ve+BOr<)FD,6++Dtn+BQPA<Df'&.D..=)@;I&rDfTl0@ruF'DK?pl+D#G4ATD?m+DG_8D]j.8
BlbD/Bl%>i$6UH6+<Ve9Ec5`)+E)./+E(j7D0[7:@;KakEbT*+/g*r-AKYo3+Dl%;AKYo'+EV:.
+Cf>1Eb/a&Bl@m1+CT;%+EqjEDJ(R2$4.gt+AQj!+EV:*F<F-t@ps6tARTXoCj@.EGA2//BHVD8
+CQC3EbTB!Ed8dLATMr9A79Rg@UX=h+CT.u%13Ca+<Y04D/Ej%F<GLEF<G+&FC?;.Bl7L'+DGp?
F(fK7Ch+YtAKYPmF*SmMD]iY+DIal3BOr<)AnGUlA8,po+ED%'DfTB0/e&-s$6UH61bKnB+CT+0
B5_L%B-;;7+EMX5Ec`F@@;BRpB-;8<Eb-A3EbT0#DII?(Anc'mF!,.)G%De,BkCsgEb0-1+DtV)
ATJ:f+<VdL+<Yc>@;[23A7]pqCi=9(A0>JuCh7Z?+s:91Bl\64E\:m3?m&rtA7Zm&@;0anA0>r3
D.Oi.EbT0#DII>j$6UH6+<Ve7C2bq9+CT.u+E)@8ATAo*Bl%@%+EqOABHV52Ch[cu+DtV)ATKIH
<+oiaAKYr#Bl\8;@<,p%GB.V>B+51j+<VdL+CT.u+ED%7F_l.BAo_g,+EV:.+E):7B5)6lC`m/(
A0>DoG%GK.E+NQ&Anc'mF!,.)G%ki,+EV:.+:SZ#+<VdL+ELt.AKYl!D.Oi!F`\a:BkCsgEb0-1
+D#e>ASuR'Df0VK+A$GnFD,5.Ap&3<Eb-@b+EqO9C^g^o+<VdL+CT5.ASu$$FD,5.AoDL%Dg,o5
B-;8<AnGb%ATJu9D]iJ)C`me/@;[3"Bl%@%/e&.1+<VdL+<V+#+<VdL+<WBk+CK8#@UL<jCghEp
ARlp)@ps7r+CK&3+D,FuF<G%(A0>r'@;[3*@;TQuF(8Z3C2bq9%144#+<VdL1+j\WF(8fi+D,>(
D'3n0@;^-/?u:03Anc'u+EM%$DBNh*D.Oi2@qI?.E&(f1$6UH6+<Vd_/g+PC@q/mh@ps4cEa^)3
@ps7r+CK&3+CehsATD3%F(8Wr+DtV)AKZ&(@kMk;Amc&T%144#+<VdL6tp:JFCAu.Bl.9kAKYT!
Ch7Z1@<,p%B4YslEa`d#Gp%!CF<G!7E,ol+Ch7H+@<3Q5BOr:q$6UH6+<VeE@;TRs+CehsATD4#
+CT>4BkM<+FDi:9D..'gF!+n3AKZ&4+D>J"AT)^4+EV:*F<F-a$6UH6+<Ve8D'3G/EarZk+EVNE
@q]:gB4W3-BOtmu+DtV)ATKI5$4R=b%143e$?1$#A9Dj$BOt[h1,2Nj/h1g\C34-3D.7Q/F"Jsd
F(KH9E$/+nF_tT/9keWgDfQt>Ec5](@rs=4$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>YDdd0!-Y-Y-
@4u\ACh\!&-OgCl$?'Gt4$"a'D.Rr7F)?&4E-ZP:EZfLHBl%i<+BosE+E(d5-RT?1C2[Wq?YO7n
A7%J\+=Bs&Ch[cu<H)bm@:V`=ARfL'%13OOF(B;uBkhQs?TgFm-Y#1jF)?&4D/"$2DfRLJBl\64
E[MtP+<VdL+<VdL+<VdL+<VdL+<VdL:-pQUD/"$2DfQt2Bl[cpFDl2F%17/s@p`qbDe*3<3Zoe[
3\PSgF_tT/A7BU5E,oZ0@<-I$F*'$VE+EE;F!i(Q+<VdL+<VdL+<XEG/g,7LF_tT/E,9Z<+Cnpj
$?U<$?YO7nA7%J\+=CY[06:uQB5M@'Ec5tOA8bt#D.RU,F"_cYAS,I^05YEDEc5tNA7?o/+AP6U
+Dkh5Ec5t@A7>uT%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<
B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX
67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgD1BkhQs-Qm&5FE2UK4$"a2F!,(-
EZf(.@j`B.$;No?+EM+9+EMCBE-ZP:EZfLGATAo/AU/>+$?L'&F`_SFF<DrRF(KAbAU/>>Eb0<'
F=.M).!0Au:K(484!8l2+=nWi+E2%)CEPGVB4Z0--Y$h$@r#(cATCFTH#k>^+Eqj?FCcS0E+*j%
+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R:Msu_DIlgeCi<`m6YL%@CERS:De`in
F<GX9FEMOMF`:l"FCf)nCi!['Bk;?m@UX@62.^92D]it1Ado)hBln0&+B!?"DJ=!$+EV:>D.7Q/
B45UmATDKrF!,UEA79Rk+>,9!%17&sF(f(n$?Kd#Ci<flC^g^\$?B]p+EV19F<GOCATMF#@q?d$
Aft#L9PJT[+CSekDf-\,Bl7@"Gmt*pAftu0F<G.>BleA=6TSIe2DeZR2Dd!F0K36FA7TUrF'N6a
FCAEqEGT?2AR'%c@U*_`@VTt(Ch\!&1G33SC`mA/FDi9jG[k<(FD5Z20JEqC%17,eD'3n2F<GX7
EbTK7+D#e/@s)m%@VfTuAo_g,+EMX5DId0rA0>],@psInDf0V*$>F)pAU%p1F<G'S>\Z/R>\Z/R
/N>FC>[hDb>\[beDKB`4AM.P=AKZ&*F<G=0G\'$J3a?DX1gFcR1bC[@2dBg+DHppdDf0W7Ch4_@
C3(L,$>F)p+sgu8G\&0F+?_k1+sJ.BDffn?7<i<RE-,f4DD3dS$4R>_ASiQ2ATT%oBQ\0$F%p@h
Ec5t@8g&1bEbTK7%17/fF<G=>@ra^V0HiJ24==W"02l_1B2*)\Ec5tO6uQRXD.RU,F"^X9AS+>>
02uV-D.7Q\Bl\64E\;'@F!i.@$4R>_ASiQ1ATMF)+CT)&+D5,!Ch7X$ATJu.DBO%7F_tT/+Cno&
@:EYdAIStmC1VX$,p4LKF(95:+<j-pBl%<ZBQ\0$F!*1]+<kBABlkIO+q4m$Bln0&+EV:>D.7Q/
B45UmATE&=Bl8!'Ec`sWE+EC!AKYK$D/a<&FCcU)$>4:!D]i"mAOUKI%13OO3^n:'AT2a*Df.6_
%16ZVBQ#"^;Gp:g3Zq?u9PJT[+A*bbA7TUr+C]&&@<-W9DJsV>AoDg0A.8lfBln0&+EV:>D.7Q/
B45UmATDKrF!+q7Bl%<&@:EecA7]9p%16`dFDi:$BOsVMA.8kT$9CV#@qBV$Bl@lC0b"J$@q]d'
78d#Z;E>q8@rH7+Deru;AU%c/DJsV>AoDg0A.8lfBln0&+EV:>D.7Q/B45UmATDKrF!+q7Bl%<&
@:EecA7]9p%16`dFDi:$BOsVMA.8kT$9D."AOUKI%16ZaA8H0o@;HA[E,T]+%17&_F`V,:E,9H$
A7K:a@r#F\@<=7^ARfCl+E(k(%172kFDPM2;KZkpBl7Q+Df0B*DIjr5E,9H$A0>AqARfKu/hSac
$?1-/BOhPZF(KH0De!3l%13OOEb0)1FCfN8+E2@4F(K6!AKYo'+B)-2Blmo/@:WneDBND&DIIR2
%16f]+Du+>+D#e3F*&Nl3a?DX1gFcR1bC[@2dBd%A8c@,>\%8b@9dknCh\!&>\n+`>\n+`C3+B2
BlmoB/nAd7+D5V7D]hJn@qBV$Bl@lC0F\?u$?B]p+EM+9+EM%5BlJ/:AU%crF`_&$Ch4`$Ec5e;
F*(i.A79Lh+Dbt+@<?4%DK?6oBkAK!G\M5@+CdH;C,RnRC,Rn#3&!9r@VK^bC1D1"F)Pl+/nK9=
+EM+9+DPJ4ANaNa>\Z/R>\Z/R/N>FC>[hDb>\[beDKB`4AKWR>F!(o!BkAJ3-#."9AL/NC4Zso3
+s:N:FDi9jG[k<(FD5Z20JO"D%17,eD'3n2F<F0uF(96)E-)NrF(KG9C3*m*4X)R'3\WZD@lc8A
D09JcBl\64E\Bh!@s)X"DKKqQ=E7tb6t.fFDJX$)AQ<\cDdd0DBOt[h/no'A-R'!,%17,eD'3>%
ARfKuAnc'm+DtV)ATJu.DBO(@Ci<`m+Co2,ARfh#Ed8d>DfQt2F`;/2@psIjEt&I&C1VX$,p4LK
F(95:+<jU!Ch[cu<H)bm@:V`=ARfKu0d7_aAU%p2+>=uK$?U!(Ch4`2BQ\0$F!,UECi<`m+Cf(r
@r!2sDf'H0ATVK,%16`dFDi:$BOsVMA.8kT$9CV#@qBV$Bl@lC0F\A#@q]d'78d#Z;E>q!;+t\G
AKXSf@:WneDBND&DIIR2+Du+>+D,P7DIa1`FD5i5AKZ).F_tT/+E_X>Ddd0!@q]F`CER%pASu$i
A0DBhB5_m1+B3#c7;cWF$4R>'7<i<RE-,f4DD3dS$>!^\D]hJH;GU1O+DPD)DKB`4AM.P=AKYl/
F<G16F`(_!$?U!(Ch4`2BQ\0$F!,UECi<`m+Cf(r@r!2q@V'FfARlqn$>4:!D]i"mAOUKI%13OO
3`Kd(7;cWF$>"*cCi<flC^g_jDfB4r$?0ErF(G                                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' MirrorXref BADGALCNTS BackUpMirrorXrefDb BracketOverlaps '
zz=:zz,'BuildMirror CR CreateMirrorXrefDb CreateMirror_sql DumpLocalImageNa'
zz=:zz,'tural IFACEWORDSMirrorXref LF LOCOMISS LOCOXREF LoadAlbum LoadImage'
zz=:zz,'AlbumXr LoadImageKeywordXr LoadLocalPath LoadMirrorXrefDb LoadOnlin'
zz=:zz,'eImage LoadOnlineKeyword LocalFile_sql LocalFrOnline LocalOnlineFil'
zz=:zz,'e_sql MACROSMirrorXref MANLOCOXREF MIRRORDB MIRRORDBPATH MIRRORHEAD'
zz=:zz,' MIRRORPATH MatchManual MatchOnlineLocal MatchOnlineNoBrackets Mirr'
zz=:zz,'orImageXrTables MissingImagesReport MissingLocalFiles_sql PRIMARYTH'
zz=:zz,'UMBS ROOTWORDSMirrorXref RealDateFrManifest SUSPECTPAIRS Suspicious'
zz=:zz,'PairReport UpdateLocalPresent UpdateLocalPresent_sql afterlaststr a'
zz=:zz,'fterstr alltrim allwhitetrim assert b36casemask b36fd beforelaststr'
zz=:zz,' beforestr boxopen changestr charsub ctl fboxname ferase fexist ins'
zz=:zz,'qltd justext justfile ofreq parsetd portchars quote read readtd2 re'
zz=:zz,'b smoutput tlf toCRLF toHOST toJ tolower tslash2 write writetd2 yyy'
zz=:zz,'ymondd''                                                            '
zz=:945{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`2.0JZ@:EcQ)==E7tb%15is/h0S0EcQ)==E7tb+EK+d+CfG'@<?''@;]TuCi<`m
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
AISuA67sB83G)i30f^@);g!/#Bk(jqF`UAfBl[*_E,Tc=.3N&0A7]9\$4R>_AT;j,Eb-@@A79Rg
06;,LBlmo6%13OO@rGjn@<6K4-V\;qEc5u#Eb/i1+:SYe$;No?.V*+0ASu$iDKKq/$;No?+=J]g
4ZX]QEb/[$APHlZEc5u*F)c"=9Q+ELCdr,TARBLuC`l_sA79Rk9Q+ELCf#.`F(K62?ZU4'+A?]`
@;J_WCh[cu7VQ[M?ZU4'%15is/g)Pl.6T^79keZiBl7QWDe!3l7VQ[MF'j!.C^g_H67sa!DId9h
E+NotASuU2%13OO:-pQUF(8lpD.+Q*Aftr)EcQ)=/nAE6A79Rg@UX=h+>"^T@<-F#A0>f.+=B5u
+Cf(nEa`I"ATA4e6ZQaHFCe0\EcQ)=?ZU4'4ZX]60H`D!0I[G<@rc-hFCcS:@:F%a+A?]`@;JbK
FD)*j+<W(+De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kk:E,oZ0@<-W9CLqcB%144#+A?]`@;JbK
FD)e=AU&;>DJsV>DKTc3.6@tG%16TcART[l+EV%$Ch4_bDJX$)AP6T[GAhM4%144#-qe,sGAhM4
+EV1>F<GI>F<GIDCht55EbTB!Ed8dCAU,g9$6UH694`B<Eb065ASu"'+DG_8AS5Rp+Du+>+Du=<
CahFT$6UH6%16TcART[l+EV%$Ch4_TCgqO(%144#-p_ZYF_sc_Gp%3?G]Y'GDfd+>F_kk:E,oZ0
@<-W9CLqcB%144#+A?]`@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb-#&+<Ve#De!3l:i^,gASuT4
Bl8$(B4Z*+@q]F`CFDkp@ps1MEb0<'DKJ$)0Hb:S+A?]`@;Jb\ATMF#F?McA.4bo8+<Ve&DJX$)
AP$`IB4XGKF`):DBl8$(B4Z*7%144#+AZlkBl7KLEb/[$AOKsKAKYMlFCd!4$6UH69OW!a<H)JW
FCeu*A79Rk/.Dq/+<X6m@:s.m9OW!a<H)JWFCeu*A79Rk/.Dq/+<Wsd@WcN_@;TQuFCf]=/.Dq/
+<XKhEb0-17W3*RATDi7FCf]=/.Dq/+<X`s@T@G_+EV1>F=[k.+<VdmCgqO(6tLFLEbTK7Bl@l3
FCf]=/.Dq/+<Y97Eb/rtDBN_+Gpl@)@ps1M@<?0S6n'7!AS,LoASu!hF!+.p@ps1b:gnHZ-qnPh
@;JbKFD+66.4I=f$4R>PEb/[$AKZ)'@VfTu:Msu_DIlCV@:s-\$6UH>8SqmKAP6T[+EV1>F<GI>
F<GIDCht55EbTB!Ed8dCAU,g9$6UH6:Msu_DIlCV@:s.@Bl%?'FCf]=/.Dq/+<Wsj@q]S"ARnM'
2'@!PG]YJG$6UH66#pIKBm+&u;e^Ph+DG_8AS5Rp/.Dq/+<X?dFD5i>A7ZlqCi<a(/.Dq/+<X?r
DJ*[*F_#&+Ao)BoF=[k.+<VdmCijB5F_#&+Bl8$(B4Z*7%144#+A[#lB5)6lCe/,OB4uB0Bl8$(
B4Z*7%144#+A[#lB5)6lCfb=]FD)e2DKKH&ATB=2$6UH6;Is9Q6t(1K+Cno&ALn8t+<Ve,E,9H$
A40jJAKYMlFCd!4$6UH69OW!a<H)JWFCeu*A79Rk/.Dq/+<X[)BcqM/G]YJG$6UH6<+pDk@W#Ug
CfPLl+EV1>F=[k.+<Ve"AU/K<Eb'56FCf]=/.Dq/+<X$[E-,f4DBO%4G]YAr%13OO@rc-hFCcS:
@:F%a+A$EYB4XAF@WcNiEX`?u+=Kfu@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<Wsd@WcN\AU,D?
AU&;>DJsV>DKTc3/0GB/+<VeGEbTB!Ed8dCAU,[qD..'g94`B"+@0gQF_sc_Gpt9R$6UH6AoD^$
BkM<+CLqc>6#:"QD+eGc.3NYBAn?!oDI[7!+@0gQF_rNmCgqO(94`At/.Dq/+<Y97Eb/rtDBN_+
Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`IB4WJ_D..'g94`At.6@tG%16TcART[l+EV%$
Ch4_\D..'g94`BmDfTAjEX`?u+=Kfu@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<X<gH$=1IA0>u*
G]Y'GDfd+>F_kkF%144#+E2@8D..I1+DYP6-qS8aB4X_IGq:(2AU/K<Eb$UM%144#+D,P4ASGdp
+DYP6-qe,sGAhM4.3NYBAn?!oDI[7!+AZlkBl7KTAU/K<Eb$RkAU/K<Eb$UM%144#+D,P4ASGdp
+DYP6-qS8aB4X_IGpskVAS,LoASu!hF!+7rCh[cu8SqmKALL,e@:s.EAU,^R3t2N+$=e*f@<?''
FCAWpAKXZb@ps1FD..'g%144#-qnPh@;JMP@:s.C6m-2]FCf)rEZf7<F<GIDCht55EbTB!Ed8dC
AU,D,F`_P9DI[]uD.RU,/.Dq/+<X?r@ps1QBQ\0$8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`
@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb-#&+<Ve#De!3l8SqmKAO^BMAKZ)+G]Y'GDfd+>F_kkF
%144#+A$EYB4X_IGp%3?G]Y'GDfd+>F_kkF%144#+D,P4ASGdp+DYP6-qnPh@;JbKFD+66.3NYB
An?!oDI[7!+A?]`@;KLO@<?029Q+ELCf"P^BLtT@/.Dq/+<Y97Eb/rtDBN_+Gpl7$@:s.EAU,^I
Eb/ioEb0,uATJtiDJX$)AP$`IB4WJ_D..'g94`At.6@tG.1HUn$;No?+AP^3762Q5BOr<$+EMO=
Blmo/@:WneDBNY7+D,b;F*Sm:@W-C2+D>\;+EMO=+DGm>AoD^,@<?U&A1e;u:-pQU;KZkpBl7Q+
F*(i.A79Lh+EMO=+E2@4FEDdNE,oZ1FCfK6+E)9CBl7HmDKKT1B-;88C`mG0+F.mJEX`@N67sBm
@<QR0Blmo/F*)\DAKY].+Dbb-AScW7FDi:@Ec5K2@q?cmDe*E%FD,*)+CoD%F)E@I+EqaECG$&'
:-pQU<+U,m+F.mJEZfFCC`m>1@:sFgDKKqBFDi:1G&M)*+EV:2F!)ZKBk(piH"(]1+X.@&9Q+EL
Cdr,TARBLuCcsg%-nlc)+>>5R$?KcpARfg)+CQloD..'g94`B"+AZlkBl7KRD..'g7VQ[M/0IW)
@ps1M@<?0*Ao_g,+AZlkBl7KRD..'g+CP]dBl7g"EZf+8Bl5%bD..'g6#:"QD-1g$@N]T,+CQlo
D..'g94`Ak4Wn2d8SqmKAP6T[%16feDImi2C2[g(+@0gQF_r72+E)-?@kL&`@WcN\AU,C]+CZrh
CgqO(94`AX$>FBqATAo.DeX)39Q+ELCf"P^BHUh.Df-\./kg1n@;JbKFD+66+?^iW/kg1n@;JbK
FD+66+:S[%BOu3q+Cd#iCgqO(94`Ak4Wlru$?'rqATAo&Gp#n#Ch[cu8SqmKAO^BMAIStq%13OO
<H)JWFCe-a@ps1MEb0<'DKK6,EGRd!+=D;NA79Rk+@0gQF_r7BATT%gDe!3l:i^,gASuT44WlI%
GA(Q.AKX9T@WcN\AU,D4DBL;9$4R>9De!3l:Msu_DIl:OCh6spEGRd!+=Jod3Zp+*%17/fCh7*u
+AucZCd_]RALns6/kKngB4X_IGq:(3De!3l<+pDk@S&s=+CZrsDe!3l:gnHZ8OP*P9Q+ELCf"P^
BIk9"De!3l8SqmKAO^BMALns"DJX$)AP$`IB4XPHCh4`$Ec5e;9Q+ELCe8JPB4W2o+:SZlDJj$+
+DPh/DBMVk@ps1M@<?0*@N]T,+CZrsDe!3l:gnHZ8OO[a+CQlrDe!3l:gnHZ8OO[1$>FBqATAo.
DeX)3:Msu_DIlCV@:s-o@j#]-+Cd#qD..'g94`Ak4Wn/c8SqmKAP6T[+:SZrEb&a%+C]U=;Is9Q
6t(1K%14Nn$4R>:Ble?0DJ)X]@ps1CBl%@%?ZU4'4ZX]60H`D!0I[G<F(K0!@rri'Dfor>-o!.n
@<3PcBle?0DJ)=SF=\PE/jX;_F_sl^D.P7@B6%p5E*m*nDI[*s-r4_sBl7KRD..'g7VQ[M/0H<f
-Rg0HF!+4r9Q+ELCdr,TAKYT*Df$UmDJX$)AP$`IB4W2o%16feDImi2C2[g(+A$EYB4XAF@WcNi
EZeg6Df-\,/kKngB4X_IGp#6m@4k,g@:s.EAU+^lBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA6#:"Q
D+eGc+?^iV/jX;_F_sc_Gmt+)BOu3q+CQloD..'g94`AkDJsV>Bl5%AF(K0!@rrhbD..'g94`Ak
Ao_g,+A?]`@;JMP@:s.#%16`gDfp"A@X0)+/jX;_F_sl^D.O.`DfTB"EZeh:+AHQkF(oN)6Z-ug
@<5of$7P                                                                  ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`uBl%<SBl\64EZe%o@ps1CEc5e_BlY=l:/"5S79*/X:I.BF5u^AtE-683
@<<kG/1<VC4"akp+=A:@F_PZ&@q]F`CER)/Bl%<sBl\64EZeh6Bl%=%BQ\0$F!iCf-p0%C-V\;q
Ec5u#Eb/i1.4cl00I/>$/1<VC4"akp+=A:@F_PZ&D/"$2DfT2o@<<W/@;]n"@rHU4AS,:kG]Y'F
Bl\64EaNKoF*)>@H!bE!+E2@9A9Dj$BOt[h+E_X6@<?'n@;KakEbT*+?XdGc+E_X>Ddd0dBOt[h
?XdGc-RgSp4>J$9,Vh&.3A<6C2D-dF2`3KQ0JbO.1,(FC0JbCA/i>UE0Jk^K3&Vm70JPRA1GC^>
1H@ES1,:OB1E\G,0f^pD0K(O?2`!<G2Dm?71,(FC0JbC@/i,IG2)[EJ1Gg400JPRA1GCa?3&!3H
3&<9H3?U(20f^pD0K(O>3B/uR1,(XC+>PW*3A<6C2D-gF2)$jA3&*BA/1<V9+>Y8u0JPRA1GC[=
1c.*N3&`fR3?U(20f^pD0K(O>3&<NN0JbLD+>PW*3A<6C2(gaH1GppH3&3<51,(FC0JbC@/i,IH
1,_*K2_cF10JPRA1GC^>1H70M1b^^A2]sk00f^pD0JtI?3AWNJ2`NQL.4cl01,(FC0JbC@/i,IG
2E3TQ1,1:d1,(FC0JbC>/i,IG2E3TQ1,17m/hnJ(.4cl00I/>$/1<V9+>tK#0JPRA1GC^>1bgdA
2D[?O3?U(20f^pD0K(O?2`E`N3&rZJ+>PW*3A<6C2D-gF0JY@@3&NH61,(FC0JbC@/i,LI1H.9R
3A_j60JPRA1GC^>1bgd?3&ioT3$9t10f^pD0K(O?0f(L?1cI9O+>PW*3A<6C2D-gF2Dd?L1H.06
1,(FC0JbC@/i5LG3A<EQ0JXb+0JPRA1GC^>1cIBL1c[<O1E\G,0f^pD0K(O>3B/fR3&ruU+>PW*
3A<6C2D-gF2E!NN2)I'21,(FC0JbC@/i5LF3&`fP3&N-9-p014/1<V7.4cl00e"Y%4>8384>6 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
