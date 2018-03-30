NB. JOD dictionary dump: 30 Mar 2018 16:20:36
NB. Generated with JOD version; 0.9.993 - dev; 7; 5 Mar 2018 15:55:28
NB. J version: j806/j64/windows/release/commercial/www.jsoftware.com/2017-11-06T10:03:54
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


tagtodo=:3 : 0

NB.*tagtodo  v-- tag items in  TODO section  with  case insentive
NB. base 36 guids.
NB.
NB. This  verb  parses  the  text   between   `[begin-todo]`  and
NB. `[end-todo]`  in  markdown  TODO  files and prefixes untagged
NB. items with base 36 representations of GUIDs. The intent is to
NB. produce a stable key for each task on the list.
NB.
NB. monad:  clTagTodoText =. tagtodo clTodoText
NB. 
NB.   todo=. read 'c:/mp/jupyter/smugpyter/todo.md'
NB.   tagtodo todo

NB. preserve any preamble and suffix
bdo=. '`[begin-todo]`' [ edo=. '`[end-todo]`'
if. -.(+./bdo E. t) *. +./edo E. t=. ,y do. y return. end.
pam=. bdo beforestr t [ sfx=. edo afterstr t

NB. extract TAB free item text
t=. '`[end-todo]`' beforestr '`[begin-todo]`' afterstr t
t=. ' ' (I. TAB=t)} t
t=. ];._2 tlf t -. CR
t=. (*./"1 ' ' = t) <;.1 t

NB. all blanks
b=. 0 = #&> (,&.> t) -.&.> ' '
if. *./b do. y return. end.

NB. strip redundant blank lines from nonblanks
q=. I. -.b
t=. (rebrow&.> q{t) q} t

NB. guid tagged
g=. +./&> ('`<_'&E.)@,&.> t
b=. b +. g
if. *./b do. y return. end.
t=. ctl&.> t

NB. collect item numbers and following text
q=. I. -.b [ c=. '. '
r=. c&beforestr&.> q{t [ s=. c&afterstr&.> q{t

NB. should have only positive integers
msg=. 'markdown item syntax invalid'
msg assert 0 < #&> r;s
msg assert 0 <: _1&".&> r

NB. tag untagged nonblanks
u=. r ,&.> (<c) ,&.> ,&.> (<"1 b36guids #s) ,&.> ' ' ,&.> s
t=. u q} t

NB. insert one blank line between items and return text
t=. }: , t ,. <2#LF
;(<pam),(<bdo),t,(<edo),<sfx
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o2BXe42_oJ`B68'&DdQs^F(o,k0JH6g/h1sOB68'&DdQs^F(o,k0JFVj/M/)S@<6-m
+=M>?B68'&D^cfNATMs7/e&._67sAi$;No?+CfG'@<?'k3Zp130fWcV@PTkO$;No?+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>Gim@<++W+CTA1D'38)A0=i;66LA]F*)IG@:Wn[A.8l@67sB83,N)E
1GBq[A7T7^+Dl%;AKZ#)@;KY!FD55-FCfN8%13OO:-pQUASlC.Gmt*.-Qk!%+EV%)FDk].+=ANG
$4R>;67sBhFDl#;%16'#66Ij@+EV%)FDk].+B1Wn%14IM-Qk!%+EV%)FDk].+=BN(%13OO:-pQU
DJpY,AS5^p+D#G$+EV%)Et&IuG]Z)0+=A:LDfd+2Gp%3BAKYYpBlY>7Aftr9+Cf)!DJj_B@q]Ro
+Cf)!DC5l#FEhmM/NP"r@:s\#A8`T4G]XB%%15is/g,(MCj@.ADIjr$ASc'tBlmp,%173%F?MZ-
-Zj$9F!,1<+EMHD?s@2[A1_nAA8ba]+EqjEDJ(=+$?UN7+>#VsFCAg(De*c/FEhm:$4R>;67sBk
ASc'tBlmp,F!+n%C11U`DKH<pFEhmj3ZoeX>@M/VBl5MEDe*cl?sm2MDIb>@De*cl?mcBjFEhmM
/NP"r@:s\#A8`T4G]XB%%15is/g)tn/KeS8Ch[a#FCfK6+C]J8+Du*?FCf]=%173%F?MZ--nlc)
+>>5R$4R>6+CoC5GA(E,+A!\dD]iM#@psM$AKXPe@;R-2BOQ!*8K_GY%13OO?s@)OB5)68FDk].
?!n*K%13OO?s@2[A1_nAA8ba]%13OO<+oi`AKYE%AKYl/+DGq/D0$hAD]j.1B+51W$7QDkFEhmM
/NP"r@:s\#A8`T4G]XB%%15is/g+S=C`mG6ASlK2@;Ksq@:XX+FCAfpARl5WFEhmj3Zoh)+?CW!
.1HUn$<Ld]@<,p%@;Ksq@:XX+FCAfpARlolDIal2BQ&$0A0>c.F:ARdAKYDtFCfK(A1eu6$4R>M
>@M/VBl5MEDe*cl?k!GP$8F.U?p%dPGqa>NBR+012D@+82.q5[A2lARB/47;?Tqj?+CfP7AKYJk
DI[6u%13OO%14jC+CI<=2g.3'DeF<'0mGHg2f(B,@;'as3H&n_0jd+P+<YlHEbo8/E+NHfAIStU
$=I(LDIb>@De*cl?k!GP$:JT=+F.mJ+EVOE@q[!%ANq;4DffP5FD,5.AU&<;@3B#q@;]j'Ch[cu
%14Nn$?UN7+>#VsFCAg(De*c/FEhm:$4R>;67sBkASc'tBlmp,F!,17+EqjEDJ()1Eb&a%%173%
F?MZ--nlc)+>>5R$4R>6+CoC5GA(E,+A!\dD]iM#@psM$AKXPe@;R-2BOQ!*8K_GY%13OO?s@2[
A1_nAA8ba]%14gB+E2IDB4W3)AT)I-%13OO1+j\YFa5*=Blmj'Bl7u$$=I(IAS5^p/TboADd?`[
$4R=k%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQUA7]RkD/"*'EcW@;DBO.DDf021DfTB"EZcqV
DJpY>AU&;+$?UN74ZX]5?s@2[A1_nAA8ba]?s@)OB5)68FDk].?!o#h$?UN7+>#VsFCAg(De*c/
FEhm:$4R>;67sBuD]iM*@;]j'Ch[cuF!+q'FE_;-DBNY8ASlJt$?UN74ZX]60H`D!0I[G<8K_P^
+EqL-F<F-tA8`T"ARf.kF(HIc+CT+0GA(E,+A!\aD%-h[>@M/VBl5MEDe*cl?k!Gt/g+Oa?XmSh
B6n-0Bf'mOG&oNVAMS472K1WrCc>]b?m'K$Ch7$rAKVEh1+j\kBOr<%Ea``pD@Hq\>@h\_/TboA
Dd?`[$<1\M+EM+(Df0).Blmp'+DGm>DJsV>FCAfpARmD&$7QDkFEhmM/NP"r@:s\#A8`T4G]XB%
%15is/g+bKCi"A>FCAfpARlp-Bln#2DJpY,Cgh3s+Dbb0ATJu'ATW--ASrW)FCf<1%173%F?MZ-
-nlc)+>>5R$:u@ND]j7;@<<V`+CoC5@V'%XF`V+:8K_GY+EqL-F<F-t@;QG\?s@)OB5)68FDk].
?!n*K0eOSV4C;T.G%Z,4EbR@OEcuL]CLo8?@lA9cEbm[A5%#LRASbpdF(HI'$8O4V?p%e-1imGJ
@rc[*G;*ZDAiXaJAN+dHBlms/?Tqj?FD,5.CN<j!ASqqa?s@2[A1_nAA8ba]%172gG]Y'BF!,@=
F<G".FCfK(A1e;u.1HW+G]Y&[3ZrNQB68'&D]j.HF:AQd$;No?+DG_:@;KXg+Du==@V'RkA0>T.
ASlK2/Kf.KEc6/C+CT>4ATDm,Df-!kFEhmj3Zoh)+?CW!.1HW0Dfm19@<Q3)FDi:2AKYr4DfB9.
Cj@.@F_tT!Eb/c(AS>`d$=I(IAS5^p/TboADd?`[$@$f?/g,:SDKTf*ATD?m+DGq/D%-g]$8se#
/g,4R+EMHDGB.V>B+52U>@h\_/TboADd?`[$7QDk.!/m1FDk].+?DP+0fga++EVjM%13OO:-pQU
Bl8*&Ch[E&DKTf*ATD?m+DGq/D0$gO+EV:;Dg-7F@<6L$Ecc#6D@HqpG]Z)0+=Jod3Zp+*%17B!
FWb@+G%De<D]iM#+E2@>E+O'+Gp%!ID.7'sARlopBP7h^?s@)OB5)68FDk].?!n*KF`))>D.7's
ARlotFCf:u$?L<'Cht5<Ec5i.%16KIASu$1FDk].?!n*K.1HV4FCAg(De*c/3]\B<3[l1nG]XB%
%15is/g,1G@;KY!FD55-FCfN8+D#e>Ea`I"ARloqEc5e;GAhM;Bl7Q+Anc'mEt&IuG]Z)0+=Jod
3Zp+*%147_>psf5A8a)>DJ(C@?rLobB2EkqATD0$<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.;f-Yi:jI.oEaU"u
DIal(FE8RGF^eis@<6L$F"SRE$:8cOGB7=<FD,5.Eb0E.F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(
AKZ)5+ED%:Bk;K2@q]:gB4Z-:+B3#c%16QQF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;
AKYf'An?'uD.Oi.AftM)FCB6+/g(T1%16KI@V'1dDCosKA8ba]%13OO1bKnY4C9de1,`W_1MqAI
B5;[1G^"7PGAfEMCiF]-5%#L!A7Qg(Bl.g*AKYVoCi!['Gp$s8FCA]gFC?;(F`(]2Bl@l3FD,*)
+Cei!FEMV8F!,R<Bl7R)+Dbb-AKZ).AKYT-ChsOf+<VdLB45UmATE&=DIIBn/0Jb;F*&OIE+EC!
ALnsAF_tT!EZf:4+DG\$B4Z-,@;]Tu@;^?5A7]glEbTK7Bm+&1FCf]=/e&-s$8jFY+AucfDg#\7
F`)>CARloqF`(]2Bl@m1+CT.u+DG\3Ec6,4+Cf>,D.RU,F!,17+ED%1@;0UnDJ(R2$4R=O$9'R[
?p%dMF*MSG2/P?aF)5i@ATqfFD0BB33HKC[?Tqj?6"FLK@3BH+FCep"DegJ0Ci"68FE1f3Bl7Q+
FD,5.F`V+:De:,6BOr;uBl7?q+EqaECM@[!+Ad?*BQ%c2F(96)E--.R%13OO3%c=]4C9mW2Iq,B
D)c\oGA(VJDe<ft0k<7U2/-i55%#L&Bm:bBH#R\C+DG^9DJsW.@W-1#F!+n/A0>r8@;]UaEb&m1
AKYYt@:WqiF"AGTF^cq9ART+\EcWcSATT&)ATVL(@4hur%15*J+<XU%@<ZT3Eb0&qFCeu*E,ol3
ARfg)FDi:2F_PZ&+CIlO<+T0>+D,Y4D'34bD09JcBl\64EaU#,ATV?k@<>p1%144#+<XWsAKYf-
DJ()6ATDW1B5_3p+DGm>@3B#tDegJ-DfT]'F<G:8A7^!.De:,(F_kl>+Cei!FD5Z2ARlotD..'g
F"Rn/%14gD/g+Oa?T2S;DD5ZV@;@T9EB#d`2Jm\_FuaA^11OZT?m%aGA0>r-D/a<&+Dbt/B5)6r
+>"^E+D,2/+ELt.E,9).Bl.9kATJu9EbT0!ATAo*@;0P#Eb0;E+A!\sF`VM5@rri8BOu6r+D,>(
ATJu-@<Q3)%144#+<X*T8Ob6R@VKp,A7]_%BIk9EEZf:BBOu3,@rHC.ARfgj@VfTuBle?<ATKI5
$4R>M>@h\_/TboADd?`[$7QDk%15is/g,4KDfol,+EV%)+Dkh6F(oN)+DGq/D0$g/$8s"i+=f)f
-X]&D-Qki1+EV%)FDk].+EVjM%13                                              ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;0+>PZn@:s\#A8bga@<6-m?SF0C@<6-m+=M>?B68'&D^cfNATMs7~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,9t-+>Y,u+>P'!1GLa00ea_*+>GZ.0PP]C?Ys=/2dfC'D,>Lc+@0m`FD,6++A$`fEcZ/:+@g*`
F*%iu4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$:K#WBl7Q+D0[7EARf:hF<FddD09Jc
F_;g_:e;d<DIakdH$!_<DI"Z(FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'F)?&4E-ZP:E[_G)
@:XOmDKL#AATJtc+Eq78+D>2+DKKH#+C]U=@;[2ZG%G]8Df-\1BQ%s63Zqg*F_ss#?nNQ2$4R=l
.Om`%+A$`fEcZ/:+D5A+F*&O=F!+n/+D#D!ARo=cDJ()1AfsB99H\.cCLnVsEcPT6+:SZsEc5T2
@;TjqDJ()(ART\'Eb0;7Bl5&2Df.j;9H\.[DJ+*#B4Z-,@;]TuFDl)6F"Spl.Nf0-%166VFWbmH
F_kS2@V$['F`MGABldir+CT@7BQ&);De=*&DBMMoATDj1DBNS*Df^#A+CT5.ARTU3%160MASu(&
ATAo4Ec5T2@;TjmEcW@3Eb-A'BOP^nASu-lA0?)1FD)e9Ec5H!F)u&5B+52a@<-!l+Du==ATDKp
+CT;2@<lo:FD,62+ED%(Bldd&G%G\:@VKq*+E(j75u:6-+AZTkASqqaFD,62-ZWc@@<,p%F`(W3
@<,p%De:,6BOr<,Bk(g!BOu3uFCAfn+E(j$$=Rsq@<iu7Ec5H!F)u&5B-;#!DJ+*#B4Z-,@Wcc8
Bl5&$:3CDMH!k\9@psFi+EV:.Gp"SNDIdI%ARfguGq'71@:O(jDg-#/A7oIa+EV:.+Co%mF=n\-
DBN.5:3CDbEbT#lC`lQ"FD,T1.U=H9FEDI_0/%3cD/abQF)Q2A@qB7jEbAr9DImoCDKTf,DdtG<
F_tZ-@kM_2Agn/rFD,5.@<H[*DfTnAGB.VDANC8-%14R/<+ohcCgh3oF^\ooF!,[?Bk(g!G@bf+
+E_a:A0>u4+D5h2A7Zm*BOr;sAThX$DfBQ)DKI">AfsikD,>L#Bl7EsF_#%m$?Trm+DG_*@;Tq*
F!*bF9H[qUD/!g3+E(j7Cgh3oF^\ooF"AG#@<6.(/0IYQ<(oSE/0IDX;H-O[:+RMd+CT.u+B'dA
+CT.u+E)@8ATDiE+t=$/%15ZL@rH7+Bk1dq+<kN;AmoOpF`S`L@;[31E+a3"A7ZlqEc5e;%16;`
@3BE$F*(i+AKYJkEcPl*A0>u-Ec6)5BHVD8+E1n4An>IoBl@lA,$cU1FEDI_0/%NnG:mBH/p:rL
B5)6t@4l,%FYA2TG%#9004T&]2)R%-ART+`DJ+#DATqZA3B/X)FDYhC%13OO:2b4sDf0B:+CoC5
A7]pqCi=9(EcW@8Eb065ASuU+Gp$U8DJF<7+E_WG8TnZcF)Pq=B4u4)FE9&D$<1\MGp%0EF)N18
DK]H/BjkIeAU,D?F`M@BBl8$2+Dbb6FDPM2@;p.+FDPN0+E(j7@<-BsGp%'HDeF*!D/F!)B+52i
BOQ!*GAh@HF<GX<F`8IGE$/RuDfp.EBQ&);@s)m8Bl7Q+A8c[0+E)-?@;Ka&FD,T6AKYW(A7T+c
DBNb6DfBb?%16T]@<-'oBk;?.@;]TuF(oK1Bl%BqATJu&ChI[,Bln$*F"SS+Dg*=?ARTUsBl7Q+
FDi:DBPD@"+CS_tF`\'"DfB9.@<?4$B-;,1+D#G4Bl[c-@<-BsH#kMZG%G]8F`S[DDIjr$Bl7^3
+Du==@V'R&@<<W#+EV=7ALns9Eb/g'%172jAKYi(DIb@B=(lk%Blk_D+CT)'Df^"C@<3Q*AftN&
Eaa59E,ol0Ea`g%Bl7Q+>A8.$@3BZ1DepP7Ado)hBQ&$+BQPk4-tm^EE&oX*GB\6`C3+<*FE_/6
AM.J2D(fj:E+O'206D,S/nf?D.1HUn$<LnPEb-A,@<Q3)8K_\X@<,m$FD,B0+C\noDfTDR%13OO
6"jp_+A!r(AKYW(F<G:>/0K.MASrV^+D,>.F*&O9DI[U-DKKH1ARloL:eW!?Ci+*3F<G10Aor;@
H"CE)F!+n(D_;J+%166LF"AG*+CT+0Derr,E,ol0Ea`g%ATB=E@3B0#F)u&3/0J@DCh\',DJ()4
ASc'j/g*l6+C]A"Bl5&-F!+m6E-68CBk.Y[E,TZ2+E(j7E-6&6Gp%'HDeF*!D/F!)B-;#!DJ+*#
B4Z-:+Ad?*BQ%c2BlbD3F`VXIFD,5.CghEsF*&O=D@Hq]+Dbt6B5)F#+Dbb0AKYo'+DbJ(B6@Wq
ATKIH;f?Ma+E1n1E,9).@rH1"ARfg)F*(i-E-!WS8K_M]Ci!ZmF<GOCDeF*!D/F!)B+52a@;]_#
@:s.m/g*GtA1Sj<F`VXICh[Zr+EMX5D/^V-Des6$@ruX0F!,.)G%De.@<QR0Blmo/F*(i-E-!QQ
%15ZLAnc-n+EMI<AKYr4DeF*!D/F!)B-;#!DJ+*#B4Z-,D/XH++CTA6Ea`I"Bm+&1FD,*#%17#q
BOu4*/g*W%EZeq<@;Tt"ALnrq+ED%'DeEs%H=\4@BOr</DId<rBjkIeAKZ,;Bl%L*Gp%$;+CIPi
6RsZp/0JPCEZf4-DKuZuFCB6+F!,R<AU,D,Eb-A8BOr<)DJXS@F(KB+Dfp+DDfBf4Df0VI+F.O?
+CT=6F`V,+F_i1/DIal/ATDs&F(o1p$=Ruu?pcS7.k>!M@<,p%FD,62+D>2,AKYl%G%G\:FD56#
Ch7-"D0[79@;]S#/g+,,AKYl/FCB9*Df-\3F!,U<Cj@0H=_2#T/.DqX+ELt*A0>T.4!8Te@r!3*
DBNY8+@@8jAT)O(AM,*(Bl.R#@<-10/0K%JAKZ28Ebo86F!,=<F*&O7Df'?0DJXS-$?^E$A0>i3
DeF*!D/F!)B-;#!DJ+*#B4W2n8mumO;e'i^E-,J1BlbD.EHP]+Cj@.GB5DiG+@0XKBl5IE?qOjN
@8gZVBlJ0%%16fj+EMHDA79=m+E_a:Ap%o4FD,*)+E2@>B6%EtD.Ra/+E2IF+E_WGGA2/4+DGq=
+Du==ATD^3F!,[8Ecc@T+B*2qAISu[@<Q3)AThX&+DkOtAKYD(An?0/@Wc0rF!,[IBln',B-:Z%
DejD:@:F.tF<G:>F!(o!>A[qaEb-A+Df9//E+*d/F'U2-FEDI_0/%B[Df@=IEb/s$Cj@XCDf%.H
Ec5K2@rs@a2`NKK3Ar`L2`EQQ/nAlL/e&-s$:u@R@<Q3)F(oK*Cgh?,Bl7O!@;U+)Ed8dGE+s3(
Df0V=@:F.tF<GLDBOu3,GA1T!Cj@.GF(Jl)Cgh3oF^\ooF"SS7BOr<)DIj7aFD,*)+DGm>D..3o
DJ()/Gp$X+H#k*FBldj+@:F%a+ED1/BQPA7Dg*=<F!+jh;+t@K+E1b0FD56-Cgh?uGmt*TBk)1%
F)PZ4-Z^D<<%V$G9OJud@<-'jDKIKR:Mq:oF`M&0Gp$O,F*))0@j#E)Dfor.F!+$sAnc-n+EqC5
C`m>.Ec#Au+:SZc;c-4r+E;O8EbT*++DbV1F!+n1E+*R!Bl7Q+FD,*#+F.mJEZee6ATD3lAKYAJ
?m'E,Bl8$(EZet*F*'#W%15I@Eb-A$;c-4r+DGm>AmoCoCj@.7Ch76fDKI"1F`\aJBOr<'@:O=r
+E2@>B6%EtD/!m#%16]Y@<?X4ATJu9BOQ!*BOQ'q+D5_5GA\OGE$/S0Dfor.+DGp?@<,p%A7]_#
@<Q3m/g*_.An>Oi+Co2,FEo!?G%G]>+EV=7AISu<+CT+0AoD^"ARlp*D]j1DAKZ).ASiQ6BPCsi
+DGm>C3=T>+CS_tF`\a;G%G]>+E)@8ATAo(@<jI7$4R>.F<G[=AKYQ%A0>f&+DlBHE,ol0Ea`g%
Bl7Q+A79a+8K`4cDKI"CD]ik7DegJ6DBO"=D.Rg&Bl7Q+FD,*)+DGm>@V&tjFD5?0Cb?/(8K_P^
DC9NKE+*d/Bk):%@<-(-+Cei#AKYDjDfp.EBQ&);F`V,+F_i1/+Cf)-DJLA5AftT%A7ZltF!,CA
+D>\;+Dl72BFP;cDf0-3+DGp?D/!WrF<GF/CLo%>DfQtEBOQ!*F(oH,Gp$p;FED>1+C]J7Bl7L'
F!,FBDdmNoD'3P7+EMI;G%G_I+A$/S$?Trm+CnntDBNG-A7ZltF!,U<Cj@-p+CoD.-ZgJT@;^00
FDi:CARuuuF=n[F$4R>=AT)O(AKYc"AT/c4ARoLr@rHO%EbTE(+CT;2@<iu7Ec5T2@;TjqDJ(LC
@V'V&+Co&)@rc9mARlotDBMS`DBMMoATDj1DC9KJ0f_-I+C]8-CEO&n>:Mo]:i^JeEa`g%Bl5%e
@;]_#@:s.$>psB.FDs8o06_Va/o#HGAor6*Eb-k5Df%.H@;oduF"]gU9J1"#D(."Y%16]cEZfIJ
D]iLtF(o,,Eb/[#Df0VW%13OO0eOS?F=2,P@;[3!AnGaeBk;1(+Eq7>+EVNEBOPdhCh4_tDBNY1
E,Tc=@;^00@r,RpF!,C5+E2@>@VfUmF"Rn/%14jC+A$Z&F!+m6F*(u4+CTJ&Gp$^>Df$V=BOr</
B5Di9@;]Tu@UWb^+EVOG@<,n"+EV:.+C\njF`_>0F_iZQ%13OO6>psZ+E(j7FD,6,AKZ#)@<6@)
F!,=.DJ<]oF*&O=DBN=^F_ss#?mg"<Eb0<1F`(`(DJ()5F^nomF)rI<DBO%7AKXfpFD,T1+EqaE
Ch,.-$4R>.F!,UHF^])/AS,Og@qfLlGp$p7A0>u-AKZ2*GqL4=BOr;pF`_;8EcW@AAfrQuF_t]1
Bk(Rf+Ad?*BQ%c<+Du+>ANC8-%159A=(lk%@<,p%FD,6,AKYQ/FCf?2Bl@m1+Dtb%A7]:9+B3#c
+Cf>1AKZ#)@<6@)+DGm>@3B`)Ed8dHEc6#-Bk&9(DIk@A%159A@;]TuFD,*)+DGm>FD,*)+DkP)
BlJ32@<?4$B-:V*F(KG9De:,#+Dkh/Ch[g*+Du==@V'S$+DG^9:jI.rDf-\ABln#2%159AFD,5.
F*(i.A79Lh+Cno&@3BW5Eckl6F`M&7+EM[8BHU`)+Dbb5FE8uUFEMP=ATJu4EZek.@<6L$F!,1<
+Dl72BHVD8D]j+;Dg)Wt4s49OA0?#9ATJu9Df6b8F^o)-F)YPtAM+E!%15R5@qB0nGA2/4+CQBs
,%PV'F!,@=F<G(3D/aW>AKkD.BQS?8F#ks-GB\6`H#IhIF^eo7@rH3;G@>T'BKpZ'>!bMhC1fCj
ATW,F+EM7=F^]B+Df-!kH#IgJ@ps6tASH7"ATAo8Ed8dKDf''-BPD?s+D#A1AKYo3+D,>4+EqL-
F<GjIFWb@+G%E9K<+ohc:jI.rDf-\:AT)O(AKYT!G\(D.:jI.rDf-\ABln#2?qti]:jHG$%16<9
H$!_<DJ=06@<5^&BQS?8F#ks-GB\6`EHQ2?@4l&.D(et(@<?QBFD,5;AU%WnF=h$;AnGUpASu!h
/Ri:5G@b?'/R^5-H$!_<DImC"/R`O-/R^5-H$!_<DJ=06@4<<.$?B]oF^oN%DKK]?+D#D!Ea`Hh
A0>8TF_ss#?m&p$F<GRGBk(ppGp%<BDKI!N@;p.+FDku0@j*<2$;PM`+C]8-CNCV7Bkq9&/0JA=
A0>u-AKYQ%FD5c,+B)ca:jF1*Df9G7F(KG9FD,*)+C\nnDBND2Bl%l6Df-\*:3CDm:jHFX$?T]l
AKY]/+D,P4+D5_'DKKH#/e&-s$;#:]FD,6+AKYE!H$!_6DJ()+DBN=^F_ss#?m''"EZf=ADeF*!
D/Ej)F!,R<@<<W*@<Q3)@V'+g%16WdBl7^#DJ()6BOr;pEcPT6+E2@>@qB_&Bk_Ht+Cf>.C`m/#
A0>K&EZen(@prnZF$CdHBOr;pDKC#5EZf(;%17AlF!2Z18g&(nDeF*!D/Ej)F'U2-FEDI_0/$gR
A7[B.F)PZ4G@>N'/n8g:06_,GBeN5(<c;Is+DG^9E+*d/Bk):%@<*J"$=Rsd+DG^9AoD]4@3BZ4
ART['GA2/4+EV:.+Dtb7+Ad?*BQ%cE+CSekDf-!kFD,*)-Z^D>AS#a%Eb0&u@<6!j+EqOABHVD1
AKYetFCfN8+A*b9/hf4,>[h8d@4iZF<+oue+CSekDf-\.Bl[cpFDQ43$?L?/E,Tc=F!+jcF_ss#
?m&luEaa67+DkP&Bl7Q+BlkJ/@<6]:FDi:CG@>G5A79Rg+DG^9@;]TuDfp.EDe9FcFD,5.8hX"d
FD,T1+D#G6Bl\-0D.RU,F"SS,F=2,P@3BK+AKYo'+EV:8F(HJ'ATMr9De:,$DffY8GAhM<A9/1e
FD,B+B6,[J%13OO<+ohcAoDL%Dg,o5B-:SWF_ss#?m'$*@;Tt"ATJu&Eb-A*Ec5e;FD,5.?rLQL
:jF[3EbAc&>@:3KD,>Lc+E;O<@r!3.FCB33+EVaJDfTQ#CgAH&FEDJC3\N-sDe!i@F(8p'GqO#U
B.me6@kV_BD/abPA7]p;F`V,706),K@r$.-@<-HBBQS*-.4u&:7W3;iART(^+CIreD,>Lc+EMX5
FCf<#DKI!m+D>2,AKYr4Dg#i*ARlol+A*bfEHPu=@;KLmF=n\.+DGm>@3B)lF(8d!A79@t%17#c
+@/gt/g*`-+Eq78+DbJ,B4Yn)+Co&)BkM<pA0>?,+EV:.+ELt.AKYhuDE8n5ASrV^G%G]8Df.0M
5p15YF_tSrB+52a@<[!.EZf:@+D5_+ARp'/E+*j"DKI"CEc5c1+Dkh*BQPA,Df0W1A7]d(F*227
B-:SWF_ss#?mg"<@rc-hFDl2@+CSl(ATAo0Df9E*DJ'Cc@<<W6BOu6r+D#e+D/a<&F"SS$:eW6X
+DG_*Cis<,@q?csF!,C1G%kl;F"SS)DfTr.DKKH+Gq:(2ASrV^G%G]8Df-\A@<2kbD/XH++DG_8
ATD@'FCeu*Bl5&4Ec5f5FD5W*+D5V2A0>SsARTX&FD,*)+E2@>Anc@$DJ()(Ec5e;FD,6&/e&.Z
+EM[HE+NO$+D>=/GAhV?A0>>m+D,FuFED)7ARlp*BOQ!*5u:5tBOPs)D09r/FCeu*@;]Tu@rH1%
DJ=E.A0;<gF*)G2DJ*N'DIn#7GAhM<A9/l%DIak]+EV:2DJLA+G%GP6H=^N$Dfp+D:jI.rDf091
FCB55GA1l0+CSo'AS!!+BOQ!*:jI.rDf-\3Et&IeASc'nBQS'9+EMXF@;]^h+EqaECh,.-$4R=e
,9n=0Df'&.?qti]E-Yh6@;]Tu8g%\i@;Tt"ATJ:f%16$FCh7*uARloPG[YH.Ch7Z1Ao_g,+BrN$
FDu:^0/$jS@rj8D@qfn-/oPcC04]!205boLE-X$GATf_LF(KAFEHPu*CNFT+Ec`pIFDYi"-tm^E
E-"&n04]!2F"VNDBlJ>MDfTJDA8bs2DKTf8GqEQ<Ft[uZATBGDF_P?$F*(i2F=q6KD/:X1$;Yed
E-67FBOPs)@V'+g+EM[EEb0<5ARlosATD?7+@^9i+CQC0DfTD3A7]jkBl%?k+Dbt7CER&-+EV:.
F(HJ*G[YH.Ch7Ys$=\$oGB7=<FD,5.8p,)uFCfJ8DJsW.@W-1#3ZqX%F_ss#+CT.u+A*bn@;BEs
;g2eaF<EkiEaa599Q,)c>pq-S%13OO,9nEU6ZQaHFD5W*+EM76E,9).@<-BsH#jE%%144#+<VdO
+Du==E-Vm"#p<Y!4WnW]/n&d/DJ*N/0f:C4Eb0<*@;od+1FsY+.1HUj+:SYa+AP6U+A*(M#p<Y!
4Y@j5+>k8e+DEGN0f9CI+:SZ#+<VdL,9UlHD/ab0$4.h`+?^ibE%YR>Eaa5A>;@`c/2UW]%13Ca
%13Ca:-pQU8du+6+CQBU/g)nl1E\L`$4.ga$4.h"+Du==E-Vm"#p<\"4WnW]/n&d@@<j8*-o!>3
/2Ab4.4cSi1b:L82CVo\%13Ca%13Ca:-pQU8du+M+<VdL@N[fd+>GK++>P&q+=oPr1a"Xu2@U!&
$6UH6+<VmODKTf8Gmt)e+CcNW+Du-N@<-BsGpje>+BpQO10lFR>;Ife>p*E(+CoS>E+M1BDf'H0
AU#=H%13Ca%13Ca:-pQU8du+6+DNMO0d&4o/34n0+>aN7#p9Za#p:H8DKTf8Gmt)e+Du-NH=_,8
F!r.Z1Ft@3+=Ra,#p9Za#p;u0/g*aq$4.h2+>b2d+>=63#p9Za#p:H8DKTf8Gp"[]@;Kau@psIj
F!+n3Eaa59GA2/4+EqL-FCfW,EZf(;+DG^9D.RR&Ed8*$#p=,)/nJm=FEo8W-o*>0.3L&K$4.ga
$4.hM67sBQ+>"^YF(KD8Anc't+>"^W@:j(k+C]J8+EM@;G@be;FD,*#+Du==E-WgP+EVXHF*&OK
BOQ!1F!,17+Dk\,DfU+GD.Rg&De':a#p:uG1E[qc0J5%50JO[Z$4.ga$6pc?+@9LXBk&9(E+O&u
FD5Z2Et&Hc$6UH6+<VmODKTf8Gmt*'+<VdL@3@]UDK%4:EcPT6-m2_L0J#"6/2T%32)&;Y.1HV,
+<VdL@N[fVDK%4:Ea`iuALJZX+=Ra,+<VdL+CcNW+CQBE+CYce+<VdL+:SZ#+<VdL:-pQU8du+M
+<VdL@3@]c+>PVn1GBq.0H`5,%144#+<Ve9+?_>"BeCMb%144#+<Ve:+?_>"@3@-E@LWYe+<VdL
%144#+<VdO+Du==E-WQX+E_a:F!,FBAThd+F`VAE+Co%qBl7Km+=L\J%144#+<Ve9+=\LC%13Ca
%13Ca:-pQU8du+M+<VdL@N[-C@LWYR$6UH6+<VmODKTf8Gp"[]F`V,8+E2@4G%kl;F)6+EA7]@e
DIm?$-t+P6$6UH6+<WBm+=\LOE%Z3GDCApB%144#+<Vd9$6UH6+<XEG/g*aq$4.h00H_hf0d(Be
+CP]d#p9Za#p:H8DKTf8Gp"[]@W-1$ARTIt+CT;%+B3B(AKYE!A0=?MCia.s$4.h`+?Uc&2%9m!
+:SYa+<r"$+>"^FDf9H'@;^-/@<,p%0d'nBA0<Q8$4.h`+?Uc&2%9m!+:SZ&,9n<sEcPT6+E2@>
@qB_&Bl7Pm$4.ga$4.h"+Du==E-Vm"#p<Y!4WnW]/n&d@@<j7D>?`g50jQ=Q>;.T_?!SR%%13Ca
@N[fVDK%4:EcPT6-m2_u1+Y+b/0J.Q/2UX<+=Ra,#p:H8ASbppASuU6Bldi.E,ol-F^oM&$6UH6
+<Y)8.Ni10$4R=b+<VdL:-pQU8du+M+<VdL@3@]c+>Fun+=oPr0H`(Z$6UH6+<Y,94Y@j4+>=oh
3Zp4$1^sd7+<VdL@3@$B@LWYR$6UH6+<VmODKTf8Gp"[]D..O,Bm:b>Ec5K2@rr.e+<VdL+Du-N
A8cQ<@4WO1.1HUn$6UH6+<XEG/g*b//Ken=FE2)?+E2@>A9DC(%144#+<Ve8+=f)f/g)Vd@L4.d
$4.ga$4.h"+Du==E-WQX+E_R9AoD^,+E2C5F_#D5Ea`irDf#pj#p<Y!4WnW]/okB<A8c<;Ea`ir
Df$mF-o*>0.3L&K$4.ga$4.hM67sBQ+>"^YDJ<^$Ebuq<F(KK)D]j(/DId[&%13Ca@3@]c+?pu(
+>Y,c+>=63#p9Za#p:H8DKTf8Gp"[]F*2=B@;Ka&@<-BsGp$[7ASl!rFE8QV+DG\3Ch[BnF<GU4
G%GJ!$4.h`/ou/P-t+P6$4.ga$4.hM67sBQ+>"^WF_r70Cht5&EcPT6+D#A#D.RU,Et&H_+=f)f
/0J@1$4.ga$4.h"+Du==E-Vm"#p<\"4WnW]/n&d/DJ*N/0et11Eb0<*@;od+1Ft@3%13Ca,9V&M
D'3b/+D"tkBHUf'CisT4%13Ca@P2_ED(&h;BlcEk.1HUj+<r"GBl5&3AftYn@q[!*Dg)Wt#p<\0
D/!l9@<cL-4Y\Ap$4.h"+CfP2F_kK.Bm+&1F*2=B@;Kk"B-:bo@q[!*Dg)Wt#p<\0@s)X0F_rO8
G\M4^0e!P=+<VdL+<r"NEa`j,E,Tf/%144#+<Ve9/lW-"%13OO+<VdL+AP6U+A*ac$6UH6+<Y,9
4Y@j5+>b2d+DEGN0es1F#p;u0/g,4XD'3b/+D"tkBHUf'CisT4%13Ca.k`#S%13Ca:-pQUD/!l1
De:,'@:NsnEc6.2$4.h;/h\D'+CYce#p;u0/g+YHD09Z'FD5o0+EM[B+CT))DJ()'@:NsnEc6.2
$4.h*03f\U+CYce#p;u0/g,7V@;^.*Df]J!$4.i&3Zql@$4.ga$6pc?+A$H]AU%p,B-:W#A0>r0
Bk(jpB+51W$6UH6+<VmODKTf8Gp!P'#p<Y!4WnW]/n&d/DJ*N/0eb%!.OlPs+<VdL+<r!Y.NiS:
Ebf3(GA\O8DfT]'FED57B+51S+CSJ0>n%,I+CSJ03]11P$4.h`>9GsL3\<'l+<VdO+ED%:ATDj#
C^g^\$4.hM67sBQ%13Ca@3@]c+=LqV+>GQ!+C60H%13Ca1*Cod@1<PM+=Juf.j/OY+>YGhHQZ`+
$4.i&/g+R3$4R=O$4R=b%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13OOC2[X)De*cnD.GC\+^85#C2[X)De*c=E,K;;+CIf;6sq-::IItf$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^
:IJS5@;]TuBlnD=F*1r%CghC+ATKIH%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7
EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/g(T16?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6
BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKIH%15C;F)NTPEb/Zi+Br5eBleB7Ed99SA7/[kBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E905,'@FDl2F/o>,J+:S["
D]j+4AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1
Bl&&;D..NtEbSruBmO>C%13OO7W3;iH"CE)F!+$sBOQ'q+DkP$DKK<$DIm?$@3BN0Bm*p,AKYr4
De`inF<GC<B-;;0@<<W+DI[L*A7]fk$=HJ%6sq-]DfTVG+A!\nAThX*+<kcI@Vfb"BOt]u+EV:2
F!,"3@s)X"DKI"5DfQtBBOr<-Bl.g*AKZ#)@<6@)%172j@<<V`+Co1sDC9NKG@>B2+EVNEBl.g*
Gp%3B@<<V`+CT+0@rH4$BlnH2DJ()6D]iJ+H$!_6DJ(RE:2b>!8K_GY+Cf>,D/"*6Bl7Pm$?U2/
Anc-sF(f9*B-;;0AKYSrG9Cp;D..-rBl7Q+?qO3_?m'&m@<?X4ATKIH%13OO?s@)OB5)68FDk].
?!n*K%14gB+A$EhCh7HpDKI"/D/O/t+>"^Q@<6O%EZf7.D.Oi+BleAK%13OO1+j\@D/a<&D.RU,
+CK57F'p+B+ED%+F_kK,+D#e:Eb0<5Bl@l3F(Jd#@q[J;8g$)G0K1+f@<3Q3AT2Ho@qB0n:d\,L
+EqOABFP:k+<Xlb6W-?.>psB.FDu:^0/%9SEb-kAEb@%8F`MM6DKIOBDdtG6FDYhIBl7HmGV3ZO
D/:XR+B3#gF!+t+@;]^h+DkP4+ED%7F_l.B%144#+DG^9?ugL5?m'K$EHPu9Bl7Q+DIn#7G%G]8
Bl@m1+E(j78hM4q$4R=u/g*`&E,9*&ASuT4?t*b[FC64C+C\bhCNXS=B4Z0;%13OO1bKn<Eb/[$
AKYhuF*(u6+EV19F<G%8Bl%<&D.-ppD]j+8D/!g#@<*K4D]iFsF_PZ&C2[WnBleB:Bju4,Bl@ls
+DG^9FD,5.?qO3_?m&ukG%GK.E,B0(F<G+.@ruF'DIIR"ATKI5$4R>"/g*`&E,ol?AKYE!A0>H.
FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO
%144#+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>"/g+&'G%l#/+CJr&A1hh3
Amc`5+EM+*+ED%0@<?'k+Br5gDe*Bs@pgEuEc5](@ru!)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A8bs,/g(T1%16KIASu$1FDk].?!m                                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-Zid0FDk].-RgSp4=iTBFCAg(De*cn@UX=l@p^oD-RgSp4>8$7.4cl00I/>$/1<VC
4"akp+=A:GG%Y0!A0>W*A9;a#DdR?l-RgSp4>JTF3&!-E0J5.@2`W]O0JYU<?SX;i3&!-D3%d!H
2`W]O0JYU;BeD+_1+=b&4>JTF3&!-E0J5.A1Gq0P1,Ud:0J5%72)@6I0KCgF2DHsH2`!-I.VULj
+>G;r-p01/0I\P$4>8$7.4cl01*A=t1,(FB0JbF?/iG^E0JP@;2`W!90JPO@1G^^;2)[0E2`*EO
3$9t10fUjC1GCF>3&!*F3AW?I+>PW*3&!-E0J54A2D@'M1,(F3/1<V8.4cl00I\P$4>838-p014
/3GT                                                                      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
