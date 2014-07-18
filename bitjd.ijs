NB. JOD dictionary dump: 17 Jul 2014 22:28:19
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
0ebU10eje,+>GYp1*AJ51E\G0+>P&o2`EW;1,'h++>Gc/1E\G-+>P&o3&3010fU:2+>GZ20d&5,
+>P&o1H.371,g=2+>PZ++>GVo1*A>40d&20+>P&o2_['21,'h++>GQ,1E\Y"1*AM73C7.qAMlG7
BOt[h6W5`t0/"G8,9UT@DI[d&Df-\0Ec5e;BQS?8F#ks-B5)F//n\m?BQ[c:@rH3;6Z6LHF%L7:
BOPh#0/G=A2*!TM%14aA%14aA+EM47GA1r-+D>\;+EVNE@rH7.ATDl8FDi9g@<6!;3(%@j@r!3!
DfT]'F:AQd$4R>]F^f0$@j#i7@<?3n+EMXFBl7Q+7;cURA7[/uH$!V%>p*ZdFC?U-$@<3h+:SYa
0/"G9ARfXhAKYH-FCeZ^+EVNE6>:((DKKH&ATA4e#sr?=8T&W]B4Z*+Bl8#\@<>p#4WlF?%13DR
DfQsKBl8#8BcoP]0KUCk+?UcW@<>p19P&*SFD*`YBe(\_%13Dg%13CJBl8#\@<>p#4WnHVF@9PZ
@3@$B1,Us4.j/A2FCABf>rrK&$%36i+:SYa0/"G:DI[TqAKX<RB1Zu_AS5Rp+EVNE6=FqH2)l_"
FE2)5B+51SF*)G:DJ()4ATN!1F<E^h+sK)X$41oiBl%?'-u!R@6t(1G+?go%.1HUjHOU;g$#+:!
+ED%1@;0UiATAnV+=LrAF=AVPDKJ9TFC?:<+>l,-3t2N'$#+:!6t(1G+>5l#2)mZ,$4.#ZATN!1
F<E^h6tp:JFE:Z,ASkjiDId=!>p(X?Eb0<7Cih`J$42+i$6Tcb#qmqS6#^dSDIakt0jl,9DfQt3
@:NsnCh7$cBl7Q+0HahMFCbmg$"e*r+=LrAF<G9?4WlF?+DDr\+Cno&@4k5bDJ+')+=8EXA79Rg
>A7@c4ZsoA4!85f.k(o7$%!*g#mkW`F*2;@+?^hp0de(o+ED%7F_l.]%13Di%13D^ATW'8DBNt2
F*2;@3t2OF%144E@<6!;3)ap-@r"k`ATDC!Dg+rpFCfMK2,8(3ATJu4DBLhp+C]V<AKYr7@Vfag
+DYP6F!,RC+C\c#AKWii+D,Y4D)r+5%16cjFDs8o06;5D@r$"+ATDC!Dg*gDDf%.IF_,W9Bl@m1
0/5IB1G^^B1G<EMF(f9*B.[_9Df%(7/T>iACh[B2CLqcCFDia>/RiF9@rH(!/R`1#Eb0<5/ST)S
E+j2"$4R=O$:u@KD'3q@H"h//+EVNEAoDL%Dg*=GBOr<#DKBo?F^oN-Df0V=Eb065Bl[cq+EVNE
FEMVA+CQBN2'?@RFCcS6F^f0$@iu3fCLqc6Bl8$2+CQC%Blmj'Bl5&%A7T^lF)rIHF(oN)+E2"5
/g+,,AKY])F*)GF@ruF'DK?q/Eb-A5F_Pr/+D#e:Ch[BnF=n[F$:A6>+CT/5Df0,/BOu"!+Dk[4
GA2/4+EV:.+E2@0@ruEp@;KY"Gp%$;+CoD)DJ()6BOQ!*Bl5&4BQ-0F$4R>6DKBo?F^oN-Df0V=
@<,og$4R=s+>"^8@;BEsFD,5.@rHC.ATMg/DIdI!B-;/9@Vfag+DYP6+D58'ATD4$ARlp-Bln#2
BlkIG2DlUdH$!V=/0HYi@X3',+>A$o1b9aY$8XF[@X3',F!+t2EcP`4E,TW)Bl7Q+FDi:(+Cf>.
Eb&m%@<?'3+>Ybq@X3',F!+t2EcP`4E,TW)Bl7Q+FDi:)+Cf>.Eb&m%@<?'0%13OO0JkX@3&WQY
6oHkf3&a,l3'f;h76!(j0gS8`5r^\T1IFJd1Ia5X75Qt^6o[%Y0gn;q3'f5T3&iic2*s&S2)6pS
6o6hV1,LdD2)@NR3B9Pp3CPkc1,CjJ0fCa?1I4>p0eksK6q/sl3&NQ^6oILi77Apj2ao_o2)m?X
5rK/Z%14j5/Kdl$Eb961D'2bJ5qOiL2BZ[AF(f9*B-;,1+EV:.+E2I4Ch[B%CLqc#$4R>#0JGsc
75QbT68V+b0K1dB5rCY[2)dfY6UO-r2FBhd3&<QO1bh!F0JGC@1,M9R1cI`h68Cqh3(,Si1b^lu
$4R=u+>"^4ATDC$Ebups8PhiM6nL,O0Hb%;F(f9*B-;,1+EV:.+ED%7F_l.BDe:+j83ng_2)YmN
%14dD0KD$L2`EWK0K(pK1IO)X2E*HK3CPeo1H@oa2F0#b1,h!U77@Xm%14p7/Kd>iA0?&,EcYr5
DBND6FCcS/DBNP3Df0Y>De:+i8PhiM6nL,O0Hb%;F(c[E0R,9*+D,P4+AH9YDBM\cFE_YDCFK]"
%14dC0JP7A2E!KQ2D?gC3AiT\2)R9N1c%-\2+9;]7Q<:l0LRZT1I=N!%13OO2'=In:h=ZZDfT\;
;b02+1,Us4BOPsq+E)-?FD,5.AU&<.DId<h+Atd-7860%0fC^.Eb0<7Cig*n%14pK2+';g3&!$F
5rg_h3&`WL0fV-J3&j5k1GUXM3(?=l6q'F11-n>`68UVj0LdoR6:3I]6:"%"1c7WS3A_0P%15!9
/Kdl$Eb961D'2bJ5qOiL2BZ[AF(c\7DBO%7AKZ#)F*2;@+E(j7FD,5.E,oN5BlA-8+B(fs/M]1A
+D>2)BFP:X$:Hd,3Arfc2D[]Z6prah1H@0H5r:kr1c7$U3CYnm6o@@h2DRWg1INuW2`E`V0K1jU
0ebOE0f;<Q5r_.d0F\?u$9'(Z+B2cbAKZ).AKYT!EcZ=F1a$7QFCfM9De:,6BOr<-ARfXrA0=fA
5qOiL2BZ[AF(d0K<+oue+DGm>FD,5.@:WnhATMo8@q]F`CNFW8%13OO6oHb[2E+)`%13OO3$9dq
6"FLKFD,5.1a$:AARfLsF_r71H$!V=+D,Y4D'3e9Bl8#82]uON+EV:.+D#G$+E(j7AU&<.DId<h
+Atd-7860%0fC^.BOPsq+D,Y4D'3e9Bl8#81bKnMBPDN1BlbD=BOr;A2(`9_FCcS(Bl7@"Gp#Ff
FCT6'DBM5UA9)7&F"Rn/%14dC0JP7A2E!KQ2D?gC3AiT\2)R9N1c%-\2+9;]7Q<:l0LRZT1I=N!
6oHb[2E+)`%13OO3?Tmr6Z6jcATDl8FD,5.Eb0<7Cige3Ec5e;@3B$)FCcS9FE2)5B-:o+FDi:1
+C\c#AMlFiF*)G:DJ()7F(oN)+@9LXAMlG7BOt[h+D#G#De*R"B.b<+BPDN1BlbD=BOr<'Df^"C
@rH4$Df0B:+E_a:A0=3QFCT6'DBM5UA9)7&F!,(5Ec#6,%13OO0fE$U9M@HEBldc?;.`XE6</2%
De;OW6;][c9lt,n9gW90Bk'JGDe!QMBOPUm;flGiF##IF67sBjDf'H9FCcS(@<6-m+C]/*@r#Rf
@;0U%F*(i4BleB1@ri(d%15is/g,7E@VfTuCLqc6@rHL-FE7luC1JG7Eb/ZiF!+t2F`):D<,uDb
F(&R#Bl@l[@<6*)Ao_g,+EVXA-OgDtA0<7?ART+j+Cf>4DKI!mDK'`?87?RQ+D,Y4D'3P3F=.M)
C1JG7Eb/ZiF!+t2F`):D:N^buF`^8fGp$^>Df$V8E-*H:$4R>;67sBhG%W?KD..Z?+Dkh1+C]&,
@rH(!%16i\+=D2@@:XF%@<Q9+:N^buF`^YmCis;?+DkP3+A[-%E-68'@;L't/0JeDDBM_tFDuAE
<affeALns6Dfor>+A[-%E-68'@;L't+D,Y4D'3b9F=.M)C1JG7Eb/ZiF!+n7B-9c`E-67gD/XQ7
F=\PO@<`ndDK'`?6#CO_DKIEPD/!l18T&KiF?sb^F`):P+Cf>4DKI!mDK'`?6#CO_DKI"5Ec5e;
BlJ/A%13OO:-pQU@<?U"@q[!$@:EeaEt&IkA0<7?ART+j+@10`+A[-%E-67`@<Q9+:N^buF`^Ym
Cis;?+AH9h+A[-%E-67`D..Z3:N^buF`^YmCis;?+AHQf+A[-%E-67`D/!l1:N^buF`^YmCis;?
+@C'iDKIpLDfor>+A[-%E-68'@;L't+D,Y4D'3b9F=.M)C1JG7Eb/ZiF!*blB-9c`E-67`@<Q9+
8T&KiF?sb^F`):P+AH9h+A$HiF`]Z]@<`ndDK'`?6#CO_DKIEP9keJf8T&KiF?48QDBMMgE-67g
D/XQ7F=\P%Dfor>3b*)NDKI!mDK'`?6#CO_DKI"5Ec5e;BlJ/A%13OO%15is/g,"LEb-A'Df'H0
AU#>;F_,T-ATJ:f%15is/g+SGATD3lALns@@<a=GD/!l1DJsE=ATD]3Bl7m4FE8R6Gp%0>Ch7*u
ARlp*Ea`j,@:OCnDf0V*$>O)oAoVj:+>=p!+>=63+ED%%A9/l'DKIpLDfor>+B3AiDKB5rFD5Z2
7VcR\/.Dq/+<VdL+<Y*9B0'IEB-9c`E-67gD/XQ7F=[k.+<VdL+<VeD@<ahM@<`ndDK'`?6#CO_
DKIE=$6UH6+<VdLD/!lKD/!l18T&KiF?sb^F`):1$6Wf'+B3AiDKB5rFD5Z27VcR\%144iEc5e;
BlJ/'$6XP+ATD>k$6UH6+<VdTBlJ/H<,uDbF(&R#Bl@lYCLqc64s2X80JG10+CT.u+=Kg!E-67g
D/XQ7F<Eai0I[G<.1HUn$;No?+CTG)Ea`Tl+DkP3/0JeDDBNh8DL,l7D]it@FDuAEF!+q;+EM+1
ARfgnA0>u7@;^-p@ruF'DK?6oC1JH!EH6=I0H`D!0F\@3Eb/ZiF!+t1F?3oMF`):D<,uDbF(&R#
Bl@l[@<6*5%144#+<VdL+CTG+3am2E+A[-%E-68'@;L't/.Dq/+<VdL+<YN0GWK\MGT]e)FDuAE
<affeALn8t+<VdL+<VeDBl5tKBl5%hF`_SFFB2gdF_)!h+C]U=%144#+<VdL+B3AiDKB5rFD5Z2
87?RQ%144iEc5e;%144#+<VdL+E)4@%145%BOu3q%144#+<VdL+=L$.FDuAE<affeAKX/Z2)$Hg
$7QDk%15is/g,4XD/E^%BmO>5Cgh?sAKZ)8@;^-p@ruF'DK?6oC1JH!EH6=I0H`D!0H^f3+ED%%
A9/k&$6UH6+<VdL@rHL-F<G::F=p.&E-67gD/XQ7F=\OD$6UH6+<VdLF*2=BBlJ/H8T&KiF?sb^
F`):P+:SZ#+<VdL+<Y04F`):DDfBeN:N^buF`^YmCis;?+:SZ#+<VdL+<Y`JD'3b9F=p@3FDuAE
<affeAKVEh+C]U=+:SZ#+<VdL+<YcHDD"n/@;^-p@ruF'DFSDQGp!P'+D,Y4D'08p+<VdL+<VeK
Ec*FMEc+'TE-*XQEc+'ZE-*33$6XP+ATD?)%144#+<VdL+=M/IF=p@3FDuAE<affeAKX/Z2)$I%
@;]Tu-u!XB/kKr"F`]odDfor>+?go%.1HV56>:OODeX)UCi<g!;e'KPD.-@?9JSJ(;+r*R@q]Fj
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
F`\a@A0<70F*;S8E,Tc=+>7=S%15dI@:Vtu7WiN`6>URMCI;cDBl6=*1,2Nj/g*i+@:UKQ6m,rT
De!QmBOPUm+DbJ,B4W2r@<>pe@<6!4%13OO:-pQUF*(i.A79LmH=_.?8g&(]FD)e-ASc'tBlmp,
+EVNEGA1r*Dg-7F@UWb^F)59+BHR`kGA1r6@<?1(AT0dn-X8#G-n$Gr-Qku55WV%N>q(1N%13OO
:-pQUF`V+:C1Ib\Eb065Bl[c--Y-Y-@4uA+-OgCl$;No?+Cf5!@<*K!A8Q$u%16i\@:X4hDBLVU
+:SYe$;No?+EM+1ARfg)A7?Z5+EM47G9C^?@psInDf-!kC1La`D/!m4+=CW7De!QpF_kkA%17/n
Dfp/@F`\a@A79"cBl5%@-OgCl$;No?+CfJ9+DG\3DfTqBAoDKrATA4e6W7#T:J=/F;E[&`7QidT
-[p/KD/_.CA1qG6Ft[<@De!QmBOPUm0..29%15is/g+\9Ch7^"+>./FFs(42A0<L7A7]@o+D,>(
ATJ:fC1LjdCh7^"AoDKrATD-mA7$HK%16i\@rc-hFCf'&Ch.*t?YX+Y+@[I_$4R>;67sBjDfBtE
Eaa/7A79Rg+EVNE@rlf9Bl.g-Ec_`t69R@P-u*^0FD)dEIR7aj8jl'UFC?OG/151C@rlfH-OgE(
BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-Y[I;F`_[V@;Ka4@rlf@+=nl_-QjsTE+*j%+@[e2
-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-Z=-LE-68D/R`I3/n8sG-Qjrf+=A9_
C2dU'BHTbn/12PnF!hD(F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,/15O[@;^-p@ruF'DK@C<
Cht_6F*8o^-QjcfC2dU'BHTbn/12PnF!hD(%15is/g+YBE-WR9DesQ5DBNJ$Aof(($?KllCht4B
GA1r6@<?1(AT/b>G[kZ2Gp"Ic67aKuDK'`?F"Lg:CbB4.AS-!2+=nl_-QjsTE+*j%+@[e2-Qk'`
-OgE(BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-Z=-LE-68D/R`I3/n8F'Aof=B/12Pf+=q8H
@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8FE1f-F(&R#Bl@m1/R`I3
/n8F'Aof=N-QjcfC2dU'BHTbn/12PnF!hD(%15is/g+tK@:UL&Ea`j,@:OCnDf0V*$>O)o-Y.79
E-,MtCh4`2Ec*6I+:SZmA0<70F*;S7+>7bRGB4l\+EVX4DKB5rFD5Z2F"Lg:CbB4=Fs(mIDC6P9
$4R>;67sBsDdd0!Bl7m4FE7luC1JG7A9)U-FCAWpAKY]+F=.M)C1JG7@rlg6A0<OGDg-7F0Hb(I
E-68D/R`I3/n8sG+DGe:-OgCl$;No?+Dbt)A0>f5FDuAEEt&IkA0<71Ec5o=@:F%a+E)4@-OgDt
A0<70F*;S7+>7bRGB4l\+E)CEE-68D/R`I3/n8sG+E)4@-Qij*%15is/g,4HF<GU8An?!oDI[7!
+:SZmA0<7?AS,LoASu!h+EVXA+B3AiDKB5rFD5Z27VcR\+DGe:+B3AiDKB5rFD5Z27VcR\-OgDt
A0<7?AS,LoASu!h+EVXA+B3AiDKB5rFD5Z27VcR\+E)4@+B3AiDKB5rFD5Z27VcR\-OgCl$;No?
+Dbt)A0>o(E,Tc=%17/nDfp/@F`\a@A0<70F*;S8E,Tc=+>7=S%15p-;cI+!DfT]'Ch\3,6>URM
CI;cDBl6::<\cC)67u)1;cI+!DfT]'Ch\3,6>URMCI;cDBl6::<Zl@"F*&ODEc5H!F)u8?+:SYe
$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+<Ve%DfT]'Ch\3,7<ici
EcaZI<^pe>ATJt::-pQUDJsQ4@;KY(ATJt];cY#PG]7SAF<G10Ch7Ys$7QDk%16T`@s)g4ASuT4
-XpM*AL@oo@rH(!F(KB6+<W%,DfT]'Ch\3,6>URMCI;cDBl6::<[U^>;cI+FF)5MuF(d<`:-pR0
:K(5"F)u/2@<6*)E,Tf>+E2@>@qB_&DfQs0$4R>`D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\
+EqaEA12LJ3XlEk67sB'+EK:q2BX+b:-pQU;b0202)ZRj@<6*)Ao_g,+AZrfDGsJ-%15is/g)8Z
F#>[-+<Ve%67sBZ83o*f1*C7=F(c\.Ec5e;:N0l_;c?@!$;No?+<VeJBONV<+<XEG/g+(`5qsKq
@<6*)Ao_g,+AZrfDGsJ-%15is/g)8ZF)iun0H_K567sBY8PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_
;c?@!$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+<W%QF)5MuF(cq4D..-p:gnET@;JPE
F)>W/1,WW[@;0O#D.Rd0@:s-oAo_g,+A*bqEc5u2Ea`g%Bl7Q+AoD^4D'3nBB4kdsFD5W*+:SZk
Dg*=GD]ib3G&M/-+Atd-7860%0fC^.BOPsq+Cf>#AKYT*Df$Uh%13OO%15p?F(8Wp+A-'`D/!l8
+EhI-+Ad)sB6%EtD/!m#%15^MDBL\l+=K#gA79b)+CSo$.1HUn$?U2/E,ol0Ea`g%Bl7Q+%166V
FWb1&DBNG&@;]^h+EV:.+EMU?E$.;)+Dbb0AKY])+DNki1*C[W+E275DKI"CD]iM'DD!%S:NU8]
Ed)5=AKZ).BlbD7AS#Cn+E)41DKBl8+=Kf(FD,B+CER&%G@>c<+CTG%Bl%3eCh4`-DBNb0DKU1H
@;]TuD.-p'+<XQR:dn)H0fC^.BlbD,@;KakA0>u-Ec6)5BHVA:0fC^.Ap&!$FD5Z2/e&-s$;>/C
Eaa!6+DGm>Amob&ATAo8BOPd$GA1r*Dg-7F@WcC$F<G:8+Co;)Et&Hc$?B]tF_Pl-+=C]9CaTZ!
:-pQUEb065Bl[c--Z`s0Eb'5=%17/tCiCL[3Zq!`=%Q.0E+rft+=AgbF)ipMBjr_C4"!EW>Yf<M
DGsJ-/QZY(2DeZJBl70'%15is/g*qd78?c[9HZJZ+DPk(FD)dEIWKdUFCf;BF)u//@<jXa/nAd7
+=@U*:-pR/:dn,X;bS;s3ZrKbCiCLJ+=CE8F)5DrGr%3.A8H')-OgDY:dn,X;bS;s3ZrKbCiCLJ
+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tsdTH=&*DE+rft
+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp-o)nj+?V#fBju.)CbB7DCh[?$
-RfK3:-pR/:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXY
GA1qB.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K
.6AXp-o)nj+?V#fBju.)Cb@Co3A*9DA9i!*@N[$I%16$49LU'e3ZrKbCiCLJ+=CE4E+Np.F)335
$?L9)+?_b.0d&M"-R_be78?c[9HYl/D(-fAA1%fn;H#kjBlnD=4ZX]D1^sdi;aG@k+?_b.1E]sG
2Dm?J2[p+8F)5o2@59\u+?_b.-Ql>Y5r(;U+DDrJ@j#S1.UshKF)u.,$?L9)F(eu>0esk73Zodm
;b0230eskc+=^kDC`k3;-QmJOC^g_mF)5o2@5/lf3Zodm;b02/+DDrJ@j#S1.UshKF)u.,$?L9)
;Fs\R9gg]o0H`M>+=A:08PhiM6npSR+DDrJ@j#S1.UshKF)u.,$?L5B2D@9T+>Y-$+>=63Dfp/@
F`]c-+=K!!.3KiX-QjcG$?L9);Fs\R9gg]o0H_ch.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*
BONV<4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V-OgE(F)5o2@5/lQGptg',9V7\4)]7`E-673
$?('/E-673$7QDkF#>[-+?_b.1E\_$0F\A-F`_SFF?MZ--oNn2+<r!V+=@U*F)u/=BONbQ1*@uj
.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HW*1,Us44ZX]A+?CW!%17#rFDuAE4ZX]61GUC%,9S?V
-OgE(F)5o2@59\u+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%14[=/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15RCEZf(6
AoD^,@<?4%DBN@sDfp.E8g%_aEcl5?+EM+*+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2D(fL>Ecl5?
/nf?D%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=7W3;iBl7O$Ec#6,Bl@l3@:F.tF<F0uAoD^4D0$h@ARuutFEDI_
0/%NnG:mWODe=*8@<,p3@rH3;AoD^4D0%=CFDYT6@;Tt"APu)r7860)2D@[1F(d<`%17,eEHPu9
AKW@2ChtI.$4R>;67sC"@<?0*BlbD6@:NtbDIjr3E+NNnAnb`t/Ken=@q]RoAKYi4F*&O6AKWlf
+C]&,+:S[!F)5e<4ZX]W7TW/V+E2%)CEOuXF`VRVCh[?3-T`\C3a?DX1gFcR1bC[@10e:&DHnOu
$4R><:dn,X;bS;s3ZrKbCiCLJ+=KfN8P`8-.j-6%3ZoeOBl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB
.3N=W+?WY!5tsdTH=&*DE+rft+=Cu>@V&tn1GURnCht4A4!5q,+=&'l-Z!L+F)u.MF)N0K.6AXp
-o)nj+?V#fBju.)CbB7DCh[?$-RfK3%15is/g+(k9LU'e3ZrKbCiCLJ+=CE4E+Np.F)335$4R>`
F)2s^3Zp."3Zodu:JaJT;c?@4/0JdY-=^R6%16!36"4PMF!*V,+>u%c$;segE((m43Zp4$>p)$_
2)@0#$?L9)F(eu;2)ZR?3Zodm;b0202)ZRk+=^kDC`k3;-QmJOC^g_mF)5o2@5Tbp+?_b.-Ql>Y
5rCAP+DDrJ@j#S1.UshKF)u.,$?L9)F(eu:+?_b.-Ql>Y5qsKr+=^kDC`k3;-QmJOC^g_mF)4`G
:dn)H0fC^.4ZX]5+Atd-7860)2D?7f+=^kDC`k3;-QmJOC^g^\$?L5B2D@9T+>Y-$+>=63Dfp/@
F`]c-+=K!!.3KiX-QjcG$?L9);Fs\R9gg]o0H_ch.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn
$?Klh0d&V?+>Y-$+>=63Dfp/@F`]c-+=K!!.3KiX-QjcG$?L9)F(eu:+=MLa4")<rGptgnF`_SF
F:ARqF`_SFF:AR+%13OOF#>[-+?_b.1E\_$0F\A-F`_SFF?MZ--oNn2+<r!V+=@U*F)u/=BONbQ
1*@uj.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn$?Is[2BY.D+>Y-$+>=63Dfp/@F`]c-+=K$$
.3KiX-QjcG$?L9)F(eu;2)ZR*Gptg',9V7\4)]7`E-673$?('/E-673$7QDk%13OOBOuF%@<6*)
4ZX]6+BplL/3l70An3#m/nlqD.6op'$4R>;67sC&ATMr9BOPsq+EqOABHUo*Ci"$6Bl7Q+Bk1dm
FD5iB%13OO+=C\R11`I#@P^#'0k2mo@Q$2+0fLq#1M/XZ1,1[r1hJU*2_nu'11hmV/NP"rDes?9
ATAo7E\TI++D>>2BOPsq+=Cf?+CSqp@:UKo@<6*)D0[77@<itI+DDs,D'3D7E+NO$Bl7Q+@3@<Z
+C]V<AKYYpF(cp1$4R>]Eb[pTF@nqV0ht%f.WBEC6>:O66m-P&/KdAoF@nqDE,ol3ARfg)F(KH9
E$043EbTK7/e&._67sAi$;No?+Ad)iE+*cqFD5Z2F!,(5EZdss8p+rq+>Pc*1,UU*1,(F>+Cf>-
An?!oDI[6#E,oN2ASuTuFD5Z2/e&._67r]S:-pQU<HDklB-;;0AKXT5+Cno&@:EYdAKYDlA8c?.
FDi:1DII@,H=\3cBlmj'Bl5&&Ci<g!+Cno&@4hur:-pQB$;No?+Eh=:@UX@mD)r+5:-pQU%15is
/g)8Z0d(LR+=D,KC-lWV8jk$L>9Iip+?MV3@VKq!A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+:SZQ
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F>C3=DL1(=Rc67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB81hq/N1,9tnFCB33+EqaECERP5+E2@4F(K62@<?4%D@Hp^$4R>;67sBt@;BF-AU%crF`_1;
F(KH9E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nr"ATW'6-OgE(D/XQ=E-67FChFk<6>:O66rRZ=
F`8];$:8HK8jlThFEMOF0F\?u$;No?+C]&,@rH(!+C]/*@r!2rEb/ZpATAo+Ec6)>%15is/g+nI
A7o7`C2[Wi+?_b.-UMNh8jl!^De!QLEb/ZpATB.-$4R>;67sBiBlmj'Bl5%c6m-,_Dfp".$;No?
+DPh*B4#@fDe*2t4ZX]56>:O66miEN%15is/g+\ID/^V0Bl%?'DJsQ4@;KY(ATA4eC2[Wq?YO7n
A7%J\+=Bp&Ec#6$BmO>WCi<g!6YKnBDF7?'-OgCl$4R>`D/XQ=E-67F-UMNh@rH(!01nVTE,oN2
ASuTuFD5Z2+E2@>C1Ums+EM+9F`8r\                                            ~>
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
