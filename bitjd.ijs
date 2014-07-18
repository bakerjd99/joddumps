NB. JOD dictionary dump: 13 Jul 2014 14:44:41
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
3B83:0H`.o0f'q-+>u,6+>Pbr1*A;12`;d60H`+n0fCaB+>PYo1*A;21,'h*3$9t!0f(aC+>Pku
1*A>,0d&2++>P&p3ADX22]sju0fLdC+>PVn1*A;*1c$76+>P&u2`X35F(I3g6YL%@CI;#U2(pU*
6R*^cF`(]2Bl@l3Ao_g,+D>k=E-"&n05#!?F=q3?FD,f+/n8g:010YgATLF\6YKnHF"]=(2`3TS
0b"IC0+A7A0-G=LDg,o5B-:l+G9D!G+Cf>-G%G]9+EVNE6=FqH2)ms:ARfKuAoD^,@<;qc%13OO
E-5W+Bk&9,FCB9*@j#i7EbTE(+@U0XDe*E-@X3',>?r@^@<>p,%17Fk$6Tcb#qmqS6tKkHA7Zlm
H$!V%>p+6-+@9dT8T&W]B4Z)m$40%5B1Zu_AS5Rp+DG_86t(1G+?^i$3t2N'AoD]4-u!R@+DDr]
+>>l"BcoM\A79Rg/kfhoB67fK+DE>V.1HUjHOU;g$#+:!6t(1G+?^i]DKJ9TFC?:A+>Pf4+=eRF
@<>p^BjEe0$42+i$6Tcb#qmqS7;cURA7ZlMBkL"TFCf)rEZfIB+@9LXAMlFiF*)G:DJ'Cc$$13/
Bl7Q+Eb0<7Cigd_+<i!k%13DcBPD9o+=LrAF@9PZ@3@`V0I[G<$%!*g#mk<`F<GU8D..-rA7]d(
4Wl.eDKI<UBl8#\@<>p#,p5').6@tG#mk<`F@9PZ@3@3d+>l,?%13CJEb0<7Cigd_+@KpVBlnE#
Eb0)rBl7HmEa9e<+ED%7F_l.]%13Di%143e$4/@=+@0scASu$$?nl%3AoD]4ART(^+DbUtA8,po
+>=pIH$!U,$41<_EZccEDKI"8+?^i$4!85[4<S0CFC?dqASu.&BHSWK+Cno&@9[GO+?_k10KUCk
.k<%X$42%g$4.#ZATN!1F<E^h-SZtk.j/kDF*2;@3t2N'I16MiEb0?8Ec*"?ATN!1F?9p=I16N+
6=FqH2)nNV@:O(KG%G]+Ci=MmDffQ31,VgFFCfM9Df-[U2'?@RFCcS6F^f0$@j#PuH#k*MD]iLt
F(HIO3$;gRDf%NE$4R>UFEDI_0/%Bg@:O(kG%G]+Ci=MM@rH3;EHPi6FD5Z2F"]7.1,C^?2)?n!
@<6*rDJ(P5Ec5eH@4cG@@Vfag/SepC/Tbn_@4br&FCT6'DCo:-A9)7&F"M*D/T>BB%13OO%15ZL
@;R-/Ed;A:B-;;7+D,P.Ci=M?FD,5.Bl8!6Eckl6Bl@m1+ED%5F_Pl-A0>u4+EVaHDBN@12DlUd
H$!U?E-5W+Bk&7p$>X3u+DG_8D]iI2@VKpoDeX)3@:WnhATMo8F`V87B-;/,E%W84BOr<#DKBo?
F^oN-Df0V=@<,p%EHPu;AKYQ/E,95uBlksM%15I2DBNA*H#IS3+D>>&E$0"/+EqOABHVD1AKYr4
@:OCn@ps1fFEo!IAftW&Bl7Q+FD,*)+DG^9E+j2T%13OO8T&TkEckl6Bl@m1+CT;%%13OO0d&%j
<+0QR+EV:.+Cf>1Eb0<2Df0*"DJ()2F^f0$@j#PuGp$a2DImisFCeu*GA2/4+DGp?-oNq*@X3',
F"AFg+C]V<AKW[O0Jk='%14mH+C]V<ATJu(DfTl0F)Z&8A8,po+EVNE=<M*lDfTB&DIIWu/0H`(
+C]V<ATJu(DfTl0F)Z&8A8,po+EVNE=Wh3mDfTB&DIIWu.1HUn$8=:o0K:sH5t!Uf5r^eh76!Rg
7R]9m6SUkr0gRcU0Jc'_2)@]Z1IX,[2FKM^0el'^6o[Id1cRHR75[Ce1GppC6UWai0JYI@1c7'T
1-%?a5rh@m2_m0J2_d3F0Jc!]6SU;]0gnJe3&icQ779%'1.=Vd3&a8d6T$hY6:!L=$4R=t+>"^4
ATDC$Ebupt83ng_2)ZRj@<6*rDJ()1DBO%7AKYr7@Vfag+DYP6%13OO2D?gS7R]-h1.!fd0JGFA
0gRZW2)R<Y2+'_s1c@]g0fUsL1c-pI0eb:>1GUdQ1c.-X6p`Xs3B0D`68UAU%13OO1E\7l:h=ZZ
DfT\;;Fs\R9ggQf2D?7e@<6*rDJ()1DBO%7AKZ#)F*2;@+E(j7;b02+1,Us!$4R=r0ebUG2E*QQ
0JGCF2)@WX2)[BM1H@l]75Hqn3&X&V6o$\W6:F<P$4R>!+>"^%A7Qg+ATDj+Df-\,H$!U?Bl5&*
Ec5i;+E(j7;Fs\R9ggQf2D?7e@<6*)-nom"0HatGEZe(bBl5%gATW-7Ebd*5$4R=r0JG483ArcS
2`<?D2E<WN6o?h[2`*<N75[Li3CYtd5qk\^2`!ch71BS5$8iqX+AcWiAoD^,+B(fs/M]1A+D>2)
BHV52+EV:.+D#e>ASu$iA0=cA:dn)H/MT.;+ED%7F_l./$4R>!1c7WZ5r^PP2aKG[6o[+]1GLjK
1,q6[68LAN5r_>&1.4Pt6o%%s0g[]U7PI:h0LA,]0LA&o3&EK[0KCs!$4R>#+>"^4ATDC$Ebupt
83ng_2)ZRj@<6*)Df-\>BOr<,ATN!1F<GL6+EV:.+E2@4G%kl;F!+CP5qOiL2BZ[AF(c!i%15K]
0f_-N7Q*%i2ag%g3&<QL1dNra75QkW6TIUo5t!Ru1c@*V75I=e2`EZU3&!9K68:/Q2DI'V0gRcb
1GB7F%15$:/Ke#$CLnW1BOr;uBl\9:+>b3MH$!V=+E(j7FD,5.F(Jj"DIakg83ng_2)ZRj@<6*7
+B3#gF!,1<+EV:.+CSekEb0<5+Cf(r@r$..D%-g]$:Hd,3Arfc2@U!&$90.[+@0OK+EV:.+>b3N
BOt[hF*2=B@X3',F!,(8Df$V9DeX*2+?(EOF<G[=AKYQ%A0>f&+D#e>ASu$iA0=cA:dn)H/MT.;
+D>2)BHUo-Df$V9DeX*2+>b\n<+oue+DGm>FD,5.1,UXmH$!U?@VK^gEd8coBlmj'Bl5%ZA7T^l
F)rrC$4R=r0JG483ArcS2`<?D2E<WN6o?h[2`*<N75[Li3CYtd5qk\^2`!ch779$g3Arfc2@U!&
$994\+@C'bG%G]9+EV:.+ED%7F_l.BAo_g,+CQC%H$!U?F*)G:DJ()+DKKe>@3B#fF(I3g+EMXF
Bl7Q+F`V87B-9NLF(I3g6YL%@CER2+@rGmlDJ(RE<+oue+DGm>FD,5.D/XK;+Cf>,D/X<.Gp%6N
ARloMBlmj'Bl5%ZA7T^lF)rI9DfT]'F:AQd$8FG=G>([j;JC2^1Jqa\EC*ZK95eE5D*h)YG>30o
G"k;3F(o,NCi<g!6YKnBDGtXcFE92l:-pQU@rH4'F`_1;@UX=l@j#5sDe!QmBOPUm+EMX5FD5f<
Bk)2n$4R>;67sC&@:F%a+DYP6+Cf>4DKKq/$>O)o-ZWd,A9/l'Dfor>+B3AiDKB5rFD5Z287?RQ
+D,Y4D'3q@DC5l#C1JG7Eb/ZiF!+t2F`):D8T&KiF@]h]BHUo-Df$V2E-*H:$>O)o-ZWd,A9/l'
Dfor>+A[-%E-67qAU,D1Ec5e;DfBeG%13OO:-pQU@<Q97+DkP3/0JeDDBND&FCT6'D@HqfA0<7?
ART+j+CTG++A[-%E-68'@;L't/0Je<GT]e)FDuAE<affeALns@Bl5%hF`_SFFB2gdF_**H@rHL-
F<FA%FDuAE<affeAKYT*Df$V8E-*H:$>O)o-ZWd,A9/l%G%VphDK'`?6#CO_DKIEPD..Z38T&Ki
F?sb^F`):P+Dkh1+A$HiF`]odDfor>/0JG@F`):D8T&KiF?sb^F`):DAo_g,+DGe:-OgCl$;No?
+CTA6@:NsnCggdaCi^$mC1JG7Eb/ZiF!*blB-9umFDuAE3am2E+A[-%E-68'@;L't/0IYqGT]e)
FDuAE3c/;M+A[-%E-68'@;L't/0IZ$DBM_tFDuAE3c/SK+A[-%E-68'@;L't/0I;uF`):^@rHL-
F<FA%FDuAE<affeAKYT*Df$V8E-*H:$>O)o-ZWd,A9/kZG%VphDK'`?3am2E+A$HiF`]odDfor>
/0IYqGT]RqE-67`D..Z38T&KiF?sb^F`):P+AHQf+A$HiF`]Z]Bl5%bDK'`?6#CO_DKIEP6Z7*b
F?3oMF`):D8T&KiF?sb^F`):DAo_g,+DGe:-OgCl$4R>;67sBtDfTD3@rH4'Ch7i6EHPi5Bk;>p
$4R>;67sBhG%G]&B4WV:D..Z?+Dkh1+Du+8H=_,8+DG_4F`_[I@X0);ASbpfFCeu*FE1f-F(&R#
Bl@m1%16i\+D,V6Gp"d`3Zp*c$6XA#@:XF%@r?BL@rHL-F<FP'@;^-p@ruF'DFSDQGq9C3+<VdL
+<Ve8G%WjEG%VphDK'`?6#CO_DKIE=$6UH6+<VdLD..ZMD..Z38T&KiF?sb^F`):P%144#+<VdL
+Dkh13c/SK+A$HiF`]odDfor>%144eGp$(,@;^-p@ruF'DFSDQGmt*'Ao_g,+DGe:%145%BOu3q
%144#+<VdL-u!XB/lZk"DKB5rFD5Z27VcR\+?go(0JG17.3N&:A0<9lDK'`?6#CO_DKI!b+>>5R
$7QDk%15is/g+SGATD3lAKYhuGUstSBl5&2Df0l4Ec3(=F`_SFFE8R6Gp%0>Ch7*uARlp*Ea`j,
@:OCnDf0V*$>O)oAoVj:+>=p!+>=63+ED%%A9/l'DKIpLDfor>+B3AiDKB5rFD5Z287?RQ/.Dq/
+<VdL+<Y*9B0'IEB-9umFDuAE<affeALn8t+<VdL+<VeD@<ahM@<`njF`_SFFB2gdF_**5$6UH6
+<VdLD/!lKD/!l1:N^buF`^YmCis:u$6Wf'+:SZ#+<VdL+<XX(@;^-p@ruF'DFe2WBFP:kAo_g,
+:SZ#+<VdL+<YTAF:AR"GA(Q.AISth+<VdL+<W(.F`_SFFB2gdF_)[Z+>ki%%14Nn$4R>;67sC%
F_tu(EbTi2+DbJ,B4W3-Ea`j,@:OCnDf0V*$>O)oAoVj:+>=p!+>=oI$6XA#@:XF%%144#+<VdL
+Cf>4DKI"8E-*^(DK'`?6#CO_DKIEP%144#+<VdL+EM[B+DGe:/kKr"F`]odDfor>/0GB/+<VdL
+<Ve:Dfor>+E)4@/l-V3E-68'@;L't/0GB/+<VdL+<VeJF_r7>E-*^.F`_SFFB2gdF_)[)$6Wf'
+<V+#+<VdL+<VeKEc*L/Ea`j,@:OCnDf/$[AU,C-$6Wr$Df$U+$6UH6+<VdLFE27MFE27_BlJ/F
FE27_DfBe@%145%BOu3q+:SZ#+<VdL+<W(NE-*^.F`_SFFB2gdF_)[Z+>ki%+CT.u+=LrCF=p.&
E-67gD/XQ7F<Eai0I[G<.7.`j@rH(!6>URMCK"_VASkjS;+r`&;c-42F(8lpD.+Q!DfQt0Blmj'
Bl5&&Ci<g!F!,(8Df%NE$4R>UFEDJC3\N.!Bln$2@P2//D(fOBDf0*"CiqCIBjtOcFCT6'DCog=
EbmC<Ci<c9D..L-ATBFjBlmj'Bl5Rl@<>pe@<6!5D0^2BCb9^<BOu$h/ou#K%13OO%15I#76smA
+B1Wn9LU(5Ci<g!+=I[++<VdLBOPsq+Cf(nE[W_!.3N)6DIIR2+E2@8D..I1+DYP6/.Dpq$6UH6
+Eh=:F(oQ1+DG_8AS5Rp/.Dq/+<Ve?@<6*YEb0D:+Cf(nE[W_!.3N)6DIIR2+Du+>+Du=<Cb-#&
+<VdLBOPsq9kA?\Ch6L_Dfd+3BOPp01GUC%@VK^gEd8dFDfd+>F_kkF%144#+<YQ$Bl.E(Bl8$(
B4Z*+F`)87B5V9k+Du+>+Du=<Cb-#&+<VdLDF/&ZF!,17FCf)rEZfLBF(o9)ARlp$Dfd+>F_kkF
%144#+<YPsDf0&r+<VdL+<YB9FCf)rEZfLBF(o9)ARlp$Dfd+>F_kkF%13OO+<VdLGAhM;+D,G.
@<<V7+E_RCBkM<pA1S/s+<VdLA7]_%BHV#,FCf)rEZfLBF(o9)ARm>$$4R=b+<VeBAU,CHBOPsq
9kA?\Ch6L_DfdEZ%144#+<YH2Gp"MK@<6*YEb0DC%144#+<YH2Gp"MGAT2a).1HV53t2N+$:@][
5u^8q<'`iE73H\m@;^-p@ruF'DBL>:$6UH6+D>2)BHUeu@<*bP1+=>TBl7@"Gp%'HBl.:!Gp$m6
Gq9C3+<VdLG%G]8Bl@l3Bl8$(B4Z*7%144#+<YK=@r#%XD.Oi(DKKH&ATAo9DKBN)DIm?0%144#
+<Y04Bl7BgF(HJ'Df9H'@;ZM].6@tG%15I#76smA+B1Wn9LU'uATDR&ARBP"ARuu4%144#+<Y]C
Dfd+3BOPp01GUC%F`)87B5V9k+Du+>+Du=<Cb-#&+<VdLBk2H2+DG_8AS5Rp+E_RCBkM<pA1S/s
+<VdLE,oZ0@<-W9CLqc6-us6EF=\PKA9]OS%144#+<YH2Gp"MUDf9_H%14OG%13OO6W-?=<(.p1
8OZ]'G%kN3?Xdhi@r!2Q;[j(478--;<$2VW84?W/BOPsq.3N&?+D>2)BIjT"G%G]8Bl@l?%15Wp
==@ikF(eBjATfLF@<3Q)@<6*YEb0DF%15Wp==@ikF(e9ZEbfK&;K$Jq.3N&?+D>2)BME&YCM[Q[
Df9_K%16uPBl.E4%16u>BlnDI%16uJDf0&r/.Dr1DfTVE%16WWE-,b&$:[oh9d!n]De!QE%13OO
%15C=DffZ(EZf1,H#IhI+D,Y4D)r+5%16cjFDu:^0/$dKFCT6'DKK<'CG'OGB.mt:A7^!<E+j2T
FDl,4@m)\'1c76F0F\?u$:@][5u^8q<'`iE73H&UDe!R(+=J?A$><jhBHTZ55uK*e1+=>@:K/H3
<D6(/6VgHU<)Q"R:/i?FCi<g!F'im%+Abs-9gMZ[+A5.+/.DqrBOPUm=)W+p+@8at66K$!<$4q9
9M?uH$>=!bB4uB06:j[=:/i?2:K/H3<D6(;%16c[@:Wqi+@8at66K$!<$4q99M?ls%13OO6W-?=
<(.p/5se76+EM+9FD5W*F!)kR%16u]D.Ohj5uL'@5uK*e1+=>@:K/H3<D6(/6VgHU<)Q"R:/i?W
ATW$.DJ+#tE,-Rm;FsSK;HY,879M/N$?fioF_)[^9M[u(3t2N+$:@][5u^8q<'`iE73H\m@;^-p
@ruF'DK?pK+:SZk@<6*)<(0ng+AP^3+APp19HZ\u:/b+i5tOgN+EVX4DKB5rFD5Z2F'im%+Abs-
9gMZ[+A5.+/.Dr0ATAnb:/jYP78b7':K/H3<D6(;%178mDI7I2+A#=-77TdE+AP^3+APp19IpV[
G&MMF?ZUN98PW5R7n$;u:/=h3:/st]/.Dr&De!QiFD5T'+A#=-77TdE+AP^3+APp19IpV[F(or3
+A#=-77TdE+AP^3+APp19IW%4$4R>0;FNlN73GPq6;0fjFE1f-F(&R#Bl@m1?YOCsF`\`S+:SZk
@<6*hE+*cuDKK6-GT]sS=B$D<:K/H3<D6(;%17/dEbTK7?ZTpo+B1d3<$4q3<$4q99M?ls%13OO
6W-?=<(.p/5se76+EVX4DKB5rFD5Z2F'ij.FDuAE+=J?A$><jhBO>^eEb0-1?Z^N8<(0ng+AP^3
+APp19IpV[G%#30AKXl>5tiCr:K/H3<D6(;%17/dEbTK7?Z:-s?Ya4u+B1d3<$4q3<$4q99M?ls
9Q+?M8jl!^De!QMBOPUm6p`X`:-pQU9Q+?M+A,$E@VfsmCL_$dBl5&(@<>pe@<6!4%13OO:-pQU
F*(i.A79LmH=_.?8g&(]FD)e-ASc'tBlmp,+EVNEGA1r*Dg-7F@UWb^+EM@-F(c!iGA1r6@<?1(
AT0dn-X8#G-n$Gr-Qku55WV%N>q(1N%13OO:-pQUF`V+:C1Ib\Eb065Bl[c--Y-Y-@4uA+-OgCl
$;No?+Cf5!@<*K!A8Q$u%16i\@:X4hDBLVU+:SYe$;No?+EM+1ARfg)A7?Z5+EM47G9C^?@psIn
Df-!kC1La`D/!m4+=CW7De!QmBOPUm-OgE(D/XQ=E-67FC1La`D/!l1-RT?1%15is/g+YFFs(L9
E,Tc=+D,P.A7]cj$:@`m7Sc]G78c90+@\LT+=DV[ASlB>C1Ju-F*93GCi<g!@q]:bDD*@H$4R>;
67sBkASbq"AKWU8F*8[7DIakB@q9._F!,(/Ch7Ys$>O*^ASbq"AS,jsA7]dgC1LZo7L]]>A7KXk
@<?'mDerrqEaNQl?Q_f\%13OO:-pQU@rH=3+ECn7+Cno&@3BZ1+CfJ9+DG\3DfTq/$:6m:+=LuD
@<?0*-[nBrF@nqh@<>p*.4ci]A7K\(0..29F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,/15.L
E-68D1,(CB/n8sG-Qjrf+=A9_C2dU'BHTbn/12PnF!hD(F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3
+=A^,/15@YFDuAEF##F'3A+f_FseC`-QjcZ/8B-4FD)dd.4chh068KM$?KllCht4BGA1r6@<?1(
AT/b>G[kZ2Gp"Ic67aL+Ea`j,@:OCnDf0VO0JGL>@rlf@/12Pf/8B-4FD)dd.4chh068KM$4R>;
67sBjDfBtE@rH1+D/LJ,AS-!+%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8Bl7m4FE92k
0KCaqA7]@o-Qjrf+=A9_C2dU'BHTbn/12PnF!hD(F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,
/15@YFDuAEF##F'3A+fPAS-!2+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+BQIa(
+=DDDDfBtE-S.S8-ZjB;DKB5rFD5Z2F##F'3A+fPAS-!2/12Pf/8B-4FD)dd.4chh068KM$4R>;
67sBsDdd0!FE1f-F(&R#Bl@m1%16i\+=C]?DfBf,@VfTuFE27H+<V+#C1JG7@rlg6A0<OGDg-7F
0HbIX@;^-p@ruF'DK@Qe0KCaqF*8[JEc*6I%13OO:-pQUCi<`m+DG_4F`_[6$>O)o-Y.79E-,Mt
Ch4`'E-*H:$>O)o-Y%4@Eb$:GEc6/C+>=pPDK'`?F##F'3A+f_Fs(L<F=.M)%15is/g+tK@:UL!
F`_SFFE7luC1JG7A9)U-FCAWpAKYo1F=.M)C1JG7@rlg6A0<OGDg-7F0Hb:VFDuAEF##F'3A+f_
Fs(^BF=/1?$4R>;67sC%ATT&8AS,LoASu!hF!(o!C1JG7Eb/ioEb0,uAKZ)8DBMo!@;^-p@ruF'
DFSDQGp$g?F<FP'@;^-p@ruF'DFSDQGpa%.C1JG7Eb/ioEb0,uAKZ)8DBMo!@;^-p@ruF'DFSDQ
Gp%$EF<FP'@;^-p@ruF'DFSDQGpa%.%15is/g+tK@:UL$AT2R.F:ARuD/XQ=E-67FC1JG7@rlg6
AT2R.F<E5K-OgDZ:K(5":2b/i@;KY(AO:3O@r"GF@;0UH;cYY.:-pR0:K(5":2b/i@;KY(AO:3O
@r"GF@;0UH;cY#[Df^"CE,ol,ATMp2EZbeu%17/nDfp/@F`\`[+?CW!%15is/g+kGFCfK)@:Njk
GAhM4.!$gu%15is/g)8Z:2b/i@;KY(AOUi_DfTqe;cZA%Ch7Z1+AP6U+Du+<D..6pH=_.?6W7#.
AU&04Ec`F9Bl%@%%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R:2b/i@;KY(AO:3O
@r"GF@;0UH;cY8B:K(5"F)u/2@<6*;0ht%f:et"h?ZU:)BOPsq+E27?F<GOCDe!@"F)Q(A%13OO
F)>i<FDuAE+>=p!+>=63:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU+<Y_\2)ZR"+AP6U+B(fs
1,Us4BOPsq+D,Y4D'2VnAStFF9FV>(67sB'+EKCp1*@\^:-pQU;b0230eskb@<6*)Ao_g,+AZrf
DGsJ-%15is/g)8ZF(eu:+<Ve%67sBZ83nsQBOPsq+D,Y4D'2VnAStFF9FV>(67sB'+EMQX2D?6r
:-pQU;Fs\R9ggQf2D?7e@<6*)Ao_g,+AZrfDGsJ-%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!g
DKBB0F<D\RF)u/2@<6*0ASkjiCf"P]@ps1G@<6:"DDF(\D..-p+Dk\2F(&]m+D,Y4D'2FnE,ol;
B6%EtD/!m#+D,P4F_r7BF_>>uF*),6B-7WjBQ&);FDi:9DK]r6AKXlB:dn)H/MT.;+D>2)BHUf'
A7ZlqEc5e;8du+:$4R>=@<5peC`l>YF)>W/-QmSH@3ABeDeF*!D/F!)B+52?F`&<W2'=;'+Cno+
F!+n(D^c,&%172q+E2@>B6%EtD/!m#+:SZ\Dfm14@;[2tBOPdkAKZ).AKZ&8CiCL[3Zr6QDIjr)
DBN[R0JXbmD]j";Bl8#8FDi:2Bl5OG+A[)mATE!/F(HJ9BPDN1DImBiF!,C?ASuR1C`k,t+EV:2
DJLA'Cj0<5F!+n7@;0Od@VfTuDf-\6Bl8'<+CT.u+DkOs.3Ka28PhiM6npSR+DGm>@ps1iARlp*
BQA$6B4rE/E\TI++D,b6@ruF'DCuA*%15dC@WGmtGp$gB+D,&'FCfJ8FD,*#+EqO;A8c[5+C]J-
Cige6DBNJ+Ci^$m%17,eEHPu9AKW@2ChtI.$;No?+ED%5F_Pl-+=D5D@<,n"-OgE(F)5e<4ZX]W
7TW/V+E2%)CEOuXF`VRVCh[?3-T`\D3a>I"AStFF9J'=[DDj=V@VK^b-OgDX67sBV:dn,X;bS;s
3Zr0V@<?0*-[p,^F*(u106;2NARTj?1+m*RC`k)7$;No?:JaJT;c?@44ZX^,F)5e</0H<FF)u//
@<jXa/nAd7+=@U*:JaJT;c?@44ZX^,F)5e</0H?47S-BS+=eQ_4$"K3=(uOp9PJBeGT]:iA9)U&
A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@BjtX^Gr%3.A8H')-T`G!1*@hb4==rZ@WQU,
/otqR-Rh,"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$;No?:JaJT;c?@44ZX^,F)5e</0H?47S-BS
+=eQ_4$"K3=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@BjtX^
Gr%3.A8H')-T`G!1*@hb4==rZ@WQU,/otqR-Rh,"+=Juf,To2sCh[@"F)3H_/ibOD/nB6DBjr24
.1HV_;bTV&4ZX^,F)5e</0H<FDfB9*F)u.F%17/tC`kl%+>G!"+=AR5:dn,X;bS;b+DiPS@q6qr
$;seg@VKq*+?_b.2DbjM;H#l#73F`S+>Y-G+>u)71H,aMF)u/=BONYR2BY.D+=A:183o!g2BZ]V
.UsT;+=^kK+EMU?%17/tCia8u2)-j/4ZX]5+B(fs2)-j/Bcnm8+D`/M@j`C?F)29mF)u/=BONV<
4ZX]5+B(fs0d(0Q.UsT;+=^kK+EMU?%17/tCf3i$7860)2D?7:3Zodm;Fs\R9gg]o0Hb'P.UsT;
+=^kK+EMU?%17/s0fC^K3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h+=A9Z%17/tCf3i$7860)2D?7%
Gptg',9V7\4)]7`E-673$?('/E-673$7QDkF(eu:+?_b.1E\_$0F\A-F`_SFF?MZ--o*J*+<r!V
+=@U*F)u/=BONV<.![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$?J'Z1*A_@+>Y-$+>=63Dfp/@
F`]c-+=K-).3KiX-QjcG$?L9)F(eu>0esk"Gptg',9V7\4)]7`E-673$?('/E-673$7QDkF##U2
+?_b.1E\_$0F\A-F`_SFF?MZ--o3V-+<r!V+=@U*F)u/=BONYR2BXDn.6Aq&+F,CtDfp/@F`\'"
Dfp/@F`\'".1HV9/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%VDfQt7DJ!g-D..O#Df-\+@W-C2+A*bgDfTu;F!,O8AKYZ.
FDs8o06_Va/o#HGAor6*Eb-k5Df%.>DfTu;F"V-JD%-g]$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$:\rS+DG_*DfT]'
FD5Z2+CS_tF`\`u+D,P4F_u1BF(Jo*BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:04o-CF_u1PBQS*&
G[YH.Ch6L9:dn)H0fC^V@<6*;0b"J1AT;j,Eb-@@A8H'0%13OO:-pQUE+*j%+DGm>D.-pfBl7K)
F)Y]#BkD'h+>"^Q@:NtbDIjr-F`VXI@V$Z?1a$7AF<D#"F)u/:+?_b.8OccQ:*=Li@r!2706M>V
05P?30./h/6TSIe2DeZR2Dd!F0JZmBBl70'%13OO:JaJT;c?@44ZX^,F)5e</0H?47S-BS+=eQ_
4$"K3=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V:-hTC?[?'.+E2%)CEP!@BjtX^Gr%3.
A8H')-T`G!1*@hb4==rZ@WQU,/otqR-Rh,"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$4R>;67sBZ
;bTV&4ZX^,F)5e</0H<FDfB9*F)u.F%13OOF)u.?4ZX]?+?CVm-r3Z.:/b(b+=nXP.4/P8-OgD\
;aFl,FE8Qf3Zp=;%16!36#]784ZX]A+C-*J2)R0K%17/tCia8u1,Us44ZX]5+B(fs1,Us4Bcnm8
+D`/M@j`C?F)29mF)u/=BONbQ1*A_@+=A:183o*f1*C9R.UsT;+=^kK+EMU?%17/tCia8u0d&V?
+=A:183nsQBcnm8+D`/M@j`C?F)29mF)u.q8PhiM6npSR+?_b.-Ql;Y:dn)H0fC^.Bcnm8+D`/M
@j`C?F)29m%17/s0fC^K3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h+=A9Z%17/tCf3i$7860)2D?7%
Gptg',9V7\4)]7`E-673$?('/E-673$7QDk%17/i@5/lf3Zp4$3Zp*c$?('/E-67c3Zoh+0I\+h
+=A9Z%17/tCia8u0d%li.6Aq&+F,CtDfp/@F`\'"Dfp/@F`\'".1HUn$?J'Z1*A_@+>Y-$+>=63
Dfp/@F`]c-+=K-).3KiX-QjcG$?L9)F(eu>0esk"Gptg',9V7\4)]7`E-673$?('/E-673$7QDk
%17/32)ZR?3Zp4$3Zp*c$?('/E-67c3Zoh,1+==j+=A9Z%17/tCia8u1,Us4.![7'-mKj[.6DHj
FDuAE%17#rFDuAE%14Nn$4R=O$>=!qBOPsq+?_b.-m2_T+=oc=BP(ct@4l7H>q&$"%13OO:-pQU
FCfN8+D>2)BHVM5FD)e/Des6.GA1r-+DG@tDKKT7Gmt)i$6U^,0J[3"0k)q!2_eer1h&@&3AEHL
AM[pYAhl)!@Ph[S3B&^*2DSkl+>#VsFDku6G@be;F)iun0Hb%?G\CN,BHS[8D]iJ%ART*lBOPsq
+DlBHA79a+/KeaM@;R,uG]75(FD5W*+CQBJ0HahMFCcS.@<6*0%13OOE,o\[Blls81,2Nj/h1g\
C-lWV8jjeC/M/)3Blls8+E2@>C1Ums+EM+9F`8IE@rc:&F=n"0:-pQU%15is/g*u2AT2'u@<?4%
DK?q4DfQsm+A-cmGp"k!/M]17+>PW*1a$:HDJ!I#ASu!h+E2@4F(K62@<?4%DCuA*:-pQB$;No?
+B<JsDJ()6BOr;Y6m-#KFCAWeF(HJ&A7TUr+EVNE@;]LiH$X$E6>:OODeX)3@VfsmCER.rFC?d2
$;No?%15is/g,=KEaiI!Bl,m?$;No?+:SZQ67sB'+>G!ZD'13FEb[pTF@nqK+Bot,A0<rp-Xpe3
C1JH0FD5Q4-QlV91E^UH+=ANG$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*1hq/N1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f3WfDDEsiF*(i2F<GdGEbce9DBNn=ATMF#
FCB9*Df-!k%13OO:-pQUD..3k04fB>@s)m)+EM+9F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls8
;e:&nE$l)%F)>i<FDuAE+Db[5-UMNh8jlThFEMOM%15F9F@nr"ATW'6+>=63%15is/g+V;FCT6'
DBND)De!Q*@WH$gCLqN/B6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqfCi<g!6?6XGCLqN6
%13OO:-pQU@VKpoDeX)38jje7Ec6)>%15is/g+nIA7o7`C2[Wi+?_b.-UMNh8jk$9$4R>;67sBk
F_u(?Anc'm+Du+<D..6pH=_++$>OKiB4#@fDe*3<3ZoeFDfT]'Ch\3,6>URMCI;cDBl6::<[S=`
%13OOF)>i<FDuAE+=BKiFCT6'DD+UM+E2@4F(K62@<?4%DBNn=De`inF<GX9FEMOT-N       ~>
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
1GL"/+>P&o0H`,22'=Y0+?)5:+>Get1,^p22]sh22`O-<F@nr"ATW'6:-pQ_6>:O66rRZ=F`8IE
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
0K(%`Df0`0Ecbl'+Cf4rF)rI:Ec6)>%15is/g)l*C3=>H3$;X?A7]9o-rb4qDKB5rFD5Z27VcR\
.3N5@EZdtB+ED%*ATD@"@qfgn%13OO@rGjn@<6K4-VeT#D..6pH=]EZDe!QMBOPUm6W7#5:gnBc
AOg<LATMR,6>URMCJI2K.SsPoF(IjQDImm'F$a\]@r!3./M/)3Blmj'Bl5&+ASu(#BlbD+Ci<g!
+Cf(r@r!2qDIal/@<-F#+D#e+D/a<&/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JPD!F_i`d%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l*C3=>H1E^+:A7]9oFDi::@:O(o
+ED%4Df]W7DfU+4$4R>_AT;j,Eb-@@F)u/2@<6*0%13OOF)u/2@<6*W67sa/F)5MuF(c\;/M/)Y
@<6*)@;KRpEbTW/D0$h3Ec5e;:N0l_;c?@B%15is/e&._67sBT@;BFq+<Yi9EbTH7F!)T=@<6*)
+CT)!DfTQ6BPhf5+CTG%Bl%3eCh4_3Bl5%9FD,5.+AZrfDGsJ-%15is/g+V;DIIR"ATJu.DKBo.
Ci!Zn+EqOABHV&0F<EOq0R+^KG%#*$@:F%a/g*W(Df$V*DBL'?EbT0#DII>j$;No?+Co&#D]j+2
EbTK7+C]U=:gnET@;I&Y@<6:"DBO.;FD)e*A867.FDYT,FE8R6Gp#FfCht4f@;RV+$;No?%15is
/g,=KEaiI!Bl,mRF(Jo*BQS?83\N.1GBYZXE+Np.F)3IIEb@$7$;No?+:SZQ67sBoFEDI_0/%Nn
G:mWODe=*8@<,p3@rH3;C3OB-BeN:kF(8Wp8mudXBl5S&83nOW0JOk/6R=KA1*n\0@;]U%1,)Ej
2'k"3AoD]91,*odDId[0Et&IO67r]S:-pQUBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQB$;No?+<Y_\
2)ZR"/Kdt_5r(;U+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EKCp1*@\k+B(fs2)-j/BOPsq+D,Y4
D'2VnAStFF9FV>(67sB'F(eu:+<W6Y;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EMQX2D?7*
+Atd-7860%0fC^.BOPsq+D,Y4D'2VnAStFF9FV>(67r]S:-pQU@rc-hFCeuD+>PW*1eMn.1,o^M
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0f3WfDDNsh@q]:gB4YTrFDi:BF`&=?DBL_j+C]&,+EMgLFCf<1%15is/g)l*
C3=>H1E^+:A7]9oFDi::@:O(o+ED%4Df]W7DfU+4$;No?+>G]fF_i`j+Co;)+E2@>FDl8HE+O)5
@:X+qF*(u(+D,P4+E27>FCAWmCh\!:%13OO@rGjn@<6K4-Za?FBOPsq-OgCl$;No?.V*+0ASu$i
DKKq/$4R>;67sC"Ec5Q(Ch4_9+ED%5F_Pl-+EqaEA9/k:-n6Z//g*_T8P`8-<DGhS71BS5$;No?
+Co;)06;%SBlbD6@:NtbDIkJ>F!,OCARfFdBk&8;+CT>4F_t]2+DPn<+?1u-1*C:P+DG_7FCB!%
ARl5W:JaJT;c?@Q3ZpL48Oc9I;]mS5-p'I;=(uOp9PJBeGT]:iA9)U&A0=9KEd)58-Rg0P/g*8V
:-hTC.3Ns[-Z!L+ARTj?1+m*RC`k)e+=Juf,To2sCh[@"F)3IMD]gDV4!5q,+=&'l-Z!L+F)u.M
A9i!*@N[$I%13OO:-pQU@ps1i+Co;)%16TU4ZY;T+Z_:d$4R>`F)5o2@59\u4ZX].+<W(.:dn,X
;bS;b+=A:183o!g2BY1+.j0'Z.UsTG+=^kK.4/P8%17/tCia8u2)-jL3ZoOf+=L#^78?c[9HYl/
-Ql>Y5rCAP+?gnu+F#"Y@j$"=.UshT-=^Qq$?L9)F(eu:4ZX].+<VdL-r3Z.:/b(b+=nW_+B(fs
0d&Y&.j0'Z.UsTG+=^kK.4/P8%17/tCf3i$7860)2D@9T+=L#^78?c[9HYl/-Ql;Y:dn)H0fC^.
4s2?uGT\JG+F#"Y@j`]P@q6#U%15is/h1FMA7T7jASu$iDKKq/$3                      ~>
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
