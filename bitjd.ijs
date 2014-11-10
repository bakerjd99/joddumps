NB. JOD dictionary dump: 10 Nov 2014 09:02:50
NB. Generated with JOD version; 0.9.94; 7; 14 Jun 2014 12:50:17
NB.
NB. Names & DidNums on current path
NB. +-----+---------------------------------------+
NB. |bitjd|199480677853178031259927223011621284073|
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
zz=:''
zz=:zz,'53 2$<;._1 ''|AdndAddress|Bitcoin address for Analyze the Data not t'
zz=:zz,'he Drivel|AttachTransactionHashes|attach transaction hash to indivi'
zz=:zz,'dual inputs/ouputs|BASE58|Bitcoin base 58 alphabet|Base58Check|Bitc'
zz=:zz,'oin base 58 address format|Base58CheckModel|model Base58Check verb|'
zz=:zz,'Base58frKey65|65 byte public Bitcoin key bytes to base 58 format|Bi'
zz=:zz,'tJDSetup|define various bitcoin/jd nouns|CheckEmbeddedCommas|1 if t'
zz=:zz,'here are no '''','''' characters in "--" quoted strings 0 otherwise|Cut'
zz=:zz,'TransactionSegments|cuts CSV file data into segments|DIGITS|numeral'
zz=:zz,'s|DenumberIO|remove numerals from input/output section names|EXPORT'
zz=:zz,'CSVDIRECTORY|directory holding csv files generated by (blockchain64'
zz=:zz,'.exe)|GenesisBlockChallengeScript|first Bitcoin challenge script - '
zz=:zz,'contains ECDSA public key|GenesisBlockOutputAddress|first Bitcoin b'
zz=:zz,'ase 58 output address|IFACEWORDSNormalizeBlockChainCSV|interface wo'
zz=:zz,'rds (IFACEWORDSNormalizeBlockChainCSV) group|IFACEWORDSsslhash|inte'
zz=:zz,'rface words (IFACEWORDSsslhash) group|INAFTERCOLUMNS|transaction ha'
zz=:zz,'shes attached after input/output columns|INPUTCOLUMNS|input column '
zz=:zz,'names|INPUTSFILE|normalized transactions inputs|InvertSegments|inve'
zz=:zz,'rt data in csv segments|JDCSVDIRECTORY|holds inverted JD blockchain'
zz=:zz,' csv input files|NormalizeExportCSVFiles|normalizes CSV export file'
zz=:zz,'s|OPENSSL|OpenSSL compiled binary file: dll, so, dylib|OUTPUTCOLUMN'
zz=:zz,'S|output column names|OUTPUTSFILE|normalized transaction outputs|Ou'
zz=:zz,'tputStart|start of outputs in inputs/outputs|ParseGenesisBlock|pars'
zz=:zz,'e Bitcoin genesis block|ROOTWORDSNormalizeBlockChainCSV|root words '
zz=:zz,'(ROOTWORDSNormalizeBlockChainCSV) group      |ROOTWORDSsslhash|root'
zz=:zz,' words (ROOTWORDSsslhash) group|SegmentHeader|forms denormalized se'
zz=:zz,'gment header|SetNormalizedCSVFiles|sets fully qualified normalized '
zz=:zz,'output files|TRANSACTIONCOLUMNS|transactions column names|TRANSACTI'
zz=:zz,'ONSFILE|normalized transactions|TSEGPREFIX|transaction segment pref'
zz=:zz,'ix|TransactionOffset|returns transaction offset number|b58checkFrby'
zz=:zz,'tes|Bitcoin base 58 check from bytes|b58fd|Bitcoin base 58 from ext'
zz=:zz,'ended decimal - see long document|bfh|bytes from hex: cl =. bfh clH'
zz=:zz,'ex|csvfrtab|csv cl from btcl - see long document|dfb58|extended dec'
zz=:zz,'imal from Bitcoin base 58|dfh|decimal from hex - supports upper and'
zz=:zz,' lower case|fqry|standardize query format|hfb|hex from bytes: clHex'
zz=:zz,' =. hfb clBytes|i1|index origin one i.|s256|SHA256 hash from OpenSS'
zz=:zz,'L|s512|SHA512 hash from OpenSSL|sha1|SHA1 hash from OpenSSL|sr160|R'
zz=:zz,'IPEMD-160 hash from OpenSSL|sslRIPEMD160|(cd) call of OpenSSL RIPEM'
zz=:zz,'D-160 hash|sslsha1|(cd) call of OpenSSL SHA-1 hash|sslsha256|(cd) c'
zz=:zz,'all of OpenSSL SHA-256 hash|sslsha512|(cd) call of OpenSSL SHA-512 '
zz=:zz,'hash|vint|variable length integer byte count and value''            '
zz=:2668{.zz
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',:<;.(_1) 47 98 53 56 102 100 47 42 98 53 56 102 100 32 118 45 45 3'
zz=:zz,'2 66 105 116 99 111 105 110 32 98 97 115 101 32 53 56 32 102 114 11'
zz=:zz,'1 109 32 101 120 116 101 110 100 101 100 32 100 101 99 105 109 97 1'
zz=:zz,'08 46 13 10 13 10 84 104 101 32 98 97 115 101 32 53 56 32 101 110 9'
zz=:zz,'9 111 100 105 110 103 32 117 115 101 100 32 105 110 32 66 105 116 9'
zz=:zz,'9 111 105 110 32 104 97 115 32 32 115 111 109 101 32 34 116 105 99 '
zz=:zz,'107 101 121 32 98 111 111 101 121 34 13 10 102 101 97 116 117 114 1'
zz=:zz,'01 115 32 32 116 104 97 116 32 32 111 110 101 32 32 115 104 111 117'
zz=:zz,' 108 100 32 32 98 101 32 32 97 119 97 114 101 32 32 111 102 46 32 8'
zz=:zz,'4 111 32 32 109 97 107 101 32 32 66 105 116 99 111 105 110 13 10 97'
zz=:zz,' 100 100 114 101 115 115 101 115 32 32 109 111 114 101 32 32 114 10'
zz=:zz,'1 97 100 97 98 108 101 32 32 116 104 101 32 102 111 108 108 111 119'
zz=:zz,' 105 110 103 32 32 108 101 116 116 101 114 115 32 32 104 97 118 101'
zz=:zz,' 32 32 98 101 101 110 13 10 111 109 105 116 116 101 100 32 102 114 '
zz=:zz,'111 109 32 116 104 101 32 97 108 112 104 97 98 101 116 58 32 39 48 '
zz=:zz,'39 32 32 40 122 101 114 111 41 44 32 39 79 39 32 32 40 99 97 112 10'
zz=:zz,'5 116 97 108 32 111 41 44 32 39 73 39 13 10 40 99 97 112 105 116 97'
zz=:zz,' 108 32 105 41 32 97 110 100 32 39 108 39 32 40 108 111 119 101 114'
zz=:zz,' 32 99 97 115 101 32 76 41 46 13 10 13 10 84 104 105 115 32 109 101'
zz=:zz,' 97 110 115 32 116 104 97 116 32 32 116 104 101 32 34 122 101 114 1'
zz=:zz,'11 34 32 105 110 32 98 97 115 101 32 53 56 32 32 110 117 109 98 101'
zz=:zz,' 114 115 32 32 105 115 32 39 49 39 46 32 32 70 111 114 13 10 101 12'
zz=:zz,'0 97 109 112 108 101 32 116 104 101 32 119 97 108 108 101 116 32 97'
zz=:zz,' 100 100 114 101 115 115 32 111 102 32 109 121 32 98 108 111 103 32'
zz=:zz,' 105 115 58 13 10 13 10 49 55 77 102 89 118 70 113 83 121 101 90 99'
zz=:zz,' 121 55 110 75 77 98 70 114 83 116 70 109 109 118 97 74 49 52 51 10'
zz=:zz,'2 65 13 10 13 10 84 104 101 32 108 101 97 100 105 110 103 32 32 39 '
zz=:zz,'49 39 32 32 104 101 114 101 32 32 105 115 32 32 101 113 117 105 118'
zz=:zz,' 97 108 101 110 116 32 32 116 111 32 108 101 97 100 105 110 103 32 '
zz=:zz,'32 122 101 114 111 115 32 32 105 110 13 10 100 101 99 105 109 97 10'
zz=:zz,'8 115 32 32 108 105 107 101 32 48 48 49 50 51 46 32 32 76 101 97 10'
zz=:zz,'0 105 110 103 32 122 101 114 111 115 32 32 40 49 39 115 41 32 32 97'
zz=:zz,' 114 101 32 32 100 114 111 112 112 101 100 32 32 98 121 13 10 40 98'
zz=:zz,' 53 56 102 100 41 46 32 84 104 105 115 32 32 105 115 32 110 111 116'
zz=:zz,' 32 97 32 112 114 111 98 108 101 109 32 119 104 101 110 32 118 105 '
zz=:zz,'101 119 105 110 103 32 98 97 115 101 32 32 53 56 32 115 116 114 105'
zz=:zz,' 110 103 115 13 10 97 115 32 32 110 117 109 98 101 114 115 32 98 11'
zz=:zz,'7 116 32 32 105 116 32 32 105 115 32 32 97 32 98 105 103 32 112 114'
zz=:zz,' 111 98 108 101 109 32 32 119 104 101 110 32 32 116 104 101 32 115 '
zz=:zz,'116 114 105 110 103 32 105 115 32 97 13 10 66 105 116 99 111 105 11'
zz=:zz,'0 32 97 100 100 114 101 115 115 46 32 76 101 97 100 105 110 103 32 '
zz=:zz,'122 101 114 111 115 32 109 97 116 116 101 114 32 102 111 114 32 32 '
zz=:zz,'66 105 116 99 111 105 110 32 97 100 100 114 101 115 115 101 115 33 '
zz=:zz,'13 10 84 104 101 32 102 105 120 32 105 115 32 116 114 105 118 105 9'
zz=:zz,'7 108 32 111 118 101 114 116 97 107 101 32 97 110 100 32 112 97 100'
zz=:zz,' 32 119 105 116 104 32 39 49 39 46 13 10 13 10 73 116 39 115 32 97 '
zz=:zz,'108 115 111 32 105 109 112 111 114 116 97 110 116 32 116 111 32 32 '
zz=:zz,'110 111 116 101 32 116 104 97 116 32 32 66 105 116 99 111 105 110 3'
zz=:zz,'2 97 100 100 114 101 115 115 32 108 101 110 103 116 104 32 99 97 11'
zz=:zz,'0 13 10 118 97 114 121 46 32 32 84 104 101 32 114 97 110 103 101 32'
zz=:zz,' 105 115 32 50 54 45 51 52 32 32 99 104 97 114 97 99 116 101 114 11'
zz=:zz,'5 46 32 77 111 115 116 32 97 100 100 114 101 115 115 101 115 32 32 '
zz=:zz,'97 114 101 32 51 52 13 10 99 104 97 114 97 99 116 101 114 115 32 97'
zz=:zz,' 110 100 32 73 32 98 101 108 105 101 118 101 32 97 108 108 32 115 1'
zz=:zz,'16 97 114 116 32 119 105 116 104 32 39 49 39 46 13 10 13 10 109 111'
zz=:zz,' 110 97 100 58 32 32 98 53 56 102 100 32 88 117 13 10 13 10 32 32 9'
zz=:zz,'7 100 110 100 61 46 32 39 49 55 77 102 89 118 70 113 83 121 101 90 '
zz=:zz,'99 121 55 110 75 77 98 70 114 83 116 70 109 109 118 97 74 49 52 51 '
zz=:zz,'102 65 39 13 10 32 32 13 10 32 32 78 66 46 32 108 101 97 100 105 11'
zz=:zz,'0 103 32 122 101 114 111 101 115 32 103 101 116 32 100 114 111 112 '
zz=:zz,'112 101 100 13 10 32 32 98 53 56 102 100 32 100 102 98 53 56 32 39 '
zz=:zz,'49 39 13 10 13 10 32 32 78 66 46 32 97 108 108 32 108 101 97 100 10'
zz=:zz,'5 110 103 32 122 101 114 111 101 115 13 10 32 32 108 122 61 46 32 4'
zz=:zz,'0 50 32 42 32 62 58 105 46 32 49 48 41 32 35 38 46 62 32 60 39 49 3'
zz=:zz,'9 13 10 32 32 98 53 56 102 100 64 100 102 98 53 56 38 46 62 32 108 '
zz=:zz,'122 13 10 13 10 32 32 78 66 46 32 102 105 120 32 98 121 32 102 105 '
zz=:zz,'116 116 101 100 32 111 118 101 114 116 97 107 101 13 10 32 32 97 10'
zz=:zz,'0 110 100 32 45 58 32 40 45 35 97 100 110 100 41 32 123 46 33 46 39'
zz=:zz,' 49 39 32 98 53 56 102 100 32 100 102 98 53 56 32 97 100 110 100 32'
zz=:zz,' 32 78 66 46 32 105 100 101 110 116 105 116 121 13 10 13 10 32 32 7'
zz=:zz,'8 66 46 32 97 114 114 97 121 32 97 114 103 117 109 101 110 116 115 '
zz=:zz,'13 10 32 32 115 32 61 46 32 100 102 98 53 56 32 124 46 32 97 100 11'
zz=:zz,'0 100 13 10 13 10 32 32 98 53 56 102 100 32 49 48 32 36 32 115 13 1'
zz=:zz,'0 13 10 32 32 98 53 56 102 100 32 50 32 51 32 50 32 36 32 115 13 10'
zz=:zz,' 13 10 13 10 13 10 13 10 13 10 13 10{a.                            '
zz=:4997{.zz
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'2 2$<;.(_1) 124 73 110 118 101 114 116 83 101 103 109 101 110 116 1'
zz=:zz,'15 48 48 124 78 66 46 42 73 110 118 101 114 116 83 101 103 109 101 '
zz=:zz,'110 116 115 48 48 32 116 45 45 32 98 97 115 105 99 32 73 110 118 10'
zz=:zz,'1 114 116 83 101 103 109 101 110 116 115 32 116 101 115 116 46 13 1'
zz=:zz,'0 78 66 46 13 10 78 66 46 32 99 114 101 97 116 101 100 58 32 50 48 '
zz=:zz,'49 52 106 117 108 48 54 13 10 78 66 46 32 99 104 97 110 103 101 115'
zz=:zz,' 58 32 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 13 10 13 10 99 111 99 117 114 114 1'
zz=:zz,'01 110 116 32 39 98 97 115 101 39 13 10 13 10 78 66 46 32 105 110 1'
zz=:zz,'18 101 114 116 32 97 32 102 101 119 32 102 105 108 101 115 13 10 13'
zz=:zz,' 10 49 32 83 101 116 78 111 114 109 97 108 105 122 101 100 67 83 86'
zz=:zz,' 70 105 108 101 115 32 74 68 67 83 86 68 73 82 69 67 84 79 82 89 13'
zz=:zz,' 10 13 10 99 115 118 61 58 32 114 101 97 100 32 69 88 80 79 82 84 6'
zz=:zz,'7 83 86 68 73 82 69 67 84 79 82 89 44 39 69 88 80 79 82 84 95 50 48'
zz=:zz,' 49 49 95 48 53 95 51 49 46 99 115 118 39 13 10 115 101 103 115 61 '
zz=:zz,'58 32 67 117 116 84 114 97 110 115 97 99 116 105 111 110 83 101 103'
zz=:zz,' 109 101 110 116 115 32 99 115 118 32 13 10 48 32 60 32 115 104 111'
zz=:zz,' 119 112 97 115 115 32 73 110 118 101 114 116 83 101 103 109 101 11'
zz=:zz,'0 116 115 32 115 101 103 115 13 10 13 10 99 115 118 61 58 32 114 10'
zz=:zz,'1 97 100 32 69 88 80 79 82 84 67 83 86 68 73 82 69 67 84 79 82 89 4'
zz=:zz,'4 39 69 88 80 79 82 84 95 50 48 49 48 95 48 55 95 50 52 46 99 115 1'
zz=:zz,'18 39 13 10 115 101 103 115 61 58 32 67 117 116 84 114 97 110 115 9'
zz=:zz,'7 99 116 105 111 110 83 101 103 109 101 110 116 115 32 99 115 118 3'
zz=:zz,'2 13 10 48 32 60 32 115 104 111 119 112 97 115 115 32 73 110 118 10'
zz=:zz,'1 114 116 83 101 103 109 101 110 116 115 32 115 101 103 115 13 10 1'
zz=:zz,'3 10 99 115 118 61 58 32 114 101 97 100 32 69 88 80 79 82 84 67 83 '
zz=:zz,'86 68 73 82 69 67 84 79 82 89 44 39 69 88 80 79 82 84 95 50 48 49 4'
zz=:zz,'9 95 48 53 95 50 57 46 99 115 118 39 13 10 115 101 103 115 61 58 32'
zz=:zz,' 67 117 116 84 114 97 110 115 97 99 116 105 111 110 83 101 103 109 '
zz=:zz,'101 110 116 115 32 99 115 118 32 13 10 48 32 60 32 115 104 111 119 '
zz=:zz,'112 97 115 115 32 73 110 118 101 114 116 83 101 103 109 101 110 116'
zz=:zz,' 115 32 115 101 103 115 124 116 101 115 116 115 116 117 98 124 78 6'
zz=:zz,'6 46 42 123 126 84 126 125 32 115 45 45 32 115 99 114 105 112 116 3'
zz=:zz,'2 115 116 117 98 46 13 10 78 66 46 13 10 78 66 46 32 84 104 105 115'
zz=:zz,' 32 46 46 46 46 46 32 102 111 114 109 97 116 116 101 100 32 116 101'
zz=:zz,' 120 116 13 10 78 66 46 13 10 78 66 46 32 118 101 114 98 97 116 105'
zz=:zz,' 109 58 13 10 78 66 46 32 13 10 78 66 46 32 32 32 32 32 46 46 46 46'
zz=:zz,' 32 117 110 102 111 114 109 97 116 101 100 32 116 101 120 116 13 10'
zz=:zz,' 78 66 46 32 32 13 10 78 66 46 32 97 117 116 104 111 114 58 32 32 7'
zz=:zz,'4 111 104 110 32 68 46 32 66 97 107 101 114 13 10 78 66 46 32 99 11'
zz=:zz,'4 101 97 116 101 100 58 32 123 126 68 126 125 13 10 78 66 46 32 99 '
zz=:zz,'104 97 110 103 101 115 58 32 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 13 10 9'
zz=:zz,'9 111 99 117 114 114 101 110 116 32 39 98 97 115 101 39 13 10 114 1'
zz=:zz,'01 113 117 105 114 101 32 39 106 111 100 116 101 115 116 101 114 39'
zz=:zz,' 13 10 13 10 78 66 46 32 119 111 114 107 32 105 110 32 99 108 101 9'
zz=:zz,'7 114 32 98 97 115 101 32 111 114 32 116 114 97 115 104 32 108 111 '
zz=:zz,'99 97 108 101 13 10 78 66 46 32 99 108 101 97 114 32 39 39 13 10 13'
zz=:zz,' 10 99 111 99 108 97 115 115 32 116 109 112 108 111 99 95 65 65 65 '
zz=:zz,'116 114 97 115 104 57 57 57 95 61 58 32 39 65 65 65 116 114 97 115 '
zz=:zz,'104 57 57 57 39 32 91 32 99 111 101 114 97 115 101 32 60 39 65 65 6'
zz=:zz,'5 116 114 97 115 104 57 57 57 39 13 10 99 111 105 110 115 101 114 1'
zz=:zz,'16 32 39 105 106 111 100 39 13 10 13 10 116 101 115 116 101 110 118'
zz=:zz,' 105 114 111 110 109 101 110 116 32 39 103 111 111 100 39 59 39 74 '
zz=:zz,'79 68 39 13 10 78 66 46 32 45 123 84 69 83 84 32 83 84 65 82 84 125'
zz=:zz,' 45 13 10 13 10 13 10 13 10 78 66 46 32 45 123 84 69 83 84 32 83 85'
zz=:zz,' 67 67 69 83 83 70 85 76 125 45 13 10 101 114 101 111 112 101 110 3'
zz=:zz,'2 48 13 10 13 10 99 111 99 117 114 114 101 110 116 32 39 98 97 115 '
zz=:zz,'101 39 13 10 99 111 101 114 97 115 101 32 60 116 109 112 108 111 99'
zz=:zz,' 95 65 65 65 116 114 97 115 104 57 57 57 95{a.                     '
zz=:4133{.zz
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',:<;._1 ''|InvertSegments00|basic InvertSegments test'''
zz=:53{.zz
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'13 3$''Base58CheckCS'';25;(47 47 32 67 35 32 102 117 110 99 116 105 1'
zz=:zz,'11 110 32 102 114 111 109 32 104 116 116 112 115 58 47 47 103 105 1'
zz=:zz,'15 116 46 103 105 116 104 117 98 46 99 111 109 47 67 111 100 101 11'
zz=:zz,'5 73 110 67 104 97 111 115 47 51 49 55 53 57 55 49 13 10 47 47 13 1'
zz=:zz,'0 47 47 32 115 104 111 119 105 110 103 32 104 111 119 32 116 111 32'
zz=:zz,' 99 111 110 118 101 114 116 32 116 111 32 66 97 115 101 53 56 67 10'
zz=:zz,'4 101 99 107 32 102 111 114 109 97 116 13 10 13 10 13 10 112 117 98'
zz=:zz,' 108 105 99 32 115 116 97 116 105 99 32 115 116 114 105 110 103 32 '
zz=:zz,'69 110 99 111 100 101 40 98 121 116 101 91 93 32 100 97 116 97 41 1'
zz=:zz,'3 10 123 13 10 32 13 10 9 47 47 32 68 101 99 111 100 101 32 98 121 '
zz=:zz,'116 101 91 93 32 116 111 32 66 105 103 73 110 116 101 103 101 114 1'
zz=:zz,'3 10 9 66 105 103 73 110 116 101 103 101 114 32 105 110 116 68 97 1'
zz=:zz,'16 97 32 61 32 48 59 13 10 9 102 111 114 32 40 105 110 116 32 105 3'
zz=:zz,'2 61 32 48 59 32 105 32 60 32 100 97 116 97 46 76 101 110 103 116 1'
zz=:zz,'04 59 32 105 43 43 41 13 10 9 123 13 10 9 9 105 110 116 68 97 116 9'
zz=:zz,'7 32 61 32 105 110 116 68 97 116 97 32 42 32 50 53 54 32 43 32 100 '
zz=:zz,'97 116 97 91 105 93 59 13 10 9 125 13 10 32 13 10 9 47 47 32 69 110'
zz=:zz,' 99 111 100 101 32 66 105 103 73 110 116 101 103 101 114 32 116 111'
zz=:zz,' 32 66 97 115 101 53 56 32 115 116 114 105 110 103 13 10 9 115 116 '
zz=:zz,'114 105 110 103 32 114 101 115 117 108 116 32 61 32 34 34 59 13 10 '
zz=:zz,'9 119 104 105 108 101 32 40 105 110 116 68 97 116 97 32 62 32 48 41'
zz=:zz,' 13 10 9 123 13 10 9 9 105 110 116 32 114 101 109 97 105 110 100 10'
zz=:zz,'1 114 32 61 32 40 105 110 116 41 40 105 110 116 68 97 116 97 32 37 '
zz=:zz,'32 53 56 41 59 13 10 9 9 105 110 116 68 97 116 97 32 47 61 32 53 56'
zz=:zz,' 59 13 10 9 9 114 101 115 117 108 116 32 61 32 68 105 103 105 116 1'
zz=:zz,'15 91 114 101 109 97 105 110 100 101 114 93 32 43 32 114 101 115 11'
zz=:zz,'7 108 116 59 13 10 9 125 13 10 32 13 10 9 47 47 32 65 112 112 101 1'
zz=:zz,'10 100 32 96 49 96 32 102 111 114 32 101 97 99 104 32 108 101 97 10'
zz=:zz,'0 105 110 103 32 48 32 98 121 116 101 13 10 9 102 111 114 32 40 105'
zz=:zz,' 110 116 32 105 32 61 32 48 59 32 105 32 60 32 100 97 116 97 46 76 '
zz=:zz,'101 110 103 116 104 32 38 38 32 100 97 116 97 91 105 93 32 61 61 32'
zz=:zz,' 48 59 32 105 43 43 41 13 10 9 123 13 10 9 9 114 101 115 117 108 11'
zz=:zz,'6 32 61 32 39 49 39 32 43 32 114 101 115 117 108 116 59 13 10 9 125'
zz=:zz,' 13 10 9 114 101 116 117 114 110 32 114 101 115 117 108 116 59 13 1'
zz=:zz,'0 125 13 10 32{a.);''Base58StackOverflowNotes'';25;(78 111 116 101 11'
zz=:zz,'5 32 111 110 32 54 53 32 98 121 116 101 32 112 117 98 108 105 99 32'
zz=:zz,' 107 101 121 115 32 116 111 32 98 97 115 101 32 53 56 32 102 114 11'
zz=:zz,'1 109 58 13 10 13 10 104 116 116 112 58 47 47 115 116 97 99 107 111'
zz=:zz,' 118 101 114 102 108 111 119 46 99 111 109 47 113 117 101 115 116 1'
zz=:zz,'05 111 110 115 47 49 57 50 51 51 48 53 51 47 104 97 115 104 105 110'
zz=:zz,' 103 45 102 114 111 109 45 97 45 112 117 98 108 105 99 45 107 101 1'
zz=:zz,'21 45 116 111 45 97 45 98 105 116 99 111 105 110 45 97 100 100 114 '
zz=:zz,'101 115 115 45 105 110 45 112 104 112 13 10 13 10 13 10 73 32 97 10'
zz=:zz,'9 32 116 114 121 105 110 103 32 116 111 32 102 111 108 108 111 119 '
zz=:zz,'32 116 104 101 32 105 110 115 116 114 117 99 116 105 111 110 115 32'
zz=:zz,' 114 101 113 117 105 114 101 100 32 116 111 32 116 117 114 110 32 9'
zz=:zz,'7 32 54 53 32 98 121 116 101 32 112 117 98 108 105 99 32 13 10 107 '
zz=:zz,'101 121 32 105 110 116 111 32 97 32 98 105 116 99 111 105 110 32 97'
zz=:zz,' 100 100 114 101 115 115 32 117 115 105 110 103 32 112 104 112 46 3'
zz=:zz,'2 84 104 101 32 105 110 115 116 114 117 99 116 105 111 110 115 32 9'
zz=:zz,'7 114 101 32 113 117 105 116 101 32 101 120 112 108 105 99 105 116 '
zz=:zz,'46 32 13 10 67 97 110 32 97 110 121 111 110 101 32 104 101 108 112 '
zz=:zz,'32 109 101 32 119 105 116 104 32 116 104 101 32 112 114 97 99 116 1'
zz=:zz,'05 99 97 108 105 116 121 32 111 102 32 100 111 105 110 103 32 116 1'
zz=:zz,'04 97 116 32 105 110 32 112 104 112 63 13 10 13 10 73 110 115 116 1'
zz=:zz,'14 117 99 116 105 111 110 115 32 97 114 101 13 10 13 10 49 32 45 32'
zz=:zz,' 84 97 107 101 32 116 104 101 32 99 111 114 114 101 115 112 111 110'
zz=:zz,' 100 105 110 103 32 112 117 98 108 105 99 32 107 101 121 32 103 101'
zz=:zz,' 110 101 114 97 116 101 100 32 119 105 116 104 32 105 116 32 40 54 '
zz=:zz,'53 32 98 121 116 101 115 44 32 49 32 98 121 116 101 32 48 120 48 52'
zz=:zz,' 44 32 13 10 51 50 32 98 121 116 101 115 32 99 111 114 114 101 115 '
zz=:zz,'112 111 110 100 105 110 103 32 116 111 32 88 32 99 111 111 114 100 '
zz=:zz,'105 110 97 116 101 44 32 51 50 32 98 121 116 101 115 32 99 111 114 '
zz=:zz,'114 101 115 112 111 110 100 105 110 103 32 116 111 32 89 32 99 111 '
zz=:zz,'111 114 100 105 110 97 116 101 41 13 10 13 10 48 52 53 48 56 54 51 '
zz=:zz,'65 68 54 52 65 56 55 65 69 56 65 50 70 69 56 51 67 49 65 70 49 65 5'
zz=:zz,'6 52 48 51 67 66 53 51 70 53 51 69 52 56 54 68 56 53 49 49 68 65 68'
zz=:zz,' 56 65 48 52 56 56 55 69 53 66 50 51 53 50 50 67 68 52 55 48 50 52 '
zz=:zz,'51 52 53 51 65 50 57 57 70 65 57 69 55 55 50 51 55 55 49 54 49 48 5'
zz=:zz,'1 65 66 67 49 49 65 49 68 70 51 56 56 53 53 69 68 54 70 50 69 69 49'
zz=:zz,' 56 55 69 57 67 53 56 50 66 65 54 13 10 13 10 50 32 45 32 80 101 11'
zz=:zz,'4 102 111 114 109 32 83 72 65 45 50 53 54 32 104 97 115 104 105 110'
zz=:zz,' 103 32 111 110 32 116 104 101 32 112 117 98 108 105 99 32 107 101 '
zz=:zz,'121 13 10 13 10 54 48 48 70 70 69 52 50 50 66 52 69 48 48 55 51 49 '
zz=:zz,'65 53 57 53 53 55 65 53 67 67 65 52 54 67 67 49 56 51 57 52 52 49 5'
zz=:zz,'7 49 48 48 54 51 50 52 65 52 52 55 66 68 66 50 68 57 56 68 52 66 52'
zz=:zz,' 48 56 13 10 13 10 51 32 45 32 80 101 114 102 111 114 109 32 82 73 '
zz=:zz,'80 69 77 68 45 49 54 48 32 104 97 115 104 105 110 103 32 111 110 32'
zz=:zz,' 116 104 101 32 114 101 115 117 108 116 32 111 102 32 83 72 65 45 5'
zz=:zz,'0 53 54 13 10 13 10 48 49 48 57 54 54 55 55 54 48 48 54 57 53 51 68'
zz=:zz,' 53 53 54 55 52 51 57 69 53 69 51 57 70 56 54 65 48 68 50 55 51 66 '
zz=:zz,'69 69 13 10 13 10 52 32 45 32 65 100 100 32 118 101 114 115 105 111'
zz=:zz,' 110 32 98 121 116 101 32 105 110 32 102 114 111 110 116 32 111 102'
zz=:zz,' 32 82 73 80 69 77 68 45 49 54 48 32 104 97 115 104 32 40 48 120 48'
zz=:zz,' 48 32 102 111 114 32 77 97 105 110 32 78 101 116 119 111 114 107 4'
zz=:zz,'1 13 10 13 10 48 48 48 49 48 57 54 54 55 55 54 48 48 54 57 53 51 68'
zz=:zz,' 53 53 54 55 52 51 57 69 53 69 51 57 70 56 54 65 48 68 50 55 51 66 '
zz=:zz,'69 69 13 10 13 10 53 32 45 32 80 101 114 102 111 114 109 32 83 72 6'
zz=:zz,'5 45 50 53 54 32 104 97 115 104 32 111 110 32 116 104 101 32 101 12'
zz=:zz,'0 116 101 110 100 101 100 32 82 73 80 69 77 68 45 49 54 48 32 114 1'
zz=:zz,'01 115 117 108 116 13 10 13 10 52 52 53 67 55 65 56 48 48 55 65 57 '
zz=:zz,'51 68 56 55 51 51 49 56 56 50 56 56 66 66 51 50 48 65 56 70 69 50 6'
zz=:zz,'8 69 66 68 50 65 69 49 66 52 55 70 48 70 53 48 66 67 49 48 66 65 69'
zz=:zz,' 56 52 53 67 48 57 52 13 10 13 10 54 32 45 32 80 101 114 102 111 11'
zz=:zz,'4 109 32 83 72 65 45 50 53 54 32 104 97 115 104 32 111 110 32 116 1'
zz=:zz,'04 101 32 114 101 115 117 108 116 32 111 102 32 116 104 101 32 112 '
zz=:zz,'114 101 118 105 111 117 115 32 83 72 65 45 50 53 54 32 104 97 115 1'
zz=:zz,'04 13 10 13 10 68 54 49 57 54 55 70 54 51 67 55 68 68 49 56 51 57 4'
zz=:zz,'9 52 65 52 65 69 52 53 50 67 57 70 54 65 68 53 68 52 54 50 67 69 51'
zz=:zz,' 68 50 55 55 55 57 56 48 55 53 66 49 48 55 54 49 53 67 49 65 56 65 '
zz=:zz,'51 48 13 10 13 10 55 32 45 32 84 97 107 101 32 116 104 101 32 102 1'
zz=:zz,'05 114 115 116 32 52 32 98 121 116 101 115 32 111 102 32 116 104 10'
zz=:zz,'1 32 115 101 99 111 110 100 32 83 72 65 45 50 53 54 32 104 97 115 1'
zz=:zz,'04 46 32 84 104 105 115 32 105 115 32 116 104 101 32 97 100 100 114'
zz=:zz,' 101 115 115 32 99 104 101 99 107 115 117 109 13 10 13 10 68 54 49 '
zz=:zz,'57 54 55 70 54 13 10 13 10 56 32 45 32 65 100 100 32 116 104 101 32'
zz=:zz,' 52 32 99 104 101 99 107 115 117 109 32 98 121 116 101 115 32 102 1'
zz=:zz,'14 111 109 32 112 111 105 110 116 32 55 32 97 116 32 116 104 101 32'
zz=:zz,' 101 110 100 32 111 102 32 101 120 116 101 110 100 101 100 32 82 73'
zz=:zz,' 80 69 77 68 45 49 54 48 32 104 97 115 104 32 102 114 111 109 32 11'
zz=:zz,'2 111 105 110 116 32 52 46 32 84 104 105 115 32 105 115 32 116 104 '
zz=:zz,'101 32 50 53 45 98 121 116 101 32 98 105 110 97 114 121 32 66 105 1'
zz=:zz,'16 99 111 105 110 32 65 100 100 114 101 115 115 46 13 10 13 10 48 4'
zz=:zz,'8 48 49 48 57 54 54 55 55 54 48 48 54 57 53 51 68 53 53 54 55 52 51'
zz=:zz,' 57 69 53 69 51 57 70 56 54 65 48 68 50 55 51 66 69 69 68 54 49 57 '
zz=:zz,'54 55 70 54 13 10 13 10 57 32 45 32 67 111 110 118 101 114 116 32 1'
zz=:zz,'16 104 101 32 114 101 115 117 108 116 32 102 114 111 109 32 97 32 9'
zz=:zz,'8 121 116 101 32 115 116 114 105 110 103 32 105 110 116 111 32 97 3'
zz=:zz,'2 98 97 115 101 53 56 32 115 116 114 105 110 103 32 117 115 105 110'
zz=:zz,' 103 32 66 97 115 101 53 56 67 104 101 99 107 32 101 110 99 111 100'
zz=:zz,' 105 110 103 46 32 84 104 105 115 32 105 115 32 116 104 101 32 109 '
zz=:zz,'111 115 116 32 99 111 109 109 111 110 108 121 32 117 115 101 100 32'
zz=:zz,' 66 105 116 99 111 105 110 32 65 100 100 114 101 115 115 32 102 111'
zz=:zz,' 114 109 97 116 13 10 13 10 49 54 85 119 76 76 57 82 105 115 99 51 '
zz=:zz,'81 102 80 113 66 85 118 75 111 102 72 109 66 81 55 119 77 116 106 1'
zz=:zz,'18 77{a.);''BasicBlockChainStats'';21;(78 66 46 42 66 97 115 105 99 6'
zz=:zz,'6 108 111 99 107 67 104 97 105 110 83 116 97 116 115 32 115 45 45 3'
zz=:zz,'2 99 111 109 112 117 116 101 32 98 97 115 105 99 32 98 108 111 99 1'
zz=:zz,'07 99 104 97 105 110 32 115 116 97 116 105 115 116 105 99 115 46 13'
zz=:zz,' 10 13 10 78 66 46 32 115 116 97 110 100 97 114 100 105 122 101 32 '
zz=:zz,'113 117 101 114 121 32 102 111 114 109 97 116 13 10 102 113 114 121'
zz=:zz,' 61 58 51 32 58 32 39 114 101 98 99 32 39 39 32 39 39 32 40 73 46 3'
zz=:zz,'2 121 32 101 46 32 67 82 76 70 44 84 65 66 41 125 32 121 39 13 10 1'
zz=:zz,'3 10 78 66 46 32 114 101 109 111 118 101 115 32 109 117 108 116 105'
zz=:zz,' 112 108 101 32 98 108 97 110 107 115 32 40 99 104 97 114 32 111 11'
zz=:zz,'0 108 121 41 13 10 114 101 98 99 61 58 93 32 35 126 32 91 58 32 45 '
zz=:zz,'46 32 39 32 32 39 38 69 46 13 10 13 10 78 66 46 32 116 97 98 108 10'
zz=:zz,'1 32 107 101 121 32 99 111 117 110 116 115 13 10 106 100 32 39 114 '
zz=:zz,'101 97 100 115 32 99 111 117 110 116 32 84 114 97 110 115 97 99 116'
zz=:zz,' 105 111 110 72 97 115 104 32 102 114 111 109 32 116 114 110 39 13 '
zz=:zz,'10 106 100 32 39 114 101 97 100 115 32 99 111 117 110 116 32 73 110'
zz=:zz,' 112 117 116 72 97 115 104 32 102 114 111 109 32 105 112 116 39 13 '
zz=:zz,'10 106 100 32 39 114 101 97 100 115 32 99 111 117 110 116 32 79 117'
zz=:zz,' 116 112 117 116 75 101 121 32 102 114 111 109 32 111 112 116 39 13'
zz=:zz,' 10 13 10 78 66 46 32 97 118 103 44 32 109 97 120 44 32 109 105 110'
zz=:zz,' 32 98 105 116 99 111 105 110 13 10 106 100 32 39 114 101 97 100 11'
zz=:zz,'5 32 97 118 103 32 79 117 116 112 117 116 86 97 108 117 101 44 32 1'
zz=:zz,'09 97 120 32 79 117 116 112 117 116 86 97 108 117 101 44 32 109 105'
zz=:zz,' 110 32 79 117 116 112 117 116 86 97 108 117 101 44 32 99 111 117 1'
zz=:zz,'10 116 32 79 117 116 112 117 116 86 97 108 117 101 32 102 114 111 1'
zz=:zz,'09 32 111 112 116 39 13 10 106 100 32 39 114 101 97 100 115 32 97 1'
zz=:zz,'18 103 32 73 110 112 117 116 65 109 111 117 110 116 44 32 109 97 12'
zz=:zz,'0 32 73 110 112 117 116 65 109 111 117 110 116 44 32 109 105 110 32'
zz=:zz,' 73 110 112 117 116 65 109 111 117 110 116 44 32 99 111 117 110 116'
zz=:zz,' 32 73 110 112 117 116 65 109 111 117 110 116 32 102 114 111 109 32'
zz=:zz,' 105 112 116 39 13 10 13 10 78 66 46 32 97 116 116 97 99 104 32 108'
zz=:zz,' 97 98 101 108 115 13 10 113 114 121 48 61 58 32 102 113 114 121 32'
zz=:zz,' 48 32 58 32 48 13 10 114 101 97 100 115 32 13 10 32 32 32 65 118 1'
zz=:zz,'03 32 79 117 116 112 117 116 58 97 118 103 32 79 117 116 112 117 11'
zz=:zz,'6 86 97 108 117 101 44 32 13 10 32 32 32 77 97 120 32 79 117 116 11'
zz=:zz,'2 117 116 58 109 97 120 32 79 117 116 112 117 116 86 97 108 117 101'
zz=:zz,' 44 32 13 10 32 32 32 77 105 110 32 79 117 116 112 117 116 58 109 1'
zz=:zz,'05 110 32 79 117 116 112 117 116 86 97 108 117 101 44 32 13 10 32 3'
zz=:zz,'2 32 67 111 117 110 116 58 99 111 117 110 116 32 79 117 116 112 117'
zz=:zz,' 116 86 97 108 117 101 32 13 10 102 114 111 109 32 111 112 116 13 1'
zz=:zz,'0 41 13 10 106 100 32 113 114 121 48 13 10 13 10 113 114 121 49 61 '
zz=:zz,'58 32 102 113 114 121 32 48 32 58 32 48 13 10 114 101 97 100 115 32'
zz=:zz,' 13 10 32 32 32 65 118 103 32 73 110 112 117 116 58 97 118 103 32 7'
zz=:zz,'3 110 112 117 116 65 109 111 117 110 116 44 32 13 10 32 32 32 77 97'
zz=:zz,' 120 32 73 110 112 117 116 58 109 97 120 32 73 110 112 117 116 65 1'
zz=:zz,'09 111 117 110 116 44 32 13 10 32 32 32 77 105 110 32 73 110 112 11'
zz=:zz,'7 116 58 109 105 110 32 73 110 112 117 116 65 109 111 117 110 116 4'
zz=:zz,'4 32 13 10 32 32 32 67 111 117 110 116 58 99 111 117 110 116 32 73 '
zz=:zz,'110 112 117 116 65 109 111 117 110 116 32 102 114 111 109 32 105 11'
zz=:zz,'2 116 13 10 41 13 10 106 100 32 113 114 121 49{a.);''BitcoinBlockSch'
zz=:zz,'emaSQL'';25;(83 81 76 32 115 99 104 101 109 97 32 102 111 114 32 98 '
zz=:zz,'105 116 99 111 105 110 32 98 108 111 99 107 115 32 102 114 111 109 '
zz=:zz,'58 13 10 13 10 104 116 116 112 115 58 47 47 103 105 116 104 117 98 '
zz=:zz,'46 99 111 109 47 103 114 111 110 100 105 108 117 47 108 105 98 98 1'
zz=:zz,'05 116 99 111 105 110 45 112 101 114 108 47 98 108 111 98 47 109 97'
zz=:zz,' 115 116 101 114 47 66 105 116 99 111 105 110 47 68 97 116 97 98 97'
zz=:zz,' 115 101 47 109 121 115 113 108 45 115 99 104 101 109 97 46 115 113'
zz=:zz,' 108 13 10 13 10 13 10 67 82 69 65 84 69 32 84 65 66 76 69 32 98 10'
zz=:zz,'8 111 99 107 32 40 13 10 32 32 32 32 104 97 115 104 32 99 104 97 11'
zz=:zz,'4 40 51 50 41 32 98 105 110 97 114 121 32 112 114 105 109 97 114 12'
zz=:zz,'1 32 107 101 121 44 13 10 13 10 32 32 32 32 118 101 114 115 105 111'
zz=:zz,' 110 32 105 110 116 101 103 101 114 44 13 10 32 32 32 32 104 97 115'
zz=:zz,' 104 80 114 101 118 32 32 99 104 97 114 40 51 50 41 32 98 105 110 9'
zz=:zz,'7 114 121 32 110 111 116 32 110 117 108 108 44 13 10 32 32 32 32 10'
zz=:zz,'4 97 115 104 77 101 114 107 108 101 82 111 111 116 32 99 104 97 114'
zz=:zz,' 40 51 50 41 32 98 105 110 97 114 121 32 110 111 116 32 110 117 108'
zz=:zz,' 108 44 13 10 32 32 32 32 110 84 105 109 101 32 105 110 116 101 103'
zz=:zz,' 101 114 32 117 110 115 105 103 110 101 100 32 110 111 116 32 110 1'
zz=:zz,'17 108 108 44 13 10 32 32 32 32 110 66 105 116 115 32 105 110 116 1'
zz=:zz,'01 103 101 114 32 117 110 115 105 103 110 101 100 32 110 111 116 32'
zz=:zz,' 110 117 108 108 44 13 10 32 32 32 32 110 78 111 110 99 101 32 32 3'
zz=:zz,'2 32 32 32 105 110 116 101 103 101 114 32 117 110 115 105 103 110 1'
zz=:zz,'01 100 32 110 111 116 32 110 117 108 108 44 13 10 13 10 32 32 32 32'
zz=:zz,' 119 111 114 107 32 102 108 111 97 116 32 32 32 117 110 115 105 103'
zz=:zz,' 110 101 100 44 13 10 32 32 32 32 100 101 112 116 104 32 105 110 11'
zz=:zz,'6 101 103 101 114 32 117 110 115 105 103 110 101 100 44 13 10 13 10'
zz=:zz,' 32 32 32 32 107 101 121 32 40 104 97 115 104 77 101 114 107 108 10'
zz=:zz,'1 82 111 111 116 41 44 13 10 32 32 32 32 107 101 121 32 40 104 97 1'
zz=:zz,'15 104 80 114 101 118 41 13 10 32 32 32 32 107 101 121 32 40 100 10'
zz=:zz,'1 112 116 104 41 13 10 41 59 13 10 13 10 67 82 69 65 84 69 32 84 65'
zz=:zz,' 66 76 69 32 116 114 97 110 115 97 99 116 105 111 110 32 40 13 10 3'
zz=:zz,'2 32 32 32 104 97 115 104 32 99 104 97 114 40 51 50 41 32 98 105 11'
zz=:zz,'0 97 114 121 32 112 114 105 109 97 114 121 32 107 101 121 44 13 10 '
zz=:zz,'32 32 32 32 118 101 114 115 105 111 110 32 105 110 116 101 103 101 '
zz=:zz,'114 44 13 10 32 32 32 32 108 111 99 107 84 105 109 101 32 105 110 1'
zz=:zz,'16 101 103 101 114 32 117 110 115 105 103 110 101 100 44 13 10 32 3'
zz=:zz,'2 32 32 99 111 105 110 98 97 115 101 32 98 111 111 108 101 97 110 1'
zz=:zz,'3 10 41 59 13 10 13 10 67 82 69 65 84 69 32 84 65 66 76 69 32 77 10'
zz=:zz,'1 114 107 108 101 95 116 114 101 101 32 40 13 10 32 32 32 32 114 11'
zz=:zz,'1 111 116 32 99 104 97 114 40 51 50 41 32 117 110 115 105 103 110 1'
zz=:zz,'01 100 32 110 111 116 32 110 117 108 108 44 13 10 32 32 32 32 105 1'
zz=:zz,'00 120 32 32 105 110 116 101 103 101 114 32 117 110 115 105 103 110'
zz=:zz,' 101 100 44 13 10 32 32 32 32 112 114 105 109 97 114 121 32 107 101'
zz=:zz,' 121 32 40 114 111 111 116 44 32 105 100 120 41 44 13 10 32 32 32 3'
zz=:zz,'2 107 101 121 32 40 114 111 111 116 41 13 10 41 59 13 10 13 10 67 8'
zz=:zz,'2 69 65 84 69 32 86 73 69 87 32 118 105 101 119 95 98 108 111 99 10'
zz=:zz,'7 32 65 83 13 10 83 69 76 69 67 84 32 13 10 72 69 88 40 104 97 115 '
zz=:zz,'104 41 32 97 115 32 104 97 115 104 44 13 10 118 101 114 115 105 111'
zz=:zz,' 110 44 13 10 72 69 88 40 104 97 115 104 80 114 101 118 41 32 97 11'
zz=:zz,'5 32 104 97 115 104 80 114 101 118 44 13 10 72 69 88 40 104 97 115 '
zz=:zz,'104 77 101 114 107 108 101 82 111 111 116 41 32 97 115 32 104 97 11'
zz=:zz,'5 104 77 101 114 107 108 101 82 111 111 116 44 13 10 110 84 105 109'
zz=:zz,' 101 44 13 10 110 66 105 116 115 44 13 10 110 78 111 110 99 101 44 '
zz=:zz,'13 10 119 111 114 107 44 13 10 100 101 112 116 104 13 10 70 82 79 7'
zz=:zz,'7 32 98 108 111 99 107 59 13 10 13 10 13 10 65 110 111 116 104 101 '
zz=:zz,'114 32 108 97 121 111 117 116 32 102 114 111 109 58 13 10 13 10 104'
zz=:zz,' 116 116 112 115 58 47 47 98 105 116 99 111 105 110 116 97 108 107 '
zz=:zz,'46 111 114 103 47 105 110 100 101 120 46 112 104 112 63 116 111 112'
zz=:zz,' 105 99 61 53 48 52 53 56 46 48 13 10 13 10 67 82 69 65 84 69 32 84'
zz=:zz,' 65 66 76 69 32 98 108 111 99 107 115 32 40 32 13 10 104 97 115 104'
zz=:zz,' 32 67 72 65 82 40 51 50 41 32 78 79 84 32 78 85 76 76 32 67 79 78 '
zz=:zz,'83 84 82 65 73 78 84 32 98 108 111 99 107 115 95 112 107 32 80 82 7'
zz=:zz,'3 77 65 82 89 32 75 69 89 44 13 10 99 104 97 105 110 87 111 114 107'
zz=:zz,' 32 66 76 79 66 32 78 79 84 32 78 85 76 76 44 13 10 104 101 105 103'
zz=:zz,' 104 116 32 66 73 71 73 78 84 32 78 79 84 32 78 85 76 76 44 13 10 1'
zz=:zz,'04 101 97 100 101 114 32 66 76 79 66 32 78 79 84 32 78 85 76 76 41 '
zz=:zz,'59 13 10 13 10 67 82 69 65 84 69 32 84 65 66 76 69 32 115 101 116 1'
zz=:zz,'16 105 110 103 115 32 40 32 13 10 110 97 109 101 32 86 65 82 67 72 '
zz=:zz,'65 82 40 51 50 41 32 78 79 84 32 78 85 76 76 32 67 79 78 83 84 82 6'
zz=:zz,'5 73 78 84 32 115 101 116 116 105 110 103 115 95 112 107 32 80 82 7'
zz=:zz,'3 77 65 82 89 32 75 69 89 44 13 10 118 97 108 117 101 32 66 76 79 6'
zz=:zz,'6 41 59 13 10 13 10 67 82 69 65 84 69 32 84 65 66 76 69 32 116 114 '
zz=:zz,'97 110 115 97 99 116 105 111 110 115 32 40 32 13 10 104 97 115 104 '
zz=:zz,'32 84 69 88 84 32 78 79 84 32 78 85 76 76 32 67 79 78 83 84 82 65 7'
zz=:zz,'3 78 84 32 116 114 97 110 115 97 99 116 105 111 110 115 95 112 107 '
zz=:zz,'32 80 82 73 77 65 82 89 32 75 69 89 44 13 10 118 101 114 32 73 78 8'
zz=:zz,'4 69 71 69 82 32 78 79 84 32 78 85 76 76 44 13 10 118 105 110 95 11'
zz=:zz,'5 122 32 73 78 84 69 71 69 82 32 78 79 84 32 78 85 76 76 44 13 10 1'
zz=:zz,'18 111 117 116 95 115 122 32 73 78 84 69 71 69 82 32 78 79 84 32 78'
zz=:zz,' 85 76 76 44 13 10 108 111 99 107 95 116 105 109 101 32 73 78 84 69'
zz=:zz,' 71 69 82 32 78 79 84 32 78 85 76 76 44 13 10 115 105 122 101 32 73'
zz=:zz,' 78 84 69 71 69 82 32 78 79 84 32 78 85 76 76 41 59 13 10 13 10 67 '
zz=:zz,'82 69 65 84 69 32 84 65 66 76 69 32 116 114 97 110 115 97 99 116 10'
zz=:zz,'5 111 110 115 95 105 110 112 117 116 32 40 32 13 10 104 97 115 104 '
zz=:zz,'95 112 97 114 101 110 116 95 116 120 32 84 69 88 84 32 78 79 84 32 '
zz=:zz,'78 85 76 76 44 13 10 115 99 114 105 112 116 95 115 105 103 32 84 69'
zz=:zz,' 88 84 32 78 79 84 32 78 85 76 76 41 59 13 10 13 10 67 82 69 65 84 '
zz=:zz,'69 32 84 65 66 76 69 32 116 114 97 110 115 97 99 116 105 111 110 11'
zz=:zz,'5 95 111 117 116 112 117 116 32 40 32 13 10 104 97 115 104 95 112 9'
zz=:zz,'7 114 101 110 116 95 116 120 32 84 69 88 84 32 78 79 84 32 78 85 76'
zz=:zz,' 76 44 13 10 118 97 108 117 101 32 82 69 65 76 32 78 79 84 32 78 85'
zz=:zz,' 76 76 44 13 10 115 99 114 105 112 116 95 112 117 98 95 107 101 121'
zz=:zz,' 32 84 69 88 84 32 78 79 84 32 78 85 76 76 41 59{a.);''LoadJDBlockCh'
zz=:zz,'ainDB'';21;(78 66 46 32 76 111 97 100 32 74 68 32 98 108 111 99 107 '
zz=:zz,'99 104 97 105 110 32 100 97 116 97 98 97 115 101 46 13 10 13 10 78 '
zz=:zz,'66 46 32 115 116 97 110 100 97 114 105 122 101 115 32 74 32 112 97 '
zz=:zz,'116 104 32 100 101 108 105 109 105 116 101 114 32 116 111 32 119 10'
zz=:zz,'5 110 100 111 119 115 32 98 97 99 107 115 108 97 115 104 32 13 10 1'
zz=:zz,'19 105 110 112 97 116 104 115 101 112 61 58 39 92 39 38 40 40 39 47'
zz=:zz,' 39 32 73 46 64 58 61 32 93 41 125 41 13 10 13 10 78 66 46 32 117 1'
zz=:zz,'15 101 32 106 100 13 10 114 101 113 117 105 114 101 32 39 100 97 11'
zz=:zz,'6 97 47 106 100 39 13 10 13 10 78 66 46 32 99 108 101 97 114 32 97 '
zz=:zz,'100 109 105 110 13 10 106 100 97 100 109 105 110 32 48 32 32 13 10 '
zz=:zz,'13 10 78 66 46 32 115 101 108 101 99 116 32 100 98 32 45 32 115 104'
zz=:zz,' 111 119 32 108 111 99 97 116 105 111 110 13 10 106 100 97 100 109 '
zz=:zz,'105 110 120 32 39 98 108 111 99 107 99 104 97 105 110 39 13 10 115 '
zz=:zz,'109 111 117 116 112 117 116 32 106 100 97 100 109 105 110 32 39 39 '
zz=:zz,'13 10 13 10 78 66 46 32 99 115 118 32 105 109 112 111 114 116 32 10'
zz=:zz,'2 111 108 100 101 114 13 10 67 83 86 70 79 76 68 69 82 61 58 32 70 '
zz=:zz,'61 58 32 39 126 116 101 109 112 47 106 100 47 99 115 118 47 98 108 '
zz=:zz,'111 99 107 99 104 97 105 110 47 39 13 10 13 10 78 66 46 32 100 101 '
zz=:zz,'108 101 116 101 32 46 99 115 118 32 97 110 100 32 46 99 100 101 102'
zz=:zz,' 115 32 102 105 108 101 115 13 10 106 100 100 101 108 101 116 101 1'
zz=:zz,'02 111 108 100 101 114 95 106 100 95 32 70 13 10 106 100 99 114 101'
zz=:zz,' 97 116 101 102 111 108 100 101 114 95 106 100 95 32 70 32 13 10 13'
zz=:zz,' 10 78 66 46 32 99 111 112 121 32 114 97 119 32 100 97 116 97 32 11'
zz=:zz,'6 111 32 99 115 118 32 105 109 112 111 114 116 13 10 66 61 58 32 40'
zz=:zz,' 106 112 97 116 104 32 39 126 66 105 116 74 68 68 97 116 97 39 41 4'
zz=:zz,'4 39 106 100 99 115 118 47 39 13 10 115 104 101 108 108 32 40 119 1'
zz=:zz,'05 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 32 39 44'
zz=:zz,' 66 44 39 105 110 112 117 116 115 50 48 48 57 46 99 115 118 39 32 4'
zz=:zz,'4 39 32 39 32 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13 '
zz=:zz,'10 115 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 112'
zz=:zz,' 32 39 120 99 111 112 121 32 39 44 66 44 39 111 117 116 112 117 116'
zz=:zz,' 115 50 48 48 57 46 99 115 118 39 32 44 39 32 39 32 44 106 112 97 1'
zz=:zz,'16 104 32 70 41 44 39 32 47 115 39 13 10 115 104 101 108 108 32 40 '
zz=:zz,'119 105 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 32 '
zz=:zz,'39 44 66 44 39 116 114 97 110 115 97 99 116 105 111 110 115 50 48 4'
zz=:zz,'8 57 46 99 115 118 39 44 39 32 39 44 106 112 97 116 104 32 70 41 44'
zz=:zz,' 39 32 47 115 39 13 10 13 10 78 66 46 32 99 111 112 121 32 99 111 1'
zz=:zz,'08 117 109 110 32 100 101 102 115 32 13 10 115 104 101 108 108 32 4'
zz=:zz,'0 119 105 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 3'
zz=:zz,'2 39 44 66 44 39 105 110 112 117 116 115 50 48 48 57 46 99 100 101 '
zz=:zz,'102 115 39 32 44 39 32 39 32 44 106 112 97 116 104 32 70 41 44 39 3'
zz=:zz,'2 47 115 39 13 10 115 104 101 108 108 32 40 119 105 110 112 97 116 '
zz=:zz,'104 115 101 112 32 39 120 99 111 112 121 32 39 44 66 44 39 111 117 '
zz=:zz,'116 112 117 116 115 50 48 48 57 46 99 100 101 102 115 39 32 44 39 3'
zz=:zz,'2 39 32 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13 10 115'
zz=:zz,' 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 112 32 39'
zz=:zz,' 120 99 111 112 121 32 39 44 66 44 39 116 114 97 110 115 97 99 116 '
zz=:zz,'105 111 110 115 50 48 48 57 46 99 100 101 102 115 39 44 39 32 39 44'
zz=:zz,' 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13 10 13 10 78 66 4'
zz=:zz,'6 32 108 111 97 100 32 116 114 97 110 115 97 99 116 105 111 110 115'
zz=:zz,' 13 10 106 100 32 39 100 114 111 112 116 97 98 108 101 32 116 114 1'
zz=:zz,'10 39 32 32 13 10 106 100 32 39 99 115 118 114 100 32 47 114 111 11'
zz=:zz,'9 115 32 48 32 116 114 97 110 115 97 99 116 105 111 110 115 50 48 4'
zz=:zz,'8 57 46 99 115 118 32 116 114 110 39 32 13 10 13 10 78 66 46 32 108'
zz=:zz,' 111 97 100 32 105 110 112 117 116 115 13 10 106 100 32 39 100 114 '
zz=:zz,'111 112 116 97 98 108 101 32 105 112 116 39 13 10 106 100 32 39 99 '
zz=:zz,'115 118 114 100 32 47 114 111 119 115 32 48 32 105 110 112 117 116 '
zz=:zz,'115 50 48 48 57 46 99 115 118 32 105 112 116 39 13 10 13 10 78 66 4'
zz=:zz,'6 32 108 111 97 100 32 111 117 116 112 117 116 115 13 10 106 100 32'
zz=:zz,' 39 100 114 111 112 116 97 98 108 101 32 111 112 116 39 13 10 106 1'
zz=:zz,'00 32 39 99 115 118 114 100 32 47 114 111 119 115 32 48 32 111 117 '
zz=:zz,'116 112 117 116 115 50 48 48 57 46 99 115 118 32 111 112 116 39 32 '
zz=:zz,'13 10 13 10 78 66 46 32 115 101 116 32 114 101 102 101 114 101 110 '
zz=:zz,'99 101 115 32 13 10 106 100 32 39 114 101 102 101 114 101 110 99 10'
zz=:zz,'1 32 116 114 110 32 84 114 97 110 115 97 99 116 105 111 110 70 107 '
zz=:zz,'101 121 32 105 112 116 32 84 114 97 110 115 97 99 116 105 111 110 7'
zz=:zz,'0 107 101 121 39 13 10 106 100 32 39 114 101 102 101 114 101 110 99'
zz=:zz,' 101 32 116 114 110 32 84 114 97 110 115 97 99 116 105 111 110 70 1'
zz=:zz,'07 101 121 32 111 112 116 32 84 114 97 110 115 97 99 116 105 111 11'
zz=:zz,'0 70 107 101 121 39 13 10 13 10 78 66 46 32 108 111 97 100 32 114 1'
zz=:zz,'01 112 111 114 116 13 10 115 109 111 117 116 112 117 116 32 106 100'
zz=:zz,' 32 39 99 115 118 114 101 112 111 114 116 32 47 102 39 13 10{a.);''L'
zz=:zz,'oadJDFullBlockChainDB'';21;(78 66 46 42 76 111 97 100 74 68 70 117 1'
zz=:zz,'08 108 66 108 111 99 107 67 104 97 105 110 68 66 32 115 45 45 32 10'
zz=:zz,'8 111 97 100 32 108 97 114 103 101 114 32 74 68 32 98 108 111 99 10'
zz=:zz,'7 99 104 97 105 110 32 100 97 116 97 98 97 115 101 46 13 10 13 10 7'
zz=:zz,'8 66 46 32 115 116 97 110 100 97 114 105 122 101 115 32 74 32 112 9'
zz=:zz,'7 116 104 32 100 101 108 105 109 105 116 101 114 32 116 111 32 119 '
zz=:zz,'105 110 100 111 119 115 32 98 97 99 107 115 108 97 115 104 32 13 10'
zz=:zz,' 119 105 110 112 97 116 104 115 101 112 61 58 39 92 39 38 40 40 39 '
zz=:zz,'47 39 32 73 46 64 58 61 32 93 41 125 41 13 10 13 10 78 66 46 32 117'
zz=:zz,' 115 101 32 106 100 13 10 114 101 113 117 105 114 101 32 39 100 97 '
zz=:zz,'116 97 47 106 100 39 13 10 13 10 78 66 46 32 99 108 101 97 114 32 9'
zz=:zz,'7 100 109 105 110 13 10 106 100 97 100 109 105 110 32 48 32 32 13 1'
zz=:zz,'0 13 10 78 66 46 32 99 114 101 97 116 101 32 100 98 32 45 32 115 10'
zz=:zz,'4 111 119 32 108 111 99 97 116 105 111 110 13 10 106 100 97 100 109'
zz=:zz,' 105 110 120 32 39 98 108 111 99 107 102 117 108 108 39 13 10 115 1'
zz=:zz,'09 111 117 116 112 117 116 32 106 100 97 100 109 105 110 32 39 39 1'
zz=:zz,'3 10 13 10 78 66 46 32 99 115 118 32 105 109 112 111 114 116 32 102'
zz=:zz,' 111 108 100 101 114 13 10 67 83 86 70 79 76 68 69 82 61 58 32 70 6'
zz=:zz,'1 58 32 39 126 116 101 109 112 47 106 100 47 99 115 118 47 98 108 1'
zz=:zz,'11 99 107 99 104 97 105 110 47 39 13 10 13 10 78 66 46 32 100 101 1'
zz=:zz,'08 101 116 101 32 46 99 115 118 32 97 110 100 32 46 99 100 101 102 '
zz=:zz,'115 32 102 105 108 101 115 13 10 106 100 100 101 108 101 116 101 10'
zz=:zz,'2 111 108 100 101 114 95 106 100 95 32 70 13 10 106 100 99 114 101 '
zz=:zz,'97 116 101 102 111 108 100 101 114 95 106 100 95 32 70 32 13 10 13 '
zz=:zz,'10 78 66 46 32 99 111 112 121 32 114 97 119 32 100 97 116 97 32 116'
zz=:zz,' 111 32 99 115 118 32 105 109 112 111 114 116 13 10 66 61 58 32 40 '
zz=:zz,'106 112 97 116 104 32 39 126 66 105 116 74 68 68 97 116 97 39 41 44'
zz=:zz,' 39 106 100 99 115 118 47 39 13 10 115 104 101 108 108 32 40 119 10'
zz=:zz,'5 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 32 39 44 '
zz=:zz,'66 44 39 105 110 112 117 116 115 45 97 108 108 46 99 115 118 39 32 '
zz=:zz,'44 39 32 39 32 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13'
zz=:zz,' 10 115 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 11'
zz=:zz,'2 32 39 120 99 111 112 121 32 39 44 66 44 39 111 117 116 112 117 11'
zz=:zz,'6 115 45 97 108 108 46 99 115 118 39 32 44 39 32 39 32 44 106 112 9'
zz=:zz,'7 116 104 32 70 41 44 39 32 47 115 39 13 10 115 104 101 108 108 32 '
zz=:zz,'40 119 105 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 '
zz=:zz,'32 39 44 66 44 39 116 114 97 110 115 97 99 116 105 111 110 115 45 9'
zz=:zz,'7 108 108 46 99 115 118 39 44 39 32 39 44 106 112 97 116 104 32 70 '
zz=:zz,'41 44 39 32 47 115 39 13 10 13 10 78 66 46 32 99 111 112 121 32 99 '
zz=:zz,'111 108 117 109 110 32 100 101 102 115 32 13 10 115 104 101 108 108'
zz=:zz,' 32 40 119 105 110 112 97 116 104 115 101 112 32 39 120 99 111 112 '
zz=:zz,'121 32 39 44 66 44 39 105 110 112 117 116 115 45 97 108 108 46 99 1'
zz=:zz,'00 101 102 115 39 32 44 39 32 39 32 44 106 112 97 116 104 32 70 41 '
zz=:zz,'44 39 32 47 115 39 13 10 115 104 101 108 108 32 40 119 105 110 112 '
zz=:zz,'97 116 104 115 101 112 32 39 120 99 111 112 121 32 39 44 66 44 39 1'
zz=:zz,'11 117 116 112 117 116 115 45 97 108 108 46 99 100 101 102 115 39 3'
zz=:zz,'2 44 39 32 39 32 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 '
zz=:zz,'13 10 115 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 '
zz=:zz,'112 32 39 120 99 111 112 121 32 39 44 66 44 39 116 114 97 110 115 9'
zz=:zz,'7 99 116 105 111 110 115 45 97 108 108 46 99 100 101 102 115 39 44 '
zz=:zz,'39 32 39 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13 10 13'
zz=:zz,' 10 78 66 46 32 108 111 97 100 32 116 114 97 110 115 97 99 116 105 '
zz=:zz,'111 110 115 13 10 106 100 32 39 100 114 111 112 116 97 98 108 101 3'
zz=:zz,'2 116 114 110 39 32 32 13 10 106 100 32 39 99 115 118 114 100 32 47'
zz=:zz,' 114 111 119 115 32 48 32 116 114 97 110 115 97 99 116 105 111 110 '
zz=:zz,'115 45 97 108 108 46 99 115 118 32 116 114 110 39 32 13 10 13 10 78'
zz=:zz,' 66 46 32 108 111 97 100 32 105 110 112 117 116 115 13 10 106 100 3'
zz=:zz,'2 39 100 114 111 112 116 97 98 108 101 32 105 112 116 39 13 10 106 '
zz=:zz,'100 32 39 99 115 118 114 100 32 47 114 111 119 115 32 48 32 105 110'
zz=:zz,' 112 117 116 115 45 97 108 108 46 99 115 118 32 105 112 116 39 13 1'
zz=:zz,'0 13 10 78 66 46 32 108 111 97 100 32 111 117 116 112 117 116 115 1'
zz=:zz,'3 10 106 100 32 39 100 114 111 112 116 97 98 108 101 32 111 112 116'
zz=:zz,' 39 13 10 106 100 32 39 99 115 118 114 100 32 47 114 111 119 115 32'
zz=:zz,' 48 32 111 117 116 112 117 116 115 45 97 108 108 46 99 115 118 32 1'
zz=:zz,'11 112 116 39 32 13 10 13 10 78 66 46 32 115 101 116 32 114 101 102'
zz=:zz,' 101 114 101 110 99 101 115 32 13 10 106 100 32 39 114 101 102 101 '
zz=:zz,'114 101 110 99 101 32 116 114 110 32 84 114 97 110 115 97 99 116 10'
zz=:zz,'5 111 110 70 107 101 121 32 105 112 116 32 84 114 97 110 115 97 99 '
zz=:zz,'116 105 111 110 70 107 101 121 39 13 10 106 100 32 39 114 101 102 1'
zz=:zz,'01 114 101 110 99 101 32 116 114 110 32 84 114 97 110 115 97 99 116'
zz=:zz,' 105 111 110 70 107 101 121 32 111 112 116 32 84 114 97 110 115 97 '
zz=:zz,'99 116 105 111 110 70 107 101 121 39 13 10 13 10 78 66 46 32 108 11'
zz=:zz,'1 97 100 32 114 101 112 111 114 116 13 10 115 109 111 117 116 112 1'
zz=:zz,'17 116 32 106 100 32 39 99 115 118 114 101 112 111 114 116 32 47 10'
zz=:zz,'2 39 13 10{a.);''LoadJDPartBlockChainDB'';21;(78 66 46 42 76 111 97 1'
zz=:zz,'00 74 68 80 97 114 116 66 108 111 99 107 67 104 97 105 110 68 66 32'
zz=:zz,' 115 45 45 32 108 111 97 100 32 112 97 114 116 105 97 108 32 74 68 '
zz=:zz,'32 98 108 111 99 107 99 104 97 105 110 32 100 97 116 97 98 97 115 1'
zz=:zz,'01 46 13 10 13 10 78 66 46 32 115 116 97 110 100 97 114 105 122 101'
zz=:zz,' 115 32 74 32 112 97 116 104 32 100 101 108 105 109 105 116 101 114'
zz=:zz,' 32 116 111 32 119 105 110 100 111 119 115 32 98 97 99 107 115 108 '
zz=:zz,'97 115 104 32 13 10 119 105 110 112 97 116 104 115 101 112 61 58 39'
zz=:zz,' 92 39 38 40 40 39 47 39 32 73 46 64 58 61 32 93 41 125 41 13 10 13'
zz=:zz,' 10 78 66 46 32 117 115 101 32 106 100 13 10 114 101 113 117 105 11'
zz=:zz,'4 101 32 39 100 97 116 97 47 106 100 39 13 10 13 10 78 66 46 32 99 '
zz=:zz,'108 101 97 114 32 97 100 109 105 110 13 10 106 100 97 100 109 105 1'
zz=:zz,'10 32 48 32 32 13 10 13 10 78 66 46 32 99 114 101 97 116 101 32 100'
zz=:zz,' 98 32 45 32 115 104 111 119 32 108 111 99 97 116 105 111 110 13 10'
zz=:zz,' 106 100 97 100 109 105 110 120 32 39 98 108 111 99 107 112 97 114 '
zz=:zz,'116 39 13 10 115 109 111 117 116 112 117 116 32 106 100 97 100 109 '
zz=:zz,'105 110 32 39 39 13 10 13 10 78 66 46 32 99 115 118 32 105 109 112 '
zz=:zz,'111 114 116 32 102 111 108 100 101 114 13 10 67 83 86 70 79 76 68 6'
zz=:zz,'9 82 61 58 32 70 61 58 32 39 126 116 101 109 112 47 106 100 47 99 1'
zz=:zz,'15 118 47 98 108 111 99 107 99 104 97 105 110 47 39 13 10 13 10 78 '
zz=:zz,'66 46 32 100 101 108 101 116 101 32 42 46 99 115 118 32 97 110 100 '
zz=:zz,'32 42 46 99 100 101 102 115 32 102 105 108 101 115 13 10 106 100 10'
zz=:zz,'0 101 108 101 116 101 102 111 108 100 101 114 95 106 100 95 32 70 1'
zz=:zz,'3 10 106 100 99 114 101 97 116 101 102 111 108 100 101 114 95 106 1'
zz=:zz,'00 95 32 70 32 13 10 13 10 78 66 46 32 99 111 112 121 32 114 97 119'
zz=:zz,' 32 100 97 116 97 32 116 111 32 99 115 118 32 105 109 112 111 114 1'
zz=:zz,'16 13 10 66 61 58 32 40 106 112 97 116 104 32 39 126 66 105 116 74 '
zz=:zz,'68 68 97 116 97 39 41 44 39 106 100 99 115 118 47 39 13 10 115 104 '
zz=:zz,'101 108 108 32 40 119 105 110 112 97 116 104 115 101 112 32 39 120 '
zz=:zz,'99 111 112 121 32 39 44 66 44 39 105 110 112 117 116 115 50 48 48 5'
zz=:zz,'7 46 99 115 118 39 32 44 39 32 39 32 44 106 112 97 116 104 32 70 41'
zz=:zz,' 44 39 32 47 115 39 13 10 115 104 101 108 108 32 40 119 105 110 112'
zz=:zz,' 97 116 104 115 101 112 32 39 120 99 111 112 121 32 39 44 66 44 39 '
zz=:zz,'111 117 116 112 117 116 115 50 48 48 57 46 99 115 118 39 32 44 39 3'
zz=:zz,'2 39 32 44 106 112 97 116 104 32 70 41 44 39 32 47 115 39 13 10 115'
zz=:zz,' 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 112 32 39'
zz=:zz,' 120 99 111 112 121 32 39 44 66 44 39 116 114 97 110 115 97 99 116 '
zz=:zz,'105 111 110 115 50 48 48 57 46 99 115 118 39 44 39 32 39 44 106 112'
zz=:zz,' 97 116 104 32 70 41 44 39 32 47 115 39 13 10 13 10 78 66 46 32 99 '
zz=:zz,'111 112 121 32 99 111 108 117 109 110 32 100 101 102 115 32 13 10 1'
zz=:zz,'15 104 101 108 108 32 40 119 105 110 112 97 116 104 115 101 112 32 '
zz=:zz,'39 120 99 111 112 121 32 39 44 66 44 39 105 110 112 117 116 115 50 '
zz=:zz,'48 48 57 46 99 100 101 102 115 39 32 44 39 32 39 32 44 106 112 97 1'
zz=:zz,'16 104 32 70 41 44 39 32 47 115 39 13 10 115 104 101 108 108 32 40 '
zz=:zz,'119 105 110 112 97 116 104 115 101 112 32 39 120 99 111 112 121 32 '
zz=:zz,'39 44 66 44 39 111 117 116 112 117 116 115 50 48 48 57 46 99 100 10'
zz=:zz,'1 102 115 39 32 44 39 32 39 32 44 106 112 97 116 104 32 70 41 44 39'
zz=:zz,' 32 47 115 39 13 10 115 104 101 108 108 32 40 119 105 110 112 97 11'
zz=:zz,'6 104 115 101 112 32 39 120 99 111 112 121 32 39 44 66 44 39 116 11'
zz=:zz,'4 97 110 115 97 99 116 105 111 110 115 50 48 48 57 46 99 100 101 10'
zz=:zz,'2 115 39 44 39 32 39 44 106 112 97 116 104 32 70 41 44 39 32 47 115'
zz=:zz,' 39 13 10 13 10 78 66 46 32 108 111 97 100 32 116 114 97 110 115 97'
zz=:zz,' 99 116 105 111 110 115 13 10 106 100 32 39 100 114 111 112 116 97 '
zz=:zz,'98 108 101 32 116 114 110 39 32 32 13 10 106 100 32 39 99 115 118 1'
zz=:zz,'14 100 32 47 114 111 119 115 32 48 32 116 114 97 110 115 97 99 116 '
zz=:zz,'105 111 110 115 50 48 48 57 46 99 115 118 32 116 114 110 39 32 13 1'
zz=:zz,'0 13 10 78 66 46 32 108 111 97 100 32 105 110 112 117 116 115 13 10'
zz=:zz,' 106 100 32 39 100 114 111 112 116 97 98 108 101 32 105 112 116 39 '
zz=:zz,'13 10 106 100 32 39 99 115 118 114 100 32 47 114 111 119 115 32 48 '
zz=:zz,'32 105 110 112 117 116 115 50 48 48 57 46 99 115 118 32 105 112 116'
zz=:zz,' 39 13 10 13 10 78 66 46 32 108 111 97 100 32 111 117 116 112 117 1'
zz=:zz,'16 115 13 10 106 100 32 39 100 114 111 112 116 97 98 108 101 32 111'
zz=:zz,' 112 116 39 13 10 106 100 32 39 99 115 118 114 100 32 47 114 111 11'
zz=:zz,'9 115 32 48 32 111 117 116 112 117 116 115 50 48 48 57 46 99 115 11'
zz=:zz,'8 32 111 112 116 39 32 13 10 13 10 78 66 46 32 115 101 116 32 114 1'
zz=:zz,'01 102 101 114 101 110 99 101 115 32 13 10 106 100 32 39 114 101 10'
zz=:zz,'2 101 114 101 110 99 101 32 116 114 110 32 84 114 97 110 115 97 99 '
zz=:zz,'116 105 111 110 70 107 101 121 32 105 112 116 32 84 114 97 110 115 '
zz=:zz,'97 99 116 105 111 110 70 107 101 121 39 13 10 106 100 32 39 114 101'
zz=:zz,' 102 101 114 101 110 99 101 32 116 114 110 32 84 114 97 110 115 97 '
zz=:zz,'99 116 105 111 110 70 107 101 121 32 111 112 116 32 84 114 97 110 1'
zz=:zz,'15 97 99 116 105 111 110 70 107 101 121 39 13 10 13 10 78 66 46 32 '
zz=:zz,'108 111 97 100 32 114 101 112 111 114 116 13 10 115 109 111 117 116'
zz=:zz,' 112 117 116 32 106 100 32 39 99 115 118 114 101 112 111 114 116 32'
zz=:zz,' 47 102 39 13 10{a.);''MoreBlockChainQueries'';21;(78 66 46 42 77 111'
zz=:zz,' 114 101 66 108 111 99 107 67 104 97 105 110 81 117 101 114 105 101'
zz=:zz,' 115 32 115 45 45 32 109 111 114 101 32 99 111 109 112 108 101 120 '
zz=:zz,'32 74 68 32 98 108 111 99 107 99 104 97 105 110 32 113 117 101 114 '
zz=:zz,'105 101 115 46 13 10 13 10 78 66 46 32 115 116 97 110 100 97 114 10'
zz=:zz,'0 105 122 101 32 113 117 101 114 121 32 102 111 114 109 97 116 13 1'
zz=:zz,'0 102 113 114 121 61 58 51 32 58 32 39 114 101 98 99 32 39 39 32 39'
zz=:zz,' 39 32 40 73 46 32 121 32 101 46 32 67 82 76 70 44 84 65 66 41 125 '
zz=:zz,'32 121 39 13 10 13 10 78 66 46 32 114 101 109 111 118 101 115 32 10'
zz=:zz,'9 117 108 116 105 112 108 101 32 98 108 97 110 107 115 32 40 99 104'
zz=:zz,' 97 114 32 111 110 108 121 41 13 10 114 101 98 99 61 58 93 32 35 12'
zz=:zz,'6 32 91 58 32 45 46 32 39 32 32 39 38 69 46 13 10 13 10 78 66 46 32'
zz=:zz,' 97 118 101 114 97 103 101 44 32 109 97 120 44 32 109 105 110 32 11'
zz=:zz,'0 111 110 122 101 114 111 32 105 110 112 117 116 115 32 98 121 32 1'
zz=:zz,'15 101 108 101 99 116 101 100 32 116 114 97 110 115 97 99 116 105 1'
zz=:zz,'11 110 115 13 10 115 116 97 116 115 48 61 58 32 106 100 32 102 113 '
zz=:zz,'114 121 32 48 32 58 32 48 13 10 32 114 101 97 100 115 32 99 110 116'
zz=:zz,' 58 99 111 117 110 116 32 84 114 97 110 115 97 99 116 105 111 110 7'
zz=:zz,'0 107 101 121 44 13 10 32 32 32 32 32 32 32 97 118 103 58 97 118 10'
zz=:zz,'3 32 73 110 112 117 116 65 109 111 117 110 116 44 13 10 32 32 32 32'
zz=:zz,' 32 32 32 109 97 120 58 109 97 120 32 73 110 112 117 116 65 109 111'
zz=:zz,' 117 110 116 44 13 10 32 32 32 32 32 32 32 109 105 110 58 109 105 1'
zz=:zz,'10 32 73 110 112 117 116 65 109 111 117 110 116 13 10 32 98 121 32 '
zz=:zz,'84 114 97 110 115 97 99 116 105 111 110 70 107 101 121 13 10 32 102'
zz=:zz,' 114 111 109 32 105 112 116 13 10 32 119 104 101 114 101 13 10 32 3'
zz=:zz,'2 32 32 32 32 40 105 112 116 46 84 114 97 110 115 97 99 116 105 111'
zz=:zz,' 110 70 107 101 121 32 62 32 51 48 48 48 48 41 32 97 110 100 32 40 '
zz=:zz,'73 110 112 117 116 65 109 111 117 110 116 32 62 32 48 41 13 10 41 1'
zz=:zz,'3 10 13 10 78 66 46 32 97 118 101 114 97 103 101 32 109 97 120 44 3'
zz=:zz,'2 109 105 110 32 110 111 110 122 101 114 111 32 111 117 116 112 117'
zz=:zz,' 116 115 32 98 121 32 115 101 108 101 99 116 101 100 32 116 114 97 '
zz=:zz,'110 115 97 99 116 105 111 110 115 13 10 115 116 97 116 115 49 61 58'
zz=:zz,' 32 106 100 32 102 113 114 121 32 48 32 58 32 48 13 10 32 114 101 9'
zz=:zz,'7 100 115 32 99 110 116 58 99 111 117 110 116 32 84 114 97 110 115 '
zz=:zz,'97 99 116 105 111 110 72 97 115 104 44 13 10 32 32 32 32 32 32 32 9'
zz=:zz,'7 118 103 32 111 117 116 112 117 116 58 97 118 103 32 79 117 116 11'
zz=:zz,'2 117 116 86 97 108 117 101 44 13 10 32 32 32 32 32 32 32 109 97 12'
zz=:zz,'0 32 111 117 116 112 117 116 58 109 97 120 32 79 117 116 112 117 11'
zz=:zz,'6 86 97 108 117 101 44 13 10 32 32 32 32 32 32 32 109 105 110 32 11'
zz=:zz,'1 117 116 112 117 116 58 109 105 110 32 79 117 116 112 117 116 86 9'
zz=:zz,'7 108 117 101 13 10 32 98 121 32 13 10 32 32 32 32 32 32 32 84 114 '
zz=:zz,'97 110 115 97 99 116 105 111 110 72 97 115 104 13 10 32 102 114 111'
zz=:zz,' 109 32 13 10 32 32 32 32 32 32 32 111 112 116 13 10 32 119 104 101'
zz=:zz,' 114 101 13 10 32 32 32 32 32 32 32 40 79 117 116 112 117 116 86 97'
zz=:zz,' 108 117 101 32 62 32 53 48 41 13 10 41 13 10 13 10 78 66 46 32 115'
zz=:zz,' 117 109 109 97 114 105 122 101 32 108 97 114 103 101 32 116 114 97'
zz=:zz,' 110 115 97 99 116 105 111 110 115 13 10 115 116 97 116 115 50 61 5'
zz=:zz,'8 32 106 100 32 102 113 114 121 32 48 32 58 32 48 32 13 10 32 114 1'
zz=:zz,'01 97 100 115 32 13 10 32 32 32 32 32 32 32 99 110 116 32 105 110 1'
zz=:zz,'12 117 116 58 99 111 117 110 116 32 105 112 116 46 73 110 112 117 1'
zz=:zz,'16 65 109 111 117 110 116 44 32 13 10 32 32 32 32 32 32 32 115 117 '
zz=:zz,'109 32 105 110 112 117 116 58 115 117 109 32 105 112 116 46 73 110 '
zz=:zz,'112 117 116 65 109 111 117 110 116 44 32 13 10 32 32 32 32 32 32 32'
zz=:zz,' 99 110 116 32 111 117 116 112 117 116 58 99 111 117 110 116 32 111'
zz=:zz,' 112 116 46 79 117 116 112 117 116 86 97 108 117 101 44 32 13 10 32'
zz=:zz,' 32 32 32 32 32 32 115 117 109 32 111 117 116 112 117 116 58 115 11'
zz=:zz,'7 109 32 111 112 116 46 79 117 116 112 117 116 86 97 108 117 101 32'
zz=:zz,' 13 10 32 98 121 32 32 13 10 32 32 32 32 32 32 32 116 114 110 46 84'
zz=:zz,' 114 97 110 115 97 99 116 105 111 110 70 107 101 121 32 13 10 32 10'
zz=:zz,'2 114 111 109 32 13 10 32 32 32 32 32 32 32 116 114 110 44 116 114 '
zz=:zz,'110 62 105 112 116 44 116 114 110 62 111 112 116 32 13 10 32 119 10'
zz=:zz,'4 101 114 101 32 13 10 32 32 32 32 32 32 32 40 111 112 116 46 79 11'
zz=:zz,'7 116 112 117 116 86 97 108 117 101 32 62 32 53 48 41 32 97 110 100'
zz=:zz,' 32 40 105 112 116 46 73 110 112 117 116 65 109 111 117 110 116 32 '
zz=:zz,'62 32 48 41{a.);''POST_NormalizeBlockChainCSV'';21;(78 66 46 42 80 79'
zz=:zz,' 83 84 95 78 111 114 109 97 108 105 122 101 66 108 111 99 107 67 10'
zz=:zz,'4 97 105 110 67 83 86 32 115 45 45 32 112 111 115 116 32 112 114 11'
zz=:zz,'1 99 101 115 115 111 114 46 32 13 10 13 10 115 109 111 117 116 112 '
zz=:zz,'117 116 32 48 32 58 32 48 13 10 78 66 46 32 105 110 116 101 114 102'
zz=:zz,' 97 99 101 32 119 111 114 100 40 115 41 58 13 10 78 66 46 32 32 32 '
zz=:zz,'78 111 114 109 97 108 105 122 101 69 120 112 111 114 116 67 83 86 7'
zz=:zz,'0 105 108 101 115 32 32 78 66 46 32 110 111 114 109 97 108 105 122 '
zz=:zz,'101 115 32 67 83 86 32 101 120 112 111 114 116 32 102 105 108 101 1'
zz=:zz,'15 13 10 41 13 10 13 10 99 111 99 117 114 114 101 110 116 32 39 98 '
zz=:zz,'97 115 101 39 13 10 99 111 105 110 115 101 114 116 32 32 39 78 111 '
zz=:zz,'114 109 97 108 105 122 101 66 108 111 99 107 67 104 97 105 110 67 8'
zz=:zz,'3 86 39{a.);''POST_sslhash'';21;(78 66 46 42 80 79 83 84 95 115 115 1'
zz=:zz,'08 104 97 115 104 32 115 45 45 32 112 111 115 116 32 112 114 111 99'
zz=:zz,' 101 115 115 111 114 46 32 13 10 13 10 115 109 111 117 116 112 117 '
zz=:zz,'116 32 48 32 58 32 48 13 10 78 66 46 32 105 110 116 101 114 102 97 '
zz=:zz,'99 101 32 119 111 114 100 40 115 41 58 13 10 78 66 46 32 32 32 115 '
zz=:zz,'50 53 54 32 32 32 78 66 46 32 83 72 65 50 53 54 32 104 97 115 104 3'
zz=:zz,'2 102 114 111 109 32 79 112 101 110 83 83 76 13 10 78 66 46 32 32 3'
zz=:zz,'2 115 53 49 50 32 32 32 78 66 46 32 83 72 65 53 49 50 32 104 97 115'
zz=:zz,' 104 32 102 114 111 109 32 79 112 101 110 83 83 76 13 10 78 66 46 3'
zz=:zz,'2 32 32 115 104 97 49 32 32 32 78 66 46 32 83 72 65 49 32 104 97 11'
zz=:zz,'5 104 32 102 114 111 109 32 79 112 101 110 83 83 76 13 10 78 66 46 '
zz=:zz,'32 32 32 115 114 49 54 48 32 32 78 66 46 32 82 73 80 69 77 68 45 49'
zz=:zz,' 54 48 32 104 97 115 104 32 102 114 111 109 32 79 112 101 110 83 83'
zz=:zz,' 76 13 10 41 13 10 13 10 99 111 99 117 114 114 101 110 116 32 39 98'
zz=:zz,' 97 115 101 39 13 10 99 111 105 110 115 101 114 116 32 32 39 115 11'
zz=:zz,'5 108 104 97 115 104 39{a.);''emailPascalJasmin'';25;(101 109 97 105 '
zz=:zz,'108 32 109 101 115 115 97 103 101 32 102 114 111 109 32 74 32 112 1'
zz=:zz,'14 111 114 103 114 97 109 109 105 110 103 32 102 111 114 117 109 32'
zz=:zz,' 115 117 103 103 101 115 116 105 110 103 32 13 10 104 111 119 32 11'
zz=:zz,'6 111 32 105 110 118 111 107 101 32 82 73 80 69 77 68 45 49 54 48 3'
zz=:zz,'2 104 97 115 104 32 99 111 100 101 32 102 114 111 109 32 74 13 10 1'
zz=:zz,'3 10 13 10 80 97 115 99 97 108 32 74 97 115 109 105 110 39 32 118 1'
zz=:zz,'05 97 32 80 114 111 103 114 97 109 109 105 110 103 13 10 74 117 110'
zz=:zz,' 32 50 53 32 40 51 32 100 97 121 115 32 97 103 111 41 13 10 13 10 1'
zz=:zz,'16 111 32 112 114 111 103 114 97 109 109 105 110 103 32 13 10 89 11'
zz=:zz,'1 117 32 99 97 110 32 99 104 97 110 103 101 32 116 104 101 32 115 1'
zz=:zz,'15 108 112 32 61 58 32 108 105 110 101 32 105 110 32 106 56 48 50 3'
zz=:zz,'2 116 111 32 112 111 105 110 116 32 116 111 32 98 105 110 46 32 32 '
zz=:zz,'79 116 104 101 114 119 105 115 101 32 116 104 105 115 32 110 101 10'
zz=:zz,'1 100 115 32 111 112 101 110 115 115 108 32 40 73 32 116 104 105 11'
zz=:zz,'0 107 32 97 108 119 97 121 115 32 97 118 97 105 108 97 98 108 101 3'
zz=:zz,'2 111 110 32 108 105 110 117 120 32 97 110 100 32 109 97 99 41 32 3'
zz=:zz,'2 82 73 80 69 77 68 49 54 48 32 105 115 32 99 97 108 108 101 100 32'
zz=:zz,' 116 104 114 111 117 103 104 32 115 114 49 54 48 32 102 117 110 99 '
zz=:zz,'116 105 111 110 46 13 10 13 10 76 105 98 114 97 114 121 32 105 115 '
zz=:zz,'32 102 97 115 116 101 114 32 116 104 97 110 32 119 105 110 100 111 '
zz=:zz,'119 115 32 98 117 105 108 116 32 105 110 32 100 108 108 115 13 10 1'
zz=:zz,'3 10 114 101 113 117 105 114 101 32 39 100 108 108 39 13 10 78 66 4'
zz=:zz,'6 32 114 101 113 117 105 114 101 32 39 115 104 97 114 100 115 39 13'
zz=:zz,' 10 115 115 108 112 32 61 58 32 73 70 87 73 78 32 112 105 99 107 32'
zz=:zz,' 39 47 117 115 114 47 108 105 98 47 39 59 39 68 58 92 79 112 101 11'
zz=:zz,'0 83 83 76 45 87 105 110 54 52 92 98 105 110 92 39 13 10 78 66 46 3'
zz=:zz,'2 79 80 69 78 83 83 76 32 61 58 32 106 112 97 116 104 32 39 126 115'
zz=:zz,' 121 115 116 101 109 47 115 115 108 101 97 121 51 50 46 100 108 108'
zz=:zz,' 32 39 13 10 78 66 46 79 80 69 78 83 83 76 32 61 58 32 115 115 108 '
zz=:zz,'112 32 44 32 39 92 115 115 108 101 97 121 51 50 46 100 108 108 32 3'
zz=:zz,'9 13 10 79 80 69 78 83 83 76 32 61 58 32 115 115 108 112 32 44 32 4'
zz=:zz,'0 73 70 73 79 83 32 43 32 40 59 58 32 39 87 105 110 32 76 105 110 1'
zz=:zz,'17 120 32 65 110 100 114 111 105 100 32 68 97 114 119 105 110 39 41'
zz=:zz,' 32 105 46 32 60 85 78 65 77 69 95 122 95 41 32 112 105 99 107 32 3'
zz=:zz,'9 108 105 98 101 97 121 51 50 46 100 108 108 32 39 59 32 40 50 32 3'
zz=:zz,'6 32 60 39 108 105 98 115 115 108 46 115 111 32 39 41 59 32 32 40 5'
zz=:zz,'0 32 36 32 60 39 108 105 98 115 115 108 46 100 121 108 105 98 32 39'
zz=:zz,' 41 13 10 78 66 46 79 80 69 78 83 83 76 32 61 58 32 115 115 108 112'
zz=:zz,' 32 44 32 40 73 70 73 79 83 32 43 32 40 59 58 32 39 87 105 110 32 7'
zz=:zz,'6 105 110 117 120 32 65 110 100 114 111 105 100 32 68 97 114 119 10'
zz=:zz,'5 110 39 41 32 105 46 32 60 85 78 65 77 69 95 122 95 41 32 112 105 '
zz=:zz,'99 107 32 39 108 105 98 101 97 121 51 50 46 100 108 108 32 39 59 32'
zz=:zz,' 40 50 32 36 32 60 39 108 105 98 115 115 108 46 115 111 32 39 41 59'
zz=:zz,' 32 32 40 50 32 36 32 60 39 108 105 98 115 115 108 46 48 46 57 46 5'
zz=:zz,'6 46 100 121 108 105 98 32 39 41 13 10 83 83 76 69 32 61 58 32 115 '
zz=:zz,'115 108 112 32 44 32 39 92 111 112 101 110 115 115 108 39 13 10 115'
zz=:zz,' 115 108 32 61 58 32 49 32 58 32 39 40 79 80 69 78 83 83 76 32 44 3'
zz=:zz,'2 109 41 38 99 100 39 13 10 82 83 65 98 105 116 115 32 61 58 32 54 '
zz=:zz,'52 13 10 82 83 65 112 69 32 61 58 32 51 32 93 32 54 53 53 51 55 13 '
zz=:zz,'10 115 115 108 115 104 97 50 53 54 32 61 58 32 39 32 83 72 65 50 53'
zz=:zz,' 54 32 105 32 42 99 32 108 32 42 99 39 32 115 115 108 13 10 115 115'
zz=:zz,' 108 115 104 97 53 49 50 32 61 58 32 39 32 83 72 65 53 49 50 32 105'
zz=:zz,' 32 42 99 32 108 32 42 99 39 32 115 115 108 13 10 115 115 108 115 1'
zz=:zz,'04 97 49 32 61 58 32 39 32 83 72 65 49 32 105 32 42 99 32 108 32 42'
zz=:zz,' 99 39 32 115 115 108 13 10 115 115 108 82 73 80 69 77 68 49 54 48 '
zz=:zz,'32 61 58 32 39 32 82 73 80 69 77 68 49 54 48 32 105 32 42 99 32 108'
zz=:zz,' 32 42 99 39 32 115 115 108 13 10 115 114 49 54 48 61 58 32 51 32 5'
zz=:zz,'8 32 48 13 10 111 117 116 112 117 116 61 58 32 40 50 48 41 32 35 32'
zz=:zz,' 39 32 39 13 10 115 115 108 82 73 80 69 77 68 49 54 48 32 40 121 41'
zz=:zz,' 59 40 35 32 121 41 59 111 117 116 112 117 116 13 10 111 117 116 11'
zz=:zz,'2 117 116 13 10 41 13 10 115 104 97 49 32 61 58 32 51 32 58 32 48 1'
zz=:zz,'3 10 111 117 116 112 117 116 61 58 32 40 50 48 41 32 35 32 39 32 39'
zz=:zz,' 13 10 115 115 108 115 104 97 49 32 40 121 41 59 40 35 32 121 41 59'
zz=:zz,' 111 117 116 112 117 116 13 10 111 117 116 112 117 116 13 10 41 13 '
zz=:zz,'10 115 53 49 50 32 61 58 32 51 32 58 32 48 13 10 111 117 116 112 11'
zz=:zz,'7 116 61 58 32 40 54 52 41 32 35 32 39 32 39 13 10 115 115 108 115 '
zz=:zz,'104 97 53 49 50 32 40 121 41 59 40 35 32 121 41 59 111 117 116 112 '
zz=:zz,'117 116 13 10 111 117 116 112 117 116 13 10 41 13 10 115 50 53 54 3'
zz=:zz,'2 61 58 32 51 32 58 32 48 13 10 111 117 116 112 117 116 61 58 32 40'
zz=:zz,' 51 50 41 32 35 32 39 32 39 13 10 115 115 108 115 104 97 50 53 54 3'
zz=:zz,'2 40 121 41 59 40 35 32 121 41 59 111 117 116 112 117 116 13 10 111'
zz=:zz,' 117 116 112 117 116 13 10 41 13 10 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 70 111 114 32 10'
zz=:zz,'5 110 102 111 114 109 97 116 105 111 110 32 97 98 111 117 116 32 74'
zz=:zz,' 32 102 111 114 117 109 115 32 115 101 101 32 104 116 116 112 58 47'
zz=:zz,' 47 119 119 119 46 106 115 111 102 116 119 97 114 101 46 99 111 109'
zz=:zz,' 47 102 111 114 117 109 115 46 104 116 109 13 10 13 10 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 '
zz=:zz,'10 70 111 114 32 105 110 102 111 114 109 97 116 105 111 110 32 97 9'
zz=:zz,'8 111 117 116 32 74 32 102 111 114 117 109 115 32 115 101 101 32 10'
zz=:zz,'4 116 116 112 58 47 47 119 119 119 46 106 115 111 102 116 119 97 11'
zz=:zz,'4 101 46 99 111 109 47 102 111 114 117 109 115 46 104 116 109{a.);'''
zz=:zz,'exampleRIPEMD160Hash'';21;(13 10 114 101 113 117 105 114 101 32 39 1'
zz=:zz,'00 108 108 39 13 10 13 10 78 66 46 32 112 97 116 104 32 105 115 32 '
zz=:zz,'109 97 99 104 105 110 101 32 115 112 101 99 105 102 105 99 32 45 32'
zz=:zz,' 109 97 99 104 105 110 101 32 109 117 115 116 32 98 101 32 54 52 32'
zz=:zz,' 98 105 116 32 13 10 115 115 108 112 32 61 58 32 73 70 87 73 78 32 '
zz=:zz,'112 105 99 107 32 39 47 117 115 114 47 108 105 98 47 39 59 39 67 58'
zz=:zz,' 92 106 54 52 92 106 54 52 45 56 48 50 92 98 105 110 92 39 13 10 13'
zz=:zz,' 10 79 80 69 78 83 83 76 32 61 58 32 115 115 108 112 32 44 32 40 73'
zz=:zz,' 70 73 79 83 32 43 32 40 59 58 32 39 87 105 110 32 76 105 110 117 1'
zz=:zz,'20 32 65 110 100 114 111 105 100 32 68 97 114 119 105 110 39 41 32 '
zz=:zz,'105 46 32 60 85 78 65 77 69 95 122 95 41 32 112 105 99 107 32 39 10'
zz=:zz,'8 105 98 101 97 121 51 50 46 100 108 108 32 39 59 32 40 50 32 36 32'
zz=:zz,' 60 39 108 105 98 115 115 108 46 115 111 32 39 41 59 32 32 40 50 32'
zz=:zz,' 36 32 60 39 108 105 98 115 115 108 46 100 121 108 105 98 32 39 41 '
zz=:zz,'13 10 13 10 78 66 46 32 83 83 76 69 32 61 58 32 115 115 108 112 32 '
zz=:zz,'44 32 39 92 111 112 101 110 115 115 108 39 13 10 13 10 115 115 108 '
zz=:zz,'32 61 58 32 49 32 58 32 39 40 79 80 69 78 83 83 76 32 44 32 109 41 '
zz=:zz,'38 99 100 39 13 10 82 83 65 98 105 116 115 32 61 58 32 54 52 13 10 '
zz=:zz,'82 83 65 112 69 32 61 58 32 51 32 93 32 54 53 53 51 55 13 10 115 11'
zz=:zz,'5 108 115 104 97 50 53 54 32 61 58 32 39 32 83 72 65 50 53 54 32 10'
zz=:zz,'5 32 42 99 32 108 32 42 99 39 32 115 115 108 13 10 115 115 108 115 '
zz=:zz,'104 97 53 49 50 32 61 58 32 39 32 83 72 65 53 49 50 32 105 32 42 99'
zz=:zz,' 32 108 32 42 99 39 32 115 115 108 13 10 115 115 108 115 104 97 49 '
zz=:zz,'32 61 58 32 39 32 83 72 65 49 32 105 32 42 99 32 108 32 42 99 39 32'
zz=:zz,' 115 115 108 13 10 115 115 108 82 73 80 69 77 68 49 54 48 32 61 58 '
zz=:zz,'32 39 32 82 73 80 69 77 68 49 54 48 32 105 32 42 99 32 108 32 42 99'
zz=:zz,' 39 32 115 115 108 13 10 13 10 115 114 49 54 48 61 58 32 51 32 58 3'
zz=:zz,'2 48 13 10 111 117 116 112 117 116 61 58 32 40 50 48 41 32 35 32 39'
zz=:zz,' 32 39 13 10 115 115 108 82 73 80 69 77 68 49 54 48 32 40 121 41 59'
zz=:zz,' 40 35 32 121 41 59 111 117 116 112 117 116 13 10 111 117 116 112 1'
zz=:zz,'17 116 13 10 41 13 10 13 10 115 104 97 49 32 61 58 32 51 32 58 32 4'
zz=:zz,'8 13 10 111 117 116 112 117 116 61 58 32 40 50 48 41 32 35 32 39 32'
zz=:zz,' 39 13 10 115 115 108 115 104 97 49 32 40 121 41 59 40 35 32 121 41'
zz=:zz,' 59 111 117 116 112 117 116 13 10 111 117 116 112 117 116 13 10 41 '
zz=:zz,'13 10 13 10 115 53 49 50 32 61 58 32 51 32 58 32 48 13 10 111 117 1'
zz=:zz,'16 112 117 116 61 58 32 40 54 52 41 32 35 32 39 32 39 13 10 115 115'
zz=:zz,' 108 115 104 97 53 49 50 32 40 121 41 59 40 35 32 121 41 59 111 117'
zz=:zz,' 116 112 117 116 13 10 111 117 116 112 117 116 13 10 41 13 10 13 10'
zz=:zz,' 115 50 53 54 32 61 58 32 51 32 58 32 48 13 10 111 117 116 112 117 '
zz=:zz,'116 61 58 32 40 51 50 41 32 35 32 39 32 39 13 10 115 115 108 115 10'
zz=:zz,'4 97 50 53 54 32 40 121 41 59 40 35 32 121 41 59 111 117 116 112 11'
zz=:zz,'7 116 13 10 111 117 116 112 117 116 13 10 41 13 10 13 10 13 10 104 '
zz=:zz,'101 120 104 97 115 104 32 61 58 32 40 32 91 58 32 44 64 58 104 102 '
zz=:zz,'100 32 97 46 105 46 93 41 64 58 13 10 13 10 78 66 46 32 116 101 115'
zz=:zz,' 116 32 104 97 115 104 32 119 105 116 104 32 102 111 108 108 111 11'
zz=:zz,'9 105 110 103 32 105 100 101 110 116 105 116 121 13 10 13 10 32 39 '
zz=:zz,'100 48 50 101 57 49 98 51 57 55 49 99 48 52 98 54 56 57 49 55 52 10'
zz=:zz,'1 51 102 57 102 50 49 54 98 52 102 53 57 55 50 102 54 50 102 39 32 '
zz=:zz,'45 58 32 116 111 108 111 119 101 114 32 115 114 49 54 48 32 104 101'
zz=:zz,' 120 104 97 115 104 32 39 103 111 32 97 104 101 97 100 32 104 97 11'
zz=:zz,'5 104 32 109 121 32 100 97 121 32 45 32 105 32 97 109 32 101 120 11'
zz=:zz,'2 101 99 116 105 110 103 32 97 32 50 48 32 98 121 116 101 32 104 97'
zz=:zz,' 115 104 39 13 10 13 10{a.);''prjBitJD'';21;78 66 46 42 112 114 106 6'
zz=:zz,'6 105 116 74 68 32 115 45 45 32 66 105 116 74 68 32 112 114 111 106'
zz=:zz,' 101 99 116 32 115 101 116 117 112 32 115 99 114 105 112 116 46 13 '
zz=:zz,'10 78 66 46 32 13 10 78 66 46 32 80 114 101 112 97 114 97 116 105 1'
zz=:zz,'11 110 115 32 102 111 114 32 74 32 74 117 108 121 32 50 52 45 50 53'
zz=:zz,' 44 32 50 48 49 52 32 99 111 110 102 101 114 101 110 99 101 32 112 '
zz=:zz,'114 101 115 101 110 116 97 116 105 111 110 46 13 10 78 66 46 13 10 '
zz=:zz,'78 66 46 32 85 115 105 110 103 32 116 104 101 32 74 68 32 100 97 11'
zz=:zz,'6 97 98 97 115 101 32 97 100 100 111 110 32 116 111 32 97 110 97 10'
zz=:zz,'8 121 122 101 32 66 105 116 99 111 105 110 32 98 108 111 99 107 32 '
zz=:zz,'100 97 116 97 46 13 10 78 66 46 13 10 78 66 46 32 118 101 114 98 97'
zz=:zz,' 116 105 109 58 13 10 78 66 46 32 13 10 78 66 46 32 32 32 49 32 114'
zz=:zz,' 109 32 39 112 114 106 66 105 116 74 68 39 32 91 32 111 100 32 59 5'
zz=:zz,'8 39 98 105 116 106 100 32 117 116 105 108 115 39 32 91 32 51 32 11'
zz=:zz,'1 100 32 39 39 13 10 78 66 46 32 32 13 10 78 66 46 32 97 117 116 10'
zz=:zz,'4 111 114 58 32 32 74 111 104 110 32 68 46 32 66 97 107 101 114 13 '
zz=:zz,'10 78 66 46 32 99 114 101 97 116 101 100 58 32 50 48 49 52 106 117 '
zz=:zz,'110 50 50 13 10 78 66 46 32 99 104 97 110 103 101 115 58 32 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 13 10 78 66 46 32 49 52 106 117 110 50 50 32 115 '
zz=:zz,'116 97 114 116 32 119 111 114 107 32 111 110 32 112 114 101 115 101'
zz=:zz,' 110 116 97 116 105 111 110 13 10 13 10 13 10 78 66 46 32 109 97 10'
zz=:zz,'7 101 47 101 120 101 99 117 116 101 32 115 101 116 117 112 13 10 78'
zz=:zz,' 66 46 32 106 111 100 103 95 105 106 111 100 95 32 61 58 32 39 66 1'
zz=:zz,'05 116 74 68 83 101 116 117 112 39 13 10 115 109 111 117 116 112 11'
zz=:zz,'7 116 32 108 103 32 39 66 105 116 74 68 83 101 116 117 112 39 13 10'
zz=:zz,' 66 105 116 74 68 83 101 116 117 112 32 48 13 10 13 10 78 66 46 32 '
zz=:zz,'98 105 116 99 111 105 110 32 98 108 111 99 107 32 98 114 101 97 107'
zz=:zz,' 101 114 32 103 114 111 117 112 13 10 78 66 46 32 106 111 100 103 9'
zz=:zz,'5 105 106 111 100 95 32 61 58 32 39 66 105 116 74 68 66 108 111 99 '
zz=:zz,'107 66 114 101 97 107 101 114 39 13 10 13 10 78 66 46 32 98 105 116'
zz=:zz,' 99 111 105 110 32 74 68 32 103 114 111 117 112 13 10 78 66 46 32 1'
zz=:zz,'06 111 100 103 95 105 106 111 100 95 32 61 58 32 39 66 105 116 74 6'
zz=:zz,'8 39 13 10 13 10 78 66 46 32 100 117 109 112 32 102 105 108 101 32 '
zz=:zz,'110 111 114 109 97 108 105 122 101 114 13 10 106 111 100 103 95 105'
zz=:zz,' 106 111 100 95 61 58 32 39 78 111 114 109 97 108 105 122 101 66 10'
zz=:zz,'8 111 99 107 67 104 97 105 110 67 83 86 39 13 10 13 10 13 10 115 10'
zz=:zz,'9 111 117 116 112 117 116 32 39 66 105 116 99 111 105 110 47 74 68 '
zz=:zz,'32 112 114 101 115 101 110 116 97 116 105 111 110 32 112 114 111 10'
zz=:zz,'6 101 99 116 32 115 101 116 117 112 46 39{a.                       '
zz=:50830{.zz
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'9 2$<;._1 ''|Base58CheckCS|C# Base 58 check function example|Base58S'
zz=:zz,'tackOverflowNotes|Stack Overflow Base 58 check notes|BasicBlockChai'
zz=:zz,'nStats|compute basic blockchain statistics|BitcoinBlockSchemaSQL|bl'
zz=:zz,'ockchain database schema examples|LoadJDFullBlockChainDB|load large'
zz=:zz,'r JD blockchain database|LoadJDPartBlockChainDB|load partial JD blo'
zz=:zz,'ckchain database|POST_NormalizeBlockChainCSV|post processor|POST_ss'
zz=:zz,'lhash|post processor|prjBitJD|BitJD project setup script''          '
zz=:459{.zz
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
zz=:''
zz=:zz,'4 2$<;.(_1) 124 66 105 116 74 68 83 101 116 117 112 124 78 66 46 42'
zz=:zz,' 66 105 116 74 68 83 101 116 117 112 32 115 45 45 32 115 101 116 11'
zz=:zz,'7 112 32 119 111 114 107 105 110 103 32 101 110 118 105 114 111 110'
zz=:zz,' 109 101 110 116 32 102 111 114 32 66 105 116 99 111 105 110 47 74 '
zz=:zz,'68 32 112 114 111 106 101 99 116 46 13 10 78 66 46 13 10 78 66 46 3'
zz=:zz,'2 32 13 10 78 66 46 32 97 117 116 104 111 114 58 32 32 74 111 104 1'
zz=:zz,'10 32 68 46 32 66 97 107 101 114 13 10 78 66 46 32 99 114 101 97 11'
zz=:zz,'6 101 100 58 32 50 48 49 52 106 117 110 50 52 13 10 78 66 46 32 99 '
zz=:zz,'104 97 110 103 101 115 58 32 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 78 66 4'
zz=:zz,'6 32 49 52 106 117 110 50 52 32 103 114 111 117 112 32 111 114 103 '
zz=:zz,'97 110 105 122 101 100 32 13 10 78 66 46 32 49 52 106 117 108 48 49'
zz=:zz,' 32 104 97 115 104 32 118 101 114 98 115 32 97 100 100 101 100 32 4'
zz=:zz,'0 115 115 108 104 97 115 104 41 13 10 13 10 114 101 113 117 105 114'
zz=:zz,' 101 32 39 115 115 108 104 97 115 104 39 13 10 13 10 124 78 111 114'
zz=:zz,' 109 97 108 105 122 101 66 108 111 99 107 67 104 97 105 110 67 83 8'
zz=:zz,'6 124 78 66 46 42 78 111 114 109 97 108 105 122 101 66 108 111 99 1'
zz=:zz,'07 67 104 97 105 110 67 83 86 32 115 45 45 32 110 111 114 109 97 10'
zz=:zz,'8 105 122 101 32 67 83 86 32 98 108 111 99 107 99 104 97 105 110 32'
zz=:zz,' 102 105 108 101 115 46 13 10 78 66 46 13 10 78 66 46 32 84 104 105'
zz=:zz,' 115 32 115 99 114 105 112 116 32 110 111 114 109 97 108 105 122 10'
zz=:zz,'1 115 32 116 104 101 32 98 108 111 99 107 99 104 97 105 110 32 32 1'
zz=:zz,'00 97 116 97 32 105 110 32 116 104 101 32 42 46 99 115 118 32 100 1'
zz=:zz,'17 109 112 13 10 78 66 46 32 102 105 108 101 115 32 103 101 110 101'
zz=:zz,' 114 97 116 101 100 32 98 121 32 32 40 98 108 111 99 107 99 104 97 '
zz=:zz,'105 110 54 52 46 101 120 101 41 32 32 97 110 100 32 99 111 110 115 '
zz=:zz,'111 108 105 100 97 116 101 115 32 32 116 104 101 13 10 78 66 46 32 '
zz=:zz,'100 97 116 97 32 32 32 105 110 116 111 32 32 32 116 104 114 101 101'
zz=:zz,' 32 32 32 74 68 32 32 32 100 97 116 97 98 97 115 101 32 32 32 111 1'
zz=:zz,'14 105 101 110 116 101 100 32 32 32 108 111 97 100 32 32 32 102 105'
zz=:zz,' 108 101 115 13 10 78 66 46 32 40 116 114 97 110 115 97 99 116 105 '
zz=:zz,'111 110 115 46 99 115 118 41 44 32 40 105 110 112 117 116 115 46 99'
zz=:zz,' 115 118 41 32 97 110 100 32 40 111 117 116 112 117 116 115 46 99 1'
zz=:zz,'15 118 41 46 13 10 78 66 46 13 10 78 66 46 32 118 101 114 98 97 116'
zz=:zz,' 105 109 58 32 102 111 114 32 109 111 114 101 32 97 98 111 117 116 '
zz=:zz,'32 40 98 108 111 99 107 99 104 97 105 110 54 52 46 101 120 101 41 3'
zz=:zz,'2 115 101 101 13 10 78 66 46 13 10 78 66 46 32 32 32 104 116 116 11'
zz=:zz,'2 115 58 47 47 99 111 100 101 46 103 111 111 103 108 101 46 99 111 '
zz=:zz,'109 47 112 47 98 108 111 99 107 99 104 97 105 110 47 13 10 78 66 46'
zz=:zz,' 13 10 78 66 46 32 105 110 116 101 114 102 97 99 101 32 119 111 114'
zz=:zz,' 100 40 115 41 13 10 78 66 46 32 32 32 78 111 114 109 97 108 105 12'
zz=:zz,'2 101 69 120 112 111 114 116 67 83 86 70 105 108 101 115 32 45 32 1'
zz=:zz,'10 111 114 109 97 108 105 122 101 115 32 67 83 86 32 101 120 112 11'
zz=:zz,'1 114 116 32 102 105 108 101 115 13 10 78 66 46 13 10 78 66 46 32 9'
zz=:zz,'7 117 116 104 111 114 58 32 32 74 111 104 110 32 68 46 32 66 97 107'
zz=:zz,' 101 114 13 10 78 66 46 32 99 114 101 97 116 101 100 58 32 50 48 49'
zz=:zz,' 52 106 117 108 48 53 13 10 78 66 46 32 99 104 97 110 103 101 115 5'
zz=:zz,'8 32 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 13 10 78 66 46 32 49 52 106 117 108 4'
zz=:zz,'8 54 32 99 111 110 118 101 114 116 101 100 32 99 108 97 115 115 32 '
zz=:zz,'103 114 111 117 112 13 10 78 66 46 32 49 52 106 117 108 48 56 32 97'
zz=:zz,' 100 100 101 100 32 40 84 114 97 110 115 97 99 116 105 111 110 70 1'
zz=:zz,'07 101 121 41 32 102 111 114 32 74 68 32 114 101 102 101 114 101 11'
zz=:zz,'0 99 105 110 103 13 10 78 66 46 32 49 52 106 117 108 49 51 32 97 10'
zz=:zz,'0 100 101 100 32 116 111 32 106 97 99 107 115 32 114 101 112 111 11'
zz=:zz,'5 105 116 111 114 121 13 10 13 10 99 111 99 108 97 115 115 32 39 78'
zz=:zz,' 111 114 109 97 108 105 122 101 66 108 111 99 107 67 104 97 105 110'
zz=:zz,' 67 83 86 39 124 80 97 114 115 101 71 101 110 101 115 105 115 66 10'
zz=:zz,'8 111 99 107 124 78 66 46 42 80 97 114 115 101 71 101 110 101 115 1'
zz=:zz,'05 115 66 108 111 99 107 32 115 45 45 32 66 105 116 99 111 105 110 '
zz=:zz,'32 103 101 110 101 115 105 115 32 98 108 111 99 107 32 99 104 101 9'
zz=:zz,'9 107 32 97 110 100 32 112 97 114 115 101 32 101 120 97 109 112 108'
zz=:zz,' 101 46 13 10 78 66 46 32 32 13 10 78 66 46 32 97 117 116 104 111 1'
zz=:zz,'14 58 32 32 74 111 104 110 32 68 46 32 66 97 107 101 114 13 10 78 6'
zz=:zz,'6 46 32 99 114 101 97 116 101 100 58 32 50 48 49 52 106 117 108 48 '
zz=:zz,'49 13 10 78 66 46 32 99 104 97 110 103 101 115 58 32 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 13 10 78 66 46 32 49 52 106 117 108 48 51 32 97 100 100 '
zz=:zz,'101 100 32 116 111 32 106 97 99 107 115 32 114 101 112 111 115 105 '
zz=:zz,'116 111 114 121 13 10 13 10 114 101 113 117 105 114 101 32 39 115 1'
zz=:zz,'15 108 104 97 115 104 39 13 10 13 10 124 115 115 108 104 97 115 104'
zz=:zz,' 124 78 66 46 42 115 115 108 104 97 115 104 32 115 45 45 32 104 97 '
zz=:zz,'115 104 32 97 108 103 111 114 105 116 104 109 115 32 102 114 111 10'
zz=:zz,'9 32 79 112 101 110 83 83 76 46 13 10 78 66 46 13 10 78 66 46 32 77'
zz=:zz,' 97 107 101 115 32 32 118 97 114 105 111 117 115 32 32 104 97 115 1'
zz=:zz,'04 32 32 97 108 103 111 114 105 116 104 109 115 32 32 97 118 97 105'
zz=:zz,' 108 97 98 108 101 32 32 105 110 32 32 116 104 101 32 32 79 112 101'
zz=:zz,' 110 83 83 76 13 10 78 66 46 32 98 105 110 97 114 105 101 115 32 10'
zz=:zz,'5 110 115 116 97 108 108 101 100 32 119 105 116 104 32 106 113 116 '
zz=:zz,'32 56 46 48 120 32 97 118 97 105 108 97 98 108 101 46 32 70 114 111'
zz=:zz,' 109 32 97 110 32 32 111 114 105 103 105 110 97 108 13 10 78 66 46 '
zz=:zz,'32 100 101 109 111 32 115 99 114 105 112 116 32 98 121 32 80 97 115'
zz=:zz,' 99 97 108 32 74 97 115 109 105 110 32 119 105 116 104 32 97 100 10'
zz=:zz,'6 117 115 116 109 101 110 116 115 32 98 121 32 66 105 108 108 32 76'
zz=:zz,' 97 109 46 13 10 78 66 46 13 10 78 66 46 32 118 101 114 98 97 116 1'
zz=:zz,'05 109 58 32 115 101 101 32 104 116 116 112 58 47 47 119 119 119 46'
zz=:zz,' 111 112 101 110 115 115 108 46 111 114 103 47 13 10 78 66 46 32 13'
zz=:zz,' 10 78 66 46 32 104 116 116 112 58 47 47 119 119 119 46 106 115 111'
zz=:zz,' 102 116 119 97 114 101 46 99 111 109 47 106 119 105 107 105 47 80 '
zz=:zz,'97 115 99 97 108 74 97 115 109 105 110 47 83 72 65 37 50 48 49 37 5'
zz=:zz,'0 67 37 50 48 50 37 50 48 97 110 100 37 50 48 77 68 53 37 50 48 102'
zz=:zz,' 111 114 37 50 48 119 105 110 100 111 119 115 13 10 78 66 46 13 10 '
zz=:zz,'78 66 46 32 105 110 116 101 114 102 97 99 101 32 119 111 114 100 40'
zz=:zz,' 115 41 58 13 10 78 66 46 13 10 78 66 46 32 32 115 50 53 54 32 32 4'
zz=:zz,'5 32 83 72 65 50 53 54 32 104 97 115 104 32 102 114 111 109 32 79 1'
zz=:zz,'12 101 110 83 83 76 13 10 78 66 46 32 32 115 53 49 50 32 32 45 32 8'
zz=:zz,'3 72 65 53 49 50 32 104 97 115 104 32 102 114 111 109 32 79 112 101'
zz=:zz,' 110 83 83 76 13 10 78 66 46 32 32 115 104 97 49 32 32 45 32 83 72 '
zz=:zz,'65 49 32 104 97 115 104 32 102 114 111 109 32 79 112 101 110 83 83 '
zz=:zz,'76 13 10 78 66 46 32 32 115 114 49 54 48 32 45 32 82 73 80 69 77 68'
zz=:zz,' 45 49 54 48 32 104 97 115 104 32 102 114 111 109 32 79 112 101 110'
zz=:zz,' 83 83 76 13 10 78 66 46 13 10 78 66 46 32 99 114 101 97 116 101 10'
zz=:zz,'0 58 32 50 48 49 52 74 117 110 50 56 13 10 78 66 46 32 99 104 97 11'
zz=:zz,'0 103 101 115 58 32 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 78 66 46 32 49 5'
zz=:zz,'2 106 117 110 51 48 32 99 104 97 110 103 101 100 32 116 111 32 114 '
zz=:zz,'117 110 32 111 110 32 51 50 32 98 105 116 32 115 121 115 116 101 10'
zz=:zz,'9 115 13 10 78 66 46 32 49 52 106 117 108 48 51 32 97 100 100 101 1'
zz=:zz,'00 32 116 111 32 106 97 99 107 115 32 114 101 112 111 115 105 116 1'
zz=:zz,'11 114 121 13 10 78 66 46 32 49 52 106 117 108 48 55 32 100 108 108'
zz=:zz,' 32 112 114 111 116 111 116 121 112 101 115 32 97 100 106 117 115 1'
zz=:zz,'16 101 100 32 102 111 114 32 112 111 114 116 97 98 105 108 105 116 '
zz=:zz,'121 13 10 13 10 99 111 99 108 97 115 115 32 39 115 115 108 104 97 1'
zz=:zz,'15 104 39 13 10 13 10 78 66 46 42 100 101 112 101 110 100 101 110 1'
zz=:zz,'16 115 13 10 13 10 78 66 46 32 112 114 111 102 105 108 101 32 38 32'
zz=:zz,' 114 101 113 117 105 114 101 32 119 111 114 100 115 32 33 40 42 41 '
zz=:zz,'61 46 32 73 70 73 79 83 32 85 78 65 77 69 13 10 13 10 78 66 46 32 1'
zz=:zz,'00 108 108 47 115 111 32 105 115 32 109 97 99 104 105 110 101 47 11'
zz=:zz,'1 115 32 115 112 101 99 105 102 105 99 32 45 32 97 115 115 117 109 '
zz=:zz,'101 115 32 106 113 116 32 56 46 48 50 32 105 115 32 105 110 115 116'
zz=:zz,' 97 108 108 101 100 13 10 79 80 69 78 83 83 76 61 58 32 59 40 73 70'
zz=:zz,' 73 79 83 32 43 32 40 59 58 39 87 105 110 32 76 105 110 117 120 32 '
zz=:zz,'65 110 100 114 111 105 100 32 68 97 114 119 105 110 39 41 32 105 46'
zz=:zz,' 32 60 85 78 65 77 69 41 32 123 32 39 108 105 98 101 97 121 51 50 4'
zz=:zz,'6 100 108 108 32 39 59 32 40 50 32 36 32 60 39 108 105 98 115 115 1'
zz=:zz,'08 46 115 111 32 39 41 59 32 40 50 32 36 32 60 39 108 105 98 115 11'
zz=:zz,'5 108 46 100 121 108 105 98 32 39 41 13 10 13 10 78 66 46 32 99 97 '
zz=:zz,'108 108 32 100 108 108 13 10 99 100 61 58 49 53 33 58 48 13 10 13 1'
zz=:zz,'0 115 115 108 115 104 97 50 53 54 61 58 32 32 32 32 40 79 80 69 78 '
zz=:zz,'83 83 76 32 44 32 39 32 83 72 65 50 53 54 32 62 32 43 32 120 32 42 '
zz=:zz,'99 32 120 32 42 99 39 41 38 99 100 13 10 115 115 108 115 104 97 53 '
zz=:zz,'49 50 61 58 32 32 32 32 40 79 80 69 78 83 83 76 32 44 32 39 32 83 7'
zz=:zz,'2 65 53 49 50 32 62 32 43 32 120 32 42 99 32 120 32 42 99 39 41 38 '
zz=:zz,'99 100 13 10 115 115 108 115 104 97 49 61 58 32 32 32 32 32 32 40 7'
zz=:zz,'9 80 69 78 83 83 76 32 44 32 39 32 83 72 65 49 32 62 32 43 32 120 3'
zz=:zz,'2 42 99 32 120 32 42 99 39 41 38 99 100 13 10 115 115 108 82 73 80 '
zz=:zz,'69 77 68 49 54 48 61 58 32 40 79 80 69 78 83 83 76 32 44 32 39 32 8'
zz=:zz,'2 73 80 69 77 68 49 54 48 32 62 32 43 32 120 32 42 99 32 120 32 42 '
zz=:zz,'99 39 41 38 99 100 13 10 13 10 78 66 46 42 101 110 100 100 101 112 '
zz=:zz,'101 110 100 101 110 116 115 13 10{a.                               '
zz=:9617{.zz
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'6 2$<;._1 ''|BitJD|use JD database addon to analyze Bitcoin block da'
zz=:zz,'ta|BitJDBlockBreaker|parse/extract selected items from Bitcoin blkn'
zz=:zz,'nnnn.dat block files|BitJDSetup|setup Bitcoin/JD project|NormalizeB'
zz=:zz,'lockChainCSV|normalize CSV blockchain files|ParseGenesisBlock|Bitco'
zz=:zz,'in genesis block check and parse example|sslhash|hash algorithms fr'
zz=:zz,'om OpenSSL''                                                        '
zz=:346{.zz
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',:<;.(_1) 59 59 98 105 116 106 100 32 45 32 66 105 116 99 111 105 1'
zz=:zz,'10 47 74 68 32 101 120 112 101 114 105 109 101 110 116 115 13 10 61'
zz=:zz,' 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 '
zz=:zz,'61 61 61 61 61 61 61 13 10 13 10 96 98 105 116 106 100 96 32 105 11'
zz=:zz,'5 32 97 32 74 79 68 32 100 105 99 116 105 111 110 97 114 121 32 116'
zz=:zz,' 104 97 116 32 99 111 110 116 97 105 110 115 32 99 111 100 101 13 1'
zz=:zz,'0 119 114 105 116 116 101 110 32 116 111 32 97 110 97 108 121 122 1'
zz=:zz,'01 32 66 105 116 99 111 105 110 32 98 108 111 99 107 32 100 97 116 '
zz=:zz,'97 32 119 105 116 104 32 116 104 101 32 13 10 91 74 68 32 100 97 11'
zz=:zz,'6 97 98 97 115 101 32 115 121 115 116 101 109 93 40 104 116 116 112'
zz=:zz,' 58 47 47 119 119 119 46 106 115 111 102 116 119 97 114 101 46 99 1'
zz=:zz,'11 109 47 106 119 105 107 105 47 65 100 100 111 110 115 47 100 97 1'
zz=:zz,'16 97 47 106 100 41 46 32 13 10 13 10 96 98 105 116 106 100 96 32 1'
zz=:zz,'19 97 115 32 100 101 118 101 108 111 112 101 100 32 119 104 105 108'
zz=:zz,' 101 13 10 112 114 101 112 97 114 105 110 103 32 97 32 112 114 101 '
zz=:zz,'115 101 110 116 97 116 105 111 110 32 102 111 114 32 116 104 101 32'
zz=:zz,' 74 117 108 121 32 50 52 45 50 53 44 32 50 48 49 52 13 10 91 74 32 '
zz=:zz,'50 48 49 52 32 99 111 110 102 101 114 101 110 99 101 93 40 104 116 '
zz=:zz,'116 112 58 47 47 119 119 119 46 106 115 111 102 116 119 97 114 101 '
zz=:zz,'46 99 111 109 47 106 119 105 107 105 47 67 111 109 109 117 110 105 '
zz=:zz,'116 121 47 67 111 110 102 101 114 101 110 99 101 50 48 49 52 35 83 '
zz=:zz,'99 104 101 100 117 108 101 41 32 13 10 105 110 32 84 111 114 111 11'
zz=:zz,'0 116 111 32 79 110 116 97 114 105 111 46 13 10 13 10 32 32 32 32 3'
zz=:zz,'2 32 32 32 32 32 32 100 105 100 32 48 32 32 13 10 32 32 32 32 32 32'
zz=:zz,' 32 32 43 45 43 45 45 45 45 45 43 45 45 45 45 45 43 13 10 32 32 32 '
zz=:zz,'32 32 32 32 32 124 49 124 98 105 116 106 100 124 117 116 105 108 11'
zz=:zz,'5 124 13 10 32 32 32 32 32 32 32 32 43 45 43 45 45 45 45 45 43 45 4'
zz=:zz,'5 45 45 45 43 13 10 13 10 83 101 101 32 116 104 101 32 98 108 111 1'
zz=:zz,'03 32 112 111 115 116 105 110 103 115 32 102 111 114 32 109 111 114'
zz=:zz,' 101 32 100 101 116 97 105 108 115 46 13 10 13 10 49 46 32 91 66 11'
zz=:zz,'4 101 97 107 105 110 103 32 66 105 116 99 111 105 110 32 66 108 111'
zz=:zz,' 99 107 115 32 119 105 116 104 32 74 93 40 104 116 116 112 58 47 47'
zz=:zz,' 98 97 107 101 114 106 100 57 57 46 119 111 114 100 112 114 101 115'
zz=:zz,' 115 46 99 111 109 47 41 13 10 50 46 32 91 83 112 101 108 117 110 1'
zz=:zz,'07 105 110 103 32 105 110 32 66 105 116 99 111 105 110 32 66 108 11'
zz=:zz,'1 99 107 115 32 119 105 116 104 32 74 68 93 40 104 116 116 112 58 4'
zz=:zz,'7 47 98 97 107 101 114 106 100 57 57 46 119 111 114 100 112 114 101'
zz=:zz,' 115 115 46 99 111 109 47 41 13 10 13 10{a.                        '
zz=:2522{.zz
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
