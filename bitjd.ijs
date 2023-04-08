NB. sha256:9d81d9fbe57a5048716a0bbf582b8436a6f7874f1ddc48d15e35d745534449a9
NB. JOD dictionary dump: 08 Apr 2023 10:56:23
NB. Generated with JOD version; 1.0.25; 14; 04 Apr 2023 09:24:10
NB. J version: j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1
NB. JOD put dictionary path: /bitjd/utils
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

INPUTCOLUMNS=:<;._1 ' InputAmount InputHash TransactionHash TransactionFkey InputKey InputSequenceNumber InputSigFormat InputSigLength InputTransactionIndex'

INPUTSFILE=:'c:/bitjddata/jdcsv/inputs.csv'

JDCSVDIRECTORY=:'c:/bitjddata/jdcsv/'

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

OUTPUTCOLUMNS=:<;._1 ' OutputKey TransactionHash TransactionFkey OutputKeyFormat OutputScriptLength OutputValue'

OUTPUTSFILE=:'c:/bitjddata/jdcsv/outputs.csv'

ROOTWORDSNormalizeBlockChainCSV=:<;._1 ' IFACEWORDSNormalizeBlockChainCSV NormalizeExportCSVFiles ROOTWORDSNormalizeBlockChainCSV'

ROOTWORDSsslhash=:<;._1 ' IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash s256 s512 sha1 sr160'

TRANSACTIONCOLUMNS=:<;._1 ' BlockNumber BlockTime TransactionHash TransactionSize TransactionVersionNumber InputCount OutputCount TransactionFkey'

TRANSACTIONSFILE=:'c:/bitjddata/jdcsv/transactions.csv'

TSEGPREFIX=:'### BlockNumber,'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


AttachTransactionHashes=:4 : 0

NB.*AttachTransactionHashes  v--  attach transaction hash/key  to
NB. individual inputs/ouputs.
NB.
NB. When inputs and  outputs  are  normalized it's  necessary  to
NB. insert the  (TransactionHash) of the transaction inwhich they
NB. occur so the input and output  tables can be joined  with the
NB. transactions  table. An additional integer  (TransactionFkey)
NB. is inserted to provide an efficient JD reference for joins.
NB.
NB. dyad:  blbt =. b[3]cl AttachTransactionHashes blbt

NB. insert lists
bm=. (0&{"1 &.> y) e.&.> <INAFTERCOLUMNS
rp=. (>:@:(2&*)) &.> bm

NB. hash/key rows
rh=. (I. -. I.@firstone)&.> rp #&.>bm

NB. expand io tables for hash/key insertions
iot=. rp #&.> y
bm=. ;(#&> iot) {.&.> <1

NB. replicate hash/key
ths=. ,/ (-:@#&> rh) # x

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

NB.*CheckEmbeddedCommas v-- 1 if there  are no ','  characters in
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

InvertSegments=:4 : 0

NB.*InvertSegments v-- invert data in csv segments.
NB.
NB. This verb parses and inverts data in csv segments and appends
NB. to    three   JD   oriented   TAB   delimited   text    files
NB. (transactions.csv), (inputs.csv) and (outputs.csv)
NB.
NB. dyad:  ilOutnew =. ilOutlines InvertSegments blclSegments
NB.
NB.   csv=. read EXPORTCSVDIRECTORY,'EXPORT_2011_05_31.csv'
NB.   segs=. CutTransactionSegments csv
NB.
NB.   offset=. 1 SetNormalizedCSVFiles JDCSVDIRECTORY
NB.   (offset,0 0 0) InvertSegments segs

NB. offset & output lines appended
'offset otrn oipt oopt'=. x

NB. test for embedded ',' characters in " quoted text.
NB. I believe (blockchain64.exe) does not embed ','s
'embedded , characters in "..." strings' assert CheckEmbeddedCommas y
sgs=. y -.&.> '"'

NB. expected column counts
ntro=.  #TRANSACTIONCOLUMNS [ nipt=. #INPUTCOLUMNS [ nopt=. #OUTPUTCOLUMNS
ntr=. <:ntro

NB. column indexes as unique local nouns
('I' ,&.> INPUTCOLUMNS)=. i. #INPUTCOLUMNS
('O' ,&.> OUTPUTCOLUMNS)=. i. #OUTPUTCOLUMNS
('T' ,&.> TRANSACTIONCOLUMNS)=. i. #TRANSACTIONCOLUMNS

NB. null check columns
NB.  (*)=. IInputAmount IInputKey IInputSequenceNumber IInputSigFormat IInputSigLength IInputTransactionIndex
iptnulls=. IInputAmount,IInputKey,IInputSequenceNumber,IInputSigFormat,IInputSigLength,IInputTransactionIndex
NB.  (*)=. OOutputKey OOutputKeyFormat OOutputScriptLength OOutputValue
optnulls=. OOutputKey,OOutputKeyFormat,OOutputScriptLength,OOutputValue

NB. get longest segment header
head=. SegmentHeader sgs
iohead=. <ntr }. head

NB. cut lines drop headers
sgs=. }.&.> <;._2 &.> sgs

for_sg. sgs do.
  st=. <;._1 @  (','&,) &.> ;sg

  NB. first (ntr) positions to (transactions.csv)
  tr=. ntr {. &> st

  NB. if there are no transactions any inputs/outputs are orphans
  if. 0 = #tr=. tr #~ 0 < #&> 0 {"1 tr do. continue. end.

  NB. add integer key column and append
  tr=. tr ,. <"1 ": ,. offset + i.#tr
  offset=. offset + #tr
  'transaction column count mismatch' assert ntro = {:$tr
  (csvfrtab tr) fappend TRANSACTIONSFILE
  otrn=. otrn + #tr

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
  tr=. mask # tr

  NB. hashes/keys for inputs/outputs (*)=. TTransactionHash TTransactionFkey
  tr=. (;:'TransactionHash TransactionFkey') ,"1 (TTransactionHash,TTransactionFkey) {"1 tr
  tr=. 2 2&$"1 [ 0 2 1 3 {"1 tr

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

  NB. remove inputs with all nulls in select positions
  ipt=. >ipt
  if. 0 < #ipt=. ipt #~ -. *./"1 [ 0 = iptnulls {"1 #&> ipt do.
    'input column count mismatch' assert  nipt = {:$ipt
    (csvfrtab ipt) fappend INPUTSFILE
    oipt=. oipt + #ipt
  end.

  NB. remove outputs with all nulls in select positions
  opt=. >opt
  if. 0 < #opt=. opt #~ -. *./"1 [ 0 = optnulls {"1 #&> opt do.
    'output column count mismatch' assert nopt = {:$opt
    (csvfrtab opt) fappend OUTPUTSFILE
    oopt=. oopt + #opt
  end.
end.

offset,otrn,oipt,oopt
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

  lout=. (x SetNormalizedCSVFiles JDCSVDIRECTORY),0 0 0

  for_csv. files do.
    smoutput ;csv
    dat=. read ;csv
    dat=. CutTransactionSegments dat
    smoutput lout=. lout InvertSegments dat
  end.

  'offset, transactions, inputs, outputs -> ',":lout

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

NB.*SetNormalizedCSVFiles  v--  sets fully  qualified  normalized
NB. output files.
NB.
NB. monad:  iaOffset =. SetNormalizedCSVFiles clPath
NB.
NB.   SetNormalizedCSVFiles JDCSVDIRECTORY
NB.
NB. dyad:  iaOffset =. paReset SetNormalizedCSVFiles clPath
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
  offset=. 0
else.
  offset=. TransactionOffset TRANSACTIONSFILE
end.

offset
)

TransactionOffset=:3 : 0

NB.*TransactionOffset v-- returns transaction offset number.
NB.
NB. Reads  the end of  (transactions.csv)  and  finds the highest
NB. (TransactionFkey). One  beyond this value is the start of the
NB. next range of keys to be appended.
NB.
NB. monad:  iaOffset =. TransactionOffset clFile

NB. NIMP: max value of dumps for now
662088
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

fqry=:3 : 'rebc '' '' (I. y e. CRLF,TAB)} y'

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
1GCR,2)?@1+>GSn2)-4/1E\P0+>t>t1a"M-+>Y\o0fC.01*A;-+>khq0ea_+0d&22+>u/$1,9t.
1*AIt3$9q0+>c#"0fU:53?U(9+>l,$1,U112BXe2+>l&"0fL430d&2-+>ktu0esk+3$9q0+>Y\o
0f1".2]sh3+>bnt1,C%.2]t%%1c-=01E\D4+>GSn1GBq+0d&8/+>Get1,g=30d&>3+>Gbs1Gp:0
1E\J0+>PYo1c-=03$9t6+>Gbs1,C%-0H`,/+>Get1G^..2'=\1+>k9!2]sn!1GL"3+>Ynu2'=\6
+>Y,s3$:%#1,L+0+>Ynu1*A;3+>b2r1a"Ut1,L+1+>P\p2'=Y6+>GVo1H$@7+>Y_p3?U+6+?:Q#
1E\Ls1c.L/DIc%DA9)7&F$aS_@rH(!+CSekEb0<5+D,P4+@0mRCjC><+EV:.+@KX[@3BH+F<G[=
AKXB]Bm+'(6$.3W@q\h^@;^-p@ruF'DFe2WBOu6nFECr$BHVD;@;^-p@ruF'DBNV$F(c\<D]ib3
A8-4$A9D<s+DG_4F`_[XDfp#AFE9c7;aiQ'6>:OODeX)3@UX=h+>l,$@;Kmr@:Eei6=FqH2)ms:
ARfLBBlmj'Bl5&&@<6!&2)l^eA7T^lF)rI9DfT]'F@'DWAMlG7BOt[h9lFQRCi+*$AS`JU@<6!;
3(%@j@r!31ATD6H@<6!;3+d2(AU-0k2DlUdH$!U?E-5W+Bk&8PBlmj'Bl5&/AU,D-H$!V=+EVNE
@UX=h+>l,$AoD^,@<=hMF@nr"ATW'6A7]@eDIjr6@<-(#F`S[7Blmj'Bl5S=A0>c.F`)7fBOt[h
7;ZLFA7T7^6Z6gY@<4.GBkAK0BOu3q+CT;%+Du*?-S-Vf@q]:k@:OCjEcW@;DBL,T/Ku<WF`2A5
A0>r8EbTE(F!*.ZDffZ(Ed)5=AOCT^<,uDbF(&R#Bl@lfAS5jkDKKr0F`_[I6W7#.Anc'm+Cno&
@3B9%FDi:CAS5jkDKKqf8Ol?O;f6_pATD3qF$sSWF_tT!E_0&IASl@/AKYl5D.R`rCi^_2Ec5e;
Bl7m4F>%QTFDuAE+EM+(FD5Z2+DtV)ATL:B:estg6W7#R8Q%uE<)6CpA8-'q@ruX0Gp$d=Ch.6t
B-:]*Fs(C2Ch7Z1B4YslEaa'$A0>?,+=L]8De!QmBOPUm2Dd$tG\&<oASu(#BlcUWDe!QMBOP^n
ASu-l;e'i^E-,]+EcZ=F6>:OODeX)3@q]:eCh7KsAKZ&(EbTK7+>"^GDf0Z*Bl7u7770IA5p1,h
@Vfag+DYP67qHRLF(o\^Ci<g!:N^buF`]o[A9)7&F(T-,F*&NkBlmj'Bl5&&@<6!&2)l^sF`_SF
F<G"&A9)7&F%Jhe6Ub'P;FFGYDfT]'Ch\3,6>URMCI;cDBl6::<bZGnATDBk@q?d,DfTB0+=KfN
5sn(B:JsSZ:2b/i@;KY(AO:3O@r"GF@;0UH;cY=iB6%p5E(NMb6Ub'P;FFH)F)5MuF(f9*FCfK)
@:NjkGAhM4F!)l&7R9C1=&2^^;fd"rBOPsq.3N8DDfp"j:-h?K78cKK9N=e^;fm%gDKB5rFD5Z2
+D>2)BOu6-@<?U"@q]Fa+CSl(ATAo-DK'`?05kuTE-67F@rH1+D/ODd:/Fqi6VgBU9hnW$DK'`?
+Cf>+F_u"=DIIBnF%K,'<E)md8PDQjDfT]'Ch\3,A0>u7@;^-p@ruF'DK?q7DK'`?F%L7mATDlk
AS5jkDKKr6DK]T3F<G+&FC?;+DBNG1Fs(j;B5M3tFE:&B6W7#R8Q%uE<)6CpBQ%]tF!,17G%G]9
ARloU6m,rTDe!QmBOPUm+CfJ9+DG_4F`\a<Bl%@%:2b/i@;KY(AOUi_DfTqe;cZA%Ch7[*DfT]'
Ch\3,F!*hK<ZksuE,Tc=+D,>(ATLXD78?c[9M]V=DGsJ-+Cf>,E+s-"A0>>qDIIR2+D,>(ANCrE
ChtXFF)NTPA9i!*@S^!':fUI^:J=b_:/c(RFDuAE+Cf>+F_u"=DIIBnF&,e8:fUIn7S-9BDJsQ4
@;KY(ARlp*Ea`j,@:OCnDf-\9F`_SFFE:6#FDuAE;flGgFE;P4Ec`FBAfu#7FDuAEF!,17+DG_4
F`_[XDfp/@F`_\$@<-F#7qHRLF(o\^Ci<g!E+*d.AKX<RFCT6'DBNS'DImm'F!+q.De!Q\:JXqk
:JsSZ:2b/i@;KY(AO:3O@r"GF@;0UH;c[pWDfd+GDfTB0+=L,`:K1Ck;FFGYDfT]'Ch\3,6>URM
CI;cDBl6::<[f/(Ec6)>+<VdL+<XQX:K1Ck;FFH)F)5MuF(fT4Dfd+GDfTB0+=L,`:K1Ck;FFH)
F)5MuF(d!FB6%p5E)U=\D.RU,87c4?ATDC$Ec#k?A7]XsEc#6$BmO?$+EM+,D.RU,+D>=pA7]d[
ATU[cEc#6$BmO?$6W7#TBl%@%F(KH7+D,b4Cj@.CF^]*#Anbge+Du+<D..6pH=^V0Dfp/@F`\a<
Bl%@%<)Q"W;aEcM8P`)K:J=b_:/c7T@;^-p@ruF'DK?q1DesQ5DBNh*D.Rcf;F+&V5snUC:JOhX
8PDQjDfT]'Ch\3,A0>u7@;^-p@ruF'DKAcU77U0P77KjNFE1f-F(&R#Bl@l3F(K!$ASuT4E,oN%
Bm<Tt@;^-p@ruF'DGOkVF(KH6ATW'8DK?qBEa`j,@:OCnDf-\9AnH*qF<GIDD.7's@Pp,TBOt[h
7WMs`FCfM[Blmj'Bl5&&@<6!&2)l^gBOt[h+D,Y4D'3;5FCfN&2)o2Y6>:OODeX)3@UX=h+>l,$
Ao_g,+D#e>ASu$iA0>Do@qfdgC`k;PF(Jo*Ci=3(+CoD#F_t]-FCJiq@X3',F!,(8Df$V1AU$6Y
@r*8N/g+V8BHUf$87d$UF*;/9FCAWgF*8[9C`m>1Df$V+FCT,0/Kf+GAKYf-DJ()&De!p,ASuU#
An!VWAU&<.DId<h+Co%nBl.9p+D,Y4D'2/ZFCT6'DBNCsF(HIO3+QW7A7]7bD..6'Ao_g,+D>>2
+>"^WF`;;<Ecc@FF`;;2EZee.A0>],G@be;@psFiAoVj:F*(i.A79LhBmO>5EHPi5Gp$^;Ec#6,
BP(^eAU#>0Ec5e;@X3',F#kFRCe/,^+?_>"BP(]r@r+JWFCfN-0kkN9AU#>9EbT0#DBNk8AKY\>
F##U2;b0202)ZRj@<6*)Ao_g,+AZrfDGsJ-F#>[-;b0230eskb@<6*)Ao_g,+AZrfDGsJ-F(eu:
;b02/+D>2)BHUo-Df$UmE+Noc;bV7Q0fC^`8PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c?A2F)4`G
:dn)H0fC^6@q7#2@ps1i+E(j7:N0l_;c?@4;Fs\R9ggQf2D?7e@<6+'F)5o2@500?A18X2@;Ka&
De:+fE+Noc;bS<483ng^+D>2)BQJ62F(eu;2)ZjmA18X2@;Ka&De:+fE+Noc;bS<483ng_2)ZRj
@<6+'F)5o2@5Tbp-t?d:+CehrC`mY.+AZrfDGsJ-+B(fs/N#7<+D>2)BQe*-FEV)5BjkIeAKYf#
DJ+')+DG_8AS5Rp+C]V<AKYK$F`):D@;]TuG%#30AH                                ~>
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
3?U%!1*A;0+>PfGDK]T3FAla`D.RU,F"f:W@<6-m+A$HoATDlkAS5jkDKKqBFCfN8~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0et^20f'q.+>GYp1*AJ51E\G0+>P&o2`EW;1,'h++?;57+>PYo1*A;21,'h*3$9t!0f(aC+>P\p
1*A;.0Jjn-1*A=p0f1RC+>PYo1*A;,0fL412]sju1,1^10esk,+>Pr9+>Get1*A;10Jjn-0H`+n
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
2H=rp9K?!bF(7"'Al*J6<H_#RAk6c*;)`\nFD>tn6=FqL@mY!M@r"GF@;0UXFCB941,2Nj/h01r
F(o,NCi<g!6YKnBDGtXcFE8RG/M/)TDf'H9FCcS(@<6-m+C]/*@r#Rf@;0U%F*(i4BleB1@rj73
$4R>;67sC%FCB&t@<,mmH=\4=F_,T=+D,P4D..Mq$>+9uGs+2E+?CVmEb/]i+=ANZ-RU#b8M2-2
+D!/J6W-TI/6"o%.=E=a-OgCl$;No?+ED%1Dg#]5+Dl7;FD5]1AKYGu@;]k%+=L`5@<*K/DJXSI
%17,e@UhP^>p(A@+BplL/M8.n+<W$Y74o#V%15is/g,7E@VfTuCLqc6@rHL-FE7luC1JG7Eb/Zi
F!+t2F`):D<,uDbF(&R#Bl@l[@<6*)Ao_g,+EVXA-OgDtA0<7?ART+j+Cf>4DKI!mDK'`?87?RQ
+D,Y4D'3P3F=.M)C1JG7Eb/ZiF!+t2F`):D:N^buF`^8fGp$^>Df$V8E-*H:$4R>;67sBhG%W?K
D..Z?+Dkh1+C]&,@rH(!%16i\+=D2@@:XF%@<Q9+:N^buF`^YmCis;?+DkP3+A[-%E-68'@;L't
/0JeDDBM_tFDuAE<affeALns6Dfor>+A[-%E-68'@;L't+D,Y4D'3b9F=.M)C1JG7Eb/ZiF!+n7
B-9c`E-67gD/XQ7F=\PO@<`ndDK'`?6#CO_DKIEPD/!l18T&KiF?sb^F`):P+Cf>4DKI!mDK'`?
6#CO_DKI"5Ec5e;BlJ/A%13OO:-pQU@<?U"@q[!$@:EeaEt&IrEd9?%3Zr$SEd8c]+?CW!%17,e
@:XF%%144#+@10`+A[-%E-67`@<Q9+:N^buF`^YmCis;?+:SZ#+<XBeGT]e)FDuAE3c/;M+A[-%
E-68'@;L't/0GB/+<Ve$Bl5%hF`_SFF?48QDBM_tFDuAE<affeALnr5$6UH66Z7*bF?3oMF`):D
:N^buF`^YmCis;3%16]fDf$V8E-)Nr.1HW!A0>l4Gq][7%17)qGqhHC+D,V6Gp"d`3Zp*c$?B]d
A9/k&$6UH66$?l`8T&KiF?3iRB-9c`E-67gD/XQ7F=\OD$6UH69jr8h8T&KiF?48IGT]RqE-67g
D/XQ7F=\OD$6UH69keJf8T&KiF?48QDBMMgE-67gD/XQ7F=\OD$6UH66Z7*bF?3oMF`):D8T&Ki
F?sb^F`):DAo_g,+DGe:%14Nn$>O)oEH6=Z6>:OODeX)UCi<g!;e'KPD.-@?9JSJ(;+r*R@q]Fj
@3B0#EZeh*FCT6'DBND)De!R(+D,Y4D)r+5%16cjFDu:^0/$sPFD,f+/n8g:05#<DDIdHtFY@QF
@Ua%n@rH(!/T>9ACbK76DdkA:@<6O%E\BanFCT6'DD+CdFCAWeF(I"AH#mtA/TYE8ASkj.F)c"*
$4R=O$:@][5u^8q<'`iE73H&UDe!Q*-k-M++<Ve?@<6*)@q]:k-o3V-+C]&&@<-W9E,oZ0@<-W9
CLqcB%13OO+<VdLG%G]8Bl@l3Bl8$(B4Z*7%144#+<Y?+F(eBjATf1=@q]:k-o3V-+C]&&@<-W9
DJsV>DKTc3/.Dq/+<Ve?@<6*VATDR&AQ!GbF<G(,@<*bP1+=>TBl7@"Gp%!CF<GIDChtX3$6UH6
+Dt.mD.Oi(DKKH&ATAo9DKBN)DIm?$DJsV>DKTc3/.Dq/+<VeE6>:O_+DG_8AS5Rp+E_RCBkM<p
A0>c.F<GIDChtX3$6UH6+DsqmDI[6#+<VdL+DG_8AS5Rp+E_RCBkM<pA0>c.F<GIDChtX3$4R=b
+<VeNDfTV9Ao)BoF<D\KF`)87B5V9k/.Dq/+<Ve;AT2a)+DG_8AS5Rp+E_RCBkM<pA1S/s%144#
+<YH2Gp"MK@<6*VATDR&AQ!GbF=AaM$6UH6+DYP6+=Lo3F(eBjATfL3$6UH6+DYP6+=Lc3E-,bB
%14OG%13OO6W-?=<(.p/5se76+EVX4DKB5rFD5Z2+=I[++<VdLBOPsq+Cf(nE[W_!.3N)6DIIR2
+E2@8D..I1+DYP6/.Dq/+<VeMATDj+Df-\3DKKH&ATB=2$6UH6+Dbt+CK,"bAKY])FCf)rEZfLB
F(o9)ARm>$$6UH6+Cf>(DIR$qAKYH#DerunD@Hq%3t2N+$:@][5u^8q<'`iE73G<9EbfK&?Z^="
AKWB1$6UH6+EDC=F<G(,@<*bP1+=>gDKBN)DIm?$DJsV>DKTc3/.Dq/+<Ve@A9]4>Bl8$(B4Z*+
F`)87B5V9k/.Dq/+<VeGEbTB!Ed8dCAU,CHEc5l</0JY;GUY0Q$6UH6+DYP6+=M8KDfdE;$7S%G
$4R>0;FNlN73GW&79:UTBk;Kq@VfsmCEPoA%16$&9LV<J+:SZK79CsO@<6*2+CT=6BOPsq/.Dr0
ATDj+Df.*8$:mTf-tm%1BM`_\Ft"PBF!,.)F(eBjATfU6$:mTf-tm%1BME&YCM[Q[Df9_H+CT=6
BOPsq9kA?\Ch6L_DfdN>$>rgWD.P7-$>r1EFE8uB$>rUWDI[6/%17;tEbd38$=m^eFD)*j7T*#V
+C]/*@r".8$4R=O$:/QJFD,6++DbJ3Dfp.EAo_g,3XlE*$>=O'E-"&n04JX;@rH(!FCB!$/oPcC
055<7AU#hHBQ-1XDfBE#4Z+oM2)m3B%13OO6W-?=<(.p/5se76+C]/*@r$-.-m/s+BOPsq+@A[c
;CF=V.3MA]<$4q99M?Qr:JOhf;F*lL<$5XdDe!R(?Z9d':f9kZ5uLi.91;u7%16TY@;0U\DfTV9
6;10A+AP^3+APp19IpV[BOtmjBQP@`8Ol?I<$4q3<$4q99M?uH$>=!ZA7]d(6;10A+AP^3+APp1
9IW%4$4R>0;FNlN73GPq6;0fjF(KH8Bl7R)+=J?A$>s9hAKY#>;F<u@;CF=V.3MA]<$4q99M?Qr
:JOhf;F*lL<$66nFED57B6.F!CEQGO8PMKK=Wg@+=Y(!hG%#30AKX<5:I6Kl%13OO6W-?=<(.p/
5se76+EVX4DKB5rFD5Z2F!)kR%16cWF(c[q79EM3:/=h3:/st]+@Aq";cHX\8PW5-FE1f-F(&R#
Bl@m1?Z9d':f9kZ5uLi.91;u7%178iEZdqK<(0;G;BS_1<$4q99M?uH$?g-$?ZUN98PW5R7n$;u
:/=h3:/st]/.Dr0Dfp//F*\s#:/jYP78b7':K/H3<D6(;%16oi@r#FnBl.E(8PW5R7n$;u:/=h3
:/st]/.Dr-BmO>58PW5R7n$;u:/=h3:/st].6@tG%15I#76smA+B1Wn9LU(GEa`j,@:OCnDf0W'
Bl7m4F<DtS%16cWF(ep"@<,psFC0-7+B1d3<$4q3<$4q99M?uH$?K]tBlJ0$F(o80<(0ng+AP^3
+APp19IW%4$4R>0;FNlN73GPq6;0fjFE1f-F(&R#Bl@m1?Z1(/E-67F-m/s+BOPsq?Z9FoASuTs
FEep-79EM3:/=h3:/st]/.Dr0@;L't+AtWo9H[)+<$4q99M?uH$?K]tBlJ0$E-5VsCLqc6<(0ng
+AP^3+APp19IW%sDdd0K6pb^.@r"GF@;0UI68C8j67sBSDdd0!8jje2Ci<g!@q]:bDBNIuFCAWe
F(Hs5$4R>;67sC%FCB&t@<-(.ATJtd+E1b2BHUhsCh[a#FCfJ8FDi:GBl7I"GB4m9@:O(oCghBu
+:S[%Bl7luFD,`,E'660>ULjH-mpYq+A"1N3^"Tk.=EWS$4R>;67sC'F(HJ/A.8ldAT;j,Eb-@@
A79Rg05>#F%13OO:-pQU@r,^bEZee$D/!ks$>O*[A8Q$u+>=o\%13OO:-pQUF(K0!@rri(@N[6F
F(fK9+Dbt+@<?4%D@HqfA79"cBl8/<-Xpn1@r#Rf@;0U,%17/nDfp/@F`\a@A79"cBl5%@-OgCl
$;No?+CfJ9+DG\3DfTqBAoDKrATA4e6W7#T:J=/F;E[&`7QidT-[p/KD/_.CA1qG6Ft[<@De!Qm
BOPUm0..29%15is/g+\9Ch7^"+>./FFs(42A0<L7A7]@o+D,>(ATJ:fC1LjdCh7^"AoDKrATD-m
A7$HK%16i\@rc-hFCf'&Ch.*t?YX+Y+@[I_$4R>;67sBjDfBtEEaa/7A79Rg+EVNE@rlf9Bl.g-
Ec_`t69R@P-u*^0FD)dEIR7aj8jl'UFC?OG/151C@rlfH-OgE(BOu!r+=MGJDK'$+BQIa(+=DDD
DfBtE-S.S8-Y[I;F`_[[0JGL>@rlf@+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+
BQIa(+=DDDDfBtE-S.S8-Z=-LE-68D1,(CB/n8sG-Qjrf+=A9_C2dU'BHTbn/12PnF!hD(F(f-$
C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,/15O[@;^-p@ruF'DK@Qe0KCaqF*8o^-QjcfC2dU'BHTbn
/12PnF!hD(%15is/g+YBE-WR9DesQ5DBNJ$Aof(($?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic
67aKuDK'`?F##F'3A+fPAS-!2+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(
+=DDDDfBtE-S.S8-Z=-LE-68D1,(CB/n8F'Aof=B/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*
.!KBCE+*j%F(K;5-[9->E-WQR/4(m8FE1f-F(&R#Bl@m11,(CB/n8F'Aof=N-QjcfC2dU'BHTbn
/12PnF!hD(%15is/g+tK@:UL&Ea`j,@:OCnDf0V*$>O)o-Y.79E-,MtCh4`2Ec*6I+:SZmA0<70
F*;S7+>7bRGB4l\+EVX4DKB5rFD5Z2F##F'3A+f_Fs(mIDC6P9$4R>;67sBsDdd0!Bl7m4FE7lu
C1JG7A9)U-FCAWpAKY]+F=.M)C1JG7@rlg6A0<OGDg-7F0Hb(IE-68D1,(CB/n8sG+DGe:-OgCl
$;No?+Dbt)A0>f5FDuAEEt&IkA0<71Ec5o=@:F%a+E)4@-OgDtA0<70F*;S7+>7bRGB4l\+E)CE
E-68D1,(CB/n8sG+E)4@-Qij*%15is/g,4HF<GU8An?!oDI[7!+:SZmA0<7?AS,LoASu!h+EVXA
+B3AiDKB5rFD5Z27VcR\+DGe:+B3AiDKB5rFD5Z27VcR\-OgDtA0<7?AS,LoASu!h+EVXA+B3Ai
DKB5rFD5Z27VcR\+E)4@+B3AiDKB5rFD5Z27VcR\-OgCl$;No?+Dbt)A0>o(E,Tc=%17/nDfp/@
F`\a@A0<70F*;S8E,Tc=+>7=S%15dI@:Vtu7WiN`6>URMCI;cDBl6=*1,2Nj/h0P5@:Vtu7WiN`
6>URMCI;cDBl6=*+EK+d+Dbt)A0>\sEbAs(+A,$E@VfsmCL_$dBl5&(@<>pe@<6!4%13OO:-pQU
F*(i.A79LmH=_.?8g&(]FD)e-ASc'tBlmp,+EVNEGA1r*Dg-7F@UWb^F)59+BHR`kGA1r6@<?1(
AT0dn-X8#G-n$Gr-Qku55WV%N>q(1N%13OO:-pQUF`V+:C1Ib\Eb065Bl[c--Y-Y-@4uA+-OgCl
$;No?+Cf5!@<*K!A8Q$u%16i\@:X4hDBLVU+:SYe$;No?+CfG'@<?''A7?Z5+EM47G9C^?@psIn
Df-!kC1La`D/!m4+=CW7De!QpF_kkA%17/nDfp/@F`\a@A79"cBl5%@-OgCl$;No?+CfJ9+DG\3
DfTqBAoDKrATA4e6W7#T:J=/F;E[&`7QidT-[p/KD/_.CA1qG6Ft[<@De!QmBOPUm0..29%15is
/g+\9Ch7^"+>./FFs(42A0<L7A7]@o+D,>(ATJ:fC1LjdCh7^"AoDKrATD-mA7$HK%16i\@rc-h
FCf'&Ch.*t?YX+Y+@[I_$4R>;67sBjDfBtEEaa/7A79Rg+EVNE@rlf9Bl.g-Ec_`t69R@P-u*^0
FD)dEIR7aj8jl'UFC?OG/151C@rlfH-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-Y[I;
F`_[V@;Ka4@rlf@+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE
-S.S8-Z=-LE-68D/R`I3/n8sG-Qjrf+=A9_C2dU'BHTbn/12PnF!hD(F(f-$C`k-MBl7luFD,`,
E$-NQ@rH=3+=A^,/15O[@;^-p@ruF'DK@C<Cht_6F*8o^-QjcfC2dU'BHTbn/12PnF!hD(%15is
/g+YBE-WR9DesQ5DBNJ$Aof(($?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic67aKuDK'`?F"Lg:
CbB4.AS-!2+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8
-Z=-LE-68D/R`I3/n8F'Aof=B/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5
-[9->E-WQR/4(m8FE1f-F(&R#Bl@m1/R`I3/n8F'Aof=N-QjcfC2dU'BHTbn/12PnF!hD(%15is
/g+tK@:UL&Ea`j,@:OCnDf0V*$>O)o-Y.79E-,MtCh4`2Ec*6I+:SZmA0<70F*;S7+>7bRGB4l\
+EVX4DKB5rFD5Z2F"Lg:CbB4=Fs(mIDC6P9$4R>;67sBsDdd0!Bl7m4FE7luC1JG7A9)U-FCAWp
AKY]+F=.M)C1JG7@rlg6A0<OGDg-7F0Hb(IE-68D/R`I3/n8sG+DGe:-OgCl$;No?+Dbt)A0>f5
FDuAEEt&IkA0<71Ec5o=@:F%a+E)4@-OgDtA0<70F*;S7+>7bRGB4l\+E)CEE-68D/R`I3/n8sG
+E)4@-Qij*%15is/g,4HF<GU8An?!oDI[7!+:SZmA0<7?AS,LoASu!h+EVXA+B3AiDKB5rFD5Z2
7VcR\+DGe:+B3AiDKB5rFD5Z27VcR\-OgDtA0<7?AS,LoASu!h+EVXA+B3AiDKB5rFD5Z27VcR\
+E)4@+B3AiDKB5rFD5Z27VcR\-OgCl$;No?+Dbt)A0>o(E,Tc=%17/nDfp/@F`\a@A0<70F*;S8
E,Tc=+>7=S%15dI@:Vtu:gnBd6>URMCI;cDBl6=*1,2Nj/h0P5@:Vtu:gnBd6>URMCI;cDBl6=*
+EK+d+Dbt)A0>i"Ecc#(C`l><+C]/*@r#Rf@;0U%A79Rg@UX=h/e&-s$;No?+EMX5DId0rBmO?3
+A*bq@<?0*A7]RkD/"*'EZfIB+EqO;A8c[5+C\bhCNF<#F(c[*$?p3%E+*j%F(K;R3[\/[-7C8i
0..l6/jMH\+C-FE.1HUn$;No?+E_a:+DPEr$?B]tF_Pl-+=C].FC?h;A1%fn%15is/g+Y?ARTU%
@:X4hD@HqfA79"cBl5%I+<V+#%15is/g+YEART[l+Cnq(/Kf+JDg*=?De!3tBl@ku$>O*[A8Q$u
GT\ACCi<g!E+*d/-OgE(D/XQ=E-67FC1La`D/!l1-RT?1%15is/g+YFFs(L9E,Tc=+D,P.A7]cj
$:@`m7Sc]G78c90+@\LT+=DV[ASlB>C1Ju-F*93GCi<g!@q]:bDD*@H$4R>;67sBkASbq"AKWHT
@rlf9@;]Tu.P>4AAS-!+Anc'mEt&IkA7T7fATVKqDerrqEaNQl?Q_fI$>O*]Eb/[$AS,jsA7]dg
C1LZo7N`-I%15is/g+YBE-WRH@<Wi)@<>p#FDi:3F*8[?D/aE6F:ARD4ZX]6C2dU'BHS[O6>:O6
6ptI*@4*KT-Yd1%F*92a%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8Bl7m4FE92k0KCaq
F*8oR/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8Dfp/@
F`_[[0JGL>@rlf@+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE
-S.S8-ZjB;DKB5rFD5Z2F##F'3A+f_Fsegg+=A^TE+*j%+@[e2-Qk'`-OgCl$;No?+Cf>/Gp$U8
CisT4+Co%qF!(o!F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,/15.LE-68D1,(CB/n8F'Aof=B
/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8Dfp/@F`_[[
0JGL>@q9._F!i(]-QjcZ/8B-4FD)dd.4chh068KM$?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic
67aL+Ea`j,@:OCnDf0VO0JGL>@q9._F!iLd+=A^TE+*j%+@[e2-Qk'`-OgCl$;No?+Dbt)A0>u7
@;^-p@ruF'DK?6oC1JG7A9)U-FCAWpAKZ)8DC6PL%16i\+=CZ?G&h+9061uTF!*.ZFE1f-F(&R#
Bl@m11,(CB/n8sG+EVXA-Qij*%15is/g+tK@:UKpDK'`?Et&IkA0<71Ec5o=@:F%a+DGe:-OgDt
A0<70F*;S7+>7bRGB4l\+DG_4F`_[[0JGL>@rlf9BlJ/A%13OO:-pQUCi<`m+E)CEE-68D%16i\
+=C]?DfBf,@VfTuDfBeG%16i\+=CZ?G&h+9061uTF!*.ZDfp/@F`_[[0JGL>@rlf9DfBeG+:SYe
$;No?+EM+9+ED%*ATD@"@qB^(%16i\+=D2@An?!oDI[6#FE27A<,uDbF(&R#Bl@lYCLqc6BlJ/:
<,uDbF(&R#Bl@lYCLqc=%16i\+=D2@An?!oDI[6#FE27A<,uDbF(&R#Bl@lYCLqc6DfBe@<,uDb
F(&R#Bl@lYCLqc=%13OO:-pQUCi<`m+ED%4DfTq/$?L'&F`_SFF<G=/+=CZ?G&h/5DfTqB04lR@
$;GGZAO:3O@r"GF@;0UVF_,T-ATKU]:-pQ_9lG&`6>URMCI;cDBl6djATDKrF!,NU/KenKEb-A'
Df'H0AU#=i6m,rTDe!QmBOPUm+E;O8EbT*+/e&-s$;No?+EMX5DId0rA8-@$+E;O8Ed8d>DfT]'
F:ARhEH6=f3\qm>+=D2@@UgN.-Qjca+=Kf6+F,)@/g*MZ9L^R45sd#K+F,=D$4R>;67sC$ASl@/
ATJu2F_l/6E,9).@VfIjCNCUH@q]:k+E).6Gps10Eb/]i4ZZjk,CUb>3Zp",+=A9S-RM87%13OO
:-pQU@<Q4&@:s.&+DkP3/0JeDDBNh8DL,l7D]ib3E-68D+C]U=F(K0!@ru9m+EVX4DKB5rFD5Z2
Et&ItFCB940KhH>C1JH!EH6=I0H`D!0F\@3Eb/ZiF!+t1F?3oMF`):D<,uDbF(&R#Bl@lYCLqcB
%144#+<VdL+CTG+3am2E+A$HiF`]odDfor>/.Dq/+<VdL+<YN0GWK\MGT]RqE-67gD/XQ7F=[k.
+<VdL+<VeDBl5tKBl5%bDK'`?6#CO_DKH<p+C]U=<,uDbF(&R#Bl@lYCLqc#$6Wr$Df$V2E-)Nr
+EqL1Eb,[e+<VdL+<W(HE-*^3Ea`j,@:OCnDf/$[AU,C^+>Y]*0JFpu@;]Tu-qS;qF`]odDfor>
+?go%.1HV5%13OO:-pQU@<Q4&@:s-oD..Z?+Dkh1+Du+8H=_,8+E)CEE-68D+C]U=F(K0!@ru9m
+EVX4DKB5rFD5Z2Et&ItFCB940g.Q?C1JH!EH6=I0H`D!0F\@3Eb/ZiF!+t1F?3oMF`):D<,uDb
F(&R#Bl@l[@<6*5%144#+<VdL+CTG++E)CEE-67`@<Q9+:N^buF`^YmCis;?%144#+<VdL+DkP3
+E)CEE-67`D..Z3:N^buF`^YmCis;?%144#+<VdL+Dkh1+E)CEE-67`D/!l1:N^buF`^YmCis:u
$6Wf'+:SZ#+<VdL+<XX(@;^-p@ruF'DFe2WBFP:kAo_g,+:SZ#+<VdL+<YTAF:AR"GA(Q.AISth
+<VdL+<W(.F`_SFFB2gdF_)[Z+>ki%%14Nn$4R>;67sC%F_tu(EbTi2+DbJ,B4W3-Ea`j,@:OCn
Df0V*$?L;tFE93#3Zr0J+D,V6Gp"d`3Zp+!%144uART+j+:SZ#+<VdL+<Y03F<G:8E-67`@rHL-
F<G::F=p.&E-67gD/XQ7F=\OD$6UH6+<VdLF*2=BBl7m4F?4JcD'3P3F=p.&E-67gD/XQ7F=\OD
$6UH6+<VdL@r?B2Dfp/@F`]ZSDfor>+E)4@/l-V3E-68'@;L't/0GB/+<VdL+<VeJF_r7>F`_SF
F?4JcD'3b9F=p@3FDuAE<affeAKVEh+C]U=+:SZ#+<VdL+<YcHDD"n/@;^-p@ruF'DFSDQGp!P'
+D,Y4D'08p+<VdL+<VeKEc*FMEc+'TE-*XQEc+'ZE-*33$6XP+ATD?)%144#+<VdL+=M/IF=p@3
FDuAE<affeAKX/Z2)$I%@;]Tu-u!XB/kKr"F`]odDfor>+?go%.8Wf=<*rC=Ec#6$BmO>WCi<g!
6YKnBDF7?'1,2Nj/h0[n;cI+!DfT]'Ch\3,6>URMCI;cDBl6::<ZlH8/Kf"NF*&ODEc5H!F)u8?
/g(T1%17/nDfp/@F`\`[+?CW!%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/g)8Z:2b/i@;KY(
AOUi_DfTqe;cZA%Ch7Z1+AP6U+Du+<D..6pH=_.?6W7#.AU&04Ec`F9Bl%@%%14Nn$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R:2b/i@;KY(AO:3O@r"GF@;0UH;cY8B:K(5"F)u/2@<6*;
0ht%f.Sro><*s]fChR6uBHV@J/Kf"NF*&ODEc5H!F)u8?/g(T1%17/nDfp/@F`\`[+?CW!%15is
/g+kGFCfK)@:NjkGAhM4.!$gu%15is/g)8ZF##U2+<Ve%67sBZ83o!g2BZ[AF(c\.Ec5e;:N0l_
;c?@!$;No?+<VeJ2)-j/+<XEG/g+(`5rCAP+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+<Y`=@5/lI
+AP6U+B(fs0d(.<F(c\.Ec5e;:N0l_;c?@!$;No?+<VeJE\TI++<XEG/g+%`:dn)H/MT.;+D>2)
BHUo-Df$UmE+Noc;bRW-.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=D5OChR6uBI@A.
@;0OS@<5peCeA,WD/!lC2.^W5Bl"o/ATMp$B4W2tEc5e;8g&(nDfTK2@;TjqDJ()(DfTu;+EM[<
B4Z.+Bl7Q+%16ceG9D!G+DG_:Deio,;Fs\R9ggQf2D?7e@<6*)@rGmh+D,Y4D'2F[$4R=O$;b/P
@ps0r8mudXBl5:@G%kA-:i^JeEa`g%Bl7Pm$;,GY+>Pes-o2uV@<lo:@:sL-%13OOFDi:@Ec5T2
@;TjqDJ(($$<_:i+Ceht+Cf(nDJ*N'FD,5.F)u/:+?_b.Ch[cu+DG^9C,dn&+EVNEE,TH.F<G[D
+C]&&/g)94FD,6+GA2,0+EV:2F!,@3ARoj)DfB9*F)u.?-qPP'BPD@"+CT)1@<lo:@<Q'nCggdh
AKYo/+Dbb0Fa,$;DIal,@:L`/+Atd-7860)2D?7fF!+t$Ci!Zn+EV:;Dfo]++EMQX2D?7cF`(]2
Bl@lA%13OO9PIsV@<-W9BlbD/@<6O%EZfI;@;[33Bl7I"GB4m9F_PZ6+DG^9A8H('%13OOEb065
Bl[c--Y.%0-OgDX67sC$AT;j,Eb-@@F(f!&A90+-$?L9)E$.;)+A#%(8PUCIBk(p$-SKU`E\D6C
@P9)j-U^"#:N0l_;c?@A=(uP11gFL(DHnOu$;No?+AYg&:/b(b+?_b.C2dU'BHS[OF*VhKASj)A
F)5DrGr%3.A8H')-OgDX67u&178?c[9HZJZ+EMU?E$-\S-X:_6Ch7%#1GURnCht4A%15m-78?c[
9HZJZ+EMU?E$-\S-qQm":K&Ad+=K<4+=C6)DBMVeDKU1H6#L4RDeW`)6t(+[Bl5:I+DEGN4B5-B
9grE8?R[+:Bk(p$-Z!L+ARTj?1+m*RC`k)e+=Juf,To2sCh[@"F)3IMD]gDV4!5Xo1*@hb4==rZ
@WQU,/nB6DBjr24.1HVZ67u&178?c[9HZJZ+EMU?E$-\S-qQm":K&Ad+=K<4+=C6)DBMVeDKU1H
6#L4RDeW`)6t(+[Bl5:I+DEGN4B5-B9grE8?R[+:Bk(p$-Z!L+ARTj?1+m*RC`k)e+=Juf,To2s
Ch[@"F)3IMD]gDV4!5Xo1*@hb4==rZ@WQU,/hen</iYIoH#.2(+=ATI$<'ks73F`S+EMU?E$-\S
-X:S/ASuR1CaTZ!F)u.?4ZX]?+?CVm-r3Z.:/b(b+=nXP.4/P8-OgD\;aFl,FE8Qf3Zp=;%16!3
6#]784ZX]A+C-*J2)R0K%17/tCia8u1,Us44ZX]5+B(fs1,Us4Bcnm8+D`/M@j`C?F)29mF)u/=
BONbQ1*A_@+=A:183o*f1*C9R.UsT;+=^kK+EMU?%17/tCia8u0d&V?+=A:183nsQBcnm8+D`/M
@j`C?F)29mF)u.q8PhiM6npSR+?_b.-Ql;Y:dn)H0fC^.Bcnm8+D`/M@j`C?F)29mF)iun0KhH>
1E\_$0F\A-F`_SFF?MZ--o*J*+<r!V+=@U*F)u.q8PhiM6npSR+=MLa4")<rGptgnF`_SFF:ARq
F`_SFF:AR+%17/i@5/lf3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h+=A9Z%17/tCia8u0d%li.6Aq&
+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*2)-j/4ZX]A+?CW!%17#rFDuAE4ZX]62Dcj*,9S?V-OgE(
F)5o2@5Tbp+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%17/32)ZR?3Zp4$3Zp*c$?('/E-67c
3Zoh,1+==j+=A9Z%17/tCia8u1,Us4.![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$8!h]/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$:\rS+DG_*DfT]'FD5Z2+CS_tF`\`u+D,P4F_u1BF(Jo*BQS?83\N.1GBYZSF)PZ4G@>N'
/n8g:04o-CF_u1PBQS)#$4R=o/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%VDfQt7DJ!g-D..O#Df-\+@W-C2+A*bgDfTu;
F!,O8AKYZ.FDs8o06_Va/o#HGAor6*Eb-k5Df%.>DfTu;F"V-JD.Rs#D/a<&;Fs\R9gg]o0M#Vn
BJM:O$?B]tF_Pl-+=C]9CaTZ!%15is/g,+AFD)e2F!,=.@q]RoAKZ&5ARfFdBk&8;+DkOsBPD?q
+Dl7BF<G%(+>u&!@VKp,%17/tCiCL[3Zq!`=%Q.0E+rft+=AgbF)ipMBjr_C4"!BV>\Z/R>\Z/R
/N>F>>[hDb>UKsf%15m-78?c[9HZJZ+EMU?E$-\S-qQm":K&Ad+=K<4+=C6)DBMVeDKU1H6#L4R
DeW`)6t(+[Bl5:I+DEGN4B5-B9grE8?R[+:Bk(p$-Z!L+ARTj?1+m*RC`k)e+=Juf,To2sCh[@"
F)3IMD]gDV4!5Xo1*@hb4==rZ@WQU,/nB6DBjr24.1HUn$;No?+B)3473F`S+EMU?E$-\S-X:S/
ASuR1CaTZ!%17/tC`kl%+>G!"+=AR5:dn,X;bS;b+DiPS@q6qr$;seg@VKq*+?_b.2DbjM;H#l#
73F`S+>Y-G+>u)71H,aMF)u/=BONYR2BY.D+=A:183o!g2BZ]V.UsT;+=^kK+EMU?%17/tCia8u
2)-j/4ZX]5+B(fs2)-j/Bcnm8+D`/M@j`C?F)29mF)u/=BONV<4ZX]5+B(fs0d(0Q.UsT;+=^kK
+EMU?%17/tCf3i$7860)2D?7:3Zodm;Fs\R9gg]o0Hb'P.UsT;+=^kK+EMU?%13OOF)iun0KhH>
1E\_$0F\A-F`_SFF?MZ--o*J*+<r!V+=@U*F)u.q8PhiM6npSR+=MLa4")<rGptgnF`_SFF:ARq
F`_SFF:AR+%13OOF(eu:+?_b.1E\_$0F\A-F`_SFF?MZ--o*J*+<r!V+=@U*F)u/=BONV<.![7'
-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$4R>`2)-j/4ZX]A+?CW!%17#rFDuAE4ZX]62Dcj*,9S?V
-OgE(F)5o2@5Tbp+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%13OOF##U2+?_b.1E\_$0F\A-
F`_SFF?MZ--o3V-+<r!V+=@U*F)u/=BONYR2BXDn.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn
$4R>UAU%lsF(c[Z3Zogn><3lX5WWRjA0>;5BeE[?5WT>]%15is/g,7IF*&O<@<6*)GA2/4+D,P.
Ci=N3DJ()+A7]Y#BlnV0$4R=b-Y+ndAN;JS1H@BK@k]`K2E3]O2`,)%AiXHY0fEJtAi2S-11iF"
Ag\]Q3ZrN_Ci=N/EZfFD0fC^.BOuF%@<6*)-YI??@;'4\A0>PoF(c\5Gp$X+Gp"[]Bcpi$+D#e:
ARfgrDJ()#+>PVn@X3',+D>2)BI=5r%17&pC-lWV8jkEh:-pQ_E,o\[Blls8+EK+d+@9da8jje@
Ec5](@rri7ATW'6+EM%5BlJ/H%15is/g(T1:-pQU:i^,d@<,duBl@m1+D,P4+A*bKF_l=G1,LR<
2(Tk*0JPC,@rH6sATD@"@q?d%Eb0<'DKK</Bl@lA%15is/e&._67sB\F(oN)+EV:.+A,$EA79Rg
@UX=h+CSekDf-\>D]iJ+@;L48AKX<RFCT6'DBND)De!Q*A79Rg/e&._67r]S:-pQUG%G]'@<?4#
3XlEk67sAi$;No?+<Vd]+ED<A-ZF*@6>:O66mj*]+E(d54$"`uBln*#+E_d?Ci^sH>9G^EDe't<
-OgDX67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F`&ri
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l*C3=DL1*CX[@<-H4GAhM;+E)-?E,oN2ASuTuFD5Z2%13OO%15is/g,">
CLo/1G\(B-FCcS9ATW'6%15is/g+nIA7o7`C2[Wi+?_b.-UMNh8jlThFEMOM%17/nDfp/@F`\aB
B-8QgBlls8;e:&nE$l)%6>:O66rRZ=F`8HW%13OO:-pQU@VKpoDeX)3@VfsmCER),ART@cEZf"8
Dfp".$;No?+DPh*B4#@fDe*2t4ZX]56>:O66pb^.@r"DOART@cE[M;'%15is/g+V;FCT6'DBMP>
+D5_5F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls8-OgCl$;No?+CoV3E$/b,Ch4`,DfT]'Ch\3,
EX`@jDe*KfBkhQs?TgFm-VeT#D..6pH=]EZDe!QMBOPUm6W7#5%13OO%17/nDfp/@F`\`R6>:OO
DeX)B8jje@Eb0<'DKK</Bl@l3E,ol3ARfg)F(KH9E%WL                              ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ZR;+>P&o1E\J0+>Pbr1Gg400H`//+>PYo1Gp:11*AA0+>P\p1Gp:12]sh3+>GVo0f1"4+>PiA
@<6!;3(%@j@r"G16R*^?@<6!&2)l^gBOt[h+D,b6@ruF'DBNM8@;Tt"AO9gHAMlGGFCAZp:Ng;i
Ao)C0:2b5cF&R0h@r!2_G%G]+Ci=M?6=FqH+>l,$@q]F`CERM5FCfM[@<6-m6>URMCI;cDBl6jk
@<?R#Df'H9FCcS(@<6-m+C]/*@r#Rf@;0U%F*(i4BleB1@rjtNFCT6'DF//X@r#"QBOu$h;c-4t
Ci<g!@q]:bDBNIuFCAWeF(HJ8@q]Fj@3B-+@;Tt"ATLO`@:Vtu7WiN`6>URMCI;cDBl6=*Ci<`m
+DbJ,B4Z*+8jje2Ci<g!@q]:bDBNIuFCAWeF(J$`@:Vtu:gnBd6>URMCI;cDBl6=*Ci<`m+E1b0
FD50"+A,$E@VfsmCL_$dBl5&(@<>pe@<6!V:K(5":2b/i@;KY(AO:3O@r"GF@;0UH;c[jUF*&OD
Ec5H!F)u8?:et"h?ZU:)BOPsqE,Tf>+E2@>@qB_&DfTf;C-lWV8jl![F@nqDE,ol3ARfg)F(KH9
E$043EbTK7                                                                ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
zz=:zz,'lizedCSVFiles TRANSACTIONCOLUMNS TRANSACTIONSFILE TSEGPREFIX Transa'
zz=:zz,'ctionOffset assert boxopen csvfrtab fappend fboxname ferase firston'
zz=:zz,'e jtslash read smoutput''),(<<;._1 '' ParseGenesisBlock Base58Check B'
zz=:zz,'ase58frKey65 GenesisBlockChallengeScript GenesisBlockOutputAddress '
zz=:zz,'ParseGenesisBlock assert b58fd bfh dfh hfd i1 ic read todate tsfrun'
zz=:zz,'ixsecs vint''),<<;._1 '' sslhash IFACEWORDSsslhash OPENSSL ROOTWORDSs'
zz=:zz,'slhash cd s256 s512 sha1 sr160 sslRIPEMD160 sslsha1 sslsha256 sslsh'
zz=:zz,'a512''                                                              '
zz=:1077{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GL"/+>P&o0H`,22'=Y0+?2)3+>Get1,^p22]sh22`O-<F@nr"ATW'6:-pQ_6>:O66rRZ=F`8IE
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
05rRRCi<g!@q]:bDD)G+:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"%P*:-pQU+<XEtEc#6$BmO>Z
G]7SAF@/u-7VQ[MF!*%WDJsQ4@;KY(ATJt];cY#PG]7SAF<G10Ch7Ys$;No?%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPD!F_i`h%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l*C3=>H
2BZLJDK]T3FCeu*@r,RpF!,+9Dfp".$;No?+>G]fF_i`k+CSekARlo3<,uDbF(&R#Bl@lYCLqc?
+D,P4+A,$EEb/ioEb0,uBl7Pm$;No?+>G]fF_icg+CSekARlp*D]ie'@r$-.Eb03.F(o`7Ed8*$
%16T`@r,RpF!)i*DfT]'Ch\3,6>URMCI;cDBl6::<[U^PEcYe^ASu(#BlcUWDe!QX67s`a@<-F#
7qHRLF(o\^Ci<g!+EK+d+@9da@rH(!+D58'ATMR,+C]/*@r!2sBOt[h+CT.u+E1b0F(HJ*G[YH.
Ch54.$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*1hq/L
0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0f3WfCbRXf@:Wn[A0>u4+DP=pCNCV=AT2R/Bln96Gmt)i$?B]tF_Pl-
+=D5OChR6uBI=5r%17/tChR6uBMLlH.W]ZIBOPsq+EK+d+D>2)BHU`"B5_g)FD,N4+D,Y4D'2Vn
AStFF9J-b]:-pQB$;No?+AH9[ATJt:G%#E*Dfp+D+D>2)BHSF+ChI[,Bln$*F!)T6G%#*$@:F%a
+<YB9+<Yc>AKW*kE+Noc;bRW-:-pQU@VK^gEbT*++DG_7FCB!%ARlp-Bln#2C2n><3%cn0+CTG%
Bl%3eCh54A7WNEa+CT.1+E):7B5)6lC^g_H67sBkASl?.F(96)E-*43Gp#plF(8Wp+A-'`D/!l1
GA2/4+CSeqF`VYAASuU2+C]U=6>:7P+A?3\/e&._67r]S:-pQUG%G]'@<?4#3ZrKTAKYZ.FDs8o
06_Va/oP]?DKBl8/oPcC0+A7`67sAi$;No?+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9
:gnET@;JPEF)>W/02kD-,r.//,r.h61,(I01,*-SA0iub9ggib1,*<YE[<IpGA1r*Dg-73$;No?
%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/e&._67sB'F##U2+<W6Y;b0202)ZRj@<6*)Ao_g,
+AZrfDGsJ-%15is/g)9X2)-j/+>"^783o*f1*C7=F(c\.Ec5e;:N0l_;c?@!$;No?+<Y`=@5/lI
/Kdt_5qsKq@<6*)Ao_g,+AZrfDGsJ-%15is/g)9XE\TI++>"^68PhiM6nL,O0Hb%;F(c\.Ec5e;
:N0l_;c?@!$;No?%15is/g+YEART[lA3(hg0JPCVF`&ro%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l*C3=DM0Hak=
@;]^hA0>u4+EDUB+E)-?1GU(^BlkJ=H#n(=D0$-n:-pQU0f3WfCbRXf@:Wn[A0>u4+DP=pCNCV=
AT2R/Bln96Gmt*U67sB81hq/L0K1+bCht55Ec6&<FEqh:F!+n%C3=T>ARloqDfQt>DfTr.@VKXm
FEn<&%16T`@r,RpF!)iOF)5MuF(cp1$4R>;67s`uAT23uA7]Y#Et&Hc$;No?+E2@>Anc'm+=84O
AT;j,Eb-A;DfTB0+<`-_.6T:+8Oc9I;]o(85tscW$4R>;67sBkChtbGD]ib8+DkOsBPD?q05knS
F)Y]#BkD'h+>"^EF)uJ@ATJu/EHE<_/hf%'BlbD2DKBo.Ci!Zn%15m-78?c[9KbEZ4"*Zi8P`8-
.j-6%3[\!CDBMVeDKU1H6#L4RDeW`)6t(+[Bl5:I+DEGN4B5-B9gpKRHQX\PBjtX^Gr%3.A8H')
-T`G!1*@hb4==rZ@WQU,/otqR-Rh,"-o)nj+?V#fBju.)CbB7DCh[?$-RfK3%15is/g+Y4Cht5)
ChsOf@q7_`0f:+80F\?u$?L9)F(eu;2)[TY+<VdL-r3Z.:/b(b+=nW_+B(fs1,Us44s2?uGT\JG
+F#"Y@j`]P@q6#UF)u/=BONbQ1-IZ@+<VdT:JaJT;c?@4/0H;_;b0230esk8+=eRZ+=^kDGT\JG
-RgBPA.8leF)5o2@50o++<VdL+<W(.:dn,X;bS;b+=A:183nsQ4s2?uGT\JG+F#"Y@j`]P@q6#U
F)u.q8PhiM6npSR4ZX]6:JaJT;c?@4/0H;_;Fs\R9gg]o0H`P%.j0'Z.UsTG+=^kK.4/P8%13OO
:-pQ_ASu$hAT23uA7]Y#Et&H                                                  ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H-F7+>P&s+>kkr0fL452BX_.+>Pbr1,9t.0H`)/+>bqu2]sk86>:O67!3Q^+A,$EA79Rg@UX=h
+CSekDf-\>D]iJ+@;L48AKX<RFCT6'DBND)De!Q*A79Rg6>:O66pb^.@r"DOART@cEc>H-F(I"9
G][t7@rri7ASbpfFCeu*Blmp'F!,(8Df$U`Blmj'Bl5&&Chmp+DJj>EA79R&@VfsmCER5'Ch7ZS
Blls8;e:&nE-#T4F`8HiBlmj'Bl5Rr6m-GhDe`inFA?apD..6pH=]EZDe!QMBOPUm6W7$'DfT]'
Ch\3,+@B(.+C]/*@r#Rf@;0U%Anc'mF&6:cF(IjQDImm'F$a\]@r"DFFCT6'DBNS'DImm'F!+q.
De!Q*@q]F`CER&'A0>i"EcYe7AU%X#E,9*,F)5MuF(f5qF(c\)ChI[,Bln$*F!,(8Df$UmE+Noc
;bR                                                                       ~>
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


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk]cDIc%DA9)7&F!*bjFCAZm<,uDbF(&R#Bl@l[@<6*nF!*e8;aiQ'+@9LX
AMlG7BOt[h+@9LXAMlG7BOt[h9lFQRC`l&QF(I3gAo^OUGr@N&6>:O66rRZ=F`8HjBOt[h7;ZLF
A7T7^6Z6gY@<3PYF`^T'@;^-p@ruF'DGt+ZD.RU,F!*kB7nHZY+@KdYF_tT!E_0%L79EA^;H-"^
<^]MW771$M;HY,4ASu(#BlcUWDe!QMBOP^nASu-l;e'i^E-*3mASu(#BlcUWDe!QYF`_SFF?sGJ
Eb0<5+A#$g6Ub'P;FFGYDfT]'Ch\3,6>URMCI;cDBl6::<Zjt'5sn(B:JsSZF)u/2@<6*)8PVQ@
<(0\P:J=b_:/`9,:/Fqi6VgBU9hnV08PW)^<)Z7X9LU'qDK]T3FAla`D.RU,F!+(C6W7#R8Q%uE
<)6Cp+AQiqD..6pH=]NiE,Tc=6W7#TBl%@%+AYg&:/b(b+AZ!::fUI^:J=b_:/`92<E)dp<)Z7X
9LU("F`_SFFAm9iEc`F#@<-F#7qHRLF(o\^Ci<g!+Au!2<*)jn6rQj!Ec#6$BmO>WCi<g!6YKnB
DF7?'+Au!2<*)jn6rS/JChR6uBHU5bB5M3tF@]tOA7]d(;e:&GDfT]'Ch\3,A4'9r7VQ[MF!+F[
5u(?E6W?WQ:.%fN<D?4e+B26):/aGG<(Tk\;as>P73GQ.77U0P77KjN+B3AiDKB5rFD5Z2:M+3[
ATT&(2)o)ZARfLFEaj<9ATJu'2)o2Y+C\qr+CfJ9Ao`!%@N]2n@Pp+fA7fKtAoVj:+D>@r+DEPQ
F##U2+EKCp1*CXO@5/mGE\TI++EMU?;Fs\R9gg]o0HbFXCia8u0d(OYCia8u1,Us4F)u/=BONbQ
1*CaSDKI6T/1<VC4"akp+=A:'DK]T3FAla`D.RU,F"f9jFCfN8F*)P6-RgSp4?P\X?SNZN+@9da
8jjdgBlls86>URMCI3&Q@;BFp+@9da8jlThFEMOF:2b/i@;KY(AO:3O@r"GF@;0UH;cY#;@<-F#
7qHRLF(o\^Ci<g!+EMU?BOPsq-RgSp4>8$7.4cl04?G0&0d%hd6=FqH2)ms:ARfLC;]nD8F(I3g
;flGXCJT+bEb9-+G><'uATJt\@<6-m6>URMCI;cDBl6jk@<?Q56>:OODeX)UCi<g!;e'KPD.-@?
9H[#I@:Vtu6>URMCI;cDBl6=*+A?]^A4f6ZF_kk\Ci<g!6YKnBDF?f69Q+?M8jlKaEcaWaDe!QM
BOPUm6p`"jDfTDUCi<g!6YKnBDGbOfEbT*++Abj4<*rC=Ec#6$BmO>WCi<g!6YKnBDF7?'+Abj4
<*s]fChR6uBHUl'@;0OS@<5peCeA,WD/!l1AU%X#E,9)`8PhiM6npSR87?RQ+E2@96>:O66mjE7
-p07-2)?L50JPC<2DR6E1c@6H2_d3H1Gp:10JPC<2_[*A3AriU1c-mF1GL"-0JPC<2DR6E1c@6H
2_d3H1Gp:10JPC<2DR9F2`!9K1bg[=3AVd50JPC<2DR9F2E*WT0fM!L1cZ[60JPC<2_Zs=3&r`Q
1,(^J1,L+/0JPC<2DR!>2E3NJ3&r`R1,L+/0JPC<2_[*A2*!NN2DI0G2)ZR40JPC<2_[*A2)I'H
3AiKM1,g=20JPC<2_[*A2`WiP0etIB2DcO30JPC<2_[*A3&*-H1GpsE2)cX50JPC<2_[*A2)I*I
2`39G2DcO30JPC<2DR-B3AE?H2`EWK1H-F30JPC<2_Zs=3&r`Q1,(XI3B83;0JPC<2_[-B2D[$C
1cR6E2)ZR40JPC<2DR6E2)R9L3&`TJ1E\G,0f1RC0JtIC2`*3E2E3WR0d&5*0f1RC0JtIB0JYO?
0f(LB2BXb/0f1RC0JtI@2)@-I3&3BK2]sk00f1RC0JtI?3ArfT0JY@C2'=Y.0f1RC0JtI?3AE<G
1,LjF1*A>+0f1RC0K(O@2)R?R3&WcP2'=Y.0f1RB1,pmD1H@?M1GCU=2BXb/0f1RC0JtIB0fV0L
1GUjE1a"P-0f1RC0JtIA1,(LA0JtU@2'=Y.0f1RC0JtIB0f(O>1GUmG2BXb/0f1RC0JP1>3ANNK
0KD*J1a"P-0f1RC0K(OA1GCUA3&30F2BXb/0f1RB1,pmD2)@3N2`<QL3?U(20f1RC0JtI?2)mTU
1H.!C1*A>+0f1RC0JtI@2*!NR3AWWR2'=Y.0f1RC0JtI@2E*?J1H79M0d&5*0f1RC0JtI@2)%$L
2)[EK3$9t10f1RC0JtI?1GUsE3AWH61,(F>0K1[E/iYjJ1bpgD2E3N91,(F>0K([H/i>UC1b^pJ
1-%061,(F>0K([G/i5IE0fLgG3AWQ91,(F>0K([H/i>XC2E3WS1c.!21,(F>0K1[D/hf4C3AE9E
1c.381,(F>0K([G/i5IE0fLgG3AWQ91,(F>0K([H/iGC;0f1jL1GC^01,(F>0K1^A/iPIA3&WKL
2Dm951,(F>0K([H/iGFE1c@-J2E*E71,(F>0K([B/iPXA3AN9B0etX01,(F>0K([G/i>C@2`*<L
0f(X/1,(F>0K([G/i>CA0K1aG2`W`<1,(F>0K([G/i>CA2D?jC2)%$51,(F>0K([G/i5RK1GggE
3&r]91,(F>0K([G/i>@@0f1dD2`*631,(F>0K([G/i>CA2E*QQ1,q691,(F>0K([G/i>C@3&EEK
1,q9:1,(F>0K([G/i>CA0fCaB0fV$51,(F>0K([B/iPXA3AN9B0etX01,(F>0K1^G/iYjM0etRG
1*A>+0f1RC0fUdF3B&ZJ2)-d?2BXb/0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etU@0JYO/
1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/
1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etRG1*A>+
0f1RC0fUdF3B&ZJ2)-d?2BXb/0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etRG1*A>+0f1RC
0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etRG1*A>+0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM
0etRG1*A>+0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etRG1*A>+0f1RC0fUdF3B&ZJ2)-d?
2BXb/0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etRG1*A>+
0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etRG1*A>+0f1RC0fUdF3B&ZJ2)-d?2BXb/0f1RC
0fUdF3B&ZJ2)-d?2BXb/0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etRG1*A>+0f1RC0fUdF
3B&ZJ2)-d?2BXb/0f1RC0fUdF3B&ZJ2)-d?2BXb/0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM
0etRG1*A>+0f1RC0fUdF3B&ZJ1c[<61,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@
0JYO/1,(F>0K1^G/iYjM0etU@0JYO/1,(F>0K1^G/iYjM0etU@0JYO8/1<V9+>P2t0JPC<2_[-B
0etI>3&EBF1c?I30JPC<2DR$?1cI*E1,(^K2)ud70JPC<2_d9E3&roP1,UsH2DlU40JPC<2_d9E
3&roP1,UsH2Dlp7-p07-2C(%30f1RB1,:I=3&WWP0JkOC2]sk00f1RB1,:I=3&30H3B/`N0d&5*
0f1RB1,:I=2_[3J3&NQK3?U(20f1RC0JtI?0JbFD2E!?F2BXb/0f1RC0JP1>3ANNK0fLgB2BXb/
0f1RB1,pmD1cR9H0fCjD+>PW*1b^jC3%d0N2_d'G0JGFF+>PW*1b^jC3%d0N2_d'G0JGFF+>PW*
1b^jC3%d0N2_d'G0JGFF+>PW*1b^jC3%d0N2_d'G0f^pE+>PW*1b^jC3%d0N2_d'G0f^pE+>PW*
1b^jC3%d0N2_d'G0f^pE.4cl00I/>$/1<V9+>GYt1,(F>0K([H/iGXE3&3?G1,^j01,(F>0K1[?
/iYjH2_m*D1c%*61,(F>0K1^A/iGXH2)6j>0JP:)1,(F>0K1[A/iGL>3AE6I2BXb/0f1RC0et@<
3AENK3AiKG2BXb/0f1RC0fL^F0f_0K0JbRF3$9t10f1RC0fUdF3B&ZJ2)m?G2BXb/0f1RC1,1C;
2_m-D1,(F=3$9t10f1RC0K(OA1GCUA3&`ZS2'=Y.0f1RB1,pmD2)[<O2`*EM0d&5*0f1RB1,pmC
3&*-B0f1mH+>PW*1b^gC3%d$I3A<-@2_[0N+>PW*1b^gC1+kCB1bgaG0K:mH+>PW*1b^jC3%d0N
2_d'F3&33H+>PW*1b^jC3%d0N2_d'F3&33H+>PW*1b^jD0eP7A1cI3G1G_$K+>PW*1b^jC3%d0N
2_d'F3&33H+>PW*1b^jC3%d0N2_d'F3&33H+>PW*1b^jC3%d0N2_d'F3&33H+>PW*1b^jC3%d0N
2_d'F3&33H+>PW*1b^jD0eP7@2`EZR3AWE51,(F>0K1^G/iYjM0etUG1,1[01,(F>0K1^G/iYjM
0etUG1,1[01,(F>0K1^G/iYjM0etUG1,1[01,(F>0K1^G/iYjM0etUG1,1[01,(F>0K1^G/iYjM
0etUG1,1[9/1<V7.4cl00I\P$4>838-p014/3GT                                   ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
