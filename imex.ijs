NB. JOD dictionary dump: 21 Jan 2020 15:51:18
NB. Generated with JOD version; 1.0.1 - dev; 13; 20 Jan 2020 10:28:49
NB. J version: j901/j64avx2/windows/release-d/commercial/www.jsoftware.com/2020-01-20T12:11:40
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|262210418022445021663373283974631637170|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


sizekeyfreq=:3 : 0

NB.*sizekeyfreq v-- frequencies of print size keys in mirror_db.
NB.
NB. monad:  sizekeyfreq clDb
NB.
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   sizekeyfreq trg

sql=. 'select * from OnlineKeyword where Keyword in ('
sql=. sql, (}. ;',' ,&.> dblquote SMUGPYTERSIZES) , ') order by KeyFrequency desc'
sql fsd y
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-Za!JASYk&Ao_I&-RgSp4>8$7.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>JTG0JG4:
0eP@B0JG4?2)@*??SX;j0JG493A*3J0JG4?2)@*>BeD+_1+=b&4>8$7.4cl00I/>$/1<V7,VUYu
-p01/0I\P$4>A99-p014/1<V7.4cl00I\P80E                                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
