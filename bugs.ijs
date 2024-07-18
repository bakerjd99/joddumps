NB. sha256:8c25311e77bb3a2ba5c878afa0b0188724788af142b0e9e0c7040fbf8f100c98
NB. JOD dictionary dump: 17 Jul 2024 15:11:18
NB. Generated with JOD version; 1.1.3 - dev; 4; 17 Jul 2024 10:36:06
NB. J version: j9.6.0-beta13/j64avx2/windows/commercial/www.jsoftware.com/2024-07-02T10:16:57/clang-18-1-6/SLEEF=1
NB. JOD put dictionary path: /
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |bugs|227697518776665324698573187200340626207|
NB. +----+---------------------------------------+

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
                 3 {{ deeper=: 'in v3 we deeper' [ smoutput (i.x) +/ i.y }}   4
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
0K(^C0eb=4?SX;j0ebF=2(g^E0JGC@1GLR<.VULi+>PAs-p01/0I\P$4>8$7.4cl00I/>$/1<V7
,VUYu-p045/1<V7.4cl00I\P$4>8384>6                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
