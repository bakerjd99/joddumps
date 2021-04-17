NB. JOD dictionary dump: 17 Apr 2021 11:17:37
NB. Generated with JOD version; 1.0.2; 13; 13 Nov 2020 16:34:19
NB. J version: j901/j64avx/windows/release-f/commercial/www.jsoftware.com/2020-06-11T15:22:02
NB.
NB. Names & DidNums on current path
NB. +----+--------------------------------------+
NB. |bugs|87446277513027921201695065523063752704|
NB. +----+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


v0ddef=:3 : 0

NB.*v0 v-- direct definition global scope test.

5 v0ddef y

:

smoutput boo=. 'local boo'

v1=. {{ smoutput boo=: 'in v1 boo' 
        v2=. {{ deep=: 'in v2 we deep'    
                 3 {{ deeper=: 'in v3 we deeper' [ smoutput (i.x) +/ i.y }}  4
                 smoutput i. y,-y
 }} 
        v2 5
        x * y
 }} 
x v1 y
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-[%1SA7]@#.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>8$7.4cl01,(I<0JkLC/i5L@
0K(^C0e6Td0JY@:1bgj?1cI*B2D[-D.VULi+>PAs-p01/0I\P$4>8$7.4cl00I/>$/1<V7,VUYu
-p045/1<V7.4cl00I\P$4>8384>6                                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
