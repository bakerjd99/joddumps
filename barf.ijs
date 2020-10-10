NB. JOD dictionary dump: 10 Oct 2020 10:23:09
NB. Generated with JOD version; 1.0.1; 7; 28 Mar 2020 13:01:05
NB. J version: j902/j64avx/windows/beta-h/commercial/www.jsoftware.com/2020-10-03T19:44:09/clang-9-0-0/SLEEF=1
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |barf|181683736220838273170553720203387127126|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DBIBASETYPES=:<;._1 ' U1 U4 U8 I16 I32 F64 D6 C0'

DBISPECIAL=:145 95 241

DBIVERSION=:3

IFACEWORDSdbi=:<;._1 ' dbicreate dbiread dbitemplate dbiwrite dbimetadata'

ROOTWORDSdbi=:<;._1 ' IFACEWORDSdbi ROOTWORDSdbi dbicreate dbiread dbitemplate dbiwrite'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bytebits3=:_8 {."1 [: 2&#.@(0 1&i.)^:_1 a. i. ]

d6=:3 : 0

NB.*d6 v-- convert 7 column integer array timestamps to 6 bytes.
NB.
NB. monad:  cl =. d6 itT7

'not 7 item timestamps' assert isd6 y
,ts6Frts7 y
)

dbicheckdata=:4 : 0

NB.*dbicheckdata v-- tests field name/data table.
NB.
NB. At least  one field must  exist,  field record counts  (first
NB. axis) must  all match  and  all  field  datatypes  must match
NB. expected datatypes from file.
NB.
NB. If the  data passes all tests the result  of this verb  is  a
NB. permutation  list that sorts the data  table into  file field
NB. order. Any  test failure throws an  assertion as these errors
NB. cannot be safely ignored.
NB.
NB. dyad:  ilOrd =. btData dbicheckdata btMetadata

msg=. 'invalid name data table'
msg assert (2=#$x) *. (2={.$x) *. (1<:{:$x) *. isboxed x
msg assert (*./ischar&> 0{x) *. 1 = # ~.#&> 1{x

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{y)=. 1{y

NB. field names must match names in file
pfx=.  <dbiname,'_'
dfnm=. pfx ,&.> fnm
msg assert (0{x) e. dfnm

NB. fields to file order
ord=. /:dfnm i. 0{x
x=. ord {"1 x

NB. mask of fields in data
fmsk=. dfnm e. 0{x

NB. null fields are considered type correct
if. 0=nrf do. ord
else.
  NB. check column counts of any repeated fields
  ccnt=. {:@$&> 1{x
  fnc=. fmsk#fnc
  rmsk=. 0 < fnc

  msg assert (rmsk#fnc) = rmsk#ccnt
  ccnt=. rmsk * #@":&> <"0 ccnt

  ety=. fmsk #"1 }."1 dbifieldtypes y
  ety=. (pfx ,&.> 0{ety) (,0)} ety
  ety=. ((<'is') ,&.> tolower&.> ccnt }.&.> 1{ety) (,1)} ety

  NB. character Cn fields require custom type
  NB. tests other types have (isType) verbs
  if.  +./mc=. ('isc'&-:)@(3&{.)&> 1{ety do.
    NB. NIMP only basic char tests for now
    (mc # 1{ety)=. iscfield
  end.

  NB. apply type tests - they're very fussy and
  NB. are driven by internal noun representations
  NB. ie: if your integers are currently floats
  NB. these type tests will fail. It's the caller's
  NB. job to get basic J types right
  'invalid field type(s)' assert (1{ety) apply&> 1{x
  ord
end.
)

dbicreate=:4 : 0

NB.*dbicreate v-- create dbi file.
NB.
NB. dyad:  iaBytesAlloc =. btNamesTypes dbicreate clPathFile
NB.
NB.   ntab=. <;._1 ' 93 I32 F64 30I16 30U1 D6 C0 C15'
NB.   ntab=. (;:'TEST COUNT HEIGHT SCORE BITS DATE NOTE MESSAGE') ,: ntab
NB.   ntab dbicreate 'c:\temp\test.dbi'
NB.
NB.   NB. clone existing file
NB.   tgdbi=. 'c:\temp\test.dbi' [ srdbi=. 'c:\temp\classes.dbi'
NB.   (dbitemplate srdbi) dbicreate tgdbi
NB.   (dbiread srdbi) dbiwrite tgdbi

'.dbi file exists' assert -.fexist y
'.dbi extension missing' assert 'dbi' -: tolower justext y
msg =. 'invalid name type table' 
msg assert (2=#$x) *. (2={.$x) *. (1<{:$x) *. isboxed x
msg assert (*./ 1 >: ,(#@$)&> x) *. *./,ischar&> x
dbinamecheck 0{x

NB. (-.)=: !(*)=.  fnb fnc fty fsc
(0{dty)=. 1{dty=. dbiparsetypes }. 1{x

NB. records and fields
msg assert 0<:nrf=. _1&". ;0{1{x
nff=. <:{:$x 

NB. total size and field offsets
fbd=. dty dbioffsets nrf,nff
fbd=. }.fbd [ nbf=. 0{fbd

NB. set remaining header items - generate file header
dbiname=. ;(<0;0){x
fir=. DBIVERSION
fts=. nff # ,:t7stmp 6!:0''
fnm=. }. 0{x
dm=.      dbiname;fir;nrf;nff;fnm;fnc;fty;fnb;fsc;fts;fbd
dm=.  (;:'dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd'),:dm
fhd=. dbiheader dm

NB. create file - write header
('unable to write header -> ',y) assert 0<:bytes=. fhd fwrite y

NB. extend file for data
bytes=. (nbf,bytes) fresize y
)

dbifieldtypes=:3 : 0

NB.*dbifieldtypes v-- field types from metadata.
NB.
NB. monad:  bt =. dbifieldtypes btMetadata

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{y)=. 1{y

NB. repetition counts
msk=. fnc > 0
trc=. msk #^:_1 ":&> msk # <"0 fnc

NB. field repetitions and types
tft=. <"1 trc ,. fty ,. ": ,. fnb

NB. scale factors
msk=. fsc > 0
tft=. tft ,&.> msk #^:_1 msk # '.'&,@":&.> <"0 fsc

NB. dbiname and record cnt
|:((dbiname ; ":nrf) , fnm ,. tft) -.&.> ' '
)

dbiheader=:3 : 0

NB.*dbiheader v-- format dbi metadata header.
NB.
NB. monad:  dbiheader btMetadata
NB.
NB.   dbiheader dbimetadata 'C:\BCA\bcadev\CA\ULTCL.DBI'

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{y)=. 1{y
ni32=. nff,4

t1=. (nff,128)$0{a.                         NB. initial descriptors
t1=. (16 {."1 >fnm) (<a:;i. 16)} t1         NB. field names
t1=. (ni32$2 ic fnc) (<a:;16 + i.4)} t1     NB. field repetitions I32
t1=. (ni32$2 ic fnb) (<a:;20 + i.4)} t1     NB. field lengths I32
t1=. fty (<a:;24)} t1                       NB. field types
t1=. (fsc{a.) (<a:;25)} t1                  NB. field scale factors
t1=. (ts6Frts7 fts) (<a:;26 + i.6)} t1      NB. field time stamps
t1=. (ni32$2 ic fbd) (<a:;32 + i.4)} t1     NB. byte offsets to fields I32
t1=. ' ' , t1                               NB. file header
t1=. (4{.'DBI') (<0;i. 4)} t1               NB. .DBI signature
t1=. ('4.2' (;@(8!:0)) fir) (<0;4 + i. 4)} t1  NB. version tag
t1=. (8{.dbiname) (<0;8 + i. 8)} t1         NB. table name       
t1=. (2 ic nrf,nff) (<0;16  + i.8)} t1      NB. number of records & fields 

,t1  NB. cl result    
)

dbimetadata=:3 : 0

NB.*dbimetadata v-- extracts dbi file metadata.
NB.
NB. monad:  bt =. dbimetadata clPathFile
NB.
NB.   dbimetadata 'C:\BCA\bcadev\TX\ULTCL.DBI'
NB.   dbimetadata 'C:\BCA\bcadev\CA\classes.dbi' 

NB. read 128 byte header
('to small for a .dbi file -> ',y) assert 128<dsize=. fsize y
emsg=. 'unable to read file -> ',y=. utf8 y
emsg assert _1 -.@-: hdr=. iread y;0 128 

NB. record count, field count                    
'nrf nff'=. _2 ic (16 + i. 8){hdr      
hdrsize=. 128 * >:nff
'file size header mismatch' assert hdrsize<:dsize

NB. field descriptors 
emsg assert _1 -.@-: fdsc=. iread y;128,nff*128     
dbiparseheader hdr,fdsc  
)

dbinamecheck=:3 : 0

NB.*dbinamecheck v-- check dbi table and field names.
NB.
NB. The tests  applied here are  stricter  than the original  APL
NB. functions. APL  characters, including the underbar character,
NB. are not allowed and lengths are enforced.
NB.
NB. monad:  dbinamecheck blclNames

alpha=.  ((65+i.26),97+i.26){a.
digits=. '0123456789'

NB. first name is table name
dbn=. ;0{y
'invalid table name' assert -.(({.dbn) e. digits) +. (8 < #dbn) +.  0 e. dbn e. alpha,digits

fnm=. }. y
'field names not unique' assert ~:fnm
msg=. 'invalid field name(s)'
msg assert -. 1 e. ({.&> fnm) e. digits
msg assert fnm *./@:e.&> <alpha,digits
msg assert 16 >: #&> fnm

1 NB. names ok
)

dbioffsets=:4 : 0

NB.*dbioffsets v-- compute byte offsets to fields and total dbi bytes.
NB.
NB. dyad:  il =.  bt dbioffsets ilNrfNff

NB. (-.)=: !(*)=. fnb fnc fty fts fbd
(0{x)=. 1{x
'nrf nff'=. y

NB. bytes for field data - no scale factors are _1 in (fnc)
fbdnew=. >.(nrf * ((fty e. 'CD'){1 8) * (|fnc) * 1 >. fnb) % 8

NB. preserve lengths of any extant c0 fields
if. 5 = {:$x do.
  if. #pos=. I. 0 = fnb do. fbdnew=. (pos { }. (fbd,0) - 0,fbd) pos} fbdnew end.
end.

NB. total bytes and offsets in file to field data
_1 |. (128 * nff + 1) + +/\ 0,fbdnew
)

dbiparseheader=:3 : 0

NB.*dbiparseheader v-- parses dbi file header.
NB.
NB. monad:  bt =. dbiparseheader clDbiHeader

fdsc=. 128}.y [ hdr=. 128{.y  NB. (-.)=:

'not a .dbi file' assert 'DBI ' -: 4{.hdr
'.dbi version <: 2.00' assert  2.00 < fir=. _1&".(4 + i. 4){hdr

dbiname=. ;dbirepsnc <toupper ((8+i. 8){hdr) -. ' '  
if. *./'STFREQ' E. dbiname do. dbiname=. 'STFREQ' end.

'nrf nff'=. _2 ic (16 + i. 8){hdr 
fdsc=. (nff,128)$fdsc 
fnm=. dbirepsnc (<"1 (i. 16) {"1 fdsc) -.&.> ' '  NB. field names

NB. field repeat cnts (I, U and F only) <0 field is list; >:0 field is fnc column table
fnc=. _2 ic ,(16 + i.4) {"1 fdsc       

NB. field types (C character, I signed integer, U unsigned integer, F floating, D date+time) 
fty=. 24 {"1 fdsc  

NB. field lengths (bits for I, U, F; bytes for C, D)
fnb=. _2 ic ,(20 + i.4){"1 fdsc 

NB. scale factors (base 10; for U, I fields only)
fsc=. a. i. 25 {"1 fdsc  

NB. decode 6 byte/48 bit field time stamps
fts=. ts7Frts6 (26 + i.6) {"1 fdsc 

NB. byte offsets in file to field starts
fbd=. _2 ic ,(32 + i.4) {"1 fdsc              

NB. result table - names match APL functions
desc=. ;:'dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd'  
desc   ,: dbiname;fir;nrf;nff;fnm;fnc;fty;fnb;fsc;fts;fbd
)

dbiparsetypes=:3 : 0

NB.*dbiparsetypes v-- checks and parses field types.
NB.
NB. monad:  bt =. dbiparsetypes blclFtypes
NB.
NB.   NB. all types in all fields in all dbi's in directory
NB.   ftypes=. {:"1 ; }.&.> dbitemplate&.> 1 dir 'C:\BCA\bcadev\CA\*.DBI'

typ=. 'CIUFD' [ msg=. 'invalid field types'

m0 =. y e.&.> <typ                NB. field types 
msg assert 1 = +/&> m0            NB. must occur exactly once
fnc=. - {.&> m0                   NB. defaults non-repeated fields _1

NB. extract any repetitions
if. #t0=. ,(_1&".)@,&> ,m0 <;._2&> y do. 
  m1 =. fnc ~: _1 
  msg assert 0<:t0=. m1#t0        NB. must be numeric >: 0
  fnc=. t0 (I. m1)} fnc           NB. all repetitions
end.

fty=. ,m0 #&.> y                  NB. remove any repetitions
y=. ,m0 <;._1&> y                  
t0=. y i.&.> '.'

NB. numeric types without repetitions and scale 
NB. factors are limited to DBIBASETYPES
t1=. fty ,&.> t0 {.&.> y
fty=. ;fty
msg assert (('C'~: fty)#t1) e. DBIBASETYPES
msg assert _1<fnb=. _1&".&> t1 -.&.> <typ

NB. extract any scale factors
t1=. t0 }.&.> y
if. 1 e. m0=. 0<fsc=. #&> t1 do.
  msg assert 'UI' e.~ m0 # fty    NB. only U I fields scale
  t0=. I. m0
  msg assert 1='.' +/@:=&> t0{y   NB. only one '.' is valid
  t1=. _1&".&> (t0{t1) -.&.> '.'
  msg assert -. _1 e. t1          NB. scale is numeric
  fsc=. t1 t0} fsc
end.

(;:'fnb fnc fty fsc') ,: fnb;fnc;fty;fsc  NB. (-.)=:
)

dbiread=:3 : 0

NB.*dbiread v-- read dbi file.
NB.
NB. monad:  bt =. dbiread clPathFile
NB. 
NB.   NB. all fields in file order
NB.   dbiread 'C:\BCA\bcadev\TX\ULTCL.DBI'
NB.
NB. dyad:  bt =. blclFieldnames dbiread clPathFile
NB.        bt =. clFieldName dbiread clPathFile
NB.  
NB.   NB. unboxed argument is one field
NB.   'INDGRP' dbiread 'C:\BCA\bcadev\CA\classes.dbi' 
NB.
NB.   NB. read many fields
NB.   (;:'PPINDEX LOSS') dbiread 'C:\BCA\bcadev\TX\ULTCL.DBI' 

0 dbiread y
:
'.dbi file does not exist' assert fexist y

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{dm)=. 1{dm=. dbimetadata y

nbf=. fsize y=. utf8 y   NB. bytes in file
nrf=. nbf dbitestnrf dm  NB. test record count
fbdx=. fbd,nbf           NB. extended offsets
fty=. tolower fty   

if. x-:0 do. 
  rdr=. lff=. i. nff     NB. read all fields   
else.
  rf=. boxopen x         NB. read at least one field
  'invalid field names' assert rf e. fnm
  lff=. fnm i. rf
  rdr=. rf i. lff{fnm    NB. requested field order
end.     

NB. read data by inverted field
emsg=. 'unable to read file -> ',y
dat=. i.0
for_iff. lff do.
  n1=. iff{fnb           NB. field length
  t=. n2=. iff{fnc       NB. field repetition count
  n2v=. (n2 >: 0) # n2   NB. repetition count as list
  t=. (t < 0){t,1        NB. list field repetition count is 1
  s1=. iff{fsc           NB. field scale factor

  if. nrf=0 do. t=. ''   NB. no records
  else.
    NB. base and byte length of field
    l1=. ((>:iff){fbdx) - b1=. iff{fbd
    emsg assert _1 -.@-: t=. iread y;b1,l1     
  end. 

  NB. convert bytes to field types
  select. iff{fty 
    case. 'f' do. 
      'floating point field must be 64 bits' assert n1 e. 64
       t=. _2 fc t
       if. n2 >: 0 do. t=. (nrf,n2)$t end.
    case. 'i' do.
      'signed integer must be 16 or 32 bits' assert n1 e. 16 32
      t=. (-n1%16) ic t
      if. n2 >: 0 do. t=. (nrf,n2)$t end.
      if. s1 ~: 0 do. t=. t % 10^s1 end.
    case. 'u' do. 
      'unsigned integer field must be 1, 4 or 8 bits' assert n1 e. 1 4 8
      if.     n1=1 do. t=. (nrf*1>.n2) {. ,bytebits3 t
      elseif. n1=4 do. t=. dfb ((*/nrf,n2v),4)$,bytebits3 t
      elseif. n1=8 do. t=. a. i. t 
      end.
      if. n2 >: 0 do. t=. (nrf,n2)$t end.
      if. s1 ~: 0 do. t=. t % 10^s1 end.    
    case. 'd' do. 
      'date fields must be 6 bytes' assert n1 e. 6
      t=. ts7Frts6 (nrf,6)$t
    case. 'c' do.
      NB. variable length leading char delimited or fixed length
      if. n1=0 do. t=. ];._1 t else. t=. (nrf,n1)$t end.
  end.
  dat=. dat,<t
end.

NB. name value table in requested order - (dbiname) has no blanks
(,rdr) {"1 (2,#rdr) $ ((<dbiname,'_') ,&.> lff{fnm) , dat
)

dbirepsnc=:3 : 0

NB.*dbirepsnc v-- replace special APL name characters.
NB.
NB. Replace  special APL  characters that can occur in  dbi field
NB. and table names, eg: delta, underbar, underbar_delta with hex
NB. encoded versions with layout hxHH. The J  dbi interface  will
NB. not create dbi files with these characters in names but  will
NB. tolerate their presence in dbi  files created elsewhere.  The
NB. hex value HH depends on the  QuadAV encoding  of the creating
NB. APL. For  APL+WIN these characters have postions (QuadIO = 0)
NB. of (DBISPECIAL=: 145 95 241) or in hex 91 5F F1
NB.
NB. monad:  bl =. dbirepsnc blclName

(<spcrep DBISPECIAL) changestr&.> y
)

dbitemplate=:3 : 0

NB.*dbitemplate v-- (x) argument for (dbicreate) from dbi file.
NB.
NB. Create  template for file  (y)  which if used  as a left  (x)
NB. argument to (dbicreate) would clone the  file  structure  and
NB. size.
NB.
NB. monad:  bt =. dbitemplate clPathFile
NB.
NB.   dbitemplate 'C:\BCA\bcadev\CA\classes.dbi'

'.dbi file does not exist' assert fexist y
dbifieldtypes dbimetadata y
)

dbitestnrf=:4 : 0

NB.*dbitestnrf v-- test record count against field lengths and return correct value.
NB.
NB. dyad:  iaNrf =. iaBytes dbitestnrf btMetadata

NB. (-.)=: !(*)=. dbiname nrf nff fnm fnc fty fnb fsc fts fbd
(0{y)=. 1{y [ nbf=. x

NB. follows APL function  
n2=. 1 (I. 0>fnc)} fnc
v1=. fnb = 0

NB. number of bits for this field (0 for C0 fields)
n2=. fnb * n2 * (fty e. 'CD'){1 8

NB. number of bytes for this field (0 for C0 fields)
n1=. >.(nrf * n2)%8

NB. actual field lengths
t1=. ((}.fbd),nbf) - fbd
if. #v1x=. I. v1 do. n1=. (v1x{t1) v1x} n1 end.

if. n1 -.@-: t1 do.
  NB. field lengths do not match expected lengths
  NB. fields with computable record counts (all but C0,U1,U4 unless 8nU1 or 2nU4)
  if. +./v1=. (fty e. 'IFD') +. (fty e. 'CU') *. n2 >: 8 do.
    NB. one or more fields have computable record counts
    NB. record count in data
    t2=. (8 * v1#t1) % v1#n2  
    NB. field record counts must match

    NB. NIMP: there's a bug here - the source
    NB. APL function wouldn't work either 
    NB. 'field length error' assert 1 = #~.t2

    NB. computed record count - take most frequent length
    NB. this is the best guess until the calc bug is resolved
    mode2 <.t2  
  end.
else. nrf  
end.
)

dbiwrite=:4 : 0

NB.*dbiwrite v-- write field data to dbi file.
NB.
NB. dyad:  (ctNames ,: blulData) dbiwrite clPathFile
NB.
NB.   dfile=. 'C:\temp\ULTCL.DBI'
NB.   fdat=.  dbiread dfile
NB. 
NB.   NB. double data - full file rewrite
NB.   fdat=. (0{fdat) ,: (1{fdat) ,&.> 1{fdat 
NB.   fdat dbiwrite dfile 
NB.
NB.   NB. grab any two fields - replace field data
NB.   fdat=. (2 {. ?~ {:$fdat) {"1 fdat
NB.   fdat dbiwrite dfile 

'.dbi file does not exist' assert fexist y

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{dm)=. 1{dm=. dbimetadata y=. utf8 y
ord=. x dbicheckdata dm
x=. ord {"1 x  NB. fields to file order

if. nrf = {.#&> 1{x do.
  NB. record count matches file replace selected fields
  (0;y;<dm) dbiwritefields x
else.
  NB. record count differs from file rewrite entire file
  NB. dbi files make no attempt to manage file allocations
  NB. the dbi format is a packed data format.
  'all fields must be specified if record count does not match file' assert ({:$x) = nff
  (1;y;<dm) dbiwritefields x
end.
)

dbiwritefields=:4 : 0

NB.*dbiwritefields v-- write dbi fields.
NB.
NB. dyad:  iaBytes =. (paReset;clPathFile;<btMetadata) dbiwritefields btData

'rwf dfile dm'=. x

NB. (-.)=: !(*)=. dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd
(0{dm)=. 1{dm

NB. update metadata
nrf=. #>0{1{y        
fbd=. (;:'fnb fnc fty fsc fbd') ,: fnb;fnc;fty;fsc;fbd
fbd=. fbd dbioffsets nrf,nff
fbd=. }.fbd [ nbf=. 0{fbd
fts=. nff # ,:t7stmp 6!:0''
fir=. DBIVERSION
dm=.      dbiname;fir;nrf;nff;fnm;fnc;fty;fnb;fsc;fts;fbd
dm=.  (;:'dbiname fir nrf nff fnm fnc fty fnb fsc fts fbd'),:dm

NB. reset file for complete rewrites
bc=. 0 [ emsg=. 'unable to write dbi file -> ',dfile
if. rwf do. emsg assert 0<:bc=. (dbiheader dm) fwrite dfile end.

NB. write field data
if. 0=nrf do. bc
else.
  
  lff=.  fnm i. (>:#dbiname) }.&.> 0{y
  'full rewrite needed for C0 fields' assert -.(0 e. lff{fnb) *. nff~:{:$y
  fty=.  tolower fty

  NB. expected field data lengths
  elen=. (}.fbd,nbf) - }:fbd,nbf
  hup=. -.rwf [ hlen=. 128 * >: nff

  for_iff. lff do.
    dat=. >iff_index{1{y
    select. iff{fty 
      case. 'f' do. dat=. f64 dat
      case. 'i' do.
        dat=. ,dat
        if. 0<iff{fsc do. dat=. dat * 10^iff{fsc end.
        dat=. i16`i32 @.(<:(iff{fnb)%16) dat
      case. 'u' do.
        dat=. ,dat
        if. 0<iff{fsc do. dat=. dat * 10^iff{fsc end.
        dat=. u1`u4`u8 @.(1 4 8 i. iff{fnb) dat 
      case. 'd' do. dat=. d6 dat
      case. 'c' do.
        if. 0=iff{fnb do.
          NB. (255{a.) does not occur in 
          NB. field data at this stage 
          dat=. ;((255){a.) ,&.> rtrim&.> <"1 dat
          NB. variable length char field lengths are not 
          NB. known until now - requires a header update
          elen=. (#dat) iff} elen
          fbd=.  }:hlen , hlen + +/\ elen
          hup=.  1
        else. 
          dat=. ,(iff{fnb) {."1 dat 
        end.
    end.
    NB. update field timestamps for partial writes
    fts=. (t7stmp 6!:0 '') iff} fts
    NB. insure actual and expected lengths match
    emsg assert (iff{elen) = #dat
    emsg assert _1 -.@-: dat iwrite dfile;iff{fbd
    bc=. bc + dat=. #dat
  end.
  NB. variable length C0 character fields alter offsets
  if. hup do. 
    dm=. (fts;fbd) (<1;(0{dm) i. ;:'fts fbd')} dm
    emsg assert _1 -.@-: (dbiheader dm) iwrite dfile;0 
  end.
  bc
end.
)

f64=:3 : 0

NB.*f64 v-- convert floating array to double 64 bit binary.
NB.
NB. monad:  cl =. f64 fu

'not f64 floating' assert isf64 y=. ,y
2 fc y
)

fresize=:4 : 0

NB.*fresize v-- resize file.
NB.
NB. This verb simulates the {Quad}nresize function in  APL+WIN.
NB.
NB. NIMP: the winapi  directly supports file resizing.  Replacing
NB. this function with direct (cd) winapi calls  is an  option if
NB. performance  becomes an  issue.  
NB.
NB. verbatim:
NB.
NB.     BOOL WINAPI SetEndOfFile(__in  HANDLE hFile);
NB.
NB.     in Kernal32.dll
NB.
NB. dyad:  iaSize fresize clPathFile

'nbf bytes'=.x

if. nbf=bytes do. nbf
else.
  msg=. 'unable to resize file'

  NB. slow but safe method
  NB. msg assert 0<((0{a.)#~ nbf - bytes) fappend y

  NB. fast and not so safe
  NB. J indexed writes (on windows) can occur beyond 
  NB. eof this has the effect of extending the file 
  NB. no data is written and when read the unset regions
  NB. are all null (0{a.) characters.
  msg assert _1 -.@-: ' ' iwrite y;<:nbf  

  NB. check actual size against expected/required size
  msg assert 0<fbytes=. fsize y
  msg assert fbytes = nbf
  fbytes
end.
)

i16=:3 : 0

NB.*i16 v-- convert integer array to sets of 2 bytes.
NB.
NB. monad:  cl =. i32 iu

'not i16 integer' assert isi16 y=. ,y
1 ic y
)

i32=:3 : 0

NB.*i32 v-- convert integer array to sets of 4 bytes.
NB.
NB. monad:  cl =. i32 iu

'not i32 integer' assert isi32 y=. ,y
2 ic y
)

iread=:1!:11 ::(_1:)

iscfield=:3 : 0

NB.*iscfield v-- basic type test for character field.
NB.
NB. monad:  pa =. iscfield uu

NB. (255{a.) is an expected APL delimiter. The APL
NB. functions do not check for this character in
NB. character data - if present it will break the
NB. the field record count.

if. ischar y do. -.(255{a.) e. y else. 0 end.
)

isd6=:3 : 0

NB.*isd6  v-- 1 if (y)  is representable as  6  byte timestamps 0
NB. otherwise.
NB.
NB. Each  row  of   (y)  is  a   7  integer  timestamp:  yy,mn,dy
NB. hr,nm,sc,mss   where  the   last   item  (mss)   is   decimal
NB. milliseconds.
NB.
NB. monad:  pa =. isd6 uu

if. -. (isint y) *. (2=#$y) *. (7={:$y) do. 0
elseif. (1 7$0) -: ~.y    do. 1   NB. special case all "zero" dates
elseif.do.
  NB. check timestamps
  if. 0 e. valdate 3 {."1 y                do. 0
  elseif. 0 e. (0&<: *. 24&>:)  3 {"1 y    do. 0
  elseif. 0 e. (0&<: *. 60&>:)  4 5 {"1 y  do. 0
  elseif. 0 e. (0&<: *. 999&>:) 6 {"1 y    do. 0
  elseif.do. 1
  end.
end.
)

isf64=:8&=@(3!:0)

isi16=:3 : 0

NB.*isi16 v-- 1 if (y) is (signed) i16 representable 0 otherwise. 
NB.
NB. monad:  pa=. isi16 uu

if. isint y=. ,y do. *./1=(_32769 32767) I. (<./ , >./) y  else. 0 end.
)

isi32=:isint

isu1=:1&=@(3!:0)

isu4=:3 : 0

NB.*isu4 v-- 1 if (y) is u4 representable 0 otherwise.
NB.
NB. monad:  pa =. isu4 uu

if. isint y=. ,y do. *./((<./ , >./) y) e. i. 16  else. 0 end.
)

isu8=:3 : 0

NB.*isu8 v-- 1 if (y) is u8 representable 0 otherwise.
NB.
NB. monad:  pa =. isu8 uu

if. isint y=. ,y do. *./((<./ , >./) y) e. i. 256 else. 0 end.
)

iwrite=:1!:12 ::(_1:)

spcrep=:[: , ('/' ,. [: ,. a. {~ ]) ,. '/hx' ,"1 [: hfd ,

t7stmp=:[: <. ] , 1000 * 1 | {:

ts6Frts7=:3 : 0

NB.*ts6Frts7 v-- 6 byte representation from 7 integer column timestamp.
NB.
NB. This verb is the inverse of (ts7Frts6) it packs 7 integer timestamps into 6 bytes.
NB.
NB. monad:  ctByte6 =. ts6Frts7 itTimestamp7
NB.         clByte6 =. ts6Frts7 ilTimestamp7
NB.
NB.   t7=. (<.6 {. ts) , <.1000 * 1 | {: ts=. 6!:0''
NB.   t7 -: ts7Frts6 ts6Frts7 t7
NB.   (10#,:t7) -: ts7Frts6 ts6Frts7 10#,:t7

NB. NIMP better check 7 column timestamps

'invalid 7 integer timestamps' assert 7 = {:$y
r=. }:$y

z=. ((*/r),48)$0
z=. ((12#2) #: 0 {"1 y) (<a:;i. 12)} z        NB. years
z=. ((4#2)  #: 1 {"1 y) (<a:;12 + i. 4)} z    NB. months
z=. ((5#2)  #: 2 {"1 y) (<a:;16 + i. 5)} z    NB. days
z=. ((5#2)  #: 3 {"1 y) (<a:;21 + i. 5)} z    NB. hours
z=. ((6#2)  #: 4 {"1 y) (<a:;26 + i. 6)} z    NB. minutes
z=. ((6#2)  #: 5 {"1 y) (<a:;32 + i. 6)} z    NB. seconds
z=. ((10#2) #: 6 {"1 y) (<a:;38 + i. 10)} z   NB. milliseconds

NB. convert to character and shape
(r,6)$(dfb ((8 %~ #z),8)$z){a. [ z=. ,z
)

ts7Frts6=:3 : 0

NB.*ts7Frts6 v-- 7 integer column timestamp from 6 byte representation.
NB.
NB. monad:  it =. ts7frts6 ctByte6

NB. bytes to 0 1 boolean array - each byte expands to 8 bits
tsb=. ,"2 bytebits3 y

NB. year(12), month(4), day(5), hour(5), minute(6), milliseconds(10)
|: dfb@|:&> (1 (+/\0 12 4 5 5 6 6)} 48#0) <;.1 |: tsb 
)

u1=:3 : 0

NB.*u1 v-- convert boolean array to u1 character.
NB.
NB. Packs 8 bits into bytes. If not divisble by 8 last
NB. 8 bits (last byte) are zero filled in right most bits.
NB.
NB. monad:  cl =. u1 pu

'not u1 boolean' assert isu1 y=. ,y
a. {~ dfb _8 ]\ (8 * >.(#y)%8) {. y
)

u4=:3 : 0

NB.*u4 v-- convert integer array to 4 bit unsigned integers.
NB.
NB. Packs two integers in (i.16) into one byte.
NB.
NB. monad:  cl =. u4 iuInt

'not u4 integer' assert isu4 y=. ,y 
n=. >. 0.5 * # y
y=. (n,2) $ (2 * n) {. y  NB. pair items (zero if odd)
(16 16 #. y){a.           NB. pairs to 0-255 char indexes 
)

u8=:3 : 0

NB.*u8 v-- convert integer array to 8 bit unsigned integers.
NB.
NB. monad:  cl =. u8 iuInt

'not u8 integer' assert isu8 y=. ,y
y{a.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'43 2$<;._1 ''|DBIBASETYPES|base dbi field types: no repetitions or s'
zz=:zz,'cale factors|DBISPECIAL|special APL name characters in 0 QuadAV of '
zz=:zz,'source APL|DBIVERSION|version level of dbi files - last APL version'
zz=:zz,' is 3.00|IFACEWORDSdbi|interface words (IFACEWORDSdbi) group|ROOTWO'
zz=:zz,'RDSdbi|root words (ROOTWORDSdbi) group      |bytebits3|like ((8$2) '
zz=:zz,'#: a. i. ]) but always returns boolean|d6|convert 7 column integer '
zz=:zz,'array timestamps to 6 bytes|dbicheckdata|tests field name/data tabl'
zz=:zz,'e|dbicreate|create dbi file|dbifieldtypes|field types from metadata'
zz=:zz,'|dbiheader|format dbi metadata header|dbimetadata|extracts dbi file'
zz=:zz,' metadata|dbinamecheck|check dbi table and field names|dbioffsets|c'
zz=:zz,'ompute byte offsets to fields and total dbi bytes|dbiparseheader|pa'
zz=:zz,'rses dbi file header|dbiparsetypes|checks and parses field types|db'
zz=:zz,'iread|read dbi file|dbirepsnc|replace special APL name characters|d'
zz=:zz,'bitemplate|(x) argument for (dbicreate) from dbi file|dbitestnrf|te'
zz=:zz,'st record count against field lengths and return correct value|dbiw'
zz=:zz,'rite|write field data to dbi file|dbiwritefields|write dbi fields|f'
zz=:zz,'64|convert floating array to double 64 bit binary|fresize|resize fi'
zz=:zz,'le|i16|convert integer array to sets of 2 bytes|i32|convert integer'
zz=:zz,' array to sets of 4 bytes|iread|indexed file read - returns cl byte'
zz=:zz,'s if successful _1 otherwise|iscfield|basic type test for character'
zz=:zz,' field|isd6|1 if (y) is representable as a 6 byte timestamps 0 othe'
zz=:zz,'rwise|isf64|1 if (y) is f64 representable 0 otherwise|isi16|1 if (y'
zz=:zz,') is (signed) i16 representable 0 otherwise|isi32|1 if (y) is (sign'
zz=:zz,'ed) i32 representable 0 otherwise|isu1|1 if (u) is u1 representable'
zz=:zz,' 0 otherwise|isu4|1 if (y) is u4 representable 0 otherwise|isu8|1 i'
zz=:zz,'f (y) is u8 representable 0 otherwise|iwrite|indexed file write|spc'
zz=:zz,'rep|form special character replacements|t7stmp|format 7 integer ite'
zz=:zz,'m timestamp yr mn dy hr mn ss mss|ts6Frts7|6 byte representation fr'
zz=:zz,'om 7 integer column timestamp|ts7Frts6|7 integer column timestamp f'
zz=:zz,'rom 6 byte representation|u1|convert boolean array to u1 character|'
zz=:zz,'u4|convert integer array to 4 bit unsigned integers|u8|convert inte'
zz=:zz,'ger array to 8 bit unsigned integers''                              '
zz=:2114{.zz
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'4 2$<;.(_1) 124 98 117 105 108 100 100 98 105 124 78 66 46 42 98 11'
zz=:zz,'7 105 108 100 100 98 105 32 115 45 45 32 109 97 107 101 32 99 111 1'
zz=:zz,'09 112 114 101 115 115 101 100 32 118 101 114 115 105 111 110 32 11'
zz=:zz,'1 102 32 40 100 98 105 41 46 13 10 13 10 99 111 99 108 97 115 115 3'
zz=:zz,'2 116 109 112 108 111 99 95 65 65 65 100 98 105 57 57 57 95 61 58 3'
zz=:zz,'2 39 65 65 65 100 98 105 57 57 57 39 32 91 32 99 111 101 114 97 115'
zz=:zz,' 101 32 60 39 65 65 65 100 98 105 57 57 57 39 13 10 99 111 105 110 '
zz=:zz,'115 101 114 116 32 39 105 106 111 100 39 13 10 13 10 62 48 123 111 '
zz=:zz,'111 111 61 58 32 100 105 100 32 48 13 10 62 48 123 111 100 32 59 58'
zz=:zz,' 39 98 97 114 102 32 117 116 105 108 115 39 32 91 32 51 32 111 100 '
zz=:zz,'32 39 39 13 10 13 10 62 48 123 116 109 112 108 111 99 32 103 101 11'
zz=:zz,'6 32 59 58 39 119 114 105 116 101 32 116 108 102 32 115 104 111 119'
zz=:zz,' 112 97 115 115 39 13 10 62 48 123 116 109 112 108 111 99 32 103 10'
zz=:zz,'1 116 114 120 32 39 100 101 119 104 105 116 101 106 115 99 114 105 '
zz=:zz,'112 116 39 13 10 13 10 100 111 61 58 32 123 58 123 46 68 80 65 84 7'
zz=:zz,'2 95 95 83 84 95 95 74 79 68 111 98 106 13 10 13 10 78 66 46 32 40 '
zz=:zz,'109 108 115 41 32 116 104 105 115 32 115 99 114 105 112 116 32 116 '
zz=:zz,'111 32 105 110 115 117 114 101 32 40 115 116 97 114 116 46 105 106 '
zz=:zz,'115 41 32 105 115 32 115 101 116 13 10 62 48 123 109 108 115 32 39 '
zz=:zz,'100 98 105 39 13 10 102 105 108 101 61 58 32 83 67 82 95 95 100 111'
zz=:zz,' 44 39 100 98 105 46 105 106 115 39 13 10 13 10 78 66 46 32 111 110'
zz=:zz,' 108 121 32 116 104 101 32 112 111 115 116 112 114 111 99 101 115 1'
zz=:zz,'15 111 114 32 111 102 32 40 100 98 105 41 32 99 97 110 110 111 116 '
zz=:zz,'32 98 101 32 99 111 109 112 114 101 115 115 101 100 13 10 62 48 123'
zz=:zz,' 105 106 115 61 58 32 50 32 95 50 32 109 97 107 101 32 39 100 98 10'
zz=:zz,'5 39 13 10 105 106 115 61 58 32 100 101 119 104 105 116 101 106 115'
zz=:zz,' 99 114 105 112 116 32 59 123 58 105 106 115 13 10 105 106 115 61 5'
zz=:zz,'8 32 40 116 108 102 32 105 106 115 41 32 44 32 52 32 100 105 115 11'
zz=:zz,'2 32 39 80 79 83 84 95 100 98 105 39 13 10 13 10 49 32 91 32 40 116'
zz=:zz,' 111 74 32 105 106 115 41 32 119 114 105 116 101 32 115 104 111 119'
zz=:zz,' 112 97 115 115 32 102 105 108 101 13 10 13 10 62 48 123 111 100 32'
zz=:zz,' 125 46 111 111 111 32 91 32 51 32 111 100 32 39 39 13 10 13 10 99 '
zz=:zz,'111 99 117 114 114 101 110 116 32 39 98 97 115 101 39 13 10 99 111 '
zz=:zz,'101 114 97 115 101 32 60 116 109 112 108 111 99 95 65 65 65 100 98 '
zz=:zz,'105 57 57 57 95 13 10 13 10 124 100 98 105 98 97 115 105 99 116 101'
zz=:zz,' 115 116 115 48 48 124 78 66 46 42 100 98 105 98 97 115 105 99 116 '
zz=:zz,'101 115 116 115 48 48 32 116 45 45 32 98 97 115 105 99 32 100 98 10'
zz=:zz,'5 32 99 114 101 97 116 101 47 119 114 105 116 101 47 114 101 97 100'
zz=:zz,' 32 116 101 115 116 115 46 13 10 78 66 46 32 32 13 10 78 66 46 32 9'
zz=:zz,'9 114 101 97 116 101 100 58 32 50 48 49 50 97 112 114 48 54 13 10 7'
zz=:zz,'8 66 46 32 99 104 97 110 103 101 115 58 32 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 13 10 78 66 46 32 49 50 97 112 114 50 51 32 102 105 120 101 100 32'
zz=:zz,' 112 97 114 116 105 97 108 32 119 114 105 116 101 115 32 119 114 10'
zz=:zz,'1 97 107 105 110 103 32 99 48 32 102 105 101 108 100 115 32 40 100 '
zz=:zz,'98 105 111 102 102 115 101 116 115 41 13 10 78 66 46 32 49 50 97 11'
zz=:zz,'2 114 50 52 32 97 100 100 101 100 32 115 112 101 99 105 97 108 32 9'
zz=:zz,'9 97 115 101 32 116 111 32 40 105 115 100 54 41 32 97 108 108 111 1'
zz=:zz,'19 105 110 103 32 97 108 108 32 34 122 101 114 111 34 32 100 97 116'
zz=:zz,' 101 115 32 13 10 13 10 78 66 46 32 99 114 101 97 116 101 32 97 110'
zz=:zz,' 100 32 116 101 115 116 32 100 98 105 32 119 105 116 104 32 97 108 '
zz=:zz,'108 32 112 111 115 115 105 98 108 101 32 110 111 110 115 99 97 108 '
zz=:zz,'101 100 32 102 105 101 108 100 115 13 10 99 111 99 117 114 114 101 '
zz=:zz,'110 116 39 98 97 115 101 39 13 10 99 108 101 97 114 32 39 39 13 10 '
zz=:zz,'108 111 97 100 32 39 100 98 105 32 100 98 105 116 101 115 116 101 1'
zz=:zz,'14 39 13 10 13 10 104 100 112 61 58 32 59 32 73 70 87 73 78 32 123 '
zz=:zz,'32 39 47 104 111 109 101 47 106 111 104 110 47 116 101 109 112 47 3'
zz=:zz,'9 32 59 32 39 99 58 47 116 101 109 112 47 39 13 10 13 10 49 32 91 3'
zz=:zz,'2 102 101 114 97 115 101 32 100 98 105 61 58 104 100 112 44 39 97 1'
zz=:zz,'08 108 110 115 102 46 100 98 105 39 13 10 49 32 91 32 102 101 114 9'
zz=:zz,'7 115 101 32 100 98 105 101 109 112 116 121 61 58 32 104 100 112 44'
zz=:zz,' 39 97 108 108 110 97 100 97 46 100 98 105 39 13 10 13 10 78 66 46 '
zz=:zz,'32 78 79 84 69 58 32 102 105 101 108 100 32 110 97 109 101 115 32 1'
zz=:zz,'16 104 97 116 32 99 108 97 115 104 32 119 105 116 104 32 100 98 105'
zz=:zz,' 32 118 101 114 98 32 110 97 109 101 115 13 10 78 66 46 32 109 97 1'
zz=:zz,'21 32 99 97 117 115 101 32 112 114 111 98 108 101 109 115 32 117 11'
zz=:zz,'0 108 101 115 115 32 121 111 117 32 97 116 116 97 99 104 32 108 111'
zz=:zz,' 99 97 108 101 32 115 117 102 102 105 120 101 115 13 10 13 10 78 66'
zz=:zz,' 46 32 99 114 101 97 116 101 32 101 109 112 116 121 13 10 102 116 6'
zz=:zz,'1 58 32 60 59 46 95 49 39 32 48 32 85 49 32 50 49 85 49 32 85 52 32'
zz=:zz,' 49 55 85 52 32 85 56 32 51 55 85 56 32 73 49 54 32 49 54 73 49 54 '
zz=:zz,'32 73 51 50 32 50 48 73 51 50 32 70 54 52 32 57 55 70 54 52 32 68 5'
zz=:zz,'4 32 67 48 32 67 49 53 39 13 10 102 116 61 58 32 40 59 58 39 65 76 '
zz=:zz,'76 78 83 70 32 117 49 102 32 117 50 49 117 49 32 117 52 102 32 117 '
zz=:zz,'49 55 117 52 32 117 56 102 32 117 51 55 117 56 32 105 49 54 102 32 '
zz=:zz,'105 49 54 105 49 54 32 105 51 50 102 32 105 50 48 105 51 50 32 102 '
zz=:zz,'54 52 102 32 102 57 55 102 54 52 32 100 54 102 32 99 48 32 99 49 53'
zz=:zz,' 39 41 32 44 58 32 102 116 13 10 48 60 102 116 32 100 98 105 99 114'
zz=:zz,' 101 97 116 101 32 100 98 105 13 10 13 10 102 116 101 109 112 116 1'
zz=:zz,'21 61 58 32 40 39 65 76 76 78 65 68 65 39 32 59 32 39 48 39 41 32 4'
zz=:zz,'4 46 32 125 46 34 49 32 102 116 13 10 48 60 102 116 101 109 112 116'
zz=:zz,' 121 32 100 98 105 99 114 101 97 116 101 32 100 98 105 101 109 112 '
zz=:zz,'116 121 13 10 13 10 78 66 46 32 114 101 97 100 32 97 110 100 32 119'
zz=:zz,' 114 105 116 101 32 101 109 112 116 121 13 10 48 61 40 102 100 61 5'
zz=:zz,'8 32 100 98 105 114 101 97 100 32 100 98 105 41 32 100 98 105 119 1'
zz=:zz,'14 105 116 101 32 100 98 105 13 10 13 10 78 66 46 32 110 101 119 32'
zz=:zz,' 116 101 109 112 108 97 116 101 32 115 104 111 117 108 100 32 109 9'
zz=:zz,'7 116 99 104 32 99 114 101 97 116 105 111 110 32 115 112 101 99 115'
zz=:zz,' 13 10 102 116 32 45 58 32 100 98 105 116 101 109 112 108 97 116 10'
zz=:zz,'1 32 100 98 105 13 10 13 10 78 66 46 32 100 97 116 97 32 102 105 10'
zz=:zz,'1 108 100 115 32 115 104 111 117 108 100 32 104 97 118 101 32 122 1'
zz=:zz,'01 114 111 32 114 111 119 115 13 10 48 32 61 32 35 38 62 32 49 123 '
zz=:zz,'102 100 13 10 13 10 49 32 91 32 102 101 114 97 115 101 32 100 98 10'
zz=:zz,'5 61 58 104 100 112 44 39 97 108 108 110 115 102 46 100 98 105 39 1'
zz=:zz,'3 10 13 10 78 66 46 32 114 101 99 111 114 100 32 99 111 117 110 116'
zz=:zz,' 13 10 110 114 102 61 58 32 32 32 32 49 55 49 51 13 10 13 10 78 66 '
zz=:zz,'46 32 114 101 99 114 101 97 116 101 32 119 105 116 104 32 110 111 1'
zz=:zz,'10 101 109 112 116 121 32 34 122 101 114 111 34 32 102 105 101 108 '
zz=:zz,'100 115 13 10 102 116 50 61 58 32 40 39 65 76 76 78 83 70 39 59 34 '
zz=:zz,'58 110 114 102 41 32 44 46 32 125 46 34 49 32 102 116 13 10 13 10 4'
zz=:zz,'8 60 102 116 50 32 100 98 105 99 114 101 97 116 101 32 100 98 105 1'
zz=:zz,'3 10 13 10 78 66 46 32 114 101 97 100 32 97 110 100 32 119 114 105 '
zz=:zz,'116 101 32 101 109 112 116 121 13 10 102 100 61 58 32 100 98 105 11'
zz=:zz,'4 101 97 100 32 100 98 105 13 10 13 10 78 66 46 32 66 85 71 32 70 7'
zz=:zz,'3 88 69 68 32 32 34 122 101 114 111 34 32 102 105 101 108 100 115 3'
zz=:zz,'2 116 114 105 103 103 101 114 32 116 121 112 101 32 101 114 114 111'
zz=:zz,' 114 115 32 13 10 78 66 46 32 115 112 101 99 105 97 108 32 99 97 11'
zz=:zz,'5 101 32 99 104 97 110 103 101 32 116 111 32 40 105 115 100 54 41 3'
zz=:zz,'2 97 108 108 111 119 115 32 97 108 108 32 116 105 109 101 32 48 32 '
zz=:zz,'100 97 116 101 115 13 10 48 60 102 100 32 100 98 105 119 114 105 11'
zz=:zz,'6 101 32 100 98 105 13 10 13 10 78 66 46 32 110 101 119 32 116 101 '
zz=:zz,'109 112 108 97 116 101 32 115 104 111 117 108 100 32 109 97 116 99 '
zz=:zz,'104 32 99 114 101 97 116 105 111 110 32 115 112 101 99 115 13 10 10'
zz=:zz,'2 116 50 32 45 58 32 100 98 105 116 101 109 112 108 97 116 101 32 1'
zz=:zz,'00 98 105 13 10 13 10 78 66 46 32 100 97 116 97 32 102 105 101 108 '
zz=:zz,'100 115 32 115 104 111 117 108 100 32 104 97 118 101 32 110 114 102'
zz=:zz,' 32 114 111 119 115 13 10 110 114 102 32 61 32 35 38 62 32 49 123 1'
zz=:zz,'02 100 13 10 13 10 13 10 78 66 46 32 102 117 108 108 32 119 114 105'
zz=:zz,' 116 101 32 111 102 32 97 108 108 32 102 105 101 108 100 115 32 13 '
zz=:zz,'10 121 101 97 114 61 58 32 32 32 49 57 56 55 13 10 117 49 102 61 58'
zz=:zz,' 32 32 32 32 63 110 114 102 35 50 13 10 117 50 49 117 49 61 58 32 3'
zz=:zz,'2 40 110 114 102 44 50 49 41 36 117 49 102 13 10 117 52 102 61 58 3'
zz=:zz,'2 32 32 32 40 110 114 102 63 110 114 102 41 123 110 114 102 36 105 '
zz=:zz,'46 32 49 54 13 10 117 49 55 117 52 61 58 32 32 40 110 114 102 44 49'
zz=:zz,' 55 41 36 117 52 102 13 10 117 56 102 61 58 32 32 32 32 40 110 114 '
zz=:zz,'102 63 110 114 102 41 123 110 114 102 36 105 46 32 50 53 54 13 10 1'
zz=:zz,'17 51 55 117 56 61 58 32 32 40 110 114 102 44 51 55 41 36 117 56 10'
zz=:zz,'2 13 10 105 49 54 102 61 58 32 32 32 40 63 110 114 102 35 54 48 48 '
zz=:zz,'48 49 41 32 123 32 32 105 58 32 51 48 48 48 48 13 10 105 49 54 105 '
zz=:zz,'49 54 61 58 32 40 110 114 102 44 49 54 41 36 105 49 54 102 13 10 10'
zz=:zz,'5 51 50 102 61 58 32 32 32 40 110 114 102 63 110 114 102 41 32 43 3'
zz=:zz,'2 60 46 32 50 94 51 48 13 10 105 50 48 105 51 50 61 58 32 40 110 11'
zz=:zz,'4 102 44 50 48 41 36 105 51 50 102 13 10 102 54 52 102 61 58 32 32 '
zz=:zz,'32 40 49 48 32 42 32 105 46 32 110 114 102 41 32 37 32 49 55 13 10 '
zz=:zz,'102 57 55 102 54 52 61 58 32 40 110 114 102 44 57 55 41 36 32 49 12'
zz=:zz,'0 49 32 42 32 105 46 32 110 114 102 42 57 55 13 10 13 10 78 66 46 3'
zz=:zz,'2 114 97 110 100 111 109 32 118 97 108 105 100 32 116 105 109 101 1'
zz=:zz,'15 116 97 109 112 115 32 102 114 111 109 32 40 121 101 97 114 41 32'
zz=:zz,' 116 111 32 109 105 108 108 105 115 101 99 111 110 100 32 112 114 1'
zz=:zz,'01 99 105 115 105 111 110 32 13 10 100 54 102 61 58 32 32 32 60 46 '
zz=:zz,'40 40 63 110 114 102 35 51 54 53 41 123 121 101 97 114 100 97 116 1'
zz=:zz,'01 115 32 121 101 97 114 41 32 44 46 32 50 52 32 54 48 32 54 48 32 '
zz=:zz,'49 48 48 48 32 35 58 32 63 32 110 114 102 32 35 32 42 47 50 52 32 5'
zz=:zz,'4 48 32 54 48 32 49 48 48 48 13 10 13 10 99 48 61 58 32 32 32 32 32'
zz=:zz,' 62 110 114 102 32 36 32 60 59 46 95 49 32 76 70 44 39 116 104 105 '
zz=:zz,'115 32 105 115 32 118 97 114 105 97 98 108 101 32 108 101 110 103 1'
zz=:zz,'16 104 39 44 76 70 44 39 116 101 120 116 32 116 104 97 116 32 109 9'
zz=:zz,'7 121 32 103 111 32 111 110 32 39 44 40 50 48 48 36 39 32 97 110 10'
zz=:zz,'0 32 111 110 39 41 44 76 70 44 39 85 78 84 73 76 32 73 32 77 85 83 '
zz=:zz,'84 39 44 76 70 44 39 115 116 111 112 32 105 116 39 13 10 99 49 53 6'
zz=:zz,'1 58 32 32 32 32 49 53 32 123 46 34 49 32 99 48 13 10 13 10 78 66 4'
zz=:zz,'6 32 102 105 101 108 100 32 100 97 116 97 32 110 111 117 110 115 32'
zz=:zz,' 109 117 115 116 32 101 120 105 115 116 13 10 48 32 61 32 110 99 32'
zz=:zz,' 125 46 32 48 123 102 116 13 10 13 10 78 66 46 32 102 117 108 108 3'
zz=:zz,'2 119 114 105 116 101 32 100 97 116 97 13 10 102 110 61 58 32 40 60'
zz=:zz,' 40 59 48 123 48 123 102 116 41 44 39 95 39 41 32 44 38 46 62 32 12'
zz=:zz,'5 46 32 48 123 102 116 13 10 102 100 61 58 32 102 110 32 44 58 32 3'
zz=:zz,'4 46 38 46 62 32 40 125 46 32 48 123 102 116 41 32 44 38 46 62 32 6'
zz=:zz,'0 39 95 98 97 115 101 95 39 13 10 13 10 78 66 46 32 119 114 105 116'
zz=:zz,' 101 32 97 110 100 32 114 101 97 100 32 98 97 99 107 32 109 117 115'
zz=:zz,' 116 32 109 97 116 99 104 13 10 48 60 102 100 32 100 98 105 119 114'
zz=:zz,' 105 116 101 32 100 98 105 13 10 102 100 32 45 58 32 100 98 105 114'
zz=:zz,' 101 97 100 32 100 98 105 13 10 13 10 78 66 46 32 99 104 101 99 107'
zz=:zz,' 32 105 110 100 105 118 105 100 117 97 108 32 102 105 101 108 100 3'
zz=:zz,'2 114 101 97 100 115 13 10 117 49 102 32 32 32 32 45 58 32 59 49 12'
zz=:zz,'3 39 117 49 102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10'
zz=:zz,' 117 50 49 117 49 32 32 45 58 32 59 49 123 39 117 50 49 117 49 39 3'
zz=:zz,'2 100 98 105 114 101 97 100 32 100 98 105 13 10 117 52 102 32 32 32'
zz=:zz,' 32 45 58 32 59 49 123 39 117 52 102 39 32 100 98 105 114 101 97 10'
zz=:zz,'0 32 100 98 105 13 10 117 49 55 117 52 32 32 45 58 32 59 49 123 39 '
zz=:zz,'117 49 55 117 52 39 32 100 98 105 114 101 97 100 32 100 98 105 13 1'
zz=:zz,'0 117 56 102 32 32 32 32 45 58 32 59 49 123 39 117 56 102 39 32 100'
zz=:zz,' 98 105 114 101 97 100 32 100 98 105 32 13 10 117 51 55 117 56 32 3'
zz=:zz,'2 45 58 32 59 49 123 39 117 51 55 117 56 39 32 100 98 105 114 101 9'
zz=:zz,'7 100 32 100 98 105 13 10 105 49 54 102 32 32 32 45 58 32 59 49 123'
zz=:zz,' 39 105 49 54 102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 '
zz=:zz,'10 105 49 54 105 49 54 32 45 58 32 59 49 123 39 105 49 54 105 49 54'
zz=:zz,' 39 32 100 98 105 114 101 97 100 32 100 98 105 32 13 10 105 51 50 1'
zz=:zz,'02 32 32 32 45 58 32 59 49 123 39 105 51 50 102 39 32 100 98 105 11'
zz=:zz,'4 101 97 100 32 100 98 105 13 10 105 50 48 105 51 50 32 45 58 32 59'
zz=:zz,' 49 123 39 105 50 48 105 51 50 39 32 100 98 105 114 101 97 100 32 1'
zz=:zz,'00 98 105 13 10 102 54 52 102 32 32 32 45 58 32 59 49 123 39 102 54'
zz=:zz,' 52 102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 102 57 '
zz=:zz,'55 102 54 52 32 45 58 32 59 49 123 39 102 57 55 102 54 52 39 32 100'
zz=:zz,' 98 105 114 101 97 100 32 100 98 105 13 10 100 54 102 32 32 32 32 4'
zz=:zz,'5 58 32 59 49 123 39 100 54 102 39 32 100 98 105 114 101 97 100 32 '
zz=:zz,'100 98 105 13 10 99 48 32 32 32 32 32 45 58 32 59 49 123 39 99 48 3'
zz=:zz,'9 32 100 98 105 114 101 97 100 32 100 98 105 13 10 99 49 53 32 32 3'
zz=:zz,'2 32 45 58 32 59 49 123 39 99 49 53 39 32 100 98 105 114 101 97 100'
zz=:zz,' 32 100 98 105 13 10 13 10 78 66 46 32 114 101 97 100 47 109 111 10'
zz=:zz,'0 105 102 121 47 114 101 114 101 97 100 32 115 101 108 101 99 116 1'
zz=:zz,'01 100 32 102 105 101 108 100 115 13 10 102 100 61 58 32 39 117 49 '
zz=:zz,'102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 117 49 102 '
zz=:zz,'110 101 119 61 58 32 63 110 114 102 35 50 13 10 102 100 50 61 58 32'
zz=:zz,' 40 48 123 102 100 41 32 44 58 32 60 117 49 102 110 101 119 13 10 1'
zz=:zz,'3 10 78 66 46 32 70 73 88 69 68 32 66 85 71 32 40 49 50 97 112 114 '
zz=:zz,'50 48 41 32 112 97 114 116 105 97 108 32 119 114 105 116 101 115 32'
zz=:zz,' 119 114 101 97 107 32 99 104 97 114 97 99 116 101 114 32 102 105 1'
zz=:zz,'01 108 100 115 32 13 10 78 66 46 32 48 13 10 13 10 48 60 102 100 50'
zz=:zz,' 32 100 98 105 119 114 105 116 101 32 100 98 105 13 10 102 100 50 3'
zz=:zz,'2 45 58 32 39 117 49 102 39 32 100 98 105 114 101 97 100 32 100 98 '
zz=:zz,'105 13 10 13 10 78 66 46 32 114 101 99 104 101 99 107 32 102 105 10'
zz=:zz,'1 108 100 115 13 10 117 49 102 110 101 119 32 45 58 32 59 49 123 39'
zz=:zz,' 117 49 102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 117'
zz=:zz,' 50 49 117 49 32 32 45 58 32 59 49 123 39 117 50 49 117 49 39 32 10'
zz=:zz,'0 98 105 114 101 97 100 32 100 98 105 13 10 117 52 102 32 32 32 32 '
zz=:zz,'45 58 32 59 49 123 39 117 52 102 39 32 100 98 105 114 101 97 100 32'
zz=:zz,' 100 98 105 13 10 117 49 55 117 52 32 32 45 58 32 59 49 123 39 117 '
zz=:zz,'49 55 117 52 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 11'
zz=:zz,'7 56 102 32 32 32 32 45 58 32 59 49 123 39 117 56 102 39 32 100 98 '
zz=:zz,'105 114 101 97 100 32 100 98 105 32 13 10 117 51 55 117 56 32 32 45'
zz=:zz,' 58 32 59 49 123 39 117 51 55 117 56 39 32 100 98 105 114 101 97 10'
zz=:zz,'0 32 100 98 105 13 10 105 49 54 102 32 32 32 45 58 32 59 49 123 39 '
zz=:zz,'105 49 54 102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 1'
zz=:zz,'05 49 54 105 49 54 32 45 58 32 59 49 123 39 105 49 54 105 49 54 39 '
zz=:zz,'32 100 98 105 114 101 97 100 32 100 98 105 32 13 10 105 51 50 102 3'
zz=:zz,'2 32 32 45 58 32 59 49 123 39 105 51 50 102 39 32 100 98 105 114 10'
zz=:zz,'1 97 100 32 100 98 105 13 10 105 50 48 105 51 50 32 45 58 32 59 49 '
zz=:zz,'123 39 105 50 48 105 51 50 39 32 100 98 105 114 101 97 100 32 100 9'
zz=:zz,'8 105 13 10 102 54 52 102 32 32 32 45 58 32 59 49 123 39 102 54 52 '
zz=:zz,'102 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 102 57 55 1'
zz=:zz,'02 54 52 32 45 58 32 59 49 123 39 102 57 55 102 54 52 39 32 100 98 '
zz=:zz,'105 114 101 97 100 32 100 98 105 13 10 100 54 102 32 32 32 32 45 58'
zz=:zz,' 32 59 49 123 39 100 54 102 39 32 100 98 105 114 101 97 100 32 100 '
zz=:zz,'98 105 13 10 99 48 32 32 32 32 32 45 58 32 59 49 123 39 99 48 39 32'
zz=:zz,' 100 98 105 114 101 97 100 32 100 98 105 13 10 99 49 53 32 32 32 32'
zz=:zz,' 45 58 32 59 49 123 39 99 49 53 39 32 100 98 105 114 101 97 100 32 '
zz=:zz,'100 98 105 13 10 13 10 102 100 61 58 32 39 117 50 49 117 49 39 32 1'
zz=:zz,'00 98 105 114 101 97 100 32 100 98 105 13 10 117 50 49 117 49 32 45'
zz=:zz,' 58 32 59 49 123 102 100 13 10 117 50 49 117 49 110 101 119 61 58 3'
zz=:zz,'2 40 110 114 102 44 50 49 41 36 63 110 114 102 35 50 13 10 102 100 '
zz=:zz,'50 61 58 32 40 48 123 102 100 41 32 44 58 32 60 117 50 49 117 49 11'
zz=:zz,'0 101 119 13 10 48 60 102 100 50 32 100 98 105 119 114 105 116 101 '
zz=:zz,'32 100 98 105 13 10 102 100 50 32 45 58 32 39 117 50 49 117 49 39 3'
zz=:zz,'2 100 98 105 114 101 97 100 32 100 98 105 13 10 13 10 99 48 32 45 5'
zz=:zz,'8 32 59 49 123 39 99 48 39 32 100 98 105 114 101 97 100 32 100 98 1'
zz=:zz,'05 13 10 13 10 102 100 61 58 32 39 105 51 50 102 39 32 100 98 105 1'
zz=:zz,'14 101 97 100 32 100 98 105 13 10 105 51 50 102 110 101 119 61 58 3'
zz=:zz,'2 40 110 114 102 63 110 114 102 41 32 43 32 60 46 32 50 94 51 48 13'
zz=:zz,' 10 102 100 50 61 58 32 40 48 123 102 100 41 32 44 58 32 60 105 51 '
zz=:zz,'50 102 110 101 119 13 10 48 60 102 100 50 32 100 98 105 119 114 105'
zz=:zz,' 116 101 32 100 98 105 13 10 102 100 50 32 45 58 32 39 105 51 50 10'
zz=:zz,'2 39 32 100 98 105 114 101 97 100 32 100 98 105 13 10 13 10 99 48 3'
zz=:zz,'2 45 58 32 59 49 123 39 99 48 39 32 100 98 105 114 101 97 100 32 10'
zz=:zz,'0 98 105 124 100 98 105 99 104 101 99 107 100 97 116 97 48 48 124 7'
zz=:zz,'8 66 46 42 100 98 105 99 104 101 99 107 100 97 116 97 48 48 32 116 '
zz=:zz,'45 45 32 98 97 115 105 99 32 116 101 115 116 115 32 111 102 32 40 1'
zz=:zz,'00 98 105 99 104 101 99 107 100 97 116 97 41 46 13 10 78 66 46 13 1'
zz=:zz,'0 78 66 46 32 97 117 116 104 111 114 58 32 32 74 111 104 110 32 68 '
zz=:zz,'46 32 66 97 107 101 114 13 10 78 66 46 32 99 114 101 97 116 101 100'
zz=:zz,' 58 32 50 48 49 50 109 97 114 50 50 13 10 78 66 46 32 99 104 97 110'
zz=:zz,' 103 101 115 58 32 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 13 10 13 10 78 66'
zz=:zz,' 46 32 115 99 97 110 32 115 111 109 101 32 100 105 114 101 99 116 1'
zz=:zz,'11 114 105 101 115 32 111 102 32 101 120 116 97 110 116 32 65 80 76'
zz=:zz,' 32 99 114 101 97 116 101 100 32 100 98 105 32 102 105 108 101 115 '
zz=:zz,'13 10 78 66 46 32 118 101 114 98 115 32 115 104 111 117 108 100 32 '
zz=:zz,'115 117 99 99 101 101 100 32 102 111 114 32 97 108 108 32 102 105 1'
zz=:zz,'08 101 115 46 13 10 13 10 48 60 35 100 102 105 108 101 115 61 58 32'
zz=:zz,' 49 32 100 105 114 32 39 67 58 92 66 67 65 92 98 99 97 100 101 118 '
zz=:zz,'92 67 65 92 42 46 100 98 105 39 13 10 40 40 100 98 105 114 101 97 1'
zz=:zz,'00 64 115 104 111 119 112 97 115 115 41 32 40 40 49 58 64 115 104 1'
zz=:zz,'11 119 112 97 115 115 41 64 100 98 105 99 104 101 99 107 100 97 116'
zz=:zz,' 97 41 32 100 98 105 109 101 116 97 100 97 116 97 41 32 38 62 32 10'
zz=:zz,'0 102 105 108 101 115 13 10 13 10 48 60 35 100 102 105 108 101 115 '
zz=:zz,'61 58 32 49 32 100 105 114 32 39 67 58 92 66 67 65 92 98 99 97 100 '
zz=:zz,'101 118 92 84 88 92 42 46 100 98 105 39 13 10 40 40 100 98 105 114 '
zz=:zz,'101 97 100 64 115 104 111 119 112 97 115 115 41 32 40 40 49 58 64 1'
zz=:zz,'15 104 111 119 112 97 115 115 41 64 100 98 105 99 104 101 99 107 10'
zz=:zz,'0 97 116 97 41 32 100 98 105 109 101 116 97 100 97 116 97 41 32 38 '
zz=:zz,'62 32 100 102 105 108 101 115 13 10 13 10 48 60 35 100 102 105 108 '
zz=:zz,'101 115 61 58 32 49 32 100 105 114 32 39 67 58 92 66 67 65 92 98 99'
zz=:zz,' 97 100 101 118 92 87 65 92 42 46 100 98 105 39 13 10 40 40 100 98 '
zz=:zz,'105 114 101 97 100 64 115 104 111 119 112 97 115 115 41 32 40 40 49'
zz=:zz,' 58 64 115 104 111 119 112 97 115 115 41 64 100 98 105 99 104 101 9'
zz=:zz,'9 107 100 97 116 97 41 32 100 98 105 109 101 116 97 100 97 116 97 4'
zz=:zz,'1 32 38 62 32 100 102 105 108 101 115 13 10 13 10 78 66 46 32 110 1'
zz=:zz,'11 119 32 114 97 110 100 111 109 108 121 32 112 101 114 109 117 116'
zz=:zz,' 101 32 102 105 101 108 100 32 99 111 108 117 109 110 32 111 114 10'
zz=:zz,'0 101 114 32 111 102 32 100 97 116 97 32 45 32 118 101 114 98 115 3'
zz=:zz,'2 119 105 108 108 13 10 78 66 46 32 115 116 105 108 108 32 115 117 '
zz=:zz,'99 99 101 101 100 32 98 117 116 32 116 104 101 32 100 105 115 112 1'
zz=:zz,'08 97 121 101 100 32 102 105 101 108 100 32 112 101 114 109 117 116'
zz=:zz,' 97 116 105 111 110 32 111 102 32 40 100 98 105 99 104 101 99 107 1'
zz=:zz,'00 97 116 97 41 13 10 78 66 46 32 119 105 108 108 32 118 97 114 121'
zz=:zz,' 13 10 13 10 99 112 101 114 109 61 58 32 93 32 123 34 49 126 32 91 '
zz=:zz,'58 32 63 126 32 91 58 32 123 58 32 36 32 32 78 66 46 32 114 97 110 '
zz=:zz,'100 111 109 32 99 111 108 117 109 110 32 112 101 114 109 117 116 97'
zz=:zz,' 116 105 111 110 32 118 101 114 98 13 10 13 10 48 60 35 100 102 105'
zz=:zz,' 108 101 115 61 58 32 49 32 100 105 114 32 39 67 58 92 66 67 65 92 '
zz=:zz,'98 99 97 100 101 118 92 73 78 92 42 46 100 98 105 39 13 10 40 40 40'
zz=:zz,' 99 112 101 114 109 64 100 98 105 114 101 97 100 41 64 115 104 111 '
zz=:zz,'119 112 97 115 115 41 32 40 40 49 58 64 115 104 111 119 112 97 115 '
zz=:zz,'115 41 64 100 98 105 99 104 101 99 107 100 97 116 97 41 32 100 98 1'
zz=:zz,'05 109 101 116 97 100 97 116 97 41 32 38 62 32 100 102 105 108 101 '
zz=:zz,'115 13 10 13 10 13 10 78 66 46 32 110 111 119 32 114 97 110 100 111'
zz=:zz,' 109 108 121 32 115 101 108 101 99 116 32 97 32 115 117 98 115 101 '
zz=:zz,'116 32 111 102 32 99 111 108 117 109 110 115 32 32 45 32 97 116 32 '
zz=:zz,'108 101 97 115 116 32 111 110 101 32 99 111 108 117 109 110 32 105 '
zz=:zz,'115 32 115 101 108 101 99 116 101 100 13 10 114 99 115 101 108 61 5'
zz=:zz,'8 32 51 32 58 32 39 40 60 97 58 59 40 49 62 46 63 123 58 36 121 41 '
zz=:zz,'63 123 58 36 121 41 32 123 32 121 39 13 10 13 10 48 60 35 100 102 1'
zz=:zz,'05 108 101 115 61 58 32 49 32 100 105 114 32 39 67 58 92 66 67 65 9'
zz=:zz,'2 98 99 97 100 101 118 92 70 76 92 42 46 100 98 105 39 13 10 40 40 '
zz=:zz,'40 114 99 115 101 108 64 100 98 105 114 101 97 100 41 64 115 104 11'
zz=:zz,'1 119 112 97 115 115 41 32 40 40 49 58 64 115 104 111 119 112 97 11'
zz=:zz,'5 115 41 64 100 98 105 99 104 101 99 107 100 97 116 97 41 32 100 98'
zz=:zz,' 105 109 101 116 97 100 97 116 97 41 32 38 62 32 100 102 105 108 10'
zz=:zz,'1 115 13 10 13 10 13 10 13 10 124 100 98 105 108 97 114 103 101 116'
zz=:zz,' 101 115 116 115 48 48 124 78 66 46 42 100 98 105 108 97 114 103 10'
zz=:zz,'1 100 98 105 48 48 32 116 45 45 32 103 101 110 101 114 97 116 101 4'
zz=:zz,'7 114 101 97 100 47 119 114 105 116 101 32 108 97 114 103 101 32 10'
zz=:zz,'0 98 105 32 102 105 108 101 115 46 13 10 78 66 46 13 10 78 66 46 32'
zz=:zz,' 99 114 101 97 116 101 100 58 32 50 48 49 50 109 97 121 48 50 13 10'
zz=:zz,' 78 66 46 32 99 104 97 110 103 101 115 58 32 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 13 10 13 10 99 111 99 117 114 114 101 110 116 39 98 97 115 101 3'
zz=:zz,'9 13 10 99 108 101 97 114 32 39 39 13 10 108 111 97 100 32 39 100 9'
zz=:zz,'8 105 32 100 98 105 116 101 115 116 101 114 39 13 10 13 10 104 100 '
zz=:zz,'112 61 58 32 59 32 73 70 87 73 78 32 123 32 39 47 104 111 109 101 4'
zz=:zz,'7 106 111 104 110 47 116 101 109 112 47 39 32 59 32 39 99 58 47 116'
zz=:zz,' 101 109 112 47 39 13 10 104 100 61 58 32 59 32 73 70 87 73 78 32 1'
zz=:zz,'23 32 39 47 104 111 109 101 47 106 111 104 110 47 39 32 59 32 39 99'
zz=:zz,' 58 47 39 13 10 13 10 49 32 91 32 102 101 114 97 115 101 32 100 98 '
zz=:zz,'105 98 105 103 61 58 104 100 112 44 39 98 105 103 117 108 116 99 10'
zz=:zz,'8 46 100 98 105 39 13 10 49 32 91 32 102 101 114 97 115 101 32 100 '
zz=:zz,'98 105 98 105 103 103 101 114 61 58 32 104 100 112 44 39 98 105 103'
zz=:zz,' 103 101 114 117 108 116 99 108 46 100 98 105 39 13 10 117 108 116 '
zz=:zz,'99 108 61 58 32 104 100 44 39 98 99 97 47 98 99 97 100 101 118 47 1'
zz=:zz,'16 120 47 117 108 116 99 108 46 100 98 105 39 13 10 13 10 78 66 46 '
zz=:zz,'32 114 101 97 100 32 116 121 112 105 99 97 108 32 117 116 108 99 10'
zz=:zz,'8 46 100 98 105 32 40 111 110 101 32 111 102 32 116 104 101 32 108 '
zz=:zz,'97 114 103 101 114 32 65 80 76 32 100 98 105 32 102 105 108 101 115'
zz=:zz,' 41 13 10 78 66 46 32 97 110 100 32 98 108 111 119 32 105 116 32 11'
zz=:zz,'7 112 32 98 121 32 97 32 102 97 99 116 111 114 32 111 102 32 49 53 '
zz=:zz,'13 10 13 10 48 60 40 100 98 105 116 101 109 112 108 97 116 101 32 1'
zz=:zz,'17 108 116 99 108 41 32 100 98 105 99 114 101 97 116 101 32 100 98 '
zz=:zz,'105 98 105 103 13 10 48 60 40 100 98 105 116 101 109 112 108 97 116'
zz=:zz,' 101 32 117 108 116 99 108 41 32 100 98 105 99 114 101 97 116 101 3'
zz=:zz,'2 100 98 105 98 105 103 103 101 114 13 10 13 10 100 97 116 61 58 32'
zz=:zz,' 100 98 105 114 101 97 100 32 117 108 116 99 108 13 10 13 10 100 50'
zz=:zz,' 61 58 32 40 49 32 123 32 100 97 116 41 32 44 38 46 62 32 49 32 123'
zz=:zz,' 32 100 97 116 13 10 100 50 61 58 32 100 50 32 44 38 46 62 32 100 5'
zz=:zz,'0 13 10 100 50 61 58 32 100 50 32 44 38 46 62 32 100 50 13 10 100 5'
zz=:zz,'0 61 58 32 100 50 32 44 38 46 62 32 100 50 13 10 100 97 116 61 58 3'
zz=:zz,'2 40 48 32 123 32 100 97 116 41 32 44 58 32 100 50 13 10 13 10 48 3'
zz=:zz,'2 60 32 115 104 111 119 112 97 115 115 32 100 97 116 32 100 98 105 '
zz=:zz,'119 114 105 116 101 32 100 98 105 98 105 103 32 78 66 46 32 97 114 '
zz=:zz,'111 117 110 100 32 51 48 109 98 32 102 105 108 101 13 10 13 10 100 '
zz=:zz,'50 61 58 32 100 50 32 44 38 46 62 32 100 50 13 10 100 50 61 58 32 1'
zz=:zz,'00 50 32 44 38 46 62 32 100 50 13 10 100 97 116 61 58 32 40 48 32 1'
zz=:zz,'23 32 100 97 116 41 32 44 58 32 100 50 13 10 13 10 48 32 60 32 115 '
zz=:zz,'104 111 119 112 97 115 115 32 100 97 116 32 100 98 105 119 114 105 '
zz=:zz,'116 101 32 100 98 105 98 105 103 103 101 114 32 78 66 46 32 97 114 '
zz=:zz,'111 117 110 100 32 49 48 48 109 98 32 102 105 108 101{a.           '
zz=:23975{.zz
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'4 2$<;._1 ''|builddbi|make compressed version of (dbi)|dbibasictests'
zz=:zz,'00|basic dbi create/write/read tests|dbicheckdata00|basic tests of '
zz=:zz,'(dbicheckdata)|dbilargetests00|generate/read/write large dbi files'''
zz=:201{.zz
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'2 3$''POST_dbi'';21;(78 66 46 80 79 83 84 95 100 98 105 32 112 111 11'
zz=:zz,'5 116 32 112 114 111 99 101 115 115 111 114 46 13 10 13 10 115 109 '
zz=:zz,'111 117 116 112 117 116 32 73 70 65 67 69 61 58 32 40 48 32 58 32 4'
zz=:zz,'8 41 13 10 78 66 46 32 40 100 98 105 41 32 105 110 116 101 114 102 '
zz=:zz,'97 99 101 32 119 111 114 100 40 115 41 58 13 10 78 66 46 32 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13'
zz=:zz,' 10 78 66 46 32 100 98 105 99 114 101 97 116 101 32 32 32 32 78 66 '
zz=:zz,'46 32 99 114 101 97 116 101 32 100 98 105 32 102 105 108 101 13 10 '
zz=:zz,'78 66 46 32 100 98 105 109 101 116 97 100 97 116 97 32 32 78 66 46 '
zz=:zz,'32 101 120 116 114 97 99 116 115 32 100 98 105 32 102 105 108 101 3'
zz=:zz,'2 109 101 116 97 100 97 116 97 13 10 78 66 46 32 100 98 105 114 101'
zz=:zz,' 97 100 32 32 32 32 32 32 78 66 46 32 114 101 97 100 32 100 98 105 '
zz=:zz,'32 102 105 108 101 13 10 78 66 46 32 100 98 105 116 101 109 112 108'
zz=:zz,' 97 116 101 32 32 78 66 46 32 40 120 41 32 97 114 103 117 109 101 1'
zz=:zz,'10 116 32 102 111 114 32 40 100 98 105 99 114 101 97 116 101 41 32 '
zz=:zz,'102 114 111 109 32 100 98 105 32 102 105 108 101 13 10 78 66 46 32 '
zz=:zz,'100 98 105 119 114 105 116 101 32 32 32 32 32 78 66 46 32 119 114 1'
zz=:zz,'05 116 101 32 102 105 101 108 100 32 100 97 116 97 32 116 111 32 10'
zz=:zz,'0 98 105 32 102 105 108 101 13 10 41 13 10 13 10 99 111 99 117 114 '
zz=:zz,'114 101 110 116 32 39 98 97 115 101 39 13 10 99 111 105 110 115 101'
zz=:zz,' 114 116 32 32 39 100 98 105 39{a.);''dbi_describe_md'';27;239 187 19'
zz=:zz,'1 10 85 115 105 110 103 32 96 100 98 105 46 105 106 115 96 10 61 61'
zz=:zz,' 61 61 61 61 61 61 61 61 61 61 61 61 61 10 10 83 101 101 32 91 65 8'
zz=:zz,'0 76 32 83 111 102 116 119 97 114 101 32 65 114 99 104 97 101 111 1'
zz=:zz,'08 111 103 121 32 96 46 100 98 105 96 32 69 100 105 116 105 111 110'
zz=:zz,' 93 40 104 116 116 112 115 58 47 47 97 110 97 108 121 122 101 116 1'
zz=:zz,'04 101 100 97 116 97 110 111 116 116 104 101 100 114 105 118 101 10'
zz=:zz,'8 46 111 114 103 47 50 48 49 51 47 49 50 47 50 54 47 97 112 108 45 '
zz=:zz,'115 111 102 116 119 97 114 101 45 97 114 99 104 97 101 111 108 111 '
zz=:zz,'103 121 45 100 98 105 45 101 100 105 116 105 111 110 47 41 10 102 1'
zz=:zz,'11 114 32 109 111 114 101 32 105 110 102 111 114 109 97 116 105 111'
zz=:zz,' 110 46 10 10 85 115 105 110 103 32 116 104 101 32 74 32 96 100 98 '
zz=:zz,'105 46 105 106 115 96 32 115 99 114 105 112 116 32 105 115 32 115 1'
zz=:zz,'05 109 112 108 101 46 32 84 104 101 32 105 110 99 108 117 100 101 1'
zz=:zz,'00 32 102 105 108 101 32 10 91 96 97 108 108 110 115 102 46 100 98 '
zz=:zz,'105 96 93 40 104 116 116 112 115 58 47 47 103 105 116 104 117 98 46'
zz=:zz,' 99 111 109 47 98 97 107 101 114 106 100 57 57 47 106 97 99 107 115'
zz=:zz,' 47 98 108 111 98 47 109 97 115 116 101 114 47 100 98 105 47 97 108'
zz=:zz,' 108 110 115 102 46 100 98 105 41 32 105 115 10 97 110 32 101 120 9'
zz=:zz,'7 109 112 108 101 32 96 46 100 98 105 96 32 102 105 108 101 32 116 '
zz=:zz,'104 97 116 32 104 111 108 100 115 32 97 108 108 32 116 104 101 32 4'
zz=:zz,'2 102 105 101 108 100 32 116 121 112 101 115 42 32 115 117 112 112 '
zz=:zz,'111 114 116 101 100 32 98 121 10 96 100 98 105 46 105 106 115 96 46'
zz=:zz,' 32 83 105 109 112 108 101 32 102 105 101 108 100 115 32 97 114 101'
zz=:zz,' 32 115 105 109 105 108 97 114 32 116 111 32 83 81 76 32 100 97 116'
zz=:zz,' 97 98 97 115 101 32 99 111 108 117 109 110 115 32 97 110 100 32 11'
zz=:zz,'4 101 115 117 108 116 32 10 105 110 32 115 105 110 103 108 101 32 9'
zz=:zz,'9 111 108 117 109 110 32 116 97 98 108 101 115 32 119 104 101 110 3'
zz=:zz,'2 102 101 116 99 104 101 100 46 32 82 101 112 101 97 116 101 100 32'
zz=:zz,' 102 105 101 108 100 115 32 97 114 101 32 97 99 116 117 97 108 108 '
zz=:zz,'121 32 116 97 98 108 101 115 10 97 110 100 32 114 101 115 117 108 1'
zz=:zz,'16 32 105 110 32 116 97 98 108 101 115 32 119 104 101 110 32 102 10'
zz=:zz,'1 116 99 104 101 100 46 32 65 108 108 32 102 105 101 108 100 115 32'
zz=:zz,' 97 114 101 32 115 116 111 114 101 100 32 97 115 32 99 111 110 116 '
zz=:zz,'105 103 117 111 117 115 32 98 121 116 101 10 114 117 110 115 32 105'
zz=:zz,' 110 32 116 104 101 32 96 46 100 98 105 96 32 102 105 108 101 32 10'
zz=:zz,'9 97 107 105 110 103 32 97 99 99 101 115 115 32 97 115 32 102 97 11'
zz=:zz,'5 116 32 97 115 32 105 116 39 115 32 101 118 101 114 32 103 111 105'
zz=:zz,' 110 103 32 116 111 32 103 101 116 46 32 32 10 10 84 104 101 32 96 '
zz=:zz,'46 100 98 105 96 32 102 111 114 109 97 116 32 119 111 114 107 115 3'
zz=:zz,'2 118 101 114 121 32 119 101 108 108 32 102 111 114 32 110 117 109 '
zz=:zz,'101 114 105 99 32 40 105 110 116 101 103 101 114 32 97 110 100 32 1'
zz=:zz,'02 108 111 97 116 105 110 103 32 112 111 105 110 116 41 10 118 101 '
zz=:zz,'99 116 111 114 115 32 97 110 100 32 116 97 98 108 101 115 46 32 84 '
zz=:zz,'104 101 32 98 121 116 101 32 114 101 112 114 101 115 101 110 116 97'
zz=:zz,' 116 105 111 110 32 111 102 32 96 46 100 98 105 96 32 109 97 116 99'
zz=:zz,' 104 101 115 10 116 104 101 32 110 97 116 105 118 101 32 102 111 11'
zz=:zz,'4 109 97 116 32 111 102 32 116 104 101 32 104 111 115 116 32 97 110'
zz=:zz,' 100 32 99 97 110 32 98 101 32 101 97 115 105 108 121 32 114 101 97'
zz=:zz,' 100 32 97 110 100 32 119 114 105 116 116 101 110 10 98 121 32 111 '
zz=:zz,'116 104 101 114 32 112 114 111 103 114 97 109 115 46 32 83 105 109 '
zz=:zz,'112 108 101 32 65 83 67 73 73 32 99 104 97 114 97 99 116 101 114 32'
zz=:zz,' 100 97 116 97 32 105 115 32 115 117 112 112 111 114 116 101 100 32'
zz=:zz,' 98 117 116 10 116 104 101 32 96 46 100 98 105 96 32 102 111 114 10'
zz=:zz,'9 97 116 32 105 115 32 110 111 116 32 116 101 120 116 32 111 114 10'
zz=:zz,'5 101 110 116 101 100 46 10 10 84 111 32 114 117 110 32 100 111 119'
zz=:zz,' 110 108 111 97 100 32 116 104 101 32 91 71 105 116 72 117 98 32 96'
zz=:zz,' 100 98 105 96 32 100 105 114 101 99 116 111 114 121 93 40 104 116 '
zz=:zz,'116 112 115 58 47 47 103 105 116 104 117 98 46 99 111 109 47 98 97 '
zz=:zz,'107 101 114 106 100 57 57 47 106 97 99 107 115 47 116 114 101 101 4'
zz=:zz,'7 109 97 115 116 101 114 47 100 98 105 41 10 116 111 32 97 32 108 1'
zz=:zz,'11 99 97 108 32 100 105 114 101 99 116 111 114 121 46 32 73 32 112 '
zz=:zz,'108 97 99 101 100 32 116 104 101 32 102 105 108 101 115 32 105 110 '
zz=:zz,'32 96 99 58 47 116 101 109 112 96 46 10 10 76 111 97 100 32 96 100 '
zz=:zz,'98 105 46 105 106 115 96 58 10 10 32 32 32 32 32 32 32 32 32 32 32 '
zz=:zz,'108 111 97 100 32 39 99 58 47 116 101 109 112 47 100 98 105 46 105 '
zz=:zz,'106 115 39 10 9 9 10 86 105 101 119 32 116 104 101 32 102 105 108 1'
zz=:zz,'01 32 116 101 109 112 108 97 116 101 58 10 10 32 32 32 32 32 32 32 '
zz=:zz,'32 32 32 32 100 98 105 116 101 109 112 108 97 116 101 32 39 99 58 4'
zz=:zz,'7 116 101 109 112 47 97 108 108 110 115 102 46 100 98 105 39 10 32 '
zz=:zz,'32 32 32 32 32 32 32 226 148 140 226 148 128 226 148 128 226 148 12'
zz=:zz,'8 226 148 128 226 148 128 226 148 128 226 148 172 226 148 128 226 1'
zz=:zz,'48 128 226 148 128 226 148 172 226 148 128 226 148 128 226 148 128 '
zz=:zz,'226 148 128 226 148 128 226 148 172 226 148 128 226 148 128 226 148'
zz=:zz,' 128 226 148 172 226 148 128 226 148 128 226 148 128 226 148 128 22'
zz=:zz,'6 148 128 226 148 172 226 148 128 226 148 128 226 148 128 226 148 1'
zz=:zz,'72 226 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 '
zz=:zz,'148 172 226 148 128 226 148 128 226 148 128 226 148 128 226 148 172'
zz=:zz,' 226 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 14'
zz=:zz,'8 128 226 148 172 226 148 128 226 148 128 226 148 128 226 148 128 2'
zz=:zz,'26 148 172 226 148 128 226 148 128 226 148 128 226 148 128 226 148 '
zz=:zz,'128 226 148 128 226 148 172 226 148 128 226 148 128 226 148 128 226'
zz=:zz,' 148 128 226 148 172 226 148 128 226 148 128 226 148 128 226 148 12'
zz=:zz,'8 226 148 128 226 148 128 226 148 172 226 148 128 226 148 128 226 1'
zz=:zz,'48 128 226 148 172 226 148 128 226 148 128 226 148 172 226 148 128 '
zz=:zz,'226 148 128 226 148 128 226 148 144 10 32 32 32 32 32 32 32 32 226 '
zz=:zz,'148 130 65 76 76 78 83 70 226 148 130 117 49 102 226 148 130 117 50'
zz=:zz,' 49 117 49 226 148 130 117 52 102 226 148 130 117 49 55 117 52 226 '
zz=:zz,'148 130 117 56 102 226 148 130 117 51 55 117 56 226 148 130 105 49 '
zz=:zz,'54 102 226 148 130 105 49 54 105 49 54 226 148 130 105 51 50 102 22'
zz=:zz,'6 148 130 105 50 48 105 51 50 226 148 130 102 54 52 102 226 148 130'
zz=:zz,' 102 57 55 102 54 52 226 148 130 100 54 102 226 148 130 99 48 226 1'
zz=:zz,'48 130 99 49 53 226 148 130 10 32 32 32 32 32 32 32 32 226 148 156 '
zz=:zz,'226 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 148'
zz=:zz,' 128 226 148 188 226 148 128 226 148 128 226 148 128 226 148 188 22'
zz=:zz,'6 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 148 1'
zz=:zz,'88 226 148 128 226 148 128 226 148 128 226 148 188 226 148 128 226 '
zz=:zz,'148 128 226 148 128 226 148 128 226 148 128 226 148 188 226 148 128'
zz=:zz,' 226 148 128 226 148 128 226 148 188 226 148 128 226 148 128 226 14'
zz=:zz,'8 128 226 148 128 226 148 128 226 148 188 226 148 128 226 148 128 2'
zz=:zz,'26 148 128 226 148 128 226 148 188 226 148 128 226 148 128 226 148 '
zz=:zz,'128 226 148 128 226 148 128 226 148 128 226 148 188 226 148 128 226'
zz=:zz,' 148 128 226 148 128 226 148 128 226 148 188 226 148 128 226 148 12'
zz=:zz,'8 226 148 128 226 148 128 226 148 128 226 148 128 226 148 188 226 1'
zz=:zz,'48 128 226 148 128 226 148 128 226 148 128 226 148 188 226 148 128 '
zz=:zz,'226 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 148'
zz=:zz,' 188 226 148 128 226 148 128 226 148 128 226 148 188 226 148 128 22'
zz=:zz,'6 148 128 226 148 188 226 148 128 226 148 128 226 148 128 226 148 1'
zz=:zz,'64 10 32 32 32 32 32 32 32 32 226 148 130 49 55 49 51 32 32 226 148'
zz=:zz,' 130 85 49 32 226 148 130 50 49 85 49 32 226 148 130 85 52 32 226 1'
zz=:zz,'48 130 49 55 85 52 32 226 148 130 85 56 32 226 148 130 51 55 85 56 '
zz=:zz,'32 226 148 130 73 49 54 32 226 148 130 49 54 73 49 54 32 226 148 13'
zz=:zz,'0 73 51 50 32 226 148 130 50 48 73 51 50 32 226 148 130 70 54 52 32'
zz=:zz,' 226 148 130 57 55 70 54 52 32 226 148 130 68 54 32 226 148 130 67 '
zz=:zz,'48 226 148 130 67 49 53 226 148 130 10 32 32 32 32 32 32 32 32 226 '
zz=:zz,'148 148 226 148 128 226 148 128 226 148 128 226 148 128 226 148 128'
zz=:zz,' 226 148 128 226 148 180 226 148 128 226 148 128 226 148 128 226 14'
zz=:zz,'8 180 226 148 128 226 148 128 226 148 128 226 148 128 226 148 128 2'
zz=:zz,'26 148 180 226 148 128 226 148 128 226 148 128 226 148 180 226 148 '
zz=:zz,'128 226 148 128 226 148 128 226 148 128 226 148 128 226 148 180 226'
zz=:zz,' 148 128 226 148 128 226 148 128 226 148 180 226 148 128 226 148 12'
zz=:zz,'8 226 148 128 226 148 128 226 148 128 226 148 180 226 148 128 226 1'
zz=:zz,'48 128 226 148 128 226 148 128 226 148 180 226 148 128 226 148 128 '
zz=:zz,'226 148 128 226 148 128 226 148 128 226 148 128 226 148 180 226 148'
zz=:zz,' 128 226 148 128 226 148 128 226 148 128 226 148 180 226 148 128 22'
zz=:zz,'6 148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 148 1'
zz=:zz,'80 226 148 128 226 148 128 226 148 128 226 148 128 226 148 180 226 '
zz=:zz,'148 128 226 148 128 226 148 128 226 148 128 226 148 128 226 148 128'
zz=:zz,' 226 148 180 226 148 128 226 148 128 226 148 128 226 148 180 226 14'
zz=:zz,'8 128 226 148 128 226 148 180 226 148 128 226 148 128 226 148 128 2'
zz=:zz,'26 148 152 9 10 10 84 104 105 115 32 102 105 108 101 32 104 97 115 '
zz=:zz,'32 49 55 49 51 32 42 114 101 99 111 114 100 115 46 42 32 82 101 97 '
zz=:zz,'100 32 97 108 108 32 116 104 101 32 102 105 101 108 100 115 58 10 1'
zz=:zz,'0 32 32 32 32 32 32 32 32 32 32 32 100 61 46 32 100 98 105 114 101 '
zz=:zz,'97 100 32 39 99 58 47 116 101 109 112 47 97 108 108 110 115 102 46 '
zz=:zz,'100 98 105 39 10 10 84 104 101 32 114 101 115 117 108 116 32 105 11'
zz=:zz,'5 32 97 32 116 119 111 32 114 111 119 32 98 111 120 101 100 32 116 '
zz=:zz,'97 98 108 101 46 32 84 104 101 32 102 105 114 115 116 32 114 111 11'
zz=:zz,'9 32 99 111 110 116 97 105 110 115 32 102 105 101 108 100 32 110 97'
zz=:zz,' 109 101 115 32 97 110 100 10 116 104 101 32 115 101 99 111 110 100'
zz=:zz,' 32 114 111 119 32 104 111 108 100 115 32 116 104 101 32 102 105 10'
zz=:zz,'1 108 100 32 100 97 116 97 46 10 10 32 32 32 32 32 32 32 32 32 32 3'
zz=:zz,'2 108 105 115 116 32 48 32 123 32 100 10 32 32 32 32 32 32 32 32 65'
zz=:zz,' 76 76 78 83 70 95 117 49 102 32 32 32 32 65 76 76 78 83 70 95 117 '
zz=:zz,'50 49 117 49 32 32 65 76 76 78 83 70 95 117 52 102 32 32 32 32 65 7'
zz=:zz,'6 76 78 83 70 95 117 49 55 117 52 32 32 65 76 76 78 83 70 95 117 56'
zz=:zz,' 102 32 32 32 32 10 32 32 32 32 32 32 32 32 65 76 76 78 83 70 95 11'
zz=:zz,'7 51 55 117 56 32 32 65 76 76 78 83 70 95 105 49 54 102 32 32 32 65'
zz=:zz,' 76 76 78 83 70 95 105 49 54 105 49 54 32 65 76 76 78 83 70 95 105 '
zz=:zz,'51 50 102 32 32 32 65 76 76 78 83 70 95 105 50 48 105 51 50 32 10 3'
zz=:zz,'2 32 32 32 32 32 32 32 65 76 76 78 83 70 95 102 54 52 102 32 32 32 '
zz=:zz,'65 76 76 78 83 70 95 102 57 55 102 54 52 32 65 76 76 78 83 70 95 10'
zz=:zz,'0 54 102 32 32 32 32 65 76 76 78 83 70 95 99 48 32 32 32 32 32 65 7'
zz=:zz,'6 76 78 83 70 95 99 49 53 10 10 32 32 32 32 32 32 32 32 32 32 32 10'
zz=:zz,'8 105 115 116 32 100 97 116 97 116 121 112 101 38 46 62 32 49 32 12'
zz=:zz,'3 32 100 32 32 78 66 46 32 102 105 101 108 100 115 32 104 97 118 10'
zz=:zz,'1 32 118 97 114 105 111 117 115 32 74 32 100 97 116 97 116 121 112 '
zz=:zz,'101 115 10 32 32 32 32 32 32 32 32 98 111 111 108 101 97 110 32 32 '
zz=:zz,'98 111 111 108 101 97 110 32 32 105 110 116 101 103 101 114 32 32 1'
zz=:zz,'05 110 116 101 103 101 114 32 32 105 110 116 101 103 101 114 32 32 '
zz=:zz,'105 110 116 101 103 101 114 32 32 105 110 116 101 103 101 114 32 32'
zz=:zz,' 105 110 116 101 103 101 114 32 32 10 32 32 32 32 32 32 32 32 105 1'
zz=:zz,'10 116 101 103 101 114 32 32 105 110 116 101 103 101 114 32 32 102 '
zz=:zz,'108 111 97 116 105 110 103 32 102 108 111 97 116 105 110 103 32 105'
zz=:zz,' 110 116 101 103 101 114 32 32 108 105 116 101 114 97 108 32 32 108'
zz=:zz,' 105 116 101 114 97 108 10 10 73 110 100 105 114 101 99 116 32 97 1'
zz=:zz,'15 115 105 103 110 109 101 110 116 32 105 115 32 97 32 104 97 110 1'
zz=:zz,'00 121 32 119 97 121 32 116 111 32 101 120 116 114 97 99 116 32 97 '
zz=:zz,'108 108 32 116 104 101 32 102 105 101 108 100 115 32 97 115 32 110 '
zz=:zz,'111 117 110 115 58 10 10 32 32 32 32 32 32 32 32 32 32 40 48 123 10'
zz=:zz,'0 41 61 58 32 49 123 100 32 10 32 32 32 10 32 32 32 32 32 32 32 32 '
zz=:zz,'32 32 110 97 109 101 115 39 39 10 32 32 32 32 32 32 32 65 76 76 78 '
zz=:zz,'83 70 95 99 48 32 32 32 32 32 65 76 76 78 83 70 95 99 49 53 32 32 3'
zz=:zz,'2 32 65 76 76 78 83 70 95 100 54 102 32 32 32 32 65 76 76 78 83 70 '
zz=:zz,'95 102 54 52 102 32 32 32 65 76 76 78 83 70 95 102 57 55 102 54 52 '
zz=:zz,'32 10 32 32 32 32 32 32 32 65 76 76 78 83 70 95 105 49 54 102 32 32'
zz=:zz,' 32 65 76 76 78 83 70 95 105 49 54 105 49 54 32 65 76 76 78 83 70 9'
zz=:zz,'5 105 50 48 105 51 50 32 65 76 76 78 83 70 95 105 51 50 102 32 32 3'
zz=:zz,'2 65 76 76 78 83 70 95 117 49 55 117 52 32 32 10 32 32 32 32 32 32 '
zz=:zz,'32 65 76 76 78 83 70 95 117 49 102 32 32 32 32 65 76 76 78 83 70 95'
zz=:zz,' 117 50 49 117 49 32 32 65 76 76 78 83 70 95 117 51 55 117 56 32 32'
zz=:zz,' 65 76 76 78 83 70 95 117 52 102 32 32 32 32 65 76 76 78 83 70 95 1'
zz=:zz,'17 56 102 32 32 10 32 32 32 32 32 32 32 100 9 32 32 32 10 10 67 114'
zz=:zz,' 101 97 116 105 110 103 32 97 110 100 32 119 114 105 116 105 110 10'
zz=:zz,'3 32 97 32 110 101 119 32 96 46 100 98 105 96 32 105 115 32 115 116'
zz=:zz,' 114 97 105 103 104 116 32 102 111 114 119 97 114 100 46 32 10 10 3'
zz=:zz,'2 32 32 32 32 32 32 32 32 32 116 61 46 32 100 98 105 116 101 109 11'
zz=:zz,'2 108 97 116 101 32 39 99 58 47 116 101 109 112 47 97 108 108 110 1'
zz=:zz,'15 102 46 100 98 105 39 10 9 9 32 32 10 83 116 97 114 116 32 116 10'
zz=:zz,'4 101 32 110 101 119 32 102 105 108 101 32 119 105 116 104 32 48 32'
zz=:zz,' 114 101 99 111 114 100 115 46 32 84 104 101 32 115 121 115 116 101'
zz=:zz,' 109 32 112 114 101 97 108 108 111 99 97 116 101 115 32 102 105 108'
zz=:zz,' 101 32 115 112 97 99 101 10 105 102 32 116 104 101 32 114 101 99 1'
zz=:zz,'11 114 100 32 99 111 117 110 116 32 105 115 32 110 111 116 32 122 1'
zz=:zz,'01 114 111 46 10 10 9 9 32 32 116 99 32 61 46 32 40 60 34 58 48 41 '
zz=:zz,'32 40 60 49 59 48 41 125 32 116 10 9 9 32 32 10 9 9 32 32 78 66 46 '
zz=:zz,'32 110 111 110 122 101 114 111 32 114 101 115 117 108 116 32 105 11'
zz=:zz,'0 100 105 99 97 116 101 115 32 115 117 99 99 101 115 115 10 32 32 3'
zz=:zz,'2 32 32 32 32 32 32 32 116 99 32 100 98 105 99 114 101 97 116 101 3'
zz=:zz,'2 39 99 58 47 116 101 109 112 47 97 108 108 99 111 112 121 46 100 9'
zz=:zz,'8 105 39 10 32 32 32 32 32 32 32 50 48 52 56 10 9 9 32 32 10 9 9 32'
zz=:zz,' 32 78 66 46 32 119 114 105 116 101 32 97 108 108 32 102 105 101 10'
zz=:zz,'8 100 115 32 45 32 114 101 115 117 108 116 32 105 115 32 98 121 116'
zz=:zz,' 101 32 99 111 117 110 116 10 32 32 32 32 32 32 32 32 32 32 100 32 '
zz=:zz,'100 98 105 119 114 105 116 101 32 39 99 58 47 116 101 109 112 47 97'
zz=:zz,' 108 108 99 111 112 121 46 100 98 105 39 10 32 32 32 32 32 32 32 49'
zz=:zz,' 55 56 50 50 52 51 10 9 32 32 32 10 82 101 97 100 32 116 104 101 32'
zz=:zz,' 99 111 112 121 32 98 97 99 107 32 97 110 100 32 99 111 109 112 97 '
zz=:zz,'114 101 32 100 97 116 97 58 10 10 32 32 32 32 32 32 32 32 32 32 100'
zz=:zz,' 99 32 61 46 100 98 105 114 101 97 100 32 39 99 58 47 116 101 109 1'
zz=:zz,'12 47 97 108 108 99 111 112 121 46 100 98 105 39 10 9 9 32 32 40 49'
zz=:zz,' 123 100 41 32 45 58 32 49 123 100 99 10 32 32 32 32 32 32 32 49 10'
zz=:zz,' 10 84 104 101 32 96 46 100 98 105 96 32 115 121 115 116 101 109 32'
zz=:zz,' 99 97 110 32 114 101 97 100 32 97 110 100 32 119 114 105 116 101 3'
zz=:zz,'2 115 105 110 103 108 101 32 102 105 101 108 100 115 32 97 110 100 '
zz=:zz,'32 115 117 112 112 111 114 116 115 32 100 97 116 101 116 105 109 10'
zz=:zz,'1 32 100 97 116 97 46 32 10 83 101 101 32 99 111 100 101 32 99 111 '
zz=:zz,'109 109 101 110 116 115 32 102 111 114 32 109 111 114 101 32 100 10'
zz=:zz,'1 116 97 105 108 115 46 10 10 74 111 104 110 32 66 97 107 101 114 1'
zz=:zz,'0 111 114 105 103 105 110 97 108 58 32 68 101 99 101 109 98 101 114'
zz=:zz,' 32 50 54 44 32 50 48 49 51 10 114 101 118 105 115 101 100 58 32 79'
zz=:zz,' 99 116 111 98 101 114 32 56 44 32 50 48 50 48 10{a.               '
zz=:16199{.zz
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'2 2$<;._1 ''|POST_dbi|POST_dbi post processor|dbi_describe_md|markdo'
zz=:zz,'wn how to use (dbi)''                                               '
zz=:87{.zz
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' dbi DBIBASETYPES DBISPECIAL DBIVERSION IFACEWORDSdbi ROOT'
zz=:zz,'WORDSdbi apply assert boxopen bytebits3 changestr d6 dbicheckdata d'
zz=:zz,'bicreate dbifieldtypes dbiheader dbimetadata dbinamecheck dbioffset'
zz=:zz,'s dbiparseheader dbiparsetypes dbiread dbirepsnc dbitemplate dbites'
zz=:zz,'tnrf dbiwrite dbiwritefields dfb f64 fboxname fc fexist fresize fsi'
zz=:zz,'ze fwrite hfd i16 i32 ic iread isboxed iscfield ischar isd6 isf64 i'
zz=:zz,'si16 isi32 isint isu1 isu4 isu8 iwrite justext mode2 rtrim spcrep t'
zz=:zz,'7stmp tolower toupper ts6Frts7 ts7Frts6 u1 u4 u8 utf8 valdate''),<<;'
zz=:zz,'._1 '' dbitester valdate yeardates''                                 '
zz=:570{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'2 2$<;.(_1) 124 100 98 105 124 78 66 46 42 100 98 105 32 115 45 45 '
zz=:zz,'32 99 114 101 97 116 101 47 114 101 97 100 47 119 114 105 116 101 3'
zz=:zz,'2 65 80 76 32 105 110 118 101 114 116 101 100 32 100 98 105 32 102 '
zz=:zz,'105 108 101 115 46 32 13 10 78 66 46 13 10 78 66 46 32 105 110 116 '
zz=:zz,'101 114 102 97 99 101 32 119 111 114 100 40 115 41 58 13 10 78 66 4'
zz=:zz,'6 13 10 78 66 46 32 100 98 105 99 114 101 97 116 101 32 32 32 32 78'
zz=:zz,' 66 46 32 99 114 101 97 116 101 32 100 98 105 32 102 105 108 101 13'
zz=:zz,' 10 78 66 46 32 100 98 105 109 101 116 97 100 97 116 97 32 32 78 66'
zz=:zz,' 46 32 101 120 116 114 97 99 116 115 32 100 98 105 32 102 105 108 1'
zz=:zz,'01 32 109 101 116 97 100 97 116 97 13 10 78 66 46 32 100 98 105 114'
zz=:zz,' 101 97 100 32 32 32 32 32 32 78 66 46 32 114 101 97 100 32 100 98 '
zz=:zz,'105 32 102 105 108 101 13 10 78 66 46 32 100 98 105 116 101 109 112'
zz=:zz,' 108 97 116 101 32 32 78 66 46 32 40 120 41 32 97 114 103 117 109 1'
zz=:zz,'01 110 116 32 102 111 114 32 40 100 98 105 99 114 101 97 116 101 41'
zz=:zz,' 32 102 114 111 109 32 100 98 105 32 102 105 108 101 13 10 78 66 46'
zz=:zz,' 32 100 98 105 119 114 105 116 101 32 32 32 32 32 78 66 46 32 119 1'
zz=:zz,'14 105 116 101 32 102 105 101 108 100 32 100 97 116 97 32 116 111 3'
zz=:zz,'2 100 98 105 32 102 105 108 101 13 10 78 66 46 32 32 13 10 78 66 46'
zz=:zz,' 32 99 114 101 97 116 101 100 58 32 50 48 49 50 109 97 114 50 55 13'
zz=:zz,' 10 78 66 46 32 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 13 10 78 66 46 32'
zz=:zz,' 49 50 111 99 116 48 57 32 40 106 111 100 108 105 116 101 114 97 11'
zz=:zz,'6 101 41 32 103 114 111 117 112 32 100 111 99 117 109 101 110 116 9'
zz=:zz,'7 116 105 111 110 32 97 100 100 101 100 13 10 78 66 46 32 49 52 106'
zz=:zz,' 117 108 48 52 32 40 98 121 116 101 98 105 116 115 41 32 114 101 11'
zz=:zz,'0 97 109 101 100 32 40 98 121 116 101 98 105 116 115 51 41 32 119 1'
zz=:zz,'05 116 104 32 114 101 115 117 108 116 32 110 111 116 101 13 10 13 1'
zz=:zz,'0 99 111 99 108 97 115 115 32 39 100 98 105 39 13 10 124 100 98 105'
zz=:zz,' 116 101 115 116 101 114 124 78 66 46 42 100 98 105 116 101 115 116'
zz=:zz,' 101 114 32 116 45 45 32 108 111 97 100 32 40 100 98 105 41 32 116 '
zz=:zz,'101 115 116 32 117 116 105 108 105 116 105 101 115 46 13 10 78 66 4'
zz=:zz,'6 13 10 78 66 46 32 99 114 101 97 116 101 100 58 32 50 48 49 50 97 '
zz=:zz,'112 114 48 57 13 10 78 66 46 32 99 104 97 110 103 101 115 58 32 45 '
zz=:zz,'45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 4'
zz=:zz,'5 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45'
zz=:zz,' 45 45 45 45 45 45 45 13 10 13 10 78 66 46 32 109 101 114 103 101 3'
zz=:zz,'2 116 101 115 116 32 119 111 114 100 115 32 105 110 116 111 32 40 1'
zz=:zz,'00 98 105 41 32 108 111 99 97 108 101 13 10 99 111 99 108 97 115 11'
zz=:zz,'5 32 39 100 98 105 39 13 10{a.                                     '
zz=:2643{.zz
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'2 2$<;._1 ''|dbi|create/read/write APL inverted dbi files|dbitester|'
zz=:zz,'load (dbi) test utilities''                                         '
zz=:93{.zz
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',:''dbi'';96 100 98 105 96 32 105 115 32 97 32 74 32 115 99 114 105 1'
zz=:zz,'12 116 32 116 104 97 116 32 114 101 97 100 115 32 97 110 100 32 119'
zz=:zz,' 114 105 116 101 32 105 110 118 101 114 116 101 100 32 96 46 100 98'
zz=:zz,' 105 96 32 102 105 108 101 115 46 13 10 13 10 96 100 98 105 96 32 1'
zz=:zz,'05 115 32 100 101 115 99 114 105 98 101 100 32 105 110 32 116 104 1'
zz=:zz,'01 32 98 108 111 103 32 112 111 115 116 32 91 65 80 76 32 83 111 10'
zz=:zz,'2 116 119 97 114 101 32 65 114 99 104 97 101 111 108 111 103 121 32'
zz=:zz,' 96 46 100 98 105 96 32 69 100 105 116 105 111 110 93 40 104 116 11'
zz=:zz,'6 112 115 58 47 47 97 110 97 108 121 122 101 116 104 101 100 97 116'
zz=:zz,' 97 110 111 116 116 104 101 100 114 105 118 101 108 46 111 114 103 '
zz=:zz,'47 50 48 49 51 47 49 50 47 50 54 47 97 112 108 45 115 111 102 116 1'
zz=:zz,'19 97 114 101 45 97 114 99 104 97 101 111 108 111 103 121 45 100 98'
zz=:zz,' 105 45 101 100 105 116 105 111 110 47 41 46 13 10 13 10 92 115 109'
zz=:zz,' 97 108 108 13 10 13 10 42 32 91 104 116 116 112 115 58 47 47 97 11'
zz=:zz,'0 97 108 121 122 101 116 104 101 100 97 116 97 110 111 116 116 104 '
zz=:zz,'101 100 114 105 118 101 108 46 111 114 103 47 50 48 49 51 47 49 50 '
zz=:zz,'47 50 54 47 97 112 108 45 115 111 102 116 119 97 114 101 45 97 114 '
zz=:zz,'99 104 97 101 111 108 111 103 121 45 100 98 105 45 101 100 105 116 '
zz=:zz,'105 111 110 47 93 40 104 116 116 112 115 58 47 47 97 110 97 108 121'
zz=:zz,' 122 101 116 104 101 100 97 116 97 110 111 116 116 104 101 100 114 '
zz=:zz,'105 118 101 108 46 111 114 103 47 50 48 49 51 47 49 50 47 50 54 47 '
zz=:zz,'97 112 108 45 115 111 102 116 119 97 114 101 45 97 114 99 104 97 10'
zz=:zz,'1 111 108 111 103 121 45 100 98 105 45 101 100 105 116 105 111 110 '
zz=:zz,'47 41 13 10 13 10 92 110 111 114 109 97 108 115 105 122 101 13 10 1'
zz=:zz,'3 10 96 100 98 105 96 32 115 111 117 114 99 101 32 105 115 32 97 11'
zz=:zz,'8 97 105 108 97 98 108 101 32 104 101 114 101 58 13 10 13 10 92 115'
zz=:zz,' 109 97 108 108 13 10 13 10 42 32 91 104 116 116 112 115 58 47 47 1'
zz=:zz,'03 105 116 104 117 98 46 99 111 109 47 98 97 107 101 114 106 100 57'
zz=:zz,' 57 47 106 97 99 107 115 47 98 108 111 98 47 109 97 115 116 101 114'
zz=:zz,' 47 100 98 105 47 100 98 105 46 105 106 115 93 40 104 116 116 112 1'
zz=:zz,'15 58 47 47 103 105 116 104 117 98 46 99 111 109 47 98 97 107 101 1'
zz=:zz,'14 106 100 57 57 47 106 97 99 107 115 47 98 108 111 98 47 109 97 11'
zz=:zz,'5 116 101 114 47 100 98 105 47 100 98 105 46 105 106 115 41 13 10 1'
zz=:zz,'3 10 92 110 111 114 109 97 108 115 105 122 101 13 10 13 10 92 115 1'
zz=:zz,'17 98 115 101 99 116 105 111 110 123 92 116 101 120 116 116 116 123'
zz=:zz,' 100 98 105 125 32 73 110 116 101 114 102 97 99 101 125 13 10 13 10'
zz=:zz,' 126 126 126 126 32 123 32 46 106 32 125 13 10 78 66 46 32 100 98 1'
zz=:zz,'05 99 114 101 97 116 101 32 32 32 32 78 66 46 32 99 114 101 97 116 '
zz=:zz,'101 32 100 98 105 32 102 105 108 101 13 10 78 66 46 32 100 98 105 1'
zz=:zz,'09 101 116 97 100 97 116 97 32 32 78 66 46 32 101 120 116 114 97 99'
zz=:zz,' 116 115 32 100 98 105 32 102 105 108 101 32 109 101 116 97 100 97 '
zz=:zz,'116 97 13 10 78 66 46 32 100 98 105 114 101 97 100 32 32 32 32 32 3'
zz=:zz,'2 78 66 46 32 114 101 97 100 32 100 98 105 32 102 105 108 101 13 10'
zz=:zz,' 78 66 46 32 100 98 105 116 101 109 112 108 97 116 101 32 32 78 66 '
zz=:zz,'46 32 40 120 41 32 97 114 103 117 109 101 110 116 32 102 111 114 32'
zz=:zz,' 40 100 98 105 99 114 101 97 116 101 41 32 102 114 111 109 32 100 9'
zz=:zz,'8 105 32 102 105 108 101 13 10 78 66 46 32 100 98 105 119 114 105 1'
zz=:zz,'16 101 32 32 32 32 32 78 66 46 32 119 114 105 116 101 32 102 105 10'
zz=:zz,'1 108 100 32 100 97 116 97 32 116 111 32 100 98 105 32 102 105 108 '
zz=:zz,'101 13 10 126 126 126 126 13 10 13 10 92 115 117 98 115 101 99 116 '
zz=:zz,'105 111 110 123 82 117 110 110 105 110 103 32 92 116 101 120 116 11'
zz=:zz,'6 116 123 100 98 105 125 125 13 10 13 10 85 115 105 110 103 32 116 '
zz=:zz,'104 101 32 74 32 96 100 98 105 46 105 106 115 96 32 115 99 114 105 '
zz=:zz,'112 116 32 105 115 32 115 105 109 112 108 101 46 32 84 104 101 32 1'
zz=:zz,'05 110 99 108 117 100 101 100 32 102 105 108 101 32 13 10 91 96 97 '
zz=:zz,'108 108 110 115 102 46 100 98 105 96 93 40 104 116 116 112 115 58 4'
zz=:zz,'7 47 103 105 116 104 117 98 46 99 111 109 47 98 97 107 101 114 106 '
zz=:zz,'100 57 57 47 106 97 99 107 115 47 98 108 111 98 47 109 97 115 116 1'
zz=:zz,'01 114 47 100 98 105 47 97 108 108 110 115 102 46 100 98 105 41 32 '
zz=:zz,'105 115 13 10 97 110 32 101 120 97 109 112 108 101 32 96 46 100 98 '
zz=:zz,'105 96 32 102 105 108 101 32 116 104 97 116 32 104 111 108 100 115 '
zz=:zz,'32 97 108 108 32 116 104 101 32 42 102 105 101 108 100 32 116 121 1'
zz=:zz,'12 101 115 42 32 115 117 112 112 111 114 116 101 100 32 98 121 13 1'
zz=:zz,'0 96 100 98 105 46 105 106 115 96 46 32 83 105 109 112 108 101 32 1'
zz=:zz,'02 105 101 108 100 115 32 97 114 101 32 115 105 109 105 108 97 114 '
zz=:zz,'32 116 111 32 83 81 76 32 100 97 116 97 98 97 115 101 32 99 111 108'
zz=:zz,' 117 109 110 115 32 97 110 100 32 114 101 115 117 108 116 13 10 105'
zz=:zz,' 110 32 115 105 110 103 108 101 32 99 111 108 117 109 110 32 116 97'
zz=:zz,' 98 108 101 115 32 119 104 101 110 32 102 101 116 99 104 101 100 46'
zz=:zz,' 32 82 101 112 101 97 116 101 100 32 102 105 101 108 100 115 32 97 '
zz=:zz,'114 101 32 97 99 116 117 97 108 108 121 32 116 97 98 108 101 115 13'
zz=:zz,' 10 97 110 100 32 114 101 115 117 108 116 32 105 110 32 116 97 98 1'
zz=:zz,'08 101 115 32 119 104 101 110 32 102 101 116 99 104 101 100 46 32 6'
zz=:zz,'5 108 108 32 102 105 101 108 100 115 32 97 114 101 32 115 116 111 1'
zz=:zz,'14 101 100 32 97 115 32 99 111 110 116 105 103 117 111 117 115 32 9'
zz=:zz,'8 121 116 101 13 10 114 117 110 115 32 105 110 32 116 104 101 32 96'
zz=:zz,' 46 100 98 105 96 32 102 105 108 101 32 109 97 107 105 110 103 32 9'
zz=:zz,'7 99 99 101 115 115 32 97 115 32 102 97 115 116 32 97 115 32 105 11'
zz=:zz,'6 39 115 32 101 118 101 114 32 103 111 105 110 103 32 116 111 32 10'
zz=:zz,'3 101 116 46 32 32 13 10 13 10 84 104 101 32 96 46 100 98 105 96 32'
zz=:zz,' 102 111 114 109 97 116 32 119 111 114 107 115 32 118 101 114 121 3'
zz=:zz,'2 119 101 108 108 32 102 111 114 32 110 117 109 101 114 105 99 32 4'
zz=:zz,'0 105 110 116 101 103 101 114 32 97 110 100 32 102 108 111 97 116 1'
zz=:zz,'05 110 103 32 112 111 105 110 116 41 13 10 118 101 99 116 111 114 1'
zz=:zz,'15 32 97 110 100 32 116 97 98 108 101 115 46 32 84 104 101 32 96 46'
zz=:zz,' 100 98 105 96 32 98 121 116 101 32 114 101 112 114 101 115 101 110'
zz=:zz,' 116 97 116 105 111 110 32 109 97 116 99 104 101 115 13 10 110 97 1'
zz=:zz,'16 105 118 101 32 104 111 115 116 32 102 111 114 109 97 116 115 32 '
zz=:zz,'97 110 100 32 99 97 110 32 98 101 32 101 97 115 105 108 121 32 114 '
zz=:zz,'101 97 100 32 97 110 100 32 119 114 105 116 116 101 110 13 10 98 12'
zz=:zz,'1 32 111 116 104 101 114 32 112 114 111 103 114 97 109 115 46 32 83'
zz=:zz,' 105 109 112 108 101 32 65 83 67 73 73 32 99 104 97 114 97 99 116 1'
zz=:zz,'01 114 32 100 97 116 97 32 105 115 32 97 108 115 111 32 115 117 112'
zz=:zz,' 112 111 114 116 101 100 32 98 117 116 13 10 116 104 101 32 96 46 1'
zz=:zz,'00 98 105 96 32 102 111 114 109 97 116 32 105 115 32 110 111 116 32'
zz=:zz,' 116 101 120 116 32 111 114 105 101 110 116 101 100 46 13 10 13 10 '
zz=:zz,'84 111 32 114 117 110 32 100 111 119 110 108 111 97 100 32 116 104 '
zz=:zz,'101 32 91 71 105 116 72 117 98 32 96 100 98 105 96 32 100 105 114 1'
zz=:zz,'01 99 116 111 114 121 93 40 104 116 116 112 115 58 47 47 103 105 11'
zz=:zz,'6 104 117 98 46 99 111 109 47 98 97 107 101 114 106 100 57 57 47 10'
zz=:zz,'6 97 99 107 115 47 116 114 101 101 47 109 97 115 116 101 114 47 100'
zz=:zz,' 98 105 41 13 10 116 111 32 97 32 108 111 99 97 108 32 100 105 114 '
zz=:zz,'101 99 116 111 114 121 46 32 73 32 112 108 97 99 101 100 32 116 104'
zz=:zz,' 101 32 102 105 108 101 115 32 105 110 32 96 99 58 47 116 101 109 1'
zz=:zz,'12 96 46 13 10 13 10 76 111 97 100 32 96 100 98 105 46 105 106 115 '
zz=:zz,'96 58 13 10 13 10 126 126 126 123 46 106 125 13 10 32 32 32 108 111'
zz=:zz,' 97 100 32 39 99 58 47 116 101 109 112 47 100 98 105 46 105 106 115'
zz=:zz,' 39 13 10 126 126 126 13 10 13 10 86 105 101 119 32 116 104 101 32 '
zz=:zz,'102 105 108 101 32 116 101 109 112 108 97 116 101 58 13 10 13 10 12'
zz=:zz,'6 126 126 123 46 106 125 13 10 32 32 32 100 98 105 116 101 109 112 '
zz=:zz,'108 97 116 101 32 39 99 58 47 116 101 109 112 47 97 108 108 110 115'
zz=:zz,' 102 46 100 98 105 39 13 10 43 45 45 45 45 45 45 43 45 45 45 43 45 '
zz=:zz,'45 45 45 45 43 45 45 45 43 45 45 45 45 45 43 45 45 45 43 45 45 45 4'
zz=:zz,'5 45 43 45 45 45 45 43 45 45 45 45 45 45 43 45 45 45 45 43 45 45 45'
zz=:zz,' 45 45 45 43 45 45 45 45 43 45 45 45 45 45 45 43 45 45 45 43 45 45 '
zz=:zz,'43 45 45 45 43 13 10 124 65 76 76 78 83 70 124 117 49 102 124 117 5'
zz=:zz,'0 49 117 49 124 117 52 102 124 117 49 55 117 52 124 117 56 102 124 '
zz=:zz,'117 51 55 117 56 124 105 49 54 102 124 105 49 54 105 49 54 124 105 '
zz=:zz,'51 50 102 124 105 50 48 105 51 50 124 102 54 52 102 124 102 57 55 1'
zz=:zz,'02 54 52 124 100 54 102 124 99 48 124 99 49 53 124 13 10 43 45 45 4'
zz=:zz,'5 45 45 45 43 45 45 45 43 45 45 45 45 45 43 45 45 45 43 45 45 45 45'
zz=:zz,' 45 43 45 45 45 43 45 45 45 45 45 43 45 45 45 45 43 45 45 45 45 45 '
zz=:zz,'45 43 45 45 45 45 43 45 45 45 45 45 45 43 45 45 45 45 43 45 45 45 4'
zz=:zz,'5 45 45 43 45 45 45 43 45 45 43 45 45 45 43 13 10 124 49 55 49 51 3'
zz=:zz,'2 32 124 85 49 32 124 50 49 85 49 32 124 85 52 32 124 49 55 85 52 3'
zz=:zz,'2 124 85 56 32 124 51 55 85 56 32 124 73 49 54 32 124 49 54 73 49 5'
zz=:zz,'4 32 124 73 51 50 32 124 50 48 73 51 50 32 124 70 54 52 32 124 57 5'
zz=:zz,'5 70 54 52 32 124 68 54 32 124 67 48 124 67 49 53 124 13 10 43 45 4'
zz=:zz,'5 45 45 45 45 43 45 45 45 43 45 45 45 45 45 43 45 45 45 43 45 45 45'
zz=:zz,' 45 45 43 45 45 45 43 45 45 45 45 45 43 45 45 45 45 43 45 45 45 45 '
zz=:zz,'45 45 43 45 45 45 45 43 45 45 45 45 45 45 43 45 45 45 45 43 45 45 4'
zz=:zz,'5 45 45 45 43 45 45 45 43 45 45 43 45 45 45 43 13 10 126 126 126 13'
zz=:zz,' 10 13 10 84 104 105 115 32 102 105 108 101 32 104 97 115 32 49 55 '
zz=:zz,'49 51 32 42 114 101 99 111 114 100 115 46 42 32 82 101 97 100 32 97'
zz=:zz,' 108 108 32 116 104 101 32 102 105 101 108 100 115 58 13 10 13 10 1'
zz=:zz,'26 126 126 123 46 106 125 13 10 32 32 32 100 61 46 32 100 98 105 11'
zz=:zz,'4 101 97 100 32 39 99 58 47 116 101 109 112 47 97 108 108 110 115 1'
zz=:zz,'02 46 100 98 105 39 13 10 126 126 126 13 10 13 10 84 104 101 32 114'
zz=:zz,' 101 115 117 108 116 32 105 115 32 97 32 116 119 111 32 114 111 119'
zz=:zz,' 32 98 111 120 101 100 32 116 97 98 108 101 46 32 84 104 101 32 102'
zz=:zz,' 105 114 115 116 32 114 111 119 32 99 111 110 116 97 105 110 115 32'
zz=:zz,' 102 105 101 108 100 32 110 97 109 101 115 32 97 110 100 13 10 116 '
zz=:zz,'104 101 32 115 101 99 111 110 100 32 114 111 119 32 104 111 108 100'
zz=:zz,' 115 32 116 104 101 32 102 105 101 108 100 32 100 97 116 97 46 13 1'
zz=:zz,'0 13 10 126 126 126 123 46 106 125 13 10 32 32 32 56 48 32 108 105 '
zz=:zz,'115 116 32 48 32 123 32 100 32 32 78 66 46 32 100 98 105 32 102 105'
zz=:zz,' 101 108 100 32 110 97 109 101 115 13 10 65 76 76 78 83 70 95 117 4'
zz=:zz,'9 102 32 32 32 32 65 76 76 78 83 70 95 117 50 49 117 49 32 32 65 76'
zz=:zz,' 76 78 83 70 95 117 52 102 32 32 32 32 65 76 76 78 83 70 95 117 49 '
zz=:zz,'55 117 52 32 32 65 76 76 78 83 70 95 117 56 102 32 32 32 32 13 10 6'
zz=:zz,'5 76 76 78 83 70 95 117 51 55 117 56 32 32 65 76 76 78 83 70 95 105'
zz=:zz,' 49 54 102 32 32 32 65 76 76 78 83 70 95 105 49 54 105 49 54 32 65 '
zz=:zz,'76 76 78 83 70 95 105 51 50 102 32 32 32 65 76 76 78 83 70 95 105 5'
zz=:zz,'0 48 105 51 50 32 13 10 65 76 76 78 83 70 95 102 54 52 102 32 32 32'
zz=:zz,' 65 76 76 78 83 70 95 102 57 55 102 54 52 32 65 76 76 78 83 70 95 1'
zz=:zz,'00 54 102 32 32 32 32 65 76 76 78 83 70 95 99 48 32 32 32 32 32 65 '
zz=:zz,'76 76 78 83 70 95 99 49 53 32 32 32 32 13 10 13 10 32 32 32 56 48 3'
zz=:zz,'2 108 105 115 116 32 100 97 116 97 116 121 112 101 38 46 62 32 49 3'
zz=:zz,'2 123 32 100 32 32 78 66 46 32 102 105 101 108 100 115 32 104 97 11'
zz=:zz,'8 101 32 118 97 114 105 111 117 115 32 74 32 100 97 116 97 116 121 '
zz=:zz,'112 101 115 13 10 98 111 111 108 101 97 110 32 32 98 111 111 108 10'
zz=:zz,'1 97 110 32 32 105 110 116 101 103 101 114 32 32 105 110 116 101 10'
zz=:zz,'3 101 114 32 32 105 110 116 101 103 101 114 32 32 105 110 116 101 1'
zz=:zz,'03 101 114 32 32 105 110 116 101 103 101 114 32 32 105 110 116 101 '
zz=:zz,'103 101 114 32 32 13 10 105 110 116 101 103 101 114 32 32 105 110 1'
zz=:zz,'16 101 103 101 114 32 32 102 108 111 97 116 105 110 103 32 102 108 '
zz=:zz,'111 97 116 105 110 103 32 105 110 116 101 103 101 114 32 32 108 105'
zz=:zz,' 116 101 114 97 108 32 32 108 105 116 101 114 97 108 32 13 10 126 1'
zz=:zz,'26 126 13 10 13 10 73 110 100 105 114 101 99 116 32 97 115 115 105 '
zz=:zz,'103 110 109 101 110 116 32 105 115 32 97 32 104 97 110 100 121 32 1'
zz=:zz,'19 97 121 32 116 111 32 101 120 116 114 97 99 116 32 97 108 108 32 '
zz=:zz,'116 104 101 32 102 105 101 108 100 115 32 97 115 32 110 111 117 110'
zz=:zz,' 115 58 13 10 13 10 126 126 126 123 46 106 125 13 10 32 32 32 40 48'
zz=:zz,' 123 100 41 61 58 32 49 123 100 32 32 78 66 46 32 97 115 115 105 10'
zz=:zz,'3 110 32 118 97 108 117 101 115 32 105 110 32 49 32 116 111 32 110 '
zz=:zz,'97 109 101 115 32 105 110 32 48 13 10 13 10 32 32 32 56 48 32 108 1'
zz=:zz,'05 115 116 32 39 65 39 32 110 108 32 39 39 13 10 65 76 76 78 83 70 '
zz=:zz,'95 99 48 32 32 32 32 32 65 76 76 78 83 70 95 99 49 53 32 32 32 32 6'
zz=:zz,'5 76 76 78 83 70 95 100 54 102 32 32 32 32 65 76 76 78 83 70 95 102'
zz=:zz,' 54 52 102 32 32 32 65 76 76 78 83 70 95 102 57 55 102 54 52 32 13 '
zz=:zz,'10 65 76 76 78 83 70 95 105 49 54 102 32 32 32 65 76 76 78 83 70 95'
zz=:zz,' 105 49 54 105 49 54 32 65 76 76 78 83 70 95 105 50 48 105 51 50 32'
zz=:zz,' 65 76 76 78 83 70 95 105 51 50 102 32 32 32 65 76 76 78 83 70 95 1'
zz=:zz,'17 49 55 117 52 32 32 13 10 65 76 76 78 83 70 95 117 49 102 32 32 3'
zz=:zz,'2 32 65 76 76 78 83 70 95 117 50 49 117 49 32 32 65 76 76 78 83 70 '
zz=:zz,'95 117 51 55 117 56 32 32 65 76 76 78 83 70 95 117 52 102 32 32 32 '
zz=:zz,'32 65 76 76 78 83 70 95 117 56 102 32 32 32 13 10 126 126 126 32 32'
zz=:zz,' 32 13 10 13 10 67 114 101 97 116 105 110 103 32 97 110 100 32 119 '
zz=:zz,'114 105 116 105 110 103 32 97 32 110 101 119 32 96 46 100 98 105 96'
zz=:zz,' 32 105 115 32 115 116 114 97 105 103 104 116 32 102 111 114 119 97'
zz=:zz,' 114 100 46 32 13 10 13 10 126 126 126 123 46 106 125 13 10 32 32 3'
zz=:zz,'2 116 61 46 32 100 98 105 116 101 109 112 108 97 116 101 32 39 99 5'
zz=:zz,'8 47 116 101 109 112 47 97 108 108 110 115 102 46 100 98 105 39 13 '
zz=:zz,'10 126 126 126 13 10 9 9 32 32 13 10 83 116 97 114 116 32 116 104 1'
zz=:zz,'01 32 110 101 119 32 102 105 108 101 32 119 105 116 104 32 48 32 11'
zz=:zz,'4 101 99 111 114 100 115 46 32 84 104 101 32 115 121 115 116 101 10'
zz=:zz,'9 32 112 114 101 97 108 108 111 99 97 116 101 115 32 102 105 108 10'
zz=:zz,'1 32 115 112 97 99 101 13 10 105 102 32 116 104 101 32 114 101 99 1'
zz=:zz,'11 114 100 32 99 111 117 110 116 32 105 115 32 110 111 116 32 122 1'
zz=:zz,'01 114 111 46 13 10 13 10 126 126 126 123 46 106 125 13 10 32 32 32'
zz=:zz,' 116 99 32 61 46 32 40 60 34 58 48 41 32 40 60 49 59 48 41 125 32 1'
zz=:zz,'16 13 10 32 32 13 10 32 32 32 78 66 46 32 110 111 110 122 101 114 1'
zz=:zz,'11 32 114 101 115 117 108 116 32 105 110 100 105 99 97 116 101 115 '
zz=:zz,'32 115 117 99 99 101 115 115 13 10 32 32 32 116 99 32 100 98 105 99'
zz=:zz,' 114 101 97 116 101 32 39 99 58 47 116 101 109 112 47 97 108 108 99'
zz=:zz,' 111 112 121 46 100 98 105 39 13 10 50 48 52 56 13 10 32 32 13 10 3'
zz=:zz,'2 32 32 78 66 46 32 119 114 105 116 101 32 97 108 108 32 102 105 10'
zz=:zz,'1 108 100 115 32 45 32 114 101 115 117 108 116 32 105 115 32 98 121'
zz=:zz,' 116 101 32 99 111 117 110 116 13 10 32 32 32 100 32 100 98 105 119'
zz=:zz,' 114 105 116 101 32 39 99 58 47 116 101 109 112 47 97 108 108 99 11'
zz=:zz,'1 112 121 46 100 98 105 39 13 10 49 55 56 50 50 52 51 13 10 126 126'
zz=:zz,' 126 13 10 13 10 82 101 97 100 32 116 104 101 32 99 111 112 121 32 '
zz=:zz,'98 97 99 107 32 97 110 100 32 99 111 109 112 97 114 101 32 100 97 1'
zz=:zz,'16 97 58 13 10 13 10 126 126 126 123 46 106 125 13 10 32 32 32 100 '
zz=:zz,'99 32 61 46 100 98 105 114 101 97 100 32 39 99 58 47 116 101 109 11'
zz=:zz,'2 47 97 108 108 99 111 112 121 46 100 98 105 39 13 10 32 32 32 40 4'
zz=:zz,'9 123 100 41 32 45 58 32 49 123 100 99 13 10 49 13 10 126 126 126 1'
zz=:zz,'3 10 13 10 84 104 101 32 96 46 100 98 105 96 32 115 121 115 116 101'
zz=:zz,' 109 32 99 97 110 32 114 101 97 100 32 97 110 100 32 119 114 105 11'
zz=:zz,'6 101 32 115 105 110 103 108 101 32 102 105 101 108 100 115 32 97 1'
zz=:zz,'10 100 32 115 117 112 112 111 114 116 115 32 100 97 116 101 116 105'
zz=:zz,' 109 101 32 100 97 116 97 46 32 13 10 83 101 101 32 99 111 100 101 '
zz=:zz,'32 99 111 109 109 101 110 116 115 32 102 111 114 32 109 111 114 101'
zz=:zz,' 32 100 101 116 97 105 108 115 46 13 10 13 10 92 109 101 100 115 10'
zz=:zz,'7 105 112 13 10 13 10 13 10 74 111 104 110 32 66 97 107 101 114 59 '
zz=:zz,'13 10 42 111 114 105 103 105 110 97 108 58 32 68 101 99 101 109 98 '
zz=:zz,'101 114 32 50 54 44 32 50 48 49 51 42 59 13 10 42 114 101 118 105 1'
zz=:zz,'15 101 100 58 32 79 99 116 111 98 101 114 32 57 44 32 50 48 50 48 4'
zz=:zz,'2 13 10 13 10 13 10 13 10 13 10 13 10 13 10{a.                     '
zz=:15322{.zz
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',:<;.(_1) 124 124 98 97 114 102 32 45 32 66 105 110 97 114 121 32 6'
zz=:zz,'5 82 114 97 121 32 70 111 114 109 97 116 115 13 10 61 61 61 61 61 6'
zz=:zz,'1 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 13'
zz=:zz,' 10 13 10 96 98 97 114 102 96 32 104 111 108 100 115 32 118 97 114 '
zz=:zz,'105 111 117 115 32 98 105 110 97 114 121 32 97 114 114 97 121 32 11'
zz=:zz,'4 101 97 100 101 114 115 32 97 110 100 32 119 114 105 116 101 114 1'
zz=:zz,'15 46 32 13 10 13 10 78 111 116 97 98 108 101 32 103 114 111 117 11'
zz=:zz,'2 115 47 99 108 97 115 115 101 115 32 97 114 101 58 13 10 13 10 49 '
zz=:zz,'46 32 96 100 98 105 96 32 97 32 114 101 118 101 114 115 101 32 101 '
zz=:zz,'110 103 105 110 101 101 114 101 100 32 118 101 115 105 111 110 32 1'
zz=:zz,'11 102 32 97 110 32 65 80 76 32 96 100 98 105 96 32 102 105 108 101'
zz=:zz,' 115 32 115 121 115 116 101 109 46 13 10 13 10 50 46 32 96 110 112 '
zz=:zz,'121 96 32 40 112 108 97 110 110 101 100 41 32 115 117 112 112 111 1'
zz=:zz,'14 116 32 102 111 114 32 114 101 97 100 105 110 103 32 97 110 100 3'
zz=:zz,'2 119 114 105 116 105 110 103 32 97 32 74 32 111 114 105 101 110 11'
zz=:zz,'6 101 100 32 115 117 98 115 101 116 32 111 102 32 78 117 109 80 121'
zz=:zz,' 13 10 32 32 32 98 105 110 97 114 121 32 97 114 114 97 121 32 102 1'
zz=:zz,'05 108 101 115 44 32 115 101 101 58 32 91 110 117 109 112 121 46 10'
zz=:zz,'8 105 98 46 102 111 114 109 97 116 93 40 104 116 116 112 115 58 47 '
zz=:zz,'47 110 117 109 112 121 46 111 114 103 47 100 111 99 47 115 116 97 9'
zz=:zz,'8 108 101 47 114 101 102 101 114 101 110 99 101 47 103 101 110 101 '
zz=:zz,'114 97 116 101 100 47 110 117 109 112 121 46 108 105 98 46 102 111 '
zz=:zz,'114 109 97 116 46 104 116 109 108 35 109 111 100 117 108 101 45 110'
zz=:zz,' 117 109 112 121 46 108 105 98 46 102 111 114 109 97 116 41 13 10{a'
zz=:zz,'.                                                                  '
zz=:1609{.zz
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
