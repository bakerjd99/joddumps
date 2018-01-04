NB. JOD dictionary dump:  3 Jan 2018 19:27:34
NB. Generated with JOD version; 0.9.990; 15; 27 Feb 2017 20:51:37
NB.
NB. Names & DidNums on current path
NB. +---------+---------------------------------------+
NB. |smugpyter|222940491384479426302418047456064767038|
NB. +---------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


SMUGPRINTDPI=:360

SMUGPRINTSIZES=:<;._1 ' 3.5x5 4x5 4x5.3 4x6 4x8 5x5 5x6.7 5x7 5x10 5x30 7x10 8x8 8x10 8x10.6 8x12 8x16 8x20 8.5x11 9x12 10x10 10x13 10x15 10x16 10x20 10x30 11x14 11x16 11x28 12x12 12x18 12x20 12x24 12x30 16x20 16x24 18x24 20x20 20x24 20x30'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


smugprintsizes=:3 : 0

NB.*smugprintsizes v-- compute largest print size for given dpi.
NB.
NB. Computes the  largest  print size  (relative  to  DPI x)  for
NB. SmugMug images. Only images that have aspect ratios  close to
NB. the ratios  on  (SMUGPRINTSIZES) are associated  with a print
NB. size.
NB.
NB. monad:  st=. smugprintsizes btclImages
NB.
NB.   NB. read table delimited (smugpyter.py) album file
NB.   images=. readtd2 'c:\SmugMirror\People\TheWayWeWere\manifest-TheWayWeWere-X8X9pK.txt'
NB.   'keys sizes'=. |: smugprintsizes images
NB.
NB. dyad:  st=. iaDpi smugprintsizes btclImages
NB.
NB.   NB. images are dropped if there are not enough pixels for DPI
NB.   #images
NB.   #600 smugprintsizes images

SMUGPRINTDPI smugprintsizes y
:
nsym=.s:<''

NB. reduce image table on PID
images=. }. y [ imhead=. 0 { y
pidpos=. imhead i. <'ImageKey'
if. 0=#images=. images #~ ~:pidpos {"1 images do. 0 2$nsym return.end.

NB. compute print sizes table
pst=. printsizestable SMUGPRINTSIZES

NB. image dimensions short x long
idims=. _1&".&> (imhead i. ;:'OriginalWidth OriginalHeight') {"1 images
'invalid image dimensions' assert -. _1 e. idims
idims=. (/:"1 idims) {"1 idims

NB. aspect ratio and print area (square inches)
ratios=. SMUGASPECTROUND round %/"1 idims
areas=.  SMUGAREAROUND round (*/"1 idims) % *: x

NB. mask table selecting images with ratio
masks=. (SMUGASPECTROUND round ;0 {"1 pst) =/ ratios
if. -.1 e. ,masks do. 0 2$nsym return.end.

masks=. <"1 masks
pids=.  s:&.> masks #&.> <pidpos {"1 images

NB. largest print area for selected images at current DPI
masks=. (1 {"1 pst) </&.> masks #&.> <areas
pids=.  (<"1&.> masks #"1 &.> pids) -. L: 0 nsym
sizes=.  <"0&.> 2 {"1 pst
; |:&.> ; pids ,: L: 0 (# L: 0 pids) # L: 0 sizes
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;,+>l&U9iX\[;FsV_6r6HcAS,@nCige=EbTE5+@K$t+>"^WATT&:D]i"mF_tT/:i(8q
+DkOsEc3(D@;L't+E(j71H$o                                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' smugpyter SMUGAREAROUND SMUGASPECTROUND SMUGPRINTDPI SMUG'
zz=:zz,'PRINTSIZES assert charsub printsizestable round smugprintsizes''    '
zz=:130{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql>^<C]k`8PW5Q:e;d.9iX\[;FsV_;b:.];]p-uF_>Z6Bl8$6BmO?3-RgSp
4>8$7.4cl0/3G;$D09K1H$!V<-RgSp4>8$7.4cl00I/>$/1<V9+>Y8u0JPO@0ebC92`<HI1GLmF
1*A>+0fUjA0Jb=?3B8lM2_m?J+>PW*3&!'@1G1UE3AicQ0KD'71,(FB0JP7;/iP[E1,CXF1,9t-
0JPO@0ebC92`WlS0fLjI1*A>+0fUjA0Jb=@0KCjI3&WNJ.4cl00I/>$/1<V90JPO@0ebC92`EQI
1G_!I0e4q10JG192E!?O0fM'J3AiQN0f(L<.VULj+>G;r-p01/0I\P$4>8$7.4cl00I\P$4>838
-p014/1<V7.4dS8                                                           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
