NB. JOD dictionary dump:  4 Jan 2018 18:38:12
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


printsizestable=:3 : 0

NB.*printsizestable v-- computes print sizes table.
NB.
NB. monad:  bt=. printsizestable blclPrintSizes
NB.
NB.   printsizestable SMUGPRINTSIZES
NB.   printsizestable <;._1 ' ',reb '10x10 20x30   3x2 2x3 12x8  8x12 10x10   '
NB.
NB. dyad:  bt=. faPrecision printsizestable blclPrintSizes
NB.
NB.   0.00005 printsizestable SMUGPRINTSIZES   

SMUGASPECTROUND printsizestable y
:
sizes=. sortprintsizes y
ratios=. ".&> 'x%'&charsub&.> sizes
areas=.  ".&> 'x*'&charsub&.> sizes

NB. sizes with same ratio, eg: 4x5, 8x10, 4x6, 8x12
aspect=. ((~.ratios) i. ratios) </. i. #ratios

NB. columns: ratio, areas, printsizes
(<"0 x round ~.ratios) ,. (aspect {&.> <areas) ,. s:&.> aspect {&.> <y
)

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
pst=. SMUGASPECTROUND printsizestable SMUGPRINTSIZES

NB. image dimensions short x long
idims=. _1&".&> (imhead i. ;:'OriginalWidth OriginalHeight') {"1 images
'invalid image dimensions' assert -. _1 e. idims
idims=. (/:"1 idims) {"1 idims

NB. aspect ratio and print area (square inches)
ratios=. SMUGASPECTROUND round %/"1 idims
areas=.  SMUGAREAROUND round (*/"1 idims) % *: x

NB. mask table selecting images with ratio
masks=. (;0 {"1 pst) =/ ratios
if. -.1 e. ,masks do. 0 2$nsym return.end.

masks=. <"1 masks
pids=.  s:&.> masks #&.> <pidpos {"1 images

NB. largest print area for selected images at current DPI
masks=. (1 {"1 pst) </&.> masks #&.> <areas
pids=.  (<"1&.> masks #"1 &.> pids) -. L: 0 nsym
sizes=.  <"0&.> 2 {"1 pst
; |:&.> ; pids ,: L: 0 (# L: 0 pids) # L: 0 sizes
)

sortprintsizes=:3 : 0

NB.*sortprintsizes v-- sort print sizes as ascending unique Short x Long,  
NB.
NB. monad:  sortprintsizes clPrintSizes
NB. 
NB.   sortprintsizes SMUGPRINTSIZES
NB.   sortprintsizes <;.1 ' ',reb '10x10 20x30   3x2 2x3 12x8  8x12 10x10   '

(~. ' x'&charsub&.> ":&.> /:~ (/:~)&.> ".&.> 'x '&charsub&.> y) -.&.> ' '
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1*AG4+>G\q1cHO32'=Y4+>G\q1b^%,1a"Y0;b^7^:f9k[<('PSA7]@]F_l.BE,oZ1
F<EtJ8K]T-F(KG9FDi:$BQ\0$F&6[qF!,=.@rcK1G%#30AKYo'+>Yo0;b^7^:f9k[<)Z@l78m]4
+E(j7;eU)iF<GfN9Q+f]+=LrA@q]Fp.3MQ+F_=EkB-;/6Bl8#8F(or3F)Z/6DKKr6H=_/>@:F%a
@rH4'F`_29+E2@8DKI"BBmO?3+EV%$Ch7[)F_>Z6Bl8$6BmO?3@rH4'F`_1;Cgh?sATMr9E,oZ1
F<GX=H=\42DfQt5Bm+'*+CoG*F)Q)@E,oZ1FE;/BATMp2Ec`FCEbTE5+EM7CATJu&F!+n4@qBOg
Bl7Q+F`(o5F_)[oBQ%p5+F##&Df02=                                            ~>
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
1E\P#-p0UR/mg=U-Ql>^<C]k`8PW5Q:e;d.9iX\[;FsV_;b:.];]p%"Bl8$6BmO?3FCAWpAKZ&2
F_>Z6Bl8$6BmO?3+EMIAFDu87DKKr6H=_.F.4cl00I/>$/1<V34=>2eF_>Z=FCfJ?.4cl00I/>$
/1<V7,VUYu-p07-2'aq20fUjA0Jb=?2D[*E0f_!E+>PW*3&!'@1G1UH3AWBK1,q$31,(FB0JP7<
/iP[H2`*KR1GL"-0JPO@0ebC92`<ZR3&E<L2]sk00fUjA0JkC@2D['G2`*?G+>PW*3&!'@1G1UE
1GUa@3AN?41,(FB0JP7</iP[F2)I9L1H$@20JPO@0ebF:2`<TP2_d-H2]sk00fUjA0JkC@2`!EM
2_d'J+>PW*3&!'@1bL^F1GLdH1c-p9/1<V7,VUYu-p07=0fUjA0Jb=?2`*3E1H73G.kiS00JG7?
2D[?J2`NTR2)7*F1GCO5BeD.`0e"Y%4>8$7.4cl00I/>$/1<V7.4cl00I\P$4>838-p014/3GT~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
