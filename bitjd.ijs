NB. JOD dictionary dump:  1 Jul 2014 17:13:23
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

GenesisBlockOutputAddress=:'1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'

IFACEWORDSsslhash=:<;._1 ' sr160 sha1 s256 s512'

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

ROOTWORDSsslhash=:<;._1 ' IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash s256 s512 sha1 sr160'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


Base58Check=:('1' #~ [: +/ (0{a.) = ]) , [: b58fd 256x #. a. i. ]

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

Base58frKey65=:3 : 0

NB.*Base58frKey65 v-- 65 byte public Bitcoin key bytes to base 58 format.
NB.
NB. monad:  clB58 =. Base58frKey65 clBytes
NB.
NB.  b65=. bfh '0450863AD64A87AE8A2FE83C1AF1A8403CB53F53E486D8511DAD8A04887E5B23522CD470243453A299FA9E77237716103ABC11A1DF38855ED6F2EE187E9C582BA6'
NB.  '16UwLL9Risc3QfPqBUvKofHmBQ7wMtjvM' -: Base58frKey65 b65

NB. require 'sslhash' !(*)=. sr160 s256
ekey=. (0{a.) , sr160 s256 y
csum=. 4 {. s256 s256 ekey
Base58Check ekey,csum
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

ParseGenesisBlock=:3 : 0

NB.*BitJDSetup v-- parse Bitcoin genesis block.
NB.
NB. This verb parses and checks the raw binary data of the first or genesis Bitcoin block.
NB.
NB. verbatim: see the blog posts:
NB.
NB. How to Parse the Bitcoin BlockChain
NB. http://codesuppository.blogspot.com/2014/01/how-to-parse-bitcoin-blockchain.html
NB.
NB. Bitcoin: 285 bytes that changed the world
NB. http://james.lab6.com/2012/01/12/bitcoin-285-bytes-that-changed-the-world/
NB. 
NB. monad:  paRc =. ParseGenesisBlock clBlockFile
NB.
NB.   NB. local Bitcoin full client directory
NB.   file=. (jpath '~BitJDData'),'/blk00000.dat'
NB.
NB.   ParseGenesisBlock file

NB. j profile nouns !(*)=. IF64 

NB. object nouns set by this verb 
NB. !(*)=. BlockLength ChallengeScript ChallengeScriptLength InputScript              
NB. !(*)=. InputScriptLength MagicID MerkleRoot Nonce                                 
NB. !(*)=. OutputAddress OutputCount OutputSatoshis PreviousBlockHash                 
NB. !(*)=. SequenceNumber TargetDifficulty TimeStamp TransactionCount                 
NB. !(*)=. TransactionHash TransactionIndex TransactionInputNumber TransactionLockTime
NB. !(*)=. TransactionVersionNumber VersionNumber                                     
   
NB. fetch genesis block data
dat=. read y 

NB. first 4 bytes are "sort of" block delimiters
MagicID=: (i. offset=. 4) { dat
'MagicID mismatch' assert 'F9BEB4D9' -: ,hfd a. i. MagicID

NB. next 4 bytes gives following block length
offset=. offset + 4 [ BlockLength=: _2 ic (offset + i. 4) { dat
'BlockLength mismatch' assert 285 = BlockLength

NB. next 4 bytes block format version - has changed
offset=. offset + 4 [ VersionNumber=: _2 ic (offset + i. 4) { dat

NB. next 32 bytes is previous block hash - genesis block
NB. has no previous hash and all bytes are set to 0
offset=. offset + 32 [ PreviousBlockHash=: (offset + i. 32) { dat
'PreviousBlockHash mismatch' assert (32#0) -: a. i. PreviousBlockHash

NB. next 32 bytes is the Merkle tree root hash
offset=. offset + 32 [ MerkleRoot=: (offset + i. 32) { dat
grh=. '3BA3EDFD7A7B12B27AC72C3E67768F617FC81BC3888A51323A9FB8AA4B1E5E4A'
'MerkleRoot mismatch' assert grh -: ,hfd a. i. MerkleRoot

NB. next 4 bytes is a unix epoch timestamp - rolls over 7th feb 2106
NB. there is no timezone information - it is interpreted as utc
offset=. offset + 4 [ TimeStamp=: _2 ic (offset + i. 4) { dat
'TimeStamp mismatch' assert 2009 1 3 18 15 5 -: ,tsfrunixsecs TimeStamp

NB. next 4 bytes represents block target
offset=. offset + 4 [ TargetDifficulty=: _2 ic (offset + i. 4) { dat
'TargetDifficulty mismatch' assert 486604799 = TargetDifficulty

NB. next 4 bytes is a random number nonce
offset=. offset + 4 [ Nonce=: (offset + i. 4) { dat
'Nonce mismatch' assert '1DAC2B7C' -: ,hfd a. i. Nonce

NB. next 1 to 9 bytes is the transaction count stored as a variable length integer 
NB. see:  https://en.bitcoin.it/wiki/Protocol_specification#Variable_length_integer
offset=. offset + vlen [ 'vlen TransactionCount'=: vint (offset + i. 9) { dat  
'TransactionCount mismatch' assert TransactionCount = 1  NB. (*)=. vlen

NB. next 4 bytes transaction version number
offset=. offset + 4 [ TransactionVersionNumber=: _2 ic (offset + i.4) { dat
'TransactionVersionNumber mismatch' assert 1 = TransactionVersionNumber

NB. next 1 to 9 bytes is the number of transaction inputs
offset=. offset + vlen [ 'vlen TransactionInputNumber'=: vint (offset + i. 9) { dat

NB. next 32 bytes is the hash of the input transaction
offset=. offset + 32 [ TransactionHash=: (offset + i. 32) { dat
'TransactionHash mismatch' assert (32#0) -: a. i. TransactionHash

NB. next 4 bytes in the input transaction index
offset=. offset + 4 [ TransactionIndex=: _2 ic (offset + i. 4) { dat
'TransactionIndex mismatch' assert _1 = TransactionIndex

NB. input script length is next
offset=. offset + vlen [ 'vlen InputScriptLength'=: vint (offset + i. 9) { dat
'InputScriptLength mismatch' assert 77 = InputScriptLength

NB. script data
offset=. offset + InputScriptLength [ InputScript=: (offset + i. InputScriptLength) { dat

NB. sequence number 4 bytes - not used Jan 2012
offset=. offset + 4 [ SequenceNumber=: ,hfd a. i. (offset + i. 4) { dat
'SequenceNumber mismatch' assert 'FFFFFFFF' -: SequenceNumber

NB. output count 1 to 9 bytes
offset=. offset + vlen [ 'vlen OutputCount'=: vint (offset + i.9) { dat

NB. output value - number of satoshis sent
offset=. offset + 8 [ OutputSatoshis=: (offset + i.8) { dat  NB. 64 bit unsigned integer
'OutputSatoshis mismatch' assert '00F2052A01000000' -: ,hfd a. i. OutputSatoshis
OutputSatoshis=: ]`(_3&ic)@.IF64 OutputSatoshis

NB. challenge script length
offset=. offset + vlen [ 'vlen ChallengeScriptLength'=: vint (offset + i.9) { dat
'ChallengeScriptLength mismatch' assert 67 = ChallengeScriptLength

NB. challenge script - contains elliptic curve signatures
offset=. offset + ChallengeScriptLength [ ChallengeScript=: (offset + i. ChallengeScriptLength) { dat
'ChallengeScript mismatch' assert GenesisBlockChallengeScript -: ,hfd a. i. ChallengeScript

NB. challenge script is 67 bytes drop first and last byte to
NB. compute the familiar Bitcoin base 58 address - compare with block explorer
NB. http://blockexplorer.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f
OutputAddress=: Base58frKey65 }. }: ChallengeScript
'Genesis Block address mismatch' assert GenesisBlockOutputAddress -: OutputAddress

NB. last 4 bytes lock time - not used yet Jan 2012
TransactionLockTime=: (offset + i.4) { dat
'TransactionLockTime mismatch' assert 0 0 0 0 -: a. i. TransactionLockTime

'Genesis Block Parsed and Checked'
)

b58checkFrbytes=:3 : 0

NB.*b58checkFrbytes v-- Bitcoin base 58 check format from bytes.
NB.
NB. monad:  clB58 =. b58checkFrbytes clBytes
NB.
NB.   NB. bitcoin public key bytes
NB.   pk=. bfh '7542FB6685F9FD8F37D56FAF62F0BB4563684A51539E4B26F0840DB361E0027C'

NB. require 'sslhash' !(*)=. s256 sr160

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

sslsha256 (y);(# y);hash=. 32#' '
hash
)

s512=:3 : 0

NB.*s512 v-- SHA512 hash from OpenSSL.
NB.
NB. monad:  clHash =. s512 cl
NB.
NB.   s512 'my what big hashes you have'
NB.
NB.   s512 10000 $ 'collisions are rare'

sslsha512 (y);(# y);hash=. 64#' '
hash
)

sha1=:3 : 0

NB.*sha1 v-- SHA1 hash from OpenSSL.
NB.
NB. monad:  clHash =. sha1 cl
NB.
NB.   sha1 'this is a fine mess'
NB.
NB.   sha1 10000 $ 'a bigger mess '

sslsha1 (y);(# y);hash=. 20#' '
hash
)

sr160=:3 : 0

NB.*sr160 v-- RIPEMD-160 hash from OpenSSL.
NB.
NB. monad:  clHash =. sr160 cl
NB.
NB.   sr160 'go ahead hash my day - result is 20 byte hash'
NB.
NB.   sr160 30000 $ 'yada yada yada et cetera byte me '

sslRIPEMD160 (y);(# y);hash=. 20#' '
hash
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

'not nine bytes' assert 9 = #y

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
0f:j31,pC3+>GSn2)-43+>Pbr0eje,0H`).+>P\p0f'q00H`)(+>Y_p1,g=53$9t6+>Ynu0fL43
0d&Ct1c-=02]sk7+>Gbs1Gp:02'=\1+>k9!2]sn!1GL"0+>Yr!1E\M6+>Y,r2BXat0f^@5+>Pbr
1a"P1+>b2r1*AFs1,pC21*AA2+?(E!0d&J!1G^.6+>Yer1a"V36"FkD6"FMHATMoZBlmj'Bl5&%
A7T^lF)rI9DfQsdDII@,H=\4@BOr;S@<>p#DJsV>FD,5.6um!bASa\!;aiQ'6>:OODeX)3@UX=h
+>l,$@;Kmr@:Eei6=FqH2)ms:ARfLBBlmj'Bl5&&@<6!&2)l^eA7T^lF)rI9DfT]'F@'DWAMlG7
BOt[h9lFQRCi+*$AS`JU@<6!;3(%@j@r!31ATD6H@<6!;3+d2(AU-0k2DlUdH$!U?E-5W+Bk&8P
Blmj'Bl5&/AU,D-H$!V=+EVNE@UX=h+>l,$AoD^,@<=hMF@nr"ATW'6A7]@eDIjr6@<-(#F`S[7
Blmj'Bl5S=A0>c.F`)7jASu(#BlcUWDe!QMBOP^nASu-l;e'i^E-,]+EcZ=F6>:OODeX)3@q]:e
Ch7KsAKZ&(EbTK7+>"^GDf0Z*Bl7u7770IA5p1,h@Vfag+DYP67qHRLF(o\^Ci<g!:N^buF`]o[
A9)7&F(T-,F*&NkBlmj'Bl5&&@<6!&2)l^sF`_SFF<G"&A9)7&F%Jhe6Ub'P;FFH)F)5MuF(f9*
FCfK)@:NjkGAhM4F!)l&7R9C1=&2^^;fd"rBOPsq.3N8DDfp"p:dn,X;bTu+AStFF9H[h`D/a3*
ARlomBl7@"Gp$^5Ch5XMA8H'5+EMHP+Cob6BjsnIEcYe^ASu(#BlcUWDe!R%@<-F#+@9da@rH(!
+D58'ATMR,+C]/*@r"t<:K1Ck;FFH)F)5MuF(fT4Dfd+GDfTB0+=L,`:K1Ck;FFH)F)5MuF(d!F
B6%p5E+1[a@q]F`CIW>RH$!V=6>:OODeX)3@UX=h+>l,$@q]F`CER50Df$V+H$!V=@Pp,WA3t!P
@rH(!+C\c#AKWii+D,Y4D'3D7FCf?#ARlooARfFk@;I&<+EM+*+Dbt6B-:`'@s)X"DKK?"BOZ7/
ATJu+Ec5e;BOuEL+Cf414Y@jdAnW;sCe/,^A7f:.3+[>VASu$iA0>Do@qfdgC`m>1Df$U`Blmj'
Bl5&&@<6!&2)o,YBOk[aBl.9p+D,Y4D'3M'GT\R\F*2G@DfTr@+E_XBATAo%DIal+Dg,c5+Cei$
AS>[bBOuE2Ao_g,+C]V<ATKmT@r+\IGT].%+D>@r+Cf4SH$!V=Bea=>A7^!.DfTQ)Bl5&3DIjr)
/ord*2H*.41,Us4BOPsq+D,Y4D'2VnAStFF9QN'G1/g_02)-j/BOPsq+D,Y4D'2VnAStFF9QOlU
0iLV/0d(.<F(c\.Ec5e;:N0l_;c?A2E\TI+;Fs\R9ggQf2D?7e@<6*)Ao_g,+AZrfDGsJ-F)u.q
8PhiM6npSR-t?d:+CehrC`mY.+AZrfDGsJ-+Atd-7860%0fC^.BOPsqF)u/=BONVD@q7#2@ps1i
+E(j7:N0l_;c?@4;b02+0d(.<F(fW9Cia8u1,Us<@q7#2@ps1i+E(j7:N0l_;c?@4;b02+1,Us4
BOPsqF)u/=BONbQ1+6XC.3N,/Cht54AfslgAStFF9H[8)5qOrK1*C7=F(f`2DKL&1EbSrkCh4`*
ASu.&BHV#,FCf)rEZeh:FCcS)Dfor>+CT.u+Eh10F_(                               ~>
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
2)ud;+>Y,p1E\Fq2E!?61,L+/+>Gf62BX_0+>P&p3ADX22]sju0fLdC+>PVn1*A;*1c$76+>P&u
0K)7+F(I3g6YL%@CI;#U2(pU*6R*^cF`(]2Bl@l3Ao_g,+D>k=E-"&n05#!?F=q3?FD,f+/n8g:
010YgATLF\6YKnHF"]=(2`3TS0b"IC0+A7A0-G=LDg,o5B-:l+G9D!G+Cf>-G%G]9+EVNE6=FqH
2)ms:ARfKuAoD^,@<;qc%13OOE-5W+Bk&9,FCB9*@j#i7EbTE(+@U0XDe*E-@X3',>?r@^@<>p,
%17Fk$6Tcb#qmqS6tKkHA7ZlmH$!V%>p+6-+@9dT8T&W]B4Z)m$40%5B1Zu_AS5Rp+DG_86t(1G
+?^i$3t2N'AoD]4-u!R@+DDr]+>>l"BcoM\A79Rg/kfhoB67fK+DE>V.1HUjHOU;g$#+:!6t(1G
+?^i]DKJ9TFC?:A+>Pf4+=eRF@<>p^BjEe0$42+i$6Tcb#qmqS7;cURA7ZlMBkL"TFCf)rEZfIB
+@9LXAMlFiF*)G:DJ'Cc$$13/Bl7Q+Eb0<7Cigd_+<i!k%13DcBPD9o+=LrAF@9PZ@3@`V0I[G<
$%!*g#mk<`F<GU8D..-rA7]d(4Wl.eDKI<UBl8#\@<>p#,p5').6@tG#mk<`F@9PZ@3@3d+>l,?
%13CJEb0<7Cigd_+@KpVBlnE#Eb0)rBl7HmEa9e<+ED%7F_l.]%13Di%143e$4/@=+@0scASu$$
?nl%3AoD]4ART(^+DbUtA8,po+>=pIH$!U,$41<_EZccEDKI"8+?^i$4!85[4<S0CFC?dqASu.&
BHSWK+Cno&@9[GO+?_k10KUCk.k<%X$42%g$4.#ZATN!1F<E^h-SZtk.j/kDF*2;@3t2N'I16Mi
Eb0?8Ec*"?ATN!1F?9p=I16N+6=FqH2)nNV@:O(KG%G]+Ci=MmDffQ31,VgFFCfM9Df-[U2'?@R
FCcS6F^f0$@j#PuH#k*MD]iLtF(HIO3$;gRDf%NE$4R>UFEDI_0/%Bg@:O(kG%G]+Ci=MM@rH3;
EHPi6FD5Z2F"]7.1,C^?2)?n!@<6*rDJ(P5Ec5eH@4cG@@Vfag/SepC/Tbn_@4br&FCT6'DCo:-
A9)7&F"M*D/T>BB%13OO%15ZL@;R-/Ed;A:B-;;7+D,P.Ci=M?FD,5.Bl8!6Eckl6Bl@m1+ED%5
F_Pl-A0>u4+EVaHDBN@12DlUdH$!U?E-5W+Bk&7p$>X3u+DG_8D]iI2@VKpoDeX)3@:WnhATMo8
F`V87B-;/,E%W84BOr<#DKBo?F^oN-Df0V=@<,p%EHPu;AKYQ/E,95uBlksM%15I2DBNA*H#IS3
+D>>&E$0"/+EqOABHVD1AKYr4@:OCn@ps1fFEo!IAftW&Bl7Q+FD,*)+DG^9E+j2T%13OO8T&Tk
Eckl6Bl@m1+CT;%%13OO0d&%j<+0QR+EV:.+Cf>1Eb0<2Df0*"DJ()2F^f0$@j#PuGp$a2DImis
FCeu*GA2/4+DGp?-oNq*@X3',F"AFg+C]V<AKW[O0Jk='%14mH+C]V<ATJu(DfTl0F)Z&8A8,po
+EVNE=<M*lDfTB&DIIWu/0H`(+C]V<ATJu(DfTl0F)Z&8A8,po+EVNE=Wh3mDfTB&DIIWu.1HUn
$8=:o0K:sH5t!Uf5r^eh76!Rg7R]9m6SUkr0gRcU0Jc'_2)@]Z1IX,[2FKM^0el'^6o[Id1cRHR
75[Ce1GppC6UWai0JYI@1c7'T1-%?a5rh@m2_m0J2_d3F0Jc!]6SU;]0gnJe3&icQ779%'1.=Vd
3&a8d6T$hY6:!L=$4R=t+>"^4ATDC$Ebupt83ng_2)ZRj@<6*rDJ()1DBO%7AKYr7@Vfag+DYP6
%13OO2D?gS7R]-h1.!fd0JGFA0gRZW2)R<Y2+'_s1c@]g0fUsL1c-pI0eb:>1GUdQ1c.-X6p`Xs
3B0D`68UAU%13OO1E\7l:h=ZZDfT\;;Fs\R9ggQf2D?7e@<6*rDJ()1DBO%7AKZ#)F*2;@+E(j7
;b02+1,Us!$4R=r0ebUG2E*QQ0JGCF2)@WX2)[BM1H@l]75Hqn3&X&V6o$\W6:F<P$4R>!+>"^%
A7Qg+ATDj+Df-\,H$!U?Bl5&*Ec5i;+E(j7;Fs\R9ggQf2D?7e@<6*)-nom"0HatGEZe(bBl5%g
ATW-7Ebd*5$4R=r0JG483ArcS2`<?D2E<WN6o?h[2`*<N75[Li3CYtd5qk\^2`!ch71BS5$8iqX
+AcWiAoD^,+B(fs/M]1A+D>2)BHV52+EV:.+D#e>ASu$iA0=cA:dn)H/MT.;+ED%7F_l./$4R>!
1c7WZ5r^PP2aKG[6o[+]1GLjK1,q6[68LAN5r_>&1.4Pt6o%%s0g[]U7PI:h0LA,]0LA&o3&EK[
0KCs!$4R>#+>"^4ATDC$Ebupt83ng_2)ZRj@<6*)Df-\>BOr<,ATN!1F<GL6+EV:.+E2@4G%kl;
F!+CP5qOiL2BZ[AF(c!i%15K]0f_-N7Q*%i2ag%g3&<QL1dNra75QkW6TIUo5t!Ru1c@*V75I=e
2`EZU3&!9K68:/Q2DI'V0gRcb1GB7F%15$:/Ke#$CLnW1BOr;uBl\9:+>b3MH$!V=+E(j7FD,5.
F(Jj"DIakg83ng_2)ZRj@<6*7+B3#gF!,1<+EV:.+CSekEb0<5+Cf(r@r$..D%-g]$:Hd,3Arfc
2@U!&$90.[+@0OK+EV:.+>b3NBOt[hF*2=B@X3',F!,(8Df$V9DeX*2+?(EOF<G[=AKYQ%A0>f&
+D#e>ASu$iA0=cA:dn)H/MT.;+D>2)BHUo-Df$V9DeX*2+>b\n<+oue+DGm>FD,5.1,UXmH$!U?
@VK^gEd8coBlmj'Bl5%ZA7T^lF)rrC$4R=r0JG483ArcS2`<?D2E<WN6o?h[2`*<N75[Li3CYtd
5qk\^2`!ch779$g3Arfc2@U!&$994\+@C'bG%G]9+EV:.+ED%7F_l.BAo_g,+CQC%H$!U?F*)G:
DJ()+DKKe>@3B#fF(I3g+EMXFBl7Q+F`V87B-9NLF(I3g6YL%@CER2+@rGmlDJ(RE<+oue+DGm>
FD,5.D/XK;+Cf>,D/X<.Gp%6NARloMBlmj'Bl5%ZA7T^lF)rI9DfT]'F:AQd$8FG=G>([j;JC2^
1Jqa\EC*ZK95eE5D*h)YG>30oG"ke/;cI+FF)5MuF(d<`:-pR0:K(5"F)u/2@<6*)E,Tf>+E2@>
@qB_&DfQs0$4R>`D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB'+EK:q
2BX+b:-pQU;b0202)ZRj@<6*)Ao_g,+AZrfDGsJ-%15is/g)8ZF#>[-+<Ve%67sBZ83o*f1*C7=
F(c\.Ec5e;:N0l_;c?@!$;No?+<VeJBONV<+<XEG/g+(`5qsKq@<6*)Ao_g,+AZrfDGsJ-%15is
/g)8ZF)iun0H_K567sBY8PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c?@!$7QDk%16T`@s)g4ASuT4
-XpM*AL@oo@rH(!F(KB6+<W%QF)5MuF(cq4D..-p:gnET@;JPEF)>W/1,WW[@;0O#D.Rd0@:s-o
Ao_g,+A*bqEc5u2Ea`g%Bl7Q+AoD^4D'3nBB4kdsFD5W*+:SZkDg*=GD]ib3G&M/-+Atd-7860%
0fC^.BOPsq+Cf>#AKYT*Df$Uh%13OO%15p?F(8Wp+A-'`D/!l8+EhI-+Ad)sB6%EtD/!m#%15^M
DBL\l+=K#gA79b)+CSo$.1HUn$?U2/E,ol0Ea`g%Bl7Q+%166VFWb1&DBNG&@;]^h+EV:.+EMU?
E$.;)+Dbb0AKY])+DNki1*C[W+E275DKI"CD]iM'DD!%S:NU8]Ed)5=AKZ).BlbD7AS#Cn+E)41
DKBl8+=Kf(FD,B+CER&%G@>c<+CTG%Bl%3eCh4`-DBNb0DKU1H@;]TuD.-p'+<XQR:dn)H0fC^.
BlbD,@;KakA0>u-Ec6)5BHVA:0fC^.Ap&!$FD5Z2/e&-s$;>/CEaa!6+DGm>Amob&ATAo8BOPd$
GA1r*Dg-7F@WcC$F<G:8+Co;)Et&Hc$?B]tF_Pl-+=C]9CaTZ!:-pQUEb065Bl[c--Z`s0Eb'5=
%17/tCiCL[3Zq!`=%Q.0E+rft+=AgbF)ipMBjr_C4"!EW>Yf<MDGsJ-/QZY(2DeZJBl70'%15is
/g*qd78?c[9HZJZ+DPk(FD)dEIWKdUFCf;BF)u//@<jXa/nAd7+=@U*:-pR/:dn,X;bS;s3ZrKb
CiCLJ+=CE8F)5DrGr%3.A8H')-OgDY:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-.j-6%3ZoeOBl5%e
Bl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn1GURnCht4A4!5q,
+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)CbB7DCh[?$-RfK3:-pR/:dn,X;bS;s3ZrKb
CiCLJ+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*D
E+rft+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)Cb@Co
3A*9DA9i!*@N[$I%16$49LU'e3ZrKbCiCLJ+=CE4E+Np.F)335$?L9)+?_b.0d&M"-R_be78?c[
9HYl/D(-fAA1%fn;H#kjBlnD=4ZX]D1^sdi;aG@k+?_b.1E]sG2Dm?J2[p+8F)5o2@59\u+?_b.
-Ql>Y5r(;U+DDrJ@j#S1.UshKF)u.,$?L9)F(eu>0esk73Zodm;b0230eskc+=^kDC`k3;-QmJO
C^g_mF)5o2@5/lf3Zodm;b02/+DDrJ@j#S1.UshKF)u.,$?L9);Fs\R9gg]o0H`M>+=A:08PhiM
6npSR+DDrJ@j#S1.UshKF)u.,$?L5B2D@9T+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX-QjcG$?L9)
;Fs\R9gg]o0H_ch.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*BONV<4ZX]A+?CW!%17#rFDuAE
4ZX]61,(.",9S?V-OgE(F)5o2@5/lQGptg',9V7\4)]7`E-673$?('/E-673$7QDkF#>[-+?_b.
1E\_$0F\A-F`_SFF?MZ--oNn2+<r!V+=@U*F)u/=BONbQ1*@uj.6Aq&+F,CtDfp/@F`\'"Dfp/@
F`\'".1HW*1,Us44ZX]A+?CW!%17#rFDuAE4ZX]61GUC%,9S?V-OgE(F)5o2@59\u+=MLa4")<r
GptgnF`_SFF:ARqF`_SFF:AR+%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15RCEZf(6AoD^,@<?4%DBN@sDfp.E8g%_a
Ecl5?+EM+*+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2D(fL>Ecl5?/nf?D%13OO/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
7W3;iBl7O$Ec#6,Bl@l3@:F.tF<F0uAoD^4D0$h@ARuutFEDI_0/%NnG:mWODe=*8@<,p3@rH3;
AoD^4D0%=CFDYT6@;Tt"APu)r7860)2D@[1F(d<`%17,eEHPu9AKW@2ChtI.$4R>;67sC"@<?0*
BlbD6@:NtbDIjr3E+NNnAnb`t/Ken=@q]RoAKYi4F*&O6AKWlf+C]&,+:S[!F)5e<4ZX]W7TW/V
+E2%)CEOuXF`VRVCh[?3-T`\C3a?DX1gFcR1bC[@10e:&DHnOu$4R><:dn,X;bS;s3ZrKbCiCLJ
+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft
+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)CbB7DCh[?$
-RfK3%15is/g+(k9LU'e3ZrKbCiCLJ+=CE4E+Np.F)335$4R>`F)2s^3Zp."3Zodu:JaJT;c?@4
/0JdY-=^R6%16!36"4PMF!*V,+>u%c$;segE((m43Zp4$>p)$_2)@0#$?L9)F(eu;2)ZR?3Zodm
;b0202)ZRk+=^kDC`k3;-QmJOC^g_mF)5o2@5Tbp+?_b.-Ql>Y5rCAP+DDrJ@j#S1.UshKF)u.,
$?L9)F(eu:+?_b.-Ql>Y5qsKr+=^kDC`k3;-QmJOC^g_mF)4`G:dn)H0fC^.4ZX]5+Atd-7860)
2D?7f+=^kDC`k3;-QmJOC^g^\$?L5B2D@9T+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX-QjcG$?L9)
;Fs\R9gg]o0H_ch.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn$?Klh0d&V?+>Y-$+>=63Dfp/@
F`]c-+=K!!.3KiX-QjcG$?L9)F(eu:+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%13OOF#>[-
+?_b.1E\_$0F\A-F`_SFF?MZ--oNn2+<r!V+=@U*F)u/=BONbQ1*@uj.6Aq&+F,CtDfp/@F`\'"
Dfp/@F`\'".1HUn$?Is[2BY.D+>Y-$+>=63Dfp/@F`]c-+=K$$.3KiX-QjcG$?L9)F(eu;2)ZR*
Gptg',9V7\4)]7`E-673$?('/E-673$7QDk%13OOBOuF%@<6*)4ZX]6+BplL/3l70An3#m/nlqD
.6op'$4R>;67sC&ATMr9BOPsq+EqOABHUo*Ci"$6Bl7Q+Bk1dmFD5iB%13OO+=C\R11`I#@P^#'
0k2mo@Q$2+0fLq#1M/XZ1,1[r1hJU*2_nu'11hmV/NP"rDes?9ATAo7E\TI++D>>2BOPsq+=Cf?
+CSqp@:UKo@<6*)D0[77@<itI+DDs,D'3D7E+NO$Bl7Q+@3@<Z+C]V<AKYYpF(cp1$4R>]Eb[pT
F@nqV0ht%f.WBEC6>:O66m-P&/KdAoF@nqDE,ol3ARfg)F(KH9E$043EbTK7/e&._67sAi$;No?
+Ad)iE+*cqFD5Z2F!,(5EZdss8p+rq+>Pc*1,UU*1,(F>+Cf>-An?!oDI[6#E,oN2ASuTuFD5Z2
/e&._67r]S:-pQU<HDklB-;;0AKXT5+Cno&@:EYdAKYDlA8c?.FDi:1DII@,H=\3cBlmj'Bl5&&
Ci<g!+Cno&@4hur:-pQB$;No?+Eh=:@UX@mD)r+5:-pQU%15is/g)8Z0d(LR+=D,KC-lWV8jk$L
>9Iip+?MV3@VKq!A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjEb/[$ARmhE1,(F>C3=DL1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB81hq/N1,9tnFCB33+EqaE
CERP5+E2@4F(K62@<?4%D@Hp^$4R>;67sBt@;BF-AU%crF`_1;F(KH9E"*.hDe*KfBkhQs?Q_Km
+=BKiF@nr"ATW'6-OgE(D/XQ=E-67FChFl*De*KfBkhQs?O[?/Blls8;e:&nE$-hD$4R>;67sBi
Blmj'Bl5&&Ci<g!+C]A&@;BFp+D5_5F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls86>URMCI3&Q
@;BFp-OgCl$;No?+C]&,@rH(!+A,$EB6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqK%13OO
%17/nDfp/@F`\`R6>:OODeX)B8jje@Eb0<'DKK</Bl@l3E,ol3ARfg)F(KH9E%WL          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<(<''BitJD''),<0$a:),(<(<''BitJDBlockBreaker''),<0$a:),(<<;._1 '' BitJD'
zz=:zz,'Setup BASE58 Base58Check Base58CheckModel BitJDSetup GenesisBlockCh'
zz=:zz,'allengeScript assert b58checkFrbytes b58fd dfb58 dfh hfd i1 ic jtsl'
zz=:zz,'ash read todate tsfrunixsecs vint''),(<<;._1 '' ParseGenesisBlock Bas'
zz=:zz,'e58Check Base58frKey65 GenesisBlockChallengeScript GenesisBlockOutp'
zz=:zz,'utAddress ParseGenesisBlock assert b58fd hfd i1 ic read todate tsfr'
zz=:zz,'unixsecs vint''),<<;._1 '' sslhash IFACEWORDSsslhash OPENSSL ROOTWORD'
zz=:zz,'Ssslhash cd s256 s512 sha1 sr160 sslRIPEMD160 sslsha1 sslsha256 ssl'
zz=:zz,'sha512''                                                            '
zz=:543{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,L+0+>P&o0H`,22'=V4+>P]/+?(Dt1GUmUBlls8;e:&nE)&_P.RIik8jlThFEMOFF"JsdF(KH9
E$0@CEbfB,B-:c'G%ku8DJ`s&F<G16EZd\_FCT6'DD+UM+E2@>C1Ums/e&._67r]S:-pQU+:SZQ
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F>C3=DL1^sde67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB81hq/N1,L+dEc6)>+E):5@;]e*ARlnm$;No?+>G]fF_i`d+D>2)BHVJ0Eaj)4@:Wn[A0<:A
F)5MuF(d!3$4R>_AT;j,Eb-@@F)u/2@<6*0%13OO:gnBcAOg<LATMR,6>URMCJI2K.SsPoF(IjQ
DImm'F$a\]@r!3./M/)3Blmj'Bl5&+ASu(#BlbD+Ci<g!+Cf(r@r!2qDIal/@<-F#+D#e+D/a<&
/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F_i`d
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OOEb065Bl[c--Za?FBOPsq-OgCl$?L9)BOPsq:-pQ_F)u/2@<6*)F"JsdBOPsq
+CT)!DfTQ6BPhf5Ao_g,+AZrfDGsJ-/db??/db??/g*ksCLqQ0+Eh16BlA-8+<Y?+F(c[=@;KRp
EbTW/D0$gB@<Q'nCggdhAKW+0DBL'DBOr;/:N0l_;c??s:-pQU@VK^gEbT*++DG_7FCB!%ARlp-
Bln#2C2n><3%cn0+CTG%Bl%3eCh54A7WNEa+CT.1+E):7B5)6lC^Np(/g+\9D/UP<@rc:&F<G%<
+AcKf@ps0r8mudXBl5&;Bln#2@:X+qF*)81DKKqB@X0(_Bl%T.9OVcj$;No?$;No?+Eh=:@UX@m
D)re\ARuutFEDI_0/%NnG:mfQASuR1CbBXHB.jTe67rU?67sBpDKKH1Amo1\+EqaEA12LJ3XSVK
/db??/g)9X1,Us4+>"^783o!g2BZ[AF(c\.Ec5e;:N0l_;c??s:-pQU+EKCp1*@\k+B(fs2)-j/
BOPsq+D,Y4D'2VnAStFF9F=N]/g)9XBONV<+>"^783nsQBOPsq+D,Y4D'2VnAStFF9F=N]/g)9X
E\TI++>"^68PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c??s:-pQ?:-pQU@rc-hFCeuD+>PW*1eMn.
1,oV967sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/IG6>/g)l*C3=DM0Hak=@;]^hA0>u4+EDUB+E)-?1GU(^BlkJ=H#n(=D0$$k@rGjn
@<6K4-Za?FBOPsq-OL2U67s`uAT23uA7]Y#Es`7L67sC"Ec5Q(Ch4_9+ED%5F_Pl-+EqaEA9/k:
-n6Z//g*_T8P`8-8OccQ:*<+t2DcOV:-hTC+DPk(FD)!g:-pQUA8H'8F)N1?@<?0*BlbD6@:Ntb
DIkJ>F!,OCARfFdBk&8;+CT>4F_t]2+DPn<+?1u-1*C:P+DG_7FCB!%ARl-hF)5eY/g*5I7TW/V
+F>4Y06M>V05P?30./hrE+*j%+=DVIBl5RO$;XJe:/b(b4ZX^,F)5e</0I#&8Oc9I;]mS5-p'I;
=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V:-hTC.3Ns[-Z!L+ARTj?1+m*RC`k)e+=Juf
,To2sCh[@"F)3IMD]gDV4!5q,+=&'l-Z!L+F)u.MA9i!*@N[$I$49Np/g+Y4Cht5)ChsGgA3Dt.
2'G"7$4:iqCia8u1,UsQ3ZoOf+=L#^78?c[9HYl/4%Vn"1j^Sm;b0202)ZR@+=eRZ+=^kDGT\JG
-T`[u;b0202)ZRk+=^kDC`k3;-RgBPA.!C!Cia8u2)-jL3ZoOf+=L#^78?c[9HYl/4%Vn"1j^Sm
;b0230esk8+=eRZ+=^kDGT\JG-T`[u;b0230eskc+=^kDC`k3;-RgBPA.!C!Cia8u0g.Q?+<VdL
+=L#^78?c[9HYl/4%Vn"1j^Sm;b02/+?gnu+F#"Y@j$"=.Ushf-Ql>Y5qsKr+=^kDC`k3;-RgBP
A.!C!Cf3i$7860)2D@9T+=L#^78?c[9HYl/4%Vn"1j^Sm;Fs\R9gg]o0H`P%.j0'Z.UsTG+=^kK
4!u.K8PhiM6npSR+DDrJ@j#S1.UshT-=^Qn$;No?.V3L.A7]^kDId<rFE7c               ~>
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
