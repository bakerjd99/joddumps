NB. JOD dictionary dump: 29 Jun 2012 10:01:59
NB. Generated with JOD version; 0.9.80; 6; 29 Jun 2012 09:42:15

NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |hack|232050152364125936067847389806071960525|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


zz=:',:<;._1 ''||this is a test of dictionary documentation dump and restore ehh'''

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


dumpdictdoc=:3 : 0

NB.*dumpdictdoc v-- appends dictionary documentation text to dumpfile.
NB.
NB. monad:  dumpdictdoc clPathFile
NB.
NB.   dumpdictdoc 'c:\go\ahead\dump\my\dictionary.ijs'

NB. cannot fetch document or document is empty
if. badrc uv=. DICTIONARY get '' do. (jderr ERR0155),<y return. end.
if. 0=#uv=. >1{uv do. OK return. end. 

tag=. DUMPTAG,LF
putso=. (2#LF),SOSWITCH,LF

NB. expression to store dictionary documentation text in scratch locale
soputdoc=. SOPASS,(":DICTIONARY),' put >1{,".".''zz_'',SOLOCALE,''_'' [ cocurrent ''base'' ',tag

NB. format document text for dump
dicdoc=. putso,WRAPTMPWID fmtdumptext ,:'';uv
dicdoc=. dicdoc,LF,soputdoc,SOCLEAR,2#LF

NB. append dictionary documentation error msg: unable to append to dumpfile
if. _1 -: (toHOST dicdoc) fap <y do. (jderr ERR0155),<y else. OK end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}cocurrent 'base' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
