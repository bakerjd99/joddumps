NB. JOD dictionary dump:  6 Feb 2018 22:15:02
NB. Generated with JOD version; 0.9.993 - dev; 3; 27 Jan 2018 12:39:04
NB. J version: j806/j64/windows/release/commercial/www.jsoftware.com/2017-11-06T10:03:54
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


AlbumXref=:,:<;._1 ' albumid mirpathid albumsize albumname'

ExtXref=:13 3$<;._1 '|ext|extlong|extdesc|apf|afphoto|affinity photo layer file|psd||photoshop layer file|jpg||jpeg file|tif||tagged image format file|png||portable network graphic file|pdf||portable document format file|gif||graphic image file|nef||nikon raw file|eps||encapsulated postscript|ps||postscript|jp2||jpeg 2000 file|dng||digital negative'

MirrorXref=:,:<;._1 ' orgvolid orgpathid orgext orgimagehash mirvolid mirpathid mirext albumid mirimageid orgfile mirfile'

NOPIXELSKEY=:'0z0'

NORATIOKEY=:'0z1'

PathXref=:,:<;._1 ' pathid pathdesc pathtype path'

SMUGPRINTDPI=:360

SMUGPRINTSIZES=:<;._1 ' 3.5x5 4x5 4x5.3 4x6 4x8 5x5 5x6.7 5x7 5x10 5x30 7x10 8x8 8x10 8x10.6 8x12 8x16 8x20 8.5x11 9x12 10x10 10x13 10x15 10x16 10x20 10x30 11x14 11x16 11x28 12x12 12x18 12x20 12x24 12x30 16x20 16x24 18x24 20x20 20x24 20x30'

SMUGPYTERSIZES=:<;._1 ' 3.5x5 7x10 4x5 8x10 4x5.3 8x10.6 4x6 8x12 4x8 5x10 8x16 5x5 8x8 10x10 5x6.7 5x7 5x30 8x20 8.5x11 9x12 10x13'

VolumeXref=:3 3$<;._1 '|volid|volume|voldesc|0|c:\|c drive on local machine|1|d:\|usb drive(s) (usually mounts on d)'

printsizekey_basictestdata=:16 3$<;._1 ' ImageKey OriginalHeight OriginalWidth 4wqd5Hr 3021 2014 K7JKbs8 2036 3122 nFRxBh2 2665 3731 xCdD7V8 2585 1736 sTXnpLm 2192 3289 VG2s4WG 3659 2613 kNRs3X8 1694 2543 Qjs2hr6 3848 2559 qbXqVgC 2633 3949 ZdzNXm3 1162 2506 vF4Bwpg 2531 3542 7WbqpMj 3211 2566 2cCVDMK 1846 2398 36kBgrv 2396 1991 2FzVqjP 1887 2398'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


MirrorImages=:3 : 0

NB.*MirrorImages v-- scans all manifest/changes files and returns image keys as symbols.
NB.
NB. monad:  sl =. MirrorImages clRoot
NB. 
NB.   k=. MirrorImages'c:/SmugMirror'
NB.
NB.   NB. first ten images occurring in more than one gallery
NB.   10 ,.@{.&.> ofreq k
NB.
NB. dyad:  sl = (clPat ; caDel) MirrorImages clRoot
NB.
NB.   ('changes-*.txt';';') MirrorImages 'c:/SmugMirror' 

('manifest-*.txt';';') MirrorImages y
:
'pat delim'=. x
NB. z locale !(*)=. dirtree
kw=. 0$s:<''
if. #files=. dirtree (tslash2 y),pat do.
  NB. all files have same layout get position of images
  head=. 0{readtd2 ;0{0{files
  keypos=. head i. <'ImageKey'
  'no (ImageKey) column' assert keypos < #head
  NB. define key extraction verb
  kdv=. }.@(keypos&{"1@readtd2)
  s: ;kdv&.> 0 {"1 files 
else.
  kw
end.
)

MirrorKeywords=:3 : 0

NB.*MirrorKeywords v-- scans all manifest/changes files and returns keywords as symbols.
NB.
NB. monad:  sl =. MirrorKeywords clRoot
NB. 
NB.   k=. MirrorKeywords 'c:/SmugMirror'
NB.
NB.   NB. top 25 keywords
NB.   25 ,.@{.&.> ofreq k
NB.
NB. dyad:  sl = (clPat ; caDel) MirrorKeywords clRoot
NB.
NB.   ('changes-*.txt';';') MirrorKeywords 'c:/SmugMirror' 

('manifest-*.txt';';') MirrorKeywords y
:
'pat delim'=. x
NB. z locale !(*)=. dirtree
kw=. 0$s:<''
if. #files=. dirtree (tslash2 y),pat do.
  NB. all files have same layout get position of keywords
  head=. 0{readtd2 ;0{0{files
  keypos=. head i. <'Keywords'
  'no (Keyword) column' assert keypos < #head
  NB. define key extraction verb
  kdv=. }.@(keypos&{"1@readtd2) 
  keys=. ;kdv&.> 0 {"1 files
  keys=. (;delim ,&.> keys) -. ' '
  if. #keys=. <;._1 keys do. kw=. kw, s: keys end.
else.
  kw
end.
)

MirrorMD5=:3 : 0

NB.*MirrorMD5 v-- scans all manifest/changes files and returns image MD5s as symbols.
NB.
NB. monad:  sl =. MirrorMD5 clRoot
NB. 
NB.   k=. MirrorMD5'c:/SmugMirror'
NB.
NB.   NB. first ten images occurring in more than one gallery
NB.   10 ,.@{.&.> ofreq k
NB.
NB. dyad:  sl = (clPat ; caDel) MirrorMD5 clRoot
NB.
NB.   ('changes-*.txt';';') MirrorMD5 'c:/SmugMirror' 

('manifest-*.txt';';') MirrorMD5 y
:
'pat delim'=. x
NB. z locale !(*)=. dirtree
kw=. 0$s:<''
if. #files=. dirtree (tslash2 y),pat do.
  NB. all files have same layout get position of MD5s
  head=. 0{readtd2 ;0{0{files
  keypos=. head i. <'ArchivedMD5'
  'no (ArchivedMD5) column' assert keypos < #head
  NB. define key extraction verb
  kdv=. }.@(keypos&{"1@readtd2)
  s: ;kdv&.> 0 {"1 files 
else.
  kw
end.
)

MirrorMD5s=:3 : 0

NB.*MirrorMD5s v-- scans all manifest/changes files and returns image MD5s as symbols.
NB.
NB. monad:  sl =. MirrorMD5s clRoot
NB. 
NB.   k=. MirrorMD5s 'c:/SmugMirror'
NB.
NB.   NB. first ten images occurring in more than one gallery
NB.   10 ,.@{.&.> ofreq k
NB.
NB. dyad:  sl = (clPat ; caDel) MirrorMD5s clRoot
NB.
NB.   ('changes-*.txt';';') MirrorMD5s' c:/SmugMirror' 

('manifest-*.txt';';') MirrorMD5s y
:
'pat delim'=. x
NB. z locale !(*)=. dirtree
kw=. 0$s:<''
if. #files=. dirtree (tslash2 y),pat do.
  NB. all files have same layout get position of MD5s
  head=. 0{readtd2 ;0{0{files
  keypos=. head i. <'ArchivedMD5'
  'no (ArchivedMD5) column' assert keypos < #head
  NB. define key extraction verb
  kdv=. }.@(keypos&{"1@readtd2)
  s: ;kdv&.> 0 {"1 files 
else.
  kw
end.
)

degeotag=:3 : 0

NB.*degeotag v-- remove geotagged keyword from images with nonzero latitude and longitude.
NB.
NB. monad:  btcl =. degeotag btclImages
NB.
NB.   img0=. readtd2 'C:\SmugMirror\Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg-w.txt'
NB.   img1=. readtd2 'C:\SmugMirror\People\GreatandGreaterForebearers\manifest-GreatandGreaterForebearers-XghWcL-11.txt'
NB.   img2=. readtd2 'C:\SmugMirror\Themes\Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz-16.txt'
NB.
NB.   degeotag img0
NB.   degeotag img1

'geotagged' degeotag y
:
d=. }.y [ h=. 0{y
'missing (Keyword, Latitude, Longitude) column(s)' assert -.(#h) e. 'k l b' =. h i. ;:'Keywords Latitude Longitude'

NB. items with nonzero latitude or longitude
lb=. (l,b) {"1 d
if. 0=#p=. I. +./"1 ] 0 ~: (0 < #&> lb) * 0&".&> lb do. y return. end.

NB. items with (x) keyword
t=. (<p;k){ d
if. 0=#q=. I. +./@(x&E.) &> t do. y return. end.

NB. remove (x) keyword(s)
h , (x rekeyword t) (<p;k)} d
)

dpiarearatio=:3 : 0

NB.*dpiarearatio v-- print area and aspect ratio for image dimensions at given DPI.
NB.
NB. monad:  fa =. dpiarearatio ilWidthHeight
NB.
NB.   dpiarearatio 2000 3000
NB.   dpiarearatio |: 10 # ,: 4888,3256
NB. 
NB. dyad:  fa =. faAspectDP1 dpiarearatio ilWidthHeight
NB.
NB.   0.0005 0.05 500 dpiarearatio 2000 3000

(SMUGASPECTROUND,SMUGAREAROUND,SMUGPRINTDPI) dpiarearatio y
:
'aspect area dpi'=. x
(area round (*/y) % *: dpi) ,: aspect round (<./y) % >./y
)

geotag=:3 : 0

NB.*geotag v-- add geotagged keyword to images with nonzero latitude and longitude.
NB.
NB. monad:  btcl =. geotag btclImages
NB.
NB.   img0=. readtd2 'C:\SmugMirror\Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg-w.txt'
NB.   img1=. readtd2 'C:\SmugMirror\People\GreatandGreaterForebearers\manifest-GreatandGreaterForebearers-XghWcL-11.txt'
NB.   img2=. readtd2 'C:\SmugMirror\Themes\Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz-16.txt'
NB.
NB.   geotag img0
NB.   geotag img1

'geotagged' geotag y
:
d=. }.y [ h=. 0{y
'missing (Keyword, Latitude, Longitude) column(s)' assert -.(#h) e. 'k l b' =. h i. ;:'Keywords Latitude Longitude'

NB. items with nonzero latitude or longitude
lb=. (l,b) {"1 d
if. 0=#p=. I. +./"1 ] 0 ~: (0 < #&> lb) * 0&".&> lb do. y return. end.

NB. items without (x) keyword
t=. (<p;k){ d
if. 0=#q=. I. -. +./@(x&E.) &> t do. y return. end.

NB. insert change(s)
h , (((<x,'; ') ,&.> q{t) q} t) (<p;k)} d
)

printsizekey=:3 : 0

NB.*printsizekey v-- j version of python (print_size_key).
NB.
NB. monad:  st =. printsizekey btclManifest
NB.
NB.   mf0=. readtd2 'C:\SmugMirror\Places\Overseas\Ghana1970s\manifest-Ghana1970s-Kng6tg.txt'
NB.   mf1=. readtd2 'C:\SmugMirror\Themes\Diaries\CellPhoningItIn\manifest-CellPhoningItIn-PfCsJz.txt'
NB.   printsizekey mf0
NB.   printsizekey mf1
NB.
NB. dyad:  st =. iaDpi printsizekey btclManifest
NB.
NB.   720 printsizekey mf1

SMUGPRINTDPI printsizekey y
:
NB. image keys and dimensions 
d=. y {"1~ (0{y) i. ;:'ImageKey OriginalHeight OriginalWidth'
f=. |: _1&".&> d=. 1 2 {"1 }. d
'invalid image dimensions' assert 0 < ,f

NB. default print size keys
'area ratio'=. (SMUGASPECTROUND,SMUGAREAROUND,x) dpiarearatio f 
keys=. (#ratio) # s: <NORATIOKEY

NB. print sizes for image ratios
pst=.  SMUGASPECTROUND printsizestable SMUGPYTERSIZES
ast=.  ;0{"1 pst
m0=.   ratio e. ast
idx=.  (ast i. ratio) -. #ast
pst=.  idx { pst

NB. images without enough pixels
area=. <"0 m0 # area
m1=.   (1 {"1 pst) <&.> area
m2=.   +./&> m1
keys=. (s: <NOPIXELSKEY) (I. m0 #^:_1 -. m2)} keys

NB. largest print sizes for enough pixels
sizes=. ,(I.@lastones&.> m2#m1) {&> 2 {"1 m2#pst
keys=. sizes(I. m0 #^:_1 m2)} keys

NB. image keys, print size keys, pixels
NB. smoutput (<"0  m0 # keys) ,. area ,. pst 
(s: }.0 {"1 y) , keys , |: s: d 
)

printsizestable=:3 : 0

NB.*printsizestable v-- computes print sizes table.
NB.
NB. monad:  bt=. printsizestable blclPrintSizes
NB.
NB.   printsizestable SMUGPYTERSIZES
NB.   printsizestable <;._1 ' ',reb '10x10 20x30   3x2 2x3 12x8  8x12 10x10   '
NB.
NB. dyad:  bt=. faPrecision printsizestable blclPrintSizes
NB.
NB.   0.00005 printsizestable SMUGPYTERSIZES   

SMUGASPECTROUND printsizestable y
:
sizes=. sortprintsizes y
ratios=. ".&> 'x%'&charsub&.> sizes
areas=.  ".&> 'x*'&charsub&.> sizes

NB. sizes with same ratio, eg: 4x5, 8x10, 4x6, 8x12
aspect=. ((~.ratios) i. ratios) </. i. #ratios

NB. columns: ratio, areas, print sizes
(<"0 x round ~.ratios) ,. (aspect {&.> <areas) ,. s:&.> aspect {&.> <sizes
)

rekeyword=:[: 2&}.@;&.> [: '; '&,L:0 ([: <;._1&.> ';' ,&.> ' ' -.&.>~ ]) -.&.> [: < [: < [

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

NB. aspect ratio and print area (square inches)
'areas ratios'=. (SMUGASPECTROUND,SMUGAREAROUND,x) dpiarearatio |: idims

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
0ebC+0fL41+>GVo2Du[41a"\5+>GPm2Du[40d&A.+>GPm3%uI01*AG4+>G\q1cHO31a"\9+?1K&
1*A;,+>tqs2BXn:+>GVo1H$@22BXb7+>G_r1,^78+>tqs0f1"00H`),+>kiIBl\64E_1+VB4Z.*
@ps7r+CT)&+DkP)BkCptF>%-;@;]^hF!,(/Ch7Z1@;]TuEb0?8Ec,q@Bl.9kAKYc"H#k*:F!,OL
D.7F"F%p@hEc5tkAU/K<Eb'64@ps7r+CT)&+DkP)BkCptF>%-;@;]^hF!,(/Ch7Z1@;]TuEb0?8
Ec,q@CLqd8DfTB0+CT=6F*VV3DesJhBl\64E_SqZF)ti"DK?q/Cht52@;]dkATMrH@q]:gB4Z-,
Anc'mF!+n/A0>o(FEMVAF!,16@:s-o9ggj[+CT=6F*VV3DesJi:JaVb78-WQ79OD;H$=1IA0>T(
A8,O^FD5W*+DG\$B4W2rBl.F!F(oQ1F!,RC+EMC.Cht5+DfQt>EbTE5+EM7CATLUB;F+8R:J4,Z
CLqd8DfTA2Bl7Hq@psInDJ()+D..'g+Co2'ASuR'Df-\.D]iq9F<GF/FCSu,E,oZ1F<GX=H=_.?
/KeqLDKBo.DId0rA0>r,@;oe!;b^7^:f9k[<('PSA7]@]F_l.BE,oZ1F<EtJ8K]T-F(KG9FDi:$
BQ\0$F&6[qF!,=.@rcK1G%#30AKYo'+>Yo0;b^7^:f9k[<)Z@l78m]4+E(j7;eU)iF<GfN9Q+f]
+=LrA@q]Fp.3MQ+F_=EkB-;/6Bl8#8F(or3F&Pe57o3>f78d&U>")A/EbTE5+EM7CATJu9BOQ!*
D..NrBHVJ,Cis;3Bl5%cF`;VJATAo2DffQ"Df9E4+CT.u+Ad?*BQ%c2F(96)E--/3AS5RmFCAg&
ASl@/AKYVsDffE#B4YTrCLqd8DfTA2Ao_g,+DG\$B4Z-,GA2/4+Du+8H=_,8+DbJ.BlnK.AKYE!
A0>],DJ*[*F_#&oE+ra$ARTUfFD5Z4EbTE5+CT;%@3AurA0><%E+NO$+ECn4Bl>,+DfQt7D..'g
+Co2'ASuR'Df0V=@<<W)Bm+'*+@K$tB4Z"'@:s"ZA0>MrDffE#B4YTrCLqd8DfTA2FDi:9D..'g
F!,[@FD)e7Df0l4Ec3(:@<?4*F_#&+@;]TuCi=3(BlnK.AT2[(DKKr6H=^l'H"nIFATDj+Df-\9
Afu&<FD,T1+=M2LBl8$"F(or3?Ya4u.<'<ADKKr6H=^l'H!b#hF(o-+ATMs(@<>q"ATMr9A79Rg
+D,P4+=M2LBl8$6BmO?+AU,_DEbTE5F(or3F*(i"Ch7*pD/aW>ATJu5EbTE5+EM7CATJu9@:F%a
Eb0#tH$=1IA9)6uDg#\7CLqd8DfTA2Ao_g,+C].sC`mM)H$=1IA0>r8EbTE(F!*%WF(Jo*Ci=3(
+CoD#F_t]-F=qWOF_>Z6Bl8$6BmO?3@rH4'F`_1;Cgh?sATMr9E,oZ1F<GX=H=\42DfQt5Bm+'*
+CoG*F)Q)@E,oZ1FE;/BATMp2Ec`FCEbTE5+EM7CATJu&F!+n4@qBOgBl7Q+F`(o5F_)[oBQ%p5
+F##&Df02=                                                                ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*AS"2)[41ASYk&GAhM4.WT*9AU/K<Eb$;9/M/)cASl@/AKYc"H$=1IA0>K)Df$V+Ch%9(
CLqd8DfTA2F*)G:DJ+#C%13OO<+oue+Eh=:@NZe6ASl@/ATJt:@rH7,BkM@,F!)T7Cgh3s+D,Y*
AKZ&:@WQX3Bl7Q++DYP6GAhM4Et&IuBOQ!*+CoC5DJsV>@rH7,@;0U%-T`[uAo_g,+CQB8@VfOj
+E(j7CLqd8DfTA2F*)G:DJ+#C+B3#c%170%DKK<3+E(j7CLqd8DfTB0+<YB>+E):7ASuU$A0>u4
G@>N&+<Yc>AKW+:FE2)5B6,29ATW'8DIm>f$>+<sD'3q6AKXogF_=EkB-:)@;cFl*:e<8K$4R>c
ATD6gFD5SQ%13OO+<XEG/g+_ME,95uBlkJ.AS,XoBln'-D@Hpq+ED%/AU/K<Eb%<o+>GYp3Zodu
1+%E%5W^DA/j:C+-mpB(+=AN`/1D]83Zp+*+=K?6/mg=[/j:C*-T`\'+=nil4s5+n/M8A&4s24#
+=ANc+>#2m/j:C?4Er4_$4R>QH!t5E+<Y-0@r*8N/g+Y?+ED%/AU/K<Eb$;%Ch%8j$4R=b+DYP6
F$2,u-Za3E4!80IDffE#B4YU8+CT+K+DE2b-Z*EV+D58(FCAfpARmkF@Vg0u?Y!ScCHEXmH8.K(
FDl(F%144#-YI"/FCAfpARm/2Eb0#tH$=1IA0>Z!H#jE%%13OO%13                     ~>
)
showpass 0 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&p0H`),0Jm`hBl8$6BmO?+AU.Wl@<6-m0JH6g/h1g\Bl8$6BmO?+AU.Wl@<6-m0JFVj
/M/)S@<6-m+EV19FE8R:DfQsKE,oZ1FE;/BASYk&.4u&::-pQB$;No?+Eh=:@UX@mD)reJF)uJ@
ATJtBE,oZ1FE;/BASYk&.3N&:A0>DoE+NotASuU2+Dbt)A7]9oBl8$2+C\c#AKYf-@ps1b/e&._
67r]S:-pQU+<Y<.FE2UK4$"a.EbTE5F(or3CLqc6E,oZ1FE;/BASYk&?XdGbBk)6rF*(r$FC?O>
%15is/e&._67sBjEb/[$ARmhE1,(FBC12!70F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
3,2l>0f'qaBl7?q+E1b1F(Jl)D.Rd0@:s-o@:Wn[A.8l@67sB83,2l>0f1"jDffP5F`V+:De:+?
;b^7^:g$ad;H$.j78kWX@X0(EE,oZ1FE;/BASYk&.1HUn$;No?+DG_:@;KXg+DG\$B4W2rBl.F!
F(oQ1Et&IqF*'Q++E2@8DKKr6H=^l'H!b#hF(o-+ATMs(@<>oe$4R>;67sB7+E2%>AS`K"Bl.F!
F(oQ1Et&IqF*'*!3Zoh5-SQns+=K?#I4f4d+<tiHF=B:++>PBo+E2CD%13OO:-pQUFD,]5GB4m8
F)to5FD5Z2+>"^YF(KD8-rWi?7o3>f78d&U>")@=%14M&EbTE5F(or3CLqc63]\B<3[l1jF*')F
$4R>;67sBuAS5FnBm+&1E+sQ.C`m8&D.RU+Bl@m1%17&qF>,j=+=K?"/Mf(..3L$$."*^^/g)BX
F*&im0d&5#I3<KMF:AQd$;No?+EV:;Dg-7F@<6L$Ecc#6D@Hq$E,oZ1FE;/BASYk&+?DP+0fga+
E-$+T%13OO:-pQUDJsV>ASuF/B4rE,Bm=3*Et&IqF*'*!3Zoh5-S[;&.3L$$."*^^/g)BXF*&im
0d&5#I3<KMF:AR*F#lEY:JaVb78-WQ79M&^4WlI%HQ[9JBl8$6BmO?+AU,D;F*')F$4R>;67sC$
@<?4%F!,@=F<G:8+E2@8DKI"BBmO>5FCAWpAISucF*'*!3Zoh5-SdA00IJ:l-p/o+/nlp\,B.^G
.6B75I3<KMF:ARrF*'*!3Zoh5-T<_50IJ:l-p/o+/nlp\,B.^G.6B:6I3<KMF>+.2.!%F3:/=bR
<(TkY79M&^4WlI%HQ[9JBl8$6BmO?+AU,D;F*')F$4R>;67sC$ATW'8DBNe)G\M#;D'3n6H=\42
DfQt/Cht57@<?4%Et&IO67sC)BOu'(D/XH++EV:*DBNM.Dfo]++E2%>AScDs$?L914ZX^43[-:$
;b^7^5uUTK6W?rZ<DGq)E,oZ1FE;/BATMs%@VfTu;b^7^:g$ad;H$.j78jX&Bl.BpD0%j$+<iin
/j:C?+tt-'/i#+70Ie8!-9`f%+=ALGBOPq&F^c[M4s2^*F#kFj/g`b)F)uF4$4R>;67sBsDdd0!
Cgh?sAKY](@:s-oA8,mlDKBN1DK?6oE-$+T4ZX]6-p0O8E-$+M+=&(DD.I?tF"&4[4=GV1BeCWL
F*&im0d&5#I3<KMF:ARdBkML$H=_.\3ZoOn4?=^+F*&iR,TqFp-9`PnF*%iu@VKIrBmO?3+?^i%
+F>5MEbTE5F(or3CLqc6E-$+T%13OO%14gN5U\?13\i$;.3L!HCht59ATMs7+E1b1F(Jl0%13 ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A>++>Y]jEbTE5F(or3CLqcu@UX=l@k]TG@<6-m+EV19FE8R:DfQsKE,oZ1FE;/BASYk&
.0                                                                        ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n,+>Y,p1*A=p2)7*50fL41+?288E,o]7D09K1H$!V<1,2Nj/h1g\C3+67B5i-<ATAo7/M/)d
ATW'6+EMCBB5i-<ATAo4Ec5](@rs=4$4R>PDe!p1Eb0-1+=CW,F(H^.$?'Gt4$"a1D09K1H$!V<
+EMCBB4PRs+DG\$B4W3,D09J6F`_>6F!i)7+>Y-YA0<6I%16igA7o7`C2[Wi4ZX]5;f-Yi:jI.o
E[M;':-pQUCi<`m+E_a:Ap%o4F`_>6F!,17FDi9MBkhQs.1HVZ67sB.BkhQs-Qm&5F<Gua+D5_6
+=CfBE+<]mF)uJGBl%i<%15is/g)NUC2[W1+D58-+FPjbB6%r6-Y-[tG]Y;B$;No?+=Cl<De(4<
B4Z0-I4cXTEc<-KA7]suBlmp$F(96)E-*H:$7BP&De(4<B4Z0--ZjDW%14IsC2[W1+D58-+=D,K
Bl8$6BmO?+AU.Wl@<6-mFCfN8A79Rg-QjN@$;No?+EM+9+EMCBE-ZP:EZfLGATAo/AU/>+$?L'&
F`_SFF<DrRF(KAbAU/>>Eb0<'F=.M).!0Au:K(484!8l2+=nWi+E2%)CEPGVB4Z0--Za-IB5i-<
ATCdlATCFTH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R
F)?&4E-ZP:EZf=ADe`inF<GX9FEMOF-Za-IB5i-<ATCdlATCFTH#k_u:-pQUF`V,7CLqd4/n8L+
%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jS
BkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*
AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA
$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?
Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3
@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$Hm
Cb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*
FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4kg$:Zd40fr9ED..3k+@C9lEb0-14)APY+DPh*
B-:D$@r,^bEZc_W%15IEEbm6q1-73P;e:%n6ZmEiASuTOEcW?NE,o]7D09K1H$!V<-QlV9De't<
F)?&4E-ZP:E[Mu6+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?
$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]
:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`a
AR]dp+B!?"4(Mf@F`&<L-OgDP2ENWT<+U,m+B*,qCLoS5E,oZ1FE;/BASYk&+E2@8DKKr6H=^l'
H!b#hF(o-+ATMs(@<>oe$<(VPAooOm2ENWT<+U,m+@9LXBk'4Z+EDRG+=D,KBl8$6BmO?+AU.Wl
@<6-m0JFj                                                                 ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' MirrorXref AlbumXref ExtXref MirrorXref PathXref VolumeXr'
zz=:zz,'ef''),(<<;._1 '' SmugPyter MirrorImages MirrorKeywords MirrorMD5s NOP'
zz=:zz,'IXELSKEY NORATIOKEY SMUGAREAROUND SMUGASPECTROUND SMUGPRINTDPI SMUG'
zz=:zz,'PRINTSIZES SMUGPYTERSIZES allwhitetrim assert charsub degeotag dpia'
zz=:zz,'rearatio geotag lastones ofreq printsizekey printsizestable readtd2'
zz=:zz,' rekeyword round sortprintsizes tlf tslash2''),<<;._1 '' smugpyter SM'
zz=:zz,'UGAREAROUND SMUGASPECTROUND SMUGPRINTDPI SMUGPRINTSIZES assert char'
zz=:zz,'sub printsizestable round smugprintsizes''                          '
zz=:510{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qk]k@WcNiEb/i*7<ioVEb/i*9keWgDfSEd@:s.m+AHQjEc5tkAU/K<Eb'56
9keWgDfSQ?2'>V-EcQ)=9ggj[+AHQjEc5u#Eb/i*:/=\X=@Gn^91;u+:/=bR<(TkY79La0@<?0b
Eb/i*;b^7^:f9k[<('PS+B)!77o3)T:/k.`>")@4;b^7^:g$ad;H$.j78k=0DesQ5AQWtaAftVq
B4Z"'@:p]nE+ra$ARTUfFD5Y9B4Z"'@:p^%EbTE5F(or3CLqc6E,oZ1FE;/BASYk&?XdGbBk)6r
F*(r$FC?;2EbTE5F(or3F*(i"Ch4`0ASYk&GAhM4+EMCBB5hm*DKKr6H=_.?F)Q)@E,oZ1FE;/B
ATK4J/1<V34=>)gBl8$6BmO?+AU.Wl@<6-m0JFk'/1<VC4"akp+=A:+Bl\64E`d?nAft#hF_=Nr
FCfJ8F)?&4E-ZP:E[N:e-p01/0I\P$4?P\X?SNZN+E2@9F)?&4E-ZP:EZfF?F_>Z=FCfJmF(KAb
AU/>E.4cl01*A>.,Vh&.3&!*A1G1L@0JkIC3&;[40JPO@1,(L:1c-mC0K;$J+>PW*3&!'C0J5=A
0f^pF1Gq081,(FB0JP@;/iYR>0JkdG0fU:20JPO@0f(L93&NEJ3AiNK1*A>+0fUjA1GCF@2)@6H
1c%!E+>PW*3&!*A1G1L@0JkIC3&;[40JPO@0ek@72`3BK3ArcR2]sk00fUjA0eb4=2)@-M1GLmI
+>PW*3&!*A1G1L@0JkIC3&;[40JPO@0ebC92`<HI1GLmF1*A>+0fUjA0Jb=?3B8lM2_m?J+>PW*
3&!'A0ePIF3B8rO0KD-91,(FB0JY=</i5C=1b^mK1E\G,0fUjB0K(OD0K1^B3ANK81,(FB0JP7=
/iP[H3B&oO0eje+0JPO@1,(U=3A<BH1H@3K+>PW*3&!'A0J5:A1GC[B3AN?41,(FB0JP:9/iP^D
0f1jF2DcO30JPO@0ebF:2`<QQ1cRHN0d&5*0fUjB0K(OD0K1^B3ANK81,(FB0JP7;/iP[K2)mEH
3B&'90JPO@0ebF:2`<HH2E*HL0d&5*0fUjB0Jb=<1b^a?3&i]:1,(FB0JY=</i5C=1b^mK1E\G,
0fUjA1GCF@1cI9K0Jb[D+>PW*3&!'C0J5=A3&`iW3AWK71,(FB0JP@;/iY^C2*!NK2)6:00JPO@
0f(L93&NKP0JkRC1*A>+0fUjB0Jb=<1b^a?3&i]:1,(FB0JP:9/iPXD2*!QQ2E)a60JPO@0ek@7
2`3BL3&<9L2'=Y.0fUjB0Jb=<1b^a?3&i]:1,(FB0JP7;/iP[E1,CXF1,9t-0JPO@0ebF:2`<KM
1cR<J2BXb/0fUjA0f1L@1,(I?0f:^F+>PW*3&!*A1G1L@0JkIC3&;[40JPO@1,(U=3ANKJ2)@$D
1E\G,0fUjA0JtIA2`E]R2)-dC+>PW*3&!*A2D.!E3AiKH2E3E61,(FB0JP:=/iGLE0f:[@2BXb/
0fUjA0eb4=2_d$D3&3BK+>PW*3&!'A1bL[B0JtX@0eje+0JPO@1,(U=3A<BH1H@3K+>PW*3&!'@
2(ggI1H%0I0K(X.1,(FB0JP7</iP[E0fCsI1bgF1-p07=0fUjA0eb4=2`WTL1cREL.l/e<0f1gK
1GCLB1H@?O1,Up=BeD.`0e"Y%4>J$8,Vh&.3&!*A1G1L@0ebC?2)cX50JPO@0ekI:1c-sD3A<63
1,(FB0JP7;/iP^G0JbLE1bg+.0JPO@1,(L:1c-p@1GgsJ+>PW*3&!*A2D.!E0f(L<3AE621,(FB
0JP7;/iP^G1GCL<1G^I2-p01/0I\P$4>J$7,Vh&.3&!'A1G1L?1bggD0Jb^31,(FB0JP:</i5F?
1c-sJ1H6L40JPO@0ekI:1c@0H0fD!I+>PW*3&!'A1G1LA2_['F1c70?/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
