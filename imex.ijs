NB. JOD dictionary dump:  8 Feb 2019 15:30:25
NB. Generated with JOD version; 0.9.998 - dev; 12; 29 Jan 2019 18:54:14
NB. J version: j807/j64/windows/release-b/commercial/www.jsoftware.com/2019-01-22T18:51:16
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|331658214217135004629326115107284549897|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


randates=:0&$: :(4 : 0)

NB.*randates v-- randomly select distinct (x) 'YYYY-MM-DD' formatted dates from years (y),
NB.
NB. monad:  blclDates =. clYYYYMMDD randates ilYears
NB. 
NB.   NB. all dates in year randomly shuffled
NB.   randates 2019
NB.
NB. dyad: blclDates =. iaN randates ilYears
NB.
NB.   NB. (x) dates for all randomly shuffled dates in years
NB.   5 randates 2018 1953 1812

NB. YYYY-MM-DD format is an ISO prefix 
fs=. 'q<->5.0,r<0>q<->3.0,r<0>2.0'
ds=. (?~ #ds){ds=. yeardates y
if. x>0 do. ds=. x {. ds end.
<"1 fs (8!:2) ds
)

tat=:] , [ }.~ [ = [: {: ]

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P'!+?))!1E\S9Ea`ir@<?(%Ea`irDf'<9+EM+1ARfg)A8-+,Bl7F&+=MI`+=C;p=]m=N
9eAb$-Qm#>Ec#6,FCeu*A79RkF!,(8Df$VBARTV#+=MLa/9G<B@;p0sDIdf2FE1f(Ch[d"+CTA1
D'16O.3N>:+Dtb#ATMp$Ed9\g0HbIGF<E:\1*BdD-RpJjFCB86-ZaB<EZf41-N            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QmG<DId0tATJu9@<<kG/1<V7,VUYu-p01/0I\P$4>8$7.4cl00I/>$/1<V9
+>P2t0JPRA0f(O:1H@-H0JY@<3?U(20f^pC0JkC?2_['F0ekF<+>PW*3A<0D0eP7B0JtO>0eta3
1,(FC0JY==/iGXB1c-pA1,14/-p01/0I\P$4>8$7.4cl00I/>$/1<V7,VUYu-p014/1<V7.4cl0
0I\P$4>8384>6                                                             ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
