NB. JOD dictionary dump: 27 Jun 2014 16:15:45
NB. Generated with JOD version; 0.9.95; 13; 26 Jun 2014 11:06:22
NB.
NB. Names & DidNums on current path
NB. +-----+--------------------------------------+
NB. |bitjd|16954541203725931937674789829407175055|
NB. +-----+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


AdndAddress=:'17MfYvFqSyeZcy7nKMbFrStFmmvaJ143fA'

BASE58=:'123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'

GenesisBlockChallengeScript=:'4104678AFDB0FE5548271967F1A67130B7105CD6A828E03909A67962E0EA1F61DEB649F6BC3F4CEF38C4F35504E51EC112DE5C384DF7BA0B8D578A4C702B6BF11D5FAC'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
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

NB. !(*)=. jpath bcp gb d mn lb bfv pbh mrt uets tb rbn vlen tcnt trvno
NB. !(*)=. cntinp offset hitr inptrx repsclen repscrpt seqno outpcnt 
NB. !(*)=. outsval chalen chalscpt lockt

NB. local bitcoin block directory - needs configured BitJDData folder
bcp=: jtslash jpath '~BitJDData'

NB. bitcoin genesis block file - has no predecessors
gb=: bcp,'blk00000.dat'

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
'vlen tcnt'=: vint (88 + i. 9) { d
'genesis block transaction count mismatch' assert tcnt = 1

NB. next 4 bytes transaction version number
offset=: 88 + vlen
trvno=: _2 ic (offset + i.4) { d
'genesis block transaction version number mismatch' assert 1 = trvno

NB. next 1 to 9 bytes is the number of transaction inputs
offset=: offset + 4
'vlen cntinp'=: vint (offset + i. 9) { d

NB. next 32 bytes is the hash of the input transaction
offset=: offset + vlen
hitr=: (offset + i. 32) { d
'genesis block input transaction hash mismatch' assert (32#0) -: a. i. hitr

NB. next 4 bytes in the input transaction index
offset=: offset + 32
inptrx=: _2 ic (offset + i. 4) { d
'genesis block input transaction index mismatch' assert _1 = inptrx

NB. response script length is next
offset=: offset + 4
'vlen repsclen'=: vint (offset + i. 9) { d
'genesis block response script length mismatch' assert 77 = repsclen

NB. response script
offset=: offset + vlen
repscrpt=: (offset + i. repsclen) { d

NB. sequence number 4 bytes - not used Jan 2012
offset=: offset + repsclen
seqno=: ,hfd a. i. (offset + i. 4) { d
'genesis block sequence number mismatch' assert 'FFFFFFFF' -: seqno

NB. output count 1 to 9 bytes
offset=: offset + 4
'vlen outpcnt'=: vint (offset + i.9) { d

NB. output value - number of satoshis sent
offset=: offset + vlen
outsval=: (offset + i.8) { d  NB. 64 bit unsigned integer
'genesis block satoshi output value mismatch' assert '00F2052A01000000' -: ,hfd a. i. outsval 

NB. challenge script length
offset=: offset + 8
'vlen chalen'=: vint (offset + i.9) { d
'genesis block challenge script length mismatch' assert 67 = chalen

NB. challenge script - contains elliptic curve signatures
offset=: offset + vlen
chalscpt=: (offset + i. chalen) { d
'genesis block challenge script mismatch' assert GenesisBlockChallengeScript -: ,hfd a. i. chalscpt

NB. last 4 bytes lock time - not used yet Jan 2012
offset=: offset + chalen
lockt=: (offset + i.4) { d
'genesis block lock time mismatch' assert 0 0 0 0 -: a. i. lockt

'Genesis block parsed'
)

b58fd=:'123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz' {~ 58x #.^:_1 ]

dfb58=:58x #. '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz' i. ]

i1=:>:@i.

vint=:3 : 0

NB.*vint v-- variable length integer byte count and value.
NB.
NB. Decodes Bitcoin variable length integers and returns the byte
NB. count and value.
NB.
NB. verbatim: for more see
NB.
NB. https://en.bitcoin.it/wiki/Protocol_specification#Variable_length_integer
NB.
NB. monad:  il =. vint cl9bytes

iv=. a. i. 0 { y

if.     iv < 253 do. 1, iv
elseif. iv = 253 do. 3, _1 ic (i1 2) { y
elseif. iv = 254 do. 5, _2 ic (i1 4) { y
elseif. iv = 255 do. 9, _3 ic (i1 8) { y  NB. 64 bit only
elseif.do. 'invalid variable length integer' assert 0
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c?I9+>P&o0d&>.+>t>t1a"M,+>Y_p1,g=53$:($2)cX8+>Yr!1*A;3+>b2t1dPYiA3ja:Eb0<5
6>:OODeX)3@:WnhATMo8AoD]46#L+IH$X$EFD,5.6t(1G+Du+>+EV:.+@L6aG%GJV5uU303'q>$
@rH(!+C\c#AKWii+CT)*BOP@]F@'\`8jlThFEMP5AS,XoAKZ/)EbTH7F!+q+FCT6'DD,a8+Du+?
DKA<ZDImm'F$a\]@r"GF@;KakDJ*NZ@rc:&FCo6-F*&NkBlmj'Bl5&'BOP^nASu-l+EM%5BlJ/:
/KePADKK<$DK?ph6UXj=+E2I4Ch[B%CLqd#2)o2Y6>:OODeX)3@UX=h+>l,$Ao_g,+D#e>ASu$i
A0>Do@qfdgC`k;PF(Jo*Ci=3(+CoD#F_t]-FC\um2)o/lFCf?#ARlooARfFk@;I&uEc5e;6>:OO
DeX)3@UX=h+>l,m0kkN9AU#>9EbT0#DBNk8AKY\>G%ki9G%#E*@:F%a+DbV,B67f0Bl8$(B4Z*+
@X3',+Cf>4DKI"0DIal5@;L't                                                 ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&s+>GZ-1h&=%An3B#2)o2Y+Ef=g+@9da@rH(!+C\c#AKWii+D,Y4D'3D7FCf?#ARloo
ARfFk@;IP*$4R>ABOr;q@<6!&2)l^iDI[TqBl7Q+F`V,)+DG^96>:OODeX)3BOPs)+EMI<AKW1=
Bk(piGp$R7De42<%16]Y@<?X4ATJt:FD,*)+<YT?AKW+:BQ&$0A0<"(AKW+(G@>N'+<YT7/g+,3
+<YN0CLnV26>:OODeX(u$=RIUEb0<5ATJt:D/XH++<Y]9@:WeUCh4_3FD,5.AoDL%Dg,o5B-8=5
ATW$*EcW?GBOQ'q+<Y-)ASqqaDf'31FCeu*Ao_g,+EV:.+CT)*BOP@]F?1Nl0IItc.!fHFD^d4[
-Vl*4+=L`.E+sE&C`mXF/0H<3-OgD2@ps=jFCAu.Bdk05DIak;CaU>RCi=N/EZek#F(HIf.4u&:
%16'JBlbD6ARTIt+EV:*F<D]JBOr;1H=_,8+s:T;+C\c#AKWii+<YQED.7'sF!)T>F!)hb-S?Ma
7W3;V$>"HjD/a<&+EV:.+Eq71Ch7]2@:WnhATMo8De:,/Gp$R4DeC2,F#ja;%14gK9kIOO7WD@P
AQiSh2f;8_@RbB:F@L+aG%!ut1c&`0%13OO<+ohcCh7$cBl7Q++=Alk+<Y?/Eb-@9BlbC>AT;j,
G%#2uDKI!DFDi:<ART+`DJ((7H=_,8F!)T>D@Hq`ARfFk@;L!-+Dbb-AKWZ\0etO;+<X?h@:X(i
B-;M3Ec6"A+=JrlF"&4S@<,p%+CoM2E,]B!+<Y-=%14Lm2)o2Y.4u`BBPDN1+DGm>DJsV>@3BN0
DdmNoD'4%9ASrW6Bk;L&DJ()$@<6!&+>l,$F*)G:DJ+#"$=Ruu+Du==@V'S$+C]J8+<YB?+<YB>
+<Y)8@VKHtE,ol+Ch7H++EqL1DBL'DBOr<-FE2)5B-:o0+CP]d6>:OODeX)3@:WnhATMoF+A??T
A8,po+F7U>Df[%<@<?U&EZet4EZcJkBlmj'Bl5&%A7T^lF)to6+UncXBOr;uBm:b7F!,RFBm+3!
C`mY>ATDm$CLnVsDIal/@:UL)Bln#2-SZu$%13OO8TZ>$+CT)-D]ib2E,Tc=@;^00FDi9EDJsW.
+EV:*F<D\mBlmj'Bl5&%A7T^lF)rI?ASu.&BHUenD@Hqr@<-WG+<XWsAKZ#%DJ*N'BlbCP2D$^A
+<Y0-@<,ddFCfK6/g*l,F*&O5A7T^lF)to6+<Y*5AKWcc%16TY@<,ddFCfK6+CT.u+A!\bASc'l
G%De)Cht58FCB33+EqOABHSZW-S>i8%16rjDII':+<Y,N3+c\D=EP&[%144#@:X7d4Y@j)0fMg=
=a!8S;gDqX@sL"N92/kbE`7'LD/FH)8hi.YAjIdR$6UH#$6UHd67sBsART+`DJ()<ATD^#F!,+,
F<G+7DfBZ,A.8kg+Co(n2)l^eA8Yoe$6UI%An!VW+=Alu0ekC1/7E(,A.8kT$6UI"A8Yp#/NP"&
/L+\7DIb1=HS-Ho-SZtk@Pp,WA0>Dp@Pp+f@:X7d+<XEG/g+k=ASuU(FEn<&%144#:-pQU@<-Bs
Gp$O9B6A'&DKKq/$6UI4+?_>"A7f:.3$<T$+CSeuA.8kT$6UI#2)o2Y+>GPm,Tq.;$4R=b+C[2f
An3#>+>Y,q+=&(N%13OO%13OO%13                                              ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
0eje*+>Y-"+>P&u0K*ljC-lWV8jkEh:-pQ_E,o\[Blls8+EK+d+@9da8jje@Ec5](@rri7ATW'6
+EM%5BlJ/H%15is/g(T1:-pQU:i^,d@<,duBl@m1+D,P4+A*bKF_l=G1,LR<2(Tk*0JPC,@rH6s
ATD@"@q?d%Eb0<'DKK</Bl@lA%15is/e&._67sB\F(oN)+EV:.+A,$EA79Rg@UX=h+CSekDf-\>
D]iJ+@;L48AKX<RFCT6'DBND)De!Q*A79Rg/e&._67r]S:-pQUG%G]'@<?4#3XlEk67sAi$;No?
+<Vd]+ED<A-ZF*@6>:O66mj*]+E(d54$"`uBln*#+E_d?Ci^sH>9G^EDe't<-OgDX67sB'%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F`&ri%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l*C3=DL1*CX[@<-H4GAhM;+E)-?E,oN2ASuTuFD5Z2%13OO%15is/g,">CLo/1G\(B-FCcS9
ATW'6%16igA7o7`C2[Wi+?_b.-UMNh8jlThFEMOM%17/nDfp/@F`\aBB-:r-A7o7`C2[Wi%15F9
F@nr"ATW'6+>=63%15is/g+V;FCT6'DBND)De!Q*@WH$gCLqN/B6%p5E"*.L67sBqDe*KfBkhQs
?Q_Km+=BKiF@nqfCi<g!6?6XGCLqN6%13OO:-pQU@VKpoDeX)38jje7Ec6)>%15is/g+nIA7o7`
C2[Wi+?_b.-UMNh8jk$9$4R=O$?L'&F`_SFF<DqtBlmj'Bl5Rr6m-GhATMF#FCB9*Df-\:Ec5](
@rri7ATW'6/gg                                                             ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<(<''BitJD''),<0$a:),(<(<''BitJDBlockBreaker''),<0$a:),<<;._1 '' BitJDS'
zz=:zz,'etup BitJDSetup GenesisBlockChallengeScript assert hfd i1 ic jtslas'
zz=:zz,'h read todate tsfrunixsecs vint''                                   '
zz=:166{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0H`,,3'q>$8jlThFEMOt67s`SBlls8;e:&nE$03R/Kf+GFEMOFGAhM;Bl7Q+ASu[*
Ec5i4ASuT4AoD]46>:OODeX)B8jje@Ec5](@rs=4$;No?%15is/g)8G$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f3WfDDF$X$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>G]fF`&rk+D5_5
F`8IAEbAfuBmO?$+:SYe$4R=O$3                                               ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
