NB. JOD dictionary dump:  4 May 2018 13:44:56
NB. Generated with JOD version; 0.9.993 - dev; 14; 9 Apr 2018 09:07:28
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


PLACEITEMS=:<;._1 ' lat lon display_name address'

REVGEOCODEURL=:'http://nominatim.openstreetmap.org/reverse?format=json&'

STATECOUNTRY=:<;._1 ' state country'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


placefrlb=:3 : 0

NB.*placefrlb v-- place names from latitude and longitude.
NB.
NB. monad:  bt =. placefrlb flLb
NB.
NB.   placefrlb 43.58955 _116.22855

'l b'=. (8!:0) y  NB. handles J negatives
rq=. REVGEOCODEURL , 'lat=' , l , '&' , 'lon=' , b
json=. gethttp_wgethttp_ rq
dec_pjson_ json
)

placerowlb=:3 : 0

NB.*placerowlb v-- key location items from (placefrlb) result.
NB.
NB. monad:  blcl =. placerowlb bt
NB.
NB.   placerowlb placefrlb 43.58955 _116.22855

NB. (*)=: PLACEITEMS STATECOUNTRY
'missing place item(s)' assert PLACEITEMS e. 0 {"1 y

NB. current place items !(*)=. lat lon display_name address
(PLACEITEMS)=. (0 {"1 y) i. PLACEITEMS
r=. (<(lat,lon,display_name);1) { y

stc=. >(<address;1) { y 
'missing state/country' assert STATECOUNTRY e. 0 {"1 stc
NB. current state country items !(*)=. state country
(STATECOUNTRY)=. (0 {"1 stc) i. STATECOUNTRY
r , (<(state,country);1) { stc
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,'h,+>P&o1E\D4+?:Q#3?U%1+>biO792oI:I@oG79*5ZEb0E*EcYe7B4Z!kDe*E%F`M;;Cgggb
Ao_]sE,8rmAKYl!D.Rc2Ao_g,+DbJ.BlnK.AKYE!A0>],DJ*[*F_#'&CgggbEc6/<@V]P#+Dbt+
@<?4%DBNY8ASlK2Ao_g,+=M2F@:Nk\Ebo26+ED%7F_l.                              ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n,+>Y,p0H`+n2`WW92BXat0et[DBhi)U?SPo0G]Y\uBhi)U+<rU%+@U0dF_>A1:h=QaCh4_t
Eb-@l@s)Vt$4R>0DeN^&ASuT4F*VhKASlK2@<,p%+C]J-Cige<DBN@1F)>?%C`mV<D.7's+E(j7
@UX=l@j#`2Bl7EpE,9*,/e&.hBOu'(8K`(r@<-I$A0>u-Bl7^#DJ()#@W-C2+D>\;+EVNE@WH$g
CER/+GA\O?Gp$X9F`JUGCLqI,Bk(juD%-hdDKKe>@3BW.@;Ka&F(KG9De:,/ASl@+@:F%a+DkP3
Bl.o68K_G_CLq$!D0^26Ch=f6BOQ!1F!,"6Bm+3.B+52iBPDN1E,ol3ARfgH+BN5bF<G"0Bl.:#
ATJu8CLqI,Bk(juD*K.EBOQ!*FEMVAF!,@/FEMV4Ci"A>%16TYAS#moF_i1/DIal.E-,f2BleB1
@j#`%DfBN(+Dbb-AKYi8F(K0"+DG_8D]j(/B5)6r+Cf\7Bk)3K%160M@<<W/Dff]:@<?(%+Du+,
Ch4`2Ec5c1F!,RC+E2IF+CoD7DBO%7AKYr+H?s!B@;]TuB6%Ei+EV:.+DYP6@W,[qA3UM1:Msuo
+E)./+CT//G@be;F)Z/.DJ()6D]in2DIbdNDffZ(EZf=4DfBN(/e&-s$;tGJ@<,mpATMo8De:,;
Dfp(CE,TQ,FD55nC`mP*@;]dsB6,UHBl.9kBl7Km+D58'A7]d4+D#)+@ruF'DCcoN@:Nk"+CSno
/.Dr(@<?4%DII?qFEoD[DfQt3FD,Q+@qg%1+F.mJ+D>2,AKYr4Ddm-aCj@.@Dff]'ARl5WFD,6+
AKYE%AKYD(Ci=D<De:,5@s)X*Gp%';DfBN(+E)CE+EV:.Eb-jG89JcXDBO"1F_r73ASuR'FEn<&
%17/!4Wn>b<@i5@%13OOBlbD*+Cf>,E,95u@<?'k+Dk\3EbT#+FD,*)+D#V9Bl.:#ATJu9BOr<*
Ec5Dq@VKXmFEo!NBOQ!*@;ZM]@<,gkFE1f1Gp$dCD..<)BlbD<@s)W@%13OOEcu)&E-X2r+<Y3+
Afu,*G%G]8ARB(]De!]rARB@pASuR2Eb/g(D..B3CghF"FEM,*/0JbIDJ*[*F_#&43XlE=+<VdL
+<VdN+sII'+<VdL+<VdL;IsrmEc,q@F*(i4AKYo3+E2@>G%ki(AKYE!A0>B#F`);AGp$m6H$=1I
A9/l*Ec5e;CghF"FEM,*%144#+<VdL+<Y*1A0>],DJ*[*F_#&+F`V87B-:l0FDu:^0/%NnG:mfQ
ASuR2Eb/g(D..B9DfTJD%144#+<VdL+<V+#+<VdL+<VdL+<VdLEb0E*EcYf!B4Z!kDe*EdDfB9*
F*)G6ATVctE%!P!/i>UK2)Qp-/MSt</i#1A2)Qfl$6UH6+<VdL+<i!R%144#+<VdL+<Y04F`);.
Eb0E*EcYf!@rGmhF!*Ug-nm1p>?rZe$6UH6+<VdL+DbJ.Ci3l.4Wl+g@<=XYF!b^ADET:e-Qj]X
-u<=6BlnK.ALns?Df03%FEM,*.1HV,+<VdL+<VeIAThX*F(J]kAT)'sA7]+jEblj]+=CiEFDu:^
0/%3]D/!lrFD5SEDfB9*F*)G6ATVctE%Z'LB.n::G%G]8ANsdFEc#6,4_f%VDC-_R%144#+<VdL
+<Y]9G%G]8ARB(]De!]rARBIhE?ICeEb0E*EcYf!B4Z!kDe*EdF`M:@.j/Y:FDPi-%144#+<VdL
+<Y]9F*2;@F!*UgEb065ATMs7/n\a;-urmBATDj'?Y<qg@rGmh?ZK^t.1HV,+<VdL+<Ve@Afri_
0H`MA+ED%7F_l/@/ou,CFEMY3@rGmh3XlE=+<VdL+<VdL+<VeKEd9\T$6UH6+<VdL+<VdL+<VdL
+ED%7F_l/@+?^ifATN!1FE9'LF)PqE.1HV,+<VdL+<VdL+<VdL+<VeJFCB9&+?^ifATN!1FE:Y6
@:WnhATMo??!A[tFCB9&-X@/g+<VdL+<VdL+<VdL+<VdL@rHL-FE2XL4WncVF*2;@F'C##A7T^l
F)r^7>:3p!F`);AGpcl,$6UH6+<VdL+<VdL+<VdL+ED%:ATDj'?Ya4uF!*Ug>B=mpFCd!G@rHL-
FE2Y4%144#+<VdL+<VdL+<VdL+<VnLAThX*F(J]oAU/>>4WnfWCh>;@FCB&t@<,mcCLqd8DfTB0
.!'K=FCefhDfor>Ed92YF)Yr0FC/QiCh[a#FCfJU-S-Vo%144#+<VdL+<VdL+<VdL+<Y04F`);.
Eb0E*EcYf!@rGmhF!*Ug-u<I4-urmBATDj'?Ya4uF"&X_Eb0E*EcYf!CLqd4.1HV,+<VdL+<VdL
+<Ve<G[k<(F<F"s@qBV$Bl@l3@<3Q&3XlE=+<VdL+<VdL+<VdL+<VdO+DGJ+DfTD3@;^?5ATDg0
EcW?T+Du*?Eb0E*EcYe7B4Z!kDe*F#+D,P4+F.mJ%144#+<VdL+<VdL+<VdL+<Y04F`);.Eb0E*
EcYf!@rGmhF!*Ug-nm1p>?rZe$6UH6+<VdL+<VdL+<VdL+E2@8DKI9SF`(VsCh4`2D]j(3G%G]8
AKYVsDe!]rAKW:?-Qj]XCghF%DJ(C-$6UH6+<VdL+:SZ#+<VdL+<VeIATW'8DBNG-F`);.Eb0E*
EcYf!@rGmhEr                                                              ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' revgeocode PLACEITEMS REVGEOCODEURL STATECOUNTRY assert p'
zz=:zz,'lacefrlb placerowlb''                                               '
zz=:87{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0H`;020*8OB4Z!kDe*ES67sa.ATh]tDe!]rAKZ%G/Kf(FG%G]8AKYVsDe!]rBl7Q+
F`_>6F"Rep67rU?67sB[BPDN1B6%p5E$014G%G]8AKYVsDe!]rATJt:CghF"FEM,*+<Y*1A0<"2
Df03%FEM,*+<Yi9Cis<1$;No?+E_a>DJ()1E+Np.FE1r(FDYH*/oPcC+CT.u+@g?gB5D-%9jr!^
+@/gq/db??/db??/g*r/ASuR2Eb/g(D..B+BlbD*+D,Y*AKYK$D/FE5BlnVCD..-rFCAm$ARlp#
@;p1"DJ()5ATDs.@q@8":-pQU<+ohc5u:,qEb0?8Ec,q@E,8rmAKYl!D.Rc2Bl5&8BOr<&De!3l
+DbJ(B6@WqAKWBV0JPO9/g*W%EXGQ./g+YBDfTB&DIIWuF!,17+Cf>4DKKo5ATJt:FD,*)+CoC5
DJsV>F)Y]!CEQ&`B5D:'BHVS=FWbU7FCf=s:-pQUB4Z0-<E)F>3$<<SG]Y&NBl5&8BOr;/Ci<fl
C`mP&DJ+*#B4W\<<+oi`AKYN%ATJu3Dfd+1E,]AsEXGQ./g,7S+C\n)+CQB8Cgh3oF^\oo+<Y`E
ARfFdBk&8.F(KH8Bl7Q9+<X0mDeElt+<XBeE-!-EEb0?8Ec,q*:-pQUEb0<7Cij_@Bl5&8BOr<,
AT;j(F*(u(+DbJ(B6@WqAKYH)F<D]7F!,C5+A-coAKW`^0fU:GDf99)AI;1!/g*ksE-!.9F!,@=
F<G19AS!J$:-pQ?:-pQU@rc-hFCeuD+>PW*3,N)L0Jj,367sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDi*AT;j,Eb-@@G@b5:B4Z0u
FEDIL$?B]tF_Pl-+=CZ;DK]T3F>%TJF)PqD                                       ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;*+>P`nATh]tDe!]rATD@*ATDj'+D58(@rGmlDJ()7FD5Q4~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql5Z5sn(4<(0M[+AtX/7n$3@:IIWO;G833<'aJP6Vg]W<)QjAE,8rmAS,t!
@N]W+@:NkhDg-#,-RgSp4>8$7.4cl0/3G;#ATh]tDe!]rALAoX-p01/0I\P$4?P\X?SNZN+DFSZ
E*k>,FEhmMEcu)&E-Wf[/1<V9+>kE"0JPO@2)$j>2)-pE2E!9F1*A>+0fUjE0JkC=1,:OC3&3KS
+>PW*3&!3D1bLX?2`N]L2_d971,(FB0JtO@/i5@<0ebRH2)?@10JPO@2)$j>2)-pI2)I9H1a"P-
0fUjE0JkC>0f1^F2DHsB+>PW*3&!3D1bLU@0et^E2)[651,(FB0JtO@/i>@B3&WHL0fU:20JPO@
2)$j>1c%!G1H@9L2BXb/0fUjE0JkC>1cI3K2)[3H.4cl00I/>$/1<V90JPO@2)$j>2)70M1cI3M
1b1740JGIB0KCpF0K2!H1,CaI2_Zs9BeD.`0e"Y%4>8$7.4cl01*A=t1,(FB0JtO@/i>RC2`*6E
3&Mg60JPO@2)$j>2)d3I0K:pD3$9t10fUjE0JkC>2_m<K0et^G+>PW*3&!3D1bLXE0K(UE2)%!=
/1<V7.4cl00I\P$4>838-p014/3GT                                             ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
