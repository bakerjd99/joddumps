NB. JOD dictionary dump:  6 Jul 2014 15:26:53
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

IFACEWORDSNormalizeBlockChainCSV=:,<'NormalizeExportCSVFiles'

IFACEWORDSsslhash=:<;._1 ' sr160 sha1 s256 s512'

INAFTERCOLUMNS=:<;._1 ' InputHash OutputKey'

INPUTCOLUMNS=:<;._1 ' InputAmount InputHash TransactionHash InputKey InputSequenceNumber InputSigFormat InputSigLength InputTransactionIndex'

INPUTSFILE=:'c:/bitjddata/jdcsv/inputs.csv'

JDCSVDIRECTORY=:'c:/bitjddata/jdcsv/'

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

OUTPUTCOLUMNS=:<;._1 ' OutputKey TransactionHash OutputKeyFormat OutputScriptLength OutputValue'

OUTPUTSFILE=:'c:/bitjddata/jdcsv/outputs.csv'

ROOTWORDSNormalizeBlockChainCSV=:<;._1 ' IFACEWORDSNormalizeBlockChainCSV NormalizeExportCSVFiles ROOTWORDSNormalizeBlockChainCSV TAB'

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

NB. test for embedded ',' characters in " quoted text.
NB. I believe (blockchain64.exe) does not embed ','s
'embedded , characters in "..." strings' assert CheckEmbeddedCommas y
sgs=. y -.&.> '"'

NB. expected column counts
ntr=.  #TRANSACTIONCOLUMNS [ nipt=. #INPUTCOLUMNS [ nopt=. #OUTPUTCOLUMNS

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

  NB. if there are no transactions any inputs/outputs are orphans
  if. 0 = #tr=. tr #~ 0 < #&> 0 {"1 tr do. continue. end.
  'transaction column count mismatch' assert ntr = {:$tr
  (csvfrtab tr) fappend TRANSACTIONSFILE
  lout=. ((0{lout) + #tr) 0} lout

  NB. remaining positions to (inputs.csv) and (outputs.csv)
  st=. ntr }.&.> st
  t=. ((#&> st) {.&.> iohead) ,.&.> st

  NB. there should always be inputs/outputs 
  if. 0 = #t=. t #~ 0 < #&> t do. continue. end.

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
  if. 0 < #ipt=. ipt #~ -. *./"1 [ 0 = 0 3 4 5 6 7 {"1 #&> ipt do.
    'input column count mismatch' assert  nipt = {:$ipt
    (csvfrtab ipt) fappend INPUTSFILE
    lout=. ((1{lout) + #ipt) 1} lout
  end.

  NB. HARDCODE: remove outputs with nulls in select positions
  opt=. >opt
  if. 0 < #opt=. opt #~ -. *./"1 [ 0 = 0 2 3 4 {"1 #&> opt do.
    'output column count mismatch' assert nopt = {:$opt
    (csvfrtab opt) fappend OUTPUTSFILE
    lout=. ((2{lout) + #opt) 2} lout
  end.
end.

lout
)

NormalizeExportCSVFiles=:3 : 0

NB.*NormalizeExportCSVFiles v-- normalizes CSV export files.
NB.
NB. monad:  clMsg =. NormalizeExportCSVFiles clPattern
NB.
NB.   NormalizeExportCSVFiles 'export*'
NB.
NB. dyad:  clMsg =. paReset NormalizeExportCSVFiles clPattern
NB.
NB.   NB. reset output files
NB.   1 NormalizeExportCSVFiles 'export*'

0 NormalizeExportCSVFiles y
:
NB. profile !(*)=. dir
if. #files=. 1 dir EXPORTCSVDIRECTORY,y,'.csv' do.

  x SetNormalizedCSVFiles JDCSVDIRECTORY
  lout=. 0 0 0

  for_csv. files do.
    smoutput ;csv
    dat=. read ;csv
    dat=. CutTransactionSegments dat
    smoutput lnew=. InvertSegments dat
    lout=. lout + lnew
  end.

  'lines appended: transactions, inputs, outputs -> ',":lout

else.
  'no files matching pattern: ',y
end.
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
  smoutput 'csv output files reset'
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
1,q382)$..+>GSn2)-4/1E\P0+>t>t1a"M-+>Y\o0fC.01*A;-+>khq0ea_+0d&22+>u/$1,9t.
1*A;*+>c#"0fU:53?U(9+>l,$1,U112BXe2+>l&"0fL430d&2-+>ktu0esk+3$9q0+>Y\o0f1".
2]sh3+>bnt1,C%.2]t%%1c-=01E\D4+>GSn1GBq+0d&8/+>Get1,g=30d&>3+>Gbs1Gp:01E\J0
+>PYo1c-=03$9t6+>Gbs1,C%-0H`,/+>G_r1GU(1+>l)#1E\J.+?1K"2BXk"1H-F4+>c&#1E\J3
+>P&o3?U.$1,L+1+>Pbr1a"P/+>k8s3$9q2+>Ynu2]sn2+?:Q#1E\\#1G^.1+>bo@A8YpDA7T^l
F)sZ^FCT6'DBN@uA9)7&F!,(5EZdYc@;L48AKZ).AKXBLFC?;0Dfd+DBOr;SEbT].CdE/b@:NtM
Ea`j,@:OCnDf/*SF(f-+@<?U"@q[!,Ea`j,@:OCnDf-\2@<6*)FDi:9DIdI)Bk2?pC`mG0E-68D
05kuPF`_[k5uU303'q>$@rH(!+C\c#AKWii+CT)*BOP@]F@'DWAMlG7BOt[h6>:OODeX)3@UX=h
+>l,$@:WnhATMo8AoD^,@<=hEF(I3g6YL%@CJA_XASc4%A7]R"6=FqH2)ms:ARfKuG%G]'6=FqH
2)o2g94`B,2)[<7@X3',+E2I4Ch[B%6>:OODeX)3CLqc6@X3',F!,RC+C\c#AKWii+D,P4D..NQ
Blls8;e:&nE+ENlBl7K)G%#E*Dfp+D@VKpoDeX)BC1JH)Dfor=6YL%@CIN)LARo=_A4(9PD..K?
+DGF1FD,6+AKYE%AKYl/+=A]f+Cf(nEa`I"ATDi7Bl5%;/M/.hEHQ2AARlp)FE2)5B6,1L+E)@8
ATE!/F(I^]FB!9hDKB5rFD5Z2;e9TYASuU2@s)m7+@B(.+D,>(AKYMlFC?;+DKKe>F(K!$ASuU2
6tL7YD.7's8PaA<D/XT/+Du==ATD3qF!,(8Df$V2DK'`?05kuTE-67FF(Jj'Bl@l3DIIBnF%'2-
:Jt.Z;cZ:X;FNrP:Jt>+Bl[cpFDl2F+D>\0A8,po+CfJ9+D,>(ATJu,ASu("@<?'k+C]U=-t7"2
@r#Rf@;0U;1bN?aALU,\DImm'F$a\]@r"GF@;KakDJ*NZ@rc:&FCo6-F*&NkBlmj'Bl5&'BOP^n
ASu-l+EM%5BlJ/:/KePADKK<$DK?ph6UXj=+E2I4Ch[B%CLqc]ASu(#BlcUWDe!QYF`_SFF?sGJ
Eb0<5Anc:,F<EnaFCT6'DBNCsF(HIO3$<-^FDuAE+CSekEb0<58Oc!579<8_6rQj!Ec#6$BmO>W
Ci<g!6YKnBDF7?'Bl8$(Eb8`iAKZ28Eb'56-qQlo6Ub'P;FFGYDfT]'Ch\3,6>URMCI;cDBl6::
<[f/(Ec6)>8Oc!579<8_6rS/JChR6uBPD@+ATDBk@q?d,DfTB0+=KfN5sn(B:JsSZF)u/2@<6*2
+D5_5F`9oI5t4gB;F=5R<D?4eFE1f-F(&R#Bl@l3BOPsqATJu&FECr$BOt]s@:jUmEZf(6E-67U
Dfp/@F`\a9DesQ5DKABE:fUI^:J=b_:/bkEE-67F@rH1+D/LJ6@;TRs8PW)^<)Z7X9LWi;Ec#6$
BmO?$+EVX4DKB5rFD5Z2F!,17E-68D8T&]_Ecb5kB5M3tFE;/6G%G]9+Cno&@3B9%+CfJ9+EM+,
D.RU,F%Shf;cZ:X;FNrP:Jt>/Ders*+DG_:ATDm(A0=K4+C]/*@r#Rf@;0U%@rlf9Bl7m4F<G10
Ch7Z_DfT]'Ch\3,7<iciEcaZI<^pe>ATMa-Ec#6$BmO?3+@B(.+D#e:DfTqBAnc'mF&,V$:/b(b
:N0l_;c?@4@rH4'Bl%?k+C]&&@<-W9Anc'm3ZqsLCb-]MD_*#AH#.2(:K:@j<E)=]9N=e^;f?f#
E-67F@rH1+D/LJ6@;TRs:K:@j<E)md8PDQjDfT]'Ch\3,A0>u7@;^-p@ruF'DBNk?FDuAEF&-q#
E-68$FCB33F*(i2F<GL6+E)CEE-68D+DG^9Bl7m4FE9*RF`_SFFE:8eEcYe^ASu(#BlcUWDe!R%
@<-F#+@9da@rH(!+D58'ATMR,+C]/*@r"t<:K1Ck;FFGYDfT]'Ch\3,6>URMCI;cDBl6::<cW+s
F<GdGEb'56-rNi:<*)jn6rQj!Ec#6$BmO>WCi<g!6YKnBDF7?'.3N8DDfp"A+<VdL+Au!2<*)jn
6rS/JChR6uBQA$0F<GdGEb'56-rNi:<*)jn6rS/JChR6uBIP':Ec6)>;e9TYASuT\ART+\Eb961
D0$h1ASuF,D..6pH=^V0F(K!$ASuT4BOtU_ATC^\FA?apD..6pH=^VS;cZA%Ch7[/ATVu9Ap%p+
Gp%*L@;KXiBk:ftDJsQ4@;KY(ARlp%F`_SFF<G10Ch7Ze;F+&V5snUC:JO8Q9N=e^;fm%gDKB5r
FD5Z2F!+t2CisT4+DtV)ATLgK5u(?E6W?WQ:/aVR9LWi;Ec#6$BmO?$+EVX4DKB5rFD5Z2F&Z(,
7o3)P7S-^(Ea`j,@:OCnDf-\=AS5jkDKI"?Eb/isG[`Ni@q]F`CIW>RH$!V=6>:OODeX)3@UX=h
+>l,$@q]F`CER50Df$V+H$!V=@Pp,WA3t!P@rH(!+C\c#AKWii+D,Y4D'3D7FCf?#ARlooARfFk
@;I&<+EM+*+Dbt6B-:`'@s)X"DKK?"BOZ7/ATJu+Ec5e;BOuEL+Cf414Y@jdAnW;sCe/,^@rlg*
Ecb`!@rlf9@r*9"Ec5e;@WZ*r+>"^WAS!!#Df021A8bt#D.RU,A7f:.3+[>VASu$iA0>Do@qfdg
C`m>1Df$U`Blmj'Bl5&&@<6!&2)o,YBOk[aBl.9p+D,Y4D'3M'GT\R\F*2G@DfTr@+E_XBATAo%
DIal+Dg,c5+Cei$AS>[bBOuE2Ao_g,+C]V<ATKmT@r+\IGT].%+D>@r+Cf4SH$!V=Bea=>A7^!.
DfTQ)Bl5&3DIjr)/ord*2H*.41,Us4BOPsq+D,Y4D'2VnAStFF9QN'G1/g_02)-j/BOPsq+D,Y4
D'2VnAStFF9QOlU0iLV/0d(.<F(c\.Ec5e;:N0l_;c?A2E\TI+;Fs\R9ggQf2D?7e@<6*)Ao_g,
+AZrfDGsJ-F)u.q8PhiM6npSR-t?d:+CehrC`mY.+AZrfDGsJ-+Atd-7860%0fC^.BOPsqF)u/=
BONVD@q7#2@ps1i+E(j7:N0l_;c?@4;b02+0d(.<F(fW9Cia8u1,Us<@q7#2@ps1i+E(j7:N0l_
;c?@4;b02+1,Us4BOPsqF)u/=BONbQ1+6XC.3N,/Cht54AfslgAStFF9H[8)5qOrK1*C7=F(f`2
DKL&1EbSrkCh4`*ASu.&BHV#,FCf)rEZeh:FCcS)Dfor>+CT.u+Eh10F_(                ~>
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
2`Mp>+>Y,p1E\Fq2E!?61,L+/+>Gf62BXb0+>P&o3&3011,g=2+>PZ++>GVo1*A>40d&20+>P&o
2_['21,'h++>GQ,1E\Y"1*AM73C7.qAMlG7BOt[h6W5`t0/"G8,9UT@DI[d&Df-\0Ec5e;BQS?8
F#ks-B5)F//n\m?BQ[c:@rH3;6Z6LHF%L7:BOPh#0/G=A2*!TM%14aA%14aA+EM47GA1r-+D>\;
+EVNE@rH7.ATDl8FDi9g@<6!;3(%@j@r!3!DfT]'F:AQd$4R>]F^f0$@j#i7@<?3n+EMXFBl7Q+
7;cURA7[/uH$!V%>p*ZdFC?U-$@<3h+:SYa0/"G9ARfXhAKYH-FCeZ^+EVNE6>:((DKKH&ATA4e
#sr?=8T&W]B4Z*+Bl8#\@<>p#4WlF?%13DRDfQsKBl8#8BcoP]0KUCk+?UcW@<>p19P&*SFD*`Y
Be(\_%13Dg%13CJBl8#\@<>p#4WnHVF@9PZ@3@$B1,Us4.j/A2FCABf>rrK&$%36i+:SYa0/"G:
DI[TqAKX<RB1Zu_AS5Rp+EVNE6=FqH2)l_"FE2)5B+51SF*)G:DJ()4ATN!1F<E^h+sK)X$41oi
Bl%?'-u!R@6t(1G+?go%.1HUjHOU;g$#+:!+ED%1@;0UiATAnV+=LrAF=AVPDKJ9TFC?:<+>l,-
3t2N'$#+:!6t(1G+>5l#2)mZ,$4.#ZATN!1F<E^h6tp:JFE:Z,ASkjiDId=!>p(X?Eb0<7Cih`J
$42+i$6Tcb#qmqS6#^dSDIakt0jl,9DfQt3@:NsnCh7$cBl7Q+0HahMFCbmg$"e*r+=LrAF<G9?
4WlF?+DDr\+Cno&@4k5bDJ+')+=8EXA79Rg>A7@c4ZsoA4!85f.k(o7$%!*g#mkW`F*2;@+?^hp
0de(o+ED%7F_l.]%13Di%13D^ATW'8DBNt2F*2;@3t2OF%144E@<6!;3)ap-@r"k`ATDC!Dg+rp
FCfMK2,8(3ATJu4DBLhp+C]V<AKYr7@Vfag+DYP6F!,RC+C\c#AKWii+D,Y4D)r+5%16cjFDs8o
06;5D@r$"+ATDC!Dg*gDDf%.IF_,W9Bl@m10/5IB1G^^B1G<EMF(f9*B.[_9Df%(7/T>iACh[B2
CLqcCFDia>/RiF9@rH(!/R`1#Eb0<5/ST)SE+j2"$4R=O$:u@KD'3q@H"h//+EVNEAoDL%Dg*=G
BOr<#DKBo?F^oN-Df0V=Eb065Bl[cq+EVNEFEMVA+CQBN2'?@RFCcS6F^f0$@iu3fCLqc6Bl8$2
+CQC%Blmj'Bl5&%A7T^lF)rIHF(oN)+E2"5/g+,,AKY])F*)GF@ruF'DK?q/Eb-A5F_Pr/+D#e:
Ch[BnF=n[F$:A6>+CT/5Df0,/BOu"!+Dk[4GA2/4+EV:.+E2@0@ruEp@;KY"Gp%$;+CoD)DJ()6
BOQ!*Bl5&4BQ-0F$4R>6DKBo?F^oN-Df0V=@<,og$4R=s+>"^8@;BEsFD,5.@rHC.ATMg/DIdI!
B-;/9@Vfag+DYP6+D58'ATD4$ARlp-Bln#2BlkIG2DlUdH$!V=/0HYi@X3',+>A$o1b9aY$8XF[
@X3',F!+t2EcP`4E,TW)Bl7Q+FDi:(+Cf>.Eb&m%@<?'3+>Ybq@X3',F!+t2EcP`4E,TW)Bl7Q+
FDi:)+Cf>.Eb&m%@<?'0%13OO0JkX@3&WQY6oHkf3&a,l3'f;h76!(j0gS8`5r^\T1IFJd1Ia5X
75Qt^6o[%Y0gn;q3'f5T3&iic2*s&S2)6pS6o6hV1,LdD2)@NR3B9Pp3CPkc1,CjJ0fCa?1I4>p
0eksK6q/sl3&NQ^6oILi77Apj2ao_o2)m?X5rK/Z%14j5/Kdl$Eb961D'2bJ5qOiL2BZ[AF(f9*
B-;,1+EV:.+E2I4Ch[B%CLqc#$4R>#0JGsc75QbT68V+b0K1dB5rCY[2)dfY6UO-r2FBhd3&<QO
1bh!F0JGC@1,M9R1cI`h68Cqh3(,Si1b^lu$4R=u+>"^4ATDC$Ebups8PhiM6nL,O0Hb%;F(f9*
B-;,1+EV:.+ED%7F_l.BDe:+j83ng_2)YmN%14dD0KD$L2`EWK0K(pK1IO)X2E*HK3CPeo1H@oa
2F0#b1,h!U77@Xm%14p7/Kd>iA0?&,EcYr5DBND6FCcS/DBNP3Df0Y>De:+i8PhiM6nL,O0Hb%;
F(c[E0R,9*+D,P4+AH9YDBM\cFE_YDCFK]"%14dC0JP7A2E!KQ2D?gC3AiT\2)R9N1c%-\2+9;]
7Q<:l0LRZT1I=N!%13OO2'=In:h=ZZDfT\;;b02+1,Us4BOPsq+E)-?FD,5.AU&<.DId<h+Atd-
7860%0fC^.Eb0<7Cig*n%14pK2+';g3&!$F5rg_h3&`WL0fV-J3&j5k1GUXM3(?=l6q'F11-n>`
68UVj0LdoR6:3I]6:"%"1c7WS3A_0P%15!9/Kdl$Eb961D'2bJ5qOiL2BZ[AF(c\7DBO%7AKZ#)
F*2;@+E(j7FD,5.E,oN5BlA-8+B(fs/M]1A+D>2)BFP:X$:Hd,3Arfc2D[]Z6prah1H@0H5r:kr
1c7$U3CYnm6o@@h2DRWg1INuW2`E`V0K1jU0ebOE0f;<Q5r_.d0F\?u$9'(Z+B2cbAKZ).AKYT!
EcZ=F1a$7QFCfM9De:,6BOr<-ARfXrA0=fA5qOiL2BZ[AF(d0K<+oue+DGm>FD,5.@:WnhATMo8
@q]F`CNFW8%13OO6oHb[2E+)`%13OO3$9dq6"FLKFD,5.1a$:AARfLsF_r71H$!V=+D,Y4D'3e9
Bl8#82]uON+EV:.+D#G$+E(j7AU&<.DId<h+Atd-7860%0fC^.BOPsq+D,Y4D'3e9Bl8#81bKnM
BPDN1BlbD=BOr;A2(`9_FCcS(Bl7@"Gp#FfFCT6'DBM5UA9)7&F"Rn/%14dC0JP7A2E!KQ2D?gC
3AiT\2)R9N1c%-\2+9;]7Q<:l0LRZT1I=N!6oHb[2E+)`%13OO3?Tmr6Z6jcATDl8FD,5.Eb0<7
Cige3Ec5e;@3B$)FCcS9FE2)5B-:o+FDi:1+C\c#AMlFiF*)G:DJ()7F(oN)+@9LXAMlG7BOt[h
+D#G#De*R"B.b<+BPDN1BlbD=BOr<'Df^"C@rH4$Df0B:+E_a:A0=3QFCT6'DBM5UA9)7&F!,(5
Ec#6,%13OO0fE$U9M@HEBldc?;.`XE6</2%De;OW6;][c9lt,n9gWQ9@rH(!6>URMCK"_VASkjS
;+r`&;c-42F(8lpD.+Q!DfQt0Blmj'Bl5&&Ci<g!F!,(8Df%NE$4R>UFEDJC3\N.!Bln$2@P2//
D(fOBDf0*"CiqCIBjtOcFCT6'DCog=EbmC<Ci<c9D..L-ATBFjBlmj'Bl5Rl@<>pe@<6!5D0^2B
Cb9^<BOu$h/ou#K%13OO%15I#76smA+B1Wn9LU(5Ci<g!+=I[++<VdLBOPsq+Cf(nE[W_!.3N)6
DIIR2+E2@8D..I1+DYP6/.Dpq$6UH6+Eh=:F(oQ1+DG_8AS5Rp/.Dq/+<Ve?@<6*YEb0D:+Cf(n
E[W_!.3N)6DIIR2+Du+>+Du=<Cb-#&+<VdLBOPsq9kA?\Ch6L_Dfd+3BOPp01GUC%@VK^gEd8dF
Dfd+>F_kkF%144#+<YQ$Bl.E(Bl8$(B4Z*+F`)87B5V9k+Du+>+Du=<Cb-#&+<VdLDF/&ZF!,17
FCf)rEZfLBF(o9)ARlp$Dfd+>F_kkF%144#+<YPsDf0&r+<VdL+<YB9FCf)rEZfLBF(o9)ARlp$
Dfd+>F_kkF%13OO+<VdLGAhM;+D,G.@<<V7+E_RCBkM<pA1S/s+<VdLA7]_%BHV#,FCf)rEZfLB
F(o9)ARm>$$4R=b+<VeBAU,CHBOPsq9kA?\Ch6L_DfdEZ%144#+<YH2Gp"MK@<6*YEb0DC%144#
+<YH2Gp"MGAT2a).1HV53t2N+$:@][5u^8q<'`iE73H\m@;^-p@ruF'DBL>:$6UH6+D>2)BHUeu
@<*bP1+=>TBl7@"Gp%'HBl.:!Gp$m6Gq9C3+<VdLG%G]8Bl@l3Bl8$(B4Z*7%144#+<YK=@r#%X
D.Oi(DKKH&ATAo9DKBN)DIm?0%144#+<Y04Bl7BgF(HJ'Df9H'@;ZM].6@tG%15I#76smA+B1Wn
9LU'uATDR&ARBP"ARuu4%144#+<Y]CDfd+3BOPp01GUC%F`)87B5V9k+Du+>+Du=<Cb-#&+<VdL
Bk2H2+DG_8AS5Rp+E_RCBkM<pA1S/s+<VdLE,oZ0@<-W9CLqc6-us6EF=\PKA9]OS%144#+<YH2
Gp"MUDf9_H%14OG%13OO6W-?=<(.p18OZ]'G%kN3?Xdhi@r!2Q;[j(478--;<$2VW84?W/BOPsq
.3N&?+D>2)BIjT"G%G]8Bl@l?%15Wp==@ikF(eBjATfLF@<3Q)@<6*YEb0DF%15Wp==@ikF(e9Z
EbfK&;K$Jq.3N&?+D>2)BME&YCM[Q[Df9_K%16uPBl.E4%16u>BlnDI%16uJDf0&r/.Dr1DfTVE
%16WWE-,b&$:[oh9d!n]De!QE%13OO%15C=DffZ(EZf1,H#IhI+D,Y4D)r+5%16cjFDu:^0/$dK
FCT6'DKK<'CG'OGB.mt:A7^!<E+j2TFDl,4@m)\'1c76F0F\?u$:@][5u^8q<'`iE73H&UDe!R(
+=J?A$><jhBHTZ55uK*e1+=>@:K/H3<D6(/6VgHU<)Q"R:/i?FCi<g!F'im%+Abs-9gMZ[+A5.+
/.DqrBOPUm=)W+p+@8at66K$!<$4q99M?uH$>=!bB4uB06:j[=:/i?2:K/H3<D6(;%16c[@:Wqi
+@8at66K$!<$4q99M?ls%13OO6W-?=<(.p/5se76+EM+9FD5W*F!)kR%16u]D.Ohj5uL'@5uK*e
1+=>@:K/H3<D6(/6VgHU<)Q"R:/i?WATW$.DJ+#tE,-Rm;FsSK;HY,879M/N$?fioF_)[^9M[u(
3t2N+$:@][5u^8q<'`iE73H\m@;^-p@ruF'DK?pK+:SZk@<6*)<(0ng+AP^3+APp19HZ\u:/b+i
5tOgN+EVX4DKB5rFD5Z2F'im%+Abs-9gMZ[+A5.+/.Dr0ATAnb:/jYP78b7':K/H3<D6(;%178m
DI7I2+A#=-77TdE+AP^3+APp19IpV[G&MMF?ZUN98PW5R7n$;u:/=h3:/st]/.Dr&De!QiFD5T'
+A#=-77TdE+AP^3+APp19IpV[F(or3+A#=-77TdE+AP^3+APp19IW%4$4R>0;FNlN73GPq6;0fj
FE1f-F(&R#Bl@m1?YOCsF`\`S+:SZk@<6*hE+*cuDKK6-GT]sS=B$D<:K/H3<D6(;%17/dEbTK7
?ZTpo+B1d3<$4q3<$4q99M?ls%13OO6W-?=<(.p/5se76+EVX4DKB5rFD5Z2F'ij.FDuAE+=J?A
$><jhBO>^eEb0-1?Z^N8<(0ng+AP^3+APp19IpV[G%#30AKXl>5tiCr:K/H3<D6(;%17/dEbTK7
?Z:-s?Ya4u+B1d3<$4q3<$4q99M?ls:et"h?VYN[D..6pH=]EZDe!QMBOPUm6W7#@0ht%f:et"h
?VYN[D..6pH=]EZDe!QMBOPUm6W7#.E,Tf>+E2@>@qB_&DfQs0$4R>`D/XQ=E-67F0H`D!0F\@a
67sBpDKKH1Amo1\+EqaEA12LJ3XlEk67sB'+AQiqD..6pH=]NiE,Tc=6W7#TBl%@%+<XEG/g,%M
Ec#6$BmO?3+@B(.+D#e:DfTqBAnc'mEt&I*%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH
-VeT#D..6pH=]EZDe!QMBOPUm6W7#5:et"h?ZU:)BOPsq1,2Nj/l5>B<*s]fChR6uBHV84F*&OD
Ec5H!F)u8?+:SYe$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+<VeJ
1,Us4+<XEG/g+(`5r(;U+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+<Y__0esjo+AP6U+B(fs2)-j/
BOPsq+D,Y4D'2VnAStFF9FV>(67sB'+EM4)0d%S]:-pQU;b02/+D>2)BHUo-Df$UmE+Noc;bRW-
:-pQU+<Y`G0fC^.+AP6U+Atd-7860%0fC^.BOPsq+D,Y4D'2VnAStFF9FV=X%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`Bl8!'Ec`EH-Za?FBOPsq-Y7.'Bl$USF(8Wp8mudXBl5[`ASkjiC`mS+F)tc&
AKYT*Df$Uh+E2@>EbBE$D/F!)B-:f)Ecl4AF*2,.ATMs-DJ(($$>=@%+EVNEBl8*4CLnVd8PhiM
6nL,O0Hb%;F(c\+De*E%Ao_g,+A*(M%13OO:gnET@;I&Y@<6:"DC6QMBji,\Ec5T2@;TjqDJ'Cc
8p,"o1,U1&1E^4:H#k*:B5]4.$4R>aD]j">DeF*!D/F!)B-7Wj=`8F*@ps6t@q]:gB4W3-BOr<-
F)5e<4ZX^%Bl7K)Bl5&.3&!*1FDi:@DeX*2+EVNE@VK^4+<XI%BOu4.Bldi.FD,B0+Dtb%A9/l3
E+Np.F)2sI8K`+gBl7]/@;L-rH#k*:G%#*$@:F%a+E)-?Ch[d0GT^F4A0>_t@jrNC;Fs\R9gg]o
0Hb(N+CehrCh7-"FD,]5F_>A1F)iun0HatMDI[d&Df.0:$4R>9Bju*kEd8dAF!,('F*(u6+EV:*
DBO.;DId[0F!+q7Bl%l6Bl5&(Ci"/%$4R>_AT;j,Eb-@@A8H'0%15is/g,1GEHPu9AKW@ABOPpl
F!hD(F)u/:+?_b.8OccQ:*=Li@r!2706M>V05P?30./h/6onRKE+Noc;bScEBl5gc>[hDb>UKsf
:-pQU:JaJT;c?@44ZX^#E+*j%+=DVZH#n(=D(fsOCh7%#1GURnCht4A%15is/l,;4:/b(b+?_b.
F)u/:+=nW_>]Xt&ARTj?1+m*RC`k)7$;XJe:/b(b+?_b.F)u/:+=nW`8Oc9I;]mS5-p'I4-Wb#"
+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J.3NSD@r!27Ch[?i@<jXa/nAd7+=B5n
-o)nj+?V#fBju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.MA9i!*@N[$I%15is/l,;4:/b(b+?_b.
F)u/:+=nW`8Oc9I;]mS5-p'I4-Wb#"+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J
.3NSD@r!27Ch[?i@<jXa/nAd7+=B5n-o)nj+?V#fBju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.M
0J5@<3%e`eCh[?$-RfK3;c?@Y+?_b.F)u/:+=nW_>]4RmDKBl8-OgE(F)2s^3Zp."3Zodu:JaJT
;c?@4/0JdY-=^R6%16!36"4PMF!*V,+>u%c$;segE((m43Zp4$>p)$_2)@0#$?L9)F(eu;2)ZR?
3Zodm;b0202)ZRk+=^kDC`k3;-QmJOC^g_mF)5o2@5Tbp+?_b.-Ql>Y5rCAP+DDrJ@j#S1.UshK
F)u.,$?L9)F(eu:+?_b.-Ql>Y5qsKr+=^kDC`k3;-QmJOC^g_mF)4`G:dn)H0fC^.4ZX]5+Atd-
7860)2D?7f+=^kDC`k3;-QmJOC^g_mE\TI+4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V-OgE(
F)4`G:dn)H0fC^..![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$?Klh0d&V?+>Y-$+>=63Dfp/@
F`]c-+=K!!.3KiX-QjcG$?L9)F(eu:+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%17/60esk7
3Zp4$3Zp*c$?('/E-67c3Zoh/1asOl+=A9Z%17/tCia8u2)-j/.![7'-mKj[.6DHjFDuAE%17#r
FDuAE%14Nn$?Is[2BY.D+>Y-$+>=63Dfp/@F`]c-+=K$$.3KiX-QjcG$?L9)F(eu;2)ZR*Gptg'
,9V7\4)]7`E-673$?('/E-673$7QDk/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=7W3;iBl7O$Ec#6,Bl@l3@:F.tF<F0u
AoD^4D0$h@ARuutFEDI_0/%NnG:mWODe=*8@<,p3@rH3;AoD^4D0%=CFDVHo%14[=/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15RCEZf(6AoD^,@<?4%DBN@sDfp.E8g%_aEcl5?+EM+*+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2
D(fL>Ecl5?/nf?DAU%X#E,9)`8PhiM6npSR87?RQ1,04FEb065Bl[c--Y.%0-OgCl$;No?+E1b2
BHV#1+DkOsBPD?q+EML5@qfOh@j!?GD.-pfBl7K)D09oA+C\n)2DcOcBlkI,$?L9)E$.;)+A#%(
8PUCIBk(p$-SKU`E\D6C@P9)j-UTq"C,RnRC,Rn#3&!*m@VK^b-OgCl$;XJe:/b(b+?_b.F)u/:
+=nW`8Oc9I;]mS5-p'I4-Wb#"+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J.3NSD
@r!27Ch[?i@<jXa/nAd7+=B5n-o)nj+?V#fBju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.MA9i!*
@N[$I%13OO:-pQU;c?@Y+?_b.F)u/:+=nW_>]4RmDKBl8-OgCl$?L9)+?_b.0d&M"-R_be78?c[
9HYl/D(-fAA1%fn;H#kjBlnD=4ZX]D1^sdi;aG@k+?_b.1E]sG2Dm?J2[p+8F)5o2@59\u+?_b.
-Ql>Y5r(;U+DDrJ@j#S1.UshKF)u.,$?L9)F(eu>0esk73Zodm;b0230eskc+=^kDC`k3;-QmJO
C^g_mF)5o2@5/lf3Zodm;b02/+DDrJ@j#S1.UshKF)u.,$?L9);Fs\R9gg]o0H`M>+=A:08PhiM
6npSR+DDrJ@j#S1.UshKF)u.,$4R>`E\TI+4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V-OgE(
F)4`G:dn)H0fC^..![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$4R>`BONV<4ZX]A+?CW!%17#r
FDuAE4ZX]61,(.",9S?V-OgE(F)5o2@5/lQGptg',9V7\4)]7`E-673$?('/E-673$7QDk%17/6
0esk73Zp4$3Zp*c$?('/E-67c3Zoh/1asOl+=A9Z%17/tCia8u2)-j/.![7'-mKj[.6DHjFDuAE
%17#rFDuAE%14Nn$4R>`1,Us44ZX]A+?CW!%17#rFDuAE4ZX]61GUC%,9S?V-OgE(F)5o2@59\u
+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%13OO%16c[G\CN,BHTH!+=J@:3Zot=3bW,9+CQm:
/mTnk3XlE*$;No?+EV19F<G7*F(c\?Bln#2AoDL%Dg,o5B-:o!ASuU(FEn<&%144*A2#cM3AFu!
3B&[&0Jm5s3&r]P1hAIT3G($$2I\LT2*!TNAi;DV-Qk!%+EVO<Dg,c5+EMQX2D?7eAU%lsF(c[D
B5\o$BOtU_+D>2)BHV/;+Cno++>"^M+CT+0AU&0*@ruF&B-:V*1,'h[H$!U?BOPsq-OgCl$?1$#
6>:O66o$Jl67sa,Eb[pTF@nqDF"Jsd6>:O66m-GhDe`inF<GX9FEMOFF(96)E-*]A$;No?+:SZQ
67sBWEb02uEaa'(Df0V=AoD]48g$`KCj@-Y1bCI?/0H]%0f1"_Df0/uEb0,uAKYr4ATMF#FCB9*
Df.0:$;No?%15is/g+/8Bl7Q+FD,5.8jje4@<>pe@<6!&@:WneDBO%>+CT.rCjC><+@9da@rH(!
+C]/*@r!2t@<>p1%15is/e&._67sC(ATD6gFD5SQ%15is/g(T1:-pQU+<WB]EbupHE,o\[Blls8
-QlV9De'tP3[\BNFD>>/F`_>6F!i)7+>Y-YA0<6I%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f3WfDDEsV$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>G]fF`&ri+EMX5Ec`FJ
DfTV9Df-\:Eb0<'DKK</Bl@ku$4R=O$;No?+DkP&AM7V>ARfk)AKZ&*FEMO3$;No?+DPh*B4#@f
De*2t4ZX]56>:O66rRZ=F`8];$?L'&F`_SFF<GC4+=BKiF@nr"ATW'6-OgDLBlls8;e:&nE$-hD
$4R>;67sBiBlmj'Bl5&&Ci<g!+C]A&@;BFp+D5_5F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls8
6>URMCI3&Q@;BFp-OgCl$;No?+C]&,@rH(!+A,$EB6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKi
F@nqK%13OO:-pQUA9Da.+D,>(AKYl/Ec#6$BmO?2%16igA7o7`C2[Wi4ZX]5:2b/i@;KY(AO:3O
@r"GF@;0UH;cY7T$4R=O$?L'&F`_SFF<DqtBlmj'Bl5Rr6m-GhATMF#FCB9*Df-\:Ec5](@rri7
ATW'6/gg                                                                  ~>
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
zz=:zz,'nsactionSegments DenumberIO EXPORTCSVDIRECTORY IFACEWORDSNormalizeB'
zz=:zz,'lockChainCSV INAFTERCOLUMNS INPUTCOLUMNS INPUTSFILE InvertSegments '
zz=:zz,'JDCSVDIRECTORY LF NormalizeExportCSVFiles OUTPUTCOLUMNS OUTPUTSFILE'
zz=:zz,' OutputStart ROOTWORDSNormalizeBlockChainCSV SegmentHeader SetNorma'
zz=:zz,'lizedCSVFiles TAB TRANSACTIONCOLUMNS TRANSACTIONSFILE TSEGPREFIX as'
zz=:zz,'sert boxopen csvfrtab fappend fboxname ferase jtslash lastones read'
zz=:zz,' smoutput''),(<<;._1 '' ParseGenesisBlock Base58Check Base58frKey65 G'
zz=:zz,'enesisBlockChallengeScript GenesisBlockOutputAddress ParseGenesisBl'
zz=:zz,'ock assert b58fd bfh dfh hfd i1 ic read todate tsfrunixsecs vint''),'
zz=:zz,'<<;._1 '' sslhash IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash cd s256'
zz=:zz,' s512 sha1 sr160 sslRIPEMD160 sslsha1 sslsha256 sslsha512''         '
zz=:1063{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GL"/+>P&o0H`,22'=Y0+?)#8+>Get1,^p22]sh40JYt/F@nr"ATW'6:-pQ_6>:O66rRZ=F`8IE
/M/)dATW'6+EqaECM@[!+D#G6Bl\-0D.RU,+D,P4+@9da@rH(!01nVTE,ol3ARfg7%15is/e&._
67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F`&rk%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)l*C3=DL1a$FODfp"ADfTK!DJ=E.A0;<g:-pQU0f3WfCbRRdBOPsq+Eh=:@WNZ#
A7T7^+=M;PChR6uBIOAt%17,eEHPu9AKW@AF)5MuF(cp1$4R>;DfT]'Ch\3,6>URMCI;cDBl6::
<_bt6.Sao&D..6pH=]EZDe!QMBOPUm6W7#.F"JsdDJsQ4@;KY(AKX?=<ZkjfDe!QmBOPUm+D,>(
ATKI5$;No?%15is/g+,,BlbD<@rc:&F<GI>Ec#6$BmO?3+EV:.+C]/*@r#Rf@;0U%+Cno&@3B9%
+EV:.+=]!RF*8[:F_u(,$;No?+D,>(ATJu,ASu("@<?'k+C]U=+=L]8De!QmBOPUm2Dd$tG\&<H
+CT.u+Cf>-F)Pl/A79RkF!)TIBOqV[:-pQUA79Rg+<Ve@DKKe>+<Yc>Eb/f)+<X9E+<Ve;@<>pe
@<6!&+<YTCBk;1(ARlo++Dbt)A0<!;Anc'mEt&IO67sB/FE1f-F(&R#Bl@m1/n8sG.4cSiBl7m4
FE9'EF*8uT@;]Tu-uX6ME-68D/n8sG.4u&::-pQB$;No?+Eh=:@UX@mD)reODfQt;DfTD3@:F.t
F<Du@Ci<g!@q]:bDDj=(AU%c8+EM+*%15is/e&._67sB'+D>k=E-"&n04Sp2AM.V6DeElt/n8g:
05rRRCi<g!@q]:bDD*UO$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gH$;No?+<Ve%DfT]'Ch\3,
7<iciEcaZI<^pe>ATJtG+Du+<D..6pH=_.?6W7#.AU&04Ec`F9Bl%@%%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F>C3=>H2%9mf67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB81hq/L
0K(%`Df0`0Ecbl'+Cf4rF)rI:Ec6)>%13OO@rGjn@<6K4-VeT#D..6pH=]EZDe!QMBOPUm6W7#5
:gnBcAOg<LATMR,6>URMCJI2K.SsPoF(IjQDImm'F$a\]@r!3./M/)3Blmj'Bl5&+ASu(#BlbD+
Ci<g!+Cf(r@r!2qDIal/@<-F#+D#e+D/a<&/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JPD!F_i`d%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l*C3=>H1E^+:A7]9oFDi::
@:O(o+ED%4Df]W7DfU+4$4R>_AT;j,Eb-@@F)u/2@<6*0%13OOF)u/2@<6*W67sa/F)5MuF(c\;
/M/)Y@<6*)@;KRpEbTW/D0$h3Ec5e;:N0l_;c?@B%15is/e&._67sBT@;BFq+<Yi9EbTH7F!)T=
@<6*)+CT)!DfTQ6BPhf5+CTG%Bl%3eCh4_3Bl5%9FD,5.+AZrfDGsJ-%15is/g+V;DIIR"ATJu.
DKBo.Ci!Zn+EqOABHV&0F<EOq0R+^KG%#*$@:F%a/g*W(Df$V*DBL'?EbT0#DII>j$;No?+Co&#
D]j+2EbTK7+C]U=:gnET@;I&Y@<6:"DBO.;FD)e*A867.FDYT,FE8R6Gp#FfCht4f@;RV+$;No?
%15is/g,=KEaiI!Bl,mRF(Jo*BQS?83\N.1GBYZXE+Np.F)3IIEb@$7$;No?+:SZQ67sBoFEDI_
0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeN:kF(8Wp8mudXBl5S&83nOW0JOk/6R=KA1*n\0@;]U%
1,)Ej2'k"3AoD]91,*odDId[0Et&IO67r]S:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQB$;No?
+<Y_\2)ZR"/Kdt_5r(;U+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EKCp1*@\k+B(fs2)-j/BOPsq
+D,Y4D'2VnAStFF9FV>(67sB'F(eu:+<W6Y;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EMQX
2D?7*+Atd-7860%0fC^.BOPsq+D,Y4D'2VnAStFF9FV>(67r]S:-pQU@rc-hFCeuD+>PW*1eMn.
1,o^M:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0f3WfDDNsh@q]:gB4YTrFDi:BF`&=?DBL_j+C]&,+EMgLFCf<1%15is
/g)l*C3=>H1E^+:A7]9oFDi::@:O(o+ED%4Df]W7DfU+4$4R>PDe!TlF)rHOF)u/2@<6*0%13OO
:-pQ_A7]^kDId<rFE7lu%15is/g,+RDe<^"AKW<BEb065Bl[c-GAhM4F!)VS.OdM5+A#$o:K&B-
7TW/V+A#$\1a#dn5tscjC2dU'BFP:X$;No?+Co;)06;%SE+*j%+DGm>D.-pfBl7K8Df[%BE+NNn
Anb`t/KeJCF*2>2F!,4;F<EOq0JXbbF!,17F*(i,Ch7,d$?L9)E'5fr4%VnC8PUCT+=AgbF)ipM
Bjr_C4)/_CFD)dEIU[#/0..29:JaJT;c?@Q3ZrKbCiCLJ+?LuC7S-BS+=eQ_4$"`jBl5%eBl8'<
+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tscs+F>4YCh[?i@<jXa/nAd7+=B5n-o)nj+?V#fBju.)
CbBdI+=AU"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$4R>;67sBj@;Ka&A8H&k$=dU03\`K83\V!M
%17/tCia8u1,UsQ3ZoOf+=L#^78?c[9HYl/4%Vn"1j^Sm;b0202)ZR@+=eRZ+=^kDGT\JG-T`[u
;b0202)ZRk+=^kDC`k3;-RgBPA.8leF)5o2@5Tbp4ZX].+<W(.:dn,X;bS;b+?N.a2Dfb.+B(fs
2)-j/4s2?uGT\JG+F#"Y@ja>c+B(fs2)-j/Bcnm8+D`/M@j`]P@q6#UF)u/=BONVY3ZoOf+<VdT
:JaJT;c?@4/0I#G7Q*)M-Ql>Y5qsKG+=eRZ+=^kDGT\JG-T`[u;b02/+DDrJ@j#S1.UshT-=^Qq
$?L9);Fs\R9gg]o0KhH>-r3Z.:/b(b+=nWs8ObTpHRBq68PhiM6npSR+?gnu+F#"Y@j$"=.Ushf
-Ql;Y:dn)H0fC^.Bcnm8+D`/M@j`]P@q6#U%15is/h1FMA7T7jASu$iDKKq/$3            ~>
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
