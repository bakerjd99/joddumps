NB. sha256:551f15fc90bd910e6e767d3e5adf3a85cbbbbb8dc4dcba161e030146f4ae6543
NB. JOD dictionary dump: 19 Apr 2025 13:52:27
NB. Generated with JOD version; 1.1.3 - dev; 33; 19 Apr 2025 12:31:13
NB. J version: j9.7.0-beta3/j64avx2/windows/commercial/www.jsoftware.com/2025-04-03T02:39:53/clang-18-1-8/SLEEF=1
NB. JOD put dictionary path: /joddev/jod/utils
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|335777767984232392329146217471784198516|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


CSRC=:36

ERR032=:'hash does not match ->'

ERR033=:'invalid dump file ->'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.3 - dev';33;'19 Apr 2025 13:16:37'

JODVMD=:'1.1.3 - dev';34;'19 Apr 2025 13:16:37'

OK011=:'hash matches ->'

RUST=:35

jodliterateVMD=:'1.0.1';15;'31 Mar 2025 11:29:52 MT'

jodliterate_hashdateurl=:<;._1 '|4a6b149f7e1f79808d1337fdc3d04d0b2165f0f93a8cbf043c36db6b9b3aa9f4|31 Mar 2025 11:29:52 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


make=:3 : 0

NB.*make v-- makes J scripts.
NB.
NB. monad:  make zl|cl
NB.
NB.   make ''  NB. basic put dump
NB.
NB. dyad:  ilObjOpt make cl|blcl
NB.
NB.   0 make ;:'an arbitrary list of words into a script and file it'
NB.   0 2 make ;: 'a list of words returned as a character list'
NB.
NB.   3 make 'suite'    NB. make suite write to script subdirectory
NB.   2 2 make 'group'  NB. make group return character list
NB.
NB.   NB. make groups that are not in put dictionary
NB.   NB. file is written to put dictionary script directory
NB.   2 _1 make 'deepgroup'
NB.
NB.   NB. check dump script hash
NB.   17 make '~JODDUMPS/joddev.ijs'

makedump__MK y
:
msg=. ERR001  NB. errmsg: invalid option(s)
if. badil x do. jderr msg return. end.

NB. j profile !(*)=. jpath
if. HASH={.x do.
  if. badcl y do. jderr msg return. end.
  if. -.fex <file=. jpath y do. (jderr ERR033),<file return. end.
  if. chkhashdmp y do. (ok OK011),<file else. (jderr ERR032),<file end.
  return. 
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options HARDCODE
x=. 2 {. x , 1 2
if. -.({: x) e. _2 _1 1 2 do. jderr msg return. end.

if. ({. x) e. GROUP,SUITE do. x makegs__MK y
elseif.  ({. x)=WORD do.
  if. badrc uv=.WORD obtext__UT y do. uv
  elseif. 1={: x do. (WORD;1{uv) writeijs__MK >{:uv
  elseif.do. ok >{: uv
  end.
elseif.do. jderr msg
end.
)

od=:3 : 0

NB.*od v-- opens and closes dictionaries.
NB.
NB. monad: od clDictionary|blclDictionary
NB.
NB. dyad:  iaOption od clDictionary|blclDictionary
NB.
NB.   od 'test dictionary';'another test dictionary'  NB. open r/w
NB.   3 od 'test dictionary'                          NB. close

1 od y
:
msg=. ERR005 NB. errmsg: invalid or missing dictionary names

NB. list all registered dictionaries (short form)
if. badjr mdt=. jread JMASTER;CNMFTAB do.
  jderr ERR006 return.
end.
dl=. 0{>mdt

select. x
case. 1 do.   NB. HARDCODE: magic numbers read/write codes

  if. isempty y do. ok /:~ dl
  else.
    NB. open read/write
    y=. ~.boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. ~.boxopen ,y
  if. *./y e. dl do. y opendict__ST 2;mdt else. jderr msg end.

case. 3 do.

  NB. close dictionaries
  if. badrc msg1=. checkopen__ST 0 do. msg1 return. end.
  if. isempty y do. y=. {."1 DPATH__ST else. y=.boxopen ,y end.
  if. *./y e. dl do. mdt closedict__ST y else. jderr msg end.

case. 4 do.

  NB. HARDCODE (mdt rows) display dictionary names and source paths
  mdt=. jpathsep&.> 0 2{>mdt
  ok <(/:0{mdt){ |: mdt

case. 5 do. 

  NB. return the currently registered dictionaries as a sorted (regd) script
  if. 0 e. $mdt=. >mdt do. 
    ok 'NB. No current JOD registrations: ',tstamp ''
  else.
    mdt=. quote&.> 0 2{mdt {"1~ /: 0{mdt
    mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt

    NB. prefix command to close and unregister all current dictionaries
    mdt=. 'NB. require ''general/jod''',LF,'0 0$3 regd&> }. od'''' [ 3 od ''''',LF,mdt

    NB. add JOD/j versions - useful when dealing with binary incompatibilities
    head=. 'NB. JOD registrations: ',tstamp ''
    head=. head,LF,DUMPMSG3__MK , ;(<'; ') ,&.> ":&.>JODVMD 
    head=. head,LF,DUMPMSG4__MK , ": , 9!:14 '' 
    ok head,LF,jpathsep mdt
  end.

case. 6 do.

  NB. open entire put dictionary path - shallow recursive
  NB. closes current dictionaries and makes first (y) put
  if. isempty y do. jderr msg return. end.
  uv=. 3 od '' [ opd=. }. did 0
  uv=. <;._1 ; {: 1 { rv did ~ mdt=. od ;{:boxopen y
  NB. if request is not a single dictionary open 
  NB. entire path for last and prefix others 
  if. 1 = L. y  do. uv=. (}: ,y),uv end.
  if. uv -: ,a: do. mdt NB. empty path  
  elseif. badrc uv=. od uv -. a: [ 3 od '' do. uv [ od opd 
  elseif.do. uv end. 
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

wttext=:4 : 0

NB.*wttext v-- returns annotated word or test text.
NB.
NB. This  verb converts dictionary  words and  tests to formatted
NB. script   text.  (y)   is   a  boxed   (name,class,value)   or
NB. (name,value) table.  The result is either  a single cl script
NB. or a btcl of object scripts.
NB.
NB. dyad:  (paRc ; blcl) =. iaObjExFtab wttext bt
NB.        (paRc ; btcl) =. iaObjExFtab wttext bt

NB. object code, explanation bit, formatted table bit
NB. default table bit is off - this verb is frequently
NB. called with a two item (x) argument
'obj noex nftab'=. 3{.x,0

if. WORD=obj do.
  y=. (/: ; 1 {"1 y){y      NB. sort words by name class
  nr=. ((; 1 {"1 y)>0) i. 1
  NB. convert noun values to linear representations
  if. badrc m2=. noex nounlrep nr{.y do. m2 return. end.
  y=. (rv m2) , nr}.y
end.

if. nftab do. nms=. 0 {"1 y end.  NB. retain sorted names

if. noex do.
  NB. no explanations and no LF's depends on caller
  m0=. (#y)#0
elseif. +./m0=. -.LF e.&> {:"1 y do.
  NB. prefix any short explanations for single line definitions
  m2=. m0#{."1 y
  if. badrc et=. obj getexplain__ST m2 do. et return. end.
  m2=. 0<#&> et=. {:"1 rv et
  et=. (<"0 m2) #&.> (<'NB. ') ,&.> et ,&.> LF
  y=. (et ,&.> m0#{."1 y) (<(I. m0);0)} y
  NB. number of LF's between corresponding objects
  m0=. (>:2*-.m0) + m0 (#^:_1) m2
  m0=. m0 + 2*firstone 1=m0
elseif.do.
  NB. 3 LF's between all multi-line defs HARDCODE
  m0=. (#y)#3
end.

NB. construct J object scripts
if. WORD=obj do.
  NB. remove extra blanks inserted in direct definitions ignore
  NB. nouns and only change words containing terminated direct definitions
  b=. 0 < ;1 {"1 y
  if. #dds=. I. b (#^:_1) +./@ ('}}'&E.)&> (I. b) { 2 {"1 y do.
     NB. require 'regex' !(*)=. rxapply
     ddbfx=. {{ '}}[ ]*' rebc rxapply y }}
     NB. NIMP: alters commented text within ddefs 
     NB. may change to ignore commented text if annoyed enough
     y=. (ddbfx&.>(<dds;2){y) (<dds;2)} y
  end.
  y=.jscriptdefs y 
else. 
  y=. {:"1 y 
end.

NB. return formated (name,script) table or cl script
if. nftab do. ok <nms ,. y else. ok ({.m0)}.m0 jscript y end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)6:7+>P&r+>PVn0f1"21E\D++>u"u0fC.01E\D,+>Y_p2BXb1+>b2r1E\Ls0f:(3+>YlB;c5tm
+EMIDEarZ'DfBf4Df-\-De*ENH:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ@:Wq[
+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!*?cCi`3E6rZrX9N*'JDKKH1
Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK>IBl8$(
Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_<_YtS:IJ/X:J=\0G%G]8Bl@l?+DkP&
AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCe?M;cId[F*&OGDfp)1AKYo1FD5Z2
+Cf>#ASkjkASkjkATJtd+EM%5BlJ08GB@q<G][t;FEMVAF!+n/DJsW*FCeu*GAhM4+E)9CFCfN8
+EV1>F8                                                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fV*71,L+/+>GYp0f(^H+>GVo0fUjE+?:Q'1,^701*A;/1,L+.1a"\93?U=)0fUjA+>G\q0f:sK
+>G\q0fLmJ+>PYo1,C[@+>GYp0f(dL+>Ghu0ebRF+>Gl!2Dd650f1"-0KCj10f1"-1b^X,0ea_*
2Dm<60esk,1,CU,0f'q,1,gs23?U%71cQU<+>GW12BY"&1,LgG+>GSn0fLgI+?:Q!1Gh!40ea_)
0fD$70eje*0f1e!ASc""E)UUlCLo1R:-pQ_A7]RiEc=roDeio<0HbHh/KcHPASc""E%)oND/X3$
+EV19FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:2(9YZG\M5@F!*%WEcl7B-t@:/@<?(&ATMs(
Bk)7!Df0!(Bk;?7%15is/g)8Z0e"5;:IH=9ATf2,Bk)7!Df0!(Bk;?.-u*[2A7]p8+DPh*/0K(W
Bl%i>+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp131,N`gCbdpY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aA7]RiEc=roDeio<0II;:%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OZ
-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&IfEZf:2+?MV3C2[WnATf22De'u5
FD5Q4-QlV91E^UH+=ANG$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)
F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;
2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'
Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh
/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>
FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:
-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sC%Df'&.B6%p5E-![RF_Pr/F!,[<
Eb-A0Ddd0fA.8lWEZf"8E$-MU%16Ze+>Y-QEc<-K-OgCl$;No?+D5_5F`8HM+EM[>FCcS)Df0Z.
DKKq/$>4BuGB.584ZX]uEc<-U+E2%)CER81E$m"B$?L?(FCfN8F$2Q,1E^=NE$-kXE+rft+>Y-Q
Ec<-K-OgCl$;No?+Co&"ATVK+DdmHm@ruc7/Kf.HF*&O:DfQt>Eb0<'DI[5e$>"6#-p'.+E+rft
+D5_6+=ANc+Co&"B6%r64#%jsBk(p$B6%s8Eb'5#$8!kQ-p04,E+rft+D5_6GB.58.3N1S+>G!X
Bk(p$B6%s8Eb'5#$4R>REZcbY4#%jsBk(p$1E^=NE$-MU.6B=7+Co&"B6%r64#%jsBk(p$F*22=
ATMs7%14[>+=K?,+E2%)CER\@Blmp-FE8lRAM,)[+E2%)CER\@Blmp-FE7lu%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0
De!3lARB.dDe*3fATVs;;f-GgAM>f567sa#ATVs;;f-GgAM>e\F=f'e-td+5Ed0#UF)>i2AKZ)+
F*'#D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.De(OZ.3N2HBleB;+>"^V
F`&<M@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:0$;No?+<Vd].3M5Y6m-#OFs(=0@ruF'DIIR"ATJtB
C2[WnATfUIC2[W6+E_d?Ci_$J@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW+1gtN>0Jj4G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065
Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eLATVs;;f-GgAM>ec
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])q
F?MZ--Zip@FD>`)0Jt3e$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<
DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+\9Anc-o+CT.u+CfG1F)rIEAS,Lo
ASu!h+EMI<AKZ28Eb'56FD,*)+CehrC`m:t@q[!'FD,6+%17/iDg-//F)sK*+C-*o+>G$#1+"ac
$>"6#FDYu5Ddso/F`\`RF(fK9E+*g/-OgCl$=[pqFDl"Z3ZrcrF(fK9E+*g/+F/B`%16Ze+EVI>
Ci<f+E-67F-Xq"9FDl"D%16Ze+>=pNCi<d(+=CW:FEDG<-OgCl$=[pl0JGXN+FAHEDfg)>D'4+P
I16NmDf7?a4ZX^4HX^o8FDl"=H$t)M$=[pl1,(jP+FAHEDfg)>D'4+PI16NpEZfI@E,9H&+E2IF
+?MV3@W-0=0HahCD_Wpg@W-0?0II;:4!64"HQk0e>p(gJB5DKqF!a'n4$"`uDf7<`+C]8-0ea_Z
Df7Bb-OgCl$>=?r1,1pQ+FAHEDfg)>D'4+PI16NsDf7?b4ZX^4HX^o8FDl"=H$t)M$>=?r0JP^O
+FAHEDfg)>D'4+PI16NpEZfI@E,9H&+E2IF+?MV3BQ%fE0d(.JD_WshBQ%fC0ddD;4!64"HQk0e
>p(gJB5DKqF!a'n4$"a&Df7Bc+D>\30ejeaDf7<a-OgCl$=[pl1GBq73ZrcrBQ%fE0d(.JD_Wsh
BQ%fC0d(aiI16NpEZfI@E,9H&+E2IF+=CW:D_j'p%16Ze+>=pNCi<d(+=CW:D_j'p%13OO@W-0u
Df7d"+FAHEDf7Ec+C]8-1,'h[Df7?a+C]8-0JFVpI=2P3ATAo8D/a<0@j#`5F<Dr?Df9<-D^Pu$
ATAnI+D5M/@WNY>@W-0uDf7!4$4R>;67sC'F(KD8F`(o3DBLMRF`(o5F_)\3BleA=De:,%@;Kak
A0?)7Eb'56@ps1i+EVX8AISuXEZfLGAT^-s+EM47GApu3F!*7n+E_a:F!)i>Df9<-D^Pu$%15is
/g+Y?ARTU%@UX=h+Dbt+@;KKt=$]_Z8PVc:+@JLj7n$;u=%Q(Z+Au!%8PW2[:*Cc(%14g4>9G=N
+Z_J<.3L$VCgUX[F(J]$-RU>c/1)u5+?V#Y@UX=h?RH9i%15is/g+tK@:UKhCht5<DfTB0+ED%5
F_Pl-A0>u4+D#e/@s)m)+EVNE@UX=h%16Ze+D58-Ed/]S@W-0uDf7!4$4R>;67sBpF<GX<Dfol,
+DkP/@q[!,BOr</F(KD8F`(o3D@Hq$DJWZh@<6!e+=ANc+>#Vs004P)-nlcj+=o5iE+rft+E_a:
FX\Fa+?L]#+F>4^0d(FL@r!30F(KJ'$4R>;67sBjCh7$q+C\c#AKYf-@ps1b+BLj,:.\2N3ZpgV
:.I`N+BM-.9H[5/6:jpN:JN&V+Unc5+Bos:1a+n;2(9XrDJWZh@<6!e+=ANc+=nil4s2s8?XdGb
AR?eo$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFCfN8Ci<flCh6sfC2[WiB67'hDeio<0MXqe.VEj%D/X3$0JFVk/M/(nB65RF
F)>i2AKZ)+F*'#D$;No?%15is/g)QTF=A>EATVEqATJtBBkh]<+EV1>F<G19Df$Uh;03q!EZdtF
;]oX^BlkJABl7I"GB5AG$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3M5Y6m-2b+EDUB
DJ=!$%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?C3=>J
3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUF*)P:Afu/5
D.Oi3AU&;>Bl8$2+EV:.+EMX5DId0rA0=JeARoLs+Co2,ARfh#Ed8*$@W-1,G]Z)0+=o6$+<r![
3[[KAA8`T7BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT+7/5/MB$8EZ-+C]8-FEhmMGB.D>
AKY`,@<?0*-[p/KD/_.;Df96%Ch555C3(a3$4R>;67sBmATVEq+EV1>F<GX<Dfol,+DkP/@qZun
AoqU)+Dbb0AKYQ%A0>c.Ec#6$BmO30Bl@ku$=[pl@UWb^4ZX]uF<Dr?Df96%Ch4t'$=[plFEhmM
/NP"`Df9)n@r!2=/g*MZ%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3lARB.dDe*3gCiF9.;f-GgAM>f567sa$
CiF9.;f-GgAM>e\F=f'e-tmF9DJUaEF)>i2AKZ)+F*'#D$;No?%15is/g+SDF*2>2F#ja;:-pQB
$;No?+<Vd\.3L$\ATMs.De(OZ.3N2HBleB;+>"^VF`&<M@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:0
$;No?+<Vd].3M5Y6m-#OFs(=0@ruF'DIIR"ATJtBC2[WnATfUIC2[W6+E_d?Ci_$J@<Q'nCggdh
AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+1gtN>0Jj4G
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1Eb0-1
+DPh*FCfN8Ci<flCh4_:5s[eMCiF9.;f-GgAM>ec%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0Jt3e$4R>;67sBmATVEq
+EMI<AKZ,;Bl%i"$>"6#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDoEZfI@E,9H&
+D58-+?MV3Eb/Zi+Eqj?FCcS(AS,k$ATMs6+CSl(ATDj6EZfF:Dg-//F)r]<$4R>_@j"tu-ZW]>
Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"m
Ci<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$9g.j
De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGT
F_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R
/g*##,<R>$%13OO:-pQUCi<`m+E(_(ARfh'+DG_8D]j.5F*&O8Bk)7!Df0!(Gmt*8+Bos:-nlf*
0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$
FCfN80b"I!$;No?+EMI<AKYW+Dfp#?06;8MFCfM9G@bf++Dbt)A7]9\$>"6#FCfN8B6%s44ZX]u
Ec<-K-OgDoEZd.\B6%r6-RT?1B6%s/@;TR=3Zp."E+rft+EV19FD#W5Et&IhEc>N,DKKH-FE9T+
+FPjbB6%r6B6%s/@;TQb$4R>;67sBpDKBB0F<G7.CiCM=AU&;>AoD]4B6%p5E$0@CEb'5#$>"6#
0H`=tE-67FB4km@3Zr'UE+<g(FCf?3F!*"d+?V#[Cht5<DfTW(+CT.u+Du*?E,8s.+DkP&AKY_r
@r!2q+CoV2C`m2*Gpa%.%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`8I5Df0Z.DKKqBD..NrBOu5o
$7I;d0RFuu+D5>#.3L\p4u%C.0d(+ABIP&U3Zr*PE,KJ7B6%s$Df0Z.DKKq/$4R>;67sBnEc6)>
+EM47Ec`F;ASc<.FCf]=%16Ze+>P'!+E2IF+D5>#4ZX]uEc>o)D.PdVBcpr)+EqL-F<G9?A8`T"
ARf.kF(HJ.+CT+0GA(E,+DDs,D'oc"-nID+/j:CjB4r_:/NP"0+D>S1DJUG.Ec>o)D.O.`%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WATMs0De!3lARB.dDe*3iDe*NmCiE<iDeio<0MXqe.V`m4BOu"!;f-GgAM>e\F=f'e-u*[2
BOu"!.3N\KDeio,FCfN8/e&._67r]S:-pQU+<W?e+A,Et+DGm>Ci<`mARlo8+EMX5DId0rA0=Je
F`_>6F!)lCAU%p1F=A>KDdd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW+1hq/L1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1
FCfN8ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eODe*NmCiE<iDeio<0II;:%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g)QWDe*Nm
CiCgGF*(i2FE8R5+E1k'+ED%%A7]d(FDi:4Ble60@<itDC2[W8E+EQ0+EqL5@q[!!F!(o!:-pQU
FEqh>@ps1iGp$g=F*(i,Ch7-"@X0)<BOr;7C2[WnDe!p,ASuT=+CSekDf-\3DBO%7BlbD5De!3t
Bl@ku$>*joBleA=-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EQ.%13OO
:-pQUA8-+(CghT3-u*[2/oY?5.1HVqEZf+8A8#OjE$-hD$4R=O$;No?+>%q>78m/.;cQ1P78m,S
<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7n
A7'.c;f-GgAM>f567sa(B2`YcCLo1R+ET1e+=M&=.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4
D.RcL%15is/e&._67sB'+>>5e.!0$AFD>`)0Jt:%AU%p1FE8QV+EDUB+=L`?ART[lFCfN8A8,Oq
Bl@ltEbT*+.1HVZ67sB'+>G;f8l%htA7]p,A8,OqBl@ltEbT*++=LuCA7T7p/0J\GA1SjGFD5Q4
.3N&B@;0Od@VfTb$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JYInF_<Bb%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@6#:14D/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:2(&h?%15is
/g+b;FCSu,F)Po,+E_d?Ci^$mATAo3A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%16Ze
+EVI>Ci<f+B4Z0-4$"a0ART*lGB.D>AKYGnAoD^$F*)FF@:jUmEcZ>C+EM47GApu3F!hD(%17,c
+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P
$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3
%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGU
ATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%4
4YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2+EV19F<G+.@ruF'DIIR2%14g4
>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF
@:W;RDeip+ATMrJ%13OO:-pQUF)Po,+D5_5F`;CTF*22=ATJu<ATD?)Ci<`mARl5WATAo8ATMs+
Ec?(_3Zr'UE$-MU%16Ze+>Y-QEc<-K-OgDqEc>o)D.Pjk+>G!XBk(p$FCfN8B6%s4%16`gE+<g(
FCf?3F$2Q,I4cXTEc<.6Ec>o)D.O.`%15is/g+Y?ARTU%@UX=h+Dbt+@;KKt=$]_Z8PVc:+@JLj
7n$;u=%Q(Z+Au!%8PW2[:*Cc(%14g4>9G=N+Z_J<.3L$VCgUX[F(J]$-RU>c/1)u5+?V#Y@UX=h
?RH9i%15is/g+tK@:UKnEc6)>+D5V(F!,RC+C\c#AISuXEZf12+D5_6DIIBn%13OO:-pQU@q]F`
CER_4@<<W9DfTB0+D5V7+Dbt)A7]9\$>4Bu@rH7,ASuU2+>#VsDJWZh@<6!e+=ANG$4R>;67sBj
Ch7$q+C\c#AKYf-@ps1b+BLj,:.\2N3ZpgV:.I`N+BM-.9H[5/6:jpN:JN&V+Unc5+Bos:1a+n;
2(9XrDJWZh@<6!e+=ANc+=nil4s2s8?XdGbAR?eo$4R>;67sBhA7Qfk+D5_5F`8IBDf^"CE,ol,
ATMp2EX`@eEZd1]E-67F-mqhe;cI*O/8'!BDIIBn.6B:>4"#)dDfp/@F`\`\0H_S_/35.+BOu!r
D]hDF<CKS(GAhM<A1&`P%13OO:-pQUCi<`m+EqOABHV84F*&ODEc5H!F)u8?%16Ze+Db\>+D5_6
DIIBn%13OO:-pQU@q]F`CER_4@<<W9DfTB0+D5V7+Dbt)A7]9\$>4Bu@rH7,ASuU2+>#VsDJWZh
@<6!e+=ANG$4R>;67sBjCh7$q+C\c#AKYf-@ps1b+BLj,:.\2N3ZpgV:.I`N+BM-.9H[5/6:jpN
:JN&V+Unc5+Bos:1a+n;2(9XrDJWZh@<6!e+=ANc+=nil4s2s8?XdGbAR?eo$4R>;67sB4HW3F4
<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFCfN8
Ci<flCh6sfC2[WiCi<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!@3BW.
@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe+$;No?+=M>BBk)66/e&._67r]S:-pQU<+oue
+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08/e&._
67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o
+EV:.%15is/g,:XF^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S:-pQU@<6L4D.RcL
%15is/e&._67sB'+>>5e-u*[2FCfN8Ci<flCh5%<F`V,)+EVNE@rc-hFCcS:ATMr9Ci<flCh4%_
:-pQB$;No?+<Vd].3L$\A8,Oq.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjEb/[$ARmhE1,(F?@<H3:2@U!g67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloq
DfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?+>PcgF`&rp+ED%:
Bldi.AoD]48g$,H2BXDXDe!g!@<?'6@rGq!@<6!/+Cf(nDJ*O%%15is/g)o+C3=>J2^!-PG%l#/
A0>u4+Dbt)A0<:BA8,Oq.3L2bF(KG9Bl5&'@;KaoDJ()5@rc:&FE7lu%159QHZ*F;FC])qF<Fd1
1E^UH+=ANG$4R>;67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IC:JXYM<)64B4ZX]>%15Et:J=&R
:JEQ,3Zp-d$:7Na9MA#V<'<8b5;"'50JF_,%15Et:J=_R6;0g23ZpX>+>k8r1E[qc1(=R"$;!ul
5u^WS0KhH>0b"I]:/k1Y6;0g23ZpX>+>k8t,V^u,%13OO7SHTD<(ok^<'<8b2`E?L3?TUj5;"'7
0JF_,1CX[#$:@?M;G9Y\<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h)
$4R>@=\Vj]69R@P1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0%13OO
6;L]^<)lCW4ZX]64@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;67sC%FDl22+Dbt+
@;KKtGAhM4F!,1/+E2@4F(K62%14L>+?CW!.46JP$>sZi4Y@j)DJWZ-/9GHEFDPl*@;KL^BkhQs
?S!R3-OgDsAhG2N+E).=4Y@j$/oGK8/12QS/i4puA8a(0$6UHT0RInQF*)5:@ps1b?YO7nA7$Hu
F`\aEDK?6oAScF!BkAt?,Aq<?BeD4bA8a(0$6UHT0RIb]F<GI;+DEGb%16Z_F(K&t/g+\C/e&.1
+>=o\%16ZaA1e;u.1HUn$;No?+CQC7ATMr&$9g.j0d(FXF<DrPD/X3$0N;V)F>,((-SZ`,+>G!6
67sC&ATMr9F(96)E-*H:$4R>;67sBh+D,2/+D5_5F`;C2$9g.jB6%r6-Xq"4CiaH3CLo1I4!6UG
-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9N4;E9LU<<$9g.jB6%r6-Y[I?F)>i2AM>Jn+?MV38PW5N
<)64B+A#=-<'`iE74/NO%15is/g,4RD.Oi,@:O=rEt&I?0RGW!E-67F-Za-CCLo1o@:O=r0IJq;
0fpas/g)o*-OgDH0RGW!E-67F-Za-CCLo1o@:O=r0df%<0fpaX67sBP+CoC5DJsW1Bl7Q+@Wcc8
De!:"E-WRIE+*6f/g*_.@;R,q+Dbb$ATD3q+X[^+%15is/g+tA@<Q3)A8,OqBl@ltEd8dGE+Nnr
$>aWhA5d>`CLqU!F*'-367sa(Ddd0TD/X3$FCfN80d(Qi/Kc0PDdd0!@3BW.@;Ka&@rH1"ARfgr
Df-\9Afr47@VTIaFE8QIBl8$2%15is/g)QaA8,Oq.4u&::-pQB$;No?+B3#gF!)TIATMr9+EM%5
BlJ/:+Dbb-AKWC;Ddd0TD/X3$FCfN80I\+eBlbC>FEqh>@ps1iGp"5MF`%Wq:-pQUBl8!+A7Zm%
FD,6++EV19F<D]I@rc:&FE9&W8TZ(rBQ&$0A0>c.F<D]7Cij6/+EV:.+<Y]IDJj0+B+52C67sBs
De!3lAKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\+mC2[X)ATMs0De!3lALSaEF(Jl)FDi:3Eb/[$
AKZ)+F*&O@De!3lAISuA67r]S:-pQU+<WBf+=M>BBk)66+Co1rFD5Z2@<-W&$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPFnF_<Bd%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.
D..]F1a$p[A79Rk+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgDX
67sB91hq/N1-$ItAThd/AKYT'EZdss3A*34-t@1*Eb/[$AM7P3ATD4#ALSa3BOPdkATJ:f:-pQU
1,N`gCbdplEb0E.F(Jl)FDi:<Ddd0!.!0!6@rs.B/Kf+GF<G:8+CehrCh[d"+EM%5BlJ08%13OO
4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$=[plCdD#r
9e\^k+>=63@W-1$5u^WS0g.Q?0b"J!Df9Gc8Q/SO3ZpX>+>GQ(,;K]8@W-1$<'`iE76N[S5;"'9
+>GYp,TniO$4R>VDKJ0D:JEN+3Zp-d$>FC"<'`iE76N[S5;"'9+>Y8t0JEqC%16]`Ddd`]8Q/SO
3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>PBOPpT8Q/SO3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPe
A8`T7BOQ!*8K_P^-OgCl$?LK0<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*
F<G:=+D,>*AL@oo%16Q_GZ.RA7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^.4dS[=\Vj]64F82
$;No?+EMXCEb-A0De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgE#Ch#U\+=D&C?RICH
ATMs0De!3lARB.dDe*3+-XS51$>F*)+<r"IDK@rn+<iFUCh#"D+DEGb-Qlr</e&.1+?hK+FCfN8
Ci<flCh6sfC2[Wi+E2IF+E).=%16Z_F(K&t/g)BVC`mFE1a$=I/e&.1+?hK+E-67FDJUG0/i4"E
AScF!BkAt?A8a(0$6UHF+<V+#ASu$2%14Nn$4R>;67sC%Df'&.FCfN8Et&I?0RGMsE-67F-Za-C
CLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-OgDH0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2
+?^i&+AP6U+EV19F<GX7EbTK7-OgCl$;No?+CQC)ATo80Ec6)>Et&I?0RIGQE$-N;Df9H5D/X3$
0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-OgDH0RIGQE$-NBDKKr:Deio=-T`G4
3[\WZF?rl%9e[](DKJiD6;0fq%13OO:-pQU@3BW6Blmnq$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo
+?MV3F)>i2AMI.qF*')YF)>i2AMI.qF*',a%13OO:-pQUF)Po,+DkOsEc6".$9g.j1a$a[F<DrP
D/X3$0hl(dEc3WZ4#/NP-YY1U1,C9e$9g.j1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\d
D]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7%13OO:-pQUCh7$uAKYMt
@ruF'DIIR2+E)41DJX6"A9;C(F>5I'A8,OqBl@ltEd:DH/h1[U@:XIkF*',j0P"m-FD5Z2@<-W9
F=f'eCi<`m+>GQ(GT\bZA0>f2A7]d(De:,/@:sIlFEM,*+EV19F<G+.@ruF'DIIR2/e&._67r]S
:-pQUG%G]'@<?4#3ZqjPF*2>2F!)lQATMs.De(RV0I\,\Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+AQiuASkmfEZd(s3B7NU:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQa
FttfqF`:l"FCeu*AoD]48l%ht0J5@<1b0"B:-pQU0fX)]F>5HlF`:l"FCeu*AoD]48g$)G0K0FJ
:-pQU1,N`gDDNshEb0E.F(HJ+DfQsm+?;&4+=L`<@rc-hFCd+8De3rtF(HdC@q]:gB4Z,n$;No?
+>PcgF_icl+Dk\1B4W3"DBL?BDe*s$F*&rUC2[W6+E_d?Ci_$JA8,OqBl@ltEbT*++:SYe$=e!a
F`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g)QWDe*s$F*)5:@ps1b.3N/4
Anc-oA0>T(+DPh*E,ol/Bl%?5Bkh\u$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@6#:IJA9;C(
F>5I'A8,OqBl@ltEd9#A$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq0edi8
3ZoelATMs.De(RV0II;:FC])qF>5I'GWe)1-Zip@FD>`)0eb:8-OgCl$;No?+E)41DBL?LA8,Oq
0edi$+CT.u+D58-+CT;/F`(_40eb:80HbRXEb'56GA2/4Dfp.EA7]@eDJ=!$%16Ze+E(d5FC])q
F>5Io%15:G/g,C`GWe)10H`)(+D58-+=Jru0JP7G,CM1TDJU[J.=6IqA8Z32-QjO,67sC)DfTB0
%15:G/g+e>B0A9uB6%r6-RU#Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sBnEc6)>Et&J$
G^)A4+>G!XBk(p$G^+HU%16`\B0A9uI4cXTB4hY\ATAnL+E(d5FC])qF>5Io%13OO:-pQUDfB9*
+=M>BBk)6>0JI`#+CT.u+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<
@rcL/%16Ze+E(d5FC])qF>5I'GRY!7+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>
F$2-<+tt-R/g*##,<R>$%15:G/g,4KDg-//F)rI7Bk/?8+>=63%15is/g,+A@r!2tBk)7!Df0!(
Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#TtFC])qF>5I'GRXuh$;No?+EMXCEb-A;
DfTB0%15:G/g,4KDg-//F)rHX+>GPmE-67FG^+HB$4R>;67sC$AT23hFCf!!Gp$U1@;]^h+EqaE
A0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa/g<"mGpsjf/g_qn+=AO%/1)u5+?Ui&
+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3F!*.Z0ea_hF`\`S0HbCIDIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd+ED%2@;TQuG^+H^+=K?\3]f#E
I3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G
/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3
F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=W
F<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K,jEb0,s
D.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oW8hAStpnAKZ5BGUXa`
4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S3$<6QDIIBn+F&-U.3L$$@6-J(.=E=`
G^'Z)%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V=-tRXFEb0*!+E_a:+E(j7E-67F
@rH4$@;]TuBOu3q.1HVJHS-up3$<0_F<Du[/nAj9+=ANc+=o,f4=>5^F*',j0Hb4NEb-A1ARTIj
DJ*csF)rIGATMr9A7]glEbTK7Bl@m1+E(j7@<Q4&@:s-oCh7KsFD*$2$4R>;67sBtATDEp+DG^9
G%#E*Dfp+DA8,OqBl@ltEbT*++EMHD.!0$AFE8uUB6%p5E-!QQD.-ppDf[?MAU%p1F:ARgEZf:2
+?MV3C2[X)ATMr9C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$>"6#A7dtc+DkP&AKW?J%16Ze
+E(d5FC])qF>5I'GT^351E^UH+=ANG$8EZ-+=Joe3\W!*HTG\L%16Ze+E1b!CLeQ0A8,Oq0eb;+
%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZfF:Dg-//F)rI7Bk/?8+>=63%15is/g+Y?
Df]J4.!0!6@rsFZ0R,#hA8,OqBl@ltEd8d9DIal"Ch7$m+E_W4$>"6#1E^UH+=ANG$4R>;67sB[
78m/.;cQ1P78m,S<D3i/%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaW
F*)5:@ps1b?YO7nA7#cQCi<frEc=roDeio<0MXqe.Vs$5B6%riD/X3$0JFVk/M/(nCi<frEc<HM
F)>i2AKZ)+F*)IU%15is/e&._67sB'+>>5e.!0$AFD>`)0Jt:%AU%p1FE8QV+EDUB+=L`?ART[l
FCfN8A8,OqBl@ltEbT*+.1HVZ67sB'+>G;f8l%htA7]p,A8,OqBl@ltEbT*++=LuCA7T7p/0J\G
A1SjGFD5Q4.3N&B@;0Od@VfTb$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YE
ART[lA3(hg0JYJ"F_ifl%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$
F*(u6-OgCl$=e!aF`MM6DKI"9De*s$F*)5:@ps1b+=BH@6#:ILB6%riD/X3$0JFj`$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8
C2[W:2(&h?%15is/g,4DG%De;D/X3$+Dbt)A0>u*F*&OG@rc:&FE7luATAo3A0<rp-YdR1A7]p,
C2[W*F`_>6F!i)7+>Y-YA0<6I%17,c+Bos9Eap5.Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`
CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3VDdd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^
-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OO4tq>%A0>u)Bk)6->9G^EDe't<-OgCl$;No?+Co&"
ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g
0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7
Bl8$2+EV19F<G+.@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.2
0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUF)Po,+D5_5F`;CTF*22=
ATJu<ATD?)Ci<`mARl5WATAo+Ec<-K-OgDoEZd.\B6%r6-RT?1%15is/g+eIDfp"A-6RAPBlmo/
@rH7,ASuU2%16`gE-H>5F$2Q,B6%r60d(FL@r!3"Ec<BR%170!Blmp-FE9T++>Y-QEc<-U+E2%)
CEPDUB6%r6-RT?1%15is/g+Y;ARfKuB6%p5E$0@CEb$;$E,]AsEcW@;DBL?DDe!F#E%)5'Eap4r
+=D2>+Dbt+FCAW+4ZX^%De!F#E$-kXE+rft+D5_6GB.58%14LG0d(FL@r!3"Ec<-K-Rg0L/g*4u
0mbU$Ci<g*@:BZQ%15is/g+Y;ARfKuF*22=AKZ)+F*&O5E,]AsEcW@;DBL?DDe!F#E%)5'Eap4r
+=D2>+Dbt+FCAW+4ZX^%De!F#E$-kXE+rft+EM[>FCfN8Et&I)4>@stBk(p$1E^=NE$-MU.3N1S
+?L]#HSKk`De!lt@LWYR$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7'1^CLp%FF(f&sCK#(gCLo1R:-pQ_
D..3k87?RQ@q]XVD/X3$0JFVk/M/(nD..3k.3N;4F(c\+BOt[h+EMC<CLnW1ATMs7/e&._67r]S
:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e.!0$AFD>`)0JP"!A8,OqBl@ltEd8d=G\M5@F!+n/
A0>T-+Dbt)A7]9\$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JYJ"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@s)g4ASuT4C2[X)ATMs0De!3l
AKW?d5s]?rCLp%FF(f&sCK#(gCLo1R-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX
67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO0fL4<+@nds87,e?De*2a
$4R>;67sBpDK]H)Bk/>pEbBN3ASuU2%16uaEZd(q+DkP&AKW?J%16uaEZd(q+DkP&AKWZ9$>sEq
+>GetD..3k+=D#7CLnW*Gp$X+Gpa%.DImi20fL4l@;BEs@6+i)DImi20fL4l@;BEs-Y#1jFD,B0
04np7AM7b=05YEEF(oN)05b3/@4l8/F!hD(DImi20fL4l@;BEs?SN[E3ZodmFD,B0+DGm>F*VV3
Des,t-OgE#ATAnO2Du[p@;BEs-SJqID_GdBD_GR6FCSu:Bkh]:%13OOATAo3A0<rpFC])qF:AQd
$;No?+CoV3E$/\*@ruF'DIIR2%16WX4ZX^&@;BEs-RT?1%15is/g+Y;ARfKuBOPsq%16Ze+@nds
87,e?De*2tD..3k+?Op2A7c8X%15is/g+S=FCfJ8A9Da.+D,>(AKWQIGA1l0+Cf(nDJ*N'BOPsq
%16QiFCfMV3ZrHS@:UKBHTG\L%13OO:-pQU@q]:gB4W3,Df'&.@X3',Et&IcH$!V=4ZX]5.OQ>e
5;=i7,9S4?H$!V=.=E=JH$!V=%14g4>9IC#FCfM9GB.D>AKX']3b2h3$4R>;67sBo@<6*)GA1l0
+Du*?Ci=3(ATAo1@<?!m%16uaEZd(q+DkP&AKX']3b2h3$4R=O$;No?+>%q>78m/.;cQ1P78m,S
<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7n
A7'1^CLp%FF(f&sCK#=qATMoH0MXqe.W&U0AOp6NBOb^k;fm%kF)s#h+ET1e+=M)8CLnq;Cgh?s
AKYN+D/^V2@<6*)FCfN8/e&._67r]S:-pQU+<W?e+=M>CF*)/8A2,bl0I\,TBk)7!Df0!(Gp$[C
BleB;+CT.u+DGm>Ci<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp131,N`gCb[mY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aD..3k87?RQ@q]XVFE1r6F"f9q%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ-
-Zip@FD>`)0eb:8-OgCl$;No?+E)41DBNb(EbAr+A8,OqBl@ltEd8*$ATAo3A0>u)Bk)5o$8F4g
0JG1'4<PkZDJUFC-OgCl$;No?+DkP&AKYetEbAr+A9Da.+EM%5BlJ/'$=ma33Zr9JCLnV9-OgCl
$;No?+D>2)BHVA0Dfol,+DkP/@qZ;YATAnJ2]usGCLnVMHTG\L%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^
BkhQs?Ys4eAPcfWBQRg,F>,FE67sa)@;BFN@<?1)ATMrI0d(Qi/Kf+GFE8RIE$076F*&O8Bk)7!
Df0!(Bk;?.AoD]4E+*j%+DtV)AKYK!@<6K4FCfN8F"Rn/:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@
ATJtBFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8A2#bf+CfG'@<?'k%15is/g)8G$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emQaFttl`$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTg
Dg!lp+EML<BlkJ3DKKe>FE_XGFCfN8F!)lJ@;BFN@<?1)ATMrI0e@0MFD+KZFD,c-F*')k.1HVZ
67sB91hq/L1,'hkAThd/ARloqDfQt8+?;&4+=L`<@rc-hFCd+8De3rtF(HdC@q]:gB4Z,n$4R>P
De!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(FDPl*
@;KKt-UC$aD..3k:gnHZFCfN80JOpa$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>;
67sC&ATMr9A8,OqBl@ltEbT*+%16W[@rucT3ZpLF-Zip@FD>`)0JFVkATMs.De(OV+EV19FD>`)
0JY!b$?pT;E+O)R3ZpLF-Z3jFDBN@uG%G]'+Eh=:@ODTl%16ukF`(f*GWe)10ea^r+?q_+2'an1
%178iEaiWpGWe)11E\_$-[6a`+F,=D$=RIgATD6lBm;d%+>G!"+=D;:/gh)8@rH7"AncKQ3Zp1#
3Zoen+E^pA-OgCl$;No?+Du+?DBN@uG%G]'+Eh=:@LWZdATMrV3Zp.2+?qJ$0ea%DATAo3A0<QK
E+rft+Co1rFE7luATAo8D/a<0@j#`5F<EY+-Zip@F<GI>F`(f*GUEq-ATAnL+E(d5-RT?1ATAo3
A0<TLE+rft+Co1rFE7luFCfN84ZX]?+?CVmF^-:'$>"6#FDYu5Ddso/F`\`f3[]#\F*&OJATD6l
Bm;!7$>"6#1E^UH+=ANG$>"6#De'tG+E2%)CER/%@ruc$$?Tj#F?MZ-1E\_$-[6aa+F,=D$>"6#
FDYu5Ddso/F`\`f3[]#\F*&O5A9MO)@V0>!+Cf>-C1_1)-OgDoEZd%Y?SN[6DJUFC-OgDoEZd.\
De't<-OgCl$;No?+B1d.<$5+>6UO:@;asb\%13OOATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFCfN8Ci<flCh6sfC2[Wi%16r\CLp=NFD,c-F*')k:-pQ_D..3k:gnHZFCfN8
0JXbm/M/(nD..3k.3NS<FD)e9ATDX1FCB9*Df0V=De:+?D..3k:gnHZFCfN80JP"/%15is/e&._
67sC(ATD6gFD5SQ+:SZQ67r]S:-pQU+<W?e+CT>4F_t]2+=M>CF*)/8A2#\g+EV19FD>`)0JP+$
FCfN8C2[W:1+=>UEb/[$ARl5W:-pQU+<WBf+EV19F<DuK@;BFN@<?1)ATMrI0e"5cF`%Wq:-pQU
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP;"Dg!lp%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)o+C3=>J0HbCIG%l#/A0>K&EZf*>3A*34-t@1*Eb/[$AM7P3ATD4#ALSa3BOPdkATJ:f
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8
Ci<flCh4_:5s[eR@;BFN@<?1)ATMrI1+*M<%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
%15is/g,7IF*&O8Bk)7!Df0!(Bk;>p$=mj\FE9T++?MV3FCfN8C2[W:0HbIKF*)/8A2#_\FCfN8
C2[W:1+*M<GBA+LATL!q+?MV3DJsZ8+CSf(ATD6&G%G]'-OgCl$>+!gAT2("BK\C!C2dU'BHS[O
FCf<.0..29%15is/g+S=C`m\*FD)e9ATDX1FCB9*Df0V=F(fK7Ch+Z*@;BE`$?1)M3Zohb/g3#"
+@.V(0H`(mBeCMa%13OOATAo3A0<9SHZ4'UHXpi#FE7luFD,B04ZX]60RIb\.=68\H#R>9%16Ze
+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/13,(Bkh]:%16Ze+>Y-YA0<6I%13OO
ATAo3A0<9THZ4'UHXpi#FE7luFD,B04ZX]60mdk].=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9
F!hD(ATAo1@;BEsAnc'mE+*j%/13/)Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3A0<9UHZ4'UHXpi#
FE7luFD,B04ZX]614*t^.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'm
E+*j%/132*Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3A0<9VHZ4'UHXpi#FE7luFD,B04ZX]61OF(_
.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/135+Bkh]:%16Ze
+>Y-YA0<6I%13OOATAo3A0<9WHZ4'UHXpi#FE7luFD,B04ZX]61ja1`.=68\H#R>9%16Ze+EVI>
Ci<f+E-67F-Zj$9F!hD(ATAo1@;BEsAnc'mE+*j%/138,Bkh]:%16Ze+>Y-YA0<6I%13OOATAo3
A0<9XHZ4'UHXpi#FE7luFD,B04ZX]621':a.=68\H#R>9%16Ze+EVI>Ci<f+E-67F-Zj$9F!hD(
ATAo1@;BEsAnc'mE+*j%/13;-Bkh]:%16Ze+>Y-YA0<6I%13OO%15is/g++^;cFl<<C9,B;c?.c
9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs
?O[>O$>jU#;f-GgAM>f567sa)Ci`NlDeio<0HbHh/KcHYCi_$JF)>i2AKZ)+F*'#D$;No?%15is
/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.De(OZ.3N2HBleB;+>"^VF`&<M@rc-hFCfQ*
F*(r,@ruF'DIIR"ATK:0$;No?+<Vd].3M5Y6m-#OFs(=0@ruF'DIIR"ATJtBC2[WnATfUIC2[W6
+E_d?Ci_$J@<Q'nCggdhAISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW+1gtN>0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8Ci<flCh4_:5s[eRCi`NlDeio<0II;:%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OZ
-OgCl$;No?+D,2,@q[!+Df'&.F`_>6Et&IfEZf:2+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH
+=ANG$>"6#FDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+C\noDfTE1FE/L4AoqU)F*)FFF(fK9E+*g/
-OgCl$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$
FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)
A5d>`CLnk&$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<DfTB0/0JSG
Dfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP
4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2
@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D+Bos:-nlf*0eb:1+?DP+
?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sC%Df'&.B6%p5E-![RF_Pr/F!,[<Eb-A0Ddd0fA.8lW
EZfI8F*)&8E-"0'+D5_6+=ANG$>"6#1E^=NE$-MU%16`gE,K*$AN`'s0d(FL@r!3/ATMs+Ec?(/
$>4Bu@rH7,ASuU24ZX^6/g+eIE$/e6E,K*$AIStU$;No?+E2IF+Co1rFD5Z2@<-W9A8-'q@ruX0
Gp%$7C1Ums%16Wa4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1LZ$;No?+Cf5!@<*K!DL!@DEb0E.
Dfp+DFCfN8+EM%5BlJ/:@<-I(Amo1kEt&I2+Bot#ATD4#AKZ)+F*)J5E]lH+;aXGi?Y"(+B6%s/
@;TR,-SB+JF!hD(ATAo(E-#T4+=C&_:K0eZ9LM<I-T`\'%13OO:-pQUAn?'oBHVA<@<-I4E$,Ss
@qK@cBl%?D3Zr0V@<?0*-[oQDDJ!Tq06;5DEccGC/no'A-OgE(FE1l'B0A9uEb/Zi+Cf"rAnc'm
%13OO:-pQUEb0*+G%De)DL!@DEbTH4+EV19F<G4:Dfp"A/Kf+V@<-I4E%Yj>F!,1<+E).6Gp%-=
@:UL)BOu'(8g%qg@:XEg$;No?+EV:2F!,=BF*&O6AKYN%DIjr"AS,k$AKZ#9DJj0+B-;;0BlbD=
ATMr9/Kf1WAKYK$DJ!Tq+Dk\-F`S!!%15is/g+eIDfp"AF(96)E-*4DBQ&$0A0>>m+Dkh6F(oN)
+D>>,AIStp1E\_$0I\+r/g)Ys0-FnJE,K*$AKXDo+EMXF@qK@:3ZrHS@:UKjAnP^iCh4%_BkAt?
Gp$X9/g)kkAScF!/g)hj>9J!#Dg-//F)rHOARoLs+F[g=DJ!Tq06;5DEccGC/no'A+>"^VASl@/
AKWQg+=A^QEc>o)D.Oi$DIb@/$7QDk%15is/g+e<DImisFCcS-Ec6)>%16Ze+Dkq9+D5_6DIIBn
%13OO:-pQU@q]F`CER5'Ch4`#G\M5@Et&IgAU%p1F<G[:F*)J5EX`?b$;No?+D5_5F`8IEBQ&$0
A0>>m+DG^9F*(i2FEMOTBkh\u$7d_^+D5_6DIIBn+@Rn*Eb/Zi+Cf"rAnc'm%13OO:-pQU@r,^b
EZee.Gp$a?Dfp"ADdmHm@ruc$$8EZ-+D#S%F(HJ'@<6!j4ZX]uEc>N,DKKH-FE7lu%15is/g+tK
@:UKnEc6)>+:SZ4+Bot)Ddd0!B6%s/@;TQb$4R>;67sC!@VTIaFE8R=DBNS4Dfp"AF(fK7Ch+Yt
AKY])+C\c#AISu#+?V\-DIXeu@<6!j%14g4>9INhEaa$#+C\c#ARl5W%15is/g+S5A0>;'B6%p5
E$0+<F*&ODEc5H!F)u8?%17&mF*)AADdtpk+=D5IDfp/@F`\`R-Zj$9F!,1<+CQC7ATMr9De:,6
BOr<)DIjr0F`M%9FD,B+B-AWM-OgDoEZd1]E-67F-mqhe;cI*O/8'!BDIIBn.6C.#6W-KP<*s'K
De*3:E,Tf>E,ol,%13OO:-pQUEb/lpDImisFCcS-Ec6)>+CT.u+ED%0Ddd0!/Kf+JDfol,+EM47
G9Ca6F)tc&AISuXEZf48F!,+9E,K*$AISu$+Bot)Ddd0!B6%s/@;TQb$4R>;67sC$ATW'8DBNS'
DImisFCeu*F(96)E-*42F!,L7F*2;@%17,c+Bos9Eap5)ASuR!E[O"2+>P'VCi^_3Ec>o)D.O.`
0d'[CF(fK9E+*g/+D58'F(95"$4R>;67sC$ARoLqARfg)B4YslEaa'$A0>r'EbTK7+EVNEDffZ(
EZd_F:.@fF<Dl7R+D,P.A7]cj$8EZ-+D,2*@<6!&C2dU'BHS[OFCf<.0./;`Ec>o)D.P7G/no'A
-OgDoEZen3F(KG9-W3`9<(9YW6q(!$4"#K!ASlB6%16Ze+Dkq9+D5_6DIIBn%13OO:-pQU@q]F`
CERY/A8-'q@ru9m+D,>(AKYQ/BleB;%16]YG\M5@+DPk(FD)dEIWT.<E%`RiB6%s/@;TR,-SB+J
F!hD(%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?Z'dnG]6SuDeio<0MXqe.W009G]6SuDeio<0HbHh
/KcHZDe404.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>>5e.!0$A
FD>`)0Jk4$AU%p1FE7lu:-pQU+<WBf+=MASBl%i>+Co1rFD5Z2@<-W9BlbD*G%#*$@:F%a%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?C3=>I3=Q<j67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@s)g4ASuT4C2[X)
ATMs0De!3lAKW?d5s]C,AU&/mD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>;67sBsDdd0!F)Po,+E_d?Ci^_5DKKe>FCfN8+Dbt+@;KKa
$>"6#De't<F`_>6F!i)7+>Y-YA0<6I%16Ze+EVI>Ci<f+B4Z0-4$"a1BQ&*6@<6K4@rH3n-OgCl
$?Tfm@rsjp+=D8BF*)/8A2#hf%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBjEb/[$AKYl%
G9D*JEb'56FD,*)+CoC5DJsV>AU%p1F<G:8+EV:.+Co1rFD5Z2@<-W&$>sF!GAhM4F$2Q,-o2u,
+>>5R$>s^%4Y@j2,[i_C$>+3s?[$O$/g+j\+>GPmA8a(0$6UI/ATr?=A3DOf-ms4ZA1&oV,!'pg
A19&WDJ^aM/0[,cBk2+(D-p^dDe*2t0F\@3+=M,=GB\(<.6T^7>p*>o0d/S5-8H#;+<YQ=F$2,u
DJaGG4Dn_SGB.4'$>"*c/e&/*D0$-n.1HUn$;No?+EMXCEb-A2ATo8@DfTB0%17<"A8Gt$F?MZ-
DIn$9DfTB0+>=63ATAo8D/a<0@j#`5F<GdJA8Gt$F:AQd$;No?+EV:.F(HJ3ATo8@DfTB0+CoC5
DJsV>BOQ'q+D#e:Cgh3iFD5Z2Et&IfEZf7DAU$@!+Du+/G]4cQ-OgE,Eb'!#F*&O9/g,%UAU"Xk
%15is/g+_ME,8rsDBO"=D.Oi.Afu2/AShk`ATAnI+?1K_F`\`S2'@5u+Eqj:Ch[s4.3L/o+?V#o
DIdZqF_t]-FCeu*@rGmh+DGm>@:EngEb0-1-OgDoEZen1GBc83+Du+/G]4cQ-OgCl$;No?+Du+8
AKYo'+EV:.+CoD#F_t]-FCeu*GAhM4F!,O;Dfol,+C\n)Df-\>BOr<&BleA*$8!kY2'@5u+Eqj:
Ch[s4.3N1S+CoA6GRXuh$;No?+CfG'@<?''DIn#7FCfN8F!,R<@<<W&D]iq9F<G.>BleA=Bl5&8
BOr;sBk)7!Df0!(Gmt*uATr6-F*)Id3Zoh,+?CW!.1HW%D0%im+>=ol,[i_C$>+3s?Z^@2/g+j\
+>GPmA8a(0$6UI/ATr6-F*'Pt+=D8PF=/Uf,!'geF=AagDJ^aP,!'7KA8ZO,?X[\fA7$H5%144#
DJaGX/g,%KF"D3?GB@D;F?:jlBPDN1BlbD*+EV19F=.M)ASu$2%16uiEt&I*%13OO:-pQUF*)>@
AKZ)+F*)I4$?U?2FCAWpAN`'sDIn$6ATMs7+>=63ATAnJ+E2IF+EV[HFCAWpAIStU$;No?+Du+8
AKYo'+EV:.F(HJ9ATMs7+D>2,AKYQ/E,8s#@<?4%DK?6o-nlcj+u(3^F*)M4@VfU)+D!/J0d(@P
AU&/:-RT?1%15is/g+YEART[l+Dtb7+D5_5F`;CEAo_g,+Dtb7+EqaEA9/1eB6%s5@:DA\+Eqj:
Ch[s4+FAP[-o!D?0etF3HSZdSDf&r+,Bn0=Ch[s4%16`gE-,Mt4ZX]6-YII=-RLAk/j:C3+F>:e
+D5_6FCAW-+=o,fB6%s5@:BZQ4"qe(+u(3QEc<3W+D5_6FCAVf$4R>;67sBuDf0,/De:,6BOu6r
+D5_5F`;CEBOQ'q+D#e:Cgh3iFD5Z2Et&I)0Hb]d0d(+LE-,Mt.3N1S+>P'WDe404+=ANG$4R>;
67sBjEb/[$AKYl%G9CsLBlmp-+D,Y4D'3_-G9D!=F*)I4$?L?(FCAWA3Zoh)+F>:e+EV[HFCAWp
ALSaKINU$n0L%9I0I_?)+Cf>,@NZn;F*)M4@VfTb$?L?(FCAWA3ZoguF*21E-7gJr4s2O%HQk0e
F*22=@:CZ./1r&dF_Pr+@LWZ+0Hb]d0d'aE1E^=NE$@"ZF*22=@:BZQ%15is/g,%MDIjr/Afu2/
ATME*F*22=ATJu-@<Q3)AU&01@;]LqBl@m1%14L;+F>:e+EM[>FCAW-+D!/J1E^RRAU&/:-RT?1
%15is/g+YEART[l+Dtb7+B1d3<*s'KDe*2tD.-ppDf[%5Ec5e;FCfN8Et&IfEZd1]E-67FD.-pr
@:DA\+=JUS@:LZ3/1)u5+>=pb+u(3^F*)M4@VfU)+=o,f-p1Ht=B&X9C2[Wi.3L/o+>G!c+u(3^
F*)M4@VfTb$4R>;67sBuDf0,/De:,6BOu6r+DkOsEc6"ABOQ'q+D#e:Cgh3iFD5Z2Et&I)0Hb]d
0d(=A@ru-g.3N1S+>b3YDe404+=ANG$6Tcb%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3lARB.dDe*3mDffW4E)UUl
CLo1R:-pQ_DJsW0Ec=roDeio<0HbHh/KcHZDffW4E%)oND/X3$+EV19FE9&D$;No?%15is/g)8Z
0I\+mFCfN8C2[W:2(9YZG\M5@F!*%WEcl7B-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7%15is/g)8Z
0e"5;:IH=9ATf2,Bk)7!Df0!(Bk;?.-u*[2A7]p8+DPh*/0K(WBl%i>+CTG%Bl%3eCh4%_:-pQB
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`gCbdsZ$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"EcP`/F<G=:A9;C(
FDPl*@;KKt-UC$aDJsW0Ec=roDeio<0II;:%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
:-pQU/ULGc;cFl<<'aD]I4Ym8%17/iDg-//F)sK*>p*>o0d/S5-8H#;%172fBk)6J3ZoelATMs.
De(OZ-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&IfEZf:2+?MV3C2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-Gg
ATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp
1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]Rg
FCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,
+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!@VTIaFE8R=
DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80F\@D
+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sC%Df'&.B6%p5E-![RF_Pr/
F!,[<Eb-A0Ddd0fA.8lWEZf"8E$-MU%16Ze+>Y-QEc<-K-OgCl$;No?+EM47G9C=3Gp%6IB6%p5
E+NQ&GAhM4Et&IfEZfF:Dg-//F)rIAB6SB,F$2Q,DJsW0Ec<.L/g+\BC`k)Q%13OO:-pQUB6%p5
E$/_8ATE'<BPD?s+CT.u+ED%'BOt[h+>"^VATN!1F<GX<Dfol,+C\n)DKTc3%16Ze+D5_6+=CT6
Cj0f<A92C(Dfp"H4+/`!B6SB,Et&IfEZfF:Dg-//F)rIADffW4E$0Q]+CoA++=ANG$4R>;67sB4
HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FCfN8Ci<flCh6sfC2[WiDKJfoDeio<0MXqe.W0?,D/X3$0JFVk/M/(nDKI<MF)>i2AKZ)+F*'#D
$;No?%15is/g)Q[F=A=\DIn#7FCfN8.3NSG@:Nki+EV19F<G[:G]Y'BDBN@1+A*b)8l9[QDfQsC
8k;l0+EqO;A8cZ$$;No?+D,P4+<Y6+Bln',B.b<+BOr<.AU&;>BlbC>A7]dqG%G2,Ao_g,+EV13
E,8s)ATJt:F*)>@ARlo+Bl4@e:-pQUE+*j%+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+CT>4F_t]2
3XlEk67r]S:-pQU+<W?e+=M>CF*)/8A2#eg+D#e3F*)IG/Kf(VDBL?;Eb/[$ATVL)FC])qFD5Z2
@<-'nF"%P*:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`g
Cbe![$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"
EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aDKJfoDeio<0II;:%172gF*(u2G%ku8DJ`s&F<DrDDf9/6
4"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%17/iDg-//F)sK*>p*>o0d/S5-8H#;%172fBk)6J
3ZoelATMs.De(OX-OgCl$>"6#De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgCl$;No?
+DtV)AKYo'+EV19F<G[:D/a<"FCcRH+=M,L.3NGFDejD:AoD]4FD,B0+DtV)AKYo/+EV:.+E1b2
BFP;'+Bot0BQ&*6@<6K4FDu&6@;TR=3ZqBj;cH[p<C1&$C2[X)Df9H5?O[>O$;No?+Co%q@<HC.
+EV19F<G[:D/a<"FCbmg0d'[CFDu&<AU&;[3Zp."A8-+(+B1d.<)Zar6=4/9De*s.DesK%%13OO
:-pQUD..3k+CQC1ATo8=ATMr9F(96)E-*4EASlBpFCbmgDIn$6E,7Zu+=Jod3Zp+*%15is/h23s
<.96<F=f'eFCfN8+=MSc<.96E+EMXI@P/)s:-pQB$;No?+B3#gF!,R9F*&NPH[\qCI4$.HAS6',
AoD]4/hSb!AoD^,@<?U&A0>u*G]XB%:-pQU%15is/g*_.;cHXd:.J5*GA(E,+AtX)9L2$7+C\nl
@<HX&+@K?u6qKa@<"01067r]S:-pQU@<6L4D.RcL%15is/e&._67sB'0I\,\BleA=De:,6ATMr9
@<6L4D/aT2Df0V=/hSac$;No?%15is/g+SFFD,T5F#kEdH[\80I3;s9A0=cG6:jo]$;No?+CfG'
@<?'k3Zrcu7"0On$;No?+EM47Ec`F7@<?'A+FAQ97"0On$7QDk%15is/g,=GEbTH7F!)lFC2[W3
+Du+?DK?qCF(Jl)FDi:6Bl%T.FCf<.CghEsEt&ID9L2TU5uglT:JtP6C2[Wi4ZX]56=FsY9jqoe
%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+E2IF+EV13E,8s)AKYo/+E1b2BFP;[EZd(Z
E-67FFDu&6@;TR;DIn$6E,5sj%15is/g+YEART[l+CQC1ATo8=ATMr9/KetNASuQ3ARoLs+EqO;
A8cZ$$8EZ-+Du9D-XpM+@psOl-OgCl$;No?+CfG'@<?''@;^"*BOu3,FCfN8+>"^SE+Np.+CT/+
FD,6++EqO;A8cZ7/Ken=CLqQ0F*)G:DJ()5F^fD$$8EZ-+=AC4<)Q:_7oLXCD^/.K:eX/B73bAH
A8`\\=[>GI6V^T*8K_GY+EqL-F<F-t@;R5e:I7WJ,?Jf"G%G].DIk1<DKI!K@VKIkH"19+AL@cn
$4R>REaa$#+=BNM5uU]J<E)Lb;I=-QDe*3&%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EP.UFDPl*@;KL^BkhQs?Z('dD/X3$
0JH6g/h1a_;f-GgAM>e\F=f'e-uO5X+EMC<CLnW1ATMrG%15is/e&._67sB/DKdNP-uNU?+EqaE
A18X?CgggbF!,[FEb$;7AU&;>Bl5&%+<X9!-q[?Y+E)9C+A,1'.3NhKDId[0%15is/g+bEEZcK9
A8-."DJ(RE<+ohcFCf]=+DGm>+Co&(Bm+&u+D,Y4D'3q3D/a<"FCfM9+EMXCEb/c(+DG^&$;No?
+E1b2BHUi"@ruF'DIIR"ATKI5$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3L$\ATMs.
De(OX.3N2HBleB;+>"^VF`&<M@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:0$;No?+<VdL+<VdL+<VdZ
/hSac$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JYJ"F_ifm
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aF`MM6
DKI"9De*s$F*)5:@ps1b+=BH@6#LmFD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:1FEV=ATAo3A0>u)Bk)6-
>9G^EDe't<-OgCl$;No?+D#(tF<G[:G]Y'MASlC&@<?''/KfCh=FPZ@@<,p%-uO5X+E2.*@q?cr
DerrqEcVZs:-pQUFD,B0+Ceht+C\n)F`V,7+Dl%-BkCpe+DG^9-u*[2E,ol/Bl%?5Bkh]<+EVN2
$;No?+Cei%ATAo8D]j=DF`JU8AT2ZuG%G2,DImBiF"SS7BOr;rF`MM6DKI"CASlC&@<?&i$;No?
+DGm>DfTQ'DKKH#+EVNEFE1f#Bln'-DII?(AU&01Bk)6-@rGmh+Cf>-G%GQ5Bl@m1%15is/g+kM
+DGm>ARTXoCj@.3A79G!ARlp*D]iS)Eb/a&+Co%qBl8$,Df0VK%14g4>9J!(Dfp/@F`\`o:IA,V
78?fV5uL?_@;9^kFDl)6F'f@`%15is/g)8b6r-0M9gqfV6VgEN5u'gTBkhQs?R[+3F!,F<@:NkZ
+CT@7FD,5.ASu$$De9Fc:-pQUFD,5.DIn#7FCf]=+CT.u+Ceht+Co%qBl7K)@:OCnDf0V=FCArr
DBO.:ASqqa:-pQUFD,5.ARoLs+EM%5BlJ/:BlbD;F`&f@$:IZW<D>nW<'sGU9gMNB?YO7nA7%J\
+=D5DDg-//F)rICEZc_WH[\_=I4$Bi%14g4>9J!(Dfp/@F`\`o:IA,V78?fL:JFPL:./H'C2[Wi
%13OO%15is/g,(OASuQ3@;[3!A8--.GA1r*Dg)Wt0d'[CDKd3N8RZI2ATq3oEb$O,$4R=O$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?XaWF*)5:@ps1b?YO7nA7'7c;f-GgAM>f567sa+A5d>`CLo1R+ET1e+=M/=.3N_DF*&OCE+Np$
DJ()1AftZ&FD5c,+E1b2BHS]]+E(d>+E)4@Bl@lA%15is/e&._67sBhF)uJ@ATKmA$;No?%15is
/g)8Z0I\,SDf00$B6A6+A0=JeFCfN8+D,P.A7]d(8l%iS78m/:+EMX5DId0rA0=JeF`_>6F!)lA
BlYaIA8-(+Eb/f2%15is/e&._67sBjEb/[$ARmhE1,(I?An>F*3=Q<j67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91hq/L
0K:1qAThd/ARloqDfQt8+?;&4+=L`<@rc-hFCd+8De3rtF(HdC@q]:gB4Z,n$;No?+>PfdAR[>P
+CSekARlonBOt[hF!,(5EZf:>ASu4"B-;8(D.Oi#Bk)7!Df0!/EZf4;Eb-A8BOPd$Df0&r%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aF`MM6DKI"9De*s$F*)5:
@ps1b+=BH@6#U:4D/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>;67sBpF!,(5Ch.*t+Cf>-Anbn#Eb/bj$>FQkAfrIM8l%iS78m/5%13OO
:-pQUDfB9*+CT)&+Co1rFD5Z2@<-'nF!,C=+=LZ/DIb1=E+*j%+>"^ZATE&=Ci=3(+DPh*+E1b2
BFP;[EZfF7FED&-@rrh@@:X7d-Qij*ATAo7BQ&*6@<6K42BZpK+=CT.DIb+($4R>;67sBi@<6-m
+C\bi+CT;'F_t]-F<G[:F*)I4$>"6#1E^UH+=ANG$>sEq+>t?\A0<6I%16uaEZd7_De't<A8c%#
DJsW.G\M5@-OgE#ATAnO+E(d51c$6s:-pQUBl8*&Ch[E&DIIBnEt&IoATAnO+E(d50d&D#-[B-2
@4)Kk%15is/g+b?EcZ=FA8,Oq+E)$</KetRBOu4*+DGJ+DfTE"+D#_-DBNY*+C\bi%16Ze+>t?\
A0<7.A8Yp*4!usG3&ilX3B9)[3B9)[3@>7C%15is/g+b?EcZ=FA8,Oq+C\bi%16uaEZd7_De't<
GB.V>B4>Rs@q[5O-XgP'A1%fnDImi22BZpK+=B*,3&ilX3B9)[3B9)[3B9)R-T`\aA8Yp*%13OO
:-pQUF(KG9FCfN8+Co1rFD5Z2@<-'nEt&IfEZfF7FED&-@rri8A8,Oq0KhH>-Zip@FD>`)0JFj`
$>"6#F(KH8A8,Oq+EV..@rsFg3ZoelATMs.De(OV-OgDoEZfF7FED&-@rri8A8,Oq1-IZ@-Zip@
FD>`)0JY!b$4R>PCiXW,@:O(93Zp4$3Zp*c$;No?+Cf5+F(HJ&DL!@CE+No0@;]TuDfB9*+EV19
F<G+.@ruF'DIIR2%14L2AmoCi+E)41DJ=!$+>#c"-S0Nl+CT>4ATDl8ATAo3A0?.?>9G^EDe't<
-OgCl$;No?+Cf5!@<*K!DL!@7F`MM6DKI"?@<?/l$7I96@;0O#E+*j%+Cf5!@<-("B-8ci+=A^c
.3N&?F(KB6+D#R9A8lU$F<Dqu9LV6F:dJ&O-OgCl$;No?+D#S%F(HJ&DL!@7F`MM6DKI"CATMr9
A8,OqBl@ltEd8d:@:O(qE,uHq6qfa)+F?-lHS.]_5u^B^?W0p2?V4*^DdmGj$8<SV,\CV.@<6!&
0d("@EZd\794)$o9IqP@/h/4X$4R>;67sBuD]iLt@r$4++D#S6DfQt3G]75(FCetl$7BFoBl"o$
@:O(qE-!.6Dfor.-Qli=F(KB6+Dtb2+>G\q@W$!)-S?bU$4R>;67sC)ALDM0+D5V2A.8l#%14Nn
$4R>PCiXW,@:O'qFC])qF>+.2@r-1-@UWb^+EV..@rsF7$=dmmFCJZgCER_0Bk)6?%13OO:-pQU
DfB9*+CT)&+EV19F<G+.@ruc7@;]Tu@rc-hFCcS'+D5_5F`8HT+EV:2F!,+0G%G_;FD,5.E-67F
A8,OqBl@ltEd8d9+E1b2BFP;[EZd.\De't<-OgDoEZf:2+EV..@rsCdFC])qF>5k!A8,Oq1*@#5
%16Q_D`p-PDf7d"Aku2c3Zr,h+>jT8ATAo8D/a<0@j#`5F<EY+-Xq"4+@pEh+D+DF-OgDoEZf"8
E$.5'-V//o7riNjE$/V.D]hShD]iXf:F@7o$4R>;67sC"F`\a:Bk)7!Df0!(Gp%'7FD)*jE+Eor
FD*fu+?Op20mdqa?X[\fA7$HiBk/?8+>=63%16Ze+>Y-YA0<6I%16Ze+>t?\A0>u)Bk)6=%17#a
2K3)HBK\C!4*s"CHZF::@;9^k?Q`lnA0?=D0F\?u$;No?+E1b2BQG;;BQ&$0A0>_tFCStn$?0Np
@<?0*/NP"mA2\C8FD)*j%15is/g,7LATME*A8,OqF!,O;Dfol,+D>2,AKYQ$E--@JE+*j%Et&If
EZd.\De't<-OgDoEZd7_De'u4A8,Oq0b"I;0..l*+?Op20mdqa?X[\fA7$HiBk/?8+>=63%16Ze
+>Y-YA0<6I%16Ze+>t?\A0>u)Bk)6?%14I9-QkPp4*s"CHZF::@;9^k?Q`lnA0?=D0F\?u$;No?
+Co1rFD5Z2@<-'nF!,O;Dfol,+E).6Gp$O7E+NHu+E).-AKYo/+EV:.+E1b2BFP;D67sBtF_l/6
E,9).DfB9*Bl7R)+CT;%+E(j7DJpY?F(HJ&DIakuEb-A&ATMr9F*2G@Eb0<5ARl5WATAnL+E(d5
-RT?1ATAo3A0>u)Bk)6=%16Ze+CoG4ATT%B6VKp7;G]YY81+iRATAnO+E(d51a>,)A8,Oq0F\@E
+?^hl+Co1s+>=63ATAnL+E(d5-RT?11*A_&,9UN2A0>f$+>b<*FC])qF>+.2%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0
De!3lARB.dDe*2a$?B^$Dc:LkCLo1R:-pQ_Eb0E4;f-GgAM>e\F=f'e-urmBD^cfMD/X3$+EV19
FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:2CTb[G\M5@F!*%WF(Jo*-t@:/@<?(&ATMs(Bk)7!
Df0!(Bk;?7%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?
C3=>J2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`
@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]O&G&L;rDeio<0II;:%172gF*(u2G%ku8DJ`s&F<DrD
Df9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(O[-OgDoEZf:2
+EV..@rrht+>Y-YA0<6I%13OO:-pQUBl8!'Ec`FJDfTB0+EVNED..3k+EV:.D'3k1@qBP"%160J
6#pO"3Zr,h+>P_^$;,G^F?MZ--Xq"4+D>\3-OgDZF`^2m6tp-o3ZrcrGT\LZH$t)M$>"6#FDYu5
Ddso/F`\aMEb'5S3ZpLF-WakFEb-@cF`VXI:j$kODFA2K-OgCl$;No?+ED%:D]j+>Ecc@F@UX=h
A0>f.+DG_8ATDZsC`mh6D.Rd1@;Tt)%16Ze+=D2N+EqpAD.Rc94ZX]>+>GYpB4Z0-GB.58%13OO
:-pQUFD,62+EM47F_kS2@V$ZoBl\9:+EqaEA9/l3DBL?JAThu@+ED%7F_l./$>"6#EcuYIA90mp
+ED%:D]gDT%14L:3dr2-+F>^`I4cX_G'@t;F"&4`3Zp(:INWiTA9/1e%15is/g+YEART[l+EMI<
AKZ#)@qBP"+EV19FE7luATAnJ+E2IF+=DAE@<,p,4"#/g@Wc^%ASu'i+C]UD%16Ze+>G!XF`\`R
F`(Z2Eb&a!ARm/M-Xq?DGA(E,+=@U*ATAnJ+E2IF+=Ci2F!j$sB5_[!+C\noDfTD:%172gF*)Id
3ZpLF-[0-1Eb-A9DIRa/A7]XiA0>PoF!hD(ATAo6G'%;:FE9T++>G!ZAThu7-RT?1-ndW1+>Y-e
/g,Qp+EDXIATMs7.3L3'+>5d)+EV19FE7lu%15is/g+YEART[l+EMI<AKZ#)@qBP"+D5_5F`;C2
$>"6#1*C4ME$-N;Df9<-D^RVjEb'5#$>"6#1*C4ME$-NMDf7!b14(WtEb'5#$>"6#1*C4ME$-NR
DfmEh?SZs\GB.58%172iEc?(_3ZpLF-Xq"4BQ%f3FDl(?H#IgQ%16Ze+EDX<Ec?(_3Zp1#Eb0E4
+=ANG$7IPgINUEhHS-Fh/g,1XB6%s4.3L3'+>5d)+EV7:E,uHq%15is/g+YEART[l+EMI<AKZ#)
@qBP"+EM[>FCfM&$?C<3ATMs74ZX^6/g,1XFCfN8Et&IfEZd.\B6%r6-Xh(=Blmo64*#LdATMs7
%16Ze+>Y-QEc<-KDe<g"FED>1-Ta)1/ol,WATMs7%16Ze+>Y-QEc<-KA9D`uFCfN8F!j%V14(Wo
G'%;:FE7luF*22=ATL!q+?MV3@<6R*FCcS5Ao)1'FDPM2A9D`uFCfN8F!hD(ATAo6G&qe?FE9T+
+>Y-\AThu7-RT?1-ndW1+>Y-e/g,Qp+EDXHF_Pr=.3L3'+>5d)+EM[>FCfM&$4R>;67sBjEb/[$
AKZ&4D.Oi1ARf:hF<GF/@rcJs$>"6#1a$a[F<DrTARTUj-Ta(@4"#/g@Wc^%ASu'i+C]UD%16Ze
+>b3[F`\`RF`(Z2Eb&a!ARm/M1,V-@@X0)?BOQ!*-OgDoEZd1]E-67F-YQq0-Ta(@4""ZZDIjr"
AS,k$AL@ooD.-pq4ZX]I3[],_@<,p%F`(Z2Eb&a!ARlos@<3e*$>"6#Ecu;.@rjdo+>b3]AThu7
-RT?1-ndW1+>Y-e/g,Qp+EDXB@:O@-+>#Vs004P)D.-pq%13OO%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WATMs0De!3lARB.d
De*3qD,Y:iCLo1R:-pQ_Ec"`lDeio<0HbHh/KcH^D(-TKD/X3$+EV19F=n"0:-pQB$;No?+=M8I
.3NYRDK?pm:IH<JD.-ppDf[NR+A,Et+<YN0@rcL/+<Y*5AKW+:Bl.g*Gp$O9@VKq)@<-W9+A*(M
:-pQUF(96)E--.R+<XWsAU,C@@ps6tA8`T!DKKQ+DJ()+DI[L*A8,po+CT).ATDL&B-8<h:IH<J
GA(],AISuA67sC$F`))2DJ(RE+<X9!+<Y`8EbTK7F!)SJ@<,p%+<YB9A8,O^FCeu*+<VeNBln#2
+<Y04A7Zl++<WEo%15is/g)Q7;aXGS:fLe1C2[Wi.4u`=FD,6++EM%5BlJ08+>"^EEaia)Eaa!6
+C]V<ATJtG+D>2,AKYK$A7]fk$;No?+=KrM6W-]Z=\qOo@;9^k?R[TM:Msuo+A*bt@rc:&FE8QI
-t@1+AKW`_.3N,/DBNtBDD!%S:Ms_dDe9Fc:-pQUFD,5.D..-r+E_a:F!,C5+Du+8+A*bn@:O=r
+EM%5BlJ08+DGm>F*)>@Bl7Q+E,ol0Ea`f-@rGmh/.Dq]67sBZ;+rM`:jI.rDf-\+DIal3AU&;>
9gMZM6r-lZ/0IVP<(0n3Bl5%c:IH=9Bk)7!Df0!(Bk;?<%15is/e&._67sBhF)uJ@ATKmA$;No?
%15is/g)8Z0I\+mFCfN8C2[W:1FXGXG\M5@F!*%WEcl7B-t@:/@<?(&ATMs(Bk)7!Df0!(Bk;?7
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(I?C3=>J3"63i
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@s)g4ASuT4
C2[X)ATMs0De!3lAKW?d5s]O.;f-GgAM>ec%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0Jb'c$>"6#De'u4A8,Oq+BosE
+E(d5-RT?1%15is/g,4WDfTD3@3A/bF(96)E-*3S+Cf>#AKW`_%16Ze+>b3[F`\`R6#:@=DfTV@
4%`F=;Fs\a?X[\fA7%DGF)>i<FDuAE+=o6$+<r![3[Z:`Cht5<DfTV9@;]TuDJpY:CghT3D..3k
+DP=pCER%.A9D^)+C]87+=ANf9L^B=$4R>;67sC$F`&=DBOr<-@rc:&F:AR3+Bot/D'12lCi!0k
Ebd$3$4R>;67sC%FDl22+EMI<AKX]5;G0DR=&'l[AU&;>/KePAA7Zl=2[p+*EZd1]E-67F-V\#i
CIE;^@OF635uL?D:KL:u@;9^k?TTW7BPDN1BlbCb770a7;FNtr9jr'XA8c[0/g*`-+DGm>DJsV>
G%#3$A79RkA0><%+EM[8BJ(YA$4R>;67sBuDf-[i+EM%5BlJ08+CoC5DJsV>Ecl7B%16uaEZfC>
+=BllEbe'cD.4k%$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7'A!FAm$pCLo1R:-pQ_EccD%D/X3$
0JFVk/M/(nEccCP+EMC<CLnW1ATMrG%15is/e&._67sB/EccCP+EDUB+EV%7FDku6B6bVAATMr9
BlbD8DIjr/Afr4<BOr<'Df^"CBOtUqBl&&;F`V,)+A,Et%15is/g+kGFCfK)@:NjkGAhM4F"SS,
F<G:=+E_a:A0<":D]j(CDBMOo+EV19F<GX7EbTK7F!,OGDfTE"+DG^&$;No?+A,Et+Co1rFD5Z2
@<-'nF"SS$+A*buATMr9+EM%5BlJ/:@rH7+BleB;+<YT7+CQC6AT;j(DI[6#De9Fc:-pQU@<6L(
B5VQtDKKqB@;]TuF*(i4ASl!rFE8RHBOQ!*Eb0?8Ec*".Cht4KF"Rn/:-pQB$;No?+CT>4F_t]2
3XlEk67r]S:-pQU+<W?e+=M>CF*)/8A2#eg+D#e3F*)IG/Kf(VDBL?;Eb/[$ATVL)FC])qFD5Z2
@<-'nF"%P*:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`g
CbdsZ$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGk"
EcP`/F<G=:A9;C(FDPl*@;KKt-UC$aEccD%D/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:1FEV=ATAo3A0>u)
Bk)6->9G^EDe't<-OgCl$;No?+DG_7ATDl8@3BZ'F*&OG@rc:&F<E.XEb0?8Ec,q@@;Ka&0lmd2
FE:r40KhH>4")4!:-pQUF(KB+ATJu4AftMuC`kHR-T`\1-T`\10I/A#4!umJ0ea_)1*A;--Rg/h
-8%J)9L]HuATAnJ+E2IF+=BHkCenq[F!j%kF(95E%13OO:-pQUF(oH%DKK]?+EDUB+EM%5BlJ/:
/Kf+JDfol,+E1b1Et&I2+EDRG+=BHkCenq[F!hD(%15is/g+kGF(KB6+CQC6@rc:&F<GdAFD)e*
F<GC2@<6N5Df0,/0F\A2F(95F4ZX]I-m0m467sBhF<GC2@<6N5Df0,/H=_,8-T`\1-T`\10I/A#
4!umL0ea_)1*A;--Rg/h-8%J)9L]HuATAnJ+E2IF+=Bp&F?s_Z:Ms`b-TcEk@ra:5$4R>;67sC%
Bl%?uFDQ4FEcl7B+>"^WBQ&$0A0>JmBl"4cDImi20d(LYF<Dr+Dfe9]Cenq[F!hD(%13OO:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EP.UFDPl*@;KL^BkhQs?ZgF$F&QpoCLo1R:-pQ_F`V,8;f-GgAM>e\F=f'e.!9TBF"&5QD/X3$
+EV19FE9&D$;No?%15is/g)8Z0I\+mFCfN8C2[W:2^ok\G\M5@F!*%WEcl7B-t@:/@<?(&ATMs(
Bk)7!Df0!(Bk;?7%15is/g)8Z0e"5;:IH=9ATf2,Bk)7!Df0!(Bk;?.@<Q'nCggdhAISuA67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+1hq/L1,]RK:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!p1Eb0-1+DPh*FCfN8
Ci<flCh4_:5s[eZF(KDkD/X3$0JFj`$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?
+>%q>78m/.;cH%\<.->-$4R>`BQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>aA8,Oq4ZX]5FCfN8C2[W:
2^]%A%15is/g+tK@:UL%Df'&.8l%htA8,OqBl@ltEd8dODfTB0+EV:*F<G7*G%De5@;^?5Eb/io
Eb0,uATJ:fATAo3A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%13OOEb/j(4ZX^.F(KD>
4s58++CoA++=ANG$?B]iF$2Q,/2&,00d(fe0d(LJAoeCg%15is/g+kG@r-9uAKW1;AS,P"+s;)J
Eb'56GA2/4Dfp.ECi<flCh4`1F_56"G\(q*$?B]iF$2Q,Eb/j(+<u=X0H`M$HTE?*+<r3s+ED%*
Et&IsAS-!H3Zp:&HS-F]AS-!+H[[)B3Zp."HQk0e,:5SsEb/j(%17<"A90mp+=M>ME&Bd>+>=pb
+u(3\AS-!4/0I"s0d(fe0d(LJAoeCgATAo8D/a<0@j#DqF<GdJA9/1eATAo3A0>u)Bk)6->9G^E
De't<-OgCl$;No?+ELt7AKYDtC`mb0An?!oDI[6g+EqaEA9/l*Ec5e;FDl+@2%9n(EZfI@E,9H&
+E2IF+Eqj:F!*%e+EVO@2%9m%$;No?+ELt7AKZ)5E$."\@;]TuEb/ioEb0,uAISuXEZfI@E,9H&
+E2IF+?M9(FDl+U%16Ze+>=pNCi<d(+?M9(FDl+U%16Ze+ET:p4ZX^.F(KD84"u#'Df@QC$?B`4
2*EuC4!67#HRp:'0me!r2%9m%$;No?+ED%*F!,O;Dfol,+DkP/@qZ;Y-uroR2(9Y"3ZpU?+F>4c
+F>:e+ED%*Et&Hc$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#                               ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(a21,C%.+>GYp1,'h*1*A;2+?:Q!2'=V/+>Ghu0f1".0H`@u0f:(.1a"V6+>G\q1cHO40d&;4
+>GYp1,'h*3$9t:+>Gl!1,g=11a"Y1+>G\q1c-=00H`).+>GVo0fU:11E\G,+?:Q!2'=n%0f:(.
0d&21+?:Q!2'=V-+>Gbs0eje*3+QT:B6%riD/X3$0JFncASc""E%)oND/X3$+EV19FE;)+FE2V)
D/X3$0JFnfATVs;.3N\KDeio,FCfN8B67'hDeio<0IURU.3N\KDeio,FCfN8BP_X*Cf>1hCLo1R
-tmF9DJUaEF)>i2AKZ)+F*)/8A8#OjE)UUlCLo1R-u*[2BOu"!.3N\KDeio,FCfN8ChH[`Deio<
0IUaM.3N\KDeio,FCfN8Ci<`m;f-GgATVL)F>.NL@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+E(_(
ARfh'+DG_8D]gHMA8,Oq.;Wp2A5d>`CLqU!F*'-QDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$
C1UmsF!,17FDi9MFC])qF=D$E@:XIkF*',j0P"m-FD5Z2@<-X0Ddd0!0eb;++>RhF+E):2ATAo3
Aftr!B5VF*F_#&+FCfN8+Co1rFD5Z2@<-X0De!F#E)UUlCLo1R-u<g3B6%r?+EMC<CLnW1ATMs7
D..3k87?RQ@q]XVD/X3$0JFnl@;BF'+D>2)BHUeuARfKuF)>i2AKZ)+F*)J?@;BFF@<6*lBPUOg
Eb0<50JFnl@;BF'+DbJ,B4W2rF_u(?BOPsq+EV19FDYH%APcfWBQRg,F>,FjATVu9F`8IFATMr9
A8,OqBl@ltEbT*++D,P4+E1b2BHV2$D.Oi"CghC++EV19FE;;-CLp=NFD,c-F*')k-uEC.ALSa@
@<?0*E+O',F`_&6Bl@m1+E(j7-uEC.APcfWBQRg,F>,EuD/=8lD/X3$0JFnlCi_$JF)>i2AKZ)+
F*);<AU&/mD/X3$0JFnmDe404.3N\KDeio,FCfN8DJsW0Ec=roDeio<0IUgWFD#W5.3N\KDeio,
FCfN8F)H(uD/X3$0JFnmF=A>RD/X3$+EV19FDc;$D/X3$0JFnmG:=YUD/X3$+EV19FE1r9Dc:Lk
CLo1R-urmBD^cfMD/X3$+EV19FE;J>;f-GgAM>edEc!6JF)>i2AKZ)+F*)GEFAm$pCLo1R-usEO
.3N\KDeio,FCfN8F`V,8;f-GgAM>edF`V,8.3N\KDeio,FCfN8Er                      ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebL.0ea_++>G_r1*A;/2D?s11,'h++>Gc00f^@22BXat0f1RB+>GSn1*AA01,^700H`+n1GC[A
3?U%4+>P&s2_[-40eje++>G`02]sh8+>P&o0JYL.0fL41+>GZ11E\D0+>P&o0JZ6r6pamF9LMEC
;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>>Yq8muT[1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f1"F@;[2C0JYI-0f1pH1HI9F$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg3?Uq&DBL\g1,L+.1HI?K
3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K
3Zp.;+A-'[+>PW+1a"M/3]/fV2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[1,(I?+>G`72)mWS0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O
2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A
+>PVn8muT[1,(I?+>GW41bh$F2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>PVn8muT[1,(I?+>GZ51bh$H2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A
+>PYo8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>PYo8muT[1,(I?+>>f:1b^sE3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>PYo8muT[1,(I?+>GQ20JGOD
2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A
+>PYo8muT[1,(I?+>GT31H.?P2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t3$9>3@<?'A+>PYo8muT[1,(I?+>GT31cRNN0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo8muT[1,(I?+>GZ51bh$J
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+>PYo8muT[1,(I?+>GZ52)I?L2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u0d%T,@<?'A+>PYo8muT[1,(I?+>G]61GCjH0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A
+>>Mm7V-$O1,(I?+>G`71c%0J0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1a!o/@<?'A+>>Pn7V-$O1,(I?+>GT31,1gH1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A
+>>Pn7V-$O1,(I?+>G]61,(aE3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u2]s52@<?'A+>>Pn7V-$O1,(I?+>G]61Gq3L3=6*#:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>Pn7V-$O1,(I?+>G]61H7EN
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A
+>>Pn7V-$O1,(I?+>G]61c@BL0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P=!0H_K+@<?'A+>>So7V-$O1,(I?+>GQ21c@BP3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>So7V-$O1,(I?+>GT30ebXB
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A
+>>So7V-$O1,(I?+>G]61,q<L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P=!1E[f.@<?'A+>>So7V-$O1,(I?+>G]61GV!I2[Tm!:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_K)F_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqf2'>A"@N[E[1,L+-3BB#R3\`Q#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP.&+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>>Yq7V-$O1,(I?
+>GQ20etdH3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_K)F_PZ&+AR&r@V'R@+>Ynu+@KX[
ANCqf2'>A"@N[E[1,L+.0KLpI3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp+9+@]pO+>PW+1a"P.3\WQT1boCF$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>>bt7V-$O1,(I?+>PZ41G_'G
0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU
0K:1EARZc;0JYI-1,1gI2``WQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqf3$:\%@N[E[1,L+/1-.0J3\iAr$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp+:+@]pO+>PW+1a"J43]/oY2)u!N
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu
7V-$O1,(I?+>GT32*!]S1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`
F_tT!E]P='+<X'\FCdKU0KC7FARZc;0JYI-0etdD1-.6G$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt5+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.2+@]pO+>PW+1a"M-3]&WR1,fOI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnIk6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0ea_>ARZc;0JYI-0etdD
0fh0J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[
ANCqg1a#8!@N[E[1,L+.0KLpG3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+@]pO+>PW+1a"M,3\iZU1,oUJ$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G\q7V-$O1,(I?+>GQ21GV!I
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0esk;E,m'V0JYI-0KD0K1cdKL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3Zp:&+@KX[ANCqg1E]D#Gp"jr1,L+.0fh$K3\W8q$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AH9i+>PW+1a"M-3\rWS1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>So
8p,"o1,(I?+>GZ52)73J0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU1,'hCF`&<W0JYI-0f;!J1-.6J$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt6+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh0d')2DBL\g1,L+-3'&oN3]/]#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2
DBL\g1,L+-3'&oT3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GSn+@KX[ANCqh0d')2DBL\g1,L+-3BAlO3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh0d')2DBL\g1,L+-3BAlO3\rZ$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh0d')2
DBL\g1,L+-3BAoO3]/o)$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>G\q+@KX[ANCqh1*B23DBL\g1,L+.0KLmJ3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1*B23DBL\g1,L+.0KLsC3]&c&$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqf2BYV7
C`kJe1,L+.2**TL3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Get+@KX[ANCqf2BYV7C`kJe1,L+.2EENI3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2BYV7C`kJe1,L+.2EEQN3\`N"$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqf2BYV7
C`kJe1,L+.2EETN3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>PVn+@KX[ANCqf2BYV7C`kJe1,L+.2EEWL3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2]t_8C`kJe1,L+.0KM$M3\W>s$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2]t_8
C`kJe1,L+.0KM'O3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P_q+@KX[ANCqf2]t_8C`kJe1,L+.0fh!D3]/i'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf2]t_8C`kJe1,L+.0fh0G3\r]%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqf2]t_8
C`kJe1,L+.0fh0K3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pht+@KX[ANCqf2]t_8C`kJe1,L+.2EETK3\iGt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf3$:h9C`kJe1,L+.0KLpH3\iT#$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf3$:h9
C`kJe1,L+.1HI9I3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pr"+@KX[ANCqg0H`u1C`kJe1,L+.0KLpK3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg1*B23C`kJe1,L+.0KM'L3\iN!$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqg1E];4
C`kJe1,L+.2EETK3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU0f1"FF_i0U0JYI-0KD0O2EEQH$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151*@]+F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+A-cm+>PW+1a"M,3\`NR0fTLI$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1a#D5C`kJe1,L+.
0fh!C3\`T$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0f1"FF_i0U0JYI-0ek^D1-.3J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>G\q8p+qm1,(I?+>GT30fD'J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*@]+F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.6+A-cm+>PW+1a"M-3\iKP1,'%B$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Gbs8p+qm1,(I?+>GZ5
1b^sG3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0fL4IF_i0U0JYI-0KD0K1HI<I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=
6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2]t_8C`kJe1,L+-3BB#Q3\rGs$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.9+A-cm+>PW+1a"M,3\rZT
0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Gl!8p+qm1,(I?+>G`71bq*G1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU1,'hCF_i0U0JYI-0etdE1cdEJ$47,867sBZH#n(=D)re3:IH<f
4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,pCKF_i0U
0JYI-0etdI2EE]P$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqf1E\u+B-8r`1,L+.0KLsK3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp+4+@1-_+>PW+1a"M,3\rZT2)bjL$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.2+@1-_+>PW+
1a"M-3\`WU0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
0ejdn6t(1K3Zp1;+@1-_+>PW+1a"M,3]&ZS2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1;+@1-_+>PW+1a"M,3]&cV1bf=E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+B)ij+>PW+
1a"M/3\W<M1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
0f1!q6t(1K3Zp+4+B)ij+>PW+1a"M/3\`WU0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+:+B)ij+>PW+1a"M,3]/ZR0f04E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+:+B)ij+>PW+
1a"M,3]/iW1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
0fL3t6t(1K3Zp+3+AZKh+>PW+1a"J43]&iX0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp+4+AZKh+>PW+1a"J43]&ZS0KBII$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp.4+AZKh+>PW+
1a"M-3\iEN0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1,'gn6t(1K3Zp45+AZKh+>PW+1a"M.3]/fV1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp14+AQiu+>PW+1a"M/3\rHN0Ja%C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp17+AQiu+>PW+
1a"M/3\`TT0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1,C$q6t(1K3Zp.3+A-'[+>PW+2'=S53]/TP0Jj+D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@]pO+>PW+2'=V13]/TP0ej"B$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+7+@]pO+>PW+
2'=V23\WEP2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1,^6t6t(1K3Zp+7+@]pO+>PW+2'=V23]&NO0f04E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@]pO+>PW+2'=V-3\rcW2)YdK$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@]pO+>PW+
2'=V.3\WBO1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1-$I"6t(1K3Zp16+@]pO+>PW+2'=V33]&QP1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp1<+AH9b+>PW+2'=V/3]&ZS1,91D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp45+AH9b+>PW+
2'=V/3\rNP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1GU'q6t(1K3Zp+7+@0se+>PW+2'=V/3\r`V2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp.;+@0se+>PW+2'=V/3\rKO0f'.D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.;+@0se+>PW+
2'=V03\`NR1H,Y5:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU
0f1"F@;[2C0JYI-0f1pH1HI9G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f^@K@;[2C0JYI-0f(jI1HI6F$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f^@K@;[2C0JYI-
0f(jJ2EE]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P='+<X'\FCdKU0f^@K@;[2C0JYI-0f;!L3'&oN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K
3Zp13+A-'[+>PW+1a"M.3]&QP0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh0H`trDBL\g1,L+.1HI?I3\iQ"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nD@;[2C
0JYI-0KD0K1cdHL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>PYo8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+1a"J43]&NO
0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCqh0d'(sDBL\g1,L+.0KLmA3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fU$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo
8muT[1,(I?+>GT31cRNN0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp14+A-'[+>PW+1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'(sDBL\g1,L+.
1HIBM3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI0KM$F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3Zp+2+@]pO+>PW+1a"M13]&WR1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqf1*B%t@N[E[1,L+.0fh'E3]&T!$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0JXb?ARZc;
0JYI-0ek^E2``WN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u2BX,1@<?'A+>>Pn7V-$O1,(I?+>G]61,(aE3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+3+@]pO+>PW+1a"M03\rWS
1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!
+@KX[ANCqf1*B%t@N[E[1,L+.1cdEP3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>So
7V-$O1,(I?+>GQ21c@BP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1GL!p6t(1K3Zp+4+@]pO+>PW+1a"M-3\`<L0Ja%C$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf1E].u@N[E[1,L+.
1cdBO3\`T$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp47+<X'\FCdKU0Jah@ARZc;0JYI-0f1pI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>>Yq7V-$O1,(I?+>>f:2)@9J2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1Gp9t6t(1K
3Zp+6+@]pO+>PW+1a"M,3\`BN1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&+@:3b
Ch+Y`F_tT!E]P=!2BX,1@<?'A+>>Yq7V-$O1,(I?+>GQ20fM-I1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>bt7V-$O1,(I?+>PZ4
0KD0N1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>>bt7V-$O1,(I?+>PZ41G_'G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>>bt7V-$O1,(I?+>PZ42)dQM3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>bt
7V-$O1,(I?+>P]51,V*J0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>>eu7V-$O1,(I?+>>f:2*!]T3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>eu7V-$O1,(I?+>GT3
2*!]S1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+>>eu7V-$O1,(I?+>GW40JY[G0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/hnIk6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg0H`hr@N[E[1,L+.0fh-I3\iW$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt5+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.2+@]pO+>PW+1a"M.
3\W9L2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp.6+@]pO+>PW+1a"M,3\`KQ0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+@]pO+>PW+1a"M,3\iZU1,oUJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.6
+@]pO+>PW+1a"M,3\rNP1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.4+@0se+>PW+1a"J43\`HP2)>RH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5+AH9i+>PW+1a"M-
3\`TT0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@
+>t>b6t(1K3Zp1:+AH9i+>PW+1a"M-3\rWS1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp+4+A-co+>PW+1a"M/3]/ZR1,0+C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp13
+A-co+>PW+1a"M13\rNP1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp14+A-co+>PW+1a"J33]/TP2)>RH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2DBL\g1,L+-
3'&oT3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU1,0nDF`&<W0JYI-0KD0K1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>PYo8p,"o1,(I?+>>f:0f1pI2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K
3Zp14+A-co+>PW+1a"J43\iKP2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B23DBL\g1,L+.0KLmJ3]&c&$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,9tEF`&<W
0JYI-0ebXD0KM$M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t2BX,1@<?'A+>>\r8p+qm1,(I?+>G`72).-J0FA-o:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+7+A-cm+>PW+1a"M23\W<M
1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu
+@KX[ANCqf2BYV7C`kJe1,L+.2EEQN3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0K(%GF_i0U0JYI-0fD'J2**NQ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r
8p+qm1,(I?+>Gc81GV!I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp+8+A-cm+>PW+1a"M,3]&fW0Jj+D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2]t_8C`kJe1,L+.
0KM'O3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp16+<X'\FCdKU0K1+HF_i0U0JYI-0ek^C1-.9O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>>_s8p+qm1,(I?+>GT32)%'I2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp+8+A-cm+>PW+1a"M-3]/`T0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqf2]t_8C`kJe1,L+.2EETK3\iGt$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K:1IF_i0U
0JYI-0ebXC2EETO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u3$9>3@<?'A+>>bt8p+qm1,(I?+>GZ51,CsJ3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.2+A-cm+>PW+1a"M,3\`WU
1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o
+@KX[ANCqg1*B23C`kJe1,L+.0KM'L3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0f'qEF_i0U0JYI-0fD'J1-.6J$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>G\q
8p+qm1,(I?+>>f:2)[KM0a\6p:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0f1"FF_i0U0JYI-0ebXF1HI6F$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A
+>G\q8p+qm1,(I?+>GT30JPUC3!p!":-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)3
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0f1"FF_i0U0JYI-0ek^C1-.*G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!2BX,1
@<?'A+>G\q8p+qm1,(I?+>GT30etdG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp.6+A-cm+>PW+1a"M-3\`NR1-#[K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yu"+@KX[ANCqg1a#D5
C`kJe1,L+.0fh'G3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqg2BYV7C`kJe1,L+.1HI?H3\rGs$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]t_8C`kJe1,L+-3BAlN
3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp4$
+@KX[ANCqg2]t_8C`kJe1,L+-3BB#Q3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7
+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg2]t_8C`kJe1,L+.0KM!J3\WK"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg3?Uq:
C`kJe1,L+.2**QL3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqh0H`u1C`kJe1,L+.1-.-H3\rMu$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf1E\u+B-8r`1,L+.0KLsK
3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3ZpC)
+@KX[ANCqf1E\u+B-8r`1,L+.0KM!J3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7
+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg0H`Z(B-8r`1,L+.0fh$L3\W>s$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,pCB
F_;gP0JYI-0ebXF1cdKO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>Po!6$6f_1,(I?+>GQ21cIHP1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+B)ij+>PW+1a"M/
3\W<M1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GYp+@KX[ANCqf1E]V-E$-ni1,L+.1HI6N3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0KC7SAT/bI0JYI-0ebXG1-.-H$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A
+>>eu;e9nj1,(I?+>GQ22)dQQ3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,
+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+3+AZKh+>PW+1a"J43]&iX0JEh@$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf1E]J'F<E=m
1,L+-3BAuR3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.:+<X'\FCdKU0eskI@rrhK0JYI-0ek^E0fh!H$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>Y_p:LeJh1,(I?+>GW42)[KP
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn
6t(1K3Zp14+AQiu+>PW+1a"M/3\rHN0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh1a#P3Fs&Oo1,L+.1HI6M3\WN#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0ejeC
@;[2C0JYL.0KD0O0KLmE$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<u1E[f.@<?'A+>>\r7V-$O1,(I@+>G]62)%'G0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@]pO+>PW+2'=V2
3\WEP2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pes+@KX[ANCqf2BYJ#@N[E[1,U1/2**QJ3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+DARZc;0JYL.0ebXE3BB#U$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A
+>>_s7V-$O1,(I@+>GT30JkgH1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,
+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp16+@]pO+>PW+2'=V33]&QP1GfFG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqh3?V%)EZd+k
1,U1/1-.6K3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=Wi
D.7's3Zp44+<X'\FCdKU1GL"H@<*JG0JYL.0etdG1-.-J$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>>\r6#^ie1,(I@+>GW41H7EQ
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q
6t(1K3Zp.;+@0se+>PW+2'=V/3\rKO0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqg3?UV,EZd+k1,U1/1HI6K3\r]%:et"h?YXLi
Ch\!&Eaa'$1,04F:-pR0:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfRHQ-nR&#4ZX#Z%17/n
Dfp/@F`\`t7R9C1?YXLiCh\!&Eaa'$4ZX]60H`D!0I[G<:-pQU-u*[2Ch\!&Eaa'$.3N>BFCfK)
@:NjkGAhM4.!$gu+>PW+2)$gB0krEt1-%3I$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB[84c`V5u'gD6QdKo+<Ve%67sBmF_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo
@jrO7Afu#0+EM4-Cht55@<?/l$;No?+D,P4D/!Tj@qBanGT\+O+AP6U+D,P4D..O-+D?%>ATDU$
DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0%15is/g+eIE,961+<VdL+<VdL+<XEG
/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps10:-pQUBkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`i
AKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g+k?@ium:+<VdL+<VdL+<XEG/g+bEEc#6,+DG_8
ATDBk@q?cmDf'?&DKI"CAU&;+$;No?+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+A?3CAQU'o
Ec5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQUFa%Y1FCf]/
Ed)GBA9/k9:-pQUF`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GBA9/kT3[],_
+Eqj7E$0:9Cj@B;$;No?+EqaEA8Gt%+<VdL+<VdL+AP6U+DkP&AKYetFCf\>Ao_g,+EqaEA0>]&
F*&NQGps10.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R=j
1E\_$0I\+l-OgE)Ed98H$;No?+E_a:+CT/5+E1b,A8bs#F(KG9Bl5&8BOr;Y:IH=EEc5Q(Ch4`$
DfQtBBPDN1D.-pfBl7Jk$>F*)+EqCA?X[\fA7$HA-W!]07R^3Q779s<:..lF?YO7nA7$],A8a(C
%144#<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f4ZX]^;FO&D;GoqO:dIiE:IAK'C2[Wi%16Z_F(Hs5
$6UI4D/XQ=E-67F-W!]07R^3Q779s<:..lF?YO7nA7$HsDfd+CATT:/$>"*c/e&/%AhG2V/h]I<
-ZEL3A8bs*-:KO9+E1b,G%G\W/g*50HQYF4/mg@VFDPP3.!''5Cht4n84c`V5u'gD6XO8:De*Zu
FCfK$FCef1-QjumG%G]8Bl@l:.3L2p+@B$LA8a(0$6UI4D/XQ=E-67F-ZsKEDJ()6BPDN1E+*Wp
DdtgN-S/4f8Q/GO:..lF?X[\fA8Gt%ATD4$AR>lR+<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,
A8bs#E+*j%+DGF1@s)g4ASuT4G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^_
$6UI4D/XQ=E-67F-Y[H@F`(o<+EM4-Ci"/8FE2XLF(Jd#@q]RoB-;D4FD*]XGA(Q.AKYr#DIdZq
-OgDoDIb@/$=dLd@q[J($6UI4D/XQ=E-67F-Ugp2:Js4rE+*WpDdso-Dfd+CATT%H+CSeqF`VXI
<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f-OgDoDIb@/$7QDk<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4
D]ik1F*(\9FDk].?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5
@;]TuBlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.
+Dbb(ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/
Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21
@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..Nt
EbSruBmO>C%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=3&5"uDKTK70l8[YD`B\!1jC]rGr]JP
G[EXB+@C'bF(o/rEZee$A8,po+CQC)DfT]'FD5W*+E)4@Bl@l3FDi:0D..3k?m'Q)@<<W)ASu("
@<?(%%144#+Co2,ARfg)A7]@eDJ=3,Df-\0DfT]9+EqL1DBNe)CM@[!+EM%5BlJ08/g+,,AKYMt
Eb/a&+Co%qBl7X,Bl@l3AoD^,%144#+DGm>D/XH++D#A#B45\"+CT.u+D>2)+EV:.+Dtn'AKYSr
@<?X4AKYo'+<k?-EHQ2ABl7Q-+EM77B5D-%Ch[cu+D#e:Ch[BnFE8uUAM.UJ%144#+F\cgILQW,
+<XEG/g,.VDffQ$+EMX5DId0rA0>H.E,95uBljdk+<VeIF*;)*@m)jq1E\_$-XC+.:/st]9gMZM
,$uca/gr,!;H$Uk<D6(8-7q8-9KFjM4?G0&1+"V;+?V_<?SWaL-OgD*+<XEG/g+\8+D,P4D%-gp
+<Y]GG%>/oA7Rha+FAGX?!o'U<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=4"akq-8%J)
4?G0&1*CibI=2P3+<VeUIXZ_T$6UH6<+ohc@rH7.ATDj+Df-\0Ec5e;F*(i.A79Lh+D#e:Ch[Bn
F<G[D+Co"*BlbD<FE1f(B4uC!DfU&1Eb$;$F!,:;DJ'Cc+<Ve8F!,R<AKYMpAnc-sFD5Z2+CoD%
F!,@=F<G^IAKYE!Gp%$;+A+#&+ED%7ATDs*A0><$B6A'&DKI"=@;TRs/.Dq/+<Y'7+EelE+DtR>
+<Wrm@q]:gB4W3%Bkq9&FD,B0+EqaHCh+YsCiaM;Bl.ft@rri$C2[X!Blmp,@<?'g+C]J8%144#
+E)F7Ea`d#+EqaHCh+Z*@;BEs8g%V^A7Zm$Bk(^p+EVNECi=6-+DGpM%13OO1+j\W4C;WDCLgp4
1O*eG3B)+9@s)U!@lS7DGVFDM5%#L#Df0W1A7]d(@:Wn_DJ()6GAeUAATo8,Df00$B6A6'FD5Z2
+E)4@Bl@m1/g*r-AKZ)5+EVaHDBNk805kH7+Co2,ARfg)A7]@eDJ=3,Df-!k+<Ve=DfT]'FD5W*
+CT.u+Cf>-FE2;9+DGpK+CT/+FD,6++EVNEFEMVA+E)-NDe<T(G%#E*Dfp+DG@>N0Bl7R)+CT.u
+Cf>-FE2;9+DGpM%144#+F\cgILQW,+<XEG/g,7YEc*"<DBNJ(Eb/a&+Co%qBl7X,Bl@l3AoD^,
@<?U*DJ'Cc+<Ve;E-#T4+=BQK;FNrP6q'Qm4"qd":-pQUFEMVA+E(k(+Co"oAof(H+CfP7Eb0-1
+C\nq@<Q@'F`JU5DIal#AS,@nCig*n+<Ve;E-#T4+=BQK;FNrP6q'Qm4#%j#:-pQUAoD^,@<<V?
D..3k.3NYBF*2;@F!+n4+Co2,ARfg)A7]@eDJ=3,Df0V*$6UH6A8lU$F<Dr!8Q%uE<('/E-Ta(+
+AP6U+D,P4D..N/@<3Q%Bl[cpF<G+*Anc-sFD5Z2+EVaHDBNk0AftJ1A7]7e@<,duBl@m1?m%!C
AM.UJ+FAGa+ClU>+=h_cI3<6F+FAH[+=eR[I=2P3+<Ve;E-#T4+=C5V;GKeY7oLcs0H_J\:-pQU
FEMVA+E(k(+Eq77DJ=!$Et&I!+<Y36F(KG9-W`T3:.\2N;^XX]+<Ve%67sC&F`M@BG@>N0Bl7R)
+E)-?/KenAF)tc&ATJu<BOu'(GT_8SFWbiMD'3^=F`V,)+CT=6Ci<flCi^$m+<VeUIXZ_T$4R=u
/g+Oa?Sc/23HdE.F*'3XFYe+t14!YEChYX`B6IWG?m&3UG9CdGD.Ra%@j#;jFCB9:E+O)5@;]Tu
@3B&uDK]T3F(oQ1+E_d?Ch\!:+CJ\3?m&luAKYGnBl7Pm$6UH6@:Wn[A0>T(+A*b:/iFh#1,(I?
C12!61+=>iAKYl/G9CR-G%D*i+<Ve7055<GAS5Rp0e[6YFCf)rE\]:^DKKH&ATBU\Ao)BoFD5W*
1,!6UDdda%DJ(dZAo)BoFD5W*0fED^GA(Q*AThX*+EV:.Eb-A%Eb,[e+<Ve:BOPdkATJu9D]iM'
DIIR2+DG_8ATDZsCi^_5F<G:7E+*6uF!+(N6nTT)8LJ[m+CT),ART+p+D>J2+CQC&Df0`0EcYr5
DBNn=ARfFqBl@l3ATDg0E\7e.+<Ve+BOr<-ATDKnC`m82D/^V0DfT]'F<G^IF^]*&Gp%<LEbf_=
B5_L%B-:f)Ed(r4A0>?(F<F-t@;R,sDf0&rEc,H!+CS_tF`\a9Eb/[$Bl7Pm$6UH6A9Da.+EM%5
BlJ08+EV:*F<GdACht53Dfd+<Ddd0!Bl5&3Ch.*t+A*c"ATDj+Df0VK+BN8nC`mD"G%De<D]iS%
G%l#/+EMI<AKZ&(BOu$l%144#+EVNE@rH<t/g*nb<(/hjF(Jp"F!,RC+D>2,AKYGnASrW&Bm=3"
+DG^9CghEsEZdss3A*34@V'XiF"Rn/+<Vdq=[c7b:dn,&+Unbf$8a@X?p%e*DffhPF>A#MFE]ZX
FCd@GCO(2>0JPD-?Tqj?8ge[&Anc'm+Eh=:@WNZ/@<iu/@;]^#GA(Q*+CSbiATMp,DJ()9Bl7I"
GB4m=Bl%@%+E)-?A9)C-ATJu&@q0(kF(Jl)@X/Ci+<Ve-:ei-CDf0H(@ruF'DK?qEBOu'(<_uO6
BlbD8AnEY<<+oi`ALDOADJsV>D09?%+A,Et+Ceht+CoC5AoD]4D..C&ARlo3Ch7^1ATB/0A17rp
+<Ve;EbT].F!+q7F<Ft'AU%p1FC65&G%GQ5F^]*&Gp%-=FEMVAF!*.ZAoD]4<_uO6F(f!&ATJu1
Bkq9@%144#+F\cgILQW,+<Ve=AU%p1F<Dqa05>*?A7]p<1bWo`@<,q#05>E905>E905>]LEb'5D
Bkh6-%144#+F\cgILQW,+<X9P6m,uXF_kS2A8`T!+E;O<@r!2uG\M5@ASu!h+Cf(r@r!3*DBO.;
DId[0F!,OLF*(u1F!,[?ASrW)F<GX9ATJu:DJ`g$E+NPh$6UH6F(f!&ATJu%0/%BbD.PAABOPpm
04eg105>]LEb'5DBkh6f/g)99BPDN1GA1l0+Du+>+D>>&E$/b2EZeCZ:*=C^E,]B!+CoM,G%G_(
$6UH6GA(Q*+BD<6+DGm>De<T6%144#+@TF%;bp4Y:*Cbi$4R>"/g+Oa?SaEY3+Qr>G\hYEF`h,)
Ciaf=EAoj6E,]/J?m&E[F*&O4C2[X!Blmp,@<?'g+E)-?D.-pM;]oLdA0>]&DKU1V+B3Pr@;@!"
Aftu&ARo@_/e&-s$8sLZ+CI<=2`GZ$ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4+CT.u
+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1F"SS/
@:F:#BOQ'q+Cf(nDJ*Nk+DG^9Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%15$H+<VdL?p%e,0k>B<CLf.V
H#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2045o2F!+m6E+*j%+E2@4AncK4
Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,ARfh#Ed8d;Df0`0DKKT2DBNk8
+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s$=I(LDIb>@De*cl?k!HVBleB7
Ed;D<A26)VASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]%14=),9S]n0eP7)/KcHcBlGLDF`)52Ch7$rARl5W%144-+<XWsAKYA=+E(du+E)4@
Bl@l3@q]:gB4YTrFDi:?E+No0FD,5.ASuU(Eb-A4@<?0*De:,6BOqV[+<VdLFD,5.CghC,+Co1r
FD5Z2@<-W9Bl5&%+Dbb5F<GL6+Co1rFD5Z2@<-'nF!+n/A0>i6F<GC2@:X(iB+51j+<Ve;Bk)7!
Df0!(Bk;?.Anc:,F=n[F$4R=b+<VdL+<VdL:-pQUDfB9*+CT)&+E)-?-u*[2A7]p5+E1b2BHU`$
A0>_tCLnV:Bl.F+.3NSPF:AR"+<VdL+<VdL2BZpK+?MV3Bl.F++DPh*A7]p3+:SZ#+<VdL+<VdL
:-pQUDfB9*+CT)&+E)-?-ua!2GpskT@<?0*@;]TuE,oN%Bm:aKB5hoC+CoD#F"&4[B5ho@+DGm>
E-673$6UH6+<VdL+<WQbDe'tP3[\QZF!,"3@ric3CghT:%13OO+<VdL5p0iLDIe#8G%G]'+CK,!
E*sf%@<3Q#AS#a%@:Wn[A0>u4+EV:.+A,Et+E2@>Anc'm+D,P4+EV:2F"Rn/%144#+<VdL+<Ve%
67sC!E+No0@;Ka&A8,OqBl@ltEbT*++E)-?-u*[2A7]p5+E1b2BFP:k+<VdL+<VdLDe3l1-YdR1
A7]p3%13OO+=\KV7<iop@3B#q@;]k%+DG_7ATDm(A0>;mFCfJ8I=35KASc'tBlmp,F!,17+D#D!
ARo=_A0>DsEb/a&+:SZ#+<Ve;AS,XoBln'-DK?q/Eb-A2Dg*=EARopnARlp*D]it9AKYGu@;]j3
+D,P4+D#e+D/a<&3XlE=+<VdL+<Vd9$6UH6+<VdL+<Y3*D.Pjk+>Y-$+>=63+<VdL+<VdL+AP6U
+D#D!ARo=_A0>DnAS)AY+<VdL+<VdL+C?lH?!JM!HQ[SV,CUbE+=f&e?SN[N/g+Ud/g)N,-Qki1
+F,)XI39XT+<VdL+<Yq\-QjcG$6UH6+<VdL+<W*B$4R=b+<VdLBlbD7Dg*=EASu$iEb/c(@<4I=
$6UH6+<VdL+:SZ#+<VdL+<VdLA7TOg4ZYAA3Zp*c$6UH6+<VdL+<XEG/g+_B@V'(\ARlooA7]?^
$6UH6+<VdL+<Y#H+C/4pH[?l\+<u=X@N[0R+C?iGHnHON4Y@j)5UR[C/g,E^I=35`/12Pf%144#
+<VdL+<VdU%13OO+=\KV?u9=fARHWuDg*=6BOt[hF!,"9D/^V=@rc:&F<G(3DKKH-FE8R5B45Ll
F*&O=FE8R<@<6*7%13OO+<VdL+<VdL+Co(I3Zr9JCLnV9-QjNS:-pQUA9Da.+CT)&+EqaEA9/l3
DBNn,FD)*j+<VdL+<VdL+>GetD..3k+?Op2A7cr,:-pQU@q]F`CER/1D/^V+B45LlF*&O@ART+`
DJ()*@<6)k$4R=b.NfjA;H6Xp?m&lqA0>8I;c5tj+DkOsEc3(BAU&;>FEqh:F!+n%A7]9oAoD]4
EclGF+CT.u+@@8]De*E3%13OO,9nEU0eP151*A.k8p+rq+>G](+>PW+1a"2CATDWrDIm^-+A?]`
@;KKt7:^+SBl@l<%13OO+=\KV8l%htDJs_AEb065Bl[d++A+#&+CSl(ATAo:ATDj+Df-[X/hf%5
+?;&.1*C:KFE2;1F^nun%144#+<Y3/Eb/a&+Co%qBl7X,Bl@m1/g+)2D.Oh^:IH=LDfTB0+Du+A
+E_a:+Co2,ARfg)A7]@eDJ=3,Df0VK%13OO+=\KV?tsUjDf/r*@;]Tu?tsUjDe<B"BOQ'q+C\nn
DBNG&@;]^hA0>u4+D>2$A8Gg"E+O',@;]XoF:AR"+<VeCDe!3lATJu.DKKo;A9DBnA0>T(+A*b:
/iG=)?tsUjDe<Th+Du*?Ci=3(ATAo(ATMs6Dg?CH8l%ha$6UH6+Cf4rF)rI?De!3lATKIH8TZ(m
Dg*=FBl.g*Gp$U5Df]K2+E)41DBNJ(@ruF'DIIR"ATJu&DIal1ASl@/ATJ:f+<VdL?tj@oA7-r2
FD,5.8l%htBl8$(Eb8`iAKYf-@ps1b+D,Y4D'3q6AKYGjF(HJ5@<?08+CJr&A8c?n%144#+<Y]9
F*)>@ATJu%BkhQs?m'Q0+EV:.+C\c#AKYr#FD*9L<+ohcDJs_AE+O',@;]XoF<F1O6m,uU@<6K!
$6UH6+Dbt+@;KLr+=LW+C2[W6@;9^kA8bp.@;9^kD..3k/7E:3A92j2Eb-e1C2[X)Df9H5/7E:3
A9E!.Cg\\$$6UH6+CT;%+Du+>+Cf(nDJ*Nk+C]U=?tsUjDf/r*@;]Tu?tsUjDe<Th/g(T1+:SZ#
+<Ve+D]iP1ART[l+E)9CEb/j'ATMN-8l%ht@r,RpF!,:;@ps1bF!,aHFWbODF*'GP$4R=b+<VdL
+<VdLCi<`m+=Cf5DImisCbKOAA1%fn#mh^`$6UH6+B3#gF!+t+@;]^h+DGm>@UWb^G@>N&+Cf>,
E+*j&@VfTu@;]TuEcl8@+DG^98ge[&@V'.iEb-@R/iG<k$4..K+=\KV9jqpb+A,Et+EV19F<GX7
EbTK7F!,UHAKYl!D.R6#Ci<flCh7Z?+B3#cGp%<BEb-A'Eb/[$ARm>$$6UH6+EVmJBk(RfCj@.>
Ddd0fA0?)1FD)dh:IH<RB4Z06-Z^g]AU%crF`_2*/0JA=A0>u-ASrW$ASbq"ARl5W+<VdLFDi:3
Ch7$m+E_WGFCfN8+CT;4BkCd`FE9&W<+oue+E1b2FCfK1+EqO9C`mV6F<GdGEbce3DBMOo3A*3!
$6UH6+CT=6Ci<flCh7Z1@<,p%E+O',@;]XoF<G^DCh7[/+D#e:Ch[BnFDQ4F@rc-hFCeu*@<3Q5
ASlC)Eaa!6/e&.1+<Ve+BOr;q@:O(s@<,m$@rH4'@<?3mCh4_;C2[X%Ec5Q(Ch555C3(gHG%G]'
+=LuCA9;C(FDPl*@;KL(+:SZ#+<VeD@;0V$@;0V#+EV:2F!,F1FED)7DBNA*A0>_tDL!@HATMr9
F(96)E--.D@<=O>$4R=b+<VdL+<VdLBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5G
AM7n/F*(u605>E9F`(o8%13CN$6UH6+DGY.F`VYF@<?''BlnD=F`V+H+@0g[+A,Et+EV19F<GX7
EbTK7F!+n3AKYMtF*)G:@Wcd(A0>T(%144#+<YB9+EV:.+CKY,A7TUrF"_0;DImisCbKOAA92[3
EarZg+CSekDf.0:$4R=b.NfjA6VKp7;H?R[;dX6RDe*3_+Ceht+C\n)F`V,)+EVNE@rH7,Ec5b:
G%G`:BkLjj+A,Et+E(_(ARffk$6UH6+ED%1Dg#Q*+CoV8Bl7Q+Ci<`mF"SS,DBNt.Eb-A'@<6"$
+EV:.+Eh=:@N]&gCh7$qG&Li2?m'<#B4uAr$6UH6+EM+1ARfg)DKTf*ATD?m+E_a:EZf1:@ps1b
F"SS7BPDN1BlbD9@<-I(@s)TrEbT?8+Dbb-AScW7Bk@e]+<VdLFD,5.F`V,7+Dbt+@;KKtBlbD.
D/aTB/g*K++EM+9FD5W*+CIQ176sgP:I7uf+EVNE0Hb(I+:SZ#+<VdTC2[X%Ec5Q(Ch555C3(gH
8l%htGA1l0+Du+>+ED%1Dg#\7G%G`:BkLjj+Dbt+@;KLr/g+50FD)d+$6UH6+CIQ176sgP:I7uf
+EM+9+EVNE0HbCIE+NI"ARlo3Ci<`m+=Cf5DImisCbKOAA1&fKCi<`mF!,[@Cht4'$6UH6+E):>
BOPd$8l%htDdmHm@rucE+@1&k@rH1"Ble!,DK?qEBln#2F`V,7+Dbt+@;KLr+CT;%+E_R<Bkq9r
Gmt*'+<VeKBOr;sAS,@nCige6F!*1i%13CJ+:SYa#p9Za,9nEU0eP150d,J+P9<>+@WHU"Ed8c^
0J">%0JYI--r+\4@WGmkDImi29k@`U@s)U,@3A!LBln'-DCH#%%144-+<WrmDIn#7?uKR`+E)4@
Bl@l3DfB9*F!,R<AKYQ%FD5c,+E2IF+Co1rFD5Z2@<-W9E+*j%/g+,,Bla^j+<VdLBlbD<F^o)-
@3BZ+D.RcsG%ki,+Du*L@WGmkDImi28LJ?tASkmbEcPT0F(Jl)AoD]4DJsV>FD,B+CM@[!%144#
+<YT7+DGp?H"CE)F!+n(D_;J+%144#+<VdL+<Vdb+E(d5-XgP'A1&Kp67sC!E+Np.+CT)&+E)-?
-t-Y(A18X?@<?0*/Ken=CLqQ0-t-Y(A18X?F`\'"+<VdL+<VdL+>t?\A0<rp-YIC>+EMCBB-;>=
Bl%i<+AP6U+E)41DK?q/Cht54DBL??E-!HNE+*j%+>"^Q@;BFq+=LlAF"&5NF`\`K+<V+#+<VdL
+<VdL+E(h1?YO7nA7%J\+>tQbA0<!i67sBkAS,XoAKYYpDIe#8F(fK4FCTH8+DG^98l%htBl8$(
Eb8`iAKYf-@ps1b+<V+#%144-+<XEjG9D!=F*&O7@<6"$+CT.u+Cf(nDJ*O%+EVNE?tsUjFCfN8
ATD0$FDi:=@;BEsFCfN8F!,=<Eb-A4DfTr.@VfU.%13OO,9nEU0eP150H_qi7V-%LF^]<9+>k\m
1,(I?+=KchF(fhA9k-_&F(f/o@q?cOA8-."Df.!5$4R=b.Ni+i5uU<^/0J=o76s[V+CT.u+CJAE
7pmHV@:O=r+E)4@Bl@l3@rGmhF!+n%A7]:(%13OO+=\LAA8lU$FC655@;BFq+CQC1ATo88E-,f4
DBN=V:JsPK9gM]W78crJ<(LC>FD,*)+D,P4@qB^(FD,5.%144#+<YW3FD)e2DBO%7AKYhuF*(u6
+D,>(AKY])FDi:DBOr<*F`\a:Bk)7!Df0!(Gp$[AASqqa+<VdLBkAK0BOr<*F`\a:Bk)7!Df0!(
Gp$gB+CJ)95t"LD9NbaU+B3#c+DkP$DBO(CAKYo'%144#+<Y&]:JsPK9gM]W78crJ<(LC>BlbD=
D]j(3F(KG9FD,5.Bl8$(Ec,<%+E1b2BQG;1DBN=b76s=;:/"eu%144#+<Y3/@ruF'DIIR"ATJu9
BOQ!*BOQ'q+C\nnDBNe7G%G2:+@0U]ATAo*DfT?%DJ()2@<?1(+:SZ#+<VeKBOr;sBk)7!Df0!(
Gp$sHF*&O6AKYK!Df]K#+CT.u+ED%3E+NouA1e;u+:SZ#.Nfj4Bk1db@<*K&Bl%@%+E(j7;b02+
1,Us4BOPsqATJu&Eb-A2Dg*=JEbTW;ASrW$F`M26B-7Wj+<VdL@UWb^F`8I2E+*6lA7-NuE+O&u
FD5Z2F"SRX7W3;i@UWb^F`8H[1*C[PAKYT!Ch4`'F!+jI12:K2F(f-+/p)>[?k!GP$6Uf@+@.,f
ATo8)@W$!i+E)4@Bl@l3BOPs)@V'+g+DG\3Ch7HpDKKH#+EVNE@q]F`CER(p@r$4++D,>(ATJ:f
+<VdL@:s"_DKBnBFD,5.BOPsqATJu8FDl22A0>T(+EV:.+EM7-ARf.h+D,>(AM+E!%144#+<VdL
+<Vd]2]uRIC`k)X-QjO,67sB82]t7+83p0F%13OO+=\KV?ufh"FC\c%DJs_AEb0<6DfTE1+E1b0
FD56-Cgh?,@UWb^F`;CEBl8!6ART*lDe:,,F`VXI%144#+<Yc>AKYetF*&O6@:O(qE%W8!CiaMG
+C\bhCNXS=Anc'mF!+n3AKYJrARfLeA0>;n@;0V#F:AR"+<VeKBOr<"@<6*nF!,17+EV:.+Cf>1
Eb0<2Df0*"DJ()5Bk1db@<*K&Bl%?'@;]TuFD,5.%144#+<Y]9F*)>@AKY].+CS_tEcbl'+DGF1
@;^?5BOPsqATJu)D]iq9F<GF/FCSu:%144#+:SZ#+<VdL+<VdLEb0<6A0<71DIIBn-QjNS+<XEG
/g,1GF*)>@AKYetF*&O6@:O(qE"*-s+<VdL+<VdLEb0<6A0<71DIIBn-Ta%;+<XEG/g,1GF*)>@
AKYGj@r$4++>GS[$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(V0eje*2]s5<67sC$ATMs3Eb-A-B5VX.
Bl7Q+@UWb^F`8I:@<6*nEt&I!+<VdL+<Vd9$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*
Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\LADIn$&?m'?*G9D!9CLqQ0?t=4tATT%B;FOPN
8PVQA741/O?m&lqA0>8jE-#T4+=BHR6V0j/2((I??m&m!+Co%q@<HC.Et&I!+<VeNBOu'(@rc-h
FD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/%144-+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)
+C\nnDBN@uA7]9oFDi:0C2[X%@<-4+/no'A?nNR$BOr;sAS,@nCig*n+<VdLBlbCO/0K%WEc*"<
AnE00Bln#20J4JLBOu'(0d'mI;b02+1,Us4BOPsq+DGm>E,oN%Bm=3"+EVNEFD,5.F*(i2F<GL6
+CoV3E"*-s+<VeJ@rc:&FE9&W<+ohcAoDL%Dg,o5B-;;-F*)IGAoD]4A9Da.+EM%5BlJ/:Bl8$(
B6%^.GrcBA%144#+<VdL+<Ve:BPV9iF(f*$E*m$gDe*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A
@q@<.De*BiFtRKDF!hD(%144-+<WrmDIn#7D.-ppD]j%B@;KXiBk;<-?qF0t:-r>2@rGmh+D>2)
+C\nnDBN@uA7]9oAoD]48p,)uFCfJ8DJsW.@W-1#F"SS1DffQ"Df9D6Anc'mEt&I!+<Ve:@;[2s
AKZ&9DfTE"+CT=68l%htD.-ppDf[%FBln#L%144#+<VdL+<V+#+<VdL+<VdL+AP6U+ED%%A0>c.
FCep"DegJ(DIal2FDl22%144#+<VdL+<Ve@E-Z>14ZX^.FCmKTEb/Zi+=D&FFCep"Degt>E-Z>1
-OgD*+<VdL+<VdL1a$a[F<DrKDffQ"Df9DuBlJ?8@OF6/:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV
<+ohcE-67FA8,OqBl@ltEd8dH@<?0*BlbD7Dg*=<DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et
%144#+<Y3;D/aPK+@^9i+D#e+D/a<&+EV:.+CJr&A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D
%143e$6UH6+<VdL+<Wa,-YdR1A7]p,C2[W*F`_>6F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>
E,oN5BlA-8Cj@.EBQ&*4/g(T1%144-+<Wrm@Wc<+Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen5
1FXG[@<3Q#AS#a%@rHC.ARfgnA1euj+Co%q@<HC.%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfgu
Gp%0>F<GC2@:X(iB-;;7+CHlG2E!H9E-67F-RX+VEb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL
+<Vd9$4R=e,9n<c/hen51a#8!@WHU"Ed8c_3%Q1-0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn
$6Uf@8g$,H0JjnmAStpnARlp*D]hXp3A*-2@;]TuFD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:g
B4YTrFD,B0%144#+ED%5F_Pl-A0>;'@q]:gB4W3-D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.
@<?4$B-;A/EcYr5DBNh>D.7's/e&-s$6Uf@?pmgb8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnB
AfuA;FWbR5ARlp#DfTD3FD,*#+>u&!A8,OqBl@ltEbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=
FWb+5AKYN%Bl7Q+F)Po,FD,B+B-;D=Df022+:SYe$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`
CER)#DIIR2+Cf>,E+*j&@VKXmFEnu\+Dkh6F(Jl)FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO
,9nEU0eP.41,C%F@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:
/hf+0F!,UHAKYo'+Bq?1:gGJ_FEDJC3\N.!D/a<*@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!u
Df-\3DKKH&ATDi7%144#+D>2)+DG_8Ec5K2@qB0n@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(
G@b?'+A*b:/hf+)@;]TuE,oZ2EZfO:EcYr5DK?q=Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h
+E2@4@qg!uDf-\3DKKH&ATDi7Bl5&(Bk)7!Df0!(Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7
+<Y0&DBNt2@:UL!Ch.*t+D#e>ASu$iA0>T(FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.
DId<h+DG_8AS5RpF!,RC+CJqrBl%@%?k!Gc+<Y04D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3
@:UKsDf03!EZfI;ASj%B<+oue+Eh=:F(oQ1+CSekF!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKq
F'p,!DIaktA8lU$FC655D]j">AThX&F<G[=AKYi(F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9
A79Rg+DG^9A8,OqBl@ltEbT*+/e&-s$6UH6=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8
Bl@l3De:+a:IH=GATMF)+F.mJEZdtM6m->TF*(u6+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74
ASu("@;IT3De(4)$4R=b+<VdL+<Ve%67sBi@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(
A8,OqBl@ltEbT*++CT.u+EM4=F<F0uA8c[0%144#+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>
AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6
+<VdL+AP6U+ED%7FCB33+A*bbDIal$Eaa$#+EV:.+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%
+=DVHA7TUrF"_0;DImisCbKOAA1q\7@<6O%E\;'@Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVH
A7TUrF"_0;DImisCbKOAA1q\9A1hS2DC5l#%144#+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-
Eb/c(A8,OqBl@ltEbT*++E1b7Bl7Q+@<?U&DKKT2DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"
Gp$g=@rH4'@<?3mBl%L*Gp$s8F)tc&ATJ:f+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL
+<VdL0HiJ20JO\4C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b
+<VdL+<Ve%67sC&D]j1DAKYo-A0<:0AS,k$AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"
G%De<D]j+4F<G[=ASiP!$6UH6+<VdL+AP6U+AtWo6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0
+A*bbDIal3BOu'(Eb/ltF*(u6+DG^98g$,H0Jj4G%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2
+AtWo6r-QO=WhEr+CT.1DerrqEZf*+$6UH6+<VdL+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4
+=C&U5t"LD9N`_P$4R=b+<VdL+<Ve%67sC&BOu'(Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-
EZbeu+<VdL+<VdLEb/lo+=D)DA7TCaF=0-t@lc8eBOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3
762Q*AfuA;FWb+5AKYo/Cj@.;DKKH1ATMs)A0>T(+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-
ATq^+%144#+Eh=:F(oQ1F!,C5+A+7/=`8F*@ps6tA9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9
D/^V=@rc:&FE8R5DIal1ASc9nA.8kg+<Yc>ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!
Df0!(Bk;?<+B3#c+A,Et+DkP)F^])/AU&01@;0V#+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9
<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNCsJ@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+
@;]^hF!,RC+EV:.+E_a:+E(j7FD,5.Eb/m+Cgh?,AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:
DfT?!A0>r3D.Oh!$6UH6@:X+qF*)81DKKqBFDi:0Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%
+EVaHDIm?$De<T(GA2/4+CK57F`_4T+>@1GE,oZ2EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c
+EM+9FD5W*+EM47F_kS2@V$[&ATMs3Eb/c(@:jUmEZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#
+CSf(Bldi.@q]F`CM@[!+D,P4+CfG+FD55nC`m5+A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4
Ch[a#F<F1O6mm$u@:EqeBlnVC%144#+EVNEA7]1c+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&
+B<;n@rGmh+EM[EE,Tc=+D>2)+CT)1@<lo:E+*d/Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+q
F*(u(+EVNEF)Q)@+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfA
Ec5u>+DG^9FD,5.Eb/lpGT^RBE,oN2F(oQ1.3NMHG9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge
3Zoe"GB.V>B."gBG]P!U/g+\BC`k)Q%144#+Ad)mDfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<
Ec5u>+D5U8FDi:DBOr<.Df?h8AThX$+EVX4E%VS,%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%
1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+
Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7
G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!
@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=ARlo8+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgT
F<G(3D/E^!A9/l(Ble60@<lEp+D,P4+A,1'+EVNEEb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86
EZf=>E$0:BF"Rn/%14=),9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)
6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a
@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu6+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,
@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,
@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OV`n%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(t
FD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T
681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*
?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+
Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&
Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0
+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f
+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.Y
A7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj
%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+
/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26
ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<
Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:Wne
DK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:
@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&
/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>
@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^h
F!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*
Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'
@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+D
E,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A
@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iu
BHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2
/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'
Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22
A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s
$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO
,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q0
1,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6
G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<
3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3
Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-
+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-
+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/io
EcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p
@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@
ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdL
FD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&
Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1
$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&
F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6
AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5
$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:
$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#
+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\
$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*
Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()
EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!
+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9
%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ
=CuSTE-Q59/no'A%144#%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1
@:WneDK@E>$6UH6+<VdL+:SZ#+E2.8F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk
+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp
3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*
D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKq
F"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%
DJpY7Bm=3"+CT>4BkM=#ASuU2/g)8G$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+
1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg
+=\L>%144#+<VdL+<W*B$6UH#$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)
+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP
+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's
+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB
-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k
%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"
+:SZ#+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5
ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1
E+*j1ATDZ@+<Vd9$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO
+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha
$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl
$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL
+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8
+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2
Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U
?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=
+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@
+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'
ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_
+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL
:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL
+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWj
Df'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#
+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9
F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL
+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(I
Bl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI
%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4
A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'
DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LA
De*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@
B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7
+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4
F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7
FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$
F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7
ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o
$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g
+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o
+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1
Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-
DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"
F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL
+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6
+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6
+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*
+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-s
DJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL
+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<ita
A8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4
+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5f
DBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'
Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26
GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.D
D]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)
@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<
FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#
+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mW
B682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u
%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&
FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7
ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#
+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSek
ARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@
F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+
A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA
7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(
Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(n
DJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(
Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97
EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeK
BOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4K
Dg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'
F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL
+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD
@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr
<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^
DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;o
C2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>
@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;
ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;
@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$
ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7M
D]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=
De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNE
FD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0
EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555
C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8
F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUj
E,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]Tu
Eb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd
+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?
=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0
+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LA
DIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>
H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+
F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$
A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$i
DI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"
+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$
D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums
+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#
+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3e
Ch4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5
+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*
B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=)
,9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp
+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2
F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+
F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_
+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e
,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4
E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@e
DJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(n
Ea`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+
@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8
ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3
FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2
@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-
+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,
ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOA
BHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+
Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&
FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2
F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8
E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?
7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRt
ATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#
+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRt
ATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B
5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&
DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!
A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@
Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@
?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!
B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,Oq
Bl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgW
IT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8
E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#
+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5
F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0
+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!
F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4
CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8
-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC
<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUr
F"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'
1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&
Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6
AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9
$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb
+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#
+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq
+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?
+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5
BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&
A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\
F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4
DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*
FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!b
Eb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-o
F!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?m
H=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq
?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3
AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;
A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!
Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,Oq
Bl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i
76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n
+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1
+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et
+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3
De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO
+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6
Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1
F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[Wn
De!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`
$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)
AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0
E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8
%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#
.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6
A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;
%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr
@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0f
A0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF
?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL
+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=)
,9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu
+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7
ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJr
De*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_
:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'
D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$
ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaE
A1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o+
+CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNE
D..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"
+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%
F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7Hm
GV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4
ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6
FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#
+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#
,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)
@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%
6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1
G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAq
De(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e
,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1
+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*
3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b
.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/
+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#
+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!
+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5g
De(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>
F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMp
F(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'
FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*
+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t
2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@
D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*bt
H#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>
A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+
GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4
+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS
?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A
+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!
F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*
@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#
.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>
A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l
@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*
@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;
C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#
.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#
.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK
3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,
Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%
@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.
+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc
@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?
Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-
F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6
Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%
De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$
F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums
-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj
1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k
+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK
%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*
A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8
E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA
%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOs
Gp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+
/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg
+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7
@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg
%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3
@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5
Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^V
AS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>
+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=)
,9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$
DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7
Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&
BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.
+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,
ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$
BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.
AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL
+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0
DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/i+V%+=MGJE%)oPDK9<)ARTXkA.8kT
$6Uf@7!3?c+EM%5BlJ/:BOPst+Cf(r@r!3)DffQ$+DG^9?u9=fARHX%ARfgrDf.0:$4R=e,9n<c
/hnt6+>"^.F_l=G0f1F(1,(I?+=L&tEc#6&ASuT4Ci<flCh4`#A8-."Df.!5$4R=b.NhH"DJsP<
ARoLsF!+n/A0>;kA8-."Df0VK+B3#c+Dbt+@<?4%DBNk0+CJr&A1hh3Amc`T@8pf?%144#+DGm>
DJs_A@ps1iARlp%F`]5Y;IsHOEb0,uATJu9D]hY"F!+q'AoD^$+?;&.1*C7=G%De*AS#`g$6UH6
Eb0*+G%G2:+A,Et+Du+A+ED%5F_Pl-F!+'t3A*!@+E)9CCghEsE\7e.%14=),9S]n0eP1'/KdMo
@WHU"Ed8c^0J">%0JYI--r+\4@WGmkDImi29k@`U@s)U,@3A!LBln'-DCH#%%144-+CK+u?m'N%
@ruF'DBNM$Blmos+D,P4+Dtb7+CI)MDe*5uDfBf4Df.0:$4R=e,9n<c/hnt4+>"^*AR]\&@<-W9
2(Tk*0JYI--qIcfBR(^p@n:$LBP([_AKXEPBln'-DCH#%%144-+AQKl+CT5.ASu$mGT^pB+EDUB
DJ=!$+A,Et+EV19FE8R5A7T7^/e&-s$6Uf@:L\B`Ch7^"+A+O7B6%F"BPCs!Eb0*+G%G2:%13OO
+=\L$BOPdkATJu9D]iFsDJW]3+CK5$F*(r#/0J>>@:O(`?m'Q0+Du+>AKZ).AKYDlA8-."Df-!k
+<Ve8DIal4F(HJ4Aft#C5qOiL2BZI;@r$4++EM7-ARf.h+D,>(ATKI5$4R=b.Ni+i5uU<^/0J=o
76s[V+CT.u+CJAE7pmHV@:O=r+E)4@Bl@l3@rGmhF!+n%A7]9oFDi:D@:F%a/e&-s$6Uf@9keK`
EZf(5E,ol?ASl!rFE8RHD]j"ADKL#2@<?4%DBLMRFD,5.FEqhD+DPV(@:UKpF!,C=B5_L%B.aW#
%14=),9S]n0J5+<+@0seBl"nK/0H]%1,C%$;fHbkDJ((`DIdHkFDYT,FE8QnA8-."Df.!5$4R=b
.Nh](AKYo3A7]d(De:,1E-,f4DBNG-A7Zm*@:F%aF!,17+CT5.ASu$mGT]F-+D>2)%144#+C\nn
DBNG&@;]^hA1f!(BOr<&@<-!lEZfI4@VfTu0eskcF!,@=G9CgA+CQC6Bl7R"AISth+<YW3B4W3-
D]ik-@<Q3)F)YPtAKYT'EZet:FEMV8+Cf>#ATKI5$4R=b.NhZ.D.Oh>F`(`.@s)X"DKKH#.Ni5>
A7]g)BOQ'q+C\nnDBN@uA7]9oFDi:D@:F%a+>GW(%13OO+=\L5BOr;tDKKoE+D,P4+CJ`!F(KH$
+D>2)+C\nnDBN@uC3=T>ARlp*D]j+7Dg*<5$6UH6FD,5.DIn#7?q<R^846HP:gbDb@<,dnATVL(
/e&-s$6pc?+>GK&/i#4*/KdYoDKTB.Gp"k#/0H]%1,C%$7qHRKATAn_CisH&+@TgTFD5Z2.1HUn
$6Uf@6Z6g\Df0-(F<E:n+DG^9?tsn(Eb'6!+Du+A+D>\0A9/l8BOr;Y+CI2Q3\`I!+EMgLFCf;3
F*)G:DJ(RE<+oue%144#+D>>&E-!-o:IH=9ARTBtGA2/4+EV:.+C]&&@<-W9Bl7F!D/`p*Bjtdm
BlnVC@V'Y*AS#a%8g$,H0Jk.u+CT.u+D"u%Ch[I$%144#+A+#&+D#e>ASu$iA0>i3ARfFqBl@l3
Bl8$(B4Z+)/e&-s$6Uf@6Z7!cARfg)?t!Mf?m'<)DII&u@<-"'D.RU,+>"^SDJXS@FCArrF!+t+
@<,ddFCfJ8Ch[s4F"Rn/%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtg
EbSs"F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*
+CJr&A1hh3Amc&T%144-+<X'dEb/a&+Co%qBl7X,Bl@l3@;p0sDIdI++CSekARmD&$4R=b.NfjN
@:N)302-(tFa,$J@<?1(+CSekARlp*D]iP.DJ!TqF`Lo4Bl@l3F(Jj'Bl@lA%13OO,9nEU0eP.4
1*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&VBln'-
DCH#%%144#.NhJtG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'
DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6
@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+D
E,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)e
BOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea]
;aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%144#
.NhJtG9BM#E-ZP:EZf1,@N]W#AftMmA7]9o?r_8^DJ)R[A8Gt%ATD4$AM.q4Amd25F(Jo*FD,5.
A8-'q@ruX0Gmt)i$6X)&@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO
,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144#
.Nfj6;G;-SBl5&$C2[W8E+EQg+Dl%-BkD'jA0>u4+E_a:+@oI2:fAKNDKBo2@:UL!AfsWD<)>1V
$4R=b+=\L3AS,LoASu!hF!,RC+A+pn+Cf(nDJ*Nk+EVNEF`V+:E+*6n@;[3%DKBo2@:Uu"$4R=e
,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144#
.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'Bl@l3@:Wn[A1eu6$4R=b+=\KVE+EQ'G%G]8Bl@m1+E(j7
8p,)uFCfJ8Cggdo+CSekARlo8+EM+*+EV:.+Co2,ARfh#Ed8*$%144#+<VdL+<VdLC2dU'BHS[O
@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m%14=),9SZm3A*<P3?Tmr6$6g_F*&N[
3@l:.0JPQs$4R=b+=\LWATDj+Df-\,F_u(?AoD]48g$,H0JO\ZATV?'E+*iuBJ'`$%14=),9SZm
3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b+=\LAEd2Y5+EM+(
FD5Z2+CSekARmD9%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144#.Ni,9DJW]'
F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<
E+EC!ALS&q%144#.NieS@<-H4De:,4AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<
%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdL
AoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'j
DBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,
D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*
AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI+
+EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>
$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm
3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgr
Df-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'
C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?
DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2
+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*
E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&
@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,
8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jY
C`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b
/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g
%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9
DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D
$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8
AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M
0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!r
FCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?
+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:
F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#
/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*
E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?
+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rt
A7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*
FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ
$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5
DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%
0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSek
Df.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'
Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nn
DBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7
ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)
.1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58
@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4
+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0
+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(
+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJ
A8-'q@ruX0Bk;?<%143e$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E
3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZX70eP7)/KeS8Fsd_+7Sc]G78c90
-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C
:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-
Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u
$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[Wn
DdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`
C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.
Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;
De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk
.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\
4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1
AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8
@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a
+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)j
Dfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5
AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k
+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.
+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$Hm
Ec5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[
8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.
9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm
@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9
F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8
A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#+<Ve?FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>
A7c8X.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg
:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hnt7+>"^HATfF1$:[fb6q(!:
3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi
$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR@P2V1
Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:E\;<A
Ado)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU:IINX
@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQkDdtG#
F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]
:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=
D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<%16uk
FCep"DejD:FD,*)+EM47G9CR;G9D!G+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$FAKZ).
AKYMtEb/a&DfU+a%13OOC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@j_]m
%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G
+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a
+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5M
DBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<r
An?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s
$<BSn;b9b[4ZXrF/hnt7+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L
;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!
+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%
ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP
78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@lt
Ed8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-
FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTu
FD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=
$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_
C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@lt
EbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,
E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe
$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2
DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)
F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6
/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@
6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8
BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5
F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(k
F#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>
@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HW,DK9<$BleB-Ecbl6FE92l:-pQ_F`)52
B5)F/ATDm(F*)IGF"JsdF`)52B5)F/ATAo8ATMr9A8,OqBl@ltEbT*+/e&-s$8WfFAS5O#4s27Z
+<u=X.kWJ?-ms+JF*)/8A1&]m/h&,2.3O$k+E(d5-RS                               ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO20H`+n0f:(/3$9t1+>Yer0fC.10d&2*+>GYp0ea_*3$9q3+>Ynu0eje+3?U%:+>Pbr0fL42
2'=V2+>PoK:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<r_:K(5"C2[X!Blmp,@<?'W
:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfSfQ6r./^:IJQ,A4fWc+EVO4D]ik1F*))0F*)>@
H"q8.B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2FBPDO0DfU,<De*Bs@qT@jATD3q05>E9A8bt#
D.RU,+>"^GBOPdkAKYZ#F*)>@H#6u-BkCptFD>`)E+*6n@;[3)@;]dkATMr9AoD]48l%ht@:Wne
DJ`g"BkCptFD>`)A8bt#D.RU,D..<rAn?%*+D,P4+A,Et6r-0M9gqfVD..<rAn?%*C2[X(Dfp)1
AT2'fD..<)D..<rAn?%*+D,P4+A,Et;bpCk6U`,+A7TUrF`)52B5)F/ATDm(F*)JGDK9<$BleB-
EZfI8F*&O8Bk)7!Df0!(Bk;>                                                  ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE BYTESIZE CNMFDLOG CNMFMARK CNMFPARMDEFS CN'
zz=:zz,'MFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF CSRC DEFAULT DEPENDENTS'
zz=:zz,'END DEPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH D'
zz=:zz,'PLIMIT ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR0'
zz=:zz,'09 ERR010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 E'
zz=:zz,'RR019 ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR02'
zz=:zz,'8 ERR029 ERR030 ERR031 ERR032 ERR033 EXPLAIN FREESPACE GROUP HASH H'
zz=:zz,'ASHFSX HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IP'
zz=:zz,'YNB IzJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME '
zz=:zz,'JODPROF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF '
zz=:zz,'MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS N'
zz=:zz,'VTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 '
zz=:zz,'OK009 OK010 OK011 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PA'
zz=:zz,'TOPS PUTBLACK PYTHON REFERENCE RUST SQL SUITE SYMBOLLIM TAB TEST TE'
zz=:zz,'XT UNION UTF8 WORD XML ZIG abv afterstr alltrim badappend badblia b'
zz=:zz,'adbu badcl badfl badil badjr badlocn badobj badrc badreps badsts ba'
zz=:zz,'dunique beforestr bget binverchk bnl boxopen catrefs cd changestr c'
zz=:zz,'hecknames checknttab checknttab2 checknttab3 chkhashdmp clearvobs c'
zz=:zz,'reatejod createmast ctl datefrnum dblquote decomm defzface del did '
zz=:zz,'didnum dnl dpset dptable empdnl fex firstone fod fopix gdeps get gl'
zz=:zz,'obals globs grp gsmakeq guids guidsx host hostsep isempty islocref '
zz=:zz,'jappend jcr jcreate jderr jdmasterr jnfrblcl jodinit jodsystempath '
zz=:zz,'jpathsep jread jreplace justdrv justpath jvn lfcrtrim locsfx make m'
zz=:zz,'akedir markmast mnl mubmark nc newd nextbaknum nlargs now nowfd obi'
zz=:zz,'dfile od ok packd plt put quote read readnoun readobid regd remast '
zz=:zz,'restd rv rxs rxsget rxssearch saveobid second sha256 tc trimnl tsla'
zz=:zz,'sh2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '' jodmak'
zz=:zz,'e DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 DU'
zz=:zz,'MPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR01'
zz=:zz,'57 ERR0158 ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBC'
zz=:zz,'ATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP S'
zz=:zz,'OPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl'
zz=:zz,' createmk ddefescmask dec85 dumpdictdoc dumpdoc dumpgs dumpheader d'
zz=:zz,'umpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap fmt'
zz=:zz,'dumptext fromascii85 getallts getascii85 halfbits htclip jnb jscrip'
zz=:zz,'t jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep opaq'
zz=:zz,'names parsecode prefixdumphash putallts rebc rlefrnl sexpin sonl ta'
zz=:zz,'bit toascii85 uqtsingle wraplinear wrdglobals writeijs wttext''),<<;'
zz=:zz,'._1 '' jodon jodoff jodon''                                          '
zz=:2571{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,9t.+>P&q+>Yc02'=h#0fC^@+>k9#1MUi=:-pQU.V`m4+CcuT+DkP$DBMPI6m-#S@ruF'DIIR2
+Cf4rF)rrC$;No?%15is/g*GrC`mY<BOu3,A8,OqBl@ltEd8d;CghC+ATJu&Eb-A)G][M7F(oQ1
F!,C5+EV:.+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig+CT)&+E_a:+EMX5DId0rA0>B#DKBo.
DKKqB@;]TuG%G]'F!,")Anc-oA0>T(+EV:2F!+t/@<6KB%15is/e&._67sBJEb/[$Bl7Q+@3A0<
6m-DWC1Ums+Co%qBl7L'+CQB@BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?+@Kd^FE2;FBl7Q+
@3A0<6m-DWC1Ums+D#S%F(KD8FD,5.-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is/e&._67sBJ
Df0Z*Bl7uQ+Co1rFD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<@;^1./0JYEFCfK)@:NjkG%G]'Et&IO
67r]S:-pQU8T&W]Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$@:F%a+C]U=BkhQs+Dbt+@;KL(%15is
/g)8Z@:FC&+<VdL@;Ka&@UWb^F`8IHATDj+Df-\8@;TRs+:SZQ67sB'+C\tpF<D\K+D58-+E(_(
ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+C\bhCNXS=DIIBn
+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]RgFCcS=DfTB0/0K%GF*)IS+D5_5
F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/@ruF'DIIR2+DG@tDKKT)Bk(Rn
Bl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU
+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g)8ZB4PRmF!)SJCh[s4+D5_5
F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>ATT&=DfTB0/0K%GF*)IS+DkOs
Ec6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5Ddmc1+<YlHEb$;$DIal3ATMr9
B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07ART[l+CT.u+E;O8Ed8d?Ec6)>
F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt@rc:&FE8R5DIal#@<>pe@<6!&
A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+ED%+F_kK,+D#e:Eb0<5Bl@l3F(Jd#@qZ;Y:-pQU+<YfJATJt:+<YlHEb'56F`V,)+C]U=GAhM4
F!+n/A0>u*F*)I4$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtB8l%htATDg0
EcW?W0JG(41cZuo$4R>PDe!TlF)rHH-Xgb.A1%fn@rH(!F(KB6+=Cl<De(4)$4R>;67sC&@<63,
@:WneDBNb6@:Wq[+D,>.F*&O:DfQsm+?;&.0d$o4Eb065Bl[c--Yd7-Ch7Z1Eb/lpGUFUV%13OO
:-pQ_A7]^kDId<rFE8RL/M/)hDfTB0+Co%qBl7Km+DG^9FD,B0+EM+(FD5Z2+D>2,AKZ#)CghEs
A0>DoAnc-sFD5Z2Et&Hc$;No?+D>\7F<GXDARfFdBk&93+Dbt+@;KKtDJsZ8F!,O8F<G+:EbTE(
+A*bqEc5Q(Ch4`*Ddd0jDJ'Cc:-pQU-n6Z/3Zq!`=%Q.0<DGhS73G/k8P`7o$4R>;67sBsBl7K)
An>Oa/0JG2EcPl&B4W3+ATW'8DCcoP@:C?fDIal+Bl7K)ASu%"%15cu4ZY;OHXSN9$:@]S3\`F;
@4hur<'`i63]VOq/e&.T;G9PC3^Zdr9L]Hu%15is/g,">@rcK1F(96)E-*4@E-,f4DBNG-A7]g)
/Kf.R+CSek+Dl%;AKYDlA0>;'DIn#7DdmHm@rri'De*Dg$;No?+CT.u+Dl%-BkDW5FD,5.AoDL%
Dg,o5B-:_rAnc-sFD5Z2+E(j79gM-E:K1In71BSr;aXGS:fKS=1,04F9L2WH=?S]#1(=R]<)$%L
3\iK#$<U"r4ZY>T%16''=B%FE1,TLJ6<R8V4ZY>V%15fq;G0DR=&(n>1,fXL<E)FI4ZY>X%15p7
<(Ke[4ZY>Y%16$29KbEm0F\@];bp.O3\rK"$;"&s:-q*)1GTCH9LV6B4ZYAT%16917m/mh1^sdi
<Duj[3\rW&$:@`i6TmId2@U!&$;No?+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP
<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\/4iZ@
:-pL*76s[">"M48;H6Xp/43?66OaA3$;No?+E(_(ARfg)@rGmhEt&IX:JsSD3\V!M<(0_b4ZY;,
$:dui<DYh>1(=Rh<Cp.Y4ZYA.$;EfR;GTG:1^sd$$;No?+Co1rFD5Z2@<-W9F(K0"+ED%*ATD@"
@q?)V6qKaF8P`)I;HZ.D2%9m%$;No?+E(_(ARfg)DIIBn+Cf4rF)rlTA7]^kDIdfL+BM?:6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%15lt8ju*H:.%0*=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h
$4R>;67sBi@:UL!@VTIaF<G(3A7[;7A7]^kDIdfL+AY<r771$L6OaB3@:X:cC-=U^3Zp",+BplL
.P<@s><3lX+C-+$/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&+=84M
@<?0*E-6&.FEM#6Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O6V(*R
4ZXr53\E!3/5SW3845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^kDIdI!
B-;,1+D>\7F<F@X%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h4Wn#Z
I45U4%15is/g+_MFE1f"FE8RCDJXS@FD,5.E+*j%+D,Y4D'3h@@;KXiBk:ftAnc'm+DtV)ATJ:f
C3=T>E+*j%4ZZe.+FQ9n>p(A@+=LGT+>#2g><3lW/h^H^+=B2t-9We#.P;iJ3Zoq*03g+P:dJ&O
6q'cr4Uh`-$;No?+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQUC2[X(
H#n(=D/`p*BHV#1+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,XoARlot
DBN\4A8c?<Bkh\u$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.C2[X(
H#n(=D/`p*BHS[;De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*F(KB%
Df00$B.dn5F!hD(%15is/h1FMA7T7jASu$iDKKq/$>OKiD..3k:-pQU.V`m4D..3k+CcuT+EM%5
BlJ/:D..3oDJ((=+Cf>#AKYhuDJ='4CghF"Df.TYAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is
/g+,,BlbD<F^eis@<6K4A7]@eDIml3F`_>6Bln'#F!,(5EZf4-CM@[!+EM%5BlJ08+D,Y4D'08p
:-pQUB6%p5E-!.1DIal2F_Pr/F"SRX8TZ(`CiaM;@rH7,@;0V#+Cf>#AKYT'EZee.@;L48Bl7Q+
%15is/g,%?D.Oi1AS,LoASu!hF!,17+A*c#DfTB0/g(T1:-pQB$;No?+A$HmATDBk@q?d#Dfor=
+=84SATD7$3XlEk67sB'+D58-@;Kb%F!)SJ+<Ve>ATVu9@;Ka&FD5T'F*(i-E,uHq:-pQU+<YN0
CLq%!D/^U?+<VdLA9Da.F!,C1C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?
+<VeD@;BFeF!)SJ+<VdL+DkP&AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+DtV)ARf.j
F!)SJ+<Ve:CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#AISuA67sB'+E2IF@;Kb%F!)SJ+<VeGF`_[I
@;Ka&FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8l?$;No?+<VeNFED)=F<D\K+<VdL+EqaEA0>;u
A0>u*F*&OHAU&;+$;No?+<VeNEb&g!Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;
8g%V^A7Z2W:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*]nCLnW/@;]^h
+>G`-/MT7G.1HUn$=e!aCghC++=CT4De*]nCLnk&$=e!gDKBB0F<D\R@;9^k-OgCl$;No?.V*+0
ASu$iDKKqBGV(KiDdmHm@ruc7GA2/4+Co%qBl7X,Bl@l3A7]^kDId<r@qfLq%13OO:-pQUFCAg'
+A,Et+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\-OgCl
$;No?+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo$<L+k
:fL.c=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'@VTIa
F:ARU:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4AR]dr
Ch.T0B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5B6%r<
4s2%%+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4
-RWA3F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17+EV:.
+EM%5@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7/12fP
+DEGb-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*
F*)>@ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE-QmAN
F<Db[+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6DKI!K
-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*ATD?m
+EM%5@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT7h#e7
$;No?.V3L.A7]^kDId<rFE7lu%16igA8c?\67sa&De*d(+EK+d+E2.*@qB^(-u*[2Df.!H@;]Tu
-u*[2De<T1+DG^9H6@$B@ps1b/e&-s$=e!aF`MM6DKI!KH7'./                        ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q-+>P&q+>Pes2'=\8C2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[X$DK'E#@qB^(-u*[2
Df.!H@;]Tu-u*[2De<T1+DG^9H6@$B@ps1b                                       ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 globsBasicDDef00 makePathtest02 mnlBasic00 putNameTimestamps'
zz=:zz,'Basic00 restdBasic01''),(<<;._1 '' jodpreparetests createtestdictiona'
zz=:zz,'ries loadSmoketest0 loadSmoketest1 loaddumpSmoke00 loadtest001dicti'
zz=:zz,'onary loadtest002dictionary loadtest003dictionary loadtest004dictio'
zz=:zz,'nary loadtest010dictionary loadtest100dictionary makePathtest01''),('
zz=:zz,'<<;._1 '' jodsmoketests abvSmoke00 addgrpSmoke00 bgetSmoke00 bnlSmok'
zz=:zz,'e00 bnlSmoke01 bnlSmoke02 compjSmoke00 compjSmoke01 delgrpSmoke00 d'
zz=:zz,'idSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeMacroTexts docSmoke'
zz=:zz,'00 dpsetSmoke00 edSmoke00 etSmoke00 gdepsSmoke00 getrxSmoke00 globs'
zz=:zz,'SmokeAssign000 globsSmokeDD00 globsSmokeDoc00 grpSmoke00 gtSmoke00 '
zz=:zz,'hlpnlSmoke00 jodageSmokeDays00 jodhelpSmoke00 jodonSmoke00 lgSmoke0'
zz=:zz,'0 locgrpSmoke00 makeHashchkSmoke00 mlsSmoke00 mnlSmokeArgs00 newdSm'
zz=:zz,'okeBadArguments00 noexpSmoke00 notgrpSmoke00 ntSmoke00 nwSmoke00 od'
zz=:zz,'Smoke00 odSmokeArgFail00 putMaxnameSmoke00 restdSmoke00 revoSmoke00'
zz=:zz,' rmSmoke00 rttSmoke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00 usesSm'
zz=:zz,'oke00''),<<;._1 '' jodstresstests getStress00 macroloadStress00 makeH'
zz=:zz,'ashchkStress00 makeStress00 packdStress00''                         '
zz=:1181{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>PcgDe*<cF(o-+ATMs7F*22=AKYo'+C\c#Bk&8X:IH=IATMs7~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&o1E\G0+>G_r1H$@11E\M0+>G\q2)AucA7AtgBk)6rF*)JEF_Pr/+E(j7@UX=l@j"B>
6m-S_F*)J<De*g-AT2'uATVL)FE:r4ART[lF!+n/A0>],@:XF%FCfN8F!,"-@ruF'DIIR"ATMU)
A92U+CLqU!F*)JH@<-(#F`S[HD/X3$+EV19FE8QV+Eh=:Gp$R)F(o,,Ap&!$FD5Z2F)#W(F*)G6
F)uG7F*)JH@<-(#F`S[HFE1r6F!,R9F*)IG/Kek<EbAr+@Wcc8DJsV>@rc^5BPD?s+Eh[>F_t]2~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkcT;F;Qq;Go2)1*B"`;D9m_+A$lO:IJo7FCfK)@:Njk8U=!)7!*?cCi^^j
H:gt$F`_>8FCfK)@:Njk8l%iS:JXY_<_Yt)8l%iU9gg+"9/&(T+Au3<<$5poA8Gt%ATD4$AQDMn
+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DkP&AKYo%+EqpLAU&;E.4cl04?G0&0d%hdA7]RiEc=ro
Deio<0Hb">FE2V)D/X3$0JFV^FAm$pCLo1R+D>S1DJW6gDeio<0Hb+KA8#OjE)UUlCLo1R+Db[h
D/X3$0JFVcDdd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ+Dbt)A9;C(F>5I'A8,OqBl@ltEd8dD
De!F#E)UUlCLo1R+DkP&AOp6NBOb^k;f-GgAM>e\D..3k87?RQ@q]XVFE1r6F"f9jD..3k:gnHZ
FCfN80JO\e@;BFN@<?1)ATMrI1*CFMF&QpoCLo1R+Du+/G]6SuDeio<0Hb7OFD#W5;f-GgAM>e\
DKJfoDeio<0Hb7W;f-GgAM>e\De)d`Deio<0HbCIG&L;rDeio<0HbCQ;f-GgAM>e\EccD%D/X3$
0JFVlF(KDkD/X3$0JFk'/1<VC4"akp+=A:HDe'u*De*]nCLnW'De*d(-RgSp4?P\X?SNZN+DPh*
@UX=l@ru:'FE8R>De*g-AT2'uATVL)FE8R>De*p+Deip+ATMs7+DPh*F*)G6F)uG7F*)IN.4cl0
4?G0&0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+Abj4<*sBYA8Gt%ATD4$
AKXrJ6r./^:IJQ,A0>Q"F*)>@H"q8.+D>J1FDl2FC2[WnDdso,@;]dkATMs.De'u-@;]dkATMs.
De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'+E_RBAS5^uFCfK7ATMs7-RgSp4>J$62'aq21,L[D
1,(=<0Jk[B2*!QM2'=Y.1,L[D0fL^A1GpmI3&EBK1*A>+1,L[D0fL^A1H%3H1c-p@0d&5*1,L[D
0fL^@3&EHG2E3TO2BXb/1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D
0fL^@3&EHH0K([B2'=Y.1,L[D0fL^@3&EHG2_m-D1E\G,1,L[D0fL^A1H7BT1,UjD3$9t11,L[D
1,(=<0JY=>0f1aH3$9t11,L[E0fL^A3Ar]J1-%9N1*A>+1,L[E0fL^A3Ar]J1G^gB3$9t11,L[D
0fL^A0JtXG0f_$F3?U(21,Ua@0K(OA0f:dD2)%$H2BXb/1,UaB0f^jD0fV'J1c.-N1*A>+1,L[D
1,(=<0JtOC0f:jD3$9t11,L[D0fL^A1GpmI3&EBK1*A>+1,L[D0fL^A1H%3H1c-p@0d&5*1,UaB
0f^jD2)@!B1bq$F3$9t11,UaB0f^jD2)@!B1bq$F3$9t11,UaB0f^jD2)@!B1bq$F3$9t11,UaB
0f^jD2)@!B2DI-E2'=Y.1,UaB0f^jD2)@!B1c@-M1a"P-1,L[D0fL^A1H7BT1,UjD3$9t11,L[D
1,(=<0JY=>0f1aH3$9t11,UaA1GLL=2`WQO1G^jE1E\G,1,UaA1GLL=2`WQO1H.$H3?U(21,L[D
0f^jD1H.'I2DHsD+>PW+2)$d>2_HpD0fM$M1H76O+>PW+2)$jA3A*0F3&WcQ3&rE=-p07-1,L73
0JYI=2_m<E1H@6J1Gh$H1GU(.0JYI=3&!0A2)dKL1GLUE0f1".0JYI=2_m?F2)@'F2`3KM3&r*:
0JYI=3&!0A2)$pG2E*WO3&r*:0JYI=2_m<E1H.3O3B/]J0Jst.0JYI=3&!0A2)I!C3&`NF0KC72
0JYI=2_m<E1H@3G2)I<M0esk,0JYI=2_m<E1b^gJ3&ioP0JXb+0JYI=2_d9E2)[6H0f_'K2]sk0
1,L[D1,ggB1,LmD2Dd0E2'=Y.1,L[D0fL^C1c%*F3&<?J0d&5*1,L[D0fUdC3&ruT0KD!N+>PW+
1b^jD0J5.>3&ETK3&W`S+>PW+1b^jD0J5.?2)R'J2E!BK+>PW+1b^mC1+kC?3&!3J2`*EK+>PW+
1b^jC3A*-G3&<9C0fV'O+>PW+1b^jD3%d'C2)-sJ1,q6K+>PW+1b^jD3A*-D3&ioQ2)R'H+>PW+
1b^jD3%d'B1G_$M1,UsE+>PW+2)$d>2_HpD1Gq0N2E!BO+>PW+1b^jD2(g^A1,psG3AriU+>PW+
1b^jD3%d$H3AE<G2E!QO+>PW+1b^jD3%d$F2`NTN3&W`=1,(I?0K1aF/i5@A3&rZQ2_m961,(I?
0K1aG/i5:C2)@0I1,q$31,(I?0K:aC/iGC=3&W`M2)I$11,(I?0K1aH/i>FA1H.0L1cRK<1,(I?
0K:aC/i>CC1GUmF3&ET;1,(I?0K1aG/i,FG1GUjD2D[-31,(I?0K:aC/i>LA1,:[F0ebL.1,(I?
0K1aG/i57B0K(pG1,(^21,(I?0K1aG/i57A1GUjE1bq!41,(I?0K1^G/i>OI2`WlS3&Vm70JYI=
2_m<E1c$g?3AW?F1GL"-0JYI=2_d6D2E!?L0K(gF1,U100JYI=2_d9E2*!KQ0fC^B0JXb+0JYI=
2_m'>1H%3L3&!<M3&Vm70JYI=2_m'>1H.0K0KD$L1c-=10JYI=3&!0A2)%$L1,q6Q3B83;0JYI=
2_d<F2).*G3AifP2)HF20JYI=2_m?F2)6pC2`<QP2`Dj70JYI=2_mBG1cI9G2)I-G0fL410JYI=
2_m?F2)$pB1H%$I2_uR30JYL>1,(X>1c.!G3ArcR1cQU50JYI=2_m6C1cI<K1H@-C1cZ[60JYI=
2_m?F1cRBP2`<WN3&i$90JYI=2_m?F1c@?N0K1^E1H$@20JYI=2_m9D1cI9N1H79Q1FXk'4>J$8
,Vh&/1b^jC2_Hp@3AWEL2`*6J+>PW+2)$jA3A*0E0JkU?1c7!I+>PW+1b^jC2_HmG2)R0H3AiTK
+>PW+2)$jA3A*0E0JYC?1GLgK+>PW+2)$jA3A*0E0JkU?1c7!I+>PW+1b^jC2_HmG2)R0H3AiTK
.4cl01*AD!1,(I?0K1a@/i,FD2)mBO1bpm11,(I?0K1^G/i>XI1c[NP2_[361,(I?0K1^F/iGOC
1,:gJ3B&c;1,(I?0K1^G/i>UK3B8lM2D?m/1,(I?0K1a@/i,FD2)mBO1bpm11,(I?0K1a@/i,CF
2)R?Q1GLa01,(I?0K:aC/i>UB1,UdF1Gh$51,(I?0K1^G/i>UK3B8lM2D?m8/1<V9+>GPq1,(I?
0K1^F/i,ID1bg[B1,Cd11,(I?0K1^F/i,ID1bg[E3Ar!80JYI=3&*?E1c[HL3&iiQ3ADX30JYI=
2_d6D1b^XC0fV*J3A_j60JYI=2_d6D2E!NP1,q6Q3&Da50JYI=2_d9E2*!ZQ2E*KR1,U100JYI=
2_d6D1H73J0K(mK1c?I30JYI=2_d6D1H73J0K1aB1,C%.0JYI=2_d6D1H73J0K1[B2_lL20JYI=
2_d<F2)70H2)@$D0KC720JYL>1bh!C2)R0F0fCaF0Jst.0JYL>1bh!C2)R0F0fCmL3&r*:0JYL>
1G^a<1cIEK3&<?I1c$700JYI>0ebU?2D[6M3B&WO0fL410JYL>1bh!C2)R*E3&`cR1G^./0JYI=
2_d9E2*!ZQ2E*KR1,U100JYL>1bh!C2)R0F0f1^E2E;m80JYL>1bh!C2)R0F0f1^E2E;m80JYL>
1bh!C2)R0F0f1^E2E;m80JYI=2_d<F2)70H2)@$D0KCR5-p014/1<V7.4cl00I\P$4>8384>6 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
