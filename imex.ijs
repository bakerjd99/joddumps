NB. JOD dictionary dump: 19 Jul 2018 11:45:23
NB. Generated with JOD version; 0.9.996 - dev-f; 25; 10 Jul 2018 08:40:28
NB. J version: j807/j64/windows/beta-g/commercial/www.jsoftware.com/2018-07-02T18:14:50
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
bakpfx=. target,tdate,'-00-'

rc=. 0  NB. assume failure
try.

  if. -.fexist source,MIRRORDB do.
    1 [ smoutput MIRRORDB,' database missing - continue build' return.
  end.

  if. x -: 1 do.

    NB. read (MIRRORDB) bytes - this copy method
    NB. works well for files < 200MB and (MIRRORDB)
    NB. will remain well below that threshold.
    bindb=. read source,MIRRORDB
    txtxf=.''
    mantxtf=.''
    if. fexist source,LOCOXREF    do. txtxf=. read source,LOCOXREF end.
    if. fexist source,MANLOCOXREF do. mantxtf=. read source,MANLOCOXREF end.
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
      bakpfx=. target,tdate,'-',bcnt,'-'
    end.
  
    smoutput 'backing up -> ',bakpfx,MIRRORDB
    bindb write bakpfx,MIRRORDB
    txtxf write bakpfx,LOCOXREF
    mantxtf write bakpfx,MANLOCOXREF

    NB. clear db source if a backup exists
    if. fexist bakpfx,MIRRORDB do. 
      if. 0 > ferase source,MIRRORDB do.
        rc [ smoutput 'unable to erase ',MIRRORDB return.
      end.
    end.

  elseif. x -: 0 do.

    smoutput 'removing ',MIRRORDB,' without backup'
    if. 0 > ferase source,MIRRORDB do.
        rc [ smoutput 'unable to erase ',MIRRORDB return.
    end.

  elseif.do.

    rc [ smoutput 'invalid backup option' return.

  end.

  rc=. 1  NB. success
catch.
  rc=. 0
end.
rc
)

MatchManual=:3 : 0

NB.*MatchManual  v--  insert  manual  online  local  image   pair
NB. corrections.
NB.
NB. This verb  reads  a TAB  delimited file  of manual online and
NB. local image pairings  and inserts valid pairs into the mirror
NB. cross  reference database. Manual  corrections are  necessary
NB. for online images  with  file  names  that do follow patterns
NB. handled by (MatchOnlineLocal) and (MatchOnlineNoBrackets).
NB.
NB. monad:  iaRc =. MatchManual (clFixFile ; clThumbsDb ; clMirrorDb)
NB.
NB.   src=. 'c:/thumbsdbs/primary2018.tpdb8s'
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   fix=. 'c:/smugmirror/documents/xrefdb/manlocoxref.txt'
NB.   MatchManual fix;src;trg

'fix src trg'=. y
rc=. 0

NB. manual corrections
mc=. }. mc [ hd=. 0 { mc=. readtd2 fix
'lp lf of'=. hd i. ;:'LocalPath LocalImageFile OnlineImageFile'

NB. look up path IDs and online image keys
NB. (*)=. LocalPathID LocalPath OnlineImageFile ImageKey LocalThumbID
dt=. sqlopen_psqlite_ trg
du=. sqldict__dt 'LocalPath'
dv=. sqldict__dt 'OnlineImageFile,ImageKey from OnlineImage'
rc=. sqlclose__dt''

(0{"1 du)=. 1 {"1 du
'missing manual local path(s)' assert (#LocalPath) > pos=. LocalPath i. lp {"1 mc
lpid=. pos { LocalPathID

(0{"1 dv)=. 1 {"1 dv
'invalid manual online image(s)' assert (#OnlineImageFile) > pos=. OnlineImageFile i. of {"1 mc
olik=. pos { ImageKey

NB. look up thumbsplus image ID - used as LocalThumbID
ds=. sqlopen_psqlite_ src
du=. sqldict__ds 'idThumb as LocalThumbID, name as LocalImageFile, idPath as LocalPathID from Thumbnail'
rc=. sqlclose__ds''

NB. use symbols - local file list is large
(0{"1 du)=. 1 {"1 du
LocalImageFile=. s: LocalImageFile
'invalid manual local image(s)' assert (#LocalImageFile) > pos=. LocalImageFile i. s: lf {"1 mc
lifp=. pos

NB. match on path id and local file name
pos=. (LocalPathID ,. i.~ LocalImageFile) i. lpid ,. lifp
'missing manual local path image pairs(s)' assert pos < #LocalImageFile
ltid=. pos { LocalThumbID

NB. insert manual local online pairs in LocalImage table
cln=. ;:'LocalPathID LocalThumbID LocalImageFile ImageKey'
du=. lpid;ltid;(<lf {"1 mc);<olik
dt=. sqlopen_psqlite_ trg
rc=. sqlinsert__dt 'LocalImageFile';cln;<du
rc [ sqlclose__dt ''
)

MissingImagesReport=:3 : 0

NB.*MissingImagesReport v-- missing local images report.
NB.
NB. monad:  clReportFile =. MissingImagesReport (clMissingFile ; clMirrorDb)
NB.
NB.   mli=. 'c:/smugmirror/documents/xrefdb/locomiss.txt'
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   MissingImagesReport mli;trg

'mli trg'=. y

NB. switch to portable box characters 
portchars '' [ cchars=. 9!:6 ''
dt=. sqlopen_psqlite_ trg
dat=. ctl ": sqlreads__dt MissingLocalFiles_sql
9!:7 cchars [ sqlclose__dt ''

NB. write report text
mli [ (toHOST dat) write mli
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk`a@r#(`9keWgDfSs#AS+>>+AH9d@q\SFDKTB(+AHQkF(oN)8SqmKATLa\
E,Tc=-RgSp4>8$7.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>J$8,Vh&.3&!9G3%d!H3&39I3&NT:
1,(FB0K1^H/i,II2`WcN3A_j60JPO@2_d9E1H@BP0JYRA3$9t10fUjG0fUdA3&iZL2)mHO+>PW*
3&!9G3A*-J3B&]I3Aif>1,(FB0K1^G/i,LH2D?mF0fUU5-p01/0I\P$4>8$7.4cl00I/>$/1<V7
,VUYu-p014/1<V7.4cl00I\P$4>8384>6                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
