NB. JOD dictionary dump: 13 Jun 2018 17:01:56
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


IFACEWORDSputters=:<;._1 ' getmd getsql putmd putpy putsql puttex puttxt putxml'

ROOTWORDSputters=:<;._1 ' IFACEWORDSputters ROOTWORDSputters getmd getsql putmd putpy putsql puttex puttxt putxml'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
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

getmd=:3 : 0

NB.*getmd v-- fetch markdown macro and write as markdown file.
NB.
NB. monad:  getmd clMdMacro
NB. dyad: clPath getmd clMdMacro

NB. !(*)=. jpath
(jpath '~temp/') getmd y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not md' assert '_md' -: (-#'_md'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ md=. MACRO_ajod_ get y do. md return. end.
md=.  ; {: , >1{md
file=. x, '.md' ,~ (-#'_md') }. y
file [ (toHOST md) write file
)

getsql=:3 : 0

NB.*getsql v-- fetch sql macro and write as sql file.
NB.
NB. monad:  getsql clSqlMacro
NB. dyad: clPath getsql clSqlMacro

NB. !(*)=. jpath
(jpath '~temp/') getsql y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not sql' assert '_sql' -: (-#'_sql'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ sql=. MACRO_ajod_ get y do. sql return. end.
sql=.  ; {: , >1{sql
file=. x, '.sql' ,~ (-#'_sql') }. y
file [ (toHOST sql) write file
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1cQU;+>P&o3$:1'0fL430d&22+>ttt0f1"21a"M2+>Ykt0fU:32'=b!1cHO8+>YrDBOt[h;Is9Q
6t(1K7VQ[MF*DPCA9;C-F@eqf6Ub'P;FFH&F`__:EcYr4FCfK)@:NjkGAhM4F!)l&7R9C1=&2^^
;fHl$FCfK6.3N8DDfp"nBl\64E_1+VB4Y1c<+06PATMp&@;[2rCht52@;]dkATMr9Anc'mF!+n/
A0>o(FEMVA+DG\$B4W2oDIakuCgqO(+F%p<Afu2(@VfUs9keWgDfSK^H$=1IA92g%@;^-/@;Ka&
D..<rAn?%*04S[(DJ*O%+D,>(ATJu&DIal1ATW'8DK?q9AU/K<Eb'56@<3Q4H#7#/Ci`KM:K1Ck
;FFH&F`__:EcZ8>Dfd+GDfTB0+=L,`:K1Ck;FFH&F`__:EcWZPB6%p5E)L7UCd_]RAO^]7@;]dk
ATMs6ARTBtA79Rk+D,>(ATJu+Ec5e;D..<rAn?%*+D,>(ATMKqFDYQ#ATVEq+DkP-CLh@-DBNe)
@rcK1@;]TuGB.D>AKYE&+DkP-CLh@-DBNP*Ch76jFE;G<An?'oBHVA9C`mS'@rcK1@;]TuGB.D>
AKYE&+EMO=+D,>(AH                                                         ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
1,9t-+>Y,p2BXat0ekLA+>GVo1*AG23C@gu@<?'TBl\64EaNm-Cbdk$.NhZ"BOu$h+E(j7D/"$2
DfRI@@N]c$@VfUs/g)Vs%13OO@rc-hFCcS:@:F%a+A$EYB4VMZ+<W((D..'g94`AkFCf]=+Du+>
+Du=<C`m\;Bl.:!Gp$m6Gq9C3+<VdmCgqO(94`AkFCf]=+Du+>+Du=<Cb-#&+<Ve&DJX$)AP$`I
B4XPHCh4`2AU&;J%144#+@1$XBPDX$A5,HL+EV1>F=[k.+<VdmEarcsG%G2_BmO>5Bl8$(B4Z*7
%144#+A?3cBlnK.AKYT$Ddd`=%144#+A?]kB5)I1A7ZlqCi<a(/.Dq/+<WsdFD5i>A7ZltDKKH&
ATB=2$6UH6:NC/^Bl7?q87cLJBQPA2DKKH&ATB=2$6UH6:NC/^Bl7?q=(u2eBHV#,FCf)rE\%Y,
+<Ve)ARTCC@<?''A79Rk/.Dq/+<X['Ci<`m6t(1K+Cno&ALn8t+<Ve#@<6NjE+EC!ARloo@<?'3
%144#+B<Gr+EV1>F=[k.+<Ve+BQ\0$DII6q<H;muFCf]=/.Dq/+<X<gH$=1IA9/l8AU&;J%144#
+@BRVFD5Z2+EV1>F=B9\$4R>PEb/[$AKZ)'@VfTu8SqmKAO1-AF_t6$%144#-qS8aB4X_IGp%3?
G]Y'GDfd+>F_kkF%144#+@0gQF_sc_Gp%3?G]Y'GDfd+>F_kkF+:SZ#+<YWDBl.:!Gp$m6Gpl7$
@:s.EAU,gL6#:"QD+eGc.4I=f$4R>PEb/[$AKZ)'@VfTu8SqmKAP6T[GAhM4=E4iX+<W((D..'g
94`AkFCf]=+Du+>+Du=<Cb-#&+<Ve"AU/K<Eb$;7AU&;>DJsV>DKTc3/.Dq/+<YWDBl.:!Gp$m6
Gpl7$@:s.EAU,gL94`BmDfTA;.6@tG%16TcART[l+EV%$Ch4_TCgqO(%144#-p_ZYF_sc_Gp%3?
G]Y'GDfd+>F_kk:E,oZ0@<-W9CLqcB%144#+A$EYB4X_IGp%3?G]Y'GDfd+>F_kkF%144#+A?]`
@;JbKFD+66+DG_8AS5Rp+Du+>+Du=<Cb-#&+<Ve$Bl\64E_1+VB4XPHCh4`2AU&;G3t2N+$=e*f
@<?''FCAWpAKXZb@ps1FD..'g%144#-qnPh@;JMP@:s.C6m-2]FCf)rEZf7<F<GIDCht55EbTB!
Ed8dCAU,g9$6UH69Q+ELCf"P^BLtT7Bl8$(B4Z*+DJsV>DKTc3/.Dq/+<X?r@ps1FD..'g7VQ[M
+EV1>F<GI>F<GIDChtX3$6UH68SqmKAP6T[+EV1>F=[k.+<Ve+BQ\0$F%o%[+EV1>F=B9\$4R>P
Eb/[$AKZ)'@VfTu9Q+ELCf"P^BFP:k+=Kp%@ps1M@<?0S6m-2]FCf)rEZf7<F<GIDCht55EbTB!
Ed8dCAU,g9$6UH69Q+ELCf"P^BHVD.G]Y'GDfd+>F_kkC3t2N>+<V+#+<Ve':K(5"E-68EATDiI
0ht%f:et"h?Z:.0FCfK6+E27?F<GOCDe!@"F)Q(O+:SYe$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8
ATDBk@q?d,DfTA:F"'-Z$;No?+<Ve>ATVd"+<Ve%67sBmATVEq+DkP-CLh@-DBNe)@rcK1@;]Tu
GB.D>AKYE&+DkP-CLh@-DBNP*Ch4%_:-pQU+<Y<.FE;G<+<XEG/g+b;FCSu,F)c"=D.-ppD]iJ+
A0?):Blmo/@<3Q4EGQb0Bl%>i$;No?+<VeGF`_J2+<Ve%67sC%FDl22+AH9bCLh@-DBNA/+A,Et
+EV1>F<GF/@rcL/%15is/g)8ZE-68AGp"4P:-pQUF*)>@AKXfpFD,T1+Cf>#AKYE&+A,Et+EV1>
F<GF/@rcL/%15is/g)8ZE-68DEGQa?:-pQUF*)>@AKXoK9H[bb+A,Et+EV1>F<GF/@rcL/%15is
/g)8ZE-68EAU#=?:-pQUF*)>@AKZ)+GV<lAFCf\>@<3P`:IH=IAU&;>D.-ppDfZ?p:-pQU+<YWG
FEDbL+<XEG/g,4WDfTD3FCf]=+CT=68l%htFCf]=+DkOsEc6".$;No?+<VeGF`_kFC`jiq67sC%
FDl22+BV?3+CT=68l%htFCf]=+DkOsEc6".$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6
+<W%GC2[W1%13                                                             ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' MirrorXref AlbumXref ExtXref MirrorImageXrefTables Mirror'
zz=:zz,'Images MirrorKeywords MirrorMD5 MirrorMD5s MirrorXref PathXref Volu'
zz=:zz,'meXref''),<<;._1 '' putters IFACEWORDSputters ROOTWORDSputters assert'
zz=:zz,' boxopen fboxname fexist getmd getsql justext justfile nc putmd put'
zz=:zz,'py putsql puttex puttxt putxml read toCRLF toHOST toJ tolower winpa'
zz=:zz,'thsep write''                                                       '
zz=:347{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ALu2E<X6F`__:EcXuB/h1g_FED)7F!,NU/Kf4FEbTH7F!,R9G]Y'IF`\aKFD5Q*FD5<-
/e&._67r]S:-pQU+D58-D.Fb3/KeY:FCSu,D..I#A8c[0+DkOsEc3(/DIal6EbTW,+CT=6D..I#
A8c[0+D,>(AISuA67sB'B4Z1+EGQaL+D,2,@q[!+EGQb7@:O=r+CT.u+Eqj?FCcS'F!,ODC`m>(
Ch4%_:-pQU+E2IFD.Fb3/Kf+VDfTD39jr'XA8c[0+CT=68l%htFCf]=+DkOsEc6".$;No?+<YWG
FDuLJ+>"^WFDl22+Ad?*BQ%c2@rGmh+CT=68l%htFCf]=+DkOsEc6".$;No?+<YWGFE;G<+>"^W
FDl22+B)-2+CT=68l%htFCf]=+DkOsEc6".$;No?+<YWGFED)=+>"^WFDl22+EV1>05P'=AU#>+
F!+(N6m-S_G]Y'F@:O=rEt&IO67sB'E-68EG]Y&[+EMXCEb-A8AU&;>@<3P`:IH=IAU&;>D.-pp
DfZ?p:-pQU+E2IFG\q7>/Kf+VDfTD3=A;I3@<3P`:IH=IAU&;>D.-ppDfZ?p:-pQB$;No?+CfG'
@<?'k3Zp130fNrXGqq/b$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GfiF`&rg+Dl%?ARlp*D]gHNFD5Q4.3N/8@ruF'
DIIR2%15is/g)l.C3=DK1E^1GDK]T3FCeu*FDi:3CghC++D5_;E$/e)F<G^JBl%i5@:Wn[A.8kT
$;No?+Dbt)A0>T(FDi9o:IH=>DKKH1Amo1\+Dbt+@;KKa$=e!aCghC++=Cl<De(4)$3       ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkciARfLRARTCC@<?'MBl%@%+A#$g6Ub'P;FFH&F`__:EcW?tBl\64E_1+V
B4Y1c<+06PATJtgBl\64E_1+VB4Y1cAS+nM@VfUs+AHQjEc5tkAU/K<Eb'56;GU(f=&2^^;fHl$
FCfK6+AucZCd_]RAO^]7@;]dkATMr9B4Z1%A0>MrFE;G<-RgSp4=iTB@rc-hFCe0\EcQ)==E7tb
6t.Mm/1<VC4"akp+=A:+Bl\64E`d?nAfu&8FED)7F!iCf-p01/0I\P$4?P\X?SNZN+@C0\@<?'T
Bl\64EaNm-C`lPM;cI+CF`__:EcWTW/1<V9+?:]&0JPO@2DHs>1H@6M1GL[A+>PW*3&!6F1G1OA
2`ETK3AE621,(FB0K(X@/i57?1c[KP3&;[40JPO@2DHp=2)@6P1,h0P1E\G,0fUjF0et@;2E3ZR
3AicO+>PW*3&!6F1G1OA3&!?I3&il?1,(FB0K(X@/i57:3ArQN2)cX50JPO@2DI!?2)I9Q3A`]T
1a"P-0fUjF0f(F=0f(RD0Jk[C+>PW*3&!6F1+k@C2DI!B2)R041,(FB0K(XA/i>IE2`3<M0eje+
0JPO@2DHs>1bgmH1H@BK1*A>+0fUjF0et@;2`*NS1c[QU+>PW*3&!6F1+k@@3&icU2)m?61,(FB
0K(XA/i>IF0KCjI3&i$90JPO@2DHs>1b^^F2Dm?P0d&5*0fUjF0f(F>1cRKU1cRHO+>PW*3&!6F
1G1OA2DQsA1GL[7/1<V90JPO@2DHp=1cI-E2DI$J1Flff0JPO@2D@-D1cI-E2DI$J1Fd)k0d&5#
/1<V9+>P2t0JPO@2DHs>1H%0N1-%*G2'=Y.0fUjF0f(F>1c@?O0K(mH+>PW*3&!6F1+k@@2`EKP
1,Cd11,(FB0K(XA/i>ID3AiKK3&<!7-p01/0I\P$4>J$7,Vh&.3&!6F0eP=>3&*ER2)I981,(FB
0K(XA/i>LA0fLpL0fU:20JPO@2DI!?2)I0N0ekLA2BXb/0fUjF0f(F>2)6mF1c[9M.4cl00I\P$
4>A99-p014/1<V7.4dS8                                                      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
