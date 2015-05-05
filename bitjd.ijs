NB. JOD dictionary dump:  5 May 2015 13:00:03
NB. Generated with JOD version; 0.9.972; 4; 5 Apr 2015 13:06:21
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

IFACEWORDSsslhash=:<;._1 ' sr160 sha1 sha1dir s256 s512'

INAFTERCOLUMNS=:<;._1 ' InputHash OutputKey'

INPUTCOLUMNS=:<;._1 ' InputAmount InputHash TransactionHash TransactionFkey InputKey InputSequenceNumber InputSigFormat InputSigLength InputTransactionIndex'

INPUTSFILE=:'c:/bitjddata/jdcsv/inputs.csv'

JDCSVDIRECTORY=:'c:/bitjddata/jdcsv/'

MonthHits=:7 13$'year';'jan';'feb';'mar';'apr';'may';'jun';'jul';'aug';'sep';'oct';'nov';'dec';2009;0;0;0;0;0;0;0;0;126;194;59;52;2010;63;215;82;164;319;267;316;1088;445;276;432;653;2011;638;676;407;334;257;475;469;412;349;339;556;718;2012;671;587;676;593;1008;1457;845;800;947;956;1085;1334;2013;1121;969;1188;1023;861;729;588;975;798;899;811;1057;2014;1080;799;854;1144;878;843;1247;1115;1039;998;943;4

OPENSSL=:'c:/j64/j64-802/bin/libeay32.dll '

OUTPUTCOLUMNS=:<;._1 ' OutputKey TransactionHash TransactionFkey OutputKeyFormat OutputScriptLength OutputValue'

OUTPUTSFILE=:'c:/bitjddata/jdcsv/outputs.csv'

ROOTWORDSNormalizeBlockChainCSV=:<;._1 ' IFACEWORDSNormalizeBlockChainCSV NormalizeExportCSVFiles ROOTWORDSNormalizeBlockChainCSV'

ROOTWORDSsslhash=:<;._1 ' IFACEWORDSsslhash OPENSSL ROOTWORDSsslhash s256 s512 sha1dir sr160'

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

sha1dir=:3 : 0

NB.*sha1dir v-- compute sha1 hashes for files matching pattern in directory.
NB.
NB. monad:  btcl =. sha1dir clPathRoot
NB.
NB.    sha1dir 'c:/pd/blog/wp2latex/*.tex'

jfe=. ] #~ [: -. [: +./\. '/'&=   NB. just file extension
hdl=. [: , [: hfd2 a. i. ]        NB. hexidecimal list from integers

NB. standard profile !(*)=. dir
(jfe&.> files) ,.~ hdl @ sha1 @ read&.> files=. 1 dir y 
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
1GCa12)HF2+>GSn2)-4/1E\P0+>t>t1a"M-+>Y\o0fC.01*A;-+>khq0ea_+0d&22+>u/$1,9t.
1*AIt3$9q0+>c#"0fU:53?U(9+>l,$1,U112BXe2+>l&"0fL430d&2-+>ktu0esk+3$9q0+>Y\o
0f1".2]sh3+>bnt1,C%.2]t%%1c-=01E\D4+>GSn1GBq+0d&8/+>Get1,g=30d&>3+>Gbs1Gp:0
1E\J0+>PYo1c-=03$9t6+>Gbs1,C%-0H`,/+>Get1G^..2'=\1+>k9!2]sn!1GL"3+>Ynu2'=\6
+>Y,s3$:%#1,L+0+>Ynu1*A;3+>b2r1a"Ut1,L+1+>P\p2]st<+>k8s3$9q2+>Ynu2]sn2+?:Q#
1E\\#1G^.1+>bo@A8YpDA7T^lF)sZ^FCT6'DBN@uA9)7&F!,(5EZdYc@;L48AKZ).AKXBLFC?;0
Dfd+DBOr;SEbT].CdE/b@:NtMEa`j,@:OCnDf/*SF(f-+@<?U"@q[!,Ea`j,@:OCnDf-\2@<6*)
FDi:9DIdI)Bk2?pC`mG0E-68D05kuPF`_[k5uU303'q>$@rH(!+C\c#AKWii+CT)*BOP@]F@'DW
AMlG7BOt[h6>:OODeX)3@UX=h+>l,$@:WnhATMo8AoD^,@<=hEF(I3g6YL%@CJA_XASc4%A7]R"
6=FqH2)ms:ARfKuG%G]'6=FqH2)o2g94`B,2)[<7@X3',+E2I4Ch[B%6>:OODeX)3CLqc6@X3',
F!,RC+C\c#AKWii+D,P4D..NQBlls8;e:&nE+ENlBl7K)G%#E*Dfp+D@VKpoDeX)BC1JH)Dfor=
6YL%@CIN)LARo=_A4(9PD..K?+DGF1FD,6+AKYE%AKYl/+=A]f+Cf(nEa`I"ATDi7Bl5%;/M/.h
EHQ2AARlp)FE2)5B6,1L+E)@8ATE!/F(I^]FB!9hDKB5rFD5Z2;e9TYASuU2@s)m7+@B(.+D,>(
AKYMlFC?;+DKKe>F(K!$ASuU26qKm?<)[[WD.R`rCi`!UDKTf*ATC@<Eb0*+G%De6F_t]1@;L!-
Ao_g,+DG_4F`]9TF`_SFF<GX9@ruF'DBNh*D.RcW=AVdk<'sSb6qL9F6W?iZ=_)5eARfh#Ed8d@
DerruDJ()%F*8[<Bl%@%+D58'ATD4$ARlomGp"MECi<g!@q]:bDDj=(AU%c87qHRLF(o\^Ci<g!
6YKnECh7KsAQ*)ZBlJ0+Bl\9:+@9da@rH(!+Cf(nCi![#B4W3,@rc:&F<E.X@rH7,@;0V#+@SXc
;aDOFF^f0$@j#PuGt2F`ATMR,6>URMCJT(pE-67gA7T^lF)tr-EcZ=F6>:OODeX)3@UX=h+>l,$
Dfp/@F`\a7A7T^lF)soB5sn(B:JsSZ:2b/i@;KY(AO:3O@r"GF@;0UH;c[UMFCfK)@:NjkGAhM4
F!)l&7R9C1=&2^^;bh7OD..6pH=]EZDe!QMBOPUm6W7#7+D5_5F`9oA5sn(B:JsSZF)u/2@<6*r
DKKH1Amo1\+EqaEA9/kA8Oc!579<8_6rS/JChR6uBIP':Ec6)>8PVQ@<(0\P:J=b_:/c7T@;^-p
@ruF'DBNV$F(f-++CTA6@:Nt^A0>;mFCfJ8Bl7m4F>%QTFDuAE+Cf>+F_u#;8PW)^<'sGT<D?4e
Bl7m4F<G(3CisT4+DtV)ATLF<:fUIn7S-9BDJsQ4@;KY(ARlp*Ea`j,@:OCnDf0V=Bl7m4FE:#k
G%G]9;e9TYASuU2Bl8**Ec`F7@<>p#Bl5&'F*8[IAS5jkDKKql6pjmR6qL9F6W?iZ=_M_iA9/l-
DK]T3FCeu*8jje2Ci<g!@q]:bDBNG1Fs(L:E-67FAnc'mF&$XoD..6pH=]NiE,Tc=6W7#TBl%@%
DJsQ4@;KY(ATJt];cY#PG]7SAF<G10Ch7Z`:dn,X;bTu+AStFF9H[h`D/a3*ARlomBl7@"Gp$^5
Ch5XMA8H'5+EMHP+Cob6Bjsk<<)?Ro6VgBU9hnW*F`_SFF<G(3CisT4+DtV)ATLXI<)?Ro;as>P
7;d$aD..6pH=^V0FE1f-F(&R#Bl@l3Dfp/@F`_\#F`_SFFAm9iEccAE@<-H4De:,1F`_SFFE8R=
DBNY2E-68D05kuTE-68D:gnBcAOg<LATMR,6>URMCN*^&F(HI\Blmj'Bl5&+ASu(#BlbD+Ci<g!
;GU(f=&2^^;bh7OD..6pH=]EZDe!QMBOPUm6W7$+Df9_?GAhM4F!)l/:JXqk:JsSZ:2b/i@;KY(
AO:3O@r"GF@;0UH;cY=iB6%p5E$-8G+<Ve):JXqk:JsSZF)u/2@<6+&Df9_?GAhM4F!)l/:JXqk
:JsSZF)u/2@<6*2+D5_5F`:8jB5M3tF@]tOA7]dnDfT]9+Co&$DfT]'Ch\3,A0>r)B5M3tF<G7.
@:Wqi;e:&GDfT]'Ch\3,A4'9r7VQ[MF)to7F!,(;Ci"A>EHP]+BkD'jA0>c.Ec#6$BmO?$+E)CE
E-67FAnc'mF&Z%':/aGG<(Tk\6VgBU9hnW/Ea`j,@:OCnDf0V=@rH1+D/LJ6@;TRs<)Q"W;aEcM
8P`)[7S-9BDJsQ4@;KY(ARlp*Ea`j,@:OCnDf0Vq;aj2Q;FO&H=EJRlDKB5rFD5Z2+EM+,D.RU,
+E2@4AncKhEa`j,@:OCnDf/?_AohO*Eb0?8Ec,q@FE1f-F(&R#Bl@l3De<U&ATT&4F_tT!Eagmc
@q]F`CIW>RH$!V=6>:OODeX)3@UX=h+>l,$@q]F`CER50Df$V+H$!V=@Pp,WA3t!P@rH(!+C\c#
AKWii+D,Y4D'3D7FCf?#ARlooARfFk@;I&<+EM+*+Dbt6B-:`'@s)X"DKK?"BOZ7/ATJu+Ec5e;
BOuEL+Cf414Y@jdAnW;sCe/,^@rlg*Ecb`!@rlf9@r*9"Ec5e;@WZ*r+>"^WAS!!#Df021A8bt#
D.RU,A7f:.3+[>VASu$iA0>Do@qfdgC`m>1Df$U`Blmj'Bl5&&@<6!&2)o,YBOk[aBl.9p+D,Y4
D'3M'GT\R\F*2G@DfTr@+E_XBATAo%DIal+Dg,c5+Cei$AS,q&H#n(9DId0rA8-@$+E;O8Ed8d>
DfT]'FD,8qBOuE2Ao_g,+C]V<ATKmT@r+\IGT].%+D>@r+Cf4SH$!V=Bea=>A7^!.DfTQ)Bl5&3
DIjr)/ord*2H*.41,Us4BOPsq+D,Y4D'2VnAStFF9QN'G1/g_02)-j/BOPsq+D,Y4D'2VnAStFF
9QOlU0iLV/0d(.<F(c\.Ec5e;:N0l_;c?A2BONW+Bl[^%D/aW>AKZ&-@5/m<@<6*nF!,(5EZet.
Ch7Z1D..NrBPD?s+E1b2FCfK1+DG^9A8-'q@ruX0H#n!\2DA$#:dn)H/MT.;+D>2)BHUo-Df$Um
E+Noc;bV7RCf3i$7860)2D?OhA18X2@;Ka&De:+fE+Noc;bS<38PhiM6nL,O0Hb%;F(fW9Cia8u
0dpOB.3N,/Cht54AfslgAStFF9H[8)5qOf6BOPsqF)u/=BONYR2CN'G.3N,/Cht54AfslgAStFF
9H[8)5qOiL2BZ[AF(fW9Cia8u2)-j7@q7#2@ps1i+E(j7:N0l_;c?@4;b02+2)-j/BOPsqG%ki9
G%#E*@:F%a+DbV,B67f0Bl8$(B4Z*+@X3',+Cf>4DKI"0DIal5@;L't                   ~>
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
1*A;.0Jjn-1*A=p0f1RC+>PYo1*A;,0fL412]sju1,1^10esk,+>Yu2+>Get1*A;10Jjn-0H`+n
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
/g+kGFCfK)@:NjkGAhM4.!$gu%15is/g)9X1,Us4+<VdL:-pQU;b0202)ZRj@<6*)Ao_g,+AZrf
DGsJ-%15is/g)9X2)-j/+<VdL:-pQU;b0230eskb@<6*)Ao_g,+AZrfDGsJ-%15is/g)9XBONV<
+<VdL:-pQU;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EM4)0k>!=+<XEG/g+YBD/aW>AKZ&-
@5/m<@<6*nF!,(5EZet.Ch7Z1D..NrBPD?s+E1b2FCfK1+DG^9A8-'q@ruX0Gmt*U67sB'F)iun
0H_J\+AP6U+Atd-7860%0fC^.BOPsq+D,Y4D'2VnAStFF9FV=X%13OO@rGk"EcP`/F<Dr?@<6!-
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
zz=:zz,'slhash cd hfd2 read s256 s512 sha1 sha1dir sr160 sslRIPEMD160 sslsh'
zz=:zz,'a1 sslsha256 sslsha512''                                            '
zz=:1095{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GL"/+>P&o0H`,22'=Y0+?2)3+>Get1,^p22]sh33AEj7F@nr"ATW'6:-pQ_6>:O66rRZ=F`8IE
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
%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/e&._67sB'F##U2+<VdL/Kdt_5r(;U+D>2)BHUo-
Df$UmE+Noc;bRW-:-pQU+EKCp1*@\^+>"^783o*f1*C7=F(c\.Ec5e;:N0l_;c?@!$;No?+<Y`=
@5/lI+<W6Y;b02/+D>2)BHUo-Df$UmE+Noc;bRW-:-pQU+EM4)0k>!=+>"^GDf'H9FCcS9BONV<
BOPsqATJu+DfQt4Bl%@%+DkP/@q]RoB-;/%FED)7DBNY2+Co2,ARfh#Ed8*$:-pQU+EMQX2D?6r
+>"^68PhiM6nL,O0Hb%;F(c\.Ec5e;:N0l_;c?@!$;No?%15is/g+YEART[lA3(hg0JPCVF`&ro
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)l*C3=DM0Hak=@;]^hA0>u4+EDUB+E)-?1GU(^BlkJ=H#n(=D0$-n:-pQU
0f3WfCbRXf@:Wn[A0>u4+DP=pCNCV=AT2R/Bln96Gmt*U67sB81hq/L0K1+bCht55Ec6&<FEqh:
F!+n%C3=T>ARloqDfQt>DfTr.@VKXmFEn<&:-pQU0f<fVGq_)u.!''10k>!=.3N&0A7]9\$4R>P
De!TlF)rHOF)u/2@<6*0%13OO:-pQ_A7]^kDId<rFE7lu%15is/g,+RDe<^"AKW<BEb065Bl[c-
GAhM4F!)VS.OdM5+A#$o:K&B9:-hTC%13OO:-pQUA8H'8F)N18F!,=.@q]RoAM7tC+EML5@qfOh
@j!?G@<6L4D.Rc2C2n><3%cm?+DGm>Bl8!6@;KakA.8lA:dn,X;bT>8+?LuC7S-BS+=eQ_4$"`j
Bl5%eBl8'<+@0mUEc5Z&+@KXYGA1qB.3N=W+?WY!5tscs+F>4YCh[?i@<jXa/nAd7+=B5n-o)nj
+?V#fBju.)CbBdI+=AU"+=Juf,To2sCh[@"F)3I>H#.2(+=ATI$4R>;67sBj@;Ka&A8H&k$=dU0
3\`K83\V!M%17/tCia8u1,UsQ3ZoOf+=L#^78?c[9HYl/-Ql>Y5r(;U+?gnu+F#"Y@j$"=.UshT
-=^Qq$?L9)F(eu>0etmQ+<VdL-r3Z.:/b(b+=nW_+B(fs2)-j/4s2?uGT\JG+F#"Y@j`]P@q6#U
F)u/=BONVY3ZoOf+<VdT:JaJT;c?@4/0H;_;b02/+?gnu+F#"Y@j$"=.UshT-=^Qq$?L9);Fs\R
9gg]o0KhH>-r3Z.:/b(b+=nW_+Atd-7860)2D?7;+=eRZ+=^kDGT\JG-RgBPA.8kT$;No?.V3L.
A7]^kDId<rFE7lu                                                           ~>
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
