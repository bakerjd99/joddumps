NB. JOD dictionary dump: 27 Jun 2018 15:21:24
NB. Generated with JOD version; 0.9.996 - dev; 21; 27 Jun 2018 08:50:03
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|235160827908276492214978469319720955563|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


MIRRORDB=:'mirror.db'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


BackUpMirrorXrefDb=:3 : 0

NB.*BackUpMirrorXrefDb v-- backup  mirror  database and erase  if
NB. (x) is 1.
NB.
NB. monad:  iaRc =. BackUpMirrorXrefDb (clMirrorDir ; clBackupDir)
NB.
NB.   mrd=. 'c:/smugmirror/documents/xrefdb/'         NB. mirror ddirectory  
NB.   bak=. 'c:/smugmirror/documents/xrefdb/backup/'  NB. mirror backup directory
NB.   BackUpMirrorXrefDb mrd;bak
NB.
NB. dyad:  iaRc =. paClearDb BackUpMirrorXrefDb (clMirrorDir ; clBackupDir)

1 BackUpMirrorXrefDb y
:
'source target'=. tslash2&.> y
'tdate ttime'=. yyyymondd 0
bakfile=. target,tdate,'-00-',MIRRORDB

rc=. 0  NB. assume failure
try.

  if. -.fexist source,MIRRORDB do.
    1 [ smoutput MIRRORDB,' database missing - continue build' return.
  end.

  NB. read (MIRRORDB) bytes - this copy method
  NB. works well for files < 200MB and (MIRRORDB)
  NB. will remain well below that threshold.
  bindb=. read source,MIRRORDB
  if. 1e6 > #bindb do.
    rc [ smoutput MIRRORDB,' to small' return.
  end.

  NB. get today's backup files !(*)=. dir
  if. #files=. \:~ 1 dir target,tdate,'*.db' do.
    NB. increment day backup - allow 100 per day
    bcnt=. _1&". _2 {. '-'&beforelaststr ;0{files
    if. (bcnt < 0) +. 100 <: bcnt do. 
      rc [ smoutput 'backup count invalid' return.
    end.
    bcnt=. ,'r<0>2.0' (8!:2) >:bcnt
    bakfile=. target,tdate,'-',bcnt,'-',MIRRORDB
  end.
  
  smoutput 'backing up -> ',bakfile
  bindb write bakfile

  NB. clear source
  if. (x -: 1) *. fexist bakfile do. 
    if. 0 > ferase source,MIRRORDB do.
      rc [ smoutput 'unable to erase ',MIRRORDB return.
    end.
  end.

  rc=. 1  NB. success
catch.
  rc=. 0
end.
rc
)

BuildMirror=:3 : 0

NB.*BuildMirror v-- backup/create/load mirror.db
NB.
NB. monad:  BuildMirror uuIgnore

root=. 'c:/smugmirror/'

sdr=. root,'mirror'             NB. mirror directory
mrd=. root,'documents/xrefdb/'  NB. mirror database directory
trg=. mrd,MIRRORDB              NB. mirror db
bak=. mrd,'backup'              NB. mirror backup directory
src=. 'c:/thumbsdbs/primary2018.tpdb8s'  NB. thumbsplus db

if. BackUpMirrorXrefDb mrd;bak do.
  LoadMirrorXrefDb sdr;src;trg
else.
  'no ',MIRRORDB,' build - backup issue(s)!'
end. 
)

CreateMirrorXrefDb=:3 : 0

NB.*CreateMirrorXrefDb v--  creates sqlite mirror cross reference
NB. database.
NB.
NB. monad:  blclTableNames = CreateMirrorXrefDb clMirrorDb
NB.
NB.   CreateMirrorXrefDb 'c:/SmugMirror/Documents/XrefDb/mirror.db'

('database exists -> ',y) assert -.fexist y

NB. parse schema sql - assumes ordered create statements delimited by ';'
sql=. reb&.> <;._1 ';', (LF,' ') charsub CreateMirror_sql -. CR

NB. create new empty database
dt=. sqlcreate_psqlite_ y

NB. create tables
for_create. sql do.
  create=. ;create
  ('unable to create table ->',create) assert 0 = sqlcmd__dt create
end.

tabs=. sqltables__dt ''
tabs [ sqlclose__dt ''
)

DumpLocalImageNatural=:3 : 0

NB.*DumpLocalImageNatural v--  dump (LocalImage) as TAB delimited
NB. text.
NB.
NB. (LocalImage) is the only table  in (mirror.db) that  contains
NB. information  that  cannot  be  recreated  from  TAB delimited
NB. SmugMirror text files  and ThumbsPlus databases. (LocalImage)
NB. matches online images to local images. Many can be matched by
NB. file name  but many  require  tedious  human  inspection. The
NB. mapping is not one-to-one some online images, like panoramas,
NB. are  derived   from  many  local  images.  This  verb   dumps
NB. (LocalImage) in the  form or TAB delimited  natural keys that
NB. preserves the online local pairing in durable version control
NB. friendly form.
NB.
NB. monad:  DumpLocalImageNatural (clDumpFile ; clMirrorDb)

)

LoadAlbum=:3 : 0

NB.*LoadAlbum v-- load (Album) table.
NB.
NB. (Album) references (LocalPath) execute (LoadLocalPath) before
NB. this verb.
NB.
NB. monad:  iaRc =. LoadAlbum (clMirrorDir ; clMirrorDb)
NB.
NB.   sdr=. 'c:/smugmirror/mirror'  NB. smugmug mirror directory
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   LoadAlbum sdr;trg

'sdr trg'=. y

NB. j profile !(*)=. dirtree
NB. all mirror directory albums contain an (ainfo-*.txt) file
ai=. 0 {"1 dirtree (tslash2 sdr),'ainfo-*.txt'

NB. standarize path format
pf=. tolower@('/'&beforelaststr)@('/'&afterstr)&.> ai

NB. fetch local path table
dt=.sqlopen_psqlite_ trg
dat=. sqldict__dt 'LocalPath'

NB. match ainfo paths with local path table
(0 {"1 dat)=. 1 {"1 dat

NB. table columns !(*)=. LocalPath LocalPathID
LocalPath=. tolower&.> LocalPath
'LocalPath(s) not found' assert (#LocalPath) > >./px=. LocalPath i. pf
LocalPathID=. px { LocalPathID

NB. read all TAB delimited ainfo files
hd=. 0{readtd2 0{ai
dat=. ,@}.@readtd2&> ai
'path id directory ainfo file mismatch' assert (#dat) = #LocalPathID

NB. check columns - Name, Description -->> AlbumName, AlbumDescription
cx=. hd i. ;:'AlbumKey LastUpdated Name Description'
'missing (AlbumKey, Name, LastUpdated, Description) column(s)' assert (#hd) > >./cx

NB. match path ids to albums
dat=. <"1 |: 1 0 1 1 1 (#^:_1)"1 cx {"1 dat
dat=. (<LocalPathID) (1)} dat

NB. insert in Album table
cln=. ;:'AlbumKey LocalPathID LastUpdated AlbumName AlbumDescription'
rc=. sqlinsert__dt 'Album';cln;<dat
rc [ sqlclose__dt ''
)

LoadImageKeywordXr=:3 : 0

NB.*LoadImageKeywordXr v-- load (ImageKeywordXr) table.
NB.
NB. monad:  iaRc =. LoadImageKeywordXr (clDb ; <blclDat)
NB.
NB.   sdr=. 'c:/smugmirror/mirror'                      NB. mirror directory
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   'img iax'=. MirrorImageXrTables sdr
NB.   LoadOnlineKeyword trg;<img


'trg dat'=. y
dat=. }.dat [ head=. 0{dat

'image keys'=. <"1 |: (head i. ;:'ImageKey Keywords') {"1 dat
keys=. <;._1&.> (';' ,&.> keys) -.&.> ' '
image=. (#&> keys) # image

NB. insert image keyword xref
dt=. sqlopen_psqlite_ trg
rc=. sqlinsert__dt 'ImageKeywordXr';(;:'ImageKey Keyword');<image;<;keys
rc [ sqlclose__dt ''
)

LoadLocalPath=:3 : 0

NB.*LoadLocalPath v-- load (LocalPath) table.
NB.
NB. (LoadLocalPath)  uses values  from a ThumbsPlus SQLite (Path)
NB. table. ThumbsPlus builds a complete table of unique paths and
NB. and  path  primary  keys.  All  the  paths  (mirror.db)  will
NB. reference will be in this table.
NB.
NB. monad:  iaRc =. LoadLocalPath (clThumbsDb ; clMirrorDb)
NB.
NB.   src=. 'c:/thumbsdbs/working2018.tpdb8s'           NB. thumbsplus
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   LoadLocalPath src;trg

'src trg'=. y

NB. fetch thumbsplus data
ds=. sqlopen_psqlite_ src
dat=. sqlreads__ds 'select idPath, name from Path'
rc=. sqlclose__ds ''

NB. convert path delimiters
paths=. allwhitetrim&.> <"1 '\/' charsub ;1{1{dat
ids=. , ;0{1{dat

NB. insert in LocalPath
dt=. sqlopen_psqlite_ trg
rc=. sqlinsert__dt 'LocalPath';(;:'LocalPathID LocalPath');<ids;<paths
rc [ sqlclose__dt ''
)

LoadMirrorXrefDb=:3 : 0

NB.*LoadMirrorXrefDb  v--  loads   new  mirror   cross  reference
NB. database.
NB.
NB. monad:  btNameCnts = LoadMirrorXrefDb (clMirrorDr ; clThumbsDb ; clMirrorDb)
NB.
NB.   sdr=. 'c:/smugmirror/mirror'                      NB. mirror directory
NB.   src=. 'c:/thumbsdbs/working2018.tpdb8s'           NB. thumbsplus db
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. mirror db
NB.   LoadMirrorXrefDb sdr;src;trg

'sdr src trg'=. y

smoutput 'Creating mirror.db ...'
tabs=. CreateMirrorXrefDb trg

smoutput 'Loading path and albums ...'
LoadLocalPath src;trg
LoadAlbum sdr;trg

smoutput'Loading keywords ...'
'img iax'=. MirrorImageXrTables sdr
kw=. }. ((0{img) i. <'Keywords') {"1 img
LoadOnlineKeyword trg;<kw

smoutput 'Loading Images and cross references ...'
LoadOnlineImage trg;<img
LoadImageAlbumXr trg;<iax
LoadImageKeywordXr trg;<img

smoutput 'Checking existence of downloaded images ...'
UpdateLocalPresent trg

NB. row counts in loaded tables
db=. sqlopen_psqlite_ trg
cnts=. tabs ,: sqlsize__db&.> tabs
cnts [ sqlclose__db ''
)

LoadOnlineKeyword=:3 : 0

NB.*LoadOnlineKeyword v-- load (OnlineKeyword) table.
NB.
NB. monad:  LoadOnlineKeyword (clDb ; <blclKeywords)
NB.
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   keys=. 'boo;hoo;foo' ; 'yoo;key;me'               NB. keyword lists
NB.   LoadOnlineKeyword trg;<keys

'trg keys'=. y

if. #keys=. <;._1 (;';' ,&.> keys) -. ' ' do.
  NB. insert unique keywords and frequencies
  'kw fq'=. ofreq s: keys
  dt=. sqlopen_psqlite_ trg
  rc=. sqlinsert__dt 'OnlineKeyword';(;:'Keyword KeyFrequency');<(5&s: kw);fq
  rc [ sqlclose__dt ''
else.
  0
end.
)

MatchOnlineLocal=:3 : 0

NB.*MatchOnlineLocal v-- match online files with local files.
NB.
NB. Online files are, with few  exceptions, JPG files while local
NB. files are mostly  TIF files. This verb exactly matches online
NB. file names with  local names. This exact  match picks up over
NB. 1500  images which is  better than  I  expected. Matching all
NB. online  images  to  local  files  will be  an ongoing  little
NB. project.
NB.
NB. verbatim: online files are:
NB.
NB.  1. often renamed
NB.  2. retyped (tif,nef -> jpg)
NB.  3. can derive from many originals (panoramas)
NB.
NB. monad: iaRc = MatchOnlineLocal (clThumbsDb ; clMirrorDb)
NB.
NB.   src=. 'c:/thumbsdbs/working2018.tpdb8s'
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   MatchOnlineLocal src;trg

'src trg'=. y
ds=. sqlopen_psqlite_ src
dt=. sqlopen_psqlite_ trg

NB. local file names and ids !(*)=. idPath idThumb name
ld=. sqldict__ds 'idPath, idThumb, name from Thumbnail'
(0 {"1 ld)=. 1 {"1 ld
local=. justfile&.> name
rc=. sqlclose__ds ''

NB. online ImageKey and file names !(*)=. ImageKey OnlineImageFile
td=. sqldict__dt 'ImageKey, OnlineImageFile from OnlineImage'
(0 {"1 td)=. 1 {"1 td
OnlineImageFile=. justfile&.> OnlineImageFile

NB. local/online exact matches
pos=. local i. OnlineImageFile [ rc=. 0
if. #mch=. pos -. #local do.

  NB. insert matched
  NB. NOTE: thumbs cols renamed,  idPath -->> LocalPathID, idThumb -->> LocalThumbID
  clns=. ;:'LocalPathID LocalThumbID LocalImageFile ImageKey'
  dat=. (mch{idPath);(mch{idThumb);(mch{name);<(pos < #local)#ImageKey
  dat=. 'LocalImage';clns;<dat
  rc=. sqlinsert__dt dat

end.

rc [ sqlclose__dt ''
)

UpdateLocalPresent=:3 : 0

NB.*UpdateLocalPresent v--  set (LocalPresent) in (Album) to 1 if
NB. all local images exist.
NB.
NB. monad:  iaRc =. UpdateLocalPresent clMirrorDb
NB.
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'  NB. smugmug mirror
NB.   UpdateLocalPresent trg

NB. get albums !(*)=. AlbumKey AlbumName
rc=. 0
dt=. sqlopen_psqlite_ y
al=. sqldict__dt 'AlbumKey, AlbumName from Album'
(0 {"1 al)=. 1 {"1 al
if. 0=#AlbumKey do. rc [ sqlclose__dt '' return. end.

bok=. 0 #~ #AlbumKey
for_pos. i.#AlbumKey do.
  ak=. ;pos{AlbumKey
  an=. ;pos{AlbumName
  smoutput 'Checking ',an,' ...'
  files=. dt LocalFrOnline ak
  b=. fexist files
  if. (0 e. b) *. 0 < #files do.
    smoutput 'missing local album sample file(s)'
    smoutput >files # -.b
  else.
    NB. all album files present
    bok=. 1 pos} bok

    NB. NOTE: faster to scan all files and issue one update
    NB. WARNING: this method leaves (mirror.db) open despite
    NB. being closed in all cases - this is not a problem when
    NB. run from (buildmirror.bat) that terminates the entire 
    NB. process and closes (mirror.db).
    NB. rc=. sqlparm__dt UpdateLocalPresent_sql;SQLITE_TEXT_psqlite_;ak
    NB. if. rc ~:0 do. break. end.

  end.
end.

NB. issue one update
if. 1 e. bok do.
  sql=. UpdateLocalPresent_sql,'(',(}.;',' ,&.> quote&.> bok#AlbumKey),')'
  rc=. sqlcmd__dt sql 
end.

rc [ sqlclose__dt ''
)

insqltd=:4 : 0

NB.*insqltd v-- insert btcl table into sqlite table.
NB.
NB. dyad:  iaRc =. baObj insqltd (clSqlTable ;< btclData)
NB.
NB.   db=. sqlopen_psqlite_ jpath '~temp\dntest.db'
NB.   dat=. readtd2 'C:\Users\john2000\j64-807-user\temp\dn_dv.txt'
NB.   db insqltd 'dntest';<dat

'tab dat'=. y
st=. sqltables__x ''
'missing database table' assert st e.~ <tab
cl=. sqlcols__x tab
'missing table column(s)' assert cl e.~ 0{dat
sqlinsert__x tab;(0{dat);< <"1 |: }.dat
)

ofreq=:[: (([: < [: \: [: ; 1 { ]) {&.> ]) ~. ; #/.~

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2_lL11*A=p0fU:41a"M-+>Pes0fU:42BXb0+>Z##3?U%9+>Ghu1,g=12BXh2+>Get1,^77+>Ybq
0fC.12'=h#1Gp:4+>c#D@:O(QE(t%eEc5u#Eb/iN@U`bUCNXS=D/"$2DfQt2@<>pe@<6!&@;]Tu
ATD4#AKY]!+=MI`+DGm>0g^"sCh-7SEcQ)=@UWb^F`9!DEb/[$AM7k<@:UKtBl\64E^OkY@<?'T
Bl\64E`d?nAjg*<Eb/[$ATJu8EGT?2AKYi(EcQ)=+CfG1F)rIEAS,LoASu!h+Cno&@:EYdAOLZX
E(k1[@;JMP@:s.H@<?X4@;KIsD/^UG9Q+ELCe8JPB4WM7@<3Pj5sc])ASc'tBlmos+EV1>FA-U]
A3k$@F_tr5@:UK/6#:"QD(-TL@:F%a9Q+?M8SqmKAP6T[GAhM4=E84r@:UK/8SqmKAP6T[GAhM4
=E5i5FCAWpAP@#NA5-cYEc5u#Eb/iN@VfskA9/l2ATo86Bl\64EZek4Df]tBEb/ioEb0,uAKYMl
FCAWeF(J$`@:W/OCh[cu94`BmDfTB)Ddd0!-r4_sBl7KTAU/K<Eb$UAFCAWpAPG`o;GU1Y6?@-_
Blmo/D/"$2DfQt2@<>pe@<6!&Anc'm+DtV)APHTT@q\YUCh[cu9Q+ELCi*U&@q[!'DJX$)AKYT!
Ch7Z1GA2/4+Dbt+@;I&uBl%@%Bl8!3Cij3%DKBB0F<G%7@r*90@:F%a+DG_8D]j+@Ch\!&+EV%$
Ch7NsEb06,Bkq9&-t[L2E@E#>F`\aHATN!1FE8R=DBNJ$F(8d!A8,po+D,Y*EHPi1@sJ      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,9t-+>Y,p2BXat0fLjI+>G_r1*A;12FDLr@<?'TBl\64EaNm-CbdkXEb/[$AKZ)'@VfTu9Q+EL
Cf"P^BFP:k+=Kp%@ps1M@<?0S6m-2]FCf)rEZf7<F<GIDCht55EbTB!Ed8dCAU,g9$6UH69Q+EL
Cf"P^BHVD.G]Y'GDfd+>F_kkC3t2N+$=e*f@<?''FCAWpAKXcdCh[cu94`BmDfT@t$6UH>94`Bm
DfTA2FCf]=+Du+>+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<Ve"AU-acAT;j(DI[r7Bl8$(B4Z*+DJsV>
DKTc3.6@tG+<Vd9$=e*f@<?''FCAWpAKX9T@WcMs$6UH>6#:"QD+eGc+EV1>F<GI>F<GIDCht55
EbTB!Ed8dCAU,g9$6UH69Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1MEb0<'
DKI"8DKKH&ATAo'BOt[h-qnPh@;Jb\ATMF#F?Mc@+E)9C9Q+ELCf#.`F(K624ZtMK/.Dq/+<X?d
F*(E$A79RkA0>DkFCd!4$6UH66#:"QD,+MVAKZ)+G]YJG$6UH66#:"QD+%rV@rc:&FD5Z2+EV1>
F=[k.+<Ve=DfTE'B5Si-AU,[tDe!3l:gnHZ8OP!MEb/ioEb0,uATJtfDe!3lAPcfWBIHPm@ps1M
@<?0S6n'QH%13OO@rc-hFCcS:@:F%a+AZlkBl7KRD..'g%144#-qS8aB4X_IGp%3?G]Y'GDfd+>
F_kk:E,oZ0@<-W9CLqcB%144#+AZlkBl7KRD..'g7VQ[M+EV1>F=[k.+<VdmEarcsG%G2Y6o?*/
AU&;J%144#+@1$XBPDX$A5d2gAKY])FCf)rE\%Y,+<Ve#@<?4*F_#&+Ao)BoF=[k.+<Ve#Df03%
FEM,*+D,G.@<=%0$6UH66#:XWFEM,*+DG_8AS5Rp/.Dq/+<XI#BkM-t@;JJGBkM+$+DG_8AS5Rp
/.Dq/+<XI#BkM-t@;K"ZA9;K-Bl8$(B4Z*7%144#+AucZCd_]RAKYMlFCd!4$6UH6<H)bm@:Vc7
FCcS*@<?'3%144#+A?3bFB*9j@<?'k+Cno&ALn8t+<Ve,EbQY<AU&;J%144#+B3#sD.7BkBl$di
C`mh2G]YJG$6UH694`BmDfTB0+EV1>F=[k.+<Vdo@;p=&Df-\>AU&;G3t2N+$=e*f@<?''FCAWp
AKXQ]@:s.;CgqO(=E4iX+<W((D..'g94`AkFCf]=+Du+>+Du=<Cb-#&+<VdmCgqO(94`AkFCf]=
+Du+>+Du=<Cb-\<$6UH6E,oZ0@<-W9CLqc>8SqmKAP6T[/0I5p@WcN\AU,^U%144#+D,P4ASGdp
+DYP6-p_ZYF_sc_GpskVAS,LoASu!hF!*bb@WcN96#:"QD+eGc.4bo8+<Ve=DfTE'B5Si-AU,[q
D..'g94`At+ED%*ATD@"@qB^(:Msu_DIlCV@:s."8SqmKAP6T[.4I=f$4R>PEb/[$AKZ)'@VfTu
8SqmKAP6T[GAhM4=E4iX+<W((D..'g94`AkFCf]=+Du+>+Du=<Cb-#&+<Ve"AU/K<Eb$;7AU&;>
DJsV>DKTc3/.Dq/+<YWDBl.:!Gp$m6Gpl7$@:s.EAU,gL94`BmDfTA;/.Dq/+<Y97Eb/rtDBN_+
Gpl<sH$=1IA18XAAS,LoASu!hF!+7rCh[cu94`BmDfTA:94`BmDfTA;/.Dq/+<Y97Eb/rtDBN_+
Gpl7$@:s.EAU,^IEb/ioEb0,uATJtiDJX$)AP$`IB4WJ_D..'g94`At.6@tG%16TcART[l+EV%$
Ch4__De!3l8SqmKAISth+=Kp%@ps1FD..'g8OO\8DKKH&ATAo2Dfd+>F_kk:E,oZ0@<-W9CLqc6
@<H[1Bl7F$ASl!rF=[k.+<Ve#De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`@;JnV
F_tSZ6m-2]FCf)rEZf7<F<GIDChtX3$6UH69Q+ELCe8JPB4XPHCh4`2AU&;>DJsV>DKTc3/.Dq/
+<X6m@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<Y97Eb/rtDBN_+Gpl@)@ps1M@<?0S6n'7!AS,Lo
ASu!hF!+.p@ps1b:gnHZ-qnPh@;JbKFD+66.4bo8+<Ve=DfTE'B5Si-AU,[qD..'g94`At+ED%*
ATD@"@qB^(:Msu_DIlCV@:s."8SqmKAP6T[.4I>T:K(5"9keWgDfSs#AS*\P:-pR0:K(5"9keWg
DfSs#AS*'(Df^"CE,ol,ATMp2E\8ID$4R>`D/XQ=E-67F0H`D!0F\@a67sBpDKKH1Amo1\+EqaE
A12LJ3XlEk67sB'+@:3bCh-7SEcQ)=+<XEG/g+V3@r$4+04T$6@<?'6Ci<`m+Dkh5Ec5t-$7QDk
%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+<W%+Bl\64E`d?nAg\#p                   ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' MirrorXref BackUpMirrorXrefDb BuildMirror CR CreateMirror'
zz=:zz,'XrefDb CreateMirror_sql DumpLocalImageNatural IFACEWORDSMirrorXref '
zz=:zz,'LF LoadAlbum LoadImageAlbumXr LoadImageKeywordXr LoadLocalPath Load'
zz=:zz,'MirrorXrefDb LoadOnlineImage LoadOnlineKeyword LocalFile_sql LocalF'
zz=:zz,'rOnline LocalOnlineFile_sql MACROSMirrorXref MIRRORDB MIRRORHEAD Ma'
zz=:zz,'tchOnlineLocal MirrorImageXrTables ROOTWORDSMirrorXref RealDateFrMa'
zz=:zz,'nifest UpdateLocalPresent UpdateLocalPresent_sql afterlaststr after'
zz=:zz,'str allwhitetrim assert b36casemask b36fd beforelaststr boxopen cha'
zz=:zz,'ngestr charsub fboxname ferase fexist insqltd justfile ofreq quote '
zz=:zz,'read readtd2 reb smoutput tolower tslash2 write yyyymondd''         '
zz=:661{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`/.2DIp?EcQ)==E7tb:-pQ_9keWgDfSs#AS*'+/M/)TEb/[$AKYE!A0>],@:UL%
EGT?2AKYi(EcQ)=+CfG1F)rIEAS,LoASu!h+Cno&@:EYdAM+E!:-pQB$;No?+Eh=:@UX@mD)r+5
:-pQB$;No?+DG_8ATDBk@q?d,DfTA:F"'-m%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'6?R!YA5-cYEc5t@/KeM2@r$4+04T$6@<?'6
Ci<`m+Dkh5Ec5t-$;No?%15is/g+YEART[lA3(hg0JPP%F`&lk%15is/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P++:SZQ67sB83,3SR0K(%dEc6)>+Cf4rF)rI6Eb/[$ARl5W:-pQU0fWojDDF!jD..-r+=KR!
Bl%<SBl\64E[`,>A7T7^%15is/g)l.C3=DL2B['NBOu$h+D,>*@;KY(ARlolDIak<7!3?c9Q+EL
Ce8JPB4XhHFEMV4CagK8A7T7^%13OOEb065Bl[c--Y-Y-@4u\ACh\!&-OgCl$=e!aCghC++=Blt
EcQ)==E7tb-Qij*%15is/h1CCE+NotASuU2%15is/g)Pl.6T^76ZQaHFCe0\EcQ)=?ZU4'+A?]`
@;JDICh6spEGQatE+EC!AP@#P@;Jb\ATMF#FC0*/C`lDi@ps1LDJX$)AO^BMARBLuC^g_H67sa!
DId9hE+NotASuU2%13OO:-pQUF(8lpD.+Q*Aftr)EcQ)=/nAE6A79Rg@UX=h+>"^T@<-F#A0>f.
+=B5u+Cf(nEa`I"ATA4e6ZQaHFCe0\EcQ)=?ZU4'4ZX]60H`D!0I[G<@rc-hFCcS:@:F%a+A?]`
@;JbKFD)*j+<W(+De!3l:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kk:E,oZ0@<-W9CLqcB%144#+A?]`
@;JbKFD)e=AU&;>DJsV>DKTc3.6@tG%16TcART[l+EV%$Ch4_bDJX$)AP6T[GAhM4%144#-qe,s
GAhM4+EV1>F<GI>F<GIDCht55EbTB!Ed8dCAU,g9$6UH694`B<Eb065ASu"'+DG_8AS5Rp+Du+>
+Du=<CahFT$6UH6%16TcART[l+EV%$Ch4_TCgqO(%144#-p_ZYF_sc_Gp%3?G]Y'GDfd+>F_kk:
E,oZ0@<-W9CLqcB%144#+A?]`@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb-#&+<Ve#De!3l:i^,g
ASuT4Bl8$(B4Z*+@q]F`CFDkp@ps1MEb0<'DKJ$)0Hb:S+A?]`@;Jb\ATMF#F?McA.4bo8+<Ve#
@<6NjE+EC!ARloo@<?'3%144#+@0gQF_sl^D.Oi3AU&;J%144#+@0gQF_sNXF(96)E-,f4DBO%4
G]YJG$6UH6AoD^$BkM<+CLqc>9Q+ELCf"P^BLtT@+ED%*ATD@"@qB^(9Q+ELCh6FOFD*'rDe!3l
:gnHZ8OP!V3t2N+$=e*f@<?''FCAWpAKXcdCh[cu8SqmKAISth+=Kfu@:s.EAU,D?AU&;>DJsV>
DKTc3+E2@8D..I1+DYP6/.Dq/+<XHtCh[cu8SqmKAO^BMAKZ)+G]YJG$6UH66#pIKBm+&u9ggi]
FCf]=/.Dq/+<Wsj@q]S"ARn_RH=\45DKKH&ATB=2$6UH69OW$WFEM,*+D,G.@<=%0$6UH69Q+f]
BlnK.AKYT$Ddd`=%144#+@0gcBlnK.AKY])FCf)rE\%Y,+<Ve&EbT0#DII?PASGdjF<G:8FCf)r
E\%Y,+<Ve&EbT0#DII?_Bk2=!+DG_8AS5Rp/.Dq/+<XQn@;J>?FCcS*@<?'3%144#+B<AsDdd0E
@<?''A79Rk/.Dq/+<X?dF*(E$A79RkA0>DkFCd!4$6UH6<H;drFCf]=/.Dq/+<XWsF_tT*@;0OX
Eblk?AU&;J%144#+A69kGAhM4F!,R9G]YJG$6UH66XaqUBl@l3FCf]=.6@tG%16TcART[l+EV%$
Ch4_\D..'g6#:"QD-1ff$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDChtX3$6UH66#:"QD+eGc+EV1>
F<GI>F<GIDChtXF%144#+E2@8D..I1+DYP6-qS8aB4X_IGq:((CgqO(94`At/.Dq/+<Y97Eb/rt
DBN_+Gpksp@WcN\AU,^IEb/ioEb0,uATJt[CgqO(-p_ZYF_sc_Gpt9R$6UH6AoD^$BkM<+CLqc>
8SqmKAP6T[.3NYBAn?!oDI[7!+AZlkBl7KRD..'g-qS8aB4X_IGpt1(%13OO@rc-hFCcS:@:F%a
+A$EYB4X_IH$=1IA6<j]$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDChtX3$6UH694`BmDfTA2FCf]=
+Du+>+Du=<Cb-#&+<VeGEbTB!Ed8dCAU,[qD..'g94`B"+A69kGAhM4.4bo8+<Ve=DfTE'B5Si-
AU,[sAU/K<Eb$UAEb/ioEb0,uATJtiDJX$)AP6T[GAhM4-qe,sGAhM4.4bo8+<Ve=DfTE'B5Si-
AU,[qD..'g94`At+ED%*ATD@"@qB^(:Msu_DIlCV@:s."8SqmKAP6T[.4I=f$4R>PEb/[$AKZ)'
@VfTu9Q+ELCe8JPB4VMZ+<W(+De!3l8SqmKAP#94Bl8$(B4Z*+DJsV>DKTc3+E2@8D..I1+DYP6
+CTD7DeX*!Eb0*!DKIE=$6UH69Q+ELCfG(jD.6()+DG_8AS5Rp+Du+>+Du=<Cb-#&+<Ve#De!3l
:gnHZ8OO\8DKKH&ATAo2Dfd+>F_kkF%144#+A?]`@;JMP@:s.@Bl%?'FCf]=+Du+>+Du=<Cb-#&
+<VduD..'g94`AkFCf]=+Du+>+Du=<Cb-#&+<Ve=DfTE'B5Si-AU,[tDe!3l:gnHZ8OP!MEb/io
Eb0,uATJtfDe!3lAPcfWBIHPm@ps1M@<?0S6n'Yr$6UH6AoD^$BkM<+CLqc>8SqmKAP6T[.3NYB
An?!oDI[7!+AZlkBl7KRD..'g-qS8aB4X_IGpt1(%14Nn$4R>;67sBU:K0bD+EV:.+DN$?EGT?2
AKYDlA8c?.BlbD/F`VVL+CS_tF`\a>Dg*=FEGQb3F!,(5Ec#6,FCeu8%15is/g+&7DJj0+B-;8;
@;]UaEb$;6EGQb:Eb0?7Gp%'HBl8$(EcW@AEZf(6A7]Y#Bl7Q+F)c"=Bl5&=Dfp(0$;No?+D,&*
DfTQ6AKZ&9H#.%7BlbD5Bkq9rGp%3I+E2@>A9DBn+Cf>#AKZ).@<<W&De4!--ZgJTDfTVG%15is
/g+,)F*&OMDfp(CF)c"=Ao_<mD.RU,F!,RC+CTG3Bk/?.BPDN1,'7O/CLqd#Df6dC%15dI@ps1C
Bl%?fF)c"Z3Zoh)+?CW!.1HW*ASbpfF<D]7/kKngB4X_IGq:(6DJX$)AP$`IB4XPHCh5.?9Q+EL
Cf"P^BHUo-Df$UmDJX$)AP$`IB4W2o%16feDImi2C2[g(+A$EYB4XAF@WcNiEZeg6Df-\+/kKng
B4X_IGp#6m@P15h@:s.EAU+^lBl7g"EZf+8Bl5%ZCgqO(+CcO4DBNFA6#:"QD+eGc+?^iV/jX;_
F_sc_Gmt*pDJj$++DPh/DBMVk@ps1M@<?0*A0>f.+Cm)uDe!3l:gnHZ8OO[a+Cd#tDe!3l:gnHZ
8OO[1$?p/pEb-A'/jX;_F_sc_Gp#6m57Is<Eb&a%+C]U=:Msu_DIlCV@:s.@Bl%>i$7QDk%16*S
A79Rk9Q+ELCf#.`F(K62?ZU4'4ZX]5F`:l"FCcR\CgqO(+EM+9+A?]`@;Jb\ATMF#F<E^h0d([R
ATD?)6#:"QD+eGc+DG^9-OgCl$;>AJ@;J_WCh[cu7VQ[M?ZU4'4ZX]60H`D!0I[G<F(K0!@rrhk
ARTCC@<?'3+Cd#qD..'g94`B"+A?]`@;JnVF_tSZ6nBHi/kg1n@;JbKFD+66/0IW)@ps1M@<?06
+A?]`@;JMP@:s.@Bl%?3+AZlkBl7KRD..'g7VQ[M+D,Y4D'2Mj@ps1FD..'g+CQB%$>FBqATAo.
DeX)39Q+ELCf"P^BHUb,Df-\,/kg1n@;JbKFD+66+?^iU/kg1n@;JbKFD+66+:SZlDJj$++DPh/
DBM_mCh[cu8SqmKAKYJ*Df-\-/kKngB4X_IGp#6m@4k,g@:s.EAU,C-$?'rqATAo&Gp$!r@;J>?
FCbmg.0                                                                   ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`a@r#(`9keWgDfSs#AS+>>+@:3bCh-7SEcQ)=+@C0\@<?'TBl\64E`d?n
Ajg)N7!3?c9Q+ELCe8JPB4XhHFEMV4C`lDi@:VZ?@WcN19Q+?M8SqmKAP6T[GAhM4=E5NXDdd0M
De!3l:gnHZ+A?]^A5-cYEc5u#Eb/iN@N\?_@:W/OCh[cu94`BmDfTA29hA5\:JsSI+AH9d@q\YU
Ch[cu9Q+ELC`l_sA79Rk9Q+ELCf#.`F(K62+DG_7EGT`-+E(k4AT9(H/1<V7,VUYu-p0%C-V\;q
Ec5u#Eb/i1.4cl00I/>$/1<VC4"akp+=A:!Eb/[$APHlZEc5u*F)c"=:et"h?VP6TEc5u#Eb/i1
.4cl01*A;.,Vh&.3&!6G2_HsG2`NTI1,_!41,(FB0K([F/i,LF2)I3M0esk,0JPO@2DR3D2)dKO
2)$aC1*A>+0fUjF1,ggB2)d3H1H76L+>PW*3&!6G2_HsI0K([?3&r`:1,(FB0K([F/i>UH1c@3K
0K:110JPO@2DR3D2*!QN0JP7?2'=Y.0fUjF1,ggC3&i`K0fV'K+>PW*3&!6G2_HsI3A`]T1,q38
1,(FB0K([F/i>OH3&3HJ1,U100JPO@2DR3D1H@0I0JbUB0d&5*0fUjF1,ggD0JG:C0Jk^G+>PW*
3&!6G2_HsJ0etaF3&*E91,(FB0K([E/i,FA1H@9P1bp1/0JPO@2DR3D2)dBQ2E<NO0d&5*0fUjF
1,ggC2`ENP2`<WS+>PW*3&!6G2_HsH3&EKH0fCd01,(FB0K([F/i5FE1-%0O0K1+00JPO@2DR3D
2)m9J1,([J1*A>+0fUjF1,ggC3&WTO2)R'I+>PW*3&!6G2_HsJ2D[$A0K1j31,(FB0K([F/i>UJ
1b^XD2DlU40JPO@2DR3D2)mTQ3&iZQ2]sk00fUjF1,ggC2E<QL2E3ZT+>PW*3&!6G2_HmH0f:X@
2DR!01,(FB0K([F/iGC;1H@-G2`2^50JPO@2DR3D2*!BH3AWWL3?U(20fUjF1,^a@2_m0L1c[BJ
.4cl00I/>$/1<V90JPO@2DR3D2)R?I0fCdF1Fk.30JP:>1c[KM1,L[@1,q3P3&iC%/i"P(.4cl0
0I/>$/1<V9+>P2t0JPO@2DR0C1b^mG0JkIB2'=Y.0fUjF1,ggD0JtjN0JYXC+>PW*3&!6G2_HmH
0KD-R1GUp41,(FB0K([F/iGC@3B8cK3ADs6-p014/1<V7.4cl00I\P$4>8384>6           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
