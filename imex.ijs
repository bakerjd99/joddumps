NB. JOD dictionary dump: 20 Mar 2018 09:32:19
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


rntodo=:3 : 0

NB.*rntodo v-- renumber items in TODO section.
NB.
NB. monad:  rntodo clTodoText
NB. 
NB.   todo=. read 'c:/mp/jupyter/smugpyter/todo.md'
NB.   rntodo todo

NB. preserve any preamble and suffix
bdo=. '`[begin-todo]`' [ edo=. '`[end-todo]`'
if. -.(+./bdo E. t) *. +./edo E. t=. ,y do. y return. end.
pam=. bdo beforestr t [ sfx=. edo afterstr t

NB. extract TAB free item text
t=. '`[end-todo]`' beforestr '`[begin-todo]`' afterstr t
t=. ' ' (I. TAB=y)} t
t=. ];._2 tlf t -. CR
t=. (*./"1 ' ' = t) <;.1 t

NB. all blanks
b=. 0 = #&> (,&.> t) -.&.> ' '
if. *./b do. y return. end.

NB. strip redundant blank lines from nonblanks
q=. I. -.b
t=. (rebrow&.> q{t) q} t
t=. ctl&.> t

NB. collect item numbers and following text
q=. I. -.b [ c=. '. '
r=. c&beforestr&.> q{t [ s=. c&afterstr&.> q{t

NB. renumber items
r=. (":&.> <"0 >: i. #r) ,&.> <c
t=. (r ,&.> s) q} t

NB. insert one blank line between items and return text
t=. }: , t ,. <2#LF
;(<pam),(<bdo),t,(<edo),<sfx
)

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
t=. ' ' (I. TAB=y)} t
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
0eje*+>P&o2BXb10fF,^B68'&DdQs^F(o,k0JH6g/h1sOB68'&DdQs^F(o,k0JFVj/M/)S@<6-m
+=M>?B68'&D^cfNATMs7/e&._67sAi$;No?+CfG'@<?'k3Zp130fWcV@PTkO$;No?+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+>Gim@<++W+CTA1D'38)A0=i;66LA]F*)IG@:Wn[A0;<g%15is/g+_B
E--@7$7@2D/NP"r@:s\#A8`S<-OgCl$;No?+CTA1D0$-n<'`hn/NP"r@:s\#A8`Si5sc"f-UT7(
/NP"r@:s\#A8`S<6RN<M%15is/g,%M+C\npBl5&)DIal3@:sWj$?UN74ZX]5+Du+>+C]U=FD,5.
BOPUq+E(j7D0[76BPD@%Gp$U1Bl5&'BPD?3%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQUDf0B:
+E)./+Co&"Bl.R+ATA4eFEhmj3ZoelBPDN1BlbD<D]iFlASu$1FDk].?!ne!Ec5i.-OgE)G]Y&[
3ZrNQB68'&D]j.HF:AQd$;No?+Co&"Bl.R+ATDi7@:X+]@qBP"%173%F?MZ--X^.fAS5^p/TboA
Dd?aY>@h\_/TboADd?`u%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQU1a"@mA7]RkD/"*'EcW@4
F`\aDD]j.5G]XB%FEhmj3Zoh)+?CW!.1HUn$:u@ND]j7;@<<V`+CoC5@V'%XF`V+:8K_GY+EqL-
F<F-t@;QG\%16KI@V'1dDCosKA8ba]%13OO%16KIASu$1FDk].?!n*K%16'JATD?)@<,p%DJpY3
FCf<1+EVNEFCAek$4R=k%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQU@;Ka&Blmp'F!+n-Eb/Zi
Gp%3;B4kdd%173%F?MZ--nlc)+>>5R$4R>DAKYE%AKYDtEb/ZiGp%3;B4kdd+CT.u+EM47F_kS2
DJsV+$=[Qh@;L$sEb/c6+:SYe$=I(IAS5^p/TboADd?`[$4R=s/g+Oa?Scs]FC]'1ATKa`3-[;n
H?`s[1LXoOCMI3??m$S%F`M%9@ps7bATA4e%13OO1+j\W4C:$j3HT1PG[W=O128aa2DJWRFD3aR
EHs9G5%#KUGAhM<A0>i&@:NjX$4R>M>@h\_/TboADd?`[$4R>1Bk/?3Dfm1EDfoQ'+Dk[S+AQis
AKZ).AKYQ/FE1e4@VfIjCERG-DIj7a.1HW+G]Y&[3ZrNQB68'&D]j.HF:AQd$;No?+Co&"Bl.R+
ATDi7Bl5&;Ec5i.+E):2ATA4eFEhmj3Zoh)+?CW!.1HUn$:u@ND]j7;@<<V`+CoC5@V'%XF`V+:
8K_GY+EqL-F<F-t@;QG\%16KIASu$1FDk].?!n*K0eOSfF`M,++E1n1DK?6o%14jC+C]J=+C]&,
@rH(!Et&Ia>@M/VBl5MEDe*cl?k!GP$7QDkFEhmM/NP"r@:s\#A8`T4G]XB%%15is/g+\9Ch[a#
FCfK6+DG^9GB.V>B-;,5A7]d(/KeqL+EV1>F:AS!G]Z)0+=CQ$ASu$1FDk].?!q&E@V'1dDCosK
A8ba]-OgE)G]Y&[3ZrNQB68'&D]j.HF:AQd$;No?+Du*?@VfIjCERG-DIml3@V'Y*AS#a%Blmp'
Et&IuG]Z)0+=Jod3Zp+*%15ZLA8`T7BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT*r$=I(I
AS5^p/TboADd?`[$8F.U?p%e+@s2L2ATDKAF)lGF2/?bYE+:eF3-&go?Tqj?Eb0&u@<6!&%14jC
+EV:.+DZ"+CLqAm$=I(LDIb>@De*cl?k!HBBOr<-ARfXrA0>T.ASiQ(F!,@=F<G[6B4kdd/e&.:
%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQUAp%p+Gp%3;B4kdd+EqOABHV22+C].qDJLA2Bl7L'
+C\o(G@b?'+DGq/D0$-nFEhmj3Zoh)+?CW!.1HVU+CoC5GA(E,+A!\dD]iM#@psM$AKXPe@;R-2
BOQ!*8K_GY%16KI@V'1dDCosKA8ba]%14gB+CI<=@q0[pH=_,21im\\F#@`E12p_]E&_lS2d\aV
+ED%0ARTXk+:SZ5/g+Oa?Y)'8CMRF#FD5qQB5(s<DK'/GG%kZ4AoqBD?m'Q)AKYc/@;BFl%16KI
ASu$1FDk].?!n*KFCf]=+DGm>DJsV>@;L$sEb/c6%14Nn$?UN7+>#VsFCAg(De*c/FEhm:$4R>;
67sBpDK]H)Bk/?(F_tT!Eb/c(Blmp'F!*%WFD,]5GB4m8F)to5FD5Z2%173%F?MZ--nlc)+>>5R
$@-Q4+D>2,AKZ)5+C\n)E,ol9ATDU4+Du==@V'RkA0>GsBFP;V>@M/VBl5MEDe*cl?k!HfG^(h`
F`))>D.7'sARlotFCf:u$4R>#2E!01F)N1BD]j7EDf01s$=I(LDIb>@De*cl?k!Gl%14M*@:s\#
A8`SO3Zp.<.3KaTG]XB%%15is/g+kGG%#3$A0>c4D.7'sARlotFCf<1+>"^XBQA$8F!+n4F(KB6
Bl@ku$?UN74ZX]60H`D!0I[G<H#IgJBOQ'q+EVNE@V$[$Ec5o.Ebp"DDKTf*ATD?m+D#5"%16KI
@V'1dDCosKA8ba]%175qDKTf*ATD?m+DGq/D%-hnFD5Q-+EqjEDJ'Cc?s@2[A1_nAA8ba]%14Nn
$7L")B68'&D]h)%+>Go++EVjM%13OO%13                                         ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1-$I5+>Y-"+>P&q0f1R,3?U("1,Lp42]sju0f:^A:/=hX;dXBP1,iT>D09JfH$!V<?m&3?<(0^p
$9^O84Ztqk4Ztqk4Ztqk4Zs5]%16!ED..I#F!+n#Dfp.EDfp/CFCB&tBl7Q+FCB6+F!+n/A0>f4
BOu3,?rLobB2EkqATD0$Ble?<ATKI5$:80BAKWce+@fF'6rP4<Ec6#?+ED%*ATD@"@q?c4FD,5.
BPDO0DfU+Q+E(j7?rToi:G-Kp?nMlq%14=),9T]hEarc*0f^d-1,(FB%13OO+=\L0G%G\:FD,5.
G@b?$ASu$$8K_G\E,96"A0<@;D.R-nF"/;SD]iJ)C`mh5AKY](@:s.m%144#+A!\h@<Q3)Df-[r
D09JcF_<<L+B3#c+ED%7F_l/@+CT;%+Dkh;ARmD9+AH9^Gp%$;+EV:.+D58'ATD4$ARl5W+<Ve:
Des?4+DYP6F!+n3AKYr'Eb8lmFCAWpGp%-=@<6@)@:F%a+CT.u+DkP)Gp$O9AKYu8ATMs-Df/um
Ch54.$6UH6<+ohcA8c=!DIIF)+Cf>+DfQt;@;^?5DJsV>@V$Zj+<kc<Dffo1Ea`p#Bk(RfCj@.E
BkM<tAnba`DKI"2Des?4/g;D\%144#+@1'iBkM<tDJ()%Des?4+DYP6F!,R<@<<W$ATW$*EZee,
BkM<+GA2/4+E2"4FDkf4@;omkEZeq<E+NO$@<?4%DK?6o+<VeNBl%T.Eb065Bl[c-A7]=kATAo-
D..'g+CT.rCjC)9F"SS,+DkP4+EVXL+EMI<AKYK$D/F3/+DG\$B4W3,AS5jkDKK</Bl@ku$6UH6
FCerqDJ=*5ATJu&DIakuCiaM;F(Jo*BkAK#F_PB#DJ((ACMdWkDK@9MGA2/4+Cf>,D/X;7@rH4'
Df]W7Bl@l3%144#+EDU@ATJu1Bkq9&.WTZJAKYo'+EV:2Eb'5@+EqO9C`mD&CiD!L%13OO,9nEU
9jr'PBHT#f/0H]%0fKOK%144-+CI<=2)d=0F>n8M0em?OEF`d0Cbdt*G@PN+AR@W/+A!r(AKYDl
A7]9o@3?!d+<Ve2DJsW.@W-1#>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a6D09K1H$!V<
04Ja9@P;S,F*(u605b]MAR]RrCND-uBl7HqDJ(7N0LThrBl7?sF<r[r6Z6dZE[<Ip:18!NF!WRq
Ao_g,,r./ADes?4,r./QE+*6f,r./ADf9Z,Bl7@$ATK.Q0O\j0,r./GD..'gF"V0GH#@(?+:SZ#
+<Y*%Dfp.EF`V87B-8[>D.R-nF"/;SD]iP.D/aW>AKW17ARTUjF*&TKDIIBnA0>B#Ci=?8/g)9.
+CS_fDId['ARlol+:SZ#+<Y-6BkM+$DImm1+EM[;AncK4GA(Q*+A!\rARTChH=^V0FD,*)+DtV)
ARlp-ARZclDes?4F!(o!+<VeJE+*W,@3BW6AnGaeBk;1(+ECn.B4W3(Afto(B4uB0@;]TuA79Lo
+EVO>ATKI5$4R=e,9n=*@<,jk+>GQ$+>PW*2[p*'$6Uf@?p%e-2g&hLH>bYqEc,SO3,*AXCMmg'
FZElR?Tqj?8K_\TG%De5@:WplASuF/B4rE,Ec5T2ATMo8FCfN8Bl7Pm$6UH6.Vim4@;^-9+C\c#
ARlooDf'3+@;^00@rH1%EZek#Ch%U(@<?4%DK?qBD]j(3@;KY(AKZ).@<<W9BOQ!*.Vim4@;^-9
%144#+E2%)CNCV,F!+m6A8c=!DIIF)+Cf>+DfQt/DIal6BOQ!*E+j03DeF*!E+ig'F!+t2DKBN&
ATAo%D@Hpq+<YB9FCfK(F*),6B-;,5+DYP6+Cf>+DfQt/Eb-A8GAeU7BkCsgEb0-1+EV:2DJ+#C
+<X!r+CT>4BkM<tDJ'Cc+<VeDF_l/6E,9).@rH1%EcW@=AU/>>FDi:1DBNY1@:s-oH#IgJ@;[3)
Bln'%@<?''@3B#fA0>r-DJ*cs+Cf)'Bk(]`$6UH6@Wcc8FD,B0+DG_'Eb/[#ATJu9BOr<%AU/K<
Eb$;&Dfor>+CT.u+Cf51FED)7F!,16@:s-oA8-+(CghU1/g*^p$6UH6GA1l0+E_a:+E)./+Cf>+
DfQt9AU,mN8TZ(l@<iu)AKW1:F_,W9Bl@lt@VfU"+D,P4+E)./+DG\$B4W1p$6UH6@Wcc8F)Z/2
@:UL!G%G\:FD,T8F(&rsF!,C5+DG\$B4Z-,FD,5.@rH1%EZf./H#k*PBl%T.De<TmEX`?u+<Y*1
DffZ(EZfLGAS-($+Eq7>+E(j7E+*d/Bln'-DJ=!$+E2%)FEMV8F"SRX+:SYe$6pc?+AH9b@qZuE
/0H]%0fKOK%144-+CI<=AN+aGC3jeU0lh/G3B1_mH#%;2DKRsJG$dF@+A$HmEc5K2@q?ck+Cf4r
F)rIGD]iP.D/aW>AKYN%D/!lrDKI"8D..'g+Cf>+DfQt/DIal!EbT0"FDbZ2F"AGF/nZdZCLqd8
DfTB0%144#+Dbb-ALns3@Vg0u?YjFhBQRW5+CJYpF_+oj@<--k/0J>0Cis;rD.R6lF_tM;+CKA,
Des!,?Y!ScCLA\9?tXLgH!b)jEbf&6+CJi&@<l3sARoLtD.!e[+<Vd9$6UH6<+ohcD.Rg&De*o3
8K_\TG%De4Df9E&A0><&+D,P4+Cf>,E-68:DJ()&Df'3+@;^00@rH1%EcW@GF(oN)+=_/DARTIt
.Ni/?AKYl/F<G.4FD5c,Cj@.EFCAWpAM,)7$6UH6;IsfY@<?'k+EDUBF!,=.Gp%'HDe+!#AKYD(
F)5Q'BQS'9+Co1uAn?!oDKI"1F`\aFCghI-Bjtmi+Cf>+DfQt9AU,mN<+oue+DkP4+C\n):J2gB
DfQ9o+<VeDGp%'KEc>r<ATKIH8K_qhCj@.I@;^00FDi:6DfT\;@:UKoDdso&Ec6)>F!,C5+DG\$
B4Z-,FD,*)+CT;%+EDCCB4u+,+ED%0@<?'k+C]U=@rH1%E\7e.+<Vd9$6UH68K`4kCht58FCB33
+C]U=F`V87B-;D0@N]0!Ci=>:DIIBnF"SS>=(Ph`@rH1%EcW@6AS,XoAKW]a2^!0`@;]UaEb$;&
Des?4+DtV)ATKJ0-tm^EE&oX*GB\6`@rH1%EcWjCDf'?6FCfK&Eb/[$Bm+&?@rH3;B6%]s0.@>;
+<Vdu+CT+0DJsV>@qB\&@;0U%BkAK0BOQ!*GA1l0+C\n)ASuF/B4rn?8K_kYGp%0MBl%T.BOQ'q
+EVNE@;p0sDIal!EbT0"FDbZ2F!,OHAnGb%ATKI5$4R=b+<X5uBOQ'q+Co%nBk1dc+EVNE@q]:g
B4W3-BOr<-H#@_4GT^p:+Cf>+DfQt9AU/>>FDi:4BleB1DJ+*+F(c\<BOu$'Ao_g,+E)@8ATAo/
AU/K<Eb'5D%144#+@^9i+D#e+D/a<&+EV:.+Cf>+DfQt.B5_Ts?m';pGp$s4FCSu,FD,5.D.Rft
C`m+uDerrl/g*_.A8c?5F<Gd9DKI"CBOr<'ATV?s+D#A'D/!lrFCeu*%144#+DGF1FD,5.@rH1%
EZf./Gp$U1@;]^hF!,RC+CQC#B5_TsBldrq+D>n//g)9-ASu!h/0JG@Ci=>:CLqd4+EqO9C`mP4
DegJ3Bkq9@%144#+CHm1A79LoF(&m%Df/r6+CHm1D.R6lF_u)?Ec>i+?n<F.0OJ^+G%#-(GA(]4
ARI,5+B3#c+CHm1?m'E/AS,Y$+Co1uAn?"(+D,Y4D'08p+<VeJFCB&t@<,m$CLqd8DfTB0+EV:*
F<G+4+Du+>+EMX5Ec`FJBln#2DKTf-Ea`d*+CT.u+E2@8DKI"BBmO>5CLqd4+EV:*F<GC<DegJ3
Bkq8h$6UH6?o<0d?n<F.1jCod/g)99BOr<*Eb/isGT^F2F)N17@<3Q5BOr<(Bk(]sE,ol9ATDm<
+E(j7D/XT3DJ()6D]j.8AKYT*Df0Y+$6UH6De:,#CiF&r@V'Xq@ps1iGp%0HEcbl'+DYP6GAhM4
F"U9b;cI+GDe*cA0ht%f:et"h?Z^3sD]j";F*&ODEc5H!F)u8?/g(T1%17/nDfp/@F`\`[+?CW!
%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/g)8ZEc,u;A8`S5+AP6U+ED%2F_tT!EZf(<ASlK2
Bl5%m:IIu$F(Jj'Bl@ku$;No?+<VeK@:s\#A8`S5:-pQUFCAf)Blmp'F!,17+B2-):EX^i@ruF'
DBO.;FD)e,@<6!&Bl8!'DKKT9AKYGjF(HIM2BZXTBk28o$7QDk%16T`@s)g4ASuT4-XpM*AL@oo
@rH(!F(KB6+<W%RDe*c6%13OO<)5nX?Ys=/2^)C2.!0B<D_?!HB.4s2;f-Yi:jI.oEaU"h:IItf
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq
@;]^hF!,(5EZeagD09JfH$!V<?m&lqA0>T.F!,OH@Uj4_F)to6/g(T16?7!gF(HJ9BOr<,AThd/
Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKIH<+ohP$=[FbAKWce+@fF'
6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+@UHbDKL#0Ci"A+$:u@a
Bl%T.BOPCd+EVO7ATVTsEZed57nHZ&F`_>6BlnVCFD,*)+EqO9C`mh?Des54Dg#]4+EV:.+E2@4
G%kl;Et&J"ATDj+Df0V=De:,6BPDN1Anc'm+CT.u+D#e>Ea`I"+CT)&+@fF'6m->TEbf5s+EV%5
CND*N%13OO?s@)OB5)68FDk].?!n*K%14gH/g*l,G%De(F`:l"FCefpAU/K<Eb'6!+EVNED..-r
+Cf4rF)rI4DIal1ASl@/AKZ/)EbSs"FE8R=DBO"C@Uj4_F)to6/e&-s$8FCj+@0OK+EM76E,9).
B45UmATE&=D.RftA79Rg+D,b6@ruF'DBO%7@<<W%@;p=2Eb0;7FD,B+B6,23Bkq9&FD,5.Ap%p+
+:SZ#+<Ve>@;KakEd8dF@;TR,+DbJ-F<G^FA79Rk/0JhQD.7's+E(j7Bl.9kATJu&DIakuDL!@8
ATM@%BlJ0.G%De<AU&;L%13CN$8FFk+AucfDg#\7F`)>CARloqF`(]2Bl@m1+CT.u+DG\3Ec6,4
+Cf>,D.RU,F!,17+ED%1@;0UnDJ(R2$4R=u/g+Oa?Xl'@3I,7VFYS)TC1Cn"0JI`2F>/#d3H/=h
?m&?YE,8rmAKYN%F^f/u+CTD7BQ%p*H=:o0Df-\ABln#2Df0B:+E)./+>"^VAT;j,Eb0;7Eb0H5
EbfB,B-;&"DL!@FAT;j(F*&O:F`(]2Bl@m1/e&-s$8a@X?p%dRB5hL.FCm=DCO0l6E+NuE1H.:%
F`B>q?Tqj?6Z6jaBl8')+CSekBl7Q+FDi:DATMr9@psFi+D,>(ATKI5$4R>"/g+Oa?Sl>:@l/%=
0JR0WE\_GhDK7XKEFgh4DeEE@?m%aGA0>8YD09JfH$!V<?m'N0ARfFdBk&8sG[k<(FD5Z2+Cf4r
F)rHU+ED%5F_Pl-F!,=.DL!@HG@b2uF"Rn/%15$H+CI<=AN"clD)lBO@Vp0F@rQL&2`#2&3H9(a
H=&jD+Auc_Bl7K):I0,FBHV/#FCfK,@;I'#DBNP*EcZ=F8p,)uFCfJ8DJsW.@W-1#/e&-s$99^]
?p%dMF*MSG2/P?aF)5i@ATqfFD0BB33HKC[?Tqj?6"FLK@3BH+FCep"DegJ0Ci"68FE1f3Bl7Q+
FD,5.F`V+:De:,6BOr;uBl7?q+EqaECM@[!+Ad?*BQ%c2F(96)E--.R%13OO0ek:'?p%dPB/X:H
@;RuI13[DE2fE;EAhdgUAi4:<?Tqj?7VR)iFEqhDF!,17+Du+>AR]RrCNCV,DIal2FCB&t@<,mm
H=\44ART+\EcWcSF*1qDBOtU_ATDiC+D#X;@qBanEa^R0$4R=s1G0eX4C;VTGVjDRAU-(N@;[o1
@V9If2K*7fEGKi,5%#L3E+*s.+ED%0@<?'k+E2@>C1Ums+EVNE@WcC$A0>8R@8pf??m''%Df$V)
;f-Yi9keWgDfT5.D.RftA79Rg/e&.1+<Ve+BOr<&Df021FCfK0+D5V$C`mG5+CQC%Df9D6AoD^,
@<<W+DId='+E(j7Ap%p+Gp$U*E-,f4DIm?$Bl.9kATKI5$4R>M>@h\_/TboADd?`          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' todo CR LF TAB afterstr assert b36fd b36guids beforestr c'
zz=:zz,'tl guids guidsx rebrow rntodo tagtodo tlf''                         '
zz=:109{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ACr2)dC7De*c]67sa0De*c/F"JsdF`_>6F!,(5EZf4-F)tc&Bl7Q+D..I#A8c[0+B2-)
:EXIfF*)IU%15is/g(T1:-pQUBl8$(Eb8`iAKZ28Eb$S>.68R\$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/Os+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9WDKKf-D]g/S+ED%2F_tT!
EZf(<ASlK2Bl5%m:IIu$F(Jj'Bl@ku$;No?+<Yc7B68'&D]gVSFCAf)Blmp'F!,17+B2-):EX^i
@ruF'DBO.;FD)e,@<6!&Bl8!'DKKT9AKYGjF(HIM2BZXTBk29-+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<Vd9$;No?+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sBjEb/[$ARmhE1,(FB9jr&r1CX[d67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB83,N)E1,'h!Ec,u;A8`n>@:Wn[A.8kT$=e!aCghC++=D8LA8`h<%13           ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QmGIFDk].+EV%)FDk].-RgSp4=iTBFCAg(De*cn@UX=l@p^oD-RgSp4=iTB
FDk].-RgSp4>8$7.4cl04?G0&0d%hd:/=hX;dXBP+Abj4<*s`cA8`Si:IIucD.G"C/1<V9+>P2t
0JPO@1GUX:1H@9G1,q!K1a"P-0fUjC1,(=:3A`KN2E*WP+>PW*3&!-D0J5.A1b^[E0f_'51,(FB
0JbI</i,LE1,q0N3AW*8-p07=0fUjC1,(=:3A`]M3AEEN.pk%c0fUjC0fUdA3A`]M3AEEN.VULi
+>PAs-p07=0fUjC1,(=:3AicQ0JbC<.kiS00JG:=0ekLA2`E`W1,(RE3%AVp1*A;#/1<V7,VUYu
-p07-1F+_00fUjC0f^jC1,1I=0K1jE+>PW*3&!-D0J5.A2)6jF0Jk[11,(FB0JbFD/i5=<0ekRB
1E\G,0fUjC0f^jC1,1I=0K1jE+>PW*3&!-D0J5.A2)6jF0Jk[11,(FB0JbFD/i5=<0ekRB1FXk'
4>838-p045/1<V7.4cl00I\P80E                                               ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
