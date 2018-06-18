NB. JOD dictionary dump: 18 Jun 2018 17:14:03
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


IFACEWORDSputters=:<;._1 ' getjson getmd getpy getsql gettex gettxt getxml putjson putmd putpy putsql puttex puttxt putxml'

ROOTWORDSputters=:<;._1 ' IFACEWORDSputters ROOTWORDSputters getjson getmd getpy getsql gettex gettxt getxml putjson putmd putpy putsql puttex puttxt putxml'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


getjson=:3 : 0

NB.*getjson v-- fetch JOD json macro and write as json file.
NB.
NB. monad:  getjson clJsonMacro
NB. dyad: clPath getjson clJsonMacro

NB. !(*)=. jpath
(jpath '~temp/') getjson y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not json' assert '_json' -: (-#'_json'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ json=. MACRO_ajod_ get y do. json return. end.
json=.  ; {: , >1{json
file=. x, '.json' ,~ (-#'_json') }. y
file [ (toHOST json) write file
)

getsql=:3 : 0

NB.*getsql v-- fetch JOD sql macro and write as sql file.
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

gettex=:3 : 0

NB.*gettex v-- fetch JOD tex macro and write as tex file.
NB.
NB. monad:  gettxt clTexMacro
NB. dyad: clPath gettxt clTexMacro

NB. !(*)=. jpath
(jpath '~temp/') gettex y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not tex' assert '_tex' -: (-#'_tex'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ tex=. MACRO_ajod_ get y do. tex return. end.
tex=.  ; {: , >1{tex
file=. x, '.tex' ,~ (-#'_tex') }. y
file [ (toHOST tex) write file
)

gettxt=:3 : 0

NB.*gettxt v-- fetch JOD txt macro and write as txt file.
NB.
NB. monad:  gettxt clTxtMacro
NB. dyad: clPath gettxt clTxtMacro

NB. !(*)=. jpath
(jpath '~temp/') gettxt y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not txt' assert '_txt' -: (-#'_txt'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ txt=. MACRO_ajod_ get y do. txt return. end.
txt=.  ; {: , >1{txt
file=. x, '.txt' ,~ (-#'_txt') }. y
file [ (toHOST txt) write file
)

getxml=:3 : 0

NB.*getxml v-- fetch JOD xml macro and write as xml file.
NB.
NB. monad:  getxml clXmlMacro
NB. dyad: clPath getsql clXmlMacro

NB. !(*)=. jpath
(jpath '~temp/') getxml y
:
'JOD not available' assert 0=nc <'JODobj'
'invalid macro name' assert -.badcl_ajod_ y
'macro suffix is not xml' assert '_xml' -: (-#'_xml'){. y
NB. load 'general/jdd' !(*)=. get
if. badrc_ajod_ xml=. MACRO_ajod_ get y do. xml return. end.
xml=.  ; {: , >1{xml
file=. x, '.xml' ,~ (-#'_xml') }. y
file [ (toHOST xml) write file
)

linpathsep=:'/'&(('\' I.@:= ])})

putjson=:3 : 0

NB.*putjson v-- store JSON as JOD text macros.
NB.
NB. monad:  putjson clFile
NB. dyad: clPath putjson clFile

NB. !(*)=. jpath
(jpath '~temp/') putjson y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'json file does not exist' assert fexist file
'file is not json' assert 'json' -: tolower justext file
jsonname=. (justfile winpathsep file),'_json'
json=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ TEXT_ajod_
MACRO_ajod_ put jsonname;TEXT_ajod_;json
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H?R:+>P&u+>bks2BXh2+>t?!0d&@s1bg+2+>beq0ea_-1*ALu1-&uYFD>l8DJ!I%@qZuW:IH=?
F)Pq=D.-ppD]iJ+A0?):Blmo/@<3Q+F)Pq=Anc'mB4Z1+EGT5uFCSu,8l%htF)c"=D.-ppD]iJ+
A0?):Blmo/@<3Q4EGQb0Bl%?nATW$*G\1N/@qZuW:IH=IAU#>7@:O=r+CT.u+Eqj?FCcS'F!,R9
GT^U4Ch76jFEDbLAn?'oBHToC6m-SrF<GF/@rcK1@;]TuGB.D>AKYE&+EVjM+D,>(AS5RrG\q8/
ATVEq+A,Et+F%a>+DkOsEc3(/DIal6EbTW,+CT=6G\q7>Anc'mCh[d+@<?1(AT2^4@;]UaEb&m1
ATJu5@<?0*A7]RkD/"*'EZfIB+Dbb0Fa,$@DfU&1Eb$:G+EM@-F(fN8FD>l8DKBo<Eb-@c;bp.2
@<3P`:IH=IAU&;>D.-ppDfY                                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,'h++>Y,p1*A=p3A<H93$9t!1cI0d:K(5"E-68EATDiI0ht%f:et"h?Z:.0FCfK6+E27?F<GOC
De!@"F)Q(O+:SYe$?L'&F`_SFF<E7[3Zp*c$;No?+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+<Ve>
ATV[.Df-[?:-pQUAn?'oBHToC6m-5cDf-\7@:O=r+CT.u+Eqj?FCcS'F!,4=Df-\0Bl%>i$;No?
+<Ve>ATVd"+<VdL:-pQUAn?'oBHToC6m->TEbf3(GA\O?@:O=r+CT.u+Eqj?FCcS'F!,=.Ebf3(
GA\O8Bl%>i$;No?+<Ve>ATVm:+<VdL:-pQUAn?'oBHToC6m,<OFD,T1+EM%5BlJ/:@;]TuGB.D>
AKYE&+D,>(AISuA67sB'+D58-F)c"=+<XEG/g+b;FCSu,8l%htF)c"=D.-ppD]iJ+A0?):Blmo/
@<3Q4EGQb0Bl%>i$;No?+<Ve>ATW$*GT\+O:-pQUAn?'oBHToC6m-S_GT^j3@rcK1@;]TuGB.D>
AKYE&+EV1>+D,>(AISuA67sB'+D58-FEhmM+<XEG/g+b;FCSu,8l%htFEhmMD.-ppD]iJ+A0?):
Blmo/@<3Q5G]Y'?Bl%>i$;No?+<Ve>ATW06C`jiC:-pQUAn?'oBHToC6m-_kC`mS'@rcK1@;]Tu
GB.D>AKYE&+F%a>+D,>(AISuA67sB'+E2IFC3+<2+<XEG/g,4WDfTD38lJM\+CT=68l%htFCf]=
+DkOsEc6".$;No?+<VeGF`_J2+<VdL:-pQUF*)>@AKX]UEbf3(GA\O3F!+(N6m-S_G]Y'F@:O=r
Et&IO67sB'+E2IFE-WQK+<XEG/g,4WDfTD3:jI.rDf-\-De*E%@<3P`:IH=IAU&;>D.-ppDfZ?p
:-pQU+<YWGFE;G<+<Ve%67sC%FDl22+B)-2+CT=68l%htFCf]=+DkOsEc6".$;No?+<VeGF`__:
GT\+O:-pQUF*)>@AKZ)+GV<lAFCf\>@<3P`:IH=IAU&;>D.-ppDfZ?p:-pQU+<YWGFEDbL+<Ve%
67sC%FDl22+EV1>F<G"5+A,Et+EV1>F<GF/@rcL/%15is/g)8ZE-68ID/:=;+AP6U+EMXCEb-@q
9hZ[<F!+(N6m-S_G]Y'F@:O=rEt&I*%13OO@rGk"EcP`/F<Dr?@<6!-%16ihF)uD0D.GC\,9TT$
@;]Tu:jI.rDf-[rD/"*'+B*-"B2*M]+A[#lASuU$A0=fJ9PJT[%13OO<+oi`AKY].+CQC/@<-!l
+E).6Bl7K)D..I#ATT&,DfQtABQ%p5+CT.u+Co&*@;0OhA1SiQ@Wcc8DJsV>Dg#]4E,Tr3EbTE(
/1Mc]Ec5T2@;TjqDJ'CcFEM\DEbSruF"SRX=`8F*CMn'7+EqL-F<F-tD.R-n/g)98BQ%p5+Ad)s
B6%EtD/!m#+EVaJDfTQ#Ci^_2@;Ka&Bl8$2+EV:;ARuun@<6-m+Cf4rF)to6/e&-s$8F.U.S+,e
Ci:FtDfTZ)ATDiA/e&.C/g)WBFCAZp+A[/lEb9-+G@bf9.P;/;1G0e@Dg*<q+CoC5BlkIIEbT0"
F=JDEA8-.(EbSruF"Rn/%14RUASc1$+BNK%Ch.*tF"/;@Eb-A:ATE&=@UX=l@j#l9FDl26@;L!-
FD,*)+EM47G9D0LFWb@9G9D!G+ELt:+<j?fCi"#4=)W+qA0MHiBl5&:@<-(#F`S[EEc5T2@;Tjq
DJ().@;]_#@:s.m/g*GrC`l8[Ci"#4=)W+qA7]e&+Co&)@qBOg+D,Y4D'08p              ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' putters IFACEWORDSputters ROOTWORDSputters assert boxopen'
zz=:zz,' fboxname fexist getjson getmd getpy getsql gettex gettxt getxml ju'
zz=:zz,'stext justfile nc putjson putmd putpy putsql puttex puttxt putxml r'
zz=:zz,'ead toCRLF toHOST toJ tolower winpathsep write''                    '
zz=:248{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>GW20lV8WFCfK6:-pQ_E-68EATDi7F"JsdG%#E*Dfp+DFCf]=+D58-05u&U+E_d?
Ch\!*ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'B4Z1"F)Pq=/KeY:FCSu,8l%htC3+<2+DkOsEc3(/
DIal6EbTW,+CT=6C3+<2+D,>(AISuA67sB'B4Z1%A0<!;/KeY:FCSu,8l%htD..I#A8c[0+DkOs
Ec3(/DIal6EbTW,+CT=6D..I#A8c[0+D,>(AISuA67sB'B4Z1(Gp"4P/KeY:FCSu,8l%ht:jI.r
Df-\=@rc:&F<G"0A0?):Blmo/@<3Q'Bl%>i$;No?+<Y<.FE;G<+<W6YAn?'oBHToC6m-PjC`mS'
@rcK1@;]TuGB.D>AKYE&+EMO=+D,>(AISuA67sB'B4Z1,AU#=?/KeY:FCSu,8l%htFCf\>D.-pp
D]iJ+A0?):Blmo/@<3Q5AU#>0Bl%>i$;No?+<Y<.FEDbL+<W6YAn?'oBHToC6m-SrF<GF/@rcK1
@;]TuGB.D>AKYE&+EVjM+D,>(AISuA67sB'B4Z10D/:=;/KeY:FCSu,8l%htG\q7>D.-ppD]iJ+
A0?):Blmo/@<3Q9D/:>,Bl%>i$;No?+<YWGFD>l8DBLMRF*)>@AKXTD:JN$@F!+(N6m-S_G]Y'F
@:O=rEt&IO67sB'E-68>A0<!;/Kf+VDfTD39jr'XA8c[0+CT=68l%htFCf]=+DkOsEc6".$;No?
+<YWGFDuLJ+<W6YF*)>@AKXfpFD,T1+Cf>#AKYE&+A,Et+EV1>F<GF/@rcL/%15is/g)9UF`_\E
C`jiP+EMXCEb-@l;+r*@F!+(N6m-S_G]Y'F@:O=rEt&IO67sB'E-68EAU#=?/Kf+VDfTD3FCf\M
CghEsGT^F9+A,Et+EV1>F<GF/@rcL/%15is/g)9UF`__MF<D\X+EMXCEb-A8AU&;>@<3P`:IH=I
AU&;>D.-ppDfZ?p:-pQU+E2IFG\q7>+>"^WFDl22+BV?3+CT=68l%htFCf]=+DkOsEc6"A+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67r]S:-pQU@rc-h
FCeuD+>PW*2f2uK1,B@H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fNiiDDEmgD/XT/A0>u4
+=MASBl%i>+Co1rFD5Z2@<-W&$;No?+>GijF`&oi+Cf>-G%G]9ARlp*D]i\/@<6K4B6%p5E"*.L
67sB83,3SR0fU:aA7T7^+DPt9DCcoLH$!_<DCcoOEGQb>AU&;>FEqh:Et&Hc$;No?+Dbt)A0>T(
FDi9o:IH=>DKKH1Amo1\+Dbt+@;KKa$=e!aCghC++=Cl<De(4)$3                      ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*ALu1GEcjFED)7F*:u4BlA-8+EV1>F<G4-F>%TUF<G^JBl%L*Bk;>~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkuM5sn(B:JsSZE-68EATDi7;GU(f=&2^^;fHl$FCfK6+D58-C3+<2+D58-
F)c"=B4Z1,AU#>1ATW$=F<G4-FEhY=+Dbb0E+*j%F(K;5E-68;F)PqD.4cl00I/>$/1<V34=>)j
FED)7F!iCf-p01/0I\P$4?P\X?SNZN+Abj4<*sTeFED)7F!,4:F)uD0D.G"C/1<V9+?:]&0JPO@
2DI0D1c7!E0K;!N2'=Y.0fUjF0fUdB2)$^C1cIBK+>PW*3&!6F3%d$A3&EEO2)[341,(FB0K(XF
/i57;3A<BJ1,g=20JPO@2DI0D1c76P0JtO?2BXb/0fUjF0fUdB0JbRF0JGC-1,(FB0K(XF/i5CB
3AWKL1H6L40JPO@2DI0D1cR0D1-%$K2]sk00fUjF0fUdB0etO@3&<N:1,(FB0K(XF/i5I?1c$mE
3&2U30JPO@2DI0D1c@*F0JPOG2BXb/0fUjF0fUdB0K:mF3Ai]M+>PW*3&!6F3%d$A1-%$I1GUm3
1,(FB0K(XF/i5FG1c%$G1GL"-0JPO@2DI0D1b^^E2)R<Q3?U(20fUjF0fUdB1c@-D2`!HO+>PW*
3&!6F3%d$I0JP=C0KD'71,(FB0K(XF/i5:<1G_!H3%6C,4>8$7.4cl01,(FB0K(XF/i57=0f1jJ
1Gp[:/hf.>2`!?M2)R-C2)I9P1,(R8BeD.`0e"Y%4>8$7.4cl01*A=t1,(FB0K(XF/i5FB2_d!@
1,^710JPO@2DI'A2_Zp?3B9&V+>PW*3&!6F3%d$G2)%!M2E3T;1,(FB0K(XF/i,LD2_[3I3AW*8
-p014/1<V7.4cl00I\P$4>8384>6                                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
