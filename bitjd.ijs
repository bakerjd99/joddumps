NB. JOD dictionary dump: 22 Jun 2014 18:11:07
NB. Generated with JOD version; 0.9.94; 7; 14 Jun 2014 12:50:17
NB.
NB. Names & DidNums on current path
NB. +-----+---------------------------------------+
NB. |bitjd|231946941940867855249824712027398708332|
NB. +-----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BitJDSetup=:3 : 0

NB.*BitJDSetup v-- define various bitcoin/jd nouns.
NB.
NB. verbatim: see the blog post:
NB. 
NB. Bitcoin: 285 bytes that changed the world
NB. http://james.lab6.com/2012/01/12/bitcoin-285-bytes-that-changed-the-world/
NB.
NB. monad:  BitJDSetup uuRun
NB.
NB.   BitJDSetup 0  NB. default 
NB.   BitJDSetup 1  NB. load test block data

NB. !(*)=. bcp gb d mn lb bfv pbh mrt uets tb rbn

bcp=: 'c:\bitjddata\blocks\'  NB. local bitcoin block directory
gb=:   bcp,'blk00000.dat'       NB. bitcoin genesis block file

if. 0 -: y do. return. end.  

d=: read gb   NB. fetch genesis block data

NB. first 4 bytes are "sort of" block delimiters
mn=: (i. 4) { d 
'block delimiter mismatch' assert 'F9BEB4D9' -: ,hfd a. i. mn   

NB. next 4 bytes gives following block length
lb=: _2 ic (4 + i. 4) { d
'genesis block length mismatch' assert 285 = lb 

NB. next 4 bytes block format version - has changed 
bfv=: _2 ic (8 + i. 4) { d

NB. next 32 bytes is previous blocks hash - genesis block 
NB. has no previous hash and all bytes are set to 0
pbh=: (12 + i. 32) { d
'genesis block previous hash mismatch' assert (32#0) -: a. i. pbh

NB. next 32 bytes is the Merkle tree root hash
mrt=: (44 + i. 32) { d
grh=. '3BA3EDFD7A7B12B27AC72C3E67768F617FC81BC3888A51323A9FB8AA4B1E5E4A'
'genesis block merkle root mismatch' assert grh -: ,hfd a. i. mrt

NB. next 4 bytes is a UNIX epoch timestamp - rolls over 7th feb 2106
NB. there is no timezone information - it is interpreted as UTC
uets=: _2 ic (76 + i. 4) { d
'genesis block time stamp mismatch' assert 2009 1 3 18 15 5 -: ,tsfrunixsecs uets

NB. next 4 bytes represents block target
tb=: _2 ic (80 + i.4) { d
'genesis block target mismatch' assert 486604799 = tb

NB. next 4 bytes is nounce random number
rbn=: (84 + i. 4) { d
'genesis block nonce mismatch' assert '1DAC2B7C' -: ,hfd a. i. rbn

NB. next 1 to 9 bytes is the transaction count stored as a variable length integer
NB. see:  https://en.bitcoin.it/wiki/Protocol_specification#Variable_length_integer
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;*+>Y`=Blls8;e:&nE+ENlBl7K)G%#E*Dfp+D@VKpoDeX)BC1JH)Dfor=~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*AP!2)d73ATMs7FEM%f67sa7IT1cE+EK+d+EM%5BlJ/:F*)P6/e&._67r]S:-pQU<+oue
+>,9!/hS8YDfT]'FED))+EV1>F:ARP67r]S:-pQUG%G]'@<?4#3XlEk67sAi$;No?+<VdL+>,9!
/g,:SAoD^,@<?'k+EV1>F:ARP67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(i[IRJX5%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6
-OgCl$;No?+EqaECER>/+Cf5!@<*K"@<6!&DfQtBEaa$&+Dbt+@;KKa$;No?+Cf5!@<*J<-OgCl
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
:-pQU/ULGc;cFl<<'aD]I4Ym8%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>Y-"+>P&t3&besC-lWV8jkEh:-pQ_E,o\[Blls8+EK+d+@9da8jje@Ec5](@rri7ATW'6
+EM%5BlJ/H%15is/g(T1:-pQU:i^,d@<,duBl@m1+D,P4+A*bKF_l=G1,LR<2(Tk*0JPC,@rH6s
ATD@"@q?d%Eb0<'DKK</Bl@lA%15is/e&._67sB\F(oN)+EV:.+A,$EA79Rg@UX=h+CSekDf-\>
D]iJ+@;L48AKX<RFCT6'DBND)De!Q*A79Rg/e&._67r]S:-pQUG%G]'@<?4#3XlEk67sAi$;No?
+<Vd]+ED<A-ZF*@6>:O66mj*]+E(d54$"`uBln*#+E_d?Ci^sH>9G^EDe't<-OgDX67sB'%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F`&ri%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l*C3=DL1*CX[@<-H4GAhM;+E)-?E,oN2ASuTuFD5Z2%13OO%15is/g,">CLo/1G\(B-FCcS9
ATW'6%16igA7o7`C2[Wi+?_b.-UMNh8jlThFEMOM%16oa+DPh*B+527Blls8;e:&nE$-hD$4R>;
67sBiBlmj'Bl5&&Ci<g!+C]A&@;BFp+D5_5F`7csC2[Wq?YO7nA7$HB3Zoe:Blls86>URMCI3&Q
@;BFp-OgCl$;No?+C]&,@rH(!+A,$EB6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqK%13OO
%17/nDfp/@F`\`R6>:OODeX)B8jje@Eb0<'DKK</Bl@l3E,ol3ARfg)F(KH9E%WL          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<(<''BitJD''),<0$a:),(<(<''BitJDBlockBreaker''),<0$a:),<<;._1 '' BitJDS'
zz=:zz,'etup BitJDSetup assert hfd ic read todate tsfrunixsecs''            '
zz=:122{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,'h,+>P&s+>kkr0fL452BX_.+>Pc?Blls8F`V+:8jje4@<>pe@<6!&@:WneDBO%>+CT.rCjC><
+@9da@rH(!+C]/*@r!2t@<>pEBlls86>URMCI3&Q@;BFpE+*d.AM7V>FE1f"F<GX9Ch7*uARlot
FCf<1+D,Y4D'2/ZFCT6'DBND)CMn$-DJh(;@<<W$Ci<g!+D,>(ATL1PF@nr"ATW'6F(KH9E$.J]
FCT6'DD+UM+E2@>C1Ums                                                      ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A7n2_d1!Bln*#+>"^&Blmj'Bl5Rr6m-&cE+O'(D.RU,Et&I>4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`-$=I=WFD>>o+DGm>@3A0<6m-#S@ruF'DIIR2+EV:*F<G(3DKK<$DK?q1
De*Dg$?pN)FED)3+EVNE@;]LiH$X$E6>:OODeX)3@VfsmCER.rFC?;9Bln#2FD,5.%16<36m-#K
FCAWeF(HJ8H#n(=D-\Q'FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeMb_A8c@,04\L5@4uA+
.4u_P$4R>M@VKq!A7-O(@<3Q%AThX$DfB8u+EqL5Ch4%_E,oN/@<-("B-:V*E,oN2ASuTuFD5Z2
+D,P4+EV:.+A-cmGp"k!/M]17+>PW*1^sdr8g#lC0f1"_Df0/uEb0,uAR-]tFEDI_0/%NnG:mWO
De=*8@<,p3@rH3;C3OB-BeMhlD/FE5BlnVR6Z6jSATD@"@q@DL0f1+R@q]FaF_kV<+:SZlDBMns
Ec5i;D]hhnFCB3(D_;J+%144#+<VdL+<VdL+Co1s+>=o\%144#+<VdL+<W0d.kN>)/M/J)/M/P+
.h)h.+<VdL+<VeS0mmGEFD>?6F`_>6F*nE(+<VdL+<VdL.kN8'/M/P+.kN>)/M/I^$4R>@AS!!+
BOr;qCi<r/E,Tf>Bl7R)+D,P4+Dl%;AKYMpFCAm"F"Rn/%14gB+Bq0QART@gDJ((YBlmj'Bl5%[
Ci<g!F!,[@FD)dh>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0.@>;1+j\R;fH;aF`(u/
DJ()+DBM8[FCT6'DBM8^De!R(+EqOABHTo8>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
0.@>;%13                                                                  ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}