NB. JOD dictionary dump:  7 Jun 2018 14:54:43
NB. Generated with JOD version; 0.9.996 - dev; 19; 4 Jun 2018 09:24:59
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


imx_sql=:99 114 101 97 116 101 32 116 97 98 108 101 32 105 109 120 10 32 32 40 105 109 32 116 101 120 116 32 110 111 116 32 110 117 108 108 44 10 32 32 32 97 108 32 116 101 120 116 32 110 111 116 32 110 117 108 108 44 32 10 32 32 32 112 114 105 109 97 114 121 32 107 101 121 40 105 109 44 32 97 108 41 41 10{a.

smt_sql=:99 114 101 97 116 101 32 116 97 98 108 101 32 115 109 116 10 32 32 40 105 109 32 116 101 120 116 32 110 111 116 32 110 117 108 108 32 112 114 105 109 97 114 121 32 107 101 121 44 32 45 45 32 116 101 120 116 10 32 32 32 97 108 32 116 101 120 116 44 32 45 45 32 116 101 120 116 10 32 32 32 108 111 110 32 102 108 111 97 116 44 32 45 45 32 102 108 111 97 116 10 32 32 32 108 97 116 32 102 108 111 97 116 44 32 45 45 32 102 108 111 97 116 10 32 32 32 104 101 105 103 104 116 32 105 110 116 101 103 101 114 44 32 45 45 32 102 108 111 97 116 10 32 32 32 119 105 100 116 104 32 105 110 116 101 103 101 114 44 32 45 45 32 105 110 116 101 103 101 114 10 32 32 32 116 97 107 101 110 32 100 97 116 101 41 32 45 45 32 100 97 116 101 10{a.

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


createMirrorXrefTables=:3 : 0

NB.*createMirrorXrefTables v-- create mirrorxref tables.
NB.
NB. monad:  createMirrorXrefTables clPathFile
NB.
NB.   createMirrorXrefTables jpath '~temp/mirrorxref.db'

db=. sqlopen_psqlite_ y
rc=.    sqlcmd__db reblf smt_sql
rc=. rc,sqlcmd__db reblf imx_sql
'unable to create all table(s)' assert 0=rc
tabs=. sqltables__db ''
'cannot close db' assert sqlclose__db ''
tabs
)

insqltd=:4 : 0

NB.*insqltd v-- inserts btcl into sqlite tables.
NB.
NB. dyad:  (clSql ; clDbFile) insqltd btclData
NB.
NB.   NB. insert data - sqlite db file
NB.   data=. readtd2 jpath '~temp/smt.txt' 
NB.   dbfile=. jpath '~temp/mirrorxref.db' 
NB.
NB.   NB. convert data and insert - sql needs
NB.   NB. a leading /* .... */ column comment
NB.   (smt_sql ; dbfile) insqltd data

x checkintd y 

)

reblf=:3 : 0

NB.*reblf v-- replace line end characters with blanks and reduce multiple blanks.
NB.
NB. monad:  cl =. reblf cl

reb ' ' (I. LF = t)} t=. CR -.~ ,y
)

zigzag=:($ /:@:;@:(|.&.>`]/.)@:(</.)@:i.)@:(2&#)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@4+>P&p1*A>/+>k9"2BXn#1cSucART[l9keWgDfSs#AS+nM@VfUs@rc-hFCcS3Bl\64Ed2V9
Afu2(@VfUsEb/]rAo_I%Cgggb+Dbb0AKYQ%A0>Aq@<,ddFCfK6+EqOABHUc#@;]k%+CT.u+ED%(
F^nu*D09Z:BlIm"+C].qDJO<>BkMa#B4kdnATD4$AKYk5GT^lHH>.#<@:p^)@:F%aF!*UgF(Jo*
Ci=3(+CoD#F_t]-F8                                                         ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*AIt1G^n7BkMa#B.A4AB6n!!+Ef=g+D58'ATD4$ATJu3+F##H+DG_8AS5Rp+F7a7H=:G/
FCAWpATKI5$4R>ABPDN1G%G]'+CoV++<YcE+@p']Ed8d*Bk(g!B4YslEaa'$F!,?C+F#"ODBNY2
FCf)rEZf[BB6n!!%172c@VfUs/g+)(AKX?R@;p="EZd(r+E(j77VQIVGp$%!@:Wqj+E(j78hLP[
%16cjFDs8o04Sp2AM._=De=*8@<,p3@rH3;GA1i,01KYfFEq4lBOPF_F'iit?V2t=BOPk%ATD-4
3"63($6XM'EaiI!Bl,m?$4R=b+<YuEB6n!!+>jT8+>=o\0d%Sr+<WQb0f0=H+>P&^1a!o"+>GYp
0f9CI+>Y,_3$9q2+>Gbs1,04F+?:Q!0d&20+>PVn1,9:G0ea_)3$9q9+>P_q1,KFI         ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o2]sk42)B)XCLpjhDdd0`F(96)E--.r67sa)@;BF]Ci<`m?ZT^tBlJ08+ET1e+D58'
ATD4$ATJu1Ddd0!F(96)E--.DAoD]4@s)g4ASuT4A8,OqBl@ltEbT*+/e&._67sAi$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130K<fUDDF'Y$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>cm
Dg!ih+D5Y7+E_d?Ci^_-A7T7^%15is/g)i-A7]7)0d't8BHV>,DIIBnA0>K)@;]jsBl4@e:-pQU
0KEuYGqq6"Ao)0kCN:P<AStpnARlp)D09JEAU%p$FDl)6F"DBLF_>Ar@r#drB-:VnA7]9\$;No?
+>GT_AR[DM+Cf>(DKBB0F<DrFC2[W1+CSekARlo8+ED%:Bldir+D,P4+Dl=6@q,rT:-pQU0emQa
FtkfrCghEsGT_-NBl%iA+CT.rCjC)DB6%F"BQG;:AT2("BOt]`$;No?+>GWdF_i`f+D5Y<Ao_`s
E,0<,/0Io'=CuSTE-Q59/0JJ4Bcmil:-pQU0f!KdCb[jkA7B7pATMs)E\&>XD/=?:Bl%iA+EM[C
D/X?1+CSekARl5W:-pQU0f3cdFtkZnEb0*+G%De=DKU#3A0>K)Df$V+F_PZ&%15is/g)l.@;p6A
0HbFRF_>Z=FCfJDFDk]./1>"HDIdI'Bl@ltC`m7tBdkT'Df90,ART+j;It#cATr2<@:Wn[A.8l@
67sB83,3SR0JjnnD09K1H$!V</0JMKBkAK+DJXS@@<Q'nCggdhAKYE'+D>\1AIStU$?B]tF_Pl-
+=Cf5DImisCbKOAA1%fn@rGjn@<6K4FDYu5De!-?5s]=*F(95N3B:G03Zoe95s]=*F(95N3B8H0
>9IEoATD4#AKX)_5s[eQDf]E/3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$9g.j:JaJT6qKa/3ZqsI
A0<Q8$9g.jDe't<F`_>6F!i)7+>Y-YA0<6I+<V+#%15is/g,:YBl%i5F(96)E--.1$9g.jF(fK9
E+*g/+Dkq9+=CW>FCB94-OgDX67sBE0RIkSDg-//F)rI@Ci^^HG\q8>FD5Q4-OgDH0RIkSDg-//
F)rI@Ci^^HF*2A;Df9M@%159QHSZd_A0<6I%13OO:-pQU@;]LiH#n(?Ea`p#F!)lG2D-[=.3K',
:-pQU4tq>%A0<rp-Y@C-DJO'&DBNFuBHVG>Bl%i<%15is/g*>3HZNk=GApu3F!,=9F!)i=DII@,
F*)&8@;on$-OgDX67sBE0RGSuDe't<-OgCl$;No?+?hK+F(fK9E+*g/+Dkq9+=Cf@G\1u5@;p"!
CaTZ!:-pQU4tq=>+E(d5-RT?1%15is/g+nIA0><'GT_';EbTK7Et&I?0RI_K+?MV3C2[WnATf22
De'u5FD5Q4-OgDH0RIkSDg-//F)rI@Ci^^HC2[X)ATMs)E[M;'4tq=>+E(d5-RT?1%15is/g+eG
F!,UIBl%i"$;No?+?hK+De'tP3[\QZF!,UIBl%i<%15is/g*>3HZNk=GApu3F!,=9F!)iS@<lg1
Bl8$6-OgDX67sBE0RGSuDe't<-OgCl$;No?+Eh=:F(oQ1+Cf>4DKKH1F!,:-FCf\M@Vfsq+E_d?
Ci^$m4tq>%A0<rp-Y..*F!,UIBl%i<%159QHZNk=GApu3F!,=9F!)i3AS#Xu-OgDH0RIkSDg-//
F)rI@Ci^^HFDk].-OgDX67sBE0RIkSDg-//F)rI@Ci^^H9m:/Y@oR#A:i^,dEc5H!F)r]<$9g.j
F(fK9E+*g/+Dkq9+=BR"A5m,B:i^,dEc5H!F)r]<$9g.jF(fK9E+*g/+Dkq9+=BKi@Vfas87cUV
ATB.-$4R>;67sC$F`&=>@;TRlATMo8G%G]'+EVNE@;p1%Gp"M:84?EF5tsp"+Dbt/Bk%SZ-o2u,
+>>5l-OgDsAhG2X/pClO?X[\fA7$HA-W`i-;FNlG8RH1HDe*3&+CoCC+EM47GApu3F!)hY=%GbX
76sX>?YO7nA7$c.DJsV>F(KG@%16Z_F(K&t/g+4d78cQ?9hA]+C2[Wi+>#Vs-[0KLCF:5IA8a(C
4tq>)BQ&*6@<6K4D/=89-WFYZAo^slG\q7E+<V+#AScF!BkAt?=%GbX76sX>?YO7nA7$H23Zoe`
Df'&5+<Y35/g(T1+<YT5+?MV3A8bt!+E_d?Ci^sH>9G^EDe't<-OgD*+EM47GApu3F!,=9F!)i#
Df90,ART+j;It#cATr2C%144#0d(LYF<Dr?F_PZ&GAo<ZAU#R3$6UI0A0<rp-Z+'=@q-X(FD5Q4
-QlV91E^UH+=ANG$6UHd67sB8+EDRG+=CW@Bl%<j@VI24+AP6U+C]J-Ch+YuDf'H6ATMp(A0>r'
EbTK7%144#F(fK9E+*g/+Dkq9+=C]/BdY#G+<XEG/g+YBD/Ej%FCeu*@rGmh%144#:-pQUF(fK9
E+*g/+Dkq9+=C]/Blmp-FCfJ?%144#:-pQU0d(LYF<DrJ@;BF]@Uih`@;0V$?Z]k#F=/1R%144#
:-pQUF)?&4E-ZP:EZfLHBl%i"$6UI0A0<rp-Za-IB5i-<ATAo7D09K%ATf21D..'g+EMCBB-;>=
Bl%i<+BosE+E(d5-RT?1+<Y`=Dg-//F)rI@Ci^^H;f-Yi:jI.oE[M;'+<XEG/g+kF@:s-oAU%p$
+EM%5BlJ/'$6UI0A0<rp-Za-IB4PRs+EMCBB-:o*@:s-oF`_>6F!i)7+>Y-YA0<6I%144#F(fK9
E+*g/+Dkq9+=C`FBkA_%$>"$pASGa/A8a(0$6UI4BQ&*6@<6K4-Z3iF-s&r.;FNlG8RH1HDe*3(
+Dbt+@<?4%DBO"3Ch7*uARm.t$>"*c/e&.B+BosE+E(d5-RT?1.1HUn$=e!aF`MM6DKI"CD/a<0
@p_Mf6#:I\@raRi3F<4&4tq>%A0?:Q+AYg&:..Z@%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6#:I\@raRi3F<4&                                            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' createMirrorXrefDb CR LF assert createMirrorXrefTables im'
zz=:zz,'x_sql insqltd reb reblf smt_sql''                                   '
zz=:99{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o3$:1;2Igc=@<?'TBl\64E`d?nAjg*'67s`tEb/[$APHlZEc5u#Eb/iN@N]bE/KePD
ART[l+EMO=Blmo/D/"$2DfU)CAS*&q@<>pe@<6!4%15is/e&._67sC(ATD6gFD5SQ%15is/g)8G
$;No?+CfG'@<?'k3Zp130fWojDD4!Y$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>_AT;j,Eb-@@A79Rg06;,LBlmo6%13OO
:-pQ_A7]^kDId<rFE7lu:-pQU-n6Z/3ZrK\FC0*/C`mG/G[GN3C^g_H67sa!DId9hE+NotASuU2
%13OO:-pQU:/=hX3ZrNXAKYJ*F*)\DAKWWU+>,9!+=]#e@rH4$ASuU2+CT@7FD,5.BOtU_%15is
/g,(E+EV:.+D,P.Ci=N3DJ()5EGQb=FCB9&D.RU,F!+n3AKZ,:ARlp-BOu&j$;No?+Cf>-G%G]9
Bl7Q+@WZ*r+Co&"Bl.R+ARlp*@:F%a+D,>(ATJu.DKKe+$;No?+Dbb5F<G"4Eaa67+EV:*DBNFt
DBND"+Dbt)A7]9oGA2/4+=M;NCh[d.ATDlA%15is/g,4HANCq^Bl8!3Cij2:/e&-s$?L'+?ZU4'
4ZX]60H`D!0I[G<0.J)kBl8!3Cij39+ES`J+D)a.+DDs4+ClTE0+A7uEb/[$AKZ)'@VfTuF)?".
$6UH>Bl+u7AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<Y*/+EV1>F<GI>F<GIDChtXF%144#
+Dbt6+D,G.@<=%0$6UH6CghE.Ao)BoF=[k.+<Ve?ASGdjF<G:8FCf)rE\%Y,+<VeNBk2=!+DG_8
AS5Rp/.Dq/+<Yc7CLqB+A79Rk.1HV5%13OOBl/*%F)c"Z3Zoh)+?CW!.1HV;.Nj(PDKBf6FC]eB
F<GZJ.PD5<@rc-hFCcS:@:F%a+DG\;%144#-u!N@FCf]=+Du+>+Du=<Cb-#&+<Ve8C`mh2G]Y'G
Dfd+>F_kkF+:SZ#+<YWDBl.:!Gp$m6GpmBD/0JA;.4G]5.0                           ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qlo>ART[l9keWgDfSs#AS+nM@VfUs+DG\;?ZU4'+DG_7EGT`-+ED%&Ch=f2
D00-+EGQbDBkMa#B.#,Z-p0%C-Z*:-ARB7l@:W_d@rc:&FE8fY/1<V34==WZART[l9keWgDfSs#
AS+>>-RgSp4>8$7.4cl00I/>$/1<V9+>tK#0JPO@2D@'B1c-sJ1c[?H2]sk00fUjF0K1U@0ebOB
2`WiW+>PW*3&!6E2_I!B3AiKH2)I$11,(FB0K(UD/i,IC3&*BH1Gg400JPO@2D@'B1bg[B2`NZK
2BXb/0fUjF0JtI?1H@<N2DH=00JPO@2D@'B1c79J1cR3K1*A>+0fUjF0K1U@0ebOB2`WiW+>PW*
3&!6E2_I!C1c73K3&*<61,(FB0K(UD/i,IC3&*BH1Gg400JPO@2D@'B2)d?N0Jt^J+>PW*3&!6E
2(gaB3Ai]Q0e"Y%4>JTF3&!6E1bLUD1GLmH0KD$A0J5%50f:gK1,CmL3&!<N1,gsH1b*2l1*A;#
/1<V90JPO@2D@'B1b^d@2)I6L2CgI61,(OB2_d'I1c%!F2`!6D2C`Dn1*A;#/1<V7,VUYu-p01/
0I\P$4>838-p014/1<V7.4cl00I\P80E                                          ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
