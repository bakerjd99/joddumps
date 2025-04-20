NB. sha256:57d53c049f3f86f959a5b935e2fdbc7ee06212d2d2084091aca4a58014157367
NB. JOD dictionary dump: 20 Apr 2025 16:01:11
NB. Generated with JOD version; 1.1.3 - dev; 40; 20 Apr 2025 15:51:31
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

JODTOOLSVMD=:'1.1.3 - dev';38;'20 Apr 2025 15:51:31'

JODVMD=:'1.1.3 - dev';40;'20 Apr 2025 15:51:31'

OK011=:'hash matches ->'

RUST=:35

jodliterateVMD=:'1.0.1';15;'31 Mar 2025 11:29:52 MT'

jodliterate_hashdateurl=:<;._1 '|4a6b149f7e1f79808d1337fdc3d04d0b2165f0f93a8cbf043c36db6b9b3aa9f4|31 Mar 2025 11:29:52 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


jctabs=:3 : 0

NB.*jctabs v-- split code and comments.
NB.
NB. monad:  (ct ; ct) =. jctabs ctJcode
NB.
NB.    jctabs jcr 'cutnestidx'

NB. mask of unquoted comment starts                              
b=. ($y)$'NB.' E. ,y                                           
b=. +./\"1 b > ~:/\"1 y e. ''''     

NB. comments                                                                                                                                                          
c=. ' ' (I. -.,b)} ,y
c=. c $~ $y 

NB. code
j=. ' ' (I. ,b)} ,y
j=. j $~ $y  

NB. code and comments 
j;c                                                                           
)

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

reeddfb=:3 : 0

NB.*reeddfb v-- remove extra direct definition blanks.
NB.
NB. Current J 9.6 and  9.7 systems insert  extra blanks after the
NB. closing }} delimiters.  Repeated redefinitions of words keeps
NB. adding  blanks.  This verb  reduces all such blank  runs to a
NB. single blank in the code  of explicit definitions.  Commented
NB. text is not altered.
NB.
NB. monad:  cl =. reeddfb clJcode
NB.
NB.   reeddfb 5!:5 <'cutnestidx'

NB. split into code and comments
'jc cm'=. jctabs ];._2 tlf y

NB. remove extra blanks in code !(*)=. rxapply
jc=. ];._2 '}}[ ]*' rebc rxapply , jc ,"1 LF

NB. shape may have changed
jc=. jc {."1~ {:$cm

NB. remerge code and comments
ctl a. {~ (a. i. jc) >. a. i. cm
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
  NB. remove extra blanks inserted in direct definitions ignore nouns
  NB. and only change words containing terminated direct definitions
  b=. 0 < ;1 {"1 y
  if. #dds=. I. b (#^:_1) +./@ ('}}'&E.)&> (I. b) { 2 {"1 y do.

     NB. NIMP: code that only changes code - causes problems ??
     NB. y=. (reeddfb&.>(<dds;2){y) (<dds;2)} y

     NB. NIMP: NOTE: alters commented text within ddefs
     NB. require 'regex' !(*)=. rxapply
     ddbfx=. {{ '}}[ ]*' rebc rxapply y }}
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
2DZI10d&4o1a"P-+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ACr1,C%2+>P_q1a"M1+?(E!
2]t"$1GqNu;F=q:F)Q2A@q?d$E-,f4DBNG-A7\>Y8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk
@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$FDl)6F%T4r
<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt
8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'W
ATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APuN,<-!,&F<GXC
F`Lu'+E)4@Bl@l3@rGmhC1D?o@WQU0Ch[u6@rGmh+CT.u+Cf>,D.RU,F)>?$ASkjkATJtd+EM%5
BlJ08Eb/fmA7f:kASl@/AKYQ/FE1e4A8-'q@rri(AS,XoBln'-DBND)@;]k%GB@q<G][t;FEMVA
F!+n/DJsW*FCeu*GAhM4+E)9CFCfN8+EV1>F8                                     ~>
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
0ebL.0ea_++>G_r1*A;01GCX.1,'h++>Gc71c-=02BXat0f1RB+>GSn1*AA01,^700H`+n1GC[A
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
2'=V03\`NR1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1Gp9t6t(1K3Zp13+@0se+>PW+2'=V13]&]T1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp13+@0se+>PW+2'=V13]/cU1,TCG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1H6L"6t(1K3Zp13+@0se+>PW+
2'=V23\rWS1H#RI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS
1H?R#6t(1K3Zp13+@0se+>PW+2'=V23]&`U0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%
+Co&,+<X!nBl%<&:3CD_ATBgS1b^$p6t(1K3Zp13+@0se+>PW+2'=V23]/WQ1GK5/:IJ/X:J=\R
<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f1"F@;[2C0JYI-0f1pH1HI9G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0f^@K@;[2C0JYI-0f(jI1HI6F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f^@K@;[2C0JYI-0f(jJ2EE]R$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@K@;[2C
0JYI-0f;!L3'&oN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp13+A-'[+>PW+1a"M.3]&QP
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo
+@KX[ANCqh0H`trDBL\g1,L+.1HI?I3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nD@;[2C0JYI-0KD0K1cdHL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>PYo
8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+1a"J43]&NO0K9CH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh0d'(sDBL\g1,L+.
0KLmA3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fU$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo8muT[1,(I?+>GT31cRNN0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K
3Zp14+A-'[+>PW+1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'(sDBL\g1,L+.1HIBM3\iQ"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,0nD@;[2C
0JYI-0f1pI0KM$F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+2+@]pO+>PW+1a"M13]&WR
1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr
+@KX[ANCqf1*B%t@N[E[1,L+.0fh'E3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E2``WN$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>Pn
7V-$O1,(I?+>G]61,(aE3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,g<u6t(1K3Zp+3+@]pO+>PW+1a"M03\rWS1b]7D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf1*B%t@N[E[1,L+.
1cdEP3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>So7V-$O1,(I?+>GQ21c@BP3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K
3Zp+4+@]pO+>PW+1a"M-3\`<L0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf1E].u@N[E[1,L+.1cdBO3\`T$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0Jah@ARZc;
0JYI-0f1pI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=!1a!o/@<?'A+>>Yq7V-$O1,(I?+>>f:2)@9J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1Gp9t6t(1K3Zp+6+@]pO+>PW+1a"M,3\`BN
1cPgL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&+@:3bCh+Y`F_tT!E]P=!2BX,1@<?'A
+>>Yq7V-$O1,(I?+>GQ20fM-I1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>bt7V-$O1,(I?+>PZ40KD0N1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>>bt7V-$O1,(I?
+>PZ41G_'G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_
ATBgS1a!o/@<?'A+>>bt7V-$O1,(I?+>PZ42)dQM3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>bt7V-$O1,(I?+>P]51,V*J0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>>eu7V-$O1,(I?+>>f:2*!]T3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>>eu7V-$O1,(I?+>GT32*!]S1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu7V-$O1,(I?
+>GW40JY[G0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnIk6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqg0H`hr@N[E[1,L+.0fh-I3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5
+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.2+@]pO+>PW+1a"M.3\W9L2)>RH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@]pO+>PW+
1a"M,3\`KQ0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.6+@]pO+>PW+1a"M,3\iZU1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.6+@]pO+>PW+1a"M,3\rNP1H5^K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp.4+@0se+>PW+1a"J43\`HP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.5+AH9i+>PW+1a"M-3\`TT0JNnA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AH9i+>PW+
1a"M-3\rWS1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp+4+A-co+>PW+1a"M/3]/ZR1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp13+A-co+>PW+1a"M13\rNP1c,OH
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp14+A-co+>PW+1a"J33]/TP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2DBL\g1,L+-3'&oT3\r]%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,0nDF`&<W
0JYI-0KD0K1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>PYo8p,"o1,(I?+>>f:0f1pI2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp14+A-co+>PW+1a"J43\iKP
2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q
+@KX[ANCqh1*B23DBL\g1,L+.0KLmJ3]&c&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,9tEF`&<W0JYI-0ebXD0KM$M$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>\r
8p+qm1,(I?+>G`72).-J0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp+7+A-cm+>PW+1a"M23\W<M1c#IG$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2BYV7C`kJe1,L+.
2EEQN3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp.;+<X'\FCdKU0K(%GF_i0U0JYI-0fD'J2**NQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r8p+qm1,(I?+>Gc81GV!I0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp+8+A-cm+>PW+1a"M,3]&fW0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2]t_8C`kJe1,L+.0KM'O3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K1+HF_i0U
0JYI-0ek^C1-.9O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>>_s8p+qm1,(I?+>GT32)%'I2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+A-cm+>PW+1a"M-3]/`T
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht
+@KX[ANCqf2]t_8C`kJe1,L+.2EETK3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K:1IF_i0U0JYI-0ebXC2EETO$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>bt
8p+qm1,(I?+>GZ51,CsJ3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS1-$I"6t(1K3Zp.2+A-cm+>PW+1a"M,3\`WU1c5UI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg1*B23C`kJe1,L+.
0KM'L3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's
3Zp45+<X'\FCdKU0f'qEF_i0U0JYI-0fD'J1-.6J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>G\q8p+qm1,(I?+>>f:2)[KM0a\6p
:-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=Wi
D.7's3Zp47+<X'\FCdKU0f1"FF_i0U0JYI-0ebXF1HI6F$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>G\q8p+qm1,(I?+>GT30JPUC
3!p!":-pQU;gEG+ASjIN8l%iS:JXY_+?VbrDf'?&DKKH#5!C)36$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3Zp49+<X'\FCdKU0f1"FF_i0U0JYI-0ek^C1-.*G$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!2BX,1@<?'A+>G\q8p+qm1,(I?+>GT3
0etdG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS
1H-F!6t(1K3Zp.6+A-cm+>PW+1a"M-3\`NR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yu"+@KX[ANCqg1a#D5C`kJe1,L+.0fh'G3\iDs$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
2BYV7C`kJe1,L+.1HI?H3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=
6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2]t_8C`kJe1,L+-3BAlN3\rQ!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2]t_8C`kJe1,L+-
3BB#Q3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqg2]t_8C`kJe1,L+.0KM!J3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg3?Uq:C`kJe1,L+.2**QL3\W;r$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh
0H`u1C`kJe1,L+.1-.-H3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf1E\u+B-8r`1,L+.0KLsK3]&i($49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqf1E\u+B-8r`1,L+.
0KM!J3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg0H`Z(B-8r`1,L+.0fh$L3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,pCBF_;gP0JYI-0ebXF1cdKO$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A
+>Po!6$6f_1,(I?+>GQ21cIHP1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,
+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+B)ij+>PW+1a"M/3\W<M1c#IG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqf1E]V-E$-ni
1,L+.1HI6N3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.6+<X'\FCdKU0KC7SAT/bI0JYI-0ebXG1-.-H$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>>eu;e9nj1,(I?+>GQ22)dQQ
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s
6t(1K3Zp+3+AZKh+>PW+1a"J43]&iX0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqf1E]J'F<E=m1,L+-3BAuR3\`;q$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0eskI
@rrhK0JYI-0ek^E0fh!H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<t3?TG4@<?'A+>Y_p:LeJh1,(I?+>GW42)[KP3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AQiu+>PW+1a"M/
3\rHN0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>PYo+@KX[ANCqh1a#P3Fs&Oo1,L+.1HI6M3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0ejeC@;[2C0JYL.0KD0O0KLmE$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A
+>>\r7V-$O1,(I@+>G]62)%'G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,
+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@]pO+>PW+2'=V23\WEP2)GXI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqf2BYJ#@N[E[
1,U1/2**QJ3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=Wi
D.7's3Zp19+<X'\FCdKU0K1+DARZc;0JYL.0ebXE3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>>_s7V-$O1,(I@+>GT30JkgH
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!
6t(1K3Zp16+@]pO+>PW+2'=V33]&QP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqh3?V%)EZd+k1,U1/1-.6K3\iJu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1GL"H
@<*JG0JYL.0etdG1-.-J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P=!0d%T,@<?'A+>>\r6#^ie1,(I@+>GW41H7EQ2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp.;+@0se+>PW+2'=V/
3\rKO0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Yer+@KX[ANCqg3?UV,EZd+k1,U1/1HI6K3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt7+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU1,'h:E,m'V0JYL.0f1pJ2**QR$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A
+>PVn6#^ie1,(I@+>G]62)REM2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i+V%+Co&,
+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp13+@0se+>PW+2'=V23\rWS1H#RI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yr!+@KX[ANCqh0H`Z#EZd+k
1,U1/2**QP3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=Wi
D.7's3Zp4<+<X'\FCdKU1,'h:E,m'V0JYL.0f;!L0fh*F$;aMs<*sBYA8Gt%ATD4$AMPtL$;No?
:et"h?YXLiCh\!&Eaa'$+E27?F<GOCDe!@"F)Q(O+=Jfo.6T^$$4R>`D/XQ=E-67F8Oc!57:0eJ
A8Gt%ATD4$AN`'s-nlc)+>>5R$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3Zp13
1,UaA1GNW!0etaH1($cC/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU<(KSZ
:dIiE:I?6I+<VdL:-pQUAp%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*
E+*j%%15is/g+bEEc#N&@:NkjAU#=?+<XEG/g+bEEc#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*q
B4uBuA0>T(FCfK)@:NjkGAhM4Et&IO67sBnEc>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:
EZf"8Dfp"A.![6N$;No?+DGFr@qB^m@ruF'DBL&E+AP6U+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(
Ed8dKFE2)5B+52C67sBpAn)r++<VdL+<VdL+<Ve%67sBmDfT]'F<G:8FCfK)@:Njk@rH4$ASuT4
FCf]=%15is/g,4HFD>`)Ch\!&Eaa'$+<XEG/g,+RAT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9
F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfTb$;No?+E_mE@<?(*Ao`*6Eb'56+AP6U+E_RG
Ea`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@%15is
/g,@VEb'!#F<D\K+<VdL+<XEG/g,">CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![6N$7QDk%16T`
@s)g4ASuT4-XpM*AL@oo@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO-o2u,+>>5e-RT?1FE2XZ
%15is/g,:XAKYE!Gp%'7DIdZq+EM+9+DG^9FD,5.8l%htE,ol/Bl%?'AoD]4FD,B0+DkOsBPD?q
%16f]/g,@LG[FloDe*2t4=<s'77K^D;FNuM5u'gD6XOPBDe*3&+CoCC+:SZ#+B1m';c#bT6r-0W
@;9^kCh\!&Eaa'$?TgFm:f9_O78d#P6r60E6r-0WBkhQs?O[?RCia/?%144#F)>i<FDuAE+=Bu`
77K^D;FNuM5u'gD6XOPBDe*2tDJsV>F(KG@%16ZaA1e;uBkAt?.kWJ?-mrtBDIdZq-RM87.3NS<
DK]T34Y@j=0RFp)4"akq+EVF3+=M;EASc0*<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f/12Pl/Tt]G
F(oQ1-Rg/i/g*MZ+CoCC%144#F)>i<FDuAE+=D;QBl7Q+FD,B0+E1b,A8bs=+=A^>84c`V5u'gD
6XO8:De*ZuFCfK$FCeeg$6UI4D/XQ=E-67F-VdH:762Q"A867.F<GO2DIdZq+E1b2BHV#$+CfP7
Eb0-1+Eh=:F(oQ1+=JTgE+*X-ATB=L.3N>G+Du+>+?hq21+kR>0eP1.%144#F)>i<FDuAE+=Cl@
+E_R9GT_'@ASc1(+EVXL+EM+&EarcsDJ()9Bln#L+EqL1Eb-A4@;]Uo@j_]mASu$2%16TRFCSu:
%144#F)>i<FDuAE+=BTU;GU1O+E1b,A8bs#DJsV>F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^k
Ch\!&Eaa'$?RH9iASu$2%14Nn$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6t
A1hh=B.4s28l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,Rp
F(KDF%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)
FCB6+/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/
@;]^hF"Rn/6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<
F<G:7E,9*&ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(I
AS5^p/TboADd?`[$4R=s/g+Oa?T9fO0Q)#DGVO%jB5]agFu4FtFEolYCNs2M?m%gTDKBN&ATAo%
A7TClB-:V*AoD^,@<?4$B-;,3FD5Z2+EVNE?u9=fARHX&BOQ!*B4YslEaa'$Et&I!+<Y3/Eb/a&
+Co%qBl7X,Bl@l3AoD^,F!,[?ASrW-@;BRpB-;8*EbTK7F"SS7BOr;sBl[cpF<G+*Anc-sFD5Z2
+D,P4D%-gp+<YB>+Dl%;AKYQ#AS5FhF<G"0A0>PoF!,R<AKYl)@q?cpART\'Eb-A3Afr:.AT;j2
FD5W*+s:r@DJ*cs+Dbb0AKYQ/E,95uBlnDI+D!0</e&.1+<Z,^IXV_5+<Ve%67sC#F`2A5A0>r8
@;]UaEb$;(G]7J5@qg#o$6UH6EcZD7ARdka+>Y-$+=CH&-r*c99MIfN9-R^l5V=H5/5fDI:/st]
.4-W-.82cV+?V_<?SWr\4s2sL/mg@VGpa%.+<Ve%67sBkA0>K&Ebu6m+<VeIF*;)*@q9+53Zrcr
+C/A':/st]9gMZM,$uca/gr,!;H$Uk<D6(8-7q8-9KFjM4?G0&1+"V;+?V_<?SWaL+FSYI$6UH6
IXZ`p%144#+B3#c+Cf>-G%G]8Bl@l3Ao_g,+EMX5DId0rA0>H.E,95uBlkJ>D]iS$+DGm>F*)G2
BkM+$AoD^6@<,m$@<3Q-Df01s$6UH6@<3Q5BOr;sAS,XoBln'-DBNJ.ATJu3Dfd+EF(HJ&DL!@C
Afs\nF!,L7F(KB8ARlolEbBN3ASuT4DIIBnF"@b-+<Ve7FWbiMD'3_(/g)9&+Cf(nDJ*N'Ch[Zr
+EV:2F!,[FF_kS2@;L"'+DG\3@:OC%?tsUjCh\!&Eaa'$?m&p$F:AR"+<YTGATD3qC`mq?F_kS2
D..3k+A*bdDe*E%DJ<TlEZfIB+Dbt7CER>5/e&-s$8O4V?p%e,G\^i"2)BJp@6$8i0k5?BARd]8
EHj0_?Tqj?6Z6j`Bk1dq+CSekBl7Q+FE_XGDIn#7@rH6sBkMR/@<?4%DBNk:FD5Z2F"SS2DIjr4
D]j.EEc*"<DD,p?AftVuEb/a&+Co%qBl7X,Bl@ku$6UH6AoD^,@<?4$B-:W#A0>B#DKKo;C`mG6
/0JA=DffZ(EZfIB+EVaHDBNk805kH7+Eh16BlA-8+Eq77DJ=!$F!+n/A0>B#DKKo;C`mG6/e&.1
+<Z,^IXV_5+<Ve%67sC&F`M@BDf-\.Bl[cpF<G+*Anc-sFD5Z2+D,P4D..O.Bl7Pm$6UH6A8lU$
F<Dr!8Q%uE<('/E-Ta")+AP6U+EVaHDBNk0AftVpAS-!+/KePGEcP`/F<G%(BOQ'uDfp(C@;]Tu
A7]@]F_l./$6UH6A8lU$F<Dr!8Q%uE<('/E-Ta%*+AP6U+D,P4D..N/-uEC.ALSaBATN!1FE8R5
F!,"-Eb/a&+Co%qBl7X,Bl@m1%144#+CoG4ATT%B6qL9F6W?HB7OL8Q+<XEG/g+bEEc#6,+CT=6
A8-'q@rri(AS,XoBln'-DBO%DEc*"<AnE/n.:d""Cgh?mFD5Z2F'p+A+D!0</g,Lf.3N.DGT\M^
I=35PF!,gVGT\LZH$t)M$6UH6A8lU$F<Dr45uLHL:.J514"qd"+AP6U+EVaHDBNk0Afu;+Ec,T/
B6+Lh+<Ve;E-#T4+=C5V;GKeY7oLcs0d%S]:-pQUFEMVA+Eq77DJ=!$F!,C=+>"^QATMp$B4Z-,
GA(Q*+F##S+E\fM+Di6=+E_a:A0><%+Dbt+@;Kuo$6UH6IXZ`p%13OO1G0eX4C9mREB/2&H#n'`
EHO'Z2DTSm@r,j72eR;@5%#L.ATo87F_t]1Bk&8r@<>q"H#R>9+CT.u+CQC&Df0`0EcYr5DBO(D
Bl%L*Gp$L)/mof1Eb-A&ASH$p%144#+CSekARlotDBMOo3A*34-o*J31hpH:0JY("G@_n7Dg*=;
@<Q2k$6UH6?nZ53FCf)rE\T4]DKKH&ATBOZBl8$(B4Z*?04o$=@<?4$B/2,PCi<a(Bl7Q?04o$=
@<?4$B/);P+EqL1DIn!&EZfI;ATD?)@<,og$6UH6@q]:gB4Z-,FDi:2Bl7@"Gp$g=FCfK1@;L!-
BlkJ3D/`onFE8Qs:IHfX+A!r(AKYDtEb/ZiGp$d7F<G!7@rH7.ATDj+Df-\:Eb/`pF(oQ1+D#S6
DfRH>$6UH6<+ohcF(KB+@;I&sF_u(?AoD^,@<<W7F*1o-Cj@.IDfTW7+D5V,DJ()(DfU&1Eb$;%
F`\`t+CT+0@rH6pATD["A0>;iDfp.E@rc-hFD5W*%144#+CoV3E$043EbTK7F!,R<@<<W9Bl%T.
DJsV>Ci<`m+DG^9DerrqEZdssG%G]8Bl@m1/g+50Cht5-@<Q3)FDi:4AThd/AKZ&4D.Oi2@q]Fj
AISth+<YcE+Cf>/AM,*#:K0bD+EM+*D0$hAD]i_%G%De*AS#a%AncL$A0>T(+DbJ.ATAnc+?;&4
+C\o(@<4%1$6UH679N&X:JaJT+X%:%%14pE+CI<=@W-@*1NYBqA9<#SBlmoECMS3@BeV7uG$dF@
+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*Dg-7FAnc'mF!,C=+CoM,
G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6+DGm>De<T6+B3#cEb-V>
+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!$6UH6A9)C-ATJu'F`\a6
An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7Ch[Zr3XlE=+<Z,^IXV_5
+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0/no'4-OgD*+<Z,^IXV_5
+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\ABl7I"GB4mJH#n(=D0$hD
BOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&AM7V.BJ4+EDfTB0/no'4
?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/%144#+EqL1DBMtV:*=7l
+E(k(/e&.1+<X*U78luY78>!L%13OO2(g"Z4C9m!F?!fLApA-;E-6;3Ao)O4DfI]q1iRD@5%#L4
ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BEDIal+Bl8'</g+,;ART?sBkAK*AS#C`A1e;u%15!G
+<Y&S?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R
@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr@;]^h
A0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>$/g)8Z+CI<=A2.V:Antp31jO%`CghF'@q[W:@5V_B
DdP\9+@C'bF(o/rEZee,Ci=N3DJ()"IP5(O@<3Q"+E1b2BHV87AS,Y$+E)-?D.-pM;]oLdA0=Q[
DKU1HF*VhKASlK@+B3#c+D>\1AKYMtEb/a&DfU+G@rH7.ASuU(Df-\9DBO%7ATME*F*VhKASlK2
BlbD;ATMg%@ru9m+C]U=?t<tl?nMlq%16KIASu$1FDk].?!n*KBPDO0DfU,<De(U^B4YslEa`c;
C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c
/hnt7+>"]aGA2"F+E_RBASbpdF(Jkk$4R=b.Nfj5BOr;o2BZpK?m'B,FD5Z2+Cf(nDJ*Nk+EVNE
DfB9*+EV:.+D#G4Bl[c-E+*j%+E(j7FD,4p$6UH6+EV:.+DbJ-F<G+.@ruF'DIIR2+DG^9@3BB#
F*&OCAftVu@ruF'DIIR"ATJu&DIal/F`\aBART+`DJ'Cc+<VdLA8,OqBl@ltEbT*++D,>.F*'#W
%13OO+<VdL+<VdL+AP6U+E)41DBNA(C`mY6+=LuCA7T7p.3NS<FD)e*DIal,@;BEs-u!O0GUXbS
F`\'"+<VdL+<VdL+>t?\A0<rp-Y[F/GT^a>A7T7p-Qij*+<VdL+<VdL+AP6U+E)41DBNA(C`mY6
+=M2F@<j:EE+*j%+CT.u+E2@4AncK4-tdL?/0JJA@rj(A-tdL?.3N>G+E2IF%144#+<VdL+<Vdb
+E(d54$"a%E-!.4De!i2E,8s.-OgCl$6UH6+@.,`@;]V$+Eh=:@N]&sAT2$"BOPs)@V'+g+CSek
ARlp*D]j.8AKXT@6m-GhDe<^"AKYT'EZfI;Blbm9$4R=b+<VdL+<VdL:-pQUDfB9*+CT)&+Co1r
FD5Z2@<-'nF!,C=+=LuCA7T7p.3NS<FD)*j+<VdL+<VdL+E(h1+=CoBA7T7p-OgCl$6Uf@+@UNs
Ea^)"Cgh3sF!,17F(KB6ARlolAoqU)+FSY\A7]RkD/"*'EcW@;DBNM-@V'(\ARlooBl[cpF<D#"
+<VdLA7]@eDJ=3,Df0V=@<,p%DJs_AEb/d(@qB0nFDi:?DIjr"Cgh3s/0JPCEZeq<@;Tt"ANC8-
+<VdL+<VdL%144#+<VdL+<Ve;A8Pm@3Zp4$3Zp*c$6UH6+<VdL+<XEG/g+_B@V'(\ARlooA7]?^
$6UH6+<VdL+<Y#H+C/4pH[?l\+<u=X@N[0R+C?iGHnHON4Y@j)5UR[C/g,E^I=34\+<VdL+<VeP
/12Pf%144#+<VdL+<VdU%13OO+<VdL+DGm>DJs_AEb0-!ATD?m+CT=P%144#+<VdL+<V+#+<VdL
+<VdL+Co#"AN`(1+?CW!%144#+<VdL+<Ve%67sBlD.7'eA7]9oA7T7`%144#+<VdL+<Ve61*Bk-
+FAGXGp">\+CZHD/g+LU+FGda@Qc=d-U9%%74o^.+FSY\Gq:<c-OgD*+<VdL+<VdL.1HUn$6Uf@
+CK%pCLplrDJs_A@q]F`CNCV/F_u(?F(96)E-*44Df0Z.DKKqB@:s"_DKBnBBlnD=BOPsq/e&-s
$6UH6+<VdL+<Y3,4ZX^&@;BEs-RU#Z+AP6U+CoV3E$/S*C`mq?Eb'56Df-\:@<?/l$6UH6+<VdL
+<WBt+DkP&AKX']3b2hF+AP6U+Cf(r@r!2tF_u(?@:s"_DKBnBCh7$cBl7Q+BOPsq%13OO+=\KV
?rC!'<+$hWDIakt6W6lM?m';p@rcK1FCf]=+EVmJATJu&A7T7^+D,P4+EDUGF<G"0A0=5^@rGmh
/e&-s$6pc?+>GK'/i"P$+A-cmGp"gu/0H]%1,L+%:h=Za@;]XoF<F7q@ps1b+@TgTFD5Z2.1HUn
$6Uf@+A,Et+Du+A+ED%5F_Pl-F!+(&F!+n'FCfJ8G%G]8Bl@l33A*!@/g*/,0JXbbDKKo;A9DBn
A.8kg+<Ve;Bl[cpF<G+*Anc-sFD5Z2F"SS6Df'&.8l%htGAhM4F!,@=G9D$LAKYMtEb/a&+Co%q
Bl7X,Bl@m1/e&-s$6Uf@+CJr&A8c?n+CT.u+CJr&A8c'f+D>2,AKYGnASrW#BOPdkARlp*D]i_%
DIdQp+E1n4D..<nDKH<p+<VdLCi<flCh7Z1Bl8$5De+!#ARlotDBMOo3A*3B+CJr&A8c'l?m'?*
+Dbt6B4Z*+A7]h(Ec65E+A,Et%144#+<Y01@<6K4Ci<flCh7Z?+A$YtDJs_AF(oK1Cj@.5Ci=B+
F!,C?ASrW$Bk)7!Df0!(Bk;?.@;]TuEb0*+G%G_($6UH6+CJnuDe*6,+EV:.+A,Et+DG_8ATDBk
@q?d!De!3lAKYT*Df$V=BOr;q@<6!&E+*j%/g+P:De*d(?k!Gc+<VeIATMs3Eb0;7?tj@oA7-O%
D]j.8AKYGjF(HJ5@<?08+B3#c+Du+A+E1n4D..<nDKI!n:IH=8CghC+%144#+<YK=@ps1bF!)l=
@;9^k/7E:3A7TUf/7E:3A8PajALq8)De*p2DfTD?@;9^kFDl)6F"Ca7De+!4Bl%0+%144#+<Y*5
AKYl/F<G(,@;]^hA0>?,+CJr&A8c?n+CT.u+CJr&A8c'l?nNQ2$6Tcb+<VdL<,WmhEb/[$AKYo3
+ED%*Eb0<*+A,Et+Cf4rF)rI?De!3lATJu>Dfm1>F`VXc%13OO+<VdL+<VdL+Dbt)A0<74ASu("
@;IT3De(4)$4."]%144#+<XWsBlbD,BOPdkAKY].+C\bhCNj3-A0>B#D/`p*Bjtmi+CT.u+EDUB
F!,17+A+#&+C\noDfTD33A*3B%13CN$6Uf@+AH9^Gp#^T6m-S_F*&OG@rc:&FE8RIF(HJ3@;TRd
+Dbt+@;KLr/g+,,AU,DBATD?)@rc-hFCeu6%144#+<YcOE+rfjCi"A>Ci<`mARlp-Bln#28l%ht
-td+5.490f+D#e/@s)m)A1Sj3DIal3BOu'(A7]RgFCetl$6UH6+EVNE@r,^bDBO(@+EV19F<G"4
FD5>q@rucE+B3#gF!,F1FED)7DBO.;Cht53Dfd+GDfTV9Bl5%c+?;&4%144#+<Y*6+Dbt+@;KLr
+CT;%+E1n4D..<nDKI"DDJWm*F!,%=E,95uBln0:+CfG'@<?'k+CT=6FCf<.DfT9,GqKO5+<VdL
<+ohc@UWb^G@>N&+Cf>,E+*j&@VfTu-u*[2E,ol/Bl%?5Bkh]<+Eh=:@N[(6De*s$F*)5:@ps1b
.3K',+<VdLD..-rFCAm$F!,R<BlbD9@<?U&Ec*".DIal,@;^?5FCfN8+EM%5BlJ08+CT@Q%13OO
+<VdL+<VdL+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA9Dd(
F:AQ`%144#+<YB7Cisf@Eaa'$+DGq=+E_a:/g*GrC`l>G6m-S_F*&OG@rc:&FE8R5Eb-A(BleB:
Bju4,ARlotD@Hpq+<Ve@DBO%7AKYB0@:WneDK@IDASu("@;IT3De*p-F`Lu'?m&lgA8c?<%13OO
+=\KV?pdUV5uL`Z6;q6*C2[Wi?m&rfDBND"+E_a:A0>u4+Cf>-FE2;9+Eh=;FD5ArC`l>G6m-DW
C1Ums%144#+<Y]9D/XT+C`m82EbTE(+Dbt)A90@G8T#Yk@<,p%@psFiF!,R<AKZ/-Eag/!@r,^b
EcuA1F'p,-BkM+$%144#+<Y`:Ch7*u+Du==@V'RkA0?#9ATAo0De!3lATKIH<+oue+DGm>E+*d/
Bk):%@<-'uGp$p;CLq=-+DGEs$6UH6+EV:.+E_a:EZf1:@ps1b+DGm>ASlC.GqL4+Gp%0>FED57
B-:SL9LV6F<_l%\?m'Q0+>=pPDBKAq+<VdL-u*[2E,ol/Bl%?5Bkh]<+A,Et+EqO9C`mV6F<GU8
D/XT/+Eh=;FD5ArC`mP4@ps1bF"SS:Bln#2%144#+<Y&Z9LV6F<_l%\?m'N%F<G[D+>=pYAT23h
FCeu*-u<g1A0<74ASu("@;IT3De(4E+Dbt)A9/l;Bl%T.%144#+<YTCE+iZt+A,Et+E(_(ARfh'
/g*H$+Cf>+Ch[s)Df0V=GA2/4+E_a:EZf1:@ps1bF!+n3AKZ,5Ch[ZrCj?Hs+<VdLFD,5.A7]@]
F_l.BBlbCO/e&-o#p9Za#mh^`$6pc?+>GK'/hnL.J<M*FAR]\&@<-W90eb.$1,(I?+=L!'/Ria/
Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Nfj"+Dtb7+CK+u?m'B,FD5Z2+E)41DK?qBBOr;t
DKKT5AKYr7F<G+.@ruF'DIIR2+E1b2BJ(E,BPDMs$6UH6+DGm>F*1u++CQC7Bl.F&@<Q@&B-;)1
/Ria/Bl7L&+A!qt+D#D!@<-BsF)to'+D,P4+Du+>+EV:2DJNs(B+51j+<VeFAftf0+F.O,EcW@3
B5]C3$4R=b+<VdL+<VdL2BZpK+=CT.DIb+;:-pQUDfB9*F!+n-C`mY6+=LZ/DIb1=E+*j%+>"^Q
@;BFq+=LZ/DIb1=E-673$6UH6+<VdL+<WQbDe'tP3[\QZF!,O@F_;h>FD5Q4-Ql/N/g,(OASuQ3
@;Ka&Df-[GB5ho@+E1b2BHSlLD..3kF!)lDE-!HNE-67F+<Vd9$6UH6+<VdL+<YT6E*m<oDe*3<
3Zp=-De't5:-pQUA7]@eDIjr(@;]V$+EM47Ecbf6F<G:8+A,Et+DG_8ATDBk@q?d!De!3lAKW*)
$4R=b.Nfj/ATo8=ATMr9@psFiF!+n/A0>Aq@;]^hF!,RC+CJr&A9;C(FCfK#+EVNED..3k+EV19
FE8RADfTD3E,Tc=@:F%a/e&-s$6pc?+>GK'/heD"+@]pOEckf2Gp"sq+>PW+1a"2;@<6+-+AH?:
@<6*o@:Njk7:^+SBl@l<%13OO+=\LA83p0F?n<F.9LV6B?m&lqA0>8`8Om/2D.-ppD]it;FD5Z2
+Cf>#ATJu&A7T7^/e&-s$6Uf@?t=4tATV<&FCArrF!+m6DIn#7DfBf4Df-\*7ScoL786'H<(0\]
5u^B_+EV:*F<G16Ear[%+EV:.+:SZ#+<VeG@<?0*Bl5&8BOr<'@<6O%EZet.Ch4`'DKKe>FD,5.
E-67FA8,OqBl@ltEd8d=G%GP#$6UH6+DGF1FD,5.E-67FA8,OqBl@ltEd8dAF!+jg76s=;:/"eu
/g+,,AKYhuBl5&9F(HJ4Ado(i+<Ve77ScoL786'H<(0\]5u^B_+DGm>FDi:BATMF)+EV:.+DG_8
ATDZsC`m\*FD,_<Bl5&$;FNl>:JOSd?k!Gc+<Ve;Bk)7!Df0!(Bk;?.FD,*)+D>2,AKYGnASrW-
Dg#]&/g*GlFCfJ8AoD^"Bl7Q+E+*j%F!(o!+<VdLFD,5.A8,OqBl@ltEd8dEF`VXI@V$ZlCi=B+
A0>;uA0>o(DfB9*ARmD&$6Tcb+=\KV;e]cR@psC#Anc'mF!,C5+B(fs/M]1A+D>2)BOu6-@<,p%
DJs_AGB.D>FCf>4A9Dp,DJ(($$6UH6+C\bhCNXS=?uTOaCLgfqDfB9.@<?4%DK@EQ+@^9i+C\bh
CNXS=1bp1qBOr;uBl%?'BlbD)1brfZ@<6*nF"VQZFC5Ob%144-+<WrmDIn#7?t+"i?m'B,FD5Z2
+D>2)+C\nnDBNY1E,9*&ASuU$A0>u4+Cf(r@r!2r@:O(qE$/b,Ch7Ys$6UH6+CSnkBl8!6+EV:.
+D>2)BOu6-F*)>@ARlotDBO%7AKZ&.A7]7ZEZet.Ch54.$4R=b+<VdL+<VdL0fL4aDJUFC/ghba
:-pQU0fL4<+@nds8.>n8$6Uf@+CK5$F*(r#+Du+A+ED%7FDl22F!,F1Ecc#*F_kK,+C\bhCNXT;
+DG_7FCelk+E(j7C3=T>+:SZ#+<VeKBOr<&@<6N5@UWb^F`8rU6#:U\/0JD1@r$4++D,>(ATJu&
Eb-A'BOt[hARlolB45LlF*%iu+<VdLFD,5.BOPsqATJu.DBO%7AKYK$EcP`4E,TW)Bl7Q+F(o/r
@psC#Anc'm+CT.u+EV:.+:SZ#+<VeIATMs3Eb-A-F!+n#DfTr2A0>Su+CT/5+D>2)BOu6-A8`T.
Dfd+=@<?!m/e&.1+<V+#+<VdL+<VdL+ED%7FCZLAA8YgmALATC+<Ve%67sC$ATMs3Eb-A0@<6N5
@UWb^F`7cs+<VdL+<VdL+ED%7FCZLAA8YgmALBPo0d%T667sC$ATMs3Eb-A&@:O(qE$-ki%144#
+<VdL+<VeIATMs(+=C];@;TR'4#&H40fL3t:-pQUEb0<6DfTD3BkM=%EbTE(+C\bhCNXS=BOPsq
ATJ:f+<VdL+<VdL%13OO,9nEU0eP.41,U1?E,oZ/+>bVl1,(I>+=L0-EbTE(+A$H]Bk)7%ASuU2
+@TgTFD5Z2.1HUn$6Uf@?uBP"A7-NtDg*=G@;BFq+CJ`!F(KG9-W3B45tOg;7n"de0jl,4DIakt
A8lU$F<Dqs;aX,J3&N'F0jl,4F!,")AmoguFE7lu+<VdLGA(Q*+CfG'@<?4$B-;)'G9CF1@ruF'
DIIR"ATKI5$4R=b.Nfj"+Dtb7+E1b0@;TRtATAo$83p0F6rcrX?m',kF!+q'ASrW!A7T7^+EVNE
?tsUjE+*d(F"V0AF'pUC<+ohcA7]@]F_l./$6UH6+DGm>0e=GhF`M@BDe<T(GA2/4+>>Dj=(l/_
+>G!I+B(fs/M]1A+D>2)BHV#1+E2@4AncL$A0>u4+EV:.+EMX5Ec`FBAftW,D/]pk+<VdLF(96)
E--.R+B3#c+D,P.Ci=N3DJ()6ATMs7+D,P4+CoV3E$043EbTK7+DG_8AS6$tFEonV$4R=b+<VdL
+<VdL@q]Xk@<6*mD/`ijC2[Wi+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[WnATf\?C3(a3
$4R=b.Nfj"+Dtb7+DkOsEc3(?F^]*#Anbgs+CIc;=\_:k+Cf>#AKYYpF!+q'ASrW!A7T7^+D,P4
+A-cqH$!V<+Du+>AR]RrCND*N:2b5c@W-1#+D,>(ATJ:f+<VdL@ps6t@V$['FDl22A0><%+A,Et
+DkOsEc6"AGA2/43XlE=+<VdL+<Vd9$6UH6+<VdL+<XEG/g,1G@:UKuDffQ"Df9D6@;]TuF*)>@
AISth+<VdL+<VdLBlJ?8@QcapF`_4T+ED%%A0<7;DffQ"Df9DDBlJ?8@ODTl+<VdL+<VdL+>b3[
F`\`RDJsW.@W-1#?YOJ)DIOtT8PiPb6=4/9De*3:BlJ?8@LWYR$6Uf@+B3#c+E2IF+Co1rFD5Z2
@<-W9E+*j%+DGm>DJs_ABl5&8BOr<"ART+\EZek1D/Ej%FE8RCAfs]A6k'JG+<Ve;F_u)=/g*W%
EZeq<@;Tt"AKZ).AKYAqDe*BiG$lG'Bk)7!Df0!(Gp$d/F!+m6E+*j%3XlE=%144#+<VdL+<Vdg
3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R=b+<Ve+BPDN1E+*j%+Eq78+Du+>+E2@4G%kl;F)6+EF(fK9
DD!%@$4R=b.Nfj"+C]J++DG_8Ec5K2@qB0nBl5&:ATDj+Df-[G0eP.41,C@%BOPs)@V'+g+Cf>1
Eb/a&ARmD95p0]LAmoguF:AR"+<VeDATMp$B4W30@<3Q*DI[U*Eb/a&Cj@.EATT&2ART+`DJ()6
D]iFA+>u,9+E2IF+=AO\DfTA9-X\'/@;0P#Eb0;7-rW]-81?/#$6UH6+<VdL%13OO,9nEU0eP.4
1,L+CAR]\&@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.DBMAYBln'-DCH#%%144-+A*b:/hf+)Eb0,s
D.R6#FDi9o+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P+Z_>7+Eq78+Cf(nDJ*Nk+EV:2Et&I!+<Y]9
EHPu9ARlol+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZupDf'H9FCfM9@3B/uDdda%DJ()8ATDj+Df-\8
F_tT!E\7e.%144-+CIT69M%rM<+$hm@<3Q#F_u)/A0?#6+EVNE2Dd$/8S0)jDfm1?AS#BpD/XH+
+EV:*DBLho+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJEZdtM6m-GWFD)eBDfm12Eb-A(DeX*%+EMI<
ATVU"DJ()9Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeqF`VY9A0>u4+Cf(r@r!2rBl7@"Gp$U8D/`p*
BjtdmBlnVC/KenEF)to'+EV:2F!,17+E2@8DfQtDATDj+Df.0:$4R=O$6pc?+>GK&/i#4*8muU[
@<-W91,^[+1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh>+3A*!B-Z^DQF(HJ4Aft;J
9i,+DBQS?8F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+:SZ#
+<Y?+F!,17FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-FE_;-DBMOo3A*!B+CT.u
+E2@8DfQtDATDj+Df0V=De:+a/e&.1+<X9P6m-PmDfTE1+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(
B4Z+)+DG^9A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC8g$,H0Jj4G+<Ve:@;[3.ART*lDerrq
EZeq<FCf?#ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.1a%!_Blmp-+D#e>ASu$iA0>T(FCf)rEcW@F
D]iG&Anc'mF'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(8ge[&@ps6tDJpY<ART*lCi=3(ATAo8BOu$5
+B3#gF!,X;EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2FC6X/$6UH6?tX:o@WPp"@;]Tu?t=4tATV<&
FDi:@Eb0E*DKI"CBOr<'BldrrDIdQtDJ()1Aftu&G;!lNA0>>qDIIR2+Cno&@3B9%+Co1rFD5Z2
@<-'nF"Rn/%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki+EVNEFD,B0+Eh=:F(oQ1+E(j78l%htEb0<'
F<GjIF`JTs:IH=B@<6O%EZet.Ch4_uGrcBA%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%13OO
+<VdL+<VdL:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+Gp%-=B5)F/ATD?m+Co1rFD5Z2@<-'nF!+n/
A0>r,F`\`u+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E+E(d5-RU>cAp890FCcS0E+*j%+=DVHA7TUr
F"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(+<VdL+<VdL%144#+<VdL+<XEG/g,1GF*(i2
F<F0u@;]TuATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("
@;IT3De(M9D..L-ATBD;C1\h&$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3
De(M9De(J7C2PC.$4R=b+<VdL+<Ve%67sC$ASc9nA0>u-AKZ#)B5)F/ATD?m+Co1rFD5Z2@<-'n
F!,F1H"h//+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U+EVNE@;^?5@VK^gEd8dADI[U%E+*j&@VKXm
FEo!GATMp$B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$6UH6+<VdL+>=s"0JG4(4DJhD
FD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJFBkh]:%13OO+<VdL+<VdL:-pQUFDi:E
F(HJ4Ch+Y:@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'nF!,aHFWbmBCht5-@<Q3)FDi:CATT&:BOu$'
%144#+<VdL+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,ATAo:ATDj+Df-\9Afs\g@;]TuFD,6'+ED%+
BleB-EZf(6+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%ATT&*Bk)7!Df0!(Gp$!R5t"LD9N`KPDBNA*
+E)(,ATAo.%144#+<VdL+<YT5+=D)DA7TCaF=.M)+<VdL+<VdLA8lU$F<Dr/76s=;:/"e<%13OO
+<VdL+<VdL:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t8g&.cB5)F/ATAn&$6UH6+<VdL+ED%+
A0<7<Ch.'j@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<BlbX2$4R=b+<XET<(/hjBkAK5Dfm12Eb-A3
DJXS@Bl8$(Eb0<6ARlotDBNtBDJj0+B-:],EcP`/F<F19/hf+)@;]TuDIn$'EX`?u+<Yi=EcYr5
DK?q=Afs\u+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.D@;]Tu
Eb0'*@:TfS+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k+A*b:/hf+)A8,OqBl@ltEbT*+/g+,,AKXT@
6m->TDKTB(+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0%144#+DG^9FD,5..TCP2DJ=!$+A,Et+@L?h
E$/(hEbTK7+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b.Nh>+3A*!B-Z^D?BOPdkATJu9D]j.8AKZ,:
AKYo'+EV:.+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!@<-W9?r03g75A6nAoD^"ARlp)Df'&.%144#
+CSeqF`VYAASuU2+EVNE?ugL5?nNR%DJ<U!A7ZlnBOPpi@ru:&F!+n3AKZ);Ec,H!+E(k(+EqOA
BHU]'G]e+?3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78F(Jd#@q]Fp/g+,,AKZ&*FED57B-;8/Dfol,
+C\n)Eb0<6DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7F<F-tGAhV?A.8kg+<Y*'G%l#/+Cf(r@r#dr
B-:f)EZek4Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(+B<;n@rGmh+DkP4+Dbb/BlkIi:IHRO+CS_n
Ch\!:+:SZ#+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#D.RU,F!+q7F<F1'F!+J#Bk)'lAKZ&:E,]`9
F<G7*F!+n-G@>c<+E1b0FD50"/e&.1+<V+#+=\LA2'?gJ+=AOE+CSeqF`VY9A0>u4+EMIAF<GU8
B5)F/ATD?m+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`AU#>/EcQ)=F!)lBEcQ)=F!,17+EV:.+ED%+
AU#>/G]7\7F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&@;]Tu@r,RoBkD'jA3(h\.X,oODJ(=>Ed2XJ
I4cXQDJUFC-OgD*+<XL$BlA#78l%htG%G]8Bl@m1+DbV2+ED%+AU#>/EcQ)=F!,+6+EVNEFD,5.
FDl+@Ch7d$C`mh?@;mh.$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u
@<-'jDKI!iA8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+G
AKYAqDe(J>A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2
GA2/4+=CMD+DG^9Eb0<7Cij_N+:SYe$6Uf@+@KpaARfg)@!d6.+>,9!+CKVG?m&ukAnc-sFD5Z2
F!,@=G9CsLE,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l+:SZ#%144-+<X*`BlkJ-Df'?"DIdf2A8-+(
CghU#A0>K&EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&Dg*=5Ec6/CATAo4Df?hAE-!W@$4R=e
,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX
+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa<+T/S@UX=hA0>E$@s)X"DKK</
Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:
Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki)
:L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1
+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)j
Dfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)
+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r
6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An
1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgT
FD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6
+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.
EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/%144-+<W(RATVC(
Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-
A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdL
F(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:SYe$6Uf@+CJVg
A8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2FEMOT
Bkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n0J5%%/KdGm@qBLdATAnR
/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8
+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!ARloU:IH=;ART\'
Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=
De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(
@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8
@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(n
DJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+
/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpdF(HJ+Bm=31
+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-+CIo0=AD.V
7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3
Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%
DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4D."n;?ug@2
?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*
AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,ARlo8
+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0N)IpF_kK,
,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et
+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3@ruWuATAnJ
1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"
A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,
+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%
F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;
AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=
+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,
AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!
8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU
0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8
=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7
%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l<
/KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7
+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0
+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@u
A7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08
?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E9
04]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$
B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4
Ch[cuF!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&I!
+:SZ#+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL
+<V+#+<YW>Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqB
AoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?
G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)
D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+
Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)
D.RU,F"SRX%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL
-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU
%144#%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE
?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+
Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4
$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL
+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp
-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc+<V+#+<Ve+BOr<*Eb0E.
Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2
%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g)8Z%144#
+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9
A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7
Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;
+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(t
FDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgL
FCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;
@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=
3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8
E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn
$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A
%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79Rk
A.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1
A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%
0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5
+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft
+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI
1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C
-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL
+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^
F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@
+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i
?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4
+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9
$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(E
F!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:
DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5
BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(
@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.D
GA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5
CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#
+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='
+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6
F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJ
F=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(q
E$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp
+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG
/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#
0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO
+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044
+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e
%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#
+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e
,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"
+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71
?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%
+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'
@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5
BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUB
F!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,
+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)
%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm
3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.
FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBm
Ci<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*
@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL
+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,f
ATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji
+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D
+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5
BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1r
FD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'
@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$
Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2
@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC
+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj
/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@lt
Ed8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?
F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5
BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9
Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.
BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=
DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4
$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlok
C2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$
A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(
+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1
G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dn
ATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+
A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL
+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u
+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4
D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'
G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2
@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP
$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:Wpl
AoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^
B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<
+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o
@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*
D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5
AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#
ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNE
Ecl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq
+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(
F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r
+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.
?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(
GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'
ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![A
Ci<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/
C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z
+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu
0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_
+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4
@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.
$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKq
F'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-
+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiu
ASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnA
AoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8
+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=)
,9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.
+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4
ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-
DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*
F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%
0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/
Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_
FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et
+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2
F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%
+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9
$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#
+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,
Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#
;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL
%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6
+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q
%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+
$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QT
Ble59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9
FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*
+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuul
A8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT
+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[P
Df0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;k
A7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4
CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@
FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=
Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I
%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.
D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!
ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9
De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUj
Ch\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]Tu
FD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-
Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO
+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE
+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb
+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.
+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--o
Dg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7Es
F_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-
+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ
%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`
/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT5
6WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXC
Eb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b
.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34
$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlol
F<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(C
GAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBp
FD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!
Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5
FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<
AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.
FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0
Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'
DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku
@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1
FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kq
D..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:Wne
DCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"
D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=
+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1n
FCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#
$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE
+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!
?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJr
De(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu
+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UE
A79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GD
Bkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSM
De`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*
?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$
DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b
%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u
+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#
+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;
1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&
A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$
DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@
<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7
Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.L
BOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.I
BPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE
?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm
3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#
E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@
AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC
/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e
,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/io
Eb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J+
+>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.Ohu
DIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6
%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co
+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(
BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"
@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,
@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u
+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i
1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\
DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU
@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"
DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.
ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1
+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8
Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o
06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#
BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2
@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%ht
GA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5S
A8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI
%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/
+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYq
BlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU
0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'
@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6
%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(
Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th
+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(
Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.
%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(
H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1
Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=
Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y
$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8p
De(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQk
DdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y
@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1
F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];
$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&
,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dn
ATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pm
BfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'
DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?
Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pm
BfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3
+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU
0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'
@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"
+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@
@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4
ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3
D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm
+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(
F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,u
ATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:
>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq
$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&
+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSek
ARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*
/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=)
,9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%
De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4
E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA
%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO
0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?
+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRK
ARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3r
Ci"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$
A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.
ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd
@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"
DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E
+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$>=-pFDl2FC2[WnDdtO]B4Ysl
Ea`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]%14=),9S]n0eP7)/KcHcBlGLDF`)52Ch7$rARl5W%144-+@L?hE$043EbTK7
+D>2)CER,#ARfKuDJsW.A0>T(+CK%pCLplrF(Jj'Bl@lA%13OO,9nEU0eP151*A.k8p+rq+>G](
+>PW+1a"2CATDWrDIm^-+Dbt+@;KKtARoLsBl@l<%13OO+=\L.Bl7j0+D#(tFE8R5DIakuA7TCr
Bl@m1/g+,,AKYf-@psInDf-\9AftJrDe(J>A7f3l9OUn3=:GT[+<YB>+Du+A+CehrCh7-"Dfp.S
+Auc_ATD@"@qB^(FDi9o-Z^D>AS,k$AKWuc0JXba@<Q3)@V'+g%144#+ED%1Dg#]&/g*b^6m-Ac
G9Cp;EHPu9ATJtd+?;&.1*CLU+DbJ.ATBC4$4R=e,9n<c/hnt5+>"^*AR]\&@<-W90eb.$1,(I?
+=L!'/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Ni,;A7-O$ARfgrDf-\/A8--sA0>K&
EZf72G9C9O+E(du+E)4@Bl@lA%13OO,9nEU0eP150H_qi7V-%LF^]<9+>k\m1,(I?+=KchF(fhA
9k-_&F(f/o@q?cOA8-."Df.!5$4R=b.NhJtG9C=5E+NotBm:b=DBNtBDJj0+B-9fB6m-S_F*)IG
@:Wn[A1e;u%144-+AZHfDes!,AKXT'+D5_'E+irq+ED%1Dg#]&/e&-s$6Uf@6YKnGB4Z-,FDi:0
@W$!i/0J>@ATMs(?n<F.E+*6lA7-O%D]iq9FCcS:BOr;pA7TCrBl@ku$6UH6@;]TuF`V+:De:+j
83ng_2)ZRd@:O(qE$049A7]7ZEZet.Ch7Z?%13OO+=\LA83p0F?n<F.9LV6B?m&lqA0>8`8Om/2
D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^+EVNEFCAWpAM+E!%144-+AHQfDfQt7D/aN6G%GN%DKKqB
FDi:@F`);D@psInDf-[L+EV:.+EVmJD]ie/BOPEoBlbD8DJ*m%DJ(R2$4R=e,9n<c/hen52'>2(
EbT>41b9b)0JYF,-rY)*Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\L5BOr<)Eb&a%+E(j7
DfBf4Df-\-De*E%FCAWpATJu.DBNA,E+NotBm:ah/g+h9Et&I!+<Y-)ASrW#BOPdkARmD9<+ohc
Cgh?sATAo8@:F%a+>GVoBlbD7Dg*=BDBN@1F(oN)Ch4%_+<VeG@:s-oFDi:<ARTan+EML1@q?cp
DfQt4F`_bHAKYK$A7]g7%13OO+=\L4Df'&..WoW>De!p,ASuU$A1A^3De*F#+D>2,AKYGnASrW!
A7T7^+EVNEFCAWpAKW]_/e&-s$6Uf@<+ohcASuU1Gp$^;EZeb#E-#T4?m',kF!+q'ASrW!A867.
FCeu*FDi:CBQ&);%144#+EV:.+Dtb7+CI`+;b0;V9i,4?E+*cqD.Rg#E\7e.%14=),9S]n0J5+:
+>"^.@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+@C'aE,TW*DKI!U
1*C:K+CJr.DfTB0?m'?*G9CR;Ch.T0FD,5.8g%M%+Z_>7?m'N9F*(u1+EMXFBl7Q9+B3#gEt&I!
+<Y?/CiFG<8l%htA7]1c+EqOABHVD1AKYGrDIIR2+DG_'Df'H%FD52uCh\!:+C\o(G@b?'+A*b:
/hf+0F!+n/A0>GlEboH$EX`?u+<X9(F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF"Rn/%144-
+@C'fEb/a&+CJVeG$lG0Df/uo+CT;'F_t]-F<E.XDf0B:+EV%-ATJu(BOPpi@ru:&+Dbb5FE9&D
$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!iA8-."Df.!5
$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=b
.Nfj%Bl[cpF<G+*Anc-sFD5Z2+CT5.ASu$mGT^F*A7]:(%13OO+=\KVD.-pM;_LgYDKU1HE+*j%
F!+n%A7]9oFDi:3Df00$B6A6'FD5Z2+EM+(FD5Z2/e&-s$6pc?+>GK&/i"P$+AQiuASkmfEZd@n
+>PW+0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b+=\L/ATo7_
D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1
GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0
+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%ht
A7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)
DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF
1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=b+=\L/ATo7hF`;VJATAo0
@:C?uA7crmA7T7^+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8*$%144m
E+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>GK&/hnJ#+AH9b
@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b+=\KV<DlM3+DG^9?tsUj
/oY?5?m'<)A8,XiARlp*D]j1DAKXNC<)?L9Bl8!6ART*lDe:+_<)c[H%13OO+<W-V;IsHOEb0,u
ATJu9D]hY<9H[hY@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6ART+%%13OO,9nEU0eP.40H_qi6tKk>
D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b+=\LA@V97o?m&oe@r$4+
+D58-+EM+(FD5Z2+CSekARmD9%13OO+<W-V+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<+DbIqF!+n%
A7]9o/Kf+GAKZ).AKYMtEb/a&DfU+4$4R=b+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;
C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+<W-V
G%G]8Bl@l3@WcO,+D,P4+A*b:/hf"&@V'Xi+E1b2@q[J($4R=e,9n<b/ibOE3B/-5+@]pOEckf2
Gp"gu/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:SYe
$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b+=\LAD/O/t+EM+(FD5Z2+CSekARmD&
$4R=e,9n<b/ibOE3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b+=\LT
FCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+:IH=;Derrq
EcW@3DIak^:IH=A@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9/hf4,8l8P?
%13OO+<W-VDIn#7@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+A8-9@%13OO
%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNEDIn#78ono_
FE_/6AKXKWF@^O`+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*
2[p*'$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6
+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?
/KdbrEarc*1,(7%1,(F@%13OO+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI
3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO
,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"
+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-
Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLs
Et&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/
B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdk
ATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*
DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#
.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*
1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p
9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#
%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC
+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>
+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-
Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE
1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#
D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/
@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:
Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:
FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)
/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWu
ATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FD
F)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(
FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,
+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,
ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!
6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq
+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9
BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;
FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T
-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%
@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/
Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.
An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#
+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu
@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1
%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)
6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrF/hnt7+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA1%fn
:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#
$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dk
ATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/
Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJG
G]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7
E,K:t$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKi
Cggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a
$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R
8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172q
Deq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!
FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7
:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%ht
BlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr
+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</
Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m
+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]
6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+C
ARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7
Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$
Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EPi$7QDkD..<rAn?%*
C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-X
F_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP151E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*Bs
@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!
0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eqCh.6t
B1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm:IIcl
FE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm:IJ-"
F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5%17&b
An5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$
/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-
FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,
ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<
Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*
$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$
Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y
:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8
A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>
$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$
A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl]
;F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP15
1E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<
+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9B
Et&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%
9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!
3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08
+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuV
De*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4
AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08
+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%ht
A8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%
G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@
%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1r
FD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:
%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWs
BlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6t
FCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!
@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8
@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q
+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUr
F"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7
AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W_*$7QDkF`)52B5)F/ATDm(F*)IY0ht%f.WoWLAS5^uFCfK7ATMs7+EK+d
+E_RBAS5^uFCfJ8FCfN8+Co1rFD5Z2@<-'nF"Rn/%14m6Eb/lo-9`P#>p(A@+=f&t5U\"%ATMs.
De(4B74p#94t.V&/g,(C+=AN                                                  ~>
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
H:gt$F`_>8FCfK)@:Njk8l%iS:JXY_<_Yt)8l%iU9gg+"9/&(T+Au3<<$5pcFCAX"+DPh*Ch\!&
Eaa'$<_Yt)C2[X!Blmp,@<?'fBOPsqA79RkF`M:@D..3k+E(d5Eb/fmA7f9nGB@q<G]Y;^/1<VC
4"akp+=A:BASc""E)UUlCLo1R+D58-Ed1N"Deio<0Hb"M;f-GgAM>e\BP_X*Cf>1hCLo1R+DPh*
BOu"!;f-GgAM>e\ChH[`Deio<0Hb1M@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',ZCi<`mFCfN8
0eb:lBk)7!Df0!(Gp$pA@qTh$;f-GgAM>e\D..3k87?RQ@q]XVD/X3$0JFVd@;BFF@<6*lBPUOg
Eb0<50JFVd@;BFN@<?1)ATMrI0d(=ACLp=NFD,c-F*')k+Dkq9;f-GgAM>e\DJs*2E)UUlCLo1R
+Du+>B6%riD/X3$0JFVeFAm$pCLo1R+DuC%D/X3$0JFVfA5d>`CLo1R+ED%:Dc:LkCLo1R+ED<t
D/X3$0JFViFECGuDeio<0HbLZATLdeDeio<0IJ;#-p0UR/mg=U-Qm/BA0>W*A8PajAKY`+A8c?5
.4cl04?G0&0d%hdC2[Wl@<6-mFCfN8F!,49A8lR#E+*cuFCfN8F!,49A92U+CLqU!F*)IGC2[X(
FE1r6F*(u7FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<
:et"h?YXLiCh\!&Eaa'$+B2-):L?^i6sjeA+D>J1FDl2FC2[W*BPDO0DfU,<De*Bs@j#VsDJ<]o
F*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ'F`)52B5)F/ATDm(F*)IN
.4cl01*A;1,Vh&/1b^jD0J54:1c@'G3ArWM+>PW+1b^jC2_HpC2).*N1bpsE+>PW+1b^jC2_HpC
2E3BI1bg[=+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG1c-mE3&WTO+>PW+1b^jC2_HmG
1c-mE3&WTO+>PW+1b^jC2_HmG1c-p@2DR'G+>PW+1b^jC2_HmG1c-mF1,:U@+>PW+1b^jC2_HpC
3&ruS2)@$J+>PW+1b^jD0J54:1,(R?1c73O+>PW+2)$jB0J57<0fM$M2E*HL+>PW+1b^mD2_HpI
2Dd*C3B&fN+>PW+1b^mD2_HpI2Dd*D1G^dG+>PW+1b^jC2_Hp@2)@3H3AWEN+>PW+2)$d>2D-mB
2)I*H0KCpI+>PW+2)$jB0J57<0fCmJ0JYRB+>PW+2)$jA3A*0D3&WTM1cIBL+>PW+1b^jD0J54:
2)$sD2)[0K+>PW+1b^jC2_HpC2).*N1bpsE+>PW+1b^jC2_HpC2E3BI1bg[=+>PW+2)$jB0J57A
0K1sF3ANHJ+>PW+2)$jB0J57A0K1sF3ANHJ+>PW+2)$jB0J57A0K1sF3ANHJ+>PW+2)$jB0J57A
0K1sI2)[?M+>PW+2)$jB0J57A0K1sG0eb:<+>PW+1b^jC2_HpC3&ruS2)@$J+>PW+1b^jD0J54:
1,(R?1c73O+>PW+2)$jB0J57<0fM$M2E*HL+>PW+2)$gB0eP:A3A<EK1GgpE+>PW+2)$gB0eP:A
3A<EK2_d3N+>PW+1b^jC3A*0F2_m9L0etR.1,(I@0JY=@/i5C>2`EZO3&NZ<1,(I@0JkO=/iGOA
1c@'E2E)a60JYL>1bpa;2E!6H2`W`S1GgO3-p07-1,L730JYI=2_m<E1H@6J1Gh$H1GU(.0JYI=
3&!0A2)dKL1GLUE0f1".0JYI=2_m?F2)@'F2`3KM3&r*:0JYI=3&!0A2)$pG2E*WO3&r*:0JYI=
2_m<E1H.3O3B/]J0Jst.0JYI=3&!0A2)I!C3&`NF0KC720JYI=2_m<E1H@3G2)I<M0esk,0JYI=
2_m<E1b^gJ3&ioP0JXb+0JYI=2_d9E2)[6H0f_'K2]sk01,L[D1,ggB1,LmD2Dd0E2'=Y.1,L[D
0fL^C1c%*F3&<?J0d&5*1,L[D0fUdC3&ruT0KD!N+>PW+1b^jD0J5.>3&ETK3&W`S+>PW+1b^jD
0J5.?2)R'J2E!BK+>PW+1b^mC1+kC?3&!3J2`*EK+>PW+1b^jC3A*-G3&<9C0fV'O+>PW+1b^jD
3%d'C2)-sJ1,q6K+>PW+1b^jD3A*-D3&ioQ2)R'H+>PW+1b^jD3%d'B1G_$M1,UsE+>PW+2)$d>
2_HpD1Gq0N2E!BO+>PW+1b^jD2(g^A1,psG3AriU+>PW+1b^jD3%d$H3AE<G2E!QO+>PW+1b^jD
3%d$F2`NTN3&W`=1,(I?0K1aF/i5@A3&rZQ2_m961,(I?0K1aG/i5:C2)@0I1,q$31,(I?0K:aC
/iGC=3&W`M2)I$11,(I?0K1aH/i>FA1H.0L1cRK<1,(I?0K:aC/i>CC1GUmF3&ET;1,(I?0K1aG
/i,FG1GUjD2D[-31,(I?0K:aC/i>LA1,:[F0ebL.1,(I?0K1aG/i57B0K(pG1,(^21,(I?0K1aG
/i57A1GUjE1bq!41,(I?0K1^G/i>OI2`WlS3&Vm70JYI=2_m<E1c$g?3AW?F1GL"-0JYI=2_d6D
2E!?L0K(gF1,U100JYI=2_d9E2*!KQ0fC^B0JXb+0JYI=2_m'>1H%3L3&!<M3&Vm70JYI=2_m'>
1H.0K0KD$L1c-=10JYI=3&!0A2)%$L1,q6Q3B83;0JYI=2_d<F2).*G3AifP2)HF20JYI=2_m?F
2)6pC2`<QP2`Dj70JYI=2_mBG1cI9G2)I-G0fL410JYI=2_m?F2)$pB1H%$I2_uR30JYL>1,(X>
1c.!G3ArcR1cQU50JYI=2_m6C1cI<K1H@-C1cZ[60JYI=2_m?F1cRBP2`<WN3&i$90JYI=2_m?F
1c@?N0K1^E1H$@20JYI=2_m9D1cI9N1H79Q1FXk'4>J$8,Vh&/1b^jC2_Hp@3AWEL2`*6J+>PW+
2)$jA3A*0E0JkU?1c7!I+>PW+1b^jC2_HmG2)R0H3AiTK+>PW+2)$jA3A*0E0JYC?1GLgK+>PW+
2)$jB0J57@2)@0F2`!-J+>PW+1b^jC2_HmG2)R0H3AiTK.4cl01*AD!1,(I?0K1a@/i,FD2)mBO
1bpm11,(I?0K1^G/i>XI1c[NP2_[361,(I?0K1^F/iGOC1,:gJ3B&c;1,(I?0K1^G/i>UK3B8lM
2D?m/1,(I?0K1a@/i,FD2)mBO1bpm11,(I?0K1a@/i,CF2)R?Q1GLa01,(I?0K:aC/i>UB1,UdF
1Gh$51,(I?0K1^G/i>UK3B8lM2D?m8/1<V9+>GPq1,(I?0K1^F/i,ID1bg[B1,Cd11,(I?0K1^F
/i,ID1bg[E3Ar!80JYI=3&*?E1c[HL3&iiQ3ADX30JYI=2_d6D1b^XC0fV*J3A_j60JYI=2_d6D
2E!NP1,q6Q3&Da50JYI=2_d9E2*!ZQ2E*KR1,U100JYI=2_d6D1H73J0K(mK1c?I30JYI=2_d6D
1H73J0K1aB1,C%.0JYI=2_d6D1H73J0K1[B2_lL20JYI=2_d<F2)70H2)@$D0KC720JYL>1bpa;
2E!6J3&<EM2DlU40JYL>1bpa;2E!6J3&<QL1E\G,1,UaA1GLL=2`WQO1G^jE1E\G,1,L^?0KCaD
1H%0P2_[3G2]sk01,UaB0f^jD2)-mH2`ETM1E\G,1,L[D0fUdC3B8lR2`3TN2'=Y.1,UaB1,(==
2D@'L0KCmG1E\G,1,UaB1,(==2D@'L0ek@91a"P-1,UaB1,(==2D@'L0ek@91a"P-1,L[D0f^jD
1-%'H1G^d?3@QL-4>838-p014/1<V7.4cl00I\P80E                                ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
