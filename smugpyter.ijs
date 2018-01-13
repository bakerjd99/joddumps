NB. JOD dictionary dump: 13 Jan 2018 11:10:02
NB. Generated with JOD version; 0.9.992 - dev; 33; 5 Jan 2018 18:20:50
NB. J version: j806/j64/windows/release/commercial/www.jsoftware.com/2017-11-06T10:03:54
NB.
NB. Names & DidNums on current path
NB. +---------+---------------------------------------+
NB. |smugpyter|222940491384479426302418047456064767038|
NB. +---------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


NOPIXELSKEY=:'0z0'

NORATIOKEY=:'0z1'

SMUGPRINTDPI=:360

SMUGPRINTSIZES=:<;._1 ' 3.5x5 4x5 4x5.3 4x6 4x8 5x5 5x6.7 5x7 5x10 5x30 7x10 8x8 8x10 8x10.6 8x12 8x16 8x20 8.5x11 9x12 10x10 10x13 10x15 10x16 10x20 10x30 11x14 11x16 11x28 12x12 12x18 12x20 12x24 12x30 16x20 16x24 18x24 20x20 20x24 20x30'

SMUGPYTERSIZES=:<;._1 ' 3.5x5 7x10 4x5 8x10 4x5.3 8x10.6 4x6 8x12 4x8 5x10 8x16 5x5 8x8 10x10 5x6.7 5x7 5x30 8x20 8.5x11 9x12 10x13'

printsizekey_basictestdata=:16 3$<;._1 ' ImageKey OriginalHeight OriginalWidth 4wqd5Hr 3021 2014 K7JKbs8 2036 3122 nFRxBh2 2665 3731 xCdD7V8 2585 1736 sTXnpLm 2192 3289 VG2s4WG 3659 2613 kNRs3X8 1694 2543 Qjs2hr6 3848 2559 qbXqVgC 2633 3949 ZdzNXm3 1162 2506 vF4Bwpg 2531 3542 7WbqpMj 3211 2566 2cCVDMK 1846 2398 36kBgrv 2396 1991 2FzVqjP 1887 2398'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


dpiarearatio=:3 : 0

NB.*dpiarearatio v-- print area and aspect ratio for image dimensions at given DPI.
NB.
NB. monad:  fa =. dpiarearatio ilWidthHeight
NB.
NB.   dpiarearatio 2000 3000
NB.   dpiarearatio |: 10 # ,: 4888,3256
NB. 
NB. dyad:  fa =. faAspectDP1 dpiarearatio ilWidthHeight
NB.
NB.   0.0005 0.05 500 dpiarearatio 2000 3000

(SMUGASPECTROUND,SMUGAREAROUND,SMUGPRINTDPI) dpiarearatio y
:
'aspect area dpi'=. x
(area round (*/y) % *: dpi) ,: aspect round (<./y) % >./y
)

printsizekey=:3 : 0

NB.*printsizekey v-- j version of python (print_size_key).
NB.
NB. monad:  st =. printsizekey btclManifest
NB.
NB.   mf0=. readtd2 'C:\SmugMirror\Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg.txt'
NB.   mf1=. readtd2 'C:\SmugMirror\Themes\Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz.txt'
NB.   printsizekey mf0
NB.   printsizekey mf1
NB.
NB. dyad:  st =. iaDpi printsizekey btclManifest
NB.
NB.   720 printsizekey mf1

SMUGPRINTDPI printsizekey y
:
NB. image keys and dimensions 
d=. y {"1~ (0{y) i. ;:'ImageKey OriginalHeight OriginalWidth'
f=. |: _1&".&> d=. 1 2 {"1 }. d
'invalid image dimensions' assert 0 < ,f

NB. default print size keys
'area ratio'=. (SMUGASPECTROUND,SMUGAREAROUND,x) dpiarearatio f 
keys=. (#ratio) # s: <NORATIOKEY

NB. print sizes for image ratios
pst=.  SMUGASPECTROUND printsizestable SMUGPRINTSIZES
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
keys=. sizes(I. m0 #^:_1 m2)} keys

NB. image keysm print size keys, pixels
NB. smoutput (<"0  m0 # keys) ,. area ,. pst 
(s: }.0 {"1 y) , keys , |: s: d 
)

printsizestable=:3 : 0

NB.*printsizestable v-- computes print sizes table.
NB.
NB. monad:  bt=. printsizestable blclPrintSizes
NB.
NB.   printsizestable SMUGPRINTSIZES
NB.   printsizestable <;._1 ' ',reb '10x10 20x30   3x2 2x3 12x8  8x12 10x10   '
NB.
NB. dyad:  bt=. faPrecision printsizestable blclPrintSizes
NB.
NB.   0.00005 printsizestable SMUGPRINTSIZES   

SMUGASPECTROUND printsizestable y
:
sizes=. sortprintsizes y
ratios=. ".&> 'x%'&charsub&.> sizes
areas=.  ".&> 'x*'&charsub&.> sizes

NB. sizes with same ratio, eg: 4x5, 8x10, 4x6, 8x12
aspect=. ((~.ratios) i. ratios) </. i. #ratios

NB. columns: ratio, areas, printsizes
(<"0 x round ~.ratios) ,. (aspect {&.> <areas) ,. s:&.> aspect {&.> <y
)

smugprintsizes=:3 : 0

NB.*smugprintsizes v-- compute largest print size for given dpi.
NB.
NB. Computes the  largest  print size  (relative  to  DPI x)  for
NB. SmugMug images. Only images that have aspect ratios  close to
NB. the ratios  on  (SMUGPRINTSIZES) are associated  with a print
NB. size.
NB.
NB. monad:  st=. smugprintsizes btclImages
NB.
NB.   NB. read table delimited (smugpyter.py) album file
NB.   images=. readtd2 'c:\SmugMirror\People\TheWayWeWere\manifest-TheWayWeWere-X8X9pK.txt'
NB.   'keys sizes'=. |: smugprintsizes images
NB.
NB. dyad:  st=. iaDpi smugprintsizes btclImages
NB.
NB.   NB. images are dropped if there are not enough pixels for DPI
NB.   #images
NB.   #600 smugprintsizes images

SMUGPRINTDPI smugprintsizes y
:
nsym=.s:<''

NB. reduce image table on PID
images=. }. y [ imhead=. 0 { y
pidpos=. imhead i. <'ImageKey'
if. 0=#images=. images #~ ~:pidpos {"1 images do. 0 2$nsym return.end.

NB. compute print sizes table
pst=. SMUGASPECTROUND printsizestable SMUGPRINTSIZES

NB. image dimensions short x long
idims=. _1&".&> (imhead i. ;:'OriginalWidth OriginalHeight') {"1 images
'invalid image dimensions' assert -. _1 e. idims

NB. aspect ratio and print area (square inches)
'areas ratios'=. (SMUGASPECTROUND,SMUGAREAROUND,x) dpiarearatio |: idims

NB. mask table selecting images with ratio
masks=. (;0 {"1 pst) =/ ratios
if. -.1 e. ,masks do. 0 2$nsym return.end.

masks=. <"1 masks
pids=.  s:&.> masks #&.> <pidpos {"1 images

NB. largest print area for selected images at current DPI
masks=. (1 {"1 pst) </&.> masks #&.> <areas
pids=.  (<"1&.> masks #"1 &.> pids) -. L: 0 nsym
sizes=.  <"0&.> 2 {"1 pst
; |:&.> ; pids ,: L: 0 (# L: 0 pids) # L: 0 sizes
)

sortprintsizes=:3 : 0

NB.*sortprintsizes v-- sort print sizes as ascending unique Short x Long,  
NB.
NB. monad:  sortprintsizes clPrintSizes
NB. 
NB.   sortprintsizes SMUGPRINTSIZES
NB.   sortprintsizes <;.1 ' ',reb '10x10 20x30   3x2 2x3 12x8  8x12 10x10   '

(~. ' x'&charsub&.> ":&.> /:~ (/:~)&.> ".&.> 'x '&charsub&.> y) -.&.> ' '
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO20H`+n0eje/0H`)(+?2%t0esk/2BX_2+>c#"0esk00d&2++>Ynu1,^713$9q5+>Pht0f1"0
0H`),+>kiJ:JaVb78-WQ79OD;H$=1IA0>T(A8,O^FD5W*+DG\$B4W2rBl.F!F(oQ1F!,RC+EMC.
Cht5+DfQt>EbTE5+EM7CATLUB;F+8R:J4,ZCLqd8DfTA2Bl7Hq@psInDJ()+D..'g+Co2'ASuR'
Df-\.D]iq9F<GF/FCSu,E,oZ1F<GX=H=_.?/KeqLDKBo.DId0rA0>r,@;oe!;b^7^:f9k[<('PS
A7]@]F_l.BE,oZ1F<EtJ8K]T-F(KG9FDi:$BQ\0$F&6[qF!,=.@rcK1G%#30AKYo'+>Yo0;b^7^
:f9k[<)Z@l78m]4+E(j7;eU)iF<GfN9Q+f]+=LrA@q]Fp.3MQ+F_=EkB-;/6Bl8#8F(or3F(B6(
@<,pfEaa'(DfB`2DKI"0Eb/Z%@;]Tu@<6C!@rri6@<?4%+D,P4+DG\$B4W2rBl.F!F(oQ1F!+n5
+D5D3ASrVY:e>VHBl8$6BmO?+AU/#5G%G]8Bl@l3De:,2H$!_<DBL?HEbTE5?ZTq-ARB4aGq!]Q
Bl8$6BmO?+AU.Wl@<6-mFCfN8A79RgFCfN8+Cno&@3B0#EZccLEbTE5F(or3CLqc?E,oZ1FE;/B
ATMs%@VfUcDf'H9FCfM9E,oZ1F<GX=H=_.?FCAWpATM^2B5hm*DKKr6H=_/-Df'H9FCcS2@<-!l
F*&ODEbTE5+EM7CAKYT'EZf"/G%GP6A8l7(DfTr=EbTE5F(or3F)u8?F<GOCBl8#8F(or3F!+n4
+CT>$ASu$mDJ()7DJ=*5AKXobDfTqBGT][uDJ(L                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&p0H`),0K=#lBl8$6BmO?+AU.Wl@<6-m0JH6g/h1g\Bl8$6BmO?+AU.Wl@<6-m0JFVj
/M/)S@<6-m+EV19FE8R:DfQsKE,oZ1FE;/BASYk&.4u&::-pQB$;No?+Eh=:@UX@mD)reJF)uJ@
ATJtBE,oZ1FE;/BASYk&.3N&:A0>DoE+NotASuU2+Dbt)A7]9oBl8$2+C\c#AKYf-@ps1b/e&._
67r]S:-pQU+<Y<.FE2UK4$"a.EbTE5F(or3CLqc6E,oZ1FE;/BASYk&?XdGbBk)6rF*(r$FC?O>
%15is/e&._67sBjEb/[$ARmhE1,(FBC12!70F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
3,2l>0f'qaBl7?q+E1b1F(Jl)D.Rd0@:s-o@:Wn[A.8kT$;No?+DG_:@;KXg+DG\$B4W2rBl.F!
F(oQ1Et&IqF*'Q++E2@8DKKr6H=^l'H!b#hF(o-+ATMs(@<>oe$4R>;67sB7+E2%>AS`K"Bl.F!
F(oQ1Et&IqF*'*!3Zoh5-SQns+=K?#I4f4d+<tiHF=B:++>PBo+E2CD%13OO:-pQUFD,]5GB4m8
F)to5FD5Z2%14M&EbTE5F(or3CLqc63]\B<3[l1jF*')F$4R>;67sBuAS5FnBm+&1E+sQ.C`m8&
D.RU+Bl@m1%17&qF>,j=+=K?"/Mf(..3L$$."*^^/g)BXF*&im0d&5#I3<KMF:AQd$;No?+EV:;
Dg-7F@<6L$Ecc#6D@Hq$E,oZ1FE;/BASYk&+?DP+0fga+E-$+T%13OO:-pQUDJsV>ASuF/B4rE,
Bm=3*Et&IqF*'*!3Zoh5-S[;&.3L$$."*^^/g)BXF*&im0d&5#I3<KMF:AR*F#lEY:JaVb78-WQ
79M&^4WlI%HQ[9JBl8$6BmO?+AU,D;F*')F$4R>;67sC$@<?4%F!,@=F<G:8+E2@8DKI"BBmO>5
FCAWpAISucF*'*!3Zoh5-SdA00IJ:l-p/o+/nlp\,B.^G.6B75I3<KMF:ARrF*'*!3Zoh5-T<_5
0IJ:l-p/o+/nlp\,B.^G.6B:6I3<KMF>+.2.!%F3:/=bR<(TkY79M&^4WlI%HQ[9JBl8$6BmO?+
AU,D;F*')F$4R>;67sC$ATW'8DBNe)G\M#;D'3n6H=\42DfQt/Cht57@<?4%Et&IO67sC)BOu'(
D/XH++EV:*DBNM.Dfo]++E2%>AScDs$?L914ZX^43[-:$;b^7^5uUTK6W?rZ<DGq)E,oZ1FE;/B
ATMs%@VfTu;b^7^:f9k[<)Z@l78jX&Bl.BpD0%j$+<iin/j:C?+tt-'/i#+70Ie8!-9`f%+=ALG
BOPq&F^c[M4s2^*F#kFj/g`b)F)uF4$7I-<F*&iR4<Pk_D.I?tEt&IjD.I?tF$2Q,-p0O8E-$+M
+F>^`Bl.BpD0$-n@VKIrBmO?34ZX].-p0O8E-$+M+F>^`HTEK;+EMUG%13OO:-pQUCi<`m+DbJ,
B4W3"D..'g+Co2'ASuR'Df0V*$?1'.0KhH>-nlcj+u(3SD.I?tF"&4[4=GV1BeCMQE-$+M4#&14
+E2CD%17&qF>,j=+=JreHQk0eBl.BpD0%-K-p/o+/nlp\,B.^G.6B:6I3<KMF>+.2@VKIrBmO?3
+?^i%+F>5MEbTE5F(or3CLqc6E-$+T%13OO%14gN5U\?13\i$;.3L!HCht59ATMs7+E1b1F(Jl0
%13                                                                       ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A>++>Y]jEbTE5F(or3CLqcu@UX=l@k]TG@<6-m+EV19FE8R:DfQsKE,oZ1FE;/BASYk&
.0                                                                        ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n,+>Y,p1*A=p2)7*50fL41+?288E,o]7D09K1H$!V<1,2Nj/h1g\C3+67B5i-<ATAo7/M/)d
ATW'6+EMCBB5i-<ATAo4Ec5](@rs=4$4R>PDe!p1Eb0-1+=CW,F(H^.$?'Gt4$"a1D09K1H$!V<
+EMCBB4PRs+DG\$B4W3,D09J6F`_>6F!i)7+>Y-YA0<6I%16igA7o7`C2[Wi4ZX]5;f-Yi:jI.o
E[M;':-pQUCi<`m+E_a:Ap%o4F`_>6F!,17FDi9MBkhQs.1HVZ67sB.BkhQs-Qm&5F<Gua+D5_6
+=CfBE+<]mF)uJGBl%i<%15is/g)NUC2[W1+D58-+FPjbB6%r6-Y-[tG]Y;B$;No?+=Cl<De(4<
B4Z0-I4cXTEc<-KA7]suBlmp$F(96)E-*H:$7BP&De(4<B4Z0--ZjDW%14IsC2[W1+D58-+=D,K
Bl8$6BmO?+AU.Wl@<6-mFCfN8A79Rg-QjN@$;No?+EM+9+EMCBE-ZP:EZfLGATAo/AU/>+$?L'&
F`_SFF<DrRF(KAbAU/>>Eb0<'F=.M).!0Au:K(484!8l2+=nWi+E2%)CEPGVB4Z0--Za-IB5i-<
ATCdlATCFTH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R
F)?&4E-ZP:EZf=ADe`inF<GX9FEMOF-Za-IB5i-<ATCdlATCFTH#k_u:-pQUF`V,7CLqd4/n8L+
%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jS
BkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*
AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA
$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?
Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3
@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$Hm
Cb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*
FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4kg$:Zd40fr9ED..3k+@C9lEb0-14)APY+DPh*
B-:D$@r,^bEZc_W%15IEEbm6q1-73P;e:%n6ZmEiASuTOEcW?NE,o]7D09K1H$!V<-QlV9De't<
F)?&4E-ZP:E[Mu6+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?
$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]
:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`a
AR]dp+B!?"4(Mf@F`&<L-OgDP2ENWT<+U,m+B*,qCLoS5E,oZ1FE;/BASYk&+E2@8DKKr6H=^l'
H!b#hF(o-+ATMs(@<>oe$<(VPAooOm2ENWT<+U,m+@9LXBk'4Z+EDRG+=D,KBl8$6BmO?+AU.Wl
@<6-m0JFj                                                                 ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' SmugPyter NOPIXELSKEY NORATIOKEY SMUGAREAROUND SMUGASPECT'
zz=:zz,'ROUND SMUGPRINTDPI SMUGPRINTSIZES assert charsub dpiarearatio lasto'
zz=:zz,'nes printsizekey printsizestable round sortprintsizes''),<<;._1 '' sm'
zz=:zz,'ugpyter SMUGAREAROUND SMUGASPECTROUND SMUGPRINTDPI SMUGPRINTSIZES a'
zz=:zz,'ssert charsub printsizestable round smugprintsizes''                '
zz=:319{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql/[:e=bX9N+SQ=WgI8;F+8R:J4,Z+B)!77o3)T:/jVX8K^r+<C]k`8PW5`
8QnP]+B)!77o3>f78d&U>")@4A8l6kEb/["@<?4%+E2@8DKKr6H=^l'Gp%'HBl8$6BmO?+AU.Wl
@<6-mFCfN8A79Rg+E2@8DKKr6H=_/>@:F%a+EMCBB5hm*DKKr6H=_.?F)Q)@E,oZ1FE;/BATK4J
/1<V34=>)gBl8$6BmO?+AU.Wl@<6-m0JFk'/1<VC4"akp+=A:1D09JfH$!V<+EMCBB5i-<ATB.I
/1<V7,VUYu-p0UR/mg=U-QmAKC3+67B5i-<ATAo7D09K1H$!V<<HD_l94`Bi-RgSp4>J$60dJM.
0fUjA0eb4=2)@*M2E!HP+>PW*3&!'A0J5:A1H%3K0f_*61,(FB0JP7;/iP[E1,CXF1,9t-0JPO@
0ebC92`WlS0fLjI1*A>+0fUjA0ek:@2`WlU0ebUJ+>PW*3&!'@2(ggG2E<]U0JP:)1,(FB0JP:9
/iPXD0JtXH1,9t-0JPO@0ek@72`EHG1cR6K1a"P-0fUjA0JkC@2E!KN3&i]K+>PW*3&!'@1G1UE
3AicQ0KD'71,(FB0JP7</iP[E0fCsI1bg+.0JPO@0ek@72`3BK3ArcR2]sk00fUjA0eb4=2)@-M
1GLmI+>PW*3&!'@1G1UE1GUa@3AN?41,(FB0JP7</iP[F2)I9L1H$@20JPO@0ekC83B&rY2)-dF
3?U(20fUjA0JtIA2`E]R2)-dC+>PW*3&!'A0ePIG2DdEM3B8o=1,(FB0JP:9/iP^D0f1jF2DcO3
0JPO@0ebF:2`<TP2_d-H2]sk00fUjA0JtIA3&<HO1,(U@+>PW*3&!'@1bL^F1GLdH1c-p9/1<V9
0JPO@0ek@72`E`O1c.0N1+P+42E3HL1H73L0KCsD0etLB.VULj+>G;r-p07-1*eV/0fUjA0f(F=
1bpjI0Jah,0JPO@0ebC92`EQI1G_!I0d&5*0fUjA0f(F=1bpsK0f:sL+>PW*3&!'@1G1UF1c$g>
1,C^8/1<V7,VUYu-p07-1*eV/0fUjA0f(F=1GggC1b^^G+>PW*3&!'A1G1LA0f1^B3AWW;1,(FB
0JP:</i5IC1GLdI1E\G,0fUjA0f(F=2)d3G1c.'J.4cl00I\P$4>838-p014/1<V7.4dS8    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
