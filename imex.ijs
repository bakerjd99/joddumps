NB. JOD dictionary dump: 28 Dec 2018 11:01:50
NB. Generated with JOD version; 0.9.998 - dev; 2; 6 Nov 2018 13:44:39
NB. J version: j807/j64/windows/release/commercial/www.jsoftware.com/2018-10-05T10:39:42
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


decolortag=:3 : 0

NB.*decolortag v-- remove color keywords from images.
NB.
NB. monad:  btcl =. decolortag btclImages
NB.
NB.   proot=. 'C:\SmugMirror\Mirror\'
NB.   img0=. readtd2 proot,'Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg-w.txt'
NB.   img1=. readtd2 proot,'People\GreatandGreaterForebearers\manifest-GreatandGreaterForebearers-XghWcL-11.txt'
NB.   img2=. readtd2 proot,'Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz-16.txt'
NB.   img3=. readtd2 proot,'Other\utilimages\manifest-utilimages-GMLn9k-1k.txt'
NB.
NB.   decolortag img0
NB.   decolortag img1

'0_' decolortag y
:
d=. }.y [ h=. 0{y
'missing (Keywords) column' assert  k=. h i. <'Keywords'

if. #d do.

  NB. color tag prefix
  p=. ';',x

  NB. remove all color keywords
  s=. <;.1&.> ';' ,&.> k {"1 d
  s=. ;&.> s #&.>~ -.@;&.> p&-: L: 0 (#p) {. L: 0 s
  s=. alltrim&.> s }.&.>~ (';'&=@{.) &.> s

  NB. table with modified keywords
  h , s (<a:;k)} d
else.
  y
end.
)

degeotag=:3 : 0

NB.*degeotag v-- remove geotagged keyword from images with nonzero latitude and longitude.
NB.
NB. monad:  btcl =. degeotag btclImages
NB.
NB.   proot=. 'C:\SmugMirror\Mirror\'
NB.   img0=. readtd2 proot,'Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg-w.txt'
NB.   img1=. readtd2 proot,'People\GreatandGreaterForebearers\manifest-GreatandGreaterForebearers-XghWcL-11.txt'
NB.   img2=. readtd2 proot,'Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz-16.txt'
NB.
NB.   degeotag img0
NB.   degeotag img1

'geotagged' degeotag y
:
d=. }.y [ h=. 0{y
'missing (Keyword, Latitude, Longitude) column(s)' assert -.(#h) e. 'k l b' =. h i. ;:'Keywords Latitude Longitude'

if. #d do.

  NB. items with nonzero latitude or longitude
  lb=. (l,b) {"1 d
  if. 0=#p=. I. +./"1 ] 0 ~: (0 < #&> lb) * 0&".&> lb do. y return. end.

  NB. items with (x) keyword
  t=. (<p;k){ d
  if. 0=#q=. I. +./@(x&E.) &> t do. y return. end.

  NB. remove (x) keyword(s)
  h , (x rekeyword t) (<p;k)} d
else.
  y
end.
)

desizetag=:3 : 0

NB.*desizetag v-- remove print size keywords from images.
NB.
NB. monad:  btcl =. desizetag btclImages
NB.
NB.   proot=. 'C:\SmugMirror\Mirror\'
NB.   img0=. readtd2 proot,'Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg-w.txt'
NB.   img1=. readtd2 proot,'People\GreatandGreaterForebearers\manifest-GreatandGreaterForebearers-XghWcL-11.txt'
NB.   img2=. readtd2 proot,'Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz-16.txt'
NB.   img3=. readtd2 proot,'Other\utilimages\manifest-utilimages-GMLn9k-1k.txt'
NB.
NB.   desizetag img0
NB.   desizetag img1

d=. }.y [ h=. 0{y
'missing (Keywords) column' assert  k=. h i. <'Keywords'

if. #d do.

  NB. remove all size keywords
  s=. (<;._1&.>';',&.> k{"1 d) -. L: 0 ' '
  s=. ,&'; ' L: 0  s -. L: 1  '0z0';'0z1';SMUGPYTERSIZES
  s=. alltrim@(_2&}.)&.> ;&.> s

  NB. table with modified keywords
  h , s (<a:;k)} d
else.
  y
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@4+>P&o0H`/-+?1K&1*AS"1H8oV@rH1%Ecb`&Eb0*+G%De+Des?4+DYP6GAhM4F!,(8Df$V2
D..'gF(AipAT)[!B6%R#Dg#\7B4Z"'@:s4aA0>Z!H$=1IA0>K)Df$V2D..'gF!,[@FD)e7Df0l4
Ec3(:@<?4*F_#&+@;]TuCi=3(BlnK.ARo@nBmO?4@:sUlD/XT/+E2@8DKI"BBmO>5CLqd8DfTB0
+D,Y4D'3P0@:s.m                                                           ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' SmugPyter MirrorImageXrefTables MirrorImages MirrorKeywor'
zz=:zz,'ds MirrorMD5s NOPIXELSKEY NORATIOKEY SMUGAREAROUND SMUGASPECTROUND '
zz=:zz,'SMUGPRINTDPI SMUGPRINTSIZES SMUGPYTERSIZES alltrim allwhitetrim ass'
zz=:zz,'ert charsub decolortag degeotag desizetag dpiarearatio geotag lasto'
zz=:zz,'nes ofreq printsizekey printsizestable readtd2 rekeyword round sort'
zz=:zz,'printsizes tlf tslash2''                                            '
zz=:358{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qlr2@rH1%Ecb`&+Co%rAT)[!B-:_rF(or3FCAf0.4cl00I/>$/1<V34=='E
F_=NrFCfJ?.4cl00I/>$/1<V7,VUYu-p07-1F+_00fUmC1,^aA2_m-K1c[?71,(FB0etLB/i5LC
3A`EE0f:(/0JPOA1,:a?1c.-L2)dKM1a"P-0fUmC1,^aA2_m-K1c[?71,(FB0etLB/i5LC3A`EE
0f:(/0JPOA1,:a?1cI-G0JYC@3%6C,4>8$7.4cl01,(FB0etLB/i5IG3&*3L.pk%c0fUmC1,LU?
2E3ZN1H?q!/hnJ(.4cl00I/>$/1<V7,VUYu-p014/1<V7.4cl00e"Y%4>8384>6           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
