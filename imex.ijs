NB. sha256:3d4bf93dc94983333b95e2b411ae9730b4e5cd9f8c3665cfc0a9a2906d38c69f
NB. JOD dictionary dump: 28 Apr 2023 12:12:11
NB. Generated with JOD version; 1.0.26 - dev; 2; 25 Apr 2023 13:02:57
NB. J version: j9.5.0-beta1/j64avx2/windows/commercial/www.jsoftware.com/2023-04-22T15:17:12/clang-15-0-7/SLEEF=1
NB. JOD put dictionary path: /
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|241076523857069691299699742423170947168|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BlogHashes=:3 : 0

NB.*BlogHashes v-- update blog hashes.
NB.
NB. monad:  BlogHashes uuIgnore

texpath=. jpath '~BLOGTEX/'
hash=. ctl ;"1 ' ' ,&.> sha256dir texpath,'*.tex'
NB. hash=. ctl ;"1 ' ' ,&.> sha256dir texpath,'*.pdf'
(toJ hash) write texpath,'bmpdfsha256.txt'

mdpath=. jpath '~BLOGMD/'
hash=. ctl ;"1 ' ' ,&.> sha256dir mdpath,'*.epub'
NB. hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir mdpath,'*.azw3'
NB. hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir mdpath,'*.mobi'
hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir mdpath,'*.markdown'
(toJ hash) write mdpath,'bmepubsha256.txt'

xhtmlpath=. jpath '~BLOGMD/xhtml/'
hash=. ctl ;"1 ' ' ,&.> sha256dir xhtmlpath,'*.xhtml'
hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir xhtmlpath,'*.css'
hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir xhtmlpath,'*.ncx'
hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir xhtmlpath,'*.jpg'
(toJ hash) write xhtmlpath,'bmexhtmlsha256.txt'

onedrvpath=. jpath '~BLOG1DR/'
hash=. ctl ;"1 ' ' ,&.> sha256dir onedrvpath,'*.pdf'
hash=. hash, LF, ctl ;"1 ' ' ,&.> sha256dir onedrvpath,'*.epub'
(toJ hash) write onedrvpath,'bmsha256.txt'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q,+>Y,p0d&4o1,CjK<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4D]ik1F*(\9FDk].?YXLi/oY]@
.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=
ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]TuBlnD=F*1r%CghC+ATKI5
$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:
%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/Ch4`2D]j(3G%kN3+Cf(nDJ*O%
/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3
Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSruBmO>C%13OO?s@)OB5)68
FDk].?!n*K%14gB+CI<=3GW@cDe:eFF_WiqDg5i1CGdq\CG9mA11*4Q+@C'bF(o/rEZee$A8,po
+CQC+@<6*)F(o/r@psC#Anc'm+EVNE@VK^gEd8d:@:O(qE-!WS;e^J!DKTf*ATD?m+CHZOBkh6f
+D,>(ATJu&Eb-A'Eb/[$ARl5W+<Ve9Gp$N<@UWb^F`8rU<+oig+EM47F_kS2DIn!&EZeh&+CT).
ATD?m+C]U=8l%ht@:s"_DBNA*A0>>mBl7Q+@UWb^F`;CEBl8$(B6%^.Gp$gB+CfG+FD55nCb?/(
+<Ve+BOr<-Bk1db@<*K&Bl%?'GAhV?A0>>m+EM76E,9).FCf]=+D,>(AKZ22FD)dq83ng_2)ZRj
@<6*nF"AGJ/nHXE$6UH6IXZ`p%144#+>big@q]:lBOu6;FEhm:$6UH6:-pQU@rGmh+>GetDf-\,
DJUG;ATMs7+EV:.+C\bhCNXT;+CSnkBl8!6+D>2)BOu5o$6UH60fL4aDJUFC/gh)8+<VeUIXZ_T
$4R=t/g+Oa?T3:E1H0)0CM[`CGAC`.C,@VRH?4(DD)bld?m%gTDKBN&ATAo%A7TClB-:V*BOPsq
+E(_(ARfg)Amo1`Ch\!:+EV:*F<GdACht58FDl22+CQBk83ng_2)ZRj@<6*)GA(Q*+E2IFFD5W*
%144#+E(_(ARfh'/g*_.@;R-/BPD@"Bl7Q+@;^"*BOu3,DfBf4Df-\-De*E%?njTJ+EV:*F<GdG
F_kS2D.R-n+EMXCEb-A%+D>2)BHV52%144#+CK/2FC650EZfI8F*&O5+D>2)BHV52+CJhnFC5Ob
+<VeUIXZ_T$6UH6+AP6U+EqaEA0>T-+E2IF+CT.u+CQC+@<6*)BlbD<FDl22A0>T(+CQC5ATMF'
G%G2,F)5c:/e&.1+<Vd\+>GetE-67F-[0KLA1%fn+<VdL:-pQUBOPsq+DGm>@rH4'@<,pi+EVNE
G%#30AKZ#)FE2),G%G2,/KeVFEc5t@BkAK)@<?!m+D,%rCi_3<$6UH6+>=om2]uaEF<DrTDfTA9
%144#+F\cgILQVn$8X:W?p%e*DffhPF>A#MFE]ZXFCd@GCO(2>0JPD-?Tqj?8ge[&Anc'm+Eh=:
@WNZ/@<iu/@;]^#GA(Q*+CSbiATMp,DJ()9Bl7I"GB4m=Bl%@%+E)-?A9)C-ATJu&@q0(kF(Jl)
@X/Ci+<Ve-:ei-CDf0H(@ruF'DK?qEBOu'(<_uO6BlbD8AnEY<<+oi`ALDOADJsV>D09?%+A,Et
+Ceht+CoC5AoD]4D..C&ARlo3Ch7^1ATB/0A17rp+<Ve;EbT].F!+q7F<Ft'AU%p1FC65&G%GQ5
F^]*&Gp%-=FEMVAF!*.ZAoD]4<_uO6F(f!&ATJu1Bkq9@%144#+F\cgILQW,+<Ve=AU%p1F<Dqa
05>*?A7]p<1bWo`@<,q#05>E905>E905>]LEb'5DBkh6-%144#+F\cgILQW,+<X9P6m,uXF_kS2
A8`T!+E;O<@r!2uG\M5@ASu!h+Cf(r@r!3*DBO.;DId[0F!,OLF*(u1F!,[?ASrW)F<GX9ATJu:
DJ`g$E+NPh$6UH6F(f!&ATJu%0/%BbD.PAABOPpm04eg105>]LEb'5DBkh6f/g)99BPDN1GA1l0
+Du+>+D>>&E$/b2EZeCZ:*=C^E,]B!+CoM,G%G_($6UH6GA(Q*+BD<6+DGm>De<T6%13OO1bKnY
4C9m!F?!fLApA-;E-6;3Ao)O4DfI]q1iRD@5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BE
DIal+Bl8'</g+,;ART?sBkAK*AS#C`A1e;u%14sF+CI<=2`GZ$ATi',E-cY>EH>c5FZD<>BOYt#
11*4Q+A$EhEc6,4+CT.u+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(DKBr@AKZ).AU,D=F`&=?DBNb(
FCfJ88g&2#F*(u1F"SS/@:F:#BOQ'q+Cf(nDJ*Nk+DG^9Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%15!G
+<Ve74C:!^Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CT5.
ASu$mGT_*H+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D$4R>$/g)8Z
?p%e,0k>B<CLf.VH#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2045o2F!+m6
E+*j%+E2@4AncK4Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,ARfh#Ed8d;
Df0`0DKKT2DBNk8+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s$=I(LDIb>@
De*cl?k!G                                                                 ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-UMWfB1QHPBOu64.4cl00I/>$/1<V7,VUYu-p01/0I\P$4=iTB<)5nX?V4*^?Ys=$
.4cl01,(I>0JkL=/i>LE0JYOC2DR-??SX;j1GCX>3A*0H2D?mE1c@*H.VULi+>PAs-p01/0I\P$
4>8$7.4cl00I/>$/1<V90JYF<1bg^;1bg^E3AWTQ1H6m=/het=3AEEL3B&oP1G^pJ3&EEL1Fd)k
1*A;#/1<V8.4cl00I\P$4>838-p014/3GT                                        ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
