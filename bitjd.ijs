NB. JOD dictionary dump: 29 Jun 2014 18:19:58
NB. Generated with JOD version; 0.9.95; 10; 25 Jun 2014 23:24:58
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


AdndAddress=:'17MfYvFqSyeZcy7nKMbFrStFmmvaJ143fA'

BASE58=:'123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'

GenesisBlockChallengeScript=:'4104678AFDB0FE5548271967F1A67130B7105CD6A828E03909A67962E0EA1F61DEB649F6BC3F4CEF38C4F35504E51EC112DE5C384DF7BA0B8D578A4C702B6BF11D5FAC'

IFACEWORDSsslhash=:<;._1 ' sr160 sha1 s256 s512'

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

ROOTWORDSsslhash=:<;._1 ' IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash s256 s512 sha1 sr160'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


Base58Check=:3 : 0

NB.*Base58Check v-- convert bytes to Bitcoin base 58 format.
NB.
NB. monad:  clB58 =. Base58Check clBytes

('1' #~ +/y = 0{a.),b58fd 256x #. a. i. y
)

Base58CheckModel=:3 : 0

NB.*Base58CheckModel v-- model Base58Check verb.
NB.
NB. Based on a C# Base 58 Check function. This verb  is used  for
NB. checking more efficient J versions - see (Base58Check).
NB.
NB. monad:  clB58 =. Base58CheckModel clBytes
NB.
NB.   r160b=. bfh '0070E4C4D6835A83B0DF6729F7100004F9AED4422D'
NB.   '112aDtmDBivhp7ny3PrpphqAavry32' -: Base58CheckModel r160b
NB.
NB.   (Base58Check -: Base58CheckModel) r160b NB. identity

NB. bytes to extended integer
intData=. 0
for_i. i. #y do.
  intData=. (intData * 256x) + a. i. i{y
end.

NB. extended integer to string
result =. ''
while. intData > 0 do.
  remainder=. 58x | intData
  intData=. intData <.@% 58x  NB. extended J integer division
  result=. (remainder{BASE58) , result
end.

NB. prepend '1' for each zero byte
('1' #~ +/y = 0{a.),result
)

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

NB. !(*)=. IF64 jpath bcp gb d mn lb bfv pbh mrt uets tb rbn vlen tcnt trvno
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
outsval=: ]`(_3&ic)@.IF64 outsval

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

b58checkFrbytes=:3 : 0

NB.*b58checkFrbytes v-- Bitcoin base 58 check format from bytes.
NB.
NB. monad:  clB58 =. b58checkFrbytes clBytes
NB.
NB.   NB. bitcoin public key bytes
NB.   pk=. bfh '7542FB6685F9FD8F37D56FAF62F0BB4563684A51539E4B26F0840DB361E0027C'

NB. require 'sslhash' !(*)=. s256

x80=.  a. {~ dfh '80'       NB. 0x80 byte
ekey=. x80 ,sr160 s256 y    NB. extended ripemd-60 key
csum=. 4 {. s256 s256 ekey  NB. checksum
Base58Check ekey , csum     NB. wallet format bytes
)

b58fd=:'123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz' {~ 58x #.^:_1 ]

bfh=:a. {~ [: dfh _2 ]\ ]

dfb58=:58x #. '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz' i. ]

dfh=:16 #. 16 | '0123456789ABCDEF0123456789abcdef' i. ]

hfb=:[: , [: hfd a. i. ]

i1=:>:@i.

s256=:3 : 0

NB.*s256 v-- SHA256 hash from OpenSSL.
NB.
NB. monad:  clHash =. s256 cl
NB.
NB.   s256 'dont hash with me'
NB.
NB.   s256 10000 $ 'hash it up cowboy'

NB. require 'dll' !(*)=. IF64
'SHA1 hash requires 64 bit host' assert IF64
output=. (32) # ' '
sslsha256 (y);(# y);output
output
)

s512=:3 : 0

NB.*s512 v-- SHA512 hash from OpenSSL.
NB.
NB. monad:  clHash =. s512 cl
NB.
NB.   s512 'my what big hashes you have'
NB.
NB.   s512 10000 $ 'collisions are rare'

NB. require 'dll' !(*)=. IF64
'SHA512 hash requires 64 bit host' assert IF64
output=. (64) # ' '
sslsha512 (y);(# y);output
output
)

sha1=:3 : 0

NB.*sha1 v-- SHA1 hash from OpenSSL.
NB.
NB. monad:  clHash =. sha1 cl
NB.
NB.   sha1 'this is a fine mess'
NB.
NB.   sha1 10000 $ 'a bigger mess '

NB. require 'dll' !(*)=. IF64
'SHA1 hash requires 64 bit host' assert IF64
output=. (20) # ' '
sslsha1 (y);(# y);output
output
)

sr160=:3 : 0

NB.*sr160 v-- RIPEMD-160 hash from OpenSSL.
NB.
NB. monad:  clHash =. sr160 cl
NB.
NB.   sr160 'go ahead hash my day - result is 20 byte hash'
NB.
NB.   sr160 30000 $ 'yada yada yada et cetera byte me '

NB. require 'dll' !(*)=. IF64
'RIPEMD-160 hash requires 64 bit host' assert IF64
output=. (20) # ' '
sslRIPEMD160 (y);(# y);output
output
)

sslRIPEMD160=:'c:/j64/j64-802/bin/libeay32.dll  RIPEMD160 i *c l *c'&cd

sslsha1=:'c:/j64/j64-802/bin/libeay32.dll  SHA1 i *c l *c'&cd

sslsha256=:'c:/j64/j64-802/bin/libeay32.dll  SHA256 i *c l *c'&cd

sslsha512=:'c:/j64/j64-802/bin/libeay32.dll  SHA512 i *c l *c'&cd

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
0f(d31,U10+>GSn2)-43+>Pbr0eje,0H`).+>P\p0ea_+0d&51+>l,$0fL430d&Ct1c-=02BXe5
+>G_r1GU(1+>l)#1E\J.+>k8t2]sn!1cQU6+>Ynu1*A;3+>b2r1a"Ut1,L+1+>P\p2'=Y6+>GVo
1H$@7+>Y_p3?U+6+?:Q#1E\Ls1c.L/DIc%DA9)7&F$aS_@rH(!+CSekEb0<5+D,P4+@0mRCjC><
+EV:.+@KX[@3BH+F<G[=AKXB]Bm+'(6:"O=2)mp:FCT6'DBNCsF(HIO3$;XGE+iZhATU7IF(I3g
6YL%@CI2`W@rH(!+C\c#AKWii+CSekEb0<5+D,P4D..NQ@<6!;3(%@j@r"eWA7]RoDe*Eq+@9LX
AMlG7BOt[h+Eh=:@R=dN8jlThFEMP5AS,XoAKZ/)EbTH7F!+q+FCT6'DD,a8+Du+?DKA<ZDImm'
F$a\]@r"GF@;KakDJ*NZ@rc:&FCo6-F*&NkBlmj'Bl5&'BOP^nASu-l+EM%5BlJ/:/KePADKK<$
DK?ph6UXj=+E2I4Ch[B%CLqc_7R9C1=&2^^;fd"rBOPsqBl8$(Eb8`iAKZ28Eb'56-qQlo6Ub'P
;FFH)F)5MuF(d!FB6%p5E)0;!:/b(b:N0l_;c?@4@rH4'Bl%?k+C]&&@<-W9Anc'm3ZqsLCb-]M
D_*#AH#.2(;GU(f=&2^^;fd"rBOPsqEc5l<+EqaEA9/kA;GU(f=&2^^;fd"rBOPsq.3N8DDfp#.
2)o)ZARfLFEaj<9ATL1PFCT6'DBNCsF(HIO3$;^EARfKuAo_g,+C]V<ATM<<3+c\fBlmj'Bl5&&
@<6!&2)l^jEc5e;AU&<.DId<h+Co%nBl.9p+>"^WAS!!#Df021A8bt#D.RU,@V0:_H$!V=+D,Y4
D'3M'GWHsWC`kkn+C\qr+Cf4YAU%`t@Pp,VG][M7A7]9oA7]7bD..6'Ao_g,+@9da@rH(!+C\c#
AKWiiA7fLcARfFk@;I&uEc5e;BOuE2/Kf+WE,]`9FE8RIE,]B/+CT.u+Dbt?ATAo'@<6!nAn#Fb
GT^U=Df$V+H$!V=3ZqpK87d#g4Y@jjAmulmCdNDhATMQ?Bl7HmGT^pFBkM-t+E)./+DEHL1,Usg
83o!g2BZ[AF(c\.Ec5e;:N0l_;c?A22)-jb83o*f1*C7=F(c\.Ec5e;:N0l_;c?A2BONVo83nsQ
BOPsq+D,Y4D'2VnAStFF9QP5/2DA$#:dn)H/MT.;+D>2)BHUo-Df$UmE+Noc;bV7RCf3i$7860)
2D?OhA18X2@;Ka&De:+fE+Noc;bS<38PhiM6nL,O0Hb%;F(fW9Cia8u0dpOB.3N,/Cht54Afslg
AStFF9H[8)5qOf6BOPsqF)u/=BONYR2CN'G.3N,/Cht54AfslgAStFF9H[8)5qOiL2BZ[AF(fW9
Cia8u2)-j7@q7#2@ps1i+E(j7:N0l_;c?@4;b02+2)-j/BOPsqG%ki9G%#E*@:F%a+DbV,B67f0
Bl8$(B4Z*+@X3',+Cf>4DKI"0DIal5@;L't                                       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&s+>G].11E+#An3B#2)o2Y+Ef=g+@9da@rH(!+C\c#AKWii+D,Y4D'3D7FCf?#ARloo
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
F<G+7DfBZ,A.8kg+C[2fAn3#pAn!VW+=Alk%13OO+<XEG/g+S=C`mP*@:X(iB-;M3Ec5N1%144#
CjJ5s+=Juf.Ngo9BeCM_0I\+h-8%J)4=;j2%144#@Pp,WA3a[;@Pp+l/j:CoH4:2j$6UHd67sBm
Bm:b0Gp$^5FED))+E)F7Ecb`*AISth+CSeuA0<Hb+=Jfd@:X7d.3Nsi+YG,s-QlkU3+c\DA7f:.
3$;X?DIak4:-pQUBk1dmFD5iB%13OO+<XEG/g+SCEaa59@<-"'D.RU,Et&I!+EJYg/g+\:@Pp+f
HnHOMA8Yoe$4R=b+C[2fAn3#=0H_V`Et&Hc$6UI#2)o2Y+>P&q+>P&b+EIu!%13OO%13OO%13OO~>
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
1cZ[9+>Y,p1E\Fq2E!?60esk,+>Pr3+>Get1*A;10Jjn-0H`+n0ebF?+?1K!+?(u46=FqH2)ms:
ARfLC;_g3`0-EV,+D,b6@ruF'DBNP3Df$V1FEDJC3\N.!BleAKB5)I$F^ct5Df%-pDe*F#8T$n/
@;g3?1GLgG3B&Z%$84%A$84%TF(fK9Bl7Q+BQ&);FDi:3Df0`0Ec`FGD]hATF(I3g6YL%@CER5-
Ec#6,%13OO%17&s@Vfag+EMX5FD55-F*)G:DJ((\DI[TqALM#5FCeZ^+Cno&@4;WmHOU<)%13Cp
0-EYo@rGmh+C]V<AQrF_FDi9gBkL"TFCf)rEX`?^6>:((DKKH&ATAo-DKJ9TFC?:T+>>kd$41<_
EZccEDKI"8+?^i$4!85[4<S0CFC?dqASu.&BKI>N.k<%X$42%g$4.#QDKJ9TFC?:T+DG_86t(1G
+=\Kh2)ZR-+Cno&@9[GO3t2N'I16N+%13Cp0-E]$@rGmh+@9dT8T&W]B4Z*+FDi9g@<6!;3$<9a
EbTE(%13D_FE2)5B-;5+F*2;@+?^hk,!-5@$$U&sCh4_;Bl8#\@<>p#4s2O.%13Dg%13CJBl8#8
Eb0)rBl7HmEZdLf-u!R@.4AnJF@9PZ@3?j=2)m$H%13CJBl8#\@<>p#00LF83'.QV#mkW`F*2;@
+?^i8BkM.%F'EZrD..-rA7]de+=eRTATN!1F?9p=$%36i+:SYa0/"G6E,]B+A0>87?m''"EZeq%
@q[!$ART+`DJ((G+C]V<AIStQAoD]4-u!R@+DDr]+>>l"BcoM\A79Rg/kfhoB67f0-70jG@<>p^
BjDiE4WlF?+DE>V.1HUjHOU;g$$'TuF_l.B4Wl+,-Qjo^Eb0<7Cih`J$42+i$41`aFEMVA+ED%7
F_l.]%17Lm$6W/@;cI+FF)5MuF(d<`:-pR0:K(5"F)u/2@<6*)E,Tf>+E2@>@qB_&DfQs0$4R>`
D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB'+EK:q2BX+b:-pQU;b020
2)ZRj@<6*)Ao_g,+AZrfDGsJ-%15is/g)8ZF#>[-+<Ve%67sBZ83o*f1*C7=F(c\.Ec5e;:N0l_
;c?@!$;No?+<VeJBONV<+<XEG/g+(`5qsKq@<6*)Ao_g,+AZrfDGsJ-%15is/g)8ZF)iun0H_K5
67sBY8PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c?@!$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rH(!
F(KB6+<W%QF)5MuF(cq4D..-p:gnET@;JPEF)>W/1,WW[@;0O#D.Rd0@:s-oAo_g,+A*bqEc5u2
Ea`g%Bl7Q+AoD^4D'3nBB4kdsFD5W*+:SZkDg*=GD]ib3G&M/-+Atd-7860%0fC^.BOPsq+Cf>#
AKYT*Df$Uh%13OO%15p?F(8Wp+A-'`D/!l8+EhI-+Ad)sB6%EtD/!m#%15^MDBL\l+=K#gA79b)
+CSo$.1HUn$?U2/E,ol0Ea`g%Bl7Q+%166VFWb1&DBNG&@;]^h+EV:.+EMU?E$.;)+Dbb0AKY])
+DNki1*C[W+E275DKI"CD]iM'DD!%S:NU8]Ed)5=AKZ).BlbD7AS#Cn+E)41DKBl8+=Kf(FD,B+
CER&%G@>c<+CTG%Bl%3eCh4`-DBNb0DKU1H@;]TuD.-p'+<XQR:dn)H0fC^.BlbD,@;KakA0>u-
Ec6)5BHVA:0fC^.Ap&!$FD5Z2/e&-s$;>/CEaa!6+DGm>Amob&ATAo8BOPd$GA1r*Dg-7F@WcC$
F<G:8+Co;)Et&Hc$?B]tF_Pl-+=C]9CaTZ!:-pQUEb065Bl[c--Z`s0Eb'5=%17/tCiCL[3Zq!`
=%Q.0E+rft+=AgbF)ipMBjr_C4"!EW>Yf<MDGsJ-/QZY(2DeZJBl70'%15is/g*qd78?c[9HZJZ
+DPk(FD)dEIWKdUFCf;BF)u//@<jXa/nAd7+=@U*:-pR/:dn,X;bS;s3ZrKbCiCLJ+=CE8F)5Dr
Gr%3.A8H')-OgDY:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&
+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.M
F)N0K.6AXp-o)nj+?V#fBju.)CbB7DCh[?$-RfK3:-pR/:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-
.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn
1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)Cb@Co3A*9DA9i!*@N[$I
%16$49LU'e3ZrKbCiCLJ+=CE4E+Np.F)335$?L9)+?_b.0d&M"-R_be78?c[9HYl/D(-fAA1%fn
;H#kjBlnD=4ZX]D1^sdi;aG@k+?_b.1E]sG2Dm?J2[p+8F)5o2@59\u+?_b.-Ql>Y5r(;U+DDrJ
@j#S1.UshKF)u.,$?L9)F(eu>0esk73Zodm;b0230eskc+=^kDC`k3;-QmJOC^g_mF)5o2@5/lf
3Zodm;b02/+DDrJ@j#S1.UshKF)u.,$?L9);Fs\R9gg]o0H`M>+=A:08PhiM6npSR+DDrJ@j#S1
.UshKF)u.,$?L5B2D@9T+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX-QjcG$?L9);Fs\R9gg]o0H_ch
.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*BONV<4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V
-OgE(F)5o2@5/lQGptg',9V7\4)]7`E-673$?('/E-673$7QDkF#>[-+?_b.1E\_$0F\A-F`_SF
F?MZ--oNn2+<r!V+=@U*F)u/=BONbQ1*@uj.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*1,Us4
4ZX]A+?CW!%17#rFDuAE4ZX]61GUC%,9S?V-OgE(F)5o2@59\u+=MLa4")<rGptgnF`_SFF:ARq
F`_SFF:AR+%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15RCEZf(6AoD^,@<?4%DBN@sDfp.E8g%_aEcl5?+EM+*+D>k=
E&oX*GB\6`C3+<*FE_/6AM.J2D(fL>Ecl5?/nf?D%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=7W3;iBl7O$Ec#6,
Bl@l3@:F.tF<F0uAoD^4D0$h@ARuutFEDI_0/%NnG:mWODe=*8@<,p3@rH3;AoD^4D0%=CFDYT6
@;Tt"APu)r7860)2D@[1F(d<`%17,eEHPu9AKW@2ChtI.$4R>;67sC"@<?0*BlbD6@:NtbDIjr3
E+NNnAnb`t/Ken=@q]RoAKYi4F*&O6AKWlf+C]&,+:S[!F)5e<4ZX]W7TW/V+E2%)CEOuXF`VRV
Ch[?3-T`\C3a?DX1gFcR1bC[@10e:&DHnOu$4R><:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-.j-6%
3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn1GURn
Cht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)CbB7DCh[?$-RfK3%15is/g+(k
9LU'e3ZrKbCiCLJ+=CE4E+Np.F)335$4R>`F)2s^3Zp."3Zodu:JaJT;c?@4/0JdY-=^R6%16!3
6"4PMF!*V,+>u%c$;segE((m43Zp4$>p)$_2)@0#$?L9)F(eu;2)ZR?3Zodm;b0202)ZRk+=^kD
C`k3;-QmJOC^g_mF)5o2@5Tbp+?_b.-Ql>Y5rCAP+DDrJ@j#S1.UshKF)u.,$?L9)F(eu:+?_b.
-Ql>Y5qsKr+=^kDC`k3;-QmJOC^g_mF)4`G:dn)H0fC^.4ZX]5+Atd-7860)2D?7f+=^kDC`k3;
-QmJOC^g^\$?L5B2D@9T+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX-QjcG$?L9);Fs\R9gg]o0H_ch
.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn$?Klh0d&V?+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX
-QjcG$?L9)F(eu:+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%13OOF#>[-+?_b.1E\_$0F\A-
F`_SFF?MZ--oNn2+<r!V+=@U*F)u/=BONbQ1*@uj.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn
$?Is[2BY.D+>Y-$+>=63Dfp/@F`]c-+=K$$.3KiX-QjcG$?L9)F(eu;2)ZR*Gptg',9V7\4)]7`
E-673$?('/E-673$7QDk%13OOBOuF%@<6*)4ZX]6+BplL/3l70An3#m/nlqD.6op'$4R>;67sC&
ATMr9BOPsq+EqOABHUo*Ci"$6Bl7Q+Bk1dmFD5iB%13OO+=C\R11`I#@P^#'0k2mo@Q$2+0fLq#
1M/XZ1,1[r1hJU*2_nu'11hmV/NP"rDes?9ATAo7E\TI++D>>2BOPsq+=Cf?+CSqp@:UKo@<6*)
D0[77@<itI+DDs,D'3D7E+NO$Bl7Q+@3@<Z+C]V<AKYYpF(cp1$4R>]Eb[pTF@nqV0ht%f.WBEC
6>:O66m-P&/KdAoF@nqDE,ol3ARfg)F(KH9E$043EbTK7/e&._67sAi$;No?+Ad)iE+*cqFD5Z2
F!,(5EZdss8p+rq+>Pc*1,UU*1,(F>+Cf>-An?!oDI[6#E,oN2ASuTuFD5Z2/e&._67r]S:-pQU
<HDklB-;;0AKXT5+Cno&@:EYdAKYDlA8c?.FDi:1DII@,H=\3cBlmj'Bl5&&Ci<g!+Cno&@4hur
:-pQB$;No?+Eh=:@UX@mD)r+5:-pQU%15is/g)8Z0d(LR+=D,KC-lWV8jk$L>9Iip+?MV3@VKq!
A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F>C3=DL1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB81hq/N1,9tnFCB33+EqaECERP5+E2@4F(K62
@<?4%D@Hp^$4R>;67sBt@;BF-AU%crF`_1;F(KH9E"*.hDe*KfBkhQs?Q_Km+=BKiF@nr"ATW'6
-OgE(D/XQ=E-67FChFl*De*KfBkhQs?O[?/Blls8;e:&nE$-hD$4R>;67sBiBlmj'Bl5&&Ci<g!
+C]A&@;BFp+D5_5F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls86>URMCI3&Q@;BFp-OgCl$;No?
+C]&,@rH(!+A,$EB6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqK%13OO%17/nDfp/@F`\`R
6>:OODeX)B8jje@Eb0<'DKK</Bl@l3E,ol3ARfg)F(KH9E%WL                         ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<(<''BitJD''),<0$a:),(<(<''BitJDBlockBreaker''),<0$a:),(<<;._1 '' BitJD'
zz=:zz,'Setup BASE58 Base58Check Base58CheckModel BitJDSetup GenesisBlockCh'
zz=:zz,'allengeScript assert b58checkFrbytes b58fd dfb58 dfh hfd i1 ic jtsl'
zz=:zz,'ash read todate tsfrunixsecs vint''),<<;._1 '' sslhash IFACEWORDSsslh'
zz=:zz,'ash OPENSSL ROOTWORDSsslhash assert cd s256 s512 sha1 sr160 sslRIPE'
zz=:zz,'MD160 sslsha1 sslsha256 sslsha512''                                 '
zz=:369{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&o0H`,,3$:.&0ekO?6>:O66rRZ=F`:)B/h02%F@nr"ATW'6+EK+d+EM+9F`8IIDfTW-
DJ()'DK]`7Df0E'DKI"5DfQseBlmj'Bl5Rr6m-GhDe`inF=n"0:-pQB$;No?+<V+#:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*1hq/N1,KFI:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f3Wf
DDF$kB6%p5E$0(>B45[lH=^V0%13OO%13OOF)u/2@<6*W67sa/F)5MuF(c\;/M/)Y@<6*)@;KRp
EbTW/D0$h3Ec5e;:N0l_;c?@B%15is/e&._67sBT@;BFq+<Yi9EbTH7F!)T=@<6*)+CT)!DfTQ6
BPhf5+CTG%Bl%3eCh4_3Bl5%9FD,5.+AZrfDGsJ-%15is/g+V;DIIR"ATJu.DKBo.Ci!Zn+EqOA
BHToE<$3;lG%#*$@:F%a/g*W(Df$V*DBNk<BkM-t@;I&sASl>p$;No?+EM%5BlJ/:@X0(m@<5pe
C`l>YF)>W//e&._67r]S:-pQUG%G]'@<?4#3ZrKTAKYZ.FDs8o06_Va/oP]?DKBl8/oPcC0+A7`
67r]S:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQB$;No?+<Y_\2)ZR"/Kdt_5r(;U+D>2)BHUo-
Df$UmE+Noc;bRW-:-pQU+EKCp1*@\k+B(fs2)-j/BOPsq+D,Y4D'2VnAStFF9FV>(67sB'F(eu:
+<W6Y;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EMQX2D?7*+Atd-7860%0fC^.BOPsq+D,Y4
D'2VnAStFF9FV>(67r]S:-pQU@rc-hFCeuD+>PW*1eMn.1,o^M:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@r,RpF!)iO
F)5MuF(cp1$4R>;67s`uAT23uA7]Y#Et&Hc$;No?+E2@>Anc'm+=84OAT;j,Eb-A;DfTB0+<`-_
.6T:+8Oc9I;]nY$=%Q.0<DGhS73H>a@<?/l$4R>;67sC"@<?0*BlbD6@:NtbDIkJBH#n(=D'3n=
ARfFdBk&8;+CT>4F_t]2+A,L1+DGm>Bl8!6@;KakA.8leF)5eY/g*5I7TW/V+F>4Y06M>V05P?3
0./hrE+*j%+=DVIBl5RO%15m-78?c[9KbEZF)u/:+=nWs-qQm":K&Ad+=K<4-Wb#"+A?KeFa,#p
DIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS74B@++=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.M
F)N0K.6AY#1*@hb4==rZ@WQU,/nB6DBjr24.1HUn$;No?+CehrC`m8)C^g_]A3Dt.2'G"7%13OO
F)u/=BONYR2Ea)D+<VdT:JaJT;c?@4/0H;_;b0202)ZRk+=^kDC`k3;-RgBPA.8leF)5o2@5Tbp
4ZX].+<W(.:dn,X;bS;b+=A:183o*f1*C9R.UsT;+=^kK.4/P8%17/tCia8u0g.Q?+<VdL+=L#^
78?c[9HYl/-Ql>Y5qsKr+=^kDC`k3;-RgBPA.8leF)4`G:dn)H0fC^K3ZohH:dn,X;bS;b+=A:0
8PhiM6npSR+DDrJ@j#S1.UshT-=^Qq$4R>;67sa!DId9hE+NotASuU2%13                ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,U12+>P&s+>kkr0fL452BX_.+>Pbr2]sk86>:O67!3Q^+A,$EA79Rg@UX=h+CSekDf-\>D]iJ+
@;L48AKX<RFCT6'DBND)De!Q*A79Rg6>:O66pb^.@r"DOART@cEc>H-F(I"9G][t7@rri7ASbpf
FCeu*Blmp'F!,(8Df$U`Blmj'Bl5&&Chmp+DJj>EA79R&@VfsmCER5'Ch7ZSBlls8;e:&nE-#T4
F`8HiBlmj'Bl5Rr6m-GhDe`inFE;M>BOPsqBOPsq+CT)!DfTQ6BPhf5Ao_g,+AZrfDGsJ-    ~>
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
