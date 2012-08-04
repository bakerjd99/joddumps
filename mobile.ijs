NB. JOD dictionary dump: 10 Jul 2012 10:52:59
NB. Generated with JOD version; 0.9.80; 34; 10 Jul 2012 10:51:56

NB.
NB. Names & DidNums on current path
NB. +------+--------------------------------------+
NB. |mobile|17623799305602589484505015708788886751|
NB. +------+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


dumptrailer=:3 : 0

NB.*dumptrailer v-- appends terminal text to dumpfile.
NB.
NB. monad:  dumptrailer clPathFile
NB.
NB.   dumptrailer 'c:\go\ahead\dump\my\dictionary.ijs'

tag=. DUMPTAG,LF
tail=. LF,'cocurrent ''base''',tag
tail=. tail,'0 0$(4!:55);:''sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_''',tag
tail=. tail,SOPASS,DUMPMSG2,tag

NB. append trailer error msg: unable to append to dumpfile
if. _1 -: (toHOST tail) fap <y do. (jderr ERR0155),<y else. OK end.
)

test=:3 : 0

NB.*test v-- created on iphone
NB.
NB. monad:  test uu


'i was coded on the iphone'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
