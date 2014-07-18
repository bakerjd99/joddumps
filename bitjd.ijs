NB. JOD dictionary dump: 18 Jul 2014 14:35:46
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
0ek[20esk-+>GYp1*AJ51E\G0+>P&o2`EW;1,'h++>Gf72BXb0+>P&o3&3010fU:2+>GZ20d&5,
+>P&o1b^a/1,9t-+>G],2]sk7+>P&p0fL401*A=p1-%990fL41+>Gf/1a"P-+>P&o0JkR.3$9t!
2`E``@<6!;3(%@j@r"G11,U^<+@@@rAp&!$FD5Z2+D,Y4D'3M6FDu:^0/$sPF*'$IBln$2@P2//
D(e7pA7]gRDF8)GDf[Qf0fLsM2_baK0/!bA0/"GhBQ&*/DJ()*Dg*=GD]iP.DK]T3F<G[D+@9LX
AMlG7BOt[h+D,P4D..Mq$4R=O$?1,sCh[B%F*(i4Bk&9,FE2)5B-9W\@rGmh-t7IDAQrF_A79Rg
.1HW2%143e$4/@=+@KdNDe*E%@X3',>?r@nD]hA\B1Zu_AS5Rp%13D.BkL"TFCf)rEZf(6F@9PZ
@3@]U0KT^N$"e*r+=LrAF<G9?4WlF?+DDr\+Cno&@4k5bDJ+')4!85f.k(o7$%!*g#mk<`F@9PZ
@3@]UBl8#\@<>p#.NgK(2BXLmA79Rg>A7A)%13Di%143e$4/@=+@U0XDe*E%6>:((DKKH&ATAo8
D]hATF(I3g+EMXFBl7Pm$41cqEbTE(+ED%7F_l.B4Wkpm3t2N'GA(],AKWC8DKJ9TFC?:U+>>5R
$42%g$4.#QDKI"AASkjiDId=!+?^hqBl8#A-u!R@6t(1G+=/-f3%6ou$4.#QDKJ9TFC?:F4WlUA
3t2N'$$'TuF_l.B4Wm.,B5)I/>B4:l@;0UiATD'!.j/kDF*2;@3t2N'I16N+%13Cp0-EQ"E+Not
+CHp3+D,P4+D"tkBHV,&@:X(iB-8lN@X3',%13DRDfQsKBl8#8BcoP]0KUCk+?UcW@<>p19P&*S
FD)dD-6Qi-FCABf>p)9n+>>l"Be(\_%13Dg%13CJEb0<7Cigd_+=Alk+=eRTATN!1F?9p=$%36i
$$'U!F`M@BEb0<7Cih`J$@N?j+@9LXAMlGGFCAZp:Ng;iAo)C0:2b5cF##UJDffQ3+E)-?2DlUd
H$!U?E-5W+Bk&9$AU/>>FDi:2@<6!&2)l^jEc5eU%13OOBQS?83\N.-FCAZpDg#]4Ao)C0/n8g:
06),GF*),7DK@Hc3ANBH0JtX>BOPsqBl7Q8Ao_g,/R^5MF^f0$@kDJ-GqF,V/R^5?Blmj'Bl5M2
A7T^lF)rpIDCog@E"*-`$4R>6+CT+0FE2Y@DJ()6D]iY1Ci"$6+EV:.+DG_7FE2M6FD5Z2F!,L7
EHPu9ARlp*D]j.EEc*".+>u)"@X3',+E2I4Ch[B%%16l^Gp$g=FDi:1+C]&,@rH(!+CSekEb0<5
+E_a>DJ()2BQ,RH<+ohcBl8!6Eckl6Bl@m1+CT;%+E;O<FCcS+G]7J5@qg$;+:SZF@;[2rDL$/<
AKYYtCiCM6AKZ22FD)e=BOr<*Ea`I"Bk(RfBlnVCDe:,&DeX*%+EV:*F<G:8+E2"557Ir/$;#,V
FE2M6FD5Z2F!+n3AIStU$8EYT+B2cbAKZ).AKYK$EcP`4E,TW)Bl7Q+E-5W+Bk&9$AU,D2ASu("
@<?'k+EqOABHV#2+=K-*+C]V<ATKCF0d'qNFCcRKGVCs*+:SZ61*C%OFCfM9@rHC.ATMg/DIdI!
B-;;7+BTarDf9Z,Bl7@$ALnr[1*C%OFCfM9@rHC.ATMg/DIdI!B-;;7+B]gsDf9Z,Bl7@$ALS&q
%14dG2)%!J1I4De1dO)[5t*b!1.F\l1IEl_7PR1g1b^^Q68^Pg2)@ZX3&X/a2)-gR5t![u0JkaK
2aoSj1,CdC1.+Gd2_[!D1GgsF5r(G\7R9%'2`EKJ2`EHL0ebCL6:3I^5qtbs1H7?O2+9nk7P[D$
0fV*\3C>Y`1."8b%13OO1*A.k:h=ZZDfT\;;b02+1,Us4BOPsqBl7Q+Df-\>BOr<*F^f0$@j#Pu
Gmt)i$8sRl7Rfg'1,;0Q75-DS1GM0Q3AiZQ5rD"s5r:Je6SUPV3A`QI3AE3A2D[*F5r:DW6:=-q
6od4p1dX#Q3"63($8WeV+AcWiAoD^,+Atd-7860%0fC^.BOPsqBl7Q+Df-\>BOr<,ATN!1F<GL6
+B(fs/M]1A%13OO0JP7A2E!KQ2D?gC3AiT\2)R9N1c%-\2+9;]7Q<:l0LRZT1I=N!%13OO1a"@m
6"FLKG%G]8Bl@l3@X3',+DG^9Ao_g-F<GL6+Atd-7860%0fC^.BOPsq+=Jpg0JFV]DfQsp@;0U%
:1\NkDfTVB%13OO0JG180KD$L2`EWK0K(pK1IO)X2E*HK3CPeo1H@oa2F0#b1,h!U77@Xm%14s8
/Kdl$Eb961D'2bJ5qOiL2BZ[AF(c\7DBO%7AKYQ/FCf?#ARlo]8PhiM6nL,O0HbCIF*2;@%13OO
1c.'W2aKDW0K29X1IO2]1G^aF3&3HQ6:*I`0L7Zf75@8"6:<Rp757+c2b#Jj2)%?a0ebp[76!+]
6SLMW%13OO2BXRo:h=ZZDfT\;;b02+1,Us4BOPsq+E)-?FD,5.Eb0<7Cige<Afu2/AKYr4AThd+
F`S[(83ng_2)ZRj@<6)k$4R>12DI3M2b#\]6T7D$0fUsL0f20Q5t*Uf1.+&k2F0_g6o6eW6U`e!
1,h-N3B/]O2*s#O2`<BJ6SUkd5r12($4R>$+>"^8@;BEsFD,5.Anc:,F<EC_@X3',F!,C5+EV:.
+EM+(Df0).;b02+1,Us4BOPsq/g+,,BlbD2F!,R<AKYDlA9)7&F!+t+ARfLsF_qQp%15K]0f_-N
7Q(\_%15';/Kd>iA0>u-AKWfP@q]F`CNFW8+C]V<ATJu+Ec5e;E,TH.F<ELb@<<W6BOr;tDIal.
AftZ0FCf?#ARlo]8PhiM6nL,O0Hb%;F(c\.Ec5e;E,TH.F<ECm+B3#gF!,1<+EV:.+>Pf+@X3',
+C]&&@<-W96>:OODeX)36"FMHATMoF%13OO0JG180KD$L2`EWK0K(pK1IO)X2E*HK3CPeo1H@oa
2F0#b1,h!U77BU&0f_-N7Q(\_%15*</KdE!DK]T3F<G[=AKZ#)F*2;@+D,Y4D'370@X3',+EMXF
Bl7Q+Bl8$2+CQC%@<6!;3$<9aEbTE(+E_a>DJ((Y@<6!;3(%@j@r!2uDI[TqBl7Q9+B3#gF!,1<
+EV:.+Dl%<F<G(3D/F3/Cj@.GF(Jl)6>:OODeX)36"FMHATMo8AoD^,@<;qc%14gJ<Hh,13DsR4
@l$to:iSg%G"Zac88U[j2g7u<C3E<<@<6-m6>URMCI;cDBl6jk@<?QG0ht%f.RIQbBk'JGDe!QM
BOPUm;flGiF!,NU/KePAD/aW>AKYGjF(o,,@VfsmCL_$dBl5&7FCB9*F*),+F"Rn/%15is/g,4W
@;]UaEb&m1AKYu8ATE&=AoD^,@<;qcAoVj:4ZYAA3ZoejAR]-l-RU#a-Qjg//g,E^AM,)m;G9P2
<'`i"I3<e_%13OO:-pQUEb0*+G%G_;D09Z:BlIm"+C].qDJO;9-t?q!EZf:<Cj@H=$?B]e@m)kY
+<u=X><3lY/g)Ma+=AL)/e&-s$;No?+EV%$Ch4`)AU,D.Dfor>Et&IkA0<7?ART+j+Cf>4DKI"#
Ea`j,@:OCnDf/*SF(c\.Ec5e;FE27H%16i\+=D2@@:XF%@rHL-F<F.mE-67n@<6*)Ao_g,+DGe:
-OgDtA0<7?ART+j+Cf>4DKI!sF`_SFFA$1j+D,Y4D'3b9F=.M)%15is/g+SGB.P0B@<a=GD/!l1
@VKpoDeX(u$>O)o-ZWd,A9/l%G%VpnF`_SFFB2gdF_**HD..Z3:N^buF`^YmCis;?+Dkh1+A[-%
E-68'@;L't/0JG@F`):D:N^buF`^YmCis;3Ao_g,+E)4@-OgDtA0<7?ART+j+CTG++A$HiF`]od
Dfor>/0Je<GT]RqE-67gD/XQ7F=\POBl5%bDK'`?6#CO_DKIEP@rHL-F<F.mE-67gD/XQ7F<G19
Df$V2E-*H:$4R>;67sBhFECr$BHV,"@V'@s%16i\+=D2@@:XF%6$?l`:N^buF`]ZQG%VpnF`_SF
FB2gdF_**H9jr8h:N^buF`]Z]@<`njF`_SFFB2gdF_**H9keJf:N^buF`]Z]Bl5%hF`_SFFB2gd
F_**H6Z7*bF?3oMF`):D:N^buF`^YmCis;3Ao_g,+E)4@-OgDtA0<7?ART+j+@10`+A$HiF`]ZQ
G%VphDK'`?6#CO_DKIEP9jr8h8T&KiF?48IGT]RqE-67gD/XQ7F=\P/Bl5%bDK'`?3c/SK+A$Hi
F`]odDfor>/0I;uF`):^@rHL-F<F.mE-67gD/XQ7F<G19Df$V2E-*H:$4R=O$;No?+Dl%;AKYK$
D/a<&GT_!KATDKrEt&Hc$;No?+CTG)Ea`Tl/0Je<GUstSBl5&2Df0l4Ec3(7DK'`?F!+q;+EM+1
ARfgnA0>u7@;^-p@ruF'DK?6oC1JH!EH6=I0H`D!0F\@3Eb/ZiF!+t1F?3oMF`):D<,uDbF(&R#
Bl@lYCLqcB%144#+<VdL+CTG+3am2E+A$HiF`]odDfor>/.Dq/+<VdL+<YN0GWK\MGT]RqE-67g
D/XQ7F=[k.+<VdL+<VeDBl5tKBl5%bDK'`?6#CO_DKH<p+C]U=<,uDbF(&R#Bl@lYCLqc#$6Wr$
Df$V2E-)Nr+EqL1Eb,[e+<VdL+<W(HE-*^3Ea`j,@:OCnDf/$[AU,C^+>Y]*0JFpu@;]Tu-qS;q
F`]odDfor>+?go%.1HV5%13OO:-pQU@<Q4&@:s-oD..Z?+Dkh1+Du+8H=_,8+E)CEE-68D+C]U=
F(K0!@ru9m+EVX4DKB5rFD5Z2Et&IkA0>K(Ed8c]+?CW!%144uART+j+Cf;23b*)NDKI"#Ea`j,
@:OCnDf/*SF(d*6$6UH6+<VdL@<Q9E@<Q9+:N^buF`^YmCis;?%144#+<VdL+DkP33c/;M+A[-%
E-68'@;L't/.Dq/+<VdL+<YN8DE;WKDBM_tFDuAE<affeAISth@X0(*$6UH6+<VdL<,uDbF(&R#
Bl@l[@<6)k$6Wr$Df$U+$6UH6+<VdLDfBe-$6XP+ATD>k$6UH6+<VdL-r4u-E-68'@;L't+?go*
0I[G<.1HUn$;No?+EM[BD..I!H=\48@<-!l+EVX4DKB5rFD5Z2Et&IkA0>K(Ed8c]+?CW!+:SZ#
Eb/ZiF!(o!+<VdL+<Ve:Dfor>+DGe:/kKr"F`]odDfor>/0GB/+<VdL+<VeJF_r78E-*^(DK'`?
6#CO_DKIEP%144#+<VdL+Cf>4DKI">E-*^.F`_SFFB2gdF_**H%144#+<VdL+EM[B+E)4@/l-V3
E-68'@;L't+:SZ#@X0(=%144#+<VdL+EVXA/lZk"DKB5rFD5Z27VcR\+:SZ#Ao_g,+:SZ#+<VdL
+<YcHDCfmMDE_cRF=_NSDE_uXF<D#"+EqL1Eb-@&$6UH6+<VdL-uX'H/l-V3E-68'@;L't+?go*
0I\,QDIak<BlJ/H8T&KiF?sb^F`):D4s2O.%14ONBlmj'Bl67RDe!Q]@q]Fj@8g#s1,W!-9H\Cd
BOu$h+D,P4+C]&,@rH(!+C]/*@r$-.Ao_g,3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;B6%p.A8,k&
05P?3@VKpoDeX)@E+O'+04Ja9@P;S,F*(u601'Ap@rH(!0195j@:EYdAM7nGF)c"JF(8lpD.,&<
EGQ'k%13OO6W-?=<(.p/5se76+C]/*@r!28%144#+<Y?+F(c\+BOPp01GUC%@VK^gEd8dHEbTB!
Ed8dCAU,g9$4R=b+<VeMATDj+Df-\3DKKH&ATB=2$6UH6+D>2)BM`_\Fs%o;BOPp01GUC%@VK^g
Ed8dFDfd+>F_kkF%144#+<Y?+F(e9ZEbfK&;K$Jq+Cf(nE[W_!.3N)6DIIR2+Du+>+Du=<Cb-#&
+<VdLDH(=eAKY])FCf)rEZfLBF(o9)ARlp$Dfd+>F_kkF%144#+<YPgBlnD=Bl8$(B4Z*+F`)87
B5V9k+Du+>+Du=<Cb-#&+<VdLDGG+f@q?c*+<VdLBl8$(B4Z*+F`)87B5V9k+Du+>+Du=<Cb-#&
%144#+<YlHEbce0Ci<a(+<VeLDKBN)DIm?0%144#+<Y3+E-,b9Bl8$(B4Z*+F`)87B5V9k/.Dpq
$6UH6+DYP6+=Lo3F(e9ZEbfK&;K$Jq.4bo8+<VdLCLqc6-tm%1BM`_\Ft!k-+<VdLCLqc6-tHn.
FD**4$7S%G$4R>0;FNlN73GPq6;0fjFE1f-F(&R#Bl@l3-k-M++<Ve?@<6*)@q]:k-o3V-+C]&&
@<-W9E,oZ0@<-W9CLqcB%144#+<Yi=EcYr5DBNY2FCf)rE\%Y,+<VdLCi<g!<,$2\+DG_8AS5Rp
+E_RCBkM<pA1S/s+<VdL@rH(!@UX=h+C]8-Ch7$m%14OG%13OO6W-?=<(.p/5se76+AHEfCM[Qh
FE1r(+=I[++<VdLEc5l<+Cf(nE[W_!.3NbNF(o9)ARlp$Dfd+>F_kkF%144#+<YB/GT\,CDKKH&
ATAo9DKBN)DIm?0%144#+<YWDBl.:!Gp$m6Gp"MUDf9_K+DGA2.4bo8+<VdLCLqc6-us6EF=@Y+
.6@tG%15I#76smA+BD'&=!2[#ATqKjCi<g!+@/p8$<'Ae771#s%15Wp==@ikF(d!F@<3Q)@<6*5
%178iEcYr5DCc5(84?W/BOPsq:i^,j.3N&?+D>2)BM`_\Ft=(084?W/BOPsq9kA?\Ch6L_DfdEN
@<3Q)@<6*VATDR&AQ!GbF=[k.DH(=eALn8tDF/&ZF"@b-DGG+f@q@2#$?pE/CFfo%A7]_%BFP;<
;GU"0@VfsmCHDt4%13OO6#LU_BOu3,CghU-F`\a<Ec5eU%13OOBQS?8F#ks-@VKpoDeX*2@;K^3
DfTJDBl7HmGV3rKE'JG_E+rfF2)$jE3%clo$4R>0;FNlN73GPq6;0fj@VfsmCNCUH+:SZk@<6*)
6V'L@-o3V-+AP^3+APp19HZ\u:/b+i5tOgN+C]/*@r$-mE,-Rm;FsSK;HY,879M/N$=daXBl7!j
Ebcda9M[tt:/=h3:/st]/.Dr"ASGdjF<EnA7nHHT+AP^3+APp19IpV[BOtU_ATAn[9M[tt:/=h3
:/st].6@tG%15I#76smA+B1Wn9LU(FATW$.DJ+#5-m/s+DIIBn+BCd+6V'L@-o3V-+AP^3+APp1
9HZ\u:/b+i5tOgN+EM+9FD5W*F'im%+Abs-9gMZ[+A5.+/.Dr0@;L't+@8at67Fu*$4R>0;FNlN
73GPq6;0fjFE1f-F(&R#Bl@m1+=J?A$><jhBHU8C=B$D<:K/H3<D6(/6VgHU<)Q"R:/i?XEa`j,
@:OCnDf0W'E,-Rm;FsSK;HY,879M/N$?g!$+A#=-77TdE+AP^3+APp19IpV[G%ki$F*\s#:/jYP
78b7':K/H3<D6(;%178sF`^u3H6>dS<(0;G;BS_1<$4q99M?uH$>aWjCL;0tD.Oh]:/jYP78b7'
:K/H3<D6(;%17/jH=\3j:/jYP78b7':K/H3<D6(83t2N+$:@][5u^8q<'`iE73H\m@;^-p@ruF'
DKB0!DK'`?+=J?A$><jhBO>^eEb0-1?Z^N8<(0ng+AP^3+APp19IpV[F(96)E-,H.BkJPf79EM3
:/=h3:/st].6@tG%15I#76smA+B1Wn9LU(GEa`j,@:OCnDf0W'Dfp/@F`\`S+:SZk@<6*hE+*cu
DKK6-GT]sS=B$D<:K/H3<D6(;%178eCis;3;FNlF+AP^3+APp19IpV[F(96)E-,H+F^e]nAU,Ct
79EM3:/=h3:/st].6C4A@:Vtu6>URMCI;cDBl6=*1,2Nj/g*i+@:UKQ6m,rTDe!QmBOPUm+Cno&
@:EYdAM+E!%15is/g,4W@;]UaEbTi2F!+'tE+*j%+Co&"Bl.R+ATAo8D]j7<DId[0F!+q#@r$.%
@<6*)%17;nDK'$+BQIa(4ZXrq-RL5i-SHhi8M37h4Wn#ZI45U4%15is/g,:XAKY_u%17,eEHPu9
AKW@2@<>p2C1J\$$4R>;67sBjCh7$q+CSetBl4@eC1La`D/!l10H_JI$4R>;67sC%ASbpfF<G+'
+>"^WBQ&);Ci<flFD5Z2%16i\@:X4hDKm9O@VfsmCL_$dBl5:-$?L'&F`_SFF<G=/@:X4hDBL;S
%13OO:-pQU@rlf9Bl.g-Ec`F9DerrqEX`@C;cZ@`9LM<I4ZX]T4ZX]5IWT.<E%bs:04T'H04Ja9
@r#Rf@;0U4-OgCl$;No?+Co&"ATVK+/n8sG+CT.u+>./7AS-!+Anc'mEt&IkA7T7fATVKqDerrq
EaNQl?Q_fI$>O*]Eb/[$AS,jsA7]dgC1LZo7N`-I%15is/g+YBE-WRH@<Wi)@<>p#FDi:3F*8[?
D/aE6F:ARD4ZX]6C2dU'BHS[O6>:O66ptI*@4*KT-Yd1%F*92a%17/iASc0*.!KBCE+*j%F(K;5
-[9->E-WQR/4(m8Bl7m4FE92k0KCaqF*8oR/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBC
E+*j%F(K;5-[9->E-WQR/4(m8Dfp/@F`_[[0JGL>@rlf@+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(
BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-ZjB;DKB5rFD5Z2F##F'3A+f_Fsegg+=A^TE+*j%
+@[e2-Qk'`-OgCl$;No?+Cf>/Gp$U8CisT4+Co%qF!(o!F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3
+=A^,/15.LE-68D1,(CB/n8F'Aof=B/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%
F(K;5-[9->E-WQR/4(m8Dfp/@F`_[[0JGL>@q9._F!i(]-QjcZ/8B-4FD)dd.4chh068KM$?Kll
Cht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic67aL+Ea`j,@:OCnDf0VO0JGL>@q9._F!iLd+=A^TE+*j%
+@[e2-Qk'`-OgCl$;No?+Dbt)A0>u7@;^-p@ruF'DK?6oC1JG7A9)U-FCAWpAKZ)8DC6PL%16i\
+=CZ?G&h+9061uTF!*.ZFE1f-F(&R#Bl@m11,(CB/n8sG+EVXA-Qij*%15is/g+tK@:UKpDK'`?
Et&IkA0<71Ec5o=@:F%a+DGe:-OgDtA0<70F*;S7+>7bRGB4l\+DG_4F`_[[0JGL>@rlf9BlJ/A
%13OO:-pQUCi<`m+E)CEE-68D%16i\+=C]?DfBf,@VfTuDfBeG%16i\+=CZ?G&h+9061uTF!*.Z
Dfp/@F`_[[0JGL>@rlf9DfBeG+:SYe$;No?+EM+9+ED%*ATD@"@qB^(%16i\+=D2@An?!oDI[6#
FE27A<,uDbF(&R#Bl@lYCLqc6BlJ/:<,uDbF(&R#Bl@lYCLqc=%16i\+=D2@An?!oDI[6#FE27A
<,uDbF(&R#Bl@lYCLqc6DfBe@<,uDbF(&R#Bl@lYCLqc=%13OO:-pQUCi<`m+ED%4DfTq/$?L'&
F`_SFF<G=/+=CZ?G&h/5DfTqB04lR@$;>AHA4f6ZF_kk\Ci<g!6YKnBDF?fH0ht%f.SObhA4f6Z
F_kk\Ci<g!6YKnBDF?f6F"JsdCi<`m+DbJ,B4Z*+8jje2Ci<g!@q]:bDBNIuFCAWeF(Hs5$4R>;
67sC%FCB&t@<-(.ATJtd+E1b2BHUhsCh[a#FCfJ8FDi:GBl7I"GB4m9@:O(oCghBu+:S[%Bl7lu
FD,`,E'660>ULjH-mpYq+A"1N3^"Tk.=EWS$4R>;67sC'F(HJ/A.8ldAT;j,Eb-@@A79Rg05>#F
%13OO:-pQU@r,^bEZee$D/!ks$>O*[A8Q$u+>=o\%13OO:-pQU@rc-hFCcS*@N[6FF(fK9+Dbt+
@<?4%D@HqfA79"cBl8/<-Xpn1@r#\!ChtI.$?L'&F`_SFF<G=/@:X4hDBL;S%13OO:-pQU@rlf9
Bl.g-Ec`F9DerrqEX`@C;cZ@`9LM<I4ZX]T4ZX]5IWT.<E%bs:04T'H04Ja9@r#Rf@;0U4-OgCl
$;No?+Co&"ATVK+/n8sG+CT.u+>./7AS-!+Anc'mEt&IkA7T7fATVKqDerrqEaNQl?Q_fI$>O*]
Eb/[$AS,jsA7]dgC1LZo7N`-I%15is/g+YBE-WRH@<Wi)@<>p#FDi:3F*8[?D/aE6F:ARD4ZX]6
C2dU'BHS[O6>:O66ptI*@4*KT-Yd1%F*92a%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR/4(m8
Bl7m4FE9$BCht_6F*8oR/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->
E-WQR/4(m8Dfp/@F`_[V@;Ka4@rlf@+=nl_-QjsTE+*j%+@[e2-Qk'`-OgE(BOu!r+=MGJDK'$+
BQIa(+=DDDDfBtE-S.S8-ZjB;DKB5rFD5Z2F"Lg:CbB4=Fsegg+=A^TE+*j%+@[e2-Qk'`-OgCl
$;No?+Cf>/Gp$U8CisT4+Co%qF!(o!F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3+=A^,/15.LE-68D
/R`I3/n8F'Aof=B/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->E-WQR
/4(m8Dfp/@F`_[V@;Ka4@q9._F!i(]-QjcZ/8B-4FD)dd.4chh068KM$?KllCht4BGA1r6@<?1(
AT/b>G[kZ2Gp"Ic67aL+Ea`j,@:OCnDf0VJ@;Ka4@q9._F!iLd+=A^TE+*j%+@[e2-Qk'`-OgCl
$;No?+Dbt)A0>u7@;^-p@ruF'DK?6oC1JG7A9)U-FCAWpAKZ)8DC6PL%16i\+=CZ?G&h+9061uT
F!*.ZFE1f-F(&R#Bl@m1/R`I3/n8sG+EVXA-Qij*%15is/g+tK@:UKpDK'`?Et&IkA0<71Ec5o=
@:F%a+DGe:-OgDtA0<70F*;S7+>7bRGB4l\+DG_4F`_[V@;Ka4@rlf9BlJ/A%13OO:-pQUCi<`m
+E)CEE-68D%16i\+=C]?DfBf,@VfTuDfBeG%16i\+=CZ?G&h+9061uTF!*.ZDfp/@F`_[V@;Ka4
@rlf9DfBeG+:SYe$;No?+EM+9+ED%*ATD@"@qB^(%16i\+=D2@An?!oDI[6#FE27A<,uDbF(&R#
Bl@lYCLqc6BlJ/:<,uDbF(&R#Bl@lYCLqc=%16i\+=D2@An?!oDI[6#FE27A<,uDbF(&R#Bl@lY
CLqc6DfBe@<,uDbF(&R#Bl@lYCLqc=%13OO:-pQUCi<`m+ED%4DfTq/$?L'&F`_SFF<G=/+=CZ?
G&h/5DfTqB04lR@$;>AHA4f6d@<-HVCi<g!6YKnBDF?fH0ht%f.SObhA4f6d@<-HVCi<g!6YKnB
DF?f6F"JsdCi<`m+E1b0FD50"+A,$E@VfsmCL_$dBl5&(@<>pe@<6!4%13OO:-pQUF*(i.A79Lm
H=_.?8g&(]FD)e-ASc'tBlmp,+EVNEGA1r*Dg-7F@UWb^F)59+BHR`kGA1r6@<?1(AT0dn-X8#G
-n$Gr-Qku55WV%N>q(1N%13OO:-pQUF`V+:C1Ib\Eb065Bl[c--Y-Y-@4uA+-OgCl$;No?+Cf5!
@<*K!A8Q$u%16i\@:X4hDBLVU+:SYe$;No?+CfG'@<?''A7?Z5+EM47G9C^?@psInDf-!kC1La`
D/!m4+=CW7De!R%@<-H;%17/nDfp/@F`\a@A79"cBl5%@-OgCl$;No?+CfJ9+DG\3DfTqBAoDKr
ATA4e6W7#T:J=/F;E[&`7QidT-[p/KD/_.CA1qG6Ft[<@De!QmBOPUm0..29%15is/g+\9Ch7^"
+=]!RF*8[7DIak>/n8F'Aof),Bl%@%%16i\A7]RgFCf'&Ch.*t?YX+Y+@ZeIC1LgpART[lAoDKr
ATD-mA7$HK+:SYe$;No?+Cf>/Gp%-9G9CF)FC?;6D]iP2Fs(L9E,Tc=%15Eb3ZohcE+*j%+=DV)
Blls86t(1G-RgSoC1LgqFtY3P$?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic67aKuDK'`?F##F'
3A+f_FseC`-QjcZ/8B-4FD)dd.4chh068KM$?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic67aL&
F`_SFFE92k0KCaqF*8oR/12Pf+=q8H@<?0*7O]l9+>7d`%17/iASc0*.!KBCE+*j%F(K;5-[9->
E-WQR/4(m8FE1f-F(&R#Bl@m11,(CB/n8sG-S-Vf-S0"O@<?0*7O]l9+>7d`%13OO:-pQU@rH=3
+Cf>+F_u"=A7]@o+:S[!BOu!r+=MGJDK'$+BQIa(+=DDDDfBtE-S.S8-Y[I;F`_[[0JGL>@q9._
F!i(]-QjcZ/8B-4FD)dd.4chh068KM$?KllCht4BGA1r6@<?1(AT/b>G[kZ2Gp"Ic67aL&F`_SF
FE92k0KCaqA7]@o-Qjrf+=A9_C2dU'BHTbn/12PnF!hD(F(f-$C`k-MBl7luFD,`,E$-NQ@rH=3
+=A^,/15O[@;^-p@ruF'DK@Qe0KCaqA7]@o-S-Vf-S0"O@<?0*7O]l9+>7d`%13OO:-pQUCi<`m
+EVX4DKB5rFD5Z2Et&IkA0<71Ec5o=@:F%a+EVXA-QjN@$>O)o-Y%4@Eb$:GEc6/C+>=p[Ea`j,
@:OCnDf0VO0JGL>@rlf9FE27H+:SYe$;No?+Dbt)A0>T(E-68D%16i\+=C]?DfBf,@VfTuBlJ/A
%16i\+=CZ?G&h+9061uTF!*.ZBl7m4FE92k0KCaqF*8[?E-*H:$4R>;67sBsDdd0!Dfp/@F`_[6
$>O)o-Y.79E-,MtCh4`-E-*H:$>O)o-Y%4@Eb$:GEc6/C+>=pVF`_SFFE92k0KCaqF*8[EE-*HM
%13OO:-pQUF(KG9Eb/ioEb0,uATJt'$>O)o-ZWd1ATD@"@q?d)Ec*"!Ea`j,@:OCnDf/$[AU,D4
E-*4%Ea`j,@:OCnDf/$[AU,X4$>O)o-ZWd1ATD@"@q?d)Ec*"!Ea`j,@:OCnDf/$[AU,D:E-*4%
Ea`j,@:OCnDf/$[AU,X4$4R>;67sBsDdd0!Eb03.Ec_`tF)>i<FDuAE+DPF0-Y%4@Eb03.Ec`EW
Ag\#p:et"h?VYN[D..6pH=]EZDe!QMBOPUm6W7#@0ht%f.Sro><*rC=Ec#6$BmO>WCi<g!6YKnB
DF7?'+EK+d+E27?F<GOCDe!@"F)Q(O+:SYe$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8ATDBk@q?d,
DfTA:F"'-Z$;No?+<Ve%DfT]'Ch\3,7<iciEcaZI<^pe>ATJt::-pQUDJsQ4@;KY(ATJt];cY#P
G]7SAF<G10Ch7Ys$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+<W%,DfT]'Ch\3,6>URM
CI;cDBl6::<[U^>;cI+FF)5MuF(d<`:-pQ_:et"h?ZU:)BOPsq+EK+d+E27?F<GOCDe!@"F)Q(O
+:SYe$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+<VeJ1,Us4+<XEG
/g+(`5r(;U+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+<Y__0esjo+AP6U+B(fs2)-j/BOPsq+D,Y4
D'2VnAStFF9FV>(67sB'+EM4)0d%S]:-pQU;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+<Y`G
0fC^.+AP6U+Atd-7860%0fC^.BOPsq+D,Y4D'2VnAStFF9FV=X%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`Bl8!'Ec`EH-Za?FBOPsq-Y7.'Bl$USF(8Wp8mudXBl5[`ASkjiC`mS+F)tc&AKYT*Df$Uh
+E2@>EbBE$D/F!)B-:f)Ecl4AF*2,.ATMs-DJ(($$>=@%+EVNEBl8*4CLnVd8PhiM6nL,O0Hb%;
F(c\+De*E%Ao_g,+A*(M%13OO:gnET@;I&Y@<6:"DC6QMBji,\Ec5T2@;TjqDJ'Cc8p,"o1,U1&
1E^4:H#k*:B5]4.$4R>aD]j">DeF*!D/F!)B-7Wj=`8F*@ps6t@q]:gB4W3-BOr<-F)5e<4ZX^%
Bl7K)Bl5&.3&!*1FDi:@DeX*2+EVNE@VK^4+<XI%BOu4.Bldi.FD,B0+Dtb%A9/l3E+Np.F)2sI
8K`+gBl7]/@;L-rH#k*:G%#*$@:F%a+E)-?Ch[d0GT^F4A0>_t@jrNC;Fs\R9gg]o0Hb(N+Cehr
Ch7-"FD,]5F_>A1F)iun0HatMDI[d&Df.0:$4R>9Bju*kEd8dAF!,('F*(u6+EV:*DBO.;DId[0
F!+q7Bl%l6Bl5&(Ci"/%$4R>_AT;j,Eb-@@A8H'0%15is/g,1GEHPu9AKW@ABOPplF!hD(F)u/:
+?_b.8OccQ:*=Li@r!2706M>V05P?30./h/6onRKE+Noc;bScEBl5gc>[hDb>UKsf:-pQU:JaJT
;c?@44ZX^#E+*j%+=DVZH#n(=D(fsOCh7%#1GURnCht4A%15is/l,;4:/b(b+?_b.F)u/:+=nW_
>]Xt&ARTj?1+m*RC`k)7$;XJe:/b(b+?_b.F)u/:+=nW`8Oc9I;]mS5-p'I4-Wb#"+A?KeFa,#p
DIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J.3NSD@r!27Ch[?i@<jXa/nAd7+=B5n-o)nj+?V#f
Bju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.MA9i!*@N[$I%15is/l,;4:/b(b+?_b.F)u/:+=nW`
8Oc9I;]mS5-p'I4-Wb#"+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J.3NSD@r!27
Ch[?i@<jXa/nAd7+=B5n-o)nj+?V#fBju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.M0J5@<3%e`e
Ch[?$-RfK3;c?@Y+?_b.F)u/:+=nW_>]4RmDKBl8-OgE(F)2s^3Zp."3Zodu:JaJT;c?@4/0JdY
-=^R6%16!36"4PMF!*V,+>u%c$;segE((m43Zp4$>p)$_2)@0#$?L9)F(eu;2)ZR?3Zodm;b020
2)ZRk+=^kDC`k3;-QmJOC^g_mF)5o2@5Tbp+?_b.-Ql>Y5rCAP+DDrJ@j#S1.UshKF)u.,$?L9)
F(eu:+?_b.-Ql>Y5qsKr+=^kDC`k3;-QmJOC^g_mF)4`G:dn)H0fC^.4ZX]5+Atd-7860)2D?7f
+=^kDC`k3;-QmJOC^g_mE\TI+4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V-OgE(F)4`G:dn)H
0fC^..![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$?Klh0d&V?+>Y-$+>=63Dfp/@F`]c-+=K!!
.3KiX-QjcG$?L9)F(eu:+=MLa4")<rGptgnF`_SFF:ARqF`_SFF:AR+%17/60esk73Zp4$3Zp*c
$?('/E-67c3Zoh/1asOl+=A9Z%17/tCia8u2)-j/.![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn
$?Is[2BY.D+>Y-$+>=63Dfp/@F`]c-+=K$$.3KiX-QjcG$?L9)F(eu;2)ZR*Gptg',9V7\4)]7`
E-673$?('/E-673$7QDk/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=7W3;iBl7O$Ec#6,Bl@l3@:F.tF<F0uAoD^4D0$h@
ARuutFEDI_0/%NnG:mWODe=*8@<,p3@rH3;AoD^4D0%=CFDVHo%14[=/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15RCEZf(6
AoD^,@<?4%DBN@sDfp.E8g%_aEcl5?+EM+*+D>k=E&oX*GB\6`C3+<*FE_/6AM.J2D(fL>Ecl5?
/nf?DAU%X#E,9)`8PhiM6npSR87?RQ1,04FEb065Bl[c--Y.%0-OgCl$;No?+E1b2BHV#1+DkOs
BPD?q+EML5@qfOh@j!?GD.-pfBl7K)D09oA+C\n)2DcOcBlkI,$?L9)E$.;)+A#%(8PUCIBk(p$
-SKU`E\D6C@P9)j-UTq"C,RnRC,Rn#3&!*m@VK^b-OgCl$;XJe:/b(b+?_b.F)u/:+=nW`8Oc9I
;]mS5-p'I4-Wb#"+A?KeFa,#pDIdd+Bk/>S@<-R+DC6kUBeCMj<DGhS7:1@J.3NSD@r!27Ch[?i
@<jXa/nAd7+=B5n-o)nj+?V#fBju.)CbBdI+=AU"+<W'f+=&'l-Z!L+F)u.MA9i!*@N[$I%13OO
:-pQU;c?@Y+?_b.F)u/:+=nW_>]4RmDKBl8-OgCl$?L9)+?_b.0d&M"-R_be78?c[9HYl/D(-fA
A1%fn;H#kjBlnD=4ZX]D1^sdi;aG@k+?_b.1E]sG2Dm?J2[p+8F)5o2@59\u+?_b.-Ql>Y5r(;U
+DDrJ@j#S1.UshKF)u.,$?L9)F(eu>0esk73Zodm;b0230eskc+=^kDC`k3;-QmJOC^g_mF)5o2
@5/lf3Zodm;b02/+DDrJ@j#S1.UshKF)u.,$?L9);Fs\R9gg]o0H`M>+=A:08PhiM6npSR+DDrJ
@j#S1.UshKF)u.,$4R>`E\TI+4ZX]A+?CW!%17#rFDuAE4ZX]61,(.",9S?V-OgE(F)4`G:dn)H
0fC^..![7'-mKj[.6DHjFDuAE%17#rFDuAE%14Nn$4R>`BONV<4ZX]A+?CW!%17#rFDuAE4ZX]6
1,(.",9S?V-OgE(F)5o2@5/lQGptg',9V7\4)]7`E-673$?('/E-673$7QDk%17/60esk73Zp4$
3Zp*c$?('/E-67c3Zoh/1asOl+=A9Z%17/tCia8u2)-j/.![7'-mKj[.6DHjFDuAE%17#rFDuAE
%14Nn$4R>`1,Us44ZX]A+?CW!%17#rFDuAE4ZX]61GUC%,9S?V-OgE(F)5o2@59\u+=MLa4")<r
GptgnF`_SFF:ARqF`_SFF:AR+%13OO%16c[G\CN,BHTH!+=J@:3Zot=3bW,9+CQm:/mTnk3XlE*
$;No?+EV19F<G7*F(c\?Bln#2AoDL%Dg,o5B-:o!ASuU(FEn<&%144*A2#cM3AFu!3B&[&0Jm5s
3&r]P1hAIT3G($$2I\LT2*!TNAi;DV-Qk!%+EVO<Dg,c5+EMQX2D?7eAU%lsF(c[DB5\o$BOtU_
+D>2)BHV/;+Cno++>"^M+CT+0AU&0*@ruF&B-:V*1,'h[H$!U?BOPsq-OgCl$?1$#6>:O66o$Jl
67sa,Eb[pTF@nqDF"Jsd6>:O66m-GhDe`inF<GX9FEMOFF(96)E-*]A$;No?+:SZQ67sBWEb02u
Eaa'(Df0V=AoD]48g$`KCj@-Y1bCI?/0H]%0f1"_Df0/uEb0,uAKYr4ATMF#FCB9*Df.0:$;No?
%15is/g+/8Bl7Q+FD,5.8jje4@<>pe@<6!&@:WneDBO%>+CT.rCjC><+@9da@rH(!+C]/*@r!2t
@<>p1%15is/e&._67sC(ATD6gFD5SQ%15is/g(T1:-pQU+<WB]EbupHE,o\[Blls8-QlV9De'tP
3[\BNFD>>/F`_>6F!i)7+>Y-YA0<6I%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130f3WfDDEsV$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>G]fF`&ri+EMX5Ec`FJDfTV9Df-\:
Eb0<'DKK</Bl@ku$4R=O$;No?+DkP&AM7V>ARfk)AKZ&*FEMO3$;No?+DPh*B4#@fDe*2t4ZX]5
6>:O66rRZ=F`8];$?L'&F`_SFF<GC4+=BKiF@nr"ATW'6-OgDLBlls8;e:&nE$-hD$4R>;67sBi
Blmj'Bl5&&Ci<g!+C]A&@;BFp+D5_5F`7cs:-pQUC2[Wq?YO7nA7$HB3Zoe:Blls86>URMCI3&Q
@;BFp-OgCl$;No?+C]&,@rH(!+A,$EB6%p5E"*.L67sBqDe*KfBkhQs?Q_Km+=BKiF@nqK%13OO
:-pQUA9Da.+D,>(AKYl/Ec#6$BmO?2%16igA7o7`C2[Wi4ZX]5:2b/i@;KY(AO:3O@r"GF@;0UH
;cY7T$4R=O$?L'&F`_SFF<DqtBlmj'Bl5Rr6m-GhATMF#FCB9*Df-\:Ec5](@rri7ATW'6/gg ~>
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


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
