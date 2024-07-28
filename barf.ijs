NB. sha256:1ee10e49826d95619c24bf7f6a6c08496f7787bf97735e00d00f13c02816ba7f
NB. JOD dictionary dump: 23 Jul 2024 09:11:44
NB. Generated with JOD version; 1.1.3 - dev; 6; 20 Jul 2024 12:14:32
NB. J version: j9.6.0-beta14/j64avx2/windows/commercial/www.jsoftware.com/2024-07-19T02:38:13/clang-18-1-6/SLEEF=1
NB. JOD put dictionary path: /barf/utils
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |barf|319743004554101481250031745496351476702|
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

dbi_hashdateurl=:<;._1 '|45bcaf458016316c5dba16fc7e4d6805f4aa380b828b68ef7ecfc7830fbcd217|11 Nov 2020 16:40:53|https://github.com/bakerjd99/jacks/blob/master/dbi/dbi.ijs'

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

spcrep=:[: , ('/' ,. [: ,. a. { ~ ]) ,. '/hx' ,"1 [: hfd ,

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
zz=:dec85__MK__JODobj 0 : 0
1,Ca01c$70+>GVo2)?@00H`5/+>GPm2)?@01E\J4+>GVo1H-F:+>khq1*AG0+>GVo1,g=9+>G_r
0f'q-2'=n%1,^700d&50+>GVo1GL",0H`5,+>G\q1,9t,1E\G5+?(Dt1E\\#1Gp:00d&;.+>GPm
2DcO9+>Po!0f1"-2BXdu1c?I8+>GSn1E\M.+>Y,s0H`4q2DZI8+>Ykt1a"\1+>k8u0d&=r2)$.1
+>khq1a"V/+>b2t0H`1p1b^%1+>Ghu2BXe5+>t?"1E\Y"2)?@7+>kqt1*AA3+>P&r3$9t!1cRli
8O>^A79!Dd78mZ(F(HJ)@VHrsBk;*k+EVmJATKmTDJpY<AT24&Bln'-DK?q=EZfF5@;KKtAmo1k
DfTne6:k*P770X49QP/a@qf@f+@/gt+DtV)AKYJr@<,ddFCfK6+DG^90Ha58@:VZ)+E(j7F)Q2A
@q?cK:eX8D8QJ8X;b9b[G%G]8Bl@l3Ch7d$C`mY.+Cnqq+D,>(ATJtG+DbJ-F<EkG9H\LiEcYr5
DBNY7+>YW(0M+`"6Ub'P;FFGo@VKOoFCfK)@:NjkGAhM4F!)l&7R9C1=&2^^;e0?O.3N8DDfp"s
:JXqk:JsSZA7B7nDf9_?GAhM4F!)l/:JXqk:JsSZA7B7%+D5_5F`8HG+<VdL@X3',@VKq*1Mgc@
AKWBL3$^7.+<roi@4i[:/g+FK+C]J8+CT)1@<lo:Eb0?8Ec,q@@W-1$ARTIe2IgZCG%G]9+?(EQ
DesQ5DBNY2FCf)rEZee2Eaa59FD5T'F*(i-E-!.DD]gq\@X3',F(A`o@q]F`CLgjq@<?(%FE8R:
Bk;*k+DtV)AM7S&FC?;6@:F%aA7B7_Eb/[$ARfal@<?''A7B6qAnc'mA7B7bBk;*kFEqh:F(T,t
Ch+Z1H#R>9+D,Y4D'3\,FCA]gFCA]hBkV'dA7]dnDfT]'F<G+'Bcq8(FCA]gFC?;*ART+\Eb&Wn
D.RftA79RgAU&<;@:OD#+Cnqq+D,>(AKYi$FCA]gFCA]hBl7?rARfCb@r#RfARfKuA7B6qFCAWp
AKYE!A0>JuASbm"DIIBnF(A`oDe<U&ATW!'Df'H9FCcS(H$!U?De<U&ATVu9FDi:6Bk;*kF!+n/
A0>u4FCAu.A7B6q@X3',F(A`oE+*d.AS>X`A7]e#@<-F#F!,"&Bcq#%Ch4`&ART+\Eb&WnE+*d.
ATW3:ATM?pARfLs+CT.u+E1b0F(KD8AnbgmA0>u>E+O*$@VKjo@:XCi@:UKk@VHrsBl%?k@VKjo
E-#o,Eb03+@:NjkF)Y]#Bjkg#5u:5tDIIBn+Cf(nEa`I"ATDj&@VKpqD/a<"FCckF.3N&>B6A'&
DKI"5DfQsKA7B7_Eb/[$ALSa6Ec5e;A7B6qAnc'mA7B7pATMs2Eb9E)F*&OFARfY!A0>B#F`):D
@:s"_DKBnBAnbgmA0>]"DJ+')F!+n/A0>o(FEMVA+Cf>1Eb/a&+Eh10F_,)mBm4T3FCfZ:Blmo/
AnbgmA0>DkFC?;6D]iS"Bcq#%Ch7-dBm4T3FCf&uASbmuGB.D>AKYMmBcq#%ASbmuAi;JUDf0`0
Ec`F9Ci<a(Bl7Q+@<-BsGp%3I+CoD5@VfTu2DcOcBlkJ,Bl7@"H"M).F(or3Eb0<+H=\42Bl%?p
0fEN[DK]T3F<G:8FCf)rEZee2Eaa59FDi:CATVu9De:+I+C]V<ATMQA11P6?G%G]9+DG_8AS5Rp
+CT;2@<iu;D]j+4FE8RCAfroQ@X3',F(oZ+@:X(iA7^!sA0>JuCh4`0ART*l/Kf(FFEMVAF!+t/
+C]V<ATJu.Afu/;@q0(kF(TQ2+C?iGDffZ(Ed)5=ASH3qAnbgmA7AtgBk&9-H#R=;FCfN8+D,P4
+Cf(nEa`I"ATAo*Bk;*kBldfC0d(1B+=MLa+DGm>Eb031ATMF#FCAWpAKYE&+CQBN+C]V<AKZ)/
D.Rd1@;Tt)+>=pVFD,6+GA2,0BldlE1bg+eAfrLI.3N>G+D*Mg+ED%4Eb0<'DKK;rCh4_C+E)@8
ATE!/F(K',Be_M#+DGF1.![6aBlbCFF(o9)ARm54Be_LgEb031ATMF#FCAWpAKWZLDffZ(Ed)5=
ASH4"1GU[-BkAJ9GpskMF!)lPBkM<pA18X81GU(nAT2[$F(K62@:F%a+>=pVFD,6+GA2,0BleDO
0d(1B+=M@]+DGm>FYP"ZAT2[$F(K62@:F%a+>=pVFD,6+GA2,0BleDR0d(1B+=MLa+DGm>FYk4]
AT2[$F(K62@:F%a+>=pVFD,6+GA2,0BleDV0d(1B+=MLa+DGm>FZ:LaAT2[$F(K62@:F%a+>=pV
FD,6+GA2,0Bm4T3FCf0(A7^!sA0>JuCh4`5EbTW,F)YW0AT27"Ebuq?E+NNn@;I&rBOPpi@ru:&
+ED%4CgggbD.RU,F*'?^FDYu/DfT]'F<ELbBl8$(B4Z*+Blmp'+EV=7ATMs%D/^VCEZf4:+Coa?
BQ>54DBO"A+Dl1@FE9?0Ecc@]2BZISFCcS8AT2[$F(K62@<?4%DBNP3Df$UU+DG_8AS5Rp+Cf>+
F_u"=FD5T'F*(i-E--.[7WNTl2E)amDKKH&ATAo'DesQ5DBO%8D.Rd1@;Ts+Ao_g,+>t?OH$!U?
Eb031ATMF#FCB9*Df0\P@rH7.ATDl8@W-1$ARTI!@<-BsGp%3I+E]C]@q]:k@:OCjEcj3KDf0`0
Ec`F<DKKH&ATAo%EcPT6+EVNE1a$7AF<G^DF(o9)ARlotDKKH&ATDj73+HlEG%G]9+DG_8AS5Rp
+CT;2@<iu;D]h"^@VKp,F`)87B5V9k+DG_8AS5RpEr                                ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.1+>P'"+>GT/3?U%6+>bf/0d&2-+>GW/0H`)-+?;/3@WcC$A7&kVBhguI.UmO7Ch-m`@VHs+
/M/)^@;BEs@rH4'Eb0<5ARlp,ATDj+Df-\9AfrL4@VI8D%15is/e&._67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91hq/L
1,9tmAThd/ARloqDfQsm+?;&4+=L`<@rc-hFCd+8De3rtF(HdC@q]:gB4Z,n$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@6"4tNCh.'cBdX>s%15is/g+eIDfp"A
F(96)E-*42DIal3@<-!lF<GOFF<G+.@ruF'DIIR2%17/dEc+$$+<W%B@VI2!$?TokBk':e+=CW,
Eb6[.$4R>+0RI_VD`p-(A8,Qs0F\@Q0RI_K+?MV3@UX:h+E_d?Ci^sH>9G^EDe't<-OgCl$9g.j
FDYu5Ddso&ATT%V3[],lBlmo/Eb/Zi+EVF3+EM47GApu3F!,"&BjYO^F(f)mFCfT8C`me4@59\u
-OgDH0RInYE,9H&+D58-Ed/]SA7]suBlmp$F(96)E-*H:$4R>QD`p-(HTHL+6r60K87,_&<*s!)
:IK,1C(1LZ$;No?+=M)CF"&5RBPDN1F(96)E-*4ED]ib3F*2M7+=M;Q@<-HBBkh]<+DGm>F(KG&
$9g.jD/=89-Y-\#-OgDpBl%?D3Zq?g;I<dAD_*8H@VIH/C3(a3$4R>;67sC'E+EC!AKXoB5r(;U
+D>2)BHU`$A0>DkFCcR<-n6Z//g+\6BjYO^F(f)mFCfT8C^g_"1E\_$0I\+l-OgDr@<6*F/g,4K
@59\u+ED%%A0>JuCh4%_.!&m=DCd/BBOPsqA79RkF`M:G.6T^7-tm%1BKL<MD.Rd1@;Ts+-RU>c
-nlbu.=E<_/otNCDCd/BBOPsqA79RkF`M:G%16f]/g)hj4WlpBHZX+DCi<f+E-67FF(96./14e<
@<6*m@<?('Ebm*GA8a(0$6UHG+Bot0BQ&*6@<6K4-R^>n.!&m=DCd/BBOPsqA79RkF`M:G.4chq
+Eh=:F(oQ1/nAC4AM.Y)F(c\6Dfd+EE+EC!ARm.t$>"$pAM,)[%16ZaA1e;u.1HUn$;No?+E).6
Gp%3BAKYr1F*)AADe!@"F)Q(ADe:+?A7B7%+CehtDJsV>@V$ZlDf'H6ATMp(A.8l00RIMKF$2Q,
1*BpZ+DkP&AKW@2@VI2!$>F6r4ZX]rATqg%FCf3.@rc:&F<EYl3b`>M%16faF$2Q,.!09;+DGS3
.3L/a1a$=CF)W6L:et"h?Y!V[-OgCl$8EZ-+=M>M8g%h_F"&5UEbTW,+EM47GApu3F!,(/Ch4%_
%159QHZ*F;I4fGVD]i7,1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:
@ps1b?YO7nA7#cQ%16WTBjtLlBk)6rF*)IW0MXqe.V*"&@UX=l@ru:'FE9,i+ET1e+C\c#Bk&8r
@VHrpEb/[$AM87JBlmo>Eb/Zi+EV19FE9&D$;No?+<V+#:-pQU@rc-hFCeuD+>PW*11>-B0K'@I
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0f!0VE\]EnAncL$A0>i"Ecc#(C`mqBBlmp-+Eqj;@;BRpB-:\<+D,>!Ch.T0
-tHe$De<U&ATVuB%15is/g)l(@;p6B1a$4;A7]9oF)Y]#Bjkg#@psFi+EVNE-u!a52CTbWCi"$6
Bl7Q+@;Ka&,'mg@D^$<7@<?(%+:SYe$;No?+CfG'@<?''@;]TuFCfN8+Cnqq+EqOABHU`"C`m\8
F)u&)Ch4`,Df0W+@;KLc+D,>!Ch.Sr$=e!aF`MM6DKI78@<6!-%16T]ARTU%-RT?1Ci<`m+=C]/
BcpqqBlmp-FCfJ?%13OOBOl'F3ZpL,8OccQ:*=m+-SK.OD.PA8DeO#AFCf<.0..l(+=CY[06CcB
E%`RJ$4R=s+Bot#ATD4#AKYMmBg"LjA8j(I@;KatF(R%8@VI2!$8EZ-+D,2*@<6!&A7B7aD/aTB
4ZX^!A8j(I@;Kat@:We!A7B7#%13OO:-pQU:/=hX3Zr$KASbm"DIIBnF!,R<@<<W%CghBu+EqOA
BHUhpBcqS1Eag//@;TRs%15is/g,">Gp$U*F`V+:E,ol+Ch7I)+E_R<ATMo8H#IgJ@<?U"@q[!$
De!3lAKZ&:AnGb%ATJ:f%15is/g+YEART[l+D#D/FEn<&Aop0s+?V_<?SNoN0Ha@M+>PZO0d'IQ
+>GfT1a#dX+>YrV3$:dI2BX_48MN+G8M`+E1,)9U1*B%E1a"e;7Q*(G6oH/T0H`_;2(&h?Aop0s
+=K<4-UCF":/aV)FYRJNFYY[o0d(TqAfu4N2g$r"FZ<tUFYbt!3$;oi2J+(G0fE`#2BZ]i11hYC
1,*Du1*C0e1hIkB3B(P.1a$<eAftS;+Cd,`-Rg/h3Zr$V%14dOAoo/+@VK=mART[l+Cnqq%13OO
AoqU$E--@g3Zogu5tjsI5t"!d+?L\n0IJ:l/1r&n/g<"mAonIh0K`rhASlC.Gp$X,Bk)0p@<?''
A7B7aD/aTB%13OO:-pQUEb/Zi+CT.u+Eqj?FCcS+D/aTB%14dP-t[!Q3ZqsBBl[cnA0>DlBdk08
@VL%,Blmo/A7B6^$4R>;67sBuATo8=ASlC&@<?''F(fK7Ch+Z*@<?!m+CfG'@<?4%DBO">ARfcj
$>+B&/NP"b@VKpqD/a<"FCcS*@VH8Y%15is/g+\5FC?;(Bk;*kF!,O;Dfol,+D>2,AKZ;1Ec3(@
Dg-73$8<Sc+<r3s+>J4TA.8kT$8EZ-+D,2*@<6!&A7B793bW&C/14kBCi4<+/nAF*-OgCl$;No?
+ED%'DfTA2@rHL-F:ARpEb7Hq+<VdL0fLgC%13OO:-pQUEb/a$ART[l+EqOABHV22DIm[(FEnuQ
H=_,8+s:K3ASbmu%16]h1-IZ@-mq;S9MSMU-T`M5DK9><+=o,fI4c]u+D,^)$4R=r4D&[j+Cnqq
@rc-hFCcS*@VH8Y%15is/g,1G@:UKhDIal6EbTW,+D#D/FEn<&An4%c+CnqqEb/Zi+Cnqq%13OO
:-pQU6<-Mu7S-]N6m*TrH=_,8+s:K3ASbmu+EVX<B4kdr+EVmJAKYQ)Ec5u>+:SZQ67sC%E+NNn
@;I&r@<6!&@q]:gB4W3-D]gHBF(@0X+CT)&Dg-7F@;Ka&FD5T'+>=pK@<?(%%14dOAn3#p@VL%,
Blmo/A7B6^$4R>;67sBuATo8=ASlC&@<?''F(fK7Ch+Z*@<?!m+CfG'@<?4%DBO">ARfcj$>+B8
+>#VsA7B7pASlC&@<?''A7B6^$4R>;67sBk@<>p#AnbgmA9/l7BQ&$0A0>PoG%De6Eb6G7Dg-73
$>slr+?^hl-9`P,HY-dt$4R=O$;No?+D,b4C`mqBBlmo/De:,#Cht5+Bk;*kF!(o!H"CE)4ZX].
+>Gl92[p+:0kNR0+<VdL5AkLR,;K]8FYY[o0g.Q?+=M,JAh5\l.3s$jAdo)i1hJm3+<VdL-uO';
5AkLR.=5rQAgD(C+>Gb`$?\'^FYl6B+<W(MEb6jW2^p"p1hI1(FZ<tr3ZoOf+=M,JAj:0RAgr(E
Eb6S2/g)o,2@U"91H0G94ZX].-uO';/2K46,]u(Y%16f(2J,*5+<VdT5AkLR,;q500JP"!HQXGF
3Zp440JG0i$>D4QBe_M/3ZohgEb6jW2CTnc0fEVQ$>D:OAj&0t+<W(MEb7OREb6aC.j-r,+>R7Z
0F\A'1,*Du1-IZ@-uO';/2An.,\]%iAdo)Z2Df#/3ZoOf-o!Cu.NiFX+Du43.3KoZ0fKOKAiVe^
2DdQX+=M,JAh5r$.3p#jGVL<j+DEGNDK9>=3B%BS%15is/g,1CDId[&+Eh10Bk/?.Bl.F&FCB$*
F!,(8Df$UFH"CE).3N_N+Dkh/Ch[s%@rH6q+E2@4@qg!uDf-[,$=l&,4ZX].+?V8)-pMTiAg9)i
2(<ltARTUi@<?(%+F.O,E[`+^/g)o++>tnr2D?7.0JG1',<?r3+Du43+<r!Y0/>@,2D?730H`)(
0JEqC%16T!4ZX].+<VdjDK9>3,To32/mg=U9L^Q\FD,B0+DGm>G%#E*@:F%a+DbV,B67f7/5/Ma
-ZipEF<G[=@<<W/@<iu.D]it9+=A]g1,(C--Qli8A0>f.-RgT?7P#oe:/jeY+A!\M<DujE/5/Ma
-ZaBJE$/k:-OgDm0f;*T+<VdL0f:)#/g<"m@k\?!%15is/g+b?ASbm"A79Rg+Du+?DK?q;F`VXI
AU%p1F:AR2+?^ib@j$1P+>A.SF:AQd$;No?+D,b4C`mqBBlmo/A79Rg%16]b4ZX]64=E9FHSBeY
F=Aag?RI9F/1)u5+FPjb0RIDR%16]X4ZX]tDBLJk+<iEb/j:C+I4cWrHY.@K+=nil4s2s8?XdGb
AR?eo$4R>;67sC)EbTW,+CT.u+ED%%A0>>i@r!3(F`VXID..NrBFP;&4D&+HA7B7sEbTW,+Cnqq
%16]X+>#VsA7B7nART*lA7B6^$4R>;67sBjBOt[h+DG_(Bm+3$F^])/AnbgmA0>o(@:XEg$?\(8
+<VdL/NP"90mb9j0kMdUA7B7nART*lA7B6^$?\*YFYP!]/NP"90mb9j1,3o+-Qlr/Bl[cnA0>Dl
BakDl1hIjQ+<W6s+?M<)-Zq7X-Qlr/Bl[cnA0>DlBakDl0fO53+<W6s+?M<)-Zq.&FYkHgA7B7n
ART*lA7B6^$?\=?+<VdL/NP"90mb9j3+aN\A7B7nART*lA7B6q%17562g%)&+>#Vs4#)(0FYbt!
3%#hZ@VKjo@:UKk@VH8YBe_MX+<VdY3ZpL=HREM^2J+<ZA7B7nART*lA7B6^$>D4QBe_Lg/NP"9
0mb9^0fE`#2CBVX@VKjo@:UKk@VHqo$>D:OAfr3=/NP"90mb9^1GWPi+CnqqEb/Zi+Cnqq%16f)
0PN<u+>#Vs4#)(0BehAV1GU=#A7B7nART*lA7B6^$>)1QAfr3=/NP"90mb9[2Df"n+CnqqEb/Zi
+Cnqq%16]-2eFs)+>#Vs4#)(0AiVe^2Dcd(A7B7nART*lA7B6^$=l&,+<VdL/NP"90mb9Y2J+<Z
A7B7nART*lA7B6^$=bb4+<VdL/NP"90mb9X0IIuR@VKjo@:UKk@VH8Y@kfh`+<VdY3ZpL=HRE;X
2('MW@VKjo@:UKk@VH8Y%15is/g,1G@:V$.De*QoGqX2LEb/Zi+EM+1ARfgnA0>JuASbmu%16]X
4ZX]5FYRJU+CnqqEb/Zi+Cnqq%1754Ao;1(4ZX]MDK9>61(=S&A26;/+=JpjAn3>5/34n9FYRKG
ATnRj%15is/g*VT=@GV#6<-Mu-o!JcE,m]f.3NS<Ecc#(C`mqBBlmp-+Eqj;@;?uqBOPpi@ru:&
+D,>!Ch.T0%15is/g)hW$4R=r4D&+Z+CnqqGB.D>AKYMmBakD]A258Z3Zoem0kMdUA7B7nART*l
A7B6^$4R>;67sC$ARfCb@r!3!Bk;*kEt&J!0kP<7G9AIu+?M<)-Zq.U-Qlr/Bl[cnA0>DlBakDl
1,3o++<W6s+?M<)-Zq1!FYP6dA7B7nART*lA7B6^$?\1;+<VdL/NP"90mb9j1hJ*XA7B7nART*l
A7B6^$?\'^FYk3`/NP"90mb9j0fO53-Qlr/Bl[cnA0>DlBakDl3+a9U+<W6s+?M<)-ZqC\-Qlr/
Bl[cnA0>DlBcmilFYbt!3$9=q3ZpL=HREql2g%)-+CnqqEb/Zi+Cnqq%16f(2J+'S+>#Vs4#)(0
Be_MX-Qlr/Bl[cnA0>DlBakD`0fE`#2BXS4+?M<)-YY:nBe_Ln+CnqqEb/Zi+Cnqq+:SZl1GWPb
+<W6s+?M<)-YY@lAg\^3@VKjo@:UKk@VH8YBehAV1GU()3ZpL=HREM_0PN<u-Qlr/Bl[cnA0>Dl
BakD]2Df"g+<W6s+?M<)-Y>7nAg\^3@VKjo@:UKk@VH8YAiVe^2DcO.3ZpL=HREDc2eFs)-Qlr/
Bl[cnA0>DlBakD[2J+'S+<W6s+?M<)-Y,,I-Qlr/Bl[cnA0>DlBakDZ0H_J\+<W6s+?M<)-Y"hX
+CnqqEb/Zi+Cnqq%16T"2'="a+>#Vs4#)(0@kfhg+CnqqEb/Zi+Cnqq%13OOAn4%c+=D:e0m,2u
+CnqqEb/Zi+Cnqq%17550m,2n/NP"90mdMC%17550m,3gATp9u+=M,JAh5\l.3q,qEb6OO%16]X
1-IZ@-np![A18WP3ZpP-1,3o+DIn#$$8=SSA259<@VL%,Blmo/A7B6^$>*g(+>#Vs-Zq1!FYP6d
A7B7nART*lA7B6^$4R>P0H_r.+?M<)-Y"hX+CnqqEb/Zi+Cnqq%13OOAn4%c+=CkZ11hmVA7B7n
ART*lA7B6^$>D:OAo;1(4ZX]6DK9>RDK9><+=eQs/g)oU1GB7FAn3Y[3Zoh)HY-e;+=oPr4D?T,
Ao;1(%14dOAn3Y>A7B7sEbTW,+Cnqq%16]X1*A/0+=CkZ11hmVA7B7nART*lA7B6^$4R>P0H_r.
+?M<)-Y"hX+CnqqEb/Zi+CnqqA7B7_BOt[hA79Rg0JH6g/h1C@Bk(gf@r#U`FC?jW+ET1e+C\c#
Bk&9-ATMs7+E(j7-tHe$@q]F`CLgjq@4<f<$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JP>"@<++Y%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO%15is/g,4F@;[3/Df'&.A8-'q@ruX0
Bk;?.De:,'G][A3F<EkG9H[hcART[lA0>DlBcq#%Ch7Ys$;No?+Eh=:@WNZ5BQ&$0A0>r9@q0(]
A0>K&EZee,C`m>(Ch7Z?%13OO0K^RjAnc'mF$2Q,0d("@EZc_s3a>!=6!Rl/@:Wqm>XLe^.P>7@
BdX>s-n&V8Bl[cnA3b3LDg-//F)rcQ-n$f25]^UWGApu3F"'@b@VK=cARfLd@<>p,+CnqqD.Rft
A79Rg.3Ks$+Co(uCh7Ys$4R=r4<nBKBl%@%4ZX]?+Co2,+=BN;>XCeD>[h2OA7]ph<*3BT/nAF*
-OgD2-tHe$Eb/Zi5]^UWGApu3F"&4[-o!bJF(fK9E+*g/.6qEQBk(gf@r#U`FC?U@A7B7iATV?k
@<>p,+=98pA7fOlATJ:f%14dO,@kD#Ch7ZN3Zp."A8-',-UTq"6:4%D@UihWATh<[6!PllA7B7#
%14L3A7B7nART+7F(fK9E+*g/.3L#e0fhR@BQ&*6@<6K=5\+><@q]F`CLgjq@4<=0@VK[jFCA]g
FC?U@-9`P_Anc'mEt&Hc$;No?+Du+A+ECn.A8c=$Gp%';Ec#r@AKYT!ASbm"@rH1+D/LJ7Eb&a%
+E(j7A79Rg+>"^ZATD7$+EqO9C^g_H67sC%FD5Q-+EM[8@qB4^+C]J8+EV:.+Co2-E,8s.ARloq
Bk;*k+E1n4D09r/FD5Z2+E(j7-tHe$@q]F`CLgjq@4;Wm:-pQUGA1l0+Eh16Gmt)i$=e$dEc!s#
+C-+:+u+Nh><3lkINViU+F?-l,Tn4)67sC$@;]UoD'3>,CisT4+E1n4D09r/FD5Z2+Eh=:@LWYR
$8=ReA7fOlATL!q+>G!LBlY=D6TSI=6U=sd@prnZG$IU6>Uh@:@VI2!$7I;N@rQ""D*VW@Bl[cn
A19cbBQ&*6@<6K=+=JWm3^@b"Dg-//F)rcqA7B7_BOt[hA79Rg.3N/1Bl.F'@:Weg@4<<G4s4BJ
Bl%@%%13OO%15is/g,%MG9Cp7DId[&Cj@.EASbpfF<G!7F*1r5ATT&5AftT%CisT4F!)SW+CT@7
Ch7$rF<GL>AKYK$CisT4+DGm>F(K0!@ru9m%17,cF(K/N3Zp4$3Zodu4CL94-o!n<5C5F:Gptt)
3[Au"+F>5V-OgCl$8=ReA7fOlATL!q+>G!LBlY=D6TSI=6U=sd@prnZG$IL1>Uh@:@VI2!$7I;N
Eas0%Cd;N?Bl[cnA19cbBQ&*6@<6K=+=JWm3^@b"Dg-//F)rcqA7B7_BOt[hA79Rg.3N/1Bl.F'
@:Weg@4<<G4s4BJBl%@%%13OO%13OOA7B7h@<-!lFCfN8F"f:C67s`u@VKXeEbAro@VIMM+ET1e
+D58'ATD4$AM8(8@:V$8EbTW,+DbJ,B4W2r@VHrsBl%@%/e&._67r]S:-pQU@rc-hFCeuD+>PW*
12UHF0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT;@UX=h-OgDmCh7$q+=ANG$>aWhA0<71@VHrq@VKpq
F*(u6-OgCl$><sh4ZX]I+A#%(8PUCT+=AgUDf'&=C2[d'06CcBE%`R]4!5n\3\PSdD/_-U%16cZ
4ZX]I+A#%(8PUCT+=AgUDf'&=C2[d'0..l(+=CY[0..29%14g4>9INhEaa$#+Cnqq@VKI<3bW&C
/14n@B6A$4@r*c.@VI2!$8EZ-+D,2*@<6!&A7B7^BkM'iE]lH+BOl'5-Xpe&B4Z++Cij0'/nAF*
-OgE*Cij0'4ZX^!A1T*;@pq$"@prnZFt[r^06M)Q@r*c.@VI2!$4R>;67sC$ART*lFEqh>@ps0r
F`_G0CbB7-BcngBDIjr/Afu2/AKYetEbAs(+@/gt+Cnqq+D,>(ATK:0$;No?+CT.u+C]/*G9CUA
+E_WG@X0))+D,%lFDl1BDe:+H2%9m%$8=RjA7B7pASlC&@<?''F_l/0CagK;@VK=mART[l+Cnqq
@VKHa$8=RjA7B7pASlC&@<?''F_l/0CagK;@VK=mART[l+Cnqq@VKIfATA4e%16WSF?MZ-A7B7n
ART*lF_l/0C^g^\$=knT3Zoh*+F>5A@<<q@/1)u5+>G!c+Cno&%16W$4ZX]r1*A+p/j:Cg1(=S$
1-IZ@A258Y-8%J)A24T$A26;/+Cm5M/1)u5+Cm5:$=mRe4ZX]60Hb]bA79R/+=oPrA24T$%14d3
4<S]YDg-//F)rI7@<<W&@VL%,Blmo/A7B7^BkJP`67sBhEc6)<A0<Z^D.4W"Bl%>i$4R>Q1-IZ@
A258Y-8%J)A24T$A26;/+Cm5M/1)u5+Cm5:$=mRe4ZX]60Hb]bA79R/+=oPrA24T$%14d34<S]Y
Dg-//F)rI7@<<W&@VL%,Blmo/A7B7^BkM'iEZe+D/g+SCDfor.+>GQ(D.4W"Bl%>          ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^73+>P'"+>Ybq0f:(01E\D/+>Pr"0f:(02.C]BCh-m`@VK[fCLnVuDf'H6ATMp(A0?&,EcYr5
DBNk0+=Lc0BdmS%BjtLlBk)6rF*)IW0OeI3Bk&8r@VHrpEb/[$AM87JBlmo>Eb/Zi+EV19FE:u%
Bk(gf@r#U`FC?jW@UX=l@j#l)F*)IGDe:+?A7B7_BOt[hA79Rg.:cn%Cgh?sATVL)FE9,iB4Ysl
Eaa'$061W4A1r.IBlmo/Cgh?sAKYMmBcq#%Ch7Y                                   ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n,+>Y-"+>P&q3A_j52'=Xs1bgg@:et"h?Y!V[1,2Nj/l5>B<*s0FBcqA5F*&ODEc5H!F)u8?
/e&-s$?L'&F`_SFF<F.E5sn((3Zoh)+?CW!.1HVZ67sB/A7B7%+DG_8ATDBk@q?d,DfTA:F"'-Z
$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sBk@VK=mART[l+<VdL:-pQU@rc-hFCcS*
@VHrsBl%>i$;No?+CnqqD.RftA79Rg+<XEG/g+_MFE1f"FE8R8@VHrsBl%?'D.RftA79Rg%15is
/g+\6Bl[cnA0<!;+<Ve%67sC$ART*lA7B6qAnc'm%15is/g+\6Blmp'E,8s)AKW*j67sB/GUXbD
EbBN3ASuT4AoD]4-tHe$@rc-hFCcmDAo_g,+Cnqq+D,>(AISuA67sBk@VL%,Blmo/+<VdL:-pQU
GB.D>AKYT!ASbm"A79Rg+EVNEA7B6qAnc'm%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0
F<D\RA7B7#A7B7[A7]glEbSuo?Ys=/2t+An$<;.]DJ()"A7B7*Bkh]s$9^O84Ztqk4Ztqk4Ztqk
$49^CAKY2C:eW!1De=*8@<,p%6#pIK@:a@nDeF><?nPu!Bj`&PA8-."Df/i/BQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP@:0etC;2D8KXCb9^HAor6*Eb-h2EarckAT)C'
B6c(>@VIE*A8-."Df.3W$>+3s+Dl%;AKY])AoD^,@<?4%DCu8'<HDklB-;;0AKXSf?t<_\/no'A
?m'N#EbTK7+DGm>F(oK1Ch54A<+ohcBl7EsF_#&o+D,>(AKV=a?t!kfDKBDBA7B7\>psB.FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u604\O+04A[5DKBDBA7B7%+DGm(
@;[3!G[YH.Ch4_s/nAF*?m'&qCh4`2BOQ!*BQ%]tF!+n-C`mh5AKWI7Bk;*k+EVmJATK=DF*2G@
DfTr2A0>?,$=ICRBeF+7F'pUC;e^)fCh4`$Bk;*kF!+n3AKZ&.D/!fpEZfIB+B)-2+Cno&@:EYd
AKYK$CisT4F!+n/A0>o(F*2;@+:;h#+EM77B5D-%@rH1+D/LJ<@:F%aF!,[?ASrW&ATVEqARmD9
;IsfY@<?'k+D,>!Ch.T0@<,p%@:OD%@;Kb*+EV%$Ch7Yp@;]TuEb0<7Cige6DBO%0@VfUs+EqL1
DBNP&FCSuqA1eujCht5+Bk;*kF!+n3AKZ&9DfTE"+CT=6@rH7,BkMR,F`S[7H$!U)Ecl8@+DG^9
FD,5.?nPu!Bj`&qBl%?'D..3oDJ()#@q0(kF!+n4+D,&'F<G"5+DGpFF!,%;ATAo+DeX*%+EVNE
B4Z0;+<V!u<+ohc?nPu!Bj`&qDfT]'F<GdGEbf_=G%G]>+EqC5C`m>.EZf7BD.Ra%@j!16DKKH&
ATAo%DIal%Ci<a(Bl7Q+E,TH.F=@Q?ARfh#EcW@3DIal3@:F%aF"SS7BOr;qH$!U?Eb031ATMF#
FCB9*Df-\9AftJ6A7B7\+DkP/@q]Fp$?Trm+DtV0Bm+&1AoD^,@<<W1Afu2/AKYZ)F*&O5DIal"
@;[2sAKYPmF(oH9+ED%%A0>;uA0?):BlnH.D@0iu+E)@8ATAo4Ec5T2@;U'<+B)ukE,9).5uU-B
8K_MV@<,ddFCfJ8A79Rg+DGm>F*2G@DfTr2A0>?(F:*,'AKYA5A7B7\+D,P4D..N/BlbD7Dfd+D
AU&;>DfTQ'DKKH#/d_qbD]j(CDBNJ.GA_58@:UL&BOr;j7qm'9F^cJ$A7B7\+Co2,ARfh#Ed:q=
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.NEb/f8D..L-ATBG7@VI7uFDi:1+Dbt+
@;I&sBl[cpFDl2F/g*_.E,8rmARlp*BOr;uBl%@%+DG^9?t25NFCf<.?nMcn9Q+?M+CJ_hBeF+7
F'q$9$6UH6+<VdL+<VdLCi<`m+=CY[06CcBE%ba2BeF+7F!h;$#ms^IATo8=BOr;uBl%?'FCf<.
CghEs3XQ3:+<VdL+<VdL+<Y3(Blmp'E,8s)AKW@13\PSdD/_.:Ci"!1AhIV'BdX61+<VdL+<Vfd
P`4UdJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXXQ#IpifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifpP(P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXXQ#IpifnuQ
P^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXXQ#IpifnuQ
PcWl/JDufDifnuQP`Q4p+<VdL+<VfdP_)1p9MSMUifo%;0kTF0Jorh'FYVm?Jorn^ifo%;0fO53
ifo%;3+h07Jork.FZABFJnZqtB&]&,Be_M[0fJ$UJn["rB&]&,BehAV1G[sSJn?ntB&]&,AiVe^
2DjEXJn-cOifo%)0]J=K@kfk#P_'5b+<VdL+<VfdPap`tJDufDifnuQP^qbXJDufDifq+8P^qbX
JDufDifq+8P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX]],0+ifnuQP^qbXJDufDifq+8P^qbX
JDufDifq+8P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDug+ifnuQP^qbX
JDufDifnuQP^qbX]],0+ifnuQP^qbX]],0+ifnuQPe?"?JDufDifnuQPb\X/+<VdL+<VfdP_(VK
0f'ppifo$p0d,J?Jhf&\0d,J?JlOWMifo$L2cV[Wifo$p3$@4FJho>c3$@4FJk7[T+QAW;0fDTX
2B_"DJk7aR+QAW;1,)9U1*GS@JjqXT+QAW;3B'Dc1a(eBJj_L>ifo$^0]J=K6SUIXP_'5b+<VdL
+<VfdPa(0lJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifph0P^qbXJDufDifnuQP^qbX[,R=#
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifph0P^qbXJDufDifph0P^qbXJDufDifnuQP^qbX[,R=#
ifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDug#ifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX[,R=#
ifnuQPdKG7JDufDifnuQPaDaa$<1\QF!,(/Ch4`&@<3PG2_d*2.WT*1DfTB0/h.uAART*l@;Ka&
FD,5.AnbgmA90d=$6UH6+<VdL+<VdLA3DOfA7B7nART*l-Y#1jFCf<.04A[5DKBDBA7B7#$49aG
AKZ#)F*2;@+DGm>@3BZ9D]j(=G9C@5G\(D.FCAWpAM,*)BOr;uBl\9:+EDCE+Cf>-FCAm$F!,(/
ASbm"DIIBnF!+n/A.!ElAKZ&*@rH6q+EDCE+D>\0A9/l8BOr;uBk;*k+Cno&@4hlo+<VdL+<VdL
+<VeCBleA=0Hb]bA-sG%+<VdL+<WsD9MSMU?Ze)8+<VdL5tjsI;at,:1,3o++<WsD9MSMU?Ze2;
+<VdL5tjsI;at,:0fO53+<WsD9MSMU?Ze>?+<VdL$6UH6+<VdL+@/[p:/aVhFYbt!3$9>09MA2[
7UKja2J+'S+@/[p:/aVhBe_M[0fC.?9MA2[7UKjc11hXO+@/[p:/aVhBehAV1GU'[+<VdL+<VdL
5tjsI;at,+2Df"g+<WsD9MSMU?Y2;WAi;Ig5tjsI;at,)2J+'S+<WsD9MSMU?Xkc4+<VdL5tjsI
;at,(0f9:F+<VdL+<VdL+<VeCBleA=A79RgFEqh:-8%J)0d(fcA0<!i67sBmBk;*kF!,.)G%De>
@<-(#F`SZt+Cno&@<?d6ATJ2$+<VdL+<Ve9Df9H'@;[21@W-1$ARTI!+DG_8AS5Rp+<YB9FCf)r
EZcK=DKKH&ATAn9Bl8$(B4Z*++DG_8AS5Rp+<YB9FCf)rEZcJ3+<VdL+<VdLBl8$(B4Z*++DG_8
AS5Rp+<Y94Ddda%DJ()(Ci<a(Bl7Q+Bl8$(B4Z*++Dbb6ATD3q+<YK7FCfK$C^LM@DIdI%ARfg)
@<6L(B5VQtDKI"8F!+m6BOPdhGp%<>Gp%3I+D#e>Ea`I"+CT)&+EV:.+D,>!Ch.T0@<3Q/Dfor=
3XQ3:+<VdL+<VdL+=JpjA19Z&+>J4R+:956+:956+<VdL+<VdLDIIBnF!i=B+<VdL+<Vdm9MA2[
7UKXZ+<VdL+@/[p:/aVh@kfh`+<Vdm9MA2[7UK[aAfr3=+@/[p:/aVhAi;JX+<Vdm9MA2[7UKaf
2eFs)+:956+<VdL+@/[p:/aVhBe_MX+<Vdm9MA2[7UKja2JFm(+@/[p:/aVhBehAV1GU(=9MA2[
7UKjc11hXO+@/[p:/aVhFYPgt1a!nJ+<VdL+<Vdm9MA2[7UL9mAfr3=+@/[p:/aVhFYY[o0d%T)
9MA2[7UL9o2g%)&+@/[p:/aVhFYm\Q+<Vdm9MA2[7UL9tAfr3'+<VdL+<Ve;#p:?5$49.@ART[p
DJ()#DIal6EbTW0DJ()#+Dtb7+CHg4@VK3mBlbD<FE1f(B4uB0AoD^6@<,m2+:8Gu+<VdL+<VdL
+ETb!+CnqqFCf<.CghEs+=CY[06CcBE%bX9Ci4<+/nAF*-OL.d+<V"iFCB33+EV:.+Dtb7+D,>(
AKZ22FD)dN+ED%'DfTB0/g+,,AKZ&>F*(u1+E2@4@;Kau@psIjF!,(/Ch4`1E+*6f$>F)pFD,5.
Eb/a!Eb$;&Dfor>+DGm>DJsV>H=_,8/d_pl#p:@4@j!oe+=K>r3\W!*-p04G0I_DmF:&<\+<V!t
#p:?c67sBuDf0l4Ec3(@ATN!1F<G:8A8,O^FCfM9F*1u&ATMo"+<VdL+<VdL+<Yc9+Cnqq@rc-h
FCcRB@lc8bASlB>@;KaiDfBtSA7B7#$6UH6+<VdL1,(OE$4."]+:8D]+<XEG/g,@YBlmo/@;Ka&
AnbgmA9/kF+ED%7F_l.BBlbD+H$!U?@rHL-F:'-5+<VdL+<VdLA0>DlBm4T3FCcRB@lc8bASlB>
@;KaiDfBtSA7B7#$6UH6+<VdL0fM'I1,Lco#p:?5$;tGDA0>u-AKYK$E-WR8@:O'q@;]Tu@rH4'
@<,p%A79Rg3XQ3:+<VdL+<VdL+Cnt)4YC8SBl[cnA0<703\PSdD/_.:Ci!U"E-X'H@VI1s#mh^s
-o$'Z.3L3'+>J4R@gX>$+<VdL+>F31<+ohc?nPu!Bj`')H#n(=D'3=sDBNt2@:UKhDIal6EbTW,
+EM77B5D-%AnbgmA9/l%DIal2F`;;<Ecc@FA79RkFD5T'+Cno&@4iZ0;e9M_@rGmh+Cf>,D.RU,
F!,(5EZf4;Eb-A(ATV?pCi_39$;,5MDBM8SCLqMnDfTQ)Bl7?q3Zph%@qBLdATAnK2Cot+0JP?j
Eb0E.F(JlC+AZKhDdm9u+?1np1,(I;$3                                          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1".+>P'!+>P_q0f:(/2,I(I<*s0FBi%T(<*s0FBcqA5F*&ODEc5H!F)u8?A7B7[A7]glEbSuo
?Ys=j@<--oDg-(ABQ&);FDi:EF(HIBA7B7%                                       ~>
)
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
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&q+>l#4+?:Q"0JI$HBhguI.V*"&+EK+d+CfG'@<?'6Eb/Zi06_GNFCcR\:eW!GDK]T3
FCeu*A7B6qAnc'mF"SRE$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/e&._67sBk@VK=m
ART[l+<VdL:-pQU@rc-hFCcS*@VHrsBl%>i$;No?+CnqqD.RftA79Rg+<XEG/g+_MFE1f"FE8R8
@VHrsBl%?'D.RftA79Rg%15is/g+\6Bl[cnA0<!;+<Ve%67sC$ART*lA7B6qAnc'm%15is/g+\6
Blmp'E,8s)AKW*j67sB/GUXbDEbBN3ASuT4AoD]4-tHe$@rc-hFCcmDAo_g,+Cnqq+D,>(AISuA
67sBk@VL%,Blmo/+<VdL:-pQUGB.D>AKYT!ASbm"A79Rg+EVNEA7B6qAnc'm%15is/g)8G$;No?
+CfG'@<?'k3Zp130f!TSE\]Q_$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB812gZE0KC7(C2[X!Blmp,@<?'0+D5_5F`8I6De!p,
ASuTuFD5Z2+CSekARl5W:-pQU0f3WfCbR[g-t7IDAR]@qF"&5PAStpnARlo3@X3',@VKq*1FXGj
Bln#2Eb0<7Cige;DffP"$4R>PDe!TlF)rHOA7B7#%16WTBlmp-FCfJf67s`u@VKpqF*(u6+ET1e
+Dbt)A0<:2@VI86FCfN8+E_d?Ch\!*ATKI5$;No?%15is/g+YEART[lA3(hg0JP=kE,mWm%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%13OO:-pQUD.Ra#AKZ)+F*&OKDfTB0+DG_8D]gH=@VI86Ci<flCh4%_@rGjn@<6K4-Y-\#
-OgC                                                                      ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P&q+>bbp3?U(7A7B7_Eb/[$AM8(8@:V$8EbTW,+@/gt+DG_:ATDm(A0>DlBcq#%Ch7Zu
@VKpqF*(u6Ci<`m+=Lc0Bdk0HATMr9F`_>6Bln'#Er                                ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&q+>bo/3+QK4?t<_\?m'0)+CQBb+EM%5BlJ/:FD,*)+ED%%A9/l%DIal6EbTW,F!,17
G%G]9ARlok/nAF*?m'&qCh7Z?%13OO?t<_\?m'0)+Co&)@rc9mARlotDBO%7AKYGuDeC23Df^"C
><u(Z+B*2jFE_/6AKX9Z@q]:^Des?)Gp$KIA7B7\+@TgTFD5Z2>psB.FDu:^0/$aO@;L48ATVTs
A79RgDJsW=BOt^pBm+'(/oPcC0/>491G:I<0/>F=@;p$7F)PZ4G@>N'/R`[0BOPIjCi<s3/S&=)
/S/I,FD5Z20.AL_$4R>IF)>?%C^g^\$7[0&BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-
AS`u;Eb@$\0JP@:0etC;2D8KXCb9^HAor6*Eb-h2EarckAT)C'B6c(>@VIE*A8-."Df.46-tm^E
E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F=0/5481,^doE,7+IDe=*8@<,p2
@<,jk@:a@nDeF>IA7B7)ARoLsBl@lB.1HUn$=%IeEc#6$F(or3%13OO?t<_\?m'N/F`Lu'+DGm>
@<Q'nCggdhAKYYtEb.9@$4R>IF)>?%C^g^\$7[0&BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05=p*CND.<Ci<c9D..L-ATBG7@VIK+@VIH/C3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05=p*CND.<Ci<c9D..L-ATBG7@VIK+@VIH/C3(g5$4R>IDJsQ4@;L"!H=[Nm%16?]F^fE'@ruF'
DL5W1AU&<=FF.P-Bmh*qDKKH1Amo1\I16Mm$@[GQINWt[/nuMW%15is/g+\6Bk)0p@<?''+<Ve%
67sBjEb/[$AKYMmBcq#%Ch4%_:-pQUA7B7iATV?k@<>p#+AP6U+D#e>Ea`I"F!,"&Bcq#%Ch4`+
ATV?k@<>oe$;No?+CnqqEb/Zi+<VdL+<XEG/g,1G@:UKk@VHrsBl%>i$;No?+CnqqFCf<.CghEs
+<XEG/g)Qe.3N&>B6A'&DKI"5DfQsKA7B7_Eb/[$ALSa6Ec5e;A7B6qAnc'm%15is/g+\6Bm4T3
FCcR;+<Ve%67sC)EbTW,+D,>!Ch+Z!@<>p#FDi:4@VHrsBl%>i$@[GQILQVn$=%Xp@WQ*jFD5Z2
HW#!(DJ=!$+C'#"G]\%LHXpT"I=2P3%16*VBl7Q+FD,5.8g%MP@VIH/C3*c*F(96)E-*4:F!,O<
D/a<&/g+,,AKY])@r-9uARloqBl%?'%16<I@;KatF(R%8@VK4U-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGA7B7+@;KatF(R%8@VI86Bla^j@;[3!G[YH.Ch4_s
/nAF*?m'&qCh4`2BOQ!*BQ%]tF!+n-C`mh5AKWI7Bk;*k+EVmJATK=DF*2G@DfTr2A0>?,%16KR
@VIH/C3*c8+B)ukE,9).AnbgmA9/l%Eb-A7Bl.R#@<*K4D]htU9H[kSFCAWeF(HJ(DesQ5DK?q/
DIal1ATN!1F:ARkDBO"7DJ*cs+Cf>+F_u"=FCAWpATJu<BOu'(An?'oBOt^,+AuciART[lA0>Ju
ASbmu+CT;%+CSc%F^]*&Gp%3;@VfUs%16N]A0>o(F*2;@+DG^9FCAWpATJu<BOu'(An?'oBOt^,
+@0g[+D,>!Ch.T0@<,p%F*)>@ARlolF!+t2DKKT*F`2DD+C]V<AISueF`)7CBl5&8BOr;o/nAF*
?m'&qCh4`+@;BRpB-:Vm@qB_&+CT=6Amob&+CT=6Blk_D+D#_-EZf"5Bl7Q+FDi:7ATTOI+:SYe
$<1\M+CHg4@VK3mAoD^,@<<W9DfTW7+Eh=:Gp%<BCht5+DfQt<F_t]1Bk&86Bl8$(B4Z*+@;]Tu
Ao)BoFD5W*+E275DKI<:$?fujFDl2@+CT.u+EV%$Ch7Z?+B3#c+CHg4@VK3m@X3',+ED%4Eb0<'
DKK</Bl@l3D..NrBOu5o$>s9oBm+&1BQ%s6+D,P4D..O-+CT.u+Ceht+C\n)ARTXoCj@.DART*l
@;]TuGB.D>FCf>!$=\9'DffZ(EZf=ADeF*!D0%<P;e^)fCh4_T;aX,J+Cf(nEa`I"ATAo(@<>p#
BlbD*CiaM;F*2G@DfTr2A0>?(F:AS!BOr;o/nAF*?m''"Ec#6,+DGm>DJsV>FCf]=+E):7ASuU$
A1e;u%16'Q+EDUB+CoD7DJX6"A0>u-AKY2IBllmg@N]&h@VK3mA8-'q@ruX0H!Mh3FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_WUAS!N3@<6O%E\Cs4BdjJuFDi:1+Dbt+@;I&sBl[cp
FDl2F/g*_.E,8rmARlp*BOr;uBl%@%+DG^9?t25NFCf<.?nMlq%15dI@:UKgA7B7*Bkh]s3XlE*
$@[GQHS0&]%144#+Dbt)A0<703\PSdD/_.=@VIH/C3(a3$@[GQ%13OO<bZ,h+EV:.+D,>(AKZ)+
D/a<"FCdKB$4R>kIXZVrC4-Nu+<Ve;@VKpqD/a<"FCcRB@lc8bASlB>@;KatF(R%8@VI2!$7d\[
/M/P+.kN>).kN>)/M/J)/M/J)/M/P+.kN>).kN>)/M/J)/M/P)/M/P+/M/J)/M/P)/M/P+/M/J)
/M/P)/M/P+/M/J)/M/J)/LrD)/Lq8;HpLG":/aW0FYRKUFYY[o0mn+#Ape_U2g$s)FZ<u\FYbt!
3.,Ep2J.>N0fE`#2LK3p11koJ1,*Du143[l1hM,I3B(P.1jiglApe)BHt+lgHjpE5/M/P+/M/J)
/M/J)/M/P+.kN>).kN>)/M/J)/M/J)/M/P+.kN>)/LrD)/M/P+.kN>)/LrD)/M/P+.kN>)/LrD)
/M/P+.kN>).kN>'/M/P)%17J;2_d*2+FI0D+FGq!<A>VD<AYhG0fN)h+FI0K+FGt(<B)+K8MN+G
HndNN0fC/%8M`+EHnmBI1GU)#7Q*(GHoX,T2DcP(6oH086SNmT0f==f$7d\[/M/P+.kN>).kN>)
/M/J)/M/J)/M/P+.kN>).kN>)/M/J)/M/P)/M/P+/M/J)/M/P)/M/P+/M/J)/M/P)/M/P+/M/J)
/M/J)/LrD)/Lq8;IXZ_T$4R>ABPDN1Anc'm+D>2)+>Gf01E\/fARfY!A90@Q+AucZA0>;sC`mh5
AKYT!ASbmu3XlE*$@[GQHS0&]%144#+CmVf+CnqqEb/Zi+=CY[06CcBE%bX9Ci4<+/nAF*-OgE3
IXV_5%16'JAKZ#)F*2;@+DGm>@3BZ9D]j(=G9C@5G\(D.FCAWpAM,*)BOr;uBl\9:+EDCE+Cf>-
FCAm$F!,(/ASbm"DIIBnF!+n/A.8lfBOr<-ARfXrA0>o2G9CR;Ch.T0FD,5.AnbgmA0>DkFC?d2
$4R>kIXZVrC4-Nu+<Vdd0Hb1GF*&NY+F>5A+<XEG/g+\6Bcq#%ASbm"DIIBnEt&IB9MA2[7UL9m
Afr3=+@/[p:/aVhFYY[o0d%T)9MA2[7UL9pAfr3=+@/[p:/aVhFYPgt1a!o,9MA2[7UL9tAfr3=
+:SZD9MA2[7UL9o2g%)&+@/[p:/aVhBe_MX+<Vdm9MA2[7UKja2JFm(+@/[p:/aVhBeqMV+<Vdm
9MA2[7UKjb0PN<u+:SZD9MA2[7UKac1hIjQ+@/[p:/aVhAiVe^2DcOB9MA2[7UK[aAfr3=+@/[p
:/aVh@k]#J+<Vdm9MA2[7UKX[2'="a+:SYe$6UH63%uIkBleA=A79RgFEqh:-8%J)0d(fcA0<!i
67sBmBk;*kF!,.)G%De>@<-(#F`SZt+Cno&@<?d6ATJ:f@W-1$ARTI!+C]8-Ch7$m+<YB9FCf)r
EZcK=DKKH&ATAn9Bl8$(B4Z*++DG_8AS5Rp+<YB9FCf)rEZcK=DKKH&ATAn9%16feFCf)rEZcK=
DKKH&ATAn9Ao)BoFD5W*+D,G.@<?4$B-:o+FCf)rEZcK@Blmp,@;I&/Ch\!&Ea`c,%17Q5ILQVn
$;#,GBl[cpF<G"5F(o9)D.RU,+DGm>@3B5lDIe#8G@>b>FDi:5G][t7@rri%Cht59BOr;uBk;*k
F!+n4+Du+?DK@iJ$4R>kIXZVrC4-Nu+<VdT0RI=Z4ZX]?HXn6A:-pQU@<6L(B5Si8@;L'tF!,17
+>G!\D]iq+D.Rc2Bl5%I%13OO+<Vdd0Hb1GF*&NP5pmdmC`k)Q%15Bp9MSMU?Xkc4+<VdL5tjsI
;at,(0f:'r+<WsD9MSMU?Xu',+<VdL5tjsI;at,+2Df"g+<WsD9MSMU?Y2;WAi;Ig%15Bp9MSMU
?YM5QAfr3=5tjsI;at,.0fE`#2BY:Z9MSMU?YM8LBeqLe5tjsI;at,.1GWPb+<WsD9MSMU?Ze(^
FYk3`%15Bp9MSMU?Ze)8+<VdL5tjsI;at,:1,3o++<WsD9MSMU?Ze.`FZ:Kd5tjsI;at,:1hIjQ
+<WsD9MSMU?Ze>?+<Vd9$@[GQ+<Vd9$4R>0Eb/[$Bl7Q+@;]TuGB.D>Bl7Q+@3BH!G9C9GA7B7\
+DGm>F*)G2BkM+$+D,P4G@>N&/g(T1%17Q5IX<\^I16N++<Ybh/g+\6Blmp'E,8s)AKW@13\PSd
D/_.:Ci"!1AhIV'BdX>sIXZ_T$4."]+:SZVFCB33+EV:.+Dtb7+D,>(AKZ22FD)dN+ED%'DfTB0
/g+,,AKZ&>F*(u1+E2@4@;Kau@psIjF!,(/Ch4`1E+*6f%16f]+EV:.+ED%'DfTA2@rHL-F<G:=
+Du+>+F7U>D_;J+%17Q5IX<\^I16N++<Yc9+?_>"-p/\70I\+m4>AoO.=E=\%144#%144#+AP6U
+Du+8H=_,8+ED%7F_l.BBl7Hq@psIjF!,OH@q0(kEt&I!+<Yc9+Cnqq@rc-hFCcRB@lc8bASlB>
@;KaiDfBtSA7B7#%14jE1cPpO+<V+#+<Ve%67sC)EbTW,+CT)&+D,>!Ch.T0/Kf(FF*2;@+DGm>
@X3',+Cf>4DKH<p+<Ve;+CnqqGB.D>AKW@13\PSdD/_.:Ci!U"E-X'H@VI2!$8FJ!1,:[B%17Q5
ILQVn$;tGDA0>u-AKYK$E-WR8@:O'q@;]Tu@rH4'@<,p%A79Rg3XlE*$@[GQHS0&]%144#+Cnt)
4YC8SBl[cnA0<703\PSdD/_.:Ci!U"E-X'H@VI2!$6UH6-o$'Z.3L3'+>J4R@grc"%17Q5ILQVn
$<1\M+CHg4@VK3mF*VhKASiQ"@;[3.ART*l@;]TuGB.D>AKZ&.DJ*cs+D,>!Ch.T0@;]TuF*2G@
DfTr@+Cno&ATVX'AKYMlFC?dE%16$FAKYK$A7ZlnDf'?&DKKqBAoD]4D/XH++Co&*@;0P!/e&-s
$=%FZA92O#E"*-`$4R>7DeO#26=FY@E]X^;.W9?AB5)6lCcW\,ARf:g@V'R&1,^[+1,(F=.Q\(H
.WT*DBldir3Zq4.FDkW"EZd@n+>PW+0IdM=%13OO%13OO%13OO%13OO                   ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A7n1c.(!@<,s&/KdAoDIIR2+@/nG@<itbDfT]'FE7lu4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$4R>M@UX:h?m'-$Ch.T0G%#E*Dfp+D@VK^gEd8d9EcPT6+ED%%A7]e&+CT.u+Eqj?
FCfK6/g(T1%15jKFCAWpAKYW+Dfp#?04Sg,F)to6+CT;%3XlE*$8F.U?t<_\?m&l#Eb0E*EcYe7
ASu-pDImC"ARlp,ATMR(DBNk0+CT.15u:5t?t<_\?m'&qCh7Z1F*VhKASj%/$4R=t/g+P>E-Yh6
-ua!2DJj#r.3N\SE,]`9F<G16EZfC6@:X(iB-:W#A0?):Bln',B-:V*8g&%mBk;1(ARlp)F^fE'
F<GL6+AR&r:jEKW+<Ve9Bl7@"Gp$O9Eaa59Anc'mF"AGTAS!nF>AeS#E-X'PBjr],DfT]'FBp;.
FEDJC3\N.(F_u)C/oPcC04]!206;5D@VfU/Eb/ioEb0,uAM7\-DImisFCeu9DKTf8GqNoI@P282
Ec#6,/nf?DCa3e8A9D^"/T,]JE-X'PBjr],DfT]'F=@Y+                             ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkfD8O>^A79!Dd78k<s6:k*P770X49HZ_i8QJ8X;b9b[+A#$g6Ub'P;FFGo
@VHr_:JXqk:JsSZA7B6q@X3',@VKq*1E^3d+Cnqq?YEkhBOkOnAT`$0+Cnqq@q]F`CLgjq@3B)i
Bk)0p@<?''A7B7bBk;*kFEqh:F!,"&BkV'dA7]d(A7B7iATV?k@<>p#A7B7j@;TRcBOt[h+Cnqq
De<U&ATVu9A7B7l@<-F#BOtU_ATAo(@VKdiEcYf6H#R>9+CnqqEb/Zi+CnqqEb032DIXf"@VKpq
D/a<"FCcS*@VKpqF*);?AftVnBm4T3FCcS*@VL%,BlmouBk;*kF!,'Q1a$CNATMR3AKY\A2BZ]i
1*C:OART*lBldcrBk;*k+DGn-2BZ^TAi;IgBlduC2BZ^TBeqLeBleDO+DGn>1a$LRFZ:LXGB.D>
AKZ&5@rc."+ETP`FDYt>FE9?0Ecc@]+EVZ`7WNTl2B[,s+E]L`FZ:`t/1<VC4"akp+=A:@F_PZ&
?Y!V[+Cnqq@UX=l@ru:'FE9,i+Cnqq@q]F`CLgjq@5'AXA7B7h@<-!lFCfN8F"f9q.4cl04?G0&
0d%hdA7B6qA7B7pATMs)E[N:e-p01/0I\P$4?P\X?SNZN+Abj4<*s0FBcpqqBjYC^F(96)@V&n`
A1&fW-p0@01*eV/1,(F:0K:[B1H.9O1G_$H1a"_"1,(I;0ek@A/iGF?3&3?M0fCa/0d&5*1,(F:
0K:[B1H.9O1G_$H1a"V2+>PW+0JP::0eP@E2)$pG3&!$@+>Fuo0JY=:0JGI=2)@0N2D[-L1,L+0
2CU1*4>J$9,Vh&/1b^jD1G1IB0JbXG1H%0H+>PW+0JP783%d'K3&ilU3A`QL+>PW+0JP783%d'K
3ANEO0fCmH+>PW+0JP783%d'K3A<BL3ANEL+>PW+1b^jD1G1IB1H@0F2D[?R+>PW+0JP783%d'K
3&ilU3A`QL+>PW+0JP783%d'K3ANEO0fCmH+>PW+0JP783%d'K3A<BL3ANEL.4cl01*A=t1,(I;
0eb:@/i>UE0ebCC1,(X01,(I;0eb:@/i>XK1,:XB1cIB:1,(I;0eb:@/i>UE0ebCC1,(X01,(I;
0eb:@/i>XK1,:XB1cIBC/1<V7,VUYu-p07-1*eV/1,(F:0K:[B3&ifN1c-sC3$9t11,(F:0K:[A
0fUjG2`WcQ1E\G,1,(F:0eb4:1GUXD2`!HO1E\G,1,(F:0K:[A0fUjG2`WcQ1FXk'4>A99-p014
/1<V7.4cl00I\P80E                                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
