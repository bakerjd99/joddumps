NB. JOD dictionary dump:  6 Jul 2014 03:17:36
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

DIGITS=:'0123456789'

EXPORTCSVDIRECTORY=:'c:/bitjddata/blockparser/export/'

GenesisBlockChallengeScript=:'4104678AFDB0FE5548271967F1A67130B7105CD6A828E03909A67962E0EA1F61DEB649F6BC3F4CEF38C4F35504E51EC112DE5C384DF7BA0B8D578A4C702B6BF11D5FAC'

GenesisBlockOutputAddress=:'1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'

IFACEWORDSsslhash=:<;._1 ' sr160 sha1 s256 s512'

INAFTERCOLUMNS=:<;._1 ' InputHash OutputKey'

INPUTCOLUMNS=:<;._1 ' InputAmount InputHash TransactionHash InputKey InputSequenceNumber InputSigFormat InputSigLength InputTransactionIndex'

INPUTSFILE=:'c:/bitjddata/jdcsv/inputs.csv'

JDCSVDIRECTORY=:'c:/bitjddata/jdcsv/'

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

OUTPUTCOLUMNS=:<;._1 ' OutputKey TransactionHash OutputKeyFormat OutputScriptLength OutputValue'

OUTPUTSFILE=:'c:/bitjddata/jdcsv/outputs.csv'

ROOTWORDSsslhash=:<;._1 ' IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash s256 s512 sha1 sr160'

TRANSACTIONCOLUMNS=:<;._1 ' BlockNumber BlockTime TransactionHash TransactionSize TransactionVersionNumber InputCount OutputCount'

TRANSACTIONSFILE=:'c:/bitjddata/jdcsv/transactions.csv'

TSEGPREFIX=:'### BlockNumber,'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


AttachTransactionHashes=:4 : 0

NB.*AttachTransactionHashes   v--  attach  transaction  hash   to
NB. individual inputs/ouputs.
NB.
NB. When inputs and  outputs  are  normalized it's  necessary  to
NB. insert the  (TransactionHash) of the transaction inwhich they
NB. occur so the input and output  tables can be joined  with the
NB. transactions table.
NB.
NB. dyad:  blbt =. btcl AttachTransactionHashes blbt

NB. insert lists
bm=. (0&{"1 &.> y) e.&.> <INAFTERCOLUMNS
rp=. >:&.> bm

NB. hash rows
rh=. I.@lastones&.> rp #&.> bm

NB. expand io tables for hash insertions
iot=. rp #&.> y
bm=. ;(#&> iot) {.&.> <1

NB. replicate hashes
ths=. (#&> rh) # x

NB. merge hashes and repartition
iot=. ths (;rh +&.> <"0 +/\ 0, }: #&> iot)} ;iot
bm <;.1 iot
)

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

NB. !(*)=. jpath

NB. local bitcoin block directory - needs configured BitJDData folder
root=.  jtslash jpath '~BitJDData'

NB. working directories
bcp_ijod_=: root , 'blocks/'
dcsv_ijod_=: root , 'blockparser/export/'
)

CheckEmbeddedCommas=:3 : 0

NB.*CheckEmbeddedCommas  v-- 1 if there  are no ',' characters in
NB. "--" quoted strings 0 otherwise.
NB.
NB. monad:  pa =. CheckEmbeddedCommas blclSegments

dc=. ;y
(+/',' = dc) = +/ ','= dc {~ I. -. ~:/\ '"' e.~ dc
)

CutTransactionSegments=:3 : 0

NB.*CutTransactionSegments v-- cuts CSV file data into segments.
NB.
NB. monad:  blcl =. CutTransactionSegments clCsv
NB.
NB.   file=. read EXPORTCSVDIRECTORY,'EXPORT_2011_05_31.csv'
NB.   dc=. CutTransactionSegments file

dat=. y -. CR
dat=. 4&}.&.> (TSEGPREFIX E. dat) <;.1 dat
)

DenumberIO=:((<'0123456789') -.&.>~ 0 {"1 ]) ,. 1 {"1 ]

InvertSegments=:3 : 0

NB.*InvertSegments v-- invert data in csv segments.
NB.
NB. This verb parses and inverts data in csv segments and appends
NB. to   three    JD   oriented   TAB   delimited    text   files
NB. (transactions.csv), (inputs.csv) and (outputs.csv)
NB.
NB. monad:  ilOutlines =. InvertSegments blclSegments
NB.
NB.   csv=. read EXPORTCSVDIRECTORY,'EXPORT_2011_05_31.csv'
NB.   segs=. CutTransactionSegments csv
NB.
NB.   1 SetNormalizedCSVFiles JDCSVDIRECTORY
NB.   InvertSegments segs
NB.
NB.
NB. dyad:  ?? InvertSegments ??

NB. test for embedded ',' characters in " quoted text.
NB. I believe (blockchain64.exe) does not embed ','s
'embedded , characters in "..." strings' assert CheckEmbeddedCommas y
sgs=. y -.&.> '"'

ntr=. #TRANSACTIONCOLUMNS

NB. get longest segment header
head=. SegmentHeader sgs
iohead=. <ntr }. head

NB. cut lines drop headers
sgs=. }.&.> <;._2 &.> sgs

NB. lines out: transactions, inputs, outputs
lout=. 0 0 0

for_sg. sgs do.
  st=. <;._1 @  (','&,) &.> ;sg

  NB. first (ntr) positions to (transactions.csv)
  tr=. ntr {. &> st
  tr=. tr #~ 0 < #&> 0 {"1 tr
  (csvfrtab tr) fappend TRANSACTIONSFILE
  lout=. ((0{lout) + #tr) 0} lout

  NB. remaining positions to (inputs.csv) and (outputs.csv)
  st=. ntr }.&.> st
  t=. ((#&> st) {.&.> iohead) ,.&.> st
  t=. t #~ 0 < #&> t

  'transaction input/output mismatch' assert (#t) = #tr

  NB. NIMP: WONKY: some input/output blocks are questionable remove them for now
  'iname ikey'=. <"1 |: {:&> t
  mask=. ((,:'Input') (+./"1)@E. > iname) *. 0 = #&> ikey
  t=. mask # t

  NB. HARDCODE: transaction hash column 2
  tr=. (<'TransactionHash') ,. mask # 2 {"1 tr

  NB. remove dangling empty inputs, sort and denumber
  t=. }:&.> t
  t=. (DenumberIO&.> t) {&.>~ (/:@:(0&{"1)) &.> t

  t=. tr AttachTransactionHashes t

  NB. split into inputs, outputs
  osplit=. OutputStart&> t
  ipt=. ;osplit {.&.> t
  imsk=. (<'InputAmount') = 0 {"1 ipt
  opt=. ;osplit }.&.> t
  omsk=. (<'OutputKey') = 0 {"1 opt

  NB. insure complete io rows are formed
  'input rows incomplete' assert -. 0 e. (<INPUTCOLUMNS) = imsk <;.1 [ 0 {"1 ipt
  'output rows incomplete' assert -. 0 e. (<OUTPUTCOLUMNS) = omsk <;.1 [ 0 {"1 opt

  ipt=. imsk <;.1 [ 1 {"1 ipt
  opt=. omsk <;.1 [ 1 {"1 opt

  NB. HARDCODE: remove inputs with nulls in select positions
  ipt=. >ipt
  ipt=. ipt #~ -. *./"1 [ 0 = 0 3 4 5 6 7 {"1 #&> ipt
  (csvfrtab ipt) fappend INPUTSFILE
  lout=. ((1{lout) + #ipt) 1} lout

  NB. HARDCODE: remove outputs with nulls in select positions
  opt=. >opt
  opt=. opt #~ -. *./"1 [ 0 = 0 2 3 4 {"1 #&> opt
  (csvfrtab opt) fappend OUTPUTSFILE
  lout=. ((2{lout) + #opt) 2} lout
end.

lout
)

OutputStart=:1 i.~ 'Output' -:"1 [: [ 6 {.&> 0 {"1 ]

ParseGenesisBlock=:3 : 0

NB.*ParseGenesisBlock v-- parse and check Bitcoin genesis block.
NB.
NB. This verb parses  and checks the raw binary data of the first
NB. or genesis Bitcoin block.
NB.
NB. verbatim: see the blog posts:
NB.
NB. How to Parse the Bitcoin BlockChain
NB. http://codesuppository.blogspot.com/2014/01/how-to-parse-bitcoin-blockchain.html
NB.
NB. Bitcoin: 285 bytes that changed the world
NB. http://james.lab6.com/2012/01/12/bitcoin-285-bytes-that-changed-the-world/
NB.
NB. monad:  clMsg =. ParseGenesisBlock clBlockFile
NB.
NB.   file=. 'c:/bitjddata/blocks/blk00000.dat'
NB.   ParseGenesisBlock file

NB. j profile nouns !(*)=. IF64

NB. nouns set by this verb
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

NB. next 4 bytes represents block target difficulty
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

NB. next 4 bytes is the input transaction index
offset=. offset + 4 [ TransactionIndex=: _2 ic (offset + i. 4) { dat
'TransactionIndex mismatch' assert _1 = TransactionIndex

NB. input script length is next
offset=. offset + vlen [ 'vlen InputScriptLength'=: vint (offset + i. 9) { dat
'InputScriptLength mismatch' assert 77 = InputScriptLength

NB. script data
offset=. offset + InputScriptLength [ InputScript=: (offset + i. InputScriptLength) { dat

NB. sequence number 4 bytes
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

NB. last 4 bytes lock time
TransactionLockTime=: (offset + i.4) { dat
'TransactionLockTime mismatch' assert 0 0 0 0 -: a. i. TransactionLockTime

'Genesis Block Parsed and Checked'
)

SegmentHeader=:3 : 0

NB.*SegmentHeader v-- forms denormalized segment header.
NB.
NB. monad:  blclHeader =. SegmentHeader blclSegments
NB.
NB.   file=. read EXPORTCSVDIRECTORY,'EXPORT_2011_05_31.csv'
NB.   SegmentHeader CutTransactionSegments file

heads=. (y i.&> LF) {.&.> y

NB. segments headers are usually the same
if. 1 = #@~. heads do. heads=. ;0{heads
else.
  NB. use longest header
  heads=. ;heads {~ heads <:@i. >./ #&> heads
end.

<;._1 ',',heads
)

SetNormalizedCSVFiles=:3 : 0

NB.*SetNormalizedCSVFiles  v--  sets  fully qualified  normalized
NB. output files.
NB.
NB. monad:  paRc =. SetNormalizedCSVFiles clPath
NB.
NB.   SetNormalizedCSVFiles JDCSVDIRECTORY
NB.
NB. dyad:  paRc =. paReset SetNormalizedCSVFiles clPath
NB.
NB.   1 SetNormalizedCSVFiles JDCSVDIRECTORY

0 SetNormalizedCSVFiles y
:
TRANSACTIONSFILE=: (jtslash y),'transactions.csv'
INPUTSFILE=: (jtslash y),'inputs.csv'
OUTPUTSFILE=: (jtslash y),'outputs.csv'

NB. dyad clears files
if. x -: 1 do.
  ferase TRANSACTIONSFILE
  (csvfrtab ,:TRANSACTIONCOLUMNS) fappend TRANSACTIONSFILE
  ferase INPUTSFILE
  (csvfrtab ,:INPUTCOLUMNS) fappend INPUTSFILE
  ferase OUTPUTSFILE
  (csvfrtab ,:OUTPUTCOLUMNS) fappend OUTPUTSFILE
end.

1
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

csvfrtab=:[: ; (<10{a.) ,.~ ] ,&.>"1~ '' ; (<9{a.) #~ [: <: [: {: $

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
1,_-81cHO4+>GSn2)-4/1E\P0+>t>t1a"M-+>Y\o0fC.01*A;-+>khq0ea_+0d&22+>u/$1,9t.
1*A;*+>c#"0fU:53?U(9+>l,$1,U112BX_5+>beq0f1"11a"M.+>Ghu0ea_+0H`),+>Pku0f1"0
1a"_"1c-=01E\D4+>GSn1GBq+0d&8/+>Get1,g=12BXe5+>GYp1G^./0d&;0+>Ghu1,U1/2BXb2
+>GPm1,^702'=\1+>k9!2]sn!1GL"3+>Ynu2'=\6+>Y,s3$:""1H$@2+>Gl!1a"P1+>b2r1a"Ut
1,9t0+>Po!0esk-2BXq$1GL"4+>Yer3?U+6+>b2t1dPYiA3ja:Eb0<56>:OODeX)3@:WnhATMo8
AoD]46#L+IH$X$EFD,5.6t(1G+Du+>+EV:.+@L6aG%GJUFECr$BN0"\DKB5rFD5Z287?RQATM:%
FCAZm+EVX4DKB5rFD5Z2+D>2)BHVD8+DG_(Bm+3$F^])/Bl7m4FE9*RF`;JFF$`/k75[%kBlmj'
Bl5&&@<6!&2)l^eCiF&r@V'XJ@<6!;3(%@j@r"DFFCT6'DBNCsF(HIO3$;X?A9)7&F!,(5Ec#6,
6=FqH2)ms:ARfLMDe*EqD/WrrC`l&QF(I3g6YL%@CERe3Eah@DF(I3gAo^OUGr@N<2'?@RFCcS6
F^f0$@j"*PFCT6'DBN_+Gp$RAFCfM9FDi:2@<6!&2)l^jDfT]'F@'\`8jlThFEMP5AS,XoAKZ/)
EbTH7F!+q+FCT6'DD,a8+Du+?DKA0YARfLED.7'eA7]:=Df'?"F"neOAfu2/ATD?)@<,p%DJpXF
/12QMBOPpi@ru:&F!,17+<iBh+s:lJDffQ$+EMXFBl7R)+>=pVFD,6+GA2,06ZmKMEa`j,@:OCn
Df/KbB5M3tFE:r7FE8Ql;cY#QBl%?'A79Rg+DG_8D]j+4B5M3tFE9i]DKTf*ATC@<Eb0*+G%De6
F_t]1@;L!-Ao_g,+DG_4F`]9TF`_SFF<GX9@ruF'DBNh*D.RcW=AVdk<'sSb6qL9F6W?iZ=_)5e
ARfh#Ed8d@DerruDJ()%F*8[<Bl%@%+D58'ATD4$ARlomGp"MECi<g!@q]:bDDj=(AU%c87qHRL
F(o\^Ci<g!6YKnECh7KsAQ*)ZBlJ0+Bl\9:+@9da@rH(!+Cf(nCi![#B4W3,@rc:&F<E.X@rH7,
@;0V#+@SXc;aDOFF^f0$@j#PuGt2F`ATMR,6>URMCJT(pE-67gA7T^lF)tr-EcZ=F6>:OODeX)3
@UX=h+>l,$Dfp/@F`\a7A7T^lF)soB5sn(B:JsSZF)u/2@<6*rDKKH1Amo1\+EqaEA9/kA8Oc!5
79<8_6rS/JChR6uBIP':Ec6)>8PVQ@<(0\P:J=b_:/c7T@;^-p@ruF'DBNV$F(f-++CTA6@:Nt^
A0>;mFCfJ8Bl7m4F>%QTFDuAE+Cf>+F_u#;8PW)^<'sGT<D?4eBl7m4F<G(3CisT4+DtV)ATLF<
:fUIn7S-9BDJsQ4@;KY(ARlp*Ea`j,@:OCnDf0V=Bl7m4FE:#kG%G]9;e9TYASuU2Bl8**Ec`F7
@<>p#Bl5&'F*8[IAS5jkDKKql6pjmR6qL9F6W?iZ=_M_iA9/l-DK]T3FCeu*8jje2Ci<g!@q]:b
DBNG1Fs(L:E-67FAnc'mF&,V$:/b(b:N0l_;c?@4@rH4'Bl%?k+C]&&@<-W9Anc'm3ZqsLCb-]M
D_*#AH#.2(:K:@j<E)=]9N=e^;f?f#E-67F@rH1+D/LJ6@;TRs:K:@j<E)md8PDQjDfT]'Ch\3,
A0>u7@;^-p@ruF'DBNk?FDuAEF&-q#E-68$FCB33F*(i2F<GL6+E)CEE-68D+DG^9Bl7m4FE9*R
F`_SFFE:8eEcYe^ASu(#BlcUWDe!R%@<-F#+@9da@rH(!+D58'ATMR,+C]/*@r"t<:K1Ck;FFH)
F)5MuF(fT4Dfd+GDfTB0+=L,`:K1Ck;FFH)F)5MuF(d!FB6%p5E)U=\D.RU,87c4?ATDC$Ec#k?
A7]XsEc#6$BmO?$+EM+,D.RU,+D>=pA7]d[ATU[cEc#6$BmO?$6W7#TBl%@%F(KH7+D,b4Cj@.C
F^]*#Anbge+Du+<D..6pH=^V0Dfp/@F`\a<Bl%@%<)Q"W;aEcM8P`)K:J=b_:/c7T@;^-p@ruF'
DK?q1DesQ5DBNh*D.Rcf;F+&V5snUC:JOhX8PDQjDfT]'Ch\3,A0>u7@;^-p@ruF'DKAcU77U0P
77KjNFE1f-F(&R#Bl@l3F(K!$ASuT4E,oN%Bm=)E3+HW5@r"PS@X3',F$aS_@rH(!+C\c#AKWii
+Cf(r@r!3!Ec5e;@X3',F(.!dAn45BFCT6'DBNCsF(HIO3$;gRDf$V.G][M7A7]9oA7]7bD..6'
/Kf+GAKYf-DJ()&De!p,ASuU!AnYY!FCfM9Ao_g,+D>>23ZqpK+?_>"@V09r@r+\IG[kf<Ao`!%
@UjJ&+Cf41Ao_g,+C]G&C`k;PF(Jo*Ci=3(+CoD#F_t]-FC\um2)o/lFCf?#ARlooARfFk@;I&u
Ec5e;6>:OODeX)3@UX=h+>l,hAnY^d@qfdgC`m>1Df$V1AU#=L+EM[EE,Tc=F!,UEE+O&4@;]Tu
Ci=N/EZek#F(K#s@VB=t+D,Y4D'3;5FCfMS+Cf4YAU#=\/g+h>@N]/s6@!ZaF(m@CDId='+E):7
B5)6+Df0,/BeFH^2)\B(5r(;U+D>2)BHUo-Df$UmE+Noc;bV6i0euZu5rCAP+D>2)BHUo-Df$Um
E+Noc;bV7G@51\O5qsKq@<6*)Ao_g,+AZrfDGsJ-F)iun0N(J=7860%0fC^.BOPsq+D,Y4D'2Vn
AStFF9QP8k;Fs\R9gg]o0IUFA.3N,/Cht54AfslgAStFF9H[5):dn)H/MT.;+D>2)BQJ62F(eu:
-t?d:+CehrC`mY.+AZrfDGsJ-+B(fs/MSA]@<6+'F)5o2@59\u-t?d:+CehrC`mY.+AZrfDGsJ-
+B(fs/M]1A+D>2)BQJ62F(eu>0et.eA18X2@;Ka&De:+fE+Noc;bS<483ngb0eskb@<6+*Bl8$9
@<-'j@VfTuCh7KsFD)e2DKKH&ATAo&H$!U?@rHL-F<G"0A0?&(Cis:                    ~>
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
0fC.0+>P&o2BXn42]t(&2)d6]DK]T3FAla`D.RU,F"f:C67s`ZDK]T3FAla`D.RU,F"f9jF=f'e
@UX=l@j"?\G%G]9;e9TYASuU2+EV19F=n"0:-pQB$;No?+CfG'@<?'k3Zp130f3WfCbRaV$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sBpDK]T3F<G!7An?0/Anc'mEt&Hc$8EZ%ATU[c
Ec#6$BmO?$6W7#TBl%@%+A,$h;cZ:X;FNrP:Jt=)$4R>PF*9]-+ED%%A0=<C:estg6W7#R8Q%uE
<)6Cp/13kg:estg?SX;i0jcUl?SaDh@rlf@%17/fB6-3s+@C9n<,uDbF(&R#Bl@lfAS5jkDKKqB
@rlf9%14d34<S]YDg-//F)rHqDK]T3FAla`D.RU,F!,O8B6+Lh%16TdG!.l/Eb/Zi+@TC/:Jt.Z
;cZ:X;FNrP:Jt=H-Uh-6:Jt/!1,(F:?SFEG1,LUnF*8o?$?KckF$2Q,6ZmKMEa`j,@:OCnDf/Kb
B5M3tFE8R7F*8Z8$8<Sb+EM47GApu3F!+%lG%G]9;e9TYASuU2+EM+,Et&Hc$=e.#4ZX^+ART*l
79EA^;H-"^<^]MW771$M;HYOu79EA^;H.!Y0JP:h0K!2m3A+f_Fsd_+F(K!*4ZX]QF`^T'@;^-p
@ruF'DGt+ZD.RU,F!+t6Fs%5$0H`J#F(fK9E+*g/+A$HoATDlkAS5jkDKKqBF(K!*FCfN8F*)P6
:-pQ_H[\qCI3<S_/Kf+EEbTK7+EMXI@P/)s:-pQB$;No?+B3#gF!*(f/hSb!AoD^,@<?U&A0>u*
G]XB%:-pQB$;No?+Eh=:@UX@mD)r+5:-pQU%15is/g)8Z+<W9h/hS8hDJ!g-D..NtA0>u*G]XB%
:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhEH[\A3I16NY67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g,@VEbce3DBNG*
ARTU%@UX=h+E)9CFE1f2BHV,0@ps1b%15is/g+Y?ARTU%-RT?1%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R=O$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:F                                   ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2E;m=+>Y,p1E\Fq2E!?61,L+/+>Gf62BXb0+>P&o3&3010esk,+>Pr3+>Get1*A;10Jjn-0H`+n
0ebF?+?1K!+?)5>6=FqH2)ms:ARfLC;_g3`0-EV,+D,b6@ruF'DBNP3Df$V1FEDJC3\N.!BleAK
B5)I$F^ct5Df%-pDe*F#8T$n/@;g3?1GLgG3B&Z%$84%A$84%TF(fK9Bl7Q+BQ&);FDi:3Df0`0
Ec`FGD]hATF(I3g6YL%@CER5-Ec#6,%13OO%17&s@Vfag+EMX5FD55-F*)G:DJ((\DI[TqALM#5
FCeZ^+Cno&@4;WmHOU<)%13Cp0-EYo@rGmh+C]V<AQrF_FDi9gBkL"TFCf)rEX`?^6>:((DKKH&
ATAo-DKJ9TFC?:T+>>kd$41<_EZccEDKI"8+?^i$4!85[4<S0CFC?dqASu.&BKI>N.k<%X$42%g
$4.#QDKJ9TFC?:T+DG_86t(1G+=\Kh2)ZR-+Cno&@9[GO3t2N'I16N+%13Cp0-E]$@rGmh+@9dT
8T&W]B4Z*+FDi9g@<6!;3$<9aEbTE(%13D_FE2)5B-;5+F*2;@+?^hk,!-5@$$U&sCh4_;Bl8#\
@<>p#4s2O.%13Dg%13CJBl8#8Eb0)rBl7HmEZdLf-u!R@.4AnJF@9PZ@3?j=2)m$H%13CJBl8#\
@<>p#00LF83'.QV#mkW`F*2;@+?^i8BkM.%F'EZrD..-rA7]de+=eRTATN!1F?9p=$%36i+:SYa
0/"G6E,]B+A0>87?m''"EZeq%@q[!$ART+`DJ((G+C]V<AIStQAoD]4-u!R@+DDr]+>>l"BcoM\
A79Rg/kfhoB67f0-70jG@<>p^BjDiE4WlF?+DE>V.1HUjHOU;g$$'TuF_l.B4Wl+,-Qjo^Eb0<7
Cih`J$42+i$41`aFEMVA+ED%7F_l.]%17Lm$6VZDF(I3g;flGXCJT+bEb9-+G><'uATKUa:2b5c
F!,C=+>u)"@X3',+E2I4Ch[B%CLqd4+EVNE@UX=h+>l,$Ao_g,3XlE*$>=O'E&oX*F*(i#CN"B-
Eb9-+G:mBDD(fmOATMs-Df0VL0f_!F1GC[B05+d8BPD?s/S9$AD(T0JE-5W+Bk&`1AU,kLD_5BL
@VKpoDeX)@@:WnhATMoEBl5MABQ+Cf%13OO8K_GY+EVXLBl7Q+FDi:6Des6.G9D!@AKY])F*)GF
@ruF'DK?q@AT;j,Eb/c(FDi:DF`M@B@3@Hc+C]V<AKYr7@Vfag+:SZnAU,D4DKKe>@3B#nFCT6'
DBN@uA9)7&F!,UHBl7Q+E+j2C+B3#c+DG_7FE2M6FD5Z2F!+n3AKYu8Blmo/AU&01Bk(k!/g(T1
6XajT@;^@/DIjr(ASc<.D.Oi6Bln#2FD,5.E,oAsFD55nCh\!:+E(j7A8c1"B-;;0@<<W+DBNn3
E'Fd=%15[EF*)GF@ruF'DK?q/Eb,[e%14g4/Ke#$CLnW1BOr;rDfTl0F)Z&8A8,po+E2I4Ch[B%
CLqc6B4YslEaa'$A0?)1FD)e2F<Dti2'?@RFCfME+>G!JH$!U?0R,9./0GB/1GU(^H$!V=+Cf>1
Eb0<2Df0*"DJ()6D]i.)@rH:+A8,piFCd!G1GU(^H$!V=+Cf>1Eb0<2Df0*"DJ()6D]i1*@rH:+
A8,piFCcm1$4R=r1c6sH2D[We2Dd]Z2aKkl5r(nu3&<oV5t3Rp3&E<F6UEXd7Putj1cRB]3&NEF
6pX4#5qk,T3&a8`68C>S1,;3b1cI*D1c$sG1I3cV3CZ:p75m.\1H.6I2DHmA5sdpn0gRN^7Pd"`
2)Rfj2F]Gj756b\76*^m3&3fd2@U!&$8N_U+AcWiAoD^,+B(fs/M]1A+D>2)BPD?s+E)-?FD,5.
E-5W+Bk&9$AU+^l%15!I0LeN#1bpgQ1ds)P2`!0S2*!NO2aK;g6U<Oe6UNRf1H@9K0f^sB0K(^B
1dNrT2aTo!1.4,^6o74e0K9LK%14m6/Kdl$Eb961D'2_J:dn)H/MT.;+D>2)BPD?s+E)-?FD,5.
Eb0<7Cige<Aft#C5qOiL2@U!&$8=1g3ArcS2`<?D2E<WN6o?h[2`*<N75[Li3CYtd5qk\^2`!ch
71BS5$8`kW+@0OK+Eh=:F(oQ1+C]V<AKY])+D,Y4DKI">AfsuC:dn)H/MT.;+D>2)BHS]WGVCfo
AoD]49jqaR+AQKiGAhM;.1HUn$8=.f0ebUG2E*QQ0JGCF2)@WX2)[BM1H@l]75Hqn3&X&V6o$\W
6:F<P$4R>"+>"^4ATDC$Ebupt83ng_2)ZRj@<6*)Df-\>BOr;tG][M7A7]9o;Fs\R9ggQf2D?7o
ATN!1F:AQd$8aRs6T7:j0JGFO3AX&_2`!6E3&iZQ3'oqf1,)!R7R](#77'Bt5t*Lp1cIlX7Pukd
6SU8]5t*ai2+'&X1^sd$$8s"Y+AcWiAoD^,+B(fs/M]1A+D>2)BHV52+EV:.+ED%7F_l.BDe:,6
BOr<*Eb0E.Dfp+D;b02+1,Us4BOPsq%13OO6oHb[2E+)`1IF)h6npYW3AE?V1dOPe2)7NZ7Q*P#
2+08Z1.+Jd6o$\[2`WiO2`3oV0K1mE2+')a3'f>S%13OO2]s[p<+0QR+EV:.+D,>.F*&N]+C]V<
ATJu4Afu2/AKZ&*@rH6q+B(fs/M]1A+D>2)BJ(E,BPDN1BlbD=BOr;pA7T^lF)rI6BOt[hF*2=/
$4R>12DI3M2b#\7$4R>%+>"^%A7Qg)BOr;C+Cf(r@r$..D'3;5FCfM9Ao_g,+E275DKI![+CT@7
FD,5.ASu$$De:,'G][M7A7]9o;Fs\R9ggQf2D?7e@<6*)Ao_g,+E275DKI!X/g+,,BlbD2F!,R<
AKW`c/Rj!IAKYGrDIIR2+@9da@rH(!+@0OKEb0<5/e&-s$8=.f0ebUG2E*QQ0JGCF2)@WX2)[BM
1H@l]75Hqn3&X&V6o$\W6:F=22DI3M2b#\7$4R>&+>"^'Df0`0Ec`FGBOr<,ATN!1F<G19Df$V*
+C]V<AKZ&9EbTE(+DG_8D]iI2@UX=h2)l_"FE2)5B-;><Bl7Q+6=FqH2)ms:ARfKuASu!rA8,po
/g+,,BlbD2F!,R<AKYi.F*&O7Df'?0DJXS@F`V,)+@9da@rH(!+@0OKEb0<5+D,P4D..Mq$4R=s
2H=rp9K?!bF(7"'Al*J6<H_#RAk6c*;)`\nFD>tn6>:OODeX)UCi<g!;e'KPD.-@?9JSJ(;+r*R
@q]Fj@3B0#EZeh*FCT6'DBND)De!R(+D,Y4D)r+5%16cjFDu:^0/$sPFD,f+/n8g:05#<DDIdHt
FY@QF@Ua%n@rH(!/T>9ACbK76DdkA:@<6O%E\BanFCT6'DD+CdFCAWeF(I"AH#mtA/TYE8ASkj.
F)c"*$4R=O$:@][5u^8q<'`iE73H&UDe!Q*-k-M++<Ve?@<6*)@q]:k-o3V-+C]&&@<-W9E,oZ0
@<-W9CLqcB%13OO+<VdLG%G]8Bl@l3Bl8$(B4Z*7%144#+<Y?+F(eBjATf1=@q]:k-o3V-+C]&&
@<-W9DJsV>DKTc3/.Dq/+<Ve?@<6*VATDR&AQ!GbF<G(,@<*bP1+=>TBl7@"Gp%!CF<GIDChtX3
$6UH6+Dt.mD.Oi(DKKH&ATAo9DKBN)DIm?$DJsV>DKTc3/.Dq/+<VeE6>:O_+DG_8AS5Rp+E_RC
BkM<pA0>c.F<GIDChtX3$6UH6+DsqmDI[6#+<VdL+DG_8AS5Rp+E_RCBkM<pA0>c.F<GIDChtX3
$4R=b+<VeNDfTV9Ao)BoF<D\KF`)87B5V9k/.Dq/+<Ve;AT2a)+DG_8AS5Rp+E_RCBkM<pA1S/s
%144#+<YH2Gp"MK@<6*VATDR&AQ!GbF=AaM$6UH6+DYP6+=Lo3F(eBjATfL3$6UH6+DYP6+=Lc3
E-,bB%14OG%13OO6W-?=<(.p/5se76+EVX4DKB5rFD5Z2+=I[++<VdLBOPsq+Cf(nE[W_!.3N)6
DIIR2+E2@8D..I1+DYP6/.Dq/+<VeMATDj+Df-\3DKKH&ATB=2$6UH6+Dbt+CK,"bAKY])FCf)r
EZfLBF(o9)ARm>$$6UH6+Cf>(DIR$qAKYH#DerunD@Hq%3t2N+$:@][5u^8q<'`iE73G<9EbfK&
?Z^="AKWB1$6UH6+EDC=F<G(,@<*bP1+=>gDKBN)DIm?$DJsV>DKTc3/.Dq/+<Ve@A9]4>Bl8$(
B4Z*+F`)87B5V9k/.Dq/+<VeGEbTB!Ed8dCAU,CHEc5l</0JY;GUY0Q$6UH6+DYP6+=M8KDfdE;
$7S%G$4R>0;FNlN73GW&79:UTBk;Kq@VfsmCEPoA%16$&9LV<J+:SZK79CsO@<6*2+CT=6BOPsq
/.Dr0ATDj+Df.*8$:mTf-tm%1BM`_\Ft"PBF!,.)F(eBjATfU6$:mTf-tm%1BME&YCM[Q[Df9_H
+CT=6BOPsq9kA?\Ch6L_DfdN>$>rgWD.P7-$>r1EFE8uB$>rUWDI[6/%17;tEbd38$=m^eFD)*j
7T*#V+C]/*@r".8$4R=O$:/QJFD,6++DbJ3Dfp.EAo_g,3XlE*$>=O'E-"&n04JX;@rH(!FCB!$
/oPcC055<7AU#hHBQ-1XDfBE#4Z+oM2)m3B%13OO6W-?=<(.p/5se76+C]/*@r$-.-m/s+BOPsq
+@A[c;CF=V.3MA]<$4q99M?Qr:JOhf;F*lL<$5XdDe!R(?Z9d':f9kZ5uLi.91;u7%16TY@;0U\
DfTV96;10A+AP^3+APp19IpV[BOtmjBQP@`8Ol?I<$4q3<$4q99M?uH$>=!ZA7]d(6;10A+AP^3
+APp19IW%4$4R>0;FNlN73GPq6;0fjF(KH8Bl7R)+=J?A$>s9hAKY#>;F<u@;CF=V.3MA]<$4q9
9M?Qr:JOhf;F*lL<$66nFED57B6.F!CEQGO8PMKK=Wg@+=Y(!hG%#30AKX<5:I6Kl%13OO6W-?=
<(.p/5se76+EVX4DKB5rFD5Z2F!)kR%16cWF(c[q79EM3:/=h3:/st]+@Aq";cHX\8PW5-FE1f-
F(&R#Bl@m1?Z9d':f9kZ5uLi.91;u7%178iEZdqK<(0;G;BS_1<$4q99M?uH$?g-$?ZUN98PW5R
7n$;u:/=h3:/st]/.Dr0Dfp//F*\s#:/jYP78b7':K/H3<D6(;%16oi@r#FnBl.E(8PW5R7n$;u
:/=h3:/st]/.Dr-BmO>58PW5R7n$;u:/=h3:/st].6@tG%15I#76smA+B1Wn9LU(GEa`j,@:OCn
Df0W'Bl7m4F<DtS%16cWF(ep"@<,psFC0-7+B1d3<$4q3<$4q99M?uH$?K]tBlJ0$F(o80<(0ng
+AP^3+APp19IW%4$4R>0;FNlN73GPq6;0fjFE1f-F(&R#Bl@m1?Z1(/E-67F-m/s+BOPsq?Z9Fo
ASuTsFEep-79EM3:/=h3:/st]/.Dr0@;L't+AtWo9H[)+<$4q99M?uH$?K]tBlJ0$E-5VsCLqc6
<(0ng+AP^3+APp19IW&":K(5"F)u/2@<6*;0ht%f:et"h?ZU:)BOPsq+E27?F<GOCDe!@"F)Q(A
%13OOF)>i<FDuAE+>=p!+>=63:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU+<Y_\2)ZR"+AP6U
+B(fs1,Us4BOPsq+D,Y4D'2VnAStFF9FV>(67sB'+EKCp1*@\^:-pQU;b0230eskb@<6*)Ao_g,
+AZrfDGsJ-%15is/g)8ZF(eu:+<Ve%67sBZ83nsQBOPsq+D,Y4D'2VnAStFF9FV>(67sB'+EMQX
2D?6r:-pQU;Fs\R9ggQf2D?7e@<6*)Ao_g,+AZrfDGsJ-%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!gDKBB0F<D\RF)u/2@<6*0ASkjiCf"P]@ps1G@<6:"DDF(\D..-p+Dk\2F(&]m+D,Y4D'2Fn
E,ol;B6%EtD/!m#+D,P4F_r7BF_>>uF*),6B-7WjBQ&);FDi:9DK]r6AKXlB:dn)H/MT.;+D>2)
BHUf'A7ZlqEc5e;8du+:$4R>=@<5peC`l>YF)>W/-QmSH@3ABeDeF*!D/F!)B+52?F`&<W2'=;'
+Cno+F!+n(D^c,&%172q+E2@>B6%EtD/!m#+:SZ\Dfm14@;[2tBOPdkAKZ).AKZ&8CiCL[3Zr6Q
DIjr)DBN[R0JXbmD]j";Bl8#8FDi:2Bl5OG+A[)mATE!/F(HJ9BPDN1DImBiF!,C?ASuR1C`k,t
+EV:2DJLA'Cj0<5F!+n7@;0Od@VfTuDf-\6Bl8'<+CT.u+DkOs.3Ka28PhiM6npSR+DGm>@ps1i
ARlp*BQA$6B4rE/E\TI++D,b6@ruF'DCuA*%15dC@WGmtGp$gB+D,&'FCfJ8FD,*#+EqO;A8c[5
+C]J-Cige6DBNJ+Ci^$m%17,eEHPu9AKW@2ChtI.$;No?+ED%5F_Pl-+=D5D@<,n"-OgE(F)5e<
4ZX]W7TW/V+E2%)CEOuXF`VRVCh[?3-T`\D3a>I"AStFF9J'=[DDj=V@VK^b-OgDX67sBV:dn,X
;bS;s3Zr0V@<?0*-[p,^F*(u106;2NARTj?1+m*RC`k)7$;No?:JaJT;c?@44ZX^,F)5e</0H<F
F)u//@<jXa/nAd7+=@U*:JaJT;c?@44ZX^,F)5e</0H?47S-BS+=eQ_4$"K3=(uOp9PJBeGT]:i
A9)U&A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@BjtX^Gr%3.A8H')-T`G!1*@hb4==rZ
@WQU,/otqR-Rh,"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$;No?:JaJT;c?@44ZX^,F)5e</0H?4
7S-BS+=eQ_4$"K3=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@
BjtX^Gr%3.A8H')-T`G!1*@hb4==rZ@WQU,/otqR-Rh,"+=Juf,To2sCh[@"F)3H_/ibOD/nB6D
Bjr24.1HV_;bTV&4ZX^,F)5e</0H<FDfB9*F)u.F%17/tC`kl%+>G!"+=AR5:dn,X;bS;b+DiPS
@q6qr$;seg@VKq*+?_b.2DbjM;H#l#73F`S+>Y-G+>u)71H,aMF)u/=BONYR2BY.D+=A:183o!g
2BZ]V.UsT;+=^kK+EMU?%17/tCia8u2)-j/4ZX]5+B(fs2)-j/Bcnm8+D`/M@j`C?F)29mF)u/=
BONV<4ZX]5+B(fs0d(0Q.UsT;+=^kK+EMU?%17/tCf3i$7860)2D?7:3Zodm;Fs\R9gg]o0Hb'P
.UsT;+=^kK+EMU?%17/s0fC^K3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h+=A9Z%17/tCf3i$7860)
2D?7%Gptg',9V7\4)]7`E-673$?('/E-673$7QDkF(eu:+?_b.1E\_$0F\A-F`_SFF?MZ--o*J*
+<r!V+=@U*F)u/=BONV<.![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$?J'Z1*A_@+>Y-$+>=63
Dfp/@F`]c-+=K-).3KiX-QjcG$?L9)F(eu>0esk"Gptg',9V7\4)]7`E-673$?('/E-673$7QDk
F##U2+?_b.1E\_$0F\A-F`_SFF?MZ--o3V-+<r!V+=@U*F)u/=BONYR2BXDn.6Aq&+F,CtDfp/@
F`\'"Dfp/@F`\'".1HV9/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%VDfQt7DJ!g-D..O#Df-\+@W-C2+A*bgDfTu;F!,O8
AKYZ.FDs8o06_Va/o#HGAor6*Eb-k5Df%.>DfTu;F"V-JD%-g]$8!h]/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$:\rS+DG_*
DfT]'FD5Z2+CS_tF`\`u+D,P4F_u1BF(Jo*BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:04o-CF_u1P
BQS*&G[YH.Ch6L9:dn)H0fC^V@<6*;0b"J1AT;j,Eb-@@A8H'0%13OO:-pQUE+*j%+DGm>D.-pf
Bl7K)F)Y]#BkD'h+>"^Q@:NtbDIjr-F`VXI@V$Z?1a$7AF<D#"F)u/:+?_b.8OccQ:*=Li@r!27
06M>V05P?30./h/6TSIe2DeZR2Dd!F0JZmBBl70'%13OO:JaJT;c?@44ZX^,F)5e</0H?47S-BS
+=eQ_4$"K3=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@BjtX^
Gr%3.A8H')-T`G!1*@hb4==rZ@WQU,/otqR-Rh,"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$4R>;
67sBZ;bTV&4ZX^,F)5e</0H<FDfB9*F)u.F%13OOF)u.?4ZX]?+?CVm-r3Z.:/b(b+=nXP.4/P8
-OgD\;aFl,FE8Qf3Zp=;%16!36#]784ZX]A+C-*J2)R0K%17/tCia8u1,Us44ZX]5+B(fs1,Us4
Bcnm8+D`/M@j`C?F)29mF)u/=BONbQ1*A_@+=A:183o*f1*C9R.UsT;+=^kK+EMU?%17/tCia8u
0d&V?+=A:183nsQBcnm8+D`/M@j`C?F)29mF)u.q8PhiM6npSR+?_b.-Ql;Y:dn)H0fC^.Bcnm8
+D`/M@j`C?F)29m%17/s0fC^K3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h+=A9Z%17/tCf3i$7860)
2D?7%Gptg',9V7\4)]7`E-673$?('/E-673$7QDk%17/i@5/lf3Zp4$3Zp*c$?('/E-67c3Zoh+
0I\+h+=A9Z%17/tCia8u0d%li.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn$?J'Z1*A_@+>Y-$
+>=63Dfp/@F`]c-+=K-).3KiX-QjcG$?L9)F(eu>0esk"Gptg',9V7\4)]7`E-673$?('/E-673
$7QDk%17/32)ZR?3Zp4$3Zp*c$?('/E-67c3Zoh,1+==j+=A9Z%17/tCia8u1,Us4.![7'-mKj[
.6DHjFDuAE%17#rFDuAE%14Nn$4R=O$>=!qBOPsq+?_b.-m2_T+=oc=BP(ct@4l7H>q&$"%13OO
:-pQUFCfN8+D>2)BHVM5FD)e/Des6.GA1r-+DG@tDKKT7Gmt)i$6U^,0J[3"0k)q!2_eer1h&@&
3AEHLAM[pYAhl)!@Ph[S3B&^*2DSkl+>#VsFDku6G@be;F)iun0Hb%?G\CN,BHS[8D]iJ%ART*l
BOPsq+DlBHA79a+/KeaM@;R,uG]75(FD5W*+CQBJ0HahMFCcS.@<6*0%13OOE,o\[Blls81,2Nj
/h1g\C-lWV8jjeC/M/)3Blls8+E2@>C1Ums+EM+9F`8IE@rc:&F=n"0:-pQU%15is/g*u2AT2'u
@<?4%DK?q4DfQsm+A-cmGp"k!/M]17+>PW*1a$:HDJ!I#ASu!h+E2@4F(K62@<?4%DCuA*:-pQB
$;No?+B<JsDJ()6BOr;Y6m-#KFCAWeF(HJ&A7TUr+EVNE@;]LiH$X$E6>:OODeX)3@VfsmCER.r
FC?d2$;No?%15is/g,=KEaiI!Bl,m?$;No?+:SZQ67sB'+>G!ZD'13FEb[pTF@nqK+Bot,A0<rp
-Xpe3C1JH0FD5Q4-QlV91E^UH+=ANG$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW*1hq/N1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f3WfDDEsiF*(i2F<GdGEbce9DBNn=
ATMF#FCB9*Df-!k%13OO:-pQUD..3k04fB>@s)m)+EM+9F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:
Blls8;e:&nE$l)%F)>i<FDuAE+Db[5-UMNh8jlThFEMOM%15F9F@nr"ATW'6+>=63%15is/g+V;
FCT6'DBND)De!Q*@WH$gCLqN/B6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqfCi<g!6?6XG
CLqN6%13OO:-pQU@VKpoDeX)38jje7Ec6)>%15is/g+nIA7o7`C2[Wi+?_b.-UMNh8jk$9$4R>;
67sBkF_u(?Anc'm+Du+<D..6pH=_++$>OKiB4#@fDe*3<3ZoeFDfT]'Ch\3,6>URMCI;cDBl6::
<[S=`%13OOF)>i<FDuAE+=BKiFCT6'DD+UM+E2@4F(K62@<?4%DBNn=De`inF<GX9FEMOT-N  ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<(<''BitJD''),<0$a:),(<(<''BitJDBlockBreaker''),<0$a:),(<<;._1 '' BitJD'
zz=:zz,'Setup AdndAddress BASE58 Base58Check Base58CheckModel BitJDSetup Ge'
zz=:zz,'nesisBlockChallengeScript assert b58checkFrbytes b58fd dfb58 dfh hf'
zz=:zz,'d i1 ic jtslash read todate tsfrunixsecs vint''),(<<;._1 '' Normalize'
zz=:zz,'BlockChainCSV AttachTransactionHashes CR CheckEmbeddedCommas CutTra'
zz=:zz,'nsactionSegments DenumberIO EXPORTCSVDIRECTORY INAFTERCOLUMNS INPUT'
zz=:zz,'COLUMNS INPUTSFILE InvertSegments JDCSVDIRECTORY LF OUTPUTCOLUMNS O'
zz=:zz,'UTPUTSFILE OutputStart SegmentHeader SetNormalizedCSVFiles TAB TRAN'
zz=:zz,'SACTIONCOLUMNS TRANSACTIONSFILE TSEGPREFIX assert boxopen csvfrtab '
zz=:zz,'fappend fboxname ferase jtslash lastones read smoutput''),(<<;._1 '' '
zz=:zz,'ParseGenesisBlock Base58Check Base58frKey65 GenesisBlockChallengeSc'
zz=:zz,'ript GenesisBlockOutputAddress ParseGenesisBlock assert b58fd bfh d'
zz=:zz,'fh hfd i1 ic read todate tsfrunixsecs vint''),<<;._1 '' sslhash IFACE'
zz=:zz,'WORDSsslhash OPENSSL ROOTWORDSsslhash cd s256 s512 sha1 sr160 sslRI'
zz=:zz,'PEMD160 sslsha1 sslsha256 sslsha512''                               '
zz=:974{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GL"/+>P&o0H`,22'=Y0+>Y`2+>Get1,^p22]sh40JYt/F@nr"ATW'6:-pQ_6>:O66rRZ=F`8IE
/M/)dATW'6+EqaECM@[!+D#G6Bl\-0D.RU,+D,P4+@9da@rH(!01nVTE,ol3ARfg7%15is/e&._
67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F`&rk%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l*C3=DL1a$FODfp"ADfTK!DJ=E.A0;<g:-pQU0f3WfCbRRdBOPsq+Eh=:@WNZ#
A7T7^+=M;PChR6uBIOAt%17,eEHPu9AKW@AF)5MuF(cp1$4R>;DfT]'Ch\3,6>URMCI;cDBl6::
<_bt6.Sao&D..6pH=]EZDe!QMBOPUm6W7#.F"JsdDJsQ4@;KY(AKX?=<ZkjfDe!QmBOPUm+D,>(
ATKI2:-pQ?:-pQU<+oue+EM%5BlJ/:DJsQ4@;KY(ATJu9BOr;qCi<g!@q]:bDBL'4@<>p#Bl5&8
BOr;9/n8sG+CoV3E!f?,/g+b?Ch7Z1B4YslEaa'$A0>?,+D>k=E-"&n04Sp2AM.V6DeElt/n8g:
05rRRCi<g!@q]:bDD*UL:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE
1,(F>C3=>H2%!)F/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+$49U<EcYe^ASu(#BlcUWDe!QX67s`a@<-F#7qHRLF(o\^Ci<g!+EK+d
+@9da@rH(!+D58'ATMR,+C]/*@r!2sBOt[h+CT.u+E1b0F(HJ*G[YH.Ch54.$;No?+<V+#:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*1hq/L0JO"D:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0f3WfCbRXf@:Wn[A0>u4+DP=pCNCV=AT2R/Bln96Gmt)i$?B]tF_Pl-+=D5OChR6uBI=5r%17/t
ChR6uBMLlH.W]ZIBOPsq+EK+d+D>2)BHU`"B5_g)FD,N4+D,Y4D'2VnAStFF9J-b]:-pQB$;No?
+AH9[ATJt:G%#E*Dfp+D+D>2)BHSF+ChI[,Bln$*F!)T6G%#*$@:F%a+<YB9+<Yc>AKW*kE+Noc
;bRW-:-pQU@VK^gEbT*++DG_7FCB!%ARlp-Bln#2C2n><3%cn0+CTG%Bl%3eCh54A7WNEa+CT.1
+E):7B5)6lC^g_H67sBkASl?.F(96)E-*43Gp#plF(8Wp+A-'`D/!l1GA2/4+CSeqF`VYAASuU2
+C]U=6>:7P+A?3\/e&._67r]S:-pQUG%G]'@<?4#3ZrKTAKYZ.FDs8o06_Va/oP]?DKBl8/oPcC
0+A7`67sAi$;No?+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9:gnET@;JPEF)>W/02kD-
,r.//,r.h61,(I01,*-SA0iub9ggib1,*<YE[<IpGA1r*Dg-73$;No?%15is/g+kGFCfK)@:Njk
GAhM4.!$gu%15is/e&._67sB'F##U2+<W6Y;b0202)ZRj@<6*)Ao_g,+AZrfDGsJ-%15is/g)9X
2)-j/+>"^783o*f1*C7=F(c\.Ec5e;:N0l_;c?@!$;No?+<Y`=@5/lI/Kdt_5qsKq@<6*)Ao_g,
+AZrfDGsJ-%15is/g)9XE\TI++>"^68PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c?@!$;No?%15is
/g+YEART[lA3(hg0JPCVF`&ro%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l*C3=DM0Hak=@;]^hA0>u4+EDUB+E)-?
1GU(^BlkJ=H#n(=D0$-n:-pQU0f3WfCbRXf@:Wn[A0>u4+DP=pCNCV=AT2R/Bln96Gmt)i$=e!a
CghC++=D5OChR6uBI=5r%15is/h1CCE+NotASuU2%13OO:-pQUE,ol/Bl%?'-6R>?EHPu9AKZ28
Eb'56+Xefh4Y@jK7S-BS+A#%(8PUC"7Q*(G<DGhS73H>a@<?/l$4R>;67sBkChtbGD]j"-FD)e2
F!,=.@q]RoAM7tC+EML5@qfOh@j!?G@<6L4D.Rc2C2n><3%cm?+DGm>Bl8!6@;KakA.8leF)5eY
/g*5I7TW/V+F>4Y06M>V05P?30./hrE+*j%+=DVIBl5RO%15m-78?c[9KbEZF)u/:+=nWs-qQm"
:K&Ad+=K<4-Wb#"+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS74B@++=Cu>@V&tn1GURn
Cht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AY#1*@hb4==rZ@WQU,/nB6DBjr24.1HUn$;No?+Cehr
C`m8)C^g_]A3Dt.2'G"7%13OOF)u/=BONYR2Ea)D+<VdT:JaJT;c?@4/0I#G7Q*)M-Ql>Y5r(;U
+?gnu+F#"Y@j$"=.Ushf-Ql>Y5r(;U+DDrJ@j#S1.UshT-=^Qq$?L9)F(eu>0etmQ+<VdL-r3Z.
:/b(b+=nWs8ObTpHRBq783o*f1*Ab'.j0'Z.UsTG+=^kK4!u.L83o*f1*C9R.UsT;+=^kK.4/P8
%17/tCia8u0g.Q?+<VdL+=L#^78?c[9HYl/4%Vn"1j^Sm;b02/+?gnu+F#"Y@j$"=.Ushf-Ql>Y
5qsKr+=^kDC`k3;-RgBPA.8leF)4`G:dn)H0fC^K3ZohH:dn,X;bS;b+?N.a2Dfb.+Atd-7860)
2D?7;+=eRZ+=^kDGT\JG-T`[u;Fs\R9gg]o0Hb'P.UsT;+=^kK.4/P8%13OO:-pQ_ASu$hAT23u
A7]Y#Et&H                                                                 ~>
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
