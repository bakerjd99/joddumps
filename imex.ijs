NB. JOD dictionary dump: 22 Dec 2021 14:46:55
NB. Generated with JOD version; 1.0.22; 32; 11 Dec 2021 15:48:27
NB. J version: j903/j64avx/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:17:57/clang-13-0-0/SLEEF=1
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


od=:3 : 0

NB.*od v-- opens and closes dictionaries.
NB.
NB. monad: od clDictionary|blclDictionary
NB.
NB. dyad:  iaOption od clDictionary|blclDictionary
NB.
NB.   od 'test dictionary';'another test dictionary'  NB. open r/w
NB.   3 od 'test dictionary'                          NB. close

1 od y
:
msg=. ERR005 NB. errmsg: invalid or missing dictionary names

NB. list all registered dictionaries (short form)
if. badjr mdt=. jread JMASTER;CNMFTAB do.
  jderr ERR006 return.
end.
dl=. 0{>mdt

select. x
case. 1 do.   NB. HARDCODE: magic numbers read/write codes

  if. isempty y do. ok /:~ dl
  else.
    NB. open read/write
    y=. boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. boxopen ,y
  if. *./y e. dl do. y opendict__ST 2;mdt else. jderr msg end.

case. 3 do.

  NB. close dictionaries
  if. badrc msg1=. checkopen__ST 0 do. msg1 return. end.
  if. isempty y do. y=. {."1 DPATH__ST else. y=.boxopen ,y end.
  if. *./y e. dl do. mdt closedict__ST y else. jderr msg end.

case. 4 do.

  NB. HARDCODE (mdt rows) display dictionary names and source paths
  mdt=. jpathsep&.> 0 2{>mdt
  ok <(/:0{mdt){ |: mdt

case. 5 do. 

  NB. return the currently registered dictionaries as a sorted (regd) script
  if. 0 e. $mdt=. mdt {"1~ /: 0{mdt=. >mdt do. 
    ok 'NB. No current JOD registrations: ',tstamp ''
  else.
    mdt=. quote&.> 0 2{mdt
    mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt
    NB. prefix command to close and unregister all current dictionaries
    mdt=. 'NB. require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,mdt
    ok 'NB. JOD registrations: ',(tstamp ''),LF,jpathsep mdt
  end.
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*A=p1-'8`DfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEr~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1"-+>Y,p0H`+n1,1^G1h^TEFDl2FC2[W<2[p+,ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK&/i#4*.!KBE.1HUn$6Uf@?o9'F
A0<6I?m&lgC3=T>ARlp*D]j+>Ec`FEAS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=e,9n<c/hen5
1*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf
-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(
G@>P8Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@
+@KpaARfg)@!d6.+>,9!+CKVG?m&ukAnc-sFD5Z2F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>
A7f3l+:SZ#%144-+<X*`BlkJ-Df'?"DIdf2A8-+(CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7
F!,RC+CT)&Dg*=5Ec6/CATAo4Df?hAE-!W@$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)
-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$
ARHX"@;]Uo@kUMa<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#
+<XlgF(oN)+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9
@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_
D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1
GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0
+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%ht
A7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)
DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF
1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk
+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lq
A0>8pDe*@#@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("
@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmp
A0=K?6m-#SEb/a&DfTQ'F"Rn/%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''
@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,
EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4
@WcC$A8,po+A,Et+CSekDf0VK+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6
EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2
Bl@m1/g(T1%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+Auce
ARTXk.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSek
Bln'-DBNA(C^g^o+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=B
DBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%
DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a
@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E4
03*(-DJ(7N0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19
FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9
@psFiF!,17+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!
/0H]%0f][M%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&
@V'Xi/SH88DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to+
+B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2
FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*
AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^h
F!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0
F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R78
8p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0G
A8Z=-AR]RrCND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@
8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.
@W-1#F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"
Df9E4.1HUn$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!r
FCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!
DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,
FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4
AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.
:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs
$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+
F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0
Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[
EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4
/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNE
FD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSek
Df-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_
FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU
:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6Derrq
EcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5
F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHj
AQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u
$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/
A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oS
Ao^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&I!+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3
F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irq
F"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:
F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(q
D.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb
+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL
+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%
ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL
+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%144#%144-+@.,fATo87@;TQu@;]LiH#m\@
+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#
Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>
+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#
Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%
+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL
+<VdL-tI3E4ZX]r@<;qc+<V+#+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<
AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%ht
GAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g)8Z%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%L
F^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+
GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3
ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%
A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%ht
Bl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-
Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q
+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"
A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM
+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=
+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96
+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4
AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*
+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH
@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-r
H#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]
B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4Ysl
Ea`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4
F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1
+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iS
ARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0
C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloq
DfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<m
F!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&
0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5f
DBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#
ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#
4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#
+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)
CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$
C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b
.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b
.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<
$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$
Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(t
F:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G
2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&
+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;
0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOs
Ec6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys
+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaE
A9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua
+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=
DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\
BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=
ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k
?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?
D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3
C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$
+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQU
DIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"c
ATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO
+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9
FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIE
H$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6
F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^
+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N
5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(
?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7
BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3
BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf
+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1
+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6
/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_
+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lg
A8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL
+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6
+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN
8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'
F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$
FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]Tu
BlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k
+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>
+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*
F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr
<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;
Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9
-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U
+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9
<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3
AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl
$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dS
F(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$
De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"
EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,
Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b
/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7
E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^h
F!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk
+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1
DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"D
Df-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,
F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=
D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&
ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]
Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs
%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2
AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUj
FCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@
;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMp
FCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.
FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@
0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%
@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9
$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g
%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO
,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9
/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(
Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWs
AKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;r
A8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#
$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6
@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6
E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6
BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7
/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].
+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4
F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL
+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc
+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf
$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(e
A8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdL
FD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL
+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!
@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%
DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78
+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH
6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2n
A8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W
%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N
3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2
FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>
+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&
De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p
$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-
FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)
AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTH
AoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/
H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#
+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-
ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''
F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(
+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#
,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,
Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6
AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<
3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul
1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$
%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-C
ATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#
AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>
F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/
A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C
8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_A
ATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO
,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0
A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_A
F('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<
DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%
DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ
:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?
F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!b
DIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7
+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrA
C2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e
/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%
$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i
%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)9
5t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"
+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,
BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!Qo
A0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/
@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'
Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&
A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In
8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c
+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdL
IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(
E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk
@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q
@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4
+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#
A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8
F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6
@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/io
EcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E.
/iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$D
A8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3
AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*
0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-
Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.
FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W
+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(
@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdh
AKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?s
BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+l
E,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@
DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i
+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$
A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'
DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-
F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6
%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b
.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-
FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.A
Eb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<
Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+
8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,
ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%
BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#
+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.Ge
BOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><
ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=
Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8
/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4
DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0
ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRX
D.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1
DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbq
A8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc
@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf
+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LB
A7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-
DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<
A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=G
F`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1
@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY8
2_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LN
De*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8
CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<fl
Ch4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4
DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$
+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$
Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&
FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seu
Df0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr
+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.
@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"
Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9
@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq
+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai
@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>Pht
FDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44
De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b
.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8
+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@n
Cige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8
D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'
/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,Oq
Bl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@
D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>A
EarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4
-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP
$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u
@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;
+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,Oq
Bl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F
+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,
/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#
.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."
Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,
%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%
0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"
DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3
Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-
+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSB
DJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'K
C3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5
CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0
@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@
Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#
+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4
+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb
>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+
$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL
+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM
%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0
DfU,<De(J6FDYh'$3                                                         ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-Z<NC.4cl00I/>$/1<V7,VUYu-p01/0I\P$4=iTBBPDO0DfU,<De(4E/1<V90JY@;
1,:U;2DHmE1H.*D0f1Cf1,(I<0etL</iGF<2`!BK0JPC6BeD+_1+=b&4>8$7.4cl00I/>$/1<V7
,VUYu-p07=1,1L=1,:I?0etaF2)6sA0e6Td0JY@;1,:O92DHsI1GppD0JP%k/hnJ(.4cl00e"Y%
4>838-p014/1<V7.4dS9                                                      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
