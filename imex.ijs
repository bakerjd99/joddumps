NB. JOD dictionary dump: 15 Aug 2018 10:23:59
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


debrii=:3 : 0

NB.*debrii v-- write shell script that removes debrii files.
NB.
NB. Note: tuned for windows - tweak for others.
NB.
NB. monad:  clBatFile =. debrii clRoot
NB.
NB.   debrii 'h:/'
NB.
NB. dyad:  clBatFile =. (clBatFile ; blclExt ; <paPause) debrii clRoot
NB.
NB.   NB. do not append pause
NB.   ('h:/temp';(;:'sql txt pdf');1) debrii 'h:/'

(DEBRIIBAT;DEBRIIEXT;1) debrii y
:
'file ext pause'=. x 
NB. j profile !(*)=. dirtree
d=. 0 {"1 dirtree y
NB. extensions are not case sensitive
b=. (tolower@justext&.> d) e. tolower&.> ext
NB. default is to pause
t=. toHOST (pause#LF,'pause') ,~ ctl '/\' charsub >'del '&,&.> dblquote b#d
file [ t write file
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*AIt1c/`S@WH0sGB.D>AKZ&-ASc0*F(96)E-*4EBOQ!*Eb0*+G%G_;A7]4jBk\]%Bl%@%~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-Y-dtEbT58.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>8$7.4cl01,(FB0K:dE/i5@>
2)m9G3AW0m1,(FB0K:dC/i5@>2)m9G3AW.!/hnJ(.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>8$7
.4cl00e"Y%4>838-p014/1<V7.4dS8                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
