NB. JOD dictionary dump: 12 Jun 2018 10:36:51
NB. Generated with JOD version; 0.9.996 - dev; 19; 4 Jun 2018 09:24:59
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
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


CheckRealDateFiles=:3 : 0

NB.*CheckRealDateFiles v-- wordtext
NB.
NB. monad:  CheckRealDateFiles ??
NB. dyad:  ?? CheckRealDateFiles ??

paths=. tslash2&.> '/'&beforelaststr&.> y
paths ,&.> 'realdate-'&,&.> (#'manifest-') }.&.> '/'&afterlaststr&.> y
)

MirrorImageXrTables=:3 : 0

NB.*MirrorImageXrTables v-- scan all manifest files and return image and album xref tables.
NB.
NB. monad:  ((<btcl) , <btcl) =. MirrorImageXrTables clRoot
NB. 
NB.   k=. MirrorImageXrTables 'c:/SmugMirror/Mirror'
NB.
NB. dyad:  ((<btcl) , <btcl) = clPat MirrorImageXrTables clRoot
NB.
NB.   'changes-*.txt' MirrorImageXrTables 'c:/SmugMirror/Mirror' 

'manifest-*.txt' MirrorImageXrTables y
:
NB. z locale !(*)=. dirtree
kw=. 2 # <0 0$a:
if. #files=. dirtree (tslash2 y),x do.
  NB. for each manifest file there is a real date file
  'missing real date file(s)' assert fexist rdfiles=. RealDateFrManifest 0 {"1 files

  NB. all manifest/real date files have same layout get headers
  head=. 0{readtd2 ;0{0{files
  'image album'=. head i. ;:'ImageKey AlbumKey'
  'missing (ImageKey, AlbumKey) column(s)' assert (image,album) < #head

  rdhead=. 0{readtd2 ;0{0{rdfiles
  
  NB. merge all manifest files - reduce on image key and insert real date column
  kw=. ; }.@readtd2&.> 0 {"1 files
  kw=.kw #~ ~: image {"1 kw

  rd=. ; }.@readtd2&.> 0 {"1 rdfiles
  rd=.rd #~ ~: rdimage {"1 rd

  imgtab=. head , kw
  imgalbxref=. ((image,album) { head) , (image,album) {"1 kw
  NB. unique image table & image x album cross reference
  (<imgtab),<imgalbxref
else.
  kw
end.
)

MirrorImageXrefTables=:3 : 0

NB.*MirrorImageXrefTables v-- scan all manifest files and return image and album xref tables.
NB.
NB. monad:  ((<btcl) , <btcl) =. MirrorImageXrefTables clRoot
NB. 
NB.   k=. MirrorImageXrefTables 'c:/SmugMirror/Mirror'
NB.
NB. dyad:  ((<btcl) , <btcl) = clPat MirrorImageXrefTables clRoot
NB.
NB.   'changes-*.txt' MirrorImageXrefTables 'c:/SmugMirror/Mirror' 

'manifest-*.txt' MirrorImageXrefTables y
:
NB. z locale !(*)=. dirtree
kw=. 2 # <0 0$a:
if. #files=. dirtree (tslash2 y),x do.
  NB. all files have same layout get header
  head=. 0{readtd2 ;0{0{files
  'image album'=. head i. ;:'ImageKey AlbumKey'
  'missing (ImageKey, AlbumKey) column(s)' assert (image,album) < #head
  kw=. ; }.@readtd2&.> 0 {"1 files
  imgtab=. head , kw #~ ~: image {"1 kw
  imgalbxref=. ((image,album) { head) , (image,album) {"1 kw
  NB. unique image table & image x album cross reference
  (<imgtab),<imgalbxref
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
  if. #keys=. <;._1 keys do. s: keys else. kw end.
else.
  kw
end.
)

RealDateFrManifest=:3 : 0

NB.*RealDateFrManifest v-- real date files from manifest files.
NB.
NB. monad:  pl =. RealDateFrManifest blclManifestFiles
NB. 
NB.   RealDateFrManifest 0 {"1 dirtree jpath '~temp/manifest-*.txt'

NB. assumes use of (dirtree) - hence / path delimiter
paths=. tslash2&.> '/'&beforelaststr&.> y
paths ,&.> 'realdate-'&,&.> (#'manifest-') }.&.> '/'&afterlaststr&.> y
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o3$:1:0k568@<?'TBl\64E`d?nAjg*'67s`tEb/[$APHlZEc5u#Eb/iN@N]bE/KePD
ART[l+EMO=Blmo/D/"$2DfU)CAS*&q@<>pe@<6!4%15is/e&._67sC(ATD6gFD5SQ%15is/g)8G
$;No?+CfG'@<?'k3Zp130fWojDD4!Y$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>_AT;j,Eb-@@A79Rg06;,LBlmo6%13OO
:-pQ_A7]^kDId<rFE7lu:-pQU-n6Z/3Zq"2@:s.YF)c"=8SqmKAO1-AF_t6$AS,:jEGQ'k:-pQ_
ASu$hAT23uA7]Y#Et&Hc$;#)CB4YFkEGRd!+=Jod3Zp+*%16TcART[l+EV%$Ch4_\D..'g%144#
-qS8aB4X_IGp%3?G]Y'GDfd+>F_kk:E,oZ0@<-W9CLqcB%144#+@0gQF_sc_Gp%3?G]Y'GDfd+>
F_kkF%144#+@^']APQZNAKZ)+G]YJG$6UH66#pIKBm+&u9ggi]FCf]=/.Dq/+<Wsj@q]S"ARn_R
H=\45DKKH&ATB=2$6UH69OW$WFEM,*+D,G.@<=%0$6UH69Q+f]BlnK.AKYT$Ddd`=%144#+@0gc
BlnK.AKY])FCf)rE\%Y,+<Ve&EbT0#DII?PASGdjF<G:8FCf)rE\%Y,+<Ve&EbT0#DII?_Bk2=!
+DG_8AS5Rp/.Dq/+<X['Ci<`m6t(1K+Cno&ALn8t+<Ve#@<6NjE+EC!ARloo@<?'3%144#+B<Gr
+EV1>F=[k.+<Ve+BQ\0$DII6q<H;muFCf]=/.Dq/+<X<gH$=1IA9/l8AU&;J%144#+@BRVFD5Z2
+EV1>F=@Y+.1HUn$>F@%?ZU4'4ZX]60H`D!0I[G<0.J)kBl8!3Cij39+ES`J+=]#R$=e*f@<?''
FCAWpAKY](GRY!&+=Lr@+EV1>F<GI>F<GIDChtX3$6UH6@;I'.AU&;>DJsV>DKTc3/0GB/+<VeG
EbTB!Ed8dCAU,\<D(Hf<CageB$7P                                              ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0esk++>Y,p2BXat2`3EZEb/[$APHlZEc5u*F)c"O2%9n&Eb/[$AKZ)'@VfTu8SqmKAISth+=Kfu
@:s.EAU,D?AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<Wsd@WcN\AU,D?AU&;>DJsV>DKTc3
/.Dq/+<X6m@:s.@Bl%?'FCf]=/.Dq/+<Wsj@q]S"ARnM'2'@!PG]YJG$6UH66#pIKBm+&u;e^Ph
+DG_8AS5Rp/.Dq/+<X?dFD5i>A7ZlqCi<a(/.Dq/+<X?rDJ*[*F_#&+Ao)BoF=[k.+<VdmCijB5
F_#&+Bl8$(B4Z*7%144#+A[#lB5)6lCe/,OB4uB0Bl8$(B4Z*7%144#+A[#lB5)6lCfb=]FD)e2
DKKH&ATB=2$6UH6;Is9Q6t(1K+Cno&ALn8t+<Ve,E,9H$A40jJAKYMlFCd!4$6UH69OW!a<H)JW
FCeu*A79Rk/.Dq/+<X[)BcqM/G]YJG$6UH6<+pDk@W#UgCfPLl+EV1>F=[k.+<Ve"AU/K<Eb'56
FCf]=/.Dq/+<X$[E-,f4DBO%4G]YAr%13OO@rc-hFCcS:@:F%a+A$EYB4XAF@WcNiEX`?u+=Kfu
@:s.EAU,D?AU&;>DJsV>DKTc3/.Dq/+<Wsd@WcN\AU,D?AU&;>DJsV>DKTc3/0GB/+<VeGEbTB!
Ed8dCAU,[qD..'g94`B"+@0gQF_sc_Gpt1(%13OO@rc-hFCcS:@:F%a+A$EYB4X_IH$=1IA6<j]
$6UH>8SqmKAP6T[+EV1>F<GI>F<GIDChtX3$6UH694`BmDfTA2FCf]=+Du+>+Du=<Cb-#&+<VeG
EbTB!Ed8dCAU,[qD..'g94`B"+A69kGAhM4.4I=f$4R>PEb/[$AKZ)'@VfTu6#:"QD%-gp+=KNl
@WcN\AU,D?AU&;>DJsV>DKTc3+E2@8D..I1+DYP6/.Dq/+<X6m@:s.EAU,D?AU&;>DJsV>DKTc3
.6@tG+<Vd                                                                 ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' MirrorXref AlbumXref ExtXref MirrorImageXrefTables Mirror'
zz=:zz,'Images MirrorKeywords MirrorMD5 MirrorMD5s MirrorXref PathXref Volu'
zz=:zz,'meXref''                                                            '
zz=:141{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkciARfLRARTCC@<?'MBl%@%+AHQjEc5tiD..'g=E7AL@VfUs+AHQjEc5ti
D..'g=E7tb<+06PATJtgBl\64E_BthGAhM4F!+@l@;J>?FCdp^9jqpRAn?%*-RgSp4=iTB@rc-h
FCe0\EcQ)==E7tb6t.Mm/1<V34=<j;EcQ)==E7tb-RgSp4>8$7.4cl0/3G:IEb/[$APHlZEc5u*
F)c"D.4cl01*AG"1,(FB0K(X@/i,LD2`!0E1E\G,0fUjF0et@<0K(aJ2`3QN+>PW*3&!6F0eP=>
3B/cQ3&i]:1,(FB0K(X@/i,CF3&N]R3&2U30JPO@2DHs>1b^XE2D@*J2]sk00fUjF0et@;3ArTJ
0f:gE+>PW*3&!6F1+kC<2E!?O2_d'11,(FB0K(X@/i,FC3B/iU3B/-:0JPO@2DHs>1H%3P2*!NR
1*A>+0fUjF0et@<0Jb[H2)RBK.4cl01,(FB0K(X?/i5LA1,^jD3&<'l1,(FB0K(UF/i5LA1,^jD
3&<$u/hnJ(.4cl01,(FB0K(X@/i,CE2_mBK1Gp[i1,(FB0K(X>/i,CE2_mBK1GpXr/hnJ(.4cl0
0I/>$/1<V90JPO@2DHp=2)@3H3B8rR3%H[83&39I1,_*G2_d'J1H70E3@\_q1*A;#/1<V7.4cl0
0e"Y%4>A99-p014/3GT                                                       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
